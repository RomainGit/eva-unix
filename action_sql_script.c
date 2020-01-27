/*********************************************************************
**        File : action_sql_script.c
** Description : handling fonctions for update actions
**      Author : Alain BOUTE
**     Created : May 19 2004
*********************************************************************/

#include "eva.h"


/*********************************************************************
** Function : action_sql_script
** Description : button click handler for SQL_SCRIPT
*********************************************************************/
#define ERR_FUNCTION "action_sql_script"
#define ERR_CLEANUP	M_FREE(sql); \
					DYNTAB_FREE(res); \
					cntxt->sql_trace = sql_trace;
int action_sql_script(				/* return : 0 on success, other on error */
	EVA_context *cntxt,				/* in/out : execution context data */
	unsigned long i_ctrl			/* in : control index in cntxt->form->ctrl */
){
	EVA_form *form = cntxt->form;
	EVA_ctrl *ctrl = form->ctrl + i_ctrl;
	char *script = CTRL_ATTR_VAL(SQL_SCRIPT);
	char *next = script;
	DynBuffer *sql = NULL;
	DynBuffer *buf = NULL;
	DynBuffer **html;
	DynTable res = {0};
	unsigned long cnt = 0;
	int sql_trace = cntxt->sql_trace;

	/* Output page header */
	cntxt->jsfunc = 1;
	put_html_page_header(cntxt, NULL, "Importer des données", NULL, 3);
	cntxt->form->html = &buf;
	html = &buf;
	cntxt->b_terminate = 15;
	printf("<font face=Arial><center><b>Exécution d'un script de commandes SQL : %s</b></center><hr>", ctrl->LABEL);
	fflush(stdout);

	/* For each SQL command */
	cntxt->sql_trace = 0x1000000L;
	while(next && *next)
	{
		char *end = strstr(next, ";\n");
		if(!end) end = next + strlen(next);
		if(end > next)
		{
			/* Display & exec next query */
			cnt++;
			M_FREE(sql);
			M_FREE(buf);
			DYNBUF_ADD(&sql, next, end - next, NO_CONV);
			DYNBUF_ADD_BUF(html, sql, TO_HTML);
			printf("<br><u>Commande n° %lu</u><br><font face=Courier size=-1><b>%s</b></font>", cnt, buf->data);
			fflush(stdout);
			if(sql_exec_query(cntxt, sql->data))
			{
				/* SQL error : display & stop processing */
				M_FREE(buf);
				DYNBUF_ADD_BUF(html, cntxt->debug_msg, TO_HTML);
				M_FREE(cntxt->debug_msg);
				printf("<br><font face=Courier>%s</font>", buf ? buf->data : "???");
				CLEAR_ERROR_NOWARN;
				break;
			}
			else if(cntxt->sql_result)
			{
				/* There is a result to display : get result table */
				unsigned long i, j;
				if(sql_get_table(cntxt, &res, 3)) STACK_ERROR;

				/* Display as HTML table */
				M_FREE(buf);
				DYNBUF_ADD_STR(html, "<table border>");
				for(i = 0; i < res.nbrows; i++)
				{
					DYNBUF_ADD_STR(html, "<tr>");
					for(j = 0; j < res.nbcols; j++)
						DYNBUF_ADD3_CELL(html, "<td>", &res, i, j, TO_HTML, "</td>");
					DYNBUF_ADD_STR(html, "</tr>");
				}
				DYNBUF_ADD_STR(html, "</table>");
				printf("<br><u>Résultat : %lu lignes - %.2f s</u><br>%s", res.nbrows, cntxt->sql_restime, buf->data);
			}
			else
			{
				/* No result to display : output affected rows */
				printf("<br><u>Résultat : %lu lignes modifiées - %.2f s</u><br>", cntxt->sql_nbrows, cntxt->sql_restime);
			}
		}
		next = end;
		if(*next == ';') next++;
		while(*next == '\n') next++;
	}

	/* Output footer */
	M_FREE(buf);
	if(put_html_button(cntxt, "NOP", "Revenir", "_eva_btn_gobackobj_fr.gif", "_eva_btn_gobackobj_fr_s.gif",
							"Retourne à la page précédente", 0, 0)) STACK_ERROR;
	printf("<center><br><br>%s<br><br>", buf->data);

	RETURN_OK_CLEANUP;
}
#undef ERR_FUNCTION
#undef ERR_CLEANUP
