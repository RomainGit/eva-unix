/*********************************************************************
**        File : qry_obj_label.h
** Description : retrieve an object labeling informations
**      Author : Alain BOUTE
**     Created : March 14 2003
**********************************************************************/


/*********************************************************************
** Function : qry_obj_label
** Description : output an open button for an object
*********************************************************************/
int qry_obj_label(						/* return : 0 on success, other on error */
	EVA_context *cntxt,					/* in/out : execution context data */
	DynBuffer **label,					/* out : form label */
	DynBuffer **fnotes,					/* out : form notes */
	DynBuffer **objname,				/* out : object label */
	DynBuffer **objtitle,				/* out : object title */
	DynBuffer **notes,					/* out : object notes */
	DynBuffer **img,					/* out : symbol normal image */
	DynBuffer **imgsel,					/* out : symbol selected image */
	unsigned long *i_formcache,			/* out : index of form in cntxt->fc */
	unsigned long id_form,				/* in : form id */
	DynTable *data,						/* in : object data */
	unsigned long beg					/* in : first line to process in data */
);
