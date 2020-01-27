/*********************************************************************
**        File : ctrl_exprval.c
** Description : handling functions for expression value controls 
**      Author : Alain BOUTE
**     Created : Aug 18 2001
*********************************************************************/

#include "eva.h"

/*********************************************************************
** Function : html_put_value_fmt
** Description : output a formated cell for a table of objects
*********************************************************************/
#define ERR_FUNCTION "html_put_value_fmt"
#define ERR_CLEANUP DYNTAB_FREE(id_obj); \
					DYNTAB_FREE(objdata); \
					M_FREE(stripval) 
int html_put_value_fmt(			/* return : 0 on success, other on error */
	EVA_context *cntxt,					/* in/out : execution context data */
	EVA_ctrl *ctrl,						/* in : output control */
	DynTable *table,					/* in : values table */
	unsigned long row,					/* in : index of value to process in table */
	char *fmt,							/* in : format specification */
	size_t strip,						/* in : max length for output values */
	size_t *tot_char,					/* in/out : output values char counter */
	int *b_stripped						/* out : 1 if value was stripped, 0 else */
){
	EVA_form *form = cntxt->form;
	ObjTableFormat *tbl = ctrl->objtbl;
	DynTable id_obj = { 0 };
	DynTable objdata = { 0 };
	DynTableCell *val = dyntab_cell(table, row, 0);
	DynBuffer *stripval = NULL;
	CHECK_HTML_STATUS;
#define HANDLE_STRIP(code) DYNBUF_HANDLE_STRIP(html, strip, *tot_char, *b_stripped, code)

	/* Init stripping */
	*b_stripped = 0;

	/* Compute best format if none given and value not empty */
	if((!fmt || !*fmt) && val->txt && val->len)
	{
		if(val->b_relation)
			fmt = "_EVA_RELATION";
		else if(!strncmp(val->txt, add_sz_str("http://")) ||
				!strncmp(val->txt, add_sz_str("ftp://")) ||
				!strncmp(val->txt, add_sz_str("www.")))
			fmt = "_EVA_HTTPLINK";
	}

	/* Handle value format */
	if(!strncmp(fmt, add_sz_str("_EVA_DATE")))
	{
		/* Date : use put_value_fmt with <nobr> */
		HANDLE_STRIP(
			{ if(put_value_fmt(cntxt, html, DYNTAB_VAL_SZ(table, row, 0), fmt)) STACK_ERROR; });
	}
	else if(!strcmp(fmt, "_EVA_AGE") ||
			!strcmp(fmt, "_EVA_FILESIZE") ||
			!strcmp(fmt, "_EVA_NUMBER") ||
			!strcmp(fmt, "_EVA_MONEY"))
	{
		/* Date, age, file size, number, money : use put_value_fmt with <nobr> */
		DYNBUF_ADD_STR(html, "<nobr>");
		HANDLE_STRIP({
			if(put_value_fmt(cntxt, &stripval, DYNTAB_VAL_SZ(table, row, 0), fmt) ||
				put_html_bold_substring(cntxt, html, DYNBUF_VAL_SZ(stripval), tbl ? &tbl->srchwords : NULL)) STACK_ERROR;
		});
		DYNBUF_ADD_STR(html, "</nobr>");
	}
	else if(!strncmp(fmt, add_sz_str("_EVA_RELATION")) || !strcmp(fmt, "_EVA_TXTLINK") && form->step != HtmlPrint)
	{
		/* Relation to other object : check if given value is a relation */
		char *idend = NULL;
		unsigned long idrelobj = val->txt ? strtoul(val->txt, &idend, 10) : 0;
		int b_button = strstr(fmt, "BTN") != NULL;
		int b_label = strcmp(fmt, "_EVA_RELATION_BTN0");
		if(idend && *idend) idrelobj = 0;

		/* Set value object if value is not a relation */
		if(!strcmp(fmt, "_EVA_TXTLINK"))
		{
			idrelobj = val->IdValObj ? val->IdValObj : val->IdObj;
			val->b_relation = 0;
		}
		
		if(b_button)
		{
			/* Output open button */
			DYNBUF_ADD_STR(html, "<table noborder cellpadding=0 cellspacing=0><tr>");
		}
		if(qry_obj_idfield(cntxt, &objdata, idrelobj, 0) ||
			ctrl_add_symbol_btn(cntxt, ctrl, val, NULL, &objdata, 0,
			add_sz_str("Cliquez pour ouvrir la fiche"), b_button ? "" : NULL, 
								tbl ? b_button ? b_label ? "SYMBOL+LABEL" : "SYMBOL" : "LABEL" :
									b_button ? b_label ? "SYMBOL+LABEL+OBJNOTES" : "SYMBOL+OBJNOTES" : "LABEL+OBJNOTES"))
			STACK_ERROR;
		if(b_button) DYNBUF_ADD_STR(html, "</tr></table>");
		
		/* Handle striping */
		(*tot_char) ++;
	}
	else if(!strcmp(fmt, "_EVA_EMAIL"))
	{
		/* Email adress */
		DYNBUF_ADD3_CELL(html, "<a href='mailto:", table, row, 0, HTML_NO_QUOTE, "'>");
		HANDLE_STRIP({
			if(put_html_bold_substring(cntxt, html, DYNTAB_VAL_SZ(table, row, 0), tbl ? &tbl->srchwords : NULL))
				STACK_ERROR;
		})
		DYNBUF_ADD_STR(html, "</a>");
	}
	else if(!strcmp(fmt, "_EVA_HTTPLINK"))
	{
		/* HTTP link */
		size_t sz = dyntab_sz(table, row, 0);
		char *url = dyntab_val(table, row, 0);
		char *adr = strstr(url, "://");
		char *urlstrip = sz < 200 ? NULL : strchr(url + 30, '/');
		DYNBUF_ADD_STR(html, "<a href='");
		if(!adr && *url != '.') DYNBUF_ADD_STR(html, "http://");
		DYNBUF_ADD(html, url, sz, HTML_NO_QUOTE);
		DYNBUF_ADD_STR(html, "' target='W");
		DYNBUF_ADD(html, url, sz, HTML_NO_QUOTE);
		DYNBUF_ADD_STR(html, "'>");
		adr = adr ? adr + 3 : url;
		sz = urlstrip ? urlstrip - adr + 1 : strlen(adr);
		HANDLE_STRIP({
			if(put_html_bold_substring(cntxt, html, adr, sz, tbl ? &tbl->srchwords : NULL))
				STACK_ERROR;
			if(urlstrip) DYNBUF_ADD_STR(html, "...");
		})
		DYNBUF_ADD_STR(html, "</a>");
	}
	else if(!strcmp(fmt, "_EVA_DOCUMENT"))
	{
		/* Link to document */
		char *filename;
		DynTableCell *name, *path;

		/* Read linked object */
		DYNTAB_SET_CELL(&id_obj, 0, 0, table, row, 0);
		if(qry_obj_data(cntxt, &objdata, &id_obj, NULL)) STACK_ERROR;

		/* Add link to file */
		path = dyntab_field_cell(&objdata, "_EVA_FILE_SERVER_NAME", 0, 1, 0);
		if(path)
		{
			DYNBUF_ADD3(html, "<a href='../" DIRECTORY_DOCS "/", cntxt->dbname, 0, NO_CONV, "");
			DYNBUF_ADD3_CELLP(html, "/", path, NO_CONV, "'");
			DYNBUF_ADD3_CELLP(html, " target='W", path, HTML_NO_QUOTE, "'>");
		}
		name = dyntab_field_cell(&objdata, "_EVA_FILE_CLIENT_PATH", 0, 1, 0);
		filename = (name && name->len) ? basename(name->txt, name->len) : "???";
		HANDLE_STRIP({
			if(put_html_bold_substring(cntxt, html, filename, 0, tbl ? &tbl->srchwords : NULL))
				STACK_ERROR;
		})
		if(path) DYNBUF_ADD_STR(html, "</a>");
	}
	else
	{
		/* Output data with bolded search string if applicable */
		if(tbl && tbl->input && tbl->input[0] && (tbl->srchcol >= tbl->field.nbrows || tbl->srchcol & (1 << val->col)) && tbl->status & TblCtrl_opensearch)
		{
			HANDLE_STRIP(
			{
				DYNBUF_ADD_CELL(&stripval, table, row, 0, NO_CONV);
				if(put_html_bold_substring(cntxt, html, DYNBUF_VAL_SZ(stripval), tbl ? &tbl->srchwords : NULL))
					STACK_ERROR;
			})
		}
		else
			HANDLE_STRIP(
				DYNBUF_ADD_CELL(html, table, row, 0, TO_HTML));
	}

	RETURN_OK_CLEANUP;
}
#undef ERR_FUNCTION
#undef ERR_CLEANUP

/*********************************************************************
** Function : ctrl_output_exprval
** Description : compute values of CALC controls
*********************************************************************/
#define ERR_FUNCTION "ctrl_output_exprval"
#define ERR_CLEANUP	DYNTAB_FREE(srcobj); \
					DYNTAB_FREE(srcfield); \
					M_FREE(expr); \
					cntxt->sql_trace = sql_trace
int ctrl_output_exprval(			/* return : 0 on success, other on error */
	EVA_context *cntxt,				/* in/out : execution context data */
	EVA_ctrl *ctrl,					/* in : control to output */
	unsigned long options			/* in : output options
										0 : formated values using tables
										1 : formated values in standard text
										2 : output to column 1 of ctrl->val */
){
	DynTable srcobj = {0};
	DynTable srcfield = {0};
	DynBuffer *expr = NULL;
	char *type = CTRL_ATTR_VAL(TYPE);
	DynBuffer **html = options == 2 ? &expr : cntxt->form->html;
	int sql_trace = cntxt->sql_trace;

	/* Add control value depending on value type */
	if(!strcmp("_EVA_USERNAME", type))
	{
		DYNBUF_ADD(html, 
			cntxt->user_data.nbrows ? 
				dyntab_field_val(&cntxt->user_data, "_EVA_USERNAME", 0, 1, 0) :
				CTRL_ATTR_VAL(NOT_IDENTIFIED),
			0, NO_CONV);
		if(options == 2) DYNTAB_ADD_BUF(&ctrl->val, 0, 1, expr);
	}
	else if(!strcmp("_EVA_SYSTEMTIME", type))
	{
		char txt[32];
		datetxt_to_format(cntxt, txt, cntxt->timestamp, NULL);
		DYNBUF_ADD(html, txt, 0, NO_CONV);
		if(options == 2) DYNTAB_ADD_BUF(&ctrl->val, 0, 1, expr);
	}
	else if(!strcmp("_EVA_FIELD", type))
	{
		/* Field / expression value : output result values */
		unsigned long i;
		size_t tot_char = 0;
		int b_stripped;
		char *valtyp = CTRL_ATTR_VAL(SRC_OBJ);
		char *fmt = CTRL_ATTR_VAL(DISPLAYFORMAT);
		char *vmult = CTRL_ATTR_VAL(MULTIPLE_HANDLER);
		char *fieldexpr = CTRL_ATTR_VAL(SRCFIELD);
		DynTableCell *lblunit = CTRL_ATTR_CELL(LABELUNIT);
		char *separ = ", ";

		/* Evaluate expression */
		if(!*valtyp) valtyp = "_EVA_CURRENTOBJ";
		CTRL_OPTIONAL(srcobj, LISTOBJ);
		if(*dyntab_field_val(&ctrl->attr, "_EVA_DEBUG_SQL", 0, 1, 0) == '1') cntxt->sql_trace = DEBUG_SQL_RES;
		if(qry_eval_sqlexpr_var(cntxt, &expr, fieldexpr, &ctrl->attr)) STACK_ERROR;
		DYNTAB_ADD_BUF(&srcfield, 0, 0, expr);
		if(form_eval_valtype(cntxt, &ctrl->val, valtyp, &srcobj, &srcfield)) CLEAR_ERROR;

		/* Handle multiple values */
		ctrl->MULTIPLE = "";
		if(!strcmp(vmult, "_EVA_LINE"))
		{
			ctrl->MULTIPLE = "Yes";
			separ = "<br>";
		}
		else if(!strcmp(vmult, "_EVA_COMMA"))
		{
			ctrl->MULTIPLE = "Yes";
		}
		else if(!strncmp(vmult, add_sz_str("_EVA_")))
		{
			if(dyntab_group(&ctrl->val, vmult + 5)) RETURN_ERR_MEMORY;
		}
		else
		{
			ctrl->MULTIPLE = "Unique";
			separ = "<br>";
		}
		ctrl_renumber_values(ctrl, 0);

		/* Output values */
		for(i = 0; i < ctrl->val.nbrows; i++)
		{
			/* Output formated value */
			if(options)
			{
				M_FREE(expr);
				if(put_value_fmt(cntxt, html, DYNTAB_VAL_SZ(&ctrl->val, i, 0), fmt))
					CLEAR_ERROR;
				if(options == 2)
					DYNTAB_ADD_BUF(&ctrl->val, i, 1, expr)
				else
					DYNBUF_ADD(html, separ, 0, NO_CONV);
			}
			else
			{
				if(i && html && *html && (*html)->cnt > 8 && strcmp("</table>", (*html)->data + (*html)->cnt - 8))
					DYNBUF_ADD(html, separ, 0, NO_CONV);
				if(html_put_value_fmt(cntxt, ctrl, &ctrl->val, i, fmt, 0, &tot_char, &b_stripped))
					CLEAR_ERROR;
			}
			if(lblunit) DYNBUF_ADD3_CELLP(html, "&nbsp;", lblunit, TO_HTML, "");

			/* Add value to list of values if in a table */
			if(cntxt->form->Line) DYNTAB_ADD_CELL(&ctrl->allval, ctrl->allval.nbrows, 0, &ctrl->val, i, 0);
		}
	}

	RETURN_OK_CLEANUP;
}
#undef ERR_FUNCTION
#undef ERR_CLEANUP

/*********************************************************************
** Function : ctrl_add_exprval
** Description : handles CALC controls
*********************************************************************/
#define ERR_FUNCTION "ctrl_add_exprval"
#define ERR_CLEANUP	
int ctrl_add_exprval(				/* return : 0 on success, other on error */
	EVA_context *cntxt,				/* in/out : execution context data */
	unsigned long i_ctrl		/* in : control index in cntxt->form->ctrl */
){
	EVA_form *form = cntxt->form;
	EVA_ctrl *ctrl = form->ctrl + i_ctrl;
	CHECK_HTML_STATUS;

	if(form->step == HtmlView || form->step == HtmlPrint || form->step == HtmlEdit)
	{
		/* Add HTML code for the text control label & position */
		if(ctrl_format_pos(cntxt, ctrl, 1)) STACK_ERROR;

		/* Add control value depending on value type */
		if(ctrl_output_exprval(cntxt, ctrl, 0)) STACK_ERROR;

		/* Add HTML code for the control footer */
		if(ctrl_format_pos(cntxt, ctrl, 0)) STACK_ERROR;
	}

	RETURN_OK_CLEANUP;
}
#undef ERR_FUNCTION
#undef ERR_CLEANUP
