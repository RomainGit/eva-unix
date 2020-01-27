/*********************************************************************
**        File : ctrl_cgi.c
** Description : CGI handling utilities for controls
**      Author : Alain BOUTE
**     Created : Dec 28 2002
*********************************************************************/

#include "eva.h"

/*********************************************************************
** Function : ctrl_cgi_name
** Description : build CGI name for a control value
*********************************************************************/
#define ERR_FUNCTION "ctrl_cgi_name"
#define ERR_CLEANUP 
int ctrl_cgi_name(					/* return : 0 on success, other on error */
	EVA_context *cntxt,				/* in/out : execution context data */
	EVA_ctrl *ctrl,					/* in : control to make name for */
	DynTableCell *val,				/* in : value to make name for */
	int b_renumber,					/* in : build value number if 1 and val is NULL */
	DynBuffer **name,				/* in : CGI base name
									  out : final CGI name with value indexes */
	char type,						/* in : input type is first name char :
									 NULL = ignore (basename type is used)
										F = Form context data
										B = Button click
										D = user input data
										I = Control info button click
										U = unspecified */
	char *subfield,					/* in : subfield name */
	size_t subfield_sz				/* in : subfield name string size */
){
	EVA_form *form = cntxt->form;
	unsigned long i, num = 0;

	/* Reset given buffer if not NULL & add control CGI base name */
	if(*name) (*name)->cnt = 0;
	DYNBUF_ADD_BUF(name, ctrl->cginame, NO_CONV);

	/* Handle value number if applicable */
	if(form->Num && !val)
		num = form->Num;
	else if(b_renumber && !(val && val->Num))
	{
		num = 1;
		for(i = 0; i < ctrl->val.nbrows; i++)
		{
			DynTableCell *val = dyntab_cell(&ctrl->val, i, 0);
			if(val->Num >= num) num = val->Num + 1;
		}
	}

	/* Build final name */
	if(cgi_build_finalname(cntxt, name, type, subfield, subfield_sz, 
		(val && val->Num) ? val->Num : num, 
		(val && val->Line) ? val->Line : form->Line, 
		(val && val->Lvl) ? val->Lvl : form->Lvl)) 
			STACK_ERROR;

	RETURN_OK_CLEANUP;
}
#undef ERR_FUNCTION
#undef ERR_CLEANUP

/*********************************************************************
** Function : ctrl_put_hidden
** Description : output a control value as CGI hidden input
*********************************************************************/
#define ERR_FUNCTION "ctrl_put_hidden"
#define ERR_CLEANUP	M_FREE(name)
int ctrl_put_hidden(				/* return : 0 if Ok, other on error */		
	EVA_context *cntxt,				/* in/out : execution context data */
	EVA_ctrl *ctrl,					/* in : related control */
	unsigned long i					/* in : value index in ctrl->val */
)
{
	DynBuffer *name = NULL;
	CHECK_HTML_STATUS;

	CTRL_CGINAMEVAL(&name, i);
	DYNBUF_ADD3_BUF(html, "<input type=hidden name='", name, NO_CONV, "'");
	DYNBUF_ADD3_CELL(html, " value='", &ctrl->val, i, 0, HTML_NO_QUOTE, "'>");
	if(cntxt->debug & DEBUG_HTML) DYNBUF_ADD_STR(cntxt->form->html, "\n");
	if(cntxt->form->b_newobj && ctrl_put_hidden_old(cntxt, ctrl, i, name, NULL, 0)) STACK_ERROR;

	RETURN_OK_CLEANUP;
}
#undef ERR_FUNCTION
#undef ERR_CLEANUP

/*********************************************************************
** Function : cgi_get_subfield
** Description : return	cgi inputs matching the given name
*********************************************************************/
#define ERR_FUNCTION "cgi_get_subfield"
#define ERR_CLEANUP
int cgi_get_subfield(				/* return : 0 if Ok, other on error */		
	EVA_context *cntxt,				/* in/out : execution context data */
	DynTable *cgival,				/* out : CGI values table */
	EVA_ctrl *ctrl,					/* in : related control */
	char *subfield,					/* in : subfield name */
	int b_keep,						/* in : mark for no reoutput if 0 */
	unsigned long num,				/* in : value index */
	unsigned long line				/* in : value index */
)
{
	dyntab_free(cgival); 
	if(cgi_filter_values(cntxt, cgival, 'D', DYNTAB_TOUL(&ctrl->id), 
										DYNTAB_TOUL(&cntxt->form->id_form),
										DYNTAB_TOUL(&cntxt->form->id_obj),
										ctrl->FIELD, 
										subfield, num, line))
		STACK_ERROR; 
	if(!b_keep) CGI_VALUES_DONTKEEP(cgival); 

	RETURN_OK_CLEANUP;
}
#undef ERR_FUNCTION
#undef ERR_CLEANUP

/*********************************************************************
** Function : cgi_put_subfield
** Description : output hidden CGI input for control options
*********************************************************************/
#define ERR_FUNCTION "cgi_put_subfield"
#define ERR_CLEANUP	M_FREE(name)
int cgi_put_subfield(				/* return : 0 if Ok, other on error */		
	EVA_context *cntxt,				/* in/out : execution context data */
	EVA_ctrl *ctrl,					/* in : related control */
	char *subfield,					/* in : subfield name */
	char *val, size_t val_sz		/* in : value to use */
)
{
	DynBuffer *name = NULL;	
	if(cgi_build_name(cntxt, &name, 'D',
		DYNTAB_TOUL(&ctrl->id), 
		DYNTAB_TOUL(&cntxt->form->id_form), 
		DYNTAB_TOUL(&cntxt->form->id_obj), 
		ctrl->FIELD, strlen(ctrl->FIELD), subfield, strlen(subfield), 0, 0, 0))
		STACK_ERROR; 
	DYNBUF_ADD3_BUF(cntxt->form->html, "<input type=hidden name='", name, NO_CONV, "'"); 
	DYNBUF_ADD3(cntxt->form->html, " value='", val, val_sz, HTML_NO_QUOTE, "'>");	
	if(cntxt->debug & DEBUG_HTML) DYNBUF_ADD_STR(cntxt->form->html, "\n");

	RETURN_OK_CLEANUP;
}
#undef ERR_FUNCTION
#undef ERR_CLEANUP
