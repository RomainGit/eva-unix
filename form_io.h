/*********************************************************************
**        File : form_io.h
** Description : form load & save functions
**      Author : Alain BOUTE
**     Created : Apr 8 2002
*********************************************************************/

/*********************************************************************
** Function : form_load
** Description : load a form in cntxt->form
*********************************************************************/
int form_load(
	EVA_context *cntxt,				/* in/out : execution context data */
	DynTable *id_form,				/* in : form object id */		
	DynTable *id_obj				/* in : current object id loaded in form */		
);

/*********************************************************************
** Function : form_load_from_ctrl
** Description : open form & object and memorize caller data
*********************************************************************/
int form_load_from_ctrl(			/* return : 0 on success, other on error */
	EVA_context *cntxt,				/* in/out : execution context data */
	DynTable *id_form,				/* in : form object id */		
	DynTable *id_obj,				/* in : current object id loaded in form */		
	int loc,						/* in : where to place new form
											0 : same as caller
											1 : top
											2 : bottom (alt form) */
	unsigned long i_ctrl			/* in : caller control index in form->ctrl 
											add caller data if not 0 */
);

/*********************************************************************
** Function : form_output
** Description : output the loaded form in cntxt->html or cntxt->html1
*********************************************************************/
int form_output(					/* return : 0 on success, other on error */
	EVA_context *cntxt				/* in/out : execution context data */
);

/*********************************************************************
** Function : form_save
** Description : save marked data (column 5 of form->ctl->val) in a form
*********************************************************************/
int form_save(						/* return : 0 on success, other on error */
	EVA_context *cntxt				/* in/out : execution context data */
);
