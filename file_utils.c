/*********************************************************************
** ---------------------- Copyright notice ---------------------------
** This source code is part of the EVASoft project
** It is property of Alain Boute Ingenierie - www.abing.fr and is
** distributed under the GNU Public Licence version 2
** Commercial use is submited to licencing - contact eva@abing.fr
** -------------------------------------------------------------------
**        File : file_utils.c
** Description : TAB/RC files handling utilities
**      Author : Alain BOUTE
**     Created : April 28 2002
*********************************************************************/

#include "eva.h"

/*********************************************************************
** Fonction : strip_rc
** Description : remove \r char from windows text files
*********************************************************************/
size_t strip_rc(                /* return : new length of v */
	char *v,					/* in/out : text to strip in place */
	size_t s					/* in : size of v */
){
	size_t src = 0, dst = 0;
	while(src < s && v[src])
	{
        if(v[src] == '\r')
        {
            if(v[src+1] == '\n' || (src && v[src-1] == '\n')) { src++; continue; }
            v[src] = '\n';
        }
        if(src != dst) v[dst] = v[src];
        src++; dst++;
	}
    v[dst] = 0;
    return dst;
}

/*********************************************************************
** Fonction : file_date
** Description : return modification date for a file - 0 on error
*********************************************************************/
time_t file_date(                /* return : modification date */
	char *fpath					/* in : file path to read */
) {
	struct stat fs;
	time_t t = 0;
	if(!stat(fpath, &fs))
		t = fs.st_mtime;
	return t;
}

/*********************************************************************
** Fonction : dyntab_add_strip
** Description : store text data in a dyntable
*********************************************************************/
#define ERR_FUNCTION "dyntab_add_strip"
#define ERR_CLEANUP
int dyntab_add_strip(			/* return : 0 on success, other on error */
	EVA_context *cntxt,				/* in : execution context data */
	DynTable *res,				/* in/out : result table */
	unsigned long row,			/* in : cell to modify */
	unsigned long col,			/* in : cell to modify */
	char *v,					/* in : value to add */
	size_t s					/* in : size of value */
){
	STRIP_SPACES_AROUND(v, s);
	if(s) DYNTAB_ADD(res, row, col, v, s, IMPORT_TABRC);
	RETURN_OK_CLEANUP;
}
#undef ERR_FUNCTION
#undef ERR_CLEANUP

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
	{
		switch(data[i])
		{
		case '\t':
			if(i > i0 && dyntab_add_strip(cntxt, res, row, col, data + i0, i - i0)) STACK_ERROR;
			col++;
			i0 = i+1;
			break;
		case '\n':
			if(i > i0 && dyntab_add_strip(cntxt, res, row, col, data + i0, i - i0)) STACK_ERROR;
			col = 0;
			row++;
			i0 = i+1;
			break;
		}
	}
	if(i > i0 && dyntab_add_strip(cntxt, res, row, col, data + i0, i - i0)) STACK_ERROR;

	RETURN_OK_CLEANUP;
}
#undef ERR_FUNCTION
#undef ERR_CLEANUP

/*********************************************************************
** Fonction : file_to_dynbuf
** Description : read a file in a dynbuffer
*********************************************************************/
#define ERR_FUNCTION "file_to_dynbuf"
#define ERR_CLEANUP
int file_to_dynbuf(					/* return : 0 on success, other on error */
	EVA_context *cntxt,				/* in : execution context data */
	DynBuffer **res,				/* out : result buffer */
	char *file						/* in : input file name */
){
	struct stat sts;			/* for stat() */
	FILE *f = 0;				/* stdio file pointer */

	/* Read file status & alloc memory for file data */
	if(!res || !file || !*file) RETURN_OK;
	if(stat(file, &sts)) RETURN_ERROR("File not found", ERR_PUT_TXT("file = ", file, 0));
	*res = dynbuf_init(sts.st_size+16);

	/* Open file & read data */
	f = fopen(file, "rb");
	if(!f)  RETURN_ERROR("No read acces to file" , ERR_PUT_TXT("file = ", file, 0));
	(*res)->cnt = fread((*res)->data, 1, sts.st_size+2, f);
	fclose(f);

	/* Remove \r\n from windows files */
	(*res)->cnt = strip_rc((*res)->data, (*res)->cnt);

	RETURN_OK_CLEANUP;
}
#undef ERR_FUNCTION
#undef ERR_CLEANUP

/*********************************************************************
** Fonction : file_read_tabrc
** Description : read a tabulated text file in a dyntable
*********************************************************************/
#define ERR_FUNCTION "file_read_tabrc"
#define ERR_CLEANUP M_FREE(fdata)
int file_read_tabrc(				/* return : 0 on success, other on error */
	EVA_context *cntxt,				/* in : execution context data */
	DynTable *res,					/* out : result table */
	char *file						/* in : input file name or uploaded file IdObj */
){
	char fpath[2048];			/* file path if uploaded */
	DynBuffer *fdata = NULL;	/* file data */
	unsigned long id;			/* uploaded file IdObj */
	char *end = NULL;			/* for strtoul */
	DynTable fname = {0};		/* uploaded file name */

	/* Check if file is IdObj */
	id = strtoul(file, &end, 10);
	if(id && (!end || !*end))
	{
		/* file is an uploaded object : get uploaded file path */
		if(qry_obj_field(cntxt, &fname, id, "_EVA_FILE_SERVER_NAME")) STACK_ERROR;
		snprintf(add_sz_str(fpath), "../docs/%s/%s", cntxt->dbname, dyntab_val(&fname, 0, 0));
		file = fpath;
	}

	/* Read records in DynTable */
	if(file_to_dynbuf(cntxt, &fdata, file) ||
		file_tabrc_to_dyntab(cntxt, res, fdata->data, fdata->sz)) STACK_ERROR;

	RETURN_OK_CLEANUP;
}
#undef ERR_FUNCTION
#undef ERR_CLEANUP

/*********************************************************************
** Fonction : file_read_config
** Description : return file name from file name or file IdObj
*********************************************************************/
#define ERR_FUNCTION "file_read_config"
#define ERR_CLEANUP
int file_read_config(				/* return : 0 on success, other on error */
	EVA_context *cntxt				/* in/out : execution context data */
){
	DynTable *usr = &cntxt->cnf_users;

	/* Read SQL users configuration file */
	if(chdir(cntxt->rootdir) || chdir("..") || chdir("conf")) RETURN_ERROR("No ~/conf directory", {});
	if(file_read_tabrc(cntxt, usr, "users.conf"))
	{
		/* No config file : use root */
		CLEAR_ERROR_NOWARN;
		cntxt->dbuser = "root";
	}
	else {
		/* Look for first matching account */
		unsigned long i;
		for(i = 0; i < usr->nbrows; i++)
		{
			char* c = dyntab_val(usr, i, 0);
			if(*c && strcmp(cntxt->dbname, c)) continue;
			cntxt->dbuser = dyntab_val(usr, i, 1);
			cntxt->dbpwd = dyntab_val(usr, i, 2);
			cntxt->dbhost = dyntab_val(usr, i, 3);
			cntxt->dbport = atoi(dyntab_val(usr, i, 4));
			if (cntxt->dbhost && !cntxt->dbhost[0]) cntxt->dbhost = NULL;
			break;
		}
	}

	/* Read external procedures & list export buttons configuration files */
	if( file_read_tabrc(cntxt, &cntxt->cnf_extproc, "extproc.conf") ||
        file_read_tabrc(cntxt, &cntxt->cnf_lstproc, "lstproc.conf")) CLEAR_ERROR_NOWARN;

	if(chdir(cntxt->path)) CLEAR_ERROR_NOWARN;

	RETURN_OK_CLEANUP;
}
#undef ERR_FUNCTION
#undef ERR_CLEANUP

/*********************************************************************
** Fonction : file_from_idobj
** Description : return file name from file name or file IdObj
*********************************************************************/
#define ERR_FUNCTION "file_from_idobj"
#define ERR_CLEANUP
int file_from_idobj(				/* return : 0 on success, other on error */
	EVA_context *cntxt,				/* in : execution context data */
	char **file,					/* in : file name or object Id
									   out : file name */
	DynTable *data					/* out : temporary data (free after file is used) */
){
	unsigned long idobj = (file && *file) ? strtoul(*file, NULL, 10) : 0;
	if(idobj)
	{
		if(qry_obj_field(cntxt, data, idobj, "_EVA_FILE_SERVER_NAME")) STACK_ERROR;
		if(data->nbrows) *file = data->cell->txt;
	}

	RETURN_OK_CLEANUP;
}
#undef ERR_FUNCTION
#undef ERR_CLEANUP

/*********************************************************************
** Fonction : file_read_import_data
** Description : read object format file into forms & object data dyntables
*********************************************************************/
#define ERR_FUNCTION "file_read_import_data"
#define ERR_CLEANUP if(f) fclose(f); \
					M_FREE(fdata); \
					DYNTAB_FREE(data)
int file_read_import_data(			/* return : 0 on success, other on error */
	EVA_context *cntxt,				/* in : execution context data */
	DynTable *forms,				/* out : forms referenced by imported objects */
	DynTable *objdata,				/* out : imported objects data */
	char *file						/* in : input file name */
){
	DynTable data = { 0 };
	struct stat sts;			/* for stat() */
	FILE *f = 0;				/* stdio file pointer */
	size_t sz;					/* char counter */
	char *fdata = NULL;			/* alloc-ed file data */
	char *p1;

	/* Handle file object */
	if(!file || !*file) RETURN_ERROR("Import file is NULL", NULL);
	if(file_from_idobj(cntxt, &file, &data)) STACK_ERROR;

	/* Read file status & alloc memory for file data */
	if(!file || stat(file, &sts)) RETURN_ERROR("Import file not found", NULL);
	M_ALLOC(fdata, sts.st_size+2);

	/* Open file & read data */
	f = fopen(file, "r");
	if(!f)  RETURN_ERROR("Cannot open import file", NULL);
	sz = fread(fdata, 1, sts.st_size + 2, f);
	if(!sz)  RETURN_ERROR("Cannot read import file", NULL);
	fclose(f); f = NULL;
	fdata[sz] = 0;
	sz = strip_rc(fdata, sz + 1);

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
	char* user_id = dyntab_val(&cntxt->id_user, 0, 0);
	if(chdir_db_doc(cntxt)) STACK_ERROR;
	if(chdir(user_id) && (MKDIR(user_id) || chdir(user_id))) RETURN_ERR_DIRECTORY;
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
	if(chdir(cntxt->rootdir) ||
		(chdir(DIRECTORY_DOCS) && (MKDIR(DIRECTORY_DOCS) || chdir(DIRECTORY_DOCS))) ||
		(chdir(cntxt->dbname) && (MKDIR(cntxt->dbname) || chdir(cntxt->dbname)))
	) RETURN_ERR_DIRECTORY;
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

#if defined _WIN32  || defined _WIN64
#define CP_CMD "COPY"
#else
#define CP_CMD "cp"
#endif

/*********************************************************************
** Fonction : file_copy_template
** Description : copy a template from db or main dir to current dir
*********************************************************************/
#define ERR_FUNCTION "file_copy_template"
#define ERR_CLEANUP
int file_copy_template(				/* return : 0 on success, other on error */
	EVA_context* cntxt,				/* in : execution context data */
	char *src						/* in : template file name */
) {
	struct stat fs = { 0 };
	char filename[_MAX_PATH];
	char cmd[_MAX_PATH + 100] = { 0 };

	/* Prepare template file path : look first in templates database subdir */
	snprintf(add_sz_str(filename), "%stemplates" DD "%s" DD "%s", cntxt->rootdir, cntxt->dbname, src);
	if (stat(filename, &fs)) snprintf(add_sz_str(filename) , "%stemplates" DD "%s", cntxt->rootdir, src);
	if (stat(filename, &fs)) RETURN_ERROR("Impossible de lancer le traitement", ERR_PUT_TXT("\nFichier mod�le non trouv� : ", src ? src : "(null)", 0));

	/* Copy template procedure */
	snprintf(add_sz_str(cmd), CP_CMD " %s . >exe.txt 2>exeerr.txt", filename);
	if (system(cmd) == -1 || stat(filename, &fs)) RETURN_ERR_DIRECTORY;

	RETURN_OK_CLEANUP;
}
#undef ERR_FUNCTION
#undef ERR_CLEANUP

/*********************************************************************
** Fonction : next_str
** Description : find next occurence of a string
*********************************************************************/
char* next_str(
	char* str,		/* in : string to search for (from previous result end) */
	char* find		/* in : string to find */
){
	static char* res = NULL;
	static char* end = NULL;
	if (!find || !str) return NULL;
	if (res == str) str = end;
	res = strstr(str, find);
	if (res) end = res + strlen(find);
	return res;
}

#define SOFF_END_PARA "</text:p>"
#define SOFF_END_CELL "</table:table-cell>"
#define SOFF_END_ROW "</table:table-row>"
/*********************************************************************
** Fonction : file_write_tblcell
** Description : write a text value in a StarOffice cell
*********************************************************************/
size_t file_write_tblcell(		/* return : 0 on success, other on error */
	FILE* f,						/* in : output file stream */
	char* p0,						/* in : start of template text for cell */
	char* txt,						/* in : value to output in cell */
	char options					/* in : bitmask options for output
											bit 0 : split \n in paragraphs if set
											bit 1 : first cell - output row header if set (p0 is start of row)
											bit 2 : last cell - output row footer if set */
) {
	char* p1 = next_str(p0, SOFF_END_CELL), * p, * ps, * pe, * pr;
	size_t sz = 0;
	DynBuffer* buf = NULL;
	if (!p0 || !p1) return 0;
	p1 += sizeof(SOFF_END_CELL) - 1;

	/* Handle first cell : output row start */
	if (options & 2)
	{
		p = next_str(p0, "<table:table-cell");
		if (!p || p - p0 < 10) return 0;
		sz += fwrite(p0, p - p0, 1, f);
		p0 = p;
	}

	/* Find paragraph in template */
	p = next_str(p0, "<text:p");
	ps = next_str(p, ">");
	pe = next_str(ps, SOFF_END_PARA);
	if (!pe) return 0;
	ps++;

	/* Convert text to XML */
	if (dynbuf_add(&buf, txt, 0, TO_XML)) return 0;
	if (buf) txt = buf->data;

	/* Output template cell header */
	sz += fwrite(p0, p - p0, 1, f);

	/* Split end of lines in paragraphs */
	do {
		sz += fwrite(p, ps - p, 1, f);
		pr = (options & 1) ? strstr(txt, "\n") : NULL;
		if (pr)
		{
			*pr = 0;
			sz += fprintf(f, "\n%s\n", txt);
			txt = pr + 1;
		}
		else sz += fprintf(f, "\n%s\n", txt);
		sz += fprintf(f, "%s\n", SOFF_END_PARA);
	} while (pr);
	M_FREE(buf);

	/* Output template up to cell or row end */
	pe += sizeof(SOFF_END_PARA) - 1;
	p = next_str(pe, (options & 4) ? SOFF_END_ROW : SOFF_END_CELL);
	if (!p) return sz;
	sz += fwrite(pe, p - pe + ((options & 4) ? sizeof(SOFF_END_ROW) : sizeof(SOFF_END_CELL)) - 1, 1, f);

	return sz;
}

/*********************************************************************
** Fonction : file_write_soffice_doc
** Description : write a StarOffice compatible writer (document) file
*********************************************************************/
#define ERR_FUNCTION "file_write_soffice_doc"
#define ERR_CLEANUP M_FREE(dst); \
				M_FREE(tmp)
int file_write_soffice_doc(			/* return : 0 on success, other on error */
	EVA_context* cntxt,				/* in : execution context data */
	DynTable* data,					/* in : table data to export */
	char* srcfile,					/* in : template file name */
	DynBuffer* src,					/* in : template file contents */
	FILE* f							/* in : output stream for file contents */
) {
	DynBuffer* dst = NULL;
	DynBuffer* tmp = NULL;
	char* p_utf, * p_tbl, * p_row1, * p_row2, * p_row3, * p_lbl, * p_val, * p_endt;
	unsigned long i;
	size_t sz = 0;

	if (!data || !src) RETURN_OK;

	/* Mark documents limits for table & rows duplication */
	p_utf = next_str(src->data, "UTF-8");
	p_tbl = next_str(p_utf, "<table:table ");
	p_row1 = next_str(p_tbl, "<table:table-row");
	p_row2 = next_str(p_row1, "<table:table-row");
	p_lbl = next_str(p_row2, "<table:table-cell");
	p_val = next_str(p_lbl, "<table:table-cell");
	p_row3 = next_str(p_val, "<table:table-row");
	p_endt = next_str(p_row3, "</table:table>");
	if (!p_endt) RETURN_ERROR("Invalid format for template file - expecting table 3 rows x 2 columns", ERR_PUT_TXT("File name : ", srcfile, 0));

	/* Output header up to first table - replace UTF-8 with latin1 */
	sz += fwrite(src->data, p_utf - src->data, 1, f);
	sz += fprintf(f, "latin1");
	sz += fwrite(p_utf + 5, p_tbl - p_utf - 5, 1, f);

	/* Loop on data rows */
	for (i = 1; i < data->nbrows; i++)
	{
		char* obj = dyntab_val(data, i, 0);
		char* lbl = dyntab_val(data, i, 1);
		char* val = dyntab_val(data, i, 2);

		/* New object : start new table */
		if (i == 1 || strcmp(obj, dyntab_val(data, i - 1, 0)))
		{
			if (i > 1) sz += fprintf(f, "</table:table><text:p></text:p>");
			sz += fwrite(p_tbl, p_row1 - p_tbl, 1, f);

			/* Title cell */
			DYNBUF_ADD3_CELL(&tmp, "Fiche n� ", data, i, 0, NO_CONV, " : ");
			DYNBUF_ADD_CELL(&tmp, data, i, 1, NO_CONV);
			sz += file_write_tblcell(f, p_row1, tmp->data, 6);
			tmp->cnt = 0;
		}
		/* Cell value with label */
		else if (*lbl)
		{
			/* Output cell label */
			sz += file_write_tblcell(f, p_row2, lbl, 2);

			/* Output cell value with paragraphs & &close row */
			sz += file_write_tblcell(f, p_val, val, 5);
		}
		/* Cell value without label */
		else
		{
			sz += file_write_tblcell(f, p_row3, val, 7);
		}
	}

	/* Output template trailer & close file */
	sz += fprintf(f, "%s", p_endt);

	RETURN_OK_CLEANUP;
}
#undef ERR_FUNCTION
#undef ERR_CLEANUP

/*********************************************************************
** Fonction : file_write_soffice_sht
** Description : write a StarOffice compatible calc (sheet) file
*********************************************************************/
#define ERR_FUNCTION "file_write_soffice_sht"
#define ERR_CLEANUP M_FREE(dst); \
				M_FREE(tmp)
int file_write_soffice_sht(			/* return : 0 on success, other on error */
	EVA_context* cntxt,				/* in : execution context data */
	ObjTableFormat* tbl,			/* in : table data to export */
	char* srcfile,					/* in : template file name */
	DynBuffer* src,					/* in : template file contents */
	FILE* f							/* in : output stream for file contents */
) {
	DynBuffer* dst = NULL;
	DynBuffer* tmp = NULL;
	DynTable* data = tbl ? &tbl->cellval : NULL;
	char* p_utf, * p_tbl, * p_endt;
	unsigned long i, j;
	size_t sz = 0;

	if (!data || !src) RETURN_OK;

	/* Mark documents limits for table & rows duplication */
	p_utf = next_str(src->data, "UTF-8");
	p_tbl = next_str(p_utf, "<table:table-row ");
	p_endt = next_str(p_tbl, "</table:table>");
	if (!p_endt) RETURN_ERROR("Invalid format for template file - expecting table", ERR_PUT_TXT("File name : ", srcfile, 0));

	/* Output header up to first table - replace UTF-8 with latin1 */
	sz += fwrite(src->data, p_utf - src->data, 1, f);
	sz += fprintf(f, "latin1");
	sz += fwrite(p_utf + 5, p_tbl - p_utf - 5, 1, f);

	/* Loop on data rows */
	for (i = 0; i < data->nbrows; i++)
	{
		sz += fprintf(f, "<table:table-row table:style-name=\"ro1\">");
		for (j = 0; j < data->nbcols; j++)
		{
			DynTableCell* c = dyntab_cell(data, i, j);
			char* fmt = dyntab_val(&tbl->format, j, 0);
			char* ctyp = strstr(fmt, "NUMBER") ? "float" : strstr(fmt, "MONEY") ? "currency" :
				(strstr(fmt, "DATE") || strstr(fmt, "Day")) ? "date" : "string";
			if (tmp) { tmp->cnt = 0; tmp->data[0] = 0; }
			if (c && dynbuf_add(&tmp, c->txt, c->len, export_xml, 1)) RETURN_ERR_MEMORY;
			sz += fprintf(f, "<table:table-cell table:style-name=\"ce%u\"", i ? 2 : 1);
			sz += (tmp && tmp->cnt) ?
				fprintf(f, " office-value-type=\"%s\"><text:p>%s</text:p></table:table-cell>", ctyp, tmp ? tmp->data : "") :
				fprintf(f, "/>");
		}
		sz += fprintf(f, "</table:table-row>");
	}

	/* Output template trailer & close file */
	sz += fprintf(f, "%s", p_endt);

	RETURN_OK_CLEANUP;
}
#undef ERR_FUNCTION
#undef ERR_CLEANUP

/*********************************************************************
** Fonction : file_zip
** Description : zip / unzip files
*********************************************************************/
#define ERR_FUNCTION "file_zip"
#define ERR_CLEANUP
int file_zip(						/* return : 0 on success, other on error */
	EVA_context* cntxt,				/* in : execution context data */
	int b_zip,						/* in : 1 top zip, 0 to unzip */
	char* zipfile,					/* in : zip file to process */
	char* fname,					/* in : file to add / extract */
	DynBuffer **src,				/* out : file contents */
	FILE **f						/* out : output stream to replace file contents
										Note : out parameters are only set when b_zip = 0 */
	) {
	char cmd[_MAX_PATH + 64] = { 0 };
	size_t sz = 0;
	char* zipcmd = b_zip ? "zip" : "unzip";

	/* If zip selected : close file & reset src buffer */
	if (b_zip)
	{
		fclose(*f);
		*f = NULL;
		(*src)->cnt = 0;
	}
	/* Else : del destination file before extraction */
	else remove(fname);

#if defined WIN32  || defined _WIN64
	sz = snprintf(add_sz_str(cmd), "%s%s.exe", cntxt->path, zipcmd);
#else
	sz = snprintf(add_sz_str(cmd), "%s", zipcmd);
#endif
	sz += snprintf(cmd + sz, sizeof(cmd) - sz, " %s %s >exe.txt 2>exeerr.txt", zipfile, fname);
	if (system(cmd) == -1) RETURN_ERROR("Error during zip process", { ERR_PUT_TXT("Command :", cmd, sz); ERR_PUT_FILE("Error : ", "exerr.txt") });
	remove("exe.txt");
	remove("exeerr.txt");

	/* If zip selected : del zipped file */
	if (b_zip) remove(fname);
	else
	{
		/* Read unzipped file */
		if (file_to_dynbuf(cntxt, src, fname)) STACK_ERROR;
		(*src)->cnt = strip_rc((*src)->data, (*src)->cnt);

		/* Open content.xml file for output */
		*f = fopen(fname, "wb");
		if (!*f) RETURN_ERR_DIRECTORY;
	}


	RETURN_OK_CLEANUP;
}
#undef ERR_FUNCTION
#undef ERR_CLEANUP

/*********************************************************************
** Fonction : file_write_soffice
** Description : write a StarOffice compatible file
*********************************************************************/
#define ERR_FUNCTION "file_write_soffice"
#define ERR_CLEANUP if(f) fclose(f); \
				M_FREE(src); \
				M_FREE(dst); \
				M_FREE(tmp)
int file_write_soffice(				/* return : 0 on success, other on error */
	EVA_context* cntxt,				/* in : execution context data */
	ObjTableFormat* tbl,			/* in : table data to export */
	unsigned long idx,				/* in : export procedure index in cntxt->cnf_lstproc */
	char *title						/* in : header title */
) {
	DynBuffer* src = NULL;
	DynBuffer* dst = NULL;
	DynBuffer* tmp = NULL;
	FILE* f = NULL;
	DynTable* data = tbl ? &tbl->cellval : NULL;
	DynTable* lst = &cntxt->cnf_lstproc;
	char* proc = dyntab_val(lst, idx, 1);
	char* srcfile = dyntab_val(lst, idx, 3);
	DynTableCell* dstfile = dyntab_cell(lst, idx, 4);

	if (!data) RETURN_OK;

	/* Unzip content.xml file from soffice template document */
	if (file_zip(cntxt, 0, srcfile, "content.xml", &src, &f)) STACK_ERROR;

	/* Call handler for procedure */
	if (!strcmp(proc, "EVA_DOC") && file_write_soffice_doc(cntxt, data, srcfile, src, f) ||
		!strcmp(proc, "EVA_SHT") && file_write_soffice_sht(cntxt, tbl, srcfile, src, f)) STACK_ERROR;

	/* Zip back content.xml to template document */
	if (file_zip(cntxt, 1, srcfile, "content.xml", &src, &f)) STACK_ERROR;

	/* Unzip styles.xml file from soffice template document */
	if (file_zip(cntxt, 0, srcfile, "styles.xml", &src, &f)) STACK_ERROR;

	/* Replace markers in header */
	{
		char datetime[64];
		ReplaceTable sr[] = {
			{ add_sz_str("UTF-8"), add_sz_str("latin1") },
			{ add_sz_str("$DateTime"), NULL, 0 },
			{ add_sz_str("$FileName"), NULL, 0 }, {NULL} };

		datetxt_to_format(cntxt, datetime, cntxt->timestamp, "_EVA_DATETIME");
		sr[1].replace = datetime;
		sr[1].sz_replace = strlen(datetime);
		sr[2].replace = title;
		sr[2].sz_replace = strlen(title);
		if(dynbuf_add(&tmp, src->data, src->sz, sr, 1)) RETURN_ERR_MEMORY;
	}
	fprintf(f,"%s", tmp->data);

	/* Zip back styles.xml to template document */
	if (file_zip(cntxt, 1, srcfile, "styles.xml", &src, &f)) STACK_ERROR;

	/* Rename updated template as result document */
	remove(dstfile->txt);
	if (rename(srcfile, dstfile->txt)) RETURN_ERR_DIRECTORY;

	RETURN_OK_CLEANUP;
}
#undef ERR_FUNCTION
#undef ERR_CLEANUP
#undef SOFF_END_PARA
#undef SOFF_END_CELL
#undef SOFF_END_ROW

/*********************************************************************
** Fonction : file_write_tabrc
** Description : write a table in a tabulated text file
*********************************************************************/
#define ERR_FUNCTION "file_write_tabrc"
#define ERR_CLEANUP if(f) fclose(f); \
					M_FREE(buf)
int file_write_tabrc(				/* return : 0 on success, other on error */
	EVA_context* cntxt,				/* in : execution context data */
	DynTable* data,					/* in : table to write */
	char* file						/* in : output file name */
) {
	DynBuffer* buf = NULL;
	FILE* f = NULL;

	if (!data) RETURN_OK;

	/* Open export file */
	f = fopen(file, "w");
	if (!f) RETURN_ERR_DIRECTORY;

	if (!FILE_write_tabrc(cntxt, data, f)) STACK_ERROR;

	RETURN_OK_CLEANUP;
}
#undef ERR_FUNCTION
#undef ERR_CLEANUP

/*********************************************************************
** Fonction : file_compatible_name
** Description : modify a file name to avoid system compatibility problems
*********************************************************************/
size_t file_compatible_name(		/* return : name final length */
	char *name						/* in/out : file name */
){
	unsigned long i, j;
	char *a = LOCASE_ACCENT UPCASE_ACCENT;
	char *n = LOCASE_NO_ACC UPCASE_NO_ACC;

	/* For each char in string */
	for(i = 0, j = 0; name[j]; j++)
	{
		char u = name[j];
		/* Check if char is alphanumeric */
		if(!(u >= 'a' && u <= 'z' || u >= 'A' && u <= 'Z' || u >= '0' && u <= '9'))
		{
			/* Search for accentuated char & replace whith non accentuated */
			char *c = strchr(a, u);
			if(c) u = n[c - a];
			/* Replace non aplanumeric chars with dot */
			else u = '.';
		}
		/* Ignore multiple dots or dot as first char */
		if(u == '.' && (!i || name[i - 1] == '.')) continue;
		name[i] = u;
		i++;
	}
	name[i] = 0;

	return i;
}

/*********************************************************************
** Fonction : setcase
** Description : case function handling accents
*********************************************************************/
char *setcase(				/* return : string overwriten */
	int mode,				/* in : conversion mode
								bit0 : convert to uppercase if set lowercase else
								bit 1 : no accents in output if set
								bit 2 : no case convert if set - just remove accents (bits 0 & 1 ignored) */
	char *txt,				/* in/out : string to convert */
	size_t len				/* in : max # of char to convert */
){
	unsigned long i;
	char *src = mode & 4 ? LOCASE_ACCENT UPCASE_ACCENT :
				mode & 1 ? LOCASE_ACCENT : UPCASE_ACCENT;
	char *dst = mode & 4 ? LOCASE_NO_ACC UPCASE_NO_ACC :
				mode & 1 ?
				(mode & 2 ? UPCASE_NO_ACC : UPCASE_ACCENT) :
				(mode & 2 ? LOCASE_NO_ACC : LOCASE_ACCENT);

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
		else if(!(mode & 4) && *t >= 'A' && *t <= 'z')
			*t = (char)((mode & 1) ? toupper(*t) : tolower(*t));
	}

	return txt;
}

/*********************************************************************
** Function : get_image_file
** Description : find the file path & size given the filename
*********************************************************************/
char *get_image_file(					/* return : image file path (alloc-ed memory), NULL if not found */
	EVA_context *cntxt,					/* in/out : execution context data */
	char *img,	 						/* in : image file name (find in img using preferences) or path */
	unsigned long *width,				/* out : image width - 0 if not found */
	unsigned long *height				/* out : image height - 0 if not found */
){
	struct stat fs = {0};
	size_t sz = (img && *img) ? strlen(img) : 0, sz1 = 0;
	unsigned long i;
	char *path;
	int b_found = 0;

	/* Initialize size & check params (no quotes in filenames) */
	if(!sz || strpbrk(img, "'\"") || chdir(cntxt->path)) return NULL;

	/* If path is given */
	if(strchr("/.", *img))
	{
		/* Copy path & check existence */
		path = mystrdup(img, strlen(img));
		if(!path) return NULL;
		b_found = !stat(path, &fs);
	}
	else
	{
		/* Path not given : search in prefered img subfolders */
		for(i = 0; i < cntxt->imgpath.nbrows; i++)
		{
			size_t len = dyntab_cell(&cntxt->imgpath, i, 0)->len;
			if(len > sz1) sz1 = len;
		}
		path = mem_alloc(sz1 + sz + 32);
		if(!path) return NULL;

		/* Look for image file in cntxt->imgpath folders */
		for(i = 0; i < cntxt->imgpath.nbrows && !b_found; i++)
		{
			sprintf(path, "../img/%s/%s", dyntab_val(&cntxt->imgpath, i, 0), img);
			b_found = !stat(path, &fs);
		}
		if(!b_found)
		{
			/* Look for image file in root path */
			sprintf(path, "../img/%s", img);
			b_found = !stat(path, &fs);
		}
	}

	/* Get image size */
	if(b_found && width && height) get_image_size(path, width, height);
	return path;
}

/*********************************************************************
** Fonction : fbasename
** Description : return the base name of a path as pointer in path
*********************************************************************/
char *fbasename(char *path, size_t path_len){
#define DIR_DELIM "\\/:"
	char *bname;
	if(!path || !*path) return "";
	if(!path_len) path_len = strlen(path);
	bname = path + path_len - 1;
	while(!strchr(DIR_DELIM, *bname) && bname > path) bname--;
	if(strchr(DIR_DELIM, *bname)) bname++;
	return bname;
}
#undef DIR_DELIM

/*********************************************************************
** Fonction : fdirname
** Description : return the directory of a path in a static memory zone
*********************************************************************/
char *fdirname(char *path, size_t path_len)
{
	static char dname[_MAX_PATH];
	char *bname = fbasename(path, path_len);
	size_t p0 = bname - path;
	if(p0 <= 0 || p0 >= path_len) return ".";
    memcpy(dname, bname, p0);
    dname[p0] = 0;
    return dname;
}

