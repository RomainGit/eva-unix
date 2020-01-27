/*********************************************************************
**        File : form_io.c
** Description : form load & save functions
**      Author : Alain BOUTE
**     Created : Apr 8 2002
*********************************************************************/

#include "eva.h"

/*********************************************************************
** Function : form_load
** Description : load a form in cntxt->form
*********************************************************************/
#define ERR_FUNCTION "form_load"
#define ERR_CLEANUP if(cntxt->err.text) form_free(cntxt); \
					DYNTAB_FREE(ctrltree)
int form_load(
	EVA_context *cntxt,				/* in/out : execution context data */
	DynTable *id_form,				/* in : form object id */		
	DynTable *id_obj				/* in : current object id loaded in form */		
){
	EVA_form *form = NULL;
 	EVA_ctrl *ctrl;
	DynTable ctrltree = { 0 };
	unsigned long idobj = DYNTAB_TOUL(id_obj);
	int b_noacc = 0;

	/* Alloc & intialize form structure */
	M_ALLOC(form, sizeof(EVA_form));
	DYNTAB_ADD_CELL(&form->id_form, 0, 0, id_form, 0, 0);
	form_free(cntxt);
	cntxt->form = form;

	/* Store object id if not null */
	if(idobj) DYNTAB_ADD_CELL(&form->id_obj, 0, 0, id_obj, 0, 0);
	form->b_newobj = idobj == 0;

	/* Read current object data if object exists */
	if(idobj && qry_obj_data(cntxt, &form->objdata, &form->id_obj, NULL)) STACK_ERROR;

	/* Create new control for form */
	form->step = CtrlRead;
	if(ctrl_add_new(cntxt, 0, NULL, NULL)) STACK_ERROR;

	/* Set form params : cginame, previous context, access */
	ctrl = form->ctrl;
	if(cgi_build_basename(cntxt, &ctrl->cginame, 0, 'F') ||
		cgi_get_values(cntxt, &ctrl->cgival, form->ctrl->cginame->data, 0))	STACK_ERROR;
	if(dyntab_from_list(&ctrltree, DYNTAB_VAL_SZ(&ctrl->cgival, 0, 0), "§", 0, 4)) RETURN_ERR_MEMORY;
	if(dyntab_sz(&ctrltree, 0, 0)) DYNTAB_ADD_CELL(&form->seltab, 0, 0, &ctrltree, 0, 0);
	if(dyntab_sz(&ctrltree, 1, 0)) DYNTAB_ADD_CELL(&form->call_data, 0, 0, &ctrltree, 1, 0);
	form->prevstep = atoi(dyntab_val(&ctrltree, 3, 0));
	if(dyntab_sz(&ctrltree, 4, 0)) DYNTAB_ADD_CELL(&form->dlg_ctrl, 0, 0, &ctrltree, 4, 0);

	/* Handle save as form */
	form->id_formsave = strtoul(CTRL_ATTR_VAL(FORMSAVEAS), NULL, 10);
	if(!form->id_formsave) form->id_formsave = DYNTAB_TOUL(&form->id_form);

	/* Determine output mode */
	if(ctrl_check_access(cntxt, form->ctrl)) STACK_ERROR;
	form->nextstep = form->prevstep > HtmlSaveDlg ? form->prevstep :
				(dyntab_field_cell(&cntxt->user_data, "_EVA_OPEN_MODE_EDIT", 0, 1, 0) || !idobj) ? 
					HtmlEdit : HtmlView;
	if(!form->b_newobj)
	{
		form->step = form->nextstep;
		if(ctrl_check_access(cntxt, form->ctrl)) STACK_ERROR;
	}
	form->step = CtrlRead;

	/* Check if user has access rights to the form */
	b_noacc = (idobj ? ctrl->access & (AccessEdit | AccessView) :
					(!*CTRL_ATTR_VAL(DISPLAYFIELDS) && (ctrl->access & AccessView) ||
						(ctrl->access & AccessCreate))) ? 0 : 1;
	if(!b_noacc)
	{
		/* Set View mode if no edit access */
		if(dyntab_sz(&form->id_obj, 0, 0) && form->nextstep == HtmlEdit && !(ctrl->access & AccessEdit))
			form->nextstep = HtmlView;

		/* Read form controls */
		CTRL_OPTIONAL(ctrltree, CTRLTREE);
		if(ctrl_add_child(cntxt, 0, &ctrltree)) STACK_ERROR;
		ctrl = form->ctrl;
		if(idobj)
		{
			form->step = HtmlView;
			if(ctrl_check_access(cntxt, ctrl)) STACK_ERROR;
			b_noacc = (idobj ? ctrl->access & (AccessEdit | AccessView) : ctrl->access & AccessCreate) ? 0 : 2;
			form->step = CtrlRead;
		}
	}
	else if(dyntab_cmp(id_form, 0, 0, &cntxt->menubar, 0, 0))
	{
		/* Output error message */
		form->html = &form->html_top;
		DYNBUF_ADD_STR(form->html, 
			"<td align=center>"
			"<font size=+1><b><br><br>Accès non autorisé<br><br></b></font>");
		if(idobj)
 			DYNBUF_ADD_STR(form->html, "L'accès à cette fiche ")
		else if(*CTRL_ATTR_VAL(DISPLAYFIELDS))
 			DYNBUF_ADD_STR(form->html, "L'ajout de fiches")
		else
 			DYNBUF_ADD_STR(form->html, "L'accès au formulaire");
		DYNBUF_ADD3(form->html, " [", ctrl->LABEL, 0, TO_HTML, 
			"] vous est interdit<br><br>"
			"Contactez votre administateur si vous avez besoin de cet accès");

		DYNBUF_ADD_STR(form->html, 
			"<br><br><input type=image src='../img/_eva_btn_gobackobj_fr.gif' name='B$#.CLOSE'><br><br></td>");
	}

	/* Add extra control for further processing */
	form->sz_ctrl = form->nb_ctrl;
	M_REALLOC(EVA_ctrl, form->ctrl, form->sz_ctrl);

	RETURN_OK_CLEANUP;
}
#undef ERR_FUNCTION
#undef ERR_CLEANUP

/*********************************************************************
** Function : form_load_from_ctrl
** Description : open form & object and memorize caller data
*********************************************************************/
#define ERR_FUNCTION "form_load_from_ctrl"
#define ERR_CLEANUP DYNTAB_FREE(idform); \
					DYNTAB_FREE(sqlres); \
					M_FREE(call_data)

int form_load_from_ctrl(			/* return : 0 on success, other on error */
	EVA_context *cntxt,				/* in/out : execution context data */
	DynTable *id_form,				/* in : form object id */		
	DynTable *id_obj,				/* in : current object id loaded in form */		
	int loc,						/* in : where to place new form
											0 : same as caller
											1 : top
											2 : bottom (alt form) */
	unsigned long i_ctrl			/* in : caller control index in form->ctrl 
											add caller data if not 0 */
){
	EVA_form *form = cntxt->form;
	EVA_ctrl *ctrl = form ? form->ctrl + i_ctrl : NULL;
	DynTable idform = { 0 };
	DynTable sqlres = { 0 };
	DynBuffer *call_data = NULL;

	/* Check params */
	if(!dyntab_sz(id_form, 0, 0) && !dyntab_sz(id_obj, 0, 0)) RETURN_OK;

	/* Set placement if same as caller */
	if(!loc) loc = (!form || !dyntab_sz(&cntxt->id_form, 0, 0) || 
		!dyntab_cmp(&cntxt->id_obj, 0, 0, &form->id_obj, 0, 0) && 
		!dyntab_cmp(&cntxt->id_form, 0, 0, &form->id_form, 0, 0)) ? 1 : 2;

	/* If no form given */
	if(!dyntab_sz(id_form, 0, 0))
	{
		char sql[128];

		/* Read object formstamp */
		sprintf(sql, 
			"-- form_load_from_ctrl : Read object formstamp \n"
			"SELECT IdRelObj FROM TLink WHERE DateDel Is NULL AND IdField=1 AND IdObj=%d", 
						atoi(dyntab_val(id_obj, 0, 0)));
		if(sql_exec_query(cntxt, sql) || sql_get_table(cntxt, &sqlres, 2)) STACK_ERROR;
		DYNTAB_ADD_CELL(&idform, 0, 0, &sqlres, 0, 0);
	}
	else DYNTAB_ADD_CELL(&idform, 0, 0, id_form, 0, 0);

	/* If form is empty : return */
	if(!dyntab_sz(&idform, 0, 0)) RETURN_OK;

	/* Memorise caller data if given : id_form/id_obj/id_ctrl/Num.Line  */
	if(form && i_ctrl < form->nb_ctrl)
	{
		CGIData *cgi = cntxt->cgi + cntxt->cgibtn;
		DYNBUF_ADD_CELL(&call_data, &form->id_form, 0, 0, NO_CONV);
		DYNBUF_ADD3_CELL(&call_data, "/", &form->id_obj, 0, 0, NO_CONV, "/");
		if(i_ctrl < form->nb_ctrl)
		{
			DYNBUF_ADD_CELL(&call_data, &ctrl->id, 0, 0, NO_CONV);
			if(cgi->IdCtrl == DYNTAB_TOUL(&ctrl->id))
			{
				DYNBUF_ADD3_INT(&call_data, "/", cntxt->cgi[cntxt->cgibtn].Num, "");
				DYNBUF_ADD3_INT(&call_data, ".", cntxt->cgi[cntxt->cgibtn].Line, "");
			}
		}
	}

	/* Set next opened form & obj */
	DYNTAB_ADD_CELL(loc == 2 ?  &cntxt->alt_form: &cntxt->id_form, 0, 0, &idform, 0, 0);
	DYNTAB_ADD_CELL(loc == 2 ? &cntxt->alt_obj : &cntxt->id_obj, 0, 0, id_obj, 0, 0);

	/* Load new form, abort dialog if any & set caller data */
	if(form_load(cntxt, &idform, id_obj)) STACK_ERROR;
	DYNTAB_FREE(cntxt->form->dlg_ctrl);
	if(call_data && !cntxt->form->call_data.nbrows)
		DYNTAB_ADD_BUF(&cntxt->form->call_data, 0, 0, call_data);
	
	RETURN_OK_CLEANUP;
}
#undef ERR_FUNCTION
#undef ERR_CLEANUP

/*********************************************************************
** Function : form_close_nosave
** Description : close the given form & obj without saving
*********************************************************************/
#define ERR_FUNCTION "form_close_nosave"
#define ERR_CLEANUP	DYNTAB_FREE(id_obj); \
					DYNTAB_FREE(id_form); \
					DYNTAB_FREE(id_ctrl); \
					DYNTAB_FREE(call_data1); \
					DYNTAB_FREE(field); \
					M_FREE(name)
int form_close_nosave(				/* return : 0 on success, other on error */
	EVA_context *cntxt,				/* in : execution context field */
	unsigned long idform,			/* in : form id to search for close  */
	unsigned long idobj,			/* in : object id to search for close */
	DynTable *call_data				/* in : caller data for form close */
){
	DynTable id_obj = { 0 };
	DynTable id_form = { 0 };
	DynTable id_ctrl = { 0 };
	DynTable call_data1 = { 0 };
	DynTable field = { 0 };
	DynBuffer *name = NULL;
	unsigned long idobj0 = DYNTAB_TOUL(&cntxt->id_obj);
	unsigned long idform0 = DYNTAB_TOUL(&cntxt->id_form);
	unsigned long idobj1 = DYNTAB_TOUL(&cntxt->alt_obj);
	unsigned long idform1 = DYNTAB_TOUL(&cntxt->alt_form);
	unsigned long homepage = DYNTAB_TOUL(&cntxt->homepage);
	unsigned long menubar = DYNTAB_TOUL(&cntxt->menubar);
	int b_alt = idform1 == idform && idobj1 == idobj;
	DynTable *dest_form = b_alt ? &cntxt->alt_form : &cntxt->id_form;
	DynTable *dest_obj = b_alt ? &cntxt->alt_obj : &cntxt->id_obj;
	unsigned long i;

	/* Clear current form position */
	dyntab_free(dest_form);
	dyntab_free(dest_obj);

	/* If no caller field given */
	if(!call_data)
	{
		/* Search for form field in CGI input */
		for(i = 0; i < cntxt->nb_cgi && !(cntxt->cgi[i].name[0] == 'F' &&
					cntxt->cgi[i].IdObj == idobj && cntxt->cgi[i].IdForm == idform); i++);
		if(i < cntxt->nb_cgi)
		{
			call_data = &call_data1;
			if(cgi_extract(cntxt, cntxt->cgi[i].value, '§', &id_form, call_data, NULL))
				STACK_ERROR;
		}
	}

	/* Parse caller field */
	if(cgi_extract(cntxt, dyntab_val(call_data, 0, 0), '/', &id_form, &id_obj, &id_ctrl, &field, NULL))
		STACK_ERROR;

	/* If caller field available */
	if(dyntab_sz(&id_form, 0, 0))
	{
		unsigned long idobj2 = DYNTAB_TOUL(&id_obj);
		unsigned long idform2 = DYNTAB_TOUL(&id_form);

		/* Put caller form & obj in destination location */
		DYNTAB_ADD_CELL(dest_form, 0, 0, &id_form, 0, 0);
		dyntab_free(dest_obj);
		if(dyntab_sz(&id_obj, 0, 0)) DYNTAB_ADD_CELL(dest_obj, 0, 0, &id_obj, 0, 0);

		/* Clear form position if home page or menubar or already in page */
		if(idform2 == homepage) form_set_homepage(cntxt);
		else if(idform2 == menubar ||
			(idform2 == idform0 && idobj2 == idobj0) ||
			(idform2 == idform1 && idobj2 == idobj1))
		{
			dyntab_free(dest_form);
			dyntab_free(dest_obj);
		}
	}

	/* If main form closed : place alt form as top form */
	if(!dyntab_cmp(&cntxt->alt_obj, 0, 0, &cntxt->id_obj, 0, 0) &&
		!dyntab_cmp(&cntxt->alt_form, 0, 0, &cntxt->id_form, 0, 0))
	{
		DYNTAB_FREE(cntxt->alt_form);
		DYNTAB_FREE(cntxt->alt_obj);
	}
	if(!dyntab_sz(&cntxt->id_form, 0, 0) && dyntab_sz(&cntxt->alt_form, 0, 0))
	{
		DYNTAB_FREE(cntxt->id_obj);
		DYNTAB_ADD_CELL(&cntxt->id_form, 0, 0, &cntxt->alt_form, 0, 0);
		if(dyntab_sz(&cntxt->alt_obj, 0, 0)) DYNTAB_ADD_CELL(&cntxt->id_obj, 0, 0, &cntxt->alt_obj, 0, 0);
		DYNTAB_FREE(cntxt->alt_form);
		DYNTAB_FREE(cntxt->alt_obj);
	}

	/* Clear form data in CGI inputs */
	if(cgi_clear_form_inputs(cntxt, idform, idobj, 0)) STACK_ERROR;

	/* If no form to display */
	if(!dyntab_sz(&cntxt->id_form, 0, 0))
	{
		/* Look for next opened form in CGI inputs */
		unsigned long i = 0;
		if(cntxt->nb_cgi) for(i = cntxt->nb_cgi - 1; i > 0; i--)
			if(cntxt->cgi[i].name[0] == 'F' &&
				cntxt->cgi[i].IdForm != homepage &&
				cntxt->cgi[i].IdForm != menubar)
				break;
		if(i)
		{
			DYNTAB_ADD_INT(&cntxt->id_form, 0, 0, cntxt->cgi[i].IdForm);
			DYNTAB_FREE(cntxt->id_obj);
			if(cntxt->cgi[i].IdObj) DYNTAB_ADD_INT(&cntxt->id_obj, 0, 0, cntxt->cgi[i].IdObj);
		}				   
	}
	
	RETURN_OK_CLEANUP;
}
#undef ERR_FUNCTION
#undef ERR_CLEANUP

/*********************************************************************
** Function : form_output
** Description : output the loaded form in cntxt->html or cntxt->html1
*********************************************************************/
#define ERR_FUNCTION "form_output"
#define ERR_CLEANUP DYNTAB_FREE(ctrltree)
int form_output(					/* return : 0 on success, other on error */
	EVA_context *cntxt				/* in/out : execution context data */
){
	EVA_form *form = cntxt->form;
	DynTable ctrltree = { 0 };
	int b_alt = form && 
				!dyntab_cmp(&cntxt->alt_form, 0, 0, &form->id_form, 0, 0) &&
				!dyntab_cmp(&cntxt->alt_obj, 0, 0, &form->id_obj, 0, 0);
	DynTable *id_form = b_alt ? &cntxt->alt_form : &cntxt->id_form;
	DynTable *id_obj = b_alt ? &cntxt->alt_obj : &cntxt->id_obj;
	int b_done = 0;
	if(!form) RETURN_OK;

	/* If dialog mode not processed : call control action handler */
	if(!form->html && dyntab_sz(&form->dlg_ctrl, 0, 0))
	{
		unsigned long i = ctrl_from_cginame(cntxt, DYNTAB_VAL_SZ(&form->dlg_ctrl, 0, 0));
		if(i) 
		{
			CTRL_ACT_HDLR(i);
		}
		else
			if(form_save_dialog(cntxt, 0, "_EVA_CONFIRMCHANGE", BUTN_CLOSE | BUTN_SAVE_CLOSE, &b_done)) STACK_ERROR;
		if(!cntxt->form) RETURN_OK;
	}

	/* Reload form if applicable */
	if(form->b_reload)
	{
		EVA_execmode nextstep = form->nextstep;
		if(form_load(cntxt, id_form, id_obj)) STACK_ERROR;
		form = cntxt->form;
		form->nextstep = nextstep;
	}

	/* If no output prepared : prepare form HTML output */
	if(!form->html)
	{
		/* Set display mode */
		if(form->nextstep < HtmlSaveDlg || form->nextstep > FormValues)
			form->nextstep = HtmlView;
		else if(dyntab_sz(&form->id_obj, 0, 0) &&
				form->nextstep == HtmlEdit &&
				!(form->ctrl->access & AccessEdit))
			form->nextstep = HtmlView;

		/* Prepare form buffers */
		ATTR_OPTIONAL(ctrltree, CTRLTREE, form->ctrl);
		form_free_html(cntxt);
		switch(form->nextstep)
		{
		case HtmlEdit:
			/* Check input if edit mode */
			form->step = InputCheck;
			if(ctrl_add_child(cntxt, 0, &ctrltree)) STACK_ERROR;
			
		default:
			form->step = form->nextstep;
			form->html = &form->html_top;
			if(ctrl_add_child(cntxt, 0, &ctrltree)) STACK_ERROR;
		}
	}

	/* Output form */
	if(cntxt->form && form_put_html(cntxt)) STACK_ERROR;

	/* Switch to alt buffer if form displayed in bottom position */
	if(b_alt)
	{
		M_FREE(cntxt->html1);
		cntxt->html1 = cntxt->html;
		cntxt->html = NULL;
	}
	form_free(cntxt);

	RETURN_OK_CLEANUP;
}
#undef ERR_FUNCTION
#undef ERR_CLEANUP
