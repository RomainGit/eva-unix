/*********************************************************************
**        File : ctrl_output_list.h
** Description : handling functions for output controls of type LIST (tables of objects)
**      Author : Alain BOUTE
**     Created : April 26 2002
*********************************************************************/

/*********************************************************************
** Function : ctrl_add_output_list_simple
** Description : handles OUTPUT controls of type LIST_SIMPLE
*********************************************************************/
int ctrl_add_output_list_simple(	/* return : 0 on success, other on error */
	EVA_context *cntxt,				/* in/out : execution context data */
	unsigned long i_ctrl						/* in : control index in cntxt->form->ctrl */
);

/*********************************************************************
** Function : ctrl_add_output_stats
** Description : handles OUTPUT controls of type LIST_SIMPLE
*********************************************************************/
int ctrl_add_output_stats(			/* return : 0 on success, other on error */
	EVA_context *cntxt,				/* in/out : execution context data */
	unsigned long i_ctrl			/* in : control index in cntxt->form->ctrl */
);

/*********************************************************************
** Function : ctrl_add_output_list_ctrl
** Description : handles OUTPUT controls of type LIST_SIMPLE
*********************************************************************/
int ctrl_add_output_list_ctrl(		/* return : 0 on success, other on error */
	EVA_context *cntxt,				/* in/out : execution context data */
	unsigned long i_ctrl			/* in : control index in cntxt->form->ctrl */
);


/*********************************************************************
** Function : ctrl_add_output_calendar
** Description : handles OUTPUT controls of type CALENDAR
*********************************************************************/
int ctrl_add_output_calendar(		/* return : 0 on success, other on error */
	EVA_context *cntxt,				/* in/out : execution context data */
	unsigned long i_ctrl						/* in : control index in cntxt->form->ctrl */
);

/*********************************************************************
** Function : ctrl_add_calendar_input
** Description : handles OUTPUT controls of type CALENDAR
*********************************************************************/
int ctrl_add_calendar_input(		/* return : 0 on success, other on error */
	EVA_context *cntxt,				/* in/out : execution context data */
	unsigned long i_ctrl,			/* in : control index in cntxt->form->ctrl */
	char *datebeg,					/* in : start date */
	char *unit,						/* in : period unit */
	unsigned long periods			/* in : # of periods */
);

/*********************************************************************
** Function : ctrl_get_calendar_input
** Description : read input controls of a calendar input group
*********************************************************************/
int ctrl_get_calendar_input(		/* return : 0 on success, other on error */
	EVA_context *cntxt,				/* in/out : execution context data */
	unsigned long i_ctrl,			/* in : control index in cntxt->form->ctrl */
	char *datebeg,					/* out : start date */
	char **unit,					/* out : period unit */
	unsigned long *periods			/* out : # of periods */
);