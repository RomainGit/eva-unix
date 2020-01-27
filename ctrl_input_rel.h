/*********************************************************************
**        File : ctrl_input_rel.c
** Description : handling functions for relation input controls
**      Author : Alain BOUTE
**     Created : Apr 2 2002
*********************************************************************/

/*********************************************************************
** Function : ctrl_relation_put_table
** Description : output a RELATION control as a table
*********************************************************************/
int ctrl_relation_put_table(		/* return : 0 on success, other on error */
	EVA_context *cntxt,				/* in/out : execution context data */
	unsigned long i_ctrl			/* in : control index in cntxt->form->ctrl */
);

/*********************************************************************
** Function : ctrl_add_relation
** Description : handles RELATION controls
*********************************************************************/
int ctrl_add_relation(				/* return : 0 on success, other on error */
	EVA_context *cntxt,				/* in/out : execution context data */
	unsigned long i_ctrl						/* in : control index in cntxt->form->ctrl */
);