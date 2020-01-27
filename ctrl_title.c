/*********************************************************************
**        File : ctrl_title.c
** Description : handling fonctions for controls of type TITLE
**      Author : Alain BOUTE
**     Created : Feb 17 2002
*********************************************************************/

#include "eva.h"

/*********************************************************************
** Function : ctrl_add_title
** Description : handles TITLE controls
*********************************************************************/
#define ERR_FUNCTION "ctrl_add_title"
#define ERR_CLEANUP DYNTAB_FREE(ctrltree); \
					DYNTAB_FREE(data); \
					M_FREE(label); \
					M_FREE(notes); \
					M_FREE(img); \
					M_FREE(imgsel); \
					M_FREE(title)
int ctrl_add_title(					/* return : 0 on success, other on error */
	EVA_context *cntxt,				/* in/out : execution context data */
	unsigned long i_ctrl			/* in : control index in cntxt->form->ctrl */
){
	EVA_form *form = cntxt->form;
	EVA_ctrl *ctrl = form->ctrl + i_ctrl;
	DynTable ctrltree = { 0 };
	DynTable data = { 0 };
	DynBuffer *title = NULL;
	DynBuffer *label = NULL;
	DynBuffer *notes = NULL;
	DynBuffer *img = NULL;
	DynBuffer *imgsel = NULL;
	DynBuffer **html = form->html;
	char *oldlabel = ctrl->LABEL;
	int b_button = 0, b_newobjlabel = 0;

	/* Read control attributes */
	CTRL_OPTIONAL(ctrltree, CTRLTREE);

	switch(form->step)
	{
	case HtmlEdit:
	case HtmlView:
	case HtmlPrint:
	case HtmlSaveDlg:
	case FormList: 
	case FormSearch:
	case FormStats: 
	case FormValues:
		/* Set title default attributes values */
		if(!ctrl->TABLERULES[0]) ctrl->TABLERULES = "none";
		if(!ctrl->TABLEWIDTH[0]) ctrl->TABLEWIDTH = "100%";
		ctrl->POSITION = "_EVA_NewColumn";
		ctrl->NOTES = form->ctrl->NOTES;
		if(CTRL_ATTR_VAL(TITLE_LABEL)[0] != '1') ctrl->LABEL = form->ctrl->LABEL;
		if(!ctrl->TABLEBGCOLOR[0]) ctrl->TABLEBGCOLOR = dyntab_field_val(&cntxt->cnf_data, "_EVA_TITLE_BGCOLOR", 0, 1, 0);
		if(!ctrl->TABLEBACKGROUND[0]) ctrl->TABLEBACKGROUND = dyntab_field_val(&cntxt->cnf_data, "_EVA_TITLE_BACKGROUND", 0, 1, 0);

		/* Build title label & value */
		if(form->step == FormList || form->step == FormSearch)
		{
			/* List or search mode - use form label as value */
 			DYNBUF_ADD_STR(&label, "Liste des fiches");
 			DYNBUF_ADD(&title, ctrl->LABEL, strlen(ctrl->LABEL), NO_CONV);
		}
		else
		{
			b_newobjlabel = !dyntab_sz(&form->id_obj, 0, 0) && 
								(DYNTAB_FIELD_CELL(&form->ctrl->attr, DISPLAYFIELDS) ||
									CTRL_ATTR_CELL(DISPLAYFIELDS));
			if(qry_obj_label(cntxt, &label, &notes, NULL, &title, &notes, &img, &imgsel, NULL, 0, NULL, 0))
				STACK_ERROR;
			b_button = img != NULL;
		}

		/* Handle form title */
		DYNBUF_ADD_BUF(&form->title, label, NO_CONV);
		if(label && title) DYNBUF_ADD_STR(&form->title, " - ");
		DYNBUF_ADD_BUF(&form->title, title, NO_CONV);
		if(b_newobjlabel) DYNBUF_ADD_STR(&form->title, " (Nouvelle fiche)");

		/* Switch output to html_tiltle & output HTML table header */
		form->html = &form->html_title;
		if(ctrl_put_table_header(cntxt, ctrl)) STACK_ERROR;

		/* Output title text */
		DYNBUF_ADD_STR(form->html, "<td><table align=left cellspacing=0 cellpadding=0 border=0><tr>\n");
		if(b_button)
		{
			DYNBUF_ADD_STR(form->html, "<td>");
			if(html_put_open_btn(cntxt, form->ctrl->cginame, NULL, 
				label, title, notes, img, imgsel, add_sz_str("Cliquez pour plus d'informations sur la fiche"), 
							0, DYNTAB_TOUL(&form->id_obj), 1, 0, 0, 0))
				STACK_ERROR;
			DYNBUF_ADD_STR(form->html, "</td>");
			if(title) ctrl->LABELPOS = "_EVA_NONE";
			else ctrl->OPTIONBUTTON = "_EVA_NONE";
			if(b_newobjlabel) DYNBUF_ADD_STR(&title, " (Nouvelle fiche)");
		}
		ctrl->LABEL = label ? label->data : "";
		if(ctrl_format_pos(cntxt, ctrl, 1)) STACK_ERROR;
		DYNBUF_ADD_BUF(form->html, title, TO_HTML);
		if(ctrl_format_pos(cntxt, ctrl, 0)) STACK_ERROR;
		DYNBUF_ADD_STR(form->html, "</tr></table></td>\n");
		ctrl->LABEL = oldlabel;

		/* Add lower level controls */
		DYNBUF_ADD_STR(form->html, "<td align=right><table cellspacing=0 cellpadding=0 border=0><tr>\n");
		CTRL_ADD_CHILD(i_ctrl, &ctrltree);
		DYNBUF_ADD_STR(form->html, "</tr></table></td>\n");

		/* Output HTML table footer */
		if(ctrl_put_table_footer(cntxt, ctrl)) STACK_ERROR;
		form->html = html;
		break;

	default:
		/* Add lower level controls */
		CTRL_ADD_CHILD(i_ctrl, &ctrltree);
	}

	RETURN_OK_CLEANUP;
}
#undef ERR_FUNCTION
#undef ERR_CLEANUP
