/*********************************************************************
**        File : ctrl_input_color.c
** Description : HTML handling functions for INPUT controls of type COLOR
**      Author : Alain BOUTE
**     Created : Feb 9 2003
*********************************************************************/

#include "eva.h"

#define X_SIZE	10	/*	color cell width for color table button */
#define Y_SIZE	10	/*	color cell height for color table button */
/*********************************************************************
** Function : ctrl_add_input_color
** Description : handles INPUT controls of type COLOR
*********************************************************************/
#define ERR_FUNCTION "ctrl_add_input_color"	
#define ERR_CLEANUP	M_FREE(name)
int ctrl_add_input_color(			/* return : 0 on success, other on error */
	EVA_context *cntxt,				/* in/out : execution context data */
	unsigned long i_ctrl						/* in : control index in cntxt->form->ctrl */
){
	EVA_form *form = cntxt->form;
	EVA_ctrl *ctrl = form->ctrl + i_ctrl;
	DynBuffer *name = NULL;
	unsigned long i, x , y;
	unsigned int r, g, b, v[] = { 0, 64, 128, 192, 255 };
	char rgb[16];
	char *btn = i_ctrl == form->i_ctrl_clic ? CGI_CLICK_BTN_SUBFIELD : "";
	CGIData *cgi = cntxt->cgi ? cntxt->cgi + cntxt->cgibtn : NULL;

	switch(form->step)
	{
	case CtrlRead:
		if(strcmp(btn, "SETCOLOR")) break;

		/* Read click coordinates */
		y = (cgi && cgi->value) ? strtoul(cgi->value, NULL, 10) : 0;
		x = (cntxt->cgibtn && (cgi - 1)->value) ? strtoul((cgi - 1)->value, NULL, 10) : 0;
		if(y > Y_SIZE * 5)
		{
			r = g = b = (unsigned int)(x / X_SIZE / 24.0 * 255);
		}
		else
		{
			b = v[y / Y_SIZE];
			g = v[x / (X_SIZE * 5)];
			r = v[x % (X_SIZE * 5) / X_SIZE];
		}
		sprintf(rgb, "%02X%02X%02X", r, g, b);
		dyntab_del_numline(&ctrl->val, cgi->Num, cgi->Line);
		DYNTAB_ADD_NL(&ctrl->val, ctrl->val.nbrows, 0, rgb, 6, cgi->Num, cgi->Line, 1);
		ctrl->b_modified = 1;
		break;

	case HtmlPrint:
	case HtmlView:
		/* Output control header */
		if(ctrl_format_pos(cntxt, ctrl, 1)) STACK_ERROR;

		/* Output each value */
		for(i = 0; i < ctrl->val.nbrows; i++)
		{
			/* Separate multiple values with a line break */
			if(i) DYNBUF_ADD_STR(form->html, "<br>");

			/* Output transparent image with color background */
			if(dyntab_sz(&ctrl->val, i, 0) == 6)
			{
				DYNBUF_ADD3_CELL(form->html, "<table border=1 cellpadding=0 cellspacing=0 bgcolor=#", &ctrl->val, i, 0, NO_CONV, ">"
												"<tr><td width=50 height=20>&nbsp;</td></tr></table>");
			}
		}

		/* Output control footer */
		if(ctrl_format_pos(cntxt, ctrl, 0)) STACK_ERROR;
		break;

	case HtmlEdit:
		/* Set default values */
		ctrl->LINES = 1;
		ctrl->COLUMNS = 6;

		/* Output control header */
		if(ctrl_format_pos(cntxt, ctrl, 1)) STACK_ERROR;

		/* Output each value */
		for(i = 0; i < (ctrl->val.nbrows ? ctrl->val.nbrows : 1); i++)
		{
			/* Separate multiple values with a line break */
			if(i) DYNBUF_ADD_STR(form->html, "<br>");

			/* Output color button & text input for RGB value */
			DYNBUF_ADD_STR(form->html, "<table border=0 cellpadding=0 cellspacing=0");
			if(dyntab_sz(&ctrl->val, i, 0) == 6) DYNBUF_ADD3_CELL(form->html, " bgcolor=#", &ctrl->val, i, 0, NO_CONV, "");
			DYNBUF_ADD_STR(form->html, "><tr>");
			if(form->step == HtmlEdit)
			{
				DYNBUF_ADD_STR(form->html, "<td>");
				if(!strcmp(btn, "RGB"))
				{
					CTRL_CGINAMEBTN(&name, dyntab_cell(&ctrl->val, i, 0), add_sz_str("SETCOLOR"));
					if(put_html_button(cntxt, name->data, NULL, "_eva_colortable.jpg", NULL, 
						"Cliquez pour choisir la couleur", 0, 2)) STACK_ERROR;
				}
				else
				{
					CTRL_CGINAMEBTN(&name, dyntab_cell(&ctrl->val, i, 0), add_sz_str("RGB"));
					if(put_html_button(cntxt, name->data, NULL, "_eva_colorcell.gif", "_eva_colorcell_s.gif",
						"Cliquez pour choisir une couleur ou entrez le code RGB de la couleur dans le texte de droite", 0, 0)) STACK_ERROR;
					DYNBUF_ADD_STR(form->html, "</td><td>");
					if(ctrl_add_text_value(cntxt, ctrl, i, NULL, 0, NULL)) STACK_ERROR;
				}
			}
			else
			{
				DYNBUF_ADD3_CELL(form->html, "<td width=70 height=20>&nbsp</td><td>", &ctrl->val, i, 0, NO_CONV, "");
			}
			DYNBUF_ADD_STR(form->html, "</td></tr></table>");
		}

		/* Output control footer */
		if(ctrl_format_pos(cntxt, ctrl, 0)) STACK_ERROR;
		break;
	}
	RETURN_OK_CLEANUP;
}
#undef ERR_FUNCTION
#undef ERR_CLEANUP

