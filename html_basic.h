/*********************************************************************
**        File : html_basic.h
** Description : these functions output HTML code for basic elements
**      Author : Alain BOUTE
**     Created : Feb 26 2002
**********************************************************************/

/*********************************************************************
** Function : put_html_table_header
** Description : output HTML header for a new table
*********************************************************************/
int put_html_table_header(
	EVA_context *cntxt,				/* in/out : execution context data */
	char *align,					/* in : horizontal position (center / left / right) */
	char *width,					/* in : widht in pixels or % of window width */
	char *bgcolor,					/* in : background color (RGB / 6 chars hexa) */
	char *background,				/* in : background image filename (no path) */
	int cellspacing,				/* in : cell spacing in pixels */
	int cellpadding,				/* in : cell padding in pixels */
	int border,						/* in : border width in pixels */
	char *rules						/* in : cells border drawing rule */
);

/*********************************************************************
** Function : put_html_format_pos
** Description : output HTML table line / column header & text format
*********************************************************************/
int put_html_format_pos(
	EVA_context *cntxt,				/* in/out : execution context data */
	char *position,					/* in : position in table (NewLine, NewColumn, SameCell, ...) */
	char *align,					/* in : horizontal position (center / left / right) */
	char *valign,					/* in : verical position (middle / top / left) */
	char *width,					/* in : widht in pixels or % of window width */
	char *height,					/* in : height in pixels or % window height */
	char *bgcolor,					/* in : background color (RGB / 6 chars hexa) */
	char *background,				/* in : background image filename (no path) */
	int colspan, int rowspan,		/* in : # of row & columns the cell (if any) will occupy */
	char *fontface,					/* in : font face (a font name) */
	char *fontsize,					/* in : font size may be absolute (size) or relative (+size / -size) */
	char *fontcolor,				/* in : font color (RGB / 6 chars hexa) */
	int bold,						/* in : use bold text if 1 */
	int italic,						/* in : use italic text if 1 */
	int underline,					/* in : use underlined text if 1 */
	int nobreak,					/* in : do not break lines if 1 */
	int b_head						/* in : output header if 1, footer else */
);

/*********************************************************************
** Function : put_html_page_header
** Description : output HTML header code (direct to stdout)
*********************************************************************/
void put_html_page_header(EVA_context *cntxt, FILE *f, char *title, char *action, int steps);

/*********************************************************************
** Function : put_html_page_trailer
** Description : output signup & HTML footer code (direct to stdout)
*********************************************************************/
void put_html_page_trailer(EVA_context *cntxt, FILE *f);

/*********************************************************************
** Function : put_html_bold_substring
** Description : output text with the given substring bold
*********************************************************************/
int put_html_bold_substring(
	EVA_context *cntxt,					/* in/out : execution context data */
	DynBuffer **html,					/* in/out : buffer to add text to */
	char *txtout,	 					/* in : text to output to buffer */
	size_t sz,							/* string length of txtout, or 0 if unknown */
	DynTable *substr					/* in : list of substrings to output as bold text */
);

/*********************************************************************
** Function : put_html_openform_link
** Description : output text to open a form when clicked on 
*********************************************************************/
int put_html_openform_link(				/* return : 0 on success, other on error */
	EVA_context *cntxt,					/* in/out : execution context data */
	unsigned long idobj,				/* in : object to open */
	unsigned long idform,				/* in : form to open */
	char *label, size_t sz_label,		/* in : text label */
	char *tooltip, size_t sz_tooltip	/* in : toolip displayed when mouse over label */
);

/*********************************************************************
** Function : put_html_button_link
** Description : output text to act as button when clicked on 
*********************************************************************/
int put_html_button_link(				/* return : 0 on success, other on error */
	EVA_context *cntxt,					/* in/out : execution context data */
	char *name, size_t sz_name,			/* in : button name */
	char *label, size_t sz_label,		/* in : text label */
	char *tooltip, size_t sz_tooltip	/* in : toolip displayed when mouse over label */
);

