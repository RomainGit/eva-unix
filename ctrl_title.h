/*********************************************************************
**        File : ctrl_title.h
** Description : handling fonctions for controls of type TITLE
**      Author : Alain BOUTE
**     Created : Feb 17 2002
*********************************************************************/


/*********************************************************************
** Function : ctrl_add_title
** Description : handles TITLE controls
*********************************************************************/
int ctrl_add_title(					/* return : 0 on success, other on error */
	EVA_context *cntxt,				/* in/out : execution context data */
	unsigned long i_ctrl			/* in : control index in cntxt->form->ctrl */
);
