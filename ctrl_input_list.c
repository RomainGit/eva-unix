/*********************************************************************
**        File : ctrl_input_list.c
** Description : HTML handling functions for input controls of type LIST
**      Author : Alain BOUTE
**     Created : Dec 28 2002
*********************************************************************/

#include "eva.h"

/*********************************************************************
** Function : put_html_list
** Description : output HTML code for a list input
*********************************************************************/
#define ERR_FUNCTION "put_html_list"
#define ERR_CLEANUP
int put_html_list(						/* return : 0 on success, other on error */
	EVA_context *cntxt,					/* in/out : execution context data */
	DynBuffer *name,			 		/* in : input name */
	DynTable *options, 					/* in : options list (actual & displayed values) */
	DynTable *values, 					/* in : selected values */
	int lines, int columns,			 	/* in : # of lines & columns of input */
	int b_multiple,					 	/* in : multiple selection allowed if 1 */
	int b_submitonchange,			 	/* in : use JavaScript OnChange handler if 1 */
	int b_ignoreunlisted			 	/* in : do not list values not in options if 1 */
){
	unsigned long i, k;
	CHECK_HTML_STATUS;

	/* Force multiple if more than one value */
	if(values && values->nbrows > 1) b_multiple = 1;
	if(b_multiple && lines < 2) lines = 2;
	
	/* HTML code for input */
	DYNBUF_ADD_STR(html, "<select size=");
	DYNBUF_ADD_INT(html, lines);
	if(name) DYNBUF_ADD3_BUF(html, " name='", name, NO_CONV, "'");
	if(b_multiple) DYNBUF_ADD_STR(html, " multiple");
	if(b_submitonchange && cntxt->jsenabled) DYNBUF_ADD3_BUF(html, " onChange='cb(\"", name, NO_CONV, "\");'");
	DYNBUF_ADD_STR(html, ">");

	/* Add empty value at begining of list to set list width */
	if(columns)
	{
		DYNBUF_ADD_STR(html, "<option value=''>");
		while(--columns > 0) DYNBUF_ADD_STR(html, "&nbsp;");
		DYNBUF_ADD_STR(html, "</option>");
	}

	/* Init col member of values : used to return the index of the selected option */
	if(values) for(i = 0; i < values->nbrows; i++) dyntab_cell(values, i, 0)->col = 0;

	/* HTML code for list options */
	if(options) for(i = 0; i < options->nbrows; i++)
	{
		int j = (options && options->nbcols > 1) ? 1 : 0;
		DYNBUF_ADD3_CELL(html, "<option value='", options, i, 0, HTML_NO_QUOTE, "'");

		/* Search option in values */
		for(k = 0; k < (values ? values->nbrows : 1); k++)
		{
			if(!dyntab_cmp(options, i, 0, values, k, 0))
			{
				/* Add 'selected' attribute & mark value if found */
				DynTableCell *val = dyntab_cell(values, k, 0);
				DYNBUF_ADD_STR(html, " selected");
				dyntab_cell(options, i, 0)->col = 1;
				if(val) val->col = i + 1;
				break;
			}
		}
		DYNBUF_ADD3_CELL(html, ">", options, i, j, TO_HTML, "</option>\n");
	}

	/* Add HTML code for unlisted values */
	if(values && !b_ignoreunlisted) for(i = 0; i < values->nbrows; i++) 
	{
		DynTableCell *val = dyntab_cell(values, i, 0);
		if(!val->col && val->len && val->txt && val->txt[0])
		{
			DYNBUF_ADD3_CELLP(html, "<option value='", val, HTML_NO_QUOTE, "'");
			DYNBUF_ADD3_CELLP(html, " selected>", val, TO_HTML, "</option>\n");
		}
	}

	DYNBUF_ADD_STR(html, "</select>");

	RETURN_OK_CLEANUP;
}
#undef ERR_FUNCTION
#undef ERR_CLEANUP

/*********************************************************************
** Function : ctrl_process_option
** Description : process option children (option is selected)
*********************************************************************/
#define ERR_FUNCTION "ctrl_process_option"
#define ERR_CLEANUP
int ctrl_process_option(			/* return : 0 on success, other on error */
	EVA_context *cntxt,				/* in : execution context data */
	DynTableCell *val,				/* in : value corresponding to selected option */
	unsigned long i_opt,			/* in : option index in cntxt->form->ctrl */
	int b_multiple					/* in : multiple values allowed if not 0 */
){
	EVA_form *form = cntxt->form;

	form->ctrl[i_opt].b_selected = 1;
	if(b_multiple) form->Num = val ? val->Num : 1;
	CTRL_PRI_HDLR(i_opt)
	form->Num = 0;

	RETURN_OK_CLEANUP;
}
#undef ERR_FUNCTION
#undef ERR_CLEANUP

/*********************************************************************
** Function : ctrl_add_selected_options
** Description : processes selected options for a controls of type INPUT/LIST
*********************************************************************/
#define ERR_FUNCTION "ctrl_add_selected_options"
#define ERR_CLEANUP
int ctrl_add_selected_options(		/* return : 0 on success, other on error */
	EVA_context *cntxt,				/* in : execution context data */
	unsigned long i_ctrl,			/* in : control index in cntxt->form->ctrl */
	DynTable *options,				/* in : list of options */
	int b_multiple					/* in : multiple values allowed if not 0 */
){
	EVA_form *form = cntxt->form;
	EVA_ctrl *ctrl = form->ctrl + i_ctrl;
	unsigned long i, j, i_opt;

	/* Process empty option if applicable */
	if(ctrl->b_use_val && ctrl->i_empty && (!ctrl->val.nbrows || 
		form->step == CtrlRead && ctrl->cgival.nbrows > ctrl->val.nbrows))
	{
		if(ctrl_process_option(cntxt, NULL, ctrl->i_empty, b_multiple)) STACK_ERROR;
		ctrl = form->ctrl + i_ctrl;
	}

	/* For each control value */
	for(j = 0; j < ctrl->val.nbrows; j++)
	{

		/* Search for corresponding options */
		for(i = 0; i < options->nbrows; i++)
		{
			DynTableCell *val = dyntab_cell(&ctrl->val, j, 0);
			i_opt = ctrl_from_id(cntxt, i_ctrl, DYNTAB_VAL_SZ(options, i, 0));
			if(i_opt)
			{
				/* Read option label & value */
				DynTableCell *label = ATTR_CELL(form->ctrl + i_opt, LABEL);
				DynTableCell *value = ATTR_CELL(form->ctrl + i_opt, VALUE);
				DynTableCell *optval = ctrl->b_use_val ? value : label;

				/* If not already selected in CtrlRead mode (avoid multiple reads) */
				if((form->step != CtrlRead || !form->ctrl[i_opt].b_selected) &&
					!strcmp(optval ? optval->txt : "", (val && val->txt) ? val->txt : ""))
				{
					/* Option value is same as control value : process option */
					if(ctrl_process_option(cntxt, val, i_opt, b_multiple)) STACK_ERROR;
					ctrl = form->ctrl + i_ctrl;
					break;
				}
			}
		}
	}

	RETURN_OK_CLEANUP;
}
#undef ERR_FUNCTION
#undef ERR_CLEANUP

/*********************************************************************
** Function : ctrl_put_html_input_list
** Description : output HTML input list for a control
*********************************************************************/
#define ERR_FUNCTION "ctrl_put_html_input_list"
#define ERR_CLEANUP DYNTAB_FREE(ctrlval); \
					M_FREE(name)
int ctrl_put_html_input_list(		/* return : 0 on success, other on error */
	EVA_context *cntxt,				/* in/out : execution context data */
	unsigned long i_ctrl,			/* in : control index in cntxt->form->ctrl */
	DynTable *optlist,				/* in : options list (actual & displayed values) */
	int mode						/* in : output mode - bit mask
										bit 0 : use OnChange Javascript handler if set
										bit 1 : output relation open button if set */
){
	EVA_form *form = cntxt->form;
	EVA_ctrl *ctrl = form->ctrl + i_ctrl;
	DynTable ctrlval = { 0 };
	DynBuffer *name = NULL;
	unsigned long i, k;
	int b_multiple = ctrl->MULTIPLE[0] != 0 && strcmp("No", ctrl->MULTIPLE);
	unsigned long lines = ctrl->LINES;
	char *onchange = CTRL_ATTR_VAL(ONCHANGE);
	char *allowempty = CTRL_ATTR_VAL(ALLOWEMPTY);
	int b_submit = mode & 1;
	int b_empty = (strcmp("No", allowempty) || !*CTRL_ATTR_VAL(NOEMPTYOPTION)) ? 1 : 0;
	int b_openbtn = mode & 2 && strcmp(CTRL_ATTR_VAL(OPENBUTTON), "_EVA_NONE");
	char *helptext  = CTRL_ATTR_VAL(HELPTEXT);
	if(!strcmp("_EVA_NONE", helptext)) helptext = "";

	/* Handle ONCHANGE attribute */
	if(*onchange) b_submit = 1;
	if(!strcmp(onchange, "_EVA_UPDATE"))
	{
		/* TODO - Handle Update on change : check if value has changed  */
	}
	/* Handle special case for HTML list input with multiple selection */
	if(lines > 1)
	{
		/* Put HTML list input */
		CTRL_CGINAMEVAL(&name, 0);
		if(put_html_list(cntxt, 
						name,
						optlist, &ctrl->val,
						lines,
						ctrl->COLUMNS ? ctrl->COLUMNS : b_empty,
						b_multiple, 
						b_submit, 0))
			STACK_ERROR;

		/* Add hidden inputs for unchanged values */
		for(i = 0; i < (ctrl->val.nbrows ? ctrl->val.nbrows : 1); i++)
			if(ctrl_put_hidden_old(cntxt, ctrl, i, name, NULL, 0)) STACK_ERROR;
	}
	else
	{
		/* Add HTML list input for each value */
		k = ctrl->val.nbrows + ((b_multiple || !ctrl->val.nbrows) ? 1 : 0);
		for(i = 0; i < k; i++)
		{
			unsigned long idobj = DYNTAB_TOULRC(&ctrl->val, i, 0);
			unsigned long i_opt;

			/* Separate multiple values with a line break */
			if(i) DYNBUF_ADD_STR(form->html, "<br>");

			/* Put HTML list input */
			CTRL_CGINAMEVAL(&name, i);
			DYNTAB_SET_CELL(&ctrlval, 0, 0, &ctrl->val, i, 0);
			if(put_html_list(cntxt, 
							name,
							optlist, &ctrlval,
							lines,
							ctrl->COLUMNS ? ctrl->COLUMNS : b_empty,
							0, 
							b_submit || b_multiple, 0) ||
				ctrl_put_hidden_old(cntxt, ctrl, i, name, NULL, 0))
				STACK_ERROR;
			i_opt = ctrlval.cell->col;

			/* Output open button if applicable */
			if(b_openbtn && idobj)
			{
				char buf[128] = {0};
				snprintf(add_sz_str(buf), "B%s$%s#.OPENOBJ=%lu",
								dyntab_val(&form->id_form, 0, 0),
								dyntab_val(&form->id_obj, 0, 0),
								idobj);
				M_FREE(name);
				if(qry_obj_idfield(cntxt, &ctrlval, idobj, 0) ||
					qry_obj_label(cntxt, &name, NULL, &name, NULL, &name, NULL, NULL, NULL, 0, &ctrlval, 0) ||
					put_html_button(cntxt, buf, NULL, "_eva_open_small.gif", "_eva_open_small_s.gif", name->data, 0, 0))
					STACK_ERROR;
				DYNTAB_FREE(ctrlval);
			}

			/* Output option help text if applicable */
			if(*helptext && i_opt)
			{
				if(qry_obj_field(cntxt, &ctrlval, dyntab_cell(optlist, i_opt - 1, 0)->IdObj, "_EVA_NOTES"))
					STACK_ERROR;
				if(ctrlval.nbrows)
				{
					if(ctrl->BOLD) DYNBUF_ADD_STR(cntxt->form->html, "</b>");
					DYNBUF_ADD_STR(cntxt->form->html, "<br><font size=-1>");
					DYNBUF_ADD_CELL(cntxt->form->html, &ctrlval, 0, 0, TO_HTML);
					DYNBUF_ADD_STR(cntxt->form->html, "</font>");
					if(ctrl->BOLD) DYNBUF_ADD_STR(cntxt->form->html, "<b>");
					DYNTAB_FREE(ctrlval);
				}
			}
		}
	}

	if(!ctrl->val.nbrows)
	{
		CTRL_CGINAMEVAL(&name, 0);
		DYNBUF_ADD3_BUF(cntxt->form->html, "<input type=hidden name='", name, NO_CONV, "'>");
		if(cntxt->debug & DEBUG_HTML) DYNBUF_ADD_STR(cntxt->form->html, "\n");
		if(ctrl_put_hidden_old(cntxt, ctrl, 0, name, NULL, 0)) STACK_ERROR;
	}

	RETURN_OK_CLEANUP;
}
#undef ERR_FUNCTION
#undef ERR_CLEANUP

/*********************************************************************
** Function : ctrl_add_input_list
** Description : handles INPUT controls of type LIST
*********************************************************************/
#define ERR_FUNCTION "ctrl_add_input_list"
#define ERR_CLEANUP DYNTAB_FREE(optlist); \
					DYNTAB_FREE(data); \
					DYNTAB_FREE(options); \
					M_FREE(name)
int ctrl_add_input_list(			/* return : 0 on success, other on error */
	EVA_context *cntxt,				/* in/out : execution context data */
	unsigned long i_ctrl			/* in : control index in cntxt->form->ctrl */
){
	EVA_form *form = cntxt->form;
	EVA_ctrl *ctrl = form->ctrl + i_ctrl;
	DynTable optlist = { 0 };
	DynTable data = { 0 };
	DynTable options = { 0 };
	DynBuffer *name = NULL;
	unsigned long i, j, i_opt;
	int b_submit;
	int b_multiple = ctrl->MULTIPLE[0] != 0 && strcmp("No", ctrl->MULTIPLE);
	char *inputmode, *allow_other;
	DynTableCell *expr;
	int empty_val = 0;

	/* Read control attributes */
	CTRL_OPTIONAL(options, CTRLTREE);

	switch(form->step)
	{
	case CtrlRead:
		/* Add list options */
		CTRL_ADD_CHILD(i_ctrl, &options);
		ctrl = form->ctrl + i_ctrl;

		/* Count empty values (used to decide the strategy for values usage) */
		for(i = 0; i < options.nbrows; i++)
		{
			i_opt = ctrl_from_id(cntxt, i_ctrl, DYNTAB_VAL_SZ(&options, i, 0));
			if(i_opt && !ATTR_CELL(form->ctrl + i_opt, VALUE))
			{
				ctrl->i_empty = empty_val ? 0 : i_opt;
				empty_val++;
			}
		}
		ctrl->b_use_val = !empty_val || empty_val == 1 &&  options.nbrows > 1;
		break;

	case HtmlEdit:
		if(!form->html) break;

		/* Build list of options values & label */
		for(i = 0; i < options.nbrows; i++)
		{
			i_opt = ctrl_from_id(cntxt, i_ctrl, DYNTAB_VAL_SZ(&options, i, 0));
			if(i_opt)
			{
				/* Check access to option */
				if(ctrl_check_access(cntxt, form->ctrl + i_opt)) STACK_ERROR;
				if((form->ctrl[i_opt].access & AccessView) && form->ctrl[i_opt].b_selected || (form->ctrl[i_opt].access & AccessEdit))
				{
					j = optlist.nbrows;
					if(ctrl->b_use_val) 
					{
						DYNTAB_SET_CELLP(&optlist, j, 1, ATTR_CELL(form->ctrl + i_opt, LABEL));
						DYNTAB_SET_CELLP(&optlist, j, 0, ATTR_CELL(form->ctrl + i_opt, VALUE));
					}
					else
						DYNTAB_SET_CELLP(&optlist, j, 0, ATTR_CELL(form->ctrl + i_opt, LABEL));
					dyntab_cell(&optlist, j, 0)->row = i_opt;
				}
			}
		}

		/* Add calc-ed options */
		expr = CTRL_ATTR_CELL(CALCOPTIONS);
		if(expr)
		{
			if(form_eval_fieldexpr(cntxt, &data, 
					DYNTAB_TOUL(&form->id_form),
					DYNTAB_TOUL(&form->id_obj),
					expr->txt, expr->len, NULL, 0 ))
				STACK_ERROR;
			for(i = 0; i < data.nbrows; i++) DYNTAB_ADD_CELL(&optlist, optlist.nbrows, 0, &data, i, 0);
		}

		/* Check for submit on change (set if options have lower level controls or other values allowed) */
		allow_other = CTRL_ATTR_VAL(ALLOW_OTHER);
		b_submit = CTRL_ATTR_CELL(ONCHANGE) || *allow_other;
		for(i = ctrl->i_child; !b_submit && i; i = form->ctrl[i].i_brother)
			b_submit = ATTR_CELL(form->ctrl + i, CTRLTREE) != 0;

		/* Add control header */
		if(ctrl_format_pos(cntxt, ctrl, 1)) STACK_ERROR;

		/* Handle input mode */
		inputmode = CTRL_ATTR_VAL(INPUTMODE);
		if(!strcmp(inputmode, "_EVA_OPTIONS"))
		{
			/* Options list : build CGI name for options */
			int b_empty = 0;
			DynTableCell *val;
			if(ctrl_cgi_name(cntxt, ctrl, NULL, 0, &name, 0, NULL, 0)) STACK_ERROR; 
			ctrl->b_selected = 1;

			/* Output empty option if applicable */
			DYNBUF_ADD_STR(form->html, "<font size=-1></b>");
			for(i = 0; i < optlist.nbrows && dyntab_sz(&optlist, i, 0); i++);
			if(!ctrl->b_use_val && i == optlist.nbrows && !b_multiple && !CTRL_ATTR_CELL(ALLOWEMPTY))
			{
				b_empty = 1;
				if(put_html_chkbox(cntxt, DYNBUF_VAL_SZ(name), "", 0,
					(ctrl->val.nbrows ? 0 : 1) + (b_multiple ? 0 : 2), b_submit)) STACK_ERROR;
				DYNBUF_ADD_STR(form->html, "(non renseigné)");
			}

			/* Output each option */
			for(i = 0; i < optlist.nbrows; i++)
			{
				EVA_ctrl *optctrl = form->ctrl + dyntab_cell(&optlist, i, 0)->row;
				
				/* Search option in values to determine selected status */
				for(j = 0; j < ctrl->val.nbrows && dyntab_cmp(&optlist, i, 0, &ctrl->val, j, 0); j++);
 				val = dyntab_cell(&ctrl->val, j, 0);
				if(val) val->col  = 1;

				/* Output option : radio or chexkbox depending on b_multiple setting */
				if(i || b_empty) DYNBUF_ADD_STR(form->html, "<br>");
				if(put_html_chkbox(cntxt, DYNBUF_VAL_SZ(name), DYNTAB_VAL_SZ(&optlist, i, 0),
					((val || !ctrl->val.nbrows && ctrl->b_use_val && !dyntab_sz(&optlist, i, 0)) ? 1 : 0) +
					(b_multiple ? 0 : 2), b_submit)) STACK_ERROR;
				if(val && ctrl_put_hidden_old(cntxt, ctrl, j, name, NULL, 0)) STACK_ERROR;

				/* Output option label & help button */
				DYNBUF_ADD_CELL(form->html, &optlist, i, ctrl->b_use_val ? 1 : 0, TO_HTML);
				if(optctrl->NOTES[0] && ctrl_add_opt_btn(cntxt, optctrl)) STACK_ERROR;
			}
		
			/* Add HTML code for unlisted values */
			for(i = 0; i < ctrl->val.nbrows; i++) 
			{
				DynTableCell *val = dyntab_cell(&ctrl->val, i, 0);
				if(!val->col && val->len && val->txt && val->txt[0])
				{
					/* Output box & option label */
					DYNBUF_ADD_STR(form->html, "<br>");
					if(put_html_chkbox(cntxt, DYNBUF_VAL_SZ(name), DYNTAB_VAL_SZ(&ctrl->val, i, 0), 1, b_submit)) STACK_ERROR;
					if(ctrl_put_hidden_old(cntxt, ctrl, i, name, NULL, 0)) STACK_ERROR;
					DYNBUF_ADD_CELL(form->html, &ctrl->val, i, ctrl->b_use_val ? 1 : 0, TO_HTML);
					DYNBUF_ADD_STR(form->html, "<br>");
				}
			}

			/* Add hidden input for empty value */
			if(!ctrl->val.nbrows && !b_multiple)
			{
				if(ctrl_put_hidden_old(cntxt, ctrl, i, name, NULL, 0)) STACK_ERROR;
			}
			DYNBUF_ADD_STR(form->html, "</font>");
		}
		else
		{
			/* Standard list input */
			if(ctrl_put_html_input_list(cntxt, i_ctrl, &optlist, b_submit)) STACK_ERROR;
		}

		/* Handle free user input if allowed */
		if(*allow_other && (b_multiple || !ctrl->val.nbrows))
		{
			CTRL_CGINAMEVAL(&name, ctrl->val.nbrows);
			DYNBUF_ADD_STR(&name, ".0");
			DYNBUF_ADD_STR(form->html, "<br>");
			if(put_html_text_input(cntxt, 
								DYNBUF_VAL_SZ(name),
								NULL, 0, 0, 0, 1, ctrl->COLUMNS / 2,
								atoi(CTRL_ATTR_VAL(MAXLENGTH)))) STACK_ERROR;

		}

		/* Add control footer */
		if(ctrl_format_pos(cntxt, ctrl, 0)) STACK_ERROR;
		break;

	case HtmlPrint:
	case HtmlView:
		if(!form->html) break;

		/* Add HTML code for control label & position */
		if(ctrl_format_pos(cntxt, ctrl, 1)) STACK_ERROR;

		/* If no value : output empty value label if any */
		if(!ctrl->val.nbrows && ctrl->b_use_val && ctrl->i_empty)
			DYNBUF_ADD_CELLP(form->html, ATTR_CELL(form->ctrl + ctrl->i_empty, LABEL), TO_HTML);
		
		/* For each value */
		for(i = 0; i < ctrl->val.nbrows; i++)
		{
			DynTableCell *val = dyntab_cell(&ctrl->val, i, 0);

			/* Search value in options values */
			for(j = 0, i_opt = 0; j < options.nbrows; j++)
			{
				i_opt = ctrl_from_id(cntxt, i_ctrl, DYNTAB_VAL_SZ(&options, j, 0));
				if(!i_opt) continue;
				if(!strcmp(ATTR_VAL(form->ctrl + i_opt, VALUE), val->txt)) break;
			}

			/* Add value */
			if(i) DYNBUF_ADD_STR(form->html, "<br>");
			if(i_opt) DYNBUF_ADD_CELLP(form->html,
							(j < options.nbrows ? 
								ATTR_CELL(form->ctrl + i_opt, LABEL) :
								dyntab_cell(&ctrl->val, i, 0)),
							TO_HTML);
		}

		/* Add HTML code for control footer */
		if(ctrl_format_pos(cntxt, ctrl, 0)) STACK_ERROR;
		break;
	}

	/* Handle controls under selected options */
	if(ctrl_add_selected_options(cntxt, i_ctrl, &options, b_multiple)) STACK_ERROR;

	RETURN_OK_CLEANUP;
}
#undef ERR_FUNCTION
#undef ERR_CLEANUP
