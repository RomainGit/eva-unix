/*********************************************************************
**        File : form_utils.h
** Description : generic forms functions (display, save, print, ...)
**      Author : Alain BOUTE
**     Created : Sept 23 2001
*********************************************************************/


/*********************************************************************
** Function : form_free_ctrl
** Description : free cntxt->form->ctrl structure
*********************************************************************/
void form_free_ctrl(
	EVA_context *cntxt,				/* in : execution context data */
	unsigned long beg				/* control index to start with */
);

/*********************************************************************
** Function : form_free_html
** Description : reinitialize current form's HTML buffers
*********************************************************************/
void form_free_html(EVA_context *cntxt);

/*********************************************************************
** Function : form_free
** Description : free a form structure
*********************************************************************/
void form_free();

/*********************************************************************
** Function : form_set_homepage
** Description : set current form to homepage
*********************************************************************/
int form_set_homepage(				/* return : 0 on success, other on error */
	EVA_context *cntxt
);

/*********************************************************************
** Function : form_close_nosave
** Description : close the given form & obj without saving
*********************************************************************/
int form_close_nosave(				/* return : 0 on success, other on error */
	EVA_context *cntxt,				/* in : execution context data */
	unsigned long idform,			/* in : form id to search for */
	unsigned long idobj,			/* in : object id to search for */
	DynTable *call_data				/* in : form call data */
);

/*********************************************************************
** Function : check_login
** Description : check login & passwd and alloc session number
*********************************************************************/
int check_login(				/* return : 0 on success, other on error */
	EVA_context *cntxt
);
