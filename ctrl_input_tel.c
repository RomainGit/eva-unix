/*********************************************************************
** ---------------------- Copyright notice ---------------------------
** This source code is part of the EVASoft project
** It is property of Alain Boute Ingenierie - www.abing.fr and is
** distributed under the GNU Public Licence version 2
** Commercial use is submited to licencing - contact eva@abing.fr
** -------------------------------------------------------------------
**        File : ctrl_input_tel.c
** Description : handling functions for INPUT controls of type TELEPHONE
**      Author : Alain BOUTE
**     Created : Sept 22 2003
*********************************************************************/

#include "eva.h"


/*********************************************************************
** Function : ctrl_add_input_tel
** Description : handles INPUT controls of type TELEPHONE
*********************************************************************/
#define ERR_FUNCTION "ctrl_add_input_tel"
#define ERR_CLEANUP	M_FREE(buf); \
					M_FREE(name)
int ctrl_add_input_tel(				/* return : 0 on success, other on error */
	EVA_context *cntxt,				/* in/out : execution context data */
	unsigned long i_ctrl			/* in : control index in cntxt->form->ctrl */
){
	EVA_form *form = cntxt->form;
	EVA_ctrl *ctrl = form->ctrl + i_ctrl;
	DynBuffer *buf = NULL;
	DynBuffer *name = NULL;
	unsigned long i, k;
	int b_multiple = ctrl->MULTIPLE[0] != 0 && strcmp("No", ctrl->MULTIPLE);
	
	/* Set default width */
	if(!ctrl->COLUMNS) ctrl->COLUMNS = 17;
	
	switch(form->step)
	{
	case CtrlRead:
		for(i = 0; i < ctrl->val.nbrows; i++)
		{
			DynTableCell *c = dyntab_cell(&ctrl->val, i, 0);
			char *val = c->txt, *in = val, *out = val;
			if(!val || !c->len) continue;

			/* Remove unwanted chars for telephone */
			while(*in)
			{
				if(isdigit(*in) || *in == '+' && in == val)
				{
					*out = *in; out++;
				}
				in++;
			}
			*out = 0;
			c->len = out - val;
		}
		break;

	case InputCheck:
		/* Check each value */
		for(i = 0; i < ctrl->val.nbrows; i++)
		{
			DynTableCell *c = dyntab_cell(&ctrl->val, i, 0);
			char *val = c->txt, *err;
			if(!val || !c->len) continue;

			/* Check telephone validity */
			err = !strchr("03+", *val) ?  "il doit commencer par un 0 ou un + pour les num�ros internationnaux" :
				(*val == '+' && val[1] == '0') ? "+0 n'est pas un pr�fixe autoris�" :
				(*val == '3' && c->len != 4) ? "les num�ros courts doivent avoir 4 chiffres" :
				(*val == '0' && c->len != 10) ? "les num�ros fran�ais doivent avoir 10 chiffres" :
				(c->len > 14) ? "il doit comporter moins de 14 caract�res" :
				NULL;
			if(err)
			{
				ctrl->error |= 2;
				if(ctrl->errmsg) DYNBUF_ADD_STR(&ctrl->errmsg, "\n");
				DYNBUF_ADD3_CELL(&ctrl->errmsg, "Le num�ro de t�l�phone [", &ctrl->val, i, 0, NO_CONV, "] n'est pas valide : ");
				DYNBUF_ADD(&ctrl->errmsg, err, 0, NO_CONV);
			}
		}
		break;

	case HtmlEdit:
	case HtmlPrint:
	case HtmlView:
		/* Add HTML code for control label & position */
		if(ctrl_format_pos(cntxt, ctrl, 1)) STACK_ERROR;

		/* Handle empty value in view mode */
		if(form->step != HtmlEdit && !ctrl->val.nbrows && *ctrl->LABEL_NOSEL) DYNBUF_ADD(form->html, ctrl->LABEL_NOSEL, 0, TO_HTML);

		/* Add HTML code for each value */
		k = ctrl->val.nbrows + ((form->step == HtmlEdit && b_multiple) ? 1 : 0);
		for(i = 0; !i || i < k; i++)
		{
			/* Separate multiple values with a line break */
			if(i) DYNBUF_ADD_STR(form->html, "<br>");

			/* Handle edit mode */
			if(form->step == HtmlEdit)
			{
				M_FREE(buf);
				if(put_value_fmt(cntxt, &buf, DYNTAB_VAL_SZ(&ctrl->val, i, 0), "_EVA_TELEPHONE")) STACK_ERROR;
				CTRL_CGINAMEVAL(&name, i);
				if(put_html_text_input(cntxt, 
						DYNBUF_VAL_SZ(name),
						DYNBUF_VAL_SZ(buf),
						0, 0, 1, ctrl->COLUMNS,
						atoi(CTRL_ATTR_VAL(MAXLENGTH)), NULL) ||
					ctrl_put_hidden_old(cntxt, ctrl, i, name, DYNBUF_VAL_SZ(buf)))
				STACK_ERROR;
			}
			else 
				/* Output formated value */
				if(put_value_fmt(cntxt, form->html, DYNTAB_VAL_SZ(&ctrl->val, i, 0), "_EVA_TELEPHONE")) STACK_ERROR;
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
