	TITLE	D:\Travail\ABI\EVA\V4.0\CGI\Brunix-2016\dll_adsea01.c
	.386P
include listing.inc
if @Version gt 510
.model FLAT
else
_TEXT	SEGMENT PARA USE32 PUBLIC 'CODE'
_TEXT	ENDS
_DATA	SEGMENT DWORD USE32 PUBLIC 'DATA'
_DATA	ENDS
CONST	SEGMENT DWORD USE32 PUBLIC 'CONST'
CONST	ENDS
_BSS	SEGMENT DWORD USE32 PUBLIC 'BSS'
_BSS	ENDS
$$SYMBOLS	SEGMENT BYTE USE32 'DEBSYM'
$$SYMBOLS	ENDS
$$TYPES	SEGMENT BYTE USE32 'DEBTYP'
$$TYPES	ENDS
_TLS	SEGMENT DWORD USE32 PUBLIC 'TLS'
_TLS	ENDS
FLAT	GROUP _DATA, CONST, _BSS
	ASSUME	CS: FLAT, DS: FLAT, SS: FLAT
endif
PUBLIC	_Init_liste_mes
EXTRN	_put_html_page_header:NEAR
EXTRN	__iob:BYTE
EXTRN	_delay_to_datetxt:NEAR
EXTRN	_fflush:NEAR
EXTRN	_printf:NEAR
EXTRN	__snprintf:NEAR
EXTRN	_sprintf:NEAR
EXTRN	_sql_exec_query:NEAR
EXTRN	_atoi:NEAR
EXTRN	_get_id_value:NEAR
EXTRN	_calloc:NEAR
EXTRN	_qry_obj_field:NEAR
EXTRN	_dyntab_free:NEAR
EXTRN	_sql_get_table:NEAR
EXTRN	_dyntab_val:NEAR
EXTRN	_err_add_context:NEAR
EXTRN	_err_clear:NEAR
EXTRN	_strncpy:NEAR
_DATA	SEGMENT
$SG70292 DB	'DATE_FACTURE', 00H
	ORG $+3
$SG70295 DB	'01', 00H
	ORG $+1
$SG70298 DB	'<hr><font face=Arial><b>%s au %.2s/%.4s</b><hr>', 00H
$SG70299 DB	'_EVA_FORMSTAMP', 00H
	ORG $+1
$SG70300 DB	'MOTIF_CORRECTION', 00H
	ORG $+3
$SG70301 DB	'ETAT_FACTURATION', 00H
	ORG $+3
$SG70302 DB	'FACTURE', 00H
$SG70303 DB	'DEST_FACTURE', 00H
	ORG $+3
$SG70304 DB	'DATE_ECHEANCE', 00H
	ORG $+2
$SG70305 DB	'DATE_FACT_DEBUT', 00H
$SG70306 DB	'DATE_FACT_FIN', 00H
	ORG $+2
$SG70307 DB	'DATE_FACTURE', 00H
	ORG $+3
$SG70308 DB	'NOM_SOCIETE', 00H
$SG70309 DB	'En cours', 00H
	ORG $+3
$SG70310 DB	'Maintien', 00H
	ORG $+3
$SG70311 DB	'Archiv', 0e9H, 'e', 00H
	ORG $+3
$SG70312 DB	'En attente', 00H
	ORG $+1
$SG70313 DB	'ETAT_ECHEANCIER', 00H
$SG70314 DB	'ECHEANCIER', 00H
	ORG $+1
$SG70315 DB	'Echeance ce mois', 00H
	ORG $+3
$SG70316 DB	'Echeance le mois prochain', 00H
	ORG $+2
$SG70317 DB	'Echeance dans deux mois', 00H
$SG70318 DB	'Majorit', 0e9H, ' ce mois', 00H
	ORG $+3
$SG70319 DB	'Majorit', 0e9H, ' le mois prochain', 00H
	ORG $+2
$SG70320 DB	'Majorit', 0e9H, ' dans deux mois', 00H
$SG70321 DB	'Attente affectation TS', 00H
	ORG $+1
$SG70323 DB	'CREATE TEMPORARY TABLE IdMes (IdObj INT) TYPE=HEAP', 00H
	ORG $+1
$SG70325 DB	' Lecture des mesures de la facture ...', 00H
	ORG $+1
$SG70326 DB	'INSERT INTO IdMes (IdObj) ', 0aH, 'SELECT DISTINCT TLink'
	DB	'2.IdRelObj FROM TLink AS TLink0 ', 0aH, 'INNER JOIN TLink AS '
	DB	'TLink1 ON TLink0.IdObj=TLink1.IdObj ', 0aH, 'INNER JOIN TLink'
	DB	' AS TLink2 ON TLink0.IdObj=TLink2.IdObj ', 0aH, 'WHERE TLink0'
	DB	'.DateDel IS NULL AND TLink0.IdRelObj=%lu AND TLink0.IdField=%'
	DB	'lu ', 0aH, 'AND TLink1.DateDel IS NULL AND TLink1.IdRelObj=%l'
	DB	'u AND TLink1.IdField=%lu ', 0aH, 'AND TLink2.DateDel IS NULL '
	DB	'AND TLink2.IdField=%lu', 00H
	ORG $+3
$SG70328 DB	' %lu trouv', 0e9H, 'es<br>', 00H
	ORG $+2
$SG70329 DB	'Lecture des mesures avec des jugements sur les 24 dernie'
	DB	'rs mois ...', 00H
$SG70330 DB	'INSERT INTO IdMes (IdObj) ', 0aH, 'SELECT DISTINCT TLink'
	DB	'0.IdRelObj FROM TLink AS TLink0 ', 0aH, 'INNER JOIN TLink AS '
	DB	'TLink1 ON TLink0.IdObj=TLink1.IdObj ', 0aH, 'INNER JOIN TVal '
	DB	'ON TLink1.IdValue=TVal.IdValue ', 0aH, 'AND TLink0.DateDel IS'
	DB	' NULL AND TLink0.IdField=%lu ', 0aH, 'AND TLink1.DateDel IS N'
	DB	'ULL AND TLink1.IdField IN (%lu,%lu,%lu) ', 0aH, 'AND TVal.Txt'
	DB	'Value>=''%s''', 00H
	ORG $+3
$SG70332 DB	' %lu trouv', 0e9H, 'es<br>', 00H
	ORG $+2
$SG70333 DB	'Lecture des mesures en cours et en attente ...', 00H
	ORG $+1
$SG70334 DB	'INSERT INTO IdMes (IdObj) ', 0aH, 'SELECT DISTINCT TLink'
	DB	'0.IdObj FROM TLink AS TLink0 ', 0aH, 'INNER JOIN TLink AS TLi'
	DB	'nk1 ON TLink0.IdObj=TLink1.IdObj ', 0aH, 'WHERE TLink0.DateDe'
	DB	'l IS NULL AND TLink0.IdRelObj=%lu AND TLink0.IdField=%lu ', 0aH
	DB	'AND TLink1.DateDel IS NULL AND TLink1.IdField=%lu AND TLink1.'
	DB	'IdValue<>%lu', 00H
	ORG $+2
$SG70336 DB	' %lu trouv', 0e9H, 'es<br>', 00H
	ORG $+2
$SG70337 DB	'Nombre total de mesures ', 0e0H, ' examiner :', 00H
	ORG $+3
$SG70340 DB	'SELECT DISTINCT IdObj FROM IdMes ORDER BY IdObj', 00H
$SG70341 DB	'DROP TABLE IdMes', 00H
	ORG $+3
$SG70344 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70346 DB	' %lu<br>', 00H
	ORG $+3
$SG70348 DB	'D:\Travail\ABI\EVA\V4.0\CGI\Brunix-2016\dll_adsea01.c', 00H
	ORG $+2
$SG70349 DB	'Init_liste_mes', 00H
	ORG $+1
$SG70351 DB	'D:\Travail\ABI\EVA\V4.0\CGI\Brunix-2016\dll_adsea01.c', 00H
	ORG $+2
$SG70352 DB	'Init_liste_mes', 00H
_DATA	ENDS
_TEXT	SEGMENT
_cntxt$ = 8
_cf$ = 12
_data$ = -2068
_qry$ = -2048
_txt$ = -2100
_Init_liste_mes PROC NEAR

; 122  : ){

	push	ebp
	mov	ebp, esp
	sub	esp, 2100				; 00000834H
	push	edi

; 123  : 	DynTable data = { 0 };

	mov	DWORD PTR _data$[ebp], 0
	xor	eax, eax
	mov	DWORD PTR _data$[ebp+4], eax
	mov	DWORD PTR _data$[ebp+8], eax
	mov	DWORD PTR _data$[ebp+12], eax
	mov	DWORD PTR _data$[ebp+16], eax

; 124  : 	char qry[2048] = {0};

	mov	BYTE PTR _qry$[ebp], 0
	mov	ecx, 511				; 000001ffH
	xor	eax, eax
	lea	edi, DWORD PTR _qry$[ebp+1]
	rep stosd
	stosw
	stosb

; 125  : 	char txt[32];
; 126  : 
; 127  : 	/* Initialisation dates mois */
; 128  : 	if(cf->idfacture)

	mov	ecx, DWORD PTR _cf$[ebp]
	cmp	DWORD PTR [ecx+4], 0
	je	SHORT $L70290

; 130  : 		if(qry_obj_field(cntxt, &data, cf->idfacture, "DATE_FACTURE")) STACK_ERROR;

	push	OFFSET FLAT:$SG70292
	mov	edx, DWORD PTR _cf$[ebp]
	mov	eax, DWORD PTR [edx+4]
	push	eax
	lea	ecx, DWORD PTR _data$[ebp]
	push	ecx
	mov	edx, DWORD PTR _cntxt$[ebp]
	push	edx
	call	_qry_obj_field
	add	esp, 16					; 00000010H
	test	eax, eax
	je	SHORT $L70291
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 130		; 00000082H
	jmp	$eva_err$70293
$L70291:

; 131  : 		strncpy(cf->datedebmois, dyntab_val(&data, 0, 0), 6);

	push	6
	push	0
	push	0
	lea	ecx, DWORD PTR _data$[ebp]
	push	ecx
	call	_dyntab_val
	add	esp, 12					; 0000000cH
	push	eax
	mov	edx, DWORD PTR _cf$[ebp]
	add	edx, 168				; 000000a8H
	push	edx
	call	_strncpy
	add	esp, 12					; 0000000cH

; 133  : 	else

	jmp	SHORT $L70294
$L70290:

; 134  : 		strncpy(cf->datedebmois, cntxt->timestamp, 6);

	push	6
	mov	eax, DWORD PTR _cntxt$[ebp]
	add	eax, 29704				; 00007408H
	push	eax
	mov	ecx, DWORD PTR _cf$[ebp]
	add	ecx, 168				; 000000a8H
	push	ecx
	call	_strncpy
	add	esp, 12					; 0000000cH
$L70294:

; 135  : 	sprintf(cf->datedebmois + 6, "01");

	push	OFFSET FLAT:$SG70295
	mov	edx, DWORD PTR _cf$[ebp]
	add	edx, 174				; 000000aeH
	push	edx
	call	_sprintf
	add	esp, 8

; 136  : 	delay_to_datetxt(cf->datemois1, cf->datedebmois, 1, 'M');

	push	77					; 0000004dH
	push	1
	mov	eax, DWORD PTR _cf$[ebp]
	add	eax, 168				; 000000a8H
	push	eax
	mov	ecx, DWORD PTR _cf$[ebp]
	add	ecx, 192				; 000000c0H
	push	ecx
	call	_delay_to_datetxt
	add	esp, 16					; 00000010H

; 137  : 	delay_to_datetxt(cf->datefinmois, cf->datemois1, -1, 'D');

	push	68					; 00000044H
	push	-1
	mov	edx, DWORD PTR _cf$[ebp]
	add	edx, 192				; 000000c0H
	push	edx
	mov	eax, DWORD PTR _cf$[ebp]
	add	eax, 178				; 000000b2H
	push	eax
	call	_delay_to_datetxt
	add	esp, 16					; 00000010H

; 138  : 	cf->datefinmois[8] = 0;

	mov	ecx, DWORD PTR _cf$[ebp]
	mov	BYTE PTR [ecx+186], 0

; 139  : 	delay_to_datetxt(cf->datemois1, cf->datedebmois, 1, 'M');

	push	77					; 0000004dH
	push	1
	mov	edx, DWORD PTR _cf$[ebp]
	add	edx, 168				; 000000a8H
	push	edx
	mov	eax, DWORD PTR _cf$[ebp]
	add	eax, 192				; 000000c0H
	push	eax
	call	_delay_to_datetxt
	add	esp, 16					; 00000010H

; 140  : 	delay_to_datetxt(cf->datemois2, cf->datedebmois, 2, 'M');

	push	77					; 0000004dH
	push	2
	mov	ecx, DWORD PTR _cf$[ebp]
	add	ecx, 168				; 000000a8H
	push	ecx
	mov	edx, DWORD PTR _cf$[ebp]
	add	edx, 202				; 000000caH
	push	edx
	call	_delay_to_datetxt
	add	esp, 16					; 00000010H

; 141  : 	delay_to_datetxt(cf->datemois3, cf->datedebmois, 3, 'M');

	push	77					; 0000004dH
	push	3
	mov	eax, DWORD PTR _cf$[ebp]
	add	eax, 168				; 000000a8H
	push	eax
	mov	ecx, DWORD PTR _cf$[ebp]
	add	ecx, 212				; 000000d4H
	push	ecx
	call	_delay_to_datetxt
	add	esp, 16					; 00000010H

; 142  : 	cf->nbjoursmois = atoi(cf->datefinmois + 6);

	mov	edx, DWORD PTR _cf$[ebp]
	add	edx, 184				; 000000b8H
	push	edx
	call	_atoi
	add	esp, 4
	mov	ecx, DWORD PTR _cf$[ebp]
	mov	DWORD PTR [ecx+188], eax

; 143  : 
; 144  : 	/* Debut du journal d'execution */
; 145  : 	put_html_page_header(cntxt, NULL, cf->label, NULL, 3);

	push	3
	push	0
	mov	edx, DWORD PTR _cf$[ebp]
	mov	eax, DWORD PTR [edx]
	push	eax
	push	0
	mov	ecx, DWORD PTR _cntxt$[ebp]
	push	ecx
	call	_put_html_page_header
	add	esp, 20					; 00000014H

; 146  : 	printf("<hr><font face=Arial><b>%s au %.2s/%.4s</b><hr>", cf->label, cf->datedebmois + 4, cf->datedebmois);

	mov	edx, DWORD PTR _cf$[ebp]
	add	edx, 168				; 000000a8H
	push	edx
	mov	eax, DWORD PTR _cf$[ebp]
	add	eax, 172				; 000000acH
	push	eax
	mov	ecx, DWORD PTR _cf$[ebp]
	mov	edx, DWORD PTR [ecx]
	push	edx
	push	OFFSET FLAT:$SG70298
	call	_printf
	add	esp, 16					; 00000010H

; 147  : 	fflush(stdout);

	push	OFFSET FLAT:__iob+32
	call	_fflush
	add	esp, 4

; 148  : 
; 149  : 	/* Définition des constantes communes */
; 150  : 	cf->val_FORMSTAMP = get_id_value(cntxt, add_sz_str("_EVA_FORMSTAMP"));

	push	14					; 0000000eH
	push	OFFSET FLAT:$SG70299
	mov	eax, DWORD PTR _cntxt$[ebp]
	push	eax
	call	_get_id_value
	add	esp, 12					; 0000000cH
	mov	ecx, DWORD PTR _cf$[ebp]
	mov	DWORD PTR [ecx+16], eax

; 151  : 	cf->val_MOTIF_CORRECTION = get_id_value(cntxt, add_sz_str("MOTIF_CORRECTION"));

	push	16					; 00000010H
	push	OFFSET FLAT:$SG70300
	mov	edx, DWORD PTR _cntxt$[ebp]
	push	edx
	call	_get_id_value
	add	esp, 12					; 0000000cH
	mov	ecx, DWORD PTR _cf$[ebp]
	mov	DWORD PTR [ecx+48], eax

; 152  : 	cf->val_ETAT_FACTURATION = get_id_value(cntxt, add_sz_str("ETAT_FACTURATION"));

	push	16					; 00000010H
	push	OFFSET FLAT:$SG70301
	mov	edx, DWORD PTR _cntxt$[ebp]
	push	edx
	call	_get_id_value
	add	esp, 12					; 0000000cH
	mov	ecx, DWORD PTR _cf$[ebp]
	mov	DWORD PTR [ecx+20], eax

; 153  : 	cf->val_FACTURE = get_id_value(cntxt, add_sz_str("FACTURE"));

	push	7
	push	OFFSET FLAT:$SG70302
	mov	edx, DWORD PTR _cntxt$[ebp]
	push	edx
	call	_get_id_value
	add	esp, 12					; 0000000cH
	mov	ecx, DWORD PTR _cf$[ebp]
	mov	DWORD PTR [ecx+28], eax

; 154  : 	cf->val_DEST_FACTURE = get_id_value(cntxt, add_sz_str("DEST_FACTURE"));

	push	12					; 0000000cH
	push	OFFSET FLAT:$SG70303
	mov	edx, DWORD PTR _cntxt$[ebp]
	push	edx
	call	_get_id_value
	add	esp, 12					; 0000000cH
	mov	ecx, DWORD PTR _cf$[ebp]
	mov	DWORD PTR [ecx+36], eax

; 155  : 	cf->val_DATE_ECHEANCE = get_id_value(cntxt, add_sz_str("DATE_ECHEANCE"));

	push	13					; 0000000dH
	push	OFFSET FLAT:$SG70304
	mov	edx, DWORD PTR _cntxt$[ebp]
	push	edx
	call	_get_id_value
	add	esp, 12					; 0000000cH
	mov	ecx, DWORD PTR _cf$[ebp]
	mov	DWORD PTR [ecx+68], eax

; 156  : 	cf->val_DATE_FACT_DEBUT = get_id_value(cntxt, add_sz_str("DATE_FACT_DEBUT"));

	push	15					; 0000000fH
	push	OFFSET FLAT:$SG70305
	mov	edx, DWORD PTR _cntxt$[ebp]
	push	edx
	call	_get_id_value
	add	esp, 12					; 0000000cH
	mov	ecx, DWORD PTR _cf$[ebp]
	mov	DWORD PTR [ecx+72], eax

; 157  : 	cf->val_DATE_FACT_FIN = get_id_value(cntxt, add_sz_str("DATE_FACT_FIN"));

	push	13					; 0000000dH
	push	OFFSET FLAT:$SG70306
	mov	edx, DWORD PTR _cntxt$[ebp]
	push	edx
	call	_get_id_value
	add	esp, 12					; 0000000cH
	mov	ecx, DWORD PTR _cf$[ebp]
	mov	DWORD PTR [ecx+76], eax

; 158  : 	cf->val_DATE_FACTURE = get_id_value(cntxt, add_sz_str("DATE_FACTURE"));

	push	12					; 0000000cH
	push	OFFSET FLAT:$SG70307
	mov	edx, DWORD PTR _cntxt$[ebp]
	push	edx
	call	_get_id_value
	add	esp, 12					; 0000000cH
	mov	ecx, DWORD PTR _cf$[ebp]
	mov	DWORD PTR [ecx+80], eax

; 159  : 	cf->val_NOM_SOCIETE = get_id_value(cntxt, add_sz_str("NOM_SOCIETE"));

	push	11					; 0000000bH
	push	OFFSET FLAT:$SG70308
	mov	edx, DWORD PTR _cntxt$[ebp]
	push	edx
	call	_get_id_value
	add	esp, 12					; 0000000cH
	mov	ecx, DWORD PTR _cf$[ebp]
	mov	DWORD PTR [ecx+84], eax

; 160  : 	cf->val_En_cours = get_id_value(cntxt, add_sz_str("En cours"));

	push	8
	push	OFFSET FLAT:$SG70309
	mov	edx, DWORD PTR _cntxt$[ebp]
	push	edx
	call	_get_id_value
	add	esp, 12					; 0000000cH
	mov	ecx, DWORD PTR _cf$[ebp]
	mov	DWORD PTR [ecx+88], eax

; 161  : 	cf->val_Maintien = get_id_value(cntxt, add_sz_str("Maintien"));

	push	8
	push	OFFSET FLAT:$SG70310
	mov	edx, DWORD PTR _cntxt$[ebp]
	push	edx
	call	_get_id_value
	add	esp, 12					; 0000000cH
	mov	ecx, DWORD PTR _cf$[ebp]
	mov	DWORD PTR [ecx+92], eax

; 162  : 	cf->val_Archivee = get_id_value(cntxt, add_sz_str("Archivée"));

	push	8
	push	OFFSET FLAT:$SG70311
	mov	edx, DWORD PTR _cntxt$[ebp]
	push	edx
	call	_get_id_value
	add	esp, 12					; 0000000cH
	mov	ecx, DWORD PTR _cf$[ebp]
	mov	DWORD PTR [ecx+96], eax

; 163  : 	cf->val_En_attente = get_id_value(cntxt, add_sz_str("En attente"));

	push	10					; 0000000aH
	push	OFFSET FLAT:$SG70312
	mov	edx, DWORD PTR _cntxt$[ebp]
	push	edx
	call	_get_id_value
	add	esp, 12					; 0000000cH
	mov	ecx, DWORD PTR _cf$[ebp]
	mov	DWORD PTR [ecx+100], eax

; 164  : 	cf->val_ETAT_ECHEANCIER = get_id_value(cntxt, add_sz_str("ETAT_ECHEANCIER"));

	push	15					; 0000000fH
	push	OFFSET FLAT:$SG70313
	mov	edx, DWORD PTR _cntxt$[ebp]
	push	edx
	call	_get_id_value
	add	esp, 12					; 0000000cH
	mov	ecx, DWORD PTR _cf$[ebp]
	mov	DWORD PTR [ecx+104], eax

; 165  : 	cf->val_ECHEANCIER = get_id_value(cntxt, add_sz_str("ECHEANCIER"));

	push	10					; 0000000aH
	push	OFFSET FLAT:$SG70314
	mov	edx, DWORD PTR _cntxt$[ebp]
	push	edx
	call	_get_id_value
	add	esp, 12					; 0000000cH
	mov	ecx, DWORD PTR _cf$[ebp]
	mov	DWORD PTR [ecx+108], eax

; 166  : 	cf->val_Echeance0M = get_id_value(cntxt, add_sz_str("Echeance ce mois"));

	push	16					; 00000010H
	push	OFFSET FLAT:$SG70315
	mov	edx, DWORD PTR _cntxt$[ebp]
	push	edx
	call	_get_id_value
	add	esp, 12					; 0000000cH
	mov	ecx, DWORD PTR _cf$[ebp]
	mov	DWORD PTR [ecx+112], eax

; 167  : 	cf->val_Echeance1M = get_id_value(cntxt, add_sz_str("Echeance le mois prochain"));

	push	25					; 00000019H
	push	OFFSET FLAT:$SG70316
	mov	edx, DWORD PTR _cntxt$[ebp]
	push	edx
	call	_get_id_value
	add	esp, 12					; 0000000cH
	mov	ecx, DWORD PTR _cf$[ebp]
	mov	DWORD PTR [ecx+116], eax

; 168  : 	cf->val_Echeance2M = get_id_value(cntxt, add_sz_str("Echeance dans deux mois"));

	push	23					; 00000017H
	push	OFFSET FLAT:$SG70317
	mov	edx, DWORD PTR _cntxt$[ebp]
	push	edx
	call	_get_id_value
	add	esp, 12					; 0000000cH
	mov	ecx, DWORD PTR _cf$[ebp]
	mov	DWORD PTR [ecx+120], eax

; 169  : 	cf->val_Majorite0M = get_id_value(cntxt, add_sz_str("Majorité ce mois"));

	push	16					; 00000010H
	push	OFFSET FLAT:$SG70318
	mov	edx, DWORD PTR _cntxt$[ebp]
	push	edx
	call	_get_id_value
	add	esp, 12					; 0000000cH
	mov	ecx, DWORD PTR _cf$[ebp]
	mov	DWORD PTR [ecx+124], eax

; 170  : 	cf->val_Majorite1M = get_id_value(cntxt, add_sz_str("Majorité le mois prochain"));

	push	25					; 00000019H
	push	OFFSET FLAT:$SG70319
	mov	edx, DWORD PTR _cntxt$[ebp]
	push	edx
	call	_get_id_value
	add	esp, 12					; 0000000cH
	mov	ecx, DWORD PTR _cf$[ebp]
	mov	DWORD PTR [ecx+128], eax

; 171  : 	cf->val_Majorite2M = get_id_value(cntxt, add_sz_str("Majorité dans deux mois"));

	push	23					; 00000017H
	push	OFFSET FLAT:$SG70320
	mov	edx, DWORD PTR _cntxt$[ebp]
	push	edx
	call	_get_id_value
	add	esp, 12					; 0000000cH
	mov	ecx, DWORD PTR _cf$[ebp]
	mov	DWORD PTR [ecx+132], eax

; 172  : 	cf->val_AttenteAffectationTS = get_id_value(cntxt, add_sz_str("Attente affectation TS"));

	push	22					; 00000016H
	push	OFFSET FLAT:$SG70321
	mov	edx, DWORD PTR _cntxt$[ebp]
	push	edx
	call	_get_id_value
	add	esp, 12					; 0000000cH
	mov	ecx, DWORD PTR _cf$[ebp]
	mov	DWORD PTR [ecx+136], eax

; 173  : 
; 174  : 	/* Creation de la liste des mesures a traiter */
; 175  : 	if(sql_exec_query(cntxt, "CREATE TEMPORARY TABLE IdMes (IdObj INT) TYPE=HEAP")) STACK_ERROR;

	push	OFFSET FLAT:$SG70323
	mov	edx, DWORD PTR _cntxt$[ebp]
	push	edx
	call	_sql_exec_query
	add	esp, 8
	test	eax, eax
	je	SHORT $L70322
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 175		; 000000afH
	jmp	$eva_err$70293
$L70322:

; 176  : 
; 177  : 	/* Lecture des mesures de la facture */
; 178  : 	if(cf->idfacture)

	mov	ecx, DWORD PTR _cf$[ebp]
	cmp	DWORD PTR [ecx+4], 0
	je	$L70324

; 180  : 		printf(" Lecture des mesures de la facture ...");

	push	OFFSET FLAT:$SG70325
	call	_printf
	add	esp, 4

; 181  : 		fflush(stdout);

	push	OFFSET FLAT:__iob+32
	call	_fflush
	add	esp, 4

; 182  : 		snprintf(qry, sizeof(qry),
; 183  : 				"INSERT INTO IdMes (IdObj) \n"
; 184  : 				"SELECT DISTINCT TLink2.IdRelObj FROM TLink AS TLink0 \n"
; 185  : 				"INNER JOIN TLink AS TLink1 ON TLink0.IdObj=TLink1.IdObj \n"
; 186  : 				"INNER JOIN TLink AS TLink2 ON TLink0.IdObj=TLink2.IdObj \n"
; 187  : 				"WHERE TLink0.DateDel IS NULL AND TLink0.IdRelObj=%lu AND TLink0.IdField=%lu \n"
; 188  : 				"AND TLink1.DateDel IS NULL AND TLink1.IdRelObj=%lu AND TLink1.IdField=%lu \n"
; 189  : 				"AND TLink2.DateDel IS NULL AND TLink2.IdField=%lu",
; 190  : 			cf->form_LigneFacture, cf->val_FORMSTAMP, cf->idfacture, cf->val_FACTURE, cf->val_MES_LIGNE_FACT);

	mov	edx, DWORD PTR _cf$[ebp]
	mov	eax, DWORD PTR [edx+32]
	push	eax
	mov	ecx, DWORD PTR _cf$[ebp]
	mov	edx, DWORD PTR [ecx+28]
	push	edx
	mov	eax, DWORD PTR _cf$[ebp]
	mov	ecx, DWORD PTR [eax+4]
	push	ecx
	mov	edx, DWORD PTR _cf$[ebp]
	mov	eax, DWORD PTR [edx+16]
	push	eax
	mov	ecx, DWORD PTR _cf$[ebp]
	mov	edx, DWORD PTR [ecx+12]
	push	edx
	push	OFFSET FLAT:$SG70326
	push	2048					; 00000800H
	lea	eax, DWORD PTR _qry$[ebp]
	push	eax
	call	__snprintf
	add	esp, 32					; 00000020H

; 191  : 		if(sql_exec_query(cntxt, qry)) STACK_ERROR;

	lea	ecx, DWORD PTR _qry$[ebp]
	push	ecx
	mov	edx, DWORD PTR _cntxt$[ebp]
	push	edx
	call	_sql_exec_query
	add	esp, 8
	test	eax, eax
	je	SHORT $L70327
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 191		; 000000bfH
	jmp	$eva_err$70293
$L70327:

; 192  : 		printf(" %lu trouvées<br>", cntxt->sql_nbrows);

	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	edx, DWORD PTR [ecx+29848]
	push	edx
	push	OFFSET FLAT:$SG70328
	call	_printf
	add	esp, 8

; 193  : 		fflush(stdout);

	push	OFFSET FLAT:__iob+32
	call	_fflush
	add	esp, 4
$L70324:

; 195  : 
; 196  : 	/* Lecture des mesures avec des jugements récents */
; 197  : 	printf("Lecture des mesures avec des jugements sur les 24 derniers mois ...");

	push	OFFSET FLAT:$SG70329
	call	_printf
	add	esp, 4

; 198  : 	fflush(stdout);

	push	OFFSET FLAT:__iob+32
	call	_fflush
	add	esp, 4

; 199  : 	delay_to_datetxt(txt, cf->datedebmois, -24, 'M');

	push	77					; 0000004dH
	push	-24					; ffffffe8H
	mov	eax, DWORD PTR _cf$[ebp]
	add	eax, 168				; 000000a8H
	push	eax
	lea	ecx, DWORD PTR _txt$[ebp]
	push	ecx
	call	_delay_to_datetxt
	add	esp, 16					; 00000010H

; 200  : 	snprintf(qry, sizeof(qry),
; 201  : 			"INSERT INTO IdMes (IdObj) \n"
; 202  : 			"SELECT DISTINCT TLink0.IdRelObj FROM TLink AS TLink0 \n"
; 203  : 			"INNER JOIN TLink AS TLink1 ON TLink0.IdObj=TLink1.IdObj \n"
; 204  : 			"INNER JOIN TVal ON TLink1.IdValue=TVal.IdValue \n"
; 205  : 			"AND TLink0.DateDel IS NULL AND TLink0.IdField=%lu \n"
; 206  : 			"AND TLink1.DateDel IS NULL AND TLink1.IdField IN (%lu,%lu,%lu) \n"
; 207  : 			"AND TVal.TxtValue>='%s'",
; 208  : 		cf->val_MESURE_JUGT, cf->val_EFFET_JUGT, cf->val_ECHEANCE_JUGT, cf->val_DATE_JUGT, txt);

	lea	edx, DWORD PTR _txt$[ebp]
	push	edx
	mov	eax, DWORD PTR _cf$[ebp]
	mov	ecx, DWORD PTR [eax+64]
	push	ecx
	mov	edx, DWORD PTR _cf$[ebp]
	mov	eax, DWORD PTR [edx+60]
	push	eax
	mov	ecx, DWORD PTR _cf$[ebp]
	mov	edx, DWORD PTR [ecx+56]
	push	edx
	mov	eax, DWORD PTR _cf$[ebp]
	mov	ecx, DWORD PTR [eax+52]
	push	ecx
	push	OFFSET FLAT:$SG70330
	push	2048					; 00000800H
	lea	edx, DWORD PTR _qry$[ebp]
	push	edx
	call	__snprintf
	add	esp, 32					; 00000020H

; 209  : 	if(sql_exec_query(cntxt, qry)) STACK_ERROR;

	lea	eax, DWORD PTR _qry$[ebp]
	push	eax
	mov	ecx, DWORD PTR _cntxt$[ebp]
	push	ecx
	call	_sql_exec_query
	add	esp, 8
	test	eax, eax
	je	SHORT $L70331
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 209		; 000000d1H
	jmp	$eva_err$70293
$L70331:

; 210  : 	printf(" %lu trouvées<br>", cntxt->sql_nbrows);

	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	ecx, DWORD PTR [eax+29848]
	push	ecx
	push	OFFSET FLAT:$SG70332
	call	_printf
	add	esp, 8

; 211  : 	fflush(stdout);

	push	OFFSET FLAT:__iob+32
	call	_fflush
	add	esp, 4

; 212  : 
; 213  : 	/* Lecture des mesures en cours */
; 214  : 	printf("Lecture des mesures en cours et en attente ...");

	push	OFFSET FLAT:$SG70333
	call	_printf
	add	esp, 4

; 215  : 	fflush(stdout);

	push	OFFSET FLAT:__iob+32
	call	_fflush
	add	esp, 4

; 216  : 	snprintf(qry, sizeof(qry),
; 217  : 			"INSERT INTO IdMes (IdObj) \n"
; 218  : 			"SELECT DISTINCT TLink0.IdObj FROM TLink AS TLink0 \n"
; 219  : 			"INNER JOIN TLink AS TLink1 ON TLink0.IdObj=TLink1.IdObj \n"
; 220  : 			"WHERE TLink0.DateDel IS NULL AND TLink0.IdRelObj=%lu AND TLink0.IdField=%lu \n"
; 221  : 			"AND TLink1.DateDel IS NULL AND TLink1.IdField=%lu AND TLink1.IdValue<>%lu",
; 222  : 		cf->form_Mesure, cf->val_FORMSTAMP, cf->val_ETAT_FACTURATION, cf->val_Archivee);

	mov	edx, DWORD PTR _cf$[ebp]
	mov	eax, DWORD PTR [edx+96]
	push	eax
	mov	ecx, DWORD PTR _cf$[ebp]
	mov	edx, DWORD PTR [ecx+20]
	push	edx
	mov	eax, DWORD PTR _cf$[ebp]
	mov	ecx, DWORD PTR [eax+16]
	push	ecx
	mov	edx, DWORD PTR _cf$[ebp]
	mov	eax, DWORD PTR [edx+8]
	push	eax
	push	OFFSET FLAT:$SG70334
	push	2048					; 00000800H
	lea	ecx, DWORD PTR _qry$[ebp]
	push	ecx
	call	__snprintf
	add	esp, 28					; 0000001cH

; 223  : 	if(sql_exec_query(cntxt, qry)) STACK_ERROR;

	lea	edx, DWORD PTR _qry$[ebp]
	push	edx
	mov	eax, DWORD PTR _cntxt$[ebp]
	push	eax
	call	_sql_exec_query
	add	esp, 8
	test	eax, eax
	je	SHORT $L70335
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 223		; 000000dfH
	jmp	$eva_err$70293
$L70335:

; 224  : 	printf(" %lu trouvées<br>", cntxt->sql_nbrows);

	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	eax, DWORD PTR [edx+29848]
	push	eax
	push	OFFSET FLAT:$SG70336
	call	_printf
	add	esp, 8

; 225  : 	fflush(stdout);

	push	OFFSET FLAT:__iob+32
	call	_fflush
	add	esp, 4

; 226  : 
; 227  : 	/* Compilation des mesures a examiner */
; 228  : 	printf("Nombre total de mesures à examiner :");

	push	OFFSET FLAT:$SG70337
	call	_printf
	add	esp, 4

; 229  : 	fflush(stdout);

	push	OFFSET FLAT:__iob+32
	call	_fflush
	add	esp, 4

; 230  : 	if(sql_exec_query(cntxt, "SELECT DISTINCT IdObj FROM IdMes ORDER BY IdObj") ||
; 231  : 		sql_get_table(cntxt, &cf->tmes, 2) ||
; 232  : 		sql_exec_query(cntxt, "DROP TABLE IdMes")) STACK_ERROR;

	push	OFFSET FLAT:$SG70340
	mov	ecx, DWORD PTR _cntxt$[ebp]
	push	ecx
	call	_sql_exec_query
	add	esp, 8
	test	eax, eax
	jne	SHORT $L70339
	push	2
	mov	edx, DWORD PTR _cf$[ebp]
	add	edx, 224				; 000000e0H
	push	edx
	mov	eax, DWORD PTR _cntxt$[ebp]
	push	eax
	call	_sql_get_table
	add	esp, 12					; 0000000cH
	test	eax, eax
	jne	SHORT $L70339
	push	OFFSET FLAT:$SG70341
	mov	ecx, DWORD PTR _cntxt$[ebp]
	push	ecx
	call	_sql_exec_query
	add	esp, 8
	test	eax, eax
	je	SHORT $L70338
$L70339:
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 232		; 000000e8H
	jmp	$eva_err$70293
$L70338:

; 233  : 
; 234  : 	/* Allocation memoire pour les données des mesures */
; 235  : 	cf->nb_mes = cf->tmes.nbrows;

	mov	eax, DWORD PTR _cf$[ebp]
	mov	ecx, DWORD PTR _cf$[ebp]
	mov	edx, DWORD PTR [ecx+224]
	mov	DWORD PTR [eax+244], edx

; 236  : 	C_ALLOC(cf->mes, sizeof(cf->mes[0]), cf->nb_mes);

	mov	eax, DWORD PTR _cf$[ebp]
	mov	ecx, DWORD PTR [eax+244]
	push	ecx
	push	168					; 000000a8H
	call	_calloc
	add	esp, 8
	mov	edx, DWORD PTR _cf$[ebp]
	mov	DWORD PTR [edx+248], eax
	mov	eax, DWORD PTR _cf$[ebp]
	cmp	DWORD PTR [eax+248], 0
	jne	SHORT $L70342
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29872], OFFSET FLAT:$SG70344
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 236		; 000000ecH
	jmp	SHORT $eva_err$70293
$L70342:

; 237  : 	printf(" %lu<br>", cf->nb_mes);

	mov	eax, DWORD PTR _cf$[ebp]
	mov	ecx, DWORD PTR [eax+244]
	push	ecx
	push	OFFSET FLAT:$SG70346
	call	_printf
	add	esp, 8

; 238  : 	fflush(stdout);

	push	OFFSET FLAT:__iob+32
	call	_fflush
	add	esp, 4
$eva_noerr$70347:

; 239  : 
; 240  : 	RETURN_OK_CLEANUP;

	push	0
	push	OFFSET FLAT:$SG70348
	push	OFFSET FLAT:$SG70349
	mov	edx, DWORD PTR _cntxt$[ebp]
	push	edx
	call	_err_clear
	add	esp, 16					; 00000010H
$eva_err$70293:
	mov	eax, DWORD PTR _cntxt$[ebp]
	cmp	DWORD PTR [eax+29872], 0
	je	SHORT $L70350
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	edx, DWORD PTR [ecx+29900]
	push	edx
	push	OFFSET FLAT:$SG70351
	push	OFFSET FLAT:$SG70352
	mov	eax, DWORD PTR _cntxt$[ebp]
	push	eax
	call	_err_add_context
	add	esp, 16					; 00000010H
$L70350:
	lea	ecx, DWORD PTR _data$[ebp]
	push	ecx
	call	_dyntab_free
	add	esp, 4
	mov	edx, DWORD PTR _cntxt$[ebp]
	xor	eax, eax
	cmp	DWORD PTR [edx+29872], 0
	setne	al

; 241  : }

	pop	edi
	mov	esp, ebp
	pop	ebp
	ret	0
_Init_liste_mes ENDP
_TEXT	ENDS
PUBLIC	_Calc_echeancier
EXTRN	_putc:NEAR
EXTRN	_qry_update_idobj_idfield:NEAR
EXTRN	_qry_add_val:NEAR
EXTRN	_strcmp:NEAR
_DATA	SEGMENT
	ORG $+1
$SG70391 DB	'*</pre></font></b><hr>', 00H
	ORG $+1
$SG70392 DB	'%lu ', 0e9H, 'ch', 0e9H, 'ances ce mois<br>%lu ', 0e9H, 'c'
	DB	'h', 0e9H, 'ances le mois prochain<br>%lu ', 0e9H, 'ch', 0e9H, 'a'
	DB	'nces ', 0e0H, ' deux mois<br>%lu mesures en attente d''affect'
	DB	'ation TS<br><br>', 00H
$SG70393 DB	'<hr><br><center><input type=image name=''B$#NOP'' src='''
	DB	'../img/_eva_btn_gobackobj_fr.gif''></center><br>', 0aH, 00H
	ORG $+2
$SG70395 DB	'D:\Travail\ABI\EVA\V4.0\CGI\Brunix-2016\dll_adsea01.c', 00H
	ORG $+2
$SG70396 DB	'Calc_echeancier', 00H
$SG70398 DB	'D:\Travail\ABI\EVA\V4.0\CGI\Brunix-2016\dll_adsea01.c', 00H
	ORG $+2
$SG70399 DB	'Calc_echeancier', 00H
_DATA	ENDS
_TEXT	SEGMENT
_cntxt$ = 8
_cf$ = 12
_i$ = -8
_cnt$ = -4
_echeance$70368 = -84
_datefin$70369 = -76
_majorite$70370 = -80
_ano$70371 = -88
_val$70372 = -72
_Calc_echeancier PROC NEAR

; 254  : ){

	push	ebp
	mov	ebp, esp
	sub	esp, 88					; 00000058H
	push	edi

; 255  : 	unsigned long i, cnt = 0;

	mov	DWORD PTR _cnt$[ebp], 0

; 256  : 
; 257  : 	/* Maj echeancier pour chaque mesure à examiner */
; 258  : 	if(cf) for(i = 0; i < cf->nb_mes; i++)

	cmp	DWORD PTR _cf$[ebp], 0
	je	$L70367
	mov	DWORD PTR _i$[ebp], 0
	jmp	SHORT $L70365
$L70366:
	mov	eax, DWORD PTR _i$[ebp]
	add	eax, 1
	mov	DWORD PTR _i$[ebp], eax
$L70365:
	mov	ecx, DWORD PTR _cf$[ebp]
	mov	edx, DWORD PTR _i$[ebp]
	cmp	edx, DWORD PTR [ecx+244]
	jae	$L70367

; 260  : 		unsigned long echeance = 0;

	mov	DWORD PTR _echeance$70368[ebp], 0

; 261  : 		char *datefin = cf->mes[i].fin;

	mov	eax, DWORD PTR _i$[ebp]
	imul	eax, 168				; 000000a8H
	mov	ecx, DWORD PTR _cf$[ebp]
	mov	edx, DWORD PTR [ecx+248]
	lea	eax, DWORD PTR [edx+eax+14]
	mov	DWORD PTR _datefin$70369[ebp], eax

; 262  : 		char *majorite = cf->mes[i].majorite;

	mov	ecx, DWORD PTR _i$[ebp]
	imul	ecx, 168				; 000000a8H
	mov	edx, DWORD PTR _cf$[ebp]
	mov	eax, DWORD PTR [edx+248]
	lea	ecx, DWORD PTR [eax+ecx+24]
	mov	DWORD PTR _majorite$70370[ebp], ecx

; 263  : 		DynTable *ano = &cf->mes[i].notes;

	mov	edx, DWORD PTR _i$[ebp]
	imul	edx, 168				; 000000a8H
	mov	eax, DWORD PTR _cf$[ebp]
	mov	ecx, DWORD PTR [eax+248]
	lea	edx, DWORD PTR [ecx+edx+52]
	mov	DWORD PTR _ano$70371[ebp], edx

; 264  : 		DynTableCell val = {0};

	mov	DWORD PTR _val$70372[ebp], 0
	mov	ecx, 15					; 0000000fH
	xor	eax, eax
	lea	edi, DWORD PTR _val$70372[ebp+4]
	rep stosd

; 265  : 
; 266  : 		/* Barre d'avancement */
; 267  : 		if(i * 60 / cf->nb_mes >= cnt)

	mov	eax, DWORD PTR _i$[ebp]
	imul	eax, 60					; 0000003cH
	mov	ecx, DWORD PTR _cf$[ebp]
	xor	edx, edx
	div	DWORD PTR [ecx+244]
	cmp	eax, DWORD PTR _cnt$[ebp]
	jb	SHORT $L70373

; 269  : 			putc('*', stdout);

	push	OFFSET FLAT:__iob+32
	push	42					; 0000002aH
	call	_putc
	add	esp, 8

; 270  : 			fflush(stdout);

	push	OFFSET FLAT:__iob+32
	call	_fflush
	add	esp, 4

; 271  : 			cnt++;

	mov	edx, DWORD PTR _cnt$[ebp]
	add	edx, 1
	mov	DWORD PTR _cnt$[ebp], edx
$L70373:

; 273  : 
; 274  : 		/* Calcul des échéances sur 3 mois */
; 275  : 		if(strcmp(majorite, datefin) <= 0 &&
; 276  : 			strcmp(majorite, cf->datedebmois) >= 0 && strcmp(majorite, cf->datefinmois) <= 0)

	mov	eax, DWORD PTR _datefin$70369[ebp]
	push	eax
	mov	ecx, DWORD PTR _majorite$70370[ebp]
	push	ecx
	call	_strcmp
	add	esp, 8
	test	eax, eax
	jg	SHORT $L70374
	mov	edx, DWORD PTR _cf$[ebp]
	add	edx, 168				; 000000a8H
	push	edx
	mov	eax, DWORD PTR _majorite$70370[ebp]
	push	eax
	call	_strcmp
	add	esp, 8
	test	eax, eax
	jl	SHORT $L70374
	mov	ecx, DWORD PTR _cf$[ebp]
	add	ecx, 178				; 000000b2H
	push	ecx
	mov	edx, DWORD PTR _majorite$70370[ebp]
	push	edx
	call	_strcmp
	add	esp, 8
	test	eax, eax
	jg	SHORT $L70374

; 278  : 			echeance = cf->val_Majorite0M;

	mov	eax, DWORD PTR _cf$[ebp]
	mov	ecx, DWORD PTR [eax+124]
	mov	DWORD PTR _echeance$70368[ebp], ecx

; 279  : 			cf->nb_echeance++;

	mov	edx, DWORD PTR _cf$[ebp]
	mov	eax, DWORD PTR [edx+140]
	add	eax, 1
	mov	ecx, DWORD PTR _cf$[ebp]
	mov	DWORD PTR [ecx+140], eax

; 281  : 		else if(strcmp(datefin, cf->datedebmois) >= 0 && strcmp(datefin, cf->datefinmois) <= 0)

	jmp	$L70386
$L70374:
	mov	edx, DWORD PTR _cf$[ebp]
	add	edx, 168				; 000000a8H
	push	edx
	mov	eax, DWORD PTR _datefin$70369[ebp]
	push	eax
	call	_strcmp
	add	esp, 8
	test	eax, eax
	jl	SHORT $L70376
	mov	ecx, DWORD PTR _cf$[ebp]
	add	ecx, 178				; 000000b2H
	push	ecx
	mov	edx, DWORD PTR _datefin$70369[ebp]
	push	edx
	call	_strcmp
	add	esp, 8
	test	eax, eax
	jg	SHORT $L70376

; 283  : 			echeance = cf->val_Echeance0M;

	mov	eax, DWORD PTR _cf$[ebp]
	mov	ecx, DWORD PTR [eax+112]
	mov	DWORD PTR _echeance$70368[ebp], ecx

; 284  : 			cf->nb_echeance++;

	mov	edx, DWORD PTR _cf$[ebp]
	mov	eax, DWORD PTR [edx+140]
	add	eax, 1
	mov	ecx, DWORD PTR _cf$[ebp]
	mov	DWORD PTR [ecx+140], eax

; 286  : 		else if(strcmp(majorite, datefin) <= 0 &&

	jmp	$L70386
$L70376:

; 287  : 				strcmp(majorite, cf->datefinmois) > 0 && strcmp(majorite, cf->datemois2) < 0)

	mov	edx, DWORD PTR _datefin$70369[ebp]
	push	edx
	mov	eax, DWORD PTR _majorite$70370[ebp]
	push	eax
	call	_strcmp
	add	esp, 8
	test	eax, eax
	jg	SHORT $L70378
	mov	ecx, DWORD PTR _cf$[ebp]
	add	ecx, 178				; 000000b2H
	push	ecx
	mov	edx, DWORD PTR _majorite$70370[ebp]
	push	edx
	call	_strcmp
	add	esp, 8
	test	eax, eax
	jle	SHORT $L70378
	mov	eax, DWORD PTR _cf$[ebp]
	add	eax, 202				; 000000caH
	push	eax
	mov	ecx, DWORD PTR _majorite$70370[ebp]
	push	ecx
	call	_strcmp
	add	esp, 8
	test	eax, eax
	jge	SHORT $L70378

; 289  : 			echeance = cf->val_Majorite1M;

	mov	edx, DWORD PTR _cf$[ebp]
	mov	eax, DWORD PTR [edx+128]
	mov	DWORD PTR _echeance$70368[ebp], eax

; 290  : 			cf->nb_echeance1M++;

	mov	ecx, DWORD PTR _cf$[ebp]
	mov	edx, DWORD PTR [ecx+144]
	add	edx, 1
	mov	eax, DWORD PTR _cf$[ebp]
	mov	DWORD PTR [eax+144], edx

; 292  : 		else if(strcmp(datefin, cf->datefinmois) > 0 && strcmp(datefin, cf->datemois2) < 0)

	jmp	$L70386
$L70378:
	mov	ecx, DWORD PTR _cf$[ebp]
	add	ecx, 178				; 000000b2H
	push	ecx
	mov	edx, DWORD PTR _datefin$70369[ebp]
	push	edx
	call	_strcmp
	add	esp, 8
	test	eax, eax
	jle	SHORT $L70380
	mov	eax, DWORD PTR _cf$[ebp]
	add	eax, 202				; 000000caH
	push	eax
	mov	ecx, DWORD PTR _datefin$70369[ebp]
	push	ecx
	call	_strcmp
	add	esp, 8
	test	eax, eax
	jge	SHORT $L70380

; 294  : 			echeance = cf->val_Echeance1M;

	mov	edx, DWORD PTR _cf$[ebp]
	mov	eax, DWORD PTR [edx+116]
	mov	DWORD PTR _echeance$70368[ebp], eax

; 295  : 			cf->nb_echeance1M++;

	mov	ecx, DWORD PTR _cf$[ebp]
	mov	edx, DWORD PTR [ecx+144]
	add	edx, 1
	mov	eax, DWORD PTR _cf$[ebp]
	mov	DWORD PTR [eax+144], edx

; 297  : 		else if(strcmp(majorite, datefin) <= 0 &&

	jmp	$L70386
$L70380:

; 298  : 				strcmp(majorite, cf->datemois2) >= 0 && strcmp(majorite, cf->datemois3) < 0)

	mov	ecx, DWORD PTR _datefin$70369[ebp]
	push	ecx
	mov	edx, DWORD PTR _majorite$70370[ebp]
	push	edx
	call	_strcmp
	add	esp, 8
	test	eax, eax
	jg	SHORT $L70382
	mov	eax, DWORD PTR _cf$[ebp]
	add	eax, 202				; 000000caH
	push	eax
	mov	ecx, DWORD PTR _majorite$70370[ebp]
	push	ecx
	call	_strcmp
	add	esp, 8
	test	eax, eax
	jl	SHORT $L70382
	mov	edx, DWORD PTR _cf$[ebp]
	add	edx, 212				; 000000d4H
	push	edx
	mov	eax, DWORD PTR _majorite$70370[ebp]
	push	eax
	call	_strcmp
	add	esp, 8
	test	eax, eax
	jge	SHORT $L70382

; 300  : 			echeance = cf->val_Majorite2M;

	mov	ecx, DWORD PTR _cf$[ebp]
	mov	edx, DWORD PTR [ecx+132]
	mov	DWORD PTR _echeance$70368[ebp], edx

; 301  : 			cf->nb_echeance2M++;

	mov	eax, DWORD PTR _cf$[ebp]
	mov	ecx, DWORD PTR [eax+148]
	add	ecx, 1
	mov	edx, DWORD PTR _cf$[ebp]
	mov	DWORD PTR [edx+148], ecx

; 303  : 		else if(strcmp(datefin, cf->datemois2) >= 0 && strcmp(datefin, cf->datemois3) < 0)

	jmp	$L70386
$L70382:
	mov	eax, DWORD PTR _cf$[ebp]
	add	eax, 202				; 000000caH
	push	eax
	mov	ecx, DWORD PTR _datefin$70369[ebp]
	push	ecx
	call	_strcmp
	add	esp, 8
	test	eax, eax
	jl	SHORT $L70384
	mov	edx, DWORD PTR _cf$[ebp]
	add	edx, 212				; 000000d4H
	push	edx
	mov	eax, DWORD PTR _datefin$70369[ebp]
	push	eax
	call	_strcmp
	add	esp, 8
	test	eax, eax
	jge	SHORT $L70384

; 305  : 			echeance = cf->val_Echeance2M;

	mov	ecx, DWORD PTR _cf$[ebp]
	mov	edx, DWORD PTR [ecx+120]
	mov	DWORD PTR _echeance$70368[ebp], edx

; 306  : 			cf->nb_echeance2M++;

	mov	eax, DWORD PTR _cf$[ebp]
	mov	ecx, DWORD PTR [eax+148]
	add	ecx, 1
	mov	edx, DWORD PTR _cf$[ebp]
	mov	DWORD PTR [edx+148], ecx

; 308  : 		else if(!cf->mes[i].ts)

	jmp	SHORT $L70386
$L70384:
	mov	eax, DWORD PTR _i$[ebp]
	imul	eax, 168				; 000000a8H
	mov	ecx, DWORD PTR _cf$[ebp]
	mov	edx, DWORD PTR [ecx+248]
	cmp	DWORD PTR [edx+eax+164], 0
	jne	SHORT $L70386

; 310  : 			echeance = cf->val_AttenteAffectationTS;

	mov	eax, DWORD PTR _cf$[ebp]
	mov	ecx, DWORD PTR [eax+136]
	mov	DWORD PTR _echeance$70368[ebp], ecx

; 311  : 			cf->nb_attenteTS++;

	mov	edx, DWORD PTR _cf$[ebp]
	mov	eax, DWORD PTR [edx+152]
	add	eax, 1
	mov	ecx, DWORD PTR _cf$[ebp]
	mov	DWORD PTR [ecx+152], eax
$L70386:

; 313  : 
; 314  : 		QRY_UPDATE_IDVAL(cf->mes[i].id, ECHEANCIER, echeance);

	mov	edx, DWORD PTR _i$[ebp]
	imul	edx, 168				; 000000a8H
	mov	eax, DWORD PTR _cf$[ebp]
	mov	ecx, DWORD PTR [eax+248]
	mov	edx, DWORD PTR [ecx+edx]
	mov	DWORD PTR _val$70372[ebp+20], edx
	mov	eax, DWORD PTR _cf$[ebp]
	mov	ecx, DWORD PTR [eax+108]
	mov	DWORD PTR _val$70372[ebp+28], ecx
	mov	edx, DWORD PTR _echeance$70368[ebp]
	mov	DWORD PTR _val$70372[ebp+32], edx
	mov	DWORD PTR _val$70372[ebp], 0
	mov	DWORD PTR _val$70372[ebp+4], 0
	mov	BYTE PTR _val$70372[ebp+12], 0
	push	0
	push	3
	lea	eax, DWORD PTR _val$70372[ebp]
	push	eax
	mov	ecx, DWORD PTR _cntxt$[ebp]
	push	ecx
	call	_qry_add_val
	add	esp, 16					; 00000010H
	test	eax, eax
	je	SHORT $L70388
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 314		; 0000013aH
	jmp	$eva_err$70389
$L70388:

; 315  : 		if(qry_update_idobj_idfield(cntxt, cf->mes[i].id, cf->val_ETAT_ECHEANCIER, ano, 3)) STACK_ERROR;

	push	3
	mov	eax, DWORD PTR _ano$70371[ebp]
	push	eax
	mov	ecx, DWORD PTR _cf$[ebp]
	mov	edx, DWORD PTR [ecx+104]
	push	edx
	mov	eax, DWORD PTR _i$[ebp]
	imul	eax, 168				; 000000a8H
	mov	ecx, DWORD PTR _cf$[ebp]
	mov	edx, DWORD PTR [ecx+248]
	mov	eax, DWORD PTR [edx+eax]
	push	eax
	mov	ecx, DWORD PTR _cntxt$[ebp]
	push	ecx
	call	_qry_update_idobj_idfield
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L70390
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 315		; 0000013bH
	jmp	SHORT $eva_err$70389
$L70390:

; 316  : 	}

	jmp	$L70366
$L70367:

; 317  : 
; 318  : 	/* Affiche le bouton de retour à la page precedente */
; 319  : 	printf("*</pre></font></b><hr>");

	push	OFFSET FLAT:$SG70391
	call	_printf
	add	esp, 4

; 320  : 	printf("%lu échéances ce mois<br>"
; 321  : 			"%lu échéances le mois prochain<br>"
; 322  : 			"%lu échéances à deux mois<br>"
; 323  : 			"%lu mesures en attente d'affectation TS<br><br>",
; 324  : 			cf->nb_echeance, cf->nb_echeance1M, cf->nb_echeance2M, cf->nb_attenteTS);

	mov	eax, DWORD PTR _cf$[ebp]
	mov	ecx, DWORD PTR [eax+152]
	push	ecx
	mov	edx, DWORD PTR _cf$[ebp]
	mov	eax, DWORD PTR [edx+148]
	push	eax
	mov	ecx, DWORD PTR _cf$[ebp]
	mov	edx, DWORD PTR [ecx+144]
	push	edx
	mov	eax, DWORD PTR _cf$[ebp]
	mov	ecx, DWORD PTR [eax+140]
	push	ecx
	push	OFFSET FLAT:$SG70392
	call	_printf
	add	esp, 20					; 00000014H

; 325  : 	printf("<hr><br><center><input type=image name='B$#NOP' src='../img/_eva_btn_gobackobj_fr.gif'></center><br>\n");

	push	OFFSET FLAT:$SG70393
	call	_printf
	add	esp, 4

; 326  : 	cntxt->b_terminate = 15;

	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29776], 15		; 0000000fH
$eva_noerr$70394:

; 327  : 
; 328  : 	RETURN_OK_CLEANUP;

	push	0
	push	OFFSET FLAT:$SG70395
	push	OFFSET FLAT:$SG70396
	mov	eax, DWORD PTR _cntxt$[ebp]
	push	eax
	call	_err_clear
	add	esp, 16					; 00000010H
$eva_err$70389:
	mov	ecx, DWORD PTR _cntxt$[ebp]
	cmp	DWORD PTR [ecx+29872], 0
	je	SHORT $L70397
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	eax, DWORD PTR [edx+29900]
	push	eax
	push	OFFSET FLAT:$SG70398
	push	OFFSET FLAT:$SG70399
	mov	ecx, DWORD PTR _cntxt$[ebp]
	push	ecx
	call	_err_add_context
	add	esp, 16					; 00000010H
$L70397:
	mov	edx, DWORD PTR _cntxt$[ebp]
	xor	eax, eax
	cmp	DWORD PTR [edx+29872], 0
	setne	al

; 329  : }

	pop	edi
	mov	esp, ebp
	pop	ebp
	ret	0
_Calc_echeancier ENDP
_TEXT	ENDS
PUBLIC	_qsort_nom
EXTRN	_stricmp:NEAR
_BSS	SEGMENT
$SG70414 DB	01H DUP (?)
	ALIGN	4

$SG70417 DB	01H DUP (?)
	ALIGN	4

$SG70423 DB	01H DUP (?)
	ALIGN	4

$SG70426 DB	01H DUP (?)
_BSS	ENDS
_TEXT	SEGMENT
_el1$ = 8
_el2$ = 12
_t1$ = -8
_t2$ = -12
_res$ = -4
_qsort_nom PROC NEAR

; 338  : {

	push	ebp
	mov	ebp, esp
	sub	esp, 12					; 0000000cH

; 339  : 	char *t1 = ((DynTableCell *)el1+15)->txt;

	mov	eax, DWORD PTR _el1$[ebp]
	mov	ecx, DWORD PTR [eax+960]
	mov	DWORD PTR _t1$[ebp], ecx

; 340  : 	char *t2 = ((DynTableCell *)el2+15)->txt;

	mov	edx, DWORD PTR _el2$[ebp]
	mov	eax, DWORD PTR [edx+960]
	mov	DWORD PTR _t2$[ebp], eax

; 341  : 	int res;
; 342  : 
; 343  : 	if(!t1 || !*t1) t1 = "";

	cmp	DWORD PTR _t1$[ebp], 0
	je	SHORT $L70413
	mov	ecx, DWORD PTR _t1$[ebp]
	movsx	edx, BYTE PTR [ecx]
	test	edx, edx
	jne	SHORT $L70412
$L70413:
	mov	DWORD PTR _t1$[ebp], OFFSET FLAT:$SG70414
$L70412:

; 344  : 	if(!t2 || !*t2) t2 = "";

	cmp	DWORD PTR _t2$[ebp], 0
	je	SHORT $L70416
	mov	eax, DWORD PTR _t2$[ebp]
	movsx	ecx, BYTE PTR [eax]
	test	ecx, ecx
	jne	SHORT $L70415
$L70416:
	mov	DWORD PTR _t2$[ebp], OFFSET FLAT:$SG70417
$L70415:

; 345  : 
; 346  : 	res = STRCMPCASE(t1, t2);

	mov	edx, DWORD PTR _t2$[ebp]
	push	edx
	mov	eax, DWORD PTR _t1$[ebp]
	push	eax
	call	_stricmp
	add	esp, 8
	mov	DWORD PTR _res$[ebp], eax

; 347  : 	if(res) return res;

	cmp	DWORD PTR _res$[ebp], 0
	je	SHORT $L70418
	mov	eax, DWORD PTR _res$[ebp]
	jmp	SHORT $L70406
$L70418:

; 348  : 
; 349  : 	t1 = ((DynTableCell *)el1+16)->txt;

	mov	ecx, DWORD PTR _el1$[ebp]
	mov	edx, DWORD PTR [ecx+1024]
	mov	DWORD PTR _t1$[ebp], edx

; 350  : 	t2 = ((DynTableCell *)el2+16)->txt;

	mov	eax, DWORD PTR _el2$[ebp]
	mov	ecx, DWORD PTR [eax+1024]
	mov	DWORD PTR _t2$[ebp], ecx

; 351  : 	if(!t1 || !*t1) t1 = "";

	cmp	DWORD PTR _t1$[ebp], 0
	je	SHORT $L70422
	mov	edx, DWORD PTR _t1$[ebp]
	movsx	eax, BYTE PTR [edx]
	test	eax, eax
	jne	SHORT $L70421
$L70422:
	mov	DWORD PTR _t1$[ebp], OFFSET FLAT:$SG70423
$L70421:

; 352  : 	if(!t2 || !*t2) t2 = "";

	cmp	DWORD PTR _t2$[ebp], 0
	je	SHORT $L70425
	mov	ecx, DWORD PTR _t2$[ebp]
	movsx	edx, BYTE PTR [ecx]
	test	edx, edx
	jne	SHORT $L70424
$L70425:
	mov	DWORD PTR _t2$[ebp], OFFSET FLAT:$SG70426
$L70424:

; 353  : 
; 354  : 	return STRCMPCASE(t1, t2);

	mov	eax, DWORD PTR _t2$[ebp]
	push	eax
	mov	ecx, DWORD PTR _t1$[ebp]
	push	ecx
	call	_stricmp
	add	esp, 8
$L70406:

; 355  : }

	mov	esp, ebp
	pop	ebp
	ret	0
_qsort_nom ENDP
_TEXT	ENDS
PUBLIC	_Init_AEMO
EXTRN	_datetxt_invalid:NEAR
EXTRN	_qry_add_table_col:NEAR
EXTRN	_strtoul:NEAR
EXTRN	_qry_update_idobj_idfield_1:NEAR
EXTRN	_dyntab_sz:NEAR
EXTRN	_strlen:NEAR
EXTRN	_dyntab_set_txt:NEAR
EXTRN	_strncmp:NEAR
EXTRN	_dyntab_field_val:NEAR
EXTRN	_dyntab_sort:NEAR
_DATA	SEGMENT
$SG70440 DB	'Facturation AEMO', 00H
	ORG $+3
$SG70441 DB	'Ech', 0e9H, 'ancier AEMO', 00H
$SG70442 DB	'FIN_AEMO', 00H
	ORG $+3
$SG70443 DB	'AEMO_LIGNE_FACT', 00H
$SG70444 DB	'JOURS_FACT', 00H
	ORG $+1
$SG70445 DB	'JOURS_CORRECTION', 00H
	ORG $+3
$SG70446 DB	'MOTIF_CORRECTION', 00H
	ORG $+3
$SG70447 DB	'REF_AEMO', 00H
	ORG $+3
$SG70448 DB	'ORD_JUGTS_EFFET_DU', 00H
	ORG $+1
$SG70449 DB	'ECHEANCE_JUGT', 00H
	ORG $+2
$SG70450 DB	'ORD_JUGTS_DATE', 00H
	ORG $+1
$SG70453 DB	'Lecture des donnees complementaires ...', 00H
$SG70455 DB	'ENFANT->DATE_NAISS', 00H
	ORG $+1
$SG70457 DB	'MIN(<-REF_AEMO->ORD_JUGTS_EFFET_DU)', 00H
$SG70459 DB	'MAX(<-REF_AEMO->ORD_JUGTS_DATE)', 00H
$SG70461 DB	'AEMO_JEUNE_MAJEUR', 00H
	ORG $+2
$SG70463 DB	'ETAT_FACTURATION', 00H
	ORG $+3
$SG70465 DB	'FACT_MODE', 00H
	ORG $+2
$SG70467 DB	'DATE_PRISE_EN_CHARGE', 00H
	ORG $+3
$SG70469 DB	'DATE_FACT_DEBUT', 00H
$SG70471 DB	'DATE_FACT_FIN', 00H
	ORG $+2
$SG70473 DB	'CAISSE_FACTURE', 00H
	ORG $+1
$SG70475 DB	'FORCER_ETAT', 00H
$SG70477 DB	'DATE_ECHEANCE', 00H
	ORG $+2
$SG70479 DB	'DATE_AFFECT_TS', 00H
	ORG $+1
$SG70481 DB	'EDUCATEUR', 00H
	ORG $+2
$SG70483 DB	'ENFANT->NOM', 00H
$SG70485 DB	'ENFANT->PRENOM', 00H
	ORG $+1
$SG70486 DB	'0%   10%   20%   30%   40%   50%   60%   70%   80%   90%'
	DB	'   100%', 0aH, '|-----|-----|-----|-----|-----|-----|-----|--'
	DB	'---|-----|-----|', 0aH, 00H
	ORG $+1
$SG70487 DB	'<hr><font face=Courier><b><pre>Examen de %lu mesures', 0aH
	DB	'%s', 00H
$SG70502 DB	'Date de naissance incorrecte', 00H
	ORG $+3
$SG70504 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70509 DB	'SELECT DISTINCT TLink0.IdObj FROM TLink AS TLink0', 0aH, 'I'
	DB	'NNER JOIN TLink AS TLink1 ON TLink0.IdObj=TLink1.IdObj', 0aH, 'W'
	DB	'HERE TLink0.DateDel IS NULL AND TLink0.IdField=%lu AND TLink0'
	DB	'.IdRelObj=%lu', 0aH, 'AND TLink1.DateDel IS NULL AND TLink1.I'
	DB	'dField=%lu AND TLink1.IdValue=%lu', 0aH, 'ORDER BY TLink0.IdO'
	DB	'bj DESC', 00H
	ORG $+2
$SG70514 DB	'ECHEANCE_JUGT,ORD_JUGTS_EFFET_DU,ORD_JUGTS_TYPE', 00H
$SG70515 DB	'ECHEANCE_JUGT', 00H
	ORG $+2
$SG70517 DB	'ORD_JUGTS_EFFET_DU', 00H
	ORG $+1
$SG70519 DB	'Main lev', 0e9H, 'e', 00H
	ORG $+1
$SG70520 DB	'ORD_JUGTS_TYPE', 00H
	ORG $+1
$SG70524 DB	'Jeune majeur', 00H
	ORG $+3
$SG70526 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70530 DB	'Arr', 0eaH, 't ', 0e0H, ' 21 ans', 00H
	ORG $+1
$SG70532 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70536 DB	'Arr', 0eaH, 't ', 0e0H, ' 18 ans', 00H
	ORG $+1
$SG70538 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70540 DB	'DateManuelle', 00H
	ORG $+3
$SG70545 DB	'Debut de mesure inconnu', 00H
$SG70547 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70550 DB	'Fin de mesure inconnue', 00H
	ORG $+1
$SG70552 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70554 DB	'*', 0aH, 00H
	ORG $+1
$SG70556 DB	'D:\Travail\ABI\EVA\V4.0\CGI\Brunix-2016\dll_adsea01.c', 00H
	ORG $+2
$SG70557 DB	'Init_AEMO', 00H
	ORG $+2
$SG70559 DB	'D:\Travail\ABI\EVA\V4.0\CGI\Brunix-2016\dll_adsea01.c', 00H
	ORG $+2
$SG70560 DB	'Init_AEMO', 00H
_DATA	ENDS
_TEXT	SEGMENT
_cntxt$ = 8
_cf$ = 12
_data$ = -2068
_i$ = -2108
_cnt$ = -2104
_qry$ = -2048
_txt$ = -2100
_datedeb$70491 = -2120
_datefin$70492 = -2112
_datenaiss$70493 = -2132
_d_echeance$70494 = -2128
_majorite$70495 = -2124
_ano$70496 = -2136
_idval$70497 = -2116
_effetdu$70516 = -2140
_datejug$70518 = -2144
_Init_AEMO PROC NEAR

; 366  : ){

	push	ebp
	mov	ebp, esp
	sub	esp, 2152				; 00000868H
	push	edi

; 367  : 	DynTable data = { 0 };

	mov	DWORD PTR _data$[ebp], 0
	xor	eax, eax
	mov	DWORD PTR _data$[ebp+4], eax
	mov	DWORD PTR _data$[ebp+8], eax
	mov	DWORD PTR _data$[ebp+12], eax
	mov	DWORD PTR _data$[ebp+16], eax

; 368  : 	unsigned long i, cnt = 0;

	mov	DWORD PTR _cnt$[ebp], 0

; 369  : 	char qry[2048] = {0};

	mov	BYTE PTR _qry$[ebp], 0
	mov	ecx, 511				; 000001ffH
	xor	eax, eax
	lea	edi, DWORD PTR _qry$[ebp+1]
	rep stosd
	stosw
	stosb

; 370  : 	char txt[32];
; 371  : 
; 372  : 	/* Définition des constantes spécifiques */
; 373  : 	cf->label = cf->idfacture ? "Facturation AEMO" : "Echéancier AEMO";

	mov	ecx, DWORD PTR _cf$[ebp]
	cmp	DWORD PTR [ecx+4], 0
	je	SHORT $L71248
	mov	DWORD PTR -2148+[ebp], OFFSET FLAT:$SG70440
	jmp	SHORT $L71249
$L71248:
	mov	DWORD PTR -2148+[ebp], OFFSET FLAT:$SG70441
$L71249:
	mov	edx, DWORD PTR _cf$[ebp]
	mov	eax, DWORD PTR -2148+[ebp]
	mov	DWORD PTR [edx], eax

; 374  : 	cf->form_Mesure = 26925;

	mov	ecx, DWORD PTR _cf$[ebp]
	mov	DWORD PTR [ecx+8], 26925		; 0000692dH

; 375  : 	cf->form_LigneFacture = 59650;

	mov	edx, DWORD PTR _cf$[ebp]
	mov	DWORD PTR [edx+12], 59650		; 0000e902H

; 376  : 	cf->val_ANNEE_FIN = get_id_value(cntxt, add_sz_str("FIN_AEMO"));

	push	8
	push	OFFSET FLAT:$SG70442
	mov	eax, DWORD PTR _cntxt$[ebp]
	push	eax
	call	_get_id_value
	add	esp, 12					; 0000000cH
	mov	ecx, DWORD PTR _cf$[ebp]
	mov	DWORD PTR [ecx+24], eax

; 377  : 	cf->val_MES_LIGNE_FACT = get_id_value(cntxt, add_sz_str("AEMO_LIGNE_FACT"));

	push	15					; 0000000fH
	push	OFFSET FLAT:$SG70443
	mov	edx, DWORD PTR _cntxt$[ebp]
	push	edx
	call	_get_id_value
	add	esp, 12					; 0000000cH
	mov	ecx, DWORD PTR _cf$[ebp]
	mov	DWORD PTR [ecx+32], eax

; 378  : 	cf->val_QTE_FACTURE = get_id_value(cntxt, add_sz_str("JOURS_FACT"));

	push	10					; 0000000aH
	push	OFFSET FLAT:$SG70444
	mov	edx, DWORD PTR _cntxt$[ebp]
	push	edx
	call	_get_id_value
	add	esp, 12					; 0000000cH
	mov	ecx, DWORD PTR _cf$[ebp]
	mov	DWORD PTR [ecx+40], eax

; 379  : 	cf->val_QTE_CORRECTION = get_id_value(cntxt, add_sz_str("JOURS_CORRECTION"));

	push	16					; 00000010H
	push	OFFSET FLAT:$SG70445
	mov	edx, DWORD PTR _cntxt$[ebp]
	push	edx
	call	_get_id_value
	add	esp, 12					; 0000000cH
	mov	ecx, DWORD PTR _cf$[ebp]
	mov	DWORD PTR [ecx+44], eax

; 380  : 	cf->val_MOTIF_CORRECTION = get_id_value(cntxt, add_sz_str("MOTIF_CORRECTION"));

	push	16					; 00000010H
	push	OFFSET FLAT:$SG70446
	mov	edx, DWORD PTR _cntxt$[ebp]
	push	edx
	call	_get_id_value
	add	esp, 12					; 0000000cH
	mov	ecx, DWORD PTR _cf$[ebp]
	mov	DWORD PTR [ecx+48], eax

; 381  : 	cf->val_MESURE_JUGT = get_id_value(cntxt, add_sz_str("REF_AEMO"));

	push	8
	push	OFFSET FLAT:$SG70447
	mov	edx, DWORD PTR _cntxt$[ebp]
	push	edx
	call	_get_id_value
	add	esp, 12					; 0000000cH
	mov	ecx, DWORD PTR _cf$[ebp]
	mov	DWORD PTR [ecx+52], eax

; 382  : 	cf->val_EFFET_JUGT = get_id_value(cntxt, add_sz_str("ORD_JUGTS_EFFET_DU"));

	push	18					; 00000012H
	push	OFFSET FLAT:$SG70448
	mov	edx, DWORD PTR _cntxt$[ebp]
	push	edx
	call	_get_id_value
	add	esp, 12					; 0000000cH
	mov	ecx, DWORD PTR _cf$[ebp]
	mov	DWORD PTR [ecx+56], eax

; 383  : 	cf->val_ECHEANCE_JUGT = get_id_value(cntxt, add_sz_str("ECHEANCE_JUGT"));

	push	13					; 0000000dH
	push	OFFSET FLAT:$SG70449
	mov	edx, DWORD PTR _cntxt$[ebp]
	push	edx
	call	_get_id_value
	add	esp, 12					; 0000000cH
	mov	ecx, DWORD PTR _cf$[ebp]
	mov	DWORD PTR [ecx+60], eax

; 384  : 	cf->val_DATE_JUGT = get_id_value(cntxt, add_sz_str("ORD_JUGTS_DATE"));

	push	14					; 0000000eH
	push	OFFSET FLAT:$SG70450
	mov	edx, DWORD PTR _cntxt$[ebp]
	push	edx
	call	_get_id_value
	add	esp, 12					; 0000000cH
	mov	ecx, DWORD PTR _cf$[ebp]
	mov	DWORD PTR [ecx+64], eax

; 385  : 
; 386  : 	/* Creation de la liste des mesures a traiter */
; 387  : 	if(Init_liste_mes(cntxt, cf)) STACK_ERROR;

	mov	edx, DWORD PTR _cf$[ebp]
	push	edx
	mov	eax, DWORD PTR _cntxt$[ebp]
	push	eax
	call	_Init_liste_mes
	add	esp, 8
	test	eax, eax
	je	SHORT $L70451
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 387		; 00000183H
	jmp	$eva_err$70452
$L70451:

; 388  : 
; 389  : 	/* Lecture des donnees complementaires */
; 390  : 	printf("Lecture des donnees complementaires ...");

	push	OFFSET FLAT:$SG70453
	call	_printf
	add	esp, 4

; 391  : 	fflush(stdout);

	push	OFFSET FLAT:__iob+32
	call	_fflush
	add	esp, 4

; 392  : 	if(qry_add_table_col(cntxt, &cf->tmes, add_sz_str("ENFANT->DATE_NAISS"))) STACK_ERROR;

	push	18					; 00000012H
	push	OFFSET FLAT:$SG70455
	mov	edx, DWORD PTR _cf$[ebp]
	add	edx, 224				; 000000e0H
	push	edx
	mov	eax, DWORD PTR _cntxt$[ebp]
	push	eax
	call	_qry_add_table_col
	add	esp, 16					; 00000010H
	test	eax, eax
	je	SHORT $L70454
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 392		; 00000188H
	jmp	$eva_err$70452
$L70454:

; 393  : 	if(qry_add_table_col(cntxt, &cf->tmes, add_sz_str("MIN(<-REF_AEMO->ORD_JUGTS_EFFET_DU)"))) STACK_ERROR;

	push	35					; 00000023H
	push	OFFSET FLAT:$SG70457
	mov	edx, DWORD PTR _cf$[ebp]
	add	edx, 224				; 000000e0H
	push	edx
	mov	eax, DWORD PTR _cntxt$[ebp]
	push	eax
	call	_qry_add_table_col
	add	esp, 16					; 00000010H
	test	eax, eax
	je	SHORT $L70456
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 393		; 00000189H
	jmp	$eva_err$70452
$L70456:

; 394  : 	if(qry_add_table_col(cntxt, &cf->tmes, add_sz_str("MAX(<-REF_AEMO->ORD_JUGTS_DATE)"))) STACK_ERROR;

	push	31					; 0000001fH
	push	OFFSET FLAT:$SG70459
	mov	edx, DWORD PTR _cf$[ebp]
	add	edx, 224				; 000000e0H
	push	edx
	mov	eax, DWORD PTR _cntxt$[ebp]
	push	eax
	call	_qry_add_table_col
	add	esp, 16					; 00000010H
	test	eax, eax
	je	SHORT $L70458
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 394		; 0000018aH
	jmp	$eva_err$70452
$L70458:

; 395  : 	if(qry_add_table_col(cntxt, &cf->tmes, add_sz_str("AEMO_JEUNE_MAJEUR"))) STACK_ERROR;

	push	17					; 00000011H
	push	OFFSET FLAT:$SG70461
	mov	edx, DWORD PTR _cf$[ebp]
	add	edx, 224				; 000000e0H
	push	edx
	mov	eax, DWORD PTR _cntxt$[ebp]
	push	eax
	call	_qry_add_table_col
	add	esp, 16					; 00000010H
	test	eax, eax
	je	SHORT $L70460
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 395		; 0000018bH
	jmp	$eva_err$70452
$L70460:

; 396  : 	if(qry_add_table_col(cntxt, &cf->tmes, add_sz_str("ETAT_FACTURATION"))) STACK_ERROR;

	push	16					; 00000010H
	push	OFFSET FLAT:$SG70463
	mov	edx, DWORD PTR _cf$[ebp]
	add	edx, 224				; 000000e0H
	push	edx
	mov	eax, DWORD PTR _cntxt$[ebp]
	push	eax
	call	_qry_add_table_col
	add	esp, 16					; 00000010H
	test	eax, eax
	je	SHORT $L70462
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 396		; 0000018cH
	jmp	$eva_err$70452
$L70462:

; 397  : 	if(qry_add_table_col(cntxt, &cf->tmes, add_sz_str("FACT_MODE"))) STACK_ERROR;

	push	9
	push	OFFSET FLAT:$SG70465
	mov	edx, DWORD PTR _cf$[ebp]
	add	edx, 224				; 000000e0H
	push	edx
	mov	eax, DWORD PTR _cntxt$[ebp]
	push	eax
	call	_qry_add_table_col
	add	esp, 16					; 00000010H
	test	eax, eax
	je	SHORT $L70464
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 397		; 0000018dH
	jmp	$eva_err$70452
$L70464:

; 398  : 	if(qry_add_table_col(cntxt, &cf->tmes, add_sz_str("DATE_PRISE_EN_CHARGE"))) STACK_ERROR;

	push	20					; 00000014H
	push	OFFSET FLAT:$SG70467
	mov	edx, DWORD PTR _cf$[ebp]
	add	edx, 224				; 000000e0H
	push	edx
	mov	eax, DWORD PTR _cntxt$[ebp]
	push	eax
	call	_qry_add_table_col
	add	esp, 16					; 00000010H
	test	eax, eax
	je	SHORT $L70466
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 398		; 0000018eH
	jmp	$eva_err$70452
$L70466:

; 399  : 	if(qry_add_table_col(cntxt, &cf->tmes, add_sz_str("DATE_FACT_DEBUT"))) STACK_ERROR;

	push	15					; 0000000fH
	push	OFFSET FLAT:$SG70469
	mov	edx, DWORD PTR _cf$[ebp]
	add	edx, 224				; 000000e0H
	push	edx
	mov	eax, DWORD PTR _cntxt$[ebp]
	push	eax
	call	_qry_add_table_col
	add	esp, 16					; 00000010H
	test	eax, eax
	je	SHORT $L70468
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 399		; 0000018fH
	jmp	$eva_err$70452
$L70468:

; 400  : 	if(qry_add_table_col(cntxt, &cf->tmes, add_sz_str("DATE_FACT_FIN"))) STACK_ERROR;

	push	13					; 0000000dH
	push	OFFSET FLAT:$SG70471
	mov	edx, DWORD PTR _cf$[ebp]
	add	edx, 224				; 000000e0H
	push	edx
	mov	eax, DWORD PTR _cntxt$[ebp]
	push	eax
	call	_qry_add_table_col
	add	esp, 16					; 00000010H
	test	eax, eax
	je	SHORT $L70470
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 400		; 00000190H
	jmp	$eva_err$70452
$L70470:

; 401  : 	if(qry_add_table_col(cntxt, &cf->tmes, add_sz_str("CAISSE_FACTURE"))) STACK_ERROR;

	push	14					; 0000000eH
	push	OFFSET FLAT:$SG70473
	mov	edx, DWORD PTR _cf$[ebp]
	add	edx, 224				; 000000e0H
	push	edx
	mov	eax, DWORD PTR _cntxt$[ebp]
	push	eax
	call	_qry_add_table_col
	add	esp, 16					; 00000010H
	test	eax, eax
	je	SHORT $L70472
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 401		; 00000191H
	jmp	$eva_err$70452
$L70472:

; 402  : 	if(qry_add_table_col(cntxt, &cf->tmes, add_sz_str("FORCER_ETAT"))) STACK_ERROR;

	push	11					; 0000000bH
	push	OFFSET FLAT:$SG70475
	mov	edx, DWORD PTR _cf$[ebp]
	add	edx, 224				; 000000e0H
	push	edx
	mov	eax, DWORD PTR _cntxt$[ebp]
	push	eax
	call	_qry_add_table_col
	add	esp, 16					; 00000010H
	test	eax, eax
	je	SHORT $L70474
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 402		; 00000192H
	jmp	$eva_err$70452
$L70474:

; 403  : 	if(qry_add_table_col(cntxt, &cf->tmes, add_sz_str("DATE_ECHEANCE"))) STACK_ERROR;

	push	13					; 0000000dH
	push	OFFSET FLAT:$SG70477
	mov	edx, DWORD PTR _cf$[ebp]
	add	edx, 224				; 000000e0H
	push	edx
	mov	eax, DWORD PTR _cntxt$[ebp]
	push	eax
	call	_qry_add_table_col
	add	esp, 16					; 00000010H
	test	eax, eax
	je	SHORT $L70476
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 403		; 00000193H
	jmp	$eva_err$70452
$L70476:

; 404  : 	if(qry_add_table_col(cntxt, &cf->tmes, add_sz_str("DATE_AFFECT_TS"))) STACK_ERROR;

	push	14					; 0000000eH
	push	OFFSET FLAT:$SG70479
	mov	edx, DWORD PTR _cf$[ebp]
	add	edx, 224				; 000000e0H
	push	edx
	mov	eax, DWORD PTR _cntxt$[ebp]
	push	eax
	call	_qry_add_table_col
	add	esp, 16					; 00000010H
	test	eax, eax
	je	SHORT $L70478
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 404		; 00000194H
	jmp	$eva_err$70452
$L70478:

; 405  : 	if(qry_add_table_col(cntxt, &cf->tmes, add_sz_str("EDUCATEUR"))) STACK_ERROR;

	push	9
	push	OFFSET FLAT:$SG70481
	mov	edx, DWORD PTR _cf$[ebp]
	add	edx, 224				; 000000e0H
	push	edx
	mov	eax, DWORD PTR _cntxt$[ebp]
	push	eax
	call	_qry_add_table_col
	add	esp, 16					; 00000010H
	test	eax, eax
	je	SHORT $L70480
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 405		; 00000195H
	jmp	$eva_err$70452
$L70480:

; 406  : 	if(qry_add_table_col(cntxt, &cf->tmes, add_sz_str("ENFANT->NOM"))) STACK_ERROR;

	push	11					; 0000000bH
	push	OFFSET FLAT:$SG70483
	mov	edx, DWORD PTR _cf$[ebp]
	add	edx, 224				; 000000e0H
	push	edx
	mov	eax, DWORD PTR _cntxt$[ebp]
	push	eax
	call	_qry_add_table_col
	add	esp, 16					; 00000010H
	test	eax, eax
	je	SHORT $L70482
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 406		; 00000196H
	jmp	$eva_err$70452
$L70482:

; 407  : 	if(qry_add_table_col(cntxt, &cf->tmes, add_sz_str("ENFANT->PRENOM"))) STACK_ERROR;

	push	14					; 0000000eH
	push	OFFSET FLAT:$SG70485
	mov	edx, DWORD PTR _cf$[ebp]
	add	edx, 224				; 000000e0H
	push	edx
	mov	eax, DWORD PTR _cntxt$[ebp]
	push	eax
	call	_qry_add_table_col
	add	esp, 16					; 00000010H
	test	eax, eax
	je	SHORT $L70484
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 407		; 00000197H
	jmp	$eva_err$70452
$L70484:

; 408  : 
; 409  : 	/* Affichage de la barre d'avancement */
; 410  : 	printf("<hr><font face=Courier><b><pre>Examen de %lu mesures\n%s", cf->nb_mes, WAIT_TXTSCALE);

	push	OFFSET FLAT:$SG70486
	mov	edx, DWORD PTR _cf$[ebp]
	mov	eax, DWORD PTR [edx+244]
	push	eax
	push	OFFSET FLAT:$SG70487
	call	_printf
	add	esp, 12					; 0000000cH

; 411  : 	fflush(stdout);

	push	OFFSET FLAT:__iob+32
	call	_fflush
	add	esp, 4

; 412  : 
; 413  : 	/* Tri des mesures sur nom/prénom */
; 414  : 	dyntab_sort(&cf->tmes, qsort_nom);

	push	OFFSET FLAT:_qsort_nom
	mov	ecx, DWORD PTR _cf$[ebp]
	add	ecx, 224				; 000000e0H
	push	ecx
	call	_dyntab_sort
	add	esp, 8

; 415  : 
; 416  : 	/* Pour chaque mesure a examiner */
; 417  : 	for(i = 0; i < cf->nb_mes; i++)

	mov	DWORD PTR _i$[ebp], 0
	jmp	SHORT $L70488
$L70489:
	mov	edx, DWORD PTR _i$[ebp]
	add	edx, 1
	mov	DWORD PTR _i$[ebp], edx
$L70488:
	mov	eax, DWORD PTR _cf$[ebp]
	mov	ecx, DWORD PTR _i$[ebp]
	cmp	ecx, DWORD PTR [eax+244]
	jae	$L70490

; 419  : 		char *datedeb = cf->mes[i].deb;

	mov	edx, DWORD PTR _i$[ebp]
	imul	edx, 168				; 000000a8H
	mov	eax, DWORD PTR _cf$[ebp]
	mov	ecx, DWORD PTR [eax+248]
	lea	edx, DWORD PTR [ecx+edx+4]
	mov	DWORD PTR _datedeb$70491[ebp], edx

; 420  : 		char *datefin = cf->mes[i].fin;

	mov	eax, DWORD PTR _i$[ebp]
	imul	eax, 168				; 000000a8H
	mov	ecx, DWORD PTR _cf$[ebp]
	mov	edx, DWORD PTR [ecx+248]
	lea	eax, DWORD PTR [edx+eax+14]
	mov	DWORD PTR _datefin$70492[ebp], eax

; 421  : 		char *datenaiss = dyntab_val(&cf->tmes, i, 1);

	push	1
	mov	ecx, DWORD PTR _i$[ebp]
	push	ecx
	mov	edx, DWORD PTR _cf$[ebp]
	add	edx, 224				; 000000e0H
	push	edx
	call	_dyntab_val
	add	esp, 12					; 0000000cH
	mov	DWORD PTR _datenaiss$70493[ebp], eax

; 422  : 		char *d_echeance = dyntab_val(&cf->tmes, i, 12);

	push	12					; 0000000cH
	mov	eax, DWORD PTR _i$[ebp]
	push	eax
	mov	ecx, DWORD PTR _cf$[ebp]
	add	ecx, 224				; 000000e0H
	push	ecx
	call	_dyntab_val
	add	esp, 12					; 0000000cH
	mov	DWORD PTR _d_echeance$70494[ebp], eax

; 423  : 		char *majorite = cf->mes[i].majorite;

	mov	edx, DWORD PTR _i$[ebp]
	imul	edx, 168				; 000000a8H
	mov	eax, DWORD PTR _cf$[ebp]
	mov	ecx, DWORD PTR [eax+248]
	lea	edx, DWORD PTR [ecx+edx+24]
	mov	DWORD PTR _majorite$70495[ebp], edx

; 424  : 		DynTable *ano = &cf->mes[i].notes;

	mov	eax, DWORD PTR _i$[ebp]
	imul	eax, 168				; 000000a8H
	mov	ecx, DWORD PTR _cf$[ebp]
	mov	edx, DWORD PTR [ecx+248]
	lea	eax, DWORD PTR [edx+eax+52]
	mov	DWORD PTR _ano$70496[ebp], eax

; 425  : 		unsigned long idval = get_id_value(cntxt, DYNTAB_VAL_SZ(&cf->tmes, i, 3));

	push	3
	mov	ecx, DWORD PTR _i$[ebp]
	push	ecx
	mov	edx, DWORD PTR _cf$[ebp]
	add	edx, 224				; 000000e0H
	push	edx
	call	_dyntab_sz
	add	esp, 12					; 0000000cH
	push	eax
	push	3
	mov	eax, DWORD PTR _i$[ebp]
	push	eax
	mov	ecx, DWORD PTR _cf$[ebp]
	add	ecx, 224				; 000000e0H
	push	ecx
	call	_dyntab_val
	add	esp, 12					; 0000000cH
	push	eax
	mov	edx, DWORD PTR _cntxt$[ebp]
	push	edx
	call	_get_id_value
	add	esp, 12					; 0000000cH
	mov	DWORD PTR _idval$70497[ebp], eax

; 426  : 
; 427  : 		/* Barre d'avancement */
; 428  : 		if(i * 60 / cf->nb_mes >= cnt)

	mov	eax, DWORD PTR _i$[ebp]
	imul	eax, 60					; 0000003cH
	mov	ecx, DWORD PTR _cf$[ebp]
	xor	edx, edx
	div	DWORD PTR [ecx+244]
	cmp	eax, DWORD PTR _cnt$[ebp]
	jb	SHORT $L70498

; 430  : 			putc('*', stdout);

	push	OFFSET FLAT:__iob+32
	push	42					; 0000002aH
	call	_putc
	add	esp, 8

; 431  : 			fflush(stdout);

	push	OFFSET FLAT:__iob+32
	call	_fflush
	add	esp, 4

; 432  : 			cnt++;

	mov	edx, DWORD PTR _cnt$[ebp]
	add	edx, 1
	mov	DWORD PTR _cnt$[ebp], edx
$L70498:

; 434  : 
; 435  : 		/* Lecture des donnees de la mesure */
; 436  : 		cf->mes[i].id = DYNTAB_TOULRC(&cf->tmes, i, 0);

	push	10					; 0000000aH
	push	0
	push	0
	mov	eax, DWORD PTR _i$[ebp]
	push	eax
	mov	ecx, DWORD PTR _cf$[ebp]
	add	ecx, 224				; 000000e0H
	push	ecx
	call	_dyntab_val
	add	esp, 12					; 0000000cH
	push	eax
	call	_strtoul
	add	esp, 12					; 0000000cH
	mov	edx, DWORD PTR _i$[ebp]
	imul	edx, 168				; 000000a8H
	mov	ecx, DWORD PTR _cf$[ebp]
	mov	ecx, DWORD PTR [ecx+248]
	mov	DWORD PTR [ecx+edx], eax

; 437  : 		if(datetxt_invalid(datenaiss))

	mov	edx, DWORD PTR _datenaiss$70493[ebp]
	push	edx
	call	_datetxt_invalid
	add	esp, 4
	test	eax, eax
	je	SHORT $L70500

; 439  : 			DYNTAB_SET(ano, ano->nbrows, 0, "Date de naissance incorrecte");

	push	28					; 0000001cH
	push	OFFSET FLAT:$SG70502
	push	0
	mov	eax, DWORD PTR _ano$70496[ebp]
	mov	ecx, DWORD PTR [eax]
	push	ecx
	mov	edx, DWORD PTR _ano$70496[ebp]
	push	edx
	call	_dyntab_set_txt
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L70501
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29872], OFFSET FLAT:$SG70504
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 439		; 000001b7H
	jmp	$eva_err$70452
$L70501:

; 441  : 		else if(!delay_to_datetxt(txt, datenaiss, 18, 'Y')) strncpy(majorite, txt, 8);

	jmp	SHORT $L70506
$L70500:
	push	89					; 00000059H
	push	18					; 00000012H
	mov	edx, DWORD PTR _datenaiss$70493[ebp]
	push	edx
	lea	eax, DWORD PTR _txt$[ebp]
	push	eax
	call	_delay_to_datetxt
	add	esp, 16					; 00000010H
	test	eax, eax
	jne	SHORT $L70506
	push	8
	lea	ecx, DWORD PTR _txt$[ebp]
	push	ecx
	mov	edx, DWORD PTR _majorite$70495[ebp]
	push	edx
	call	_strncpy
	add	esp, 12					; 0000000cH
$L70506:

; 442  : 		strncpy(datedeb, dyntab_val(&cf->tmes, i, 2), 8);

	push	8
	push	2
	mov	eax, DWORD PTR _i$[ebp]
	push	eax
	mov	ecx, DWORD PTR _cf$[ebp]
	add	ecx, 224				; 000000e0H
	push	ecx
	call	_dyntab_val
	add	esp, 12					; 0000000cH
	push	eax
	mov	edx, DWORD PTR _datedeb$70491[ebp]
	push	edx
	call	_strncpy
	add	esp, 12					; 0000000cH

; 443  : 		cf->mes[i].b_jeunemajeur = dyntab_val(&cf->tmes, i, 4)[0] != 0;

	push	4
	mov	eax, DWORD PTR _i$[ebp]
	push	eax
	mov	ecx, DWORD PTR _cf$[ebp]
	add	ecx, 224				; 000000e0H
	push	ecx
	call	_dyntab_val
	add	esp, 12					; 0000000cH
	movsx	edx, BYTE PTR [eax]
	neg	edx
	sbb	edx, edx
	neg	edx
	mov	eax, DWORD PTR _i$[ebp]
	imul	eax, 168				; 000000a8H
	mov	ecx, DWORD PTR _cf$[ebp]
	mov	ecx, DWORD PTR [ecx+248]
	mov	DWORD PTR [ecx+eax+48], edx

; 444  : 		strncpy(cf->mes[i].statfact, dyntab_val(&cf->tmes, i, 5), sizeof(cf->mes->statfact));

	push	20					; 00000014H
	push	5
	mov	edx, DWORD PTR _i$[ebp]
	push	edx
	mov	eax, DWORD PTR _cf$[ebp]
	add	eax, 224				; 000000e0H
	push	eax
	call	_dyntab_val
	add	esp, 12					; 0000000cH
	push	eax
	mov	ecx, DWORD PTR _i$[ebp]
	imul	ecx, 168				; 000000a8H
	mov	edx, DWORD PTR _cf$[ebp]
	mov	eax, DWORD PTR [edx+248]
	lea	ecx, DWORD PTR [eax+ecx+72]
	push	ecx
	call	_strncpy
	add	esp, 12					; 0000000cH

; 445  : 		cf->mes[i].idvalstat = get_id_value(cntxt, DYNTAB_VAL_SZ(&cf->tmes, i, 5));

	push	5
	mov	edx, DWORD PTR _i$[ebp]
	push	edx
	mov	eax, DWORD PTR _cf$[ebp]
	add	eax, 224				; 000000e0H
	push	eax
	call	_dyntab_sz
	add	esp, 12					; 0000000cH
	push	eax
	push	5
	mov	ecx, DWORD PTR _i$[ebp]
	push	ecx
	mov	edx, DWORD PTR _cf$[ebp]
	add	edx, 224				; 000000e0H
	push	edx
	call	_dyntab_val
	add	esp, 12					; 0000000cH
	push	eax
	mov	eax, DWORD PTR _cntxt$[ebp]
	push	eax
	call	_get_id_value
	add	esp, 12					; 0000000cH
	mov	ecx, DWORD PTR _i$[ebp]
	imul	ecx, 168				; 000000a8H
	mov	edx, DWORD PTR _cf$[ebp]
	mov	edx, DWORD PTR [edx+248]
	mov	DWORD PTR [edx+ecx+92], eax

; 446  : 		strncpy(cf->mes[i].modefact, dyntab_val(&cf->tmes, i, 6), sizeof(cf->mes->modefact));

	push	20					; 00000014H
	push	6
	mov	eax, DWORD PTR _i$[ebp]
	push	eax
	mov	ecx, DWORD PTR _cf$[ebp]
	add	ecx, 224				; 000000e0H
	push	ecx
	call	_dyntab_val
	add	esp, 12					; 0000000cH
	push	eax
	mov	edx, DWORD PTR _i$[ebp]
	imul	edx, 168				; 000000a8H
	mov	eax, DWORD PTR _cf$[ebp]
	mov	ecx, DWORD PTR [eax+248]
	lea	edx, DWORD PTR [ecx+edx+100]
	push	edx
	call	_strncpy
	add	esp, 12					; 0000000cH

; 447  : 		strncpy(cf->mes[i].prisecharge, dyntab_val(&cf->tmes, i, 7), 8);

	push	8
	push	7
	mov	eax, DWORD PTR _i$[ebp]
	push	eax
	mov	ecx, DWORD PTR _cf$[ebp]
	add	ecx, 224				; 000000e0H
	push	ecx
	call	_dyntab_val
	add	esp, 12					; 0000000cH
	push	eax
	mov	edx, DWORD PTR _i$[ebp]
	imul	edx, 168				; 000000a8H
	mov	eax, DWORD PTR _cf$[ebp]
	mov	ecx, DWORD PTR [eax+248]
	lea	edx, DWORD PTR [ecx+edx+140]
	push	edx
	call	_strncpy
	add	esp, 12					; 0000000cH

; 448  : 		strncpy(cf->mes[i].debfact, dyntab_val(&cf->tmes, i, 8), 8);

	push	8
	push	8
	mov	eax, DWORD PTR _i$[ebp]
	push	eax
	mov	ecx, DWORD PTR _cf$[ebp]
	add	ecx, 224				; 000000e0H
	push	ecx
	call	_dyntab_val
	add	esp, 12					; 0000000cH
	push	eax
	mov	edx, DWORD PTR _i$[ebp]
	imul	edx, 168				; 000000a8H
	mov	eax, DWORD PTR _cf$[ebp]
	mov	ecx, DWORD PTR [eax+248]
	lea	edx, DWORD PTR [ecx+edx+120]
	push	edx
	call	_strncpy
	add	esp, 12					; 0000000cH

; 449  : 		strncpy(cf->mes[i].finfact, dyntab_val(&cf->tmes, i, 9), 8);

	push	8
	push	9
	mov	eax, DWORD PTR _i$[ebp]
	push	eax
	mov	ecx, DWORD PTR _cf$[ebp]
	add	ecx, 224				; 000000e0H
	push	ecx
	call	_dyntab_val
	add	esp, 12					; 0000000cH
	push	eax
	mov	edx, DWORD PTR _i$[ebp]
	imul	edx, 168				; 000000a8H
	mov	eax, DWORD PTR _cf$[ebp]
	mov	ecx, DWORD PTR [eax+248]
	lea	edx, DWORD PTR [ecx+edx+130]
	push	edx
	call	_strncpy
	add	esp, 12					; 0000000cH

; 450  : 		cf->mes[i].dest = DYNTAB_TOULRC(&cf->tmes, i, 10);

	push	10					; 0000000aH
	push	0
	push	10					; 0000000aH
	mov	eax, DWORD PTR _i$[ebp]
	push	eax
	mov	ecx, DWORD PTR _cf$[ebp]
	add	ecx, 224				; 000000e0H
	push	ecx
	call	_dyntab_val
	add	esp, 12					; 0000000cH
	push	eax
	call	_strtoul
	add	esp, 12					; 0000000cH
	mov	edx, DWORD PTR _i$[ebp]
	imul	edx, 168				; 000000a8H
	mov	ecx, DWORD PTR _cf$[ebp]
	mov	ecx, DWORD PTR [ecx+248]
	mov	DWORD PTR [ecx+edx+160], eax

; 451  : 		cf->mes[i].b_forcstat = dyntab_val(&cf->tmes, i, 11)[0] != 0;

	push	11					; 0000000bH
	mov	edx, DWORD PTR _i$[ebp]
	push	edx
	mov	eax, DWORD PTR _cf$[ebp]
	add	eax, 224				; 000000e0H
	push	eax
	call	_dyntab_val
	add	esp, 12					; 0000000cH
	movsx	ecx, BYTE PTR [eax]
	neg	ecx
	sbb	ecx, ecx
	neg	ecx
	mov	edx, DWORD PTR _i$[ebp]
	imul	edx, 168				; 000000a8H
	mov	eax, DWORD PTR _cf$[ebp]
	mov	eax, DWORD PTR [eax+248]
	mov	DWORD PTR [eax+edx+96], ecx

; 452  : 		strncpy(cf->mes[i].affect, dyntab_val(&cf->tmes, i, 13), 8);

	push	8
	push	13					; 0000000dH
	mov	ecx, DWORD PTR _i$[ebp]
	push	ecx
	mov	edx, DWORD PTR _cf$[ebp]
	add	edx, 224				; 000000e0H
	push	edx
	call	_dyntab_val
	add	esp, 12					; 0000000cH
	push	eax
	mov	eax, DWORD PTR _i$[ebp]
	imul	eax, 168				; 000000a8H
	mov	ecx, DWORD PTR _cf$[ebp]
	mov	edx, DWORD PTR [ecx+248]
	lea	eax, DWORD PTR [edx+eax+150]
	push	eax
	call	_strncpy
	add	esp, 12					; 0000000cH

; 453  : 		cf->mes[i].ts = DYNTAB_TOULRC(&cf->tmes, i, 14);

	push	10					; 0000000aH
	push	0
	push	14					; 0000000eH
	mov	ecx, DWORD PTR _i$[ebp]
	push	ecx
	mov	edx, DWORD PTR _cf$[ebp]
	add	edx, 224				; 000000e0H
	push	edx
	call	_dyntab_val
	add	esp, 12					; 0000000cH
	push	eax
	call	_strtoul
	add	esp, 12					; 0000000cH
	mov	ecx, DWORD PTR _i$[ebp]
	imul	ecx, 168				; 000000a8H
	mov	edx, DWORD PTR _cf$[ebp]
	mov	edx, DWORD PTR [edx+248]
	mov	DWORD PTR [edx+ecx+164], eax

; 454  : 
; 455  : 		/* Lecture du dernier jugement */
; 456  : 		snprintf(add_sz_str(qry),
; 457  : 			"SELECT DISTINCT TLink0.IdObj FROM TLink AS TLink0\n"
; 458  : 			"INNER JOIN TLink AS TLink1 ON TLink0.IdObj=TLink1.IdObj\n"
; 459  : 			"WHERE TLink0.DateDel IS NULL AND TLink0.IdField=%lu AND TLink0.IdRelObj=%lu\n"
; 460  : 			"AND TLink1.DateDel IS NULL AND TLink1.IdField=%lu AND TLink1.IdValue=%lu\n"
; 461  : 			"ORDER BY TLink0.IdObj DESC",
; 462  : 			cf->val_MESURE_JUGT, cf->mes[i].id, cf->val_DATE_JUGT, idval);

	mov	eax, DWORD PTR _idval$70497[ebp]
	push	eax
	mov	ecx, DWORD PTR _cf$[ebp]
	mov	edx, DWORD PTR [ecx+64]
	push	edx
	mov	eax, DWORD PTR _i$[ebp]
	imul	eax, 168				; 000000a8H
	mov	ecx, DWORD PTR _cf$[ebp]
	mov	edx, DWORD PTR [ecx+248]
	mov	eax, DWORD PTR [edx+eax]
	push	eax
	mov	ecx, DWORD PTR _cf$[ebp]
	mov	edx, DWORD PTR [ecx+52]
	push	edx
	push	OFFSET FLAT:$SG70509
	push	2047					; 000007ffH
	lea	eax, DWORD PTR _qry$[ebp]
	push	eax
	call	__snprintf
	add	esp, 28					; 0000001cH

; 463  : 		if(sql_exec_query(cntxt, qry) || sql_get_table(cntxt, &data, 2)) STACK_ERROR;

	lea	ecx, DWORD PTR _qry$[ebp]
	push	ecx
	mov	edx, DWORD PTR _cntxt$[ebp]
	push	edx
	call	_sql_exec_query
	add	esp, 8
	test	eax, eax
	jne	SHORT $L70511
	push	2
	lea	eax, DWORD PTR _data$[ebp]
	push	eax
	mov	ecx, DWORD PTR _cntxt$[ebp]
	push	ecx
	call	_sql_get_table
	add	esp, 12					; 0000000cH
	test	eax, eax
	je	SHORT $L70510
$L70511:
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 463		; 000001cfH
	jmp	$eva_err$70452
$L70510:

; 464  : 
; 465  : 		/* Lecture date d'échéance */
; 466  : 		if(qry_obj_field(cntxt, &data, DYNTAB_TOUL(&data), "ECHEANCE_JUGT,ORD_JUGTS_EFFET_DU,ORD_JUGTS_TYPE")) STACK_ERROR;

	push	OFFSET FLAT:$SG70514
	push	10					; 0000000aH
	push	0
	push	0
	push	0
	lea	eax, DWORD PTR _data$[ebp]
	push	eax
	call	_dyntab_val
	add	esp, 12					; 0000000cH
	push	eax
	call	_strtoul
	add	esp, 12					; 0000000cH
	push	eax
	lea	ecx, DWORD PTR _data$[ebp]
	push	ecx
	mov	edx, DWORD PTR _cntxt$[ebp]
	push	edx
	call	_qry_obj_field
	add	esp, 16					; 00000010H
	test	eax, eax
	je	SHORT $L70513
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 466		; 000001d2H
	jmp	$eva_err$70452
$L70513:

; 467  : 		strncpy(datefin, dyntab_field_val(&data, "ECHEANCE_JUGT", ~0UL, 0), 8);

	push	8
	push	0
	push	-1
	push	OFFSET FLAT:$SG70515
	lea	ecx, DWORD PTR _data$[ebp]
	push	ecx
	call	_dyntab_field_val
	add	esp, 16					; 00000010H
	push	eax
	mov	edx, DWORD PTR _datefin$70492[ebp]
	push	edx
	call	_strncpy
	add	esp, 12					; 0000000cH

; 471  : 			char *effetdu = dyntab_field_val(&data, "ORD_JUGTS_EFFET_DU", ~0UL, 0);

	push	0
	push	-1
	push	OFFSET FLAT:$SG70517
	lea	eax, DWORD PTR _data$[ebp]
	push	eax
	call	_dyntab_field_val
	add	esp, 16					; 00000010H
	mov	DWORD PTR _effetdu$70516[ebp], eax

; 472  : 			char *datejug = dyntab_val(&cf->tmes, i, 3);

	push	3
	mov	ecx, DWORD PTR _i$[ebp]
	push	ecx
	mov	edx, DWORD PTR _cf$[ebp]
	add	edx, 224				; 000000e0H
	push	edx
	call	_dyntab_val
	add	esp, 12					; 0000000cH
	mov	DWORD PTR _datejug$70518[ebp], eax

; 473  : 			strncpy(cf->mes[i].effetderjug, effetdu, 8);

	push	8
	mov	eax, DWORD PTR _effetdu$70516[ebp]
	push	eax
	mov	ecx, DWORD PTR _i$[ebp]
	imul	ecx, 168				; 000000a8H
	mov	edx, DWORD PTR _cf$[ebp]
	mov	eax, DWORD PTR [edx+248]
	lea	ecx, DWORD PTR [eax+ecx+34]
	push	ecx
	call	_strncpy
	add	esp, 12					; 0000000cH

; 474  : 			cf->mes[i].b_mainlevee =
; 475  : 				!strcmp(dyntab_field_val(&data, "ORD_JUGTS_TYPE", ~0UL, 0), "Main levée") ||
; 476  : 				!strncmp(effetdu, datefin, 8) || !strncmp(datejug, datefin, 8);

	push	OFFSET FLAT:$SG70519
	push	0
	push	-1
	push	OFFSET FLAT:$SG70520
	lea	edx, DWORD PTR _data$[ebp]
	push	edx
	call	_dyntab_field_val
	add	esp, 16					; 00000010H
	push	eax
	call	_strcmp
	add	esp, 8
	test	eax, eax
	je	SHORT $L71250
	push	8
	mov	eax, DWORD PTR _datefin$70492[ebp]
	push	eax
	mov	ecx, DWORD PTR _effetdu$70516[ebp]
	push	ecx
	call	_strncmp
	add	esp, 12					; 0000000cH
	test	eax, eax
	je	SHORT $L71250
	push	8
	mov	edx, DWORD PTR _datefin$70492[ebp]
	push	edx
	mov	eax, DWORD PTR _datejug$70518[ebp]
	push	eax
	call	_strncmp
	add	esp, 12					; 0000000cH
	test	eax, eax
	je	SHORT $L71250
	mov	DWORD PTR -2152+[ebp], 0
	jmp	SHORT $L71251
$L71250:
	mov	DWORD PTR -2152+[ebp], 1
$L71251:
	mov	ecx, DWORD PTR _i$[ebp]
	imul	ecx, 168				; 000000a8H
	mov	edx, DWORD PTR _cf$[ebp]
	mov	eax, DWORD PTR [edx+248]
	mov	edx, DWORD PTR -2152+[ebp]
	mov	DWORD PTR [eax+ecx+44], edx

; 478  : 
; 479  : 		/* Prise en compte majorite en fin de mesure */
; 480  : 		if(*majorite && strcmp(majorite, datefin) < 0)

	mov	eax, DWORD PTR _majorite$70495[ebp]
	movsx	ecx, BYTE PTR [eax]
	test	ecx, ecx
	je	$L70533
	mov	edx, DWORD PTR _datefin$70492[ebp]
	push	edx
	mov	eax, DWORD PTR _majorite$70495[ebp]
	push	eax
	call	_strcmp
	add	esp, 8
	test	eax, eax
	jge	$L70533

; 482  : 			if(cf->mes[i].b_jeunemajeur)

	mov	ecx, DWORD PTR _i$[ebp]
	imul	ecx, 168				; 000000a8H
	mov	edx, DWORD PTR _cf$[ebp]
	mov	eax, DWORD PTR [edx+248]
	cmp	DWORD PTR [eax+ecx+48], 0
	je	$L70522

; 484  : 				/* Mesure jeune majeur : fin de mesure a 21 ans maxi */
; 485  : 				DYNTAB_SET(ano, ano->nbrows, 0, "Jeune majeur");

	push	12					; 0000000cH
	push	OFFSET FLAT:$SG70524
	push	0
	mov	ecx, DWORD PTR _ano$70496[ebp]
	mov	edx, DWORD PTR [ecx]
	push	edx
	mov	eax, DWORD PTR _ano$70496[ebp]
	push	eax
	call	_dyntab_set_txt
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L70523
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29872], OFFSET FLAT:$SG70526
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 485		; 000001e5H
	jmp	$eva_err$70452
$L70523:

; 486  : 				delay_to_datetxt(txt, datenaiss, 21, 'Y');

	push	89					; 00000059H
	push	21					; 00000015H
	mov	eax, DWORD PTR _datenaiss$70493[ebp]
	push	eax
	lea	ecx, DWORD PTR _txt$[ebp]
	push	ecx
	call	_delay_to_datetxt
	add	esp, 16					; 00000010H

; 487  : 				if(*txt && strcmp(txt, datefin) < 0)

	movsx	edx, BYTE PTR _txt$[ebp]
	test	edx, edx
	je	$L70527
	mov	eax, DWORD PTR _datefin$70492[ebp]
	push	eax
	lea	ecx, DWORD PTR _txt$[ebp]
	push	ecx
	call	_strcmp
	add	esp, 8
	test	eax, eax
	jge	SHORT $L70527

; 489  : 					if(!strncmp(majorite, cf->datedebmois, 6)) DYNTAB_SET(ano, ano->nbrows, 0, "Arrêt à 21 ans");

	push	6
	mov	edx, DWORD PTR _cf$[ebp]
	add	edx, 168				; 000000a8H
	push	edx
	mov	eax, DWORD PTR _majorite$70495[ebp]
	push	eax
	call	_strncmp
	add	esp, 12					; 0000000cH
	test	eax, eax
	jne	SHORT $L70529
	push	14					; 0000000eH
	push	OFFSET FLAT:$SG70530
	push	0
	mov	ecx, DWORD PTR _ano$70496[ebp]
	mov	edx, DWORD PTR [ecx]
	push	edx
	mov	eax, DWORD PTR _ano$70496[ebp]
	push	eax
	call	_dyntab_set_txt
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L70529
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29872], OFFSET FLAT:$SG70532
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 489		; 000001e9H
	jmp	$eva_err$70452
$L70529:

; 490  : 					strncpy(datefin, txt, 8);

	push	8
	lea	eax, DWORD PTR _txt$[ebp]
	push	eax
	mov	ecx, DWORD PTR _datefin$70492[ebp]
	push	ecx
	call	_strncpy
	add	esp, 12					; 0000000cH
$L70527:

; 493  : 			else

	jmp	SHORT $L70533
$L70522:

; 495  : 				if(!strncmp(majorite, cf->datedebmois, 6)) DYNTAB_SET(ano, ano->nbrows, 0, "Arrêt à 18 ans");

	push	6
	mov	edx, DWORD PTR _cf$[ebp]
	add	edx, 168				; 000000a8H
	push	edx
	mov	eax, DWORD PTR _majorite$70495[ebp]
	push	eax
	call	_strncmp
	add	esp, 12					; 0000000cH
	test	eax, eax
	jne	SHORT $L70535
	push	14					; 0000000eH
	push	OFFSET FLAT:$SG70536
	push	0
	mov	ecx, DWORD PTR _ano$70496[ebp]
	mov	edx, DWORD PTR [ecx]
	push	edx
	mov	eax, DWORD PTR _ano$70496[ebp]
	push	eax
	call	_dyntab_set_txt
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L70535
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29872], OFFSET FLAT:$SG70538
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 495		; 000001efH
	jmp	$eva_err$70452
$L70535:

; 496  : 				strncpy(datefin, majorite, 8);

	push	8
	mov	eax, DWORD PTR _majorite$70495[ebp]
	push	eax
	mov	ecx, DWORD PTR _datefin$70492[ebp]
	push	ecx
	call	_strncpy
	add	esp, 12					; 0000000cH
$L70533:

; 499  : 
; 500  : 		/* Prise en compte fin de facturation manuelle */
; 501  : 		if(!strcmp(cf->mes[i].modefact, "DateManuelle") && cf->mes[i].finfact[0])

	push	OFFSET FLAT:$SG70540
	mov	edx, DWORD PTR _i$[ebp]
	imul	edx, 168				; 000000a8H
	mov	eax, DWORD PTR _cf$[ebp]
	mov	ecx, DWORD PTR [eax+248]
	lea	edx, DWORD PTR [ecx+edx+100]
	push	edx
	call	_strcmp
	add	esp, 8
	test	eax, eax
	jne	SHORT $L70539
	mov	eax, DWORD PTR _i$[ebp]
	imul	eax, 168				; 000000a8H
	mov	ecx, DWORD PTR _cf$[ebp]
	mov	edx, DWORD PTR [ecx+248]
	movsx	eax, BYTE PTR [edx+eax+130]
	test	eax, eax
	je	SHORT $L70539

; 502  : 			strncpy(datefin, cf->mes[i].finfact, 8);

	push	8
	mov	ecx, DWORD PTR _i$[ebp]
	imul	ecx, 168				; 000000a8H
	mov	edx, DWORD PTR _cf$[ebp]
	mov	eax, DWORD PTR [edx+248]
	lea	ecx, DWORD PTR [eax+ecx+130]
	push	ecx
	mov	edx, DWORD PTR _datefin$70492[ebp]
	push	edx
	call	_strncpy
	add	esp, 12					; 0000000cH
$L70539:

; 503  : 
; 504  : 		/* Vérification dates debut / fin */
; 505  : 		if(*datedeb && datetxt_invalid(datedeb)) *datedeb = 0;

	mov	eax, DWORD PTR _datedeb$70491[ebp]
	movsx	ecx, BYTE PTR [eax]
	test	ecx, ecx
	je	SHORT $L70541
	mov	edx, DWORD PTR _datedeb$70491[ebp]
	push	edx
	call	_datetxt_invalid
	add	esp, 4
	test	eax, eax
	je	SHORT $L70541
	mov	eax, DWORD PTR _datedeb$70491[ebp]
	mov	BYTE PTR [eax], 0
$L70541:

; 506  : 		if(*datefin && datetxt_invalid(datefin)) *datefin = 0;

	mov	ecx, DWORD PTR _datefin$70492[ebp]
	movsx	edx, BYTE PTR [ecx]
	test	edx, edx
	je	SHORT $L70542
	mov	eax, DWORD PTR _datefin$70492[ebp]
	push	eax
	call	_datetxt_invalid
	add	esp, 4
	test	eax, eax
	je	SHORT $L70542
	mov	ecx, DWORD PTR _datefin$70492[ebp]
	mov	BYTE PTR [ecx], 0
$L70542:

; 507  : 		if(!*datedeb) DYNTAB_SET(ano, ano->nbrows, 0, "Debut de mesure inconnu");

	mov	edx, DWORD PTR _datedeb$70491[ebp]
	movsx	eax, BYTE PTR [edx]
	test	eax, eax
	jne	SHORT $L70544
	push	23					; 00000017H
	push	OFFSET FLAT:$SG70545
	push	0
	mov	ecx, DWORD PTR _ano$70496[ebp]
	mov	edx, DWORD PTR [ecx]
	push	edx
	mov	eax, DWORD PTR _ano$70496[ebp]
	push	eax
	call	_dyntab_set_txt
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L70544
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29872], OFFSET FLAT:$SG70547
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 507		; 000001fbH
	jmp	$eva_err$70452
$L70544:

; 508  : 		if(!*datefin) DYNTAB_SET(ano, ano->nbrows, 0, "Fin de mesure inconnue");

	mov	eax, DWORD PTR _datefin$70492[ebp]
	movsx	ecx, BYTE PTR [eax]
	test	ecx, ecx
	jne	SHORT $L70549
	push	22					; 00000016H
	push	OFFSET FLAT:$SG70550
	push	0
	mov	edx, DWORD PTR _ano$70496[ebp]
	mov	eax, DWORD PTR [edx]
	push	eax
	mov	ecx, DWORD PTR _ano$70496[ebp]
	push	ecx
	call	_dyntab_set_txt
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L70549
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29872], OFFSET FLAT:$SG70552
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 508		; 000001fcH
	jmp	$eva_err$70452
$L70549:

; 509  : 
; 510  : 		/* Maj date echeance mesure si necessaire */
; 511  : 		if(strlen(datefin) > 7 && strcmp(d_echeance, datefin) &&
; 512  : 			qry_update_idobj_idfield_1(cntxt, cf->mes[i].id, cf->val_DATE_ECHEANCE, datefin, 8)) STACK_ERROR;

	mov	ecx, DWORD PTR _datefin$70492[ebp]
	push	ecx
	call	_strlen
	add	esp, 4
	cmp	eax, 7
	jbe	SHORT $L70553
	mov	edx, DWORD PTR _datefin$70492[ebp]
	push	edx
	mov	eax, DWORD PTR _d_echeance$70494[ebp]
	push	eax
	call	_strcmp
	add	esp, 8
	test	eax, eax
	je	SHORT $L70553
	push	8
	mov	ecx, DWORD PTR _datefin$70492[ebp]
	push	ecx
	mov	edx, DWORD PTR _cf$[ebp]
	mov	eax, DWORD PTR [edx+68]
	push	eax
	mov	ecx, DWORD PTR _i$[ebp]
	imul	ecx, 168				; 000000a8H
	mov	edx, DWORD PTR _cf$[ebp]
	mov	eax, DWORD PTR [edx+248]
	mov	ecx, DWORD PTR [eax+ecx]
	push	ecx
	mov	edx, DWORD PTR _cntxt$[ebp]
	push	edx
	call	_qry_update_idobj_idfield_1
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L70553
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 512		; 00000200H
	jmp	SHORT $eva_err$70452
$L70553:

; 513  : 	}

	jmp	$L70489
$L70490:

; 514  : 
; 515  : 	printf("*\n");

	push	OFFSET FLAT:$SG70554
	call	_printf
	add	esp, 4
$eva_noerr$70555:

; 516  : 
; 517  : 	RETURN_OK_CLEANUP;

	push	0
	push	OFFSET FLAT:$SG70556
	push	OFFSET FLAT:$SG70557
	mov	ecx, DWORD PTR _cntxt$[ebp]
	push	ecx
	call	_err_clear
	add	esp, 16					; 00000010H
$eva_err$70452:
	mov	edx, DWORD PTR _cntxt$[ebp]
	cmp	DWORD PTR [edx+29872], 0
	je	SHORT $L70558
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	ecx, DWORD PTR [eax+29900]
	push	ecx
	push	OFFSET FLAT:$SG70559
	push	OFFSET FLAT:$SG70560
	mov	edx, DWORD PTR _cntxt$[ebp]
	push	edx
	call	_err_add_context
	add	esp, 16					; 00000010H
$L70558:
	lea	eax, DWORD PTR _data$[ebp]
	push	eax
	call	_dyntab_free
	add	esp, 4
	mov	ecx, DWORD PTR _cntxt$[ebp]
	xor	eax, eax
	cmp	DWORD PTR [ecx+29872], 0
	setne	al

; 518  : }

	pop	edi
	mov	esp, ebp
	pop	ebp
	ret	0
_Init_AEMO ENDP
_TEXT	ENDS
PUBLIC	_Entete_journal
_DATA	SEGMENT
	ORG $+2
$SG70570 DB	'</pre></font></b><hr><b><u>Pr', 0e9H, 'paration de la fa'
	DB	'cture - mise ', 0e0H, ' jour des mesures factur', 0e9H, 'es</'
	DB	'u></b><hr><table border=0 cellpadding=1 cellspacing=0 width=8'
	DB	'50 bgcolor=#DDDDDD><tr><td width=150>Enfant</td><td width=80 '
	DB	'align=right>D', 0e9H, 'but</td><td width=10 align=center>-</t'
	DB	'd><td width=80>Fin</td><td width=120>Destinataire</td><td wid'
	DB	'th=30 align=right>NB</td><td width=10>+</td><td width=50>C</t'
	DB	'd><td width=60>Ancien</td><td width=80>Statut</td><td>Motif</'
	DB	'td></tr></table>', 0aH, 00H
	ORG $+3
$SG70572 DB	'D:\Travail\ABI\EVA\V4.0\CGI\Brunix-2016\dll_adsea01.c', 00H
	ORG $+2
$SG70573 DB	'Entete_journal', 00H
	ORG $+1
$SG70576 DB	'D:\Travail\ABI\EVA\V4.0\CGI\Brunix-2016\dll_adsea01.c', 00H
	ORG $+2
$SG70577 DB	'Entete_journal', 00H
_DATA	ENDS
_TEXT	SEGMENT
_cntxt$ = 8
_cf$ = 12
_Entete_journal PROC NEAR

; 531  : ){

	push	ebp
	mov	ebp, esp

; 532  : 	cf->b_detail_journal = 0;

	mov	eax, DWORD PTR _cf$[ebp]
	mov	DWORD PTR [eax+164], 0

; 533  : 	printf("</pre></font></b><hr>"
; 534  : 			"<b><u>Préparation de la facture - mise à jour des mesures facturées</u></b><hr>"
; 535  : 			"<table border=0 cellpadding=1 cellspacing=0 width=850 bgcolor=#DDDDDD><tr>"
; 536  : 			"<td width=150>Enfant</td>"
; 537  : 			"<td width=80 align=right>Début</td>"
; 538  : 			"<td width=10 align=center>-</td>"
; 539  : 			"<td width=80>Fin</td>"
; 540  : 			"<td width=120>Destinataire</td>"
; 541  : 			"<td width=30 align=right>NB</td>"
; 542  : 			"<td width=10>+</td>"
; 543  : 			"<td width=50>C</td>"
; 544  : 			"<td width=60>Ancien</td>"
; 545  : 			"<td width=80>Statut</td>"
; 546  : 			"<td>Motif</td>"
; 547  : 			"</tr></table>\n");

	push	OFFSET FLAT:$SG70570
	call	_printf
	add	esp, 4

; 548  : 	fflush(stdout);

	push	OFFSET FLAT:__iob+32
	call	_fflush
	add	esp, 4
$eva_noerr$70571:

; 549  : 
; 550  : 	RETURN_OK_CLEANUP;

	push	0
	push	OFFSET FLAT:$SG70572
	push	OFFSET FLAT:$SG70573
	mov	ecx, DWORD PTR _cntxt$[ebp]
	push	ecx
	call	_err_clear
	add	esp, 16					; 00000010H
$eva_err$70574:
	mov	edx, DWORD PTR _cntxt$[ebp]
	cmp	DWORD PTR [edx+29872], 0
	je	SHORT $L70575
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	ecx, DWORD PTR [eax+29900]
	push	ecx
	push	OFFSET FLAT:$SG70576
	push	OFFSET FLAT:$SG70577
	mov	edx, DWORD PTR _cntxt$[ebp]
	push	edx
	call	_err_add_context
	add	esp, 16					; 00000010H
$L70575:
	mov	eax, DWORD PTR _cntxt$[ebp]
	xor	ecx, ecx
	cmp	DWORD PTR [eax+29872], 0
	setne	cl
	mov	eax, ecx

; 551  : }

	pop	ebp
	ret	0
_Entete_journal ENDP
_TEXT	ENDS
PUBLIC	_calc_jcor_AEMO
EXTRN	_datetxt_to_age:NEAR
_DATA	SEGMENT
	ORG $+1
$SG70611 DB	'2004', 00H
	ORG $+3
$SG70612 DB	'SELECT DISTINCT TLink0.IdObj,TLink2.IdRelObj,DFact.TxtVa'
	DB	'lue FROM TLink AS TLink0 ', 0aH, 'INNER JOIN TLink AS TLink1 '
	DB	'ON TLink0.IdObj=TLink1.IdObj ', 0aH, 'INNER JOIN TLink AS TLi'
	DB	'nk2 ON TLink0.IdObj=TLink2.IdObj ', 0aH, 'INNER JOIN TLink AS'
	DB	' TLink3 ON TLink2.IdRelObj=TLink3.IdObj ', 0aH, 'INNER JOIN T'
	DB	'Val AS DFact ON TLink3.IdValue=DFact.IdValue ', 0aH, 'WHERE T'
	DB	'Link0.DateDel IS NULL AND TLink0.IdField=%lu AND TLink0.IdRel'
	DB	'Obj=%lu AND TLink0.IdObj<>%lu', 0aH, 'AND TLink1.DateDel IS N'
	DB	'ULL AND TLink1.IdField=%lu AND TLink1.IdRelObj=%lu ', 0aH, 'A'
	DB	'ND TLink2.DateDel IS NULL AND TLink2.IdField=%lu ', 0aH, 'AND'
	DB	' TLink3.DateDel IS NULL AND TLink3.IdField=%lu AND DFact.TxtV'
	DB	'alue>''2004'' ', 0aH, 'ORDER BY DFact.TxtValue DESC', 00H
$SG70621 DB	'SELECT DISTINCT TLink.IdField,TVal.TxtValue FROM TLink ', 0aH
	DB	'INNER JOIN TVal ON TLink.IdValue=TVal.IdValue ', 0aH, 'WHERE '
	DB	'TLink.IdObj=%s AND TLink.DateDel IS NULL AND TLink.IdField IN'
	DB	' (%lu,%lu) ', 0aH, 00H
	ORG $+1
$SG70631 DB	'2004', 00H
	ORG $+3
$SG70635 DB	'SELECT SUM(TVal.TxtValue) FROM TLink AS TLink0 ', 0aH, 'I'
	DB	'NNER JOIN TLink AS TLink1 ON TLink0.IdObj=TLink1.IdObj ', 0aH
	DB	'INNER JOIN TLink AS TLink2 ON TLink0.IdObj=TLink2.IdObj ', 0aH
	DB	'INNER JOIN TVal ON TLink2.IdValue=TVal.IdValue ', 0aH, 'WHERE'
	DB	' TLink0.DateDel IS NULL AND TLink0.IdField=%lu AND TLink0.IdR'
	DB	'elObj=%lu AND TLink0.IdObj<>%lu', 0aH, 'AND TLink1.DateDel IS'
	DB	' NULL AND TLink1.IdField=%lu AND TLink1.IdRelObj=%lu ', 0aH, 'A'
	DB	'ND TLink2.DateDel IS NULL AND TLink2.IdField IN(%lu,%lu)', 00H
	ORG $+3
$SG70639 DB	'D:\Travail\ABI\EVA\V4.0\CGI\Brunix-2016\dll_adsea01.c', 00H
	ORG $+2
$SG70640 DB	'calc_jcor_AEMO', 00H
	ORG $+1
$SG70642 DB	'D:\Travail\ABI\EVA\V4.0\CGI\Brunix-2016\dll_adsea01.c', 00H
	ORG $+2
$SG70643 DB	'calc_jcor_AEMO', 00H
_DATA	ENDS
_TEXT	SEGMENT
_cntxt$ = 8
_cf$ = 12
_i$ = 16
_datedeb$ = 20
_datefin$ = 24
_idlignefact$ = 28
_nbjours$ = 32
_nbjcorr$ = 36
_datetmp$ = -2124
_idmesure$ = -2060
_tot_fact$ = -2056
_dfact0$ = -2128
_lignfact$ = -2108
_data$ = -2080
_qry$ = -2052
_j$ = -2088
_fmt$ = -4
_dfin$ = -2084
_a_fact$70632 = -2132
_a_fact$70634 = -2136
_calc_jcor_AEMO PROC NEAR

; 571  : ){

	push	ebp
	mov	ebp, esp
	sub	esp, 2144				; 00000860H
	push	edi

; 572  : 	char datetmp[16];
; 573  : 	unsigned long idmesure = cf->mes[i].id;

	mov	eax, DWORD PTR _i$[ebp]
	imul	eax, 168				; 000000a8H
	mov	ecx, DWORD PTR _cf$[ebp]
	mov	edx, DWORD PTR [ecx+248]
	mov	eax, DWORD PTR [edx+eax]
	mov	DWORD PTR _idmesure$[ebp], eax

; 574  : 	unsigned long tot_fact = 0;

	mov	DWORD PTR _tot_fact$[ebp], 0

; 575  : 	char *dfact0 = NULL;

	mov	DWORD PTR _dfact0$[ebp], 0

; 576  : 	DynTable lignfact = { 0 };

	mov	DWORD PTR _lignfact$[ebp], 0
	xor	ecx, ecx
	mov	DWORD PTR _lignfact$[ebp+4], ecx
	mov	DWORD PTR _lignfact$[ebp+8], ecx
	mov	DWORD PTR _lignfact$[ebp+12], ecx
	mov	DWORD PTR _lignfact$[ebp+16], ecx

; 577  : 	DynTable data = { 0 };

	mov	DWORD PTR _data$[ebp], 0
	xor	edx, edx
	mov	DWORD PTR _data$[ebp+4], edx
	mov	DWORD PTR _data$[ebp+8], edx
	mov	DWORD PTR _data$[ebp+12], edx
	mov	DWORD PTR _data$[ebp+16], edx

; 578  : 	char qry[2048] = {0};

	mov	BYTE PTR _qry$[ebp], 0
	mov	ecx, 511				; 000001ffH
	xor	eax, eax
	lea	edi, DWORD PTR _qry$[ebp+1]
	rep stosd
	stosw
	stosb

; 579  : 	unsigned long j;
; 580  : 	char fmt = 'D';

	mov	BYTE PTR _fmt$[ebp], 68			; 00000044H

; 581  : 	char *dfin = strcmp(cf->datemois1, datefin) < 0 ? cf->datemois1 : datefin;

	mov	eax, DWORD PTR _datefin$[ebp]
	push	eax
	mov	ecx, DWORD PTR _cf$[ebp]
	add	ecx, 192				; 000000c0H
	push	ecx
	call	_strcmp
	add	esp, 8
	test	eax, eax
	jge	SHORT $L71254
	mov	edx, DWORD PTR _cf$[ebp]
	add	edx, 192				; 000000c0H
	mov	DWORD PTR -2140+[ebp], edx
	jmp	SHORT $L71255
$L71254:
	mov	eax, DWORD PTR _datefin$[ebp]
	mov	DWORD PTR -2140+[ebp], eax
$L71255:
	mov	ecx, DWORD PTR -2140+[ebp]
	mov	DWORD PTR _dfin$[ebp], ecx

; 582  : 
; 583  : 	/* Calcul depuis la dernière correction si mesure commencée avant 06-2004 */
; 584  : 	if(strcmp(cf->mes[i].deb, "2004") < 0)

	push	OFFSET FLAT:$SG70611
	mov	edx, DWORD PTR _i$[ebp]
	imul	edx, 168				; 000000a8H
	mov	eax, DWORD PTR _cf$[ebp]
	mov	ecx, DWORD PTR [eax+248]
	lea	edx, DWORD PTR [ecx+edx+4]
	push	edx
	call	_strcmp
	add	esp, 8
	test	eax, eax
	jge	$L70610

; 586  : 		/* Lecture des lignes de facture après 2004 pour la mesure */
; 587  : 		snprintf(qry, sizeof(qry),
; 588  : 				"SELECT DISTINCT TLink0.IdObj,TLink2.IdRelObj,DFact.TxtValue FROM TLink AS TLink0 \n"
; 589  : 				"INNER JOIN TLink AS TLink1 ON TLink0.IdObj=TLink1.IdObj \n"
; 590  : 				"INNER JOIN TLink AS TLink2 ON TLink0.IdObj=TLink2.IdObj \n"
; 591  : 				"INNER JOIN TLink AS TLink3 ON TLink2.IdRelObj=TLink3.IdObj \n"
; 592  : 				"INNER JOIN TVal AS DFact ON TLink3.IdValue=DFact.IdValue \n"
; 593  : 				"WHERE TLink0.DateDel IS NULL AND TLink0.IdField=%lu AND TLink0.IdRelObj=%lu AND TLink0.IdObj<>%lu\n"
; 594  : 				"AND TLink1.DateDel IS NULL AND TLink1.IdField=%lu AND TLink1.IdRelObj=%lu \n"
; 595  : 				"AND TLink2.DateDel IS NULL AND TLink2.IdField=%lu \n"
; 596  : 				"AND TLink3.DateDel IS NULL AND TLink3.IdField=%lu AND DFact.TxtValue>'2004' \n"
; 597  : 				"ORDER BY DFact.TxtValue DESC",
; 598  : 			cf->val_FORMSTAMP, cf->form_LigneFacture, idlignefact,
; 599  : 			cf->val_MES_LIGNE_FACT, idmesure,
; 600  : 			cf->val_FACTURE,
; 601  : 			cf->val_DATE_FACTURE);

	mov	eax, DWORD PTR _cf$[ebp]
	mov	ecx, DWORD PTR [eax+80]
	push	ecx
	mov	edx, DWORD PTR _cf$[ebp]
	mov	eax, DWORD PTR [edx+28]
	push	eax
	mov	ecx, DWORD PTR _idmesure$[ebp]
	push	ecx
	mov	edx, DWORD PTR _cf$[ebp]
	mov	eax, DWORD PTR [edx+32]
	push	eax
	mov	ecx, DWORD PTR _idlignefact$[ebp]
	push	ecx
	mov	edx, DWORD PTR _cf$[ebp]
	mov	eax, DWORD PTR [edx+12]
	push	eax
	mov	ecx, DWORD PTR _cf$[ebp]
	mov	edx, DWORD PTR [ecx+16]
	push	edx
	push	OFFSET FLAT:$SG70612
	push	2048					; 00000800H
	lea	eax, DWORD PTR _qry$[ebp]
	push	eax
	call	__snprintf
	add	esp, 40					; 00000028H

; 602  : 		if(sql_exec_query(cntxt, qry) || sql_get_table(cntxt, &lignfact, 2)) STACK_ERROR;

	lea	ecx, DWORD PTR _qry$[ebp]
	push	ecx
	mov	edx, DWORD PTR _cntxt$[ebp]
	push	edx
	call	_sql_exec_query
	add	esp, 8
	test	eax, eax
	jne	SHORT $L70614
	push	2
	lea	eax, DWORD PTR _lignfact$[ebp]
	push	eax
	mov	ecx, DWORD PTR _cntxt$[ebp]
	push	ecx
	call	_sql_get_table
	add	esp, 12					; 0000000cH
	test	eax, eax
	je	SHORT $L70613
$L70614:
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 602		; 0000025aH
	jmp	$eva_err$70615
$L70613:

; 603  : 		if(!lignfact.nbrows) RETURN_OK;

	cmp	DWORD PTR _lignfact$[ebp], 0
	jne	SHORT $L70616
	jmp	$eva_noerr$70617
$L70616:

; 604  : 
; 605  : 		/* Examen des lignes de factures */
; 606  : 		for(j = 0; j < lignfact.nbrows; j++)

	mov	DWORD PTR _j$[ebp], 0
	jmp	SHORT $L70618
$L70619:
	mov	eax, DWORD PTR _j$[ebp]
	add	eax, 1
	mov	DWORD PTR _j$[ebp], eax
$L70618:
	mov	ecx, DWORD PTR _j$[ebp]
	cmp	ecx, DWORD PTR _lignfact$[ebp]
	jae	$L70620

; 608  : 			/* Lecture des jours facturés */
; 609  : 			snprintf(qry, sizeof(qry),
; 610  : 					"SELECT DISTINCT TLink.IdField,TVal.TxtValue FROM TLink \n"
; 611  : 					"INNER JOIN TVal ON TLink.IdValue=TVal.IdValue \n"
; 612  : 					"WHERE TLink.IdObj=%s AND TLink.DateDel IS NULL AND TLink.IdField IN (%lu,%lu) \n",
; 613  : 				dyntab_val(&lignfact, j, 0),
; 614  : 				cf->val_QTE_FACTURE, cf->val_QTE_CORRECTION);

	mov	edx, DWORD PTR _cf$[ebp]
	mov	eax, DWORD PTR [edx+44]
	push	eax
	mov	ecx, DWORD PTR _cf$[ebp]
	mov	edx, DWORD PTR [ecx+40]
	push	edx
	push	0
	mov	eax, DWORD PTR _j$[ebp]
	push	eax
	lea	ecx, DWORD PTR _lignfact$[ebp]
	push	ecx
	call	_dyntab_val
	add	esp, 12					; 0000000cH
	push	eax
	push	OFFSET FLAT:$SG70621
	push	2048					; 00000800H
	lea	edx, DWORD PTR _qry$[ebp]
	push	edx
	call	__snprintf
	add	esp, 24					; 00000018H

; 615  : 			if(sql_exec_query(cntxt, qry) || sql_get_table(cntxt, &data, 2)) STACK_ERROR;

	lea	eax, DWORD PTR _qry$[ebp]
	push	eax
	mov	ecx, DWORD PTR _cntxt$[ebp]
	push	ecx
	call	_sql_exec_query
	add	esp, 8
	test	eax, eax
	jne	SHORT $L70623
	push	2
	lea	edx, DWORD PTR _data$[ebp]
	push	edx
	mov	eax, DWORD PTR _cntxt$[ebp]
	push	eax
	call	_sql_get_table
	add	esp, 12					; 0000000cH
	test	eax, eax
	je	SHORT $L70622
$L70623:
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 615		; 00000267H
	jmp	$eva_err$70615
$L70622:

; 616  : 
; 617  : 			/* Arret si correction - decompte à partir du mois suivant */
; 618  : 			if(data.nbrows > 1 || DYNTAB_TOUL(&data) == cf->val_QTE_CORRECTION)

	cmp	DWORD PTR _data$[ebp], 1
	ja	SHORT $L70626
	push	10					; 0000000aH
	push	0
	push	0
	push	0
	lea	edx, DWORD PTR _data$[ebp]
	push	edx
	call	_dyntab_val
	add	esp, 12					; 0000000cH
	push	eax
	call	_strtoul
	add	esp, 12					; 0000000cH
	mov	ecx, DWORD PTR _cf$[ebp]
	cmp	eax, DWORD PTR [ecx+44]
	jne	SHORT $L70625
$L70626:

; 620  : 				delay_to_datetxt(datetmp, dyntab_val(&lignfact, j, 2), 1, 'M');

	push	77					; 0000004dH
	push	1
	push	2
	mov	edx, DWORD PTR _j$[ebp]
	push	edx
	lea	eax, DWORD PTR _lignfact$[ebp]
	push	eax
	call	_dyntab_val
	add	esp, 12					; 0000000cH
	push	eax
	lea	ecx, DWORD PTR _datetmp$[ebp]
	push	ecx
	call	_delay_to_datetxt
	add	esp, 16					; 00000010H

; 621  : 				dfact0 = datetmp;

	lea	edx, DWORD PTR _datetmp$[ebp]
	mov	DWORD PTR _dfact0$[ebp], edx

; 622  : 				break;

	jmp	SHORT $L70620
$L70625:

; 624  : 
; 625  : 			/* Total de jours facturés */
; 626  : 			tot_fact += DYNTAB_TOULRC(&data, 0, 1);

	push	10					; 0000000aH
	push	0
	push	1
	push	0
	lea	eax, DWORD PTR _data$[ebp]
	push	eax
	call	_dyntab_val
	add	esp, 12					; 0000000cH
	push	eax
	call	_strtoul
	add	esp, 12					; 0000000cH
	mov	ecx, DWORD PTR _tot_fact$[ebp]
	add	ecx, eax
	mov	DWORD PTR _tot_fact$[ebp], ecx

; 627  : 		}

	jmp	$L70619
$L70620:

; 628  : 
; 629  : 		/* Calcul du début de la période à régulariser */
; 630  : 		if(!dfact0) dfact0 = dyntab_val(&lignfact, lignfact.nbrows - 1, 2);

	cmp	DWORD PTR _dfact0$[ebp], 0
	jne	SHORT $L70628
	push	2
	mov	edx, DWORD PTR _lignfact$[ebp]
	sub	edx, 1
	push	edx
	lea	eax, DWORD PTR _lignfact$[ebp]
	push	eax
	call	_dyntab_val
	add	esp, 12					; 0000000cH
	mov	DWORD PTR _dfact0$[ebp], eax
$L70628:

; 631  : 		if(strcmp(dfact0, datedeb) < 0) dfact0 = datedeb;

	mov	ecx, DWORD PTR _datedeb$[ebp]
	push	ecx
	mov	edx, DWORD PTR _dfact0$[ebp]
	push	edx
	call	_strcmp
	add	esp, 8
	test	eax, eax
	jge	SHORT $L70629
	mov	eax, DWORD PTR _datedeb$[ebp]
	mov	DWORD PTR _dfact0$[ebp], eax
$L70629:

; 632  : 
; 633  : 		/* Régularisation uniquement à partir de 2004 */
; 634  : 		if(strcmp(dfact0, "2004") > 0)

	push	OFFSET FLAT:$SG70631
	mov	ecx, DWORD PTR _dfact0$[ebp]
	push	ecx
	call	_strcmp
	add	esp, 8
	test	eax, eax
	jle	SHORT $L70630

; 636  : 			/* Calcul nb de jours à facturer sur la période à régulariser */
; 637  : 			int a_fact = strcmp(dfact0, dfin) < 0 ? datetxt_to_age(dfact0, dfin, &fmt) : 0;

	mov	edx, DWORD PTR _dfin$[ebp]
	push	edx
	mov	eax, DWORD PTR _dfact0$[ebp]
	push	eax
	call	_strcmp
	add	esp, 8
	test	eax, eax
	jge	SHORT $L71256
	lea	ecx, DWORD PTR _fmt$[ebp]
	push	ecx
	mov	edx, DWORD PTR _dfin$[ebp]
	push	edx
	mov	eax, DWORD PTR _dfact0$[ebp]
	push	eax
	call	_datetxt_to_age
	add	esp, 12					; 0000000cH
	mov	DWORD PTR -2144+[ebp], eax
	jmp	SHORT $L71257
$L71256:
	mov	DWORD PTR -2144+[ebp], 0
$L71257:
	mov	ecx, DWORD PTR -2144+[ebp]
	mov	DWORD PTR _a_fact$70632[ebp], ecx

; 638  : 			*nbjcorr = (a_fact > 0 ? a_fact : 0) - tot_fact - nbjours;

	xor	edx, edx
	cmp	DWORD PTR _a_fact$70632[ebp], 0
	setle	dl
	dec	edx
	and	edx, DWORD PTR _a_fact$70632[ebp]
	sub	edx, DWORD PTR _tot_fact$[ebp]
	sub	edx, DWORD PTR _nbjours$[ebp]
	mov	eax, DWORD PTR _nbjcorr$[ebp]
	mov	DWORD PTR [eax], edx
$L70630:

; 641  : 	/* Calcul sur l'ensemble des factures */
; 642  : 	else

	jmp	$eva_noerr$70617
$L70610:

; 644  : 		/* Lecture des totaux de facturation pour la mesure */
; 645  : 		int a_fact = datetxt_to_age(datedeb, dfin, &fmt);

	lea	ecx, DWORD PTR _fmt$[ebp]
	push	ecx
	mov	edx, DWORD PTR _dfin$[ebp]
	push	edx
	mov	eax, DWORD PTR _datedeb$[ebp]
	push	eax
	call	_datetxt_to_age
	add	esp, 12					; 0000000cH
	mov	DWORD PTR _a_fact$70634[ebp], eax

; 646  : 		snprintf(qry, sizeof(qry),
; 647  : 				"SELECT SUM(TVal.TxtValue) FROM TLink AS TLink0 \n"
; 648  : 				"INNER JOIN TLink AS TLink1 ON TLink0.IdObj=TLink1.IdObj \n"
; 649  : 				"INNER JOIN TLink AS TLink2 ON TLink0.IdObj=TLink2.IdObj \n"
; 650  : 				"INNER JOIN TVal ON TLink2.IdValue=TVal.IdValue \n"
; 651  : 				"WHERE TLink0.DateDel IS NULL AND TLink0.IdField=%lu AND TLink0.IdRelObj=%lu AND TLink0.IdObj<>%lu\n"
; 652  : 				"AND TLink1.DateDel IS NULL AND TLink1.IdField=%lu AND TLink1.IdRelObj=%lu \n"
; 653  : 				"AND TLink2.DateDel IS NULL AND TLink2.IdField IN(%lu,%lu)",
; 654  : 			cf->val_FORMSTAMP, cf->form_LigneFacture, idlignefact,
; 655  : 			cf->val_MES_LIGNE_FACT, idmesure,
; 656  : 			cf->val_QTE_FACTURE, cf->val_QTE_CORRECTION);

	mov	ecx, DWORD PTR _cf$[ebp]
	mov	edx, DWORD PTR [ecx+44]
	push	edx
	mov	eax, DWORD PTR _cf$[ebp]
	mov	ecx, DWORD PTR [eax+40]
	push	ecx
	mov	edx, DWORD PTR _idmesure$[ebp]
	push	edx
	mov	eax, DWORD PTR _cf$[ebp]
	mov	ecx, DWORD PTR [eax+32]
	push	ecx
	mov	edx, DWORD PTR _idlignefact$[ebp]
	push	edx
	mov	eax, DWORD PTR _cf$[ebp]
	mov	ecx, DWORD PTR [eax+12]
	push	ecx
	mov	edx, DWORD PTR _cf$[ebp]
	mov	eax, DWORD PTR [edx+16]
	push	eax
	push	OFFSET FLAT:$SG70635
	push	2048					; 00000800H
	lea	ecx, DWORD PTR _qry$[ebp]
	push	ecx
	call	__snprintf
	add	esp, 40					; 00000028H

; 657  : 		if(sql_exec_query(cntxt, qry) || sql_get_table(cntxt, &data, 2)) STACK_ERROR;

	lea	edx, DWORD PTR _qry$[ebp]
	push	edx
	mov	eax, DWORD PTR _cntxt$[ebp]
	push	eax
	call	_sql_exec_query
	add	esp, 8
	test	eax, eax
	jne	SHORT $L70637
	push	2
	lea	ecx, DWORD PTR _data$[ebp]
	push	ecx
	mov	edx, DWORD PTR _cntxt$[ebp]
	push	edx
	call	_sql_get_table
	add	esp, 12					; 0000000cH
	test	eax, eax
	je	SHORT $L70636
$L70637:
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 657		; 00000291H
	jmp	SHORT $eva_err$70615
$L70636:

; 658  : 		tot_fact = DYNTAB_TOUL(&data);

	push	10					; 0000000aH
	push	0
	push	0
	push	0
	lea	ecx, DWORD PTR _data$[ebp]
	push	ecx
	call	_dyntab_val
	add	esp, 12					; 0000000cH
	push	eax
	call	_strtoul
	add	esp, 12					; 0000000cH
	mov	DWORD PTR _tot_fact$[ebp], eax

; 659  : 		*nbjcorr = (a_fact > 0 ? a_fact : 0) - tot_fact - nbjours;

	xor	edx, edx
	cmp	DWORD PTR _a_fact$70634[ebp], 0
	setle	dl
	dec	edx
	and	edx, DWORD PTR _a_fact$70634[ebp]
	sub	edx, DWORD PTR _tot_fact$[ebp]
	sub	edx, DWORD PTR _nbjours$[ebp]
	mov	eax, DWORD PTR _nbjcorr$[ebp]
	mov	DWORD PTR [eax], edx
$eva_noerr$70617:

; 661  : 
; 662  : 	RETURN_OK_CLEANUP;

	push	0
	push	OFFSET FLAT:$SG70639
	push	OFFSET FLAT:$SG70640
	mov	ecx, DWORD PTR _cntxt$[ebp]
	push	ecx
	call	_err_clear
	add	esp, 16					; 00000010H
$eva_err$70615:
	mov	edx, DWORD PTR _cntxt$[ebp]
	cmp	DWORD PTR [edx+29872], 0
	je	SHORT $L70641
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	ecx, DWORD PTR [eax+29900]
	push	ecx
	push	OFFSET FLAT:$SG70642
	push	OFFSET FLAT:$SG70643
	mov	edx, DWORD PTR _cntxt$[ebp]
	push	edx
	call	_err_add_context
	add	esp, 16					; 00000010H
$L70641:
	lea	eax, DWORD PTR _lignfact$[ebp]
	push	eax
	call	_dyntab_free
	add	esp, 4
	lea	ecx, DWORD PTR _data$[ebp]
	push	ecx
	call	_dyntab_free
	add	esp, 4
	mov	edx, DWORD PTR _cntxt$[ebp]
	xor	eax, eax
	cmp	DWORD PTR [edx+29872], 0
	setne	al

; 663  : }

	pop	edi
	mov	esp, ebp
	pop	ebp
	ret	0
_calc_jcor_AEMO ENDP
_TEXT	ENDS
PUBLIC	_FactureAEMO
EXTRN	_form_eval_fieldexpr:NEAR
EXTRN	_datetxt_to_format:NEAR
EXTRN	_sql_control:NEAR
EXTRN	_mem_free:NEAR
EXTRN	_qry_obj_idfield:NEAR
EXTRN	_dynbuf_add:NEAR
EXTRN	_qry_add_new_obj:NEAR
EXTRN	_dynbuf_add3_int:NEAR
EXTRN	_dyntab_cell:NEAR
EXTRN	_dyntab_copy:NEAR
EXTRN	_strcpy:NEAR
EXTRN	_dyntab_add:NEAR
EXTRN	_dyntab_filter_field:NEAR
EXTRN	_dyntab_field_cell:NEAR
_BSS	SEGMENT
	ALIGN	4

$SG70845 DB	01H DUP (?)
	ALIGN	4

$SG70849 DB	01H DUP (?)
	ALIGN	4

$SG70855 DB	01H DUP (?)
_BSS	ENDS
_DATA	SEGMENT
	ORG $+1
$SG70667 DB	0aH, '**** Traitement non effectu', 0e9H, 0aH, '  -> Enre'
	DB	'gistrez d''abord la facture', 0aH, 00H
	ORG $+1
$SG70669 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70677 DB	'MAX(<-_EVA_FORMSTAMP->DATE_FACTURE)', 00H
$SG70681 DB	0aH, '**** Traitement refus', 0e9H, ' : vous n''', 0eaH, 't'
	DB	'es pas sur la derni', 0e8H, 're facture', 0aH, 00H
	ORG $+1
$SG70683 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70705 DB	'FFFFFF', 00H
	ORG $+1
$SG70708 DB	'SELECT TLink0.IdObj AS IdObj,TLink0.Num AS Num FROM TLin'
	DB	'k AS TLink0 ', 0aH, 'INNER JOIN TLink AS TLink1 ON TLink0.IdO'
	DB	'bj=TLink1.IdObj ', 0aH, 'INNER JOIN TLink AS TLink2 ON TLink0'
	DB	'.IdObj=TLink2.IdObj ', 0aH, 'WHERE TLink0.DateDel IS NULL AND'
	DB	' TLink0.IdRelObj=%lu AND TLink0.IdField=%lu ', 0aH, 'AND TLin'
	DB	'k1.DateDel IS NULL AND TLink1.IdField=%lu AND TLink1.IdRelObj'
	DB	'=%lu ', 0aH, 'AND TLink2.DateDel IS NULL AND TLink2.IdField=%'
	DB	'lu AND TLink2.IdRelObj=%lu ', 0aH, 'GROUP BY IdObj ORDER BY I'
	DB	'dObj DESC', 00H
	ORG $+3
$SG70714 DB	'CALC_MANUEL', 00H
$SG70717 DB	'JOURS_FACT', 00H
	ORG $+1
$SG70719 DB	'JOURS_CORRECTION', 00H
	ORG $+3
$SG70722 DB	'MOTIF_CORRECTION', 00H
	ORG $+3
$SG70724 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70726 DB	'DEST_FACTURE', 00H
	ORG $+3
$SG70729 DB	'DateManuelle', 00H
	ORG $+3
$SG70731 DB	'MOTIF_FACT_MANUELLE', 00H
$SG70735 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70738 DB	'DateRecept', 00H
	ORG $+1
$SG70741 DB	'DateEffet', 00H
	ORG $+2
$SG70749 DB	'R', 0e9H, 'gularisation 1er mois', 00H
$SG70751 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70759 DB	'A', 00H
	ORG $+2
$SG70764 DB	'DateManuelle', 00H
	ORG $+3
$SG70765 DB	'2003', 00H
	ORG $+3
$SG70767 DB	'Maintien en attente de jugement', 00H
$SG70769 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70770 DB	'Maintien', 00H
	ORG $+3
$SG70771 DB	'#FF8888', 00H
$SG70773 DB	'Archiv', 0e9H, 'e', 00H
	ORG $+3
$SG70774 DB	'#CCCCFF', 00H
$SG70777 DB	'En attente', 00H
	ORG $+1
$SG70778 DB	'#FFCCCC', 00H
$SG70780 DB	'En cours', 00H
	ORG $+3
$SG70781 DB	'#CCFFCC', 00H
$SG70784 DB	'Attente affectation TS', 00H
	ORG $+1
$SG70786 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70804 DB	'j', 00H
	ORG $+2
$SG70805 DB	'Correction ', 00H
$SG70807 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70810 DB	'Prise en charge', 00H
$SG70811 DB	'Main lev', 0e9H, 'e', 00H
	ORG $+1
$SG70812 DB	'Maintien', 00H
	ORG $+3
$SG70813 DB	'%s ', 0e0H, '/c du %s', 00H
	ORG $+3
$SG70815 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70820 DB	'Prise en charge le %s', 00H
	ORG $+2
$SG70822 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70827 DB	'Fin de prise en charge le %s', 00H
	ORG $+3
$SG70829 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70833 DB	'<table border=0 cellpadding=1 cellspacing=0 width=800><t'
	DB	'r>', 00H
	ORG $+1
$SG70834 DB	'<td width=150><font size=-1>%s %s</td>', 00H
	ORG $+1
$SG70835 DB	'<td width=80 align=right><font size=-1>', 00H
$SG70837 DB	'%.2s/%.2s/%.4s', 00H
	ORG $+1
$SG70838 DB	'</td><td width=10 align=center>-</td><td width=80><font '
	DB	'size=-1>', 00H
	ORG $+3
$SG70840 DB	'%.2s/%.2s/%.4s', 00H
	ORG $+1
$SG70841 DB	'</td>', 00H
	ORG $+2
$SG70843 DB	'<td width=120><font size=-2>%s</td>', 00H
$SG70844 DB	'<td width=30 align=right>%d</td><td width=10>j</td><td w'
	DB	'idth=50>%+d</td>', 00H
	ORG $+3
$SG70846 DB	'<td width=60><font size=-2>%s</td>', 00H
	ORG $+1
$SG70847 DB	'<td width=80 bgcolor=%s><font size=-1>%s</td>', 00H
	ORG $+2
$SG70848 DB	' bgcolor=#FFDDBB', 00H
	ORG $+3
$SG70850 DB	'<td%s><font size=-2><b>', 00H
$SG70854 DB	', ', 00H
	ORG $+1
$SG70856 DB	'%s%s', 00H
	ORG $+3
$SG70858 DB	'<br>%s', 00H
	ORG $+1
$SG70859 DB	'</b></font></td>', 00H
	ORG $+3
$SG70860 DB	'</tr></table>', 00H
	ORG $+2
$SG70874 DB	'UPDATE TLink SET DateDel=''%s'',IdWhoDel=%lu WHERE DateD'
	DB	'el IS NULL AND IdObj=%lu', 00H
	ORG $+1
$SG70894 DB	'%d', 00H
	ORG $+1
$SG70902 DB	'%d', 00H
	ORG $+1
$SG70910 DB	'</table><br><br><table border=1 rules=none width=100%%><'
	DB	'tr><td align=center>%lu mesures examin', 0e9H, 'es<br>%lu mes'
	DB	'ures modifi', 0e9H, 'es<br>%lu mesures factur', 0e9H, 'es</td'
	DB	'></tr><tr><td align=center><font size=-1><i>Utilisez la comma'
	DB	'nde Fichier/Enregistrer de votre navigateur si vous voulez co'
	DB	'nserver ce journal</td></tr><tr><td align=center><br><input t'
	DB	'ype=submit value=''Revenir ', 0e0H, ' la facture'' name=''B$#'
	DB	'NOP''></td></tr></table>', 0aH, '<script>document.mainform['''
	DB	'B$#NOP''].focus();</script>', 00H
	ORG $+3
$SG70911 DB	'D:\Travail\ABI\EVA\V4.0\CGI\Brunix-2016\dll_adsea01.c', 00H
	ORG $+2
$SG70912 DB	'FactureAEMO', 00H
$SG70914 DB	'D:\Travail\ABI\EVA\V4.0\CGI\Brunix-2016\dll_adsea01.c', 00H
	ORG $+2
$SG70915 DB	'FactureAEMO', 00H
_DATA	ENDS
_TEXT	SEGMENT
_data$ = -2072
_qry$ = -2048
__cf$ = -2356
_cf$ = -2360
_i$ = -2364
_j$ = -2368
_txt$ = -2104
_idmesure$70687 = -2484
_idlignefact$70688 = -2524
_iddest$70689 = -2520
_datedeb$70690 = -2480
_datefin$70691 = -2468
_majorite$70692 = -2512
_datedebcor$70693 = -2540
_datefincor$70694 = -2508
_modefact$70695 = -2548
_mindeb$70696 = -2460
_maxfin$70697 = -2476
_nbjours$70698 = -2488
_nbjcorr$70699 = -2472
_b_calcmanuel$70700 = -2492
_statut$70701 = -2544
_valstatut$70702 = -2556
_nouvstatut$70703 = -2464
_bgcolor$70704 = -2516
_val$70706 = -2456
_ano$70707 = -2552
_buf$70799 = -2812
_d$70800 = -2844
_b_new$70801 = -2848
_cntxt$ = 8
_i_ctrl$ = 12
_form$ = -2052
_lignfact$ = -2388
_msg$ = -2392
_FactureAEMO PROC NEAR

; 678  : ){

	push	ebp
	mov	ebp, esp
	sub	esp, 2904				; 00000b58H
	push	esi
	push	edi

; 679  : 	EVA_form *form = cntxt->form;

	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	ecx, DWORD PTR [eax+80]
	mov	DWORD PTR _form$[ebp], ecx

; 680  : 	DynTable lignfact = { 0 };

	mov	DWORD PTR _lignfact$[ebp], 0
	xor	edx, edx
	mov	DWORD PTR _lignfact$[ebp+4], edx
	mov	DWORD PTR _lignfact$[ebp+8], edx
	mov	DWORD PTR _lignfact$[ebp+12], edx
	mov	DWORD PTR _lignfact$[ebp+16], edx

; 681  : 	DynBuffer *msg = NULL;

	mov	DWORD PTR _msg$[ebp], 0

; 682  : 	DynTable data = { 0 };

	mov	DWORD PTR _data$[ebp], 0
	xor	eax, eax
	mov	DWORD PTR _data$[ebp+4], eax
	mov	DWORD PTR _data$[ebp+8], eax
	mov	DWORD PTR _data$[ebp+12], eax
	mov	DWORD PTR _data$[ebp+16], eax

; 683  : 	char qry[2048] = {0};

	mov	BYTE PTR _qry$[ebp], 0
	mov	ecx, 511				; 000001ffH
	xor	eax, eax
	lea	edi, DWORD PTR _qry$[ebp+1]
	rep stosd
	stosw
	stosb

; 684  : 	cntxt_fact _cf = {0}, *cf = &_cf;

	mov	DWORD PTR __cf$[ebp], 0
	mov	ecx, 62					; 0000003eH
	xor	eax, eax
	lea	edi, DWORD PTR __cf$[ebp+4]
	rep stosd
	lea	ecx, DWORD PTR __cf$[ebp]
	mov	DWORD PTR _cf$[ebp], ecx

; 685  : 	unsigned long i, j;
; 686  : 	char txt[32];
; 687  : 
; 688  : 	/* Inhibit warning for unused param */
; 689  : 	i_ctrl = 0;

	mov	DWORD PTR _i_ctrl$[ebp], 0

; 690  : 
; 691  : 	/* Retour si facture non enregistree */
; 692  : 	if(!dyntab_sz(&form->id_obj, 0, 0))

	push	0
	push	0
	mov	edx, DWORD PTR _form$[ebp]
	add	edx, 32					; 00000020H
	push	edx
	call	_dyntab_sz
	add	esp, 12					; 0000000cH
	test	eax, eax
	jne	SHORT $L70664

; 694  : 		DYNBUF_ADD_STR(&cntxt->debug_msg, "\n**** Traitement non effectué\n  -> Enregistrez d'abord la facture\n");

	push	0
	push	0
	push	66					; 00000042H
	push	OFFSET FLAT:$SG70667
	mov	eax, DWORD PTR _cntxt$[ebp]
	add	eax, 29864				; 000074a8H
	push	eax
	call	_dynbuf_add
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L70666
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29872], OFFSET FLAT:$SG70669
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 694		; 000002b6H
	jmp	$eva_err$70670
$L70666:

; 695  : 		RETURN_OK;

	jmp	$eva_noerr$70671
$L70664:

; 697  : 
; 698  : 	/* Preparation des donnees de facturation */
; 699  : 	cf->idfacture = DYNTAB_TOUL(&form->id_obj);

	push	10					; 0000000aH
	push	0
	push	0
	push	0
	mov	eax, DWORD PTR _form$[ebp]
	add	eax, 32					; 00000020H
	push	eax
	call	_dyntab_val
	add	esp, 12					; 0000000cH
	push	eax
	call	_strtoul
	add	esp, 12					; 0000000cH
	mov	ecx, DWORD PTR _cf$[ebp]
	mov	DWORD PTR [ecx+4], eax

; 700  : 	if(Init_AEMO(cntxt, cf) || Entete_journal(cntxt, cf)) STACK_ERROR;

	mov	edx, DWORD PTR _cf$[ebp]
	push	edx
	mov	eax, DWORD PTR _cntxt$[ebp]
	push	eax
	call	_Init_AEMO
	add	esp, 8
	test	eax, eax
	jne	SHORT $L70674
	mov	ecx, DWORD PTR _cf$[ebp]
	push	ecx
	mov	edx, DWORD PTR _cntxt$[ebp]
	push	edx
	call	_Entete_journal
	add	esp, 8
	test	eax, eax
	je	SHORT $L70673
$L70674:
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 700		; 000002bcH
	jmp	$eva_err$70670
$L70673:

; 701  : 
; 702  : 	/* Retour si pas dernière facture */
; 703  : 	if(form_eval_fieldexpr(cntxt, &data, 0, 27461, add_sz_str("MAX(<-_EVA_FORMSTAMP->DATE_FACTURE)"), NULL, 0)) STACK_ERROR;

	push	0
	push	0
	push	35					; 00000023H
	push	OFFSET FLAT:$SG70677
	push	27461					; 00006b45H
	push	0
	lea	ecx, DWORD PTR _data$[ebp]
	push	ecx
	mov	edx, DWORD PTR _cntxt$[ebp]
	push	edx
	call	_form_eval_fieldexpr
	add	esp, 32					; 00000020H
	test	eax, eax
	je	SHORT $L70676
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 703		; 000002bfH
	jmp	$eva_err$70670
$L70676:

; 704  : 	if(strcmp(dyntab_val(&data, 0, 0), cf->datedebmois) > 0)

	mov	ecx, DWORD PTR _cf$[ebp]
	add	ecx, 168				; 000000a8H
	push	ecx
	push	0
	push	0
	lea	edx, DWORD PTR _data$[ebp]
	push	edx
	call	_dyntab_val
	add	esp, 12					; 0000000cH
	push	eax
	call	_strcmp
	add	esp, 8
	test	eax, eax
	jle	SHORT $L70678

; 706  : 		DYNBUF_ADD_STR(&cntxt->debug_msg, "\n**** Traitement refusé : vous n'êtes pas sur la dernière facture\n");

	push	0
	push	0
	push	66					; 00000042H
	push	OFFSET FLAT:$SG70681
	mov	eax, DWORD PTR _cntxt$[ebp]
	add	eax, 29864				; 000074a8H
	push	eax
	call	_dynbuf_add
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L70680
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29872], OFFSET FLAT:$SG70683
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 706		; 000002c2H
	jmp	$eva_err$70670
$L70680:

; 707  : 		RETURN_OK;

	jmp	$eva_noerr$70671
$L70678:

; 709  : 
; 710  : 	/* Pour chaque mesure en cours */
; 711  : 	for(i = 0; i < cf->nb_mes; i++)

	mov	DWORD PTR _i$[ebp], 0
	jmp	SHORT $L70684
$L70685:
	mov	eax, DWORD PTR _i$[ebp]
	add	eax, 1
	mov	DWORD PTR _i$[ebp], eax
$L70684:
	mov	ecx, DWORD PTR _cf$[ebp]
	mov	edx, DWORD PTR _i$[ebp]
	cmp	edx, DWORD PTR [ecx+244]
	jae	$L70686

; 713  : 		unsigned long idmesure = cf->mes[i].id, idlignefact = 0, iddest = cf->mes[i].dest;

	mov	eax, DWORD PTR _i$[ebp]
	imul	eax, 168				; 000000a8H
	mov	ecx, DWORD PTR _cf$[ebp]
	mov	edx, DWORD PTR [ecx+248]
	mov	eax, DWORD PTR [edx+eax]
	mov	DWORD PTR _idmesure$70687[ebp], eax
	mov	DWORD PTR _idlignefact$70688[ebp], 0
	mov	ecx, DWORD PTR _i$[ebp]
	imul	ecx, 168				; 000000a8H
	mov	edx, DWORD PTR _cf$[ebp]
	mov	eax, DWORD PTR [edx+248]
	mov	ecx, DWORD PTR [eax+ecx+160]
	mov	DWORD PTR _iddest$70689[ebp], ecx

; 714  : 		char *datedeb = cf->mes[i].deb;

	mov	edx, DWORD PTR _i$[ebp]
	imul	edx, 168				; 000000a8H
	mov	eax, DWORD PTR _cf$[ebp]
	mov	ecx, DWORD PTR [eax+248]
	lea	edx, DWORD PTR [ecx+edx+4]
	mov	DWORD PTR _datedeb$70690[ebp], edx

; 715  : 		char *datefin = cf->mes[i].fin;

	mov	eax, DWORD PTR _i$[ebp]
	imul	eax, 168				; 000000a8H
	mov	ecx, DWORD PTR _cf$[ebp]
	mov	edx, DWORD PTR [ecx+248]
	lea	eax, DWORD PTR [edx+eax+14]
	mov	DWORD PTR _datefin$70691[ebp], eax

; 716  : 		char *majorite = cf->mes[i].majorite;

	mov	ecx, DWORD PTR _i$[ebp]
	imul	ecx, 168				; 000000a8H
	mov	edx, DWORD PTR _cf$[ebp]
	mov	eax, DWORD PTR [edx+248]
	lea	ecx, DWORD PTR [eax+ecx+24]
	mov	DWORD PTR _majorite$70692[ebp], ecx

; 717  : 		char datedebcor[16] = {0}, datefincor[16] = {0};

	mov	BYTE PTR _datedebcor$70693[ebp], 0
	xor	edx, edx
	mov	DWORD PTR _datedebcor$70693[ebp+1], edx
	mov	DWORD PTR _datedebcor$70693[ebp+5], edx
	mov	DWORD PTR _datedebcor$70693[ebp+9], edx
	mov	WORD PTR _datedebcor$70693[ebp+13], dx
	mov	BYTE PTR _datedebcor$70693[ebp+15], dl
	mov	BYTE PTR _datefincor$70694[ebp], 0
	xor	eax, eax
	mov	DWORD PTR _datefincor$70694[ebp+1], eax
	mov	DWORD PTR _datefincor$70694[ebp+5], eax
	mov	DWORD PTR _datefincor$70694[ebp+9], eax
	mov	WORD PTR _datefincor$70694[ebp+13], ax
	mov	BYTE PTR _datefincor$70694[ebp+15], al

; 718  : 		char *modefact = cf->mes[i].modefact, *mindeb, *maxfin;

	mov	ecx, DWORD PTR _i$[ebp]
	imul	ecx, 168				; 000000a8H
	mov	edx, DWORD PTR _cf$[ebp]
	mov	eax, DWORD PTR [edx+248]
	lea	ecx, DWORD PTR [eax+ecx+100]
	mov	DWORD PTR _modefact$70695[ebp], ecx

; 719  : 		int nbjours = cf->nbjoursmois, nbjcorr = 0, b_calcmanuel;

	mov	edx, DWORD PTR _cf$[ebp]
	mov	eax, DWORD PTR [edx+188]
	mov	DWORD PTR _nbjours$70698[ebp], eax
	mov	DWORD PTR _nbjcorr$70699[ebp], 0

; 720  : 		unsigned long statut;
; 721  : 		char *valstatut = cf->mes[i].statfact, *nouvstatut, *bgcolor = "FFFFFF";

	mov	ecx, DWORD PTR _i$[ebp]
	imul	ecx, 168				; 000000a8H
	mov	edx, DWORD PTR _cf$[ebp]
	mov	eax, DWORD PTR [edx+248]
	lea	ecx, DWORD PTR [eax+ecx+72]
	mov	DWORD PTR _valstatut$70702[ebp], ecx
	mov	DWORD PTR _bgcolor$70704[ebp], OFFSET FLAT:$SG70705

; 722  : 		DynTableCell val = {0};

	mov	DWORD PTR _val$70706[ebp], 0
	mov	ecx, 15					; 0000000fH
	xor	eax, eax
	lea	edi, DWORD PTR _val$70706[ebp+4]
	rep stosd

; 723  : 		DynTable *ano = &cf->mes[i].notes;

	mov	edx, DWORD PTR _i$[ebp]
	imul	edx, 168				; 000000a8H
	mov	eax, DWORD PTR _cf$[ebp]
	mov	ecx, DWORD PTR [eax+248]
	lea	edx, DWORD PTR [ecx+edx+52]
	mov	DWORD PTR _ano$70707[ebp], edx

; 724  : 
; 725  : 		/* RAZ message pour la mesure */
; 726  : 		M_FREE(msg);

	mov	eax, DWORD PTR _msg$[ebp]
	push	eax
	call	_mem_free
	add	esp, 4
	mov	DWORD PTR _msg$[ebp], 0

; 727  : 
; 728  : 		/* Recherche si une ligne existe deja pour cette mesure dans la facture */
; 729  : 		snprintf(qry, sizeof(qry),
; 730  : 				"SELECT TLink0.IdObj AS IdObj,TLink0.Num AS Num FROM TLink AS TLink0 \n"
; 731  : 				"INNER JOIN TLink AS TLink1 ON TLink0.IdObj=TLink1.IdObj \n"
; 732  : 				"INNER JOIN TLink AS TLink2 ON TLink0.IdObj=TLink2.IdObj \n"
; 733  : 				"WHERE TLink0.DateDel IS NULL AND TLink0.IdRelObj=%lu AND TLink0.IdField=%lu \n"
; 734  : 				"AND TLink1.DateDel IS NULL AND TLink1.IdField=%lu AND TLink1.IdRelObj=%lu \n"
; 735  : 				"AND TLink2.DateDel IS NULL AND TLink2.IdField=%lu AND TLink2.IdRelObj=%lu \n"
; 736  : 				"GROUP BY IdObj ORDER BY IdObj DESC",
; 737  : 			cf->form_LigneFacture, cf->val_FORMSTAMP, cf->val_MES_LIGNE_FACT, idmesure, cf->val_FACTURE, cf->idfacture);

	mov	ecx, DWORD PTR _cf$[ebp]
	mov	edx, DWORD PTR [ecx+4]
	push	edx
	mov	eax, DWORD PTR _cf$[ebp]
	mov	ecx, DWORD PTR [eax+28]
	push	ecx
	mov	edx, DWORD PTR _idmesure$70687[ebp]
	push	edx
	mov	eax, DWORD PTR _cf$[ebp]
	mov	ecx, DWORD PTR [eax+32]
	push	ecx
	mov	edx, DWORD PTR _cf$[ebp]
	mov	eax, DWORD PTR [edx+16]
	push	eax
	mov	ecx, DWORD PTR _cf$[ebp]
	mov	edx, DWORD PTR [ecx+12]
	push	edx
	push	OFFSET FLAT:$SG70708
	push	2048					; 00000800H
	lea	eax, DWORD PTR _qry$[ebp]
	push	eax
	call	__snprintf
	add	esp, 36					; 00000024H

; 738  : 		if(sql_exec_query(cntxt, qry) || sql_get_table(cntxt, &data, 2)) STACK_ERROR;

	lea	ecx, DWORD PTR _qry$[ebp]
	push	ecx
	mov	edx, DWORD PTR _cntxt$[ebp]
	push	edx
	call	_sql_exec_query
	add	esp, 8
	test	eax, eax
	jne	SHORT $L70710
	push	2
	lea	eax, DWORD PTR _data$[ebp]
	push	eax
	mov	ecx, DWORD PTR _cntxt$[ebp]
	push	ecx
	call	_sql_get_table
	add	esp, 12					; 0000000cH
	test	eax, eax
	je	SHORT $L70709
$L70710:
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 738		; 000002e2H
	jmp	$eva_err$70670
$L70709:

; 739  : 		idlignefact = DYNTAB_TOUL(&data);

	push	10					; 0000000aH
	push	0
	push	0
	push	0
	lea	eax, DWORD PTR _data$[ebp]
	push	eax
	call	_dyntab_val
	add	esp, 12					; 0000000cH
	push	eax
	call	_strtoul
	add	esp, 12					; 0000000cH
	mov	DWORD PTR _idlignefact$70688[ebp], eax

; 740  : 
; 741  : 		/* Laisse du temps aux autres utilisateurs */
; 742  : 		sql_control(cntxt, -5);

	push	-5					; fffffffbH
	mov	ecx, DWORD PTR _cntxt$[ebp]
	push	ecx
	call	_sql_control
	add	esp, 8

; 743  : 
; 744  : 		/* Si plus d'une ligne : ne touche à rien */
; 745  : 		if(data.nbrows > 1) continue;

	cmp	DWORD PTR _data$[ebp], 1
	jbe	SHORT $L70712
	jmp	$L70685
$L70712:

; 746  : 
; 747  : 		/* Lecture des donnees de la ligne */
; 748  : 		DYNTAB_FREE(lignfact);

	lea	edx, DWORD PTR _lignfact$[ebp]
	push	edx
	call	_dyntab_free
	add	esp, 4

; 749  : 		if(idlignefact && qry_obj_idfield(cntxt, &lignfact, idlignefact, 0)) STACK_ERROR;

	cmp	DWORD PTR _idlignefact$70688[ebp], 0
	je	SHORT $L70713
	push	0
	mov	eax, DWORD PTR _idlignefact$70688[ebp]
	push	eax
	lea	ecx, DWORD PTR _lignfact$[ebp]
	push	ecx
	mov	edx, DWORD PTR _cntxt$[ebp]
	push	edx
	call	_qry_obj_idfield
	add	esp, 16					; 00000010H
	test	eax, eax
	je	SHORT $L70713
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 749		; 000002edH
	jmp	$eva_err$70670
$L70713:

; 750  : 
; 751  : 		/* Gestion du mode de facturation */
; 752  : 		b_calcmanuel = idlignefact && dyntab_field_cell(&lignfact, "CALC_MANUEL", ~0UL, 0);

	cmp	DWORD PTR _idlignefact$70688[ebp], 0
	je	SHORT $L71259
	push	0
	push	-1
	push	OFFSET FLAT:$SG70714
	lea	ecx, DWORD PTR _lignfact$[ebp]
	push	ecx
	call	_dyntab_field_cell
	add	esp, 16					; 00000010H
	test	eax, eax
	je	SHORT $L71259
	mov	DWORD PTR -2852+[ebp], 1
	jmp	SHORT $L71260
$L71259:
	mov	DWORD PTR -2852+[ebp], 0
$L71260:
	mov	edx, DWORD PTR -2852+[ebp]
	mov	DWORD PTR _b_calcmanuel$70700[ebp], edx

; 753  : 		if(b_calcmanuel)

	cmp	DWORD PTR _b_calcmanuel$70700[ebp], 0
	je	$L70715

; 755  : 			/* Calcul manuel : lecture des données de la ligne */
; 756  : 			nbjours = strtoul(dyntab_field_val(&lignfact, "JOURS_FACT", ~0UL, 0), NULL, 10);

	push	10					; 0000000aH
	push	0
	push	0
	push	-1
	push	OFFSET FLAT:$SG70717
	lea	eax, DWORD PTR _lignfact$[ebp]
	push	eax
	call	_dyntab_field_val
	add	esp, 16					; 00000010H
	push	eax
	call	_strtoul
	add	esp, 12					; 0000000cH
	mov	DWORD PTR _nbjours$70698[ebp], eax

; 757  : 			nbjcorr = strtoul(dyntab_field_val(&lignfact, "JOURS_CORRECTION", ~0UL, 0), NULL, 10);

	push	10					; 0000000aH
	push	0
	push	0
	push	-1
	push	OFFSET FLAT:$SG70719
	lea	ecx, DWORD PTR _lignfact$[ebp]
	push	ecx
	call	_dyntab_field_val
	add	esp, 16					; 00000010H
	push	eax
	call	_strtoul
	add	esp, 12					; 0000000cH
	mov	DWORD PTR _nbjcorr$70699[ebp], eax

; 758  : 			if(dyntab_filter_field(ano, 0, &lignfact, "MOTIF_CORRECTION", ~0UL, NULL)) RETURN_ERR_MEMORY;

	push	0
	push	-1
	push	OFFSET FLAT:$SG70722
	lea	edx, DWORD PTR _lignfact$[ebp]
	push	edx
	push	0
	mov	eax, DWORD PTR _ano$70707[ebp]
	push	eax
	call	_dyntab_filter_field
	add	esp, 24					; 00000018H
	test	eax, eax
	je	SHORT $L70721
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29872], OFFSET FLAT:$SG70724
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 758		; 000002f6H
	jmp	$eva_err$70670
$L70721:

; 759  : 			iddest = strtoul(dyntab_field_val(&lignfact, "DEST_FACTURE", ~0UL, 0), NULL, 10);

	push	10					; 0000000aH
	push	0
	push	0
	push	-1
	push	OFFSET FLAT:$SG70726
	lea	eax, DWORD PTR _lignfact$[ebp]
	push	eax
	call	_dyntab_field_val
	add	esp, 16					; 00000010H
	push	eax
	call	_strtoul
	add	esp, 12					; 0000000cH
	mov	DWORD PTR _iddest$70689[ebp], eax

; 761  : 		else if(!strcmp(modefact, "DateManuelle"))

	jmp	$L70744
$L70715:
	push	OFFSET FLAT:$SG70729
	mov	ecx, DWORD PTR _modefact$70695[ebp]
	push	ecx
	call	_strcmp
	add	esp, 8
	test	eax, eax
	jne	$L70728

; 763  : 			if(qry_obj_field(cntxt, &data, idmesure, "MOTIF_FACT_MANUELLE")) STACK_ERROR;

	push	OFFSET FLAT:$SG70731
	mov	edx, DWORD PTR _idmesure$70687[ebp]
	push	edx
	lea	eax, DWORD PTR _data$[ebp]
	push	eax
	mov	ecx, DWORD PTR _cntxt$[ebp]
	push	ecx
	call	_qry_obj_field
	add	esp, 16					; 00000010H
	test	eax, eax
	je	SHORT $L70730
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 763		; 000002fbH
	jmp	$eva_err$70670
$L70730:

; 764  : 			if(data.nbrows) DYNTAB_ADD_CELL(ano, ano->nbrows, 0, &data, 0, 0);

	cmp	DWORD PTR _data$[ebp], 0
	je	SHORT $L70733
	push	1
	push	0
	push	0
	lea	eax, DWORD PTR _data$[ebp]
	push	eax
	call	_dyntab_cell
	add	esp, 12					; 0000000cH
	push	eax
	push	0
	mov	ecx, DWORD PTR _ano$70707[ebp]
	mov	edx, DWORD PTR [ecx]
	push	edx
	mov	eax, DWORD PTR _ano$70707[ebp]
	push	eax
	call	_dyntab_copy
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L70733
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29872], OFFSET FLAT:$SG70735
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 764		; 000002fcH
	jmp	$eva_err$70670
$L70733:

; 765  : 			strncpy(datedebcor, cf->mes[i].debfact, 8);

	push	8
	mov	eax, DWORD PTR _i$[ebp]
	imul	eax, 168				; 000000a8H
	mov	ecx, DWORD PTR _cf$[ebp]
	mov	edx, DWORD PTR [ecx+248]
	lea	eax, DWORD PTR [edx+eax+120]
	push	eax
	lea	ecx, DWORD PTR _datedebcor$70693[ebp]
	push	ecx
	call	_strncpy
	add	esp, 12					; 0000000cH

; 766  : 			strncpy(datefincor, cf->mes[i].finfact, 8);

	push	8
	mov	edx, DWORD PTR _i$[ebp]
	imul	edx, 168				; 000000a8H
	mov	eax, DWORD PTR _cf$[ebp]
	mov	ecx, DWORD PTR [eax+248]
	lea	edx, DWORD PTR [ecx+edx+130]
	push	edx
	lea	eax, DWORD PTR _datefincor$70694[ebp]
	push	eax
	call	_strncpy
	add	esp, 12					; 0000000cH

; 768  : 		else if(!strcmp(modefact, "DateRecept") && strcmp(cf->mes[i].prisecharge, cf->mes[i].deb) > 0)

	jmp	$L70744
$L70728:
	push	OFFSET FLAT:$SG70738
	mov	ecx, DWORD PTR _modefact$70695[ebp]
	push	ecx
	call	_strcmp
	add	esp, 8
	test	eax, eax
	jne	SHORT $L70737
	mov	edx, DWORD PTR _i$[ebp]
	imul	edx, 168				; 000000a8H
	mov	eax, DWORD PTR _cf$[ebp]
	mov	ecx, DWORD PTR [eax+248]
	lea	edx, DWORD PTR [ecx+edx+4]
	push	edx
	mov	eax, DWORD PTR _i$[ebp]
	imul	eax, 168				; 000000a8H
	mov	ecx, DWORD PTR _cf$[ebp]
	mov	edx, DWORD PTR [ecx+248]
	lea	eax, DWORD PTR [edx+eax+140]
	push	eax
	call	_strcmp
	add	esp, 8
	test	eax, eax
	jle	SHORT $L70737

; 770  : 			strncpy(datedebcor, cf->mes[i].prisecharge, 8);

	push	8
	mov	ecx, DWORD PTR _i$[ebp]
	imul	ecx, 168				; 000000a8H
	mov	edx, DWORD PTR _cf$[ebp]
	mov	eax, DWORD PTR [edx+248]
	lea	ecx, DWORD PTR [eax+ecx+140]
	push	ecx
	lea	edx, DWORD PTR _datedebcor$70693[ebp]
	push	edx
	call	_strncpy
	add	esp, 12					; 0000000cH

; 772  : 		else if(strcmp(modefact, "DateEffet"))

	jmp	$L70744
$L70737:
	push	OFFSET FLAT:$SG70741
	mov	eax, DWORD PTR _modefact$70695[ebp]
	push	eax
	call	_strcmp
	add	esp, 8
	test	eax, eax
	je	$L70744

; 774  : 			/* Facturation auto */
; 775  : 			if(cf->mes[i].affect[0])

	mov	ecx, DWORD PTR _i$[ebp]
	imul	ecx, 168				; 000000a8H
	mov	edx, DWORD PTR _cf$[ebp]
	mov	eax, DWORD PTR [edx+248]
	movsx	ecx, BYTE PTR [eax+ecx+150]
	test	ecx, ecx
	je	SHORT $L70742

; 776  : 				strncpy(datedebcor, cf->mes[i].affect, 8);

	push	8
	mov	edx, DWORD PTR _i$[ebp]
	imul	edx, 168				; 000000a8H
	mov	eax, DWORD PTR _cf$[ebp]
	mov	ecx, DWORD PTR [eax+248]
	lea	edx, DWORD PTR [ecx+edx+150]
	push	edx
	lea	eax, DWORD PTR _datedebcor$70693[ebp]
	push	eax
	call	_strncpy
	add	esp, 12					; 0000000cH

; 777  : 			else if(strcmp(cf->mes[i].prisecharge, cf->mes[i].deb) > 0)

	jmp	SHORT $L70744
$L70742:
	mov	ecx, DWORD PTR _i$[ebp]
	imul	ecx, 168				; 000000a8H
	mov	edx, DWORD PTR _cf$[ebp]
	mov	eax, DWORD PTR [edx+248]
	lea	ecx, DWORD PTR [eax+ecx+4]
	push	ecx
	mov	edx, DWORD PTR _i$[ebp]
	imul	edx, 168				; 000000a8H
	mov	eax, DWORD PTR _cf$[ebp]
	mov	ecx, DWORD PTR [eax+248]
	lea	edx, DWORD PTR [ecx+edx+140]
	push	edx
	call	_strcmp
	add	esp, 8
	test	eax, eax
	jle	SHORT $L70744

; 778  : 				strncpy(datedebcor, cf->mes[i].prisecharge, 8);

	push	8
	mov	eax, DWORD PTR _i$[ebp]
	imul	eax, 168				; 000000a8H
	mov	ecx, DWORD PTR _cf$[ebp]
	mov	edx, DWORD PTR [ecx+248]
	lea	eax, DWORD PTR [edx+eax+140]
	push	eax
	lea	ecx, DWORD PTR _datedebcor$70693[ebp]
	push	ecx
	call	_strncpy
	add	esp, 12					; 0000000cH
$L70744:

; 780  : 
; 781  : 		/* Changement de destinataire a 18 ans */
; 782  : 		if(strcmp(majorite, cf->datefinmois) < 0)

	mov	edx, DWORD PTR _cf$[ebp]
	add	edx, 178				; 000000b2H
	push	edx
	mov	eax, DWORD PTR _majorite$70692[ebp]
	push	eax
	call	_strcmp
	add	esp, 8
	test	eax, eax
	jge	$L70753

; 784  : 			/* Si mesure jeune majeur et 18 ans avant ce mois */
; 785  :  			if(cf->mes[i].b_jeunemajeur && strcmp(majorite, cf->datedebmois) < 0)

	mov	ecx, DWORD PTR _i$[ebp]
	imul	ecx, 168				; 000000a8H
	mov	edx, DWORD PTR _cf$[ebp]
	mov	eax, DWORD PTR [edx+248]
	cmp	DWORD PTR [eax+ecx+48], 0
	je	$L70746
	mov	ecx, DWORD PTR _cf$[ebp]
	add	ecx, 168				; 000000a8H
	push	ecx
	mov	edx, DWORD PTR _majorite$70692[ebp]
	push	edx
	call	_strcmp
	add	esp, 8
	test	eax, eax
	jge	$L70746

; 787  : 				/* Destinataire = PJJ quand plus de 18 ans */
; 788  : 				iddest = 27616;

	mov	DWORD PTR _iddest$70689[ebp], 27616	; 00006be0H

; 789  : 
; 790  : 				/* Correction si premier mois facture après 18 ans */
; 791  : 				delay_to_datetxt(txt, majorite, 1, 'M');

	push	77					; 0000004dH
	push	1
	mov	eax, DWORD PTR _majorite$70692[ebp]
	push	eax
	lea	ecx, DWORD PTR _txt$[ebp]
	push	ecx
	call	_delay_to_datetxt
	add	esp, 16					; 00000010H

; 792  : 				if(!strncmp(txt, cf->datedebmois, 6))

	push	6
	mov	edx, DWORD PTR _cf$[ebp]
	add	edx, 168				; 000000a8H
	push	edx
	lea	eax, DWORD PTR _txt$[ebp]
	push	eax
	call	_strncmp
	add	esp, 12					; 0000000cH
	test	eax, eax
	jne	$L70748

; 794  : 					delay_to_datetxt(txt, cf->datedebmois, -1, 'D');

	push	68					; 00000044H
	push	-1
	mov	ecx, DWORD PTR _cf$[ebp]
	add	ecx, 168				; 000000a8H
	push	ecx
	lea	edx, DWORD PTR _txt$[ebp]
	push	edx
	call	_delay_to_datetxt
	add	esp, 16					; 00000010H

; 795  : 					txt[8] = 0;

	mov	BYTE PTR _txt$[ebp+8], 0

; 796  : 					nbjcorr = atoi(txt + 6) - atoi(majorite + 6) + 1;

	lea	eax, DWORD PTR _txt$[ebp+6]
	push	eax
	call	_atoi
	add	esp, 4
	mov	esi, eax
	mov	ecx, DWORD PTR _majorite$70692[ebp]
	add	ecx, 6
	push	ecx
	call	_atoi
	add	esp, 4
	sub	esi, eax
	add	esi, 1
	mov	DWORD PTR _nbjcorr$70699[ebp], esi

; 797  : 					DYNTAB_SET(ano, ano->nbrows, 0, "Régularisation 1er mois");

	push	23					; 00000017H
	push	OFFSET FLAT:$SG70749
	push	0
	mov	edx, DWORD PTR _ano$70707[ebp]
	mov	eax, DWORD PTR [edx]
	push	eax
	mov	ecx, DWORD PTR _ano$70707[ebp]
	push	ecx
	call	_dyntab_set_txt
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L70748
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29872], OFFSET FLAT:$SG70751
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 797		; 0000031dH
	jmp	$eva_err$70670
$L70748:

; 800  : 			else if(strcmp(majorite, datefin) < 0)

	jmp	SHORT $L70753
$L70746:
	mov	ecx, DWORD PTR _datefin$70691[ebp]
	push	ecx
	mov	edx, DWORD PTR _majorite$70692[ebp]
	push	edx
	call	_strcmp
	add	esp, 8
	test	eax, eax
	jge	SHORT $L70753

; 802  : 				/* Fin de facturation le mois des 18 ans */
; 803  : 				strncpy(datefincor, majorite, 8);

	push	8
	mov	eax, DWORD PTR _majorite$70692[ebp]
	push	eax
	lea	ecx, DWORD PTR _datefincor$70694[ebp]
	push	ecx
	call	_strncpy
	add	esp, 12					; 0000000cH
$L70753:

; 806  : 
; 807  : 		/* Destinataire par defaut = DIPAS DEPARTEMENT */
; 808  : 		if(!iddest) iddest = 27615;

	cmp	DWORD PTR _iddest$70689[ebp], 0
	jne	SHORT $L70754
	mov	DWORD PTR _iddest$70689[ebp], 27615	; 00006bdfH
$L70754:

; 809  : 
; 810  : 		/* Normalisation dates debut / fin */
; 811  : 		if(*datedebcor && datetxt_invalid(datedebcor)) *datedebcor = 0;

	movsx	edx, BYTE PTR _datedebcor$70693[ebp]
	test	edx, edx
	je	SHORT $L70755
	lea	eax, DWORD PTR _datedebcor$70693[ebp]
	push	eax
	call	_datetxt_invalid
	add	esp, 4
	test	eax, eax
	je	SHORT $L70755
	mov	BYTE PTR _datedebcor$70693[ebp], 0
$L70755:

; 812  : 		if(*datefincor && datetxt_invalid(datefincor)) *datefincor = 0;

	movsx	ecx, BYTE PTR _datefincor$70694[ebp]
	test	ecx, ecx
	je	SHORT $L70756
	lea	edx, DWORD PTR _datefincor$70694[ebp]
	push	edx
	call	_datetxt_invalid
	add	esp, 4
	test	eax, eax
	je	SHORT $L70756
	mov	BYTE PTR _datefincor$70694[ebp], 0
$L70756:

; 813  : 		if(!*datedebcor && *datedeb) strcpy(datedebcor, datedeb);

	movsx	eax, BYTE PTR _datedebcor$70693[ebp]
	test	eax, eax
	jne	SHORT $L70757
	mov	ecx, DWORD PTR _datedeb$70690[ebp]
	movsx	edx, BYTE PTR [ecx]
	test	edx, edx
	je	SHORT $L70757
	mov	eax, DWORD PTR _datedeb$70690[ebp]
	push	eax
	lea	ecx, DWORD PTR _datedebcor$70693[ebp]
	push	ecx
	call	_strcpy
	add	esp, 8
$L70757:

; 814  : 		if(!*datefincor && *datefin) strcpy(datefincor, datefin);

	movsx	edx, BYTE PTR _datefincor$70694[ebp]
	test	edx, edx
	jne	SHORT $L70758
	mov	eax, DWORD PTR _datefin$70691[ebp]
	movsx	ecx, BYTE PTR [eax]
	test	ecx, ecx
	je	SHORT $L70758
	mov	edx, DWORD PTR _datefin$70691[ebp]
	push	edx
	lea	eax, DWORD PTR _datefincor$70694[ebp]
	push	eax
	call	_strcpy
	add	esp, 8
$L70758:

; 815  : 
; 816  : 		/* Etat de facturation de la mesure */
; 817  : 		mindeb = (!*datedeb || strcmp(datedeb, datedebcor) > 0) ? datedebcor : datedeb;

	mov	ecx, DWORD PTR _datedeb$70690[ebp]
	movsx	edx, BYTE PTR [ecx]
	test	edx, edx
	je	SHORT $L71261
	lea	eax, DWORD PTR _datedebcor$70693[ebp]
	push	eax
	mov	ecx, DWORD PTR _datedeb$70690[ebp]
	push	ecx
	call	_strcmp
	add	esp, 8
	test	eax, eax
	jg	SHORT $L71261
	mov	edx, DWORD PTR _datedeb$70690[ebp]
	mov	DWORD PTR -2856+[ebp], edx
	jmp	SHORT $L71262
$L71261:
	lea	eax, DWORD PTR _datedebcor$70693[ebp]
	mov	DWORD PTR -2856+[ebp], eax
$L71262:
	mov	ecx, DWORD PTR -2856+[ebp]
	mov	DWORD PTR _mindeb$70696[ebp], ecx

; 818  : 		maxfin = !*datefincor ? "A" : strcmp(datefin, datefincor) < 0 ? datefincor : datefin;

	movsx	edx, BYTE PTR _datefincor$70694[ebp]
	test	edx, edx
	jne	SHORT $L71265
	mov	DWORD PTR -2860+[ebp], OFFSET FLAT:$SG70759
	jmp	SHORT $L71266
$L71265:
	lea	eax, DWORD PTR _datefincor$70694[ebp]
	push	eax
	mov	ecx, DWORD PTR _datefin$70691[ebp]
	push	ecx
	call	_strcmp
	add	esp, 8
	test	eax, eax
	jge	SHORT $L71263
	lea	edx, DWORD PTR _datefincor$70694[ebp]
	mov	DWORD PTR -2864+[ebp], edx
	jmp	SHORT $L71264
$L71263:
	mov	eax, DWORD PTR _datefin$70691[ebp]
	mov	DWORD PTR -2864+[ebp], eax
$L71264:
	mov	ecx, DWORD PTR -2864+[ebp]
	mov	DWORD PTR -2860+[ebp], ecx
$L71266:
	mov	edx, DWORD PTR -2860+[ebp]
	mov	DWORD PTR _maxfin$70697[ebp], edx

; 819  : 		if(cf->mes[i].b_forcstat && cf->mes[i].idvalstat)

	mov	eax, DWORD PTR _i$[ebp]
	imul	eax, 168				; 000000a8H
	mov	ecx, DWORD PTR _cf$[ebp]
	mov	edx, DWORD PTR [ecx+248]
	cmp	DWORD PTR [edx+eax+96], 0
	je	SHORT $L70760
	mov	eax, DWORD PTR _i$[ebp]
	imul	eax, 168				; 000000a8H
	mov	ecx, DWORD PTR _cf$[ebp]
	mov	edx, DWORD PTR [ecx+248]
	cmp	DWORD PTR [edx+eax+92], 0
	je	SHORT $L70760

; 821  : 			/* Etat force : nouvel etat = ancien etat */
; 822  : 			statut = cf->mes[i].idvalstat;

	mov	eax, DWORD PTR _i$[ebp]
	imul	eax, 168				; 000000a8H
	mov	ecx, DWORD PTR _cf$[ebp]
	mov	edx, DWORD PTR [ecx+248]
	mov	eax, DWORD PTR [edx+eax+92]
	mov	DWORD PTR _statut$70701[ebp], eax

; 823  : 			nouvstatut = cf->mes[i].statfact;

	mov	ecx, DWORD PTR _i$[ebp]
	imul	ecx, 168				; 000000a8H
	mov	edx, DWORD PTR _cf$[ebp]
	mov	eax, DWORD PTR [edx+248]
	lea	ecx, DWORD PTR [eax+ecx+72]
	mov	DWORD PTR _nouvstatut$70703[ebp], ecx

; 825  : 		else if(strcmp(maxfin, cf->datedebmois) <= 0)

	jmp	$L70783
$L70760:
	mov	edx, DWORD PTR _cf$[ebp]
	add	edx, 168				; 000000a8H
	push	edx
	mov	eax, DWORD PTR _maxfin$70697[ebp]
	push	eax
	call	_strcmp
	add	esp, 8
	test	eax, eax
	jg	$L70762

; 827  : 			/* Date de fin de facturation atteinte : maintien de la mesure si:
; 828  : 					* 12 mois max apres echeance
; 829  : 					* facturation non manuelle
; 830  : 					* facturation DIPAS 01
; 831  : 					* majorité non atteinte
; 832  : 					* pas de main levee
; 833  : 					* echeance après 1 janvier 2003 */
; 834  : 			delay_to_datetxt(txt, datefin, 12, 'M');

	push	77					; 0000004dH
	push	12					; 0000000cH
	mov	ecx, DWORD PTR _datefin$70691[ebp]
	push	ecx
	lea	edx, DWORD PTR _txt$[ebp]
	push	edx
	call	_delay_to_datetxt
	add	esp, 16					; 00000010H

; 835  : 			if(	strcmp(txt, cf->datedebmois) > 0 &&
; 836  : 				strcmp(modefact, "DateManuelle") &&
; 837  : 				iddest == 27615 &&
; 838  : 				strcmp(majorite, cf->datefinmois) > 0 &&
; 839  : 				!cf->mes[i].b_mainlevee &&
; 840  : 				strcmp(datefin, "2003") > 0)

	mov	eax, DWORD PTR _cf$[ebp]
	add	eax, 168				; 000000a8H
	push	eax
	lea	ecx, DWORD PTR _txt$[ebp]
	push	ecx
	call	_strcmp
	add	esp, 8
	test	eax, eax
	jle	$L70763
	push	OFFSET FLAT:$SG70764
	mov	edx, DWORD PTR _modefact$70695[ebp]
	push	edx
	call	_strcmp
	add	esp, 8
	test	eax, eax
	je	$L70763
	cmp	DWORD PTR _iddest$70689[ebp], 27615	; 00006bdfH
	jne	$L70763
	mov	eax, DWORD PTR _cf$[ebp]
	add	eax, 178				; 000000b2H
	push	eax
	mov	ecx, DWORD PTR _majorite$70692[ebp]
	push	ecx
	call	_strcmp
	add	esp, 8
	test	eax, eax
	jle	$L70763
	mov	edx, DWORD PTR _i$[ebp]
	imul	edx, 168				; 000000a8H
	mov	eax, DWORD PTR _cf$[ebp]
	mov	ecx, DWORD PTR [eax+248]
	cmp	DWORD PTR [ecx+edx+44], 0
	jne	$L70763
	push	OFFSET FLAT:$SG70765
	mov	edx, DWORD PTR _datefin$70691[ebp]
	push	edx
	call	_strcmp
	add	esp, 8
	test	eax, eax
	jle	SHORT $L70763

; 842  : 				statut = cf->val_Maintien;

	mov	eax, DWORD PTR _cf$[ebp]
	mov	ecx, DWORD PTR [eax+92]
	mov	DWORD PTR _statut$70701[ebp], ecx

; 843  : 				DYNTAB_SET(ano, ano->nbrows, 0, "Maintien en attente de jugement");

	push	31					; 0000001fH
	push	OFFSET FLAT:$SG70767
	push	0
	mov	edx, DWORD PTR _ano$70707[ebp]
	mov	eax, DWORD PTR [edx]
	push	eax
	mov	ecx, DWORD PTR _ano$70707[ebp]
	push	ecx
	call	_dyntab_set_txt
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L70766
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29872], OFFSET FLAT:$SG70769
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 843		; 0000034bH
	jmp	$eva_err$70670
$L70766:

; 844  : 				nouvstatut = "Maintien";

	mov	DWORD PTR _nouvstatut$70703[ebp], OFFSET FLAT:$SG70770

; 845  : 				bgcolor = "#FF8888";

	mov	DWORD PTR _bgcolor$70704[ebp], OFFSET FLAT:$SG70771

; 847  : 			else

	jmp	SHORT $L70772
$L70763:

; 849  : 				statut = cf->val_Archivee;

	mov	ecx, DWORD PTR _cf$[ebp]
	mov	edx, DWORD PTR [ecx+96]
	mov	DWORD PTR _statut$70701[ebp], edx

; 850  : 				nouvstatut = "Archivée";

	mov	DWORD PTR _nouvstatut$70703[ebp], OFFSET FLAT:$SG70773

; 851  : 				bgcolor = "#CCCCFF";

	mov	DWORD PTR _bgcolor$70704[ebp], OFFSET FLAT:$SG70774

; 852  : 				nbjours = 0;

	mov	DWORD PTR _nbjours$70698[ebp], 0
$L70772:

; 855  : 		else if(strcmp(mindeb, cf->datefinmois) > 0)

	jmp	$L70783
$L70762:
	mov	eax, DWORD PTR _cf$[ebp]
	add	eax, 178				; 000000b2H
	push	eax
	mov	ecx, DWORD PTR _mindeb$70696[ebp]
	push	ecx
	call	_strcmp
	add	esp, 8
	test	eax, eax
	jle	SHORT $L70776

; 857  : 			statut = cf->val_En_attente;

	mov	edx, DWORD PTR _cf$[ebp]
	mov	eax, DWORD PTR [edx+100]
	mov	DWORD PTR _statut$70701[ebp], eax

; 858  : 			nouvstatut = "En attente";

	mov	DWORD PTR _nouvstatut$70703[ebp], OFFSET FLAT:$SG70777

; 859  : 			bgcolor = "#FFCCCC";

	mov	DWORD PTR _bgcolor$70704[ebp], OFFSET FLAT:$SG70778

; 861  : 		else

	jmp	$L70783
$L70776:

; 863  : 			statut = cf->val_En_cours;

	mov	ecx, DWORD PTR _cf$[ebp]
	mov	edx, DWORD PTR [ecx+88]
	mov	DWORD PTR _statut$70701[ebp], edx

; 864  : 			nouvstatut = "En cours";

	mov	DWORD PTR _nouvstatut$70703[ebp], OFFSET FLAT:$SG70780

; 865  : 			bgcolor = "#CCFFCC";

	mov	DWORD PTR _bgcolor$70704[ebp], OFFSET FLAT:$SG70781

; 866  : 			if(!cf->mes[i].ts) DYNTAB_SET(ano, ano->nbrows, 0, "Attente affectation TS");

	mov	eax, DWORD PTR _i$[ebp]
	imul	eax, 168				; 000000a8H
	mov	ecx, DWORD PTR _cf$[ebp]
	mov	edx, DWORD PTR [ecx+248]
	cmp	DWORD PTR [edx+eax+164], 0
	jne	SHORT $L70783
	push	22					; 00000016H
	push	OFFSET FLAT:$SG70784
	push	0
	mov	eax, DWORD PTR _ano$70707[ebp]
	mov	ecx, DWORD PTR [eax]
	push	ecx
	mov	edx, DWORD PTR _ano$70707[ebp]
	push	edx
	call	_dyntab_set_txt
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L70783
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29872], OFFSET FLAT:$SG70786
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 866		; 00000362H
	jmp	$eva_err$70670
$L70783:

; 868  : 
; 869  : 		/* Calcul du nombre de jours factures pour le mois */
; 870  : 		if(!b_calcmanuel && statut != cf->val_Maintien && statut != cf->val_En_attente)

	cmp	DWORD PTR _b_calcmanuel$70700[ebp], 0
	jne	$L70826
	mov	edx, DWORD PTR _cf$[ebp]
	mov	eax, DWORD PTR _statut$70701[ebp]
	cmp	eax, DWORD PTR [edx+92]
	je	$L70826
	mov	ecx, DWORD PTR _cf$[ebp]
	mov	edx, DWORD PTR _statut$70701[ebp]
	cmp	edx, DWORD PTR [ecx+100]
	je	$L70826

; 872  : 			if(!cf->mes[i].ts || strcmp(datefincor, cf->datedebmois) <= 0)

	mov	eax, DWORD PTR _i$[ebp]
	imul	eax, 168				; 000000a8H
	mov	ecx, DWORD PTR _cf$[ebp]
	mov	edx, DWORD PTR [ecx+248]
	cmp	DWORD PTR [edx+eax+164], 0
	je	SHORT $L70789
	mov	eax, DWORD PTR _cf$[ebp]
	add	eax, 168				; 000000a8H
	push	eax
	lea	ecx, DWORD PTR _datefincor$70694[ebp]
	push	ecx
	call	_strcmp
	add	esp, 8
	test	eax, eax
	jg	SHORT $L70788
$L70789:

; 874  : 				/* Mois après la date d'écheance ou TS non affecté : non facturé */
; 875  : 				nbjours = 0;

	mov	DWORD PTR _nbjours$70698[ebp], 0

; 877  : 			else if(strcmp(datefincor, cf->datefinmois) <= 0)

	jmp	$L70795
$L70788:
	mov	edx, DWORD PTR _cf$[ebp]
	add	edx, 178				; 000000b2H
	push	edx
	lea	eax, DWORD PTR _datefincor$70694[ebp]
	push	eax
	call	_strcmp
	add	esp, 8
	test	eax, eax
	jg	SHORT $L70791

; 879  : 				/* Fin le mois en cours : facturer jour de fin - 1 */
; 880  : 				nbjours = atoi(datefincor + 6) - 1;

	lea	ecx, DWORD PTR _datefincor$70694[ebp+6]
	push	ecx
	call	_atoi
	add	esp, 4
	sub	eax, 1
	mov	DWORD PTR _nbjours$70698[ebp], eax

; 882  : 			else if(strcmp(datedebcor, cf->datefinmois) > 0)

	jmp	SHORT $L70795
$L70791:
	mov	edx, DWORD PTR _cf$[ebp]
	add	edx, 178				; 000000b2H
	push	edx
	lea	eax, DWORD PTR _datedebcor$70693[ebp]
	push	eax
	call	_strcmp
	add	esp, 8
	test	eax, eax
	jle	SHORT $L70793

; 884  : 				/* Mois avant la date de début :non facturé */
; 885  : 				nbjours = 0;

	mov	DWORD PTR _nbjours$70698[ebp], 0

; 887  : 			else if(strcmp(datedebcor, cf->datedebmois) >= 0)

	jmp	SHORT $L70795
$L70793:
	mov	ecx, DWORD PTR _cf$[ebp]
	add	ecx, 168				; 000000a8H
	push	ecx
	lea	edx, DWORD PTR _datedebcor$70693[ebp]
	push	edx
	call	_strcmp
	add	esp, 8
	test	eax, eax
	jl	SHORT $L70795

; 889  : 				/* Début le mois en cours : facturer jour de début à fin de mois */
; 890  : 				nbjours = cf->nbjoursmois - atoi(datedebcor + 6) + 1;

	lea	eax, DWORD PTR _datedebcor$70693[ebp+6]
	push	eax
	call	_atoi
	add	esp, 4
	mov	ecx, DWORD PTR _cf$[ebp]
	mov	edx, DWORD PTR [ecx+188]
	sub	edx, eax
	add	edx, 1
	mov	DWORD PTR _nbjours$70698[ebp], edx
$L70795:

; 892  : 
; 893  : 			/* Si TS affecté et pas de correction donnée */
; 894  : 			if(cf->mes[i].ts && !nbjcorr)

	mov	eax, DWORD PTR _i$[ebp]
	imul	eax, 168				; 000000a8H
	mov	ecx, DWORD PTR _cf$[ebp]
	mov	edx, DWORD PTR [ecx+248]
	cmp	DWORD PTR [edx+eax+164], 0
	je	$L70809
	cmp	DWORD PTR _nbjcorr$70699[ebp], 0
	jne	$L70809

; 896  : 				/* Calcul des corrections */
; 897  : 				if(calc_jcor_AEMO(cntxt, cf, i, datedebcor, datefincor, idlignefact, nbjours, &nbjcorr)) STACK_ERROR;

	lea	eax, DWORD PTR _nbjcorr$70699[ebp]
	push	eax
	mov	ecx, DWORD PTR _nbjours$70698[ebp]
	push	ecx
	mov	edx, DWORD PTR _idlignefact$70688[ebp]
	push	edx
	lea	eax, DWORD PTR _datefincor$70694[ebp]
	push	eax
	lea	ecx, DWORD PTR _datedebcor$70693[ebp]
	push	ecx
	mov	edx, DWORD PTR _i$[ebp]
	push	edx
	mov	eax, DWORD PTR _cf$[ebp]
	push	eax
	mov	ecx, DWORD PTR _cntxt$[ebp]
	push	ecx
	call	_calc_jcor_AEMO
	add	esp, 32					; 00000020H
	test	eax, eax
	je	SHORT $L70797
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 897		; 00000381H
	jmp	$eva_err$70670
$L70797:

; 898  : 				if(nbjcorr)

	cmp	DWORD PTR _nbjcorr$70699[ebp], 0
	je	$L70809

; 900  : 					char buf[256] = {0}, d[32];

	mov	BYTE PTR _buf$70799[ebp], 0
	mov	ecx, 63					; 0000003fH
	xor	eax, eax
	lea	edi, DWORD PTR _buf$70799[ebp+1]
	rep stosd
	stosw
	stosb

; 901  : 					int b_new = !strcmp(cf->mes[i].effetderjug, datedeb);

	mov	eax, DWORD PTR _datedeb$70690[ebp]
	push	eax
	mov	ecx, DWORD PTR _i$[ebp]
	imul	ecx, 168				; 000000a8H
	mov	edx, DWORD PTR _cf$[ebp]
	mov	eax, DWORD PTR [edx+248]
	lea	ecx, DWORD PTR [eax+ecx+34]
	push	ecx
	call	_strcmp
	add	esp, 8
	neg	eax
	sbb	eax, eax
	inc	eax
	mov	DWORD PTR _b_new$70801[ebp], eax

; 902  : 					datetxt_to_format(cntxt, d, b_new ? datedebcor : cf->mes[i].effetderjug, NULL);

	cmp	DWORD PTR _b_new$70801[ebp], 0
	je	SHORT $L71267
	lea	edx, DWORD PTR _datedebcor$70693[ebp]
	mov	DWORD PTR -2868+[ebp], edx
	jmp	SHORT $L71268
$L71267:
	mov	eax, DWORD PTR _i$[ebp]
	imul	eax, 168				; 000000a8H
	mov	ecx, DWORD PTR _cf$[ebp]
	mov	edx, DWORD PTR [ecx+248]
	lea	eax, DWORD PTR [edx+eax+34]
	mov	DWORD PTR -2868+[ebp], eax
$L71268:
	push	0
	mov	ecx, DWORD PTR -2868+[ebp]
	push	ecx
	lea	edx, DWORD PTR _d$70800[ebp]
	push	edx
	mov	eax, DWORD PTR _cntxt$[ebp]
	push	eax
	call	_datetxt_to_format
	add	esp, 16					; 00000010H

; 903  : 					DYNBUF_ADD3_INT(&msg, "Correction ", nbjcorr, "j");

	push	1
	push	OFFSET FLAT:$SG70804
	mov	ecx, DWORD PTR _nbjcorr$70699[ebp]
	push	ecx
	push	11					; 0000000bH
	push	OFFSET FLAT:$SG70805
	lea	edx, DWORD PTR _msg$[ebp]
	push	edx
	call	_dynbuf_add3_int
	add	esp, 24					; 00000018H
	test	eax, eax
	je	SHORT $L70803
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29872], OFFSET FLAT:$SG70807
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 903		; 00000387H
	jmp	$eva_err$70670
$L70803:

; 905  : 						snprintf(add_sz_str(buf), "%s à/c du %s",
; 906  : 								b_new ? "Prise en charge" : cf->mes[i].b_mainlevee ? "Main levée" : "Maintien",
; 907  : 								d), NO_CONV);

	cmp	DWORD PTR _b_new$70801[ebp], 0
	je	SHORT $L71271
	mov	DWORD PTR -2872+[ebp], OFFSET FLAT:$SG70810
	jmp	SHORT $L71272
$L71271:
	mov	edx, DWORD PTR _i$[ebp]
	imul	edx, 168				; 000000a8H
	mov	eax, DWORD PTR _cf$[ebp]
	mov	ecx, DWORD PTR [eax+248]
	cmp	DWORD PTR [ecx+edx+44], 0
	je	SHORT $L71269
	mov	DWORD PTR -2876+[ebp], OFFSET FLAT:$SG70811
	jmp	SHORT $L71270
$L71269:
	mov	DWORD PTR -2876+[ebp], OFFSET FLAT:$SG70812
$L71270:
	mov	edx, DWORD PTR -2876+[ebp]
	mov	DWORD PTR -2872+[ebp], edx
$L71272:
	push	0
	push	0
	lea	eax, DWORD PTR _d$70800[ebp]
	push	eax
	mov	ecx, DWORD PTR -2872+[ebp]
	push	ecx
	push	OFFSET FLAT:$SG70813
	push	255					; 000000ffH
	lea	edx, DWORD PTR _buf$70799[ebp]
	push	edx
	call	__snprintf
	add	esp, 20					; 00000014H
	push	eax
	lea	eax, DWORD PTR _buf$70799[ebp]
	push	eax
	push	0
	mov	ecx, DWORD PTR _ano$70707[ebp]
	mov	edx, DWORD PTR [ecx]
	push	edx
	mov	eax, DWORD PTR _ano$70707[ebp]
	push	eax
	call	_dyntab_add
	add	esp, 28					; 0000001cH
	test	eax, eax
	je	SHORT $L70809
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29872], OFFSET FLAT:$SG70815
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 907		; 0000038bH
	jmp	$eva_err$70670
$L70809:

; 910  : 
; 911  : 
; 912  : 			/* Annotation si modification des dates de facturation */
; 913  : 			mindeb = strcmp(datedeb, datedebcor) > 0 ? datedebcor : datedeb;

	lea	eax, DWORD PTR _datedebcor$70693[ebp]
	push	eax
	mov	ecx, DWORD PTR _datedeb$70690[ebp]
	push	ecx
	call	_strcmp
	add	esp, 8
	test	eax, eax
	jle	SHORT $L71273
	lea	edx, DWORD PTR _datedebcor$70693[ebp]
	mov	DWORD PTR -2880+[ebp], edx
	jmp	SHORT $L71274
$L71273:
	mov	eax, DWORD PTR _datedeb$70690[ebp]
	mov	DWORD PTR -2880+[ebp], eax
$L71274:
	mov	ecx, DWORD PTR -2880+[ebp]
	mov	DWORD PTR _mindeb$70696[ebp], ecx

; 914  : 			maxfin = strcmp(datedeb, datedebcor) < 0 ? datedebcor : datedeb;

	lea	edx, DWORD PTR _datedebcor$70693[ebp]
	push	edx
	mov	eax, DWORD PTR _datedeb$70690[ebp]
	push	eax
	call	_strcmp
	add	esp, 8
	test	eax, eax
	jge	SHORT $L71275
	lea	ecx, DWORD PTR _datedebcor$70693[ebp]
	mov	DWORD PTR -2884+[ebp], ecx
	jmp	SHORT $L71276
$L71275:
	mov	edx, DWORD PTR _datedeb$70690[ebp]
	mov	DWORD PTR -2884+[ebp], edx
$L71276:
	mov	eax, DWORD PTR -2884+[ebp]
	mov	DWORD PTR _maxfin$70697[ebp], eax

; 915  : 			if(strcmp(mindeb, cf->datefinmois) <= 0 && strcmp(maxfin, cf->datedebmois) >= 0 && !nbjcorr)

	mov	ecx, DWORD PTR _cf$[ebp]
	add	ecx, 178				; 000000b2H
	push	ecx
	mov	edx, DWORD PTR _mindeb$70696[ebp]
	push	edx
	call	_strcmp
	add	esp, 8
	test	eax, eax
	jg	$L70819
	mov	eax, DWORD PTR _cf$[ebp]
	add	eax, 168				; 000000a8H
	push	eax
	mov	ecx, DWORD PTR _maxfin$70697[ebp]
	push	ecx
	call	_strcmp
	add	esp, 8
	test	eax, eax
	jl	$L70819
	cmp	DWORD PTR _nbjcorr$70699[ebp], 0
	jne	$L70819

; 917  :  				datetxt_to_format(cntxt, txt, datedebcor, NULL);

	push	0
	lea	edx, DWORD PTR _datedebcor$70693[ebp]
	push	edx
	lea	eax, DWORD PTR _txt$[ebp]
	push	eax
	mov	ecx, DWORD PTR _cntxt$[ebp]
	push	ecx
	call	_datetxt_to_format
	add	esp, 16					; 00000010H

; 918  : 				DYNTAB_ADD(ano, ano->nbrows, 0, qry, snprintf(add_sz_str(qry), "Prise en charge le %s", txt), NO_CONV);

	push	0
	push	0
	lea	edx, DWORD PTR _txt$[ebp]
	push	edx
	push	OFFSET FLAT:$SG70820
	push	2047					; 000007ffH
	lea	eax, DWORD PTR _qry$[ebp]
	push	eax
	call	__snprintf
	add	esp, 16					; 00000010H
	push	eax
	lea	ecx, DWORD PTR _qry$[ebp]
	push	ecx
	push	0
	mov	edx, DWORD PTR _ano$70707[ebp]
	mov	eax, DWORD PTR [edx]
	push	eax
	mov	ecx, DWORD PTR _ano$70707[ebp]
	push	ecx
	call	_dyntab_add
	add	esp, 28					; 0000001cH
	test	eax, eax
	je	SHORT $L70819
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29872], OFFSET FLAT:$SG70822
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 918		; 00000396H
	jmp	$eva_err$70670
$L70819:

; 920  : 			mindeb = strcmp(datefin, datefincor) > 0 ? datefincor : datefin;

	lea	ecx, DWORD PTR _datefincor$70694[ebp]
	push	ecx
	mov	edx, DWORD PTR _datefin$70691[ebp]
	push	edx
	call	_strcmp
	add	esp, 8
	test	eax, eax
	jle	SHORT $L71277
	lea	eax, DWORD PTR _datefincor$70694[ebp]
	mov	DWORD PTR -2888+[ebp], eax
	jmp	SHORT $L71278
$L71277:
	mov	ecx, DWORD PTR _datefin$70691[ebp]
	mov	DWORD PTR -2888+[ebp], ecx
$L71278:
	mov	edx, DWORD PTR -2888+[ebp]
	mov	DWORD PTR _mindeb$70696[ebp], edx

; 921  : 			maxfin = strcmp(datefin, datefincor) < 0 ? datefincor : datefin;

	lea	eax, DWORD PTR _datefincor$70694[ebp]
	push	eax
	mov	ecx, DWORD PTR _datefin$70691[ebp]
	push	ecx
	call	_strcmp
	add	esp, 8
	test	eax, eax
	jge	SHORT $L71279
	lea	edx, DWORD PTR _datefincor$70694[ebp]
	mov	DWORD PTR -2892+[ebp], edx
	jmp	SHORT $L71280
$L71279:
	mov	eax, DWORD PTR _datefin$70691[ebp]
	mov	DWORD PTR -2892+[ebp], eax
$L71280:
	mov	ecx, DWORD PTR -2892+[ebp]
	mov	DWORD PTR _maxfin$70697[ebp], ecx

; 922  : 			if(strcmp(mindeb, cf->datefinmois) <= 0 && strcmp(maxfin, cf->datedebmois) >= 0 && !nbjcorr)

	mov	edx, DWORD PTR _cf$[ebp]
	add	edx, 178				; 000000b2H
	push	edx
	mov	eax, DWORD PTR _mindeb$70696[ebp]
	push	eax
	call	_strcmp
	add	esp, 8
	test	eax, eax
	jg	$L70826
	mov	ecx, DWORD PTR _cf$[ebp]
	add	ecx, 168				; 000000a8H
	push	ecx
	mov	edx, DWORD PTR _maxfin$70697[ebp]
	push	edx
	call	_strcmp
	add	esp, 8
	test	eax, eax
	jl	$L70826
	cmp	DWORD PTR _nbjcorr$70699[ebp], 0
	jne	$L70826

; 924  :  				datetxt_to_format(cntxt, txt, datefincor, NULL);

	push	0
	lea	eax, DWORD PTR _datefincor$70694[ebp]
	push	eax
	lea	ecx, DWORD PTR _txt$[ebp]
	push	ecx
	mov	edx, DWORD PTR _cntxt$[ebp]
	push	edx
	call	_datetxt_to_format
	add	esp, 16					; 00000010H

; 925  : 				DYNTAB_ADD(ano, ano->nbrows, 0, qry, snprintf(add_sz_str(qry), "Fin de prise en charge le %s", txt), NO_CONV);

	push	0
	push	0
	lea	eax, DWORD PTR _txt$[ebp]
	push	eax
	push	OFFSET FLAT:$SG70827
	push	2047					; 000007ffH
	lea	ecx, DWORD PTR _qry$[ebp]
	push	ecx
	call	__snprintf
	add	esp, 16					; 00000010H
	push	eax
	lea	edx, DWORD PTR _qry$[ebp]
	push	edx
	push	0
	mov	eax, DWORD PTR _ano$70707[ebp]
	mov	ecx, DWORD PTR [eax]
	push	ecx
	mov	edx, DWORD PTR _ano$70707[ebp]
	push	edx
	call	_dyntab_add
	add	esp, 28					; 0000001cH
	test	eax, eax
	je	SHORT $L70826
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29872], OFFSET FLAT:$SG70829
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 925		; 0000039dH
	jmp	$eva_err$70670
$L70826:

; 928  : 
; 929  : 		/* Journal d'execution pour la mesure si applicable */
; 930  : 		if(cf->b_detail_journal || strcmp(valstatut, nouvstatut) || msg)

	mov	edx, DWORD PTR _cf$[ebp]
	cmp	DWORD PTR [edx+164], 0
	jne	SHORT $L70831
	mov	eax, DWORD PTR _nouvstatut$70703[ebp]
	push	eax
	mov	ecx, DWORD PTR _valstatut$70702[ebp]
	push	ecx
	call	_strcmp
	add	esp, 8
	test	eax, eax
	jne	SHORT $L70831
	cmp	DWORD PTR _msg$[ebp], 0
	je	$L70830
$L70831:

; 932  : 			if(strcmp(valstatut, nouvstatut)) cf->nb_modif++;

	mov	edx, DWORD PTR _nouvstatut$70703[ebp]
	push	edx
	mov	eax, DWORD PTR _valstatut$70702[ebp]
	push	eax
	call	_strcmp
	add	esp, 8
	test	eax, eax
	je	SHORT $L70832
	mov	ecx, DWORD PTR _cf$[ebp]
	mov	edx, DWORD PTR [ecx+160]
	add	edx, 1
	mov	eax, DWORD PTR _cf$[ebp]
	mov	DWORD PTR [eax+160], edx
$L70832:

; 933  : 			printf("<table border=0 cellpadding=1 cellspacing=0 width=800><tr>");

	push	OFFSET FLAT:$SG70833
	call	_printf
	add	esp, 4

; 934  : 			printf("<td width=150><font size=-1>%s %s</td>", dyntab_val(&cf->tmes, i, 15), dyntab_val(&cf->tmes, i, 16));

	push	16					; 00000010H
	mov	ecx, DWORD PTR _i$[ebp]
	push	ecx
	mov	edx, DWORD PTR _cf$[ebp]
	add	edx, 224				; 000000e0H
	push	edx
	call	_dyntab_val
	add	esp, 12					; 0000000cH
	push	eax
	push	15					; 0000000fH
	mov	eax, DWORD PTR _i$[ebp]
	push	eax
	mov	ecx, DWORD PTR _cf$[ebp]
	add	ecx, 224				; 000000e0H
	push	ecx
	call	_dyntab_val
	add	esp, 12					; 0000000cH
	push	eax
	push	OFFSET FLAT:$SG70834
	call	_printf
	add	esp, 12					; 0000000cH

; 935  : 			printf("<td width=80 align=right><font size=-1>");

	push	OFFSET FLAT:$SG70835
	call	_printf
	add	esp, 4

; 936  : 			if(*datedeb) printf("%.2s/%.2s/%.4s", datedeb+6, datedeb+4, datedeb);

	mov	edx, DWORD PTR _datedeb$70690[ebp]
	movsx	eax, BYTE PTR [edx]
	test	eax, eax
	je	SHORT $L70836
	mov	ecx, DWORD PTR _datedeb$70690[ebp]
	push	ecx
	mov	edx, DWORD PTR _datedeb$70690[ebp]
	add	edx, 4
	push	edx
	mov	eax, DWORD PTR _datedeb$70690[ebp]
	add	eax, 6
	push	eax
	push	OFFSET FLAT:$SG70837
	call	_printf
	add	esp, 16					; 00000010H
$L70836:

; 937  : 			printf("</td><td width=10 align=center>-</td><td width=80><font size=-1>");

	push	OFFSET FLAT:$SG70838
	call	_printf
	add	esp, 4

; 938  : 			if(*datefin) printf("%.2s/%.2s/%.4s", datefin+6, datefin+4, datefin);

	mov	ecx, DWORD PTR _datefin$70691[ebp]
	movsx	edx, BYTE PTR [ecx]
	test	edx, edx
	je	SHORT $L70839
	mov	eax, DWORD PTR _datefin$70691[ebp]
	push	eax
	mov	ecx, DWORD PTR _datefin$70691[ebp]
	add	ecx, 4
	push	ecx
	mov	edx, DWORD PTR _datefin$70691[ebp]
	add	edx, 6
	push	edx
	push	OFFSET FLAT:$SG70840
	call	_printf
	add	esp, 16					; 00000010H
$L70839:

; 939  : 			printf("</td>");

	push	OFFSET FLAT:$SG70841
	call	_printf
	add	esp, 4

; 940  : 			if(qry_obj_idfield(cntxt, &data, iddest, cf->val_NOM_SOCIETE)) STACK_ERROR;

	mov	eax, DWORD PTR _cf$[ebp]
	mov	ecx, DWORD PTR [eax+84]
	push	ecx
	mov	edx, DWORD PTR _iddest$70689[ebp]
	push	edx
	lea	eax, DWORD PTR _data$[ebp]
	push	eax
	mov	ecx, DWORD PTR _cntxt$[ebp]
	push	ecx
	call	_qry_obj_idfield
	add	esp, 16					; 00000010H
	test	eax, eax
	je	SHORT $L70842
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 940		; 000003acH
	jmp	$eva_err$70670
$L70842:

; 941  : 			printf("<td width=120><font size=-2>%s</td>", dyntab_val(&data, 0, 0));

	push	0
	push	0
	lea	eax, DWORD PTR _data$[ebp]
	push	eax
	call	_dyntab_val
	add	esp, 12					; 0000000cH
	push	eax
	push	OFFSET FLAT:$SG70843
	call	_printf
	add	esp, 8

; 942  : 			printf("<td width=30 align=right>%d</td><td width=10>j</td><td width=50>%+d</td>", nbjours, nbjcorr);

	mov	ecx, DWORD PTR _nbjcorr$70699[ebp]
	push	ecx
	mov	edx, DWORD PTR _nbjours$70698[ebp]
	push	edx
	push	OFFSET FLAT:$SG70844
	call	_printf
	add	esp, 12					; 0000000cH

; 943  : 			printf("<td width=60><font size=-2>%s</td>", strcmp(valstatut, nouvstatut) ? valstatut : "");

	mov	eax, DWORD PTR _nouvstatut$70703[ebp]
	push	eax
	mov	ecx, DWORD PTR _valstatut$70702[ebp]
	push	ecx
	call	_strcmp
	add	esp, 8
	test	eax, eax
	je	SHORT $L71281
	mov	edx, DWORD PTR _valstatut$70702[ebp]
	mov	DWORD PTR -2896+[ebp], edx
	jmp	SHORT $L71282
$L71281:
	mov	DWORD PTR -2896+[ebp], OFFSET FLAT:$SG70845
$L71282:
	mov	eax, DWORD PTR -2896+[ebp]
	push	eax
	push	OFFSET FLAT:$SG70846
	call	_printf
	add	esp, 8

; 944  : 			printf("<td width=80 bgcolor=%s><font size=-1>%s</td>", bgcolor, nouvstatut);

	mov	ecx, DWORD PTR _nouvstatut$70703[ebp]
	push	ecx
	mov	edx, DWORD PTR _bgcolor$70704[ebp]
	push	edx
	push	OFFSET FLAT:$SG70847
	call	_printf
	add	esp, 12					; 0000000cH

; 945  : 			printf("<td%s><font size=-2><b>", ano->nbrows ? " bgcolor=#FFDDBB" : "");

	mov	eax, DWORD PTR _ano$70707[ebp]
	cmp	DWORD PTR [eax], 0
	je	SHORT $L71283
	mov	DWORD PTR -2900+[ebp], OFFSET FLAT:$SG70848
	jmp	SHORT $L71284
$L71283:
	mov	DWORD PTR -2900+[ebp], OFFSET FLAT:$SG70849
$L71284:
	mov	ecx, DWORD PTR -2900+[ebp]
	push	ecx
	push	OFFSET FLAT:$SG70850
	call	_printf
	add	esp, 8

; 946  : 			for(j = 0; j < ano->nbrows; j++) printf("%s%s", j ? ", " : "", dyntab_val(ano, j, 0));

	mov	DWORD PTR _j$[ebp], 0
	jmp	SHORT $L70851
$L70852:
	mov	edx, DWORD PTR _j$[ebp]
	add	edx, 1
	mov	DWORD PTR _j$[ebp], edx
$L70851:
	mov	eax, DWORD PTR _ano$70707[ebp]
	mov	ecx, DWORD PTR _j$[ebp]
	cmp	ecx, DWORD PTR [eax]
	jae	SHORT $L70853
	cmp	DWORD PTR _j$[ebp], 0
	je	SHORT $L71285
	mov	DWORD PTR -2904+[ebp], OFFSET FLAT:$SG70854
	jmp	SHORT $L71286
$L71285:
	mov	DWORD PTR -2904+[ebp], OFFSET FLAT:$SG70855
$L71286:
	push	0
	mov	edx, DWORD PTR _j$[ebp]
	push	edx
	mov	eax, DWORD PTR _ano$70707[ebp]
	push	eax
	call	_dyntab_val
	add	esp, 12					; 0000000cH
	push	eax
	mov	ecx, DWORD PTR -2904+[ebp]
	push	ecx
	push	OFFSET FLAT:$SG70856
	call	_printf
	add	esp, 12					; 0000000cH
	jmp	SHORT $L70852
$L70853:

; 947  : 			if(msg) printf("<br>%s", msg->data);

	cmp	DWORD PTR _msg$[ebp], 0
	je	SHORT $L70857
	mov	edx, DWORD PTR _msg$[ebp]
	add	edx, 8
	push	edx
	push	OFFSET FLAT:$SG70858
	call	_printf
	add	esp, 8
$L70857:

; 948  : 			printf("</b></font></td>");

	push	OFFSET FLAT:$SG70859
	call	_printf
	add	esp, 4

; 949  : 			printf("</tr></table>");

	push	OFFSET FLAT:$SG70860
	call	_printf
	add	esp, 4

; 950  : 			fflush(stdout);

	push	OFFSET FLAT:__iob+32
	call	_fflush
	add	esp, 4
$L70830:

; 952  : 
; 953  : 		/* Maj etat mesure et dates facturation */
; 954  : 		if(strcmp(valstatut, nouvstatut) && statut) QRY_UPDATE_IDVAL(idmesure, ETAT_FACTURATION, statut);

	mov	eax, DWORD PTR _nouvstatut$70703[ebp]
	push	eax
	mov	ecx, DWORD PTR _valstatut$70702[ebp]
	push	ecx
	call	_strcmp
	add	esp, 8
	test	eax, eax
	je	SHORT $L70863
	cmp	DWORD PTR _statut$70701[ebp], 0
	je	SHORT $L70863
	mov	edx, DWORD PTR _idmesure$70687[ebp]
	mov	DWORD PTR _val$70706[ebp+20], edx
	mov	eax, DWORD PTR _cf$[ebp]
	mov	ecx, DWORD PTR [eax+20]
	mov	DWORD PTR _val$70706[ebp+28], ecx
	mov	edx, DWORD PTR _statut$70701[ebp]
	mov	DWORD PTR _val$70706[ebp+32], edx
	mov	DWORD PTR _val$70706[ebp], 0
	mov	DWORD PTR _val$70706[ebp+4], 0
	mov	BYTE PTR _val$70706[ebp+12], 0
	push	0
	push	3
	lea	eax, DWORD PTR _val$70706[ebp]
	push	eax
	mov	ecx, DWORD PTR _cntxt$[ebp]
	push	ecx
	call	_qry_add_val
	add	esp, 16					; 00000010H
	test	eax, eax
	je	SHORT $L70863
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 954		; 000003baH
	jmp	$eva_err$70670
$L70863:

; 955  : 		if(strcmp(cf->mes[i].debfact, datedebcor)) QRY_UPDATE_VAL(cf->mes[i].id, DATE_FACT_DEBUT, datedebcor, 0);

	lea	eax, DWORD PTR _datedebcor$70693[ebp]
	push	eax
	mov	ecx, DWORD PTR _i$[ebp]
	imul	ecx, 168				; 000000a8H
	mov	edx, DWORD PTR _cf$[ebp]
	mov	eax, DWORD PTR [edx+248]
	lea	ecx, DWORD PTR [eax+ecx+120]
	push	ecx
	call	_strcmp
	add	esp, 8
	test	eax, eax
	je	$L70866
	mov	edx, DWORD PTR _i$[ebp]
	imul	edx, 168				; 000000a8H
	mov	eax, DWORD PTR _cf$[ebp]
	mov	ecx, DWORD PTR [eax+248]
	mov	edx, DWORD PTR [ecx+edx]
	mov	DWORD PTR _val$70706[ebp+20], edx
	mov	eax, DWORD PTR _cf$[ebp]
	mov	ecx, DWORD PTR [eax+72]
	mov	DWORD PTR _val$70706[ebp+28], ecx
	mov	DWORD PTR _val$70706[ebp+32], 0
	lea	edx, DWORD PTR _datedebcor$70693[ebp]
	mov	DWORD PTR _val$70706[ebp], edx
	mov	DWORD PTR _val$70706[ebp+4], 0
	mov	BYTE PTR _val$70706[ebp+12], 0
	push	0
	push	3
	lea	eax, DWORD PTR _val$70706[ebp]
	push	eax
	mov	ecx, DWORD PTR _cntxt$[ebp]
	push	ecx
	call	_qry_add_val
	add	esp, 16					; 00000010H
	test	eax, eax
	je	SHORT $L70866
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 955		; 000003bbH
	jmp	$eva_err$70670
$L70866:

; 956  : 		if(strcmp(cf->mes[i].finfact, datefincor)) QRY_UPDATE_VAL(cf->mes[i].id, DATE_FACT_FIN, datefincor, 0);

	lea	eax, DWORD PTR _datefincor$70694[ebp]
	push	eax
	mov	ecx, DWORD PTR _i$[ebp]
	imul	ecx, 168				; 000000a8H
	mov	edx, DWORD PTR _cf$[ebp]
	mov	eax, DWORD PTR [edx+248]
	lea	ecx, DWORD PTR [eax+ecx+130]
	push	ecx
	call	_strcmp
	add	esp, 8
	test	eax, eax
	je	$L70869
	mov	edx, DWORD PTR _i$[ebp]
	imul	edx, 168				; 000000a8H
	mov	eax, DWORD PTR _cf$[ebp]
	mov	ecx, DWORD PTR [eax+248]
	mov	edx, DWORD PTR [ecx+edx]
	mov	DWORD PTR _val$70706[ebp+20], edx
	mov	eax, DWORD PTR _cf$[ebp]
	mov	ecx, DWORD PTR [eax+76]
	mov	DWORD PTR _val$70706[ebp+28], ecx
	mov	DWORD PTR _val$70706[ebp+32], 0
	lea	edx, DWORD PTR _datefincor$70694[ebp]
	mov	DWORD PTR _val$70706[ebp], edx
	mov	DWORD PTR _val$70706[ebp+4], 0
	mov	BYTE PTR _val$70706[ebp+12], 0
	push	0
	push	3
	lea	eax, DWORD PTR _val$70706[ebp]
	push	eax
	mov	ecx, DWORD PTR _cntxt$[ebp]
	push	ecx
	call	_qry_add_val
	add	esp, 16					; 00000010H
	test	eax, eax
	je	SHORT $L70869
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 956		; 000003bcH
	jmp	$eva_err$70670
$L70869:

; 957  : 
; 958  : 		/* Ligne non necessaire : efface la ligne si elle existe et continue */
; 959  : 		if(!cf->mes[i].ts || (statut != cf->val_En_cours && statut != cf->val_Maintien && !b_calcmanuel && !nbjcorr))

	mov	eax, DWORD PTR _i$[ebp]
	imul	eax, 168				; 000000a8H
	mov	ecx, DWORD PTR _cf$[ebp]
	mov	edx, DWORD PTR [ecx+248]
	cmp	DWORD PTR [edx+eax+164], 0
	je	SHORT $L70871
	mov	eax, DWORD PTR _cf$[ebp]
	mov	ecx, DWORD PTR _statut$70701[ebp]
	cmp	ecx, DWORD PTR [eax+88]
	je	$L70870
	mov	edx, DWORD PTR _cf$[ebp]
	mov	eax, DWORD PTR _statut$70701[ebp]
	cmp	eax, DWORD PTR [edx+92]
	je	$L70870
	cmp	DWORD PTR _b_calcmanuel$70700[ebp], 0
	jne	$L70870
	cmp	DWORD PTR _nbjcorr$70699[ebp], 0
	jne	$L70870
$L70871:

; 961  : 			if(idlignefact)

	cmp	DWORD PTR _idlignefact$70688[ebp], 0
	je	SHORT $L70875

; 963  : 				snprintf(add_sz_str(qry), "UPDATE TLink SET DateDel='%s',IdWhoDel=%lu WHERE DateDel IS NULL AND IdObj=%lu",
; 964  : 					cntxt->timestamp, DYNTAB_TOUL(&cntxt->id_user), idlignefact);

	mov	ecx, DWORD PTR _idlignefact$70688[ebp]
	push	ecx
	push	10					; 0000000aH
	push	0
	push	0
	push	0
	mov	edx, DWORD PTR _cntxt$[ebp]
	add	edx, 29408				; 000072e0H
	push	edx
	call	_dyntab_val
	add	esp, 12					; 0000000cH
	push	eax
	call	_strtoul
	add	esp, 12					; 0000000cH
	push	eax
	mov	eax, DWORD PTR _cntxt$[ebp]
	add	eax, 29704				; 00007408H
	push	eax
	push	OFFSET FLAT:$SG70874
	push	2047					; 000007ffH
	lea	ecx, DWORD PTR _qry$[ebp]
	push	ecx
	call	__snprintf
	add	esp, 24					; 00000018H

; 965  : 				if(sql_exec_query(cntxt, qry)) STACK_ERROR;

	lea	edx, DWORD PTR _qry$[ebp]
	push	edx
	mov	eax, DWORD PTR _cntxt$[ebp]
	push	eax
	call	_sql_exec_query
	add	esp, 8
	test	eax, eax
	je	SHORT $L70875
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 965		; 000003c5H
	jmp	$eva_err$70670
$L70875:

; 967  : 
; 968  : 			/* Maj année de fin */
; 969  : 			QRY_UPDATE_VAL(idmesure, ANNEE_FIN, datefincor, 4);

	mov	edx, DWORD PTR _idmesure$70687[ebp]
	mov	DWORD PTR _val$70706[ebp+20], edx
	mov	eax, DWORD PTR _cf$[ebp]
	mov	ecx, DWORD PTR [eax+24]
	mov	DWORD PTR _val$70706[ebp+28], ecx
	mov	DWORD PTR _val$70706[ebp+32], 0
	lea	edx, DWORD PTR _datefincor$70694[ebp]
	mov	DWORD PTR _val$70706[ebp], edx
	mov	DWORD PTR _val$70706[ebp+4], 4
	mov	BYTE PTR _val$70706[ebp+12], 0
	push	0
	push	3
	lea	eax, DWORD PTR _val$70706[ebp]
	push	eax
	mov	ecx, DWORD PTR _cntxt$[ebp]
	push	ecx
	call	_qry_add_val
	add	esp, 16					; 00000010H
	test	eax, eax
	je	SHORT $L70877
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 969		; 000003c9H
	jmp	$eva_err$70670
$L70877:

; 970  : 			continue;

	jmp	$L70685
$L70870:

; 972  : 
; 973  : 		/* Mesure facturée : creation si la ligne n'existe pas */
; 974  : 		cf->nb_lignfact++;

	mov	eax, DWORD PTR _cf$[ebp]
	mov	ecx, DWORD PTR [eax+156]
	add	ecx, 1
	mov	edx, DWORD PTR _cf$[ebp]
	mov	DWORD PTR [edx+156], ecx

; 975  : 		if(!idlignefact)

	cmp	DWORD PTR _idlignefact$70688[ebp], 0
	jne	$L70886

; 977  : 			if(qry_add_new_obj(cntxt, &data, cf->form_LigneFacture)) STACK_ERROR;

	mov	eax, DWORD PTR _cf$[ebp]
	mov	ecx, DWORD PTR [eax+12]
	push	ecx
	lea	edx, DWORD PTR _data$[ebp]
	push	edx
	mov	eax, DWORD PTR _cntxt$[ebp]
	push	eax
	call	_qry_add_new_obj
	add	esp, 12					; 0000000cH
	test	eax, eax
	je	SHORT $L70879
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 977		; 000003d1H
	jmp	$eva_err$70670
$L70879:

; 978  : 			idlignefact = DYNTAB_TOUL(&data);

	push	10					; 0000000aH
	push	0
	push	0
	push	0
	lea	edx, DWORD PTR _data$[ebp]
	push	edx
	call	_dyntab_val
	add	esp, 12					; 0000000cH
	push	eax
	call	_strtoul
	add	esp, 12					; 0000000cH
	mov	DWORD PTR _idlignefact$70688[ebp], eax

; 979  : 			QRY_CREATE_REL(idlignefact, FACTURE, cf->idfacture);

	mov	eax, DWORD PTR _idlignefact$70688[ebp]
	mov	DWORD PTR _val$70706[ebp+20], eax
	mov	ecx, DWORD PTR _cf$[ebp]
	mov	edx, DWORD PTR [ecx+28]
	mov	DWORD PTR _val$70706[ebp+28], edx
	mov	eax, DWORD PTR _cf$[ebp]
	mov	ecx, DWORD PTR [eax+4]
	mov	DWORD PTR _val$70706[ebp+32], ecx
	mov	DWORD PTR _val$70706[ebp], 0
	mov	DWORD PTR _val$70706[ebp+4], 0
	mov	BYTE PTR _val$70706[ebp+12], 1
	push	0
	push	0
	lea	edx, DWORD PTR _val$70706[ebp]
	push	edx
	mov	eax, DWORD PTR _cntxt$[ebp]
	push	eax
	call	_qry_add_val
	add	esp, 16					; 00000010H
	test	eax, eax
	je	SHORT $L70883
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 979		; 000003d3H
	jmp	$eva_err$70670
$L70883:

; 980  : 			QRY_CREATE_REL(idlignefact, MES_LIGNE_FACT, idmesure);

	mov	edx, DWORD PTR _idlignefact$70688[ebp]
	mov	DWORD PTR _val$70706[ebp+20], edx
	mov	eax, DWORD PTR _cf$[ebp]
	mov	ecx, DWORD PTR [eax+32]
	mov	DWORD PTR _val$70706[ebp+28], ecx
	mov	edx, DWORD PTR _idmesure$70687[ebp]
	mov	DWORD PTR _val$70706[ebp+32], edx
	mov	DWORD PTR _val$70706[ebp], 0
	mov	DWORD PTR _val$70706[ebp+4], 0
	mov	BYTE PTR _val$70706[ebp+12], 1
	push	0
	push	0
	lea	eax, DWORD PTR _val$70706[ebp]
	push	eax
	mov	ecx, DWORD PTR _cntxt$[ebp]
	push	ecx
	call	_qry_add_val
	add	esp, 16					; 00000010H
	test	eax, eax
	je	SHORT $L70886
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 980		; 000003d4H
	jmp	$eva_err$70670
$L70886:

; 982  : 
; 983  : 		/* Mise a jour des valeurs calculees */
; 984  : 		QRY_UPDATE_REL(idlignefact, DEST_FACTURE, iddest);

	mov	eax, DWORD PTR _idlignefact$70688[ebp]
	mov	DWORD PTR _val$70706[ebp+20], eax
	mov	ecx, DWORD PTR _cf$[ebp]
	mov	edx, DWORD PTR [ecx+36]
	mov	DWORD PTR _val$70706[ebp+28], edx
	mov	eax, DWORD PTR _iddest$70689[ebp]
	mov	DWORD PTR _val$70706[ebp+32], eax
	mov	DWORD PTR _val$70706[ebp], 0
	mov	DWORD PTR _val$70706[ebp+4], 0
	mov	BYTE PTR _val$70706[ebp+12], 1
	push	0
	push	3
	lea	ecx, DWORD PTR _val$70706[ebp]
	push	ecx
	mov	edx, DWORD PTR _cntxt$[ebp]
	push	edx
	call	_qry_add_val
	add	esp, 16					; 00000010H
	test	eax, eax
	je	SHORT $L70889
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 984		; 000003d8H
	jmp	$eva_err$70670
$L70889:

; 985  : 		if(nbjours)

	cmp	DWORD PTR _nbjours$70698[ebp], 0
	je	$L70890

; 987  : 			QRY_UPDATE_VAL(idmesure, ANNEE_FIN, NULL, 0);

	mov	ecx, DWORD PTR _idmesure$70687[ebp]
	mov	DWORD PTR _val$70706[ebp+20], ecx
	mov	edx, DWORD PTR _cf$[ebp]
	mov	eax, DWORD PTR [edx+24]
	mov	DWORD PTR _val$70706[ebp+28], eax
	mov	DWORD PTR _val$70706[ebp+32], 0
	mov	DWORD PTR _val$70706[ebp], 0
	mov	DWORD PTR _val$70706[ebp+4], 0
	mov	BYTE PTR _val$70706[ebp+12], 0
	push	0
	push	3
	lea	ecx, DWORD PTR _val$70706[ebp]
	push	ecx
	mov	edx, DWORD PTR _cntxt$[ebp]
	push	edx
	call	_qry_add_val
	add	esp, 16					; 00000010H
	test	eax, eax
	je	SHORT $L70893
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 987		; 000003dbH
	jmp	$eva_err$70670
$L70893:

; 988  : 			QRY_UPDATE_VAL(idlignefact, QTE_FACTURE, txt, snprintf(add_sz_str(txt), "%d", nbjours));

	mov	ecx, DWORD PTR _idlignefact$70688[ebp]
	mov	DWORD PTR _val$70706[ebp+20], ecx
	mov	edx, DWORD PTR _cf$[ebp]
	mov	eax, DWORD PTR [edx+40]
	mov	DWORD PTR _val$70706[ebp+28], eax
	mov	DWORD PTR _val$70706[ebp+32], 0
	lea	ecx, DWORD PTR _txt$[ebp]
	mov	DWORD PTR _val$70706[ebp], ecx
	mov	edx, DWORD PTR _nbjours$70698[ebp]
	push	edx
	push	OFFSET FLAT:$SG70894
	push	31					; 0000001fH
	lea	eax, DWORD PTR _txt$[ebp]
	push	eax
	call	__snprintf
	add	esp, 16					; 00000010H
	mov	DWORD PTR _val$70706[ebp+4], eax
	mov	BYTE PTR _val$70706[ebp+12], 0
	push	0
	push	3
	lea	ecx, DWORD PTR _val$70706[ebp]
	push	ecx
	mov	edx, DWORD PTR _cntxt$[ebp]
	push	edx
	call	_qry_add_val
	add	esp, 16					; 00000010H
	test	eax, eax
	je	SHORT $L70896
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 988		; 000003dcH
	jmp	$eva_err$70670
$L70896:

; 990  : 		else

	jmp	SHORT $L70900
$L70890:

; 992  : 			QRY_UPDATE_VAL(idlignefact, QTE_FACTURE, NULL, 0);

	mov	ecx, DWORD PTR _idlignefact$70688[ebp]
	mov	DWORD PTR _val$70706[ebp+20], ecx
	mov	edx, DWORD PTR _cf$[ebp]
	mov	eax, DWORD PTR [edx+40]
	mov	DWORD PTR _val$70706[ebp+28], eax
	mov	DWORD PTR _val$70706[ebp+32], 0
	mov	DWORD PTR _val$70706[ebp], 0
	mov	DWORD PTR _val$70706[ebp+4], 0
	mov	BYTE PTR _val$70706[ebp+12], 0
	push	0
	push	3
	lea	ecx, DWORD PTR _val$70706[ebp]
	push	ecx
	mov	edx, DWORD PTR _cntxt$[ebp]
	push	edx
	call	_qry_add_val
	add	esp, 16					; 00000010H
	test	eax, eax
	je	SHORT $L70900
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 992		; 000003e0H
	jmp	$eva_err$70670
$L70900:

; 994  : 		if(nbjcorr)

	cmp	DWORD PTR _nbjcorr$70699[ebp], 0
	je	$L70901

; 996  : 			QRY_UPDATE_VAL(idlignefact, QTE_CORRECTION, txt, snprintf(add_sz_str(txt), "%d", nbjcorr));

	mov	ecx, DWORD PTR _idlignefact$70688[ebp]
	mov	DWORD PTR _val$70706[ebp+20], ecx
	mov	edx, DWORD PTR _cf$[ebp]
	mov	eax, DWORD PTR [edx+44]
	mov	DWORD PTR _val$70706[ebp+28], eax
	mov	DWORD PTR _val$70706[ebp+32], 0
	lea	ecx, DWORD PTR _txt$[ebp]
	mov	DWORD PTR _val$70706[ebp], ecx
	mov	edx, DWORD PTR _nbjcorr$70699[ebp]
	push	edx
	push	OFFSET FLAT:$SG70902
	push	31					; 0000001fH
	lea	eax, DWORD PTR _txt$[ebp]
	push	eax
	call	__snprintf
	add	esp, 16					; 00000010H
	mov	DWORD PTR _val$70706[ebp+4], eax
	mov	BYTE PTR _val$70706[ebp+12], 0
	push	0
	push	3
	lea	ecx, DWORD PTR _val$70706[ebp]
	push	ecx
	mov	edx, DWORD PTR _cntxt$[ebp]
	push	edx
	call	_qry_add_val
	add	esp, 16					; 00000010H
	test	eax, eax
	je	SHORT $L70904
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 996		; 000003e4H
	jmp	$eva_err$70670
$L70904:

; 998  : 		else

	jmp	SHORT $L70908
$L70901:

; 1000 : 			QRY_UPDATE_VAL(idlignefact, QTE_CORRECTION, NULL, 0);

	mov	ecx, DWORD PTR _idlignefact$70688[ebp]
	mov	DWORD PTR _val$70706[ebp+20], ecx
	mov	edx, DWORD PTR _cf$[ebp]
	mov	eax, DWORD PTR [edx+44]
	mov	DWORD PTR _val$70706[ebp+28], eax
	mov	DWORD PTR _val$70706[ebp+32], 0
	mov	DWORD PTR _val$70706[ebp], 0
	mov	DWORD PTR _val$70706[ebp+4], 0
	mov	BYTE PTR _val$70706[ebp+12], 0
	push	0
	push	3
	lea	ecx, DWORD PTR _val$70706[ebp]
	push	ecx
	mov	edx, DWORD PTR _cntxt$[ebp]
	push	edx
	call	_qry_add_val
	add	esp, 16					; 00000010H
	test	eax, eax
	je	SHORT $L70908
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 1000		; 000003e8H
	jmp	$eva_err$70670
$L70908:

; 1002 : 		if(qry_update_idobj_idfield(cntxt, idlignefact, cf->val_MOTIF_CORRECTION, ano, 3)) STACK_ERROR;

	push	3
	mov	ecx, DWORD PTR _ano$70707[ebp]
	push	ecx
	mov	edx, DWORD PTR _cf$[ebp]
	mov	eax, DWORD PTR [edx+48]
	push	eax
	mov	ecx, DWORD PTR _idlignefact$70688[ebp]
	push	ecx
	mov	edx, DWORD PTR _cntxt$[ebp]
	push	edx
	call	_qry_update_idobj_idfield
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L70909
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 1002		; 000003eaH
	jmp	SHORT $eva_err$70670
$L70909:

; 1003 : 	}

	jmp	$L70685
$L70686:

; 1004 : 
; 1005 : 	printf("</table><br><br>"
; 1006 : 			"<table border=1 rules=none width=100%%><tr><td align=center>%lu mesures examinées<br>%lu mesures modifiées<br>%lu mesures facturées</td></tr>"
; 1007 : 			"<tr><td align=center><font size=-1><i>Utilisez la commande Fichier/Enregistrer "
; 1008 : 				"de votre navigateur si vous voulez conserver ce journal</td></tr>"
; 1009 : 			"<tr><td align=center><br><input type=submit value='Revenir à la facture' name='B$#NOP'></td></tr>"
; 1010 : 			"</table>\n<script>document.mainform['B$#NOP'].focus();</script>",
; 1011 : 			cf->nb_mes, cf->nb_modif, cf->nb_lignfact);

	mov	ecx, DWORD PTR _cf$[ebp]
	mov	edx, DWORD PTR [ecx+156]
	push	edx
	mov	eax, DWORD PTR _cf$[ebp]
	mov	ecx, DWORD PTR [eax+160]
	push	ecx
	mov	edx, DWORD PTR _cf$[ebp]
	mov	eax, DWORD PTR [edx+244]
	push	eax
	push	OFFSET FLAT:$SG70910
	call	_printf
	add	esp, 16					; 00000010H

; 1012 : 
; 1013 : 	cntxt->b_terminate = 31;

	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29776], 31		; 0000001fH
$eva_noerr$70671:

; 1014 : 
; 1015 : 	RETURN_OK_CLEANUP;

	push	0
	push	OFFSET FLAT:$SG70911
	push	OFFSET FLAT:$SG70912
	mov	edx, DWORD PTR _cntxt$[ebp]
	push	edx
	call	_err_clear
	add	esp, 16					; 00000010H
$eva_err$70670:
	mov	eax, DWORD PTR _cntxt$[ebp]
	cmp	DWORD PTR [eax+29872], 0
	je	SHORT $L70913
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	edx, DWORD PTR [ecx+29900]
	push	edx
	push	OFFSET FLAT:$SG70914
	push	OFFSET FLAT:$SG70915
	mov	eax, DWORD PTR _cntxt$[ebp]
	push	eax
	call	_err_add_context
	add	esp, 16					; 00000010H
$L70913:
	lea	ecx, DWORD PTR _lignfact$[ebp]
	push	ecx
	call	_dyntab_free
	add	esp, 4
	lea	edx, DWORD PTR _data$[ebp]
	push	edx
	call	_dyntab_free
	add	esp, 4
	mov	eax, DWORD PTR _msg$[ebp]
	push	eax
	call	_mem_free
	add	esp, 4
	mov	DWORD PTR _msg$[ebp], 0
	mov	ecx, DWORD PTR _cntxt$[ebp]
	xor	eax, eax
	cmp	DWORD PTR [ecx+29872], 0
	setne	al

; 1016 : }

	pop	edi
	pop	esi
	mov	esp, ebp
	pop	ebp
	ret	0
_FactureAEMO ENDP
_TEXT	ENDS
PUBLIC	_EcheancierAEMO
_DATA	SEGMENT
$SG70930 DB	'D:\Travail\ABI\EVA\V4.0\CGI\Brunix-2016\dll_adsea01.c', 00H
	ORG $+2
$SG70931 DB	'EcheancierAEMO', 00H
	ORG $+1
$SG70933 DB	'D:\Travail\ABI\EVA\V4.0\CGI\Brunix-2016\dll_adsea01.c', 00H
	ORG $+2
$SG70934 DB	'EcheancierAEMO', 00H
_DATA	ENDS
_TEXT	SEGMENT
_cntxt$ = 8
_i_ctrl$ = 12
_cf$ = -252
_EcheancierAEMO PROC NEAR

; 1029 : ){

	push	ebp
	mov	ebp, esp
	sub	esp, 252				; 000000fcH
	push	edi

; 1030 : 	cntxt_fact cf = {0};

	mov	DWORD PTR _cf$[ebp], 0
	mov	ecx, 62					; 0000003eH
	xor	eax, eax
	lea	edi, DWORD PTR _cf$[ebp+4]
	rep stosd

; 1031 : 
; 1032 : 	/* Lecture des mesures à examiner */
; 1033 : 	if(Init_AEMO(cntxt, &cf) || Calc_echeancier(cntxt, &cf)) STACK_ERROR;

	lea	eax, DWORD PTR _cf$[ebp]
	push	eax
	mov	ecx, DWORD PTR _cntxt$[ebp]
	push	ecx
	call	_Init_AEMO
	add	esp, 8
	test	eax, eax
	jne	SHORT $L70927
	lea	edx, DWORD PTR _cf$[ebp]
	push	edx
	mov	eax, DWORD PTR _cntxt$[ebp]
	push	eax
	call	_Calc_echeancier
	add	esp, 8
	test	eax, eax
	je	SHORT $eva_noerr$70929
$L70927:
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 1033		; 00000409H
	jmp	SHORT $eva_err$70928
$eva_noerr$70929:

; 1034 : 
; 1035 : 	RETURN_OK_CLEANUP;

	push	0
	push	OFFSET FLAT:$SG70930
	push	OFFSET FLAT:$SG70931
	mov	edx, DWORD PTR _cntxt$[ebp]
	push	edx
	call	_err_clear
	add	esp, 16					; 00000010H
$eva_err$70928:
	mov	eax, DWORD PTR _cntxt$[ebp]
	cmp	DWORD PTR [eax+29872], 0
	je	SHORT $L70932
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	edx, DWORD PTR [ecx+29900]
	push	edx
	push	OFFSET FLAT:$SG70933
	push	OFFSET FLAT:$SG70934
	mov	eax, DWORD PTR _cntxt$[ebp]
	push	eax
	call	_err_add_context
	add	esp, 16					; 00000010H
$L70932:
	mov	DWORD PTR _i_ctrl$[ebp], 0
	mov	ecx, DWORD PTR _cntxt$[ebp]
	xor	eax, eax
	cmp	DWORD PTR [ecx+29872], 0
	setne	al

; 1036 : }

	pop	edi
	mov	esp, ebp
	pop	ebp
	ret	0
_EcheancierAEMO ENDP
_TEXT	ENDS
PUBLIC	_Init_TPS
EXTRN	_qry_obj_data:NEAR
_DATA	SEGMENT
	ORG $+1
$SG70948 DB	'Facturation TPS', 00H
$SG70949 DB	'Ech', 0e9H, 'ancier TPS', 00H
	ORG $+1
$SG70950 DB	'FIN_TPS', 00H
$SG70951 DB	'TPS_LIGNE_FACT', 00H
	ORG $+1
$SG70952 DB	'MOIS_FACTURE', 00H
	ORG $+3
$SG70953 DB	'MOIS_CORRECTION', 00H
$SG70954 DB	'REF_TPS', 00H
$SG70955 DB	'ORD_JUGTS_EFFET_DU', 00H
	ORG $+1
$SG70956 DB	'ECHEANCE', 00H
	ORG $+3
$SG70957 DB	'ORD_JUGTS_DATE', 00H
	ORG $+1
$SG70960 DB	'Lecture des donnees complementaires ...', 00H
$SG70962 DB	'MIN(<-REF_TPS->ORD_JUGTS_EFFET_DU)', 00H
	ORG $+1
$SG70964 DB	'MAX(<-REF_TPS->ORD_JUGTS_DATE)', 00H
	ORG $+1
$SG70966 DB	'ETAT_FACTURATION', 00H
	ORG $+3
$SG70968 DB	'FACT_MODE', 00H
	ORG $+2
$SG70970 DB	'DATE_FACT_DEBUT', 00H
$SG70972 DB	'DATE_FACT_FIN', 00H
	ORG $+2
$SG70974 DB	'CAISSE_PF', 00H
	ORG $+2
$SG70976 DB	'FORCER_ETAT', 00H
$SG70978 DB	'DATE_ECHEANCE', 00H
	ORG $+2
$SG70980 DB	'DELEGUE', 00H
$SG70981 DB	'0%   10%   20%   30%   40%   50%   60%   70%   80%   90%'
	DB	'   100%', 0aH, '|-----|-----|-----|-----|-----|-----|-----|--'
	DB	'---|-----|-----|', 0aH, 00H
	ORG $+1
$SG70982 DB	'<hr><font face=Courier><b><pre>Examen de %lu mesures', 0aH
	DB	'%s', 00H
$SG70995 DB	'SELECT DISTINCT TLink0.IdObj FROM TLink AS TLink0', 0aH, 'I'
	DB	'NNER JOIN TLink AS TLink1 ON TLink0.IdObj=TLink1.IdObj', 0aH, 'W'
	DB	'HERE TLink0.DateDel IS NULL AND TLink0.IdField=%lu AND TLink0'
	DB	'.IdRelObj=%lu', 0aH, 'AND TLink1.DateDel IS NULL AND TLink1.I'
	DB	'dField=%lu AND TLink1.IdValue=%lu', 0aH, 00H
$SG70999 DB	'ECHEANCE', 00H
	ORG $+3
$SG71001 DB	'ORD_JUGTS_EFFET_DU', 00H
	ORG $+1
$SG71003 DB	'Main lev', 0e9H, 'e', 00H
	ORG $+1
$SG71004 DB	'ORD_JUGTS_TYPE', 00H
	ORG $+1
$SG71010 DB	'Debut de mesure inconnu', 00H
$SG71012 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG71015 DB	'Fin de mesure inconnue', 00H
	ORG $+1
$SG71017 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG71018 DB	'*', 0aH, 00H
	ORG $+1
$SG71020 DB	'D:\Travail\ABI\EVA\V4.0\CGI\Brunix-2016\dll_adsea01.c', 00H
	ORG $+2
$SG71021 DB	'Init_TPS', 00H
	ORG $+3
$SG71023 DB	'D:\Travail\ABI\EVA\V4.0\CGI\Brunix-2016\dll_adsea01.c', 00H
	ORG $+2
$SG71024 DB	'Init_TPS', 00H
_DATA	ENDS
_TEXT	SEGMENT
_cntxt$ = 8
_cf$ = 12
_data$ = -2068
_i$ = -2076
_cnt$ = -2072
_qry$ = -2048
_datedeb$70986 = -2088
_datefin$70987 = -2080
_d_echeance$70988 = -2092
_ano$70989 = -2096
_idval$70990 = -2084
_effetdu$71000 = -2100
_datejug$71002 = -2104
_Init_TPS PROC NEAR

; 1050 : ){

	push	ebp
	mov	ebp, esp
	sub	esp, 2112				; 00000840H
	push	edi

; 1051 : 	DynTable data = { 0 };

	mov	DWORD PTR _data$[ebp], 0
	xor	eax, eax
	mov	DWORD PTR _data$[ebp+4], eax
	mov	DWORD PTR _data$[ebp+8], eax
	mov	DWORD PTR _data$[ebp+12], eax
	mov	DWORD PTR _data$[ebp+16], eax

; 1052 : 	unsigned long i, cnt = 0;

	mov	DWORD PTR _cnt$[ebp], 0

; 1053 : 	char qry[2048] = {0};

	mov	BYTE PTR _qry$[ebp], 0
	mov	ecx, 511				; 000001ffH
	xor	eax, eax
	lea	edi, DWORD PTR _qry$[ebp+1]
	rep stosd
	stosw
	stosb

; 1054 : 
; 1055 : 	/* Définition des constantes spécifiques */
; 1056 : 	cf->label = cf->idfacture ? "Facturation TPS" : "Echéancier TPS";

	mov	ecx, DWORD PTR _cf$[ebp]
	cmp	DWORD PTR [ecx+4], 0
	je	SHORT $L71289
	mov	DWORD PTR -2108+[ebp], OFFSET FLAT:$SG70948
	jmp	SHORT $L71290
$L71289:
	mov	DWORD PTR -2108+[ebp], OFFSET FLAT:$SG70949
$L71290:
	mov	edx, DWORD PTR _cf$[ebp]
	mov	eax, DWORD PTR -2108+[ebp]
	mov	DWORD PTR [edx], eax

; 1057 : 	cf->form_Mesure = 27108;

	mov	ecx, DWORD PTR _cf$[ebp]
	mov	DWORD PTR [ecx+8], 27108		; 000069e4H

; 1058 : 	cf->form_LigneFacture = 188313;

	mov	edx, DWORD PTR _cf$[ebp]
	mov	DWORD PTR [edx+12], 188313		; 0002df99H

; 1059 : 	cf->val_ANNEE_FIN = get_id_value(cntxt, add_sz_str("FIN_TPS"));

	push	7
	push	OFFSET FLAT:$SG70950
	mov	eax, DWORD PTR _cntxt$[ebp]
	push	eax
	call	_get_id_value
	add	esp, 12					; 0000000cH
	mov	ecx, DWORD PTR _cf$[ebp]
	mov	DWORD PTR [ecx+24], eax

; 1060 : 	cf->val_MES_LIGNE_FACT = get_id_value(cntxt, add_sz_str("TPS_LIGNE_FACT"));

	push	14					; 0000000eH
	push	OFFSET FLAT:$SG70951
	mov	edx, DWORD PTR _cntxt$[ebp]
	push	edx
	call	_get_id_value
	add	esp, 12					; 0000000cH
	mov	ecx, DWORD PTR _cf$[ebp]
	mov	DWORD PTR [ecx+32], eax

; 1061 : 	cf->val_QTE_FACTURE = get_id_value(cntxt, add_sz_str("MOIS_FACTURE"));

	push	12					; 0000000cH
	push	OFFSET FLAT:$SG70952
	mov	edx, DWORD PTR _cntxt$[ebp]
	push	edx
	call	_get_id_value
	add	esp, 12					; 0000000cH
	mov	ecx, DWORD PTR _cf$[ebp]
	mov	DWORD PTR [ecx+40], eax

; 1062 : 	cf->val_QTE_CORRECTION = get_id_value(cntxt, add_sz_str("MOIS_CORRECTION"));

	push	15					; 0000000fH
	push	OFFSET FLAT:$SG70953
	mov	edx, DWORD PTR _cntxt$[ebp]
	push	edx
	call	_get_id_value
	add	esp, 12					; 0000000cH
	mov	ecx, DWORD PTR _cf$[ebp]
	mov	DWORD PTR [ecx+44], eax

; 1063 : 	cf->val_MESURE_JUGT = get_id_value(cntxt, add_sz_str("REF_TPS"));

	push	7
	push	OFFSET FLAT:$SG70954
	mov	edx, DWORD PTR _cntxt$[ebp]
	push	edx
	call	_get_id_value
	add	esp, 12					; 0000000cH
	mov	ecx, DWORD PTR _cf$[ebp]
	mov	DWORD PTR [ecx+52], eax

; 1064 : 	cf->val_EFFET_JUGT = get_id_value(cntxt, add_sz_str("ORD_JUGTS_EFFET_DU"));

	push	18					; 00000012H
	push	OFFSET FLAT:$SG70955
	mov	edx, DWORD PTR _cntxt$[ebp]
	push	edx
	call	_get_id_value
	add	esp, 12					; 0000000cH
	mov	ecx, DWORD PTR _cf$[ebp]
	mov	DWORD PTR [ecx+56], eax

; 1065 : 	cf->val_ECHEANCE_JUGT = get_id_value(cntxt, add_sz_str("ECHEANCE"));

	push	8
	push	OFFSET FLAT:$SG70956
	mov	edx, DWORD PTR _cntxt$[ebp]
	push	edx
	call	_get_id_value
	add	esp, 12					; 0000000cH
	mov	ecx, DWORD PTR _cf$[ebp]
	mov	DWORD PTR [ecx+60], eax

; 1066 : 	cf->val_DATE_JUGT = get_id_value(cntxt, add_sz_str("ORD_JUGTS_DATE"));

	push	14					; 0000000eH
	push	OFFSET FLAT:$SG70957
	mov	edx, DWORD PTR _cntxt$[ebp]
	push	edx
	call	_get_id_value
	add	esp, 12					; 0000000cH
	mov	ecx, DWORD PTR _cf$[ebp]
	mov	DWORD PTR [ecx+64], eax

; 1067 : 
; 1068 : 	/* Creation de la liste des mesures a traiter */
; 1069 : 	if(Init_liste_mes(cntxt, cf)) STACK_ERROR;

	mov	edx, DWORD PTR _cf$[ebp]
	push	edx
	mov	eax, DWORD PTR _cntxt$[ebp]
	push	eax
	call	_Init_liste_mes
	add	esp, 8
	test	eax, eax
	je	SHORT $L70958
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 1069		; 0000042dH
	jmp	$eva_err$70959
$L70958:

; 1070 : 
; 1071 : 	/* Lecture des donnees complementaires */
; 1072 : 	printf("Lecture des donnees complementaires ...");

	push	OFFSET FLAT:$SG70960
	call	_printf
	add	esp, 4

; 1073 : 	fflush(stdout);

	push	OFFSET FLAT:__iob+32
	call	_fflush
	add	esp, 4

; 1074 : 	if(qry_add_table_col(cntxt, &cf->tmes, add_sz_str("MIN(<-REF_TPS->ORD_JUGTS_EFFET_DU)"))) STACK_ERROR;

	push	34					; 00000022H
	push	OFFSET FLAT:$SG70962
	mov	edx, DWORD PTR _cf$[ebp]
	add	edx, 224				; 000000e0H
	push	edx
	mov	eax, DWORD PTR _cntxt$[ebp]
	push	eax
	call	_qry_add_table_col
	add	esp, 16					; 00000010H
	test	eax, eax
	je	SHORT $L70961
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 1074		; 00000432H
	jmp	$eva_err$70959
$L70961:

; 1075 : 	if(qry_add_table_col(cntxt, &cf->tmes, add_sz_str("MAX(<-REF_TPS->ORD_JUGTS_DATE)"))) STACK_ERROR;

	push	30					; 0000001eH
	push	OFFSET FLAT:$SG70964
	mov	edx, DWORD PTR _cf$[ebp]
	add	edx, 224				; 000000e0H
	push	edx
	mov	eax, DWORD PTR _cntxt$[ebp]
	push	eax
	call	_qry_add_table_col
	add	esp, 16					; 00000010H
	test	eax, eax
	je	SHORT $L70963
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 1075		; 00000433H
	jmp	$eva_err$70959
$L70963:

; 1076 : 	if(qry_add_table_col(cntxt, &cf->tmes, add_sz_str("ETAT_FACTURATION"))) STACK_ERROR;

	push	16					; 00000010H
	push	OFFSET FLAT:$SG70966
	mov	edx, DWORD PTR _cf$[ebp]
	add	edx, 224				; 000000e0H
	push	edx
	mov	eax, DWORD PTR _cntxt$[ebp]
	push	eax
	call	_qry_add_table_col
	add	esp, 16					; 00000010H
	test	eax, eax
	je	SHORT $L70965
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 1076		; 00000434H
	jmp	$eva_err$70959
$L70965:

; 1077 : 	if(qry_add_table_col(cntxt, &cf->tmes, add_sz_str("FACT_MODE"))) STACK_ERROR;

	push	9
	push	OFFSET FLAT:$SG70968
	mov	edx, DWORD PTR _cf$[ebp]
	add	edx, 224				; 000000e0H
	push	edx
	mov	eax, DWORD PTR _cntxt$[ebp]
	push	eax
	call	_qry_add_table_col
	add	esp, 16					; 00000010H
	test	eax, eax
	je	SHORT $L70967
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 1077		; 00000435H
	jmp	$eva_err$70959
$L70967:

; 1078 : 	if(qry_add_table_col(cntxt, &cf->tmes, add_sz_str("DATE_FACT_DEBUT"))) STACK_ERROR;

	push	15					; 0000000fH
	push	OFFSET FLAT:$SG70970
	mov	edx, DWORD PTR _cf$[ebp]
	add	edx, 224				; 000000e0H
	push	edx
	mov	eax, DWORD PTR _cntxt$[ebp]
	push	eax
	call	_qry_add_table_col
	add	esp, 16					; 00000010H
	test	eax, eax
	je	SHORT $L70969
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 1078		; 00000436H
	jmp	$eva_err$70959
$L70969:

; 1079 : 	if(qry_add_table_col(cntxt, &cf->tmes, add_sz_str("DATE_FACT_FIN"))) STACK_ERROR;

	push	13					; 0000000dH
	push	OFFSET FLAT:$SG70972
	mov	edx, DWORD PTR _cf$[ebp]
	add	edx, 224				; 000000e0H
	push	edx
	mov	eax, DWORD PTR _cntxt$[ebp]
	push	eax
	call	_qry_add_table_col
	add	esp, 16					; 00000010H
	test	eax, eax
	je	SHORT $L70971
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 1079		; 00000437H
	jmp	$eva_err$70959
$L70971:

; 1080 : 	if(qry_add_table_col(cntxt, &cf->tmes, add_sz_str("CAISSE_PF"))) STACK_ERROR;

	push	9
	push	OFFSET FLAT:$SG70974
	mov	edx, DWORD PTR _cf$[ebp]
	add	edx, 224				; 000000e0H
	push	edx
	mov	eax, DWORD PTR _cntxt$[ebp]
	push	eax
	call	_qry_add_table_col
	add	esp, 16					; 00000010H
	test	eax, eax
	je	SHORT $L70973
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 1080		; 00000438H
	jmp	$eva_err$70959
$L70973:

; 1081 : 	if(qry_add_table_col(cntxt, &cf->tmes, add_sz_str("FORCER_ETAT"))) STACK_ERROR;

	push	11					; 0000000bH
	push	OFFSET FLAT:$SG70976
	mov	edx, DWORD PTR _cf$[ebp]
	add	edx, 224				; 000000e0H
	push	edx
	mov	eax, DWORD PTR _cntxt$[ebp]
	push	eax
	call	_qry_add_table_col
	add	esp, 16					; 00000010H
	test	eax, eax
	je	SHORT $L70975
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 1081		; 00000439H
	jmp	$eva_err$70959
$L70975:

; 1082 : 	if(qry_add_table_col(cntxt, &cf->tmes, add_sz_str("DATE_ECHEANCE"))) STACK_ERROR;

	push	13					; 0000000dH
	push	OFFSET FLAT:$SG70978
	mov	edx, DWORD PTR _cf$[ebp]
	add	edx, 224				; 000000e0H
	push	edx
	mov	eax, DWORD PTR _cntxt$[ebp]
	push	eax
	call	_qry_add_table_col
	add	esp, 16					; 00000010H
	test	eax, eax
	je	SHORT $L70977
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 1082		; 0000043aH
	jmp	$eva_err$70959
$L70977:

; 1083 : 	if(qry_add_table_col(cntxt, &cf->tmes, add_sz_str("DELEGUE"))) STACK_ERROR;

	push	7
	push	OFFSET FLAT:$SG70980
	mov	edx, DWORD PTR _cf$[ebp]
	add	edx, 224				; 000000e0H
	push	edx
	mov	eax, DWORD PTR _cntxt$[ebp]
	push	eax
	call	_qry_add_table_col
	add	esp, 16					; 00000010H
	test	eax, eax
	je	SHORT $L70979
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 1083		; 0000043bH
	jmp	$eva_err$70959
$L70979:

; 1084 : 
; 1085 : 	/* Affichage de la barre d'avancement */
; 1086 : 	printf("<hr><font face=Courier><b><pre>Examen de %lu mesures\n%s", cf->nb_mes, WAIT_TXTSCALE);

	push	OFFSET FLAT:$SG70981
	mov	edx, DWORD PTR _cf$[ebp]
	mov	eax, DWORD PTR [edx+244]
	push	eax
	push	OFFSET FLAT:$SG70982
	call	_printf
	add	esp, 12					; 0000000cH

; 1087 : 	fflush(stdout);

	push	OFFSET FLAT:__iob+32
	call	_fflush
	add	esp, 4

; 1088 : 
; 1089 : 	/* Pour chaque mesure a examiner */
; 1090 : 	for(i = 0; i < cf->nb_mes; i++)

	mov	DWORD PTR _i$[ebp], 0
	jmp	SHORT $L70983
$L70984:
	mov	ecx, DWORD PTR _i$[ebp]
	add	ecx, 1
	mov	DWORD PTR _i$[ebp], ecx
$L70983:
	mov	edx, DWORD PTR _cf$[ebp]
	mov	eax, DWORD PTR _i$[ebp]
	cmp	eax, DWORD PTR [edx+244]
	jae	$L70985

; 1092 : 		char *datedeb = cf->mes[i].deb;

	mov	ecx, DWORD PTR _i$[ebp]
	imul	ecx, 168				; 000000a8H
	mov	edx, DWORD PTR _cf$[ebp]
	mov	eax, DWORD PTR [edx+248]
	lea	ecx, DWORD PTR [eax+ecx+4]
	mov	DWORD PTR _datedeb$70986[ebp], ecx

; 1093 : 		char *datefin = cf->mes[i].fin;

	mov	edx, DWORD PTR _i$[ebp]
	imul	edx, 168				; 000000a8H
	mov	eax, DWORD PTR _cf$[ebp]
	mov	ecx, DWORD PTR [eax+248]
	lea	edx, DWORD PTR [ecx+edx+14]
	mov	DWORD PTR _datefin$70987[ebp], edx

; 1094 : 		char *d_echeance = dyntab_val(&cf->tmes, i, 9);

	push	9
	mov	eax, DWORD PTR _i$[ebp]
	push	eax
	mov	ecx, DWORD PTR _cf$[ebp]
	add	ecx, 224				; 000000e0H
	push	ecx
	call	_dyntab_val
	add	esp, 12					; 0000000cH
	mov	DWORD PTR _d_echeance$70988[ebp], eax

; 1095 : 		DynTable *ano = &cf->mes[i].notes;

	mov	edx, DWORD PTR _i$[ebp]
	imul	edx, 168				; 000000a8H
	mov	eax, DWORD PTR _cf$[ebp]
	mov	ecx, DWORD PTR [eax+248]
	lea	edx, DWORD PTR [ecx+edx+52]
	mov	DWORD PTR _ano$70989[ebp], edx

; 1096 : 		unsigned long idval = get_id_value(cntxt, DYNTAB_VAL_SZ(&cf->tmes, i, 2));

	push	2
	mov	eax, DWORD PTR _i$[ebp]
	push	eax
	mov	ecx, DWORD PTR _cf$[ebp]
	add	ecx, 224				; 000000e0H
	push	ecx
	call	_dyntab_sz
	add	esp, 12					; 0000000cH
	push	eax
	push	2
	mov	edx, DWORD PTR _i$[ebp]
	push	edx
	mov	eax, DWORD PTR _cf$[ebp]
	add	eax, 224				; 000000e0H
	push	eax
	call	_dyntab_val
	add	esp, 12					; 0000000cH
	push	eax
	mov	ecx, DWORD PTR _cntxt$[ebp]
	push	ecx
	call	_get_id_value
	add	esp, 12					; 0000000cH
	mov	DWORD PTR _idval$70990[ebp], eax

; 1097 : 
; 1098 : 		/* Barre d'avancement */
; 1099 : 		if(i * 60 / cf->nb_mes >= cnt)

	mov	eax, DWORD PTR _i$[ebp]
	imul	eax, 60					; 0000003cH
	mov	ecx, DWORD PTR _cf$[ebp]
	xor	edx, edx
	div	DWORD PTR [ecx+244]
	cmp	eax, DWORD PTR _cnt$[ebp]
	jb	SHORT $L70991

; 1101 : 			putc('*', stdout);

	push	OFFSET FLAT:__iob+32
	push	42					; 0000002aH
	call	_putc
	add	esp, 8

; 1102 : 			fflush(stdout);

	push	OFFSET FLAT:__iob+32
	call	_fflush
	add	esp, 4

; 1103 : 			cnt++;

	mov	edx, DWORD PTR _cnt$[ebp]
	add	edx, 1
	mov	DWORD PTR _cnt$[ebp], edx
$L70991:

; 1105 : 
; 1106 : 		/* Lecture des donnees de la mesure */
; 1107 : 		cf->mes[i].id = DYNTAB_TOULRC(&cf->tmes, i, 0);

	push	10					; 0000000aH
	push	0
	push	0
	mov	eax, DWORD PTR _i$[ebp]
	push	eax
	mov	ecx, DWORD PTR _cf$[ebp]
	add	ecx, 224				; 000000e0H
	push	ecx
	call	_dyntab_val
	add	esp, 12					; 0000000cH
	push	eax
	call	_strtoul
	add	esp, 12					; 0000000cH
	mov	edx, DWORD PTR _i$[ebp]
	imul	edx, 168				; 000000a8H
	mov	ecx, DWORD PTR _cf$[ebp]
	mov	ecx, DWORD PTR [ecx+248]
	mov	DWORD PTR [ecx+edx], eax

; 1108 : 		strncpy(datedeb, dyntab_val(&cf->tmes, i, 2), 8);

	push	8
	push	2
	mov	edx, DWORD PTR _i$[ebp]
	push	edx
	mov	eax, DWORD PTR _cf$[ebp]
	add	eax, 224				; 000000e0H
	push	eax
	call	_dyntab_val
	add	esp, 12					; 0000000cH
	push	eax
	mov	ecx, DWORD PTR _datedeb$70986[ebp]
	push	ecx
	call	_strncpy
	add	esp, 12					; 0000000cH

; 1109 : 		strncpy(cf->mes[i].statfact, dyntab_val(&cf->tmes, i, 3), sizeof(cf->mes->statfact));

	push	20					; 00000014H
	push	3
	mov	edx, DWORD PTR _i$[ebp]
	push	edx
	mov	eax, DWORD PTR _cf$[ebp]
	add	eax, 224				; 000000e0H
	push	eax
	call	_dyntab_val
	add	esp, 12					; 0000000cH
	push	eax
	mov	ecx, DWORD PTR _i$[ebp]
	imul	ecx, 168				; 000000a8H
	mov	edx, DWORD PTR _cf$[ebp]
	mov	eax, DWORD PTR [edx+248]
	lea	ecx, DWORD PTR [eax+ecx+72]
	push	ecx
	call	_strncpy
	add	esp, 12					; 0000000cH

; 1110 : 		cf->mes[i].idvalstat = dyntab_cell(&cf->tmes, i, 3)->IdValue;

	push	3
	mov	edx, DWORD PTR _i$[ebp]
	push	edx
	mov	eax, DWORD PTR _cf$[ebp]
	add	eax, 224				; 000000e0H
	push	eax
	call	_dyntab_cell
	add	esp, 12					; 0000000cH
	mov	ecx, DWORD PTR _i$[ebp]
	imul	ecx, 168				; 000000a8H
	mov	edx, DWORD PTR _cf$[ebp]
	mov	edx, DWORD PTR [edx+248]
	mov	eax, DWORD PTR [eax+32]
	mov	DWORD PTR [edx+ecx+92], eax

; 1111 : 		strncpy(cf->mes[i].modefact, dyntab_val(&cf->tmes, i, 4), sizeof(cf->mes->modefact));

	push	20					; 00000014H
	push	4
	mov	ecx, DWORD PTR _i$[ebp]
	push	ecx
	mov	edx, DWORD PTR _cf$[ebp]
	add	edx, 224				; 000000e0H
	push	edx
	call	_dyntab_val
	add	esp, 12					; 0000000cH
	push	eax
	mov	eax, DWORD PTR _i$[ebp]
	imul	eax, 168				; 000000a8H
	mov	ecx, DWORD PTR _cf$[ebp]
	mov	edx, DWORD PTR [ecx+248]
	lea	eax, DWORD PTR [edx+eax+100]
	push	eax
	call	_strncpy
	add	esp, 12					; 0000000cH

; 1112 : 		strncpy(cf->mes[i].debfact, dyntab_val(&cf->tmes, i, 5), 8);

	push	8
	push	5
	mov	ecx, DWORD PTR _i$[ebp]
	push	ecx
	mov	edx, DWORD PTR _cf$[ebp]
	add	edx, 224				; 000000e0H
	push	edx
	call	_dyntab_val
	add	esp, 12					; 0000000cH
	push	eax
	mov	eax, DWORD PTR _i$[ebp]
	imul	eax, 168				; 000000a8H
	mov	ecx, DWORD PTR _cf$[ebp]
	mov	edx, DWORD PTR [ecx+248]
	lea	eax, DWORD PTR [edx+eax+120]
	push	eax
	call	_strncpy
	add	esp, 12					; 0000000cH

; 1113 : 		strncpy(cf->mes[i].debfact, dyntab_val(&cf->tmes, i, 6), 8);

	push	8
	push	6
	mov	ecx, DWORD PTR _i$[ebp]
	push	ecx
	mov	edx, DWORD PTR _cf$[ebp]
	add	edx, 224				; 000000e0H
	push	edx
	call	_dyntab_val
	add	esp, 12					; 0000000cH
	push	eax
	mov	eax, DWORD PTR _i$[ebp]
	imul	eax, 168				; 000000a8H
	mov	ecx, DWORD PTR _cf$[ebp]
	mov	edx, DWORD PTR [ecx+248]
	lea	eax, DWORD PTR [edx+eax+120]
	push	eax
	call	_strncpy
	add	esp, 12					; 0000000cH

; 1114 : 		cf->mes[i].dest = DYNTAB_TOULRC(&cf->tmes, i, 7);

	push	10					; 0000000aH
	push	0
	push	7
	mov	ecx, DWORD PTR _i$[ebp]
	push	ecx
	mov	edx, DWORD PTR _cf$[ebp]
	add	edx, 224				; 000000e0H
	push	edx
	call	_dyntab_val
	add	esp, 12					; 0000000cH
	push	eax
	call	_strtoul
	add	esp, 12					; 0000000cH
	mov	ecx, DWORD PTR _i$[ebp]
	imul	ecx, 168				; 000000a8H
	mov	edx, DWORD PTR _cf$[ebp]
	mov	edx, DWORD PTR [edx+248]
	mov	DWORD PTR [edx+ecx+160], eax

; 1115 : 		cf->mes[i].b_forcstat = dyntab_val(&cf->tmes, i, 8)[0] != 0;

	push	8
	mov	eax, DWORD PTR _i$[ebp]
	push	eax
	mov	ecx, DWORD PTR _cf$[ebp]
	add	ecx, 224				; 000000e0H
	push	ecx
	call	_dyntab_val
	add	esp, 12					; 0000000cH
	movsx	edx, BYTE PTR [eax]
	neg	edx
	sbb	edx, edx
	neg	edx
	mov	eax, DWORD PTR _i$[ebp]
	imul	eax, 168				; 000000a8H
	mov	ecx, DWORD PTR _cf$[ebp]
	mov	ecx, DWORD PTR [ecx+248]
	mov	DWORD PTR [ecx+eax+96], edx

; 1116 : 		cf->mes[i].ts = DYNTAB_TOULRC(&cf->tmes, i, 10);

	push	10					; 0000000aH
	push	0
	push	10					; 0000000aH
	mov	edx, DWORD PTR _i$[ebp]
	push	edx
	mov	eax, DWORD PTR _cf$[ebp]
	add	eax, 224				; 000000e0H
	push	eax
	call	_dyntab_val
	add	esp, 12					; 0000000cH
	push	eax
	call	_strtoul
	add	esp, 12					; 0000000cH
	mov	ecx, DWORD PTR _i$[ebp]
	imul	ecx, 168				; 000000a8H
	mov	edx, DWORD PTR _cf$[ebp]
	mov	edx, DWORD PTR [edx+248]
	mov	DWORD PTR [edx+ecx+164], eax

; 1117 : 
; 1118 : 		/* Lecture du dernier jugement */
; 1119 : 		snprintf(add_sz_str(qry),
; 1120 : 			"SELECT DISTINCT TLink0.IdObj FROM TLink AS TLink0\n"
; 1121 : 			"INNER JOIN TLink AS TLink1 ON TLink0.IdObj=TLink1.IdObj\n"
; 1122 : 			"WHERE TLink0.DateDel IS NULL AND TLink0.IdField=%lu AND TLink0.IdRelObj=%lu\n"
; 1123 : 			"AND TLink1.DateDel IS NULL AND TLink1.IdField=%lu AND TLink1.IdValue=%lu\n",
; 1124 : 			cf->val_MESURE_JUGT, cf->mes[i].id, cf->val_DATE_JUGT, idval);

	mov	eax, DWORD PTR _idval$70990[ebp]
	push	eax
	mov	ecx, DWORD PTR _cf$[ebp]
	mov	edx, DWORD PTR [ecx+64]
	push	edx
	mov	eax, DWORD PTR _i$[ebp]
	imul	eax, 168				; 000000a8H
	mov	ecx, DWORD PTR _cf$[ebp]
	mov	edx, DWORD PTR [ecx+248]
	mov	eax, DWORD PTR [edx+eax]
	push	eax
	mov	ecx, DWORD PTR _cf$[ebp]
	mov	edx, DWORD PTR [ecx+52]
	push	edx
	push	OFFSET FLAT:$SG70995
	push	2047					; 000007ffH
	lea	eax, DWORD PTR _qry$[ebp]
	push	eax
	call	__snprintf
	add	esp, 28					; 0000001cH

; 1125 : 		if(sql_exec_query(cntxt, qry) || sql_get_table(cntxt, &data, 2) ||
; 1126 : 			qry_obj_data(cntxt, &data, &data, NULL)) STACK_ERROR;

	lea	ecx, DWORD PTR _qry$[ebp]
	push	ecx
	mov	edx, DWORD PTR _cntxt$[ebp]
	push	edx
	call	_sql_exec_query
	add	esp, 8
	test	eax, eax
	jne	SHORT $L70998
	push	2
	lea	eax, DWORD PTR _data$[ebp]
	push	eax
	mov	ecx, DWORD PTR _cntxt$[ebp]
	push	ecx
	call	_sql_get_table
	add	esp, 12					; 0000000cH
	test	eax, eax
	jne	SHORT $L70998
	push	0
	lea	edx, DWORD PTR _data$[ebp]
	push	edx
	lea	eax, DWORD PTR _data$[ebp]
	push	eax
	mov	ecx, DWORD PTR _cntxt$[ebp]
	push	ecx
	call	_qry_obj_data
	add	esp, 16					; 00000010H
	test	eax, eax
	je	SHORT $L70997
$L70998:
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 1126		; 00000466H
	jmp	$eva_err$70959
$L70997:

; 1127 : 		strncpy(datefin, dyntab_field_val(&data, "ECHEANCE", ~0UL, 0), 8);

	push	8
	push	0
	push	-1
	push	OFFSET FLAT:$SG70999
	lea	eax, DWORD PTR _data$[ebp]
	push	eax
	call	_dyntab_field_val
	add	esp, 16					; 00000010H
	push	eax
	mov	ecx, DWORD PTR _datefin$70987[ebp]
	push	ecx
	call	_strncpy
	add	esp, 12					; 0000000cH

; 1131 : 			char *effetdu = dyntab_field_val(&data, "ORD_JUGTS_EFFET_DU", ~0UL, 0);

	push	0
	push	-1
	push	OFFSET FLAT:$SG71001
	lea	edx, DWORD PTR _data$[ebp]
	push	edx
	call	_dyntab_field_val
	add	esp, 16					; 00000010H
	mov	DWORD PTR _effetdu$71000[ebp], eax

; 1132 : 			char *datejug = dyntab_val(&cf->tmes, i, 3);

	push	3
	mov	eax, DWORD PTR _i$[ebp]
	push	eax
	mov	ecx, DWORD PTR _cf$[ebp]
	add	ecx, 224				; 000000e0H
	push	ecx
	call	_dyntab_val
	add	esp, 12					; 0000000cH
	mov	DWORD PTR _datejug$71002[ebp], eax

; 1133 : 			cf->mes[i].b_mainlevee =
; 1134 : 				!strcmp(dyntab_field_val(&data, "ORD_JUGTS_TYPE", ~0UL, 0), "Main levée") ||
; 1135 : 				!strncmp(effetdu, datefin, 8) || !strncmp(datejug, datefin, 8);

	push	OFFSET FLAT:$SG71003
	push	0
	push	-1
	push	OFFSET FLAT:$SG71004
	lea	edx, DWORD PTR _data$[ebp]
	push	edx
	call	_dyntab_field_val
	add	esp, 16					; 00000010H
	push	eax
	call	_strcmp
	add	esp, 8
	test	eax, eax
	je	SHORT $L71291
	push	8
	mov	eax, DWORD PTR _datefin$70987[ebp]
	push	eax
	mov	ecx, DWORD PTR _effetdu$71000[ebp]
	push	ecx
	call	_strncmp
	add	esp, 12					; 0000000cH
	test	eax, eax
	je	SHORT $L71291
	push	8
	mov	edx, DWORD PTR _datefin$70987[ebp]
	push	edx
	mov	eax, DWORD PTR _datejug$71002[ebp]
	push	eax
	call	_strncmp
	add	esp, 12					; 0000000cH
	test	eax, eax
	je	SHORT $L71291
	mov	DWORD PTR -2112+[ebp], 0
	jmp	SHORT $L71292
$L71291:
	mov	DWORD PTR -2112+[ebp], 1
$L71292:
	mov	ecx, DWORD PTR _i$[ebp]
	imul	ecx, 168				; 000000a8H
	mov	edx, DWORD PTR _cf$[ebp]
	mov	eax, DWORD PTR [edx+248]
	mov	edx, DWORD PTR -2112+[ebp]
	mov	DWORD PTR [eax+ecx+44], edx

; 1137 : 
; 1138 : 		/* Maj date echeance mesure si necessaire */
; 1139 : 		if(strlen(datefin) > 7 && strcmp(d_echeance, datefin) &&
; 1140 : 			qry_update_idobj_idfield_1(cntxt, cf->mes[i].id, cf->val_DATE_ECHEANCE, datefin, 8)) STACK_ERROR;

	mov	eax, DWORD PTR _datefin$70987[ebp]
	push	eax
	call	_strlen
	add	esp, 4
	cmp	eax, 7
	jbe	SHORT $L71005
	mov	ecx, DWORD PTR _datefin$70987[ebp]
	push	ecx
	mov	edx, DWORD PTR _d_echeance$70988[ebp]
	push	edx
	call	_strcmp
	add	esp, 8
	test	eax, eax
	je	SHORT $L71005
	push	8
	mov	eax, DWORD PTR _datefin$70987[ebp]
	push	eax
	mov	ecx, DWORD PTR _cf$[ebp]
	mov	edx, DWORD PTR [ecx+68]
	push	edx
	mov	eax, DWORD PTR _i$[ebp]
	imul	eax, 168				; 000000a8H
	mov	ecx, DWORD PTR _cf$[ebp]
	mov	edx, DWORD PTR [ecx+248]
	mov	eax, DWORD PTR [edx+eax]
	push	eax
	mov	ecx, DWORD PTR _cntxt$[ebp]
	push	ecx
	call	_qry_update_idobj_idfield_1
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L71005
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 1140		; 00000474H
	jmp	$eva_err$70959
$L71005:

; 1141 : 
; 1142 : 		/* Vérification dates debut / fin */
; 1143 : 		if(*datedeb && datetxt_invalid(datedeb)) *datedeb = 0;

	mov	eax, DWORD PTR _datedeb$70986[ebp]
	movsx	ecx, BYTE PTR [eax]
	test	ecx, ecx
	je	SHORT $L71006
	mov	edx, DWORD PTR _datedeb$70986[ebp]
	push	edx
	call	_datetxt_invalid
	add	esp, 4
	test	eax, eax
	je	SHORT $L71006
	mov	eax, DWORD PTR _datedeb$70986[ebp]
	mov	BYTE PTR [eax], 0
$L71006:

; 1144 : 		if(*datefin && datetxt_invalid(datefin)) *datefin = 0;

	mov	ecx, DWORD PTR _datefin$70987[ebp]
	movsx	edx, BYTE PTR [ecx]
	test	edx, edx
	je	SHORT $L71007
	mov	eax, DWORD PTR _datefin$70987[ebp]
	push	eax
	call	_datetxt_invalid
	add	esp, 4
	test	eax, eax
	je	SHORT $L71007
	mov	ecx, DWORD PTR _datefin$70987[ebp]
	mov	BYTE PTR [ecx], 0
$L71007:

; 1145 : 		if(!*datedeb) DYNTAB_SET(ano, ano->nbrows, 0, "Debut de mesure inconnu");

	mov	edx, DWORD PTR _datedeb$70986[ebp]
	movsx	eax, BYTE PTR [edx]
	test	eax, eax
	jne	SHORT $L71009
	push	23					; 00000017H
	push	OFFSET FLAT:$SG71010
	push	0
	mov	ecx, DWORD PTR _ano$70989[ebp]
	mov	edx, DWORD PTR [ecx]
	push	edx
	mov	eax, DWORD PTR _ano$70989[ebp]
	push	eax
	call	_dyntab_set_txt
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L71009
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29872], OFFSET FLAT:$SG71012
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 1145		; 00000479H
	jmp	SHORT $eva_err$70959
$L71009:

; 1146 : 		if(!*datefin) DYNTAB_SET(ano, ano->nbrows, 0, "Fin de mesure inconnue");

	mov	eax, DWORD PTR _datefin$70987[ebp]
	movsx	ecx, BYTE PTR [eax]
	test	ecx, ecx
	jne	SHORT $L71014
	push	22					; 00000016H
	push	OFFSET FLAT:$SG71015
	push	0
	mov	edx, DWORD PTR _ano$70989[ebp]
	mov	eax, DWORD PTR [edx]
	push	eax
	mov	ecx, DWORD PTR _ano$70989[ebp]
	push	ecx
	call	_dyntab_set_txt
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L71014
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29872], OFFSET FLAT:$SG71017
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 1146		; 0000047aH
	jmp	SHORT $eva_err$70959
$L71014:

; 1147 : 	}

	jmp	$L70984
$L70985:

; 1148 : 
; 1149 : 	printf("*\n");

	push	OFFSET FLAT:$SG71018
	call	_printf
	add	esp, 4
$eva_noerr$71019:

; 1150 : 
; 1151 : 	RETURN_OK_CLEANUP;

	push	0
	push	OFFSET FLAT:$SG71020
	push	OFFSET FLAT:$SG71021
	mov	ecx, DWORD PTR _cntxt$[ebp]
	push	ecx
	call	_err_clear
	add	esp, 16					; 00000010H
$eva_err$70959:
	mov	edx, DWORD PTR _cntxt$[ebp]
	cmp	DWORD PTR [edx+29872], 0
	je	SHORT $L71022
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	ecx, DWORD PTR [eax+29900]
	push	ecx
	push	OFFSET FLAT:$SG71023
	push	OFFSET FLAT:$SG71024
	mov	edx, DWORD PTR _cntxt$[ebp]
	push	edx
	call	_err_add_context
	add	esp, 16					; 00000010H
$L71022:
	lea	eax, DWORD PTR _data$[ebp]
	push	eax
	call	_dyntab_free
	add	esp, 4
	mov	ecx, DWORD PTR _cntxt$[ebp]
	xor	eax, eax
	cmp	DWORD PTR [ecx+29872], 0
	setne	al

; 1152 : }

	pop	edi
	mov	esp, ebp
	pop	ebp
	ret	0
_Init_TPS ENDP
_TEXT	ENDS
PUBLIC	_FactureTPS
EXTRN	_qsort_colval:NEAR
_BSS	SEGMENT
	ALIGN	4

$SG71152 DB	01H DUP (?)
	ALIGN	4

$SG71156 DB	01H DUP (?)
	ALIGN	4

$SG71162 DB	01H DUP (?)
_BSS	ENDS
_DATA	SEGMENT
	ORG $+3
$SG71046 DB	0aH, '**** Traitement non effectu', 0e9H, 0aH, '  -> Enre'
	DB	'gistrez d''abord la facture', 0aH, 00H
	ORG $+1
$SG71048 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG71074 DB	'FFFFFF', 00H
	ORG $+1
$SG71077 DB	'SELECT TLink0.IdObj AS IdObj,TLink0.Num AS Num FROM TLin'
	DB	'k AS TLink0 ', 0aH, 'INNER JOIN TLink AS TLink1 ON TLink0.IdO'
	DB	'bj=TLink1.IdObj ', 0aH, 'INNER JOIN TLink AS TLink2 ON TLink0'
	DB	'.IdObj=TLink2.IdObj ', 0aH, 'WHERE TLink0.DateDel IS NULL AND'
	DB	' TLink0.IdRelObj=%lu AND TLink0.IdField=%lu ', 0aH, 'AND TLin'
	DB	'k1.DateDel IS NULL AND TLink1.IdField=%lu AND TLink1.IdRelObj'
	DB	'=%lu ', 0aH, 'AND TLink2.DateDel IS NULL AND TLink2.IdField=%'
	DB	'lu AND TLink2.IdRelObj=%lu ', 0aH, 'GROUP BY IdObj ORDER BY I'
	DB	'dObj DESC', 00H
	ORG $+3
$SG71086 DB	'UPDATE TLink SET DateDel=''%s'',IdWhoDel=%lu WHERE DateD'
	DB	'el IS NULL AND IdObj=%lu', 00H
	ORG $+1
$SG71089 DB	'CALC_MANUEL', 00H
$SG71092 DB	'MOIS_FACT', 00H
	ORG $+2
$SG71094 DB	'MOIS_CORRECTION', 00H
$SG71097 DB	'MOTIF_CORRECTION', 00H
	ORG $+3
$SG71099 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG71101 DB	'DEST_FACTURE', 00H
	ORG $+3
$SG71104 DB	'DateManuelle', 00H
	ORG $+3
$SG71106 DB	'MOTIF_FACT_MANUELLE', 00H
$SG71110 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG71116 DB	'A', 00H
	ORG $+2
$SG71120 DB	'Archiv', 0e9H, 'e', 00H
	ORG $+3
$SG71121 DB	'#CCCCFF', 00H
$SG71124 DB	'En attente', 00H
	ORG $+1
$SG71125 DB	'#FFCCCC', 00H
$SG71127 DB	'En cours', 00H
	ORG $+3
$SG71128 DB	'#CCFFCC', 00H
$SG71131 DB	'Attente affectation TS', 00H
	ORG $+1
$SG71133 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG71137 DB	'<table border=0 cellpadding=1 cellspacing=0 width=800><t'
	DB	'r>', 00H
	ORG $+1
$SG71140 DB	'ALLOCATAIRE->NOM,PRENOM', 00H
$SG71141 DB	'<td width=150><font size=-1>%s %s</td>', 00H
	ORG $+1
$SG71142 DB	'<td width=80 align=right><font size=-1>', 00H
$SG71144 DB	'%.2s/%.2s/%.4s', 00H
	ORG $+1
$SG71145 DB	'</td><td width=10 align=center>-</td><td width=80><font '
	DB	'size=-1>', 00H
	ORG $+3
$SG71147 DB	'%.2s/%.2s/%.4s', 00H
	ORG $+1
$SG71148 DB	'</td>', 00H
	ORG $+2
$SG71150 DB	'<td width=120><font size=-2>%s</td>', 00H
$SG71151 DB	'<td width=30 align=right>%d</td><td width=10>j</td><td w'
	DB	'idth=20>%+d</td>', 00H
	ORG $+3
$SG71153 DB	'<td width=60><font size=-2>%s</td>', 00H
	ORG $+1
$SG71154 DB	'<td width=80 bgcolor=%s><font size=-1>%s</td>', 00H
	ORG $+2
$SG71155 DB	' bgcolor=#FFDDBB', 00H
	ORG $+3
$SG71157 DB	'<td%s><font size=-2><b>', 00H
$SG71161 DB	', ', 00H
	ORG $+1
$SG71163 DB	'%s%s', 00H
	ORG $+3
$SG71164 DB	'</b></font></td>', 00H
	ORG $+3
$SG71165 DB	'</tr></table>', 00H
	ORG $+2
$SG71178 DB	'UPDATE TLink SET DateDel=''%s'',IdWhoDel=%lu WHERE DateD'
	DB	'el IS NULL AND IdObj=%lu', 00H
	ORG $+1
$SG71200 DB	'1', 00H
	ORG $+2
$SG71208 DB	'%d', 00H
	ORG $+1
$SG71216 DB	'</table><br><br><table border=1 rules=none width=100%%><'
	DB	'tr><td align=center>%lu mesures examin', 0e9H, 'es<br>%lu mes'
	DB	'ures modifi', 0e9H, 'es<br>%lu mesures factur', 0e9H, 'es</td'
	DB	'></tr><tr><td align=center><font size=-1><i>Utilisez la comma'
	DB	'nde Fichier/Enregistrer de votre navigateur si vous voulez co'
	DB	'nserver ce journal</td></tr><tr><td align=center><br><input t'
	DB	'ype=submit value=''Revenir ', 0e0H, ' la facture'' name=''B$#'
	DB	'NOP''></td></tr></table>', 0aH, '<script>document.mainform['''
	DB	'B$#NOP''].focus();</script>', 00H
	ORG $+3
$SG71217 DB	'D:\Travail\ABI\EVA\V4.0\CGI\Brunix-2016\dll_adsea01.c', 00H
	ORG $+2
$SG71218 DB	'FactureTPS', 00H
	ORG $+1
$SG71220 DB	'D:\Travail\ABI\EVA\V4.0\CGI\Brunix-2016\dll_adsea01.c', 00H
	ORG $+2
$SG71221 DB	'FactureTPS', 00H
_DATA	ENDS
_TEXT	SEGMENT
_cntxt$ = 8
_i_ctrl$ = 12
_form$ = -2052
_lignfact$ = -2388
_data$ = -2072
_qry$ = -2048
__cf$ = -2356
_cf$ = -2360
_i$ = -2364
_j$ = -2368
_txt$ = -2104
_idmesure$71057 = -2480
_idlignefact$71058 = -2512
_iddest$71059 = -2508
_datedeb$71060 = -2476
_datefin$71061 = -2468
_datedebcor$71062 = -2528
_datefincor$71063 = -2500
_modefact$71064 = -2540
_mindeb$71065 = -2456
_maxfin$71066 = -2472
_nbfact$71067 = -2464
_nbcorr$71068 = -2532
_b_calcmanuel$71069 = -2484
_statut$71070 = -2536
_valstatut$71071 = -2548
_nouvstatut$71072 = -2460
_bgcolor$71073 = -2504
_val$71075 = -2452
_ano$71076 = -2544
_FactureTPS PROC NEAR

; 1166 : ){

	push	ebp
	mov	ebp, esp
	sub	esp, 2576				; 00000a10H
	push	edi

; 1167 : 	EVA_form *form = cntxt->form;

	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	ecx, DWORD PTR [eax+80]
	mov	DWORD PTR _form$[ebp], ecx

; 1168 : 	DynTable lignfact = { 0 };

	mov	DWORD PTR _lignfact$[ebp], 0
	xor	edx, edx
	mov	DWORD PTR _lignfact$[ebp+4], edx
	mov	DWORD PTR _lignfact$[ebp+8], edx
	mov	DWORD PTR _lignfact$[ebp+12], edx
	mov	DWORD PTR _lignfact$[ebp+16], edx

; 1169 : 	DynTable data = { 0 };

	mov	DWORD PTR _data$[ebp], 0
	xor	eax, eax
	mov	DWORD PTR _data$[ebp+4], eax
	mov	DWORD PTR _data$[ebp+8], eax
	mov	DWORD PTR _data$[ebp+12], eax
	mov	DWORD PTR _data$[ebp+16], eax

; 1170 : 	char qry[2048] = {0};

	mov	BYTE PTR _qry$[ebp], 0
	mov	ecx, 511				; 000001ffH
	xor	eax, eax
	lea	edi, DWORD PTR _qry$[ebp+1]
	rep stosd
	stosw
	stosb

; 1171 : 	cntxt_fact _cf = {0}, *cf = &_cf;

	mov	DWORD PTR __cf$[ebp], 0
	mov	ecx, 62					; 0000003eH
	xor	eax, eax
	lea	edi, DWORD PTR __cf$[ebp+4]
	rep stosd
	lea	ecx, DWORD PTR __cf$[ebp]
	mov	DWORD PTR _cf$[ebp], ecx

; 1172 : 	unsigned long i, j;
; 1173 : 	char txt[32];
; 1174 : 
; 1175 : 	/* Inhibit warning for unused param */
; 1176 : 	i_ctrl = 0;

	mov	DWORD PTR _i_ctrl$[ebp], 0

; 1177 : 
; 1178 : 	/* Retour si facture non enregistree */
; 1179 : 	if(!dyntab_sz(&form->id_obj, 0, 0))

	push	0
	push	0
	mov	edx, DWORD PTR _form$[ebp]
	add	edx, 32					; 00000020H
	push	edx
	call	_dyntab_sz
	add	esp, 12					; 0000000cH
	test	eax, eax
	jne	SHORT $L71043

; 1181 : 		DYNBUF_ADD_STR(&cntxt->debug_msg, "\n**** Traitement non effectué\n  -> Enregistrez d'abord la facture\n");

	push	0
	push	0
	push	66					; 00000042H
	push	OFFSET FLAT:$SG71046
	mov	eax, DWORD PTR _cntxt$[ebp]
	add	eax, 29864				; 000074a8H
	push	eax
	call	_dynbuf_add
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L71045
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29872], OFFSET FLAT:$SG71048
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 1181		; 0000049dH
	jmp	$eva_err$71049
$L71045:

; 1182 : 		RETURN_OK;

	jmp	$eva_noerr$71050
$L71043:

; 1184 : 
; 1185 : 	/* Preparation des donnees de facturation */
; 1186 : 	cf->idfacture = DYNTAB_TOUL(&form->id_obj);

	push	10					; 0000000aH
	push	0
	push	0
	push	0
	mov	eax, DWORD PTR _form$[ebp]
	add	eax, 32					; 00000020H
	push	eax
	call	_dyntab_val
	add	esp, 12					; 0000000cH
	push	eax
	call	_strtoul
	add	esp, 12					; 0000000cH
	mov	ecx, DWORD PTR _cf$[ebp]
	mov	DWORD PTR [ecx+4], eax

; 1187 : 	if(Init_TPS(cntxt, cf) || Entete_journal(cntxt, cf)) STACK_ERROR;

	mov	edx, DWORD PTR _cf$[ebp]
	push	edx
	mov	eax, DWORD PTR _cntxt$[ebp]
	push	eax
	call	_Init_TPS
	add	esp, 8
	test	eax, eax
	jne	SHORT $L71053
	mov	ecx, DWORD PTR _cf$[ebp]
	push	ecx
	mov	edx, DWORD PTR _cntxt$[ebp]
	push	edx
	call	_Entete_journal
	add	esp, 8
	test	eax, eax
	je	SHORT $L71052
$L71053:
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 1187		; 000004a3H
	jmp	$eva_err$71049
$L71052:

; 1188 : 
; 1189 : 	/* Pour chaque mesure en cours */
; 1190 : 	for(i = 0; i < cf->nb_mes; i++)

	mov	DWORD PTR _i$[ebp], 0
	jmp	SHORT $L71054
$L71055:
	mov	ecx, DWORD PTR _i$[ebp]
	add	ecx, 1
	mov	DWORD PTR _i$[ebp], ecx
$L71054:
	mov	edx, DWORD PTR _cf$[ebp]
	mov	eax, DWORD PTR _i$[ebp]
	cmp	eax, DWORD PTR [edx+244]
	jae	$L71056

; 1192 : 		unsigned long idmesure = cf->mes[i].id, idlignefact = 0, iddest = cf->mes[i].dest;

	mov	ecx, DWORD PTR _i$[ebp]
	imul	ecx, 168				; 000000a8H
	mov	edx, DWORD PTR _cf$[ebp]
	mov	eax, DWORD PTR [edx+248]
	mov	ecx, DWORD PTR [eax+ecx]
	mov	DWORD PTR _idmesure$71057[ebp], ecx
	mov	DWORD PTR _idlignefact$71058[ebp], 0
	mov	edx, DWORD PTR _i$[ebp]
	imul	edx, 168				; 000000a8H
	mov	eax, DWORD PTR _cf$[ebp]
	mov	ecx, DWORD PTR [eax+248]
	mov	edx, DWORD PTR [ecx+edx+160]
	mov	DWORD PTR _iddest$71059[ebp], edx

; 1193 : 		char *datedeb = cf->mes[i].deb;

	mov	eax, DWORD PTR _i$[ebp]
	imul	eax, 168				; 000000a8H
	mov	ecx, DWORD PTR _cf$[ebp]
	mov	edx, DWORD PTR [ecx+248]
	lea	eax, DWORD PTR [edx+eax+4]
	mov	DWORD PTR _datedeb$71060[ebp], eax

; 1194 : 		char *datefin = cf->mes[i].fin;

	mov	ecx, DWORD PTR _i$[ebp]
	imul	ecx, 168				; 000000a8H
	mov	edx, DWORD PTR _cf$[ebp]
	mov	eax, DWORD PTR [edx+248]
	lea	ecx, DWORD PTR [eax+ecx+14]
	mov	DWORD PTR _datefin$71061[ebp], ecx

; 1195 : 		char datedebcor[16] = {0}, datefincor[16] = {0};

	mov	BYTE PTR _datedebcor$71062[ebp], 0
	xor	edx, edx
	mov	DWORD PTR _datedebcor$71062[ebp+1], edx
	mov	DWORD PTR _datedebcor$71062[ebp+5], edx
	mov	DWORD PTR _datedebcor$71062[ebp+9], edx
	mov	WORD PTR _datedebcor$71062[ebp+13], dx
	mov	BYTE PTR _datedebcor$71062[ebp+15], dl
	mov	BYTE PTR _datefincor$71063[ebp], 0
	xor	eax, eax
	mov	DWORD PTR _datefincor$71063[ebp+1], eax
	mov	DWORD PTR _datefincor$71063[ebp+5], eax
	mov	DWORD PTR _datefincor$71063[ebp+9], eax
	mov	WORD PTR _datefincor$71063[ebp+13], ax
	mov	BYTE PTR _datefincor$71063[ebp+15], al

; 1196 : 		char *modefact = cf->mes[i].modefact, *mindeb, *maxfin;

	mov	ecx, DWORD PTR _i$[ebp]
	imul	ecx, 168				; 000000a8H
	mov	edx, DWORD PTR _cf$[ebp]
	mov	eax, DWORD PTR [edx+248]
	lea	ecx, DWORD PTR [eax+ecx+100]
	mov	DWORD PTR _modefact$71064[ebp], ecx

; 1197 : 		int nbfact = 0, nbcorr = 0, b_calcmanuel;

	mov	DWORD PTR _nbfact$71067[ebp], 0
	mov	DWORD PTR _nbcorr$71068[ebp], 0

; 1198 : 		unsigned long statut;
; 1199 : 		char *valstatut = cf->mes[i].statfact, *nouvstatut, *bgcolor = "FFFFFF";

	mov	edx, DWORD PTR _i$[ebp]
	imul	edx, 168				; 000000a8H
	mov	eax, DWORD PTR _cf$[ebp]
	mov	ecx, DWORD PTR [eax+248]
	lea	edx, DWORD PTR [ecx+edx+72]
	mov	DWORD PTR _valstatut$71071[ebp], edx
	mov	DWORD PTR _bgcolor$71073[ebp], OFFSET FLAT:$SG71074

; 1200 : 		DynTableCell val = {0};

	mov	DWORD PTR _val$71075[ebp], 0
	mov	ecx, 15					; 0000000fH
	xor	eax, eax
	lea	edi, DWORD PTR _val$71075[ebp+4]
	rep stosd

; 1201 : 		DynTable *ano = &cf->mes[i].notes;

	mov	eax, DWORD PTR _i$[ebp]
	imul	eax, 168				; 000000a8H
	mov	ecx, DWORD PTR _cf$[ebp]
	mov	edx, DWORD PTR [ecx+248]
	lea	eax, DWORD PTR [edx+eax+52]
	mov	DWORD PTR _ano$71076[ebp], eax

; 1202 : 
; 1203 : 		/* Recherche si une ligne existe deja pour cette mesure dans la facture */
; 1204 : 		snprintf(qry, sizeof(qry),
; 1205 : 				"SELECT TLink0.IdObj AS IdObj,TLink0.Num AS Num FROM TLink AS TLink0 \n"
; 1206 : 				"INNER JOIN TLink AS TLink1 ON TLink0.IdObj=TLink1.IdObj \n"
; 1207 : 				"INNER JOIN TLink AS TLink2 ON TLink0.IdObj=TLink2.IdObj \n"
; 1208 : 				"WHERE TLink0.DateDel IS NULL AND TLink0.IdRelObj=%lu AND TLink0.IdField=%lu \n"
; 1209 : 				"AND TLink1.DateDel IS NULL AND TLink1.IdField=%lu AND TLink1.IdRelObj=%lu \n"
; 1210 : 				"AND TLink2.DateDel IS NULL AND TLink2.IdField=%lu AND TLink2.IdRelObj=%lu \n"
; 1211 : 				"GROUP BY IdObj ORDER BY IdObj DESC",
; 1212 : 			cf->form_LigneFacture, cf->val_FORMSTAMP, cf->val_MES_LIGNE_FACT, idmesure, cf->val_FACTURE, cf->idfacture);

	mov	ecx, DWORD PTR _cf$[ebp]
	mov	edx, DWORD PTR [ecx+4]
	push	edx
	mov	eax, DWORD PTR _cf$[ebp]
	mov	ecx, DWORD PTR [eax+28]
	push	ecx
	mov	edx, DWORD PTR _idmesure$71057[ebp]
	push	edx
	mov	eax, DWORD PTR _cf$[ebp]
	mov	ecx, DWORD PTR [eax+32]
	push	ecx
	mov	edx, DWORD PTR _cf$[ebp]
	mov	eax, DWORD PTR [edx+16]
	push	eax
	mov	ecx, DWORD PTR _cf$[ebp]
	mov	edx, DWORD PTR [ecx+12]
	push	edx
	push	OFFSET FLAT:$SG71077
	push	2048					; 00000800H
	lea	eax, DWORD PTR _qry$[ebp]
	push	eax
	call	__snprintf
	add	esp, 36					; 00000024H

; 1213 : 		if(sql_exec_query(cntxt, qry) || sql_get_table(cntxt, &data, 2)) STACK_ERROR;

	lea	ecx, DWORD PTR _qry$[ebp]
	push	ecx
	mov	edx, DWORD PTR _cntxt$[ebp]
	push	edx
	call	_sql_exec_query
	add	esp, 8
	test	eax, eax
	jne	SHORT $L71079
	push	2
	lea	eax, DWORD PTR _data$[ebp]
	push	eax
	mov	ecx, DWORD PTR _cntxt$[ebp]
	push	ecx
	call	_sql_get_table
	add	esp, 12					; 0000000cH
	test	eax, eax
	je	SHORT $L71078
$L71079:
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 1213		; 000004bdH
	jmp	$eva_err$71049
$L71078:

; 1214 : 		idlignefact = DYNTAB_TOUL(&data);

	push	10					; 0000000aH
	push	0
	push	0
	push	0
	lea	eax, DWORD PTR _data$[ebp]
	push	eax
	call	_dyntab_val
	add	esp, 12					; 0000000cH
	push	eax
	call	_strtoul
	add	esp, 12					; 0000000cH
	mov	DWORD PTR _idlignefact$71058[ebp], eax

; 1215 : 
; 1216 : 		/* Si plus d'un ligne : efface les lignes en trop */
; 1217 : 		for(j = 1; j < data.nbrows; j++)

	mov	DWORD PTR _j$[ebp], 1
	jmp	SHORT $L71081
$L71082:
	mov	ecx, DWORD PTR _j$[ebp]
	add	ecx, 1
	mov	DWORD PTR _j$[ebp], ecx
$L71081:
	mov	edx, DWORD PTR _j$[ebp]
	cmp	edx, DWORD PTR _data$[ebp]
	jae	$L71083

; 1219 : 			snprintf(add_sz_str(qry), "UPDATE TLink SET DateDel='%s',IdWhoDel=%lu WHERE DateDel IS NULL AND IdObj=%lu",
; 1220 : 				cntxt->timestamp, DYNTAB_TOUL(&cntxt->id_user), DYNTAB_TOULRC(&data, j, 0));

	push	10					; 0000000aH
	push	0
	push	0
	mov	eax, DWORD PTR _j$[ebp]
	push	eax
	lea	ecx, DWORD PTR _data$[ebp]
	push	ecx
	call	_dyntab_val
	add	esp, 12					; 0000000cH
	push	eax
	call	_strtoul
	add	esp, 12					; 0000000cH
	push	eax
	push	10					; 0000000aH
	push	0
	push	0
	push	0
	mov	edx, DWORD PTR _cntxt$[ebp]
	add	edx, 29408				; 000072e0H
	push	edx
	call	_dyntab_val
	add	esp, 12					; 0000000cH
	push	eax
	call	_strtoul
	add	esp, 12					; 0000000cH
	push	eax
	mov	eax, DWORD PTR _cntxt$[ebp]
	add	eax, 29704				; 00007408H
	push	eax
	push	OFFSET FLAT:$SG71086
	push	2047					; 000007ffH
	lea	ecx, DWORD PTR _qry$[ebp]
	push	ecx
	call	__snprintf
	add	esp, 24					; 00000018H

; 1221 : 			if(sql_exec_query(cntxt, qry)) STACK_ERROR;

	lea	edx, DWORD PTR _qry$[ebp]
	push	edx
	mov	eax, DWORD PTR _cntxt$[ebp]
	push	eax
	call	_sql_exec_query
	add	esp, 8
	test	eax, eax
	je	SHORT $L71087
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 1221		; 000004c5H
	jmp	$eva_err$71049
$L71087:

; 1222 : 		}

	jmp	$L71082
$L71083:

; 1223 : 
; 1224 : 		/* Lecture des donnees de la ligne */
; 1225 : 		DYNTAB_FREE(lignfact);

	lea	edx, DWORD PTR _lignfact$[ebp]
	push	edx
	call	_dyntab_free
	add	esp, 4

; 1226 : 		if(idlignefact && qry_obj_idfield(cntxt, &lignfact, idlignefact, 0)) STACK_ERROR;

	cmp	DWORD PTR _idlignefact$71058[ebp], 0
	je	SHORT $L71088
	push	0
	mov	eax, DWORD PTR _idlignefact$71058[ebp]
	push	eax
	lea	ecx, DWORD PTR _lignfact$[ebp]
	push	ecx
	mov	edx, DWORD PTR _cntxt$[ebp]
	push	edx
	call	_qry_obj_idfield
	add	esp, 16					; 00000010H
	test	eax, eax
	je	SHORT $L71088
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 1226		; 000004caH
	jmp	$eva_err$71049
$L71088:

; 1227 : 
; 1228 : 		/* Gestion du mode de facturation */
; 1229 : 		b_calcmanuel = idlignefact && dyntab_field_cell(&lignfact, "CALC_MANUEL", ~0UL, 0);

	cmp	DWORD PTR _idlignefact$71058[ebp], 0
	je	SHORT $L71294
	push	0
	push	-1
	push	OFFSET FLAT:$SG71089
	lea	ecx, DWORD PTR _lignfact$[ebp]
	push	ecx
	call	_dyntab_field_cell
	add	esp, 16					; 00000010H
	test	eax, eax
	je	SHORT $L71294
	mov	DWORD PTR -2552+[ebp], 1
	jmp	SHORT $L71295
$L71294:
	mov	DWORD PTR -2552+[ebp], 0
$L71295:
	mov	edx, DWORD PTR -2552+[ebp]
	mov	DWORD PTR _b_calcmanuel$71069[ebp], edx

; 1230 : 		if(b_calcmanuel)

	cmp	DWORD PTR _b_calcmanuel$71069[ebp], 0
	je	$L71090

; 1232 : 			/* Calcul manuel : lecture des données de la ligne */
; 1233 : 			nbfact = strtoul(dyntab_field_val(&lignfact, "MOIS_FACT", ~0UL, 0), NULL, 10);

	push	10					; 0000000aH
	push	0
	push	0
	push	-1
	push	OFFSET FLAT:$SG71092
	lea	eax, DWORD PTR _lignfact$[ebp]
	push	eax
	call	_dyntab_field_val
	add	esp, 16					; 00000010H
	push	eax
	call	_strtoul
	add	esp, 12					; 0000000cH
	mov	DWORD PTR _nbfact$71067[ebp], eax

; 1234 : 			nbcorr = strtoul(dyntab_field_val(&lignfact, "MOIS_CORRECTION", ~0UL, 0), NULL, 10);

	push	10					; 0000000aH
	push	0
	push	0
	push	-1
	push	OFFSET FLAT:$SG71094
	lea	ecx, DWORD PTR _lignfact$[ebp]
	push	ecx
	call	_dyntab_field_val
	add	esp, 16					; 00000010H
	push	eax
	call	_strtoul
	add	esp, 12					; 0000000cH
	mov	DWORD PTR _nbcorr$71068[ebp], eax

; 1235 : 			if(dyntab_filter_field(ano, 0, &lignfact, "MOTIF_CORRECTION", ~0UL, NULL)) RETURN_ERR_MEMORY;

	push	0
	push	-1
	push	OFFSET FLAT:$SG71097
	lea	edx, DWORD PTR _lignfact$[ebp]
	push	edx
	push	0
	mov	eax, DWORD PTR _ano$71076[ebp]
	push	eax
	call	_dyntab_filter_field
	add	esp, 24					; 00000018H
	test	eax, eax
	je	SHORT $L71096
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29872], OFFSET FLAT:$SG71099
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 1235		; 000004d3H
	jmp	$eva_err$71049
$L71096:

; 1236 : 			iddest = strtoul(dyntab_field_val(&lignfact, "DEST_FACTURE", ~0UL, 0), NULL, 10);

	push	10					; 0000000aH
	push	0
	push	0
	push	-1
	push	OFFSET FLAT:$SG71101
	lea	eax, DWORD PTR _lignfact$[ebp]
	push	eax
	call	_dyntab_field_val
	add	esp, 16					; 00000010H
	push	eax
	call	_strtoul
	add	esp, 12					; 0000000cH
	mov	DWORD PTR _iddest$71059[ebp], eax

; 1238 : 		else if(!strcmp(modefact, "DateManuelle"))

	jmp	$L71103
$L71090:
	push	OFFSET FLAT:$SG71104
	mov	ecx, DWORD PTR _modefact$71064[ebp]
	push	ecx
	call	_strcmp
	add	esp, 8
	test	eax, eax
	jne	$L71103

; 1240 : 			if(qry_obj_field(cntxt, &data, idmesure, "MOTIF_FACT_MANUELLE")) STACK_ERROR;

	push	OFFSET FLAT:$SG71106
	mov	edx, DWORD PTR _idmesure$71057[ebp]
	push	edx
	lea	eax, DWORD PTR _data$[ebp]
	push	eax
	mov	ecx, DWORD PTR _cntxt$[ebp]
	push	ecx
	call	_qry_obj_field
	add	esp, 16					; 00000010H
	test	eax, eax
	je	SHORT $L71105
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 1240		; 000004d8H
	jmp	$eva_err$71049
$L71105:

; 1241 : 			if(data.nbrows) DYNTAB_ADD_CELL(ano, ano->nbrows, 0, &data, 0, 0);

	cmp	DWORD PTR _data$[ebp], 0
	je	SHORT $L71108
	push	1
	push	0
	push	0
	lea	eax, DWORD PTR _data$[ebp]
	push	eax
	call	_dyntab_cell
	add	esp, 12					; 0000000cH
	push	eax
	push	0
	mov	ecx, DWORD PTR _ano$71076[ebp]
	mov	edx, DWORD PTR [ecx]
	push	edx
	mov	eax, DWORD PTR _ano$71076[ebp]
	push	eax
	call	_dyntab_copy
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L71108
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29872], OFFSET FLAT:$SG71110
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 1241		; 000004d9H
	jmp	$eva_err$71049
$L71108:

; 1242 : 			strncpy(datedebcor, cf->mes[i].debfact, 8);

	push	8
	mov	eax, DWORD PTR _i$[ebp]
	imul	eax, 168				; 000000a8H
	mov	ecx, DWORD PTR _cf$[ebp]
	mov	edx, DWORD PTR [ecx+248]
	lea	eax, DWORD PTR [edx+eax+120]
	push	eax
	lea	ecx, DWORD PTR _datedebcor$71062[ebp]
	push	ecx
	call	_strncpy
	add	esp, 12					; 0000000cH

; 1243 : 			strncpy(datefincor, cf->mes[i].finfact, 8);

	push	8
	mov	edx, DWORD PTR _i$[ebp]
	imul	edx, 168				; 000000a8H
	mov	eax, DWORD PTR _cf$[ebp]
	mov	ecx, DWORD PTR [eax+248]
	lea	edx, DWORD PTR [ecx+edx+130]
	push	edx
	lea	eax, DWORD PTR _datefincor$71063[ebp]
	push	eax
	call	_strncpy
	add	esp, 12					; 0000000cH
$L71103:

; 1245 : 
; 1246 : 		/* Destinataire par defaut = CAF AIN */
; 1247 : 		if(!iddest) iddest = 163248;

	cmp	DWORD PTR _iddest$71059[ebp], 0
	jne	SHORT $L71111
	mov	DWORD PTR _iddest$71059[ebp], 163248	; 00027db0H
$L71111:

; 1248 : 
; 1249 : 		/* Normalisation dates debut / fin */
; 1250 : 		if(*datedebcor && datetxt_invalid(datedebcor)) *datedebcor = 0;

	movsx	ecx, BYTE PTR _datedebcor$71062[ebp]
	test	ecx, ecx
	je	SHORT $L71112
	lea	edx, DWORD PTR _datedebcor$71062[ebp]
	push	edx
	call	_datetxt_invalid
	add	esp, 4
	test	eax, eax
	je	SHORT $L71112
	mov	BYTE PTR _datedebcor$71062[ebp], 0
$L71112:

; 1251 : 		if(*datefincor && datetxt_invalid(datefincor)) *datefincor = 0;

	movsx	eax, BYTE PTR _datefincor$71063[ebp]
	test	eax, eax
	je	SHORT $L71113
	lea	ecx, DWORD PTR _datefincor$71063[ebp]
	push	ecx
	call	_datetxt_invalid
	add	esp, 4
	test	eax, eax
	je	SHORT $L71113
	mov	BYTE PTR _datefincor$71063[ebp], 0
$L71113:

; 1252 : 		if(!*datedebcor && *datedeb) strcpy(datedebcor, datedeb);

	movsx	edx, BYTE PTR _datedebcor$71062[ebp]
	test	edx, edx
	jne	SHORT $L71114
	mov	eax, DWORD PTR _datedeb$71060[ebp]
	movsx	ecx, BYTE PTR [eax]
	test	ecx, ecx
	je	SHORT $L71114
	mov	edx, DWORD PTR _datedeb$71060[ebp]
	push	edx
	lea	eax, DWORD PTR _datedebcor$71062[ebp]
	push	eax
	call	_strcpy
	add	esp, 8
$L71114:

; 1253 : 		if(!*datefincor && *datefin) strcpy(datefincor, datefin);

	movsx	ecx, BYTE PTR _datefincor$71063[ebp]
	test	ecx, ecx
	jne	SHORT $L71115
	mov	edx, DWORD PTR _datefin$71061[ebp]
	movsx	eax, BYTE PTR [edx]
	test	eax, eax
	je	SHORT $L71115
	mov	ecx, DWORD PTR _datefin$71061[ebp]
	push	ecx
	lea	edx, DWORD PTR _datefincor$71063[ebp]
	push	edx
	call	_strcpy
	add	esp, 8
$L71115:

; 1254 : 
; 1255 : 		/* Etat de facturation de la mesure */
; 1256 : 		mindeb = (!*datedeb || strcmp(datedeb, datedebcor) > 0) ? datedebcor : datedeb;

	mov	eax, DWORD PTR _datedeb$71060[ebp]
	movsx	ecx, BYTE PTR [eax]
	test	ecx, ecx
	je	SHORT $L71296
	lea	edx, DWORD PTR _datedebcor$71062[ebp]
	push	edx
	mov	eax, DWORD PTR _datedeb$71060[ebp]
	push	eax
	call	_strcmp
	add	esp, 8
	test	eax, eax
	jg	SHORT $L71296
	mov	ecx, DWORD PTR _datedeb$71060[ebp]
	mov	DWORD PTR -2556+[ebp], ecx
	jmp	SHORT $L71297
$L71296:
	lea	edx, DWORD PTR _datedebcor$71062[ebp]
	mov	DWORD PTR -2556+[ebp], edx
$L71297:
	mov	eax, DWORD PTR -2556+[ebp]
	mov	DWORD PTR _mindeb$71065[ebp], eax

; 1257 : 		maxfin = !*datefincor ? "A" : strcmp(datefin, datefincor) < 0 ? datefincor : datefin;

	movsx	ecx, BYTE PTR _datefincor$71063[ebp]
	test	ecx, ecx
	jne	SHORT $L71300
	mov	DWORD PTR -2560+[ebp], OFFSET FLAT:$SG71116
	jmp	SHORT $L71301
$L71300:
	lea	edx, DWORD PTR _datefincor$71063[ebp]
	push	edx
	mov	eax, DWORD PTR _datefin$71061[ebp]
	push	eax
	call	_strcmp
	add	esp, 8
	test	eax, eax
	jge	SHORT $L71298
	lea	ecx, DWORD PTR _datefincor$71063[ebp]
	mov	DWORD PTR -2564+[ebp], ecx
	jmp	SHORT $L71299
$L71298:
	mov	edx, DWORD PTR _datefin$71061[ebp]
	mov	DWORD PTR -2564+[ebp], edx
$L71299:
	mov	eax, DWORD PTR -2564+[ebp]
	mov	DWORD PTR -2560+[ebp], eax
$L71301:
	mov	ecx, DWORD PTR -2560+[ebp]
	mov	DWORD PTR _maxfin$71066[ebp], ecx

; 1258 : 		if(cf->mes[i].b_forcstat)

	mov	edx, DWORD PTR _i$[ebp]
	imul	edx, 168				; 000000a8H
	mov	eax, DWORD PTR _cf$[ebp]
	mov	ecx, DWORD PTR [eax+248]
	cmp	DWORD PTR [ecx+edx+96], 0
	je	SHORT $L71117

; 1260 : 			statut = cf->mes[i].idvalstat;

	mov	edx, DWORD PTR _i$[ebp]
	imul	edx, 168				; 000000a8H
	mov	eax, DWORD PTR _cf$[ebp]
	mov	ecx, DWORD PTR [eax+248]
	mov	edx, DWORD PTR [ecx+edx+92]
	mov	DWORD PTR _statut$71070[ebp], edx

; 1261 : 			nouvstatut = cf->mes[i].statfact;

	mov	eax, DWORD PTR _i$[ebp]
	imul	eax, 168				; 000000a8H
	mov	ecx, DWORD PTR _cf$[ebp]
	mov	edx, DWORD PTR [ecx+248]
	lea	eax, DWORD PTR [edx+eax+72]
	mov	DWORD PTR _nouvstatut$71072[ebp], eax

; 1263 : 		else if(strcmp(maxfin, cf->datedebmois) <= 0)

	jmp	$L71130
$L71117:
	mov	ecx, DWORD PTR _cf$[ebp]
	add	ecx, 168				; 000000a8H
	push	ecx
	mov	edx, DWORD PTR _maxfin$71066[ebp]
	push	edx
	call	_strcmp
	add	esp, 8
	test	eax, eax
	jg	SHORT $L71119

; 1265 : 			/* Date de fin de facturation atteinte : mesure archivee */
; 1266 : 			statut = cf->val_Archivee;

	mov	eax, DWORD PTR _cf$[ebp]
	mov	ecx, DWORD PTR [eax+96]
	mov	DWORD PTR _statut$71070[ebp], ecx

; 1267 : 			nouvstatut = "Archivée";

	mov	DWORD PTR _nouvstatut$71072[ebp], OFFSET FLAT:$SG71120

; 1268 : 			bgcolor = "#CCCCFF";

	mov	DWORD PTR _bgcolor$71073[ebp], OFFSET FLAT:$SG71121

; 1270 : 		else if(strcmp(mindeb, cf->datefinmois) > 0)

	jmp	$L71130
$L71119:
	mov	edx, DWORD PTR _cf$[ebp]
	add	edx, 178				; 000000b2H
	push	edx
	mov	eax, DWORD PTR _mindeb$71065[ebp]
	push	eax
	call	_strcmp
	add	esp, 8
	test	eax, eax
	jle	SHORT $L71123

; 1272 : 			statut = cf->val_En_attente;

	mov	ecx, DWORD PTR _cf$[ebp]
	mov	edx, DWORD PTR [ecx+100]
	mov	DWORD PTR _statut$71070[ebp], edx

; 1273 : 			nouvstatut = "En attente";

	mov	DWORD PTR _nouvstatut$71072[ebp], OFFSET FLAT:$SG71124

; 1274 : 			bgcolor = "#FFCCCC";

	mov	DWORD PTR _bgcolor$71073[ebp], OFFSET FLAT:$SG71125

; 1276 : 		else

	jmp	$L71130
$L71123:

; 1278 : 			statut = cf->val_En_cours;

	mov	eax, DWORD PTR _cf$[ebp]
	mov	ecx, DWORD PTR [eax+88]
	mov	DWORD PTR _statut$71070[ebp], ecx

; 1279 : 			nouvstatut = "En cours";

	mov	DWORD PTR _nouvstatut$71072[ebp], OFFSET FLAT:$SG71127

; 1280 : 			bgcolor = "#CCFFCC";

	mov	DWORD PTR _bgcolor$71073[ebp], OFFSET FLAT:$SG71128

; 1281 : 			if(!cf->mes[i].ts) DYNTAB_SET(ano, ano->nbrows, 0, "Attente affectation TS");

	mov	edx, DWORD PTR _i$[ebp]
	imul	edx, 168				; 000000a8H
	mov	eax, DWORD PTR _cf$[ebp]
	mov	ecx, DWORD PTR [eax+248]
	cmp	DWORD PTR [ecx+edx+164], 0
	jne	SHORT $L71130
	push	22					; 00000016H
	push	OFFSET FLAT:$SG71131
	push	0
	mov	edx, DWORD PTR _ano$71076[ebp]
	mov	eax, DWORD PTR [edx]
	push	eax
	mov	ecx, DWORD PTR _ano$71076[ebp]
	push	ecx
	call	_dyntab_set_txt
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L71130
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29872], OFFSET FLAT:$SG71133
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 1281		; 00000501H
	jmp	$eva_err$71049
$L71130:

; 1283 : 
; 1284 : 		/* Journal d'execution pour la mesure si applicable */
; 1285 : 		if(cf->b_detail_journal || strcmp(valstatut, nouvstatut))

	mov	ecx, DWORD PTR _cf$[ebp]
	cmp	DWORD PTR [ecx+164], 0
	jne	SHORT $L71135
	mov	edx, DWORD PTR _nouvstatut$71072[ebp]
	push	edx
	mov	eax, DWORD PTR _valstatut$71071[ebp]
	push	eax
	call	_strcmp
	add	esp, 8
	test	eax, eax
	je	$L71134
$L71135:

; 1287 : 			if(strcmp(valstatut, nouvstatut)) cf->nb_modif++;

	mov	ecx, DWORD PTR _nouvstatut$71072[ebp]
	push	ecx
	mov	edx, DWORD PTR _valstatut$71071[ebp]
	push	edx
	call	_strcmp
	add	esp, 8
	test	eax, eax
	je	SHORT $L71136
	mov	eax, DWORD PTR _cf$[ebp]
	mov	ecx, DWORD PTR [eax+160]
	add	ecx, 1
	mov	edx, DWORD PTR _cf$[ebp]
	mov	DWORD PTR [edx+160], ecx
$L71136:

; 1288 : 			printf("<table border=0 cellpadding=1 cellspacing=0 width=800><tr>");

	push	OFFSET FLAT:$SG71137
	call	_printf
	add	esp, 4

; 1289 : 			if(form_eval_fieldexpr(cntxt, &data, 0,  idmesure, add_sz_str("ALLOCATAIRE->NOM,PRENOM"), NULL, 0)) STACK_ERROR;

	push	0
	push	0
	push	23					; 00000017H
	push	OFFSET FLAT:$SG71140
	mov	eax, DWORD PTR _idmesure$71057[ebp]
	push	eax
	push	0
	lea	ecx, DWORD PTR _data$[ebp]
	push	ecx
	mov	edx, DWORD PTR _cntxt$[ebp]
	push	edx
	call	_form_eval_fieldexpr
	add	esp, 32					; 00000020H
	test	eax, eax
	je	SHORT $L71139
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 1289		; 00000509H
	jmp	$eva_err$71049
$L71139:

; 1290 : 			dyntab_sort(&data, qsort_colval);

	push	OFFSET FLAT:_qsort_colval
	lea	ecx, DWORD PTR _data$[ebp]
	push	ecx
	call	_dyntab_sort
	add	esp, 8

; 1291 : 			printf("<td width=150><font size=-1>%s %s</td>", dyntab_val(&data, 1, 0), dyntab_val(&data, 0, 0));

	push	0
	push	0
	lea	edx, DWORD PTR _data$[ebp]
	push	edx
	call	_dyntab_val
	add	esp, 12					; 0000000cH
	push	eax
	push	0
	push	1
	lea	eax, DWORD PTR _data$[ebp]
	push	eax
	call	_dyntab_val
	add	esp, 12					; 0000000cH
	push	eax
	push	OFFSET FLAT:$SG71141
	call	_printf
	add	esp, 12					; 0000000cH

; 1292 : 			printf("<td width=80 align=right><font size=-1>");

	push	OFFSET FLAT:$SG71142
	call	_printf
	add	esp, 4

; 1293 : 			if(*datedeb) printf("%.2s/%.2s/%.4s", datedeb+6, datedeb+4, datedeb);

	mov	ecx, DWORD PTR _datedeb$71060[ebp]
	movsx	edx, BYTE PTR [ecx]
	test	edx, edx
	je	SHORT $L71143
	mov	eax, DWORD PTR _datedeb$71060[ebp]
	push	eax
	mov	ecx, DWORD PTR _datedeb$71060[ebp]
	add	ecx, 4
	push	ecx
	mov	edx, DWORD PTR _datedeb$71060[ebp]
	add	edx, 6
	push	edx
	push	OFFSET FLAT:$SG71144
	call	_printf
	add	esp, 16					; 00000010H
$L71143:

; 1294 : 			printf("</td><td width=10 align=center>-</td><td width=80><font size=-1>");

	push	OFFSET FLAT:$SG71145
	call	_printf
	add	esp, 4

; 1295 : 			if(*datefin) printf("%.2s/%.2s/%.4s", datefin+6, datefin+4, datefin);

	mov	eax, DWORD PTR _datefin$71061[ebp]
	movsx	ecx, BYTE PTR [eax]
	test	ecx, ecx
	je	SHORT $L71146
	mov	edx, DWORD PTR _datefin$71061[ebp]
	push	edx
	mov	eax, DWORD PTR _datefin$71061[ebp]
	add	eax, 4
	push	eax
	mov	ecx, DWORD PTR _datefin$71061[ebp]
	add	ecx, 6
	push	ecx
	push	OFFSET FLAT:$SG71147
	call	_printf
	add	esp, 16					; 00000010H
$L71146:

; 1296 : 			printf("</td>");

	push	OFFSET FLAT:$SG71148
	call	_printf
	add	esp, 4

; 1297 : 			if(qry_obj_idfield(cntxt, &data, iddest, cf->val_NOM_SOCIETE)) STACK_ERROR;

	mov	edx, DWORD PTR _cf$[ebp]
	mov	eax, DWORD PTR [edx+84]
	push	eax
	mov	ecx, DWORD PTR _iddest$71059[ebp]
	push	ecx
	lea	edx, DWORD PTR _data$[ebp]
	push	edx
	mov	eax, DWORD PTR _cntxt$[ebp]
	push	eax
	call	_qry_obj_idfield
	add	esp, 16					; 00000010H
	test	eax, eax
	je	SHORT $L71149
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 1297		; 00000511H
	jmp	$eva_err$71049
$L71149:

; 1298 : 			printf("<td width=120><font size=-2>%s</td>", dyntab_val(&data, 0, 0));

	push	0
	push	0
	lea	edx, DWORD PTR _data$[ebp]
	push	edx
	call	_dyntab_val
	add	esp, 12					; 0000000cH
	push	eax
	push	OFFSET FLAT:$SG71150
	call	_printf
	add	esp, 8

; 1299 : 			printf("<td width=30 align=right>%d</td><td width=10>j</td><td width=20>%+d</td>", nbfact, nbcorr);

	mov	eax, DWORD PTR _nbcorr$71068[ebp]
	push	eax
	mov	ecx, DWORD PTR _nbfact$71067[ebp]
	push	ecx
	push	OFFSET FLAT:$SG71151
	call	_printf
	add	esp, 12					; 0000000cH

; 1300 : 			printf("<td width=60><font size=-2>%s</td>", strcmp(valstatut, nouvstatut) ? valstatut : "");

	mov	edx, DWORD PTR _nouvstatut$71072[ebp]
	push	edx
	mov	eax, DWORD PTR _valstatut$71071[ebp]
	push	eax
	call	_strcmp
	add	esp, 8
	test	eax, eax
	je	SHORT $L71302
	mov	ecx, DWORD PTR _valstatut$71071[ebp]
	mov	DWORD PTR -2568+[ebp], ecx
	jmp	SHORT $L71303
$L71302:
	mov	DWORD PTR -2568+[ebp], OFFSET FLAT:$SG71152
$L71303:
	mov	edx, DWORD PTR -2568+[ebp]
	push	edx
	push	OFFSET FLAT:$SG71153
	call	_printf
	add	esp, 8

; 1301 : 			printf("<td width=80 bgcolor=%s><font size=-1>%s</td>", bgcolor, nouvstatut);

	mov	eax, DWORD PTR _nouvstatut$71072[ebp]
	push	eax
	mov	ecx, DWORD PTR _bgcolor$71073[ebp]
	push	ecx
	push	OFFSET FLAT:$SG71154
	call	_printf
	add	esp, 12					; 0000000cH

; 1302 : 			printf("<td%s><font size=-2><b>", ano->nbrows ? " bgcolor=#FFDDBB" : "");

	mov	edx, DWORD PTR _ano$71076[ebp]
	cmp	DWORD PTR [edx], 0
	je	SHORT $L71304
	mov	DWORD PTR -2572+[ebp], OFFSET FLAT:$SG71155
	jmp	SHORT $L71305
$L71304:
	mov	DWORD PTR -2572+[ebp], OFFSET FLAT:$SG71156
$L71305:
	mov	eax, DWORD PTR -2572+[ebp]
	push	eax
	push	OFFSET FLAT:$SG71157
	call	_printf
	add	esp, 8

; 1303 : 			for(j = 0; j < ano->nbrows; j++) printf("%s%s", j ? ", " : "", dyntab_val(ano, j, 0));

	mov	DWORD PTR _j$[ebp], 0
	jmp	SHORT $L71158
$L71159:
	mov	ecx, DWORD PTR _j$[ebp]
	add	ecx, 1
	mov	DWORD PTR _j$[ebp], ecx
$L71158:
	mov	edx, DWORD PTR _ano$71076[ebp]
	mov	eax, DWORD PTR _j$[ebp]
	cmp	eax, DWORD PTR [edx]
	jae	SHORT $L71160
	cmp	DWORD PTR _j$[ebp], 0
	je	SHORT $L71306
	mov	DWORD PTR -2576+[ebp], OFFSET FLAT:$SG71161
	jmp	SHORT $L71307
$L71306:
	mov	DWORD PTR -2576+[ebp], OFFSET FLAT:$SG71162
$L71307:
	push	0
	mov	ecx, DWORD PTR _j$[ebp]
	push	ecx
	mov	edx, DWORD PTR _ano$71076[ebp]
	push	edx
	call	_dyntab_val
	add	esp, 12					; 0000000cH
	push	eax
	mov	eax, DWORD PTR -2576+[ebp]
	push	eax
	push	OFFSET FLAT:$SG71163
	call	_printf
	add	esp, 12					; 0000000cH
	jmp	SHORT $L71159
$L71160:

; 1304 : 			printf("</b></font></td>");

	push	OFFSET FLAT:$SG71164
	call	_printf
	add	esp, 4

; 1305 : 			printf("</tr></table>");

	push	OFFSET FLAT:$SG71165
	call	_printf
	add	esp, 4

; 1306 : 			fflush(stdout);

	push	OFFSET FLAT:__iob+32
	call	_fflush
	add	esp, 4
$L71134:

; 1308 : 
; 1309 : 		/* Maj etat mesure et dates facturation */
; 1310 : 		if(strcmp(valstatut, nouvstatut)) QRY_UPDATE_IDVAL(idmesure, ETAT_FACTURATION, statut);

	mov	ecx, DWORD PTR _nouvstatut$71072[ebp]
	push	ecx
	mov	edx, DWORD PTR _valstatut$71071[ebp]
	push	edx
	call	_strcmp
	add	esp, 8
	test	eax, eax
	je	SHORT $L71168
	mov	eax, DWORD PTR _idmesure$71057[ebp]
	mov	DWORD PTR _val$71075[ebp+20], eax
	mov	ecx, DWORD PTR _cf$[ebp]
	mov	edx, DWORD PTR [ecx+20]
	mov	DWORD PTR _val$71075[ebp+28], edx
	mov	eax, DWORD PTR _statut$71070[ebp]
	mov	DWORD PTR _val$71075[ebp+32], eax
	mov	DWORD PTR _val$71075[ebp], 0
	mov	DWORD PTR _val$71075[ebp+4], 0
	mov	BYTE PTR _val$71075[ebp+12], 0
	push	0
	push	3
	lea	ecx, DWORD PTR _val$71075[ebp]
	push	ecx
	mov	edx, DWORD PTR _cntxt$[ebp]
	push	edx
	call	_qry_add_val
	add	esp, 16					; 00000010H
	test	eax, eax
	je	SHORT $L71168
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 1310		; 0000051eH
	jmp	$eva_err$71049
$L71168:

; 1311 : 		if(strcmp(cf->mes[i].debfact, datedebcor)) QRY_UPDATE_VAL(cf->mes[i].id, DATE_FACT_DEBUT, datedebcor, 0);

	lea	ecx, DWORD PTR _datedebcor$71062[ebp]
	push	ecx
	mov	edx, DWORD PTR _i$[ebp]
	imul	edx, 168				; 000000a8H
	mov	eax, DWORD PTR _cf$[ebp]
	mov	ecx, DWORD PTR [eax+248]
	lea	edx, DWORD PTR [ecx+edx+120]
	push	edx
	call	_strcmp
	add	esp, 8
	test	eax, eax
	je	$L71171
	mov	eax, DWORD PTR _i$[ebp]
	imul	eax, 168				; 000000a8H
	mov	ecx, DWORD PTR _cf$[ebp]
	mov	edx, DWORD PTR [ecx+248]
	mov	eax, DWORD PTR [edx+eax]
	mov	DWORD PTR _val$71075[ebp+20], eax
	mov	ecx, DWORD PTR _cf$[ebp]
	mov	edx, DWORD PTR [ecx+72]
	mov	DWORD PTR _val$71075[ebp+28], edx
	mov	DWORD PTR _val$71075[ebp+32], 0
	lea	eax, DWORD PTR _datedebcor$71062[ebp]
	mov	DWORD PTR _val$71075[ebp], eax
	mov	DWORD PTR _val$71075[ebp+4], 0
	mov	BYTE PTR _val$71075[ebp+12], 0
	push	0
	push	3
	lea	ecx, DWORD PTR _val$71075[ebp]
	push	ecx
	mov	edx, DWORD PTR _cntxt$[ebp]
	push	edx
	call	_qry_add_val
	add	esp, 16					; 00000010H
	test	eax, eax
	je	SHORT $L71171
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 1311		; 0000051fH
	jmp	$eva_err$71049
$L71171:

; 1312 : 		if(strcmp(cf->mes[i].finfact, datefincor)) QRY_UPDATE_VAL(cf->mes[i].id, DATE_FACT_FIN, datefincor, 0);

	lea	ecx, DWORD PTR _datefincor$71063[ebp]
	push	ecx
	mov	edx, DWORD PTR _i$[ebp]
	imul	edx, 168				; 000000a8H
	mov	eax, DWORD PTR _cf$[ebp]
	mov	ecx, DWORD PTR [eax+248]
	lea	edx, DWORD PTR [ecx+edx+130]
	push	edx
	call	_strcmp
	add	esp, 8
	test	eax, eax
	je	$L71174
	mov	eax, DWORD PTR _i$[ebp]
	imul	eax, 168				; 000000a8H
	mov	ecx, DWORD PTR _cf$[ebp]
	mov	edx, DWORD PTR [ecx+248]
	mov	eax, DWORD PTR [edx+eax]
	mov	DWORD PTR _val$71075[ebp+20], eax
	mov	ecx, DWORD PTR _cf$[ebp]
	mov	edx, DWORD PTR [ecx+76]
	mov	DWORD PTR _val$71075[ebp+28], edx
	mov	DWORD PTR _val$71075[ebp+32], 0
	lea	eax, DWORD PTR _datefincor$71063[ebp]
	mov	DWORD PTR _val$71075[ebp], eax
	mov	DWORD PTR _val$71075[ebp+4], 0
	mov	BYTE PTR _val$71075[ebp+12], 0
	push	0
	push	3
	lea	ecx, DWORD PTR _val$71075[ebp]
	push	ecx
	mov	edx, DWORD PTR _cntxt$[ebp]
	push	edx
	call	_qry_add_val
	add	esp, 16					; 00000010H
	test	eax, eax
	je	SHORT $L71174
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 1312		; 00000520H
	jmp	$eva_err$71049
$L71174:

; 1313 : 
; 1314 : 		/* Ligne non necessaire : efface la ligne si elle existe et continue */
; 1315 : 		if(statut != cf->val_En_cours && !b_calcmanuel)

	mov	ecx, DWORD PTR _cf$[ebp]
	mov	edx, DWORD PTR _statut$71070[ebp]
	cmp	edx, DWORD PTR [ecx+88]
	je	$L71175
	cmp	DWORD PTR _b_calcmanuel$71069[ebp], 0
	jne	$L71175

; 1317 : 			if(idlignefact)

	cmp	DWORD PTR _idlignefact$71058[ebp], 0
	je	SHORT $L71179

; 1319 : 				snprintf(add_sz_str(qry), "UPDATE TLink SET DateDel='%s',IdWhoDel=%lu WHERE DateDel IS NULL AND IdObj=%lu",
; 1320 : 					cntxt->timestamp, DYNTAB_TOUL(&cntxt->id_user), idlignefact);

	mov	eax, DWORD PTR _idlignefact$71058[ebp]
	push	eax
	push	10					; 0000000aH
	push	0
	push	0
	push	0
	mov	ecx, DWORD PTR _cntxt$[ebp]
	add	ecx, 29408				; 000072e0H
	push	ecx
	call	_dyntab_val
	add	esp, 12					; 0000000cH
	push	eax
	call	_strtoul
	add	esp, 12					; 0000000cH
	push	eax
	mov	edx, DWORD PTR _cntxt$[ebp]
	add	edx, 29704				; 00007408H
	push	edx
	push	OFFSET FLAT:$SG71178
	push	2047					; 000007ffH
	lea	eax, DWORD PTR _qry$[ebp]
	push	eax
	call	__snprintf
	add	esp, 24					; 00000018H

; 1321 : 				if(sql_exec_query(cntxt, qry)) STACK_ERROR;

	lea	ecx, DWORD PTR _qry$[ebp]
	push	ecx
	mov	edx, DWORD PTR _cntxt$[ebp]
	push	edx
	call	_sql_exec_query
	add	esp, 8
	test	eax, eax
	je	SHORT $L71179
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 1321		; 00000529H
	jmp	$eva_err$71049
$L71179:

; 1323 : 
; 1324 : 			/* Maj mesure : encours et année de fin si terminée */
; 1325 : 			QRY_UPDATE_IDVAL(idmesure, ETAT_FACTURATION, statut);

	mov	ecx, DWORD PTR _idmesure$71057[ebp]
	mov	DWORD PTR _val$71075[ebp+20], ecx
	mov	edx, DWORD PTR _cf$[ebp]
	mov	eax, DWORD PTR [edx+20]
	mov	DWORD PTR _val$71075[ebp+28], eax
	mov	ecx, DWORD PTR _statut$71070[ebp]
	mov	DWORD PTR _val$71075[ebp+32], ecx
	mov	DWORD PTR _val$71075[ebp], 0
	mov	DWORD PTR _val$71075[ebp+4], 0
	mov	BYTE PTR _val$71075[ebp+12], 0
	push	0
	push	3
	lea	edx, DWORD PTR _val$71075[ebp]
	push	edx
	mov	eax, DWORD PTR _cntxt$[ebp]
	push	eax
	call	_qry_add_val
	add	esp, 16					; 00000010H
	test	eax, eax
	je	SHORT $L71181
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 1325		; 0000052dH
	jmp	$eva_err$71049
$L71181:

; 1326 : 			QRY_UPDATE_VAL(idmesure, ANNEE_FIN, datefincor, 4);

	mov	edx, DWORD PTR _idmesure$71057[ebp]
	mov	DWORD PTR _val$71075[ebp+20], edx
	mov	eax, DWORD PTR _cf$[ebp]
	mov	ecx, DWORD PTR [eax+24]
	mov	DWORD PTR _val$71075[ebp+28], ecx
	mov	DWORD PTR _val$71075[ebp+32], 0
	lea	edx, DWORD PTR _datefincor$71063[ebp]
	mov	DWORD PTR _val$71075[ebp], edx
	mov	DWORD PTR _val$71075[ebp+4], 4
	mov	BYTE PTR _val$71075[ebp+12], 0
	push	0
	push	3
	lea	eax, DWORD PTR _val$71075[ebp]
	push	eax
	mov	ecx, DWORD PTR _cntxt$[ebp]
	push	ecx
	call	_qry_add_val
	add	esp, 16					; 00000010H
	test	eax, eax
	je	SHORT $L71183
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 1326		; 0000052eH
	jmp	$eva_err$71049
$L71183:

; 1327 : 			continue;

	jmp	$L71055
$L71175:

; 1329 : 
; 1330 : 		/* Mesure en cours : effacement année de fin */
; 1331 : 		cf->nb_lignfact++;

	mov	eax, DWORD PTR _cf$[ebp]
	mov	ecx, DWORD PTR [eax+156]
	add	ecx, 1
	mov	edx, DWORD PTR _cf$[ebp]
	mov	DWORD PTR [edx+156], ecx

; 1332 : 
; 1333 : 		/* Si la ligne n'existe pas : creation */
; 1334 : 		if(!idlignefact)

	cmp	DWORD PTR _idlignefact$71058[ebp], 0
	jne	$L71192

; 1336 : 			if(qry_add_new_obj(cntxt, &data, cf->form_LigneFacture)) STACK_ERROR;

	mov	eax, DWORD PTR _cf$[ebp]
	mov	ecx, DWORD PTR [eax+12]
	push	ecx
	lea	edx, DWORD PTR _data$[ebp]
	push	edx
	mov	eax, DWORD PTR _cntxt$[ebp]
	push	eax
	call	_qry_add_new_obj
	add	esp, 12					; 0000000cH
	test	eax, eax
	je	SHORT $L71185
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 1336		; 00000538H
	jmp	$eva_err$71049
$L71185:

; 1337 : 			idlignefact = DYNTAB_TOUL(&data);

	push	10					; 0000000aH
	push	0
	push	0
	push	0
	lea	edx, DWORD PTR _data$[ebp]
	push	edx
	call	_dyntab_val
	add	esp, 12					; 0000000cH
	push	eax
	call	_strtoul
	add	esp, 12					; 0000000cH
	mov	DWORD PTR _idlignefact$71058[ebp], eax

; 1338 : 			QRY_CREATE_REL(idlignefact, FACTURE, cf->idfacture);

	mov	eax, DWORD PTR _idlignefact$71058[ebp]
	mov	DWORD PTR _val$71075[ebp+20], eax
	mov	ecx, DWORD PTR _cf$[ebp]
	mov	edx, DWORD PTR [ecx+28]
	mov	DWORD PTR _val$71075[ebp+28], edx
	mov	eax, DWORD PTR _cf$[ebp]
	mov	ecx, DWORD PTR [eax+4]
	mov	DWORD PTR _val$71075[ebp+32], ecx
	mov	DWORD PTR _val$71075[ebp], 0
	mov	DWORD PTR _val$71075[ebp+4], 0
	mov	BYTE PTR _val$71075[ebp+12], 1
	push	0
	push	0
	lea	edx, DWORD PTR _val$71075[ebp]
	push	edx
	mov	eax, DWORD PTR _cntxt$[ebp]
	push	eax
	call	_qry_add_val
	add	esp, 16					; 00000010H
	test	eax, eax
	je	SHORT $L71189
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 1338		; 0000053aH
	jmp	$eva_err$71049
$L71189:

; 1339 : 			QRY_CREATE_REL(idlignefact, MES_LIGNE_FACT, idmesure);

	mov	edx, DWORD PTR _idlignefact$71058[ebp]
	mov	DWORD PTR _val$71075[ebp+20], edx
	mov	eax, DWORD PTR _cf$[ebp]
	mov	ecx, DWORD PTR [eax+32]
	mov	DWORD PTR _val$71075[ebp+28], ecx
	mov	edx, DWORD PTR _idmesure$71057[ebp]
	mov	DWORD PTR _val$71075[ebp+32], edx
	mov	DWORD PTR _val$71075[ebp], 0
	mov	DWORD PTR _val$71075[ebp+4], 0
	mov	BYTE PTR _val$71075[ebp+12], 1
	push	0
	push	0
	lea	eax, DWORD PTR _val$71075[ebp]
	push	eax
	mov	ecx, DWORD PTR _cntxt$[ebp]
	push	ecx
	call	_qry_add_val
	add	esp, 16					; 00000010H
	test	eax, eax
	je	SHORT $L71192
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 1339		; 0000053bH
	jmp	$eva_err$71049
$L71192:

; 1341 : 
; 1342 : 		/* Mise a jour des valeurs calculees */
; 1343 : 		QRY_UPDATE_REL(idlignefact, DEST_FACTURE, iddest);

	mov	eax, DWORD PTR _idlignefact$71058[ebp]
	mov	DWORD PTR _val$71075[ebp+20], eax
	mov	ecx, DWORD PTR _cf$[ebp]
	mov	edx, DWORD PTR [ecx+36]
	mov	DWORD PTR _val$71075[ebp+28], edx
	mov	eax, DWORD PTR _iddest$71059[ebp]
	mov	DWORD PTR _val$71075[ebp+32], eax
	mov	DWORD PTR _val$71075[ebp], 0
	mov	DWORD PTR _val$71075[ebp+4], 0
	mov	BYTE PTR _val$71075[ebp+12], 1
	push	0
	push	3
	lea	ecx, DWORD PTR _val$71075[ebp]
	push	ecx
	mov	edx, DWORD PTR _cntxt$[ebp]
	push	edx
	call	_qry_add_val
	add	esp, 16					; 00000010H
	test	eax, eax
	je	SHORT $L71195
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 1343		; 0000053fH
	jmp	$eva_err$71049
$L71195:

; 1344 : 		if(statut == cf->val_En_cours)

	mov	ecx, DWORD PTR _cf$[ebp]
	mov	edx, DWORD PTR _statut$71070[ebp]
	cmp	edx, DWORD PTR [ecx+88]
	jne	$L71196

; 1346 : 			QRY_UPDATE_VAL(idmesure, ANNEE_FIN, NULL, 0);

	mov	eax, DWORD PTR _idmesure$71057[ebp]
	mov	DWORD PTR _val$71075[ebp+20], eax
	mov	ecx, DWORD PTR _cf$[ebp]
	mov	edx, DWORD PTR [ecx+24]
	mov	DWORD PTR _val$71075[ebp+28], edx
	mov	DWORD PTR _val$71075[ebp+32], 0
	mov	DWORD PTR _val$71075[ebp], 0
	mov	DWORD PTR _val$71075[ebp+4], 0
	mov	BYTE PTR _val$71075[ebp+12], 0
	push	0
	push	3
	lea	eax, DWORD PTR _val$71075[ebp]
	push	eax
	mov	ecx, DWORD PTR _cntxt$[ebp]
	push	ecx
	call	_qry_add_val
	add	esp, 16					; 00000010H
	test	eax, eax
	je	SHORT $L71199
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 1346		; 00000542H
	jmp	$eva_err$71049
$L71199:

; 1347 : 			QRY_UPDATE_VAL(idlignefact, QTE_FACTURE, "1", 1);

	mov	eax, DWORD PTR _idlignefact$71058[ebp]
	mov	DWORD PTR _val$71075[ebp+20], eax
	mov	ecx, DWORD PTR _cf$[ebp]
	mov	edx, DWORD PTR [ecx+40]
	mov	DWORD PTR _val$71075[ebp+28], edx
	mov	DWORD PTR _val$71075[ebp+32], 0
	mov	DWORD PTR _val$71075[ebp], OFFSET FLAT:$SG71200
	mov	DWORD PTR _val$71075[ebp+4], 1
	mov	BYTE PTR _val$71075[ebp+12], 0
	push	0
	push	3
	lea	eax, DWORD PTR _val$71075[ebp]
	push	eax
	mov	ecx, DWORD PTR _cntxt$[ebp]
	push	ecx
	call	_qry_add_val
	add	esp, 16					; 00000010H
	test	eax, eax
	je	SHORT $L71202
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 1347		; 00000543H
	jmp	$eva_err$71049
$L71202:

; 1349 : 		else

	jmp	SHORT $L71206
$L71196:

; 1351 : 			QRY_UPDATE_VAL(idlignefact, QTE_FACTURE, NULL, 0);

	mov	eax, DWORD PTR _idlignefact$71058[ebp]
	mov	DWORD PTR _val$71075[ebp+20], eax
	mov	ecx, DWORD PTR _cf$[ebp]
	mov	edx, DWORD PTR [ecx+40]
	mov	DWORD PTR _val$71075[ebp+28], edx
	mov	DWORD PTR _val$71075[ebp+32], 0
	mov	DWORD PTR _val$71075[ebp], 0
	mov	DWORD PTR _val$71075[ebp+4], 0
	mov	BYTE PTR _val$71075[ebp+12], 0
	push	0
	push	3
	lea	eax, DWORD PTR _val$71075[ebp]
	push	eax
	mov	ecx, DWORD PTR _cntxt$[ebp]
	push	ecx
	call	_qry_add_val
	add	esp, 16					; 00000010H
	test	eax, eax
	je	SHORT $L71206
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 1351		; 00000547H
	jmp	$eva_err$71049
$L71206:

; 1353 : 		if(nbcorr)

	cmp	DWORD PTR _nbcorr$71068[ebp], 0
	je	$L71207

; 1355 : 			QRY_UPDATE_VAL(idlignefact, QTE_CORRECTION, txt, snprintf(add_sz_str(txt), "%d", nbcorr));

	mov	eax, DWORD PTR _idlignefact$71058[ebp]
	mov	DWORD PTR _val$71075[ebp+20], eax
	mov	ecx, DWORD PTR _cf$[ebp]
	mov	edx, DWORD PTR [ecx+44]
	mov	DWORD PTR _val$71075[ebp+28], edx
	mov	DWORD PTR _val$71075[ebp+32], 0
	lea	eax, DWORD PTR _txt$[ebp]
	mov	DWORD PTR _val$71075[ebp], eax
	mov	ecx, DWORD PTR _nbcorr$71068[ebp]
	push	ecx
	push	OFFSET FLAT:$SG71208
	push	31					; 0000001fH
	lea	edx, DWORD PTR _txt$[ebp]
	push	edx
	call	__snprintf
	add	esp, 16					; 00000010H
	mov	DWORD PTR _val$71075[ebp+4], eax
	mov	BYTE PTR _val$71075[ebp+12], 0
	push	0
	push	3
	lea	eax, DWORD PTR _val$71075[ebp]
	push	eax
	mov	ecx, DWORD PTR _cntxt$[ebp]
	push	ecx
	call	_qry_add_val
	add	esp, 16					; 00000010H
	test	eax, eax
	je	SHORT $L71210
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 1355		; 0000054bH
	jmp	$eva_err$71049
$L71210:

; 1357 : 		else

	jmp	SHORT $L71214
$L71207:

; 1359 : 			QRY_UPDATE_VAL(idlignefact, QTE_CORRECTION, NULL, 0);

	mov	eax, DWORD PTR _idlignefact$71058[ebp]
	mov	DWORD PTR _val$71075[ebp+20], eax
	mov	ecx, DWORD PTR _cf$[ebp]
	mov	edx, DWORD PTR [ecx+44]
	mov	DWORD PTR _val$71075[ebp+28], edx
	mov	DWORD PTR _val$71075[ebp+32], 0
	mov	DWORD PTR _val$71075[ebp], 0
	mov	DWORD PTR _val$71075[ebp+4], 0
	mov	BYTE PTR _val$71075[ebp+12], 0
	push	0
	push	3
	lea	eax, DWORD PTR _val$71075[ebp]
	push	eax
	mov	ecx, DWORD PTR _cntxt$[ebp]
	push	ecx
	call	_qry_add_val
	add	esp, 16					; 00000010H
	test	eax, eax
	je	SHORT $L71214
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 1359		; 0000054fH
	jmp	$eva_err$71049
$L71214:

; 1361 : 		if(qry_update_idobj_idfield(cntxt, idlignefact, cf->val_MOTIF_CORRECTION, ano, 3)) STACK_ERROR;

	push	3
	mov	eax, DWORD PTR _ano$71076[ebp]
	push	eax
	mov	ecx, DWORD PTR _cf$[ebp]
	mov	edx, DWORD PTR [ecx+48]
	push	edx
	mov	eax, DWORD PTR _idlignefact$71058[ebp]
	push	eax
	mov	ecx, DWORD PTR _cntxt$[ebp]
	push	ecx
	call	_qry_update_idobj_idfield
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L71215
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 1361		; 00000551H
	jmp	SHORT $eva_err$71049
$L71215:

; 1362 : 	}

	jmp	$L71055
$L71056:

; 1363 : 
; 1364 : 	printf("</table><br><br>"
; 1365 : 			"<table border=1 rules=none width=100%%><tr><td align=center>%lu mesures examinées<br>%lu mesures modifiées<br>%lu mesures facturées</td></tr>"
; 1366 : 			"<tr><td align=center><font size=-1><i>Utilisez la commande Fichier/Enregistrer "
; 1367 : 				"de votre navigateur si vous voulez conserver ce journal</td></tr>"
; 1368 : 			"<tr><td align=center><br><input type=submit value='Revenir à la facture' name='B$#NOP'></td></tr>"
; 1369 : 			"</table>\n<script>document.mainform['B$#NOP'].focus();</script>",
; 1370 : 			cf->nb_mes, cf->nb_modif, cf->nb_lignfact);

	mov	eax, DWORD PTR _cf$[ebp]
	mov	ecx, DWORD PTR [eax+156]
	push	ecx
	mov	edx, DWORD PTR _cf$[ebp]
	mov	eax, DWORD PTR [edx+160]
	push	eax
	mov	ecx, DWORD PTR _cf$[ebp]
	mov	edx, DWORD PTR [ecx+244]
	push	edx
	push	OFFSET FLAT:$SG71216
	call	_printf
	add	esp, 16					; 00000010H

; 1371 : 
; 1372 : 	cntxt->b_terminate = 31;

	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29776], 31		; 0000001fH
$eva_noerr$71050:

; 1373 : 
; 1374 : 	RETURN_OK_CLEANUP;

	push	0
	push	OFFSET FLAT:$SG71217
	push	OFFSET FLAT:$SG71218
	mov	ecx, DWORD PTR _cntxt$[ebp]
	push	ecx
	call	_err_clear
	add	esp, 16					; 00000010H
$eva_err$71049:
	mov	edx, DWORD PTR _cntxt$[ebp]
	cmp	DWORD PTR [edx+29872], 0
	je	SHORT $L71219
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	ecx, DWORD PTR [eax+29900]
	push	ecx
	push	OFFSET FLAT:$SG71220
	push	OFFSET FLAT:$SG71221
	mov	edx, DWORD PTR _cntxt$[ebp]
	push	edx
	call	_err_add_context
	add	esp, 16					; 00000010H
$L71219:
	lea	eax, DWORD PTR _lignfact$[ebp]
	push	eax
	call	_dyntab_free
	add	esp, 4
	lea	ecx, DWORD PTR _data$[ebp]
	push	ecx
	call	_dyntab_free
	add	esp, 4
	mov	edx, DWORD PTR _cntxt$[ebp]
	xor	eax, eax
	cmp	DWORD PTR [edx+29872], 0
	setne	al

; 1375 : }

	pop	edi
	mov	esp, ebp
	pop	ebp
	ret	0
_FactureTPS ENDP
_TEXT	ENDS
PUBLIC	_EcheancierTPS
_DATA	SEGMENT
	ORG $+1
$SG71236 DB	'D:\Travail\ABI\EVA\V4.0\CGI\Brunix-2016\dll_adsea01.c', 00H
	ORG $+2
$SG71237 DB	'EcheancierTPS', 00H
	ORG $+2
$SG71239 DB	'D:\Travail\ABI\EVA\V4.0\CGI\Brunix-2016\dll_adsea01.c', 00H
	ORG $+2
$SG71240 DB	'EcheancierTPS', 00H
_DATA	ENDS
_TEXT	SEGMENT
_cntxt$ = 8
_i_ctrl$ = 12
_cf$ = -252
_EcheancierTPS PROC NEAR

; 1388 : ){

	push	ebp
	mov	ebp, esp
	sub	esp, 252				; 000000fcH
	push	edi

; 1389 : 	cntxt_fact cf = {0};

	mov	DWORD PTR _cf$[ebp], 0
	mov	ecx, 62					; 0000003eH
	xor	eax, eax
	lea	edi, DWORD PTR _cf$[ebp+4]
	rep stosd

; 1390 : 
; 1391 : 	/* Lecture des mesures à examiner */
; 1392 : 	if(Init_TPS(cntxt, &cf) || Calc_echeancier(cntxt, &cf)) STACK_ERROR;

	lea	eax, DWORD PTR _cf$[ebp]
	push	eax
	mov	ecx, DWORD PTR _cntxt$[ebp]
	push	ecx
	call	_Init_TPS
	add	esp, 8
	test	eax, eax
	jne	SHORT $L71233
	lea	edx, DWORD PTR _cf$[ebp]
	push	edx
	mov	eax, DWORD PTR _cntxt$[ebp]
	push	eax
	call	_Calc_echeancier
	add	esp, 8
	test	eax, eax
	je	SHORT $eva_noerr$71235
$L71233:
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 1392		; 00000570H
	jmp	SHORT $eva_err$71234
$eva_noerr$71235:

; 1393 : 
; 1394 : 	RETURN_OK_CLEANUP;

	push	0
	push	OFFSET FLAT:$SG71236
	push	OFFSET FLAT:$SG71237
	mov	edx, DWORD PTR _cntxt$[ebp]
	push	edx
	call	_err_clear
	add	esp, 16					; 00000010H
$eva_err$71234:
	mov	eax, DWORD PTR _cntxt$[ebp]
	cmp	DWORD PTR [eax+29872], 0
	je	SHORT $L71238
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	edx, DWORD PTR [ecx+29900]
	push	edx
	push	OFFSET FLAT:$SG71239
	push	OFFSET FLAT:$SG71240
	mov	eax, DWORD PTR _cntxt$[ebp]
	push	eax
	call	_err_add_context
	add	esp, 16					; 00000010H
$L71238:
	mov	DWORD PTR _i_ctrl$[ebp], 0
	mov	ecx, DWORD PTR _cntxt$[ebp]
	xor	eax, eax
	cmp	DWORD PTR [ecx+29872], 0
	setne	al

; 1395 : }

	pop	edi
	mov	esp, ebp
	pop	ebp
	ret	0
_EcheancierTPS ENDP
_TEXT	ENDS
END
