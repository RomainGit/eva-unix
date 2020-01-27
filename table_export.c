/*********************************************************************
**        File : table_export.c
** Description : functions to prepare & export table data  
**      Author : Alain BOUTE
**     Created : Oct 22 2003
*********************************************************************/

#include "eva.h"


/*********************************************************************
** Function : table_free
** Description : free ObjTableFormat structure data
*********************************************************************/
void table_free(ObjTableFormat *tbl)
{
	DYNTAB_FREE(tbl->cgiinput);
	DYNTAB_FREE(tbl->srchwords);
	DYNTAB_FREE(tbl->bgcol);
	DYNTAB_FREE(tbl->bgimg);
	DYNTAB_FREE(tbl->idobj);
	DYNTAB_FREE(tbl->data);
	DYNTAB_FREE(tbl->cellval);
	DYNTAB_FREE(tbl->altfilter);
	DYNTAB_FREE(tbl->typfilter);
	DYNTAB_FREE(tbl->condfilter);
	DYNTAB_FREE(tbl->selfilter);
	DYNTAB_FREE(tbl->label);
	DYNTAB_FREE(tbl->field);
	DYNTAB_FREE(tbl->format);
	DYNTAB_FREE(tbl->notes);
	DYNTAB_FREE(tbl->fontsize);
	DYNTAB_FREE(tbl->align);
	DYNTAB_FREE(tbl->bold);
	DYNTAB_FREE(tbl->underline);
	DYNTAB_FREE(tbl->strip);
	DYNTAB_FREE(tbl->place);
	DYNTAB_FREE(tbl->distinctval);
	DYNTAB_FREE(tbl->debug);
}

/*********************************************************************
** Function : table_read_controls
** Description : read & intialize data for list & relations tables
*********************************************************************/
#define ERR_FUNCTION "table_read_controls"
#define ERR_CLEANUP DYNTAB_FREE(cgival)
int table_read_controls(				/* return : 0 on success, other on error */
	EVA_context *cntxt,					/* in/out : execution context data */
	unsigned long i_ctrl,				/* in : control index in cntxt->form->ctrl */
	DynTable *data						/* in : table format data (from a list control) */
){
	EVA_form *form = cntxt->form;
	EVA_ctrl *ctrl = form->ctrl + i_ctrl;
	DynTable cgival = { 0 };
	char *tablesearch;
	ObjTableFormat *tbl = NULL;

	/* Alloc && initialize table data */
	M_ALLOC(ctrl->objtbl, sizeof(ctrl->objtbl[0]));
	tbl = ctrl->objtbl;
	if(!data)
	{
		data = &ctrl->attr;
		tbl->b_ctrl = 1;
	}
	tbl->attr = data;
	tbl->minsearchlen = strtoul(DYNTAB_FIELD_VAL(tbl->attr, MINSEARCHLEN), NULL, 10);
	DYNTAB_FIELD_TAB(&tbl->field, tbl->attr, DISPLAYFIELDS);
	DYNTAB_FIELD_TAB(&tbl->format, tbl->attr, DISPLAYFORMAT);
	DYNTAB_FIELD_TAB(&tbl->label, tbl->attr, DISPLAYLABELS);
	DYNTAB_FIELD_TAB(&tbl->align, tbl->attr, DISPLAYALIGN);
	DYNTAB_FIELD_TAB(&tbl->bold, tbl->attr, DISPLAYBOLD);
	DYNTAB_FIELD_TAB(&tbl->fontsize, tbl->attr, DISPLAYFONTSIZE);
	DYNTAB_FIELD_TAB(&tbl->underline, tbl->attr, DISPLAY_UNDERLINE);
	DYNTAB_FIELD_TAB(&tbl->strip, tbl->attr, DISPLAY_STRIP);
	DYNTAB_FIELD_TAB(&tbl->notes, tbl->attr, DISPLAYNOTES);
	DYNTAB_FIELD_TAB(&tbl->altfilter, tbl->attr, ALTFILTER);
	DYNTAB_FIELD_TAB(&tbl->condfilter, tbl->attr, ALTFILTER_FILTER);
	DYNTAB_FIELD_TAB(&tbl->typfilter, tbl->attr, ALTFILTER_TYPE);
	DYNTAB_FIELD_TAB(&tbl->distinctval, tbl->attr, DISTINCT_VAL);
	DYNTAB_FIELD_TAB(&tbl->debug, tbl->attr, DEBUG_SQL_EXPR);

	/* Retrieve list tools status */
	if(cgi_get_subfield(cntxt, &tbl->cgiinput, ctrl, "INPUT", 1, 0, 0)) STACK_ERROR;
	if(cgi_get_subfield(cntxt, &tbl->selfilter, ctrl, "SELFILTER", 1, 0, 0)) STACK_ERROR;
	if(dyntab_order_lines(&tbl->cgiinput)) RETURN_ERR_MEMORY;
	CTRL_GET_CGI_SUBFIELD1("STATUS");
	if(cgival.nbrows)
		sscanf(dyntab_val(&cgival, 0, 0), "%lx,%lu,%lu,%lu,%lu,%lu,%lu,%lu", 
			&tbl->status, &tbl->line, &tbl->lines, &tbl->sortcol, &tbl->b_sortdesc, &tbl->srchcol, &tbl->ctrlline, &tbl->srchmode);
	
	/* Enable functions depending on control attributes */
	tablesearch = DYNTAB_FIELD_VAL(data, TABLESEARCH);
	tbl->status &= ~(TblCtrl_addnew|TblCtrl_openbtn|TblCtrl_search|TblCtrl_ctrlsel);
	if(DYNTAB_FIELD_CELL(tbl->attr, TABLEINSERT) && DYNTAB_FIELD_CELL(tbl->attr, LIST_CREATE_FORM))
		tbl->status |= TblCtrl_addnew;
	if(strcmp(DYNTAB_FIELD_VAL(tbl->attr, OPENBUTTON), "_EVA_NONE"))
		tbl->status |= TblCtrl_openbtn;
	if(tablesearch[0]) 
		tbl->status |= TblCtrl_search;
	if(!strcmp(ctrl->CONTROL, "_EVA_INPUT"))
		tbl->status |= TblCtrl_ctrlsel;
	tbl->b_sortsel = CTRL_ATTR_CELL(MULTIPLE_AUTO_ORDER) != 0;
	if(!CTRL_ATTR_CELL(NOTABLESORT)) tbl->status |= TblCtrl_sort;

	/* Initialize status if first call */
	if(!cgival.nbrows)
	{
		DynTableCell *sortcol = DYNTAB_FIELD_CELL(tbl->attr, SORTCOL);
		tbl->b_first = 1;
		if(sortcol)
		{
			if(sortcol->txt) tbl->sortcol = atoi(sortcol->txt);
			if(tbl->sortcol) tbl->sortcol--;
			else tbl->sortcol = tbl->field.nbrows;
		}
		if(tbl->status & TblCtrl_search && 
				!strcmp("_EVA_SEARCHONLOAD", tablesearch) ||
				!strcmp("_EVA_SEARCHONLOAD_NEW", tablesearch) && form->b_newobj ||
				!strcmp("_EVA_SEARCHONLOAD_EMPTY", tablesearch) && !ctrl->val.nbrows)
			tbl->status |= TblCtrl_opensearch;
		tbl->lines = ctrl->LINES ? ctrl->LINES : 5;
		tbl->b_sortdesc = atoi(DYNTAB_FIELD_VAL(tbl->attr, SORTDESC));
	}
	tbl->srchfmt = "";

	RETURN_OK_CLEANUP;
}
#undef ERR_FUNCTION
#undef ERR_CLEANUP

/*********************************************************************
** Function : table_read_obj_list
** Description : read table list of of objects
*********************************************************************/
#define ERR_FUNCTION "table_read_obj_list"
#define ERR_CLEANUP
int table_read_obj_list(				/* return : 0 on success, other on error */
	EVA_context *cntxt,					/* in : execution context data */
	unsigned long i_ctrl,				/* in : control index in cntxt->form->ctrl */
	int b_selobj						/* in : use control values if not 0 */
){
	EVA_form *form = cntxt->form;
	EVA_ctrl *ctrl = form->ctrl + i_ctrl;
	ObjTableFormat *tbl = ctrl->objtbl;
	unsigned long i;

	if(!tbl->idobj.nbrows && tbl->totlines)
	{
		if(b_selobj)
		{
			/* Copy select objects in display list */
			for(i = 0; i < tbl->lines && i + tbl->line < ctrl->val.nbrows; i++) 
				DYNTAB_SET_CELL(&tbl->idobj, i, 0, &ctrl->val, i + tbl->line, 0);
		}
		else
		{
			/* Default sort - build query for displayed objects in IdObj (creation) order */
			char qry[256] = {0};
			snprintf(qry, sizeof(qry)-1, 
				"SELECT DISTINCT IdObj FROM IdList ORDER BY IdObj %s LIMIT %lu,%lu",
				tbl->b_sortdesc ? "DESC" : "", tbl->line, tbl->lines);
			if(sql_exec_query(cntxt, qry) || sql_get_table(cntxt, &tbl->idobj, 2)) CLEAR_ERROR;
		}
	}

	/* Drop temporary tables & Read displayed objects data */
	if(sql_exec_query(cntxt, "DROP TABLE IF EXISTS IdList,ValList,IdListMatch") ||
		qry_list_data(cntxt, tbl)) CLEAR_ERROR;

	RETURN_OK_CLEANUP;
}
#undef ERR_FUNCTION
#undef ERR_CLEANUP

/*********************************************************************
** Function : table_prepare_rows
** Description : prepare cell values for a table of objects
*********************************************************************/
#define ERR_FUNCTION "table_prepare_rows"
#define ERR_CLEANUP DYNTAB_FREE(data); \
					M_FREE(outval); \
					M_FREE(val)
int table_prepare_rows(					/* return : 0 on success, other on error */
	EVA_context *cntxt,					/* in/out : execution context data */
	unsigned long i_ctrl,				/* in : control index in cntxt->form->ctrl */
	char *pfx							/* in : values prefix */
){
	EVA_form *form = cntxt->form;
	EVA_ctrl *ctrl = form->ctrl + i_ctrl;
	ObjTableFormat *tbl = ctrl->objtbl;
	DynTable data = {0};
	DynBuffer *outval = NULL;
	DynBuffer *val = NULL;
	unsigned long i, j, k;
	unsigned long rowstart;
	DynTableCell *cell;
	size_t pfx_sz = pfx ? strlen(pfx) : 0;

	/* Prepare title line */
	DYNTAB_SET(&tbl->cellval, 0, 0, "IdObj");
	for(j = 0; j < tbl->field.nbrows; j++) 
	{
		DYNTAB_SET_CELL(&tbl->cellval, 0, j + 1, &tbl->label, j, 0);
	}

	/* Process rows */
	for(i = 0; i < tbl->idobj.nbrows; i++)
	{
		char *idend;
		unsigned long idobj = strtoul(dyntab_val(&tbl->idobj, i, 0), &idend, 10);

		/* First colummn contains object Id */
		DYNTAB_ADD_CELL(&tbl->cellval, i + 1, 0, &tbl->idobj, i, 0);

		/* If object is not valid */
		if(!idobj || *idend)
		{
			DYNTAB_SET(&tbl->cellval, i + 1, 1, "#NAR#");
		}
		else
		{
			/* Find object in objects data */
			for(j = 0; j < tbl->data.nbrows && dyntab_cell(&tbl->data, j, 0)->IdObj != idobj; j++);
			rowstart = j;

			/* Output line data in tbl->field order */
			for(j = 0; j < tbl->field.nbrows; j++) 
			{
				char *fmt = dyntab_val(&tbl->format, j, 0);
				char *separ = ", ";
				int b_index = 0;
				unsigned long line = 1;
				unsigned long i0;
				int b_distinct = dyntab_sz(&tbl->distinctval, j, 0);
				char *align = dyntab_val(&tbl->align, j, 0);

				/* Set alignment & value separator */
				if(!strcmp(align, "newline")) { align = ""; separ = "\n"; }
				else if(!strcmp(align, "space")) { align = ""; separ = " "; }
				else if(!strcmp(align, "index")) { align = ""; b_index = 1; }

				/* Concat formated cell values */
				M_FREE(outval);
				if(pfx_sz) DYNBUF_ADD(&outval, pfx, pfx_sz, NO_CONV);
				for(k = 0; rowstart < tbl->data.nbrows; k++, rowstart++)
				{
					/* Break if column changes */
					int b_found = 0;
					unsigned long idrelobj;
					char *idend = NULL;
					cell = dyntab_cell(&tbl->data, rowstart, 0);
					if(cell->col != j) break;

					/* Distinct values required : search for same previous value - ignore if found */
					if(b_distinct) for(i0 = 0; i0 < k && !b_found; i0++)
						if(!dyntab_cmp(&tbl->data, rowstart, 0, &tbl->data, rowstart - i0 - 1, 0))
							b_found = 1;
					if(b_found) continue;

					/* Output value separator if applicable */
					if(b_index || cell->Line && !dyntab_sz(&tbl->align, j, 0))
					{
						if(line >= cell->Line && k) DYNBUF_ADD(&outval, separ, 0, NO_CONV)
						else while(line < cell->Line) { DYNBUF_ADD_STR(&outval, "\n"); line++; }
					}
					else if(outval && outval->cnt > pfx_sz) DYNBUF_ADD(&outval, separ, 0, NO_CONV);

					/* Use relation format if applicable */
					idrelobj = cell->txt ? strtoul(cell->txt, &idend, 10) : 0;
					if(idend && *idend) idrelobj = 0;
					if(idrelobj && (!strncmp(fmt, add_sz_str("_EVA_RELATION")) || cell->b_relation && !*fmt))
					{
						/* Relation formats */
						if(qry_obj_idfield(cntxt, &data, idrelobj, 0) ||
							qry_obj_label(cntxt, NULL, NULL, NULL, &val, NULL, NULL, NULL, NULL, 0, &data, 0)) STACK_ERROR;
						DYNBUF_ADD_BUF(&outval, val, NO_CONV);
					}

					/* Add formated value */
					else if(put_value_fmt(cntxt, &outval, DYNTAB_VAL_SZ(&tbl->data, rowstart, 0), dyntab_val(&tbl->format, j, 0)))
						STACK_ERROR;
				}
				if(outval && outval->cnt > pfx_sz) DYNTAB_ADD_BUF(&tbl->cellval, i + 1, j + 1, outval);
			}
		}
	}

	RETURN_OK_CLEANUP;
}
#undef ERR_FUNCTION
#undef ERR_CLEANUP
