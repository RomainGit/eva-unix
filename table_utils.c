/*********************************************************************
** File : html_table.c
** Description : these functions output HTML code for formatted tables
** Author : Alain BOUTE
** Created : Feb 26 2002
**********************************************************************/

#include "eva.h"

# define LABEL_OR_FIELD_CELL(i) dyntab_cell(dyntab_sz(&tbl->label, i, 0) ? &tbl->label : &tbl->field, i, 0)

int table_export_list(EVA_context *cntxt, unsigned long i_ctrl);


/*********************************************************************
** Function : table_init_srchcol
** Description : initialize search columns for a table
*********************************************************************/
void table_init_srchcol(				/* return : 0 on success, other on error */
	ObjTableFormat *tbl					/* in : table to initialize */
){
	unsigned long i;

	/* Initialize search columns with default fields if none */
	if(!tbl->srchcol)
	{
		DynTableCell *srchcol = DYNTAB_FIELD_CELL(tbl->attr, SEARCHCOL);
		if(srchcol)
		{
			char *num = srchcol->txt;
			while(num && *num)
			{
				unsigned long col = strtoul(num, &num, 10);
				tbl->srchcol |= 1 << (col ? (col - 1) : tbl->field.nbrows);
				if(*num) num++;
			}
		}
		if(!tbl->srchcol) tbl->srchcol = 1 << tbl->field.nbrows;
	}
	if(!tbl->srchcol) tbl->srchcol = 1 << tbl->field.nbrows;
	i = unique_bit_index(tbl->srchcol);
		tbl->srchfmt = i ? dyntab_val(&tbl->format, i - 1, 0) : "";
}

/*********************************************************************
** Function : table_process_controls
** Description : process button clicks & control inputs for list & relations tables
*********************************************************************/
#define ERR_FUNCTION "table_process_controls"
#define ERR_CLEANUP DYNTAB_FREE(list); \
					DYNTAB_FREE(formstamp); \
					DYNTAB_FREE(fields); \
					DYNTAB_FREE(values); \
					DYNTAB_FREE(id_obj); \
					M_FREE(name)
int table_process_controls(				/* return : 0 on success, other on error */
	EVA_context *cntxt,					/* in/out : execution context data */
	unsigned long i_ctrl				/* in : control index in cntxt->form->ctrl */
){
	EVA_form *form = cntxt->form;
	EVA_ctrl *ctrl = form->ctrl + i_ctrl;
	ObjTableFormat *tbl = ctrl->objtbl;
	DynTable list = { 0 };
	DynTable formstamp = { 0 };
	DynTable fields = { 0 };
	DynTable values = { 0 };
	DynTable id_obj = { 0 };
	DynBuffer *name = NULL;
	unsigned long i, row;

	/* If a control button was clicked */
	if(form->i_ctrl_clic == i_ctrl)
	{
		/* Add new object if add button */
		char *btn = CGI_CLICK_BTN_SUBFIELD;
		tbl->ctrlline = cntxt->cgi[cntxt->cgibtn].Line;
		if(!strcmp(btn, "ADDNEWOBJ"))
		{
			DynTableCell *val;
			DynTableCell *inputfield = DYNTAB_FIELD_CELL(tbl->attr, DISPLAYFIELDS);

			/* Retrieve input data */
			CTRL_OPTIONAL(formstamp, LIST_CREATE_FORM);
			CTRL_READ_ATTR_TAB(fields, LIST_CREATE_FIELD);
			CTRL_READ_ATTR_TAB(values, LIST_CREATE_VALUE);
			if((tbl->status & TblCtrl_openaddnew) && inputfield && formstamp.nbrows &&
				tbl->input && tbl->input[0])
			{
				/* Prepare object data */
				DYNTAB_SET(&list, 0, 2, "V");
				DYNTAB_ADD(&list, 0, 1, tbl->input, 0, NO_CONV);
				DYNTAB_SET_CELLP(&list, 0, 0, inputfield);
				for(i = 0; i < fields.nbrows; i++)
				{
					row = list.nbrows;
					DYNTAB_SET(&list, row, 2, "V");
					DYNTAB_SET_CELL(&list, row, 1, &values, i, 0);
					DYNTAB_SET_CELL(&list, row, 0, &fields, i, 0);
				}

				/* Create new object with given formstamp */
				if(qry_add_obj_data(cntxt, &id_obj, &list, &formstamp, 0)) STACK_ERROR;

				/* Add new object to the relation at end of list */
				row = ctrl->val.nbrows;
				DYNTAB_ADD_CELL(&ctrl->val, row, 0, &id_obj, 0, 0);
				val = dyntab_cell(&ctrl->val, row, 0);
				val->b_modified = 1;
				val->i_cgi = cntxt->nb_cgi;
				ctrl_renumber_values(ctrl, 1);
				ctrl->b_modified = 1;

				/* Clear input value in CGI data to avoid multiple creation */
				tbl->input [0] = 0;
			}
		}

		/* Handle status buttons */
		else if(!strcmp(btn, "SEARCHBEGIN")) tbl->srchmode = Begin; 
		else if(!strcmp(btn, "SEARCHEXACT")) tbl->srchmode = Exact; 
		else if(!strcmp(btn, "SEARCHCONTAIN")) tbl->srchmode = Contain; 

		/* Handle status buttons */
		else if(!strcmp(btn, "OPENSEARCH")) 
		{
			tbl->status |= TblCtrl_opensearch; 
			tbl->status &= ~TblCtrl_openaddnew;
		}
		else if(!strcmp(btn, "CLOSESEARCH")) 
		{
			tbl->status &= ~TblCtrl_opensearch; 
		}
		else if(!strcmp(btn, "OPENADDNEW"))
		{
			tbl->status ^= TblCtrl_openaddnew;
			if(tbl->status & TblCtrl_openaddnew) tbl->status &= ~TblCtrl_opensearch;
		}
		else if(!strcmp(btn, "OPENSEL")) tbl->status ^= TblCtrl_opensel;
		else if(!strcmp(btn, "OPENCLOSE")) tbl->status ^= TblCtrl_openclose;
		else if(!strcmp(btn, "TOP")) tbl->line = 0;
		else if(!strcmp(btn, "PAGEUP")) tbl->line = tbl->line > tbl->lines ? tbl->line - tbl->lines : 0;
		else if(!strcmp(btn, "LINEUP")) tbl->line = tbl->line ? tbl->line - 1 : 0;
		else if(!strcmp(btn, "LINEDOWN")) tbl->line++;
		else if(!strcmp(btn, "PAGEDOWN")) tbl->line += tbl->lines;
		else if(!strcmp(btn, "BOTTOM")) tbl->line = ~0UL;
		else if(!strcmp(btn, "SHRINK")) tbl->lines /= 2;
		else if(!strcmp(btn, "EXPAND")) tbl->lines *= 2;
		else if(!strncmp(btn, add_sz_str("PAGESIZE="))) tbl->lines = atoi(btn + 9);

		/* Handle Copy button */
		else if(!strcmp(btn, "COPY"))
		{
			/* Clear current clipboard values */
			unsigned long line = cntxt->cgi[cntxt->cgibtn].Line;
			if(cgi_filter_values(cntxt, &values, 'D', 0, 0, 0, "CB", NULL, 0, 0)) STACK_ERROR;
			for(i = 0; i < values.nbrows; i++) cgi_value_setkeep(cntxt, &values, i, 2);

			/* Add new values */
			for(i = 0; i < ctrl->val.nbrows; i++)
			{
				DynTableCell *c = dyntab_cell(&ctrl->val, i, 0);
				if(!line || line == c->Line)
				{
					M_FREE(name);
					DYNBUF_ADD3_INT(&name, "D0$0#CB$", c->Num, "");
					if(cgi_add_input(cntxt, NULL, DYNBUF_VAL_SZ(name), DYNTAB_VAL_SZ(&ctrl->val, i, 0))) STACK_ERROR;
				}
			}
		}

		/* Handle Paste button */
		else if(!strcmp(btn, "PASTE"))
		{
			unsigned long line = cntxt->cgi[cntxt->cgibtn].Line, num = 0;
			for(i = 0; i < ctrl->val.nbrows; i++)
			{
				DynTableCell *c = dyntab_cell(&ctrl->val, i, 0);
				if(!line || line == c->Line && num <= c->Num) num = c->Num + 1;
			}
			if(cgi_filter_values(cntxt, &values, 'D', 0, 0, 0, "CB", NULL, 0, 0)) STACK_ERROR;
			for(i = 0; i < values.nbrows; i++)
			{
				DynTableCell *c = dyntab_cell(&values, i, 0);
				DYNTAB_ADD_NL(&ctrl->val, ctrl->val.nbrows, 0, c->txt, c->len, i + num, line, 1);
				ctrl->b_modified = 1;
			}
			tbl->status &= ~TblCtrl_opensearch; 
		}

		/* Handle PRINT mode button */
		else if(!strcmp(btn, "PRINT"))
		{
			tbl->status ^= TblCtrl_printmode; 
		}

		/* Handle Export button */
		else if(!strncmp(btn, add_sz_str("EXPORT")))
		{
			table_init_srchcol(tbl);
			if(table_export_list(cntxt, i_ctrl)) STACK_ERROR;
		}

		/* Handle Clear button */
		else if(!strncmp(btn, add_sz_str("CLEAR")))
		{
			unsigned long line = cntxt->cgi[cntxt->cgibtn].Line;
			for(i = ctrl->val.nbrows; i; i--)
				if(!line || line == dyntab_cell(&ctrl->val, i - 1, 0)->Line)
				{
					cgi_setkeep(cntxt, dyntab_cell(&ctrl->val, i - 1, 0)->i_cgi, 1);
					dyntab_del_rows(&ctrl->val, i - 1, 1);
				}
			ctrl->b_modified = 1;
		}

		/* Handle move buttons */
		else if(ctrl->val.nbrows &&! strncmp(btn, add_sz_str("MOVE")))
		{
			unsigned long dest;
			unsigned long src = cntxt->cgi[cntxt->cgibtn].Num - 1;

			/* Choose destination row */
			dest = src;
			if(!strcmp(btn, "MOVEUP")) dest = src ? src-1 : 0;
			else if(!strcmp(btn, "MOVETOP")) dest = 0;
			else if(!strcmp(btn, "MOVEDOWN")) dest = src < ctrl->val.nbrows-1 ? src+1 : src;
			else if(!strcmp(btn, "MOVEBOTTOM")) dest = ctrl->val.nbrows-1;

			/* Renumber & sort values */
			for(i = 0; i < ctrl->val.nbrows; i++)
			{
				DynTableCell *c = dyntab_cell(&ctrl->val, i, 0);
				unsigned long num = c->Num;
				c->Num = 1 + 
					(i == src ? dest : src > dest ? ((i >= dest && i < src) ? i+1 : i) : 
													((i <= dest && i > src) ? i-1 : i));
				if(num != c->Num) c->b_modified = 1;
			}
			dyntab_sort(&ctrl->val, qsort_ctrlval);
			ctrl->b_modified = 1;
		}

		/* Handle sort column buttons */
		else if(!strncmp(btn, add_sz_str("SORT")))
		{
			unsigned long sortcol = tbl->sortcol;
			int b_sortdesc = tbl->b_sortdesc;
			tbl->b_sortdesc = !strncmp(btn+4, add_sz_str("DESC"));
			tbl->sortcol = atoi(btn+(tbl->b_sortdesc ? 8 : 7));
			if(sortcol == tbl->sortcol && b_sortdesc == tbl->b_sortdesc)
				tbl->sortcol = tbl->field.nbrows;
		}

		/* Handle search column buttons */
		else if(!strncmp(btn, add_sz_str("SEARCHCOL")))
		{
			unsigned long col = 1 << atoi(btn+9);
			tbl->srchcol = col == tbl->srchcol ? 0 : col;
		}
	}

	/* Disable unused functions */
	if(!(tbl->status & TblCtrl_search)) tbl->status &= ~TblCtrl_opensearch;
	if(!(tbl->status & TblCtrl_addnew)) tbl->status &= ~TblCtrl_openaddnew;
	if(!(tbl->status & TblCtrl_opensearch)) tbl->status &= ~TblCtrl_opensel;
	if(!(tbl->status & TblCtrl_sel)) tbl->status &= ~TblCtrl_opensel;

	/* Initialize search columns */
	table_init_srchcol(tbl);

	RETURN_OK_CLEANUP;
}
#undef ERR_FUNCTION
#undef ERR_CLEANUP

/*********************************************************************
** Function : table_add_sel_chkbox
** Description : output a selection checkbox for an object
*********************************************************************/
#define ERR_FUNCTION "table_add_sel_chkbox"
#define ERR_CLEANUP M_FREE(name)
int table_add_sel_chkbox(				/* return : 0 on success, other on error */
	EVA_context *cntxt,					/* in/out : execution context data */
	EVA_ctrl *ctrl,						/* in : related control */
	unsigned long i_val,				/* in : associated control value index - checkbox is selected if not empty */
	char *selval, size_t selval_sz,		/* in : checkbox value when selected */
	char *bg_color						/* in : enclose in cell with given background color if not NULL */
){
	DynBuffer *name = NULL;
	DynTableCell *val = dyntab_cell(&ctrl->val, i_val, 0);
	CHECK_HTML_STATUS;

	/* Build checkbox name */
	if(ctrl_cgi_name(cntxt, ctrl, val, 0, &name, 0, NULL, 0)) STACK_ERROR;

	/* Output selection checkbox */
	if(bg_color) 
	{
		DYNBUF_ADD_STR(html, "<td");
		if(*bg_color) DYNBUF_ADD3(html, " bgcolor=#", bg_color, 6, NO_CONV, "");
		DYNBUF_ADD_STR(html, " width=1 align=center valign=middle>");
	}
	if(put_html_chkbox(cntxt,DYNBUF_VAL_SZ(name), selval, selval_sz, (val ? 1 : 0), 0))
		STACK_ERROR;
	if(bg_color) DYNBUF_ADD_STR(html, "</td>\n");
	if(val && !ctrl_put_hidden_old(cntxt, ctrl, i_val, name, NULL, 0)) STACK_ERROR;

	RETURN_OK_CLEANUP;
}
#undef ERR_FUNCTION
#undef ERR_CLEANUP

/*********************************************************************
** Function : table_add_searchsort_btn
** Description : output a search button for a column
*********************************************************************/
#define ERR_FUNCTION "table_add_searchsort_btn"
#define ERR_CLEANUP M_FREE(name); \
					M_FREE(subfield)
int table_add_searchsort_btn(			/* return : 0 on success, other on error */
	EVA_context *cntxt,					/* in/out : execution context data */
	EVA_ctrl *ctrl,						/* in : related control */
	unsigned long i,					/* in : column index */
	int b_search,						/* in : add search button if not 0 */
	int b_sort,							/* in : add sort buttons if not 0 */
	int b_invsort						/* in : invert sort buttons if not 0 */
){
	DynBuffer *val = NULL;
	DynBuffer *name = NULL;
	DynBuffer *subfield = NULL;
	ObjTableFormat *tbl = ctrl->objtbl;
	int j = unique_bit_index(tbl->srchcol);
	int b_sel = tbl->srchcol & (1 << i);
	CHECK_HTML_STATUS;


	/* Output search button if applicable */
	if(b_search)
	{
		DYNBUF_ADD3_INT(&subfield, "SEARCHCOL", i, "");
		CTRL_CGINAMEBTN(&name, NULL, DYNBUF_VAL_SZ(subfield));
		M_FREE(subfield);
		if(i < tbl->field.nbrows)
			DYNBUF_ADD3_CELLP(&val, "Chercher dans [", LABEL_OR_FIELD_CELL(i), NO_CONV, "]\n\n")
		else
			DYNBUF_ADD_STR(&val, "Chercher dans toutes les données des fiches\n\n");
		if(j && b_sel)
		{
			DYNBUF_ADD_STR(&val, "Recherche activée sur cette colonne\n\n"
				"Cliquez pour chercher dans les colonnes par défaut");
		}
		else if(b_sel)
		{
			DYNBUF_ADD_STR(&val, "Recherche activée sur cette colonne et sur d'autres colonnes\n\n"
				"Cliquez pour chercher uniquement dans cette colonne");
		}
		else
		{
			DYNBUF_ADD_STR(&val, "Recherche non activée sur cette colonne\n\n"
				"Cliquez pour chercher dans cette colonne");
		}
		DYNBUF_ADD_STR(html, "<td align=center valign=middle>");
		if(b_sel ?
			put_html_button(cntxt, name->data, NULL, "_eva_search2_s.gif", "_eva_search2.gif", val->data, 0, 0) :
			put_html_button(cntxt, name->data, NULL, "_eva_search2.gif", "_eva_search2_s.gif", val->data, 0, 0))
				STACK_ERROR;
		DYNBUF_ADD_STR(html, "</td>");
	}

	/* Output sort buttons */
	if(b_sort)
	{
		int b_sortdesc = b_invsort ? !tbl->b_sortdesc : tbl->b_sortdesc;
		M_FREE(val);
		if(!b_invsort) DYNBUF_ADD3_INT(&val, "SORTASC", i, "")
		else  DYNBUF_ADD3_INT(&val, "SORTDESC", i, "");
		CTRL_CGINAMEBTN(&name, NULL, DYNBUF_VAL_SZ(val));
		M_FREE(val);
		DYNBUF_ADD_STR(html, "<td align=left nowrap>");
		if(i < tbl->field.nbrows)
			DYNBUF_ADD3_CELLP(&val, "Trier [", LABEL_OR_FIELD_CELL(i), NO_CONV, "] par ordre croissant")
		else
			DYNBUF_ADD_STR(&val, "Trier par ordre de création des fiches (+ anciennes en 1er)\n\n");
		if((tbl->sortcol == i && !b_sortdesc) ?
			put_html_button(cntxt, name->data, NULL, "_eva_sort_asc_s.gif", "_eva_sort_asc.gif", val->data, 0, 0) :
			put_html_button(cntxt, name->data, NULL, "_eva_sort_asc.gif", "_eva_sort_asc_s.gif", val->data, 0, 0))
				STACK_ERROR;
		M_FREE(val);
		if(b_invsort) DYNBUF_ADD3_INT(&val, "SORTASC", i, "")
		else  DYNBUF_ADD3_INT(&val, "SORTDESC", i, "");
		CTRL_CGINAMEBTN(&name, NULL, DYNBUF_VAL_SZ(val));
		M_FREE(val);
		if(i < tbl->field.nbrows)
			DYNBUF_ADD3_CELLP(&val, "Trier [", LABEL_OR_FIELD_CELL(i), NO_CONV, "] par ordre décroissant")
		else
			DYNBUF_ADD_STR(&val, "Trier par ordre de création des fiches (+ récentes en 1er)\n\n");
		if((tbl->sortcol == i && b_sortdesc) ?
			put_html_button(cntxt, name->data, NULL, "_eva_sort_desc_s.gif", "_eva_sort_desc.gif", val->data, 0, 0) :
			put_html_button(cntxt, name->data, NULL, "_eva_sort_desc.gif", "_eva_sort_desc_s.gif", val->data, 0, 0))
				STACK_ERROR;
		M_FREE(val);
		DYNBUF_ADD_STR(html, "</td>");
	}

	RETURN_OK_CLEANUP;
}
#undef ERR_FUNCTION
#undef ERR_CLEANUP

/*********************************************************************
** Function : table_add_updown_btns
** Description : output an open button for an object
*********************************************************************/
#define ERR_FUNCTION "table_add_updown_btns"
#define ERR_CLEANUP M_FREE(tooltip); \
					M_FREE(name)
int table_add_updown_btns(				/* return : 0 on success, other on error */
	EVA_context *cntxt,					/* in/out : execution context data */
	EVA_ctrl *ctrl,						/* in : related control */
	unsigned long i_val,				/* in : control value */
	char *label, size_t sz_label,		/* in : object label for buttons tooltip */
	char *bg_color						/* in : output cell separators with given color if not NULL */
){
	DynTableCell *val = dyntab_cell(&ctrl->val, i_val, 0);
 	DynBuffer *tooltip = NULL;
	DynBuffer *name = NULL;
	int b_updown = (i_val ? 1 : 0) | (i_val < ctrl->val.nbrows - 1 ? 2 : 0);
	CHECK_HTML_STATUS;

	if(bg_color)
	{
		DYNBUF_ADD_STR(html, "<td");
		if(*bg_color) DYNBUF_ADD3(html, " bgcolor=#", bg_color, 6, NO_CONV,"");
		DYNBUF_ADD_STR(html, " width=1 align=center valign=middle>");
	}
	if(b_updown & 1 && cntxt->form->step != HtmlPrint)
	{
		/* Output top arrow button */
		M_FREE(name); M_FREE(tooltip);
		CTRL_CGINAMEBTN(&name, val, add_sz_str("MOVETOP"));
		DYNBUF_ADD3(&tooltip, "Monter [", label, sz_label, NO_CONV, "] en 1ère ligne")
		DYNBUF_ADD_STR(html, "<table cellspacing=0 cellpadding=0 border=0><tr><td>",);
		if(put_html_button(cntxt, name->data, NULL,
				"_eva_btn_arrowt_small.gif", "_eva_btn_arrowt_s_small.gif",
				tooltip->data, 0, 0))
			STACK_ERROR;
		DYNBUF_ADD_STR(html, "</td>\n<td>");

		/* Output up arrow button */
		M_FREE(name); M_FREE(tooltip);
		CTRL_CGINAMEBTN(&name, val, add_sz_str("MOVEUP"));
		DYNBUF_ADD3(&tooltip, "Monter [", label, sz_label, NO_CONV, "] d'une ligne")
		if(put_html_button(cntxt, name->data, NULL,
				"_eva_btn_arrowu_small.gif", "_eva_btn_arrowu_s_small.gif",
				tooltip->data, 0, 0))
			STACK_ERROR;
		if(b_updown & 2) DYNBUF_ADD_STR(html, "</td>\n</tr><tr><td>")
		else DYNBUF_ADD_STR(html, "</td></tr></table>")
	}

	if(b_updown & 2 && cntxt->form->step != HtmlPrint)
	{
		/* Output bottom arrow button */
		M_FREE(name); M_FREE(tooltip);
		CTRL_CGINAMEBTN(&name, val, add_sz_str("MOVEBOTTOM"));
		DYNBUF_ADD3(&tooltip, "Descendre [", label, sz_label, NO_CONV, "] en dernière ligne")
		if(!(b_updown & 1)) DYNBUF_ADD_STR(html, "<table cellspacing=0 cellpadding=0 border=0><tr><td>",);
		if(put_html_button(cntxt, name->data, NULL,
				"_eva_btn_arrowb_small.gif", "_eva_btn_arrowb_s_small.gif",
				tooltip->data, 0, 0))
			STACK_ERROR;
		M_FREE(name); M_FREE(tooltip);
		DYNBUF_ADD_STR(html, "</td>\n<td>");

		/* Output down arrow button */
		M_FREE(name); M_FREE(tooltip);
		CTRL_CGINAMEBTN(&name, val, add_sz_str("MOVEDOWN"));
		DYNBUF_ADD3(&tooltip, "Descendre [", label, sz_label, NO_CONV, "] d'une ligne")
		if(put_html_button(cntxt, name->data, NULL,
				"_eva_btn_arrowd_small.gif", "_eva_btn_arrowd_s_small.gif",
				tooltip->data, 0, 0))
			STACK_ERROR;
		M_FREE(name); M_FREE(tooltip);
		DYNBUF_ADD_STR(html, "</td></tr></table>");
	}
	if(bg_color) DYNBUF_ADD_STR(html, "</td>\n");

	RETURN_OK_CLEANUP;
}
#undef ERR_FUNCTION
#undef ERR_CLEANUP

/*********************************************************************
** Function : table_put_openclose_btn
** Description : output open / close button
*********************************************************************/
#define ERR_FUNCTION "table_put_openclose_btn"
#define ERR_CLEANUP	M_FREE(name)
int table_put_openclose_btn(			/* return : 0 on success, other on error */
	EVA_context *cntxt,					/* in/out : execution context data */
	unsigned long i_ctrl				/* in : control index in cntxt->form->ctrl */
){
	EVA_form *form = cntxt->form;
	EVA_ctrl *ctrl = form->ctrl + i_ctrl;
	DynBuffer *name = NULL;
	if(cntxt->form->step == HtmlPrint) return 0;

	CTRL_CGINAMEBTN(&name, NULL, add_sz_str("OPENCLOSE"));
	if(put_html_button(cntxt, name->data, "Afficher les fonction\n\n", "_eva_close.gif", "_eva_close_s.gif",
										"Cliquez pour afficher les fonctions de la liste", 0, 0)) STACK_ERROR;

	RETURN_OK_CLEANUP;
}
#undef ERR_FUNCTION
#undef ERR_CLEANUP

/*********************************************************************
** Function : table_put_closesearch_btn
** Description : output close search button
*********************************************************************/
#define ERR_FUNCTION "table_put_closesearch_btn"
#define ERR_CLEANUP	M_FREE(name)
int table_put_closesearch_btn(			/* return : 0 on success, other on error */
	EVA_context *cntxt,					/* in/out : execution context data */
	unsigned long i_ctrl				/* in : control index in cntxt->form->ctrl */
){
	EVA_form *form = cntxt->form;
	EVA_ctrl *ctrl = form->ctrl + i_ctrl;
	ObjTableFormat *tbl = ctrl->objtbl;
	DynBuffer *name = NULL;
	char *btn = tbl->status & TblCtrl_ctrlsel ? "_eva_btn_opensel.gif" : "_eva_searchoff.gif";
	char *btn1 = tbl->status & TblCtrl_ctrlsel ? "_eva_btn_opensel_s.gif" : "_eva_searchoff_s.gif";
	char *help = tbl->status & TblCtrl_ctrlsel ?
		"Cliquez pour voir les fiches sélectionnées et masquer la recherche" : 
		"Cliquez pour masquer la recherche et voir toutes les fiches";
	if(cntxt->form->step == HtmlPrint) return 0;

	CTRL_CGINAMEBTN(&name, NULL, add_sz_str("CLOSESEARCH"));
	if(put_html_button(cntxt, name->data, "Fiches sélectionnées", btn, btn1, help, 0, 0)) STACK_ERROR;

	RETURN_OK_CLEANUP;
}
#undef ERR_FUNCTION
#undef ERR_CLEANUP

/*********************************************************************
** Function : table_put_opensearch_btn
** Description : output open search button
*********************************************************************/
#define ERR_FUNCTION "table_put_opensearch_btn"
#define ERR_CLEANUP	M_FREE(name)
int table_put_opensearch_btn(			/* return : 0 on success, other on error */
	EVA_context *cntxt,					/* in/out : execution context data */
	unsigned long i_ctrl,				/* in : control index in cntxt->form->ctrl */
	char *tooltip						/* in : button tooltip */
){
	EVA_form *form = cntxt->form;
	EVA_ctrl *ctrl = form->ctrl + i_ctrl;
	DynBuffer *name = NULL;
	if(cntxt->form->step == HtmlPrint) return 0;

	CTRL_CGINAMEBTN(&name, NULL, add_sz_str("OPENSEARCH"));
	if(put_html_button(cntxt, name->data, "Chercher", "_eva_search.gif", "_eva_search_s.gif", 
		tooltip ? tooltip : "Cliquez pour chercher dans la liste des fiches", 0, 0)) STACK_ERROR;

	RETURN_OK_CLEANUP;
}
#undef ERR_FUNCTION
#undef ERR_CLEANUP

/*********************************************************************
** Function : table_put_export_btn
** Description : output export list data button
*********************************************************************/
#define ERR_FUNCTION "table_put_export_btn"
#define ERR_CLEANUP	M_FREE(name)
int table_put_export_btn(				/* return : 0 on success, other on error */
	EVA_context *cntxt,					/* in/out : execution context data */
	unsigned long i_ctrl				/* in : control index in cntxt->form->ctrl */
){
	EVA_form *form = cntxt->form;
	EVA_ctrl *ctrl = form->ctrl + i_ctrl;
	ObjTableFormat *tbl = ctrl->objtbl;
	DynBuffer *name = NULL;
	CHECK_HTML_STATUS;

	/* If export available */
	if(cntxt->form->step != HtmlPrint && CTRL_ATTR_CELL(EXPORTLIST))
	{
		/* Output export buttons */
		DYNBUF_ADD_STR(html, "<td align=right>");
		CTRL_CGINAMEBTN(&name, NULL, add_sz_str("EXPORT_EXCEL"));
		if(put_html_button(cntxt, name->data, "Exporter", "_eva_excel_icon_small.gif", "_eva_excel_icon_small_s.gif", 
			"Cliquez pour obtenir la liste des fiches au format Excel", 0, 0)) STACK_ERROR;
		CTRL_CGINAMEBTN(&name, NULL, add_sz_str("EXPORT_WORD"));
		if(put_html_button(cntxt, name->data, "Exporter", "_eva_word_icon_small.gif", "_eva_word_icon_small_s.gif", 
			"Cliquez pour obtenir la liste des fiches au format Word", 0, 0)) STACK_ERROR;
		DYNBUF_ADD_STR(html, "</td>");
	}

	/* Output print mode button */
	DYNBUF_ADD_STR(html, "<td align=right>");
	CTRL_CGINAMEBTN(&name, NULL, add_sz_str("PRINT"));
	if(tbl->status & TblCtrl_printmode ?
		put_html_button(cntxt, name->data, NULL, "_eva_print_s.gif", "_eva_print.gif", 
			"Mode impression en cours\n\nCliquez pour afficher la liste en mode normal", 0, 0) : 
		put_html_button(cntxt, name->data, NULL, "_eva_print.gif", "_eva_print_s.gif", 
			"Mode impression\n\nCliquez pour afficher la liste en mode impression", 0, 0)) STACK_ERROR;
	DYNBUF_ADD_STR(html, "</td>");

	RETURN_OK_CLEANUP;
}
#undef ERR_FUNCTION
#undef ERR_CLEANUP

/*********************************************************************
** Function : table_put_clear_btn
** Description : output clear values button
*********************************************************************/
#define ERR_FUNCTION "table_put_clear_btn"
#define ERR_CLEANUP	M_FREE(name)
int table_put_clear_btn(				/* return : 0 on success, other on error */
	EVA_context *cntxt,					/* in/out : execution context data */
	unsigned long i_ctrl				/* in : control index in cntxt->form->ctrl */
){
	EVA_form *form = cntxt->form;
	EVA_ctrl *ctrl = form->ctrl + i_ctrl;
	DynBuffer *name = NULL;
	if(!ctrl->val.nbrows) RETURN_OK;
	CTRL_CGINAMEBTN(&name, dyntab_cell(&ctrl->val, 0, 0), add_sz_str("CLEAR"));
	if(put_html_button(cntxt, name->data,
		"Effacer", "_eva_cancel.gif", "_eva_cancel_s.gif",
		"Efface les valeurs de cette relation", 0, 0)) STACK_ERROR;

	RETURN_OK_CLEANUP;
}
#undef ERR_FUNCTION
#undef ERR_CLEANUP

/*********************************************************************
** Function : table_put_functions_btn
** Description : output copy, paste, insert, fullscreen & other buttons
*********************************************************************/
#define ERR_FUNCTION "table_put_functions_btn"
#define ERR_CLEANUP	DYNTAB_FREE(cgival); \
					M_FREE(name); \
					M_FREE(val)
int table_put_functions_btn(			/* return : 0 on success, other on error */
	EVA_context *cntxt,					/* in/out : execution context data */
	unsigned long i_ctrl,				/* in : control index in cntxt->form->ctrl */
	char *separ, size_t separ_sz		/* in : buttons separator */
){
	EVA_form *form = cntxt->form;
	EVA_ctrl *ctrl = form->ctrl + i_ctrl;
	ObjTableFormat *tbl = ctrl->objtbl;
	DynTable cgival = {0};
	DynBuffer *name = NULL;
	DynBuffer *val = NULL;
	char *insert = CTRL_ATTR_VAL(TABLEINSERT);
	unsigned long id_form = strtoul(dyntab_field_val(tbl->attr, "_EVA_LIST_CREATE_FORM", 0, 1, 0), NULL, 10);
	char *field = dyntab_val(&tbl->field, 0, 0);
	int b_oper = strpbrk(field, ".-()[] ,") != NULL;
	int b_direct = !strcmp(insert, "1");
	if(form->step == HtmlPrint) RETURN_OK;

	/* Output copy / paste buttons */
	if(CTRL_ATTR_CELL(COPYPASTE))
	{
		if(ctrl->val.nbrows)
		{
			CTRL_CGINAMEBTN(&name, dyntab_cell(&ctrl->val, 0, 0), add_sz_str("COPY"));
			DYNBUF_ADD(form->html, separ, separ_sz, NO_CONV);
			if(put_html_button(cntxt, name->data,
				NULL, "btn_copy_small1.gif", "btn_copy_small1_s.gif",
				"Copier\n\nPlace les valeurs de cette relation dans le presse papier", 0, 0)) STACK_ERROR;
		}
		if(tbl->status & TblCtrl_ctrlsel && cntxt->form->step == HtmlEdit &&
			cgi_filter_values(cntxt, &cgival, 'D', 0, 0, 0, "CB", NULL, 0, 0)) STACK_ERROR;
		if(cgival.nbrows) 
		{
			CTRL_CGINAMEBTN(&name, dyntab_cell(&ctrl->val, 0, 0), add_sz_str("PASTE"));
			DYNBUF_ADD(form->html, separ, separ_sz, NO_CONV);
			if(put_html_button(cntxt, name->data,
				NULL, "btn_paste_small1.gif", "btn_paste_small1_s.gif",
				"Coller\n\nAjoute le contenu du presse papier aux valeurs de cette relation", 0, 0)) STACK_ERROR;
		}
	}

	/* Output insert button if applicable */
	if(form->step != HtmlEdit && tbl->status & TblCtrl_ctrlsel || !*insert ||
			ctrl->val.nbrows && (!ctrl->MULTIPLE[0] || !strcmp("No", ctrl->MULTIPLE)) || 
			!id_form || b_direct && (!*field || b_oper)) RETURN_OK;
	DYNBUF_ADD(form->html, separ, separ_sz, NO_CONV);
	if(b_direct)
	{
		/* Insert from table : add OPENADDNEW button */
		CTRL_CGINAMEBTN(&name, NULL, add_sz_str("OPENADDNEW"));
		if(put_html_button(cntxt, name->data, NULL, "_eva_plus.gif", "_eva_plus_s.gif", 
						"Cliquez pour ajouter une nouvelle fiche à la liste", 0, 0)) STACK_ERROR;
	}
	else
	{
		/* Insert with new form : add OPENOBJ button */
		DYNBUF_ADD3_INT(&val, "OPENOBJ=0,", id_form, ",0");
		CTRL_CGINAMEBTN(&name, dyntab_cell(&ctrl->val, 0, 0), DYNBUF_VAL_SZ(val));
		if(put_html_button(cntxt, name->data, "Ajouter", "_eva_plus.gif", "_eva_plus_s.gif",
						"Ouvre une nouvelle fiche à ajouter à la liste", 0, 0)) STACK_ERROR;
	}

	RETURN_OK_CLEANUP;
}
#undef ERR_FUNCTION
#undef ERR_CLEANUP

/*********************************************************************
** Function : table_put_search_input
** Description : output text input for search & new object
*********************************************************************/
#define ERR_FUNCTION "table_put_search_input"
#define ERR_CLEANUP	DYNTAB_FREE(cgival); \
					M_FREE(name); \
					M_FREE(label); \
					M_FREE(tooltip); \
					M_FREE(subfield)
int table_put_search_input(				/* return : 0 on success, other on error */
	EVA_context *cntxt,					/* in/out : execution context data */
	unsigned long i_ctrl,				/* in : control index in cntxt->form->ctrl */
	int *b_label						/* in : output label if not 0
										  out : 1 if HTML input was output */
){
	EVA_form *form = cntxt->form;
	EVA_ctrl *ctrl = form->ctrl + i_ctrl;
	ObjTableFormat *tbl = ctrl->objtbl;
	DynTable cgival = {0};
	DynBuffer *name = NULL;
	DynBuffer *label = NULL;
	DynBuffer *tooltip = NULL;
	DynBuffer *subfield = NULL;
	unsigned long srchcol1 = unique_bit_index(tbl->srchcol);
	int blabel = !b_label || *b_label, b_onecol = srchcol1;
	CHECK_HTML_STATUS;
	if(b_label) *b_label = 0;

	if(tbl->status & TblCtrl_opensearch && tbl->totlines <= tbl->lines && tbl->totlines < 3 && !*tbl->input && !tbl->minsearchlen) return 0;
	if(!*tbl->input && form->step == HtmlPrint) return 0;

	/* Build text label & help button tooltip */
	if(tbl->status & TblCtrl_openaddnew)
	{
		/* Add new object button */
		DYNBUF_ADD_STR(&label, "Ajouter");
		DYNBUF_ADD_STR(&subfield, "ADDNEWOBJ");
		DYNBUF_ADD3_CELLP(&tooltip, "Entrez une valeur pour le champ [",
			LABEL_OR_FIELD_CELL(0), NO_CONV, 
			"] et cliquez sur Ok pour créer une nouvelle fiche et l'ajouter à la liste");
	}
	else 
	{
		int b_words = 1;
		DYNBUF_ADD_STR(&subfield, "SEARCH");
		if(b_onecol)
		{
			srchcol1--;
			if(srchcol1 < tbl->field.nbrows)
			{
				/* Search on single field */
				DYNBUF_ADD_CELLP(&label, LABEL_OR_FIELD_CELL(srchcol1), NO_CONV);
				if(!strcmp(dyntab_val(&tbl->format, srchcol1, 0), "_EVA_AGE"))
				{
					/* Search on single age field */
					b_words = 0;
					DYNBUF_ADD_STR(&tooltip, "Entrer un age ou une tranche d'age (2 nombres séparés par un tiret)\n\n"
						"exemples :\n"
						"15-18 : 15 à 18 ans inclus\n"
						"15 : 15 ans\n"
						"15- : 15 ans et +\n"
						"-15 : 15 ans et moins");
				}
				else if(!strncmp(dyntab_val(&tbl->format, srchcol1, 0), add_sz_str("_EVA_DATE")))
				{
					/* Search on single date field */
					b_words = 0;
					DYNBUF_ADD_STR(&tooltip, "Recherche de dates\n"
											" Entrer une date ou une période (2 dates séparées par un tiret)\n"
											"Exemple : 1/1-1/4 pour le 1er trimestre de l'année en cours")
				}
				else
					DYNBUF_ADD_STR(&tooltip, "Entrer le texte à chercher")
			}
			else 
			{
				/* Search on all object fields */
				DYNBUF_ADD_STR(&label, "Chercher");
				DYNBUF_ADD_STR(&tooltip, "Cherche sur tous les champs des fiches");
			}
		}
		else
		{
			/* Search on multiple fields */
			int b_first = 1;
			unsigned long i;
			DYNBUF_ADD_STR(&label, "Chercher");
			DYNBUF_ADD_STR(&tooltip, "Cherche sur les champs [");
			for(i = 0; i < tbl->field.nbrows; i++) if(tbl->srchcol & ( 1 << i))
			{
				if(!b_first) DYNBUF_ADD_STR(&tooltip, ",")
				else b_first = 0;
				DYNBUF_ADD_CELLP(&tooltip, LABEL_OR_FIELD_CELL(i), NO_CONV);
			}
			DYNBUF_ADD_STR(&tooltip, "]");
		}
		if(b_words) DYNBUF_ADD_STR(&tooltip,
			"\n\n"
			"Si vous entrez plusieurs mots, ils sont recherchés individuellement et seules les fiches contenant tous les mots sont affichées\n\n"
			"Pour chercher un texte contenant un espace, entourez le avec des doubles guillements");
	}

	/* Output label, text input & Ok button */
	if(b_label) *b_label = 1;
	if(blabel) DYNBUF_ADD3_BUF(html, "<td align=right valign=middle>&nbsp;", label, TO_XML, "</td><td valign=middle>");
	CTRL_CGINAMESUBFIELD(&name, dyntab_cell(&ctrl->val, 0, 0), "INPUT");
	if(put_html_text_input(cntxt, DYNBUF_VAL_SZ(name), tbl->input, strlen(tbl->input), 0, 0, 1, tbl->inputwidth, 0)) STACK_ERROR;
	if(ctrl_cgi_name(cntxt, ctrl, NULL, 0, &name, 'B', DYNBUF_VAL_SZ(subfield))) RETURN_ERR_MEMORY;
	if(put_html_button(cntxt, name->data, "Ok", NULL, NULL, tooltip->data, 0, 0)) STACK_ERROR;
	cgi_value_setkeep(cntxt, &tbl->cgiinput, form->Line ? form->Line - 1 : 0, 1);

	/* Output exact search button if applicable */
	if(tbl->status & TblCtrl_opensearch && 
		*tbl->input && (!srchcol1 ||
						strncmp(dyntab_val(&tbl->format, srchcol1, 0), add_sz_str("_EVA_DATE")) &&
						strcmp(dyntab_val(&tbl->format, srchcol1, 0), "_EVA_AGE")))
	{
		if(tbl->srchmode == Exact)
		{
			CTRL_CGINAMEBTN(&name, NULL, add_sz_str("SEARCHBEGIN"));
			if(put_html_button(cntxt, name->data, NULL, "_eva_srchmode_exact.gif", "_eva_srchmode_begin.gif", 
									"Augmente le nombre de réponses en recherchant les valeurs qui commencent par les mots donnés", 0, 0)) STACK_ERROR;
		}
		else if(tbl->srchmode == Begin)
		{
			CTRL_CGINAMEBTN(&name, NULL, add_sz_str("SEARCHCONTAIN"));
			if(put_html_button(cntxt, name->data, NULL, "_eva_srchmode_begin.gif", "_eva_srchmode_contain.gif", 
									"Augmente le nombre de réponses en recherchant les valeurs qui contiennent les mots donnés", 0, 0)) STACK_ERROR;
		}
		else
		{
			CTRL_CGINAMEBTN(&name, NULL, add_sz_str("SEARCHEXACT"));
			if(put_html_button(cntxt, name->data, NULL, "_eva_srchmode_contain.gif", "_eva_srchmode_exact.gif", 
									"Diminue le nombre de réponses en recherchant exactement les mots donnés", 0, 0)) STACK_ERROR;
		}
	}
	else
		tbl->srchmode = 0;

	if(blabel) DYNBUF_ADD_STR(html, "</td>");

	RETURN_OK_CLEANUP;
}
#undef ERR_FUNCTION
#undef ERR_CLEANUP

/*********************************************************************
** Function : table_put_filter_list
** Description : output extra filters list
*********************************************************************/
#define ERR_FUNCTION "table_put_filter_list"
#define ERR_CLEANUP	M_FREE(name); \
					DYNTAB_FREE(optlist); \
					DYNTAB_FREE(data); \
					DYNTAB_FREE(cgival)
int table_put_filter_list(				/* return : 0 on success, other on error */
	EVA_context *cntxt,					/* in/out : execution context data */
	unsigned long i_ctrl,				/* in : control index in cntxt->form->ctrl */
	int *b_label						/* in : output label if not 0
										  out : 1 if HTML input was output */
){
	EVA_form *form = cntxt->form;
	EVA_ctrl *ctrl = form->ctrl + i_ctrl;
	ObjTableFormat *tbl = ctrl->objtbl;
	DynBuffer *name = NULL;
	DynTable optlist = { 0 };
	DynTable data = { 0 };
	DynTable cgival = { 0 };
	unsigned long val_LABEL;
	unsigned long i, row = 0;
	int blabel = !b_label || *b_label;
	CHECK_HTML_STATUS;
	if(b_label) *b_label = 0;

	/* Get filters selected by user & prepare list of user selectable filters */
	DYNTAB_SET(&optlist, 0, 1, "Pas de filtre");
	DYNTAB_SET(&optlist, 0, 0, "");
	val_LABEL = get_id_value(cntxt, add_sz_str("_EVA_LABEL"));
	for(i = 0; i < tbl->altfilter.nbrows; i++) if(!dyntab_sz(&tbl->typfilter, i, 0))
	{
		row = optlist.nbrows;
		if(qry_obj_idfield(cntxt, &data, DYNTAB_TOULRC(&tbl->altfilter, i, 0), val_LABEL)) STACK_ERROR;
		DYNTAB_ADD_CELL(&optlist, row, 1, &data, 0, 0);
		DYNTAB_ADD_CELL(&optlist, row, 0, &tbl->altfilter, i, 0);
	}

	/* Return if list must not be output */
	if(!tbl->altfilter.nbrows ||
		(!(tbl->status & TblCtrl_opensearch) && tbl->status & TblCtrl_ctrlsel) ||
		!tbl->idobj.nbrows && !tbl->selfilter.nbrows ||
		optlist.nbrows < 2) RETURN_OK;

	/* Output filters list */
	CTRL_GET_CGI_SUBFIELD("SELFILTER")
	CTRL_CGINAMESUBFIELD(&name, NULL, "SELFILTER");
	if(b_label) *b_label = 1;
	if(blabel) DYNBUF_ADD_STR(html, "<td align=right valign=middle>&nbsp;Filtrer</td><td valign=middle>");
	if(put_html_list(cntxt, name, &optlist, &tbl->selfilter, 1, 0, 0, 1, 1)) STACK_ERROR;
	if(blabel) DYNBUF_ADD_STR(html, "</td>");

	RETURN_OK_CLEANUP;
}
#undef ERR_FUNCTION
#undef ERR_CLEANUP

/*********************************************************************
** Function : table_put_page_navigator
** Description : output a table's page navigation buttons
*********************************************************************/
#define ERR_FUNCTION "table_put_page_navigator"
#define ERR_CLEANUP M_FREE(name)
int table_put_page_navigator(			/* return : 0 on success, other on error */
	EVA_context *cntxt,					/* in/out : execution context data */
	unsigned long i_ctrl				/* in : control index in cntxt->form->ctrl */
){
	EVA_form *form = cntxt->form;
	EVA_ctrl *ctrl = form->ctrl + i_ctrl;
	ObjTableFormat *tbl = ctrl->objtbl;
	DynBuffer *name = NULL;
	unsigned long nbpages = !tbl->totlines ? 1 : ((tbl->totlines - 1) / tbl->lines) + 1;
	unsigned long page = !tbl->line ? 1 : (tbl->line + tbl->lines - 1) / tbl->lines + 1;
	char *counttype = (tbl->status & TblCtrl_opensearch) ? (tbl->input && tbl->input[0]) ? "trouvée" : "" :
					(tbl->status & TblCtrl_opensel) ? "sélectionnée" : "";
	CHECK_HTML_STATUS;

	if(cntxt->debug & DEBUG_HTML) DYNBUF_ADD3(cntxt->form->html, "\n<!--- Start TablePageNavigator ", ctrl->LABEL, 0, NO_CONV, " -->\n");

	/* Output enclosing table header */
	DYNBUF_ADD_STR(html,
		"<td colspan=99><table cellspacing=0 cellpadding=0 border=0 rules=none width=100%><tr>");

	if(nbpages > 1) 
	{
		/* Output previous line & page buttons */
		DYNBUF_ADD_STR(html, "<td><nobr>");
		if(tbl->line)
		{
			if(nbpages > 2) 
			{
				CTRL_CGINAMEBTN(&name, NULL, add_sz_str("TOP"));
				if(put_html_button(cntxt, name->data, "Début", "_eva_btn_arrowl1_small.gif", "_eva_btn_arrowl1_small_s.gif",
													"Remonte en haut la table", 0, 0)) STACK_ERROR;
			}
			CTRL_CGINAMEBTN(&name, NULL, add_sz_str("LINEUP"));
			if(put_html_button(cntxt, name->data, "Ligne précédente", "_eva_btn_arrowl_small.gif", "_eva_btn_arrowl_small_s.gif",
												"Remonte d'une ligne dans la table", 0, 0)) STACK_ERROR;
			CTRL_CGINAMEBTN(&name, NULL, add_sz_str("PAGEUP"));
			if(put_html_button(cntxt, name->data, "Page précédente", "_eva_btn_page_pr_small.gif", "_eva_btn_page_pr_small_s.gif",
												"Remonte d'une page dans la table", 0, 0)) STACK_ERROR;
		}
		else
		{
			if(nbpages > 2 && put_html_image(cntxt, NULL, "_eva_btn_arrowl1_small_d.gif", NULL, NULL, NULL, 0) ||
				put_html_image(cntxt, NULL, "_eva_btn_arrowl_small_d.gif", NULL, NULL, NULL, 0) ||
				put_html_image(cntxt, NULL, "_eva_btn_page_pr_small_d.gif", NULL, NULL, NULL, 0)) STACK_ERROR;
		}
		DYNBUF_ADD_STR(html, "</nobr> <nobr>");

		/* Output next line & page buttons */
		if(tbl->line < tbl->totlines - tbl->lines)
		{
			CTRL_CGINAMEBTN(&name, NULL, add_sz_str("PAGEDOWN"));
			if(put_html_button(cntxt, name->data, "Page suivante", "_eva_btn_page_suiv_small.gif", "_eva_btn_page_suiv_small_s.gif",
												"Descend d'une page dans la table", 0, 0)) STACK_ERROR;
			CTRL_CGINAMEBTN(&name, NULL, add_sz_str("LINEDOWN"));
			if(put_html_button(cntxt, name->data, "Ligne suivante", "_eva_btn_arrowr_small.gif", "_eva_btn_arrowr_small_s.gif",
												"Descend d'une ligne dans la table", 0, 0)) STACK_ERROR;
			if(nbpages > 2) 
			{
				CTRL_CGINAMEBTN(&name, NULL, add_sz_str("BOTTOM"));
				if(put_html_button(cntxt, name->data, "Fin", "_eva_btn_arrowr1_small.gif", "_eva_btn_arrowr1_small_s.gif",
													"Descend en bas de la table", 0, 0)) STACK_ERROR;
			}
		}
		else
		{
			if(put_html_image(cntxt, NULL, "_eva_btn_page_suiv_small_d.gif", NULL, NULL, NULL, 0) ||
				put_html_image(cntxt, NULL, "_eva_btn_arrowr_small_d.gif", NULL, NULL, NULL, 0) ||
				nbpages > 2 && put_html_image(cntxt, NULL, "_eva_btn_arrowr1_small_d.gif", NULL, NULL, NULL, 0)) STACK_ERROR;
		}
		DYNBUF_ADD_STR(html, "</nobr></td>");
	}

	/* Output page size buttons */
	DYNBUF_ADD_STR(html, "<td>");
	if(tbl->totlines > 2 && tbl->lines > 2) 
	{
		CTRL_CGINAMEBTN(&name, NULL, add_sz_str("SHRINK"));
		if(put_html_button(cntxt, name->data, NULL, "_eva_btn_shrink.gif", "_eva_btn_shrink_s.gif",
											"Réduit le nombre de lignes affichées", 0, 0)) STACK_ERROR;
	}
#define PAGESIZE_BTN(n) { \
	CTRL_CGINAMEBTN(&name, NULL, add_sz_str("PAGESIZE=" #n)); \
	if(put_html_button(cntxt, name->data, NULL, (n == tbl->lines ? "_eva_btn_" #n "_s.gif" : "_eva_btn_" #n ".gif"), \
												(n == tbl->lines ? "_eva_btn_" #n ".gif" : "_eva_btn_" #n "_s.gif"), \
												"Affiche " #n " lignes", 0, 0)) STACK_ERROR; }
	if(tbl->totlines > 2) 
	{
		PAGESIZE_BTN(2)
		PAGESIZE_BTN(5)
	}
	if(tbl->totlines > 5) PAGESIZE_BTN(10)
	if(tbl->totlines > 10) PAGESIZE_BTN(30)
	if(tbl->totlines > 30) PAGESIZE_BTN(100)
#undef PAGESIZE_BTN
	if(nbpages > 1) 
	{
		CTRL_CGINAMEBTN(&name, NULL, add_sz_str("EXPAND"));
		if(put_html_button(cntxt, name->data, NULL, "_eva_btn_expand.gif", "_eva_btn_expand_s.gif",
											"Augmente le nombre de lignes affichées", 0, 0)) STACK_ERROR;
	}
	DYNBUF_ADD_STR(html, "</td>");

	/* Output record & page count */
	DYNBUF_ADD_STR(html, "<td align=right><font size=-1><b><nobr>");
	switch(tbl->totlines) 
	{
	case 0:
		DYNBUF_ADD3(html, "Aucune fiche ", counttype, 0, NO_CONV, "")
		break;

	case 1:
		DYNBUF_ADD3(html, "1 fiche ", counttype, 0, NO_CONV, "")
		break;

	default:
		DYNBUF_ADD_INT(html, tbl->totlines);
		DYNBUF_ADD_STR(html, " fiches");
		if(*counttype) DYNBUF_ADD3(html, " ", counttype, 0, NO_CONV, "s");
		if(nbpages > 1) 
		{
			DYNBUF_ADD3_INT(html, " -</nobr> <nobr>page ", page, " / ");
			DYNBUF_ADD_INT(html, nbpages);
		}
	}
	DYNBUF_ADD_STR(html, "</nobr></b></font></td>");

	/* Output export buttons */
	if(tbl->totlines && table_put_export_btn(cntxt, i_ctrl)) STACK_ERROR;

	/* Output table footer */
	DYNBUF_ADD_STR(html, "</tr></table></td>\n");

	if(cntxt->debug & DEBUG_HTML) DYNBUF_ADD3(cntxt->form->html, "\n<!--- EndOf TablePageNavigator ", ctrl->LABEL, 0, NO_CONV, " -->\n");

	RETURN_OK_CLEANUP;
}
#undef ERR_FUNCTION
#undef ERR_CLEANUP

/*********************************************************************
** Function : table_put_controls
** Description : output search, add new object buttons & text input control
*********************************************************************/
#define ERR_FUNCTION "table_put_controls"
#define ERR_CLEANUP 
int table_put_controls(					/* return : 0 on success, other on error */
	EVA_context *cntxt,					/* in/out : execution context data */
	unsigned long i_ctrl,				/* in : control index in cntxt->form->ctrl */
	int b_shrink						/* in : output in shrinked mode if not 0 */
){
	EVA_form *form = cntxt->form;
	EVA_ctrl *ctrl = form->ctrl + i_ctrl;
	ObjTableFormat *tbl = ctrl->objtbl;
	int b_opensearch = tbl->status & TblCtrl_search && !(tbl->status & TblCtrl_opensearch) && 
						(form->step == HtmlEdit && tbl->status & TblCtrl_ctrlsel ||
						!(tbl->status & TblCtrl_ctrlsel));
	CHECK_HTML_STATUS;

	if(cntxt->debug & DEBUG_HTML) DYNBUF_ADD3(cntxt->form->html, "\n<!--- Start TableControls ", ctrl->LABEL, 0, NO_CONV, " -->\n");

	if(b_shrink)
	{
		/* Output enclosing table header & Add OPENSEARCH button */
		DYNBUF_ADD_STR(html, "<td width=10><table cellspacing=0 cellpadding=0 border=0 rules=none width=100%><tr><td width=10>");
		if(b_opensearch && table_put_opensearch_btn(cntxt, i_ctrl, NULL)) STACK_ERROR;
		DYNBUF_ADD_STR(html, "</td>");
		if(!tbl->totlines && table_put_page_navigator(cntxt, i_ctrl)) STACK_ERROR;
	}
	else
	{
		int b_label = 0, nblabel = 0;

		/* Output enclosing table header */
		DYNBUF_ADD_STR(html, "<td><table cellspacing=0 cellpadding=0 border=1 rules=none width=100%><tr><td>");

		/* Add OPENCLOSE button */
		if(tbl->status & TblCtrl_close &&
			table_put_openclose_btn(cntxt, i_ctrl)) STACK_ERROR;

		/* Add CLOSESEARCH button */
		if(tbl->status & TblCtrl_opensearch &&
			table_put_closesearch_btn(cntxt, i_ctrl)) STACK_ERROR

		/* Add OPENSEARCH button */
		else if(b_opensearch && table_put_opensearch_btn(cntxt, i_ctrl, NULL)) STACK_ERROR;
		
		/* Add function buttons */
		if(table_put_functions_btn(cntxt, i_ctrl, NULL, 0)) STACK_ERROR;

		/* Add CLEAR button */
		DYNBUF_ADD_STR(html, "</td><td>");
		if(tbl->status & TblCtrl_ctrlsel && form->step == HtmlEdit &&
			table_put_clear_btn(cntxt, i_ctrl)) STACK_ERROR;
		DYNBUF_ADD_STR(html, "</td>");

		/* Output extra filters list if applicable */
		if(tbl->altfilter.nbrows)
		{
			b_label = 1;
			if(table_put_filter_list(cntxt, i_ctrl, &b_label)) STACK_ERROR;
			if(b_label) nblabel++;
		}

		/* Add text input for seach & add functions */
		if(tbl->status & (TblCtrl_opensearch | TblCtrl_openaddnew))
		{
			b_label = 1;
			if(table_put_search_input(cntxt, i_ctrl, &b_label)) STACK_ERROR;
			if(b_label) nblabel++;
		}
		
		/* Output navigation controls */
		if(tbl->totlines > tbl->lines && nblabel) DYNBUF_ADD_STR(html, "</tr><tr>");
		if(table_put_page_navigator(cntxt, i_ctrl)) STACK_ERROR;
	}

	/* Output table footer */
	DYNBUF_ADD_STR(html, "</tr></table></td>");
	if(!b_shrink) DYNBUF_ADD_STR(html, "</tr><tr>");

	if(cntxt->debug & DEBUG_HTML) DYNBUF_ADD3(cntxt->form->html, "\n<!--- EndOf TableControls ", ctrl->LABEL, 0, NO_CONV, " -->\n");

	RETURN_OK_CLEANUP;
}
#undef ERR_FUNCTION
#undef ERR_CLEANUP

/*********************************************************************
** Function : table_put_title_row
** Description : output a table title row (1st row)
*********************************************************************/
#define ERR_FUNCTION "table_put_title_row"
#define ERR_CLEANUP M_FREE(val); \
					M_FREE(name)
int table_put_title_row(				/* return : 0 on success, other on error */
	EVA_context *cntxt,					/* in/out : execution context data */
	unsigned long i_ctrl				/* in : control index in cntxt->form->ctrl */
){
	EVA_form *form = cntxt->form;
	EVA_ctrl *ctrl = form->ctrl + i_ctrl;
	ObjTableFormat *tbl = ctrl->objtbl;
	DynBuffer *val = NULL;
	DynBuffer *name = NULL;
	unsigned long i;
	int b_search = tbl->status & TblCtrl_opensearch && form->step != HtmlPrint;
	int b_sort = (!(tbl->status & (TblCtrl_opensel | TblCtrl_ctrlsel)) || 
					tbl->b_sortsel || tbl->status & TblCtrl_opensearch) && 
					cntxt->form->step != HtmlPrint;
	CHECK_HTML_STATUS;
	if(!tbl->totlines && !(tbl->status & TblCtrl_opensearch)) RETURN_OK;

	/* Do not output if not applicable */
	if(!(tbl->field.nbrows || tbl->status & (TblCtrl_sort | TblCtrl_opensearch)))
	{
		DYNBUF_ADD_STR(html, "</tr>");
		RETURN_OK; 
	}

	if(cntxt->debug & DEBUG_HTML) DYNBUF_ADD3(cntxt->form->html, "\n<!--- Start TableTitleRow ", ctrl->LABEL, 0, NO_CONV, " -->\n");

	/* Leave blank cells for selection checkbox & open button */
	if(tbl->status & TblCtrl_sel && tbl->status & TblCtrl_opensel) DYNBUF_ADD_STR(html, "<td></td>");
	if(tbl->status & TblCtrl_openbtn)
	{
		DYNBUF_ADD_STR(html, "<td><table cellspacing=0 cellpadding=0 border=0><tr>");
		if(table_add_searchsort_btn(cntxt, ctrl, tbl->field.nbrows, b_search, b_sort, 0)) STACK_ERROR;
		DYNBUF_ADD_STR(html, "</tr></table></td>");
	}

	/* For each display field */
	for(i = 0; i < tbl->field.nbrows; i++)
	{
		/* Output title label */
		DYNBUF_ADD_STR(html, "<td><table cellspacing=0 cellpadding=0 border=0><tr>"
			"<td nowrap><font size=-1");
		if(strpbrk(dyntab_val(&tbl->field, i, 0), "-.("))
			DYNBUF_ADD_STR(html, " color=#0000FF");
		DYNBUF_ADD3_CELL(html, ">", &tbl->label, i, 0, TO_HTML, "&nbsp;</font></td>\n");

		/* Output search & sort buttons as applicable */
		if(table_add_searchsort_btn(cntxt, ctrl, i, b_search, b_sort, !strcmp("_EVA_AGE", dyntab_val(&tbl->format, i, 0)))) STACK_ERROR;
		DYNBUF_ADD_STR(html, "</tr></table></td>");
	}
	DYNBUF_ADD_STR(html, "</tr>");

	if(cntxt->debug & DEBUG_HTML) DYNBUF_ADD3(cntxt->form->html, "\n<!--- EndOf TableTitleRow ", ctrl->LABEL, 0, NO_CONV, " -->\n");

	RETURN_OK_CLEANUP;
}
#undef ERR_FUNCTION
#undef ERR_CLEANUP


/*********************************************************************
** Function : table_init_bgseq
** Description : initialize lines backgroung sequence data for table display
*********************************************************************/
#define ERR_FUNCTION "table_init_bgseq"
#define ERR_CLEANUP
int table_init_bgseq(					/* return : 0 on success, other on error */
	EVA_context *cntxt,					/* in/out : execution context data */
	ObjTableFormat *tbl					/* in : table to output */
){
	char *bgseq;
	int nbrows;
	if(!tbl) return 0;

	DYNTAB_FIELD_TABDEF(&tbl->bgcol, tbl->attr, TABLEROWCOLORS);
	DYNTAB_FIELD_TABDEF(&tbl->bgimg, tbl->attr, TABLEROWTRANSP);
	bgseq = dyntab_val(&tbl->bgimg, 0, 0);
	DYNTAB_FIELD_TABDEF(&tbl->bgimg, tbl->attr, TABLEROWBG);
	nbrows = max(tbl->bgcol.nbrows, tbl->bgimg.nbrows);

	/* Handle full automatic mode */
	if(!*bgseq && !tbl->bgcol.nbrows && !tbl->bgimg.nbrows)
	{
		/* Light green / white sequence */
		DYNTAB_SET(&tbl->bgcol, 0, 0, "DDFFEE");
		DYNTAB_SET(&tbl->bgcol, 1, 0, "FFFFFF");
	}
	else if(!strcmp(bgseq, "_EVA_LAST") || !*bgseq && nbrows <= 1)
	{
		DYNTAB_ADD_CELLP(&tbl->bgcol, max(tbl->bgcol.nbrows, tbl->bgimg.nbrows), 0, NULL);
	}
	else if(!strcmp(bgseq, "_EVA_FIRST"))
	{
		tbl->bgseqstart = nbrows;
		DYNTAB_SET(&tbl->bgcol, nbrows, 0, "");
	}
	if(!tbl->bgcol.nbrows) DYNTAB_SET(&tbl->bgcol, 0, 0, "");
	RETURN_OK_CLEANUP;
}
#undef ERR_FUNCTION
#undef ERR_CLEANUP

/*********************************************************************
** Function : table_row_bgcolor
** Description : return row background color for a given row
*********************************************************************/
char *table_row_bgcolor(				/* return : RGB color code - empty string for transparent */
	EVA_context *cntxt,					/* in/out : execution context data */
	ObjTableFormat *tbl,				/* in : table to output */
	unsigned long i						/* in row index to get color for */
){
	int nbrows;
	if(!tbl) return "";

	if(!tbl->bgcol.nbrows && !i) table_init_bgseq(cntxt, tbl);
	nbrows = max(tbl->bgcol.nbrows, tbl->bgimg.nbrows);
	return nbrows ? dyntab_val(&tbl->bgcol, (i + tbl->bgseqstart) % nbrows,0) : "FFFFFF";
}

/*********************************************************************
** Function : table_put_rows
** Description : output the body of a table of objects
*********************************************************************/
#define ERR_FUNCTION "table_put_rows"
#define ERR_CLEANUP
int table_put_rows(						/* return : 0 on success, other on error */
	EVA_context *cntxt,					/* in/out : execution context data */
	unsigned long i_ctrl				/* in : control index in cntxt->form->ctrl */
){
	EVA_form *form = cntxt->form;
	EVA_ctrl *ctrl = form->ctrl + i_ctrl;
	ObjTableFormat *tbl = ctrl->objtbl;
	unsigned long i, j, k;
	unsigned long rowstart;
	CHECK_HTML_STATUS;

	/* Return if no rows */
	if(!tbl->idobj.nbrows) RETURN_OK;

	if(cntxt->debug & DEBUG_HTML) DYNBUF_ADD3(cntxt->form->html, "\n<!--- Start TableRows ", ctrl->LABEL, 0, NO_CONV, " -->\n");
	for(i = 0; i < tbl->idobj.nbrows; i++)
	{
		char *bg_color = table_row_bgcolor(cntxt, tbl, i);
		char *idend;
		unsigned long idobj = strtoul(dyntab_val(&tbl->idobj, i, 0), &idend, 10);
		unsigned long i_label = tbl->data.nbrows;
		unsigned long i_val = ctrl->val.nbrows;

		/* Check selection status */
		if(ctrl->val.nbrows && tbl->status & TblCtrl_sel)
		{  
			/* Search current line in selection */
			for(i_val = 0; i_val < ctrl->val.nbrows && dyntab_cmp(&ctrl->val, i_val, 0, &tbl->idobj, i, 0); i_val++);
			
			/* If found : mark cell with col = 1 */
			if(i_val < ctrl->val.nbrows) dyntab_cell(&ctrl->val, i_val, 0)->col = 1;
		}

		/* Output line start */
		if(*bg_color) DYNBUF_ADD3(html, "<tr bgcolor=#", bg_color, 6, NO_CONV,">")
		else DYNBUF_ADD_STR(html, "<tr>");

		/* Output selection checkbox where applicable */
		if(tbl->status & TblCtrl_sel && tbl->status & TblCtrl_opensel &&
				table_add_sel_chkbox(cntxt, ctrl, i_val, DYNTAB_VAL_SZ(&tbl->idobj, i, 0), bg_color))STACK_ERROR;


		/* If object is not a relation */
		if(!idobj || *idend)
		{
			DYNBUF_ADD3_INT(html, "<td>#NAR#</td><td colspan=", tbl->field.nbrows, ">");
			DYNBUF_ADD_CELL(html, &tbl->idobj, i, 0, TO_HTML);
			DYNBUF_ADD_STR(html, "</td>");
		}
		else
		{
			/* Find object in objects data */
			for(j = 0; j < tbl->data.nbrows && dyntab_cell(&tbl->data, j, 0)->IdObj != idobj; j++);
			rowstart = j;

			/* Output open button where applicable */
			if(tbl->status & TblCtrl_openbtn)
			{
				char *openbtn = DYNTAB_FIELD_VAL(tbl->attr, OPENBUTTON);
				if(strcmp(openbtn, "_EVA_NONE"))
				{
					if(!*openbtn || !strcmp(openbtn, "_EVA_SYMBOL"))
						DYNBUF_ADD_STR(html, "<td align=right width=1%>")
					else
						DYNBUF_ADD_STR(html, "<td>");
					DYNBUF_ADD_STR(html, "<table border=0 cellspacing=0 cellpadding=0><tr>");
					if(ctrl_add_symbol_btn(cntxt, ctrl, dyntab_cell(&ctrl->val, i_val, 0),
											NULL, &tbl->data, j,
											add_sz_str("Cliquez pour ouvrir la fiche"),
											bg_color, openbtn))
						STACK_ERROR;
					DYNBUF_ADD_STR(html, "</tr></table></td>");
				}
			}

			/* Output line data in tbl->field order */
			for(j = 0; j < tbl->field.nbrows; j++) 
			{
				char *fmt = dyntab_val(&tbl->format, j, 0);
				char *s_strip = dyntab_val(&tbl->strip, j, 0);
				unsigned long strip = atoi(s_strip);
				int b_stripped = 0;
				size_t tot_char = 0;
				char *valign = NULL;
				char *align = dyntab_val(&tbl->align, j, 0);
				char *separ = ", ";
				int b_index = 0;
				unsigned long line = 1;
				unsigned long i0;
				int b_distinct = dyntab_sz(&tbl->distinctval, j, 0);
				if(cntxt->debug & DEBUG_HTML) DYNBUF_ADD3_INT(cntxt->form->html, "\n<!--- Start TableCell ", i, " -->\n");

				/* Set alignment & value separator */
				if(!*align)
				{
					if(!strcmp(fmt, "_EVA_MONEY") || !strncmp(fmt, add_sz_str("_EVA_DATE"))) align = "right";
					else if(!strcmp(fmt, "_EVA_NUMBER")) align = "center";
					else if(!strncmp(fmt, add_sz_str("_EVA_RELATION_BTN"))) align = "space";
				}
				if(!strcmp(align, "newline")) { align = ""; separ = "<br>"; }
				else if(!strcmp(align, "space")) { align = ""; separ = " "; }
				else if(!strcmp(align, "+")) { align = "center"; separ = " + "; }
				else if(!strcmp(align, "index")) { align = ""; b_index = 1; valign = "top"; }

				/* Output cell header */
				if(put_html_format_pos(cntxt, "_EVA_NewColumn",
					align, valign, NULL, NULL, bg_color, NULL, 1, 1, NULL,
					dyntab_sz(&tbl->fontsize, j, 0) ? dyntab_val(&tbl->fontsize, j, 0) : ctrl->FONTSIZE, NULL,
					dyntab_val(&tbl->bold, j, 0)[0] == '1', 0, dyntab_val(&tbl->underline, j, 0)[0] == '1',
					!strip && *s_strip,
					1)) STACK_ERROR;

				/* Read cell values & output formated */
				for(k = 0; rowstart < tbl->data.nbrows; k++, rowstart++)
				{
					/* Insert space & break if column changes */
					int b_found = 0;
					DynTableCell *cell = dyntab_cell(&tbl->data, rowstart, 0);
					if(cell->col != j)
					{
						if(!k) DYNBUF_ADD_STR(html, "&nbsp;");
						break;
					}

					/* Ignore values after stripping */
					if(b_stripped) continue;

					/* If max strip count is reached : strip */
					if(strip && tot_char >= strip)
					{
						DYNBUF_ADD_STR(html, " ...");
						b_stripped = 1;
						continue;
					}

					/* Distinct values required : search for same previous value - ignore if found */
					if(b_distinct) for(i0 = 0; i0 < k && !b_found; i0++)
						if(!dyntab_cmp(&tbl->data, rowstart, 0, &tbl->data, rowstart - i0 - 1, 0))
							b_found = 1;
					if(b_found) continue;

					/* Output value separator if applicable */
					if(b_index || cell->Line && !dyntab_sz(&tbl->align, j, 0))
					{
						if(line >= cell->Line && k) DYNBUF_ADD(html, separ, 0, NO_CONV)
						else while(line < cell->Line) { DYNBUF_ADD_STR(html, "<br>"); line++; }
					}
					else if(k) DYNBUF_ADD(html, separ, 0, NO_CONV);

					/* Memorize first value for line buttons tooltip */
					if(i_label == tbl->data.nbrows) i_label = rowstart;

					/* Put formated value */
					if(html_put_value_fmt(cntxt, ctrl, &tbl->data, rowstart, fmt, strip, &tot_char, &b_stripped))
						CLEAR_ERROR;
				}

				/* Output cell footer */
				if(put_html_format_pos(cntxt, "_EVA_NewColumn",
					align, valign, NULL, NULL, bg_color, NULL, 1, 1, NULL,
					dyntab_sz(&tbl->fontsize, j, 0) ? dyntab_val(&tbl->fontsize, j, 0) : ctrl->FONTSIZE, NULL,
					dyntab_val(&tbl->bold, j, 0)[0] == '1', 0, dyntab_val(&tbl->underline, j, 0)[0] == '1',
					!strip && s_strip,
					0)) STACK_ERROR;
				if(cntxt->debug & DEBUG_HTML) DYNBUF_ADD3_INT(cntxt->form->html, "\n<!--- EndOf TableCell ", i, " -->\n");
			}
		}

		/* Output arrows where applicable */
		if(!tbl->b_sortsel && !(tbl->status & TblCtrl_opensearch) && ctrl->val.nbrows > 1 && 
			tbl->status & TblCtrl_ctrlsel && tbl->status & TblCtrl_opensel &&
			table_add_updown_btns(cntxt, ctrl, i + tbl->line, DYNTAB_VAL_SZ(&tbl->data, i_label, 0), bg_color))
			STACK_ERROR;

		/* Output line end */
		DYNBUF_ADD_STR(html, "</tr>");
	}

	if(cntxt->debug & DEBUG_HTML) DYNBUF_ADD3(cntxt->form->html, "\n<!--- EndOf TableRows ", ctrl->LABEL, 0, NO_CONV, " -->\n");

	RETURN_OK_CLEANUP;
}
#undef ERR_FUNCTION
#undef ERR_CLEANUP

/*********************************************************************
** Function : table_put_status
** Description : output table status as hidden input
*********************************************************************/
#define ERR_FUNCTION "table_put_status"
#define ERR_CLEANUP DYNTAB_FREE(cgival)
int table_put_status(					/* return : 0 on success, other on error */
	EVA_context *cntxt,					/* in : execution context data */
	unsigned long i_ctrl				/* in : control index in cntxt->form->ctrl */
){
	EVA_form *form = cntxt->form;
	EVA_ctrl *ctrl = form->ctrl + i_ctrl;
	ObjTableFormat *tbl = ctrl->objtbl;
	DynTable cgival = { 0 };
	char status[64];

	CTRL_GET_CGI_SUBFIELD("STATUS");
	if(!tbl->status) RETURN_OK;

	sprintf(status, "%lx,%lu,%lu,%lu,%lu,%lu,%lu,%lu", 
		tbl->status, tbl->line, tbl->lines, tbl->sortcol, tbl->b_sortdesc, tbl->srchcol, tbl->ctrlline, tbl->srchmode);
	CTRL_PUT_CGI_SUBFIELD_VAL("STATUS", status, 0);
	RETURN_OK_CLEANUP;
}
#undef ERR_FUNCTION
#undef ERR_CLEANUP

/*********************************************************************
** Function : table_init_obj_list
** Description : read unsorted objects list for a table of objects
*********************************************************************/
#define ERR_FUNCTION "table_init_obj_list"
#define ERR_CLEANUP 
int table_init_obj_list(				/* return : 0 on success, other on error */
	EVA_context *cntxt,					/* in : execution context data */
	unsigned long i_ctrl,				/* in : control index in cntxt->form->ctrl */
	int *selobj							/* out : table displays control values if not 0 */
){
	EVA_form *form = cntxt->form;
	EVA_ctrl *ctrl = form->ctrl + i_ctrl;
	ObjTableFormat *tbl = ctrl->objtbl;
	int b_selobj = 0;

	/* Set default table attributes	*/
	if(tbl->b_ctrl) tbl->attr = &ctrl->attr;
	if(!tbl->input) tbl->input = dyntab_val(&tbl->cgiinput, form->Line ? form->Line - 1 : 0, 0);

	/* Handle relation control selection status */
	if(!strcmp(ctrl->CONTROL, "_EVA_INPUT"))
	{
		if(form->step == HtmlEdit) tbl->status |= TblCtrl_sel | TblCtrl_opensel;
		else tbl->status &= ~(TblCtrl_opensearch | TblCtrl_search | TblCtrl_openaddnew | TblCtrl_addnew | TblCtrl_sel | TblCtrl_opensel);
	}

	/* Fetch list of objects to display */
	b_selobj = tbl->status & TblCtrl_ctrlsel && !(tbl->status & TblCtrl_opensearch);
	dyntab_free(&tbl->idobj);
	if(b_selobj)
		tbl->totlines = ctrl->val.nbrows;
	else
		if(table_word_search(cntxt, i_ctrl)) CLEAR_ERROR;

	if(selobj) *selobj = b_selobj;
	RETURN_OK_CLEANUP;
}
#undef ERR_FUNCTION
#undef ERR_CLEANUP

/*********************************************************************
** Function : table_export_list
** Description : export a table of objects
*********************************************************************/
#define ERR_FUNCTION "table_export_list"
#define ERR_CLEANUP M_FREE(label); \
					form->step = step;
int table_export_list(			/* return : 0 on success, other on error */
	EVA_context *cntxt,					/* in : execution context data */
	unsigned long i_ctrl				/* in : control index in cntxt->form->ctrl */
){
	EVA_form *form = cntxt->form;
	EVA_ctrl *ctrl = form->ctrl + i_ctrl;
	ObjTableFormat *tbl = ctrl->objtbl;
	DynBuffer *label = NULL;
	int step = form->step;
	int b_selobj = 0;
	unsigned long i;
	char *btn = CGI_CLICK_BTN_SUBFIELD;
	int b_xl = strstr(btn, "EXCEL") ? 1 : 0;
	char *ext = b_xl ? "xls" : "doc";
	char *exe = b_xl ? "EXCEL" : "WINWORD";
	char lbl[4096];
	char cmd[4096];
	char cwd[4096];
	char tmp[4096];
	struct stat fs = {0};
	if(!tbl) RETURN_OK;

	/* Set temp directory for user */
	if(chdir_user_doc(cntxt)) STACK_ERROR;
	getcwd(add_sz_str(cwd));

	/* Prepare text file with table data */
	form->step = form->prevstep;
	if(table_init_obj_list(cntxt, i_ctrl, &b_selobj)) STACK_ERROR;
	tbl->line = 0;
	tbl->lines = b_xl ? 65000 : tbl->totlines;
	if(table_read_obj_list(cntxt, i_ctrl, b_selobj)) STACK_ERROR;
	if(table_prepare_rows(cntxt, i_ctrl, "")) STACK_ERROR;
	if(file_write_tabrc(cntxt, &tbl->cellval, "dump.txt")) STACK_ERROR;

	/* Prepare output format file */
	if(b_xl)
	{
		dyntab_free(&tbl->cellval);
		DYNTAB_SET(&tbl->cellval, 0, 0, "Fields");
		DYNTAB_SET(&tbl->cellval, 1, 0, "Formats");
		DYNTAB_SET(&tbl->cellval, 2, 0, "Fixed");
		for(i = 0; i < tbl->field.nbrows; i++)
		{
			if(!strcmp("_EVA_RELATION_BTN0", dyntab_val(&tbl->format, i, 0))) continue;
			DYNTAB_SET_CELL(&tbl->cellval, 0, i + 1, &tbl->field, i, 0);
			DYNTAB_SET_CELL(&tbl->cellval, 1, i + 1, &tbl->format, i, 0);
			if(!strcmp("0", dyntab_val(&tbl->strip, i, 0))) DYNTAB_SET(&tbl->cellval, 2, i + 1, "X");
		}
		if(file_write_tabrc(cntxt, &tbl->cellval, "dumpfmt.txt")) STACK_ERROR;
	}

	/* Copy & launch template */
	snprintf(add_sz_str(cmd), "copy %s..\\templates\\TableList.%s %s > msg.txt 2>err.txt", cntxt->path, ext, cwd);
	system(cmd);
	snprintf(add_sz_str(cmd), "call \"%s\\Office\\%s.EXE\" %s\\TableList.%s", dyntab_val(&cntxt->cnf_server, 0, 0), exe, cwd, ext);
	system(cmd);

	/* Clear temp files & rename destination file */
	if(strcmp(cntxt->user_ip, "127.0.0.1"))
	{
		remove("dump.txt");
		remove("dumpfmt.txt");
		remove("TableList.xls");
	}
	qry_obj_label(cntxt, NULL, NULL, NULL, &label, NULL, NULL, NULL, NULL, 0, &form->objdata, 0);
	if(label) snprintf(add_sz_str(lbl), "%s %s", ctrl->LABEL, label->data);
	else snprintf(add_sz_str(lbl), "%s", ctrl->LABEL);
	snprintf(add_sz_str(cmd), "%s.%s", lbl, ext);
	file_compatible_name(cmd);
	remove(cmd);
	rename(b_xl ? "List.xls" : "TableList.doc", cmd);
	stat(cmd, &fs);

	/* Output download dialog */
	put_html_page_header(cntxt, NULL, NULL, NULL, 3);
	printf(
		"<font face=Arial><center><hr>"
		"<b>Contenu de [%s]</b><hr>", lbl);
	printf(
		"Cliquez sur le lien ci-dessous pour télécharger le fichier<br><br>"
		"<font size=-1>Si vous utilisez Internet Explorer, le fichier s'ouvrira dans une nouvelle fenêtre<br>"
		"Pour enregistrer le fichier sur votre ordinateur, cliquez avec le bouton de droite et choisissez Enregistrer la cible sous ...</font><br><br>"
		"Ficher %s : <a target='W%s.%s' href='../" DIRECTORY_DOCS "/%s/%s/%s'>%s.%s - %s</a><br><br>",
		b_xl ? "Excel" : "Word", tmp, ext, cntxt->dbname, dyntab_val(&cntxt->id_user, 0, 0), cmd, lbl, ext, human_filesize(fs.st_size));

	/* Zip result file if larger than 50k & output link to zip */
	if(fs.st_size > 50000L)
	{
		snprintf(add_sz_str(tmp), "..\\..\\..\\cgi\\zip.exe -j -9 %s.zip %s >> msg.txt 2>>err.txt", cmd, cmd);
		system(tmp);
		snprintf(add_sz_str(tmp), "%s.zip", cmd);
		memset(&fs, 0, sizeof(fs));
		stat(tmp, &fs);
		printf(
			"Ficher zippé : <a href='../" DIRECTORY_DOCS "/%s/%s/%s.zip'>%s.zip - %s</a><hr>",
			cntxt->dbname, dyntab_val(&cntxt->id_user, 0, 0), cmd, lbl, human_filesize(fs.st_size));
	}

	/* Output return button */
	puts("<input type=image name='NOP' src='../img/_eva_btn_gobackobj_fr.gif'><hr></center></font>");
	cntxt->b_terminate = 15;
	remove("err.txt");
	remove("msg.txt");

	RETURN_OK_CLEANUP;
}
#undef ERR_FUNCTION
#undef ERR_CLEANUP

/*********************************************************************
** Function : table_sort_obj_list
** Description : sort objects list for a table of objects
*********************************************************************/
#define ERR_FUNCTION "table_sort_obj_list"
#define ERR_CLEANUP qry_build_free(&flt); \
					M_FREE(sql)
int table_sort_obj_list(				/* return : 0 on success, other on error */
	EVA_context *cntxt,					/* in : execution context data */
	unsigned long i_ctrl,				/* in : control index in cntxt->form->ctrl */
	int b_selobj						/* in : use control values if not 0 */
){
	EVA_form *form = cntxt->form;
	EVA_ctrl *ctrl = form->ctrl + i_ctrl;
	ObjTableFormat *tbl = ctrl->objtbl;
	QryBuild flt = { 0 };
	DynBuffer *sql = NULL;
	DynTableCell *field = dyntab_cell(&tbl->field, tbl->sortcol, 0);
	char printbuf[1024] = {0};
	int b_num = !strcmp(dyntab_val(&tbl->format, tbl->sortcol, 0), "_EVA_NUMBER") ||
				!strcmp(dyntab_val(&tbl->format, tbl->sortcol, 0), "_EVA_MONEY")||
				!strcmp(dyntab_val(&tbl->format, tbl->sortcol, 0), "_EVA_FILESIZE");

	/* Check sort column type */
	if(strchr(field->txt, '['))
	{
		/* Handle SQL expression */
		if(qry_eval_sql_fieldexpr(cntxt, "ValList", field->txt, "IdList", NULL)) STACK_ERROR;
	}
	else
	{
		/* Sort on 1st field only if applicable */
		char *fmt = dyntab_val(&tbl->format, tbl->sortcol, 0);
		flt.b_single_last_field = !*fmt || 
									!strcmp(fmt, "_EVA_TXTLINK") ||
									!strcmp(fmt, "_EVA_EMAIL");

		/* Build temporary table with sort values */
		if(qry_parse_fieldexpr(cntxt, field->txt, field->len, &flt) ||
			sql_get_listcol(cntxt, NULL, b_selobj ? &ctrl->val : NULL, &flt, 0)) STACK_ERROR;
	}

	/* Handle numerical sorting */
	if(b_num && sql_exec_query(cntxt, "ALTER TABLE ValList MODIFY Val FLOAT")) STACK_ERROR;

	/* Add indexes */
	if(sql_exec_query(cntxt, "ALTER TABLE ValList MODIFY IdObj INT NOT NULL") ||
		sql_exec_query(cntxt, "ALTER TABLE ValList ADD INDEX (IdObj)")) STACK_ERROR;

	/* Build query for ordered & clipped list of objects */
	DYNBUF_ADD_STR(&sql, 
		"SELECT DISTINCT IdList.IdObj FROM ");
	if(b_selobj) DYNBUF_ADD_STR(&sql, "TLink AS IdList")
	else DYNBUF_ADD_STR(&sql, "IdList");
	DYNBUF_ADD_STR(&sql, 
		"\nLEFT JOIN ValList ON IdList.IdObj=ValList.IdObj \n");
	if(b_selobj)
	{
		DYNBUF_ADD_STR(&sql, "WHERE IdList.IdObj IN(");
		if(qry_values_list(cntxt, &ctrl->val, 0, &sql)) STACK_ERROR;
		DYNBUF_ADD_STR(&sql, ")\n");
	}
	if(dynbuf_print3(&sql, 
		"ORDER BY %s, IdList.IdObj DESC LIMIT %lu,%lu",
		/* Handle numerical / case insensitive sorting */
		b_num ?
			tbl->b_sortdesc ? "ValList.Val DESC" : "IF(ValList.Val IS NULL,0,ValList.Val)" :
			tbl->b_sortdesc ? "UCASE(ValList.Val) DESC" : "UCASE(IF(ValList.Val IS NULL,'\xFF',ValList.Val))",
		tbl->line, tbl->lines)) RETURN_ERR_MEMORY;
	if(sql_exec_query(cntxt, sql->data) ||
		sql_get_table(cntxt, &tbl->idobj, 2)) STACK_ERROR;

	RETURN_OK_CLEANUP;
}
#undef ERR_FUNCTION
#undef ERR_CLEANUP

/*********************************************************************
** Function : table_prepare_obj_list
** Description : prepare objects list for a table of objects
*********************************************************************/
#define ERR_FUNCTION "table_prepare_obj_list"
#define ERR_CLEANUP 
int table_prepare_obj_list(				/* return : 0 on success, other on error */
	EVA_context *cntxt,					/* in : execution context data */
	unsigned long i_ctrl				/* in : control index in cntxt->form->ctrl */
){
	EVA_form *form = cntxt->form;
	EVA_ctrl *ctrl = form->ctrl + i_ctrl;
	ObjTableFormat *tbl = ctrl->objtbl;
	int b_sort, b_selobj = 0;
	DynTableCell *c;
	char *btn = form->i_ctrl_clic == i_ctrl ? CGI_CLICK_BTN_SUBFIELD : "";

	/* Initialize table	*/
	if(table_init_obj_list(cntxt, i_ctrl, &b_selobj)) STACK_ERROR;

	/* Handle automatic setting of display parameters */
	if(tbl->sortcol > tbl->field.nbrows) tbl->sortcol = tbl->field.nbrows ? tbl->field.nbrows - 1 : 0;
	if(tbl->lines < 2) tbl->lines = 2;
	if(tbl->totlines <= tbl->lines && !strcmp(btn, "SHRINK"))
		tbl->lines = tbl->totlines > 4 ? tbl->totlines / 2 : 2;
	if(tbl->totlines <= tbl->lines) tbl->line = 0;
	else if(tbl->line > tbl->totlines - tbl->lines) tbl->line = tbl->totlines - tbl->lines;
	c = dyntab_cell(&tbl->field, tbl->sortcol, 0);
	b_sort = (tbl->b_sortsel  || !b_selobj) && c && c->txt && c->len && tbl->status & TblCtrl_sort;
	if(!b_sort)
		tbl->status &= ~TblCtrl_sort;
	else if(tbl->totlines > 1 &&
		table_sort_obj_list(cntxt, i_ctrl, b_selobj)) CLEAR_ERROR;

	/* Read displayed objects data */
	if(table_read_obj_list(cntxt, i_ctrl, b_selobj)) STACK_ERROR;

	RETURN_OK_CLEANUP;
}
#undef ERR_FUNCTION
#undef ERR_CLEANUP

/*********************************************************************
** Function : table_put_html_obj_list
** Description : output a table of objects
*********************************************************************/
#define ERR_FUNCTION "table_put_html_obj_list"
#define ERR_CLEANUP form->step = step;
int table_put_html_obj_list(			/* return : 0 on success, other on error */
	EVA_context *cntxt,					/* in : execution context data */
	unsigned long i_ctrl				/* in : control index in cntxt->form->ctrl */
){
	EVA_form *form = cntxt->form;
	EVA_ctrl *ctrl = form->ctrl + i_ctrl;
	ObjTableFormat *tbl = ctrl->objtbl;
	unsigned long i;
	int b_shrink;
	int step = form->step;
	CHECK_HTML_STATUS;
	if(!tbl) RETURN_OK;

	/* Prepare list of objects	*/
	if(table_prepare_obj_list(cntxt, i_ctrl)) STACK_ERROR;

	/* Set default table attributes	*/
	if(!ctrl->TABLERULES[0]) ctrl->TABLERULES = (form->step == HtmlPrint || tbl->status & TblCtrl_printmode) ? "all" : "cols";
	if(!DYNTAB_FIELD_CELL(tbl->attr, BORDER)) ctrl->BORDER = 1;

	/* Handle search output in logs */
	if(tbl->input[0] && tbl->status & TblCtrl_opensearch && (!cntxt->log_srchtxt || form->i_ctrl_clic == i_ctrl))
	{
		M_FREE(cntxt->log_srchtxt);
		DYNBUF_ADD(&cntxt->log_srchtxt, tbl->input, 0, NO_CONV);
	}

	/* Handle minimal table display (closed & 2 or less values) */
	b_shrink = (!DYNTAB_FIELD_CELL(tbl->attr, TABLE_NOTITLESHRINK) || !tbl->totlines) && tbl->totlines < 3 && 
		!(tbl->status & TblCtrl_opensearch) && !(tbl->status & TblCtrl_openaddnew);

	/* Handle print mode */
	if(tbl->status & TblCtrl_printmode) form->step = HtmlPrint;

	/* Output global table header */
	if(!ctrl->TABLEBGCOLOR[0]) ctrl->TABLEBGCOLOR = "EEEEEE";
	if(put_html_table_header(cntxt, 
			DYNTAB_FIELD_VAL(tbl->attr, TABLEALIGN),
			ctrl->TABLEWIDTH,
			ctrl->TABLEBGCOLOR,
			ctrl->TABLEBACKGROUND,
			0, 0, 0, NULL)) STACK_ERROR;

	/* Add input controls for table functions */
	if(table_put_controls(cntxt, i_ctrl, b_shrink)) STACK_ERROR;

	/* Output status, table header &  rows */
	DYNBUF_ADD_STR(html, "<td>");
	if(table_put_status(cntxt, i_ctrl) ||
		put_html_table_header(cntxt,
			NULL, "100%", NULL, NULL,
			atoi(DYNTAB_FIELD_VAL(tbl->attr, CELLSPACING)),
			atoi(DYNTAB_FIELD_VAL(tbl->attr, CELLPADDING)),
			ctrl->BORDER,
			ctrl->TABLERULES) ||
		!b_shrink && table_put_title_row(cntxt, i_ctrl) ||
		table_put_rows(cntxt, i_ctrl)) STACK_ERROR;
	DYNBUF_ADD_STR(html, "</table>\n</td></tr></table>\n");

	/* Output non visible values as hidden input */
	if(form->step == HtmlEdit && tbl->status & TblCtrl_opensel)
		for(i = 0; i < (ctrl->val.nbrows ? ctrl->val.nbrows : 1); i++)
		{
			DynTableCell *val = dyntab_cell(&ctrl->val, i, 0);
			if(!val || !val->col)
				if(ctrl_put_hidden(cntxt, ctrl, i)) STACK_ERROR;
		}

	if(cntxt->debug & DEBUG_HTML) DYNBUF_ADD3(html, "\n<!--- End   ObjTable ", ctrl->LABEL, 0, NO_CONV, " -->\n");

	RETURN_OK_CLEANUP;
}
#undef ERR_FUNCTION
#undef ERR_CLEANUP
