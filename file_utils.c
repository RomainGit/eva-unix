/*********************************************************************
**        File : file_utils.c
** Description : TAB/RC files handling utilities
**      Author : Alain BOUTE
**     Created : April 28 2002
*********************************************************************/

#include "eva.h"

/*********************************************************************
** Fonction : file_tabrc_to_dyntab
** Description : store tabulated text data in a dyntable
*********************************************************************/
#define ERR_FUNCTION "file_tabrc_to_dyntab"
#define ERR_CLEANUP 
int file_tabrc_to_dyntab(			/* return : 0 on success, other on error */
	EVA_context *cntxt,				/* in : execution context data */
	DynTable *res,					/* out : result table */
	char *data,						/* in : file data with \n & \t delimitors */
	size_t sz						/* in : size of data */
){
	unsigned long row = 0, col = 0, i, i0;

	/* Read records in DynTable */
	dyntab_free(res);
	for(i = 0, i0 = 0; i < sz; i++) 
		switch(data[i])
		{
		case '\t':
			if(i > i0) DYNTAB_ADD(res, row, col, data + i0, i - i0, IMPORT_TABRC);
			col++;
			i0 = i+1;
			break;
		case '\n':
			if(i > i0) DYNTAB_ADD(res, row, col, data + i0, i - i0, IMPORT_TABRC);
			col = 0;
			row++;
			i0 = i+1;
			break;
		}
	if(i > i0) DYNTAB_ADD(res, row, col, data + i0, i - i0, IMPORT_TABRC);

	RETURN_OK_CLEANUP;
}
#undef ERR_FUNCTION
#undef ERR_CLEANUP

/*********************************************************************
** Fonction : file_read_tabrc
** Description : read a tabulated text file in a dyntable
*********************************************************************/
#define ERR_FUNCTION "file_read_tabrc"
#define ERR_CLEANUP if(f) fclose(f); M_FREE(fdata)
int file_read_tabrc(				/* return : 0 on success, other on error */
	EVA_context *cntxt,				/* in : execution context data */
	DynTable *res,					/* out : result table */
	char *file						/* in : input file name */
){
	struct stat sts;			/* for stat() */
	FILE *f = 0;				/* stdio file pointer */
	size_t sz;			/* char counters */
	char *fdata = NULL;			/* alloc-ed file data */

	/* Read file status & alloc memory for file data */
	if(!file || stat(file, &sts)) RETURN_ERROR("Fichier non trouvÈ", NULL);
	M_ALLOC(fdata, sts.st_size+16);

	/* Open file & read data */
	f = fopen(file, "r");
	if(!f)  RETURN_ERROR("Impossible d'ouvrir le fichier", NULL);
	sz = fread(fdata, 1, sts.st_size+2, f);
	fdata[sz] = 0;
	fclose(f); f = NULL;

	/* Read records in DynTable */
	if(file_tabrc_to_dyntab(cntxt, res, fdata, sz)) STACK_ERROR;

	RETURN_OK_CLEANUP;
}
#undef ERR_FUNCTION
#undef ERR_CLEANUP

/*********************************************************************
** Fonction : file_read_import_data
** Description : read object format file into forms & object data dyntables
*********************************************************************/
#define ERR_FUNCTION "file_read_import_data"
#define ERR_CLEANUP if(f) fclose(f); M_FREE(fdata)
int file_read_import_data(			/* return : 0 on success, other on error */
	EVA_context *cntxt,				/* in : execution context data */
	DynTable *forms,				/* out : forms referenced by imported objects */
	DynTable *objdata,				/* out : imported objects data */
	char *file						/* in : input file name */
){
	struct stat sts;			/* for stat() */
	FILE *f = 0;				/* stdio file pointer */
	size_t sz;					/* char counter */
	char *fdata = NULL;			/* alloc-ed file data */
	char *p1;

	/* Read file status & alloc memory for file data */
	if(!file || stat(file, &sts)) RETURN_ERROR("Import file not found", NULL);
	M_ALLOC(fdata, sts.st_size+2);

	/* Open file & read data */
	f = fopen(file, "r");
	if(!f)  RETURN_ERROR("Cannot open import file", NULL);
	sz = fread(fdata, 1, sts.st_size + 2, f);
	if(!sz)  RETURN_ERROR("Cannot read import file", NULL);
	fdata[sz] = 0;
	fclose(f); f = NULL;

	/* Find end of forms marker : two consecutive \n */
	p1 = strstr(fdata, "\n\n");
	if(strncmp(fdata, add_sz_str("IdObj	Label\n")) ||
		!p1 || strncmp(p1 + 2, add_sz_str("IdObj	Field	Value	Type	Num	Line\n")))
		RETURN_ERROR("Invalid format for import file", NULL);
	*p1 = 0;

	/* Read forms & objdata in DynTable */
	if(file_tabrc_to_dyntab(cntxt, forms, fdata, p1 - fdata)) STACK_ERROR;
	if(file_tabrc_to_dyntab(cntxt, objdata, p1 + 2, sz - (p1 - fdata) - 2)) STACK_ERROR;

	RETURN_OK_CLEANUP;
}
#undef ERR_FUNCTION
#undef ERR_CLEANUP

/*********************************************************************
** Fonction : chdir_user_doc
** Description : change current directory to user temporary documents
*********************************************************************/
#define ERR_FUNCTION "chdir_user_doc"
#define ERR_CLEANUP
int chdir_user_doc(				/* return : 0 on success, other on error */
	EVA_context *cntxt			/* in : execution context data */
){
	if(chdir_db_doc(cntxt)) STACK_ERROR;
	mkdir(dyntab_val(&cntxt->id_user, 0, 0));
	if(chdir(dyntab_val(&cntxt->id_user, 0, 0))) RETURN_ERR_DIRECTORY(1);
	RETURN_OK_CLEANUP;
}
#undef ERR_FUNCTION
#undef ERR_CLEANUP

/*********************************************************************
** Fonction : chdir_db_doc
** Description : change current directory to database documents
*********************************************************************/
#define ERR_FUNCTION "chdir_db_doc"
#define ERR_CLEANUP
int chdir_db_doc(				/* return : 0 on success, other on error */
	EVA_context *cntxt			/* in : execution context data */
){
	if(chdir(cntxt->path) || chdir("..")) RETURN_ERR_DIRECTORY(1);
	mkdir(DIRECTORY_DOCS);
	if(chdir(DIRECTORY_DOCS)) RETURN_ERR_DIRECTORY(1);
	mkdir(cntxt->dbname);
	if(chdir(cntxt->dbname)) RETURN_ERR_DIRECTORY(1);
	RETURN_OK_CLEANUP;
}
#undef ERR_FUNCTION
#undef ERR_CLEANUP

/*********************************************************************
** Fonction : chdir_user_export
** Description : change current directory to user temporary export files
*********************************************************************/
#define ERR_FUNCTION "chdir_user_export"
#define ERR_CLEANUP
int chdir_user_export(			/* return : 0 on success, other on error */
	EVA_context *cntxt			/* in : execution context data */
){
	if(chdir(cntxt->path) || chdir("..") || mkdir(DIRECTORY_DOCS) || chdir(DIRECTORY_DOCS) ||
		mkdir(cntxt->dbname)|| chdir(cntxt->dbname) ||
		mkdir(dyntab_val(&cntxt->id_user, 0, 0)) || chdir(dyntab_val(&cntxt->id_user, 0, 0)))
		RETURN_ERROR("Error during acces to user directory", NULL);

	RETURN_OK_CLEANUP;
}
#undef ERR_FUNCTION
#undef ERR_CLEANUP

/*********************************************************************
** Fonction : FILE_write_tabrc
** Description : write a table in a tabulated text file
*********************************************************************/
#define ERR_FUNCTION "FILE_write_tabrc"
#define ERR_CLEANUP M_FREE(buf)
int FILE_write_tabrc(				/* return : 0 on success, other on error */
	EVA_context *cntxt,				/* in : execution context data */
	DynTable *data,					/* in : table to write */
	FILE *f							/* in : output file stream */
){
	DynBuffer *buf = NULL;
	unsigned long i, j;

	if(!data || !f) RETURN_OK;

	/* Output objects data */
	for(i = 0; i < data->nbrows; i++) 
		for(j = 0; j < data->nbcols; j++)
		{
			DYNBUF_ADD_CELL(&buf, data, i, j, EXPORT_TABRC);
			fprintf(f, "%s%s", buf->data, j < data->nbcols-1 ?  "\t" : "\n");
			M_FREE(buf);
		}

	RETURN_OK_CLEANUP;
}
#undef ERR_FUNCTION
#undef ERR_CLEANUP

/*********************************************************************
** Fonction : file_write_tabrc
** Description : write a table in a tabulated text file
*********************************************************************/
#define ERR_FUNCTION "file_write_tabrc"
#define ERR_CLEANUP if(f) fclose(f); \
					M_FREE(buf)
int file_write_tabrc(				/* return : 0 on success, other on error */
	EVA_context *cntxt,				/* in : execution context data */
	DynTable *data,					/* in : table to write */
	char *file						/* in : output file name */
){
	DynBuffer *buf = NULL;
	FILE *f = NULL;

	if(!data) RETURN_OK;

	/* Open export file */
	f = fopen(file, "w");
	if(!f) RETURN_ERROR("Impossible d'Ècrire dans le fichier", NULL);

	if(!FILE_write_tabrc(cntxt, data, f)) STACK_ERROR;

	RETURN_OK_CLEANUP;
}
#undef ERR_FUNCTION
#undef ERR_CLEANUP

/*********************************************************************
** Fonction : file_compatible_name
** Description : modify a file name to avoid systeme compatibility problems
*********************************************************************/
char *file_compatible_name(			/* return : name overwriten */
	char *name						/* in/out : file name */
){
	unsigned long i;

	for(i = 0; name[i]; i++)
	{
		if(strchr("\\/:*?<>|", name[i])) name[i] = '_';
		else if(strchr("\t\n", name[i])) name[i] = ' ';
		else if(strchr("\"'", name[i])) name[i] = '®';
	}

	return name;
}

/*********************************************************************
** Fonction : setcase
** Description : case function handling accents
*********************************************************************/
char *setcase(				/* return : string overwriten */
	int mode,				/* in : conversion mode
								bit0 : convert to uppercase if set lowercase else
								bit 1 : do not use accents in output if set */
	char *txt,				/* in/out : string to convert */
	size_t len				/* in : max # of char to convert */
){
	unsigned long i;
	char *lwa = "‡·‚„‰ÂÊÁÈËÍÎÏÌÓÔÚÛÙıˆ˘˙˚¸";
	char *uwa = "¿¡¬√ƒ≈∆«…» ÀÃÕŒœ“”‘’÷Ÿ⁄€‹";
	char *lna = "aaaaaaeceeeeiiiiooooouuuu";
	char *una = "AAAAAAECEEEEIIIIOOOOOUUUU";
	char *src = mode & 1 ? lwa : uwa;
	char *dst = mode & 1 ? (mode & 2 ? una : uwa) : (mode & 2 ? lna : lwa);

	/* Check params */
	if(!txt || !*txt) return txt;

	/* No size limit if len is 0 */
	if(!len) len = ~0UL;

	/* Convert each char */
	for(i = 0; txt[i] && i < len; i++)
	{
		char *t = txt + i;
		char *c = strchr(src, *t);
		if(c)
			*t = dst[c - src];
		else if(mode & 1)
			*t = (char)toupper(*t);
		else
			*t = (char)tolower(*t);
	}

	return txt;
}
