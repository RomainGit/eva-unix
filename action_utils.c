/*********************************************************************
**        File : action_utils.c
** Description : utility fonctions for action handlers
**      Author : Alain BOUTE
**     Created : July 1 2003
*********************************************************************/

#include "eva.h"

/*********************************************************************
** Function : get_image_file
** Description : find the file path & size given the filename
*********************************************************************/
char *get_image_file(					/* return : image file path (alloc-ed memory), NULL if not found */
	EVA_context *cntxt,					/* in/out : execution context data */
	char *img,	 						/* in : image file name */
	int *width, int *height				/* out : image size */
){
	struct stat fs = {0};
	size_t sz = (img && *img) ? strlen(img) : 0;
	char *path;

	/* Initialize size & check params (no quotes in filenames) */
	if(width) *width = 0;
	if(height) *height = 0;
	if(!sz || strpbrk(img, "'\"")) return NULL;

	/* Look for image file in cntxt->imgpath */
	path = mem_alloc(cntxt->imgpath_sz + sz + 32);
	sprintf(path, "../img/%s/%s", cntxt->imgpath, img);
	if(stat(path, &fs))
	{
		/* Look for image file in root path - return if not found */
		sprintf(path, "../img/%s", img);
	}

	/* TODO - Get image size */

	return path;
}

/*********************************************************************
** Function : form_get_field_values
** Description : read field values for an object (search in CGI & form data)
*********************************************************************/
#define ERR_FUNCTION "form_get_field_values"
#define ERR_CLEANUP DYNTAB_FREE(fields); \
					DYNTAB_FREE(values)
int form_get_field_values(						/* return : 0 on success, other on error */
	EVA_context *cntxt,							/* in/out : execution context data */
	DynTable *res,								/* out : copied values */
	char *fieldlist,							/* in : fields to search for (comma separated) */
	unsigned long idform,						/* in : source form id (use current form if 0 and idobj = 0) */
	unsigned long idobj							/* in : source object id (use current obj if 0 and idform = 0) */
){
	EVA_form *form = cntxt->form;
	unsigned long i = form ? form->nb_ctrl : 0, j, k;
	DynTable fields = {0};
	DynTable values = {0};
	unsigned long curform = form ? DYNTAB_TOUL(&form->id_form) : 0;
	unsigned long curobj = form ? DYNTAB_TOUL(&form->id_obj) : 0;

	/* Check params & prepare fields list */
	if(res) dyntab_free(res); else return 0;
	if(!fieldlist || !*fieldlist) return 0;
	if(dyntab_from_list(&fields, fieldlist, strlen(fieldlist), ",", 0, 0)) RETURN_ERR_MEMORY;
	if(!idobj && !idform)
	{
		idobj = curobj;
		idform = curform;
	}
	
	/* For each field */
	for(k = 0; k < fields.nbrows; k++)
	{
		/* If working on current form : use control values first */
		char *field = dyntab_val(&fields, k, 0);
		if(form && idform == curform && idobj == curobj)
		{
			/* Search for first control with same field that has values */
			DynTable *val = NULL;
			for(i = 0; i < form->nb_ctrl; i++)
			{
				val = form->ctrl[i].allval.nbrows ? &form->ctrl[i].allval : &form->ctrl[i].val;
				if(!strcmp(form->ctrl[i].FIELD, field) && (val->nbrows || form->ctrl[i].b_modified)) break;
			}
			if(i < form->nb_ctrl) 
			{
				/* Control found : transfer values to result & return */
				if(form->Num || form->Line) val = &form->ctrl[i].val;
				for(j = 0; j < val->nbrows; j++) if(dyntab_sz(val, j, 0))
					DYNTAB_SET_CELL(res, res->nbrows, 0, val, j, 0);
				continue;
			}
		}

		/* Read from CGI data or DB if no cgi value */
		if(cgi_filter_values(cntxt, &values, 'D', ~0UL, idobj ? ~0UL : idform, idobj, field, "", 0, 0) ||
			!values.nbrows && idobj && qry_obj_field(cntxt, &values, idobj, field))
			STACK_ERROR;
		for(j = 0; j < values.nbrows; j++) 
			if(dyntab_sz(&values, j, 0)) DYNTAB_ADD_CELL(res, res->nbrows, 0, &values, j, 0);
	}

	RETURN_OK_CLEANUP;
}
#undef ERR_FUNCTION
#undef ERR_CLEANUP

/*********************************************************************
** Function : cgi_set_field_values
** Description : define field values in CGI data for given form & obj
*********************************************************************/
#define ERR_FUNCTION "cgi_set_field_values"
#define ERR_CLEANUP DYNTAB_FREE(cgival); \
					M_FREE(name)
int cgi_set_field_values(						/* return : 0 on success, other on error */
	EVA_context *cntxt,							/* in/out : execution context data */
	unsigned long idform,						/* in : destination form id */
	unsigned long idobj,						/* in : destination object id */
	char *destfield, size_t destfield_sz,		/* in : destination field */
	DynTable *values,							/* in : source values */
	char *setmode,								/* in : set mode (replace, add, ...) */
	int b_old									/* in : also set corresponding old CGI input value if non zero */
){
	DynTable cgival = { 0 };
	DynBuffer *name = NULL;
	unsigned long i, j;
	EVA_form *form = cntxt->form;
	unsigned long num = 0, line = 0;
	unsigned long curform = form ? DYNTAB_TOUL(&form->id_form) : 0;
	unsigned long curobj = form ? DYNTAB_TOUL(&form->id_obj) : 0;

	/* Read current CGI or DB values of destination field */
	if(!setmode) setmode = "";
	if(cgi_filter_values(cntxt, &cgival, 'D', ~0UL, idform, idobj, destfield, "", 0, 0) ||
		!cgival.nbrows && qry_obj_field(cntxt, &cgival, idobj, destfield)) STACK_ERROR;

	/* Return if nothing to do */
	if(cgival.nbrows ? !strcmp("_EVA_ADD_IFEMPTY", setmode) : !strcmp("_EVA_REMOVE", setmode)) RETURN_OK;

	/* Delete applicable values & check indexes */
	for(i = 0; i < cgival.nbrows; i++)
	{
		DynTableCell *val = dyntab_cell(&cgival, i, 0);
		int del = !strcmp("_EVA_REPLACE", setmode);
		if(!del && !strcmp("_EVA_REMOVE", setmode))
			for(j = 0; j < values->nbrows && !del;
				del = !dyntab_cmp(values, j, 0, &cgival, i, 0), j++);
		if(del)
		{
			if(val->i_cgi && cntxt->cgi[val->i_cgi].value)
			{
				cntxt->cgi[val->i_cgi].name[0] = 0;
				cntxt->cgi[val->i_cgi].name_sz = 0;
			}
		}
		else
		{
			if(!val->i_cgi && (
				cgi_build_name(cntxt, &name, 'D', 0, idform, idobj, destfield, destfield_sz, NULL, 0, val->Num, val->Line, 0) ||
				(b_old ? cgi_add_inputold : cgi_add_input)(cntxt, NULL, DYNBUF_VAL_SZ(name), val->txt, val->len)))
				STACK_ERROR;
			if(num < val->Num) num = val->Num;
			if(line < val->Line) line = val->Line;
		}
	}

	/* Add apropriate values */
	if(strcmp("_EVA_REMOVE", setmode)) 
		for(i = 0; i < values->nbrows; i++)
		{
			/* Fake CGI input with proper name & indexes */
			DynTableCell *c = dyntab_cell(values, i, 0);
			if(!c->Num && !c->Line)
			{
				if(line) line++; else num++;
				c->Num = num;
				c->Line = line;
			}
			if(cgi_build_name(cntxt, &name, 'D', 0, idform, idobj, destfield, destfield_sz, NULL, 0, c->Num, c->Line, 0) ||
				(b_old ? cgi_add_inputold : cgi_add_input)(cntxt, NULL, DYNBUF_VAL_SZ(name), DYNTAB_VAL_SZ(values, i, 0)))
				STACK_ERROR;
		}

	/* Handle control values if current form & object */
	if(form && idform == curform && idobj == curobj)
	{
		/* Search for first control with same field that has values */
		DynTable *val = NULL;
		for(i = 0; i < form->nb_ctrl; i++)
		{
			val = form->ctrl[i].allval.nbrows ? &form->ctrl[i].allval : &form->ctrl[i].val;
			if(!strcmp(form->ctrl[i].FIELD, destfield) && (val->nbrows || form->ctrl[i].b_modified)) break;
		}
		if(i < form->nb_ctrl) 
		{
			/* Control found : transfer values to control */
			dyntab_free(&form->ctrl[i].allval);
			if(cgi_filter_values(cntxt, &form->ctrl[i].val, 'D', ~0UL, idform, idobj, destfield, "", 0, 0)) STACK_ERROR;
			form->ctrl[i].b_modified = 1;
		}
	}

	/* Set form reload if current form */
	if(form && idform == DYNTAB_TOUL(&form->id_form) && idobj == DYNTAB_TOUL(&form->id_obj))
		form->b_reload = 1;

	RETURN_OK_CLEANUP;
}
#undef ERR_FUNCTION
#undef ERR_CLEANUP

/*********************************************************************
** Function : form_set_values
** Description : define values in current form
*********************************************************************/
#define ERR_FUNCTION "form_set_values"
#define ERR_CLEANUP DYNTAB_FREE(values)
int form_set_values(							/* return : 0 on success, other on error */
	EVA_context *cntxt,							/* in/out : execution context data */
	unsigned long idform,						/* in : destination form id */
	unsigned long idobj,						/* in : destination object id */
	char *destfield, size_t destfield_sz,		/* in : destination field */
	char *srctype,								/* in : source type */
	DynTable *srcobj,							/* in : source objects */
	DynTable *srcval,							/* in : source values / field expression */
	char *setmode								/* in : set mode (replace, add, ...) */
){
	DynTable values = {0};
	int b_old = !idobj;

	/* Evaluate as field expression  & set values */
	if(form_eval_valtype(cntxt, &values, srctype, srcobj, srcval) ||
		cgi_set_field_values(cntxt, idform, idobj, destfield, destfield_sz, &values, setmode, b_old)) STACK_ERROR;

	RETURN_OK_CLEANUP;
}
#undef ERR_FUNCTION
#undef ERR_CLEANUP

char *mystrdup(char *src, size_t sz)
{
	char *r = malloc(sz + 2); 
	if(r) 
	{
		memset(r, 0, sz + 1);
		if(src) memcpy(r, src, sz);
	}
	return r;
}
/*********************************************************************
** Function : form_eval_fieldexpr
** Description : evaluate a field expression in current form context
*********************************************************************/
#define ERR_FUNCTION "form_eval_fieldexpr"
#define ERR_CLEANUP DYNTAB_FREE(id_obj); \
					DYNTAB_FREE(restbl); \
					DYNTAB_FREE(resgroup); \
					qry_build_free(&flt); \
					M_FREE(pfield); \
					M_FREE(expr); \
					M_FREE(srchfield); \
					M_FREE(fieldexpr)
int form_eval_fieldexpr(						/* return : 0 on success, other on error */
	EVA_context *cntxt,							/* in/out : execution context data */
	DynTable *res,								/* out : resulting values - always freed before processing */
	unsigned long idform,						/* in : source form id (read from CGI if not 0 & available, else from DB) */
	unsigned long idobj,						/* in : source object id */
	char *_field, size_t field_sz,				/* in : field expression to evaluate in current form context */
	DynTable *data,								/* in : object data - for optimisation purposes */
	unsigned long beg							/* in : first line to process in data */
){
	char *pfield = mystrdup(_field, field_sz);
	char *field = pfield;
	char *bracket = !field ? NULL : strchr(field, '[');
	char *dotsep = !field ? NULL : strchr(field, '.');
	char *reldir = !field ? NULL : strstr(field, "->");
	char *relrev = !field ? NULL : strstr(field, "<-");
	char *relop = (reldir && (!relrev || reldir < relrev)) ? reldir : relrev;
	char *paropn = !field ? NULL : strchr(field, '(');
	DynTable id_obj = { 0 };
	DynTable restbl = { 0 };
	DynTable resgroup = { 0 };
	QryBuild flt = { 0 };
	DynBuffer *expr = NULL;
	char *srchfield = NULL;
	char *fieldexpr = NULL;
	char *fieldgrp;
	size_t fieldgrp_sz;
	struct _Brackets 
	{
		size_t beg;
		size_t end;
	} p[50] = {0};
	int b_group = 0, b_expr;
	unsigned long i, j, nbp = 0;

	/* Check params - return if applicable */
	if(res) dyntab_free(res); else RETURN_OK;
	if(!field || !*field || !field_sz || (!idform && !idobj)) RETURN_OK;
	b_expr = *field == '=';
	if(b_expr) { field++; field_sz--; }
	if(!field || !*field || !field_sz) RETURN_OK;

	/* Handle grouping */
	fieldgrp = field;
	fieldgrp_sz = field_sz;
	if(!strncmp(field, add_sz_str("SUM(")))
	{
		b_group = 1;
		fieldgrp += 4;
		fieldgrp_sz -= 5;
	}
	else if(!strncmp(field, add_sz_str("COUNT(")))
	{
		b_group = 2;
		fieldgrp += 6;
		fieldgrp_sz -= 7;
	}
	else if(!strncmp(field, add_sz_str("MAX(")))
	{
		b_group = 3;
		fieldgrp += 4;
		fieldgrp_sz -= 5;
	}
	else if(!strncmp(field, add_sz_str("MIN(")))
	{
		b_group = 4;
		fieldgrp += 4;
		fieldgrp_sz -= 5;
	}

	/* Handle brackets or expression : mixed SQL / fields expression */
	if(bracket || b_expr)
	{
		/* Process field expressions & collect results in restbl */
		unsigned long line = 0, num = 0;
		while(bracket)
		{
			DynTableCell *c;
			unsigned long line0 = 0, num0 = 0;
			char *end = strchr(bracket + 1, ']');
			size_t sz = end - bracket - 1;
			p[nbp].beg = bracket - fieldgrp;
			p[nbp].end = end - fieldgrp;
			if(!end) RETURN_OK;
			M_STRDUP(fieldexpr, bracket + 1, sz);
			if(form_eval_fieldexpr(cntxt, res, idform, idobj, fieldexpr, sz, data, beg)) STACK_ERROR;
			M_FREE(fieldexpr);

			/* Default : keep all values */
			for(i = 0; i < (res->nbrows ? res->nbrows : 1); i++) 
			{
				c = dyntab_cell(res, i, 0);
				DYNTAB_ADD_CELLP(&restbl, i, nbp, c);
				if(!c) continue;
				if(line0 < c->Line) line0 = c->Line;
				if(num0 < c->Num) num0 = c->Num;
			}
			c = dyntab_cell(&restbl, 0, nbp);
			c->i_cgi = res->nbrows;

			/* Handle result mode : do not use indexes if IN () operator*/
			if(bracket < field + 5 || strncmp(bracket - 5, " IN (", 5))
			{
				c->row = num0;
				c->col = line0;
			}

			if(line < c->col) line = c->col;
			if(num < c->row) num = c->row;
			nbp++;
			bracket = strchr(end + 1, '[');
		}
		dyntab_free(res);

		/* If a set of values was evaluated */
		if(restbl.nbrows)
		{
			/* Exec SQL query for each line / num of values */
			unsigned long L, N;
			for(L = line ? 1 : 0; !L || line && L <= line; L++) 
				for(N = 1; (line || !num) ? N < 2 : N <= num; N++)
			{
				/* Prepare query build */
				char *txt = fieldgrp;
				unsigned long valcnt = 0;
				size_t len = !p[0].end ? fieldgrp_sz : p[0].beg;
				M_FREE(expr);
				DYNBUF_ADD_STR(&expr, "SELECT ");
				if(len) DYNBUF_ADD(&expr, txt, len, NO_CONV);

				/* Substitue each bracket result in SQL query */
				for(j = 0; j < restbl.nbcols; j++)
				{
					/* Loop on values */
					DynTableCell *c0 = dyntab_cell(&restbl, 0, j);
					int b_empty = 1;
					for(i = 0; i < restbl.nbrows; i++)
					{
						DynTableCell *c = dyntab_cell(&restbl, i, j);
						if(restbl.nbcols == 1 && restbl.nbrows == 1 ||
							((line ? !c->Line || c->Line == L : c->Num == N || c0->i_cgi <= 1 && c->Num <= 1) &&
							c->txt && c->txt[0] && c->len))
						{
							if(!b_empty) DYNBUF_ADD_STR(&expr, ",");
							DYNBUF_ADD3_CELLP(&expr, "'", c, SQL_NO_QUOTE, "'")
							b_empty = 0;
							if(line ? c->Line : num <= 1 || c->Num > 1 || N == 1) valcnt++;
						}
					}

					/* Add empty value if no matching value found */
					if(b_empty) DYNBUF_ADD_STR(&expr, "''");

					/* Add out of brackets SQL code piece */
					txt = fieldgrp + p[j].end + 1;
					len = (j < nbp - 1 ? p[j + 1].beg : fieldgrp_sz) - p[j].end - 1;
					if(len) DYNBUF_ADD(&expr, txt, len, NO_CONV);
				}
				/* Ignore value set if no value found (except when 1 row without line */
				if(!valcnt && (restbl.nbrows > 1 || line)) continue;

				/* Exec Query */
				if(sql_exec_query(cntxt, expr->data) || sql_get_table(cntxt, &resgroup, 2)) STACK_ERROR;

				/* Add results to res */
				M_FREE(expr);
				for(j = 0; j < resgroup.nbrows; j++)
				{
					if(expr && expr->cnt) DYNBUF_ADD_STR(&expr, ",");
					DYNBUF_ADD_CELL(&expr, &resgroup, j, 0, NO_CONV);
				}
				if(expr && expr->cnt)
				{
					unsigned long r = res->nbrows;
					DYNTAB_ADD_BUF(res, r, 0, expr);
					dyntab_cell(res, r, 0)->Line = L;
				}
			}
		}
		else
		{
			DYNBUF_ADD3(&expr, "SELECT ", fieldgrp, fieldgrp_sz, NO_CONV, "");
			if(sql_exec_query(cntxt, expr->data) || sql_get_table(cntxt, res, 2)) STACK_ERROR;
		}
	}
	/* Handle trivial case : simple field */
	else if(!relop && !dotsep && (!paropn || b_group))
	{
		if(data)
		{
			if(dyntab_from_list(&restbl, fieldgrp, fieldgrp_sz, ",", 0, 0)) RETURN_ERR_MEMORY;
			for(i = 0; i < restbl.nbrows; i++)
			{
				j = beg;
				if(dyntab_filter_field(res, 0, data, dyntab_val(&restbl, i, 0), 0, 1, &j)) RETURN_ERR_MEMORY;
			}
		}
		else
		{
			M_STRDUP(srchfield, fieldgrp, fieldgrp_sz);
			if(form_get_field_values(cntxt, res, srchfield, idform, idobj)) STACK_ERROR;
		}
	}
	/* Handle first field if it may be read from CGI or data */
	else if(cntxt->nb_cgi && relop > fieldgrp && (!dotsep || relop && dotsep > relop) && (!paropn || b_group))
	{
		size_t sz = fieldgrp_sz - (relop - fieldgrp) - (relop == reldir ? 2 : 0);
		size_t sz1 = relop - fieldgrp;
		M_STRDUP(srchfield, fieldgrp, sz1);
		M_STRDUP(fieldexpr, relop + (relop == reldir ? 2 : 0), sz);
		if(data)
		{
			if(dyntab_from_list(&restbl, srchfield, sz1, ",", 0, 0)) RETURN_ERR_MEMORY;
			for(i = 0; i < restbl.nbrows; i++)
			{
				j = beg;
				if(dyntab_filter_field(&id_obj, 0, data, dyntab_val(&restbl, i, 0), 0, 1, &j)) RETURN_ERR_MEMORY;
			}
		}
		else
			if(form_get_field_values(cntxt, &id_obj, srchfield, idform, idobj)) STACK_ERROR;
		if(dyntab_sz(&id_obj, 0, 0) && (
				qry_parse_fieldexpr(cntxt, fieldexpr, sz, &flt) ||
				sql_get_listcol(cntxt, res, &id_obj, &flt, 0))) STACK_ERROR;

		/* Set indexes for values */
		for(i = 0; i < res->nbrows; i++)
		{
			DynTableCell *c = dyntab_cell(res, i, 0);
			for(j = 0; j < id_obj.nbrows; j++)
				if(c->IdObj == DYNTAB_TOULRC(&id_obj, j, 0))
				{
					DynTableCell *c1 = dyntab_cell(&id_obj, j, 0);
					c->Num = c1->Num;
					c->Line = c1->Line;
					break;
				}
		}
	}
	/* Other cases : read from DB if object exists */
	else if(idobj)
	{
		b_group = 0;
		DYNTAB_ADD_INT(&id_obj, 0, 0, idobj);
		if(qry_parse_fieldexpr(cntxt, field, field_sz, &flt) ||
			sql_get_listcol(cntxt, res, &id_obj, &flt, 0)) STACK_ERROR;
	}
	
	/* Handle grouping */
	if(b_group == 1)
	{
		/* SUM */
		double cnt = 0;
		unsigned long i;
		char txt[64];
		for(i = 0; i < res->nbrows; i++)
			cnt += atof(dyntab_val(res, i, 0));
		sprintf(txt, "%lg", cnt);
		dyntab_free(res);
		DYNTAB_ADD(res, 0, 0, txt, 0, NO_CONV);
	}
	else if(b_group == 2)
	{
		/* COUNT */
		unsigned long cnt = res->nbrows;
		dyntab_free(res);
		DYNTAB_ADD_INT(res, 0, 0, cnt);
	}
	else if(b_group == 3 || b_group == 4)
	{
		/* MAX / MIN */
		unsigned long i, kn = 0, kt =0;
		int b_num = 1;
		double num = 0;
		char *txt = NULL;
		for(i = 0; i < res->nbrows; i++)
		{
			char *t = dyntab_val(res, i, 0), *c = t;
			double n = atof(t);
			while(*c && b_num) { b_num &= *c >= '0' && *c <= '9' || *c == '.'; c++; }
			if(i)
			{
				if(b_group == 3 ? num < n : num > n) { kn = i; num = n; }
				if(b_group == 3 ? (strcmp(txt, t) < 0) : (strcmp(txt, t) > 0)) { kt = i; txt = t; }
			}
			else
			{
				txt = t;
				num = n;
			}
		}
		if(!b_num) kn = kt;
		if(kn) DYNTAB_SET_CELL(res, 0, 0, res, kn, 0);
		if(res->cell)
		{
			res->cell->Num = 0;
			res->cell->Line = 0;
		}
		res->nbrows = 1;
	}

	RETURN_OK_CLEANUP;
}
#undef ERR_FUNCTION
#undef ERR_CLEANUP

/*********************************************************************
** Function : qry_parse_valtype
** Description : evaluate a value type / expression pair
*********************************************************************/
int qry_parse_valtype(							/* return : 0 on success, other on error */
	EVA_context *cntxt,							/* in : execution context data */
	char *srctype,								/* in : value type */
	DynTable *listobj,							/* int : list of objects */
	DynTable **id_form,							/* out : selected form */
	DynTable **id_obj							/* out : selected object */
){
	*id_form = 0;
	*id_obj = 0;

	/* Set base object & form depending on source type */
	if(		!strcmp("_EVA_MAIN_FORM", srctype))
	{
		*id_obj = &cntxt->id_form;
	}
	else if(!strcmp("_EVA_MAIN_OBJ", srctype)) 
	{
		*id_form = &cntxt->id_form;
		*id_obj = &cntxt->id_obj;
	}
	else if(!strcmp("_EVA_ALT_FORM", srctype)) 
	{
		*id_obj = &cntxt->alt_form;
	}
	else if(!strcmp("_EVA_ALT_OBJ", srctype)) 
	{
		*id_form = &cntxt->alt_form;
		*id_obj = &cntxt->alt_obj;
	}
	else if(!strcmp("_EVA_SERVERCONFIG", srctype)) 
	{
		*id_obj = &cntxt->id_cnf;
	}
	else if(!strcmp("_EVA_USERID", srctype) ||
			!strcmp("_EVA_CURRENTUSER", srctype) ||
			!strcmp("_EVA_CURRENT_USER", srctype)) 
	{
		*id_obj = &cntxt->id_user;
	}
	else if(!strcmp("_EVA_CURRENT", srctype) ||
			!strcmp("_EVA_CURRENTOBJ", srctype) ||
			!strcmp("_EVA_CURRENTOBJ_FIELD", srctype) ||
			!strcmp("_EVA_FIELD", srctype)) 
	{
		*id_form = &cntxt->form->id_form;
		*id_obj = &cntxt->form->id_obj;
	}
	else if(!strcmp("_EVA_LISTOBJ", srctype) ||
			!strcmp("_EVA_FILTER_LISTOBJ", srctype)) 
	{
		*id_obj = listobj;
	}
	else return 1;
	return 0;
}

/*********************************************************************
** Function : form_eval_valtype
** Description : evaluate a value type / expression pair
*********************************************************************/
#define ERR_FUNCTION "form_eval_valtype"
#define ERR_CLEANUP DYNTAB_FREE(selobj); \
					DYNTAB_FREE(values); \
					qry_build_free(&flt)
int form_eval_valtype(							/* return : 0 on success, other on error */
	EVA_context *cntxt,							/* in/out : execution context data */
	DynTable *res,								/* out : resulting values */
	char *srctype,								/* in : value type */
	DynTable *listobj,							/* in : objects id for srctype=LISTOBJ or srctype=FILTER */
	DynTable *srcval							/* in : source values / field expression */
){
	DynTable *id_form = NULL;
	DynTable *id_obj = NULL;
	DynTable selobj = {0};
	DynTable values = {0};
	QryBuild flt = {0};

	/* Check params */
	if(!res) RETURN_ERR_PARAM(NULL);
	if(!srctype || !strcmp(srctype, "_EVA_VALUE")) srctype = "";
	dyntab_free(res);

	/* Set base object & form depending on source type */
	if(!strcmp(srctype, "_EVA_SRC_FILTER") ||
		!strcmp(srctype, "_EVA_FILTER"))
	{
		if(qry_add_filter_forms(cntxt, &flt, NULL, listobj) ||
			qry_filter_objects(cntxt, &selobj, &flt)) STACK_ERROR;
		id_obj = &selobj;
	}
	else
		qry_parse_valtype(cntxt, srctype, listobj, &id_form, &id_obj);

	/* Set result depending on base object & values */
	if(!id_obj)
	{
		/* Copy fixed values to result */
		unsigned long i;
		if(srcval) for(i = 0; i < srcval->nbrows; i++)
			DYNTAB_ADD_CELL(res, i, 0, srcval, i, 0);
	}
	else if(!dyntab_sz(srcval, 0, 0))
	{
		/* Copy object id to result */
		unsigned long i;
		for(i = 0; i < id_obj->nbrows; i++)
			DYNTAB_ADD_CELL(res, i, 0, id_obj, i, 0)
	}
	else if(srcval)
	{
		/* Evaluate each expression & add to result */
		unsigned long i, j, k, idform = id_form ? DYNTAB_TOUL(id_form) : 0;
		for(k = 0; !k || k < id_obj->nbrows; k++) for(i = 0; i < srcval->nbrows; i++)
		{
			if(form_eval_fieldexpr(cntxt, &values, idform, DYNTAB_TOULRC(id_obj, k, 0),
					DYNTAB_VAL_SZ(srcval, i, 0), NULL, 0)) STACK_ERROR;
			for(j = 0; j < values.nbrows; j++) if(dyntab_sz(&values, j, 0))
				DYNTAB_ADD_CELL(res, res->nbrows, 0, &values, j, 0);
		}
	}

	RETURN_OK_CLEANUP;
}
#undef ERR_FUNCTION
#undef ERR_CLEANUP
