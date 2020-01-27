/*********************************************************************
**        File : mem_utils.h
** Description : memory (malloc/free) handling utility functions
**      Author : Alain BOUTE
**     Created : Jan 3 2003
*********************************************************************/


/*********************************************************************
** Function : mem_trace
** Description : malloc / free trace utility
*********************************************************************/
void mem_trace(
	char *type,					/* in : free / alloc or NULL for initialisation */
	void *mem					/* in : alloc-ed pointer */
);

/*********************************************************************
** Function : mem_alloc
** Description : malloc wrapper
*********************************************************************/
void *mem_alloc(				/* return : realloc(src, new_sz) */
	size_t sz					/* in : size increment */
);

/*********************************************************************
** Function : mem_strdup
** Description : strdup wrapper
*********************************************************************/
char *mem_strdup(				/* return : realloc(src, new_sz) */
	char *src					/* in : string to duplicate */
);

/*********************************************************************
** Function : mem_free
** Description : free wrapper
*********************************************************************/
void mem_free(
	void *src					/* in : old pointer */
);

/*********************************************************************
** Function : mem_realloc
** Description : realloc wrapper
*********************************************************************/
void *mem_realloc(				/* return : realloc(src, new_sz) */
	void *src,					/* in : old pointer */
	size_t old_sz,				/* in : old size */
	size_t incr					/* in : size increment */
);
