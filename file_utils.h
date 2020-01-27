/*********************************************************************
**        File : file_utils.h
** Description : TAB/RC files handling utilities
**      Author : Alain BOUTE
**     Created : April 28 2002
*********************************************************************/


/*********************************************************************
** Fonction : file_read_tabrc
** Description : read a tabulated text file
*********************************************************************/
int file_read_tabrc(				/* return : 0 on success, other on error */
	EVA_context *cntxt,				/* in : execution context data */
	DynTable *res,					/* out : result table */
	char *file						/* in : input file name */
);

/*********************************************************************
** Fonction : file_read_import_data
** Description : read object format file into forms & object data dyntables
*********************************************************************/
int file_read_import_data(			/* return : 0 on success, other on error */
	EVA_context *cntxt,				/* in : execution context data */
	DynTable *forms,				/* out : forms referenced by imported objects */
	DynTable *objdata,				/* out : imported objects data */
	char *file						/* in : input file name */
);

/*********************************************************************
** Fonction : FILE_write_tabrc
** Description : write a table in a tabulated text file
*********************************************************************/
int FILE_write_tabrc(				/* return : 0 on success, other on error */
	EVA_context *cntxt,				/* in : execution context data */
	DynTable *data,					/* in : table to write */
	FILE *f							/* in : output file stream */
);

/*********************************************************************
** Fonction : file_write_tabrc
** Description : write a table in a tabulated text file
*********************************************************************/
int file_write_tabrc(				/* return : 0 on success, other on error */
	EVA_context *cntxt,				/* in : execution context data */
	DynTable *data,					/* in : table to write */
	char *file						/* in : input file name */
);

/*********************************************************************
** Fonction : chdir_user_doc
** Description : change current directory to user temporary documents
*********************************************************************/
int chdir_user_doc(				/* return : 0 on success, other on error */
	EVA_context *cntxt			/* in : execution context data */
);

/*********************************************************************
** Fonction : chdir_db_doc
** Description : change current directory to database documents
*********************************************************************/
int chdir_db_doc(				/* return : 0 on success, other on error */
	EVA_context *cntxt			/* in : execution context data */
);

/*********************************************************************
** Fonction : file_compatible_name
** Description : modify a file name to avoid systeme compatibility problems
*********************************************************************/
char *file_compatible_name(			/* return : name overwriten */
	char *name						/* in/out : file name */
);

/*********************************************************************
** Fonction : ucase_accent
** Description : ucase function handling accents
*********************************************************************/

/*********************************************************************
** Fonction : ucase_accent
** Description : case function handling accents
*********************************************************************/
char *setcase(				/* return : string overwriten */
	int b_upper,			/* in : convert to uppercase if set lowercase else */
	char *txt,				/* in/out : string to convert */
	size_t len				/* in : max # of char to convert */
);
