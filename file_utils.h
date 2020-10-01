/*********************************************************************
** ---------------------- Copyright notice ---------------------------
** This source code is part of the EVASoft project
** It is property of Alain Boute Ingenierie - www.abing.fr and is
** distributed under the GNU Public Licence version 2
** Commercial use is submited to licencing - contact eva@abing.fr
** -------------------------------------------------------------------
**        File : file_utils.h
** Description : TAB/RC files handling utilities
**      Author : Alain BOUTE
**     Created : April 28 2002
*********************************************************************/

/*********************************************************************
** Fonction : file_date
** Description : return modification date for a file - 0 on error
*********************************************************************/
time_t file_date(                /* return : modification date */
	char *fpath					/* in : file path to read */
);

/*********************************************************************
** Fonction : file_to_dynbuf
** Description : read a file in a dynbuffer
*********************************************************************/
int file_to_dynbuf(				/* return : 0 on success, other on error */
	EVA_context *cntxt,				/* in : execution context data */
	DynBuffer **res,				/* out : result buffer */
	char *file						/* in : input file name */
);

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
** Fonction : file_read_config
** Description : read a tabulated text file
*********************************************************************/
int file_read_config(				/* return : 0 on success, other on error */
	EVA_context *cntxt				/* in/out : execution context data */
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
** Fonction : file_copy_template
** Description : copy a template from db or main dir to current dir
*********************************************************************/
int file_copy_template(				/* return : 0 on success, other on error */
	EVA_context* cntxt,				/* in : execution context data */
	char* src						/* in : template file name */
);

/*********************************************************************
** Fonction : file_write_soffice
** Description : write a StarOffice compatible file
*********************************************************************/
int file_write_soffice(				/* return : 0 on success, other on error */
	EVA_context * cntxt,			/* in : execution context data */
	ObjTableFormat* tbl,			/* in : table data to export */
	unsigned long idx,				/* in : export procedure index in cntxt->cnf_lstproc */
	char* fname						/* in : final destination file name for header title */
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
size_t file_compatible_name(		/* return : name final length */
	char *name						/* in/out : file name */
);

/*********************************************************************
** Fonction : setcase
** Description : case function handling accents
*********************************************************************/
char *setcase(				/* return : string overwriten */
	int b_upper,			/* in : convert to uppercase if set lowercase else */
	char *txt,				/* in/out : string to convert */
	size_t len				/* in : max # of char to convert */
);

/*********************************************************************
** Fonction : file_output_link
** Description : output HTML link to the given file
*********************************************************************/
int file_output_link(				/* return : 0 on success, other on error */
	EVA_context *cntxt,				/* in : execution context data */
	DynBuffer **html,				/* in/out : output buffer */
	char *title, size_t sz_title,	/* in : file title (not in link - html format) */
	char *name, size_t sz_name,		/* in : file user name */
	char *fname, size_t sz_fname,	/* in : file server name */
	char *fdir,						/* in : file directory (from root) or special name
										#user = user directory
										#docs = site docs directory */
	char *notes, size_t sz_notes,	/* in : file comments (for tooltip) */
	char *msg, size_t sz_msg,		/* in : message between file & buttons */
	int options						/* in : bit mask for display options
										bit 0 : output help header if set
										bit 1 : prepare zip for big files if set
										bit 2 : output return button if set
										*/
);

/*********************************************************************
** Fonction : cgi_output_string
** Description : output string with CGI escape chars
*********************************************************************/
int cgi_output_string(				/* return : 0 on success, other on error */
	EVA_context *cntxt,				/* in : execution context data */
	DynBuffer **html,				/* in/out : output buffer */
	char *txt, size_t sz			/* in : string to output */
);

/*********************************************************************
** Function : get_image_file
** Description : find the file path & size given the filename
*********************************************************************/
char *get_image_file(					/* return : image file path (alloc-ed memory), nul string if not found */
	EVA_context *cntxt,					/* in/out : execution context data */
	char *img,	 						/* in : image file name */
	unsigned long *width,				/* out : image width - 0 if not found */
	unsigned long *height				/* out : image height - 0 if not found */
);

/*********************************************************************
** Fonction : get_image_size
** Description : scan image size from a file
*********************************************************************/
int get_image_size(			/* return : 0 if file found & params correct, 1 else */
	char *imgpath,			/* in : image file path */
	unsigned long *width,	/* out : image width - 0 if not found */
	unsigned long *height	/* out : image height - 0 if not found */
);

/*********************************************************************
** Fonction : get_image_thumb
** Description : return thumbnail file for the given image - build if necessary
*********************************************************************/
char *get_image_thumb(		/* return : image file path (alloc-ed memory), NULL if not found */
	char *imgpath,			/* in : image file path */
	size_t imgpath_sz,		/* in : image file path size */
	unsigned long dw,		/* in : desired image width - 0 if no constraint */
	unsigned long dh,		/* in : desired image height - 0 if no constraint */
	unsigned long *ow,		/* out : thumbnail width - 0 if not available */
	unsigned long *oh		/* out : thumbnail height - 0 if not available */
);

/*********************************************************************
** Fonction : fbasename
** Description : return the base name of a path as pointer in path
*********************************************************************/
char *fbasename(char *path, size_t path_len);

/*********************************************************************
** Fonction : fdirname
** Description : return the directory of a path as static memory
*********************************************************************/
char *fdirname(char *path, size_t path_len);
