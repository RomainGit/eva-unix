/*********************************************************************
**        File : ctrl_input_rel.c
** Description : handling functions for relation input controls
**      Author : Alain BOUTE
**     Created : Apr 2 2002
*********************************************************************/

#include "eva.h"

/*********************************************************************
** Function : ctrl_relation_optionslist
** Description : prepare id / label options table for a relation input list
*********************************************************************/
#define ERR_FUNCTION "ctrl_relation_optionslist"
#define ERR_CLEANUP	M_FREE(val); \
					DYNTAB_FREE(objdata)
int ctrl_relation_optionslist(			/* return : 0 on success, other on error */
	EVA_context *cntxt,					/* in/out : execution context data */
	unsigned long i_ctrl,				/* in : control index in cntxt->form->ctrl */
	DynTable *optlist					/* out : options list */
){
	EVA_form *form = cntxt->form;
	EVA_ctrl *ctrl = form->ctrl + i_ctrl;
	ObjTableFormat *tbl = ctrl->objtbl;
	DynTable objdata = { 0 };
	DynBuffer *val = NULL;
	unsigned long i, j;

	/* Initialize list status & values : blank line & objects ids */
	if(tbl->input[0] && !ctrl->val.nbrows) tbl->status |= TblCtrl_opensearch;
	for(i = 0; i < tbl->idobj.nbrows; i++) DYNTAB_SET_CELL(optlist, i + 1, 0, &tbl->idobj, i, 0);

	/* Add objects in ctrl->val not in optlist */
	for(i = 0; i < ctrl->val.nbrows; i++)
	{
		char *id = dyntab_val(&ctrl->val, i, 0);
		for(j = 0; j < optlist->nbrows && strcmp(id, dyntab_val(optlist, j, 0)); j++);
		if(j == optlist->nbrows) DYNTAB_SET_CELL(optlist, j ? j : 1, 0, &ctrl->val, i, 0);
	}

	/* Set labels for values */
	for(i = 1; i < optlist->nbrows; i++)
	{
		unsigned long idobj = DYNTAB_TOULRC(optlist, i, 0);
		if(!idobj) 
		{
			M_FREE(val);
			DYNBUF_ADD3_CELL(&val, "#NAR# : ", optlist, i, 0, NO_CONV, "");
			DYNTAB_ADD_BUF(optlist, i, 1, val);
			continue;
		}
		else
		{
			if(qry_obj_idfield(cntxt, &objdata, idobj, 0) ||
				qry_obj_label(cntxt, NULL, NULL, NULL, &val, NULL, NULL, NULL, NULL, 0, &objdata, 0))
				CLEAR_ERROR;
			if(!val) DYNBUF_ADD3_INT(&val, "Fiche n° ", idobj, "")
			else if(val->cnt > 100) val->cnt = 97 + sprintf(val->data + 97, " ...");
			DYNTAB_ADD_BUF(optlist, i, 1, val);
		}
	}
	dyntab_sort(optlist, qsort_col1);

	RETURN_OK_CLEANUP;
}
#undef ERR_FUNCTION
#undef ERR_CLEANUP

/*********************************************************************
** Function : ctrl_relation_searchlist
** Description : read search results for relation input
*********************************************************************/
#define ERR_FUNCTION "ctrl_relation_searchlist"
#define ERR_CLEANUP 
int ctrl_relation_searchlist(		/* return : 0 on success, other on error */
	EVA_context *cntxt,				/* in/out : execution context data */
	unsigned long i_ctrl			/* in : control index in cntxt->form->ctrl */
){
	EVA_form *form = cntxt->form;
	EVA_ctrl *ctrl = form->ctrl + i_ctrl;
	ObjTableFormat *tbl = ctrl->objtbl;

	/* Exec query for objects if not executed */
	if(tbl->idobj.nbcols) RETURN_OK;

	if(table_word_search(cntxt, i_ctrl) ||
		sql_exec_query(cntxt, "SELECT DISTINCT IdObj FROM IdList ORDER BY IdObj DESC LIMIT 50") || 
		sql_get_table(cntxt, &tbl->idobj, 2)) CLEAR_ERROR;
	if(sql_exec_query(cntxt, "DROP TABLE IF EXISTS IdList")) CLEAR_ERROR;
	tbl->idobj.nbcols = 1;

	RETURN_OK_CLEANUP;
}
#undef ERR_FUNCTION
#undef ERR_CLEANUP

/*********************************************************************
** Function : handle_auto_selection
** Description : handle automatic selection after search for relation input
*********************************************************************/
#define ERR_FUNCTION "handle_auto_selection"
#define ERR_CLEANUP 
int handle_auto_selection(			/* return : 0 on success, other on error */
	EVA_context *cntxt,				/* in/out : execution context data */
	unsigned long i_ctrl,			/* in : control index in cntxt->form->ctrl */
	int mode						/* in : bit mask - selection mode
										bit 1 : select when no values if not set / add values if set & b_multiple
										bit 2 : select when 1 value found if not set / add multiple values if set & b_multiple */
){
	EVA_form *form = cntxt->form;
	EVA_ctrl *ctrl = form->ctrl + i_ctrl;
	ObjTableFormat *tbl = ctrl->objtbl;
	int b_multiple = ctrl->MULTIPLE[0] != 0 && strcmp("No", ctrl->MULTIPLE);
	unsigned long i, j;

	/* Ckeck each non empty user input */
	for(i = 0; i < tbl->cgiinput.nbrows; i++) if(dyntab_sz(&tbl->cgiinput, i, 0))
	{
		/* Count # of values for the line */
		DynTableCell *c = dyntab_cell(&tbl->cgiinput, i, 0);
		unsigned long nbval = 0, num = 0;
		for(j = 0; j < ctrl->val.nbrows; j++) 
		{
			DynTableCell *c1 = dyntab_cell(&ctrl->val, j, 0);
			if(c1->Line != c->Line) break;
			nbval++;
			if(num < c1->Num) num = c1->Num;
		}

		/* Exec search if applicable */
		if(!nbval || (mode & 1 && b_multiple))
		{
			int status = tbl->status;
			tbl->status |= TblCtrl_opensearch;
			tbl->input = c->txt;
			DYNTAB_FREE(tbl->idobj);
			if(ctrl_relation_searchlist(cntxt, i_ctrl)) STACK_ERROR;

			/* Store results if applicable */
			if(tbl->idobj.nbrows == 1 || (mode & 2 && tbl->idobj.nbrows && b_multiple))
			{
				if(!c->Line || c->Line == tbl->ctrlline) status &= ~TblCtrl_opensearch;
				for(j = 0; j < tbl->idobj.nbrows; j++) 
					if(ctrl_add_value(cntxt, i_ctrl, DYNTAB_VAL_SZ(&tbl->idobj, j, 0), 1, c->Line, 1)) STACK_ERROR;
				cgi_value_setkeep(cntxt, &tbl->cgiinput, i, 2);
				DYNTAB_SET(&tbl->cgiinput, i, 0, "");
			}
			else
			{
				tbl->ctrlline = c->Line;
				status |= TblCtrl_opensearch;
			}
			tbl->input = "";
			tbl->status = status;
		}
	}

	RETURN_OK_CLEANUP;
}
#undef ERR_FUNCTION
#undef ERR_CLEANUP

/*********************************************************************
** Function : handle_searchlist_selection
** Description : handle search list selection for relation input
*********************************************************************/
#define ERR_FUNCTION "handle_searchlist_selection"
#define ERR_CLEANUP DYNTAB_FREE(objdata); \
					DYNTAB_FREE(cgival)
int handle_searchlist_selection(		/* return : 0 on success, other on error */
	EVA_context *cntxt,					/* in/out : execution context data */
	unsigned long i_ctrl				/* in : control index in cntxt->form->ctrl */
){
	EVA_form *form = cntxt->form;
	EVA_ctrl *ctrl = form->ctrl + i_ctrl;
	ObjTableFormat *tbl = ctrl->objtbl;
	DynTable cgival = {0};
	DynTable objdata = { 0 };
	int b_multiple = ctrl->MULTIPLE[0] != 0 && strcmp("No", ctrl->MULTIPLE);
	unsigned long i, num = 0;

	/* Detect changes in selection */
	CTRL_GET_CGI_SUBFIELD("SEL");
	if(!(tbl->status & TblCtrl_opensearch) || cntxt->cgibtn) return 0;
	if(cgi_filter_values(cntxt, &objdata, 'M', DYNTAB_TOUL(&ctrl->id), DYNTAB_TOUL(&form->id_form), DYNTAB_TOUL(&form->id_obj),
								ctrl->FIELD, "SEL", 0, 0)) STACK_ERROR;
	if(dyntab_cmp(&cgival, 0, 0, &objdata, 0, 0) && cgival.nbrows == 1)
	{
		/* Value changed : store it */
		DynTableCell *c = dyntab_cell(&cgival, 0, 0);
		int b_del = 0;

		/* Check previous values of same line - remove if multiple not allowed or value already selected */
		for(i = ctrl->val.nbrows; i; i--)
			if(!c->Line || c->Line == dyntab_cell(&ctrl->val, i - 1, 0)->Line)
			{
				int b_same = !STRCMPNUL(c->txt, dyntab_val(&ctrl->val, i - 1, 0));
				b_del |= b_same;
				if(!b_multiple || b_same) ctrl_del_value(cntxt, i_ctrl, i - 1);
				else if(num < c->Num) num = c->Num;
			}

		/* Add new value */
		if((!b_multiple || !b_del) && c->txt && ctrl_add_value(cntxt, i_ctrl, c->txt, c->len, num + 1, c->Line, 1)) STACK_ERROR;
		if(!b_multiple) tbl->status &= ~TblCtrl_opensearch;
	}

	RETURN_OK_CLEANUP;
}
#undef ERR_FUNCTION
#undef ERR_CLEANUP

/*********************************************************************
** Function : ctrl_relation_put_values
** Description : output values list for a relation
*********************************************************************/
#define ERR_FUNCTION "ctrl_relation_put_values"
#define ERR_CLEANUP DYNTAB_FREE(objdata); \
					M_FREE(name)
int ctrl_relation_put_values(		/* return : 0 on success, other on error */
	EVA_context *cntxt,				/* in/out : execution context data */
	unsigned long i_ctrl			/* in : control index in cntxt->form->ctrl */
){
	EVA_form *form = cntxt->form;
	EVA_ctrl *ctrl = form->ctrl + i_ctrl;
	ObjTableFormat *tbl = ctrl->objtbl;
	DynTable objdata = { 0 };
	DynBuffer *name = NULL;
	unsigned long i;
	DynBuffer **html = cntxt->form->html;
	char *openbutton = CTRL_ATTR_VAL(OPENBUTTON);

	if(!ctrl->val.nbrows) return 0;
	if(!*openbutton) openbutton = "SYMBOL+LABEL+OBJNOTES";
	DYNBUF_ADD_STR(html, "<table border=0 cellpadding=1 cellspacing=0 rules=none>");
	if(tbl->lines < ctrl->val.nbrows)
	{
		DYNBUF_ADD_STR(html, "<tr bgcolor=#EEEEEE>");
		tbl->totlines = ctrl->val.nbrows;
		if(table_put_page_navigator(cntxt, i_ctrl)) STACK_ERROR;
		DYNBUF_ADD_STR(html, "</tr>");
	}
	for(i = 0; i < tbl->lines && i + tbl->line < ctrl->val.nbrows; i++) 
	{
		DYNBUF_ADD_STR(html, "<tr>"); 
		if(qry_obj_idfield(cntxt, &objdata, DYNTAB_TOULRC(&ctrl->val, i + tbl->line, 0), 0) ||
			ctrl_add_symbol_btn(cntxt, ctrl, dyntab_cell(&ctrl->val, i + tbl->line, 0), NULL, &objdata, 0,
								add_sz_str("Cliquez pour ouvrir la fiche"), "", openbutton))
			CLEAR_ERROR;
		DYNBUF_ADD_STR(html, "</tr>"); 
	}
	DYNBUF_ADD_STR(html, "</table>");
	if(table_put_status(cntxt, i_ctrl)) STACK_ERROR;

	RETURN_OK_CLEANUP;
}
#undef ERR_FUNCTION
#undef ERR_CLEANUP

/*********************************************************************
** Function : ctrl_add_relation_auto
** Description : put CONTROL=INPUT/TYPE=RELATION/INPUTMODE=<empty> controls
*********************************************************************/
#define ERR_FUNCTION "ctrl_add_relation_auto"
#define ERR_CLEANUP DYNTAB_FREE(optlist); \
					DYNTAB_FREE(objdata); \
					M_FREE(name)
int ctrl_add_relation_auto(			/* return : 0 on success, other on error */
	EVA_context *cntxt,				/* in/out : execution context data */
	unsigned long i_ctrl			/* in : control index in cntxt->form->ctrl */
){
	EVA_form *form = cntxt->form;
	EVA_ctrl *ctrl = form->ctrl + i_ctrl;
	ObjTableFormat *tbl = ctrl->objtbl;
	DynTable optlist = { 0 };
	DynTable objdata = { 0 };
	DynBuffer *name = NULL;
	unsigned long i;
	DynBuffer **html = cntxt->form->html;
	int b_linesel = 0;
	int b_label = 0;

	switch(form->step)
	{
	case CtrlRead:
		/* Read control status */
		tbl = ctrl->objtbl;
		tbl->status |= TblCtrl_search;
		tbl->minsearchlen = 0;
		if(tbl->b_first)
		{
			tbl->status &= ~TblCtrl_opensearch;
			if(!DYNTAB_FIELD_CELL(tbl->attr, SEARCHCOL))
				for(i = 0; i < tbl->field.nbrows; i++) tbl->srchcol |= 1 << i;
		}
		if(table_process_controls(cntxt, i_ctrl)) STACK_ERROR;

		/* Handle select function */
		if(handle_searchlist_selection(cntxt, i_ctrl)) STACK_ERROR;
		if(handle_auto_selection(cntxt, i_ctrl, 0)) STACK_ERROR;
		break;

	case HtmlEdit:
		b_linesel = !form->Line || !tbl->ctrlline && form->Line == 1 || tbl->ctrlline == form->Line;

		/* Enclose in table  & output controls where applicable */
		DYNBUF_ADD3_INT(html, "<table border=", tbl->status & TblCtrl_opensearch && b_linesel ? 1 : 0, " cellpadding=0 cellspacing=0><tr>");

		/* If search mode on selected line */
		if(tbl->status & TblCtrl_opensearch && b_linesel)
		{
			/* Add buttons */
			if(ctrl_relation_searchlist(cntxt, i_ctrl)) CLEAR_ERROR;
			DYNBUF_ADD_STR(html, "<td align=center rowspan=3>");
			if(table_put_closesearch_btn(cntxt, i_ctrl)) STACK_ERROR;
			if(table_put_functions_btn(cntxt, i_ctrl, add_sz_str("<br>"))) STACK_ERROR;
			DYNBUF_ADD_STR(html, "<br><br>")
			if(table_put_clear_btn(cntxt, i_ctrl)) STACK_ERROR;
 			DYNBUF_ADD_STR(html, "</td><td><table border=0 cellpadding=0 cellspacing=0><tr>");

			/* Add filters list input */
			b_label = 1;
			if(table_put_filter_list(cntxt, i_ctrl, &b_label)) STACK_ERROR;
			if(b_label) DYNBUF_ADD_STR(html, "</tr><tr>");
		
			/* Add search input */
			tbl->inputwidth = 25;
			b_label = 1;
			if(table_put_search_input(cntxt, i_ctrl, &b_label)) STACK_ERROR;
			if(b_label) DYNBUF_ADD_STR(html, "</tr><tr>");

			/* Output # of matched objects */
			DYNBUF_ADD_STR(html, "<td align=right valign=top>Résultat<br><br><font size=-1><b>");
			switch(tbl->totlines) 
			{
			case 0:
				DYNBUF_ADD_STR(html, "Aucune fiche");
				break;

			case 1:
				DYNBUF_ADD_STR(html, "1 fiche")
				break;

			default:
				DYNBUF_ADD3_INT(html, "", tbl->totlines, " fiches");
			}
			DYNBUF_ADD_STR(html, "</b></font>");

			/* Limit rows in list if applicable */
			if(tbl->idobj.nbrows > 50) tbl->idobj.nbrows = 50;

			/* Output results / selection list input */
			DYNBUF_ADD_STR(html, "</td><td>");
			CTRL_CGINAMESUBFIELD(&name, NULL, "SEL");
			if(ctrl_relation_optionslist(cntxt, i_ctrl, &optlist) ||
				put_html_list(cntxt, name, &optlist, &ctrl->val, ctrl->LINES ? ctrl->LINES + 1 : 5, 60, 0, 1, 1))
				STACK_ERROR;

			/* Output warning if partial list */
			if(tbl->idobj.nbrows < tbl->totlines)
			{
				DYNBUF_ADD_STR(html,
				"</tr><tr><td colspan=2 align=center><font size=-2 color=#EE4444>"
				"Attention : liste partielle - précisez votre recherche<br>"
				"Cette liste est limitée à 50 items (fiches les plus récentes)</font></td>");
			}
			DYNBUF_ADD_STR(html, "</tr></table></td>");

			/* Output values selection list input */
			name->data[0] = 'M';
			for(i = 0; i < optlist.nbrows; i++) if(dyntab_cell(&optlist, i, 0)->col)
			{
				DYNBUF_ADD3_BUF(html, "<input type=hidden name='", name, NO_CONV, "'");
				DYNBUF_ADD3_CELL(html, " value=", &optlist, i, 0, NO_CONV, ">");
				if(cntxt->debug & DEBUG_HTML) DYNBUF_ADD_STR(cntxt->form->html, "\n");
			}
		}
		else if(!ctrl->val.nbrows)
		{
			DYNBUF_ADD_STR(html, "<td>");
			if(table_put_opensearch_btn(cntxt, i_ctrl, NULL)) STACK_ERROR;
			if(table_put_search_input(cntxt, i_ctrl, &b_label)) STACK_ERROR;
			DYNBUF_ADD_STR(html, "</td>");
		}
		else
		{
			/* Output buttons & list for values */
			DYNBUF_ADD_STR(html, "<td>");
			if(table_put_opensearch_btn(cntxt, i_ctrl, NULL)) STACK_ERROR;
			DYNBUF_ADD_STR(html, "</td><td>");
			if(ctrl_relation_put_values(cntxt, i_ctrl)) STACK_ERROR;
			DYNBUF_ADD_STR(html, "</td><td>");
			if(table_put_clear_btn(cntxt, i_ctrl)) STACK_ERROR;
			DYNBUF_ADD_STR(html, "</td>");
		}

		/* Output hidden input for control */
		for(i = 0; !i || i < ctrl->val.nbrows; i++) if(ctrl_put_hidden(cntxt, ctrl, i)) STACK_ERROR;

		/* Output table footer */
		DYNBUF_ADD_STR(html, "</tr></table>");
		if(table_put_status(cntxt, i_ctrl)) STACK_ERROR;
	}

	RETURN_OK_CLEANUP;
}
#undef ERR_FUNCTION
#undef ERR_CLEANUP

/*********************************************************************
** Function : ctrl_relation_put_table
** Description : output a RELATION control as a table
*********************************************************************/
#define ERR_FUNCTION "ctrl_relation_put_table"
#define ERR_CLEANUP
int ctrl_relation_put_table(		/* return : 0 on success, other on error */
	EVA_context *cntxt,				/* in/out : execution context data */
	unsigned long i_ctrl			/* in : control index in cntxt->form->ctrl */
){
	EVA_form *form = cntxt->form;
	EVA_ctrl *ctrl = form->ctrl + i_ctrl;
	ObjTableFormat *tbl = ctrl->objtbl;
	if(tbl)
	{
		int b_linesel = !form->Line || !tbl->ctrlline && form->Line == 1 || tbl->ctrlline == form->Line;
		int status = tbl->status;
		if(!b_linesel)
		{
			tbl->status &= ~ TblCtrl_opensearch; 
			tbl->status &= ~TblCtrl_openaddnew;
		}
		tbl->inputwidth = 15;
		if(table_put_html_obj_list(cntxt, i_ctrl)) STACK_ERROR;
		tbl->status = status;
	}

	RETURN_OK_CLEANUP;
}
#undef ERR_FUNCTION
#undef ERR_CLEANUP

/*********************************************************************
** Function : ctrl_add_relation
** Description : handles RELATION controls
*********************************************************************/
#define ERR_FUNCTION "ctrl_add_relation"
#define ERR_CLEANUP	DYNTAB_FREE(optlist)
int ctrl_add_relation(				/* return : 0 on success, other on error */
	EVA_context *cntxt,				/* in/out : execution context data */
	unsigned long i_ctrl			/* in : control index in cntxt->form->ctrl */
){
	EVA_form *form = cntxt->form;
	EVA_ctrl *ctrl = form->ctrl + i_ctrl;
	ObjTableFormat *tbl = ctrl->objtbl;
	DynTable optlist = { 0 };
	char *inputmode = CTRL_ATTR_VAL(INPUTMODE);

	switch(form->step)
	{
	case CtrlRead:
		/* Control value is stored in IdRelObj field */
		if(ctrl->storage) ctrl->storage = 3;

		/* Read table / list parameters */
		if(table_read_controls(cntxt, i_ctrl, NULL)) STACK_ERROR;
		tbl = ctrl->objtbl;
		tbl->input = dyntab_val(&tbl->cgiinput, 0, 0);

		/* Handle display mode */
		if(!strcmp("_EVA_TABLE", inputmode))
		{
			if(table_process_controls(cntxt, i_ctrl)) STACK_ERROR;
			if(CTRL_ATTR_CELL(AUTOSEL) &&handle_auto_selection(cntxt, i_ctrl, 0)) STACK_ERROR;
		}
		else if(!strcmp("_EVA_LIST", inputmode))
		{
			if(table_process_controls(cntxt, i_ctrl)) STACK_ERROR;
		}
		else
		{
			if(ctrl_add_relation_auto(cntxt, i_ctrl)) STACK_ERROR;
		}

		/* Renumber values if applicable */
		if(!CTRL_ATTR_CELL(NORENUMBER))
			ctrl_renumber_values(ctrl, 0);
		sql_exec_query(cntxt, "DROP TABLE IF EXISTS IdList,IdListMatch,ValList");
		break;

	case HtmlEdit:
		/* Output hidden empty value if control modified, empty & not output */
		if(!form->html && !ctrl->val.nbrows && ctrl->b_modified &&
			ctrl_put_hidden(cntxt, ctrl, 0)) STACK_ERROR;
		if(!form->html) break;
		if(cntxt->debug & DEBUG_HTML) DYNBUF_ADD3(form->html, "\n<!--- Start Relation ", ctrl->LABEL, 0, NO_CONV, " -->\n");

		/* Output control position & format */
		if(ctrl_format_pos(cntxt, ctrl, 1)) STACK_ERROR;

		/* Handle display mode */
		tbl->attr = &ctrl->attr;
		tbl->input = dyntab_val(&tbl->cgiinput, form->Line ? form->Line - 1 : 0, 0);
		if(!strcmp("_EVA_TABLE", inputmode))
		{
			if(ctrl_relation_put_table(cntxt, i_ctrl)) STACK_ERROR;
		}
		else if(!strcmp("_EVA_LIST", inputmode))
		{
			/* Build options list - add warning if stripped */
			if(ctrl_relation_searchlist(cntxt, i_ctrl)) CLEAR_ERROR;
			if(ctrl_relation_optionslist(cntxt, i_ctrl, &optlist)) STACK_ERROR;

			/* Output HTML input list */
			if(ctrl_put_html_input_list(cntxt, i_ctrl, &optlist, 0)) STACK_ERROR;
		}
		else 
		{
			if(ctrl_add_relation_auto(cntxt, i_ctrl)) STACK_ERROR;
		}

		/* Renumber values if applicable */
		if(!CTRL_ATTR_CELL(NORENUMBER))
			ctrl_renumber_values(ctrl, 0);

		/* Terminate control position & format */
		if(ctrl_format_pos(cntxt, ctrl, 0)) STACK_ERROR;

		/* End control */
		sql_drop_table(cntxt, "IdList,IdListMatch,ValList");
		if(cntxt->debug & DEBUG_HTML) DYNBUF_ADD3(form->html, "\n<!--- End   Relation ", ctrl->LABEL, 0, NO_CONV, " -->\n");
		break;

	case HtmlPrint:
	case HtmlView:
		if(!form->html) break;
		tbl->attr = &ctrl->attr;
		if(cntxt->debug & DEBUG_HTML) DYNBUF_ADD3(form->html, "\n<!--- Start Relation ", ctrl->LABEL, 0, NO_CONV, " -->\n");

		/* Output control position & format */
		if(ctrl_format_pos(cntxt, ctrl, 1)) STACK_ERROR;

		/* Handle display mode */
		if(!strcmp("_EVA_TABLE", inputmode))
		{
			if(table_put_html_obj_list(cntxt, i_ctrl)) STACK_ERROR;
		}
		else 
		{
			/* Display values list */
			if(ctrl_relation_put_values(cntxt, i_ctrl)) STACK_ERROR;
		}

		/* Terminate control position & format */
		if(ctrl_format_pos(cntxt, ctrl, 0)) STACK_ERROR;

		/* Output status */
		if(table_put_status(cntxt, i_ctrl)) STACK_ERROR;
		sql_drop_table(cntxt, "IdList,IdListMatch,ValList");
		if(cntxt->debug & DEBUG_HTML) DYNBUF_ADD3(form->html, "\n<!--- End   Relation ", ctrl->LABEL, 0, NO_CONV, " -->\n");
		break;
	}

	RETURN_OK_CLEANUP;
}
#undef ERR_FUNCTION
#undef ERR_CLEANUP
