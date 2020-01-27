/*********************************************************************
**        File : ctrl_contain.c
** Description : handing functions for container controls
**      Author : Alain BOUTE
**     Created : Aug 18 2001
*********************************************************************/

#include "eva.h"

/*********************************************************************
** Function : ctrl_add_tab
** Description : handles TAB controls
*********************************************************************/
#define ERR_FUNCTION "ctrl_add_tab"
#define ERR_CLEANUP DYNTAB_FREE(ctrltree); \
					M_FREE(tooltip)
int ctrl_add_tab(					/* return : 0 on success, other on error */
	EVA_context *cntxt,				/* in/out : execution context data */
	unsigned long i_ctrl						/* in : control index in cntxt->form->ctrl */
){
	EVA_form *form = cntxt->form;
	EVA_ctrl *ctrl = form->ctrl + i_ctrl;
	DynTableCell *label, *image;
	DynTable ctrltree = { 0 };
	DynBuffer *tooltip = NULL;
	DynBuffer **prev = form->html;

	/* Read control attributes */
	CTRL_OPTIONAL(ctrltree, CTRLTREE);

	switch(form->step)
	{
	case CtrlRead:
		/* Set cginame & increment tabs counter */
		if(cgi_build_basename(cntxt, &ctrl->cginame, i_ctrl, 'T')) STACK_ERROR;
		form->nb_tabs++;

		/* Handle current tab selection */
		if(!dyntab_txt_cmp(DYNBUF_VAL_SZ(ctrl->cginame), &form->seltab, 0, 0))
			form->i_seltab = i_ctrl;

		/* Add lower level controls */
		CTRL_ADD_CHILD(i_ctrl, &ctrltree);

		/* Set fixed values for tabs */
		ctrl->POSITION = "_EVA_NewLine";
		ctrl->COLSPAN = "";
		ctrl->ROWSPAN = "";
		if(!ctrl->TABLERULES[0]) ctrl->TABLERULES = "none";
		break;

	case HtmlPrint:
		/* Set tab title print format */
		ctrl->OPTIONBUTTON = "_EVA_NONE";
		ctrl->LABELPOS = "_EVA_TOP";
		ctrl->LABELFONTSIZE = "+1";
		ctrl->LABELBOLD = "1";
		ctrl->LABELUNDERLINE = "1";
		ctrl->LABELITALIC = "1";
		ctrl->BORDER = 1;
		ctrl->TABLEWIDTH = "100%";

		/* Position control & output HTML table header */
		form->html = &form->html_tab;
		if(ctrl_format_pos(cntxt, ctrl, 1) ||
			ctrl_put_table_header(cntxt, ctrl)) STACK_ERROR;

		/* Add lower level controls */
		CTRL_ADD_CHILD(i_ctrl, &ctrltree);

		/* Output HTML table footer */
		if(ctrl_put_table_footer(cntxt, ctrl) ||
			ctrl_format_pos(cntxt, ctrl, 0)) STACK_ERROR;
		break;

	case HtmlEdit:
	case HtmlView:
		/* Set default values for tabs */
		ctrl->POSITION = "_EVA_NewColumn";
		ctrl->LABELPOS = "_EVA_NONE";
		CTRL_SETATTRDEF("2", CELLPADDING);

		/* Redirect html output to the tabs buttons bar */
		form->html = &form->html_tabs;

		/* Build tooltip */
		label = CTRL_ATTR_CELL(LABEL);
		DYNBUF_ADD_CELLP(&tooltip, label, NO_CONV);
		if(ctrl->NOTES[0]) DYNBUF_ADD3(&tooltip, "\n\n", ctrl->NOTES, 0, NO_CONV, "");

		/* Handle default tab selection */
		if(!form->i_seltab) form->i_seltab = i_ctrl;

		/* If image for active tab - simply output image */
		DYNBUF_ADD_STR(form->html, "<td>");
		image = CTRL_ATTR_CELL(IMAGE);
		if(image && form->i_seltab == i_ctrl)
		{
			if(put_html_image(cntxt, 
					ctrl->cginame->data,
					CTRL_ATTR_VAL(IMAGESEL), 
					tooltip->data,
					NULL, NULL, 0))
				STACK_ERROR;
		}
		else
		{
			if(put_html_button(cntxt, 
					ctrl->cginame->data,
					label ? label->txt : "Ok",
					image ? image->txt : NULL, 
					CTRL_ATTR_VAL(IMAGESEL), 
					tooltip->data,
					0, form->i_seltab == i_ctrl))
				STACK_ERROR;
		}
		DYNBUF_ADD_STR(form->html, "</td>\n");
		
		/* If tab is active */
		if(form->i_seltab == i_ctrl)
		{
			/* Output lower level controls */
			form->html = &form->html_tab;
			CTRL_ADD_CHILD(i_ctrl, &ctrltree);
		}
		else
		{
			/* Process lower level controls with no HTML output 
				This is needed because other tabs may be output by controls 
				located in hidden tabs */
			form->html = NULL;
			CTRL_ADD_CHILD(i_ctrl, &ctrltree);
		}

		/* Switch to form bottom after first level tab */
		form->html = prev;
		break;

	default:
		/* Add lower level controls */
		CTRL_ADD_CHILD(i_ctrl, &ctrltree);
	}

	RETURN_OK_CLEANUP;
}
#undef ERR_FUNCTION
#undef ERR_CLEANUP

/*********************************************************************
** Function : ctrl_add_group
** Description : handles GROUP controls
*********************************************************************/
#define ERR_FUNCTION "ctrl_add_group"
#define ERR_CLEANUP DYNTAB_FREE(ctrltree)
int ctrl_add_group(					/* return : 0 on success, other on error */
	EVA_context *cntxt,				/* in/out : execution context data */
	unsigned long i_ctrl						/* in : control index in cntxt->form->ctrl */
){
	EVA_form *form = cntxt->form;
	EVA_ctrl *ctrl = form->ctrl + i_ctrl;
	DynTable ctrltree = { 0 };

	/* Read control attributes */
	CTRL_OPTIONAL(ctrltree, CTRLTREE);
	ctrl->BGCOLOR = "";
	ctrl->BACKGROUND = "";

	/* Add lower level controls if no output */
	if(!form->html) 
	{
		CTRL_ADD_CHILD(i_ctrl, &ctrltree);
		RETURN_OK;
	}

	switch(form->step)
	{
	case HtmlEdit:
	case HtmlView:
	case HtmlPrint:
		/* Set default values for groups */
		if(!ctrl->TABLERULES[0]) ctrl->TABLERULES = "none";
		if(!CTRL_ATTR_CELL(BORDER)) ctrl->BORDER = 1;

		/* Position control & output HTML table header */
		if(ctrl_format_pos(cntxt, ctrl, 1)) STACK_ERROR;
		if(ctrl_put_table_header(cntxt, ctrl)) STACK_ERROR;

		/* Add lower level controls */
		CTRL_ADD_CHILD(i_ctrl, &ctrltree);

		/* Output HTML table footer */
		if(ctrl_put_table_footer(cntxt, ctrl)) STACK_ERROR;
		if(ctrl_format_pos(cntxt, ctrl, 0)) STACK_ERROR;
		break;

	default:
		/* Add lower level controls */
		CTRL_ADD_CHILD(i_ctrl, &ctrltree);
	}

	RETURN_OK_CLEANUP;
}
#undef ERR_FUNCTION
#undef ERR_CLEANUP

/*********************************************************************
** Function : ctrl_add_pack
** Description : handles PACKAGE controls
*********************************************************************/
#define ERR_FUNCTION "ctrl_add_pack"
#define ERR_CLEANUP DYNTAB_FREE(ctrltree)
int ctrl_add_pack(					/* return : 0 on success, other on error */
	EVA_context *cntxt,				/* in/out : execution context data */
	unsigned long i_ctrl						/* in : control index in cntxt->form->ctrl */
){
	EVA_form *form = cntxt->form;
	EVA_ctrl *ctrl = form->ctrl + i_ctrl;
	DynTable ctrltree = { 0 };
	DynTable listobj = { 0 };
	DynTable fieldexpr = { 0 };
	char *srcobj = CTRL_ATTR_VAL(SRCOBJ);

	/* Select controls to add */
	if(*srcobj)
	{
		CTRL_OPTIONAL(listobj, LISTOBJ);
		CTRL_OPTIONAL(fieldexpr, SRCFIELD);
		if(form_eval_valtype(cntxt, &ctrltree, srcobj, &listobj, &fieldexpr)) STACK_ERROR;
		dyntab_group(&ctrltree, "DISTINCT");
	}
	else
		CTRL_OPTIONAL(ctrltree, CTRLTREE);

	/* Add lower level controls */
	CTRL_ADD_CHILD(i_ctrl, &ctrltree);

	RETURN_OK_CLEANUP;
}
#undef ERR_FUNCTION
#undef ERR_CLEANUP

/*********************************************************************
** Function : ctrl_table_prepare_lines
** Description : prepare line indexes for all controls of a table
*********************************************************************/
#define ERR_FUNCTION "ctrl_table_prepare_lines"
#define ERR_CLEANUP 
int ctrl_table_prepare_lines(		/* return : 0 on success, other on error */
	EVA_context *cntxt,				/* in : execution context data */
	unsigned long i_ctrl,			/* in : table control index in cntxt->form->ctrl */
	DynTable *ctrltree				/* in : child controls list */
){
	EVA_form *form = cntxt->form;
	EVA_ctrl *ctrl = form->ctrl + i_ctrl;
	DynTableCell *val;
	unsigned long i, j, i_child, lines = 0;
	int b_null = 0;

	/* Prepare line indexes */
	for(i = 0; i < ctrltree->nbrows; i++)
	{
		unsigned long maxnum = 0, maxline = 0;
		i_child = ctrl_from_id(cntxt, i_ctrl, DYNTAB_VAL_SZ(ctrltree, i, 0));
		if(!i_child) continue;
		ctrl = form->ctrl + i_child;
		if(!(ctrl->access & (AccessEdit|AccessView))) continue;

		/* Count # of lines in control */
		for(j = 0; j < ctrl->val.nbrows; j++)
		{
			val = dyntab_cell(&ctrl->val, j, 0);
			if(val->Num && !val->Line)
			{
				val->Line = val->Num;
				val->Num = 1;
			}
			if(val->Num > maxnum) maxnum = val->Num;
			if(val->Line > maxline) maxline = val->Line;
		}
		if((maxline ? maxline : maxnum) > lines) lines = maxline ? maxline : maxnum;
	}

	/* Set null indexes to last line */
	for(i = 0; i < ctrltree->nbrows; i++)
	{
		i_child = ctrl_from_id(cntxt, i_ctrl, DYNTAB_VAL_SZ(ctrltree, i, 0));
		if(!i_child) continue;
		ctrl = form->ctrl + i_child;
		if(!(ctrl->access & (AccessEdit|AccessView))) continue;
		for(j = 0; j < ctrl->val.nbrows; j++)
		{
			val = dyntab_cell(&ctrl->val, j, 0);
			if(!val->Line)
			{
				val->Line = lines + 1;
				b_null = 1;
			}
		}
	}

	/* Store # of lines in control */
	form->ctrl[i_ctrl].lines = lines + b_null;
	RETURN_OK_CLEANUP;
}
#undef ERR_FUNCTION
#undef ERR_CLEANUP

/*********************************************************************
** Function : ctrl_add_table
** Description : handles CONTAINER controls of type TABLE
*********************************************************************/
#define ERR_FUNCTION "ctrl_add_table"
#define ERR_CLEANUP DYNTAB_FREE(ctrltree); \
					table_free(&tbl)
int ctrl_add_table(					/* return : 0 on success, other on error */
	EVA_context *cntxt,				/* in/out : execution context data */
	unsigned long i_ctrl			/* in : control index in cntxt->form->ctrl */
){
	EVA_form *form = cntxt->form;
	EVA_ctrl *ctrl = form->ctrl + i_ctrl;
	DynTable ctrltree = { 0 };
	DynBuffer **html = form->html;
	unsigned long i, j, k, i_child;
	int b_first;
	int savedlg_outmode = form->savedlg_outmode;
	ObjTableFormat tbl = {0};

	/* Return if a table is already beeing output (no table in table) */
	if(form->Line) RETURN_OK;

	/* Read control attributes */
	CTRL_OPTIONAL(ctrltree, CTRLTREE);
	ctrl->BGCOLOR = "";
	ctrl->BACKGROUND = "";

	switch(form->step)
	{
	case CtrlRead:
		/* Add lower level controls */
		CTRL_ADD_CHILD(i_ctrl, &ctrltree);

		/* Prepare line indexes */
		if(ctrl_table_prepare_lines(cntxt, i_ctrl, &ctrltree)) STACK_ERROR;
		break;

	case InputCheck:
		/* Process each line in table  */
		for(j = 0; j < ctrl->lines; j++)
		{
			/* Process each control in line */
			int b_error = form->error;
			int b_modified = form->b_modified;
			int has_data = form->has_data;
			form->error = 0;
			form->b_modified = 0;
			form->has_data = 0;
			form->Line= j + 1;
			for(i = 0; i < ctrltree.nbrows; i++)
			{
				/* Call columns control handler for the line */
				i_child = ctrl_from_id(cntxt, i_ctrl, DYNTAB_VAL_SZ(&ctrltree, i, 0));
				if(!i_child) continue;
				CTRL_PRI_HDLR(i_child);

				 /* Store column error status in column 1 of ctrl->allval */
				DYNTAB_ADD_INT(&ctrl->allval, i , 1, form->ctrl[i_child].error);
			}

			/* If not last empty line */
			if(!ctrl->lines || j < ctrl->lines || form->has_data)
			{
				/* Store line error & modified status in ctrl->val */
				DYNTAB_ADD_INT(&ctrl->val, j , 0, form->b_modified);
				DYNTAB_ADD_INT(&ctrl->val, j , 1, form->error);
				form->error |= b_error;
				form->b_modified |= b_modified;
				form->has_data |= has_data;

				/* Store column error status in column 0 of ctrl->allval */
				for(i = 0; i < ctrltree.nbrows; i++)
				{
					int err0 = atoi(dyntab_val(&ctrl->allval, i, 0));
					int err1 = atoi(dyntab_val(&ctrl->allval, i, 1));
					if(err1 > err0) DYNTAB_ADD_INT(&ctrl->allval, i, 0, err1);
				}
			}
			else
			{
				/* Restore form status */
				form->error = b_error;
				form->b_modified = b_modified;
				form->has_data = has_data;
			}
		}
		form->Line = 0;
		break;

	case HtmlSaveDlg:
		/* Process each line in table  */
		for(j = 0, b_first = 1; j < ctrl->val.nbrows; j++)
		{
			/* Output line in Edit mode if error, warning or modified */
			int b_modified = atoi(dyntab_val(&ctrl->val, j, 0));
			int b_error = atoi(dyntab_val(&ctrl->val, j, 1));
			if(!(
				(b_error & 1 && savedlg_outmode & 1) ||
				(b_error & 2 && savedlg_outmode & 2) ||
				(b_modified && savedlg_outmode & 4))) continue;

			/* Output label, line number & notes for each line */
			form->savedlg_outmode = 15;
			DYNBUF_ADD3(html, "<td align=right bgcolor=#DDDDDD><font size=-1><b><u>", ctrl->LABEL, 0, TO_HTML, " - Ligne n° ");
			DYNBUF_ADD_INT(html, j + 1);
			DYNBUF_ADD_STR(html, "</b></u></font></td>");
			if(b_first)
			{
				DYNBUF_ADD3(html, "<td bgcolor=#DDDDDD><font size=-1>", ctrl->NOTES, 0, TO_HTML, "</font></td>");
				b_first = 0;
			}
			else
				DYNBUF_ADD_STR(html, "<td></td>");
			DYNBUF_ADD_STR(html, "</tr><tr>");

			for(i = 0; i < ctrltree.nbrows; i++)
			{
				/* Add controls for the line */
				i_child = ctrl_from_id(cntxt, i_ctrl, DYNTAB_VAL_SZ(&ctrltree, i, 0));
				if(!i_child) continue;
				form->Line = j + 1;
				CTRL_PRI_HDLR(i_child);
			}
			form->savedlg_outmode = savedlg_outmode;
		}
		form->Line = 0;
		break;

	case HtmlEdit:
	case HtmlPrint:
	case HtmlView:
		/* Set default values for tables */
		if(!CTRL_ATTR_CELL(BORDER)) ctrl->BORDER = 1;

		/* Position control & output HTML table header */
		if(ctrl_format_pos(cntxt, ctrl, 1)) STACK_ERROR;
		if(ctrl_put_table_header(cntxt, ctrl)) STACK_ERROR;

		/* Output labels line */
		DYNBUF_ADD_STR(form->html, "<td></td>\n");
		for(i = 0; i < ctrltree.nbrows; i++)
		{
			EVA_ctrl *child;
			i_child = ctrl_from_id(cntxt, i_ctrl, DYNTAB_VAL_SZ(&ctrltree, i, 0));
			if(!i_child) continue;
			child = form->ctrl + i_child;
			if(!(child->access & (AccessEdit|AccessView))) continue;
			child->error = ctrl->lines ? atoi(dyntab_val(&ctrl->allval, i, 0)) : 0;
			child->LABELPOS = "_EVA_LEFT";
			if(!child->LABELALIGN[0]) child->LABELALIGN = "left";
			child->POSITION = "_EVA_NewColumn";
			if(ctrl_put_label(cntxt, child, "_EVA_NewColumn")) STACK_ERROR;
			child->LABELPOS = "_EVA_NONE";
		}
		DYNBUF_ADD_STR(form->html, "</tr><tr>\n");

		/* Process each line in table  */
		k = ctrl->lines + (form->step == HtmlEdit ? 1 : 0);
		for(j = 0; j < k; j++)
		{
			char *bgcolor = table_row_bgcolor(cntxt, &tbl, j);
			DYNBUF_ADD3_INT(form->html, "<td bgcolor=#DDDDDD>", j + 1, "</td>\n")

			/* Process each control in line */
			for(i = 0; i < ctrltree.nbrows; i++)
			{
				/* Add controls for the line */
				i_child = ctrl_from_id(cntxt, i_ctrl, DYNTAB_VAL_SZ(&ctrltree, i, 0));
				if(!i_child) continue;
				if(!(form->ctrl[i_child].access & (AccessEdit|AccessView))) continue;
				form->Line = j + 1;
				DYNBUF_ADD_STR(form->html, "<td");
				if(*bgcolor) DYNBUF_ADD3(form->html, " bgcolor=#", bgcolor, 6, NO_CONV, "");
				DYNBUF_ADD_STR(form->html, ">"
				"<table cellspacing=0 cellpadding=0 border=0 rules=none width=100%><tr>\n");
				CTRL_PRI_HDLR(i_child);
				DYNBUF_ADD_STR(form->html, "</tr></table></td>\n");
			}
			if(j < k) DYNBUF_ADD_STR(form->html, "</tr><tr>\n");
		}
		form->Line = 0;

		/* Output HTML table footer */
		if(ctrl_put_table_footer(cntxt, ctrl)) STACK_ERROR;
		if(ctrl_format_pos(cntxt, ctrl, 0)) STACK_ERROR;
		break;

	default:
		/* Add lower level controls */
		CTRL_ADD_CHILD(i_ctrl, &ctrltree);
	}

	RETURN_OK_CLEANUP;
}
#undef ERR_FUNCTION
#undef ERR_CLEANUP
