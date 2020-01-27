/*********************************************************************
**        File : ctrl_input_fileupload.c
** Description : HTML handling functions for INPUT controls of type HTTPLINK
**      Author : Alain BOUTE
**     Created : Feb 7 2003
*********************************************************************/

#include "eva.h"

/*********************************************************************
** Function : ctrl_add_httplink
** Description : handles INPUT controls of type HTTPLINK
*********************************************************************/
#define ERR_FUNCTION "ctrl_add_httplink"
#define ERR_CLEANUP
int ctrl_add_httplink(				/* return : 0 on success, other on error */
	EVA_context *cntxt,				/* in/out : execution context data */
	unsigned long i_ctrl						/* in : control index in cntxt->form->ctrl */
){
	EVA_form *form = cntxt->form;
	EVA_ctrl *ctrl = form->ctrl + i_ctrl;
	unsigned long i;

	switch(form->step)
	{
	case HtmlView:
		/* Output HTTP link */
		if(ctrl_format_pos(cntxt, ctrl, 1)) STACK_ERROR;
		for(i = 0; i < ctrl->val.nbrows; i++)
		{
			/* Separate multiple values with a line break */
			if(i) DYNBUF_ADD_STR(form->html, "<br>");

			DYNBUF_ADD3_CELL(form->html, "<a href='", &ctrl->val, i, 0, HTML_NO_QUOTE, "' target='W");
			DYNBUF_ADD_CELL(form->html, &ctrl->val, i, 0, HTML_NO_QUOTE);
			DYNBUF_ADD_STR(form->html, "'>");
			DYNBUF_ADD_CELL(form->html, &ctrl->val, i, 0, TO_HTML);
			DYNBUF_ADD_STR(form->html, "</a>");
		}
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

