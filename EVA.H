/*********************************************************************
**        File : eva.h
** Description : header for EVA cgi interface
**      Author : Alain BOUTE
**     Created : Aug 16 2001
*********************************************************************/

/* Standard C includes */
#define STRICT
#include <io.h>
#include <fcntl.h>
#include <stdio.h>
#include <stdlib.h>
#include <stdarg.h>
#include <string.h>
#include <malloc.h>
#include <ctype.h>
#include <direct.h>
#include <math.h>
#include <process.h>
#include <time.h>
#include <sys/stat.h>
#include <sys/types.h>
#include <sys/timeb.h>


#ifdef WIN32
#define snprintf _snprintf
#endif

/* EVA libraries definitions */
#include "dyntab.h"


/*********************************************************************
** Typedef : FormsCache
** Description : data used for building objects labels & form titles
*********************************************************************/
typedef struct _FormsCache {
	/* Form data */
	unsigned long idform;		/* form objects id */
	DynBuffer *label;			/* form label */
	DynBuffer *notes;			/* form notes */
	DynTable data;				/* form data */

	/* Object labels build info */
	DynTable labels;			/* value label */
	DynTable fields; 			/* contents (field expression) */
	DynTable format; 			/* value format */
	DynTable cnotes;			/* column notes */
	DynTable intitle; 			/* use value for title */
	DynTable inlabel; 			/* use value for label */
	DynTable pfx;				/* prefix value with label */
	DynTable separ;				/* values separator */

	/* Object icon */
	DynTable img;				/* normal image */
	DynTable imgsel; 			/* selected image */
	DynTable cond;				/* image selection condition */
	DynTable condlbl;			/* condition label */
}
	FormsCache;

/*********************************************************************
** Typedef : MatchMode
** Description : compare operators for IdValue, IdObj, IdRelObj members
*********************************************************************/
typedef enum _MatchMode
{
	NoMatch=0,			/* No matching condition */
	ObjList,			/* IdObj IN (value1, value2, ...) */
	NotObjList,			/* IdObj NOT IN (value1, value2, ...) */
	RelList,			/* IdRelObj IN (value1, value2, ...) */
	NotRelList,			/* IdRelObj NOT IN (value1, value2, ...) */
	Different,			/* IdValue NOT IN (value1, value2, ...) */
	Exact,				/* IdValue IN (value1, value2, ...) */
	IdValList,			/* IdValue IN (value1, value2, ...) - no value check */
	NotIdValList,		/* IdValue NOT IN (value1, value2, ...) - no value check */
	Like,				/* (TxtVal LIKE 'value1') OR (TxtVal LIKE 'value2') ... */
	NotLike,			/* (TxtVal NOT LIKE 'value1') AND (TxtVal NOT LIKE 'value2') ... */
	Contain,			/* (TxtVal LIKE '%value1%') OR (TxtVal LIKE '%value2%') ... */
	NotContain,			/* (TxtVal NOT LIKE '%value1%') AND (TxtVal NOT LIKE '%value2%') ... */
	Begin,				/* (TxtVal LIKE 'value1%') OR (TxtVal LIKE 'value2%') ... */
	NotBegin,			/* (TxtVal NOT LIKE 'value1%') AND (TxtVal NOT LIKE 'value2%') ... */
	Larger,				/* TxTVal > value */
	LargerEqual,		/* TxTVal >= value */
	Smaller,			/* TxTVal < value */
	SmallerEqual,		/* TxTVal <= value */
	InBound,			/* TxTVal >= value1 AND TxtVal <= value2 */
	NotInBound,			/* TxTVal < value1 AND TxtVal > value2 */
	NumInBound,			/* TxTVal >= value1 AND TxtVal <= value2 - numerical comparison */
	NumNotInBound		/* TxTVal < value1 AND TxtVal > value2 - numerical comparison */
}
	MatchMode;

/*********************************************************************
** Typedef : RelationMode
** Description : relation mode for query functions
*********************************************************************/
typedef enum _RelationMode 
{
	RelNone=0,			/* TLink.IdObj = TLink1.IdObj */
	RelDirect,			/* TLink.IdRelObj = TLink1.IdObj */
	RelReverse,			/* TLink.IdObj = TLink1.IdRelObj */
	RelAny,				/* TLink.IdRelObj = TLink1.IdObj OR TLink.IdObj = TLink1.IdRelObj */
	RelBoth				/* TLink.IdRelObj = TLink1.IdObj AND TLink.IdObj = TLink1.IdRelObj */
}
	RelationMode;

/*********************************************************************
** Typedef : FieldModifier
** Description : modifier type for field expressions
*********************************************************************/
typedef enum _FieldModifier 
{
	F_None=0,
		F_Obj,
		F_Field,
		F_Value,
		F_RelObj,
		F_Num,
		F_Line,
		F_DateCr,
		F_WhoCr,
		F_DateDel,
		F_WhoDel
}
	FieldModifier;

/*********************************************************************
** Typedef : QryBuilNode
** Description : used to build SQL queries for filters
*********************************************************************/
typedef struct _QryBuilNode
{				   		
	DynTable field;				/* fields name */	
	FieldModifier modif;		/* field modifier */	
	MatchMode match;			/* comparison operator */	
	DynTable value;				/* values to compare */	
	RelationMode rel;			/* relation operator */	
	unsigned long srcjoin;		/* source join node index */
	unsigned long curjoin;		/* join # used for this node */
	char datemin[16];			/* minimum date of validity for records */
	char datemax[16];			/* maximum date of validity for records */
	DynTable idobjmatch;		/* add where clause IdObj IN(idobjmatch) if given */	
	DynBuffer *whocr;			/* IdWhoCr condition */	
	DynBuffer *whodel;			/* IdWhoDel condition */	
	DynBuffer *cond;			/* extra node condition */	
	int b_joinval;				/* use join on TVal if not 0 */
	int b_joinfld;			/* use join on TField if not 0 */
}
	QryBuilNode;

/*********************************************************************
** Typedef : QryBuild
** Description : used to build SQL queries for filters
*********************************************************************/
typedef struct _QryBuild {
	DynTable name;				/* filter names / fields expressions - for debug info */
	char *srctable;				/* table of preselected objects (use column IdObj) */
	int b_linkonrelobj;			/* if set JOIN is made with srctable.IdRelObj instead of srctable.IdObj */
	DynBuffer *select;			/* mandatory value member for SELECT clause */
	DynBuffer *optselect;		/* optional members for SELECT clause */
	DynBuffer *join;			/* JOIN clause */
	DynBuffer *where;			/* WHERE clause */
	DynBuffer *groupfn;			/* GROUP function */
	DynBuffer *having;			/* HAVING clause */
	DynBuffer *orderby;			/* optional members for ORDER BY clause */
	int b_nodistinct;			/* don't use SELECT DISTINCT if not 0 */
	int b_straightjoin;			/* use SELECT STRAIGHT_JOIN if not 0 */
	unsigned long srcjoin;		/* source join index during parsing */
	unsigned long nbjoin;		/* # of used joins */
	QryBuilNode	node[32];		/* filter nodes (MySql handles 32 joins max) */
	unsigned long nbnode;		/* # of used nodes */
	QryBuilNode *valnode;		/* selected value node */
	int b_oper;					/* 1 if filter has operators */
	int b_userelobj;			/* 1 if base object must be linked with Tlink0.IdRelObj rather than TLink0.IdObj */
	char *selidobj;				/* use this expression instead of TLink0.IdObj in select clause */
	int debug;					/* output SQL query in cntxt->debug_msg if not 0 */
	int b_recdata;				/* read detailed data (IdRelObj, Field, Num, Line, ...) for records if not 0 */
	int b_single_last_field;	/* squeeze fields other than fist on last field node if set (for sort purposes) */
}
	QryBuild;

/*********************************************************************
** Typedef : ObjData
** Description : stores one row of TLink table
*********************************************************************/
typedef struct _ObjData {
	unsigned long Pkey;			/* record identifier (primary key in TLink) */
	unsigned long IdObj;		/* object identifier in TLink */
	unsigned long IdField;		/* field identifier in TVal */
	char *field;				/* field name from TVal */
	unsigned long IdRelObj;		/* related object identifier in TLink */
	unsigned long IdValue;		/* value identifier in TVal */
	char *value;				/* value text */
	unsigned long Num;			/* value index to handle multiple values */
	unsigned long Line;			/* value index to handle table rows & list options level */
	unsigned long Lvl;			/* value index to handle list options level */
	unsigned long Lang;			/* language code to handle multiple language values */
	unsigned long IdCtrl;		/* object identifier of creator control in TLink */
	unsigned long IdForm;		/* object identifier of creator form in TLink */
	char DateCr[16];			/* value creation date */
	unsigned long IdWhoCr;		/* object identifier of creator user in TLink */
	char DateDel[16];			/* value deletion date */
	unsigned long IdWhoDel;		/* object identifier of destructor user in TLink */
}
	ObjData;

/*********************************************************************
** Typedef : CGIData
** Description : parsed data of a CGI input
*********************************************************************/
typedef struct _CGIData {
	/* Original data */
	char *name;					/* input name */
	size_t name_sz;				/* input name length */
	char *value;				/* input value */
	size_t value_sz;			/* input value length */

	/* Parsed name data */
	unsigned long IdCtrl;		/* object identifier of control in TLink */
	unsigned long IdForm;		/* object identifier of form in TLink */
	unsigned long IdObj;		/* object identifier of edited object in TLink */
	char *field;				/* field name */
	char *subfield;				/* subcontrol field name (for control extra inputs) */
	unsigned long Num;			/* value index to handle multiple values */
	unsigned long Line;			/* value index to handle table rows */
	unsigned long Lvl;			/* value index to handle list options level */
	unsigned long i_old;		/* index in cntxt->cgi of input holding previous value */

	/* Processing data */
	int b_dontkeep;				/* do not reoutput as hidden input */
}
	CGIData;

/*********************************************************************
** Macros : Access...
** Description : access rights definition
*********************************************************************/
#define AccessNone		0x0
#define AccessRead		0x10
#define AccessWrite		0x20
#define AccessCreate	0x4
#define AccessDelete	0x8
#define AccessView		0x1
#define AccessEdit		0x2

/*********************************************************************
** Typedef : TableFormat
** Description : output parameters for a table of objects
*********************************************************************/
typedef struct _ObjTableFormat {
	/* Data source */
	DynTable *attr;				/* source for all table attributes read in the structure */
	int b_ctrl;					/* use controls attributes if not 0 */
	int from_idlist;			/* objects list is based on table IdList if not 0 */

	/* Status data */
	int status;					/* functions status */
	unsigned long line;			/* first displayed line */
	unsigned long lines;		/* page size */
	unsigned long totlines0;	/* total # of lines after base filter */
	unsigned long totlines;		/* total # of lines after search */
	unsigned long ctrlline;		/* active line when table embedded in table */
	unsigned long sortcol;		/* sort column index */
	int b_sortdesc;				/* sort order */
	int b_sortsel;				/* relation order input by user if 0 */
	MatchMode srchmode;			/* search mode */
	size_t minsearchlen;		/* search is not performed (empty list) if string too short */
	DynTable cgiinput;			/* search inputs */
	char *input;				/* current search input */
	DynTable srchwords;			/* list of search words from input */
	unsigned long srchcol;		/* search columns bitmask */
	char *srchfmt;				/* format of search column */
	int b_first;				/* set to 1 on table 1st display */
	int inputwidth;				/* # of chars of HTML input for search / add */
	DynTable bgcol;				/* background color sequence for lines */
	DynTable bgimg;				/* background image sequence for lines */
	int bgseqstart;				/* background sequence start index */

	/* Table contents */
	DynTable idobj;				/* list of objects to display in table */
	char objtbl[16];			/* temporary table name */
	DynTable data;				/* objects data */
	DynTable cellval;			/* table values */
	DynTable altfilter;			/* extra filters for table */
	DynTable typfilter;			/* selection type for extra filters */
	DynTable condfilter;		/* selection condition for extra filters */
	DynTable selfilter;			/* extra filters for user selection (col0=id, col1=label) */

	/* Columns format */
	DynTable label;				/* columns labels */
	DynTable field; 			/* columns contents (field expression) */
	DynTable format; 			/* value format */
	DynTable notes;				/* column notes */
	DynTable fontsize;			/* column font size */
	DynTable align;				/* column horizonttal alignment */
	DynTable bold;				/* column is bold */
	DynTable underline;			/* column is underlined */
	DynTable strip;				/* value strip length */
	DynTable place;				/* column placement */
	DynTable distinctval;		/* output distinct values */
	DynTable debug;				/* debug status */
}
	ObjTableFormat;

/*********************************************************************
** Typedef : EVA_ctrl
** Description : form controls description structure
*********************************************************************/
typedef struct _EVA_ctrl
{
	DynTable id;				/* control object Id */
	unsigned long i_parent;		/* parent control index */
	unsigned long i_child;		/* first child control index */
	unsigned long i_brother;	/* next brother control index */
	unsigned long i_handler;	/* handler index in ctrl_handlers */
	int storage;				/* DB storage mode : 0=>none, 1=>IdValue, 3=>IdRelObj */
	DynBuffer *cginame;			/* CGI input base name */
	DynTable attr;				/* control attributes */
	DynTable val;				/* control current values */
	DynTable dbval;				/* control values read from database */
	DynTable cgival;			/* control values from CGI data */
	DynTable allval;			/* holds all control values when val is filtered */
	DynTable alldbval;			/* holds all control values from database when val is filtered */
	DynTable childdata;			/* control children object data */
	int access;					/* current access mode : bit combination of AccessNone, AccesssRead, ... */
	int access0;				/* access mode after CtrlRead step */
	int b_selected;				/* for options : 1 if selected */
	int b_modified;				/* for input : 1 if user has changed the control values */
	int outmode;				/* for input : 0 if not output, HtmlEdit/HtmlView else */
	int b_use_val;				/* for list input : use values instead of labels if not 0 */
	int error;					/* for input : bit1=warning, bit2=error */
	DynBuffer *errmsg;			/* error message */
	int status;					/* to handle multiple status controls such as lists, date, ... */
	unsigned long lines;		/* table container - # of lines in table */
	unsigned long i_empty;		/* list input - index of empty option in form->ctrl */
	ObjTableFormat *objtbl;		/* objects table : to display or input control values in a table */
	char dateref[16];			/* reference date for date inputs */
	char ageref[16];			/* reference date for age inputs */
	int b_cgicleared;			/* set if CGI input where cleared during read step (restored if save dialog on that control) */
	
	/* Control common attributes values */
	char *CONTROL;
	char *TYPE;
	char *FIELD;
	char *LABEL;
	char *NOTES;
	char *LABELPOS;
	char *POSITION;
	char *ALIGN;
	char *VALIGN;
	char *WIDTH;
	char *HEIGHT;
	char *BGCOLOR;
	char *BACKGROUND;
	char *COLSPAN;
	char *ROWSPAN;
	char *OPTIONBUTTON;
	char *ALLOWEMPTY;
	char *MULTIPLE;
	char *FONTFACE;
	char *FONTSIZE;
	char *FONTCOLOR;
	char *BOLD;
	char *ITALIC;
	char *UNDERLINE;
	unsigned long LINES;
	unsigned long COLUMNS;
	char *LABELALIGN;
	char *LABELVALIGN;
	char *LABELWIDTH;
	char *LABELHEIGHT;
	char *LABELBGCOLOR;
	char *LABELBACKGROUND;
	char *LABELFONTFACE;
	char *LABELFONTSIZE;
	char *LABELFONTCOLOR;
	char *LABELBOLD;
	char *LABELITALIC;
	char *LABELUNDERLINE;
	unsigned long LABELCOLSPAN;
	unsigned long LABELROWSPAN;
	char *TABLEWIDTH;
	char *TABLERULES;
	char *TABLEBGCOLOR;
	char *TABLEBACKGROUND;
	unsigned long BORDER;
}
	EVA_ctrl;

/*********************************************************************
** Typedef : EVA_execmode
** Description : current program execution mode
*********************************************************************/
typedef enum
{
	CtrlRead,		/* Read control values from CGI or DB */
	FormSave,		/* Save control values to DB */ 
	InputCheck,		/* Control values check : set ctrl->error and ctrl->errmsg on warning or error */
	HtmlSaveDlg,	/* Save dialog input mode */
	HtmlEdit,		/* Standard form input mode */ 
	HtmlStepEdit,	/* Single step input mode (not implemented yet) */
	HtmlView,		/* View mode */ 
	HtmlPrint,		/* Print mode */ 
	FormList, 
	FormSearch, 
	FormStats, 
	FormValues		/* Values detail & history mode */
}
	EVA_execmode;

/*********************************************************************
** Typedef : EVA_form
** Description : HTML form description structure
*********************************************************************/
typedef struct _EVA_form
{
	EVA_ctrl *ctrl;				/* current form controls */
	unsigned long nb_ctrl;		/* # of used elements in ctrl */
	unsigned long sz_ctrl;		/* # of elements in ctrl */
	DynTable id_form;			/* form object Id */
	DynTable id_obj;			/* current object Id */
	DynTable objdata;			/* current object data read from database */
	int b_newobj;				/* form holds a new object if not 0 */
	unsigned long id_formsave;	/* form to use for formstamp */

	/* Status data */
	DynBuffer *title;			/* form title */
	DynTable call_data;			/* caller data */
	unsigned long nb_tabs;		/* # of tab controls in form */
	DynTable seltab;			/* current tab object Id */
	unsigned long i_seltab;		/* selected tab index in ctrl */
	unsigned long i_ctrl_clic;	/* control index of the clicked button */
	int b_modified;				/* for input : 1 if user has changed the control values */
	int error;					/* for input : bit1=warning, bit2=error */
	int has_data;				/* for input : not 0 if form holds data */
	int b_reload;				/* 1 if form should be reloaded before displayed */
	
	/* Control processsing data */
	EVA_execmode prevstep;		/* previous output format */
	EVA_execmode nextstep;		/* scheduled output format */
	EVA_execmode step;			/* current execution mode */
	DynTable dlg_ctrl;			/* dialog mode if not NULL - control that started the dialog */
 	int b_noctrltree;			/* do not process CTRLTREE control attribute if 1 */
 	int savedlg_outmode;		/* output mode (changes, warnings) for HtmlDialog step */

	/* HTML output buffers */
	DynBuffer *html_err;		/* HTML error message for form - duplicates & validation conditions */
	DynBuffer *html_title;		/* HTML code for title bar */
	DynBuffer *html_top;		/* HTML code for top controls */
	DynBuffer *html_tabs;		/* HTML code for tab buttons */
	DynBuffer *html_tab;		/* HTML code for tab controls */
	DynBuffer *html_bot;		/* HTML code for bottom controls */
	DynBuffer **html;			/* current buffer to output to */

	/* Multiple values processing data */
	unsigned long Num;			/* value index to handle multiple values */
	unsigned long Line;			/* value index to handle table rows */
	unsigned long Lvl;			/* value index to handle list options level */
}
	EVA_form;

/*********************************************************************
** Typedef : EVA_error
** Description : error description structure
*********************************************************************/
typedef struct _EVA_error
{
	char *text;					/* error message */
	DynBuffer *detail;			/* message details (locals) */
	DynTable stack;				/* call stack information */
	int errline;				/* error source file line # (for RETURN_OK_CLEANUP) */
	char file[2048];			/* Error description file */
}
	EVA_error;

/*********************************************************************
** Typedef : EVA_cgi_file
** Description : file data transmitted through CGI
*********************************************************************/
typedef struct _EVA_cgi_file
{
	char *data;					/* file data */
	size_t len;					/* file data length */
	DynTable descr;				/* CGI description */
	int i_cgi;					/* index of input in cntxt->cgi */
}
	EVA_cgi_file;

/*********************************************************************
** Typedef : PivotTableField
** Description : pivot table field parameters & results
*********************************************************************/
typedef struct _PivotTableField
{
	char *label;							/* field label */
	DynTable expr;							/* field definition (SQL/relational expression) */
	DynTable labels;						/* field unique values */
	DynTable totals;						/* totals for values */
	DynTable forms;							/* allowed formstamps in results */
	DynTable filters;						/* selection filter (conditional expression id) */
	DynTable selctrl;						/* base control (control id) */
	DynTable function;						/* displayed values */
	DynTable totlabel;						/* total label */
	DynTable percent;						/* percentage display mode */
	char *pos;								/* field position : Row|Col|Data */

	DynTable srcdata;						/* source data for field definition */
	char datatable[32];						/* name of table holding field values */
	char objtable[32];						/* name of table holding base objects field values */
	char *srctable;							/* name of table holding source objects id to select field values */
	int b_done;								/* set when values table has been computed */
	unsigned long nbobj;					/* # of distinct objects in datatable */
	unsigned long nbval;					/* # of values in datatable */
	unsigned long nbdistval;				/* # of distinct values in datatable */
	unsigned long nbsrcobj;					/* # of distinct objects in srctable */

	unsigned long maxlabels;					/* maximum # of labels */
	char *dispfmt;							/* field display format */
	char *dispunit;							/* field display unit */
	char *timeway;							/* date mode for calendar first display */
	char dateref[16];						/* reference date for age calculation */
	int b_calendar;							/* use calendar if not 0 */
	char *trunc;							/* field truncation */
	int decimals;							/* # of decimals for field values */
	DynTable slices;						/* field slices width / limits */
	DynTable sr_src;						/* search strings for values substitution */
	DynTable sr_dest;						/* replace strings for values substitution */
	DynTable optsrc;						/* list inputs to use options for search / replace */
	size_t ltrunc;							/* left truncation : # of chars */
	size_t rtrunc;							/* right truncation : # of chars */
	int b_lines;							/* field holds tables Line values if not 0 */
	int b_overrun;							/* for date formats : use only specified part */
	char *sortmode;							/* sort mode for labels */
	int b_sortdesc;							/* reverse sort if not 0 */
	DynTable emptyval;						/* value to use for empty label */
	int b_showemptyval;						/* show empty values if not 0 */
	int b_shownomatch;						/* show values not matching other (row / col) table if not 0 */
	unsigned long stackcols_limit;					/* max # of chars before column labels are output stacked */
	int b_stackcols;						/* output stacked columns labels */
	char *clicmode;							/* action to take upon values click */
	unsigned long objlist;					/* object id of list control used upon values click */
	RelationMode relmode;					/* relation mode with base table */
	DynTable *relfields;					/* relation fields with base table */

	char startdate[16];						/* start date for calendar */
	char *vmin;								/* values minimum */
	size_t sz_vmin;							/* size of values minimum */
	char *vmax;								/* values maximum */
	size_t sz_vmax;							/* size of values maximum */
	DynBuffer *where;						/* WHERE clause for cross values table */
} 
	PivotTableField;

/*********************************************************************
** Typedef : PivotTable
** Description : pivot table parameters & results
*********************************************************************/
#define MAX_PVT_DATAFIELDS	5
#define MAX_PVT_ROWFIELDS	20
#define MAX_PVT_COLFIELDS	5
typedef struct _PivotTable
{
	char *label;							/* pivot table label */
	DynTable forms;							/* allowed formstamps */
	DynTable filters;						/* selection filter (pointer to conditional expression) */
	DynTable *srcdata;						/* source data for selection filter */
	char *condexpr;							/* selection condition (SQL/relational expression) */
	char *function;							/* group function for cells */
	char *rowdata_relmode;					/* relation mode between row & data */
	DynTable rowdata_relfield;				/* relation field between row & data */
	char *coldata_relmode;					/* relation mode between col & data */
	DynTable coldata_relfield;				/* relation field between col & data */
	char *rowcol_relmode;					/* relation mode between row & col */
	DynTable rowcol_relfield;				/* relation field between row & col */
	char *clicmode;							/* action to take upon values click */
 	unsigned long objlist;					/* object id of list control used upon values click */
 	unsigned long tblnotes;					/* contents of pivot table notes - switches listed below */
#define TblNote_note				0x1
#define TblNote_rownote				0x2
#define TblNote_colnote				0x4
#define TblNote_datanote			0x8
#define TblNote_allnote				0xF
#define TblNote_detail				0x10
#define TblNote_rowdetail			0x20
#define TblNote_coldetail			0x40
#define TblNote_datadetail			0x80
#define TblNote_alldetail			0xF0
#define TblNote_dynamic				0x100

	char objtable[32];						/* table holding base object Ids */
	char *basetable;						/* base table for pivot table calculation */
	unsigned long nbobj;					/* # of distinct objects in table */
	PivotTableField *row;					/* field used as rows */
	PivotTableField *col;					/* field used as columns */
	PivotTableField *data;					/* field used as cell data */
	DynTable *res;							/* current pivot table results */

	/* Fields & results tables */
	DynTable restbl[MAX_PVT_DATAFIELDS][MAX_PVT_ROWFIELDS][MAX_PVT_COLFIELDS];				/* pivot table results */
	PivotTableField rows[MAX_PVT_ROWFIELDS];	/* row fields */
	unsigned long nbrow;					/* # of row fields */
	PivotTableField cols[MAX_PVT_COLFIELDS];	/* column fields */
	unsigned long nbcol;					/* # of column fields */
	PivotTableField datas[MAX_PVT_DATAFIELDS];	/* cell data fields */
	unsigned long nbdata;					/* # of cell data fields */
	unsigned long totcols;					/* total # of columns in global pivot table */
	unsigned long maxcols;					/* max # of columns in pivot column fields */
	unsigned long maxrows;					/* max # of rows in pivot column fields */
	int b_stackcols;						/* output stacked columns labels */
	int b_export;							/* output is for export file */
	DynBuffer *exportparams;				/* parameters file contents for export */

	char datamember[64];					/* selected data member for cells */
	DynBuffer *select;						/* SELECT clause for cross values table */
	DynBuffer *join;						/* JOIN clause for cross values table */
	DynBuffer *where;						/* WHERE clause for cross values table */
	DynBuffer *group;						/* GROUP clause for cross values table */
	char *rowcolclic;						/* row & column index of clicked cell */
	int b_empty;							/* no data selected if not 0 */
} 
	PivotTable;

/*********************************************************************
** Typedef : EVA_context
** Description : program execution context information
*********************************************************************/
typedef struct _EVA_context
{
	/* Form processsing data */
	DynTable id_form;			/* object id of the current form */
	DynTable id_obj;			/* id of the current object in form */
	DynTable alt_form;			/* id of the alternate form (displayed under main form) */
	DynTable alt_obj;			/* id of the current object in alternate form */
 	EVA_form *form;				/* current form data */
	unsigned long i_ctrl;		/* current processed control */
 	DynBuffer *focus1;			/* CGI name of 1st control to set focus on */
 	DynBuffer *focus2;			/* CGI name of 2nd control to set focus on */
 	DynBuffer *focus3;			/* CGI name of 3rd control to set focus on */

/* Static data to hold form info cache - TODO : handle dynamic size */
#define FORM_CACHE_SIZE 100
	FormsCache fc[FORM_CACHE_SIZE];
	unsigned int nbfc;			/* # of forms in fc */

	/* Session handling data */
	DynTable session;			/* id of the current session */
	DynTable id_cnf;			/* id of the server configuration object */
	DynTable cnf_data;			/* service configuration data */
	DynTable cnf_server;		/* server configuration data */
	DynTable id_user;			/* id of the logged in user */
	DynTable user_data;			/* object data of the logged in user */
	DynTable menubar;			/* selected menu bar form */
	DynTable homepage;			/* selected home page */
	char *imgpath;				/* path to search first for images */
	size_t imgpath_sz;			/* imgpath string length */
	int b_user_ok;				/* 1 if user is identified */
	enum { OptBtn_None, OptBtn_Help, OptBtn_OpenSame, OptBtn_OpenBottom }
		opt_btn_mode;			/* defines how option button is handled */

	/* CGI data */
	DynBuffer *input;			/* CGI input data */
	CGIData *cgi;				/* parsed CGI input data */
	unsigned long nb_cgi;		/* # of elements in cgi */
	unsigned long cgibtn;		/* line # in cgi of the first pressed button in form (0 for none)*/
	EVA_cgi_file *cgi_file;		/* uploaded file data transmitted through CGI */
	unsigned long cgi_file_nb;	/* # of files in cgi_file */
	int cgiencodemultipart;		/* 1 if multipart encoding is needed for next page (input of type file) */
	int imgwait;				/* 1 if JavaScript wait image must be used */
	int jsenabled;				/* 1 if JavaScript is enabled */
	int jsfunc;					/* 1 if JavaScript funtions must be output */

	/* System call data */
	int argc;					/* args count */
	char **argv;				/* args values */
	char **envp;				/* environment values */
	char timestamp[16];			/* timestamp for db changes */
	char *path;					/* executable path (from argv[0]) */
	char *user_ip;				/* user remote IP adress */
	char *user_agent;			/* user navigator identification */

	/* HTML buffers */
	int b_header;				/* HTML header has been output if not 0 */
	int b_bodyheader;			/* <body> header has been output if not 0 */
	int b_formheader;			/* <form> header has been output if not 0 */
	int b_menubar;				/* menubar has been output if not 0 */
	int b_terminate;			/* no more forms to output (for dialogs) */
	DynBuffer *title;			/* page title */
	DynBuffer *html;			/* main HTML output data */
	DynBuffer *html1;			/* secondary HTML output data (end of page) */
	DynBuffer *html0;			/* menubar HTML output data (start of page) */
	DynBuffer *htmlhidden;		/* hidden inputs HTML code */
	DynBuffer *endjs;			/* JavaScript code output at end of page */

	/* SQL session handling */
	char *dbname;				/* SQL database to select */
	char *srvaddr;				/* SQL server address to select */
	void *sql_session;			/* SQL engine dependent data */
	DynBuffer *sql_qry;			/* last SQL query */
	void *sql_result;			/* last SQL query : results buffer */
	double sql_restime;			/* last SQL query : exec time in ms */
	unsigned long sql_nbrows;	/* last SQL query : number of affected rows */
	int sql_trace;				/* SQL trace mode */
	unsigned long sql_cnt;		/* SQL queries count */
	unsigned long nbfulljoin;	/* SQL full join search queries count (bad use of indexes) */
																   
	/* Debug & error status */
	int debug;					/* debug mode for trace output */
	DynBuffer *debug_msg;		/* debug messages */
	DynBuffer *debug_html;		/* debug messages - HTML format */
	EVA_error err;				/* error description */

	/* Logs handling values */
	char logfile[64];			/* log file name */
	clock_t t0;					/* process start clock time */
	clock_t sqltime;			/* MySql process time */
	clock_t rxtime;				/* CGI receive clock time */
	clock_t txtime;				/* HTML transmit clock time */
	size_t rxsize;				/* CGI input data size */
	size_t txsize;				/* HTML output data size */
	time_t tm0;					/* process start time */
	int urlencoded;				/* input CGI data */
	unsigned long log_clkbtn;	/* Clicked button */
	unsigned long log_clkform;	/* Clicked button form */
	DynBuffer *log_srchtxt;		/* Searched text in tables */

	/* Constants cache */
	unsigned long val_FORMSTAMP;
	DynTable objdata_FORMLIST_FILTER;
	DynTable daylong;			/* long day labels (for date output) */
	DynTable dayshort;			/* short day labels (for date output) */
	DynTable monthlong;			/* long month labels (for date output) */
	DynTable monthshort;		/* short month labels (for date output) */
	EVA_ctrl srvfmt;			/* server display formats default */
}
	EVA_context;
extern EVA_context *Cntxt;


/*********************************************************************
** Typedef : EVA_sql_row
** Description : result row for a SQL query
*********************************************************************/
typedef struct _EVA_sql_row
{
	unsigned long nbcols;		/* # of cols in row */
	char **name;				/* columns names */
	char **value;				/* columns values */
	size_t *sz;					/* columns values length */
} 
	EVA_sql_row;


/*********************************************************************
** Macro : TO_HEX
** Description : progress scale for HTML real time display
*/
#define WAIT_TXTSCALE	"0%   10%   20%   30%   40%   50%   60%   70%   80%   90%   100%\n" \
						"|-----|-----|-----|-----|-----|-----|-----|-----|-----|-----|\n"

/*********************************************************************
** Macro : TO_HEX
** Description : convertit un caractere hexa (0-9,A-F) en entier
*/
#define TO_HEX(_c) ( \
		( (_c) >= '0' && (_c) <= '9' ) ? (_c)-'0' : \
		( (_c) >= 'a' && (_c) <= 'f' ) ? (_c)-'a'+10 : \
		( (_c) >= 'A' && (_c) <= 'F' ) ? (_c)-'A'+10 : \
		0)

/*********************************************************************
** Macro : STRIP_SPACES_AROUND
** Description : strip spaces around a value
*********************************************************************/
#define STRIP_SPACES_AROUND(txt, len)	if(txt) { \
				while((len) && strchr(" \n\t\r", *(txt))) { (txt)++; (len)--; } \
				while((len) && strchr(" \n\t\r", (txt)[(len) - 1])) (len)--; }

/*********************************************************************
** Constants : DIRECTORY_...
** Description : server directories names constants
*/
#define DIRECTORY_DOCS "docs"
#define DIRECTORY_IMG "img"
#define DIRECTORY_CGI "cgi"

/*********************************************************************
** Constants : DEBUG_...
** Description : debug bitmask for group of functions
*/
#define DEBUG_SQL			0x1
#define DEBUG_SQL_RES		0x2
#define DEBUG_SQL_SLOW		0x40
#define DEBUG_CGI			0x4
#define DEBUG_CGI_RAW		0x8
#define DEBUG_ARGS			0x10
#define DEBUG_ENV			0x20
#define DEBUG_HTML			0x80
#define DEBUG_HTML_RAW		0x100
#define DEBUG_FILTER		0x200

/*********************************************************************
** Macro : IDVAL(string)
** Description : return IdValue for a given string
*/
#define IDVAL(str) get_id_value(cntxt, add_sz_str(str))

/*********************************************************************
** Constants : OBJ_...
** Description : IdObj for frequently used objects (for optimization purpose)
*/
#define OBJ_FORM_CONTROL		10
#define OBJ_FORM_FILERES		"25717"
#define OBJ_FORM_SESSION		2446

/*********************************************************************
** Macro : CHECK_HTML_STATUS
** Description : set html output buffer & return if null
*********************************************************************/
#define CHECK_HTML_STATUS 	DynBuffer **html = cntxt->form->html; if(!html) return 0


/* Definition modules includes */
#include "err_utils.h"
#include "mem_macros.h"
#include "dyntab_field.h"
#include "dyntab_sort.h"
#include "date_utils.h"
#include "cgi_utils.h"
#include "sql_dbif.h"
#include "sql_values.h"
#include "qry_utils.h"
#include "qry_build.h"
#include "qry_obj_label.h"
#include "html_basic.h"
#include "ctrl_hdlr.h"
#include "ctrl_option.h"
#include "ctrl_butn.h"
#include "ctrl_input_rel.h"
#include "ctrl_input_list.h"
#include "ctrl_input_basic.h"
#include "ctrl_input_fileupload.h"
#include "ctrl_input_httplink.h"
#include "ctrl_input_color.h"
#include "ctrl_input.h"
#include "ctrl_graph.h"
#include "ctrl_contain.h"
#include "ctrl_title.h"
#include "ctrl_output_list.h"
#include "ctrl_misc.h"
#include "ctrl_image.h"
#include "ctrl_tree.h"
#include "ctrl_exprval.h"
#include "ctrl_cgi.h"
#include "ctrl_utils.h"
#include "action_misc.h"
#include "action_utils.h"
#include "dlg_openedforms.h"
#include "table_utils.h"
#include "file_utils.h"
#include "form_utils.h"
#include "form_io.h"
#include "form_save.h"
#include "form_html.h"
#include "form_mode.h"
#include "obj_utils.h"
#include "pivottable.h"

#undef ERR_FUNCTION
