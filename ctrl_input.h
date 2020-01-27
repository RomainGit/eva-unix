/*********************************************************************
**        File : ctrl_input.c
** Description : handling functions for input controls
**      Author : Alain BOUTE
**     Created : Aug 18 2001
*********************************************************************/

/*********************************************************************
** Function : ctrl_read_values
** Description : read input control values in ctrl->val
*********************************************************************/
int ctrl_read_values(				/* return : 0 on success, other on error */
	EVA_context *cntxt,				/* in/out : execution context data */
	unsigned long i_ctrl						/* in : control index in cntxt->form->ctrl */
);

/*********************************************************************
** Function : ctrl_add_input
** Description : handles INPUT controls
*********************************************************************/
int ctrl_add_input(					/* return : 0 on success, other on error */
	EVA_context *cntxt,				/* in/out : execution context data */
	unsigned long i_ctrl						/* in : control index in cntxt->form->ctrl */
);


/*********************************************************************
** Function : ctrl_filter_values
** Description : filter control values for current line & num index
*********************************************************************/
int ctrl_filter_values(				/* return : 0 on success, other on error
											original values are placed in ctrl->allval
											filtered valued are placed in ctrl->val */
	EVA_context *cntxt,				/* in : execution context data
											Line & Num members are used to filter values */
	unsigned long i_ctrl			/* in : control index in cntxt->form->ctrl */
);
