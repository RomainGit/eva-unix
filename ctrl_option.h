/*********************************************************************
**        File : ctrl_option.h
** Description : handling functions for option controls
**      Author : Alain BOUTE
**     Created : Aug 18 2001
*********************************************************************/


/*********************************************************************
** Function : ctrl_add_option
** Description : handles OPTION controls
*********************************************************************/
int ctrl_add_option(				/* return : 0 on success, other on error */
	EVA_context *cntxt,				/* in/out : execution context data */
	unsigned long i_ctrl						/* in : control index in cntxt->form->ctrl */
);