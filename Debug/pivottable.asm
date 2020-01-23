	TITLE	D:\Travail\ABI\EVA\V4.0\CGI\Brunix-2016\pivottable.c
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
PUBLIC	_pivottablefield_free
EXTRN	_mem_free:NEAR
EXTRN	_dyntab_free:NEAR
EXTRN	_sql_drop_table:NEAR
EXTRN	_memset:NEAR
_TEXT	SEGMENT
_cntxt$ = 8
_pvf$ = 12
_pivottablefield_free PROC NEAR

; 23   : ){

	push	ebp
	mov	ebp, esp

; 24   : 	if(!pvf) return;

	cmp	DWORD PTR _pvf$[ebp], 0
	jne	SHORT $L70207
	jmp	$L70206
$L70207:

; 25   : 	dyntab_free(&pvf->expr);

	mov	eax, DWORD PTR _pvf$[ebp]
	add	eax, 4
	push	eax
	call	_dyntab_free
	add	esp, 4

; 26   : 	dyntab_free(&pvf->labels);

	mov	ecx, DWORD PTR _pvf$[ebp]
	add	ecx, 24					; 00000018H
	push	ecx
	call	_dyntab_free
	add	esp, 4

; 27   : 	dyntab_free(&pvf->totals);

	mov	edx, DWORD PTR _pvf$[ebp]
	add	edx, 44					; 0000002cH
	push	edx
	call	_dyntab_free
	add	esp, 4

; 28   : 	dyntab_free(&pvf->forms);

	mov	eax, DWORD PTR _pvf$[ebp]
	add	eax, 64					; 00000040H
	push	eax
	call	_dyntab_free
	add	esp, 4

; 29   : 	dyntab_free(&pvf->filters);

	mov	ecx, DWORD PTR _pvf$[ebp]
	add	ecx, 84					; 00000054H
	push	ecx
	call	_dyntab_free
	add	esp, 4

; 30   : 	dyntab_free(&pvf->selctrl);

	mov	edx, DWORD PTR _pvf$[ebp]
	add	edx, 104				; 00000068H
	push	edx
	call	_dyntab_free
	add	esp, 4

; 31   : 	dyntab_free(&pvf->function);

	mov	eax, DWORD PTR _pvf$[ebp]
	add	eax, 124				; 0000007cH
	push	eax
	call	_dyntab_free
	add	esp, 4

; 32   : 	dyntab_free(&pvf->totlabel);

	mov	ecx, DWORD PTR _pvf$[ebp]
	add	ecx, 144				; 00000090H
	push	ecx
	call	_dyntab_free
	add	esp, 4

; 33   : 	dyntab_free(&pvf->function);

	mov	edx, DWORD PTR _pvf$[ebp]
	add	edx, 124				; 0000007cH
	push	edx
	call	_dyntab_free
	add	esp, 4

; 34   : 	dyntab_free(&pvf->percent);

	mov	eax, DWORD PTR _pvf$[ebp]
	add	eax, 164				; 000000a4H
	push	eax
	call	_dyntab_free
	add	esp, 4

; 35   : 	dyntab_free(&pvf->srcdata);

	mov	ecx, DWORD PTR _pvf$[ebp]
	add	ecx, 188				; 000000bcH
	push	ecx
	call	_dyntab_free
	add	esp, 4

; 36   : 	dyntab_free(&pvf->graphfile);

	mov	edx, DWORD PTR _pvf$[ebp]
	add	edx, 312				; 00000138H
	push	edx
	call	_dyntab_free
	add	esp, 4

; 37   : 	dyntab_free(&pvf->slices);

	mov	eax, DWORD PTR _pvf$[ebp]
	add	eax, 368				; 00000170H
	push	eax
	call	_dyntab_free
	add	esp, 4

; 38   : 	dyntab_free(&pvf->sr_src);

	mov	ecx, DWORD PTR _pvf$[ebp]
	add	ecx, 388				; 00000184H
	push	ecx
	call	_dyntab_free
	add	esp, 4

; 39   : 	dyntab_free(&pvf->sr_dest);

	mov	edx, DWORD PTR _pvf$[ebp]
	add	edx, 408				; 00000198H
	push	edx
	call	_dyntab_free
	add	esp, 4

; 40   : 	dyntab_free(&pvf->sr_pos);

	mov	eax, DWORD PTR _pvf$[ebp]
	add	eax, 428				; 000001acH
	push	eax
	call	_dyntab_free
	add	esp, 4

; 41   : 	dyntab_free(&pvf->optsrc);

	mov	ecx, DWORD PTR _pvf$[ebp]
	add	ecx, 448				; 000001c0H
	push	ecx
	call	_dyntab_free
	add	esp, 4

; 42   : 	dyntab_free(&pvf->emptyval);

	mov	edx, DWORD PTR _pvf$[ebp]
	add	edx, 492				; 000001ecH
	push	edx
	call	_dyntab_free
	add	esp, 4

; 43   : 	M_FREE(pvf->where);

	mov	eax, DWORD PTR _pvf$[ebp]
	mov	ecx, DWORD PTR [eax+576]
	push	ecx
	call	_mem_free
	add	esp, 4
	mov	edx, DWORD PTR _pvf$[ebp]
	mov	DWORD PTR [edx+576], 0

; 44   : 	sql_drop_table(cntxt, pvf->datatable);

	mov	eax, DWORD PTR _pvf$[ebp]
	add	eax, 208				; 000000d0H
	push	eax
	mov	ecx, DWORD PTR _cntxt$[ebp]
	push	ecx
	call	_sql_drop_table
	add	esp, 8

; 45   : 	sql_drop_table(cntxt, pvf->objtable);

	mov	edx, DWORD PTR _pvf$[ebp]
	add	edx, 240				; 000000f0H
	push	edx
	mov	eax, DWORD PTR _cntxt$[ebp]
	push	eax
	call	_sql_drop_table
	add	esp, 8

; 46   : 	M_FREE(pvf->vmin);

	mov	ecx, DWORD PTR _pvf$[ebp]
	mov	edx, DWORD PTR [ecx+560]
	push	edx
	call	_mem_free
	add	esp, 4
	mov	eax, DWORD PTR _pvf$[ebp]
	mov	DWORD PTR [eax+560], 0

; 47   : 	M_FREE(pvf->vmax);

	mov	ecx, DWORD PTR _pvf$[ebp]
	mov	edx, DWORD PTR [ecx+568]
	push	edx
	call	_mem_free
	add	esp, 4
	mov	eax, DWORD PTR _pvf$[ebp]
	mov	DWORD PTR [eax+568], 0

; 48   : 	memset(pvf, 0, sizeof(*pvf));

	push	616					; 00000268H
	push	0
	mov	ecx, DWORD PTR _pvf$[ebp]
	push	ecx
	call	_memset
	add	esp, 12					; 0000000cH
$L70206:

; 49   : }

	pop	ebp
	ret	0
_pivottablefield_free ENDP
_TEXT	ENDS
PUBLIC	_pivottable_free
_TEXT	SEGMENT
_cntxt$ = 8
_pv$ = 12
_irow$ = -8
_icol$ = -4
_idata$ = -12
_pivottable_free PROC NEAR

; 58   : ){

	push	ebp
	mov	ebp, esp
	sub	esp, 12					; 0000000cH

; 59   : 	unsigned long irow, icol, idata;
; 60   : 	if(!pv) return;

	cmp	DWORD PTR _pv$[ebp], 0
	jne	SHORT $L70216
	jmp	$L70212
$L70216:

; 61   : 	dyntab_free(&pv->forms);

	mov	eax, DWORD PTR _pv$[ebp]
	add	eax, 4
	push	eax
	call	_dyntab_free
	add	esp, 4

; 62   : 	dyntab_free(&pv->filters);

	mov	ecx, DWORD PTR _pv$[ebp]
	add	ecx, 24					; 00000018H
	push	ecx
	call	_dyntab_free
	add	esp, 4

; 63   : 	for(idata = 0; idata < MAX_PVT_DATAFIELDS; idata++)	pivottablefield_free(cntxt, &pv->datas[idata]);

	mov	DWORD PTR _idata$[ebp], 0
	jmp	SHORT $L70217
$L70218:
	mov	edx, DWORD PTR _idata$[ebp]
	add	edx, 1
	mov	DWORD PTR _idata$[ebp], edx
$L70217:
	cmp	DWORD PTR _idata$[ebp], 20		; 00000014H
	jae	SHORT $L70219
	mov	eax, DWORD PTR _idata$[ebp]
	imul	eax, 616				; 00000268H
	mov	ecx, DWORD PTR _pv$[ebp]
	lea	edx, DWORD PTR [ecx+eax+81792]
	push	edx
	mov	eax, DWORD PTR _cntxt$[ebp]
	push	eax
	call	_pivottablefield_free
	add	esp, 8
	jmp	SHORT $L70218
$L70219:

; 64   : 	for(irow = 0; !irow || irow < pv->nbrow; irow++) pivottablefield_free(cntxt, &pv->rows[irow]);

	mov	DWORD PTR _irow$[ebp], 0
	jmp	SHORT $L70220
$L70221:
	mov	ecx, DWORD PTR _irow$[ebp]
	add	ecx, 1
	mov	DWORD PTR _irow$[ebp], ecx
$L70220:
	cmp	DWORD PTR _irow$[ebp], 0
	je	SHORT $L70223
	mov	edx, DWORD PTR _pv$[ebp]
	mov	eax, DWORD PTR _irow$[ebp]
	cmp	eax, DWORD PTR [edx+78696]
	jae	SHORT $L70222
$L70223:
	mov	ecx, DWORD PTR _irow$[ebp]
	imul	ecx, 616				; 00000268H
	mov	edx, DWORD PTR _pv$[ebp]
	lea	eax, DWORD PTR [edx+ecx+60216]
	push	eax
	mov	ecx, DWORD PTR _cntxt$[ebp]
	push	ecx
	call	_pivottablefield_free
	add	esp, 8
	jmp	SHORT $L70221
$L70222:

; 65   : 	for(icol = 0; !icol || icol < pv->nbcol; icol++) pivottablefield_free(cntxt, &pv->cols[icol]);

	mov	DWORD PTR _icol$[ebp], 0
	jmp	SHORT $L70224
$L70225:
	mov	edx, DWORD PTR _icol$[ebp]
	add	edx, 1
	mov	DWORD PTR _icol$[ebp], edx
$L70224:
	cmp	DWORD PTR _icol$[ebp], 0
	je	SHORT $L70227
	mov	eax, DWORD PTR _pv$[ebp]
	mov	ecx, DWORD PTR _icol$[ebp]
	cmp	ecx, DWORD PTR [eax+81784]
	jae	SHORT $L70226
$L70227:
	mov	edx, DWORD PTR _icol$[ebp]
	imul	edx, 616				; 00000268H
	mov	eax, DWORD PTR _pv$[ebp]
	lea	ecx, DWORD PTR [eax+edx+78704]
	push	ecx
	mov	edx, DWORD PTR _cntxt$[ebp]
	push	edx
	call	_pivottablefield_free
	add	esp, 8
	jmp	SHORT $L70225
$L70226:

; 66   : 	for(idata = 0; idata < MAX_PVT_DATAFIELDS; idata++)

	mov	DWORD PTR _idata$[ebp], 0
	jmp	SHORT $L70228
$L70229:
	mov	eax, DWORD PTR _idata$[ebp]
	add	eax, 1
	mov	DWORD PTR _idata$[ebp], eax
$L70228:
	cmp	DWORD PTR _idata$[ebp], 20		; 00000014H
	jae	$L70230

; 67   : 		for(irow = 0; !irow || irow < pv->nbrow; irow++)

	mov	DWORD PTR _irow$[ebp], 0
	jmp	SHORT $L70231
$L70232:
	mov	ecx, DWORD PTR _irow$[ebp]
	add	ecx, 1
	mov	DWORD PTR _irow$[ebp], ecx
$L70231:
	cmp	DWORD PTR _irow$[ebp], 0
	je	SHORT $L70234
	mov	edx, DWORD PTR _pv$[ebp]
	mov	eax, DWORD PTR _irow$[ebp]
	cmp	eax, DWORD PTR [edx+78696]
	jae	SHORT $L70233
$L70234:

; 68   : 			for(icol = 0; !icol || icol < pv->nbcol; icol++) dyntab_free(&pv->restbl[idata][irow][icol]);

	mov	DWORD PTR _icol$[ebp], 0
	jmp	SHORT $L70235
$L70236:
	mov	ecx, DWORD PTR _icol$[ebp]
	add	ecx, 1
	mov	DWORD PTR _icol$[ebp], ecx
$L70235:
	cmp	DWORD PTR _icol$[ebp], 0
	je	SHORT $L70238
	mov	edx, DWORD PTR _pv$[ebp]
	mov	eax, DWORD PTR _icol$[ebp]
	cmp	eax, DWORD PTR [edx+81784]
	jae	SHORT $L70237
$L70238:
	mov	ecx, DWORD PTR _idata$[ebp]
	imul	ecx, 3000				; 00000bb8H
	mov	edx, DWORD PTR _pv$[ebp]
	lea	eax, DWORD PTR [edx+ecx+216]
	mov	ecx, DWORD PTR _irow$[ebp]
	imul	ecx, 100				; 00000064H
	add	eax, ecx
	mov	edx, DWORD PTR _icol$[ebp]
	imul	edx, 20					; 00000014H
	add	eax, edx
	push	eax
	call	_dyntab_free
	add	esp, 4
	jmp	SHORT $L70236
$L70237:
	jmp	SHORT $L70232
$L70233:
	jmp	$L70229
$L70230:

; 69   : 	sql_drop_table(cntxt, pv->objtable);

	mov	eax, DWORD PTR _pv$[ebp]
	add	eax, 160				; 000000a0H
	push	eax
	mov	ecx, DWORD PTR _cntxt$[ebp]
	push	ecx
	call	_sql_drop_table
	add	esp, 8

; 70   : 	M_FREE(pv->exportparams);

	mov	edx, DWORD PTR _pv$[ebp]
	mov	eax, DWORD PTR [edx+94136]
	push	eax
	call	_mem_free
	add	esp, 4
	mov	ecx, DWORD PTR _pv$[ebp]
	mov	DWORD PTR [ecx+94136], 0

; 71   : 	memset(pv, 0, sizeof(*pv));

	push	94232					; 00017018H
	push	0
	mov	edx, DWORD PTR _pv$[ebp]
	push	edx
	call	_memset
	add	esp, 12					; 0000000cH
$L70212:

; 72   : }

	mov	esp, ebp
	pop	ebp
	ret	0
_pivottable_free ENDP
_TEXT	ENDS
PUBLIC	_get_relmode_oneway
EXTRN	_strcmp:NEAR
_BSS	SEGMENT
$SG70250 DB	01H DUP (?)
_BSS	ENDS
_DATA	SEGMENT
$SG70261 DB	'_EVA_DIRECT', 00H
_DATA	ENDS
_TEXT	SEGMENT
_pv$ = 8
_field$ = 12
_ltable$ = 16
_rtable$ = 20
_relmode$ = -4
_relfield$ = -8
_get_relmode_oneway PROC NEAR

; 83   : ){

	push	ebp
	mov	ebp, esp
	sub	esp, 12					; 0000000cH

; 84   : 	char *relmode = "";

	mov	DWORD PTR _relmode$[ebp], OFFSET FLAT:$SG70250

; 85   : 	DynTable *relfield = NULL;

	mov	DWORD PTR _relfield$[ebp], 0

; 86   : 	if(!ltable || !rtable) return RelNone;

	cmp	DWORD PTR _ltable$[ebp], 0
	je	SHORT $L70254
	cmp	DWORD PTR _rtable$[ebp], 0
	jne	SHORT $L70253
$L70254:
	xor	eax, eax
	jmp	$L70248
$L70253:

; 87   : 	if(*rtable == 'D')

	mov	eax, DWORD PTR _rtable$[ebp]
	movsx	ecx, BYTE PTR [eax]
	cmp	ecx, 68					; 00000044H
	jne	SHORT $L70255

; 89   : 		if(*ltable == 'R')

	mov	edx, DWORD PTR _ltable$[ebp]
	movsx	eax, BYTE PTR [edx]
	cmp	eax, 82					; 00000052H
	jne	SHORT $L70256

; 91   : 			relmode = pv->rowdata_relmode;

	mov	ecx, DWORD PTR _pv$[ebp]
	mov	edx, DWORD PTR [ecx+56]
	mov	DWORD PTR _relmode$[ebp], edx

; 92   : 			relfield = &pv->rowdata_relfield;

	mov	eax, DWORD PTR _pv$[ebp]
	add	eax, 60					; 0000003cH
	mov	DWORD PTR _relfield$[ebp], eax

; 94   : 		else if(*ltable == 'C')

	jmp	SHORT $L70258
$L70256:
	mov	ecx, DWORD PTR _ltable$[ebp]
	movsx	edx, BYTE PTR [ecx]
	cmp	edx, 67					; 00000043H
	jne	SHORT $L70258

; 96   : 			relmode = pv->coldata_relmode;

	mov	eax, DWORD PTR _pv$[ebp]
	mov	ecx, DWORD PTR [eax+80]
	mov	DWORD PTR _relmode$[ebp], ecx

; 97   : 			relfield = &pv->coldata_relfield;

	mov	edx, DWORD PTR _pv$[ebp]
	add	edx, 84					; 00000054H
	mov	DWORD PTR _relfield$[ebp], edx
$L70258:

; 100  : 	else if(*rtable == 'R' && *ltable == 'C')

	jmp	SHORT $L70260
$L70255:
	mov	eax, DWORD PTR _rtable$[ebp]
	movsx	ecx, BYTE PTR [eax]
	cmp	ecx, 82					; 00000052H
	jne	SHORT $L70260
	mov	edx, DWORD PTR _ltable$[ebp]
	movsx	eax, BYTE PTR [edx]
	cmp	eax, 67					; 00000043H
	jne	SHORT $L70260

; 102  : 		relmode = pv->rowcol_relmode;

	mov	ecx, DWORD PTR _pv$[ebp]
	mov	edx, DWORD PTR [ecx+104]
	mov	DWORD PTR _relmode$[ebp], edx

; 103  : 		relfield = &pv->rowcol_relfield;

	mov	eax, DWORD PTR _pv$[ebp]
	add	eax, 108				; 0000006cH
	mov	DWORD PTR _relfield$[ebp], eax
$L70260:

; 105  : 	*field = relfield;

	mov	ecx, DWORD PTR _field$[ebp]
	mov	edx, DWORD PTR _relfield$[ebp]
	mov	DWORD PTR [ecx], edx

; 106  : 	return !*relmode ? RelNone : !strcmp("_EVA_DIRECT", relmode) ? RelDirect : RelReverse;

	mov	eax, DWORD PTR _relmode$[ebp]
	movsx	ecx, BYTE PTR [eax]
	test	ecx, ecx
	jne	SHORT $L71491
	mov	DWORD PTR -12+[ebp], 0
	jmp	SHORT $L71492
$L71491:
	mov	edx, DWORD PTR _relmode$[ebp]
	push	edx
	push	OFFSET FLAT:$SG70261
	call	_strcmp
	add	esp, 8
	neg	eax
	sbb	eax, eax
	neg	eax
	add	eax, 1
	mov	DWORD PTR -12+[ebp], eax
$L71492:
	mov	eax, DWORD PTR -12+[ebp]
$L70248:

; 107  : }

	mov	esp, ebp
	pop	ebp
	ret	0
_get_relmode_oneway ENDP
_TEXT	ENDS
PUBLIC	_get_relmode
_TEXT	SEGMENT
_pv$ = 8
_field$ = 12
_ltable$ = 16
_rtable$ = 20
_relmode$ = -4
_get_relmode PROC NEAR

; 118  : ){

	push	ebp
	mov	ebp, esp
	sub	esp, 12					; 0000000cH

; 119  : 	RelationMode relmode = get_relmode_oneway(pv, field, ltable, rtable);

	mov	eax, DWORD PTR _rtable$[ebp]
	push	eax
	mov	ecx, DWORD PTR _ltable$[ebp]
	push	ecx
	mov	edx, DWORD PTR _field$[ebp]
	push	edx
	mov	eax, DWORD PTR _pv$[ebp]
	push	eax
	call	_get_relmode_oneway
	add	esp, 16					; 00000010H
	mov	DWORD PTR _relmode$[ebp], eax

; 120  : 	if(*field) return relmode;

	mov	ecx, DWORD PTR _field$[ebp]
	cmp	DWORD PTR [ecx], 0
	je	SHORT $L70273
	mov	eax, DWORD PTR _relmode$[ebp]
	jmp	SHORT $L70271
$L70273:

; 121  : 	relmode = get_relmode_oneway(pv, field, rtable, ltable);

	mov	edx, DWORD PTR _ltable$[ebp]
	push	edx
	mov	eax, DWORD PTR _rtable$[ebp]
	push	eax
	mov	ecx, DWORD PTR _field$[ebp]
	push	ecx
	mov	edx, DWORD PTR _pv$[ebp]
	push	edx
	call	_get_relmode_oneway
	add	esp, 16					; 00000010H
	mov	DWORD PTR _relmode$[ebp], eax

; 122  : 	return relmode == RelDirect ? RelReverse : relmode == RelReverse ? RelDirect : relmode;

	cmp	DWORD PTR _relmode$[ebp], 1
	jne	SHORT $L71496
	mov	DWORD PTR -8+[ebp], 2
	jmp	SHORT $L71497
$L71496:
	cmp	DWORD PTR _relmode$[ebp], 2
	jne	SHORT $L71494
	mov	DWORD PTR -12+[ebp], 1
	jmp	SHORT $L71495
$L71494:
	mov	eax, DWORD PTR _relmode$[ebp]
	mov	DWORD PTR -12+[ebp], eax
$L71495:
	mov	ecx, DWORD PTR -12+[ebp]
	mov	DWORD PTR -8+[ebp], ecx
$L71497:
	mov	eax, DWORD PTR -8+[ebp]
$L70271:

; 123  : }

	mov	esp, ebp
	pop	ebp
	ret	0
_get_relmode ENDP
_TEXT	ENDS
PUBLIC	_auto_date_unit
EXTRN	_datetxt_to_age:NEAR
_DATA	SEGMENT
$SG70288 DB	'_EVA_MINUTE', 00H
$SG70289 DB	'_EVA_HOUR', 00H
	ORG $+2
$SG70290 DB	'_EVA_DAY', 00H
	ORG $+3
$SG70291 DB	'_EVA_WEEK', 00H
	ORG $+2
$SG70292 DB	'_EVA_MONTH', 00H
	ORG $+1
$SG70293 DB	'_EVA_YEAR', 00H
	ORG $+2
$SG70294 DB	'_EVA_YEAR', 00H
_DATA	ENDS
_TEXT	SEGMENT
_pvf$ = 8
_fmt$ = -4
_d$ = -8
_auto_date_unit PROC NEAR

; 131  : ){

	push	ebp
	mov	ebp, esp
	sub	esp, 32					; 00000020H

; 132  : 	char fmt = 0;

	mov	BYTE PTR _fmt$[ebp], 0

; 133  : 	int d = datetxt_to_age(pvf->vmin, pvf->vmax, &fmt);

	lea	eax, DWORD PTR _fmt$[ebp]
	push	eax
	mov	ecx, DWORD PTR _pvf$[ebp]
	mov	edx, DWORD PTR [ecx+568]
	push	edx
	mov	eax, DWORD PTR _pvf$[ebp]
	mov	ecx, DWORD PTR [eax+560]
	push	ecx
	call	_datetxt_to_age
	add	esp, 12					; 0000000cH
	mov	DWORD PTR _d$[ebp], eax

; 134  : 	if(pvf->dispunit && *pvf->dispunit) return;

	mov	edx, DWORD PTR _pvf$[ebp]
	cmp	DWORD PTR [edx+332], 0
	je	SHORT $L70280
	mov	eax, DWORD PTR _pvf$[ebp]
	mov	ecx, DWORD PTR [eax+332]
	movsx	edx, BYTE PTR [ecx]
	test	edx, edx
	je	SHORT $L70280
	jmp	$L70277
$L70280:

; 135  : 	if(d > 12 && fmt == 'M') fmt = 'Y';

	cmp	DWORD PTR _d$[ebp], 12			; 0000000cH
	jle	SHORT $L70281
	movsx	eax, BYTE PTR _fmt$[ebp]
	cmp	eax, 77					; 0000004dH
	jne	SHORT $L70281
	mov	BYTE PTR _fmt$[ebp], 89			; 00000059H

; 136  : 	else if(d > 60 && fmt == 'D') fmt = 'M';

	jmp	SHORT $L70287
$L70281:
	cmp	DWORD PTR _d$[ebp], 60			; 0000003cH
	jle	SHORT $L70283
	movsx	ecx, BYTE PTR _fmt$[ebp]
	cmp	ecx, 68					; 00000044H
	jne	SHORT $L70283
	mov	BYTE PTR _fmt$[ebp], 77			; 0000004dH

; 137  : 	else if(d > 14 && fmt == 'D') fmt = 'W';

	jmp	SHORT $L70287
$L70283:
	cmp	DWORD PTR _d$[ebp], 14			; 0000000eH
	jle	SHORT $L70285
	movsx	edx, BYTE PTR _fmt$[ebp]
	cmp	edx, 68					; 00000044H
	jne	SHORT $L70285
	mov	BYTE PTR _fmt$[ebp], 87			; 00000057H

; 138  : 	else if(d > 48 && fmt == 'h') fmt = 'D';

	jmp	SHORT $L70287
$L70285:
	cmp	DWORD PTR _d$[ebp], 48			; 00000030H
	jle	SHORT $L70287
	movsx	eax, BYTE PTR _fmt$[ebp]
	cmp	eax, 104				; 00000068H
	jne	SHORT $L70287
	mov	BYTE PTR _fmt$[ebp], 68			; 00000044H
$L70287:

; 139  : 	pvf->dispunit = fmt == 'm' ? "_EVA_MINUTE" :
; 140  : 					fmt == 'h' ? "_EVA_HOUR" :
; 141  : 					fmt == 'D' ? "_EVA_DAY" :
; 142  : 					fmt == 'W' ? "_EVA_WEEK" :
; 143  : 					fmt == 'M' ? "_EVA_MONTH" :
; 144  : 					fmt == 'Y' ? "_EVA_YEAR" :
; 145  : 					"_EVA_YEAR";

	movsx	ecx, BYTE PTR _fmt$[ebp]
	cmp	ecx, 109				; 0000006dH
	jne	SHORT $L71509
	mov	DWORD PTR -12+[ebp], OFFSET FLAT:$SG70288
	jmp	SHORT $L71510
$L71509:
	movsx	edx, BYTE PTR _fmt$[ebp]
	cmp	edx, 104				; 00000068H
	jne	SHORT $L71507
	mov	DWORD PTR -16+[ebp], OFFSET FLAT:$SG70289
	jmp	SHORT $L71508
$L71507:
	movsx	eax, BYTE PTR _fmt$[ebp]
	cmp	eax, 68					; 00000044H
	jne	SHORT $L71505
	mov	DWORD PTR -20+[ebp], OFFSET FLAT:$SG70290
	jmp	SHORT $L71506
$L71505:
	movsx	ecx, BYTE PTR _fmt$[ebp]
	cmp	ecx, 87					; 00000057H
	jne	SHORT $L71503
	mov	DWORD PTR -24+[ebp], OFFSET FLAT:$SG70291
	jmp	SHORT $L71504
$L71503:
	movsx	edx, BYTE PTR _fmt$[ebp]
	cmp	edx, 77					; 0000004dH
	jne	SHORT $L71501
	mov	DWORD PTR -28+[ebp], OFFSET FLAT:$SG70292
	jmp	SHORT $L71502
$L71501:
	movsx	eax, BYTE PTR _fmt$[ebp]
	cmp	eax, 89					; 00000059H
	jne	SHORT $L71499
	mov	DWORD PTR -32+[ebp], OFFSET FLAT:$SG70293
	jmp	SHORT $L71500
$L71499:
	mov	DWORD PTR -32+[ebp], OFFSET FLAT:$SG70294
$L71500:
	mov	ecx, DWORD PTR -32+[ebp]
	mov	DWORD PTR -28+[ebp], ecx
$L71502:
	mov	edx, DWORD PTR -28+[ebp]
	mov	DWORD PTR -24+[ebp], edx
$L71504:
	mov	eax, DWORD PTR -24+[ebp]
	mov	DWORD PTR -20+[ebp], eax
$L71506:
	mov	ecx, DWORD PTR -20+[ebp]
	mov	DWORD PTR -16+[ebp], ecx
$L71508:
	mov	edx, DWORD PTR -16+[ebp]
	mov	DWORD PTR -12+[ebp], edx
$L71510:
	mov	eax, DWORD PTR _pvf$[ebp]
	mov	ecx, DWORD PTR -12+[ebp]
	mov	DWORD PTR [eax+332], ecx
$L70277:

; 146  : }

	mov	esp, ebp
	pop	ebp
	ret	0
_auto_date_unit ENDP
_TEXT	ENDS
PUBLIC	_pivottable_select
EXTRN	_sql_exec_query:NEAR
EXTRN	_qry_exec_filter:NEAR
EXTRN	_qry_values_list:NEAR
EXTRN	_strtoul:NEAR
EXTRN	_dynbuf_add:NEAR
EXTRN	_dynbuf_add3:NEAR
EXTRN	_qry_build_flt_select:NEAR
EXTRN	_dyntab_val:NEAR
EXTRN	_strcpy:NEAR
EXTRN	_qry_filter_sql_fieldexpr:NEAR
EXTRN	_err_add_context:NEAR
EXTRN	_qry_build_free:NEAR
EXTRN	_err_clear:NEAR
EXTRN	__chkstk:NEAR
EXTRN	_qry_add_filter_forms:NEAR
EXTRN	_qry_build_clauses:NEAR
_DATA	SEGMENT
	ORG $+2
$SG70310 DB	'DTmpPVT', 00H
$SG70313 DB	' TYPE=HEAP', 0aH, 00H
$SG70314 DB	'-- pivottable_select - select objects matching formstamp'
	DB	0aH, 'CREATE TEMPORARY TABLE ', 00H
	ORG $+3
$SG70316 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70321 DB	'ALTER TABLE DTmpPVT ADD INDEX(IdObj)', 00H
	ORG $+3
$SG70325 DB	'D:\Travail\ABI\EVA\V4.0\CGI\Brunix-2016\pivottable.c', 00H
	ORG $+3
$SG70326 DB	'pivottable_select', 00H
	ORG $+2
$SG70330 DB	'-- pivottable_select - remove objects not matching condi'
	DB	'tion', 0aH, 'DELETE FROM DTmpPVT WHERE IdObj NOT IN (', 00H
	ORG $+2
$SG70332 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70336 DB	')', 00H
	ORG $+2
$SG70338 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70342 DB	'D:\Travail\ABI\EVA\V4.0\CGI\Brunix-2016\pivottable.c', 00H
	ORG $+3
$SG70343 DB	'pivottable_select', 00H
	ORG $+2
$SG70345 DB	'D:\Travail\ABI\EVA\V4.0\CGI\Brunix-2016\pivottable.c', 00H
	ORG $+3
$SG70346 DB	'pivottable_select', 00H
_DATA	ENDS
_TEXT	SEGMENT
_cntxt$ = 8
_pv$ = 12
_id_obj$ = -24
_sql$ = -4
_flt$ = -4480
_pivottable_select PROC NEAR

; 159  : ){

	push	ebp
	mov	ebp, esp
	mov	eax, 4484				; 00001184H
	call	__chkstk
	push	edi

; 160  : 	DynTable id_obj = {0};

	mov	DWORD PTR _id_obj$[ebp], 0
	xor	eax, eax
	mov	DWORD PTR _id_obj$[ebp+4], eax
	mov	DWORD PTR _id_obj$[ebp+8], eax
	mov	DWORD PTR _id_obj$[ebp+12], eax
	mov	DWORD PTR _id_obj$[ebp+16], eax

; 161  : 	DynBuffer *sql = NULL;

	mov	DWORD PTR _sql$[ebp], 0

; 162  : 	QryBuild flt = {{0}};

	mov	DWORD PTR _flt$[ebp], 0
	xor	ecx, ecx
	mov	DWORD PTR _flt$[ebp+4], ecx
	mov	DWORD PTR _flt$[ebp+8], ecx
	mov	DWORD PTR _flt$[ebp+12], ecx
	mov	DWORD PTR _flt$[ebp+16], ecx
	mov	ecx, 1109				; 00000455H
	xor	eax, eax
	lea	edi, DWORD PTR _flt$[ebp+20]
	rep stosd

; 163  : 
; 164  : 	/* Handle formstamp & filter condition */
; 165  : 	if(pv->forms.nbrows || pv->filters.nbrows )

	mov	edx, DWORD PTR _pv$[ebp]
	cmp	DWORD PTR [edx+4], 0
	jne	SHORT $L70307
	mov	eax, DWORD PTR _pv$[ebp]
	cmp	DWORD PTR [eax+24], 0
	je	$L70320
$L70307:

; 167  : 		if(qry_add_filter_forms(cntxt, &flt, &pv->forms, &pv->filters)) STACK_ERROR;

	mov	ecx, DWORD PTR _pv$[ebp]
	add	ecx, 24					; 00000018H
	push	ecx
	mov	edx, DWORD PTR _pv$[ebp]
	add	edx, 4
	push	edx
	lea	eax, DWORD PTR _flt$[ebp]
	push	eax
	mov	ecx, DWORD PTR _cntxt$[ebp]
	push	ecx
	call	_qry_add_filter_forms
	add	esp, 16					; 00000010H
	test	eax, eax
	je	SHORT $L70308
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 167		; 000000a7H
	jmp	$eva_err$70309
$L70308:

; 168  : 
; 169  : 		/* Build table with objects matching formstamp & filter */
; 170  : 		strcpy(pv->objtable, "DTmpPVT");

	push	OFFSET FLAT:$SG70310
	mov	eax, DWORD PTR _pv$[ebp]
	add	eax, 160				; 000000a0H
	push	eax
	call	_strcpy
	add	esp, 8

; 172  : 			"-- pivottable_select - select objects matching formstamp\n"
; 173  : 			"CREATE TEMPORARY TABLE ", pv->objtable, 0, NO_CONV, " TYPE=HEAP\n");

	push	11					; 0000000bH
	push	OFFSET FLAT:$SG70313
	push	0
	push	0
	push	0
	mov	ecx, DWORD PTR _pv$[ebp]
	add	ecx, 160				; 000000a0H
	push	ecx
	push	80					; 00000050H
	push	OFFSET FLAT:$SG70314
	lea	edx, DWORD PTR _sql$[ebp]
	push	edx
	call	_dynbuf_add3
	add	esp, 36					; 00000024H
	test	eax, eax
	je	SHORT $L70312
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29872], OFFSET FLAT:$SG70316
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 173		; 000000adH
	jmp	$eva_err$70309
$L70312:

; 174  : 		if(qry_build_clauses(cntxt, &flt, 1)) STACK_ERROR;

	push	1
	lea	edx, DWORD PTR _flt$[ebp]
	push	edx
	mov	eax, DWORD PTR _cntxt$[ebp]
	push	eax
	call	_qry_build_clauses
	add	esp, 12					; 0000000cH
	test	eax, eax
	je	SHORT $L70317
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 174		; 000000aeH
	jmp	$eva_err$70309
$L70317:

; 175  : 		if(qry_build_flt_select(cntxt, &sql, &id_obj, &flt, 0, 0)) STACK_ERROR;

	push	0
	push	0
	lea	edx, DWORD PTR _flt$[ebp]
	push	edx
	lea	eax, DWORD PTR _id_obj$[ebp]
	push	eax
	lea	ecx, DWORD PTR _sql$[ebp]
	push	ecx
	mov	edx, DWORD PTR _cntxt$[ebp]
	push	edx
	call	_qry_build_flt_select
	add	esp, 24					; 00000018H
	test	eax, eax
	je	SHORT $L70318
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 175		; 000000afH
	jmp	$eva_err$70309
$L70318:

; 176  : 		if(qry_exec_filter(cntxt, &flt, sql->data)) STACK_ERROR;

	mov	ecx, DWORD PTR _sql$[ebp]
	add	ecx, 8
	push	ecx
	lea	edx, DWORD PTR _flt$[ebp]
	push	edx
	mov	eax, DWORD PTR _cntxt$[ebp]
	push	eax
	call	_qry_exec_filter
	add	esp, 12					; 0000000cH
	test	eax, eax
	je	SHORT $L70319
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 176		; 000000b0H
	jmp	$eva_err$70309
$L70319:

; 177  : 		pv->nbobj = cntxt->sql_nbrows;

	mov	edx, DWORD PTR _pv$[ebp]
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	ecx, DWORD PTR [eax+29848]
	mov	DWORD PTR [edx+196], ecx

; 178  : 		pv->b_empty = !pv->nbobj;

	mov	edx, DWORD PTR _pv$[ebp]
	xor	eax, eax
	cmp	DWORD PTR [edx+196], 0
	sete	al
	mov	ecx, DWORD PTR _pv$[ebp]
	mov	DWORD PTR [ecx+94224], eax

; 179  : 		if(sql_exec_query(cntxt, "ALTER TABLE DTmpPVT ADD INDEX(IdObj)")) STACK_ERROR;

	push	OFFSET FLAT:$SG70321
	mov	edx, DWORD PTR _cntxt$[ebp]
	push	edx
	call	_sql_exec_query
	add	esp, 8
	test	eax, eax
	je	SHORT $L70320
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 179		; 000000b3H
	jmp	$eva_err$70309
$L70320:

; 181  : 
; 182  : 	/* Handle litteral condition if not empty */
; 183  : 	if(pv->condexpr && *pv->condexpr)

	mov	ecx, DWORD PTR _pv$[ebp]
	cmp	DWORD PTR [ecx+48], 0
	je	$eva_noerr$70341
	mov	edx, DWORD PTR _pv$[ebp]
	mov	eax, DWORD PTR [edx+48]
	movsx	ecx, BYTE PTR [eax]
	test	ecx, ecx
	je	$eva_noerr$70341

; 185  : 		/* Evaluate given condition */
; 186  : 		if(qry_filter_sql_fieldexpr(cntxt, &id_obj, pv->condexpr, pv->objtable, NULL)) CLEAR_ERROR;

	push	0
	mov	edx, DWORD PTR _pv$[ebp]
	add	edx, 160				; 000000a0H
	push	edx
	mov	eax, DWORD PTR _pv$[ebp]
	mov	ecx, DWORD PTR [eax+48]
	push	ecx
	lea	edx, DWORD PTR _id_obj$[ebp]
	push	edx
	mov	eax, DWORD PTR _cntxt$[ebp]
	push	eax
	call	_qry_filter_sql_fieldexpr
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L70324
	push	186					; 000000baH
	push	OFFSET FLAT:$SG70325
	push	OFFSET FLAT:$SG70326
	mov	ecx, DWORD PTR _cntxt$[ebp]
	push	ecx
	call	_err_clear
	add	esp, 16					; 00000010H
$L70324:

; 187  : 
; 188  : 		/* Delete unmatched objects */
; 189  : 		if(pv->nbobj > id_obj.nbrows)

	mov	edx, DWORD PTR _pv$[ebp]
	mov	eax, DWORD PTR [edx+196]
	cmp	eax, DWORD PTR _id_obj$[ebp]
	jbe	$L70339

; 191  : 			M_FREE(sql);

	mov	ecx, DWORD PTR _sql$[ebp]
	push	ecx
	call	_mem_free
	add	esp, 4
	mov	DWORD PTR _sql$[ebp], 0

; 193  : 				"-- pivottable_select - remove objects not matching condition\n"
; 194  : 				"DELETE FROM DTmpPVT WHERE IdObj NOT IN (");

	push	0
	push	0
	push	101					; 00000065H
	push	OFFSET FLAT:$SG70330
	lea	edx, DWORD PTR _sql$[ebp]
	push	edx
	call	_dynbuf_add
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L70329
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29872], OFFSET FLAT:$SG70332
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 194		; 000000c2H
	jmp	$eva_err$70309
$L70329:

; 195  : 			if(qry_values_list(cntxt, &id_obj, 0, &sql)) STACK_ERROR;

	lea	edx, DWORD PTR _sql$[ebp]
	push	edx
	push	0
	lea	eax, DWORD PTR _id_obj$[ebp]
	push	eax
	mov	ecx, DWORD PTR _cntxt$[ebp]
	push	ecx
	call	_qry_values_list
	add	esp, 16					; 00000010H
	test	eax, eax
	je	SHORT $L70333
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 195		; 000000c3H
	jmp	$eva_err$70309
$L70333:

; 196  : 			DYNBUF_ADD_STR(&sql, ")");

	push	0
	push	0
	push	1
	push	OFFSET FLAT:$SG70336
	lea	eax, DWORD PTR _sql$[ebp]
	push	eax
	call	_dynbuf_add
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L70335
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29872], OFFSET FLAT:$SG70338
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 196		; 000000c4H
	jmp	$eva_err$70309
$L70335:

; 197  : 			if(sql_exec_query(cntxt, sql->data)) STACK_ERROR;

	mov	eax, DWORD PTR _sql$[ebp]
	add	eax, 8
	push	eax
	mov	ecx, DWORD PTR _cntxt$[ebp]
	push	ecx
	call	_sql_exec_query
	add	esp, 8
	test	eax, eax
	je	SHORT $L70339
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 197		; 000000c5H
	jmp	SHORT $eva_err$70309
$L70339:

; 199  : 		pv->nbobj = (id_obj.nbrows == 1 && !DYNTAB_TOUL(&id_obj)) ? 0 : id_obj.nbrows;

	cmp	DWORD PTR _id_obj$[ebp], 1
	jne	SHORT $L71512
	push	10					; 0000000aH
	push	0
	push	0
	push	0
	lea	eax, DWORD PTR _id_obj$[ebp]
	push	eax
	call	_dyntab_val
	add	esp, 12					; 0000000cH
	push	eax
	call	_strtoul
	add	esp, 12					; 0000000cH
	test	eax, eax
	jne	SHORT $L71512
	mov	DWORD PTR -4484+[ebp], 0
	jmp	SHORT $L71513
$L71512:
	mov	ecx, DWORD PTR _id_obj$[ebp]
	mov	DWORD PTR -4484+[ebp], ecx
$L71513:
	mov	edx, DWORD PTR _pv$[ebp]
	mov	eax, DWORD PTR -4484+[ebp]
	mov	DWORD PTR [edx+196], eax

; 200  : 		pv->b_empty = !pv->nbobj;

	mov	ecx, DWORD PTR _pv$[ebp]
	xor	edx, edx
	cmp	DWORD PTR [ecx+196], 0
	sete	dl
	mov	eax, DWORD PTR _pv$[ebp]
	mov	DWORD PTR [eax+94224], edx
$eva_noerr$70341:

; 202  : 
; 203  : 	RETURN_OK_CLEANUP;

	push	0
	push	OFFSET FLAT:$SG70342
	push	OFFSET FLAT:$SG70343
	mov	ecx, DWORD PTR _cntxt$[ebp]
	push	ecx
	call	_err_clear
	add	esp, 16					; 00000010H
$eva_err$70309:
	mov	edx, DWORD PTR _cntxt$[ebp]
	cmp	DWORD PTR [edx+29872], 0
	je	SHORT $L70344
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	ecx, DWORD PTR [eax+29900]
	push	ecx
	push	OFFSET FLAT:$SG70345
	push	OFFSET FLAT:$SG70346
	mov	edx, DWORD PTR _cntxt$[ebp]
	push	edx
	call	_err_add_context
	add	esp, 16					; 00000010H
$L70344:
	lea	eax, DWORD PTR _id_obj$[ebp]
	push	eax
	call	_dyntab_free
	add	esp, 4
	mov	ecx, DWORD PTR _sql$[ebp]
	push	ecx
	call	_mem_free
	add	esp, 4
	mov	DWORD PTR _sql$[ebp], 0
	lea	edx, DWORD PTR _flt$[ebp]
	push	edx
	call	_qry_build_free
	add	esp, 4
	mov	eax, DWORD PTR _cntxt$[ebp]
	xor	ecx, ecx
	cmp	DWORD PTR [eax+29872], 0
	setne	cl
	mov	eax, ecx

; 204  : }

	pop	edi
	mov	esp, ebp
	pop	ebp
	ret	0
_pivottable_select ENDP
_TEXT	ENDS
PUBLIC	_pivottable_get_field_data
EXTRN	_datetxt_to_time:NEAR
EXTRN	_delay_to_datetxt:NEAR
EXTRN	_datetxt_to_format:NEAR
EXTRN	__snprintf:NEAR
EXTRN	_sprintf:NEAR
EXTRN	_mem_alloc:NEAR
EXTRN	_qry_make_idlist:NEAR
EXTRN	_sql_get_table:NEAR
EXTRN	_dyntab_sz:NEAR
EXTRN	_memcpy:NEAR
EXTRN	_dyntab_add:NEAR
EXTRN	_strlen:NEAR
EXTRN	_strchr:NEAR
EXTRN	_qry_eval_sql_fieldexpr:NEAR
EXTRN	_dyntab_to_dynbuf:NEAR
EXTRN	_strncmp:NEAR
EXTRN	_strncpy:NEAR
EXTRN	_put_debug_sqltable:NEAR
EXTRN	_qry_add_filter:NEAR
EXTRN	_qry_parse_fieldexpr:NEAR
_BSS	SEGMENT
	ALIGN	4

$SG70506 DB	01H DUP (?)
	ALIGN	4

$SG70550 DB	01H DUP (?)
_BSS	ENDS
_DATA	SEGMENT
	ORG $+2
$SG70384 DB	'%cTmp%s', 00H
$SG70387 DB	' TYPE=HEAP', 0aH, 00H
$SG70388 DB	'-- pivottable_add_field - Create field idobj table', 0aH
	DB	'CREATE TEMPORARY TABLE ', 00H
	ORG $+1
$SG70390 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70398 DB	'SELECT DISTINCT IdObj FROM TLink WHERE IdObj IN (', 00H
	ORG $+2
$SG70400 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70403 DB	',', 00H
	ORG $+2
$SG70406 DB	')', 00H
	ORG $+2
$SG70408 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70410 DB	'ALTER TABLE %s ADD INDEX(IdObj)', 00H
$SG70414 DB	0aH, 00H
	ORG $+2
$SG70415 DB	'-- pivottable_add_field - Create field values table', 0aH
	DB	'CREATE TEMPORARY TABLE ', 00H
$SG70417 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70422 DB	',', 00H
	ORG $+2
$SG70424 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70429 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70435 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70438 DB	'SELECT ', 00H
$SG70440 DB	'TmpExpr', 00H
$SG70443 DB	'%cTmp%s', 00H
$SG70444 DB	'-- pivottable_add_field - Build table of base objects fo'
	DB	'r SQL expression', 0aH, 'CREATE TEMPORARY TABLE %s TYPE=HEAP', 0aH
	DB	'SELECT DISTINCT IdObj FROM %s', 00H
	ORG $+1
$SG70448 DB	'IdObj', 00H
	ORG $+2
$SG70449 DB	'IdRelObj', 00H
	ORG $+3
$SG70450 DB	'-- pivottable_add_field - Build table of base objects fo'
	DB	'r SQL expression', 0aH, 'CREATE TEMPORARY TABLE TmpExpr TYPE='
	DB	'HEAP', 0aH, 'SELECT DISTINCT %s AS IdObj FROM %s', 00H
	ORG $+2
$SG70452 DB	'TmpValExpr', 00H
	ORG $+1
$SG70460 DB	'TmpExpr', 00H
$SG70462 DB	'TmpExpr', 00H
$SG70464 DB	'IdObj', 00H
	ORG $+2
$SG70465 DB	'IdRelObj', 00H
	ORG $+3
$SG70466 DB	'-- pivottable_add_field - Build values table', 0aH, 'CRE'
	DB	'ATE TEMPORARY TABLE %s TYPE=HEAP', 0aH, 'SELECT %s.IdObj,LEFT'
	DB	'(TmpValExpr.Val,250) AS Val,TmpValExpr.Line AS Line FROM %s', 0aH
	DB	'INNER JOIN TmpValExpr ON TmpValExpr.IdObj=%s.%s', 00H
	ORG $+3
$SG70468 DB	'TmpValExpr', 00H
	ORG $+1
$SG70472 DB	'SELECT DISTINCT IdObj FROM %s', 00H
	ORG $+2
$SG70480 DB	',250)', 00H
	ORG $+2
$SG70481 DB	'LEFT(', 00H
	ORG $+2
$SG70483 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70488 DB	'''''', 00H
	ORG $+1
$SG70490 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70493 DB	'NULL AS Line', 00H
	ORG $+3
$SG70495 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70501 DB	'_EVA_YEAR', 00H
	ORG $+2
$SG70502 DB	'_EVA_YEAR', 00H
	ORG $+2
$SG70503 DB	'_EVA_MONTH', 00H
	ORG $+1
$SG70508 DB	'_EVA_WEEK', 00H
	ORG $+2
$SG70509 DB	'DAY', 00H
$SG70510 DB	'_EVA_WEEK', 00H
	ORG $+2
$SG70511 DB	'SELECT DATE_SUB(CURDATE(),INTERVAL %ld %s)+0', 00H
	ORG $+3
$SG70516 DB	'_EVA_FUTURE', 00H
$SG70520 DB	'_EVA_WEEK', 00H
	ORG $+2
$SG70524 DB	'_EVA_DATE_SORT', 00H
	ORG $+1
$SG70525 DB	'_EVA_WEEK', 00H
	ORG $+2
$SG70526 DB	'DAY', 00H
$SG70527 DB	'_EVA_WEEK', 00H
	ORG $+2
$SG70528 DB	'SELECT DATE_ADD(''%s'', INTERVAL %lu %s)+0', 00H
	ORG $+3
$SG70534 DB	0aH, 'AND ', 00H
	ORG $+2
$SG70536 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70539 DB	'%s>=''%s'' AND %s<''%.*s''', 00H
	ORG $+1
$SG70543 DB	'ALTER TABLE %s ADD INDEX(IdObj)', 00H
$SG70548 DB	'ALTER TABLE %s MODIFY Val VARCHAR(250)', 00H
	ORG $+1
$SG70551 DB	',MAX(Line)', 00H
	ORG $+1
$SG70552 DB	'SELECT COUNT(DISTINCT IdObj),COUNT(IdObj),COUNT(DISTINCT'
	DB	' Val),MIN(Val),MAX(Val)%s FROM %s', 00H
	ORG $+2
$SG70563 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70571 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70576 DB	'D:\Travail\ABI\EVA\V4.0\CGI\Brunix-2016\pivottable.c', 00H
	ORG $+3
$SG70577 DB	'pivottable_get_field_data', 00H
	ORG $+2
$SG70579 DB	'D:\Travail\ABI\EVA\V4.0\CGI\Brunix-2016\pivottable.c', 00H
	ORG $+3
$SG70580 DB	'pivottable_get_field_data', 00H
_DATA	ENDS
_TEXT	SEGMENT
_cntxt$ = 8
_pv$ = 12
_pvf$ = 16
_id_obj$ = -1080
_data$ = -1052
_sql$ = -4
_tmp$ = -1060
_expr$ = -1032
_flt$ = -5540
_b_linkonrelobj$ = -1084
_printbuf$ = -1028
_b_cal_filter$ = -1056
_srcobj$70439 = -5544
_dsttbl$70441 = -5548
_tr$70497 = -5552
_date$70518 = -5584
_t$70521 = -5588
_dt$70522 = -5624
_size$70558 = -5628
_src$70559 = -5632
_size1$70560 = -5636
_size$70566 = -5640
_src$70567 = -5644
_size1$70568 = -5648
_pivottable_get_field_data PROC NEAR

; 223  : ){

	push	ebp
	mov	ebp, esp
	mov	eax, 5700				; 00001644H
	call	__chkstk
	push	edi

; 224  : 	DynTable id_obj = {0};

	mov	DWORD PTR _id_obj$[ebp], 0
	xor	eax, eax
	mov	DWORD PTR _id_obj$[ebp+4], eax
	mov	DWORD PTR _id_obj$[ebp+8], eax
	mov	DWORD PTR _id_obj$[ebp+12], eax
	mov	DWORD PTR _id_obj$[ebp+16], eax

; 225  : 	DynTable data = {0};

	mov	DWORD PTR _data$[ebp], 0
	xor	ecx, ecx
	mov	DWORD PTR _data$[ebp+4], ecx
	mov	DWORD PTR _data$[ebp+8], ecx
	mov	DWORD PTR _data$[ebp+12], ecx
	mov	DWORD PTR _data$[ebp+16], ecx

; 226  : 	DynBuffer *sql = NULL;

	mov	DWORD PTR _sql$[ebp], 0

; 227  : 	DynBuffer *tmp = NULL;

	mov	DWORD PTR _tmp$[ebp], 0

; 228  : 	DynBuffer *expr = NULL;

	mov	DWORD PTR _expr$[ebp], 0

; 229  : 	QryBuild flt = {{0}};

	mov	DWORD PTR _flt$[ebp], 0
	xor	edx, edx
	mov	DWORD PTR _flt$[ebp+4], edx
	mov	DWORD PTR _flt$[ebp+8], edx
	mov	DWORD PTR _flt$[ebp+12], edx
	mov	DWORD PTR _flt$[ebp+16], edx
	mov	ecx, 1109				; 00000455H
	xor	eax, eax
	lea	edi, DWORD PTR _flt$[ebp+20]
	rep stosd

; 230  : 	int b_linkonrelobj = 0;

	mov	DWORD PTR _b_linkonrelobj$[ebp], 0

; 231  : 	char printbuf[1024];
; 232  : 	int b_cal_filter = 0;

	mov	DWORD PTR _b_cal_filter$[ebp], 0

; 233  : 
; 234  : 	/* Handle link to data table */
; 235  : 	pvf->relmode = get_relmode(pv, &pvf->relfields, pvf->srctable, pvf->datatable);

	mov	eax, DWORD PTR _pvf$[ebp]
	add	eax, 208				; 000000d0H
	push	eax
	mov	ecx, DWORD PTR _pvf$[ebp]
	mov	edx, DWORD PTR [ecx+272]
	push	edx
	mov	eax, DWORD PTR _pvf$[ebp]
	add	eax, 540				; 0000021cH
	push	eax
	mov	ecx, DWORD PTR _pv$[ebp]
	push	ecx
	call	_get_relmode
	add	esp, 16					; 00000010H
	mov	edx, DWORD PTR _pvf$[ebp]
	mov	DWORD PTR [edx+536], eax

; 236  : 	if(pvf->relmode == RelReverse)

	mov	eax, DWORD PTR _pvf$[ebp]
	cmp	DWORD PTR [eax+536], 2
	jne	$L70370

; 238  : 		if(qry_add_filter(cntxt, &flt, RelReverse, NULL, NoMatch, NULL)) STACK_ERROR;

	push	0
	push	0
	push	0
	push	2
	lea	ecx, DWORD PTR _flt$[ebp]
	push	ecx
	mov	edx, DWORD PTR _cntxt$[ebp]
	push	edx
	call	_qry_add_filter
	add	esp, 24					; 00000018H
	test	eax, eax
	je	SHORT $L70373
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 238		; 000000eeH
	jmp	$eva_err$70374
$L70373:

; 239  : 		if(qry_add_filter(cntxt, &flt, RelDirect, pvf->relfields, NoMatch, NULL)) STACK_ERROR;

	push	0
	push	0
	mov	ecx, DWORD PTR _pvf$[ebp]
	mov	edx, DWORD PTR [ecx+540]
	push	edx
	push	1
	lea	eax, DWORD PTR _flt$[ebp]
	push	eax
	mov	ecx, DWORD PTR _cntxt$[ebp]
	push	ecx
	call	_qry_add_filter
	add	esp, 24					; 00000018H
	test	eax, eax
	je	SHORT $L70376
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 239		; 000000efH
	jmp	$eva_err$70374
$L70376:

; 240  : 		flt.srcjoin = 1;

	mov	DWORD PTR _flt$[ebp+64], 1

; 241  : 		b_linkonrelobj = 1;

	mov	DWORD PTR _b_linkonrelobj$[ebp], 1

; 243  : 	else if(pvf->relmode == RelDirect)

	jmp	SHORT $L70378
$L70370:
	mov	eax, DWORD PTR _pvf$[ebp]
	cmp	DWORD PTR [eax+536], 1
	jne	SHORT $L70378

; 245  : 		if(qry_add_filter(cntxt, &flt, RelDirect, pvf->relfields, NoMatch, NULL)) STACK_ERROR;

	push	0
	push	0
	mov	ecx, DWORD PTR _pvf$[ebp]
	mov	edx, DWORD PTR [ecx+540]
	push	edx
	push	1
	lea	eax, DWORD PTR _flt$[ebp]
	push	eax
	mov	ecx, DWORD PTR _cntxt$[ebp]
	push	ecx
	call	_qry_add_filter
	add	esp, 24					; 00000018H
	test	eax, eax
	je	SHORT $L70380
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 245		; 000000f5H
	jmp	$eva_err$70374
$L70380:

; 246  : 		flt.srcjoin = 0;

	mov	DWORD PTR _flt$[ebp+64], 0

; 247  : 		b_linkonrelobj = 1;

	mov	DWORD PTR _b_linkonrelobj$[ebp], 1
$L70378:

; 249  : 
; 250  : 	/* Handle formstamp & filter condition */
; 251  : 	flt.srctable = pvf->srctable;

	mov	eax, DWORD PTR _pvf$[ebp]
	mov	ecx, DWORD PTR [eax+272]
	mov	DWORD PTR _flt$[ebp+20], ecx

; 252  : 	if(qry_add_filter_forms(cntxt, &flt, &pvf->forms, &pvf->filters)) STACK_ERROR;

	mov	edx, DWORD PTR _pvf$[ebp]
	add	edx, 84					; 00000054H
	push	edx
	mov	eax, DWORD PTR _pvf$[ebp]
	add	eax, 64					; 00000040H
	push	eax
	lea	ecx, DWORD PTR _flt$[ebp]
	push	ecx
	mov	edx, DWORD PTR _cntxt$[ebp]
	push	edx
	call	_qry_add_filter_forms
	add	esp, 16					; 00000010H
	test	eax, eax
	je	SHORT $L70381
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 252		; 000000fcH
	jmp	$eva_err$70374
$L70381:

; 253  : 
; 254  : 	/* Build temporary list of matching & related objects if applicable */
; 255  : 	if(flt.nbnode || flt.node->idobjmatch.nbrows)

	cmp	DWORD PTR _flt$[ebp+4424], 0
	jne	SHORT $L70383
	cmp	DWORD PTR _flt$[ebp+168], 0
	je	$L70411
$L70383:

; 257  : 		snprintf(add_sz_str(pvf->objtable), "%cTmp%s", *pvf->pos, pvf->datatable);

	mov	ecx, DWORD PTR _pvf$[ebp]
	add	ecx, 208				; 000000d0H
	push	ecx
	mov	edx, DWORD PTR _pvf$[ebp]
	mov	eax, DWORD PTR [edx+184]
	movsx	ecx, BYTE PTR [eax]
	push	ecx
	push	OFFSET FLAT:$SG70384
	push	31					; 0000001fH
	mov	edx, DWORD PTR _pvf$[ebp]
	add	edx, 240				; 000000f0H
	push	edx
	call	__snprintf
	add	esp, 20					; 00000014H

; 259  : 			"-- pivottable_add_field - Create field idobj table\n"
; 260  : 			"CREATE TEMPORARY TABLE ", pvf->objtable, 0, NO_CONV, " TYPE=HEAP\n");

	push	11					; 0000000bH
	push	OFFSET FLAT:$SG70387
	push	0
	push	0
	push	0
	mov	eax, DWORD PTR _pvf$[ebp]
	add	eax, 240				; 000000f0H
	push	eax
	push	74					; 0000004aH
	push	OFFSET FLAT:$SG70388
	lea	ecx, DWORD PTR _sql$[ebp]
	push	ecx
	call	_dynbuf_add3
	add	esp, 36					; 00000024H
	test	eax, eax
	je	SHORT $L70386
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29872], OFFSET FLAT:$SG70390
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 260		; 00000104H
	jmp	$eva_err$70374
$L70386:

; 261  : 		cntxt->sql_nbrows = 0;

	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29848], 0

; 262  : 		if(flt.nbnode)

	cmp	DWORD PTR _flt$[ebp+4424], 0
	je	$L70391

; 264  : 			if(qry_build_clauses(cntxt, &flt, pvf->relmode == RelNone ? 1 : b_linkonrelobj ? 3 : 2)) STACK_ERROR;

	mov	edx, DWORD PTR _pvf$[ebp]
	cmp	DWORD PTR [edx+536], 0
	jne	SHORT $L71516
	mov	DWORD PTR -5652+[ebp], 1
	jmp	SHORT $L71517
$L71516:
	xor	eax, eax
	cmp	DWORD PTR _b_linkonrelobj$[ebp], 0
	setne	al
	add	eax, 2
	mov	DWORD PTR -5652+[ebp], eax
$L71517:
	mov	ecx, DWORD PTR -5652+[ebp]
	push	ecx
	lea	edx, DWORD PTR _flt$[ebp]
	push	edx
	mov	eax, DWORD PTR _cntxt$[ebp]
	push	eax
	call	_qry_build_clauses
	add	esp, 12					; 0000000cH
	test	eax, eax
	je	SHORT $L70392
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 264		; 00000108H
	jmp	$eva_err$70374
$L70392:

; 265  : 			if(qry_build_flt_select(cntxt, &sql, &id_obj, &flt, 0, 0)) STACK_ERROR;

	push	0
	push	0
	lea	edx, DWORD PTR _flt$[ebp]
	push	edx
	lea	eax, DWORD PTR _id_obj$[ebp]
	push	eax
	lea	ecx, DWORD PTR _sql$[ebp]
	push	ecx
	mov	edx, DWORD PTR _cntxt$[ebp]
	push	edx
	call	_qry_build_flt_select
	add	esp, 24					; 00000018H
	test	eax, eax
	je	SHORT $L70393
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 265		; 00000109H
	jmp	$eva_err$70374
$L70393:

; 266  : 			if(qry_exec_filter(cntxt, &flt, sql->data)) STACK_ERROR;

	mov	ecx, DWORD PTR _sql$[ebp]
	add	ecx, 8
	push	ecx
	lea	edx, DWORD PTR _flt$[ebp]
	push	edx
	mov	eax, DWORD PTR _cntxt$[ebp]
	push	eax
	call	_qry_exec_filter
	add	esp, 12					; 0000000cH
	test	eax, eax
	je	SHORT $L70394
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 266		; 0000010aH
	jmp	$eva_err$70374
$L70394:

; 268  : 		else

	jmp	$L70409
$L70391:

; 270  : 			DYNBUF_ADD_STR(&sql, "SELECT DISTINCT IdObj FROM TLink WHERE IdObj IN (");

	push	0
	push	0
	push	49					; 00000031H
	push	OFFSET FLAT:$SG70398
	lea	edx, DWORD PTR _sql$[ebp]
	push	edx
	call	_dynbuf_add
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L70397
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29872], OFFSET FLAT:$SG70400
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 270		; 0000010eH
	jmp	$eva_err$70374
$L70397:

; 271  : 			if(dyntab_to_dynbuf(&flt.node->idobjmatch, &sql, 0, 0, ",", 1, NO_CONV)) STACK_ERROR;

	push	0
	push	0
	push	1
	push	OFFSET FLAT:$SG70403
	push	0
	push	0
	lea	edx, DWORD PTR _sql$[ebp]
	push	edx
	lea	eax, DWORD PTR _flt$[ebp+168]
	push	eax
	call	_dyntab_to_dynbuf
	add	esp, 32					; 00000020H
	test	eax, eax
	je	SHORT $L70402
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 271		; 0000010fH
	jmp	$eva_err$70374
$L70402:

; 272  : 			DYNBUF_ADD_STR(&sql, ")");

	push	0
	push	0
	push	1
	push	OFFSET FLAT:$SG70406
	lea	edx, DWORD PTR _sql$[ebp]
	push	edx
	call	_dynbuf_add
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L70405
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29872], OFFSET FLAT:$SG70408
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 272		; 00000110H
	jmp	$eva_err$70374
$L70405:

; 273  : 			if(sql_exec_query(cntxt, sql->data)) STACK_ERROR;

	mov	edx, DWORD PTR _sql$[ebp]
	add	edx, 8
	push	edx
	mov	eax, DWORD PTR _cntxt$[ebp]
	push	eax
	call	_sql_exec_query
	add	esp, 8
	test	eax, eax
	je	SHORT $L70409
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 273		; 00000111H
	jmp	$eva_err$70374
$L70409:

; 275  : 		pvf->nbsrcobj = cntxt->sql_nbrows;

	mov	edx, DWORD PTR _pvf$[ebp]
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	ecx, DWORD PTR [eax+29848]
	mov	DWORD PTR [edx+292], ecx

; 276  : 
; 277  : 		/* Add index to list of matching object table */
; 278  : 		snprintf(add_sz_str(printbuf), "ALTER TABLE %s ADD INDEX(IdObj)", pvf->objtable);

	mov	edx, DWORD PTR _pvf$[ebp]
	add	edx, 240				; 000000f0H
	push	edx
	push	OFFSET FLAT:$SG70410
	push	1023					; 000003ffH
	lea	eax, DWORD PTR _printbuf$[ebp]
	push	eax
	call	__snprintf
	add	esp, 16					; 00000010H

; 279  : 		if(sql_exec_query(cntxt, printbuf)) STACK_ERROR;

	lea	ecx, DWORD PTR _printbuf$[ebp]
	push	ecx
	mov	edx, DWORD PTR _cntxt$[ebp]
	push	edx
	call	_sql_exec_query
	add	esp, 8
	test	eax, eax
	je	SHORT $L70411
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 279		; 00000117H
	jmp	$eva_err$70374
$L70411:

; 281  : 
; 282  : 	/* Prepare query for field values table */
; 283  : 	sql_drop_table(cntxt, pvf->datatable);

	mov	ecx, DWORD PTR _pvf$[ebp]
	add	ecx, 208				; 000000d0H
	push	ecx
	mov	edx, DWORD PTR _cntxt$[ebp]
	push	edx
	call	_sql_drop_table
	add	esp, 8

; 284  : 	M_FREE(sql);

	mov	eax, DWORD PTR _sql$[ebp]
	push	eax
	call	_mem_free
	add	esp, 4
	mov	DWORD PTR _sql$[ebp], 0

; 286  : 		"-- pivottable_add_field - Create field values table\n"
; 287  : 		"CREATE TEMPORARY TABLE ", pvf->datatable, 0, NO_CONV, "\n");

	push	1
	push	OFFSET FLAT:$SG70414
	push	0
	push	0
	push	0
	mov	ecx, DWORD PTR _pvf$[ebp]
	add	ecx, 208				; 000000d0H
	push	ecx
	push	75					; 0000004bH
	push	OFFSET FLAT:$SG70415
	lea	edx, DWORD PTR _sql$[ebp]
	push	edx
	call	_dynbuf_add3
	add	esp, 36					; 00000024H
	test	eax, eax
	je	SHORT $L70413
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29872], OFFSET FLAT:$SG70417
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 287		; 0000011fH
	jmp	$eva_err$70374
$L70413:

; 288  : 
; 289  : 	/* Handle multiple fields : concat fields */
; 290  : 	if(pvf->expr.nbrows > 1)

	mov	edx, DWORD PTR _pvf$[ebp]
	cmp	DWORD PTR [edx+4], 1
	jbe	$L70433

; 292  : 		if(dyntab_to_dynbuf(&pvf->expr, &expr, NULL, 0, ",", 1, NO_CONV)) RETURN_ERR_MEMORY;

	push	0
	push	0
	push	1
	push	OFFSET FLAT:$SG70422
	push	0
	push	0
	lea	eax, DWORD PTR _expr$[ebp]
	push	eax
	mov	ecx, DWORD PTR _pvf$[ebp]
	add	ecx, 4
	push	ecx
	call	_dyntab_to_dynbuf
	add	esp, 32					; 00000020H
	test	eax, eax
	je	SHORT $L70421
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29872], OFFSET FLAT:$SG70424
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 292		; 00000124H
	jmp	$eva_err$70374
$L70421:

; 293  : 		dyntab_free(&pvf->expr);

	mov	ecx, DWORD PTR _pvf$[ebp]
	add	ecx, 4
	push	ecx
	call	_dyntab_free
	add	esp, 4

; 294  : 		DYNTAB_ADD_BUF(&pvf->expr, 0, 0, expr);

	cmp	DWORD PTR _expr$[ebp], 0
	je	SHORT $L70425
	mov	edx, DWORD PTR _expr$[ebp]
	cmp	DWORD PTR [edx+4], 0
	je	SHORT $L70425
	push	0
	push	0
	mov	eax, DWORD PTR _expr$[ebp]
	mov	ecx, DWORD PTR [eax+4]
	push	ecx
	mov	edx, DWORD PTR _expr$[ebp]
	add	edx, 8
	push	edx
	push	0
	push	0
	mov	eax, DWORD PTR _pvf$[ebp]
	add	eax, 4
	push	eax
	call	_dyntab_add
	add	esp, 28					; 0000001cH
	test	eax, eax
	je	SHORT $L70427
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29872], OFFSET FLAT:$SG70429
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 294		; 00000126H
	jmp	$eva_err$70374
$L70427:
	jmp	SHORT $L70433
$L70425:
	push	0
	push	0
	push	0
	push	0
	push	0
	push	0
	mov	eax, DWORD PTR _pvf$[ebp]
	add	eax, 4
	push	eax
	call	_dyntab_add
	add	esp, 28					; 0000001cH
	test	eax, eax
	je	SHORT $L70433
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29872], OFFSET FLAT:$SG70435
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 294		; 00000126H
	jmp	$eva_err$70374
$L70433:

; 296  : 
; 297  : 	/* Handle SQL expression */
; 298  : 	if(strchr(dyntab_val(&pvf->expr, 0, 0), '[') || !strncmp(dyntab_val(&pvf->expr, 0, 0), "SELECT ", 7))

	push	91					; 0000005bH
	push	0
	push	0
	mov	eax, DWORD PTR _pvf$[ebp]
	add	eax, 4
	push	eax
	call	_dyntab_val
	add	esp, 12					; 0000000cH
	push	eax
	call	_strchr
	add	esp, 8
	test	eax, eax
	jne	SHORT $L70437
	push	7
	push	OFFSET FLAT:$SG70438
	push	0
	push	0
	mov	ecx, DWORD PTR _pvf$[ebp]
	add	ecx, 4
	push	ecx
	call	_dyntab_val
	add	esp, 12					; 0000000cH
	push	eax
	call	_strncmp
	add	esp, 12					; 0000000cH
	test	eax, eax
	jne	$L70436
$L70437:

; 300  : 		/* Build table of base objects if applicable */
; 301  : 		char *srcobj = "TmpExpr";

	mov	DWORD PTR _srcobj$70439[ebp], OFFSET FLAT:$SG70440

; 302  : 		char *dsttbl = pvf->datatable;

	mov	edx, DWORD PTR _pvf$[ebp]
	add	edx, 208				; 000000d0H
	mov	DWORD PTR _dsttbl$70441[ebp], edx

; 303  : 		if(!*pvf->objtable && pvf->srctable)

	mov	eax, DWORD PTR _pvf$[ebp]
	movsx	ecx, BYTE PTR [eax+240]
	test	ecx, ecx
	jne	$L70442
	mov	edx, DWORD PTR _pvf$[ebp]
	cmp	DWORD PTR [edx+272], 0
	je	$L70442

; 305  : 			snprintf(add_sz_str(pvf->objtable), "%cTmp%s", *pvf->pos, pvf->datatable);

	mov	eax, DWORD PTR _pvf$[ebp]
	add	eax, 208				; 000000d0H
	push	eax
	mov	ecx, DWORD PTR _pvf$[ebp]
	mov	edx, DWORD PTR [ecx+184]
	movsx	eax, BYTE PTR [edx]
	push	eax
	push	OFFSET FLAT:$SG70443
	push	31					; 0000001fH
	mov	ecx, DWORD PTR _pvf$[ebp]
	add	ecx, 240				; 000000f0H
	push	ecx
	call	__snprintf
	add	esp, 20					; 00000014H

; 306  : 			snprintf(add_sz_str(printbuf),
; 307  : 				"-- pivottable_add_field - Build table of base objects for SQL expression\n"
; 308  : 				"CREATE TEMPORARY TABLE %s TYPE=HEAP\n"
; 309  : 				"SELECT DISTINCT IdObj FROM %s",
; 310  : 				pvf->objtable, pvf->srctable);

	mov	edx, DWORD PTR _pvf$[ebp]
	mov	eax, DWORD PTR [edx+272]
	push	eax
	mov	ecx, DWORD PTR _pvf$[ebp]
	add	ecx, 240				; 000000f0H
	push	ecx
	push	OFFSET FLAT:$SG70444
	push	1023					; 000003ffH
	lea	edx, DWORD PTR _printbuf$[ebp]
	push	edx
	call	__snprintf
	add	esp, 20					; 00000014H

; 311  : 			if(sql_exec_query(cntxt, printbuf) || sql_get_table(cntxt, &id_obj, 2)) STACK_ERROR;

	lea	eax, DWORD PTR _printbuf$[ebp]
	push	eax
	mov	ecx, DWORD PTR _cntxt$[ebp]
	push	ecx
	call	_sql_exec_query
	add	esp, 8
	test	eax, eax
	jne	SHORT $L70446
	push	2
	lea	edx, DWORD PTR _id_obj$[ebp]
	push	edx
	mov	eax, DWORD PTR _cntxt$[ebp]
	push	eax
	call	_sql_get_table
	add	esp, 12					; 0000000cH
	test	eax, eax
	je	SHORT $L70445
$L70446:
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 311		; 00000137H
	jmp	$eva_err$70374
$L70445:

; 312  : 			pvf->nbsrcobj = cntxt->sql_nbrows;

	mov	edx, DWORD PTR _pvf$[ebp]
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	ecx, DWORD PTR [eax+29848]
	mov	DWORD PTR [edx+292], ecx
$L70442:

; 314  : 		if(pvf->objtable && pvf->objtable[0] && pvf->relmode != RelNone)

	mov	edx, DWORD PTR _pvf$[ebp]
	add	edx, 240				; 000000f0H
	test	edx, edx
	je	$L70447
	mov	eax, DWORD PTR _pvf$[ebp]
	movsx	ecx, BYTE PTR [eax+240]
	test	ecx, ecx
	je	$L70447
	mov	edx, DWORD PTR _pvf$[ebp]
	cmp	DWORD PTR [edx+536], 0
	je	$L70447

; 316  : 			snprintf(add_sz_str(printbuf),
; 317  : 				"-- pivottable_add_field - Build table of base objects for SQL expression\n"
; 318  : 				"CREATE TEMPORARY TABLE TmpExpr TYPE=HEAP\n"
; 319  : 				"SELECT DISTINCT %s AS IdObj FROM %s",
; 320  : 				pvf->relmode == RelNone ? "IdObj" : "IdRelObj",
; 321  : 				pvf->objtable);

	mov	eax, DWORD PTR _pvf$[ebp]
	cmp	DWORD PTR [eax+536], 0
	jne	SHORT $L71518
	mov	DWORD PTR -5656+[ebp], OFFSET FLAT:$SG70448
	jmp	SHORT $L71519
$L71518:
	mov	DWORD PTR -5656+[ebp], OFFSET FLAT:$SG70449
$L71519:
	mov	ecx, DWORD PTR _pvf$[ebp]
	add	ecx, 240				; 000000f0H
	push	ecx
	mov	edx, DWORD PTR -5656+[ebp]
	push	edx
	push	OFFSET FLAT:$SG70450
	push	1023					; 000003ffH
	lea	eax, DWORD PTR _printbuf$[ebp]
	push	eax
	call	__snprintf
	add	esp, 20					; 00000014H

; 322  : 			if(sql_exec_query(cntxt, printbuf)) STACK_ERROR;

	lea	ecx, DWORD PTR _printbuf$[ebp]
	push	ecx
	mov	edx, DWORD PTR _cntxt$[ebp]
	push	edx
	call	_sql_exec_query
	add	esp, 8
	test	eax, eax
	je	SHORT $L70451
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 322		; 00000142H
	jmp	$eva_err$70374
$L70451:

; 323  : 			dsttbl = "TmpValExpr";

	mov	DWORD PTR _dsttbl$70441[ebp], OFFSET FLAT:$SG70452

; 325  : 		else if(pvf->objtable && pvf->objtable[0]) srcobj = pvf->objtable;

	jmp	SHORT $L70459
$L70447:
	mov	ecx, DWORD PTR _pvf$[ebp]
	add	ecx, 240				; 000000f0H
	test	ecx, ecx
	je	SHORT $L70454
	mov	edx, DWORD PTR _pvf$[ebp]
	movsx	eax, BYTE PTR [edx+240]
	test	eax, eax
	je	SHORT $L70454
	mov	ecx, DWORD PTR _pvf$[ebp]
	add	ecx, 240				; 000000f0H
	mov	DWORD PTR _srcobj$70439[ebp], ecx

; 326  : 		else if(!id_obj.nbrows) srcobj = NULL;

	jmp	SHORT $L70459
$L70454:
	cmp	DWORD PTR _id_obj$[ebp], 0
	jne	SHORT $L70456
	mov	DWORD PTR _srcobj$70439[ebp], 0

; 327  : 		else if(qry_make_idlist(cntxt, &id_obj, "TmpExpr")) STACK_ERROR;

	jmp	SHORT $L70459
$L70456:
	push	OFFSET FLAT:$SG70460
	lea	edx, DWORD PTR _id_obj$[ebp]
	push	edx
	mov	eax, DWORD PTR _cntxt$[ebp]
	push	eax
	call	_qry_make_idlist
	add	esp, 12					; 0000000cH
	test	eax, eax
	je	SHORT $L70459
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 327		; 00000147H
	jmp	$eva_err$70374
$L70459:

; 328  : 
; 329  : 		/* Evaluate SQL expression on base objects */
; 330  : 		if(qry_eval_sql_fieldexpr(cntxt, dsttbl, dyntab_val(&pvf->expr, 0, 0), srcobj, &pvf->srcdata)) STACK_ERROR;

	mov	edx, DWORD PTR _pvf$[ebp]
	add	edx, 188				; 000000bcH
	push	edx
	mov	eax, DWORD PTR _srcobj$70439[ebp]
	push	eax
	push	0
	push	0
	mov	ecx, DWORD PTR _pvf$[ebp]
	add	ecx, 4
	push	ecx
	call	_dyntab_val
	add	esp, 12					; 0000000cH
	push	eax
	mov	edx, DWORD PTR _dsttbl$70441[ebp]
	push	edx
	mov	eax, DWORD PTR _cntxt$[ebp]
	push	eax
	call	_qry_eval_sql_fieldexpr
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L70461
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 330		; 0000014aH
	jmp	$eva_err$70374
$L70461:

; 331  : 		sql_drop_table(cntxt, "TmpExpr");

	push	OFFSET FLAT:$SG70462
	mov	edx, DWORD PTR _cntxt$[ebp]
	push	edx
	call	_sql_drop_table
	add	esp, 8

; 332  : 
; 333  : 		/* Build values table if applicable */
; 334  : 		if(dsttbl != pvf->datatable)

	mov	eax, DWORD PTR _pvf$[ebp]
	add	eax, 208				; 000000d0H
	cmp	DWORD PTR _dsttbl$70441[ebp], eax
	je	$L70463

; 336  : 			snprintf(add_sz_str(printbuf),
; 337  : 				"-- pivottable_add_field - Build values table\n"
; 338  : 				"CREATE TEMPORARY TABLE %s TYPE=HEAP\n"
; 339  : 				"SELECT %s.IdObj,LEFT(TmpValExpr.Val,250) AS Val,TmpValExpr.Line AS Line FROM %s\n"
; 340  : 				"INNER JOIN TmpValExpr ON TmpValExpr.IdObj=%s.%s",
; 341  : 				pvf->datatable, pvf->objtable, pvf->objtable, pvf->objtable,
; 342  : 				pvf->relmode == RelNone ? "IdObj" : "IdRelObj");

	mov	ecx, DWORD PTR _pvf$[ebp]
	cmp	DWORD PTR [ecx+536], 0
	jne	SHORT $L71520
	mov	DWORD PTR -5660+[ebp], OFFSET FLAT:$SG70464
	jmp	SHORT $L71521
$L71520:
	mov	DWORD PTR -5660+[ebp], OFFSET FLAT:$SG70465
$L71521:
	mov	edx, DWORD PTR -5660+[ebp]
	push	edx
	mov	eax, DWORD PTR _pvf$[ebp]
	add	eax, 240				; 000000f0H
	push	eax
	mov	ecx, DWORD PTR _pvf$[ebp]
	add	ecx, 240				; 000000f0H
	push	ecx
	mov	edx, DWORD PTR _pvf$[ebp]
	add	edx, 240				; 000000f0H
	push	edx
	mov	eax, DWORD PTR _pvf$[ebp]
	add	eax, 208				; 000000d0H
	push	eax
	push	OFFSET FLAT:$SG70466
	push	1023					; 000003ffH
	lea	ecx, DWORD PTR _printbuf$[ebp]
	push	ecx
	call	__snprintf
	add	esp, 32					; 00000020H

; 343  : 			if(sql_exec_query(cntxt, printbuf)) STACK_ERROR;

	lea	edx, DWORD PTR _printbuf$[ebp]
	push	edx
	mov	eax, DWORD PTR _cntxt$[ebp]
	push	eax
	call	_sql_exec_query
	add	esp, 8
	test	eax, eax
	je	SHORT $L70467
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 343		; 00000157H
	jmp	$eva_err$70374
$L70467:

; 344  : 			sql_drop_table(cntxt, "TmpValExpr");

	push	OFFSET FLAT:$SG70468
	mov	edx, DWORD PTR _cntxt$[ebp]
	push	edx
	call	_sql_drop_table
	add	esp, 8
$L70463:

; 347  : 	else

	jmp	$L70542
$L70436:

; 349  : 		/* Parse field relational expression */
; 350  : 		qry_build_free(&flt);

	lea	eax, DWORD PTR _flt$[ebp]
	push	eax
	call	_qry_build_free
	add	esp, 4

; 351  : 		if(dyntab_sz(&pvf->expr, 0, 0))

	push	0
	push	0
	mov	ecx, DWORD PTR _pvf$[ebp]
	add	ecx, 4
	push	ecx
	call	_dyntab_sz
	add	esp, 12					; 0000000cH
	test	eax, eax
	je	$L70470

; 353  : 			/* Get unique idobj list from source table if applicable */
; 354  : 			if(!*pvf->objtable && pvf->srctable)

	mov	edx, DWORD PTR _pvf$[ebp]
	movsx	eax, BYTE PTR [edx+240]
	test	eax, eax
	jne	$L70471
	mov	ecx, DWORD PTR _pvf$[ebp]
	cmp	DWORD PTR [ecx+272], 0
	je	SHORT $L70471

; 356  : 				snprintf(add_sz_str(printbuf), "SELECT DISTINCT IdObj FROM %s", pvf->srctable);

	mov	edx, DWORD PTR _pvf$[ebp]
	mov	eax, DWORD PTR [edx+272]
	push	eax
	push	OFFSET FLAT:$SG70472
	push	1023					; 000003ffH
	lea	ecx, DWORD PTR _printbuf$[ebp]
	push	ecx
	call	__snprintf
	add	esp, 16					; 00000010H

; 357  : 				if(sql_exec_query(cntxt, printbuf) || sql_get_table(cntxt, &id_obj, 2)) STACK_ERROR;

	lea	edx, DWORD PTR _printbuf$[ebp]
	push	edx
	mov	eax, DWORD PTR _cntxt$[ebp]
	push	eax
	call	_sql_exec_query
	add	esp, 8
	test	eax, eax
	jne	SHORT $L70474
	push	2
	lea	ecx, DWORD PTR _id_obj$[ebp]
	push	ecx
	mov	edx, DWORD PTR _cntxt$[ebp]
	push	edx
	call	_sql_get_table
	add	esp, 12					; 0000000cH
	test	eax, eax
	je	SHORT $L70473
$L70474:
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 357		; 00000165H
	jmp	$eva_err$70374
$L70473:

; 358  : 				pvf->nbsrcobj = cntxt->sql_nbrows;

	mov	ecx, DWORD PTR _pvf$[ebp]
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	eax, DWORD PTR [edx+29848]
	mov	DWORD PTR [ecx+292], eax

; 360  : 			else

	jmp	SHORT $L70475
$L70471:

; 361  : 				flt.srctable = *pvf->objtable ? pvf->objtable : pvf->srctable;

	mov	ecx, DWORD PTR _pvf$[ebp]
	movsx	edx, BYTE PTR [ecx+240]
	test	edx, edx
	je	SHORT $L71522
	mov	eax, DWORD PTR _pvf$[ebp]
	add	eax, 240				; 000000f0H
	mov	DWORD PTR -5664+[ebp], eax
	jmp	SHORT $L71523
$L71522:
	mov	ecx, DWORD PTR _pvf$[ebp]
	mov	edx, DWORD PTR [ecx+272]
	mov	DWORD PTR -5664+[ebp], edx
$L71523:
	mov	eax, DWORD PTR -5664+[ebp]
	mov	DWORD PTR _flt$[ebp+20], eax
$L70475:

; 362  : 
; 363  : 			/* Parse field expression - Keep only 250 first chars */
; 364  : 			flt.b_recdata = 1;

	mov	DWORD PTR _flt$[ebp+4448], 1

; 365  : 			flt.b_linkonrelobj = b_linkonrelobj;

	mov	ecx, DWORD PTR _b_linkonrelobj$[ebp]
	mov	DWORD PTR _flt$[ebp+24], ecx

; 366  : 			if(qry_parse_fieldexpr(cntxt, DYNTAB_VAL_SZ(&pvf->expr, 0, 0), &flt)) STACK_ERROR;

	lea	edx, DWORD PTR _flt$[ebp]
	push	edx
	push	0
	push	0
	mov	eax, DWORD PTR _pvf$[ebp]
	add	eax, 4
	push	eax
	call	_dyntab_sz
	add	esp, 12					; 0000000cH
	push	eax
	push	0
	push	0
	mov	ecx, DWORD PTR _pvf$[ebp]
	add	ecx, 4
	push	ecx
	call	_dyntab_val
	add	esp, 12					; 0000000cH
	push	eax
	mov	edx, DWORD PTR _cntxt$[ebp]
	push	edx
	call	_qry_parse_fieldexpr
	add	esp, 16					; 00000010H
	test	eax, eax
	je	SHORT $L70476
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 366		; 0000016eH
	jmp	$eva_err$70374
$L70476:

; 367  : 			DYNBUF_ADD3_BUF(&tmp, "LEFT(", flt.select, NO_CONV, ",250)");

	cmp	DWORD PTR _flt$[ebp+28], 0
	je	SHORT $L71524
	mov	ecx, DWORD PTR _flt$[ebp+28]
	mov	edx, DWORD PTR [ecx+4]
	mov	DWORD PTR -5668+[ebp], edx
	jmp	SHORT $L71525
$L71524:
	mov	DWORD PTR -5668+[ebp], 0
$L71525:
	cmp	DWORD PTR _flt$[ebp+28], 0
	je	SHORT $L71526
	mov	eax, DWORD PTR _flt$[ebp+28]
	add	eax, 8
	mov	DWORD PTR -5672+[ebp], eax
	jmp	SHORT $L71527
$L71526:
	mov	DWORD PTR -5672+[ebp], 0
$L71527:
	push	5
	push	OFFSET FLAT:$SG70480
	push	0
	push	0
	mov	ecx, DWORD PTR -5668+[ebp]
	push	ecx
	mov	edx, DWORD PTR -5672+[ebp]
	push	edx
	push	5
	push	OFFSET FLAT:$SG70481
	lea	eax, DWORD PTR _tmp$[ebp]
	push	eax
	call	_dynbuf_add3
	add	esp, 36					; 00000024H
	test	eax, eax
	je	SHORT $L70479
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29872], OFFSET FLAT:$SG70483
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 367		; 0000016fH
	jmp	$eva_err$70374
$L70479:

; 368  : 			M_FREE(flt.select);

	mov	eax, DWORD PTR _flt$[ebp+28]
	push	eax
	call	_mem_free
	add	esp, 4
	mov	DWORD PTR _flt$[ebp+28], 0

; 369  : 			flt.select = tmp;

	mov	ecx, DWORD PTR _tmp$[ebp]
	mov	DWORD PTR _flt$[ebp+28], ecx

; 370  : 			tmp = NULL;

	mov	DWORD PTR _tmp$[ebp], 0

; 371  : 			flt.b_nodistinct = 1;

	mov	DWORD PTR _flt$[ebp+56], 1

; 373  : 		else

	jmp	$L70485
$L70470:

; 375  : 			DYNBUF_ADD_STR(&flt.select, "''");

	push	0
	push	0
	push	2
	push	OFFSET FLAT:$SG70488
	lea	edx, DWORD PTR _flt$[ebp+28]
	push	edx
	call	_dynbuf_add
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L70487
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29872], OFFSET FLAT:$SG70490
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 375		; 00000177H
	jmp	$eva_err$70374
$L70487:

; 376  : 			DYNBUF_ADD_STR(&flt.optselect, "NULL AS Line");

	push	0
	push	0
	push	12					; 0000000cH
	push	OFFSET FLAT:$SG70493
	lea	edx, DWORD PTR _flt$[ebp+32]
	push	edx
	call	_dynbuf_add
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L70492
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29872], OFFSET FLAT:$SG70495
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 376		; 00000178H
	jmp	$eva_err$70374
$L70492:

; 377  : 			flt.srctable = *pvf->objtable ? pvf->objtable : pvf->srctable;

	mov	edx, DWORD PTR _pvf$[ebp]
	movsx	eax, BYTE PTR [edx+240]
	test	eax, eax
	je	SHORT $L71528
	mov	ecx, DWORD PTR _pvf$[ebp]
	add	ecx, 240				; 000000f0H
	mov	DWORD PTR -5676+[ebp], ecx
	jmp	SHORT $L71529
$L71528:
	mov	edx, DWORD PTR _pvf$[ebp]
	mov	eax, DWORD PTR [edx+272]
	mov	DWORD PTR -5676+[ebp], eax
$L71529:
	mov	ecx, DWORD PTR -5676+[ebp]
	mov	DWORD PTR _flt$[ebp+20], ecx
$L70485:

; 379  : 
; 380  : 		/* Handle date filter if calendar active */
; 381  : 		if(pvf->b_calendar)

	mov	edx, DWORD PTR _pvf$[ebp]
	cmp	DWORD PTR [edx+356], 0
	je	$L70496

; 383  : 			/* Set start date if applicable */
; 384  : 			size_t tr;
; 385  : 			if(!pvf->maxlabels) pvf->maxlabels = 12;

	mov	eax, DWORD PTR _pvf$[ebp]
	cmp	DWORD PTR [eax+296], 0
	jne	SHORT $L70498
	mov	ecx, DWORD PTR _pvf$[ebp]
	mov	DWORD PTR [ecx+296], 12			; 0000000cH
$L70498:

; 386  : 			if(!pvf->dispunit || strlen(pvf->dispunit) < 5) pvf->dispunit = "_EVA_YEAR";

	mov	edx, DWORD PTR _pvf$[ebp]
	cmp	DWORD PTR [edx+332], 0
	je	SHORT $L70500
	mov	eax, DWORD PTR _pvf$[ebp]
	mov	ecx, DWORD PTR [eax+332]
	push	ecx
	call	_strlen
	add	esp, 4
	cmp	eax, 5
	jae	SHORT $L70499
$L70500:
	mov	edx, DWORD PTR _pvf$[ebp]
	mov	DWORD PTR [edx+332], OFFSET FLAT:$SG70501
$L70499:

; 387  : 			tr = pvf->dispunit && !strcmp(pvf->dispunit, "_EVA_YEAR") ? 4 : !strcmp(pvf->dispunit, "_EVA_MONTH") ? 6 : 8;

	mov	eax, DWORD PTR _pvf$[ebp]
	cmp	DWORD PTR [eax+332], 0
	je	SHORT $L71530
	push	OFFSET FLAT:$SG70502
	mov	ecx, DWORD PTR _pvf$[ebp]
	mov	edx, DWORD PTR [ecx+332]
	push	edx
	call	_strcmp
	add	esp, 8
	test	eax, eax
	jne	SHORT $L71530
	mov	DWORD PTR -5680+[ebp], 4
	jmp	SHORT $L71531
$L71530:
	push	OFFSET FLAT:$SG70503
	mov	eax, DWORD PTR _pvf$[ebp]
	mov	ecx, DWORD PTR [eax+332]
	push	ecx
	call	_strcmp
	add	esp, 8
	neg	eax
	sbb	eax, eax
	and	eax, 2
	add	eax, 6
	mov	DWORD PTR -5680+[ebp], eax
$L71531:
	mov	edx, DWORD PTR -5680+[ebp]
	mov	DWORD PTR _tr$70497[ebp], edx

; 388  : 			if(!pvf->startdate[0])

	mov	eax, DWORD PTR _pvf$[ebp]
	movsx	ecx, BYTE PTR [eax+544]
	test	ecx, ecx
	jne	$L70515

; 390  : 				if(!pvf->timeway) pvf->timeway = "";

	mov	edx, DWORD PTR _pvf$[ebp]
	cmp	DWORD PTR [edx+336], 0
	jne	SHORT $L70505
	mov	eax, DWORD PTR _pvf$[ebp]
	mov	DWORD PTR [eax+336], OFFSET FLAT:$SG70506
$L70505:

; 391  : 				if(!*pvf->timeway)

	mov	ecx, DWORD PTR _pvf$[ebp]
	mov	edx, DWORD PTR [ecx+336]
	movsx	eax, BYTE PTR [edx]
	test	eax, eax
	jne	$L70507

; 393  : 					sprintf(printbuf, "SELECT DATE_SUB(CURDATE(),INTERVAL %ld %s)+0",
; 394  : 						(!strcmp(pvf->dispunit, "_EVA_WEEK") ? 7 : 1) * (pvf->maxlabels - 1),
; 395  : 						!strcmp(pvf->dispunit, "_EVA_WEEK") ? "DAY" : pvf->dispunit + 5);

	push	OFFSET FLAT:$SG70508
	mov	ecx, DWORD PTR _pvf$[ebp]
	mov	edx, DWORD PTR [ecx+332]
	push	edx
	call	_strcmp
	add	esp, 8
	test	eax, eax
	jne	SHORT $L71532
	mov	DWORD PTR -5684+[ebp], OFFSET FLAT:$SG70509
	jmp	SHORT $L71533
$L71532:
	mov	eax, DWORD PTR _pvf$[ebp]
	mov	ecx, DWORD PTR [eax+332]
	add	ecx, 5
	mov	DWORD PTR -5684+[ebp], ecx
$L71533:
	mov	edx, DWORD PTR -5684+[ebp]
	push	edx
	push	OFFSET FLAT:$SG70510
	mov	eax, DWORD PTR _pvf$[ebp]
	mov	ecx, DWORD PTR [eax+332]
	push	ecx
	call	_strcmp
	add	esp, 8
	neg	eax
	sbb	eax, eax
	and	al, -6					; fffffffaH
	add	eax, 7
	mov	edx, DWORD PTR _pvf$[ebp]
	mov	ecx, DWORD PTR [edx+296]
	sub	ecx, 1
	imul	eax, ecx
	push	eax
	push	OFFSET FLAT:$SG70511
	lea	edx, DWORD PTR _printbuf$[ebp]
	push	edx
	call	_sprintf
	add	esp, 16					; 00000010H

; 396  : 					if(sql_exec_query(cntxt, printbuf) || sql_get_table(cntxt, &data, 2)) STACK_ERROR;

	lea	eax, DWORD PTR _printbuf$[ebp]
	push	eax
	mov	ecx, DWORD PTR _cntxt$[ebp]
	push	ecx
	call	_sql_exec_query
	add	esp, 8
	test	eax, eax
	jne	SHORT $L70513
	push	2
	lea	edx, DWORD PTR _data$[ebp]
	push	edx
	mov	eax, DWORD PTR _cntxt$[ebp]
	push	eax
	call	_sql_get_table
	add	esp, 12					; 0000000cH
	test	eax, eax
	je	SHORT $L70512
$L70513:
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 396		; 0000018cH
	jmp	$eva_err$70374
$L70512:

; 397  : 					strncpy(pvf->startdate, dyntab_val(&data, 0, 0), tr);

	mov	edx, DWORD PTR _tr$70497[ebp]
	push	edx
	push	0
	push	0
	lea	eax, DWORD PTR _data$[ebp]
	push	eax
	call	_dyntab_val
	add	esp, 12					; 0000000cH
	push	eax
	mov	ecx, DWORD PTR _pvf$[ebp]
	add	ecx, 544				; 00000220H
	push	ecx
	call	_strncpy
	add	esp, 12					; 0000000cH

; 399  : 				else if(!strcmp(pvf->timeway, "_EVA_FUTURE"))

	jmp	SHORT $L70515
$L70507:
	push	OFFSET FLAT:$SG70516
	mov	edx, DWORD PTR _pvf$[ebp]
	mov	eax, DWORD PTR [edx+336]
	push	eax
	call	_strcmp
	add	esp, 8
	test	eax, eax
	jne	SHORT $L70515

; 400  : 					strncpy(pvf->startdate, cntxt->timestamp, tr);

	mov	ecx, DWORD PTR _tr$70497[ebp]
	push	ecx
	mov	edx, DWORD PTR _cntxt$[ebp]
	add	edx, 29704				; 00007408H
	push	edx
	mov	eax, DWORD PTR _pvf$[ebp]
	add	eax, 544				; 00000220H
	push	eax
	call	_strncpy
	add	esp, 12					; 0000000cH
$L70515:

; 402  : 			pvf->startdate[tr] = 0;

	mov	ecx, DWORD PTR _pvf$[ebp]
	add	ecx, DWORD PTR _tr$70497[ebp]
	mov	BYTE PTR [ecx+544], 0

; 403  : 
; 404  : 			b_cal_filter = pvf->startdate[0] && pvf->maxlabels && pvf->dispunit && strlen(pvf->dispunit) > 5;

	mov	edx, DWORD PTR _pvf$[ebp]
	movsx	eax, BYTE PTR [edx+544]
	test	eax, eax
	je	SHORT $L71534
	mov	ecx, DWORD PTR _pvf$[ebp]
	cmp	DWORD PTR [ecx+296], 0
	je	SHORT $L71534
	mov	edx, DWORD PTR _pvf$[ebp]
	cmp	DWORD PTR [edx+332], 0
	je	SHORT $L71534
	mov	eax, DWORD PTR _pvf$[ebp]
	mov	ecx, DWORD PTR [eax+332]
	push	ecx
	call	_strlen
	add	esp, 4
	cmp	eax, 5
	jbe	SHORT $L71534
	mov	DWORD PTR -5688+[ebp], 1
	jmp	SHORT $L71535
$L71534:
	mov	DWORD PTR -5688+[ebp], 0
$L71535:
	mov	edx, DWORD PTR -5688+[ebp]
	mov	DWORD PTR _b_cal_filter$[ebp], edx

; 405  : 			if(b_cal_filter)

	cmp	DWORD PTR _b_cal_filter$[ebp], 0
	je	$L70517

; 407  : 				char date[32];
; 408  : 				/* Handle align on monday if week format */
; 409  : 				if(!strcmp(pvf->dispunit, "_EVA_WEEK"))

	push	OFFSET FLAT:$SG70520
	mov	eax, DWORD PTR _pvf$[ebp]
	mov	ecx, DWORD PTR [eax+332]
	push	ecx
	call	_strcmp
	add	esp, 8
	test	eax, eax
	jne	$L70519

; 411  : 					time_t t;
; 412  : 					struct tm dt;
; 413  : 					if(!datetxt_to_time(pvf->startdate, &t, &dt) &&	dt.tm_wday != 1 &&
; 414  : 						!delay_to_datetxt(date, pvf->startdate, dt.tm_wday ? 1 - dt.tm_wday : 6, 'D'))

	lea	edx, DWORD PTR _dt$70522[ebp]
	push	edx
	lea	eax, DWORD PTR _t$70521[ebp]
	push	eax
	mov	ecx, DWORD PTR _pvf$[ebp]
	add	ecx, 544				; 00000220H
	push	ecx
	call	_datetxt_to_time
	add	esp, 12					; 0000000cH
	test	eax, eax
	jne	SHORT $L70523
	cmp	DWORD PTR _dt$70522[ebp+24], 1
	je	SHORT $L70523
	cmp	DWORD PTR _dt$70522[ebp+24], 0
	je	SHORT $L71536
	mov	edx, 1
	sub	edx, DWORD PTR _dt$70522[ebp+24]
	mov	DWORD PTR -5692+[ebp], edx
	jmp	SHORT $L71537
$L71536:
	mov	DWORD PTR -5692+[ebp], 6
$L71537:
	push	68					; 00000044H
	mov	eax, DWORD PTR -5692+[ebp]
	push	eax
	mov	ecx, DWORD PTR _pvf$[ebp]
	add	ecx, 544				; 00000220H
	push	ecx
	lea	edx, DWORD PTR _date$70518[ebp]
	push	edx
	call	_delay_to_datetxt
	add	esp, 16					; 00000010H
	test	eax, eax
	jne	SHORT $L70523

; 415  : 						strcpy(pvf->startdate, date);

	lea	eax, DWORD PTR _date$70518[ebp]
	push	eax
	mov	ecx, DWORD PTR _pvf$[ebp]
	add	ecx, 544				; 00000220H
	push	ecx
	call	_strcpy
	add	esp, 8
$L70523:

; 416  : 					pvf->startdate[8] = 0;

	mov	edx, DWORD PTR _pvf$[ebp]
	mov	BYTE PTR [edx+552], 0
$L70519:

; 418  : 				datetxt_to_format(cntxt, date, pvf->startdate, "_EVA_DATE_SORT");

	push	OFFSET FLAT:$SG70524
	mov	eax, DWORD PTR _pvf$[ebp]
	add	eax, 544				; 00000220H
	push	eax
	lea	ecx, DWORD PTR _date$70518[ebp]
	push	ecx
	mov	edx, DWORD PTR _cntxt$[ebp]
	push	edx
	call	_datetxt_to_format
	add	esp, 16					; 00000010H

; 419  : 				sprintf(printbuf, "SELECT DATE_ADD('%s', INTERVAL %lu %s)+0", date,
; 420  : 					(!strcmp(pvf->dispunit, "_EVA_WEEK") ? 7 : 1) * pvf->maxlabels,
; 421  : 					!strcmp(pvf->dispunit, "_EVA_WEEK") ? "DAY" : pvf->dispunit + 5);

	push	OFFSET FLAT:$SG70525
	mov	eax, DWORD PTR _pvf$[ebp]
	mov	ecx, DWORD PTR [eax+332]
	push	ecx
	call	_strcmp
	add	esp, 8
	test	eax, eax
	jne	SHORT $L71538
	mov	DWORD PTR -5696+[ebp], OFFSET FLAT:$SG70526
	jmp	SHORT $L71539
$L71538:
	mov	edx, DWORD PTR _pvf$[ebp]
	mov	eax, DWORD PTR [edx+332]
	add	eax, 5
	mov	DWORD PTR -5696+[ebp], eax
$L71539:
	mov	ecx, DWORD PTR -5696+[ebp]
	push	ecx
	push	OFFSET FLAT:$SG70527
	mov	edx, DWORD PTR _pvf$[ebp]
	mov	eax, DWORD PTR [edx+332]
	push	eax
	call	_strcmp
	add	esp, 8
	neg	eax
	sbb	eax, eax
	and	al, -6					; fffffffaH
	add	eax, 7
	mov	ecx, DWORD PTR _pvf$[ebp]
	imul	eax, DWORD PTR [ecx+296]
	push	eax
	lea	edx, DWORD PTR _date$70518[ebp]
	push	edx
	push	OFFSET FLAT:$SG70528
	lea	eax, DWORD PTR _printbuf$[ebp]
	push	eax
	call	_sprintf
	add	esp, 20					; 00000014H

; 422  : 				if(sql_exec_query(cntxt, printbuf) || sql_get_table(cntxt, &data, 2)) STACK_ERROR;

	lea	ecx, DWORD PTR _printbuf$[ebp]
	push	ecx
	mov	edx, DWORD PTR _cntxt$[ebp]
	push	edx
	call	_sql_exec_query
	add	esp, 8
	test	eax, eax
	jne	SHORT $L70530
	push	2
	lea	eax, DWORD PTR _data$[ebp]
	push	eax
	mov	ecx, DWORD PTR _cntxt$[ebp]
	push	ecx
	call	_sql_get_table
	add	esp, 12					; 0000000cH
	test	eax, eax
	je	SHORT $L70529
$L70530:
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 422		; 000001a6H
	jmp	$eva_err$70374
$L70529:

; 423  : 				if(flt.where) DYNBUF_ADD_STR(&flt.where, "\nAND ");

	cmp	DWORD PTR _flt$[ebp+40], 0
	je	SHORT $L70533
	push	0
	push	0
	push	5
	push	OFFSET FLAT:$SG70534
	lea	eax, DWORD PTR _flt$[ebp+40]
	push	eax
	call	_dynbuf_add
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L70533
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29872], OFFSET FLAT:$SG70536
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 423		; 000001a7H
	jmp	$eva_err$70374
$L70533:

; 424  : 				dynbuf_print5(&flt.where, "%s>='%s' AND %s<'%.*s'",
; 425  : 									flt.select->data, pvf->startdate,
; 426  : 									flt.select->data, (int)tr, dyntab_val(&data, 0, 0));

	push	0
	push	0
	push	0
	push	0
	lea	eax, DWORD PTR _data$[ebp]
	push	eax
	call	_dyntab_val
	add	esp, 12					; 0000000cH
	push	eax
	mov	ecx, DWORD PTR _tr$70497[ebp]
	push	ecx
	mov	edx, DWORD PTR _flt$[ebp+28]
	add	edx, 8
	push	edx
	mov	eax, DWORD PTR _pvf$[ebp]
	add	eax, 544				; 00000220H
	push	eax
	mov	ecx, DWORD PTR _flt$[ebp+28]
	add	ecx, 8
	push	ecx
	push	OFFSET FLAT:$SG70539
	push	1023					; 000003ffH
	lea	edx, DWORD PTR _printbuf$[ebp]
	push	edx
	call	__snprintf
	add	esp, 32					; 00000020H
	push	eax
	lea	eax, DWORD PTR _printbuf$[ebp]
	push	eax
	lea	ecx, DWORD PTR _flt$[ebp+40]
	push	ecx
	call	_dynbuf_add
	add	esp, 20					; 00000014H

; 427  : 				pvf->b_showemptyval = 0;

	mov	edx, DWORD PTR _pvf$[ebp]
	mov	DWORD PTR [edx+512], 0
$L70517:

; 430  : 		else

	jmp	SHORT $L70540
$L70496:

; 431  : 			pvf->startdate[0] = 0;

	mov	eax, DWORD PTR _pvf$[ebp]
	mov	BYTE PTR [eax+544], 0
$L70540:

; 432  : 
; 433  : 		/* Create values table for the pivot field */
; 434  : 		if(qry_build_flt_select(cntxt, &sql, &id_obj, &flt, 0, 0)) STACK_ERROR;

	push	0
	push	0
	lea	ecx, DWORD PTR _flt$[ebp]
	push	ecx
	lea	edx, DWORD PTR _id_obj$[ebp]
	push	edx
	lea	eax, DWORD PTR _sql$[ebp]
	push	eax
	mov	ecx, DWORD PTR _cntxt$[ebp]
	push	ecx
	call	_qry_build_flt_select
	add	esp, 24					; 00000018H
	test	eax, eax
	je	SHORT $L70541
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 434		; 000001b2H
	jmp	$eva_err$70374
$L70541:

; 435  : 		if(qry_exec_filter(cntxt, &flt, sql->data)) STACK_ERROR;

	mov	eax, DWORD PTR _sql$[ebp]
	add	eax, 8
	push	eax
	lea	ecx, DWORD PTR _flt$[ebp]
	push	ecx
	mov	edx, DWORD PTR _cntxt$[ebp]
	push	edx
	call	_qry_exec_filter
	add	esp, 12					; 0000000cH
	test	eax, eax
	je	SHORT $L70542
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 435		; 000001b3H
	jmp	$eva_err$70374
$L70542:

; 437  : 
; 438  : 	/* Add IdObj index to values table */
; 439  : 	snprintf(add_sz_str(printbuf), "ALTER TABLE %s ADD INDEX(IdObj)", pvf->datatable);

	mov	ecx, DWORD PTR _pvf$[ebp]
	add	ecx, 208				; 000000d0H
	push	ecx
	push	OFFSET FLAT:$SG70543
	push	1023					; 000003ffH
	lea	edx, DWORD PTR _printbuf$[ebp]
	push	edx
	call	__snprintf
	add	esp, 16					; 00000010H

; 440  : 	if(sql_exec_query(cntxt, printbuf)) STACK_ERROR;

	lea	eax, DWORD PTR _printbuf$[ebp]
	push	eax
	mov	ecx, DWORD PTR _cntxt$[ebp]
	push	ecx
	call	_sql_exec_query
	add	esp, 8
	test	eax, eax
	je	SHORT $L70544
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 440		; 000001b8H
	jmp	$eva_err$70374
$L70544:

; 441  : 	if(cntxt->sql_trace) put_debug_sqltable(cntxt, pvf->datatable);

	mov	eax, DWORD PTR _cntxt$[ebp]
	cmp	DWORD PTR [eax+29852], 0
	je	SHORT $L70545
	mov	ecx, DWORD PTR _pvf$[ebp]
	add	ecx, 208				; 000000d0H
	push	ecx
	mov	edx, DWORD PTR _cntxt$[ebp]
	push	edx
	call	_put_debug_sqltable
	add	esp, 8
$L70545:

; 442  : 
; 443  : 	/* Adjust values type if applicable */
; 444  : 	if(pvf->sr_src.nbrows || pvf->slices.nbrows)

	mov	eax, DWORD PTR _pvf$[ebp]
	cmp	DWORD PTR [eax+388], 0
	jne	SHORT $L70547
	mov	ecx, DWORD PTR _pvf$[ebp]
	cmp	DWORD PTR [ecx+368], 0
	je	SHORT $L70549
$L70547:

; 446  : 		snprintf(add_sz_str(printbuf), "ALTER TABLE %s MODIFY Val VARCHAR(250)", pvf->datatable);

	mov	edx, DWORD PTR _pvf$[ebp]
	add	edx, 208				; 000000d0H
	push	edx
	push	OFFSET FLAT:$SG70548
	push	1023					; 000003ffH
	lea	eax, DWORD PTR _printbuf$[ebp]
	push	eax
	call	__snprintf
	add	esp, 16					; 00000010H

; 447  : 		if(sql_exec_query(cntxt, printbuf)) STACK_ERROR;

	lea	ecx, DWORD PTR _printbuf$[ebp]
	push	ecx
	mov	edx, DWORD PTR _cntxt$[ebp]
	push	edx
	call	_sql_exec_query
	add	esp, 8
	test	eax, eax
	je	SHORT $L70549
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 447		; 000001bfH
	jmp	$eva_err$70374
$L70549:

; 449  : 
; 450  : 	/* Get min/max values & check if field holds table (.Line) values */
; 451  : 	snprintf(add_sz_str(printbuf), "SELECT COUNT(DISTINCT IdObj),COUNT(IdObj),COUNT(DISTINCT Val),MIN(Val),MAX(Val)%s FROM %s",
; 452  : 		flt.groupfn ? "" : ",MAX(Line)", pvf->datatable);

	cmp	DWORD PTR _flt$[ebp+44], 0
	je	SHORT $L71540
	mov	DWORD PTR -5700+[ebp], OFFSET FLAT:$SG70550
	jmp	SHORT $L71541
$L71540:
	mov	DWORD PTR -5700+[ebp], OFFSET FLAT:$SG70551
$L71541:
	mov	ecx, DWORD PTR _pvf$[ebp]
	add	ecx, 208				; 000000d0H
	push	ecx
	mov	edx, DWORD PTR -5700+[ebp]
	push	edx
	push	OFFSET FLAT:$SG70552
	push	1023					; 000003ffH
	lea	eax, DWORD PTR _printbuf$[ebp]
	push	eax
	call	__snprintf
	add	esp, 20					; 00000014H

; 453  : 	if(sql_exec_query(cntxt, printbuf) || sql_get_table(cntxt, &id_obj, 2)) STACK_ERROR;

	lea	ecx, DWORD PTR _printbuf$[ebp]
	push	ecx
	mov	edx, DWORD PTR _cntxt$[ebp]
	push	edx
	call	_sql_exec_query
	add	esp, 8
	test	eax, eax
	jne	SHORT $L70554
	push	2
	lea	eax, DWORD PTR _id_obj$[ebp]
	push	eax
	mov	ecx, DWORD PTR _cntxt$[ebp]
	push	ecx
	call	_sql_get_table
	add	esp, 12					; 0000000cH
	test	eax, eax
	je	SHORT $L70553
$L70554:
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 453		; 000001c5H
	jmp	$eva_err$70374
$L70553:

; 454  : 	pvf->nbobj = DYNTAB_TOUL(&id_obj);

	push	10					; 0000000aH
	push	0
	push	0
	push	0
	lea	eax, DWORD PTR _id_obj$[ebp]
	push	eax
	call	_dyntab_val
	add	esp, 12					; 0000000cH
	push	eax
	call	_strtoul
	add	esp, 12					; 0000000cH
	mov	ecx, DWORD PTR _pvf$[ebp]
	mov	DWORD PTR [ecx+280], eax

; 455  : 	pvf->nbval = DYNTAB_TOULRC(&id_obj, 0, 1);

	push	10					; 0000000aH
	push	0
	push	1
	push	0
	lea	edx, DWORD PTR _id_obj$[ebp]
	push	edx
	call	_dyntab_val
	add	esp, 12					; 0000000cH
	push	eax
	call	_strtoul
	add	esp, 12					; 0000000cH
	mov	ecx, DWORD PTR _pvf$[ebp]
	mov	DWORD PTR [ecx+284], eax

; 456  : 	pvf->nbdistval = DYNTAB_TOULRC(&id_obj, 0, 2);

	push	10					; 0000000aH
	push	0
	push	2
	push	0
	lea	edx, DWORD PTR _id_obj$[ebp]
	push	edx
	call	_dyntab_val
	add	esp, 12					; 0000000cH
	push	eax
	call	_strtoul
	add	esp, 12					; 0000000cH
	mov	ecx, DWORD PTR _pvf$[ebp]
	mov	DWORD PTR [ecx+288], eax

; 457  : 	pvf->sz_vmin = dyntab_sz(&id_obj, 0, 3);

	push	3
	push	0
	lea	edx, DWORD PTR _id_obj$[ebp]
	push	edx
	call	_dyntab_sz
	add	esp, 12					; 0000000cH
	mov	ecx, DWORD PTR _pvf$[ebp]
	mov	DWORD PTR [ecx+564], eax

; 458  : 	M_STRDUP(pvf->vmin, dyntab_val(&id_obj, 0, 3), pvf->sz_vmin);

	mov	edx, DWORD PTR _pvf$[ebp]
	mov	eax, DWORD PTR [edx+564]
	mov	DWORD PTR _size$70558[ebp], eax
	push	3
	push	0
	lea	ecx, DWORD PTR _id_obj$[ebp]
	push	ecx
	call	_dyntab_val
	add	esp, 12					; 0000000cH
	mov	DWORD PTR _src$70559[ebp], eax
	mov	edx, DWORD PTR _size$70558[ebp]
	add	edx, 1
	mov	DWORD PTR _size1$70560[ebp], edx
	mov	eax, DWORD PTR _size1$70560[ebp]
	push	eax
	call	_mem_alloc
	add	esp, 4
	mov	ecx, DWORD PTR _pvf$[ebp]
	mov	DWORD PTR [ecx+560], eax
	cmp	DWORD PTR _size1$70560[ebp], 0
	je	SHORT $L70561
	mov	edx, DWORD PTR _pvf$[ebp]
	cmp	DWORD PTR [edx+560], 0
	jne	SHORT $L70561
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29872], OFFSET FLAT:$SG70563
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 458		; 000001caH
	jmp	$eva_err$70374
$L70561:
	cmp	DWORD PTR _src$70559[ebp], 0
	je	SHORT $L70565
	cmp	DWORD PTR _size$70558[ebp], 0
	je	SHORT $L70565
	mov	edx, DWORD PTR _size$70558[ebp]
	push	edx
	mov	eax, DWORD PTR _src$70559[ebp]
	push	eax
	mov	ecx, DWORD PTR _pvf$[ebp]
	mov	edx, DWORD PTR [ecx+560]
	push	edx
	call	_memcpy
	add	esp, 12					; 0000000cH
$L70565:

; 459  : 	pvf->sz_vmax = dyntab_sz(&id_obj, 0, 4);

	push	4
	push	0
	lea	eax, DWORD PTR _id_obj$[ebp]
	push	eax
	call	_dyntab_sz
	add	esp, 12					; 0000000cH
	mov	ecx, DWORD PTR _pvf$[ebp]
	mov	DWORD PTR [ecx+572], eax

; 460  : 	M_STRDUP(pvf->vmax, dyntab_val(&id_obj, 0, 4), pvf->sz_vmax);

	mov	edx, DWORD PTR _pvf$[ebp]
	mov	eax, DWORD PTR [edx+572]
	mov	DWORD PTR _size$70566[ebp], eax
	push	4
	push	0
	lea	ecx, DWORD PTR _id_obj$[ebp]
	push	ecx
	call	_dyntab_val
	add	esp, 12					; 0000000cH
	mov	DWORD PTR _src$70567[ebp], eax
	mov	edx, DWORD PTR _size$70566[ebp]
	add	edx, 1
	mov	DWORD PTR _size1$70568[ebp], edx
	mov	eax, DWORD PTR _size1$70568[ebp]
	push	eax
	call	_mem_alloc
	add	esp, 4
	mov	ecx, DWORD PTR _pvf$[ebp]
	mov	DWORD PTR [ecx+568], eax
	cmp	DWORD PTR _size1$70568[ebp], 0
	je	SHORT $L70569
	mov	edx, DWORD PTR _pvf$[ebp]
	cmp	DWORD PTR [edx+568], 0
	jne	SHORT $L70569
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29872], OFFSET FLAT:$SG70571
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 460		; 000001ccH
	jmp	SHORT $eva_err$70374
$L70569:
	cmp	DWORD PTR _src$70567[ebp], 0
	je	SHORT $L70573
	cmp	DWORD PTR _size$70566[ebp], 0
	je	SHORT $L70573
	mov	edx, DWORD PTR _size$70566[ebp]
	push	edx
	mov	eax, DWORD PTR _src$70567[ebp]
	push	eax
	mov	ecx, DWORD PTR _pvf$[ebp]
	mov	edx, DWORD PTR [ecx+568]
	push	edx
	call	_memcpy
	add	esp, 12					; 0000000cH
$L70573:

; 461  : 	pvf->b_lines = DYNTAB_TOULRC(&id_obj, 0, 5) > 1;

	push	10					; 0000000aH
	push	0
	push	5
	push	0
	lea	eax, DWORD PTR _id_obj$[ebp]
	push	eax
	call	_dyntab_val
	add	esp, 12					; 0000000cH
	push	eax
	call	_strtoul
	add	esp, 12					; 0000000cH
	mov	ecx, 1
	cmp	ecx, eax
	sbb	edx, edx
	neg	edx
	mov	eax, DWORD PTR _pvf$[ebp]
	mov	DWORD PTR [eax+476], edx
$eva_noerr$70575:

; 462  : 
; 463  : 	RETURN_OK_CLEANUP;

	push	0
	push	OFFSET FLAT:$SG70576
	push	OFFSET FLAT:$SG70577
	mov	ecx, DWORD PTR _cntxt$[ebp]
	push	ecx
	call	_err_clear
	add	esp, 16					; 00000010H
$eva_err$70374:
	mov	edx, DWORD PTR _cntxt$[ebp]
	cmp	DWORD PTR [edx+29872], 0
	je	SHORT $L70578
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	ecx, DWORD PTR [eax+29900]
	push	ecx
	push	OFFSET FLAT:$SG70579
	push	OFFSET FLAT:$SG70580
	mov	edx, DWORD PTR _cntxt$[ebp]
	push	edx
	call	_err_add_context
	add	esp, 16					; 00000010H
$L70578:
	lea	eax, DWORD PTR _id_obj$[ebp]
	push	eax
	call	_dyntab_free
	add	esp, 4
	lea	ecx, DWORD PTR _data$[ebp]
	push	ecx
	call	_dyntab_free
	add	esp, 4
	mov	edx, DWORD PTR _sql$[ebp]
	push	edx
	call	_mem_free
	add	esp, 4
	mov	DWORD PTR _sql$[ebp], 0
	mov	eax, DWORD PTR _tmp$[ebp]
	push	eax
	call	_mem_free
	add	esp, 4
	mov	DWORD PTR _tmp$[ebp], 0
	mov	ecx, DWORD PTR _expr$[ebp]
	push	ecx
	call	_mem_free
	add	esp, 4
	mov	DWORD PTR _expr$[ebp], 0
	lea	edx, DWORD PTR _flt$[ebp]
	push	edx
	call	_qry_build_free
	add	esp, 4
	mov	eax, DWORD PTR _cntxt$[ebp]
	xor	ecx, ecx
	cmp	DWORD PTR [eax+29872], 0
	setne	cl
	mov	eax, ecx

; 464  : }

	pop	edi
	mov	esp, ebp
	pop	ebp
	ret	0
_pivottable_get_field_data ENDP
_TEXT	ENDS
PUBLIC	_pivottable_add_empty_values
_DATA	SEGMENT
	ORG $+2
$SG70596 DB	'-- pivottable_add_field - Add empty value for objects wi'
	DB	'th no value', 0aH, 'SELECT DISTINCT IdObj FROM %s', 00H
	ORG $+2
$SG70602 DB	' (IdObj,Val)', 0aH, 00H
	ORG $+2
$SG70603 DB	'INSERT INTO ', 00H
	ORG $+3
$SG70605 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70608 DB	0aH, 'WHERE IdObj NOT IN (', 00H
	ORG $+2
$SG70609 DB	'SELECT DISTINCT IdObj,'''' AS Val', 0aH, 'FROM ', 00H
	ORG $+2
$SG70611 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70615 DB	')', 00H
	ORG $+2
$SG70617 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70620 DB	'D:\Travail\ABI\EVA\V4.0\CGI\Brunix-2016\pivottable.c', 00H
	ORG $+3
$SG70621 DB	'pivottable_add_empty_values', 00H
$SG70623 DB	'D:\Travail\ABI\EVA\V4.0\CGI\Brunix-2016\pivottable.c', 00H
	ORG $+3
$SG70624 DB	'pivottable_add_empty_values', 00H
_DATA	ENDS
_TEXT	SEGMENT
_cntxt$ = 8
_pv$ = 12
_pvf$ = 16
_id_obj$ = -1048
_sql$ = -4
_printbuf$ = -1028
_pivottable_add_empty_values PROC NEAR

; 479  : ){

	push	ebp
	mov	ebp, esp
	sub	esp, 1048				; 00000418H

; 480  : 	DynTable id_obj = {0};

	mov	DWORD PTR _id_obj$[ebp], 0
	xor	eax, eax
	mov	DWORD PTR _id_obj$[ebp+4], eax
	mov	DWORD PTR _id_obj$[ebp+8], eax
	mov	DWORD PTR _id_obj$[ebp+12], eax
	mov	DWORD PTR _id_obj$[ebp+16], eax

; 481  : 	DynBuffer *sql = NULL;

	mov	DWORD PTR _sql$[ebp], 0

; 482  : 	char printbuf[1024];
; 483  : 
; 484  : 	snprintf(add_sz_str(printbuf),
; 485  : 		"-- pivottable_add_field - Add empty value for objects with no value\n"
; 486  : 		"SELECT DISTINCT IdObj FROM %s", pvf->datatable);

	mov	ecx, DWORD PTR _pvf$[ebp]
	add	ecx, 208				; 000000d0H
	push	ecx
	push	OFFSET FLAT:$SG70596
	push	1023					; 000003ffH
	lea	edx, DWORD PTR _printbuf$[ebp]
	push	edx
	call	__snprintf
	add	esp, 16					; 00000010H

; 487  : 	if(sql_exec_query(cntxt, printbuf) || sql_get_table(cntxt, &id_obj, 2)) STACK_ERROR;

	lea	eax, DWORD PTR _printbuf$[ebp]
	push	eax
	mov	ecx, DWORD PTR _cntxt$[ebp]
	push	ecx
	call	_sql_exec_query
	add	esp, 8
	test	eax, eax
	jne	SHORT $L70598
	push	2
	lea	edx, DWORD PTR _id_obj$[ebp]
	push	edx
	mov	eax, DWORD PTR _cntxt$[ebp]
	push	eax
	call	_sql_get_table
	add	esp, 12					; 0000000cH
	test	eax, eax
	je	SHORT $L70597
$L70598:
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 487		; 000001e7H
	jmp	$eva_err$70599
$L70597:

; 488  : 	M_FREE(sql);

	mov	edx, DWORD PTR _sql$[ebp]
	push	edx
	call	_mem_free
	add	esp, 4
	mov	DWORD PTR _sql$[ebp], 0

; 490  : 		"INSERT INTO ", pvf->datatable, 0, NO_CONV, " (IdObj,Val)\n");

	push	13					; 0000000dH
	push	OFFSET FLAT:$SG70602
	push	0
	push	0
	push	0
	mov	eax, DWORD PTR _pvf$[ebp]
	add	eax, 208				; 000000d0H
	push	eax
	push	12					; 0000000cH
	push	OFFSET FLAT:$SG70603
	lea	ecx, DWORD PTR _sql$[ebp]
	push	ecx
	call	_dynbuf_add3
	add	esp, 36					; 00000024H
	test	eax, eax
	je	SHORT $L70601
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29872], OFFSET FLAT:$SG70605
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 490		; 000001eaH
	jmp	$eva_err$70599
$L70601:

; 492  : 		"SELECT DISTINCT IdObj,'' AS Val\n"
; 493  : 		"FROM ", pvf->srctable, 0, NO_CONV, "\n"
; 494  : 		"WHERE IdObj NOT IN (");

	push	21					; 00000015H
	push	OFFSET FLAT:$SG70608
	push	0
	push	0
	push	0
	mov	ecx, DWORD PTR _pvf$[ebp]
	mov	edx, DWORD PTR [ecx+272]
	push	edx
	push	37					; 00000025H
	push	OFFSET FLAT:$SG70609
	lea	eax, DWORD PTR _sql$[ebp]
	push	eax
	call	_dynbuf_add3
	add	esp, 36					; 00000024H
	test	eax, eax
	je	SHORT $L70607
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29872], OFFSET FLAT:$SG70611
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 494		; 000001eeH
	jmp	$eva_err$70599
$L70607:

; 495  : 	if(qry_values_list(cntxt, &id_obj, 0, &sql)) STACK_ERROR;

	lea	eax, DWORD PTR _sql$[ebp]
	push	eax
	push	0
	lea	ecx, DWORD PTR _id_obj$[ebp]
	push	ecx
	mov	edx, DWORD PTR _cntxt$[ebp]
	push	edx
	call	_qry_values_list
	add	esp, 16					; 00000010H
	test	eax, eax
	je	SHORT $L70612
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 495		; 000001efH
	jmp	$eva_err$70599
$L70612:

; 496  : 	DYNBUF_ADD_STR(&sql, ")");

	push	0
	push	0
	push	1
	push	OFFSET FLAT:$SG70615
	lea	ecx, DWORD PTR _sql$[ebp]
	push	ecx
	call	_dynbuf_add
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L70614
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29872], OFFSET FLAT:$SG70617
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 496		; 000001f0H
	jmp	SHORT $eva_err$70599
$L70614:

; 497  : 	if(sql_exec_query(cntxt, sql->data)) STACK_ERROR;

	mov	ecx, DWORD PTR _sql$[ebp]
	add	ecx, 8
	push	ecx
	mov	edx, DWORD PTR _cntxt$[ebp]
	push	edx
	call	_sql_exec_query
	add	esp, 8
	test	eax, eax
	je	SHORT $L70618
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 497		; 000001f1H
	jmp	SHORT $eva_err$70599
$L70618:

; 498  : 	pvf->nbobj = pv->nbobj;

	mov	ecx, DWORD PTR _pvf$[ebp]
	mov	edx, DWORD PTR _pv$[ebp]
	mov	eax, DWORD PTR [edx+196]
	mov	DWORD PTR [ecx+280], eax
$eva_noerr$70619:

; 499  : 
; 500  : 	RETURN_OK_CLEANUP;

	push	0
	push	OFFSET FLAT:$SG70620
	push	OFFSET FLAT:$SG70621
	mov	ecx, DWORD PTR _cntxt$[ebp]
	push	ecx
	call	_err_clear
	add	esp, 16					; 00000010H
$eva_err$70599:
	mov	edx, DWORD PTR _cntxt$[ebp]
	cmp	DWORD PTR [edx+29872], 0
	je	SHORT $L70622
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	ecx, DWORD PTR [eax+29900]
	push	ecx
	push	OFFSET FLAT:$SG70623
	push	OFFSET FLAT:$SG70624
	mov	edx, DWORD PTR _cntxt$[ebp]
	push	edx
	call	_err_add_context
	add	esp, 16					; 00000010H
$L70622:
	lea	eax, DWORD PTR _id_obj$[ebp]
	push	eax
	call	_dyntab_free
	add	esp, 4
	mov	ecx, DWORD PTR _sql$[ebp]
	push	ecx
	call	_mem_free
	add	esp, 4
	mov	DWORD PTR _sql$[ebp], 0
	mov	edx, DWORD PTR _cntxt$[ebp]
	xor	eax, eax
	cmp	DWORD PTR [edx+29872], 0
	setne	al

; 501  : }

	mov	esp, ebp
	pop	ebp
	ret	0
_pivottable_add_empty_values ENDP
_TEXT	ENDS
PUBLIC	_pivottable_handle_field_format
EXTRN	_datetxt_invalid:NEAR
EXTRN	_sscanf:NEAR
EXTRN	_dynbuf_add3_int:NEAR
_BSS	SEGMENT
	ALIGN	4

$SG70640 DB	01H DUP (?)
	ALIGN	4

$SG70647 DB	01H DUP (?)
_BSS	ENDS
_DATA	SEGMENT
$SG70643 DB	'1900', 00H
	ORG $+3
$SG70644 DB	'2100', 00H
	ORG $+3
$SG70645 DB	'_EVA_DATE', 00H
	ORG $+2
$SG70650 DB	'_EVA_DATE', 00H
	ORG $+2
$SG70651 DB	'_EVA_AGE', 00H
	ORG $+3
$SG70652 DB	'_EVA_AGE', 00H
	ORG $+3
$SG70653 DB	'_EVA_MINUTE', 00H
$SG70654 DB	'_EVA_HOUR', 00H
	ORG $+2
$SG70655 DB	'_EVA_DAY', 00H
	ORG $+3
$SG70656 DB	'_EVA_WEEK', 00H
	ORG $+2
$SG70657 DB	'_EVA_MONTH', 00H
	ORG $+1
$SG70658 DB	'_EVA_YEAR', 00H
	ORG $+2
$SG70660 DB	'_EVA_DATE', 00H
	ORG $+2
$SG70664 DB	'_EVA_TRUNC', 00H
	ORG $+1
$SG70667 DB	'%lu,%lu', 00H
$SG70671 DB	'-- pivottable_add_field - Truncate values', 0aH, 'UPDATE'
	DB	' %s SET Val=', 00H
	ORG $+3
$SG70674 DB	')', 00H
	ORG $+2
$SG70675 DB	'RIGHT(Val,', 00H
	ORG $+1
$SG70677 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70682 DB	'MID(Val,%lu,%lu)', 00H
	ORG $+3
$SG70685 DB	')', 00H
	ORG $+2
$SG70686 DB	'LEFT(Val,', 00H
	ORG $+2
$SG70688 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70691 DB	'_EVA_WEEK', 00H
	ORG $+2
$SG70692 DB	'_EVA_DATE', 00H
	ORG $+2
$SG70694 DB	'-- pivottable_add_field - Transform to week', 0aH, 'UPDA'
	DB	'TE %s SET Val=DATE_FORMAT(Val,''%%x S%%v'')', 00H
	ORG $+2
$SG70698 DB	'_EVA_AGE', 00H
	ORG $+3
$SG70699 DB	'%4u%4u', 00H
	ORG $+1
$SG70701 DB	'-- pivottable_add_field - Transform to age', 0aH, 'UPDAT'
	DB	'E %s SET Val=%u-LEFT(Val,4)-IF(MID(Val,5,4)<=''%04u'',0,1) WH'
	DB	'ERE Val<>''''', 00H
	ORG $+1
$SG70703 DB	'_EVA_NUMBER', 00H
$SG70705 DB	'_EVA_NUMBER', 00H
$SG70707 DB	'D:\Travail\ABI\EVA\V4.0\CGI\Brunix-2016\pivottable.c', 00H
	ORG $+3
$SG70708 DB	'pivottable_handle_field_format', 00H
	ORG $+1
$SG70710 DB	'D:\Travail\ABI\EVA\V4.0\CGI\Brunix-2016\pivottable.c', 00H
	ORG $+3
$SG70711 DB	'pivottable_handle_field_format', 00H
_DATA	ENDS
_TEXT	SEGMENT
_cntxt$ = 8
_pvf$ = 12
_sql$ = -8
_printbuf$ = -1032
_year$ = -1036
_monthday$ = -4
_pivottable_handle_field_format PROC NEAR

; 514  : ){

	push	ebp
	mov	ebp, esp
	sub	esp, 1060				; 00000424H

; 515  : 	DynBuffer *sql = NULL;

	mov	DWORD PTR _sql$[ebp], 0

; 516  : 	char printbuf[1024];
; 517  : 	unsigned year, monthday;
; 518  : 	if(!pvf->dispfmt) pvf->dispfmt = "";

	mov	eax, DWORD PTR _pvf$[ebp]
	cmp	DWORD PTR [eax+304], 0
	jne	SHORT $L70639
	mov	ecx, DWORD PTR _pvf$[ebp]
	mov	DWORD PTR [ecx+304], OFFSET FLAT:$SG70640
$L70639:

; 519  : 	if(!*pvf->dispfmt)

	mov	edx, DWORD PTR _pvf$[ebp]
	mov	eax, DWORD PTR [edx+304]
	movsx	ecx, BYTE PTR [eax]
	test	ecx, ecx
	jne	$L70642

; 521  : 		/* Auto format - use min & max values to select proper format */
; 522  : 
; 523  : 		/* Check for date */
; 524  : 		if(pvf->sz_vmin > 5 && pvf->sz_vmax> 5 &&
; 525  : 			strcmp(pvf->vmin, "1900") > 0 && strcmp(pvf->vmax, "2100") < 0 &&
; 526  : 			!datetxt_invalid(pvf->vmin) && !datetxt_invalid(pvf->vmax))

	mov	edx, DWORD PTR _pvf$[ebp]
	cmp	DWORD PTR [edx+564], 5
	jbe	$L70642
	mov	eax, DWORD PTR _pvf$[ebp]
	cmp	DWORD PTR [eax+572], 5
	jbe	SHORT $L70642
	push	OFFSET FLAT:$SG70643
	mov	ecx, DWORD PTR _pvf$[ebp]
	mov	edx, DWORD PTR [ecx+560]
	push	edx
	call	_strcmp
	add	esp, 8
	test	eax, eax
	jle	SHORT $L70642
	push	OFFSET FLAT:$SG70644
	mov	eax, DWORD PTR _pvf$[ebp]
	mov	ecx, DWORD PTR [eax+568]
	push	ecx
	call	_strcmp
	add	esp, 8
	test	eax, eax
	jge	SHORT $L70642
	mov	edx, DWORD PTR _pvf$[ebp]
	mov	eax, DWORD PTR [edx+560]
	push	eax
	call	_datetxt_invalid
	add	esp, 4
	test	eax, eax
	jne	SHORT $L70642
	mov	ecx, DWORD PTR _pvf$[ebp]
	mov	edx, DWORD PTR [ecx+568]
	push	edx
	call	_datetxt_invalid
	add	esp, 4
	test	eax, eax
	jne	SHORT $L70642

; 528  : 			pvf->dispfmt = "_EVA_DATE";

	mov	eax, DWORD PTR _pvf$[ebp]
	mov	DWORD PTR [eax+304], OFFSET FLAT:$SG70645

; 529  : 			auto_date_unit(pvf);

	mov	ecx, DWORD PTR _pvf$[ebp]
	push	ecx
	call	_auto_date_unit
	add	esp, 4
$L70642:

; 533  : 	if(!pvf->dispunit) pvf->dispunit = "";

	mov	edx, DWORD PTR _pvf$[ebp]
	cmp	DWORD PTR [edx+332], 0
	jne	SHORT $L70646
	mov	eax, DWORD PTR _pvf$[ebp]
	mov	DWORD PTR [eax+332], OFFSET FLAT:$SG70647
$L70646:

; 534  : 	if(!strcmp(pvf->dispfmt, "_EVA_DATE") || !strcmp(pvf->dispfmt, "_EVA_AGE"))

	push	OFFSET FLAT:$SG70650
	mov	ecx, DWORD PTR _pvf$[ebp]
	mov	edx, DWORD PTR [ecx+304]
	push	edx
	call	_strcmp
	add	esp, 8
	test	eax, eax
	je	SHORT $L70649
	push	OFFSET FLAT:$SG70651
	mov	eax, DWORD PTR _pvf$[ebp]
	mov	ecx, DWORD PTR [eax+304]
	push	ecx
	call	_strcmp
	add	esp, 8
	test	eax, eax
	jne	$L70648
$L70649:

; 536  : 		/* Date or age format : read unit */
; 537  : 		auto_date_unit(pvf);

	mov	edx, DWORD PTR _pvf$[ebp]
	push	edx
	call	_auto_date_unit
	add	esp, 4

; 538  : 		pvf->ltrunc =	!strcmp(pvf->dispfmt, "_EVA_AGE") ? 14 :
; 539  : 						!strcmp(pvf->dispunit, "_EVA_MINUTE") ? 12 :
; 540  : 						!strcmp(pvf->dispunit, "_EVA_HOUR") ? 10 :
; 541  : 						!strcmp(pvf->dispunit, "_EVA_DAY") ? 8 :
; 542  : 						!strcmp(pvf->dispunit, "_EVA_WEEK") ? 8 :
; 543  : 						!strcmp(pvf->dispunit, "_EVA_MONTH") ? 6 :
; 544  : 						!strcmp(pvf->dispunit, "_EVA_YEAR") ? 4 : 14;

	push	OFFSET FLAT:$SG70652
	mov	eax, DWORD PTR _pvf$[ebp]
	mov	ecx, DWORD PTR [eax+304]
	push	ecx
	call	_strcmp
	add	esp, 8
	test	eax, eax
	jne	SHORT $L71554
	mov	DWORD PTR -1040+[ebp], 14		; 0000000eH
	jmp	$L71555
$L71554:
	push	OFFSET FLAT:$SG70653
	mov	edx, DWORD PTR _pvf$[ebp]
	mov	eax, DWORD PTR [edx+332]
	push	eax
	call	_strcmp
	add	esp, 8
	test	eax, eax
	jne	SHORT $L71552
	mov	DWORD PTR -1044+[ebp], 12		; 0000000cH
	jmp	$L71553
$L71552:
	push	OFFSET FLAT:$SG70654
	mov	ecx, DWORD PTR _pvf$[ebp]
	mov	edx, DWORD PTR [ecx+332]
	push	edx
	call	_strcmp
	add	esp, 8
	test	eax, eax
	jne	SHORT $L71550
	mov	DWORD PTR -1048+[ebp], 10		; 0000000aH
	jmp	$L71551
$L71550:
	push	OFFSET FLAT:$SG70655
	mov	eax, DWORD PTR _pvf$[ebp]
	mov	ecx, DWORD PTR [eax+332]
	push	ecx
	call	_strcmp
	add	esp, 8
	test	eax, eax
	jne	SHORT $L71548
	mov	DWORD PTR -1052+[ebp], 8
	jmp	$L71549
$L71548:
	push	OFFSET FLAT:$SG70656
	mov	edx, DWORD PTR _pvf$[ebp]
	mov	eax, DWORD PTR [edx+332]
	push	eax
	call	_strcmp
	add	esp, 8
	test	eax, eax
	jne	SHORT $L71546
	mov	DWORD PTR -1056+[ebp], 8
	jmp	SHORT $L71547
$L71546:
	push	OFFSET FLAT:$SG70657
	mov	ecx, DWORD PTR _pvf$[ebp]
	mov	edx, DWORD PTR [ecx+332]
	push	edx
	call	_strcmp
	add	esp, 8
	test	eax, eax
	jne	SHORT $L71544
	mov	DWORD PTR -1060+[ebp], 6
	jmp	SHORT $L71545
$L71544:
	push	OFFSET FLAT:$SG70658
	mov	eax, DWORD PTR _pvf$[ebp]
	mov	ecx, DWORD PTR [eax+332]
	push	ecx
	call	_strcmp
	add	esp, 8
	neg	eax
	sbb	eax, eax
	and	eax, 10					; 0000000aH
	add	eax, 4
	mov	DWORD PTR -1060+[ebp], eax
$L71545:
	mov	edx, DWORD PTR -1060+[ebp]
	mov	DWORD PTR -1056+[ebp], edx
$L71547:
	mov	eax, DWORD PTR -1056+[ebp]
	mov	DWORD PTR -1052+[ebp], eax
$L71549:
	mov	ecx, DWORD PTR -1052+[ebp]
	mov	DWORD PTR -1048+[ebp], ecx
$L71551:
	mov	edx, DWORD PTR -1048+[ebp]
	mov	DWORD PTR -1044+[ebp], edx
$L71553:
	mov	eax, DWORD PTR -1044+[ebp]
	mov	DWORD PTR -1040+[ebp], eax
$L71555:
	mov	ecx, DWORD PTR _pvf$[ebp]
	mov	edx, DWORD PTR -1040+[ebp]
	mov	DWORD PTR [ecx+468], edx

; 545  : 		if(!strcmp(pvf->dispfmt, "_EVA_DATE"))

	push	OFFSET FLAT:$SG70660
	mov	eax, DWORD PTR _pvf$[ebp]
	mov	ecx, DWORD PTR [eax+304]
	push	ecx
	call	_strcmp
	add	esp, 8
	test	eax, eax
	jne	SHORT $L70661

; 547  : 			if(pvf->b_overrun && pvf->ltrunc > 4)

	mov	edx, DWORD PTR _pvf$[ebp]
	cmp	DWORD PTR [edx+480], 0
	je	SHORT $L70661
	mov	eax, DWORD PTR _pvf$[ebp]
	cmp	DWORD PTR [eax+468], 4
	jbe	SHORT $L70661

; 549  : 				pvf->ltrunc--;

	mov	ecx, DWORD PTR _pvf$[ebp]
	mov	edx, DWORD PTR [ecx+468]
	sub	edx, 1
	mov	eax, DWORD PTR _pvf$[ebp]
	mov	DWORD PTR [eax+468], edx

; 550  : 				pvf->rtrunc = 2;

	mov	ecx, DWORD PTR _pvf$[ebp]
	mov	DWORD PTR [ecx+472], 2
$L70661:

; 554  : 	else if(!strcmp(pvf->dispfmt, "_EVA_TRUNC"))

	jmp	SHORT $L70663
$L70648:
	push	OFFSET FLAT:$SG70664
	mov	edx, DWORD PTR _pvf$[ebp]
	mov	eax, DWORD PTR [edx+304]
	push	eax
	call	_strcmp
	add	esp, 8
	test	eax, eax
	jne	SHORT $L70663

; 556  : 		sscanf(pvf->trunc, "%lu,%lu", (unsigned long int*)&pvf->ltrunc, (unsigned long int*)&pvf->rtrunc);

	mov	ecx, DWORD PTR _pvf$[ebp]
	add	ecx, 472				; 000001d8H
	push	ecx
	mov	edx, DWORD PTR _pvf$[ebp]
	add	edx, 468				; 000001d4H
	push	edx
	push	OFFSET FLAT:$SG70667
	mov	eax, DWORD PTR _pvf$[ebp]
	mov	ecx, DWORD PTR [eax+360]
	push	ecx
	call	_sscanf
	add	esp, 16					; 00000010H
$L70663:

; 558  : 
; 559  : 	/* Truncate values as applicable */
; 560  : 	if(pvf->ltrunc || pvf->rtrunc)

	mov	edx, DWORD PTR _pvf$[ebp]
	cmp	DWORD PTR [edx+468], 0
	jne	SHORT $L70669
	mov	eax, DWORD PTR _pvf$[ebp]
	cmp	DWORD PTR [eax+472], 0
	je	$L70689
$L70669:

; 562  : 		dynbuf_print(&sql,
; 563  : 			"-- pivottable_add_field - Truncate values\n"
; 564  : 			"UPDATE %s SET Val=", pvf->datatable);

	push	0
	push	0
	mov	ecx, DWORD PTR _pvf$[ebp]
	add	ecx, 208				; 000000d0H
	push	ecx
	push	OFFSET FLAT:$SG70671
	push	1023					; 000003ffH
	lea	edx, DWORD PTR _printbuf$[ebp]
	push	edx
	call	__snprintf
	add	esp, 16					; 00000010H
	push	eax
	lea	eax, DWORD PTR _printbuf$[ebp]
	push	eax
	lea	ecx, DWORD PTR _sql$[ebp]
	push	ecx
	call	_dynbuf_add
	add	esp, 20					; 00000014H

; 565  : 		if(!pvf->ltrunc && pvf->rtrunc)

	mov	edx, DWORD PTR _pvf$[ebp]
	cmp	DWORD PTR [edx+468], 0
	jne	SHORT $L70672
	mov	eax, DWORD PTR _pvf$[ebp]
	cmp	DWORD PTR [eax+472], 0
	je	SHORT $L70672

; 567  : 			DYNBUF_ADD3_INT(&sql, "RIGHT(Val,", pvf->rtrunc, ")");

	push	1
	push	OFFSET FLAT:$SG70674
	mov	ecx, DWORD PTR _pvf$[ebp]
	mov	edx, DWORD PTR [ecx+472]
	push	edx
	push	10					; 0000000aH
	push	OFFSET FLAT:$SG70675
	lea	eax, DWORD PTR _sql$[ebp]
	push	eax
	call	_dynbuf_add3_int
	add	esp, 24					; 00000018H
	test	eax, eax
	je	SHORT $L70673
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29872], OFFSET FLAT:$SG70677
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 567		; 00000237H
	jmp	$eva_err$70678
$L70673:

; 569  : 		else if(pvf->ltrunc && pvf->rtrunc)

	jmp	$L70684
$L70672:
	mov	eax, DWORD PTR _pvf$[ebp]
	cmp	DWORD PTR [eax+468], 0
	je	SHORT $L70680
	mov	ecx, DWORD PTR _pvf$[ebp]
	cmp	DWORD PTR [ecx+472], 0
	je	SHORT $L70680

; 571  : 			dynbuf_print2(&sql, "MID(Val,%lu,%lu)", pvf->ltrunc, pvf->rtrunc);

	push	0
	push	0
	mov	edx, DWORD PTR _pvf$[ebp]
	mov	eax, DWORD PTR [edx+472]
	push	eax
	mov	ecx, DWORD PTR _pvf$[ebp]
	mov	edx, DWORD PTR [ecx+468]
	push	edx
	push	OFFSET FLAT:$SG70682
	push	1023					; 000003ffH
	lea	eax, DWORD PTR _printbuf$[ebp]
	push	eax
	call	__snprintf
	add	esp, 20					; 00000014H
	push	eax
	lea	ecx, DWORD PTR _printbuf$[ebp]
	push	ecx
	lea	edx, DWORD PTR _sql$[ebp]
	push	edx
	call	_dynbuf_add
	add	esp, 20					; 00000014H

; 573  : 		else

	jmp	SHORT $L70684
$L70680:

; 575  : 			DYNBUF_ADD3_INT(&sql, "LEFT(Val,", pvf->ltrunc, ")");

	push	1
	push	OFFSET FLAT:$SG70685
	mov	eax, DWORD PTR _pvf$[ebp]
	mov	ecx, DWORD PTR [eax+468]
	push	ecx
	push	9
	push	OFFSET FLAT:$SG70686
	lea	edx, DWORD PTR _sql$[ebp]
	push	edx
	call	_dynbuf_add3_int
	add	esp, 24					; 00000018H
	test	eax, eax
	je	SHORT $L70684
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29872], OFFSET FLAT:$SG70688
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 575		; 0000023fH
	jmp	$eva_err$70678
$L70684:

; 577  : 		if(sql_exec_query(cntxt, sql->data)) STACK_ERROR;

	mov	edx, DWORD PTR _sql$[ebp]
	add	edx, 8
	push	edx
	mov	eax, DWORD PTR _cntxt$[ebp]
	push	eax
	call	_sql_exec_query
	add	esp, 8
	test	eax, eax
	je	SHORT $L70689
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 577		; 00000241H
	jmp	$eva_err$70678
$L70689:

; 579  : 
; 580  : 	/* Transform to week if applicable */
; 581  : 	if(!strcmp(pvf->dispunit, "_EVA_WEEK") && !strcmp(pvf->dispfmt, "_EVA_DATE"))

	push	OFFSET FLAT:$SG70691
	mov	edx, DWORD PTR _pvf$[ebp]
	mov	eax, DWORD PTR [edx+332]
	push	eax
	call	_strcmp
	add	esp, 8
	test	eax, eax
	jne	$L70690
	push	OFFSET FLAT:$SG70692
	mov	ecx, DWORD PTR _pvf$[ebp]
	mov	edx, DWORD PTR [ecx+304]
	push	edx
	call	_strcmp
	add	esp, 8
	test	eax, eax
	jne	SHORT $L70690

; 583  : 		M_FREE(sql);

	mov	eax, DWORD PTR _sql$[ebp]
	push	eax
	call	_mem_free
	add	esp, 4
	mov	DWORD PTR _sql$[ebp], 0

; 584  : 		dynbuf_print(&sql,
; 585  : 			"-- pivottable_add_field - Transform to week\n"
; 586  : 			"UPDATE %s SET Val=DATE_FORMAT(Val,'%%x S%%v')", pvf->datatable);

	push	0
	push	0
	mov	ecx, DWORD PTR _pvf$[ebp]
	add	ecx, 208				; 000000d0H
	push	ecx
	push	OFFSET FLAT:$SG70694
	push	1023					; 000003ffH
	lea	edx, DWORD PTR _printbuf$[ebp]
	push	edx
	call	__snprintf
	add	esp, 16					; 00000010H
	push	eax
	lea	eax, DWORD PTR _printbuf$[ebp]
	push	eax
	lea	ecx, DWORD PTR _sql$[ebp]
	push	ecx
	call	_dynbuf_add
	add	esp, 20					; 00000014H

; 587  : 		if(sql_exec_query(cntxt, sql->data)) STACK_ERROR;

	mov	edx, DWORD PTR _sql$[ebp]
	add	edx, 8
	push	edx
	mov	eax, DWORD PTR _cntxt$[ebp]
	push	eax
	call	_sql_exec_query
	add	esp, 8
	test	eax, eax
	je	SHORT $L70695
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 587		; 0000024bH
	jmp	$eva_err$70678
$L70695:

; 589  : 
; 590  : 	/* Transform to age if applicable */
; 591  : 	else if(!strcmp(pvf->dispfmt, "_EVA_AGE"))

	jmp	$L70704
$L70690:
	push	OFFSET FLAT:$SG70698
	mov	edx, DWORD PTR _pvf$[ebp]
	mov	eax, DWORD PTR [edx+304]
	push	eax
	call	_strcmp
	add	esp, 8
	test	eax, eax
	jne	$L70704

; 593  : 		/* Handle reference date for age calculation */
; 594  : 		sscanf(pvf->dateref, "%4u%4u", &year, &monthday);

	lea	ecx, DWORD PTR _monthday$[ebp]
	push	ecx
	lea	edx, DWORD PTR _year$[ebp]
	push	edx
	push	OFFSET FLAT:$SG70699
	mov	eax, DWORD PTR _pvf$[ebp]
	add	eax, 340				; 00000154H
	push	eax
	call	_sscanf
	add	esp, 16					; 00000010H

; 595  : 
; 596  : 		/* Transform to age */
; 597  : 		M_FREE(sql);

	mov	ecx, DWORD PTR _sql$[ebp]
	push	ecx
	call	_mem_free
	add	esp, 4
	mov	DWORD PTR _sql$[ebp], 0

; 598  : 		dynbuf_print3(&sql,
; 599  : 			"-- pivottable_add_field - Transform to age\n"
; 600  : 			"UPDATE %s SET Val=%u-LEFT(Val,4)-IF(MID(Val,5,4)<='%04u',0,1) WHERE Val<>''",
; 601  : 			pvf->datatable, year, monthday);

	push	0
	push	0
	mov	edx, DWORD PTR _monthday$[ebp]
	push	edx
	mov	eax, DWORD PTR _year$[ebp]
	push	eax
	mov	ecx, DWORD PTR _pvf$[ebp]
	add	ecx, 208				; 000000d0H
	push	ecx
	push	OFFSET FLAT:$SG70701
	push	1023					; 000003ffH
	lea	edx, DWORD PTR _printbuf$[ebp]
	push	edx
	call	__snprintf
	add	esp, 24					; 00000018H
	push	eax
	lea	eax, DWORD PTR _printbuf$[ebp]
	push	eax
	lea	ecx, DWORD PTR _sql$[ebp]
	push	ecx
	call	_dynbuf_add
	add	esp, 20					; 00000014H

; 602  : 		if(sql_exec_query(cntxt, sql->data)) STACK_ERROR;

	mov	edx, DWORD PTR _sql$[ebp]
	add	edx, 8
	push	edx
	mov	eax, DWORD PTR _cntxt$[ebp]
	push	eax
	call	_sql_exec_query
	add	esp, 8
	test	eax, eax
	je	SHORT $L70702
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 602		; 0000025aH
	jmp	SHORT $eva_err$70678
$L70702:

; 603  : 		pvf->dispfmt = "_EVA_NUMBER";

	mov	edx, DWORD PTR _pvf$[ebp]
	mov	DWORD PTR [edx+304], OFFSET FLAT:$SG70703

; 604  : 		if(!pvf->sortmode && !pvf->sortmode[0]) pvf->sortmode = "_EVA_NUMBER";

	mov	eax, DWORD PTR _pvf$[ebp]
	cmp	DWORD PTR [eax+484], 0
	jne	SHORT $L70704
	mov	ecx, DWORD PTR _pvf$[ebp]
	mov	edx, DWORD PTR [ecx+484]
	movsx	eax, BYTE PTR [edx]
	test	eax, eax
	jne	SHORT $L70704
	mov	ecx, DWORD PTR _pvf$[ebp]
	mov	DWORD PTR [ecx+484], OFFSET FLAT:$SG70705
$L70704:
$eva_noerr$70706:

; 606  : 
; 607  : 	RETURN_OK_CLEANUP;

	push	0
	push	OFFSET FLAT:$SG70707
	push	OFFSET FLAT:$SG70708
	mov	edx, DWORD PTR _cntxt$[ebp]
	push	edx
	call	_err_clear
	add	esp, 16					; 00000010H
$eva_err$70678:
	mov	eax, DWORD PTR _cntxt$[ebp]
	cmp	DWORD PTR [eax+29872], 0
	je	SHORT $L70709
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	edx, DWORD PTR [ecx+29900]
	push	edx
	push	OFFSET FLAT:$SG70710
	push	OFFSET FLAT:$SG70711
	mov	eax, DWORD PTR _cntxt$[ebp]
	push	eax
	call	_err_add_context
	add	esp, 16					; 00000010H
$L70709:
	mov	ecx, DWORD PTR _sql$[ebp]
	push	ecx
	call	_mem_free
	add	esp, 4
	mov	DWORD PTR _sql$[ebp], 0
	mov	edx, DWORD PTR _cntxt$[ebp]
	xor	eax, eax
	cmp	DWORD PTR [edx+29872], 0
	setne	al

; 608  : }

	mov	esp, ebp
	pop	ebp
	ret	0
_pivottable_handle_field_format ENDP
_TEXT	ENDS
PUBLIC	_pivottable_slice_values
EXTRN	_atoi:NEAR
EXTRN	_sql_no_quote:BYTE
EXTRN	_dyntab_cell:NEAR
_BSS	SEGMENT
	ALIGN	4

$SG70738 DB	01H DUP (?)
	ALIGN	4

$SG70743 DB	01H DUP (?)
	ALIGN	4

$SG70765 DB	01H DUP (?)
_BSS	ENDS
_DATA	SEGMENT
	ORG $+1
$SG70725 DB	'-- pivottable_add_field - Replace values', 0aH, 'UPDATE '
	DB	'%s SET Val=', 00H
$SG70731 DB	'_EVA_DATE', 00H
	ORG $+2
$SG70733 DB	'CONCAT(LPAD(FLOOR((Val-1)/%lu)*%lu+1,2,''0''),'' - '',LP'
	DB	'AD(FLOOR((Val-1)/%lu)*%lu+%lu,2,''0'')) WHERE Val<>''''', 00H
$SG70735 DB	'_EVA_NUMBER', 00H
$SG70741 DB	'CONCAT(FLOOR(Val/%lu)*%lu,'' ~ '',FLOOR(Val/%lu)*%lu+%lu'
	DB	') WHERE Val<>''''', 00H
	ORG $+2
$SG70754 DB	'CASE WHEN Val+0<%d THEN ''%d ou -''', 00H
	ORG $+2
$SG70760 DB	' WHEN Val+0>=%d AND Val+0<%d THEN ''%d''', 00H
	ORG $+1
$SG70761 DB	' WHEN Val+0>=%d AND Val+0<%d THEN ''%d ~ %d''', 00H
$SG70763 DB	' ELSE ''%d ou +'' END WHERE Val<>''''', 00H
	ORG $+2
$SG70767 DB	'_EVA_NUMBER', 00H
$SG70770 DB	'_EVA_DATE', 00H
	ORG $+2
$SG70775 DB	''' THEN ''', 00H
	ORG $+3
$SG70776 DB	'CASE WHEN Val<''', 00H
$SG70778 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70782 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70785 DB	' et -''', 00H
	ORG $+1
$SG70787 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70794 DB	''' AND Val<=''', 00H
	ORG $+3
$SG70795 DB	' WHEN Val>=''', 00H
	ORG $+3
$SG70797 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70801 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70805 DB	' ', 0e0H, ' ', 00H
$SG70806 DB	''' THEN ''', 00H
	ORG $+3
$SG70808 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70812 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70815 DB	'''', 00H
	ORG $+2
$SG70817 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70821 DB	' ou +'' END WHERE Val<>''''', 00H
	ORG $+3
$SG70822 DB	' ELSE ''', 00H
$SG70824 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70827 DB	'D:\Travail\ABI\EVA\V4.0\CGI\Brunix-2016\pivottable.c', 00H
	ORG $+3
$SG70828 DB	'pivottable_slice_values', 00H
$SG70830 DB	'D:\Travail\ABI\EVA\V4.0\CGI\Brunix-2016\pivottable.c', 00H
	ORG $+3
$SG70831 DB	'pivottable_slice_values', 00H
_DATA	ENDS
_TEXT	SEGMENT
_cntxt$ = 8
_pvf$ = 12
_sql$ = -4
_printbuf$ = -1028
_slice$70727 = -1032
_i$70746 = -1048
_s1$70747 = -1040
_s2$70748 = -1044
_n1$70749 = -1052
_n2$70750 = -1036
__c$70772 = -1056
__c$70779 = -1060
__c$70791 = -1064
__c$70798 = -1068
__c$70802 = -1072
__c$70809 = -1076
__c$70818 = -1080
_pivottable_slice_values PROC NEAR

; 621  : ){

	push	ebp
	mov	ebp, esp
	sub	esp, 1124				; 00000464H

; 622  : 	DynBuffer *sql = NULL;

	mov	DWORD PTR _sql$[ebp], 0

; 623  : 	char printbuf[1024];
; 624  : 	dynbuf_print(&sql,
; 625  : 		"-- pivottable_add_field - Replace values\n"
; 626  : 		"UPDATE %s SET Val=", pvf->datatable);

	push	0
	push	0
	mov	eax, DWORD PTR _pvf$[ebp]
	add	eax, 208				; 000000d0H
	push	eax
	push	OFFSET FLAT:$SG70725
	push	1023					; 000003ffH
	lea	ecx, DWORD PTR _printbuf$[ebp]
	push	ecx
	call	__snprintf
	add	esp, 16					; 00000010H
	push	eax
	lea	edx, DWORD PTR _printbuf$[ebp]
	push	edx
	lea	eax, DWORD PTR _sql$[ebp]
	push	eax
	call	_dynbuf_add
	add	esp, 20					; 00000014H

; 627  : 	if(pvf->slices.nbrows == 1)

	mov	ecx, DWORD PTR _pvf$[ebp]
	cmp	DWORD PTR [ecx+368], 1
	jne	$L70726

; 629  : 		/* Only one slice : use as numerical slice width */
; 630  : 		unsigned long slice = DYNTAB_TOUL(&pvf->slices);

	push	10					; 0000000aH
	push	0
	push	0
	push	0
	mov	edx, DWORD PTR _pvf$[ebp]
	add	edx, 368				; 00000170H
	push	edx
	call	_dyntab_val
	add	esp, 12					; 0000000cH
	push	eax
	call	_strtoul
	add	esp, 12					; 0000000cH
	mov	DWORD PTR _slice$70727[ebp], eax

; 631  : 		if(slice > 1)

	cmp	DWORD PTR _slice$70727[ebp], 1
	jbe	$L70739

; 633  : 			if(!strcmp(pvf->dispfmt, "_EVA_DATE") && pvf->b_overrun)

	push	OFFSET FLAT:$SG70731
	mov	eax, DWORD PTR _pvf$[ebp]
	mov	ecx, DWORD PTR [eax+304]
	push	ecx
	call	_strcmp
	add	esp, 8
	test	eax, eax
	jne	$L70730
	mov	edx, DWORD PTR _pvf$[ebp]
	cmp	DWORD PTR [edx+480], 0
	je	$L70730

; 635  : 				dynbuf_print5(&sql,
; 636  : 					"CONCAT(LPAD(FLOOR((Val-1)/%lu)*%lu+1,2,'0'),' - ',LPAD(FLOOR((Val-1)/%lu)*%lu+%lu,2,'0')) WHERE Val<>''",
; 637  : 								slice, slice, slice, slice, slice);

	push	0
	push	0
	mov	eax, DWORD PTR _slice$70727[ebp]
	push	eax
	mov	ecx, DWORD PTR _slice$70727[ebp]
	push	ecx
	mov	edx, DWORD PTR _slice$70727[ebp]
	push	edx
	mov	eax, DWORD PTR _slice$70727[ebp]
	push	eax
	mov	ecx, DWORD PTR _slice$70727[ebp]
	push	ecx
	push	OFFSET FLAT:$SG70733
	push	1023					; 000003ffH
	lea	edx, DWORD PTR _printbuf$[ebp]
	push	edx
	call	__snprintf
	add	esp, 32					; 00000020H
	push	eax
	lea	eax, DWORD PTR _printbuf$[ebp]
	push	eax
	lea	ecx, DWORD PTR _sql$[ebp]
	push	ecx
	call	_dynbuf_add
	add	esp, 20					; 00000014H

; 638  : 				if(!*pvf->sortmode) pvf->sortmode = "_EVA_NUMBER";

	mov	edx, DWORD PTR _pvf$[ebp]
	mov	eax, DWORD PTR [edx+484]
	movsx	ecx, BYTE PTR [eax]
	test	ecx, ecx
	jne	SHORT $L70734
	mov	edx, DWORD PTR _pvf$[ebp]
	mov	DWORD PTR [edx+484], OFFSET FLAT:$SG70735
$L70734:

; 639  : 				if(sql_exec_query(cntxt, sql->data)) STACK_ERROR;

	mov	eax, DWORD PTR _sql$[ebp]
	add	eax, 8
	push	eax
	mov	ecx, DWORD PTR _cntxt$[ebp]
	push	ecx
	call	_sql_exec_query
	add	esp, 8
	test	eax, eax
	je	SHORT $L70736
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 639		; 0000027fH
	jmp	$eva_err$70737
$L70736:

; 640  : 				pvf->dispfmt = "";

	mov	eax, DWORD PTR _pvf$[ebp]
	mov	DWORD PTR [eax+304], OFFSET FLAT:$SG70738

; 642  : 			else

	jmp	$L70739
$L70730:

; 644  : 				dynbuf_print5(&sql,
; 645  : 					"CONCAT(FLOOR(Val/%lu)*%lu,' ~ ',FLOOR(Val/%lu)*%lu+%lu) WHERE Val<>''",
; 646  : 								slice, slice, slice, slice, slice);

	push	0
	push	0
	mov	ecx, DWORD PTR _slice$70727[ebp]
	push	ecx
	mov	edx, DWORD PTR _slice$70727[ebp]
	push	edx
	mov	eax, DWORD PTR _slice$70727[ebp]
	push	eax
	mov	ecx, DWORD PTR _slice$70727[ebp]
	push	ecx
	mov	edx, DWORD PTR _slice$70727[ebp]
	push	edx
	push	OFFSET FLAT:$SG70741
	push	1023					; 000003ffH
	lea	eax, DWORD PTR _printbuf$[ebp]
	push	eax
	call	__snprintf
	add	esp, 32					; 00000020H
	push	eax
	lea	ecx, DWORD PTR _printbuf$[ebp]
	push	ecx
	lea	edx, DWORD PTR _sql$[ebp]
	push	edx
	call	_dynbuf_add
	add	esp, 20					; 00000014H

; 647  : 				if(sql_exec_query(cntxt, sql->data)) STACK_ERROR;

	mov	eax, DWORD PTR _sql$[ebp]
	add	eax, 8
	push	eax
	mov	ecx, DWORD PTR _cntxt$[ebp]
	push	ecx
	call	_sql_exec_query
	add	esp, 8
	test	eax, eax
	je	SHORT $L70742
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 647		; 00000287H
	jmp	$eva_err$70737
$L70742:

; 648  : 				pvf->dispfmt = "";

	mov	eax, DWORD PTR _pvf$[ebp]
	mov	DWORD PTR [eax+304], OFFSET FLAT:$SG70743
$L70739:

; 652  : 	else if(pvf->slices.nbrows > 1)

	jmp	$L70825
$L70726:
	mov	ecx, DWORD PTR _pvf$[ebp]
	cmp	DWORD PTR [ecx+368], 1
	jbe	$L70825

; 654  : 		unsigned long i;
; 655  : 		DynTableCell *s1 = dyntab_cell(&pvf->slices, 0, 0);

	push	0
	push	0
	mov	edx, DWORD PTR _pvf$[ebp]
	add	edx, 368				; 00000170H
	push	edx
	call	_dyntab_cell
	add	esp, 12					; 0000000cH
	mov	DWORD PTR _s1$70747[ebp], eax

; 656  : 		DynTableCell *s2 = dyntab_cell(&pvf->slices, pvf->slices.nbrows - 1, 0);

	push	0
	mov	eax, DWORD PTR _pvf$[ebp]
	mov	ecx, DWORD PTR [eax+368]
	sub	ecx, 1
	push	ecx
	mov	edx, DWORD PTR _pvf$[ebp]
	add	edx, 368				; 00000170H
	push	edx
	call	_dyntab_cell
	add	esp, 12					; 0000000cH
	mov	DWORD PTR _s2$70748[ebp], eax

; 657  : 		int n1 = s1->txt ? atoi(s1->txt) : 0;

	mov	eax, DWORD PTR _s1$70747[ebp]
	cmp	DWORD PTR [eax], 0
	je	SHORT $L71557
	mov	ecx, DWORD PTR _s1$70747[ebp]
	mov	edx, DWORD PTR [ecx]
	push	edx
	call	_atoi
	add	esp, 4
	mov	DWORD PTR -1084+[ebp], eax
	jmp	SHORT $L71558
$L71557:
	mov	DWORD PTR -1084+[ebp], 0
$L71558:
	mov	eax, DWORD PTR -1084+[ebp]
	mov	DWORD PTR _n1$70749[ebp], eax

; 658  : 		int n2 = s2->txt ? atoi(s2->txt) : 0;

	mov	ecx, DWORD PTR _s2$70748[ebp]
	cmp	DWORD PTR [ecx], 0
	je	SHORT $L71559
	mov	edx, DWORD PTR _s2$70748[ebp]
	mov	eax, DWORD PTR [edx]
	push	eax
	call	_atoi
	add	esp, 4
	mov	DWORD PTR -1088+[ebp], eax
	jmp	SHORT $L71560
$L71559:
	mov	DWORD PTR -1088+[ebp], 0
$L71560:
	mov	ecx, DWORD PTR -1088+[ebp]
	mov	DWORD PTR _n2$70750[ebp], ecx

; 659  : 		if(n1 || n2)

	cmp	DWORD PTR _n1$70749[ebp], 0
	jne	SHORT $L70752
	cmp	DWORD PTR _n2$70750[ebp], 0
	je	$L70751
$L70752:

; 661  : 			/* Numerical slices */
; 662  : 			dynbuf_print2(&sql, "CASE WHEN Val+0<%d THEN '%d ou -'", n1, n1 - 1);

	push	0
	push	0
	mov	edx, DWORD PTR _n1$70749[ebp]
	sub	edx, 1
	push	edx
	mov	eax, DWORD PTR _n1$70749[ebp]
	push	eax
	push	OFFSET FLAT:$SG70754
	push	1023					; 000003ffH
	lea	ecx, DWORD PTR _printbuf$[ebp]
	push	ecx
	call	__snprintf
	add	esp, 20					; 00000014H
	push	eax
	lea	edx, DWORD PTR _printbuf$[ebp]
	push	edx
	lea	eax, DWORD PTR _sql$[ebp]
	push	eax
	call	_dynbuf_add
	add	esp, 20					; 00000014H

; 663  : 			for(i = 1; i < pvf->slices.nbrows; i++)

	mov	DWORD PTR _i$70746[ebp], 1
	jmp	SHORT $L70755
$L70756:
	mov	ecx, DWORD PTR _i$70746[ebp]
	add	ecx, 1
	mov	DWORD PTR _i$70746[ebp], ecx
$L70755:
	mov	edx, DWORD PTR _pvf$[ebp]
	mov	eax, DWORD PTR _i$70746[ebp]
	cmp	eax, DWORD PTR [edx+368]
	jae	$L70757

; 665  : 				n2 = atoi(dyntab_val(&pvf->slices, i, 0));

	push	0
	mov	ecx, DWORD PTR _i$70746[ebp]
	push	ecx
	mov	edx, DWORD PTR _pvf$[ebp]
	add	edx, 368				; 00000170H
	push	edx
	call	_dyntab_val
	add	esp, 12					; 0000000cH
	push	eax
	call	_atoi
	add	esp, 4
	mov	DWORD PTR _n2$70750[ebp], eax

; 666  : 				if(n2 <= n1) continue;

	mov	eax, DWORD PTR _n2$70750[ebp]
	cmp	eax, DWORD PTR _n1$70749[ebp]
	jg	SHORT $L70758
	jmp	SHORT $L70756
$L70758:

; 667  : 				dynbuf_print4(&sql, n2 == n1 + 1 ?
; 668  : 						" WHEN Val+0>=%d AND Val+0<%d THEN '%d'" :
; 669  : 						" WHEN Val+0>=%d AND Val+0<%d THEN '%d ~ %d'",
; 670  : 						n1, n2, n1, n2 - 1);

	mov	ecx, DWORD PTR _n1$70749[ebp]
	add	ecx, 1
	cmp	DWORD PTR _n2$70750[ebp], ecx
	jne	SHORT $L71561
	mov	DWORD PTR -1092+[ebp], OFFSET FLAT:$SG70760
	jmp	SHORT $L71562
$L71561:
	mov	DWORD PTR -1092+[ebp], OFFSET FLAT:$SG70761
$L71562:
	push	0
	push	0
	mov	edx, DWORD PTR _n2$70750[ebp]
	sub	edx, 1
	push	edx
	mov	eax, DWORD PTR _n1$70749[ebp]
	push	eax
	mov	ecx, DWORD PTR _n2$70750[ebp]
	push	ecx
	mov	edx, DWORD PTR _n1$70749[ebp]
	push	edx
	mov	eax, DWORD PTR -1092+[ebp]
	push	eax
	push	1023					; 000003ffH
	lea	ecx, DWORD PTR _printbuf$[ebp]
	push	ecx
	call	__snprintf
	add	esp, 28					; 0000001cH
	push	eax
	lea	edx, DWORD PTR _printbuf$[ebp]
	push	edx
	lea	eax, DWORD PTR _sql$[ebp]
	push	eax
	call	_dynbuf_add
	add	esp, 20					; 00000014H

; 671  : 				n1 = n2;

	mov	ecx, DWORD PTR _n2$70750[ebp]
	mov	DWORD PTR _n1$70749[ebp], ecx

; 672  : 			}

	jmp	$L70756
$L70757:

; 673  : 			dynbuf_print(&sql, " ELSE '%d ou +' END WHERE Val<>''", n1);

	push	0
	push	0
	mov	edx, DWORD PTR _n1$70749[ebp]
	push	edx
	push	OFFSET FLAT:$SG70763
	push	1023					; 000003ffH
	lea	eax, DWORD PTR _printbuf$[ebp]
	push	eax
	call	__snprintf
	add	esp, 16					; 00000010H
	push	eax
	lea	ecx, DWORD PTR _printbuf$[ebp]
	push	ecx
	lea	edx, DWORD PTR _sql$[ebp]
	push	edx
	call	_dynbuf_add
	add	esp, 20					; 00000014H

; 674  : 			if(sql_exec_query(cntxt, sql->data)) STACK_ERROR;

	mov	eax, DWORD PTR _sql$[ebp]
	add	eax, 8
	push	eax
	mov	ecx, DWORD PTR _cntxt$[ebp]
	push	ecx
	call	_sql_exec_query
	add	esp, 8
	test	eax, eax
	je	SHORT $L70764
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 674		; 000002a2H
	jmp	$eva_err$70737
$L70764:

; 675  : 			pvf->dispfmt = "";

	mov	eax, DWORD PTR _pvf$[ebp]
	mov	DWORD PTR [eax+304], OFFSET FLAT:$SG70765

; 676  : 			if(!*pvf->sortmode) pvf->sortmode = "_EVA_NUMBER";

	mov	ecx, DWORD PTR _pvf$[ebp]
	mov	edx, DWORD PTR [ecx+484]
	movsx	eax, BYTE PTR [edx]
	test	eax, eax
	jne	SHORT $L70766
	mov	ecx, DWORD PTR _pvf$[ebp]
	mov	DWORD PTR [ecx+484], OFFSET FLAT:$SG70767
$L70766:

; 678  : 		else if(!strcmp(pvf->dispfmt, "_EVA_DATE"))

	jmp	$L70825
$L70751:
	push	OFFSET FLAT:$SG70770
	mov	edx, DWORD PTR _pvf$[ebp]
	mov	eax, DWORD PTR [edx+304]
	push	eax
	call	_strcmp
	add	esp, 8
	test	eax, eax
	jne	SHORT $L70769

; 681  : 		else

	jmp	$L70825
$L70769:

; 683  : 			/* Text slices */
; 684  : 			DYNBUF_ADD3_CELLP(&sql, "CASE WHEN Val<'", s1, SQL_NO_QUOTE, "' THEN '");

	mov	ecx, DWORD PTR _s1$70747[ebp]
	mov	DWORD PTR __c$70772[ebp], ecx
	cmp	DWORD PTR __c$70772[ebp], 0
	je	SHORT $L71563
	mov	edx, DWORD PTR __c$70772[ebp]
	mov	eax, DWORD PTR [edx+4]
	mov	DWORD PTR -1096+[ebp], eax
	jmp	SHORT $L71564
$L71563:
	mov	DWORD PTR -1096+[ebp], 0
$L71564:
	cmp	DWORD PTR __c$70772[ebp], 0
	je	SHORT $L71565
	mov	ecx, DWORD PTR __c$70772[ebp]
	mov	edx, DWORD PTR [ecx]
	mov	DWORD PTR -1100+[ebp], edx
	jmp	SHORT $L71566
$L71565:
	mov	DWORD PTR -1100+[ebp], 0
$L71566:
	push	8
	push	OFFSET FLAT:$SG70775
	push	1
	push	OFFSET FLAT:_sql_no_quote
	mov	eax, DWORD PTR -1096+[ebp]
	push	eax
	mov	ecx, DWORD PTR -1100+[ebp]
	push	ecx
	push	15					; 0000000fH
	push	OFFSET FLAT:$SG70776
	lea	edx, DWORD PTR _sql$[ebp]
	push	edx
	call	_dynbuf_add3
	add	esp, 36					; 00000024H
	test	eax, eax
	je	SHORT $L70774
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29872], OFFSET FLAT:$SG70778
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 684		; 000002acH
	jmp	$eva_err$70737
$L70774:

; 685  : 			DYNBUF_ADD_CELLP(&sql, s1, SQL_NO_QUOTE);

	mov	edx, DWORD PTR _s1$70747[ebp]
	mov	DWORD PTR __c$70779[ebp], edx
	cmp	DWORD PTR __c$70779[ebp], 0
	je	SHORT $L70780
	push	1
	push	OFFSET FLAT:_sql_no_quote
	mov	eax, DWORD PTR __c$70779[ebp]
	mov	ecx, DWORD PTR [eax+4]
	push	ecx
	mov	edx, DWORD PTR __c$70779[ebp]
	mov	eax, DWORD PTR [edx]
	push	eax
	lea	ecx, DWORD PTR _sql$[ebp]
	push	ecx
	call	_dynbuf_add
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L70780
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29872], OFFSET FLAT:$SG70782
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 685		; 000002adH
	jmp	$eva_err$70737
$L70780:

; 686  : 			sql->data[sql->cnt - 1]--;

	mov	ecx, DWORD PTR _sql$[ebp]
	mov	edx, DWORD PTR [ecx+4]
	mov	eax, DWORD PTR _sql$[ebp]
	mov	cl, BYTE PTR [eax+edx+7]
	sub	cl, 1
	mov	edx, DWORD PTR _sql$[ebp]
	mov	eax, DWORD PTR [edx+4]
	mov	edx, DWORD PTR _sql$[ebp]
	mov	BYTE PTR [edx+eax+7], cl

; 687  : 			DYNBUF_ADD_STR(&sql, " et -'");

	push	0
	push	0
	push	6
	push	OFFSET FLAT:$SG70785
	lea	eax, DWORD PTR _sql$[ebp]
	push	eax
	call	_dynbuf_add
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L70784
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29872], OFFSET FLAT:$SG70787
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 687		; 000002afH
	jmp	$eva_err$70737
$L70784:

; 688  : 			for(i = 1; i < pvf->slices.nbrows; i++)

	mov	DWORD PTR _i$70746[ebp], 1
	jmp	SHORT $L70788
$L70789:
	mov	eax, DWORD PTR _i$70746[ebp]
	add	eax, 1
	mov	DWORD PTR _i$70746[ebp], eax
$L70788:
	mov	ecx, DWORD PTR _pvf$[ebp]
	mov	edx, DWORD PTR _i$70746[ebp]
	cmp	edx, DWORD PTR [ecx+368]
	jae	$L70790

; 690  : 				s2 = dyntab_cell(&pvf->slices, i, 0);

	push	0
	mov	eax, DWORD PTR _i$70746[ebp]
	push	eax
	mov	ecx, DWORD PTR _pvf$[ebp]
	add	ecx, 368				; 00000170H
	push	ecx
	call	_dyntab_cell
	add	esp, 12					; 0000000cH
	mov	DWORD PTR _s2$70748[ebp], eax

; 691  : 				DYNBUF_ADD3_CELLP(&sql, " WHEN Val>='", s1, SQL_NO_QUOTE, "' AND Val<='");

	mov	edx, DWORD PTR _s1$70747[ebp]
	mov	DWORD PTR __c$70791[ebp], edx
	cmp	DWORD PTR __c$70791[ebp], 0
	je	SHORT $L71567
	mov	eax, DWORD PTR __c$70791[ebp]
	mov	ecx, DWORD PTR [eax+4]
	mov	DWORD PTR -1104+[ebp], ecx
	jmp	SHORT $L71568
$L71567:
	mov	DWORD PTR -1104+[ebp], 0
$L71568:
	cmp	DWORD PTR __c$70791[ebp], 0
	je	SHORT $L71569
	mov	edx, DWORD PTR __c$70791[ebp]
	mov	eax, DWORD PTR [edx]
	mov	DWORD PTR -1108+[ebp], eax
	jmp	SHORT $L71570
$L71569:
	mov	DWORD PTR -1108+[ebp], 0
$L71570:
	push	12					; 0000000cH
	push	OFFSET FLAT:$SG70794
	push	1
	push	OFFSET FLAT:_sql_no_quote
	mov	ecx, DWORD PTR -1104+[ebp]
	push	ecx
	mov	edx, DWORD PTR -1108+[ebp]
	push	edx
	push	12					; 0000000cH
	push	OFFSET FLAT:$SG70795
	lea	eax, DWORD PTR _sql$[ebp]
	push	eax
	call	_dynbuf_add3
	add	esp, 36					; 00000024H
	test	eax, eax
	je	SHORT $L70793
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29872], OFFSET FLAT:$SG70797
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 691		; 000002b3H
	jmp	$eva_err$70737
$L70793:

; 692  : 				DYNBUF_ADD_CELLP(&sql, s2, SQL_NO_QUOTE);

	mov	eax, DWORD PTR _s2$70748[ebp]
	mov	DWORD PTR __c$70798[ebp], eax
	cmp	DWORD PTR __c$70798[ebp], 0
	je	SHORT $L70799
	push	1
	push	OFFSET FLAT:_sql_no_quote
	mov	ecx, DWORD PTR __c$70798[ebp]
	mov	edx, DWORD PTR [ecx+4]
	push	edx
	mov	eax, DWORD PTR __c$70798[ebp]
	mov	ecx, DWORD PTR [eax]
	push	ecx
	lea	edx, DWORD PTR _sql$[ebp]
	push	edx
	call	_dynbuf_add
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L70799
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29872], OFFSET FLAT:$SG70801
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 692		; 000002b4H
	jmp	$eva_err$70737
$L70799:

; 693  : 				DYNBUF_ADD3_CELLP(&sql, "' THEN '", s1, SQL_NO_QUOTE, " à ");

	mov	edx, DWORD PTR _s1$70747[ebp]
	mov	DWORD PTR __c$70802[ebp], edx
	cmp	DWORD PTR __c$70802[ebp], 0
	je	SHORT $L71571
	mov	eax, DWORD PTR __c$70802[ebp]
	mov	ecx, DWORD PTR [eax+4]
	mov	DWORD PTR -1112+[ebp], ecx
	jmp	SHORT $L71572
$L71571:
	mov	DWORD PTR -1112+[ebp], 0
$L71572:
	cmp	DWORD PTR __c$70802[ebp], 0
	je	SHORT $L71573
	mov	edx, DWORD PTR __c$70802[ebp]
	mov	eax, DWORD PTR [edx]
	mov	DWORD PTR -1116+[ebp], eax
	jmp	SHORT $L71574
$L71573:
	mov	DWORD PTR -1116+[ebp], 0
$L71574:
	push	3
	push	OFFSET FLAT:$SG70805
	push	1
	push	OFFSET FLAT:_sql_no_quote
	mov	ecx, DWORD PTR -1112+[ebp]
	push	ecx
	mov	edx, DWORD PTR -1116+[ebp]
	push	edx
	push	8
	push	OFFSET FLAT:$SG70806
	lea	eax, DWORD PTR _sql$[ebp]
	push	eax
	call	_dynbuf_add3
	add	esp, 36					; 00000024H
	test	eax, eax
	je	SHORT $L70804
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29872], OFFSET FLAT:$SG70808
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 693		; 000002b5H
	jmp	$eva_err$70737
$L70804:

; 694  : 				DYNBUF_ADD_CELLP(&sql, s2, SQL_NO_QUOTE);

	mov	eax, DWORD PTR _s2$70748[ebp]
	mov	DWORD PTR __c$70809[ebp], eax
	cmp	DWORD PTR __c$70809[ebp], 0
	je	SHORT $L70810
	push	1
	push	OFFSET FLAT:_sql_no_quote
	mov	ecx, DWORD PTR __c$70809[ebp]
	mov	edx, DWORD PTR [ecx+4]
	push	edx
	mov	eax, DWORD PTR __c$70809[ebp]
	mov	ecx, DWORD PTR [eax]
	push	ecx
	lea	edx, DWORD PTR _sql$[ebp]
	push	edx
	call	_dynbuf_add
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L70810
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29872], OFFSET FLAT:$SG70812
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 694		; 000002b6H
	jmp	$eva_err$70737
$L70810:

; 695  : 				sql->data[sql->cnt - 1]--;

	mov	edx, DWORD PTR _sql$[ebp]
	mov	eax, DWORD PTR [edx+4]
	mov	ecx, DWORD PTR _sql$[ebp]
	mov	dl, BYTE PTR [ecx+eax+7]
	sub	dl, 1
	mov	eax, DWORD PTR _sql$[ebp]
	mov	ecx, DWORD PTR [eax+4]
	mov	eax, DWORD PTR _sql$[ebp]
	mov	BYTE PTR [eax+ecx+7], dl

; 696  : 				DYNBUF_ADD_STR(&sql, "'");

	push	0
	push	0
	push	1
	push	OFFSET FLAT:$SG70815
	lea	ecx, DWORD PTR _sql$[ebp]
	push	ecx
	call	_dynbuf_add
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L70814
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29872], OFFSET FLAT:$SG70817
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 696		; 000002b8H
	jmp	$eva_err$70737
$L70814:

; 697  : 			}

	jmp	$L70789
$L70790:

; 698  : 			DYNBUF_ADD3_CELLP(&sql, " ELSE '", s2, SQL_NO_QUOTE, " ou +' END WHERE Val<>''");

	mov	ecx, DWORD PTR _s2$70748[ebp]
	mov	DWORD PTR __c$70818[ebp], ecx
	cmp	DWORD PTR __c$70818[ebp], 0
	je	SHORT $L71575
	mov	edx, DWORD PTR __c$70818[ebp]
	mov	eax, DWORD PTR [edx+4]
	mov	DWORD PTR -1120+[ebp], eax
	jmp	SHORT $L71576
$L71575:
	mov	DWORD PTR -1120+[ebp], 0
$L71576:
	cmp	DWORD PTR __c$70818[ebp], 0
	je	SHORT $L71577
	mov	ecx, DWORD PTR __c$70818[ebp]
	mov	edx, DWORD PTR [ecx]
	mov	DWORD PTR -1124+[ebp], edx
	jmp	SHORT $L71578
$L71577:
	mov	DWORD PTR -1124+[ebp], 0
$L71578:
	push	24					; 00000018H
	push	OFFSET FLAT:$SG70821
	push	1
	push	OFFSET FLAT:_sql_no_quote
	mov	eax, DWORD PTR -1120+[ebp]
	push	eax
	mov	ecx, DWORD PTR -1124+[ebp]
	push	ecx
	push	7
	push	OFFSET FLAT:$SG70822
	lea	edx, DWORD PTR _sql$[ebp]
	push	edx
	call	_dynbuf_add3
	add	esp, 36					; 00000024H
	test	eax, eax
	je	SHORT $L70820
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29872], OFFSET FLAT:$SG70824
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 698		; 000002baH
	jmp	SHORT $eva_err$70737
$L70820:

; 699  : 			if(sql_exec_query(cntxt, sql->data)) STACK_ERROR;

	mov	edx, DWORD PTR _sql$[ebp]
	add	edx, 8
	push	edx
	mov	eax, DWORD PTR _cntxt$[ebp]
	push	eax
	call	_sql_exec_query
	add	esp, 8
	test	eax, eax
	je	SHORT $L70825
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 699		; 000002bbH
	jmp	SHORT $eva_err$70737
$L70825:
$eva_noerr$70826:

; 702  : 
; 703  : 	RETURN_OK_CLEANUP;

	push	0
	push	OFFSET FLAT:$SG70827
	push	OFFSET FLAT:$SG70828
	mov	edx, DWORD PTR _cntxt$[ebp]
	push	edx
	call	_err_clear
	add	esp, 16					; 00000010H
$eva_err$70737:
	mov	eax, DWORD PTR _cntxt$[ebp]
	cmp	DWORD PTR [eax+29872], 0
	je	SHORT $L70829
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	edx, DWORD PTR [ecx+29900]
	push	edx
	push	OFFSET FLAT:$SG70830
	push	OFFSET FLAT:$SG70831
	mov	eax, DWORD PTR _cntxt$[ebp]
	push	eax
	call	_err_add_context
	add	esp, 16					; 00000010H
$L70829:
	mov	ecx, DWORD PTR _sql$[ebp]
	push	ecx
	call	_mem_free
	add	esp, 4
	mov	DWORD PTR _sql$[ebp], 0
	mov	edx, DWORD PTR _cntxt$[ebp]
	xor	eax, eax
	cmp	DWORD PTR [edx+29872], 0
	setne	al

; 704  : }

	mov	esp, ebp
	pop	ebp
	ret	0
_pivottable_slice_values ENDP
_TEXT	ENDS
PUBLIC	_pivottable_replace_values
_DATA	SEGMENT
$SG70851 DB	'-- pivottable_add_field - Replace values', 0aH, 'UPDATE '
	DB	'%s SET Val=CASE Val ', 00H
	ORG $+3
$SG70859 DB	''' ', 00H
	ORG $+1
$SG70860 DB	'WHEN ''', 00H
	ORG $+1
$SG70862 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70865 DB	''' ', 00H
	ORG $+1
$SG70866 DB	'THEN ''', 00H
	ORG $+1
$SG70868 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70871 DB	'ELSE Val END', 00H
	ORG $+3
$SG70873 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70875 DB	'D:\Travail\ABI\EVA\V4.0\CGI\Brunix-2016\pivottable.c', 00H
	ORG $+3
$SG70876 DB	'pivottable_replace_values', 00H
	ORG $+2
$SG70878 DB	'D:\Travail\ABI\EVA\V4.0\CGI\Brunix-2016\pivottable.c', 00H
	ORG $+3
$SG70879 DB	'pivottable_replace_values', 00H
_DATA	ENDS
_TEXT	SEGMENT
_cntxt$ = 8
_pvf$ = 12
_sql$ = -4
_printbuf$ = -1028
_i$ = -1036
_j$ = -1040
_cnt$ = -1032
_pivottable_replace_values PROC NEAR

; 717  : ){

	push	ebp
	mov	ebp, esp
	sub	esp, 1040				; 00000410H

; 718  : 	DynBuffer *sql = NULL;

	mov	DWORD PTR _sql$[ebp], 0

; 719  : 	char printbuf[1024];
; 720  : 	unsigned long i, j, cnt = 0;

	mov	DWORD PTR _cnt$[ebp], 0

; 721  : 
; 722  : 	if(!pvf->sr_src.nbrows) RETURN_OK;

	mov	eax, DWORD PTR _pvf$[ebp]
	cmp	DWORD PTR [eax+388], 0
	jne	SHORT $L70847
	jmp	$eva_noerr$70848
$L70847:

; 723  : 	if(sql) sql->cnt = 0;

	cmp	DWORD PTR _sql$[ebp], 0
	je	SHORT $L70849
	mov	ecx, DWORD PTR _sql$[ebp]
	mov	DWORD PTR [ecx+4], 0
$L70849:

; 724  : 	dynbuf_print(&sql,
; 725  : 		"-- pivottable_add_field - Replace values\n"
; 726  : 		"UPDATE %s SET Val=CASE Val ", pvf->datatable);

	push	0
	push	0
	mov	edx, DWORD PTR _pvf$[ebp]
	add	edx, 208				; 000000d0H
	push	edx
	push	OFFSET FLAT:$SG70851
	push	1023					; 000003ffH
	lea	eax, DWORD PTR _printbuf$[ebp]
	push	eax
	call	__snprintf
	add	esp, 16					; 00000010H
	push	eax
	lea	ecx, DWORD PTR _printbuf$[ebp]
	push	ecx
	lea	edx, DWORD PTR _sql$[ebp]
	push	edx
	call	_dynbuf_add
	add	esp, 20					; 00000014H

; 727  : 	for(i = 0; i < pvf->sr_src.nbrows; i++)

	mov	DWORD PTR _i$[ebp], 0
	jmp	SHORT $L70852
$L70853:
	mov	eax, DWORD PTR _i$[ebp]
	add	eax, 1
	mov	DWORD PTR _i$[ebp], eax
$L70852:
	mov	ecx, DWORD PTR _pvf$[ebp]
	mov	edx, DWORD PTR _i$[ebp]
	cmp	edx, DWORD PTR [ecx+388]
	jae	$L70854

; 728  : 		for(j = 0; j < pvf->sr_src.nbcols && dyntab_sz(&pvf->sr_src, i, j); j++)

	mov	DWORD PTR _j$[ebp], 0
	jmp	SHORT $L70855
$L70856:
	mov	eax, DWORD PTR _j$[ebp]
	add	eax, 1
	mov	DWORD PTR _j$[ebp], eax
$L70855:
	mov	ecx, DWORD PTR _pvf$[ebp]
	mov	edx, DWORD PTR _j$[ebp]
	cmp	edx, DWORD PTR [ecx+396]
	jae	$L70857
	mov	eax, DWORD PTR _j$[ebp]
	push	eax
	mov	ecx, DWORD PTR _i$[ebp]
	push	ecx
	mov	edx, DWORD PTR _pvf$[ebp]
	add	edx, 388				; 00000184H
	push	edx
	call	_dyntab_sz
	add	esp, 12					; 0000000cH
	test	eax, eax
	je	$L70857

; 730  : 			DYNBUF_ADD3_CELL(&sql, "WHEN '", &pvf->sr_src, i, j, SQL_NO_QUOTE, "' ");

	push	2
	push	OFFSET FLAT:$SG70859
	push	1
	push	OFFSET FLAT:_sql_no_quote
	mov	eax, DWORD PTR _j$[ebp]
	push	eax
	mov	ecx, DWORD PTR _i$[ebp]
	push	ecx
	mov	edx, DWORD PTR _pvf$[ebp]
	add	edx, 388				; 00000184H
	push	edx
	call	_dyntab_sz
	add	esp, 12					; 0000000cH
	push	eax
	mov	eax, DWORD PTR _j$[ebp]
	push	eax
	mov	ecx, DWORD PTR _i$[ebp]
	push	ecx
	mov	edx, DWORD PTR _pvf$[ebp]
	add	edx, 388				; 00000184H
	push	edx
	call	_dyntab_val
	add	esp, 12					; 0000000cH
	push	eax
	push	6
	push	OFFSET FLAT:$SG70860
	lea	eax, DWORD PTR _sql$[ebp]
	push	eax
	call	_dynbuf_add3
	add	esp, 36					; 00000024H
	test	eax, eax
	je	SHORT $L70858
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29872], OFFSET FLAT:$SG70862
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 730		; 000002daH
	jmp	$eva_err$70863
$L70858:

; 731  : 			DYNBUF_ADD3_CELL(&sql, "THEN '", &pvf->sr_dest, i, 0, SQL_NO_QUOTE, "' ");

	push	2
	push	OFFSET FLAT:$SG70865
	push	1
	push	OFFSET FLAT:_sql_no_quote
	push	0
	mov	eax, DWORD PTR _i$[ebp]
	push	eax
	mov	ecx, DWORD PTR _pvf$[ebp]
	add	ecx, 408				; 00000198H
	push	ecx
	call	_dyntab_sz
	add	esp, 12					; 0000000cH
	push	eax
	push	0
	mov	edx, DWORD PTR _i$[ebp]
	push	edx
	mov	eax, DWORD PTR _pvf$[ebp]
	add	eax, 408				; 00000198H
	push	eax
	call	_dyntab_val
	add	esp, 12					; 0000000cH
	push	eax
	push	6
	push	OFFSET FLAT:$SG70866
	lea	ecx, DWORD PTR _sql$[ebp]
	push	ecx
	call	_dynbuf_add3
	add	esp, 36					; 00000024H
	test	eax, eax
	je	SHORT $L70864
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29872], OFFSET FLAT:$SG70868
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 731		; 000002dbH
	jmp	$eva_err$70863
$L70864:

; 732  : 			cnt++;

	mov	ecx, DWORD PTR _cnt$[ebp]
	add	ecx, 1
	mov	DWORD PTR _cnt$[ebp], ecx

; 733  : 		}

	jmp	$L70856
$L70857:
	jmp	$L70853
$L70854:

; 734  : 	DYNBUF_ADD_STR(&sql, "ELSE Val END");

	push	0
	push	0
	push	12					; 0000000cH
	push	OFFSET FLAT:$SG70871
	lea	edx, DWORD PTR _sql$[ebp]
	push	edx
	call	_dynbuf_add
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L70870
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29872], OFFSET FLAT:$SG70873
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 734		; 000002deH
	jmp	SHORT $eva_err$70863
$L70870:

; 735  : 	if(cnt && sql_exec_query(cntxt, sql->data)) STACK_ERROR;

	cmp	DWORD PTR _cnt$[ebp], 0
	je	SHORT $eva_noerr$70848
	mov	edx, DWORD PTR _sql$[ebp]
	add	edx, 8
	push	edx
	mov	eax, DWORD PTR _cntxt$[ebp]
	push	eax
	call	_sql_exec_query
	add	esp, 8
	test	eax, eax
	je	SHORT $eva_noerr$70848
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 735		; 000002dfH
	jmp	SHORT $eva_err$70863
$eva_noerr$70848:

; 736  : 
; 737  : 	RETURN_OK_CLEANUP;

	push	0
	push	OFFSET FLAT:$SG70875
	push	OFFSET FLAT:$SG70876
	mov	edx, DWORD PTR _cntxt$[ebp]
	push	edx
	call	_err_clear
	add	esp, 16					; 00000010H
$eva_err$70863:
	mov	eax, DWORD PTR _cntxt$[ebp]
	cmp	DWORD PTR [eax+29872], 0
	je	SHORT $L70877
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	edx, DWORD PTR [ecx+29900]
	push	edx
	push	OFFSET FLAT:$SG70878
	push	OFFSET FLAT:$SG70879
	mov	eax, DWORD PTR _cntxt$[ebp]
	push	eax
	call	_err_add_context
	add	esp, 16					; 00000010H
$L70877:
	mov	ecx, DWORD PTR _sql$[ebp]
	push	ecx
	call	_mem_free
	add	esp, 4
	mov	DWORD PTR _sql$[ebp], 0
	mov	edx, DWORD PTR _cntxt$[ebp]
	xor	eax, eax
	cmp	DWORD PTR [edx+29872], 0
	setne	al

; 738  : }

	mov	esp, ebp
	pop	ebp
	ret	0
_pivottable_replace_values ENDP
_TEXT	ENDS
PUBLIC	_pivottable_set_cellval
EXTRN	_dyntab_copy:NEAR
_DATA	SEGMENT
	ORG $+2
$SG70902 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70907 DB	'D:\Travail\ABI\EVA\V4.0\CGI\Brunix-2016\pivottable.c', 00H
	ORG $+3
$SG70908 DB	'pivottable_set_cellval', 00H
	ORG $+1
$SG70910 DB	'D:\Travail\ABI\EVA\V4.0\CGI\Brunix-2016\pivottable.c', 00H
	ORG $+3
$SG70911 DB	'pivottable_set_cellval', 00H
_DATA	ENDS
_TEXT	SEGMENT
_cntxt$ = 8
_pv$ = 12
_row$ = 16
_col$ = 20
_src$ = 24
_i$ = 28
_j$ = 32
_c$ = -4
_pivottable_set_cellval PROC NEAR

; 756  : ){

	push	ebp
	mov	ebp, esp
	push	ecx

; 757  : 	DynTableCell *c;
; 758  : 	DYNTAB_ADD_CELL(pv->res, row, col, src, i, j);

	push	1
	mov	eax, DWORD PTR _j$[ebp]
	push	eax
	mov	ecx, DWORD PTR _i$[ebp]
	push	ecx
	mov	edx, DWORD PTR _src$[ebp]
	push	edx
	call	_dyntab_cell
	add	esp, 12					; 0000000cH
	push	eax
	mov	eax, DWORD PTR _col$[ebp]
	push	eax
	mov	ecx, DWORD PTR _row$[ebp]
	push	ecx
	mov	edx, DWORD PTR _pv$[ebp]
	mov	eax, DWORD PTR [edx+212]
	push	eax
	call	_dyntab_copy
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L70900
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29872], OFFSET FLAT:$SG70902
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 758		; 000002f6H
	jmp	$eva_err$70903
$L70900:

; 759  : 	c = dyntab_cell(pv->res, row, col);

	mov	eax, DWORD PTR _col$[ebp]
	push	eax
	mov	ecx, DWORD PTR _row$[ebp]
	push	ecx
	mov	edx, DWORD PTR _pv$[ebp]
	mov	eax, DWORD PTR [edx+212]
	push	eax
	call	_dyntab_cell
	add	esp, 12					; 0000000cH
	mov	DWORD PTR _c$[ebp], eax

; 760  : 	c->IdObj = DYNTAB_TOULRC(src, i, j + 1);

	push	10					; 0000000aH
	push	0
	mov	ecx, DWORD PTR _j$[ebp]
	add	ecx, 1
	push	ecx
	mov	edx, DWORD PTR _i$[ebp]
	push	edx
	mov	eax, DWORD PTR _src$[ebp]
	push	eax
	call	_dyntab_val
	add	esp, 12					; 0000000cH
	push	eax
	call	_strtoul
	add	esp, 12					; 0000000cH
	mov	ecx, DWORD PTR _c$[ebp]
	mov	DWORD PTR [ecx+20], eax

; 761  : 	c->IdValObj = DYNTAB_TOULRC(src, i, j + 2);

	push	10					; 0000000aH
	push	0
	mov	edx, DWORD PTR _j$[ebp]
	add	edx, 2
	push	edx
	mov	eax, DWORD PTR _i$[ebp]
	push	eax
	mov	ecx, DWORD PTR _src$[ebp]
	push	ecx
	call	_dyntab_val
	add	esp, 12					; 0000000cH
	push	eax
	call	_strtoul
	add	esp, 12					; 0000000cH
	mov	edx, DWORD PTR _c$[ebp]
	mov	DWORD PTR [edx+24], eax
$eva_noerr$70906:

; 762  : 
; 763  : 	RETURN_OK_CLEANUP;

	push	0
	push	OFFSET FLAT:$SG70907
	push	OFFSET FLAT:$SG70908
	mov	eax, DWORD PTR _cntxt$[ebp]
	push	eax
	call	_err_clear
	add	esp, 16					; 00000010H
$eva_err$70903:
	mov	ecx, DWORD PTR _cntxt$[ebp]
	cmp	DWORD PTR [ecx+29872], 0
	je	SHORT $L70909
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	eax, DWORD PTR [edx+29900]
	push	eax
	push	OFFSET FLAT:$SG70910
	push	OFFSET FLAT:$SG70911
	mov	ecx, DWORD PTR _cntxt$[ebp]
	push	ecx
	call	_err_add_context
	add	esp, 16					; 00000010H
$L70909:
	mov	edx, DWORD PTR _cntxt$[ebp]
	xor	eax, eax
	cmp	DWORD PTR [edx+29872], 0
	setne	al

; 764  : }

	mov	esp, ebp
	pop	ebp
	ret	0
_pivottable_set_cellval ENDP
_TEXT	ENDS
PUBLIC	_pivottable_add_field
_BSS	SEGMENT
	ALIGN	4

$SG70931 DB	01H DUP (?)
_BSS	ENDS
_DATA	SEGMENT
	ORG $+1
$SG70930 DB	'.Val,', 00H
	ORG $+2
$SG70933 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70936 DB	'LEFT', 00H
	ORG $+3
$SG70937 DB	'INNER', 00H
	ORG $+2
$SG70938 DB	'%s JOIN %s ON %s.IdObj=%s.IdObj', 0aH, 00H
	ORG $+3
$SG70941 DB	'IF(%s.Val IS NULL,'''',%s.Val)<>''''', 00H
	ORG $+3
$SG70948 DB	'DELETE FROM %s WHERE Val=''''', 00H
$SG70952 DB	'D:\Travail\ABI\EVA\V4.0\CGI\Brunix-2016\pivottable.c', 00H
	ORG $+3
$SG70953 DB	'pivottable_add_field', 00H
	ORG $+3
$SG70955 DB	'D:\Travail\ABI\EVA\V4.0\CGI\Brunix-2016\pivottable.c', 00H
	ORG $+3
$SG70956 DB	'pivottable_add_field', 00H
_DATA	ENDS
_TEXT	SEGMENT
_cntxt$ = 8
_pv$ = 12
_pvf$ = 16
_printbuf$ = -1024
_pivottable_add_field PROC NEAR

; 778  : ){

	push	ebp
	mov	ebp, esp
	sub	esp, 1028				; 00000404H

; 779  : 	char printbuf[1024];
; 780  : 
; 781  : 	/* Check params & read field data */
; 782  : 	if(!pv || !pvf || !pvf->expr.nbrows) return 0;

	cmp	DWORD PTR _pv$[ebp], 0
	je	SHORT $L70924
	cmp	DWORD PTR _pvf$[ebp], 0
	je	SHORT $L70924
	mov	eax, DWORD PTR _pvf$[ebp]
	cmp	DWORD PTR [eax+4], 0
	jne	SHORT $L70923
$L70924:
	xor	eax, eax
	jmp	$L70921
$L70923:

; 783  : 
; 784  : 	/* Read field data (base objects Ids) */
; 785  : 	if(!pvf->b_done && pivottable_get_field_data(cntxt, pv, pvf)) STACK_ERROR;

	mov	ecx, DWORD PTR _pvf$[ebp]
	cmp	DWORD PTR [ecx+276], 0
	jne	SHORT $L70925
	mov	edx, DWORD PTR _pvf$[ebp]
	push	edx
	mov	eax, DWORD PTR _pv$[ebp]
	push	eax
	mov	ecx, DWORD PTR _cntxt$[ebp]
	push	ecx
	call	_pivottable_get_field_data
	add	esp, 12					; 0000000cH
	test	eax, eax
	je	SHORT $L70925
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 785		; 00000311H
	jmp	$eva_err$70926
$L70925:

; 786  : 
; 787  : 	/* Build SELECT & JOIN clauses for cross values table if not data field */
; 788  : 	if(*pvf->pos != 'D')

	mov	eax, DWORD PTR _pvf$[ebp]
	mov	ecx, DWORD PTR [eax+184]
	movsx	edx, BYTE PTR [ecx]
	cmp	edx, 68					; 00000044H
	je	$L70939

; 790  : 		DYNBUF_ADD3(&pv->select, "", pvf->datatable, 0, NO_CONV, ".Val,");

	push	5
	push	OFFSET FLAT:$SG70930
	push	0
	push	0
	push	0
	mov	eax, DWORD PTR _pvf$[ebp]
	add	eax, 208				; 000000d0H
	push	eax
	push	0
	push	OFFSET FLAT:$SG70931
	mov	ecx, DWORD PTR _pv$[ebp]
	add	ecx, 94204				; 00016ffcH
	push	ecx
	call	_dynbuf_add3
	add	esp, 36					; 00000024H
	test	eax, eax
	je	SHORT $L70929
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29872], OFFSET FLAT:$SG70933
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 790		; 00000316H
	jmp	$eva_err$70926
$L70929:

; 791  : 		if(pv->basetable && strcmp(pvf->datatable, pv->basetable))

	mov	ecx, DWORD PTR _pv$[ebp]
	cmp	DWORD PTR [ecx+192], 0
	je	$L70934
	mov	edx, DWORD PTR _pv$[ebp]
	mov	eax, DWORD PTR [edx+192]
	push	eax
	mov	ecx, DWORD PTR _pvf$[ebp]
	add	ecx, 208				; 000000d0H
	push	ecx
	call	_strcmp
	add	esp, 8
	test	eax, eax
	je	SHORT $L70934

; 792  : 			dynbuf_print4(&pv->join, "%s JOIN %s ON %s.IdObj=%s.IdObj\n",
; 793  : 									pvf->b_showemptyval ? "LEFT" : "INNER",
; 794  : 									pvf->datatable, pv->basetable, pvf->datatable);

	mov	edx, DWORD PTR _pvf$[ebp]
	cmp	DWORD PTR [edx+512], 0
	je	SHORT $L71582
	mov	DWORD PTR -1028+[ebp], OFFSET FLAT:$SG70936
	jmp	SHORT $L71583
$L71582:
	mov	DWORD PTR -1028+[ebp], OFFSET FLAT:$SG70937
$L71583:
	push	0
	push	0
	mov	eax, DWORD PTR _pvf$[ebp]
	add	eax, 208				; 000000d0H
	push	eax
	mov	ecx, DWORD PTR _pv$[ebp]
	mov	edx, DWORD PTR [ecx+192]
	push	edx
	mov	eax, DWORD PTR _pvf$[ebp]
	add	eax, 208				; 000000d0H
	push	eax
	mov	ecx, DWORD PTR -1028+[ebp]
	push	ecx
	push	OFFSET FLAT:$SG70938
	push	1023					; 000003ffH
	lea	edx, DWORD PTR _printbuf$[ebp]
	push	edx
	call	__snprintf
	add	esp, 28					; 0000001cH
	push	eax
	lea	eax, DWORD PTR _printbuf$[ebp]
	push	eax
	mov	ecx, DWORD PTR _pv$[ebp]
	add	ecx, 94208				; 00017000H
	push	ecx
	call	_dynbuf_add
	add	esp, 20					; 00000014H
$L70934:

; 795  : 
; 796  : 		/* Add WHERE clause to hide empty values */
; 797  : 		if(!pvf->b_showemptyval)

	mov	edx, DWORD PTR _pvf$[ebp]
	cmp	DWORD PTR [edx+512], 0
	jne	SHORT $L70939

; 798  : 			dynbuf_print2(&pvf->where, "IF(%s.Val IS NULL,'',%s.Val)<>''", pvf->datatable, pvf->datatable);

	push	0
	push	0
	mov	eax, DWORD PTR _pvf$[ebp]
	add	eax, 208				; 000000d0H
	push	eax
	mov	ecx, DWORD PTR _pvf$[ebp]
	add	ecx, 208				; 000000d0H
	push	ecx
	push	OFFSET FLAT:$SG70941
	push	1023					; 000003ffH
	lea	edx, DWORD PTR _printbuf$[ebp]
	push	edx
	call	__snprintf
	add	esp, 20					; 00000014H
	push	eax
	lea	eax, DWORD PTR _printbuf$[ebp]
	push	eax
	mov	ecx, DWORD PTR _pvf$[ebp]
	add	ecx, 576				; 00000240H
	push	ecx
	call	_dynbuf_add
	add	esp, 20					; 00000014H
$L70939:

; 800  : 
; 801  : 	/* Return if field already has values */
; 802  : 	if(pvf->b_done) RETURN_OK;

	mov	edx, DWORD PTR _pvf$[ebp]
	cmp	DWORD PTR [edx+276], 0
	je	SHORT $L70942
	jmp	$eva_noerr$70943
$L70942:

; 803  : 	pvf->b_done = 1;

	mov	eax, DWORD PTR _pvf$[ebp]
	mov	DWORD PTR [eax+276], 1

; 804  : 
; 805  : 	/* Handle field format */
; 806  : 	if(pivottable_handle_field_format(cntxt, pvf)) STACK_ERROR;

	mov	ecx, DWORD PTR _pvf$[ebp]
	push	ecx
	mov	edx, DWORD PTR _cntxt$[ebp]
	push	edx
	call	_pivottable_handle_field_format
	add	esp, 8
	test	eax, eax
	je	SHORT $L70944
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 806		; 00000326H
	jmp	$eva_err$70926
$L70944:

; 807  : 
; 808  : 	/* Slice values as applicable */
; 809  : 	if(pivottable_slice_values(cntxt, pvf)) STACK_ERROR;

	mov	ecx, DWORD PTR _pvf$[ebp]
	push	ecx
	mov	edx, DWORD PTR _cntxt$[ebp]
	push	edx
	call	_pivottable_slice_values
	add	esp, 8
	test	eax, eax
	je	SHORT $L70945
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 809		; 00000329H
	jmp	$eva_err$70926
$L70945:

; 810  : 
; 811  : 	/* Substitute values as applicable */
; 812  : 	if(pivottable_replace_values(cntxt, pvf)) STACK_ERROR;

	mov	ecx, DWORD PTR _pvf$[ebp]
	push	ecx
	mov	edx, DWORD PTR _cntxt$[ebp]
	push	edx
	call	_pivottable_replace_values
	add	esp, 8
	test	eax, eax
	je	SHORT $L70946
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 812		; 0000032cH
	jmp	$eva_err$70926
$L70946:

; 813  : 
; 814  : 	/* Handle empty values	*/
; 815  : 	if(!pvf->b_showemptyval)

	mov	ecx, DWORD PTR _pvf$[ebp]
	cmp	DWORD PTR [ecx+512], 0
	jne	SHORT $L70947

; 817  : 		snprintf(add_sz_str(printbuf), "DELETE FROM %s WHERE Val=''", pvf->datatable);

	mov	edx, DWORD PTR _pvf$[ebp]
	add	edx, 208				; 000000d0H
	push	edx
	push	OFFSET FLAT:$SG70948
	push	1023					; 000003ffH
	lea	eax, DWORD PTR _printbuf$[ebp]
	push	eax
	call	__snprintf
	add	esp, 16					; 00000010H

; 818  : 		if(sql_exec_query(cntxt, printbuf)) STACK_ERROR;

	lea	ecx, DWORD PTR _printbuf$[ebp]
	push	ecx
	mov	edx, DWORD PTR _cntxt$[ebp]
	push	edx
	call	_sql_exec_query
	add	esp, 8
	test	eax, eax
	je	SHORT $L70949
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 818		; 00000332H
	jmp	SHORT $eva_err$70926
$L70949:

; 820  : 	else

	jmp	SHORT $eva_noerr$70943
$L70947:

; 821  : 		if(pvf->srctable && pv->nbobj > pvf->nbobj && pvf != pv->data &&
; 822  : 				pivottable_add_empty_values(cntxt, pv, pvf)) STACK_ERROR;

	mov	ecx, DWORD PTR _pvf$[ebp]
	cmp	DWORD PTR [ecx+272], 0
	je	SHORT $eva_noerr$70943
	mov	edx, DWORD PTR _pv$[ebp]
	mov	eax, DWORD PTR _pvf$[ebp]
	mov	ecx, DWORD PTR [edx+196]
	cmp	ecx, DWORD PTR [eax+280]
	jbe	SHORT $eva_noerr$70943
	mov	edx, DWORD PTR _pv$[ebp]
	mov	eax, DWORD PTR _pvf$[ebp]
	cmp	eax, DWORD PTR [edx+208]
	je	SHORT $eva_noerr$70943
	mov	ecx, DWORD PTR _pvf$[ebp]
	push	ecx
	mov	edx, DWORD PTR _pv$[ebp]
	push	edx
	mov	eax, DWORD PTR _cntxt$[ebp]
	push	eax
	call	_pivottable_add_empty_values
	add	esp, 12					; 0000000cH
	test	eax, eax
	je	SHORT $eva_noerr$70943
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 822		; 00000336H
	jmp	SHORT $eva_err$70926
$eva_noerr$70943:

; 823  : 
; 824  : 
; 825  : 	RETURN_OK_CLEANUP;

	push	0
	push	OFFSET FLAT:$SG70952
	push	OFFSET FLAT:$SG70953
	mov	edx, DWORD PTR _cntxt$[ebp]
	push	edx
	call	_err_clear
	add	esp, 16					; 00000010H
$eva_err$70926:
	mov	eax, DWORD PTR _cntxt$[ebp]
	cmp	DWORD PTR [eax+29872], 0
	je	SHORT $L70954
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	edx, DWORD PTR [ecx+29900]
	push	edx
	push	OFFSET FLAT:$SG70955
	push	OFFSET FLAT:$SG70956
	mov	eax, DWORD PTR _cntxt$[ebp]
	push	eax
	call	_err_add_context
	add	esp, 16					; 00000010H
$L70954:
	mov	ecx, DWORD PTR _cntxt$[ebp]
	xor	eax, eax
	cmp	DWORD PTR [ecx+29872], 0
	setne	al
$L70921:

; 826  : }

	mov	esp, ebp
	pop	ebp
	ret	0
_pivottable_add_field ENDP
_TEXT	ENDS
PUBLIC	_pivottable_handle_relation_label
EXTRN	_qry_obj_label:NEAR
EXTRN	_qry_obj_field:NEAR
_DATA	SEGMENT
	ORG $+3
$SG70989 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70995 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70997 DB	'D:\Travail\ABI\EVA\V4.0\CGI\Brunix-2016\pivottable.c', 00H
	ORG $+3
$SG70998 DB	'pivottable_handle_relation_label', 00H
	ORG $+3
$SG71000 DB	'D:\Travail\ABI\EVA\V4.0\CGI\Brunix-2016\pivottable.c', 00H
	ORG $+3
$SG71001 DB	'pivottable_handle_relation_label', 00H
_DATA	ENDS
_TEXT	SEGMENT
_cntxt$ = 8
_pvf$ = 12
_i$ = 16
_objdata$ = -28
_buf$ = -4
_id_obj$ = -8
_pivottable_handle_relation_label PROC NEAR

; 841  : ){

	push	ebp
	mov	ebp, esp
	sub	esp, 28					; 0000001cH

; 842  : 	DynTable objdata = {0};

	mov	DWORD PTR _objdata$[ebp], 0
	xor	eax, eax
	mov	DWORD PTR _objdata$[ebp+4], eax
	mov	DWORD PTR _objdata$[ebp+8], eax
	mov	DWORD PTR _objdata$[ebp+12], eax
	mov	DWORD PTR _objdata$[ebp+16], eax

; 843  : 	DynBuffer *buf = NULL;

	mov	DWORD PTR _buf$[ebp], 0

; 844  : 	unsigned long id_obj = DYNTAB_TOULRC(&pvf->labels, i, 0);

	push	10					; 0000000aH
	push	0
	push	0
	mov	ecx, DWORD PTR _i$[ebp]
	push	ecx
	mov	edx, DWORD PTR _pvf$[ebp]
	add	edx, 24					; 00000018H
	push	edx
	call	_dyntab_val
	add	esp, 12					; 0000000cH
	push	eax
	call	_strtoul
	add	esp, 12					; 0000000cH
	mov	DWORD PTR _id_obj$[ebp], eax

; 845  : 	if(id_obj)

	cmp	DWORD PTR _id_obj$[ebp], 0
	je	$L70993

; 847  : 		dyntab_cell(&pvf->labels, i, 0)->IdObj = id_obj;

	push	0
	mov	eax, DWORD PTR _i$[ebp]
	push	eax
	mov	ecx, DWORD PTR _pvf$[ebp]
	add	ecx, 24					; 00000018H
	push	ecx
	call	_dyntab_cell
	add	esp, 12					; 0000000cH
	mov	edx, DWORD PTR _id_obj$[ebp]
	mov	DWORD PTR [eax+20], edx

; 848  : 		if(qry_obj_field(cntxt, &objdata, id_obj, NULL)) STACK_ERROR;

	push	0
	mov	eax, DWORD PTR _id_obj$[ebp]
	push	eax
	lea	ecx, DWORD PTR _objdata$[ebp]
	push	ecx
	mov	edx, DWORD PTR _cntxt$[ebp]
	push	edx
	call	_qry_obj_field
	add	esp, 16					; 00000010H
	test	eax, eax
	je	SHORT $L70975
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 848		; 00000350H
	jmp	$eva_err$70976
$L70975:

; 849  : 		if(qry_obj_label(cntxt, NULL, NULL, &buf, NULL, NULL, NULL, NULL, NULL, 0, &objdata, 0)) STACK_ERROR;

	push	0
	lea	ecx, DWORD PTR _objdata$[ebp]
	push	ecx
	push	0
	push	0
	push	0
	push	0
	push	0
	push	0
	lea	edx, DWORD PTR _buf$[ebp]
	push	edx
	push	0
	push	0
	mov	eax, DWORD PTR _cntxt$[ebp]
	push	eax
	call	_qry_obj_label
	add	esp, 48					; 00000030H
	test	eax, eax
	je	SHORT $L70984
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 849		; 00000351H
	jmp	$eva_err$70976
$L70984:

; 850  : 		DYNTAB_ADD_BUF(&pvf->labels, i, 0, buf);

	cmp	DWORD PTR _buf$[ebp], 0
	je	SHORT $L70985
	mov	edx, DWORD PTR _buf$[ebp]
	cmp	DWORD PTR [edx+4], 0
	je	SHORT $L70985
	push	0
	push	0
	mov	eax, DWORD PTR _buf$[ebp]
	mov	ecx, DWORD PTR [eax+4]
	push	ecx
	mov	edx, DWORD PTR _buf$[ebp]
	add	edx, 8
	push	edx
	push	0
	mov	eax, DWORD PTR _i$[ebp]
	push	eax
	mov	ecx, DWORD PTR _pvf$[ebp]
	add	ecx, 24					; 00000018H
	push	ecx
	call	_dyntab_add
	add	esp, 28					; 0000001cH
	test	eax, eax
	je	SHORT $L70987
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29872], OFFSET FLAT:$SG70989
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 850		; 00000352H
	jmp	SHORT $eva_err$70976
$L70987:
	jmp	SHORT $L70993
$L70985:
	push	0
	push	0
	push	0
	push	0
	push	0
	mov	ecx, DWORD PTR _i$[ebp]
	push	ecx
	mov	edx, DWORD PTR _pvf$[ebp]
	add	edx, 24					; 00000018H
	push	edx
	call	_dyntab_add
	add	esp, 28					; 0000001cH
	test	eax, eax
	je	SHORT $L70993
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29872], OFFSET FLAT:$SG70995
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 850		; 00000352H
	jmp	SHORT $eva_err$70976
$L70993:
$eva_noerr$70996:

; 852  : 
; 853  : 	RETURN_OK_CLEANUP;

	push	0
	push	OFFSET FLAT:$SG70997
	push	OFFSET FLAT:$SG70998
	mov	edx, DWORD PTR _cntxt$[ebp]
	push	edx
	call	_err_clear
	add	esp, 16					; 00000010H
$eva_err$70976:
	mov	eax, DWORD PTR _cntxt$[ebp]
	cmp	DWORD PTR [eax+29872], 0
	je	SHORT $L70999
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	edx, DWORD PTR [ecx+29900]
	push	edx
	push	OFFSET FLAT:$SG71000
	push	OFFSET FLAT:$SG71001
	mov	eax, DWORD PTR _cntxt$[ebp]
	push	eax
	call	_err_add_context
	add	esp, 16					; 00000010H
$L70999:
	lea	ecx, DWORD PTR _objdata$[ebp]
	push	ecx
	call	_dyntab_free
	add	esp, 4
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

; 854  : }

	mov	esp, ebp
	pop	ebp
	ret	0
_pivottable_handle_relation_label ENDP
_TEXT	ENDS
PUBLIC	_pivottable_build_labels
EXTRN	_qsort_col0i:NEAR
EXTRN	_qsort_col0idesc:NEAR
EXTRN	_qsort_col0desc:NEAR
EXTRN	_qsort_col0:NEAR
EXTRN	_qsort_col1fdesc:NEAR
EXTRN	_qsort_col1f:NEAR
EXTRN	_qsort_val_col:NEAR
EXTRN	_dyntab_cmp:NEAR
EXTRN	_dyntab_group:NEAR
EXTRN	_dyntab_sort:NEAR
_BSS	SEGMENT
	ALIGN	4

$SG71091 DB	01H DUP (?)
	ALIGN	4

$SG71117 DB	01H DUP (?)
_BSS	ENDS
_DATA	SEGMENT
	ORG $+3
$SG71028 DB	'_EVA_RELATION', 00H
	ORG $+2
$SG71033 DB	'-- pivottable_build_labels - Read all field labels', 0aH
	DB	'SELECT DISTINCT Val FROM %s', 00H
	ORG $+1
$SG71037 DB	'DISTINCT', 00H
	ORG $+3
$SG71039 DB	'-- pivottable_build_labels - Read field labels & counts', 0aH
	DB	'SELECT %s.Val,%s,COUNT(DISTINCT %s.IdObj),MAX(%s.IdObj)', 0aH
	DB	'FROM %s', 0aH, 00H
	ORG $+3
$SG71043 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG71048 DB	0aH, 00H
	ORG $+2
$SG71049 DB	'WHERE ', 00H
	ORG $+1
$SG71051 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG71053 DB	'GROUP BY %s.Val', 00H
$SG71060 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG71078 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG71084 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG71109 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG71115 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG71119 DB	'_EVA_NONE', 00H
	ORG $+2
$SG71120 DB	'_EVA_NUMBER', 00H
$SG71121 DB	'_EVA_TOTAL', 00H
	ORG $+1
$SG71131 DB	'D:\Travail\ABI\EVA\V4.0\CGI\Brunix-2016\pivottable.c', 00H
	ORG $+3
$SG71132 DB	'pivottable_build_labels', 00H
$SG71134 DB	'D:\Travail\ABI\EVA\V4.0\CGI\Brunix-2016\pivottable.c', 00H
	ORG $+3
$SG71135 DB	'pivottable_build_labels', 00H
_DATA	ENDS
_TEXT	SEGMENT
_cntxt$ = 8
_pv$ = 12
_pvf$ = 16
_labels$ = -1056
_sql$ = -4
_objdata$ = -1096
_printbuf$ = -1028
_end$ = -1064
_c$ = -1036
_c1$ = -1032
_i$ = -1072
_j$ = -1076
_k$ = -1100
_id$ = -1108
_id1$ = -1068
_b_first$ = -1060
_b_relation$ = -1104
_c$71089 = -1116
_s$71090 = -1112
_id_obj$71092 = -1120
_c$71126 = -1128
_p$71127 = -1124
_pivottable_build_labels PROC NEAR

; 870  : ){

	push	ebp
	mov	ebp, esp
	sub	esp, 1184				; 000004a0H

; 871  : 	DynTable labels = {0};

	mov	DWORD PTR _labels$[ebp], 0
	xor	eax, eax
	mov	DWORD PTR _labels$[ebp+4], eax
	mov	DWORD PTR _labels$[ebp+8], eax
	mov	DWORD PTR _labels$[ebp+12], eax
	mov	DWORD PTR _labels$[ebp+16], eax

; 872  : 	DynBuffer *sql = NULL;

	mov	DWORD PTR _sql$[ebp], 0

; 873  : 	DynTable objdata = {0};

	mov	DWORD PTR _objdata$[ebp], 0
	xor	ecx, ecx
	mov	DWORD PTR _objdata$[ebp+4], ecx
	mov	DWORD PTR _objdata$[ebp+8], ecx
	mov	DWORD PTR _objdata$[ebp+12], ecx
	mov	DWORD PTR _objdata$[ebp+16], ecx

; 874  : 	char printbuf[1024], *end;
; 875  : 	DynTableCell *c, *c1;
; 876  : 	unsigned long i, j, k, id, id1 = 0;

	mov	DWORD PTR _id1$[ebp], 0

; 877  : 	int b_first = pvf && pvf->labels.nbcols <= 1;

	cmp	DWORD PTR _pvf$[ebp], 0
	je	SHORT $L71586
	mov	edx, DWORD PTR _pvf$[ebp]
	cmp	DWORD PTR [edx+32], 1
	ja	SHORT $L71586
	mov	DWORD PTR -1132+[ebp], 1
	jmp	SHORT $L71587
$L71586:
	mov	DWORD PTR -1132+[ebp], 0
$L71587:
	mov	eax, DWORD PTR -1132+[ebp]
	mov	DWORD PTR _b_first$[ebp], eax

; 878  : 	int b_relation = pvf && pvf->dispfmt && !strcmp(pvf->dispfmt, "_EVA_RELATION");

	cmp	DWORD PTR _pvf$[ebp], 0
	je	SHORT $L71588
	mov	ecx, DWORD PTR _pvf$[ebp]
	cmp	DWORD PTR [ecx+304], 0
	je	SHORT $L71588
	push	OFFSET FLAT:$SG71028
	mov	edx, DWORD PTR _pvf$[ebp]
	mov	eax, DWORD PTR [edx+304]
	push	eax
	call	_strcmp
	add	esp, 8
	test	eax, eax
	jne	SHORT $L71588
	mov	DWORD PTR -1136+[ebp], 1
	jmp	SHORT $L71589
$L71588:
	mov	DWORD PTR -1136+[ebp], 0
$L71589:
	mov	ecx, DWORD PTR -1136+[ebp]
	mov	DWORD PTR _b_relation$[ebp], ecx

; 879  : 
; 880  : 	if(!pvf || !pv) RETURN_OK;

	cmp	DWORD PTR _pvf$[ebp], 0
	je	SHORT $L71030
	cmp	DWORD PTR _pv$[ebp], 0
	jne	SHORT $L71029
$L71030:
	jmp	$eva_noerr$71031
$L71029:

; 881  : 
; 882  : 	/* Read all field labels if required */
; 883  : 	if(pvf->b_shownomatch && b_first)

	mov	edx, DWORD PTR _pvf$[ebp]
	cmp	DWORD PTR [edx+516], 0
	je	$L71032
	cmp	DWORD PTR _b_first$[ebp], 0
	je	SHORT $L71032

; 885  : 		snprintf(add_sz_str(printbuf),
; 886  : 			"-- pivottable_build_labels - Read all field labels\n"
; 887  : 			"SELECT DISTINCT Val FROM %s", pvf->datatable);

	mov	eax, DWORD PTR _pvf$[ebp]
	add	eax, 208				; 000000d0H
	push	eax
	push	OFFSET FLAT:$SG71033
	push	1023					; 000003ffH
	lea	ecx, DWORD PTR _printbuf$[ebp]
	push	ecx
	call	__snprintf
	add	esp, 16					; 00000010H

; 888  : 		if(sql_exec_query(cntxt, printbuf) ||
; 889  : 			sql_get_table(cntxt, &pvf->labels, 0)) STACK_ERROR;

	lea	edx, DWORD PTR _printbuf$[ebp]
	push	edx
	mov	eax, DWORD PTR _cntxt$[ebp]
	push	eax
	call	_sql_exec_query
	add	esp, 8
	test	eax, eax
	jne	SHORT $L71035
	push	0
	mov	ecx, DWORD PTR _pvf$[ebp]
	add	ecx, 24					; 00000018H
	push	ecx
	mov	edx, DWORD PTR _cntxt$[ebp]
	push	edx
	call	_sql_get_table
	add	esp, 12					; 0000000cH
	test	eax, eax
	je	SHORT $L71034
$L71035:
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 889		; 00000379H
	jmp	$eva_err$71036
$L71034:

; 890  : 		dyntab_group(&pvf->labels, "DISTINCT");

	push	OFFSET FLAT:$SG71037
	mov	ecx, DWORD PTR _pvf$[ebp]
	add	ecx, 24					; 00000018H
	push	ecx
	call	_dyntab_group
	add	esp, 8
$L71032:

; 892  : 
; 893  : 	/* Build SELECT clause for field labels & counts */
; 894  : 	dynbuf_print5(&sql,
; 895  : 		"-- pivottable_build_labels - Read field labels & counts\n"
; 896  : 		"SELECT %s.Val,%s,COUNT(DISTINCT %s.IdObj),MAX(%s.IdObj)\nFROM %s\n",
; 897  : 		pvf->datatable, pv->datamember, pv->basetable, pv->basetable, pv->basetable);

	push	0
	push	0
	mov	edx, DWORD PTR _pv$[ebp]
	mov	eax, DWORD PTR [edx+192]
	push	eax
	mov	ecx, DWORD PTR _pv$[ebp]
	mov	edx, DWORD PTR [ecx+192]
	push	edx
	mov	eax, DWORD PTR _pv$[ebp]
	mov	ecx, DWORD PTR [eax+192]
	push	ecx
	mov	edx, DWORD PTR _pv$[ebp]
	add	edx, 94140				; 00016fbcH
	push	edx
	mov	eax, DWORD PTR _pvf$[ebp]
	add	eax, 208				; 000000d0H
	push	eax
	push	OFFSET FLAT:$SG71039
	push	1023					; 000003ffH
	lea	ecx, DWORD PTR _printbuf$[ebp]
	push	ecx
	call	__snprintf
	add	esp, 32					; 00000020H
	push	eax
	lea	edx, DWORD PTR _printbuf$[ebp]
	push	edx
	lea	eax, DWORD PTR _sql$[ebp]
	push	eax
	call	_dynbuf_add
	add	esp, 20					; 00000014H

; 898  : 	DYNBUF_ADD_BUF(&sql, pv->join, NO_CONV);

	mov	ecx, DWORD PTR _pv$[ebp]
	cmp	DWORD PTR [ecx+94208], 0
	je	SHORT $L71041
	push	0
	push	0
	mov	edx, DWORD PTR _pv$[ebp]
	mov	eax, DWORD PTR [edx+94208]
	mov	ecx, DWORD PTR [eax+4]
	push	ecx
	mov	edx, DWORD PTR _pv$[ebp]
	mov	eax, DWORD PTR [edx+94208]
	add	eax, 8
	push	eax
	lea	ecx, DWORD PTR _sql$[ebp]
	push	ecx
	call	_dynbuf_add
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L71041
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29872], OFFSET FLAT:$SG71043
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 898		; 00000382H
	jmp	$eva_err$71036
$L71041:

; 899  : 	if(pv->where) DYNBUF_ADD3_BUF(&sql, "WHERE ", pv->where, NO_CONV, "\n");

	mov	ecx, DWORD PTR _pv$[ebp]
	cmp	DWORD PTR [ecx+94212], 0
	je	$L71047
	mov	edx, DWORD PTR _pv$[ebp]
	cmp	DWORD PTR [edx+94212], 0
	je	SHORT $L71590
	mov	eax, DWORD PTR _pv$[ebp]
	mov	ecx, DWORD PTR [eax+94212]
	mov	edx, DWORD PTR [ecx+4]
	mov	DWORD PTR -1140+[ebp], edx
	jmp	SHORT $L71591
$L71590:
	mov	DWORD PTR -1140+[ebp], 0
$L71591:
	mov	eax, DWORD PTR _pv$[ebp]
	cmp	DWORD PTR [eax+94212], 0
	je	SHORT $L71592
	mov	ecx, DWORD PTR _pv$[ebp]
	mov	edx, DWORD PTR [ecx+94212]
	add	edx, 8
	mov	DWORD PTR -1144+[ebp], edx
	jmp	SHORT $L71593
$L71592:
	mov	DWORD PTR -1144+[ebp], 0
$L71593:
	push	1
	push	OFFSET FLAT:$SG71048
	push	0
	push	0
	mov	eax, DWORD PTR -1140+[ebp]
	push	eax
	mov	ecx, DWORD PTR -1144+[ebp]
	push	ecx
	push	6
	push	OFFSET FLAT:$SG71049
	lea	edx, DWORD PTR _sql$[ebp]
	push	edx
	call	_dynbuf_add3
	add	esp, 36					; 00000024H
	test	eax, eax
	je	SHORT $L71047
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29872], OFFSET FLAT:$SG71051
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 899		; 00000383H
	jmp	$eva_err$71036
$L71047:

; 900  : 	dynbuf_print(&sql, "GROUP BY %s.Val", pvf->datatable);

	push	0
	push	0
	mov	edx, DWORD PTR _pvf$[ebp]
	add	edx, 208				; 000000d0H
	push	edx
	push	OFFSET FLAT:$SG71053
	push	1023					; 000003ffH
	lea	eax, DWORD PTR _printbuf$[ebp]
	push	eax
	call	__snprintf
	add	esp, 16					; 00000010H
	push	eax
	lea	ecx, DWORD PTR _printbuf$[ebp]
	push	ecx
	lea	edx, DWORD PTR _sql$[ebp]
	push	edx
	call	_dynbuf_add
	add	esp, 20					; 00000014H

; 901  : 
; 902  : 	/* Handle existing labels - clear old totals */
; 903  : 	for(i = 0; i < pvf->labels.nbrows;i++) DYNTAB_SET_CELLP(&pvf->labels, i, 1, NULL);

	mov	DWORD PTR _i$[ebp], 0
	jmp	SHORT $L71054
$L71055:
	mov	eax, DWORD PTR _i$[ebp]
	add	eax, 1
	mov	DWORD PTR _i$[ebp], eax
$L71054:
	mov	ecx, DWORD PTR _pvf$[ebp]
	mov	edx, DWORD PTR _i$[ebp]
	cmp	edx, DWORD PTR [ecx+24]
	jae	SHORT $L71056
	push	0
	push	0
	push	1
	mov	eax, DWORD PTR _i$[ebp]
	push	eax
	mov	ecx, DWORD PTR _pvf$[ebp]
	add	ecx, 24					; 00000018H
	push	ecx
	call	_dyntab_copy
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L71058
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29872], OFFSET FLAT:$SG71060
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 903		; 00000387H
	jmp	$eva_err$71036
$L71058:
	jmp	SHORT $L71055
$L71056:

; 904  : 
; 905  : 	/* Exec query & get field labels */
; 906  : 	if(sql_exec_query(cntxt, sql->data) ||
; 907  : 		sql_get_table(cntxt, pvf->labels.nbrows ? &labels : &pvf->labels, 2)) STACK_ERROR;

	mov	ecx, DWORD PTR _sql$[ebp]
	add	ecx, 8
	push	ecx
	mov	edx, DWORD PTR _cntxt$[ebp]
	push	edx
	call	_sql_exec_query
	add	esp, 8
	test	eax, eax
	jne	SHORT $L71062
	mov	eax, DWORD PTR _pvf$[ebp]
	cmp	DWORD PTR [eax+24], 0
	je	SHORT $L71594
	lea	ecx, DWORD PTR _labels$[ebp]
	mov	DWORD PTR -1148+[ebp], ecx
	jmp	SHORT $L71595
$L71594:
	mov	edx, DWORD PTR _pvf$[ebp]
	add	edx, 24					; 00000018H
	mov	DWORD PTR -1148+[ebp], edx
$L71595:
	push	2
	mov	eax, DWORD PTR -1148+[ebp]
	push	eax
	mov	ecx, DWORD PTR _cntxt$[ebp]
	push	ecx
	call	_sql_get_table
	add	esp, 12					; 0000000cH
	test	eax, eax
	je	SHORT $L71061
$L71062:
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 907		; 0000038bH
	jmp	$eva_err$71036
$L71061:

; 908  : 
; 909  : 	/* Handle existing labels - transfer new totals */
; 910  : 	for(i = 0; i < labels.nbrows;i++)

	mov	DWORD PTR _i$[ebp], 0
	jmp	SHORT $L71063
$L71064:
	mov	eax, DWORD PTR _i$[ebp]
	add	eax, 1
	mov	DWORD PTR _i$[ebp], eax
$L71063:
	mov	ecx, DWORD PTR _i$[ebp]
	cmp	ecx, DWORD PTR _labels$[ebp]
	jae	$L71065

; 912  : 		/* Search corresponding label in existing labels */
; 913  : 		c1 = dyntab_cell(&labels, i, 0);

	push	0
	mov	edx, DWORD PTR _i$[ebp]
	push	edx
	lea	eax, DWORD PTR _labels$[ebp]
	push	eax
	call	_dyntab_cell
	add	esp, 12					; 0000000cH
	mov	DWORD PTR _c1$[ebp], eax

; 914  : 		if(b_relation)

	cmp	DWORD PTR _b_relation$[ebp], 0
	je	SHORT $L71066

; 916  : 			id1 = strtoul(c1->txt, &end, 10);

	push	10					; 0000000aH
	lea	ecx, DWORD PTR _end$[ebp]
	push	ecx
	mov	edx, DWORD PTR _c1$[ebp]
	mov	eax, DWORD PTR [edx]
	push	eax
	call	_strtoul
	add	esp, 12					; 0000000cH
	mov	DWORD PTR _id1$[ebp], eax

; 917  : 			c1->b_relation = (char)(*end == 0);

	mov	ecx, DWORD PTR _end$[ebp]
	movsx	edx, BYTE PTR [ecx]
	neg	edx
	sbb	edx, edx
	inc	edx
	mov	eax, DWORD PTR _c1$[ebp]
	mov	BYTE PTR [eax+12], dl
$L71066:

; 919  : 		for(j= 0; j < pvf->labels.nbrows; j++)

	mov	DWORD PTR _j$[ebp], 0
	jmp	SHORT $L71068
$L71069:
	mov	ecx, DWORD PTR _j$[ebp]
	add	ecx, 1
	mov	DWORD PTR _j$[ebp], ecx
$L71068:
	mov	edx, DWORD PTR _pvf$[ebp]
	mov	eax, DWORD PTR _j$[ebp]
	cmp	eax, DWORD PTR [edx+24]
	jae	$L71070

; 921  : 			if(b_relation && c1->b_relation)

	cmp	DWORD PTR _b_relation$[ebp], 0
	je	$L71073
	mov	ecx, DWORD PTR _c1$[ebp]
	movsx	edx, BYTE PTR [ecx+12]
	test	edx, edx
	je	$L71073

; 923  : 				c = dyntab_cell(&pvf->labels, j, 0);

	push	0
	mov	eax, DWORD PTR _j$[ebp]
	push	eax
	mov	ecx, DWORD PTR _pvf$[ebp]
	add	ecx, 24					; 00000018H
	push	ecx
	call	_dyntab_cell
	add	esp, 12					; 0000000cH
	mov	DWORD PTR _c$[ebp], eax

; 924  : 				id = c->IdValObj ? c->IdValObj : c->IdObj ? c->IdObj : strtoul(c->txt, NULL, 10);

	mov	edx, DWORD PTR _c$[ebp]
	cmp	DWORD PTR [edx+24], 0
	je	SHORT $L71598
	mov	eax, DWORD PTR _c$[ebp]
	mov	ecx, DWORD PTR [eax+24]
	mov	DWORD PTR -1152+[ebp], ecx
	jmp	SHORT $L71599
$L71598:
	mov	edx, DWORD PTR _c$[ebp]
	cmp	DWORD PTR [edx+20], 0
	je	SHORT $L71596
	mov	eax, DWORD PTR _c$[ebp]
	mov	ecx, DWORD PTR [eax+20]
	mov	DWORD PTR -1156+[ebp], ecx
	jmp	SHORT $L71597
$L71596:
	push	10					; 0000000aH
	push	0
	mov	edx, DWORD PTR _c$[ebp]
	mov	eax, DWORD PTR [edx]
	push	eax
	call	_strtoul
	add	esp, 12					; 0000000cH
	mov	DWORD PTR -1156+[ebp], eax
$L71597:
	mov	ecx, DWORD PTR -1156+[ebp]
	mov	DWORD PTR -1152+[ebp], ecx
$L71599:
	mov	edx, DWORD PTR -1152+[ebp]
	mov	DWORD PTR _id$[ebp], edx

; 925  : 				if(id == id1) break;

	mov	eax, DWORD PTR _id$[ebp]
	cmp	eax, DWORD PTR _id1$[ebp]
	jne	SHORT $L71073
	jmp	SHORT $L71070
$L71073:

; 927  : 			if(!dyntab_cmp(&labels, i, 0, &pvf->labels, j, 0)) break;

	push	0
	mov	ecx, DWORD PTR _j$[ebp]
	push	ecx
	mov	edx, DWORD PTR _pvf$[ebp]
	add	edx, 24					; 00000018H
	push	edx
	push	0
	mov	eax, DWORD PTR _i$[ebp]
	push	eax
	lea	ecx, DWORD PTR _labels$[ebp]
	push	ecx
	call	_dyntab_cmp
	add	esp, 24					; 00000018H
	test	eax, eax
	jne	SHORT $L71074
	jmp	SHORT $L71070
$L71074:

; 928  : 		}

	jmp	$L71069
$L71070:

; 929  : 		if(j == pvf->labels.nbrows)

	mov	edx, DWORD PTR _pvf$[ebp]
	mov	eax, DWORD PTR _j$[ebp]
	cmp	eax, DWORD PTR [edx+24]
	jne	SHORT $L71076

; 931  : 			/* Add new label if not found */
; 932  : 			DYNTAB_ADD_CELL(&pvf->labels, j, 0,	&labels, i, 0);

	push	1
	push	0
	mov	ecx, DWORD PTR _i$[ebp]
	push	ecx
	lea	edx, DWORD PTR _labels$[ebp]
	push	edx
	call	_dyntab_cell
	add	esp, 12					; 0000000cH
	push	eax
	push	0
	mov	eax, DWORD PTR _j$[ebp]
	push	eax
	mov	ecx, DWORD PTR _pvf$[ebp]
	add	ecx, 24					; 00000018H
	push	ecx
	call	_dyntab_copy
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L71076
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29872], OFFSET FLAT:$SG71078
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 932		; 000003a4H
	jmp	$eva_err$71036
$L71076:

; 934  : 
; 935  : 		/* Transfer counts to labels */
; 936  : 		for(k = 1; k < labels.nbcols; k++) DYNTAB_ADD_CELL(&pvf->labels, j, k, &labels, i, k);

	mov	DWORD PTR _k$[ebp], 1
	jmp	SHORT $L71079
$L71080:
	mov	ecx, DWORD PTR _k$[ebp]
	add	ecx, 1
	mov	DWORD PTR _k$[ebp], ecx
$L71079:
	mov	edx, DWORD PTR _k$[ebp]
	cmp	edx, DWORD PTR _labels$[ebp+8]
	jae	SHORT $L71081
	push	1
	mov	eax, DWORD PTR _k$[ebp]
	push	eax
	mov	ecx, DWORD PTR _i$[ebp]
	push	ecx
	lea	edx, DWORD PTR _labels$[ebp]
	push	edx
	call	_dyntab_cell
	add	esp, 12					; 0000000cH
	push	eax
	mov	eax, DWORD PTR _k$[ebp]
	push	eax
	mov	ecx, DWORD PTR _j$[ebp]
	push	ecx
	mov	edx, DWORD PTR _pvf$[ebp]
	add	edx, 24					; 00000018H
	push	edx
	call	_dyntab_copy
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L71082
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29872], OFFSET FLAT:$SG71084
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 936		; 000003a8H
	jmp	$eva_err$71036
$L71082:
	jmp	SHORT $L71080
$L71081:

; 937  : 		pvf->labels.nbcols = labels.nbcols;

	mov	edx, DWORD PTR _pvf$[ebp]
	mov	eax, DWORD PTR _labels$[ebp+8]
	mov	DWORD PTR [edx+32], eax

; 938  : 	}

	jmp	$L71064
$L71065:

; 939  : 
; 940  : 	/* Handle relation format */
; 941  : 	if(b_relation)

	cmp	DWORD PTR _b_relation$[ebp], 0
	je	$L71088

; 942  : 		for(i = 0; i < pvf->labels.nbrows;i++)

	mov	DWORD PTR _i$[ebp], 0
	jmp	SHORT $L71086
$L71087:
	mov	ecx, DWORD PTR _i$[ebp]
	add	ecx, 1
	mov	DWORD PTR _i$[ebp], ecx
$L71086:
	mov	edx, DWORD PTR _pvf$[ebp]
	mov	eax, DWORD PTR _i$[ebp]
	cmp	eax, DWORD PTR [edx+24]
	jae	$L71088

; 944  : 			DynTableCell *c = dyntab_cell(&pvf->labels, i, 0);

	push	0
	mov	ecx, DWORD PTR _i$[ebp]
	push	ecx
	mov	edx, DWORD PTR _pvf$[ebp]
	add	edx, 24					; 00000018H
	push	edx
	call	_dyntab_cell
	add	esp, 12					; 0000000cH
	mov	DWORD PTR _c$71089[ebp], eax

; 945  : 			char *s = "";

	mov	DWORD PTR _s$71090[ebp], OFFSET FLAT:$SG71091

; 946  : 			unsigned long id_obj = c->txt ? strtoul(c->txt, &s, 10) : 0;

	mov	eax, DWORD PTR _c$71089[ebp]
	cmp	DWORD PTR [eax], 0
	je	SHORT $L71600
	push	10					; 0000000aH
	lea	ecx, DWORD PTR _s$71090[ebp]
	push	ecx
	mov	edx, DWORD PTR _c$71089[ebp]
	mov	eax, DWORD PTR [edx]
	push	eax
	call	_strtoul
	add	esp, 12					; 0000000cH
	mov	DWORD PTR -1160+[ebp], eax
	jmp	SHORT $L71601
$L71600:
	mov	DWORD PTR -1160+[ebp], 0
$L71601:
	mov	ecx, DWORD PTR -1160+[ebp]
	mov	DWORD PTR _id_obj$71092[ebp], ecx

; 947  : 			if(c->col || !id_obj || *s) continue;

	mov	edx, DWORD PTR _c$71089[ebp]
	cmp	DWORD PTR [edx+56], 0
	jne	SHORT $L71094
	cmp	DWORD PTR _id_obj$71092[ebp], 0
	je	SHORT $L71094
	mov	eax, DWORD PTR _s$71090[ebp]
	movsx	ecx, BYTE PTR [eax]
	test	ecx, ecx
	je	SHORT $L71093
$L71094:
	jmp	$L71087
$L71093:

; 948  : 			c->IdObj = id_obj;

	mov	edx, DWORD PTR _c$71089[ebp]
	mov	eax, DWORD PTR _id_obj$71092[ebp]
	mov	DWORD PTR [edx+20], eax

; 949  : 			c->col = 1;

	mov	ecx, DWORD PTR _c$71089[ebp]
	mov	DWORD PTR [ecx+56], 1

; 950  : 			if(qry_obj_field(cntxt, &objdata, id_obj, NULL)) STACK_ERROR;

	push	0
	mov	edx, DWORD PTR _id_obj$71092[ebp]
	push	edx
	lea	eax, DWORD PTR _objdata$[ebp]
	push	eax
	mov	ecx, DWORD PTR _cntxt$[ebp]
	push	ecx
	call	_qry_obj_field
	add	esp, 16					; 00000010H
	test	eax, eax
	je	SHORT $L71096
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 950		; 000003b6H
	jmp	$eva_err$71036
$L71096:

; 951  : 			if(qry_obj_label(cntxt, NULL, NULL, &sql, NULL, NULL, NULL, NULL, NULL, 0, &objdata, 0)) STACK_ERROR;

	push	0
	lea	eax, DWORD PTR _objdata$[ebp]
	push	eax
	push	0
	push	0
	push	0
	push	0
	push	0
	push	0
	lea	ecx, DWORD PTR _sql$[ebp]
	push	ecx
	push	0
	push	0
	mov	edx, DWORD PTR _cntxt$[ebp]
	push	edx
	call	_qry_obj_label
	add	esp, 48					; 00000030H
	test	eax, eax
	je	SHORT $L71104
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 951		; 000003b7H
	jmp	$eva_err$71036
$L71104:

; 952  : 			DYNTAB_ADD_BUF(&pvf->labels, i, 0, sql);

	cmp	DWORD PTR _sql$[ebp], 0
	je	SHORT $L71105
	mov	ecx, DWORD PTR _sql$[ebp]
	cmp	DWORD PTR [ecx+4], 0
	je	SHORT $L71105
	push	0
	push	0
	mov	edx, DWORD PTR _sql$[ebp]
	mov	eax, DWORD PTR [edx+4]
	push	eax
	mov	ecx, DWORD PTR _sql$[ebp]
	add	ecx, 8
	push	ecx
	push	0
	mov	edx, DWORD PTR _i$[ebp]
	push	edx
	mov	eax, DWORD PTR _pvf$[ebp]
	add	eax, 24					; 00000018H
	push	eax
	call	_dyntab_add
	add	esp, 28					; 0000001cH
	test	eax, eax
	je	SHORT $L71107
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29872], OFFSET FLAT:$SG71109
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 952		; 000003b8H
	jmp	$eva_err$71036
$L71107:
	jmp	SHORT $L71113
$L71105:
	push	0
	push	0
	push	0
	push	0
	push	0
	mov	eax, DWORD PTR _i$[ebp]
	push	eax
	mov	ecx, DWORD PTR _pvf$[ebp]
	add	ecx, 24					; 00000018H
	push	ecx
	call	_dyntab_add
	add	esp, 28					; 0000001cH
	test	eax, eax
	je	SHORT $L71113
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29872], OFFSET FLAT:$SG71115
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 952		; 000003b8H
	jmp	$eva_err$71036
$L71113:

; 953  : 		}

	jmp	$L71087
$L71088:

; 954  : 
; 955  : 	/* Sort labels on first field calculation */
; 956  : 	if(!pvf->sortmode) pvf->sortmode = "";

	mov	ecx, DWORD PTR _pvf$[ebp]
	cmp	DWORD PTR [ecx+484], 0
	jne	SHORT $L71116
	mov	edx, DWORD PTR _pvf$[ebp]
	mov	DWORD PTR [edx+484], OFFSET FLAT:$SG71117
$L71116:

; 957  : 	if(b_first && strcmp(pvf->sortmode, "_EVA_NONE"))

	cmp	DWORD PTR _b_first$[ebp], 0
	je	$L71122
	push	OFFSET FLAT:$SG71119
	mov	eax, DWORD PTR _pvf$[ebp]
	mov	ecx, DWORD PTR [eax+484]
	push	ecx
	call	_strcmp
	add	esp, 8
	test	eax, eax
	je	$L71122

; 959  : 		/* Sort with given mode */
; 960  : 		dyntab_sort(&pvf->labels,
; 961  : 			!strcmp(pvf->sortmode, "_EVA_NUMBER") ?
; 962  : 				pvf->b_sortdesc ? qsort_col0idesc : qsort_col0i :
; 963  : 			!strcmp(pvf->sortmode, "_EVA_TOTAL") ?
; 964  : 				pvf->b_sortdesc ? qsort_col1fdesc : qsort_col1f :
; 965  : 				pvf->b_sortdesc ? qsort_col0desc : qsort_col0);

	push	OFFSET FLAT:$SG71120
	mov	edx, DWORD PTR _pvf$[ebp]
	mov	eax, DWORD PTR [edx+484]
	push	eax
	call	_strcmp
	add	esp, 8
	test	eax, eax
	jne	SHORT $L71610
	mov	ecx, DWORD PTR _pvf$[ebp]
	cmp	DWORD PTR [ecx+488], 0
	je	SHORT $L71602
	mov	DWORD PTR -1164+[ebp], OFFSET FLAT:_qsort_col0idesc
	jmp	SHORT $L71603
$L71602:
	mov	DWORD PTR -1164+[ebp], OFFSET FLAT:_qsort_col0i
$L71603:
	mov	edx, DWORD PTR -1164+[ebp]
	mov	DWORD PTR -1168+[ebp], edx
	jmp	$L71611
$L71610:
	push	OFFSET FLAT:$SG71121
	mov	eax, DWORD PTR _pvf$[ebp]
	mov	ecx, DWORD PTR [eax+484]
	push	ecx
	call	_strcmp
	add	esp, 8
	test	eax, eax
	jne	SHORT $L71608
	mov	edx, DWORD PTR _pvf$[ebp]
	cmp	DWORD PTR [edx+488], 0
	je	SHORT $L71604
	mov	DWORD PTR -1172+[ebp], OFFSET FLAT:_qsort_col1fdesc
	jmp	SHORT $L71605
$L71604:
	mov	DWORD PTR -1172+[ebp], OFFSET FLAT:_qsort_col1f
$L71605:
	mov	eax, DWORD PTR -1172+[ebp]
	mov	DWORD PTR -1176+[ebp], eax
	jmp	SHORT $L71609
$L71608:
	mov	ecx, DWORD PTR _pvf$[ebp]
	cmp	DWORD PTR [ecx+488], 0
	je	SHORT $L71606
	mov	DWORD PTR -1180+[ebp], OFFSET FLAT:_qsort_col0desc
	jmp	SHORT $L71607
$L71606:
	mov	DWORD PTR -1180+[ebp], OFFSET FLAT:_qsort_col0
$L71607:
	mov	edx, DWORD PTR -1180+[ebp]
	mov	DWORD PTR -1176+[ebp], edx
$L71609:
	mov	eax, DWORD PTR -1176+[ebp]
	mov	DWORD PTR -1168+[ebp], eax
$L71611:
	mov	ecx, DWORD PTR -1168+[ebp]
	push	ecx
	mov	edx, DWORD PTR _pvf$[ebp]
	add	edx, 24					; 00000018H
	push	edx
	call	_dyntab_sort
	add	esp, 8

; 966  : 
; 967  : 		/* Handle labels sort position */
; 968  : 		if(pvf->sr_pos.nbrows)

	mov	eax, DWORD PTR _pvf$[ebp]
	cmp	DWORD PTR [eax+428], 0
	je	$L71122

; 970  : 			for(i = 0; i < pvf->labels.nbrows;i++)

	mov	DWORD PTR _i$[ebp], 0
	jmp	SHORT $L71123
$L71124:
	mov	ecx, DWORD PTR _i$[ebp]
	add	ecx, 1
	mov	DWORD PTR _i$[ebp], ecx
$L71123:
	mov	edx, DWORD PTR _pvf$[ebp]
	mov	eax, DWORD PTR _i$[ebp]
	cmp	eax, DWORD PTR [edx+24]
	jae	$L71125

; 972  : 				DynTableCell *c = dyntab_cell(&pvf->labels, i, 0), *p;

	push	0
	mov	ecx, DWORD PTR _i$[ebp]
	push	ecx
	mov	edx, DWORD PTR _pvf$[ebp]
	add	edx, 24					; 00000018H
	push	edx
	call	_dyntab_cell
	add	esp, 12					; 0000000cH
	mov	DWORD PTR _c$71126[ebp], eax

; 973  : 				for(j = 0; j < pvf->sr_pos.nbrows && dyntab_cmp(&pvf->sr_dest, j, 0, &pvf->labels, i, 0); j++);

	mov	DWORD PTR _j$[ebp], 0
	jmp	SHORT $L71128
$L71129:
	mov	eax, DWORD PTR _j$[ebp]
	add	eax, 1
	mov	DWORD PTR _j$[ebp], eax
$L71128:
	mov	ecx, DWORD PTR _pvf$[ebp]
	mov	edx, DWORD PTR _j$[ebp]
	cmp	edx, DWORD PTR [ecx+428]
	jae	SHORT $L71130
	push	0
	mov	eax, DWORD PTR _i$[ebp]
	push	eax
	mov	ecx, DWORD PTR _pvf$[ebp]
	add	ecx, 24					; 00000018H
	push	ecx
	push	0
	mov	edx, DWORD PTR _j$[ebp]
	push	edx
	mov	eax, DWORD PTR _pvf$[ebp]
	add	eax, 408				; 00000198H
	push	eax
	call	_dyntab_cmp
	add	esp, 24					; 00000018H
	test	eax, eax
	je	SHORT $L71130
	jmp	SHORT $L71129
$L71130:

; 974  : 				p = dyntab_cell(&pvf->sr_pos, j, 0);

	push	0
	mov	ecx, DWORD PTR _j$[ebp]
	push	ecx
	mov	edx, DWORD PTR _pvf$[ebp]
	add	edx, 428				; 000001acH
	push	edx
	call	_dyntab_cell
	add	esp, 12					; 0000000cH
	mov	DWORD PTR _p$71127[ebp], eax

; 975  : 				c->col = (p && p->len && p->txt) ? atoi(p->txt) : i + 10000;

	cmp	DWORD PTR _p$71127[ebp], 0
	je	SHORT $L71612
	mov	eax, DWORD PTR _p$71127[ebp]
	cmp	DWORD PTR [eax+4], 0
	je	SHORT $L71612
	mov	ecx, DWORD PTR _p$71127[ebp]
	cmp	DWORD PTR [ecx], 0
	je	SHORT $L71612
	mov	edx, DWORD PTR _p$71127[ebp]
	mov	eax, DWORD PTR [edx]
	push	eax
	call	_atoi
	add	esp, 4
	mov	DWORD PTR -1184+[ebp], eax
	jmp	SHORT $L71613
$L71612:
	mov	ecx, DWORD PTR _i$[ebp]
	add	ecx, 10000				; 00002710H
	mov	DWORD PTR -1184+[ebp], ecx
$L71613:
	mov	edx, DWORD PTR _c$71126[ebp]
	mov	eax, DWORD PTR -1184+[ebp]
	mov	DWORD PTR [edx+56], eax

; 976  : 			}

	jmp	$L71124
$L71125:

; 977  : 			dyntab_sort(&pvf->labels, qsort_val_col);

	push	OFFSET FLAT:_qsort_val_col
	mov	ecx, DWORD PTR _pvf$[ebp]
	add	ecx, 24					; 00000018H
	push	ecx
	call	_dyntab_sort
	add	esp, 8
$L71122:
$eva_noerr$71031:

; 980  : 
; 981  : 	RETURN_OK_CLEANUP;

	push	0
	push	OFFSET FLAT:$SG71131
	push	OFFSET FLAT:$SG71132
	mov	edx, DWORD PTR _cntxt$[ebp]
	push	edx
	call	_err_clear
	add	esp, 16					; 00000010H
$eva_err$71036:
	mov	eax, DWORD PTR _cntxt$[ebp]
	cmp	DWORD PTR [eax+29872], 0
	je	SHORT $L71133
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	edx, DWORD PTR [ecx+29900]
	push	edx
	push	OFFSET FLAT:$SG71134
	push	OFFSET FLAT:$SG71135
	mov	eax, DWORD PTR _cntxt$[ebp]
	push	eax
	call	_err_add_context
	add	esp, 16					; 00000010H
$L71133:
	lea	ecx, DWORD PTR _labels$[ebp]
	push	ecx
	call	_dyntab_free
	add	esp, 4
	lea	edx, DWORD PTR _objdata$[ebp]
	push	edx
	call	_dyntab_free
	add	esp, 4
	mov	eax, DWORD PTR _sql$[ebp]
	push	eax
	call	_mem_free
	add	esp, 4
	mov	DWORD PTR _sql$[ebp], 0
	mov	ecx, DWORD PTR _cntxt$[ebp]
	xor	eax, eax
	cmp	DWORD PTR [ecx+29872], 0
	setne	al

; 982  : }

	mov	esp, ebp
	pop	ebp
	ret	0
_pivottable_build_labels ENDP
_TEXT	ENDS
PUBLIC	_pivottablefield_add_total
PUBLIC	__real@8@00000000000000000000
PUBLIC	__real@8@4005c800000000000000
EXTRN	_atof:NEAR
EXTRN	_dyntab_set_txt:NEAR
EXTRN	__fltused:NEAR
_BSS	SEGMENT
	ALIGN	4

$SG71151 DB	01H DUP (?)
_BSS	ENDS
_DATA	SEGMENT
$SG71160 DB	'_EVA_NONE', 00H
	ORG $+2
$SG71161 DB	'_EVA_SINGLE', 00H
$SG71168 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG71172 DB	'Total', 00H
	ORG $+2
$SG71174 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG71184 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG71187 DB	'%', 00H
	ORG $+2
$SG71189 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG71193 DB	'%1.1lf%%', 00H
	ORG $+3
$SG71196 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG71199 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG71202 DB	'D:\Travail\ABI\EVA\V4.0\CGI\Brunix-2016\pivottable.c', 00H
	ORG $+3
$SG71203 DB	'pivottablefield_add_total', 00H
	ORG $+2
$SG71205 DB	'D:\Travail\ABI\EVA\V4.0\CGI\Brunix-2016\pivottable.c', 00H
	ORG $+3
$SG71206 DB	'pivottablefield_add_total', 00H
_DATA	ENDS
;	COMDAT __real@8@00000000000000000000
; File D:\Travail\ABI\EVA\V4.0\CGI\Brunix-2016\pivottable.c
CONST	SEGMENT
__real@8@00000000000000000000 DQ 00000000000000000r ; 0
CONST	ENDS
;	COMDAT __real@8@4005c800000000000000
CONST	SEGMENT
__real@8@4005c800000000000000 DQ 04059000000000000r ; 100
CONST	ENDS
_TEXT	SEGMENT
_cntxt$ = 8
_pv$ = 12
_pvf$ = 16
_grandtot$ = 20
_data$ = -28
_percent$ = -40
_b_col$ = -8
_b_per$ = -36
_b_tot$ = -4
_i$ = -44
_pos$ = -52
_rowcol$ = -32
_b_done$ = -48
_c$71164 = -56
_c$71180 = -120
_percent$71181 = -128
_pivottablefield_add_total PROC NEAR

; 997  : ){

	push	ebp
	mov	ebp, esp
	sub	esp, 172				; 000000acH
	push	edi

; 998  : 	DynTable data = {0};

	mov	DWORD PTR _data$[ebp], 0
	xor	eax, eax
	mov	DWORD PTR _data$[ebp+4], eax
	mov	DWORD PTR _data$[ebp+8], eax
	mov	DWORD PTR _data$[ebp+12], eax
	mov	DWORD PTR _data$[ebp+16], eax

; 999  : 	char *percent = pv->data ? dyntab_val(&pv->data->percent, 0, 0) : "";

	mov	ecx, DWORD PTR _pv$[ebp]
	cmp	DWORD PTR [ecx+208], 0
	je	SHORT $L71615
	push	0
	push	0
	mov	edx, DWORD PTR _pv$[ebp]
	mov	eax, DWORD PTR [edx+208]
	add	eax, 164				; 000000a4H
	push	eax
	call	_dyntab_val
	add	esp, 12					; 0000000cH
	mov	DWORD PTR -132+[ebp], eax
	jmp	SHORT $L71616
$L71615:
	mov	DWORD PTR -132+[ebp], OFFSET FLAT:$SG71151
$L71616:
	mov	ecx, DWORD PTR -132+[ebp]
	mov	DWORD PTR _percent$[ebp], ecx

; 1000 : 	int b_col = pvf == pv->col;

	mov	edx, DWORD PTR _pv$[ebp]
	mov	eax, DWORD PTR _pvf$[ebp]
	xor	ecx, ecx
	cmp	eax, DWORD PTR [edx+204]
	sete	cl
	mov	DWORD PTR _b_col$[ebp], ecx

; 1001 : 	int b_per, b_tot;
; 1002 : 	unsigned long i, pos = 0, rowcol = b_col ? ROWCNT : COLCNT + pos;

	mov	DWORD PTR _pos$[ebp], 0
	cmp	DWORD PTR _b_col$[ebp], 0
	je	SHORT $L71621
	mov	edx, DWORD PTR _pv$[ebp]
	cmp	DWORD PTR [edx+200], 0
	je	SHORT $L71617
	mov	eax, DWORD PTR _pv$[ebp]
	mov	ecx, DWORD PTR [eax+200]
	mov	edx, DWORD PTR [ecx+24]
	mov	DWORD PTR -136+[ebp], edx
	jmp	SHORT $L71618
$L71617:
	mov	DWORD PTR -136+[ebp], 0
$L71618:
	mov	eax, DWORD PTR -136+[ebp]
	mov	DWORD PTR -140+[ebp], eax
	jmp	SHORT $L71622
$L71621:
	mov	ecx, DWORD PTR _pv$[ebp]
	cmp	DWORD PTR [ecx+204], 0
	je	SHORT $L71619
	mov	edx, DWORD PTR _pv$[ebp]
	mov	eax, DWORD PTR [edx+204]
	mov	ecx, DWORD PTR [eax+24]
	mov	DWORD PTR -144+[ebp], ecx
	jmp	SHORT $L71620
$L71619:
	mov	DWORD PTR -144+[ebp], 0
$L71620:
	mov	edx, DWORD PTR -144+[ebp]
	add	edx, DWORD PTR _pos$[ebp]
	mov	DWORD PTR -140+[ebp], edx
$L71622:
	mov	eax, DWORD PTR -140+[ebp]
	mov	DWORD PTR _rowcol$[ebp], eax

; 1003 : 	int b_done = pvf->totals.nbrows > 0;

	mov	ecx, DWORD PTR _pvf$[ebp]
	xor	edx, edx
	cmp	edx, DWORD PTR [ecx+44]
	sbb	eax, eax
	neg	eax
	mov	DWORD PTR _b_done$[ebp], eax

; 1004 : 	if(!*percent) percent = dyntab_val(&pvf->percent, 0, 0);

	mov	ecx, DWORD PTR _percent$[ebp]
	movsx	edx, BYTE PTR [ecx]
	test	edx, edx
	jne	SHORT $L71159
	push	0
	push	0
	mov	eax, DWORD PTR _pvf$[ebp]
	add	eax, 164				; 000000a4H
	push	eax
	call	_dyntab_val
	add	esp, 12					; 0000000cH
	mov	DWORD PTR _percent$[ebp], eax
$L71159:

; 1005 : 	b_per = *percent && strcmp(percent, "_EVA_NONE") && grandtot;

	mov	ecx, DWORD PTR _percent$[ebp]
	movsx	edx, BYTE PTR [ecx]
	test	edx, edx
	je	SHORT $L71623
	push	OFFSET FLAT:$SG71160
	mov	eax, DWORD PTR _percent$[ebp]
	push	eax
	call	_strcmp
	add	esp, 8
	test	eax, eax
	je	SHORT $L71623
	fld	QWORD PTR _grandtot$[ebp]
	fcomp	QWORD PTR __real@8@00000000000000000000
	fnstsw	ax
	test	ah, 64					; 00000040H
	jne	SHORT $L71623
	mov	DWORD PTR -148+[ebp], 1
	jmp	SHORT $L71624
$L71623:
	mov	DWORD PTR -148+[ebp], 0
$L71624:
	mov	ecx, DWORD PTR -148+[ebp]
	mov	DWORD PTR _b_per$[ebp], ecx

; 1006 : 	b_tot = !b_per || strcmp(percent, "_EVA_SINGLE");

	cmp	DWORD PTR _b_per$[ebp], 0
	je	SHORT $L71625
	push	OFFSET FLAT:$SG71161
	mov	edx, DWORD PTR _percent$[ebp]
	push	edx
	call	_strcmp
	add	esp, 8
	test	eax, eax
	jne	SHORT $L71625
	mov	DWORD PTR -152+[ebp], 0
	jmp	SHORT $L71626
$L71625:
	mov	DWORD PTR -152+[ebp], 1
$L71626:
	mov	eax, DWORD PTR -152+[ebp]
	mov	DWORD PTR _b_tot$[ebp], eax

; 1007 : 
; 1008 : 	/* Add total for each label */
; 1009 : 	if(b_tot)

	cmp	DWORD PTR _b_tot$[ebp], 0
	je	$L71162

; 1011 : 		if(!b_done)

	cmp	DWORD PTR _b_done$[ebp], 0
	jne	$L71171

; 1013 : 			DynTableCell *c = dyntab_cell(pv->data ? &pv->data->totlabel : &pvf->totlabel, 0, 0);

	mov	ecx, DWORD PTR _pv$[ebp]
	cmp	DWORD PTR [ecx+208], 0
	je	SHORT $L71627
	mov	edx, DWORD PTR _pv$[ebp]
	mov	eax, DWORD PTR [edx+208]
	add	eax, 144				; 00000090H
	mov	DWORD PTR -156+[ebp], eax
	jmp	SHORT $L71628
$L71627:
	mov	ecx, DWORD PTR _pvf$[ebp]
	add	ecx, 144				; 00000090H
	mov	DWORD PTR -156+[ebp], ecx
$L71628:
	push	0
	push	0
	mov	edx, DWORD PTR -156+[ebp]
	push	edx
	call	_dyntab_cell
	add	esp, 12					; 0000000cH
	mov	DWORD PTR _c$71164[ebp], eax

; 1014 : 			if(c && c->txt)

	cmp	DWORD PTR _c$71164[ebp], 0
	je	SHORT $L71165
	mov	eax, DWORD PTR _c$71164[ebp]
	cmp	DWORD PTR [eax], 0
	je	SHORT $L71165

; 1015 : 				DYNTAB_ADD_CELLP(&pvf->totals, pos, 0, c)

	push	1
	mov	ecx, DWORD PTR _c$71164[ebp]
	push	ecx
	push	0
	mov	edx, DWORD PTR _pos$[ebp]
	push	edx
	mov	eax, DWORD PTR _pvf$[ebp]
	add	eax, 44					; 0000002cH
	push	eax
	call	_dyntab_copy
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L71166
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29872], OFFSET FLAT:$SG71168
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 1015		; 000003f7H
	jmp	$eva_err$71169
$L71166:

; 1016 : 			else

	jmp	SHORT $L71171
$L71165:

; 1017 : 				DYNTAB_ADD_STR(&pvf->totals, pos, 0, "Total");

	push	5
	push	OFFSET FLAT:$SG71172
	push	0
	mov	eax, DWORD PTR _pos$[ebp]
	push	eax
	mov	ecx, DWORD PTR _pvf$[ebp]
	add	ecx, 44					; 0000002cH
	push	ecx
	call	_dyntab_set_txt
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L71171
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29872], OFFSET FLAT:$SG71174
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 1017		; 000003f9H
	jmp	$eva_err$71169
$L71171:

; 1019 : 		for(i = 0; i < pvf->labels.nbrows; i++)

	mov	DWORD PTR _i$[ebp], 0
	jmp	SHORT $L71175
$L71176:
	mov	ecx, DWORD PTR _i$[ebp]
	add	ecx, 1
	mov	DWORD PTR _i$[ebp], ecx
$L71175:
	mov	edx, DWORD PTR _pvf$[ebp]
	mov	eax, DWORD PTR _i$[ebp]
	cmp	eax, DWORD PTR [edx+24]
	jae	SHORT $L71177

; 1020 : 			if(pivottable_set_cellval(cntxt, pv, b_col ? rowcol : i, b_col ? i : rowcol, &pvf->labels, i, 1))

	cmp	DWORD PTR _b_col$[ebp], 0
	je	SHORT $L71629
	mov	ecx, DWORD PTR _i$[ebp]
	mov	DWORD PTR -160+[ebp], ecx
	jmp	SHORT $L71630
$L71629:
	mov	edx, DWORD PTR _rowcol$[ebp]
	mov	DWORD PTR -160+[ebp], edx
$L71630:
	cmp	DWORD PTR _b_col$[ebp], 0
	je	SHORT $L71631
	mov	eax, DWORD PTR _rowcol$[ebp]
	mov	DWORD PTR -164+[ebp], eax
	jmp	SHORT $L71632
$L71631:
	mov	ecx, DWORD PTR _i$[ebp]
	mov	DWORD PTR -164+[ebp], ecx
$L71632:
	push	1
	mov	edx, DWORD PTR _i$[ebp]
	push	edx
	mov	eax, DWORD PTR _pvf$[ebp]
	add	eax, 24					; 00000018H
	push	eax
	mov	ecx, DWORD PTR -160+[ebp]
	push	ecx
	mov	edx, DWORD PTR -164+[ebp]
	push	edx
	mov	eax, DWORD PTR _pv$[ebp]
	push	eax
	mov	ecx, DWORD PTR _cntxt$[ebp]
	push	ecx
	call	_pivottable_set_cellval
	add	esp, 28					; 0000001cH
	test	eax, eax
	je	SHORT $L71178

; 1021 : 				STACK_ERROR;

	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 1021		; 000003fdH
	jmp	$eva_err$71169
$L71178:
	jmp	$L71176
$L71177:

; 1022 : 		pos++;

	mov	eax, DWORD PTR _pos$[ebp]
	add	eax, 1
	mov	DWORD PTR _pos$[ebp], eax

; 1023 : 		rowcol++;

	mov	ecx, DWORD PTR _rowcol$[ebp]
	add	ecx, 1
	mov	DWORD PTR _rowcol$[ebp], ecx
$L71162:

; 1025 : 
; 1026 : 	/* Add percentage for each label */
; 1027 : 	if(b_per)

	cmp	DWORD PTR _b_per$[ebp], 0
	je	$eva_noerr$71201

; 1029 : 		DynTableCell c = {0};

	mov	DWORD PTR _c$71180[ebp], 0
	mov	ecx, 15					; 0000000fH
	xor	eax, eax
	lea	edi, DWORD PTR _c$71180[ebp+4]
	rep stosd

; 1030 : 		char percent[8];
; 1031 : 		c.txt = percent;

	lea	edx, DWORD PTR _percent$71181[ebp]
	mov	DWORD PTR _c$71180[ebp], edx

; 1032 : 		DYNTAB_SET_CELLP(&data, 0, 0, &c);

	push	0
	lea	eax, DWORD PTR _c$71180[ebp]
	push	eax
	push	0
	push	0
	lea	ecx, DWORD PTR _data$[ebp]
	push	ecx
	call	_dyntab_copy
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L71182
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29872], OFFSET FLAT:$SG71184
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 1032		; 00000408H
	jmp	$eva_err$71169
$L71182:

; 1033 : 		if(!b_done) DYNTAB_ADD_STR(&pvf->totals, pos, 0, "%");

	cmp	DWORD PTR _b_done$[ebp], 0
	jne	SHORT $L71186
	push	1
	push	OFFSET FLAT:$SG71187
	push	0
	mov	ecx, DWORD PTR _pos$[ebp]
	push	ecx
	mov	edx, DWORD PTR _pvf$[ebp]
	add	edx, 44					; 0000002cH
	push	edx
	call	_dyntab_set_txt
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L71186
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29872], OFFSET FLAT:$SG71189
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 1033		; 00000409H
	jmp	$eva_err$71169
$L71186:

; 1034 : 		for(i = 0; i < pvf->labels.nbrows; i++)

	mov	DWORD PTR _i$[ebp], 0
	jmp	SHORT $L71190
$L71191:
	mov	edx, DWORD PTR _i$[ebp]
	add	edx, 1
	mov	DWORD PTR _i$[ebp], edx
$L71190:
	mov	eax, DWORD PTR _pvf$[ebp]
	mov	ecx, DWORD PTR _i$[ebp]
	cmp	ecx, DWORD PTR [eax+24]
	jae	$L71192

; 1036 : 			c.len = snprintf(add_sz_str(percent), "%1.1lf%%", 100.0 * atof(dyntab_val(&pvf->labels, i, 1)) / grandtot);

	push	1
	mov	edx, DWORD PTR _i$[ebp]
	push	edx
	mov	eax, DWORD PTR _pvf$[ebp]
	add	eax, 24					; 00000018H
	push	eax
	call	_dyntab_val
	add	esp, 12					; 0000000cH
	push	eax
	call	_atof
	add	esp, 4
	fmul	QWORD PTR __real@8@4005c800000000000000
	fdiv	QWORD PTR _grandtot$[ebp]
	sub	esp, 8
	fstp	QWORD PTR [esp]
	push	OFFSET FLAT:$SG71193
	push	7
	lea	ecx, DWORD PTR _percent$71181[ebp]
	push	ecx
	call	__snprintf
	add	esp, 20					; 00000014H
	mov	DWORD PTR _c$71180[ebp+4], eax

; 1037 : 			DYNTAB_SET_CELL(&data, 1, 0, &pvf->labels, i, 1);

	push	0
	push	1
	mov	edx, DWORD PTR _i$[ebp]
	push	edx
	mov	eax, DWORD PTR _pvf$[ebp]
	add	eax, 24					; 00000018H
	push	eax
	call	_dyntab_cell
	add	esp, 12					; 0000000cH
	push	eax
	push	0
	push	1
	lea	ecx, DWORD PTR _data$[ebp]
	push	ecx
	call	_dyntab_copy
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L71194
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29872], OFFSET FLAT:$SG71196
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 1037		; 0000040dH
	jmp	$eva_err$71169
$L71194:

; 1038 : 			DYNTAB_SET_CELL(&data, 2, 0, &pvf->labels, i, 2);

	push	0
	push	2
	mov	ecx, DWORD PTR _i$[ebp]
	push	ecx
	mov	edx, DWORD PTR _pvf$[ebp]
	add	edx, 24					; 00000018H
	push	edx
	call	_dyntab_cell
	add	esp, 12					; 0000000cH
	push	eax
	push	0
	push	2
	lea	eax, DWORD PTR _data$[ebp]
	push	eax
	call	_dyntab_copy
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L71197
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29872], OFFSET FLAT:$SG71199
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 1038		; 0000040eH
	jmp	$eva_err$71169
$L71197:

; 1039 : 			if(pivottable_set_cellval(cntxt, pv, b_col ? rowcol : i, b_col ? i : rowcol, &data, 0, 0))

	cmp	DWORD PTR _b_col$[ebp], 0
	je	SHORT $L71633
	mov	eax, DWORD PTR _i$[ebp]
	mov	DWORD PTR -168+[ebp], eax
	jmp	SHORT $L71634
$L71633:
	mov	ecx, DWORD PTR _rowcol$[ebp]
	mov	DWORD PTR -168+[ebp], ecx
$L71634:
	cmp	DWORD PTR _b_col$[ebp], 0
	je	SHORT $L71635
	mov	edx, DWORD PTR _rowcol$[ebp]
	mov	DWORD PTR -172+[ebp], edx
	jmp	SHORT $L71636
$L71635:
	mov	eax, DWORD PTR _i$[ebp]
	mov	DWORD PTR -172+[ebp], eax
$L71636:
	push	0
	push	0
	lea	ecx, DWORD PTR _data$[ebp]
	push	ecx
	mov	edx, DWORD PTR -168+[ebp]
	push	edx
	mov	eax, DWORD PTR -172+[ebp]
	push	eax
	mov	ecx, DWORD PTR _pv$[ebp]
	push	ecx
	mov	edx, DWORD PTR _cntxt$[ebp]
	push	edx
	call	_pivottable_set_cellval
	add	esp, 28					; 0000001cH
	test	eax, eax
	je	SHORT $L71200

; 1040 : 				STACK_ERROR;

	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 1040		; 00000410H
	jmp	SHORT $eva_err$71169
$L71200:

; 1041 : 		}

	jmp	$L71191
$L71192:

; 1042 : 		pos++;

	mov	ecx, DWORD PTR _pos$[ebp]
	add	ecx, 1
	mov	DWORD PTR _pos$[ebp], ecx

; 1043 : 		rowcol++;

	mov	edx, DWORD PTR _rowcol$[ebp]
	add	edx, 1
	mov	DWORD PTR _rowcol$[ebp], edx
$eva_noerr$71201:

; 1045 : 
; 1046 : 	RETURN_OK_CLEANUP;

	push	0
	push	OFFSET FLAT:$SG71202
	push	OFFSET FLAT:$SG71203
	mov	eax, DWORD PTR _cntxt$[ebp]
	push	eax
	call	_err_clear
	add	esp, 16					; 00000010H
$eva_err$71169:
	mov	ecx, DWORD PTR _cntxt$[ebp]
	cmp	DWORD PTR [ecx+29872], 0
	je	SHORT $L71204
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	eax, DWORD PTR [edx+29900]
	push	eax
	push	OFFSET FLAT:$SG71205
	push	OFFSET FLAT:$SG71206
	mov	ecx, DWORD PTR _cntxt$[ebp]
	push	ecx
	call	_err_add_context
	add	esp, 16					; 00000010H
$L71204:
	lea	edx, DWORD PTR _data$[ebp]
	push	edx
	call	_dyntab_free
	add	esp, 4
	mov	eax, DWORD PTR _cntxt$[ebp]
	xor	ecx, ecx
	cmp	DWORD PTR [eax+29872], 0
	setne	cl
	mov	eax, ecx

; 1047 : }

	pop	edi
	mov	esp, ebp
	pop	ebp
	ret	0
_pivottablefield_add_total ENDP
_TEXT	ENDS
PUBLIC	_pivottable_calc_single
_BSS	SEGMENT
	ALIGN	4

$SG71273 DB	01H DUP (?)
	ALIGN	4

$SG71278 DB	01H DUP (?)
	ALIGN	4

$SG71284 DB	01H DUP (?)
	ALIGN	4

$SG71310 DB	01H DUP (?)
	ALIGN	4

$SG71349 DB	01H DUP (?)
_BSS	ENDS
_DATA	SEGMENT
	ORG $+2
$SG71244 DB	'SUM', 00H
$SG71245 DB	'AVG', 00H
$SG71246 DB	'MIN', 00H
$SG71247 DB	'MAX', 00H
$SG71248 DB	'COUNT', 00H
	ORG $+2
$SG71251 DB	'NoDataExpression', 00H
	ORG $+3
$SG71252 DB	'%s(%s.Val)', 00H
	ORG $+1
$SG71255 DB	'VALCOUNT', 00H
	ORG $+3
$SG71256 DB	'COUNT(%s.IdObj)', 00H
$SG71259 DB	'VALCOUNT1', 00H
	ORG $+2
$SG71261 DB	'COUNT(DISTINCT %s.Val)', 00H
	ORG $+1
$SG71263 DB	'COUNT(DISTINCT %s.IdObj)', 00H
	ORG $+3
$SG71272 DB	'AND ', 00H
	ORG $+3
$SG71274 DB	'%s (%s.Line=%s.Line OR %s.Line IS NULL OR %s.Line IS NUL'
	DB	'L)', 0aH, 00H
$SG71277 DB	'AND ', 00H
	ORG $+3
$SG71279 DB	'%s (%s.Line=%s.Line OR %s.Line IS NULL OR %s.Line IS NUL'
	DB	'L)', 0aH, 00H
$SG71283 DB	'AND ', 00H
	ORG $+3
$SG71285 DB	'%s (%s.Line=%s.Line OR %s.Line IS NULL OR %s.Line IS NUL'
	DB	'L)', 0aH, 00H
$SG71292 DB	'GROUP BY ', 00H
	ORG $+2
$SG71294 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG71297 DB	'%s.Val', 00H
	ORG $+1
$SG71301 DB	',', 00H
	ORG $+2
$SG71303 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG71306 DB	'%s.Val', 00H
	ORG $+1
$SG71311 DB	'-- pivottable_calc - grand total', 0aH, 'SELECT ', 00H
	ORG $+3
$SG71313 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG71316 DB	'.IdObj) ', 00H
	ORG $+3
$SG71317 DB	',COUNT(DISTINCT ', 00H
	ORG $+3
$SG71319 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG71322 DB	'.IdObj) ', 00H
	ORG $+3
$SG71323 DB	',MAX(', 00H
	ORG $+2
$SG71325 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG71328 DB	0aH, 00H
	ORG $+2
$SG71329 DB	'FROM ', 00H
	ORG $+2
$SG71331 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG71335 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG71340 DB	0aH, 00H
	ORG $+2
$SG71341 DB	'WHERE ', 00H
	ORG $+1
$SG71343 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG71350 DB	'-- pivottable_calc - Build cross values table', 0aH, 'SE'
	DB	'LECT %s%s,COUNT(DISTINCT %s.IdObj),MAX(%s.IdObj)', 0aH, 'FROM'
	DB	' %s', 0aH, 00H
	ORG $+2
$SG71354 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG71359 DB	0aH, 00H
	ORG $+2
$SG71360 DB	'WHERE ', 00H
	ORG $+1
$SG71362 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG71366 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG71372 DB	'_EVA_RELATION', 00H
	ORG $+2
$SG71374 DB	'_EVA_RELATION', 00H
	ORG $+2
$SG71405 DB	'_EVA_SINGLE', 00H
$SG71407 DB	'_EVA_ROW', 00H
	ORG $+3
$SG71409 DB	'_EVA_COL', 00H
	ORG $+3
$SG71428 DB	'%.1lf%%', 00H
$SG71430 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG71431 DB	'D:\Travail\ABI\EVA\V4.0\CGI\Brunix-2016\pivottable.c', 00H
	ORG $+3
$SG71432 DB	'pivottable_calc_single', 00H
	ORG $+1
$SG71434 DB	'D:\Travail\ABI\EVA\V4.0\CGI\Brunix-2016\pivottable.c', 00H
	ORG $+3
$SG71435 DB	'pivottable_calc_single', 00H
_DATA	ENDS
_TEXT	SEGMENT
_cntxt$ = 8
_pv$ = 12
_id_obj$ = -1048
_sql$ = -4
_function$ = -1052
_i$ = -1056
_j$ = -1060
_printbuf$ = -1028
_table$71235 = -1064
_c_col$71369 = -1080
_c_val$71370 = -1076
_b_relrow$71371 = -1068
_b_relcol$71373 = -1072
_idrow$71378 = -1092
_idcol$71380 = -1084
_irow$71382 = -1096
_icol$71383 = -1088
_c$71389 = -1100
_c$71398 = -1104
_grandtot$71403 = -1124
_b_pc_all$71404 = -1112
_b_pc_row$71406 = -1108
_b_pc_col$71408 = -1116
_v$71423 = -1172
_b$71424 = -1164
_p$71425 = -1156
_pivottable_calc_single PROC NEAR

; 1061 : ){

	push	ebp
	mov	ebp, esp
	sub	esp, 1308				; 0000051cH

; 1062 : 	DynTable id_obj = {0};

	mov	DWORD PTR _id_obj$[ebp], 0
	xor	eax, eax
	mov	DWORD PTR _id_obj$[ebp+4], eax
	mov	DWORD PTR _id_obj$[ebp+8], eax
	mov	DWORD PTR _id_obj$[ebp+12], eax
	mov	DWORD PTR _id_obj$[ebp+16], eax

; 1063 : 	DynBuffer *sql = NULL;

	mov	DWORD PTR _sql$[ebp], 0

; 1064 : 	char *function = dyntab_val(pv->data ? &pv->data->function : NULL, 0, 0);

	mov	ecx, DWORD PTR _pv$[ebp]
	cmp	DWORD PTR [ecx+208], 0
	je	SHORT $L71643
	mov	edx, DWORD PTR _pv$[ebp]
	mov	eax, DWORD PTR [edx+208]
	add	eax, 124				; 0000007cH
	mov	DWORD PTR -1176+[ebp], eax
	jmp	SHORT $L71644
$L71643:
	mov	DWORD PTR -1176+[ebp], 0
$L71644:
	push	0
	push	0
	mov	ecx, DWORD PTR -1176+[ebp]
	push	ecx
	call	_dyntab_val
	add	esp, 12					; 0000000cH
	mov	DWORD PTR _function$[ebp], eax

; 1065 : 	unsigned long i, j;
; 1066 : 	char printbuf[1024];
; 1067 : 
; 1068 : 	/* Read data field */
; 1069 : 	if(pv->data)

	mov	edx, DWORD PTR _pv$[ebp]
	cmp	DWORD PTR [edx+208], 0
	je	$L71231

; 1071 : 		pv->data->srctable = *pv->objtable ? pv->objtable : NULL;

	mov	eax, DWORD PTR _pv$[ebp]
	movsx	ecx, BYTE PTR [eax+160]
	test	ecx, ecx
	je	SHORT $L71645
	mov	edx, DWORD PTR _pv$[ebp]
	add	edx, 160				; 000000a0H
	mov	DWORD PTR -1180+[ebp], edx
	jmp	SHORT $L71646
$L71645:
	mov	DWORD PTR -1180+[ebp], 0
$L71646:
	mov	eax, DWORD PTR _pv$[ebp]
	mov	ecx, DWORD PTR [eax+208]
	mov	edx, DWORD PTR -1180+[ebp]
	mov	DWORD PTR [ecx+272], edx

; 1072 : 		if(pivottable_add_field(cntxt, pv, pv->data)) STACK_ERROR;

	mov	eax, DWORD PTR _pv$[ebp]
	mov	ecx, DWORD PTR [eax+208]
	push	ecx
	mov	edx, DWORD PTR _pv$[ebp]
	push	edx
	mov	eax, DWORD PTR _cntxt$[ebp]
	push	eax
	call	_pivottable_add_field
	add	esp, 12					; 0000000cH
	test	eax, eax
	je	SHORT $L71225
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 1072		; 00000430H
	jmp	$eva_err$71226
$L71225:

; 1073 : 		if(pv->data->srctable || *pv->data->datatable)

	mov	edx, DWORD PTR _pv$[ebp]
	mov	eax, DWORD PTR [edx+208]
	cmp	DWORD PTR [eax+272], 0
	jne	SHORT $L71228
	mov	ecx, DWORD PTR _pv$[ebp]
	mov	edx, DWORD PTR [ecx+208]
	movsx	eax, BYTE PTR [edx+208]
	test	eax, eax
	je	SHORT $L71227
$L71228:

; 1075 : 			pv->nbobj = pv->data->nbobj;

	mov	ecx, DWORD PTR _pv$[ebp]
	mov	edx, DWORD PTR [ecx+208]
	mov	eax, DWORD PTR _pv$[ebp]
	mov	ecx, DWORD PTR [edx+280]
	mov	DWORD PTR [eax+196], ecx

; 1076 : 			if(!pv->nbobj)

	mov	edx, DWORD PTR _pv$[ebp]
	cmp	DWORD PTR [edx+196], 0
	jne	SHORT $L71229

; 1078 : 				pv->b_empty = 1;

	mov	eax, DWORD PTR _pv$[ebp]
	mov	DWORD PTR [eax+94224], 1

; 1079 : 				RETURN_OK;

	jmp	$eva_noerr$71230
$L71229:

; 1082 : 		else

	jmp	SHORT $L71231
$L71227:

; 1083 : 			pv->data = NULL;

	mov	ecx, DWORD PTR _pv$[ebp]
	mov	DWORD PTR [ecx+208], 0
$L71231:

; 1085 : 
; 1086 : 	/* Set idobj source table for row & column */
; 1087 : 	if(*pv->objtable || (pv->data && *pv->data->datatable))

	mov	edx, DWORD PTR _pv$[ebp]
	movsx	eax, BYTE PTR [edx+160]
	test	eax, eax
	jne	SHORT $L71234
	mov	ecx, DWORD PTR _pv$[ebp]
	cmp	DWORD PTR [ecx+208], 0
	je	$L71233
	mov	edx, DWORD PTR _pv$[ebp]
	mov	eax, DWORD PTR [edx+208]
	movsx	ecx, BYTE PTR [eax+208]
	test	ecx, ecx
	je	$L71233
$L71234:

; 1089 : 		/* There is a source table for IdObj : use it for both rows & columns */
; 1090 : 		char *table = (*pv->objtable && !pv->data) ? pv->objtable : pv->data->datatable;

	mov	edx, DWORD PTR _pv$[ebp]
	movsx	eax, BYTE PTR [edx+160]
	test	eax, eax
	je	SHORT $L71647
	mov	ecx, DWORD PTR _pv$[ebp]
	cmp	DWORD PTR [ecx+208], 0
	jne	SHORT $L71647
	mov	edx, DWORD PTR _pv$[ebp]
	add	edx, 160				; 000000a0H
	mov	DWORD PTR -1184+[ebp], edx
	jmp	SHORT $L71648
$L71647:
	mov	eax, DWORD PTR _pv$[ebp]
	mov	ecx, DWORD PTR [eax+208]
	add	ecx, 208				; 000000d0H
	mov	DWORD PTR -1184+[ebp], ecx
$L71648:
	mov	edx, DWORD PTR -1184+[ebp]
	mov	DWORD PTR _table$71235[ebp], edx

; 1091 : 		if(pv->row) pv->row->srctable = table;

	mov	eax, DWORD PTR _pv$[ebp]
	cmp	DWORD PTR [eax+200], 0
	je	SHORT $L71236
	mov	ecx, DWORD PTR _pv$[ebp]
	mov	edx, DWORD PTR [ecx+200]
	mov	eax, DWORD PTR _table$71235[ebp]
	mov	DWORD PTR [edx+272], eax
$L71236:

; 1092 : 		if(pv->col) pv->col->srctable = table;

	mov	ecx, DWORD PTR _pv$[ebp]
	cmp	DWORD PTR [ecx+204], 0
	je	SHORT $L71237
	mov	edx, DWORD PTR _pv$[ebp]
	mov	eax, DWORD PTR [edx+204]
	mov	ecx, DWORD PTR _table$71235[ebp]
	mov	DWORD PTR [eax+272], ecx
$L71237:

; 1094 : 	else

	jmp	SHORT $L71239
$L71233:

; 1096 : 		if(pv->row && pv->col) pv->col->srctable = pv->row->datatable;

	mov	edx, DWORD PTR _pv$[ebp]
	cmp	DWORD PTR [edx+200], 0
	je	SHORT $L71239
	mov	eax, DWORD PTR _pv$[ebp]
	cmp	DWORD PTR [eax+204], 0
	je	SHORT $L71239
	mov	ecx, DWORD PTR _pv$[ebp]
	mov	edx, DWORD PTR [ecx+200]
	add	edx, 208				; 000000d0H
	mov	eax, DWORD PTR _pv$[ebp]
	mov	ecx, DWORD PTR [eax+204]
	mov	DWORD PTR [ecx+272], edx
$L71239:

; 1098 : 
; 1099 : 	/* Set base table */
; 1100 : 	pv->basetable = pv->data ? pv->data->datatable :
; 1101 : 					*pv->objtable ? pv->objtable :
; 1102 : 					pv->row ? pv->row->datatable :
; 1103 : 					pv->col ? pv->col->datatable : NULL;

	mov	edx, DWORD PTR _pv$[ebp]
	cmp	DWORD PTR [edx+208], 0
	je	SHORT $L71655
	mov	eax, DWORD PTR _pv$[ebp]
	mov	ecx, DWORD PTR [eax+208]
	add	ecx, 208				; 000000d0H
	mov	DWORD PTR -1188+[ebp], ecx
	jmp	$L71656
$L71655:
	mov	edx, DWORD PTR _pv$[ebp]
	movsx	eax, BYTE PTR [edx+160]
	test	eax, eax
	je	SHORT $L71653
	mov	ecx, DWORD PTR _pv$[ebp]
	add	ecx, 160				; 000000a0H
	mov	DWORD PTR -1192+[ebp], ecx
	jmp	SHORT $L71654
$L71653:
	mov	edx, DWORD PTR _pv$[ebp]
	cmp	DWORD PTR [edx+200], 0
	je	SHORT $L71651
	mov	eax, DWORD PTR _pv$[ebp]
	mov	ecx, DWORD PTR [eax+200]
	add	ecx, 208				; 000000d0H
	mov	DWORD PTR -1196+[ebp], ecx
	jmp	SHORT $L71652
$L71651:
	mov	edx, DWORD PTR _pv$[ebp]
	cmp	DWORD PTR [edx+204], 0
	je	SHORT $L71649
	mov	eax, DWORD PTR _pv$[ebp]
	mov	ecx, DWORD PTR [eax+204]
	add	ecx, 208				; 000000d0H
	mov	DWORD PTR -1200+[ebp], ecx
	jmp	SHORT $L71650
$L71649:
	mov	DWORD PTR -1200+[ebp], 0
$L71650:
	mov	edx, DWORD PTR -1200+[ebp]
	mov	DWORD PTR -1196+[ebp], edx
$L71652:
	mov	eax, DWORD PTR -1196+[ebp]
	mov	DWORD PTR -1192+[ebp], eax
$L71654:
	mov	ecx, DWORD PTR -1192+[ebp]
	mov	DWORD PTR -1188+[ebp], ecx
$L71656:
	mov	edx, DWORD PTR _pv$[ebp]
	mov	eax, DWORD PTR -1188+[ebp]
	mov	DWORD PTR [edx+192], eax

; 1104 : 	if(!pv->basetable) RETURN_OK;

	mov	ecx, DWORD PTR _pv$[ebp]
	cmp	DWORD PTR [ecx+192], 0
	jne	SHORT $L71241
	jmp	$eva_noerr$71230
$L71241:

; 1105 : 
; 1106 : 	/* Set data member */
; 1107 : 	if(!strcmp(function, "SUM") || !strcmp(function, "AVG") ||
; 1108 : 		!strcmp(function, "MIN") || !strcmp(function, "MAX") || !strcmp(function, "COUNT"))

	push	OFFSET FLAT:$SG71244
	mov	edx, DWORD PTR _function$[ebp]
	push	edx
	call	_strcmp
	add	esp, 8
	test	eax, eax
	je	SHORT $L71243
	push	OFFSET FLAT:$SG71245
	mov	eax, DWORD PTR _function$[ebp]
	push	eax
	call	_strcmp
	add	esp, 8
	test	eax, eax
	je	SHORT $L71243
	push	OFFSET FLAT:$SG71246
	mov	ecx, DWORD PTR _function$[ebp]
	push	ecx
	call	_strcmp
	add	esp, 8
	test	eax, eax
	je	SHORT $L71243
	push	OFFSET FLAT:$SG71247
	mov	edx, DWORD PTR _function$[ebp]
	push	edx
	call	_strcmp
	add	esp, 8
	test	eax, eax
	je	SHORT $L71243
	push	OFFSET FLAT:$SG71248
	mov	eax, DWORD PTR _function$[ebp]
	push	eax
	call	_strcmp
	add	esp, 8
	test	eax, eax
	jne	SHORT $L71242
$L71243:

; 1110 : 		if(!pv->data) RETURN_ERROR("NoDataExpression", NOP);

	mov	ecx, DWORD PTR _pv$[ebp]
	cmp	DWORD PTR [ecx+208], 0
	jne	SHORT $L71249
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29872], OFFSET FLAT:$SG71251
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 1110		; 00000456H
	jmp	$eva_err$71226
$L71249:

; 1111 : 		snprintf(add_sz_str(pv->datamember), "%s(%s.Val)", function, pv->basetable);

	mov	ecx, DWORD PTR _pv$[ebp]
	mov	edx, DWORD PTR [ecx+192]
	push	edx
	mov	eax, DWORD PTR _function$[ebp]
	push	eax
	push	OFFSET FLAT:$SG71252
	push	63					; 0000003fH
	mov	ecx, DWORD PTR _pv$[ebp]
	add	ecx, 94140				; 00016fbcH
	push	ecx
	call	__snprintf
	add	esp, 20					; 00000014H

; 1113 : 	else if(!strcmp(function, "VALCOUNT"))

	jmp	$L71262
$L71242:
	push	OFFSET FLAT:$SG71255
	mov	edx, DWORD PTR _function$[ebp]
	push	edx
	call	_strcmp
	add	esp, 8
	test	eax, eax
	jne	SHORT $L71254

; 1114 : 		snprintf(add_sz_str(pv->datamember), "COUNT(%s.IdObj)", pv->basetable);

	mov	eax, DWORD PTR _pv$[ebp]
	mov	ecx, DWORD PTR [eax+192]
	push	ecx
	push	OFFSET FLAT:$SG71256
	push	63					; 0000003fH
	mov	edx, DWORD PTR _pv$[ebp]
	add	edx, 94140				; 00016fbcH
	push	edx
	call	__snprintf
	add	esp, 16					; 00000010H

; 1115 : 	else if(!strcmp(function, "VALCOUNT1") && (pv->row || pv->col))

	jmp	SHORT $L71262
$L71254:
	push	OFFSET FLAT:$SG71259
	mov	eax, DWORD PTR _function$[ebp]
	push	eax
	call	_strcmp
	add	esp, 8
	test	eax, eax
	jne	SHORT $L71258
	mov	ecx, DWORD PTR _pv$[ebp]
	cmp	DWORD PTR [ecx+200], 0
	jne	SHORT $L71260
	mov	edx, DWORD PTR _pv$[ebp]
	cmp	DWORD PTR [edx+204], 0
	je	SHORT $L71258
$L71260:

; 1116 : 		snprintf(add_sz_str(pv->datamember), "COUNT(DISTINCT %s.Val)", pv->basetable);

	mov	eax, DWORD PTR _pv$[ebp]
	mov	ecx, DWORD PTR [eax+192]
	push	ecx
	push	OFFSET FLAT:$SG71261
	push	63					; 0000003fH
	mov	edx, DWORD PTR _pv$[ebp]
	add	edx, 94140				; 00016fbcH
	push	edx
	call	__snprintf
	add	esp, 16					; 00000010H

; 1117 : 	else

	jmp	SHORT $L71262
$L71258:

; 1118 : 		snprintf(add_sz_str(pv->datamember), "COUNT(DISTINCT %s.IdObj)", pv->basetable);

	mov	eax, DWORD PTR _pv$[ebp]
	mov	ecx, DWORD PTR [eax+192]
	push	ecx
	push	OFFSET FLAT:$SG71263
	push	63					; 0000003fH
	mov	edx, DWORD PTR _pv$[ebp]
	add	edx, 94140				; 00016fbcH
	push	edx
	call	__snprintf
	add	esp, 16					; 00000010H
$L71262:

; 1119 : 
; 1120 : 	/* Add row/column/data fields - return if empty */
; 1121 : 	if(pivottable_add_field(cntxt, pv, pv->row)) STACK_ERROR;

	mov	eax, DWORD PTR _pv$[ebp]
	mov	ecx, DWORD PTR [eax+200]
	push	ecx
	mov	edx, DWORD PTR _pv$[ebp]
	push	edx
	mov	eax, DWORD PTR _cntxt$[ebp]
	push	eax
	call	_pivottable_add_field
	add	esp, 12					; 0000000cH
	test	eax, eax
	je	SHORT $L71264
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 1121		; 00000461H
	jmp	$eva_err$71226
$L71264:

; 1122 : 	if(pv->row && !pv->nbobj) pv->nbobj = pv->row->nbobj;

	mov	edx, DWORD PTR _pv$[ebp]
	cmp	DWORD PTR [edx+200], 0
	je	SHORT $L71265
	mov	eax, DWORD PTR _pv$[ebp]
	cmp	DWORD PTR [eax+196], 0
	jne	SHORT $L71265
	mov	ecx, DWORD PTR _pv$[ebp]
	mov	edx, DWORD PTR [ecx+200]
	mov	eax, DWORD PTR _pv$[ebp]
	mov	ecx, DWORD PTR [edx+280]
	mov	DWORD PTR [eax+196], ecx
$L71265:

; 1123 : 	if(pivottable_add_field(cntxt, pv, pv->col)) STACK_ERROR;

	mov	edx, DWORD PTR _pv$[ebp]
	mov	eax, DWORD PTR [edx+204]
	push	eax
	mov	ecx, DWORD PTR _pv$[ebp]
	push	ecx
	mov	edx, DWORD PTR _cntxt$[ebp]
	push	edx
	call	_pivottable_add_field
	add	esp, 12					; 0000000cH
	test	eax, eax
	je	SHORT $L71266
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 1123		; 00000463H
	jmp	$eva_err$71226
$L71266:

; 1124 : 	if(pv->col && !pv->nbobj) pv->nbobj = pv->col->nbobj;

	mov	ecx, DWORD PTR _pv$[ebp]
	cmp	DWORD PTR [ecx+204], 0
	je	SHORT $L71267
	mov	edx, DWORD PTR _pv$[ebp]
	cmp	DWORD PTR [edx+196], 0
	jne	SHORT $L71267
	mov	eax, DWORD PTR _pv$[ebp]
	mov	ecx, DWORD PTR [eax+204]
	mov	edx, DWORD PTR _pv$[ebp]
	mov	eax, DWORD PTR [ecx+280]
	mov	DWORD PTR [edx+196], eax
$L71267:

; 1125 : 	if(!pv->nbobj) RETURN_OK;

	mov	ecx, DWORD PTR _pv$[ebp]
	cmp	DWORD PTR [ecx+196], 0
	jne	SHORT $L71268
	jmp	$eva_noerr$71230
$L71268:

; 1126 : 
; 1127 : 	/* Add WHERE clause for values Lines match if applicable */
; 1128 : 	if(pv->data && pv->data->b_lines)

	mov	edx, DWORD PTR _pv$[ebp]
	cmp	DWORD PTR [edx+208], 0
	je	$L71269
	mov	eax, DWORD PTR _pv$[ebp]
	mov	ecx, DWORD PTR [eax+208]
	cmp	DWORD PTR [ecx+476], 0
	je	$L71269

; 1130 : 		if(pv->row && pv->row->b_lines)

	mov	edx, DWORD PTR _pv$[ebp]
	cmp	DWORD PTR [edx+200], 0
	je	$L71270
	mov	eax, DWORD PTR _pv$[ebp]
	mov	ecx, DWORD PTR [eax+200]
	cmp	DWORD PTR [ecx+476], 0
	je	$L71270

; 1131 : 			dynbuf_print5(&pv->where, "%s (%s.Line=%s.Line OR %s.Line IS NULL OR %s.Line IS NULL)\n",
; 1132 : 									pv->where ? "AND " : "",
; 1133 : 									pv->row->datatable, pv->data->datatable,
; 1134 : 									pv->row->datatable, pv->data->datatable);

	mov	edx, DWORD PTR _pv$[ebp]
	cmp	DWORD PTR [edx+94212], 0
	je	SHORT $L71657
	mov	DWORD PTR -1204+[ebp], OFFSET FLAT:$SG71272
	jmp	SHORT $L71658
$L71657:
	mov	DWORD PTR -1204+[ebp], OFFSET FLAT:$SG71273
$L71658:
	push	0
	push	0
	mov	eax, DWORD PTR _pv$[ebp]
	mov	ecx, DWORD PTR [eax+208]
	add	ecx, 208				; 000000d0H
	push	ecx
	mov	edx, DWORD PTR _pv$[ebp]
	mov	eax, DWORD PTR [edx+200]
	add	eax, 208				; 000000d0H
	push	eax
	mov	ecx, DWORD PTR _pv$[ebp]
	mov	edx, DWORD PTR [ecx+208]
	add	edx, 208				; 000000d0H
	push	edx
	mov	eax, DWORD PTR _pv$[ebp]
	mov	ecx, DWORD PTR [eax+200]
	add	ecx, 208				; 000000d0H
	push	ecx
	mov	edx, DWORD PTR -1204+[ebp]
	push	edx
	push	OFFSET FLAT:$SG71274
	push	1023					; 000003ffH
	lea	eax, DWORD PTR _printbuf$[ebp]
	push	eax
	call	__snprintf
	add	esp, 32					; 00000020H
	push	eax
	lea	ecx, DWORD PTR _printbuf$[ebp]
	push	ecx
	mov	edx, DWORD PTR _pv$[ebp]
	add	edx, 94212				; 00017004H
	push	edx
	call	_dynbuf_add
	add	esp, 20					; 00000014H
$L71270:

; 1135 : 		if(pv->col && pv->col->b_lines)

	mov	eax, DWORD PTR _pv$[ebp]
	cmp	DWORD PTR [eax+204], 0
	je	$L71275
	mov	ecx, DWORD PTR _pv$[ebp]
	mov	edx, DWORD PTR [ecx+204]
	cmp	DWORD PTR [edx+476], 0
	je	$L71275

; 1136 : 			dynbuf_print5(&pv->where, "%s (%s.Line=%s.Line OR %s.Line IS NULL OR %s.Line IS NULL)\n",
; 1137 : 									pv->where ? "AND " : "",
; 1138 : 									pv->col->datatable, pv->data->datatable,
; 1139 : 									pv->col->datatable, pv->data->datatable);

	mov	eax, DWORD PTR _pv$[ebp]
	cmp	DWORD PTR [eax+94212], 0
	je	SHORT $L71659
	mov	DWORD PTR -1208+[ebp], OFFSET FLAT:$SG71277
	jmp	SHORT $L71660
$L71659:
	mov	DWORD PTR -1208+[ebp], OFFSET FLAT:$SG71278
$L71660:
	push	0
	push	0
	mov	ecx, DWORD PTR _pv$[ebp]
	mov	edx, DWORD PTR [ecx+208]
	add	edx, 208				; 000000d0H
	push	edx
	mov	eax, DWORD PTR _pv$[ebp]
	mov	ecx, DWORD PTR [eax+204]
	add	ecx, 208				; 000000d0H
	push	ecx
	mov	edx, DWORD PTR _pv$[ebp]
	mov	eax, DWORD PTR [edx+208]
	add	eax, 208				; 000000d0H
	push	eax
	mov	ecx, DWORD PTR _pv$[ebp]
	mov	edx, DWORD PTR [ecx+204]
	add	edx, 208				; 000000d0H
	push	edx
	mov	eax, DWORD PTR -1208+[ebp]
	push	eax
	push	OFFSET FLAT:$SG71279
	push	1023					; 000003ffH
	lea	ecx, DWORD PTR _printbuf$[ebp]
	push	ecx
	call	__snprintf
	add	esp, 32					; 00000020H
	push	eax
	lea	edx, DWORD PTR _printbuf$[ebp]
	push	edx
	mov	eax, DWORD PTR _pv$[ebp]
	add	eax, 94212				; 00017004H
	push	eax
	call	_dynbuf_add
	add	esp, 20					; 00000014H
$L71275:

; 1141 : 	else if(pv->row && pv->row->b_lines && pv->col && pv->col->b_lines)

	jmp	$L71281
$L71269:
	mov	ecx, DWORD PTR _pv$[ebp]
	cmp	DWORD PTR [ecx+200], 0
	je	$L71281
	mov	edx, DWORD PTR _pv$[ebp]
	mov	eax, DWORD PTR [edx+200]
	cmp	DWORD PTR [eax+476], 0
	je	$L71281
	mov	ecx, DWORD PTR _pv$[ebp]
	cmp	DWORD PTR [ecx+204], 0
	je	$L71281
	mov	edx, DWORD PTR _pv$[ebp]
	mov	eax, DWORD PTR [edx+204]
	cmp	DWORD PTR [eax+476], 0
	je	$L71281

; 1142 : 		dynbuf_print5(&pv->where, "%s (%s.Line=%s.Line OR %s.Line IS NULL OR %s.Line IS NULL)\n",
; 1143 : 								pv->where ? "AND " : "",
; 1144 : 								pv->row->datatable, pv->col->datatable,
; 1145 : 								pv->row->datatable, pv->col->datatable);

	mov	ecx, DWORD PTR _pv$[ebp]
	cmp	DWORD PTR [ecx+94212], 0
	je	SHORT $L71661
	mov	DWORD PTR -1212+[ebp], OFFSET FLAT:$SG71283
	jmp	SHORT $L71662
$L71661:
	mov	DWORD PTR -1212+[ebp], OFFSET FLAT:$SG71284
$L71662:
	push	0
	push	0
	mov	edx, DWORD PTR _pv$[ebp]
	mov	eax, DWORD PTR [edx+204]
	add	eax, 208				; 000000d0H
	push	eax
	mov	ecx, DWORD PTR _pv$[ebp]
	mov	edx, DWORD PTR [ecx+200]
	add	edx, 208				; 000000d0H
	push	edx
	mov	eax, DWORD PTR _pv$[ebp]
	mov	ecx, DWORD PTR [eax+204]
	add	ecx, 208				; 000000d0H
	push	ecx
	mov	edx, DWORD PTR _pv$[ebp]
	mov	eax, DWORD PTR [edx+200]
	add	eax, 208				; 000000d0H
	push	eax
	mov	ecx, DWORD PTR -1212+[ebp]
	push	ecx
	push	OFFSET FLAT:$SG71285
	push	1023					; 000003ffH
	lea	edx, DWORD PTR _printbuf$[ebp]
	push	edx
	call	__snprintf
	add	esp, 32					; 00000020H
	push	eax
	lea	eax, DWORD PTR _printbuf$[ebp]
	push	eax
	mov	ecx, DWORD PTR _pv$[ebp]
	add	ecx, 94212				; 00017004H
	push	ecx
	call	_dynbuf_add
	add	esp, 20					; 00000014H
$L71281:

; 1146 : 
; 1147 : 	/* Build labels */
; 1148 : 	if(pivottable_build_labels(cntxt, pv, pv->row)) STACK_ERROR;

	mov	edx, DWORD PTR _pv$[ebp]
	mov	eax, DWORD PTR [edx+200]
	push	eax
	mov	ecx, DWORD PTR _pv$[ebp]
	push	ecx
	mov	edx, DWORD PTR _cntxt$[ebp]
	push	edx
	call	_pivottable_build_labels
	add	esp, 12					; 0000000cH
	test	eax, eax
	je	SHORT $L71286
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 1148		; 0000047cH
	jmp	$eva_err$71226
$L71286:

; 1149 : 	if(pivottable_build_labels(cntxt, pv, pv->col)) STACK_ERROR;

	mov	ecx, DWORD PTR _pv$[ebp]
	mov	edx, DWORD PTR [ecx+204]
	push	edx
	mov	eax, DWORD PTR _pv$[ebp]
	push	eax
	mov	ecx, DWORD PTR _cntxt$[ebp]
	push	ecx
	call	_pivottable_build_labels
	add	esp, 12					; 0000000cH
	test	eax, eax
	je	SHORT $L71287
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 1149		; 0000047dH
	jmp	$eva_err$71226
$L71287:

; 1150 : 
; 1151 : 	/* Build GROUP clause */
; 1152 : 	if(pv->row || pv->col) DYNBUF_ADD_STR(&pv->group, "GROUP BY ");

	mov	eax, DWORD PTR _pv$[ebp]
	cmp	DWORD PTR [eax+200], 0
	jne	SHORT $L71289
	mov	ecx, DWORD PTR _pv$[ebp]
	cmp	DWORD PTR [ecx+204], 0
	je	SHORT $L71291
$L71289:
	push	0
	push	0
	push	9
	push	OFFSET FLAT:$SG71292
	mov	edx, DWORD PTR _pv$[ebp]
	add	edx, 94216				; 00017008H
	push	edx
	call	_dynbuf_add
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L71291
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29872], OFFSET FLAT:$SG71294
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 1152		; 00000480H
	jmp	$eva_err$71226
$L71291:

; 1153 : 	if(pv->row) dynbuf_print(&pv->group, "%s.Val", pv->row->datatable);

	mov	edx, DWORD PTR _pv$[ebp]
	cmp	DWORD PTR [edx+200], 0
	je	SHORT $L71295
	push	0
	push	0
	mov	eax, DWORD PTR _pv$[ebp]
	mov	ecx, DWORD PTR [eax+200]
	add	ecx, 208				; 000000d0H
	push	ecx
	push	OFFSET FLAT:$SG71297
	push	1023					; 000003ffH
	lea	edx, DWORD PTR _printbuf$[ebp]
	push	edx
	call	__snprintf
	add	esp, 16					; 00000010H
	push	eax
	lea	eax, DWORD PTR _printbuf$[ebp]
	push	eax
	mov	ecx, DWORD PTR _pv$[ebp]
	add	ecx, 94216				; 00017008H
	push	ecx
	call	_dynbuf_add
	add	esp, 20					; 00000014H
$L71295:

; 1154 : 	if(pv->row && pv->col) DYNBUF_ADD_STR(&pv->group, ",");

	mov	edx, DWORD PTR _pv$[ebp]
	cmp	DWORD PTR [edx+200], 0
	je	SHORT $L71300
	mov	eax, DWORD PTR _pv$[ebp]
	cmp	DWORD PTR [eax+204], 0
	je	SHORT $L71300
	push	0
	push	0
	push	1
	push	OFFSET FLAT:$SG71301
	mov	ecx, DWORD PTR _pv$[ebp]
	add	ecx, 94216				; 00017008H
	push	ecx
	call	_dynbuf_add
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L71300
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29872], OFFSET FLAT:$SG71303
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 1154		; 00000482H
	jmp	$eva_err$71226
$L71300:

; 1155 : 	if(pv->col) dynbuf_print(&pv->group, "%s.Val", pv->col->datatable);

	mov	ecx, DWORD PTR _pv$[ebp]
	cmp	DWORD PTR [ecx+204], 0
	je	SHORT $L71304
	push	0
	push	0
	mov	edx, DWORD PTR _pv$[ebp]
	mov	eax, DWORD PTR [edx+204]
	add	eax, 208				; 000000d0H
	push	eax
	push	OFFSET FLAT:$SG71306
	push	1023					; 000003ffH
	lea	ecx, DWORD PTR _printbuf$[ebp]
	push	ecx
	call	__snprintf
	add	esp, 16					; 00000010H
	push	eax
	lea	edx, DWORD PTR _printbuf$[ebp]
	push	edx
	mov	eax, DWORD PTR _pv$[ebp]
	add	eax, 94216				; 00017008H
	push	eax
	call	_dynbuf_add
	add	esp, 20					; 00000014H
$L71304:

; 1156 : 
; 1157 : 	/* Return if building objects for list */
; 1158 : 	if(pv->rowcolclic) RETURN_OK;

	mov	ecx, DWORD PTR _pv$[ebp]
	cmp	DWORD PTR [ecx+94220], 0
	je	SHORT $L71307
	jmp	$eva_noerr$71230
$L71307:

; 1159 : 
; 1160 : 	/* Calc pivot table grand total */
; 1161 : 	M_FREE(sql);

	mov	edx, DWORD PTR _sql$[ebp]
	push	edx
	call	_mem_free
	add	esp, 4
	mov	DWORD PTR _sql$[ebp], 0

; 1163 : 		"-- pivottable_calc - grand total\n"
; 1164 : 		"SELECT ", pv->datamember, 0, NO_CONV, "");

	push	0
	push	OFFSET FLAT:$SG71310
	push	0
	push	0
	push	0
	mov	eax, DWORD PTR _pv$[ebp]
	add	eax, 94140				; 00016fbcH
	push	eax
	push	40					; 00000028H
	push	OFFSET FLAT:$SG71311
	lea	ecx, DWORD PTR _sql$[ebp]
	push	ecx
	call	_dynbuf_add3
	add	esp, 36					; 00000024H
	test	eax, eax
	je	SHORT $L71309
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29872], OFFSET FLAT:$SG71313
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 1164		; 0000048cH
	jmp	$eva_err$71226
$L71309:

; 1165 : 	DYNBUF_ADD3(&sql, ",COUNT(DISTINCT ", pv->basetable, 0, NO_CONV, ".IdObj) ");

	push	8
	push	OFFSET FLAT:$SG71316
	push	0
	push	0
	push	0
	mov	ecx, DWORD PTR _pv$[ebp]
	mov	edx, DWORD PTR [ecx+192]
	push	edx
	push	16					; 00000010H
	push	OFFSET FLAT:$SG71317
	lea	eax, DWORD PTR _sql$[ebp]
	push	eax
	call	_dynbuf_add3
	add	esp, 36					; 00000024H
	test	eax, eax
	je	SHORT $L71315
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29872], OFFSET FLAT:$SG71319
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 1165		; 0000048dH
	jmp	$eva_err$71226
$L71315:

; 1166 : 	DYNBUF_ADD3(&sql, ",MAX(", pv->basetable, 0, NO_CONV, ".IdObj) ");

	push	8
	push	OFFSET FLAT:$SG71322
	push	0
	push	0
	push	0
	mov	eax, DWORD PTR _pv$[ebp]
	mov	ecx, DWORD PTR [eax+192]
	push	ecx
	push	5
	push	OFFSET FLAT:$SG71323
	lea	edx, DWORD PTR _sql$[ebp]
	push	edx
	call	_dynbuf_add3
	add	esp, 36					; 00000024H
	test	eax, eax
	je	SHORT $L71321
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29872], OFFSET FLAT:$SG71325
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 1166		; 0000048eH
	jmp	$eva_err$71226
$L71321:

; 1167 : 	DYNBUF_ADD3(&sql, "FROM ", pv->basetable, 0, NO_CONV, "\n");

	push	1
	push	OFFSET FLAT:$SG71328
	push	0
	push	0
	push	0
	mov	edx, DWORD PTR _pv$[ebp]
	mov	eax, DWORD PTR [edx+192]
	push	eax
	push	5
	push	OFFSET FLAT:$SG71329
	lea	ecx, DWORD PTR _sql$[ebp]
	push	ecx
	call	_dynbuf_add3
	add	esp, 36					; 00000024H
	test	eax, eax
	je	SHORT $L71327
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29872], OFFSET FLAT:$SG71331
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 1167		; 0000048fH
	jmp	$eva_err$71226
$L71327:

; 1168 : 	DYNBUF_ADD_BUF(&sql, pv->join, NO_CONV);

	mov	ecx, DWORD PTR _pv$[ebp]
	cmp	DWORD PTR [ecx+94208], 0
	je	SHORT $L71333
	push	0
	push	0
	mov	edx, DWORD PTR _pv$[ebp]
	mov	eax, DWORD PTR [edx+94208]
	mov	ecx, DWORD PTR [eax+4]
	push	ecx
	mov	edx, DWORD PTR _pv$[ebp]
	mov	eax, DWORD PTR [edx+94208]
	add	eax, 8
	push	eax
	lea	ecx, DWORD PTR _sql$[ebp]
	push	ecx
	call	_dynbuf_add
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L71333
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29872], OFFSET FLAT:$SG71335
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 1168		; 00000490H
	jmp	$eva_err$71226
$L71333:

; 1169 : 	if(pv->where) DYNBUF_ADD3_BUF(&sql, "WHERE ", pv->where, NO_CONV, "\n");

	mov	ecx, DWORD PTR _pv$[ebp]
	cmp	DWORD PTR [ecx+94212], 0
	je	$L71339
	mov	edx, DWORD PTR _pv$[ebp]
	cmp	DWORD PTR [edx+94212], 0
	je	SHORT $L71663
	mov	eax, DWORD PTR _pv$[ebp]
	mov	ecx, DWORD PTR [eax+94212]
	mov	edx, DWORD PTR [ecx+4]
	mov	DWORD PTR -1216+[ebp], edx
	jmp	SHORT $L71664
$L71663:
	mov	DWORD PTR -1216+[ebp], 0
$L71664:
	mov	eax, DWORD PTR _pv$[ebp]
	cmp	DWORD PTR [eax+94212], 0
	je	SHORT $L71665
	mov	ecx, DWORD PTR _pv$[ebp]
	mov	edx, DWORD PTR [ecx+94212]
	add	edx, 8
	mov	DWORD PTR -1220+[ebp], edx
	jmp	SHORT $L71666
$L71665:
	mov	DWORD PTR -1220+[ebp], 0
$L71666:
	push	1
	push	OFFSET FLAT:$SG71340
	push	0
	push	0
	mov	eax, DWORD PTR -1216+[ebp]
	push	eax
	mov	ecx, DWORD PTR -1220+[ebp]
	push	ecx
	push	6
	push	OFFSET FLAT:$SG71341
	lea	edx, DWORD PTR _sql$[ebp]
	push	edx
	call	_dynbuf_add3
	add	esp, 36					; 00000024H
	test	eax, eax
	je	SHORT $L71339
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29872], OFFSET FLAT:$SG71343
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 1169		; 00000491H
	jmp	$eva_err$71226
$L71339:

; 1170 : 	if(sql_exec_query(cntxt, sql->data) || sql_get_table(cntxt, &id_obj, 2)) STACK_ERROR;

	mov	edx, DWORD PTR _sql$[ebp]
	add	edx, 8
	push	edx
	mov	eax, DWORD PTR _cntxt$[ebp]
	push	eax
	call	_sql_exec_query
	add	esp, 8
	test	eax, eax
	jne	SHORT $L71345
	push	2
	lea	ecx, DWORD PTR _id_obj$[ebp]
	push	ecx
	mov	edx, DWORD PTR _cntxt$[ebp]
	push	edx
	call	_sql_get_table
	add	esp, 12					; 0000000cH
	test	eax, eax
	je	SHORT $L71344
$L71345:
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 1170		; 00000492H
	jmp	$eva_err$71226
$L71344:

; 1171 : 	if(pivottable_set_cellval(cntxt, pv, ROWCNT, COLCNT, &id_obj, 0, 0)) STACK_ERROR;

	mov	ecx, DWORD PTR _pv$[ebp]
	cmp	DWORD PTR [ecx+204], 0
	je	SHORT $L71667
	mov	edx, DWORD PTR _pv$[ebp]
	mov	eax, DWORD PTR [edx+204]
	mov	ecx, DWORD PTR [eax+24]
	mov	DWORD PTR -1224+[ebp], ecx
	jmp	SHORT $L71668
$L71667:
	mov	DWORD PTR -1224+[ebp], 0
$L71668:
	mov	edx, DWORD PTR _pv$[ebp]
	cmp	DWORD PTR [edx+200], 0
	je	SHORT $L71669
	mov	eax, DWORD PTR _pv$[ebp]
	mov	ecx, DWORD PTR [eax+200]
	mov	edx, DWORD PTR [ecx+24]
	mov	DWORD PTR -1228+[ebp], edx
	jmp	SHORT $L71670
$L71669:
	mov	DWORD PTR -1228+[ebp], 0
$L71670:
	push	0
	push	0
	lea	eax, DWORD PTR _id_obj$[ebp]
	push	eax
	mov	ecx, DWORD PTR -1224+[ebp]
	push	ecx
	mov	edx, DWORD PTR -1228+[ebp]
	push	edx
	mov	eax, DWORD PTR _pv$[ebp]
	push	eax
	mov	ecx, DWORD PTR _cntxt$[ebp]
	push	ecx
	call	_pivottable_set_cellval
	add	esp, 28					; 0000001cH
	test	eax, eax
	je	SHORT $L71346
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 1171		; 00000493H
	jmp	$eva_err$71226
$L71346:

; 1172 : 
; 1173 : 	/* Build SELECT clause for cross values table if applicable */
; 1174 : 	if(pv->row && pv->col)

	mov	eax, DWORD PTR _pv$[ebp]
	cmp	DWORD PTR [eax+200], 0
	je	$L71377
	mov	ecx, DWORD PTR _pv$[ebp]
	cmp	DWORD PTR [ecx+204], 0
	je	$L71377

; 1176 : 		M_FREE(sql);

	mov	edx, DWORD PTR _sql$[ebp]
	push	edx
	call	_mem_free
	add	esp, 4
	mov	DWORD PTR _sql$[ebp], 0

; 1177 : 		dynbuf_print5(&sql,
; 1178 : 			"-- pivottable_calc - Build cross values table\n"
; 1179 : 			"SELECT %s%s,COUNT(DISTINCT %s.IdObj),MAX(%s.IdObj)\nFROM %s\n",
; 1180 : 			pv->select ? pv->select->data : "", pv->datamember, pv->basetable, pv->basetable, pv->basetable);

	mov	eax, DWORD PTR _pv$[ebp]
	cmp	DWORD PTR [eax+94204], 0
	je	SHORT $L71671
	mov	ecx, DWORD PTR _pv$[ebp]
	mov	edx, DWORD PTR [ecx+94204]
	add	edx, 8
	mov	DWORD PTR -1232+[ebp], edx
	jmp	SHORT $L71672
$L71671:
	mov	DWORD PTR -1232+[ebp], OFFSET FLAT:$SG71349
$L71672:
	push	0
	push	0
	mov	eax, DWORD PTR _pv$[ebp]
	mov	ecx, DWORD PTR [eax+192]
	push	ecx
	mov	edx, DWORD PTR _pv$[ebp]
	mov	eax, DWORD PTR [edx+192]
	push	eax
	mov	ecx, DWORD PTR _pv$[ebp]
	mov	edx, DWORD PTR [ecx+192]
	push	edx
	mov	eax, DWORD PTR _pv$[ebp]
	add	eax, 94140				; 00016fbcH
	push	eax
	mov	ecx, DWORD PTR -1232+[ebp]
	push	ecx
	push	OFFSET FLAT:$SG71350
	push	1023					; 000003ffH
	lea	edx, DWORD PTR _printbuf$[ebp]
	push	edx
	call	__snprintf
	add	esp, 32					; 00000020H
	push	eax
	lea	eax, DWORD PTR _printbuf$[ebp]
	push	eax
	lea	ecx, DWORD PTR _sql$[ebp]
	push	ecx
	call	_dynbuf_add
	add	esp, 20					; 00000014H

; 1181 : 		DYNBUF_ADD_BUF(&sql, pv->join, NO_CONV);

	mov	edx, DWORD PTR _pv$[ebp]
	cmp	DWORD PTR [edx+94208], 0
	je	SHORT $L71352
	push	0
	push	0
	mov	eax, DWORD PTR _pv$[ebp]
	mov	ecx, DWORD PTR [eax+94208]
	mov	edx, DWORD PTR [ecx+4]
	push	edx
	mov	eax, DWORD PTR _pv$[ebp]
	mov	ecx, DWORD PTR [eax+94208]
	add	ecx, 8
	push	ecx
	lea	edx, DWORD PTR _sql$[ebp]
	push	edx
	call	_dynbuf_add
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L71352
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29872], OFFSET FLAT:$SG71354
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 1181		; 0000049dH
	jmp	$eva_err$71226
$L71352:

; 1182 : 		if(pv->where) DYNBUF_ADD3_BUF(&sql, "WHERE ", pv->where, NO_CONV, "\n");

	mov	edx, DWORD PTR _pv$[ebp]
	cmp	DWORD PTR [edx+94212], 0
	je	$L71358
	mov	eax, DWORD PTR _pv$[ebp]
	cmp	DWORD PTR [eax+94212], 0
	je	SHORT $L71673
	mov	ecx, DWORD PTR _pv$[ebp]
	mov	edx, DWORD PTR [ecx+94212]
	mov	eax, DWORD PTR [edx+4]
	mov	DWORD PTR -1236+[ebp], eax
	jmp	SHORT $L71674
$L71673:
	mov	DWORD PTR -1236+[ebp], 0
$L71674:
	mov	ecx, DWORD PTR _pv$[ebp]
	cmp	DWORD PTR [ecx+94212], 0
	je	SHORT $L71675
	mov	edx, DWORD PTR _pv$[ebp]
	mov	eax, DWORD PTR [edx+94212]
	add	eax, 8
	mov	DWORD PTR -1240+[ebp], eax
	jmp	SHORT $L71676
$L71675:
	mov	DWORD PTR -1240+[ebp], 0
$L71676:
	push	1
	push	OFFSET FLAT:$SG71359
	push	0
	push	0
	mov	ecx, DWORD PTR -1236+[ebp]
	push	ecx
	mov	edx, DWORD PTR -1240+[ebp]
	push	edx
	push	6
	push	OFFSET FLAT:$SG71360
	lea	eax, DWORD PTR _sql$[ebp]
	push	eax
	call	_dynbuf_add3
	add	esp, 36					; 00000024H
	test	eax, eax
	je	SHORT $L71358
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29872], OFFSET FLAT:$SG71362
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 1182		; 0000049eH
	jmp	$eva_err$71226
$L71358:

; 1183 : 		DYNBUF_ADD_BUF(&sql, pv->group, NO_CONV);

	mov	eax, DWORD PTR _pv$[ebp]
	cmp	DWORD PTR [eax+94216], 0
	je	SHORT $L71364
	push	0
	push	0
	mov	ecx, DWORD PTR _pv$[ebp]
	mov	edx, DWORD PTR [ecx+94216]
	mov	eax, DWORD PTR [edx+4]
	push	eax
	mov	ecx, DWORD PTR _pv$[ebp]
	mov	edx, DWORD PTR [ecx+94216]
	add	edx, 8
	push	edx
	lea	eax, DWORD PTR _sql$[ebp]
	push	eax
	call	_dynbuf_add
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L71364
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29872], OFFSET FLAT:$SG71366
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 1183		; 0000049fH
	jmp	$eva_err$71226
$L71364:

; 1184 : 
; 1185 : 		/* Exec query & get cross values table */
; 1186 : 		if(sql_exec_query(cntxt, sql->data) || sql_get_table(cntxt, &id_obj, 2)) STACK_ERROR;

	mov	eax, DWORD PTR _sql$[ebp]
	add	eax, 8
	push	eax
	mov	ecx, DWORD PTR _cntxt$[ebp]
	push	ecx
	call	_sql_exec_query
	add	esp, 8
	test	eax, eax
	jne	SHORT $L71368
	push	2
	lea	edx, DWORD PTR _id_obj$[ebp]
	push	edx
	mov	eax, DWORD PTR _cntxt$[ebp]
	push	eax
	call	_sql_get_table
	add	esp, 12					; 0000000cH
	test	eax, eax
	je	SHORT $L71367
$L71368:
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 1186		; 000004a2H
	jmp	$eva_err$71226
$L71367:

; 1190 : 			unsigned long c_col = pv->row ? 1 : 0;

	mov	edx, DWORD PTR _pv$[ebp]
	xor	eax, eax
	cmp	DWORD PTR [edx+200], 0
	setne	al
	mov	DWORD PTR _c_col$71369[ebp], eax

; 1191 : 			unsigned long c_val = (pv->row ? 1 : 0) + (pv->col ? 1 : 0);

	mov	ecx, DWORD PTR _pv$[ebp]
	xor	edx, edx
	cmp	DWORD PTR [ecx+200], 0
	setne	dl
	mov	eax, DWORD PTR _pv$[ebp]
	xor	ecx, ecx
	cmp	DWORD PTR [eax+204], 0
	setne	cl
	add	edx, ecx
	mov	DWORD PTR _c_val$71370[ebp], edx

; 1192 : 			int b_relrow = pv->row && !strcmp(pv->row->dispfmt, "_EVA_RELATION");

	mov	edx, DWORD PTR _pv$[ebp]
	cmp	DWORD PTR [edx+200], 0
	je	SHORT $L71677
	push	OFFSET FLAT:$SG71372
	mov	eax, DWORD PTR _pv$[ebp]
	mov	ecx, DWORD PTR [eax+200]
	mov	edx, DWORD PTR [ecx+304]
	push	edx
	call	_strcmp
	add	esp, 8
	test	eax, eax
	jne	SHORT $L71677
	mov	DWORD PTR -1244+[ebp], 1
	jmp	SHORT $L71678
$L71677:
	mov	DWORD PTR -1244+[ebp], 0
$L71678:
	mov	eax, DWORD PTR -1244+[ebp]
	mov	DWORD PTR _b_relrow$71371[ebp], eax

; 1193 : 			int b_relcol = pv->col && !strcmp(pv->col->dispfmt, "_EVA_RELATION");

	mov	ecx, DWORD PTR _pv$[ebp]
	cmp	DWORD PTR [ecx+204], 0
	je	SHORT $L71679
	push	OFFSET FLAT:$SG71374
	mov	edx, DWORD PTR _pv$[ebp]
	mov	eax, DWORD PTR [edx+204]
	mov	ecx, DWORD PTR [eax+304]
	push	ecx
	call	_strcmp
	add	esp, 8
	test	eax, eax
	jne	SHORT $L71679
	mov	DWORD PTR -1248+[ebp], 1
	jmp	SHORT $L71680
$L71679:
	mov	DWORD PTR -1248+[ebp], 0
$L71680:
	mov	edx, DWORD PTR -1248+[ebp]
	mov	DWORD PTR _b_relcol$71373[ebp], edx

; 1194 : 			for(i = 0; i < id_obj.nbrows; i++)

	mov	DWORD PTR _i$[ebp], 0
	jmp	SHORT $L71375
$L71376:
	mov	eax, DWORD PTR _i$[ebp]
	add	eax, 1
	mov	DWORD PTR _i$[ebp], eax
$L71375:
	mov	ecx, DWORD PTR _i$[ebp]
	cmp	ecx, DWORD PTR _id_obj$[ebp]
	jae	$L71377

; 1196 : 				/* Search for row & column value in labels */
; 1197 : 				unsigned long idrow = DYNTAB_TOULRC(&id_obj, i, 0);

	push	10					; 0000000aH
	push	0
	push	0
	mov	edx, DWORD PTR _i$[ebp]
	push	edx
	lea	eax, DWORD PTR _id_obj$[ebp]
	push	eax
	call	_dyntab_val
	add	esp, 12					; 0000000cH
	push	eax
	call	_strtoul
	add	esp, 12					; 0000000cH
	mov	DWORD PTR _idrow$71378[ebp], eax

; 1198 : 				unsigned long idcol = DYNTAB_TOULRC(&id_obj, i, c_col);

	push	10					; 0000000aH
	push	0
	mov	ecx, DWORD PTR _c_col$71369[ebp]
	push	ecx
	mov	edx, DWORD PTR _i$[ebp]
	push	edx
	lea	eax, DWORD PTR _id_obj$[ebp]
	push	eax
	call	_dyntab_val
	add	esp, 12					; 0000000cH
	push	eax
	call	_strtoul
	add	esp, 12					; 0000000cH
	mov	DWORD PTR _idcol$71380[ebp], eax

; 1199 : 				unsigned long irow = 0, icol = 0;

	mov	DWORD PTR _irow$71382[ebp], 0
	mov	DWORD PTR _icol$71383[ebp], 0

; 1200 : 				if(pv->row) for(irow = 0; irow < ROWCNT; irow++)

	mov	ecx, DWORD PTR _pv$[ebp]
	cmp	DWORD PTR [ecx+200], 0
	je	$L71387
	mov	DWORD PTR _irow$71382[ebp], 0
	jmp	SHORT $L71385
$L71386:
	mov	edx, DWORD PTR _irow$71382[ebp]
	add	edx, 1
	mov	DWORD PTR _irow$71382[ebp], edx
$L71385:
	mov	eax, DWORD PTR _pv$[ebp]
	cmp	DWORD PTR [eax+200], 0
	je	SHORT $L71681
	mov	ecx, DWORD PTR _pv$[ebp]
	mov	edx, DWORD PTR [ecx+200]
	mov	eax, DWORD PTR [edx+24]
	mov	DWORD PTR -1252+[ebp], eax
	jmp	SHORT $L71682
$L71681:
	mov	DWORD PTR -1252+[ebp], 0
$L71682:
	mov	ecx, DWORD PTR _irow$71382[ebp]
	cmp	ecx, DWORD PTR -1252+[ebp]
	jae	$L71387

; 1202 : 					if(b_relrow && idrow)

	cmp	DWORD PTR _b_relrow$71371[ebp], 0
	je	SHORT $L71388
	cmp	DWORD PTR _idrow$71378[ebp], 0
	je	SHORT $L71388

; 1204 : 						DynTableCell *c =  dyntab_cell(&pv->row->labels, irow, 0);

	push	0
	mov	edx, DWORD PTR _irow$71382[ebp]
	push	edx
	mov	eax, DWORD PTR _pv$[ebp]
	mov	ecx, DWORD PTR [eax+200]
	add	ecx, 24					; 00000018H
	push	ecx
	call	_dyntab_cell
	add	esp, 12					; 0000000cH
	mov	DWORD PTR _c$71389[ebp], eax

; 1205 : 						if(idrow == (c->IdValObj ? c->IdValObj : c->IdObj)) break;

	mov	edx, DWORD PTR _c$71389[ebp]
	cmp	DWORD PTR [edx+24], 0
	je	SHORT $L71683
	mov	eax, DWORD PTR _c$71389[ebp]
	mov	ecx, DWORD PTR [eax+24]
	mov	DWORD PTR -1256+[ebp], ecx
	jmp	SHORT $L71684
$L71683:
	mov	edx, DWORD PTR _c$71389[ebp]
	mov	eax, DWORD PTR [edx+20]
	mov	DWORD PTR -1256+[ebp], eax
$L71684:
	mov	ecx, DWORD PTR _idrow$71378[ebp]
	cmp	ecx, DWORD PTR -1256+[ebp]
	jne	SHORT $L71390
	jmp	SHORT $L71387
$L71390:

; 1207 : 					else if(!dyntab_cmp(&pv->row->labels, irow, 0, &id_obj, i, 0)) break;

	jmp	SHORT $L71392
$L71388:
	push	0
	mov	edx, DWORD PTR _i$[ebp]
	push	edx
	lea	eax, DWORD PTR _id_obj$[ebp]
	push	eax
	push	0
	mov	ecx, DWORD PTR _irow$71382[ebp]
	push	ecx
	mov	edx, DWORD PTR _pv$[ebp]
	mov	eax, DWORD PTR [edx+200]
	add	eax, 24					; 00000018H
	push	eax
	call	_dyntab_cmp
	add	esp, 24					; 00000018H
	test	eax, eax
	jne	SHORT $L71392
	jmp	SHORT $L71387
$L71392:

; 1208 : 				}

	jmp	$L71386
$L71387:

; 1209 : 				if(pv->col) for(icol = 0; icol <  COLCNT; icol++)

	mov	ecx, DWORD PTR _pv$[ebp]
	cmp	DWORD PTR [ecx+204], 0
	je	$L71396
	mov	DWORD PTR _icol$71383[ebp], 0
	jmp	SHORT $L71394
$L71395:
	mov	edx, DWORD PTR _icol$71383[ebp]
	add	edx, 1
	mov	DWORD PTR _icol$71383[ebp], edx
$L71394:
	mov	eax, DWORD PTR _pv$[ebp]
	cmp	DWORD PTR [eax+204], 0
	je	SHORT $L71685
	mov	ecx, DWORD PTR _pv$[ebp]
	mov	edx, DWORD PTR [ecx+204]
	mov	eax, DWORD PTR [edx+24]
	mov	DWORD PTR -1260+[ebp], eax
	jmp	SHORT $L71686
$L71685:
	mov	DWORD PTR -1260+[ebp], 0
$L71686:
	mov	ecx, DWORD PTR _icol$71383[ebp]
	cmp	ecx, DWORD PTR -1260+[ebp]
	jae	$L71396

; 1211 : 					if(b_relcol && idcol)

	cmp	DWORD PTR _b_relcol$71373[ebp], 0
	je	SHORT $L71397
	cmp	DWORD PTR _idcol$71380[ebp], 0
	je	SHORT $L71397

; 1213 : 						DynTableCell *c =  dyntab_cell(&pv->col->labels, icol, 0);

	push	0
	mov	edx, DWORD PTR _icol$71383[ebp]
	push	edx
	mov	eax, DWORD PTR _pv$[ebp]
	mov	ecx, DWORD PTR [eax+204]
	add	ecx, 24					; 00000018H
	push	ecx
	call	_dyntab_cell
	add	esp, 12					; 0000000cH
	mov	DWORD PTR _c$71398[ebp], eax

; 1214 : 						if(idcol == (c->IdValObj ? c->IdValObj : c->IdObj)) break;

	mov	edx, DWORD PTR _c$71398[ebp]
	cmp	DWORD PTR [edx+24], 0
	je	SHORT $L71687
	mov	eax, DWORD PTR _c$71398[ebp]
	mov	ecx, DWORD PTR [eax+24]
	mov	DWORD PTR -1264+[ebp], ecx
	jmp	SHORT $L71688
$L71687:
	mov	edx, DWORD PTR _c$71398[ebp]
	mov	eax, DWORD PTR [edx+20]
	mov	DWORD PTR -1264+[ebp], eax
$L71688:
	mov	ecx, DWORD PTR _idcol$71380[ebp]
	cmp	ecx, DWORD PTR -1264+[ebp]
	jne	SHORT $L71399
	jmp	SHORT $L71396
$L71399:

; 1216 : 					else if(!dyntab_cmp(&pv->col->labels, icol, 0, &id_obj, i, c_col)) break;

	jmp	SHORT $L71401
$L71397:
	mov	edx, DWORD PTR _c_col$71369[ebp]
	push	edx
	mov	eax, DWORD PTR _i$[ebp]
	push	eax
	lea	ecx, DWORD PTR _id_obj$[ebp]
	push	ecx
	push	0
	mov	edx, DWORD PTR _icol$71383[ebp]
	push	edx
	mov	eax, DWORD PTR _pv$[ebp]
	mov	ecx, DWORD PTR [eax+204]
	add	ecx, 24					; 00000018H
	push	ecx
	call	_dyntab_cmp
	add	esp, 24					; 00000018H
	test	eax, eax
	jne	SHORT $L71401
	jmp	SHORT $L71396
$L71401:

; 1217 : 				}

	jmp	$L71395
$L71396:

; 1218 : 
; 1219 : 				/* Set corresponding cell */
; 1220 : 				if(pivottable_set_cellval(cntxt, pv, irow, icol, &id_obj, i, c_val)) STACK_ERROR;

	mov	edx, DWORD PTR _c_val$71370[ebp]
	push	edx
	mov	eax, DWORD PTR _i$[ebp]
	push	eax
	lea	ecx, DWORD PTR _id_obj$[ebp]
	push	ecx
	mov	edx, DWORD PTR _icol$71383[ebp]
	push	edx
	mov	eax, DWORD PTR _irow$71382[ebp]
	push	eax
	mov	ecx, DWORD PTR _pv$[ebp]
	push	ecx
	mov	edx, DWORD PTR _cntxt$[ebp]
	push	edx
	call	_pivottable_set_cellval
	add	esp, 28					; 0000001cH
	test	eax, eax
	je	SHORT $L71402
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 1220		; 000004c4H
	jmp	$eva_err$71226
$L71402:

; 1221 : 			}

	jmp	$L71376
$L71377:

; 1227 : 		double grandtot = atof(dyntab_val(pv->res, ROWCNT, COLCNT));

	mov	ecx, DWORD PTR _pv$[ebp]
	cmp	DWORD PTR [ecx+204], 0
	je	SHORT $L71689
	mov	edx, DWORD PTR _pv$[ebp]
	mov	eax, DWORD PTR [edx+204]
	mov	ecx, DWORD PTR [eax+24]
	mov	DWORD PTR -1268+[ebp], ecx
	jmp	SHORT $L71690
$L71689:
	mov	DWORD PTR -1268+[ebp], 0
$L71690:
	mov	edx, DWORD PTR _pv$[ebp]
	cmp	DWORD PTR [edx+200], 0
	je	SHORT $L71691
	mov	eax, DWORD PTR _pv$[ebp]
	mov	ecx, DWORD PTR [eax+200]
	mov	edx, DWORD PTR [ecx+24]
	mov	DWORD PTR -1272+[ebp], edx
	jmp	SHORT $L71692
$L71691:
	mov	DWORD PTR -1272+[ebp], 0
$L71692:
	mov	eax, DWORD PTR -1268+[ebp]
	push	eax
	mov	ecx, DWORD PTR -1272+[ebp]
	push	ecx
	mov	edx, DWORD PTR _pv$[ebp]
	mov	eax, DWORD PTR [edx+212]
	push	eax
	call	_dyntab_val
	add	esp, 12					; 0000000cH
	push	eax
	call	_atof
	add	esp, 4
	fstp	QWORD PTR _grandtot$71403[ebp]

; 1228 : 		int b_pc_all = pv->data && !strcmp(dyntab_val(&pv->data->percent, 0, 0), "_EVA_SINGLE");

	mov	ecx, DWORD PTR _pv$[ebp]
	cmp	DWORD PTR [ecx+208], 0
	je	SHORT $L71693
	push	OFFSET FLAT:$SG71405
	push	0
	push	0
	mov	edx, DWORD PTR _pv$[ebp]
	mov	eax, DWORD PTR [edx+208]
	add	eax, 164				; 000000a4H
	push	eax
	call	_dyntab_val
	add	esp, 12					; 0000000cH
	push	eax
	call	_strcmp
	add	esp, 8
	test	eax, eax
	jne	SHORT $L71693
	mov	DWORD PTR -1276+[ebp], 1
	jmp	SHORT $L71694
$L71693:
	mov	DWORD PTR -1276+[ebp], 0
$L71694:
	mov	ecx, DWORD PTR -1276+[ebp]
	mov	DWORD PTR _b_pc_all$71404[ebp], ecx

; 1229 : 		int b_pc_row = pv->data && pv->row && !strcmp(dyntab_val(&pv->data->percent, 0, 0), "_EVA_ROW");

	mov	edx, DWORD PTR _pv$[ebp]
	cmp	DWORD PTR [edx+208], 0
	je	SHORT $L71695
	mov	eax, DWORD PTR _pv$[ebp]
	cmp	DWORD PTR [eax+200], 0
	je	SHORT $L71695
	push	OFFSET FLAT:$SG71407
	push	0
	push	0
	mov	ecx, DWORD PTR _pv$[ebp]
	mov	edx, DWORD PTR [ecx+208]
	add	edx, 164				; 000000a4H
	push	edx
	call	_dyntab_val
	add	esp, 12					; 0000000cH
	push	eax
	call	_strcmp
	add	esp, 8
	test	eax, eax
	jne	SHORT $L71695
	mov	DWORD PTR -1280+[ebp], 1
	jmp	SHORT $L71696
$L71695:
	mov	DWORD PTR -1280+[ebp], 0
$L71696:
	mov	eax, DWORD PTR -1280+[ebp]
	mov	DWORD PTR _b_pc_row$71406[ebp], eax

; 1230 : 		int b_pc_col = pv->data && pv->col && !strcmp(dyntab_val(&pv->data->percent, 0, 0), "_EVA_COL");

	mov	ecx, DWORD PTR _pv$[ebp]
	cmp	DWORD PTR [ecx+208], 0
	je	SHORT $L71697
	mov	edx, DWORD PTR _pv$[ebp]
	cmp	DWORD PTR [edx+204], 0
	je	SHORT $L71697
	push	OFFSET FLAT:$SG71409
	push	0
	push	0
	mov	eax, DWORD PTR _pv$[ebp]
	mov	ecx, DWORD PTR [eax+208]
	add	ecx, 164				; 000000a4H
	push	ecx
	call	_dyntab_val
	add	esp, 12					; 0000000cH
	push	eax
	call	_strcmp
	add	esp, 8
	test	eax, eax
	jne	SHORT $L71697
	mov	DWORD PTR -1284+[ebp], 1
	jmp	SHORT $L71698
$L71697:
	mov	DWORD PTR -1284+[ebp], 0
$L71698:
	mov	edx, DWORD PTR -1284+[ebp]
	mov	DWORD PTR _b_pc_col$71408[ebp], edx

; 1231 : 		if(pv->row && pivottablefield_add_total(cntxt, pv, pv->row, grandtot)) STACK_ERROR;

	mov	eax, DWORD PTR _pv$[ebp]
	cmp	DWORD PTR [eax+200], 0
	je	SHORT $L71410
	mov	ecx, DWORD PTR _grandtot$71403[ebp+4]
	push	ecx
	mov	edx, DWORD PTR _grandtot$71403[ebp]
	push	edx
	mov	eax, DWORD PTR _pv$[ebp]
	mov	ecx, DWORD PTR [eax+200]
	push	ecx
	mov	edx, DWORD PTR _pv$[ebp]
	push	edx
	mov	eax, DWORD PTR _cntxt$[ebp]
	push	eax
	call	_pivottablefield_add_total
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L71410
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 1231		; 000004cfH
	jmp	$eva_err$71226
$L71410:

; 1232 : 		if(pv->col && pivottablefield_add_total(cntxt, pv, pv->col, grandtot)) STACK_ERROR;

	mov	edx, DWORD PTR _pv$[ebp]
	cmp	DWORD PTR [edx+204], 0
	je	SHORT $L71411
	mov	eax, DWORD PTR _grandtot$71403[ebp+4]
	push	eax
	mov	ecx, DWORD PTR _grandtot$71403[ebp]
	push	ecx
	mov	edx, DWORD PTR _pv$[ebp]
	mov	eax, DWORD PTR [edx+204]
	push	eax
	mov	ecx, DWORD PTR _pv$[ebp]
	push	ecx
	mov	edx, DWORD PTR _cntxt$[ebp]
	push	edx
	call	_pivottablefield_add_total
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L71411
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 1232		; 000004d0H
	jmp	$eva_err$71226
$L71411:

; 1233 : 
; 1234 : 		/* Percent displayed : replace values in result */
; 1235 : 		if(b_pc_all || b_pc_row || b_pc_col)

	cmp	DWORD PTR _b_pc_all$71404[ebp], 0
	jne	SHORT $L71413
	cmp	DWORD PTR _b_pc_row$71406[ebp], 0
	jne	SHORT $L71413
	cmp	DWORD PTR _b_pc_col$71408[ebp], 0
	je	$L71416
$L71413:

; 1237 : 			for(i = 0; !i || i < ROWCNT; i++)

	mov	DWORD PTR _i$[ebp], 0
	jmp	SHORT $L71414
$L71415:
	mov	ecx, DWORD PTR _i$[ebp]
	add	ecx, 1
	mov	DWORD PTR _i$[ebp], ecx
$L71414:
	cmp	DWORD PTR _i$[ebp], 0
	je	SHORT $L71417
	mov	edx, DWORD PTR _pv$[ebp]
	cmp	DWORD PTR [edx+200], 0
	je	SHORT $L71699
	mov	eax, DWORD PTR _pv$[ebp]
	mov	ecx, DWORD PTR [eax+200]
	mov	edx, DWORD PTR [ecx+24]
	mov	DWORD PTR -1288+[ebp], edx
	jmp	SHORT $L71700
$L71699:
	mov	DWORD PTR -1288+[ebp], 0
$L71700:
	mov	eax, DWORD PTR _i$[ebp]
	cmp	eax, DWORD PTR -1288+[ebp]
	jae	$L71416
$L71417:

; 1238 : 				for(j = 0; !j || j < COLCNT; j++)

	mov	DWORD PTR _j$[ebp], 0
	jmp	SHORT $L71418
$L71419:
	mov	ecx, DWORD PTR _j$[ebp]
	add	ecx, 1
	mov	DWORD PTR _j$[ebp], ecx
$L71418:
	cmp	DWORD PTR _j$[ebp], 0
	je	SHORT $L71421
	mov	edx, DWORD PTR _pv$[ebp]
	cmp	DWORD PTR [edx+204], 0
	je	SHORT $L71701
	mov	eax, DWORD PTR _pv$[ebp]
	mov	ecx, DWORD PTR [eax+204]
	mov	edx, DWORD PTR [ecx+24]
	mov	DWORD PTR -1292+[ebp], edx
	jmp	SHORT $L71702
$L71701:
	mov	DWORD PTR -1292+[ebp], 0
$L71702:
	mov	eax, DWORD PTR _j$[ebp]
	cmp	eax, DWORD PTR -1292+[ebp]
	jae	$L71420
$L71421:

; 1239 : 					if(dyntab_sz(pv->res, i, j))

	mov	ecx, DWORD PTR _j$[ebp]
	push	ecx
	mov	edx, DWORD PTR _i$[ebp]
	push	edx
	mov	eax, DWORD PTR _pv$[ebp]
	mov	ecx, DWORD PTR [eax+212]
	push	ecx
	call	_dyntab_sz
	add	esp, 12					; 0000000cH
	test	eax, eax
	je	$L71427

; 1241 : 						double v = atof(dyntab_val(pv->res, i, j));

	mov	edx, DWORD PTR _j$[ebp]
	push	edx
	mov	eax, DWORD PTR _i$[ebp]
	push	eax
	mov	ecx, DWORD PTR _pv$[ebp]
	mov	edx, DWORD PTR [ecx+212]
	push	edx
	call	_dyntab_val
	add	esp, 12					; 0000000cH
	push	eax
	call	_atof
	add	esp, 4
	fstp	QWORD PTR _v$71423[ebp]

; 1242 : 						double b = b_pc_all ? grandtot : b_pc_row ? atof(dyntab_val(&pv->row->labels, i, 1)) : atof(dyntab_val(&pv->col->labels, j, 1));

	cmp	DWORD PTR _b_pc_all$71404[ebp], 0
	je	SHORT $L71705
	mov	eax, DWORD PTR _grandtot$71403[ebp]
	mov	DWORD PTR -1300+[ebp], eax
	mov	ecx, DWORD PTR _grandtot$71403[ebp+4]
	mov	DWORD PTR -1300+[ebp+4], ecx
	jmp	SHORT $L71706
$L71705:
	cmp	DWORD PTR _b_pc_row$71406[ebp], 0
	je	SHORT $L71703
	push	1
	mov	edx, DWORD PTR _i$[ebp]
	push	edx
	mov	eax, DWORD PTR _pv$[ebp]
	mov	ecx, DWORD PTR [eax+200]
	add	ecx, 24					; 00000018H
	push	ecx
	call	_dyntab_val
	add	esp, 12					; 0000000cH
	push	eax
	call	_atof
	add	esp, 4
	fstp	QWORD PTR -1308+[ebp]
	jmp	SHORT $L71704
$L71703:
	push	1
	mov	edx, DWORD PTR _j$[ebp]
	push	edx
	mov	eax, DWORD PTR _pv$[ebp]
	mov	ecx, DWORD PTR [eax+204]
	add	ecx, 24					; 00000018H
	push	ecx
	call	_dyntab_val
	add	esp, 12					; 0000000cH
	push	eax
	call	_atof
	add	esp, 4
	fstp	QWORD PTR -1308+[ebp]
$L71704:
	mov	edx, DWORD PTR -1308+[ebp]
	mov	DWORD PTR -1300+[ebp], edx
	mov	eax, DWORD PTR -1308+[ebp+4]
	mov	DWORD PTR -1300+[ebp+4], eax
$L71706:
	mov	ecx, DWORD PTR -1300+[ebp]
	mov	DWORD PTR _b$71424[ebp], ecx
	mov	edx, DWORD PTR -1300+[ebp+4]
	mov	DWORD PTR _b$71424[ebp+4], edx

; 1243 : 						char p[32];
; 1244 : 						DYNTAB_ADD(pv->res, i, j, p, snprintf(add_sz_str(p), "%.1lf%%", 100.0 * v / b), NO_CONV);

	push	0
	push	0
	fld	QWORD PTR __real@8@4005c800000000000000
	fmul	QWORD PTR _v$71423[ebp]
	fdiv	QWORD PTR _b$71424[ebp]
	sub	esp, 8
	fstp	QWORD PTR [esp]
	push	OFFSET FLAT:$SG71428
	push	31					; 0000001fH
	lea	eax, DWORD PTR _p$71425[ebp]
	push	eax
	call	__snprintf
	add	esp, 20					; 00000014H
	push	eax
	lea	ecx, DWORD PTR _p$71425[ebp]
	push	ecx
	mov	edx, DWORD PTR _j$[ebp]
	push	edx
	mov	eax, DWORD PTR _i$[ebp]
	push	eax
	mov	ecx, DWORD PTR _pv$[ebp]
	mov	edx, DWORD PTR [ecx+212]
	push	edx
	call	_dyntab_add
	add	esp, 28					; 0000001cH
	test	eax, eax
	je	SHORT $L71427
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29872], OFFSET FLAT:$SG71430
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 1244		; 000004dcH
	jmp	SHORT $eva_err$71226
$L71427:

; 1246 : 		}

	jmp	$L71419
$L71420:
	jmp	$L71415
$L71416:
$eva_noerr$71230:

; 1248 : 	RETURN_OK_CLEANUP;

	push	0
	push	OFFSET FLAT:$SG71431
	push	OFFSET FLAT:$SG71432
	mov	edx, DWORD PTR _cntxt$[ebp]
	push	edx
	call	_err_clear
	add	esp, 16					; 00000010H
$eva_err$71226:
	mov	eax, DWORD PTR _cntxt$[ebp]
	cmp	DWORD PTR [eax+29872], 0
	je	SHORT $L71433
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	edx, DWORD PTR [ecx+29900]
	push	edx
	push	OFFSET FLAT:$SG71434
	push	OFFSET FLAT:$SG71435
	mov	eax, DWORD PTR _cntxt$[ebp]
	push	eax
	call	_err_add_context
	add	esp, 16					; 00000010H
$L71433:
	lea	ecx, DWORD PTR _id_obj$[ebp]
	push	ecx
	call	_dyntab_free
	add	esp, 4
	mov	edx, DWORD PTR _sql$[ebp]
	push	edx
	call	_mem_free
	add	esp, 4
	mov	DWORD PTR _sql$[ebp], 0
	mov	eax, DWORD PTR _cntxt$[ebp]
	xor	ecx, ecx
	cmp	DWORD PTR [eax+29872], 0
	setne	cl
	mov	eax, ecx

; 1249 : }

	mov	esp, ebp
	pop	ebp
	ret	0
_pivottable_calc_single ENDP
_TEXT	ENDS
PUBLIC	_pivottable_calc
EXTRN	_plain_to_html:BYTE
_DATA	SEGMENT
	ORG $+1
$SG71470 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG71471 DB	'D:\Travail\ABI\EVA\V4.0\CGI\Brunix-2016\pivottable.c', 00H
	ORG $+3
$SG71472 DB	'pivottable_calc', 00H
$SG71480 DB	'D:\Travail\ABI\EVA\V4.0\CGI\Brunix-2016\pivottable.c', 00H
	ORG $+3
$SG71481 DB	'pivottable_calc', 00H
$SG71483 DB	'D:\Travail\ABI\EVA\V4.0\CGI\Brunix-2016\pivottable.c', 00H
	ORG $+3
$SG71484 DB	'pivottable_calc', 00H
_DATA	ENDS
_TEXT	SEGMENT
_cntxt$ = 8
_pv$ = 12
_irow$ = -8
_icol$ = -4
_idata$ = -16
_i$ = -12
_pivottable_calc PROC NEAR

; 1262 : ){

	push	ebp
	mov	ebp, esp
	sub	esp, 28					; 0000001cH

; 1263 : 	unsigned long irow, icol, idata, i;
; 1264 : 
; 1265 : 	/* Check params */
; 1266 : 	if(!pv) return 0;

	cmp	DWORD PTR _pv$[ebp], 0
	jne	SHORT $L71448
	xor	eax, eax
	jmp	$L71443
$L71448:

; 1267 : 
; 1268 : 	/* Build selected objects list */
; 1269 : 	if(pivottable_select(cntxt, pv)) STACK_ERROR;

	mov	eax, DWORD PTR _pv$[ebp]
	push	eax
	mov	ecx, DWORD PTR _cntxt$[ebp]
	push	ecx
	call	_pivottable_select
	add	esp, 8
	test	eax, eax
	je	SHORT $L71449
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 1269		; 000004f5H
	jmp	$eva_err$71450
$L71449:

; 1270 : 
; 1271 : 	/* Loop on data, rows & columns */
; 1272 : 	if(!pv->b_empty) for(idata = 0; !idata || idata < pv->nbdata; idata++)

	mov	eax, DWORD PTR _pv$[ebp]
	cmp	DWORD PTR [eax+94224], 0
	jne	$eva_noerr$71479
	mov	DWORD PTR _idata$[ebp], 0
	jmp	SHORT $L71452
$L71453:
	mov	ecx, DWORD PTR _idata$[ebp]
	add	ecx, 1
	mov	DWORD PTR _idata$[ebp], ecx
$L71452:
	cmp	DWORD PTR _idata$[ebp], 0
	je	SHORT $L71455
	mov	edx, DWORD PTR _pv$[ebp]
	mov	eax, DWORD PTR _idata$[ebp]
	cmp	eax, DWORD PTR [edx+94112]
	jae	$eva_noerr$71479
$L71455:

; 1274 : 		pv->data = pv->nbdata ? pv->datas + idata : NULL;

	mov	ecx, DWORD PTR _pv$[ebp]
	cmp	DWORD PTR [ecx+94112], 0
	je	SHORT $L71708
	mov	edx, DWORD PTR _idata$[ebp]
	imul	edx, 616				; 00000268H
	mov	eax, DWORD PTR _pv$[ebp]
	lea	ecx, DWORD PTR [eax+edx+81792]
	mov	DWORD PTR -20+[ebp], ecx
	jmp	SHORT $L71709
$L71708:
	mov	DWORD PTR -20+[ebp], 0
$L71709:
	mov	edx, DWORD PTR _pv$[ebp]
	mov	eax, DWORD PTR -20+[ebp]
	mov	DWORD PTR [edx+208], eax

; 1275 : 		for(irow = 0; !irow || irow < pv->nbrow; irow++)

	mov	DWORD PTR _irow$[ebp], 0
	jmp	SHORT $L71457
$L71458:
	mov	ecx, DWORD PTR _irow$[ebp]
	add	ecx, 1
	mov	DWORD PTR _irow$[ebp], ecx
$L71457:
	cmp	DWORD PTR _irow$[ebp], 0
	je	SHORT $L71460
	mov	edx, DWORD PTR _pv$[ebp]
	mov	eax, DWORD PTR _irow$[ebp]
	cmp	eax, DWORD PTR [edx+78696]
	jae	$L71459
$L71460:

; 1277 : 			pv->row = pv->nbrow ? pv->rows + irow : NULL;

	mov	ecx, DWORD PTR _pv$[ebp]
	cmp	DWORD PTR [ecx+78696], 0
	je	SHORT $L71710
	mov	edx, DWORD PTR _irow$[ebp]
	imul	edx, 616				; 00000268H
	mov	eax, DWORD PTR _pv$[ebp]
	lea	ecx, DWORD PTR [eax+edx+60216]
	mov	DWORD PTR -24+[ebp], ecx
	jmp	SHORT $L71711
$L71710:
	mov	DWORD PTR -24+[ebp], 0
$L71711:
	mov	edx, DWORD PTR _pv$[ebp]
	mov	eax, DWORD PTR -24+[ebp]
	mov	DWORD PTR [edx+200], eax

; 1278 : 			for(icol = 0; !icol || icol < pv->nbcol; icol++)

	mov	DWORD PTR _icol$[ebp], 0
	jmp	SHORT $L71462
$L71463:
	mov	ecx, DWORD PTR _icol$[ebp]
	add	ecx, 1
	mov	DWORD PTR _icol$[ebp], ecx
$L71462:
	cmp	DWORD PTR _icol$[ebp], 0
	je	SHORT $L71465
	mov	edx, DWORD PTR _pv$[ebp]
	mov	eax, DWORD PTR _icol$[ebp]
	cmp	eax, DWORD PTR [edx+81784]
	jae	$L71464
$L71465:

; 1280 : 				pv->col = pv->nbcol ? pv->cols + icol : NULL;

	mov	ecx, DWORD PTR _pv$[ebp]
	cmp	DWORD PTR [ecx+81784], 0
	je	SHORT $L71712
	mov	edx, DWORD PTR _icol$[ebp]
	imul	edx, 616				; 00000268H
	mov	eax, DWORD PTR _pv$[ebp]
	lea	ecx, DWORD PTR [eax+edx+78704]
	mov	DWORD PTR -28+[ebp], ecx
	jmp	SHORT $L71713
$L71712:
	mov	DWORD PTR -28+[ebp], 0
$L71713:
	mov	edx, DWORD PTR _pv$[ebp]
	mov	eax, DWORD PTR -28+[ebp]
	mov	DWORD PTR [edx+204], eax

; 1281 : 				pv->res = &pv->restbl[idata][irow][icol];

	mov	ecx, DWORD PTR _idata$[ebp]
	imul	ecx, 3000				; 00000bb8H
	mov	edx, DWORD PTR _pv$[ebp]
	lea	eax, DWORD PTR [edx+ecx+216]
	mov	ecx, DWORD PTR _irow$[ebp]
	imul	ecx, 100				; 00000064H
	add	eax, ecx
	mov	edx, DWORD PTR _icol$[ebp]
	imul	edx, 20					; 00000014H
	add	eax, edx
	mov	ecx, DWORD PTR _pv$[ebp]
	mov	DWORD PTR [ecx+212], eax

; 1282 : 
; 1283 : 				/* Clean pivot table temp data & call calc function */
; 1284 : 				M_FREE(pv->select);

	mov	edx, DWORD PTR _pv$[ebp]
	mov	eax, DWORD PTR [edx+94204]
	push	eax
	call	_mem_free
	add	esp, 4
	mov	ecx, DWORD PTR _pv$[ebp]
	mov	DWORD PTR [ecx+94204], 0

; 1285 : 				M_FREE(pv->join);

	mov	edx, DWORD PTR _pv$[ebp]
	mov	eax, DWORD PTR [edx+94208]
	push	eax
	call	_mem_free
	add	esp, 4
	mov	ecx, DWORD PTR _pv$[ebp]
	mov	DWORD PTR [ecx+94208], 0

; 1286 : 				M_FREE(pv->where);

	mov	edx, DWORD PTR _pv$[ebp]
	mov	eax, DWORD PTR [edx+94212]
	push	eax
	call	_mem_free
	add	esp, 4
	mov	ecx, DWORD PTR _pv$[ebp]
	mov	DWORD PTR [ecx+94212], 0

; 1287 : 				M_FREE(pv->group);

	mov	edx, DWORD PTR _pv$[ebp]
	mov	eax, DWORD PTR [edx+94216]
	push	eax
	call	_mem_free
	add	esp, 4
	mov	ecx, DWORD PTR _pv$[ebp]
	mov	DWORD PTR [ecx+94216], 0

; 1288 : 				if(pivottable_calc_single(cntxt, pv))

	mov	edx, DWORD PTR _pv$[ebp]
	push	edx
	mov	eax, DWORD PTR _cntxt$[ebp]
	push	eax
	call	_pivottable_calc_single
	add	esp, 8
	test	eax, eax
	je	SHORT $L71467

; 1290 : 					/* Display error in pivot table result */
; 1291 : 					DYNTAB_ADD(pv->res, 0, 0, cntxt->err.text, 0, TO_HTML);

	push	1
	push	OFFSET FLAT:_plain_to_html
	push	0
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	edx, DWORD PTR [ecx+29872]
	push	edx
	push	0
	push	0
	mov	eax, DWORD PTR _pv$[ebp]
	mov	ecx, DWORD PTR [eax+212]
	push	ecx
	call	_dyntab_add
	add	esp, 28					; 0000001cH
	test	eax, eax
	je	SHORT $L71468
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29872], OFFSET FLAT:$SG71470
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 1291		; 0000050bH
	jmp	$eva_err$71450
$L71468:

; 1292 : 					CLEAR_ERROR;

	push	1292					; 0000050cH
	push	OFFSET FLAT:$SG71471
	push	OFFSET FLAT:$SG71472
	mov	ecx, DWORD PTR _cntxt$[ebp]
	push	ecx
	call	_err_clear
	add	esp, 16					; 00000010H
$L71467:

; 1294 : 			}

	jmp	$L71463
$L71464:

; 1295 : 		}

	jmp	$L71458
$L71459:

; 1296 : 
; 1297 : 		/* Reset optimization status for row & col fields */
; 1298 : 		for(i = 0; i < pv->nbcol; i++) pv->cols[i].b_done = 0;

	mov	DWORD PTR _i$[ebp], 0
	jmp	SHORT $L71473
$L71474:
	mov	edx, DWORD PTR _i$[ebp]
	add	edx, 1
	mov	DWORD PTR _i$[ebp], edx
$L71473:
	mov	eax, DWORD PTR _pv$[ebp]
	mov	ecx, DWORD PTR _i$[ebp]
	cmp	ecx, DWORD PTR [eax+81784]
	jae	SHORT $L71475
	mov	edx, DWORD PTR _i$[ebp]
	imul	edx, 616				; 00000268H
	mov	eax, DWORD PTR _pv$[ebp]
	mov	DWORD PTR [eax+edx+78980], 0
	jmp	SHORT $L71474
$L71475:

; 1299 : 		for(i = 0; i < pv->nbrow; i++) pv->rows[i].b_done = 0;

	mov	DWORD PTR _i$[ebp], 0
	jmp	SHORT $L71476
$L71477:
	mov	ecx, DWORD PTR _i$[ebp]
	add	ecx, 1
	mov	DWORD PTR _i$[ebp], ecx
$L71476:
	mov	edx, DWORD PTR _pv$[ebp]
	mov	eax, DWORD PTR _i$[ebp]
	cmp	eax, DWORD PTR [edx+78696]
	jae	SHORT $L71478
	mov	ecx, DWORD PTR _i$[ebp]
	imul	ecx, 616				; 00000268H
	mov	edx, DWORD PTR _pv$[ebp]
	mov	DWORD PTR [edx+ecx+60492], 0
	jmp	SHORT $L71477
$L71478:

; 1300 : 	}

	jmp	$L71453
$eva_noerr$71479:

; 1301 : 
; 1302 : 	RETURN_OK_CLEANUP;

	push	0
	push	OFFSET FLAT:$SG71480
	push	OFFSET FLAT:$SG71481
	mov	eax, DWORD PTR _cntxt$[ebp]
	push	eax
	call	_err_clear
	add	esp, 16					; 00000010H
$eva_err$71450:
	mov	ecx, DWORD PTR _cntxt$[ebp]
	cmp	DWORD PTR [ecx+29872], 0
	je	SHORT $L71482
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	eax, DWORD PTR [edx+29900]
	push	eax
	push	OFFSET FLAT:$SG71483
	push	OFFSET FLAT:$SG71484
	mov	ecx, DWORD PTR _cntxt$[ebp]
	push	ecx
	call	_err_add_context
	add	esp, 16					; 00000010H
$L71482:
	mov	edx, DWORD PTR _cntxt$[ebp]
	xor	eax, eax
	cmp	DWORD PTR [edx+29872], 0
	setne	al
$L71443:

; 1303 : }

	mov	esp, ebp
	pop	ebp
	ret	0
_pivottable_calc ENDP
_TEXT	ENDS
END
