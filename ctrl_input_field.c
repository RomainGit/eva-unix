/*********************************************************************
**        File : ctrl_input_field.c
** Description : HTML handling functions for INPUT controls of type FIELD
**      Author : Alain BOUTE
**     Created : Sept 22 2003
*********************************************************************/

#include "eva.h"

/*********************************************************************
** Function : ctrl_add_input_field
** Description : handles INPUT controls of type FIELD
*********************************************************************/
#define ERR_FUNCTION "ctrl_add_input_field"	
#define ERR_CLEANUP
int ctrl_add_input_field(			/* return : 0 on success, other on error */
	EVA_context *cntxt,				/* in/out : execution context data */
	unsigned long i_ctrl			/* in : control index in cntxt->form->ctrl */
){
	EVA_form *form = cntxt->form;
	EVA_ctrl *ctrl = form->ctrl + i_ctrl;
	unsigned long i;

	switch(form->step)
	{
	case CtrlRead:
		/* Format each value */
		if(!*CTRL_ATTR_VAL(FONTFACE)) ctrl->FONTFACE = "Courier";
		for(i = 0; i < ctrl->val.nbrows; i++)
		{
			char *val = dyntab_val(&ctrl->val, i, 0);
			size_t sz = strcspn(val, "-><()[]{}=,.");
			if(val[sz]) continue;
			setcase(3, val, 0);
			while(*val) { if(!isalnum(*val)) *val = '_'; val++; }
		}
		break;

	default:
		/* Handle as text control */
		if(ctrl_add_text(cntxt, i_ctrl)) STACK_ERROR;
	}

	RETURN_OK_CLEANUP;
}
#undef ERR_FUNCTION
#undef ERR_CLEANUP
