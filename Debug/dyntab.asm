	TITLE	D:\Travail\ABI\EVA\V4.0\CGI\Brunix-2016\dyntab.c
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
PUBLIC	_dyntab_free_cell
EXTRN	_mem_free:NEAR
_TEXT	SEGMENT
_tab$ = 8
_i$ = 12
_dyntab_free_cell PROC NEAR

; 24   : ){

	push	ebp
	mov	ebp, esp

; 25   : 	if(tab->cell[i].txt && !tab->cell[i].b_dontfreetxt) M_FREE(tab->cell[i].txt);

	mov	eax, DWORD PTR _i$[ebp]
	shl	eax, 6
	mov	ecx, DWORD PTR _tab$[ebp]
	mov	edx, DWORD PTR [ecx+16]
	cmp	DWORD PTR [edx+eax], 0
	je	SHORT $L1060
	mov	eax, DWORD PTR _i$[ebp]
	shl	eax, 6
	mov	ecx, DWORD PTR _tab$[ebp]
	mov	edx, DWORD PTR [ecx+16]
	movsx	eax, BYTE PTR [edx+eax+14]
	test	eax, eax
	jne	SHORT $L1060
	mov	ecx, DWORD PTR _i$[ebp]
	shl	ecx, 6
	mov	edx, DWORD PTR _tab$[ebp]
	mov	eax, DWORD PTR [edx+16]
	mov	ecx, DWORD PTR [eax+ecx]
	push	ecx
	call	_mem_free
	add	esp, 4
	mov	edx, DWORD PTR _i$[ebp]
	shl	edx, 6
	mov	eax, DWORD PTR _tab$[ebp]
	mov	ecx, DWORD PTR [eax+16]
	mov	DWORD PTR [ecx+edx], 0
$L1060:

; 26   : 	if(tab->cell[i].field && !tab->cell[i].b_dontfreefield) M_FREE(tab->cell[i].field);

	mov	edx, DWORD PTR _i$[ebp]
	shl	edx, 6
	mov	eax, DWORD PTR _tab$[ebp]
	mov	ecx, DWORD PTR [eax+16]
	cmp	DWORD PTR [ecx+edx+8], 0
	je	SHORT $L1061
	mov	edx, DWORD PTR _i$[ebp]
	shl	edx, 6
	mov	eax, DWORD PTR _tab$[ebp]
	mov	ecx, DWORD PTR [eax+16]
	movsx	edx, BYTE PTR [ecx+edx+15]
	test	edx, edx
	jne	SHORT $L1061
	mov	eax, DWORD PTR _i$[ebp]
	shl	eax, 6
	mov	ecx, DWORD PTR _tab$[ebp]
	mov	edx, DWORD PTR [ecx+16]
	mov	eax, DWORD PTR [edx+eax+8]
	push	eax
	call	_mem_free
	add	esp, 4
	mov	ecx, DWORD PTR _i$[ebp]
	shl	ecx, 6
	mov	edx, DWORD PTR _tab$[ebp]
	mov	eax, DWORD PTR [edx+16]
	mov	DWORD PTR [eax+ecx+8], 0
$L1061:

; 27   : }

	pop	ebp
	ret	0
_dyntab_free_cell ENDP
_TEXT	ENDS
PUBLIC	_dyntab_free
EXTRN	_memset:NEAR
_TEXT	SEGMENT
_tab$ = 8
_i$ = -4
_j$ = -8
_dyntab_free PROC NEAR

; 35   : ){

	push	ebp
	mov	ebp, esp
	sub	esp, 8

; 36   : 	unsigned long i, j;
; 37   : 
; 38   : 	if(!tab) return;

	cmp	DWORD PTR _tab$[ebp], 0
	jne	SHORT $L1067
	jmp	SHORT $L1064
$L1067:

; 39   : 	j = tab->nbrows * tab->nbcols;

	mov	eax, DWORD PTR _tab$[ebp]
	mov	ecx, DWORD PTR _tab$[ebp]
	mov	edx, DWORD PTR [eax]
	imul	edx, DWORD PTR [ecx+8]
	mov	DWORD PTR _j$[ebp], edx

; 40   : 	for(i = 0; i < j; i++) dyntab_free_cell(tab, i);

	mov	DWORD PTR _i$[ebp], 0
	jmp	SHORT $L1068
$L1069:
	mov	eax, DWORD PTR _i$[ebp]
	add	eax, 1
	mov	DWORD PTR _i$[ebp], eax
$L1068:
	mov	ecx, DWORD PTR _i$[ebp]
	cmp	ecx, DWORD PTR _j$[ebp]
	jae	SHORT $L1070
	mov	edx, DWORD PTR _i$[ebp]
	push	edx
	mov	eax, DWORD PTR _tab$[ebp]
	push	eax
	call	_dyntab_free_cell
	add	esp, 8
	jmp	SHORT $L1069
$L1070:

; 41   : 	M_FREE(tab->cell);

	mov	ecx, DWORD PTR _tab$[ebp]
	mov	edx, DWORD PTR [ecx+16]
	push	edx
	call	_mem_free
	add	esp, 4
	mov	eax, DWORD PTR _tab$[ebp]
	mov	DWORD PTR [eax+16], 0

; 42   : 	memset(tab, 0, sizeof(tab[0]));

	push	20					; 00000014H
	push	0
	mov	ecx, DWORD PTR _tab$[ebp]
	push	ecx
	call	_memset
	add	esp, 12					; 0000000cH
$L1064:

; 43   : }

	mov	esp, ebp
	pop	ebp
	ret	0
_dyntab_free ENDP
_TEXT	ENDS
PUBLIC	_dyntab_resize
EXTRN	_memcpy:NEAR
EXTRN	_mem_alloc:NEAR
_TEXT	SEGMENT
_tab$ = 8
_row$ = 12
_col$ = 16
_cell$ = -20
_oldcols$ = -12
_oldrows$ = -4
_i$ = -8
_sz$ = -16
_dyntab_resize PROC NEAR

; 53   : ){

	push	ebp
	mov	ebp, esp
	sub	esp, 20					; 00000014H

; 54   : 	DynTableCell *cell;		/* new cells */
; 55   : 	unsigned long oldcols;	/* old line # of cells (szcols) */
; 56   : 	unsigned long oldrows;	/* old # of lines (nbrows) */
; 57   : 	unsigned long i;
; 58   : 	size_t sz;
; 59   : 
; 60   : 	/* Realloc data cells if needed */
; 61   : 	if(!tab) return 0;

	cmp	DWORD PTR _tab$[ebp], 0
	jne	SHORT $L1083
	xor	eax, eax
	jmp	$L1077
$L1083:

; 62   : 	if(row == ~0UL) row = 0;

	cmp	DWORD PTR _row$[ebp], -1
	jne	SHORT $L1084
	mov	DWORD PTR _row$[ebp], 0
$L1084:

; 63   : 	if(col == ~0UL) col = 0;

	cmp	DWORD PTR _col$[ebp], -1
	jne	SHORT $L1085
	mov	DWORD PTR _col$[ebp], 0
$L1085:

; 64   : 	if(row >= tab->szrows || col >= tab->szcols)

	mov	eax, DWORD PTR _tab$[ebp]
	mov	ecx, DWORD PTR _row$[ebp]
	cmp	ecx, DWORD PTR [eax+4]
	jae	SHORT $L1087
	mov	edx, DWORD PTR _tab$[ebp]
	mov	eax, DWORD PTR _col$[ebp]
	cmp	eax, DWORD PTR [edx+12]
	jb	$L1086
$L1087:

; 66   : 		/* Calc new sizes for cells array */
; 67   : 		oldrows = tab->nbrows;

	mov	ecx, DWORD PTR _tab$[ebp]
	mov	edx, DWORD PTR [ecx]
	mov	DWORD PTR _oldrows$[ebp], edx

; 68   : 		oldcols = tab->szcols;

	mov	eax, DWORD PTR _tab$[ebp]
	mov	ecx, DWORD PTR [eax+12]
	mov	DWORD PTR _oldcols$[ebp], ecx

; 69   : 		if(row >= tab->szrows) tab->szrows = (row + 1) * 3 / 2;

	mov	edx, DWORD PTR _tab$[ebp]
	mov	eax, DWORD PTR _row$[ebp]
	cmp	eax, DWORD PTR [edx+4]
	jb	SHORT $L1088
	mov	ecx, DWORD PTR _row$[ebp]
	add	ecx, 1
	imul	ecx, 3
	shr	ecx, 1
	mov	edx, DWORD PTR _tab$[ebp]
	mov	DWORD PTR [edx+4], ecx
$L1088:

; 70   : 		if(col >= tab->szcols) tab->szcols = (col + 1);

	mov	eax, DWORD PTR _tab$[ebp]
	mov	ecx, DWORD PTR _col$[ebp]
	cmp	ecx, DWORD PTR [eax+12]
	jb	SHORT $L1089
	mov	edx, DWORD PTR _col$[ebp]
	add	edx, 1
	mov	eax, DWORD PTR _tab$[ebp]
	mov	DWORD PTR [eax+12], edx
$L1089:

; 71   : 
; 72   : 		/* Alloc memory for new cells array */
; 73   : 		sz = tab->szrows * tab->szcols * sizeof(cell[0]);

	mov	ecx, DWORD PTR _tab$[ebp]
	mov	edx, DWORD PTR _tab$[ebp]
	mov	eax, DWORD PTR [ecx+4]
	imul	eax, DWORD PTR [edx+12]
	shl	eax, 6
	mov	DWORD PTR _sz$[ebp], eax

; 74   : 		cell = mem_alloc(sz);

	mov	ecx, DWORD PTR _sz$[ebp]
	push	ecx
	call	_mem_alloc
	add	esp, 4
	mov	DWORD PTR _cell$[ebp], eax

; 75   : 		if(!cell) return 1;

	cmp	DWORD PTR _cell$[ebp], 0
	jne	SHORT $L1090
	mov	eax, 1
	jmp	$L1077
$L1090:

; 76   : 		memset(cell, 0, sz);

	mov	edx, DWORD PTR _sz$[ebp]
	push	edx
	push	0
	mov	eax, DWORD PTR _cell$[ebp]
	push	eax
	call	_memset
	add	esp, 12					; 0000000cH

; 77   : 
; 78   : 		/* Reorganize cells with new column width if changed */
; 79   : 		if(tab->cell)

	mov	ecx, DWORD PTR _tab$[ebp]
	cmp	DWORD PTR [ecx+16], 0
	je	$L1091

; 81   : 			if(tab->szcols > oldcols)

	mov	edx, DWORD PTR _tab$[ebp]
	mov	eax, DWORD PTR [edx+12]
	cmp	eax, DWORD PTR _oldcols$[ebp]
	jbe	SHORT $L1092

; 82   : 				for(i = 0; i < oldrows; i++)

	mov	DWORD PTR _i$[ebp], 0
	jmp	SHORT $L1093
$L1094:
	mov	ecx, DWORD PTR _i$[ebp]
	add	ecx, 1
	mov	DWORD PTR _i$[ebp], ecx
$L1093:
	mov	edx, DWORD PTR _i$[ebp]
	cmp	edx, DWORD PTR _oldrows$[ebp]
	jae	SHORT $L1095

; 83   : 					memcpy(cell + i * tab->szcols, tab->cell + i * oldcols, sizeof(cell[0]) * oldcols);

	mov	eax, DWORD PTR _oldcols$[ebp]
	shl	eax, 6
	push	eax
	mov	ecx, DWORD PTR _i$[ebp]
	imul	ecx, DWORD PTR _oldcols$[ebp]
	shl	ecx, 6
	mov	edx, DWORD PTR _tab$[ebp]
	mov	eax, DWORD PTR [edx+16]
	add	eax, ecx
	push	eax
	mov	ecx, DWORD PTR _tab$[ebp]
	mov	edx, DWORD PTR _i$[ebp]
	imul	edx, DWORD PTR [ecx+12]
	shl	edx, 6
	mov	eax, DWORD PTR _cell$[ebp]
	add	eax, edx
	push	eax
	call	_memcpy
	add	esp, 12					; 0000000cH
	jmp	SHORT $L1094
$L1095:

; 84   : 			else

	jmp	SHORT $L1096
$L1092:

; 85   : 					memcpy(cell, tab->cell, sizeof(cell[0]) * oldcols * tab->nbrows);

	mov	ecx, DWORD PTR _oldcols$[ebp]
	shl	ecx, 6
	mov	edx, DWORD PTR _tab$[ebp]
	imul	ecx, DWORD PTR [edx]
	push	ecx
	mov	eax, DWORD PTR _tab$[ebp]
	mov	ecx, DWORD PTR [eax+16]
	push	ecx
	mov	edx, DWORD PTR _cell$[ebp]
	push	edx
	call	_memcpy
	add	esp, 12					; 0000000cH
$L1096:

; 86   : 
; 87   : 			M_FREE(tab->cell);

	mov	eax, DWORD PTR _tab$[ebp]
	mov	ecx, DWORD PTR [eax+16]
	push	ecx
	call	_mem_free
	add	esp, 4
	mov	edx, DWORD PTR _tab$[ebp]
	mov	DWORD PTR [edx+16], 0
$L1091:

; 89   : 		tab->cell = cell;

	mov	eax, DWORD PTR _tab$[ebp]
	mov	ecx, DWORD PTR _cell$[ebp]
	mov	DWORD PTR [eax+16], ecx
$L1086:

; 91   : 
; 92   : 	/* Set table size */
; 93   : 	if(col >= tab->nbcols) tab->nbcols = col + 1;

	mov	edx, DWORD PTR _tab$[ebp]
	mov	eax, DWORD PTR _col$[ebp]
	cmp	eax, DWORD PTR [edx+8]
	jb	SHORT $L1097
	mov	ecx, DWORD PTR _col$[ebp]
	add	ecx, 1
	mov	edx, DWORD PTR _tab$[ebp]
	mov	DWORD PTR [edx+8], ecx
$L1097:

; 94   : 	if(row >= tab->nbrows) tab->nbrows = row + 1;

	mov	eax, DWORD PTR _tab$[ebp]
	mov	ecx, DWORD PTR _row$[ebp]
	cmp	ecx, DWORD PTR [eax]
	jb	SHORT $L1098
	mov	edx, DWORD PTR _row$[ebp]
	add	edx, 1
	mov	eax, DWORD PTR _tab$[ebp]
	mov	DWORD PTR [eax], edx
$L1098:

; 95   : 
; 96   : 	return 0;

	xor	eax, eax
$L1077:

; 97   : }

	mov	esp, ebp
	pop	ebp
	ret	0
_dyntab_resize ENDP
_TEXT	ENDS
PUBLIC	_dyntab_sz
EXTRN	_strlen:NEAR
_TEXT	SEGMENT
_tab$ = 8
_row$ = 12
_col$ = 16
_i$ = -4
_dyntab_sz PROC NEAR

; 107  : ){

	push	ebp
	mov	ebp, esp
	sub	esp, 12					; 0000000cH

; 108  : 	unsigned long i;
; 109  : 
; 110  : 	/* Check params */
; 111  : 	if(!tab || row >= tab->nbrows || col >= tab->nbcols) return 0;

	cmp	DWORD PTR _tab$[ebp], 0
	je	SHORT $L1108
	mov	eax, DWORD PTR _tab$[ebp]
	mov	ecx, DWORD PTR _row$[ebp]
	cmp	ecx, DWORD PTR [eax]
	jae	SHORT $L1108
	mov	edx, DWORD PTR _tab$[ebp]
	mov	eax, DWORD PTR _col$[ebp]
	cmp	eax, DWORD PTR [edx+8]
	jb	SHORT $L1107
$L1108:
	xor	eax, eax
	jmp	SHORT $L1105
$L1107:

; 112  : 
; 113  : 	/* Return cell size */
; 114  : 	i = DYNTAB_INDEX(tab, row, col);

	mov	ecx, DWORD PTR _tab$[ebp]
	mov	edx, DWORD PTR _row$[ebp]
	imul	edx, DWORD PTR [ecx+12]
	mov	eax, DWORD PTR _col$[ebp]
	add	eax, edx
	mov	DWORD PTR _i$[ebp], eax

; 115  : 	return	tab->cell[i].len ? tab->cell[i].len : tab->cell[i].txt ? strlen(tab->cell[i].txt) : 0;

	mov	ecx, DWORD PTR _i$[ebp]
	shl	ecx, 6
	mov	edx, DWORD PTR _tab$[ebp]
	mov	eax, DWORD PTR [edx+16]
	cmp	DWORD PTR [eax+ecx+4], 0
	je	SHORT $L1461
	mov	ecx, DWORD PTR _i$[ebp]
	shl	ecx, 6
	mov	edx, DWORD PTR _tab$[ebp]
	mov	eax, DWORD PTR [edx+16]
	mov	ecx, DWORD PTR [eax+ecx+4]
	mov	DWORD PTR -8+[ebp], ecx
	jmp	SHORT $L1462
$L1461:
	mov	edx, DWORD PTR _i$[ebp]
	shl	edx, 6
	mov	eax, DWORD PTR _tab$[ebp]
	mov	ecx, DWORD PTR [eax+16]
	cmp	DWORD PTR [ecx+edx], 0
	je	SHORT $L1459
	mov	edx, DWORD PTR _i$[ebp]
	shl	edx, 6
	mov	eax, DWORD PTR _tab$[ebp]
	mov	ecx, DWORD PTR [eax+16]
	mov	edx, DWORD PTR [ecx+edx]
	push	edx
	call	_strlen
	add	esp, 4
	mov	DWORD PTR -12+[ebp], eax
	jmp	SHORT $L1460
$L1459:
	mov	DWORD PTR -12+[ebp], 0
$L1460:
	mov	eax, DWORD PTR -12+[ebp]
	mov	DWORD PTR -8+[ebp], eax
$L1462:
	mov	eax, DWORD PTR -8+[ebp]
$L1105:

; 116  : }

	mov	esp, ebp
	pop	ebp
	ret	0
_dyntab_sz ENDP
_TEXT	ENDS
PUBLIC	_dyntab_val
_BSS	SEGMENT
$SG1119	DB	01H DUP (?)
	ALIGN	4

$SG1120	DB	01H DUP (?)
_BSS	ENDS
_TEXT	SEGMENT
_tab$ = 8
_row$ = 12
_col$ = 16
_i$ = -4
_dyntab_val PROC NEAR

; 126  : ){

	push	ebp
	mov	ebp, esp
	sub	esp, 8

; 127  : 	unsigned long i;
; 128  : 
; 129  : 	/* Check params */
; 130  : 	if(!tab || row >= tab->nbrows || col >= tab->nbcols) return "";

	cmp	DWORD PTR _tab$[ebp], 0
	je	SHORT $L1118
	mov	eax, DWORD PTR _tab$[ebp]
	mov	ecx, DWORD PTR _row$[ebp]
	cmp	ecx, DWORD PTR [eax]
	jae	SHORT $L1118
	mov	edx, DWORD PTR _tab$[ebp]
	mov	eax, DWORD PTR _col$[ebp]
	cmp	eax, DWORD PTR [edx+8]
	jb	SHORT $L1117
$L1118:
	mov	eax, OFFSET FLAT:$SG1119
	jmp	SHORT $L1115
$L1117:

; 131  : 
; 132  : 	/* Return cell value */
; 133  : 	i = DYNTAB_INDEX(tab, row, col);

	mov	ecx, DWORD PTR _tab$[ebp]
	mov	edx, DWORD PTR _row$[ebp]
	imul	edx, DWORD PTR [ecx+12]
	mov	eax, DWORD PTR _col$[ebp]
	add	eax, edx
	mov	DWORD PTR _i$[ebp], eax

; 134  : 	return tab->cell[i].txt ? tab->cell[i].txt : "";

	mov	ecx, DWORD PTR _i$[ebp]
	shl	ecx, 6
	mov	edx, DWORD PTR _tab$[ebp]
	mov	eax, DWORD PTR [edx+16]
	cmp	DWORD PTR [eax+ecx], 0
	je	SHORT $L1464
	mov	ecx, DWORD PTR _i$[ebp]
	shl	ecx, 6
	mov	edx, DWORD PTR _tab$[ebp]
	mov	eax, DWORD PTR [edx+16]
	mov	ecx, DWORD PTR [eax+ecx]
	mov	DWORD PTR -8+[ebp], ecx
	jmp	SHORT $L1465
$L1464:
	mov	DWORD PTR -8+[ebp], OFFSET FLAT:$SG1120
$L1465:
	mov	eax, DWORD PTR -8+[ebp]
$L1115:

; 135  : }

	mov	esp, ebp
	pop	ebp
	ret	0
_dyntab_val ENDP
_TEXT	ENDS
PUBLIC	_dyntab_cell
_TEXT	SEGMENT
_tab$ = 8
_row$ = 12
_col$ = 16
_i$ = -4
_dyntab_cell PROC NEAR

; 145  : ){

	push	ebp
	mov	ebp, esp
	push	ecx

; 146  : 	/* Check params */
; 147  : 	unsigned long i;
; 148  : 	if(!tab || row >= tab->nbrows || col >= tab->nbcols) return NULL;

	cmp	DWORD PTR _tab$[ebp], 0
	je	SHORT $L1130
	mov	eax, DWORD PTR _tab$[ebp]
	mov	ecx, DWORD PTR _row$[ebp]
	cmp	ecx, DWORD PTR [eax]
	jae	SHORT $L1130
	mov	edx, DWORD PTR _tab$[ebp]
	mov	eax, DWORD PTR _col$[ebp]
	cmp	eax, DWORD PTR [edx+8]
	jb	SHORT $L1129
$L1130:
	xor	eax, eax
	jmp	SHORT $L1127
$L1129:

; 149  : 
; 150  : 
; 151  : 	/* Return cell pointer */
; 152  : 	i = DYNTAB_INDEX(tab, row, col);

	mov	ecx, DWORD PTR _tab$[ebp]
	mov	edx, DWORD PTR _row$[ebp]
	imul	edx, DWORD PTR [ecx+12]
	mov	eax, DWORD PTR _col$[ebp]
	add	eax, edx
	mov	DWORD PTR _i$[ebp], eax

; 153  : 	return	tab->cell + i;

	mov	ecx, DWORD PTR _i$[ebp]
	shl	ecx, 6
	mov	edx, DWORD PTR _tab$[ebp]
	mov	eax, DWORD PTR [edx+16]
	add	eax, ecx
$L1127:

; 154  : }

	mov	esp, ebp
	pop	ebp
	ret	0
_dyntab_cell ENDP
_TEXT	ENDS
PUBLIC	_dyntab_set
_TEXT	SEGMENT
_tab$ = 8
_row$ = 12
_col$ = 16
_c$ = 20
_i$ = -4
_cell$ = -68
_dyntab_set PROC NEAR

; 165  : ){

	push	ebp
	mov	ebp, esp
	sub	esp, 68					; 00000044H
	push	edi

; 166  : 	unsigned long i;
; 167  : 
; 168  : 	/* Memorize cell to avoid pointer sweeping on dyntab_resize (happens if c is in tab) */
; 169  : 	DynTableCell cell = {0};

	mov	DWORD PTR _cell$[ebp], 0
	mov	ecx, 15					; 0000000fH
	xor	eax, eax
	lea	edi, DWORD PTR _cell$[ebp+4]
	rep stosd

; 170  : 	if(c) memcpy(&cell, c, sizeof(cell));

	cmp	DWORD PTR _c$[ebp], 0
	je	SHORT $L1143
	push	64					; 00000040H
	mov	eax, DWORD PTR _c$[ebp]
	push	eax
	lea	ecx, DWORD PTR _cell$[ebp]
	push	ecx
	call	_memcpy
	add	esp, 12					; 0000000cH
$L1143:

; 171  : 
; 172  : 	/* Resize table if needed - return on error */
; 173  : 	if(!tab) return 0;

	cmp	DWORD PTR _tab$[ebp], 0
	jne	SHORT $L1144
	xor	eax, eax
	jmp	SHORT $L1140
$L1144:

; 174  : 	if(dyntab_resize(tab, row, col)) return 1;

	mov	edx, DWORD PTR _col$[ebp]
	push	edx
	mov	eax, DWORD PTR _row$[ebp]
	push	eax
	mov	ecx, DWORD PTR _tab$[ebp]
	push	ecx
	call	_dyntab_resize
	add	esp, 12					; 0000000cH
	test	eax, eax
	je	SHORT $L1145
	mov	eax, 1
	jmp	SHORT $L1140
$L1145:

; 175  : 
; 176  : 	/* Free previous value */
; 177  : 	i = DYNTAB_INDEX(tab, row, col);

	mov	edx, DWORD PTR _tab$[ebp]
	mov	eax, DWORD PTR _row$[ebp]
	imul	eax, DWORD PTR [edx+12]
	mov	ecx, DWORD PTR _col$[ebp]
	add	ecx, eax
	mov	DWORD PTR _i$[ebp], ecx

; 178  : 	dyntab_free_cell(tab, i);

	mov	edx, DWORD PTR _i$[ebp]
	push	edx
	mov	eax, DWORD PTR _tab$[ebp]
	push	eax
	call	_dyntab_free_cell
	add	esp, 8

; 179  : 
; 180  : 	/* Copy new value if applicable */
; 181  : 	memcpy(tab->cell + i, &cell, sizeof(cell));

	push	64					; 00000040H
	lea	ecx, DWORD PTR _cell$[ebp]
	push	ecx
	mov	edx, DWORD PTR _i$[ebp]
	shl	edx, 6
	mov	eax, DWORD PTR _tab$[ebp]
	mov	ecx, DWORD PTR [eax+16]
	add	ecx, edx
	push	ecx
	call	_memcpy
	add	esp, 12					; 0000000cH

; 182  : 
; 183  : 	return 0;

	xor	eax, eax
$L1140:

; 184  : }

	pop	edi
	mov	esp, ebp
	pop	ebp
	ret	0
_dyntab_set ENDP
_TEXT	ENDS
PUBLIC	_dyntab_moveto
_TEXT	SEGMENT
_dst$ = 8
_src$ = 12
_dyntab_moveto PROC NEAR

; 193  : ){

	push	ebp
	mov	ebp, esp

; 194  : 	dyntab_free(dst);

	mov	eax, DWORD PTR _dst$[ebp]
	push	eax
	call	_dyntab_free
	add	esp, 4

; 195  : 	memcpy(dst, src, sizeof(*dst));

	push	20					; 00000014H
	mov	ecx, DWORD PTR _src$[ebp]
	push	ecx
	mov	edx, DWORD PTR _dst$[ebp]
	push	edx
	call	_memcpy
	add	esp, 12					; 0000000cH

; 196  : 	memset(src, 0, sizeof(*src));

	push	20					; 00000014H
	push	0
	mov	eax, DWORD PTR _src$[ebp]
	push	eax
	call	_memset
	add	esp, 12					; 0000000cH

; 197  : }

	pop	ebp
	ret	0
_dyntab_moveto ENDP
_TEXT	ENDS
PUBLIC	_dyntab_copy
EXTRN	_mem_strdup:NEAR
_TEXT	SEGMENT
_tab$ = 8
_row$ = 12
_col$ = 16
_src$ = 20
_b_strdup$ = 24
_cell$ = -4
_dyntab_copy PROC NEAR

; 209  : ){

	push	ebp
	mov	ebp, esp
	push	ecx

; 210  : 	DynTableCell *cell;
; 211  : 
; 212  : 	if(!tab) return 0;

	cmp	DWORD PTR _tab$[ebp], 0
	jne	SHORT $L1163
	xor	eax, eax
	jmp	$L1161
$L1163:

; 213  : 
; 214  : 	/* Copy cell */
; 215  : 	if(dyntab_set(tab, row, col, src)) return 1;

	mov	eax, DWORD PTR _src$[ebp]
	push	eax
	mov	ecx, DWORD PTR _col$[ebp]
	push	ecx
	mov	edx, DWORD PTR _row$[ebp]
	push	edx
	mov	eax, DWORD PTR _tab$[ebp]
	push	eax
	call	_dyntab_set
	add	esp, 16					; 00000010H
	test	eax, eax
	je	SHORT $L1164
	mov	eax, 1
	jmp	$L1161
$L1164:

; 216  : 	cell = dyntab_cell(tab, row, col);

	mov	ecx, DWORD PTR _col$[ebp]
	push	ecx
	mov	edx, DWORD PTR _row$[ebp]
	push	edx
	mov	eax, DWORD PTR _tab$[ebp]
	push	eax
	call	_dyntab_cell
	add	esp, 12					; 0000000cH
	mov	DWORD PTR _cell$[ebp], eax

; 217  : 	cell->b_dontfreetxt = 1;

	mov	ecx, DWORD PTR _cell$[ebp]
	mov	BYTE PTR [ecx+14], 1

; 218  : 	cell->b_dontfreefield = 1;

	mov	edx, DWORD PTR _cell$[ebp]
	mov	BYTE PTR [edx+15], 1

; 219  : 
; 220  : 	/* Duplicate strings if applicable */
; 221  : #ifndef _EVA_DLL
; 222  : 	/* TODO : bug - DLL crashes sometime : freed memory used */
; 223  : 	if(b_strdup)

	cmp	DWORD PTR _b_strdup$[ebp], 0
	je	SHORT $L1168

; 226  : 		/* Value string */
; 227  : 		if(cell->txt)

	mov	eax, DWORD PTR _cell$[ebp]
	cmp	DWORD PTR [eax], 0
	je	SHORT $L1166

; 229  : 			cell->txt = mem_strdup(cell->txt);

	mov	ecx, DWORD PTR _cell$[ebp]
	mov	edx, DWORD PTR [ecx]
	push	edx
	call	_mem_strdup
	add	esp, 4
	mov	ecx, DWORD PTR _cell$[ebp]
	mov	DWORD PTR [ecx], eax

; 230  : 			if(!cell->txt) return 1;

	mov	edx, DWORD PTR _cell$[ebp]
	cmp	DWORD PTR [edx], 0
	jne	SHORT $L1167
	mov	eax, 1
	jmp	SHORT $L1161
$L1167:

; 231  : 			cell->b_dontfreetxt = 0;

	mov	eax, DWORD PTR _cell$[ebp]
	mov	BYTE PTR [eax+14], 0
$L1166:

; 233  : 
; 234  : 		/* Field string */
; 235  : 		if(cell->field)

	mov	ecx, DWORD PTR _cell$[ebp]
	cmp	DWORD PTR [ecx+8], 0
	je	SHORT $L1168

; 237  : 			cell->field = mem_strdup(cell->field);

	mov	edx, DWORD PTR _cell$[ebp]
	mov	eax, DWORD PTR [edx+8]
	push	eax
	call	_mem_strdup
	add	esp, 4
	mov	ecx, DWORD PTR _cell$[ebp]
	mov	DWORD PTR [ecx+8], eax

; 238  : 			if(!cell->field) return 1;

	mov	edx, DWORD PTR _cell$[ebp]
	cmp	DWORD PTR [edx+8], 0
	jne	SHORT $L1169
	mov	eax, 1
	jmp	SHORT $L1161
$L1169:

; 239  : 			cell->b_dontfreefield = 0;

	mov	eax, DWORD PTR _cell$[ebp]
	mov	BYTE PTR [eax+15], 0
$L1168:

; 242  : 
; 243  : 	return 0;

	xor	eax, eax
$L1161:

; 244  : }

	mov	esp, ebp
	pop	ebp
	ret	0
_dyntab_copy ENDP
_TEXT	ENDS
PUBLIC	_dyntab_add
EXTRN	_dynbuf_add:NEAR
_TEXT	SEGMENT
_tab$ = 8
_row$ = 12
_col$ = 16
_txt$ = 20
_len$ = 24
_sr$ = 28
_srmode$ = 32
_cell$ = -8
_buf$ = -4
_dyntab_add PROC NEAR

; 257  : ){

	push	ebp
	mov	ebp, esp
	sub	esp, 8

; 258  : 	DynTableCell *cell;
; 259  : 	DynBuffer *buf = NULL;

	mov	DWORD PTR _buf$[ebp], 0

; 260  : 
; 261  : 	/* Resize table if needed - return on error */
; 262  : 	if(!tab) return 0;

	cmp	DWORD PTR _tab$[ebp], 0
	jne	SHORT $L1188
	xor	eax, eax
	jmp	$L1184
$L1188:

; 263  : 	if(dyntab_resize(tab, row, col)) return 1;

	mov	eax, DWORD PTR _col$[ebp]
	push	eax
	mov	ecx, DWORD PTR _row$[ebp]
	push	ecx
	mov	edx, DWORD PTR _tab$[ebp]
	push	edx
	call	_dyntab_resize
	add	esp, 12					; 0000000cH
	test	eax, eax
	je	SHORT $L1189
	mov	eax, 1
	jmp	$L1184
$L1189:

; 264  : 
; 265  : 	if(!len && txt) len = strlen(txt);

	cmp	DWORD PTR _len$[ebp], 0
	jne	SHORT $L1190
	cmp	DWORD PTR _txt$[ebp], 0
	je	SHORT $L1190
	mov	eax, DWORD PTR _txt$[ebp]
	push	eax
	call	_strlen
	add	esp, 4
	mov	DWORD PTR _len$[ebp], eax
$L1190:

; 266  : 
; 267  : 	/* Use a buffer to handle search & replace */
; 268  : 	if(sr && srmode && txt && len)

	cmp	DWORD PTR _sr$[ebp], 0
	je	SHORT $L1191
	cmp	DWORD PTR _srmode$[ebp], 0
	je	SHORT $L1191
	cmp	DWORD PTR _txt$[ebp], 0
	je	SHORT $L1191
	cmp	DWORD PTR _len$[ebp], 0
	je	SHORT $L1191

; 270  : 		if(dynbuf_add(&buf, txt, len, sr, srmode)) return 1;

	mov	ecx, DWORD PTR _srmode$[ebp]
	push	ecx
	mov	edx, DWORD PTR _sr$[ebp]
	push	edx
	mov	eax, DWORD PTR _len$[ebp]
	push	eax
	mov	ecx, DWORD PTR _txt$[ebp]
	push	ecx
	lea	edx, DWORD PTR _buf$[ebp]
	push	edx
	call	_dynbuf_add
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L1192
	mov	eax, 1
	jmp	$L1184
$L1192:

; 271  : 		txt = buf->data;

	mov	eax, DWORD PTR _buf$[ebp]
	add	eax, 8
	mov	DWORD PTR _txt$[ebp], eax

; 272  : 		len = buf->cnt;

	mov	ecx, DWORD PTR _buf$[ebp]
	mov	edx, DWORD PTR [ecx+4]
	mov	DWORD PTR _len$[ebp], edx
$L1191:

; 274  : 
; 275  : 	/* Free previous text */
; 276  : 	cell = dyntab_cell(tab, row, col);

	mov	eax, DWORD PTR _col$[ebp]
	push	eax
	mov	ecx, DWORD PTR _row$[ebp]
	push	ecx
	mov	edx, DWORD PTR _tab$[ebp]
	push	edx
	call	_dyntab_cell
	add	esp, 12					; 0000000cH
	mov	DWORD PTR _cell$[ebp], eax

; 277  : 	if(!cell->b_dontfreetxt) mem_free(cell->txt);

	mov	eax, DWORD PTR _cell$[ebp]
	movsx	ecx, BYTE PTR [eax+14]
	test	ecx, ecx
	jne	SHORT $L1193
	mov	edx, DWORD PTR _cell$[ebp]
	mov	eax, DWORD PTR [edx]
	push	eax
	call	_mem_free
	add	esp, 4
$L1193:

; 278  : 
; 279  : 	/* Reset cell text */
; 280  : 	cell->len = 0;

	mov	ecx, DWORD PTR _cell$[ebp]
	mov	DWORD PTR [ecx+4], 0

; 281  : 	cell->txt = 0;

	mov	edx, DWORD PTR _cell$[ebp]
	mov	DWORD PTR [edx], 0

; 282  : 
; 283  : 	/* Add text if applicable */
; 284  : 	if(txt && *txt && len)

	cmp	DWORD PTR _txt$[ebp], 0
	je	SHORT $L1194
	mov	eax, DWORD PTR _txt$[ebp]
	movsx	ecx, BYTE PTR [eax]
	test	ecx, ecx
	je	SHORT $L1194
	cmp	DWORD PTR _len$[ebp], 0
	je	SHORT $L1194

; 286  : 		cell->txt = mem_alloc(len + 1);

	mov	edx, DWORD PTR _len$[ebp]
	add	edx, 1
	push	edx
	call	_mem_alloc
	add	esp, 4
	mov	ecx, DWORD PTR _cell$[ebp]
	mov	DWORD PTR [ecx], eax

; 287  : 		if(!cell->txt) { mem_free(buf); return 1; }

	mov	edx, DWORD PTR _cell$[ebp]
	cmp	DWORD PTR [edx], 0
	jne	SHORT $L1195
	mov	eax, DWORD PTR _buf$[ebp]
	push	eax
	call	_mem_free
	add	esp, 4
	mov	eax, 1
	jmp	SHORT $L1184
$L1195:

; 288  : 		memcpy(cell->txt, txt, len);

	mov	ecx, DWORD PTR _len$[ebp]
	push	ecx
	mov	edx, DWORD PTR _txt$[ebp]
	push	edx
	mov	eax, DWORD PTR _cell$[ebp]
	mov	ecx, DWORD PTR [eax]
	push	ecx
	call	_memcpy
	add	esp, 12					; 0000000cH

; 289  : 		cell->len = len;

	mov	edx, DWORD PTR _cell$[ebp]
	mov	eax, DWORD PTR _len$[ebp]
	mov	DWORD PTR [edx+4], eax

; 290  : 		cell->b_dontfreetxt = 0;

	mov	ecx, DWORD PTR _cell$[ebp]
	mov	BYTE PTR [ecx+14], 0
$L1194:

; 292  : 	mem_free(buf);

	mov	edx, DWORD PTR _buf$[ebp]
	push	edx
	call	_mem_free
	add	esp, 4

; 293  : 	return 0;

	xor	eax, eax
$L1184:

; 294  : }

	mov	esp, ebp
	pop	ebp
	ret	0
_dyntab_add ENDP
_TEXT	ENDS
PUBLIC	_dyntab_from_tab
_TEXT	SEGMENT
_dest$ = 8
_row0$ = 12
_col0$ = 16
_src$ = 20
_r0$ = 24
_c0$ = 28
_rn$ = 32
_cn$ = 36
_fillmode$ = 40
_i$ = -12
_j$ = -16
_row$ = -8
_col$ = -4
_b_rows$ = -20
_b_cols$ = -32
_b_useempty$ = -28
_b_strdup$ = -24
_c$1237 = -36
_dyntab_from_tab PROC NEAR

; 316  : ){

	push	ebp
	mov	ebp, esp
	sub	esp, 36					; 00000024H

; 317  : 	unsigned long i, j, row = row0, col = col0;

	mov	eax, DWORD PTR _row0$[ebp]
	mov	DWORD PTR _row$[ebp], eax
	mov	ecx, DWORD PTR _col0$[ebp]
	mov	DWORD PTR _col$[ebp], ecx

; 318  : 	int b_rows = fillmode & 1;

	mov	edx, DWORD PTR _fillmode$[ebp]
	and	edx, 1
	mov	DWORD PTR _b_rows$[ebp], edx

; 319  : 	int b_cols = fillmode & 2;

	mov	eax, DWORD PTR _fillmode$[ebp]
	and	eax, 2
	mov	DWORD PTR _b_cols$[ebp], eax

; 320  : 	int b_useempty = fillmode & 4;

	mov	ecx, DWORD PTR _fillmode$[ebp]
	and	ecx, 4
	mov	DWORD PTR _b_useempty$[ebp], ecx

; 321  : 	int b_strdup = fillmode & 32;

	mov	edx, DWORD PTR _fillmode$[ebp]
	and	edx, 32					; 00000020H
	mov	DWORD PTR _b_strdup$[ebp], edx

; 322  : 
; 323  : 	/* Clear dest & check params - return as applicable */
; 324  : 	if(!dest) return 0;

	cmp	DWORD PTR _dest$[ebp], 0
	jne	SHORT $L1223
	xor	eax, eax
	jmp	$L1214
$L1223:

; 325  : 	if(fillmode & 16) dyntab_free(dest);

	mov	eax, DWORD PTR _fillmode$[ebp]
	and	eax, 16					; 00000010H
	test	eax, eax
	je	SHORT $L1224
	mov	ecx, DWORD PTR _dest$[ebp]
	push	ecx
	call	_dyntab_free
	add	esp, 4
$L1224:

; 326  : 	if(!src || !src->nbrows || !src->nbcols) return 0;

	cmp	DWORD PTR _src$[ebp], 0
	je	SHORT $L1226
	mov	edx, DWORD PTR _src$[ebp]
	cmp	DWORD PTR [edx], 0
	je	SHORT $L1226
	mov	eax, DWORD PTR _src$[ebp]
	cmp	DWORD PTR [eax+8], 0
	jne	SHORT $L1225
$L1226:
	xor	eax, eax
	jmp	$L1214
$L1225:

; 327  : 	if(rn > src->nbrows) rn = src->nbrows;

	mov	ecx, DWORD PTR _src$[ebp]
	mov	edx, DWORD PTR _rn$[ebp]
	cmp	edx, DWORD PTR [ecx]
	jbe	SHORT $L1227
	mov	eax, DWORD PTR _src$[ebp]
	mov	ecx, DWORD PTR [eax]
	mov	DWORD PTR _rn$[ebp], ecx
$L1227:

; 328  : 	if(cn > src->nbcols) cn = src->nbcols;

	mov	edx, DWORD PTR _src$[ebp]
	mov	eax, DWORD PTR _cn$[ebp]
	cmp	eax, DWORD PTR [edx+8]
	jbe	SHORT $L1228
	mov	ecx, DWORD PTR _src$[ebp]
	mov	edx, DWORD PTR [ecx+8]
	mov	DWORD PTR _cn$[ebp], edx
$L1228:

; 329  : 	if(r0 >= rn || c0 >= cn) return 0;

	mov	eax, DWORD PTR _r0$[ebp]
	cmp	eax, DWORD PTR _rn$[ebp]
	jae	SHORT $L1230
	mov	ecx, DWORD PTR _c0$[ebp]
	cmp	ecx, DWORD PTR _cn$[ebp]
	jb	SHORT $L1229
$L1230:
	xor	eax, eax
	jmp	$L1214
$L1229:

; 330  : 
; 331  : 	/* Copy cells - loop on rows */
; 332  : 	for(i = r0; i < rn; i++)

	mov	edx, DWORD PTR _r0$[ebp]
	mov	DWORD PTR _i$[ebp], edx
	jmp	SHORT $L1231
$L1232:
	mov	eax, DWORD PTR _i$[ebp]
	add	eax, 1
	mov	DWORD PTR _i$[ebp], eax
$L1231:
	mov	ecx, DWORD PTR _i$[ebp]
	cmp	ecx, DWORD PTR _rn$[ebp]
	jae	$L1233

; 334  : 		for(j = c0; j < cn; j++)

	mov	edx, DWORD PTR _c0$[ebp]
	mov	DWORD PTR _j$[ebp], edx
	jmp	SHORT $L1234
$L1235:
	mov	eax, DWORD PTR _j$[ebp]
	add	eax, 1
	mov	DWORD PTR _j$[ebp], eax
$L1234:
	mov	ecx, DWORD PTR _j$[ebp]
	cmp	ecx, DWORD PTR _cn$[ebp]
	jae	$L1236

; 336  : 			DynTableCell *c = dyntab_cell(src, i, j);

	mov	edx, DWORD PTR _j$[ebp]
	push	edx
	mov	eax, DWORD PTR _i$[ebp]
	push	eax
	mov	ecx, DWORD PTR _src$[ebp]
	push	ecx
	call	_dyntab_cell
	add	esp, 12					; 0000000cH
	mov	DWORD PTR _c$1237[ebp], eax

; 337  : 			if(!b_useempty && (!c || !c->txt || !c->len)) continue;

	cmp	DWORD PTR _b_useempty$[ebp], 0
	jne	SHORT $L1238
	cmp	DWORD PTR _c$1237[ebp], 0
	je	SHORT $L1239
	mov	edx, DWORD PTR _c$1237[ebp]
	cmp	DWORD PTR [edx], 0
	je	SHORT $L1239
	mov	eax, DWORD PTR _c$1237[ebp]
	cmp	DWORD PTR [eax+4], 0
	jne	SHORT $L1238
$L1239:
	jmp	SHORT $L1235
$L1238:

; 338  : 			if(dyntab_copy(dest, row, col, c, b_strdup)) return 1;

	mov	ecx, DWORD PTR _b_strdup$[ebp]
	push	ecx
	mov	edx, DWORD PTR _c$1237[ebp]
	push	edx
	mov	eax, DWORD PTR _col$[ebp]
	push	eax
	mov	ecx, DWORD PTR _row$[ebp]
	push	ecx
	mov	edx, DWORD PTR _dest$[ebp]
	push	edx
	call	_dyntab_copy
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L1240
	mov	eax, 1
	jmp	SHORT $L1214
$L1240:

; 339  : 			if(b_cols) col++;

	cmp	DWORD PTR _b_cols$[ebp], 0
	je	SHORT $L1241
	mov	eax, DWORD PTR _col$[ebp]
	add	eax, 1
	mov	DWORD PTR _col$[ebp], eax

; 340  : 			else if(b_rows) row++;

	jmp	SHORT $L1244
$L1241:
	cmp	DWORD PTR _b_rows$[ebp], 0
	je	SHORT $L1243
	mov	ecx, DWORD PTR _row$[ebp]
	add	ecx, 1
	mov	DWORD PTR _row$[ebp], ecx

; 341  : 			else return 0;

	jmp	SHORT $L1244
$L1243:
	xor	eax, eax
	jmp	SHORT $L1214
$L1244:

; 342  : 		}

	jmp	$L1235
$L1236:

; 343  : 		if(b_rows && b_cols) { row++;	col = col0; }

	cmp	DWORD PTR _b_rows$[ebp], 0
	je	SHORT $L1245
	cmp	DWORD PTR _b_cols$[ebp], 0
	je	SHORT $L1245
	mov	edx, DWORD PTR _row$[ebp]
	add	edx, 1
	mov	DWORD PTR _row$[ebp], edx
	mov	eax, DWORD PTR _col0$[ebp]
	mov	DWORD PTR _col$[ebp], eax
$L1245:

; 344  : 	}

	jmp	$L1232
$L1233:

; 345  : 	return 0;

	xor	eax, eax
$L1214:

; 346  : }

	mov	esp, ebp
	pop	ebp
	ret	0
_dyntab_from_tab ENDP
_TEXT	ENDS
PUBLIC	_dyntab_from_list
EXTRN	_strstr:NEAR
_BSS	SEGMENT
	ALIGN	4

$SG1283	DB	01H DUP (?)
_BSS	ENDS
_TEXT	SEGMENT
_tab$ = 8
_txt$ = 12
_len$ = 16
_sep$ = 20
_index$ = 24
_fillmode$ = 28
_i$ = -12
_next$ = -16
_listend$ = -4
_sep_sz$ = -8
_end$1273 = -20
_dyntab_from_list PROC NEAR

; 361  : ){

	push	ebp
	mov	ebp, esp
	sub	esp, 40					; 00000028H

; 362  : 	unsigned long i = 0;

	mov	DWORD PTR _i$[ebp], 0

; 363  : 	char *next = txt, *listend = txt + len;

	mov	eax, DWORD PTR _txt$[ebp]
	mov	DWORD PTR _next$[ebp], eax
	mov	ecx, DWORD PTR _txt$[ebp]
	add	ecx, DWORD PTR _len$[ebp]
	mov	DWORD PTR _listend$[ebp], ecx

; 364  : 	size_t sep_sz = strlen(sep);

	mov	edx, DWORD PTR _sep$[ebp]
	push	edx
	call	_strlen
	add	esp, 4
	mov	DWORD PTR _sep_sz$[ebp], eax

; 365  : 
; 366  : 	/* Clear table & return as applicable */
; 367  : 	if(!tab) return 0;

	cmp	DWORD PTR _tab$[ebp], 0
	jne	SHORT $L1263
	xor	eax, eax
	jmp	$L1258
$L1263:

; 368  : 	if(fillmode & 2) dyntab_free(tab);

	mov	eax, DWORD PTR _fillmode$[ebp]
	and	eax, 2
	test	eax, eax
	je	SHORT $L1264
	mov	ecx, DWORD PTR _tab$[ebp]
	push	ecx
	call	_dyntab_free
	add	esp, 4
$L1264:

; 369  : 	if(!txt || !*txt || !len) return 0;

	cmp	DWORD PTR _txt$[ebp], 0
	je	SHORT $L1266
	mov	edx, DWORD PTR _txt$[ebp]
	movsx	eax, BYTE PTR [edx]
	test	eax, eax
	je	SHORT $L1266
	cmp	DWORD PTR _len$[ebp], 0
	jne	SHORT $L1265
$L1266:
	xor	eax, eax
	jmp	$L1258
$L1265:

; 370  : 
; 371  : 	/* No separator : put value in table */
; 372  : 	if(!sep || !*sep) return dyntab_add(tab, 0, 0, txt, len, NULL, 0);

	cmp	DWORD PTR _sep$[ebp], 0
	je	SHORT $L1268
	mov	ecx, DWORD PTR _sep$[ebp]
	movsx	edx, BYTE PTR [ecx]
	test	edx, edx
	jne	SHORT $L1267
$L1268:
	push	0
	push	0
	mov	eax, DWORD PTR _len$[ebp]
	push	eax
	mov	ecx, DWORD PTR _txt$[ebp]
	push	ecx
	push	0
	push	0
	mov	edx, DWORD PTR _tab$[ebp]
	push	edx
	call	_dyntab_add
	add	esp, 28					; 0000001cH
	jmp	$L1258
$L1267:

; 373  : 
; 374  : 
; 375  : 	/* Separate items & place theim in table */
; 376  : 	i = fillmode & 1 ? tab->nbcols : tab->nbrows;

	mov	eax, DWORD PTR _fillmode$[ebp]
	and	eax, 1
	test	eax, eax
	je	SHORT $L1473
	mov	ecx, DWORD PTR _tab$[ebp]
	mov	edx, DWORD PTR [ecx+8]
	mov	DWORD PTR -24+[ebp], edx
	jmp	SHORT $L1474
$L1473:
	mov	eax, DWORD PTR _tab$[ebp]
	mov	ecx, DWORD PTR [eax]
	mov	DWORD PTR -24+[ebp], ecx
$L1474:
	mov	edx, DWORD PTR -24+[ebp]
	mov	DWORD PTR _i$[ebp], edx
$L1270:

; 379  : 		char *end = strstr(next, sep);

	mov	eax, DWORD PTR _sep$[ebp]
	push	eax
	mov	ecx, DWORD PTR _next$[ebp]
	push	ecx
	call	_strstr
	add	esp, 8
	mov	DWORD PTR _end$1273[ebp], eax

; 380  : 		if(!end || end > listend) end = listend;

	cmp	DWORD PTR _end$1273[ebp], 0
	je	SHORT $L1275
	mov	edx, DWORD PTR _end$1273[ebp]
	cmp	edx, DWORD PTR _listend$[ebp]
	jbe	SHORT $L1274
$L1275:
	mov	eax, DWORD PTR _listend$[ebp]
	mov	DWORD PTR _end$1273[ebp], eax
$L1274:

; 381  : 		if(end > next)

	mov	ecx, DWORD PTR _end$1273[ebp]
	cmp	ecx, DWORD PTR _next$[ebp]
	jbe	SHORT $L1276

; 383  : 			if(dyntab_add(tab, fillmode & 1 ? index : i, fillmode & 1 ? i : index, next, end - next, NULL, 0)) return 1;

	mov	edx, DWORD PTR _fillmode$[ebp]
	and	edx, 1
	test	edx, edx
	je	SHORT $L1475
	mov	eax, DWORD PTR _i$[ebp]
	mov	DWORD PTR -28+[ebp], eax
	jmp	SHORT $L1476
$L1475:
	mov	ecx, DWORD PTR _index$[ebp]
	mov	DWORD PTR -28+[ebp], ecx
$L1476:
	mov	edx, DWORD PTR _fillmode$[ebp]
	and	edx, 1
	test	edx, edx
	je	SHORT $L1477
	mov	eax, DWORD PTR _index$[ebp]
	mov	DWORD PTR -32+[ebp], eax
	jmp	SHORT $L1478
$L1477:
	mov	ecx, DWORD PTR _i$[ebp]
	mov	DWORD PTR -32+[ebp], ecx
$L1478:
	push	0
	push	0
	mov	edx, DWORD PTR _end$1273[ebp]
	sub	edx, DWORD PTR _next$[ebp]
	push	edx
	mov	eax, DWORD PTR _next$[ebp]
	push	eax
	mov	ecx, DWORD PTR -28+[ebp]
	push	ecx
	mov	edx, DWORD PTR -32+[ebp]
	push	edx
	mov	eax, DWORD PTR _tab$[ebp]
	push	eax
	call	_dyntab_add
	add	esp, 28					; 0000001cH
	test	eax, eax
	je	SHORT $L1278
	mov	eax, 1
	jmp	$L1258
$L1278:

; 384  : 			i++;

	mov	ecx, DWORD PTR _i$[ebp]
	add	ecx, 1
	mov	DWORD PTR _i$[ebp], ecx

; 386  : 		else if(fillmode & 4)

	jmp	SHORT $L1280
$L1276:
	mov	edx, DWORD PTR _fillmode$[ebp]
	and	edx, 4
	test	edx, edx
	je	SHORT $L1280

; 388  : 			if(dyntab_add(tab, fillmode & 1 ? index : i, fillmode & 1 ? i : index, "", 0, NULL, 0)) return 1;

	mov	eax, DWORD PTR _fillmode$[ebp]
	and	eax, 1
	test	eax, eax
	je	SHORT $L1479
	mov	ecx, DWORD PTR _i$[ebp]
	mov	DWORD PTR -36+[ebp], ecx
	jmp	SHORT $L1480
$L1479:
	mov	edx, DWORD PTR _index$[ebp]
	mov	DWORD PTR -36+[ebp], edx
$L1480:
	mov	eax, DWORD PTR _fillmode$[ebp]
	and	eax, 1
	test	eax, eax
	je	SHORT $L1481
	mov	ecx, DWORD PTR _index$[ebp]
	mov	DWORD PTR -40+[ebp], ecx
	jmp	SHORT $L1482
$L1481:
	mov	edx, DWORD PTR _i$[ebp]
	mov	DWORD PTR -40+[ebp], edx
$L1482:
	push	0
	push	0
	push	0
	push	OFFSET FLAT:$SG1283
	mov	eax, DWORD PTR -36+[ebp]
	push	eax
	mov	ecx, DWORD PTR -40+[ebp]
	push	ecx
	mov	edx, DWORD PTR _tab$[ebp]
	push	edx
	call	_dyntab_add
	add	esp, 28					; 0000001cH
	test	eax, eax
	je	SHORT $L1282
	mov	eax, 1
	jmp	SHORT $L1258
$L1282:

; 389  : 			i++;

	mov	eax, DWORD PTR _i$[ebp]
	add	eax, 1
	mov	DWORD PTR _i$[ebp], eax
$L1280:

; 391  : 		next = end + sep_sz;

	mov	ecx, DWORD PTR _end$1273[ebp]
	add	ecx, DWORD PTR _sep_sz$[ebp]
	mov	DWORD PTR _next$[ebp], ecx

; 393  : 	while(next < listend);

	mov	edx, DWORD PTR _next$[ebp]
	cmp	edx, DWORD PTR _listend$[ebp]
	jb	$L1270

; 394  : 
; 395  : 	return 0;

	xor	eax, eax
$L1258:

; 396  : }

	mov	esp, ebp
	pop	ebp
	ret	0
_dyntab_from_list ENDP
_TEXT	ENDS
PUBLIC	_dyntab_set_txt
_TEXT	SEGMENT
_tab$ = 8
_row$ = 12
_col$ = 16
_txt$ = 20
_len$ = 24
_cell$ = -4
_dyntab_set_txt PROC NEAR

; 407  : ){

	push	ebp
	mov	ebp, esp
	push	ecx

; 408  : 	DynTableCell *cell;
; 409  : 
; 410  : 	/* Resize table if needed - return on error */
; 411  : 	if(!tab) return 0;

	cmp	DWORD PTR _tab$[ebp], 0
	jne	SHORT $L1296
	xor	eax, eax
	jmp	$L1294
$L1296:

; 412  : 	if(dyntab_resize(tab, row, col)) return 1;

	mov	eax, DWORD PTR _col$[ebp]
	push	eax
	mov	ecx, DWORD PTR _row$[ebp]
	push	ecx
	mov	edx, DWORD PTR _tab$[ebp]
	push	edx
	call	_dyntab_resize
	add	esp, 12					; 0000000cH
	test	eax, eax
	je	SHORT $L1297
	mov	eax, 1
	jmp	SHORT $L1294
$L1297:

; 413  : 
; 414  : 	if(!len && txt) len = strlen(txt);

	cmp	DWORD PTR _len$[ebp], 0
	jne	SHORT $L1298
	cmp	DWORD PTR _txt$[ebp], 0
	je	SHORT $L1298
	mov	eax, DWORD PTR _txt$[ebp]
	push	eax
	call	_strlen
	add	esp, 4
	mov	DWORD PTR _len$[ebp], eax
$L1298:

; 415  : 
; 416  : 	/* Free previous text */
; 417  : 	cell = dyntab_cell(tab, row, col);

	mov	ecx, DWORD PTR _col$[ebp]
	push	ecx
	mov	edx, DWORD PTR _row$[ebp]
	push	edx
	mov	eax, DWORD PTR _tab$[ebp]
	push	eax
	call	_dyntab_cell
	add	esp, 12					; 0000000cH
	mov	DWORD PTR _cell$[ebp], eax

; 418  : 	if(!cell->b_dontfreetxt) mem_free(cell->txt);

	mov	ecx, DWORD PTR _cell$[ebp]
	movsx	edx, BYTE PTR [ecx+14]
	test	edx, edx
	jne	SHORT $L1299
	mov	eax, DWORD PTR _cell$[ebp]
	mov	ecx, DWORD PTR [eax]
	push	ecx
	call	_mem_free
	add	esp, 4
$L1299:

; 419  : 
; 420  : 	/* Set cell text */
; 421  : 	cell->b_dontfreetxt = 1;

	mov	edx, DWORD PTR _cell$[ebp]
	mov	BYTE PTR [edx+14], 1

; 422  : 	cell->txt = txt;

	mov	eax, DWORD PTR _cell$[ebp]
	mov	ecx, DWORD PTR _txt$[ebp]
	mov	DWORD PTR [eax], ecx

; 423  : 	cell->len = len;

	mov	edx, DWORD PTR _cell$[ebp]
	mov	eax, DWORD PTR _len$[ebp]
	mov	DWORD PTR [edx+4], eax

; 424  : 	return 0;

	xor	eax, eax
$L1294:

; 425  : }

	mov	esp, ebp
	pop	ebp
	ret	0
_dyntab_set_txt ENDP
_TEXT	ENDS
PUBLIC	_dyntab_to_dynbuf
_TEXT	SEGMENT
_tab$ = 8
_buf$ = 12
_cs$ = 16
_sz_cs$ = 20
_rs$ = 24
_sz_rs$ = 28
_sr$ = 32
_srmode$ = 36
_i$ = -4
_j$ = -8
_dyntab_to_dynbuf PROC NEAR

; 438  : ){

	push	ebp
	mov	ebp, esp
	sub	esp, 8

; 439  : 	unsigned long i, j;
; 440  : 
; 441  : 	if(!tab) return 0;

	cmp	DWORD PTR _tab$[ebp], 0
	jne	SHORT $L1319
	xor	eax, eax
	jmp	$L1316
$L1319:

; 442  : 	for(i = 0; i < tab->nbrows && (!i || rs); i++)

	mov	DWORD PTR _i$[ebp], 0
	jmp	SHORT $L1320
$L1321:
	mov	eax, DWORD PTR _i$[ebp]
	add	eax, 1
	mov	DWORD PTR _i$[ebp], eax
$L1320:
	mov	ecx, DWORD PTR _tab$[ebp]
	mov	edx, DWORD PTR _i$[ebp]
	cmp	edx, DWORD PTR [ecx]
	jae	$L1322
	cmp	DWORD PTR _i$[ebp], 0
	je	SHORT $L1323
	cmp	DWORD PTR _rs$[ebp], 0
	je	$L1322
$L1323:

; 444  : 		if(i && dynbuf_add(buf, rs, sz_rs, NO_CONV)) return 1;

	cmp	DWORD PTR _i$[ebp], 0
	je	SHORT $L1325
	push	0
	push	0
	mov	eax, DWORD PTR _sz_rs$[ebp]
	push	eax
	mov	ecx, DWORD PTR _rs$[ebp]
	push	ecx
	mov	edx, DWORD PTR _buf$[ebp]
	push	edx
	call	_dynbuf_add
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L1325
	mov	eax, 1
	jmp	$L1316
$L1325:

; 445  : 		for(j = 0; j < tab->nbcols && (!j || cs); j++)

	mov	DWORD PTR _j$[ebp], 0
	jmp	SHORT $L1326
$L1327:
	mov	eax, DWORD PTR _j$[ebp]
	add	eax, 1
	mov	DWORD PTR _j$[ebp], eax
$L1326:
	mov	ecx, DWORD PTR _tab$[ebp]
	mov	edx, DWORD PTR _j$[ebp]
	cmp	edx, DWORD PTR [ecx+8]
	jae	$L1328
	cmp	DWORD PTR _j$[ebp], 0
	je	SHORT $L1329
	cmp	DWORD PTR _cs$[ebp], 0
	je	SHORT $L1328
$L1329:

; 447  : 			if(j && dynbuf_add(buf, cs, sz_cs, sr, srmode)) return 1;

	cmp	DWORD PTR _j$[ebp], 0
	je	SHORT $L1330
	mov	eax, DWORD PTR _srmode$[ebp]
	push	eax
	mov	ecx, DWORD PTR _sr$[ebp]
	push	ecx
	mov	edx, DWORD PTR _sz_cs$[ebp]
	push	edx
	mov	eax, DWORD PTR _cs$[ebp]
	push	eax
	mov	ecx, DWORD PTR _buf$[ebp]
	push	ecx
	call	_dynbuf_add
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L1330
	mov	eax, 1
	jmp	SHORT $L1316
$L1330:

; 448  : 			if(dynbuf_add(buf, DYNTAB_VAL_SZ(tab, i, j), sr, srmode)) return 1;

	mov	edx, DWORD PTR _srmode$[ebp]
	push	edx
	mov	eax, DWORD PTR _sr$[ebp]
	push	eax
	mov	ecx, DWORD PTR _j$[ebp]
	push	ecx
	mov	edx, DWORD PTR _i$[ebp]
	push	edx
	mov	eax, DWORD PTR _tab$[ebp]
	push	eax
	call	_dyntab_sz
	add	esp, 12					; 0000000cH
	push	eax
	mov	ecx, DWORD PTR _j$[ebp]
	push	ecx
	mov	edx, DWORD PTR _i$[ebp]
	push	edx
	mov	eax, DWORD PTR _tab$[ebp]
	push	eax
	call	_dyntab_val
	add	esp, 12					; 0000000cH
	push	eax
	mov	ecx, DWORD PTR _buf$[ebp]
	push	ecx
	call	_dynbuf_add
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L1331
	mov	eax, 1
	jmp	SHORT $L1316
$L1331:

; 449  : 		}

	jmp	$L1327
$L1328:

; 450  : 	}

	jmp	$L1321
$L1322:

; 451  : 	return 0;

	xor	eax, eax
$L1316:

; 452  : }

	mov	esp, ebp
	pop	ebp
	ret	0
_dyntab_to_dynbuf ENDP
_TEXT	ENDS
PUBLIC	_dyntab_txt_cmp
EXTRN	_strncmp:NEAR
_BSS	SEGMENT
	ALIGN	4

$SG1347	DB	01H DUP (?)
_BSS	ENDS
_TEXT	SEGMENT
_txt$ = 8
_sz$ = 12
_tab$ = 16
_row$ = 20
_col$ = 24
_txt1$ = -8
_sz1$ = -4
_dyntab_txt_cmp PROC NEAR

; 464  : ){

	push	ebp
	mov	ebp, esp
	sub	esp, 16					; 00000010H

; 465  : 	char *txt1;
; 466  : 	size_t sz1;
; 467  : 
; 468  : 	/* Check params */
; 469  : 	if(!tab) return txt && *txt;

	cmp	DWORD PTR _tab$[ebp], 0
	jne	SHORT $L1345
	cmp	DWORD PTR _txt$[ebp], 0
	je	SHORT $L1486
	mov	eax, DWORD PTR _txt$[ebp]
	movsx	ecx, BYTE PTR [eax]
	test	ecx, ecx
	je	SHORT $L1486
	mov	DWORD PTR -12+[ebp], 1
	jmp	SHORT $L1487
$L1486:
	mov	DWORD PTR -12+[ebp], 0
$L1487:
	mov	eax, DWORD PTR -12+[ebp]
	jmp	SHORT $L1342
$L1345:

; 470  : 	if(!txt) txt = "";

	cmp	DWORD PTR _txt$[ebp], 0
	jne	SHORT $L1346
	mov	DWORD PTR _txt$[ebp], OFFSET FLAT:$SG1347
$L1346:

; 471  : 	if(!sz) sz = strlen(txt);

	cmp	DWORD PTR _sz$[ebp], 0
	jne	SHORT $L1348
	mov	edx, DWORD PTR _txt$[ebp]
	push	edx
	call	_strlen
	add	esp, 4
	mov	DWORD PTR _sz$[ebp], eax
$L1348:

; 472  : 
; 473  : 	/* Return string comparison on max length */
; 474  : 	txt1 = dyntab_val(tab, row, col);

	mov	eax, DWORD PTR _col$[ebp]
	push	eax
	mov	ecx, DWORD PTR _row$[ebp]
	push	ecx
	mov	edx, DWORD PTR _tab$[ebp]
	push	edx
	call	_dyntab_val
	add	esp, 12					; 0000000cH
	mov	DWORD PTR _txt1$[ebp], eax

; 475  : 	sz1 = dyntab_sz(tab, row, col);

	mov	eax, DWORD PTR _col$[ebp]
	push	eax
	mov	ecx, DWORD PTR _row$[ebp]
	push	ecx
	mov	edx, DWORD PTR _tab$[ebp]
	push	edx
	call	_dyntab_sz
	add	esp, 12					; 0000000cH
	mov	DWORD PTR _sz1$[ebp], eax

; 476  : 	return strncmp(txt, txt1, sz1 < sz ? sz : sz1);

	mov	eax, DWORD PTR _sz1$[ebp]
	cmp	eax, DWORD PTR _sz$[ebp]
	jae	SHORT $L1488
	mov	ecx, DWORD PTR _sz$[ebp]
	mov	DWORD PTR -16+[ebp], ecx
	jmp	SHORT $L1489
$L1488:
	mov	edx, DWORD PTR _sz1$[ebp]
	mov	DWORD PTR -16+[ebp], edx
$L1489:
	mov	eax, DWORD PTR -16+[ebp]
	push	eax
	mov	ecx, DWORD PTR _txt1$[ebp]
	push	ecx
	mov	edx, DWORD PTR _txt$[ebp]
	push	edx
	call	_strncmp
	add	esp, 12					; 0000000cH
$L1342:

; 477  : }

	mov	esp, ebp
	pop	ebp
	ret	0
_dyntab_txt_cmp ENDP
_TEXT	ENDS
PUBLIC	_dyntab_cmp
_TEXT	SEGMENT
_tab1$ = 8
_row1$ = 12
_col1$ = 16
_tab2$ = 20
_row2$ = 24
_col2$ = 28
_txt1$ = -8
_sz1$ = -4
_dyntab_cmp PROC NEAR

; 490  : ){

	push	ebp
	mov	ebp, esp
	sub	esp, 8

; 491  : 	char *txt1;
; 492  : 	size_t sz1;
; 493  : 
; 494  : 	/* Check params */
; 495  : 	txt1 = dyntab_val(tab1, row1, col1);

	mov	eax, DWORD PTR _col1$[ebp]
	push	eax
	mov	ecx, DWORD PTR _row1$[ebp]
	push	ecx
	mov	edx, DWORD PTR _tab1$[ebp]
	push	edx
	call	_dyntab_val
	add	esp, 12					; 0000000cH
	mov	DWORD PTR _txt1$[ebp], eax

; 496  : 	sz1 = dyntab_sz(tab1, row1, col1);

	mov	eax, DWORD PTR _col1$[ebp]
	push	eax
	mov	ecx, DWORD PTR _row1$[ebp]
	push	ecx
	mov	edx, DWORD PTR _tab1$[ebp]
	push	edx
	call	_dyntab_sz
	add	esp, 12					; 0000000cH
	mov	DWORD PTR _sz1$[ebp], eax

; 497  : 
; 498  : 	/* Return comparison result */
; 499  : 	return dyntab_txt_cmp(txt1, sz1, tab2, row2, col2);

	mov	eax, DWORD PTR _col2$[ebp]
	push	eax
	mov	ecx, DWORD PTR _row2$[ebp]
	push	ecx
	mov	edx, DWORD PTR _tab2$[ebp]
	push	edx
	mov	eax, DWORD PTR _sz1$[ebp]
	push	eax
	mov	ecx, DWORD PTR _txt1$[ebp]
	push	ecx
	call	_dyntab_txt_cmp
	add	esp, 20					; 00000014H

; 500  : }

	mov	esp, ebp
	pop	ebp
	ret	0
_dyntab_cmp ENDP
_TEXT	ENDS
PUBLIC	_dyntab_del_rows
PUBLIC	_dyntab_del_numline
_TEXT	SEGMENT
_tab$ = 8
_num$ = 12
_line$ = 16
_i$ = -4
_c$1376 = -8
_dyntab_del_numline PROC NEAR

; 510  : ){

	push	ebp
	mov	ebp, esp
	sub	esp, 8

; 511  : 	unsigned long i;
; 512  : 	if(!tab) return;

	cmp	DWORD PTR _tab$[ebp], 0
	jne	SHORT $L1372
	jmp	SHORT $L1375
$L1372:

; 513  : 	for(i = tab->nbrows; i; i--)

	mov	eax, DWORD PTR _tab$[ebp]
	mov	ecx, DWORD PTR [eax]
	mov	DWORD PTR _i$[ebp], ecx
	jmp	SHORT $L1373
$L1374:
	mov	edx, DWORD PTR _i$[ebp]
	sub	edx, 1
	mov	DWORD PTR _i$[ebp], edx
$L1373:
	cmp	DWORD PTR _i$[ebp], 0
	je	SHORT $L1375

; 515  : 		DynTableCell *c = dyntab_cell(tab, i - 1, 0);

	push	0
	mov	eax, DWORD PTR _i$[ebp]
	sub	eax, 1
	push	eax
	mov	ecx, DWORD PTR _tab$[ebp]
	push	ecx
	call	_dyntab_cell
	add	esp, 12					; 0000000cH
	mov	DWORD PTR _c$1376[ebp], eax

; 516  : 		if(!num || ((c->Num && !line )|| c->Line == line) )

	cmp	DWORD PTR _num$[ebp], 0
	je	SHORT $L1379
	mov	edx, DWORD PTR _c$1376[ebp]
	cmp	DWORD PTR [edx+36], 0
	je	SHORT $L1380
	cmp	DWORD PTR _line$[ebp], 0
	je	SHORT $L1379
$L1380:
	mov	eax, DWORD PTR _c$1376[ebp]
	mov	ecx, DWORD PTR [eax+40]
	cmp	ecx, DWORD PTR _line$[ebp]
	jne	SHORT $L1377
$L1379:

; 517  : 			dyntab_del_rows(tab, i - 1, 1);

	push	1
	mov	edx, DWORD PTR _i$[ebp]
	sub	edx, 1
	push	edx
	mov	eax, DWORD PTR _tab$[ebp]
	push	eax
	call	_dyntab_del_rows
	add	esp, 12					; 0000000cH
$L1377:

; 518  : 	}

	jmp	SHORT $L1374
$L1375:

; 519  : }

	mov	esp, ebp
	pop	ebp
	ret	0
_dyntab_del_numline ENDP
_TEXT	ENDS
EXTRN	_memmove:NEAR
_TEXT	SEGMENT
_tab$ = 8
_row$ = 12
_nbrows$ = 16
_i$ = -4
_j$ = -8
_k$ = -12
_dyntab_del_rows PROC NEAR

; 529  : ){

	push	ebp
	mov	ebp, esp
	sub	esp, 12					; 0000000cH

; 530  : 	unsigned long i, j, k;
; 531  : 
; 532  : 	/* Check params */
; 533  : 	if(!tab || row >= tab->nbrows) return;

	cmp	DWORD PTR _tab$[ebp], 0
	je	SHORT $L1392
	mov	eax, DWORD PTR _tab$[ebp]
	mov	ecx, DWORD PTR _row$[ebp]
	cmp	ecx, DWORD PTR [eax]
	jb	SHORT $L1391
$L1392:
	jmp	$L1387
$L1391:

; 534  : 	if(row + nbrows > tab->nbrows) nbrows = tab->nbrows - row;

	mov	edx, DWORD PTR _row$[ebp]
	add	edx, DWORD PTR _nbrows$[ebp]
	mov	eax, DWORD PTR _tab$[ebp]
	cmp	edx, DWORD PTR [eax]
	jbe	SHORT $L1393
	mov	ecx, DWORD PTR _tab$[ebp]
	mov	edx, DWORD PTR [ecx]
	sub	edx, DWORD PTR _row$[ebp]
	mov	DWORD PTR _nbrows$[ebp], edx
$L1393:

; 535  : 
; 536  : 	/* Free deleted rows cells */
; 537  : 	for(i = row; i < row + nbrows; i++)

	mov	eax, DWORD PTR _row$[ebp]
	mov	DWORD PTR _i$[ebp], eax
	jmp	SHORT $L1394
$L1395:
	mov	ecx, DWORD PTR _i$[ebp]
	add	ecx, 1
	mov	DWORD PTR _i$[ebp], ecx
$L1394:
	mov	edx, DWORD PTR _row$[ebp]
	add	edx, DWORD PTR _nbrows$[ebp]
	cmp	DWORD PTR _i$[ebp], edx
	jae	SHORT $L1396

; 538  : 		for(j = 0; j < tab->nbcols; j++)

	mov	DWORD PTR _j$[ebp], 0
	jmp	SHORT $L1397
$L1398:
	mov	eax, DWORD PTR _j$[ebp]
	add	eax, 1
	mov	DWORD PTR _j$[ebp], eax
$L1397:
	mov	ecx, DWORD PTR _tab$[ebp]
	mov	edx, DWORD PTR _j$[ebp]
	cmp	edx, DWORD PTR [ecx+8]
	jae	SHORT $L1399

; 540  : 			k = DYNTAB_INDEX(tab, i, j);

	mov	eax, DWORD PTR _tab$[ebp]
	mov	ecx, DWORD PTR _i$[ebp]
	imul	ecx, DWORD PTR [eax+12]
	mov	edx, DWORD PTR _j$[ebp]
	add	edx, ecx
	mov	DWORD PTR _k$[ebp], edx

; 541  : 			dyntab_free_cell(tab, k);

	mov	eax, DWORD PTR _k$[ebp]
	push	eax
	mov	ecx, DWORD PTR _tab$[ebp]
	push	ecx
	call	_dyntab_free_cell
	add	esp, 8

; 542  : 		}

	jmp	SHORT $L1398
$L1399:
	jmp	SHORT $L1395
$L1396:

; 543  : 
; 544  : 	/* Move following rows & clear remaining rows */
; 545  : 	i = DYNTAB_INDEX(tab, row, 0);

	mov	edx, DWORD PTR _tab$[ebp]
	mov	eax, DWORD PTR _row$[ebp]
	imul	eax, DWORD PTR [edx+12]
	mov	DWORD PTR _i$[ebp], eax

; 546  : 	j = DYNTAB_INDEX(tab, row + nbrows, 0);

	mov	ecx, DWORD PTR _row$[ebp]
	add	ecx, DWORD PTR _nbrows$[ebp]
	mov	edx, DWORD PTR _tab$[ebp]
	imul	ecx, DWORD PTR [edx+12]
	mov	DWORD PTR _j$[ebp], ecx

; 547  : 	k = tab->szcols	* (tab->nbrows - row - nbrows);

	mov	eax, DWORD PTR _tab$[ebp]
	mov	ecx, DWORD PTR [eax]
	sub	ecx, DWORD PTR _row$[ebp]
	sub	ecx, DWORD PTR _nbrows$[ebp]
	mov	edx, DWORD PTR _tab$[ebp]
	mov	eax, DWORD PTR [edx+12]
	imul	eax, ecx
	mov	DWORD PTR _k$[ebp], eax

; 548  : 	memmove(tab->cell + i, tab->cell + j, sizeof(tab->cell[0]) * k);

	mov	ecx, DWORD PTR _k$[ebp]
	shl	ecx, 6
	push	ecx
	mov	edx, DWORD PTR _j$[ebp]
	shl	edx, 6
	mov	eax, DWORD PTR _tab$[ebp]
	mov	ecx, DWORD PTR [eax+16]
	add	ecx, edx
	push	ecx
	mov	edx, DWORD PTR _i$[ebp]
	shl	edx, 6
	mov	eax, DWORD PTR _tab$[ebp]
	mov	ecx, DWORD PTR [eax+16]
	add	ecx, edx
	push	ecx
	call	_memmove
	add	esp, 12					; 0000000cH

; 549  : 	i = DYNTAB_INDEX(tab, tab->nbrows - nbrows, 0);

	mov	edx, DWORD PTR _tab$[ebp]
	mov	eax, DWORD PTR [edx]
	sub	eax, DWORD PTR _nbrows$[ebp]
	mov	ecx, DWORD PTR _tab$[ebp]
	imul	eax, DWORD PTR [ecx+12]
	mov	DWORD PTR _i$[ebp], eax

; 550  : 	k = tab->szcols	* nbrows;

	mov	edx, DWORD PTR _tab$[ebp]
	mov	eax, DWORD PTR [edx+12]
	imul	eax, DWORD PTR _nbrows$[ebp]
	mov	DWORD PTR _k$[ebp], eax

; 551  : 	memset(tab->cell + i, 0, sizeof(tab->cell[0]) * k);

	mov	ecx, DWORD PTR _k$[ebp]
	shl	ecx, 6
	push	ecx
	push	0
	mov	edx, DWORD PTR _i$[ebp]
	shl	edx, 6
	mov	eax, DWORD PTR _tab$[ebp]
	mov	ecx, DWORD PTR [eax+16]
	add	ecx, edx
	push	ecx
	call	_memset
	add	esp, 12					; 0000000cH

; 552  : 	tab->nbrows -= nbrows;

	mov	edx, DWORD PTR _tab$[ebp]
	mov	eax, DWORD PTR [edx]
	sub	eax, DWORD PTR _nbrows$[ebp]
	mov	ecx, DWORD PTR _tab$[ebp]
	mov	DWORD PTR [ecx], eax
$L1387:

; 553  : }

	mov	esp, ebp
	pop	ebp
	ret	0
_dyntab_del_rows ENDP
_TEXT	ENDS
PUBLIC	_dyntab_ins_rows
_TEXT	SEGMENT
_tab$ = 8
_row$ = 12
_nbrows$ = 16
_i$ = -12
_j$ = -16
_k$ = -20
_nbr$ = -8
_nbr0$ = -4
_dyntab_ins_rows PROC NEAR

; 563  : ){

	push	ebp
	mov	ebp, esp
	sub	esp, 24					; 00000018H

; 564  : 	unsigned long i, j, k, nbr, nbr0;
; 565  : 
; 566  : 	/* Check params */
; 567  : 	if(!tab || !nbrows) return 0;

	cmp	DWORD PTR _tab$[ebp], 0
	je	SHORT $L1413
	cmp	DWORD PTR _nbrows$[ebp], 0
	jne	SHORT $L1412
$L1413:
	xor	eax, eax
	jmp	$L1406
$L1412:

; 568  : 
; 569  : 	/* Resize table */
; 570  : 	nbr0 = tab->nbrows;

	mov	eax, DWORD PTR _tab$[ebp]
	mov	ecx, DWORD PTR [eax]
	mov	DWORD PTR _nbr0$[ebp], ecx

; 571  : 	nbr = ((row < nbr0) ? nbr0 : row) + nbrows;

	mov	edx, DWORD PTR _row$[ebp]
	cmp	edx, DWORD PTR _nbr0$[ebp]
	jae	SHORT $L1494
	mov	eax, DWORD PTR _nbr0$[ebp]
	mov	DWORD PTR -24+[ebp], eax
	jmp	SHORT $L1495
$L1494:
	mov	ecx, DWORD PTR _row$[ebp]
	mov	DWORD PTR -24+[ebp], ecx
$L1495:
	mov	edx, DWORD PTR -24+[ebp]
	add	edx, DWORD PTR _nbrows$[ebp]
	mov	DWORD PTR _nbr$[ebp], edx

; 572  : 	if(dyntab_resize(tab, nbr, tab->nbcols)) return 1;

	mov	eax, DWORD PTR _tab$[ebp]
	mov	ecx, DWORD PTR [eax+8]
	push	ecx
	mov	edx, DWORD PTR _nbr$[ebp]
	push	edx
	mov	eax, DWORD PTR _tab$[ebp]
	push	eax
	call	_dyntab_resize
	add	esp, 12					; 0000000cH
	test	eax, eax
	je	SHORT $L1414
	mov	eax, 1
	jmp	$L1406
$L1414:

; 573  : 
; 574  : 	/* Move following rows & clear new rows */
; 575  : 	if(nbr0 >= row)

	mov	ecx, DWORD PTR _nbr0$[ebp]
	cmp	ecx, DWORD PTR _row$[ebp]
	jb	$L1415

; 577  : 		i = DYNTAB_INDEX(tab, row, 0);

	mov	edx, DWORD PTR _tab$[ebp]
	mov	eax, DWORD PTR _row$[ebp]
	imul	eax, DWORD PTR [edx+12]
	mov	DWORD PTR _i$[ebp], eax

; 578  : 		j = DYNTAB_INDEX(tab, row + nbrows, 0);

	mov	ecx, DWORD PTR _row$[ebp]
	add	ecx, DWORD PTR _nbrows$[ebp]
	mov	edx, DWORD PTR _tab$[ebp]
	imul	ecx, DWORD PTR [edx+12]
	mov	DWORD PTR _j$[ebp], ecx

; 579  : 		k = tab->szcols	* (nbr0 - row);

	mov	eax, DWORD PTR _nbr0$[ebp]
	sub	eax, DWORD PTR _row$[ebp]
	mov	ecx, DWORD PTR _tab$[ebp]
	mov	edx, DWORD PTR [ecx+12]
	imul	edx, eax
	mov	DWORD PTR _k$[ebp], edx

; 580  : 		memmove(tab->cell + j, tab->cell + i, sizeof(tab->cell[0]) * k);

	mov	eax, DWORD PTR _k$[ebp]
	shl	eax, 6
	push	eax
	mov	ecx, DWORD PTR _i$[ebp]
	shl	ecx, 6
	mov	edx, DWORD PTR _tab$[ebp]
	mov	eax, DWORD PTR [edx+16]
	add	eax, ecx
	push	eax
	mov	ecx, DWORD PTR _j$[ebp]
	shl	ecx, 6
	mov	edx, DWORD PTR _tab$[ebp]
	mov	eax, DWORD PTR [edx+16]
	add	eax, ecx
	push	eax
	call	_memmove
	add	esp, 12					; 0000000cH

; 581  : 		k = tab->szcols	* nbrows;

	mov	ecx, DWORD PTR _tab$[ebp]
	mov	edx, DWORD PTR [ecx+12]
	imul	edx, DWORD PTR _nbrows$[ebp]
	mov	DWORD PTR _k$[ebp], edx

; 582  : 		memset(tab->cell + i, 0, sizeof(tab->cell[0]) * k);

	mov	eax, DWORD PTR _k$[ebp]
	shl	eax, 6
	push	eax
	push	0
	mov	ecx, DWORD PTR _i$[ebp]
	shl	ecx, 6
	mov	edx, DWORD PTR _tab$[ebp]
	mov	eax, DWORD PTR [edx+16]
	add	eax, ecx
	push	eax
	call	_memset
	add	esp, 12					; 0000000cH

; 583  : 		tab->nbrows = nbr;

	mov	ecx, DWORD PTR _tab$[ebp]
	mov	edx, DWORD PTR _nbr$[ebp]
	mov	DWORD PTR [ecx], edx
$L1415:

; 585  : 	return 0;

	xor	eax, eax
$L1406:

; 586  : }

	mov	esp, ebp
	pop	ebp
	ret	0
_dyntab_ins_rows ENDP
_TEXT	ENDS
PUBLIC	_dyntab_transform
EXTRN	_strcmp:NEAR
_BSS	SEGMENT
	ALIGN	4

$SG1440	DB	01H DUP (?)
	ALIGN	4

$SG1441	DB	01H DUP (?)
	ALIGN	4

$SG1448	DB	01H DUP (?)
	ALIGN	4

$SG1449	DB	01H DUP (?)
_BSS	ENDS
_TEXT	SEGMENT
_tab$ = 8
_row$ = 12
_col$ = 16
_val$ = 20
_cross$ = 24
_i$ = -4
_j$ = -8
_k$ = -12
_dyntab_transform PROC NEAR

; 602  : ){

	push	ebp
	mov	ebp, esp
	sub	esp, 28					; 0000001cH
	push	esi

; 603  : 	unsigned long i, j, k;
; 604  : 
; 605  : 	if(!tab || !cross) return NULL;

	cmp	DWORD PTR _tab$[ebp], 0
	je	SHORT $L1432
	cmp	DWORD PTR _cross$[ebp], 0
	jne	SHORT $L1431
$L1432:
	xor	eax, eax
	jmp	$L1427
$L1431:

; 606  : 
; 607  : 	cross->cell[0].txt = tab->cell[row].txt;

	mov	eax, DWORD PTR _row$[ebp]
	shl	eax, 6
	mov	ecx, DWORD PTR _tab$[ebp]
	mov	edx, DWORD PTR [ecx+16]
	mov	ecx, DWORD PTR _cross$[ebp]
	mov	ecx, DWORD PTR [ecx+16]
	mov	edx, DWORD PTR [edx+eax]
	mov	DWORD PTR [ecx], edx

; 608  : 
; 609  : 	/* for each row in source table */
; 610  : 	for(i = 1; i < tab->nbrows; i++)

	mov	DWORD PTR _i$[ebp], 1
	jmp	SHORT $L1434
$L1435:
	mov	eax, DWORD PTR _i$[ebp]
	add	eax, 1
	mov	DWORD PTR _i$[ebp], eax
$L1434:
	mov	ecx, DWORD PTR _tab$[ebp]
	mov	edx, DWORD PTR _i$[ebp]
	cmp	edx, DWORD PTR [ecx]
	jae	$L1436

; 612  : 		/* Search for col value in row 1 */
; 613  : 		for(j = 1; j < cross->nbcols &&
; 614  : 			STRCMPNUL(cross->cell[j].txt, tab->cell[col + i * tab->szcols].txt); j++);

	mov	DWORD PTR _j$[ebp], 1
	jmp	SHORT $L1437
$L1438:
	mov	eax, DWORD PTR _j$[ebp]
	add	eax, 1
	mov	DWORD PTR _j$[ebp], eax
$L1437:
	mov	ecx, DWORD PTR _cross$[ebp]
	mov	edx, DWORD PTR _j$[ebp]
	cmp	edx, DWORD PTR [ecx+8]
	jae	$L1439
	mov	eax, DWORD PTR _tab$[ebp]
	mov	ecx, DWORD PTR _i$[ebp]
	imul	ecx, DWORD PTR [eax+12]
	mov	edx, DWORD PTR _col$[ebp]
	add	edx, ecx
	shl	edx, 6
	mov	eax, DWORD PTR _tab$[ebp]
	mov	ecx, DWORD PTR [eax+16]
	cmp	DWORD PTR [ecx+edx], 0
	je	SHORT $L1497
	mov	edx, DWORD PTR _tab$[ebp]
	mov	eax, DWORD PTR _i$[ebp]
	imul	eax, DWORD PTR [edx+12]
	mov	ecx, DWORD PTR _col$[ebp]
	add	ecx, eax
	shl	ecx, 6
	mov	edx, DWORD PTR _tab$[ebp]
	mov	eax, DWORD PTR [edx+16]
	mov	ecx, DWORD PTR [eax+ecx]
	mov	DWORD PTR -16+[ebp], ecx
	jmp	SHORT $L1498
$L1497:
	mov	DWORD PTR -16+[ebp], OFFSET FLAT:$SG1440
$L1498:
	mov	edx, DWORD PTR _j$[ebp]
	shl	edx, 6
	mov	eax, DWORD PTR _cross$[ebp]
	mov	ecx, DWORD PTR [eax+16]
	cmp	DWORD PTR [ecx+edx], 0
	je	SHORT $L1499
	mov	edx, DWORD PTR _j$[ebp]
	shl	edx, 6
	mov	eax, DWORD PTR _cross$[ebp]
	mov	ecx, DWORD PTR [eax+16]
	mov	edx, DWORD PTR [ecx+edx]
	mov	DWORD PTR -20+[ebp], edx
	jmp	SHORT $L1500
$L1499:
	mov	DWORD PTR -20+[ebp], OFFSET FLAT:$SG1441
$L1500:
	mov	eax, DWORD PTR -16+[ebp]
	push	eax
	mov	ecx, DWORD PTR -20+[ebp]
	push	ecx
	call	_strcmp
	add	esp, 8
	test	eax, eax
	je	SHORT $L1439
	jmp	$L1438
$L1439:

; 615  : 
; 616  : 		/* Add new column if not found */
; 617  : 		if(j == cross->nbcols)

	mov	edx, DWORD PTR _cross$[ebp]
	mov	eax, DWORD PTR _j$[ebp]
	cmp	eax, DWORD PTR [edx+8]
	jne	SHORT $L1442

; 619  : 			if(dyntab_resize(cross, 0, j)) { dyntab_free(cross); return NULL; }

	mov	ecx, DWORD PTR _j$[ebp]
	push	ecx
	push	0
	mov	edx, DWORD PTR _cross$[ebp]
	push	edx
	call	_dyntab_resize
	add	esp, 12					; 0000000cH
	test	eax, eax
	je	SHORT $L1443
	mov	eax, DWORD PTR _cross$[ebp]
	push	eax
	call	_dyntab_free
	add	esp, 4
	xor	eax, eax
	jmp	$L1427
$L1443:

; 620  : 			cross->cell[j].txt = tab->cell[col + i * tab->szcols].txt;

	mov	ecx, DWORD PTR _tab$[ebp]
	mov	edx, DWORD PTR _i$[ebp]
	imul	edx, DWORD PTR [ecx+12]
	mov	eax, DWORD PTR _col$[ebp]
	add	eax, edx
	shl	eax, 6
	mov	ecx, DWORD PTR _tab$[ebp]
	mov	edx, DWORD PTR [ecx+16]
	mov	ecx, DWORD PTR _j$[ebp]
	shl	ecx, 6
	mov	esi, DWORD PTR _cross$[ebp]
	mov	esi, DWORD PTR [esi+16]
	mov	edx, DWORD PTR [edx+eax]
	mov	DWORD PTR [esi+ecx], edx
$L1442:

; 622  : 
; 623  : 		/* Search for row value in column row */
; 624  : 		for(k = 1; k < cross->nbrows &&
; 625  : 			STRCMPNUL(cross->cell[k * cross->szcols].txt, tab->cell[row + i * tab->szcols].txt); k++);

	mov	DWORD PTR _k$[ebp], 1
	jmp	SHORT $L1445
$L1446:
	mov	eax, DWORD PTR _k$[ebp]
	add	eax, 1
	mov	DWORD PTR _k$[ebp], eax
$L1445:
	mov	ecx, DWORD PTR _cross$[ebp]
	mov	edx, DWORD PTR _k$[ebp]
	cmp	edx, DWORD PTR [ecx]
	jae	$L1447
	mov	eax, DWORD PTR _tab$[ebp]
	mov	ecx, DWORD PTR _i$[ebp]
	imul	ecx, DWORD PTR [eax+12]
	mov	edx, DWORD PTR _row$[ebp]
	add	edx, ecx
	shl	edx, 6
	mov	eax, DWORD PTR _tab$[ebp]
	mov	ecx, DWORD PTR [eax+16]
	cmp	DWORD PTR [ecx+edx], 0
	je	SHORT $L1501
	mov	edx, DWORD PTR _tab$[ebp]
	mov	eax, DWORD PTR _i$[ebp]
	imul	eax, DWORD PTR [edx+12]
	mov	ecx, DWORD PTR _row$[ebp]
	add	ecx, eax
	shl	ecx, 6
	mov	edx, DWORD PTR _tab$[ebp]
	mov	eax, DWORD PTR [edx+16]
	mov	ecx, DWORD PTR [eax+ecx]
	mov	DWORD PTR -24+[ebp], ecx
	jmp	SHORT $L1502
$L1501:
	mov	DWORD PTR -24+[ebp], OFFSET FLAT:$SG1448
$L1502:
	mov	edx, DWORD PTR _cross$[ebp]
	mov	eax, DWORD PTR _k$[ebp]
	imul	eax, DWORD PTR [edx+12]
	shl	eax, 6
	mov	ecx, DWORD PTR _cross$[ebp]
	mov	edx, DWORD PTR [ecx+16]
	cmp	DWORD PTR [edx+eax], 0
	je	SHORT $L1503
	mov	eax, DWORD PTR _cross$[ebp]
	mov	ecx, DWORD PTR _k$[ebp]
	imul	ecx, DWORD PTR [eax+12]
	shl	ecx, 6
	mov	edx, DWORD PTR _cross$[ebp]
	mov	eax, DWORD PTR [edx+16]
	mov	ecx, DWORD PTR [eax+ecx]
	mov	DWORD PTR -28+[ebp], ecx
	jmp	SHORT $L1504
$L1503:
	mov	DWORD PTR -28+[ebp], OFFSET FLAT:$SG1449
$L1504:
	mov	edx, DWORD PTR -24+[ebp]
	push	edx
	mov	eax, DWORD PTR -28+[ebp]
	push	eax
	call	_strcmp
	add	esp, 8
	test	eax, eax
	je	SHORT $L1447
	jmp	$L1446
$L1447:

; 626  : 
; 627  : 		/* Add new line if not found */
; 628  : 		if(k == cross->nbrows)

	mov	ecx, DWORD PTR _cross$[ebp]
	mov	edx, DWORD PTR _k$[ebp]
	cmp	edx, DWORD PTR [ecx]
	jne	SHORT $L1450

; 630  : 			if(dyntab_resize(cross, k, 0)) { dyntab_free(cross); return NULL; }

	push	0
	mov	eax, DWORD PTR _k$[ebp]
	push	eax
	mov	ecx, DWORD PTR _cross$[ebp]
	push	ecx
	call	_dyntab_resize
	add	esp, 12					; 0000000cH
	test	eax, eax
	je	SHORT $L1451
	mov	edx, DWORD PTR _cross$[ebp]
	push	edx
	call	_dyntab_free
	add	esp, 4
	xor	eax, eax
	jmp	$L1427
$L1451:

; 631  : 			cross->cell[k * cross->szcols].txt = tab->cell[row + i * tab->szcols].txt;

	mov	eax, DWORD PTR _tab$[ebp]
	mov	ecx, DWORD PTR _i$[ebp]
	imul	ecx, DWORD PTR [eax+12]
	mov	edx, DWORD PTR _row$[ebp]
	add	edx, ecx
	shl	edx, 6
	mov	eax, DWORD PTR _tab$[ebp]
	mov	ecx, DWORD PTR [eax+16]
	mov	eax, DWORD PTR _cross$[ebp]
	mov	esi, DWORD PTR _k$[ebp]
	imul	esi, DWORD PTR [eax+12]
	shl	esi, 6
	mov	eax, DWORD PTR _cross$[ebp]
	mov	eax, DWORD PTR [eax+16]
	mov	ecx, DWORD PTR [ecx+edx]
	mov	DWORD PTR [eax+esi], ecx
$L1450:

; 633  : 
; 634  : 		/* Set text & count */
; 635  : 		cross->cell[j + k * cross->szcols].txt = tab->cell[val + i * tab->szcols].txt;

	mov	edx, DWORD PTR _tab$[ebp]
	mov	eax, DWORD PTR _i$[ebp]
	imul	eax, DWORD PTR [edx+12]
	mov	ecx, DWORD PTR _val$[ebp]
	add	ecx, eax
	shl	ecx, 6
	mov	edx, DWORD PTR _tab$[ebp]
	mov	eax, DWORD PTR [edx+16]
	mov	edx, DWORD PTR _cross$[ebp]
	mov	esi, DWORD PTR _k$[ebp]
	imul	esi, DWORD PTR [edx+12]
	mov	edx, DWORD PTR _j$[ebp]
	add	edx, esi
	shl	edx, 6
	mov	esi, DWORD PTR _cross$[ebp]
	mov	esi, DWORD PTR [esi+16]
	mov	eax, DWORD PTR [eax+ecx]
	mov	DWORD PTR [esi+edx], eax

; 636  : 		cross->cell[j + k * cross->szcols].len = tab->cell[val + i * tab->szcols].len;

	mov	ecx, DWORD PTR _tab$[ebp]
	mov	edx, DWORD PTR _i$[ebp]
	imul	edx, DWORD PTR [ecx+12]
	mov	eax, DWORD PTR _val$[ebp]
	add	eax, edx
	shl	eax, 6
	mov	ecx, DWORD PTR _tab$[ebp]
	mov	edx, DWORD PTR [ecx+16]
	mov	ecx, DWORD PTR _cross$[ebp]
	mov	esi, DWORD PTR _k$[ebp]
	imul	esi, DWORD PTR [ecx+12]
	mov	ecx, DWORD PTR _j$[ebp]
	add	ecx, esi
	shl	ecx, 6
	mov	esi, DWORD PTR _cross$[ebp]
	mov	esi, DWORD PTR [esi+16]
	mov	edx, DWORD PTR [edx+eax+4]
	mov	DWORD PTR [esi+ecx+4], edx

; 637  : 	}

	jmp	$L1435
$L1436:

; 638  : 
; 639  : 	return cross;

	mov	eax, DWORD PTR _cross$[ebp]
$L1427:

; 640  : }

	pop	esi
	mov	esp, ebp
	pop	ebp
	ret	0
_dyntab_transform ENDP
_TEXT	ENDS
END
