/*********************************************************************
** ---------------------- Copyright notice ---------------------------
** This source code is part of the EVASoft project
** It is property of Alain Boute Ingenierie - www.abing.fr and is
** distributed under the GNU Public Licence version 2
** Commercial use is submited to licencing - contact eva@abing.fr
** -------------------------------------------------------------------
**        File : eva_cgi.c
** Description : main entry point for CGI interface
**      Author : Alain BOUTE
**     Created : Aug 13 2001
*********************************************************************/

#include "eva.h"
#include "json_result.h"

EVA_context *Cntxt;

/*********************************************************************
** Function : main
** Description : executable entry point
*********************************************************************/
int main(int argc, char **argv, char **envp)
{
	EVA_context c = {0}, *cntxt = &c;
	int t0;
	size_t i;

	/* Set process time counters */
	if(gettimeofday(&cntxt->tm0, NULL))
        cntxt->tm0.tv_usec = 0;
	strcpy(cntxt->timestamp, datetxt_now());
	datetxt_to_time(cntxt->timestamp, &cntxt->tcur, NULL);

	/* Initialize context */
	Cntxt = cntxt;
	cntxt->argc = argc;
	cntxt->argv = argv;
	cntxt->envp = envp;

	/* Extract DB name from executable path (basename) */
	cntxt->dbname = fbasename(argv[0], 0);
	cntxt->path = mem_strdup(cntxt->argv[0]);
	cntxt->path[cntxt->dbname - cntxt->argv[0]] = 0;
	cntxt->rootdir = mem_strdup(cntxt->path);
	cntxt->rootdir[cntxt->dbname - cntxt->argv[0] - 4] = 0;
	cntxt->rootdir1 = mem_strdup(cntxt->rootdir);
	for(i = 0; cntxt->rootdir[i]; i++) if(cntxt->rootdir[i] == '\\') cntxt->rootdir1[i] = '/';
	cntxt->dbname = mem_strdup(cntxt->dbname);
	cntxt->dbname[strlen(cntxt->dbname)-4] = 0;

	/* Read environments variables */
	cntxt->user_ip = getenv("REMOTE_ADDR");
	cntxt->qrystr = getenv("QUERY_STRING"); if(!cntxt->qrystr) cntxt->qrystr = "";
	cntxt->user_agent = getenv("HTTP_USER_AGENT");
	cntxt->srvname = getenv("SERVER_NAME");
	cntxt->requri = getenv("REQUEST_URI");

	/* Initialize random generator */
	srand((unsigned int)(getpid() ^ time(NULL)));

	/* Initialize SQL library */
	sql_control(NULL, 5);

	/* Initialize memory trace file */
	MEM_TRACE(NULL, NULL);

	/* Handle GET calls with query string */
	if(cntxt->qrystr && *cntxt->qrystr)
	{
		if(!strncmp(cntxt->qrystr, add_sz_str("MailRead")))
		{
			/* Mail read : set read field in object */
			char *idobj = strchr(cntxt->qrystr, '=');
			char *ua = cntxt->user_agent ? cntxt->user_agent : "Unknown";
			unsigned long id = idobj ? strtoul(idobj + 1, NULL, 10) : 0;
			if(id && qry_check_idobj(cntxt, id)) qry_add_idobj_field_val(cntxt, id, "_EVA_MAIL_READ", ua, strlen(ua), 1, 0, 0);
			puts("Location: /img/_eva_nop.gif\r\n");
			sql_control(NULL, 6);
			return 0;
		}
#ifdef PAYSITE
		else if(!strncmp(cntxt->qrystr, add_sz_str("TPE=")))
		{
			/* Payment transaction result : call handler */
		 	action_pay_site(cntxt, 0);
			sql_control(NULL, 6);
			return 0;
		}
#endif
    }

	/* Handle scheduled actions */
	if(argc == 2 && (!strcmp(argv[1], "DayTask") || !strcmp(argv[1], "HourTask")))
	{
		taskplan_sequence(cntxt, argv[1]);
		sql_control(NULL, 6);
		return 0;
	}

	/* Read	CGI input data */
	if (cgi_read_data(cntxt)) cntxt->b_terminate |= 32;

	/* Handle web service call thru JSON or CGI data */
	if (cntxt->ws_query || cntxt->cgi && cntxt->nb_cgi > 1 && !strcmp(cntxt->cgi[1].name, "WS_QUERY"))
	{
		/* Process query && return json data */
		if(!cntxt->ws_query) cntxt->ws_query = cntxt->cgi[1].value;
		json_result(cntxt);
		output_log_end(cntxt);
		sql_control(NULL, 6);
		return 0;
	}

	/* Initialize call data */
	if(!cgi_init_call(cntxt))
	{
		DynBuffer *title = NULL;
		unsigned long idform = 0, idobj = 0;

		/* Handle page title on OpenForm call */
		if(sscanf(cntxt->qrystr, "OpenForm=%lu,%lu", &idform, &idobj) == 2 && idform)
		{
			dynbuf_add(&title, cntxt->dbname, strlen(cntxt->dbname), TO_HTML);
			dynbuf_add(&title, add_sz_str(" - "), NO_CONV);
			qry_obj_label(cntxt, &title, NULL, NULL, &title, NULL, NULL, NULL, NULL, idform, NULL, idobj);
		}

		/* Output page header (HTML header) */
		put_html_page_header(cntxt, NULL, title ? title->data : NULL, NULL, 1);
		M_FREE(title);
		fflush(stdout);

		/* Check login & process form */
		if(!check_login(cntxt))
		{
			/* Output page header (background & wait message) */
			put_html_page_header(cntxt, NULL, NULL, NULL, 2);
			process_form(cntxt);
		}
	}

	/* Output page header (form) */
	t0 = ms_since(&cntxt->tm0);
	put_html_page_header(cntxt, NULL, NULL, NULL, 3);

	if(!(cntxt->b_terminate & 64))
	{
		/* Output session data as hidden input : , , , ,  */
		cntxt->txsize += printf("<input type=hidden name=S value=%s$%s$%s$%s$%s>\n"
				,dyntab_val(&cntxt->session, 0, 0)	/* session id */
				,dyntab_val(&cntxt->id_form, 0, 0)	/* current form id */
				,dyntab_val(&cntxt->id_obj, 0, 0)	/* current object id */
				,dyntab_val(&cntxt->alt_form, 0, 0)	/* alternate form id */
				,dyntab_val(&cntxt->alt_obj, 0, 0)	/* current object id in alternate form */
				);

		/* Output page data */
		if(cntxt->err.text) put_html_error(cntxt);
		else
		{
			debug_put_cgi(cntxt);
			if(cntxt->htmlhidden) cntxt->txsize += printf("%s", cntxt->htmlhidden->data);
			if(cntxt->html0) cntxt->txsize += printf("%s", cntxt->html0->data);
			if(cntxt->html) cntxt->txsize += printf("%s", cntxt->html->data);
			if(cntxt->html1) cntxt->txsize += printf("%s", cntxt->html1->data);
		}
	}

	/* Output page trailer & log end */
	put_html_page_trailer(cntxt, NULL);
	cntxt->txtime = ms_since(&cntxt->tm0) - t0;
	output_log_end(cntxt);

	/* Output HTML trace if applicable */
	if(cntxt->debug & DEBUG_HTML_RAW)
	{
        struct stat fs;
		FILE *f = NULL;
        char fname[1024];
        fname[sizeof(fname)-1] = 0;
        snprintf(fname, sizeof(fname)-1, "%strace", cntxt->rootdir);
        if(!stat(fname, &fs) || !MKDIR(fname))
        {
            snprintf(fname, sizeof(fname)-1, "%strace" DD "%s-%s.html", cntxt->rootdir, cntxt->dbname, dyntab_val(&cntxt->id_user, 0, 0));
            f = fopen(fname, "w");
            if(f)
            {
                cntxt->b_header = 0;
                cntxt->b_bodyheader = 0;
                cntxt->b_formheader = 0;
                put_html_page_header(cntxt, f, "Trace utilisateur - rafraichissement toutes les 10 secondes", NULL, 3);
                fprintf(f, "%s%s%s%lu%s",
                    "<table noborder width=100%><tr><td align=center><b>Navigation partag�e - copie d'�cran </b></td><td>"
                    "<input type=submit name=TraceRefresh value='Afficher la page suivante' "
                            "Onclick=\"window.location.href='/trace/", cntxt->dbname, "-", DYNTAB_TOUL(&cntxt->id_user), ".html'\"></td></tr></table>");
                if(cntxt->err.text)
                    fprintf(f,
                        "<font face=Arial><b><u>*** Erreur : </u><a href='../errlog/%s'>%s</a>", cntxt->err.file, cntxt->err.text);
                else
                {
                    if(cntxt->html0) fputs(cntxt->html0->data, f);
                    if(cntxt->html) fputs(cntxt->html->data, f);
                    if(cntxt->html1) fputs(cntxt->html1->data, f);
                }

                /* Set refresh timeout */
                fprintf(f, "%s%s%s%lu%s",
                    "<script type=text/javascript>"
                    "setTimeout('window.location.href=\"/trace/", cntxt->dbname, "-", DYNTAB_TOUL(&cntxt->id_user), ".html\"',10000);"
                    "document.mainform['TraceRefresh'].focus();</script>");
                put_html_page_trailer(cntxt, f);
                fclose(f);
            }
        }
	}
	sql_control(NULL, 6);
	return 0;
}

