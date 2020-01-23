	TITLE	D:\Travail\ABI\EVA\V4.0\CGI\Brunix-2016\dyntab_sort.c
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
PUBLIC	_qsort_ctrlval
PUBLIC	_dyntab_order_lines
PUBLIC	_dyntab_sort
EXTRN	_dyntab_sz:NEAR
EXTRN	_dyntab_cell:NEAR
EXTRN	_dyntab_moveto:NEAR
EXTRN	_dyntab_copy:NEAR
_TEXT	SEGMENT
_tab$ = 8
_val$ = -4
_res$ = -32
_i$ = -44
_j$ = -48
_line$ = -12
_lines$ = -40
_nbrows$ = -8
_b_reorder$ = -36
_dyntab_order_lines PROC NEAR

; 22   : ){

	push	ebp
	mov	ebp, esp
	sub	esp, 60					; 0000003cH

; 23   : 	DynTableCell *val;
; 24   : 	DynTable res = {0};

	mov	DWORD PTR _res$[ebp], 0
	xor	eax, eax
	mov	DWORD PTR _res$[ebp+4], eax
	mov	DWORD PTR _res$[ebp+8], eax
	mov	DWORD PTR _res$[ebp+12], eax
	mov	DWORD PTR _res$[ebp+16], eax

; 25   : 	unsigned long i, j, line, lines = 0, nbrows = tab ? tab->nbrows : 0;

	mov	DWORD PTR _lines$[ebp], 0
	cmp	DWORD PTR _tab$[ebp], 0
	je	SHORT $L70610
	mov	ecx, DWORD PTR _tab$[ebp]
	mov	edx, DWORD PTR [ecx]
	mov	DWORD PTR -52+[ebp], edx
	jmp	SHORT $L70611
$L70610:
	mov	DWORD PTR -52+[ebp], 0
$L70611:
	mov	eax, DWORD PTR -52+[ebp]
	mov	DWORD PTR _nbrows$[ebp], eax

; 26   : 	int b_reorder = 0;

	mov	DWORD PTR _b_reorder$[ebp], 0

; 27   : 
; 28   : 	/* Get maximum line index in table */
; 29   : 	if(!nbrows) return 0;

	cmp	DWORD PTR _nbrows$[ebp], 0
	jne	SHORT $L70212
	xor	eax, eax
	jmp	$L70203
$L70212:

; 30   : 	dyntab_sort(tab, qsort_ctrlval);

	push	OFFSET FLAT:_qsort_ctrlval
	mov	ecx, DWORD PTR _tab$[ebp]
	push	ecx
	call	_dyntab_sort
	add	esp, 8

; 31   : 	for(i = 0; i < nbrows; i++)

	mov	DWORD PTR _i$[ebp], 0
	jmp	SHORT $L70213
$L70214:
	mov	edx, DWORD PTR _i$[ebp]
	add	edx, 1
	mov	DWORD PTR _i$[ebp], edx
$L70213:
	mov	eax, DWORD PTR _i$[ebp]
	cmp	eax, DWORD PTR _nbrows$[ebp]
	jae	SHORT $L70215

; 33   : 		val = dyntab_cell(tab, i, 0);

	push	0
	mov	ecx, DWORD PTR _i$[ebp]
	push	ecx
	mov	edx, DWORD PTR _tab$[ebp]
	push	edx
	call	_dyntab_cell
	add	esp, 12					; 0000000cH
	mov	DWORD PTR _val$[ebp], eax

; 34   : 		if(!val->len || !val->txt || !*val->txt) continue;

	mov	eax, DWORD PTR _val$[ebp]
	cmp	DWORD PTR [eax+4], 0
	je	SHORT $L70217
	mov	ecx, DWORD PTR _val$[ebp]
	cmp	DWORD PTR [ecx], 0
	je	SHORT $L70217
	mov	edx, DWORD PTR _val$[ebp]
	mov	eax, DWORD PTR [edx]
	movsx	ecx, BYTE PTR [eax]
	test	ecx, ecx
	jne	SHORT $L70216
$L70217:
	jmp	SHORT $L70214
$L70216:

; 35   : 		if(val->Line > lines) lines = val->Line;

	mov	edx, DWORD PTR _val$[ebp]
	mov	eax, DWORD PTR [edx+40]
	cmp	eax, DWORD PTR _lines$[ebp]
	jbe	SHORT $L70218
	mov	ecx, DWORD PTR _val$[ebp]
	mov	edx, DWORD PTR [ecx+40]
	mov	DWORD PTR _lines$[ebp], edx
$L70218:

; 36   : 		if(val->Line && val->Line != i + 1) b_reorder = 1;

	mov	eax, DWORD PTR _val$[ebp]
	cmp	DWORD PTR [eax+40], 0
	je	SHORT $L70219
	mov	ecx, DWORD PTR _i$[ebp]
	add	ecx, 1
	mov	edx, DWORD PTR _val$[ebp]
	cmp	DWORD PTR [edx+40], ecx
	je	SHORT $L70219
	mov	DWORD PTR _b_reorder$[ebp], 1
$L70219:

; 37   : 	}

	jmp	SHORT $L70214
$L70215:

; 38   : 	if(!b_reorder) return 0;

	cmp	DWORD PTR _b_reorder$[ebp], 0
	jne	SHORT $L70220
	xor	eax, eax
	jmp	$L70203
$L70220:

; 39   : 
; 40   : 	/* Place values in lines */
; 41   : 	for(i = 0; i < nbrows; i++)

	mov	DWORD PTR _i$[ebp], 0
	jmp	SHORT $L70221
$L70222:
	mov	eax, DWORD PTR _i$[ebp]
	add	eax, 1
	mov	DWORD PTR _i$[ebp], eax
$L70221:
	mov	ecx, DWORD PTR _i$[ebp]
	cmp	ecx, DWORD PTR _nbrows$[ebp]
	jae	$L70223

; 43   : 		val = dyntab_cell(tab, i, 0);

	push	0
	mov	edx, DWORD PTR _i$[ebp]
	push	edx
	mov	eax, DWORD PTR _tab$[ebp]
	push	eax
	call	_dyntab_cell
	add	esp, 12					; 0000000cH
	mov	DWORD PTR _val$[ebp], eax

; 44   : 		if(!val->len || !val->txt || !*val->txt) continue;

	mov	ecx, DWORD PTR _val$[ebp]
	cmp	DWORD PTR [ecx+4], 0
	je	SHORT $L70225
	mov	edx, DWORD PTR _val$[ebp]
	cmp	DWORD PTR [edx], 0
	je	SHORT $L70225
	mov	eax, DWORD PTR _val$[ebp]
	mov	ecx, DWORD PTR [eax]
	movsx	edx, BYTE PTR [ecx]
	test	edx, edx
	jne	SHORT $L70224
$L70225:
	jmp	SHORT $L70222
$L70224:

; 45   : 		line = val->Line ? val->Line - 1 : lines ? lines : 0;

	mov	eax, DWORD PTR _val$[ebp]
	cmp	DWORD PTR [eax+40], 0
	je	SHORT $L70612
	mov	ecx, DWORD PTR _val$[ebp]
	mov	edx, DWORD PTR [ecx+40]
	sub	edx, 1
	mov	DWORD PTR -56+[ebp], edx
	jmp	SHORT $L70613
$L70612:
	mov	eax, DWORD PTR _lines$[ebp]
	neg	eax
	sbb	eax, eax
	and	eax, DWORD PTR _lines$[ebp]
	mov	DWORD PTR -56+[ebp], eax
$L70613:
	mov	ecx, DWORD PTR -56+[ebp]
	mov	DWORD PTR _line$[ebp], ecx

; 46   : 		for(j = 0; j < res.nbcols && dyntab_sz(&res, line, j); j++);

	mov	DWORD PTR _j$[ebp], 0
	jmp	SHORT $L70226
$L70227:
	mov	edx, DWORD PTR _j$[ebp]
	add	edx, 1
	mov	DWORD PTR _j$[ebp], edx
$L70226:
	mov	eax, DWORD PTR _j$[ebp]
	cmp	eax, DWORD PTR _res$[ebp+8]
	jae	SHORT $L70228
	mov	ecx, DWORD PTR _j$[ebp]
	push	ecx
	mov	edx, DWORD PTR _line$[ebp]
	push	edx
	lea	eax, DWORD PTR _res$[ebp]
	push	eax
	call	_dyntab_sz
	add	esp, 12					; 0000000cH
	test	eax, eax
	je	SHORT $L70228
	jmp	SHORT $L70227
$L70228:

; 47   : 		if(dyntab_copy( &res, line, j, val,
; 48   : 				(!val->b_dontfreefield  && val->field) ||
; 49   : 				(!val->b_dontfreetxt && val->txt)))

	mov	ecx, DWORD PTR _val$[ebp]
	movsx	edx, BYTE PTR [ecx+15]
	test	edx, edx
	jne	SHORT $L70614
	mov	eax, DWORD PTR _val$[ebp]
	cmp	DWORD PTR [eax+8], 0
	jne	SHORT $L70616
$L70614:
	mov	ecx, DWORD PTR _val$[ebp]
	movsx	edx, BYTE PTR [ecx+14]
	test	edx, edx
	jne	SHORT $L70615
	mov	eax, DWORD PTR _val$[ebp]
	cmp	DWORD PTR [eax], 0
	jne	SHORT $L70616
$L70615:
	mov	DWORD PTR -60+[ebp], 0
	jmp	SHORT $L70617
$L70616:
	mov	DWORD PTR -60+[ebp], 1
$L70617:
	mov	ecx, DWORD PTR -60+[ebp]
	push	ecx
	mov	edx, DWORD PTR _val$[ebp]
	push	edx
	mov	eax, DWORD PTR _j$[ebp]
	push	eax
	mov	ecx, DWORD PTR _line$[ebp]
	push	ecx
	lea	edx, DWORD PTR _res$[ebp]
	push	edx
	call	_dyntab_copy
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L70229

; 50   : 			return 1;

	mov	eax, 1
	jmp	SHORT $L70203
$L70229:

; 51   : 	}

	jmp	$L70222
$L70223:

; 52   : 	dyntab_moveto(tab, &res);

	lea	eax, DWORD PTR _res$[ebp]
	push	eax
	mov	ecx, DWORD PTR _tab$[ebp]
	push	ecx
	call	_dyntab_moveto
	add	esp, 8

; 53   : 	return 0;

	xor	eax, eax
$L70203:

; 54   : }

	mov	esp, ebp
	pop	ebp
	ret	0
_dyntab_order_lines ENDP
_TEXT	ENDS
EXTRN	_qsort:NEAR
_TEXT	SEGMENT
_tab$ = 8
_qsort_cb$ = 12
_dyntab_sort PROC NEAR

; 64   : ){

	push	ebp
	mov	ebp, esp

; 65   : 	/* Check params */
; 66   : 	if(!tab) return;

	cmp	DWORD PTR _tab$[ebp], 0
	jne	SHORT $L70239
	jmp	SHORT $L70238
$L70239:

; 67   : 
; 68   : 	/* Call qsort */
; 69   : 	qsort(tab->cell, tab->nbrows, sizeof(tab->cell[0])*tab->szcols, qsort_cb);

	mov	eax, DWORD PTR _qsort_cb$[ebp]
	push	eax
	mov	ecx, DWORD PTR _tab$[ebp]
	mov	edx, DWORD PTR [ecx+12]
	shl	edx, 6
	push	edx
	mov	eax, DWORD PTR _tab$[ebp]
	mov	ecx, DWORD PTR [eax]
	push	ecx
	mov	edx, DWORD PTR _tab$[ebp]
	mov	eax, DWORD PTR [edx+16]
	push	eax
	call	_qsort
	add	esp, 16					; 00000010H
$L70238:

; 70   : 
; 71   : }

	pop	ebp
	ret	0
_dyntab_sort ENDP
_TEXT	ENDS
PUBLIC	_qsort_col1
EXTRN	_atoi:NEAR
EXTRN	_stricmp:NEAR
_DATA	SEGMENT
$SG70254 DB	'~', 00H
	ORG $+2
$SG70257 DB	'~', 00H
_DATA	ENDS
_TEXT	SEGMENT
_el1$ = 8
_el2$ = 12
_t1$ = -8
_t2$ = -12
_res$ = -4
_i1$ = -16
_i2$ = -20
_qsort_col1 PROC NEAR

; 78   : {

	push	ebp
	mov	ebp, esp
	sub	esp, 32					; 00000020H

; 79   : 	char *t1 = ((DynTableCell *)el1+1)->txt;

	mov	eax, DWORD PTR _el1$[ebp]
	mov	ecx, DWORD PTR [eax+64]
	mov	DWORD PTR _t1$[ebp], ecx

; 80   : 	char *t2 = ((DynTableCell *)el2+1)->txt;

	mov	edx, DWORD PTR _el2$[ebp]
	mov	eax, DWORD PTR [edx+64]
	mov	DWORD PTR _t2$[ebp], eax

; 81   : 	int res;
; 82   : 	int i1, i2;
; 83   : 
; 84   : 	if(!t1 || !*t1) t1 = "~";

	cmp	DWORD PTR _t1$[ebp], 0
	je	SHORT $L70253
	mov	ecx, DWORD PTR _t1$[ebp]
	movsx	edx, BYTE PTR [ecx]
	test	edx, edx
	jne	SHORT $L70252
$L70253:
	mov	DWORD PTR _t1$[ebp], OFFSET FLAT:$SG70254
$L70252:

; 85   : 	if(!t2 || !*t2) t2 = "~";

	cmp	DWORD PTR _t2$[ebp], 0
	je	SHORT $L70256
	mov	eax, DWORD PTR _t2$[ebp]
	movsx	ecx, BYTE PTR [eax]
	test	ecx, ecx
	jne	SHORT $L70255
$L70256:
	mov	DWORD PTR _t2$[ebp], OFFSET FLAT:$SG70257
$L70255:

; 86   : 
; 87   : 	res = STRCMPCASE(t1, t2);

	mov	edx, DWORD PTR _t2$[ebp]
	push	edx
	mov	eax, DWORD PTR _t1$[ebp]
	push	eax
	call	_stricmp
	add	esp, 8
	mov	DWORD PTR _res$[ebp], eax

; 88   : 	if(res) return res;

	cmp	DWORD PTR _res$[ebp], 0
	je	SHORT $L70258
	mov	eax, DWORD PTR _res$[ebp]
	jmp	SHORT $L70244
$L70258:

; 89   : 
; 90   : 	/* Identical strings : sort on column 0 integer */
; 91   : 	t1 = ((DynTableCell *)el1)->txt;

	mov	ecx, DWORD PTR _el1$[ebp]
	mov	edx, DWORD PTR [ecx]
	mov	DWORD PTR _t1$[ebp], edx

; 92   : 	t2 = ((DynTableCell *)el2)->txt;

	mov	eax, DWORD PTR _el2$[ebp]
	mov	ecx, DWORD PTR [eax]
	mov	DWORD PTR _t2$[ebp], ecx

; 93   : 	i1 = t1 ? atoi(t1) : 0;

	cmp	DWORD PTR _t1$[ebp], 0
	je	SHORT $L70620
	mov	edx, DWORD PTR _t1$[ebp]
	push	edx
	call	_atoi
	add	esp, 4
	mov	DWORD PTR -24+[ebp], eax
	jmp	SHORT $L70621
$L70620:
	mov	DWORD PTR -24+[ebp], 0
$L70621:
	mov	eax, DWORD PTR -24+[ebp]
	mov	DWORD PTR _i1$[ebp], eax

; 94   : 	i2 = t2 ? atoi(t2) : 0;

	cmp	DWORD PTR _t2$[ebp], 0
	je	SHORT $L70622
	mov	ecx, DWORD PTR _t2$[ebp]
	push	ecx
	call	_atoi
	add	esp, 4
	mov	DWORD PTR -28+[ebp], eax
	jmp	SHORT $L70623
$L70622:
	mov	DWORD PTR -28+[ebp], 0
$L70623:
	mov	edx, DWORD PTR -28+[ebp]
	mov	DWORD PTR _i2$[ebp], edx

; 95   : 
; 96   : 	return i1 > i2 ? 1 : i1 < i2 ? -1 : 0;

	mov	eax, DWORD PTR _i1$[ebp]
	cmp	eax, DWORD PTR _i2$[ebp]
	jle	SHORT $L70624
	mov	DWORD PTR -32+[ebp], 1
	jmp	SHORT $L70625
$L70624:
	mov	ecx, DWORD PTR _i1$[ebp]
	xor	edx, edx
	cmp	ecx, DWORD PTR _i2$[ebp]
	setge	dl
	dec	edx
	mov	DWORD PTR -32+[ebp], edx
$L70625:
	mov	eax, DWORD PTR -32+[ebp]
$L70244:

; 97   : }

	mov	esp, ebp
	pop	ebp
	ret	0
_qsort_col1 ENDP
_TEXT	ENDS
PUBLIC	_qsort_col1desc
_BSS	SEGMENT
$SG70274 DB	01H DUP (?)
	ALIGN	4

$SG70276 DB	01H DUP (?)
_BSS	ENDS
_TEXT	SEGMENT
_el1$ = 8
_el2$ = 12
_t1$ = -8
_t2$ = -12
_res$ = -4
_i1$ = -16
_i2$ = -20
_qsort_col1desc PROC NEAR

; 104  : {

	push	ebp
	mov	ebp, esp
	sub	esp, 32					; 00000020H

; 105  : 	char *t1 = ((DynTableCell *)el1+1)->txt;

	mov	eax, DWORD PTR _el1$[ebp]
	mov	ecx, DWORD PTR [eax+64]
	mov	DWORD PTR _t1$[ebp], ecx

; 106  : 	char *t2 = ((DynTableCell *)el2+1)->txt;

	mov	edx, DWORD PTR _el2$[ebp]
	mov	eax, DWORD PTR [edx+64]
	mov	DWORD PTR _t2$[ebp], eax

; 107  : 	int res;
; 108  : 	int i1, i2;
; 109  : 
; 110  : 	if(!t1) t1 = "";

	cmp	DWORD PTR _t1$[ebp], 0
	jne	SHORT $L70273
	mov	DWORD PTR _t1$[ebp], OFFSET FLAT:$SG70274
$L70273:

; 111  : 	if(!t2) t2 = "";

	cmp	DWORD PTR _t2$[ebp], 0
	jne	SHORT $L70275
	mov	DWORD PTR _t2$[ebp], OFFSET FLAT:$SG70276
$L70275:

; 112  : 
; 113  : 	res = STRCMPCASE(t1, t2);

	mov	ecx, DWORD PTR _t2$[ebp]
	push	ecx
	mov	edx, DWORD PTR _t1$[ebp]
	push	edx
	call	_stricmp
	add	esp, 8
	mov	DWORD PTR _res$[ebp], eax

; 114  : 	if(res) return res;

	cmp	DWORD PTR _res$[ebp], 0
	je	SHORT $L70277
	mov	eax, DWORD PTR _res$[ebp]
	jmp	SHORT $L70265
$L70277:

; 115  : 
; 116  : 	t1 = ((DynTableCell *)el1)->txt;

	mov	eax, DWORD PTR _el1$[ebp]
	mov	ecx, DWORD PTR [eax]
	mov	DWORD PTR _t1$[ebp], ecx

; 117  : 	t2 = ((DynTableCell *)el2)->txt;

	mov	edx, DWORD PTR _el2$[ebp]
	mov	eax, DWORD PTR [edx]
	mov	DWORD PTR _t2$[ebp], eax

; 118  : 	i1 = t1 ? atoi(t1) : 0;

	cmp	DWORD PTR _t1$[ebp], 0
	je	SHORT $L70627
	mov	ecx, DWORD PTR _t1$[ebp]
	push	ecx
	call	_atoi
	add	esp, 4
	mov	DWORD PTR -24+[ebp], eax
	jmp	SHORT $L70628
$L70627:
	mov	DWORD PTR -24+[ebp], 0
$L70628:
	mov	edx, DWORD PTR -24+[ebp]
	mov	DWORD PTR _i1$[ebp], edx

; 119  : 	i2 = t2 ? atoi(t2) : 0;

	cmp	DWORD PTR _t2$[ebp], 0
	je	SHORT $L70629
	mov	eax, DWORD PTR _t2$[ebp]
	push	eax
	call	_atoi
	add	esp, 4
	mov	DWORD PTR -28+[ebp], eax
	jmp	SHORT $L70630
$L70629:
	mov	DWORD PTR -28+[ebp], 0
$L70630:
	mov	ecx, DWORD PTR -28+[ebp]
	mov	DWORD PTR _i2$[ebp], ecx

; 120  : 
; 121  : 	return i1 > i2 ? 1 : i1 < i2 ? -1 : 0;

	mov	edx, DWORD PTR _i1$[ebp]
	cmp	edx, DWORD PTR _i2$[ebp]
	jle	SHORT $L70631
	mov	DWORD PTR -32+[ebp], 1
	jmp	SHORT $L70632
$L70631:
	mov	eax, DWORD PTR _i1$[ebp]
	xor	ecx, ecx
	cmp	eax, DWORD PTR _i2$[ebp]
	setge	cl
	dec	ecx
	mov	DWORD PTR -32+[ebp], ecx
$L70632:
	mov	eax, DWORD PTR -32+[ebp]
$L70265:

; 122  : }

	mov	esp, ebp
	pop	ebp
	ret	0
_qsort_col1desc ENDP
_TEXT	ENDS
PUBLIC	_qsort_col2
_DATA	SEGMENT
	ORG $+2
$SG70291 DB	0b2H, 00H
	ORG $+2
$SG70294 DB	0b2H, 00H
_DATA	ENDS
_TEXT	SEGMENT
_el1$ = 8
_el2$ = 12
_t1$ = -4
_t2$ = -8
_qsort_col2 PROC NEAR

; 129  : {

	push	ebp
	mov	ebp, esp
	sub	esp, 8

; 130  : 	char *t1 = ((DynTableCell *)el1+2)->txt;

	mov	eax, DWORD PTR _el1$[ebp]
	mov	ecx, DWORD PTR [eax+128]
	mov	DWORD PTR _t1$[ebp], ecx

; 131  : 	char *t2 = ((DynTableCell *)el2+2)->txt;

	mov	edx, DWORD PTR _el2$[ebp]
	mov	eax, DWORD PTR [edx+128]
	mov	DWORD PTR _t2$[ebp], eax

; 132  : 	if(!t1 || !*t1) t1 = "²";

	cmp	DWORD PTR _t1$[ebp], 0
	je	SHORT $L70290
	mov	ecx, DWORD PTR _t1$[ebp]
	movsx	edx, BYTE PTR [ecx]
	test	edx, edx
	jne	SHORT $L70289
$L70290:
	mov	DWORD PTR _t1$[ebp], OFFSET FLAT:$SG70291
$L70289:

; 133  : 	if(!t2 || !*t2) t2 = "²";

	cmp	DWORD PTR _t2$[ebp], 0
	je	SHORT $L70293
	mov	eax, DWORD PTR _t2$[ebp]
	movsx	ecx, BYTE PTR [eax]
	test	ecx, ecx
	jne	SHORT $L70292
$L70293:
	mov	DWORD PTR _t2$[ebp], OFFSET FLAT:$SG70294
$L70292:

; 134  : 	return STRCMPCASE( t1, t2 );

	mov	edx, DWORD PTR _t2$[ebp]
	push	edx
	mov	eax, DWORD PTR _t1$[ebp]
	push	eax
	call	_stricmp
	add	esp, 8

; 135  : }

	mov	esp, ebp
	pop	ebp
	ret	0
_qsort_col2 ENDP
_TEXT	ENDS
PUBLIC	_qsort_col2i
_TEXT	SEGMENT
_el1$ = 8
_el2$ = 12
_t1$ = -4
_t2$ = -8
_i1$ = -12
_i2$ = -16
_qsort_col2i PROC NEAR

; 142  : {

	push	ebp
	mov	ebp, esp
	sub	esp, 28					; 0000001cH

; 143  : 	char *t1 = ((DynTableCell *)el1+2)->txt;

	mov	eax, DWORD PTR _el1$[ebp]
	mov	ecx, DWORD PTR [eax+128]
	mov	DWORD PTR _t1$[ebp], ecx

; 144  : 	char *t2 = ((DynTableCell *)el2+2)->txt;

	mov	edx, DWORD PTR _el2$[ebp]
	mov	eax, DWORD PTR [edx+128]
	mov	DWORD PTR _t2$[ebp], eax

; 145  : 	int i1, i2;
; 146  : 
; 147  : 	i1 = t1 ? atoi(t1) : 0;

	cmp	DWORD PTR _t1$[ebp], 0
	je	SHORT $L70635
	mov	ecx, DWORD PTR _t1$[ebp]
	push	ecx
	call	_atoi
	add	esp, 4
	mov	DWORD PTR -20+[ebp], eax
	jmp	SHORT $L70636
$L70635:
	mov	DWORD PTR -20+[ebp], 0
$L70636:
	mov	edx, DWORD PTR -20+[ebp]
	mov	DWORD PTR _i1$[ebp], edx

; 148  : 	i2 = t2 ? atoi(t2) : 0;

	cmp	DWORD PTR _t2$[ebp], 0
	je	SHORT $L70637
	mov	eax, DWORD PTR _t2$[ebp]
	push	eax
	call	_atoi
	add	esp, 4
	mov	DWORD PTR -24+[ebp], eax
	jmp	SHORT $L70638
$L70637:
	mov	DWORD PTR -24+[ebp], 0
$L70638:
	mov	ecx, DWORD PTR -24+[ebp]
	mov	DWORD PTR _i2$[ebp], ecx

; 149  : 
; 150  : 	return i1 > i2 ? 1 : i1 < i2 ? -1 : 0;

	mov	edx, DWORD PTR _i1$[ebp]
	cmp	edx, DWORD PTR _i2$[ebp]
	jle	SHORT $L70639
	mov	DWORD PTR -28+[ebp], 1
	jmp	SHORT $L70640
$L70639:
	mov	eax, DWORD PTR _i1$[ebp]
	xor	ecx, ecx
	cmp	eax, DWORD PTR _i2$[ebp]
	setge	cl
	dec	ecx
	mov	DWORD PTR -28+[ebp], ecx
$L70640:
	mov	eax, DWORD PTR -28+[ebp]

; 151  : }

	mov	esp, ebp
	pop	ebp
	ret	0
_qsort_col2i ENDP
_TEXT	ENDS
PUBLIC	_qsort_col0i
PUBLIC	_qsort_col0idesc
_TEXT	SEGMENT
_el1$ = 8
_el2$ = 12
_qsort_col0idesc PROC NEAR

; 158  : {

	push	ebp
	mov	ebp, esp

; 159  : 	return -qsort_col0i(el1, el2);

	mov	eax, DWORD PTR _el2$[ebp]
	push	eax
	mov	ecx, DWORD PTR _el1$[ebp]
	push	ecx
	call	_qsort_col0i
	add	esp, 8
	neg	eax

; 160  : }

	pop	ebp
	ret	0
_qsort_col0idesc ENDP
_TEXT	ENDS
EXTRN	_atof:NEAR
EXTRN	__fltused:NEAR
_TEXT	SEGMENT
_el1$ = 8
_el2$ = 12
_t1$ = -4
_t2$ = -8
_i1$ = -16
_i2$ = -24
_qsort_col0i PROC NEAR

; 167  : {

	push	ebp
	mov	ebp, esp
	sub	esp, 48					; 00000030H

; 168  : 	char *t1 = ((DynTableCell *)el1)->txt;

	mov	eax, DWORD PTR _el1$[ebp]
	mov	ecx, DWORD PTR [eax]
	mov	DWORD PTR _t1$[ebp], ecx

; 169  : 	char *t2 = ((DynTableCell *)el2)->txt;

	mov	edx, DWORD PTR _el2$[ebp]
	mov	eax, DWORD PTR [edx]
	mov	DWORD PTR _t2$[ebp], eax

; 170  : 	double i1, i2;
; 171  : 
; 172  : 	i1 = t1 ? atof(t1) : 0;

	cmp	DWORD PTR _t1$[ebp], 0
	je	SHORT $L70643
	mov	ecx, DWORD PTR _t1$[ebp]
	push	ecx
	call	_atof
	add	esp, 4
	fstp	QWORD PTR -32+[ebp]
	jmp	SHORT $L70644
$L70643:
	mov	DWORD PTR -32+[ebp], 0
	mov	DWORD PTR -32+[ebp+4], 0
$L70644:
	mov	edx, DWORD PTR -32+[ebp]
	mov	DWORD PTR _i1$[ebp], edx
	mov	eax, DWORD PTR -32+[ebp+4]
	mov	DWORD PTR _i1$[ebp+4], eax

; 173  : 	i2 = t2 ? atof(t2) : 0;

	cmp	DWORD PTR _t2$[ebp], 0
	je	SHORT $L70645
	mov	ecx, DWORD PTR _t2$[ebp]
	push	ecx
	call	_atof
	add	esp, 4
	fstp	QWORD PTR -40+[ebp]
	jmp	SHORT $L70646
$L70645:
	mov	DWORD PTR -40+[ebp], 0
	mov	DWORD PTR -40+[ebp+4], 0
$L70646:
	mov	edx, DWORD PTR -40+[ebp]
	mov	DWORD PTR _i2$[ebp], edx
	mov	eax, DWORD PTR -40+[ebp+4]
	mov	DWORD PTR _i2$[ebp+4], eax

; 174  : 
; 175  : 	return i1 > i2 ? 1 : i1 < i2 ? -1 : 0;

	fld	QWORD PTR _i1$[ebp]
	fcomp	QWORD PTR _i2$[ebp]
	fnstsw	ax
	test	ah, 65					; 00000041H
	jne	SHORT $L70649
	mov	DWORD PTR -44+[ebp], 1
	jmp	SHORT $L70650
$L70649:
	fld	QWORD PTR _i1$[ebp]
	fcomp	QWORD PTR _i2$[ebp]
	fnstsw	ax
	test	ah, 1
	je	SHORT $L70647
	mov	DWORD PTR -48+[ebp], -1
	jmp	SHORT $L70648
$L70647:
	mov	DWORD PTR -48+[ebp], 0
$L70648:
	mov	ecx, DWORD PTR -48+[ebp]
	mov	DWORD PTR -44+[ebp], ecx
$L70650:
	mov	eax, DWORD PTR -44+[ebp]

; 176  : }

	mov	esp, ebp
	pop	ebp
	ret	0
_qsort_col0i ENDP
_TEXT	ENDS
PUBLIC	_qsort_col0desc
PUBLIC	_qsort_col0
_TEXT	SEGMENT
_el1$ = 8
_el2$ = 12
_qsort_col0desc PROC NEAR

; 183  : {

	push	ebp
	mov	ebp, esp

; 184  : 	return -qsort_col0(el1, el2);

	mov	eax, DWORD PTR _el2$[ebp]
	push	eax
	mov	ecx, DWORD PTR _el1$[ebp]
	push	ecx
	call	_qsort_col0
	add	esp, 8
	neg	eax

; 185  : }

	pop	ebp
	ret	0
_qsort_col0desc ENDP
_TEXT	ENDS
EXTRN	_strcmp:NEAR
_BSS	SEGMENT
	ALIGN	4

$SG70336 DB	01H DUP (?)
	ALIGN	4

$SG70337 DB	01H DUP (?)
_BSS	ENDS
_TEXT	SEGMENT
_el1$ = 8
_el2$ = 12
_t1$ = -4
_t2$ = -8
_qsort_col0 PROC NEAR

; 192  : {

	push	ebp
	mov	ebp, esp
	sub	esp, 16					; 00000010H

; 193  : 	char *t1 = ((DynTableCell *)el1)->txt;

	mov	eax, DWORD PTR _el1$[ebp]
	mov	ecx, DWORD PTR [eax]
	mov	DWORD PTR _t1$[ebp], ecx

; 194  : 	char *t2 = ((DynTableCell *)el2)->txt;

	mov	edx, DWORD PTR _el2$[ebp]
	mov	eax, DWORD PTR [edx]
	mov	DWORD PTR _t2$[ebp], eax

; 195  : 	return STRCMPNUL(t1, t2);

	cmp	DWORD PTR _t2$[ebp], 0
	je	SHORT $L70654
	mov	ecx, DWORD PTR _t2$[ebp]
	mov	DWORD PTR -12+[ebp], ecx
	jmp	SHORT $L70655
$L70654:
	mov	DWORD PTR -12+[ebp], OFFSET FLAT:$SG70336
$L70655:
	cmp	DWORD PTR _t1$[ebp], 0
	je	SHORT $L70656
	mov	edx, DWORD PTR _t1$[ebp]
	mov	DWORD PTR -16+[ebp], edx
	jmp	SHORT $L70657
$L70656:
	mov	DWORD PTR -16+[ebp], OFFSET FLAT:$SG70337
$L70657:
	mov	eax, DWORD PTR -12+[ebp]
	push	eax
	mov	ecx, DWORD PTR -16+[ebp]
	push	ecx
	call	_strcmp
	add	esp, 8

; 196  : }

	mov	esp, ebp
	pop	ebp
	ret	0
_qsort_col0 ENDP
_TEXT	ENDS
PUBLIC	_qsort_col1fdesc
PUBLIC	_qsort_col1f
_TEXT	SEGMENT
_el1$ = 8
_el2$ = 12
_qsort_col1fdesc PROC NEAR

; 203  : {

	push	ebp
	mov	ebp, esp

; 204  : 	return -qsort_col1f(el1, el2);

	mov	eax, DWORD PTR _el2$[ebp]
	push	eax
	mov	ecx, DWORD PTR _el1$[ebp]
	push	ecx
	call	_qsort_col1f
	add	esp, 8
	neg	eax

; 205  : }

	pop	ebp
	ret	0
_qsort_col1fdesc ENDP
_el1$ = 8
_el2$ = 12
_t1$ = -12
_t2$ = -16
_f1$ = -24
_f2$ = -8
_qsort_col1f PROC NEAR

; 212  : {

	push	ebp
	mov	ebp, esp
	sub	esp, 48					; 00000030H

; 213  : 	char *t1 = ((DynTableCell *)el1 + 1)->txt;

	mov	eax, DWORD PTR _el1$[ebp]
	mov	ecx, DWORD PTR [eax+64]
	mov	DWORD PTR _t1$[ebp], ecx

; 214  : 	char *t2 = ((DynTableCell *)el2 + 1)->txt;

	mov	edx, DWORD PTR _el2$[ebp]
	mov	eax, DWORD PTR [edx+64]
	mov	DWORD PTR _t2$[ebp], eax

; 215  : 	double f1, f2;
; 216  : 
; 217  : 	f1 = t1 ? atof(t1) : 0;

	cmp	DWORD PTR _t1$[ebp], 0
	je	SHORT $L70660
	mov	ecx, DWORD PTR _t1$[ebp]
	push	ecx
	call	_atof
	add	esp, 4
	fstp	QWORD PTR -32+[ebp]
	jmp	SHORT $L70661
$L70660:
	mov	DWORD PTR -32+[ebp], 0
	mov	DWORD PTR -32+[ebp+4], 0
$L70661:
	mov	edx, DWORD PTR -32+[ebp]
	mov	DWORD PTR _f1$[ebp], edx
	mov	eax, DWORD PTR -32+[ebp+4]
	mov	DWORD PTR _f1$[ebp+4], eax

; 218  : 	f2 = t2 ? atof(t2) : 0;

	cmp	DWORD PTR _t2$[ebp], 0
	je	SHORT $L70662
	mov	ecx, DWORD PTR _t2$[ebp]
	push	ecx
	call	_atof
	add	esp, 4
	fstp	QWORD PTR -40+[ebp]
	jmp	SHORT $L70663
$L70662:
	mov	DWORD PTR -40+[ebp], 0
	mov	DWORD PTR -40+[ebp+4], 0
$L70663:
	mov	edx, DWORD PTR -40+[ebp]
	mov	DWORD PTR _f2$[ebp], edx
	mov	eax, DWORD PTR -40+[ebp+4]
	mov	DWORD PTR _f2$[ebp+4], eax

; 219  : 
; 220  : 	return f1 > f2 ? 1 : f1 < f2 ? -1 : 0;

	fld	QWORD PTR _f1$[ebp]
	fcomp	QWORD PTR _f2$[ebp]
	fnstsw	ax
	test	ah, 65					; 00000041H
	jne	SHORT $L70666
	mov	DWORD PTR -44+[ebp], 1
	jmp	SHORT $L70667
$L70666:
	fld	QWORD PTR _f1$[ebp]
	fcomp	QWORD PTR _f2$[ebp]
	fnstsw	ax
	test	ah, 1
	je	SHORT $L70664
	mov	DWORD PTR -48+[ebp], -1
	jmp	SHORT $L70665
$L70664:
	mov	DWORD PTR -48+[ebp], 0
$L70665:
	mov	ecx, DWORD PTR -48+[ebp]
	mov	DWORD PTR -44+[ebp], ecx
$L70667:
	mov	eax, DWORD PTR -44+[ebp]

; 221  : }

	mov	esp, ebp
	pop	ebp
	ret	0
_qsort_col1f ENDP
_TEXT	ENDS
PUBLIC	_qsort_col013i
_BSS	SEGMENT
	ALIGN	4

$SG70375 DB	01H DUP (?)
	ALIGN	4

$SG70376 DB	01H DUP (?)
_BSS	ENDS
_TEXT	SEGMENT
_el1$ = 8
_el2$ = 12
_t10$ = -4
_t20$ = -16
_t11$ = -8
_t21$ = -20
_t13$ = -12
_t23$ = -28
_i1$ = -32
_i2$ = -36
_res$ = -24
_qsort_col013i PROC NEAR

; 228  : {

	push	ebp
	mov	ebp, esp
	sub	esp, 60					; 0000003cH

; 229  : 	char *t10 = ((DynTableCell *)el1)->txt;

	mov	eax, DWORD PTR _el1$[ebp]
	mov	ecx, DWORD PTR [eax]
	mov	DWORD PTR _t10$[ebp], ecx

; 230  : 	char *t20 = ((DynTableCell *)el2)->txt;

	mov	edx, DWORD PTR _el2$[ebp]
	mov	eax, DWORD PTR [edx]
	mov	DWORD PTR _t20$[ebp], eax

; 231  : 	char *t11 = ((DynTableCell *)el1+1)->txt;

	mov	ecx, DWORD PTR _el1$[ebp]
	mov	edx, DWORD PTR [ecx+64]
	mov	DWORD PTR _t11$[ebp], edx

; 232  : 	char *t21 = ((DynTableCell *)el2+1)->txt;

	mov	eax, DWORD PTR _el2$[ebp]
	mov	ecx, DWORD PTR [eax+64]
	mov	DWORD PTR _t21$[ebp], ecx

; 233  : 	char *t13 = ((DynTableCell *)el1+3)->txt;

	mov	edx, DWORD PTR _el1$[ebp]
	mov	eax, DWORD PTR [edx+192]
	mov	DWORD PTR _t13$[ebp], eax

; 234  : 	char *t23 = ((DynTableCell *)el2+3)->txt;

	mov	ecx, DWORD PTR _el2$[ebp]
	mov	edx, DWORD PTR [ecx+192]
	mov	DWORD PTR _t23$[ebp], edx

; 235  : 	int i1, i2, res;
; 236  : 
; 237  : 	i1 = t10 ? atoi(t10) : 0;

	cmp	DWORD PTR _t10$[ebp], 0
	je	SHORT $L70669
	mov	eax, DWORD PTR _t10$[ebp]
	push	eax
	call	_atoi
	add	esp, 4
	mov	DWORD PTR -40+[ebp], eax
	jmp	SHORT $L70670
$L70669:
	mov	DWORD PTR -40+[ebp], 0
$L70670:
	mov	ecx, DWORD PTR -40+[ebp]
	mov	DWORD PTR _i1$[ebp], ecx

; 238  : 	i2 = t20 ? atoi(t20) : 0;

	cmp	DWORD PTR _t20$[ebp], 0
	je	SHORT $L70671
	mov	edx, DWORD PTR _t20$[ebp]
	push	edx
	call	_atoi
	add	esp, 4
	mov	DWORD PTR -44+[ebp], eax
	jmp	SHORT $L70672
$L70671:
	mov	DWORD PTR -44+[ebp], 0
$L70672:
	mov	eax, DWORD PTR -44+[ebp]
	mov	DWORD PTR _i2$[ebp], eax

; 239  : 	if(i1 != i2) return i1 > i2 ? 1 : -1;

	mov	ecx, DWORD PTR _i1$[ebp]
	cmp	ecx, DWORD PTR _i2$[ebp]
	je	SHORT $L70374
	mov	edx, DWORD PTR _i1$[ebp]
	xor	eax, eax
	cmp	edx, DWORD PTR _i2$[ebp]
	setle	al
	dec	eax
	and	eax, 2
	add	eax, -1
	jmp	$L70358
$L70374:

; 240  : 
; 241  : 	res = STRCMPCASE(t11 ? t11 : "", t21 ? t21 : "");

	cmp	DWORD PTR _t21$[ebp], 0
	je	SHORT $L70673
	mov	eax, DWORD PTR _t21$[ebp]
	mov	DWORD PTR -48+[ebp], eax
	jmp	SHORT $L70674
$L70673:
	mov	DWORD PTR -48+[ebp], OFFSET FLAT:$SG70375
$L70674:
	cmp	DWORD PTR _t11$[ebp], 0
	je	SHORT $L70675
	mov	ecx, DWORD PTR _t11$[ebp]
	mov	DWORD PTR -52+[ebp], ecx
	jmp	SHORT $L70676
$L70675:
	mov	DWORD PTR -52+[ebp], OFFSET FLAT:$SG70376
$L70676:
	mov	edx, DWORD PTR -48+[ebp]
	push	edx
	mov	eax, DWORD PTR -52+[ebp]
	push	eax
	call	_stricmp
	add	esp, 8
	mov	DWORD PTR _res$[ebp], eax

; 242  : 	if(res) return res;

	cmp	DWORD PTR _res$[ebp], 0
	je	SHORT $L70377
	mov	eax, DWORD PTR _res$[ebp]
	jmp	SHORT $L70358
$L70377:

; 243  : 
; 244  : 	i1 = t13 ? atoi(t13) : 0;

	cmp	DWORD PTR _t13$[ebp], 0
	je	SHORT $L70677
	mov	ecx, DWORD PTR _t13$[ebp]
	push	ecx
	call	_atoi
	add	esp, 4
	mov	DWORD PTR -56+[ebp], eax
	jmp	SHORT $L70678
$L70677:
	mov	DWORD PTR -56+[ebp], 0
$L70678:
	mov	edx, DWORD PTR -56+[ebp]
	mov	DWORD PTR _i1$[ebp], edx

; 245  : 	i2 = t23 ? atoi(t23) : 0;

	cmp	DWORD PTR _t23$[ebp], 0
	je	SHORT $L70679
	mov	eax, DWORD PTR _t23$[ebp]
	push	eax
	call	_atoi
	add	esp, 4
	mov	DWORD PTR -60+[ebp], eax
	jmp	SHORT $L70680
$L70679:
	mov	DWORD PTR -60+[ebp], 0
$L70680:
	mov	ecx, DWORD PTR -60+[ebp]
	mov	DWORD PTR _i2$[ebp], ecx

; 246  : 	if(i1 != i2) return i1 > i2 ? 1 : -1;

	mov	edx, DWORD PTR _i1$[ebp]
	cmp	edx, DWORD PTR _i2$[ebp]
	je	SHORT $L70378
	mov	eax, DWORD PTR _i1$[ebp]
	xor	ecx, ecx
	cmp	eax, DWORD PTR _i2$[ebp]
	setle	cl
	dec	ecx
	and	ecx, 2
	add	ecx, -1
	mov	eax, ecx
	jmp	SHORT $L70358
$L70378:

; 247  : 	return 0;

	xor	eax, eax
$L70358:

; 248  : }

	mov	esp, ebp
	pop	ebp
	ret	0
_qsort_col013i ENDP
_TEXT	ENDS
PUBLIC	_qsort_val_idobj
_TEXT	SEGMENT
_el1$ = 8
_el2$ = 12
_n1$ = -8
_n2$ = -4
_qsort_val_idobj PROC NEAR

; 255  : {

	push	ebp
	mov	ebp, esp
	sub	esp, 12					; 0000000cH

; 256  : 	unsigned long n1 = ((DynTableCell *)el1)->IdObj;

	mov	eax, DWORD PTR _el1$[ebp]
	mov	ecx, DWORD PTR [eax+20]
	mov	DWORD PTR _n1$[ebp], ecx

; 257  : 	unsigned long n2 = ((DynTableCell *)el2)->IdObj;

	mov	edx, DWORD PTR _el2$[ebp]
	mov	eax, DWORD PTR [edx+20]
	mov	DWORD PTR _n2$[ebp], eax

; 258  : 	return n1 > n2 ? 1 : n1 < n2 ? -1 : 0;

	mov	ecx, DWORD PTR _n1$[ebp]
	cmp	ecx, DWORD PTR _n2$[ebp]
	jbe	SHORT $L70682
	mov	DWORD PTR -12+[ebp], 1
	jmp	SHORT $L70683
$L70682:
	mov	edx, DWORD PTR _n1$[ebp]
	cmp	edx, DWORD PTR _n2$[ebp]
	sbb	eax, eax
	mov	DWORD PTR -12+[ebp], eax
$L70683:
	mov	eax, DWORD PTR -12+[ebp]

; 259  : }

	mov	esp, ebp
	pop	ebp
	ret	0
_qsort_val_idobj ENDP
_TEXT	ENDS
PUBLIC	_qsort_val_num
_TEXT	SEGMENT
_el1$ = 8
_el2$ = 12
_n1$ = -8
_n2$ = -4
_qsort_val_num PROC NEAR

; 266  : {

	push	ebp
	mov	ebp, esp
	sub	esp, 12					; 0000000cH

; 267  : 	unsigned long n1 = ((DynTableCell *)el1)->Num;

	mov	eax, DWORD PTR _el1$[ebp]
	mov	ecx, DWORD PTR [eax+36]
	mov	DWORD PTR _n1$[ebp], ecx

; 268  : 	unsigned long n2 = ((DynTableCell *)el2)->Num;

	mov	edx, DWORD PTR _el2$[ebp]
	mov	eax, DWORD PTR [edx+36]
	mov	DWORD PTR _n2$[ebp], eax

; 269  : 	return n1 > n2 ? 1 : n1 < n2 ? -1 : 0;

	mov	ecx, DWORD PTR _n1$[ebp]
	cmp	ecx, DWORD PTR _n2$[ebp]
	jbe	SHORT $L70685
	mov	DWORD PTR -12+[ebp], 1
	jmp	SHORT $L70686
$L70685:
	mov	edx, DWORD PTR _n1$[ebp]
	cmp	edx, DWORD PTR _n2$[ebp]
	sbb	eax, eax
	mov	DWORD PTR -12+[ebp], eax
$L70686:
	mov	eax, DWORD PTR -12+[ebp]

; 270  : }

	mov	esp, ebp
	pop	ebp
	ret	0
_qsort_val_num ENDP
_TEXT	ENDS
PUBLIC	_qsort_val_line
_TEXT	SEGMENT
_el1$ = 8
_el2$ = 12
_n1$ = -8
_n2$ = -4
_qsort_val_line PROC NEAR

; 277  : {

	push	ebp
	mov	ebp, esp
	sub	esp, 12					; 0000000cH

; 278  : 	unsigned long n1 = ((DynTableCell *)el1)->Line;

	mov	eax, DWORD PTR _el1$[ebp]
	mov	ecx, DWORD PTR [eax+40]
	mov	DWORD PTR _n1$[ebp], ecx

; 279  : 	unsigned long n2 = ((DynTableCell *)el2)->Line;

	mov	edx, DWORD PTR _el2$[ebp]
	mov	eax, DWORD PTR [edx+40]
	mov	DWORD PTR _n2$[ebp], eax

; 280  : 	return n1 > n2 ? 1 : n1 < n2 ? -1 : 0;

	mov	ecx, DWORD PTR _n1$[ebp]
	cmp	ecx, DWORD PTR _n2$[ebp]
	jbe	SHORT $L70688
	mov	DWORD PTR -12+[ebp], 1
	jmp	SHORT $L70689
$L70688:
	mov	edx, DWORD PTR _n1$[ebp]
	cmp	edx, DWORD PTR _n2$[ebp]
	sbb	eax, eax
	mov	DWORD PTR -12+[ebp], eax
$L70689:
	mov	eax, DWORD PTR -12+[ebp]

; 281  : }

	mov	esp, ebp
	pop	ebp
	ret	0
_qsort_val_line ENDP
_TEXT	ENDS
PUBLIC	_qsort_val_col
_TEXT	SEGMENT
_el1$ = 8
_el2$ = 12
_n1$ = -8
_n2$ = -4
_qsort_val_col PROC NEAR

; 288  : {

	push	ebp
	mov	ebp, esp
	sub	esp, 12					; 0000000cH

; 289  : 	unsigned long n1 = ((DynTableCell *)el1)->col;

	mov	eax, DWORD PTR _el1$[ebp]
	mov	ecx, DWORD PTR [eax+56]
	mov	DWORD PTR _n1$[ebp], ecx

; 290  : 	unsigned long n2 = ((DynTableCell *)el2)->col;

	mov	edx, DWORD PTR _el2$[ebp]
	mov	eax, DWORD PTR [edx+56]
	mov	DWORD PTR _n2$[ebp], eax

; 291  : 	return n1 > n2 ? 1 : n1 < n2 ? -1 : 0;

	mov	ecx, DWORD PTR _n1$[ebp]
	cmp	ecx, DWORD PTR _n2$[ebp]
	jbe	SHORT $L70691
	mov	DWORD PTR -12+[ebp], 1
	jmp	SHORT $L70692
$L70691:
	mov	edx, DWORD PTR _n1$[ebp]
	cmp	edx, DWORD PTR _n2$[ebp]
	sbb	eax, eax
	mov	DWORD PTR -12+[ebp], eax
$L70692:
	mov	eax, DWORD PTR -12+[ebp]

; 292  : }

	mov	esp, ebp
	pop	ebp
	ret	0
_qsort_val_col ENDP
_TEXT	ENDS
PUBLIC	_qsort_val_row
_TEXT	SEGMENT
_el1$ = 8
_el2$ = 12
_n1$ = -8
_n2$ = -4
_qsort_val_row PROC NEAR

; 299  : {

	push	ebp
	mov	ebp, esp
	sub	esp, 12					; 0000000cH

; 300  : 	unsigned long n1 = ((DynTableCell *)el1)->row;

	mov	eax, DWORD PTR _el1$[ebp]
	mov	ecx, DWORD PTR [eax+60]
	mov	DWORD PTR _n1$[ebp], ecx

; 301  : 	unsigned long n2 = ((DynTableCell *)el2)->row;

	mov	edx, DWORD PTR _el2$[ebp]
	mov	eax, DWORD PTR [edx+60]
	mov	DWORD PTR _n2$[ebp], eax

; 302  : 	return n1 > n2 ? 1 : n1 < n2 ? -1 : 0;

	mov	ecx, DWORD PTR _n1$[ebp]
	cmp	ecx, DWORD PTR _n2$[ebp]
	jbe	SHORT $L70694
	mov	DWORD PTR -12+[ebp], 1
	jmp	SHORT $L70695
$L70694:
	mov	edx, DWORD PTR _n1$[ebp]
	cmp	edx, DWORD PTR _n2$[ebp]
	sbb	eax, eax
	mov	DWORD PTR -12+[ebp], eax
$L70695:
	mov	eax, DWORD PTR -12+[ebp]

; 303  : }

	mov	esp, ebp
	pop	ebp
	ret	0
_qsort_val_row ENDP
_TEXT	ENDS
PUBLIC	_qsort_val_fld
_BSS	SEGMENT
	ALIGN	4

$SG70434 DB	01H DUP (?)
	ALIGN	4

$SG70435 DB	01H DUP (?)
_BSS	ENDS
_TEXT	SEGMENT
_el1$ = 8
_el2$ = 12
_t1$ = -4
_t2$ = -8
_qsort_val_fld PROC NEAR

; 310  : {

	push	ebp
	mov	ebp, esp
	sub	esp, 16					; 00000010H

; 311  : 	char *t1 = ((DynTableCell *)el1)->field;

	mov	eax, DWORD PTR _el1$[ebp]
	mov	ecx, DWORD PTR [eax+8]
	mov	DWORD PTR _t1$[ebp], ecx

; 312  : 	char *t2 = ((DynTableCell *)el2)->field;

	mov	edx, DWORD PTR _el2$[ebp]
	mov	eax, DWORD PTR [edx+8]
	mov	DWORD PTR _t2$[ebp], eax

; 313  : 	return STRICMPNUL(t1, t2);

	cmp	DWORD PTR _t2$[ebp], 0
	je	SHORT $L70697
	mov	ecx, DWORD PTR _t2$[ebp]
	mov	DWORD PTR -12+[ebp], ecx
	jmp	SHORT $L70698
$L70697:
	mov	DWORD PTR -12+[ebp], OFFSET FLAT:$SG70434
$L70698:
	cmp	DWORD PTR _t1$[ebp], 0
	je	SHORT $L70699
	mov	edx, DWORD PTR _t1$[ebp]
	mov	DWORD PTR -16+[ebp], edx
	jmp	SHORT $L70700
$L70699:
	mov	DWORD PTR -16+[ebp], OFFSET FLAT:$SG70435
$L70700:
	mov	eax, DWORD PTR -12+[ebp]
	push	eax
	mov	ecx, DWORD PTR -16+[ebp]
	push	ecx
	call	_stricmp
	add	esp, 8

; 314  : }

	mov	esp, ebp
	pop	ebp
	ret	0
_qsort_val_fld ENDP
_TEXT	ENDS
PUBLIC	_qsort_val_fldnum
_TEXT	SEGMENT
_el1$ = 8
_el2$ = 12
_res$ = -4
_qsort_val_fldnum PROC NEAR

; 321  : {

	push	ebp
	mov	ebp, esp
	push	ecx

; 322  : 	int res = qsort_val_fld(el1, el2);

	mov	eax, DWORD PTR _el2$[ebp]
	push	eax
	mov	ecx, DWORD PTR _el1$[ebp]
	push	ecx
	call	_qsort_val_fld
	add	esp, 8
	mov	DWORD PTR _res$[ebp], eax

; 323  : 	if(!res) res = qsort_ctrlval(el1, el2);

	cmp	DWORD PTR _res$[ebp], 0
	jne	SHORT $L70442
	mov	edx, DWORD PTR _el2$[ebp]
	push	edx
	mov	eax, DWORD PTR _el1$[ebp]
	push	eax
	call	_qsort_ctrlval
	add	esp, 8
	mov	DWORD PTR _res$[ebp], eax
$L70442:

; 324  : 	return res;

	mov	eax, DWORD PTR _res$[ebp]

; 325  : }

	mov	esp, ebp
	pop	ebp
	ret	0
_qsort_val_fldnum ENDP
_el1$ = 8
_el2$ = 12
_res$ = -4
_qsort_ctrlval PROC NEAR

; 332  : {

	push	ebp
	mov	ebp, esp
	push	ecx

; 333  : 	int res = qsort_val_num(el1, el2);

	mov	eax, DWORD PTR _el2$[ebp]
	push	eax
	mov	ecx, DWORD PTR _el1$[ebp]
	push	ecx
	call	_qsort_val_num
	add	esp, 8
	mov	DWORD PTR _res$[ebp], eax

; 334  : 	if(!res)

	cmp	DWORD PTR _res$[ebp], 0
	jne	SHORT $L70450

; 336  : 		res = qsort_val_line(el1, el2);

	mov	edx, DWORD PTR _el2$[ebp]
	push	edx
	mov	eax, DWORD PTR _el1$[ebp]
	push	eax
	call	_qsort_val_line
	add	esp, 8
	mov	DWORD PTR _res$[ebp], eax

; 337  : 		if(!res) res = qsort_col0(el1, el2);

	cmp	DWORD PTR _res$[ebp], 0
	jne	SHORT $L70450
	mov	ecx, DWORD PTR _el2$[ebp]
	push	ecx
	mov	edx, DWORD PTR _el1$[ebp]
	push	edx
	call	_qsort_col0
	add	esp, 8
	mov	DWORD PTR _res$[ebp], eax
$L70450:

; 339  : 	return res;

	mov	eax, DWORD PTR _res$[ebp]

; 340  : }

	mov	esp, ebp
	pop	ebp
	ret	0
_qsort_ctrlval ENDP
_TEXT	ENDS
PUBLIC	_qsort_colval
_TEXT	SEGMENT
_el1$ = 8
_el2$ = 12
_res$ = -4
_qsort_colval PROC NEAR

; 347  : {

	push	ebp
	mov	ebp, esp
	push	ecx

; 348  : 	int res = qsort_val_idobj(el1, el2);

	mov	eax, DWORD PTR _el2$[ebp]
	push	eax
	mov	ecx, DWORD PTR _el1$[ebp]
	push	ecx
	call	_qsort_val_idobj
	add	esp, 8
	mov	DWORD PTR _res$[ebp], eax

; 349  : 	if(!res)

	cmp	DWORD PTR _res$[ebp], 0
	jne	SHORT $L70459

; 351  : 		res = qsort_val_col(el1, el2);

	mov	edx, DWORD PTR _el2$[ebp]
	push	edx
	mov	eax, DWORD PTR _el1$[ebp]
	push	eax
	call	_qsort_val_col
	add	esp, 8
	mov	DWORD PTR _res$[ebp], eax

; 352  : 		if(!res)

	cmp	DWORD PTR _res$[ebp], 0
	jne	SHORT $L70459

; 354  : 			res = qsort_val_row(el1, el2);

	mov	ecx, DWORD PTR _el2$[ebp]
	push	ecx
	mov	edx, DWORD PTR _el1$[ebp]
	push	edx
	call	_qsort_val_row
	add	esp, 8
	mov	DWORD PTR _res$[ebp], eax

; 355  : 			if(!res) res = qsort_val_fldnum(el1, el2);

	cmp	DWORD PTR _res$[ebp], 0
	jne	SHORT $L70459
	mov	eax, DWORD PTR _el2$[ebp]
	push	eax
	mov	ecx, DWORD PTR _el1$[ebp]
	push	ecx
	call	_qsort_val_fldnum
	add	esp, 8
	mov	DWORD PTR _res$[ebp], eax
$L70459:

; 358  : 	return res;

	mov	eax, DWORD PTR _res$[ebp]

; 359  : }

	mov	esp, ebp
	pop	ebp
	ret	0
_qsort_colval ENDP
_TEXT	ENDS
PUBLIC	_qsort_mode_values
_TEXT	SEGMENT
_el1$ = 8
_el2$ = 12
_res$ = -4
_e1$70471 = -8
_e2$70473 = -12
_qsort_mode_values PROC NEAR

; 366  : {

	push	ebp
	mov	ebp, esp
	sub	esp, 12					; 0000000cH

; 367  : 	int res = qsort_val_idobj(el1, el2);

	mov	eax, DWORD PTR _el2$[ebp]
	push	eax
	mov	ecx, DWORD PTR _el1$[ebp]
	push	ecx
	call	_qsort_val_idobj
	add	esp, 8
	mov	DWORD PTR _res$[ebp], eax

; 368  : 	if(!res) res = qsort_val_col(el1, el2);

	cmp	DWORD PTR _res$[ebp], 0
	jne	SHORT $L70466
	mov	edx, DWORD PTR _el2$[ebp]
	push	edx
	mov	eax, DWORD PTR _el1$[ebp]
	push	eax
	call	_qsort_val_col
	add	esp, 8
	mov	DWORD PTR _res$[ebp], eax
$L70466:

; 369  : 	if(!res) res = qsort_val_fld(el1, el2);

	cmp	DWORD PTR _res$[ebp], 0
	jne	SHORT $L70467
	mov	ecx, DWORD PTR _el2$[ebp]
	push	ecx
	mov	edx, DWORD PTR _el1$[ebp]
	push	edx
	call	_qsort_val_fld
	add	esp, 8
	mov	DWORD PTR _res$[ebp], eax
$L70467:

; 370  : 	if(!res) res = qsort_val_line(el1, el2);

	cmp	DWORD PTR _res$[ebp], 0
	jne	SHORT $L70468
	mov	eax, DWORD PTR _el2$[ebp]
	push	eax
	mov	ecx, DWORD PTR _el1$[ebp]
	push	ecx
	call	_qsort_val_line
	add	esp, 8
	mov	DWORD PTR _res$[ebp], eax
$L70468:

; 371  : 	if(!res) res = qsort_val_num(el1, el2);

	cmp	DWORD PTR _res$[ebp], 0
	jne	SHORT $L70469
	mov	edx, DWORD PTR _el2$[ebp]
	push	edx
	mov	eax, DWORD PTR _el1$[ebp]
	push	eax
	call	_qsort_val_num
	add	esp, 8
	mov	DWORD PTR _res$[ebp], eax
$L70469:

; 372  : 	if(!res)

	cmp	DWORD PTR _res$[ebp], 0
	jne	SHORT $L70470

; 374  : 		DynTableCell *e1 = (DynTableCell *)el1;

	mov	ecx, DWORD PTR _el1$[ebp]
	mov	DWORD PTR _e1$70471[ebp], ecx

; 375  : 		DynTableCell *e2 = (DynTableCell *)el2;

	mov	edx, DWORD PTR _el2$[ebp]
	mov	DWORD PTR _e2$70473[ebp], edx

; 376  : 		res = e1->Pkey < e2->Pkey ? 1 : -1;

	mov	eax, DWORD PTR _e1$70471[ebp]
	mov	ecx, DWORD PTR _e2$70473[ebp]
	mov	edx, DWORD PTR [eax+16]
	cmp	edx, DWORD PTR [ecx+16]
	sbb	eax, eax
	and	eax, 2
	add	eax, -1
	mov	DWORD PTR _res$[ebp], eax
$L70470:

; 378  : 	return res;

	mov	eax, DWORD PTR _res$[ebp]

; 379  : }

	mov	esp, ebp
	pop	ebp
	ret	0
_qsort_mode_values ENDP
_TEXT	ENDS
PUBLIC	_qsort_compare_values
_BSS	SEGMENT
	ALIGN	4

$SG70490 DB	01H DUP (?)
	ALIGN	4

$SG70491 DB	01H DUP (?)
_BSS	ENDS
_TEXT	SEGMENT
_el1$ = 8
_el2$ = 12
_res$ = -4
_e1$70486 = -8
_e2$70488 = -12
_qsort_compare_values PROC NEAR

; 386  : {

	push	ebp
	mov	ebp, esp
	sub	esp, 20					; 00000014H

; 387  : 	int res = qsort_val_idobj(el1, el2);

	mov	eax, DWORD PTR _el2$[ebp]
	push	eax
	mov	ecx, DWORD PTR _el1$[ebp]
	push	ecx
	call	_qsort_val_idobj
	add	esp, 8
	mov	DWORD PTR _res$[ebp], eax

; 388  : 	if(!res) res = qsort_val_col(el1, el2);

	cmp	DWORD PTR _res$[ebp], 0
	jne	SHORT $L70481
	mov	edx, DWORD PTR _el2$[ebp]
	push	edx
	mov	eax, DWORD PTR _el1$[ebp]
	push	eax
	call	_qsort_val_col
	add	esp, 8
	mov	DWORD PTR _res$[ebp], eax
$L70481:

; 389  : 	if(!res) res = qsort_val_fld(el1, el2);

	cmp	DWORD PTR _res$[ebp], 0
	jne	SHORT $L70482
	mov	ecx, DWORD PTR _el2$[ebp]
	push	ecx
	mov	edx, DWORD PTR _el1$[ebp]
	push	edx
	call	_qsort_val_fld
	add	esp, 8
	mov	DWORD PTR _res$[ebp], eax
$L70482:

; 390  : 	if(!res) res = qsort_val_line(el1, el2);

	cmp	DWORD PTR _res$[ebp], 0
	jne	SHORT $L70483
	mov	eax, DWORD PTR _el2$[ebp]
	push	eax
	mov	ecx, DWORD PTR _el1$[ebp]
	push	ecx
	call	_qsort_val_line
	add	esp, 8
	mov	DWORD PTR _res$[ebp], eax
$L70483:

; 391  : 	if(!res) res = qsort_val_num(el1, el2);

	cmp	DWORD PTR _res$[ebp], 0
	jne	SHORT $L70484
	mov	edx, DWORD PTR _el2$[ebp]
	push	edx
	mov	eax, DWORD PTR _el1$[ebp]
	push	eax
	call	_qsort_val_num
	add	esp, 8
	mov	DWORD PTR _res$[ebp], eax
$L70484:

; 392  : 	if(!res)

	cmp	DWORD PTR _res$[ebp], 0
	jne	SHORT $L70485

; 394  : 		DynTableCell *e1 = (DynTableCell *)el1;

	mov	ecx, DWORD PTR _el1$[ebp]
	mov	DWORD PTR _e1$70486[ebp], ecx

; 395  : 		DynTableCell *e2 = (DynTableCell *)el2;

	mov	edx, DWORD PTR _el2$[ebp]
	mov	DWORD PTR _e2$70488[ebp], edx

; 396  : 		res = STRCMPNUL(e1->txt, e2->txt);

	mov	eax, DWORD PTR _e2$70488[ebp]
	cmp	DWORD PTR [eax], 0
	je	SHORT $L70706
	mov	ecx, DWORD PTR _e2$70488[ebp]
	mov	edx, DWORD PTR [ecx]
	mov	DWORD PTR -16+[ebp], edx
	jmp	SHORT $L70707
$L70706:
	mov	DWORD PTR -16+[ebp], OFFSET FLAT:$SG70490
$L70707:
	mov	eax, DWORD PTR _e1$70486[ebp]
	cmp	DWORD PTR [eax], 0
	je	SHORT $L70708
	mov	ecx, DWORD PTR _e1$70486[ebp]
	mov	edx, DWORD PTR [ecx]
	mov	DWORD PTR -20+[ebp], edx
	jmp	SHORT $L70709
$L70708:
	mov	DWORD PTR -20+[ebp], OFFSET FLAT:$SG70491
$L70709:
	mov	eax, DWORD PTR -16+[ebp]
	push	eax
	mov	ecx, DWORD PTR -20+[ebp]
	push	ecx
	call	_strcmp
	add	esp, 8
	mov	DWORD PTR _res$[ebp], eax
$L70485:

; 398  : 	return res;

	mov	eax, DWORD PTR _res$[ebp]

; 399  : }

	mov	esp, ebp
	pop	ebp
	ret	0
_qsort_compare_values ENDP
_TEXT	ENDS
PUBLIC	_qsort_colobjdata
_TEXT	SEGMENT
_el1$ = 8
_el2$ = 12
_res$ = -4
_qsort_colobjdata PROC NEAR

; 406  : {

	push	ebp
	mov	ebp, esp
	push	ecx

; 407  : 	int res = qsort_val_col(el1, el2);

	mov	eax, DWORD PTR _el2$[ebp]
	push	eax
	mov	ecx, DWORD PTR _el1$[ebp]
	push	ecx
	call	_qsort_val_col
	add	esp, 8
	mov	DWORD PTR _res$[ebp], eax

; 408  : 	if(!res) res = qsort_val_fldnum(el1, el2);

	cmp	DWORD PTR _res$[ebp], 0
	jne	SHORT $L70498
	mov	edx, DWORD PTR _el2$[ebp]
	push	edx
	mov	eax, DWORD PTR _el1$[ebp]
	push	eax
	call	_qsort_val_fldnum
	add	esp, 8
	mov	DWORD PTR _res$[ebp], eax
$L70498:

; 409  : 	return res;

	mov	eax, DWORD PTR _res$[ebp]

; 410  : }

	mov	esp, ebp
	pop	ebp
	ret	0
_qsort_colobjdata ENDP
_TEXT	ENDS
PUBLIC	_dyntab_group
EXTRN	_dbl_str:NEAR
EXTRN	__snprintf:NEAR
EXTRN	_sscanf:NEAR
EXTRN	_dynbuf_add:NEAR
EXTRN	_dyntab_free:NEAR
EXTRN	_dyntab_val:NEAR
EXTRN	_dyntab_add:NEAR
EXTRN	_dyntab_del_rows:NEAR
_BSS	SEGMENT
	ALIGN	4

$SG70553 DB	01H DUP (?)
	ALIGN	4

$SG70554 DB	01H DUP (?)
_BSS	ENDS
_DATA	SEGMENT
	ORG $+2
$SG70506 DB	'SUM', 00H
$SG70516 DB	'AVG', 00H
$SG70526 DB	'%lf', 00H
$SG70531 DB	'MIN', 00H
$SG70532 DB	'MAX', 00H
$SG70533 DB	'NMIN', 00H
	ORG $+3
$SG70534 DB	'NMAX', 00H
	ORG $+3
$SG70536 DB	'MIN', 00H
$SG70537 DB	'MAX', 00H
$SG70538 DB	'NMIN', 00H
	ORG $+3
$SG70541 DB	'DISTINCT', 00H
	ORG $+3
$SG70556 DB	'FIRST', 00H
	ORG $+2
$SG70560 DB	'LIST', 00H
	ORG $+3
$SG70561 DB	'LINES', 00H
	ORG $+2
$SG70562 DB	'SPACE', 00H
	ORG $+2
$SG70565 DB	'LIST', 00H
	ORG $+3
$SG70566 DB	', ', 00H
	ORG $+1
$SG70567 DB	'SPACE', 00H
	ORG $+2
$SG70568 DB	' ', 00H
	ORG $+2
$SG70569 DB	0aH, 00H
	ORG $+2
$SG70582 DB	'COUNT', 00H
	ORG $+2
$SG70586 DB	'%lu', 00H
$SG70588 DB	'COUNT_DISTINCT', 00H
	ORG $+1
$SG70592 DB	'DISTINCT', 00H
	ORG $+3
$SG70594 DB	'%lu', 00H
$SG70596 DB	'TEL', 00H
$SG70605 DB	'%.2s %.2s %.2s %.2s %.2s', 00H
_DATA	ENDS
_TEXT	SEGMENT
_tab$ = 8
_oper$ = 12
_sum$70507 = -8
_i$70508 = -28
_s$70509 = -24
_sum$70517 = -40
_i$70518 = -60
_nb$70519 = -32
_s$70520 = -56
_v$70524 = -64
_n$70525 = -72
_i$70542 = -76
_j$70543 = -80
_v1$70550 = -84
_v2$70551 = -88
_i$70563 = -100
_s$70564 = -96
_buf$70570 = -92
_c$70575 = -104
_i$70583 = -124
_s$70584 = -120
_i$70589 = -144
_s$70590 = -140
_tel$70597 = -164
_i$70598 = -148
_c$70602 = -168
_dyntab_group PROC NEAR

; 419  : ){

	push	ebp
	mov	ebp, esp
	sub	esp, 220				; 000000dcH

; 420  : 	if(!tab) return 0;

	cmp	DWORD PTR _tab$[ebp], 0
	jne	SHORT $L70504
	xor	eax, eax
	jmp	$L70503
$L70504:

; 421  : 
; 422  : 	/* Handle sum operation mode */
; 423  : 	if(!strcmp(oper, "SUM"))

	push	OFFSET FLAT:$SG70506
	mov	eax, DWORD PTR _oper$[ebp]
	push	eax
	call	_strcmp
	add	esp, 8
	test	eax, eax
	jne	$L70505

; 425  : 		double sum = 0;

	mov	DWORD PTR _sum$70507[ebp], 0
	mov	DWORD PTR _sum$70507[ebp+4], 0

; 426  : 		unsigned long i;
; 427  : 		char s[16];
; 428  : 		for(i = 0; i < tab->nbrows; i++) sum += atof(dyntab_val(tab, i, 0));

	mov	DWORD PTR _i$70508[ebp], 0
	jmp	SHORT $L70510
$L70511:
	mov	ecx, DWORD PTR _i$70508[ebp]
	add	ecx, 1
	mov	DWORD PTR _i$70508[ebp], ecx
$L70510:
	mov	edx, DWORD PTR _tab$[ebp]
	mov	eax, DWORD PTR _i$70508[ebp]
	cmp	eax, DWORD PTR [edx]
	jae	SHORT $L70512
	push	0
	mov	ecx, DWORD PTR _i$70508[ebp]
	push	ecx
	mov	edx, DWORD PTR _tab$[ebp]
	push	edx
	call	_dyntab_val
	add	esp, 12					; 0000000cH
	push	eax
	call	_atof
	add	esp, 4
	fadd	QWORD PTR _sum$70507[ebp]
	fstp	QWORD PTR _sum$70507[ebp]
	jmp	SHORT $L70511
$L70512:

; 429  : 		dyntab_free(tab);

	mov	eax, DWORD PTR _tab$[ebp]
	push	eax
	call	_dyntab_free
	add	esp, 4

; 430  : 		return dyntab_add(tab, 0, 0, s, dbl_str(s, sum, NULL), NO_CONV);

	push	0
	push	0
	push	0
	mov	ecx, DWORD PTR _sum$70507[ebp+4]
	push	ecx
	mov	edx, DWORD PTR _sum$70507[ebp]
	push	edx
	lea	eax, DWORD PTR _s$70509[ebp]
	push	eax
	call	_dbl_str
	add	esp, 16					; 00000010H
	push	eax
	lea	ecx, DWORD PTR _s$70509[ebp]
	push	ecx
	push	0
	push	0
	mov	edx, DWORD PTR _tab$[ebp]
	push	edx
	call	_dyntab_add
	add	esp, 28					; 0000001cH
	jmp	$L70503
$L70505:

; 432  : 
; 433  : 	/* Handle average operation mode */
; 434  : 	if(!strcmp(oper, "AVG"))

	push	OFFSET FLAT:$SG70516
	mov	eax, DWORD PTR _oper$[ebp]
	push	eax
	call	_strcmp
	add	esp, 8
	test	eax, eax
	jne	$L70515

; 436  : 		double sum = 0;

	mov	DWORD PTR _sum$70517[ebp], 0
	mov	DWORD PTR _sum$70517[ebp+4], 0

; 437  : 		unsigned long i, nb;
; 438  : 		char s[16];
; 439  : 		for(i = 0, nb = 0; i < tab->nbrows; i++)

	mov	DWORD PTR _i$70518[ebp], 0
	mov	DWORD PTR _nb$70519[ebp], 0
	jmp	SHORT $L70521
$L70522:
	mov	ecx, DWORD PTR _i$70518[ebp]
	add	ecx, 1
	mov	DWORD PTR _i$70518[ebp], ecx
$L70521:
	mov	edx, DWORD PTR _tab$[ebp]
	mov	eax, DWORD PTR _i$70518[ebp]
	cmp	eax, DWORD PTR [edx]
	jae	SHORT $L70523

; 441  : 			char *v = dyntab_val(tab, i, 0);

	push	0
	mov	ecx, DWORD PTR _i$70518[ebp]
	push	ecx
	mov	edx, DWORD PTR _tab$[ebp]
	push	edx
	call	_dyntab_val
	add	esp, 12					; 0000000cH
	mov	DWORD PTR _v$70524[ebp], eax

; 442  : 			double n;
; 443  : 			nb += sscanf(v, "%lf", &n);

	lea	eax, DWORD PTR _n$70525[ebp]
	push	eax
	push	OFFSET FLAT:$SG70526
	mov	ecx, DWORD PTR _v$70524[ebp]
	push	ecx
	call	_sscanf
	add	esp, 12					; 0000000cH
	mov	edx, DWORD PTR _nb$70519[ebp]
	add	edx, eax
	mov	DWORD PTR _nb$70519[ebp], edx

; 444  : 			sum += n;

	fld	QWORD PTR _sum$70517[ebp]
	fadd	QWORD PTR _n$70525[ebp]
	fstp	QWORD PTR _sum$70517[ebp]

; 445  : 		}

	jmp	SHORT $L70522
$L70523:

; 446  : 		dyntab_free(tab);

	mov	eax, DWORD PTR _tab$[ebp]
	push	eax
	call	_dyntab_free
	add	esp, 4

; 447  : 		return dyntab_add(tab, 0, 0, s, dbl_str(s, nb ? sum / nb : 0, NULL), NO_CONV);

	cmp	DWORD PTR _nb$70519[ebp], 0
	je	SHORT $L70712
	mov	ecx, DWORD PTR _nb$70519[ebp]
	mov	DWORD PTR -176+[ebp], ecx
	mov	DWORD PTR -176+[ebp+4], 0
	fild	QWORD PTR -176+[ebp]
	fdivr	QWORD PTR _sum$70517[ebp]
	fstp	QWORD PTR -184+[ebp]
	jmp	SHORT $L70713
$L70712:
	mov	DWORD PTR -184+[ebp], 0
	mov	DWORD PTR -184+[ebp+4], 0
$L70713:
	push	0
	push	0
	push	0
	mov	edx, DWORD PTR -184+[ebp+4]
	push	edx
	mov	eax, DWORD PTR -184+[ebp]
	push	eax
	lea	ecx, DWORD PTR _s$70520[ebp]
	push	ecx
	call	_dbl_str
	add	esp, 16					; 00000010H
	push	eax
	lea	edx, DWORD PTR _s$70520[ebp]
	push	edx
	push	0
	push	0
	mov	eax, DWORD PTR _tab$[ebp]
	push	eax
	call	_dyntab_add
	add	esp, 28					; 0000001cH
	jmp	$L70503
$L70515:

; 449  : 
; 450  : 	/* Handle minimum / maximum operation mode */
; 451  : 	if(!strcmp(oper, "MIN") || !strcmp(oper, "MAX") || !strcmp(oper, "NMIN") || !strcmp(oper, "NMAX"))

	push	OFFSET FLAT:$SG70531
	mov	ecx, DWORD PTR _oper$[ebp]
	push	ecx
	call	_strcmp
	add	esp, 8
	test	eax, eax
	je	SHORT $L70530
	push	OFFSET FLAT:$SG70532
	mov	edx, DWORD PTR _oper$[ebp]
	push	edx
	call	_strcmp
	add	esp, 8
	test	eax, eax
	je	SHORT $L70530
	push	OFFSET FLAT:$SG70533
	mov	eax, DWORD PTR _oper$[ebp]
	push	eax
	call	_strcmp
	add	esp, 8
	test	eax, eax
	je	SHORT $L70530
	push	OFFSET FLAT:$SG70534
	mov	ecx, DWORD PTR _oper$[ebp]
	push	ecx
	call	_strcmp
	add	esp, 8
	test	eax, eax
	jne	$L70529
$L70530:

; 453  : 		if(tab->nbrows > 1)

	mov	edx, DWORD PTR _tab$[ebp]
	cmp	DWORD PTR [edx], 1
	jbe	$L70535

; 454  : 			dyntab_sort(tab, !strcmp(oper, "MIN") ? qsort_col0 : !strcmp(oper, "MAX") ? qsort_col0desc :
; 455  : 							 !strcmp(oper, "NMIN") ? qsort_col0i : qsort_col0idesc);

	push	OFFSET FLAT:$SG70536
	mov	eax, DWORD PTR _oper$[ebp]
	push	eax
	call	_strcmp
	add	esp, 8
	test	eax, eax
	jne	SHORT $L70718
	mov	DWORD PTR -188+[ebp], OFFSET FLAT:_qsort_col0
	jmp	SHORT $L70719
$L70718:
	push	OFFSET FLAT:$SG70537
	mov	ecx, DWORD PTR _oper$[ebp]
	push	ecx
	call	_strcmp
	add	esp, 8
	test	eax, eax
	jne	SHORT $L70716
	mov	DWORD PTR -192+[ebp], OFFSET FLAT:_qsort_col0desc
	jmp	SHORT $L70717
$L70716:
	push	OFFSET FLAT:$SG70538
	mov	edx, DWORD PTR _oper$[ebp]
	push	edx
	call	_strcmp
	add	esp, 8
	test	eax, eax
	jne	SHORT $L70714
	mov	DWORD PTR -196+[ebp], OFFSET FLAT:_qsort_col0i
	jmp	SHORT $L70715
$L70714:
	mov	DWORD PTR -196+[ebp], OFFSET FLAT:_qsort_col0idesc
$L70715:
	mov	eax, DWORD PTR -196+[ebp]
	mov	DWORD PTR -192+[ebp], eax
$L70717:
	mov	ecx, DWORD PTR -192+[ebp]
	mov	DWORD PTR -188+[ebp], ecx
$L70719:
	mov	edx, DWORD PTR -188+[ebp]
	push	edx
	mov	eax, DWORD PTR _tab$[ebp]
	push	eax
	call	_dyntab_sort
	add	esp, 8
$L70535:

; 456  : 		if(tab->cell)

	mov	ecx, DWORD PTR _tab$[ebp]
	cmp	DWORD PTR [ecx+16], 0
	je	SHORT $L70539

; 458  : 			tab->cell->Num = 0;

	mov	edx, DWORD PTR _tab$[ebp]
	mov	eax, DWORD PTR [edx+16]
	mov	DWORD PTR [eax+36], 0

; 459  : 			tab->cell->Line = 0;

	mov	ecx, DWORD PTR _tab$[ebp]
	mov	edx, DWORD PTR [ecx+16]
	mov	DWORD PTR [edx+40], 0

; 460  : 			tab->nbrows = 1;

	mov	eax, DWORD PTR _tab$[ebp]
	mov	DWORD PTR [eax], 1
$L70539:

; 462  : 		return 0;

	xor	eax, eax
	jmp	$L70503
$L70529:

; 464  : 
; 465  : 	/* Handle distinct values operation mode */
; 466  : 	if(!strcmp(oper, "DISTINCT"))

	push	OFFSET FLAT:$SG70541
	mov	ecx, DWORD PTR _oper$[ebp]
	push	ecx
	call	_strcmp
	add	esp, 8
	test	eax, eax
	jne	$L70540

; 468  : 		unsigned long i, j;
; 469  : 		for(i = 0; i < tab->nbrows; i++)

	mov	DWORD PTR _i$70542[ebp], 0
	jmp	SHORT $L70544
$L70545:
	mov	edx, DWORD PTR _i$70542[ebp]
	add	edx, 1
	mov	DWORD PTR _i$70542[ebp], edx
$L70544:
	mov	eax, DWORD PTR _tab$[ebp]
	mov	ecx, DWORD PTR _i$70542[ebp]
	cmp	ecx, DWORD PTR [eax]
	jae	$L70546

; 470  : 			for(j = i + 1; j < tab->nbrows; j ++)

	mov	edx, DWORD PTR _i$70542[ebp]
	add	edx, 1
	mov	DWORD PTR _j$70543[ebp], edx
	jmp	SHORT $L70547
$L70548:
	mov	eax, DWORD PTR _j$70543[ebp]
	add	eax, 1
	mov	DWORD PTR _j$70543[ebp], eax
$L70547:
	mov	ecx, DWORD PTR _tab$[ebp]
	mov	edx, DWORD PTR _j$70543[ebp]
	cmp	edx, DWORD PTR [ecx]
	jae	$L70549

; 472  : 				DynTableCell *v1 = dyntab_cell(tab, i, 0);

	push	0
	mov	eax, DWORD PTR _i$70542[ebp]
	push	eax
	mov	ecx, DWORD PTR _tab$[ebp]
	push	ecx
	call	_dyntab_cell
	add	esp, 12					; 0000000cH
	mov	DWORD PTR _v1$70550[ebp], eax

; 473  : 				DynTableCell *v2 = dyntab_cell(tab, j, 0);

	push	0
	mov	edx, DWORD PTR _j$70543[ebp]
	push	edx
	mov	eax, DWORD PTR _tab$[ebp]
	push	eax
	call	_dyntab_cell
	add	esp, 12					; 0000000cH
	mov	DWORD PTR _v2$70551[ebp], eax

; 474  : 				if(!STRCMPNUL(v1->txt, v2->txt)) dyntab_del_rows(tab, j--, 1);

	mov	ecx, DWORD PTR _v2$70551[ebp]
	cmp	DWORD PTR [ecx], 0
	je	SHORT $L70720
	mov	edx, DWORD PTR _v2$70551[ebp]
	mov	eax, DWORD PTR [edx]
	mov	DWORD PTR -200+[ebp], eax
	jmp	SHORT $L70721
$L70720:
	mov	DWORD PTR -200+[ebp], OFFSET FLAT:$SG70553
$L70721:
	mov	ecx, DWORD PTR _v1$70550[ebp]
	cmp	DWORD PTR [ecx], 0
	je	SHORT $L70722
	mov	edx, DWORD PTR _v1$70550[ebp]
	mov	eax, DWORD PTR [edx]
	mov	DWORD PTR -204+[ebp], eax
	jmp	SHORT $L70723
$L70722:
	mov	DWORD PTR -204+[ebp], OFFSET FLAT:$SG70554
$L70723:
	mov	ecx, DWORD PTR -200+[ebp]
	push	ecx
	mov	edx, DWORD PTR -204+[ebp]
	push	edx
	call	_strcmp
	add	esp, 8
	test	eax, eax
	jne	SHORT $L70552
	push	1
	mov	eax, DWORD PTR _j$70543[ebp]
	mov	DWORD PTR -208+[ebp], eax
	mov	ecx, DWORD PTR -208+[ebp]
	push	ecx
	mov	edx, DWORD PTR _tab$[ebp]
	push	edx
	mov	eax, DWORD PTR _j$70543[ebp]
	sub	eax, 1
	mov	DWORD PTR _j$70543[ebp], eax
	call	_dyntab_del_rows
	add	esp, 12					; 0000000cH
$L70552:

; 475  : 			}

	jmp	$L70548
$L70549:
	jmp	$L70545
$L70546:

; 476  : 		return 0;

	xor	eax, eax
	jmp	$L70503
$L70540:

; 478  : 
; 479  : 	/* Handle first value operation mode */
; 480  : 	if(!strcmp(oper, "FIRST"))

	push	OFFSET FLAT:$SG70556
	mov	ecx, DWORD PTR _oper$[ebp]
	push	ecx
	call	_strcmp
	add	esp, 8
	test	eax, eax
	jne	SHORT $L70555

; 482  : 		if(!tab->nbcols) return 0;

	mov	edx, DWORD PTR _tab$[ebp]
	cmp	DWORD PTR [edx+8], 0
	jne	SHORT $L70557
	xor	eax, eax
	jmp	$L70503
$L70557:

; 483  : 		tab->nbrows = 1;

	mov	eax, DWORD PTR _tab$[ebp]
	mov	DWORD PTR [eax], 1

; 484  : 		tab->nbcols = 1;

	mov	ecx, DWORD PTR _tab$[ebp]
	mov	DWORD PTR [ecx+8], 1

; 485  : 		return 0;

	xor	eax, eax
	jmp	$L70503
$L70555:

; 487  : 
; 488  : 	/* Handle values list operation mode */
; 489  : 	if(!strcmp(oper, "LIST") || !strcmp(oper, "LINES") || !strcmp(oper, "SPACE"))

	push	OFFSET FLAT:$SG70560
	mov	edx, DWORD PTR _oper$[ebp]
	push	edx
	call	_strcmp
	add	esp, 8
	test	eax, eax
	je	SHORT $L70559
	push	OFFSET FLAT:$SG70561
	mov	eax, DWORD PTR _oper$[ebp]
	push	eax
	call	_strcmp
	add	esp, 8
	test	eax, eax
	je	SHORT $L70559
	push	OFFSET FLAT:$SG70562
	mov	ecx, DWORD PTR _oper$[ebp]
	push	ecx
	call	_strcmp
	add	esp, 8
	test	eax, eax
	jne	$L70558
$L70559:

; 491  : 		unsigned long i;
; 492  : 		char *s = !strcmp(oper, "LIST") ? ", " : !strcmp(oper, "SPACE") ? " ": "\n";

	push	OFFSET FLAT:$SG70565
	mov	edx, DWORD PTR _oper$[ebp]
	push	edx
	call	_strcmp
	add	esp, 8
	test	eax, eax
	jne	SHORT $L70726
	mov	DWORD PTR -212+[ebp], OFFSET FLAT:$SG70566
	jmp	SHORT $L70727
$L70726:
	push	OFFSET FLAT:$SG70567
	mov	eax, DWORD PTR _oper$[ebp]
	push	eax
	call	_strcmp
	add	esp, 8
	test	eax, eax
	jne	SHORT $L70724
	mov	DWORD PTR -216+[ebp], OFFSET FLAT:$SG70568
	jmp	SHORT $L70725
$L70724:
	mov	DWORD PTR -216+[ebp], OFFSET FLAT:$SG70569
$L70725:
	mov	ecx, DWORD PTR -216+[ebp]
	mov	DWORD PTR -212+[ebp], ecx
$L70727:
	mov	edx, DWORD PTR -212+[ebp]
	mov	DWORD PTR _s$70564[ebp], edx

; 493  : 		DynBuffer *buf = NULL;

	mov	DWORD PTR _buf$70570[ebp], 0

; 494  : 		for(i = 0; i < tab->nbrows; i++)

	mov	DWORD PTR _i$70563[ebp], 0
	jmp	SHORT $L70572
$L70573:
	mov	eax, DWORD PTR _i$70563[ebp]
	add	eax, 1
	mov	DWORD PTR _i$70563[ebp], eax
$L70572:
	mov	ecx, DWORD PTR _tab$[ebp]
	mov	edx, DWORD PTR _i$70563[ebp]
	cmp	edx, DWORD PTR [ecx]
	jae	SHORT $L70574

; 496  : 			DynTableCell *c = dyntab_cell(tab, i, 0);

	push	0
	mov	eax, DWORD PTR _i$70563[ebp]
	push	eax
	mov	ecx, DWORD PTR _tab$[ebp]
	push	ecx
	call	_dyntab_cell
	add	esp, 12					; 0000000cH
	mov	DWORD PTR _c$70575[ebp], eax

; 497  : 			if(i && dynbuf_add(&buf, s, 0, NO_CONV)) return 1;

	cmp	DWORD PTR _i$70563[ebp], 0
	je	SHORT $L70577
	push	0
	push	0
	push	0
	mov	edx, DWORD PTR _s$70564[ebp]
	push	edx
	lea	eax, DWORD PTR _buf$70570[ebp]
	push	eax
	call	_dynbuf_add
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L70577
	mov	eax, 1
	jmp	$L70503
$L70577:

; 498  : 			if(dynbuf_add(&buf, c->txt, c->len, NO_CONV)) return 1;

	push	0
	push	0
	mov	ecx, DWORD PTR _c$70575[ebp]
	mov	edx, DWORD PTR [ecx+4]
	push	edx
	mov	eax, DWORD PTR _c$70575[ebp]
	mov	ecx, DWORD PTR [eax]
	push	ecx
	lea	edx, DWORD PTR _buf$70570[ebp]
	push	edx
	call	_dynbuf_add
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L70579
	mov	eax, 1
	jmp	$L70503
$L70579:

; 499  : 		}

	jmp	SHORT $L70573
$L70574:

; 500  : 		dyntab_free(tab);

	mov	eax, DWORD PTR _tab$[ebp]
	push	eax
	call	_dyntab_free
	add	esp, 4

; 501  : 		return !buf ? 0 : dyntab_add(tab, 0, 0, buf->data, buf->cnt, NO_CONV);

	cmp	DWORD PTR _buf$70570[ebp], 0
	jne	SHORT $L70728
	mov	DWORD PTR -220+[ebp], 0
	jmp	SHORT $L70729
$L70728:
	push	0
	push	0
	mov	ecx, DWORD PTR _buf$70570[ebp]
	mov	edx, DWORD PTR [ecx+4]
	push	edx
	mov	eax, DWORD PTR _buf$70570[ebp]
	add	eax, 8
	push	eax
	push	0
	push	0
	mov	ecx, DWORD PTR _tab$[ebp]
	push	ecx
	call	_dyntab_add
	add	esp, 28					; 0000001cH
	mov	DWORD PTR -220+[ebp], eax
$L70729:
	mov	eax, DWORD PTR -220+[ebp]
	jmp	$L70503
$L70558:

; 503  : 
; 504  : 	/* Handle count operation mode */
; 505  : 	if(!strcmp(oper, "COUNT"))

	push	OFFSET FLAT:$SG70582
	mov	edx, DWORD PTR _oper$[ebp]
	push	edx
	call	_strcmp
	add	esp, 8
	test	eax, eax
	jne	SHORT $L70581

; 507  : 		unsigned long i = tab->nbrows;

	mov	eax, DWORD PTR _tab$[ebp]
	mov	ecx, DWORD PTR [eax]
	mov	DWORD PTR _i$70583[ebp], ecx

; 508  : 		char s[16];
; 509  : 		dyntab_free(tab);

	mov	edx, DWORD PTR _tab$[ebp]
	push	edx
	call	_dyntab_free
	add	esp, 4

; 510  : 		return dyntab_add(tab, 0, 0, s, snprintf(add_sz_str(s), "%lu", i), NO_CONV);

	push	0
	push	0
	mov	eax, DWORD PTR _i$70583[ebp]
	push	eax
	push	OFFSET FLAT:$SG70586
	push	15					; 0000000fH
	lea	ecx, DWORD PTR _s$70584[ebp]
	push	ecx
	call	__snprintf
	add	esp, 16					; 00000010H
	push	eax
	lea	edx, DWORD PTR _s$70584[ebp]
	push	edx
	push	0
	push	0
	mov	eax, DWORD PTR _tab$[ebp]
	push	eax
	call	_dyntab_add
	add	esp, 28					; 0000001cH
	jmp	$L70503
$L70581:

; 512  : 
; 513  : 	/* Handle count distinct values operation mode */
; 514  : 	if(!strcmp(oper, "COUNT_DISTINCT"))

	push	OFFSET FLAT:$SG70588
	mov	ecx, DWORD PTR _oper$[ebp]
	push	ecx
	call	_strcmp
	add	esp, 8
	test	eax, eax
	jne	SHORT $L70587

; 516  : 		unsigned long i;
; 517  : 		char s[16];
; 518  : 		if(dyntab_group(tab, "DISTINCT")) return 1;

	push	OFFSET FLAT:$SG70592
	mov	edx, DWORD PTR _tab$[ebp]
	push	edx
	call	_dyntab_group
	add	esp, 8
	test	eax, eax
	je	SHORT $L70591
	mov	eax, 1
	jmp	$L70503
$L70591:

; 519  : 		i = tab->nbrows;

	mov	eax, DWORD PTR _tab$[ebp]
	mov	ecx, DWORD PTR [eax]
	mov	DWORD PTR _i$70589[ebp], ecx

; 520  : 		dyntab_free(tab);

	mov	edx, DWORD PTR _tab$[ebp]
	push	edx
	call	_dyntab_free
	add	esp, 4

; 521  : 		return dyntab_add(tab, 0, 0, s, snprintf(add_sz_str(s), "%lu", i), NO_CONV);

	push	0
	push	0
	mov	eax, DWORD PTR _i$70589[ebp]
	push	eax
	push	OFFSET FLAT:$SG70594
	push	15					; 0000000fH
	lea	ecx, DWORD PTR _s$70590[ebp]
	push	ecx
	call	__snprintf
	add	esp, 16					; 00000010H
	push	eax
	lea	edx, DWORD PTR _s$70590[ebp]
	push	edx
	push	0
	push	0
	mov	eax, DWORD PTR _tab$[ebp]
	push	eax
	call	_dyntab_add
	add	esp, 28					; 0000001cH
	jmp	$L70503
$L70587:

; 523  : 
; 524  : 	/* Handle telephone format */
; 525  : 	if(!strcmp(oper, "TEL"))

	push	OFFSET FLAT:$SG70596
	mov	ecx, DWORD PTR _oper$[ebp]
	push	ecx
	call	_strcmp
	add	esp, 8
	test	eax, eax
	jne	$L70595

; 527  : 		char tel[16];
; 528  : 		unsigned long i;
; 529  : 		for(i = 0; i < tab->nbrows; i++)

	mov	DWORD PTR _i$70598[ebp], 0
	jmp	SHORT $L70599
$L70600:
	mov	edx, DWORD PTR _i$70598[ebp]
	add	edx, 1
	mov	DWORD PTR _i$70598[ebp], edx
$L70599:
	mov	eax, DWORD PTR _tab$[ebp]
	mov	ecx, DWORD PTR _i$70598[ebp]
	cmp	ecx, DWORD PTR [eax]
	jae	$L70601

; 531  : 			DynTableCell *c = dyntab_cell(tab, i, 0);

	push	0
	mov	edx, DWORD PTR _i$70598[ebp]
	push	edx
	mov	eax, DWORD PTR _tab$[ebp]
	push	eax
	call	_dyntab_cell
	add	esp, 12					; 0000000cH
	mov	DWORD PTR _c$70602[ebp], eax

; 532  : 
; 533  : 			/* French numbers format */
; 534  : 			if(!c->txt || *c->txt != '0' || c->len != 10) continue;

	mov	ecx, DWORD PTR _c$70602[ebp]
	cmp	DWORD PTR [ecx], 0
	je	SHORT $L70604
	mov	edx, DWORD PTR _c$70602[ebp]
	mov	eax, DWORD PTR [edx]
	movsx	ecx, BYTE PTR [eax]
	cmp	ecx, 48					; 00000030H
	jne	SHORT $L70604
	mov	edx, DWORD PTR _c$70602[ebp]
	cmp	DWORD PTR [edx+4], 10			; 0000000aH
	je	SHORT $L70603
$L70604:
	jmp	SHORT $L70600
$L70603:

; 535  : 			snprintf(add_sz_str(tel), "%.2s %.2s %.2s %.2s %.2s", c->txt, c->txt + 2, c->txt + 4, c->txt + 6, c->txt + 8);

	mov	eax, DWORD PTR _c$70602[ebp]
	mov	ecx, DWORD PTR [eax]
	add	ecx, 8
	push	ecx
	mov	edx, DWORD PTR _c$70602[ebp]
	mov	eax, DWORD PTR [edx]
	add	eax, 6
	push	eax
	mov	ecx, DWORD PTR _c$70602[ebp]
	mov	edx, DWORD PTR [ecx]
	add	edx, 4
	push	edx
	mov	eax, DWORD PTR _c$70602[ebp]
	mov	ecx, DWORD PTR [eax]
	add	ecx, 2
	push	ecx
	mov	edx, DWORD PTR _c$70602[ebp]
	mov	eax, DWORD PTR [edx]
	push	eax
	push	OFFSET FLAT:$SG70605
	push	15					; 0000000fH
	lea	ecx, DWORD PTR _tel$70597[ebp]
	push	ecx
	call	__snprintf
	add	esp, 32					; 00000020H

; 536  : 			dyntab_add(tab, i, 0, tel, 14, NO_CONV);

	push	0
	push	0
	push	14					; 0000000eH
	lea	edx, DWORD PTR _tel$70597[ebp]
	push	edx
	push	0
	mov	eax, DWORD PTR _i$70598[ebp]
	push	eax
	mov	ecx, DWORD PTR _tab$[ebp]
	push	ecx
	call	_dyntab_add
	add	esp, 28					; 0000001cH

; 537  : 		}

	jmp	$L70600
$L70601:

; 538  : 		return 0;

	xor	eax, eax
	jmp	SHORT $L70503
$L70595:

; 540  : 	return 1;

	mov	eax, 1
$L70503:

; 541  : }

	mov	esp, ebp
	pop	ebp
	ret	0
_dyntab_group ENDP
_TEXT	ENDS
END
