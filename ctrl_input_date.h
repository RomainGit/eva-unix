/*********************************************************************
**        File : ctrl_input_date.h
** Description : header for control date interface
**      Author : Claude Broudin
**     Created : June 22 2003
*********************************************************************/

int ctrl_add_date(EVA_context *cntxt, unsigned long i_ctrl);

int datetxt_to_age(char *date, char *now, char *age, int format);
int age_to_datetxt(		/* return : 0 on success, other on error */
	int age,			/* in : age to translate */
	char *now,			/* in : date from which compute date */
	char *date,			/* out: converted date - 32 bytes long minimum */
	int format			/* in : conversion format */
);