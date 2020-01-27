/*********************************************************************
**        File : ctrl_image.c
** Description : handling fonctions for static image controls
**      Author : Alain BOUTE
**     Created : Feb 17 2002
*********************************************************************/

#include "eva.h"

/*********************************************************************
** Function : put_html_image
** Description : output HTML code for an image control
*********************************************************************/
#define ERR_FUNCTION "put_html_image"
#define ERR_CLEANUP M_FREE(img)
int put_html_image(						/* return : 0 on success, other on error */
	EVA_context *cntxt,					/* in/out : execution context data */
	char *name,	 						/* in : image name */
	char *im,							/* in : image file */
	char *alt,							/* in : tooltip text */
	char *width,						/* in : image width */
	char *height,					 	/* in : image height */
	int border						 	/* in : border size */
){
	char *img;
	CHECK_HTML_STATUS;
	img = get_image_file(cntxt, im, 0, 0);
	if(!img) RETURN_OK;

	DYNBUF_ADD_STR(html, "<img ");
	if(name && *name) DYNBUF_ADD3(html, " name='", name, 0, NO_CONV, "'");
	if(alt && *alt) DYNBUF_ADD3(html, " alt='", alt, 0, HTML_NO_QUOTE, "'");
	if(width && *width) DYNBUF_ADD3(html, " width='", width, 0, NO_CONV, "'");
	if(height && *height) DYNBUF_ADD3(html, " height='", height, 0, NO_CONV, "'");
	DYNBUF_ADD3_INT(html, " border=", border, "")
	DYNBUF_ADD3(html, " src='", img, 0, NO_CONV, "'");
	DYNBUF_ADD_STR(html, ">");
	RETURN_OK_CLEANUP;
}
#undef ERR_FUNCTION
#undef ERR_CLEANUP

/*********************************************************************
** Function : ctrl_add_image
** Description : handles IMAGE controls
*********************************************************************/
#define ERR_FUNCTION "ctrl_add_image"
#define ERR_CLEANUP	M_FREE(img)
int ctrl_add_image(						/* return : 0 on success, other on error */
	EVA_context *cntxt,					/* in/out : execution context data */
	unsigned long i_ctrl							/* in : control index in cntxt->form->ctrl */
){
	EVA_form *form = cntxt->form;
	EVA_ctrl *ctrl = form->ctrl + i_ctrl;
	char *animation;
	char *image, *img = NULL;

	switch(form->step)
	{
	case HtmlPrint:
	case HtmlView:
	case HtmlEdit:
		/* Set IMAGE default attributes values */
		if(!ctrl->LABELPOS[0]) ctrl->LABELPOS = "_EVA_NONE";
		if(!ctrl->OPTIONBUTTON[0]) ctrl->OPTIONBUTTON = "_EVA_NONE";
		image = CTRL_ATTR_VAL(IMAGE);

		/* Handle JavaScript animation during page load */
		if(cntxt->jsenabled)
		{
			animation = CTRL_ATTR_VAL(IMAGE_PAGELOAD);
			if(*animation)
			{
				img = get_image_file(cntxt, image, 0, 0);
				image = img ? img : "../img/_eva_nop.gif";
				DYNBUF_ADD3_BUF(&cntxt->endjs, "document.mainform[\"", ctrl->cginame, NO_CONV, "\"].src='");
				DYNBUF_ADD(&cntxt->endjs, image, 0, NO_CONV);
				DYNBUF_ADD_STR(&cntxt->endjs, "';");
				image = animation;
			}
		}

		/* Output image */
		if(ctrl_format_pos(cntxt, ctrl, 1) ||
			put_html_image(cntxt, ctrl->cginame->data, 
							image, 
							ctrl->LABEL,
							CTRL_ATTR_VAL(IMGWIDTH),
							CTRL_ATTR_VAL(IMGHEIGHT),
							atoi(CTRL_ATTR_VAL(IMGBORDER))) ||
			ctrl_format_pos(cntxt, ctrl, 0)) 
			STACK_ERROR;
	}

	RETURN_OK_CLEANUP;
}
#undef ERR_FUNCTION
#undef ERR_CLEANUP
