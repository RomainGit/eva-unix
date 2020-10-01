/*********************************************************************
** ---------------------- Copyright notice ---------------------------
** This source code is part of the EVASoft project
** It is property of Alain Boute Ingenierie - www.abing.fr and is
** distributed under the GNU Public Licence version 2
** Commercial use is submited to licencing - contact eva@abing.fr
** -------------------------------------------------------------------
**        File : json_result.c
** Description : handlers for web service calls with JSON result
**      Author : Alain BOUTE
**     Created : Aug 15 2020
*********************************************************************/

#include "eva.h"
#include "json_result.h"

/*********************************************************************
** Function : json_print
** Description : output JSON data in html buffer
*********************************************************************/
#define ERR_FUNCTION "json_print"
#define ERR_CLEANUP
int json_print(					/* return : 0 on success, other on error */
	EVA_context* cntxt,			/* in/out : execution context data */
	char* attr,					/* in : attribute name */
	size_t szattr,				/* in : attr length */
	char* txt,					/* in : text to print */
	size_t sztxt,				/* in : txt length */
	unsigned int opt			/* in : print options :
									bit 0 : output comma separator before
									bit 1 : txt raw output (no " delimiter) */
) {
	char *separ = "\"";
	size_t szsepar = 1;
	CHECK_HTML_STATUS;

	/* Handle litteral values (no delimiter) */
	if(opt & 2)
	{
		separ = "";
		szsepar = 0;
		if(!sztxt)
		{
			txt = "null";
			sztxt = 4;
		}
	}
	if(opt & 1) DYNBUF_ADD_STR(html, ",");
	DYNBUF_ADD3(html, "\"", attr, szattr, TO_JSON, "\":");
	if(dynbuf_add3(html, separ, szsepar , txt, sztxt, TO_JSON, separ, szsepar)) STACK_ERROR;

	RETURN_OK_CLEANUP;
}
#undef ERR_FUNCTION
#undef ERR_CLEANUP

/*********************************************************************
** Function : json_print_cell
** Description : output cell JSON data in html buffer
*********************************************************************/
#define ERR_FUNCTION "json_print_cell"
#define ERR_CLEANUP
int json_print_cell(			/* return : 0 on success, other on error */
	EVA_context *cntxt,			/* in/out : execution context data */
	char *attr,					/* in : attribute name */
	size_t szattr,				/* in : attr length */
	DynTableCell *c,			/* in : text to print */
	unsigned int opt			/* in : print options :
									bit 0 : output comma separator before
									bit 1 : txt raw output (no " delimiter) */
) {
	if(json_print(cntxt, attr, szattr, c ? c->txt : "", c ? c->len : 0, opt)) STACK_ERROR;
	RETURN_OK_CLEANUP;
}
#undef ERR_FUNCTION
#undef ERR_CLEANUP

/*********************************************************************
** Function : json_ws_ctlData
** Description : handlers for web service call 
*********************************************************************/
#define ERR_FUNCTION "json_ws_ctlData"
#define ERR_CLEANUP
int json_ws_ctlData(			/* return : 0 on success, other on error */
	EVA_context *cntxt,			/* in/out : execution context data */
	unsigned long i_ctrl			/* in : control index in cntxt->form->ctrl */
) {
	EVA_ctrl *ctrl = cntxt->form->ctrl + i_ctrl;
	DynBuffer *pkey = NULL;
	DynBuffer *sql = NULL;
	DynTable ctrlattr = { 0 };
	unsigned long i;

	/* Output litteral values form ctrl->attr */
	for(i = 0; i < ctrl->attr.nbrows; i++) {
		DynTableCell *c = dyntab_cell(&ctrl->attr, i, 0);
		if(i) DYNBUF_ADD_STR(&pkey, ",");
		DYNBUF_ADD_INT(&pkey, c->Pkey);
	}

	/* Read control values with date / user info */
	DYNBUF_ADD3_BUF(&sql,
		"SELECT F.TxtValue,REPLACE(V.TxtValue,'\t',' '),"
		"L.Num,L.Line,0,''"
		"IFNULL(U.TxtValue,''),L.DateCr,L.IdObj "
		"FROM TLink AS L "
		"INNER JOIN TVal AS F ON L.IdField=F.IdValue "
		"INNER JOIN TVal AS V ON L.IdValue=V.IdValue "
		"LEFT JOIN TLink AS LU ON L.IdWhoCr=LU.IdObj "
		"LEFT JOIN TVal AS U ON LU.IdValue=U.IdValue "
		"WHERE L.Pkey IN (", pkey, NO_CONV, ") AND ");
	DYNBUF_ADD3_INT(&sql, "LU.IdField=", IDVALUE(USERNAME), " AND "
		"L.DateDel IS NULL AND LU.DateDel IS NULL "
		"ORDER BY F.TxtValue,Num,Line");
	if(sql_exec_query(cntxt, sql->data) || sql_get_table(cntxt, &ctrlattr, 0)) STACK_ERROR;

	/* Read control relations with label & date / user info */
	sql->cnt = 0;
	DYNBUF_ADD3_BUF(&sql,
		"SELECT F.TxtValue,L.IdRelObj,L.Num,L.Line,1,"
		"IFNULL(R.TxtValue,''),"
		"IFNULL(U.TxtValue,''),L.DateCr,L.IdObj "
		"FROM TLink AS L "
		"INNER JOIN TVal AS F ON L.IdField=F.IdValue "
		"INNER JOIN TLink AS LR ON L.IdRelObj=LR.IdObj "
		"LEFT JOIN TVal AS R ON LR.IdValue=R.IdValue "
		"LEFT JOIN TLink AS LU ON L.IdWhoCr=LU.IdObj "
		"LEFT JOIN TVal AS U ON LU.IdValue=U.IdValue "
		"WHERE L.Pkey IN (", pkey, NO_CONV, ") AND ");
	DYNBUF_ADD3_INT(&sql, "LR.IdField=", IDVALUE(LABEL), " AND ");
	DYNBUF_ADD3_INT(&sql, "LU.IdField=", IDVALUE(USERNAME), " AND "
		"LR.DateDel IS NULL AND "
		"L.DateDel IS NULL AND LU.DateDel IS NULL "
		"ORDER BY F.TxtValue,Num,Line");
	if(sql_exec_query(cntxt, sql->data) || sql_get_table(cntxt, &ctrlattr, 0)) STACK_ERROR;

	RETURN_OK_CLEANUP;
}
#undef ERR_FUNCTION
#undef ERR_CLEANUP

#define JSON_ADD_TBL(attr, opt) json_print_cell(cntxt, add_sz_str(#attr), dyntab_cell(&tbl->attr, i, 0), opt)

/*********************************************************************
** Function : ws_handler
** Description : handlers for web service calls
*********************************************************************/
#define ERR_FUNCTION "ws_handler"
#define ERR_CLEANUP DYNTAB_FREE(id_form); \
					DYNTAB_FREE(id_obj)
int ws_handler(					/* return : 0 on success, other on error */
	EVA_context* cntxt			/* in/out : execution context data */
) {
	DynTable id_form = { 0 };
	DynTable id_obj = { 0 };
	unsigned long i, i_ctrl, id_ctrl, i_cgi;
	char *srchval;
	EVA_ctrl *ctrl;
	ObjTableFormat* tbl;
	DynBuffer **html;
	int b_search;

	/* Search cgi input with name in first cgi input value */
	CGIData* cgi;
	char *cginame = cntxt->cgi ? cntxt->cgi->value : NULL;
	if (!cginame) RETURN_ERROR("No value in first cgi", {});
	for(i_cgi = 2; i_cgi < cntxt->nb_cgi && strcmp(cginame, cntxt->cgi[i_cgi].name ? cntxt->cgi[i_cgi].name : ""); i_cgi++);
	if(i_cgi >= cntxt->nb_cgi) RETURN_ERROR("Selected name not in CGI data", {});
	cgi = cntxt->cgi + i_cgi;
	cntxt->cgibtn = i_cgi;
	if (!cgi->IdForm || !cgi->IdCtrl) RETURN_ERROR("No selected form or control", {});

	/* Read control, form & object ids in CGI data */
	id_ctrl = cgi->IdCtrl;
	cntxt->log_clkbtn = id_ctrl;
	cntxt->log_clkform = cgi->IdForm;
	if (cgi->IdObj) DYNTAB_ADD_INT(&id_obj, 0, 0, cgi->IdObj);
	DYNTAB_ADD_INT(&id_form, 0, 0, cgi->IdForm);
	srchval = cgi->value;

	/* Load user data */
	DYNTAB_FIELD(&cntxt->imgpath, &cntxt->user_data, IMGPATH);
	DYNTAB_FIELD(&cntxt->user_groups, &cntxt->user_data, USERGROUP);

	/* Load form holding the button clicked & find button control index */
	if (form_load(cntxt, &id_form, &id_obj, 0)) STACK_ERROR;
	if (!cntxt->form) RETURN_ERROR("Form not loaded", {});
	if (!cntxt->form->ctrl->access) RETURN_ERROR("Access not granted", {});

	/* Get control index */
	for(i_ctrl = 1; i_ctrl < cntxt->form->nb_ctrl && DYNTAB_TOUL(&cntxt->form->ctrl[i_ctrl].id) != id_ctrl; i_ctrl++);
	if (i_ctrl >= cntxt->form->nb_ctrl) RETURN_ERROR("Selected control not in form", {});
	ctrl = cntxt->form->ctrl + i_ctrl;
	if (!ctrl->access) RETURN_ERROR("Access not granted", {});


	/* Read displayed objects data */
	cntxt->form->html = &cntxt->form->html_top;
	cntxt->form->step = HtmlEdit;
	if (table_read_controls(cntxt, i_ctrl, NULL)) STACK_ERROR;
	tbl = ctrl->objtbl;
	if (!tbl) RETURN_ERROR("Selected control has no table", {});
	b_search = tbl->status & TblCtrl_opensearch;
	tbl->input = srchval;
	if(b_search && (table_word_search(cntxt, i_ctrl) || table_sort_obj_list(cntxt, i_ctrl, 0))) STACK_ERROR;
	if(table_read_obj_list(cntxt, i_ctrl, !b_search)) STACK_ERROR;

	/* Prepare list data */
	DYNBUF_ADD_STR(&ctrl->json, "[");
	if(table_put_rows(cntxt, i_ctrl)) STACK_ERROR;

	/* Output list global data */
	html = &cntxt->html;
	cntxt->form->html = html;
	DYNBUF_ADD3_BUF(html, ",\"name\":\"", ctrl->cginame, NO_CONV, "\"");
	DYNBUF_ADD3_INT(html, ",\"idCtrl\":", id_ctrl, "");
	DYNBUF_ADD3_INT(html, ",\"idForm\":", DYNTAB_TOUL(&id_form), "");
	DYNBUF_ADD3_INT(html, ",\"idObj\":", DYNTAB_TOUL(&id_obj), "");
	DYNBUF_ADD3_INT(html, ",\"totObj\":", tbl->totlines, "");
	DYNBUF_ADD3_INT(html, ",\"pageStart\":", tbl->line, "");
	DYNBUF_ADD3_INT(html, ",\"pageLen\":", tbl->lines, "");

	/* Output list fields */
	DYNBUF_ADD_STR(html, ",\"colDef\": [");
	for(i = 0; i < tbl->field.nbrows; i++) {
		if(i) DYNBUF_ADD_STR(html, ",");
		DYNBUF_ADD_STR(html, "{");
		if(JSON_ADD_TBL(label, 0) ||
			JSON_ADD_TBL(field, 1) ||
			JSON_ADD_TBL(format, 1) ||
			JSON_ADD_TBL(fontsize, 1) ||
			JSON_ADD_TBL(align, 1) ||
			JSON_ADD_TBL(bold, 3) ||
			JSON_ADD_TBL(underline, 3) ||
			JSON_ADD_TBL(fontsize, 1) ||
			JSON_ADD_TBL(lblstyle, 1) ||
			JSON_ADD_TBL(celstyle, 1) ||
			JSON_ADD_TBL(notes, 1) ||
			JSON_ADD_TBL(lblunit, 1)) STACK_ERROR;
		DYNBUF_ADD_STR(html, "}");
	}
	DYNBUF_ADD_STR(html, "]");

	/* Output list data */
	DYNBUF_ADD3_BUF(html, ",\"rowsList\":", ctrl->json, NO_CONV, "]");

	RETURN_OK_CLEANUP;
}
#undef ERR_FUNCTION
#undef ERR_CLEANUP

/*********************************************************************
** Function : json_result
** Description : handlers for web service calls with JSON result
*********************************************************************/
void json_result(				/* return : 0 on success, other on error */
	EVA_context *cntxt			/* in/out : execution context data */
) {
	/* Prepare context for web service call with CGI input & URL params */
	char *errmsg = NULL;
	int err = cgi_init_call(cntxt) ? 1 : ckeck_session_validity(cntxt, &errmsg) ? 2 : errmsg ? 3 : set_user_identification(cntxt) ? 4 : ws_handler(cntxt) ? 5 : 0;
	char* errtxt = err == 1 ? "Query init" : err == 2 ? "User access" : err == 3 ? errmsg : err == 4 ? "Set user" : err == 5 ? "Query handler" : "Warning";

	/* Output header of JSON response */
	cntxt->txsize += printf("Content-Type:application/json; charset=iso-8859-1\r\n\n");

	/* Output start of JSON response : errCode */
	cntxt->txsize += printf("{\"errCode\":%i", err);

	/* Output error message if present */
	if(err || cntxt->err.text)
	{
		cntxt->txsize += printf(",\"errMsg\":\"%s - %s : %s\",\"errDetail\":\"%s\"", cntxt->ws_query ? cntxt->ws_query : "NoQuery", errtxt,
			cntxt->err.text ? cntxt->err.text : "warning",
			cntxt->err.detail ? cntxt->err.detail->data : "");
		if (cntxt->html1) cntxt->txsize += printf("%s", cntxt->html1->data);
	}

	/* Output request response data if no error */
	else if (cntxt->html) cntxt->txsize += printf("%s", cntxt->html->data);

	/* Output extra infos attributes : procTime, version, referer */
	cntxt->txsize += printf(",\n\"procTime\":%d", ms_since(&cntxt->tm0));
	cntxt->txsize += printf(",\"version\":\"%s - " __DATE__ "\"", EVA_VERSION);

	/* Output end of JSON response */
	cntxt->txsize += printf("}");
}
