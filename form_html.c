/*********************************************************************
**        File : form_html.c
** Description : generic forms functions (display, save, print, ...)
**      Author : Alain BOUTE
**     Created : Sept 23 2001
*********************************************************************/

#include "eva.h"

/*********************************************************************
** Function : form_put_html
** Description : outputs HTML code for the given form
*********************************************************************/
#define ERR_FUNCTION "form_put_html"
#define ERR_CLEANUP M_FREE(name); \
					M_FREE(img)
int form_put_html(
	EVA_context *cntxt		/* in/out : execution context data */
){
	EVA_form *form = cntxt->form;
	EVA_ctrl *ctrl = form ? form->ctrl : NULL;
	char *align;
	char *bgcolor;
	char *background;
	char *img = NULL;
	char *cellwidth;
	DynBuffer *name = NULL;

	/* Build default title if applicable */
	if(!form->html_title && CTRL_ATTR_CELL(AUTO_TITLEBAR))
	{
		ctrl->LABELFONTSIZE = "+0";
		ctrl->LABELBOLD = "1";
		form->html = &form->html_title;
		DYNBUF_ADD_STR(form->html,
			"<table border=0 rules=none cellspacing=0 cellpadding=0 width=100%");
		bgcolor = dyntab_field_val(&cntxt->cnf_data, "_EVA_TITLE_BGCOLOR", 0, 1, 0);
		if(*bgcolor) DYNBUF_ADD3(form->html," bgcolor=#", bgcolor, 0, NO_CONV, "");
		img = get_image_file(cntxt, dyntab_field_val(&cntxt->cnf_data, "_EVA_TITLE_BACKGROUND", 0, 1, 0), 0, 0);
		if(img) DYNBUF_ADD3(form->html," background='", img, 0, NO_CONV, "'");
		M_FREE(img);
		DYNBUF_ADD_STR(form->html, ">");
		if(ctrl_put_label(cntxt, ctrl, "_EVA_NewColumn")) STACK_ERROR;
		DYNBUF_ADD_STR(form->html, 
			"<td align=right>");
		if(ctrl_cgi_name(cntxt, ctrl, NULL, 0, &name, 'B', add_sz_str("CLOSE")) ||
			put_html_button(cntxt, name->data, NULL, "_eva_close.gif", "_eva_close_s.gif", "Ferme le formulaire", 0, 0)) STACK_ERROR;
		DYNBUF_ADD_STR(form->html,
			"</td></tr></table></font>");
		form->html = NULL;
	}
	if(!form->title) DYNBUF_ADD(&form->title, ctrl->LABEL, 0, NO_CONV);

	/* Set form default attributes values */
	ctrl->POSITION = "_EVA_NewColumn";
	ctrl->LABELPOS = "_EVA_NONE";
	ctrl->OPTIONBUTTON = ctrl->LABELPOS;
	if(!ctrl->TABLERULES[0]) ctrl->TABLERULES = "none";
	if(!CTRL_ATTR_CELL(BORDER)) ctrl->BORDER = 3;

	/* Read form attributes */
	align = CTRL_ATTR_VAL(TABLEALIGN);
	bgcolor = ctrl->TABLEBGCOLOR;
	background = ctrl->TABLEBACKGROUND;
	if(!*bgcolor) bgcolor = dyntab_field_val(&cntxt->cnf_data, "_EVA_FORM_BGCOLOR", 0, 1, 0);
	if(!*background) background = dyntab_field_val(&cntxt->cnf_data, "_EVA_FORM_BACKGROUND", 0, 1, 0);
	cellwidth = CTRL_ATTR_VAL(WIDTH);

	/* Handle page title */
	if(!cntxt->title && !dyntab_cmp(&form->id_form, 0, 0, &cntxt->id_form, 0, 0))
		DYNBUF_ADD_BUF(&cntxt->title, form->title, NO_CONV);
	 
	/* Mark form context CGI data not to be reoutput */
	CGI_VALUES_DONTKEEP(&ctrl->cgival);

	/* Output HTML debug info if applicable */
	form->html = &cntxt->html;
	if(cntxt->debug & DEBUG_HTML)
		DYNBUF_ADD3(cntxt->form->html, "\n<!--- Start Form ", ctrl->LABEL, 0, NO_CONV, " -->\n");
 
	/* Put hidden input for form context data : selected tab, caller data, form title */
	if(cgi_build_basename(cntxt, &ctrl->cginame, 0, 'F')) STACK_ERROR;
	DYNBUF_ADD3(form->html, 
		"<input type=hidden name='", ctrl->cginame->data, ctrl->cginame->cnt, NO_CONV, "' value='");
	if(form_status_data(cntxt, form->html)) STACK_ERROR;
	DYNBUF_ADD_STR(form->html, "'>");
	if(cntxt->debug & DEBUG_HTML) DYNBUF_ADD_STR(form->html, "\n");

	/* Output form main table header */
	if(ctrl->FONTFACE[0]) DYNBUF_ADD3(form->html, "<font face='", ctrl->FONTFACE, 0, NO_CONV, "'>");
	if(put_html_table_header(cntxt, align, ctrl->TABLEWIDTH, bgcolor, background,
								0, 0, ctrl->BORDER, atoi(CTRL_ATTR_VAL(TABBORDER)) ? "rows" : "none"))
		STACK_ERROR;

	/* Output form title */
	if(form->html_title) DYNBUF_ADD3_BUF(form->html, "<td>",form->html_title, NO_CONV, "</td></tr><tr>")
	M_FREE(form->html_title);

	switch(form->step)
	{
	case FormValues:
		if(form_mode_values(cntxt)) STACK_ERROR;
		break;

	case FormSearch:
		if(form_mode_search(cntxt)) STACK_ERROR;
		break;

	case FormList:
		if(form_mode_list(cntxt)) STACK_ERROR;
		break;

	case HtmlSaveDlg:
		/* Output dialog */
		DYNBUF_ADD3_BUF(form->html, "<td><font face=Arial><b>", form->html_top, NO_CONV, "</font></td>");
		break;

	default:
		/* Output form top controls */
		if(form->html_top)
		{
			ctrl->BORDER = atoi(CTRL_ATTR_VAL(INNERBORDER));
			ctrl->WIDTH = "";
			if(ctrl_format_pos(cntxt, ctrl, 1) ||
				put_html_table_header(cntxt, NULL, CTRL_ATTR_VAL(WIDTH), NULL, NULL, 
								atoi(CTRL_ATTR_VAL(CELLSPACING)), 
								atoi(CTRL_ATTR_VAL(CELLPADDING)), ctrl->BORDER, ctrl->TABLERULES))
				STACK_ERROR;
			DYNBUF_ADD3_BUF(form->html, "", form->html_top, NO_CONV, "</tr></table>")
			if(ctrl_format_pos(cntxt, ctrl, 0)) STACK_ERROR;
			DYNBUF_ADD_STR(form->html, "</tr><tr>")
		}

		/* Output TABs buttons bar if applicable */
		if(form->html_tabs && form->step != HtmlPrint)
		{
			/* Read form tabs attributes */
			DynTableCell *tabsheight = CTRL_ATTR_CELL(TABSHEIGHT);
			DynTableCell *tabsbgcolor = CTRL_ATTR_CELL(TABSBGCOLOR);
			DynTableCell *tabsborder = CTRL_ATTR_CELL(TABSBORDER);

			/* Put tabs buttons bar */
			DYNBUF_ADD_STR(form->html, "<td");
			if(tabsbgcolor) DYNBUF_ADD3_CELLP(form->html, " bgcolor=#", tabsbgcolor, NO_CONV, "");
			img = get_image_file(cntxt, CTRL_ATTR_VAL(TABSBACKGROUND), 0, 0);
			if(img) DYNBUF_ADD3(form->html, " background='", img, 0, NO_CONV, "'");
			M_FREE(img);
			if(tabsheight) DYNBUF_ADD3_CELLP(form->html, " valign=bottom height=", tabsheight, NO_CONV, "");
			DYNBUF_ADD3_INT(form->html, "><table border=", (tabsborder ? atoi(tabsborder->txt) : 0), 
							" rules=none cellspacing=0 cellpadding=0><tr>");
			DYNBUF_ADD_BUF(form->html, form->html_tabs, NO_CONV);

			/* Put option button for current tab */
			if(form->i_seltab)
			{
				DYNBUF_ADD_STR(form->html, "<td>");
				if(ctrl_add_opt_btn(cntxt, cntxt->form->ctrl + form->i_seltab)) STACK_ERROR;
				DYNBUF_ADD_STR(form->html, "</td>");
			}
			DYNBUF_ADD_STR(form->html, "</tr></table></td>")
			DYNBUF_ADD_STR(form->html, "</tr><tr>")
		}
		if(form->html_tab)
		{
			/* Read form tab attributes */
			EVA_ctrl *tab = form->ctrl + form->i_seltab;
			if(!tab->HEIGHT[0]) tab->HEIGHT = CTRL_ATTR_VAL(TABHEIGHT);
			if(!tab->BGCOLOR[0]) tab->BGCOLOR = CTRL_ATTR_VAL(TABBGCOLOR);
			if(!tab->BGCOLOR[0]) tab->BGCOLOR = ATTR_VAL(&cntxt->srvfmt, TABBGCOLOR);
			if(!tab->BACKGROUND[0]) tab->BACKGROUND = CTRL_ATTR_VAL(TABBACKGROUND);
			if(!tab->BACKGROUND[0]) tab->BACKGROUND = ATTR_VAL(&cntxt->srvfmt, TABBACKGROUND);
			tab->POSITION = "_EVA_NewColumn";
			tab->VALIGN = "top";
			
			/* Put tab contents & table footer */
			if(ctrl_format_pos(cntxt, tab, 1) || ctrl_put_table_header(cntxt, tab)) STACK_ERROR;
			DYNBUF_ADD3_BUF(form->html, "", form->html_tab, NO_CONV, "</tr></table>");
			if(ctrl_format_pos(cntxt, ctrl, 0)) STACK_ERROR;
			DYNBUF_ADD_STR(form->html, "</tr><tr>");
		}
 
		/* Output form bottom controls */
		if(form->html_bot)
		{
			DYNBUF_ADD_STR(form->html, "<td width=100%><table border=0 cellspacing=0 cellpadding=0");
			if(ctrl->TABLEWIDTH[0]) DYNBUF_ADD3(form->html, " width=", ctrl->TABLEWIDTH, 0, NO_CONV, "");
			DYNBUF_ADD3_BUF(form->html, "><tr>\n", form->html_bot, NO_CONV, "</tr></table></td></tr><tr>")
		}
	}

	/* Output form table footer */
	DYNBUF_ADD_STR(form->html, "</tr></table>");
	if(ctrl->FONTFACE[0]) DYNBUF_ADD_STR(form->html, "</font>");

	/* Output HTML debug info if applicable */
	if(cntxt->debug & DEBUG_HTML)
		DYNBUF_ADD3(cntxt->form->html, "\n<!--- EndOf Form ", ctrl->LABEL, 0, NO_CONV, " -->\n");

	RETURN_OK_CLEANUP;
}
#undef ERR_FUNCTION
#undef ERR_CLEANUP

/*********************************************************************
** Function : form_status_data
** Description : output encoded form status data
*********************************************************************/
#define ERR_FUNCTION "form_status_data"
#define ERR_CLEANUP 
int form_status_data(				/* return : 0 on success, other on error */
	EVA_context *cntxt,				/* in/out : execution context data */
	DynBuffer **html				/* in/out : output buffer */
){
	EVA_form *form = cntxt->form;
	if(form->i_seltab) DYNBUF_ADD(html, form->ctrl[form->i_seltab].cginame->data, 
													 form->ctrl[form->i_seltab].cginame->cnt, NO_CONV);
	DYNBUF_ADD3_CELL(html, "§", &form->call_data, 0, 0, NO_CONV, "");
	DYNBUF_ADD3_BUF(html, "§", form->title, HTML_NO_QUOTE, "");
	DYNBUF_ADD3_INT(html, "§", form->step, "");
	DYNBUF_ADD3_CELL(html, "§", &form->dlg_ctrl, 0, 0, NO_CONV, "");
	DYNBUF_ADD3_INT(html, "§", (form->step <= HtmlStepEdit && form->step >= HtmlSaveDlg) ? form->b_modified : 0, "");

	RETURN_OK_CLEANUP;
}
#undef ERR_FUNCTION
#undef ERR_CLEANUP

/*********************************************************************
** Function : process_form
** Description : handle form interaction
*********************************************************************/
#define ERR_FUNCTION "process_form"
#define ERR_CLEANUP DYNTAB_FREE(id_form); \
					DYNTAB_FREE(id_obj)
int process_form(					/* return : 0 on success, other on error */
	EVA_context *cntxt				/* in/out : execution context data */
){
	DynTable id_form = { 0 };
	DynTable id_obj = { 0 };

	/* If button clicked */
	if(cntxt->cgi)
	{
		CGIData *cgi = cntxt->cgi + cntxt->cgibtn;
		if(cgi->IdForm)
		{
			/* Read form & object ids in CGI data */
			if(cgi->IdObj) DYNTAB_ADD_INT(&id_obj, 0, 0, cgi->IdObj);
			DYNTAB_ADD_INT(&id_form, 0, 0, cgi->IdForm);

			/* Load form holding the button clicked & find button control index */
			if(form_load(cntxt, &id_form, &id_obj)) STACK_ERROR;
			cgi = cntxt->cgi + cntxt->cgibtn;
			cntxt->form->i_ctrl_clic = ctrl_from_cginame(cntxt, cgi->name, cgi->name_sz);
			cntxt->log_clkbtn = cgi->IdCtrl;
			cntxt->log_clkform = cgi->IdForm;

			/* Call button handler */
			CTRL_ACT_HDLR(cntxt->form->i_ctrl_clic);

			/* Reset focus data if form closed */
			if(!cntxt->form || cntxt->form->b_reload)
			{
				M_FREE(cntxt->focus1);
				M_FREE(cntxt->focus2);
				M_FREE(cntxt->focus3);
			}
		}
		else
			if(action_default(cntxt, 0)) STACK_ERROR;
	}

	/* If loaded form is valid : output it */
	if(cntxt->form && !(cntxt->b_terminate & 1) && 	
			(	(	!dyntab_cmp(&cntxt->id_form, 0, 0, &cntxt->form->id_form, 0, 0) &&
					!dyntab_cmp(&cntxt->id_obj, 0, 0, &cntxt->form->id_obj, 0, 0)	) 
			|| (	!dyntab_cmp(&cntxt->alt_form, 0, 0, &cntxt->form->id_form, 0, 0) &&
					!dyntab_cmp(&cntxt->alt_obj, 0, 0, &cntxt->form->id_obj, 0, 0))) &&
		form_output(cntxt)) STACK_ERROR;

	/* Switch to homepage if no form selected */
	if(!cntxt->b_terminate && !dyntab_sz(&cntxt->id_form, 0, 0) && form_set_homepage(cntxt)) STACK_ERROR;

	/* If no session opened & identified user or next page is not home page */
	if(!dyntab_sz(&cntxt->session, 0, 0) && (cntxt->b_user_ok || dyntab_cmp(&cntxt->homepage, 0, 0, &cntxt->id_form, 0, 0)))
	{
		/* Create new session record */
		if(qry_add_new_obj(cntxt, &cntxt->session, OBJ_FORM_SESSION) ||
			qry_add_obj_field_val(cntxt, &cntxt->session, "_EVA_USER_IP", cntxt->user_ip, 0, 0, 1) ||
			qry_add_obj_field_val(cntxt, &cntxt->session, "_EVA_USER_AGENT", cntxt->user_agent, 0, 0, 1) ||
			qry_add_obj_field_val(cntxt, &cntxt->session, "_EVA_USER", DYNTAB_VAL_SZ(&cntxt->id_user, 0, 0), 1, 1))
			STACK_ERROR;
	}

	/* Load & output menubar form if applicable */
	if(!(cntxt->b_terminate & 2) && dyntab_sz(&cntxt->menubar, 0, 0))
	{
		DynBuffer *html = cntxt->html;
		cntxt->html = NULL;
		if((!cntxt->form || dyntab_cmp(&cntxt->form->id_form, 0, 0, &cntxt->menubar, 0, 0)) &&
			form_load(cntxt, &cntxt->menubar, NULL) ||
			form_output(cntxt)) STACK_ERROR;
		M_FREE(cntxt->html0);
		cntxt->html0 = cntxt->html;
		cntxt->html = html;
	}

	/* Load & output main form if needed */
	if(!(cntxt->b_terminate & 4) && !cntxt->html &&
		(form_load(cntxt, &cntxt->id_form, &cntxt->id_obj) ||
		form_output(cntxt))) STACK_ERROR;

	/* Load & output alternate form if applicable */
	if(!(cntxt->b_terminate & 8) && !cntxt->html1 && cntxt->alt_form.nbrows && (
		form_load(cntxt, &cntxt->alt_form, &cntxt->alt_obj) ||
		form_output(cntxt))) STACK_ERROR;

	/* Ouput hidden input for CGI values not displayed as input */
	if(cgi_put_hidden(cntxt)) STACK_ERROR;

	RETURN_OK_CLEANUP;
}
#undef ERR_FUNCTION
#undef ERR_CLEANUP

