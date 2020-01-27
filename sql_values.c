/*********************************************************************
**        File : sql_values.c
** Description : values handling functions for EVA DB schema
**      Author : Alain BOUTE
**     Created : Aug 15 2001
*********************************************************************/

#include "eva.h"

/*********************************************************************
** Function : sql_id_values
** Description : return value identifiers matching val in table TVal
*********************************************************************/
#define ERR_FUNCTION "sql_id_values"
#define ERR_CLEANUP DYNTAB_FREE(value); M_FREE(sql)
int sql_id_values(			/* return : 0 on success, other on error */
	EVA_context *cntxt,		/* in/out : execution context data */
	DynTable *res,			/* out : matching IdValues */
	char *val,				/* in : value to search for */
	size_t sz_val,			/* in : val string length */
	MatchMode matchmode,	/* in : how is searched value ? */
	unsigned long limit		/* in : max # of returned values */
){
 	DynBuffer *sql = NULL;
	DynTable value = {0};

	/* Check & init params */
	if(!res) RETURN_OK;
	dyntab_free(res);
	STRIP_SPACES_AROUND(val, sz_val);
	if(!val || !*val || !sz_val) RETURN_OK;
	DYNTAB_ADD(&value, 0, 0, val, sz_val, NO_CONV);

	/* Search in values table */
	DYNBUF_ADD3(&sql, 
		"-- sql_id_values : [", val, sz_val, EXPORT_TABRC, "]\n"
		"SELECT IdValue, TxtValue FROM TVal AS TVal0 WHERE ");
	if(qry_parse_matchmode(cntxt, &sql, "TxtValue", 0, matchmode, &value, NULL))
		STACK_ERROR;
	if(limit)
		DYNBUF_ADD3_INT(&sql, " LIMIT ", limit, "");
	if(sql_exec_query(cntxt , sql->data) || sql_get_table(cntxt, res, 0)) STACK_ERROR;

	RETURN_OK_CLEANUP;
}
#undef ERR_FUNCTION
#undef ERR_CLEANUP

/*********************************************************************
** Function : sql_id_value
** Description : return a value identifier in table TVal
*********************************************************************/
#define ERR_FUNCTION "sql_id_value"
#define ERR_CLEANUP DYNTAB_FREE(sqlres)
int sql_id_value(			/* return : 0 on success, other on error */
	EVA_context *cntxt,		/* in/out : execution context data */
	char *val,				/* in : value to search for */
	size_t sz_val,			/* val string length */
	unsigned long *id		/* out : value Id or 0 on error  */
){
	DynTable sqlres = { 0 };
	unsigned long i;

	/* Search value in values table */
	*id = 0;
	if(sql_id_values(cntxt , &sqlres, val, sz_val, Exact, 0)) STACK_ERROR;

	/* Search for exact value in results */
	for(i = 0; !*id && i < sqlres.nbrows; i++)
		if(!dyntab_txt_cmp(val, sz_val, &sqlres, i, 1))
			*id = DYNTAB_TOULRC(&sqlres, i, 0);

	RETURN_OK_CLEANUP;
}
#undef ERR_FUNCTION
#undef ERR_CLEANUP

/*********************************************************************
** Function : get_id_value
** Description : return a value identifier in table TVal
*********************************************************************/
unsigned long get_id_value(	/* return : value Id or 0 on error */
	EVA_context *cntxt,		/* in/out : execution context data */
	char *val,				/* in : value to search for */
	size_t sz_val			/* val string length */
){
	unsigned long res;
	return sql_id_value(cntxt , val, sz_val, &res) ? 0 : res;
}
#undef ERR_FUNCTION
#undef ERR_CLEANUP

/*********************************************************************
** Function : sql_add_value
** Description : return a value identifier / create if necessary
*********************************************************************/
#define ERR_FUNCTION "sql_add_value"
#define ERR_CLEANUP DYNTAB_FREE(sqlres); \
					M_FREE(sql)
int sql_add_value(			/* return : 0 on success, other on error */
	EVA_context *cntxt,		/* in/out : execution context data */
	char *val,				/* in : value to search for & create */
	size_t sz_val,			/* in : val string length */
	unsigned long *id		/* out : value Id - 0 on error or empty value */
)
{
	DynTable sqlres = { 0 };
 	DynBuffer *sql = NULL;

	/* Check params */
	if(!id) RETURN_ERR_PARAM(1);
	*id = 0;
	if(!val || !*val || !sz_val) RETURN_OK;

	/* Get value Id & return if found */
	if(sql_id_value(cntxt, val, sz_val, id)) STACK_ERROR;
	if(*id) RETURN_OK;

	/* Create new value if needed */
	if(!*id)
	{
		/* Get the next available IdValue */
		if(sql_exec_query(cntxt , 
			"-- sql_add_value : Get the next available IdValue\n"
			"SELECT Max(IdValue)+1 FROM TVal") || 
			sql_get_table(cntxt, &sqlres, 0)) STACK_ERROR;
		*id = sqlres.nbrows ? DYNTAB_TOUL(&sqlres) : 1;

		/* Insert New value in values table */
		DYNBUF_ADD3_INT(&sql, 
			"-- sql_add_value : Insert New value in values table\n"
			"INSERT INTO TVal (IdValue, TxtValue) VALUES (", *id, ", ");
		DYNBUF_ADD3(&sql, "'", val, sz_val, SQL_NO_QUOTE, "')");
		if(sql_exec_query(cntxt , sql->data)) STACK_ERROR;
	}
	
	if(sql_id_value(cntxt, val, sz_val, id)) STACK_ERROR;
	if(!*id) RETURN_ERROR("Impossible de créer une nouvelle valeur", ERR_PUT_TXT("val=", val, sz_val));

	RETURN_OK_CLEANUP;
}
#undef ERR_FUNCTION
#undef ERR_CLEANUP
