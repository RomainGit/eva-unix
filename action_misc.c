/*********************************************************************
**        File : action_misc.c
** Description : handling fonctions for misceleanous actions
**      Author : Alain BOUTE
**     Created : March 27 2002
*********************************************************************/

#include "eva.h"

/*********************************************************************
** Function : action_openform
** Description : button click handler for OPENFORM
*********************************************************************/
#define ERR_FUNCTION "action_openform"
#define ERR_CLEANUP DYNTAB_FREE(id_form); \
					DYNTAB_FREE(id_obj); \
					DYNTAB_FREE(destfield); \
					DYNTAB_FREE(srctype); \
					DYNTAB_FREE(srcobj); \
					DYNTAB_FREE(srcval); \
					DYNTAB_FREE(setmode); \
					DYNTAB_FREE(lineobj)
int action_openform(				/* return : 0 on success, other on error */
	EVA_context *cntxt,				/* in/out : execution context data */
	unsigned long i_ctrl			/* in : control index in cntxt->form->ctrl */
){
	EVA_form *form = cntxt->form;
	EVA_ctrl *ctrl = form->ctrl + i_ctrl;
	DynTable id_form = { 0 };
	DynTable id_obj = { 0 };
	DynTable destfield = { 0 };
	DynTable srctype = { 0 };
	DynTable srcobj = { 0 };
	DynTable srcval = { 0 };
	DynTable setmode = { 0 };
	DynTable lineobj = { 0 };
	DynTable lineval = { 0 };
	char *formtype = CTRL_ATTR_VAL(OPENFORM_TYPE);
	char *objtype = CTRL_ATTR_VAL(OPENOBJ_TYPE);
	char *altform = CTRL_ATTR_VAL(ALTFORM);
	unsigned long i, j;
	int loc = 0;

	/* Handle save before */
	int b_done = 0;
	if(form_btn_do_save(cntxt, i_ctrl, &b_done)) STACK_ERROR;
	if(!b_done) RETURN_OK;
	form = cntxt->form;
	ctrl = form->ctrl + i_ctrl;

	/* Select opened form */
	if(!strcmp("_EVA_CURRENT", formtype))
	{
		DYNTAB_ADD_CELL(&id_form, 0, 0, &form->id_obj, 0, 0);
	}
	else
	{
		CTRL_OPTIONAL(id_form, OPENFORM);
	}

	/* Select opened object */
	if(*objtype)
	{
		CTRL_OPTIONAL(srcval, OPENFIELD);
		CTRL_OPTIONAL(srcobj, LISTOBJ);
		if(form_eval_valtype(cntxt, &id_obj, objtype, &srcobj, &srcval)) CLEAR_ERROR;
		if(id_obj.nbrows > 1) id_obj.nbrows = 1;
	}

	/* Return if no form nor object */
	if(!dyntab_sz(&id_obj, 0, 0) && !dyntab_sz(&id_form, 0, 0)) RETURN_OK;

	/* Set initial values */
	CTRL_READ_ATTR_TAB(destfield, DESTFIELD);
	CTRL_READ_ATTR_TAB(srctype, SRCTYPE);
	CTRL_READ_ATTR_TAB(srcobj, SRCLISTOBJ);
	CTRL_READ_ATTR_TAB(srcval, SRCFIELD);
	CTRL_READ_ATTR_TAB(setmode, SET_MODE);
	for(i = 0; i < destfield.nbrows; i++)
		if(dyntab_sz(&destfield, i, 0))
		{
			DynTableCell *c;
			for(j = 0; j < srcobj.nbcols; j++) if(dyntab_sz(&srcobj, i, j))
			{
				unsigned long row = lineobj.nbrows;
				DYNTAB_SET_CELL(&lineobj, row, 0, &srcobj, i, j);
				c = dyntab_cell(&lineobj, row, 0);
				c->Num = 0;
				c->Line = 0;
			}
			DYNTAB_SET_CELL(&lineval, 0, 0, &srcval, i, 0);
			c = dyntab_cell(&lineval, 0, 0);
			c->Num = 0;
			c->Line = 0;
			if(form_set_values(cntxt,	
					DYNTAB_TOUL(&id_form),
					DYNTAB_TOUL(&id_obj),
					DYNTAB_VAL_SZ(&destfield, i, 0),
					dyntab_val(&srctype, i, 0),
					&lineobj,
					&lineval,
					dyntab_val(&setmode, i, 0)))
				CLEAR_ERROR;
		}

	/* Select form location */
	if(!strcmp("_EVA_BOTTOM", altform)) loc = 2;
	else if(!strcmp("_EVA_TOP", altform)) loc = 1;

	/* Open form with new object */
	if(form_load_from_ctrl(cntxt, &id_form, &id_obj, loc, i_ctrl)) STACK_ERROR;

	RETURN_OK_CLEANUP;
}
#undef ERR_FUNCTION
#undef ERR_CLEANUP

/*********************************************************************
** Function : action_formbuttons
** Description : button click handler for PRINT, SAVE, CLOSE, EDIT, ...
*********************************************************************/
#define ERR_FUNCTION "action_formbuttons"
#define ERR_CLEANUP	
int action_formbuttons(				/* return : 0 on success, other on error */
	EVA_context *cntxt,				/* in/out : execution context data */
	unsigned long i_ctrl			/* in : control index in cntxt->form->ctrl */
){
	EVA_form *form = cntxt->form;
	EVA_ctrl *ctrl = form->ctrl + i_ctrl;
	char *action = CTRL_ATTR_VAL(ACTION);
	char *confirm = CTRL_ATTR_VAL(CONFIRM);
	int buttons = 0, mode = 0;

	/* Handle close button on unchanged new object */
	if(!dyntab_sz(&form->id_obj, 0, 0) && !form->b_modified && !strcmp(action, "_EVA_CLOSE"))
	{
		if(form_close_nosave(cntxt, DYNTAB_TOUL(&form->id_form), 0, &form->call_data)) STACK_ERROR;
		RETURN_OK;
	}
	
	/* Handle button action */
#define DEFACTION(t, b, m)	if(!strcmp(action, "_EVA_"#t)) { buttons = b; mode = m; }
		 DEFACTION(SAVE, BUTN_SAVE_BACK, 0)
	else DEFACTION(CLOSE, strcmp(confirm, "_EVA_CONFIRMNONE") ? BUTN_CLOSE : BUTN_SAVE_CLOSE, 0)
	else DEFACTION(SAVECLOSE, BUTN_SAVE_CLOSE, 0)
	else DEFACTION(PRINTMODE, (form->prevstep == HtmlPrint ? 0 : BUTN_SAVE_NEXT),
							(form->prevstep == HtmlPrint ? HtmlView : HtmlPrint))
	else DEFACTION(LISTMODE, 0, FormList)
	else DEFACTION(STATSMODE, BUTN_SAVE_NEXT, FormStats)
	else DEFACTION(VALUESMODE, 0, FormValues)
	else DEFACTION(EDITMODE, 0, HtmlEdit)
	else DEFACTION(VIEWMODE, BUTN_SAVE_NEXT, HtmlView)
	else DEFACTION(SEARCHMODE, 0, FormSearch)
	else DEFACTION(NEWOBJ, BUTN_SAVE_NEXT, HtmlEdit)
#undef DEFACTION

	/* Call save dialog */
	if(buttons)
	{
		int btn = buttons;
		if(form_save_dialog(cntxt, i_ctrl, confirm, buttons | BUTN_SAVE_CLOSE | BUTN_CLOSE | BUTN_RESTORE, &btn)) 
			STACK_ERROR;

		/* Set form mode if dialog succeded */
		if(btn == buttons && mode && form) form->nextstep = mode;
	}
	else 
		form->nextstep = mode;
	
	RETURN_OK_CLEANUP;
}
#undef ERR_FUNCTION
#undef ERR_CLEANUP

/*********************************************************************
** Function : action_export
** Description : button click handler for EXPORT
*********************************************************************/
#define ERR_FUNCTION "action_export"
#define ERR_CLEANUP	DYNTAB_FREE(sqlres); \
					M_FREE(forms); \
					M_FREE(qry); \
					M_FREE(formname); \
					M_FREE(objname); \
					M_FREE(name); \
					M_FREE(fname); \
					if(f) fclose(f)
int action_export(					/* return : 0 on success, other on error */
	EVA_context *cntxt,				/* in/out : execution context data */
	unsigned long i_ctrl			/* in : control index in cntxt->form->ctrl */
){
	EVA_form *form = cntxt->form;
	DynTable sqlres = {0};
	DynBuffer *forms = NULL;
	DynBuffer *qry = NULL;
	DynBuffer *formname = NULL;
	DynBuffer *objname = NULL;
	DynBuffer *name = NULL;
	DynBuffer *fname = NULL;
	DynBuffer **html;
	unsigned long level = 0, nb_cur = 1, nb_prev = 0, idobj;
	char sql[2048];
	FILE *f = NULL;

	/* TODO : handle export params (objects selection, output mode, ...) */
	i_ctrl = 0;

	/* Export current object in triplets format */
	idobj = atoi(dyntab_val(&form->id_obj, 0, 0));
	if(!idobj) RETURN_OK;

	/* Build list of forms */
	sprintf(sql, 
		"-- action_export : build forms list\n"
		"SELECT TLink.IdObj FROM TLink \n"
		"INNER JOIN TLink AS TLink0 ON TLink.IdObj=TLink0.IdObj \n"
		"WHERE TLink.IdObj NOT IN (%lu) AND TLink.DateDel IS NULL AND TLink.IdField=%lu AND TLink.IdRelObj=%lu \n"
		"AND TLink0.DateDel IS NULL AND TLink0.IdField=%lu AND TLink0.IdValue=%lu \n"
		"GROUP BY IdObj", idobj,
		cntxt->val_FORMSTAMP, OBJ_FORM_CONTROL, IDVAL("_EVA_CONTROL"), IDVAL("_EVA_FORM"));
	if(sql_exec_query(cntxt, sql) || sql_get_table(cntxt, &sqlres, 2) ||
		qry_values_list(cntxt, &sqlres, 0, &forms)) STACK_ERROR;

	/* Create a temporary heap table to hold selected objects */
	sprintf(sql, 
		"INSERT INTO IdList (IdObj,Lvl) VALUES (%lu, 0)", idobj);
	if(sql_exec_query(cntxt, "-- action_export : create objects Ids table\n"
		"CREATE TEMPORARY TABLE IdList (IdObj INT NOT NULL, Lvl INT, PRIMARY KEY (IdObj)) TYPE=HEAP") ||
		sql_exec_query(cntxt, sql)) STACK_ERROR;

	/* Read objects children */
	while(nb_cur > nb_prev)
	{
		level++;
		DYNBUF_ADD3_INT(&qry, 
			"-- action_export : get child ids - level=", level, "\n");
		DYNBUF_ADD3_INT(&qry, 
			"CREATE TEMPORARY TABLE IdListTmp TYPE=HEAP \n" 
			"SELECT TLink.IdRelObj, ", level, " AS Lvl \n" 
			"FROM TLink \n"
			"INNER JOIN IdList ON TLink.IdObj=IdList.IdObj \n"); 
		DYNBUF_ADD3_INT(&qry, 
			"WHERE IdList.Lvl=", level - 1, " AND TLink.DateDel IS NULL AND TLink.IdRelObj IS NOT NULL \n"); 
		DYNBUF_ADD3_BUF(&qry, 
			"AND TLink.IdRelObj NOT IN (", forms, NO_CONV,") \n" 
			"GROUP BY TLink.IdRelObj");
		if(sql_exec_query(cntxt, qry->data) ||
			sql_exec_query(cntxt,
				"INSERT IGNORE IdList SELECT * FROM IdListTmp")) STACK_ERROR;
		if(sql_exec_query(cntxt, "DROP TABLE IdListTmp") || 
			sql_exec_query(cntxt, "SELECT COUNT(*) FROM IdList") || 
			sql_get_table(cntxt, &sqlres, 2)) STACK_ERROR;
		nb_prev = nb_cur;
		nb_cur = DYNTAB_TOUL(&sqlres);
		M_FREE(qry);
	}

	/* Open output file - name as form & object label */
	if(qry_obj_label(cntxt, &formname, NULL, &objname, NULL, NULL, NULL, NULL, NULL, 0, &form->objdata, 0))
		STACK_ERROR;
	DYNBUF_ADD(&fname, cntxt->dbname, 0, NO_CONV);
	DYNBUF_ADD3_BUF(&fname, "-", formname, NO_CONV, "-");
	DYNBUF_ADD_BUF(&fname, objname, NO_CONV);
	file_compatible_name(fname->data);
	DYNBUF_ADD_STR(&fname, ".txt");
	if(chdir(cntxt->path) || chdir("..")) RETURN_ERR_DIRECTORY(1);
	mkdir("objlib");
	if(chdir("objlib")) RETURN_ERR_DIRECTORY(1);
	f = fopen(fname->data, "w");
	if(!f) RETURN_ERROR("Impossible d'écrire dans le fichier", NULL);

	/* Output used forms ids & labels */
	DYNBUF_ADD3_BUF(&qry, 
		"SELECT TLink0.IdObj AS IdObj,TVal.TxtValue AS Label \n" 
		"FROM TLink \n"
		"INNER JOIN IdList ON TLink.IdObj=IdList.IdObj \n" 
		"INNER JOIN TLink AS TLink0 ON TLink.IdRelObj=TLink0.IdObj \n"
		"INNER JOIN TVal as TField ON TLink0.IdField=TField.IdValue \n"
		"INNER JOIN TVal ON TLink0.IdValue=TVal.IdValue \n"
		"WHERE TField.TxtValue='_EVA_LABEL' AND TLink.DateDel IS NULL AND TLink0.DateDel IS NULL \n"
		"AND TLink.IdRelObj IN (", forms, NO_CONV,") \n" 
		"GROUP BY TLink0.IdObj,TVal.TxtValue \n" 
		"ORDER BY IdObj");
	if(sql_exec_query(cntxt, qry->data) ||
		sql_get_table(cntxt, &sqlres, 3) ||
		FILE_write_tabrc(cntxt, &sqlres, f)) STACK_ERROR;
	fprintf(f, "\n");

	/* Read objects data & write to output file */
	sprintf(sql, 
		"-- action_export : read objects data\n"
		"SELECT DISTINCT TLink.IdObj AS IdObj,"
			"TField.TxtValue AS Field,"
			"IF(TVal.TxtValue IS NULL,TLink.IdRelObj,TVal.TxtValue) AS Value," 
			"IF(TLink.IdRelObj IS NULL,'V','R') AS Type,"
			"TLink.Num,TLink.Line \n" 
		"FROM TLink INNER JOIN IdList ON TLink.IdObj=IdList.IdObj \n" 
		"INNER JOIN TVal as TField ON TLink.IdField=TField.IdValue \n"
		"LEFT JOIN TVal ON TLink.IdValue=TVal.IdValue \n"
		"WHERE TLink.DateDel IS NULL \n"
		"ORDER BY IdList.Lvl,TLink.IdObj,TLink.IdField,TLink.Line,TLink.Num");
	if(sql_exec_query(cntxt, sql) || sql_get_table(cntxt, &sqlres, 3) ||
		FILE_write_tabrc(cntxt, &sqlres, f) ||
		sql_exec_query(cntxt, "DROP TABLE IdList")) STACK_ERROR;

	/* Output link to result file */
	cntxt->jsfunc = 1;
	put_html_page_header(cntxt, NULL, "Exporter des données", NULL, 3);
	M_FREE(forms);
	cntxt->form->html = &forms;
	html = &forms;
	cntxt->b_terminate = 15;
	DYNBUF_ADD_STR(html, "<table noboder width=100%><tr><td align=center>");
	if(put_html_button(cntxt, "NOP", "Revenir", "_eva_btn_gobackobj_fr.gif", "_eva_btn_gobackobj_fr_s.gif",
							"Retourne à la page précédente", 0, 0)) STACK_ERROR;
	DYNBUF_ADD_STR(html, "</td><td align=center>");
	DYNBUF_ADD3_BUF(&name, "B$#.DELOBJLIB=", fname, NO_CONV, "$1");
	if(put_html_button(cntxt, name->data, "Supprimer le fichier", "_eva_btn_delfile_fr.gif", "_eva_btn_delfile_fr_s.gif",
							"Attendez que le téléchargement soit terminé pour supprimer le fichier", 0, 0)) STACK_ERROR;
	DYNBUF_ADD_STR(html, "</td></tr></table>");
	printf("<font face=Arial><center>"
			"<font size=+1><b>%s %s</font><br><br>"
			"Export de données terminé avec succès</b><hr><br><br>"
			"Fichier exporté : <a "
			"title='Cliquez avec le bouton droit de la souris et utilisez la commande \"Enregistrer sous ...\" pour transférer le fichier vers un autre ordinateur' "
			"href='/objlib/%s'>%s %s</a><br><br>"
			"Si vous n'utilisez pas le bouton 'Supprimer le fichier', il sera visible par les utilisateurs pouvant importer des données<br>"
			"<hr><br>%s<br><br></center></font>", 
			formname->data, objname->data, fname->data, formname->data, objname->data, forms->data);

	RETURN_OK_CLEANUP;
}
#undef ERR_FUNCTION
#undef ERR_CLEANUP

/*********************************************************************
** Function : action_closeall
** Description : button click handler for CLOSEALL
*********************************************************************/
#define ERR_FUNCTION "action_closeall"
#define ERR_CLEANUP 
int action_closeall(				/* return : 0 on success, other on error */
	EVA_context *cntxt,				/* in/out : execution context data */
	unsigned long i_ctrl			/* in : control index in cntxt->form->ctrl */
){
	EVA_form *form = cntxt->form;
	EVA_ctrl *ctrl = form->ctrl + i_ctrl;

	/* TODO */
	ctrl = 0;

	DYNTAB_FREE(cntxt->id_form);
	DYNTAB_FREE(cntxt->id_obj);
	DYNTAB_FREE(cntxt->alt_form);
	DYNTAB_FREE(cntxt->alt_obj);

	RETURN_OK_CLEANUP;
}
#undef ERR_FUNCTION
#undef ERR_CLEANUP

/*********************************************************************
** Function : action_end_session
** Description : button click handler for END_SESSION
*********************************************************************/
#define ERR_FUNCTION "action_end_session"
#define ERR_CLEANUP	DYNTAB_FREE(data); \
					DYNTAB_FREE(cgival); \
					M_FREE(name)
int action_end_session(				/* return : 0 on success, other on error */
	EVA_context *cntxt,				/* in/out : execution context data */
	unsigned long i_ctrl			/* in : control index in cntxt->form->ctrl */
){
	EVA_form *form = cntxt->form;
	EVA_ctrl *ctrl = form->ctrl + i_ctrl;
	DynTable cgival = { 0 };
	DynTable data = { 0 };
	DynBuffer *name = NULL;
	ObjTableFormat tbl = {0};
	unsigned long i, j;

	/* End session if confirm button clicked */
	if(!strcmp(CGI_CLICK_BTN_SUBFIELD, "ENDSESSION"))
	{
		if(action_closeall(cntxt, i_ctrl)) STACK_ERROR;
		M_FREE(cntxt->html);
		M_FREE(cntxt->html0);
		M_FREE(cntxt->html1);
		form_free(cntxt);
		cgi_free(cntxt);
		cntxt->b_user_ok = 0;
		if(qry_add_obj_field_val(cntxt, &cntxt->session, "_EVA_TERMINATE", add_sz_str("1"), 0, 1)) STACK_ERROR;
		DYNTAB_FREE(cntxt->session);
		RETURN_OK;
	}

	/* Output page header */
	cntxt->jsfunc = 1;
	put_html_page_header(cntxt, NULL, "Importer des données", NULL, 3);
	form->html = &form->html_top;
	cntxt->b_terminate = 15;
	fflush(stdout);
	CTRL_CGINAMEBTN(&name, NULL, add_sz_str("ENDSESSION"));
	printf(
		"<font face=Arial><br>"
		"<center><font size=+1><b>Terminer la session</b></font></center><br><hr><br>"
		"<u>Avertissement concernant la sécurité : </u>"
		"la plupart des navigateurs disposent d'une fonction 'Page précédente' qui permet "
		"de visualiser votre travail si vous laissez cette fenêtre ouverte. "
		"Il est donc fortement recommandé de fermer la fenêtre pour éviter toute indiscrétion, "
		"sauf si vous souhaitez vous identifier sous un autre nom. Dans ce cas utilisez le bouton ci dessous."
		"<br><br><center><input type=submit value='Changer d&#39;identification' name='%s'><br></center><hr>",
		name->data);

	/* Output forms with modified data in CGI */
	for(i = cntxt->nb_cgi - 1, j = 0; i; i--) if(cntxt->cgi[i].name[0] == 'F')
	{
		/* Check if form was modified */
		CGIData *cgi = cntxt->cgi + i;
		char *bgcolor = table_row_bgcolor(cntxt, &tbl, j);
		if(cgi_check_form_change(cntxt, cgi->IdForm, cgi->IdObj) != 1) continue;
		j++;

		/* Read object data */
		if(cgi_filter_values(cntxt, &cgival, 'D', ~0UL, 
								cgi->IdObj ? ~0UL : cgi->IdForm,
								cgi->IdObj, NULL, "", 0, 0)) STACK_ERROR;
		if(cgi->IdObj)
		{
			unsigned long k;
			if(qry_obj_idfield(cntxt, &data, cgi->IdObj, 0)) STACK_ERROR;
			if(qry_complete_data(cntxt, &cgival, &data, NULL, NULL)) STACK_ERROR;
			for(k = cgival.nbrows; k; k--)
				if(!strcmp(dyntab_cell(&cgival, k - 1, 0)->field, "_EVA_FORMSTAMP"))
					dyntab_del_rows(&cgival, k - 1, 1);
		}
		DYNTAB_ADD_INT(&cgival, cgival.nbrows, 0, cgi->IdForm);
		{
			DynTableCell *c = dyntab_cell(&cgival, cgival.nbrows - 1, 0);
			c->field = "_EVA_FORMSTAMP";
			c->b_dontfreefield = 1;
			c->IdObj = cgi->IdObj;
		}

		/* Output open button */
		DYNBUF_ADD_STR(form->html, "<tr>");
		if(ctrl_add_symbol_btn(cntxt, NULL, NULL, NULL, &cgival, 0,
								add_sz_str("Cliquez pour retourner à la fiche"), bgcolor, "SYMBOL+NAME+LABEL+OBJNOTES"))
			CLEAR_ERROR;
		DYNBUF_ADD_STR(form->html, "</tr>");
	}

	/* Output message & open buttons for modified forms if applicable */
	if(form->html_top)
	{
		printf("%s%s%s",
			"<u>Attention : vous avez modifié les formulaires suivants sans les enregistrer</u><br><br>"
			"<table border=0 width=100% bgcolor=#EEEEEE cellspacing=0 cellpadding=2><tr>",
			form->html_top->data,
			"</tr></table><br><center>"
			"<li>si voulez enregistrer vos modifications, ouvrez chaque fiche modifiée et enregistrez-la<br><br>"
			"<li>si vous ne voulez pas enregistrer vos modifications, fermez cette fenêtre</li>"
			"<br><a href='javascript:window.close()' title='Ferme cette fenêtre'>"
			"<br><br><img src='../img/_eva_btn_closenosave_fr.gif' border=0></a><br><br></center>");
	}
	else
	{	
		/* Close window */
		printf("<script>window.close();</script>");
	}

	RETURN_OK_CLEANUP;
}
#undef ERR_FUNCTION
#undef ERR_CLEANUP

/*********************************************************************
** Function : action_delete
** Description : button click handler for DELETE
*********************************************************************/
#define ERR_FUNCTION "action_delete"
#define ERR_CLEANUP	DYNTAB_FREE(t_keepobj); \
					DYNTAB_FREE(objdata); \
					DYNTAB_FREE(linkdata); \
					M_FREE(sql)
int action_delete(					/* return : 0 on success, other on error */
	EVA_context *cntxt,				/* in/out : execution context data */
	unsigned long i_ctrl			/* in : control index in cntxt->form->ctrl */
){
	EVA_form *form = cntxt->form;
	EVA_ctrl *ctrl = form->ctrl + i_ctrl;
	unsigned long i, j;
	EVA_ctrl *ctrl_delobj = 0;
	EVA_ctrl *ctrl_delmode = 0;
	unsigned long keepobj = 0;
	DynTable t_keepobj = {0};
	DynTable objdata = {0};
	DynTable linkdata = {0};
	DynBuffer *sql = NULL;

	/* TODO */
	ctrl = 0;

	/* Retrieve delete parameters controls index */
	for(i = 0; i < form->nb_ctrl; i++)
		if(!strcmp(form->ctrl[i].FIELD, "_EVA_DELOBJ")) ctrl_delobj = form->ctrl + i;
		else if(!strcmp(form->ctrl[i].FIELD, "_EVA_DELETE_TYPE")) ctrl_delmode = form->ctrl + i;
	if(!ctrl_delobj) RETURN_OK;

	/* If not delete all mode */
	if(!ctrl_delmode || strcmp(dyntab_val(&ctrl_delmode->val, 0, 0), "_EVA_DELETE_ALL"))
	{
		/* Keep 1st object : save id & remove from delete list */
		if(ctrl_delobj->val.nbrows < 2) RETURN_OK;
		keepobj = DYNTAB_TOUL(&ctrl_delobj->val);
		DYNTAB_ADD_CELL(&t_keepobj, 0, 0, &ctrl_delobj->val, 0, 0);
		dyntab_del_rows(&ctrl_delobj->val, 0, 1);

		/* Read links to be transfered to kept object */
		DYNBUF_ADD_STR(&sql, "(DateDel IS NULL AND IdRelObj IN (");
		if(qry_values_list(cntxt, &ctrl_delobj->val, 0, &sql)) STACK_ERROR;
		DYNBUF_ADD3_INT(&sql, ") AND IdObj NOT IN (", keepobj, ",");
		if(qry_values_list(cntxt, &ctrl_delobj->val, 0, &sql)) STACK_ERROR;
		DYNBUF_ADD_STR(&sql, "))");
		if(qry_get_obj_data(cntxt, &linkdata, sql->data)) STACK_ERROR;
		M_FREE(sql);

		/* If fusion mode */
		if(!ctrl_delmode || !strcmp(dyntab_val(&ctrl_delmode->val, 0, 0), "_EVA_DELETE_KEEPALL"))
		{
			/* Read objects data if fusion mode */
			DYNBUF_ADD_STR(&sql, "(DateDel IS NULL AND IdObj IN (");
			if(qry_values_list(cntxt, &ctrl_delobj->val, 0, &sql)) STACK_ERROR;
			DYNBUF_ADD3_INT(&sql, ") AND IF(ISNULL(IdRelObj),1,IdRelObj NOT IN (", keepobj, ",");
			if(qry_values_list(cntxt, &ctrl_delobj->val, 0, &sql)) STACK_ERROR;
			DYNBUF_ADD_STR(&sql, ")))");
			if(qry_get_obj_data(cntxt, &objdata, sql->data)) STACK_ERROR;
			M_FREE(sql);

			/* Copy other objects data to kept object */
			for(i = 0; i < objdata.nbrows; i++)
			{
				DynTableCell *c = dyntab_cell(&objdata, i, 0);
				c->IdObj = keepobj;
				if(qry_add_val(cntxt, c, 1, NULL)) STACK_ERROR;
			}
		}

		/* Copy links to kept object */
		for(i = 0; i < linkdata.nbrows; i++)
		{
			DynTableCell *c = dyntab_cell(&linkdata, i, 0);
			M_FREE(c->txt);
			c->b_dontfreetxt = 1;
			c->txt = dyntab_val(&t_keepobj, 0, 0);
			c->len = dyntab_sz(&t_keepobj, 0, 0);
			if(qry_add_val(cntxt, c, 1, NULL)) STACK_ERROR;
		}
	}

	/* Delete objects & links to objects */
	DYNBUF_ADD3(&sql, "-- Delete objects & links\n"
		"UPDATE TLink SET DateDel='", cntxt->timestamp, 0, NO_CONV, "'");
	DYNBUF_ADD3_CELL(&sql, ",IdWhoDel=", &cntxt->id_user, 0, 0, NO_CONV, "\nWHERE IdObj IN(");
	if(qry_values_list(cntxt, &ctrl_delobj->val, 0, &sql)) STACK_ERROR;
	DYNBUF_ADD_STR(&sql, ") \nOR IdRelObj IN (");
	if(qry_values_list(cntxt, &ctrl_delobj->val, 0, &sql)) STACK_ERROR;
	DYNBUF_ADD_STR(&sql, ")");
	if(sql_exec_query(cntxt, sql->data)) STACK_ERROR;
	M_FREE(sql);

	/* Close forms containg deleted objects */
	if(cntxt->cgi)
	{
		unsigned long idform = DYNTAB_TOUL(&form->id_form);
		for(i = 0; i < ctrl_delobj->val.nbrows; i++)
		{
			unsigned long idobj = DYNTAB_TOULRC(&ctrl_delobj->val, i, 0);
			for(j = 0; j < cntxt->nb_cgi; j++)
			{
				CGIData *cgi = cntxt->cgi + j;
				if(cgi->IdObj == idobj || cgi->IdForm == idform) cgi->name[0] = 0;
			}
		}
	}
	form_close_nosave(cntxt, DYNTAB_TOUL(&form->id_form), DYNTAB_TOUL(&form->id_obj), NULL);

	RETURN_OK_CLEANUP;
}
#undef ERR_FUNCTION
#undef ERR_CLEANUP

/*********************************************************************
** Function : action_copyobj
** Description : button click handler for COPYOBJ
*********************************************************************/
#define ERR_FUNCTION "action_copyobj"
#define ERR_CLEANUP	
int action_copyobj(					/* return : 0 on success, other on error */
	EVA_context *cntxt,				/* in/out : execution context data */
	unsigned long i_ctrl			/* in : control index in cntxt->form->ctrl */
){
	EVA_form *form = cntxt->form;
	EVA_ctrl *ctrl = form->ctrl + i_ctrl;

	/* TODO */
	ctrl = 0;

	RETURN_OK_CLEANUP;
}
#undef ERR_FUNCTION
#undef ERR_CLEANUP

/*********************************************************************
** Function : action_default
** Description : default handler for form clicks
*********************************************************************/
#define ERR_FUNCTION "action_default"
#define ERR_CLEANUP	DYNTAB_FREE(id_obj); \
					DYNTAB_FREE(id_form); \
					DYNTAB_FREE(alt)
int action_default(					/* return : 0 on success, other on error */
	EVA_context *cntxt,				/* in/out : execution context data */
	unsigned long i_ctrl			/* in : control index in cntxt->form->ctrl */
){
	EVA_form *form = cntxt->form;
	DynTable id_obj = { 0 };
	DynTable id_form = { 0 };
	DynTable alt = { 0 };
	CGIData *cgi = cntxt->cgi + cntxt->cgibtn;
	char *btn = CGI_CLICK_BTN_SUBFIELD;
	char *equal = btn ? strchr(btn, '=') : NULL;

	/* Switch on button type */
	switch(cgi->name[0])
	{
	case 'I':	/* Info button : display control info */
		/* Load alternate form */
		DYNTAB_ADD_INT(&id_form, 0, 0, OBJ_FORM_CONTROL);
		DYNTAB_ADD_INT(&id_obj, 0, 0, cgi->IdCtrl);
		if((cntxt->opt_btn_mode == OptBtn_OpenSame || cntxt->opt_btn_mode ==  OptBtn_OpenBottom) && 
			form_load_from_ctrl(cntxt, &id_form, &id_obj, cntxt->opt_btn_mode == OptBtn_OpenSame ? 0 : 2, form->nb_ctrl)) STACK_ERROR;
		break;

	case 'T':	/* TAB button : memorize selected tab */
		form->i_seltab = i_ctrl;
		break;

	default:
		/* Check for program specific actions */
		if(equal)
		{
			/* Get parameters : IdObj,IdForm,Location */
			unsigned long idobj = strtoul(equal + 1, NULL, 10);
			char *c = strchr(equal, ',');
			unsigned long idform = c ? strtoul(c + 1, &c, 10) : 0;
			int loc = c ? atoi(c + 1) : 0;

			if(!strncmp(btn, add_sz_str("OPENOBJ")))
			{
				/* Open object in given form */
				if(idform) DYNTAB_ADD_INT(&id_form, 0, 0, idform);
				if(idobj) DYNTAB_ADD_INT(&id_obj, 0, 0, idobj);
				if(form_load_from_ctrl(cntxt, &id_form, &id_obj, loc, i_ctrl)) STACK_ERROR;
			}
			else if(!strncmp(btn, add_sz_str("CLOSE")))
			{
				form_close_nosave(cntxt, idform, idobj, NULL);
			}
			else if(!strncmp(btn, add_sz_str("DELOBJLIB")))
			{
				if(!chdir(cntxt->path) && !chdir("..") && !chdir("objlib"))
					remove(equal + 1);
			}
		}
		else if(!strcmp(btn, "CLOSE")) 
		{
			form_close_nosave(cntxt, DYNTAB_TOUL(form ? &form->id_form : &cntxt->id_form), 
										DYNTAB_TOUL(form ? &form->id_obj : &cntxt->id_obj),
										NULL);
		}
		break;
	}


	RETURN_OK_CLEANUP;
}
#undef ERR_FUNCTION
#undef ERR_CLEANUP
#undef CHECK_ACTION
