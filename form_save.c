/*********************************************************************
** File : form_save.c
** Description : forms save & close functions
** Author : Alain BOUTE
** Created : Jan 11 2003
*********************************************************************/

#include "eva.h"


/*********************************************************************
** Function : form_btn_do_save
** Description : handles form data save before & after button clicks
*********************************************************************/
#define ERR_FUNCTION "form_btn_do_save"
#define ERR_CLEANUP	
int form_btn_do_save(				/* return : 0 on success, other on error */
	EVA_context *cntxt,				/* in/out : execution context data */
	unsigned long i_ctrl,			/* in : button index in cntxt->form->ctrl */
	int *b_ok						/* out : 0 if not confirmed */
){
	EVA_form *form = cntxt->form;
	EVA_ctrl *ctrl = form->ctrl + i_ctrl;
	char *save = CTRL_ATTR_VAL(SAVE);
	char *confirm = CTRL_ATTR_VAL(CONFIRM);

	/* Save form data if applicable */
	if(*save)
	{
		int b_done = BUTN_SAVE_NEXT;
		if(form_save_dialog(cntxt, i_ctrl, confirm, BUTN_SAVE_NEXT, &b_done)) STACK_ERROR;
		if(b_ok) *b_ok = b_done == BUTN_SAVE_NEXT;
	}
	else if(b_ok) *b_ok = 1;

	RETURN_OK_CLEANUP;
}
#undef ERR_FUNCTION
#undef ERR_CLEANUP

/*********************************************************************
** Function : form_check_keys
** Description : check key duplicates for the current form
*********************************************************************/
#define ERR_FUNCTION "form_check_keys"
#define ERR_CLEANUP	DYNTAB_FREE(keyfields); \
					DYNTAB_FREE(keytype); \
					DYNTAB_FREE(keymsg); \
					DYNTAB_FREE(field); \
					DYNTAB_FREE(value); \
					DYNTAB_FREE(duplicates); \
					DYNTAB_FREE(data); \
					M_FREE(msg); \
					qry_build_free(&flt)
					
int form_check_keys(					/* return : 0 if Ok, other on error */
	EVA_context *cntxt					/* in : execution context data */
){
	EVA_form *form = cntxt->form;
	EVA_ctrl *ctrl = form->ctrl;
	DynTable keyfields = {0};
	DynTable keytype = {0};
	DynTable keymsg = {0};
	DynTable field = {0};
	DynTable value = {0};
	DynTable duplicates = {0};
	DynTable data = {0};
	DynBuffer *msg = {0};
	QryBuild flt = {0};
	unsigned long i, j, k;
	DynBuffer **html = form->html;
	form->html = &form->html_err;

	/* Read form key fields */
	CTRL_READ_ATTR_TAB(keyfields, KEY_FIELDS);
	CTRL_READ_ATTR_TAB(keytype, KEY_TYPE);
	CTRL_READ_ATTR_TAB(keymsg, KEY_MSG);

	/* For each key (group of fields on same line) */
	for(i = 0; i < keyfields.nbrows; i++)
	{
		/* Initialize filter with AND condition & not current object */
		int b_error;
		qry_build_free(&flt);
		dyntab_free(&field);
		M_FREE(msg);
		DYNTAB_ADD_TXTID(&field, 0, 0, "_EVA_FORMSTAMP", cntxt->val_FORMSTAMP);
		dyntab_free(&value);
		DYNTAB_ADD_CELL(&value, 0, 0, &form->id_form, 0, 0);
		if(qry_add_filter(cntxt, &flt, RelNone, &field, RelList, &value)) STACK_ERROR;

		/* Build query for each key field */
		for(j = 0; j < keyfields.nbcols; j++) if(dyntab_sz(&keyfields, i, j))
		{
			char *fld;
			MatchMode match = Like;

			/* Split fields - multiple fields of same type are allowed */
			dyntab_from_list(&field, DYNTAB_VAL_SZ(&keyfields, i, j), ",", 0, 2);
			fld = dyntab_val(&field, 0, 0);

			/* Check field type - search input control in form */
			for(k = 0; k < form->nb_ctrl && strcmp(fld, form->ctrl[k].FIELD); k++);

			/* Handle message for key */
			if(msg) DYNBUF_ADD_STR(&msg, ", ");
			DYNBUF_ADD(&msg, k < form->nb_ctrl ? ctrl[k].LABEL : dyntab_val(&keyfields, i, j), 0, NO_CONV);

			/* If control is a relation : use appropriate match mode */
			if(k < form->nb_ctrl && !strcmp(form->ctrl[k].TYPE, "_EVA_RELATION")) match = RelList;

			if(form_get_field_values(cntxt, &value, dyntab_val(&keyfields, i, j), DYNTAB_TOUL(&form->id_form), DYNTAB_TOUL(&form->id_obj)) ||
				qry_add_filter(cntxt, &flt, RelNone, &field, match, &value)) STACK_ERROR;
		}
		
		/* Exclude current object if not new */
		if(dyntab_sz(&form->id_obj, 0, 0))
			DYNBUF_ADD3_CELL(&flt.where, "TLink0.IdObj<>", &form->id_obj, 0, 0, NO_CONV, "");

		/* Handle message for keys */
		DYNTAB_ADD_BUF(&keymsg, i, 1, msg);

		/* Query for objects matching key filter & set error depending on result & error setting for key */
		if(qry_filter_objects(cntxt, &value, &flt)) STACK_ERROR;
		b_error = value.nbrows ? !strcmp(dyntab_val(&keytype, i, 0), "_EVA_KEY_WARN") ? 1 : 6 : 0;
		form->error |= b_error;

		/* Add found objects to duplicates list */
		for(j = 0; j < value.nbrows; j++) 
		{
			for(k = 0; k < duplicates.nbrows && dyntab_cmp(&duplicates, k, 0, &value, j, 0); k++);
			if(k == duplicates.nbrows)
			{
				DYNTAB_ADD_CELL(&duplicates, duplicates.nbrows, 0, &value, j, 0);
				dyntab_cell(&duplicates, k, 0)->row = i;
				dyntab_cell(&keyfields, i, 0)->col = b_error;
			}
		}
	}

	/* Output duplicates table if applicable */
	if(duplicates.nbrows)
	{
		/* Output table header */
		char printbuf[1024];
		unsigned long iprev = keyfields.nbrows;
		dynbuf_print3(form->html,
			"<table border=1 rules=rows cellspacing=0 cellpadding=5 width=100%% bgcolor=#DDDDDD>"
			"<tr><td><font size=+1 color=#%s><b>%s</b></font></td>"
			"<td colspan=2 align=center><u>%s</u></td></tr>",
			form->error & 4 ? "FF0000" : "FF8844",
			form->error & 4 ? "Erreur de doublons" : "Risque de doublons",
			form->error & 4 ?
				"La fiche que vous voulez enregistrer existe déjà" : 
				"La fiche que vous voulez enregistrer ressemble à une ou plusieurs fiches existantes"
			);
		
		/* Output duplicates by key line */
		for(i = 0; i < duplicates.nbrows && i < 5; i++)
		{
			/* Add start of line or object separator as applicable */
			DynTableCell *c = dyntab_cell(&duplicates, i, 0);
			char datecr[32] = {0};
			unsigned long idobj = DYNTAB_TOULRC(&duplicates, i, 0);
			dynbuf_print(form->html, "%s", c->row != iprev ? "<tr><td colspan=2>" : "<br>");

			/* Add object open button & creation infos */
			DYNBUF_ADD_STR(form->html, "<table border=0><tr>");
			if(qry_obj_idfield(cntxt, &data, idobj, 0) ||
				ctrl_add_symbol_btn(cntxt, ctrl, c, NULL, &data, 0, NULL, 0, "", "SYMBOL+LABEL+OBJNOTES"))
				STACK_ERROR;
			if(form_eval_fieldexpr(cntxt, &data, 0, idobj, add_sz_str("_EVA_FORMSTAMP.DateCr"), NULL, 0)) STACK_ERROR;
			datetxt_to_format(cntxt, datecr, dyntab_val(&data, 0, 0), "");
			if(*datecr)
			{
				if(form_eval_fieldexpr(cntxt, &data, 0, idobj, add_sz_str("_EVA_FORMSTAMP.IdWhoCr->_EVA_USERNAME"), NULL, 0)) STACK_ERROR;
				dynbuf_print2(form->html, "</td><td width=10></td><td><font size=-1><i>Fiche créée le %s par %s</i></font>",
								datecr, dyntab_val(&data, 0, 0));
			}
			DYNBUF_ADD_STR(form->html, "</tr></table>");

			/* Add end of line if applicable */
			iprev = c->row;
			c = dyntab_cell(&duplicates, i + 1, 0);
			if(!c || c->row != iprev)
			{
				dynbuf_print3(form->html, "</td><td><font size=-1>Doublons sur les champs <b><u>%s</u></b>%s%s</font></td></tr>", 
					dyntab_val(&keymsg, iprev, 1),
					dyntab_sz(&keymsg, iprev, 0) ? "<br><br>" : "",
					dyntab_val(&keymsg, iprev, 0));
			}
		}
		DYNBUF_ADD_STR(form->html, "</td></tr></table>");
	}
	form->html = html;

	RETURN_OK_CLEANUP;
}
#undef ERR_FUNCTION
#undef ERR_CLEANUP

/*********************************************************************
** Function : form_save
** Description : save current form data 
*********************************************************************/
#define ERR_FUNCTION "form_save"
#define ERR_CLEANUP	DYNTAB_FREE(id_obj); \
					DYNTAB_FREE(cgival)
int form_save(					/* return : 0 on success, other on error */
	EVA_context *cntxt			/* in/out : execution context data */
){
	EVA_form *form = cntxt->form;
	unsigned long idform = DYNTAB_TOUL(&cntxt->form->id_form);
	unsigned long idobj = DYNTAB_TOUL(&cntxt->form->id_obj);
	DynTable cgival = {0};
	DynTable id_obj = {0};

	/* Call handler in save mode for all controls & add form stamp */
	form->step = FormSave;
	if(ctrl_add_child(cntxt, 0, NULL)) STACK_ERROR;
	{
		char txt[32];
		if(qry_add_obj_field_val(cntxt, &form->id_obj, "_EVA_FORMSTAMP",
								txt, snprintf(add_sz_str(txt), "%lu", form->id_formsave), 1, 0)) STACK_ERROR;
	}
	idobj = DYNTAB_TOUL(&cntxt->form->id_obj);

	/* Handle new obj storage in caller : look for storage field */
	if(form->b_newobj)
	{
		/* Retrieve caller data */
		int b_alt = !dyntab_cmp(&cntxt->alt_form, 0, 0, &cntxt->form->id_form, 0, 0) &&
					DYNTAB_TOUL(&cntxt->alt_obj) == 0;
		unsigned long idobj0, idform0, idctrl, num = 0, line = 0;
		dyntab_from_list(&cgival, DYNTAB_VAL_SZ(&form->call_data, 0, 0), "/", 0, 6);
		idform0 = DYNTAB_TOULRC(&cgival, 0, 0);
		idobj0 = DYNTAB_TOULRC(&cgival, 1, 0);
		idctrl = DYNTAB_TOULRC(&cgival, 2, 0);
		sscanf(dyntab_val(&cgival, 3, 0), "%lu.%lu", &num, &line);

		/* Look for control type */
		if(qry_obj_field(cntxt, &cgival, idctrl, "_EVA_CONTROL")) STACK_ERROR;
		if(!strcmp(dyntab_val(&cgival, 0, 0), "_EVA_INPUT"))
		{
			/* Relation : add new value (for relations direct add function) */
			if(qry_obj_field(cntxt, &cgival, idctrl, "_EVA_FIELD")) STACK_ERROR;
		}
		else if(!strcmp(dyntab_val(&cgival, 0, 0), "_EVA_BUTTON"))
		{
			/* Button : look for storage field for new objects */
			if(qry_obj_field(cntxt, &cgival, idctrl, "_EVA_NEWOBJ_FIELD")) STACK_ERROR;
		}
		else
			dyntab_free(&cgival);

		/* Storage field found : add new value with object id */
		if(dyntab_sz(&cgival, 0, 0))
		{
			DynTableCell *c;
			DYNTAB_ADD_INT(&id_obj, 0, 0, idobj);
			c = dyntab_cell(&id_obj, 0, 0);
			c->Line = line;
			c->Num = num;
			if(cgi_set_field_values(cntxt, idform0, idobj0,
											DYNTAB_VAL_SZ(&cgival, 0, 0), &id_obj, NULL, 0))
				STACK_ERROR;
		}

		/* Update new object id in context (main form or alt) */
		DYNTAB_ADD_CELL(b_alt ? &cntxt->alt_obj : &cntxt->id_obj, 0, 0, &form->id_obj, 0, 0);
	}

	/* Clear CGI form inputs */
	if(cgi_clear_form_inputs(cntxt, idform, form->b_newobj ? 0 : idobj, form->b_newobj ? 0 : 1)) STACK_ERROR;
	form->b_reload = 1;

	RETURN_OK_CLEANUP;
}
#undef ERR_FUNCTION
#undef ERR_CLEANUP

/*********************************************************************
** Function : form_save_dialog_end
** Description : handle a Save / Restore / Cancel dialog 
*********************************************************************/
#define ERR_FUNCTION "form_save_dialog_end"
#define ERR_CLEANUP	M_FREE(buf)
int form_save_dialog_end(			/* return : 0 on success, other on error */
	EVA_context *cntxt,				/* in/out : execution context data */
	int actionbtn					/* in : clicked button */
){
	EVA_form *form = cntxt->form;
	unsigned long i;
	DynBuffer *buf = NULL;

	/* Process clicked buttton */
	switch(actionbtn)
	{
	case BUTN_CLOSE:
		/* Close form - return to previous */
		if(form_close_nosave(cntxt, DYNTAB_TOUL(&form->id_form), 
									DYNTAB_TOUL(&form->id_obj),
									&form->call_data))
			STACK_ERROR;
		form_free(cntxt);
		break;

	case BUTN_RESTORE:
		/* Clear all CGI form data & set form reload flag */
		if(cgi_clear_form_inputs(cntxt, DYNTAB_TOUL(&form->id_form), 
									DYNTAB_TOUL(&form->id_obj), 1)) STACK_ERROR;
		form->b_reload = 1;

	default:
		/* Restore edit mode */
		form->nextstep = form->prevstep < HtmlView ? HtmlEdit : form->prevstep;
		form->step = form->nextstep;
		dyntab_free(&form->dlg_ctrl);
		form_free_html(cntxt);

		/* Update form status in CGI data */
		for(i = 0; i < cntxt->nb_cgi && strcmp(form->ctrl->cginame->data, cntxt->cgi[i].name); i++);
		if(i < cntxt->nb_cgi)
		{
			CGIData *cgi = cntxt->cgi + i;
			if(form_status_data(cntxt, &buf)) STACK_ERROR;
			M_FREE(cgi->value);
			M_STRDUP(cgi->value, buf->data, buf->cnt);
			cgi->value_sz = buf->cnt;
		}
	}
	if(cntxt->cgi) cntxt->cgi[cntxt->cgibtn].name[0] = 0;

	RETURN_OK_CLEANUP;
}
#undef ERR_FUNCTION
#undef ERR_CLEANUP

/*********************************************************************
** Function : form_save_dialog_output
** Description : output Save / Restore / Cancel dialog 
*********************************************************************/
#define ERR_FUNCTION "form_save_dialog_output"
#define ERR_CLEANUP	M_FREE(name)
int form_save_dialog_output(		/* return : 0 on success, other on error */
	EVA_context *cntxt,				/* in/out : execution context data */
	unsigned long i_ctrl,			/* in : control index in cntxt->form->ctrl */
	int butns,						/* in : buttons to display */
	int *clicbtn					/* in : defaut button if no dialog needed */
){
	EVA_form *form = cntxt->form;
	EVA_ctrl *ctrl = form->ctrl + i_ctrl;
	DynBuffer *name = NULL;
	form->html = &form->html_top;

	/* Set dialog message in form->html_tab */
	DYNBUF_ADD3(form->html, 
			"<table border=0 cellspacing=0 cellpadding=5 width=100% bgcolor=#DDDDDD><tr>\n"
			"<td align=center><b><font size=+1>", ctrl->LABEL, 0, NO_CONV, "</font></b></td>"
			"<td align=center><font size=-1><i>");
	DYNBUF_ADD(form->html, (
				(clicbtn && *clicbtn & BUTN_SAVE) ? "Confirmation avant enregistrement" :
													"Confirmation avant fermeture"), 0, TO_HTML);
	DYNBUF_ADD_STR(form->html, "</i></font></td><td width=10></td><td align = center>");

	/* Add goback / close button */
	CTRL_CGINAMEBTN(&name, NULL, add_sz_str("FORMGOBACKOBJ"));
	if(put_html_button(cntxt, name->data, "Revenir", "_eva_btn_gobackobj_fr.gif", "_eva_btn_gobackobj_fr_s.gif", "Retourne à la page précédente", 0, 0)) STACK_ERROR;
	if(!butns || butns & BUTN_CLOSE)
	{
		DYNBUF_ADD_STR(form->html, "</td><td align = center>");
		if(form->b_modified)
		{
			CTRL_CGINAMEBTN(&name, NULL, add_sz_str("FORMCLOSE"));
			if(put_html_button(cntxt, name->data, "Fermer sans enregistrer", "_eva_btn_closenosave_fr.gif", "_eva_btn_closenosave_fr_s.gif", "Ignore les modifications et retourne au formulaire précédent", 0, 0)) STACK_ERROR;
		}
		else
		{
			CTRL_CGINAMEBTN(&name, NULL, add_sz_str("FORMCLOSE"));
			if(put_html_button(cntxt, name->data, "Fermer", "_eva_btn_close_fr.gif", "_eva_btn_close_fr_s.gif", "Retourne au formulaire précédent", 0, 0)) STACK_ERROR;
		}
	}
	DYNBUF_ADD_STR(form->html, "</td></tr></table>");

	/* Output complementary error message and form controls */
	DYNBUF_ADD_BUF(form->html, form->html_err, NO_CONV);
	if(form->html_tabs)
	{
		DYNBUF_ADD_STR(form->html, 
			"<table border=1 rules=rows cellspacing=0 cellpadding=2 width=100%><tr>")
		DYNBUF_ADD_BUF(form->html, form->html_tabs, NO_CONV);
		DYNBUF_ADD_STR(form->html, "</tr></table>\n");
		M_FREE(form->html_tabs);
	}
	form->nextstep = HtmlSaveDlg;					   

	/* Output bottom of form */
	DYNBUF_ADD_STR(form->html, 
		"<table border=0 cellspacing=0 cellpadding=2 width=100%><tr>")
	
	/* Output error message if blocking error */
	if(form->error & form->savedlg_outmode & 2 || form->error & 4)
	{
		DYNBUF_ADD_STR(form->html,
		"<td align=center bgcolor=#DDDDDD colspan=4><b><font face=Arial>"
		"<font size=+1 color=#FF0000>Enregistrement refusé</font>");
		if(!(form->error & 4))
			DYNBUF_ADD_STR(form->html, " : corrigez les erreurs et essayez d'enregistrer à nouveau");
		DYNBUF_ADD_STR(form->html,
		"</font></b></td></tr><tr>");
	}

	/* Add save / restore buttons in form->html_tabs */
	DYNBUF_ADD_STR(form->html, "<td align = center>");
	if(butns & BUTN_RESTORE)
	{
		DYNBUF_ADD_STR(form->html, "</td><td align = center>");
		CTRL_CGINAMEBTN(&name, NULL, add_sz_str("FORMRESTORE"));
		if(put_html_button(cntxt, name->data, "Annuler", "_eva_btn_restore_fr.gif", "_eva_btn_restore_fr_s.gif", "Annule les modifications et retourne à la fiche originale", 0, 0)) STACK_ERROR;
	}
	if(form->error < 4)
	{
		if(butns & BUTN_SAVE_BACK)
		{
			CTRL_CGINAMEBTN(&name, NULL, add_sz_str("FORMSAVE_BACK"));
			DYNBUF_ADD_STR(form->html, "</td>\n<td align = center>");
			if(put_html_button(cntxt, name->data, "Enregistrer", "_eva_btn_save_fr.gif", "_eva_btn_save_fr_s.gif", "Enregistre les modifications et retourne à la fiche enregistrée", 0, 0)) STACK_ERROR;
		}
		if(butns & BUTN_SAVE_CLOSE)
		{
			DYNBUF_ADD_STR(form->html, "</td>\n<td align = center>");
			CTRL_CGINAMEBTN(&name, NULL, add_sz_str("FORMSAVE_CLOSE"));
			if(put_html_button(cntxt, name->data, "Enregistrer et fermer", "_eva_btn_saveclose_fr.gif", "_eva_btn_saveclose_fr_s.gif", "Enregistre les modifications et retourne au formulaire précédent", 0, 0)) STACK_ERROR;
		}
		if(butns & BUTN_SAVE_NEXT)
		{
			DYNBUF_ADD_STR(form->html, "</td>\n<td align = center>");
			CTRL_CGINAMEBTN(&name, NULL, add_sz_str("FORMSAVE_NEXT"));
			if(put_html_button(cntxt, name->data, "Enregistrer et continuer", "_eva_btn_savenext_fr.gif", "_eva_btn_savenext_fr_s.gif", "Enregistre les modifications et passe à l'étape suivante", 0, 0)) STACK_ERROR;
		}
	}

	/* Add Display changes checkbox */
	DYNBUF_ADD_STR(form->html, "</td><td><table border=0 cellpadding=0 cellspacing=0><tr><td align=right>");
	CTRL_CGINAMESUBFIELD(&name, NULL, "CHANGE");
	if(form->b_modified)
	{
		if(put_html_chkbox(cntxt, DYNBUF_VAL_SZ(name), "1", 1, form->savedlg_outmode & 4 ? 1 : 0, 1)) STACK_ERROR;
		DYNBUF_ADD_STR(form->html, "</td><td><font size=-1>Afficher les modifications");
	}
	else if(form->savedlg_outmode & 4)
		DYNBUF_ADD3_BUF(form->html, "<input type=hidden name='", name, NO_CONV, "' value=1>");

	/* Add Display warnings checkbox */
	DYNBUF_ADD_STR(form->html, "</td></tr><tr><td align=right>");
	CTRL_CGINAMESUBFIELD(&name, NULL, "WARN");
	if(form->error & 1 || form->error & 2 && !(form->savedlg_outmode & 2))
	{
		if(put_html_chkbox(cntxt, DYNBUF_VAL_SZ(name), "1", 1, form->savedlg_outmode & 1 ? 1 : 0, 1)) STACK_ERROR;
		DYNBUF_ADD_STR(form->html, "</td><td><font size=-1>Afficher les avertissements");
	}
	else if(form->savedlg_outmode & 1)
		DYNBUF_ADD3_BUF(form->html, "<input type=hidden name='", name, NO_CONV, "' value=1>");
	DYNBUF_ADD_STR(form->html, "</td></tr></table></td>");

	DYNBUF_ADD_STR(form->html, 
		"</tr></table>\n")

	/* Set form dialog control */
	DYNTAB_ADD_BUF(&form->dlg_ctrl, 0, 0, ctrl->cginame);

	RETURN_OK_CLEANUP;
}
#undef ERR_FUNCTION
#undef ERR_CLEANUP

/*********************************************************************
** Function : form_save_dialog
** Description : handle a Save / Restore / Cancel dialog 
*********************************************************************/
#define ERR_FUNCTION "form_save_dialog"
#define ERR_CLEANUP	DYNTAB_FREE(cgival)
int form_save_dialog(				/* return : 0 on success, other on error */
	EVA_context *cntxt,				/* in/out : execution context data */
	unsigned long i_ctrl,			/* in : control index in cntxt->form->ctrl */
	char *confirm,					/* in : confirm mode */
	int butns,						/* in : buttons to display */
	int *clicbtn					/* in : defaut button if no dialog needed
									  out : clicked button if sucessfully processed
											0 if no answer (dialog displayed) */
){
	EVA_form *form = cntxt->form;
	EVA_ctrl *ctrl = form->ctrl + i_ctrl;
	DynTable cgival = {0};
	int b_nodlg = 0, actionbtn = 0;
	int b_first = !(ctrl->cginame && ctrl->cginame->data &&
		!strcmp(dyntab_val(&form->dlg_ctrl, 0, 0), ctrl->cginame->data));

	/* End dialog & return if no save */
 	if(!strcmp(confirm, "_EVA_NOSAVE") || (clicbtn && *clicbtn == BUTN_CLOSE && form->prevstep == HtmlView))
	{
		if(form_save_dialog_end(cntxt, clicbtn ? *clicbtn : BUTN_CLOSE)) STACK_ERROR;
		RETURN_OK;
	}

	/* Check duplicates */	
	form->error = 0;
	if(dyntab_sz(&form->id_obj, 0, 0)) form->b_modified = 0;
	if(form_check_keys(cntxt)) STACK_ERROR;

	if(form->error < 4 && strcmp(confirm, "_EVA_NOSAVE"))
	{
		/* Check data for each input control */
		form->step = InputCheck;
		if(ctrl_add_child(cntxt, 0, NULL)) STACK_ERROR;
	}

	if(b_first)
	{
		/* First dialog display : Initialize default button */
		actionbtn = clicbtn ? *clicbtn : 0;

		/* Initialize displayed infos */
		form->savedlg_outmode = 
			(actionbtn & BUTN_CLOSE ? 0 : 2) | (
				!strcmp(confirm, "_EVA_CONFIRMNONE") ? 0 : 
				!strcmp(confirm, "_EVA_CONFIRMWARN") ?  actionbtn & BUTN_CLOSE ? 0 : 1:
				!strcmp(confirm, "_EVA_CONFIRMCHANGE") ? 4 : (actionbtn & BUTN_CLOSE ? 0 : 1) | 4);

		/* Determine if confirm dialog needed */
		b_nodlg =  
				!strcmp(confirm, "_EVA_CONFIRMNONE") ? form->error < 2 :
				!strcmp(confirm, "_EVA_CONFIRMWARN") ? !form->error :
				!strcmp(confirm, "_EVA_CONFIRMCHANGE") ? !form->b_modified :
										!form->error && !form->b_modified;
	}
	else 
	{
		/* Next dialogs : parse button click */
		char *btn = CGI_CLICK_BTN_SUBFIELD;
		if(*btn) actionbtn =
			!strcmp(btn, "FORMCLOSE") ? BUTN_CLOSE :
			!strcmp(btn, "FORMRESTORE") ? BUTN_RESTORE :
			!strcmp(btn, "FORMGOBACKOBJ") ? BUTN_GOBACKOBJ :
			!strcmp(btn, "FORMSAVE_NEXT") ? BUTN_SAVE_NEXT :
			!strcmp(btn, "FORMSAVE_CLOSE") ? BUTN_SAVE_CLOSE :
			!strcmp(btn, "FORMSAVE_BACK") ? BUTN_SAVE_BACK :
			0;

		/* Read displayed infos - always dislay error */
		form->savedlg_outmode = 2;
		CTRL_GET_CGI_SUBFIELD("CHANGE");
		if(cgival.nbrows) form->savedlg_outmode |= 4;
		CTRL_GET_CGI_SUBFIELD("WARN");
		if(cgival.nbrows) form->savedlg_outmode |= 1;
	}

	/* Disable save if errors */
	if(form->error > 1)
	{
		if(!(actionbtn & BUTN_CLOSE)) b_nodlg = 0;
		if(actionbtn & BUTN_SAVE) actionbtn = 0;
	}

	/* If dialog applicable */
	if(!b_nodlg && form->error < 4)
	{
		/* Output selected controls in form->html_tabs */
		form->html = &form->html_tabs;
		form->step = HtmlSaveDlg;
		if(ctrl_add_child(cntxt, 0, NULL)) STACK_ERROR;

		/* Handle if no selected control */
		if(!form->html_tabs || !form->html_tabs->data ||
			!strstr(form->html_tabs->data, "</td>"))
		{
			if(b_first && actionbtn & BUTN_CLOSE)
			{
				b_nodlg = 1;
				form->html = NULL;
			}
			else if(!form->html_err)
				DYNBUF_ADD3(form->html, "<td colspan=2 align=center><br>",
					form->error ? 
						"<font color=#FF8844><b>Fiche incomplète : il y a des avertissements</b></font>" :
						"<b>Fiche complète</b>", 0, NO_CONV, 
					"<br><br></td></tr><tr>");
		}
	}

	/* Handle action if applicable */
	if(b_first && !b_nodlg) actionbtn =0;
	switch(actionbtn)
	{
	case BUTN_CLOSE:
	case BUTN_RESTORE:
	case BUTN_GOBACKOBJ:
		if(form_save_dialog_end(cntxt, actionbtn)) STACK_ERROR;
		break;

	case BUTN_SAVE_CLOSE:
		if(form_save(cntxt)) STACK_ERROR;
		if(form_save_dialog_end(cntxt, BUTN_CLOSE)) STACK_ERROR;
		break;

	case BUTN_SAVE_BACK:
	case BUTN_SAVE_NEXT:
		if(form_save(cntxt)) STACK_ERROR;
		if(form_save_dialog_end(cntxt, 0)) STACK_ERROR;
		break;

	default:
		/* Output message and dialog buttons if applicable */
		if(form_save_dialog_output(cntxt, i_ctrl, butns, clicbtn)) STACK_ERROR;
	}
	if(clicbtn) *clicbtn = actionbtn;

	RETURN_OK_CLEANUP;
}
#undef ERR_FUNCTION
#undef ERR_CLEANUP
