/*********************************************************************
**        File : action_launchproc.c
** Description : handling fonctions for lauch process action
**      Author : Alain BOUTE
**     Created : June 9 2003
*********************************************************************/

#include "eva.h"

int FactureAEMO(EVA_context *cntxt, unsigned long i_ctrl);
int EcheancierAEMO(EVA_context *cntxt, unsigned long i_ctrl);
int FactureTPS(EVA_context *cntxt, unsigned long i_ctrl);
int EcheancierTPS(EVA_context *cntxt, unsigned long i_ctrl);
int PrepareStageClasse(EVA_context *cntxt, unsigned long i_ctrl);
int ReleveMensuel(EVA_context *cntxt, unsigned long i_ctrl);


/*********************************************************************
** Function : office_launchproc
** Description : lauch an external office program
*********************************************************************/
#define ERR_FUNCTION "office_launchproc"
#define ERR_CLEANUP	
int office_launchproc(			/* return : 0 on success, other on error */
	EVA_context *cntxt,			/* in/out : execution context data */
	char *proctyp,				/* in : office program to lanch (_EVA_EXCEL/_EVA_WORD/_EVA_ACCESS) */
	char *procname				/* in : office template to transfer to current directory & open */
){
	struct stat fs = {0};
	char exepath[1024] = {0};
	char filename[256] = {0};
	char cmd[2048] = {0};

	/* Prepare executable & file path */
	snprintf(add_sz_str(exepath),  "%s\\Office\\%s.EXE", dyntab_val(&cntxt->cnf_server, 0, 0), 
												!strcmp(proctyp, "_EVA_EXCEL") ? "EXCEL" : 
												!strcmp(proctyp, "_EVA_WORD") ? "WINWORD" : "MSACCESS");
	snprintf(add_sz_str(filename), "%s..\\templates\\%s", cntxt->path, procname);
	if(stat(exepath, &fs)) RETURN_ERROR("Impossible de lancer le traitement", ERR_PUT_TXT("\nFichier programme non trouvé : ", exepath, 0));
	if(stat(filename, &fs)) RETURN_ERROR("Impossible de lancer le traitement", ERR_PUT_TXT("\nFichier modèle non trouvé : ", procname, 0));

	/* Copy template & launch office program */
	snprintf(add_sz_str(cmd), "COPY %s . >exe.txt 2>exeerr.txt", filename);
	if(system(cmd) == -1 || stat(filename, &fs))
		RETURN_ERROR("Erreur la préparation du traitement (copie procédure)", NULL);
	snprintf(cmd, sizeof(cmd)-1, "call \"%s\" \"%s\" >exe.txt 2>exeerr.txt", exepath, procname);
	if(system(cmd) == -1 || stat("exe.txt", &fs) || stat("exeerr.txt", &fs) || fs.st_size > 0)
		RETURN_ERROR("Erreur lors de l'appel du traitement", { ERR_PUT_FILE("\nexe : ", "exe.txt"); ERR_PUT_FILE("\nexeerr : ", "exeerr.txt"); });
	remove("exe.txt");
	remove("exeerr.txt");

	RETURN_OK_CLEANUP;
}
#undef ERR_FUNCTION
#undef ERR_CLEANUP

/*********************************************************************
** Function : proc_output_params
** Description : compute & output parameters for external processing
*********************************************************************/
#define ERR_FUNCTION "proc_output_params"
#define ERR_CLEANUP	DYNTAB_FREE(symbol); \
					DYNTAB_FREE(vartype); \
					DYNTAB_FREE(varval); \
					DYNTAB_FREE(objtype); \
					DYNTAB_FREE(listobj); \
					DYNTAB_FREE(fieldexpr); \
					DYNTAB_FREE(inputobj); \
					DYNTAB_FREE(calcobj); \
					DYNTAB_FREE(dataobj); \
					DYNTAB_FREE(tableobj); \
					DYNTAB_FREE(valmult); \
					DYNTAB_FREE(field); \
					DYNTAB_FREE(format); \
					DYNTAB_FREE(obj); \
					DYNTAB_FREE(data); \
					M_FREE(buf)
int proc_output_params(				/* return : 0 on success, other on error */
	EVA_context *cntxt,				/* in/out : execution context data */
	unsigned long i_ctrl,			/* in : control index in cntxt->form->ctrl */
	FILE *f							/* in : output file stream */
){
	EVA_form *form = cntxt->form;
	EVA_ctrl *ctrl = form->ctrl + i_ctrl;
	DynTable symbol = { 0 };
	DynTable vartype = { 0 };
	DynTable varval = { 0 };
	DynTable objtype = { 0 };
	DynTable listobj = { 0 };
	DynTable fieldexpr = { 0 };
	DynTable inputobj = { 0 };
	DynTable calcobj = { 0 };
	DynTable dataobj = { 0 };
	DynTable tableobj = { 0 };
	DynTable valmult = { 0 };
	DynTable field = { 0 };
	DynTable format = { 0 };
	DynTable obj = { 0 };
	DynTable data = { 0 };
	DynBuffer *buf = NULL;
	unsigned long i, j;

	/* Read params definition */
	CTRL_READ_ATTR_TAB(symbol, SYMBOL);
	CTRL_READ_ATTR_TAB(vartype, VAR_TYPE);
	CTRL_READ_ATTR_TAB(varval, VAR_VALUE);
	CTRL_READ_ATTR_TAB(objtype, VAR_OBJTYPE);
	CTRL_READ_ATTR_TAB(listobj, VAR_LISTOBJ);
	CTRL_READ_ATTR_TAB(fieldexpr, VAR_FIELDEXPR);
	CTRL_READ_ATTR_TAB(inputobj, INPUTOBJ);
	CTRL_READ_ATTR_TAB(calcobj, CALCOBJ);
	CTRL_READ_ATTR_TAB(dataobj, DATAOBJ);
	CTRL_READ_ATTR_TAB(tableobj, TABLEOBJ);
	CTRL_READ_ATTR_TAB(valmult, VAL_MULTIPLE);

	/* Output parameters in a separate table */
	fprintf(f, "\n");
	for(i = 0; i < vartype.nbrows; i++) 
	{
		/* Handle parameter type */
		char *typ = dyntab_val(&vartype, i, 0);
		fprintf(f, "%s\t%s\t", dyntab_val(&symbol, i, 0), typ + 5);

		/* Constant value : output value */
		if(!strcmp(typ, "_EVA_VALUE"))
			fprintf(f, "%s", dyntab_val(&varval, i, 0));

		/* Field value or SQL expression : read & handle multiple values */
		else if(!strcmp(typ, "_EVA_FIELDVAL") || !strcmp(typ, "_EVA_SQLEXPR"))
		{
			int b_date = 0, b_num = 0;
			char *vmult = dyntab_val(&valmult, i, 0);
			char *objtyp = dyntab_val(&objtype, i, 0);
			if(!*objtyp) objtyp = "_EVA_CURRENTOBJ";

			/* Read source object, storage field & field values */
			DYNTAB_SET_CELL(&obj, 0, 0, &listobj, i, 0);
			DYNTAB_FREE(field);
			DYNTAB_FREE(format);
			if(!strcmp(typ, "_EVA_FIELDVAL"))
			{
				unsigned long idobj = DYNTAB_TOULRC(&inputobj, i, 0);
				if(qry_obj_field(cntxt, &field, idobj, "_EVA_FIELD")) STACK_ERROR;
				if(qry_obj_field(cntxt, &data, idobj, "_EVA_TYPE")) STACK_ERROR;
				if(qry_obj_field(cntxt, &format, idobj, "_EVA_FORMAT")) STACK_ERROR;
				if(!dyntab_txt_cmp(add_sz_str("_EVA_DATE"), &data, 0, 0)) b_date = 1;
				else if(!dyntab_txt_cmp(add_sz_str("_EVA_NUMBER"), &data, 0, 0)) b_num = 1;
			}
			else
				DYNTAB_SET_CELL(&field, 0, 0, &fieldexpr, i, 0);
			if(form_eval_valtype(cntxt, &data, objtyp, &obj, &field)) STACK_ERROR;

			/* Handle multiple values */
			for(j = 0; j < data.nbrows; j++)
			{
				DynTableCell *c = dyntab_cell(&data, j, 0);
				if(buf) buf->cnt = 0;
				if(b_date)
				{
					char date[64];
					datetxt_to_format(cntxt, date, c->txt, dyntab_val(&format, 0, 0));
					DYNBUF_ADD(&buf, date, 0, NO_CONV);
				}
				else if(b_num)
				{
					DYNBUF_ADD(&buf, number_to_format(c->txt, dyntab_val(&format, 0, 0)), 0, NO_CONV);
				}
				else
					DYNBUF_ADD_CELLP(&buf, c, EXPORT_TABRC);
				if(!strcmp(vmult, "_EVA_LINES"))
					fprintf(f, "%s%s", j ? "<RC>" : "", buf->data);
				if(!strcmp(vmult, "_EVA_COMMA"))
					fprintf(f, "%s'%s'", j ? ", " : "", buf->data);
				else
					fprintf(f, "%s%s\t%lu\t%lu", j ? "\n\t\t" : "", buf->data, c->Num, c->Line);
			}
		}

		/* Calc-ed value : read control, evaluate & output values */
		else if(!strcmp(typ, "_EVA_CALC"))
		{
			EVA_ctrl *ctl = form->ctrl + form->nb_ctrl;
			if(qry_obj_field(cntxt, &ctl->attr, DYNTAB_TOULRC(&calcobj, i, 0), NULL)) STACK_ERROR;
			if(ctrl_output_exprval(cntxt, ctl, 2)) STACK_ERROR;
			for(j = 0; j < ctl->val.nbrows; j++)
			{
				DynTableCell *c = dyntab_cell(&ctl->val, j, 0);
				fprintf(f, "%s%s\t%lu\t%lu", j ? "\n\t\t" : "", (c + 1)->txt, c->Num, c->Line);
			}
			form_free_ctrl(cntxt, form->nb_ctrl);
		}

		/* List of values : output objects ids */
		else if(!strcmp(typ, "_EVA_LISTOBJ"))
		{
			for(j = 0; j < listobj.nbcols; j++)
			{
				DynTableCell *c = dyntab_cell(&listobj, i, j);
				if(!c->txt) continue;
				fprintf(f, "%s%s\t%lu\t%lu", j ? "\n\t\t" : "", c->txt, c->Num, c->Line);
			}
		}
		fprintf(f, "\n");
	}

	RETURN_OK_CLEANUP;
}
#undef ERR_FUNCTION
#undef ERR_CLEANUP

/*********************************************************************
** Function : action_launchproc
** Description : button click handler for OPENFORM
*********************************************************************/
#define ERR_FUNCTION "action_launchproc"
#define ERR_CLEANUP	DYNTAB_FREE(res); \
					DYNTAB_FREE(data); \
					DYNTAB_FREE(id_obj); \
					DYNTAB_FREE(id_form); \
					M_FREE(msg); \
					if(f) fclose(f); f = NULL
int action_launchproc(			/* return : 0 on success, other on error */
	EVA_context *cntxt,				/* in/out : execution context data */
	unsigned long i_ctrl			/* in : control index in cntxt->form->ctrl */
){
	EVA_form *form = cntxt->form;
	EVA_ctrl *ctrl = form->ctrl + i_ctrl;
	char cmd[2048] = {0};
	char procid[32] = {0};
	char filename[256] = {0};
	DynTable res = { 0 };
	DynTable data = { 0 };
	DynTable id_obj = { 0 };
	DynTable id_form = { 0 };
	DynBuffer *msg = NULL;
	FILE *f = NULL;
	size_t sz;
	char *ext, *bname;
	unsigned long i, j;
	char *proctyp = CTRL_ATTR_VAL(PROCTYPE);
	char *procname = CTRL_ATTR_VAL(PROCNAME);
	char *save = CTRL_ATTR_VAL(SAVE);
	char exepath[1024] = {0};
	struct stat fs = {0};

	/* Handle save before */
	int b_done;
	if(form_btn_do_save(cntxt, i_ctrl, &b_done)) STACK_ERROR;
	if(!b_done) RETURN_OK;
	form = cntxt->form;
	ctrl = form->ctrl + i_ctrl;

	/* Handle integrated DLL functions */
	if(!strcmp(proctyp, "_EVA_DLL"))
	{
		if(!strcmp(procname, "FactureAEMO"))
		{
			if(FactureAEMO(cntxt, i_ctrl)) STACK_ERROR;
		}
		if(!strcmp(procname, "EcheancierAEMO"))
		{
			if(EcheancierAEMO(cntxt, i_ctrl)) STACK_ERROR;
		}
		if(!strcmp(procname, "FactureTPS"))
		{
			if(FactureTPS(cntxt, i_ctrl)) STACK_ERROR;
		}
		if(!strcmp(procname, "EcheancierTPS"))
		{
			if(EcheancierTPS(cntxt, i_ctrl)) STACK_ERROR;
		}
		else if(!strcmp(procname, "PrepareStageClasse"))
		{
			if(PrepareStageClasse(cntxt, i_ctrl)) STACK_ERROR;
		}
		else if(!strcmp(procname, "ReleveMensuel"))
		{
			if(ReleveMensuel(cntxt, i_ctrl)) STACK_ERROR;
		}
		RETURN_OK;
	}														 

	/* Prepare proc directory */
	snprintf(procid, sizeof(procid)-1, "%X-%X",	time(NULL), getpid());
	if(chdir(cntxt->path)) RETURN_ERR_DIRECTORY(1);
	mkdir("proc");
	if(chdir("proc")) RETURN_ERR_DIRECTORY(1);
	mkdir(procid);
	if(chdir(procid)) RETURN_ERR_DIRECTORY(1);

	/* Create params file call.txt  */
	f = fopen("call.txt", "wc");
	if(!f) RETURN_ERR_DIRECTORY(1);

	/* Output general information */
	fprintf(f, "127.0.0.1\n");
	fprintf(f, "%s\n", cntxt->dbname);
	fprintf(f, "%s\n", dyntab_val(&cntxt->id_user, 0, 0));
	fprintf(f, "%s\n", dyntab_val(&ctrl->id, 0, 0));
	fprintf(f, "%s\n", dyntab_val(&form->id_obj, 0, 0));
	fprintf(f, "%s\n", dyntab_val(&form->id_form, 0, 0));

	/* Output data for current object */
	fprintf(f, "\n");
	for(i = 1; i < form->nb_ctrl; i++) 
	{
		EVA_ctrl *c = form->ctrl + i;
		if(!*c->FIELD || strcmp(c->CONTROL, "_EVA_INPUT")) continue;
		for(j = 0; j < c->val.nbrows; j++)
		{
			DynTableCell *v = dyntab_cell(&c->val, j, 0);
			if(msg) msg->cnt = 0;
			DYNBUF_ADD(&msg, v->txt, v->len, EXPORT_TABRC);
			fprintf(f, "%s\t%s\t%lu\t%lu\n", c->FIELD, msg->data, v->Num, v->Line);
		}
	}
	M_FREE(msg);

	/* Output parameters */
	if(proc_output_params(cntxt, i_ctrl, f)) STACK_ERROR;
	fclose(f);

	/* Prepare executable & file path */
	snprintf(add_sz_str(exepath),  "%s\\Office\\%s.EXE", dyntab_val(&cntxt->cnf_server, 0, 0), 
												!strcmp(proctyp, "_EVA_EXCEL") ? "EXCEL" : 
												!strcmp(proctyp, "_EVA_WORD") ? "WINWORD" : "MSACCESS");
	snprintf(add_sz_str(filename), "..\\..\\..\\templates\\%s", procname);
	if(stat(exepath, &fs)) RETURN_ERROR("Impossible de lancer le traitement", ERR_PUT_TXT("\nFichier programme non trouvé : ", exepath, 0));
	if(stat(filename, &fs)) RETURN_ERROR("Impossible de lancer le traitement", ERR_PUT_TXT("\nFichier modèle non trouvé : ", procname, 0));

	/* Copy template & launch office program */
	snprintf(add_sz_str(cmd), "COPY %s . >exe.txt 2>exeerr.txt", filename);
	if(system(cmd) == -1 || stat(filename, &fs))
		RETURN_ERROR("Erreur la préparation du traitement (copie procédure)", NULL);
	snprintf(cmd, sizeof(cmd)-1, "call \"%s\" \"%s\" >exe.txt 2>exeerr.txt", exepath, procname);
	if(system(cmd) == -1 || stat("exe.txt", &fs) || stat("exeerr.txt", &fs) || fs.st_size > 0)
		RETURN_ERROR("Erreur lors de l'appel du traitement", { ERR_PUT_FILE("\nexe : ", "exe.txt"); ERR_PUT_FILE("\nexeerr : ", "exeerr.txt"); });

	/* Read result in res.txt & process errors */
	if(chdir(cntxt->path) || chdir("proc") || chdir(procid)) RETURN_ERR_DIRECTORY(1);
	if(file_read_tabrc(cntxt, &res, "res.txt") || !res.nbrows)
		/* Return error if no result file found */
		RETURN_ERROR("Le traitement n'a pas donné de résultat", NULL);
	if(strcmp(dyntab_val(&res, 0, 0), "Ok"))
	{
		/* Display error if first word is not Ok */
		char *err = dyntab_val(&res, 0, 0);
		if(*err != '<')
		{
			for(i = 0; i < res.nbrows; i++) for(j = 0; j < res.nbcols; j++) 
				if(dyntab_sz(&res, i, j)) DYNBUF_ADD3_CELL(&msg, "", &res, i, j, TO_HTML, "<br>");
			err = msg ? msg->data : "Pas de message d'erreur";
		}
		put_html_page_header(cntxt, NULL, NULL, NULL, 3);
		printf("<font face=Arial><hr><b>Erreur durant l'exécution du traitement</b><hr><u>Description :</u> <font size=+1 face=Courier>%s"
				"</font><br><hr><center><input type=image name='NOP' src='../img/_eva_btn_gobackobj_fr.gif'><hr></center></font>", 
				err);
		cntxt->b_terminate = 15;
		RETURN_OK;
	}

	/* Build unique file name based on original file name*/
	bname = basename(DYNTAB_VAL_SZ(&res, 1, 2));
	ext = strrchr(bname, '.');
	sz = strlen(bname) - (ext ? strlen(ext) : 0);
	sz = snprintf(filename, sizeof(filename) - 1, "%.*s-%X%X%s", sz, bname, time(NULL), getpid(), ext ? ext : "");
	file_compatible_name(filename);

	/* Create object data for result */
	DYNTAB_SET(&data, 0, 0, "_EVA_FILE_SERVER_NAME");
	DYNTAB_ADD(&data, 0, 1, filename, sz, NO_CONV);
	DYNTAB_SET(&data, 0, 2, "V");
	DYNTAB_SET(&data, 0, 3, "1");
	DYNTAB_SET(&data, data.nbrows, 0, "_EVA_FILE_CLIENT_PATH");
	DYNTAB_ADD_CELL(&data, data.nbrows-1, 1, &res, 1, 2);
	DYNTAB_SET(&data, data.nbrows-1, 2, "V");
	DYNTAB_SET(&data, data.nbrows-1, 3, "1");
	DYNTAB_SET(&data, data.nbrows, 0, "_EVA_FILE_SIZE");
	{
		struct stat fs;
		char size[64];
		stat(dyntab_val(&res, 1, 1), &fs);
		sprintf(size, "%lu", (unsigned long)fs.st_size);
		DYNTAB_ADD(&data, data.nbrows-1, 1, size, 0, NO_CONV);
	}
	DYNTAB_SET(&data, data.nbrows-1, 2, "V");
	DYNTAB_SET(&data, data.nbrows-1, 3, "1");
	DYNTAB_SET(&data, data.nbrows, 0, "_EVA_PROC_DURATION");
	{
		clock_t t = clock();
		char dur[64];
		sprintf(dur, "%1.2f", (float)t/CLOCKS_PER_SEC);
		DYNTAB_ADD(&data, data.nbrows-1, 1, dur, 0, NO_CONV);
	}
	DYNTAB_SET(&data, data.nbrows-1, 2, "V");
	DYNTAB_SET(&data, data.nbrows-1, 3, "1");
	DYNTAB_SET(&data, data.nbrows, 0, "_EVA_OBJ");
	DYNTAB_ADD_CELL(&data, data.nbrows-1, 1, &form->id_obj, 0, 0);
	DYNTAB_SET(&data, data.nbrows-1, 2, "R");
	DYNTAB_SET(&data, data.nbrows-1, 3, "1");
	DYNTAB_SET(&data, data.nbrows, 0, "_EVA_CTRL");
	DYNTAB_ADD_CELL(&data, data.nbrows-1, 1, &ctrl->id, 0, 0);
	DYNTAB_SET(&data, data.nbrows-1, 2, "R");
	DYNTAB_SET(&data, data.nbrows-1, 3, "1");
	DYNTAB_SET(&data, data.nbrows, 0, "_EVA_FORM");
	DYNTAB_ADD_CELL(&data, data.nbrows-1, 1, &form->ctrl->id, 0, 0);
	DYNTAB_SET(&data, data.nbrows-1, 2, "R");
	DYNTAB_SET(&data, data.nbrows-1, 3, "1");

	/* Create new object with file description */
	DYNTAB_SET(&id_form, 0, 0, OBJ_FORM_FILERES);
	if(qry_add_obj_data(cntxt, &id_obj, &data, &id_form, 0))
		STACK_ERROR;

	/* Move result file in docs directory & clean temp directory */
	snprintf(cmd, sizeof(cmd)-1, "%s..\\" DIRECTORY_DOCS "\\%s\\%s",
			cntxt->path, cntxt->dbname, filename);
	if(chdir(cntxt->path) || chdir("proc") || chdir(procid)) RETURN_ERR_DIRECTORY(1);
	if(rename(dyntab_val(&res, 1, 1), cmd)) RETURN_ERR_DIRECTORY({ERR_PUT_CELL("Error during rename\nsrc:", &res, 1, 1); ERR_PUT_TXT("\ndest:", cmd, 0)});
	if(strcmp(cntxt->user_ip, "127.0.0.1"))
	{
		system("del /q *.*");
		chdir("..");
		rmdir(procid);
	}

	/* If object was saved : add add reference to file object in DB */ 
	if(*save && dyntab_sz(&res, 1,0))
	{
		dyntab_free(&data);
		DYNTAB_ADD_CELL(&data, 0, 0, &res, 1,0);
		DYNTAB_ADD_CELL(&data, 0, 1, &id_obj, 0, 0);
		DYNTAB_SET(&data, 0, 2, "R");
		DYNTAB_SET(&data, 0, 3, "1");
		if(qry_add_obj_data(cntxt, &form->id_obj, &data, &id_form, 1))
			STACK_ERROR;
	}
	
	/* Add relation to file object in given field */
	if(dyntab_sz(&res, 1,0) && 
		cgi_set_field_values(cntxt, DYNTAB_TOUL(&form->id_form), DYNTAB_TOUL(&form->id_obj),
							DYNTAB_VAL_SZ(&res, 1, 0), &id_obj, "_EVA_REPLACE", 0)) STACK_ERROR;

	/* Following lines are field values : process each field */
	for(i = 2; i < res.nbrows; i++)
	{
		DYNTAB_FREE(data);
		for(j = 1; j < res.nbcols; j++) if(dyntab_sz(&res, i, j)) DYNTAB_SET_CELL(&data, data.nbrows, 0, &res, i, j);
		if(!data.nbrows) DYNTAB_ADD_CELLP(&data, 0, 0, NULL);
		if(cgi_set_field_values(cntxt, DYNTAB_TOUL(&form->id_form), DYNTAB_TOUL(&form->id_obj),
								DYNTAB_VAL_SZ(&res, i, 0), &data, "_EVA_REPLACE", 0)) STACK_ERROR;
	}

	/* Display link to file if no output field given */
	if(!dyntab_sz(&res, 1,0))
	{
		put_html_page_header(cntxt, NULL, NULL, NULL, 3);
		printf("<font face=Arial><center><font size=+1>"
				"<hr><b>%s - %s</font><br><br>Traitement terminé avec succès</b>"
				"<hr><br><br>%s<br><br>"
				"Fichier résultat : <a href='/docs/%s/%s' target='W%s'>%s</a><br><br>"
				"<hr><center><input type=image name='NOP' src='../img/_eva_btn_gobackobj_fr.gif'><hr></center></font>", 
				form->ctrl->LABEL, ctrl->LABEL, dyntab_val(&res, 0, 1), cntxt->dbname, filename, filename, dyntab_val(&res, 1, 2));
		cntxt->b_terminate = 15;
	}

	RETURN_OK_CLEANUP;
}
#undef ERR_FUNCTION
#undef ERR_CLEANUP
