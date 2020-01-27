/*********************************************************************
**        File : eva_cgi.c
** Description : EVA main entry point & args handling functions for CGI interface
**      Author : Alain BOUTE
**     Created : Aug 13 2001
**    Comments : call examples (function is the command to proceed)
					1) <form action="/cgi-bin/eva?function" method="POST">
					2) <a href="/cgi-bin/eva?function">
*********************************************************************/

#include "eva.h"

EVA_context *Cntxt;

/*********************************************************************
** Function : check_db_format
** Description : adapt db format to current executable version
*********************************************************************/
#define ERR_FUNCTION "check_db_format"
#define ERR_CLEANUP	DYNTAB_FREE(sqlres)
int check_db_format(			/* return : 0 on success, other on error */
	EVA_context *cntxt
){
	DynTable sqlres = {0};
	unsigned long i, id;

	/* Check for TxtMemo column in TLink */
	if(sql_exec_query(cntxt, "SHOW COLUMNS FROM TLink LIKE 'TxtMemo'") ||
		sql_get_table(cntxt, &sqlres, 2)) STACK_ERROR;

	/* Transfer TxtMemo to TVal table if present */
	if(sqlres.nbrows)
	{
		/* Extend TxtValue column in TVal & read non null TxtMemo records */
		if(sql_exec_query(cntxt, "ALTER TABLE TVal DROP INDEX TxtValue") ||
			sql_exec_query(cntxt, "ALTER TABLE TVal MODIFY TxtValue TEXT") ||
			sql_exec_query(cntxt, "SELECT Pkey, TxtMemo FROM TLink WHERE TxtMemo IS NOT NULL") ||
			sql_get_table(cntxt, &sqlres, 2)) STACK_ERROR;

		/* Transfer each TxtMemo value to TVal */
		for(i = 0; i < sqlres.nbrows; i++)
		{
			char sql[256];
			if(sql_add_value(cntxt, DYNTAB_VAL_SZ(&sqlres, i, 1), &id)) STACK_ERROR;
			sprintf(sql, "UPDATE TLink SET TxtMemo=NULL, IdValue=%lu WHERE Pkey=%s", id, dyntab_val(&sqlres, i, 0));
			if(sql_exec_query(cntxt, sql)) STACK_ERROR;
		}

		/* Remove TxtMemo & other columns from TLink */
		if(sql_exec_query(cntxt, "ALTER TABLE TVal ADD INDEX (TxtValue(64))") ||
			sql_exec_query(cntxt, "ALTER TABLE TLink DROP TxtMemo") ||
			sql_exec_query(cntxt, "ALTER TABLE TLink DROP IdCtrl") ||
			sql_exec_query(cntxt, "ALTER TABLE TLink DROP IdForm") ||
			sql_exec_query(cntxt, "ALTER TABLE TLink DROP IdSess")) STACK_ERROR;
	}

	RETURN_OK_CLEANUP;
}
#undef ERR_FUNCTION
#undef ERR_CLEANUP

/*********************************************************************
** Function : set_session_statistics
** Description : update statistics data in current session
*********************************************************************/
void set_session_statistics(
	EVA_context *cntxt,			/* in : execution context */
	DynTable *data,				/* in : session data */
	unsigned long idobj,		/* in : displayed object or form */
	unsigned long idfield		/* in : updated field (IdValue) */
){
	char qry[1024] = {0};
	unsigned long i; 
	DynTableCell *c = NULL;

	/* Return if no object */
	if(!idobj) return;
	if(idobj == ~0UL) idobj = 0;

	/* Search for given field & object in session data */
	for(i = 0; i < data->nbrows; i++)
	{
		c = dyntab_cell(data, i, 0);
		if(c->IdField == idfield && (!idobj || c->txt && strtoul(c->txt, NULL, 10) == idobj)) break;
	}

	/* If field / obj pair found : increment Num counter */
	if(i < data->nbrows)
		snprintf(add_sz_str(qry), "UPDATE TLink SET Num=%lu,DateCr=%s WHERE Pkey=%lu", c->Num + 1, cntxt->timestamp, c->Pkey);
	/* Else : create new record */
	else if(idobj)
		snprintf(add_sz_str(qry), "INSERT INTO TLink (IdObj,IdField,IdRelObj,Num,DateCr,IdWhoCr) VALUES (%s,%lu,%lu,1,%s,%s)", 
										cntxt->session.cell->txt, idfield, idobj, cntxt->timestamp,
										cntxt->id_user.nbrows ? cntxt->id_user.cell->txt : "NULL");
	if(*qry) sql_exec_query(cntxt, qry);
}

/*********************************************************************
** Function : main
** Description : executable entry point
*********************************************************************/
int main(int argc, char **argv, char **envp)
{
	EVA_context c = {0}, *cntxt = &c;
	clock_t t0;

	/* Initialize context */
	Cntxt = cntxt;
	cntxt->argc = argc;
	cntxt->argv = argv;
	cntxt->envp = envp;

	/* Extract DB name from executable path (basename) */
	cntxt->dbname = basename(cntxt->argv[0], 0);
	cntxt->path = mem_strdup(cntxt->argv[0]);
	cntxt->path[cntxt->dbname - cntxt->argv[0]] = 0;
	cntxt->dbname = mem_strdup(cntxt->dbname);
	cntxt->dbname[strlen(cntxt->dbname)-4] = 0;

	/* Read environments variables */
	cntxt->user_ip = getenv("REMOTE_ADDR");
	if(!cntxt->user_ip) cntxt->user_ip = "";
	cntxt->user_agent = getenv("HTTP_USER_AGENT");
	if(!cntxt->user_agent) cntxt->user_agent = "";

	/* Output page header (only HTML header) */
	put_html_page_header(cntxt, NULL, cntxt->dbname, NULL, 1);

	/* Initialize call data */
	if(!cgi_init_call(cntxt)/* && !check_db_format(cntxt)*/)
	{
		/* Check login & process form */
		if(!check_login(cntxt))
		{
			/* Output page header (background) */
			put_html_page_header(cntxt, NULL, NULL, NULL, 2);
			process_form(cntxt);
		}
	}

	/* Output page header (form) */
	put_html_page_header(cntxt, NULL, NULL, NULL, 3);
	
	/* Output session data as hidden input : , , , ,  */
	cntxt->txsize += printf("<input type=hidden name=S value=%s$%s$%s$%s$%s>\n" 
			,dyntab_val(&cntxt->session, 0, 0)	/* session id */
			,dyntab_val(&cntxt->id_form, 0, 0)	/* current form id */
			,dyntab_val(&cntxt->id_obj, 0, 0)	/* current object id */
			,dyntab_val(&cntxt->alt_form, 0, 0)	/* alternate form id */
			,dyntab_val(&cntxt->alt_obj, 0, 0)	/* current object id in alternate form */
			);

	/* Output page data */
	t0 = clock();
	if(cntxt->err.text) put_html_error(cntxt);
	else
	{
		debug_put_cgi(cntxt);
		if(cntxt->htmlhidden) cntxt->txsize += printf("%s", cntxt->htmlhidden->data);
		if(cntxt->html0) cntxt->txsize += printf("%s", cntxt->html0->data);
		if(cntxt->html) cntxt->txsize += printf("%s", cntxt->html->data);
		if(cntxt->html1) cntxt->txsize += printf("%s", cntxt->html1->data);
	}

	/* Output page trailer & log end */
	cntxt->txtime = clock() - t0;
	put_html_page_trailer(cntxt, NULL);
	output_log_end(cntxt);

	/* Update session statistics if session exist */
	if(cntxt->session.nbrows)
	{
		/* Read session trace params */
		DynTable session = {0};
		int b_obj = 0, b_form = 0, b_time = 0;
		unsigned long i;
		dyntab_filter_field(&session, 0, &cntxt->cnf_data, "_EVA_SESSION_TRACE", 0, 1, NULL);
		for(i = 0; i < session.nbrows; i++)
		{
			char *tr = dyntab_val(&session, i, 0);
			if(!strcmp(tr, "_EVA_OBJ")) b_obj = 1;
			else if(!strcmp(tr, "_EVA_FORM")) b_form = 1;
			else if(!strcmp(tr, "_EVA_TIME")) b_time = 1;
		}

		/* Read session data & add selected infos */
		qry_obj_data(cntxt, &session, &cntxt->session, NULL);
		set_session_statistics(cntxt, &session, ~0UL, GET_IDVALUE(USER_IP));
		if(b_obj)
		{
			unsigned long val_SESSION_OBJ;
			sql_add_value(cntxt, add_sz_str("_EVA_SESSION_OBJ"), &val_SESSION_OBJ);
			set_session_statistics(cntxt, &session, DYNTAB_TOUL(&cntxt->id_obj), val_SESSION_OBJ);
			if(cntxt->alt_form.nbrows) set_session_statistics(cntxt, &session, DYNTAB_TOUL(&cntxt->alt_obj), val_SESSION_OBJ);
		}
		if(b_form)
		{
			unsigned long val_SESSION_FORM;
			sql_add_value(cntxt, add_sz_str("_EVA_SESSION_FORM"), &val_SESSION_FORM);
			set_session_statistics(cntxt, &session, DYNTAB_TOUL(&cntxt->id_form), val_SESSION_FORM);
			if(cntxt->alt_form.nbrows) set_session_statistics(cntxt, &session, DYNTAB_TOUL(&cntxt->alt_form), val_SESSION_FORM);
		}
		dyntab_free(&session);
	}

	/* Output HTML trace if applicable */
	if(cntxt->debug & DEBUG_HTML_RAW)
	{
		FILE *f = NULL;
		char fname[128];
		sprintf(fname, "%s-%s.html", cntxt->dbname, dyntab_val(&cntxt->id_user, 0, 0));
		chdir(cntxt->path);
		chdir("..");
		if(!chdir("trace")) f = fopen(fname, "w");
		if(f)
		{
			cntxt->b_header = 0;
			cntxt->b_bodyheader = 0;
			cntxt->b_formheader = 0;
			put_html_page_header(cntxt, f, "Trace utilisateur - rafraichissement toutes les 60 secondes", NULL, 3);
			fprintf(f, "%s",
				"<table noborder width=100%><tr><td align=center><b>Navigation partagée - copie d'écran </b></td><td>"
				"<input type=submit name=TraceRefresh value='Afficher la page suivante' "
						"Onclick='javascript:window.location.reload(true);'></td></tr></table>");
			if(cntxt->err.text)
				fprintf(f,
					"<font face=Arial><b><u>*** Erreur : </u><a href='../errlog/%s'>%s</a>", cntxt->err.file, cntxt->err.text);
			else
			{
				if(cntxt->html0) fputs(cntxt->html0->data, f);
				if(cntxt->html) fputs(cntxt->html->data, f);
				if(cntxt->html1) fputs(cntxt->html1->data, f);
			}
			fputs("<script type=text/javascript>setTimeout('window.location.reload(true);',60000);"
					"document.mainform['TraceRefresh'].focus();</script>", f);
			put_html_page_trailer(cntxt, f);
			fclose(f);
		}
	}
	return 0;
}

