/*********************************************************************
**        File : ctrl_add_butn.c
** Description : handling fonctions for BUTTON controls
**      Author : Alain BOUTE
**     Created : March 27 2002
*********************************************************************/

#include "eva.h"

/*********************************************************************
** Function : put_html_swap_img
** Description : output HTML code for an image with onmouseover handler
*********************************************************************/
#define ERR_FUNCTION "put_html_swap_img"
#define ERR_CLEANUP M_FREE(img); M_FREE(img1)
int put_html_swap_img(					/* return : 0 on success, other on error */
	EVA_context *cntxt,					/* in/out : execution context data */
	char *name,	 						/* in : image name */
	char *im,	 						/* in : image file */
	char *im1							/* in : image displayed when mouse over  */
){
	char *img = NULL;
	char *img1 = NULL;
	CHECK_HTML_STATUS;
	if(!cntxt->jsenabled) RETURN_OK;
	img = get_image_file(cntxt, im, 0, 0);
	img1 = get_image_file(cntxt, im1, 0, 0);

	if(img && img1)
	{
		DYNBUF_ADD3(html, " OnMouseOver=\"document['", name, 0, TO_HTML, "']");
		DYNBUF_ADD3(html, ".src='", img1, 0, TO_HTML, "';\"");
		DYNBUF_ADD3(html, " OnMouseOut=\"document['", name, 0, TO_HTML, "']");
		DYNBUF_ADD3(html, ".src='", img, 0, TO_HTML, "';\"");
	}
	RETURN_OK_CLEANUP;
}
#undef ERR_FUNCTION
#undef ERR_CLEANUP

/*********************************************************************
** Function : put_javascript_button
** Description : output HTML code for a button control
*********************************************************************/
#define ERR_FUNCTION "put_javascript_button"
#define ERR_CLEANUP M_FREE(img); M_FREE(img1)
int put_javascript_button(				/* return : 0 on success, other on error */
	EVA_context *cntxt,					/* in/out : execution context data */
	char *action,					 	/* in : input click action */
	char *im,	 						/* in : image file */
	char *im1,							/* in : image displayed when mouse over  */
	char *label,					 	/* in : button label */
	char *alt,	 						/* in : tooltip text */
	int border,						 	/* in : border size */
	int mode						 	/* in : display mode - bit mask
											bit 2 : aligned on text if set
											bit 3 : output label if set
											bit 4 : label position is left if set */
){
	static num = 1;
	char *img = NULL;
	char *img1 = NULL;
	CHECK_HTML_STATUS;
	img = get_image_file(cntxt, im, 0, 0);
	img1 = get_image_file(cntxt, im1, 0, 0);

	/* Optimize if previous command is javascript */
	{
		DynBuffer *htm = *html;
		if(htm && htm->cnt > 9 && !strcmp(htm->data + htm->cnt - 9, "</script>"))
			htm->cnt -= 9;
		else
			DYNBUF_ADD_STR(html, "<script>");
	}
	cntxt->jsfunc = 1;
	DYNBUF_ADD3(html, "ob(\"", action, 0, NO_CONV, "\"");
	DYNBUF_ADD3(html, ",\"", img, 0, NO_CONV, "\"");
	DYNBUF_ADD3(html, ",\"", img1, 0, NO_CONV, "\"");
	DYNBUF_ADD3(html, ",\"", label, 0, TO_JS_STRING, "\"");
	DYNBUF_ADD3(html, ",\"", alt, 0, TO_JS_STRING, "\"");
	DYNBUF_ADD3_INT(html, ",", border, "");
	DYNBUF_ADD3_INT(html, ",", mode, "");
	DYNBUF_ADD3_INT(html, ",", num, ");</script>");
	num++;

	RETURN_OK_CLEANUP;
}
#undef ERR_FUNCTION
#undef ERR_CLEANUP

/*********************************************************************
** Function : put_html_button
** Description : output HTML code for a button control
*********************************************************************/
#define ERR_FUNCTION "put_html_button"
#define ERR_CLEANUP M_FREE(img); \
					M_FREE(action)
int put_html_button(					/* return : 0 on success, other on error */
	EVA_context *cntxt,					/* in/out : execution context data */
	char *name,	 						/* in : input name */
	char *value,					 	/* in : input click value & button label */
	char *im,	 						/* in : image file */
	char *im1,							/* in : image displayed when mouse over  */
	char *alt,	 						/* in : tooltip text */
	int border,						 	/* in : border size */
	int mode						 	/* in : display mode - bit mask
											bit 0 : button disabled if set
											bit 1 : dont use JavaScript if set
											bit 2 : aligned on text if set
											bit 3 : output label if set
											bit 4 : label position is left if set */
){
	DynBuffer *action = NULL;
	char *img = NULL;
	CHECK_HTML_STATUS;
	if(im1 && *im1 && (!im || !*im)) { im = im1; im1 = NULL; }

	if(cntxt->debug & DEBUG_HTML) DYNBUF_ADD_STR(cntxt->form->html, "\n<!--- Button Start -->\n");

	if(cntxt->jsenabled && !(mode & 3) && im && *im && strcmp(im, "_eva_nop.gif"))
	{
		DYNBUF_ADD3(&action, "cb('", name, 0, NO_CONV, "')");
		if(put_javascript_button(cntxt, action->data, im, im1, value, alt, border, mode)) STACK_ERROR;
	}
	else
	{
		/* Output anchor for tooltip help */
		if(alt && *alt) DYNBUF_ADD3(html, "<a title='", alt, 0, HTML_NO_QUOTE, "'>");

		/* Output HTML code for button input */
		img = get_image_file(cntxt, im, 0, 0);
		if(img && *img)
		{
			DYNBUF_ADD3_INT(html, "<input type=image border=", border, "")
			DYNBUF_ADD3(html, " src='", img, 0, NO_CONV, "'");
		}
		else DYNBUF_ADD_STR(html, "<input type=submit");
		if(mode & 4) DYNBUF_ADD_STR(html, " align=middle");
		if(name) DYNBUF_ADD3(html, " name='", name, 0, NO_CONV, "'");
		if(value) DYNBUF_ADD3(html, " value='", value, 0, HTML_NO_QUOTE, "'");
		if(mode & 1) DYNBUF_ADD_STR(html, " disabled");
		DYNBUF_ADD_STR(html, ">");
		if(alt && *alt) DYNBUF_ADD_STR(html, "</a>");
	}

	if(cntxt->debug & DEBUG_HTML) DYNBUF_ADD_STR(cntxt->form->html, "\n<!--- Button End -->\n");

	RETURN_OK_CLEANUP;
}
#undef ERR_FUNCTION
#undef ERR_CLEANUP

/*********************************************************************
** Function : ctrl_put_button
** Description : output BUTTON controls
*********************************************************************/
#define ERR_FUNCTION "ctrl_put_button"
#define ERR_CLEANUP	M_FREE(tooltip)
int ctrl_put_button(				/* return : 0 on success, other on error */
	EVA_context *cntxt,				/* in/out : execution context data */
	unsigned long i_ctrl			/* in : control index in cntxt->form->ctrl */
){
	EVA_form *form = cntxt->form;
	EVA_ctrl *ctrl = form->ctrl + i_ctrl;
	DynBuffer *tooltip = NULL;
	int b_formbtn = 0;
	int b_formbtnsel = 0;
	char *action = CTRL_ATTR_VAL(ACTION);
	char *showmode = CTRL_ATTR_VAL(SHOWMODE);
	char *img = CTRL_ATTR_VAL(IMAGE);
	char *imgsel = CTRL_ATTR_VAL(IMAGESEL);
	DynTableCell *link = CTRL_ATTR_CELL(URL);

	/* Handle specific buttons for selected mode */
#define CHECK_FOR(mode, tag) if(!strcmp(action, "_EVA_"#tag)) { \
								b_formbtn = 1; \
								b_formbtnsel = form->step == mode; }
	CHECK_FOR(FormList, LISTMODE)
	else CHECK_FOR(FormSearch, SEARCHMODE)
	else CHECK_FOR(FormStats, STATSMODE)
	else CHECK_FOR(FormValues, VALUESMODE)
	else CHECK_FOR(HtmlEdit, EDITMODE)
	else CHECK_FOR(HtmlView, VIEWMODE)
	else CHECK_FOR(HtmlPrint, PRINTMODE)
#undef CHECK_FOR

	/* Switch images if mode selected and display mode is SHOWSELECT */
	if(imgsel && img && b_formbtnsel && !strcmp(showmode, "_EVA_SHOWSELECTED"))
	{
		char *t = imgsel; imgsel = img; img = t; 
	}

	/* Do not output buttons depending on mode & status */
#define ACTION_IS(tag) (!strcmp(action, "_EVA_"#tag))
	if( /* Only print button in print mode */
		form->step == HtmlPrint && !ACTION_IS(PRINTMODE) ||
		/* No edit / save / saveclose button if no edit access for form */
		!(form->ctrl->access & (form->b_newobj ? AccessCreate : AccessEdit)) &&
			(ACTION_IS(EDITMODE) || ACTION_IS(SAVE) || ACTION_IS(SAVECLOSE)) ||
		/* No new obj button if new obj */
		!!dyntab_sz(&form->id_obj, 0, 0) && ACTION_IS(NEWOBJ) ||
		/* No save or ungranted update buttons if not editing */
		form->step != HtmlEdit && (ACTION_IS(SAVE) || ACTION_IS(SAVECLOSE) ||
			(ACTION_IS(UPDATE) || ACTION_IS(OPENFORM) && CTRL_ATTR_CELL(NEWOBJ_FIELD)) &&
				!(form->ctrl->access & (form->b_newobj ? AccessCreate : AccessEdit)) &&
				strcmp(CTRL_ATTR_VAL(ACCES_EDIT), "_EVA_ALWAYS")) ||
		/* No new & copy buttons if new object */
		!form->id_obj.nbrows && (ACTION_IS(NEWOBJ) || ACTION_IS(COPYOBJ)) ||
		/* Hide selected mode button if HIDESELECTED */
		b_formbtnsel && !strcmp(showmode, "_EVA_HIDESELECTED") ||
		/* No buttons other than form buttons if mode other than view or edit */
		!b_formbtn && !ACTION_IS(CLOSE) && form->step != HtmlEdit && form->step != HtmlView
		)
		RETURN_OK;
#undef ACTION_IS
	
	/* Set button default attributes values */
	if(!ctrl->POSITION[0]) ctrl->POSITION = "_EVA_NewColumn";
	if(!ctrl->LABELPOS[0]) ctrl->LABELPOS = "_EVA_NONE";
	if(!ctrl->OPTIONBUTTON[0]) ctrl->OPTIONBUTTON = "_EVA_NONE";

	/* Build button tooltip */
	DYNBUF_ADD_CELLP(&tooltip, CTRL_ATTR_CELL(LABEL), NO_CONV);
	if(ctrl->NOTES) DYNBUF_ADD3(&tooltip, "\n\n", ctrl->NOTES, 0, NO_CONV, "");

	if(ctrl_format_pos(cntxt, ctrl, 1)) STACK_ERROR;
	if(!strcmp(action, "_EVA_HTTPLINK"))
	{
		if(link)
		{
			DYNBUF_ADD3_CELLP(form->html, "<a href='", link, HTML_NO_QUOTE, "' target='W");
			DYNBUF_ADD_CELLP(form->html, link, HTML_NO_QUOTE);
			DYNBUF_ADD_STR(form->html, "'");
			PUT_HTML_ONMOUSEOVER_SWAP_IMG(ctrl->cginame->data, img, imgsel);
			DYNBUF_ADD_STR(form->html, ">");
		}
		if(put_html_image(cntxt, 
			ctrl->cginame->data,
			img,
			tooltip ? tooltip->data : NULL,
			NULL, NULL, 0)) STACK_ERROR;
		if(link)
			DYNBUF_ADD_STR(form->html, "</a>");
	}
	/* Hide UPDATE button if form not editable */
	else 
	{
		/* Output button */
		if(put_html_button(cntxt, 
			ctrl->cginame->data,
			ctrl->LABEL,
			img,
			imgsel,
			tooltip ? tooltip->data : NULL,
			0, 0)) STACK_ERROR;
	}
	if(ctrl_format_pos(cntxt, ctrl, 0)) STACK_ERROR;

	RETURN_OK_CLEANUP;
}
#undef ERR_FUNCTION
#undef ERR_CLEANUP

/*********************************************************************
** Function : ctrl_add_button
** Description : handles BUTTON controls
*********************************************************************/
#define ERR_FUNCTION "ctrl_add_button"
#define ERR_CLEANUP
int ctrl_add_button(				/* return : 0 on success, other on error */
	EVA_context *cntxt,				/* in/out : execution context data */
	unsigned long i_ctrl						/* in : control index in cntxt->form->ctrl */
){
	EVA_form *form = cntxt->form;
	EVA_ctrl *ctrl = form->ctrl + i_ctrl;

	switch(form->step)
	{
	case CtrlRead:
		/* Set CGI name type */
		ctrl->cginame->data[0] = 'B';
		RETURN_OK;

	case HtmlEdit:
	case HtmlView:	 
	case HtmlPrint:	 
	case FormList: 
	case FormSearch:
	case FormStats: 
	case FormValues:
		if(ctrl_put_button(cntxt, i_ctrl)) STACK_ERROR;
	}


	RETURN_OK_CLEANUP;
}
#undef ERR_FUNCTION
#undef ERR_CLEANUP

