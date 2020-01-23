	TITLE	D:\Travail\ABI\EVA\V4.0\CGI\Brunix-2016\table_export.c
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
PUBLIC	_table_free
EXTRN	_dyntab_free:NEAR
_TEXT	SEGMENT
_tbl$ = 8
_table_free PROC NEAR

; 22   : {

	push	ebp
	mov	ebp, esp

; 23   : 	DYNTAB_FREE(tbl->cgiinput);

	mov	eax, DWORD PTR _tbl$[ebp]
	add	eax, 80					; 00000050H
	push	eax
	call	_dyntab_free
	add	esp, 4

; 24   : 	DYNTAB_FREE(tbl->srchwords);

	mov	ecx, DWORD PTR _tbl$[ebp]
	add	ecx, 104				; 00000068H
	push	ecx
	call	_dyntab_free
	add	esp, 4

; 25   : 	DYNTAB_FREE(tbl->bgcol);

	mov	edx, DWORD PTR _tbl$[ebp]
	add	edx, 140				; 0000008cH
	push	edx
	call	_dyntab_free
	add	esp, 4

; 26   : 	DYNTAB_FREE(tbl->bgimg);

	mov	eax, DWORD PTR _tbl$[ebp]
	add	eax, 160				; 000000a0H
	push	eax
	call	_dyntab_free
	add	esp, 4

; 27   : 	DYNTAB_FREE(tbl->idobj);

	mov	ecx, DWORD PTR _tbl$[ebp]
	add	ecx, 184				; 000000b8H
	push	ecx
	call	_dyntab_free
	add	esp, 4

; 28   : 	DYNTAB_FREE(tbl->data);

	mov	edx, DWORD PTR _tbl$[ebp]
	add	edx, 220				; 000000dcH
	push	edx
	call	_dyntab_free
	add	esp, 4

; 29   : 	DYNTAB_FREE(tbl->cellval);

	mov	eax, DWORD PTR _tbl$[ebp]
	add	eax, 240				; 000000f0H
	push	eax
	call	_dyntab_free
	add	esp, 4

; 30   : 	DYNTAB_FREE(tbl->altfilter);

	mov	ecx, DWORD PTR _tbl$[ebp]
	add	ecx, 260				; 00000104H
	push	ecx
	call	_dyntab_free
	add	esp, 4

; 31   : 	DYNTAB_FREE(tbl->typfilter);

	mov	edx, DWORD PTR _tbl$[ebp]
	add	edx, 280				; 00000118H
	push	edx
	call	_dyntab_free
	add	esp, 4

; 32   : 	DYNTAB_FREE(tbl->condfilter);

	mov	eax, DWORD PTR _tbl$[ebp]
	add	eax, 300				; 0000012cH
	push	eax
	call	_dyntab_free
	add	esp, 4

; 33   : 	DYNTAB_FREE(tbl->groupfilter);

	mov	ecx, DWORD PTR _tbl$[ebp]
	add	ecx, 320				; 00000140H
	push	ecx
	call	_dyntab_free
	add	esp, 4

; 34   : 	DYNTAB_FREE(tbl->selfilter);

	mov	edx, DWORD PTR _tbl$[ebp]
	add	edx, 340				; 00000154H
	push	edx
	call	_dyntab_free
	add	esp, 4

; 35   : 	DYNTAB_FREE(tbl->label);

	mov	eax, DWORD PTR _tbl$[ebp]
	add	eax, 360				; 00000168H
	push	eax
	call	_dyntab_free
	add	esp, 4

; 36   : 	DYNTAB_FREE(tbl->field);

	mov	ecx, DWORD PTR _tbl$[ebp]
	add	ecx, 380				; 0000017cH
	push	ecx
	call	_dyntab_free
	add	esp, 4

; 37   : 	DYNTAB_FREE(tbl->format);

	mov	edx, DWORD PTR _tbl$[ebp]
	add	edx, 400				; 00000190H
	push	edx
	call	_dyntab_free
	add	esp, 4

; 38   : 	DYNTAB_FREE(tbl->notes);

	mov	eax, DWORD PTR _tbl$[ebp]
	add	eax, 580				; 00000244H
	push	eax
	call	_dyntab_free
	add	esp, 4

; 39   : 	DYNTAB_FREE(tbl->fontsize);

	mov	ecx, DWORD PTR _tbl$[ebp]
	add	ecx, 420				; 000001a4H
	push	ecx
	call	_dyntab_free
	add	esp, 4

; 40   : 	DYNTAB_FREE(tbl->align);

	mov	edx, DWORD PTR _tbl$[ebp]
	add	edx, 440				; 000001b8H
	push	edx
	call	_dyntab_free
	add	esp, 4

; 41   : 	DYNTAB_FREE(tbl->bold);

	mov	eax, DWORD PTR _tbl$[ebp]
	add	eax, 460				; 000001ccH
	push	eax
	call	_dyntab_free
	add	esp, 4

; 42   : 	DYNTAB_FREE(tbl->underline);

	mov	ecx, DWORD PTR _tbl$[ebp]
	add	ecx, 480				; 000001e0H
	push	ecx
	call	_dyntab_free
	add	esp, 4

; 43   : 	DYNTAB_FREE(tbl->strip);

	mov	edx, DWORD PTR _tbl$[ebp]
	add	edx, 500				; 000001f4H
	push	edx
	call	_dyntab_free
	add	esp, 4

; 44   : 	DYNTAB_FREE(tbl->lblstyle);

	mov	eax, DWORD PTR _tbl$[ebp]
	add	eax, 540				; 0000021cH
	push	eax
	call	_dyntab_free
	add	esp, 4

; 45   : 	DYNTAB_FREE(tbl->celstyle);

	mov	ecx, DWORD PTR _tbl$[ebp]
	add	ecx, 560				; 00000230H
	push	ecx
	call	_dyntab_free
	add	esp, 4

; 46   : 	DYNTAB_FREE(tbl->notable);

	mov	edx, DWORD PTR _tbl$[ebp]
	add	edx, 620				; 0000026cH
	push	edx
	call	_dyntab_free
	add	esp, 4

; 47   : 	DYNTAB_FREE(tbl->distinctval);

	mov	eax, DWORD PTR _tbl$[ebp]
	add	eax, 520				; 00000208H
	push	eax
	call	_dyntab_free
	add	esp, 4

; 48   : 	DYNTAB_FREE(tbl->lblunit);

	mov	ecx, DWORD PTR _tbl$[ebp]
	add	ecx, 640				; 00000280H
	push	ecx
	call	_dyntab_free
	add	esp, 4

; 49   : 	DYNTAB_FREE(tbl->debug);

	mov	edx, DWORD PTR _tbl$[ebp]
	add	edx, 600				; 00000258H
	push	edx
	call	_dyntab_free
	add	esp, 4

; 50   : }

	pop	ebp
	ret	0
_table_free ENDP
_TEXT	ENDS
PUBLIC	_table_insert_fieldlist
EXTRN	_ctrl_eval_fieldexpr:NEAR
EXTRN	_qry_add_table_col:NEAR
EXTRN	_dyntab_sz:NEAR
EXTRN	_dyntab_val:NEAR
EXTRN	_dyntab_cell:NEAR
EXTRN	_dyntab_copy:NEAR
EXTRN	_err_add_context:NEAR
EXTRN	_err_clear:NEAR
EXTRN	_dyntab_del_rows:NEAR
EXTRN	_dyntab_ins_rows:NEAR
_DATA	SEGMENT
$SG70223 DB	'D:\Travail\ABI\EVA\V4.0\CGI\Brunix-2016\table_export.c', 00H
	ORG $+1
$SG70224 DB	'table_insert_fieldlist', 00H
	ORG $+1
$SG70227 DB	'_EVA_LABEL', 00H
	ORG $+1
$SG70228 DB	'_EVA_FIELD', 00H
	ORG $+1
$SG70229 DB	'_EVA_TYPE', 00H
	ORG $+2
$SG70246 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70249 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70252 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70255 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70258 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70261 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70264 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70270 DB	'D:\Travail\ABI\EVA\V4.0\CGI\Brunix-2016\table_export.c', 00H
	ORG $+1
$SG70271 DB	'table_insert_fieldlist', 00H
	ORG $+1
$SG70273 DB	'D:\Travail\ABI\EVA\V4.0\CGI\Brunix-2016\table_export.c', 00H
	ORG $+1
$SG70274 DB	'table_insert_fieldlist', 00H
_DATA	ENDS
_TEXT	SEGMENT
_cntxt$ = 8
_i_ctrl$ = 12
_ifld$ = 16
_offset$ = 20
_form$ = -4
_ctrl$ = -36
_tbl$ = -8
_fldlst$ = -32
_i$ = -12
_tab$70239 = -40
_tab$70268 = -44
_table_insert_fieldlist PROC NEAR

; 63   : ){

	push	ebp
	mov	ebp, esp
	sub	esp, 48					; 00000030H

; 64   : 	EVA_form *form = cntxt->form;

	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	ecx, DWORD PTR [eax+80]
	mov	DWORD PTR _form$[ebp], ecx

; 65   : 	EVA_ctrl *ctrl = form->ctrl + i_ctrl;

	mov	edx, DWORD PTR _i_ctrl$[ebp]
	imul	edx, 480				; 000001e0H
	mov	eax, DWORD PTR _form$[ebp]
	mov	ecx, DWORD PTR [eax]
	add	ecx, edx
	mov	DWORD PTR _ctrl$[ebp], ecx

; 66   : 	ObjTableFormat *tbl = ctrl->objtbl;

	mov	edx, DWORD PTR _ctrl$[ebp]
	mov	eax, DWORD PTR [edx+232]
	mov	DWORD PTR _tbl$[ebp], eax

; 67   : 	DynTable fldlst = { 0 };

	mov	DWORD PTR _fldlst$[ebp], 0
	xor	ecx, ecx
	mov	DWORD PTR _fldlst$[ebp+4], ecx
	mov	DWORD PTR _fldlst$[ebp+8], ecx
	mov	DWORD PTR _fldlst$[ebp+12], ecx
	mov	DWORD PTR _fldlst$[ebp+16], ecx

; 68   : 	unsigned long i;
; 69   : 
; 70   : 	/* Read inserted fields list */
; 71   : 	*offset = -1;

	mov	edx, DWORD PTR _offset$[ebp]
	mov	DWORD PTR [edx], -1

; 72   : 	if(ctrl_eval_fieldexpr(cntxt, ctrl, &fldlst, dyntab_val(&tbl->field, ifld, 0))) CLEAR_ERROR;

	push	0
	mov	eax, DWORD PTR _ifld$[ebp]
	push	eax
	mov	ecx, DWORD PTR _tbl$[ebp]
	add	ecx, 380				; 0000017cH
	push	ecx
	call	_dyntab_val
	add	esp, 12					; 0000000cH
	push	eax
	lea	edx, DWORD PTR _fldlst$[ebp]
	push	edx
	mov	eax, DWORD PTR _ctrl$[ebp]
	push	eax
	mov	ecx, DWORD PTR _cntxt$[ebp]
	push	ecx
	call	_ctrl_eval_fieldexpr
	add	esp, 16					; 00000010H
	test	eax, eax
	je	SHORT $L70222
	push	72					; 00000048H
	push	OFFSET FLAT:$SG70223
	push	OFFSET FLAT:$SG70224
	mov	edx, DWORD PTR _cntxt$[ebp]
	push	edx
	call	_err_clear
	add	esp, 16					; 00000010H
$L70222:

; 73   : 	if(qry_add_table_col(cntxt, &fldlst, add_sz_str("_EVA_LABEL")) ||
; 74   : 		qry_add_table_col(cntxt, &fldlst, add_sz_str("_EVA_FIELD")) ||
; 75   : 		qry_add_table_col(cntxt, &fldlst, add_sz_str("_EVA_TYPE"))) STACK_ERROR;

	push	10					; 0000000aH
	push	OFFSET FLAT:$SG70227
	lea	eax, DWORD PTR _fldlst$[ebp]
	push	eax
	mov	ecx, DWORD PTR _cntxt$[ebp]
	push	ecx
	call	_qry_add_table_col
	add	esp, 16					; 00000010H
	test	eax, eax
	jne	SHORT $L70226
	push	10					; 0000000aH
	push	OFFSET FLAT:$SG70228
	lea	edx, DWORD PTR _fldlst$[ebp]
	push	edx
	mov	eax, DWORD PTR _cntxt$[ebp]
	push	eax
	call	_qry_add_table_col
	add	esp, 16					; 00000010H
	test	eax, eax
	jne	SHORT $L70226
	push	9
	push	OFFSET FLAT:$SG70229
	lea	ecx, DWORD PTR _fldlst$[ebp]
	push	ecx
	mov	edx, DWORD PTR _cntxt$[ebp]
	push	edx
	call	_qry_add_table_col
	add	esp, 16					; 00000010H
	test	eax, eax
	je	SHORT $L70225
$L70226:
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 75		; 0000004bH
	jmp	$eva_err$70230
$L70225:

; 76   : 	for(i = 0; i < fldlst.nbrows; i++)

	mov	DWORD PTR _i$[ebp], 0
	jmp	SHORT $L70231
$L70232:
	mov	ecx, DWORD PTR _i$[ebp]
	add	ecx, 1
	mov	DWORD PTR _i$[ebp], ecx
$L70231:
	mov	edx, DWORD PTR _i$[ebp]
	cmp	edx, DWORD PTR _fldlst$[ebp]
	jae	SHORT $L70233

; 77   : 		if(!dyntab_sz(&fldlst, i, 1) || !dyntab_sz(&fldlst, i, 1))

	push	1
	mov	eax, DWORD PTR _i$[ebp]
	push	eax
	lea	ecx, DWORD PTR _fldlst$[ebp]
	push	ecx
	call	_dyntab_sz
	add	esp, 12					; 0000000cH
	test	eax, eax
	je	SHORT $L70235
	push	1
	mov	edx, DWORD PTR _i$[ebp]
	push	edx
	lea	eax, DWORD PTR _fldlst$[ebp]
	push	eax
	call	_dyntab_sz
	add	esp, 12					; 0000000cH
	test	eax, eax
	jne	SHORT $L70234
$L70235:

; 78   : 			dyntab_del_rows(&fldlst, i--, 1);

	push	1
	mov	ecx, DWORD PTR _i$[ebp]
	mov	DWORD PTR -48+[ebp], ecx
	mov	edx, DWORD PTR -48+[ebp]
	push	edx
	lea	eax, DWORD PTR _fldlst$[ebp]
	push	eax
	mov	ecx, DWORD PTR _i$[ebp]
	sub	ecx, 1
	mov	DWORD PTR _i$[ebp], ecx
	call	_dyntab_del_rows
	add	esp, 12					; 0000000cH
$L70234:

; 79   : 
; 80   : 	/* Insert rows in table data */
; 81   : 	for(i = 0; i < 15; i++)

	jmp	SHORT $L70232
$L70233:
	mov	DWORD PTR _i$[ebp], 0
	jmp	SHORT $L70236
$L70237:
	mov	edx, DWORD PTR _i$[ebp]
	add	edx, 1
	mov	DWORD PTR _i$[ebp], edx
$L70236:
	cmp	DWORD PTR _i$[ebp], 15			; 0000000fH
	jae	SHORT $L70238

; 83   : 		DynTable *tab = &tbl->label + i;

	mov	eax, DWORD PTR _i$[ebp]
	imul	eax, 20					; 00000014H
	mov	ecx, DWORD PTR _tbl$[ebp]
	lea	edx, DWORD PTR [ecx+eax+360]
	mov	DWORD PTR _tab$70239[ebp], edx

; 84   : 		if(dyntab_ins_rows(tab, ifld + 1, fldlst.nbrows)) STACK_ERROR;

	mov	eax, DWORD PTR _fldlst$[ebp]
	push	eax
	mov	ecx, DWORD PTR _ifld$[ebp]
	add	ecx, 1
	push	ecx
	mov	edx, DWORD PTR _tab$70239[ebp]
	push	edx
	call	_dyntab_ins_rows
	add	esp, 12					; 0000000cH
	test	eax, eax
	je	SHORT $L70240
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 84		; 00000054H
	jmp	$eva_err$70230
$L70240:

; 85   : 	}

	jmp	SHORT $L70237
$L70238:

; 86   : 
; 87   : 	/* Insert fields in table */
; 88   : 	for(i = 0; i < fldlst.nbrows; i++)

	mov	DWORD PTR _i$[ebp], 0
	jmp	SHORT $L70241
$L70242:
	mov	ecx, DWORD PTR _i$[ebp]
	add	ecx, 1
	mov	DWORD PTR _i$[ebp], ecx
$L70241:
	mov	edx, DWORD PTR _i$[ebp]
	cmp	edx, DWORD PTR _fldlst$[ebp]
	jae	$L70243

; 90   : 		DYNTAB_ADD_CELL(&tbl->label, ifld + i + 1, 0, &fldlst, i, 1);

	push	1
	push	1
	mov	eax, DWORD PTR _i$[ebp]
	push	eax
	lea	ecx, DWORD PTR _fldlst$[ebp]
	push	ecx
	call	_dyntab_cell
	add	esp, 12					; 0000000cH
	push	eax
	push	0
	mov	edx, DWORD PTR _i$[ebp]
	mov	eax, DWORD PTR _ifld$[ebp]
	lea	ecx, DWORD PTR [eax+edx+1]
	push	ecx
	mov	edx, DWORD PTR _tbl$[ebp]
	add	edx, 360				; 00000168H
	push	edx
	call	_dyntab_copy
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L70244
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29872], OFFSET FLAT:$SG70246
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 90		; 0000005aH
	jmp	$eva_err$70230
$L70244:

; 91   : 		DYNTAB_ADD_CELL(&tbl->field, ifld + i + 1, 0, &fldlst, i, 2);

	push	1
	push	2
	mov	edx, DWORD PTR _i$[ebp]
	push	edx
	lea	eax, DWORD PTR _fldlst$[ebp]
	push	eax
	call	_dyntab_cell
	add	esp, 12					; 0000000cH
	push	eax
	push	0
	mov	ecx, DWORD PTR _i$[ebp]
	mov	edx, DWORD PTR _ifld$[ebp]
	lea	eax, DWORD PTR [edx+ecx+1]
	push	eax
	mov	ecx, DWORD PTR _tbl$[ebp]
	add	ecx, 380				; 0000017cH
	push	ecx
	call	_dyntab_copy
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L70247
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29872], OFFSET FLAT:$SG70249
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 91		; 0000005bH
	jmp	$eva_err$70230
$L70247:

; 92   : 		DYNTAB_ADD_CELL(&tbl->lblstyle, ifld + i + 1, 0, &tbl->lblstyle, ifld, 0);

	push	1
	push	0
	mov	ecx, DWORD PTR _ifld$[ebp]
	push	ecx
	mov	edx, DWORD PTR _tbl$[ebp]
	add	edx, 540				; 0000021cH
	push	edx
	call	_dyntab_cell
	add	esp, 12					; 0000000cH
	push	eax
	push	0
	mov	eax, DWORD PTR _i$[ebp]
	mov	ecx, DWORD PTR _ifld$[ebp]
	lea	edx, DWORD PTR [ecx+eax+1]
	push	edx
	mov	eax, DWORD PTR _tbl$[ebp]
	add	eax, 540				; 0000021cH
	push	eax
	call	_dyntab_copy
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L70250
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29872], OFFSET FLAT:$SG70252
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 92		; 0000005cH
	jmp	$eva_err$70230
$L70250:

; 93   : 		DYNTAB_ADD_CELL(&tbl->celstyle, ifld + i + 1, 0, &tbl->celstyle, ifld, 0);

	push	1
	push	0
	mov	eax, DWORD PTR _ifld$[ebp]
	push	eax
	mov	ecx, DWORD PTR _tbl$[ebp]
	add	ecx, 560				; 00000230H
	push	ecx
	call	_dyntab_cell
	add	esp, 12					; 0000000cH
	push	eax
	push	0
	mov	edx, DWORD PTR _i$[ebp]
	mov	eax, DWORD PTR _ifld$[ebp]
	lea	ecx, DWORD PTR [eax+edx+1]
	push	ecx
	mov	edx, DWORD PTR _tbl$[ebp]
	add	edx, 560				; 00000230H
	push	edx
	call	_dyntab_copy
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L70253
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29872], OFFSET FLAT:$SG70255
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 93		; 0000005dH
	jmp	$eva_err$70230
$L70253:

; 94   : 		DYNTAB_ADD_CELL(&tbl->fontsize, ifld + i + 1, 0, &tbl->fontsize, ifld, 0);

	push	1
	push	0
	mov	edx, DWORD PTR _ifld$[ebp]
	push	edx
	mov	eax, DWORD PTR _tbl$[ebp]
	add	eax, 420				; 000001a4H
	push	eax
	call	_dyntab_cell
	add	esp, 12					; 0000000cH
	push	eax
	push	0
	mov	ecx, DWORD PTR _i$[ebp]
	mov	edx, DWORD PTR _ifld$[ebp]
	lea	eax, DWORD PTR [edx+ecx+1]
	push	eax
	mov	ecx, DWORD PTR _tbl$[ebp]
	add	ecx, 420				; 000001a4H
	push	ecx
	call	_dyntab_copy
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L70256
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29872], OFFSET FLAT:$SG70258
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 94		; 0000005eH
	jmp	$eva_err$70230
$L70256:

; 95   : 		DYNTAB_ADD_CELL(&tbl->align, ifld + i + 1, 0, &tbl->align, ifld, 0);

	push	1
	push	0
	mov	ecx, DWORD PTR _ifld$[ebp]
	push	ecx
	mov	edx, DWORD PTR _tbl$[ebp]
	add	edx, 440				; 000001b8H
	push	edx
	call	_dyntab_cell
	add	esp, 12					; 0000000cH
	push	eax
	push	0
	mov	eax, DWORD PTR _i$[ebp]
	mov	ecx, DWORD PTR _ifld$[ebp]
	lea	edx, DWORD PTR [ecx+eax+1]
	push	edx
	mov	eax, DWORD PTR _tbl$[ebp]
	add	eax, 440				; 000001b8H
	push	eax
	call	_dyntab_copy
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L70259
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29872], OFFSET FLAT:$SG70261
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 95		; 0000005fH
	jmp	$eva_err$70230
$L70259:

; 96   : 		DYNTAB_ADD_CELL(&tbl->bold, ifld + i + 1, 0, &tbl->bold, ifld, 0);

	push	1
	push	0
	mov	eax, DWORD PTR _ifld$[ebp]
	push	eax
	mov	ecx, DWORD PTR _tbl$[ebp]
	add	ecx, 460				; 000001ccH
	push	ecx
	call	_dyntab_cell
	add	esp, 12					; 0000000cH
	push	eax
	push	0
	mov	edx, DWORD PTR _i$[ebp]
	mov	eax, DWORD PTR _ifld$[ebp]
	lea	ecx, DWORD PTR [eax+edx+1]
	push	ecx
	mov	edx, DWORD PTR _tbl$[ebp]
	add	edx, 460				; 000001ccH
	push	edx
	call	_dyntab_copy
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L70262
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29872], OFFSET FLAT:$SG70264
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 96		; 00000060H
	jmp	SHORT $eva_err$70230
$L70262:

; 97   : 	}

	jmp	$L70242
$L70243:

; 98   : 
; 99   : 	/* Delete original row */
; 100  : 	for(i = 0; i < 15; i++)

	mov	DWORD PTR _i$[ebp], 0
	jmp	SHORT $L70265
$L70266:
	mov	edx, DWORD PTR _i$[ebp]
	add	edx, 1
	mov	DWORD PTR _i$[ebp], edx
$L70265:
	cmp	DWORD PTR _i$[ebp], 15			; 0000000fH
	jae	SHORT $L70267

; 102  : 		DynTable *tab = &tbl->label + i;

	mov	eax, DWORD PTR _i$[ebp]
	imul	eax, 20					; 00000014H
	mov	ecx, DWORD PTR _tbl$[ebp]
	lea	edx, DWORD PTR [ecx+eax+360]
	mov	DWORD PTR _tab$70268[ebp], edx

; 103  : 		dyntab_del_rows(tab, ifld, 1);

	push	1
	mov	eax, DWORD PTR _ifld$[ebp]
	push	eax
	mov	ecx, DWORD PTR _tab$70268[ebp]
	push	ecx
	call	_dyntab_del_rows
	add	esp, 12					; 0000000cH

; 104  : 	}

	jmp	SHORT $L70266
$L70267:

; 105  : 
; 106  : 	*offset = fldlst.nbrows - 1;

	mov	edx, DWORD PTR _fldlst$[ebp]
	sub	edx, 1
	mov	eax, DWORD PTR _offset$[ebp]
	mov	DWORD PTR [eax], edx
$eva_noerr$70269:

; 107  : 
; 108  : 	RETURN_OK_CLEANUP;

	push	0
	push	OFFSET FLAT:$SG70270
	push	OFFSET FLAT:$SG70271
	mov	ecx, DWORD PTR _cntxt$[ebp]
	push	ecx
	call	_err_clear
	add	esp, 16					; 00000010H
$eva_err$70230:
	mov	edx, DWORD PTR _cntxt$[ebp]
	cmp	DWORD PTR [edx+29872], 0
	je	SHORT $L70272
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	ecx, DWORD PTR [eax+29900]
	push	ecx
	push	OFFSET FLAT:$SG70273
	push	OFFSET FLAT:$SG70274
	mov	edx, DWORD PTR _cntxt$[ebp]
	push	edx
	call	_err_add_context
	add	esp, 16					; 00000010H
$L70272:
	lea	eax, DWORD PTR _fldlst$[ebp]
	push	eax
	call	_dyntab_free
	add	esp, 4
	mov	ecx, DWORD PTR _cntxt$[ebp]
	xor	eax, eax
	cmp	DWORD PTR [ecx+29872], 0
	setne	al

; 109  : }

	mov	esp, ebp
	pop	ebp
	ret	0
_table_insert_fieldlist ENDP
_TEXT	ENDS
PUBLIC	_table_read_control
EXTRN	_mem_free:NEAR
EXTRN	_strtoul:NEAR
EXTRN	_dynbuf_add:NEAR
EXTRN	_ctrl_read_baseobj:NEAR
EXTRN	_qry_cache_idobj_field:NEAR
EXTRN	_dyntab_add:NEAR
EXTRN	_strcmp:NEAR
EXTRN	_qry_eval_sqlexpr_var:NEAR
EXTRN	_dyntab_set_txt:NEAR
EXTRN	_dyntab_filter_field:NEAR
EXTRN	_dyntab_field_val:NEAR
EXTRN	_dyntab_field_cell:NEAR
_BSS	SEGMENT
$SG70322 DB	01H DUP (?)
	ALIGN	4

$SG70454 DB	01H DUP (?)
_BSS	ENDS
_DATA	SEGMENT
	ORG $+1
$SG70308 DB	'_EVA_CONTROL', 00H
	ORG $+3
$SG70309 DB	'_EVA_TYPE', 00H
	ORG $+2
$SG70310 DB	'_EVA_INPUT', 00H
	ORG $+1
$SG70311 DB	'_EVA_DISPLAYFORMAT', 00H
	ORG $+1
$SG70312 DB	'_EVA_FORMAT', 00H
$SG70314 DB	'_EVA_INPUT', 00H
	ORG $+1
$SG70315 DB	'_EVA_DATE', 00H
	ORG $+2
$SG70316 DB	'_EVA_NUMBER', 00H
$SG70317 DB	'_EVA_EMAIL', 00H
	ORG $+1
$SG70318 DB	'_EVA_RELATION', 00H
	ORG $+2
$SG70319 DB	'_EVA_TELEPHONE', 00H
	ORG $+1
$SG70320 DB	'_EVA_FILEUPLOAD', 00H
$SG70321 DB	'_EVA_DOCUMENT', 00H
	ORG $+2
$SG70323 DB	'_EVA_LABELPOS', 00H
	ORG $+2
$SG70325 DB	'_EVA_NONE', 00H
	ORG $+2
$SG70327 DB	'_EVA_LABEL', 00H
	ORG $+1
$SG70329 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70331 DB	'_EVA_ALIGN', 00H
	ORG $+1
$SG70333 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70335 DB	'_EVA_BOLD', 00H
	ORG $+2
$SG70337 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70339 DB	'_EVA_FONTSIZE', 00H
	ORG $+2
$SG70341 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70343 DB	'_EVA_UNDERLINE', 00H
	ORG $+1
$SG70345 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70347 DB	'_EVA_NOTES', 00H
	ORG $+1
$SG70349 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70351 DB	'_EVA_CELL_STYLE', 00H
$SG70353 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70355 DB	'_EVA_LABEL_STYLE', 00H
	ORG $+3
$SG70357 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70359 DB	'_EVA_LABELUNIT', 00H
	ORG $+1
$SG70361 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70362 DB	'_EVA_EVAL_METHOD', 00H
	ORG $+3
$SG70364 DB	'_EVA_VALUES', 00H
$SG70366 DB	'1', 00H
	ORG $+2
$SG70368 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70370 DB	'_EVA_DEBUG_SQL_EXPR', 00H
$SG70372 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70373 DB	'_EVA_MULTIPLE_HANDLER', 00H
	ORG $+2
$SG70376 DB	'_EVA_DISTINCT', 00H
	ORG $+2
$SG70377 DB	'_EVA_SPACE', 00H
	ORG $+1
$SG70379 DB	'1', 00H
	ORG $+2
$SG70381 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70383 DB	'_EVA_LINE', 00H
	ORG $+2
$SG70385 DB	'newline', 00H
$SG70387 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70390 DB	'_EVA_SPACE', 00H
	ORG $+1
$SG70392 DB	'space', 00H
	ORG $+2
$SG70394 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70397 DB	'_EVA_COMMA', 00H
	ORG $+1
$SG70399 DB	'index', 00H
	ORG $+2
$SG70401 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70402 DB	'_EVA_DISPLAY_STRIP', 00H
	ORG $+1
$SG70406 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70410 DB	'_EVA_NOBR', 00H
	ORG $+2
$SG70411 DB	'_EVA_NUMBER', 00H
$SG70412 DB	'_EVA_MONEY', 00H
	ORG $+1
$SG70414 DB	'0', 00H
	ORG $+2
$SG70416 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70418 DB	'_EVA_CTRL_VAL', 00H
	ORG $+2
$SG70422 DB	'_EVA_CTRLTREE', 00H
	ORG $+2
$SG70424 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70435 DB	',', 00H
	ORG $+2
$SG70437 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70439 DB	'_EVA_FIELD', 00H
	ORG $+1
$SG70443 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70445 DB	'_EVA_TYPE', 00H
	ORG $+2
$SG70446 DB	'_EVA_FORMAT', 00H
$SG70448 DB	'_EVA_DATE', 00H
	ORG $+2
$SG70449 DB	'_EVA_NUMBER', 00H
$SG70450 DB	'_EVA_RELATION', 00H
	ORG $+2
$SG70451 DB	'_EVA_EMAIL', 00H
	ORG $+1
$SG70452 DB	'_EVA_FILEUPLOAD', 00H
$SG70453 DB	'_EVA_DOCUMENT', 00H
	ORG $+2
$SG70459 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70465 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70468 DB	'_EVA_BUTTON', 00H
$SG70470 DB	'_EVA_CONTROL', 00H
	ORG $+3
$SG70472 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70475 DB	'_EVA_INPUT', 00H
	ORG $+1
$SG70477 DB	'_EVA_FIELD', 00H
	ORG $+1
$SG70479 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70483 DB	'_EVA_SRCFIELD', 00H
	ORG $+2
$SG70484 DB	'D:\Travail\ABI\EVA\V4.0\CGI\Brunix-2016\table_export.c', 00H
	ORG $+1
$SG70485 DB	'table_read_control', 00H
	ORG $+1
$SG70490 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70496 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70500 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70501 DB	'D:\Travail\ABI\EVA\V4.0\CGI\Brunix-2016\table_export.c', 00H
	ORG $+1
$SG70502 DB	'table_read_control', 00H
	ORG $+1
$SG70504 DB	'D:\Travail\ABI\EVA\V4.0\CGI\Brunix-2016\table_export.c', 00H
	ORG $+1
$SG70505 DB	'table_read_control', 00H
_DATA	ENDS
_TEXT	SEGMENT
_cntxt$ = 8
_id$ = 12
_tbl$ = 16
_i$ = 20
_j$ = 24
_attr$ = -64
_attr1$ = -84
_idobj$ = -32
_buf$ = -12
_typ$ = -44
_ctl$ = -40
_fmt$ = -4
_lblpos$ = -8
_hmult$ = -36
_meth$ = -92
_strip$ = -88
_k$70419 = -96
__c$70438 = -100
_table_read_control PROC NEAR

; 127  : ){

	push	ebp
	mov	ebp, esp
	sub	esp, 120				; 00000078H

; 128  : 	DynTable attr = { 0 };

	mov	DWORD PTR _attr$[ebp], 0
	xor	eax, eax
	mov	DWORD PTR _attr$[ebp+4], eax
	mov	DWORD PTR _attr$[ebp+8], eax
	mov	DWORD PTR _attr$[ebp+12], eax
	mov	DWORD PTR _attr$[ebp+16], eax

; 129  : 	DynTable attr1 = { 0 };

	mov	DWORD PTR _attr1$[ebp], 0
	xor	ecx, ecx
	mov	DWORD PTR _attr1$[ebp+4], ecx
	mov	DWORD PTR _attr1$[ebp+8], ecx
	mov	DWORD PTR _attr1$[ebp+12], ecx
	mov	DWORD PTR _attr1$[ebp+16], ecx

; 130  : 	DynTable idobj = { 0 };

	mov	DWORD PTR _idobj$[ebp], 0
	xor	edx, edx
	mov	DWORD PTR _idobj$[ebp+4], edx
	mov	DWORD PTR _idobj$[ebp+8], edx
	mov	DWORD PTR _idobj$[ebp+12], edx
	mov	DWORD PTR _idobj$[ebp+16], edx

; 131  : 	DynBuffer *buf = NULL;

	mov	DWORD PTR _buf$[ebp], 0

; 132  : 	char *typ, *ctl, *fmt, *lblpos, *hmult, *meth;
; 133  : 	DynTableCell *strip;
; 134  : 	if(!id) RETURN_OK;

	cmp	DWORD PTR _id$[ebp], 0
	jne	SHORT $L70302
	jmp	$eva_noerr$70303
$L70302:

; 135  : 
; 136  : 	/* Read control definition */
; 137  : 	if(qry_cache_idobj(&attr, id) || ctrl_read_baseobj(cntxt, &attr)) STACK_ERROR;

	push	3
	push	0
	mov	eax, DWORD PTR _id$[ebp]
	push	eax
	lea	ecx, DWORD PTR _attr$[ebp]
	push	ecx
	mov	edx, DWORD PTR _cntxt$[ebp]
	push	edx
	call	_qry_cache_idobj_field
	add	esp, 20					; 00000014H
	test	eax, eax
	jne	SHORT $L70306
	lea	eax, DWORD PTR _attr$[ebp]
	push	eax
	mov	ecx, DWORD PTR _cntxt$[ebp]
	push	ecx
	call	_ctrl_read_baseobj
	add	esp, 8
	test	eax, eax
	je	SHORT $L70305
$L70306:
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 137		; 00000089H
	jmp	$eva_err$70307
$L70305:

; 138  : 	ctl = DYNTAB_FIELD_VAL(&attr, CONTROL);

	push	0
	push	-1
	push	OFFSET FLAT:$SG70308
	lea	eax, DWORD PTR _attr$[ebp]
	push	eax
	call	_dyntab_field_val
	add	esp, 16					; 00000010H
	mov	DWORD PTR _ctl$[ebp], eax

; 139  : 
; 140  : 	/* Handle column format */
; 141  : 	typ = DYNTAB_FIELD_VAL(&attr, TYPE);

	push	0
	push	-1
	push	OFFSET FLAT:$SG70309
	lea	ecx, DWORD PTR _attr$[ebp]
	push	ecx
	call	_dyntab_field_val
	add	esp, 16					; 00000010H
	mov	DWORD PTR _typ$[ebp], eax

; 142  : 	fmt = strcmp(ctl, "_EVA_INPUT") ? DYNTAB_FIELD_VAL(&attr, DISPLAYFORMAT) : DYNTAB_FIELD_VAL(&attr, FORMAT);

	push	OFFSET FLAT:$SG70310
	mov	edx, DWORD PTR _ctl$[ebp]
	push	edx
	call	_strcmp
	add	esp, 8
	test	eax, eax
	je	SHORT $L71006
	push	0
	push	-1
	push	OFFSET FLAT:$SG70311
	lea	eax, DWORD PTR _attr$[ebp]
	push	eax
	call	_dyntab_field_val
	add	esp, 16					; 00000010H
	mov	DWORD PTR -104+[ebp], eax
	jmp	SHORT $L71007
$L71006:
	push	0
	push	-1
	push	OFFSET FLAT:$SG70312
	lea	ecx, DWORD PTR _attr$[ebp]
	push	ecx
	call	_dyntab_field_val
	add	esp, 16					; 00000010H
	mov	DWORD PTR -104+[ebp], eax
$L71007:
	mov	edx, DWORD PTR -104+[ebp]
	mov	DWORD PTR _fmt$[ebp], edx

; 143  : 	if(!*fmt && !strcmp(ctl, "_EVA_INPUT"))

	mov	eax, DWORD PTR _fmt$[ebp]
	movsx	ecx, BYTE PTR [eax]
	test	ecx, ecx
	jne	$L70313
	push	OFFSET FLAT:$SG70314
	mov	edx, DWORD PTR _ctl$[ebp]
	push	edx
	call	_strcmp
	add	esp, 8
	test	eax, eax
	jne	$L70313

; 144  : 		fmt = (!strcmp(typ, "_EVA_DATE") || !strcmp(typ, "_EVA_NUMBER") || !strcmp(typ, "_EVA_EMAIL") ||
; 145  : 				!strcmp(typ, "_EVA_RELATION") || !strcmp(typ, "_EVA_TELEPHONE")) ? typ :
; 146  : 				!strcmp(typ, "_EVA_FILEUPLOAD") ? "_EVA_DOCUMENT" : "";

	push	OFFSET FLAT:$SG70315
	mov	eax, DWORD PTR _typ$[ebp]
	push	eax
	call	_strcmp
	add	esp, 8
	test	eax, eax
	je	$L71008
	push	OFFSET FLAT:$SG70316
	mov	ecx, DWORD PTR _typ$[ebp]
	push	ecx
	call	_strcmp
	add	esp, 8
	test	eax, eax
	je	SHORT $L71008
	push	OFFSET FLAT:$SG70317
	mov	edx, DWORD PTR _typ$[ebp]
	push	edx
	call	_strcmp
	add	esp, 8
	test	eax, eax
	je	SHORT $L71008
	push	OFFSET FLAT:$SG70318
	mov	eax, DWORD PTR _typ$[ebp]
	push	eax
	call	_strcmp
	add	esp, 8
	test	eax, eax
	je	SHORT $L71008
	push	OFFSET FLAT:$SG70319
	mov	ecx, DWORD PTR _typ$[ebp]
	push	ecx
	call	_strcmp
	add	esp, 8
	test	eax, eax
	je	SHORT $L71008
	push	OFFSET FLAT:$SG70320
	mov	edx, DWORD PTR _typ$[ebp]
	push	edx
	call	_strcmp
	add	esp, 8
	test	eax, eax
	jne	SHORT $L71009
	mov	DWORD PTR -108+[ebp], OFFSET FLAT:$SG70321
	jmp	SHORT $L71010
$L71009:
	mov	DWORD PTR -108+[ebp], OFFSET FLAT:$SG70322
$L71010:
	mov	eax, DWORD PTR -108+[ebp]
	mov	DWORD PTR -112+[ebp], eax
	jmp	SHORT $L71011
$L71008:
	mov	ecx, DWORD PTR _typ$[ebp]
	mov	DWORD PTR -112+[ebp], ecx
$L71011:
	mov	edx, DWORD PTR -112+[ebp]
	mov	DWORD PTR _fmt$[ebp], edx
$L70313:

; 147  : 
; 148  : 	/*  Handle other column attributes */
; 149  : 	lblpos = DYNTAB_FIELD_VAL(&attr, LABELPOS);

	push	0
	push	-1
	push	OFFSET FLAT:$SG70323
	lea	eax, DWORD PTR _attr$[ebp]
	push	eax
	call	_dyntab_field_val
	add	esp, 16					; 00000010H
	mov	DWORD PTR _lblpos$[ebp], eax

; 150  : 	if(strcmp(lblpos, "_EVA_NONE")) DYNTAB_ADD_CELLP(&tbl->label, i, j, DYNTAB_FIELD_CELL(&attr, LABEL));

	push	OFFSET FLAT:$SG70325
	mov	ecx, DWORD PTR _lblpos$[ebp]
	push	ecx
	call	_strcmp
	add	esp, 8
	test	eax, eax
	je	SHORT $L70326
	push	1
	push	0
	push	-1
	push	OFFSET FLAT:$SG70327
	lea	edx, DWORD PTR _attr$[ebp]
	push	edx
	call	_dyntab_field_cell
	add	esp, 16					; 00000010H
	push	eax
	mov	eax, DWORD PTR _j$[ebp]
	push	eax
	mov	ecx, DWORD PTR _i$[ebp]
	push	ecx
	mov	edx, DWORD PTR _tbl$[ebp]
	add	edx, 360				; 00000168H
	push	edx
	call	_dyntab_copy
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L70326
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29872], OFFSET FLAT:$SG70329
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 150		; 00000096H
	jmp	$eva_err$70307
$L70326:

; 151  : 	DYNTAB_ADD_CELLP(&tbl->align, i, j, DYNTAB_FIELD_CELL(&attr, ALIGN));

	push	1
	push	0
	push	-1
	push	OFFSET FLAT:$SG70331
	lea	edx, DWORD PTR _attr$[ebp]
	push	edx
	call	_dyntab_field_cell
	add	esp, 16					; 00000010H
	push	eax
	mov	eax, DWORD PTR _j$[ebp]
	push	eax
	mov	ecx, DWORD PTR _i$[ebp]
	push	ecx
	mov	edx, DWORD PTR _tbl$[ebp]
	add	edx, 440				; 000001b8H
	push	edx
	call	_dyntab_copy
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L70330
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29872], OFFSET FLAT:$SG70333
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 151		; 00000097H
	jmp	$eva_err$70307
$L70330:

; 152  : 	DYNTAB_ADD_CELLP(&tbl->bold, i, j, DYNTAB_FIELD_CELL(&attr, BOLD));

	push	1
	push	0
	push	-1
	push	OFFSET FLAT:$SG70335
	lea	edx, DWORD PTR _attr$[ebp]
	push	edx
	call	_dyntab_field_cell
	add	esp, 16					; 00000010H
	push	eax
	mov	eax, DWORD PTR _j$[ebp]
	push	eax
	mov	ecx, DWORD PTR _i$[ebp]
	push	ecx
	mov	edx, DWORD PTR _tbl$[ebp]
	add	edx, 460				; 000001ccH
	push	edx
	call	_dyntab_copy
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L70334
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29872], OFFSET FLAT:$SG70337
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 152		; 00000098H
	jmp	$eva_err$70307
$L70334:

; 153  : 	DYNTAB_ADD_CELLP(&tbl->fontsize, i, j, DYNTAB_FIELD_CELL(&attr, FONTSIZE));

	push	1
	push	0
	push	-1
	push	OFFSET FLAT:$SG70339
	lea	edx, DWORD PTR _attr$[ebp]
	push	edx
	call	_dyntab_field_cell
	add	esp, 16					; 00000010H
	push	eax
	mov	eax, DWORD PTR _j$[ebp]
	push	eax
	mov	ecx, DWORD PTR _i$[ebp]
	push	ecx
	mov	edx, DWORD PTR _tbl$[ebp]
	add	edx, 420				; 000001a4H
	push	edx
	call	_dyntab_copy
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L70338
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29872], OFFSET FLAT:$SG70341
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 153		; 00000099H
	jmp	$eva_err$70307
$L70338:

; 154  : 	DYNTAB_ADD_CELLP(&tbl->underline, i, j, DYNTAB_FIELD_CELL(&attr, UNDERLINE));

	push	1
	push	0
	push	-1
	push	OFFSET FLAT:$SG70343
	lea	edx, DWORD PTR _attr$[ebp]
	push	edx
	call	_dyntab_field_cell
	add	esp, 16					; 00000010H
	push	eax
	mov	eax, DWORD PTR _j$[ebp]
	push	eax
	mov	ecx, DWORD PTR _i$[ebp]
	push	ecx
	mov	edx, DWORD PTR _tbl$[ebp]
	add	edx, 480				; 000001e0H
	push	edx
	call	_dyntab_copy
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L70342
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29872], OFFSET FLAT:$SG70345
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 154		; 0000009aH
	jmp	$eva_err$70307
$L70342:

; 155  : 	DYNTAB_ADD_CELLP(&tbl->notes, i, j, DYNTAB_FIELD_CELL(&attr, NOTES));

	push	1
	push	0
	push	-1
	push	OFFSET FLAT:$SG70347
	lea	edx, DWORD PTR _attr$[ebp]
	push	edx
	call	_dyntab_field_cell
	add	esp, 16					; 00000010H
	push	eax
	mov	eax, DWORD PTR _j$[ebp]
	push	eax
	mov	ecx, DWORD PTR _i$[ebp]
	push	ecx
	mov	edx, DWORD PTR _tbl$[ebp]
	add	edx, 580				; 00000244H
	push	edx
	call	_dyntab_copy
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L70346
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29872], OFFSET FLAT:$SG70349
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 155		; 0000009bH
	jmp	$eva_err$70307
$L70346:

; 156  : 	DYNTAB_ADD_CELLP(&tbl->celstyle, i, j, DYNTAB_FIELD_CELL(&attr, CELL_STYLE));

	push	1
	push	0
	push	-1
	push	OFFSET FLAT:$SG70351
	lea	edx, DWORD PTR _attr$[ebp]
	push	edx
	call	_dyntab_field_cell
	add	esp, 16					; 00000010H
	push	eax
	mov	eax, DWORD PTR _j$[ebp]
	push	eax
	mov	ecx, DWORD PTR _i$[ebp]
	push	ecx
	mov	edx, DWORD PTR _tbl$[ebp]
	add	edx, 560				; 00000230H
	push	edx
	call	_dyntab_copy
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L70350
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29872], OFFSET FLAT:$SG70353
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 156		; 0000009cH
	jmp	$eva_err$70307
$L70350:

; 157  : 	DYNTAB_ADD_CELLP(&tbl->lblstyle, i, j, DYNTAB_FIELD_CELL(&attr, LABEL_STYLE));

	push	1
	push	0
	push	-1
	push	OFFSET FLAT:$SG70355
	lea	edx, DWORD PTR _attr$[ebp]
	push	edx
	call	_dyntab_field_cell
	add	esp, 16					; 00000010H
	push	eax
	mov	eax, DWORD PTR _j$[ebp]
	push	eax
	mov	ecx, DWORD PTR _i$[ebp]
	push	ecx
	mov	edx, DWORD PTR _tbl$[ebp]
	add	edx, 540				; 0000021cH
	push	edx
	call	_dyntab_copy
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L70354
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29872], OFFSET FLAT:$SG70357
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 157		; 0000009dH
	jmp	$eva_err$70307
$L70354:

; 158  : 	DYNTAB_ADD_CELLP(&tbl->lblunit, i, j, DYNTAB_FIELD_CELL(&attr, LABELUNIT));

	push	1
	push	0
	push	-1
	push	OFFSET FLAT:$SG70359
	lea	edx, DWORD PTR _attr$[ebp]
	push	edx
	call	_dyntab_field_cell
	add	esp, 16					; 00000010H
	push	eax
	mov	eax, DWORD PTR _j$[ebp]
	push	eax
	mov	ecx, DWORD PTR _i$[ebp]
	push	ecx
	mov	edx, DWORD PTR _tbl$[ebp]
	add	edx, 640				; 00000280H
	push	edx
	call	_dyntab_copy
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L70358
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29872], OFFSET FLAT:$SG70361
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 158		; 0000009eH
	jmp	$eva_err$70307
$L70358:

; 159  : 	meth = DYNTAB_FIELD_VAL(&attr, EVAL_METHOD);

	push	0
	push	-1
	push	OFFSET FLAT:$SG70362
	lea	edx, DWORD PTR _attr$[ebp]
	push	edx
	call	_dyntab_field_val
	add	esp, 16					; 00000010H
	mov	DWORD PTR _meth$[ebp], eax

; 160  : 	if(!strcmp(meth, "_EVA_VALUES")) DYNTAB_ADD_STR(&tbl->notable, i, j, "1");

	push	OFFSET FLAT:$SG70364
	mov	eax, DWORD PTR _meth$[ebp]
	push	eax
	call	_strcmp
	add	esp, 8
	test	eax, eax
	jne	SHORT $L70365
	push	1
	push	OFFSET FLAT:$SG70366
	mov	ecx, DWORD PTR _j$[ebp]
	push	ecx
	mov	edx, DWORD PTR _i$[ebp]
	push	edx
	mov	eax, DWORD PTR _tbl$[ebp]
	add	eax, 620				; 0000026cH
	push	eax
	call	_dyntab_set_txt
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L70365
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29872], OFFSET FLAT:$SG70368
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 160		; 000000a0H
	jmp	$eva_err$70307
$L70365:

; 161  : 	DYNTAB_ADD_CELLP(&tbl->debug, i, j, DYNTAB_FIELD_CELL(&attr, DEBUG_SQL_EXPR));

	push	1
	push	0
	push	-1
	push	OFFSET FLAT:$SG70370
	lea	eax, DWORD PTR _attr$[ebp]
	push	eax
	call	_dyntab_field_cell
	add	esp, 16					; 00000010H
	push	eax
	mov	ecx, DWORD PTR _j$[ebp]
	push	ecx
	mov	edx, DWORD PTR _i$[ebp]
	push	edx
	mov	eax, DWORD PTR _tbl$[ebp]
	add	eax, 600				; 00000258H
	push	eax
	call	_dyntab_copy
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L70369
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29872], OFFSET FLAT:$SG70372
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 161		; 000000a1H
	jmp	$eva_err$70307
$L70369:

; 162  : 	hmult = DYNTAB_FIELD_VAL(&attr, MULTIPLE_HANDLER);

	push	0
	push	-1
	push	OFFSET FLAT:$SG70373
	lea	eax, DWORD PTR _attr$[ebp]
	push	eax
	call	_dyntab_field_val
	add	esp, 16					; 00000010H
	mov	DWORD PTR _hmult$[ebp], eax

; 163  : 	if(!strcmp(hmult, "_EVA_DISTINCT") || !strcmp(hmult, "_EVA_SPACE")) DYNTAB_ADD_STR(&tbl->distinctval, i, j, "1");

	push	OFFSET FLAT:$SG70376
	mov	ecx, DWORD PTR _hmult$[ebp]
	push	ecx
	call	_strcmp
	add	esp, 8
	test	eax, eax
	je	SHORT $L70375
	push	OFFSET FLAT:$SG70377
	mov	edx, DWORD PTR _hmult$[ebp]
	push	edx
	call	_strcmp
	add	esp, 8
	test	eax, eax
	jne	SHORT $L70378
$L70375:
	push	1
	push	OFFSET FLAT:$SG70379
	mov	eax, DWORD PTR _j$[ebp]
	push	eax
	mov	ecx, DWORD PTR _i$[ebp]
	push	ecx
	mov	edx, DWORD PTR _tbl$[ebp]
	add	edx, 520				; 00000208H
	push	edx
	call	_dyntab_set_txt
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L70378
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29872], OFFSET FLAT:$SG70381
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 163		; 000000a3H
	jmp	$eva_err$70307
$L70378:

; 164  : 	if(!strcmp(hmult, "_EVA_LINE")) DYNTAB_ADD_STR(&tbl->align, i, j, "newline")

	push	OFFSET FLAT:$SG70383
	mov	edx, DWORD PTR _hmult$[ebp]
	push	edx
	call	_strcmp
	add	esp, 8
	test	eax, eax
	jne	SHORT $L70382
	push	7
	push	OFFSET FLAT:$SG70385
	mov	eax, DWORD PTR _j$[ebp]
	push	eax
	mov	ecx, DWORD PTR _i$[ebp]
	push	ecx
	mov	edx, DWORD PTR _tbl$[ebp]
	add	edx, 440				; 000001b8H
	push	edx
	call	_dyntab_set_txt
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L70384
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29872], OFFSET FLAT:$SG70387
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 164		; 000000a4H
	jmp	$eva_err$70307
$L70384:

; 165  : 	else if(!strcmp(hmult, "_EVA_SPACE")) DYNTAB_ADD_STR(&tbl->align, i, j, "space")

	jmp	$L70398
$L70382:
	push	OFFSET FLAT:$SG70390
	mov	edx, DWORD PTR _hmult$[ebp]
	push	edx
	call	_strcmp
	add	esp, 8
	test	eax, eax
	jne	SHORT $L70389
	push	5
	push	OFFSET FLAT:$SG70392
	mov	eax, DWORD PTR _j$[ebp]
	push	eax
	mov	ecx, DWORD PTR _i$[ebp]
	push	ecx
	mov	edx, DWORD PTR _tbl$[ebp]
	add	edx, 440				; 000001b8H
	push	edx
	call	_dyntab_set_txt
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L70391
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29872], OFFSET FLAT:$SG70394
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 165		; 000000a5H
	jmp	$eva_err$70307
$L70391:

; 166  : 	else if(!strcmp(hmult, "_EVA_COMMA")) DYNTAB_ADD_STR(&tbl->align, i, j, "index");

	jmp	SHORT $L70398
$L70389:
	push	OFFSET FLAT:$SG70397
	mov	edx, DWORD PTR _hmult$[ebp]
	push	edx
	call	_strcmp
	add	esp, 8
	test	eax, eax
	jne	SHORT $L70398
	push	5
	push	OFFSET FLAT:$SG70399
	mov	eax, DWORD PTR _j$[ebp]
	push	eax
	mov	ecx, DWORD PTR _i$[ebp]
	push	ecx
	mov	edx, DWORD PTR _tbl$[ebp]
	add	edx, 440				; 000001b8H
	push	edx
	call	_dyntab_set_txt
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L70398
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29872], OFFSET FLAT:$SG70401
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 166		; 000000a6H
	jmp	$eva_err$70307
$L70398:

; 167  : 
; 168  : 	/* Handle stripping */
; 169  : 	strip = DYNTAB_FIELD_CELL(&attr, DISPLAY_STRIP);

	push	0
	push	-1
	push	OFFSET FLAT:$SG70402
	lea	edx, DWORD PTR _attr$[ebp]
	push	edx
	call	_dyntab_field_cell
	add	esp, 16					; 00000010H
	mov	DWORD PTR _strip$[ebp], eax

; 170  : 	if(strip)

	cmp	DWORD PTR _strip$[ebp], 0
	je	SHORT $L70403

; 172  : 		DYNTAB_ADD_CELLP(&tbl->strip, i, j, strip);

	push	1
	mov	eax, DWORD PTR _strip$[ebp]
	push	eax
	mov	ecx, DWORD PTR _j$[ebp]
	push	ecx
	mov	edx, DWORD PTR _i$[ebp]
	push	edx
	mov	eax, DWORD PTR _tbl$[ebp]
	add	eax, 500				; 000001f4H
	push	eax
	call	_dyntab_copy
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L70404
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29872], OFFSET FLAT:$SG70406
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 172		; 000000acH
	jmp	$eva_err$70307
$L70404:

; 174  : 	else if(*DYNTAB_FIELD_VAL(&attr, NOBR) == '1' || !strcmp(fmt, "_EVA_NUMBER") || !strcmp(fmt, "_EVA_MONEY"))

	jmp	$L70413
$L70403:
	push	0
	push	-1
	push	OFFSET FLAT:$SG70410
	lea	eax, DWORD PTR _attr$[ebp]
	push	eax
	call	_dyntab_field_val
	add	esp, 16					; 00000010H
	movsx	ecx, BYTE PTR [eax]
	cmp	ecx, 49					; 00000031H
	je	SHORT $L70409
	push	OFFSET FLAT:$SG70411
	mov	edx, DWORD PTR _fmt$[ebp]
	push	edx
	call	_strcmp
	add	esp, 8
	test	eax, eax
	je	SHORT $L70409
	push	OFFSET FLAT:$SG70412
	mov	eax, DWORD PTR _fmt$[ebp]
	push	eax
	call	_strcmp
	add	esp, 8
	test	eax, eax
	jne	SHORT $L70413
$L70409:

; 175  : 		DYNTAB_ADD_STR(&tbl->strip, i, j, "0");

	push	1
	push	OFFSET FLAT:$SG70414
	mov	ecx, DWORD PTR _j$[ebp]
	push	ecx
	mov	edx, DWORD PTR _i$[ebp]
	push	edx
	mov	eax, DWORD PTR _tbl$[ebp]
	add	eax, 500				; 000001f4H
	push	eax
	call	_dyntab_set_txt
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L70413
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29872], OFFSET FLAT:$SG70416
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 175		; 000000afH
	jmp	$eva_err$70307
$L70413:

; 176  : 
; 177  : 	/* Handle control type for field definition */
; 178  : 	if(!strcmp(typ, "_EVA_CTRL_VAL"))

	push	OFFSET FLAT:$SG70418
	mov	eax, DWORD PTR _typ$[ebp]
	push	eax
	call	_strcmp
	add	esp, 8
	test	eax, eax
	jne	$L70417

; 180  : 		/* Calc-ed controls values : use fields names */
; 181  : 		unsigned long k;
; 182  : 		DYNTAB_FIELD(&idobj, &attr, CTRLTREE);

	lea	ecx, DWORD PTR _idobj$[ebp]
	push	ecx
	call	_dyntab_free
	add	esp, 4
	push	0
	push	-1
	push	OFFSET FLAT:$SG70422
	lea	edx, DWORD PTR _attr$[ebp]
	push	edx
	push	0
	lea	eax, DWORD PTR _idobj$[ebp]
	push	eax
	call	_dyntab_filter_field
	add	esp, 24					; 00000018H
	test	eax, eax
	je	SHORT $L70421
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29872], OFFSET FLAT:$SG70424
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 182		; 000000b6H
	jmp	$eva_err$70307
$L70421:

; 183  : 		for(k = 0; k < idobj.nbrows; k++)

	mov	DWORD PTR _k$70419[ebp], 0
	jmp	SHORT $L70425
$L70426:
	mov	eax, DWORD PTR _k$70419[ebp]
	add	eax, 1
	mov	DWORD PTR _k$70419[ebp], eax
$L70425:
	mov	ecx, DWORD PTR _k$70419[ebp]
	cmp	ecx, DWORD PTR _idobj$[ebp]
	jae	$L70427

; 185  : 			if(qry_cache_idobj(&attr1, DYNTAB_TOULRC(&idobj, k, 0)) || ctrl_read_baseobj(cntxt, &attr1)) STACK_ERROR;

	push	3
	push	0
	push	10					; 0000000aH
	push	0
	push	0
	mov	edx, DWORD PTR _k$70419[ebp]
	push	edx
	lea	eax, DWORD PTR _idobj$[ebp]
	push	eax
	call	_dyntab_val
	add	esp, 12					; 0000000cH
	push	eax
	call	_strtoul
	add	esp, 12					; 0000000cH
	push	eax
	lea	ecx, DWORD PTR _attr1$[ebp]
	push	ecx
	mov	edx, DWORD PTR _cntxt$[ebp]
	push	edx
	call	_qry_cache_idobj_field
	add	esp, 20					; 00000014H
	test	eax, eax
	jne	SHORT $L70431
	lea	eax, DWORD PTR _attr1$[ebp]
	push	eax
	mov	ecx, DWORD PTR _cntxt$[ebp]
	push	ecx
	call	_ctrl_read_baseobj
	add	esp, 8
	test	eax, eax
	je	SHORT $L70430
$L70431:
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 185		; 000000b9H
	jmp	$eva_err$70307
$L70430:

; 186  : 			if(buf) DYNBUF_ADD_STR(&buf, ",");

	cmp	DWORD PTR _buf$[ebp], 0
	je	SHORT $L70434
	push	0
	push	0
	push	1
	push	OFFSET FLAT:$SG70435
	lea	eax, DWORD PTR _buf$[ebp]
	push	eax
	call	_dynbuf_add
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L70434
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29872], OFFSET FLAT:$SG70437
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 186		; 000000baH
	jmp	$eva_err$70307
$L70434:

; 187  : 			DYNBUF_ADD_CELLP(&buf, DYNTAB_FIELD_CELL(&attr1, FIELD), NO_CONV);

	push	0
	push	-1
	push	OFFSET FLAT:$SG70439
	lea	eax, DWORD PTR _attr1$[ebp]
	push	eax
	call	_dyntab_field_cell
	add	esp, 16					; 00000010H
	mov	DWORD PTR __c$70438[ebp], eax
	cmp	DWORD PTR __c$70438[ebp], 0
	je	SHORT $L70441
	push	0
	push	0
	mov	ecx, DWORD PTR __c$70438[ebp]
	mov	edx, DWORD PTR [ecx+4]
	push	edx
	mov	eax, DWORD PTR __c$70438[ebp]
	mov	ecx, DWORD PTR [eax]
	push	ecx
	lea	edx, DWORD PTR _buf$[ebp]
	push	edx
	call	_dynbuf_add
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L70441
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29872], OFFSET FLAT:$SG70443
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 187		; 000000bbH
	jmp	$eva_err$70307
$L70441:

; 188  : 			if(!k && !*fmt)

	cmp	DWORD PTR _k$70419[ebp], 0
	jne	$L70447
	mov	edx, DWORD PTR _fmt$[ebp]
	movsx	eax, BYTE PTR [edx]
	test	eax, eax
	jne	$L70447

; 190  : 				typ = DYNTAB_FIELD_VAL(&attr1, TYPE);

	push	0
	push	-1
	push	OFFSET FLAT:$SG70445
	lea	ecx, DWORD PTR _attr1$[ebp]
	push	ecx
	call	_dyntab_field_val
	add	esp, 16					; 00000010H
	mov	DWORD PTR _typ$[ebp], eax

; 191  : 				fmt = DYNTAB_FIELD_VAL(&attr1, FORMAT);

	push	0
	push	-1
	push	OFFSET FLAT:$SG70446
	lea	edx, DWORD PTR _attr1$[ebp]
	push	edx
	call	_dyntab_field_val
	add	esp, 16					; 00000010H
	mov	DWORD PTR _fmt$[ebp], eax

; 192  : 				if(!*fmt)

	mov	eax, DWORD PTR _fmt$[ebp]
	movsx	ecx, BYTE PTR [eax]
	test	ecx, ecx
	jne	$L70447

; 193  : 					fmt = (!strcmp(typ, "_EVA_DATE") || !strcmp(typ, "_EVA_NUMBER") || !strcmp(typ, "_EVA_RELATION") || !strcmp(typ, "_EVA_EMAIL")) ? typ :
; 194  : 							!strcmp(typ, "_EVA_FILEUPLOAD") ? "_EVA_DOCUMENT" : "";

	push	OFFSET FLAT:$SG70448
	mov	edx, DWORD PTR _typ$[ebp]
	push	edx
	call	_strcmp
	add	esp, 8
	test	eax, eax
	je	SHORT $L71012
	push	OFFSET FLAT:$SG70449
	mov	eax, DWORD PTR _typ$[ebp]
	push	eax
	call	_strcmp
	add	esp, 8
	test	eax, eax
	je	SHORT $L71012
	push	OFFSET FLAT:$SG70450
	mov	ecx, DWORD PTR _typ$[ebp]
	push	ecx
	call	_strcmp
	add	esp, 8
	test	eax, eax
	je	SHORT $L71012
	push	OFFSET FLAT:$SG70451
	mov	edx, DWORD PTR _typ$[ebp]
	push	edx
	call	_strcmp
	add	esp, 8
	test	eax, eax
	je	SHORT $L71012
	push	OFFSET FLAT:$SG70452
	mov	eax, DWORD PTR _typ$[ebp]
	push	eax
	call	_strcmp
	add	esp, 8
	test	eax, eax
	jne	SHORT $L71013
	mov	DWORD PTR -116+[ebp], OFFSET FLAT:$SG70453
	jmp	SHORT $L71014
$L71013:
	mov	DWORD PTR -116+[ebp], OFFSET FLAT:$SG70454
$L71014:
	mov	ecx, DWORD PTR -116+[ebp]
	mov	DWORD PTR -120+[ebp], ecx
	jmp	SHORT $L71015
$L71012:
	mov	edx, DWORD PTR _typ$[ebp]
	mov	DWORD PTR -120+[ebp], edx
$L71015:
	mov	eax, DWORD PTR -120+[ebp]
	mov	DWORD PTR _fmt$[ebp], eax
$L70447:

; 196  : 		}

	jmp	$L70426
$L70427:

; 197  : 		DYNTAB_ADD_BUF(&tbl->field, i, j, buf);

	cmp	DWORD PTR _buf$[ebp], 0
	je	SHORT $L70455
	mov	ecx, DWORD PTR _buf$[ebp]
	cmp	DWORD PTR [ecx+4], 0
	je	SHORT $L70455
	push	0
	push	0
	mov	edx, DWORD PTR _buf$[ebp]
	mov	eax, DWORD PTR [edx+4]
	push	eax
	mov	ecx, DWORD PTR _buf$[ebp]
	add	ecx, 8
	push	ecx
	mov	edx, DWORD PTR _j$[ebp]
	push	edx
	mov	eax, DWORD PTR _i$[ebp]
	push	eax
	mov	ecx, DWORD PTR _tbl$[ebp]
	add	ecx, 380				; 0000017cH
	push	ecx
	call	_dyntab_add
	add	esp, 28					; 0000001cH
	test	eax, eax
	je	SHORT $L70457
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29872], OFFSET FLAT:$SG70459
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 197		; 000000c5H
	jmp	$eva_err$70307
$L70457:
	jmp	SHORT $L70463
$L70455:
	push	0
	push	0
	push	0
	push	0
	mov	ecx, DWORD PTR _j$[ebp]
	push	ecx
	mov	edx, DWORD PTR _i$[ebp]
	push	edx
	mov	eax, DWORD PTR _tbl$[ebp]
	add	eax, 380				; 0000017cH
	push	eax
	call	_dyntab_add
	add	esp, 28					; 0000001cH
	test	eax, eax
	je	SHORT $L70463
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29872], OFFSET FLAT:$SG70465
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 197		; 000000c5H
	jmp	$eva_err$70307
$L70463:

; 199  : 	else if(!strcmp(ctl, "_EVA_BUTTON"))

	jmp	$L70494
$L70417:
	push	OFFSET FLAT:$SG70468
	mov	eax, DWORD PTR _ctl$[ebp]
	push	eax
	call	_strcmp
	add	esp, 8
	test	eax, eax
	jne	SHORT $L70467

; 201  : 		/* Button : use object itself */
; 202  : 		DYNTAB_ADD_CELLP(&tbl->field, i, j, dyntab_field_cell(&attr, "_EVA_CONTROL", ~0UL, 0));

	push	1
	push	0
	push	-1
	push	OFFSET FLAT:$SG70470
	lea	ecx, DWORD PTR _attr$[ebp]
	push	ecx
	call	_dyntab_field_cell
	add	esp, 16					; 00000010H
	push	eax
	mov	edx, DWORD PTR _j$[ebp]
	push	edx
	mov	eax, DWORD PTR _i$[ebp]
	push	eax
	mov	ecx, DWORD PTR _tbl$[ebp]
	add	ecx, 380				; 0000017cH
	push	ecx
	call	_dyntab_copy
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L70469
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29872], OFFSET FLAT:$SG70472
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 202		; 000000caH
	jmp	$eva_err$70307
$L70469:

; 204  : 	else if(!strcmp(ctl, "_EVA_INPUT"))

	jmp	$L70494
$L70467:
	push	OFFSET FLAT:$SG70475
	mov	ecx, DWORD PTR _ctl$[ebp]
	push	ecx
	call	_strcmp
	add	esp, 8
	test	eax, eax
	jne	SHORT $L70474

; 206  : 		/* Input : use field name */
; 207  : 		DYNTAB_ADD_CELLP(&tbl->field, i, j, dyntab_field_cell(&attr, "_EVA_FIELD", ~0UL, 0));

	push	1
	push	0
	push	-1
	push	OFFSET FLAT:$SG70477
	lea	edx, DWORD PTR _attr$[ebp]
	push	edx
	call	_dyntab_field_cell
	add	esp, 16					; 00000010H
	push	eax
	mov	eax, DWORD PTR _j$[ebp]
	push	eax
	mov	ecx, DWORD PTR _i$[ebp]
	push	ecx
	mov	edx, DWORD PTR _tbl$[ebp]
	add	edx, 380				; 0000017cH
	push	edx
	call	_dyntab_copy
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L70476
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29872], OFFSET FLAT:$SG70479
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 207		; 000000cfH
	jmp	$eva_err$70307
$L70476:

; 209  : 	else

	jmp	$L70494
$L70474:

; 211  : 		/* Calc expression : evaluate variables */
; 212  : 		if(qry_eval_sqlexpr_var(cntxt, &buf, DYNTAB_FIELD_VAL(&attr, SRCFIELD), &attr, NULL)) CLEAR_ERROR_RETURN;

	push	0
	lea	edx, DWORD PTR _attr$[ebp]
	push	edx
	push	0
	push	-1
	push	OFFSET FLAT:$SG70483
	lea	eax, DWORD PTR _attr$[ebp]
	push	eax
	call	_dyntab_field_val
	add	esp, 16					; 00000010H
	push	eax
	lea	ecx, DWORD PTR _buf$[ebp]
	push	ecx
	mov	edx, DWORD PTR _cntxt$[ebp]
	push	edx
	call	_qry_eval_sqlexpr_var
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L70482
	push	212					; 000000d4H
	push	OFFSET FLAT:$SG70484
	push	OFFSET FLAT:$SG70485
	mov	eax, DWORD PTR _cntxt$[ebp]
	push	eax
	call	_err_clear
	add	esp, 16					; 00000010H
	jmp	$eva_noerr$70303
$L70482:

; 213  : 		DYNTAB_ADD_BUF(&tbl->field, i, j, buf);

	cmp	DWORD PTR _buf$[ebp], 0
	je	SHORT $L70486
	mov	ecx, DWORD PTR _buf$[ebp]
	cmp	DWORD PTR [ecx+4], 0
	je	SHORT $L70486
	push	0
	push	0
	mov	edx, DWORD PTR _buf$[ebp]
	mov	eax, DWORD PTR [edx+4]
	push	eax
	mov	ecx, DWORD PTR _buf$[ebp]
	add	ecx, 8
	push	ecx
	mov	edx, DWORD PTR _j$[ebp]
	push	edx
	mov	eax, DWORD PTR _i$[ebp]
	push	eax
	mov	ecx, DWORD PTR _tbl$[ebp]
	add	ecx, 380				; 0000017cH
	push	ecx
	call	_dyntab_add
	add	esp, 28					; 0000001cH
	test	eax, eax
	je	SHORT $L70488
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29872], OFFSET FLAT:$SG70490
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 213		; 000000d5H
	jmp	$eva_err$70307
$L70488:
	jmp	SHORT $L70494
$L70486:
	push	0
	push	0
	push	0
	push	0
	mov	ecx, DWORD PTR _j$[ebp]
	push	ecx
	mov	edx, DWORD PTR _i$[ebp]
	push	edx
	mov	eax, DWORD PTR _tbl$[ebp]
	add	eax, 380				; 0000017cH
	push	eax
	call	_dyntab_add
	add	esp, 28					; 0000001cH
	test	eax, eax
	je	SHORT $L70494
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29872], OFFSET FLAT:$SG70496
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 213		; 000000d5H
	jmp	SHORT $eva_err$70307
$L70494:

; 215  : 
; 216  : 	/* Store column format */
; 217  : 	DYNTAB_ADD(&tbl->format, i, j, fmt, 0, NO_CONV);

	push	0
	push	0
	push	0
	mov	eax, DWORD PTR _fmt$[ebp]
	push	eax
	mov	ecx, DWORD PTR _j$[ebp]
	push	ecx
	mov	edx, DWORD PTR _i$[ebp]
	push	edx
	mov	eax, DWORD PTR _tbl$[ebp]
	add	eax, 400				; 00000190H
	push	eax
	call	_dyntab_add
	add	esp, 28					; 0000001cH
	test	eax, eax
	je	SHORT $L70498
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29872], OFFSET FLAT:$SG70500
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 217		; 000000d9H
	jmp	SHORT $eva_err$70307
$L70498:
$eva_noerr$70303:

; 218  : 
; 219  : 	RETURN_OK_CLEANUP;

	push	0
	push	OFFSET FLAT:$SG70501
	push	OFFSET FLAT:$SG70502
	mov	eax, DWORD PTR _cntxt$[ebp]
	push	eax
	call	_err_clear
	add	esp, 16					; 00000010H
$eva_err$70307:
	mov	ecx, DWORD PTR _cntxt$[ebp]
	cmp	DWORD PTR [ecx+29872], 0
	je	SHORT $L70503
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	eax, DWORD PTR [edx+29900]
	push	eax
	push	OFFSET FLAT:$SG70504
	push	OFFSET FLAT:$SG70505
	mov	ecx, DWORD PTR _cntxt$[ebp]
	push	ecx
	call	_err_add_context
	add	esp, 16					; 00000010H
$L70503:
	lea	edx, DWORD PTR _attr$[ebp]
	push	edx
	call	_dyntab_free
	add	esp, 4
	lea	eax, DWORD PTR _attr1$[ebp]
	push	eax
	call	_dyntab_free
	add	esp, 4
	lea	ecx, DWORD PTR _idobj$[ebp]
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

; 220  : }

	mov	esp, ebp
	pop	ebp
	ret	0
_table_read_control ENDP
_TEXT	ENDS
PUBLIC	_table_read_controls
EXTRN	_qsort_col0desc:NEAR
EXTRN	_sscanf:NEAR
EXTRN	_cgi_filter_values:NEAR
EXTRN	_atoi:NEAR
EXTRN	_mem_alloc:NEAR
EXTRN	_qry_complete_data:NEAR
EXTRN	_cgi_get_subfield:NEAR
EXTRN	_qry_eval_var_expr_table:NEAR
EXTRN	_dyntab_from_tab:NEAR
EXTRN	_dyntab_order_lines:NEAR
EXTRN	_dyntab_group:NEAR
EXTRN	_dyntab_sort:NEAR
_BSS	SEGMENT
	ALIGN	4

$SG70728 DB	01H DUP (?)
	ALIGN	4

$SG70733 DB	01H DUP (?)
	ALIGN	4

$SG70754 DB	01H DUP (?)
	ALIGN	4

$SG70764 DB	01H DUP (?)
	ALIGN	4

$SG70794 DB	01H DUP (?)
	ALIGN	4

$SG70530 DB	01H DUP (?)
	ALIGN	4

$SG70558 DB	01H DUP (?)
_BSS	ENDS
_DATA	SEGMENT
	ORG $+1
$SG70529 DB	'_EVA_TABLEINSERT', 00H
	ORG $+3
$SG70534 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70542 DB	'_EVA_BASE_FORMS', 00H
$SG70543 DB	'_EVA_COLDEF', 00H
$SG70544 DB	'_EVA_DISPLAYFIELDS', 00H
	ORG $+1
$SG70546 DB	'_EVA_INPUTMODE', 00H
	ORG $+1
$SG70547 DB	'_EVA_INPUT', 00H
	ORG $+1
$SG70550 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70557 DB	'_EVA_BASE_FORMS', 00H
$SG70560 DB	'_EVA_COLDEF', 00H
$SG70562 DB	'_EVA_CTRL_LIST', 00H
	ORG $+1
$SG70565 DB	'_EVA_CTRLTREE', 00H
	ORG $+2
$SG70567 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70575 DB	'_EVA_CTRL_TABLE', 00H
$SG70579 DB	'_EVA_CTRLTREE', 00H
	ORG $+2
$SG70581 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70594 DB	'_EVA_DISPLAYFIELDS', 00H
	ORG $+1
$SG70596 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70600 DB	'_EVA_DISPLAYFORMAT', 00H
	ORG $+1
$SG70602 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70606 DB	'_EVA_DISPLAYLABELS', 00H
	ORG $+1
$SG70608 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70612 DB	'_EVA_DISPLAYALIGN', 00H
	ORG $+2
$SG70614 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70618 DB	'_EVA_DISPLAYBOLD', 00H
	ORG $+3
$SG70620 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70624 DB	'_EVA_DISPLAYFONTSIZE', 00H
	ORG $+3
$SG70626 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70630 DB	'_EVA_DISPLAY_UNDERLINE', 00H
	ORG $+1
$SG70632 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70636 DB	'_EVA_DISPLAY_STRIP', 00H
	ORG $+1
$SG70638 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70642 DB	'_EVA_DISPLAYNOTES', 00H
	ORG $+2
$SG70644 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70648 DB	'_EVA_DISTINCT_VAL', 00H
	ORG $+2
$SG70650 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70654 DB	'_EVA_DEBUG_SQL_EXPR', 00H
$SG70656 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70660 DB	'_EVA_DISPLAY_LBLSTYLE', 00H
	ORG $+2
$SG70662 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70666 DB	'_EVA_DISPLAY_CELLSTYLE', 00H
	ORG $+1
$SG70668 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70672 DB	'_EVA_NO_TMPTABLE', 00H
	ORG $+3
$SG70674 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70676 DB	'_EVA_MINSEARCHLEN', 00H
	ORG $+2
$SG70678 DB	'_EVA_COLUMN_LIMIT', 00H
	ORG $+2
$SG70681 DB	'D:\Travail\ABI\EVA\V4.0\CGI\Brunix-2016\table_export.c', 00H
	ORG $+1
$SG70682 DB	'table_read_controls', 00H
$SG70686 DB	'_EVA_ALTFILTER', 00H
	ORG $+1
$SG70688 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70692 DB	'_EVA_ALTFILTER_FILTER', 00H
	ORG $+2
$SG70694 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70698 DB	'_EVA_ALTFILTER_TYPE', 00H
$SG70700 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70704 DB	'_EVA_ALTFILTER_GROUP', 00H
	ORG $+3
$SG70706 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70711 DB	'_EVA_FIELDLIST', 00H
	ORG $+1
$SG70714 DB	'SELFILTER', 00H
	ORG $+2
$SG70717 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70719 DB	'STATUS', 00H
	ORG $+1
$SG70721 DB	'%d,%lu,%lu,%lu,%d,%lu,%lu,%u', 00H
	ORG $+3
$SG70722 DB	'_EVA_TABLESEARCH', 00H
	ORG $+3
$SG70724 DB	'_EVA_EXTCTRL', 00H
	ORG $+3
$SG70729 DB	'_EVA_SEARCHINPUT', 00H
	ORG $+3
$SG70734 DB	'_EVA_SEARCHMODE', 00H
$SG70735 DB	'MAX', 00H
$SG70737 DB	'_EVA_BEGIN', 00H
	ORG $+1
$SG70738 DB	'_EVA_EXACT', 00H
	ORG $+1
$SG70741 DB	'INPUT', 00H
	ORG $+2
$SG70743 DB	'0', 00H
	ORG $+2
$SG70745 DB	'_EVA_LIST_CREATE_FORM', 00H
	ORG $+2
$SG70746 DB	'_EVA_BASE_FORMS', 00H
$SG70748 DB	'_EVA_NONE', 00H
	ORG $+2
$SG70749 DB	'_EVA_OPENBUTTON', 00H
$SG70751 DB	'_EVA_NONE', 00H
	ORG $+2
$SG70752 DB	'0', 00H
	ORG $+2
$SG70753 DB	'_EVA_PAGE_CTRL', 00H
	ORG $+1
$SG70756 DB	'_EVA_INPUT', 00H
	ORG $+1
$SG70758 DB	'_EVA_NONE', 00H
	ORG $+2
$SG70759 DB	'_EVA_RELATION', 00H
	ORG $+2
$SG70761 DB	'_EVA_MULTIPLE_AUTO_ORDER', 00H
	ORG $+3
$SG70763 DB	'_EVA_NOTABLESORT', 00H
	ORG $+3
$SG70767 DB	'_EVA_SORTCOL', 00H
	ORG $+3
$SG70769 DB	'_EVA_ALLOWEMPTY', 00H
$SG70771 DB	'_EVA_INIT_SEARCH_MODE', 00H
	ORG $+2
$SG70772 DB	'_EVA_BEGIN', 00H
	ORG $+1
$SG70773 DB	'_EVA_EXACT', 00H
	ORG $+1
$SG70780 DB	'_EVA_SEARCHONLOAD', 00H
	ORG $+2
$SG70782 DB	'_EVA_SEARCHONLOAD_NEW', 00H
	ORG $+2
$SG70783 DB	'_EVA_SEARCHONLOAD_EMPTY', 00H
$SG70785 DB	'_EVA_FILEUPLOAD', 00H
$SG70787 DB	'Yes', 00H
$SG70788 DB	'_EVA_CONDITION', 00H
	ORG $+1
$SG70791 DB	'_EVA_LINES', 00H
	ORG $+1
$SG70793 DB	'_EVA_SORTDESC', 00H
	ORG $+2
$SG70796 DB	'D:\Travail\ABI\EVA\V4.0\CGI\Brunix-2016\table_export.c', 00H
	ORG $+1
$SG70797 DB	'table_read_controls', 00H
$SG70799 DB	'D:\Travail\ABI\EVA\V4.0\CGI\Brunix-2016\table_export.c', 00H
	ORG $+1
$SG70800 DB	'table_read_controls', 00H
_DATA	ENDS
_TEXT	SEGMENT
_sortcol$70766 = -92
_ae$70768 = -96
_initsearch$70770 = -88
_cntxt$ = 8
_i_ctrl$ = 12
_data$ = 16
_form$ = -4
_ctrl$ = -80
_cgival$ = -64
_listctrl$ = -40
_tablesearch$ = -76
_tbl$ = -12
_i$ = -44
_j$ = -72
_offset$ = -20
_b_sts$ = -8
_coldef$ = -16
_insert$ = -68
_size1$70531 = -84
_table_read_controls PROC NEAR

; 235  : ){

	push	ebp
	mov	ebp, esp
	sub	esp, 152				; 00000098H

; 236  : 	EVA_form *form = cntxt->form;

	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	ecx, DWORD PTR [eax+80]
	mov	DWORD PTR _form$[ebp], ecx

; 237  : 	EVA_ctrl *ctrl = form->ctrl + i_ctrl;

	mov	edx, DWORD PTR _i_ctrl$[ebp]
	imul	edx, 480				; 000001e0H
	mov	eax, DWORD PTR _form$[ebp]
	mov	ecx, DWORD PTR [eax]
	add	ecx, edx
	mov	DWORD PTR _ctrl$[ebp], ecx

; 238  : 	DynTable cgival = { 0 };

	mov	DWORD PTR _cgival$[ebp], 0
	xor	edx, edx
	mov	DWORD PTR _cgival$[ebp+4], edx
	mov	DWORD PTR _cgival$[ebp+8], edx
	mov	DWORD PTR _cgival$[ebp+12], edx
	mov	DWORD PTR _cgival$[ebp+16], edx

; 239  : 	DynTable listctrl = { 0 };

	mov	DWORD PTR _listctrl$[ebp], 0
	xor	eax, eax
	mov	DWORD PTR _listctrl$[ebp+4], eax
	mov	DWORD PTR _listctrl$[ebp+8], eax
	mov	DWORD PTR _listctrl$[ebp+12], eax
	mov	DWORD PTR _listctrl$[ebp+16], eax

; 240  : 	char *tablesearch;
; 241  : 	ObjTableFormat *tbl = NULL;

	mov	DWORD PTR _tbl$[ebp], 0

; 242  : 	unsigned long i, j;
; 243  : 	int offset = 0, b_sts = 0;

	mov	DWORD PTR _offset$[ebp], 0
	mov	DWORD PTR _b_sts$[ebp], 0

; 244  : 	char *coldef;
; 245  : 	char *insert = CTRL_ATTR_VAL(TABLEINSERT);

	cmp	DWORD PTR _ctrl$[ebp], 0
	je	SHORT $L71017
	push	0
	push	-1
	push	OFFSET FLAT:$SG70529
	mov	ecx, DWORD PTR _ctrl$[ebp]
	add	ecx, 44					; 0000002cH
	push	ecx
	call	_dyntab_field_val
	add	esp, 16					; 00000010H
	mov	DWORD PTR -100+[ebp], eax
	jmp	SHORT $L71018
$L71017:
	mov	DWORD PTR -100+[ebp], OFFSET FLAT:$SG70530
$L71018:
	mov	edx, DWORD PTR -100+[ebp]
	mov	DWORD PTR _insert$[ebp], edx

; 246  : 
; 247  : 	/* Alloc && initialize table data */
; 248  : 	M_ALLOC(ctrl->objtbl, sizeof(ctrl->objtbl[0]));

	mov	DWORD PTR _size1$70531[ebp], 664	; 00000298H
	mov	eax, DWORD PTR _size1$70531[ebp]
	push	eax
	call	_mem_alloc
	add	esp, 4
	mov	ecx, DWORD PTR _ctrl$[ebp]
	mov	DWORD PTR [ecx+232], eax
	cmp	DWORD PTR _size1$70531[ebp], 0
	je	SHORT $L70532
	mov	edx, DWORD PTR _ctrl$[ebp]
	cmp	DWORD PTR [edx+232], 0
	jne	SHORT $L70532
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29872], OFFSET FLAT:$SG70534
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 248		; 000000f8H
	jmp	$eva_err$70535
$L70532:

; 249  : 	tbl = ctrl->objtbl;

	mov	edx, DWORD PTR _ctrl$[ebp]
	mov	eax, DWORD PTR [edx+232]
	mov	DWORD PTR _tbl$[ebp], eax

; 250  : 
; 251  : 	/* Handle basic case : base form & no fields */
; 252  : 	if(CTRL_ATTR_CELL(BASE_FORMS) && !CTRL_ATTR_CELL(COLDEF) && !CTRL_ATTR_CELL(DISPLAYFIELDS) &&
; 253  : 		(CTRL_ATTR_CELL(INPUTMODE) || strcmp(ctrl->CONTROL, "_EVA_INPUT")) && !data)

	cmp	DWORD PTR _ctrl$[ebp], 0
	je	SHORT $L71019
	push	0
	push	-1
	push	OFFSET FLAT:$SG70542
	mov	ecx, DWORD PTR _ctrl$[ebp]
	add	ecx, 44					; 0000002cH
	push	ecx
	call	_dyntab_field_cell
	add	esp, 16					; 00000010H
	mov	DWORD PTR -104+[ebp], eax
	jmp	SHORT $L71020
$L71019:
	mov	DWORD PTR -104+[ebp], 0
$L71020:
	cmp	DWORD PTR -104+[ebp], 0
	je	$L70555
	cmp	DWORD PTR _ctrl$[ebp], 0
	je	SHORT $L71021
	push	0
	push	-1
	push	OFFSET FLAT:$SG70543
	mov	edx, DWORD PTR _ctrl$[ebp]
	add	edx, 44					; 0000002cH
	push	edx
	call	_dyntab_field_cell
	add	esp, 16					; 00000010H
	mov	DWORD PTR -108+[ebp], eax
	jmp	SHORT $L71022
$L71021:
	mov	DWORD PTR -108+[ebp], 0
$L71022:
	cmp	DWORD PTR -108+[ebp], 0
	jne	$L70555
	cmp	DWORD PTR _ctrl$[ebp], 0
	je	SHORT $L71023
	push	0
	push	-1
	push	OFFSET FLAT:$SG70544
	mov	eax, DWORD PTR _ctrl$[ebp]
	add	eax, 44					; 0000002cH
	push	eax
	call	_dyntab_field_cell
	add	esp, 16					; 00000010H
	mov	DWORD PTR -112+[ebp], eax
	jmp	SHORT $L71024
$L71023:
	mov	DWORD PTR -112+[ebp], 0
$L71024:
	cmp	DWORD PTR -112+[ebp], 0
	jne	$L70555
	cmp	DWORD PTR _ctrl$[ebp], 0
	je	SHORT $L71025
	push	0
	push	-1
	push	OFFSET FLAT:$SG70546
	mov	ecx, DWORD PTR _ctrl$[ebp]
	add	ecx, 44					; 0000002cH
	push	ecx
	call	_dyntab_field_cell
	add	esp, 16					; 00000010H
	mov	DWORD PTR -116+[ebp], eax
	jmp	SHORT $L71026
$L71025:
	mov	DWORD PTR -116+[ebp], 0
$L71026:
	cmp	DWORD PTR -116+[ebp], 0
	jne	SHORT $L70545
	push	OFFSET FLAT:$SG70547
	mov	edx, DWORD PTR _ctrl$[ebp]
	mov	eax, DWORD PTR [edx+272]
	push	eax
	call	_strcmp
	add	esp, 8
	test	eax, eax
	je	$L70555
$L70545:
	cmp	DWORD PTR _data$[ebp], 0
	jne	$L70555

; 255  : 		data = &tbl->tattr;

	mov	ecx, DWORD PTR _tbl$[ebp]
	add	ecx, 4
	mov	DWORD PTR _data$[ebp], ecx

; 256  : 		if(dyntab_from_tab(data, 0, 0, &ctrl->attr, 0, 0, ctrl->attr.nbrows, ctrl->attr.nbcols, 19)) RETURN_ERR_MEMORY;

	push	19					; 00000013H
	mov	edx, DWORD PTR _ctrl$[ebp]
	mov	eax, DWORD PTR [edx+52]
	push	eax
	mov	ecx, DWORD PTR _ctrl$[ebp]
	mov	edx, DWORD PTR [ecx+44]
	push	edx
	push	0
	push	0
	mov	eax, DWORD PTR _ctrl$[ebp]
	add	eax, 44					; 0000002cH
	push	eax
	push	0
	push	0
	mov	ecx, DWORD PTR _data$[ebp]
	push	ecx
	call	_dyntab_from_tab
	add	esp, 36					; 00000024H
	test	eax, eax
	je	SHORT $L70548
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29872], OFFSET FLAT:$SG70550
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 256		; 00000100H
	jmp	$eva_err$70535
$L70548:

; 257  : 		if(qry_cache_idobj(&listctrl, strtoul(CTRL_ATTR_VAL(BASE_FORMS), NULL, 10)) ||
; 258  : 			ctrl_read_baseobj(cntxt, &listctrl) ||
; 259  : 			qry_complete_data(cntxt, data, &listctrl, NULL, NULL)) STACK_ERROR;

	cmp	DWORD PTR _ctrl$[ebp], 0
	je	SHORT $L71027
	push	0
	push	-1
	push	OFFSET FLAT:$SG70557
	mov	ecx, DWORD PTR _ctrl$[ebp]
	add	ecx, 44					; 0000002cH
	push	ecx
	call	_dyntab_field_val
	add	esp, 16					; 00000010H
	mov	DWORD PTR -120+[ebp], eax
	jmp	SHORT $L71028
$L71027:
	mov	DWORD PTR -120+[ebp], OFFSET FLAT:$SG70558
$L71028:
	push	3
	push	0
	push	10					; 0000000aH
	push	0
	mov	edx, DWORD PTR -120+[ebp]
	push	edx
	call	_strtoul
	add	esp, 12					; 0000000cH
	push	eax
	lea	eax, DWORD PTR _listctrl$[ebp]
	push	eax
	mov	ecx, DWORD PTR _cntxt$[ebp]
	push	ecx
	call	_qry_cache_idobj_field
	add	esp, 20					; 00000014H
	test	eax, eax
	jne	SHORT $L70556
	lea	edx, DWORD PTR _listctrl$[ebp]
	push	edx
	mov	eax, DWORD PTR _cntxt$[ebp]
	push	eax
	call	_ctrl_read_baseobj
	add	esp, 8
	test	eax, eax
	jne	SHORT $L70556
	push	0
	push	0
	lea	ecx, DWORD PTR _listctrl$[ebp]
	push	ecx
	mov	edx, DWORD PTR _data$[ebp]
	push	edx
	mov	eax, DWORD PTR _cntxt$[ebp]
	push	eax
	call	_qry_complete_data
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L70555
$L70556:
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 259		; 00000103H
	jmp	$eva_err$70535
$L70555:

; 261  : 
; 262  : 	/* Handle data from control attributes (pointer may change) */
; 263  : 	if(!data)

	cmp	DWORD PTR _data$[ebp], 0
	jne	SHORT $L70559

; 265  : 		data = &ctrl->attr;

	mov	edx, DWORD PTR _ctrl$[ebp]
	add	edx, 44					; 0000002cH
	mov	DWORD PTR _data$[ebp], edx

; 266  : 		tbl->b_ctrl = 1;

	mov	eax, DWORD PTR _tbl$[ebp]
	mov	DWORD PTR [eax+24], 1
$L70559:

; 268  : 	tbl->attr = data;

	mov	ecx, DWORD PTR _tbl$[ebp]
	mov	edx, DWORD PTR _data$[ebp]
	mov	DWORD PTR [ecx], edx

; 269  : 	coldef = DYNTAB_FIELD_VAL(data, COLDEF);

	push	0
	push	-1
	push	OFFSET FLAT:$SG70560
	mov	eax, DWORD PTR _data$[ebp]
	push	eax
	call	_dyntab_field_val
	add	esp, 16					; 00000010H
	mov	DWORD PTR _coldef$[ebp], eax

; 270  : 
; 271  : 	/* Handle columns definition method */
; 272  : 	if(!strcmp(coldef, "_EVA_CTRL_LIST"))

	push	OFFSET FLAT:$SG70562
	mov	ecx, DWORD PTR _coldef$[ebp]
	push	ecx
	call	_strcmp
	add	esp, 8
	test	eax, eax
	jne	$L70561

; 274  : 		/* Controls list : read columns definition from given controls */
; 275  : 		DYNTAB_FIELD(&listctrl, tbl->attr, CTRLTREE);

	lea	edx, DWORD PTR _listctrl$[ebp]
	push	edx
	call	_dyntab_free
	add	esp, 4
	push	0
	push	-1
	push	OFFSET FLAT:$SG70565
	mov	eax, DWORD PTR _tbl$[ebp]
	mov	ecx, DWORD PTR [eax]
	push	ecx
	push	0
	lea	edx, DWORD PTR _listctrl$[ebp]
	push	edx
	call	_dyntab_filter_field
	add	esp, 24					; 00000018H
	test	eax, eax
	je	SHORT $L70564
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29872], OFFSET FLAT:$SG70567
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 275		; 00000113H
	jmp	$eva_err$70535
$L70564:

; 276  : 		for(i = 0; i < listctrl.nbrows; i++)

	mov	DWORD PTR _i$[ebp], 0
	jmp	SHORT $L70568
$L70569:
	mov	edx, DWORD PTR _i$[ebp]
	add	edx, 1
	mov	DWORD PTR _i$[ebp], edx
$L70568:
	mov	eax, DWORD PTR _i$[ebp]
	cmp	eax, DWORD PTR _listctrl$[ebp]
	jae	SHORT $L70570

; 277  : 			if(table_read_control(cntxt, DYNTAB_TOULRC(&listctrl, i, 0), tbl, i, 0)) STACK_ERROR;

	push	0
	mov	ecx, DWORD PTR _i$[ebp]
	push	ecx
	mov	edx, DWORD PTR _tbl$[ebp]
	push	edx
	push	10					; 0000000aH
	push	0
	push	0
	mov	eax, DWORD PTR _i$[ebp]
	push	eax
	lea	ecx, DWORD PTR _listctrl$[ebp]
	push	ecx
	call	_dyntab_val
	add	esp, 12					; 0000000cH
	push	eax
	call	_strtoul
	add	esp, 12					; 0000000cH
	push	eax
	mov	edx, DWORD PTR _cntxt$[ebp]
	push	edx
	call	_table_read_control
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L70572
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 277		; 00000115H
	jmp	$eva_err$70535
$L70572:
	jmp	SHORT $L70569
$L70570:

; 279  : 	else if(!strcmp(coldef, "_EVA_CTRL_TABLE"))

	jmp	$L70670
$L70561:
	push	OFFSET FLAT:$SG70575
	mov	ecx, DWORD PTR _coldef$[ebp]
	push	ecx
	call	_strcmp
	add	esp, 8
	test	eax, eax
	jne	$L70574

; 281  : 		/* Read columns data from given controls */
; 282  : 		DYNTAB_FIELD_TAB(&listctrl, tbl->attr, CTRLTREE);

	lea	edx, DWORD PTR _listctrl$[ebp]
	push	edx
	call	_dyntab_free
	add	esp, 4
	push	0
	push	-1
	push	OFFSET FLAT:$SG70579
	mov	eax, DWORD PTR _tbl$[ebp]
	mov	ecx, DWORD PTR [eax]
	push	ecx
	push	0
	lea	edx, DWORD PTR _listctrl$[ebp]
	push	edx
	call	_dyntab_filter_field
	add	esp, 24					; 00000018H
	test	eax, eax
	jne	SHORT $L70578
	lea	eax, DWORD PTR _listctrl$[ebp]
	push	eax
	call	_dyntab_order_lines
	add	esp, 4
	test	eax, eax
	je	SHORT $L70577
$L70578:
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29872], OFFSET FLAT:$SG70581
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 282		; 0000011aH
	jmp	$eva_err$70535
$L70577:

; 283  : 		for(i = 0; i < listctrl.nbrows; i++)

	mov	DWORD PTR _i$[ebp], 0
	jmp	SHORT $L70582
$L70583:
	mov	eax, DWORD PTR _i$[ebp]
	add	eax, 1
	mov	DWORD PTR _i$[ebp], eax
$L70582:
	mov	ecx, DWORD PTR _i$[ebp]
	cmp	ecx, DWORD PTR _listctrl$[ebp]
	jae	SHORT $L70584

; 284  : 			for(j = 0; j < listctrl.nbcols; j++)

	mov	DWORD PTR _j$[ebp], 0
	jmp	SHORT $L70585
$L70586:
	mov	edx, DWORD PTR _j$[ebp]
	add	edx, 1
	mov	DWORD PTR _j$[ebp], edx
$L70585:
	mov	eax, DWORD PTR _j$[ebp]
	cmp	eax, DWORD PTR _listctrl$[ebp+8]
	jae	SHORT $L70587

; 285  : 				if(table_read_control(cntxt, DYNTAB_TOULRC(&listctrl, i, j), tbl, i, j)) STACK_ERROR;

	mov	ecx, DWORD PTR _j$[ebp]
	push	ecx
	mov	edx, DWORD PTR _i$[ebp]
	push	edx
	mov	eax, DWORD PTR _tbl$[ebp]
	push	eax
	push	10					; 0000000aH
	push	0
	mov	ecx, DWORD PTR _j$[ebp]
	push	ecx
	mov	edx, DWORD PTR _i$[ebp]
	push	edx
	lea	eax, DWORD PTR _listctrl$[ebp]
	push	eax
	call	_dyntab_val
	add	esp, 12					; 0000000cH
	push	eax
	call	_strtoul
	add	esp, 12					; 0000000cH
	push	eax
	mov	ecx, DWORD PTR _cntxt$[ebp]
	push	ecx
	call	_table_read_control
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L70589
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 285		; 0000011dH
	jmp	$eva_err$70535
$L70589:
	jmp	SHORT $L70586
$L70587:
	jmp	SHORT $L70583
$L70584:

; 287  : 	else

	jmp	$L70670
$L70574:

; 289  : 		/* Expression list : read columns data & format from current control */
; 290  : 		DYNTAB_FIELD_TAB(&tbl->field, tbl->attr, DISPLAYFIELDS);

	mov	eax, DWORD PTR _tbl$[ebp]
	add	eax, 380				; 0000017cH
	push	eax
	call	_dyntab_free
	add	esp, 4
	push	0
	push	-1
	push	OFFSET FLAT:$SG70594
	mov	ecx, DWORD PTR _tbl$[ebp]
	mov	edx, DWORD PTR [ecx]
	push	edx
	push	0
	mov	eax, DWORD PTR _tbl$[ebp]
	add	eax, 380				; 0000017cH
	push	eax
	call	_dyntab_filter_field
	add	esp, 24					; 00000018H
	test	eax, eax
	jne	SHORT $L70593
	mov	ecx, DWORD PTR _tbl$[ebp]
	add	ecx, 380				; 0000017cH
	push	ecx
	call	_dyntab_order_lines
	add	esp, 4
	test	eax, eax
	je	SHORT $L70592
$L70593:
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29872], OFFSET FLAT:$SG70596
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 290		; 00000122H
	jmp	$eva_err$70535
$L70592:

; 291  : 		DYNTAB_FIELD_TAB(&tbl->format, tbl->attr, DISPLAYFORMAT);

	mov	ecx, DWORD PTR _tbl$[ebp]
	add	ecx, 400				; 00000190H
	push	ecx
	call	_dyntab_free
	add	esp, 4
	push	0
	push	-1
	push	OFFSET FLAT:$SG70600
	mov	edx, DWORD PTR _tbl$[ebp]
	mov	eax, DWORD PTR [edx]
	push	eax
	push	0
	mov	ecx, DWORD PTR _tbl$[ebp]
	add	ecx, 400				; 00000190H
	push	ecx
	call	_dyntab_filter_field
	add	esp, 24					; 00000018H
	test	eax, eax
	jne	SHORT $L70599
	mov	edx, DWORD PTR _tbl$[ebp]
	add	edx, 400				; 00000190H
	push	edx
	call	_dyntab_order_lines
	add	esp, 4
	test	eax, eax
	je	SHORT $L70598
$L70599:
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29872], OFFSET FLAT:$SG70602
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 291		; 00000123H
	jmp	$eva_err$70535
$L70598:

; 292  : 		DYNTAB_FIELD_TAB(&tbl->label, tbl->attr, DISPLAYLABELS);

	mov	edx, DWORD PTR _tbl$[ebp]
	add	edx, 360				; 00000168H
	push	edx
	call	_dyntab_free
	add	esp, 4
	push	0
	push	-1
	push	OFFSET FLAT:$SG70606
	mov	eax, DWORD PTR _tbl$[ebp]
	mov	ecx, DWORD PTR [eax]
	push	ecx
	push	0
	mov	edx, DWORD PTR _tbl$[ebp]
	add	edx, 360				; 00000168H
	push	edx
	call	_dyntab_filter_field
	add	esp, 24					; 00000018H
	test	eax, eax
	jne	SHORT $L70605
	mov	eax, DWORD PTR _tbl$[ebp]
	add	eax, 360				; 00000168H
	push	eax
	call	_dyntab_order_lines
	add	esp, 4
	test	eax, eax
	je	SHORT $L70604
$L70605:
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29872], OFFSET FLAT:$SG70608
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 292		; 00000124H
	jmp	$eva_err$70535
$L70604:

; 293  : 		DYNTAB_FIELD_TAB(&tbl->align, tbl->attr, DISPLAYALIGN);

	mov	eax, DWORD PTR _tbl$[ebp]
	add	eax, 440				; 000001b8H
	push	eax
	call	_dyntab_free
	add	esp, 4
	push	0
	push	-1
	push	OFFSET FLAT:$SG70612
	mov	ecx, DWORD PTR _tbl$[ebp]
	mov	edx, DWORD PTR [ecx]
	push	edx
	push	0
	mov	eax, DWORD PTR _tbl$[ebp]
	add	eax, 440				; 000001b8H
	push	eax
	call	_dyntab_filter_field
	add	esp, 24					; 00000018H
	test	eax, eax
	jne	SHORT $L70611
	mov	ecx, DWORD PTR _tbl$[ebp]
	add	ecx, 440				; 000001b8H
	push	ecx
	call	_dyntab_order_lines
	add	esp, 4
	test	eax, eax
	je	SHORT $L70610
$L70611:
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29872], OFFSET FLAT:$SG70614
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 293		; 00000125H
	jmp	$eva_err$70535
$L70610:

; 294  : 		DYNTAB_FIELD_TAB(&tbl->bold, tbl->attr, DISPLAYBOLD);

	mov	ecx, DWORD PTR _tbl$[ebp]
	add	ecx, 460				; 000001ccH
	push	ecx
	call	_dyntab_free
	add	esp, 4
	push	0
	push	-1
	push	OFFSET FLAT:$SG70618
	mov	edx, DWORD PTR _tbl$[ebp]
	mov	eax, DWORD PTR [edx]
	push	eax
	push	0
	mov	ecx, DWORD PTR _tbl$[ebp]
	add	ecx, 460				; 000001ccH
	push	ecx
	call	_dyntab_filter_field
	add	esp, 24					; 00000018H
	test	eax, eax
	jne	SHORT $L70617
	mov	edx, DWORD PTR _tbl$[ebp]
	add	edx, 460				; 000001ccH
	push	edx
	call	_dyntab_order_lines
	add	esp, 4
	test	eax, eax
	je	SHORT $L70616
$L70617:
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29872], OFFSET FLAT:$SG70620
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 294		; 00000126H
	jmp	$eva_err$70535
$L70616:

; 295  : 		DYNTAB_FIELD_TAB(&tbl->fontsize, tbl->attr, DISPLAYFONTSIZE);

	mov	edx, DWORD PTR _tbl$[ebp]
	add	edx, 420				; 000001a4H
	push	edx
	call	_dyntab_free
	add	esp, 4
	push	0
	push	-1
	push	OFFSET FLAT:$SG70624
	mov	eax, DWORD PTR _tbl$[ebp]
	mov	ecx, DWORD PTR [eax]
	push	ecx
	push	0
	mov	edx, DWORD PTR _tbl$[ebp]
	add	edx, 420				; 000001a4H
	push	edx
	call	_dyntab_filter_field
	add	esp, 24					; 00000018H
	test	eax, eax
	jne	SHORT $L70623
	mov	eax, DWORD PTR _tbl$[ebp]
	add	eax, 420				; 000001a4H
	push	eax
	call	_dyntab_order_lines
	add	esp, 4
	test	eax, eax
	je	SHORT $L70622
$L70623:
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29872], OFFSET FLAT:$SG70626
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 295		; 00000127H
	jmp	$eva_err$70535
$L70622:

; 296  : 		DYNTAB_FIELD_TAB(&tbl->underline, tbl->attr, DISPLAY_UNDERLINE);

	mov	eax, DWORD PTR _tbl$[ebp]
	add	eax, 480				; 000001e0H
	push	eax
	call	_dyntab_free
	add	esp, 4
	push	0
	push	-1
	push	OFFSET FLAT:$SG70630
	mov	ecx, DWORD PTR _tbl$[ebp]
	mov	edx, DWORD PTR [ecx]
	push	edx
	push	0
	mov	eax, DWORD PTR _tbl$[ebp]
	add	eax, 480				; 000001e0H
	push	eax
	call	_dyntab_filter_field
	add	esp, 24					; 00000018H
	test	eax, eax
	jne	SHORT $L70629
	mov	ecx, DWORD PTR _tbl$[ebp]
	add	ecx, 480				; 000001e0H
	push	ecx
	call	_dyntab_order_lines
	add	esp, 4
	test	eax, eax
	je	SHORT $L70628
$L70629:
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29872], OFFSET FLAT:$SG70632
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 296		; 00000128H
	jmp	$eva_err$70535
$L70628:

; 297  : 		DYNTAB_FIELD_TAB(&tbl->strip, tbl->attr, DISPLAY_STRIP);

	mov	ecx, DWORD PTR _tbl$[ebp]
	add	ecx, 500				; 000001f4H
	push	ecx
	call	_dyntab_free
	add	esp, 4
	push	0
	push	-1
	push	OFFSET FLAT:$SG70636
	mov	edx, DWORD PTR _tbl$[ebp]
	mov	eax, DWORD PTR [edx]
	push	eax
	push	0
	mov	ecx, DWORD PTR _tbl$[ebp]
	add	ecx, 500				; 000001f4H
	push	ecx
	call	_dyntab_filter_field
	add	esp, 24					; 00000018H
	test	eax, eax
	jne	SHORT $L70635
	mov	edx, DWORD PTR _tbl$[ebp]
	add	edx, 500				; 000001f4H
	push	edx
	call	_dyntab_order_lines
	add	esp, 4
	test	eax, eax
	je	SHORT $L70634
$L70635:
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29872], OFFSET FLAT:$SG70638
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 297		; 00000129H
	jmp	$eva_err$70535
$L70634:

; 298  : 		DYNTAB_FIELD_TAB(&tbl->notes, tbl->attr, DISPLAYNOTES);

	mov	edx, DWORD PTR _tbl$[ebp]
	add	edx, 580				; 00000244H
	push	edx
	call	_dyntab_free
	add	esp, 4
	push	0
	push	-1
	push	OFFSET FLAT:$SG70642
	mov	eax, DWORD PTR _tbl$[ebp]
	mov	ecx, DWORD PTR [eax]
	push	ecx
	push	0
	mov	edx, DWORD PTR _tbl$[ebp]
	add	edx, 580				; 00000244H
	push	edx
	call	_dyntab_filter_field
	add	esp, 24					; 00000018H
	test	eax, eax
	jne	SHORT $L70641
	mov	eax, DWORD PTR _tbl$[ebp]
	add	eax, 580				; 00000244H
	push	eax
	call	_dyntab_order_lines
	add	esp, 4
	test	eax, eax
	je	SHORT $L70640
$L70641:
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29872], OFFSET FLAT:$SG70644
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 298		; 0000012aH
	jmp	$eva_err$70535
$L70640:

; 299  : 		DYNTAB_FIELD_TAB(&tbl->distinctval, tbl->attr, DISTINCT_VAL);

	mov	eax, DWORD PTR _tbl$[ebp]
	add	eax, 520				; 00000208H
	push	eax
	call	_dyntab_free
	add	esp, 4
	push	0
	push	-1
	push	OFFSET FLAT:$SG70648
	mov	ecx, DWORD PTR _tbl$[ebp]
	mov	edx, DWORD PTR [ecx]
	push	edx
	push	0
	mov	eax, DWORD PTR _tbl$[ebp]
	add	eax, 520				; 00000208H
	push	eax
	call	_dyntab_filter_field
	add	esp, 24					; 00000018H
	test	eax, eax
	jne	SHORT $L70647
	mov	ecx, DWORD PTR _tbl$[ebp]
	add	ecx, 520				; 00000208H
	push	ecx
	call	_dyntab_order_lines
	add	esp, 4
	test	eax, eax
	je	SHORT $L70646
$L70647:
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29872], OFFSET FLAT:$SG70650
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 299		; 0000012bH
	jmp	$eva_err$70535
$L70646:

; 300  : 		DYNTAB_FIELD_TAB(&tbl->debug, tbl->attr, DEBUG_SQL_EXPR);

	mov	ecx, DWORD PTR _tbl$[ebp]
	add	ecx, 600				; 00000258H
	push	ecx
	call	_dyntab_free
	add	esp, 4
	push	0
	push	-1
	push	OFFSET FLAT:$SG70654
	mov	edx, DWORD PTR _tbl$[ebp]
	mov	eax, DWORD PTR [edx]
	push	eax
	push	0
	mov	ecx, DWORD PTR _tbl$[ebp]
	add	ecx, 600				; 00000258H
	push	ecx
	call	_dyntab_filter_field
	add	esp, 24					; 00000018H
	test	eax, eax
	jne	SHORT $L70653
	mov	edx, DWORD PTR _tbl$[ebp]
	add	edx, 600				; 00000258H
	push	edx
	call	_dyntab_order_lines
	add	esp, 4
	test	eax, eax
	je	SHORT $L70652
$L70653:
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29872], OFFSET FLAT:$SG70656
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 300		; 0000012cH
	jmp	$eva_err$70535
$L70652:

; 301  : 		DYNTAB_FIELD_TAB(&tbl->lblstyle, tbl->attr, DISPLAY_LBLSTYLE);

	mov	edx, DWORD PTR _tbl$[ebp]
	add	edx, 540				; 0000021cH
	push	edx
	call	_dyntab_free
	add	esp, 4
	push	0
	push	-1
	push	OFFSET FLAT:$SG70660
	mov	eax, DWORD PTR _tbl$[ebp]
	mov	ecx, DWORD PTR [eax]
	push	ecx
	push	0
	mov	edx, DWORD PTR _tbl$[ebp]
	add	edx, 540				; 0000021cH
	push	edx
	call	_dyntab_filter_field
	add	esp, 24					; 00000018H
	test	eax, eax
	jne	SHORT $L70659
	mov	eax, DWORD PTR _tbl$[ebp]
	add	eax, 540				; 0000021cH
	push	eax
	call	_dyntab_order_lines
	add	esp, 4
	test	eax, eax
	je	SHORT $L70658
$L70659:
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29872], OFFSET FLAT:$SG70662
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 301		; 0000012dH
	jmp	$eva_err$70535
$L70658:

; 302  : 		DYNTAB_FIELD_TAB(&tbl->celstyle, tbl->attr, DISPLAY_CELLSTYLE);

	mov	eax, DWORD PTR _tbl$[ebp]
	add	eax, 560				; 00000230H
	push	eax
	call	_dyntab_free
	add	esp, 4
	push	0
	push	-1
	push	OFFSET FLAT:$SG70666
	mov	ecx, DWORD PTR _tbl$[ebp]
	mov	edx, DWORD PTR [ecx]
	push	edx
	push	0
	mov	eax, DWORD PTR _tbl$[ebp]
	add	eax, 560				; 00000230H
	push	eax
	call	_dyntab_filter_field
	add	esp, 24					; 00000018H
	test	eax, eax
	jne	SHORT $L70665
	mov	ecx, DWORD PTR _tbl$[ebp]
	add	ecx, 560				; 00000230H
	push	ecx
	call	_dyntab_order_lines
	add	esp, 4
	test	eax, eax
	je	SHORT $L70664
$L70665:
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29872], OFFSET FLAT:$SG70668
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 302		; 0000012eH
	jmp	$eva_err$70535
$L70664:

; 303  : 		DYNTAB_FIELD_TAB(&tbl->notable, tbl->attr, NO_TMPTABLE);

	mov	ecx, DWORD PTR _tbl$[ebp]
	add	ecx, 620				; 0000026cH
	push	ecx
	call	_dyntab_free
	add	esp, 4
	push	0
	push	-1
	push	OFFSET FLAT:$SG70672
	mov	edx, DWORD PTR _tbl$[ebp]
	mov	eax, DWORD PTR [edx]
	push	eax
	push	0
	mov	ecx, DWORD PTR _tbl$[ebp]
	add	ecx, 620				; 0000026cH
	push	ecx
	call	_dyntab_filter_field
	add	esp, 24					; 00000018H
	test	eax, eax
	jne	SHORT $L70671
	mov	edx, DWORD PTR _tbl$[ebp]
	add	edx, 620				; 0000026cH
	push	edx
	call	_dyntab_order_lines
	add	esp, 4
	test	eax, eax
	je	SHORT $L70670
$L70671:
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29872], OFFSET FLAT:$SG70674
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 303		; 0000012fH
	jmp	$eva_err$70535
$L70670:

; 305  : 	tbl->minsearchlen = strtoul(DYNTAB_FIELD_VAL(tbl->attr, MINSEARCHLEN), NULL, 10);

	push	10					; 0000000aH
	push	0
	push	0
	push	-1
	push	OFFSET FLAT:$SG70676
	mov	edx, DWORD PTR _tbl$[ebp]
	mov	eax, DWORD PTR [edx]
	push	eax
	call	_dyntab_field_val
	add	esp, 16					; 00000010H
	push	eax
	call	_strtoul
	add	esp, 12					; 0000000cH
	mov	ecx, DWORD PTR _tbl$[ebp]
	mov	DWORD PTR [ecx+76], eax

; 306  : 	tbl->colbrk = strtoul(DYNTAB_FIELD_VAL(tbl->attr, COLUMN_LIMIT), NULL, 10);

	push	10					; 0000000aH
	push	0
	push	0
	push	-1
	push	OFFSET FLAT:$SG70678
	mov	edx, DWORD PTR _tbl$[ebp]
	mov	eax, DWORD PTR [edx]
	push	eax
	call	_dyntab_field_val
	add	esp, 16					; 00000010H
	push	eax
	call	_strtoul
	add	esp, 12					; 0000000cH
	mov	ecx, DWORD PTR _tbl$[ebp]
	mov	DWORD PTR [ecx+660], eax

; 307  : 	if(tbl->colbrk > tbl->field.nbrows) tbl->colbrk = 0;

	mov	edx, DWORD PTR _tbl$[ebp]
	mov	eax, DWORD PTR _tbl$[ebp]
	mov	ecx, DWORD PTR [edx+660]
	cmp	ecx, DWORD PTR [eax+380]
	jbe	SHORT $L70679
	mov	edx, DWORD PTR _tbl$[ebp]
	mov	DWORD PTR [edx+660], 0
$L70679:

; 308  : 	if(qry_eval_var_expr_table(cntxt, &tbl->field, tbl->attr)) CLEAR_ERROR;

	mov	eax, DWORD PTR _tbl$[ebp]
	mov	ecx, DWORD PTR [eax]
	push	ecx
	mov	edx, DWORD PTR _tbl$[ebp]
	add	edx, 380				; 0000017cH
	push	edx
	mov	eax, DWORD PTR _cntxt$[ebp]
	push	eax
	call	_qry_eval_var_expr_table
	add	esp, 12					; 0000000cH
	test	eax, eax
	je	SHORT $L70680
	push	308					; 00000134H
	push	OFFSET FLAT:$SG70681
	push	OFFSET FLAT:$SG70682
	mov	ecx, DWORD PTR _cntxt$[ebp]
	push	ecx
	call	_err_clear
	add	esp, 16					; 00000010H
$L70680:

; 309  : 
; 310  : 	/* Read extra filters definition */
; 311  : 	DYNTAB_FIELD_TAB(&tbl->altfilter, tbl->attr, ALTFILTER);

	mov	edx, DWORD PTR _tbl$[ebp]
	add	edx, 260				; 00000104H
	push	edx
	call	_dyntab_free
	add	esp, 4
	push	0
	push	-1
	push	OFFSET FLAT:$SG70686
	mov	eax, DWORD PTR _tbl$[ebp]
	mov	ecx, DWORD PTR [eax]
	push	ecx
	push	0
	mov	edx, DWORD PTR _tbl$[ebp]
	add	edx, 260				; 00000104H
	push	edx
	call	_dyntab_filter_field
	add	esp, 24					; 00000018H
	test	eax, eax
	jne	SHORT $L70685
	mov	eax, DWORD PTR _tbl$[ebp]
	add	eax, 260				; 00000104H
	push	eax
	call	_dyntab_order_lines
	add	esp, 4
	test	eax, eax
	je	SHORT $L70684
$L70685:
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29872], OFFSET FLAT:$SG70688
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 311		; 00000137H
	jmp	$eva_err$70535
$L70684:

; 312  : 	DYNTAB_FIELD_TAB(&tbl->condfilter, tbl->attr, ALTFILTER_FILTER);

	mov	eax, DWORD PTR _tbl$[ebp]
	add	eax, 300				; 0000012cH
	push	eax
	call	_dyntab_free
	add	esp, 4
	push	0
	push	-1
	push	OFFSET FLAT:$SG70692
	mov	ecx, DWORD PTR _tbl$[ebp]
	mov	edx, DWORD PTR [ecx]
	push	edx
	push	0
	mov	eax, DWORD PTR _tbl$[ebp]
	add	eax, 300				; 0000012cH
	push	eax
	call	_dyntab_filter_field
	add	esp, 24					; 00000018H
	test	eax, eax
	jne	SHORT $L70691
	mov	ecx, DWORD PTR _tbl$[ebp]
	add	ecx, 300				; 0000012cH
	push	ecx
	call	_dyntab_order_lines
	add	esp, 4
	test	eax, eax
	je	SHORT $L70690
$L70691:
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29872], OFFSET FLAT:$SG70694
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 312		; 00000138H
	jmp	$eva_err$70535
$L70690:

; 313  : 	DYNTAB_FIELD_TAB(&tbl->typfilter, tbl->attr, ALTFILTER_TYPE);

	mov	ecx, DWORD PTR _tbl$[ebp]
	add	ecx, 280				; 00000118H
	push	ecx
	call	_dyntab_free
	add	esp, 4
	push	0
	push	-1
	push	OFFSET FLAT:$SG70698
	mov	edx, DWORD PTR _tbl$[ebp]
	mov	eax, DWORD PTR [edx]
	push	eax
	push	0
	mov	ecx, DWORD PTR _tbl$[ebp]
	add	ecx, 280				; 00000118H
	push	ecx
	call	_dyntab_filter_field
	add	esp, 24					; 00000018H
	test	eax, eax
	jne	SHORT $L70697
	mov	edx, DWORD PTR _tbl$[ebp]
	add	edx, 280				; 00000118H
	push	edx
	call	_dyntab_order_lines
	add	esp, 4
	test	eax, eax
	je	SHORT $L70696
$L70697:
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29872], OFFSET FLAT:$SG70700
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 313		; 00000139H
	jmp	$eva_err$70535
$L70696:

; 314  : 	DYNTAB_FIELD_TAB(&tbl->groupfilter, tbl->attr, ALTFILTER_GROUP);

	mov	edx, DWORD PTR _tbl$[ebp]
	add	edx, 320				; 00000140H
	push	edx
	call	_dyntab_free
	add	esp, 4
	push	0
	push	-1
	push	OFFSET FLAT:$SG70704
	mov	eax, DWORD PTR _tbl$[ebp]
	mov	ecx, DWORD PTR [eax]
	push	ecx
	push	0
	mov	edx, DWORD PTR _tbl$[ebp]
	add	edx, 320				; 00000140H
	push	edx
	call	_dyntab_filter_field
	add	esp, 24					; 00000018H
	test	eax, eax
	jne	SHORT $L70703
	mov	eax, DWORD PTR _tbl$[ebp]
	add	eax, 320				; 00000140H
	push	eax
	call	_dyntab_order_lines
	add	esp, 4
	test	eax, eax
	je	SHORT $L70702
$L70703:
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29872], OFFSET FLAT:$SG70706
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 314		; 0000013aH
	jmp	$eva_err$70535
$L70702:

; 315  : 
; 316  : 	/* Handle field indirection */
; 317  : 	for(i = 0; i < tbl->field.nbrows; i++)

	mov	DWORD PTR _i$[ebp], 0
	jmp	SHORT $L70707
$L70708:
	mov	eax, DWORD PTR _i$[ebp]
	add	eax, 1
	mov	DWORD PTR _i$[ebp], eax
$L70707:
	mov	ecx, DWORD PTR _tbl$[ebp]
	mov	edx, DWORD PTR _i$[ebp]
	cmp	edx, DWORD PTR [ecx+380]
	jae	SHORT $L70709

; 318  : 		if(!strcmp(dyntab_val(&tbl->format, i, 0), "_EVA_FIELDLIST"))

	push	OFFSET FLAT:$SG70711
	push	0
	mov	eax, DWORD PTR _i$[ebp]
	push	eax
	mov	ecx, DWORD PTR _tbl$[ebp]
	add	ecx, 400				; 00000190H
	push	ecx
	call	_dyntab_val
	add	esp, 12					; 0000000cH
	push	eax
	call	_strcmp
	add	esp, 8
	test	eax, eax
	jne	SHORT $L70710

; 320  : 			if(table_insert_fieldlist(cntxt, i_ctrl, i, &offset)) STACK_ERROR;

	lea	edx, DWORD PTR _offset$[ebp]
	push	edx
	mov	eax, DWORD PTR _i$[ebp]
	push	eax
	mov	ecx, DWORD PTR _i_ctrl$[ebp]
	push	ecx
	mov	edx, DWORD PTR _cntxt$[ebp]
	push	edx
	call	_table_insert_fieldlist
	add	esp, 16					; 00000010H
	test	eax, eax
	je	SHORT $L70712
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 320		; 00000140H
	jmp	$eva_err$70535
$L70712:

; 321  : 			i += offset;

	mov	ecx, DWORD PTR _i$[ebp]
	add	ecx, DWORD PTR _offset$[ebp]
	mov	DWORD PTR _i$[ebp], ecx
$L70710:

; 323  : 
; 324  : 	/* Retrieve list tools status */
; 325  : 	if(cgi_get_subfield(cntxt, &tbl->selfilter, ctrl, "SELFILTER", 1, 0, 0)) STACK_ERROR;

	jmp	SHORT $L70708
$L70709:
	push	0
	push	0
	push	1
	push	OFFSET FLAT:$SG70714
	mov	edx, DWORD PTR _ctrl$[ebp]
	push	edx
	mov	eax, DWORD PTR _tbl$[ebp]
	add	eax, 340				; 00000154H
	push	eax
	mov	ecx, DWORD PTR _cntxt$[ebp]
	push	ecx
	call	_cgi_get_subfield
	add	esp, 28					; 0000001cH
	test	eax, eax
	je	SHORT $L70713
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 325		; 00000145H
	jmp	$eva_err$70535
$L70713:

; 326  : 	if(dyntab_order_lines(&tbl->cgiinput)) RETURN_ERR_MEMORY;

	mov	eax, DWORD PTR _tbl$[ebp]
	add	eax, 80					; 00000050H
	push	eax
	call	_dyntab_order_lines
	add	esp, 4
	test	eax, eax
	je	SHORT $L70715
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29872], OFFSET FLAT:$SG70717
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 326		; 00000146H
	jmp	$eva_err$70535
$L70715:

; 327  : 	CTRL_GET_CGI_SUBFIELD1("STATUS");

	push	0
	push	0
	push	1
	push	OFFSET FLAT:$SG70719
	mov	eax, DWORD PTR _ctrl$[ebp]
	push	eax
	lea	ecx, DWORD PTR _cgival$[ebp]
	push	ecx
	mov	edx, DWORD PTR _cntxt$[ebp]
	push	edx
	call	_cgi_get_subfield
	add	esp, 28					; 0000001cH
	test	eax, eax
	je	SHORT $L70718
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 327		; 00000147H
	jmp	$eva_err$70535
$L70718:

; 328  : 	b_sts = cgival.nbrows != 0;

	xor	ecx, ecx
	cmp	DWORD PTR _cgival$[ebp], 0
	setne	cl
	mov	DWORD PTR _b_sts$[ebp], ecx

; 329  : 	if(b_sts)

	cmp	DWORD PTR _b_sts$[ebp], 0
	je	SHORT $L70720

; 330  : 		sscanf(dyntab_val(&cgival, 0, 0), "%d,%lu,%lu,%lu,%d,%lu,%lu,%u",
; 331  : 			&tbl->status, &tbl->line, &tbl->lines, &tbl->sortcol, &tbl->b_sortdesc, &tbl->srchcol, &tbl->ctrlline, &tbl->srchmode);

	mov	edx, DWORD PTR _tbl$[ebp]
	add	edx, 72					; 00000048H
	push	edx
	mov	eax, DWORD PTR _tbl$[ebp]
	add	eax, 56					; 00000038H
	push	eax
	mov	ecx, DWORD PTR _tbl$[ebp]
	add	ecx, 124				; 0000007cH
	push	ecx
	mov	edx, DWORD PTR _tbl$[ebp]
	add	edx, 64					; 00000040H
	push	edx
	mov	eax, DWORD PTR _tbl$[ebp]
	add	eax, 60					; 0000003cH
	push	eax
	mov	ecx, DWORD PTR _tbl$[ebp]
	add	ecx, 44					; 0000002cH
	push	ecx
	mov	edx, DWORD PTR _tbl$[ebp]
	add	edx, 40					; 00000028H
	push	edx
	mov	eax, DWORD PTR _tbl$[ebp]
	add	eax, 32					; 00000020H
	push	eax
	push	OFFSET FLAT:$SG70721
	push	0
	push	0
	lea	ecx, DWORD PTR _cgival$[ebp]
	push	ecx
	call	_dyntab_val
	add	esp, 12					; 0000000cH
	push	eax
	call	_sscanf
	add	esp, 40					; 00000028H
$L70720:

; 332  : 
; 333  : 	/* Handle search function */
; 334  : 	tablesearch = DYNTAB_FIELD_VAL(data, TABLESEARCH);

	push	0
	push	-1
	push	OFFSET FLAT:$SG70722
	mov	edx, DWORD PTR _data$[ebp]
	push	edx
	call	_dyntab_field_val
	add	esp, 16					; 00000010H
	mov	DWORD PTR _tablesearch$[ebp], eax

; 335  : 	if(!strcmp(tablesearch, "_EVA_EXTCTRL"))

	push	OFFSET FLAT:$SG70724
	mov	eax, DWORD PTR _tablesearch$[ebp]
	push	eax
	call	_strcmp
	add	esp, 8
	test	eax, eax
	jne	$L70723

; 337  : 		if(cgi_filter_values(cntxt, &tbl->cgiinput, 'D', ~0UL, DYNTAB_TOUL(&form->id_form), DYNTAB_TOUL(&form->id_obj), "_EVA_SEARCHINPUT", "", 0, 0)) STACK_ERROR;

	push	0
	push	0
	push	OFFSET FLAT:$SG70728
	push	OFFSET FLAT:$SG70729
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
	push	eax
	push	10					; 0000000aH
	push	0
	push	0
	push	0
	mov	edx, DWORD PTR _form$[ebp]
	add	edx, 12					; 0000000cH
	push	edx
	call	_dyntab_val
	add	esp, 12					; 0000000cH
	push	eax
	call	_strtoul
	add	esp, 12					; 0000000cH
	push	eax
	push	-1
	push	68					; 00000044H
	mov	eax, DWORD PTR _tbl$[ebp]
	add	eax, 80					; 00000050H
	push	eax
	mov	ecx, DWORD PTR _cntxt$[ebp]
	push	ecx
	call	_cgi_filter_values
	add	esp, 40					; 00000028H
	test	eax, eax
	je	SHORT $L70727
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 337		; 00000151H
	jmp	$eva_err$70535
$L70727:

; 338  : 		dyntab_sort(&tbl->cgiinput, qsort_col0desc);

	push	OFFSET FLAT:_qsort_col0desc
	mov	eax, DWORD PTR _tbl$[ebp]
	add	eax, 80					; 00000050H
	push	eax
	call	_dyntab_sort
	add	esp, 8

; 339  : 		tbl->status |= TblCtrl_extsearch | TblCtrl_opensearch;

	mov	ecx, DWORD PTR _tbl$[ebp]
	mov	edx, DWORD PTR [ecx+32]
	or	edx, 8224				; 00002020H
	mov	eax, DWORD PTR _tbl$[ebp]
	mov	DWORD PTR [eax+32], edx

; 340  : 		if(cgi_filter_values(cntxt, &cgival, 'D', ~0UL, DYNTAB_TOUL(&form->id_form), DYNTAB_TOUL(&form->id_obj), "_EVA_SEARCHMODE", "", 0, 0)) STACK_ERROR;

	push	0
	push	0
	push	OFFSET FLAT:$SG70733
	push	OFFSET FLAT:$SG70734
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
	push	eax
	push	10					; 0000000aH
	push	0
	push	0
	push	0
	mov	edx, DWORD PTR _form$[ebp]
	add	edx, 12					; 0000000cH
	push	edx
	call	_dyntab_val
	add	esp, 12					; 0000000cH
	push	eax
	call	_strtoul
	add	esp, 12					; 0000000cH
	push	eax
	push	-1
	push	68					; 00000044H
	lea	eax, DWORD PTR _cgival$[ebp]
	push	eax
	mov	ecx, DWORD PTR _cntxt$[ebp]
	push	ecx
	call	_cgi_filter_values
	add	esp, 40					; 00000028H
	test	eax, eax
	je	SHORT $L70732
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 340		; 00000154H
	jmp	$eva_err$70535
$L70732:

; 341  : 		dyntab_group(&cgival, "MAX");

	push	OFFSET FLAT:$SG70735
	lea	eax, DWORD PTR _cgival$[ebp]
	push	eax
	call	_dyntab_group
	add	esp, 8

; 342  : 		if(cgival.nbrows && cgival.cell->txt)

	cmp	DWORD PTR _cgival$[ebp], 0
	je	SHORT $L70736
	mov	ecx, DWORD PTR _cgival$[ebp+16]
	cmp	DWORD PTR [ecx], 0
	je	SHORT $L70736

; 344  : 			tbl->srchmode =  !strcmp(cgival.cell->txt, "_EVA_BEGIN") ? Begin :
; 345  : 							!strcmp(cgival.cell->txt, "_EVA_EXACT") ? Exact : Contain;

	push	OFFSET FLAT:$SG70737
	mov	edx, DWORD PTR _cgival$[ebp+16]
	mov	eax, DWORD PTR [edx]
	push	eax
	call	_strcmp
	add	esp, 8
	test	eax, eax
	jne	SHORT $L71029
	mov	DWORD PTR -124+[ebp], 13		; 0000000dH
	jmp	SHORT $L71030
$L71029:
	push	OFFSET FLAT:$SG70738
	mov	ecx, DWORD PTR _cgival$[ebp+16]
	mov	edx, DWORD PTR [ecx]
	push	edx
	call	_strcmp
	add	esp, 8
	neg	eax
	sbb	eax, eax
	and	eax, 5
	add	eax, 6
	mov	DWORD PTR -124+[ebp], eax
$L71030:
	mov	eax, DWORD PTR _tbl$[ebp]
	mov	ecx, DWORD PTR -124+[ebp]
	mov	DWORD PTR [eax+72], ecx
$L70736:

; 348  : 	else

	jmp	SHORT $L70740
$L70723:

; 349  : 		if(cgi_get_subfield(cntxt, &tbl->cgiinput, ctrl, "INPUT", 1, 0, 0)) STACK_ERROR;

	push	0
	push	0
	push	1
	push	OFFSET FLAT:$SG70741
	mov	edx, DWORD PTR _ctrl$[ebp]
	push	edx
	mov	eax, DWORD PTR _tbl$[ebp]
	add	eax, 80					; 00000050H
	push	eax
	mov	ecx, DWORD PTR _cntxt$[ebp]
	push	ecx
	call	_cgi_get_subfield
	add	esp, 28					; 0000001cH
	test	eax, eax
	je	SHORT $L70740
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 349		; 0000015dH
	jmp	$eva_err$70535
$L70740:

; 350  : 
; 351  : 	/* Enable functions depending on control attributes */
; 352  : 	tbl->inputwidth = ctrl->COLUMNS ? ctrl->COLUMNS : 15;

	mov	eax, DWORD PTR _ctrl$[ebp]
	cmp	DWORD PTR [eax+380], 0
	je	SHORT $L71031
	mov	ecx, DWORD PTR _ctrl$[ebp]
	mov	edx, DWORD PTR [ecx+380]
	mov	DWORD PTR -128+[ebp], edx
	jmp	SHORT $L71032
$L71031:
	mov	DWORD PTR -128+[ebp], 15		; 0000000fH
$L71032:
	mov	eax, DWORD PTR _tbl$[ebp]
	mov	ecx, DWORD PTR -128+[ebp]
	mov	DWORD PTR [eax+136], ecx

; 353  : 	tbl->status &= ~(TblCtrl_addnew|TblCtrl_openbtn|TblCtrl_search|TblCtrl_sel);

	mov	edx, DWORD PTR _tbl$[ebp]
	mov	eax, DWORD PTR [edx+32]
	and	eax, -2385				; fffff6afH
	mov	ecx, DWORD PTR _tbl$[ebp]
	mov	DWORD PTR [ecx+32], eax

; 354  : 	if(*insert && strcmp(insert, "0") && (DYNTAB_FIELD_CELL(tbl->attr, LIST_CREATE_FORM) || DYNTAB_FIELD_CELL(tbl->attr, BASE_FORMS)))

	mov	edx, DWORD PTR _insert$[ebp]
	movsx	eax, BYTE PTR [edx]
	test	eax, eax
	je	SHORT $L70742
	push	OFFSET FLAT:$SG70743
	mov	ecx, DWORD PTR _insert$[ebp]
	push	ecx
	call	_strcmp
	add	esp, 8
	test	eax, eax
	je	SHORT $L70742
	push	0
	push	-1
	push	OFFSET FLAT:$SG70745
	mov	edx, DWORD PTR _tbl$[ebp]
	mov	eax, DWORD PTR [edx]
	push	eax
	call	_dyntab_field_cell
	add	esp, 16					; 00000010H
	test	eax, eax
	jne	SHORT $L70744
	push	0
	push	-1
	push	OFFSET FLAT:$SG70746
	mov	ecx, DWORD PTR _tbl$[ebp]
	mov	edx, DWORD PTR [ecx]
	push	edx
	call	_dyntab_field_cell
	add	esp, 16					; 00000010H
	test	eax, eax
	je	SHORT $L70742
$L70744:

; 355  : 		tbl->status |= TblCtrl_addnew;

	mov	eax, DWORD PTR _tbl$[ebp]
	mov	ecx, DWORD PTR [eax+32]
	or	ecx, 64					; 00000040H
	mov	edx, DWORD PTR _tbl$[ebp]
	mov	DWORD PTR [edx+32], ecx
$L70742:

; 356  : 	if(strcmp(DYNTAB_FIELD_VAL(tbl->attr, OPENBUTTON), "_EVA_NONE"))

	push	OFFSET FLAT:$SG70748
	push	0
	push	-1
	push	OFFSET FLAT:$SG70749
	mov	eax, DWORD PTR _tbl$[ebp]
	mov	ecx, DWORD PTR [eax]
	push	ecx
	call	_dyntab_field_val
	add	esp, 16					; 00000010H
	push	eax
	call	_strcmp
	add	esp, 8
	test	eax, eax
	je	SHORT $L70747

; 357  : 		tbl->status |= TblCtrl_openbtn;

	mov	edx, DWORD PTR _tbl$[ebp]
	mov	eax, DWORD PTR [edx+32]
	or	ah, 8
	mov	ecx, DWORD PTR _tbl$[ebp]
	mov	DWORD PTR [ecx+32], eax
$L70747:

; 358  : 	if(*tablesearch ? strcmp(tablesearch, "_EVA_NONE") : strcmp(CTRL_ATTR_VAL(PAGE_CTRL), "0"))

	mov	edx, DWORD PTR _tablesearch$[ebp]
	movsx	eax, BYTE PTR [edx]
	test	eax, eax
	je	SHORT $L71035
	push	OFFSET FLAT:$SG70751
	mov	ecx, DWORD PTR _tablesearch$[ebp]
	push	ecx
	call	_strcmp
	add	esp, 8
	mov	DWORD PTR -132+[ebp], eax
	jmp	SHORT $L71036
$L71035:
	cmp	DWORD PTR _ctrl$[ebp], 0
	je	SHORT $L71033
	push	0
	push	-1
	push	OFFSET FLAT:$SG70753
	mov	edx, DWORD PTR _ctrl$[ebp]
	add	edx, 44					; 0000002cH
	push	edx
	call	_dyntab_field_val
	add	esp, 16					; 00000010H
	mov	DWORD PTR -136+[ebp], eax
	jmp	SHORT $L71034
$L71033:
	mov	DWORD PTR -136+[ebp], OFFSET FLAT:$SG70754
$L71034:
	push	OFFSET FLAT:$SG70752
	mov	eax, DWORD PTR -136+[ebp]
	push	eax
	call	_strcmp
	add	esp, 8
	mov	DWORD PTR -132+[ebp], eax
$L71036:
	cmp	DWORD PTR -132+[ebp], 0
	je	SHORT $L70750

; 359  : 		tbl->status |= TblCtrl_search;

	mov	ecx, DWORD PTR _tbl$[ebp]
	mov	edx, DWORD PTR [ecx+32]
	or	edx, 16					; 00000010H
	mov	eax, DWORD PTR _tbl$[ebp]
	mov	DWORD PTR [eax+32], edx
$L70750:

; 360  : 	if(!strcmp(ctrl->CONTROL, "_EVA_INPUT"))

	push	OFFSET FLAT:$SG70756
	mov	ecx, DWORD PTR _ctrl$[ebp]
	mov	edx, DWORD PTR [ecx+272]
	push	edx
	call	_strcmp
	add	esp, 8
	test	eax, eax
	jne	SHORT $L70757

; 362  : 		tbl->status |= TblCtrl_sel;

	mov	eax, DWORD PTR _tbl$[ebp]
	mov	ecx, DWORD PTR [eax+32]
	or	ch, 1
	mov	edx, DWORD PTR _tbl$[ebp]
	mov	DWORD PTR [edx+32], ecx

; 363  : 		if(!strcmp(tablesearch, "_EVA_NONE") && !strcmp(ctrl->TYPE, "_EVA_RELATION")) tbl->status |= TblCtrl_opensel;

	push	OFFSET FLAT:$SG70758
	mov	eax, DWORD PTR _tablesearch$[ebp]
	push	eax
	call	_strcmp
	add	esp, 8
	test	eax, eax
	jne	SHORT $L70757
	push	OFFSET FLAT:$SG70759
	mov	ecx, DWORD PTR _ctrl$[ebp]
	mov	edx, DWORD PTR [ecx+276]
	push	edx
	call	_strcmp
	add	esp, 8
	test	eax, eax
	jne	SHORT $L70757
	mov	eax, DWORD PTR _tbl$[ebp]
	mov	ecx, DWORD PTR [eax+32]
	or	ch, 2
	mov	edx, DWORD PTR _tbl$[ebp]
	mov	DWORD PTR [edx+32], ecx
$L70757:

; 365  : 	tbl->b_sortsel = CTRL_ATTR_CELL(MULTIPLE_AUTO_ORDER) != 0;

	cmp	DWORD PTR _ctrl$[ebp], 0
	je	SHORT $L71037
	push	0
	push	-1
	push	OFFSET FLAT:$SG70761
	mov	eax, DWORD PTR _ctrl$[ebp]
	add	eax, 44					; 0000002cH
	push	eax
	call	_dyntab_field_cell
	add	esp, 16					; 00000010H
	mov	DWORD PTR -140+[ebp], eax
	jmp	SHORT $L71038
$L71037:
	mov	DWORD PTR -140+[ebp], 0
$L71038:
	xor	ecx, ecx
	cmp	DWORD PTR -140+[ebp], 0
	setne	cl
	mov	edx, DWORD PTR _tbl$[ebp]
	mov	DWORD PTR [edx+68], ecx

; 366  : 	if(*CTRL_ATTR_VAL(NOTABLESORT) != '1') tbl->status |= TblCtrl_sort;

	cmp	DWORD PTR _ctrl$[ebp], 0
	je	SHORT $L71039
	push	0
	push	-1
	push	OFFSET FLAT:$SG70763
	mov	eax, DWORD PTR _ctrl$[ebp]
	add	eax, 44					; 0000002cH
	push	eax
	call	_dyntab_field_val
	add	esp, 16					; 00000010H
	mov	DWORD PTR -144+[ebp], eax
	jmp	SHORT $L71040
$L71039:
	mov	DWORD PTR -144+[ebp], OFFSET FLAT:$SG70764
$L71040:
	mov	ecx, DWORD PTR -144+[ebp]
	movsx	edx, BYTE PTR [ecx]
	cmp	edx, 49					; 00000031H
	je	SHORT $L70762
	mov	eax, DWORD PTR _tbl$[ebp]
	mov	ecx, DWORD PTR [eax+32]
	or	ecx, 1
	mov	edx, DWORD PTR _tbl$[ebp]
	mov	DWORD PTR [edx+32], ecx
$L70762:

; 367  : 
; 368  : 	/* Initialize status if first call */
; 369  : 	if(!b_sts)

	cmp	DWORD PTR _b_sts$[ebp], 0
	jne	$L70765

; 371  : 		DynTableCell *sortcol = DYNTAB_FIELD_CELL(tbl->attr, SORTCOL);

	push	0
	push	-1
	push	OFFSET FLAT:$SG70767
	mov	eax, DWORD PTR _tbl$[ebp]
	mov	ecx, DWORD PTR [eax]
	push	ecx
	call	_dyntab_field_cell
	add	esp, 16					; 00000010H
	mov	DWORD PTR _sortcol$70766[ebp], eax

; 372  : 		DynTableCell *ae = DYNTAB_FIELD_CELL(tbl->attr, ALLOWEMPTY);

	push	0
	push	-1
	push	OFFSET FLAT:$SG70769
	mov	edx, DWORD PTR _tbl$[ebp]
	mov	eax, DWORD PTR [edx]
	push	eax
	call	_dyntab_field_cell
	add	esp, 16					; 00000010H
	mov	DWORD PTR _ae$70768[ebp], eax

; 373  : 		char *initsearch = DYNTAB_FIELD_VAL(tbl->attr, INIT_SEARCH_MODE);

	push	0
	push	-1
	push	OFFSET FLAT:$SG70771
	mov	ecx, DWORD PTR _tbl$[ebp]
	mov	edx, DWORD PTR [ecx]
	push	edx
	call	_dyntab_field_val
	add	esp, 16					; 00000010H
	mov	DWORD PTR _initsearch$70770[ebp], eax

; 374  : 		tbl->b_first = 1;

	mov	eax, DWORD PTR _tbl$[ebp]
	mov	DWORD PTR [eax+132], 1

; 375  : 		tbl->srchmode = !strcmp(initsearch, "_EVA_BEGIN") ? Begin :
; 376  : 						!strcmp(initsearch, "_EVA_EXACT") ? Exact : Contain;

	push	OFFSET FLAT:$SG70772
	mov	ecx, DWORD PTR _initsearch$70770[ebp]
	push	ecx
	call	_strcmp
	add	esp, 8
	test	eax, eax
	jne	SHORT $L71041
	mov	DWORD PTR -148+[ebp], 13		; 0000000dH
	jmp	SHORT $L71042
$L71041:
	push	OFFSET FLAT:$SG70773
	mov	edx, DWORD PTR _initsearch$70770[ebp]
	push	edx
	call	_strcmp
	add	esp, 8
	neg	eax
	sbb	eax, eax
	and	eax, 5
	add	eax, 6
	mov	DWORD PTR -148+[ebp], eax
$L71042:
	mov	eax, DWORD PTR _tbl$[ebp]
	mov	ecx, DWORD PTR -148+[ebp]
	mov	DWORD PTR [eax+72], ecx

; 377  : 		if(sortcol)

	cmp	DWORD PTR _sortcol$70766[ebp], 0
	je	SHORT $L70777

; 379  : 			if(sortcol->txt) tbl->sortcol = atoi(sortcol->txt);

	mov	edx, DWORD PTR _sortcol$70766[ebp]
	cmp	DWORD PTR [edx], 0
	je	SHORT $L70775
	mov	eax, DWORD PTR _sortcol$70766[ebp]
	mov	ecx, DWORD PTR [eax]
	push	ecx
	call	_atoi
	add	esp, 4
	mov	edx, DWORD PTR _tbl$[ebp]
	mov	DWORD PTR [edx+60], eax
$L70775:

; 380  : 			if(tbl->sortcol) tbl->sortcol--;

	mov	eax, DWORD PTR _tbl$[ebp]
	cmp	DWORD PTR [eax+60], 0
	je	SHORT $L70776
	mov	ecx, DWORD PTR _tbl$[ebp]
	mov	edx, DWORD PTR [ecx+60]
	sub	edx, 1
	mov	eax, DWORD PTR _tbl$[ebp]
	mov	DWORD PTR [eax+60], edx

; 381  : 			else tbl->sortcol = ~0UL;

	jmp	SHORT $L70777
$L70776:
	mov	ecx, DWORD PTR _tbl$[ebp]
	mov	DWORD PTR [ecx+60], -1
$L70777:

; 383  : 		if(!strcmp("_EVA_SEARCHONLOAD", tablesearch) ||
; 384  : 			(!strcmp("_EVA_SEARCHONLOAD_NEW", tablesearch) && form->b_newobj) ||
; 385  : 			(!strcmp("_EVA_SEARCHONLOAD_EMPTY", tablesearch) && !ctrl->val.nbrows))

	mov	edx, DWORD PTR _tablesearch$[ebp]
	push	edx
	push	OFFSET FLAT:$SG70780
	call	_strcmp
	add	esp, 8
	test	eax, eax
	je	SHORT $L70779
	mov	eax, DWORD PTR _tablesearch$[ebp]
	push	eax
	push	OFFSET FLAT:$SG70782
	call	_strcmp
	add	esp, 8
	test	eax, eax
	jne	SHORT $L70781
	mov	ecx, DWORD PTR _form$[ebp]
	cmp	DWORD PTR [ecx+72], 0
	jne	SHORT $L70779
$L70781:
	mov	edx, DWORD PTR _tablesearch$[ebp]
	push	edx
	push	OFFSET FLAT:$SG70783
	call	_strcmp
	add	esp, 8
	test	eax, eax
	jne	SHORT $L70778
	mov	eax, DWORD PTR _ctrl$[ebp]
	cmp	DWORD PTR [eax+64], 0
	jne	SHORT $L70778
$L70779:

; 386  : 			tbl->status |= TblCtrl_opensearch;

	mov	ecx, DWORD PTR _tbl$[ebp]
	mov	edx, DWORD PTR [ecx+32]
	or	edx, 32					; 00000020H
	mov	eax, DWORD PTR _tbl$[ebp]
	mov	DWORD PTR [eax+32], edx
$L70778:

; 387  : 		if(tbl->status & TblCtrl_sel && strcmp(ctrl->TYPE, "_EVA_FILEUPLOAD") && (
; 388  : 				tbl->status & TblCtrl_opensearch || (ae && strcmp(ae->txt, "Yes") && strcmp(ae->txt, "_EVA_CONDITION") && !ctrl->val.nbrows)) )

	mov	ecx, DWORD PTR _tbl$[ebp]
	mov	edx, DWORD PTR [ecx+32]
	and	edx, 256				; 00000100H
	test	edx, edx
	je	$L70789
	push	OFFSET FLAT:$SG70785
	mov	eax, DWORD PTR _ctrl$[ebp]
	mov	ecx, DWORD PTR [eax+276]
	push	ecx
	call	_strcmp
	add	esp, 8
	test	eax, eax
	je	SHORT $L70789
	mov	edx, DWORD PTR _tbl$[ebp]
	mov	eax, DWORD PTR [edx+32]
	and	eax, 32					; 00000020H
	test	eax, eax
	jne	SHORT $L70786
	cmp	DWORD PTR _ae$70768[ebp], 0
	je	SHORT $L70789
	push	OFFSET FLAT:$SG70787
	mov	ecx, DWORD PTR _ae$70768[ebp]
	mov	edx, DWORD PTR [ecx]
	push	edx
	call	_strcmp
	add	esp, 8
	test	eax, eax
	je	SHORT $L70789
	push	OFFSET FLAT:$SG70788
	mov	eax, DWORD PTR _ae$70768[ebp]
	mov	ecx, DWORD PTR [eax]
	push	ecx
	call	_strcmp
	add	esp, 8
	test	eax, eax
	je	SHORT $L70789
	mov	edx, DWORD PTR _ctrl$[ebp]
	cmp	DWORD PTR [edx+64], 0
	jne	SHORT $L70789
$L70786:

; 390  : 			tbl->status |= TblCtrl_opensel;

	mov	eax, DWORD PTR _tbl$[ebp]
	mov	ecx, DWORD PTR [eax+32]
	or	ch, 2
	mov	edx, DWORD PTR _tbl$[ebp]
	mov	DWORD PTR [edx+32], ecx

; 391  : 			if(tbl->status & TblCtrl_search) tbl->status |= TblCtrl_opensearch;

	mov	eax, DWORD PTR _tbl$[ebp]
	mov	ecx, DWORD PTR [eax+32]
	and	ecx, 16					; 00000010H
	test	ecx, ecx
	je	SHORT $L70789
	mov	edx, DWORD PTR _tbl$[ebp]
	mov	eax, DWORD PTR [edx+32]
	or	al, 32					; 00000020H
	mov	ecx, DWORD PTR _tbl$[ebp]
	mov	DWORD PTR [ecx+32], eax
$L70789:

; 393  : 		tbl->lines = strtoul(DYNTAB_FIELD_VAL(tbl->attr, LINES), NULL, 10);

	push	10					; 0000000aH
	push	0
	push	0
	push	-1
	push	OFFSET FLAT:$SG70791
	mov	edx, DWORD PTR _tbl$[ebp]
	mov	eax, DWORD PTR [edx]
	push	eax
	call	_dyntab_field_val
	add	esp, 16					; 00000010H
	push	eax
	call	_strtoul
	add	esp, 12					; 0000000cH
	mov	ecx, DWORD PTR _tbl$[ebp]
	mov	DWORD PTR [ecx+44], eax

; 394  : 		if(!tbl->lines) tbl->lines = ctrl->LINES ? ctrl->LINES : 5;

	mov	edx, DWORD PTR _tbl$[ebp]
	cmp	DWORD PTR [edx+44], 0
	jne	SHORT $L70792
	mov	eax, DWORD PTR _ctrl$[ebp]
	cmp	DWORD PTR [eax+376], 0
	je	SHORT $L71043
	mov	ecx, DWORD PTR _ctrl$[ebp]
	mov	edx, DWORD PTR [ecx+376]
	mov	DWORD PTR -152+[ebp], edx
	jmp	SHORT $L71044
$L71043:
	mov	DWORD PTR -152+[ebp], 5
$L71044:
	mov	eax, DWORD PTR _tbl$[ebp]
	mov	ecx, DWORD PTR -152+[ebp]
	mov	DWORD PTR [eax+44], ecx
$L70792:

; 395  : 		tbl->b_sortdesc = atoi(DYNTAB_FIELD_VAL(tbl->attr, SORTDESC));

	push	0
	push	-1
	push	OFFSET FLAT:$SG70793
	mov	edx, DWORD PTR _tbl$[ebp]
	mov	eax, DWORD PTR [edx]
	push	eax
	call	_dyntab_field_val
	add	esp, 16					; 00000010H
	push	eax
	call	_atoi
	add	esp, 4
	mov	ecx, DWORD PTR _tbl$[ebp]
	mov	DWORD PTR [ecx+64], eax
$L70765:

; 397  : 	tbl->srchfmt = "";

	mov	edx, DWORD PTR _tbl$[ebp]
	mov	DWORD PTR [edx+128], OFFSET FLAT:$SG70794
$eva_noerr$70795:

; 398  : 
; 399  : 	RETURN_OK_CLEANUP;

	push	0
	push	OFFSET FLAT:$SG70796
	push	OFFSET FLAT:$SG70797
	mov	eax, DWORD PTR _cntxt$[ebp]
	push	eax
	call	_err_clear
	add	esp, 16					; 00000010H
$eva_err$70535:
	mov	ecx, DWORD PTR _cntxt$[ebp]
	cmp	DWORD PTR [ecx+29872], 0
	je	SHORT $L70798
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	eax, DWORD PTR [edx+29900]
	push	eax
	push	OFFSET FLAT:$SG70799
	push	OFFSET FLAT:$SG70800
	mov	ecx, DWORD PTR _cntxt$[ebp]
	push	ecx
	call	_err_add_context
	add	esp, 16					; 00000010H
$L70798:
	lea	edx, DWORD PTR _cgival$[ebp]
	push	edx
	call	_dyntab_free
	add	esp, 4
	lea	eax, DWORD PTR _listctrl$[ebp]
	push	eax
	call	_dyntab_free
	add	esp, 4
	mov	ecx, DWORD PTR _cntxt$[ebp]
	xor	eax, eax
	cmp	DWORD PTR [ecx+29872], 0
	setne	al

; 400  : }

	mov	esp, ebp
	pop	ebp
	ret	0
_table_read_controls ENDP
_TEXT	ENDS
PUBLIC	_table_read_obj_list
EXTRN	__snprintf:NEAR
EXTRN	_sql_exec_query:NEAR
EXTRN	_qry_list_data:NEAR
EXTRN	_sql_get_table:NEAR
_BSS	SEGMENT
	ALIGN	4

$SG70827 DB	01H DUP (?)
_BSS	ENDS
_DATA	SEGMENT
$SG70822 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70826 DB	'DESC', 00H
	ORG $+3
$SG70828 DB	'SELECT DISTINCT IdObj FROM IdList ORDER BY IdObj %s LIMI'
	DB	'T %lu,%lu', 00H
	ORG $+2
$SG70831 DB	'D:\Travail\ABI\EVA\V4.0\CGI\Brunix-2016\table_export.c', 00H
	ORG $+1
$SG70832 DB	'table_read_obj_list', 00H
$SG70835 DB	'DROP TABLE IF EXISTS IdList,ValList,IdListMatch', 00H
$SG70836 DB	'D:\Travail\ABI\EVA\V4.0\CGI\Brunix-2016\table_export.c', 00H
	ORG $+1
$SG70837 DB	'table_read_obj_list', 00H
$SG70839 DB	'D:\Travail\ABI\EVA\V4.0\CGI\Brunix-2016\table_export.c', 00H
	ORG $+1
$SG70840 DB	'table_read_obj_list', 00H
$SG70842 DB	'D:\Travail\ABI\EVA\V4.0\CGI\Brunix-2016\table_export.c', 00H
	ORG $+1
$SG70843 DB	'table_read_obj_list', 00H
_DATA	ENDS
_TEXT	SEGMENT
_cntxt$ = 8
_i_ctrl$ = 12
_b_selobj$ = 16
_form$ = -4
_ctrl$ = -16
_tbl$ = -8
_i$ = -12
_qry$70825 = -272
_table_read_obj_list PROC NEAR

; 414  : ){

	push	ebp
	mov	ebp, esp
	sub	esp, 276				; 00000114H
	push	edi

; 415  : 	EVA_form *form = cntxt->form;

	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	ecx, DWORD PTR [eax+80]
	mov	DWORD PTR _form$[ebp], ecx

; 416  : 	EVA_ctrl *ctrl = form->ctrl + i_ctrl;

	mov	edx, DWORD PTR _i_ctrl$[ebp]
	imul	edx, 480				; 000001e0H
	mov	eax, DWORD PTR _form$[ebp]
	mov	ecx, DWORD PTR [eax]
	add	ecx, edx
	mov	DWORD PTR _ctrl$[ebp], ecx

; 417  : 	ObjTableFormat *tbl = ctrl->objtbl;

	mov	edx, DWORD PTR _ctrl$[ebp]
	mov	eax, DWORD PTR [edx+232]
	mov	DWORD PTR _tbl$[ebp], eax

; 418  : 	unsigned long i;
; 419  : 
; 420  : 	if(!tbl->idobj.nbrows && tbl->totlines)

	mov	ecx, DWORD PTR _tbl$[ebp]
	cmp	DWORD PTR [ecx+184], 0
	jne	$L70829
	mov	edx, DWORD PTR _tbl$[ebp]
	cmp	DWORD PTR [edx+52], 0
	je	$L70829

; 422  : 		if(b_selobj)

	cmp	DWORD PTR _b_selobj$[ebp], 0
	je	$L70816

; 424  : 			/* Copy selected objects in display list */
; 425  : 			for(i = 0; i < tbl->lines && i + tbl->line < ctrl->val.nbrows; i++)

	mov	DWORD PTR _i$[ebp], 0
	jmp	SHORT $L70817
$L70818:
	mov	eax, DWORD PTR _i$[ebp]
	add	eax, 1
	mov	DWORD PTR _i$[ebp], eax
$L70817:
	mov	ecx, DWORD PTR _tbl$[ebp]
	mov	edx, DWORD PTR _i$[ebp]
	cmp	edx, DWORD PTR [ecx+44]
	jae	SHORT $L70819
	mov	eax, DWORD PTR _tbl$[ebp]
	mov	ecx, DWORD PTR _i$[ebp]
	add	ecx, DWORD PTR [eax+40]
	mov	edx, DWORD PTR _ctrl$[ebp]
	cmp	ecx, DWORD PTR [edx+64]
	jae	SHORT $L70819

; 426  : 				DYNTAB_SET_CELL(&tbl->idobj, i, 0, &ctrl->val, i + tbl->line, 0);

	push	0
	push	0
	mov	eax, DWORD PTR _tbl$[ebp]
	mov	ecx, DWORD PTR _i$[ebp]
	add	ecx, DWORD PTR [eax+40]
	push	ecx
	mov	edx, DWORD PTR _ctrl$[ebp]
	add	edx, 64					; 00000040H
	push	edx
	call	_dyntab_cell
	add	esp, 12					; 0000000cH
	push	eax
	push	0
	mov	eax, DWORD PTR _i$[ebp]
	push	eax
	mov	ecx, DWORD PTR _tbl$[ebp]
	add	ecx, 184				; 000000b8H
	push	ecx
	call	_dyntab_copy
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L70820
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29872], OFFSET FLAT:$SG70822
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 426		; 000001aaH
	jmp	$eva_err$70823
$L70820:
	jmp	SHORT $L70818
$L70819:

; 428  : 		else

	jmp	$L70829
$L70816:

; 430  : 			/* Default sort - build query for displayed objects in IdObj (creation) order */
; 431  : 			char qry[256] = {0};

	mov	BYTE PTR _qry$70825[ebp], 0
	mov	ecx, 63					; 0000003fH
	xor	eax, eax
	lea	edi, DWORD PTR _qry$70825[ebp+1]
	rep stosd
	stosw
	stosb

; 432  : 			snprintf(qry, sizeof(qry)-1,
; 433  : 				"SELECT DISTINCT IdObj FROM IdList ORDER BY IdObj %s LIMIT %lu,%lu",
; 434  : 				tbl->b_sortdesc ? "DESC" : "", tbl->line, tbl->lines);

	mov	ecx, DWORD PTR _tbl$[ebp]
	cmp	DWORD PTR [ecx+64], 0
	je	SHORT $L71046
	mov	DWORD PTR -276+[ebp], OFFSET FLAT:$SG70826
	jmp	SHORT $L71047
$L71046:
	mov	DWORD PTR -276+[ebp], OFFSET FLAT:$SG70827
$L71047:
	mov	edx, DWORD PTR _tbl$[ebp]
	mov	eax, DWORD PTR [edx+44]
	push	eax
	mov	ecx, DWORD PTR _tbl$[ebp]
	mov	edx, DWORD PTR [ecx+40]
	push	edx
	mov	eax, DWORD PTR -276+[ebp]
	push	eax
	push	OFFSET FLAT:$SG70828
	push	255					; 000000ffH
	lea	ecx, DWORD PTR _qry$70825[ebp]
	push	ecx
	call	__snprintf
	add	esp, 24					; 00000018H

; 435  : 			if(sql_exec_query(cntxt, qry) || sql_get_table(cntxt, &tbl->idobj, 2)) CLEAR_ERROR;

	lea	edx, DWORD PTR _qry$70825[ebp]
	push	edx
	mov	eax, DWORD PTR _cntxt$[ebp]
	push	eax
	call	_sql_exec_query
	add	esp, 8
	test	eax, eax
	jne	SHORT $L70830
	push	2
	mov	ecx, DWORD PTR _tbl$[ebp]
	add	ecx, 184				; 000000b8H
	push	ecx
	mov	edx, DWORD PTR _cntxt$[ebp]
	push	edx
	call	_sql_get_table
	add	esp, 12					; 0000000cH
	test	eax, eax
	je	SHORT $L70829
$L70830:
	push	435					; 000001b3H
	push	OFFSET FLAT:$SG70831
	push	OFFSET FLAT:$SG70832
	mov	eax, DWORD PTR _cntxt$[ebp]
	push	eax
	call	_err_clear
	add	esp, 16					; 00000010H
$L70829:

; 438  : 
; 439  : 	/* Drop temporary tables & Read displayed objects data */
; 440  : 	if(sql_exec_query(cntxt, "DROP TABLE IF EXISTS IdList,ValList,IdListMatch") ||
; 441  : 		qry_list_data(cntxt, tbl)) CLEAR_ERROR;

	push	OFFSET FLAT:$SG70835
	mov	ecx, DWORD PTR _cntxt$[ebp]
	push	ecx
	call	_sql_exec_query
	add	esp, 8
	test	eax, eax
	jne	SHORT $L70834
	mov	edx, DWORD PTR _tbl$[ebp]
	push	edx
	mov	eax, DWORD PTR _cntxt$[ebp]
	push	eax
	call	_qry_list_data
	add	esp, 8
	test	eax, eax
	je	SHORT $eva_noerr$70838
$L70834:
	push	441					; 000001b9H
	push	OFFSET FLAT:$SG70836
	push	OFFSET FLAT:$SG70837
	mov	ecx, DWORD PTR _cntxt$[ebp]
	push	ecx
	call	_err_clear
	add	esp, 16					; 00000010H
$eva_noerr$70838:

; 442  : 
; 443  : 	RETURN_OK_CLEANUP;

	push	0
	push	OFFSET FLAT:$SG70839
	push	OFFSET FLAT:$SG70840
	mov	edx, DWORD PTR _cntxt$[ebp]
	push	edx
	call	_err_clear
	add	esp, 16					; 00000010H
$eva_err$70823:
	mov	eax, DWORD PTR _cntxt$[ebp]
	cmp	DWORD PTR [eax+29872], 0
	je	SHORT $L70841
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	edx, DWORD PTR [ecx+29900]
	push	edx
	push	OFFSET FLAT:$SG70842
	push	OFFSET FLAT:$SG70843
	mov	eax, DWORD PTR _cntxt$[ebp]
	push	eax
	call	_err_add_context
	add	esp, 16					; 00000010H
$L70841:
	mov	ecx, DWORD PTR _cntxt$[ebp]
	xor	eax, eax
	cmp	DWORD PTR [ecx+29872], 0
	setne	al

; 444  : }

	pop	edi
	mov	esp, ebp
	pop	ebp
	ret	0
_table_read_obj_list ENDP
_TEXT	ENDS
PUBLIC	_table_prepare_rows
EXTRN	_qry_obj_label:NEAR
EXTRN	_put_value_fmt:NEAR
EXTRN	_qry_obj_idfield:NEAR
EXTRN	_strlen:NEAR
EXTRN	_strncmp:NEAR
EXTRN	_dyntab_cmp:NEAR
_BSS	SEGMENT
	ALIGN	4

$SG70910 DB	01H DUP (?)
	ALIGN	4

$SG70915 DB	01H DUP (?)
	ALIGN	4

$SG70920 DB	01H DUP (?)
_BSS	ENDS
_DATA	SEGMENT
$SG70869 DB	'IdObj', 00H
	ORG $+2
$SG70871 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70878 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70886 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70890 DB	'#NAR#', 00H
	ORG $+2
$SG70892 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70902 DB	', ', 00H
	ORG $+1
$SG70909 DB	'newline', 00H
$SG70911 DB	0aH, 00H
	ORG $+2
$SG70914 DB	'space', 00H
	ORG $+2
$SG70916 DB	' ', 00H
	ORG $+2
$SG70919 DB	'index', 00H
	ORG $+2
$SG70925 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70946 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70953 DB	0aH, 00H
	ORG $+2
$SG70955 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70961 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70966 DB	'_EVA_RELATION', 00H
	ORG $+2
$SG70979 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70987 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70993 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70995 DB	'D:\Travail\ABI\EVA\V4.0\CGI\Brunix-2016\table_export.c', 00H
	ORG $+1
$SG70996 DB	'table_prepare_rows', 00H
	ORG $+1
$SG70998 DB	'D:\Travail\ABI\EVA\V4.0\CGI\Brunix-2016\table_export.c', 00H
	ORG $+1
$SG70999 DB	'table_prepare_rows', 00H
_DATA	ENDS
_TEXT	SEGMENT
_cntxt$ = 8
_i_ctrl$ = 12
_pfx$ = 16
_form$ = -8
_ctrl$ = -64
_tbl$ = -32
_data$ = -28
_outval$ = -40
_val$ = -4
_i$ = -48
_j$ = -52
_k$ = -56
_rowstart$ = -44
_cell$ = -60
_pfx_sz$ = -36
_idend$70882 = -72
_idobj$70883 = -68
_fmt$70900 = -76
_separ$70901 = -100
_b_index$70903 = -96
_line$70904 = -80
_i0$70905 = -92
_b_distinct$70906 = -84
_align$70907 = -88
_b_found$70929 = -112
_idrelobj$70930 = -108
_idend$70931 = -104
_table_prepare_rows PROC NEAR

; 460  : ){

	push	ebp
	mov	ebp, esp
	sub	esp, 120				; 00000078H

; 461  : 	EVA_form *form = cntxt->form;

	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	ecx, DWORD PTR [eax+80]
	mov	DWORD PTR _form$[ebp], ecx

; 462  : 	EVA_ctrl *ctrl = form->ctrl + i_ctrl;

	mov	edx, DWORD PTR _i_ctrl$[ebp]
	imul	edx, 480				; 000001e0H
	mov	eax, DWORD PTR _form$[ebp]
	mov	ecx, DWORD PTR [eax]
	add	ecx, edx
	mov	DWORD PTR _ctrl$[ebp], ecx

; 463  : 	ObjTableFormat *tbl = ctrl->objtbl;

	mov	edx, DWORD PTR _ctrl$[ebp]
	mov	eax, DWORD PTR [edx+232]
	mov	DWORD PTR _tbl$[ebp], eax

; 464  : 	DynTable data = {0};

	mov	DWORD PTR _data$[ebp], 0
	xor	ecx, ecx
	mov	DWORD PTR _data$[ebp+4], ecx
	mov	DWORD PTR _data$[ebp+8], ecx
	mov	DWORD PTR _data$[ebp+12], ecx
	mov	DWORD PTR _data$[ebp+16], ecx

; 465  : 	DynBuffer *outval = NULL;

	mov	DWORD PTR _outval$[ebp], 0

; 466  : 	DynBuffer *val = NULL;

	mov	DWORD PTR _val$[ebp], 0

; 467  : 	unsigned long i, j, k;
; 468  : 	unsigned long rowstart;
; 469  : 	DynTableCell *cell;
; 470  : 	size_t pfx_sz = pfx ? strlen(pfx) : 0;

	cmp	DWORD PTR _pfx$[ebp], 0
	je	SHORT $L71049
	mov	edx, DWORD PTR _pfx$[ebp]
	push	edx
	call	_strlen
	add	esp, 4
	mov	DWORD PTR -116+[ebp], eax
	jmp	SHORT $L71050
$L71049:
	mov	DWORD PTR -116+[ebp], 0
$L71050:
	mov	eax, DWORD PTR -116+[ebp]
	mov	DWORD PTR _pfx_sz$[ebp], eax

; 471  : 
; 472  : 	/* Prepare title line */
; 473  : 	DYNTAB_SET(&tbl->cellval, 0, 0, "IdObj");

	push	5
	push	OFFSET FLAT:$SG70869
	push	0
	push	0
	mov	ecx, DWORD PTR _tbl$[ebp]
	add	ecx, 240				; 000000f0H
	push	ecx
	call	_dyntab_set_txt
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L70868
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29872], OFFSET FLAT:$SG70871
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 473		; 000001d9H
	jmp	$eva_err$70872
$L70868:

; 474  : 	for(j = 0; j < tbl->field.nbrows; j++)

	mov	DWORD PTR _j$[ebp], 0
	jmp	SHORT $L70873
$L70874:
	mov	ecx, DWORD PTR _j$[ebp]
	add	ecx, 1
	mov	DWORD PTR _j$[ebp], ecx
$L70873:
	mov	edx, DWORD PTR _tbl$[ebp]
	mov	eax, DWORD PTR _j$[ebp]
	cmp	eax, DWORD PTR [edx+380]
	jae	SHORT $L70875

; 476  : 		DYNTAB_SET_CELL(&tbl->cellval, 0, j + 1, &tbl->label, j, 0);

	push	0
	push	0
	mov	ecx, DWORD PTR _j$[ebp]
	push	ecx
	mov	edx, DWORD PTR _tbl$[ebp]
	add	edx, 360				; 00000168H
	push	edx
	call	_dyntab_cell
	add	esp, 12					; 0000000cH
	push	eax
	mov	eax, DWORD PTR _j$[ebp]
	add	eax, 1
	push	eax
	push	0
	mov	ecx, DWORD PTR _tbl$[ebp]
	add	ecx, 240				; 000000f0H
	push	ecx
	call	_dyntab_copy
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L70876
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29872], OFFSET FLAT:$SG70878
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 476		; 000001dcH
	jmp	$eva_err$70872
$L70876:

; 477  : 	}

	jmp	SHORT $L70874
$L70875:

; 478  : 
; 479  : 	/* Process rows */
; 480  : 	for(i = 0; i < tbl->idobj.nbrows; i++)

	mov	DWORD PTR _i$[ebp], 0
	jmp	SHORT $L70879
$L70880:
	mov	ecx, DWORD PTR _i$[ebp]
	add	ecx, 1
	mov	DWORD PTR _i$[ebp], ecx
$L70879:
	mov	edx, DWORD PTR _tbl$[ebp]
	mov	eax, DWORD PTR _i$[ebp]
	cmp	eax, DWORD PTR [edx+184]
	jae	$eva_noerr$70994

; 482  : 		char *idend;
; 483  : 		unsigned long idobj = strtoul(dyntab_val(&tbl->idobj, i, 0), &idend, 10);

	push	10					; 0000000aH
	lea	ecx, DWORD PTR _idend$70882[ebp]
	push	ecx
	push	0
	mov	edx, DWORD PTR _i$[ebp]
	push	edx
	mov	eax, DWORD PTR _tbl$[ebp]
	add	eax, 184				; 000000b8H
	push	eax
	call	_dyntab_val
	add	esp, 12					; 0000000cH
	push	eax
	call	_strtoul
	add	esp, 12					; 0000000cH
	mov	DWORD PTR _idobj$70883[ebp], eax

; 484  : 
; 485  : 		/* First colummn contains object Id */
; 486  : 		DYNTAB_ADD_CELL(&tbl->cellval, i + 1, 0, &tbl->idobj, i, 0);

	push	1
	push	0
	mov	ecx, DWORD PTR _i$[ebp]
	push	ecx
	mov	edx, DWORD PTR _tbl$[ebp]
	add	edx, 184				; 000000b8H
	push	edx
	call	_dyntab_cell
	add	esp, 12					; 0000000cH
	push	eax
	push	0
	mov	eax, DWORD PTR _i$[ebp]
	add	eax, 1
	push	eax
	mov	ecx, DWORD PTR _tbl$[ebp]
	add	ecx, 240				; 000000f0H
	push	ecx
	call	_dyntab_copy
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L70884
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29872], OFFSET FLAT:$SG70886
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 486		; 000001e6H
	jmp	$eva_err$70872
$L70884:

; 487  : 
; 488  : 		/* If object is not valid */
; 489  : 		if(!idobj || *idend)

	cmp	DWORD PTR _idobj$70883[ebp], 0
	je	SHORT $L70888
	mov	ecx, DWORD PTR _idend$70882[ebp]
	movsx	edx, BYTE PTR [ecx]
	test	edx, edx
	je	SHORT $L70887
$L70888:

; 491  : 			DYNTAB_SET(&tbl->cellval, i + 1, 1, "#NAR#");

	push	5
	push	OFFSET FLAT:$SG70890
	push	1
	mov	eax, DWORD PTR _i$[ebp]
	add	eax, 1
	push	eax
	mov	ecx, DWORD PTR _tbl$[ebp]
	add	ecx, 240				; 000000f0H
	push	ecx
	call	_dyntab_set_txt
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L70889
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29872], OFFSET FLAT:$SG70892
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 491		; 000001ebH
	jmp	$eva_err$70872
$L70889:

; 493  : 		else

	jmp	$L70899
$L70887:

; 495  : 			/* Find object in objects data */
; 496  : 			for(j = 0; j < tbl->data.nbrows && dyntab_cell(&tbl->data, j, 0)->IdObj != idobj; j++);

	mov	DWORD PTR _j$[ebp], 0
	jmp	SHORT $L70894
$L70895:
	mov	ecx, DWORD PTR _j$[ebp]
	add	ecx, 1
	mov	DWORD PTR _j$[ebp], ecx
$L70894:
	mov	edx, DWORD PTR _tbl$[ebp]
	mov	eax, DWORD PTR _j$[ebp]
	cmp	eax, DWORD PTR [edx+220]
	jae	SHORT $L70896
	push	0
	mov	ecx, DWORD PTR _j$[ebp]
	push	ecx
	mov	edx, DWORD PTR _tbl$[ebp]
	add	edx, 220				; 000000dcH
	push	edx
	call	_dyntab_cell
	add	esp, 12					; 0000000cH
	mov	eax, DWORD PTR [eax+20]
	cmp	eax, DWORD PTR _idobj$70883[ebp]
	je	SHORT $L70896
	jmp	SHORT $L70895
$L70896:

; 497  : 			rowstart = j;

	mov	ecx, DWORD PTR _j$[ebp]
	mov	DWORD PTR _rowstart$[ebp], ecx

; 498  : 
; 499  : 			/* Output line data in tbl->field order */
; 500  : 			for(j = 0; j < tbl->field.nbrows; j++)

	mov	DWORD PTR _j$[ebp], 0
	jmp	SHORT $L70897
$L70898:
	mov	edx, DWORD PTR _j$[ebp]
	add	edx, 1
	mov	DWORD PTR _j$[ebp], edx
$L70897:
	mov	eax, DWORD PTR _tbl$[ebp]
	mov	ecx, DWORD PTR _j$[ebp]
	cmp	ecx, DWORD PTR [eax+380]
	jae	$L70899

; 502  : 				char *fmt = dyntab_val(&tbl->format, j, 0);

	push	0
	mov	edx, DWORD PTR _j$[ebp]
	push	edx
	mov	eax, DWORD PTR _tbl$[ebp]
	add	eax, 400				; 00000190H
	push	eax
	call	_dyntab_val
	add	esp, 12					; 0000000cH
	mov	DWORD PTR _fmt$70900[ebp], eax

; 503  : 				char *separ = ", ";

	mov	DWORD PTR _separ$70901[ebp], OFFSET FLAT:$SG70902

; 504  : 				int b_index = 0;

	mov	DWORD PTR _b_index$70903[ebp], 0

; 505  : 				unsigned long line = 1;

	mov	DWORD PTR _line$70904[ebp], 1

; 506  : 				unsigned long i0;
; 507  : 				int b_distinct = dyntab_sz(&tbl->distinctval, j, 0);

	push	0
	mov	ecx, DWORD PTR _j$[ebp]
	push	ecx
	mov	edx, DWORD PTR _tbl$[ebp]
	add	edx, 520				; 00000208H
	push	edx
	call	_dyntab_sz
	add	esp, 12					; 0000000cH
	mov	DWORD PTR _b_distinct$70906[ebp], eax

; 508  : 				char *align = dyntab_val(&tbl->align, j, 0);

	push	0
	mov	eax, DWORD PTR _j$[ebp]
	push	eax
	mov	ecx, DWORD PTR _tbl$[ebp]
	add	ecx, 440				; 000001b8H
	push	ecx
	call	_dyntab_val
	add	esp, 12					; 0000000cH
	mov	DWORD PTR _align$70907[ebp], eax

; 509  : 
; 510  : 				/* Set alignment & value separator */
; 511  : 				if(!strcmp(align, "newline")) { align = ""; separ = "\n"; }

	push	OFFSET FLAT:$SG70909
	mov	edx, DWORD PTR _align$70907[ebp]
	push	edx
	call	_strcmp
	add	esp, 8
	test	eax, eax
	jne	SHORT $L70908
	mov	DWORD PTR _align$70907[ebp], OFFSET FLAT:$SG70910
	mov	DWORD PTR _separ$70901[ebp], OFFSET FLAT:$SG70911

; 512  : 				else if(!strcmp(align, "space")) { align = ""; separ = " "; }

	jmp	SHORT $L70918
$L70908:
	push	OFFSET FLAT:$SG70914
	mov	eax, DWORD PTR _align$70907[ebp]
	push	eax
	call	_strcmp
	add	esp, 8
	test	eax, eax
	jne	SHORT $L70913
	mov	DWORD PTR _align$70907[ebp], OFFSET FLAT:$SG70915
	mov	DWORD PTR _separ$70901[ebp], OFFSET FLAT:$SG70916

; 513  : 				else if(!strcmp(align, "index")) { align = ""; b_index = 1; }

	jmp	SHORT $L70918
$L70913:
	push	OFFSET FLAT:$SG70919
	mov	ecx, DWORD PTR _align$70907[ebp]
	push	ecx
	call	_strcmp
	add	esp, 8
	test	eax, eax
	jne	SHORT $L70918
	mov	DWORD PTR _align$70907[ebp], OFFSET FLAT:$SG70920
	mov	DWORD PTR _b_index$70903[ebp], 1
$L70918:

; 514  : 
; 515  : 				/* Concat formated cell values */
; 516  : 				M_FREE(outval);

	mov	edx, DWORD PTR _outval$[ebp]
	push	edx
	call	_mem_free
	add	esp, 4
	mov	DWORD PTR _outval$[ebp], 0

; 517  : 				if(pfx_sz) DYNBUF_ADD(&outval, pfx, pfx_sz, NO_CONV);

	cmp	DWORD PTR _pfx_sz$[ebp], 0
	je	SHORT $L70923
	push	0
	push	0
	mov	eax, DWORD PTR _pfx_sz$[ebp]
	push	eax
	mov	ecx, DWORD PTR _pfx$[ebp]
	push	ecx
	lea	edx, DWORD PTR _outval$[ebp]
	push	edx
	call	_dynbuf_add
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L70923
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29872], OFFSET FLAT:$SG70925
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 517		; 00000205H
	jmp	$eva_err$70872
$L70923:

; 518  : 				for(k = 0; rowstart < tbl->data.nbrows; k++, rowstart++)

	mov	DWORD PTR _k$[ebp], 0
	jmp	SHORT $L70926
$L70927:
	mov	edx, DWORD PTR _k$[ebp]
	add	edx, 1
	mov	DWORD PTR _k$[ebp], edx
	mov	eax, DWORD PTR _rowstart$[ebp]
	add	eax, 1
	mov	DWORD PTR _rowstart$[ebp], eax
$L70926:
	mov	ecx, DWORD PTR _tbl$[ebp]
	mov	edx, DWORD PTR _rowstart$[ebp]
	cmp	edx, DWORD PTR [ecx+220]
	jae	$L70928

; 520  : 					/* Break if column changes */
; 521  : 					int b_found = 0;

	mov	DWORD PTR _b_found$70929[ebp], 0

; 522  : 					unsigned long idrelobj;
; 523  : 					char *idend = NULL;

	mov	DWORD PTR _idend$70931[ebp], 0

; 524  : 					cell = dyntab_cell(&tbl->data, rowstart, 0);

	push	0
	mov	eax, DWORD PTR _rowstart$[ebp]
	push	eax
	mov	ecx, DWORD PTR _tbl$[ebp]
	add	ecx, 220				; 000000dcH
	push	ecx
	call	_dyntab_cell
	add	esp, 12					; 0000000cH
	mov	DWORD PTR _cell$[ebp], eax

; 525  : 					if(cell->col != j) break;

	mov	edx, DWORD PTR _cell$[ebp]
	mov	eax, DWORD PTR [edx+56]
	cmp	eax, DWORD PTR _j$[ebp]
	je	SHORT $L70933
	jmp	$L70928
$L70933:

; 526  : 
; 527  : 					/* Distinct values required : search for same previous value - ignore if found */
; 528  : 					if(b_distinct) for(i0 = 0; i0 < k && !b_found; i0++)

	cmp	DWORD PTR _b_distinct$70906[ebp], 0
	je	SHORT $L70937
	mov	DWORD PTR _i0$70905[ebp], 0
	jmp	SHORT $L70935
$L70936:
	mov	ecx, DWORD PTR _i0$70905[ebp]
	add	ecx, 1
	mov	DWORD PTR _i0$70905[ebp], ecx
$L70935:
	mov	edx, DWORD PTR _i0$70905[ebp]
	cmp	edx, DWORD PTR _k$[ebp]
	jae	SHORT $L70937
	cmp	DWORD PTR _b_found$70929[ebp], 0
	jne	SHORT $L70937

; 529  : 						if(!dyntab_cmp(&tbl->data, rowstart, 0, &tbl->data, rowstart - i0 - 1, 0))

	push	0
	mov	eax, DWORD PTR _rowstart$[ebp]
	sub	eax, DWORD PTR _i0$70905[ebp]
	sub	eax, 1
	push	eax
	mov	ecx, DWORD PTR _tbl$[ebp]
	add	ecx, 220				; 000000dcH
	push	ecx
	push	0
	mov	edx, DWORD PTR _rowstart$[ebp]
	push	edx
	mov	eax, DWORD PTR _tbl$[ebp]
	add	eax, 220				; 000000dcH
	push	eax
	call	_dyntab_cmp
	add	esp, 24					; 00000018H
	test	eax, eax
	jne	SHORT $L70938

; 530  : 							b_found = 1;

	mov	DWORD PTR _b_found$70929[ebp], 1
$L70938:

; 531  : 					if(b_found) continue;

	jmp	SHORT $L70936
$L70937:
	cmp	DWORD PTR _b_found$70929[ebp], 0
	je	SHORT $L70939
	jmp	$L70927
$L70939:

; 532  : 
; 533  : 					/* Output value separator if applicable */
; 534  : 					if(b_index || (cell->Line && !dyntab_sz(&tbl->align, j, 0)))

	cmp	DWORD PTR _b_index$70903[ebp], 0
	jne	SHORT $L70941
	mov	ecx, DWORD PTR _cell$[ebp]
	cmp	DWORD PTR [ecx+40], 0
	je	$L70940
	push	0
	mov	edx, DWORD PTR _j$[ebp]
	push	edx
	mov	eax, DWORD PTR _tbl$[ebp]
	add	eax, 440				; 000001b8H
	push	eax
	call	_dyntab_sz
	add	esp, 12					; 0000000cH
	test	eax, eax
	jne	$L70940
$L70941:

; 536  : 						if(line >= cell->Line && k) DYNBUF_ADD(&outval, separ, 0, NO_CONV)

	mov	ecx, DWORD PTR _cell$[ebp]
	mov	edx, DWORD PTR _line$70904[ebp]
	cmp	edx, DWORD PTR [ecx+40]
	jb	SHORT $L70942
	cmp	DWORD PTR _k$[ebp], 0
	je	SHORT $L70942
	push	0
	push	0
	push	0
	mov	eax, DWORD PTR _separ$70901[ebp]
	push	eax
	lea	ecx, DWORD PTR _outval$[ebp]
	push	ecx
	call	_dynbuf_add
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L70944
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29872], OFFSET FLAT:$SG70946
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 536		; 00000218H
	jmp	$eva_err$70872
$L70944:

; 537  : 						else while(line < cell->Line) { DYNBUF_ADD_STR(&outval, "\n"); line++; }

	jmp	SHORT $L70950
$L70942:
	mov	ecx, DWORD PTR _cell$[ebp]
	mov	edx, DWORD PTR _line$70904[ebp]
	cmp	edx, DWORD PTR [ecx+40]
	jae	SHORT $L70950
	push	0
	push	0
	push	1
	push	OFFSET FLAT:$SG70953
	lea	eax, DWORD PTR _outval$[ebp]
	push	eax
	call	_dynbuf_add
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L70952
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29872], OFFSET FLAT:$SG70955
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 537		; 00000219H
	jmp	$eva_err$70872
$L70952:
	mov	eax, DWORD PTR _line$70904[ebp]
	add	eax, 1
	mov	DWORD PTR _line$70904[ebp], eax
	jmp	SHORT $L70942
$L70950:

; 539  : 					else if(outval && outval->cnt > pfx_sz) DYNBUF_ADD(&outval, separ, 0, NO_CONV);

	jmp	SHORT $L70959
$L70940:
	cmp	DWORD PTR _outval$[ebp], 0
	je	SHORT $L70959
	mov	ecx, DWORD PTR _outval$[ebp]
	mov	edx, DWORD PTR [ecx+4]
	cmp	edx, DWORD PTR _pfx_sz$[ebp]
	jbe	SHORT $L70959
	push	0
	push	0
	push	0
	mov	eax, DWORD PTR _separ$70901[ebp]
	push	eax
	lea	ecx, DWORD PTR _outval$[ebp]
	push	ecx
	call	_dynbuf_add
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L70959
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29872], OFFSET FLAT:$SG70961
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 539		; 0000021bH
	jmp	$eva_err$70872
$L70959:

; 540  : 
; 541  : 					/* Use relation format if applicable */
; 542  : 					idrelobj = cell->txt ? strtoul(cell->txt, &idend, 10) : 0;

	mov	ecx, DWORD PTR _cell$[ebp]
	cmp	DWORD PTR [ecx], 0
	je	SHORT $L71051
	push	10					; 0000000aH
	lea	edx, DWORD PTR _idend$70931[ebp]
	push	edx
	mov	eax, DWORD PTR _cell$[ebp]
	mov	ecx, DWORD PTR [eax]
	push	ecx
	call	_strtoul
	add	esp, 12					; 0000000cH
	mov	DWORD PTR -120+[ebp], eax
	jmp	SHORT $L71052
$L71051:
	mov	DWORD PTR -120+[ebp], 0
$L71052:
	mov	edx, DWORD PTR -120+[ebp]
	mov	DWORD PTR _idrelobj$70930[ebp], edx

; 543  : 					if(idend && *idend) idrelobj = 0;

	cmp	DWORD PTR _idend$70931[ebp], 0
	je	SHORT $L70962
	mov	eax, DWORD PTR _idend$70931[ebp]
	movsx	ecx, BYTE PTR [eax]
	test	ecx, ecx
	je	SHORT $L70962
	mov	DWORD PTR _idrelobj$70930[ebp], 0
$L70962:

; 544  : 					if(((idrelobj && !strncmp(fmt, add_sz_str("_EVA_RELATION"))) || (cell->b_relation && !*fmt)))

	cmp	DWORD PTR _idrelobj$70930[ebp], 0
	je	SHORT $L70965
	push	13					; 0000000dH
	push	OFFSET FLAT:$SG70966
	mov	edx, DWORD PTR _fmt$70900[ebp]
	push	edx
	call	_strncmp
	add	esp, 12					; 0000000cH
	test	eax, eax
	je	SHORT $L70964
$L70965:
	mov	eax, DWORD PTR _cell$[ebp]
	movsx	ecx, BYTE PTR [eax+12]
	test	ecx, ecx
	je	$L70963
	mov	edx, DWORD PTR _fmt$70900[ebp]
	movsx	eax, BYTE PTR [edx]
	test	eax, eax
	jne	$L70963
$L70964:

; 546  : 						/* Relation formats */
; 547  : 						if(qry_obj_idfield(cntxt, &data, idrelobj, 0) ||
; 548  : 							qry_obj_label(cntxt, NULL, NULL, NULL, &val, NULL, NULL, NULL, NULL, 0, &data, 0)) STACK_ERROR;

	push	0
	mov	ecx, DWORD PTR _idrelobj$70930[ebp]
	push	ecx
	lea	edx, DWORD PTR _data$[ebp]
	push	edx
	mov	eax, DWORD PTR _cntxt$[ebp]
	push	eax
	call	_qry_obj_idfield
	add	esp, 16					; 00000010H
	test	eax, eax
	jne	SHORT $L70975
	push	0
	lea	ecx, DWORD PTR _data$[ebp]
	push	ecx
	push	0
	push	0
	push	0
	push	0
	push	0
	lea	edx, DWORD PTR _val$[ebp]
	push	edx
	push	0
	push	0
	push	0
	mov	eax, DWORD PTR _cntxt$[ebp]
	push	eax
	call	_qry_obj_label
	add	esp, 48					; 00000030H
	test	eax, eax
	je	SHORT $L70974
$L70975:
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 548		; 00000224H
	jmp	$eva_err$70872
$L70974:

; 549  : 						DYNBUF_ADD_BUF(&outval, val, NO_CONV);

	cmp	DWORD PTR _val$[ebp], 0
	je	SHORT $L70977
	push	0
	push	0
	mov	edx, DWORD PTR _val$[ebp]
	mov	eax, DWORD PTR [edx+4]
	push	eax
	mov	ecx, DWORD PTR _val$[ebp]
	add	ecx, 8
	push	ecx
	lea	edx, DWORD PTR _outval$[ebp]
	push	edx
	call	_dynbuf_add
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L70977
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29872], OFFSET FLAT:$SG70979
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 549		; 00000225H
	jmp	$eva_err$70872
$L70977:

; 551  : 
; 552  : 					/* Add formated value */
; 553  : 					else if(put_value_fmt(cntxt, &outval, DYNTAB_VAL_SZ(&tbl->data, rowstart, 0), dyntab_val(&tbl->format, j, 0)))

	jmp	SHORT $L70981
$L70963:
	push	0
	mov	edx, DWORD PTR _j$[ebp]
	push	edx
	mov	eax, DWORD PTR _tbl$[ebp]
	add	eax, 400				; 00000190H
	push	eax
	call	_dyntab_val
	add	esp, 12					; 0000000cH
	push	eax
	push	0
	mov	ecx, DWORD PTR _rowstart$[ebp]
	push	ecx
	mov	edx, DWORD PTR _tbl$[ebp]
	add	edx, 220				; 000000dcH
	push	edx
	call	_dyntab_sz
	add	esp, 12					; 0000000cH
	push	eax
	push	0
	mov	eax, DWORD PTR _rowstart$[ebp]
	push	eax
	mov	ecx, DWORD PTR _tbl$[ebp]
	add	ecx, 220				; 000000dcH
	push	ecx
	call	_dyntab_val
	add	esp, 12					; 0000000cH
	push	eax
	lea	edx, DWORD PTR _outval$[ebp]
	push	edx
	mov	eax, DWORD PTR _cntxt$[ebp]
	push	eax
	call	_put_value_fmt
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L70981

; 554  : 						STACK_ERROR;

	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 554		; 0000022aH
	jmp	$eva_err$70872
$L70981:

; 555  : 				}

	jmp	$L70927
$L70928:

; 556  : 				if(outval && outval->cnt > pfx_sz) DYNTAB_ADD_BUF(&tbl->cellval, i + 1, j + 1, outval);

	cmp	DWORD PTR _outval$[ebp], 0
	je	$L70991
	mov	edx, DWORD PTR _outval$[ebp]
	mov	eax, DWORD PTR [edx+4]
	cmp	eax, DWORD PTR _pfx_sz$[ebp]
	jbe	$L70991
	cmp	DWORD PTR _outval$[ebp], 0
	je	SHORT $L70983
	mov	ecx, DWORD PTR _outval$[ebp]
	cmp	DWORD PTR [ecx+4], 0
	je	SHORT $L70983
	push	0
	push	0
	mov	edx, DWORD PTR _outval$[ebp]
	mov	eax, DWORD PTR [edx+4]
	push	eax
	mov	ecx, DWORD PTR _outval$[ebp]
	add	ecx, 8
	push	ecx
	mov	edx, DWORD PTR _j$[ebp]
	add	edx, 1
	push	edx
	mov	eax, DWORD PTR _i$[ebp]
	add	eax, 1
	push	eax
	mov	ecx, DWORD PTR _tbl$[ebp]
	add	ecx, 240				; 000000f0H
	push	ecx
	call	_dyntab_add
	add	esp, 28					; 0000001cH
	test	eax, eax
	je	SHORT $L70985
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29872], OFFSET FLAT:$SG70987
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 556		; 0000022cH
	jmp	SHORT $eva_err$70872
$L70985:
	jmp	SHORT $L70991
$L70983:
	push	0
	push	0
	push	0
	push	0
	mov	ecx, DWORD PTR _j$[ebp]
	add	ecx, 1
	push	ecx
	mov	edx, DWORD PTR _i$[ebp]
	add	edx, 1
	push	edx
	mov	eax, DWORD PTR _tbl$[ebp]
	add	eax, 240				; 000000f0H
	push	eax
	call	_dyntab_add
	add	esp, 28					; 0000001cH
	test	eax, eax
	je	SHORT $L70991
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29872], OFFSET FLAT:$SG70993
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 556		; 0000022cH
	jmp	SHORT $eva_err$70872
$L70991:

; 557  : 			}

	jmp	$L70898
$L70899:

; 559  : 	}

	jmp	$L70880
$eva_noerr$70994:

; 560  : 
; 561  : 	RETURN_OK_CLEANUP;

	push	0
	push	OFFSET FLAT:$SG70995
	push	OFFSET FLAT:$SG70996
	mov	eax, DWORD PTR _cntxt$[ebp]
	push	eax
	call	_err_clear
	add	esp, 16					; 00000010H
$eva_err$70872:
	mov	ecx, DWORD PTR _cntxt$[ebp]
	cmp	DWORD PTR [ecx+29872], 0
	je	SHORT $L70997
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	eax, DWORD PTR [edx+29900]
	push	eax
	push	OFFSET FLAT:$SG70998
	push	OFFSET FLAT:$SG70999
	mov	ecx, DWORD PTR _cntxt$[ebp]
	push	ecx
	call	_err_add_context
	add	esp, 16					; 00000010H
$L70997:
	lea	edx, DWORD PTR _data$[ebp]
	push	edx
	call	_dyntab_free
	add	esp, 4
	mov	eax, DWORD PTR _outval$[ebp]
	push	eax
	call	_mem_free
	add	esp, 4
	mov	DWORD PTR _outval$[ebp], 0
	mov	ecx, DWORD PTR _val$[ebp]
	push	ecx
	call	_mem_free
	add	esp, 4
	mov	DWORD PTR _val$[ebp], 0
	mov	edx, DWORD PTR _cntxt$[ebp]
	xor	eax, eax
	cmp	DWORD PTR [edx+29872], 0
	setne	al

; 562  : }

	mov	esp, ebp
	pop	ebp
	ret	0
_table_prepare_rows ENDP
_TEXT	ENDS
END
