	TITLE	D:\Travail\ABI\EVA\V4.0\CGI\Brunix-2016\dll_fap.c
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
_BSS	SEGMENT PARA USE32 PUBLIC 'BSS'
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
PUBLIC	__real@8@00000000000000000000
PUBLIC	_qsort_remise
EXTRN	__fltused:NEAR
;	COMDAT __real@8@00000000000000000000
; File D:\Travail\ABI\EVA\V4.0\CGI\Brunix-2016\dll_fap.c
CONST	SEGMENT
__real@8@00000000000000000000 DQ 00000000000000000r ; 0
CONST	ENDS
_TEXT	SEGMENT
_el1$ = 8
_el2$ = 12
_r1$ = -4
_r2$ = -8
_d1$ = -16
_d2$ = -24
_qsort_remise PROC NEAR

; 123  : {

	push	ebp
	mov	ebp, esp
	sub	esp, 48					; 00000030H

; 124  : 	struct _remtab *r1 = (struct _remtab *)el1;

	mov	eax, DWORD PTR _el1$[ebp]
	mov	DWORD PTR _r1$[ebp], eax

; 125  : 	struct _remtab *r2 = (struct _remtab *)el2;

	mov	ecx, DWORD PTR _el2$[ebp]
	mov	DWORD PTR _r2$[ebp], ecx

; 126  : 	double d1 = r1->qte, d2 = r2->qte;

	mov	edx, DWORD PTR _r1$[ebp]
	mov	eax, DWORD PTR [edx]
	mov	DWORD PTR -32+[ebp], eax
	mov	DWORD PTR -32+[ebp+4], 0
	fild	QWORD PTR -32+[ebp]
	fstp	QWORD PTR _d1$[ebp]
	mov	ecx, DWORD PTR _r2$[ebp]
	mov	edx, DWORD PTR [ecx]
	mov	DWORD PTR -40+[ebp], edx
	mov	DWORD PTR -40+[ebp+4], 0
	fild	QWORD PTR -40+[ebp]
	fstp	QWORD PTR _d2$[ebp]

; 127  : 	if(!d1 && !d2) { d1 = r1->mont; d2 = r2->mont; }

	fld	QWORD PTR _d1$[ebp]
	fcomp	QWORD PTR __real@8@00000000000000000000
	fnstsw	ax
	test	ah, 64					; 00000040H
	je	SHORT $L70301
	fld	QWORD PTR _d2$[ebp]
	fcomp	QWORD PTR __real@8@00000000000000000000
	fnstsw	ax
	test	ah, 64					; 00000040H
	je	SHORT $L70301
	mov	eax, DWORD PTR _r1$[ebp]
	mov	ecx, DWORD PTR [eax+8]
	mov	DWORD PTR _d1$[ebp], ecx
	mov	edx, DWORD PTR [eax+12]
	mov	DWORD PTR _d1$[ebp+4], edx
	mov	eax, DWORD PTR _r2$[ebp]
	mov	ecx, DWORD PTR [eax+8]
	mov	DWORD PTR _d2$[ebp], ecx
	mov	edx, DWORD PTR [eax+12]
	mov	DWORD PTR _d2$[ebp+4], edx
$L70301:

; 128  : 	return d1 == d2 ? 0 : d1 > d2 ? 1 : -1;

	fld	QWORD PTR _d1$[ebp]
	fcomp	QWORD PTR _d2$[ebp]
	fnstsw	ax
	test	ah, 64					; 00000040H
	je	SHORT $L71297
	mov	DWORD PTR -44+[ebp], 0
	jmp	SHORT $L71298
$L71297:
	fld	QWORD PTR _d1$[ebp]
	fcomp	QWORD PTR _d2$[ebp]
	fnstsw	ax
	test	ah, 65					; 00000041H
	jne	SHORT $L71295
	mov	DWORD PTR -48+[ebp], 1
	jmp	SHORT $L71296
$L71295:
	mov	DWORD PTR -48+[ebp], -1
$L71296:
	mov	eax, DWORD PTR -48+[ebp]
	mov	DWORD PTR -44+[ebp], eax
$L71298:
	mov	eax, DWORD PTR -44+[ebp]

; 129  : }

	mov	esp, ebp
	pop	ebp
	ret	0
_qsort_remise ENDP
_TEXT	ENDS
PUBLIC	_qsort_tabprix
_TEXT	SEGMENT
_el1$ = 8
_el2$ = 12
_r1$ = -4
_r2$ = -8
_qsort_tabprix PROC NEAR

; 136  : {

	push	ebp
	mov	ebp, esp
	sub	esp, 20					; 00000014H

; 137  : 	Prix *r1 = (Prix *)el1;

	mov	eax, DWORD PTR _el1$[ebp]
	mov	DWORD PTR _r1$[ebp], eax

; 138  : 	Prix *r2 = (Prix *)el2;

	mov	ecx, DWORD PTR _el2$[ebp]
	mov	DWORD PTR _r2$[ebp], ecx

; 139  : 	return r1->pcrem == r2->pcrem ?
; 140  : 				r1->qte == r2->qte ? 0 :
; 141  : 					r1->qte > r2->qte ? 1 : -1 :
; 142  : 				r1->pcrem > r2->pcrem ? 1 : -1;

	mov	edx, DWORD PTR _r1$[ebp]
	mov	eax, DWORD PTR _r2$[ebp]
	fld	QWORD PTR [edx+16]
	fcomp	QWORD PTR [eax+16]
	fnstsw	ax
	test	ah, 64					; 00000040H
	je	SHORT $L71307
	mov	ecx, DWORD PTR _r1$[ebp]
	mov	edx, DWORD PTR _r2$[ebp]
	mov	eax, DWORD PTR [ecx+4]
	cmp	eax, DWORD PTR [edx+4]
	jne	SHORT $L71303
	mov	DWORD PTR -12+[ebp], 0
	jmp	SHORT $L71304
$L71303:
	mov	ecx, DWORD PTR _r1$[ebp]
	mov	edx, DWORD PTR _r2$[ebp]
	mov	eax, DWORD PTR [ecx+4]
	xor	ecx, ecx
	cmp	eax, DWORD PTR [edx+4]
	setle	cl
	dec	ecx
	and	ecx, 2
	add	ecx, -1
	mov	DWORD PTR -12+[ebp], ecx
$L71304:
	mov	edx, DWORD PTR -12+[ebp]
	mov	DWORD PTR -16+[ebp], edx
	jmp	SHORT $L71308
$L71307:
	mov	eax, DWORD PTR _r1$[ebp]
	mov	ecx, DWORD PTR _r2$[ebp]
	fld	QWORD PTR [eax+16]
	fcomp	QWORD PTR [ecx+16]
	fnstsw	ax
	test	ah, 65					; 00000041H
	jne	SHORT $L71305
	mov	DWORD PTR -20+[ebp], 1
	jmp	SHORT $L71306
$L71305:
	mov	DWORD PTR -20+[ebp], -1
$L71306:
	mov	edx, DWORD PTR -20+[ebp]
	mov	DWORD PTR -16+[ebp], edx
$L71308:
	mov	eax, DWORD PTR -16+[ebp]

; 143  : }

	mov	esp, ebp
	pop	ebp
	ret	0
_qsort_tabprix ENDP
_TEXT	ENDS
PUBLIC	_FicheRemise
EXTRN	_atof:NEAR
EXTRN	_mem_alloc:NEAR
EXTRN	_mem_realloc:NEAR
EXTRN	_qsort:NEAR
EXTRN	_strtoul:NEAR
EXTRN	_qry_obj_field:NEAR
EXTRN	_dyntab_free:NEAR
EXTRN	_dyntab_val:NEAR
EXTRN	_memset:NEAR
EXTRN	_strcmp:NEAR
EXTRN	_err_add_context:NEAR
EXTRN	_err_clear:NEAR
EXTRN	_dyntab_filter_field:NEAR
EXTRN	_dyntab_field_val:NEAR
_BSS	SEGMENT
_?remise@?1??FicheRemise@@9@9 DD 01H DUP (?)
_?nbremise@?1??FicheRemise@@9@9 DD 01H DUP (?)
_BSS	ENDS
_DATA	SEGMENT
$SG70345 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70349 DB	'MODE_REMISE,QTE,MONTANT,REMISE,MARGE,ARRONDI_REMISE', 00H
$SG70350 DB	'MODE_REMISE', 00H
$SG70353 DB	'REMISE', 00H
	ORG $+1
$SG70355 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70358 DB	'Fixe', 00H
	ORG $+3
$SG70362 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70366 DB	'Marge', 00H
	ORG $+2
$SG70370 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70372 DB	'MARGE', 00H
	ORG $+2
$SG70373 DB	'ARRONDI_REMISE', 00H
	ORG $+1
$SG70376 DB	'QTE', 00H
$SG70380 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70386 DB	'Quantit', 0e9H, ' cumul', 0e9H, 'e', 00H
	ORG $+3
$SG70389 DB	'Montant', 00H
$SG70390 DB	'MONTANT', 00H
$SG70393 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70402 DB	'D:\Travail\ABI\EVA\V4.0\CGI\Brunix-2016\dll_fap.c', 00H
	ORG $+2
$SG70403 DB	'FicheRemise', 00H
$SG70405 DB	'D:\Travail\ABI\EVA\V4.0\CGI\Brunix-2016\dll_fap.c', 00H
	ORG $+2
$SG70406 DB	'FicheRemise', 00H
_DATA	ENDS
_TEXT	SEGMENT
_cx$ = 8
_res$ = 12
_id$ = 16
_cntxt$ = -52
_data$ = -24
_tab$ = -44
_i$ = -48
_mode$ = -56
_r$ = -4
_newdest$70340 = -60
_size1$70359 = -64
_size1$70367 = -68
_fld$70375 = -72
_size1$70377 = -76
_t$70397 = -80
_v$70398 = -84
_FicheRemise PROC NEAR

; 156  : ){

	push	ebp
	mov	ebp, esp
	sub	esp, 84					; 00000054H

; 157  : 	EVA_context *cntxt = cx->cntxt;

	mov	eax, DWORD PTR _cx$[ebp]
	mov	ecx, DWORD PTR [eax]
	mov	DWORD PTR _cntxt$[ebp], ecx

; 158  : 	DynTable data = {0};

	mov	DWORD PTR _data$[ebp], 0
	xor	edx, edx
	mov	DWORD PTR _data$[ebp+4], edx
	mov	DWORD PTR _data$[ebp+8], edx
	mov	DWORD PTR _data$[ebp+12], edx
	mov	DWORD PTR _data$[ebp+16], edx

; 159  : 	DynTable tab = {0};

	mov	DWORD PTR _tab$[ebp], 0
	xor	eax, eax
	mov	DWORD PTR _tab$[ebp+4], eax
	mov	DWORD PTR _tab$[ebp+8], eax
	mov	DWORD PTR _tab$[ebp+12], eax
	mov	DWORD PTR _tab$[ebp+16], eax

; 160  : 	static Remise *remise;
; 161  : 	static unsigned long nbremise;
; 162  : 	unsigned long i = 0;

	mov	DWORD PTR _i$[ebp], 0

; 163  : 	char *mode;
; 164  : 	Remise *r;
; 165  : 	if(!id || !res) RETURN_OK;

	cmp	DWORD PTR _id$[ebp], 0
	je	SHORT $L70333
	cmp	DWORD PTR _res$[ebp], 0
	jne	SHORT $L70332
$L70333:
	jmp	$eva_noerr$70334
$L70332:

; 166  : 
; 167  : 	/* Recherche de la fiche dans le buffer */
; 168  : 	while(i < nbremise && remise[i].id != id) i++;

	mov	ecx, DWORD PTR _i$[ebp]
	cmp	ecx, DWORD PTR _?nbremise@?1??FicheRemise@@9@9
	jae	SHORT $L70337
	mov	edx, DWORD PTR _i$[ebp]
	shl	edx, 4
	mov	eax, DWORD PTR _?remise@?1??FicheRemise@@9@9
	mov	ecx, DWORD PTR [eax+edx]
	cmp	ecx, DWORD PTR _id$[ebp]
	je	SHORT $L70337
	mov	edx, DWORD PTR _i$[ebp]
	add	edx, 1
	mov	DWORD PTR _i$[ebp], edx
	jmp	SHORT $L70332
$L70337:

; 169  : 	if(i < nbremise)

	mov	eax, DWORD PTR _i$[ebp]
	cmp	eax, DWORD PTR _?nbremise@?1??FicheRemise@@9@9
	jae	SHORT $L70338

; 170  : 		/* Retourne la fiche trouvee dans le buffer */
; 171  : 		r = remise + i;

	mov	ecx, DWORD PTR _i$[ebp]
	shl	ecx, 4
	mov	edx, DWORD PTR _?remise@?1??FicheRemise@@9@9
	add	edx, ecx
	mov	DWORD PTR _r$[ebp], edx

; 172  : 	else

	jmp	$L70374
$L70338:

; 174  : 		/* Fiche non trouvee : ajoute au buffer */
; 175  : 		M_REALLOC(Remise, remise, nbremise);

	push	32					; 00000020H
	mov	eax, DWORD PTR _?nbremise@?1??FicheRemise@@9@9
	shl	eax, 4
	push	eax
	mov	ecx, DWORD PTR _?remise@?1??FicheRemise@@9@9
	push	ecx
	call	_mem_realloc
	add	esp, 12					; 0000000cH
	mov	DWORD PTR _newdest$70340[ebp], eax
	cmp	DWORD PTR _newdest$70340[ebp], 0
	jne	SHORT $L70343
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29872], OFFSET FLAT:$SG70345
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 175		; 000000afH
	jmp	$eva_err$70346
$L70343:
	mov	ecx, DWORD PTR _newdest$70340[ebp]
	mov	DWORD PTR _?remise@?1??FicheRemise@@9@9, ecx
	mov	edx, DWORD PTR _?nbremise@?1??FicheRemise@@9@9
	add	edx, 1
	mov	DWORD PTR _?nbremise@?1??FicheRemise@@9@9, edx

; 176  : 		r = remise + nbremise - 1;

	mov	eax, DWORD PTR _?nbremise@?1??FicheRemise@@9@9
	shl	eax, 4
	mov	ecx, DWORD PTR _?remise@?1??FicheRemise@@9@9
	lea	edx, DWORD PTR [ecx+eax-16]
	mov	DWORD PTR _r$[ebp], edx

; 177  : 		memset(r, 0, sizeof(r[0]));

	push	16					; 00000010H
	push	0
	mov	eax, DWORD PTR _r$[ebp]
	push	eax
	call	_memset
	add	esp, 12					; 0000000cH

; 178  : 		r->id = id;

	mov	ecx, DWORD PTR _r$[ebp]
	mov	edx, DWORD PTR _id$[ebp]
	mov	DWORD PTR [ecx], edx

; 179  : 
; 180  : 		/* Lecture fiche remise */
; 181  : 		if(qry_obj_field(cntxt, &data, id, "MODE_REMISE,QTE,MONTANT,REMISE,MARGE,ARRONDI_REMISE")) STACK_ERROR;

	push	OFFSET FLAT:$SG70349
	mov	eax, DWORD PTR _id$[ebp]
	push	eax
	lea	ecx, DWORD PTR _data$[ebp]
	push	ecx
	mov	edx, DWORD PTR _cntxt$[ebp]
	push	edx
	call	_qry_obj_field
	add	esp, 16					; 00000010H
	test	eax, eax
	je	SHORT $L70348
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 181		; 000000b5H
	jmp	$eva_err$70346
$L70348:

; 182  : 		mode = dyntab_field_val(&data, "MODE_REMISE", ~0UL, 0);

	push	0
	push	-1
	push	OFFSET FLAT:$SG70350
	lea	ecx, DWORD PTR _data$[ebp]
	push	ecx
	call	_dyntab_field_val
	add	esp, 16					; 00000010H
	mov	DWORD PTR _mode$[ebp], eax

; 183  : 		if(dyntab_filter_field(&tab, 0, &data, "REMISE", ~0UL, NULL)) RETURN_ERR_MEMORY;

	push	0
	push	-1
	push	OFFSET FLAT:$SG70353
	lea	edx, DWORD PTR _data$[ebp]
	push	edx
	push	0
	lea	eax, DWORD PTR _tab$[ebp]
	push	eax
	call	_dyntab_filter_field
	add	esp, 24					; 00000018H
	test	eax, eax
	je	SHORT $L70352
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29872], OFFSET FLAT:$SG70355
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 183		; 000000b7H
	jmp	$eva_err$70346
$L70352:

; 184  : 
; 185  : 		/* Traitement selon type de remise */
; 186  : 		if(!*mode || !strcmp(mode, "Fixe"))

	mov	eax, DWORD PTR _mode$[ebp]
	movsx	ecx, BYTE PTR [eax]
	test	ecx, ecx
	je	SHORT $L70357
	push	OFFSET FLAT:$SG70358
	mov	edx, DWORD PTR _mode$[ebp]
	push	edx
	call	_strcmp
	add	esp, 8
	test	eax, eax
	jne	$L70356
$L70357:

; 188  : 			r->mode = RFix;

	mov	eax, DWORD PTR _r$[ebp]
	mov	DWORD PTR [eax+4], 3

; 189  : 			r->nbr = 1;

	mov	ecx, DWORD PTR _r$[ebp]
	mov	DWORD PTR [ecx+12], 1

; 190  : 			M_ALLOC(r->r, sizeof(r->r[0]));

	mov	DWORD PTR _size1$70359[ebp], 24		; 00000018H
	mov	edx, DWORD PTR _size1$70359[ebp]
	push	edx
	call	_mem_alloc
	add	esp, 4
	mov	ecx, DWORD PTR _r$[ebp]
	mov	DWORD PTR [ecx+8], eax
	cmp	DWORD PTR _size1$70359[ebp], 0
	je	SHORT $L70360
	mov	edx, DWORD PTR _r$[ebp]
	cmp	DWORD PTR [edx+8], 0
	jne	SHORT $L70360
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29872], OFFSET FLAT:$SG70362
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 190		; 000000beH
	jmp	$eva_err$70346
$L70360:

; 191  : 			r->r->pc = atof(dyntab_val(&tab, 0, 0));

	push	0
	push	0
	lea	edx, DWORD PTR _tab$[ebp]
	push	edx
	call	_dyntab_val
	add	esp, 12					; 0000000cH
	push	eax
	call	_atof
	add	esp, 4
	mov	eax, DWORD PTR _r$[ebp]
	mov	ecx, DWORD PTR [eax+8]
	fstp	QWORD PTR [ecx+16]

; 193  : 		else if(!strcmp(mode, "Marge"))

	jmp	$L70374
$L70356:
	push	OFFSET FLAT:$SG70366
	mov	edx, DWORD PTR _mode$[ebp]
	push	edx
	call	_strcmp
	add	esp, 8
	test	eax, eax
	jne	$L70365

; 195  : 			r->mode = RMarge;

	mov	eax, DWORD PTR _r$[ebp]
	mov	DWORD PTR [eax+4], 4

; 196  : 			r->nbr = 1;

	mov	ecx, DWORD PTR _r$[ebp]
	mov	DWORD PTR [ecx+12], 1

; 197  : 			M_ALLOC(r->r, sizeof(r->r[0]));

	mov	DWORD PTR _size1$70367[ebp], 24		; 00000018H
	mov	edx, DWORD PTR _size1$70367[ebp]
	push	edx
	call	_mem_alloc
	add	esp, 4
	mov	ecx, DWORD PTR _r$[ebp]
	mov	DWORD PTR [ecx+8], eax
	cmp	DWORD PTR _size1$70367[ebp], 0
	je	SHORT $L70368
	mov	edx, DWORD PTR _r$[ebp]
	cmp	DWORD PTR [edx+8], 0
	jne	SHORT $L70368
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29872], OFFSET FLAT:$SG70370
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 197		; 000000c5H
	jmp	$eva_err$70346
$L70368:

; 198  : 			r->r->pc = atof(dyntab_field_val(&data, "MARGE", ~0UL, 0));

	push	0
	push	-1
	push	OFFSET FLAT:$SG70372
	lea	edx, DWORD PTR _data$[ebp]
	push	edx
	call	_dyntab_field_val
	add	esp, 16					; 00000010H
	push	eax
	call	_atof
	add	esp, 4
	mov	eax, DWORD PTR _r$[ebp]
	mov	ecx, DWORD PTR [eax+8]
	fstp	QWORD PTR [ecx+16]

; 199  : 			r->r->mont = atof(dyntab_field_val(&data, "ARRONDI_REMISE", ~0UL, 0));

	push	0
	push	-1
	push	OFFSET FLAT:$SG70373
	lea	edx, DWORD PTR _data$[ebp]
	push	edx
	call	_dyntab_field_val
	add	esp, 16					; 00000010H
	push	eax
	call	_atof
	add	esp, 4
	mov	eax, DWORD PTR _r$[ebp]
	mov	ecx, DWORD PTR [eax+8]
	fstp	QWORD PTR [ecx+8]

; 201  : 		else

	jmp	$L70374
$L70365:

; 203  : 			/* Remise par montant ou quantité */
; 204  : 			char *fld = "QTE";

	mov	DWORD PTR _fld$70375[ebp], OFFSET FLAT:$SG70376

; 205  : 			r->mode = RQte;

	mov	edx, DWORD PTR _r$[ebp]
	mov	DWORD PTR [edx+4], 0

; 206  : 			M_ALLOC(r->r, sizeof(r->r[0]) * tab.nbrows);

	mov	eax, DWORD PTR _tab$[ebp]
	imul	eax, 24					; 00000018H
	mov	DWORD PTR _size1$70377[ebp], eax
	mov	ecx, DWORD PTR _size1$70377[ebp]
	push	ecx
	call	_mem_alloc
	add	esp, 4
	mov	edx, DWORD PTR _r$[ebp]
	mov	DWORD PTR [edx+8], eax
	cmp	DWORD PTR _size1$70377[ebp], 0
	je	SHORT $L70378
	mov	eax, DWORD PTR _r$[ebp]
	cmp	DWORD PTR [eax+8], 0
	jne	SHORT $L70378
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29872], OFFSET FLAT:$SG70380
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 206		; 000000ceH
	jmp	$eva_err$70346
$L70378:

; 207  : 			r->nbr = tab.nbrows;

	mov	eax, DWORD PTR _r$[ebp]
	mov	ecx, DWORD PTR _tab$[ebp]
	mov	DWORD PTR [eax+12], ecx

; 208  : 			for(i = 0; i < tab.nbrows; i++)

	mov	DWORD PTR _i$[ebp], 0
	jmp	SHORT $L70382
$L70383:
	mov	edx, DWORD PTR _i$[ebp]
	add	edx, 1
	mov	DWORD PTR _i$[ebp], edx
$L70382:
	mov	eax, DWORD PTR _i$[ebp]
	cmp	eax, DWORD PTR _tab$[ebp]
	jae	SHORT $L70384

; 209  : 					r->r[i].pc = atof(dyntab_val(&tab, i, 0));

	push	0
	mov	ecx, DWORD PTR _i$[ebp]
	push	ecx
	lea	edx, DWORD PTR _tab$[ebp]
	push	edx
	call	_dyntab_val
	add	esp, 12					; 0000000cH
	push	eax
	call	_atof
	add	esp, 4
	mov	eax, DWORD PTR _i$[ebp]
	imul	eax, 24					; 00000018H
	mov	ecx, DWORD PTR _r$[ebp]
	mov	edx, DWORD PTR [ecx+8]
	fstp	QWORD PTR [edx+eax+16]
	jmp	SHORT $L70383
$L70384:

; 210  : 
; 211  : 			/* Lecture du mode de remise */
; 212  : 			if(!strcmp(mode, "Quantité cumulée"))

	push	OFFSET FLAT:$SG70386
	mov	eax, DWORD PTR _mode$[ebp]
	push	eax
	call	_strcmp
	add	esp, 8
	test	eax, eax
	jne	SHORT $L70385

; 213  : 				r->mode = RQteCum;

	mov	ecx, DWORD PTR _r$[ebp]
	mov	DWORD PTR [ecx+4], 1

; 214  : 			else if(!strcmp(mode, "Montant"))

	jmp	SHORT $L70388
$L70385:
	push	OFFSET FLAT:$SG70389
	mov	edx, DWORD PTR _mode$[ebp]
	push	edx
	call	_strcmp
	add	esp, 8
	test	eax, eax
	jne	SHORT $L70388

; 216  : 				r->mode = RMont;

	mov	eax, DWORD PTR _r$[ebp]
	mov	DWORD PTR [eax+4], 2

; 217  : 				fld = "MONTANT";

	mov	DWORD PTR _fld$70375[ebp], OFFSET FLAT:$SG70390
$L70388:

; 219  : 
; 220  : 			/* Lecture du tableau des quantites / montants */
; 221  : 			tab.nbrows = 0;

	mov	DWORD PTR _tab$[ebp], 0

; 222  : 			if(dyntab_filter_field(&tab, 0, &data, fld, ~0UL, 0)) RETURN_ERR_MEMORY;

	push	0
	push	-1
	mov	ecx, DWORD PTR _fld$70375[ebp]
	push	ecx
	lea	edx, DWORD PTR _data$[ebp]
	push	edx
	push	0
	lea	eax, DWORD PTR _tab$[ebp]
	push	eax
	call	_dyntab_filter_field
	add	esp, 24					; 00000018H
	test	eax, eax
	je	SHORT $L70391
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29872], OFFSET FLAT:$SG70393
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 222		; 000000deH
	jmp	$eva_err$70346
$L70391:

; 223  : 			for(i = 0; i < tab.nbrows; i++)

	mov	DWORD PTR _i$[ebp], 0
	jmp	SHORT $L70394
$L70395:
	mov	eax, DWORD PTR _i$[ebp]
	add	eax, 1
	mov	DWORD PTR _i$[ebp], eax
$L70394:
	mov	ecx, DWORD PTR _i$[ebp]
	cmp	ecx, DWORD PTR _tab$[ebp]
	jae	SHORT $L70396

; 225  : 				struct _remtab *t = r->r + i;

	mov	edx, DWORD PTR _i$[ebp]
	imul	edx, 24					; 00000018H
	mov	eax, DWORD PTR _r$[ebp]
	mov	ecx, DWORD PTR [eax+8]
	add	ecx, edx
	mov	DWORD PTR _t$70397[ebp], ecx

; 226  : 				char *v = dyntab_val(&tab, i, 0);

	push	0
	mov	edx, DWORD PTR _i$[ebp]
	push	edx
	lea	eax, DWORD PTR _tab$[ebp]
	push	eax
	call	_dyntab_val
	add	esp, 12					; 0000000cH
	mov	DWORD PTR _v$70398[ebp], eax

; 227  : 				if(r->mode == RMont)

	mov	ecx, DWORD PTR _r$[ebp]
	cmp	DWORD PTR [ecx+4], 2
	jne	SHORT $L70399

; 228  : 					t->mont = atof(v);

	mov	edx, DWORD PTR _v$70398[ebp]
	push	edx
	call	_atof
	add	esp, 4
	mov	eax, DWORD PTR _t$70397[ebp]
	fstp	QWORD PTR [eax+8]

; 229  : 				else

	jmp	SHORT $L70400
$L70399:

; 230  : 					t->qte = strtoul(v, NULL, 10);

	push	10					; 0000000aH
	push	0
	mov	ecx, DWORD PTR _v$70398[ebp]
	push	ecx
	call	_strtoul
	add	esp, 12					; 0000000cH
	mov	edx, DWORD PTR _t$70397[ebp]
	mov	DWORD PTR [edx], eax
$L70400:

; 231  : 			}

	jmp	SHORT $L70395
$L70396:

; 232  : 
; 233  : 			/* Tri du tableau par quantites / montants */
; 234  : 			qsort(r->r, r->nbr, sizeof(r->r[0]), qsort_remise);

	push	OFFSET FLAT:_qsort_remise
	push	24					; 00000018H
	mov	eax, DWORD PTR _r$[ebp]
	mov	ecx, DWORD PTR [eax+12]
	push	ecx
	mov	edx, DWORD PTR _r$[ebp]
	mov	eax, DWORD PTR [edx+8]
	push	eax
	call	_qsort
	add	esp, 16					; 00000010H
$L70374:

; 237  : 	*res = r;

	mov	ecx, DWORD PTR _res$[ebp]
	mov	edx, DWORD PTR _r$[ebp]
	mov	DWORD PTR [ecx], edx
$eva_noerr$70334:

; 238  : 
; 239  : 	RETURN_OK_CLEANUP;

	push	0
	push	OFFSET FLAT:$SG70402
	push	OFFSET FLAT:$SG70403
	mov	eax, DWORD PTR _cntxt$[ebp]
	push	eax
	call	_err_clear
	add	esp, 16					; 00000010H
$eva_err$70346:
	mov	ecx, DWORD PTR _cntxt$[ebp]
	cmp	DWORD PTR [ecx+29872], 0
	je	SHORT $L70404
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	eax, DWORD PTR [edx+29900]
	push	eax
	push	OFFSET FLAT:$SG70405
	push	OFFSET FLAT:$SG70406
	mov	ecx, DWORD PTR _cntxt$[ebp]
	push	ecx
	call	_err_add_context
	add	esp, 16					; 00000010H
$L70404:
	lea	edx, DWORD PTR _data$[ebp]
	push	edx
	call	_dyntab_free
	add	esp, 4
	lea	eax, DWORD PTR _tab$[ebp]
	push	eax
	call	_dyntab_free
	add	esp, 4
	mov	ecx, DWORD PTR _cntxt$[ebp]
	xor	eax, eax
	cmp	DWORD PTR [ecx+29872], 0
	setne	al

; 240  : }

	mov	esp, ebp
	pop	ebp
	ret	0
_FicheRemise ENDP
_TEXT	ENDS
PUBLIC	_AjoutPrix
_DATA	SEGMENT
$SG70434 DB	'Plancher', 00H
	ORG $+3
$SG70440 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70443 DB	'D:\Travail\ABI\EVA\V4.0\CGI\Brunix-2016\dll_fap.c', 00H
	ORG $+2
$SG70444 DB	'AjoutPrix', 00H
	ORG $+2
$SG70446 DB	'D:\Travail\ABI\EVA\V4.0\CGI\Brunix-2016\dll_fap.c', 00H
	ORG $+2
$SG70447 DB	'AjoutPrix', 00H
_DATA	ENDS
_TEXT	SEGMENT
_cx$ = 8
_p$ = 12
_id$ = 16
_qte$ = 20
_mont$ = 24
_pcrem$ = 32
_meth$ = 40
_opt$ = 44
_cntxt$ = -8
_t$ = -4
_newdest$70435 = -12
_AjoutPrix PROC NEAR

; 261  : ){

	push	ebp
	mov	ebp, esp
	sub	esp, 16					; 00000010H

; 262  : 	EVA_context *cntxt = cx->cntxt;

	mov	eax, DWORD PTR _cx$[ebp]
	mov	ecx, DWORD PTR [eax]
	mov	DWORD PTR _cntxt$[ebp], ecx

; 263  : 	Prix *t;
; 264  : 	if(!p || !pcrem) RETURN_OK;

	cmp	DWORD PTR _p$[ebp], 0
	je	SHORT $L70431
	fld	QWORD PTR _pcrem$[ebp]
	fcomp	QWORD PTR __real@8@00000000000000000000
	fnstsw	ax
	test	ah, 64					; 00000040H
	je	SHORT $L70430
$L70431:
	jmp	$eva_noerr$70432
$L70430:

; 265  : 
; 266  : 	/* Selection plancher de marge si necessaire */
; 267  : 	if(p->pc_max && pcrem > p->pc_max && (opt & 1))

	mov	edx, DWORD PTR _p$[ebp]
	fld	QWORD PTR [edx+72]
	fcomp	QWORD PTR __real@8@00000000000000000000
	fnstsw	ax
	test	ah, 64					; 00000040H
	jne	SHORT $L70433
	mov	eax, DWORD PTR _p$[ebp]
	fld	QWORD PTR _pcrem$[ebp]
	fcomp	QWORD PTR [eax+72]
	fnstsw	ax
	test	ah, 65					; 00000041H
	jne	SHORT $L70433
	mov	ecx, DWORD PTR _opt$[ebp]
	and	ecx, 1
	test	ecx, ecx
	je	SHORT $L70433

; 269  : 		pcrem = p->pc_max;

	mov	edx, DWORD PTR _p$[ebp]
	mov	eax, DWORD PTR [edx+72]
	mov	DWORD PTR _pcrem$[ebp], eax
	mov	ecx, DWORD PTR [edx+76]
	mov	DWORD PTR _pcrem$[ebp+4], ecx

; 270  : 		meth = "Plancher";

	mov	DWORD PTR _meth$[ebp], OFFSET FLAT:$SG70434
$L70433:

; 272  : 
; 273  : 	/* Ajoute le prix au buffer */
; 274  : 	M_REALLOC(Prix, p->tabprix, p->nbprix);

	push	64					; 00000040H
	mov	edx, DWORD PTR _p$[ebp]
	mov	eax, DWORD PTR [edx+144]
	shl	eax, 5
	push	eax
	mov	ecx, DWORD PTR _p$[ebp]
	mov	edx, DWORD PTR [ecx+140]
	push	edx
	call	_mem_realloc
	add	esp, 12					; 0000000cH
	mov	DWORD PTR _newdest$70435[ebp], eax
	cmp	DWORD PTR _newdest$70435[ebp], 0
	jne	SHORT $L70438
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29872], OFFSET FLAT:$SG70440
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 274		; 00000112H
	jmp	$eva_err$70441
$L70438:
	mov	edx, DWORD PTR _p$[ebp]
	mov	eax, DWORD PTR _newdest$70435[ebp]
	mov	DWORD PTR [edx+140], eax
	mov	ecx, DWORD PTR _p$[ebp]
	mov	edx, DWORD PTR [ecx+144]
	add	edx, 1
	mov	eax, DWORD PTR _p$[ebp]
	mov	DWORD PTR [eax+144], edx

; 275  : 	t = p->tabprix + p->nbprix - 1;

	mov	ecx, DWORD PTR _p$[ebp]
	mov	edx, DWORD PTR [ecx+144]
	shl	edx, 5
	mov	eax, DWORD PTR _p$[ebp]
	mov	ecx, DWORD PTR [eax+140]
	lea	edx, DWORD PTR [ecx+edx-32]
	mov	DWORD PTR _t$[ebp], edx

; 276  : 	t->idrem = id;

	mov	eax, DWORD PTR _t$[ebp]
	mov	ecx, DWORD PTR _id$[ebp]
	mov	DWORD PTR [eax], ecx

; 277  : 	t->qte = qte > 0 ? qte : 1;

	cmp	DWORD PTR _qte$[ebp], 0
	jle	SHORT $L71311
	mov	edx, DWORD PTR _qte$[ebp]
	mov	DWORD PTR -16+[ebp], edx
	jmp	SHORT $L71312
$L71311:
	mov	DWORD PTR -16+[ebp], 1
$L71312:
	mov	eax, DWORD PTR _t$[ebp]
	mov	ecx, DWORD PTR -16+[ebp]
	mov	DWORD PTR [eax+4], ecx

; 278  : 	t->mont = mont;

	mov	edx, DWORD PTR _t$[ebp]
	mov	eax, DWORD PTR _mont$[ebp]
	mov	DWORD PTR [edx+8], eax
	mov	ecx, DWORD PTR _mont$[ebp+4]
	mov	DWORD PTR [edx+12], ecx

; 279  : 	t->pcrem = pcrem;

	mov	edx, DWORD PTR _t$[ebp]
	mov	eax, DWORD PTR _pcrem$[ebp]
	mov	DWORD PTR [edx+16], eax
	mov	ecx, DWORD PTR _pcrem$[ebp+4]
	mov	DWORD PTR [edx+20], ecx

; 280  : 	t->meth = meth;

	mov	edx, DWORD PTR _t$[ebp]
	mov	eax, DWORD PTR _meth$[ebp]
	mov	DWORD PTR [edx+24], eax

; 281  : 	t->b_sel = (opt & 2) ? 1 : 0;

	mov	ecx, DWORD PTR _opt$[ebp]
	and	ecx, 2
	neg	ecx
	sbb	ecx, ecx
	neg	ecx
	mov	edx, DWORD PTR _t$[ebp]
	mov	DWORD PTR [edx+28], ecx
$eva_noerr$70432:

; 282  : 
; 283  : 	RETURN_OK_CLEANUP;

	push	0
	push	OFFSET FLAT:$SG70443
	push	OFFSET FLAT:$SG70444
	mov	eax, DWORD PTR _cntxt$[ebp]
	push	eax
	call	_err_clear
	add	esp, 16					; 00000010H
$eva_err$70441:
	mov	ecx, DWORD PTR _cntxt$[ebp]
	cmp	DWORD PTR [ecx+29872], 0
	je	SHORT $L70445
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	eax, DWORD PTR [edx+29900]
	push	eax
	push	OFFSET FLAT:$SG70446
	push	OFFSET FLAT:$SG70447
	mov	ecx, DWORD PTR _cntxt$[ebp]
	push	ecx
	call	_err_add_context
	add	esp, 16					; 00000010H
$L70445:
	mov	edx, DWORD PTR _cntxt$[ebp]
	xor	eax, eax
	cmp	DWORD PTR [edx+29872], 0
	setne	al

; 284  : }

	mov	esp, ebp
	pop	ebp
	ret	0
_AjoutPrix ENDP
_TEXT	ENDS
PUBLIC	__real@8@4005c800000000000000
PUBLIC	__real@8@3fff8000000000000000
PUBLIC	__real@8@3ff583126e978d4fe000
PUBLIC	__real@8@3ffe8000000000000000
PUBLIC	_TabPrix
EXTRN	__snprintf:NEAR
EXTRN	_mem_free:NEAR
EXTRN	_dynbuf_add:NEAR
EXTRN	_dynbuf_add_int:NEAR
EXTRN	_dynbuf_add3:NEAR
EXTRN	_dynbuf_add3_int:NEAR
EXTRN	__ftol:NEAR
EXTRN	_dyntab_sz:NEAR
EXTRN	_dyntab_add:NEAR
_BSS	SEGMENT
$SG70578 DB	01H DUP (?)
_BSS	ENDS
_DATA	SEGMENT
	ORG $+2
$SG70471 DB	'</td><td align=center>%</td><td>Remise</td></tr><tr', 00H
$SG70472 DB	'TTC', 00H
$SG70473 DB	'HT', 00H
	ORG $+1
$SG70474 DB	'<table class=TabPrix cellspacing=0><tr bgcolor=#FFAAAA><'
	DB	'td align=center>Qt', 0e9H, '</td><td align=right><nobr>Prix <'
	DB	'b>&euro;', 00H
	ORG $+3
$SG70476 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70481 DB	' bgcolor=#FFFFAA', 00H
	ORG $+3
$SG70483 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70486 DB	'</td><td align=center>-</td>', 00H
	ORG $+3
$SG70487 DB	'%.2lf', 00H
	ORG $+2
$SG70488 DB	'><td align=center>-</td><td align=right><b>', 00H
$SG70490 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70493 DB	'</td></tr>', 00H
	ORG $+1
$SG70494 DB	'<b>Prix Net</b>', 00H
$SG70495 DB	'Prix public', 00H
$SG70496 DB	'<td><font size=-2><nobr>', 00H
	ORG $+3
$SG70498 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70506 DB	'<tr bgcolor=#FFFFAA>', 00H
	ORG $+3
$SG70508 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70512 DB	'<tr>', 00H
	ORG $+3
$SG70514 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70517 DB	'<td align=center>', 00H
	ORG $+2
$SG70519 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70523 DB	'&euro;</i></font>', 00H
	ORG $+2
$SG70524 DB	'<font size=-1><i>', 00H
	ORG $+2
$SG70526 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70530 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70533 DB	'</td><td align=right><b>', 00H
	ORG $+3
$SG70535 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70538 DB	'%.2lf', 00H
	ORG $+2
$SG70540 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70543 DB	'%</td><td><font size=-2>', 00H
	ORG $+3
$SG70544 DB	'%.0f', 00H
	ORG $+3
$SG70545 DB	'</td><td align=center><nobr>-', 00H
	ORG $+2
$SG70547 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70549 DB	'Plancher', 00H
	ORG $+3
$SG70552 DB	'<b>Plancher', 00H
$SG70554 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70558 DB	'Client', 00H
	ORG $+1
$SG70559 DB	'CatClient', 00H
	ORG $+2
$SG70561 DB	',0,', 00H
$SG70562 DB	'<a href=javascript:ol(', 00H
	ORG $+1
$SG70564 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70568 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70571 DB	') title="Affiche votre compte client">', 00H
	ORG $+1
$SG70572 DB	',', 00H
	ORG $+2
$SG70574 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70577 DB	'</a>', 00H
	ORG $+3
$SG70580 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70583 DB	',0', 00H
	ORG $+1
$SG70584 DB	'<a href=javascript:ol(', 00H
	ORG $+1
$SG70586 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70589 DB	',', 00H
	ORG $+2
$SG70590 DB	',', 00H
	ORG $+2
$SG70592 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70596 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70599 DB	'</a>', 00H
	ORG $+3
$SG70600 DB	') title="+ d''infos sur la remise">', 00H
	ORG $+1
$SG70602 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70605 DB	'</td></tr>', 00H
	ORG $+1
$SG70607 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70610 DB	'</td></tr>', 00H
	ORG $+1
$SG70611 DB	'TTC', 00H
$SG70612 DB	'HT', 00H
	ORG $+1
$SG70613 DB	'<tr><td colspan=4 bgcolor=#DDDDDD align=right>Total <b>&'
	DB	'euro; ', 00H
	ORG $+1
$SG70615 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70617 DB	'</td><td align=right><b>', 00H
	ORG $+3
$SG70618 DB	'<tr><td align=center>', 00H
	ORG $+2
$SG70620 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70623 DB	'%.2lf', 00H
	ORG $+2
$SG70625 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70628 DB	'</font>', 00H
$SG70629 DB	'%.2f', 00H
	ORG $+3
$SG70630 DB	'</td><td colspan=2 align=right><b><font size=+0><nobr>', 00H
	ORG $+1
$SG70632 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70635 DB	'</td></tr></table>', 00H
	ORG $+1
$SG70637 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70642 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70648 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70649 DB	'D:\Travail\ABI\EVA\V4.0\CGI\Brunix-2016\dll_fap.c', 00H
	ORG $+2
$SG70650 DB	'TabPrix', 00H
$SG70652 DB	'D:\Travail\ABI\EVA\V4.0\CGI\Brunix-2016\dll_fap.c', 00H
	ORG $+2
$SG70653 DB	'TabPrix', 00H
_DATA	ENDS
;	COMDAT __real@8@4005c800000000000000
; File D:\Travail\ABI\EVA\V4.0\CGI\Brunix-2016\dll_fap.c
CONST	SEGMENT
__real@8@4005c800000000000000 DQ 04059000000000000r ; 100
CONST	ENDS
;	COMDAT __real@8@3fff8000000000000000
CONST	SEGMENT
__real@8@3fff8000000000000000 DQ 03ff0000000000000r ; 1
CONST	ENDS
;	COMDAT __real@8@3ff583126e978d4fe000
CONST	SEGMENT
__real@8@3ff583126e978d4fe000 DQ 03f50624dd2f1a9fcr ; 0.001
CONST	ENDS
;	COMDAT __real@8@3ffe8000000000000000
CONST	SEGMENT
__real@8@3ffe8000000000000000 DQ 03fe0000000000000r ; 0.5
CONST	ENDS
_TEXT	SEGMENT
_cx$ = 8
_res$ = 12
_p$ = 16
_cntxt$ = -96
_form$ = -4
_buf$ = -8
_txtres$ = -72
_i$ = -84
_tva$ = -80
_pc$ = -92
_TabPrix PROC NEAR

; 298  : ){

	push	ebp
	mov	ebp, esp
	sub	esp, 132				; 00000084H
	push	edi

; 299  : 	EVA_context *cntxt = cx->cntxt;

	mov	eax, DWORD PTR _cx$[ebp]
	mov	ecx, DWORD PTR [eax]
	mov	DWORD PTR _cntxt$[ebp], ecx

; 300  : 	EVA_form *form = cntxt->form;

	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	eax, DWORD PTR [edx+80]
	mov	DWORD PTR _form$[ebp], eax

; 301  : 	DynBuffer *buf = NULL;

	mov	DWORD PTR _buf$[ebp], 0

; 302  : 	char txtres[64] = {0};

	mov	BYTE PTR _txtres$[ebp], 0
	mov	ecx, 15					; 0000000fH
	xor	eax, eax
	lea	edi, DWORD PTR _txtres$[ebp+1]
	rep stosd
	stosw
	stosb

; 303  : 	unsigned long i = 0;

	mov	DWORD PTR _i$[ebp], 0

; 304  : 	double tva = cx->b_usrttc ? cx->txTVA : 0;

	mov	ecx, DWORD PTR _cx$[ebp]
	cmp	DWORD PTR [ecx+24], 0
	je	SHORT $L71314
	mov	edx, DWORD PTR _cx$[ebp]
	mov	eax, DWORD PTR [edx+184]
	mov	DWORD PTR -104+[ebp], eax
	mov	ecx, DWORD PTR [edx+188]
	mov	DWORD PTR -104+[ebp+4], ecx
	jmp	SHORT $L71315
$L71314:
	mov	DWORD PTR -104+[ebp], 0
	mov	DWORD PTR -104+[ebp+4], 0
$L71315:
	mov	edx, DWORD PTR -104+[ebp]
	mov	DWORD PTR _tva$[ebp], edx
	mov	eax, DWORD PTR -104+[ebp+4]
	mov	DWORD PTR _tva$[ebp+4], eax

; 305  : 	double pc = 0;

	mov	DWORD PTR _pc$[ebp], 0
	mov	DWORD PTR _pc$[ebp+4], 0

; 306  : 	if(!p->pxpub) RETURN_OK;

	mov	ecx, DWORD PTR _p$[ebp]
	fld	QWORD PTR [ecx+16]
	fcomp	QWORD PTR __real@8@00000000000000000000
	fnstsw	ax
	test	ah, 64					; 00000040H
	je	SHORT $L70467
	jmp	$eva_noerr$70468
$L70467:

; 310  : 					"<td align=center>Qté</td>"
; 311  : 					"<td align=right><nobr>Prix <b>&euro;", tva ? "TTC" : "HT", 0, NO_CONV, "</td>"
; 312  : 					"<td align=center>%</td>"
; 313  : 					"<td>Remise</td></tr><tr");

	fld	QWORD PTR _tva$[ebp]
	fcomp	QWORD PTR __real@8@00000000000000000000
	fnstsw	ax
	test	ah, 64					; 00000040H
	jne	SHORT $L71316
	mov	DWORD PTR -108+[ebp], OFFSET FLAT:$SG70472
	jmp	SHORT $L71317
$L71316:
	mov	DWORD PTR -108+[ebp], OFFSET FLAT:$SG70473
$L71317:
	push	51					; 00000033H
	push	OFFSET FLAT:$SG70471
	push	0
	push	0
	push	0
	mov	edx, DWORD PTR -108+[ebp]
	push	edx
	push	116					; 00000074H
	push	OFFSET FLAT:$SG70474
	lea	eax, DWORD PTR _buf$[ebp]
	push	eax
	call	_dynbuf_add3
	add	esp, 36					; 00000024H
	test	eax, eax
	je	SHORT $L70470
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29872], OFFSET FLAT:$SG70476
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 313		; 00000139H
	jmp	$eva_err$70477
$L70470:

; 314  : 
; 315  : 	/* Ligne prix public */
; 316  : 	if(!p->pcrem)

	mov	eax, DWORD PTR _p$[ebp]
	fld	QWORD PTR [eax+40]
	fcomp	QWORD PTR __real@8@00000000000000000000
	fnstsw	ax
	test	ah, 64					; 00000040H
	je	SHORT $L70480

; 317  : 		DYNBUF_ADD_STR(&buf, " bgcolor=#FFFFAA")

	push	0
	push	0
	push	16					; 00000010H
	push	OFFSET FLAT:$SG70481
	lea	ecx, DWORD PTR _buf$[ebp]
	push	ecx
	call	_dynbuf_add
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L70480
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29872], OFFSET FLAT:$SG70483
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 317		; 0000013dH
	jmp	$eva_err$70477
$L70480:

; 319  : 					"<td align=right><b>", txtres, snprintf(add_sz_str(txtres), "%.2lf", p->pxpub * (1. + tva / 100.)), NO_CONV, "</td>"
; 320  : 					"<td align=center>-</td>");

	push	28					; 0000001cH
	push	OFFSET FLAT:$SG70486
	push	0
	push	0
	mov	ecx, DWORD PTR _p$[ebp]
	fld	QWORD PTR _tva$[ebp]
	fdiv	QWORD PTR __real@8@4005c800000000000000
	fadd	QWORD PTR __real@8@3fff8000000000000000
	fmul	QWORD PTR [ecx+16]
	sub	esp, 8
	fstp	QWORD PTR [esp]
	push	OFFSET FLAT:$SG70487
	push	63					; 0000003fH
	lea	edx, DWORD PTR _txtres$[ebp]
	push	edx
	call	__snprintf
	add	esp, 20					; 00000014H
	push	eax
	lea	eax, DWORD PTR _txtres$[ebp]
	push	eax
	push	43					; 0000002bH
	push	OFFSET FLAT:$SG70488
	lea	ecx, DWORD PTR _buf$[ebp]
	push	ecx
	call	_dynbuf_add3
	add	esp, 36					; 00000024H
	test	eax, eax
	je	SHORT $L70485
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29872], OFFSET FLAT:$SG70490
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 320		; 00000140H
	jmp	$eva_err$70477
$L70485:

; 321  : 	DYNBUF_ADD3(&buf, "<td><font size=-2><nobr>", !p->nbprix ? "<b>Prix Net</b>" : "Prix public", 0, NO_CONV, "</td></tr>");

	mov	ecx, DWORD PTR _p$[ebp]
	cmp	DWORD PTR [ecx+144], 0
	jne	SHORT $L71318
	mov	DWORD PTR -112+[ebp], OFFSET FLAT:$SG70494
	jmp	SHORT $L71319
$L71318:
	mov	DWORD PTR -112+[ebp], OFFSET FLAT:$SG70495
$L71319:
	push	10					; 0000000aH
	push	OFFSET FLAT:$SG70493
	push	0
	push	0
	push	0
	mov	edx, DWORD PTR -112+[ebp]
	push	edx
	push	24					; 00000018H
	push	OFFSET FLAT:$SG70496
	lea	eax, DWORD PTR _buf$[ebp]
	push	eax
	call	_dynbuf_add3
	add	esp, 36					; 00000024H
	test	eax, eax
	je	SHORT $L70492
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29872], OFFSET FLAT:$SG70498
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 321		; 00000141H
	jmp	$eva_err$70477
$L70492:

; 322  : 
; 323  : 	/* Lignes remises par quantité */
; 324  : 	pc = p->pcrem - 0.001;

	mov	eax, DWORD PTR _p$[ebp]
	fld	QWORD PTR [eax+40]
	fsub	QWORD PTR __real@8@3ff583126e978d4fe000
	fstp	QWORD PTR _pc$[ebp]

; 325  : 	for(i = 0; i < p->nbprix; i++)

	mov	DWORD PTR _i$[ebp], 0
	jmp	SHORT $L70499
$L70500:
	mov	ecx, DWORD PTR _i$[ebp]
	add	ecx, 1
	mov	DWORD PTR _i$[ebp], ecx
$L70499:
	mov	edx, DWORD PTR _p$[ebp]
	mov	eax, DWORD PTR _i$[ebp]
	cmp	eax, DWORD PTR [edx+144]
	jae	$L70501

; 327  : 		if(p->tabprix[i].pcrem <= pc) continue;

	mov	ecx, DWORD PTR _i$[ebp]
	shl	ecx, 5
	mov	edx, DWORD PTR _p$[ebp]
	mov	eax, DWORD PTR [edx+140]
	fld	QWORD PTR [eax+ecx+16]
	fcomp	QWORD PTR _pc$[ebp]
	fnstsw	ax
	test	ah, 65					; 00000041H
	je	SHORT $L70502
	jmp	SHORT $L70500
$L70502:

; 328  : 		pc = p->tabprix[i].pcrem;

	mov	ecx, DWORD PTR _i$[ebp]
	shl	ecx, 5
	mov	edx, DWORD PTR _p$[ebp]
	mov	eax, DWORD PTR [edx+140]
	mov	edx, DWORD PTR [eax+ecx+16]
	mov	DWORD PTR _pc$[ebp], edx
	mov	eax, DWORD PTR [eax+ecx+20]
	mov	DWORD PTR _pc$[ebp+4], eax

; 329  : 		if(p->pcrem == pc)

	mov	ecx, DWORD PTR _p$[ebp]
	fld	QWORD PTR [ecx+40]
	fcomp	QWORD PTR _pc$[ebp]
	fnstsw	ax
	test	ah, 64					; 00000040H
	je	SHORT $L70503

; 330  : 			DYNBUF_ADD_STR(&buf, "<tr bgcolor=#FFFFAA>")

	push	0
	push	0
	push	20					; 00000014H
	push	OFFSET FLAT:$SG70506
	lea	edx, DWORD PTR _buf$[ebp]
	push	edx
	call	_dynbuf_add
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L70505
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29872], OFFSET FLAT:$SG70508
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 330		; 0000014aH
	jmp	$eva_err$70477
$L70505:

; 331  : 		else

	jmp	SHORT $L70511
$L70503:

; 332  : 			DYNBUF_ADD_STR(&buf, "<tr>");

	push	0
	push	0
	push	4
	push	OFFSET FLAT:$SG70512
	lea	edx, DWORD PTR _buf$[ebp]
	push	edx
	call	_dynbuf_add
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L70511
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29872], OFFSET FLAT:$SG70514
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 332		; 0000014cH
	jmp	$eva_err$70477
$L70511:

; 333  : 		DYNBUF_ADD_STR(&buf, "<td align=center>")

	push	0
	push	0
	push	17					; 00000011H
	push	OFFSET FLAT:$SG70517
	lea	edx, DWORD PTR _buf$[ebp]
	push	edx
	call	_dynbuf_add
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L70516
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29872], OFFSET FLAT:$SG70519
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 333		; 0000014dH
	jmp	$eva_err$70477
$L70516:

; 334  : 		if(p->tabprix[i].mont)

	mov	edx, DWORD PTR _i$[ebp]
	shl	edx, 5
	mov	eax, DWORD PTR _p$[ebp]
	mov	ecx, DWORD PTR [eax+140]
	fld	QWORD PTR [ecx+edx+8]
	fcomp	QWORD PTR __real@8@00000000000000000000
	fnstsw	ax
	test	ah, 64					; 00000040H
	jne	SHORT $L70520

; 336  : 			DYNBUF_ADD3_INT(&buf, "<font size=-1><i>", (int)(p->tabprix[i].mont + 0.5), "&euro;</i></font>");

	push	17					; 00000011H
	push	OFFSET FLAT:$SG70523
	mov	edx, DWORD PTR _i$[ebp]
	shl	edx, 5
	mov	eax, DWORD PTR _p$[ebp]
	mov	ecx, DWORD PTR [eax+140]
	fld	QWORD PTR [ecx+edx+8]
	fadd	QWORD PTR __real@8@3ffe8000000000000000
	call	__ftol
	push	eax
	push	17					; 00000011H
	push	OFFSET FLAT:$SG70524
	lea	edx, DWORD PTR _buf$[ebp]
	push	edx
	call	_dynbuf_add3_int
	add	esp, 24					; 00000018H
	test	eax, eax
	je	SHORT $L70522
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29872], OFFSET FLAT:$SG70526
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 336		; 00000150H
	jmp	$eva_err$70477
$L70522:

; 338  : 		else

	jmp	SHORT $L70528
$L70520:

; 340  : 			DYNBUF_ADD_INT(&buf, p->tabprix[i].qte);

	mov	edx, DWORD PTR _i$[ebp]
	shl	edx, 5
	mov	eax, DWORD PTR _p$[ebp]
	mov	ecx, DWORD PTR [eax+140]
	mov	edx, DWORD PTR [ecx+edx+4]
	push	edx
	lea	eax, DWORD PTR _buf$[ebp]
	push	eax
	call	_dynbuf_add_int
	add	esp, 8
	test	eax, eax
	je	SHORT $L70528
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29872], OFFSET FLAT:$SG70530
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 340		; 00000154H
	jmp	$eva_err$70477
$L70528:

; 342  : 		DYNBUF_ADD_STR(&buf, "</td><td align=right><b>")

	push	0
	push	0
	push	24					; 00000018H
	push	OFFSET FLAT:$SG70533
	lea	eax, DWORD PTR _buf$[ebp]
	push	eax
	call	_dynbuf_add
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L70532
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29872], OFFSET FLAT:$SG70535
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 342		; 00000156H
	jmp	$eva_err$70477
$L70532:

; 344  : 						(100. - p->tabprix[i].pcrem) * p->pxpub / 100. *
; 345  : 						(1. + tva / 100.)), NO_CONV);

	push	0
	push	0
	mov	eax, DWORD PTR _i$[ebp]
	shl	eax, 5
	mov	ecx, DWORD PTR _p$[ebp]
	mov	edx, DWORD PTR [ecx+140]
	fld	QWORD PTR __real@8@4005c800000000000000
	fsub	QWORD PTR [edx+eax+16]
	mov	eax, DWORD PTR _p$[ebp]
	fmul	QWORD PTR [eax+16]
	fdiv	QWORD PTR __real@8@4005c800000000000000
	fld	QWORD PTR _tva$[ebp]
	fdiv	QWORD PTR __real@8@4005c800000000000000
	fadd	QWORD PTR __real@8@3fff8000000000000000
	fmulp	ST(1), ST(0)
	sub	esp, 8
	fstp	QWORD PTR [esp]
	push	OFFSET FLAT:$SG70538
	push	63					; 0000003fH
	lea	ecx, DWORD PTR _txtres$[ebp]
	push	ecx
	call	__snprintf
	add	esp, 20					; 00000014H
	push	eax
	lea	edx, DWORD PTR _txtres$[ebp]
	push	edx
	lea	eax, DWORD PTR _buf$[ebp]
	push	eax
	call	_dynbuf_add
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L70537
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29872], OFFSET FLAT:$SG70540
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 345		; 00000159H
	jmp	$eva_err$70477
$L70537:

; 347  : 			"%</td><td><font size=-2>");

	push	24					; 00000018H
	push	OFFSET FLAT:$SG70543
	push	0
	push	0
	mov	eax, DWORD PTR _i$[ebp]
	shl	eax, 5
	mov	ecx, DWORD PTR _p$[ebp]
	mov	edx, DWORD PTR [ecx+140]
	mov	ecx, DWORD PTR [edx+eax+20]
	push	ecx
	mov	edx, DWORD PTR [edx+eax+16]
	push	edx
	push	OFFSET FLAT:$SG70544
	push	63					; 0000003fH
	lea	eax, DWORD PTR _txtres$[ebp]
	push	eax
	call	__snprintf
	add	esp, 20					; 00000014H
	push	eax
	lea	ecx, DWORD PTR _txtres$[ebp]
	push	ecx
	push	29					; 0000001dH
	push	OFFSET FLAT:$SG70545
	lea	edx, DWORD PTR _buf$[ebp]
	push	edx
	call	_dynbuf_add3
	add	esp, 36					; 00000024H
	test	eax, eax
	je	SHORT $L70542
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29872], OFFSET FLAT:$SG70547
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 347		; 0000015bH
	jmp	$eva_err$70477
$L70542:

; 348  : 		if(!strcmp(p->tabprix[i].meth, "Plancher"))

	push	OFFSET FLAT:$SG70549
	mov	edx, DWORD PTR _i$[ebp]
	shl	edx, 5
	mov	eax, DWORD PTR _p$[ebp]
	mov	ecx, DWORD PTR [eax+140]
	mov	edx, DWORD PTR [ecx+edx+24]
	push	edx
	call	_strcmp
	add	esp, 8
	test	eax, eax
	jne	SHORT $L70548

; 349  : 			DYNBUF_ADD_STR(&buf, "<b>Plancher")

	push	0
	push	0
	push	11					; 0000000bH
	push	OFFSET FLAT:$SG70552
	lea	eax, DWORD PTR _buf$[ebp]
	push	eax
	call	_dynbuf_add
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L70551
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29872], OFFSET FLAT:$SG70554
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 349		; 0000015dH
	jmp	$eva_err$70477
$L70551:

; 350  : 		else if(!strcmp(p->tabprix[i].meth, "Client") || !strcmp(p->tabprix[i].meth, "CatClient"))

	jmp	$L70598
$L70548:
	push	OFFSET FLAT:$SG70558
	mov	eax, DWORD PTR _i$[ebp]
	shl	eax, 5
	mov	ecx, DWORD PTR _p$[ebp]
	mov	edx, DWORD PTR [ecx+140]
	mov	eax, DWORD PTR [edx+eax+24]
	push	eax
	call	_strcmp
	add	esp, 8
	test	eax, eax
	je	SHORT $L70557
	push	OFFSET FLAT:$SG70559
	mov	ecx, DWORD PTR _i$[ebp]
	shl	ecx, 5
	mov	edx, DWORD PTR _p$[ebp]
	mov	eax, DWORD PTR [edx+140]
	mov	ecx, DWORD PTR [eax+ecx+24]
	push	ecx
	call	_strcmp
	add	esp, 8
	test	eax, eax
	jne	$L70556
$L70557:

; 352  : 			DYNBUF_ADD3_INT(&buf, "<a href=javascript:ol(", cx->iduser, ",0,");

	push	3
	push	OFFSET FLAT:$SG70561
	mov	edx, DWORD PTR _cx$[ebp]
	mov	eax, DWORD PTR [edx+12]
	push	eax
	push	22					; 00000016H
	push	OFFSET FLAT:$SG70562
	lea	ecx, DWORD PTR _buf$[ebp]
	push	ecx
	call	_dynbuf_add3_int
	add	esp, 24					; 00000018H
	test	eax, eax
	je	SHORT $L70560
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29872], OFFSET FLAT:$SG70564
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 352		; 00000160H
	jmp	$eva_err$70477
$L70560:

; 353  : 			DYNBUF_ADD_CELL(&buf, &form->id_form, 0, 0, NO_CONV);

	push	0
	push	0
	push	0
	push	0
	mov	ecx, DWORD PTR _form$[ebp]
	add	ecx, 12					; 0000000cH
	push	ecx
	call	_dyntab_sz
	add	esp, 12					; 0000000cH
	push	eax
	push	0
	push	0
	mov	edx, DWORD PTR _form$[ebp]
	add	edx, 12					; 0000000cH
	push	edx
	call	_dyntab_val
	add	esp, 12					; 0000000cH
	push	eax
	lea	eax, DWORD PTR _buf$[ebp]
	push	eax
	call	_dynbuf_add
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L70566
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29872], OFFSET FLAT:$SG70568
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 353		; 00000161H
	jmp	$eva_err$70477
$L70566:

; 354  : 			DYNBUF_ADD3_CELL(&buf, ",", &form->id_obj, 0, 0, NO_CONV, ") title=\"Affiche votre compte client\">");

	push	38					; 00000026H
	push	OFFSET FLAT:$SG70571
	push	0
	push	0
	push	0
	push	0
	mov	eax, DWORD PTR _form$[ebp]
	add	eax, 32					; 00000020H
	push	eax
	call	_dyntab_sz
	add	esp, 12					; 0000000cH
	push	eax
	push	0
	push	0
	mov	ecx, DWORD PTR _form$[ebp]
	add	ecx, 32					; 00000020H
	push	ecx
	call	_dyntab_val
	add	esp, 12					; 0000000cH
	push	eax
	push	1
	push	OFFSET FLAT:$SG70572
	lea	edx, DWORD PTR _buf$[ebp]
	push	edx
	call	_dynbuf_add3
	add	esp, 36					; 00000024H
	test	eax, eax
	je	SHORT $L70570
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29872], OFFSET FLAT:$SG70574
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 354		; 00000162H
	jmp	$eva_err$70477
$L70570:

; 355  : 			DYNBUF_ADD3(&buf, "", p->tabprix[i].meth, 0, NO_CONV, "</a>");

	push	4
	push	OFFSET FLAT:$SG70577
	push	0
	push	0
	push	0
	mov	edx, DWORD PTR _i$[ebp]
	shl	edx, 5
	mov	eax, DWORD PTR _p$[ebp]
	mov	ecx, DWORD PTR [eax+140]
	mov	edx, DWORD PTR [ecx+edx+24]
	push	edx
	push	0
	push	OFFSET FLAT:$SG70578
	lea	eax, DWORD PTR _buf$[ebp]
	push	eax
	call	_dynbuf_add3
	add	esp, 36					; 00000024H
	test	eax, eax
	je	SHORT $L70576
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29872], OFFSET FLAT:$SG70580
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 355		; 00000163H
	jmp	$eva_err$70477
$L70576:

; 357  : 		else

	jmp	$L70598
$L70556:

; 359  : 			DYNBUF_ADD3_INT(&buf, "<a href=javascript:ol(", p->tabprix[i].idrem, ",0");

	push	2
	push	OFFSET FLAT:$SG70583
	mov	eax, DWORD PTR _i$[ebp]
	shl	eax, 5
	mov	ecx, DWORD PTR _p$[ebp]
	mov	edx, DWORD PTR [ecx+140]
	mov	eax, DWORD PTR [edx+eax]
	push	eax
	push	22					; 00000016H
	push	OFFSET FLAT:$SG70584
	lea	ecx, DWORD PTR _buf$[ebp]
	push	ecx
	call	_dynbuf_add3_int
	add	esp, 24					; 00000018H
	test	eax, eax
	je	SHORT $L70582
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29872], OFFSET FLAT:$SG70586
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 359		; 00000167H
	jmp	$eva_err$70477
$L70582:

; 360  : 			DYNBUF_ADD3_CELL(&buf, ",", &form->id_form, 0, 0, NO_CONV, ",");

	push	1
	push	OFFSET FLAT:$SG70589
	push	0
	push	0
	push	0
	push	0
	mov	ecx, DWORD PTR _form$[ebp]
	add	ecx, 12					; 0000000cH
	push	ecx
	call	_dyntab_sz
	add	esp, 12					; 0000000cH
	push	eax
	push	0
	push	0
	mov	edx, DWORD PTR _form$[ebp]
	add	edx, 12					; 0000000cH
	push	edx
	call	_dyntab_val
	add	esp, 12					; 0000000cH
	push	eax
	push	1
	push	OFFSET FLAT:$SG70590
	lea	eax, DWORD PTR _buf$[ebp]
	push	eax
	call	_dynbuf_add3
	add	esp, 36					; 00000024H
	test	eax, eax
	je	SHORT $L70588
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29872], OFFSET FLAT:$SG70592
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 360		; 00000168H
	jmp	$eva_err$70477
$L70588:

; 361  : 			DYNBUF_ADD_CELL(&buf, &form->id_obj, 0, 0, NO_CONV);

	push	0
	push	0
	push	0
	push	0
	mov	eax, DWORD PTR _form$[ebp]
	add	eax, 32					; 00000020H
	push	eax
	call	_dyntab_sz
	add	esp, 12					; 0000000cH
	push	eax
	push	0
	push	0
	mov	ecx, DWORD PTR _form$[ebp]
	add	ecx, 32					; 00000020H
	push	ecx
	call	_dyntab_val
	add	esp, 12					; 0000000cH
	push	eax
	lea	edx, DWORD PTR _buf$[ebp]
	push	edx
	call	_dynbuf_add
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L70594
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29872], OFFSET FLAT:$SG70596
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 361		; 00000169H
	jmp	$eva_err$70477
$L70594:

; 362  : 			DYNBUF_ADD3(&buf, ") title=\"+ d'infos sur la remise\">", p->tabprix[i].meth, 0, NO_CONV, "</a>");

	push	4
	push	OFFSET FLAT:$SG70599
	push	0
	push	0
	push	0
	mov	edx, DWORD PTR _i$[ebp]
	shl	edx, 5
	mov	eax, DWORD PTR _p$[ebp]
	mov	ecx, DWORD PTR [eax+140]
	mov	edx, DWORD PTR [ecx+edx+24]
	push	edx
	push	34					; 00000022H
	push	OFFSET FLAT:$SG70600
	lea	eax, DWORD PTR _buf$[ebp]
	push	eax
	call	_dynbuf_add3
	add	esp, 36					; 00000024H
	test	eax, eax
	je	SHORT $L70598
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29872], OFFSET FLAT:$SG70602
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 362		; 0000016aH
	jmp	$eva_err$70477
$L70598:

; 364  : 		DYNBUF_ADD_STR(&buf, "</td></tr>")

	push	0
	push	0
	push	10					; 0000000aH
	push	OFFSET FLAT:$SG70605
	lea	eax, DWORD PTR _buf$[ebp]
	push	eax
	call	_dynbuf_add
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L70604
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29872], OFFSET FLAT:$SG70607
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 364		; 0000016cH
	jmp	$eva_err$70477
$L70604:

; 365  : 	}

	jmp	$L70500
$L70501:

; 369  : 		"<tr><td colspan=4 bgcolor=#DDDDDD align=right>Total <b>&euro; ", tva ? "TTC" : "HT", 0, NO_CONV, "</td></tr>");

	fld	QWORD PTR _tva$[ebp]
	fcomp	QWORD PTR __real@8@00000000000000000000
	fnstsw	ax
	test	ah, 64					; 00000040H
	jne	SHORT $L71320
	mov	DWORD PTR -116+[ebp], OFFSET FLAT:$SG70611
	jmp	SHORT $L71321
$L71320:
	mov	DWORD PTR -116+[ebp], OFFSET FLAT:$SG70612
$L71321:
	push	10					; 0000000aH
	push	OFFSET FLAT:$SG70610
	push	0
	push	0
	push	0
	mov	eax, DWORD PTR -116+[ebp]
	push	eax
	push	62					; 0000003eH
	push	OFFSET FLAT:$SG70613
	lea	ecx, DWORD PTR _buf$[ebp]
	push	ecx
	call	_dynbuf_add3
	add	esp, 36					; 00000024H
	test	eax, eax
	je	SHORT $L70609
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29872], OFFSET FLAT:$SG70615
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 369		; 00000171H
	jmp	$eva_err$70477
$L70609:

; 371  : 		"<tr><td align=center>", p->qte, "</td><td align=right><b>");

	push	24					; 00000018H
	push	OFFSET FLAT:$SG70617
	mov	ecx, DWORD PTR _p$[ebp]
	mov	edx, DWORD PTR [ecx+4]
	push	edx
	push	21					; 00000015H
	push	OFFSET FLAT:$SG70618
	lea	eax, DWORD PTR _buf$[ebp]
	push	eax
	call	_dynbuf_add3_int
	add	esp, 24					; 00000018H
	test	eax, eax
	je	SHORT $L70616
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29872], OFFSET FLAT:$SG70620
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 371		; 00000173H
	jmp	$eva_err$70477
$L70616:

; 372  : 	DYNBUF_ADD(&buf, txtres, snprintf(add_sz_str(txtres), "%.2lf", p->qte ? p->pv / p->qte * (1. + tva / 100.) : 0), NO_CONV);

	mov	eax, DWORD PTR _p$[ebp]
	cmp	DWORD PTR [eax+4], 0
	je	SHORT $L71322
	mov	ecx, DWORD PTR _p$[ebp]
	mov	edx, DWORD PTR _p$[ebp]
	mov	eax, DWORD PTR [edx+4]
	mov	DWORD PTR -124+[ebp], eax
	mov	DWORD PTR -124+[ebp+4], 0
	fild	QWORD PTR -124+[ebp]
	fdivr	QWORD PTR [ecx+32]
	fld	QWORD PTR _tva$[ebp]
	fdiv	QWORD PTR __real@8@4005c800000000000000
	fadd	QWORD PTR __real@8@3fff8000000000000000
	fmulp	ST(1), ST(0)
	fstp	QWORD PTR -132+[ebp]
	jmp	SHORT $L71323
$L71322:
	mov	DWORD PTR -132+[ebp], 0
	mov	DWORD PTR -132+[ebp+4], 0
$L71323:
	push	0
	push	0
	mov	ecx, DWORD PTR -132+[ebp+4]
	push	ecx
	mov	edx, DWORD PTR -132+[ebp]
	push	edx
	push	OFFSET FLAT:$SG70623
	push	63					; 0000003fH
	lea	eax, DWORD PTR _txtres$[ebp]
	push	eax
	call	__snprintf
	add	esp, 20					; 00000014H
	push	eax
	lea	ecx, DWORD PTR _txtres$[ebp]
	push	ecx
	lea	edx, DWORD PTR _buf$[ebp]
	push	edx
	call	_dynbuf_add
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L70622
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29872], OFFSET FLAT:$SG70625
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 372		; 00000174H
	jmp	$eva_err$70477
$L70622:

; 373  : 	DYNBUF_ADD3(&buf, "</td><td colspan=2 align=right><b><font size=+0><nobr>", txtres, snprintf(add_sz_str(txtres), "%.2f", p->pv * (1. + tva / 100.)), NO_CONV, "</font>");

	push	7
	push	OFFSET FLAT:$SG70628
	push	0
	push	0
	mov	edx, DWORD PTR _p$[ebp]
	fld	QWORD PTR _tva$[ebp]
	fdiv	QWORD PTR __real@8@4005c800000000000000
	fadd	QWORD PTR __real@8@3fff8000000000000000
	fmul	QWORD PTR [edx+32]
	sub	esp, 8
	fstp	QWORD PTR [esp]
	push	OFFSET FLAT:$SG70629
	push	63					; 0000003fH
	lea	eax, DWORD PTR _txtres$[ebp]
	push	eax
	call	__snprintf
	add	esp, 20					; 00000014H
	push	eax
	lea	ecx, DWORD PTR _txtres$[ebp]
	push	ecx
	push	54					; 00000036H
	push	OFFSET FLAT:$SG70630
	lea	edx, DWORD PTR _buf$[ebp]
	push	edx
	call	_dynbuf_add3
	add	esp, 36					; 00000024H
	test	eax, eax
	je	SHORT $L70627
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29872], OFFSET FLAT:$SG70632
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 373		; 00000175H
	jmp	$eva_err$70477
$L70627:

; 374  : 	DYNBUF_ADD_STR(&buf, "</td></tr></table>");

	push	0
	push	0
	push	18					; 00000012H
	push	OFFSET FLAT:$SG70635
	lea	edx, DWORD PTR _buf$[ebp]
	push	edx
	call	_dynbuf_add
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L70634
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29872], OFFSET FLAT:$SG70637
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 374		; 00000176H
	jmp	$eva_err$70477
$L70634:

; 375  : 	DYNTAB_ADD_BUF(res, 0, 0, buf);

	cmp	DWORD PTR _buf$[ebp], 0
	je	SHORT $L70638
	mov	edx, DWORD PTR _buf$[ebp]
	cmp	DWORD PTR [edx+4], 0
	je	SHORT $L70638
	push	0
	push	0
	mov	eax, DWORD PTR _buf$[ebp]
	mov	ecx, DWORD PTR [eax+4]
	push	ecx
	mov	edx, DWORD PTR _buf$[ebp]
	add	edx, 8
	push	edx
	push	0
	push	0
	mov	eax, DWORD PTR _res$[ebp]
	push	eax
	call	_dyntab_add
	add	esp, 28					; 0000001cH
	test	eax, eax
	je	SHORT $L70640
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29872], OFFSET FLAT:$SG70642
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 375		; 00000177H
	jmp	SHORT $eva_err$70477
$L70640:
	jmp	SHORT $L70646
$L70638:
	push	0
	push	0
	push	0
	push	0
	push	0
	push	0
	mov	eax, DWORD PTR _res$[ebp]
	push	eax
	call	_dyntab_add
	add	esp, 28					; 0000001cH
	test	eax, eax
	je	SHORT $L70646
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29872], OFFSET FLAT:$SG70648
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 375		; 00000177H
	jmp	SHORT $eva_err$70477
$L70646:
$eva_noerr$70468:

; 376  : 
; 377  : 	RETURN_OK_CLEANUP;

	push	0
	push	OFFSET FLAT:$SG70649
	push	OFFSET FLAT:$SG70650
	mov	eax, DWORD PTR _cntxt$[ebp]
	push	eax
	call	_err_clear
	add	esp, 16					; 00000010H
$eva_err$70477:
	mov	ecx, DWORD PTR _cntxt$[ebp]
	cmp	DWORD PTR [ecx+29872], 0
	je	SHORT $L70651
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	eax, DWORD PTR [edx+29900]
	push	eax
	push	OFFSET FLAT:$SG70652
	push	OFFSET FLAT:$SG70653
	mov	ecx, DWORD PTR _cntxt$[ebp]
	push	ecx
	call	_err_add_context
	add	esp, 16					; 00000010H
$L70651:
	mov	edx, DWORD PTR _buf$[ebp]
	push	edx
	call	_mem_free
	add	esp, 4
	mov	DWORD PTR _buf$[ebp], 0
	mov	eax, DWORD PTR _cntxt$[ebp]
	xor	ecx, ecx
	cmp	DWORD PTR [eax+29872], 0
	setne	cl
	mov	eax, ecx

; 378  : }

	pop	edi
	mov	esp, ebp
	pop	ebp
	ret	0
_TabPrix ENDP
_TEXT	ENDS
PUBLIC	_CalcRemise
EXTRN	_ceil:NEAR
_DATA	SEGMENT
$SG70709 DB	'D:\Travail\ABI\EVA\V4.0\CGI\Brunix-2016\dll_fap.c', 00H
	ORG $+2
$SG70710 DB	'CalcRemise', 00H
	ORG $+1
$SG70712 DB	'D:\Travail\ABI\EVA\V4.0\CGI\Brunix-2016\dll_fap.c', 00H
	ORG $+2
$SG70713 DB	'CalcRemise', 00H
_DATA	ENDS
_TEXT	SEGMENT
_cx$ = 8
_p$ = 12
_id$ = 16
_qte$ = 20
_mont$ = 24
_meth$ = 32
_cntxt$ = -32
_i$ = -20
_q$ = -4
_res$ = -16
_m$ = -28
_r$ = -8
_CalcRemise PROC NEAR

; 395  : ){

	push	ebp
	mov	ebp, esp
	sub	esp, 60					; 0000003cH
	push	esi

; 396  : 	EVA_context *cntxt = cx->cntxt;

	mov	eax, DWORD PTR _cx$[ebp]
	mov	ecx, DWORD PTR [eax]
	mov	DWORD PTR _cntxt$[ebp], ecx

; 397  : 	unsigned long i = 0, q = qte;

	mov	DWORD PTR _i$[ebp], 0
	mov	edx, DWORD PTR _qte$[ebp]
	mov	DWORD PTR _q$[ebp], edx

; 398  : 	double res = 0, m = mont;

	mov	DWORD PTR _res$[ebp], 0
	mov	DWORD PTR _res$[ebp+4], 0
	mov	eax, DWORD PTR _mont$[ebp]
	mov	DWORD PTR _m$[ebp], eax
	mov	ecx, DWORD PTR _mont$[ebp+4]
	mov	DWORD PTR _m$[ebp+4], ecx

; 399  : 	Remise *r = NULL;

	mov	DWORD PTR _r$[ebp], 0

; 400  : 	if(!id) return 0;

	cmp	DWORD PTR _id$[ebp], 0
	jne	SHORT $L70678
	xor	eax, eax
	jmp	$L70670
$L70678:

; 401  : 
; 402  : 	/* Lecture de la fiche remise */
; 403  : 	p->b_rem = 0;

	mov	edx, DWORD PTR _p$[ebp]
	mov	DWORD PTR [edx+152], 0

; 404  : 	if(FicheRemise(cx, &r, id)) STACK_ERROR;

	mov	eax, DWORD PTR _id$[ebp]
	push	eax
	lea	ecx, DWORD PTR _r$[ebp]
	push	ecx
	mov	edx, DWORD PTR _cx$[ebp]
	push	edx
	call	_FicheRemise
	add	esp, 12					; 0000000cH
	test	eax, eax
	je	SHORT $L70679
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 404		; 00000194H
	jmp	$eva_err$70680
$L70679:

; 405  : 
; 406  : 	if(r)

	cmp	DWORD PTR _r$[ebp], 0
	je	$L70683

; 408  : 		/* Traitement selon type de remise */
; 409  : 		switch(r->mode)
; 410  : 		{

	mov	ecx, DWORD PTR _r$[ebp]
	mov	edx, DWORD PTR [ecx+4]
	mov	DWORD PTR -36+[ebp], edx
	cmp	DWORD PTR -36+[ebp], 4
	ja	$L70683
	mov	eax, DWORD PTR -36+[ebp]
	jmp	DWORD PTR $L71336[eax*4]
$L70686:

; 411  : 		case RFix:
; 412  : 			res = r->r->pc;

	mov	ecx, DWORD PTR _r$[ebp]
	mov	edx, DWORD PTR [ecx+8]
	mov	eax, DWORD PTR [edx+16]
	mov	DWORD PTR _res$[ebp], eax
	mov	ecx, DWORD PTR [edx+20]
	mov	DWORD PTR _res$[ebp+4], ecx

; 413  : 			if(res) AjoutPrix(cx, p, id, 1, 0, res, meth, 3);

	fld	QWORD PTR _res$[ebp]
	fcomp	QWORD PTR __real@8@00000000000000000000
	fnstsw	ax
	test	ah, 64					; 00000040H
	jne	SHORT $L70687
	push	3
	mov	edx, DWORD PTR _meth$[ebp]
	push	edx
	mov	eax, DWORD PTR _res$[ebp+4]
	push	eax
	mov	ecx, DWORD PTR _res$[ebp]
	push	ecx
	push	0
	push	0
	push	1
	mov	edx, DWORD PTR _id$[ebp]
	push	edx
	mov	eax, DWORD PTR _p$[ebp]
	push	eax
	mov	ecx, DWORD PTR _cx$[ebp]
	push	ecx
	call	_AjoutPrix
	add	esp, 40					; 00000028H
$L70687:

; 414  : 			break;

	jmp	$L70683
$L70688:

; 415  : 		case RQte:
; 416  : 		case RQteCum:
; 417  : 			if(r->mode == RQte)

	mov	edx, DWORD PTR _r$[ebp]
	cmp	DWORD PTR [edx+4], 0
	jne	SHORT $L70689

; 419  : 				q = p->qte;

	mov	eax, DWORD PTR _p$[ebp]
	mov	ecx, DWORD PTR [eax+4]
	mov	DWORD PTR _q$[ebp], ecx

; 420  : 				qte = 0;

	mov	DWORD PTR _qte$[ebp], 0

; 422  : 			else

	jmp	SHORT $L70692
$L70689:

; 424  : 				if(p->b_panier)

	mov	edx, DWORD PTR _p$[ebp]
	cmp	DWORD PTR [edx+156], 0
	je	SHORT $L70691

; 425  : 					qte -= p->qte;

	mov	eax, DWORD PTR _p$[ebp]
	mov	ecx, DWORD PTR _qte$[ebp]
	sub	ecx, DWORD PTR [eax+4]
	mov	DWORD PTR _qte$[ebp], ecx

; 426  : 				else

	jmp	SHORT $L70692
$L70691:

; 427  : 					q += p->qte;

	mov	edx, DWORD PTR _p$[ebp]
	mov	eax, DWORD PTR _q$[ebp]
	add	eax, DWORD PTR [edx+4]
	mov	DWORD PTR _q$[ebp], eax
$L70692:

; 429  : 			for(i = 0; i < r->nbr; i++) AjoutPrix(cx, p, id, r->r[i].qte - qte, 0, r->r[i].pc, meth, 1 | ((q >= r->r[i].qte ) ? 2 : 0));

	mov	DWORD PTR _i$[ebp], 0
	jmp	SHORT $L70693
$L70694:
	mov	ecx, DWORD PTR _i$[ebp]
	add	ecx, 1
	mov	DWORD PTR _i$[ebp], ecx
$L70693:
	mov	edx, DWORD PTR _r$[ebp]
	mov	eax, DWORD PTR _i$[ebp]
	cmp	eax, DWORD PTR [edx+12]
	jae	SHORT $L70695
	mov	ecx, DWORD PTR _i$[ebp]
	imul	ecx, 24					; 00000018H
	mov	edx, DWORD PTR _r$[ebp]
	mov	eax, DWORD PTR [edx+8]
	mov	edx, DWORD PTR _q$[ebp]
	cmp	edx, DWORD PTR [eax+ecx]
	sbb	eax, eax
	and	al, -2					; fffffffeH
	add	eax, 2
	or	al, 1
	push	eax
	mov	ecx, DWORD PTR _meth$[ebp]
	push	ecx
	mov	edx, DWORD PTR _i$[ebp]
	imul	edx, 24					; 00000018H
	mov	eax, DWORD PTR _r$[ebp]
	mov	ecx, DWORD PTR [eax+8]
	mov	eax, DWORD PTR [ecx+edx+20]
	push	eax
	mov	ecx, DWORD PTR [ecx+edx+16]
	push	ecx
	push	0
	push	0
	mov	edx, DWORD PTR _i$[ebp]
	imul	edx, 24					; 00000018H
	mov	eax, DWORD PTR _r$[ebp]
	mov	ecx, DWORD PTR [eax+8]
	mov	edx, DWORD PTR [ecx+edx]
	sub	edx, DWORD PTR _qte$[ebp]
	push	edx
	mov	eax, DWORD PTR _id$[ebp]
	push	eax
	mov	ecx, DWORD PTR _p$[ebp]
	push	ecx
	mov	edx, DWORD PTR _cx$[ebp]
	push	edx
	call	_AjoutPrix
	add	esp, 40					; 00000028H
	jmp	SHORT $L70694
$L70695:

; 430  : 			break;

	jmp	$L70683
$L70696:

; 431  : 		case RMont:
; 432  : 			if(p->b_panier)

	mov	eax, DWORD PTR _p$[ebp]
	cmp	DWORD PTR [eax+156], 0
	je	SHORT $L70697

; 433  : 				mont -= p->pxpub * p->qte;

	mov	ecx, DWORD PTR _p$[ebp]
	mov	edx, DWORD PTR _p$[ebp]
	mov	eax, DWORD PTR [edx+4]
	mov	DWORD PTR -44+[ebp], eax
	mov	DWORD PTR -44+[ebp+4], 0
	fild	QWORD PTR -44+[ebp]
	fmul	QWORD PTR [ecx+16]
	fsubr	QWORD PTR _mont$[ebp]
	fstp	QWORD PTR _mont$[ebp]

; 434  : 			else

	jmp	SHORT $L70698
$L70697:

; 435  : 				m += p->pxpub * p->qte;

	mov	ecx, DWORD PTR _p$[ebp]
	mov	edx, DWORD PTR _p$[ebp]
	mov	eax, DWORD PTR [edx+4]
	mov	DWORD PTR -52+[ebp], eax
	mov	DWORD PTR -52+[ebp+4], 0
	fild	QWORD PTR -52+[ebp]
	fmul	QWORD PTR [ecx+16]
	fadd	QWORD PTR _m$[ebp]
	fstp	QWORD PTR _m$[ebp]
$L70698:

; 436  : 			for(i = 0; i < r->nbr; i++)

	mov	DWORD PTR _i$[ebp], 0
	jmp	SHORT $L70699
$L70700:
	mov	ecx, DWORD PTR _i$[ebp]
	add	ecx, 1
	mov	DWORD PTR _i$[ebp], ecx
$L70699:
	mov	edx, DWORD PTR _r$[ebp]
	mov	eax, DWORD PTR _i$[ebp]
	cmp	eax, DWORD PTR [edx+12]
	jae	$L70701

; 438  : 				qte = (int)(ceil((r->r[i].mont - mont) / p->pxpub));

	mov	ecx, DWORD PTR _i$[ebp]
	imul	ecx, 24					; 00000018H
	mov	edx, DWORD PTR _r$[ebp]
	mov	eax, DWORD PTR [edx+8]
	fld	QWORD PTR [eax+ecx+8]
	fsub	QWORD PTR _mont$[ebp]
	mov	ecx, DWORD PTR _p$[ebp]
	fdiv	QWORD PTR [ecx+16]
	sub	esp, 8
	fstp	QWORD PTR [esp]
	call	_ceil
	add	esp, 8
	call	__ftol
	mov	DWORD PTR _qte$[ebp], eax

; 439  : 				AjoutPrix(cx, p, id, qte, r->r[i].mont, r->r[i].pc, meth, 1 | ((m >= r->r[i].mont) ? 2 : 0));

	mov	edx, DWORD PTR _i$[ebp]
	imul	edx, 24					; 00000018H
	mov	eax, DWORD PTR _r$[ebp]
	mov	ecx, DWORD PTR [eax+8]
	fld	QWORD PTR _m$[ebp]
	fcomp	QWORD PTR [ecx+edx+8]
	fnstsw	ax
	test	ah, 1
	jne	SHORT $L71334
	mov	DWORD PTR -56+[ebp], 2
	jmp	SHORT $L71335
$L71334:
	mov	DWORD PTR -56+[ebp], 0
$L71335:
	mov	edx, DWORD PTR -56+[ebp]
	or	edx, 1
	push	edx
	mov	eax, DWORD PTR _meth$[ebp]
	push	eax
	mov	ecx, DWORD PTR _i$[ebp]
	imul	ecx, 24					; 00000018H
	mov	edx, DWORD PTR _r$[ebp]
	mov	eax, DWORD PTR [edx+8]
	mov	edx, DWORD PTR [eax+ecx+20]
	push	edx
	mov	eax, DWORD PTR [eax+ecx+16]
	push	eax
	mov	ecx, DWORD PTR _i$[ebp]
	imul	ecx, 24					; 00000018H
	mov	edx, DWORD PTR _r$[ebp]
	mov	eax, DWORD PTR [edx+8]
	mov	edx, DWORD PTR [eax+ecx+12]
	push	edx
	mov	eax, DWORD PTR [eax+ecx+8]
	push	eax
	mov	ecx, DWORD PTR _qte$[ebp]
	push	ecx
	mov	edx, DWORD PTR _id$[ebp]
	push	edx
	mov	eax, DWORD PTR _p$[ebp]
	push	eax
	mov	ecx, DWORD PTR _cx$[ebp]
	push	ecx
	call	_AjoutPrix
	add	esp, 40					; 00000028H

; 440  : 			}

	jmp	$L70700
$L70701:

; 441  : 			break;

	jmp	$L70683
$L70703:

; 442  : 		case RMarge:
; 443  : 			if(!p->pa) break;

	mov	edx, DWORD PTR _p$[ebp]
	fld	QWORD PTR [edx+24]
	fcomp	QWORD PTR __real@8@00000000000000000000
	fnstsw	ax
	test	ah, 64					; 00000040H
	je	SHORT $L70704
	jmp	$L70683
$L70704:

; 444  : 			m = p->pa / (1. - r->r->pc / 100.);

	mov	eax, DWORD PTR _p$[ebp]
	mov	ecx, DWORD PTR _r$[ebp]
	mov	edx, DWORD PTR [ecx+8]
	fld	QWORD PTR [edx+16]
	fdiv	QWORD PTR __real@8@4005c800000000000000
	fsubr	QWORD PTR __real@8@3fff8000000000000000
	fdivr	QWORD PTR [eax+24]
	fstp	QWORD PTR _m$[ebp]

; 445  : 			if(r->r->mont) m = r->r->mont * (int)(1 + m / r->r->mont);

	mov	eax, DWORD PTR _r$[ebp]
	mov	ecx, DWORD PTR [eax+8]
	fld	QWORD PTR [ecx+8]
	fcomp	QWORD PTR __real@8@00000000000000000000
	fnstsw	ax
	test	ah, 64					; 00000040H
	jne	SHORT $L70705
	mov	edx, DWORD PTR _r$[ebp]
	mov	esi, DWORD PTR [edx+8]
	mov	eax, DWORD PTR _r$[ebp]
	mov	ecx, DWORD PTR [eax+8]
	fld	QWORD PTR _m$[ebp]
	fdiv	QWORD PTR [ecx+8]
	fadd	QWORD PTR __real@8@3fff8000000000000000
	call	__ftol
	mov	DWORD PTR -60+[ebp], eax
	fild	DWORD PTR -60+[ebp]
	fmul	QWORD PTR [esi+8]
	fstp	QWORD PTR _m$[ebp]
$L70705:

; 446  : 			res = (1. - m / p->pxpub) * 100.;

	mov	edx, DWORD PTR _p$[ebp]
	fld	QWORD PTR _m$[ebp]
	fdiv	QWORD PTR [edx+16]
	fsubr	QWORD PTR __real@8@3fff8000000000000000
	fmul	QWORD PTR __real@8@4005c800000000000000
	fst	QWORD PTR _res$[ebp]

; 447  : 			if(res) AjoutPrix(cx, p, id, 1, 0, res, meth, 3);

	fcomp	QWORD PTR __real@8@00000000000000000000
	fnstsw	ax
	test	ah, 64					; 00000040H
	jne	SHORT $L70707
	push	3
	mov	eax, DWORD PTR _meth$[ebp]
	push	eax
	mov	ecx, DWORD PTR _res$[ebp+4]
	push	ecx
	mov	edx, DWORD PTR _res$[ebp]
	push	edx
	push	0
	push	0
	push	1
	mov	eax, DWORD PTR _id$[ebp]
	push	eax
	mov	ecx, DWORD PTR _p$[ebp]
	push	ecx
	mov	edx, DWORD PTR _cx$[ebp]
	push	edx
	call	_AjoutPrix
	add	esp, 40					; 00000028H
$L70707:
$L70683:
$eva_noerr$70708:

; 450  : 
; 451  : 	RETURN_OK_CLEANUP;

	push	0
	push	OFFSET FLAT:$SG70709
	push	OFFSET FLAT:$SG70710
	mov	eax, DWORD PTR _cntxt$[ebp]
	push	eax
	call	_err_clear
	add	esp, 16					; 00000010H
$eva_err$70680:
	mov	ecx, DWORD PTR _cntxt$[ebp]
	cmp	DWORD PTR [ecx+29872], 0
	je	SHORT $L70711
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	eax, DWORD PTR [edx+29900]
	push	eax
	push	OFFSET FLAT:$SG70712
	push	OFFSET FLAT:$SG70713
	mov	ecx, DWORD PTR _cntxt$[ebp]
	push	ecx
	call	_err_add_context
	add	esp, 16					; 00000010H
$L70711:
	mov	edx, DWORD PTR _cntxt$[ebp]
	xor	eax, eax
	cmp	DWORD PTR [edx+29872], 0
	setne	al
$L70670:

; 452  : }

	pop	esi
	mov	esp, ebp
	pop	ebp
	ret	0
$L71336:
	DD	$L70688
	DD	$L70688
	DD	$L70696
	DD	$L70686
	DD	$L70703
_CalcRemise ENDP
_TEXT	ENDS
PUBLIC	_FicheCategorie
_DATA	SEGMENT
	ORG $+1
$SG70743 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70747 DB	'CATEG_REMISE,CATEG_REMPRO,PRODUIT_REMISE,PRODUIT_REMPRO', 00H
$SG70750 DB	'CATEG_REMPRO', 00H
	ORG $+3
$SG70753 DB	'PRODUIT_REMPRO', 00H
	ORG $+1
$SG70756 DB	'CATEG_REMISE', 00H
	ORG $+3
$SG70759 DB	'PRODUIT_REMISE', 00H
	ORG $+1
$SG70760 DB	'D:\Travail\ABI\EVA\V4.0\CGI\Brunix-2016\dll_fap.c', 00H
	ORG $+2
$SG70761 DB	'FicheCategorie', 00H
	ORG $+1
$SG70763 DB	'D:\Travail\ABI\EVA\V4.0\CGI\Brunix-2016\dll_fap.c', 00H
	ORG $+2
$SG70764 DB	'FicheCategorie', 00H
_DATA	ENDS
_TEXT	SEGMENT
_cx$ = 8
_res$ = 12
_id$ = 16
_cntxt$ = -32
_data$ = -24
_i$ = -28
_c$ = -4
_newdest$70738 = -36
_FicheCategorie PROC NEAR

; 466  : ){

	push	ebp
	mov	ebp, esp
	sub	esp, 36					; 00000024H

; 467  : 	EVA_context *cntxt = cx->cntxt;

	mov	eax, DWORD PTR _cx$[ebp]
	mov	ecx, DWORD PTR [eax]
	mov	DWORD PTR _cntxt$[ebp], ecx

; 468  : 	DynTable data = {0};

	mov	DWORD PTR _data$[ebp], 0
	xor	edx, edx
	mov	DWORD PTR _data$[ebp+4], edx
	mov	DWORD PTR _data$[ebp+8], edx
	mov	DWORD PTR _data$[ebp+12], edx
	mov	DWORD PTR _data$[ebp+16], edx

; 469  : 	unsigned long i = 0;

	mov	DWORD PTR _i$[ebp], 0

; 470  : 	Categ *c;
; 471  : 	if(!res) RETURN_OK;

	cmp	DWORD PTR _res$[ebp], 0
	jne	SHORT $L70729
	jmp	$eva_noerr$70730
$L70729:

; 472  : 	*res = NULL;

	mov	eax, DWORD PTR _res$[ebp]
	mov	DWORD PTR [eax], 0

; 473  : 	if(!id) RETURN_OK;

	cmp	DWORD PTR _id$[ebp], 0
	jne	SHORT $L70732
	jmp	$eva_noerr$70730
$L70732:

; 474  : 
; 475  : 	/* Recherche de la fiche dans le buffer */
; 476  : 	while(i < cx->nbcat && cx->cat[i].id != id) i++;

	mov	ecx, DWORD PTR _cx$[ebp]
	mov	edx, DWORD PTR _i$[ebp]
	cmp	edx, DWORD PTR [ecx+196]
	jae	SHORT $L70735
	mov	eax, DWORD PTR _i$[ebp]
	imul	eax, 24					; 00000018H
	mov	ecx, DWORD PTR _cx$[ebp]
	mov	edx, DWORD PTR [ecx+192]
	mov	eax, DWORD PTR [edx+eax]
	cmp	eax, DWORD PTR _id$[ebp]
	je	SHORT $L70735
	mov	ecx, DWORD PTR _i$[ebp]
	add	ecx, 1
	mov	DWORD PTR _i$[ebp], ecx
	jmp	SHORT $L70732
$L70735:

; 477  : 	if(i < cx->nbcat)

	mov	edx, DWORD PTR _cx$[ebp]
	mov	eax, DWORD PTR _i$[ebp]
	cmp	eax, DWORD PTR [edx+196]
	jae	SHORT $L70736

; 478  : 		/* Retourne la fiche trouvee dans le buffer */
; 479  : 		c = cx->cat + i;

	mov	ecx, DWORD PTR _i$[ebp]
	imul	ecx, 24					; 00000018H
	mov	edx, DWORD PTR _cx$[ebp]
	mov	eax, DWORD PTR [edx+192]
	add	eax, ecx
	mov	DWORD PTR _c$[ebp], eax

; 480  : 	else

	jmp	$L70757
$L70736:

; 482  : 		/* Fiche non trouvee : ajoute au buffer */
; 483  : 		M_REALLOC(Categ, cx->cat, cx->nbcat);

	push	48					; 00000030H
	mov	ecx, DWORD PTR _cx$[ebp]
	mov	edx, DWORD PTR [ecx+196]
	imul	edx, 24					; 00000018H
	push	edx
	mov	eax, DWORD PTR _cx$[ebp]
	mov	ecx, DWORD PTR [eax+192]
	push	ecx
	call	_mem_realloc
	add	esp, 12					; 0000000cH
	mov	DWORD PTR _newdest$70738[ebp], eax
	cmp	DWORD PTR _newdest$70738[ebp], 0
	jne	SHORT $L70741
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29872], OFFSET FLAT:$SG70743
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 483		; 000001e3H
	jmp	$eva_err$70744
$L70741:
	mov	ecx, DWORD PTR _cx$[ebp]
	mov	edx, DWORD PTR _newdest$70738[ebp]
	mov	DWORD PTR [ecx+192], edx
	mov	eax, DWORD PTR _cx$[ebp]
	mov	ecx, DWORD PTR [eax+196]
	add	ecx, 1
	mov	edx, DWORD PTR _cx$[ebp]
	mov	DWORD PTR [edx+196], ecx

; 484  : 		c = cx->cat + cx->nbcat - 1;

	mov	eax, DWORD PTR _cx$[ebp]
	mov	ecx, DWORD PTR [eax+196]
	imul	ecx, 24					; 00000018H
	mov	edx, DWORD PTR _cx$[ebp]
	mov	eax, DWORD PTR [edx+192]
	lea	ecx, DWORD PTR [eax+ecx-24]
	mov	DWORD PTR _c$[ebp], ecx

; 485  : 		memset(c, 0, sizeof(c[0]));

	push	24					; 00000018H
	push	0
	mov	edx, DWORD PTR _c$[ebp]
	push	edx
	call	_memset
	add	esp, 12					; 0000000cH

; 486  : 		c->id = id;

	mov	eax, DWORD PTR _c$[ebp]
	mov	ecx, DWORD PTR _id$[ebp]
	mov	DWORD PTR [eax], ecx

; 487  : 		if(qry_obj_field(cntxt, &data, id, "CATEG_REMISE,CATEG_REMPRO,PRODUIT_REMISE,PRODUIT_REMPRO")) STACK_ERROR;

	push	OFFSET FLAT:$SG70747
	mov	edx, DWORD PTR _id$[ebp]
	push	edx
	lea	eax, DWORD PTR _data$[ebp]
	push	eax
	mov	ecx, DWORD PTR _cntxt$[ebp]
	push	ecx
	call	_qry_obj_field
	add	esp, 16					; 00000010H
	test	eax, eax
	je	SHORT $L70746
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 487		; 000001e7H
	jmp	$eva_err$70744
$L70746:

; 488  : 		if(cx->b_usrpro)

	mov	eax, DWORD PTR _cx$[ebp]
	cmp	DWORD PTR [eax+20], 0
	je	SHORT $L70751

; 490  : 			c->idrem = strtoul(dyntab_field_val(&data, "CATEG_REMPRO", ~0UL, 0), NULL, 0);

	push	0
	push	0
	push	0
	push	-1
	push	OFFSET FLAT:$SG70750
	lea	ecx, DWORD PTR _data$[ebp]
	push	ecx
	call	_dyntab_field_val
	add	esp, 16					; 00000010H
	push	eax
	call	_strtoul
	add	esp, 12					; 0000000cH
	mov	edx, DWORD PTR _c$[ebp]
	mov	DWORD PTR [edx+4], eax

; 491  : 			if(!c->idrem)

	mov	eax, DWORD PTR _c$[ebp]
	cmp	DWORD PTR [eax+4], 0
	jne	SHORT $L70751

; 492  : 				c->idrem = strtoul(dyntab_field_val(&data, "PRODUIT_REMPRO", ~0UL, 0), NULL, 0);

	push	0
	push	0
	push	0
	push	-1
	push	OFFSET FLAT:$SG70753
	lea	ecx, DWORD PTR _data$[ebp]
	push	ecx
	call	_dyntab_field_val
	add	esp, 16					; 00000010H
	push	eax
	call	_strtoul
	add	esp, 12					; 0000000cH
	mov	edx, DWORD PTR _c$[ebp]
	mov	DWORD PTR [edx+4], eax
$L70751:

; 494  : 		if(!c->idrem)

	mov	eax, DWORD PTR _c$[ebp]
	cmp	DWORD PTR [eax+4], 0
	jne	SHORT $L70754

; 495  : 			c->idrem = strtoul(dyntab_field_val(&data, "CATEG_REMISE", ~0UL, 0), NULL, 0);

	push	0
	push	0
	push	0
	push	-1
	push	OFFSET FLAT:$SG70756
	lea	ecx, DWORD PTR _data$[ebp]
	push	ecx
	call	_dyntab_field_val
	add	esp, 16					; 00000010H
	push	eax
	call	_strtoul
	add	esp, 12					; 0000000cH
	mov	edx, DWORD PTR _c$[ebp]
	mov	DWORD PTR [edx+4], eax
$L70754:

; 496  : 		if(!c->idrem)

	mov	eax, DWORD PTR _c$[ebp]
	cmp	DWORD PTR [eax+4], 0
	jne	SHORT $L70757

; 497  : 			c->idrem = strtoul(dyntab_field_val(&data, "PRODUIT_REMISE", ~0UL, 0), NULL, 0);

	push	0
	push	0
	push	0
	push	-1
	push	OFFSET FLAT:$SG70759
	lea	ecx, DWORD PTR _data$[ebp]
	push	ecx
	call	_dyntab_field_val
	add	esp, 16					; 00000010H
	push	eax
	call	_strtoul
	add	esp, 12					; 0000000cH
	mov	edx, DWORD PTR _c$[ebp]
	mov	DWORD PTR [edx+4], eax
$L70757:

; 499  : 	*res = c;

	mov	eax, DWORD PTR _res$[ebp]
	mov	ecx, DWORD PTR _c$[ebp]
	mov	DWORD PTR [eax], ecx
$eva_noerr$70730:

; 500  : 
; 501  : 	RETURN_OK_CLEANUP;

	push	0
	push	OFFSET FLAT:$SG70760
	push	OFFSET FLAT:$SG70761
	mov	edx, DWORD PTR _cntxt$[ebp]
	push	edx
	call	_err_clear
	add	esp, 16					; 00000010H
$eva_err$70744:
	mov	eax, DWORD PTR _cntxt$[ebp]
	cmp	DWORD PTR [eax+29872], 0
	je	SHORT $L70762
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	edx, DWORD PTR [ecx+29900]
	push	edx
	push	OFFSET FLAT:$SG70763
	push	OFFSET FLAT:$SG70764
	mov	eax, DWORD PTR _cntxt$[ebp]
	push	eax
	call	_err_add_context
	add	esp, 16					; 00000010H
$L70762:
	lea	ecx, DWORD PTR _data$[ebp]
	push	ecx
	call	_dyntab_free
	add	esp, 4
	mov	edx, DWORD PTR _cntxt$[ebp]
	xor	eax, eax
	cmp	DWORD PTR [edx+29872], 0
	setne	al

; 502  : }

	mov	esp, ebp
	pop	ebp
	ret	0
_FicheCategorie ENDP
_TEXT	ENDS
PUBLIC	_CheckPromo
_TEXT	SEGMENT
_cx$ = 8
_p$ = 12
_id$ = 16
_i$ = -4
_CheckPromo PROC NEAR

; 514  : ){

	push	ebp
	mov	ebp, esp
	push	ecx

; 515  : 	unsigned long i;
; 516  : 	for(i = 0; i < cx->id_promo.nbrows; i++)

	mov	DWORD PTR _i$[ebp], 0
	jmp	SHORT $L70775
$L70776:
	mov	eax, DWORD PTR _i$[ebp]
	add	eax, 1
	mov	DWORD PTR _i$[ebp], eax
$L70775:
	mov	ecx, DWORD PTR _cx$[ebp]
	mov	edx, DWORD PTR _i$[ebp]
	cmp	edx, DWORD PTR [ecx+240]
	jae	SHORT $L70777

; 517  : 			if(cx->id_promo.cell[i].IdValObj == id)

	mov	eax, DWORD PTR _i$[ebp]
	shl	eax, 6
	mov	ecx, DWORD PTR _cx$[ebp]
	mov	edx, DWORD PTR [ecx+256]
	mov	eax, DWORD PTR [edx+eax+24]
	cmp	eax, DWORD PTR _id$[ebp]
	jne	SHORT $L70778

; 519  : 				p->b_promo = 1;

	mov	ecx, DWORD PTR _p$[ebp]
	mov	DWORD PTR [ecx+148], 1

; 520  : 				return;

	jmp	SHORT $L70777
$L70778:

; 522  : }

	jmp	SHORT $L70776
$L70777:
	mov	esp, ebp
	pop	ebp
	ret	0
_CheckPromo ENDP
_TEXT	ENDS
PUBLIC	_FichePanier
EXTRN	_form_eval_fieldexpr:NEAR
EXTRN	_mem_strdup:NEAR
EXTRN	_qry_listobj_field:NEAR
EXTRN	_dyntab_cell:NEAR
EXTRN	_dyntab_copy:NEAR
EXTRN	_dyntab_field_cell:NEAR
EXTRN	_dyntab_group:NEAR
EXTRN	_form_get_field_values:NEAR
_DATA	SEGMENT
	ORG $+1
$SG70797 DB	'QUANTITE,ARTICLE_PANIER,PRIX_FACT_HT,PRIX_PUB_HT,PRIX_AC'
	DB	'HAT_HT,METH_REMISE', 00H
	ORG $+1
$SG70800 DB	'QUANTITE', 00H
	ORG $+3
$SG70801 DB	'PRIX_PUB_HT', 00H
$SG70802 DB	'PRIX_ACHAT_HT', 00H
	ORG $+2
$SG70803 DB	'PRIX_FACT_HT', 00H
	ORG $+3
$SG70806 DB	'ARTICLE_PANIER', 00H
	ORG $+1
$SG70807 DB	'METH_REMISE', 00H
$SG70812 DB	'PRIX_VENTE_HT,PRIX_ACHAT_HT,POIDS,ARTICLE_REMISE,ARTICLE'
	DB	'_REMPRO,LONGUEUR,LARGEUR,HAUTEUR,SANS_PLANCHER', 00H
	ORG $+1
$SG70814 DB	'CATALOGUE,FAMILLE,CATEGORIE,SOUS_CATEGORIE,MATIERE', 00H
	ORG $+1
$SG70817 DB	'ARTICLE_REMPRO', 00H
	ORG $+1
$SG70820 DB	'ARTICLE_REMISE', 00H
	ORG $+1
$SG70821 DB	'POIDS', 00H
	ORG $+2
$SG70822 DB	'SANS_PLANCHER', 00H
	ORG $+2
$SG70824 DB	'PRIX_VENTE_HT', 00H
	ORG $+2
$SG70826 DB	'PRIX_ACHAT_HT', 00H
	ORG $+2
$SG70831 DB	'QUANTITE', 00H
	ORG $+3
$SG70840 DB	'<-PRODUIT_ARTICLE', 00H
	ORG $+2
$SG70841 DB	'CATALOGUE,FAMILLE,CATEGORIE,SOUS_CATEGORIE,MATIERE', 00H
	ORG $+1
$SG70847 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70849 DB	'DISTINCT', 00H
	ORG $+3
$SG70867 DB	'LONGUEUR', 00H
	ORG $+3
$SG70868 DB	'LARGEUR', 00H
$SG70869 DB	'HAUTEUR', 00H
$SG70870 DB	'NMAX', 00H
	ORG $+3
$SG70883 DB	'D:\Travail\ABI\EVA\V4.0\CGI\Brunix-2016\dll_fap.c', 00H
	ORG $+2
$SG70884 DB	'FichePanier', 00H
$SG70886 DB	'D:\Travail\ABI\EVA\V4.0\CGI\Brunix-2016\dll_fap.c', 00H
	ORG $+2
$SG70887 DB	'FichePanier', 00H
_DATA	ENDS
_TEXT	SEGMENT
_cx$ = 8
_p$ = 12
_id$ = 16
_cntxt$ = -52
_data$ = -20
_d$ = -44
_t$ = -24
_cat$ = -56
_i$ = -48
_qte$70829 = -60
_FichePanier PROC NEAR

; 534  : ){

	push	ebp
	mov	ebp, esp
	sub	esp, 112				; 00000070H

; 535  : 	EVA_context *cntxt = cx->cntxt;

	mov	eax, DWORD PTR _cx$[ebp]
	mov	ecx, DWORD PTR [eax]
	mov	DWORD PTR _cntxt$[ebp], ecx

; 536  : 	DynTable data = {0};

	mov	DWORD PTR _data$[ebp], 0
	xor	edx, edx
	mov	DWORD PTR _data$[ebp+4], edx
	mov	DWORD PTR _data$[ebp+8], edx
	mov	DWORD PTR _data$[ebp+12], edx
	mov	DWORD PTR _data$[ebp+16], edx

; 537  : 	DynTable d = {0};

	mov	DWORD PTR _d$[ebp], 0
	xor	eax, eax
	mov	DWORD PTR _d$[ebp+4], eax
	mov	DWORD PTR _d$[ebp+8], eax
	mov	DWORD PTR _d$[ebp+12], eax
	mov	DWORD PTR _d$[ebp+16], eax

; 538  : 	DynTable *t;
; 539  : 	Categ *cat = NULL;

	mov	DWORD PTR _cat$[ebp], 0

; 540  : 	unsigned long i;
; 541  : 
; 542  : 	/* Lecture fiche panier */
; 543  : 	p->id = id;

	mov	ecx, DWORD PTR _p$[ebp]
	mov	edx, DWORD PTR _id$[ebp]
	mov	DWORD PTR [ecx], edx

; 544  : 	if(qry_obj_field(cntxt, &data, p->id, "QUANTITE,ARTICLE_PANIER,PRIX_FACT_HT,PRIX_PUB_HT,PRIX_ACHAT_HT,METH_REMISE")) STACK_ERROR;

	push	OFFSET FLAT:$SG70797
	mov	eax, DWORD PTR _p$[ebp]
	mov	ecx, DWORD PTR [eax]
	push	ecx
	lea	edx, DWORD PTR _data$[ebp]
	push	edx
	mov	eax, DWORD PTR _cntxt$[ebp]
	push	eax
	call	_qry_obj_field
	add	esp, 16					; 00000010H
	test	eax, eax
	je	SHORT $L70796
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 544		; 00000220H
	jmp	$eva_err$70798
$L70796:

; 545  : 	p->qte = strtoul(dyntab_field_val(&data, "QUANTITE", ~0UL, 0), NULL, 0);

	push	0
	push	0
	push	0
	push	-1
	push	OFFSET FLAT:$SG70800
	lea	edx, DWORD PTR _data$[ebp]
	push	edx
	call	_dyntab_field_val
	add	esp, 16					; 00000010H
	push	eax
	call	_strtoul
	add	esp, 12					; 0000000cH
	mov	ecx, DWORD PTR _p$[ebp]
	mov	DWORD PTR [ecx+4], eax

; 546  : 	p->pxpub = atof(dyntab_field_val(&data, "PRIX_PUB_HT", ~0UL, 0)) / p->qte;

	push	0
	push	-1
	push	OFFSET FLAT:$SG70801
	lea	edx, DWORD PTR _data$[ebp]
	push	edx
	call	_dyntab_field_val
	add	esp, 16					; 00000010H
	push	eax
	call	_atof
	add	esp, 4
	mov	eax, DWORD PTR _p$[ebp]
	mov	ecx, DWORD PTR [eax+4]
	mov	DWORD PTR -68+[ebp], ecx
	mov	DWORD PTR -68+[ebp+4], 0
	fild	QWORD PTR -68+[ebp]
	fdivp	ST(1), ST(0)
	mov	edx, DWORD PTR _p$[ebp]
	fstp	QWORD PTR [edx+16]

; 547  : 	p->pa = atof(dyntab_field_val(&data, "PRIX_ACHAT_HT", ~0UL, 0)) / p->qte;

	push	0
	push	-1
	push	OFFSET FLAT:$SG70802
	lea	eax, DWORD PTR _data$[ebp]
	push	eax
	call	_dyntab_field_val
	add	esp, 16					; 00000010H
	push	eax
	call	_atof
	add	esp, 4
	mov	ecx, DWORD PTR _p$[ebp]
	mov	edx, DWORD PTR [ecx+4]
	mov	DWORD PTR -76+[ebp], edx
	mov	DWORD PTR -76+[ebp+4], 0
	fild	QWORD PTR -76+[ebp]
	fdivp	ST(1), ST(0)
	mov	eax, DWORD PTR _p$[ebp]
	fstp	QWORD PTR [eax+24]

; 548  : 	p->pv = atof(dyntab_field_val(&data, "PRIX_FACT_HT", ~0UL, 0));

	push	0
	push	-1
	push	OFFSET FLAT:$SG70803
	lea	ecx, DWORD PTR _data$[ebp]
	push	ecx
	call	_dyntab_field_val
	add	esp, 16					; 00000010H
	push	eax
	call	_atof
	add	esp, 4
	mov	edx, DWORD PTR _p$[ebp]
	fstp	QWORD PTR [edx+32]

; 549  : 	if(id) p->idart = strtoul(dyntab_field_val(&data, "ARTICLE_PANIER", ~0UL, 0), NULL, 0);

	cmp	DWORD PTR _id$[ebp], 0
	je	SHORT $L70804
	push	0
	push	0
	push	0
	push	-1
	push	OFFSET FLAT:$SG70806
	lea	eax, DWORD PTR _data$[ebp]
	push	eax
	call	_dyntab_field_val
	add	esp, 16					; 00000010H
	push	eax
	call	_strtoul
	add	esp, 12					; 0000000cH
	mov	ecx, DWORD PTR _p$[ebp]
	mov	DWORD PTR [ecx+8], eax
$L70804:

; 550  : 	p->meth = dyntab_field_val(&data, "METH_REMISE", ~0UL, 0);

	push	0
	push	-1
	push	OFFSET FLAT:$SG70807
	lea	edx, DWORD PTR _data$[ebp]
	push	edx
	call	_dyntab_field_val
	add	esp, 16					; 00000010H
	mov	ecx, DWORD PTR _p$[ebp]
	mov	DWORD PTR [ecx+84], eax

; 551  : 	if(*p->meth) p->meth = mem_strdup(p->meth);

	mov	edx, DWORD PTR _p$[ebp]
	mov	eax, DWORD PTR [edx+84]
	movsx	ecx, BYTE PTR [eax]
	test	ecx, ecx
	je	SHORT $L70808
	mov	edx, DWORD PTR _p$[ebp]
	mov	eax, DWORD PTR [edx+84]
	push	eax
	call	_mem_strdup
	add	esp, 4
	mov	ecx, DWORD PTR _p$[ebp]
	mov	DWORD PTR [ecx+84], eax

; 552  : 	else p->meth = NULL;

	jmp	SHORT $L70809
$L70808:
	mov	edx, DWORD PTR _p$[ebp]
	mov	DWORD PTR [edx+84], 0
$L70809:

; 553  : 
; 554  : 	/* Lecture fiche article */
; 555  : 	if(qry_obj_field(cntxt, &data, p->idart, "PRIX_VENTE_HT,PRIX_ACHAT_HT,POIDS,ARTICLE_REMISE,ARTICLE_REMPRO,LONGUEUR,LARGEUR,HAUTEUR,SANS_PLANCHER")) STACK_ERROR;

	push	OFFSET FLAT:$SG70812
	mov	eax, DWORD PTR _p$[ebp]
	mov	ecx, DWORD PTR [eax+8]
	push	ecx
	lea	edx, DWORD PTR _data$[ebp]
	push	edx
	mov	eax, DWORD PTR _cntxt$[ebp]
	push	eax
	call	_qry_obj_field
	add	esp, 16					; 00000010H
	test	eax, eax
	je	SHORT $L70811
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 555		; 0000022bH
	jmp	$eva_err$70798
$L70811:

; 556  : 	if(qry_obj_field(cntxt, &p->idcat, p->idart, "CATALOGUE,FAMILLE,CATEGORIE,SOUS_CATEGORIE,MATIERE")) STACK_ERROR;

	push	OFFSET FLAT:$SG70814
	mov	edx, DWORD PTR _p$[ebp]
	mov	eax, DWORD PTR [edx+8]
	push	eax
	mov	ecx, DWORD PTR _p$[ebp]
	add	ecx, 92					; 0000005cH
	push	ecx
	mov	edx, DWORD PTR _cntxt$[ebp]
	push	edx
	call	_qry_obj_field
	add	esp, 16					; 00000010H
	test	eax, eax
	je	SHORT $L70813
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 556		; 0000022cH
	jmp	$eva_err$70798
$L70813:

; 557  : 	if(cx->b_usrpro)

	mov	ecx, DWORD PTR _cx$[ebp]
	cmp	DWORD PTR [ecx+20], 0
	je	SHORT $L70815

; 558  : 		p->remart = strtoul(dyntab_field_val(&data, "ARTICLE_REMPRO", ~0UL, 0), NULL, 0);

	push	0
	push	0
	push	0
	push	-1
	push	OFFSET FLAT:$SG70817
	lea	edx, DWORD PTR _data$[ebp]
	push	edx
	call	_dyntab_field_val
	add	esp, 16					; 00000010H
	push	eax
	call	_strtoul
	add	esp, 12					; 0000000cH
	mov	ecx, DWORD PTR _p$[ebp]
	mov	DWORD PTR [ecx+88], eax
$L70815:

; 559  : 	if(!p->remart)

	mov	edx, DWORD PTR _p$[ebp]
	cmp	DWORD PTR [edx+88], 0
	jne	SHORT $L70818

; 560  : 		p->remart = strtoul(dyntab_field_val(&data, "ARTICLE_REMISE", ~0UL, 0), NULL, 0);

	push	0
	push	0
	push	0
	push	-1
	push	OFFSET FLAT:$SG70820
	lea	eax, DWORD PTR _data$[ebp]
	push	eax
	call	_dyntab_field_val
	add	esp, 16					; 00000010H
	push	eax
	call	_strtoul
	add	esp, 12					; 0000000cH
	mov	ecx, DWORD PTR _p$[ebp]
	mov	DWORD PTR [ecx+88], eax
$L70818:

; 561  : 	p->poids = atof(dyntab_field_val(&data, "POIDS", ~0UL, 0));

	push	0
	push	-1
	push	OFFSET FLAT:$SG70821
	lea	edx, DWORD PTR _data$[ebp]
	push	edx
	call	_dyntab_field_val
	add	esp, 16					; 00000010H
	push	eax
	call	_atof
	add	esp, 4
	mov	eax, DWORD PTR _p$[ebp]
	fstp	QWORD PTR [eax+48]

; 562  : 	p->no_pv_min = dyntab_field_cell(&data, "SANS_PLANCHER", ~0UL, 0) ? 1 : 0;

	push	0
	push	-1
	push	OFFSET FLAT:$SG70822
	lea	ecx, DWORD PTR _data$[ebp]
	push	ecx
	call	_dyntab_field_cell
	add	esp, 16					; 00000010H
	neg	eax
	sbb	eax, eax
	neg	eax
	mov	edx, DWORD PTR _p$[ebp]
	mov	DWORD PTR [edx+80], eax

; 563  : 	if(!p->pxpub) p->pxpub = atof(dyntab_field_val(&data, "PRIX_VENTE_HT", ~0UL, 0));

	mov	eax, DWORD PTR _p$[ebp]
	fld	QWORD PTR [eax+16]
	fcomp	QWORD PTR __real@8@00000000000000000000
	fnstsw	ax
	test	ah, 64					; 00000040H
	je	SHORT $L70823
	push	0
	push	-1
	push	OFFSET FLAT:$SG70824
	lea	ecx, DWORD PTR _data$[ebp]
	push	ecx
	call	_dyntab_field_val
	add	esp, 16					; 00000010H
	push	eax
	call	_atof
	add	esp, 4
	mov	edx, DWORD PTR _p$[ebp]
	fstp	QWORD PTR [edx+16]
$L70823:

; 564  : 	if(!p->pa) p->pa = atof(dyntab_field_val(&data, "PRIX_ACHAT_HT", ~0UL, 0));

	mov	eax, DWORD PTR _p$[ebp]
	fld	QWORD PTR [eax+24]
	fcomp	QWORD PTR __real@8@00000000000000000000
	fnstsw	ax
	test	ah, 64					; 00000040H
	je	SHORT $L70825
	push	0
	push	-1
	push	OFFSET FLAT:$SG70826
	lea	ecx, DWORD PTR _data$[ebp]
	push	ecx
	call	_dyntab_field_val
	add	esp, 16					; 00000010H
	push	eax
	call	_atof
	add	esp, 4
	mov	edx, DWORD PTR _p$[ebp]
	fstp	QWORD PTR [edx+24]
$L70825:

; 565  : 
; 566  : 	/* Lecture quantité CGI si fiche courante */
; 567  : 	if(p->idart == DYNTAB_TOUL(&cntxt->id_obj))

	push	10					; 0000000aH
	push	0
	push	0
	push	0
	mov	eax, DWORD PTR _cntxt$[ebp]
	add	eax, 20					; 00000014H
	push	eax
	call	_dyntab_val
	add	esp, 12					; 0000000cH
	push	eax
	call	_strtoul
	add	esp, 12					; 0000000cH
	mov	ecx, DWORD PTR _p$[ebp]
	cmp	DWORD PTR [ecx+8], eax
	jne	$L70836

; 569  : 		unsigned long qte;
; 570  : 		if(form_get_field_values(cntxt, &d, "QUANTITE", 0, p->idart)) STACK_ERROR;

	mov	edx, DWORD PTR _p$[ebp]
	mov	eax, DWORD PTR [edx+8]
	push	eax
	push	0
	push	OFFSET FLAT:$SG70831
	lea	ecx, DWORD PTR _d$[ebp]
	push	ecx
	mov	edx, DWORD PTR _cntxt$[ebp]
	push	edx
	call	_form_get_field_values
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L70830
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 570		; 0000023aH
	jmp	$eva_err$70798
$L70830:

; 571  : 		qte = strtoul(dyntab_val(&d, 0, 0), NULL, 0);

	push	0
	push	0
	push	0
	push	0
	lea	ecx, DWORD PTR _d$[ebp]
	push	ecx
	call	_dyntab_val
	add	esp, 12					; 0000000cH
	push	eax
	call	_strtoul
	add	esp, 12					; 0000000cH
	mov	DWORD PTR _qte$70829[ebp], eax

; 572  : 		if(qte <= 0)

	cmp	DWORD PTR _qte$70829[ebp], 0
	ja	SHORT $L70833

; 574  : 			if(!p->qte) p->qte = 1;

	mov	edx, DWORD PTR _p$[ebp]
	cmp	DWORD PTR [edx+4], 0
	jne	SHORT $L70834
	mov	eax, DWORD PTR _p$[ebp]
	mov	DWORD PTR [eax+4], 1
$L70834:

; 576  : 		else if(qte < 10000000)

	jmp	SHORT $L70836
$L70833:
	cmp	DWORD PTR _qte$70829[ebp], 10000000	; 00989680H
	jae	SHORT $L70836

; 577  : 			p->qte = qte;

	mov	ecx, DWORD PTR _p$[ebp]
	mov	edx, DWORD PTR _qte$70829[ebp]
	mov	DWORD PTR [ecx+4], edx
$L70836:

; 579  : 
; 580  : 	/* Ajout catégories fiches produit */
; 581  : 	d.nbrows = 0;

	mov	DWORD PTR _d$[ebp], 0

; 582  : 	if(form_eval_fieldexpr(cntxt, &p->idprod, 0, p->idart, add_sz_str("<-PRODUIT_ARTICLE"), NULL, 0) ||
; 583  : 		(p->idprod.nbrows &&
; 584  : 		qry_listobj_field(cntxt, &d, &p->idprod, "CATALOGUE,FAMILLE,CATEGORIE,SOUS_CATEGORIE,MATIERE")) ) STACK_ERROR;

	push	0
	push	0
	push	17					; 00000011H
	push	OFFSET FLAT:$SG70840
	mov	eax, DWORD PTR _p$[ebp]
	mov	ecx, DWORD PTR [eax+8]
	push	ecx
	push	0
	mov	edx, DWORD PTR _p$[ebp]
	add	edx, 112				; 00000070H
	push	edx
	mov	eax, DWORD PTR _cntxt$[ebp]
	push	eax
	call	_form_eval_fieldexpr
	add	esp, 32					; 00000020H
	test	eax, eax
	jne	SHORT $L70839
	mov	ecx, DWORD PTR _p$[ebp]
	cmp	DWORD PTR [ecx+112], 0
	je	SHORT $L70838
	push	OFFSET FLAT:$SG70841
	mov	edx, DWORD PTR _p$[ebp]
	add	edx, 112				; 00000070H
	push	edx
	lea	eax, DWORD PTR _d$[ebp]
	push	eax
	mov	ecx, DWORD PTR _cntxt$[ebp]
	push	ecx
	call	_qry_listobj_field
	add	esp, 16					; 00000010H
	test	eax, eax
	je	SHORT $L70838
$L70839:
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 584		; 00000248H
	jmp	$eva_err$70798
$L70838:

; 585  : 	for(i = 0; i < d.nbrows; i++) DYNTAB_ADD_CELL(&p->idcat, p->idcat.nbrows, 0, &d, i, 0);

	mov	DWORD PTR _i$[ebp], 0
	jmp	SHORT $L70842
$L70843:
	mov	eax, DWORD PTR _i$[ebp]
	add	eax, 1
	mov	DWORD PTR _i$[ebp], eax
$L70842:
	mov	ecx, DWORD PTR _i$[ebp]
	cmp	ecx, DWORD PTR _d$[ebp]
	jae	SHORT $L70844
	push	1
	push	0
	mov	edx, DWORD PTR _i$[ebp]
	push	edx
	lea	eax, DWORD PTR _d$[ebp]
	push	eax
	call	_dyntab_cell
	add	esp, 12					; 0000000cH
	push	eax
	push	0
	mov	ecx, DWORD PTR _p$[ebp]
	mov	edx, DWORD PTR [ecx+92]
	push	edx
	mov	eax, DWORD PTR _p$[ebp]
	add	eax, 92					; 0000005cH
	push	eax
	call	_dyntab_copy
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L70845
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29872], OFFSET FLAT:$SG70847
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 585		; 00000249H
	jmp	$eva_err$70798
$L70845:
	jmp	SHORT $L70843
$L70844:

; 586  : 	if(dyntab_group(&p->idcat, "DISTINCT")) STACK_ERROR;

	push	OFFSET FLAT:$SG70849
	mov	eax, DWORD PTR _p$[ebp]
	add	eax, 92					; 0000005cH
	push	eax
	call	_dyntab_group
	add	esp, 8
	test	eax, eax
	je	SHORT $L70848
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 586		; 0000024aH
	jmp	$eva_err$70798
$L70848:

; 587  : 
; 588  : 	/* Contrôle si code promo applicable */
; 589  : 	if(!cx->id_promo.nbrows)

	mov	edx, DWORD PTR _cx$[ebp]
	cmp	DWORD PTR [edx+240], 0
	jne	SHORT $L70850

; 590  : 		p->b_promo = 1;

	mov	eax, DWORD PTR _p$[ebp]
	mov	DWORD PTR [eax+148], 1

; 591  : 	else

	jmp	$L70858
$L70850:

; 593  : 		CheckPromo(cx, p, p->idart);

	mov	ecx, DWORD PTR _p$[ebp]
	mov	edx, DWORD PTR [ecx+8]
	push	edx
	mov	eax, DWORD PTR _p$[ebp]
	push	eax
	mov	ecx, DWORD PTR _cx$[ebp]
	push	ecx
	call	_CheckPromo
	add	esp, 12					; 0000000cH

; 594  : 		for(i = 0; !p->b_promo && i < p->idcat.nbrows; i++) CheckPromo(cx, p, strtoul(p->idcat.cell[i].txt, NULL, 10));

	mov	DWORD PTR _i$[ebp], 0
	jmp	SHORT $L70852
$L70853:
	mov	edx, DWORD PTR _i$[ebp]
	add	edx, 1
	mov	DWORD PTR _i$[ebp], edx
$L70852:
	mov	eax, DWORD PTR _p$[ebp]
	cmp	DWORD PTR [eax+148], 0
	jne	SHORT $L70854
	mov	ecx, DWORD PTR _p$[ebp]
	mov	edx, DWORD PTR _i$[ebp]
	cmp	edx, DWORD PTR [ecx+92]
	jae	SHORT $L70854
	push	10					; 0000000aH
	push	0
	mov	eax, DWORD PTR _i$[ebp]
	shl	eax, 6
	mov	ecx, DWORD PTR _p$[ebp]
	mov	edx, DWORD PTR [ecx+108]
	mov	eax, DWORD PTR [edx+eax]
	push	eax
	call	_strtoul
	add	esp, 12					; 0000000cH
	push	eax
	mov	ecx, DWORD PTR _p$[ebp]
	push	ecx
	mov	edx, DWORD PTR _cx$[ebp]
	push	edx
	call	_CheckPromo
	add	esp, 12					; 0000000cH
	jmp	SHORT $L70853
$L70854:

; 595  : 		for(i = 0; !p->b_promo && i < p->idprod.nbrows; i++) CheckPromo(cx, p, strtoul(p->idprod.cell[i].txt, NULL, 10));

	mov	DWORD PTR _i$[ebp], 0
	jmp	SHORT $L70856
$L70857:
	mov	eax, DWORD PTR _i$[ebp]
	add	eax, 1
	mov	DWORD PTR _i$[ebp], eax
$L70856:
	mov	ecx, DWORD PTR _p$[ebp]
	cmp	DWORD PTR [ecx+148], 0
	jne	SHORT $L70858
	mov	edx, DWORD PTR _p$[ebp]
	mov	eax, DWORD PTR _i$[ebp]
	cmp	eax, DWORD PTR [edx+112]
	jae	SHORT $L70858
	push	10					; 0000000aH
	push	0
	mov	ecx, DWORD PTR _i$[ebp]
	shl	ecx, 6
	mov	edx, DWORD PTR _p$[ebp]
	mov	eax, DWORD PTR [edx+128]
	mov	ecx, DWORD PTR [eax+ecx]
	push	ecx
	call	_strtoul
	add	esp, 12					; 0000000cH
	push	eax
	mov	edx, DWORD PTR _p$[ebp]
	push	edx
	mov	eax, DWORD PTR _cx$[ebp]
	push	eax
	call	_CheckPromo
	add	esp, 12					; 0000000cH
	jmp	SHORT $L70857
$L70858:

; 597  : 
; 598  : 	/* Calcul prix plancher de marge */
; 599  : 	if(!cx->no_margemin && !p->no_pv_min)

	mov	ecx, DWORD PTR _cx$[ebp]
	cmp	DWORD PTR [ecx+224], 0
	jne	$L70861
	mov	edx, DWORD PTR _p$[ebp]
	cmp	DWORD PTR [edx+80], 0
	jne	$L70861

; 601  : 		p->pv_min = p->pa * p->qte / (p->no_pv_min ? 1. : (1. - cx->marge_min / 100.));

	mov	eax, DWORD PTR _p$[ebp]
	cmp	DWORD PTR [eax+80], 0
	je	SHORT $L71340
	mov	DWORD PTR -84+[ebp], 0
	mov	DWORD PTR -84+[ebp+4], 1072693248	; 3ff00000H
	jmp	SHORT $L71341
$L71340:
	mov	ecx, DWORD PTR _cx$[ebp]
	fld	QWORD PTR [ecx+216]
	fdiv	QWORD PTR __real@8@4005c800000000000000
	fsubr	QWORD PTR __real@8@3fff8000000000000000
	fstp	QWORD PTR -84+[ebp]
$L71341:
	mov	edx, DWORD PTR _p$[ebp]
	mov	eax, DWORD PTR _p$[ebp]
	mov	ecx, DWORD PTR [eax+4]
	mov	DWORD PTR -92+[ebp], ecx
	mov	DWORD PTR -92+[ebp+4], 0
	fild	QWORD PTR -92+[ebp]
	fmul	QWORD PTR [edx+24]
	fdiv	QWORD PTR -84+[ebp]
	mov	edx, DWORD PTR _p$[ebp]
	fstp	QWORD PTR [edx+64]

; 602  : 		if(p->pxpub) p->pc_max = 100. * (1. - p->pv_min / p->qte / p->pxpub);

	mov	eax, DWORD PTR _p$[ebp]
	fld	QWORD PTR [eax+16]
	fcomp	QWORD PTR __real@8@00000000000000000000
	fnstsw	ax
	test	ah, 64					; 00000040H
	jne	SHORT $L70861
	mov	ecx, DWORD PTR _p$[ebp]
	mov	edx, DWORD PTR _p$[ebp]
	mov	eax, DWORD PTR [edx+4]
	mov	DWORD PTR -100+[ebp], eax
	mov	DWORD PTR -100+[ebp+4], 0
	fild	QWORD PTR -100+[ebp]
	fdivr	QWORD PTR [ecx+64]
	mov	ecx, DWORD PTR _p$[ebp]
	fdiv	QWORD PTR [ecx+16]
	fsubr	QWORD PTR __real@8@3fff8000000000000000
	fmul	QWORD PTR __real@8@4005c800000000000000
	mov	edx, DWORD PTR _p$[ebp]
	fstp	QWORD PTR [edx+72]
$L70861:

; 604  : 
; 605  : 	/* Valeurs cumulées si dans panier */
; 606  : 	if(!p->qte || !id) RETURN_OK;

	mov	eax, DWORD PTR _p$[ebp]
	cmp	DWORD PTR [eax+4], 0
	je	SHORT $L70863
	cmp	DWORD PTR _id$[ebp], 0
	jne	SHORT $L70862
$L70863:
	jmp	$eva_noerr$70864
$L70862:

; 607  : 	d.nbrows = 0;

	mov	DWORD PTR _d$[ebp], 0

; 608  : 	if(dyntab_filter_field(&d, 0, &data, "LONGUEUR", ~0UL, 0) ||
; 609  : 		dyntab_filter_field(&d, 0, &data, "LARGEUR", ~0UL, 0) ||
; 610  : 		dyntab_filter_field(&d, 0, &data, "HAUTEUR", ~0UL, 0) ||
; 611  : 		(d.nbrows && dyntab_group(&d, "NMAX")) ) STACK_ERROR;

	push	0
	push	-1
	push	OFFSET FLAT:$SG70867
	lea	ecx, DWORD PTR _data$[ebp]
	push	ecx
	push	0
	lea	edx, DWORD PTR _d$[ebp]
	push	edx
	call	_dyntab_filter_field
	add	esp, 24					; 00000018H
	test	eax, eax
	jne	SHORT $L70866
	push	0
	push	-1
	push	OFFSET FLAT:$SG70868
	lea	eax, DWORD PTR _data$[ebp]
	push	eax
	push	0
	lea	ecx, DWORD PTR _d$[ebp]
	push	ecx
	call	_dyntab_filter_field
	add	esp, 24					; 00000018H
	test	eax, eax
	jne	SHORT $L70866
	push	0
	push	-1
	push	OFFSET FLAT:$SG70869
	lea	edx, DWORD PTR _data$[ebp]
	push	edx
	push	0
	lea	eax, DWORD PTR _d$[ebp]
	push	eax
	call	_dyntab_filter_field
	add	esp, 24					; 00000018H
	test	eax, eax
	jne	SHORT $L70866
	cmp	DWORD PTR _d$[ebp], 0
	je	SHORT $L70865
	push	OFFSET FLAT:$SG70870
	lea	ecx, DWORD PTR _d$[ebp]
	push	ecx
	call	_dyntab_group
	add	esp, 8
	test	eax, eax
	je	SHORT $L70865
$L70866:
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 611		; 00000263H
	jmp	$eva_err$70798
$L70865:

; 612  : 	if(d.nbrows) p->lmax = atof(dyntab_val(&d, 0, 0));

	cmp	DWORD PTR _d$[ebp], 0
	je	SHORT $L70871
	push	0
	push	0
	lea	eax, DWORD PTR _d$[ebp]
	push	eax
	call	_dyntab_val
	add	esp, 12					; 0000000cH
	push	eax
	call	_atof
	add	esp, 4
	mov	ecx, DWORD PTR _p$[ebp]
	fstp	QWORD PTR [ecx+56]
$L70871:

; 613  : 	if(cx->Lmax < p->lmax) cx->Lmax = p->lmax;

	mov	edx, DWORD PTR _cx$[ebp]
	mov	eax, DWORD PTR _p$[ebp]
	fld	QWORD PTR [edx+176]
	fcomp	QWORD PTR [eax+56]
	fnstsw	ax
	test	ah, 1
	je	SHORT $L70872
	mov	ecx, DWORD PTR _p$[ebp]
	mov	edx, DWORD PTR _cx$[ebp]
	mov	eax, DWORD PTR [ecx+56]
	mov	DWORD PTR [edx+176], eax
	mov	ecx, DWORD PTR [ecx+60]
	mov	DWORD PTR [edx+180], ecx
$L70872:

; 614  : 
; 615  : 	/* Gestion totaux par catégorie et produit */
; 616  : 	for(t = &p->idcat; t; t = t == &p->idcat ? &p->idprod : NULL)

	mov	edx, DWORD PTR _p$[ebp]
	add	edx, 92					; 0000005cH
	mov	DWORD PTR _t$[ebp], edx
	jmp	SHORT $L70874
$L70875:
	mov	eax, DWORD PTR _p$[ebp]
	add	eax, 92					; 0000005cH
	cmp	DWORD PTR _t$[ebp], eax
	jne	SHORT $L71342
	mov	ecx, DWORD PTR _p$[ebp]
	add	ecx, 112				; 00000070H
	mov	DWORD PTR -104+[ebp], ecx
	jmp	SHORT $L71343
$L71342:
	mov	DWORD PTR -104+[ebp], 0
$L71343:
	mov	edx, DWORD PTR -104+[ebp]
	mov	DWORD PTR _t$[ebp], edx
$L70874:
	cmp	DWORD PTR _t$[ebp], 0
	je	$eva_noerr$70864

; 617  : 		for(i = 0; i < t->nbrows; i++)

	mov	DWORD PTR _i$[ebp], 0
	jmp	SHORT $L70877
$L70878:
	mov	eax, DWORD PTR _i$[ebp]
	add	eax, 1
	mov	DWORD PTR _i$[ebp], eax
$L70877:
	mov	ecx, DWORD PTR _t$[ebp]
	mov	edx, DWORD PTR _i$[ebp]
	cmp	edx, DWORD PTR [ecx]
	jae	$L70879

; 619  : 			if(FicheCategorie(cx, &cat, DYNTAB_TOULRC(t, i, 0))) STACK_ERROR;

	push	10					; 0000000aH
	push	0
	push	0
	mov	eax, DWORD PTR _i$[ebp]
	push	eax
	mov	ecx, DWORD PTR _t$[ebp]
	push	ecx
	call	_dyntab_val
	add	esp, 12					; 0000000cH
	push	eax
	call	_strtoul
	add	esp, 12					; 0000000cH
	push	eax
	lea	edx, DWORD PTR _cat$[ebp]
	push	edx
	mov	eax, DWORD PTR _cx$[ebp]
	push	eax
	call	_FicheCategorie
	add	esp, 12					; 0000000cH
	test	eax, eax
	je	SHORT $L70881
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 619		; 0000026bH
	jmp	SHORT $eva_err$70798
$L70881:

; 620  : 			if(cat)

	cmp	DWORD PTR _cat$[ebp], 0
	je	SHORT $L70882

; 622  : 				cat->qte += p->qte;

	mov	edx, DWORD PTR _cat$[ebp]
	mov	eax, DWORD PTR [edx+16]
	mov	ecx, DWORD PTR _p$[ebp]
	add	eax, DWORD PTR [ecx+4]
	mov	edx, DWORD PTR _cat$[ebp]
	mov	DWORD PTR [edx+16], eax

; 623  : 				cat->totHT += p->pxpub * p->qte;

	mov	eax, DWORD PTR _cat$[ebp]
	mov	ecx, DWORD PTR _p$[ebp]
	mov	edx, DWORD PTR _p$[ebp]
	mov	edx, DWORD PTR [edx+4]
	mov	DWORD PTR -112+[ebp], edx
	mov	DWORD PTR -112+[ebp+4], 0
	fild	QWORD PTR -112+[ebp]
	fmul	QWORD PTR [ecx+16]
	fadd	QWORD PTR [eax+8]
	mov	eax, DWORD PTR _cat$[ebp]
	fstp	QWORD PTR [eax+8]
$L70882:

; 625  : 		}

	jmp	$L70878
$L70879:
	jmp	$L70875
$eva_noerr$70864:

; 626  : 
; 627  : 	RETURN_OK_CLEANUP;

	push	0
	push	OFFSET FLAT:$SG70883
	push	OFFSET FLAT:$SG70884
	mov	ecx, DWORD PTR _cntxt$[ebp]
	push	ecx
	call	_err_clear
	add	esp, 16					; 00000010H
$eva_err$70798:
	mov	edx, DWORD PTR _cntxt$[ebp]
	cmp	DWORD PTR [edx+29872], 0
	je	SHORT $L70885
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	ecx, DWORD PTR [eax+29900]
	push	ecx
	push	OFFSET FLAT:$SG70886
	push	OFFSET FLAT:$SG70887
	mov	edx, DWORD PTR _cntxt$[ebp]
	push	edx
	call	_err_add_context
	add	esp, 16					; 00000010H
$L70885:
	lea	eax, DWORD PTR _data$[ebp]
	push	eax
	call	_dyntab_free
	add	esp, 4
	lea	ecx, DWORD PTR _d$[ebp]
	push	ecx
	call	_dyntab_free
	add	esp, 4
	mov	edx, DWORD PTR _cntxt$[ebp]
	xor	eax, eax
	cmp	DWORD PTR [edx+29872], 0
	setne	al

; 628  : }

	mov	esp, ebp
	pop	ebp
	ret	0
_FichePanier ENDP
_TEXT	ENDS
PUBLIC	_CalcRemArt
PUBLIC	__real@8@3ffdff7ced916872b000
PUBLIC	__real@8@3ff8a3d70a3d70a3d800
_DATA	SEGMENT
$SG70904 DB	'Article', 00H
$SG70908 DB	'Magasin', 00H
$SG70917 DB	'Produit', 00H
$SG70928 DB	'???', 00H
$SG70930 DB	'CATALOGUE', 00H
	ORG $+2
$SG70931 DB	'Catalogue', 00H
	ORG $+2
$SG70932 DB	'FAMILLE', 00H
$SG70933 DB	'Famille', 00H
$SG70934 DB	'CATEGORIE', 00H
	ORG $+2
$SG70935 DB	'Cat', 0e9H, 'gorie', 00H
	ORG $+2
$SG70936 DB	'SOUS_CATEGORIE', 00H
	ORG $+1
$SG70937 DB	'SousCat', 0e9H, 'g', 00H
	ORG $+2
$SG70938 DB	'MATIERE', 00H
$SG70939 DB	'Mati', 0e8H, 're', 00H
$SG70953 DB	'CatClient', 00H
	ORG $+2
$SG70964 DB	'CatClient', 00H
	ORG $+2
$SG70967 DB	'Client', 00H
	ORG $+1
$SG70969 DB	'Promo', 00H
	ORG $+2
$SG70978 DB	'D:\Travail\ABI\EVA\V4.0\CGI\Brunix-2016\dll_fap.c', 00H
	ORG $+2
$SG70979 DB	'CalcRemArt', 00H
	ORG $+1
$SG70981 DB	'D:\Travail\ABI\EVA\V4.0\CGI\Brunix-2016\dll_fap.c', 00H
	ORG $+2
$SG70982 DB	'CalcRemArt', 00H
_DATA	ENDS
;	COMDAT __real@8@3ffdff7ced916872b000
; File D:\Travail\ABI\EVA\V4.0\CGI\Brunix-2016\dll_fap.c
CONST	SEGMENT
__real@8@3ffdff7ced916872b000 DQ 03fdfef9db22d0e56r ; 0.499
CONST	ENDS
;	COMDAT __real@8@3ff8a3d70a3d70a3d800
CONST	SEGMENT
__real@8@3ff8a3d70a3d70a3d800 DQ 03f847ae147ae147br ; 0.01
CONST	ENDS
_TEXT	SEGMENT
_cx$ = 8
_p$ = 12
_cntxt$ = -12
_cat$ = -16
_i$ = -4
_j$ = -8
_fld$70926 = -20
_typ$70944 = -32
_idrem$70945 = -28
_idcat$70947 = -24
_idart$70949 = -36
_c$70960 = -40
_CalcRemArt PROC NEAR

; 641  : ){

	push	ebp
	mov	ebp, esp
	sub	esp, 88					; 00000058H
	push	esi

; 642  : 	EVA_context *cntxt = cx->cntxt;

	mov	eax, DWORD PTR _cx$[ebp]
	mov	ecx, DWORD PTR [eax]
	mov	DWORD PTR _cntxt$[ebp], ecx

; 643  : 	Categ *cat = NULL;

	mov	DWORD PTR _cat$[ebp], 0

; 644  : 	unsigned long i, j = 0;

	mov	DWORD PTR _j$[ebp], 0

; 645  : 
; 646  : 	if(p->remart)

	mov	edx, DWORD PTR _p$[ebp]
	cmp	DWORD PTR [edx+88], 0
	je	SHORT $L70902

; 648  : 		/* Remise par article */
; 649  : 		p->pcrem = 0;

	mov	eax, DWORD PTR _p$[ebp]
	mov	DWORD PTR [eax+40], 0
	mov	DWORD PTR [eax+44], 0

; 650  : 		if(CalcRemise(cx, p, p->remart, p->qte, p->pxpub * p->qte, "Article")) STACK_ERROR;

	push	OFFSET FLAT:$SG70904
	mov	ecx, DWORD PTR _p$[ebp]
	mov	edx, DWORD PTR _p$[ebp]
	mov	eax, DWORD PTR [edx+4]
	mov	DWORD PTR -48+[ebp], eax
	mov	DWORD PTR -48+[ebp+4], 0
	fild	QWORD PTR -48+[ebp]
	fmul	QWORD PTR [ecx+16]
	sub	esp, 8
	fstp	QWORD PTR [esp]
	mov	ecx, DWORD PTR _p$[ebp]
	mov	edx, DWORD PTR [ecx+4]
	push	edx
	mov	eax, DWORD PTR _p$[ebp]
	mov	ecx, DWORD PTR [eax+88]
	push	ecx
	mov	edx, DWORD PTR _p$[ebp]
	push	edx
	mov	eax, DWORD PTR _cx$[ebp]
	push	eax
	call	_CalcRemise
	add	esp, 28					; 0000001cH
	test	eax, eax
	je	SHORT $L70903
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 650		; 0000028aH
	jmp	$eva_err$70905
$L70903:

; 652  : 	else

	jmp	$L70968
$L70902:

; 654  : 		/* Remise autre que par article : recherche du meilleur prix */
; 655  : 
; 656  : 		/* Remise globale */
; 657  : 		if(!cx->no_rsecata && cx->idrem &&
; 658  : 			CalcRemise(cx, p, cx->idrem, cx->totQTE, cx->totHrem, "Magasin")) STACK_ERROR;

	mov	edx, DWORD PTR _cx$[ebp]
	cmp	DWORD PTR [edx+228], 0
	jne	SHORT $L70907
	mov	eax, DWORD PTR _cx$[ebp]
	cmp	DWORD PTR [eax+4], 0
	je	SHORT $L70907
	push	OFFSET FLAT:$SG70908
	mov	ecx, DWORD PTR _cx$[ebp]
	mov	edx, DWORD PTR [ecx+148]
	push	edx
	mov	eax, DWORD PTR [ecx+144]
	push	eax
	mov	ecx, DWORD PTR _cx$[ebp]
	mov	edx, DWORD PTR [ecx+128]
	push	edx
	mov	eax, DWORD PTR _cx$[ebp]
	mov	ecx, DWORD PTR [eax+4]
	push	ecx
	mov	edx, DWORD PTR _p$[ebp]
	push	edx
	mov	eax, DWORD PTR _cx$[ebp]
	push	eax
	call	_CalcRemise
	add	esp, 28					; 0000001cH
	test	eax, eax
	je	SHORT $L70907
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 658		; 00000292H
	jmp	$eva_err$70905
$L70907:

; 659  : 
; 660  : 		/* Remise par produit */
; 661  : 		if(!cx->no_rsecata) for(i= 0; i < p->idprod.nbrows; i++)

	mov	edx, DWORD PTR _cx$[ebp]
	cmp	DWORD PTR [edx+228], 0
	jne	$L70912
	mov	DWORD PTR _i$[ebp], 0
	jmp	SHORT $L70910
$L70911:
	mov	eax, DWORD PTR _i$[ebp]
	add	eax, 1
	mov	DWORD PTR _i$[ebp], eax
$L70910:
	mov	ecx, DWORD PTR _p$[ebp]
	mov	edx, DWORD PTR _i$[ebp]
	cmp	edx, DWORD PTR [ecx+112]
	jae	$L70912

; 663  : 			if(FicheCategorie(cx, &cat, DYNTAB_TOULRC(&p->idprod, i, 0))) STACK_ERROR;

	push	10					; 0000000aH
	push	0
	push	0
	mov	eax, DWORD PTR _i$[ebp]
	push	eax
	mov	ecx, DWORD PTR _p$[ebp]
	add	ecx, 112				; 00000070H
	push	ecx
	call	_dyntab_val
	add	esp, 12					; 0000000cH
	push	eax
	call	_strtoul
	add	esp, 12					; 0000000cH
	push	eax
	lea	edx, DWORD PTR _cat$[ebp]
	push	edx
	mov	eax, DWORD PTR _cx$[ebp]
	push	eax
	call	_FicheCategorie
	add	esp, 12					; 0000000cH
	test	eax, eax
	je	SHORT $L70914
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 663		; 00000297H
	jmp	$eva_err$70905
$L70914:

; 664  : 			if(cat && cat->idrem)

	cmp	DWORD PTR _cat$[ebp], 0
	je	SHORT $L70918
	mov	edx, DWORD PTR _cat$[ebp]
	cmp	DWORD PTR [edx+4], 0
	je	SHORT $L70918

; 666  : 				if(CalcRemise(cx, p, cat->idrem, cat->qte, cat->totHT, "Produit")) STACK_ERROR;

	push	OFFSET FLAT:$SG70917
	mov	eax, DWORD PTR _cat$[ebp]
	mov	ecx, DWORD PTR [eax+12]
	push	ecx
	mov	edx, DWORD PTR [eax+8]
	push	edx
	mov	eax, DWORD PTR _cat$[ebp]
	mov	ecx, DWORD PTR [eax+16]
	push	ecx
	mov	edx, DWORD PTR _cat$[ebp]
	mov	eax, DWORD PTR [edx+4]
	push	eax
	mov	ecx, DWORD PTR _p$[ebp]
	push	ecx
	mov	edx, DWORD PTR _cx$[ebp]
	push	edx
	call	_CalcRemise
	add	esp, 28					; 0000001cH
	test	eax, eax
	je	SHORT $L70916
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 666		; 0000029aH
	jmp	$eva_err$70905
$L70916:

; 667  : 				if(p->b_rem) p->idcatrem = cat->id;

	mov	ecx, DWORD PTR _p$[ebp]
	cmp	DWORD PTR [ecx+152], 0
	je	SHORT $L70918
	mov	edx, DWORD PTR _p$[ebp]
	mov	eax, DWORD PTR _cat$[ebp]
	mov	ecx, DWORD PTR [eax]
	mov	DWORD PTR [edx+136], ecx
$L70918:

; 669  : 		}

	jmp	$L70911
$L70912:

; 670  : 
; 671  : 		/* Remise par categorie */
; 672  : 		if(!cx->no_rsecata) for(i= 0; i < p->idcat.nbrows; i++)

	mov	edx, DWORD PTR _cx$[ebp]
	cmp	DWORD PTR [edx+228], 0
	jne	$L70922
	mov	DWORD PTR _i$[ebp], 0
	jmp	SHORT $L70920
$L70921:
	mov	eax, DWORD PTR _i$[ebp]
	add	eax, 1
	mov	DWORD PTR _i$[ebp], eax
$L70920:
	mov	ecx, DWORD PTR _p$[ebp]
	mov	edx, DWORD PTR _i$[ebp]
	cmp	edx, DWORD PTR [ecx+92]
	jae	$L70922

; 674  : 			if(FicheCategorie(cx, &cat, DYNTAB_TOULRC(&p->idcat, i, 0))) STACK_ERROR;

	push	10					; 0000000aH
	push	0
	push	0
	mov	eax, DWORD PTR _i$[ebp]
	push	eax
	mov	ecx, DWORD PTR _p$[ebp]
	add	ecx, 92					; 0000005cH
	push	ecx
	call	_dyntab_val
	add	esp, 12					; 0000000cH
	push	eax
	call	_strtoul
	add	esp, 12					; 0000000cH
	push	eax
	lea	edx, DWORD PTR _cat$[ebp]
	push	edx
	mov	eax, DWORD PTR _cx$[ebp]
	push	eax
	call	_FicheCategorie
	add	esp, 12					; 0000000cH
	test	eax, eax
	je	SHORT $L70924
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 674		; 000002a2H
	jmp	$eva_err$70905
$L70924:

; 675  : 			if(cat && cat->idrem)

	cmp	DWORD PTR _cat$[ebp], 0
	je	$L70940
	mov	edx, DWORD PTR _cat$[ebp]
	cmp	DWORD PTR [edx+4], 0
	je	$L70940

; 677  : 				char *fld = dyntab_cell(&p->idcat, i, 0)->field;

	push	0
	mov	eax, DWORD PTR _i$[ebp]
	push	eax
	mov	ecx, DWORD PTR _p$[ebp]
	add	ecx, 92					; 0000005cH
	push	ecx
	call	_dyntab_cell
	add	esp, 12					; 0000000cH
	mov	edx, DWORD PTR [eax+8]
	mov	DWORD PTR _fld$70926[ebp], edx

; 678  : 				if(!fld) fld = "???";

	cmp	DWORD PTR _fld$70926[ebp], 0
	jne	SHORT $L70927
	mov	DWORD PTR _fld$70926[ebp], OFFSET FLAT:$SG70928
$L70927:

; 679  : 				if(CalcRemise(cx, p, cat->idrem, cat->qte, cat->totHT,
; 680  : 								!strcmp(fld, "CATALOGUE") ? "Catalogue" :
; 681  : 								!strcmp(fld, "FAMILLE") ? "Famille" :
; 682  : 								!strcmp(fld, "CATEGORIE") ? "Catégorie" :
; 683  : 								!strcmp(fld, "SOUS_CATEGORIE") ? "SousCatég" :
; 684  : 								!strcmp(fld, "MATIERE") ? "Matière" :
; 685  : 								fld)) STACK_ERROR;

	push	OFFSET FLAT:$SG70930
	mov	eax, DWORD PTR _fld$70926[ebp]
	push	eax
	call	_strcmp
	add	esp, 8
	test	eax, eax
	jne	SHORT $L71353
	mov	DWORD PTR -52+[ebp], OFFSET FLAT:$SG70931
	jmp	$L71354
$L71353:
	push	OFFSET FLAT:$SG70932
	mov	ecx, DWORD PTR _fld$70926[ebp]
	push	ecx
	call	_strcmp
	add	esp, 8
	test	eax, eax
	jne	SHORT $L71351
	mov	DWORD PTR -56+[ebp], OFFSET FLAT:$SG70933
	jmp	SHORT $L71352
$L71351:
	push	OFFSET FLAT:$SG70934
	mov	edx, DWORD PTR _fld$70926[ebp]
	push	edx
	call	_strcmp
	add	esp, 8
	test	eax, eax
	jne	SHORT $L71349
	mov	DWORD PTR -60+[ebp], OFFSET FLAT:$SG70935
	jmp	SHORT $L71350
$L71349:
	push	OFFSET FLAT:$SG70936
	mov	eax, DWORD PTR _fld$70926[ebp]
	push	eax
	call	_strcmp
	add	esp, 8
	test	eax, eax
	jne	SHORT $L71347
	mov	DWORD PTR -64+[ebp], OFFSET FLAT:$SG70937
	jmp	SHORT $L71348
$L71347:
	push	OFFSET FLAT:$SG70938
	mov	ecx, DWORD PTR _fld$70926[ebp]
	push	ecx
	call	_strcmp
	add	esp, 8
	test	eax, eax
	jne	SHORT $L71345
	mov	DWORD PTR -68+[ebp], OFFSET FLAT:$SG70939
	jmp	SHORT $L71346
$L71345:
	mov	edx, DWORD PTR _fld$70926[ebp]
	mov	DWORD PTR -68+[ebp], edx
$L71346:
	mov	eax, DWORD PTR -68+[ebp]
	mov	DWORD PTR -64+[ebp], eax
$L71348:
	mov	ecx, DWORD PTR -64+[ebp]
	mov	DWORD PTR -60+[ebp], ecx
$L71350:
	mov	edx, DWORD PTR -60+[ebp]
	mov	DWORD PTR -56+[ebp], edx
$L71352:
	mov	eax, DWORD PTR -56+[ebp]
	mov	DWORD PTR -52+[ebp], eax
$L71354:
	mov	ecx, DWORD PTR -52+[ebp]
	push	ecx
	mov	edx, DWORD PTR _cat$[ebp]
	mov	eax, DWORD PTR [edx+12]
	push	eax
	mov	ecx, DWORD PTR [edx+8]
	push	ecx
	mov	edx, DWORD PTR _cat$[ebp]
	mov	eax, DWORD PTR [edx+16]
	push	eax
	mov	ecx, DWORD PTR _cat$[ebp]
	mov	edx, DWORD PTR [ecx+4]
	push	edx
	mov	eax, DWORD PTR _p$[ebp]
	push	eax
	mov	ecx, DWORD PTR _cx$[ebp]
	push	ecx
	call	_CalcRemise
	add	esp, 28					; 0000001cH
	test	eax, eax
	je	SHORT $L70929
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 685		; 000002adH
	jmp	$eva_err$70905
$L70929:

; 686  : 				if(p->b_rem) p->idcatrem = cat->id;

	mov	eax, DWORD PTR _p$[ebp]
	cmp	DWORD PTR [eax+152], 0
	je	SHORT $L70940
	mov	ecx, DWORD PTR _p$[ebp]
	mov	edx, DWORD PTR _cat$[ebp]
	mov	eax, DWORD PTR [edx]
	mov	DWORD PTR [ecx+136], eax
$L70940:

; 688  : 		}

	jmp	$L70921
$L70922:

; 689  : 
; 690  : 		/* Remise par catalogue - compte client */
; 691  : 		for(i= 0; i < cx->typremcat.nbrows; i++)

	mov	DWORD PTR _i$[ebp], 0
	jmp	SHORT $L70941
$L70942:
	mov	ecx, DWORD PTR _i$[ebp]
	add	ecx, 1
	mov	DWORD PTR _i$[ebp], ecx
$L70941:
	mov	edx, DWORD PTR _cx$[ebp]
	mov	eax, DWORD PTR _i$[ebp]
	cmp	eax, DWORD PTR [edx+108]
	jae	$L70943

; 693  : 			char *typ = dyntab_val(&cx->typremcat, i, 0);

	push	0
	mov	ecx, DWORD PTR _i$[ebp]
	push	ecx
	mov	edx, DWORD PTR _cx$[ebp]
	add	edx, 108				; 0000006cH
	push	edx
	call	_dyntab_val
	add	esp, 12					; 0000000cH
	mov	DWORD PTR _typ$70944[ebp], eax

; 694  : 			unsigned long idrem = DYNTAB_TOULRC(&cx->remcat, i, 0);

	push	10					; 0000000aH
	push	0
	push	0
	mov	eax, DWORD PTR _i$[ebp]
	push	eax
	mov	ecx, DWORD PTR _cx$[ebp]
	add	ecx, 88					; 00000058H
	push	ecx
	call	_dyntab_val
	add	esp, 12					; 0000000cH
	push	eax
	call	_strtoul
	add	esp, 12					; 0000000cH
	mov	DWORD PTR _idrem$70945[ebp], eax

; 695  : 			unsigned long idcat = DYNTAB_TOULRC(&cx->usrcat, i, 0);

	push	10					; 0000000aH
	push	0
	push	0
	mov	edx, DWORD PTR _i$[ebp]
	push	edx
	mov	eax, DWORD PTR _cx$[ebp]
	add	eax, 48					; 00000030H
	push	eax
	call	_dyntab_val
	add	esp, 12					; 0000000cH
	push	eax
	call	_strtoul
	add	esp, 12					; 0000000cH
	mov	DWORD PTR _idcat$70947[ebp], eax

; 696  : 			unsigned long idart = DYNTAB_TOULRC(&cx->usrart, i, 0);

	push	10					; 0000000aH
	push	0
	push	0
	mov	ecx, DWORD PTR _i$[ebp]
	push	ecx
	mov	edx, DWORD PTR _cx$[ebp]
	add	edx, 68					; 00000044H
	push	edx
	call	_dyntab_val
	add	esp, 12					; 0000000cH
	push	eax
	call	_strtoul
	add	esp, 12					; 0000000cH
	mov	DWORD PTR _idart$70949[ebp], eax

; 697  : 			if(*typ == '1')

	mov	eax, DWORD PTR _typ$70944[ebp]
	movsx	ecx, BYTE PTR [eax]
	cmp	ecx, 49					; 00000031H
	jne	SHORT $L70951

; 699  : 				/* Remise spécifique sur un article */
; 700  : 				if(idart == p->idart && CalcRemise(cx, p, idrem, 0, 0, "CatClient")) STACK_ERROR;

	mov	edx, DWORD PTR _p$[ebp]
	mov	eax, DWORD PTR _idart$70949[ebp]
	cmp	eax, DWORD PTR [edx+8]
	jne	SHORT $L70952
	push	OFFSET FLAT:$SG70953
	push	0
	push	0
	push	0
	mov	ecx, DWORD PTR _idrem$70945[ebp]
	push	ecx
	mov	edx, DWORD PTR _p$[ebp]
	push	edx
	mov	eax, DWORD PTR _cx$[ebp]
	push	eax
	call	_CalcRemise
	add	esp, 28					; 0000001cH
	test	eax, eax
	je	SHORT $L70952
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 700		; 000002bcH
	jmp	$eva_err$70905
$L70952:

; 702  : 			else

	jmp	$L70959
$L70951:

; 704  : 				/* Remise spécifique famille / catalogue */
; 705  : 				if(FicheCategorie(cx, &cat, idcat)) STACK_ERROR;

	mov	edx, DWORD PTR _idcat$70947[ebp]
	push	edx
	lea	eax, DWORD PTR _cat$[ebp]
	push	eax
	mov	ecx, DWORD PTR _cx$[ebp]
	push	ecx
	call	_FicheCategorie
	add	esp, 12					; 0000000cH
	test	eax, eax
	je	SHORT $L70955
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 705		; 000002c1H
	jmp	$eva_err$70905
$L70955:

; 706  : 				if(cat) for(j = 0; j < p->idcat.nbrows; j++)

	cmp	DWORD PTR _cat$[ebp], 0
	je	$L70959
	mov	DWORD PTR _j$[ebp], 0
	jmp	SHORT $L70957
$L70958:
	mov	eax, DWORD PTR _j$[ebp]
	add	eax, 1
	mov	DWORD PTR _j$[ebp], eax
$L70957:
	mov	ecx, DWORD PTR _p$[ebp]
	mov	edx, DWORD PTR _j$[ebp]
	cmp	edx, DWORD PTR [ecx+92]
	jae	$L70959

; 708  : 					DynTableCell *c = dyntab_cell(&p->idcat, j, 0);

	push	0
	mov	eax, DWORD PTR _j$[ebp]
	push	eax
	mov	ecx, DWORD PTR _p$[ebp]
	add	ecx, 92					; 0000005cH
	push	ecx
	call	_dyntab_cell
	add	esp, 12					; 0000000cH
	mov	DWORD PTR _c$70960[ebp], eax

; 709  : 					if(strtoul(c->txt, NULL, 10) == cat->id)

	push	10					; 0000000aH
	push	0
	mov	edx, DWORD PTR _c$70960[ebp]
	mov	eax, DWORD PTR [edx]
	push	eax
	call	_strtoul
	add	esp, 12					; 0000000cH
	mov	ecx, DWORD PTR _cat$[ebp]
	cmp	eax, DWORD PTR [ecx]
	jne	SHORT $L70965

; 711  : 						if(CalcRemise(cx, p, idrem, cat->qte, cat->totHT, "CatClient")) STACK_ERROR;

	push	OFFSET FLAT:$SG70964
	mov	edx, DWORD PTR _cat$[ebp]
	mov	eax, DWORD PTR [edx+12]
	push	eax
	mov	ecx, DWORD PTR [edx+8]
	push	ecx
	mov	edx, DWORD PTR _cat$[ebp]
	mov	eax, DWORD PTR [edx+16]
	push	eax
	mov	ecx, DWORD PTR _idrem$70945[ebp]
	push	ecx
	mov	edx, DWORD PTR _p$[ebp]
	push	edx
	mov	eax, DWORD PTR _cx$[ebp]
	push	eax
	call	_CalcRemise
	add	esp, 28					; 0000001cH
	test	eax, eax
	je	SHORT $L70963
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 711		; 000002c7H
	jmp	$eva_err$70905
$L70963:

; 712  : 						if(p->b_rem) p->idcatrem = cat->id;

	mov	edx, DWORD PTR _p$[ebp]
	cmp	DWORD PTR [edx+152], 0
	je	SHORT $L70965
	mov	eax, DWORD PTR _p$[ebp]
	mov	ecx, DWORD PTR _cat$[ebp]
	mov	edx, DWORD PTR [ecx]
	mov	DWORD PTR [eax+136], edx
$L70965:

; 714  : 				}

	jmp	$L70958
$L70959:

; 716  : 		}

	jmp	$L70942
$L70943:

; 717  : 
; 718  : 		/* Remise client */
; 719  : 		if(cx->u_pcrem) AjoutPrix(cx, p, 0, 1, 0, cx->u_pcrem, "Client", 3);

	mov	eax, DWORD PTR _cx$[ebp]
	cmp	DWORD PTR [eax+16], 0
	je	SHORT $L70966
	push	3
	push	OFFSET FLAT:$SG70967
	mov	ecx, DWORD PTR _cx$[ebp]
	mov	edx, DWORD PTR [ecx+16]
	mov	DWORD PTR -76+[ebp], edx
	mov	DWORD PTR -76+[ebp+4], 0
	fild	QWORD PTR -76+[ebp]
	sub	esp, 8
	fstp	QWORD PTR [esp]
	push	0
	push	0
	push	1
	push	0
	mov	eax, DWORD PTR _p$[ebp]
	push	eax
	mov	ecx, DWORD PTR _cx$[ebp]
	push	ecx
	call	_AjoutPrix
	add	esp, 40					; 00000028H
$L70966:

; 720  : 
; 721  : 		/* Remise code promo */
; 722  : 		if(cx->pc_promo && p->b_promo) AjoutPrix(cx, p, 0, 1, 0, cx->pc_promo, "Promo", 2);

	mov	edx, DWORD PTR _cx$[ebp]
	fld	QWORD PTR [edx+232]
	fcomp	QWORD PTR __real@8@00000000000000000000
	fnstsw	ax
	test	ah, 64					; 00000040H
	jne	SHORT $L70968
	mov	eax, DWORD PTR _p$[ebp]
	cmp	DWORD PTR [eax+148], 0
	je	SHORT $L70968
	push	2
	push	OFFSET FLAT:$SG70969
	mov	ecx, DWORD PTR _cx$[ebp]
	mov	edx, DWORD PTR [ecx+236]
	push	edx
	mov	eax, DWORD PTR [ecx+232]
	push	eax
	push	0
	push	0
	push	1
	push	0
	mov	ecx, DWORD PTR _p$[ebp]
	push	ecx
	mov	edx, DWORD PTR _cx$[ebp]
	push	edx
	call	_AjoutPrix
	add	esp, 40					; 00000028H
$L70968:

; 724  : 
; 725  : 	/* Tri tableau de prix */
; 726  : 	if(p->nbprix)

	mov	eax, DWORD PTR _p$[ebp]
	cmp	DWORD PTR [eax+144], 0
	je	$L70975

; 728  : 		qsort(p->tabprix, p->nbprix, sizeof(Prix), qsort_tabprix);

	push	OFFSET FLAT:_qsort_tabprix
	push	32					; 00000020H
	mov	ecx, DWORD PTR _p$[ebp]
	mov	edx, DWORD PTR [ecx+144]
	push	edx
	mov	eax, DWORD PTR _p$[ebp]
	mov	ecx, DWORD PTR [eax+140]
	push	ecx
	call	_qsort
	add	esp, 16					; 00000010H

; 729  : 		for(i = p->nbprix - 1; i && !p->tabprix[i].b_sel; i--);

	mov	edx, DWORD PTR _p$[ebp]
	mov	eax, DWORD PTR [edx+144]
	sub	eax, 1
	mov	DWORD PTR _i$[ebp], eax
	jmp	SHORT $L70972
$L70973:
	mov	ecx, DWORD PTR _i$[ebp]
	sub	ecx, 1
	mov	DWORD PTR _i$[ebp], ecx
$L70972:
	cmp	DWORD PTR _i$[ebp], 0
	je	SHORT $L70974
	mov	edx, DWORD PTR _i$[ebp]
	shl	edx, 5
	mov	eax, DWORD PTR _p$[ebp]
	mov	ecx, DWORD PTR [eax+140]
	cmp	DWORD PTR [ecx+edx+28], 0
	jne	SHORT $L70974
	jmp	SHORT $L70973
$L70974:

; 730  : 		if(p->tabprix[i].b_sel)

	mov	edx, DWORD PTR _i$[ebp]
	shl	edx, 5
	mov	eax, DWORD PTR _p$[ebp]
	mov	ecx, DWORD PTR [eax+140]
	cmp	DWORD PTR [ecx+edx+28], 0
	je	SHORT $L70975

; 732  : 			p->idrem = p->tabprix[i].idrem;

	mov	edx, DWORD PTR _i$[ebp]
	shl	edx, 5
	mov	eax, DWORD PTR _p$[ebp]
	mov	ecx, DWORD PTR [eax+140]
	mov	eax, DWORD PTR _p$[ebp]
	mov	ecx, DWORD PTR [ecx+edx]
	mov	DWORD PTR [eax+132], ecx

; 733  : 			p->pcrem = p->tabprix[i].pcrem;

	mov	edx, DWORD PTR _i$[ebp]
	shl	edx, 5
	mov	eax, DWORD PTR _p$[ebp]
	mov	ecx, DWORD PTR [eax+140]
	mov	eax, DWORD PTR _p$[ebp]
	mov	esi, DWORD PTR [ecx+edx+16]
	mov	DWORD PTR [eax+40], esi
	mov	ecx, DWORD PTR [ecx+edx+20]
	mov	DWORD PTR [eax+44], ecx

; 734  : 			p->meth = p->tabprix[i].meth;

	mov	edx, DWORD PTR _i$[ebp]
	shl	edx, 5
	mov	eax, DWORD PTR _p$[ebp]
	mov	ecx, DWORD PTR [eax+140]
	mov	eax, DWORD PTR _p$[ebp]
	mov	ecx, DWORD PTR [ecx+edx+24]
	mov	DWORD PTR [eax+84], ecx

; 735  : 			p->b_rem = 1;

	mov	edx, DWORD PTR _p$[ebp]
	mov	DWORD PTR [edx+152], 1
$L70975:

; 738  : 
; 739  : 	/* Calcul prix de vente avant plancher */
; 740  : 	p->pv = p->pxpub * (1. - p->pcrem / 100.) * p->qte;

	mov	eax, DWORD PTR _p$[ebp]
	mov	ecx, DWORD PTR _p$[ebp]
	fld	QWORD PTR [ecx+40]
	fdiv	QWORD PTR __real@8@4005c800000000000000
	fsubr	QWORD PTR __real@8@3fff8000000000000000
	fmul	QWORD PTR [eax+16]
	mov	edx, DWORD PTR _p$[ebp]
	mov	eax, DWORD PTR [edx+4]
	mov	DWORD PTR -84+[ebp], eax
	mov	DWORD PTR -84+[ebp+4], 0
	fild	QWORD PTR -84+[ebp]
	fmulp	ST(1), ST(0)
	mov	ecx, DWORD PTR _p$[ebp]
	fstp	QWORD PTR [ecx+32]

; 741  : 
; 742  : 	/* Prix de vente arrondi à 2 décimales */
; 743  : 	p->pv = 0.01 * (int)(p->pv * 100. + 0.499);

	mov	edx, DWORD PTR _p$[ebp]
	fld	QWORD PTR [edx+32]
	fmul	QWORD PTR __real@8@4005c800000000000000
	fadd	QWORD PTR __real@8@3ffdff7ced916872b000
	call	__ftol
	mov	DWORD PTR -88+[ebp], eax
	fild	DWORD PTR -88+[ebp]
	fmul	QWORD PTR __real@8@3ff8a3d70a3d70a3d800
	mov	eax, DWORD PTR _p$[ebp]
	fstp	QWORD PTR [eax+32]
$eva_noerr$70977:

; 744  : 
; 745  : 	RETURN_OK_CLEANUP;

	push	0
	push	OFFSET FLAT:$SG70978
	push	OFFSET FLAT:$SG70979
	mov	ecx, DWORD PTR _cntxt$[ebp]
	push	ecx
	call	_err_clear
	add	esp, 16					; 00000010H
$eva_err$70905:
	mov	edx, DWORD PTR _cntxt$[ebp]
	cmp	DWORD PTR [edx+29872], 0
	je	SHORT $L70980
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	ecx, DWORD PTR [eax+29900]
	push	ecx
	push	OFFSET FLAT:$SG70981
	push	OFFSET FLAT:$SG70982
	mov	edx, DWORD PTR _cntxt$[ebp]
	push	edx
	call	_err_add_context
	add	esp, 16					; 00000010H
$L70980:
	mov	eax, DWORD PTR _cntxt$[ebp]
	xor	ecx, ecx
	cmp	DWORD PTR [eax+29872], 0
	setne	cl
	mov	eax, ecx

; 746  : }

	pop	esi
	mov	esp, ebp
	pop	ebp
	ret	0
_CalcRemArt ENDP
_TEXT	ENDS
PUBLIC	_CalcPvArt
_DATA	SEGMENT
	ORG $+1
$SG71001 DB	',', 00H
	ORG $+2
$SG71003 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG71006 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG71009 DB	'D:\Travail\ABI\EVA\V4.0\CGI\Brunix-2016\dll_fap.c', 00H
	ORG $+2
$SG71010 DB	'CalcPvArt', 00H
	ORG $+2
$SG71012 DB	'D:\Travail\ABI\EVA\V4.0\CGI\Brunix-2016\dll_fap.c', 00H
	ORG $+2
$SG71013 DB	'CalcPvArt', 00H
_DATA	ENDS
_TEXT	SEGMENT
_cx$ = 8
_p$ = 12
_cntxt$ = -4
_CalcPvArt PROC NEAR

; 759  : ){

	push	ebp
	mov	ebp, esp
	sub	esp, 28					; 0000001cH

; 760  : 	EVA_context *cntxt = cx->cntxt;

	mov	eax, DWORD PTR _cx$[ebp]
	mov	ecx, DWORD PTR [eax]
	mov	DWORD PTR _cntxt$[ebp], ecx

; 761  : 
; 762  : 	/* Calcule le prix et les remises si nécessaire */
; 763  : 	if(p->pv)

	mov	edx, DWORD PTR _p$[ebp]
	fld	QWORD PTR [edx+32]
	fcomp	QWORD PTR __real@8@00000000000000000000
	fnstsw	ax
	test	ah, 64					; 00000040H
	jne	SHORT $L70993

; 765  : 		p->pcrem = (1 - p->pv / p->pxpub / p->qte) * 100;

	mov	eax, DWORD PTR _p$[ebp]
	mov	ecx, DWORD PTR _p$[ebp]
	fld	QWORD PTR [eax+32]
	fdiv	QWORD PTR [ecx+16]
	mov	edx, DWORD PTR _p$[ebp]
	mov	eax, DWORD PTR [edx+4]
	mov	DWORD PTR -12+[ebp], eax
	mov	DWORD PTR -12+[ebp+4], 0
	fild	QWORD PTR -12+[ebp]
	fdivp	ST(1), ST(0)
	fsubr	QWORD PTR __real@8@3fff8000000000000000
	fmul	QWORD PTR __real@8@4005c800000000000000
	mov	ecx, DWORD PTR _p$[ebp]
	fstp	QWORD PTR [ecx+40]

; 767  : 	else if(CalcRemArt(cx, p)) STACK_ERROR;

	jmp	SHORT $L70995
$L70993:
	mov	edx, DWORD PTR _p$[ebp]
	push	edx
	mov	eax, DWORD PTR _cx$[ebp]
	push	eax
	call	_CalcRemArt
	add	esp, 8
	test	eax, eax
	je	SHORT $L70995
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 767		; 000002ffH
	jmp	$eva_err$70996
$L70995:

; 768  : 
; 769  : 	/* Totaux */
; 770  : 	if(p->id && p->qte)

	mov	edx, DWORD PTR _p$[ebp]
	cmp	DWORD PTR [edx], 0
	je	$L71007
	mov	eax, DWORD PTR _p$[ebp]
	cmp	DWORD PTR [eax+4], 0
	je	$L71007

; 772  : 		cx->totHT += p->pv;

	mov	ecx, DWORD PTR _cx$[ebp]
	mov	edx, DWORD PTR _p$[ebp]
	fld	QWORD PTR [ecx+136]
	fadd	QWORD PTR [edx+32]
	mov	eax, DWORD PTR _cx$[ebp]
	fstp	QWORD PTR [eax+136]

; 773  : 		cx->totPoids += p->poids * p->qte;

	mov	ecx, DWORD PTR _cx$[ebp]
	mov	edx, DWORD PTR _p$[ebp]
	mov	eax, DWORD PTR _p$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	DWORD PTR -20+[ebp], eax
	mov	DWORD PTR -20+[ebp+4], 0
	fild	QWORD PTR -20+[ebp]
	fmul	QWORD PTR [edx+48]
	fadd	QWORD PTR [ecx+168]
	mov	ecx, DWORD PTR _cx$[ebp]
	fstp	QWORD PTR [ecx+168]

; 774  : 		if(cx->idart) DYNBUF_ADD_STR(&cx->idart, ",");

	mov	edx, DWORD PTR _cx$[ebp]
	cmp	DWORD PTR [edx+208], 0
	je	SHORT $L71000
	push	0
	push	0
	push	1
	push	OFFSET FLAT:$SG71001
	mov	eax, DWORD PTR _cx$[ebp]
	add	eax, 208				; 000000d0H
	push	eax
	call	_dynbuf_add
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L71000
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29872], OFFSET FLAT:$SG71003
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 774		; 00000306H
	jmp	$eva_err$70996
$L71000:

; 775  : 		DYNBUF_ADD_INT(&cx->idart, p->idart);

	mov	eax, DWORD PTR _p$[ebp]
	mov	ecx, DWORD PTR [eax+8]
	push	ecx
	mov	edx, DWORD PTR _cx$[ebp]
	add	edx, 208				; 000000d0H
	push	edx
	call	_dynbuf_add_int
	add	esp, 8
	test	eax, eax
	je	SHORT $L71004
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29872], OFFSET FLAT:$SG71006
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 775		; 00000307H
	jmp	SHORT $eva_err$70996
$L71004:

; 776  : 		if(p->pa)

	mov	edx, DWORD PTR _p$[ebp]
	fld	QWORD PTR [edx+24]
	fcomp	QWORD PTR __real@8@00000000000000000000
	fnstsw	ax
	test	ah, 64					; 00000040H
	jne	SHORT $L71007

; 778  : 			cx->totPV += p->pv;

	mov	eax, DWORD PTR _cx$[ebp]
	mov	ecx, DWORD PTR _p$[ebp]
	fld	QWORD PTR [eax+152]
	fadd	QWORD PTR [ecx+32]
	mov	edx, DWORD PTR _cx$[ebp]
	fstp	QWORD PTR [edx+152]

; 779  : 			cx->totPA += p->pa * p->qte;

	mov	eax, DWORD PTR _cx$[ebp]
	mov	ecx, DWORD PTR _p$[ebp]
	mov	edx, DWORD PTR _p$[ebp]
	mov	edx, DWORD PTR [edx+4]
	mov	DWORD PTR -28+[ebp], edx
	mov	DWORD PTR -28+[ebp+4], 0
	fild	QWORD PTR -28+[ebp]
	fmul	QWORD PTR [ecx+24]
	fadd	QWORD PTR [eax+160]
	mov	eax, DWORD PTR _cx$[ebp]
	fstp	QWORD PTR [eax+160]
$L71007:
$eva_noerr$71008:

; 782  : 
; 783  : 	RETURN_OK_CLEANUP;

	push	0
	push	OFFSET FLAT:$SG71009
	push	OFFSET FLAT:$SG71010
	mov	ecx, DWORD PTR _cntxt$[ebp]
	push	ecx
	call	_err_clear
	add	esp, 16					; 00000010H
$eva_err$70996:
	mov	edx, DWORD PTR _cntxt$[ebp]
	cmp	DWORD PTR [edx+29872], 0
	je	SHORT $L71011
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	ecx, DWORD PTR [eax+29900]
	push	ecx
	push	OFFSET FLAT:$SG71012
	push	OFFSET FLAT:$SG71013
	mov	edx, DWORD PTR _cntxt$[ebp]
	push	edx
	call	_err_add_context
	add	esp, 16					; 00000010H
$L71011:
	mov	eax, DWORD PTR _cntxt$[ebp]
	xor	ecx, ecx
	cmp	DWORD PTR [eax+29872], 0
	setne	cl
	mov	eax, ecx

; 784  : }

	mov	esp, ebp
	pop	ebp
	ret	0
_CalcPvArt ENDP
_TEXT	ENDS
PUBLIC	_LirePanier
PUBLIC	__real@8@4002a000000000000000
PUBLIC	__real@8@4005be00000000000000
EXTRN	_dyntab_order_lines:NEAR
_BSS	SEGMENT
	ALIGN	4

_?tcx@?1??LirePanier@@9@9 DD 01H DUP (?)
_?nbcx@?1??LirePanier@@9@9 DD 01H DUP (?)
_?tmp@?1??LirePanier@@9@9 DB 0a0H DUP (?)
$SG71046 DB	01H DUP (?)
_BSS	ENDS
_DATA	SEGMENT
	ORG $+2
$SG71045 DB	'_EVA_LABEL', 00H
	ORG $+1
$SG71051 DB	'Session utilisateur', 00H
$SG71052 DB	'Contenu d''un panier', 00H
$SG71055 DB	'PANIER_SESSION', 00H
	ORG $+1
$SG71057 DB	'PANIER_SESSION', 00H
	ORG $+1
$SG71060 DB	'MODE_TARIF', 00H
	ORG $+1
$SG71073 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG71078 DB	'CLIENT_DEVIS', 00H
	ORG $+3
$SG71079 DB	'_EVA_USER', 00H
	ORG $+2
$SG71082 DB	'TYPE_REMISE_USER,ARTICLE_USER,CATALOG_USER,REMISE_USER,R'
	DB	'EMISE,REMISE_PRO,SIRET,MARGE_MIN,EXO_TVA', 00H
	ORG $+3
$SG71085 DB	'EXO_TVA', 00H
$SG71086 DB	'CATALOG_USER', 00H
	ORG $+3
$SG71087 DB	'ARTICLE_USER', 00H
	ORG $+3
$SG71088 DB	'TYPE_REMISE_USER', 00H
	ORG $+3
$SG71089 DB	'REMISE_USER', 00H
$SG71091 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG71093 DB	'REMISE', 00H
	ORG $+1
$SG71095 DB	'REMISE_PRO', 00H
	ORG $+1
$SG71096 DB	'SIRET', 00H
	ORG $+2
$SG71098 DB	'0', 00H
	ORG $+2
$SG71101 DB	'Corse', 00H
	ORG $+2
$SG71102 DB	'TVA_VT_RED', 00H
	ORG $+1
$SG71105 DB	'TVA_VT_NORM', 00H
$SG71108 DB	'REMPRO_GLOBALE', 00H
	ORG $+1
$SG71111 DB	'REMISE_GLOBALE', 00H
	ORG $+1
$SG71113 DB	'MARGE_MIN', 00H
	ORG $+2
$SG71115 DB	'MARGE_MINI_PRO', 00H
	ORG $+1
$SG71116 DB	'MARGE_MIN', 00H
	ORG $+2
$SG71120 DB	'PROMO_SESSION', 00H
	ORG $+2
$SG71125 DB	'REMISE_PROMO', 00H
	ORG $+3
$SG71126 DB	'ARTICLES_PROMO,PRODUITS_PROMO,FAMILLES_PROMO', 00H
	ORG $+3
$SG71133 DB	'<-PANIER_SESSION', 00H
	ORG $+3
$SG71137 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG71161 DB	'D:\Travail\ABI\EVA\V4.0\CGI\Brunix-2016\dll_fap.c', 00H
	ORG $+2
$SG71162 DB	'LirePanier', 00H
	ORG $+1
$SG71164 DB	'D:\Travail\ABI\EVA\V4.0\CGI\Brunix-2016\dll_fap.c', 00H
	ORG $+2
$SG71165 DB	'LirePanier', 00H
_DATA	ENDS
;	COMDAT __real@8@4002a000000000000000
; File D:\Travail\ABI\EVA\V4.0\CGI\Brunix-2016\dll_fap.c
CONST	SEGMENT
__real@8@4002a000000000000000 DQ 04024000000000000r ; 10
CONST	ENDS
;	COMDAT __real@8@4005be00000000000000
CONST	SEGMENT
__real@8@4005be00000000000000 DQ 04057c00000000000r ; 95
CONST	ENDS
_TEXT	SEGMENT
_cntxt$ = 8
_ocx$ = 12
_art$ = 16
_idobj$ = 20
_form$ = -8
_data$ = -28
_cx$ = -48
_p$ = -4
_i$ = -44
_idsess$ = -40
_curobj$ = -32
_formlabel$ = -56
_mode_tarif$ = -52
_idpromo$ = -36
_newdest$71068 = -60
_tx$71097 = -68
_exo$71099 = -64
_mgmin$71112 = -72
_size1$71134 = -76
_LirePanier PROC NEAR

; 799  : ){

	push	ebp
	mov	ebp, esp
	sub	esp, 100				; 00000064H
	push	esi

; 800  : 	EVA_form *form = cntxt->form;

	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	ecx, DWORD PTR [eax+80]
	mov	DWORD PTR _form$[ebp], ecx

; 801  : 	DynTable data = {0};

	mov	DWORD PTR _data$[ebp], 0
	xor	edx, edx
	mov	DWORD PTR _data$[ebp+4], edx
	mov	DWORD PTR _data$[ebp+8], edx
	mov	DWORD PTR _data$[ebp+12], edx
	mov	DWORD PTR _data$[ebp+16], edx

; 802  : 	static CxPanier *tcx;
; 803  : 	static unsigned long nbcx;
; 804  : 	static Panier tmp;
; 805  : 	CxPanier *cx =NULL;

	mov	DWORD PTR _cx$[ebp], 0

; 806  : 	Panier *p = NULL;

	mov	DWORD PTR _p$[ebp], 0

; 807  : 	unsigned long i;
; 808  : 	unsigned long idsess = DYNTAB_TOUL(&cntxt->session);

	push	10					; 0000000aH
	push	0
	push	0
	push	0
	mov	eax, DWORD PTR _cntxt$[ebp]
	add	eax, 29300				; 00007274H
	push	eax
	call	_dyntab_val
	add	esp, 12					; 0000000cH
	push	eax
	call	_strtoul
	add	esp, 12					; 0000000cH
	mov	DWORD PTR _idsess$[ebp], eax

; 809  : 	unsigned long curobj = form ? DYNTAB_TOUL(&form->id_obj) : 0;

	cmp	DWORD PTR _form$[ebp], 0
	je	SHORT $L71361
	push	10					; 0000000aH
	push	0
	push	0
	push	0
	mov	ecx, DWORD PTR _form$[ebp]
	add	ecx, 32					; 00000020H
	push	ecx
	call	_dyntab_val
	add	esp, 12					; 0000000cH
	push	eax
	call	_strtoul
	add	esp, 12					; 0000000cH
	mov	DWORD PTR -80+[ebp], eax
	jmp	SHORT $L71362
$L71361:
	mov	DWORD PTR -80+[ebp], 0
$L71362:
	mov	edx, DWORD PTR -80+[ebp]
	mov	DWORD PTR _curobj$[ebp], edx

; 810  : 	char *formlabel = form ? DYNTAB_FIELD_VAL(&form->ctrl->attr, LABEL) : "";

	cmp	DWORD PTR _form$[ebp], 0
	je	SHORT $L71363
	push	0
	push	-1
	push	OFFSET FLAT:$SG71045
	mov	eax, DWORD PTR _form$[ebp]
	mov	ecx, DWORD PTR [eax]
	add	ecx, 44					; 0000002cH
	push	ecx
	call	_dyntab_field_val
	add	esp, 16					; 00000010H
	mov	DWORD PTR -84+[ebp], eax
	jmp	SHORT $L71364
$L71363:
	mov	DWORD PTR -84+[ebp], OFFSET FLAT:$SG71046
$L71364:
	mov	edx, DWORD PTR -84+[ebp]
	mov	DWORD PTR _formlabel$[ebp], edx

; 811  : 	int mode_tarif = 0;

	mov	DWORD PTR _mode_tarif$[ebp], 0

; 812  : 	unsigned long idpromo;
; 813  : 
; 814  : 	/* Choix de la session selon le contexte */
; 815  : 	if(!strcmp(formlabel, "Session utilisateur") || !strcmp(formlabel, "Contenu d'un panier"))

	push	OFFSET FLAT:$SG71051
	mov	eax, DWORD PTR _formlabel$[ebp]
	push	eax
	call	_strcmp
	add	esp, 8
	test	eax, eax
	je	SHORT $L71050
	push	OFFSET FLAT:$SG71052
	mov	ecx, DWORD PTR _formlabel$[ebp]
	push	ecx
	call	_strcmp
	add	esp, 8
	test	eax, eax
	jne	SHORT $L71049
$L71050:

; 817  : 		/* Fiche courante = session : calcule le panier de la session affichee */
; 818  : 		idsess = curobj;

	mov	edx, DWORD PTR _curobj$[ebp]
	mov	DWORD PTR _idsess$[ebp], edx

; 820  : 	else if(dyntab_field_cell(&form->objdata, "PANIER_SESSION", ~0UL, 0))

	jmp	$L71058
$L71049:
	push	0
	push	-1
	push	OFFSET FLAT:$SG71055
	mov	eax, DWORD PTR _form$[ebp]
	add	eax, 52					; 00000034H
	push	eax
	call	_dyntab_field_cell
	add	esp, 16					; 00000010H
	test	eax, eax
	je	SHORT $L71054

; 822  : 		/* Fiche courante = selection d'un article : calcule le panier correspondant */
; 823  : 		idsess = strtoul(dyntab_field_val(&form->objdata, "PANIER_SESSION", ~0UL, 0), NULL, 0);

	push	0
	push	0
	push	0
	push	-1
	push	OFFSET FLAT:$SG71057
	mov	ecx, DWORD PTR _form$[ebp]
	add	ecx, 52					; 00000034H
	push	ecx
	call	_dyntab_field_val
	add	esp, 16					; 00000010H
	push	eax
	call	_strtoul
	add	esp, 12					; 0000000cH
	mov	DWORD PTR _idsess$[ebp], eax

; 825  : 	else

	jmp	SHORT $L71058
$L71054:

; 827  : 		/* Autres fiches : utilise la session courante et le mode de tarification de la fiche courante */
; 828  : 		if(form_get_field_values(cntxt, &data, "MODE_TARIF", 0, 0)) STACK_ERROR;

	push	0
	push	0
	push	OFFSET FLAT:$SG71060
	lea	edx, DWORD PTR _data$[ebp]
	push	edx
	mov	eax, DWORD PTR _cntxt$[ebp]
	push	eax
	call	_form_get_field_values
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L71059
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 828		; 0000033cH
	jmp	$eva_err$71061
$L71059:

; 829  : 		mode_tarif = DYNTAB_TOUL(&data);

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
	mov	DWORD PTR _mode_tarif$[ebp], eax
$L71058:

; 831  : 
; 832  : 	/* Recherche le panier pour la session */
; 833  : 	for(i = 0; i < nbcx; i++) if(tcx[i].idsess == idsess)

	mov	DWORD PTR _i$[ebp], 0
	jmp	SHORT $L71063
$L71064:
	mov	eax, DWORD PTR _i$[ebp]
	add	eax, 1
	mov	DWORD PTR _i$[ebp], eax
$L71063:
	mov	ecx, DWORD PTR _i$[ebp]
	cmp	ecx, DWORD PTR _?nbcx@?1??LirePanier@@9@9
	jae	SHORT $L71065
	mov	edx, DWORD PTR _i$[ebp]
	imul	edx, 264				; 00000108H
	mov	eax, DWORD PTR _?tcx@?1??LirePanier@@9@9
	mov	ecx, DWORD PTR [eax+edx+8]
	cmp	ecx, DWORD PTR _idsess$[ebp]
	jne	SHORT $L71066

; 835  : 		cx = tcx + i;

	mov	edx, DWORD PTR _i$[ebp]
	imul	edx, 264				; 00000108H
	mov	eax, DWORD PTR _?tcx@?1??LirePanier@@9@9
	add	eax, edx
	mov	DWORD PTR _cx$[ebp], eax

; 836  : 		break;

	jmp	SHORT $L71065
$L71066:

; 838  : 
; 839  : 	/* Lecture panier si necessaire */
; 840  : 	if(!cx)

	jmp	SHORT $L71064
$L71065:
	cmp	DWORD PTR _cx$[ebp], 0
	jne	$L71147

; 842  : 		/* Alloue la memoire pour un nouveau panier */
; 843  : 		M_REALLOC(CxPanier, tcx, nbcx);

	push	528					; 00000210H
	mov	ecx, DWORD PTR _?nbcx@?1??LirePanier@@9@9
	imul	ecx, 264				; 00000108H
	push	ecx
	mov	edx, DWORD PTR _?tcx@?1??LirePanier@@9@9
	push	edx
	call	_mem_realloc
	add	esp, 12					; 0000000cH
	mov	DWORD PTR _newdest$71068[ebp], eax
	cmp	DWORD PTR _newdest$71068[ebp], 0
	jne	SHORT $L71071
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29872], OFFSET FLAT:$SG71073
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 843		; 0000034bH
	jmp	$eva_err$71061
$L71071:
	mov	edx, DWORD PTR _newdest$71068[ebp]
	mov	DWORD PTR _?tcx@?1??LirePanier@@9@9, edx
	mov	eax, DWORD PTR _?nbcx@?1??LirePanier@@9@9
	add	eax, 1
	mov	DWORD PTR _?nbcx@?1??LirePanier@@9@9, eax

; 844  : 		cx = tcx + nbcx - 1;

	mov	ecx, DWORD PTR _?nbcx@?1??LirePanier@@9@9
	imul	ecx, 264				; 00000108H
	mov	edx, DWORD PTR _?tcx@?1??LirePanier@@9@9
	lea	eax, DWORD PTR [edx+ecx-264]
	mov	DWORD PTR _cx$[ebp], eax

; 845  : 		memset(cx, 0, sizeof(cx[0]));

	push	264					; 00000108H
	push	0
	mov	ecx, DWORD PTR _cx$[ebp]
	push	ecx
	call	_memset
	add	esp, 12					; 0000000cH

; 846  : 
; 847  : 		/* Initialise le panier */
; 848  : 		cx->cntxt = cntxt;

	mov	edx, DWORD PTR _cx$[ebp]
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx], eax

; 849  : 		cx->idsess = idsess;

	mov	ecx, DWORD PTR _cx$[ebp]
	mov	edx, DWORD PTR _idsess$[ebp]
	mov	DWORD PTR [ecx+8], edx

; 850  : 
; 851  : 		/* Lecture données utilisateur */
; 852  : 		if(mode_tarif != 2)

	cmp	DWORD PTR _mode_tarif$[ebp], 2
	je	$L71075

; 854  : 			if(qry_obj_field(cntxt, &data, cx->idsess, "CLIENT_DEVIS") ||
; 855  : 				(!data.nbrows && qry_obj_field(cntxt, &data, cx->idsess, "_EVA_USER")) ) STACK_ERROR;

	push	OFFSET FLAT:$SG71078
	mov	eax, DWORD PTR _cx$[ebp]
	mov	ecx, DWORD PTR [eax+8]
	push	ecx
	lea	edx, DWORD PTR _data$[ebp]
	push	edx
	mov	eax, DWORD PTR _cntxt$[ebp]
	push	eax
	call	_qry_obj_field
	add	esp, 16					; 00000010H
	test	eax, eax
	jne	SHORT $L71077
	cmp	DWORD PTR _data$[ebp], 0
	jne	SHORT $L71076
	push	OFFSET FLAT:$SG71079
	mov	ecx, DWORD PTR _cx$[ebp]
	mov	edx, DWORD PTR [ecx+8]
	push	edx
	lea	eax, DWORD PTR _data$[ebp]
	push	eax
	mov	ecx, DWORD PTR _cntxt$[ebp]
	push	ecx
	call	_qry_obj_field
	add	esp, 16					; 00000010H
	test	eax, eax
	je	SHORT $L71076
$L71077:
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 855		; 00000357H
	jmp	$eva_err$71061
$L71076:

; 856  : 			cx->iduser = strtoul(dyntab_val(&data, 0, 0), NULL, 0);

	push	0
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
	mov	ecx, DWORD PTR _cx$[ebp]
	mov	DWORD PTR [ecx+12], eax

; 857  : 			if(qry_obj_field(cntxt, &data, cx->iduser, "TYPE_REMISE_USER,ARTICLE_USER,CATALOG_USER,REMISE_USER,REMISE,REMISE_PRO,SIRET,MARGE_MIN,EXO_TVA")) STACK_ERROR;

	push	OFFSET FLAT:$SG71082
	mov	edx, DWORD PTR _cx$[ebp]
	mov	eax, DWORD PTR [edx+12]
	push	eax
	lea	ecx, DWORD PTR _data$[ebp]
	push	ecx
	mov	edx, DWORD PTR _cntxt$[ebp]
	push	edx
	call	_qry_obj_field
	add	esp, 16					; 00000010H
	test	eax, eax
	je	SHORT $L71081
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 857		; 00000359H
	jmp	$eva_err$71061
$L71081:

; 858  : 			if(dyntab_filter_field(&cx->exotva, 1, &data, "EXO_TVA", ~0UL, 0) ||
; 859  : 				dyntab_filter_field(&cx->usrcat, 1, &data, "CATALOG_USER", ~0UL, 0) ||
; 860  : 				dyntab_filter_field(&cx->usrart, 1, &data, "ARTICLE_USER", ~0UL, 0) ||
; 861  : 				dyntab_filter_field(&cx->typremcat, 1, &data, "TYPE_REMISE_USER", ~0UL, 0) ||
; 862  : 				dyntab_filter_field(&cx->remcat, 1, &data, "REMISE_USER", ~0UL, 0) ||
; 863  : 				dyntab_order_lines(&cx->usrcat) ||
; 864  : 				dyntab_order_lines(&cx->usrart) ||
; 865  : 				dyntab_order_lines(&cx->remcat) ||
; 866  : 				dyntab_order_lines(&cx->typremcat)) RETURN_ERR_MEMORY;

	push	0
	push	-1
	push	OFFSET FLAT:$SG71085
	lea	ecx, DWORD PTR _data$[ebp]
	push	ecx
	push	1
	mov	edx, DWORD PTR _cx$[ebp]
	add	edx, 28					; 0000001cH
	push	edx
	call	_dyntab_filter_field
	add	esp, 24					; 00000018H
	test	eax, eax
	jne	$L71084
	push	0
	push	-1
	push	OFFSET FLAT:$SG71086
	lea	eax, DWORD PTR _data$[ebp]
	push	eax
	push	1
	mov	ecx, DWORD PTR _cx$[ebp]
	add	ecx, 48					; 00000030H
	push	ecx
	call	_dyntab_filter_field
	add	esp, 24					; 00000018H
	test	eax, eax
	jne	$L71084
	push	0
	push	-1
	push	OFFSET FLAT:$SG71087
	lea	edx, DWORD PTR _data$[ebp]
	push	edx
	push	1
	mov	eax, DWORD PTR _cx$[ebp]
	add	eax, 68					; 00000044H
	push	eax
	call	_dyntab_filter_field
	add	esp, 24					; 00000018H
	test	eax, eax
	jne	$L71084
	push	0
	push	-1
	push	OFFSET FLAT:$SG71088
	lea	ecx, DWORD PTR _data$[ebp]
	push	ecx
	push	1
	mov	edx, DWORD PTR _cx$[ebp]
	add	edx, 108				; 0000006cH
	push	edx
	call	_dyntab_filter_field
	add	esp, 24					; 00000018H
	test	eax, eax
	jne	SHORT $L71084
	push	0
	push	-1
	push	OFFSET FLAT:$SG71089
	lea	eax, DWORD PTR _data$[ebp]
	push	eax
	push	1
	mov	ecx, DWORD PTR _cx$[ebp]
	add	ecx, 88					; 00000058H
	push	ecx
	call	_dyntab_filter_field
	add	esp, 24					; 00000018H
	test	eax, eax
	jne	SHORT $L71084
	mov	edx, DWORD PTR _cx$[ebp]
	add	edx, 48					; 00000030H
	push	edx
	call	_dyntab_order_lines
	add	esp, 4
	test	eax, eax
	jne	SHORT $L71084
	mov	eax, DWORD PTR _cx$[ebp]
	add	eax, 68					; 00000044H
	push	eax
	call	_dyntab_order_lines
	add	esp, 4
	test	eax, eax
	jne	SHORT $L71084
	mov	ecx, DWORD PTR _cx$[ebp]
	add	ecx, 88					; 00000058H
	push	ecx
	call	_dyntab_order_lines
	add	esp, 4
	test	eax, eax
	jne	SHORT $L71084
	mov	edx, DWORD PTR _cx$[ebp]
	add	edx, 108				; 0000006cH
	push	edx
	call	_dyntab_order_lines
	add	esp, 4
	test	eax, eax
	je	SHORT $L71083
$L71084:
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29872], OFFSET FLAT:$SG71091
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 866		; 00000362H
	jmp	$eva_err$71061
$L71083:

; 867  : 			cx->u_pcrem = strtoul(dyntab_field_val(&data, "REMISE", ~0UL, 0), NULL, 0);

	push	0
	push	0
	push	0
	push	-1
	push	OFFSET FLAT:$SG71093
	lea	edx, DWORD PTR _data$[ebp]
	push	edx
	call	_dyntab_field_val
	add	esp, 16					; 00000010H
	push	eax
	call	_strtoul
	add	esp, 12					; 0000000cH
	mov	ecx, DWORD PTR _cx$[ebp]
	mov	DWORD PTR [ecx+16], eax

; 868  : 			cx->b_usrpro = dyntab_field_cell(&data, "REMISE_PRO", ~0UL, 0) != NULL;

	push	0
	push	-1
	push	OFFSET FLAT:$SG71095
	lea	edx, DWORD PTR _data$[ebp]
	push	edx
	call	_dyntab_field_cell
	add	esp, 16					; 00000010H
	neg	eax
	sbb	eax, eax
	neg	eax
	mov	ecx, DWORD PTR _cx$[ebp]
	mov	DWORD PTR [ecx+20], eax

; 869  : 			cx->b_usrttc = !dyntab_field_cell(&data, "SIRET", ~0UL, 0);

	push	0
	push	-1
	push	OFFSET FLAT:$SG71096
	lea	edx, DWORD PTR _data$[ebp]
	push	edx
	call	_dyntab_field_cell
	add	esp, 16					; 00000010H
	neg	eax
	sbb	eax, eax
	inc	eax
	mov	ecx, DWORD PTR _cx$[ebp]
	mov	DWORD PTR [ecx+24], eax
$L71075:

; 874  : 			char *tx = "0";

	mov	DWORD PTR _tx$71097[ebp], OFFSET FLAT:$SG71098

; 875  : 			char *exo = dyntab_val(&cx->exotva, 0, 0);

	push	0
	push	0
	mov	edx, DWORD PTR _cx$[ebp]
	add	edx, 28					; 0000001cH
	push	edx
	call	_dyntab_val
	add	esp, 12					; 0000000cH
	mov	DWORD PTR _exo$71099[ebp], eax

; 876  : 			if(!strcmp(exo, "Corse")) tx = dyntab_field_val(&cntxt->cnf_data, "TVA_VT_RED", 0, 0);

	push	OFFSET FLAT:$SG71101
	mov	eax, DWORD PTR _exo$71099[ebp]
	push	eax
	call	_strcmp
	add	esp, 8
	test	eax, eax
	jne	SHORT $L71100
	push	0
	push	0
	push	OFFSET FLAT:$SG71102
	mov	ecx, DWORD PTR _cntxt$[ebp]
	add	ecx, 29360				; 000072b0H
	push	ecx
	call	_dyntab_field_val
	add	esp, 16					; 00000010H
	mov	DWORD PTR _tx$71097[ebp], eax

; 877  : 			else if(!*exo) tx = dyntab_field_val(&cntxt->cnf_data, "TVA_VT_NORM", 0, 0);

	jmp	SHORT $L71104
$L71100:
	mov	edx, DWORD PTR _exo$71099[ebp]
	movsx	eax, BYTE PTR [edx]
	test	eax, eax
	jne	SHORT $L71104
	push	0
	push	0
	push	OFFSET FLAT:$SG71105
	mov	ecx, DWORD PTR _cntxt$[ebp]
	add	ecx, 29360				; 000072b0H
	push	ecx
	call	_dyntab_field_val
	add	esp, 16					; 00000010H
	mov	DWORD PTR _tx$71097[ebp], eax
$L71104:

; 878  : 			cx->txTVA = atof(tx);

	mov	edx, DWORD PTR _tx$71097[ebp]
	push	edx
	call	_atof
	add	esp, 4
	mov	eax, DWORD PTR _cx$[ebp]
	fstp	QWORD PTR [eax+184]

; 880  : 
; 881  : 		/* Remise globale */
; 882  : 		if(cx->b_usrpro)

	mov	ecx, DWORD PTR _cx$[ebp]
	cmp	DWORD PTR [ecx+20], 0
	je	SHORT $L71106

; 883  : 			cx->idrem = strtoul(dyntab_field_val(&cntxt->cnf_data, "REMPRO_GLOBALE", ~0UL, 0), NULL, 0);

	push	0
	push	0
	push	0
	push	-1
	push	OFFSET FLAT:$SG71108
	mov	edx, DWORD PTR _cntxt$[ebp]
	add	edx, 29360				; 000072b0H
	push	edx
	call	_dyntab_field_val
	add	esp, 16					; 00000010H
	push	eax
	call	_strtoul
	add	esp, 12					; 0000000cH
	mov	ecx, DWORD PTR _cx$[ebp]
	mov	DWORD PTR [ecx+4], eax
$L71106:

; 884  : 		if(!cx->idrem)

	mov	edx, DWORD PTR _cx$[ebp]
	cmp	DWORD PTR [edx+4], 0
	jne	SHORT $L71109

; 885  : 			cx->idrem = strtoul(dyntab_field_val(&cntxt->cnf_data, "REMISE_GLOBALE", ~0UL, 0), NULL, 0);

	push	0
	push	0
	push	0
	push	-1
	push	OFFSET FLAT:$SG71111
	mov	eax, DWORD PTR _cntxt$[ebp]
	add	eax, 29360				; 000072b0H
	push	eax
	call	_dyntab_field_val
	add	esp, 16					; 00000010H
	push	eax
	call	_strtoul
	add	esp, 12					; 0000000cH
	mov	ecx, DWORD PTR _cx$[ebp]
	mov	DWORD PTR [ecx+4], eax
$L71109:

; 886  : 		cx->no_rsecata = mode_tarif == 1;

	xor	edx, edx
	cmp	DWORD PTR _mode_tarif$[ebp], 1
	sete	dl
	mov	eax, DWORD PTR _cx$[ebp]
	mov	DWORD PTR [eax+228], edx

; 887  : 
; 888  : 		/* Marge minimum */
; 889  : 		cx->no_margemin = mode_tarif == 1;

	xor	ecx, ecx
	cmp	DWORD PTR _mode_tarif$[ebp], 1
	sete	cl
	mov	edx, DWORD PTR _cx$[ebp]
	mov	DWORD PTR [edx+224], ecx

; 891  : 			char *mgmin = dyntab_field_val(&data, "MARGE_MIN", ~0UL, 0);

	push	0
	push	-1
	push	OFFSET FLAT:$SG71113
	lea	eax, DWORD PTR _data$[ebp]
	push	eax
	call	_dyntab_field_val
	add	esp, 16					; 00000010H
	mov	DWORD PTR _mgmin$71112[ebp], eax

; 892  : 			if(!*mgmin) mgmin = dyntab_field_val(&cntxt->cnf_data, cx->b_usrpro ? "MARGE_MINI_PRO" : "MARGE_MIN", ~0UL, 0);

	mov	ecx, DWORD PTR _mgmin$71112[ebp]
	movsx	edx, BYTE PTR [ecx]
	test	edx, edx
	jne	SHORT $L71114
	mov	eax, DWORD PTR _cx$[ebp]
	cmp	DWORD PTR [eax+20], 0
	je	SHORT $L71365
	mov	DWORD PTR -88+[ebp], OFFSET FLAT:$SG71115
	jmp	SHORT $L71366
$L71365:
	mov	DWORD PTR -88+[ebp], OFFSET FLAT:$SG71116
$L71366:
	push	0
	push	-1
	mov	ecx, DWORD PTR -88+[ebp]
	push	ecx
	mov	edx, DWORD PTR _cntxt$[ebp]
	add	edx, 29360				; 000072b0H
	push	edx
	call	_dyntab_field_val
	add	esp, 16					; 00000010H
	mov	DWORD PTR _mgmin$71112[ebp], eax
$L71114:

; 893  : 			cx->marge_min = atof(mgmin);

	mov	eax, DWORD PTR _mgmin$71112[ebp]
	push	eax
	call	_atof
	add	esp, 4
	mov	ecx, DWORD PTR _cx$[ebp]
	fstp	QWORD PTR [ecx+216]

; 894  : 			if(cx->marge_min < 10 || cx->marge_min > 95) cx->marge_min = 0;

	mov	edx, DWORD PTR _cx$[ebp]
	fld	QWORD PTR [edx+216]
	fcomp	QWORD PTR __real@8@4002a000000000000000
	fnstsw	ax
	test	ah, 1
	jne	SHORT $L71118
	mov	eax, DWORD PTR _cx$[ebp]
	fld	QWORD PTR [eax+216]
	fcomp	QWORD PTR __real@8@4005be00000000000000
	fnstsw	ax
	test	ah, 65					; 00000041H
	jne	SHORT $L71117
$L71118:
	mov	ecx, DWORD PTR _cx$[ebp]
	mov	DWORD PTR [ecx+216], 0
	mov	DWORD PTR [ecx+220], 0
$L71117:

; 896  : 
; 897  : 		/* Lecture code promo si présent */
; 898  : 		if(form_get_field_values(cntxt, &data, "PROMO_SESSION", 0, idsess)) STACK_ERROR;

	mov	edx, DWORD PTR _idsess$[ebp]
	push	edx
	push	0
	push	OFFSET FLAT:$SG71120
	lea	eax, DWORD PTR _data$[ebp]
	push	eax
	mov	ecx, DWORD PTR _cntxt$[ebp]
	push	ecx
	call	_form_get_field_values
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L71119
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 898		; 00000382H
	jmp	$eva_err$71061
$L71119:

; 899  : 		idpromo = DYNTAB_TOUL(&data);

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
	mov	DWORD PTR _idpromo$[ebp], eax

; 900  : 		if(idpromo)

	cmp	DWORD PTR _idpromo$[ebp], 0
	je	$L71129

; 902  : 			if(qry_obj_field(cntxt, &data, idpromo, "REMISE_PROMO") ||
; 903  : 				qry_obj_field(cntxt, &cx->id_promo, idpromo, "ARTICLES_PROMO,PRODUITS_PROMO,FAMILLES_PROMO")) STACK_ERROR;

	push	OFFSET FLAT:$SG71125
	mov	ecx, DWORD PTR _idpromo$[ebp]
	push	ecx
	lea	edx, DWORD PTR _data$[ebp]
	push	edx
	mov	eax, DWORD PTR _cntxt$[ebp]
	push	eax
	call	_qry_obj_field
	add	esp, 16					; 00000010H
	test	eax, eax
	jne	SHORT $L71124
	push	OFFSET FLAT:$SG71126
	mov	ecx, DWORD PTR _idpromo$[ebp]
	push	ecx
	mov	edx, DWORD PTR _cx$[ebp]
	add	edx, 240				; 000000f0H
	push	edx
	mov	eax, DWORD PTR _cntxt$[ebp]
	push	eax
	call	_qry_obj_field
	add	esp, 16					; 00000010H
	test	eax, eax
	je	SHORT $L71123
$L71124:
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 903		; 00000387H
	jmp	$eva_err$71061
$L71123:

; 904  : 			cx->pc_promo = atof(dyntab_val(&data, 0, 0));

	push	0
	push	0
	lea	edx, DWORD PTR _data$[ebp]
	push	edx
	call	_dyntab_val
	add	esp, 12					; 0000000cH
	push	eax
	call	_atof
	add	esp, 4
	mov	eax, DWORD PTR _cx$[ebp]
	fstp	QWORD PTR [eax+232]

; 905  : 			for(i = 0; i < cx->id_promo.nbrows; i++) cx->id_promo.cell[i].IdValObj = strtoul(cx->id_promo.cell[i].txt, NULL, 10);

	mov	DWORD PTR _i$[ebp], 0
	jmp	SHORT $L71127
$L71128:
	mov	ecx, DWORD PTR _i$[ebp]
	add	ecx, 1
	mov	DWORD PTR _i$[ebp], ecx
$L71127:
	mov	edx, DWORD PTR _cx$[ebp]
	mov	eax, DWORD PTR _i$[ebp]
	cmp	eax, DWORD PTR [edx+240]
	jae	SHORT $L71129
	push	10					; 0000000aH
	push	0
	mov	ecx, DWORD PTR _i$[ebp]
	shl	ecx, 6
	mov	edx, DWORD PTR _cx$[ebp]
	mov	eax, DWORD PTR [edx+256]
	mov	ecx, DWORD PTR [eax+ecx]
	push	ecx
	call	_strtoul
	add	esp, 12					; 0000000cH
	mov	edx, DWORD PTR _i$[ebp]
	shl	edx, 6
	mov	ecx, DWORD PTR _cx$[ebp]
	mov	ecx, DWORD PTR [ecx+256]
	mov	DWORD PTR [ecx+edx+24], eax
	jmp	SHORT $L71128
$L71129:

; 907  : 
; 908  : 		/* Lecture du panier */
; 909  : 		if(form_eval_fieldexpr(cntxt, &data, 0, cx->idsess, add_sz_str("<-PANIER_SESSION"), NULL, 0)) STACK_ERROR;

	push	0
	push	0
	push	16					; 00000010H
	push	OFFSET FLAT:$SG71133
	mov	edx, DWORD PTR _cx$[ebp]
	mov	eax, DWORD PTR [edx+8]
	push	eax
	push	0
	lea	ecx, DWORD PTR _data$[ebp]
	push	ecx
	mov	edx, DWORD PTR _cntxt$[ebp]
	push	edx
	call	_form_eval_fieldexpr
	add	esp, 32					; 00000020H
	test	eax, eax
	je	SHORT $L71132
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 909		; 0000038dH
	jmp	$eva_err$71061
$L71132:

; 910  : 		M_ALLOC(cx->panier, (data.nbrows + 1) * sizeof(cx->panier[0]));

	mov	ecx, DWORD PTR _data$[ebp]
	add	ecx, 1
	imul	ecx, 160				; 000000a0H
	mov	DWORD PTR _size1$71134[ebp], ecx
	mov	edx, DWORD PTR _size1$71134[ebp]
	push	edx
	call	_mem_alloc
	add	esp, 4
	mov	ecx, DWORD PTR _cx$[ebp]
	mov	DWORD PTR [ecx+200], eax
	cmp	DWORD PTR _size1$71134[ebp], 0
	je	SHORT $L71135
	mov	edx, DWORD PTR _cx$[ebp]
	cmp	DWORD PTR [edx+200], 0
	jne	SHORT $L71135
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29872], OFFSET FLAT:$SG71137
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 910		; 0000038eH
	jmp	$eva_err$71061
$L71135:

; 911  : 		cx->nbpanier = data.nbrows;

	mov	edx, DWORD PTR _cx$[ebp]
	mov	eax, DWORD PTR _data$[ebp]
	mov	DWORD PTR [edx+204], eax

; 912  : 
; 913  : 		/* Lecture des articles du panier */
; 914  : 		for(i = 0; i < cx->nbpanier; i++)

	mov	DWORD PTR _i$[ebp], 0
	jmp	SHORT $L71139
$L71140:
	mov	ecx, DWORD PTR _i$[ebp]
	add	ecx, 1
	mov	DWORD PTR _i$[ebp], ecx
$L71139:
	mov	edx, DWORD PTR _cx$[ebp]
	mov	eax, DWORD PTR _i$[ebp]
	cmp	eax, DWORD PTR [edx+204]
	jae	$L71141

; 916  : 			p = cx->panier + i;

	mov	ecx, DWORD PTR _i$[ebp]
	imul	ecx, 160				; 000000a0H
	mov	edx, DWORD PTR _cx$[ebp]
	mov	eax, DWORD PTR [edx+200]
	add	eax, ecx
	mov	DWORD PTR _p$[ebp], eax

; 917  : 			p->b_panier = 1;

	mov	ecx, DWORD PTR _p$[ebp]
	mov	DWORD PTR [ecx+156], 1

; 918  : 			if(FichePanier(cx, p, DYNTAB_TOULRC(&data, i, 0))) STACK_ERROR;

	push	10					; 0000000aH
	push	0
	push	0
	mov	edx, DWORD PTR _i$[ebp]
	push	edx
	lea	eax, DWORD PTR _data$[ebp]
	push	eax
	call	_dyntab_val
	add	esp, 12					; 0000000cH
	push	eax
	call	_strtoul
	add	esp, 12					; 0000000cH
	push	eax
	mov	ecx, DWORD PTR _p$[ebp]
	push	ecx
	mov	edx, DWORD PTR _cx$[ebp]
	push	edx
	call	_FichePanier
	add	esp, 12					; 0000000cH
	test	eax, eax
	je	SHORT $L71143
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 918		; 00000396H
	jmp	$eva_err$71061
$L71143:

; 919  : 			cx->totHrem += 0.01 * (int)(100. * p->pxpub * p->qte + 0.499);

	mov	esi, DWORD PTR _cx$[ebp]
	mov	ecx, DWORD PTR _p$[ebp]
	fld	QWORD PTR __real@8@4005c800000000000000
	fmul	QWORD PTR [ecx+16]
	mov	edx, DWORD PTR _p$[ebp]
	mov	eax, DWORD PTR [edx+4]
	mov	DWORD PTR -96+[ebp], eax
	mov	DWORD PTR -96+[ebp+4], 0
	fild	QWORD PTR -96+[ebp]
	fmulp	ST(1), ST(0)
	fadd	QWORD PTR __real@8@3ffdff7ced916872b000
	call	__ftol
	mov	DWORD PTR -100+[ebp], eax
	fild	DWORD PTR -100+[ebp]
	fmul	QWORD PTR __real@8@3ff8a3d70a3d70a3d800
	fadd	QWORD PTR [esi+144]
	mov	ecx, DWORD PTR _cx$[ebp]
	fstp	QWORD PTR [ecx+144]

; 920  : 			cx->totQTE += p->qte;

	mov	edx, DWORD PTR _cx$[ebp]
	mov	eax, DWORD PTR [edx+128]
	mov	ecx, DWORD PTR _p$[ebp]
	add	eax, DWORD PTR [ecx+4]
	mov	edx, DWORD PTR _cx$[ebp]
	mov	DWORD PTR [edx+128], eax

; 921  : 		}

	jmp	$L71140
$L71141:

; 922  : 
; 923  : 		/* Calcul du prix de vente pour les articles du panier */
; 924  : 		for(i = 0; i < cx->nbpanier; i++)

	mov	DWORD PTR _i$[ebp], 0
	jmp	SHORT $L71145
$L71146:
	mov	eax, DWORD PTR _i$[ebp]
	add	eax, 1
	mov	DWORD PTR _i$[ebp], eax
$L71145:
	mov	ecx, DWORD PTR _cx$[ebp]
	mov	edx, DWORD PTR _i$[ebp]
	cmp	edx, DWORD PTR [ecx+204]
	jae	SHORT $L71147

; 925  : 			if(CalcPvArt(cx, cx->panier + i)) STACK_ERROR;

	mov	eax, DWORD PTR _i$[ebp]
	imul	eax, 160				; 000000a0H
	mov	ecx, DWORD PTR _cx$[ebp]
	mov	edx, DWORD PTR [ecx+200]
	add	edx, eax
	push	edx
	mov	eax, DWORD PTR _cx$[ebp]
	push	eax
	call	_CalcPvArt
	add	esp, 8
	test	eax, eax
	je	SHORT $L71148
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 925		; 0000039dH
	jmp	$eva_err$71061
$L71148:
	jmp	SHORT $L71146
$L71147:

; 927  : 	*ocx = cx;

	mov	edx, DWORD PTR _ocx$[ebp]
	mov	eax, DWORD PTR _cx$[ebp]
	mov	DWORD PTR [edx], eax

; 928  : 
; 929  : 	/* Recherche article courant */
; 930  : 	for(i = 0; i < cx->nbpanier; i++)

	mov	DWORD PTR _i$[ebp], 0
	jmp	SHORT $L71149
$L71150:
	mov	ecx, DWORD PTR _i$[ebp]
	add	ecx, 1
	mov	DWORD PTR _i$[ebp], ecx
$L71149:
	mov	edx, DWORD PTR _cx$[ebp]
	mov	eax, DWORD PTR _i$[ebp]
	cmp	eax, DWORD PTR [edx+204]
	jae	SHORT $L71151

; 932  : 		p = cx->panier + i;

	mov	ecx, DWORD PTR _i$[ebp]
	imul	ecx, 160				; 000000a0H
	mov	edx, DWORD PTR _cx$[ebp]
	mov	eax, DWORD PTR [edx+200]
	add	eax, ecx
	mov	DWORD PTR _p$[ebp], eax

; 933  : 		if(p->id == idobj || p->idart == idobj) break;

	mov	ecx, DWORD PTR _p$[ebp]
	mov	edx, DWORD PTR [ecx]
	cmp	edx, DWORD PTR _idobj$[ebp]
	je	SHORT $L71153
	mov	eax, DWORD PTR _p$[ebp]
	mov	ecx, DWORD PTR [eax+8]
	cmp	ecx, DWORD PTR _idobj$[ebp]
	jne	SHORT $L71152
$L71153:
	jmp	SHORT $L71151
$L71152:

; 934  : 		p = NULL;

	mov	DWORD PTR _p$[ebp], 0

; 935  : 	}

	jmp	SHORT $L71150
$L71151:

; 936  : 
; 937  : 	/* Fiche article pas dans le panier : lecture dans panier tampon */
; 938  : 	if(!p)

	cmp	DWORD PTR _p$[ebp], 0
	jne	$L71159

; 940  : 		p = &tmp;

	mov	DWORD PTR _p$[ebp], OFFSET FLAT:_?tmp@?1??LirePanier@@9@9

; 941  : 		if(p->idart != idobj)

	mov	edx, DWORD PTR _p$[ebp]
	mov	eax, DWORD PTR [edx+8]
	cmp	eax, DWORD PTR _idobj$[ebp]
	je	SHORT $L71159

; 943  : 			memset(p, 0, sizeof(tmp));

	push	160					; 000000a0H
	push	0
	mov	ecx, DWORD PTR _p$[ebp]
	push	ecx
	call	_memset
	add	esp, 12					; 0000000cH

; 944  : 			p->idart = idobj;

	mov	edx, DWORD PTR _p$[ebp]
	mov	eax, DWORD PTR _idobj$[ebp]
	mov	DWORD PTR [edx+8], eax

; 945  : 			if(FichePanier(cx, p, 0)) STACK_ERROR;

	push	0
	mov	ecx, DWORD PTR _p$[ebp]
	push	ecx
	mov	edx, DWORD PTR _cx$[ebp]
	push	edx
	call	_FichePanier
	add	esp, 12					; 0000000cH
	test	eax, eax
	je	SHORT $L71157
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 945		; 000003b1H
	jmp	SHORT $eva_err$71061
$L71157:

; 946  : 			if(!p->qte) p->qte = 1;

	mov	ecx, DWORD PTR _p$[ebp]
	cmp	DWORD PTR [ecx+4], 0
	jne	SHORT $L71158
	mov	edx, DWORD PTR _p$[ebp]
	mov	DWORD PTR [edx+4], 1
$L71158:

; 947  : 			if(CalcPvArt(cx, p)) STACK_ERROR;

	mov	eax, DWORD PTR _p$[ebp]
	push	eax
	mov	ecx, DWORD PTR _cx$[ebp]
	push	ecx
	call	_CalcPvArt
	add	esp, 8
	test	eax, eax
	je	SHORT $L71159
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 947		; 000003b3H
	jmp	SHORT $eva_err$71061
$L71159:

; 950  : 	*art = p;

	mov	eax, DWORD PTR _art$[ebp]
	mov	ecx, DWORD PTR _p$[ebp]
	mov	DWORD PTR [eax], ecx
$eva_noerr$71160:

; 951  : 
; 952  : 	RETURN_OK_CLEANUP;

	push	0
	push	OFFSET FLAT:$SG71161
	push	OFFSET FLAT:$SG71162
	mov	edx, DWORD PTR _cntxt$[ebp]
	push	edx
	call	_err_clear
	add	esp, 16					; 00000010H
$eva_err$71061:
	mov	eax, DWORD PTR _cntxt$[ebp]
	cmp	DWORD PTR [eax+29872], 0
	je	SHORT $L71163
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	edx, DWORD PTR [ecx+29900]
	push	edx
	push	OFFSET FLAT:$SG71164
	push	OFFSET FLAT:$SG71165
	mov	eax, DWORD PTR _cntxt$[ebp]
	push	eax
	call	_err_add_context
	add	esp, 16					; 00000010H
$L71163:
	lea	ecx, DWORD PTR _data$[ebp]
	push	ecx
	call	_dyntab_free
	add	esp, 4
	mov	edx, DWORD PTR _cntxt$[ebp]
	xor	eax, eax
	cmp	DWORD PTR [edx+29872], 0
	setne	al

; 953  : }

	pop	esi
	mov	esp, ebp
	pop	ebp
	ret	0
_LirePanier ENDP
_TEXT	ENDS
PUBLIC	_TarifFAP
EXTRN	_dbl_str:NEAR
EXTRN	_sprintf:NEAR
EXTRN	_strncmp:NEAR
_DATA	SEGMENT
	ORG $+1
$SG71187 DB	'TotTTC', 00H
	ORG $+1
$SG71191 DB	'TotHT', 00H
	ORG $+2
$SG71195 DB	'TotHrem', 00H
$SG71199 DB	'MoyHrem', 00H
$SG71203 DB	'TotMarge', 00H
	ORG $+3
$SG71207 DB	'PcMarge', 00H
$SG71210 DB	'TotPoids', 00H
	ORG $+3
$SG71213 DB	'Lmax', 00H
	ORG $+3
$SG71216 DB	'IdArt', 00H
	ORG $+2
$SG71221 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG71227 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG71232 DB	'RemArt', 00H
	ORG $+1
$SG71234 DB	'%s', 00H
	ORG $+1
$SG71237 DB	'IdRemArt', 00H
	ORG $+3
$SG71240 DB	'%lu', 00H
$SG71244 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG71247 DB	'IdCatRemArt', 00H
$SG71250 DB	'%lu', 00H
$SG71254 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG71257 DB	'PcArt', 00H
	ORG $+2
$SG71261 DB	'ImgRem', 00H
	ORG $+1
$SG71264 DB	'IMAGE', 00H
	ORG $+2
$SG71267 DB	'PvArt', 00H
	ORG $+2
$SG71271 DB	'MargeArt', 00H
	ORG $+3
$SG71275 DB	'TotArt', 00H
	ORG $+1
$SG71279 DB	'TabPrixArt', 00H
	ORG $+1
$SG71285 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG71286 DB	'D:\Travail\ABI\EVA\V4.0\CGI\Brunix-2016\dll_fap.c', 00H
	ORG $+2
$SG71287 DB	'TarifFAP', 00H
	ORG $+3
$SG71289 DB	'D:\Travail\ABI\EVA\V4.0\CGI\Brunix-2016\dll_fap.c', 00H
	ORG $+2
$SG71290 DB	'TarifFAP', 00H
_DATA	ENDS
_TEXT	SEGMENT
_cntxt$ = 8
_res$ = 12
_idobj$ = 16
_func$ = 20
_data$ = -88
_cx$ = -92
_art$ = -68
_txtres$ = -64
__tmp$71239 = -124
__tmp$71249 = -156
_TarifFAP PROC NEAR

; 968  : ){

	push	ebp
	mov	ebp, esp
	sub	esp, 184				; 000000b8H
	push	edi

; 969  : 	DynTable data = {0};

	mov	DWORD PTR _data$[ebp], 0
	xor	eax, eax
	mov	DWORD PTR _data$[ebp+4], eax
	mov	DWORD PTR _data$[ebp+8], eax
	mov	DWORD PTR _data$[ebp+12], eax
	mov	DWORD PTR _data$[ebp+16], eax

; 970  : 	CxPanier *cx = NULL;

	mov	DWORD PTR _cx$[ebp], 0

; 971  : 	Panier *art = NULL;

	mov	DWORD PTR _art$[ebp], 0

; 972  : 	char txtres[64] = {0};

	mov	BYTE PTR _txtres$[ebp], 0
	mov	ecx, 15					; 0000000fH
	xor	eax, eax
	lea	edi, DWORD PTR _txtres$[ebp+1]
	rep stosd
	stosw
	stosb

; 973  : 
; 974  : 	/* Lecture du panier et de la fiche panier */
; 975  : 	if(LirePanier(cntxt, &cx, &art, idobj)) STACK_ERROR;

	mov	ecx, DWORD PTR _idobj$[ebp]
	push	ecx
	lea	edx, DWORD PTR _art$[ebp]
	push	edx
	lea	eax, DWORD PTR _cx$[ebp]
	push	eax
	mov	ecx, DWORD PTR _cntxt$[ebp]
	push	ecx
	call	_LirePanier
	add	esp, 16					; 00000010H
	test	eax, eax
	je	SHORT $L71184
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 975		; 000003cfH
	jmp	$eva_err$71185
$L71184:

; 976  : 
; 977  : 	/* Traitement selon fonction */
; 978  : 	if(!strcmp(func, "TotTTC"))

	push	OFFSET FLAT:$SG71187
	mov	eax, DWORD PTR _func$[ebp]
	push	eax
	call	_strcmp
	add	esp, 8
	test	eax, eax
	jne	SHORT $L71186

; 980  : 		/* Total du panier avec remise */
; 981  : 		dbl_str(txtres, (int)(cx->totHT * (100. + cx->txTVA) + .499) / 100., NULL);

	push	0
	mov	ecx, DWORD PTR _cx$[ebp]
	mov	edx, DWORD PTR _cx$[ebp]
	fld	QWORD PTR __real@8@4005c800000000000000
	fadd	QWORD PTR [edx+184]
	fmul	QWORD PTR [ecx+136]
	fadd	QWORD PTR __real@8@3ffdff7ced916872b000
	call	__ftol
	mov	DWORD PTR -160+[ebp], eax
	fild	DWORD PTR -160+[ebp]
	fdiv	QWORD PTR __real@8@4005c800000000000000
	sub	esp, 8
	fstp	QWORD PTR [esp]
	lea	eax, DWORD PTR _txtres$[ebp]
	push	eax
	call	_dbl_str
	add	esp, 16					; 00000010H
$L71186:

; 983  : 	if(!strcmp(func, "TotHT"))

	push	OFFSET FLAT:$SG71191
	mov	ecx, DWORD PTR _func$[ebp]
	push	ecx
	call	_strcmp
	add	esp, 8
	test	eax, eax
	jne	SHORT $L71190

; 985  : 		/* Total du panier avec remise */
; 986  : 		dbl_str(txtres, cx->totHT, NULL);

	push	0
	mov	edx, DWORD PTR _cx$[ebp]
	mov	eax, DWORD PTR [edx+140]
	push	eax
	mov	ecx, DWORD PTR [edx+136]
	push	ecx
	lea	edx, DWORD PTR _txtres$[ebp]
	push	edx
	call	_dbl_str
	add	esp, 16					; 00000010H

; 988  : 	else if(!strcmp(func, "TotHrem"))

	jmp	$L71206
$L71190:
	push	OFFSET FLAT:$SG71195
	mov	eax, DWORD PTR _func$[ebp]
	push	eax
	call	_strcmp
	add	esp, 8
	test	eax, eax
	jne	SHORT $L71194

; 990  : 		/* Total du panier sans remise */
; 991  : 		dbl_str(txtres, cx->totHrem, NULL);

	push	0
	mov	ecx, DWORD PTR _cx$[ebp]
	mov	edx, DWORD PTR [ecx+148]
	push	edx
	mov	eax, DWORD PTR [ecx+144]
	push	eax
	lea	ecx, DWORD PTR _txtres$[ebp]
	push	ecx
	call	_dbl_str
	add	esp, 16					; 00000010H

; 993  : 	else if(!strcmp(func, "MoyHrem"))

	jmp	$L71206
$L71194:
	push	OFFSET FLAT:$SG71199
	mov	edx, DWORD PTR _func$[ebp]
	push	edx
	call	_strcmp
	add	esp, 8
	test	eax, eax
	jne	SHORT $L71198

; 995  : 		/* Remise globale du panier */
; 996  : 		dbl_str(txtres, cx->totHrem ? 100. * (1. - cx->totHT / cx->totHrem) : 0, NULL);

	mov	eax, DWORD PTR _cx$[ebp]
	fld	QWORD PTR [eax+144]
	fcomp	QWORD PTR __real@8@00000000000000000000
	fnstsw	ax
	test	ah, 64					; 00000040H
	jne	SHORT $L71372
	mov	ecx, DWORD PTR _cx$[ebp]
	mov	edx, DWORD PTR _cx$[ebp]
	fld	QWORD PTR [ecx+136]
	fdiv	QWORD PTR [edx+144]
	fsubr	QWORD PTR __real@8@3fff8000000000000000
	fmul	QWORD PTR __real@8@4005c800000000000000
	fstp	QWORD PTR -168+[ebp]
	jmp	SHORT $L71373
$L71372:
	mov	DWORD PTR -168+[ebp], 0
	mov	DWORD PTR -168+[ebp+4], 0
$L71373:
	push	0
	mov	eax, DWORD PTR -168+[ebp+4]
	push	eax
	mov	ecx, DWORD PTR -168+[ebp]
	push	ecx
	lea	edx, DWORD PTR _txtres$[ebp]
	push	edx
	call	_dbl_str
	add	esp, 16					; 00000010H

; 998  : 	else if(!strcmp(func, "TotMarge"))

	jmp	$L71206
$L71198:
	push	OFFSET FLAT:$SG71203
	mov	eax, DWORD PTR _func$[ebp]
	push	eax
	call	_strcmp
	add	esp, 8
	test	eax, eax
	jne	SHORT $L71202

; 1000 : 		/* Montant marge du panier */
; 1001 : 		dbl_str(txtres, cx->totPV - cx->totPA, NULL);

	push	0
	mov	ecx, DWORD PTR _cx$[ebp]
	mov	edx, DWORD PTR _cx$[ebp]
	fld	QWORD PTR [ecx+152]
	fsub	QWORD PTR [edx+160]
	sub	esp, 8
	fstp	QWORD PTR [esp]
	lea	eax, DWORD PTR _txtres$[ebp]
	push	eax
	call	_dbl_str
	add	esp, 16					; 00000010H

; 1003 : 	else if(!strcmp(func, "PcMarge"))

	jmp	SHORT $L71206
$L71202:
	push	OFFSET FLAT:$SG71207
	mov	ecx, DWORD PTR _func$[ebp]
	push	ecx
	call	_strcmp
	add	esp, 8
	test	eax, eax
	jne	SHORT $L71206

; 1005 : 		/* % marge du panier */
; 1006 : 		dbl_str(txtres, cx->totPA ? 1 - cx->totPA / cx->totPV : 0, NULL);

	mov	edx, DWORD PTR _cx$[ebp]
	fld	QWORD PTR [edx+160]
	fcomp	QWORD PTR __real@8@00000000000000000000
	fnstsw	ax
	test	ah, 64					; 00000040H
	jne	SHORT $L71374
	mov	eax, DWORD PTR _cx$[ebp]
	mov	ecx, DWORD PTR _cx$[ebp]
	fld	QWORD PTR [eax+160]
	fdiv	QWORD PTR [ecx+152]
	fsubr	QWORD PTR __real@8@3fff8000000000000000
	fstp	QWORD PTR -176+[ebp]
	jmp	SHORT $L71375
$L71374:
	mov	DWORD PTR -176+[ebp], 0
	mov	DWORD PTR -176+[ebp+4], 0
$L71375:
	push	0
	mov	edx, DWORD PTR -176+[ebp+4]
	push	edx
	mov	eax, DWORD PTR -176+[ebp]
	push	eax
	lea	ecx, DWORD PTR _txtres$[ebp]
	push	ecx
	call	_dbl_str
	add	esp, 16					; 00000010H
$L71206:

; 1008 : 	if(!strcmp(func, "TotPoids"))

	push	OFFSET FLAT:$SG71210
	mov	edx, DWORD PTR _func$[ebp]
	push	edx
	call	_strcmp
	add	esp, 8
	test	eax, eax
	jne	SHORT $L71209

; 1010 : 		/* Total du poids du panier */
; 1011 : 		dbl_str(txtres, cx->totPoids, NULL);

	push	0
	mov	eax, DWORD PTR _cx$[ebp]
	mov	ecx, DWORD PTR [eax+172]
	push	ecx
	mov	edx, DWORD PTR [eax+168]
	push	edx
	lea	eax, DWORD PTR _txtres$[ebp]
	push	eax
	call	_dbl_str
	add	esp, 16					; 00000010H
$L71209:

; 1013 : 	if(!strcmp(func, "Lmax"))

	push	OFFSET FLAT:$SG71213
	mov	ecx, DWORD PTR _func$[ebp]
	push	ecx
	call	_strcmp
	add	esp, 8
	test	eax, eax
	jne	SHORT $L71212

; 1015 : 		/* Longueur max du panier */
; 1016 : 		dbl_str(txtres, cx->Lmax, NULL);

	push	0
	mov	edx, DWORD PTR _cx$[ebp]
	mov	eax, DWORD PTR [edx+180]
	push	eax
	mov	ecx, DWORD PTR [edx+176]
	push	ecx
	lea	edx, DWORD PTR _txtres$[ebp]
	push	edx
	call	_dbl_str
	add	esp, 16					; 00000010H
$L71212:

; 1018 : 	if(!strcmp(func, "IdArt"))

	push	OFFSET FLAT:$SG71216
	mov	eax, DWORD PTR _func$[ebp]
	push	eax
	call	_strcmp
	add	esp, 8
	test	eax, eax
	jne	$L71215

; 1020 : 		/* Liste des articles du panier */
; 1021 : 		DYNTAB_ADD_BUF(res, 0, 0, cx->idart);

	mov	ecx, DWORD PTR _cx$[ebp]
	cmp	DWORD PTR [ecx+208], 0
	je	SHORT $L71217
	mov	edx, DWORD PTR _cx$[ebp]
	mov	eax, DWORD PTR [edx+208]
	cmp	DWORD PTR [eax+4], 0
	je	SHORT $L71217
	push	0
	push	0
	mov	ecx, DWORD PTR _cx$[ebp]
	mov	edx, DWORD PTR [ecx+208]
	mov	eax, DWORD PTR [edx+4]
	push	eax
	mov	ecx, DWORD PTR _cx$[ebp]
	mov	edx, DWORD PTR [ecx+208]
	add	edx, 8
	push	edx
	push	0
	push	0
	mov	eax, DWORD PTR _res$[ebp]
	push	eax
	call	_dyntab_add
	add	esp, 28					; 0000001cH
	test	eax, eax
	je	SHORT $L71219
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29872], OFFSET FLAT:$SG71221
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 1021		; 000003fdH
	jmp	$eva_err$71185
$L71219:
	jmp	SHORT $L71225
$L71217:
	push	0
	push	0
	push	0
	push	0
	push	0
	push	0
	mov	eax, DWORD PTR _res$[ebp]
	push	eax
	call	_dyntab_add
	add	esp, 28					; 0000001cH
	test	eax, eax
	je	SHORT $L71225
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29872], OFFSET FLAT:$SG71227
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 1021		; 000003fdH
	jmp	$eva_err$71185
$L71225:

; 1022 : 		RETURN_OK;

	jmp	$eva_noerr$71228
$L71215:

; 1024 : 	else if(art)

	cmp	DWORD PTR _art$[ebp], 0
	je	$L71278

; 1026 : 		if(!strcmp(func, "RemArt"))

	push	OFFSET FLAT:$SG71232
	mov	eax, DWORD PTR _func$[ebp]
	push	eax
	call	_strcmp
	add	esp, 8
	test	eax, eax
	jne	SHORT $L71231

; 1028 : 			/* Methode remise sur un article du panier */
; 1029 : 			if(art->meth) snprintf(add_sz_str(txtres), "%s", art->meth);

	mov	ecx, DWORD PTR _art$[ebp]
	cmp	DWORD PTR [ecx+84], 0
	je	SHORT $L71233
	mov	edx, DWORD PTR _art$[ebp]
	mov	eax, DWORD PTR [edx+84]
	push	eax
	push	OFFSET FLAT:$SG71234
	push	63					; 0000003fH
	lea	ecx, DWORD PTR _txtres$[ebp]
	push	ecx
	call	__snprintf
	add	esp, 16					; 00000010H
$L71233:

; 1031 : 		else if(!strcmp(func, "IdRemArt"))

	jmp	$L71278
$L71231:
	push	OFFSET FLAT:$SG71237
	mov	edx, DWORD PTR _func$[ebp]
	push	edx
	call	_strcmp
	add	esp, 8
	test	eax, eax
	jne	$L71236

; 1033 : 			/* IdObj remise sur un article du panier */
; 1034 : 			if(art->idrem)

	mov	eax, DWORD PTR _art$[ebp]
	cmp	DWORD PTR [eax+132], 0
	je	SHORT $L71238

; 1036 : 				DYNTAB_ADD_INT(res, 0, 0, art->idrem);

	mov	BYTE PTR __tmp$71239[ebp], 0
	mov	ecx, 7
	xor	eax, eax
	lea	edi, DWORD PTR __tmp$71239[ebp+1]
	rep stosd
	stosw
	stosb
	mov	ecx, DWORD PTR _art$[ebp]
	mov	edx, DWORD PTR [ecx+132]
	push	edx
	push	OFFSET FLAT:$SG71240
	lea	eax, DWORD PTR __tmp$71239[ebp]
	push	eax
	call	_sprintf
	add	esp, 12					; 0000000cH
	push	0
	push	0
	push	0
	lea	ecx, DWORD PTR __tmp$71239[ebp]
	push	ecx
	push	0
	push	0
	mov	edx, DWORD PTR _res$[ebp]
	push	edx
	call	_dyntab_add
	add	esp, 28					; 0000001cH
	test	eax, eax
	je	SHORT $L71242
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29872], OFFSET FLAT:$SG71244
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 1036		; 0000040cH
	jmp	$eva_err$71185
$L71242:

; 1037 : 				RETURN_OK;

	jmp	$eva_noerr$71228
$L71238:

; 1040 : 		else if(!strcmp(func, "IdCatRemArt"))

	jmp	$L71278
$L71236:
	push	OFFSET FLAT:$SG71247
	mov	edx, DWORD PTR _func$[ebp]
	push	edx
	call	_strcmp
	add	esp, 8
	test	eax, eax
	jne	$L71246

; 1042 : 			/* IdObj remise sur un article du panier */
; 1043 : 			if(art->idcatrem)

	mov	eax, DWORD PTR _art$[ebp]
	cmp	DWORD PTR [eax+136], 0
	je	SHORT $L71248

; 1045 : 				DYNTAB_ADD_INT(res, 0, 0, art->idcatrem);

	mov	BYTE PTR __tmp$71249[ebp], 0
	mov	ecx, 7
	xor	eax, eax
	lea	edi, DWORD PTR __tmp$71249[ebp+1]
	rep stosd
	stosw
	stosb
	mov	ecx, DWORD PTR _art$[ebp]
	mov	edx, DWORD PTR [ecx+136]
	push	edx
	push	OFFSET FLAT:$SG71250
	lea	eax, DWORD PTR __tmp$71249[ebp]
	push	eax
	call	_sprintf
	add	esp, 12					; 0000000cH
	push	0
	push	0
	push	0
	lea	ecx, DWORD PTR __tmp$71249[ebp]
	push	ecx
	push	0
	push	0
	mov	edx, DWORD PTR _res$[ebp]
	push	edx
	call	_dyntab_add
	add	esp, 28					; 0000001cH
	test	eax, eax
	je	SHORT $L71252
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29872], OFFSET FLAT:$SG71254
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 1045		; 00000415H
	jmp	$eva_err$71185
$L71252:

; 1046 : 				RETURN_OK;

	jmp	$eva_noerr$71228
$L71248:

; 1049 : 		else if(!strcmp(func, "PcArt"))

	jmp	$L71278
$L71246:
	push	OFFSET FLAT:$SG71257
	mov	edx, DWORD PTR _func$[ebp]
	push	edx
	call	_strcmp
	add	esp, 8
	test	eax, eax
	jne	SHORT $L71256

; 1051 : 			/* Remise % sur un article du panier */
; 1052 : 			dbl_str(txtres, art->pcrem, NULL);

	push	0
	mov	eax, DWORD PTR _art$[ebp]
	mov	ecx, DWORD PTR [eax+44]
	push	ecx
	mov	edx, DWORD PTR [eax+40]
	push	edx
	lea	eax, DWORD PTR _txtres$[ebp]
	push	eax
	call	_dbl_str
	add	esp, 16					; 00000010H

; 1054 : 		else if(!strcmp(func, "ImgRem"))

	jmp	$L71278
$L71256:
	push	OFFSET FLAT:$SG71261
	mov	ecx, DWORD PTR _func$[ebp]
	push	ecx
	call	_strcmp
	add	esp, 8
	test	eax, eax
	jne	SHORT $L71260

; 1056 : 			/* Image remise d'un article du panier */
; 1057 : 			if(art->idrem)

	mov	edx, DWORD PTR _art$[ebp]
	cmp	DWORD PTR [edx+132], 0
	je	SHORT $L71262

; 1059 : 				if(qry_obj_field(cntxt, res, art->idrem, "IMAGE")) STACK_ERROR;

	push	OFFSET FLAT:$SG71264
	mov	eax, DWORD PTR _art$[ebp]
	mov	ecx, DWORD PTR [eax+132]
	push	ecx
	mov	edx, DWORD PTR _res$[ebp]
	push	edx
	mov	eax, DWORD PTR _cntxt$[ebp]
	push	eax
	call	_qry_obj_field
	add	esp, 16					; 00000010H
	test	eax, eax
	je	SHORT $L71263
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 1059		; 00000423H
	jmp	$eva_err$71185
$L71263:

; 1060 : 				RETURN_OK;

	jmp	$eva_noerr$71228
$L71262:

; 1063 : 		else if(!strcmp(func, "PvArt"))

	jmp	$L71278
$L71260:
	push	OFFSET FLAT:$SG71267
	mov	edx, DWORD PTR _func$[ebp]
	push	edx
	call	_strcmp
	add	esp, 8
	test	eax, eax
	jne	SHORT $L71266

; 1065 : 			/* Prix vente unitaire HT d'un article du panier */
; 1066 : 			dbl_str(txtres, art->pv / art->qte, NULL);

	push	0
	mov	eax, DWORD PTR _art$[ebp]
	mov	ecx, DWORD PTR _art$[ebp]
	mov	edx, DWORD PTR [ecx+4]
	mov	DWORD PTR -184+[ebp], edx
	mov	DWORD PTR -184+[ebp+4], 0
	fild	QWORD PTR -184+[ebp]
	fdivr	QWORD PTR [eax+32]
	sub	esp, 8
	fstp	QWORD PTR [esp]
	lea	eax, DWORD PTR _txtres$[ebp]
	push	eax
	call	_dbl_str
	add	esp, 16					; 00000010H

; 1068 : 		else if(!strcmp(func, "MargeArt"))

	jmp	$L71278
$L71266:
	push	OFFSET FLAT:$SG71271
	mov	ecx, DWORD PTR _func$[ebp]
	push	ecx
	call	_strcmp
	add	esp, 8
	test	eax, eax
	jne	SHORT $L71270

; 1070 : 			/* Marge sur un article du panier */
; 1071 : 			dbl_str(txtres, (1. - art->pa / art->pv) * 100., NULL);

	push	0
	mov	edx, DWORD PTR _art$[ebp]
	mov	eax, DWORD PTR _art$[ebp]
	fld	QWORD PTR [edx+24]
	fdiv	QWORD PTR [eax+32]
	fsubr	QWORD PTR __real@8@3fff8000000000000000
	fmul	QWORD PTR __real@8@4005c800000000000000
	sub	esp, 8
	fstp	QWORD PTR [esp]
	lea	ecx, DWORD PTR _txtres$[ebp]
	push	ecx
	call	_dbl_str
	add	esp, 16					; 00000010H

; 1073 : 		else if(!strcmp(func, "TotArt"))

	jmp	SHORT $L71278
$L71270:
	push	OFFSET FLAT:$SG71275
	mov	edx, DWORD PTR _func$[ebp]
	push	edx
	call	_strcmp
	add	esp, 8
	test	eax, eax
	jne	SHORT $L71274

; 1075 : 			/* Total d'un article du panier */
; 1076 : 			dbl_str(txtres, art->pv, NULL);

	push	0
	mov	eax, DWORD PTR _art$[ebp]
	mov	ecx, DWORD PTR [eax+36]
	push	ecx
	mov	edx, DWORD PTR [eax+32]
	push	edx
	lea	eax, DWORD PTR _txtres$[ebp]
	push	eax
	call	_dbl_str
	add	esp, 16					; 00000010H

; 1078 : 		else if(!strncmp(func, add_sz_str("TabPrixArt")))

	jmp	SHORT $L71278
$L71274:
	push	10					; 0000000aH
	push	OFFSET FLAT:$SG71279
	mov	ecx, DWORD PTR _func$[ebp]
	push	ecx
	call	_strncmp
	add	esp, 12					; 0000000cH
	test	eax, eax
	jne	SHORT $L71278

; 1080 : 			/* Tableau de prix d'un article du panier */
; 1081 : 			if(TabPrix(cx, res, art)) STACK_ERROR;

	mov	edx, DWORD PTR _art$[ebp]
	push	edx
	mov	eax, DWORD PTR _res$[ebp]
	push	eax
	mov	ecx, DWORD PTR _cx$[ebp]
	push	ecx
	call	_TabPrix
	add	esp, 12					; 0000000cH
	test	eax, eax
	je	SHORT $L71280
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 1081		; 00000439H
	jmp	SHORT $eva_err$71185
$L71280:

; 1082 : 			RETURN_OK;

	jmp	SHORT $eva_noerr$71228
$L71278:

; 1085 : 	dyntab_free(res);

	mov	eax, DWORD PTR _res$[ebp]
	push	eax
	call	_dyntab_free
	add	esp, 4

; 1086 : 	if(*txtres) DYNTAB_ADD(res, 0, 0, txtres, 0, NO_CONV);

	movsx	ecx, BYTE PTR _txtres$[ebp]
	test	ecx, ecx
	je	SHORT $L71283
	push	0
	push	0
	push	0
	lea	edx, DWORD PTR _txtres$[ebp]
	push	edx
	push	0
	push	0
	mov	eax, DWORD PTR _res$[ebp]
	push	eax
	call	_dyntab_add
	add	esp, 28					; 0000001cH
	test	eax, eax
	je	SHORT $L71283
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29872], OFFSET FLAT:$SG71285
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 1086		; 0000043eH
	jmp	SHORT $eva_err$71185
$L71283:
$eva_noerr$71228:

; 1087 : 
; 1088 : 	RETURN_OK_CLEANUP;

	push	0
	push	OFFSET FLAT:$SG71286
	push	OFFSET FLAT:$SG71287
	mov	eax, DWORD PTR _cntxt$[ebp]
	push	eax
	call	_err_clear
	add	esp, 16					; 00000010H
$eva_err$71185:
	mov	ecx, DWORD PTR _cntxt$[ebp]
	cmp	DWORD PTR [ecx+29872], 0
	je	SHORT $L71288
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	eax, DWORD PTR [edx+29900]
	push	eax
	push	OFFSET FLAT:$SG71289
	push	OFFSET FLAT:$SG71290
	mov	ecx, DWORD PTR _cntxt$[ebp]
	push	ecx
	call	_err_add_context
	add	esp, 16					; 00000010H
$L71288:
	lea	edx, DWORD PTR _data$[ebp]
	push	edx
	call	_dyntab_free
	add	esp, 4
	mov	eax, DWORD PTR _cntxt$[ebp]
	xor	ecx, ecx
	cmp	DWORD PTR [eax+29872], 0
	setne	cl
	mov	eax, ecx

; 1089 : }

	pop	edi
	mov	esp, ebp
	pop	ebp
	ret	0
_TarifFAP ENDP
_TEXT	ENDS
END
