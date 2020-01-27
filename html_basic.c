/*********************************************************************
**        File : html_basic.c
** Description : these functions output HTML code for basic elements
**      Author : Alain BOUTE
**     Created : Feb 26 2002
**********************************************************************/

#include "eva.h"

/*********************************************************************
** Function : put_html_table_header
** Description : output HTML header for a new table
*********************************************************************/
#define ERR_FUNCTION "put_html_table_header"
#define ERR_CLEANUP M_FREE(img)
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
){
	char *img = NULL;
	CHECK_HTML_STATUS;

	/* Output HTML table header with modifiers */
	DYNBUF_ADD_STR(html, "<table cellspacing=");
	DYNBUF_ADD_INT(html,cellspacing);
	DYNBUF_ADD_STR(html, " cellpadding=");
	DYNBUF_ADD_INT(html,cellpadding);
	DYNBUF_ADD_STR(html, " border=");
	DYNBUF_ADD_INT(html,border);
	if(align && *align) DYNBUF_ADD3(html, " align=", align, 0, NO_CONV, "");
	if(width && *width) DYNBUF_ADD3(html, " width=", width, 0, NO_CONV, "");
	if(bgcolor && strlen(bgcolor) == 6) DYNBUF_ADD3(html, " bgcolor=#", bgcolor, 0, NO_CONV, "");
	if(rules && *rules) DYNBUF_ADD3(html, " rules=", rules, 0, NO_CONV, "");
	img = get_image_file(cntxt, background, 0, 0);
	if(img) DYNBUF_ADD3(html, " background='", img, 0, NO_CONV, "'");
	DYNBUF_ADD_STR(html, "><tr>");

	RETURN_OK_CLEANUP;
}
#undef ERR_FUNCTION
#undef ERR_CLEANUP

/*********************************************************************
** Function : put_html_format_pos
** Description : output HTML table line / column header & text format
*********************************************************************/
#define ERR_FUNCTION "put_html_format_pos"
#define ERR_CLEANUP M_FREE(img)
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
){
	int b_newcell = 0;
	char *img = NULL;
	CHECK_HTML_STATUS;

	/* Check parameters */
	if(!position) position = "";

	/* Handle position in table */
	if(!strcmp("_EVA_NewColumn", position))
	{
		/* NewColumn : new table cell */
		if(b_head) DYNBUF_ADD_STR(html, "<td")
		b_newcell = 1;
	}
	else if(!strcmp("_EVA_SameCell", position))
	{
		/* SameCell : nothing to do */
	}
	else if(!strcmp("_EVA_SameColumn", position))
	{
		/* SameColumn : add line break && return */
		if(b_head) DYNBUF_ADD_STR(html, "<br>");
		RETURN_OK;
	}
	else
	{
		/* Default value : new table row */
		if(b_head) DYNBUF_ADD_STR(html, "</tr><tr><td")
		b_newcell = 1;
	}

	/* Handle text && cell format position  */
	if(b_head) 
	{
		/* Control header : add position & format modifiers */
		if(b_newcell)
		{
			/* Add cell modifiers */
			if(align && *align) DYNBUF_ADD3(html, " align=", align, 0, NO_CONV, "");
			if(valign && *valign) DYNBUF_ADD3(html, " valign=", valign, 0, NO_CONV, "");
			if(width && *width) DYNBUF_ADD3(html, " width=", width, 0, NO_CONV, "");
			if(height && *height) DYNBUF_ADD3(html, " height=", height, 0, NO_CONV, "");
			if(bgcolor && strlen(bgcolor) == 6) DYNBUF_ADD3(html, " bgcolor=#", bgcolor, 0, NO_CONV, "");
			if(nobreak) DYNBUF_ADD_STR(html, " nowrap");
			img = get_image_file(cntxt, background, 0, 0);
			if(img) DYNBUF_ADD3(html, " background='", img, 0, NO_CONV, "'");
			if(colspan > 1) DYNBUF_ADD3_INT(html, " colspan=", colspan, "");
			if(rowspan > 1) DYNBUF_ADD3_INT(html, " rowspan=", rowspan, "");
			DYNBUF_ADD_STR(html, ">");
		}
		else
		{
			/* Add paragraph modifier */
			if(align && *align) DYNBUF_ADD3(html, "<", align, 0, NO_CONV, ">");
		}

		/* Add font modifiers */
		if(fontface && *fontface) DYNBUF_ADD3(html, "<font face='", fontface, 0, NO_CONV, "'>");
		if(fontsize&& *fontsize) DYNBUF_ADD3(html, "<font size=", fontsize, 0, NO_CONV, ">");
		if(fontcolor && strlen(fontcolor) == 6) DYNBUF_ADD3(html, "<font color=#", fontcolor, 0, NO_CONV, ">");
		if(bold) DYNBUF_ADD_STR(html, "<b>");
		if(italic) DYNBUF_ADD_STR(html, "<i>");
		if(underline) DYNBUF_ADD_STR(html, "<u>");
	}
	else	/* Control footer */
	{
		/* Terminate font modifiers */
		if(fontface && *fontface) DYNBUF_ADD_STR(html, "</font>");
		if(fontsize&& *fontsize) DYNBUF_ADD_STR(html, "</font>");
		if(fontcolor && strlen(fontcolor) == 6) DYNBUF_ADD_STR(html, "</font>");
		if(underline) DYNBUF_ADD_STR(html, "</u>");
		if(italic) DYNBUF_ADD_STR(html, "</i>");
		if(bold) DYNBUF_ADD_STR(html, "</b>");

		/* Terminate cell / paragraph */
		if(b_newcell) 
		{
			DYNBUF_ADD_STR(html, "</td>\n");
		}
		else
		{
			if(align && *align) DYNBUF_ADD3(html, "</", align, 0, NO_CONV, ">");
		}
	}
	RETURN_OK_CLEANUP;
}
#undef ERR_FUNCTION
#undef ERR_CLEANUP


/*********************************************************************
** Function : put_html_page_header
** Description : output HTML header code (direct to stdout)
*********************************************************************/
void put_html_page_header(
	EVA_context *cntxt,		/* in/out : execution context data */
	FILE *f,				/* in : output to this stream if not NULL */
	char *title,			/* in : page title */
	char *action,			/* in : params for action tag of <form> */
	int steps				/* in : max # of steps to run :
								1 = HTML header
								2 = <body> header
								3 = <form> header */
){
	if(!cntxt) return;

	/* Output HTML header if applicable */
	if(!cntxt->b_header)
	{
		/* Put HTML header & cookie */
		if(!f)
		{
			char *id = NULL;
			cntxt->txsize += printf("Content-Type:text/html;charset=iso-8859-1\015\012\n");
			if(id && *id) cntxt->txsize += printf("Set-Cookie: CKWS=%s; expires=Thu, 31-Dec-2099 GMT\n", id);
		}

		/* Put page title */
		cntxt->txsize += fprintf(f ? f : stdout, "<html><head><title>EVA - %s</title></head>", title ? title : cntxt->dbname ? cntxt->dbname : "");
		cntxt->b_header = 1;
	}

	/* Output body header if applicable */
	if(steps > 1 && !cntxt->b_bodyheader)
	{
		/* Read applicable page background */
		char *bgcolor = dyntab_field_val(&cntxt->user_data, "_EVA_PAGE_BGCOLOR", 0, 1, 0);
		char *background = dyntab_field_val(&cntxt->user_data, "_EVA_PAGE_BACKGROUND", 0, 1, 0);
		if(!*bgcolor) bgcolor = dyntab_field_val(&cntxt->cnf_data, "_EVA_PAGE_BGCOLOR", 0, 1, 0);
		if(!*background) background = dyntab_field_val(&cntxt->cnf_data, "_EVA_PAGE_BACKGROUND", 0, 1, 0);
		background = get_image_file(cntxt, background, 0, 0);

		/* Put body header */
		cntxt->txsize += fprintf(f ? f : stdout, "%s", "<body leftmargin=0 topmargin=0 rightmargin=0 bottommargin=0");
		if(background) cntxt->txsize += fprintf(f ? f : stdout, " background='%s'", background);
		if(*bgcolor) cntxt->txsize += fprintf(f ? f : stdout, " bgcolor=#%s", bgcolor);
		cntxt->txsize += fprintf(f ? f : stdout, ">");
		if(cntxt->imgwait && !f) cntxt->txsize += fprintf(f ? f : stdout,	"%s", 
			"<table border=0 cellpadding=0 cellspacing=0 align=right><tr><td><img src='../img/_eva_nop.gif'></td></tr></table>"
			"<script>document.images[0].src='../img/_eva_imgwait.gif';</script>");
		cntxt->b_bodyheader = 1;
		M_FREE(background);
	}

	/* Output form header if applicable */
	if(steps > 2 && !cntxt->b_formheader)
	{
		if(cntxt->jsfunc)
			cntxt->txsize += fprintf(f ? f : stdout, "%s",
				"<script>\n"
				/* Click button function */
				"function cb(name)"
				"{"
					"document.mainform['JSINPUT'].value=name;"
					"document.mainform.submit();"
				"}\n"
				/* Output button function */
				"function ob(action,img,img1,label,tooltip,border,mode,num)"
				"{\n"
					"document.write('<a title=\"'+tooltip+'\" href=\"javascript:'+action+';\"');\n"
					"if(img1 && img) document.write(' OnMouseOver=\"document.images.I'+num+'.src=\\''+img1+'\\';\""
												 " OnMouseOut=\"document.images.I'+num+'.src=\\''+img+'\\';\"');\n"
					"document.write('><image name=I'+num+' border='+border+' src=\"'+img+'\" alt=\"'+tooltip+'\"');\n"
					"if(mode & 4) document.write(' align=absmiddle');\n"
					"document.write('>');\n"
					"if(mode & 8) document.write('<img src=\\'../img/_eva_nop.gif\\' width=3 border=0>'+label);\n"
					"document.write('</a>');\n"
				"}\n"
				/* Open link function */
				"function ol(opobj,opform,form,obj)"
				"{"
					"cb('B'+form+'$'+obj+'#.OPENOBJ='+opobj+','+opform);"
				"}\n"
				"</script>");
		cntxt->txsize += fprintf(f ? f : stdout, "<form name='mainform'");
		if(!f) cntxt->txsize += fprintf(f ? f : stdout, " action='/eva/%s.cgi", cntxt->dbname);
		if(action) cntxt->txsize += fprintf(f ? f : stdout, "?%s", action);
		cntxt->txsize += fprintf(f ? f : stdout, "%s", "' method=post");
		if(cntxt->cgiencodemultipart) cntxt->txsize += fprintf(f ? f : stdout, "%s", " enctype='multipart/form-data'");
		cntxt->txsize += fprintf(f ? f : stdout, ">");
		if(!f) cntxt->txsize += fprintf(stdout, 
			"<script>%s"
			"document.write(\"<input type=hidden name=JSINPUT>\");"
			"</script>",
			cntxt->imgwait ? "document.images[0].src='../img/_eva_nop.gif';" : "");
		cntxt->b_formheader = 1;
	}
	fflush(stdout);
}

/*********************************************************************
** Function : put_html_page_trailer
** Description : output signup & HTML footer code (direct to stdout)
*********************************************************************/
void put_html_page_trailer(EVA_context *cntxt, FILE *f)
{
 	clock_t t = clock();
	DynBuffer *focus = cntxt->focus1 ? cntxt->focus1 : cntxt->focus2 ? cntxt->focus2 : cntxt->focus3;

	/* Handle JavaScript end script & SetFocus */
	cntxt->txsize += fprintf(f ? f : stdout, "%s", "<script>");
	if(cntxt->endjs) cntxt->txsize += fprintf(f ? f : stdout, "%s", cntxt->endjs->data);
	if(!f && focus) cntxt->txsize += printf("document.mainform[\"%s\"].focus();", focus->data);
	cntxt->txsize += fprintf(f ? f : stdout, "%s", "</script>");

#define TIME_CELL(txt, bg) "<td align=center nowrap bgcolor=#" bg "><font size=-2>&nbsp;" txt "&nbsp;</font></td>"	
	if(cntxt->b_terminate & 16)
	{
		fprintf(f ? f : stdout, "<br>Durée : %1.2lf s", (double)t/CLOCKS_PER_SEC);
	}
	else
	{
		/* Output page end block with webmaster email & process statistics */
		cntxt->txsize += fprintf(f ? f : stdout, "%s",
				"<font face=Arial>"
				"<table cellspacing=0 cellpadding=0 width='100%' border=2 bgcolor=#E0E0E0 rules=none><tr>\n"
				"<td align=left>"
				"<font size=-1><a href='mailto:alain.boute@abing.fr'>Ecrire au webmaster</a></i></font>"
				"</td><td align=center nowrap><i>"
				"<font size=-2>Serveur EVA v4.0 (" __DATE__") &copy;<a href='http://www.abing.fr' target='ABI'>ABI</a><br>"
				"Commercialisé par <a href='http://www.evasoft.com' target='EVASoft'>EVASoft</a></i></font>"
				"</td>\n<td align=right>"
				"<table border=0 cellspacing=1 cellpadding=0><tr>"
				TIME_CELL("Durée", "BBBBBB")
				TIME_CELL("CPU", "BBBBBB")
				TIME_CELL("SQL", "BBBBBB")
				TIME_CELL("Emission", "BBBBBB")
				TIME_CELL("Réception", "BBBBBB")
				"</tr><tr>");
		{
			char *rxsize, *rxrate, *txsize, *txrate;
#define COPY_HUMANFILESIZE(dest, _sz) { size_t sz = _sz; char *src = sz ? human_filesize(sz) : "";  size_t size = strlen(src); \
											dest = calloc(size + 1, 1); if((src) && size) memcpy(dest, src, size); }
			COPY_HUMANFILESIZE(rxsize, cntxt->rxsize); 
			COPY_HUMANFILESIZE(rxrate, cntxt->rxtime > 200 ? (size_t)(1.0 * cntxt->rxsize / cntxt->rxtime * CLOCKS_PER_SEC) : 0);
			COPY_HUMANFILESIZE(txsize, cntxt->txsize);
			COPY_HUMANFILESIZE(txrate, cntxt->txtime > 200 ? (size_t)(1.0 * cntxt->txsize / cntxt->txtime * CLOCKS_PER_SEC) : 0);
#undef COPY_HUMANFILESIZE

			fprintf(f ? f : stdout, TIME_CELL("%1.2lf s", "FFFFFF"), (double)t/CLOCKS_PER_SEC);
			fprintf(f ? f : stdout, TIME_CELL("%1.2lf s", "EEEEEE"), (double)(t - cntxt->rxtime - cntxt->txtime - cntxt->sqltime)/CLOCKS_PER_SEC);
			fprintf(f ? f : stdout, TIME_CELL("%1.2lf s", "EEEEEE"), (double)cntxt->sqltime/CLOCKS_PER_SEC);
			fprintf(f ? f : stdout, TIME_CELL("%1.2lf s - %s", "DDFFFF"), (double)cntxt->rxtime/CLOCKS_PER_SEC, rxsize);
			fprintf(f ? f : stdout, TIME_CELL("%1.2lf s - %s", "DDDDFF"), (double)cntxt->txtime/CLOCKS_PER_SEC, txsize);
			fprintf(f ? f : stdout, "%s", "</tr></table></td></tr></table>");
			free(rxsize); free(rxrate); free(txsize); free(txrate); 
		}
#undef TIME_CELL
	}

	put_debug_msg(cntxt, f);

	if(!f && cntxt->b_formheader) printf("</form>\n");

	fprintf(f ? f : stdout, "</body></html>\n");
}

/*********************************************************************
** Function : put_html_bold_substring
** Description : output text with the given substring bold
*********************************************************************/
#define ERR_FUNCTION "put_html_bold_substring"
#define ERR_CLEANUP M_FREE(val); DYNTAB_FREE(words)
int put_html_bold_substring(
	EVA_context *cntxt,					/* in/out : execution context data */
	DynBuffer **html,					/* in/out : buffer to add text to */
	char *txtout,	 					/* in : text to output to buffer */
	size_t sz,							/* string length of txtout, or 0 if unknown */
	DynTable *substr					/* in : list of substrings to output as bold text */
){
	char *val = NULL, *txt, *txt0;
	DynTable words = {0};
	unsigned long i, j;
	size_t len = 0;
	if(!html) RETURN_OK;

	/* Uppercase val & substrings */
	if(!txtout || !*txtout) RETURN_OK;
	if(!sz) sz = strlen(txtout);
	M_STRDUP(val, txtout, sz);
	setcase(3, val, sz);
	if(substr) for(txt = 0, i = 0; i < substr->nbrows; i++)
	{
		size_t sz = dyntab_sz(substr, i, 0);
		DYNTAB_ADD_CELL(&words, i, 0, substr, i, 0);
		setcase(3, DYNTAB_VAL_SZ(&words, i, 0));
		if(len < sz) len = sz;
	}

	/* Output string to buffer & return if no substr */
	if(!len)
	{
		DYNBUF_ADD(html, txtout, sz, TO_HTML);
		RETURN_OK;
	}

	txt0 = val;
	while(txt0 && *txt0)
	{
		/* Search 1st occurence of all substrings */
		for(txt = 0, i = 0, j = 0; i < words.nbrows; i++)
		{
			char *txt2 = dyntab_val(&words, i, 0);
			char *txt1 = *txt2 ? strstr(txt0, txt2) : NULL;
			if(!txt || txt1 && txt1 < txt) 
			{
				txt = txt1;
				j = i;
			}
		}

		/* Output text with bold substr */
		len = txt ? txt - txt0 : (sz - (txt0 - val));
		if(len) DYNBUF_ADD(html, txtout + (txt0 - val), len, TO_HTML);
		len = dyntab_sz(substr, j, 0);
		if(txt && len)
			DYNBUF_ADD3(html, "<b><font color=#FF4444>", txtout + (txt - val), len, TO_HTML, "</font></b>");
		txt0 = txt ? txt + len : 0;
	}

 	RETURN_OK_CLEANUP;
}
#undef ERR_FUNCTION
#undef ERR_CLEANUP

/*********************************************************************
** Function : put_html_openform_link
** Description : output text to open a form when clicked on 
*********************************************************************/
#define ERR_FUNCTION "put_html_openform_link"
#define ERR_CLEANUP 
int put_html_openform_link(				/* return : 0 on success, other on error */
	EVA_context *cntxt,					/* in/out : execution context data */
	unsigned long idobj,				/* in : object to open */
	unsigned long idform,				/* in : form to open */
	char *label, size_t sz_label,		/* in : text label */
	char *tooltip, size_t sz_tooltip	/* in : toolip displayed when mouse over label */
){
	char printbuf[1024];
	CHECK_HTML_STATUS;
	dynbuf_print4(html, "<a href='javascript:ol(%lu,%lu,%lu,%lu);'",
					idobj, idform,
					DYNTAB_TOUL(&cntxt->form->id_form),
					DYNTAB_TOUL(&cntxt->form->id_obj));
	DYNBUF_ADD3(html, " title='", tooltip, sz_tooltip, HTML_NO_QUOTE, "'>");
	DYNBUF_ADD3(html, "", label, sz_label, TO_HTML, "</a>");

 	RETURN_OK_CLEANUP;
}
#undef ERR_FUNCTION
#undef ERR_CLEANUP

/*********************************************************************
** Function : put_html_button_link
** Description : output text to act as button when clicked on 
*********************************************************************/
#define ERR_FUNCTION "put_html_button_link"
#define ERR_CLEANUP 
int put_html_button_link(				/* return : 0 on success, other on error */
	EVA_context *cntxt,					/* in/out : execution context data */
	char *name, size_t sz_name,			/* in : button name */
	char *label, size_t sz_label,		/* in : text label */
	char *tooltip, size_t sz_tooltip	/* in : toolip displayed when mouse over label */
){
	CHECK_HTML_STATUS;
	DYNBUF_ADD3(html, "<a href='javascript:cb(\"", name, sz_name, NO_CONV, "\");'");
	DYNBUF_ADD3(html, " title='", tooltip, sz_tooltip, HTML_NO_QUOTE, "'>");
	DYNBUF_ADD3(html, "", label, sz_label, TO_HTML, "</a>");

 	RETURN_OK_CLEANUP;
}
#undef ERR_FUNCTION
#undef ERR_CLEANUP

/*********************************************************************
** Function : put_value_fmt
** Description : output a formated value in text mode
*********************************************************************/
#define ERR_FUNCTION "put_value_fmt"
#define ERR_CLEANUP  
int put_value_fmt(						/* return : 0 on success, other on error */
	EVA_context *cntxt,					/* in/out : execution context data */
	DynBuffer **buf,					/* out : buffer to add text to */
	char *txt, size_t len,				/* in : value to format */
	char *fmt							/* in : format specification */
){
	/* Check params */
	if(!txt || !*txt || !buf) RETURN_OK;
	if(!fmt) fmt = "";

	/* Handle value format */
	if(!strncmp(fmt, add_sz_str("_EVA_DATE")))
	{
		/* Date formats */
		char date[32];
		datetxt_to_format(cntxt, date, txt, fmt);
		DYNBUF_ADD(buf, date, 0, NO_CONV);
	}
	else if(!strcmp(fmt, "_EVA_AGE"))
	{
		/* Age formats */
		char ageunit = 0;
		int age = datetxt_to_age(txt, NULL, &ageunit);
		switch(ageunit)
		{
		case 'Y': DYNBUF_ADD3_INT(buf, "", age, " an"); break;
		case 'M': DYNBUF_ADD3_INT(buf, "", age, " mois"); age = 0; break;
		case 'D': DYNBUF_ADD3_INT(buf, "", age, " jour"); break;
		case 'h': DYNBUF_ADD3_INT(buf, "", age, " heure"); break;
		case 'm': DYNBUF_ADD3_INT(buf, "", age, " min"); break;
		case 's': DYNBUF_ADD3_INT(buf, "", age, " sec"); break;
		default: DYNBUF_ADD_STR(buf, "?"); age = 0;
		}
		if(age > 1) DYNBUF_ADD_STR(buf, "s");
	}
	else if(!strcmp(fmt, "_EVA_FILESIZE"))
	{
		/* Human file size */
		DYNBUF_ADD(buf, number_to_format(txt, "_EVA_FILESIZE"), 0, NO_CONV);
	}
	else if(!strcmp(fmt, "_EVA_MONEY"))
	{
		/* Money */
		DYNBUF_ADD(buf, number_to_format(txt, "_EVA_Money"), 0, NO_CONV);
	}
	else
	{
		DYNBUF_ADD(buf, txt, len, NO_CONV);
	}

	RETURN_OK_CLEANUP;
}
#undef ERR_FUNCTION
#undef ERR_CLEANUP
