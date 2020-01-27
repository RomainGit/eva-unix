/*********************************************************************
**        File : ctrl_add_butn.h
** Description : handling fonctions for BUTTON controls
**      Author : Alain BOUTE
**     Created : March 27 2002
*********************************************************************/


/*********************************************************************
** Macro : PUT_HTML_ONMOUSEOVER_SWAP_IMG
** Description : output HTML code for an image with onmouseover handler
*********************************************************************/
#define PUT_HTML_ONMOUSEOVER_SWAP_IMG(name, img, img1) if(put_html_swap_img(cntxt, name, img, img1)) STACK_ERROR

/*********************************************************************
** Function : put_html_swap_img
** Description : output HTML code for an image with onmouseover handler
*********************************************************************/
int put_html_swap_img(
	EVA_context *cntxt,					/* in/out : execution context data */
	char *name,	 						/* in : image name */
	char *img,	 						/* in : image file */
	char *img1							/* in : image displayed when mouse over  */
);

/*********************************************************************
** Function : get_image_file
** Description : find the file path & size given the filename
*********************************************************************/
char *get_image_file(					/* return : image file path (alloc-ed memory), nul string if not found */
	EVA_context *cntxt,					/* in/out : execution context data */
	char *img,	 						/* in : image file name */
	int *width, int *height				/* out : image size */
);

/*********************************************************************
** Function : put_html_button
** Description : output HTML code for a button control
*********************************************************************/
int put_html_button(
	EVA_context *cntxt,					/* in/out : execution context data */
	char *name,	 						/* in : input name */
	char *value,					 	/* in : input click value */
	char *img,	 						/* in : image file */
	char *img1,							/* in : image displayed when mouse over  */
	char *alt,	 						/* in : tooltip text */
	int border,						 	/* in : border size */
	int b_disabled					 	/* in : disabled input if 1 */
);

/*********************************************************************
** Function : ctrl_add_button
** Description : handles BUTTON controls
*********************************************************************/
int ctrl_add_button(				/* return : 0 on success, other on error */
	EVA_context *cntxt,				/* in/out : execution context data */
	unsigned long i_ctrl						/* in : control index in cntxt->form->ctrl */
);
