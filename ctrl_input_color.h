/*********************************************************************
**        File : ctrl_input_color.h
** Description : HTML handling functions for INPUT controls of type HTTPLINK
**      Author : Alain BOUTE
**     Created : Feb 9 2003
*********************************************************************/


/*********************************************************************
** Function : ctrl_add_input_color
** Description : handles INPUT controls of type HTTPLINK
*********************************************************************/
int ctrl_add_input_color(			/* return : 0 on success, other on error */
	EVA_context *cntxt,				/* in/out : execution context data */
	unsigned long i_ctrl						/* in : control index in cntxt->form->ctrl */
);
