/*********************************************************************
**        File : ctrl_image.c
** Description : handling fonctions for static image controls
**      Author : Alain BOUTE
**     Created : Feb 17 2002
*********************************************************************/


/*********************************************************************
** Function : put_html_image
** Description : output HTML code for an image control
*********************************************************************/
int put_html_image(						/* return : 0 on success, other on error */
	EVA_context *cntxt,					/* in/out : execution context data */
	char *name,	 						/* in : image name */
	char *img,							/* in : image file */
	char *alt,							/* in : tooltip text */
	char *width,						/* in : image width */
	char *height,					 	/* in : image height */
	int border						 	/* in : border size */
);

/*********************************************************************
** Function : ctrl_add_image
** Description : handles IMAGE controls
*********************************************************************/
int ctrl_add_image(						/* return : 0 on success, other on error */
	EVA_context *cntxt,					/* in/out : execution context data */
	unsigned long i_ctrl							/* in : control index in cntxt->form->ctrl */
);