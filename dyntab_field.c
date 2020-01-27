/*********************************************************************
**        File : dyntab_field.c
** Description : dynamic size table fields handling functions
**      Author : Alain BOUTE
**     Created : Dec 24 2002
*********************************************************************/

#include <stdlib.h>
#include "dyntab.h"

/*********************************************************************
** Function : dyntab_next_field
** Description : return the index of first row matching a given field
*********************************************************************/
unsigned long dyntab_next_field		/* return : row index in tab 
												tab->nbrows if no match */
(
	DynTable *tab,					/* in : table to process */
	char *field,				 	/* in : field to match */
	unsigned long matchcol,			/* in : column index used for search */
	int matchmode,					/* in : how to select rows
										0 : !strcmp(cell[matchcol].txt, field)
										1 : !strcmp(cell[matchcol].field, field)
										2 : matchcol == cell[0].col+1 */
	unsigned long row				/* in : first row to search in tab */
){
	unsigned long i;

	if(!tab) return 0;
	if(!tab->nbrows || (matchmode != 2 && matchcol >= tab->nbcols)) return tab->nbrows;

	for(i = row; i < tab->nbrows; i++)
	{
		DynTableCell *cell = dyntab_cell(tab, i, matchmode == 2 ? 0 : matchcol);
		if(!cell) continue;
		if(cell->IdObj != tab->cell[row].IdObj) return tab->nbrows;
		if(		matchmode == 2 ? 
					(cell->col == matchcol) :
				matchmode == 1 ? 
					(!field || !strcmp(cell->field ? cell->field : "", field)) : 
				/* default matchmode */
				(!field || !strcmp(cell->txt ? cell->txt : "", field)))
			return i;
	}
	return tab->nbrows;
}

/*********************************************************************
** Function : dyntab_filter_field
** Description : return a subset of rows matching a given field
*********************************************************************/
int dyntab_filter_field(			/* return : 0 on success, other on error */
	DynTable *res,					/* out : filtered table */
	int b_copyval,					/* in : duplicate values if not 0 */
	DynTable *tab,					/* in : table to process */
	char *field,				 	/* in : field to match */
	unsigned long matchcol,			/* in : column index used for search */
	int matchmode,					/* in : see dyntab_next_field */
	unsigned long *row				/* in : first row to process in tab
									  out : last processed row in tab */
){
	unsigned long i, j;

	if(!res || !tab || (matchmode != 2 && matchcol >= tab->nbcols)) return 0;

	i = dyntab_next_field(tab, field, matchcol, matchmode, row ? *row : 0);
	while(i < tab->nbrows)
	{
		DynTableCell *cell = dyntab_cell(tab, i, matchmode == 2 ? 0 : matchcol);
		if(cell->IdObj != tab->cell[row ? *row : 0].IdObj)
		{
			if(row) *row = i - 1;
			return 0;
		}
		for(j = 0; j < tab->nbcols; j++)
			if(dyntab_copy(res, res->nbrows, j, dyntab_cell(tab, i, j), b_copyval)) return 1;
		i = dyntab_next_field(tab, field, matchcol, matchmode, i + 1);
	}
	if(row) *row = i - 1;
	return 0;
}

/*********************************************************************
** Function : dyntab_field_val
** Description : return the value of first row matching a given field
*********************************************************************/
char *dyntab_field_val				/* return : 1st value of field in tab */
(
	DynTable *tab,					/* in : table to process */
	char *field,				 	/* in : field to match */
	unsigned long matchcol,			/* in : column index used for search */
	int matchmode,					/* in : how to select rows - see dyntab_next_field */
	unsigned long row				/* in : first row to search in tab */
){
	unsigned long i;

	if(!tab) return "";
	i = dyntab_next_field(tab, field, matchcol, matchmode, row);
	return dyntab_val(tab, i, matchcol);
}

/*********************************************************************
** Function : dyntab_field_cell
** Description : return the cell of first row matching a given field
*********************************************************************/
DynTableCell *dyntab_field_cell		/* return : 1st cell or NULL if not found */
(
	DynTable *tab,					/* in : table to process */
	char *field,				 	/* in : field to match */
	unsigned long matchcol,			/* in : column index used for search */
	int matchmode,					/* in : how to select rows - see dyntab_next_field */
	unsigned long row				/* in : first row to search in tab */
){
	unsigned long i;

	if(!tab) return NULL;
	i = dyntab_next_field(tab, field, matchcol, matchmode, row);
	return i < tab->nbrows ? dyntab_cell(tab, i, 0) : NULL;
}
