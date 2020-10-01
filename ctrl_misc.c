/*********************************************************************
** ---------------------- Copyright notice ---------------------------
** This source code is part of the EVASoft project
** It is property of Alain Boute Ingenierie - www.abing.fr and is
** distributed under the GNU Public Licence version 2
** Commercial use is submited to licencing - contact eva@abing.fr
** -------------------------------------------------------------------
**        File : ctrl_misc.c
** Description : handling fonctions for miscellaneous controls
**      Author : Alain BOUTE
**     Created : Feb 17 2002
*********************************************************************/

#include "eva.h"

/*********************************************************************
** Function : handle_file_module
** Description : output file contents instead of attribute if newer
*********************************************************************/
#define ERR_FUNCTION "handle_file_module"
#define ERR_CLEANUP	M_FREE(txt);
int handle_file_module(					/* return : 0 on success, other on error */
	EVA_context *cntxt,					/* in : execution context data */
	unsigned long i_ctrl,				/* in : control index in cntxt->form->ctrl */
	DynBuffer **buf,					/* in/out : output buffer address */
	char *tag							/* in : enclosing tag for text, NULL for HTML */
) {
	EVA_ctrl *ctrl = cntxt->form->ctrl + i_ctrl;
	char *field = !tag ? "_EVA_TEXT" : !strcmp("script", tag) ? "_EVA_JS_SCRIPT" : "_EVA_CSS_SCRIPT";
	DynTableCell *dbval = dyntab_field_cell(&ctrl->attr, field, ~0UL, 0);
	DynTableCell *module = CTRL_ATTR_CELL(FILE_BASENAME);
	DynTableCell *merge = CTRL_ATTR_CELL(EVALSQL);
	DynBuffer *txt = NULL;

	/* Set text to db value by default */
	char *text = dbval ? dbval->txt : NULL;
	size_t sz = dbval ? dbval->len : 0;

	/* Check file date if module given */
	if(!tag) tag = "";
	if(module) {
		char *ext = !*tag ? ".htm" : !strcmp("script", tag) ? ".js" : ".css";
		char fname[256], fpath[1024];
		time_t t = dbval && !datetxt_to_time(dbval->DateCr, &t, NULL) ? t : 0, t1;

		/* Build file path */
		snprintf(add_sz_str(fname), "/modules/%s%s", module->txt, ext);
		snprintf(add_sz_str(fpath), "%smodules" DD "%s%s", cntxt->rootdir, module->txt, ext);

		/* Check file modification time */
		t1 = file_date(fpath);
		if(t1 >= t) {
			/* Use file if newer */
			if(!merge && !strcmp("script", tag))
			{
				/* JS without merge : use script include */
				DYNBUF_ADD3(buf, "\n<script type=text/javascript src='", fname, 0, NO_CONV, "' ></script>");
				sz = 0;
			}
			else if(!merge && !strcmp("style - TODO only when in <head>", tag)) {
				/* CSS without merge : use link include */
				DYNBUF_ADD3(buf, "\n<link href='", fname, 0, NO_CONV, "' rel=stylesheet type=text/css>");
				sz = 0;
			}
			else if(file_to_dynbuf(cntxt, &txt, fpath)) CLEAR_ERROR_NOWARN
			else {
				/* Other cases : use file content */
				text = txt->data;
				sz = txt->cnt;
			}
		}
	}

	/* Return if no data */
	if(!sz) RETURN_OK;

	/* Output tag header if applicable */
	if(*tag) DYNBUF_ADD3(buf, "\n<", tag, 0, NO_CONV, ">\n");

	/* Output merged or raw value */
	if(!strcmp("script", tag)) DYNBUF_ADD_STR(buf, "\"use strict\";\n");
		if(merge)
		{
			if(mailmerge_brackets(cntxt, buf, text, sz, i_ctrl, 0)) CLEAR_ERROR;
		}
		else {
			DYNBUF_ADD(buf, text, sz, NO_CONV);
		}

	/* Output tag footer if applicable */
	if(*tag) DYNBUF_ADD3(buf, "\n</", tag, 0, NO_CONV, ">\n");

	RETURN_OK_CLEANUP;
}
#undef ERR_FUNCTION
#undef ERR_CLEANUP

/*********************************************************************
** Function : ctrl_add_statictext
** Description : handles STATICTEXT controls
*********************************************************************/
#define ERR_FUNCTION "ctrl_add_statictext"
#define ERR_CLEANUP
int ctrl_add_statictext(				/* return : 0 on success, other on error */
	EVA_context *cntxt,					/* in/out : execution context data */
	unsigned long i_ctrl				/* in : control index in cntxt->form->ctrl */
){
	EVA_form *form = cntxt->form;
	EVA_ctrl *ctrl = form->ctrl + i_ctrl;
	DynTableCell *text = CTRL_ATTR_CELL(TEXT);
	char *mode_html = CTRL_ATTR_VAL(HTML);
	CHECK_HTML_STATUS;

	switch(form->step)
	{
	case HtmlEdit:
	case HtmlPrint:
	case HtmlView:
		/* Set STATICTEXT default attributes values */
		if(!ctrl->LABELPOS[0]) ctrl->LABELPOS = "_EVA_NONE";

		/* Output cell header */
		if(ctrl_format_pos(cntxt, ctrl, 1)) STACK_ERROR;
		
		/* Output CSS+HTML+JS */
		if(*mode_html > '0') {
			char b_ext =(char)(*mode_html > '2');
			if(b_ext && handle_file_module(cntxt, i_ctrl, html, "style") ||
				handle_file_module(cntxt, i_ctrl, html, NULL) ||
				b_ext && handle_file_module(cntxt, i_ctrl, html, "script")) STACK_ERROR;
		}
		/* Output text */
		else if(!CTRL_ATTR_CELL(EVALSQL)) DYNBUF_ADD_CELLP(html, text, TO_HTML)
		else if(mailmerge_brackets(cntxt, html, text->txt, text->len, i_ctrl, 1)) CLEAR_ERROR;

		/* Output cell footer */
		if(ctrl_format_pos(cntxt, ctrl, 0)) STACK_ERROR;
	}

	RETURN_OK_CLEANUP;
}
#undef ERR_FUNCTION
#undef ERR_CLEANUP

/*********************************************************************
** Function : ctrl_add_anchor
** Description : handles ANCHOR controls
*********************************************************************/
#define ERR_FUNCTION "ctrl_add_anchor"
#define ERR_CLEANUP
int ctrl_add_anchor(					/* return : 0 on success, other on error */
	EVA_context *cntxt,					/* in/out : execution context data */
	unsigned long i_ctrl							/* in : control index in cntxt->form->ctrl */
) {
	EVA_form *form = cntxt->form;
	EVA_ctrl *ctrl = form->ctrl + i_ctrl;

	switch(form->step)
	{
	case CtrlRead:
		if(!*ctrl->LABELPOS) ctrl->LABELPOS = "_EVA_NONE";
		break;

	case HtmlEdit:
	case HtmlPrint:
	case HtmlView:
		/* Output text */
		if(ctrl_format_pos(cntxt, ctrl, 1)) STACK_ERROR;
		DYNBUF_ADD3_CELLP(form->html, "<a href='", CTRL_ATTR_CELL(URL), HTML_NO_QUOTE, "' target=_blank");
		if(*ctrl->NOTES)
			DYNBUF_ADD3_CELLP(form->html, "title='", CTRL_ATTR_CELL(NOTES), HTML_TOOLTIP, "'");
		DYNBUF_ADD3_CELLP(form->html, ">", CTRL_ATTR_CELL(LABEL), TO_HTML, "</a>");
		if(ctrl_format_pos(cntxt, ctrl, 0)) STACK_ERROR;
	}

	RETURN_OK_CLEANUP;
}
#undef ERR_FUNCTION
#undef ERR_CLEANUP

/*********************************************************************
** Function : ctrl_add_unknown
** Description : handles unknowned type controls
*********************************************************************/
#define ERR_FUNCTION "ctrl_add_unknown"
#define ERR_CLEANUP
int ctrl_add_unknown(					/* return : 0 on success, other on error */
	EVA_context *cntxt,					/* in/out : execution context data */
	unsigned long i_ctrl							/* in : control index in cntxt->form->ctrl */
){
	EVA_form *form = cntxt->form;
	EVA_ctrl *ctrl = form->ctrl + i_ctrl;

	switch(form->step)
	{
	case HtmlEdit:
	case HtmlPrint:
	case HtmlView:
		/* Output text */
		if(ctrl_format_pos(cntxt, ctrl, 1)) STACK_ERROR;
		DYNBUF_ADD_STR(form->html, "???");
		if(ctrl_format_pos(cntxt, ctrl, 0)) STACK_ERROR;
	}

	RETURN_OK_CLEANUP;
}
#undef ERR_FUNCTION
#undef ERR_CLEANUP
