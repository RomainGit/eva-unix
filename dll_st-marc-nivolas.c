/*********************************************************************
**        File : dll_st-marc-nivolas.c
** Description : fonctions specifiques pour le lycee St Marc a Nivolas : gestion des stages
**      Author : Alain BOUTE
**     Created : Sept 20 2003
*********************************************************************/

#include "eva.h"

/*********************************************************************
** Function : PrepareStageClasse
** Description : Cree une fiche de stage pour chaque élève de la classe du stage (fiche courante) 
*********************************************************************/
#define ERR_FUNCTION "PrepareStageClasse"
#define ERR_CLEANUP	DYNTAB_FREE(eleves); \
					DYNTAB_FREE(data)
int PrepareStageClasse(				/* return : 0 on success, other on error */
	EVA_context *cntxt,				/* in/out : execution context data */
	unsigned long i_ctrl			/* in : control index in cntxt->form->ctrl */
){
	EVA_form *form = cntxt->form;
	unsigned long i;
	unsigned long idstage = DYNTAB_TOUL(&form->id_obj);
	DynTable eleves = {0};
	DynTable data = {0};
	unsigned long val_FORMSTAMP = get_id_value(cntxt, add_sz_str("_EVA_FORMSTAMP"));
	unsigned long val_ELEVE_STAGE = get_id_value(cntxt, add_sz_str("ELEVE_STAGE"));
	unsigned long val_STAGE = get_id_value(cntxt, add_sz_str("STAGE"));
	unsigned long form_StageEleve = 31577;
	char qry[1024] = {0};

	/* Inhibit warning for unused param */
	i_ctrl = 0;

	/* Lecture des eleves de la classe */
	if(!idstage) RETURN_OK;
	if(form_eval_fieldexpr(cntxt, &eleves, 0, idstage, add_sz_str("CLASSE_STAGE->ELEVES_CLASSE"), &form->objdata, 0)) STACK_ERROR;
	
	/* Creation des fiches de stage pour chaque eleve */
	for(i = 0; i < eleves.nbrows; i++)
	{
		DynTableCell val = {0};
		unsigned long ideleve = DYNTAB_TOULRC(&eleves, i, 0);

		/* Recherche si la fiche de stage existe deja pour l'eleve */
		snprintf(qry, sizeof(qry), 
				"SELECT TLink0.IdObj FROM TLink AS TLink0 \n"
				"INNER JOIN TLink AS TLink1 ON TLink0.IdObj=TLink1.IdObj \n"
				"INNER JOIN TLink AS TLink2 ON TLink0.IdObj=TLink2.IdObj \n"
				"WHERE TLink0.DateDel IS NULL AND TLink0.IdRelObj=%lu AND TLink0.IdField=%lu \n"
				"AND TLink1.DateDel IS NULL AND TLink1.IdField=%lu AND TLink1.IdRelObj=%lu \n"
				"AND TLink2.DateDel IS NULL AND TLink2.IdField=%lu AND TLink2.IdRelObj=%lu \n"
				"GROUP BY IdObj",
			form_StageEleve, val_FORMSTAMP, val_ELEVE_STAGE, ideleve, val_STAGE, idstage);
		if(sql_exec_query(cntxt, qry) || sql_get_table(cntxt, &data, 2)) STACK_ERROR;

		/* Rien a faire si la fiche existe */
		if(data.nbrows) continue;

		/* Creation de la fiche de stage pour l'eleve */
		if(qry_add_new_idobj(cntxt, &val.IdObj, form_StageEleve)) STACK_ERROR;
		val.b_relation = 1;
		val.IdValue = ideleve;
		val.IdField = val_ELEVE_STAGE;	
		if(qry_add_val(cntxt, &val, 0, NULL)) STACK_ERROR;
		val.IdValue = idstage;
		val.IdField = val_STAGE;	
		if(qry_add_val(cntxt, &val, 0, NULL)) STACK_ERROR;
	}

	RETURN_OK_CLEANUP;
}
#undef ERR_FUNCTION
#undef ERR_CLEANUP

/*********************************************************************
** Function : ReleveMensuel
** Description : Cree un relevé mensuel pour chaque dossier en cours
*********************************************************************/
#define ERR_FUNCTION "ReleveMensuel"
#define ERR_CLEANUP	DYNTAB_FREE(dossiers); \
					DYNTAB_FREE(releves); \
					DYNTAB_FREE(data); \
					DYNTAB_FREE(empty); \
					qry_build_free(&flt); \
					M_FREE(sql)
int ReleveMensuel(				/* return : 0 on success, other on error */
	EVA_context *cntxt,				/* in/out : execution context data */
	unsigned long i_ctrl			/* in : control index in cntxt->form->ctrl */
){
	EVA_form *form = cntxt->form;
	DynTable dossiers = {0};
	DynTable releves = {0};
	DynTable data = {0};
	DynTable empty = {0};
	QryBuild flt = {0};
	DynBuffer *sql = NULL;
	unsigned long form_ReleveMensuel = 38003;
	unsigned long idform = DYNTAB_TOUL(&form->id_form);
	char mois[8];
	int b_archive;
	unsigned long i;	  

	i_ctrl = 0;

	/* Lecture des dossiers sélectionnés et du mois de releve */
	if(form_get_field_values(cntxt, &data, "SEL_MOIS", idform, 0)) STACK_ERROR;
	sprintf(mois, "%.6s", dyntab_val(&data, 0, 0));
	if(form_get_field_values(cntxt, &data, "ARCHIVE_AUTO", idform, 0)) STACK_ERROR;
	b_archive = dyntab_sz(&data, 0, 0);
	if(form_get_field_values(cntxt, &dossiers, "RELEVES_DOSSIERS", idform, 0)) STACK_ERROR;
	
	/* Creation des releves mensuels pour chaque dossier */
	for(i = 0; i < dossiers.nbrows; i++)
	{
		unsigned long iddossier = DYNTAB_TOULRC(&dossiers, i, 0), idreleve = 0;

		/* Recherche d'un releve pour le mois donne */
		qry_build_free(&flt); M_FREE(sql);
		if(qry_add_filter_simple_int(cntxt, &flt, RelNone, "_EVA_FORMSTAMP", RelList, form_ReleveMensuel)) STACK_ERROR;
		if(qry_add_filter_simple_txt(cntxt, &flt, RelNone, "MOIS_RELEVE", Exact, mois)) STACK_ERROR;
		if(qry_add_filter_simple_int(cntxt, &flt, RelNone, "RELEVE_MENSUEL_DOSSIER", RelList, iddossier)) STACK_ERROR;
		if( qry_build_clauses(cntxt, &flt, 1) || qry_build_flt_select(cntxt, &sql, &empty, &flt, 0, 0) ||
			sql_exec_query(cntxt, sql->data) || sql_get_table(cntxt, &data, 2)) STACK_ERROR;

		/* Rien a faire si la fiche existe */
		if(data.nbrows) continue;

		/* Lecture de l'etat d'avancement du dossier */
		if(qry_obj_field(cntxt, &data, iddossier, "ETAT_AVANCEMENT")) STACK_ERROR;

		/* Creation de la fiche releve mensuel pour le dossier */
		if(qry_add_new_idobj(cntxt, &idreleve, form_ReleveMensuel)) STACK_ERROR;
		if(qry_add_idobj_field_val(cntxt, idreleve, "ETAT_AVANCEMENT", DYNTAB_VAL_SZ(&data, 0, 0), 1, 0, 0)) STACK_ERROR;
		if(qry_add_idobj_field_val(cntxt, idreleve, "MOIS_RELEVE", mois, 6, 1, 0, 0)) STACK_ERROR;
		if(qry_add_idobj_field_rel(cntxt, idreleve, "RELEVE_MENSUEL_DOSSIER", iddossier, 1, 0, 0)) STACK_ERROR;

		/* Archivage si ASLL terminee */
		if(b_archive && *dyntab_val(&data, 0, 0) == '4')
			if(qry_add_idobj_field_val(cntxt, iddossier, "ETAT_AVANCEMENT", add_sz_str("Archivé"), 1, 0, 3)) STACK_ERROR;
	}

	/* Close active window */
	if(form_close_nosave(cntxt, idform, 0, NULL)) STACK_ERROR;

	RETURN_OK_CLEANUP;
}