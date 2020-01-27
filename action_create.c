/*********************************************************************
**        File : action_create.c
** Description : handler for buttons & actions of type CREATE
**				 create series of objects
**      Author : Alain BOUTE
**     Created : Oct 16 2004
*********************************************************************/

#include "eva.h"

/*********************************************************************
** Function : action_create_objects
** Description : button click handler for CREATE
*********************************************************************/
#define ERR_FUNCTION "action_create_objects"
#define ERR_CLEANUP	DYNTAB_FREE(srcobj); \
					DYNTAB_FREE(dstobj); \
					DYNTAB_FREE(dstfield); \
					DYNTAB_FREE(dstrelmod); \
					DYNTAB_FREE(dstkey); \
					DYNTAB_FREE(srcfield); \
					DYNTAB_FREE(srcvaltyp); \
					DYNTAB_FREE(srcvalobj); \
					DYNTAB_FREE(listobj); \
					DYNTAB_FREE(field); \
					DYNTAB_FREE(data); \
					DYNTAB_FREE(objdata); \
					qry_build_free(&flt); \
					M_FREE(label)
int action_create_objects(			/* return : 0 on success, other on error */
	EVA_context *cntxt,				/* in/out : execution context data */
	unsigned long i_ctrl			/* in : control index in cntxt->form->ctrl */
){
	EVA_form *form = cntxt->form;
	EVA_ctrl *ctrl = form->ctrl + i_ctrl;
	DynTable srcobj = {0};
	DynTable dstobj = {0};
	DynTable dstfield = {0};
	DynTable dstrelmod = {0};
	DynTable dstkey = {0};
	DynTable srcfield = {0};
	DynTable srcvaltyp = {0};
	DynTable srcvalobj = {0};
	DynTable listobj = {0};
	DynTable field = {0};
	DynTable data = {0};
	DynTable objdata = {0};
	QryBuild flt = {0};
	DynBuffer *label = NULL;
	unsigned long dstform = strtoul(CTRL_ATTR_VAL(CREATE_FORM), NULL, 10);
	unsigned long idform = DYNTAB_TOUL(&form->id_form);
	unsigned long idobj = DYNTAB_TOUL(&form->id_obj);
	unsigned long i, j, k;	  
	char *crmode = CTRL_ATTR_VAL(CREATE_MODE);
	char *dialog = CTRL_ATTR_VAL(DIALOG);
	unsigned long limit = strtoul(CTRL_ATTR_VAL(LIMIT), NULL, 10);
	int b_msg;
	DynTableCell *srcupdate = CTRL_ATTR_CELL(SRC_UPDATE);

	//return 0;

	/* Handle create method */
	if(!strcmp(crmode, "_EVA_RELATION"))
	{
		/* Create one object per object in given relation control */
		unsigned long idctrl = strtoul(CTRL_ATTR_VAL(SRCOBJ_INPUT), NULL, 10);

		/* Read control values on current object */ 
		if(qry_obj_field(cntxt, &data, idctrl, "_EVA_FIELD")) STACK_ERROR;
		if(data.nbrows && form_get_field_values(cntxt, &srcobj, dyntab_val(&data, 0, 0), idform, idobj)) STACK_ERROR;
	}
	else if(!strcmp(crmode, "_EVA_CONDEXPR"))
	{
		/* Create one object per object matching given filter */
		unsigned long idflt = strtoul(CTRL_ATTR_VAL(SELOBJ_FILTER), NULL, 10);

		/* Evaluate filter */ 
		if(qry_obj_field(cntxt, &data, idflt, NULL)) STACK_ERROR;
		if(qry_parse_filter_nodes(cntxt, &flt, &data)) STACK_ERROR;
		if(qry_filter_objects(cntxt, &srcobj, &flt)) STACK_ERROR;
	}
	else
	{
		/* Create a single object */
		DYNTAB_ADD_INT(&srcobj, 0, 0, idobj);
	}

	/* Read created values definition */
	CTRL_READ_ATTR_TAB(dstfield, DESTFIELD);
	CTRL_READ_ATTR_TAB(dstrelmod, DEST_RELMODE);
	CTRL_READ_ATTR_TAB(dstkey, DEST_KEY);
	CTRL_READ_ATTR_TAB(srcvaltyp, SRCTYPE);
	CTRL_READ_ATTR_TAB(srcvalobj, SRCLISTOBJ);
	CTRL_READ_ATTR_TAB(srcfield, SRCFIELD);

	/* Output page header if applicable */
	b_msg = !*dialog && srcobj.nbrows > 1 ||
			!strcmp(dialog, "_EVA_ALWAYS") ||
			!strcmp(dialog, "_EVA_COUNT") && limit <= srcobj.nbrows;
	if(b_msg)
	{
		put_html_page_header(cntxt, NULL, NULL, NULL, 3);
		printf("<font face=Arial><hr><b>%s</b><hr>", ctrl->LABEL);
		cntxt->b_terminate = 15;
	}

	/* For each source object */
	for(i = 0; i < srcobj.nbrows; i++)
	{
		unsigned long idsrc = DYNTAB_TOULRC(&srcobj, i, 0), iddest = 0;
		int b_create = 1;
		dyntab_free(&objdata);

		/* Display progress message if applicable */
		if(b_msg)
		{
			if(qry_obj_field(cntxt, &data, idsrc, NULL)) STACK_ERROR;
			if(qry_obj_label(cntxt, &label, NULL, &label, NULL, NULL, NULL, NULL, NULL, 0, &data, 0)) CLEAR_ERROR;
			printf("==&gt; <font color=#0000FF>%s</font><br>", label ? label->data : "???");
		}

		/* Calc values for each destination field */
		for(j = 0; j < dstfield.nbrows; j++)
		{
			/* Get relation & key options */
			DynTableCell *fld = dyntab_cell(&dstfield, j, 0);
			int b_rel = dyntab_sz(&dstrelmod, j, 0) > 0;
			int b_key = !dstkey.nbrows || dyntab_sz(&dstkey, j, 0) > 0;

			/* Handle value source type & field */
			char *srctyp = dyntab_val(&srcvaltyp, j, 0);
			if(!*srctyp) srctyp = "_EVA_VALUE";
			dyntab_free(&listobj);
			if(!strcmp(srctyp, "_EVA_PROC_SELOBJ"))
			{
				/* Handle specific value source type : selected object */
				DYNTAB_ADD_INT(&listobj, 0, 0, idsrc);
				srctyp = "_EVA_LISTOBJ";
			}
			else
				for(k = 0; k < srcvalobj.nbcols; k++)
					if(dyntab_sz(&srcvalobj, j, k))
						DYNTAB_SET_CELL(&listobj, k, 0, &srcvalobj, j, k);
			DYNTAB_SET_CELL(&field, 0, 0, &srcfield, j, 0);

			/* Evaluate value - don't create this object if error */
			if(form_eval_valtype(cntxt, &data, srctyp, &listobj, &field))
			{
				b_create = 0;
				if(b_msg) printf("<font color=#FF0000>%s</font> : %s<br>", fld->txt, cntxt->err.text);
				CLEAR_ERROR;
				break;
			}

			/* Add values to object data */
			for(k = 0; k < data.nbrows; k++)
			{
				unsigned long row = objdata.nbrows;
				DynTableCell *c;
				DYNTAB_ADD_CELL(&objdata, row, 0, &data, k, 0);
				c = dyntab_cell(&objdata, row, 0);
				if(c->field && !c->b_dontfreefield) M_FREE(c->field);
				c->field = fld->txt;
				c->IdField = fld->IdValue;
				c->b_dontfreefield = 1;
				c->b_relation |= b_rel;
				c->i_cgi = b_key ? j : ~0UL;
			}
		}

		/* Continue if no data */
		if(!objdata.nbrows || !b_create)
		{
			/* Display message if applicable */
			if(b_msg) printf("<font color=#FFAA00>Pas de données - fiche non créée</font> : %s<br>");
			continue;
		}

		/* Check for duplicates - add form filter */
		qry_build_free(&flt);
		if(qry_add_filter_simple_int(cntxt, &flt, RelNone, "_EVA_FORMSTAMP", RelList, dstform)) STACK_ERROR;

		/* Add filter for each key value */
		for(j = 0; j < objdata.nbrows; j++)
		{
			DynTableCell *c = dyntab_cell(&objdata, j, 0);
			if(c->i_cgi == ~0UL || !c->txt || !c->txt[0] || !c->len) continue;
			dyntab_free(&data);
			DYNTAB_SET_CELLP(&data, 0, 0, c);
			DYNTAB_SET_CELLP(&field, 0, 0, dyntab_cell(&dstfield, c->i_cgi,0));
			if(qry_add_filter(cntxt, &flt, RelNone, &field, c->b_relation ? RelList :  Like, &data)) STACK_ERROR;
		}

		/* Exec query for duplicates if keys where present */
		dyntab_free(&data);
		if(flt.nbnode > 1 && qry_filter_objects(cntxt, &data, &flt)) STACK_ERROR;

		/* Continue if duplicate object exists */
		if(data.nbrows)
		{
			/* Display message with existing object if applicable */
			if(b_msg)
			{
				M_FREE(label);
				if(qry_obj_field(cntxt, &field, DYNTAB_TOUL(&data), NULL)) STACK_ERROR;
				if(qry_obj_label(cntxt, &label, NULL, &label, NULL, NULL, NULL, NULL, NULL, 0, &field, 0)) CLEAR_ERROR;
				printf("<font color=#FFAA00>La fiche existe déjà</font> : %s<br>", label ? label->data : "???");
			}
			continue;
		}

		/* Create new object & set data */
		if(qry_add_new_idobj(cntxt, &iddest, dstform)) STACK_ERROR;
		for(j = 0; j < objdata.nbrows; j++)
		{
			DynTableCell *c = dyntab_cell(&objdata, j, 0);
			if(!c->txt || !c->txt[0] || !c->len) continue;
			c->IdObj = iddest;
			if(qry_add_val(cntxt, c, 2, NULL)) STACK_ERROR;
		}

		/* Display message with created object if applicable */
		if(b_msg)
		{
			M_FREE(label);
			if(qry_obj_field(cntxt, &field, iddest, NULL)) STACK_ERROR;
			if(qry_obj_label(cntxt, &label, NULL, &label, NULL, NULL, NULL, NULL, NULL, 0, &field, 0)) CLEAR_ERROR;
			printf("<font color=#00FF00>++++ Fiche créée</font> : %s<br>", label ? label->data : "???");
		}

		/* Update source object if applicable */
		if(srcupdate)
		{
			DynTableCell val = {0};
			val.field = srcupdate->txt;
			val.IdField = srcupdate->IdValue;
			val.IdObj = idsrc;
			if(qry_add_val(cntxt, &val, 2, NULL)) STACK_ERROR;
		}
	}

	/* Close active window if applicable */
	if(0)
	{
		if(form_close_nosave(cntxt, idform, 0, NULL)) STACK_ERROR;
	}
 
	/* Output page footer if applicable */
	if(b_msg)
	{
		printf("<hr><br><center><input type=image name='B$#NOP' src='../img/_eva_btn_gobackobj_fr.gif'></center><br>\n");
	}

	RETURN_OK_CLEANUP;
}