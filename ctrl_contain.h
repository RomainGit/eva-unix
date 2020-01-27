/*********************************************************************
**        File : ctrl_contain.h
** Description : handing functions for container controls
**      Author : Alain BOUTE
**     Created : Aug 18 2001
*********************************************************************/

/*********************************************************************
** Function : ctrl_add_tab
** Description : handles TAB controls
*********************************************************************/
int ctrl_add_tab(					/* return : 0 on success, other on error */
	EVA_context *cntxt,				/* in/out : execution context data */
	unsigned long i_ctrl						/* in : control index in cntxt->form->ctrl */
);

/*********************************************************************
** Function : ctrl_add_group
** Description : handles GROUP controls
*********************************************************************/
int ctrl_add_group(					/* return : 0 on success, other on error */
	EVA_context *cntxt,				/* in/out : execution context data */
	unsigned long i_ctrl						/* in : control index in cntxt->form->ctrl */
);

/*********************************************************************
** Function : ctrl_add_pack
** Description : handles GROUP controls
*********************************************************************/
int ctrl_add_pack(					/* return : 0 on success, other on error */
	EVA_context *cntxt,				/* in/out : execution context data */
	unsigned long i_ctrl						/* in : control index in cntxt->form->ctrl */
);

/*********************************************************************
** Function : ctrl_add_table
** Description : handles CONTAINER controls of type TABLE
*********************************************************************/
int ctrl_add_table(					/* return : 0 on success, other on error */
	EVA_context *cntxt,				/* in/out : execution context data */
	unsigned long i_ctrl			/* in : control index in cntxt->form->ctrl */
)

;
