/*********************************************************************
**        File : dynbuf_sr.c
** Description : constants definitions for search & replace functions
**      Author : Alain BOUTE
**     Created : Mar 9 2002
*********************************************************************/

#include "eva.h"

/*********************************************************************
** Macro : XML_SR_TABLE
** Description : minimal conversion table between plain text & XML
*********************************************************************/
#define XML_SR_TABLE		{ add_sz_str("<"), add_sz_str("&lt;") }, \
							{ add_sz_str(">"), add_sz_str("&gt;") }, \
							{ add_sz_str("&"), add_sz_str("&amp;") }

/*********************************************************************
** Macro : NOTABCR_SR_TABLE
** Description : replace TAB & RC with spaces
*********************************************************************/
#define NOTABCR_SR_TABLE	{ add_sz_str("\n"), add_sz_str(" ") },  \
							{ add_sz_str("\t"), add_sz_str(" ") }

/*********************************************************************
** Macro : HTML_CR_SR_TABLE
** Description : replace TAB & RC with HTML equivalents
*********************************************************************/
#define HTML_CR_SR_TABLE	{ add_sz_str("\n"), add_sz_str("<br>\n") },  \
							{ add_sz_str("\t"), add_sz_str("&nbsp;&nbsp;&nbsp;&nbsp;") }

/*********************************************************************
** Macro : HTMLQUOTE_SR_TABLE
** Description : replace double quote with HTML equivalent
*********************************************************************/
#define QUOTE_SR_TABLE		{ add_sz_str("'"), add_sz_str("&#39;") }

/*********************************************************************
** Constant : plain_to_html
** Description : minimal conversion table between plain text & HTML
*********************************************************************/
ReplaceTable plain_to_html[] = { XML_SR_TABLE, HTML_CR_SR_TABLE, {NULL} };

/*********************************************************************
** Constant : plain_to_xml
** Description : minimal conversion table between plain text & XML
*********************************************************************/
ReplaceTable plain_to_xml[] = { XML_SR_TABLE, {NULL} };

/*********************************************************************
** Constant : html_no_quote
** Description : conversion table for XML with double quotes
*********************************************************************/
ReplaceTable html_no_quote[] = { XML_SR_TABLE, QUOTE_SR_TABLE, {NULL} };

/*********************************************************************
** Constant : html_no_quote_tootip
** Description : conversion table for XML with double quotes
*********************************************************************/
ReplaceTable no_quote[] = {  QUOTE_SR_TABLE, {NULL} };

/*********************************************************************
** Constant : javascript_string
** Description : conversion table for javascipt strings
*********************************************************************/
ReplaceTable javascript_string[] = { 
							{ add_sz_str("\r"), add_sz_str("\\r") },  
							{ add_sz_str("\n"), add_sz_str("\\n") },  
							{ add_sz_str("\t"), add_sz_str("\\t") },
							{ add_sz_str("\""), add_sz_str("\\\'\\\'") },
							{ add_sz_str("'"), add_sz_str("\\'") },
							{NULL} };

/*********************************************************************
** Macro : SQL_NO_QUOTE_SR_TABLE
** Description : replace quote and \ with SQL equivalents
*********************************************************************/
#define SQL_NO_QUOTE_SR_TABLE	{ add_sz_str("'"), add_sz_str("\\'") }, \
								{ add_sz_str("\\"), add_sz_str("\\\\") }

/*********************************************************************
** Macro : SQL_NO_QUOTE_SR_TABLE
** Description : replace quote and \ with SQL equivalents
*********************************************************************/
#define SQL_NO_LIKE_OPS_SR_TABLE	{ add_sz_str("_"), add_sz_str("\\_") }, \
									{ add_sz_str("%"), add_sz_str("\\%") }

/*********************************************************************
** Constant : sql_no_quote
** Description : conversion table for SQL quote & backslash
*********************************************************************/
ReplaceTable sql_no_quote[] = { SQL_NO_QUOTE_SR_TABLE, {NULL} };

/*********************************************************************
** Constant : sql_no_like_ops
** Description : conversion table for SQL quote & backslash
*********************************************************************/
ReplaceTable sql_no_like_ops[] = { SQL_NO_QUOTE_SR_TABLE, SQL_NO_LIKE_OPS_SR_TABLE, {NULL} };

/*********************************************************************
** Constant : export_tabrc
** Description : conversion table for TAB/RC files
*********************************************************************/
ReplaceTable export_tabrc[] = { { add_sz_str("\n"), add_sz_str("<RC>") },  
								{ add_sz_str("\r"), add_sz_str("<RC>") },  
								{ add_sz_str("\t"), add_sz_str("<TAB>") },
								{ NULL } };

/*********************************************************************
** Constant : crlf_to_lf
** Description : conversion table for CR <-> CR/LF
*********************************************************************/
ReplaceTable crlf_to_lf[] = { { add_sz_str("\r\n"), add_sz_str("\n") },
								{ NULL } };
