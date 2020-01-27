/*********************************************************************
**        File : ctrl_output_list.c
** Description : handling functions for output controls of type LIST (tables of objects)
**      Author : Alain BOUTE
**     Created : April 26 2002
*********************************************************************/

#include "eva.h"

/*********************************************************************
** Function : ctrl_add_output_list_simple
** Description : handles OUTPUT controls of type LIST_SIMPLE
*********************************************************************/
#define ERR_FUNCTION "ctrl_add_output_list_simple"
#define ERR_CLEANUP
int ctrl_add_output_list_simple(	/* return : 0 on success, other on error */
	EVA_context *cntxt,				/* in/out : execution context data */
	unsigned long i_ctrl						/* in : control index in cntxt->form->ctrl */
){
	EVA_form *form = cntxt->form;
	EVA_ctrl *ctrl = form->ctrl + i_ctrl;

	switch(form->step)
	{
	case CtrlRead:
		/* Handle search & addnew functions */
		if(table_read_controls(cntxt, i_ctrl, NULL) ||
			table_process_controls(cntxt, i_ctrl)) STACK_ERROR;
		break;

	case HtmlEdit:
	case HtmlPrint:
	case HtmlView:
		if(!form->html) break;

		/* Output table of values */
		if(ctrl_format_pos(cntxt, ctrl, 1) ||
			table_put_html_obj_list(cntxt, i_ctrl) ||
			ctrl_format_pos(cntxt, ctrl, 0)) STACK_ERROR;
		break;
	}

	RETURN_OK_CLEANUP;
}
#undef ERR_FUNCTION
#undef ERR_CLEANUP

/*********************************************************************
** Function : ctrl_add_output_list_ctrl
** Description : handles OUTPUT controls of type LIST_CTRL
*********************************************************************/
#define ERR_FUNCTION "ctrl_add_output_list_ctrl"
#define ERR_CLEANUP 
int ctrl_add_output_list_ctrl(		/* return : 0 on success, other on error */
	EVA_context *cntxt,				/* in/out : execution context data */
	unsigned long i_ctrl						/* in : control index in cntxt->form->ctrl */
){
	EVA_form *form = cntxt->form;
	EVA_ctrl *ctrl = form->ctrl + i_ctrl;

	/* TODO */
	ctrl = 0;

	RETURN_OK_CLEANUP;
}
#undef ERR_FUNCTION
#undef ERR_CLEANUP
