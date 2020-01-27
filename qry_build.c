/*********************************************************************
**        File : qry_build.c
** Description : functions for building SQL queries from filters and field expressions
**      Author : Alain BOUTE
**     Created : Aug 18 2001
*********************************************************************/

#include "eva.h"

#define RETURN_FILTER_ERROR(msg) RETURN_ERROR(msg, NULL)
#define EMPTY_NODE(node) (!(node)->field.nbrows && !(node)->cond && (node)->match == NoMatch && !node->modif)

/*********************************************************************
** Macro : GET_ATTR
** Description : retrieve values for a given field of current filter
*********************************************************************/
#define GET_ATTR(res, field) DYNTAB_FIELD1(&res, flt_data, field)

/*********************************************************************
** Function : qry_build_free_nodes
** Description : clean up filter nodes
*********************************************************************/
void qry_build_free_nodes(QryBuild *flt)
{
	unsigned long i;
	if(!flt) return;
	M_FREE(flt->select);
	M_FREE(flt->optselect);
	M_FREE(flt->join);
	M_FREE(flt->where);
	M_FREE(flt->groupfn);
	M_FREE(flt->having);
	M_FREE(flt->orderby);
	for(i = 0; i < sizeof(flt->node)/sizeof(flt->node[0]); i++)
	{
		DYNTAB_FREE(flt->node[i].field);
		DYNTAB_FREE(flt->node[i].value);
		DYNTAB_FREE(flt->node[i].idobjmatch);
		if(flt->node[i].whocr == flt->node[i].whodel) flt->node[i].whodel = NULL;
		M_FREE(flt->node[i].whocr);
		M_FREE(flt->node[i].whodel);
		M_FREE(flt->node[i].cond);
	}
	memset(flt->node, 0, sizeof(flt->node));
	flt->srctable = NULL;
	flt->srcjoin = 0;
	flt->nbjoin = 0;
	flt->valnode = NULL;
	flt->nbnode = 0;
	flt->b_userelobj = 0;
	flt->b_single_last_field = 0;
	flt->selidobj = NULL;
}

/*********************************************************************
** Function : qry_build_free
** Description : free memory alloc-ed for a filter
*********************************************************************/
void qry_build_free(QryBuild *flt)
{
	if(!flt) return;
	DYNTAB_FREE(flt->name);
	qry_build_free_nodes(flt);
	memset(flt, 0, sizeof(flt[0]));
}

/*********************************************************************
** Function : qry_parse_field_modifier
** Description : return modifier id for a field modifier
*********************************************************************/
FieldModifier qry_parse_field_modifier(	/* return : field modifier id */
	char *fm							/* in : field modifier */
){
	return (!(fm && *fm) ? F_None : 
				(!strcmp(fm, "IdObj") || !strcmp(fm, "Obj")) ? F_Obj :  
				(!strcmp(fm, "IdField") || !strcmp(fm, "Field")) ? F_Field : 
				(!strcmp(fm, "IdValue") || !strcmp(fm, "Value")) ? F_Value : 
				!strcmp(fm, "Num") ? F_Num : 
				!strcmp(fm, "Line") ? F_Line : 
				(!strcmp(fm, "IdRelObj") || !strcmp(fm, "RelObj")) ? F_RelObj : 
				!strcmp(fm, "DateCr") ? F_DateCr : 
				(!strcmp(fm, "IdWhoCr") || !strcmp(fm, "WhoCr")) ? F_WhoCr : 
				!strcmp(fm, "DateDel") ? F_DateDel : 
				(!strcmp(fm, "IdWhoDel") || !strcmp(fm, "WhoDel")) ? F_WhoDel : 
				F_None);
}

/*********************************************************************
** Function : qry_copy_filter
** Description : copy a filter to another
*********************************************************************/
#define ERR_FUNCTION "qry_copy_filter"
#define ERR_CLEANUP
int qry_copy_filter(				/* return : 0 on success, other on error */
	EVA_context *cntxt,				/* in : execution context data */
	QryBuild *dest,					/* out : destination filter */
	QryBuild *src					/* in/out : source filter */
){
	unsigned long i, j;
	if(!src || !dest) RETURN_OK;
	qry_build_free(dest);
	memcpy(dest, src, sizeof(dest[0]));
	for(j = 0; j < src->name.nbrows; j++) DYNTAB_ADD_CELL(&dest->name, j, 0, &src->name, j, 0);
#define COPY_BUF(buf) dest->buf = NULL; DYNBUF_ADD_BUF(&dest->buf, src->buf, NO_CONV)
#define COPY_TAB(tab) \
				memset(&dest->tab, 0, sizeof(dest->tab)); \
				for(j = 0; j < src->tab.nbrows; j++) \
					DYNTAB_ADD_CELL(&dest->tab, j, 0, &src->tab, j, 0)
	COPY_TAB(name);
	COPY_BUF(select);
	COPY_BUF(optselect);
	COPY_BUF(join);
	COPY_BUF(where);
	COPY_BUF(groupfn);
	COPY_BUF(having);
	COPY_BUF(orderby);
	for(i = 0; i < sizeof(dest->node)/sizeof(dest->node[0]); i++)
	{
		COPY_TAB(node[i].field);
		COPY_TAB(node[i].value);
		COPY_TAB(node[i].idobjmatch);
		COPY_BUF(node[i].whocr);
		COPY_BUF(node[i].whodel);
		COPY_BUF(node[i].cond);
	}
#undef COPY_BUF

	RETURN_OK_CLEANUP;
}
#undef ERR_FUNCTION
#undef ERR_CLEANUP

/*********************************************************************
** Function : qry_add_valnode_field
** Description : handle SELECT and JOIN clauses for a field modifier
*********************************************************************/
#define ERR_FUNCTION "qry_add_valnode_field"
#define ERR_CLEANUP
					
int qry_add_valnode_field(			/* return : 0 on success, other on error */
	EVA_context *cntxt,					/* in : execution context data */
	QryBuild *flt,						/* in/out : filter calculation data */
	FieldModifier modif					/* in : modifier to use for selected value */
){
	unsigned long valjoin = flt->valnode->curjoin;

	/* Optimize modifier */
	if(modif == F_None)
	{
		if(flt->valnode > flt->node && flt->node[flt->valnode->srcjoin].rel == RelReverse)
			modif = F_Obj;
		else if(flt->groupfn && strchr("AS", *flt->groupfn->data))
			modif = F_Value;
	}
	
	/* Parse modifier */
	if(flt->groupfn) DYNBUF_ADD_BUF(&flt->select, flt->groupfn, NO_CONV);
	DYNBUF_ADD_STR(&flt->select, "(");
	switch(modif)
	{
	case F_WhoCr: DYNBUF_ADD3_INT(&flt->select, "TLink", valjoin, ".IdWhoCr"); break;
	case F_DateCr: DYNBUF_ADD3_INT(&flt->select, "TLink", valjoin, ".DateCr"); break;
	case F_WhoDel: DYNBUF_ADD3_INT(&flt->select, "TLink", valjoin, ".IdDateDel"); break;
	case F_DateDel: DYNBUF_ADD3_INT(&flt->select, "TLink", valjoin, ".DateDel"); break;
	case F_RelObj: DYNBUF_ADD3_INT(&flt->select, "TLink", valjoin, ".IdRelObj"); break;
	case F_Obj: DYNBUF_ADD3_INT(&flt->select, "TLink", valjoin, ".IdObj"); break;
	case F_Num: DYNBUF_ADD3_INT(&flt->select, "TLink", valjoin, ".Num"); break;
	case F_Line: DYNBUF_ADD3_INT(&flt->select, "TLink", valjoin, ".Line"); break;
	case F_Value:
		if(!flt->valnode->b_joinval)
		{
			DYNBUF_ADD3_INT(&flt->join, "INNER JOIN TVal AS TVal", valjoin, " ON TVal")
			DYNBUF_ADD_INT(&flt->join, valjoin)
			DYNBUF_ADD3_INT(&flt->join, ".IdValue=TLink", valjoin, ".IdValue \n")
			flt->valnode->b_joinval = 1;
		}
		DYNBUF_ADD3_INT(&flt->select, "TVal", valjoin, ".TxtValue");
		break;
	case F_Field:
		if(!flt->valnode->b_joinfld)
		{
			DYNBUF_ADD3_INT(&flt->join, "INNER JOIN TVal AS TField", valjoin, " ON TField")
			DYNBUF_ADD_INT(&flt->join, valjoin)
			DYNBUF_ADD3_INT(&flt->join, ".IdValue=TLink", valjoin, ".IdField \n")
			flt->valnode->b_joinfld = 1;
		}
		DYNBUF_ADD3_INT(&flt->select, "TField", valjoin, ".TxtValue");
		break;
	case F_None:
		if(!flt->valnode->b_joinval)
		{
			DYNBUF_ADD3_INT(&flt->join, "LEFT JOIN TVal AS TVal", valjoin, " ON TVal")
			DYNBUF_ADD_INT(&flt->join, valjoin)
			DYNBUF_ADD3_INT(&flt->join, ".IdValue=TLink", valjoin, ".IdValue \n")
			flt->valnode->b_joinval = 1;
		}
		DYNBUF_ADD3_INT(&flt->select, "IF(TVal", valjoin, ".TxtValue IS NULL,");
		DYNBUF_ADD3_INT(&flt->select, "TLink", valjoin, ".IdRelObj,");
		DYNBUF_ADD3_INT(&flt->select, "TVal", valjoin, ".TxtValue)");
		break;
	default:
		RETURN_FILTER_ERROR("Invalid value modifier");
	}
	DYNBUF_ADD_STR(&flt->select, ")");

	RETURN_OK_CLEANUP;
}
#undef ERR_FUNCTION
#undef ERR_CLEANUP

/*********************************************************************
** Function : qry_add_create_del_filter
** Description : add value creation & deletion criteria in a filter
*********************************************************************/
#define ERR_FUNCTION "qry_add_create_del_filter"
#define ERR_CLEANUP	DYNTAB_FREE(usergroup)
					
int qry_add_create_del_filter(			/* return : 0 on success, other on error */
	EVA_context *cntxt,					/* in : execution context data */
	QryBuild *flt,						/* in/out : filter calculation data */
	DynTable *flt_data					/* in : object data of filter */
){
	char *flthisto = DYNTAB_FIELD_VAL(flt_data, USE_OLD_VALUES);
	char *fltwhocr = DYNTAB_FIELD_VAL(flt_data, FILTER_IDWHOCR);
	DynTable usergroup = { 0 };
	DynTable *id_obj = (!strcmp(fltwhocr, "_EVA_CURRENTUSER") ||
						!strcmp(fltwhocr, "_EVA_CURRENT_USER")) ? &cntxt->id_user : 
						!strcmp(fltwhocr, "_EVA_CURRENTOBJ") ? &cntxt->form->id_obj : NULL;
	QryBuilNode *node = flt->node + flt->nbnode;

	if(*flthisto)
	{
		strcpy(node->datemax, cntxt->timestamp);
	}

	if(*fltwhocr && id_obj)
	{
		if(qry_values_list(cntxt, id_obj, 0, &node->whocr)) STACK_ERROR;
		if(*flthisto)
		{
			node->whodel = node->whocr;
		}
	}
	RETURN_OK_CLEANUP;
}
#undef ERR_FUNCTION
#undef ERR_CLEANUP

/*********************************************************************
** Function : qry_add_filterlist
** Description : add a list of AND combined conditions to a filter
*********************************************************************/
#define ERR_FUNCTION "qry_add_filterlist"
#define ERR_CLEANUP DYNTAB_FREE(data)
int qry_add_filterlist(						/* return : 0 on success, other on error */
	EVA_context *cntxt,					/* in/out : execution context data */
	QryBuild *flt,						/* in/out : filter build data */
	DynTable *fltlist					/* in : list of objects Ids (conditional expressions) */
){
	DynTable data = {0};

	/* Process each filter */
	unsigned long i, srcjoin = flt->srcjoin, curjoin = flt->nbnode;
	for(i = 0; i < fltlist->nbrows; i++)
	{
		flt->srcjoin = srcjoin;
		if(qry_obj_field(cntxt, &data, DYNTAB_TOULRC(fltlist, i, 0), NULL) ||
			qry_parse_filter_nodes(cntxt, flt, &data)) STACK_ERROR;

		/* Handle source join in case of direct relation for previous node */
		if(i == 0 && flt->node[srcjoin].rel == RelDirect) srcjoin = curjoin;
	}
	flt->srcjoin = srcjoin;
	RETURN_OK_CLEANUP;
}
#undef ERR_FUNCTION
#undef ERR_CLEANUP

/*********************************************************************
** Function : qry_add_filter_forms
** Description : build filter for objects matching form & filter condition
*********************************************************************/
#define ERR_FUNCTION "qry_add_filter_forms"
#define ERR_CLEANUP DYNTAB_FREE(data)
int qry_add_filter_forms(					/* return : 0 on success, other on error */
	EVA_context *cntxt,						/* in/out : execution context data */
	QryBuild *flt,							/* in/out : filter data */
	DynTable *forms,						/* in : forms condition */
	DynTable *filters						/* in : filter conditions */
){
	DynTable data = {0};

	/* Handle formstamp condition */
	if(forms && forms->nbrows)
	{
		DYNTAB_ADD_TXTID(&data, 0, 0, "_EVA_FORMSTAMP", cntxt->val_FORMSTAMP);
		if(qry_add_filter(cntxt, flt, RelNone, &data, RelList, forms)) STACK_ERROR;
		if(flt->node[flt->srcjoin].rel == RelDirect) flt->srcjoin = flt->nbnode - 1;
	}

	/* Handle filter condition */
	if(filters && qry_add_filterlist(cntxt, flt, filters)) STACK_ERROR;
	RETURN_OK_CLEANUP;
}
#undef ERR_FUNCTION
#undef ERR_CLEANUP

/*********************************************************************
** Function : qry_add_filter_simple_txt
** Description : build filter for simple text condition
*********************************************************************/
#define ERR_FUNCTION "qry_add_filter_simple_txt"
#define ERR_CLEANUP
int qry_add_filter_simple_txt(				/* return : 0 on success, other on error */
	EVA_context *cntxt,						/* in/out : execution context data */
	QryBuild *flt,							/* in/out : filter data */
	RelationMode rel,						/* in : how is build the join */
	char *field,							/* in : search fields list (comma separated) */
	MatchMode matchmode,					/* in : how is searched value ? */
	char *value								/* in : search value */
){
	QryBuilNode *node = flt->node + flt->nbnode;
	node->rel = rel;
	if(dyntab_from_list(&node->field, field, strlen(field), ",", 0, 1)) STACK_ERROR;
	node->match = matchmode;
	DYNTAB_ADD(&node->value, 0, 0, value, 0, NO_CONV);
	flt->nbnode++;
	RETURN_OK_CLEANUP;
}
#undef ERR_FUNCTION
#undef ERR_CLEANUP

/*********************************************************************
** Function : qry_add_filter_simple_int
** Description : build filter for simple int condition
*********************************************************************/
#define ERR_FUNCTION "qry_add_filter_simple_int"
#define ERR_CLEANUP
int qry_add_filter_simple_int(				/* return : 0 on success, other on error */
	EVA_context *cntxt,						/* in/out : execution context data */
	QryBuild *flt,							/* in/out : filter data */
	RelationMode rel,						/* in : how is build the join */
	char *field,							/* in : search fields list (comma separated) */
	MatchMode matchmode,					/* in : how is searched value ? */
	unsigned long value						/* in : search value */
){
	QryBuilNode *node = flt->node + flt->nbnode;
	node->rel = rel;
	if(dyntab_from_list(&node->field, field, strlen(field), ",", 0, 1)) STACK_ERROR;
	node->match = matchmode;
	DYNTAB_ADD_INT(&node->value, 0, 0, value);
	flt->nbnode++;
	RETURN_OK_CLEANUP;
}
#undef ERR_FUNCTION
#undef ERR_CLEANUP

/*********************************************************************
** Function : qry_add_filter
** Description : add a field / value & relation condition to a filter
*********************************************************************/
#define ERR_FUNCTION "qry_add_filter"
#define ERR_CLEANUP 
int qry_add_filter(						/* return : 0 on success, other on error */
	EVA_context *cntxt,					/* in/out : execution context data */
	QryBuild *flt,						/* in/out : filter build data */
	RelationMode joinmode,				/* in : how is build the join */
	DynTable *fltfld,					/* in : search fields list */
	MatchMode matchmode,				/* in : how is searched value ? */
	DynTable *fltval					/* in : search values list */
){
	QryBuilNode *node = flt->node + flt->nbnode;
	unsigned long i;

	/* Store fields */
	if(fltfld) for(i = 0; i < fltfld->nbrows; i++)
		if(dyntab_sz(fltfld, i, 0))
			DYNTAB_ADD_CELL(&node->field, node->field.nbrows, 0, fltfld, i, 0);

	/* Store values */
	if(fltval) for(i = 0; i < fltval->nbrows; i++)
		if(dyntab_sz(fltval, i, 0))
			DYNTAB_ADD_CELL(&node->value, node->value.nbrows, 0, fltval, i, 0);
	
	/* Store relation & match mode */
	node->rel = joinmode;
	node->match = matchmode;
	node->srcjoin = flt->srcjoin;
	flt->nbnode++;

	RETURN_OK_CLEANUP;
}
#undef ERR_FUNCTION
#undef ERR_CLEANUP

/*********************************************************************
** Function : qry_eval_sqlexpr_var
** Description : replace variables by their values in a mixed SQL / fields expression
*********************************************************************/
#define ERR_FUNCTION "qry_eval_sqlexpr_var"
#define ERR_CLEANUP M_FREE(sql); \
					DYNTAB_FREE(valtyp); \
					DYNTAB_FREE(valexpr); \
					DYNTAB_FREE(valobj); \
					DYNTAB_FREE(valflt); \
					DYNTAB_FREE(valfmt); \
					DYNTAB_FREE(valnul); \
					DYNTAB_FREE(listobj); \
					DYNTAB_FREE(srcval); \
					DYNTAB_FREE(data)
int qry_eval_sqlexpr_var(				/* return : 0 on success, other on error */
	EVA_context *cntxt,					/* in/out : execution context data */
	DynBuffer **sqlexpr,				/* out : SQL expression with variables evaluated */
	char *expr,							/* in : SQL expression to process */
	DynTable *vardata					/* in : variables definition data */
){
	DynBuffer *sql = NULL;
	DynTable valtyp = {0};
	DynTable valexpr = {0};
	DynTable valobj = {0};
	DynTable valflt = {0};
	DynTable valfmt = {0};
	DynTable valnul = {0};
	DynTable listobj = {0};
	DynTable srcval = {0};
	DynTable data = {0};
	char *next;

	/* Read variables definitions */
	if(!expr || !*expr) RETURN_OK;
	DYNTAB_FIELD_TAB(&valtyp, vardata, VAR_SRC);
	DYNTAB_FIELD_TAB(&valexpr, vardata, VAR_EXPR);
	DYNTAB_FIELD_TAB(&valobj, vardata, VAR_LISTOBJ);
	DYNTAB_FIELD_TAB(&valflt, vardata, SRC_FILTER);
	DYNTAB_FIELD_TAB(&valfmt, vardata, VAR_FMT);
	DYNTAB_FIELD_TAB(&valnul, vardata, VAR_NULL);

	/* Evaluate variable expressions in brackets */
	FOR_EACH_BRACKET
	{
		/* If brackets hold a a specific object symbol [#NAME.FIELD] */
		if(fieldbeg[1] == '#')
		{
			/* Parse symbol name */
			unsigned long id = 0;
			char *objsym = NULL;
			char *beg = fieldbeg + 2;
#define PARSE_SYM_OBJ(sym, obj) if(!strncmp(sym, beg, sizeof(sym) - 1)) { objsym = sym; beg += sizeof(sym) - 1; id = obj; if(*beg == '.') beg++; }
#define PARSE_SYM_VAL(sym, v) if(!strncmp(sym, beg, sizeof(sym) - 1)) { objsym = ""; dyntab_free(&data); DYNTAB_ADD(&data, 0, 0, v, 0, NO_CONV); }
			PARSE_SYM_OBJ("CUROBJ", DYNTAB_TOUL(&cntxt->form->id_obj)) else
			PARSE_SYM_OBJ("CURFORM", DYNTAB_TOUL(&cntxt->form->id_form))
			PARSE_SYM_OBJ("USER", DYNTAB_TOUL(&cntxt->id_user)) else
			PARSE_SYM_OBJ("SESSION", DYNTAB_TOUL(&cntxt->session)) else
			PARSE_SYM_OBJ("SRVCNF", DYNTAB_TOUL(&cntxt->id_cnf)) else
			PARSE_SYM_VAL("SRVNAME", cntxt->dbname) else
			PARSE_SYM_VAL("SRVADR", getenv("SERVER_NAME"))
#undef PARSE_SYM_OBJ
#undef PARSE_SYM_VAL

			if(fieldbeg > next) DYNBUF_ADD(sqlexpr, next, fieldbeg - next, NO_CONV);
			if(!objsym)
			{
				/* Invalid symbol : warnig message */
				cntxt->err.text = "Invalid symbol";
				DYNBUF_ADD3(&cntxt->err.detail, "Symbol : ", fieldbeg, fieldend - fieldbeg + 1, NO_CONV, "\nExpression :\n");
				DYNBUF_ADD(&cntxt->err.detail, expr, 0, NO_CONV);
				CLEAR_ERROR;
				DYNBUF_ADD_STR(sqlexpr, "''");
			}
			else if(!*objsym)
			{
				/* Raw value symbol : output */
				DYNBUF_ADD3_CELL(sqlexpr, "'", &data, 0, 0, NO_CONV, "'");
			}
			else if(beg < fieldend && form_eval_fieldexpr(cntxt, &data, 
										!strcmp(objsym, "CUROBJ") ? DYNTAB_TOUL(&cntxt->form->id_form) : 0, id,
										beg, fieldend - beg, NULL, 0))
			{
				if(!objsym) cntxt->err.text = "Invalid symbol";
				CLEAR_ERROR;
				DYNBUF_ADD_STR(sqlexpr, "NULL");
			}
			else
			{
				/* Replace brackets with variable values in SQL expression */
				if(beg >= fieldend) DYNBUF_ADD_INT(sqlexpr, id)
				else if(qry_values_list(cntxt, &data, 5, sqlexpr)) STACK_ERROR;
			}
		}

		/* If brackets hold a variable index */
		else if(fieldbeg[1] == '%')
		{
			/* Check if already evaluated */
			char *end, *typ, *val;
			unsigned long line = strtoul(fieldbeg + 2, &end, 10) - 1;
			typ = dyntab_val(&valtyp, line, 0);
			val = dyntab_val(&valtyp, line, 1);

			/* Evaluate variable if not done yet */
			if(!*val)
			{
				/* Copy variable definition from given line of variables table 
					to form_eval_valtype parameters (33 is for transposition in case of multiple values) */
				dyntab_free(&srcval);
				dyntab_free(&listobj);
				if(dyntab_from_tab(&srcval, 0, 0, &valexpr, line, 0, line + 1, valexpr.nbcols, 33) ||
					(!strcmp(typ, "_EVA_SRC_FILTER") ?
						dyntab_from_tab(&listobj, 0, 0, &valflt, line, 0, line + 1, valflt.nbcols, 33) :
						dyntab_from_tab(&listobj, 0, 0, &valobj, line, 0, line + 1, valobj.nbcols, 33)))
					RETURN_ERR_MEMORY;

				/* Evaluate variable & store in valtyp */
				M_FREE(sql);
				if(form_eval_valtype(cntxt, &data, typ, &listobj, &srcval))
				{
					CLEAR_ERROR;
					DYNBUF_ADD_STR(&sql, "NULL");
				}
				else
					if(qry_values_list(cntxt, &data,
						!strcmp(typ, "_EVA_VALUEID") ? 3 :
						dyntab_sz(&valfmt, line, 0) ? 0 : 5, &sql)) STACK_ERROR;
				val = sql ? sql->data : "";
			}
			/* Replace brackets with variable values in SQL expression */
			if(fieldbeg > next) DYNBUF_ADD(sqlexpr, next, fieldbeg - next, NO_CONV);
			DYNBUF_ADD(sqlexpr, val, 0, NO_CONV);
		}
		else
		{
			/* Field expression : leave unmodified */
			DYNBUF_ADD(sqlexpr, next, fieldend - next + 1, NO_CONV);
		}
	}
	END_EACH_BRACKET
	if(*next) DYNBUF_ADD(sqlexpr, next, 0, NO_CONV);

	RETURN_OK_CLEANUP;
}
#undef ERR_FUNCTION
#undef ERR_CLEANUP

/*********************************************************************
** Function : qry_build_sqlexpr
** Description : build SQL query for a mixed SQL / fields expression
*********************************************************************/
#define ERR_FUNCTION "qry_build_sqlexpr"
#define ERR_CLEANUP M_FREE(sql); \
					M_FREE(exprbuf); \
					DYNTAB_FREE(valtyp); \
					DYNTAB_FREE(valexpr); \
					DYNTAB_FREE(valobj); \
					DYNTAB_FREE(valflt); \
					DYNTAB_FREE(valfmt); \
					DYNTAB_FREE(valnul); \
					DYNTAB_FREE(listobj); \
					DYNTAB_FREE(srcval); \
					DYNTAB_FREE(tables); \
					DYNTAB_FREE(data); \
					qry_build_free(&flt)
int qry_build_sqlexpr(					/* return : 0 on success, other on error */
	EVA_context *cntxt,					/* in/out : execution context data */
	DynBuffer **member,					/* out : member expression for SELECT statement */
	DynBuffer **join,					/* out : JOIN statement */
	char *expr,							/* in : expression to evaluate */
	char *srctbl,						/* in : source table name - IdObj column contains objects Ids
												or list of comma separated IdObj (TODO) */
	DynTable *vardata,					/* in : variables definitions */
	unsigned long *nbtemp				/* in : options bitmask
											bit 0 : do not use srctbl as base for values if set
											bit 1 : always include Line value if set
										  out : # of temporary tables created for values */
){
	DynBuffer *sql = NULL;
	DynBuffer *exprbuf = NULL;
	DynTable valtyp = {0};
	DynTable valexpr = {0};
	DynTable valobj = {0};
	DynTable valflt = {0};
	DynTable valfmt = {0};
	DynTable valnul = {0};
	DynTable listobj = {0};
	DynTable srcval = {0};
	DynTable empty = {0};
	DynTable tables = {0};
	DynTable data = {0};
	QryBuild flt = {0};
	char printbuf[1024];
	unsigned long i, j = 0;
	char *next;
	DynTableCell *fld = NULL;
	int b_srcobj = nbtemp && *nbtemp & 1;
	int b_line = nbtemp && *nbtemp & 2;

	/* Evaluate variables in expression */
	if(qry_eval_sqlexpr_var(cntxt, &exprbuf, expr, vardata)) STACK_ERROR;
	expr = exprbuf->data;

	/* Locate expressions in brackets & prepare values tables definitions */
	FOR_EACH_BRACKET
	{
		/* Locate last modifier in field if present */
		char *field = fieldbeg + 1;
		size_t szfield = fieldend - fieldbeg  -1, szmodif = 0;
		char *paropn = strchr(field, '(');
		int b_groupfn = (size_t)(paropn - field) < szfield;
		char *modif = field + szfield;
		unsigned long irow, icol = 0, ibase = 0;
		if(!b_groupfn)
		{
			while(modif >= field && !strchr(".<->()", *modif)) modif--;
			if(modif < field || *modif != '.') modif = field + szfield;
			else szmodif = szfield - (modif - field);
		}

		/* Search for same field in tables */
		for(irow = 0; irow < tables.nbrows &&
				dyntab_txt_cmp(modif == field ? "" : field, modif - field, &tables, irow, 0);
			irow++);

		/* Add required values if applicable */
		if(!b_groupfn && irow == tables.nbrows)
		{
			if(b_line) 
			{
				DYNTAB_ADD_CELLP(&tables, irow, 0, NULL);
				fld = dyntab_cell(&tables, irow, 0);
				fld->len = modif - field;
				if(modif > field) M_STRDUP(fld->txt, field, modif - field);
				fld->b_dontfreetxt = 1;
				fld->field = "Line";
				fld->b_dontfreefield = 1;
			}
		}

		/* Look for first available column position */
		if(irow < tables.nbrows)
			for(icol = 0; icol < tables.nbcols && dyntab_cell(&tables, irow, icol)->txt; icol++)
			{
				char *m = dyntab_cell(&tables, irow, icol)->field;

				/* Memorize first other bracket with same modifier */
				if(!ibase && (b_groupfn || (szmodif ? m && !strncmp(modif + 1, m, szmodif - 1) : !m)))
					ibase = icol + 1;
			}

		/* Store field expression in first available position */
		DYNTAB_ADD_CELLP(&tables, irow, icol, NULL);
		fld = dyntab_cell(&tables, irow, icol);
		fld->len = modif - field;
		fld->txt = field;
		fld->b_dontfreetxt = 1;
		if(szmodif) M_STRDUP(fld->field, modif + 1, szmodif - 1);
		fld->col = ibase;
	}
	END_EACH_BRACKET

	/* Build temporary values tables */
	for(i = 0; i < tables.nbrows; i++)
	{
		DynTableCell *fld = dyntab_cell(&tables, i, 0);

		/* Parse field expression */
		M_FREE(sql);
		qry_build_free(&flt);
		if(b_srcobj) flt.srctable = srctbl;
		DYNBUF_ADD3_INT(&sql,  
			"-- qry_build_sqlexpr - build values table V", i, "\n");
		DYNBUF_ADD3_INT(&sql,  
			"CREATE TEMPORARY TABLE V", i, "\n");
		if(qry_parse_fieldexpr_nodes(cntxt, fld->txt, fld->len, &flt)) STACK_ERROR;
		if(qry_build_clauses(cntxt, &flt, 1)) STACK_ERROR;
			
		/* If group function is used */
		if(flt.groupfn)
		{
			/* Add select members for value & NULL modifiers */
			if(qry_add_valnode_field(cntxt, &flt, F_None)) STACK_ERROR;
			DYNBUF_ADD_STR(&flt.select, " AS Val");
			if(b_line) DYNBUF_ADD_STR(&flt.select, ",NULL AS Line");
		}
		/* Else : Add select members for field modifiers */
		else for(j = 0; j < tables.nbcols; j++)
		{
			fld = dyntab_cell(&tables, i, j);
			if(!fld->txt) break;
			if(fld->col) continue;
			if(flt.select) DYNBUF_ADD_STR(&flt.select, ",");
			if(qry_add_valnode_field(cntxt, &flt, qry_parse_field_modifier(fld->field))) STACK_ERROR;
			DYNBUF_ADD3(&flt.select, " AS ", fld->field ? fld->field : "Val", 0, NO_CONV, "");
		}
		flt.optselect = flt.select;
		flt.select = NULL;

		/* Build & exec query for values table */
		if(qry_build_flt_select(cntxt, &sql, &empty, &flt, 0, 0)) STACK_ERROR;
		if(sql_exec_query(cntxt, sql->data))
		{
			CLEAR_ERROR;
			DYNBUF_ADD_STR(member, "NULL");
		} 
		else
		{
			snprintf(add_sz_str(printbuf), "V%u", i);
			if(cntxt->sql_trace) put_debug_sqltable(cntxt, printbuf);
			else if(cntxt->debug & DEBUG_SQL_SLOW && cntxt->sql_restime > 0.03)
				err_print_filter(&cntxt->debug_msg, &flt);
		}

		/* Add index to values table */
		snprintf(add_sz_str(printbuf), "ALTER TABLE V%u ADD INDEX (IdObj)", i);
		if(sql_exec_query(cntxt, printbuf)) STACK_ERROR;
	
		/* Add join clause on values table */
		dynbuf_print3(join, "LEFT JOIN V%u ON V%u.IdObj=%s.IdObj \n", i, i, srctbl);
	}

	/* Evaluate expressions in brackets & build select statement */
	FOR_EACH_BRACKET
	{
		/* Search for corresponding table & value modifier */
		for(i = 0; i < tables.nbrows; i++)
		{
			for(j = 0; j < tables.nbcols; j++)
			{
				fld = dyntab_cell(&tables, i, j);
				if(fld->txt == fieldbeg + 1)
				{
					if(fld->col) j = fld->col - 1;
					break;
				}
			}
			if(fld->txt == fieldbeg + 1) break;
		}
		if(!fld || fld->txt != fieldbeg + 1) RETURN_ERROR("Program error", NULL);

		/* Replace brackets with values table name */
		if(fieldbeg > next) DYNBUF_ADD(member, next, fieldbeg - next, NO_CONV);
		dynbuf_print4(member, "IF(V%lu.%s IS NULL,'',V%lu.%s)", i, fld->field ? fld->field : "Val", i, fld->field ? fld->field : "Val");
	}
	END_EACH_BRACKET
	if(*next) DYNBUF_ADD(member, next, 0, NO_CONV);

	*nbtemp = tables.nbrows;

	RETURN_OK_CLEANUP;
}
#undef ERR_FUNCTION
#undef ERR_CLEANUP

/*********************************************************************
** Function : qry_eval_sql_fieldexpr
** Description : return results of a mixed SQL / fields expression
*********************************************************************/
#define ERR_FUNCTION "qry_eval_sql_fieldexpr"
#define ERR_CLEANUP M_FREE(sql); \
					M_FREE(member); \
					M_FREE(join)
int qry_eval_sql_fieldexpr(				/* return : 0 on success, other on error */
	EVA_context *cntxt,					/* in/out : execution context data */
	char *dsttbl,						/* in : destination table (IdObj,Val,Line) */
	char *expr,							/* in : SQL expression to evaluate */
	char *srctbl,						/* in : source table name - IdObj column contains objects Ids
												or list of comma separated IdObj (TODO) */
	DynTable *vardata					/* in : variables definitions */
){
	DynBuffer *sql = NULL;
	DynBuffer *member = NULL;
	DynBuffer *join = NULL;
	char printbuf[1024];
	unsigned long nbtemp = 1, i;
	int b_nosrctbl = 0;

	/* Prepare base table if applicable */
	if(srctbl && !strcmp(srctbl, "TLink")) srctbl = NULL;
	if(!srctbl)
	{
		srctbl = "TmpSQLExpr";
		nbtemp = 0;
		b_nosrctbl = 1;
	}

	/* Build SQL query */
	if(qry_build_sqlexpr(cntxt, &member, &join, expr, srctbl, vardata, &nbtemp)) STACK_ERROR;
	DYNBUF_ADD3(&sql,
		"-- qry_eval_sql_fieldexpr - evaluate parsed expression\n"
		"CREATE TEMPORARY TABLE ", dsttbl, 0, NO_CONV, "\n");
	DYNBUF_ADD3(&sql, 
		"SELECT DISTINCT ", srctbl, 0, NO_CONV, ".IdObj AS IdObj");
	DYNBUF_ADD3_BUF(&sql, ",", member, NO_CONV, " AS Val, NULL AS Line \n");
	DYNBUF_ADD3(&sql, 
		"FROM ", srctbl, 0, NO_CONV, "\n");
	DYNBUF_ADD_BUF(&sql, join, NO_CONV);

	/* Create base table from values tables if applicable */
	if(b_nosrctbl)
	{
		if(sql_exec_query(cntxt, "CREATE TABLE TmpSQLExpr (IdObj INT NOT NULL PRIMARY KEY) TYPE=HEAP\n")) STACK_ERROR;
		for(i = 0; i < nbtemp; i++)
		{
			snprintf(add_sz_str(printbuf), "INSERT IGNORE TmpSQLExpr (IdObj) SELECT DISTINCT IdObj FROM V%u", i);
			if(sql_exec_query(cntxt, printbuf)) STACK_ERROR;
		}
	}

	/* Exec query & get result if applicable */
	if(sql_exec_query(cntxt, sql->data)) STACK_ERROR;

	/* Drop temporary tables */
	for(i = 0; i < nbtemp; i++)
	{
		snprintf(add_sz_str(printbuf), "V%u", i);
		sql_drop_table(cntxt, printbuf);
	}
	sql_drop_table(cntxt, "TmpSQLExpr");

	RETURN_OK_CLEANUP;
}
#undef ERR_FUNCTION
#undef ERR_CLEANUP

/*********************************************************************
** Function : qry_filter_sql_fieldexpr
** Description : select objects matching a mixed SQL / fields expression
*********************************************************************/
#define ERR_FUNCTION "qry_filter_sql_fieldexpr"
#define ERR_CLEANUP M_FREE(where); \
					M_FREE(join); \
					M_FREE(sql); \
					DYNTAB_FREE(valtyp); \
					DYNTAB_FREE(valexpr); \
					DYNTAB_FREE(valobj); \
					DYNTAB_FREE(valflt); \
					DYNTAB_FREE(valfmt); \
					DYNTAB_FREE(valnul); \
					DYNTAB_FREE(listobj); \
					DYNTAB_FREE(srcval); \
					DYNTAB_FREE(tables); \
					qry_build_free(&flt)
int qry_filter_sql_fieldexpr(			/* return : 0 on success, other on error */
	EVA_context *cntxt,					/* in/out : execution context data */
	DynTable *res,						/* in/out : matched objects list - if NULL output to table ResSqlCond */
	char *expr,							/* in : SQL expression to evaluate */
	char *srcobj0,						/* in : source table name - IdObj column contains objects Ids
												or list of comma separated IdObj (TODO) */
	DynTable *vardata					/* in : variables definitions */
){
	DynBuffer *where = NULL;
	DynBuffer *join = NULL;
	DynBuffer *sql = NULL;
	DynTable valtyp = {0};
	DynTable valexpr = {0};
	DynTable valobj = {0};
	DynTable valflt = {0};
	DynTable valfmt = {0};
	DynTable valnul = {0};
	DynTable listobj = {0};
	DynTable srcval = {0};
	DynTable empty = {0};
	DynTable tables = {0};
	QryBuild flt = {0};
	unsigned long i, j = 0;
	char printbuf[1024];
	char *next;
	char *srcobj = srcobj0;
	DynTableCell *fld = NULL;
	int b_srcobj = 0;

	/* Prepare select statement */
	if(!srcobj || !*srcobj || !strcmp(srcobj, "TLink"))
	{
		snprintf(add_sz_str(printbuf), "CREATE TEMPORARY TABLE TmpCondExpr TYPE=HEAP\n"
									"SELECT DISTINCT IdObj FROM TLink");
		if(sql_exec_query(cntxt, printbuf) ||
			sql_exec_query(cntxt, "ALTER TABLE TmpCondExpr ADD INDEX (IdObj)")) STACK_ERROR;
		srcobj = "TmpCondExpr";
		b_srcobj = 0;
	}
	else if(!b_srcobj)
	{
		snprintf(add_sz_str(printbuf), "SELECT DISTINCT IdObj FROM %s", srcobj);
		if(sql_exec_query(cntxt, printbuf) || sql_get_table(cntxt, &empty, 2)) STACK_ERROR;
	}

	if(!res)
	{
		if(sql_exec_query(cntxt, "CREATE TABLE ResSqlCond (IdObj INT) TYPE=HEAP\n")) STACK_ERROR;
		DYNBUF_ADD_STR(&join, "INSERT INTO ResSqlCond\n");
	}
	dynbuf_print2(&join, 
		"-- qry_filter_sql_fieldexpr - select matching objects\n"
		"SELECT DISTINCT %s.IdObj FROM %s \n", srcobj, srcobj);

	/* Read variables definitions */
	DYNTAB_FIELD_TAB(&valtyp, vardata, VAR_SRC);
	DYNTAB_FIELD_TAB(&valexpr, vardata, VAR_EXPR);
	DYNTAB_FIELD_TAB(&valobj, vardata, VAR_LISTOBJ);
	DYNTAB_FIELD_TAB(&valflt, vardata, SRC_FILTER);
	DYNTAB_FIELD_TAB(&valfmt, vardata, VAR_FMT);
	DYNTAB_FIELD_TAB(&valnul, vardata, VAR_NULL);

	/* Parse field expressions */
	FOR_EACH_BRACKET
	{
		/* If brackets hold a field expression */
		if(!strchr("%#", fieldbeg[1]))
		{
			/* Locate last modifier in field if present */
			char *field = fieldbeg + 1;
			size_t szfield = fieldend - fieldbeg  -1;
			char *modif = field + szfield;
			unsigned long irow, icol = 0, ibase = 0;
			while(modif >= field && !strchr(".<->()", *modif)) modif--;
			if(modif < field || *modif != '.') modif = field + szfield;

			/* Search for same field in tables */
			for(irow = 0; irow < tables.nbrows &&
					dyntab_txt_cmp(modif == field ? "" : field, modif - field, &tables, irow, 0);
				irow++);

			/* Store field expression in first available position */
			if(irow < tables.nbrows)
				for(icol = 0; icol < tables.nbcols && dyntab_cell(&tables, irow, icol)->txt; icol++)
					if(!ibase && !dyntab_txt_cmp(field, szfield, &tables, irow, icol)) ibase = icol + 1;
			DYNTAB_ADD_CELLP(&tables, irow, icol, NULL);
			fld = dyntab_cell(&tables, irow, icol);
			fld->len = modif - field;
			fld->txt = fld->len ? field : "";
			fld->b_dontfreetxt = 1;
			if(*modif == '.') M_STRDUP(fld->field, modif + 1, szfield - (modif - field) - 1);
			fld->col = ibase;
		}
	}
	END_EACH_BRACKET

	/* Build temporary values tables */
	for(i = 0; i < tables.nbrows; i++)
	{
		DynTableCell *fld = dyntab_cell(&tables, i, 0);

		/* Parse field expression */
		M_FREE(sql);
		qry_build_free(&flt);
		if(b_srcobj) flt.srctable = srcobj;
		DYNBUF_ADD3_INT(&sql,  
			"-- qry_filter_sql_fieldexpr - build values table V", i, "\n");
		DYNBUF_ADD3_INT(&sql,  
			"CREATE TEMPORARY TABLE V", i, "\n");
		if(qry_parse_fieldexpr_nodes(cntxt, fld->txt, fld->len, &flt)) STACK_ERROR;
		if(qry_build_clauses(cntxt, &flt, 1)) STACK_ERROR;
			
		/* Add select members for field modifiers */
		for(j = 0; j < tables.nbcols; j++)
		{
			fld = dyntab_cell(&tables, i, j);
			if(!fld->txt) break;
			if(fld->col) continue;
			if(flt.select) DYNBUF_ADD_STR(&flt.select, ",");
			if(qry_add_valnode_field(cntxt, &flt, qry_parse_field_modifier(fld->field))) STACK_ERROR;
			DYNBUF_ADD3_INT(&flt.select, " AS Val", j, "");
		}
		flt.optselect = flt.select;
		flt.select = NULL;

		/* Build & exec query for values table */
		if(qry_build_flt_select(cntxt, &sql, &empty, &flt, 0, 0)) STACK_ERROR;
		if(sql_exec_query(cntxt, sql->data))
		{
			CLEAR_ERROR;
			DYNBUF_ADD_STR(&where, "NULL");
		} 
		else
		{
			snprintf(add_sz_str(printbuf), "V%u", i);
			if(cntxt->sql_trace) put_debug_sqltable(cntxt, printbuf);
			else if(cntxt->debug & DEBUG_SQL_SLOW && cntxt->sql_restime > 0.03)
				err_print_filter(&cntxt->debug_msg, &flt);
		}

		/* Add index to values table */
		snprintf(add_sz_str(printbuf), "ALTER TABLE V%u ADD INDEX (IdObj)", i);
		if(sql_exec_query(cntxt, printbuf)) STACK_ERROR;
	
		/* Add join clause on values table */
		dynbuf_print3(&join, "LEFT JOIN V%u ON V%u.IdObj=%s.IdObj \n", i, i, srcobj);
	}

	/* Evaluate expressions in brackets & build select statement */
	FOR_EACH_BRACKET
	{
		/* If brackets hold a base object symbol (#NAME) */
		if(fieldbeg[1] == '#')
		{
			/* Parse symbol name */
			unsigned long id = 0;
			char *beg = fieldbeg + 2;
#define PARSE_SYM_OBJ(sym, obj) if(!strncmp(sym, beg, sizeof(sym) - 1)) { beg += sizeof(sym) - 1; id = obj; if(*beg == '.') beg++; }
			PARSE_SYM_OBJ("CUROBJ", DYNTAB_TOUL(&cntxt->form->id_obj)) else
			PARSE_SYM_OBJ("USER", DYNTAB_TOUL(&cntxt->id_user))
			PARSE_SYM_OBJ("SRVCNF", DYNTAB_TOUL(&cntxt->id_cnf))
#undef PARSE_SYM_OBJ
			if(beg < fieldend && form_eval_fieldexpr(cntxt, res, 0, id, beg, fieldend - beg, NULL, 0))
			{
				CLEAR_ERROR;
				DYNBUF_ADD_STR(&where, "NULL");
			}
			else
			{
				/* Replace brackets with variable values in SQL expression */
				if(fieldbeg > next) DYNBUF_ADD(&where, next, fieldbeg - next, NO_CONV);
				if(beg >= fieldend) DYNBUF_ADD_INT(&where, id)
				else if(qry_values_list(cntxt, res, 0, &where)) STACK_ERROR;
			}
		}

		/* If brackets hold a variable index */
		else if(fieldbeg[1] == '%')
		{
			/* Check if already evaluated */
			char *end, *typ, *val;
			unsigned long line = strtoul(fieldbeg + 2, &end, 10) - 1;
			typ = dyntab_val(&valtyp, line, 0);
			val = dyntab_val(&valtyp, line, 1);

			/* Evaluate variable if not done yet */
			if(!*val)
			{
				/* Copy variable definition from given line of variables table 
					to form_eval_valtype parameters (33 is for transposition in case of multiple values) */
				if(dyntab_from_tab(&srcval, 0, 0, &valexpr, line, 0, line + 1, valexpr.nbcols, 33) ||
					(!strcmp(typ, "_EVA_SRC_FILTER") ?
						dyntab_from_tab(&listobj, 0, 0, &valflt, line, 0, line + 1, valflt.nbcols, 33) :
						dyntab_from_tab(&listobj, 0, 0, &valobj, line, 0, line + 1, valobj.nbcols, 33)))
					RETURN_ERR_MEMORY;

				/* Evaluate variable & store in valtyp */
				M_FREE(sql);
				if(form_eval_valtype(cntxt, res, typ, &listobj, &srcval))
				{
					CLEAR_ERROR;
					DYNBUF_ADD_STR(&sql, "NULL");
				}
				else
					if(qry_values_list(cntxt, res, dyntab_sz(&valfmt, line, 0) ? 0 : 5, &sql)) STACK_ERROR;
				val = sql ? sql->data : "";
			}
			/* Replace brackets with variable values in SQL expression */
			if(fieldbeg > next) DYNBUF_ADD(&where, next, fieldbeg - next, NO_CONV);
			DYNBUF_ADD(&where, val, 0, NO_CONV);
		}
		else
		{
			/* Field expresion : search for corresponding table & value */
			for(i = 0; i < tables.nbrows; i++)
			{
				for(j = 0; j < tables.nbcols; j++)
				{
					fld = dyntab_cell(&tables, i, j);
					if(fld->txt == fieldbeg + 1)
					{
						if(fld->col) j = fld->col - 1;
						break;
					}
				}
				if(fld->txt == fieldbeg + 1) break;
			}
			if(!fld || fld->txt != fieldbeg + 1) RETURN_ERROR("Program error", NULL);

			/* Replace brackets with values table name */
			if(fieldbeg > next) DYNBUF_ADD(&where, next, fieldbeg - next, NO_CONV);
			dynbuf_print4(&where, "IF(V%lu.Val%lu IS NULL,'',V%lu.Val%lu)", i, j, i, j);
		}
	}
	END_EACH_BRACKET

	/* Read matching objects in result table */
	if(where) DYNBUF_ADD3_BUF(&join, " WHERE\n", where, NO_CONV, "");
	if(*next) DYNBUF_ADD(&join, next, 0, NO_CONV);
	if(sql_exec_query(cntxt, join->data)) CLEAR_ERROR;
	else if(res)
	{
		if(sql_get_table(cntxt, res, 2)) STACK_ERROR;
		if(!res->nbrows) DYNTAB_SET(res, 0, 0, "0")
	}

	/* Drop temporary tables */
	for(i = 0; i < tables.nbrows; i++)
	{
		snprintf(add_sz_str(printbuf), "V%u", i);
		sql_drop_table(cntxt, printbuf);
	}
	sql_drop_table(cntxt, "TmpCondExpr");

	RETURN_OK_CLEANUP;
}
#undef ERR_FUNCTION
#undef ERR_CLEANUP

/*********************************************************************
** Function : qry_parse_filter_rel
** Description : build query nodes for a filter on field relation
*********************************************************************/
#define ERR_FUNCTION "qry_parse_filter_rel"
#define ERR_CLEANUP DYNTAB_FREE(fltval); \
					DYNTAB_FREE(fltform); \
					DYNTAB_FREE(cgival); \
					M_FREE(sql); \
					qry_build_free(&flt1)
int qry_parse_filter_rel(			/* return : 0 on success, other on error */
	EVA_context *cntxt,				/* in/out : execution context data */
	QryBuild *flt,					/* in/out : filter calculation data */
	DynTable *field,				/* in : field to use for filter */
	DynTable *flt_data				/* in : object data of filter */
){
	DynTable fltval = { 0 };
	DynTable fltform = { 0 };
	DynTable cgival = { 0 };
	QryBuild flt1 = {0};
	DynBuffer *sql = NULL;
	QryBuilNode *node = flt->node + flt->nbnode;
	char *reltype = DYNTAB_FIELD_VAL(flt_data, FILTER_RELTYPE);
	char *fltoper = DYNTAB_FIELD_VAL(flt_data, FILTER_REL_OP);
	char *fltobjtyp = DYNTAB_FIELD_VAL(flt_data, FILTER_RELWITH);
	RelationMode rel = !strcmp("_EVA_RELREVERSE", reltype) ? RelReverse : RelDirect;
	int b_multilevel = DYNTAB_FIELD_CELL(flt_data, MULTILEVEL) != NULL;
	unsigned long i;

	/* Set node create condition */
	if(qry_add_create_del_filter(cntxt, flt, flt_data)) STACK_ERROR;

	/* Handle match mode */
	if(!strcmp(fltoper, "_EVA_ISEMPTY"))
	{
		/* Add nodes depending on relation type */
		if(rel == RelDirect)
		{
			/* Empty operator : read objects having a value for the field & use complement */
			if(qry_add_create_del_filter(cntxt, &flt1, flt_data) ||
				qry_add_filter(cntxt, &flt1, RelNone, field, NoMatch, NULL) ||
				qry_filter_objects(cntxt, &node->value, &flt1)) STACK_ERROR;
			if(qry_add_filter(cntxt, flt, RelNone, field, NotObjList, NULL)) STACK_ERROR;
		}
		else
		{
			/* Reverse relation : use 2 nodes / fields & values in second node */
			RETURN_ERROR("Empty operator is not handled yet for reverse relation", NULL);
		}
	}
	else if(!strcmp(fltoper, "_EVA_ISNOTEMPTY"))
	{
		/* Add nodes depending on relation type */
		if(rel == RelDirect)
		{
			DYNTAB_ADD_INT(&node->value, 0, 0, 0)
			if(qry_add_filter(cntxt, flt, RelNone, field, NotRelList, NULL)) STACK_ERROR;
		}
		else
		{
			/* Reverse relation : use 2 nodes / fields & values in second node */
			RETURN_ERROR("Not empty operator is not handled yet for reverse relation", NULL);
		}
	}
	else
	{
		/* Relation to other objects - handle objects type */
		if(*fltobjtyp)
		{
			/* Relation to field/expression of given object : evaluate field expression */
			GET_ATTR(fltform, LISTOBJ);
			GET_ATTR(fltval, FILTER_LINKFIELD);

			/* Add nodes depending on relation type */
			if(rel == RelDirect)
			{
				/* Direct relation : use single node */
				MatchMode match = !strcmp(fltoper, "_EVA_DIFFERENT") ? NotRelList : RelList;
				if(form_eval_valtype(cntxt, &node->value, fltobjtyp, &fltform, &fltval) ||
					qry_add_filter(cntxt, flt, RelNone, field, match, NULL)) STACK_ERROR;
			}
			else
			{
				/* Reverse relation : use 2 nodes / fields & values in second node */
				MatchMode match = !strcmp(fltoper, "_EVA_DIFFERENT") ? NotObjList : ObjList;
				if(qry_add_filter(cntxt, flt, RelReverse, NULL, NoMatch, NULL) ||
					form_eval_valtype(cntxt, &(node+1)->value, fltobjtyp, &fltform, &fltval) ||
					qry_add_create_del_filter(cntxt, flt, flt_data) ||
					qry_add_filter(cntxt, flt, RelNone, field, match, NULL)) STACK_ERROR;
				(node+1)->srcjoin = flt->nbnode - 2;
			}

			/* Handle multiple level relation */
			if(b_multilevel & 0)
			{
				/* Exec filter at its current status & replace with IdObj condition
				DYNBUF_ADD_STR(&sql, "CREATE TEMPORARY TABLE TmpExecPrev TYPE=HEAP \n");
				if( qry_build_clauses(cntxt, flt, 1) ||
					qry_build_flt_select(cntxt, &sql, &flt->node[0].idobjmatch, flt, 0, 0) ||
					sql_exec_query(cntxt, sql->data) ||
					sql_exec_query(cntxt, "ALTER TABLE TmpExecPrev ADD INDEX (IdObj)")) STACK_ERROR;
				qry_build_free_nodes(flt);
				if(qry_recursive_relation(cntxt, &flt->node[0].idobjmatch, &flt->node[0].idobjmatch, &fltfield)) STACK_ERROR;

				RETURN_OK; */
			}
		}
		else 
		{
			/* Relation to objects matching other filter */
			unsigned long srcjoin;
			GET_ATTR(fltval, FILTERS);

			/* Handle operator */
			if(!strcmp(fltoper, "_EVA_DIFFERENT")) RETURN_ERROR("Different operator is not handled yet for relation to other filter result", NULL);

			/* Add nodes depending on relation type */
			if(rel == RelDirect)
			{
				/* Direct relation : use single node */
				if(qry_add_filter(cntxt, flt, RelDirect, field, NoMatch, NULL)) STACK_ERROR;
			}
			else
			{
				/* Reverse relation : use 2 nodes / fields & values in second node */
				if(qry_add_filter(cntxt, flt, RelReverse, NULL, NoMatch, NULL) ||
					qry_add_create_del_filter(cntxt, flt, flt_data) ||
					qry_add_filter(cntxt, flt, RelNone, field, NoMatch, NULL)) STACK_ERROR;
				(node+1)->srcjoin = flt->nbnode - 2;
			}

			/* Add nodes for other filters */
			srcjoin = flt->nbnode - 1;
			for(i = 0; i < fltval.nbrows; i++)
			{
				flt->srcjoin = srcjoin;
				if(qry_obj_field(cntxt, &cgival, DYNTAB_TOULRC(&fltval, i, 0), NULL) ||
					qry_parse_filter_nodes(cntxt, flt, &cgival)) STACK_ERROR;
			}
			flt->srcjoin = srcjoin;
		}
	}

	RETURN_OK_CLEANUP;
}
#undef ERR_FUNCTION
#undef ERR_CLEANUP

/*********************************************************************
** Function : qry_parse_filter_val
** Description : build query nodes for a filter on field values
*********************************************************************/
#define ERR_FUNCTION "qry_parse_filter_val"
#define ERR_CLEANUP DYNTAB_FREE(fltval); \
					DYNTAB_FREE(fltform); \
					DYNTAB_FREE(cgival); \
					qry_build_free(&flt1)
int qry_parse_filter_val(			/* return : 0 on success, other on error */
	EVA_context *cntxt,				/* in/out : execution context data */
	QryBuild *flt,					/* in/out : filter calculation data */
	DynTable *field,				/* in : field to use for filter */
	DynTable *flt_data				/* in : object data of filter */
){
	DynTable fltval = { 0 };
	DynTable fltform = { 0 };
	DynTable cgival = { 0 };
	QryBuild flt1 = {0};
	QryBuilNode *node = flt->node + flt->nbnode;
	char *fltop = DYNTAB_FIELD_VAL(flt_data, FILTER_OP);
	char *valtype = DYNTAB_FIELD_VAL(flt_data, FILTER_VAL_TYPE);
	int b_std = 1;
	MatchMode match = Exact;
	GET_ATTR(fltform, LISTOBJ);
	GET_ATTR(fltval, FILTER_VALUE);

	/* Set match mode & values depending on comparison type */
#define USE_STD_VAL(tag, mode) if(!strcmp("_EVA_"#tag, fltop)) match = mode;
	USE_STD_VAL(DIFFERENT, Different) else
	USE_STD_VAL(SMALLER, Smaller) else
	USE_STD_VAL(SMALLEREQUAL, SmallerEqual) else
	USE_STD_VAL(GREATER, Larger) else
	USE_STD_VAL(GREATEREQUAL, LargerEqual) else
	USE_STD_VAL(BEGINWITH, Begin) else
	USE_STD_VAL(NOT_BEGINWITH, NotBegin) else
	USE_STD_VAL(CONTAIN, Contain) else
	USE_STD_VAL(NOT_CONTAIN, NotContain) else
	USE_STD_VAL(LIKE, Like) else
	USE_STD_VAL(NOT_LIKE, NotLike)
	USE_STD_VAL(ISNOTEMPTY, NoMatch)
#undef USE_STD_VAL
	else if(!strcmp("_EVA_INTERVAL", fltop) || !strcmp("_EVA_NOT_INTERVAL", fltop))
	{
		/* Interval operator : handle min / max values */
		match = !strcmp("_EVA_INTERVAL", fltop) ? InBound : NotInBound;
		b_std = 0;

		/* Evaluate comparison values */
		GET_ATTR(fltval, FILTER_VAL_MIN);
		if(form_eval_valtype(cntxt, &cgival, valtype, &fltform, &fltval)) STACK_ERROR;
		DYNTAB_ADD_CELL(&node->value, 0, 0, &cgival, 0, 0);
		GET_ATTR(fltval, FILTER_VAL_MAX);
		if(form_eval_valtype(cntxt, &cgival, valtype, &fltform, &fltval)) STACK_ERROR;
		DYNTAB_ADD_CELL(&node->value, 1, 0, &cgival, 0, 0);
	}
	else if(!strcmp("_EVA_ISEMPTY", fltop))
	{
		/* Empty operator : read objects having a value for the field & use NOT IN() */
		if(qry_add_create_del_filter(cntxt, &flt1, flt_data)) STACK_ERROR;
		if(qry_add_filter(cntxt, &flt1, RelNone, field, NoMatch, NULL) ||
			qry_filter_objects(cntxt, &node->value, &flt1)) STACK_ERROR;
		b_std = 0;
		match = NotObjList;
		field = NULL;
	}

	/* Evaluate comparison value if applicable */
	if(b_std && match != NoMatch &&
		form_eval_valtype(cntxt, &node->value, valtype, &fltform, &fltval)) STACK_ERROR;

	/* Add node */
	if(qry_add_create_del_filter(cntxt, flt, flt_data)) STACK_ERROR;
	if(qry_add_filter(cntxt, flt, RelNone, field, match, NULL)) STACK_ERROR;

	RETURN_OK_CLEANUP;
}
#undef ERR_FUNCTION
#undef ERR_CLEANUP

/*********************************************************************
** Function : qry_parse_relval_fields
** Description : split values & relations fields of filter controls
*********************************************************************/
#define ERR_FUNCTION "qry_parse_relval_fields"
#define ERR_CLEANUP DYNTAB_FREE(fltctl); \
					DYNTAB_FREE(val)
int qry_parse_relval_fields(		/* return : 0 on success, other on error */
	EVA_context *cntxt,				/* in/out : execution context data */
	DynTable *fldval,				/* out : value fields */
	DynTable *fldrel,				/* out : relation fields */
	DynTable *flt_data				/* in : object data of filter */
){
	DynTable fltctl = { 0 };
	DynTable val = { 0 };
	unsigned long i;

	/* Read filter controls */
	GET_ATTR(fltctl, FILTER_CTRL);
	for(i = 0; i < fltctl.nbrows; i++)
	{
		/* Read control type & field */
		char *type;
		DynTableCell *field;
		DynTable *dest;
		if(qry_obj_field(cntxt, &val, DYNTAB_TOULRC(&fltctl, i, 0), "_EVA_TYPE,_EVA_FIELD")) STACK_ERROR;
		type = DYNTAB_FIELD_VAL(&val, TYPE);
		field = DYNTAB_FIELD_CELL(&val, FIELD);
		if(!*type || !field) continue;

		/* Put relation fields in fldrel, others in fldval */
		dest = (strcmp(type, "_EVA_RELATION") && strcmp(type, "_EVA_FILEUPLOAD")) ? fldval : fldrel;
		DYNTAB_ADD_CELLP(dest, dest->nbrows, 0, field);
	}

	RETURN_OK_CLEANUP;
}
#undef ERR_FUNCTION
#undef ERR_CLEANUP

/*********************************************************************
** Function : qry_parse_filter_nodes
** Description : build query nodes for a filter from filter data
*********************************************************************/
#define ERR_FUNCTION "qry_parse_filter_nodes"
#define ERR_CLEANUP DYNTAB_FREE(fltfield); \
					DYNTAB_FREE(fltval); \
					DYNTAB_FREE(fltform); \
					DYNTAB_FREE(cgival); \
					M_FREE(sql); \
					qry_build_free(&flt1); \
					cntxt->sql_trace = sql_trace; \
					if(cntxt->err.text) err_print_filter(&cntxt->err.detail, flt)
int qry_parse_filter_nodes(			/* return : 0 on success, other on error */
	EVA_context *cntxt,				/* in/out : execution context data */
	QryBuild *flt,					/* in/out : filter calculation data */
	DynTable *flt_data				/* in : object data of filter */
){
	EVA_form *form = cntxt->form;
	char *flttype = DYNTAB_FIELD_VAL(flt_data, FILTER_TYPE);
	DynTable fltfield = { 0 };
	DynTable fltval = { 0 };
	DynTable fltform = { 0 };
	DynTable cgival = { 0 };
	DynBuffer *sql = NULL;
	QryBuild flt1 = {0};
	QryBuilNode *node = flt->node + flt->nbnode;
	char printbuf[1024];
	unsigned long i;
	int sql_trace = cntxt->sql_trace;
	DynTableCell *fltlabel = DYNTAB_FIELD_CELL(flt_data, LABEL);

	/* Handle debug */
	flt->debug |= *DYNTAB_FIELD_VAL(flt_data, DEBUG_SQL_FILTER) == '1';
	if(flt->debug)
	{
		DYNBUF_ADD3_CELLP(&cntxt->debug_msg, "\n========> qry_parse_filter_nodes : ", fltlabel, NO_CONV, "");
		cntxt->sql_trace = DEBUG_SQL_RES;
	}

	/* Check params */
	if(!flt || !flt_data || !flt_data->nbrows) RETURN_OK;

	/* Check if filter is enabled */
	GET_ATTR(fltfield, ACTIVATE_FILTER);
	if(fltfield.nbrows)
	{
		/* A condition is given : evaluate on current form & object */
		DYNBUF_ADD_STR(&sql, "=");
		if(qry_filterlist_to_sql(cntxt, &sql, &fltfield, "AND")) CLEAR_ERROR;
		if(sql && form_eval_fieldexpr(cntxt, &fltval,
					DYNTAB_TOUL(&form->id_form), DYNTAB_TOUL(&form->id_obj),
					DYNBUF_VAL_SZ(sql), NULL, 0)) CLEAR_ERROR;

		/* Ignore condition if result is not "1" */
		if(strcmp(dyntab_val(&fltval, 0, 0), "1")) RETURN_OK;
		dyntab_free(&fltfield);
		dyntab_free(&fltval);
		M_FREE(sql);
	}

	/* Add filter name & id for further use */
	DYNTAB_ADD_CELLP(&flt->name, flt->name.nbrows, 0, fltlabel);
	DYNTAB_ADD_INT(&flt->name, flt->name.nbrows - 1, 1, flt_data->cell->IdObj);

	/* Process depending on filter type */
	if(!strcmp("_EVA_FILTER_LISTOBJ", flttype) ||
		!strcmp("_EVA_LISTOBJ", flttype))
	{
		/* List of predefined objects */
		GET_ATTR(node->value, LISTOBJ);
		if(qry_add_filter(cntxt, flt, RelNone, NULL, ObjList, NULL)) STACK_ERROR;
	}
	else if(!strcmp("_EVA_FILTER_FORM", flttype))
	{
		/* Objects created/edited with one or more forms */
		GET_ATTR(node->value, FILTER_FORM);
		DYNTAB_ADD_TXTID(&node->field, 0, 0, "_EVA_FORMSTAMP", cntxt->val_FORMSTAMP);
		if(qry_add_create_del_filter(cntxt, flt, flt_data)) STACK_ERROR;
		if(qry_add_filter(cntxt, flt, RelNone, NULL, RelList, NULL)) STACK_ERROR;
	}
	else if(!strcmp("_EVA_FILTER_CTRLVAL", flttype))
	{
		/* Value of an input control - split values / relations fields & add appropriate filters */
		if(qry_parse_relval_fields(cntxt, &fltfield, &fltform, flt_data)) STACK_ERROR;
		if(fltfield.nbrows && qry_parse_filter_val(cntxt, flt, &fltfield, flt_data)) STACK_ERROR;
		if(fltform.nbrows && qry_parse_filter_rel(cntxt, flt, &fltform, flt_data)) STACK_ERROR;
	}
	else if(!strcmp("_EVA_FILTER_FIELD", flttype))
	{
		/* Objects with given fields & values */
		GET_ATTR(fltfield, FILTER_FIELD);
		if(qry_parse_filter_val(cntxt, flt, &fltfield, flt_data)) STACK_ERROR;
	}
	else if(!strcmp("_EVA_FILTER_REL", flttype))
	{
		/* Relation with other objects */
		GET_ATTR(fltfield, FILTER_REL);
		if(qry_parse_filter_rel(cntxt, flt, &fltfield, flt_data)) STACK_ERROR;
	}
	else if(!strcmp("_EVA_FILTER", flttype) ||
			!strcmp("_EVA_FILTER_AND", flttype) ||
			!strcmp("_EVA_FILTER_ANDJOIN", flttype))
	{
		/* AND combination of filters on same object  - process filter list */
		GET_ATTR(fltval, FILTERS);
		if(qry_add_filterlist(cntxt, flt, &fltval)) STACK_ERROR;
	}
	else if(!strcmp("_EVA_FILTER_SQLNODE", flttype))
	{
		/* SQL condition on node - replace variables wih their values */
		if(qry_eval_sqlexpr_var(cntxt, &node->cond, DYNTAB_FIELD_VAL(flt_data, FILTER_COND), flt_data)) STACK_ERROR;
		node->srcjoin = flt->srcjoin;
		flt->nbnode++;

	}
	else if(!strcmp("_EVA_FILTER_SQLCOND", flttype))
	{
		/* Mixed SQL / fields expression : optimize if source join is first */
		if(!flt->srcjoin && (flt->nbnode || node->idobjmatch.nbrows))
		{
			/* Exec filter at its current status & replace with IdObj condition */
			node = flt->node;
			DYNBUF_ADD_STR(&sql, "CREATE TEMPORARY TABLE TmpExecPrev TYPE=HEAP \n");
			if( qry_build_clauses(cntxt, flt, 1) ||
				qry_build_flt_select(cntxt, &sql, &node->idobjmatch, flt, 0, 0) ||
				sql_exec_query(cntxt, sql->data) ||
				sql_exec_query(cntxt, "ALTER TABLE TmpExecPrev ADD INDEX (IdObj)")) STACK_ERROR;
			qry_build_free_nodes(flt);
			if(qry_filter_sql_fieldexpr(cntxt, &node->idobjmatch, DYNTAB_FIELD_VAL(flt_data, FILTER_COND),
						"TmpExecPrev", flt_data)) STACK_ERROR;
		}
		else
		{
			/* Filter objects matching expression on current node */
			node = flt->node + flt->srcjoin;
			if(node->rel == RelDirect) node++;
			if(qry_filter_sql_fieldexpr(cntxt, &node->idobjmatch, DYNTAB_FIELD_VAL(flt_data, FILTER_COND), NULL, flt_data)) STACK_ERROR;
		}
		sql_drop_table(cntxt, "TmpExecPrev");
	}
	else if(!strcmp("_EVA_FILTER_OR", flttype))
	{
		/* OR combination of filters on same object - use temporary table to build matched objects list */
		char tmptbl[32] = {0};
		snprintf(add_sz_str(tmptbl), "Or%lX", clock());
		snprintf(add_sz_str(printbuf),
			"-- OR combination - use temporary table %s\n"
			"CREATE TEMPORARY TABLE %s (IdObj INT) TYPE=HEAP", tmptbl, tmptbl);
		if(sql_exec_query(cntxt, printbuf)) STACK_ERROR;
		GET_ATTR(fltval, FILTERS);

		/* Process each filter */
		for(i = 0; i < fltval.nbrows; i++)
		{
			qry_build_free(&flt1);
			M_FREE(sql);
			if( qry_obj_field(cntxt, &cgival, DYNTAB_TOULRC(&fltval, i, 0), NULL) ||
				qry_parse_filter_nodes(cntxt, &flt1, &cgival)) STACK_ERROR;
			dynbuf_print(&sql, "-- OR combination - [%s]\n", dyntab_val(&flt1.name, 0, 0));
			dynbuf_print(&sql, "INSERT INTO %s (IdObj)\n", tmptbl);
			if( qry_build_clauses(cntxt, &flt1, 1) ||
				qry_build_flt_select(cntxt, &sql, &flt->node[flt->srcjoin].idobjmatch, &flt1, 0, 0) ||
				sql_exec_query(cntxt, sql->data)) STACK_ERROR;
		}
		
		/* Set list of match object for source join */
		snprintf(add_sz_str(printbuf),
			"-- OR combination - get distinct objects\n"
			"SELECT DISTINCT IdObj FROM %s", tmptbl);
		if(sql_exec_query(cntxt, printbuf) ||
			sql_get_table(cntxt, &flt->node[flt->srcjoin].idobjmatch, 2)) STACK_ERROR;
		sql_drop_table(cntxt, tmptbl);
		if(!flt->node[flt->srcjoin].idobjmatch.nbrows) DYNTAB_ADD_INT(&flt->node[flt->srcjoin].idobjmatch, 0, 0, 0);
	}

	if(flt->debug)
	{
		err_print_filter(&cntxt->debug_msg, flt);
		DYNBUF_ADD3_CELLP(&cntxt->debug_msg, "<======== END qry_parse_filter_nodes : ", fltlabel, NO_CONV, "\n");
	}
	RETURN_OK_CLEANUP;
}
#undef ERR_FUNCTION
#undef ERR_CLEANUP

/*********************************************************************
** Function : qry_parse_filter
** Description : build SQL query clauses for a filter from filter data
*********************************************************************/
#define ERR_FUNCTION "qry_parse_filter"
#define ERR_CLEANUP 
int qry_parse_filter(				/* return : 0 on success, other on error */
	EVA_context *cntxt,				/* in/out : execution context data */
	QryBuild *flt,					/* in/out : filter calculation data */
	DynTable *flt_data				/* in : object data of filter */
){
	/* Build filter nodes */
	if(qry_parse_filter_nodes(cntxt, flt, flt_data)) STACK_ERROR;
	if(qry_build_clauses(cntxt, flt, 1)) STACK_ERROR;

	RETURN_OK_CLEANUP;
}
#undef ERR_FUNCTION
#undef ERR_CLEANUP

/*********************************************************************
** Function : qry_filter_objects
** Description : execute query from filter nodes
*********************************************************************/
#define ERR_FUNCTION "qry_filter_objects"
#define ERR_CLEANUP M_FREE(sql)
int qry_filter_objects(				/* return : 0 on success, other on error */
	EVA_context *cntxt,				/* in/out : execution context data */
	DynTable *res,					/* out : result - objects selected by filter */
	QryBuild *flt					/* in : filter with nodes set */
){
 	DynBuffer *sql = NULL;
	DynTable empty = {0};

	if(qry_build_clauses(cntxt, flt, 1) ||
		qry_build_flt_select(cntxt, &sql, &empty, flt, 0, 0)) STACK_ERROR;
	SQL_QRY_DEBUG_FLT(flt, sql->data, STACK_ERROR);
	if(sql_get_table(cntxt, res, 2)) STACK_ERROR;
	if(cntxt->debug & DEBUG_SQL_SLOW && cntxt->sql_restime > 0.03) err_print_filter(&cntxt->debug_msg, flt);

	RETURN_OK_CLEANUP;
}
#undef ERR_FUNCTION
#undef ERR_CLEANUP

/*********************************************************************
** Function : qry_build_flt_select
** Description : build SELECT clause corresponding to a filter
*********************************************************************/
#define ERR_FUNCTION "qry_build_flt_select"
#define ERR_CLEANUP M_FREE(l_idobj)
int qry_build_flt_select			/* return : 0 on success, other on error */
(
	EVA_context *cntxt,				/* in : execution context data */
	DynBuffer **sql,				/* in/out : SQL query is added to the buffer */
	DynTable *idlist,				/* in : list of objects Ids to limit search
											* if NULL, read from table IdList
											* if empty (nbrows=0), do not filter on IdObj */
	QryBuild *flt,					/* in : query build data */
	unsigned long row,				/* in : 1st row for LIMIT clause */
	unsigned long nbrows			/* in : # of rows for LIMIT clause */
){
 	DynBuffer *l_idobj = NULL;
	char *selobj = flt->b_userelobj ? "IdRelObj" : "IdObj";
	char *srctable = flt->srctable ? flt->srctable : !idlist ? "IdList" : NULL;
	char printbuf[1024];

	if(!sql) RETURN_OK;
	if(cntxt->sql_trace) err_print_filter(&cntxt->debug_msg, flt);

	/* Build SELECT clause - IdObj member */
	DYNBUF_ADD_STR(sql, "SELECT " );
	if(!flt->b_nodistinct) DYNBUF_ADD_STR(sql, "DISTINCT " );
	if(flt->b_straightjoin) DYNBUF_ADD_STR(sql, "STRAIGHT_JOIN " );
	if(flt->selidobj)
		DYNBUF_ADD3(sql, "", flt->selidobj, 0, NO_CONV, ".IdObj AS IdObj")
	else if(flt->b_linkonrelobj)
		DYNBUF_ADD3(sql, "", flt->srctable, 0, NO_CONV, ".IdObj AS IdObj")
	else
		DYNBUF_ADD3(sql, "TLink0.", selobj, 0, NO_CONV, " AS IdObj");

	/* Build SELECT clause - other values members */
	if(flt->select) DYNBUF_ADD3_BUF(sql, ",", flt->select, NO_CONV, " AS Val");
	if(flt->optselect) DYNBUF_ADD3_BUF(sql, ",", flt->optselect, NO_CONV, "");
	DYNBUF_ADD_STR(sql, "\n" );

	/* Build FROM clause */
	if(!srctable || !*srctable)
	{
		DYNBUF_ADD_STR(sql, "FROM TLink AS TLink0 \n");
	}
	else 
	{
		dynbuf_print4(sql,
			"FROM %s\nINNER JOIN TLink AS TLink0 ON %s.%s=TLink0.%s\n",
				srctable, srctable, flt->b_linkonrelobj ? "IdRelObj" : "IdObj", selobj);
	}

	/* Add JOIN clause members */
	if(flt->join) DYNBUF_ADD_BUF(sql, flt->join, NO_CONV);

	/* Build WHERE clause */
	if(idlist && idlist->nbrows)
	{
		if(qry_values_list(cntxt, idlist, 0, &l_idobj)) STACK_ERROR;
		DYNBUF_ADD3(sql, "WHERE TLink0.", selobj, 0, NO_CONV, " IN (");
		DYNBUF_ADD3_BUF(sql, "", l_idobj, NO_CONV, ") \n");
		if(flt->where) DYNBUF_ADD3_BUF(sql, "AND ", flt->where, NO_CONV, "\n");
	}
	else if(flt->where)
		DYNBUF_ADD3_BUF(sql, "WHERE ", flt->where, NO_CONV, "\n");

	/* Build GROUP BY clause */
	if(flt->groupfn)
	{
		DYNBUF_ADD_STR(sql, "GROUP BY IdObj\n");
		if(flt->having) DYNBUF_ADD3_BUF(sql, "HAVING ", flt->having, NO_CONV, "\n");
	}

	/* Build ORDER BY clause */
	if(flt->orderby)
		DYNBUF_ADD3_BUF(sql, "ORDER BY ", flt->orderby, NO_CONV, "\n")

	/* Build LIMIT clause */
	if(nbrows)
	{
		DYNBUF_ADD3_INT(sql, "LIMIT ", row, ",");
		DYNBUF_ADD_INT(sql, nbrows);
		DYNBUF_ADD_STR(sql, "\n" );
	}

	RETURN_OK_CLEANUP;
}
#undef ERR_FUNCTION
#undef ERR_CLEANUP

/*********************************************************************
** Function : qry_build_compare
** Description : build an SQL comparison expression
*********************************************************************/
#define ERR_FUNCTION "qry_build_compare"
#define ERR_CLEANUP
int qry_build_compare(					/* return : 0 on success, other on error */
	EVA_context *cntxt,					/* in : execution context data */
	DynBuffer **sql,					/* in/out : buffer to output SQL expression */
	char *member, size_t sz_member,		/* in : table member to compare */
	char *oper, size_t sz_oper,			/* in : comparison operator */
	char *val, size_t sz_val,			/* in : value to compare with */
	char *clos, size_t sz_clos			/* in : comparison operator end */
){
	int conv = (oper[sz_oper - 1] == '%' || clos[0] == '%') ? 1 : clos[0] == '\'' ? 2 : 0;
	if(dynbuf_add(sql, member, sz_member, NO_CONV) ||
		dynbuf_add(sql, add_sz_str(" "), NO_CONV) ||
		dynbuf_add(sql, oper, sz_oper, NO_CONV) ||
		(
		conv == 1 ? dynbuf_add(sql, val, sz_val, SQL_NO_LIKE_OPS) :
		conv == 2 ? dynbuf_add(sql, val, sz_val, SQL_NO_QUOTE) :
					dynbuf_add(sql, val, sz_val, NO_CONV)
		) ||
		dynbuf_add(sql, clos, sz_clos, NO_CONV))
		RETURN_ERR_MEMORY;

	RETURN_OK_CLEANUP;
}
#undef ERR_FUNCTION
#undef ERR_CLEANUP

/*********************************************************************
** Function : qry_parse_matchmode
** Description : translate matchmode to SQL expression
*********************************************************************/
#define ERR_FUNCTION "qry_parse_matchmode"
#define ERR_CLEANUP	DYNTAB_FREE(data); \
					M_FREE(listval)
int qry_parse_matchmode(		/* return : 0 on success, other on error */
	EVA_context *cntxt,			/* in : execution context data */
	DynBuffer **sql,			/* in/out : buffer to output SQL expression */
	char *member,				/* in : table member to compare */
	unsigned long join,			/* in : join number - if ~0UL and b_valjoin is NULL, use member as given */
	MatchMode match,			/* in : match operator to parse */
	DynTable *values,			/* in : values to compare */
	int *b_valjoin				/* in : do not optimize if NULL
								  out : (if not NULL) 0 if no join used */
){
	DynTable data = {0};
	DynTable *val = values;
	DynBuffer *listval = NULL;
	unsigned long i, limit = 100;
	char tblmember[1024], *tmember = member;
	int valjoin = member && !strcmp(member, "TxtValue");
	size_t sz;
	MatchMode newmatch = NoMatch, valmatch = match;
	if(match == NoMatch || !sql) return 0;
	if(!member) member = "";
	
	/* Minimize joins by fetching values Ids when reasonable */
	if(valjoin && b_valjoin) 
	{
		switch(match)
		{
		case NotContain: newmatch = NotIdValList; valmatch = Contain; break;
		case NotBegin: newmatch = NotIdValList; valmatch = Begin; break;	
		case NotLike: newmatch = NotIdValList; valmatch = Like; break;	
		case Different: newmatch = NotIdValList; valmatch = Exact; break;
		case Contain:	
		case Begin:	
		case Like:		
		case Exact:
			newmatch = IdValList;
		}

		if(newmatch != NoMatch)
		{
			/* Query Ids for each value */
			for(i = 0; !i || i < values->nbrows; i++)
			{
				DynTableCell *c = dyntab_cell(values, i, 0);
				if(!c) dyntab_free(&data);
				else if(sql_id_values(cntxt, &data, c->txt, c->len, valmatch, limit)) STACK_ERROR;
				if(data.nbrows == limit) break;
				if(listval) DYNBUF_ADD_STR(&listval, ",");
				if(qry_values_list(cntxt, &data, 0, &listval)) STACK_ERROR;
			}
			/* Set optimized node if not too many matches */
			if(i == values->nbrows)
			{
				dyntab_free(&data);
				DYNTAB_ADD_BUF(&data, 0, 0, listval)
				val = &data;
				match = newmatch;
				member = "IdValue";
				valjoin = 0;
			}
		}
	} 

	/* Prepare value table expression */
	if(b_valjoin) *b_valjoin = valjoin;
	if(join == ~0UL)
		sz = strlen(member);
	else
	{
		sz = snprintf(add_sz_str(tblmember), "%s%lu.%s", valjoin ? "TVal" : "TLink", join, member);
		tmember = tblmember;
	}

#define PARSE(oper, i, clos) if(qry_build_compare(cntxt, sql, tmember, sz, add_sz_str(oper), DYNTAB_VAL_SZ(val, i, 0), add_sz_str(clos))) STACK_ERROR
#define PARSE_LOOP(oper, sep, clos) for(i = 0; !i || i < val->nbrows; i++) { if(i) DYNBUF_ADD_STR(sql, sep);  PARSE(oper, i, clos); }
#define PARSE_NUM(oper, clos) DYNBUF_ADD3(sql, "", tmember, sz, NO_CONV, " " oper); \
				for(i = 0; !i || i < val->nbrows; i++) { \
					if(i) DYNBUF_ADD_STR(sql, ","); \
					if(dyntab_sz(val, i, 0)) DYNBUF_ADD_CELL(sql, val, i, 0, NO_CONV) else DYNBUF_ADD_STR(sql, "0"); } \
				DYNBUF_ADD_STR(sql, clos)
#define PARSE_AND(oper, clos) PARSE_LOOP(oper, " AND ", clos)
#define PARSE_OR(oper, clos) if(val->nbrows > 1) DYNBUF_ADD_STR(sql, "("); PARSE_LOOP(oper, " OR ", clos); if(val->nbrows > 1) DYNBUF_ADD_STR(sql, ")")
												
	switch(match)
	{
	case NotObjList:
	case NotRelList:
	case NotIdValList:	PARSE_NUM("NOT IN (", ")"); break;
	case ObjList:
	case RelList:
	case IdValList:		PARSE_NUM("IN (", ")"); break;
	case NotContain:	PARSE_AND("NOT LIKE '%", "%'"); break;
	case Contain:		PARSE_OR("LIKE '%", "%'"); break;
	case NotBegin:		PARSE_AND("NOT LIKE '", "%'"); break;
	case Begin:			PARSE_OR("LIKE '", "%'"); break;
	case NotLike:		PARSE_AND("NOT LIKE '", "'"); break;
	case Like:			PARSE_OR("LIKE '", "'"); break;
	case Smaller:		PARSE_AND("<'", "'"); break;
	case SmallerEqual:	PARSE_OR("<='", "'"); break;
	case Larger:		PARSE_AND(">'", "'"); break;
	case LargerEqual:	PARSE_OR(">='", "'"); break;
	case Different:		PARSE_AND("<>'", "'"); break;
	case Exact:			PARSE_OR("='", "'"); break;
	case NotInBound:
		if(dyntab_sz(val, 0, 0) && dyntab_sz(val, 1, 0)) 
		{				PARSE("<'", 0, "' AND "); PARSE(">='", 1, "'") }
		else if(dyntab_sz(val, 0, 0))
		{				PARSE("<'", 0, "'"); }
		else if(dyntab_sz(val, 1, 0))
		{				PARSE("<'", 1, "'"); }
		else
		{				PARSE("<>'", 0, "'"); }
		break;
	case InBound:
		if(dyntab_sz(val, 0, 0) && dyntab_sz(val, 1, 0)) 
		{				PARSE(">='", 0, "' AND "); PARSE("<'", 1, "'") }
		else if(dyntab_sz(val, 0, 0))
		{				PARSE(">='", 0, "'"); }
		else if(dyntab_sz(val, 1, 0))
		{				PARSE("<'", 1, "'"); }
		else
		{				PARSE("<>'", 0, "'"); }
		break;
	default:
		RETURN_ERROR("Unknown match mode", NULL);
	}
#undef PARSE
#undef PARSE_LOOP
#undef PARSE_NUM
#undef PARSE1_AND
#undef PARSE1_OR

	RETURN_OK_CLEANUP;
}
#undef ERR_FUNCTION
#undef ERR_CLEANUP

/*********************************************************************
** Function : qry_build_clauses
** Description : build SQL query clauses from filter nodes
*********************************************************************/
#define ERR_FUNCTION "qry_build_clauses"
#define ERR_CLEANUP	if(cntxt->err.text) err_print_filter(&cntxt->err.detail, flt); \
					cntxt->sql_trace = sql_trace
int qry_build_clauses(				/* return : 0 on success, other on error */
	EVA_context *cntxt,				/* in : execution context data  */
	QryBuild *flt,					/* in/out : query build data
										in : flt->node
										out : select, join, where, group_fn, b_userelobj */
	int mode						/* in : build mode
										0 = values of last node
									other = IdObj of first node */
){
	unsigned long i;
	unsigned long valjoin;
	QryBuilNode *lastnode = flt->node + flt->nbnode - (flt->nbnode ? 1 : 0);
	DynBuffer **where = &flt->where;
	int sql_trace = cntxt->sql_trace;
	char printbuf[1024];

	/* Set link object part */
	flt->b_userelobj = flt->node[0].rel == RelReverse && EMPTY_NODE(flt->node);

	/* Add last node if applicable */
	if(!flt->nbnode) flt->nbnode = 1;
	else if(lastnode->rel != RelNone)
	{
		lastnode = flt->node + flt->nbnode;
		lastnode->srcjoin = flt->nbnode - 1;
		if(!lastnode->modif) lastnode->modif = (lastnode-1)->rel == RelDirect ? F_RelObj : F_Obj;
		flt->nbnode++;
	}
	else
		lastnode = flt->node + flt->nbnode - 1;

	/* Process each node */
	for(i = 0; i < flt->nbnode; i++)
	{
		int b_joinval = 0, b_joinfld = 0;
		QryBuilNode *node = flt->node + i;

		/* Add JOIN clause if applicable */
		if(i)
		{
			QryBuilNode *n1 = flt->node + node->srcjoin;
			QryBuilNode *n2 = (n1->srcjoin || node->srcjoin) ? flt->node + n1->srcjoin : NULL;
			char *left, *right;

			/* Compute left & right TLink members of join expresion */
			if(n1->rel == RelNone || !node->srcjoin && i > 1 ||
					n1->rel == RelDirect && n2 && n2->rel == RelReverse)
			{
				left = "IdObj";
				right = "IdObj";
			}
			else if(n1->rel == RelReverse && (n2 ? n2->rel == RelDirect : n1->field.nbrows))
			{
				left = "IdRelObj";
				right = "IdRelObj";
			}
			else if(n1->rel == RelReverse)
			{
				left = "IdObj";
				right = "IdRelObj";
			}
			else 
			{
				left = "IdRelObj";
				right = "IdObj";
			}

			/* Determine if a new join table is to be added */
			if((!flt->b_userelobj || i > 1) && !(node->rel == RelReverse  && EMPTY_NODE(node) && !node->srcjoin))
				node->curjoin = ++flt->nbjoin;
			else
				node->curjoin = n1->curjoin;
			switch(n1->modif)
			{
			case F_WhoCr: left = "IdWhoCr"; break;
			case F_WhoDel: left = "IdWhoDel"; break;
			case F_None: break;
			default:
				RETURN_FILTER_ERROR("Invalid relation field modifier");
			}
			if(n1->curjoin != node->curjoin && node->curjoin &&
				dynbuf_print5(&flt->join, "INNER JOIN TLink AS TLink%lu ON TLink%lu.%s=TLink%lu.%s\n",
											node->curjoin, n1->curjoin, left, node->curjoin, right))
				RETURN_ERR_MEMORY;
		}

		/* Add WHERE clause for fields */
		if(node->field.nbrows)
		{
			if(flt->where) DYNBUF_ADD_STR(&flt->where, " AND ");
			DYNBUF_ADD3_INT(&flt->where, "TLink", node->curjoin, ".IdField IN(");
			if(flt->b_single_last_field && node == lastnode && lastnode->field.nbrows > 1) lastnode->field.nbrows = 1;
			if(qry_values_list(cntxt, &node->field, 3, &flt->where)) STACK_ERROR;
			DYNBUF_ADD_STR(&flt->where, ")");
		}

		/* Add WHERE clause for IdObj match list */
		if(node->idobjmatch.nbrows)
		{
			if(flt->where) DYNBUF_ADD_STR(&flt->where, " AND ");
			if(flt->b_userelobj)
				DYNBUF_ADD3_INT(&flt->where, "TLink", node->curjoin, ".IdRelObj IN(")
			else
				DYNBUF_ADD3_INT(&flt->where, "TLink", node->curjoin, ".IdObj IN(");
			if(qry_values_list(cntxt, &node->idobjmatch, 0, &flt->where)) STACK_ERROR;
			DYNBUF_ADD_STR(&flt->where, ")");
		}

		/* Parse match mode depending on node modifier */
#define USE_MEMBER(m) b_ok = 1; if(*where) DYNBUF_ADD_STR(where, " AND "); \
		if(qry_parse_matchmode(cntxt, where, m, node->curjoin, node->match, &node->value, &b_joinval))\
			STACK_ERROR; break
		if(node->match != NoMatch) 
		{
			int b_ok = 0;
			switch(node->modif)
			{
			case F_DateCr:
				switch(node->match)
				{
				case Exact:		
				case Different:	
				case Begin:
				case NotBegin:
				case Smaller:
				case SmallerEqual:
				case Larger:
				case LargerEqual:
				case InBound:	
				case NotInBound: USE_MEMBER("DateCr");
				}
				break;
			case F_DateDel:
				switch(node->match)
				{
				case Exact:		
				case Different:	
				case Begin:
				case NotBegin:
				case Smaller:
				case SmallerEqual:
				case Larger:
				case LargerEqual:
				case InBound:	
				case NotInBound: USE_MEMBER("DateDel");
				}
				break;
			case F_WhoCr:
				switch(node->match)
				{
				case ObjList:		
				case NotObjList: USE_MEMBER("IdWhoCr");
				}
				break;
			case F_WhoDel:
				switch(node->match)
				{
				case ObjList:		
				case NotObjList: USE_MEMBER("IdWhoDel");
				}
				break;
			case F_Obj:
				switch(node->match)
				{
				case ObjList:		
				case NotObjList: USE_MEMBER("IdObj");
				case RelList:		
				case NotRelList: USE_MEMBER("IdRelObj");
				}
			case F_RelObj:
				switch(node->match)
				{
				case ObjList:		
				case NotObjList: USE_MEMBER("IdRelObj");
				}
				break;
			case F_Value:
				switch(node->match)
				{
				case NotIdValList:	
				case IdValList:	USE_MEMBER("IdValue");
				case Exact:		
				case Different:	
				case Contain:	
				case NotContain:
				case Begin:
				case NotBegin:
				case Like:		
				case NotLike:	
				case Smaller:
				case SmallerEqual:
				case Larger:
				case LargerEqual:
				case InBound:	
				case NotInBound:
				case NumInBound:
				case NumNotInBound: USE_MEMBER("TxtValue");
				}
				break;
			default:
				switch(node->match)
				{
				case ObjList:		
				case NotObjList: USE_MEMBER("IdObj");
				case RelList:		
				case NotRelList: USE_MEMBER("IdRelObj");	
				case NotIdValList:	
				case IdValList:	USE_MEMBER("IdValue");
				case Exact:		
				case Different:	
				case Contain:	
				case NotContain:
				case Begin:
				case NotBegin:
				case Like:		
				case NotLike:	
				case Smaller:
				case SmallerEqual:
				case Larger:
				case LargerEqual:
				case InBound:	
				case NotInBound:
				case NumInBound:
				case NumNotInBound: USE_MEMBER("TxtValue");
				}
			}

			/* Handle error & return if applicable */
			if(!b_ok) RETURN_FILTER_ERROR("Invalid match mode for the modifier");
		}
#undef USE_MEMBER

		/* Handle node condition */
		if(node->cond)
		{
			char *start = node->cond->data;
			char *dot = strchr(start, '.');
			if(*where) DYNBUF_ADD_STR(where, "\nAND ");
			while(dot)
			{
				if(dot > start) DYNBUF_ADD(where, start, dot - start, NO_CONV);
				if(!strncmp(dot + 1, add_sz_str("Pkey")) ||
					!strncmp(dot + 1, add_sz_str("IdObj")) ||
					!strncmp(dot + 1, add_sz_str("IdField")) ||
					!strncmp(dot + 1, add_sz_str("IdValue")) ||
					!strncmp(dot + 1, add_sz_str("IdRelObj")) ||
					!strncmp(dot + 1, add_sz_str("Num")) ||
					!strncmp(dot + 1, add_sz_str("Line")) ||
					!strncmp(dot + 1, add_sz_str("Lang")) ||
					!strncmp(dot + 1, add_sz_str("DateCr")) ||
					!strncmp(dot + 1, add_sz_str("IdWhoCr")) ||
					!strncmp(dot + 1, add_sz_str("DateDel")) ||
					!strncmp(dot + 1, add_sz_str("IdWhoDel")))
				{
					DYNBUF_ADD3_INT(where, "TLink", node->curjoin, ".");
					start = dot + 1;
				}
				else if(!strncmp(dot + 1, add_sz_str("Field")))
				{
					DYNBUF_ADD3_INT(where, "TField", node->curjoin, ".TxtValue");
					start = dot + 5;
					b_joinfld = 1;
				}
				else if(!strncmp(dot + 1, add_sz_str("TxtValue")))
				{
					DYNBUF_ADD3_INT(where, "TVal", node->curjoin, ".TxtValue");
					start = dot + 8;
					b_joinval = 1;
				}
				dot = strchr(start, '.');
			}
			DYNBUF_ADD(where, start, node->cond->cnt - (start - node->cond->data), NO_CONV);
		}
		else
		{
			/* Handle Create / Delete user */
			if(node->whocr && node->whodel && node->whocr == node->whodel) 
			{
				if(flt->where) DYNBUF_ADD_STR(&flt->where, " AND ");
				if(dynbuf_print4(&flt->where, "(TLink%lu.IdWhoCr IN(%s) OR TLink%lu.IdWhoDel IN(%s))",
					node->curjoin, node->whocr->data, node->curjoin, node->whocr->data))
					RETURN_ERR_MEMORY;
			}
			else 
			{
				if(node->whocr) 
				{
					if(flt->where) DYNBUF_ADD_STR(&flt->where, " AND ");
					if(dynbuf_print2(&flt->where, "TLink%lu.IdWhoCr IN(%s)",
						node->curjoin, node->whocr->data))
						RETURN_ERR_MEMORY;
				}
				if(node->whodel) 
				{
					if(flt->where) DYNBUF_ADD_STR(&flt->where, " AND ");
					if(dynbuf_print2(&flt->where, "TLink%lu.IdWhoDel IN(%s)",
						node->curjoin, node->whodel->data))
						RETURN_ERR_MEMORY;
				}
			}

			/* Handle node create / delete dates criteria */
			if(!node->datemin[0] && !node->datemax[0])
			{
				if(flt->where) DYNBUF_ADD_STR(&flt->where, " AND ");
				DYNBUF_ADD3_INT(&flt->where, "TLink", node->curjoin, ".DateDel IS NULL \n");
			}
			else if(node->datemin[0] || node->datemax[0] && strcmp(node->datemax, cntxt->timestamp) < 0)
			{
				if(node->datemin[0])
				{
					if(flt->where) DYNBUF_ADD_STR(&flt->where, " AND ");
					if(dynbuf_print5(&flt->where,
						"TLink%lu.DateCr>='%s' AND (TLink%lu.DateDel IS NULL OR TLink%lu.DateDel>'%s')",
						node->curjoin, node->datemin, node->curjoin, node->curjoin, node->datemin))
						RETURN_ERR_MEMORY;
				}
				if(node->datemax[0])
				{
					if(flt->where) DYNBUF_ADD_STR(&flt->where, " AND ");
					if(dynbuf_print5(&flt->where,
						"TLink%lu.DateCr<='%s' AND (TLink%lu.DateDel IS NULL OR TLink%lu.DateDel<'%s')",
						node->curjoin, node->datemax, node->curjoin, node->curjoin, node->datemax))
						RETURN_ERR_MEMORY;
				}
			}
		}
		
		/* Add JOIN clause for TVal if applicable */
		if(b_joinval && !node->b_joinval)
		{
			node->b_joinval = 1;
			if(dynbuf_print3(&flt->join, "INNER JOIN TVal AS TVal%lu ON TLink%lu.IdValue=TVal%lu.IdValue\n",
											node->curjoin, node->curjoin, node->curjoin))
				RETURN_ERR_MEMORY;
		}
		
		/* Add JOIN clause for TField if applicable */
		if(b_joinfld && !node->b_joinfld)
		{
			node->b_joinfld = 1;
			if(dynbuf_print3(&flt->join, "INNER JOIN TVal AS TField%lu ON TLink%lu.IdField=TField%lu.IdValue\n",
											node->curjoin, node->curjoin, node->curjoin))
				RETURN_ERR_MEMORY;
		}
	}

	/* Handle SELECT member */
	flt->valnode = lastnode;
	valjoin = flt->valnode->curjoin;
	switch(mode)
	{
	case 3:
	case 2:
		/* Build selected IdObj + IdRelObj list */
		if(mode == 3) flt->selidobj = flt->srctable;
		DYNBUF_ADD3_INT(&flt->optselect, "TLink", valjoin ? 1 : 0, ".IdObj AS IdRelObj");
		break;

	case 0:
		/* Build selected value */
		if(qry_add_valnode_field(cntxt, flt, lastnode->modif)) STACK_ERROR;

		/* Output extended info if applicable */
		if(!flt->groupfn && flt->b_recdata) 
		{
			DYNBUF_ADD3_INT(&flt->optselect, "TLink", valjoin, ".IdObj AS IdValObj");
			DYNBUF_ADD_STR(&flt->orderby, "IdObj,IdValObj");
			DYNBUF_ADD3_INT(&flt->optselect, ",TLink", valjoin, ".Num AS Num");
			DYNBUF_ADD3_INT(&flt->optselect, ",TLink", valjoin, ".Line AS Line");
			
			if(flt->b_recdata > 1)
			{
				DYNBUF_ADD_STR(&flt->optselect, ",TField.TxtValue AS Field");
				DYNBUF_ADD3_INT(&flt->join, "LEFT JOIN TVal AS TField ON TLink", valjoin, ".IdField=TField.IdValue\n");
				DYNBUF_ADD3_INT(&flt->optselect, ",TLink", valjoin, ".IdField AS IdField");
				DYNBUF_ADD3_INT(&flt->optselect, ",TLink", valjoin, ".IdValue AS IdValue");
				DYNBUF_ADD_STR(&flt->orderby, ",Field");
				if(lastnode->modif == F_None)
					DYNBUF_ADD3_INT(&flt->optselect, ",IF(TLink", valjoin, ".IdRelObj IS NULL,0,1) AS IsRel")
				else if(lastnode->modif != F_Value)
					DYNBUF_ADD_STR(&flt->optselect, ",1 AS IsRel");
			}
			DYNBUF_ADD_STR(&flt->orderby, ",Num,Line");
		}
	}

	RETURN_OK_CLEANUP;
}
#undef ERR_FUNCTION
#undef ERR_CLEANUP

/*********************************************************************
** Function : qry_parse_fieldexpr
** Description : build query clauses for a field expression
*********************************************************************/
#define ERR_FUNCTION "qry_parse_fieldexpr"
#define ERR_CLEANUP 
int qry_parse_fieldexpr(			/* return : 0 on success, other on error */
	EVA_context *cntxt,				/* in/out : execution context data */
	char *field, size_t sz_field,	/* in : field / relation expression - see documentation for details */
	QryBuild *flt					/* in/out : filter calculation data */
){
	if(qry_parse_fieldexpr_nodes(cntxt, field, sz_field, flt)) STACK_ERROR;
	if(qry_build_clauses(cntxt, flt, 0)) STACK_ERROR;

	RETURN_OK_CLEANUP;
}
#undef ERR_FUNCTION
#undef ERR_CLEANUP

/*********************************************************************
** Function : qry_parse_fieldexpr_nodes
** Description : build select & join statements for a field expression
*********************************************************************/
#define ERR_FUNCTION "qry_parse_fieldexpr_nodes"
#define ERR_CLEANUP M_FREE(nextfield); \
					M_FREE(modif); \
					if(cntxt->err.text) err_print_filter(&cntxt->err.detail, flt)
int qry_parse_fieldexpr_nodes(		/* return : 0 on success, other on error */
	EVA_context *cntxt,				/* in : execution context data  */
	char *field, size_t sz_field,	/* in : field / relation expression - see documentation for details */
	QryBuild *flt					/* in/out : filter calculation data */
){
	DynBuffer *nextfield = NULL;
	DynBuffer *modif = NULL;
	DECLARE_FIELDEXPR_OP;
	char *parse, *next;
	QryBuilNode *node = flt->node + flt->nbnode;
	unsigned long n = flt->name.nbrows;

	/* Initialize parsing */
	if(!field || !sz_field || !*field) RETURN_OK;
	DYNTAB_ADD(&flt->name, n, 0, field, sz_field, NO_CONV);
	field = dyntab_val(&flt->name, n, 0);
	sz_field = dyntab_sz(&flt->name, n, 0);
	SEARCH_FIELDEXPR_OP(field);
	node->srcjoin = flt->srcjoin;

	/* Handle group function */
	if(paropn) 
	{
		/* Function must enclose the rest of the expression - return empty result if not */
		if(paropn < field + 2 || field[sz_field - 1] != ')' || relop && paropn > relop || dotsep && paropn > dotsep)
			RETURN_FILTER_ERROR("Group function : invalid position or parentheses");
		flt->b_oper = 1;
		DYNBUF_ADD(&flt->groupfn, field, paropn - field, NO_CONV);
		sz_field -= 2 + paropn - field;
		field = paropn + 1;
	}
	DYNBUF_ADD(&nextfield, field, sz_field, NO_CONV);
	field = nextfield->data;

	/* Parse expression : build nodes with field, modifiers & operators */
	parse = field;
	while(*parse)
	{
		/* Look for operators */
		SEARCH_FIELDEXPR_OP(parse);
		next = oper ? oper : field + sz_field;

		/* Add field to filter node */
		if(next > parse)
		{
			/* Read multiple fields separated with a comma */
			char *field = parse;
			if(node->field.nbrows)	RETURN_FILTER_ERROR("Multiple fields sequence in same node");
			do
			{
				char *comma = strchr(field, ',');
				if(!comma || comma > next) comma = next;
				if(comma > field) DYNTAB_ADD(&node->field, node->field.nbrows, 0, field, comma - field, NO_CONV);
				field = comma + 1;
			}
			while(*field && field < next);
		}

		/* Handle dot operator */
		if(oper && oper == dotsep)
		{
			if(node->modif != F_None) RETURN_FILTER_ERROR("Multiple field modifiers not allowed");
			next = relop ? relop : field + sz_field;
			M_FREE(modif);
			if(next > ++dotsep) DYNBUF_ADD(&modif, dotsep, next - dotsep, NO_CONV);
			parse = modif ? modif->data : "";
			node->modif = qry_parse_field_modifier(parse);
			if(node->modif == F_None) RETURN_FILTER_ERROR("Invalid field modifier");
		}

		/* Handle relation operators */
		else if(oper && oper == relop)
		{
			/* Error if invalid modifier */
			if(node->modif != F_None && node->modif != F_WhoCr && node->modif != F_WhoDel)
				RETURN_FILTER_ERROR("Invalid modifier before relation");
			node->rel = relop == reldir ? RelDirect : RelReverse;
			flt->srcjoin = flt->nbnode;
			node++;
			flt->nbnode++;
			node->srcjoin = flt->srcjoin;
			next = relop + 2;
		}
		else if(oper)
		{
			RETURN_FILTER_ERROR("Invalid operator");
		}

		parse = next;
	}
	flt->b_oper = flt->nbnode || flt->groupfn || flt->node[0].modif != F_None;
	if(!EMPTY_NODE(node)) flt->nbnode++;

	RETURN_OK_CLEANUP;
}
#undef ERR_FUNCTION
#undef ERR_CLEANUP

#undef RETURN_FILTER_ERROR
