/*********************************************************************
**        File : ctrl_misc.c
** Description : handling fonctions for miscellaneous controls
**      Author : Alain BOUTE
**     Created : Feb 17 2002
*********************************************************************/

#include "eva.h"

/*********************************************************************
** Function : ctrl_add_statictext
** Description : handles STATICTEXT controls
*********************************************************************/
#define ERR_FUNCTION "ctrl_add_statictext"
#define ERR_CLEANUP	DYNTAB_FREE(text)
int ctrl_add_statictext(				/* return : 0 on success, other on error */
	EVA_context *cntxt,					/* in/out : execution context data */
	unsigned long i_ctrl							/* in : control index in cntxt->form->ctrl */
){
	EVA_form *form = cntxt->form;
	EVA_ctrl *ctrl = form->ctrl + i_ctrl;
	DynTable text = { 0 };

	/* Read control attributes */
	CTRL_OPTIONAL(text, TEXT);

	switch(form->step)
	{
	case HtmlEdit:
	case HtmlPrint:
	case HtmlView:
		/* Set STATICTEXT default attributes values */
		if(!ctrl->LABELPOS[0]) ctrl->LABELPOS = "_EVA_NONE";
		if(!ctrl->OPTIONBUTTON[0]) ctrl->OPTIONBUTTON = "_EVA_NONE";

		/* Output text */
		if(ctrl_format_pos(cntxt, ctrl, 1)) STACK_ERROR;
		DYNBUF_ADD_CELL(form->html, &text, 0, 0, TO_HTML);
		if(ctrl_format_pos(cntxt, ctrl, 0)) STACK_ERROR;
	}

	RETURN_OK_CLEANUP;
}
#undef ERR_FUNCTION
#undef ERR_CLEANUP

/*********************************************************************
** Function : ctrl_add_unknown
** Description : handles unknowned type controls
*********************************************************************/
#define ERR_FUNCTION "ctrl_add_unknown"
#define ERR_CLEANUP
int ctrl_add_unknown(					/* return : 0 on success, other on error */
	EVA_context *cntxt,					/* in/out : execution context data */
	unsigned long i_ctrl							/* in : control index in cntxt->form->ctrl */
){
	EVA_form *form = cntxt->form;
	EVA_ctrl *ctrl = form->ctrl + i_ctrl;

	switch(form->step)
	{
	case HtmlEdit:
	case HtmlPrint:
	case HtmlView:
		/* Output text */
		if(ctrl_format_pos(cntxt, ctrl, 1)) STACK_ERROR;
		DYNBUF_ADD_STR(form->html, "???");
		if(ctrl_format_pos(cntxt, ctrl, 0)) STACK_ERROR;
	}

	RETURN_OK_CLEANUP;
}
#undef ERR_FUNCTION
#undef ERR_CLEANUP
