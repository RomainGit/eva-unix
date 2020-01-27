/*********************************************************************
**        File : action_update.c
** Description : handling fonctions for update actions
**      Author : Alain BOUTE
**     Created : July 1 2003
*********************************************************************/

#include "eva.h"


/*********************************************************************
** Function : action_update
** Description : button click handler for UPDATE
*********************************************************************/
#define ERR_FUNCTION "action_update"
#define ERR_CLEANUP	DYNTAB_FREE(destfield); \
					DYNTAB_FREE(srctype); \
					DYNTAB_FREE(srcvalobj); \
					DYNTAB_FREE(srcval); \
					DYNTAB_FREE(setmode); \
					DYNTAB_FREE(values); \
					DYNTAB_FREE(updobj); \
					DYNTAB_FREE(updfield); \
					DYNTAB_FREE(listobj); \
					DYNTAB_FREE(tmpval)
int action_update(					/* return : 0 on success, other on error */
	EVA_context *cntxt,				/* in/out : execution context data */
	unsigned long i_ctrl			/* in : control index in cntxt->form->ctrl */
){
	EVA_form *form = cntxt->form;
	EVA_ctrl *ctrl = form->ctrl + i_ctrl;
	DynTable destfield = { 0 };
	DynTable srctype = { 0 };
	DynTable srcvalobj = { 0 };
	DynTable srcval = { 0 };
	DynTable setmode = { 0 };
	DynTable values = { 0 };
	DynTable updobj = { 0 };
	DynTable updfield = { 0 };
	DynTable listobj = { 0 };
	DynTable tmpval = { 0 };
	unsigned long i, j;
	char *confirm = CTRL_ATTR_VAL(CONFIRM);
	int b_savetodb = *confirm && strcmp(confirm, "_EVA_NOSAVE");
	unsigned long curobj = DYNTAB_TOUL(&cntxt->form->id_obj);
	char *updobjtyp = CTRL_ATTR_VAL(UPDATE);
	if(!*updobjtyp) updobjtyp = "_EVA_CURRENTOBJ";

	/* Handle save before */
	if(b_savetodb)
	{
		int b_done = BUTN_SAVE_NEXT;
		if(form_save_dialog(cntxt, i_ctrl, confirm, BUTN_SAVE_NEXT, &b_done)) STACK_ERROR;
		if(b_done != BUTN_SAVE_NEXT) RETURN_OK;
		form = cntxt->form;
		ctrl = form->ctrl + i_ctrl;
	}

	/* Read list of objects to uppdate */
	if(strcmp(updobjtyp, "_EVA_CURRENTOBJ") || curobj)
	{
		CTRL_OPTIONAL(listobj, LISTOBJ);
		CTRL_OPTIONAL(updfield, UPDATE_OBJFIELD);
		if(form_eval_valtype(cntxt, &updobj, updobjtyp, &listobj, &updfield)) STACK_ERROR;
	}
	else DYNTAB_ADD_STR(&updobj, 0, 0, "0");

	/* Read update parameters */
	CTRL_READ_ATTR_TAB(destfield, DESTFIELD);
	CTRL_READ_ATTR_TAB(srctype, SRCTYPE);
	CTRL_READ_ATTR_TAB(srcvalobj, SRCLISTOBJ);
	CTRL_READ_ATTR_TAB(srcval, SRCFIELD);
	CTRL_READ_ATTR_TAB(setmode, SET_MODE);

	/* For each destination field */
	for(i = 0; i < destfield.nbrows; i++)
	{
		/* Read source value / expression  for this destination field */
		unsigned long idfield = dyntab_cell(&destfield, i, 0)->IdValue;
		char *mode = dyntab_val(&setmode, i, 0);
		DYNTAB_SET_CELL(&values, 0, 0, &srcval, i, 0);
		for(j = 0; j < srcvalobj.nbcols; j++)
			if(dyntab_sz(&srcvalobj, i, j))
				DYNTAB_SET_CELL(&listobj, listobj.nbrows, 0, &srcvalobj, i, j);
		
		/* Evaluate source expression on source object */
		if(form_eval_valtype(cntxt, &tmpval, dyntab_val(&srctype, i, 0), &srcvalobj, &values)) CLEAR_ERROR_CONT;

		/* For each object to update */
		if(tmpval.nbrows) for(j = 0; j < updobj.nbrows; j++)
		{
			unsigned long idobj = DYNTAB_TOULRC(&updobj, j, 0);

			/* If object was saved or is not current object */
			if(b_savetodb || idobj != curobj)
			{
				/* Update data base */
				if(qry_update_idobj_idfield(cntxt, idobj, idfield, &tmpval,
						!strcmp("_EVA_REPLACE", mode) ? 3 : !strcmp("_EVA_ADD", mode) ? 0 :1))
					STACK_ERROR;
			}
			else 
				/* Update CGI data */
				if(cgi_set_field_values(cntxt,
						DYNTAB_TOUL(&cntxt->form->id_form), idobj,
						DYNTAB_VAL_SZ(&destfield, i, 0), 
						&tmpval, mode, 0))
					CLEAR_ERROR;
		}
	}

	form->b_reload = 1;
	if(!b_savetodb) form->nextstep = HtmlEdit;

	RETURN_OK_CLEANUP;
}
#undef ERR_FUNCTION
#undef ERR_CLEANUP
