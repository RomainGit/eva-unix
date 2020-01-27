/*********************************************************************
**        File : ctrl_utils.c
** Description : HTML controls handling utilities
**      Author : Alain BOUTE
**     Created : Aug 18 2001
*********************************************************************/

#include "eva.h"

/*********************************************************************
** Function : ctrl_set_format_attr
** Description : read control format attributes in ctrl->attr or form / default form
*********************************************************************/
#define ERR_FUNCTION "ctrl_set_format_attr"
#define ERR_CLEANUP 
int ctrl_set_format_attr(			/* return : 0 on success, other on error */
	EVA_context *cntxt,				/* in : execution context data */
	EVA_ctrl *ctrl					/* in : control to process */
){
	/* Get server format defaults if applicable */
	if(!cntxt->srvfmt.attr.nbrows && cntxt->cnf_data.nbrows)
	{
		memcpy(&cntxt->srvfmt.attr, &cntxt->cnf_data, sizeof(cntxt->srvfmt.attr));
		if(ctrl_set_format_attr(cntxt, &cntxt->srvfmt)) STACK_ERROR;
	}

	/* Get control format */
	CTRL_ATTR_GET(LABELPOS);
	CTRL_ATTR_GET(POSITION);
	CTRL_ATTR_GET(COLSPAN);
	CTRL_ATTR_GET(ROWSPAN);
	ctrl->LINES = strtoul(CTRL_ATTR_VAL(LINES), NULL, 10);
	ctrl->COLUMNS = strtoul(CTRL_ATTR_VAL(COLUMNS), NULL, 10);
	
	/* Get cell modifiers */
	CTRL_ATTR_GET(ALIGN);
	CTRL_ATTR_GET(VALIGN);
	CTRL_ATTR_GET(WIDTH);
	CTRL_ATTR_GET(HEIGHT);
	CTRL_ATTR_GETFORM(BGCOLOR);
	CTRL_ATTR_GETFORM(BACKGROUND);

	/* Get font modifiers */
	CTRL_ATTR_GETFORM(FONTFACE);
	CTRL_ATTR_GETFORM(FONTSIZE);
	CTRL_ATTR_GETFORM(FONTCOLOR);
	CTRL_ATTR_GETFORM(BOLD);
	CTRL_ATTR_GETFORM(ITALIC);
	CTRL_ATTR_GETFORM(UNDERLINE);

	/* Get label attributes */
	CTRL_ATTR_GET(LABEL);
	CTRL_ATTR_GET(LABELALIGN);
	CTRL_ATTR_GET(LABELVALIGN);
	CTRL_ATTR_GET(LABELWIDTH);
	CTRL_ATTR_GET(LABELHEIGHT);
	CTRL_ATTR_GETFORM(LABELBGCOLOR);
	CTRL_ATTR_GETFORM(LABELBACKGROUND);

	/* Get label font modifiers */
	CTRL_ATTR_GETFORM(LABELFONTFACE);
	CTRL_ATTR_GETFORM(LABELFONTSIZE);
	CTRL_ATTR_GETFORM(LABELFONTCOLOR);
	CTRL_ATTR_GETFORM(LABELBOLD);
	CTRL_ATTR_GETFORM(LABELITALIC);
	CTRL_ATTR_GETFORM(LABELUNDERLINE);
	if(!ctrl->LABELFONTFACE[0]) ctrl->LABELFONTFACE = ctrl->FONTFACE;

	/* Get table attributes */
	CTRL_ATTR_GET(TABLEWIDTH);
	CTRL_ATTR_GET(TABLERULES);
	CTRL_ATTR_GET(TABLEBGCOLOR);
	CTRL_ATTR_GET(TABLEBACKGROUND);
	ctrl->BORDER = strtoul(CTRL_ATTR_VAL(BORDER), NULL, 10);

	RETURN_OK_CLEANUP;
}
#undef ERR_FUNCTION
#undef ERR_CLEANUP

/*********************************************************************
** Function : ctrl_set_common_attr
** Description : read control attributes in ctrl->attr or form / default form
*********************************************************************/
#define ERR_FUNCTION "ctrl_set_common_attr"
#define ERR_CLEANUP 
int ctrl_set_common_attr(			/* return : 0 on success, other on error */
	EVA_context *cntxt,				/* in : execution context data */
	EVA_ctrl *ctrl					/* in : control to process */
){

	/* Get control attributes */
	CTRL_ATTR_GET(CONTROL);
	CTRL_ATTR_GET(TYPE);
	CTRL_ATTR_GET(FIELD);
	CTRL_ATTR_GET(NOTES);
	CTRL_ATTR_GET(OPTIONBUTTON);
	CTRL_ATTR_GET(ALLOWEMPTY);
	CTRL_ATTR_GET(MULTIPLE);
	if(ctrl_set_format_attr(cntxt, ctrl)) STACK_ERROR;

	RETURN_OK_CLEANUP;
}
#undef ERR_FUNCTION
#undef ERR_CLEANUP

/*********************************************************************
** Function : ctrl_add_new
** Description : add a control to form list
*********************************************************************/
#define ERR_FUNCTION "ctrl_add_new"
#define ERR_CLEANUP	DYNTAB_FREE(data)
int ctrl_add_new(					/* return : 0 on success, other on error */
	EVA_context *cntxt,				/* in/out : execution context data */
	unsigned long i_parent,			/* in : parent control index in cntxt->form->ctrl */
	unsigned long *i_list,			/* in/out : start / end position in cntxt->form->ctrl[i_parent].childata */
	unsigned long *_i_ctrl			/* out : index of new control in cntxt->form->ctrl */
){
	EVA_form *form = cntxt->form;
	unsigned long i_ctrl = form->nb_ctrl;
	EVA_ctrl *ctrl;
	DynTable *list = form->ctrl ? &form->id_form : NULL;
	DynTable data = {0};

	/* Realloc controls table */
	M_REALLOC(EVA_ctrl, form->ctrl, form->nb_ctrl);
	if(_i_ctrl) *_i_ctrl = i_ctrl;
	ctrl = form->ctrl + i_ctrl;

	/* If level 0 (form control) */
	if(!list)
	{
		/* Read form control in ctrl->attr & store ctrl->id */
		if(qry_obj_data(cntxt, &ctrl->attr, &form->id_form, NULL)) STACK_ERROR;
		DYNTAB_ADD_CELL(&ctrl->id, 0, 0, &form->id_form, 0, 0);
	}
	else
	{
		/* Read control attributes in ctrl->attr & store ctrl->id */
		list = &form->ctrl[i_parent].childdata;
		if(dyntab_filter_field(&ctrl->attr, 1, list, NULL, 0, 1, i_list)) RETURN_ERR_MEMORY;
		DYNTAB_ADD_INT(&ctrl->id, 0, 0, dyntab_cell(list, i_list ? *i_list : 0, 0)->IdObj);
	}

	{
		/* Read undefined attributes from base control if any */
		DynTableCell *baseobj = CTRL_ATTR_CELL(BASE_STYLE);
		if(baseobj)
		{
			if(qry_obj_field(cntxt, &data, strtoul(baseobj->txt, NULL, 10), NULL)) STACK_ERROR;
			if(qry_complete_data(cntxt, &ctrl->attr, &data, NULL, NULL)) STACK_ERROR;
		}
	}

	/* Read control common attributes */
	if(ctrl_set_common_attr(cntxt, ctrl)) STACK_ERROR;

	/* Look for control handlers */
	while(	ctrl_handlers[ctrl->i_handler].control && 
			(	strcmp(ctrl_handlers[ctrl->i_handler].control, ctrl->CONTROL) ||
				ctrl_handlers[ctrl->i_handler].type &&
				strcmp(ctrl_handlers[ctrl->i_handler].type, ctrl->TYPE)))
		ctrl->i_handler++;

	RETURN_OK_CLEANUP;
}
#undef ERR_FUNCTION
#undef ERR_CLEANUP

/*********************************************************************
** Function : ctrl_from_cginame
** Description : search the control matching the given CGI name
*********************************************************************/
int ctrl_from_cginame(				/* return : control index in cntxt->form->ctrl or 0 if no match */
	EVA_context *cntxt,				/* in : execution context data */
	char *cginame, size_t sz		/* in : searched CGI name */
){
	EVA_form *form = cntxt->form;
	unsigned long j;

	/* Search loop on form->ctrl */
	for(j = 0; j < form->nb_ctrl; j++)
	{
		DynBuffer *name = form->ctrl[j].cginame;
		if(name && name->cnt <= sz && !strncmp(cginame+1, name->data + 1, name->cnt - 1)) 
			return j;
	}

	return 0;
}

/*********************************************************************
** Function : ctrl_from_id
** Description : search the control in a control children matching the given id
*********************************************************************/
unsigned long ctrl_from_id(			/* return : control index in cntxt->form->ctrl or -1 if no match */
	EVA_context *cntxt,				/* in : execution context data */
	unsigned long i_ctrl,			/* in : parent control index in cntxt->form->ctrl */
	char *id, size_t sz_id			/* in : searched control id */
){
	EVA_form *form = cntxt->form;
	unsigned long j;

	for(j = form->ctrl[i_ctrl].i_child; j; j = form->ctrl[j].i_brother)
		if(!dyntab_txt_cmp(id, sz_id, &form->ctrl[j].id, 0, 0))
			return j;

	return 0;
}

/*********************************************************************
** Function : ctrl_add_value
** Description : add a value to the given control (handling CGI input)
*********************************************************************/
#define ERR_FUNCTION "ctrl_add_value"
#define ERR_CLEANUP M_FREE(name)
int ctrl_add_value(					/* return : 0 on success, other on error */
	EVA_context *cntxt,				/* in : execution context data */
	unsigned long i_ctrl,			/* in : control index in cntxt->form->ctrl */
	char *txt, size_t len,			/* in : value to add */
	unsigned long num,				/* in : number index for value */
	unsigned long line,				/* in : line index for value */
	char b_modified					/* in : modification status */
){
	EVA_form *form = cntxt->form;
	EVA_ctrl *ctrl = form->ctrl + i_ctrl;
	DynTableCell *c;
	unsigned long row = ctrl->val.nbrows;
	DynBuffer *name = NULL;

	DYNTAB_ADD(&ctrl->val, row, 0, txt, len, NO_CONV);
	c = dyntab_cell(&ctrl->val, row, 0);
	c->Line = line;
	c->Num = num;
	c->b_modified = b_modified;
	ctrl->b_modified |= b_modified;
	DYNBUF_ADD_BUF(&name, ctrl->cginame, NO_CONV);
	if(cgi_build_finalname(cntxt, &name, 'D', NULL, 0, num, line, 0) ||
		cgi_add_input(cntxt, &c->i_cgi, DYNBUF_VAL_SZ(name), txt, len)) STACK_ERROR;

	RETURN_OK_CLEANUP;
}
#undef ERR_FUNCTION
#undef ERR_CLEANUP

/*********************************************************************
** Function : ctrl_del_value
** Description : delete a value in the given control (handling CGI input)
*********************************************************************/
void ctrl_del_value(
	EVA_context *cntxt,				/* in : execution context data */
	unsigned long i_ctrl,			/* in : control index in cntxt->form->ctrl */
	unsigned long i_val				/* in : value index in cntxt->form->ctrl->val */
){
	EVA_form *form = cntxt->form;
	EVA_ctrl *ctrl = form->ctrl + i_ctrl;
	cgi_value_setkeep(cntxt, &ctrl->val, i_val, 2);
	dyntab_del_rows(&ctrl->val, i_val, 1);
	ctrl->b_modified = 1;
}

/*********************************************************************
** Function : ctrl_renumber_values
** Description : renumber values indexes of a control
*********************************************************************/
void ctrl_renumber_values(
	EVA_ctrl *ctrl,						/* in : control to process */
	int b_keepold						/* in : keep old indexes if 1, else make new indexes starting at 1 */
){
	unsigned long i, line, maxnum, maxline = 0;
	DynTableCell *val;
	char *multiple = ctrl->MULTIPLE;
	int b_nodup = strcmp(multiple, "Yes");

	if(!ctrl || !ctrl->val.nbrows) return;

	/* Handle duplicate values */
	if(b_nodup)
		for(i = 0; i < ctrl->val.nbrows; i++)
			for(line = i + 1; line < ctrl->val.nbrows; line ++)
			{
				DynTableCell *v1 = dyntab_cell(&ctrl->val, i, 0);
				DynTableCell *v2 = dyntab_cell(&ctrl->val, line, 0);
				if(v1->Line == v2->Line && !STRCMPNUL(v1->txt, v2->txt))
					dyntab_del_rows(&ctrl->val, line--, 1);
			}

	/* Look for maximum line number */
	for(i = 0; i < ctrl->val.nbrows; i++)
	{
		val = dyntab_cell(&ctrl->val, i, 0);
		if(val->Line > maxline) maxline = val->Line;
	}

	/* Process each line */
	for(line = 0; line <= maxline; line ++)
	{
		/* Look for maximum index numbers */
		maxnum = 0;
		if(b_keepold) for(i = 0; i < ctrl->val.nbrows; i++)
		{
			val = dyntab_cell(&ctrl->val, i, 0);
			if(val->Line != line) continue;
			if(val->Num > maxnum) maxnum = val->Num;
		}

		/* Renumber values */
		for(i = 0; i < ctrl->val.nbrows; i ++) 
		{
			val = dyntab_cell(&ctrl->val, i, 0);
			if(val->Line != line) continue;
			if(!b_keepold || !val->Num)
			{
				maxnum++;
				val->Num = maxnum;
			}
		}
	}

	/* Sort values on Line / Num */
	dyntab_sort(&ctrl->val, qsort_ctrlval);

	return;
}

/*********************************************************************
** Function : ctrl_add_child
** Description : add child controls except otpions
*********************************************************************/
#define ERR_FUNCTION "ctrl_add_child"
#define ERR_CLEANUP
int ctrl_add_child(					/* return : 0 on success, other on error */
	EVA_context *cntxt,				/* in/out : execution context data */
	unsigned long i_ctrl,			/* in : control index in cntxt->form->ctrl */
	DynTable *childlist				/* in : list of children controls ids */
){
	EVA_form *form = cntxt->form;
	EVA_ctrl *ctrl = form->ctrl + i_ctrl;
	EVA_ctrl *newctrl;
	unsigned long i_newctrl, i_prevctrl;
	unsigned long i, j, nbrows;

	if(form->b_noctrltree) RETURN_OK;

	switch(form->step)
	{
	case CtrlRead:
		if(!childlist || !childlist->nbrows) RETURN_OK;

		/* Initialize i_prevctrl with last child */
		for(i_prevctrl = ctrl->i_child; form->ctrl[i_prevctrl].i_brother; i_prevctrl = form->ctrl[i_prevctrl].i_brother); 

		/* Remove controls in childlist already in parents - prevent infinite loops on CTRLTREE */
		for(i = i_ctrl; i != form->ctrl[i].i_parent; i = form->ctrl[i].i_parent)
			for(j = 1; childlist->nbrows && j <= childlist->nbrows; j++)
				if(!dyntab_cmp(&form->ctrl[i].id, 0, 0, childlist, j - 1, 0))
					dyntab_del_rows(childlist, --j, 1);

		/* Read children objects data */
		if(qry_obj_data(cntxt, &ctrl->childdata, childlist, NULL)) STACK_ERROR;
		nbrows = ctrl->childdata.nbrows;
		for(i = 0; i < nbrows; i++)
		{
			/* Add a new control in form list */
			CGIData *clickcgibtn;
			if(ctrl_add_new(cntxt, i_ctrl, &i, &i_newctrl)) STACK_ERROR;

			/* Store controls tree chaining */
			ctrl = form->ctrl + i_ctrl;
			newctrl = form->ctrl + i_newctrl;
			newctrl->i_parent = i_ctrl;
			if(!ctrl->i_child) ctrl->i_child = i_newctrl;
			if(i_prevctrl) form->ctrl[i_prevctrl].i_brother = i_newctrl;
			i_prevctrl = i_newctrl;

			/* Set control clicked condition */
			clickcgibtn = cntxt->cgi ? cntxt->cgi + cntxt->cgibtn : NULL;
			if(cgi_build_basename(cntxt, &newctrl->cginame, i_newctrl, 'C')) STACK_ERROR;
			if(clickcgibtn && newctrl->cginame->cnt <= clickcgibtn->name_sz && 
				!strncmp(clickcgibtn->name + 1, newctrl->cginame->data + 1, newctrl->cginame->cnt - 1)) 
				cntxt->form->i_ctrl_clic = i_newctrl;
		
			/* Call control handler */
			CTRL_PRI_HDLR(i_newctrl);
			newctrl = form->ctrl + i_newctrl;

			/* Set CGI name if not set by handler */
			if(!newctrl->cginame && cgi_build_basename(cntxt, &newctrl->cginame, i_newctrl, 'C'))
				STACK_ERROR;
		}
		dyntab_free(&form->ctrl[i_ctrl].childdata);
		break;

	default:
		/* Call control handler for each child */
		if(childlist)
		{
			for(i = 0; i < childlist->nbrows; i++)
			{
				/* Search control & call control handler if found */
				j = ctrl_from_id(cntxt, i_ctrl, DYNTAB_VAL_SZ(childlist, i, 0));
				if(j)
				{
					CTRL_PRI_HDLR(j);

					/* Set CGI name (object id may have changed) */
					if(form->step == FormSave && 
						cgi_build_basename(cntxt, &form->ctrl[j].cginame, j, form->ctrl[j].cginame->data[0]))
						STACK_ERROR;
				}
			}
		}
		else
		{
			for(i = ctrl->i_child; i; i = form->ctrl[i].i_brother)
				CTRL_PRI_HDLR(i);
		}
	}

	RETURN_OK_CLEANUP;
}
#undef ERR_FUNCTION
#undef ERR_CLEANUP

/*********************************************************************
** Function : ctrl_set_attr
** Description : set the values of a control attribute
*********************************************************************/
#define ERR_FUNCTION "ctrl_set_attr"
#define ERR_CLEANUP
int ctrl_set_attr(					/* return : 0 on success, other on error */
	EVA_context *cntxt,				/* in/out : execution context data */
	EVA_ctrl *ctrl,					/* in : control to read */
	char *attr,						/* in : control field to search for */
	DynTable *data					/* in : values to store */
){
	unsigned long i;

	if(!ctrl || !attr || !*attr) RETURN_OK;

	/* Remove attribute's current values (set field name to null string) */
	for(i = 0; i < ctrl->attr.nbrows; i++)
	{
		DynTableCell *cell = dyntab_cell(&ctrl->attr, i, 0);
		if(cell->field && !strcmp(attr, cell->field))
			cell->field[0] = 0;
	}

	/* Add attribute's new values */
	if(data)
		for(i = 0; i < data->nbrows; i++)
			if(dyntab_copy(&ctrl->attr, ctrl->attr.nbrows, 0, dyntab_cell(data, i, 0), 1))
				RETURN_ERR_MEMORY;
	
	RETURN_OK_CLEANUP;
}
#undef ERR_FUNCTION
#undef ERR_CLEANUP

/*********************************************************************
** Function : ctrl_set_attr_txt
** Description : set text value of a control attribute
*********************************************************************/
#define ERR_FUNCTION "ctrl_set_attr_txt"
#define ERR_CLEANUP	DYNTAB_FREE(tval)
int ctrl_set_attr_txt(				/* return : 0 on success, other on error */
	EVA_context *cntxt,				/* in/out : execution context data */
	EVA_ctrl *ctrl,					/* in : control to read */
	char *attr,						/* in : control field to search for */
	char *txt, size_t len			/* in : text to store */
){
	DynTable tval = { 0 }; 
	DynTableCell *cell;

	if(dyntab_add(&tval, 0, 0, txt, len, NO_CONV)) RETURN_ERR_MEMORY;	
	cell = dyntab_cell(&tval, 0, 0);
	cell->field = attr;
	cell->b_dontfreefield = 1;
	cell->IdObj = DYNTAB_TOUL(&ctrl->id);
	if(ctrl_set_attr(cntxt, ctrl, attr, &tval)) STACK_ERROR; 

	RETURN_OK_CLEANUP;
}
#undef ERR_FUNCTION
#undef ERR_CLEANUP

/*********************************************************************
** Function : ctrl_check_error_status
** Description : check for warnings or errors on a control
*********************************************************************/
#define ERR_FUNCTION "ctrl_check_error_status"
#define ERR_CLEANUP DYNTAB_FREE(res)
int ctrl_check_error_status(		/* return : 0 on success, other on error */
	EVA_context *cntxt,				/* in/out : execution context data */
	EVA_ctrl *ctrl					/* in : control to process */
){
	EVA_form *form = cntxt->form;
	DynTable res = {0};
	DynTable chkexpr = {0};
	DynTable status = {0};
	DynTable message = {0};
	unsigned long i, j, k, cnt;
	char *allowempty = CTRL_ATTR_VAL(ALLOWEMPTY);
	char *multiple = CTRL_ATTR_VAL(MULTIPLE);
	int b_editable;

	/* Return if no check needed */
	ctrl->error = 0;
	M_FREE(ctrl->errmsg);
	if(!ctrl->storage) RETURN_OK;

	/* Check if editable in parents - return if not */
	b_editable = ctrl->access & AccessEdit && form->ctrl->access & (form->b_newobj ? AccessCreate : AccessEdit);
	for(i = ctrl->i_parent; i && b_editable; i = form->ctrl[i].i_parent)
		b_editable = (form->ctrl[i].access & AccessEdit) != 0;
	if(!b_editable) RETURN_OK;

	/* Check for multiple values */
	if((!*multiple || !strcmp("No", multiple)) && ctrl->val.nbrows > 1)
	{
		ctrl->error = 2;
		if(ctrl->errmsg) DYNBUF_ADD_STR(&ctrl->errmsg, "\n");
		DYNBUF_ADD_STR(&ctrl->errmsg, "Vous devez sélectionner une seule valeur");
		RETURN_OK;
	}

	if(!*allowempty || !strcmp("Yes", allowempty)) RETURN_OK;

	/* Count # of non empty values */
	for(i = 0, cnt = 0; i < ctrl->val.nbrows; i++)
		if(dyntab_sz(&ctrl->val, i, 0)) cnt++;

	/* Handle condition */
	if(!strcmp("_EVA_CONDITION", allowempty))
	{
		/* Read conditions */
		CTRL_READ_ATTR_TAB(chkexpr, CHECK_EXPR);
		k = chkexpr.nbrows;
		CTRL_READ_ATTR_TAB(status, ERR_STATUS);
		if(k < status.nbrows) k = status.nbrows;
		CTRL_READ_ATTR_TAB(message, ERRMSG);
		if(k < message.nbrows) k = message.nbrows;

		/* Process each line */
		for(i = 0; i < k; i++)
		{
			/* Evaluate condition if applicable */
			char *val, *stat = dyntab_val(&status, i, 0), *msg = dyntab_val(&message, i, 0);
			if(!dyntab_sz(&chkexpr, i, 0))
			{
				if(!*msg && !cnt) { allowempty = stat; break; }
				DYNTAB_ADD_INT(&res, 0, 0, cnt ? 0 : 1);
			}
			else if(form_eval_fieldexpr(cntxt, &res,
					DYNTAB_TOUL(&cntxt->form->id_form),
					DYNTAB_TOUL(&cntxt->form->id_obj),
					DYNTAB_VAL_SZ(&chkexpr, i, 0), NULL, 0))
				CLEAR_ERROR;

			/* Handle result - OR multiple values */
			val = dyntab_val(&res, 0, 0);
			for(j = 1; j < res.nbrows; j++)
			{
				DynTableCell *c = dyntab_cell(&res, j, 0);
				if((!cntxt->form->Line || !c->Line || c->Line == cntxt->form->Line) &&
					(!cntxt->form->Num || !c->Num || c->Num == cntxt->form->Num) &&
					c->txt && c->txt[0] && strcmp(c->txt, "0"))
				{
					val = c->txt;
					break;
				}
			}

			/* Handle result - continue if condition not matched */
			if(!*val || !strcmp(val, "0")) continue;

			/* Condition matched : handle status & message */
			if(!*stat && !strcmp(val, "1")) RETURN_OK;
			if(!*msg && strcmp(val, "1")) msg =  val; 
			ctrl->error = strcmp(stat, "No") ? 1 : 2;
			if(!*msg) msg = ctrl->error & 2 ? "Saisie obligatoire" : "Saisie recommandée";
			if(ctrl->errmsg) DYNBUF_ADD_STR(&ctrl->errmsg, "\n");
			DYNBUF_ADD(&ctrl->errmsg, msg, 0, NO_CONV);
			RETURN_OK;
		}
		if(i == k) RETURN_OK;
	}

	/* Set error if applicable */
	ctrl->error = cnt ? 0 : strcmp("No", allowempty) ? 1 : 2;
	if(ctrl->error)
	{
		if(ctrl->errmsg) DYNBUF_ADD_STR(&ctrl->errmsg, "\n");
		DYNBUF_ADD(&ctrl->errmsg, ctrl->error & 2 ? "Saisie obligatoire" : "Saisie recommandée", 0, NO_CONV); 
	}

	RETURN_OK_CLEANUP;
}
#undef ERR_FUNCTION
#undef ERR_CLEANUP

/*********************************************************************
** Function : ctrl_add_opt_btn
** Description : output HTML code for the 'input options' button of a control
*********************************************************************/
#define ERR_FUNCTION "ctrl_add_opt_btn"
#define ERR_CLEANUP M_FREE(tooltip); \
					M_FREE(cginame); \
					M_FREE(image); \
					M_FREE(imgsel)
int ctrl_add_opt_btn(
	EVA_context *cntxt,			/* in/out : execution context data */
	EVA_ctrl *ctrl	 			/* in : input control to process */
){
	DynBuffer *tooltip = NULL;
	DynBuffer *cginame = NULL;
	DynBuffer *image = NULL;
	DynBuffer *imgsel = NULL;

	if(!strcmp(ctrl->OPTIONBUTTON, "_EVA_NONE") || cntxt->form && cntxt->form->step == HtmlPrint) RETURN_OK;

	DYNBUF_ADD3(&tooltip, " [", ctrl->LABEL, 0, NO_CONV, "]");


	/* Button images depend error status & control type */
	if(!strcmp(ctrl->CONTROL, "_EVA_OPTION"))
	{
		DYNBUF_ADD_STR(&image, "_eva_opt_help_small.gif");
		DYNBUF_ADD_STR(&imgsel, "_eva_opt_help_small_s.gif");
	}
	else switch(ctrl->error)
	{
	case 1:
		DYNBUF_ADD_STR(&image, "_eva_blink_orange.gif");
		DYNBUF_ADD_STR(&imgsel, "_eva_btn_helpbook_s.gif");
		break;
	case 2:
		DYNBUF_ADD_STR(&image, "_eva_blink_red.gif");
		DYNBUF_ADD_STR(&imgsel, "_eva_btn_helpbook_s.gif");
		break;
	default:
		DYNBUF_ADD_STR(&image, "_eva_btn_helpbook.gif");
		DYNBUF_ADD_STR(&imgsel, "_eva_btn_helpbook_s.gif");
	}

	/* Format button tooltip & CGI name */
	if(ctrl->errmsg) DYNBUF_ADD3_BUF(&tooltip, " - ", ctrl->errmsg, NO_CONV, "");
	if(ctrl->NOTES) DYNBUF_ADD3(&tooltip, "\n\n", ctrl->NOTES, 0, NO_CONV, "");
	if(cntxt->opt_btn_mode == OptBtn_OpenSame || cntxt->opt_btn_mode ==  OptBtn_OpenBottom)
	{
		DYNBUF_ADD3(&tooltip, "\n\nCliquez pour plus d'informations sur [", ctrl->LABEL, 0, NO_CONV, "]");
		if(strcmp(ctrl->TYPE, "_EVA_TITLE"))
			DYNBUF_ADD_BUF(&cginame, ctrl->cginame, NO_CONV)
		else
			DYNBUF_ADD_BUF(&cginame, cntxt->form->ctrl->cginame, NO_CONV);
		*cginame->data = 'I';

		if(put_html_button(cntxt, cginame->data, "Infos", 
						image->data, imgsel->data, tooltip->data, 0, 0))
			STACK_ERROR;
	}
	else
	{
		if(put_html_image(cntxt, NULL, image->data, tooltip->data,
							NULL, NULL, 0))
			STACK_ERROR;
	}
	RETURN_OK_CLEANUP;
}
#undef ERR_FUNCTION
#undef ERR_CLEANUP

/*********************************************************************
** Function : ctrl_put_label
** Description : output HTML code for the label of a control
*********************************************************************/
#define ERR_FUNCTION "ctrl_put_label"
#define ERR_CLEANUP 
int ctrl_put_label(
	EVA_context *cntxt,			/* in/out : execution context data */
	EVA_ctrl *ctrl,	 			/* in : input control to process */
	char *position				/* in : cell position */
){
	int b_opt = strcmp(ctrl->OPTIONBUTTON, "_EVA_NONE") != 0 && cntxt->opt_btn_mode != OptBtn_None;

	/* Handle unspecified row/col span */
	if(!ctrl->LABELROWSPAN) ctrl->LABELROWSPAN = 1;
	if(!ctrl->LABELCOLSPAN) ctrl->LABELCOLSPAN = 1;

	/* If option button if present */
	if(b_opt) 
	{
		/* Output cell header for label & option button */
		if(put_html_format_pos(cntxt, position,
			ctrl->LABELALIGN,
			ctrl->LABELVALIGN, 
			ctrl->LABELWIDTH, 
			ctrl->LABELHEIGHT,
			ctrl->LABELBGCOLOR,
			ctrl->LABELBACKGROUND,
			ctrl->LABELCOLSPAN, ctrl->LABELROWSPAN,
			NULL, NULL, NULL, 0, 0, 0, 0, 1)) STACK_ERROR;

		/* Output surrounding table header */
		DYNBUF_ADD_STR(cntxt->form->html, "<table cellspacing=0 cellpadding=0 border=0><tr>\n");

		/* Output text format for label */
		if(put_html_format_pos(cntxt, "_EVA_NewColumn",
			ctrl->LABELALIGN, NULL, NULL, NULL, NULL, NULL, 1, 1,
			ctrl->LABELFONTFACE, ctrl->LABELFONTSIZE, ctrl->LABELFONTCOLOR,
			ctrl->LABELBOLD[0] == '1', ctrl->LABELITALIC[0] == '1', ctrl->LABELUNDERLINE[0] == '1', 0,
			1)) STACK_ERROR;

		/* Output label */
		DYNBUF_ADD(cntxt->form->html, ctrl->LABEL, 0, NO_CONV);

		/* Output cell footer */
		if(put_html_format_pos(cntxt, "_EVA_NewColumn",
			ctrl->LABELALIGN, NULL, NULL, NULL, NULL, NULL, 1, 1,
			ctrl->LABELFONTFACE, ctrl->LABELFONTSIZE, ctrl->LABELFONTCOLOR,
			ctrl->LABELBOLD[0] == '1', ctrl->LABELITALIC[0] == '1', ctrl->LABELUNDERLINE[0] == '1', 0,
			0)) STACK_ERROR;

		/* Output option button & surrounding table footer */
		DYNBUF_ADD_STR(cntxt->form->html, "<td>");
		if(ctrl_add_opt_btn(cntxt, ctrl)) STACK_ERROR;
		DYNBUF_ADD_STR(cntxt->form->html, "</td>\n</tr></table>");

		/* Output cell footer for label & option button */
		if(put_html_format_pos(cntxt, position,
			ctrl->LABELALIGN,
			ctrl->LABELVALIGN, 
			ctrl->LABELWIDTH, 
			ctrl->LABELHEIGHT,
			ctrl->LABELBGCOLOR,
			ctrl->LABELBACKGROUND,
			ctrl->LABELCOLSPAN, ctrl->LABELROWSPAN,
			NULL, NULL, NULL, 0, 0, 0, 0, 0)) STACK_ERROR;
	}
	else
	{
		/* Label color depends on ALLOWEMPTY attribute */
		char *labelcolor = ctrl->LABELFONTCOLOR;
		if(!strcmp("Warn", ctrl->ALLOWEMPTY)) labelcolor = "DD8800";
		else if(!strcmp("No", ctrl->ALLOWEMPTY)) labelcolor = "DD0000";

		/* Output cell header for label */
		if(put_html_format_pos(cntxt, position,
			ctrl->LABELALIGN, ctrl->LABELVALIGN, ctrl->LABELWIDTH, ctrl->LABELHEIGHT,
			ctrl->LABELBGCOLOR, ctrl->LABELBACKGROUND, ctrl->LABELCOLSPAN, ctrl->LABELROWSPAN,
			ctrl->LABELFONTFACE, ctrl->LABELFONTSIZE, labelcolor,
			ctrl->LABELBOLD[0] == '1', ctrl->LABELITALIC[0] == '1', ctrl->LABELUNDERLINE[0] == '1', 0,
			1)) STACK_ERROR;

		/* Output label if applicable */
		if(strcmp(ctrl->LABELPOS , "_EVA_NONE"))
		{
			/* Use label for button click if JavaScript enabled */
			if(cntxt->jsenabled && !strcmp(ctrl->CONTROL, "_EVA_BUTTON"))
			{
				cntxt->jsfunc = 1;
				DYNBUF_ADD3(cntxt->form->html, "<a title='", ctrl->NOTES, 0, HTML_NO_QUOTE, "'");
				if(!strcmp(CTRL_ATTR_VAL(ACTION), "_EVA_HTTPLINK"))
				{
					DynTableCell *link = CTRL_ATTR_CELL(URL);
					DYNBUF_ADD3_CELLP(cntxt->form->html, " target='W", link, HTML_NO_QUOTE, "'");
					DYNBUF_ADD3_CELLP(cntxt->form->html, " href='", link, HTML_NO_QUOTE, "'>");
				}
				else
					DYNBUF_ADD3_BUF(cntxt->form->html, " href='javascript:cb(\"", ctrl->cginame, NO_CONV, "\");'>");
				DYNBUF_ADD(cntxt->form->html, ctrl->LABEL, 0, TO_HTML);
				DYNBUF_ADD_STR(cntxt->form->html, "</a>");
			}
			else
				DYNBUF_ADD(cntxt->form->html, ctrl->LABEL, 0, TO_HTML);
		}

		/* Output cell footer for label */
		if(put_html_format_pos(cntxt, position,
			ctrl->LABELALIGN, ctrl->LABELVALIGN, ctrl->LABELWIDTH, ctrl->LABELHEIGHT,
			ctrl->LABELBGCOLOR, ctrl->LABELBACKGROUND, ctrl->LABELCOLSPAN, ctrl->LABELROWSPAN,
			ctrl->LABELFONTFACE, ctrl->LABELFONTSIZE, labelcolor,
			ctrl->LABELBOLD[0] == '1', ctrl->LABELITALIC[0] == '1', ctrl->LABELUNDERLINE[0] == '1', 0,
			0)) STACK_ERROR;
	}

	RETURN_OK_CLEANUP;
}
#undef ERR_FUNCTION
#undef ERR_CLEANUP

/*********************************************************************
** Function : ctrl_format_pos
** Description : output control position & format with label if needed
*********************************************************************/
#define ERR_FUNCTION "ctrl_format_pos"
#define ERR_CLEANUP 
int ctrl_format_pos(				/* return : 0 on success, other on error */
	EVA_context *cntxt,				/* in/out : execution context data */
	EVA_ctrl *ctrl,	 				/* in : control to process */
	int b_head		 				/* in : output header if 1, footer else */
){
	int colspan = atoi(ctrl->COLSPAN), rowspan = atoi(ctrl->ROWSPAN);
	if(!cntxt->form->html) RETURN_OK;

	/* Handle unspecified row/col span */
	if(!colspan) colspan = 1;
	if(!rowspan) rowspan = 1;
						

	if(cntxt->debug & DEBUG_HTML && b_head)
	{
		DYNBUF_ADD3(cntxt->form->html, "\n<!--- Start ", ctrl->CONTROL, 0, NO_CONV, " / ");
		DYNBUF_ADD(cntxt->form->html, ctrl->TYPE, 0, NO_CONV);
		DYNBUF_ADD3(cntxt->form->html, " / ", ctrl->LABEL, 0, NO_CONV, " -->\n");
	}

	/* Handle label on right side of control */
	if(!strcmp("_EVA_RIGHT", ctrl->LABELPOS))
	{
		ctrl->LABELROWSPAN = rowspan;
		if(b_head)
		{
			/* Output cell header for control */
			if(!ctrl->ALIGN[0]) ctrl->ALIGN = "right";
			if(put_html_format_pos(cntxt, ctrl->POSITION,
								ctrl->ALIGN, ctrl->VALIGN, ctrl->WIDTH, ctrl->HEIGHT,
								ctrl->BGCOLOR, ctrl->BACKGROUND, colspan, rowspan,
								ctrl->FONTFACE, ctrl->FONTSIZE, ctrl->FONTCOLOR,
								ctrl->BOLD[0] == '1', ctrl->ITALIC[0] == '1', ctrl->UNDERLINE[0] == '1', 0, b_head)) 
				STACK_ERROR;
		}
		else
		{
			/* Output cell footer for control */
			if(put_html_format_pos(cntxt, ctrl->POSITION,
								ctrl->ALIGN, ctrl->VALIGN, ctrl->WIDTH, ctrl->HEIGHT,
								ctrl->BGCOLOR, ctrl->BACKGROUND, colspan, rowspan,
								ctrl->FONTFACE, ctrl->FONTSIZE, ctrl->FONTCOLOR,
								ctrl->BOLD[0] == '1', ctrl->ITALIC[0] == '1', ctrl->UNDERLINE[0] == '1', 0, b_head)) 
				STACK_ERROR;

			/* Output label */
			if(!ctrl->LABELALIGN[0]) ctrl->LABELALIGN = "left";
			if(ctrl_put_label(cntxt, ctrl, "_EVA_NewColumn")) STACK_ERROR;
		}
	}
	/* Handle label on top of control */
	else if(!strcmp("_EVA_TOP", ctrl->LABELPOS))
	{
		if(b_head)
		{
			if(!ctrl->LABELALIGN[0]) ctrl->LABELALIGN = ctrl->ALIGN;

			/* Output cell header for control & label */
			if(put_html_format_pos(cntxt, ctrl->POSITION,
								ctrl->ALIGN, ctrl->VALIGN, ctrl->WIDTH, ctrl->HEIGHT,
								NULL, NULL, colspan > 2 ? colspan : 2, rowspan, 
								NULL, NULL, NULL, 0, 0, 0, 0, b_head)) 
				STACK_ERROR;

			/* Output surrounding table header */
			DYNBUF_ADD_STR(cntxt->form->html, "<table cellspacing=0 cellpadding=0 border=0 width=100%><tr>\n");

			/* Output label */
			ctrl->LABELWIDTH = "";
			if(ctrl_put_label(cntxt, ctrl, "_EVA_NewColumn")) STACK_ERROR;

			/* Output cell header for control */
			if(put_html_format_pos(cntxt, "_EVA_NewLine",
								ctrl->ALIGN, ctrl->VALIGN, NULL, NULL,
								ctrl->BGCOLOR, ctrl->BACKGROUND, 1, 1,
								ctrl->FONTFACE, ctrl->FONTSIZE, ctrl->FONTCOLOR,
								ctrl->BOLD[0] == '1', ctrl->ITALIC[0] == '1', ctrl->UNDERLINE[0] == '1', 0, b_head)) 
				STACK_ERROR;
		}
		else
		{
			/* Output cell footer for control */
			if(put_html_format_pos(cntxt, "_EVA_NewLine",
								ctrl->ALIGN, ctrl->VALIGN, NULL, NULL,
								ctrl->BGCOLOR, ctrl->BACKGROUND, 1, 1,
								ctrl->FONTFACE, ctrl->FONTSIZE, ctrl->FONTCOLOR,
								ctrl->BOLD[0] == '1', ctrl->ITALIC[0] == '1', ctrl->UNDERLINE[0] == '1', 0, b_head)) 
				STACK_ERROR;

			/* Output surrounding table footer */
			DYNBUF_ADD_STR(cntxt->form->html, "</tr></table>");

			/* Output cell footer for control & label */
			if(put_html_format_pos(cntxt, ctrl->POSITION,
								ctrl->ALIGN, ctrl->VALIGN, ctrl->WIDTH, ctrl->HEIGHT,
								NULL, NULL, colspan > 2 ? colspan : 2, rowspan, 
								NULL, NULL, NULL, 0, 0, 0, 0, b_head)) 
				STACK_ERROR;
		}
	}
	/* Handle label on bottom of control */
	else if(!strcmp("_EVA_BOTTOM", ctrl->LABELPOS))
	{
		if(b_head)
		{
			if(!ctrl->LABELALIGN[0]) ctrl->LABELALIGN = ctrl->ALIGN;

			/* Output cell header for control & label */
			if(put_html_format_pos(cntxt, ctrl->POSITION,
								ctrl->ALIGN, ctrl->VALIGN, ctrl->WIDTH, ctrl->HEIGHT,
								NULL, NULL, colspan > 2 ? colspan : 2, rowspan, 
								NULL, NULL, NULL, 0, 0, 0, 0, b_head)) 
				STACK_ERROR;

			/* Output surrounding table header */
			DYNBUF_ADD_STR(cntxt->form->html, "<table cellspacing=0 cellpadding=0 border=0 width=100%><tr>\n");

			/* Output cell header for control */
			if(put_html_format_pos(cntxt, "_EVA_NewColumn",
								ctrl->ALIGN, "bottom", NULL, NULL,
								ctrl->BGCOLOR, ctrl->BACKGROUND, 1, 1,
								ctrl->FONTFACE, ctrl->FONTSIZE, ctrl->FONTCOLOR,
								ctrl->BOLD[0] == '1', ctrl->ITALIC[0] == '1', ctrl->UNDERLINE[0] == '1', 0, b_head)) 
				STACK_ERROR;
		}
		else
		{
			/* Output cell footer for control */
			if(put_html_format_pos(cntxt, "_EVA_NewColumn",
								ctrl->ALIGN, ctrl->VALIGN, NULL, NULL,
								ctrl->BGCOLOR, ctrl->BACKGROUND, 1, 1,
								ctrl->FONTFACE, ctrl->FONTSIZE, ctrl->FONTCOLOR,
								ctrl->BOLD[0] == '1', ctrl->ITALIC[0] == '1', ctrl->UNDERLINE[0] == '1', 0, b_head)) 
				STACK_ERROR;

			/* Output label */
			ctrl->LABELWIDTH = "";
			ctrl->LABELVALIGN = "top";
			if(ctrl_put_label(cntxt, ctrl, "_EVA_NewLine")) STACK_ERROR;

			/* Output surrounding table footer */
			DYNBUF_ADD_STR(cntxt->form->html, "</tr></table>");

			/* Output cell footer for control & label */
			if(put_html_format_pos(cntxt, ctrl->POSITION,
								ctrl->ALIGN, ctrl->VALIGN, ctrl->WIDTH, ctrl->HEIGHT,
								NULL, NULL, colspan > 2 ? colspan : 2, rowspan, 
								NULL, NULL, NULL, 0, 0, 0, 0, b_head)) 
				STACK_ERROR;
		}
	}
	/* Handle no label */
	else if(!strcmp("_EVA_NONE", ctrl->LABELPOS))
	{
		if(b_head)
		{
			/* Output cell header for control */
			if(put_html_format_pos(cntxt, ctrl->POSITION,
								ctrl->ALIGN, ctrl->VALIGN, ctrl->WIDTH, ctrl->HEIGHT,
								ctrl->BGCOLOR, ctrl->BACKGROUND, colspan > 2 ? colspan : 2, rowspan,
								ctrl->FONTFACE, ctrl->FONTSIZE, ctrl->FONTCOLOR,
								ctrl->BOLD[0] == '1', ctrl->ITALIC[0] == '1', ctrl->UNDERLINE[0] == '1', 0, b_head)) 
				STACK_ERROR;
		}
		else
		{
			/* Output cell footer for control */
			if(put_html_format_pos(cntxt, ctrl->POSITION,
								ctrl->ALIGN, ctrl->VALIGN, ctrl->WIDTH, ctrl->HEIGHT,
								ctrl->BGCOLOR, ctrl->BACKGROUND, colspan > 2 ? colspan : 2, rowspan,
								ctrl->FONTFACE, ctrl->FONTSIZE, ctrl->FONTCOLOR,
								ctrl->BOLD[0] == '1', ctrl->ITALIC[0] == '1', ctrl->UNDERLINE[0] == '1', 0, b_head)) 
				STACK_ERROR;
		}
	}
	/* Handle label on left side of control */
	else
	{
		ctrl->LABELROWSPAN = rowspan;
		if(b_head)
		{
			/* Output label */
			if(!*(ctrl->LABELALIGN)) ctrl->LABELALIGN = "right";
			if(!*(ctrl->LABELVALIGN)) ctrl->LABELVALIGN = ctrl->VALIGN;
			if(ctrl_put_label(cntxt, ctrl, ctrl->POSITION)) STACK_ERROR;

			/* Output cell header for control */
			if(put_html_format_pos(cntxt, "_EVA_NewColumn",
								ctrl->ALIGN, ctrl->VALIGN, ctrl->WIDTH, ctrl->HEIGHT,
								ctrl->BGCOLOR, ctrl->BACKGROUND, colspan, rowspan,
								ctrl->FONTFACE, ctrl->FONTSIZE, ctrl->FONTCOLOR,
								ctrl->BOLD[0] == '1', ctrl->ITALIC[0] == '1', ctrl->UNDERLINE[0] == '1', 0, b_head)) 
				STACK_ERROR;
		}
		else
		{
			/* Output cell footer for control */
			if(put_html_format_pos(cntxt, "_EVA_NewColumn",
								ctrl->ALIGN, ctrl->VALIGN, ctrl->WIDTH, ctrl->HEIGHT,
								ctrl->BGCOLOR, ctrl->BACKGROUND, colspan, rowspan,
								ctrl->FONTFACE, ctrl->FONTSIZE, ctrl->FONTCOLOR,
								ctrl->BOLD[0] == '1', ctrl->ITALIC[0] == '1', ctrl->UNDERLINE[0] == '1', 0, b_head)) 
				STACK_ERROR;
		}
	}

	if(cntxt->debug & DEBUG_HTML && !b_head)
	{
		DYNBUF_ADD3(cntxt->form->html, "\n<!--- EndOf ", ctrl->CONTROL, 0, NO_CONV, " / ");
		DYNBUF_ADD(cntxt->form->html, ctrl->TYPE, 0, NO_CONV);
		DYNBUF_ADD3(cntxt->form->html, " / ", ctrl->LABEL, 0, NO_CONV, " -->\n");
	}

	RETURN_OK_CLEANUP;
}
#undef ERR_FUNCTION
#undef ERR_CLEANUP

/*********************************************************************
** Function : ctrl_put_table_header
** Description : handles GROUP controls
*********************************************************************/
#define ERR_FUNCTION "ctrl_put_table_header"
#define ERR_CLEANUP
int ctrl_put_table_header(				/* return : 0 on success, other on error */
	EVA_context *cntxt,					/* in/out : execution context data */
	EVA_ctrl *ctrl						/* in : control to process */
){
	/* Output HTML debug info if applicable */
	if(cntxt->debug & DEBUG_HTML)
	{
		DYNBUF_ADD3(cntxt->form->html, "\n<!--- Start Table ", ctrl->CONTROL, 0, NO_CONV, " / ");
		DYNBUF_ADD(cntxt->form->html, ctrl->TYPE, 0, NO_CONV);
		DYNBUF_ADD3(cntxt->form->html, " / ", ctrl->LABEL, 0, NO_CONV, " -->\n");
	}

	/* Output HTML container table header */
	if(put_html_table_header(cntxt, 
			CTRL_ATTR_VAL(TABLEALIGN),
			ctrl->TABLEWIDTH,
			ctrl->TABLEBGCOLOR,
			ctrl->TABLEBACKGROUND,
			atoi(CTRL_ATTR_VAL(CELLSPACING)),
			atoi(CTRL_ATTR_VAL(CELLPADDING)),
			ctrl->BORDER,
			ctrl->TABLERULES))
		STACK_ERROR;

	RETURN_OK_CLEANUP;
}
#undef ERR_FUNCTION
#undef ERR_CLEANUP

/*********************************************************************
** Function : ctrl_put_table_footer
** Description : output HTML footer for a new table
*********************************************************************/
#define ERR_FUNCTION "ctrl_put_table_footer"
#define ERR_CLEANUP 
int ctrl_put_table_footer(
	EVA_context *cntxt,					/* in/out : execution context data */
	EVA_ctrl *ctrl						/* in : control to process */
){
	CHECK_HTML_STATUS;
	DYNBUF_ADD_STR(html, "</tr></table>");

	if(cntxt->debug & DEBUG_HTML)
	{
		DYNBUF_ADD3(html, "\n<!--- Endof Table ", ctrl->CONTROL, 0, NO_CONV, " / ");
		DYNBUF_ADD(html, ctrl->TYPE, 0, NO_CONV);
		DYNBUF_ADD3(html, " / ", ctrl->LABEL, 0, NO_CONV, " -->\n");
	}
	RETURN_OK_CLEANUP;
}
#undef ERR_FUNCTION
#undef ERR_CLEANUP

/*********************************************************************
** Function : ctrl_put_hidden_old
** Description : add hidden input with initial control value to detect changes
*********************************************************************/
#define ERR_FUNCTION "ctrl_put_hidden_old"
#define ERR_CLEANUP
int ctrl_put_hidden_old(			/* return : 0 on success, other on error */
	EVA_context *cntxt,				/* in : execution context data */
	EVA_ctrl *ctrl,					/* in : control to process */
	unsigned long i,				/* in : value index to proces in ctrl->val */
	DynBuffer *name,				/* in : CGI name of input holding ctrl->val[i] */
	char *txt, size_t len			/* in : original value (use ctrl->val[i] if NULL) */
){
	EVA_form *form = cntxt->form;
	DynTableCell *val = ctrl ? dyntab_cell(&ctrl->val, i, 0) : NULL;
	if(form->b_newobj && (!ctrl || (val ? val->b_modified : ctrl->b_modified))) RETURN_OK;
	if(cgi_put_hiddenold(cntxt, name ? name : ctrl ? ctrl->cginame : NULL,
								txt ? txt : val ? val->txt : NULL,
								txt ? len : val ? val->len : 0)) STACK_ERROR;
	RETURN_OK_CLEANUP;
}
#undef ERR_FUNCTION
#undef ERR_CLEANUP

/*********************************************************************
** Function : ctrl_primary_handler
** Description : call primary handler for a control	with access check
*********************************************************************/
#define ERR_FUNCTION "ctrl_primary_handler"
#define ERR_CLEANUP	cntxt->i_ctrl = 0
int ctrl_primary_handler(			/* return : 0 on success, other on error */
	EVA_context *cntxt,				/* in : execution context data */
	unsigned long i_ctrl			/* in : control index in cntxt->form->ctrl */
){
	EVA_form *form = cntxt->form;
	EVA_ctrl *ctrl = form->ctrl + i_ctrl;
	int step = form->step;
	cntxt->i_ctrl = i_ctrl;
	
	/* Return if no primary handler for the control */
	if(!ctrl_handlers[ctrl->i_handler].h0) RETURN_OK;

	/* Check control access - return if none */
	if(ctrl_check_access(cntxt, ctrl)) STACK_ERROR; 
	if(!(ctrl->access & (AccessView | AccessEdit))) RETURN_OK;

	/* Limit access if applicable */
	if(!(ctrl->access & AccessEdit) && step == HtmlEdit) form->step = HtmlView;

	/* Call control primary handler & restore step */
	if(ctrl_handlers[ctrl->i_handler].h0(cntxt, i_ctrl)) STACK_ERROR;
	form->step = step;
	
	RETURN_OK_CLEANUP;
 }
#undef ERR_FUNCTION
#undef ERR_CLEANUP

/*********************************************************************
** Function : ctrl_parse_access
** Description : parse access check keywords
*********************************************************************/
void ctrl_parse_access(
	int *access,					/* in/out : access bits are or-ed to the given value */
	char *exec,						/* in : control execution mode */
	char *objcreat,					/* in : create object access */
	char *objdel					/* in : delete object access */
){
	/* Control view / edit access */
	*access = AccessNone;
	if(!strcmp("_EVA_ACCES_NONE", exec)) return;
	if(!strcmp("_EVA_ACCES_VIEW", exec)) *access |= AccessView;
	else *access |= AccessView | AccessEdit;

	/* Form create / delete access */
	if(objcreat && !*objcreat) *access |= AccessCreate;
	if(objdel && !*objdel) *access |= AccessDelete;
 }

/*********************************************************************
** Function : ctrl_check_user_access
** Description : get access status of a control for the identified user
*********************************************************************/
#define ERR_FUNCTION "ctrl_check_user_access"
#define ERR_CLEANUP DYNTAB_FREE(access); \
					DYNTAB_FREE(ctrlgroup); \
					DYNTAB_FREE(usergroup); \
					DYNTAB_FREE(objcreat); \
					DYNTAB_FREE(objdel)
int ctrl_check_user_access(			/* return : 0 on success, other on error */
	EVA_context *cntxt,				/* in/out : execution context data */
	DynTable *attr,					/* in : control attributes */
	DynTable *obj_data,				/* in : object data */
	unsigned long beg,				/* in : 1st row to use in obj_data */
	int *acc						/* out : access rights */
){
	DynTable access = { 0 };
	DynTable ctrlgroup = { 0 };
	DynTable usergroup = { 0 };
	DynTable objcreat = { 0 };
	DynTable objdel = { 0 };
	unsigned long line, lines, matchline;
	unsigned long i, j;
	DynTableCell *objbeg = dyntab_cell(obj_data, beg, 0);
	int b_form = !strcmp(DYNTAB_FIELD_VAL(attr, CONTROL), "_EVA_FORM");
	if(!acc) return 0;

	/* Check object access if control is a form */
	if(b_form)
	{
		if(obj_check_user_access(cntxt, obj_data, beg, acc)) STACK_ERROR;
		if(*acc == AccessNone) RETURN_OK;
	}

	DYNTAB_FIELD_TAB(&ctrlgroup, attr, USERGROUP);
	if(!cntxt->b_user_ok)
	{
		/* Select access for non identified users */
		DYNTAB_FIELD(&access, attr, ACCES_NOT_IDENT);
		DYNTAB_FIELD(&objcreat, attr, CREATE_NOT_IDENT);
		DYNTAB_FIELD(&objdel, attr, DELETE_NOT_IDENT);
		if(!access.nbrows && ctrlgroup.nbrows)
			/* No access if unspecified & control has usergroups */
			*acc = AccessNone;
		else
			ctrl_parse_access(acc, dyntab_val(&access, 0, 0),
											dyntab_val(&objcreat, 0, 0),
											dyntab_val(&objdel, 0, 0));
	}
	else
	{
		/* Always allow acces to identified user account form */
		if(objbeg && objbeg->IdObj == DYNTAB_TOUL(&cntxt->id_user) && b_form)
		{
			*acc = AccessView | AccessEdit;
			RETURN_OK;
		}

		/*  Select acces on user groups */
		DYNTAB_FIELD_TAB(&access, attr, ACCES_IDENT);
		DYNTAB_FIELD_TAB(&objcreat, attr, CREATE_IDENT);
		DYNTAB_FIELD_TAB(&objdel, attr, DELETE_IDENT);
		DYNTAB_FIELD(&usergroup, &cntxt->user_data, USERGROUP);

		/* For each line of control acces / users groups table */
		lines = (access.nbrows > ctrlgroup.nbrows) ? access.nbrows : ctrlgroup.nbrows;
		matchline = lines;
		if(usergroup.nbrows) for(line = 0; line < lines && matchline == lines; line++)
		{
			/* Match line if no user group selected */
			if(!dyntab_sz(&ctrlgroup, line, 0))
			{
				matchline = line;
				break; 
			}

			/* Search for user groups in control */
			for(i = 0; i < ctrlgroup.nbcols && matchline == lines; i++)
				for(j = 0; j < usergroup.nbrows && matchline == lines; j++)
					if(!dyntab_cmp(&ctrlgroup, line, i, &usergroup, j, 0))
						matchline = line;
		}
			
		/* Select access of 1st line matching user group */
		if(!lines || matchline < lines)
		{
			ctrl_parse_access(acc, dyntab_val(&access, matchline, 0),
									dyntab_val(&objcreat, matchline, 0),
									dyntab_val(&objdel, matchline, 0));
		}
		else
			*acc = AccessNone;

		/* Select access on new object */
		if(*acc != AccessNone && !dyntab_sz(obj_data, beg, 0))
		{
			int acc1;
			ctrl_parse_access(&acc1, DYNTAB_FIELD_VAL(attr, ACCES_NEWOBJ), "", "");
			*acc &= acc1;
		}

		/* Select access on existing object */
		else if(acc != AccessNone)
		{
			int acc1;
			ctrl_parse_access(&acc1, DYNTAB_FIELD_VAL(attr, ACCES_EXISTOBJ), "", "");
			*acc &= acc1;
		}
	}

	RETURN_OK_CLEANUP;
}
#undef ERR_FUNCTION
#undef ERR_CLEANUP

/*********************************************************************
** Function : ctrl_check_access
** Description : get access status of a control for the identified user
*********************************************************************/
#define ERR_FUNCTION "ctrl_check_access"
#define ERR_CLEANUP DYNTAB_FREE(access); \
					DYNTAB_FREE(fltfield); \
					DYNTAB_FREE(fltval); \
					DYNTAB_FREE(fltvaltyp); \
					DYNTAB_FREE(fltop); \
					DYNTAB_FREE(values); \
					DYNTAB_FREE(values1)
int ctrl_check_access(				/* return : 0 on success, other on error */
	EVA_context *cntxt,				/* in/out : execution context data */
	EVA_ctrl *ctrl					/* in : control to check for access status
									  out : access status is set in ctrl->access */
){
	EVA_form *form = cntxt->form;
	DynTable access = { 0 };
	DynTable fltfield = { 0 };
	DynTable fltval = { 0 };
	DynTable fltvaltyp = { 0 };
	DynTable fltop = { 0 };
	DynTable values = { 0 };
	DynTable values1 = { 0 };
	unsigned long line, lines, matchline;
	unsigned long i, j;
	int acc;

	/* Check access once during read for user rights */
	if(form->step == CtrlRead)
	{
		ctrl_check_user_access(cntxt, &ctrl->attr, &form->objdata, 0, &ctrl->access);
		ctrl->access0 = ctrl->access;

		/* No other checking during read process */
		RETURN_OK;
	}

	/* Return if no access */
	ctrl->access = ctrl->access0;
	if(ctrl->access == AccessNone) RETURN_OK;

	/* Check access for edit mode */
	CTRL_OPTIONAL(access, ACCES_EDIT);
	if(access.nbrows)
	{
		char *acc = dyntab_val(&access, 0, 0);
		if(form->step != HtmlEdit && !strcmp(acc, "_EVA_EDITONLY") ||
			form->step != HtmlView && !strcmp(acc, "_EVA_VIEWONLY"))
		{
			/* No access if not edit mode & EDITONLY */
			ctrl->access = AccessNone;
			RETURN_OK;
		}
		if(!strcmp(acc, "_EVA_ALWAYS"))
		{
			/* No access if not edit mode & EDITONLY */
			ctrl->access = AccessEdit;
			RETURN_OK;
		}
	}

	/* Select access on current object data */
	CTRL_READ_ATTR_TAB(fltfield, ACCESS_FILTER_SIMPLE_FIELD);
	CTRL_READ_ATTR_TAB(fltop, ACCESS_FILTER_SIMPLE_OP);
	CTRL_READ_ATTR_TAB(fltvaltyp, ACCESS_FILTER_SIMPLE_VALTYPE);
	CTRL_READ_ATTR_TAB(fltval, ACCESS_FILTER_SIMPLE_VALUE);
	CTRL_READ_ATTR_TAB(access, ACCESS_FILTER_SIMPLE);

	/* For each line of control acces / field condition table */
	lines = access.nbrows > fltfield.nbrows ?	access.nbrows : fltfield.nbrows;
	matchline = lines;
	for(line = 0; line < lines && matchline == lines; line++)
	{
		/* Check for field presence - match line if no field */
		char *op = dyntab_val(&fltop, line, 0);
		int b_equal = !*op || !strcmp(op, "_EVA_EQUAL");
		char *field = dyntab_val(&fltfield, line, 0);
		if(!*field)
		{
			matchline = line;
			break;
		}

		/* Evaluate value expression */
		dyntab_free(&values);
		DYNTAB_SET_CELL(&values, 0, 0, &fltval, line, 0);
		if(form_eval_valtype(cntxt, &values1, dyntab_val(&fltvaltyp, line, 0), NULL, &values)) CLEAR_ERROR;

		/* Evaluate field expression */
		dyntab_free(&values);
		if(form_eval_fieldexpr(cntxt, &values, 
				DYNTAB_TOUL(&form->id_form), DYNTAB_TOUL(&form->id_obj),
				field, dyntab_sz(&fltfield, line, 0), NULL, 0)) CLEAR_ERROR;

		/* Set empty values if applicable & check each value */
		if(!values.nbrows) DYNTAB_ADD_CELLP(&values, 0, 0, NULL);
		if(!values1.nbrows) DYNTAB_ADD_CELLP(&values1, 0, 0, NULL);
		for(i = 0; i < values.nbrows && matchline == lines; i++)
			for(j = 0; j < values1.nbrows && matchline == lines; j++)
				if(!dyntab_cmp(&values, i, 0, &values1, j, 0))
					matchline = line;

		/* Handle different operator */
		if(!b_equal)
		{
			if(matchline < lines) matchline = lines;
			else matchline = line;
		}
	}
		
	/* Select access of 1st line matching user group */
	if(!lines || matchline < lines)
	{
		ctrl_parse_access(&acc, dyntab_val(&access, matchline, 0), "", "");
		ctrl->access &= acc;
	}
	else
		ctrl->access = AccessNone;

	RETURN_OK_CLEANUP;
}
#undef ERR_FUNCTION
#undef ERR_CLEANUP

/*********************************************************************
** Function : html_put_open_btn
** Description : output an open button
*********************************************************************/
#define ERR_FUNCTION "html_put_open_btn"
#define ERR_CLEANUP M_FREE(tooltip); \
					M_FREE(opname)
int html_put_open_btn(					/* return : 0 on success, other on error */
	EVA_context *cntxt,					/* in/out : execution context data */
	DynBuffer *name,					/* in : CGI base button name - B# is used if NULL */
	DynBuffer *name_end,				/* in : end of button name - OPENOBJ=id_obj is used if NULL */
	DynBuffer *label,					/* in : form label */
	DynBuffer *objname,					/* in : object label */
	DynBuffer *notes,					/* in : object notes */
	DynBuffer *img,						/* in : symbol for normal image */
	DynBuffer *imgsel,					/* in : symbol for selected image */
	char *action, size_t sz_action,		/* in : action label for tooltip */
	unsigned long id_form,				/* in : form id */
	unsigned long id_obj,				/* in : object id */
	unsigned long num,					/* in : num index */
	unsigned long line,					/* in : line index */
	int loc,							/* in : window location */
	int b_disabled						/* in : button is disabled if not 0 */
){
 	DynBuffer *tooltip = NULL;
 	DynBuffer *opname = NULL;

	/* Build button name if applicable */
	if(id_form && (id_obj || !name))
	{
		if(name && name->data[0] && name->cnt)
		{
			DYNBUF_ADD_BUF(&opname, name, NO_CONV);
			opname->data[0] = 'B';
		}
		else DYNBUF_ADD_STR(&opname, "B$#");
		DYNBUF_ADD_STR(&opname, ".");
		if(name_end) DYNBUF_ADD_BUF(&opname, name_end, NO_CONV)
		else DYNBUF_ADD_STR(&opname, "OPENOBJ");
		DYNBUF_ADD3_INT(&opname, "=", id_obj, "");
		DYNBUF_ADD3_INT(&opname, ",", id_form, ",");
		DYNBUF_ADD_INT(&opname, loc);
		DYNBUF_ADD3_INT(&opname, "$", (num ? num : 1), "");
		if(line) DYNBUF_ADD3_INT(&opname, ".", line, "");
	}
	else if(name) 
	{
		DYNBUF_ADD_BUF(&opname, name, NO_CONV);
		if(opname) opname->data[0] = 'I';
	}

	/* Build button tooltip */
	DYNBUF_ADD_BUF(&tooltip, label, NO_CONV);
	if(!id_obj) DYNBUF_ADD_STR(&tooltip, " (Nouvelle fiche)")
	else DYNBUF_ADD3_INT(&tooltip, " n° ", id_obj, "");
	if(objname) DYNBUF_ADD3_BUF(&tooltip, " : ", objname, NO_CONV, "");
	if(notes && !b_disabled) DYNBUF_ADD3_BUF(&tooltip, "\n\n", notes, NO_CONV, "\n");
	if(action && !b_disabled) DYNBUF_ADD3(&tooltip, "\n", action, sz_action, NO_CONV, "");
	if(b_disabled) DYNBUF_ADD_STR(&tooltip, "\nVous n'avez pas accès à cette fiche")
		
	/* Output button */
	if(put_html_button(cntxt, opname->data, NULL,
		img ? img->data : "_eva_open_small.gif", 
		(img && imgsel) ? imgsel->data : "_eva_open_small_s.gif",
		tooltip ? tooltip->data : NULL, 0, b_disabled | 4))
		STACK_ERROR;

	RETURN_OK_CLEANUP;
}
#undef ERR_FUNCTION
#undef ERR_CLEANUP

/*********************************************************************
** Function : ctrl_add_symbol_btn
** Description : output an open button for an object
*********************************************************************/
#define ERR_FUNCTION "ctrl_add_symbol_btn"
#define ERR_CLEANUP DYNTAB_FREE(formstamp); \
					DYNTAB_FREE(formdata); \
					M_FREE(formname); \
					M_FREE(objname); \
					M_FREE(objtitle); \
					M_FREE(fnotes); \
					M_FREE(notes); \
					M_FREE(img); \
					M_FREE(imgsel); \
					M_FREE(txtlabel); \
					M_FREE(txtnotes)
int ctrl_add_symbol_btn(				/* return : 0 on success, other on error */
	EVA_context *cntxt,					/* in/out : execution context data */
	EVA_ctrl *ctrl,						/* in : related control */
	DynTableCell *val,					/* in : value associated with button */
	DynBuffer *name_end,				/* in : end of button name - OPENOBJ=id_obj is used if NULL */
	DynTable *data,						/* in : object data to be opened by the button */
	unsigned long beg,					/* in : first line to process in data */
	char *action, size_t sz_action,		/* in : action label for tooltip */
	char *bg_color,						/* in : output cell separators with given color if not NULL */
	char *dispmode						/* in : display mode */
){
	EVA_form *form = cntxt->form;
	DynTable formstamp = {0};
	DynTable formdata = {0};
	DynBuffer *formname = NULL;
	DynBuffer *objname = NULL;
	DynBuffer *objtitle = NULL;
	DynBuffer *notes = NULL;
	DynBuffer *fnotes = NULL;
	DynBuffer *img = NULL;
	DynBuffer *imgsel = NULL;
	DynBuffer *txtlabel = NULL;
	DynBuffer *txtnotes = NULL;
	unsigned long i, use_form = 0;
	DynTableCell *objdata = dyntab_cell(data, beg, 0);
	char *alt = ctrl ? CTRL_ATTR_VAL(ALTFORM) : "";
	int loc = !strcmp(alt, "_EVA_TOP") ? 1 : !strcmp(alt, "_EVA_BOTTOM") ? 2 : 0;
	int cntform = 0;
	int b_formname = dispmode && strstr(dispmode, "NAME") != NULL;
	int b_objname =  dispmode && (strstr(dispmode, "LABEL") != NULL || !strcmp("_EVA_NONE", dispmode));
	int b_button = form && form->step == HtmlPrint ? 0 : (!dispmode || !*dispmode || (strcmp("_EVA_NONE", dispmode) && strstr(dispmode, "SYMBOL") != NULL));
	int b_label = b_formname || b_objname;
	int b_tooltip = !dispmode || !*dispmode || strstr(dispmode, "OBJNOTES") || !strncmp(dispmode, add_sz_str("_EVA_"));
	int formaccess = AccessNone;
	char bgcolor[256];
	ObjTableFormat *tbl = ctrl ? ctrl->objtbl : NULL;
	CHECK_HTML_STATUS;

	/* Build formstamp list */
	if(ctrl && CTRL_ATTR_CELL(LIST_OPENFIXED))
	{
		/* Fixed form : read given form - return if none */
		DynTableCell *c = CTRL_ATTR_CELL(LIST_OPENFORM);
		if(!c || !c->txt || !atoi(c->txt)) RETURN_OK;
		DYNTAB_ADD_CELLP(&formstamp, 0, 0, c);
	}
	else
	{
		i = beg;
		if(dyntab_filter_field(&formstamp, 0, data, "_EVA_FORMSTAMP", 0, 1, &i)) RETURN_ERR_MEMORY;
	}
	dyntab_sort(&formstamp, qsort_col0idesc);

	/* Prepare & output cell separator if applicable */
	if(bg_color && *bg_color != '*')
	{
		if(*bg_color) snprintf(add_sz_str(bgcolor), " bgcolor=#%s", bg_color);
		else *bgcolor = 0;
		if(b_button) DYNBUF_ADD3(html, "<td align=right", bgcolor, 0, NO_CONV, ">");
	}

	/* For each object formstamp */
	for(i = 0; i < formstamp.nbrows; i++)
	{
		/* Read object & form info */
		unsigned long id_form = DYNTAB_TOULRC(&formstamp, i, 0), i_fc;
		int access = AccessNone;
		if(qry_obj_label(cntxt, &formname, &fnotes,
				b_label ? &objname : NULL, NULL, b_tooltip ? &notes : NULL,
				&img, &imgsel, &i_fc, id_form, data, beg)) CLEAR_ERROR;
		if(i_fc >= cntxt->nbfc) continue;

		/* Check user access to object & form */
		if(objdata && objdata->IdObj)
		{
			EVA_ctrl newctrl = {0};
			EVA_form newform = {0};
			newform.ctrl = &newctrl;
			memcpy(&newctrl.attr, &cntxt->fc[i_fc].data, sizeof(newctrl.attr));
			memcpy(&newform.objdata, data, sizeof(newform.objdata));
			newform.objdata.cell = data->cell + data->szcols * beg;
			newform.objdata.nbrows -= beg;
			cntxt->form = &newform;
			DYNTAB_ADD_INT(&newform.id_obj, 0, 0, newform.objdata.cell->IdObj);
			DYNTAB_ADD_INT(&newform.id_form, 0, 0, id_form);
			if(ctrl_check_access(cntxt, &newctrl)) STACK_ERROR;
			newform.step = HtmlView;
			if(ctrl_check_access(cntxt, &newctrl)) STACK_ERROR;
			access = newctrl.access;
			DYNTAB_FREE(newform.id_obj);
			DYNTAB_FREE(newform.id_form);
			cntxt->form = form;
		}
		else
			access = AccessView;

		/* Continue if user no has access to form & object */
		if(access == AccessNone && (cntform || i + 1 < formstamp.nbrows)) continue;
		cntform++;

		/* Build tooltip */
		if(txtnotes) DYNBUF_ADD_STR(&txtnotes, "\n\n");
		DYNBUF_ADD3_BUF(&txtnotes, "[", formname, NO_CONV, "] : ");
		DYNBUF_ADD_BUF(&txtnotes, objname, NO_CONV);
		if(access != AccessNone && notes) DYNBUF_ADD3_BUF(&txtnotes, "\n", notes, NO_CONV, "");

		/* Build label */
		if(b_label && !txtlabel)
		{
			use_form = id_form;
			formaccess = access;
			if(b_formname) DYNBUF_ADD_BUF(&txtlabel, formname, NO_CONV);
			if(b_formname && formname && b_objname && objname) DYNBUF_ADD_STR(&txtlabel, " - ");
			if(b_objname) DYNBUF_ADD_BUF(&txtlabel, objname, NO_CONV);
		}

		/* Output button */
		if(b_button)
		{
			if(html_put_open_btn(cntxt, ctrl ? ctrl->cginame : NULL, name_end, 
				formname, b_label ? NULL :  objtitle, !b_tooltip ? NULL : b_label ? fnotes : notes, img, imgsel, action, sz_action, 
							id_form, objdata ? objdata->IdObj : 0,
							val ? val->Num : 1, val ? val->Line : 0, loc,
							access == AccessNone))
				STACK_ERROR;
		}
	}
	if(bg_color && b_button) DYNBUF_ADD_STR(html, "</td>\n");

	if(b_label && val && !val->b_relation && val->txt && strtoul(val->txt, NULL, 10) != (objdata ? objdata->IdObj : 0))
	{
		M_FREE(txtlabel);
		DYNBUF_ADD_CELLP(&txtlabel, val, NO_CONV);
	}

	if(txtlabel)
	{
		if(bg_color) DYNBUF_ADD3(html, "<td", *bg_color == '*' ? bg_color + 1 : bgcolor, 0, NO_CONV, ">");
		if(cntxt->jsenabled && formaccess != AccessNone && (!form || form->step != HtmlPrint))
		{
			char printbuf[1024];
			cntxt->jsfunc = 1;
			if(txtnotes) DYNBUF_ADD3_BUF(html, "<a title='", txtnotes, HTML_NO_QUOTE, "\n\nCliquez pour ouvrir la fiche'")
			else DYNBUF_ADD_STR(html, "<a");
			dynbuf_print4(html, " href='javascript:ol(%lu,%lu,%lu,%lu);'>",
				objdata->IdObj, use_form,
				form ? DYNTAB_TOUL(&form->id_form) : 0,
				form ? DYNTAB_TOUL(&form->id_obj) : 0);
			if(put_html_bold_substring(cntxt, html, DYNBUF_VAL_SZ(txtlabel), tbl ? &tbl->srchwords : NULL))
				STACK_ERROR;
			DYNBUF_ADD_STR(html, "</a>");
		}
		else
		{
			if(put_html_bold_substring(cntxt, html, DYNBUF_VAL_SZ(txtlabel), tbl ? &tbl->srchwords : NULL))
				STACK_ERROR;
		}
		if(bg_color && *bg_color != '*') DYNBUF_ADD_STR(html, "</td>");
	}

	RETURN_OK_CLEANUP;
}
#undef ERR_FUNCTION
#undef ERR_CLEANUP

/*********************************************************************
** Function : ctrl_filter_idobj
** Description : return the list of objects ids matching the control filter
*********************************************************************/
#define ERR_FUNCTION "ctrl_filter_idobj"
#define ERR_CLEANUP qry_build_free(&flt); \
					M_FREE(sql); \
					cntxt->sql_trace = sql_trace
int ctrl_filter_idobj(				/* return : 0 on success, other on error */
	EVA_context *cntxt,				/* in : execution context data */
	DynTable *res,					/* out : list of objects Ids matching control filter
											if NULL, a temporary table IdList is created to hold the results */
	EVA_ctrl *ctrl					/* in : control containing filter information */
){
	QryBuild flt = {0};
	DynBuffer *sql = NULL;
	int sql_trace = cntxt->sql_trace;
	if(*CTRL_ATTR_VAL(DEBUG_SQL_FILTER) == '1') cntxt->sql_trace = DEBUG_SQL_RES;

	/* Create temporary table IdList for results if no output table */
	if(!res && sql_exec_query(cntxt, "CREATE TEMPORARY TABLE IdList (IdObj INT NOT NULL) TYPE=HEAP \n"))
		STACK_ERROR;

	/* Build IdObj query for filter */
	if(qry_parse_filter(cntxt, &flt, &ctrl->attr) ||
		qry_build_flt_select(cntxt, &sql, res, &flt,
								ctrl->objtbl ? ctrl->objtbl->line : 0,
								ctrl->objtbl ? ctrl->objtbl->lines : 0))
		STACK_ERROR;

	/* Exec Query & read result */
	SQL_QRY_DEBUG_FLT(&flt, sql->data, STACK_ERROR);	
	if(ctrl->objtbl) ctrl->objtbl->totlines = cntxt->sql_nbrows;
	if(cntxt->debug & DEBUG_SQL_SLOW && cntxt->sql_restime > 0.03) err_print_filter(&cntxt->debug_msg, &flt);
	if(res ?
		sql_get_table(cntxt, res, 0) : 
		sql_exec_query(cntxt, "ALTER TABLE IdList ADD INDEX (IdObj)"))
			STACK_ERROR;

	RETURN_OK_CLEANUP;
}
#undef ERR_FUNCTION
#undef ERR_CLEANUP
