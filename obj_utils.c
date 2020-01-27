/*********************************************************************
**        File : obj_utils.c
** Description : misceleanous functions for handling objects
**      Author : Alain BOUTE
**     Created : Jan 26 2003
**
*********************************************************************/

#include "eva.h"


/*********************************************************************
** Function : obj_check_user_access
** Description : get access status of an object for the identified user
*********************************************************************/
#define ERR_FUNCTION "obj_check_user_access"
#define ERR_CLEANUP DYNTAB_FREE(access); \
					DYNTAB_FREE(objgroup); \
					DYNTAB_FREE(usergroup)
int obj_check_user_access(			/* return : 0 on success, other on error */
	EVA_context *cntxt,				/* in/out : execution context data */
	DynTable *data,					/* in : object data */
	unsigned long beg,				/* in : 1st row to use in data */
	int *acc						/* out : access rights */
){
	DynTable access = { 0 };
	DynTable objgroup = { 0 };
	DynTable usergroup = { 0 };
	unsigned long i, j;

	/* Return access grant if no restrictions */
	DYNTAB_FIELD_TABBEG(&usergroup, data, beg, USER_GRANT);
	DYNTAB_FIELD_TABBEG(&objgroup, data, beg, GROUP_GRANT);
	if(!usergroup.nbrows && !objgroup.nbrows)
	{
		*acc = AccessView | AccessEdit;
		RETURN_OK;
	}

	/*  Select access on user */
	for(i = 0; i < usergroup.nbrows && dyntab_cmp(&usergroup, i, 0, &cntxt->id_user, 0, 0); i++);
	if(i < usergroup.nbrows)
	{
		DYNTAB_FIELD_TABBEG(&access, data, beg, USER_ACCES);
		ctrl_parse_access(acc, dyntab_val(&access, i, 0), "", "");
		RETURN_OK;
	}

	/*  Select access on user groups */
	DYNTAB_FIELD(&usergroup, &cntxt->user_data, USERGROUP);
	for(i = 0; i < objgroup.nbrows; i++)
	{
		for(j = 0; j < usergroup.nbrows && dyntab_cmp(&usergroup, j, 0, &objgroup, i, 0); j++);
		if(j < usergroup.nbrows)
		{
			DYNTAB_FIELD_TABBEG(&access, data, beg, GROUP_ACCES);
			ctrl_parse_access(acc, dyntab_val(&access, i, 0), "", "");
			RETURN_OK;
		}
	}

	*acc = AccessNone;
	RETURN_OK_CLEANUP;
}
#undef ERR_FUNCTION
#undef ERR_CLEANUP

/*********************************************************************
** Function : obj_put_html_btn_label
** Description : output open button(s) & label for an object
*********************************************************************/
#define ERR_FUNCTION "obj_put_html_btn_label"
#define ERR_CLEANUP	DYNTAB_FREE(objdata)
int obj_put_html_btn_label(			/* return : 0 if Ok, other on error */
	EVA_context *cntxt,				/* in : execution context data */
	DynTable *id_obj				/* in : object Id in (0,0) */
){
	DynTable objdata = { 0 };
	CHECK_HTML_STATUS;

	DYNBUF_ADD_STR(html,
		"<table cellspacing=0 cellpadding=0 border=0 rules=none><tr>");
	if(qry_obj_data(cntxt, &objdata, id_obj, NULL) ||
		ctrl_add_symbol_btn(cntxt, NULL, NULL, NULL, &objdata, 0,
					add_sz_str("Cliquez pour ouvrir la fiche"), "", "SYMBOL+LABEL+OBJNOTES"))
		STACK_ERROR;
	DYNBUF_ADD_STR(html,
		"</tr></table>");

	RETURN_OK_CLEANUP;
}
#undef ERR_FUNCTION
#undef ERR_CLEANUP

