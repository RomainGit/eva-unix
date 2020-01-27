/*********************************************************************
**        File : ctrl_input_basic.c
** Description : HTML handling functions for input controls
**      Author : Alain BOUTE
**     Created : Aug 18 2001
*********************************************************************/

#include "eva.h"

/*********************************************************************
** Function : put_html_text_input
** Description : output HTML code for text input
*********************************************************************/
#define ERR_FUNCTION "put_html_text_input"
#define ERR_CLEANUP 
int put_html_text_input(				/* return : 0 on success, other on error */
	EVA_context *cntxt,					/* in/out : execution context data */
	char *name, size_t sz_name, 		/* in : input name */
	char *val, size_t sz_val,			/* in : value  of the control */
	int b_passwd,						/* in : treat as password */
	int b_onblur,						/* in : use JavaScript OnBlur if 1 */
	int lines, int columns,				/* in : size of the control (in chars) */
	int maxlength		   				/* in : maximum input length (in chars) */
){
	DynBuffer **focus;
	CGIData *cgi = cntxt->cgi ? cntxt->cgi + cntxt->cgibtn : NULL, fcgi = {0};
	CHECK_HTML_STATUS;
	
	/* Output HTML code for input */
	if(lines <= 1 || b_passwd)
	{
		if(b_passwd) DYNBUF_ADD_STR(html, "<input type=password")
		else DYNBUF_ADD_STR(html, "<input type=text");
		DYNBUF_ADD3(html, " name='", name, sz_name, NO_CONV, "'");
		if(val && *val) DYNBUF_ADD3(html, " value='", val, sz_val, HTML_NO_QUOTE, "'");
		if(columns > 0)DYNBUF_ADD3_INT(html, " size=", columns, "");
		if(maxlength > 0) DYNBUF_ADD3_INT(html, " maxlength=", maxlength, "");
		if(b_onblur && cntxt->jsenabled) DYNBUF_ADD3(html, " onBlur='cb(\"", name, sz_name, NO_CONV, "\");'");
		DYNBUF_ADD_STR(html, ">");
	}
	else
	{
		DYNBUF_ADD3(html, "<textarea name='", name, sz_name, NO_CONV, "'");
		if(lines > 0) DYNBUF_ADD3_INT(html, " rows=", lines, "");
		if(columns > 0) DYNBUF_ADD3_INT(html, " cols=", columns, "");
		if(b_onblur && cntxt->jsenabled) DYNBUF_ADD3(html, " onBlur='cb(\"", name, sz_name, NO_CONV, "\");'");
		DYNBUF_ADD_STR(html, ">");
		if(val && *val) DYNBUF_ADD(html, val, sz_val, TO_XML);
		DYNBUF_ADD_STR(html, "</textarea>");
	}

	/* Handle setfocus */
	fcgi.name = name;
	fcgi.name_sz = sz_name;
	if(cgi && cgi_parse_name(cntxt, &fcgi)) STACK_ERROR;
	focus = (cgi && cgi->IdForm == fcgi.IdForm && cgi->IdObj == fcgi.IdObj && !strcmp(cgi->field, fcgi.field)) ? &cntxt->focus1 : 
			(!val || !*val || !sz_val) ? &cntxt->focus2 : &cntxt->focus3;
	if(!*focus) DYNBUF_ADD(focus, name, sz_name, NO_CONV);

	RETURN_OK_CLEANUP;
}
#undef ERR_FUNCTION
#undef ERR_CLEANUP

/*********************************************************************
** Function : ctrl_add_text_value
** Description : output HTML code for text input with given value
*********************************************************************/
#define ERR_FUNCTION "ctrl_add_text_value"
#define ERR_CLEANUP if(!name1) M_FREE(name)
int ctrl_add_text_value(			/* return : 0 on success, other on error */
	EVA_context *cntxt,				/* in/out : execution context data */
	EVA_ctrl *ctrl,	 				/* in : control to process */
	unsigned long i_val,			/* in : value index in ctrl->val */
	char *txt, size_t len,			/* in : text to use for value - if NULL use ctrl->val[i] */
	DynBuffer *name1 				/* in : CGI input name - if NULL build control value name */
){
	DynBuffer *name = name1 ? name1 : NULL;
	DynTableCell *lblunit = CTRL_ATTR_CELL(LABELUNIT);
	DynTableCell *val = dyntab_cell(&ctrl->val, i_val, 0);

	/* Set text if not given */
	if(!txt && val)
	{
		txt = val->txt;
		len = val->len;
	}

	/* If edit mode : add HTML text input */
	if(cntxt->form->step == HtmlEdit)
	{
		if(!name) CTRL_CGINAMEVAL(&name, i_val);
		if(put_html_text_input(cntxt, 
				DYNBUF_VAL_SZ(name),
				txt, len,
				CTRL_ATTR_VAL(PASSWORD)[0] == '1', 0,
				ctrl->LINES,
				ctrl->COLUMNS,
				atoi(CTRL_ATTR_VAL(MAXLENGTH))) ||
			ctrl_put_hidden_old(cntxt, ctrl, i_val, name, txt, len))
		STACK_ERROR;
	}
	else
	{
		/* Else : add text value */
		if(CTRL_ATTR_VAL(PASSWORD)[0] == '1') DYNBUF_ADD_STR(cntxt->form->html, "******")
		else DYNBUF_ADD(cntxt->form->html, txt, len, TO_HTML);
	}
	if(lblunit) DYNBUF_ADD3_CELLP(cntxt->form->html, "</b><font size=-1><nobr> ", lblunit, TO_HTML, " </nobr></font>");

	RETURN_OK_CLEANUP;
}
#undef ERR_FUNCTION
#undef ERR_CLEANUP

/*********************************************************************
** Function : ctrl_add_text
** Description : handles INPUT controls of type TEXT
*********************************************************************/
#define ERR_FUNCTION "ctrl_add_text"
#define ERR_CLEANUP
int ctrl_add_text(					/* return : 0 on success, other on error */
	EVA_context *cntxt,				/* in/out : execution context data */
	unsigned long i_ctrl			/* in : control index in cntxt->form->ctrl */
){
	EVA_form *form = cntxt->form;
	EVA_ctrl *ctrl = form->ctrl + i_ctrl;
	unsigned long i, k;
	int b_multiple = ctrl->MULTIPLE[0] != 0 && strcmp("No", ctrl->MULTIPLE);
	
	switch(form->step)
	{
	case CtrlRead:
		{
			/* Handle input mask */
			char *_inputmask = CTRL_ATTR_VAL(TEXTINPUTMASK), *inputmask = _inputmask + 5;

			/* Format each value */
			if(*_inputmask) for(i = 0; i < ctrl->val.nbrows; i++)
			{
				DynTableCell *c = dyntab_cell(&ctrl->val, i, 0);
				char *in = c->txt, *out = in, *old;
				if(!c->txt && *c->txt) continue;
				M_STRDUP(old, c->txt, c->len);
				if(!strcmp(inputmask, "UCASE"))
					setcase(1, c->txt, 0);
				else if(!strcmp(inputmask, "NAMECASE"))
				{
					while(*in)
					{
						setcase((in == c->txt || strchr(" -", *(in - 1))), in, 1);
						in++;
					}
				}
				else if(!strcmp(inputmask, "PHRASE"))
				{
					setcase(1, c->txt, 1);
					setcase(0, c->txt + 1, 0);
				}
				else if(!strcmp(inputmask, "PHONE"))
				{
					while(*in)
					{
						*in = (char)((in == c->txt && *in == '+' || isdigit(*in)) ? *in : ' ');
						in++;
					}
				}

				/* Remove duplicate spaces */
				in = c->txt, out = in;
				while(*in)
				{
					if(!isspace(*in) || out > c->txt && !isspace(*(out - 1)))
					{
						*out = *in; 
						out++;
					}
					in++;
				}
				*out = 0;
				c->len = out - c->txt;
				if(strcmp(old, c->txt))
				{
					c->b_modified = 1;
					ctrl->b_modified = 1;
				}
				M_FREE(old);
			}
		}
		break;

	case HtmlEdit:
	case HtmlPrint:
	case HtmlView:
		/* Add HTML code for control label & position */
		if(!form->html) RETURN_OK;
		if(ctrl_format_pos(cntxt, ctrl, 1)) STACK_ERROR;

		/* Add HTML code for each value */
		k = ctrl->val.nbrows + ((form->step == HtmlEdit && (b_multiple || !ctrl->val.nbrows)) ? 1 : 0);
		for(i = 0; i < k; i++)
		{
			/* Separate multiple values with a line break */
			if(i) DYNBUF_ADD_STR(form->html, "<br>");

			/* Add text control */
			if(ctrl_add_text_value(cntxt, ctrl, i, NULL, 0, NULL)) STACK_ERROR;
		}

		/* Add HTML code for the control footer */
		if(ctrl_format_pos(cntxt, ctrl, 0)) STACK_ERROR;
		break;
	}

	RETURN_OK_CLEANUP;
}
#undef ERR_FUNCTION
#undef ERR_CLEANUP

/*********************************************************************
** Function : ctrl_add_input_email
** Description : handles INPUT controls of type EMAIL
*********************************************************************/
#define ERR_FUNCTION "ctrl_add_input_email"
#define ERR_CLEANUP
int ctrl_add_input_email(			/* return : 0 on success, other on error */
	EVA_context *cntxt,				/* in/out : execution context data */
	unsigned long i_ctrl			/* in : control index in cntxt->form->ctrl */
){
	EVA_form *form = cntxt->form;
	EVA_ctrl *ctrl = form->ctrl + i_ctrl;
	unsigned long i, k;
	int b_multiple = ctrl->MULTIPLE[0] != 0 && strcmp("No", ctrl->MULTIPLE);
	size_t tot_char = 0;
	int b_stripped;
	
	if(!form->html) RETURN_OK;

	switch(form->step)
	{
	case HtmlPrint:
	case HtmlView:
		/* Add HTML code for control label & position */
		if(ctrl_format_pos(cntxt, ctrl, 1)) STACK_ERROR;

		/* Add HTML code for each value */
		k = ctrl->val.nbrows + ((form->step == HtmlEdit && (b_multiple || !ctrl->val.nbrows)) ? 1 : 0);
		for(i = 0; i < k; i++)
		{
			/* Separate multiple values with a line break */
			if(i) DYNBUF_ADD_STR(form->html, "<br>");

			/* Add text control */
			if(html_put_value_fmt(cntxt, ctrl, &ctrl->val, i, "_EVA_EMAIL", 0, &tot_char, &b_stripped)) CLEAR_ERROR;
		}

		/* Add HTML code for the control footer */
		if(ctrl_format_pos(cntxt, ctrl, 0)) STACK_ERROR;
		break;
	default:
		if(ctrl_add_text(cntxt, i_ctrl)) STACK_ERROR;
	}

	RETURN_OK_CLEANUP;
}
#undef ERR_FUNCTION
#undef ERR_CLEANUP

/*********************************************************************
** Function : ctrl_add_number
** Description : handles INPUT controls of type NUMBER
*********************************************************************/
#define ERR_FUNCTION "ctrl_add_number"
#define ERR_CLEANUP
int ctrl_add_number(				/* return : 0 on success, other on error */
	EVA_context *cntxt,				/* in/out : execution context data */
	unsigned long i_ctrl						/* in : control index in cntxt->form->ctrl */
){
	EVA_form *form = cntxt->form;
	EVA_ctrl *ctrl = form->ctrl + i_ctrl;
	unsigned long i, k;
	int b_multiple = ctrl->MULTIPLE[0] != 0 && strcmp("No", ctrl->MULTIPLE);

	switch(form->step)
	{
	case CtrlRead:
		/* Format each value */
		for(i = 0; i < ctrl->val.nbrows; i++)
		{
			char *val = dyntab_val(&ctrl->val, i, 0);
			char *num = input_to_number(val);
			if(strcmp(num, val)) 
			{
				DYNTAB_ADD(&ctrl->val, i, 0, num, strlen(num), NO_CONV);
				dyntab_cell(&ctrl->val, i, 0)->b_modified = 1;
				ctrl->b_modified = 1;
			}
		}
		break;

	case InputCheck:
		/* Check each value */
		for(i = 0; i < ctrl->val.nbrows; i++)
		{
			double num = atof(input_to_number(dyntab_val(&ctrl->val, i, 0)));
			DynTableCell *cmin = CTRL_ATTR_CELL(MIN_VALUE);
			double vmin = cmin ? atof(cmin->txt) : 0;
			DynTableCell *cmax = CTRL_ATTR_CELL(MAX_VALUE);
			double vmax = cmax ? atof(cmax->txt) : 0;
			if(cmin && num < vmin || cmax && num > vmax)
			{
				ctrl->error = 2;
				if(ctrl->errmsg) DYNBUF_ADD_STR(&ctrl->errmsg, " - ");
				if(cmin && cmax)
				{
					DYNBUF_ADD3_CELLP(&ctrl->errmsg, "Valeur entre ", cmin, NO_CONV, " et ");
					DYNBUF_ADD_CELLP(&ctrl->errmsg, , cmax, NO_CONV);
				}
				else if(cmin)
					DYNBUF_ADD3_CELLP(&ctrl->errmsg, "Valeur supérieure à ", cmin, NO_CONV, "")
				else
					DYNBUF_ADD3_CELLP(&ctrl->errmsg, "Valeur inférieure à ", cmax, NO_CONV, "")
			}
		}
		break;

	case HtmlEdit:
	case HtmlPrint:
	case HtmlView:
		/* Add HTML code for control label & position */
		if(ctrl_format_pos(cntxt, ctrl, 1)) STACK_ERROR;

		/* Add HTML code for each value */
		k = ctrl->val.nbrows + ((form->step == HtmlEdit && (b_multiple || !ctrl->val.nbrows)) ? 1 : 0);
		for(i = 0; i < k; i++)
		{
			/* Separate multiple values with a line break */
			if(i) DYNBUF_ADD_STR(form->html, "<br>");

			/* Add text control */
			if(form->step == HtmlEdit)
			{
				if(ctrl_add_text_value(cntxt, ctrl, i, DYNTAB_VAL_SZ(&ctrl->val, i, 0), NULL)) STACK_ERROR;
			}
			else
			{
				/* Calc number value with given format */
				char *fmtval = number_to_format(dyntab_val(&ctrl->val, i, 0), CTRL_ATTR_VAL(FORMAT));
				
				if(ctrl_add_text_value(cntxt, ctrl, i, fmtval, strlen(fmtval), NULL)) STACK_ERROR;
			}
		}

		/* Add HTML code for the control footer */
		if(ctrl_format_pos(cntxt, ctrl, 0)) STACK_ERROR;
		break;

	default:
		/* Handle as text control */
		if(ctrl_add_text(cntxt, i_ctrl)) STACK_ERROR;
	}

	RETURN_OK_CLEANUP;
}
#undef ERR_FUNCTION
#undef ERR_CLEANUP

/*********************************************************************
** Function : put_html_chkbox
** Description : output HTML code for a chkbox input
*********************************************************************/
#define ERR_FUNCTION "put_html_chkbox"
#define ERR_CLEANUP 
int put_html_chkbox(					/* return : 0 on success, other on error */
	EVA_context *cntxt,					/* in/out : execution context data */
	char *name, size_t sz_name, 		/* in : input name */
	char *value, size_t sz_value, 		/* in : input value */
	int b_status,				 		/* in : bitmask :
											bit 0 : checked if set
											bit 1 : radio button if set */
	int b_submit						/* in : use OnClick JavaScript if 1 */
){
	CHECK_HTML_STATUS;

	/* Output HTML code for input */
	if(b_status & 2) 
		DYNBUF_ADD_STR(html, "<input type=radio")
	else 
		DYNBUF_ADD_STR(html, "<input type=checkbox");
	if(name) DYNBUF_ADD3(html, " name='", name, sz_name, NO_CONV, "'");
	if(value) DYNBUF_ADD3(html, " value='", value, sz_value, HTML_NO_QUOTE, "'");
	if(b_status & 1) DYNBUF_ADD_STR(html, " checked");
	if(b_submit && cntxt->jsenabled) DYNBUF_ADD3(html, " onClick='cb(\"", name, sz_name, NO_CONV, "\");'");
	DYNBUF_ADD_STR(html, ">");

	RETURN_OK_CLEANUP;
}
#undef ERR_FUNCTION
#undef ERR_CLEANUP

/*********************************************************************
** Function : ctrl_add_chkbox
** Description : handles INPUT controls of type CHECKBOX
*********************************************************************/
#define ERR_FUNCTION "ctrl_add_chkbox"
#define ERR_CLEANUP DYNTAB_FREE(ctrltree); \
					M_FREE(name); \
					M_FREE(notes)
int ctrl_add_chkbox(				/* return : 0 on success, other on error */
	EVA_context *cntxt,				/* in/out : execution context data */
	unsigned long i_ctrl						/* in : control index in cntxt->form->ctrl */
){
	EVA_form *form = cntxt->form;
	EVA_ctrl *ctrl = form->ctrl + i_ctrl;
	DynTable ctrltree = { 0 };
	DynBuffer *name = NULL;
	DynBuffer *notes = NULL;
	char *img, *imgsel;
	unsigned long i;
	int b_3state = CTRL_ATTR_CELL(CHECKBOX_3STATE) != NULL;
	int tree = 1;
	switch(*dyntab_val(&ctrl->val, 0, 0))
	{
	case 0: tree = b_3state ? 0 : 2; break;
	case '0': tree = 2;
	}

	switch(form->step)
	{
	case CtrlRead:
		/* If checkbox clicked */
		if(form->i_ctrl_clic == i_ctrl && cntxt->cgi && cntxt->cgi[cntxt->cgibtn].name[0] == 'B')
		{
			/* Search / create corresponding value */
			CGIData *cgi = cntxt->cgi + cntxt->cgibtn;
			DynTableCell *val;
			for(i = 0; i < ctrl->val.nbrows; i++)
			{
				val = dyntab_cell(&ctrl->val, i, 0);
				if(val->Line == cgi->Line && val->Num == cgi->Num) break;
			}
			if(i == ctrl->val.nbrows)
			{
				DYNTAB_SET(&ctrl->val, i, 0, "");
				val = dyntab_cell(&ctrl->val, i, 0);
				val->Line = cgi->Line;
				val->Num = cgi->Num;
			}

			/* Handle value on checkbox click */
			switch(*dyntab_val(&ctrl->val, i, 0))
			{
			case 0:	/* Null Value : Switch to checked */
				DYNTAB_SET(&ctrl->val, i, 0, "1");
				break;
			case '0':	/* Unchecked value : Switch to null */
				DYNTAB_SET(&ctrl->val, i, 0, "");
				break;
			default:	/* Checked value : Switch to unchecked */
				if(b_3state) DYNTAB_SET(&ctrl->val, i, 0, "0")
				else DYNTAB_SET(&ctrl->val, i, 0, "");
			}
			val = dyntab_cell(&ctrl->val, i, 0);
			val->b_modified = 1;
			ctrl->b_modified = 1;
		}

		/* Read both branches */
		tree = 3;
		break;

	case InputCheck:
		/* Disable empty value check if not 3 state */
		if(!b_3state) ctrl->error = 0;
		break;

	case HtmlEdit:
	case HtmlPrint:
	case HtmlView:
		/* Defaut is no option button */
		if(!ctrl->OPTIONBUTTON[0]) ctrl->OPTIONBUTTON = "_EVA_NONE";

		/* Handle checkbox tooltip */
		DYNBUF_ADD3(&notes, "", ctrl->NOTES, 0, NO_CONV, "\n\n");

		/* Handle 3 states images */
		switch(tree)
		{
		case 0:	/* Null value */
			img = "_eva_checkbox_nul.gif";
			imgsel = "_eva_checkbox_nul_s.gif";
			DYNBUF_ADD_STR(&notes, "Etat : non renseigné");
			break;
		case 2:	/* Unchecked value */
			img = "_eva_checkbox_no.gif";
			imgsel = "_eva_checkbox_no_s.gif";
			DYNBUF_ADD_STR(&notes, "Etat : non coché");
			break;
		default:	/* Checked value */
			img = "_eva_checkbox_yes.gif";
			imgsel = "_eva_checkbox_yes_s.gif";
			DYNBUF_ADD_STR(&notes, "Etat : coché");
		}

		/* Break if no output */
		if(!form->html) break;

		/* Add HTML code for control label & position */
		if(ctrl_format_pos(cntxt, ctrl, 1)) STACK_ERROR;


		/* If edit mode */
		if(form->step == HtmlEdit)
		{
			/* Add hidden input to hold checkbox value */
			if(ctrl_put_hidden(cntxt, ctrl, 0)) STACK_ERROR;

			/* Add checkbox as button */
			CTRL_CGINAMEVAL(&name, 0);
			name->data[0] = 'B';
			if(put_html_button(cntxt, name->data, NULL, img, imgsel, notes ? notes->data : NULL, 0, 0))
				STACK_ERROR;
		}
		else
		{
			/* Else : Add checkbox as image */
			if(put_html_image(cntxt, ctrl->cginame->data, img, notes ? notes->data : NULL, NULL, NULL, 0))
				STACK_ERROR;
		}

		/* Add HTML code for the control footer */
		if(ctrl_format_pos(cntxt, ctrl, 0)) STACK_ERROR;
		break;

	}

	/* Add lower level controls depending on check status */
	if(tree == 1 || tree == 3)
	{
		/* Controls when selected */
		CTRL_OPTIONAL(ctrltree, CTRLTREE);
		CTRL_ADD_CHILD(i_ctrl, &ctrltree);
	}
	if(tree == 2 || tree == 3)
	{
		/* Controls when not selected */
		CTRL_OPTIONAL(ctrltree, CTRLTREE_ALT);
		CTRL_ADD_CHILD(i_ctrl, &ctrltree);
	}

	/* Add lower level controls */
	
	RETURN_OK_CLEANUP;
}
#undef ERR_FUNCTION
#undef ERR_CLEANUP
