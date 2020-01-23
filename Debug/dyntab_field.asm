	TITLE	D:\Travail\ABI\EVA\V4.0\CGI\Brunix-2016\dyntab_field.c
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
PUBLIC	_dyntab_next_field
EXTRN	_dyntab_cell:NEAR
EXTRN	_strcmp:NEAR
_BSS	SEGMENT
$SG1417	DB	01H DUP (?)
	ALIGN	4

$SG1418	DB	01H DUP (?)
_BSS	ENDS
_TEXT	SEGMENT
_tab$ = 8
_field$ = 12
_line$ = 16
_matchcol$ = 20
_matchmode$ = 24
_row$ = 28
_i$ = -4
_cell$1413 = -8
_dyntab_next_field PROC NEAR

; 33   : ){

	push	ebp
	mov	ebp, esp
	sub	esp, 32					; 00000020H

; 34   : 	unsigned long i;
; 35   : 
; 36   : 	if(!tab) return 0;

	cmp	DWORD PTR _tab$[ebp], 0
	jne	SHORT $L1407
	xor	eax, eax
	jmp	$L1405
$L1407:

; 37   : 	if(!tab->nbrows || (matchmode != 2 && matchcol >= tab->nbcols)) return tab->nbrows;

	mov	eax, DWORD PTR _tab$[ebp]
	cmp	DWORD PTR [eax], 0
	je	SHORT $L1409
	cmp	DWORD PTR _matchmode$[ebp], 2
	je	SHORT $L1408
	mov	ecx, DWORD PTR _tab$[ebp]
	mov	edx, DWORD PTR _matchcol$[ebp]
	cmp	edx, DWORD PTR [ecx+8]
	jb	SHORT $L1408
$L1409:
	mov	eax, DWORD PTR _tab$[ebp]
	mov	eax, DWORD PTR [eax]
	jmp	$L1405
$L1408:

; 38   : 
; 39   : 	for(i = row; i < tab->nbrows; i++)

	mov	ecx, DWORD PTR _row$[ebp]
	mov	DWORD PTR _i$[ebp], ecx
	jmp	SHORT $L1410
$L1411:
	mov	edx, DWORD PTR _i$[ebp]
	add	edx, 1
	mov	DWORD PTR _i$[ebp], edx
$L1410:
	mov	eax, DWORD PTR _tab$[ebp]
	mov	ecx, DWORD PTR _i$[ebp]
	cmp	ecx, DWORD PTR [eax]
	jae	$L1412

; 41   : 		DynTableCell *cell = dyntab_cell(tab, i, matchmode == 2 ? 0 : matchcol);

	mov	edx, DWORD PTR _matchmode$[ebp]
	sub	edx, 2
	neg	edx
	sbb	edx, edx
	and	edx, DWORD PTR _matchcol$[ebp]
	push	edx
	mov	eax, DWORD PTR _i$[ebp]
	push	eax
	mov	ecx, DWORD PTR _tab$[ebp]
	push	ecx
	call	_dyntab_cell
	add	esp, 12					; 0000000cH
	mov	DWORD PTR _cell$1413[ebp], eax

; 42   : 		if(!cell) continue;

	cmp	DWORD PTR _cell$1413[ebp], 0
	jne	SHORT $L1414
	jmp	SHORT $L1411
$L1414:

; 43   : 		if(cell->IdObj != tab->cell[row].IdObj) return tab->nbrows;

	mov	edx, DWORD PTR _row$[ebp]
	shl	edx, 6
	mov	eax, DWORD PTR _tab$[ebp]
	mov	ecx, DWORD PTR [eax+16]
	mov	eax, DWORD PTR _cell$1413[ebp]
	mov	eax, DWORD PTR [eax+20]
	cmp	eax, DWORD PTR [ecx+edx+20]
	je	SHORT $L1415
	mov	ecx, DWORD PTR _tab$[ebp]
	mov	eax, DWORD PTR [ecx]
	jmp	$L1405
$L1415:

; 44   : 		if((	matchmode == 2 ? 
; 45   : 					(cell->col == matchcol) :
; 46   : 				matchmode == 1 ? 
; 47   : 					(!field || !strcmp(cell->field ? cell->field : "", field)) : 
; 48   : 				/* default matchmode */
; 49   : 				(!field || !strcmp(cell->txt ? cell->txt : "", field)))	&&
; 50   : 				/* line match */
; 51   : 				(line == ~0UL || line == cell->Line))

	cmp	DWORD PTR _matchmode$[ebp], 2
	jne	SHORT $L1482
	mov	edx, DWORD PTR _cell$1413[ebp]
	mov	eax, DWORD PTR [edx+56]
	xor	ecx, ecx
	cmp	eax, DWORD PTR _matchcol$[ebp]
	sete	cl
	mov	DWORD PTR -12+[ebp], ecx
	jmp	$L1483
$L1482:
	cmp	DWORD PTR _matchmode$[ebp], 1
	jne	SHORT $L1480
	cmp	DWORD PTR _field$[ebp], 0
	je	SHORT $L1474
	mov	edx, DWORD PTR _cell$1413[ebp]
	cmp	DWORD PTR [edx+8], 0
	je	SHORT $L1472
	mov	eax, DWORD PTR _cell$1413[ebp]
	mov	ecx, DWORD PTR [eax+8]
	mov	DWORD PTR -16+[ebp], ecx
	jmp	SHORT $L1473
$L1472:
	mov	DWORD PTR -16+[ebp], OFFSET FLAT:$SG1417
$L1473:
	mov	edx, DWORD PTR _field$[ebp]
	push	edx
	mov	eax, DWORD PTR -16+[ebp]
	push	eax
	call	_strcmp
	add	esp, 8
	test	eax, eax
	je	SHORT $L1474
	mov	DWORD PTR -20+[ebp], 0
	jmp	SHORT $L1479
$L1474:
	mov	DWORD PTR -20+[ebp], 1
$L1479:
	mov	ecx, DWORD PTR -20+[ebp]
	mov	DWORD PTR -24+[ebp], ecx
	jmp	SHORT $L1481
$L1480:
	cmp	DWORD PTR _field$[ebp], 0
	je	SHORT $L1477
	mov	edx, DWORD PTR _cell$1413[ebp]
	cmp	DWORD PTR [edx], 0
	je	SHORT $L1475
	mov	eax, DWORD PTR _cell$1413[ebp]
	mov	ecx, DWORD PTR [eax]
	mov	DWORD PTR -28+[ebp], ecx
	jmp	SHORT $L1476
$L1475:
	mov	DWORD PTR -28+[ebp], OFFSET FLAT:$SG1418
$L1476:
	mov	edx, DWORD PTR _field$[ebp]
	push	edx
	mov	eax, DWORD PTR -28+[ebp]
	push	eax
	call	_strcmp
	add	esp, 8
	test	eax, eax
	je	SHORT $L1477
	mov	DWORD PTR -32+[ebp], 0
	jmp	SHORT $L1478
$L1477:
	mov	DWORD PTR -32+[ebp], 1
$L1478:
	mov	ecx, DWORD PTR -32+[ebp]
	mov	DWORD PTR -24+[ebp], ecx
$L1481:
	mov	edx, DWORD PTR -24+[ebp]
	mov	DWORD PTR -12+[ebp], edx
$L1483:
	cmp	DWORD PTR -12+[ebp], 0
	je	SHORT $L1416
	cmp	DWORD PTR _line$[ebp], -1
	je	SHORT $L1419
	mov	eax, DWORD PTR _cell$1413[ebp]
	mov	ecx, DWORD PTR _line$[ebp]
	cmp	ecx, DWORD PTR [eax+40]
	jne	SHORT $L1416
$L1419:

; 52   : 			break;

	jmp	SHORT $L1412
$L1416:

; 53   : 	}

	jmp	$L1411
$L1412:

; 54   : 	return i;

	mov	eax, DWORD PTR _i$[ebp]
$L1405:

; 55   : }

	mov	esp, ebp
	pop	ebp
	ret	0
_dyntab_next_field ENDP
_TEXT	ENDS
PUBLIC	_dyntab_filter_field
EXTRN	_dyntab_copy:NEAR
_TEXT	SEGMENT
_res$ = 8
_b_copyval$ = 12
_tab$ = 16
_field$ = 20
_line$ = 24
_beg$ = 28
_i$ = -4
_j$ = -8
_cell$1441 = -12
_dyntab_filter_field PROC NEAR

; 69   : ){

	push	ebp
	mov	ebp, esp
	sub	esp, 20					; 00000014H

; 70   : 	unsigned long i, j;
; 71   : 
; 72   : 	if(!res || !tab) return 0;

	cmp	DWORD PTR _res$[ebp], 0
	je	SHORT $L1437
	cmp	DWORD PTR _tab$[ebp], 0
	jne	SHORT $L1436
$L1437:
	xor	eax, eax
	jmp	$L1433
$L1436:

; 73   : 
; 74   : 	i = dyntab_next_field(tab, field, line, 0, 1, beg ? *beg : 0);

	cmp	DWORD PTR _beg$[ebp], 0
	je	SHORT $L1485
	mov	eax, DWORD PTR _beg$[ebp]
	mov	ecx, DWORD PTR [eax]
	mov	DWORD PTR -16+[ebp], ecx
	jmp	SHORT $L1486
$L1485:
	mov	DWORD PTR -16+[ebp], 0
$L1486:
	mov	edx, DWORD PTR -16+[ebp]
	push	edx
	push	1
	push	0
	mov	eax, DWORD PTR _line$[ebp]
	push	eax
	mov	ecx, DWORD PTR _field$[ebp]
	push	ecx
	mov	edx, DWORD PTR _tab$[ebp]
	push	edx
	call	_dyntab_next_field
	add	esp, 24					; 00000018H
	mov	DWORD PTR _i$[ebp], eax
$L1439:

; 75   : 	while(i < tab->nbrows)

	mov	eax, DWORD PTR _tab$[ebp]
	mov	ecx, DWORD PTR _i$[ebp]
	cmp	ecx, DWORD PTR [eax]
	jae	$L1440

; 77   : 		DynTableCell *cell = dyntab_cell(tab, i, 0);

	push	0
	mov	edx, DWORD PTR _i$[ebp]
	push	edx
	mov	eax, DWORD PTR _tab$[ebp]
	push	eax
	call	_dyntab_cell
	add	esp, 12					; 0000000cH
	mov	DWORD PTR _cell$1441[ebp], eax

; 78   : 		if(cell->IdObj != tab->cell[beg ? *beg : 0].IdObj)

	cmp	DWORD PTR _beg$[ebp], 0
	je	SHORT $L1487
	mov	ecx, DWORD PTR _beg$[ebp]
	mov	edx, DWORD PTR [ecx]
	mov	DWORD PTR -20+[ebp], edx
	jmp	SHORT $L1488
$L1487:
	mov	DWORD PTR -20+[ebp], 0
$L1488:
	mov	eax, DWORD PTR -20+[ebp]
	shl	eax, 6
	mov	ecx, DWORD PTR _tab$[ebp]
	mov	edx, DWORD PTR [ecx+16]
	mov	ecx, DWORD PTR _cell$1441[ebp]
	mov	ecx, DWORD PTR [ecx+20]
	cmp	ecx, DWORD PTR [edx+eax+20]
	je	SHORT $L1442

; 80   : 			if(beg) *beg = i - 1;

	cmp	DWORD PTR _beg$[ebp], 0
	je	SHORT $L1443
	mov	edx, DWORD PTR _i$[ebp]
	sub	edx, 1
	mov	eax, DWORD PTR _beg$[ebp]
	mov	DWORD PTR [eax], edx
$L1443:

; 81   : 			return 0;

	xor	eax, eax
	jmp	$L1433
$L1442:

; 83   : 		for(j = 0; j < tab->nbcols; j++)

	mov	DWORD PTR _j$[ebp], 0
	jmp	SHORT $L1444
$L1445:
	mov	ecx, DWORD PTR _j$[ebp]
	add	ecx, 1
	mov	DWORD PTR _j$[ebp], ecx
$L1444:
	mov	edx, DWORD PTR _tab$[ebp]
	mov	eax, DWORD PTR _j$[ebp]
	cmp	eax, DWORD PTR [edx+8]
	jae	SHORT $L1446

; 84   : 			if(dyntab_copy(res, res->nbrows, j, dyntab_cell(tab, i, j), b_copyval)) return 1;

	mov	ecx, DWORD PTR _b_copyval$[ebp]
	push	ecx
	mov	edx, DWORD PTR _j$[ebp]
	push	edx
	mov	eax, DWORD PTR _i$[ebp]
	push	eax
	mov	ecx, DWORD PTR _tab$[ebp]
	push	ecx
	call	_dyntab_cell
	add	esp, 12					; 0000000cH
	push	eax
	mov	edx, DWORD PTR _j$[ebp]
	push	edx
	mov	eax, DWORD PTR _res$[ebp]
	mov	ecx, DWORD PTR [eax]
	push	ecx
	mov	edx, DWORD PTR _res$[ebp]
	push	edx
	call	_dyntab_copy
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L1447
	mov	eax, 1
	jmp	SHORT $L1433
$L1447:

; 85   : 		i = dyntab_next_field(tab, field, line, 0, 1, i + 1);

	jmp	SHORT $L1445
$L1446:
	mov	eax, DWORD PTR _i$[ebp]
	add	eax, 1
	push	eax
	push	1
	push	0
	mov	ecx, DWORD PTR _line$[ebp]
	push	ecx
	mov	edx, DWORD PTR _field$[ebp]
	push	edx
	mov	eax, DWORD PTR _tab$[ebp]
	push	eax
	call	_dyntab_next_field
	add	esp, 24					; 00000018H
	mov	DWORD PTR _i$[ebp], eax

; 86   : 	}

	jmp	$L1439
$L1440:

; 87   : 	if(beg) *beg = i - 1;

	cmp	DWORD PTR _beg$[ebp], 0
	je	SHORT $L1448
	mov	ecx, DWORD PTR _i$[ebp]
	sub	ecx, 1
	mov	edx, DWORD PTR _beg$[ebp]
	mov	DWORD PTR [edx], ecx
$L1448:

; 88   : 	return 0;

	xor	eax, eax
$L1433:

; 89   : }

	mov	esp, ebp
	pop	ebp
	ret	0
_dyntab_filter_field ENDP
_TEXT	ENDS
PUBLIC	_dyntab_field_val
EXTRN	_dyntab_val:NEAR
_TEXT	SEGMENT
_tab$ = 8
_field$ = 12
_line$ = 16
_beg$ = 20
_dyntab_field_val PROC NEAR

; 101  : ){

	push	ebp
	mov	ebp, esp

; 102  : 	return dyntab_val(tab, dyntab_next_field(tab, field, line, 0, 1, beg), 0);

	push	0
	mov	eax, DWORD PTR _beg$[ebp]
	push	eax
	push	1
	push	0
	mov	ecx, DWORD PTR _line$[ebp]
	push	ecx
	mov	edx, DWORD PTR _field$[ebp]
	push	edx
	mov	eax, DWORD PTR _tab$[ebp]
	push	eax
	call	_dyntab_next_field
	add	esp, 24					; 00000018H
	push	eax
	mov	ecx, DWORD PTR _tab$[ebp]
	push	ecx
	call	_dyntab_val
	add	esp, 12					; 0000000cH

; 103  : }

	pop	ebp
	ret	0
_dyntab_field_val ENDP
_TEXT	ENDS
PUBLIC	_dyntab_field_cell
_TEXT	SEGMENT
_tab$ = 8
_field$ = 12
_line$ = 16
_beg$ = 20
_dyntab_field_cell PROC NEAR

; 115  : ){

	push	ebp
	mov	ebp, esp

; 116  : 	return dyntab_cell(tab, dyntab_next_field(tab, field, line, 0, 1, beg), 0);

	push	0
	mov	eax, DWORD PTR _beg$[ebp]
	push	eax
	push	1
	push	0
	mov	ecx, DWORD PTR _line$[ebp]
	push	ecx
	mov	edx, DWORD PTR _field$[ebp]
	push	edx
	mov	eax, DWORD PTR _tab$[ebp]
	push	eax
	call	_dyntab_next_field
	add	esp, 24					; 00000018H
	push	eax
	mov	ecx, DWORD PTR _tab$[ebp]
	push	ecx
	call	_dyntab_cell
	add	esp, 12					; 0000000cH

; 117  : }

	pop	ebp
	ret	0
_dyntab_field_cell ENDP
_TEXT	ENDS
END
