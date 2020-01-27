/*********************************************************************
**        File : ctrl_input_fileupload.h
** Description : HTML handling functions for input controls
**      Author : Alain BOUTE
**     Created : Aug 18 2001
*********************************************************************/


/*********************************************************************
** Function : ctrl_add_fileupload
** Description : handles INPUT controls of type FILEUPLOAD
*********************************************************************/
int ctrl_add_fileupload(			/* return : 0 on success, other on error */
	EVA_context *cntxt,				/* in/out : execution context data */
	unsigned long i_ctrl						/* in : control index in cntxt->form->ctrl */
);