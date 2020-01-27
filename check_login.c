/*********************************************************************
**        File : check_login.c
** Description : handle user identification
**      Author : Alain BOUTE
**     Created : Sept 23 2001
*********************************************************************/

#include "eva.h"

/*********************************************************************
** Function : qry_get_rec_info
** Description : return information on a record
*********************************************************************/
#define ERR_FUNCTION "qry_get_rec_info"
#define ERR_CLEANUP 
int qry_get_rec_info(							/* return : 0 on success, other on error */
	EVA_context *cntxt,							/* in/out : execution context data */
	DynTable *res,								/* out : read information (columns) */
	unsigned long pkey,							/* in : record to read */
	char *fields								/* in : fields to read */
){
	char qry[256];
	snprintf(add_sz_str(qry), "SELECT %s FROM TLink WHERE Pkey=%lu", fields, pkey);
	if(sql_exec_query(cntxt, qry) || sql_get_table(cntxt, res, 2)) STACK_ERROR;
	
	RETURN_OK_CLEANUP;
}
#undef ERR_FUNCTION
#undef ERR_CLEANUP

/*********************************************************************
** Function : output_message
** Description : display a message page
*********************************************************************/
void output_message(
	EVA_context *cntxt,				/* in/out : execution context data */
	char *title,					/* in : message title */
	char *msg						/* in : message text */
){
	put_html_page_header(cntxt, NULL, NULL, NULL, 3);
	cntxt->txsize += printf(
		"<font face=Arial><center>"
		"<br><br><u>%s</u><br><br>"
		"<hr><b><font size=+1 color=#886600>%s</font></b><hr><br><br>",
		title, msg);
	cntxt->b_terminate = 15;
}

/*********************************************************************
** Function : check_login
** Description : check login & passwd and alloc session number
*********************************************************************/
#define ERR_FUNCTION "check_login"
#define ERR_CLEANUP DYNTAB_FREE(login); \
					DYNTAB_FREE(passwd); \
					DYNTAB_FREE(id_user); \
					DYNTAB_FREE(sqlres); \
					DYNTAB_FREE(unknownuser); \
					DYNTAB_FREE(debug); \
					DYNTAB_FREE(id_form); \
					DYNTAB_FREE(session); \
					M_FREE(sql)
int check_login(				/* return : 0 on success, other on error */
	EVA_context *cntxt			/* in : execution context - cgi data, argc, argv, ...
								  out : user identification - id_user, b_user_ok */
){
	DynTable login = { 0 };
	DynTable passwd = { 0 };
	DynTable unknownuser = { 0 };
	DynTable id_user = { 0 };
	DynTable sqlres = { 0 };
	DynTable debug = { 0 };
	DynTable id_form = { 0 };
	DynTable session = { 0 };
	DynBuffer *sql = NULL;
	DynTableCell *imgpath;
	char printbuf[1024];

	/* Get session, form & id_obj values from argc/argv data if not available from CGI data */
	if(!dyntab_sz(&cntxt->session, 0, 0))
	{
		if(cntxt->argc > 1) DYNTAB_ADD(&cntxt->session, 0, 0, cntxt->argv[1], 0, NO_CONV);
		if(cntxt->argc > 2) DYNTAB_ADD(&cntxt->id_form, 0, 0, cntxt->argv[2], 0, NO_CONV);
		if(cntxt->argc > 3) DYNTAB_ADD(&cntxt->id_obj, 0, 0, cntxt->argv[3], 0, NO_CONV);
	}

	/* Read server configuration data */
	if(qry_obj_data(cntxt, &cntxt->cnf_data, &cntxt->id_cnf, NULL)) STACK_ERROR;
	if(!cntxt->cnf_data.nbrows) RETURN_ERROR("Configuration du serveur incorrecte", NULL);

	/* Read homepage, menubar & images folder settings */
	DYNTAB_FIELD(&cntxt->homepage, &cntxt->cnf_data, HOMEPAGE);
	DYNTAB_FIELD(&cntxt->menubar, &cntxt->cnf_data, MENUBAR);
	imgpath = DYNTAB_FIELD_CELL(&cntxt->cnf_data, IMGPATH);
	if(imgpath)
	{
		cntxt->imgpath = imgpath->txt;
		cntxt->imgpath_sz = imgpath->len;
	}

	/* Read unidentified user in server config */
	DYNTAB_FIELD(&unknownuser, &cntxt->cnf_data, UNKNOWNUSER);

	/* Read value constants */
	if(sql_id_value(cntxt, add_sz_str("_EVA_FORMSTAMP"), &cntxt->val_FORMSTAMP)) STACK_ERROR;

	/* Read existing session & user data */
	if(dyntab_sz(&cntxt->session, 0, 0)) 
	{
		/* Read session & user data */
		if(qry_obj_data(cntxt, &session, &cntxt->session, NULL)) STACK_ERROR;
		DYNTAB_FIELD(&id_user, &session, USER);
		if(qry_obj_data(cntxt, &cntxt->user_data, &cntxt->id_user, NULL)) STACK_ERROR;
	}

	/* Read login & password from CGI data */
	if(cgi_filter_values(cntxt, &login, 'D', ~0UL, ~0UL, ~0UL, "_EVA_LOGINSUBMIT", NULL, 0, 0) ||
		cgi_filter_values(cntxt, &passwd, 'D', ~0UL, ~0UL, ~0UL, "_EVA_LOGINSUBMITP", NULL, 0, 0))
		STACK_ERROR;
	CGI_VALUES_DONTKEEP(&login);
	CGI_VALUES_DONTKEEP(&passwd);

	/* Check login if given */
	if(dyntab_sz(&login, 0, 0))
	{
		unsigned long id_login, id_pwd;
		if(	sql_id_value(cntxt, add_sz_str("_EVA_LOGIN"), &id_login) ||
			sql_id_value(cntxt, add_sz_str("_EVA_PASSWORD"), &id_pwd)) STACK_ERROR;
		DYNBUF_ADD3_INT(&sql, 
					"-- check_login : check ident / pwd validity\n"
					"SELECT TLink.IdObj FROM TLink \n"
					"INNER JOIN TVal AS VLogin ON TLink.IdValue=VLogin.IdValue \n"
					"INNER JOIN TLink AS TPasswd ON TLink.IdObj=TPasswd.IdObj \n"
					"INNER JOIN TVal AS VPasswd ON TPasswd.IdValue=VPasswd.IdValue \n"
					"WHERE TLink.DateDel IS NULL \nAND TLink.IdField=" , id_login, " \n");
		DYNBUF_ADD3_CELL(&sql, 
					"AND VLogin.TxtValue='", &login, 0, 0, SQL_NO_QUOTE, "'\n");
		DYNBUF_ADD3_INT(&sql, 
					"AND TPasswd.DateDel IS NULL \nAND TPasswd.IdField=", id_pwd, " \n");
		DYNBUF_ADD3_CELL(&sql, 
					"AND VPasswd.TxtValue='", &passwd, 0, 0, SQL_NO_QUOTE, "'");
		if(sql_exec_query(cntxt, sql->data) || sql_get_table(cntxt, &sqlres, 2)) STACK_ERROR;
		M_FREE(sql);

		/* If user identification ok */
		if(sqlres.nbrows)
		{
			/* Set id_user & load user data */
			DYNTAB_ADD_CELL(&cntxt->id_user, 0, 0, &sqlres, 0, 0);
			if(qry_obj_data(cntxt, &cntxt->user_data, &cntxt->id_user, NULL)) STACK_ERROR;

			/* End current session if user was identified */
			if(id_user.nbrows && dyntab_cmp(&id_user, 0, 0, &unknownuser, 0, 0))
				DYNTAB_FREE(cntxt->session);
		}
		else
		{
			/* Output message if bad identification */
			output_message(cntxt, "Agent de sécurité", "Identification incorrecte");
			RETURN_OK;
		}
	}

	/* If a session id is given */
	if(dyntab_sz(&cntxt->session, 0, 0)) 
	{
		/* If session record exist : check session validity */
		if(session.nbrows && id_user.nbrows)
		{
			char *dlg = NULL;
			/* Check session expiration on user IP */
			if(cntxt->user_ip && cntxt->user_ip[0] &&
				strcmp(cntxt->user_ip, DYNTAB_FIELD_VAL(&session, USER_IP)))
				dlg = "Votre session n'est plus valide (l'adresse IP a changé)";
			/* Check session termination */
			else if(DYNTAB_FIELD_CELL(&session, TERMINATE))
				dlg = "Cette session est terminée";
			else
			{
				/* Check session expiration on total time */
				int maxusr = strtoul(DYNTAB_FIELD_VAL(&cntxt->user_data, "MAX_SESSION_DURATION"), NULL, 10);
				int maxsrv = strtoul(DYNTAB_FIELD_VAL(&cntxt->cnf_data, "MAX_SESSION_DURATION"), NULL, 10);
				char fmt = 'm';
				int minutes;
 				if(qry_get_rec_info(cntxt, &debug, DYNTAB_FIELD_CELL(&session, FORMSTAMP)->Pkey, "DateCr")) STACK_ERROR; 
				minutes = datetxt_to_age(dyntab_val(&debug, 0, 0), cntxt->timestamp, &fmt);
				if(maxsrv > maxusr) maxsrv = maxusr;
				if(!maxsrv || maxsrv > 1440) maxsrv = 1440;
				if(minutes < 0 || minutes > maxsrv || fmt != 'm')
					dlg = "Votre session n'est plus valide (durée maximum dépassée)";
			}

			/* If session is no longer valid */
			if(dlg)
			{
				/* Output identification dialog */
				output_message(cntxt, "Agent de sécurité", dlg);
				cntxt->txsize += printf(
					"Merci de vous identifier pour continuer votre travail<br><br>"
					"<table noborder width=100%% bgcolor=#FFFFFF>"
					"<tr><td align=right width=50%%><font size=-1 color=#0000AA>"
						"Identifiant</font></td><td><input type=password name='D$#_EVA_LOGINSUBMIT'></td></tr>"
					"<tr><td align=right><font size=-1 color=#0000AA>"
						"Mot de passe</font></td><td><input type=password name='D$#_EVA_LOGINSUBMITP'></td></tr></table>"
					"<br><input type=submit value=\"Valider l'identification\"><br><br>");
				if(cntxt->jsenabled) cntxt->txsize += printf(
					"<script>document.mainform['D$#_EVA_LOGINSUBMIT'].focus();</script>");
				cntxt->b_terminate = 15;
				RETURN_OK;
			}
			else
			{
				/* Session is valid : set id_user */
				if(!cntxt->id_user.nbrows)
					DYNTAB_ADD_CELL(&cntxt->id_user, 0, 0, &id_user, id_user.nbrows-1, 0);
			}
		}
		else
			DYNTAB_FREE(cntxt->session);
	}

	/* Set user identification status - use unknown user account if not identified */
	cntxt->b_user_ok = dyntab_sz(&cntxt->id_user, 0, 0) && dyntab_cmp(&cntxt->id_user, 0, 0, &unknownuser, 0, 0);
	if(!dyntab_sz(&cntxt->id_user, 0, 0)) DYNTAB_ADD_CELL(&cntxt->id_user, 0, 0, &unknownuser, 0, 0);
	if(qry_obj_data(cntxt, &cntxt->user_data, &cntxt->id_user, NULL)) STACK_ERROR;

	/* Ignore user if no data available */
	if(!cntxt->user_data.nbrows)
	{
		cntxt->b_user_ok = 0;
		DYNTAB_FREE(cntxt->id_user);
	}

	/* Check account validity */
	else if(DYNTAB_FIELD_CELL(&cntxt->user_data, DEACTIVATE))
	{
		/* Output message if account deactivated */
		output_message(cntxt, "Agent de sécurité", "Votre compte est désactivé");
		RETURN_OK;
	}

	/* If user account is available */
	if(dyntab_sz(&cntxt->id_user, 0, 0))
	{
		/* Select home page, menubar & images path */
		unsigned long i;
		DynTableCell *homepage = dyntab_field_cell(&cntxt->user_data, "_EVA_HOMEPAGE", 0, 1, 0);
		DynTableCell *menubar = dyntab_field_cell(&cntxt->user_data, "_EVA_MENUBAR", 0, 1, 0);
		char *maxjoinusr = dyntab_field_val(&cntxt->user_data, "_EVA_MAXJOIN", 0, 1, 0);
		unsigned long maxjoin = strtoul(*maxjoinusr ? maxjoinusr : dyntab_field_val(&cntxt->cnf_data, "_EVA_MAXJOIN", 0, 1, 0), NULL, 10);
		if(homepage) DYNTAB_SET_CELLP(&cntxt->homepage, 0, 0, homepage);
		if(menubar) DYNTAB_SET_CELLP(&cntxt->menubar, 0, 0, menubar);
		imgpath = DYNTAB_FIELD_CELL(&cntxt->user_data, IMGPATH);
		if(imgpath)
		{
			cntxt->imgpath = imgpath->txt;
			cntxt->imgpath_sz = imgpath->len;
		}

		/* Save uploaded files (if any) for identified users */
		if(cgi_save_files(cntxt)) STACK_ERROR;

		/* Set max query time if applicable */
		if(maxjoin)
		{
			snprintf(add_sz_str(printbuf), "SET SESSION max_join_size=%lu", 1000 * maxjoin);
			if(sql_exec_query(cntxt, printbuf)) STACK_ERROR;
		}

		/* If session opened & user has changed : update user in session data */
		if(dyntab_sz(&cntxt->session, 0, 0) && cntxt->b_user_ok && 
				dyntab_cmp(&cntxt->id_user, 0, 0, &id_user, 0, 0))
		{
			snprintf(add_sz_str(printbuf), "UPDATE TLink SET IdRelObj=%lu,DateCr='%s' WHERE Pkey=%lu", 
											DYNTAB_TOUL(&cntxt->id_user), cntxt->timestamp, id_user.cell->Pkey);
			if(sql_exec_query(cntxt, printbuf)) STACK_ERROR;
		}

		/* Set debug options */
		DYNTAB_FIELD(&debug, &cntxt->user_data, DEBUG);
		if(debug.nbrows) for(i = 0; i < debug.nbrows; i++)
		{
			char * dbg = dyntab_val(&debug, i, 0);
			if(!strcmp(dbg, "_EVA_TRACE_CGI"))
			{
				if(!(cntxt->debug & DEBUG_CGI_RAW)) cgi_trace_input(cntxt);
			}
			else if(!strcmp(dbg, "_EVA_DEBUG_CGI")) cntxt->debug |= DEBUG_CGI;
			else if(!strcmp(dbg, "_EVA_DEBUG_SQL")) cntxt->debug |= DEBUG_SQL;
			else if(!strcmp(dbg, "_EVA_DEBUG_SQL_RES")) cntxt->debug |= DEBUG_SQL_RES;
			else if(!strcmp(dbg, "_EVA_DEBUG_SQL_SLOW")) cntxt->debug |= DEBUG_SQL_SLOW;
			else if(!strcmp(dbg, "_EVA_DEBUG_ENV")) cntxt->debug |= DEBUG_ENV;
			else if(!strcmp(dbg, "_EVA_DEBUG_HTML")) cntxt->debug |= DEBUG_HTML;
			else if(!strcmp(dbg, "_EVA_TRACE_HTML")) cntxt->debug |= DEBUG_HTML_RAW;
		}
		if(*DYNTAB_FIELD_VAL(&cntxt->user_data, TRACEOUTPUT)) cntxt->debug |= DEBUG_HTML_RAW;

		/* Set option button mode */
		{
			char *optbtnmode = dyntab_field_val(&cntxt->user_data, "_EVA_OPTIONBUTTON", 0, 1, 0);
			cntxt->opt_btn_mode =	!strcmp(optbtnmode, "_EVA_NONE") ? OptBtn_None :
									(!*optbtnmode || !strcmp(optbtnmode, "_EVA_HELP")) ? OptBtn_Help :
									!strcmp(optbtnmode, "_EVA_OPENSAME") ? OptBtn_OpenSame : OptBtn_OpenBottom;
		}

		/* Output debug info */
		debug_put_info(cntxt);
	}
	else
	{
		/* Set next form to default login */
		if(form_set_homepage(cntxt)) STACK_ERROR;
	}

	/* Handle IP filter */	
	if(strcmp(cntxt->user_ip, "127.0.0.1"))
	{
		/* Get user or server filter */
		char *filtmode = DYNTAB_FIELD_VAL(&cntxt->user_data, IP_FILTER);
		DYNTAB_FIELD(&debug, &cntxt->user_data, ACCESS_IP);
		if(!*filtmode)
		{
			filtmode = DYNTAB_FIELD_VAL(&cntxt->cnf_data, IP_FILTER);
			DYNTAB_FIELD(&debug, &cntxt->cnf_data, ACCESS_IP);
		}

		/* Check if ip filtering active */
		if(*filtmode && debug.nbrows)
		{
			/* Check if user IP is in given address list */
			unsigned long i;
			for(i = 0; i < debug.nbrows; i++)
			{
				DynTableCell *c = dyntab_cell(&debug, i, 0);
				if(!strncmp(cntxt->user_ip, c->txt, c->len)) break;
			}

			/* Handle allow / deny mode to grant access */
			if(strcmp(filtmode, "_EVA_ALLOW") ? i < debug.nbrows : i == debug.nbrows)
			{
				/* Access denied : output message & terminate */
				put_html_page_header(cntxt, NULL, "Serveur EVA - accès refusé", NULL, 3);
				cntxt->txsize += printf(
					"<font face=Arial><center>"
					"<br><br><u>Agent de sécurité</u><br><br>"
					"<hr><b><font size=+1 color=#886600>Vous n'êtes pas autorisé à accéder à ce serveur</font></b><hr>"
					"<br>Motif : adresse IP non conforme<br><br>"
					"<br>Contactez l'administrateur pour obtenir l'accès<br><br>");
				cntxt->b_terminate = 15;
			}
		}
	}

	RETURN_OK_CLEANUP;
}
#undef ERR_FUNCTION
#undef ERR_CLEANUP
