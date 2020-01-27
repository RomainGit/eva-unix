/*********************************************************************
**        File : ctrl_input_fileupload.c
** Description : HTML handling functions for input controls
**      Author : Alain BOUTE
**     Created : Aug 18 2001
*********************************************************************/

#include "eva.h"

/*********************************************************************
** Function : ctrl_add_fileupload
** Description : handles INPUT controls of type FILEUPLOAD
*********************************************************************/
#define ERR_FUNCTION "ctrl_add_fileupload"
#define ERR_CLEANUP DYNTAB_FREE(cgival); \
					M_FREE(name)
int ctrl_add_fileupload(			/* return : 0 on success, other on error */
	EVA_context *cntxt,				/* in/out : execution context data */
	unsigned long i_ctrl						/* in : control index in cntxt->form->ctrl */
){
	EVA_form *form = cntxt->form;
	EVA_ctrl *ctrl = form->ctrl + i_ctrl;
	DynTable cgival = {0};
	DynBuffer *name = NULL;
	unsigned long i;
	int b_multiple = ctrl->MULTIPLE[0] != 0 && strcmp("No", ctrl->MULTIPLE);
	int b_loadfile = cntxt->cgiencodemultipart && form->i_ctrl_clic == i_ctrl;

	switch(form->step)
	{
	case CtrlRead:
		/* Renumber values */
		ctrl_renumber_values(ctrl, 0);
		if(ctrl->storage) ctrl->storage = 3;

		/* If not transmit mode : handle files list */
		if(!b_loadfile)
		{
			/* Read table format data if needed */
			if(!cntxt->objdata_FORMLIST_FILTER.nbrows)
			{
				DynTableCell *list = dyntab_field_cell(&cntxt->cnf_data, "_EVA_FORMLIST_FILTER", 0, 1, 0);
				unsigned long idlist = (list && list->txt) ? atoi(list->txt) : 0;
				if(qry_obj_field(cntxt, &cntxt->objdata_FORMLIST_FILTER, idlist, NULL)) STACK_ERROR;
			}

			/* Handle table buttons clics */
			if(table_read_controls(cntxt, i_ctrl, &cntxt->objdata_FORMLIST_FILTER) ||
				table_process_controls(cntxt, i_ctrl)) STACK_ERROR;
		}
		break;

	case HtmlEdit:
	case HtmlPrint:
	case HtmlView:
		/* Read control status */
		if(ctrl_format_pos(cntxt, ctrl, 1)) STACK_ERROR;

		/* Enclose subcontrols in a table */
		DYNBUF_ADD3_INT(form->html,
			"\n<table cellspacing=0 cellpadding=0 border=",
			b_loadfile ? 1 : 0,
			" bgcolor=#EEEEEE rules=none>");

		/* Output control values */
		if(!b_loadfile && cntxt->objdata_FORMLIST_FILTER.nbrows)
		{
			/* Output relation table if applicable */
			DYNBUF_ADD_STR(form->html, "<tr><td colspan=4>");
			if(ctrl_relation_put_table(cntxt, i_ctrl)) STACK_ERROR;
			DYNBUF_ADD_STR(form->html, "</td></tr>");
		}
		else
			/* Output as hidden inputs if no table */
			for(i = 0; i < ctrl->val.nbrows; i++)
				if(ctrl_put_hidden(cntxt, ctrl, i)) STACK_ERROR;

		/* If new value allowed */
		DYNBUF_ADD_STR(form->html, "<tr valign=middle>");
		if(form->step == HtmlEdit && (b_loadfile || b_multiple || !ctrl->val.nbrows))
		{
			int columns = ctrl->COLUMNS;
			if(!columns) columns = 5;

			/* Handle transmit mode : Add HTML input of type file + upload button + description input */
			if(b_loadfile)
			{
				/* Add HTML input of type file */
				CTRL_CGINAMEVAL(&name, ctrl->val.nbrows);
				DYNBUF_ADD3_BUF(form->html, "<td><input type=file name='", name, NO_CONV, "'");
				DYNBUF_ADD3_INT(form->html, " size=", columns, "></td>\n");
				if(ctrl_put_hidden_old(cntxt, ctrl, ctrl->val.nbrows, name, NULL, 0)) STACK_ERROR;

				/* Add upload button + name & description inputs */
				CTRL_CGINAMEBTN(&name, NULL, add_sz_str("Nop"));
				DYNBUF_ADD_STR(form->html, "<td align=right>");
				if(put_html_button(cntxt, name->data, "Lancer", 
									NULL, NULL,
									"Lance la transmission du fichier\n\n"
									"Cliquez d'abord sur le bouton 'Parcourir ...' puis choisissez le fichier à transmettre (un seul fichier à la fois)\n\n"
									"La transmission peut prendre un certain temps si le fichier est important\n\n"
									"Note : le fichier est aussi transmis quand vous cliquez un autre bouton ou si vous changez une valeur dynamique\n\n"
									"Si vous avez utilisé Parcourir et que vous ne voulez pas transmettre le fichier, effacez le champ à gauche du bouton Parcourir"
									,0, 0))
					STACK_ERROR;
				CTRL_CGINAMESUBFIELD(&name, NULL, "FILE_DESCRIPTION");
				DYNBUF_ADD_STR(form->html, "</td></tr><tr><td colspan=4>Description du fichier</td></tr><tr><td colspan=4>");
				if(put_html_text_input(cntxt, name->data, name->cnt, 
									NULL, 0, 0, 0, 3, 30, 128))
					STACK_ERROR;
			}
			else
			{
				/* Add open upload dialog button */
				CTRL_CGINAMEBTN(&name, NULL, add_sz_str("TRANSMIT_FILE"));
				DYNBUF_ADD_STR(form->html, "<td align=center>");
				if(put_html_button(cntxt, name->data, "Transmettre ...", 
									NULL, NULL, "Transmettre un fichier au serveur", 0, 0))
					STACK_ERROR;
			}
			DYNBUF_ADD_STR(form->html, "</td>");
		}
		DYNBUF_ADD_STR(form->html, "</tr></table>");
		if(ctrl_format_pos(cntxt, ctrl, 0)) STACK_ERROR;
	}

	RETURN_OK_CLEANUP;
}
#undef ERR_FUNCTION
#undef ERR_CLEANUP

