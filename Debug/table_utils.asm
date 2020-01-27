	TITLE	D:\Travail\ABI\EVA\V4.0\CGI\Brunix-2016\table_utils.c
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
_BSS	SEGMENT
_?color@?1??table_row_bgcolor@@9@9 DB 010H DUP (?)
_?lbl@?1??table_column_label@@9@9 DB 040H DUP (?)
_BSS	ENDS
PUBLIC	_table_column_label
EXTRN	__snprintf:NEAR
EXTRN	_dyntab_cell:NEAR
_BSS	SEGMENT
_?txt@?1??table_column_label@@9@9 DB 010H DUP (?)
_BSS	ENDS
_DATA	SEGMENT
$SG70215 DB	'Colonne %lu', 00H
_DATA	ENDS
_TEXT	SEGMENT
_tbl$ = 8
_i$ = 12
_c$ = -4
_table_column_label PROC NEAR

; 25   : ){

	push	ebp
	mov	ebp, esp
	push	ecx

; 26   : 	static DynTableCell lbl = {0};
; 27   : 	static char txt[16];
; 28   : 	DynTableCell *c = dyntab_cell(&tbl->label, i, 0);

	push	0
	mov	eax, DWORD PTR _i$[ebp]
	push	eax
	mov	ecx, DWORD PTR _tbl$[ebp]
	add	ecx, 360				; 00000168H
	push	ecx
	call	_dyntab_cell
	add	esp, 12					; 0000000cH
	mov	DWORD PTR _c$[ebp], eax

; 29   : 	if(c && c->len) return c;

	cmp	DWORD PTR _c$[ebp], 0
	je	SHORT $L70214
	mov	edx, DWORD PTR _c$[ebp]
	cmp	DWORD PTR [edx+4], 0
	je	SHORT $L70214
	mov	eax, DWORD PTR _c$[ebp]
	jmp	SHORT $L70208
$L70214:

; 30   : 	lbl.txt = txt;

	mov	DWORD PTR _?lbl@?1??table_column_label@@9@9, OFFSET FLAT:_?txt@?1??table_column_label@@9@9

; 31   : 	lbl.len = snprintf(add_sz_str(txt), "Colonne %lu", i);

	mov	eax, DWORD PTR _i$[ebp]
	push	eax
	push	OFFSET FLAT:$SG70215
	push	15					; 0000000fH
	push	OFFSET FLAT:_?txt@?1??table_column_label@@9@9
	call	__snprintf
	add	esp, 16					; 00000010H
	mov	DWORD PTR _?lbl@?1??table_column_label@@9@9+4, eax

; 32   : 	lbl.b_dontfreetxt = 1;

	mov	BYTE PTR _?lbl@?1??table_column_label@@9@9+14, 1

; 33   : 	return &lbl;

	mov	eax, OFFSET FLAT:_?lbl@?1??table_column_label@@9@9
$L70208:

; 34   : }

	mov	esp, ebp
	pop	ebp
	ret	0
_table_column_label ENDP
_TEXT	ENDS
PUBLIC	_table_init_srchcol
EXTRN	_unique_bit_index:NEAR
EXTRN	_strtoul:NEAR
EXTRN	_dyntab_val:NEAR
EXTRN	_dyntab_field_cell:NEAR
_BSS	SEGMENT
$SG70233 DB	01H DUP (?)
_BSS	ENDS
_DATA	SEGMENT
$SG70223 DB	'_EVA_SEARCHCOL', 00H
_DATA	ENDS
_TEXT	SEGMENT
_tbl$ = 8
_i$ = -4
_srchcol$70222 = -8
_num$70225 = -12
_col$70229 = -16
_table_init_srchcol PROC NEAR

; 42   : ){

	push	ebp
	mov	ebp, esp
	sub	esp, 24					; 00000018H

; 43   : 	unsigned long i;
; 44   : 
; 45   : 	/* Initialize search columns with default fields if none */
; 46   : 	if(!tbl->srchcol)

	mov	eax, DWORD PTR _tbl$[ebp]
	cmp	DWORD PTR [eax+124], 0
	jne	$L70231

; 48   : 		DynTableCell *srchcol = DYNTAB_FIELD_CELL(tbl->attr, SEARCHCOL);

	push	0
	push	-1
	push	OFFSET FLAT:$SG70223
	mov	ecx, DWORD PTR _tbl$[ebp]
	mov	edx, DWORD PTR [ecx]
	push	edx
	call	_dyntab_field_cell
	add	esp, 16					; 00000010H
	mov	DWORD PTR _srchcol$70222[ebp], eax

; 49   : 		if(srchcol)

	cmp	DWORD PTR _srchcol$70222[ebp], 0
	je	SHORT $L70228

; 51   : 			char *num = srchcol->txt;

	mov	eax, DWORD PTR _srchcol$70222[ebp]
	mov	ecx, DWORD PTR [eax]
	mov	DWORD PTR _num$70225[ebp], ecx
$L70227:

; 52   : 			while(num && *num)

	cmp	DWORD PTR _num$70225[ebp], 0
	je	SHORT $L70228
	mov	edx, DWORD PTR _num$70225[ebp]
	movsx	eax, BYTE PTR [edx]
	test	eax, eax
	je	SHORT $L70228

; 54   : 				unsigned long col = strtoul(num, &num, 10);

	push	10					; 0000000aH
	lea	ecx, DWORD PTR _num$70225[ebp]
	push	ecx
	mov	edx, DWORD PTR _num$70225[ebp]
	push	edx
	call	_strtoul
	add	esp, 12					; 0000000cH
	mov	DWORD PTR _col$70229[ebp], eax

; 55   : 				tbl->srchcol |= 1 << (col ? (col - 1) : tbl->field.nbrows);

	cmp	DWORD PTR _col$70229[ebp], 0
	je	SHORT $L73265
	mov	eax, DWORD PTR _col$70229[ebp]
	sub	eax, 1
	mov	DWORD PTR -20+[ebp], eax
	jmp	SHORT $L73266
$L73265:
	mov	ecx, DWORD PTR _tbl$[ebp]
	mov	edx, DWORD PTR [ecx+380]
	mov	DWORD PTR -20+[ebp], edx
$L73266:
	mov	eax, 1
	mov	ecx, DWORD PTR -20+[ebp]
	shl	eax, cl
	mov	ecx, DWORD PTR _tbl$[ebp]
	mov	edx, DWORD PTR [ecx+124]
	or	edx, eax
	mov	eax, DWORD PTR _tbl$[ebp]
	mov	DWORD PTR [eax+124], edx

; 56   : 				if(*num) num++;

	mov	ecx, DWORD PTR _num$70225[ebp]
	movsx	edx, BYTE PTR [ecx]
	test	edx, edx
	je	SHORT $L70230
	mov	eax, DWORD PTR _num$70225[ebp]
	add	eax, 1
	mov	DWORD PTR _num$70225[ebp], eax
$L70230:

; 57   : 			}

	jmp	SHORT $L70227
$L70228:

; 59   : 		if(!tbl->srchcol) tbl->srchcol = 1 << tbl->field.nbrows;

	mov	ecx, DWORD PTR _tbl$[ebp]
	cmp	DWORD PTR [ecx+124], 0
	jne	SHORT $L70231
	mov	edx, DWORD PTR _tbl$[ebp]
	mov	eax, 1
	mov	ecx, DWORD PTR [edx+380]
	shl	eax, cl
	mov	ecx, DWORD PTR _tbl$[ebp]
	mov	DWORD PTR [ecx+124], eax
$L70231:

; 61   : 	if(!tbl->srchcol) tbl->srchcol = 1 << tbl->field.nbrows;

	mov	edx, DWORD PTR _tbl$[ebp]
	cmp	DWORD PTR [edx+124], 0
	jne	SHORT $L70232
	mov	eax, DWORD PTR _tbl$[ebp]
	mov	edx, 1
	mov	ecx, DWORD PTR [eax+380]
	shl	edx, cl
	mov	eax, DWORD PTR _tbl$[ebp]
	mov	DWORD PTR [eax+124], edx
$L70232:

; 62   : 	i = unique_bit_index(tbl->srchcol);

	mov	ecx, DWORD PTR _tbl$[ebp]
	mov	edx, DWORD PTR [ecx+124]
	push	edx
	call	_unique_bit_index
	add	esp, 4
	mov	DWORD PTR _i$[ebp], eax

; 63   : 	tbl->srchfmt = i ? dyntab_val(&tbl->format, i - 1, 0) : "";

	cmp	DWORD PTR _i$[ebp], 0
	je	SHORT $L73267
	push	0
	mov	eax, DWORD PTR _i$[ebp]
	sub	eax, 1
	push	eax
	mov	ecx, DWORD PTR _tbl$[ebp]
	add	ecx, 400				; 00000190H
	push	ecx
	call	_dyntab_val
	add	esp, 12					; 0000000cH
	mov	DWORD PTR -24+[ebp], eax
	jmp	SHORT $L73268
$L73267:
	mov	DWORD PTR -24+[ebp], OFFSET FLAT:$SG70233
$L73268:
	mov	edx, DWORD PTR _tbl$[ebp]
	mov	eax, DWORD PTR -24+[ebp]
	mov	DWORD PTR [edx+128], eax

; 64   : }

	mov	esp, ebp
	pop	ebp
	ret	0
_table_init_srchcol ENDP
_TEXT	ENDS
PUBLIC	_table_process_controls
PUBLIC	_table_export_list
EXTRN	_qsort_ctrlval:NEAR
EXTRN	_ctrl_call_act_handler:NEAR
EXTRN	_sprintf:NEAR
EXTRN	_cgi_filter_values:NEAR
EXTRN	_cgi_setkeep:NEAR
EXTRN	_cgi_value_setkeep:NEAR
EXTRN	_cgi_add_input:NEAR
EXTRN	_atoi:NEAR
EXTRN	_mem_free:NEAR
EXTRN	_qry_obj_data:NEAR
EXTRN	_dynbuf_add3_int:NEAR
EXTRN	_qry_add_obj_data:NEAR
EXTRN	_dyntab_free:NEAR
EXTRN	_ctrl_set_common_attr:NEAR
EXTRN	_dyntab_sz:NEAR
EXTRN	_dyntab_copy:NEAR
EXTRN	_dyntab_add:NEAR
EXTRN	_strcmp:NEAR
EXTRN	_dyntab_set_txt:NEAR
EXTRN	_err_add_context:NEAR
EXTRN	_err_clear:NEAR
EXTRN	_strncmp:NEAR
EXTRN	_strstr:NEAR
EXTRN	_dyntab_del_rows:NEAR
EXTRN	_dyntab_filter_field:NEAR
EXTRN	_dyntab_order_lines:NEAR
EXTRN	_dyntab_sort:NEAR
_BSS	SEGMENT
	ALIGN	4

$SG70255 DB	01H DUP (?)
	ALIGN	4

$SG70384 DB	01H DUP (?)
_BSS	ENDS
_DATA	SEGMENT
	ORG $+1
$SG70258 DB	'ADDNEWOBJ', 00H
	ORG $+2
$SG70261 DB	'_EVA_DISPLAYFIELDS', 00H
	ORG $+1
$SG70264 DB	'_EVA_LIST_CREATE_FORM', 00H
	ORG $+2
$SG70266 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70271 DB	'_EVA_BASE_FORMS', 00H
$SG70273 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70276 DB	'_EVA_LIST_CREATE_FIELD', 00H
	ORG $+1
$SG70278 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70281 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70284 DB	'_EVA_LIST_CREATE_VALUE', 00H
	ORG $+1
$SG70286 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70289 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70292 DB	'V', 00H
	ORG $+2
$SG70294 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70298 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70301 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70306 DB	'V', 00H
	ORG $+2
$SG70308 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70311 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70314 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70318 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70321 DB	'SEARCHBEGIN', 00H
$SG70324 DB	'SEARCHEXACT', 00H
$SG70327 DB	'SEARCHCONTAIN', 00H
	ORG $+2
$SG70330 DB	'OPENSEARCH', 00H
	ORG $+1
$SG70335 DB	'CLOSESEARCH', 00H
$SG70338 DB	'OPENADDNEW', 00H
	ORG $+1
$SG70342 DB	'TOP', 00H
$SG70345 DB	'PAGEUP', 00H
	ORG $+1
$SG70348 DB	'LINEUP', 00H
	ORG $+1
$SG70351 DB	'LINEDOWN', 00H
	ORG $+3
$SG70354 DB	'PAGEDOWN', 00H
	ORG $+3
$SG70357 DB	'BOTTOM', 00H
	ORG $+1
$SG70360 DB	'SHRINK', 00H
	ORG $+1
$SG70363 DB	'EXPAND', 00H
	ORG $+1
$SG70366 DB	'PAGESIZE=', 00H
	ORG $+2
$SG70369 DB	'COPY', 00H
	ORG $+3
$SG70373 DB	'CB', 00H
	ORG $+1
$SG70385 DB	'D0$0#CB$', 00H
	ORG $+3
$SG70387 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70393 DB	'PASTE', 00H
	ORG $+2
$SG70404 DB	'CB', 00H
	ORG $+1
$SG70419 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70422 DB	'PRINT', 00H
	ORG $+2
$SG70425 DB	'EXPORT', 00H
	ORG $+1
$SG70429 DB	'CLEAR', 00H
	ORG $+2
$SG70438 DB	'ACTBTN', 00H
	ORG $+1
$SG70443 DB	'%lu', 00H
$SG70447 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70449 DB	'%lu', 00H
$SG70453 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70458 DB	'D:\Travail\ABI\EVA\V4.0\CGI\Brunix-2016\table_utils.c', 00H
	ORG $+2
$SG70459 DB	'table_process_controls', 00H
	ORG $+1
$SG70462 DB	'MOVE', 00H
	ORG $+3
$SG70466 DB	'MOVEUP', 00H
	ORG $+1
$SG70469 DB	'MOVETOP', 00H
$SG70472 DB	'MOVEDOWN', 00H
	ORG $+3
$SG70475 DB	'MOVEBOTTOM', 00H
	ORG $+1
$SG70484 DB	'SORT', 00H
	ORG $+3
$SG70487 DB	'DESC', 00H
	ORG $+3
$SG70491 DB	'SEARCHCOL', 00H
	ORG $+2
$SG70496 DB	'_EVA_AUTOCLOSE', 00H
	ORG $+1
$SG70497 DB	'NOP', 00H
$SG70502 DB	'D:\Travail\ABI\EVA\V4.0\CGI\Brunix-2016\table_utils.c', 00H
	ORG $+2
$SG70503 DB	'table_process_controls', 00H
	ORG $+1
$SG70505 DB	'D:\Travail\ABI\EVA\V4.0\CGI\Brunix-2016\table_utils.c', 00H
	ORG $+2
$SG70506 DB	'table_process_controls', 00H
_DATA	ENDS
_TEXT	SEGMENT
_cntxt$ = 8
_i_ctrl$ = 12
_form$ = -4
_ctrl$ = -124
_tbl$ = -12
_list$ = -52
_formstamp$ = -116
_fields$ = -32
_values$ = -96
_id_obj$ = -72
_name$ = -120
_i$ = -76
_row$ = -8
_btn$70254 = -128
_val$70259 = -132
_inputfield$70260 = -136
_line$70370 = -140
_c$70380 = -144
_line$70394 = -148
_num$70395 = -152
_c$70399 = -156
_c$70408 = -160
_b_modif$70409 = -180
__n$70411 = -184
_l$70412 = -176
_row$70413 = -168
_col$70414 = -164
__c$70415 = -172
_line$70430 = -188
_f$70439 = -912
_f0$70440 = -916
_ctl$70441 = -668
__tmp$70442 = -948
__tmp$70448 = -980
_dest$70463 = -984
_src$70464 = -988
_c$70479 = -992
_num$70480 = -996
_sortcol$70485 = -1004
_b_sortdesc$70486 = -1000
_col$70492 = -1008
_table_process_controls PROC NEAR

; 80   : ){

	push	ebp
	mov	ebp, esp
	sub	esp, 1056				; 00000420H
	push	edi

; 81   : 	EVA_form *form = cntxt->form;

	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	ecx, DWORD PTR [eax+80]
	mov	DWORD PTR _form$[ebp], ecx

; 82   : 	EVA_ctrl *ctrl = form->ctrl + i_ctrl;

	mov	edx, DWORD PTR _i_ctrl$[ebp]
	imul	edx, 480				; 000001e0H
	mov	eax, DWORD PTR _form$[ebp]
	mov	ecx, DWORD PTR [eax]
	add	ecx, edx
	mov	DWORD PTR _ctrl$[ebp], ecx

; 83   : 	ObjTableFormat *tbl = ctrl->objtbl;

	mov	edx, DWORD PTR _ctrl$[ebp]
	mov	eax, DWORD PTR [edx+232]
	mov	DWORD PTR _tbl$[ebp], eax

; 84   : 	DynTable list = { 0 };

	mov	DWORD PTR _list$[ebp], 0
	xor	ecx, ecx
	mov	DWORD PTR _list$[ebp+4], ecx
	mov	DWORD PTR _list$[ebp+8], ecx
	mov	DWORD PTR _list$[ebp+12], ecx
	mov	DWORD PTR _list$[ebp+16], ecx

; 85   : 	DynTable formstamp = { 0 };

	mov	DWORD PTR _formstamp$[ebp], 0
	xor	edx, edx
	mov	DWORD PTR _formstamp$[ebp+4], edx
	mov	DWORD PTR _formstamp$[ebp+8], edx
	mov	DWORD PTR _formstamp$[ebp+12], edx
	mov	DWORD PTR _formstamp$[ebp+16], edx

; 86   : 	DynTable fields = { 0 };

	mov	DWORD PTR _fields$[ebp], 0
	xor	eax, eax
	mov	DWORD PTR _fields$[ebp+4], eax
	mov	DWORD PTR _fields$[ebp+8], eax
	mov	DWORD PTR _fields$[ebp+12], eax
	mov	DWORD PTR _fields$[ebp+16], eax

; 87   : 	DynTable values = { 0 };

	mov	DWORD PTR _values$[ebp], 0
	xor	ecx, ecx
	mov	DWORD PTR _values$[ebp+4], ecx
	mov	DWORD PTR _values$[ebp+8], ecx
	mov	DWORD PTR _values$[ebp+12], ecx
	mov	DWORD PTR _values$[ebp+16], ecx

; 88   : 	DynTable id_obj = { 0 };

	mov	DWORD PTR _id_obj$[ebp], 0
	xor	edx, edx
	mov	DWORD PTR _id_obj$[ebp+4], edx
	mov	DWORD PTR _id_obj$[ebp+8], edx
	mov	DWORD PTR _id_obj$[ebp+12], edx
	mov	DWORD PTR _id_obj$[ebp+16], edx

; 89   : 	DynBuffer *name = NULL;

	mov	DWORD PTR _name$[ebp], 0

; 90   : 	unsigned long i, row;
; 91   : 
; 92   : 	/* If a control button was clicked */
; 93   : 	if(form->i_ctrl_clic == i_ctrl)

	mov	eax, DWORD PTR _form$[ebp]
	mov	ecx, DWORD PTR [eax+124]
	cmp	ecx, DWORD PTR _i_ctrl$[ebp]
	jne	$L70253

; 95   : 		/* Add new object if add button */
; 96   : 		char *btn = CGI_CLICK_BTN_SUBFIELD;

	mov	edx, DWORD PTR _cntxt$[ebp]
	cmp	DWORD PTR [edx+29648], 0
	je	SHORT $L73270
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	ecx, DWORD PTR [eax+29656]
	imul	ecx, 56					; 00000038H
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	eax, DWORD PTR [edx+29648]
	mov	ecx, DWORD PTR [eax+ecx]
	movsx	edx, BYTE PTR [ecx]
	cmp	edx, 66					; 00000042H
	jne	SHORT $L73270
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	ecx, DWORD PTR [eax+29656]
	imul	ecx, 56					; 00000038H
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	eax, DWORD PTR [edx+29648]
	cmp	DWORD PTR [eax+ecx+32], 0
	je	SHORT $L73270
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	edx, DWORD PTR [ecx+29656]
	imul	edx, 56					; 00000038H
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	ecx, DWORD PTR [eax+29648]
	mov	edx, DWORD PTR [ecx+edx+32]
	mov	DWORD PTR -1012+[ebp], edx
	jmp	SHORT $L73271
$L73270:
	mov	DWORD PTR -1012+[ebp], OFFSET FLAT:$SG70255
$L73271:
	mov	eax, DWORD PTR -1012+[ebp]
	mov	DWORD PTR _btn$70254[ebp], eax

; 97   : 		tbl->ctrlline = cntxt->cgi[cntxt->cgibtn].Line;

	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	edx, DWORD PTR [ecx+29656]
	imul	edx, 56					; 00000038H
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	ecx, DWORD PTR [eax+29648]
	mov	eax, DWORD PTR _tbl$[ebp]
	mov	ecx, DWORD PTR [ecx+edx+40]
	mov	DWORD PTR [eax+56], ecx

; 98   : 		if(!tbl->input) tbl->input = dyntab_val(&tbl->cgiinput, 0, 0);

	mov	edx, DWORD PTR _tbl$[ebp]
	cmp	DWORD PTR [edx+100], 0
	jne	SHORT $L70256
	push	0
	push	0
	mov	eax, DWORD PTR _tbl$[ebp]
	add	eax, 80					; 00000050H
	push	eax
	call	_dyntab_val
	add	esp, 12					; 0000000cH
	mov	ecx, DWORD PTR _tbl$[ebp]
	mov	DWORD PTR [ecx+100], eax
$L70256:

; 99   : 
; 100  : 		if(!strcmp(btn, "ADDNEWOBJ"))

	push	OFFSET FLAT:$SG70258
	mov	edx, DWORD PTR _btn$70254[ebp]
	push	edx
	call	_strcmp
	add	esp, 8
	test	eax, eax
	jne	$L70257

; 102  : 			DynTableCell *val;
; 103  : 			DynTableCell *inputfield = DYNTAB_FIELD_CELL(tbl->attr, DISPLAYFIELDS);

	push	0
	push	-1
	push	OFFSET FLAT:$SG70261
	mov	eax, DWORD PTR _tbl$[ebp]
	mov	ecx, DWORD PTR [eax]
	push	ecx
	call	_dyntab_field_cell
	add	esp, 16					; 00000010H
	mov	DWORD PTR _inputfield$70260[ebp], eax

; 104  : 
; 105  : 			/* Get create parameters */
; 106  : 			CTRL_ATTR(formstamp, LIST_CREATE_FORM);

	lea	edx, DWORD PTR _formstamp$[ebp]
	push	edx
	call	_dyntab_free
	add	esp, 4
	push	0
	push	-1
	push	OFFSET FLAT:$SG70264
	mov	eax, DWORD PTR _ctrl$[ebp]
	add	eax, 44					; 0000002cH
	push	eax
	push	0
	lea	ecx, DWORD PTR _formstamp$[ebp]
	push	ecx
	call	_dyntab_filter_field
	add	esp, 24					; 00000018H
	test	eax, eax
	je	SHORT $L70263
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29872], OFFSET FLAT:$SG70266
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 106		; 0000006aH
	jmp	$eva_err$70267
$L70263:

; 107  : 			if(!formstamp.nbrows) CTRL_ATTR(formstamp, BASE_FORMS);

	cmp	DWORD PTR _formstamp$[ebp], 0
	jne	SHORT $L70270
	lea	ecx, DWORD PTR _formstamp$[ebp]
	push	ecx
	call	_dyntab_free
	add	esp, 4
	push	0
	push	-1
	push	OFFSET FLAT:$SG70271
	mov	edx, DWORD PTR _ctrl$[ebp]
	add	edx, 44					; 0000002cH
	push	edx
	push	0
	lea	eax, DWORD PTR _formstamp$[ebp]
	push	eax
	call	_dyntab_filter_field
	add	esp, 24					; 00000018H
	test	eax, eax
	je	SHORT $L70270
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29872], OFFSET FLAT:$SG70273
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 107		; 0000006bH
	jmp	$eva_err$70267
$L70270:

; 108  : 			CTRL_ATTR_TAB(fields, LIST_CREATE_FIELD);

	lea	eax, DWORD PTR _fields$[ebp]
	push	eax
	call	_dyntab_free
	add	esp, 4
	push	0
	push	-1
	push	OFFSET FLAT:$SG70276
	mov	ecx, DWORD PTR _ctrl$[ebp]
	add	ecx, 44					; 0000002cH
	push	ecx
	push	0
	lea	edx, DWORD PTR _fields$[ebp]
	push	edx
	call	_dyntab_filter_field
	add	esp, 24					; 00000018H
	test	eax, eax
	je	SHORT $L70275
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29872], OFFSET FLAT:$SG70278
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 108		; 0000006cH
	jmp	$eva_err$70267
$L70275:
	lea	edx, DWORD PTR _fields$[ebp]
	push	edx
	call	_dyntab_order_lines
	add	esp, 4
	test	eax, eax
	je	SHORT $L70279
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29872], OFFSET FLAT:$SG70281
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 108		; 0000006cH
	jmp	$eva_err$70267
$L70279:

; 109  : 			CTRL_ATTR_TAB(values, LIST_CREATE_VALUE);

	lea	edx, DWORD PTR _values$[ebp]
	push	edx
	call	_dyntab_free
	add	esp, 4
	push	0
	push	-1
	push	OFFSET FLAT:$SG70284
	mov	eax, DWORD PTR _ctrl$[ebp]
	add	eax, 44					; 0000002cH
	push	eax
	push	0
	lea	ecx, DWORD PTR _values$[ebp]
	push	ecx
	call	_dyntab_filter_field
	add	esp, 24					; 00000018H
	test	eax, eax
	je	SHORT $L70283
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29872], OFFSET FLAT:$SG70286
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 109		; 0000006dH
	jmp	$eva_err$70267
$L70283:
	lea	ecx, DWORD PTR _values$[ebp]
	push	ecx
	call	_dyntab_order_lines
	add	esp, 4
	test	eax, eax
	je	SHORT $L70287
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29872], OFFSET FLAT:$SG70289
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 109		; 0000006dH
	jmp	$eva_err$70267
$L70287:

; 110  : 			if((tbl->status & TblCtrl_openaddnew) && inputfield && formstamp.nbrows &&
; 111  : 				tbl->input && tbl->input[0])

	mov	ecx, DWORD PTR _tbl$[ebp]
	mov	edx, DWORD PTR [ecx+32]
	and	edx, 128				; 00000080H
	test	edx, edx
	je	$L70290
	cmp	DWORD PTR _inputfield$70260[ebp], 0
	je	$L70290
	cmp	DWORD PTR _formstamp$[ebp], 0
	je	$L70290
	mov	eax, DWORD PTR _tbl$[ebp]
	cmp	DWORD PTR [eax+100], 0
	je	$L70290
	mov	ecx, DWORD PTR _tbl$[ebp]
	mov	edx, DWORD PTR [ecx+100]
	movsx	eax, BYTE PTR [edx]
	test	eax, eax
	je	$L70290

; 113  : 				/* Prepare object data */
; 114  : 				DYNTAB_SET(&list, 0, 2, "V");

	push	1
	push	OFFSET FLAT:$SG70292
	push	2
	push	0
	lea	ecx, DWORD PTR _list$[ebp]
	push	ecx
	call	_dyntab_set_txt
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L70291
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29872], OFFSET FLAT:$SG70294
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 114		; 00000072H
	jmp	$eva_err$70267
$L70291:

; 115  : 				DYNTAB_ADD(&list, 0, 1, tbl->input, 0, NO_CONV);

	push	0
	push	0
	push	0
	mov	ecx, DWORD PTR _tbl$[ebp]
	mov	edx, DWORD PTR [ecx+100]
	push	edx
	push	1
	push	0
	lea	eax, DWORD PTR _list$[ebp]
	push	eax
	call	_dyntab_add
	add	esp, 28					; 0000001cH
	test	eax, eax
	je	SHORT $L70296
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29872], OFFSET FLAT:$SG70298
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 115		; 00000073H
	jmp	$eva_err$70267
$L70296:

; 116  : 				DYNTAB_SET_CELLP(&list, 0, 0, inputfield);

	push	0
	mov	eax, DWORD PTR _inputfield$70260[ebp]
	push	eax
	push	0
	push	0
	lea	ecx, DWORD PTR _list$[ebp]
	push	ecx
	call	_dyntab_copy
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L70299
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29872], OFFSET FLAT:$SG70301
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 116		; 00000074H
	jmp	$eva_err$70267
$L70299:

; 117  : 				for(i = 0; i < fields.nbrows; i++)

	mov	DWORD PTR _i$[ebp], 0
	jmp	SHORT $L70302
$L70303:
	mov	ecx, DWORD PTR _i$[ebp]
	add	ecx, 1
	mov	DWORD PTR _i$[ebp], ecx
$L70302:
	mov	edx, DWORD PTR _i$[ebp]
	cmp	edx, DWORD PTR _fields$[ebp]
	jae	$L70304

; 119  : 					row = list.nbrows;

	mov	eax, DWORD PTR _list$[ebp]
	mov	DWORD PTR _row$[ebp], eax

; 120  : 					DYNTAB_SET(&list, row, 2, "V");

	push	1
	push	OFFSET FLAT:$SG70306
	push	2
	mov	ecx, DWORD PTR _row$[ebp]
	push	ecx
	lea	edx, DWORD PTR _list$[ebp]
	push	edx
	call	_dyntab_set_txt
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L70305
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29872], OFFSET FLAT:$SG70308
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 120		; 00000078H
	jmp	$eva_err$70267
$L70305:

; 121  : 					DYNTAB_SET_CELL(&list, row, 1, &values, i, 0);

	push	0
	push	0
	mov	edx, DWORD PTR _i$[ebp]
	push	edx
	lea	eax, DWORD PTR _values$[ebp]
	push	eax
	call	_dyntab_cell
	add	esp, 12					; 0000000cH
	push	eax
	push	1
	mov	ecx, DWORD PTR _row$[ebp]
	push	ecx
	lea	edx, DWORD PTR _list$[ebp]
	push	edx
	call	_dyntab_copy
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L70309
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29872], OFFSET FLAT:$SG70311
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 121		; 00000079H
	jmp	$eva_err$70267
$L70309:

; 122  : 					DYNTAB_SET_CELL(&list, row, 0, &fields, i, 0);

	push	0
	push	0
	mov	edx, DWORD PTR _i$[ebp]
	push	edx
	lea	eax, DWORD PTR _fields$[ebp]
	push	eax
	call	_dyntab_cell
	add	esp, 12					; 0000000cH
	push	eax
	push	0
	mov	ecx, DWORD PTR _row$[ebp]
	push	ecx
	lea	edx, DWORD PTR _list$[ebp]
	push	edx
	call	_dyntab_copy
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L70312
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29872], OFFSET FLAT:$SG70314
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 122		; 0000007aH
	jmp	$eva_err$70267
$L70312:

; 123  : 				}

	jmp	$L70303
$L70304:

; 124  : 
; 125  : 				/* Create new object with given formstamp */
; 126  : 				if(qry_add_obj_data(cntxt, &id_obj, &list, &formstamp, 0)) STACK_ERROR;

	push	0
	lea	edx, DWORD PTR _formstamp$[ebp]
	push	edx
	lea	eax, DWORD PTR _list$[ebp]
	push	eax
	lea	ecx, DWORD PTR _id_obj$[ebp]
	push	ecx
	mov	edx, DWORD PTR _cntxt$[ebp]
	push	edx
	call	_qry_add_obj_data
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L70315
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 126		; 0000007eH
	jmp	$eva_err$70267
$L70315:

; 127  : 
; 128  : 				/* Add new object to the relation at end of list */
; 129  : 				row = ctrl->val.nbrows;

	mov	ecx, DWORD PTR _ctrl$[ebp]
	mov	edx, DWORD PTR [ecx+64]
	mov	DWORD PTR _row$[ebp], edx

; 130  : 				DYNTAB_ADD_CELL(&ctrl->val, row, 0, &id_obj, 0, 0);

	push	1
	push	0
	push	0
	lea	eax, DWORD PTR _id_obj$[ebp]
	push	eax
	call	_dyntab_cell
	add	esp, 12					; 0000000cH
	push	eax
	push	0
	mov	ecx, DWORD PTR _row$[ebp]
	push	ecx
	mov	edx, DWORD PTR _ctrl$[ebp]
	add	edx, 64					; 00000040H
	push	edx
	call	_dyntab_copy
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L70316
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29872], OFFSET FLAT:$SG70318
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 130		; 00000082H
	jmp	$eva_err$70267
$L70316:

; 131  : 				val = dyntab_cell(&ctrl->val, row, 0);

	push	0
	mov	edx, DWORD PTR _row$[ebp]
	push	edx
	mov	eax, DWORD PTR _ctrl$[ebp]
	add	eax, 64					; 00000040H
	push	eax
	call	_dyntab_cell
	add	esp, 12					; 0000000cH
	mov	DWORD PTR _val$70259[ebp], eax

; 132  : 				val->b_modified = 1;

	mov	ecx, DWORD PTR _val$70259[ebp]
	mov	BYTE PTR [ecx+13], 1

; 133  : 				val->i_cgi = cntxt->nb_cgi;

	mov	edx, DWORD PTR _val$70259[ebp]
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	ecx, DWORD PTR [eax+29652]
	mov	DWORD PTR [edx+48], ecx

; 134  : 				ctrl->b_modified = 1;

	mov	edx, DWORD PTR _ctrl$[ebp]
	mov	DWORD PTR [edx+200], 1

; 135  : 
; 136  : 				/* Clear input value in CGI data to avoid multiple creation */
; 137  : 				tbl->input [0] = 0;

	mov	eax, DWORD PTR _tbl$[ebp]
	mov	ecx, DWORD PTR [eax+100]
	mov	BYTE PTR [ecx], 0
$L70290:

; 140  : 
; 141  : 		/* Handle status buttons */
; 142  : 		else if(!strcmp(btn, "SEARCHBEGIN")) tbl->srchmode = Begin;

	jmp	$L70490
$L70257:
	push	OFFSET FLAT:$SG70321
	mov	edx, DWORD PTR _btn$70254[ebp]
	push	edx
	call	_strcmp
	add	esp, 8
	test	eax, eax
	jne	SHORT $L70320
	mov	eax, DWORD PTR _tbl$[ebp]
	mov	DWORD PTR [eax+72], 13			; 0000000dH

; 143  : 		else if(!strcmp(btn, "SEARCHEXACT")) tbl->srchmode = Exact;

	jmp	$L70490
$L70320:
	push	OFFSET FLAT:$SG70324
	mov	ecx, DWORD PTR _btn$70254[ebp]
	push	ecx
	call	_strcmp
	add	esp, 8
	test	eax, eax
	jne	SHORT $L70323
	mov	edx, DWORD PTR _tbl$[ebp]
	mov	DWORD PTR [edx+72], 6

; 144  : 		else if(!strcmp(btn, "SEARCHCONTAIN")) tbl->srchmode = Contain;

	jmp	$L70490
$L70323:
	push	OFFSET FLAT:$SG70327
	mov	eax, DWORD PTR _btn$70254[ebp]
	push	eax
	call	_strcmp
	add	esp, 8
	test	eax, eax
	jne	SHORT $L70326
	mov	ecx, DWORD PTR _tbl$[ebp]
	mov	DWORD PTR [ecx+72], 11			; 0000000bH

; 145  : 
; 146  : 		/* Handle status buttons */
; 147  : 		else if(!strcmp(btn, "OPENSEARCH"))

	jmp	$L70490
$L70326:
	push	OFFSET FLAT:$SG70330
	mov	edx, DWORD PTR _btn$70254[ebp]
	push	edx
	call	_strcmp
	add	esp, 8
	test	eax, eax
	jne	SHORT $L70329

; 149  : 			if(tbl->status & TblCtrl_search) tbl->status |= TblCtrl_opensearch;

	mov	eax, DWORD PTR _tbl$[ebp]
	mov	ecx, DWORD PTR [eax+32]
	and	ecx, 16					; 00000010H
	test	ecx, ecx
	je	SHORT $L70331
	mov	edx, DWORD PTR _tbl$[ebp]
	mov	eax, DWORD PTR [edx+32]
	or	al, 32					; 00000020H
	mov	ecx, DWORD PTR _tbl$[ebp]
	mov	DWORD PTR [ecx+32], eax
$L70331:

; 150  : 			if(tbl->status & TblCtrl_sel) tbl->status |= TblCtrl_opensel;

	mov	edx, DWORD PTR _tbl$[ebp]
	mov	eax, DWORD PTR [edx+32]
	and	eax, 256				; 00000100H
	test	eax, eax
	je	SHORT $L70332
	mov	ecx, DWORD PTR _tbl$[ebp]
	mov	edx, DWORD PTR [ecx+32]
	or	dh, 2
	mov	eax, DWORD PTR _tbl$[ebp]
	mov	DWORD PTR [eax+32], edx
$L70332:

; 151  : 			tbl->status &= ~TblCtrl_openaddnew;

	mov	ecx, DWORD PTR _tbl$[ebp]
	mov	edx, DWORD PTR [ecx+32]
	and	dl, 127					; 0000007fH
	mov	eax, DWORD PTR _tbl$[ebp]
	mov	DWORD PTR [eax+32], edx

; 153  : 		else if(!strcmp(btn, "CLOSESEARCH"))

	jmp	$L70490
$L70329:
	push	OFFSET FLAT:$SG70335
	mov	ecx, DWORD PTR _btn$70254[ebp]
	push	ecx
	call	_strcmp
	add	esp, 8
	test	eax, eax
	jne	SHORT $L70334

; 155  : 			tbl->status &= ~(TblCtrl_opensearch | TblCtrl_opensel);

	mov	edx, DWORD PTR _tbl$[ebp]
	mov	eax, DWORD PTR [edx+32]
	and	eax, -545				; fffffddfH
	mov	ecx, DWORD PTR _tbl$[ebp]
	mov	DWORD PTR [ecx+32], eax

; 157  : 		else if(!strcmp(btn, "OPENADDNEW"))

	jmp	$L70490
$L70334:
	push	OFFSET FLAT:$SG70338
	mov	edx, DWORD PTR _btn$70254[ebp]
	push	edx
	call	_strcmp
	add	esp, 8
	test	eax, eax
	jne	SHORT $L70337

; 159  : 			tbl->status ^= TblCtrl_openaddnew;

	mov	eax, DWORD PTR _tbl$[ebp]
	mov	ecx, DWORD PTR [eax+32]
	xor	ecx, 128				; 00000080H
	mov	edx, DWORD PTR _tbl$[ebp]
	mov	DWORD PTR [edx+32], ecx

; 160  : 			if(tbl->status & TblCtrl_openaddnew) tbl->status &= ~(TblCtrl_opensearch | TblCtrl_opensel);

	mov	eax, DWORD PTR _tbl$[ebp]
	mov	ecx, DWORD PTR [eax+32]
	and	ecx, 128				; 00000080H
	test	ecx, ecx
	je	SHORT $L70339
	mov	edx, DWORD PTR _tbl$[ebp]
	mov	eax, DWORD PTR [edx+32]
	and	eax, -545				; fffffddfH
	mov	ecx, DWORD PTR _tbl$[ebp]
	mov	DWORD PTR [ecx+32], eax
$L70339:

; 162  : 		else if(!strcmp(btn, "TOP")) tbl->line = 0;

	jmp	$L70490
$L70337:
	push	OFFSET FLAT:$SG70342
	mov	edx, DWORD PTR _btn$70254[ebp]
	push	edx
	call	_strcmp
	add	esp, 8
	test	eax, eax
	jne	SHORT $L70341
	mov	eax, DWORD PTR _tbl$[ebp]
	mov	DWORD PTR [eax+40], 0

; 163  : 		else if(!strcmp(btn, "PAGEUP")) tbl->line = tbl->line > tbl->lines ? tbl->line - tbl->lines : 0;

	jmp	$L70490
$L70341:
	push	OFFSET FLAT:$SG70345
	mov	ecx, DWORD PTR _btn$70254[ebp]
	push	ecx
	call	_strcmp
	add	esp, 8
	test	eax, eax
	jne	SHORT $L70344
	mov	edx, DWORD PTR _tbl$[ebp]
	mov	eax, DWORD PTR _tbl$[ebp]
	mov	ecx, DWORD PTR [edx+40]
	cmp	ecx, DWORD PTR [eax+44]
	jbe	SHORT $L73272
	mov	edx, DWORD PTR _tbl$[ebp]
	mov	eax, DWORD PTR _tbl$[ebp]
	mov	ecx, DWORD PTR [edx+40]
	sub	ecx, DWORD PTR [eax+44]
	mov	DWORD PTR -1016+[ebp], ecx
	jmp	SHORT $L73273
$L73272:
	mov	DWORD PTR -1016+[ebp], 0
$L73273:
	mov	edx, DWORD PTR _tbl$[ebp]
	mov	eax, DWORD PTR -1016+[ebp]
	mov	DWORD PTR [edx+40], eax

; 164  : 		else if(!strcmp(btn, "LINEUP")) tbl->line = tbl->line ? tbl->line - 1 : 0;

	jmp	$L70490
$L70344:
	push	OFFSET FLAT:$SG70348
	mov	ecx, DWORD PTR _btn$70254[ebp]
	push	ecx
	call	_strcmp
	add	esp, 8
	test	eax, eax
	jne	SHORT $L70347
	mov	edx, DWORD PTR _tbl$[ebp]
	cmp	DWORD PTR [edx+40], 0
	je	SHORT $L73274
	mov	eax, DWORD PTR _tbl$[ebp]
	mov	ecx, DWORD PTR [eax+40]
	sub	ecx, 1
	mov	DWORD PTR -1020+[ebp], ecx
	jmp	SHORT $L73275
$L73274:
	mov	DWORD PTR -1020+[ebp], 0
$L73275:
	mov	edx, DWORD PTR _tbl$[ebp]
	mov	eax, DWORD PTR -1020+[ebp]
	mov	DWORD PTR [edx+40], eax

; 165  : 		else if(!strcmp(btn, "LINEDOWN")) tbl->line++;

	jmp	$L70490
$L70347:
	push	OFFSET FLAT:$SG70351
	mov	ecx, DWORD PTR _btn$70254[ebp]
	push	ecx
	call	_strcmp
	add	esp, 8
	test	eax, eax
	jne	SHORT $L70350
	mov	edx, DWORD PTR _tbl$[ebp]
	mov	eax, DWORD PTR [edx+40]
	add	eax, 1
	mov	ecx, DWORD PTR _tbl$[ebp]
	mov	DWORD PTR [ecx+40], eax

; 166  : 		else if(!strcmp(btn, "PAGEDOWN")) tbl->line += tbl->lines;

	jmp	$L70490
$L70350:
	push	OFFSET FLAT:$SG70354
	mov	edx, DWORD PTR _btn$70254[ebp]
	push	edx
	call	_strcmp
	add	esp, 8
	test	eax, eax
	jne	SHORT $L70353
	mov	eax, DWORD PTR _tbl$[ebp]
	mov	ecx, DWORD PTR [eax+40]
	mov	edx, DWORD PTR _tbl$[ebp]
	add	ecx, DWORD PTR [edx+44]
	mov	eax, DWORD PTR _tbl$[ebp]
	mov	DWORD PTR [eax+40], ecx

; 167  : 		else if(!strcmp(btn, "BOTTOM")) tbl->line = ~0UL;

	jmp	$L70490
$L70353:
	push	OFFSET FLAT:$SG70357
	mov	ecx, DWORD PTR _btn$70254[ebp]
	push	ecx
	call	_strcmp
	add	esp, 8
	test	eax, eax
	jne	SHORT $L70356
	mov	edx, DWORD PTR _tbl$[ebp]
	mov	DWORD PTR [edx+40], -1

; 168  : 		else if(!strcmp(btn, "SHRINK")) tbl->lines /= 2;

	jmp	$L70490
$L70356:
	push	OFFSET FLAT:$SG70360
	mov	eax, DWORD PTR _btn$70254[ebp]
	push	eax
	call	_strcmp
	add	esp, 8
	test	eax, eax
	jne	SHORT $L70359
	mov	ecx, DWORD PTR _tbl$[ebp]
	mov	edx, DWORD PTR [ecx+44]
	shr	edx, 1
	mov	eax, DWORD PTR _tbl$[ebp]
	mov	DWORD PTR [eax+44], edx

; 169  : 		else if(!strcmp(btn, "EXPAND")) tbl->lines *= 2;

	jmp	$L70490
$L70359:
	push	OFFSET FLAT:$SG70363
	mov	ecx, DWORD PTR _btn$70254[ebp]
	push	ecx
	call	_strcmp
	add	esp, 8
	test	eax, eax
	jne	SHORT $L70362
	mov	edx, DWORD PTR _tbl$[ebp]
	mov	eax, DWORD PTR [edx+44]
	shl	eax, 1
	mov	ecx, DWORD PTR _tbl$[ebp]
	mov	DWORD PTR [ecx+44], eax

; 170  : 		else if(!strncmp(btn, add_sz_str("PAGESIZE="))) tbl->lines = atoi(btn + 9);

	jmp	$L70490
$L70362:
	push	9
	push	OFFSET FLAT:$SG70366
	mov	edx, DWORD PTR _btn$70254[ebp]
	push	edx
	call	_strncmp
	add	esp, 12					; 0000000cH
	test	eax, eax
	jne	SHORT $L70365
	mov	eax, DWORD PTR _btn$70254[ebp]
	add	eax, 9
	push	eax
	call	_atoi
	add	esp, 4
	mov	ecx, DWORD PTR _tbl$[ebp]
	mov	DWORD PTR [ecx+44], eax

; 171  : 
; 172  : 		/* Handle Copy button */
; 173  : 		else if(!strcmp(btn, "COPY"))

	jmp	$L70490
$L70365:
	push	OFFSET FLAT:$SG70369
	mov	edx, DWORD PTR _btn$70254[ebp]
	push	edx
	call	_strcmp
	add	esp, 8
	test	eax, eax
	jne	$L70368

; 175  : 			/* Clear current clipboard values */
; 176  : 			unsigned long line = cntxt->cgi[cntxt->cgibtn].Line;

	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	ecx, DWORD PTR [eax+29656]
	imul	ecx, 56					; 00000038H
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	eax, DWORD PTR [edx+29648]
	mov	ecx, DWORD PTR [eax+ecx+40]
	mov	DWORD PTR _line$70370[ebp], ecx

; 177  : 			if(cgi_filter_values(cntxt, &values, 'D', 0, 0, 0, "CB", NULL, 0, 0)) STACK_ERROR;

	push	0
	push	0
	push	0
	push	OFFSET FLAT:$SG70373
	push	0
	push	0
	push	0
	push	68					; 00000044H
	lea	edx, DWORD PTR _values$[ebp]
	push	edx
	mov	eax, DWORD PTR _cntxt$[ebp]
	push	eax
	call	_cgi_filter_values
	add	esp, 40					; 00000028H
	test	eax, eax
	je	SHORT $L70372
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 177		; 000000b1H
	jmp	$eva_err$70267
$L70372:

; 178  : 			for(i = 0; i < values.nbrows; i++) cgi_value_setkeep(cntxt, &values, i, 2);

	mov	DWORD PTR _i$[ebp], 0
	jmp	SHORT $L70374
$L70375:
	mov	edx, DWORD PTR _i$[ebp]
	add	edx, 1
	mov	DWORD PTR _i$[ebp], edx
$L70374:
	mov	eax, DWORD PTR _i$[ebp]
	cmp	eax, DWORD PTR _values$[ebp]
	jae	SHORT $L70376
	push	2
	mov	ecx, DWORD PTR _i$[ebp]
	push	ecx
	lea	edx, DWORD PTR _values$[ebp]
	push	edx
	mov	eax, DWORD PTR _cntxt$[ebp]
	push	eax
	call	_cgi_value_setkeep
	add	esp, 16					; 00000010H
	jmp	SHORT $L70375
$L70376:

; 179  : 
; 180  : 			/* Add new values */
; 181  : 			for(i = 0; i < ctrl->val.nbrows; i++)

	mov	DWORD PTR _i$[ebp], 0
	jmp	SHORT $L70377
$L70378:
	mov	ecx, DWORD PTR _i$[ebp]
	add	ecx, 1
	mov	DWORD PTR _i$[ebp], ecx
$L70377:
	mov	edx, DWORD PTR _ctrl$[ebp]
	mov	eax, DWORD PTR _i$[ebp]
	cmp	eax, DWORD PTR [edx+64]
	jae	$L70379

; 183  : 				DynTableCell *c = dyntab_cell(&ctrl->val, i, 0);

	push	0
	mov	ecx, DWORD PTR _i$[ebp]
	push	ecx
	mov	edx, DWORD PTR _ctrl$[ebp]
	add	edx, 64					; 00000040H
	push	edx
	call	_dyntab_cell
	add	esp, 12					; 0000000cH
	mov	DWORD PTR _c$70380[ebp], eax

; 184  : 				if(!line || line == c->Line)

	cmp	DWORD PTR _line$70370[ebp], 0
	je	SHORT $L70382
	mov	eax, DWORD PTR _c$70380[ebp]
	mov	ecx, DWORD PTR _line$70370[ebp]
	cmp	ecx, DWORD PTR [eax+40]
	jne	$L70390
$L70382:

; 186  : 					M_FREE(name);

	mov	edx, DWORD PTR _name$[ebp]
	push	edx
	call	_mem_free
	add	esp, 4
	mov	DWORD PTR _name$[ebp], 0

; 187  : 					DYNBUF_ADD3_INT(&name, "D0$0#CB$", c->Num, "");

	push	0
	push	OFFSET FLAT:$SG70384
	mov	eax, DWORD PTR _c$70380[ebp]
	mov	ecx, DWORD PTR [eax+36]
	push	ecx
	push	8
	push	OFFSET FLAT:$SG70385
	lea	edx, DWORD PTR _name$[ebp]
	push	edx
	call	_dynbuf_add3_int
	add	esp, 24					; 00000018H
	test	eax, eax
	je	SHORT $L70383
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29872], OFFSET FLAT:$SG70387
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 187		; 000000bbH
	jmp	$eva_err$70267
$L70383:

; 188  : 					if(cgi_add_input(cntxt, NULL, DYNBUF_VAL_SZ(name), DYNTAB_VAL_SZ(&ctrl->val, i, 0))) STACK_ERROR;

	cmp	DWORD PTR _name$[ebp], 0
	je	SHORT $L73276
	mov	edx, DWORD PTR _name$[ebp]
	mov	eax, DWORD PTR [edx+4]
	mov	DWORD PTR -1024+[ebp], eax
	jmp	SHORT $L73277
$L73276:
	mov	DWORD PTR -1024+[ebp], 0
$L73277:
	cmp	DWORD PTR _name$[ebp], 0
	je	SHORT $L73278
	mov	ecx, DWORD PTR _name$[ebp]
	add	ecx, 8
	mov	DWORD PTR -1028+[ebp], ecx
	jmp	SHORT $L73279
$L73278:
	mov	DWORD PTR -1028+[ebp], 0
$L73279:
	push	0
	mov	edx, DWORD PTR _i$[ebp]
	push	edx
	mov	eax, DWORD PTR _ctrl$[ebp]
	add	eax, 64					; 00000040H
	push	eax
	call	_dyntab_sz
	add	esp, 12					; 0000000cH
	push	eax
	push	0
	mov	ecx, DWORD PTR _i$[ebp]
	push	ecx
	mov	edx, DWORD PTR _ctrl$[ebp]
	add	edx, 64					; 00000040H
	push	edx
	call	_dyntab_val
	add	esp, 12					; 0000000cH
	push	eax
	mov	eax, DWORD PTR -1024+[ebp]
	push	eax
	mov	ecx, DWORD PTR -1028+[ebp]
	push	ecx
	push	0
	mov	edx, DWORD PTR _cntxt$[ebp]
	push	edx
	call	_cgi_add_input
	add	esp, 24					; 00000018H
	test	eax, eax
	je	SHORT $L70390
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 188		; 000000bcH
	jmp	$eva_err$70267
$L70390:

; 190  : 			}

	jmp	$L70378
$L70379:

; 192  : 
; 193  : 		/* Handle Paste button */
; 194  : 		else if(!strcmp(btn, "PASTE"))

	jmp	$L70490
$L70368:
	push	OFFSET FLAT:$SG70393
	mov	ecx, DWORD PTR _btn$70254[ebp]
	push	ecx
	call	_strcmp
	add	esp, 8
	test	eax, eax
	jne	$L70392

; 196  : 			unsigned long line = cntxt->cgi[cntxt->cgibtn].Line, num = 1;

	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	eax, DWORD PTR [edx+29656]
	imul	eax, 56					; 00000038H
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	edx, DWORD PTR [ecx+29648]
	mov	eax, DWORD PTR [edx+eax+40]
	mov	DWORD PTR _line$70394[ebp], eax
	mov	DWORD PTR _num$70395[ebp], 1

; 197  : 			for(i = 0; i < ctrl->val.nbrows; i++)

	mov	DWORD PTR _i$[ebp], 0
	jmp	SHORT $L70396
$L70397:
	mov	ecx, DWORD PTR _i$[ebp]
	add	ecx, 1
	mov	DWORD PTR _i$[ebp], ecx
$L70396:
	mov	edx, DWORD PTR _ctrl$[ebp]
	mov	eax, DWORD PTR _i$[ebp]
	cmp	eax, DWORD PTR [edx+64]
	jae	SHORT $L70398

; 199  : 				DynTableCell *c = dyntab_cell(&ctrl->val, i, 0);

	push	0
	mov	ecx, DWORD PTR _i$[ebp]
	push	ecx
	mov	edx, DWORD PTR _ctrl$[ebp]
	add	edx, 64					; 00000040H
	push	edx
	call	_dyntab_cell
	add	esp, 12					; 0000000cH
	mov	DWORD PTR _c$70399[ebp], eax

; 200  : 				if(!line || (line == c->Line && num <= c->Num)) num = c->Num + 1;

	cmp	DWORD PTR _line$70394[ebp], 0
	je	SHORT $L70401
	mov	eax, DWORD PTR _c$70399[ebp]
	mov	ecx, DWORD PTR _line$70394[ebp]
	cmp	ecx, DWORD PTR [eax+40]
	jne	SHORT $L70400
	mov	edx, DWORD PTR _c$70399[ebp]
	mov	eax, DWORD PTR _num$70395[ebp]
	cmp	eax, DWORD PTR [edx+36]
	ja	SHORT $L70400
$L70401:
	mov	ecx, DWORD PTR _c$70399[ebp]
	mov	edx, DWORD PTR [ecx+36]
	add	edx, 1
	mov	DWORD PTR _num$70395[ebp], edx
$L70400:

; 201  : 			}

	jmp	SHORT $L70397
$L70398:

; 202  : 			if(cgi_filter_values(cntxt, &values, 'D', 0, 0, 0, "CB", NULL, 0, 0)) STACK_ERROR;

	push	0
	push	0
	push	0
	push	OFFSET FLAT:$SG70404
	push	0
	push	0
	push	0
	push	68					; 00000044H
	lea	eax, DWORD PTR _values$[ebp]
	push	eax
	mov	ecx, DWORD PTR _cntxt$[ebp]
	push	ecx
	call	_cgi_filter_values
	add	esp, 40					; 00000028H
	test	eax, eax
	je	SHORT $L70403
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 202		; 000000caH
	jmp	$eva_err$70267
$L70403:

; 203  : 			for(i = 0; i < values.nbrows; i++)

	mov	DWORD PTR _i$[ebp], 0
	jmp	SHORT $L70405
$L70406:
	mov	eax, DWORD PTR _i$[ebp]
	add	eax, 1
	mov	DWORD PTR _i$[ebp], eax
$L70405:
	mov	ecx, DWORD PTR _i$[ebp]
	cmp	ecx, DWORD PTR _values$[ebp]
	jae	$L70407

; 205  : 				DynTableCell *c = dyntab_cell(&values, i, 0);

	push	0
	mov	edx, DWORD PTR _i$[ebp]
	push	edx
	lea	eax, DWORD PTR _values$[ebp]
	push	eax
	call	_dyntab_cell
	add	esp, 12					; 0000000cH
	mov	DWORD PTR _c$70408[ebp], eax

; 206  : 				DYNTAB_ADD_NL(&ctrl->val, ctrl->val.nbrows, 0, c->txt, c->len, i + num, line, 1);

	mov	BYTE PTR _b_modif$70409[ebp], 1
	mov	ecx, DWORD PTR _i$[ebp]
	add	ecx, DWORD PTR _num$70395[ebp]
	mov	DWORD PTR __n$70411[ebp], ecx
	mov	edx, DWORD PTR _line$70394[ebp]
	mov	DWORD PTR _l$70412[ebp], edx
	mov	eax, DWORD PTR _ctrl$[ebp]
	mov	ecx, DWORD PTR [eax+64]
	mov	DWORD PTR _row$70413[ebp], ecx
	mov	DWORD PTR _col$70414[ebp], 0
	push	0
	push	0
	mov	edx, DWORD PTR _c$70408[ebp]
	mov	eax, DWORD PTR [edx+4]
	push	eax
	mov	ecx, DWORD PTR _c$70408[ebp]
	mov	edx, DWORD PTR [ecx]
	push	edx
	mov	eax, DWORD PTR _col$70414[ebp]
	push	eax
	mov	ecx, DWORD PTR _row$70413[ebp]
	push	ecx
	mov	edx, DWORD PTR _ctrl$[ebp]
	add	edx, 64					; 00000040H
	push	edx
	call	_dyntab_add
	add	esp, 28					; 0000001cH
	test	eax, eax
	je	SHORT $L70417
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29872], OFFSET FLAT:$SG70419
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 206		; 000000ceH
	jmp	$eva_err$70267
$L70417:
	mov	edx, DWORD PTR _col$70414[ebp]
	push	edx
	mov	eax, DWORD PTR _row$70413[ebp]
	push	eax
	mov	ecx, DWORD PTR _ctrl$[ebp]
	add	ecx, 64					; 00000040H
	push	ecx
	call	_dyntab_cell
	add	esp, 12					; 0000000cH
	mov	DWORD PTR __c$70415[ebp], eax
	mov	edx, DWORD PTR __c$70415[ebp]
	mov	eax, DWORD PTR __n$70411[ebp]
	mov	DWORD PTR [edx+36], eax
	mov	ecx, DWORD PTR __c$70415[ebp]
	mov	edx, DWORD PTR _l$70412[ebp]
	mov	DWORD PTR [ecx+40], edx
	mov	eax, DWORD PTR __c$70415[ebp]
	mov	cl, BYTE PTR _b_modif$70409[ebp]
	mov	BYTE PTR [eax+13], cl

; 207  : 				ctrl->b_modified = 1;

	mov	edx, DWORD PTR _ctrl$[ebp]
	mov	DWORD PTR [edx+200], 1

; 208  : 			}

	jmp	$L70406
$L70407:

; 209  : 			tbl->status &= ~(TblCtrl_opensearch | TblCtrl_opensel);

	mov	eax, DWORD PTR _tbl$[ebp]
	mov	ecx, DWORD PTR [eax+32]
	and	ecx, -545				; fffffddfH
	mov	edx, DWORD PTR _tbl$[ebp]
	mov	DWORD PTR [edx+32], ecx

; 211  : 
; 212  : 		/* Handle PRINT mode button */
; 213  : 		else if(!strcmp(btn, "PRINT"))

	jmp	$L70490
$L70392:
	push	OFFSET FLAT:$SG70422
	mov	eax, DWORD PTR _btn$70254[ebp]
	push	eax
	call	_strcmp
	add	esp, 8
	test	eax, eax
	jne	SHORT $L70421

; 215  : 			tbl->status ^= TblCtrl_printmode;

	mov	ecx, DWORD PTR _tbl$[ebp]
	mov	edx, DWORD PTR [ecx+32]
	xor	edx, 4096				; 00001000H
	mov	eax, DWORD PTR _tbl$[ebp]
	mov	DWORD PTR [eax+32], edx

; 217  : 
; 218  : 		/* Handle Export button */
; 219  : 		else if(!strncmp(btn, add_sz_str("EXPORT")))

	jmp	$L70490
$L70421:
	push	6
	push	OFFSET FLAT:$SG70425
	mov	ecx, DWORD PTR _btn$70254[ebp]
	push	ecx
	call	_strncmp
	add	esp, 12					; 0000000cH
	test	eax, eax
	jne	SHORT $L70424

; 221  : 			table_init_srchcol(tbl);

	mov	edx, DWORD PTR _tbl$[ebp]
	push	edx
	call	_table_init_srchcol
	add	esp, 4

; 222  : 			if(table_export_list(cntxt, i_ctrl)) STACK_ERROR;

	mov	eax, DWORD PTR _i_ctrl$[ebp]
	push	eax
	mov	ecx, DWORD PTR _cntxt$[ebp]
	push	ecx
	call	_table_export_list
	add	esp, 8
	test	eax, eax
	je	SHORT $L70426
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 222		; 000000deH
	jmp	$eva_err$70267
$L70426:

; 224  : 
; 225  : 		/* Handle Clear button */
; 226  : 		else if(!strncmp(btn, add_sz_str("CLEAR")))

	jmp	$L70490
$L70424:
	push	5
	push	OFFSET FLAT:$SG70429
	mov	eax, DWORD PTR _btn$70254[ebp]
	push	eax
	call	_strncmp
	add	esp, 12					; 0000000cH
	test	eax, eax
	jne	$L70428

; 228  : 			unsigned long line = cntxt->cgi[cntxt->cgibtn].Line;

	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	edx, DWORD PTR [ecx+29656]
	imul	edx, 56					; 00000038H
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	ecx, DWORD PTR [eax+29648]
	mov	edx, DWORD PTR [ecx+edx+40]
	mov	DWORD PTR _line$70430[ebp], edx

; 229  : 			for(i = ctrl->val.nbrows; i; i--)

	mov	eax, DWORD PTR _ctrl$[ebp]
	mov	ecx, DWORD PTR [eax+64]
	mov	DWORD PTR _i$[ebp], ecx
	jmp	SHORT $L70431
$L70432:
	mov	edx, DWORD PTR _i$[ebp]
	sub	edx, 1
	mov	DWORD PTR _i$[ebp], edx
$L70431:
	cmp	DWORD PTR _i$[ebp], 0
	je	SHORT $L70433

; 230  : 				if(!line || line == dyntab_cell(&ctrl->val, i - 1, 0)->Line)

	cmp	DWORD PTR _line$70430[ebp], 0
	je	SHORT $L70435
	push	0
	mov	eax, DWORD PTR _i$[ebp]
	sub	eax, 1
	push	eax
	mov	ecx, DWORD PTR _ctrl$[ebp]
	add	ecx, 64					; 00000040H
	push	ecx
	call	_dyntab_cell
	add	esp, 12					; 0000000cH
	mov	edx, DWORD PTR _line$70430[ebp]
	cmp	edx, DWORD PTR [eax+40]
	jne	SHORT $L70434
$L70435:

; 232  : 					cgi_setkeep(cntxt, dyntab_cell(&ctrl->val, i - 1, 0)->i_cgi, 1);

	push	1
	push	0
	mov	eax, DWORD PTR _i$[ebp]
	sub	eax, 1
	push	eax
	mov	ecx, DWORD PTR _ctrl$[ebp]
	add	ecx, 64					; 00000040H
	push	ecx
	call	_dyntab_cell
	add	esp, 12					; 0000000cH
	mov	edx, DWORD PTR [eax+48]
	push	edx
	mov	eax, DWORD PTR _cntxt$[ebp]
	push	eax
	call	_cgi_setkeep
	add	esp, 12					; 0000000cH

; 233  : 					dyntab_del_rows(&ctrl->val, i - 1, 1);

	push	1
	mov	ecx, DWORD PTR _i$[ebp]
	sub	ecx, 1
	push	ecx
	mov	edx, DWORD PTR _ctrl$[ebp]
	add	edx, 64					; 00000040H
	push	edx
	call	_dyntab_del_rows
	add	esp, 12					; 0000000cH
$L70434:

; 235  : 			ctrl->b_modified = 1;

	jmp	SHORT $L70432
$L70433:
	mov	eax, DWORD PTR _ctrl$[ebp]
	mov	DWORD PTR [eax+200], 1

; 237  : 
; 238  : 		/* Handle user action button */
; 239  : 		else if(!strncmp(btn, add_sz_str("ACTBTN")))

	jmp	$L70490
$L70428:
	push	6
	push	OFFSET FLAT:$SG70438
	mov	ecx, DWORD PTR _btn$70254[ebp]
	push	ecx
	call	_strncmp
	add	esp, 12					; 0000000cH
	test	eax, eax
	jne	$L70437

; 241  : 			EVA_form f = {0}, *f0 = cntxt->form;

	mov	DWORD PTR _f$70439[ebp], 0
	mov	ecx, 60					; 0000003cH
	xor	eax, eax
	lea	edi, DWORD PTR _f$70439[ebp+4]
	rep stosd
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	eax, DWORD PTR [edx+80]
	mov	DWORD PTR _f0$70440[ebp], eax

; 242  : 			EVA_ctrl ctl = {{0}};

	mov	DWORD PTR _ctl$70441[ebp], 0
	xor	ecx, ecx
	mov	DWORD PTR _ctl$70441[ebp+4], ecx
	mov	DWORD PTR _ctl$70441[ebp+8], ecx
	mov	DWORD PTR _ctl$70441[ebp+12], ecx
	mov	DWORD PTR _ctl$70441[ebp+16], ecx
	mov	ecx, 115				; 00000073H
	xor	eax, eax
	lea	edi, DWORD PTR _ctl$70441[ebp+20]
	rep stosd

; 243  : 			cntxt->form = &f;

	mov	edx, DWORD PTR _cntxt$[ebp]
	lea	eax, DWORD PTR _f$70439[ebp]
	mov	DWORD PTR [edx+80], eax

; 244  : 			f.ctrl = &ctl;

	lea	ecx, DWORD PTR _ctl$70441[ebp]
	mov	DWORD PTR _f$70439[ebp], ecx

; 245  : 			f.nb_ctrl = 1;

	mov	DWORD PTR _f$70439[ebp+4], 1

; 246  : 			DYNTAB_ADD_INT(&f.id_form, 0, 0, dyntab_cell(&tbl->field, cntxt->cgi[cntxt->cgibtn].Num, 0)->IdObj);

	mov	BYTE PTR __tmp$70442[ebp], 0
	mov	ecx, 7
	xor	eax, eax
	lea	edi, DWORD PTR __tmp$70442[ebp+1]
	rep stosd
	stosw
	stosb
	push	0
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	eax, DWORD PTR [edx+29656]
	imul	eax, 56					; 00000038H
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	edx, DWORD PTR [ecx+29648]
	mov	eax, DWORD PTR [edx+eax+36]
	push	eax
	mov	ecx, DWORD PTR _tbl$[ebp]
	add	ecx, 380				; 0000017cH
	push	ecx
	call	_dyntab_cell
	add	esp, 12					; 0000000cH
	mov	edx, DWORD PTR [eax+20]
	push	edx
	push	OFFSET FLAT:$SG70443
	lea	eax, DWORD PTR __tmp$70442[ebp]
	push	eax
	call	_sprintf
	add	esp, 12					; 0000000cH
	push	0
	push	0
	push	0
	lea	ecx, DWORD PTR __tmp$70442[ebp]
	push	ecx
	push	0
	push	0
	lea	edx, DWORD PTR _f$70439[ebp+12]
	push	edx
	call	_dyntab_add
	add	esp, 28					; 0000001cH
	test	eax, eax
	je	SHORT $L70445
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29872], OFFSET FLAT:$SG70447
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 246		; 000000f6H
	jmp	$eva_err$70267
$L70445:

; 247  : 			DYNTAB_ADD_INT(&f.id_obj, 0, 0, cntxt->cgi[cntxt->cgibtn].Line);

	mov	BYTE PTR __tmp$70448[ebp], 0
	mov	ecx, 7
	xor	eax, eax
	lea	edi, DWORD PTR __tmp$70448[ebp+1]
	rep stosd
	stosw
	stosb
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	eax, DWORD PTR [edx+29656]
	imul	eax, 56					; 00000038H
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	edx, DWORD PTR [ecx+29648]
	mov	eax, DWORD PTR [edx+eax+40]
	push	eax
	push	OFFSET FLAT:$SG70449
	lea	ecx, DWORD PTR __tmp$70448[ebp]
	push	ecx
	call	_sprintf
	add	esp, 12					; 0000000cH
	push	0
	push	0
	push	0
	lea	edx, DWORD PTR __tmp$70448[ebp]
	push	edx
	push	0
	push	0
	lea	eax, DWORD PTR _f$70439[ebp+32]
	push	eax
	call	_dyntab_add
	add	esp, 28					; 0000001cH
	test	eax, eax
	je	SHORT $L70451
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29872], OFFSET FLAT:$SG70453
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 247		; 000000f7H
	jmp	$eva_err$70267
$L70451:

; 248  : 			if(qry_obj_data(cntxt, &ctl.attr, &f.id_form, NULL) ||
; 249  : 				qry_obj_data(cntxt, &f.objdata, &f.id_obj, NULL) ||
; 250  : 				ctrl_set_common_attr(cntxt, &ctl) ||
; 251  : 				ctrl_call_act_handler(cntxt, 0)) CLEAR_ERROR;

	push	0
	lea	eax, DWORD PTR _f$70439[ebp+12]
	push	eax
	lea	ecx, DWORD PTR _ctl$70441[ebp+44]
	push	ecx
	mov	edx, DWORD PTR _cntxt$[ebp]
	push	edx
	call	_qry_obj_data
	add	esp, 16					; 00000010H
	test	eax, eax
	jne	SHORT $L70457
	push	0
	lea	eax, DWORD PTR _f$70439[ebp+32]
	push	eax
	lea	ecx, DWORD PTR _f$70439[ebp+52]
	push	ecx
	mov	edx, DWORD PTR _cntxt$[ebp]
	push	edx
	call	_qry_obj_data
	add	esp, 16					; 00000010H
	test	eax, eax
	jne	SHORT $L70457
	lea	eax, DWORD PTR _ctl$70441[ebp]
	push	eax
	mov	ecx, DWORD PTR _cntxt$[ebp]
	push	ecx
	call	_ctrl_set_common_attr
	add	esp, 8
	test	eax, eax
	jne	SHORT $L70457
	push	0
	mov	edx, DWORD PTR _cntxt$[ebp]
	push	edx
	call	_ctrl_call_act_handler
	add	esp, 8
	test	eax, eax
	je	SHORT $L70456
$L70457:
	push	251					; 000000fbH
	push	OFFSET FLAT:$SG70458
	push	OFFSET FLAT:$SG70459
	mov	eax, DWORD PTR _cntxt$[ebp]
	push	eax
	call	_err_clear
	add	esp, 16					; 00000010H
$L70456:

; 252  : 			DYNTAB_FREE(f.objdata);

	lea	ecx, DWORD PTR _f$70439[ebp+52]
	push	ecx
	call	_dyntab_free
	add	esp, 4

; 253  : 			DYNTAB_FREE(ctl.attr);

	lea	edx, DWORD PTR _ctl$70441[ebp+44]
	push	edx
	call	_dyntab_free
	add	esp, 4

; 254  : 			cntxt->form = f0;

	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	ecx, DWORD PTR _f0$70440[ebp]
	mov	DWORD PTR [eax+80], ecx

; 256  : 
; 257  : 		/* Handle move buttons */
; 258  : 		else if(ctrl->val.nbrows &&! strncmp(btn, add_sz_str("MOVE")))

	jmp	$L70490
$L70437:
	mov	edx, DWORD PTR _ctrl$[ebp]
	cmp	DWORD PTR [edx+64], 0
	je	$L70461
	push	4
	push	OFFSET FLAT:$SG70462
	mov	eax, DWORD PTR _btn$70254[ebp]
	push	eax
	call	_strncmp
	add	esp, 12					; 0000000cH
	test	eax, eax
	jne	$L70461

; 260  : 			unsigned long dest;
; 261  : 			unsigned long src = cntxt->cgi[cntxt->cgibtn].Num - 1;

	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	edx, DWORD PTR [ecx+29656]
	imul	edx, 56					; 00000038H
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	ecx, DWORD PTR [eax+29648]
	mov	edx, DWORD PTR [ecx+edx+36]
	sub	edx, 1
	mov	DWORD PTR _src$70464[ebp], edx

; 262  : 
; 263  : 			/* Choose destination row */
; 264  : 			dest = src;

	mov	eax, DWORD PTR _src$70464[ebp]
	mov	DWORD PTR _dest$70463[ebp], eax

; 265  : 			if(!strcmp(btn, "MOVEUP")) dest = src ? src-1 : 0;

	push	OFFSET FLAT:$SG70466
	mov	ecx, DWORD PTR _btn$70254[ebp]
	push	ecx
	call	_strcmp
	add	esp, 8
	test	eax, eax
	jne	SHORT $L70465
	cmp	DWORD PTR _src$70464[ebp], 0
	je	SHORT $L73280
	mov	edx, DWORD PTR _src$70464[ebp]
	sub	edx, 1
	mov	DWORD PTR -1032+[ebp], edx
	jmp	SHORT $L73281
$L73280:
	mov	DWORD PTR -1032+[ebp], 0
$L73281:
	mov	eax, DWORD PTR -1032+[ebp]
	mov	DWORD PTR _dest$70463[ebp], eax

; 266  : 			else if(!strcmp(btn, "MOVETOP")) dest = 0;

	jmp	$L70474
$L70465:
	push	OFFSET FLAT:$SG70469
	mov	ecx, DWORD PTR _btn$70254[ebp]
	push	ecx
	call	_strcmp
	add	esp, 8
	test	eax, eax
	jne	SHORT $L70468
	mov	DWORD PTR _dest$70463[ebp], 0

; 267  : 			else if(!strcmp(btn, "MOVEDOWN")) dest = src < ctrl->val.nbrows-1 ? src+1 : src;

	jmp	SHORT $L70474
$L70468:
	push	OFFSET FLAT:$SG70472
	mov	edx, DWORD PTR _btn$70254[ebp]
	push	edx
	call	_strcmp
	add	esp, 8
	test	eax, eax
	jne	SHORT $L70471
	mov	eax, DWORD PTR _ctrl$[ebp]
	mov	ecx, DWORD PTR [eax+64]
	sub	ecx, 1
	cmp	DWORD PTR _src$70464[ebp], ecx
	jae	SHORT $L73282
	mov	edx, DWORD PTR _src$70464[ebp]
	add	edx, 1
	mov	DWORD PTR -1036+[ebp], edx
	jmp	SHORT $L73283
$L73282:
	mov	eax, DWORD PTR _src$70464[ebp]
	mov	DWORD PTR -1036+[ebp], eax
$L73283:
	mov	ecx, DWORD PTR -1036+[ebp]
	mov	DWORD PTR _dest$70463[ebp], ecx

; 268  : 			else if(!strcmp(btn, "MOVEBOTTOM")) dest = ctrl->val.nbrows-1;

	jmp	SHORT $L70474
$L70471:
	push	OFFSET FLAT:$SG70475
	mov	edx, DWORD PTR _btn$70254[ebp]
	push	edx
	call	_strcmp
	add	esp, 8
	test	eax, eax
	jne	SHORT $L70474
	mov	eax, DWORD PTR _ctrl$[ebp]
	mov	ecx, DWORD PTR [eax+64]
	sub	ecx, 1
	mov	DWORD PTR _dest$70463[ebp], ecx
$L70474:

; 269  : 
; 270  : 			/* Renumber & sort values */
; 271  : 			for(i = 0; i < ctrl->val.nbrows; i++)

	mov	DWORD PTR _i$[ebp], 0
	jmp	SHORT $L70476
$L70477:
	mov	edx, DWORD PTR _i$[ebp]
	add	edx, 1
	mov	DWORD PTR _i$[ebp], edx
$L70476:
	mov	eax, DWORD PTR _ctrl$[ebp]
	mov	ecx, DWORD PTR _i$[ebp]
	cmp	ecx, DWORD PTR [eax+64]
	jae	$L70478

; 273  : 				DynTableCell *c = dyntab_cell(&ctrl->val, i, 0);

	push	0
	mov	edx, DWORD PTR _i$[ebp]
	push	edx
	mov	eax, DWORD PTR _ctrl$[ebp]
	add	eax, 64					; 00000040H
	push	eax
	call	_dyntab_cell
	add	esp, 12					; 0000000cH
	mov	DWORD PTR _c$70479[ebp], eax

; 274  : 				unsigned long num = c->Num;

	mov	ecx, DWORD PTR _c$70479[ebp]
	mov	edx, DWORD PTR [ecx+36]
	mov	DWORD PTR _num$70480[ebp], edx

; 275  : 				c->Num = 1 +
; 276  : 					(i == src ? dest : src > dest ? ((i >= dest && i < src) ? i+1 : i) :
; 277  : 													((i <= dest && i > src) ? i-1 : i));

	mov	eax, DWORD PTR _i$[ebp]
	cmp	eax, DWORD PTR _src$70464[ebp]
	jne	SHORT $L73290
	mov	ecx, DWORD PTR _dest$70463[ebp]
	mov	DWORD PTR -1040+[ebp], ecx
	jmp	$L73291
$L73290:
	mov	edx, DWORD PTR _src$70464[ebp]
	cmp	edx, DWORD PTR _dest$70463[ebp]
	jbe	SHORT $L73288
	mov	eax, DWORD PTR _i$[ebp]
	cmp	eax, DWORD PTR _dest$70463[ebp]
	jb	SHORT $L73284
	mov	ecx, DWORD PTR _i$[ebp]
	cmp	ecx, DWORD PTR _src$70464[ebp]
	jae	SHORT $L73284
	mov	edx, DWORD PTR _i$[ebp]
	add	edx, 1
	mov	DWORD PTR -1044+[ebp], edx
	jmp	SHORT $L73285
$L73284:
	mov	eax, DWORD PTR _i$[ebp]
	mov	DWORD PTR -1044+[ebp], eax
$L73285:
	mov	ecx, DWORD PTR -1044+[ebp]
	mov	DWORD PTR -1048+[ebp], ecx
	jmp	SHORT $L73289
$L73288:
	mov	edx, DWORD PTR _i$[ebp]
	cmp	edx, DWORD PTR _dest$70463[ebp]
	ja	SHORT $L73286
	mov	eax, DWORD PTR _i$[ebp]
	cmp	eax, DWORD PTR _src$70464[ebp]
	jbe	SHORT $L73286
	mov	ecx, DWORD PTR _i$[ebp]
	sub	ecx, 1
	mov	DWORD PTR -1052+[ebp], ecx
	jmp	SHORT $L73287
$L73286:
	mov	edx, DWORD PTR _i$[ebp]
	mov	DWORD PTR -1052+[ebp], edx
$L73287:
	mov	eax, DWORD PTR -1052+[ebp]
	mov	DWORD PTR -1048+[ebp], eax
$L73289:
	mov	ecx, DWORD PTR -1048+[ebp]
	mov	DWORD PTR -1040+[ebp], ecx
$L73291:
	mov	edx, DWORD PTR -1040+[ebp]
	add	edx, 1
	mov	eax, DWORD PTR _c$70479[ebp]
	mov	DWORD PTR [eax+36], edx

; 278  : 				if(num != c->Num) c->b_modified = 1;

	mov	ecx, DWORD PTR _c$70479[ebp]
	mov	edx, DWORD PTR _num$70480[ebp]
	cmp	edx, DWORD PTR [ecx+36]
	je	SHORT $L70481
	mov	eax, DWORD PTR _c$70479[ebp]
	mov	BYTE PTR [eax+13], 1
$L70481:

; 279  : 			}

	jmp	$L70477
$L70478:

; 280  : 			dyntab_sort(&ctrl->val, qsort_ctrlval);

	push	OFFSET FLAT:_qsort_ctrlval
	mov	ecx, DWORD PTR _ctrl$[ebp]
	add	ecx, 64					; 00000040H
	push	ecx
	call	_dyntab_sort
	add	esp, 8

; 281  : 			ctrl->b_modified = 1;

	mov	edx, DWORD PTR _ctrl$[ebp]
	mov	DWORD PTR [edx+200], 1

; 283  : 
; 284  : 		/* Handle sort column buttons */
; 285  : 		else if(!strncmp(btn, add_sz_str("SORT")))

	jmp	$L70490
$L70461:
	push	4
	push	OFFSET FLAT:$SG70484
	mov	eax, DWORD PTR _btn$70254[ebp]
	push	eax
	call	_strncmp
	add	esp, 12					; 0000000cH
	test	eax, eax
	jne	$L70483

; 287  : 			unsigned long sortcol = tbl->sortcol;

	mov	ecx, DWORD PTR _tbl$[ebp]
	mov	edx, DWORD PTR [ecx+60]
	mov	DWORD PTR _sortcol$70485[ebp], edx

; 288  : 			int b_sortdesc = tbl->b_sortdesc;

	mov	eax, DWORD PTR _tbl$[ebp]
	mov	ecx, DWORD PTR [eax+64]
	mov	DWORD PTR _b_sortdesc$70486[ebp], ecx

; 289  : 			tbl->b_sortdesc = !strncmp(btn+4, add_sz_str("DESC"));

	push	4
	push	OFFSET FLAT:$SG70487
	mov	edx, DWORD PTR _btn$70254[ebp]
	add	edx, 4
	push	edx
	call	_strncmp
	add	esp, 12					; 0000000cH
	neg	eax
	sbb	eax, eax
	inc	eax
	mov	ecx, DWORD PTR _tbl$[ebp]
	mov	DWORD PTR [ecx+64], eax

; 290  : 			tbl->sortcol = atoi(btn+(tbl->b_sortdesc ? 8 : 7));

	mov	edx, DWORD PTR _tbl$[ebp]
	xor	eax, eax
	cmp	DWORD PTR [edx+64], 0
	setne	al
	add	eax, 7
	mov	ecx, DWORD PTR _btn$70254[ebp]
	add	ecx, eax
	push	ecx
	call	_atoi
	add	esp, 4
	mov	edx, DWORD PTR _tbl$[ebp]
	mov	DWORD PTR [edx+60], eax

; 291  : 			if(sortcol == tbl->sortcol && b_sortdesc == tbl->b_sortdesc)

	mov	eax, DWORD PTR _tbl$[ebp]
	mov	ecx, DWORD PTR _sortcol$70485[ebp]
	cmp	ecx, DWORD PTR [eax+60]
	jne	SHORT $L70488
	mov	edx, DWORD PTR _tbl$[ebp]
	mov	eax, DWORD PTR _b_sortdesc$70486[ebp]
	cmp	eax, DWORD PTR [edx+64]
	jne	SHORT $L70488

; 292  : 				tbl->sortcol = ~0UL;

	mov	ecx, DWORD PTR _tbl$[ebp]
	mov	DWORD PTR [ecx+60], -1
$L70488:

; 294  : 
; 295  : 		/* Handle search column buttons */
; 296  : 		else if(!strncmp(btn, add_sz_str("SEARCHCOL")))

	jmp	SHORT $L70490
$L70483:
	push	9
	push	OFFSET FLAT:$SG70491
	mov	edx, DWORD PTR _btn$70254[ebp]
	push	edx
	call	_strncmp
	add	esp, 12					; 0000000cH
	test	eax, eax
	jne	SHORT $L70490

; 298  : 			unsigned long col = 1 << atoi(btn+9);

	mov	eax, DWORD PTR _btn$70254[ebp]
	add	eax, 9
	push	eax
	call	_atoi
	add	esp, 4
	mov	ecx, eax
	mov	edx, 1
	shl	edx, cl
	mov	DWORD PTR _col$70492[ebp], edx

; 299  : 			tbl->srchcol = col == tbl->srchcol ? 0 : col;

	mov	eax, DWORD PTR _tbl$[ebp]
	mov	ecx, DWORD PTR _col$70492[ebp]
	sub	ecx, DWORD PTR [eax+124]
	neg	ecx
	sbb	ecx, ecx
	and	ecx, DWORD PTR _col$70492[ebp]
	mov	edx, DWORD PTR _tbl$[ebp]
	mov	DWORD PTR [edx+124], ecx
$L70490:

; 302  : 	/* Close search if applicable */
; 303  : 	else

	jmp	$L70495
$L70253:

; 305  : 		if(tbl->status & TblCtrl_sel &&	ctrl->val.nbrows &&
; 306  : 			CTRL_ATTR_CELL(AUTOCLOSE) && cntxt->cgi && cntxt->cgi[cntxt->cgibtn].name &&
; 307  : 				!strstr(cntxt->cgi[cntxt->cgibtn].name, "NOP"))

	mov	eax, DWORD PTR _tbl$[ebp]
	mov	ecx, DWORD PTR [eax+32]
	and	ecx, 256				; 00000100H
	test	ecx, ecx
	je	$L70495
	mov	edx, DWORD PTR _ctrl$[ebp]
	cmp	DWORD PTR [edx+64], 0
	je	$L70495
	cmp	DWORD PTR _ctrl$[ebp], 0
	je	SHORT $L73292
	push	0
	push	-1
	push	OFFSET FLAT:$SG70496
	mov	eax, DWORD PTR _ctrl$[ebp]
	add	eax, 44					; 0000002cH
	push	eax
	call	_dyntab_field_cell
	add	esp, 16					; 00000010H
	mov	DWORD PTR -1056+[ebp], eax
	jmp	SHORT $L73293
$L73292:
	mov	DWORD PTR -1056+[ebp], 0
$L73293:
	cmp	DWORD PTR -1056+[ebp], 0
	je	SHORT $L70495
	mov	ecx, DWORD PTR _cntxt$[ebp]
	cmp	DWORD PTR [ecx+29648], 0
	je	SHORT $L70495
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	eax, DWORD PTR [edx+29656]
	imul	eax, 56					; 00000038H
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	edx, DWORD PTR [ecx+29648]
	cmp	DWORD PTR [edx+eax], 0
	je	SHORT $L70495
	push	OFFSET FLAT:$SG70497
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	ecx, DWORD PTR [eax+29656]
	imul	ecx, 56					; 00000038H
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	eax, DWORD PTR [edx+29648]
	mov	ecx, DWORD PTR [eax+ecx]
	push	ecx
	call	_strstr
	add	esp, 8
	test	eax, eax
	jne	SHORT $L70495

; 308  : 			tbl->status &= ~(TblCtrl_opensearch | TblCtrl_opensel);

	mov	edx, DWORD PTR _tbl$[ebp]
	mov	eax, DWORD PTR [edx+32]
	and	eax, -545				; fffffddfH
	mov	ecx, DWORD PTR _tbl$[ebp]
	mov	DWORD PTR [ecx+32], eax
$L70495:

; 310  : 
; 311  : 	/* Disable unused functions */
; 312  : 	if(!(tbl->status & TblCtrl_search)) tbl->status &= ~TblCtrl_opensearch;

	mov	edx, DWORD PTR _tbl$[ebp]
	mov	eax, DWORD PTR [edx+32]
	and	eax, 16					; 00000010H
	test	eax, eax
	jne	SHORT $L70498
	mov	ecx, DWORD PTR _tbl$[ebp]
	mov	edx, DWORD PTR [ecx+32]
	and	edx, -33				; ffffffdfH
	mov	eax, DWORD PTR _tbl$[ebp]
	mov	DWORD PTR [eax+32], edx
$L70498:

; 313  : 	if(!(tbl->status & TblCtrl_addnew)) tbl->status &= ~TblCtrl_openaddnew;

	mov	ecx, DWORD PTR _tbl$[ebp]
	mov	edx, DWORD PTR [ecx+32]
	and	edx, 64					; 00000040H
	test	edx, edx
	jne	SHORT $L70499
	mov	eax, DWORD PTR _tbl$[ebp]
	mov	ecx, DWORD PTR [eax+32]
	and	cl, 127					; 0000007fH
	mov	edx, DWORD PTR _tbl$[ebp]
	mov	DWORD PTR [edx+32], ecx
$L70499:

; 314  : 	if(!(tbl->status & TblCtrl_sel)) tbl->status &= ~TblCtrl_opensel;

	mov	eax, DWORD PTR _tbl$[ebp]
	mov	ecx, DWORD PTR [eax+32]
	and	ecx, 256				; 00000100H
	test	ecx, ecx
	jne	SHORT $L70500
	mov	edx, DWORD PTR _tbl$[ebp]
	mov	eax, DWORD PTR [edx+32]
	and	ah, -3					; fffffffdH
	mov	ecx, DWORD PTR _tbl$[ebp]
	mov	DWORD PTR [ecx+32], eax
$L70500:

; 315  : 
; 316  : 	/* Initialize search columns */
; 317  : 	table_init_srchcol(tbl);

	mov	edx, DWORD PTR _tbl$[ebp]
	push	edx
	call	_table_init_srchcol
	add	esp, 4
$eva_noerr$70501:

; 318  : 
; 319  : 	RETURN_OK_CLEANUP;

	push	0
	push	OFFSET FLAT:$SG70502
	push	OFFSET FLAT:$SG70503
	mov	eax, DWORD PTR _cntxt$[ebp]
	push	eax
	call	_err_clear
	add	esp, 16					; 00000010H
$eva_err$70267:
	mov	ecx, DWORD PTR _cntxt$[ebp]
	cmp	DWORD PTR [ecx+29872], 0
	je	SHORT $L70504
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	eax, DWORD PTR [edx+29900]
	push	eax
	push	OFFSET FLAT:$SG70505
	push	OFFSET FLAT:$SG70506
	mov	ecx, DWORD PTR _cntxt$[ebp]
	push	ecx
	call	_err_add_context
	add	esp, 16					; 00000010H
$L70504:
	lea	edx, DWORD PTR _list$[ebp]
	push	edx
	call	_dyntab_free
	add	esp, 4
	lea	eax, DWORD PTR _formstamp$[ebp]
	push	eax
	call	_dyntab_free
	add	esp, 4
	lea	ecx, DWORD PTR _fields$[ebp]
	push	ecx
	call	_dyntab_free
	add	esp, 4
	lea	edx, DWORD PTR _values$[ebp]
	push	edx
	call	_dyntab_free
	add	esp, 4
	lea	eax, DWORD PTR _id_obj$[ebp]
	push	eax
	call	_dyntab_free
	add	esp, 4
	mov	ecx, DWORD PTR _name$[ebp]
	push	ecx
	call	_mem_free
	add	esp, 4
	mov	DWORD PTR _name$[ebp], 0
	mov	edx, DWORD PTR _cntxt$[ebp]
	xor	eax, eax
	cmp	DWORD PTR [edx+29872], 0
	setne	al

; 320  : }

	pop	edi
	mov	esp, ebp
	pop	ebp
	ret	0
_table_process_controls ENDP
_TEXT	ENDS
PUBLIC	_table_add_sel_chkbox
EXTRN	_put_html_chkbox:NEAR
EXTRN	_dynbuf_add:NEAR
EXTRN	_ctrl_cgi_name:NEAR
EXTRN	_ctrl_put_hidden_old:NEAR
_DATA	SEGMENT
	ORG $+1
$SG70534 DB	'<td width=1', 00H
$SG70536 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70540 DB	' rowspan=2 valign=top', 00H
	ORG $+2
$SG70542 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70545 DB	'>', 00H
	ORG $+2
$SG70547 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70554 DB	'</td>', 00H
	ORG $+2
$SG70556 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70558 DB	'D:\Travail\ABI\EVA\V4.0\CGI\Brunix-2016\table_utils.c', 00H
	ORG $+2
$SG70559 DB	'table_add_sel_chkbox', 00H
	ORG $+3
$SG70561 DB	'D:\Travail\ABI\EVA\V4.0\CGI\Brunix-2016\table_utils.c', 00H
	ORG $+2
$SG70562 DB	'table_add_sel_chkbox', 00H
_DATA	ENDS
_TEXT	SEGMENT
_cntxt$ = 8
_ctrl$ = 12
_i_val$ = 16
_selval$ = 20
_selval_sz$ = 24
_name$ = -12
_val$ = -4
_html$ = -8
_table_add_sel_chkbox PROC NEAR

; 335  : ){

	push	ebp
	mov	ebp, esp
	sub	esp, 28					; 0000001cH

; 336  : 	DynBuffer *name = NULL;

	mov	DWORD PTR _name$[ebp], 0

; 337  : 	DynTableCell *val = dyntab_cell(&ctrl->val, i_val, 0);

	push	0
	mov	eax, DWORD PTR _i_val$[ebp]
	push	eax
	mov	ecx, DWORD PTR _ctrl$[ebp]
	add	ecx, 64					; 00000040H
	push	ecx
	call	_dyntab_cell
	add	esp, 12					; 0000000cH
	mov	DWORD PTR _val$[ebp], eax

; 338  : 	CHECK_HTML_STATUS;

	cmp	DWORD PTR _cntxt$[ebp], 0
	je	SHORT $L73297
	mov	edx, DWORD PTR _cntxt$[ebp]
	cmp	DWORD PTR [edx+80], 0
	je	SHORT $L73295
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	ecx, DWORD PTR [eax+80]
	mov	edx, DWORD PTR [ecx+232]
	mov	DWORD PTR -16+[ebp], edx
	jmp	SHORT $L73296
$L73295:
	mov	DWORD PTR -16+[ebp], 0
$L73296:
	mov	eax, DWORD PTR -16+[ebp]
	mov	DWORD PTR -20+[ebp], eax
	jmp	SHORT $L73298
$L73297:
	mov	DWORD PTR -20+[ebp], 0
$L73298:
	mov	ecx, DWORD PTR -20+[ebp]
	mov	DWORD PTR _html$[ebp], ecx
	cmp	DWORD PTR _html$[ebp], 0
	jne	SHORT $L70528
	xor	eax, eax
	jmp	$L70521
$L70528:

; 339  : 
; 340  : 	/* Build checkbox name */
; 341  : 	if(ctrl_cgi_name(cntxt, ctrl, val, 0, &name, 0, NULL, 0)) STACK_ERROR;

	push	0
	push	0
	push	0
	lea	edx, DWORD PTR _name$[ebp]
	push	edx
	push	0
	mov	eax, DWORD PTR _val$[ebp]
	push	eax
	mov	ecx, DWORD PTR _ctrl$[ebp]
	push	ecx
	mov	edx, DWORD PTR _cntxt$[ebp]
	push	edx
	call	_ctrl_cgi_name
	add	esp, 32					; 00000020H
	test	eax, eax
	je	SHORT $L70530
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 341		; 00000155H
	jmp	$eva_err$70531
$L70530:

; 342  : 
; 343  : 	/* Output selection checkbox */
; 344  : 	DYNBUF_ADD_STR(html, "<td width=1");

	push	0
	push	0
	push	11					; 0000000bH
	push	OFFSET FLAT:$SG70534
	mov	ecx, DWORD PTR _html$[ebp]
	push	ecx
	call	_dynbuf_add
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L70533
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29872], OFFSET FLAT:$SG70536
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 344		; 00000158H
	jmp	$eva_err$70531
$L70533:

; 345  : 	if(ctrl->objtbl && ctrl->objtbl->colbrk && ctrl->objtbl->colbrk <= ctrl->objtbl->field.nbrows)

	mov	ecx, DWORD PTR _ctrl$[ebp]
	cmp	DWORD PTR [ecx+232], 0
	je	SHORT $L70539
	mov	edx, DWORD PTR _ctrl$[ebp]
	mov	eax, DWORD PTR [edx+232]
	cmp	DWORD PTR [eax+660], 0
	je	SHORT $L70539
	mov	ecx, DWORD PTR _ctrl$[ebp]
	mov	edx, DWORD PTR [ecx+232]
	mov	eax, DWORD PTR _ctrl$[ebp]
	mov	ecx, DWORD PTR [eax+232]
	mov	edx, DWORD PTR [edx+660]
	cmp	edx, DWORD PTR [ecx+380]
	ja	SHORT $L70539

; 346  : 		DYNBUF_ADD_STR(html, " rowspan=2 valign=top");

	push	0
	push	0
	push	21					; 00000015H
	push	OFFSET FLAT:$SG70540
	mov	eax, DWORD PTR _html$[ebp]
	push	eax
	call	_dynbuf_add
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L70539
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29872], OFFSET FLAT:$SG70542
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 346		; 0000015aH
	jmp	$eva_err$70531
$L70539:

; 347  : 	DYNBUF_ADD_STR(html, ">");

	push	0
	push	0
	push	1
	push	OFFSET FLAT:$SG70545
	mov	eax, DWORD PTR _html$[ebp]
	push	eax
	call	_dynbuf_add
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L70544
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29872], OFFSET FLAT:$SG70547
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 347		; 0000015bH
	jmp	$eva_err$70531
$L70544:

; 348  : 	if(put_html_chkbox(cntxt,DYNBUF_VAL_SZ(name), selval, selval_sz, (val ? 1 : 0), 0) ||
; 349  : 		(val && ctrl_put_hidden_old(cntxt, ctrl, i_val, name, NULL, 0))) STACK_ERROR;

	cmp	DWORD PTR _name$[ebp], 0
	je	SHORT $L73299
	mov	eax, DWORD PTR _name$[ebp]
	mov	ecx, DWORD PTR [eax+4]
	mov	DWORD PTR -24+[ebp], ecx
	jmp	SHORT $L73300
$L73299:
	mov	DWORD PTR -24+[ebp], 0
$L73300:
	cmp	DWORD PTR _name$[ebp], 0
	je	SHORT $L73301
	mov	edx, DWORD PTR _name$[ebp]
	add	edx, 8
	mov	DWORD PTR -28+[ebp], edx
	jmp	SHORT $L73302
$L73301:
	mov	DWORD PTR -28+[ebp], 0
$L73302:
	push	0
	xor	eax, eax
	cmp	DWORD PTR _val$[ebp], 0
	setne	al
	push	eax
	mov	ecx, DWORD PTR _selval_sz$[ebp]
	push	ecx
	mov	edx, DWORD PTR _selval$[ebp]
	push	edx
	mov	eax, DWORD PTR -24+[ebp]
	push	eax
	mov	ecx, DWORD PTR -28+[ebp]
	push	ecx
	mov	edx, DWORD PTR _cntxt$[ebp]
	push	edx
	call	_put_html_chkbox
	add	esp, 28					; 0000001cH
	test	eax, eax
	jne	SHORT $L70551
	cmp	DWORD PTR _val$[ebp], 0
	je	SHORT $L70550
	push	0
	push	0
	mov	eax, DWORD PTR _name$[ebp]
	push	eax
	mov	ecx, DWORD PTR _i_val$[ebp]
	push	ecx
	mov	edx, DWORD PTR _ctrl$[ebp]
	push	edx
	mov	eax, DWORD PTR _cntxt$[ebp]
	push	eax
	call	_ctrl_put_hidden_old
	add	esp, 24					; 00000018H
	test	eax, eax
	je	SHORT $L70550
$L70551:
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 349		; 0000015dH
	jmp	SHORT $eva_err$70531
$L70550:

; 350  : 	DYNBUF_ADD_STR(html, "</td>");

	push	0
	push	0
	push	5
	push	OFFSET FLAT:$SG70554
	mov	edx, DWORD PTR _html$[ebp]
	push	edx
	call	_dynbuf_add
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L70553
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29872], OFFSET FLAT:$SG70556
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 350		; 0000015eH
	jmp	SHORT $eva_err$70531
$L70553:
$eva_noerr$70557:

; 351  : 
; 352  : 	RETURN_OK_CLEANUP;

	push	0
	push	OFFSET FLAT:$SG70558
	push	OFFSET FLAT:$SG70559
	mov	edx, DWORD PTR _cntxt$[ebp]
	push	edx
	call	_err_clear
	add	esp, 16					; 00000010H
$eva_err$70531:
	mov	eax, DWORD PTR _cntxt$[ebp]
	cmp	DWORD PTR [eax+29872], 0
	je	SHORT $L70560
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	edx, DWORD PTR [ecx+29900]
	push	edx
	push	OFFSET FLAT:$SG70561
	push	OFFSET FLAT:$SG70562
	mov	eax, DWORD PTR _cntxt$[ebp]
	push	eax
	call	_err_add_context
	add	esp, 16					; 00000010H
$L70560:
	mov	ecx, DWORD PTR _name$[ebp]
	push	ecx
	call	_mem_free
	add	esp, 4
	mov	DWORD PTR _name$[ebp], 0
	mov	edx, DWORD PTR _cntxt$[ebp]
	xor	eax, eax
	cmp	DWORD PTR [edx+29872], 0
	setne	al
$L70521:

; 353  : }

	mov	esp, ebp
	pop	ebp
	ret	0
_table_add_sel_chkbox ENDP
_TEXT	ENDS
PUBLIC	_table_add_searchsort_btn
EXTRN	_put_html_button_sz:NEAR
EXTRN	_dynbuf_add3:NEAR
_BSS	SEGMENT
	ALIGN	4

$SG70656 DB	01H DUP (?)
	ALIGN	4

$SG70689 DB	01H DUP (?)
	ALIGN	4

$SG70695 DB	01H DUP (?)
	ALIGN	4

$SG70595 DB	01H DUP (?)
	ALIGN	4

$SG70650 DB	01H DUP (?)
_BSS	ENDS
_DATA	SEGMENT
	ORG $+3
$SG70596 DB	'SEARCHCOL', 00H
	ORG $+2
$SG70598 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70608 DB	']', 0aH, 0aH, 00H
$SG70609 DB	'Chercher dans [', 00H
$SG70611 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70615 DB	'Chercher dans toutes les donn', 0e9H, 'es des fiches', 0aH
	DB	0aH, 00H
	ORG $+2
$SG70617 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70621 DB	'Recherche activ', 0e9H, 'e sur cette colonne', 0aH, 0aH, 'C'
	DB	'liquez pour chercher dans les colonnes par d', 0e9H, 'faut', 00H
$SG70623 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70628 DB	'Recherche activ', 0e9H, 'e sur cette colonne et sur d''a'
	DB	'utres colonnes', 0aH, 0aH, 'Cliquez pour chercher uniquement '
	DB	'dans cette colonne', 00H
	ORG $+2
$SG70630 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70634 DB	'Recherche non activ', 0e9H, 'e sur cette colonne', 0aH, 0aH
	DB	'Cliquez pour chercher dans cette colonne', 00H
	ORG $+2
$SG70636 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70642 DB	'_eva_search2.gif', 00H
	ORG $+3
$SG70643 DB	'_eva_search2_s.gif', 00H
	ORG $+1
$SG70644 DB	'_eva_search2_s.gif', 00H
	ORG $+1
$SG70645 DB	'_eva_search2.gif', 00H
	ORG $+3
$SG70651 DB	'SORTASC', 00H
$SG70653 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70657 DB	'SORTDESC', 00H
	ORG $+3
$SG70659 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70668 DB	'] par ordre croissant', 00H
	ORG $+2
$SG70669 DB	'Trier [', 00H
$SG70671 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70675 DB	'Trier par ordre de cr', 0e9H, 'ation des fiches (+ ancie'
	DB	'nnes en 1er)', 0aH, 0aH, 00H
	ORG $+2
$SG70677 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70683 DB	'_eva_sort_asc.gif', 00H
	ORG $+2
$SG70684 DB	'_eva_sort_asc_s.gif', 00H
$SG70685 DB	'_eva_sort_asc_s.gif', 00H
$SG70686 DB	'_eva_sort_asc.gif', 00H
	ORG $+2
$SG70690 DB	'SORTASC', 00H
$SG70692 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70696 DB	'SORTDESC', 00H
	ORG $+3
$SG70698 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70707 DB	'] par ordre d', 0e9H, 'croissant', 00H
$SG70708 DB	'Trier [', 00H
$SG70710 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70714 DB	'Trier par ordre de cr', 0e9H, 'ation des fiches (+ r', 0e9H
	DB	'centes en 1er)', 0aH, 0aH, 00H
	ORG $+3
$SG70716 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70722 DB	'_eva_sort_desc.gif', 00H
	ORG $+1
$SG70723 DB	'_eva_sort_desc_s.gif', 00H
	ORG $+3
$SG70724 DB	'_eva_sort_desc_s.gif', 00H
	ORG $+3
$SG70725 DB	'_eva_sort_desc.gif', 00H
	ORG $+1
$SG70727 DB	'D:\Travail\ABI\EVA\V4.0\CGI\Brunix-2016\table_utils.c', 00H
	ORG $+2
$SG70728 DB	'table_add_searchsort_btn', 00H
	ORG $+3
$SG70730 DB	'D:\Travail\ABI\EVA\V4.0\CGI\Brunix-2016\table_utils.c', 00H
	ORG $+2
$SG70731 DB	'table_add_searchsort_btn', 00H
_DATA	ENDS
_TEXT	SEGMENT
__c$70664 = -40
__c$70703 = -44
_cntxt$ = 8
_ctrl$ = 12
_i$ = 16
_b_search$ = 20
_b_sort$ = 24
_b_invsort$ = 28
_val$ = -8
_name$ = -24
_subfield$ = -4
_tbl$ = -16
_j$ = -20
_b_sel$ = -28
_html$ = -12
__c$70604 = -32
_b_sortdesc$70647 = -36
_table_add_searchsort_btn PROC NEAR

; 371  : ){

	push	ebp
	mov	ebp, esp
	sub	esp, 124				; 0000007cH

; 372  : 	DynBuffer *val = NULL;

	mov	DWORD PTR _val$[ebp], 0

; 373  : 	DynBuffer *name = NULL;

	mov	DWORD PTR _name$[ebp], 0

; 374  : 	DynBuffer *subfield = NULL;

	mov	DWORD PTR _subfield$[ebp], 0

; 375  : 	ObjTableFormat *tbl = ctrl->objtbl;

	mov	eax, DWORD PTR _ctrl$[ebp]
	mov	ecx, DWORD PTR [eax+232]
	mov	DWORD PTR _tbl$[ebp], ecx

; 376  : 	int j = unique_bit_index(tbl->srchcol);

	mov	edx, DWORD PTR _tbl$[ebp]
	mov	eax, DWORD PTR [edx+124]
	push	eax
	call	_unique_bit_index
	add	esp, 4
	mov	DWORD PTR _j$[ebp], eax

; 377  : 	int b_sel = tbl->srchcol & (1 << i);

	mov	edx, 1
	mov	ecx, DWORD PTR _i$[ebp]
	shl	edx, cl
	mov	eax, DWORD PTR _tbl$[ebp]
	mov	ecx, DWORD PTR [eax+124]
	and	ecx, edx
	mov	DWORD PTR _b_sel$[ebp], ecx

; 378  : 	CHECK_HTML_STATUS;

	cmp	DWORD PTR _cntxt$[ebp], 0
	je	SHORT $L73306
	mov	edx, DWORD PTR _cntxt$[ebp]
	cmp	DWORD PTR [edx+80], 0
	je	SHORT $L73304
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	ecx, DWORD PTR [eax+80]
	mov	edx, DWORD PTR [ecx+232]
	mov	DWORD PTR -48+[ebp], edx
	jmp	SHORT $L73305
$L73304:
	mov	DWORD PTR -48+[ebp], 0
$L73305:
	mov	eax, DWORD PTR -48+[ebp]
	mov	DWORD PTR -52+[ebp], eax
	jmp	SHORT $L73307
$L73306:
	mov	DWORD PTR -52+[ebp], 0
$L73307:
	mov	ecx, DWORD PTR -52+[ebp]
	mov	DWORD PTR _html$[ebp], ecx
	cmp	DWORD PTR _html$[ebp], 0
	jne	SHORT $L70592
	xor	eax, eax
	jmp	$L70579
$L70592:

; 379  : 
; 380  : 	/* Output search button if applicable */
; 381  : 	if(b_search)

	cmp	DWORD PTR _b_search$[ebp], 0
	je	$L70641

; 383  : 		DYNBUF_ADD3_INT(&subfield, "SEARCHCOL", i, "");

	push	0
	push	OFFSET FLAT:$SG70595
	mov	edx, DWORD PTR _i$[ebp]
	push	edx
	push	9
	push	OFFSET FLAT:$SG70596
	lea	eax, DWORD PTR _subfield$[ebp]
	push	eax
	call	_dynbuf_add3_int
	add	esp, 24					; 00000018H
	test	eax, eax
	je	SHORT $L70594
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29872], OFFSET FLAT:$SG70598
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 383		; 0000017fH
	jmp	$eva_err$70599
$L70594:

; 384  : 		CTRL_CGINAMEBTN(&name, NULL, DYNBUF_VAL_SZ(subfield));

	cmp	DWORD PTR _subfield$[ebp], 0
	je	SHORT $L73308
	mov	eax, DWORD PTR _subfield$[ebp]
	mov	ecx, DWORD PTR [eax+4]
	mov	DWORD PTR -56+[ebp], ecx
	jmp	SHORT $L73309
$L73308:
	mov	DWORD PTR -56+[ebp], 0
$L73309:
	cmp	DWORD PTR _subfield$[ebp], 0
	je	SHORT $L73310
	mov	edx, DWORD PTR _subfield$[ebp]
	add	edx, 8
	mov	DWORD PTR -60+[ebp], edx
	jmp	SHORT $L73311
$L73310:
	mov	DWORD PTR -60+[ebp], 0
$L73311:
	mov	eax, DWORD PTR -56+[ebp]
	push	eax
	mov	ecx, DWORD PTR -60+[ebp]
	push	ecx
	push	66					; 00000042H
	lea	edx, DWORD PTR _name$[ebp]
	push	edx
	push	1
	push	0
	mov	eax, DWORD PTR _ctrl$[ebp]
	push	eax
	mov	ecx, DWORD PTR _cntxt$[ebp]
	push	ecx
	call	_ctrl_cgi_name
	add	esp, 32					; 00000020H
	test	eax, eax
	je	SHORT $L70602
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 384		; 00000180H
	jmp	$eva_err$70599
$L70602:

; 385  : 		M_FREE(subfield);

	mov	eax, DWORD PTR _subfield$[ebp]
	push	eax
	call	_mem_free
	add	esp, 4
	mov	DWORD PTR _subfield$[ebp], 0

; 386  : 		if(i < tbl->field.nbrows)

	mov	ecx, DWORD PTR _tbl$[ebp]
	mov	edx, DWORD PTR _i$[ebp]
	cmp	edx, DWORD PTR [ecx+380]
	jae	$L70603

; 387  : 			DYNBUF_ADD3_CELLP(&val, "Chercher dans [", LABEL_OR_FIELD_CELL(i), NO_CONV, "]\n\n")

	mov	eax, DWORD PTR _i$[ebp]
	push	eax
	mov	ecx, DWORD PTR _tbl$[ebp]
	push	ecx
	call	_table_column_label
	add	esp, 8
	mov	DWORD PTR __c$70604[ebp], eax
	cmp	DWORD PTR __c$70604[ebp], 0
	je	SHORT $L73312
	mov	edx, DWORD PTR __c$70604[ebp]
	mov	eax, DWORD PTR [edx+4]
	mov	DWORD PTR -64+[ebp], eax
	jmp	SHORT $L73313
$L73312:
	mov	DWORD PTR -64+[ebp], 0
$L73313:
	cmp	DWORD PTR __c$70604[ebp], 0
	je	SHORT $L73314
	mov	ecx, DWORD PTR __c$70604[ebp]
	mov	edx, DWORD PTR [ecx]
	mov	DWORD PTR -68+[ebp], edx
	jmp	SHORT $L73315
$L73314:
	mov	DWORD PTR -68+[ebp], 0
$L73315:
	push	3
	push	OFFSET FLAT:$SG70608
	push	0
	push	0
	mov	eax, DWORD PTR -64+[ebp]
	push	eax
	mov	ecx, DWORD PTR -68+[ebp]
	push	ecx
	push	15					; 0000000fH
	push	OFFSET FLAT:$SG70609
	lea	edx, DWORD PTR _val$[ebp]
	push	edx
	call	_dynbuf_add3
	add	esp, 36					; 00000024H
	test	eax, eax
	je	SHORT $L70607
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29872], OFFSET FLAT:$SG70611
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 387		; 00000183H
	jmp	$eva_err$70599
$L70607:

; 388  : 		else

	jmp	SHORT $L70614
$L70603:

; 389  : 			DYNBUF_ADD_STR(&val, "Chercher dans toutes les données des fiches\n\n");

	push	0
	push	0
	push	45					; 0000002dH
	push	OFFSET FLAT:$SG70615
	lea	edx, DWORD PTR _val$[ebp]
	push	edx
	call	_dynbuf_add
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L70614
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29872], OFFSET FLAT:$SG70617
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 389		; 00000185H
	jmp	$eva_err$70599
$L70614:

; 390  : 		if(j && b_sel)

	cmp	DWORD PTR _j$[ebp], 0
	je	SHORT $L70618
	cmp	DWORD PTR _b_sel$[ebp], 0
	je	SHORT $L70618

; 393  : 				"Cliquez pour chercher dans les colonnes par défaut");

	push	0
	push	0
	push	87					; 00000057H
	push	OFFSET FLAT:$SG70621
	lea	edx, DWORD PTR _val$[ebp]
	push	edx
	call	_dynbuf_add
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L70620
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29872], OFFSET FLAT:$SG70623
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 393		; 00000189H
	jmp	$eva_err$70599
$L70620:

; 395  : 		else if(b_sel)

	jmp	SHORT $L70633
$L70618:
	cmp	DWORD PTR _b_sel$[ebp], 0
	je	SHORT $L70625

; 398  : 				"Cliquez pour chercher uniquement dans cette colonne");

	push	0
	push	0
	push	113					; 00000071H
	push	OFFSET FLAT:$SG70628
	lea	edx, DWORD PTR _val$[ebp]
	push	edx
	call	_dynbuf_add
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L70627
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29872], OFFSET FLAT:$SG70630
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 398		; 0000018eH
	jmp	$eva_err$70599
$L70627:

; 400  : 		else

	jmp	SHORT $L70633
$L70625:

; 403  : 				"Cliquez pour chercher dans cette colonne");

	push	0
	push	0
	push	81					; 00000051H
	push	OFFSET FLAT:$SG70634
	lea	edx, DWORD PTR _val$[ebp]
	push	edx
	call	_dynbuf_add
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L70633
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29872], OFFSET FLAT:$SG70636
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 403		; 00000193H
	jmp	$eva_err$70599
$L70633:

; 405  : 		if(b_sel ?
; 406  : 			put_html_button(cntxt, name->data, NULL, "_eva_search2_s.gif", "_eva_search2.gif", val->data, 0, 0) :
; 407  : 			put_html_button(cntxt, name->data, NULL, "_eva_search2.gif", "_eva_search2_s.gif", val->data, 0, 0))

	cmp	DWORD PTR _b_sel$[ebp], 0
	je	SHORT $L73316
	push	0
	push	0
	push	0
	push	0
	push	0
	mov	edx, DWORD PTR _val$[ebp]
	add	edx, 8
	push	edx
	push	OFFSET FLAT:$SG70642
	push	OFFSET FLAT:$SG70643
	push	0
	mov	eax, DWORD PTR _name$[ebp]
	add	eax, 8
	push	eax
	mov	ecx, DWORD PTR _cntxt$[ebp]
	push	ecx
	call	_put_html_button_sz
	add	esp, 44					; 0000002cH
	mov	DWORD PTR -72+[ebp], eax
	jmp	SHORT $L73317
$L73316:
	push	0
	push	0
	push	0
	push	0
	push	0
	mov	edx, DWORD PTR _val$[ebp]
	add	edx, 8
	push	edx
	push	OFFSET FLAT:$SG70644
	push	OFFSET FLAT:$SG70645
	push	0
	mov	eax, DWORD PTR _name$[ebp]
	add	eax, 8
	push	eax
	mov	ecx, DWORD PTR _cntxt$[ebp]
	push	ecx
	call	_put_html_button_sz
	add	esp, 44					; 0000002cH
	mov	DWORD PTR -72+[ebp], eax
$L73317:
	cmp	DWORD PTR -72+[ebp], 0
	je	SHORT $L70641

; 408  : 				STACK_ERROR;

	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 408		; 00000198H
	jmp	$eva_err$70599
$L70641:

; 410  : 
; 411  : 	/* Output sort buttons */
; 412  : 	if(b_sort)

	cmp	DWORD PTR _b_sort$[ebp], 0
	je	$eva_noerr$70726

; 414  : 		int b_sortdesc = b_invsort ? !tbl->b_sortdesc : tbl->b_sortdesc;

	cmp	DWORD PTR _b_invsort$[ebp], 0
	je	SHORT $L73318
	mov	eax, DWORD PTR _tbl$[ebp]
	xor	ecx, ecx
	cmp	DWORD PTR [eax+64], 0
	sete	cl
	mov	DWORD PTR -76+[ebp], ecx
	jmp	SHORT $L73319
$L73318:
	mov	edx, DWORD PTR _tbl$[ebp]
	mov	eax, DWORD PTR [edx+64]
	mov	DWORD PTR -76+[ebp], eax
$L73319:
	mov	ecx, DWORD PTR -76+[ebp]
	mov	DWORD PTR _b_sortdesc$70647[ebp], ecx

; 415  : 		M_FREE(val);

	mov	edx, DWORD PTR _val$[ebp]
	push	edx
	call	_mem_free
	add	esp, 4
	mov	DWORD PTR _val$[ebp], 0

; 416  : 		if(!b_invsort) DYNBUF_ADD3_INT(&val, "SORTASC", i, "")

	cmp	DWORD PTR _b_invsort$[ebp], 0
	jne	SHORT $L70648
	push	0
	push	OFFSET FLAT:$SG70650
	mov	eax, DWORD PTR _i$[ebp]
	push	eax
	push	7
	push	OFFSET FLAT:$SG70651
	lea	ecx, DWORD PTR _val$[ebp]
	push	ecx
	call	_dynbuf_add3_int
	add	esp, 24					; 00000018H
	test	eax, eax
	je	SHORT $L70649
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29872], OFFSET FLAT:$SG70653
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 416		; 000001a0H
	jmp	$eva_err$70599
$L70649:

; 417  : 		else  DYNBUF_ADD3_INT(&val, "SORTDESC", i, "");

	jmp	SHORT $L70655
$L70648:
	push	0
	push	OFFSET FLAT:$SG70656
	mov	ecx, DWORD PTR _i$[ebp]
	push	ecx
	push	8
	push	OFFSET FLAT:$SG70657
	lea	edx, DWORD PTR _val$[ebp]
	push	edx
	call	_dynbuf_add3_int
	add	esp, 24					; 00000018H
	test	eax, eax
	je	SHORT $L70655
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29872], OFFSET FLAT:$SG70659
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 417		; 000001a1H
	jmp	$eva_err$70599
$L70655:

; 418  : 		CTRL_CGINAMEBTN(&name, NULL, DYNBUF_VAL_SZ(val));

	cmp	DWORD PTR _val$[ebp], 0
	je	SHORT $L73320
	mov	edx, DWORD PTR _val$[ebp]
	mov	eax, DWORD PTR [edx+4]
	mov	DWORD PTR -80+[ebp], eax
	jmp	SHORT $L73321
$L73320:
	mov	DWORD PTR -80+[ebp], 0
$L73321:
	cmp	DWORD PTR _val$[ebp], 0
	je	SHORT $L73322
	mov	ecx, DWORD PTR _val$[ebp]
	add	ecx, 8
	mov	DWORD PTR -84+[ebp], ecx
	jmp	SHORT $L73323
$L73322:
	mov	DWORD PTR -84+[ebp], 0
$L73323:
	mov	edx, DWORD PTR -80+[ebp]
	push	edx
	mov	eax, DWORD PTR -84+[ebp]
	push	eax
	push	66					; 00000042H
	lea	ecx, DWORD PTR _name$[ebp]
	push	ecx
	push	1
	push	0
	mov	edx, DWORD PTR _ctrl$[ebp]
	push	edx
	mov	eax, DWORD PTR _cntxt$[ebp]
	push	eax
	call	_ctrl_cgi_name
	add	esp, 32					; 00000020H
	test	eax, eax
	je	SHORT $L70662
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 418		; 000001a2H
	jmp	$eva_err$70599
$L70662:

; 419  : 		M_FREE(val);

	mov	edx, DWORD PTR _val$[ebp]
	push	edx
	call	_mem_free
	add	esp, 4
	mov	DWORD PTR _val$[ebp], 0

; 420  : 		if(i < tbl->field.nbrows)

	mov	eax, DWORD PTR _tbl$[ebp]
	mov	ecx, DWORD PTR _i$[ebp]
	cmp	ecx, DWORD PTR [eax+380]
	jae	$L70663

; 421  : 			DYNBUF_ADD3_CELLP(&val, "Trier [", LABEL_OR_FIELD_CELL(i), NO_CONV, "] par ordre croissant")

	mov	edx, DWORD PTR _i$[ebp]
	push	edx
	mov	eax, DWORD PTR _tbl$[ebp]
	push	eax
	call	_table_column_label
	add	esp, 8
	mov	DWORD PTR __c$70664[ebp], eax
	cmp	DWORD PTR __c$70664[ebp], 0
	je	SHORT $L73324
	mov	ecx, DWORD PTR __c$70664[ebp]
	mov	edx, DWORD PTR [ecx+4]
	mov	DWORD PTR -88+[ebp], edx
	jmp	SHORT $L73325
$L73324:
	mov	DWORD PTR -88+[ebp], 0
$L73325:
	cmp	DWORD PTR __c$70664[ebp], 0
	je	SHORT $L73326
	mov	eax, DWORD PTR __c$70664[ebp]
	mov	ecx, DWORD PTR [eax]
	mov	DWORD PTR -92+[ebp], ecx
	jmp	SHORT $L73327
$L73326:
	mov	DWORD PTR -92+[ebp], 0
$L73327:
	push	21					; 00000015H
	push	OFFSET FLAT:$SG70668
	push	0
	push	0
	mov	edx, DWORD PTR -88+[ebp]
	push	edx
	mov	eax, DWORD PTR -92+[ebp]
	push	eax
	push	7
	push	OFFSET FLAT:$SG70669
	lea	ecx, DWORD PTR _val$[ebp]
	push	ecx
	call	_dynbuf_add3
	add	esp, 36					; 00000024H
	test	eax, eax
	je	SHORT $L70667
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29872], OFFSET FLAT:$SG70671
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 421		; 000001a5H
	jmp	$eva_err$70599
$L70667:

; 422  : 		else

	jmp	SHORT $L70674
$L70663:

; 423  : 			DYNBUF_ADD_STR(&val, "Trier par ordre de création des fiches (+ anciennes en 1er)\n\n");

	push	0
	push	0
	push	61					; 0000003dH
	push	OFFSET FLAT:$SG70675
	lea	ecx, DWORD PTR _val$[ebp]
	push	ecx
	call	_dynbuf_add
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L70674
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29872], OFFSET FLAT:$SG70677
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 423		; 000001a7H
	jmp	$eva_err$70599
$L70674:

; 424  : 		if(((tbl->sortcol >= tbl->field.nbrows ? tbl->field.nbrows : tbl->sortcol) == i && !b_sortdesc) ?
; 425  : 			put_html_button(cntxt, name->data, NULL, "_eva_sort_asc_s.gif", "_eva_sort_asc.gif", val->data, 0, 0) :
; 426  : 			put_html_button(cntxt, name->data, NULL, "_eva_sort_asc.gif", "_eva_sort_asc_s.gif", val->data, 0, 0))

	mov	ecx, DWORD PTR _tbl$[ebp]
	mov	edx, DWORD PTR _tbl$[ebp]
	mov	eax, DWORD PTR [ecx+60]
	cmp	eax, DWORD PTR [edx+380]
	jb	SHORT $L73328
	mov	ecx, DWORD PTR _tbl$[ebp]
	mov	edx, DWORD PTR [ecx+380]
	mov	DWORD PTR -96+[ebp], edx
	jmp	SHORT $L73329
$L73328:
	mov	eax, DWORD PTR _tbl$[ebp]
	mov	ecx, DWORD PTR [eax+60]
	mov	DWORD PTR -96+[ebp], ecx
$L73329:
	mov	edx, DWORD PTR -96+[ebp]
	cmp	edx, DWORD PTR _i$[ebp]
	jne	SHORT $L73330
	cmp	DWORD PTR _b_sortdesc$70647[ebp], 0
	jne	SHORT $L73330
	push	0
	push	0
	push	0
	push	0
	push	0
	mov	eax, DWORD PTR _val$[ebp]
	add	eax, 8
	push	eax
	push	OFFSET FLAT:$SG70683
	push	OFFSET FLAT:$SG70684
	push	0
	mov	ecx, DWORD PTR _name$[ebp]
	add	ecx, 8
	push	ecx
	mov	edx, DWORD PTR _cntxt$[ebp]
	push	edx
	call	_put_html_button_sz
	add	esp, 44					; 0000002cH
	mov	DWORD PTR -100+[ebp], eax
	jmp	SHORT $L73331
$L73330:
	push	0
	push	0
	push	0
	push	0
	push	0
	mov	eax, DWORD PTR _val$[ebp]
	add	eax, 8
	push	eax
	push	OFFSET FLAT:$SG70685
	push	OFFSET FLAT:$SG70686
	push	0
	mov	ecx, DWORD PTR _name$[ebp]
	add	ecx, 8
	push	ecx
	mov	edx, DWORD PTR _cntxt$[ebp]
	push	edx
	call	_put_html_button_sz
	add	esp, 44					; 0000002cH
	mov	DWORD PTR -100+[ebp], eax
$L73331:
	cmp	DWORD PTR -100+[ebp], 0
	je	SHORT $L70682

; 427  : 				STACK_ERROR;

	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 427		; 000001abH
	jmp	$eva_err$70599
$L70682:

; 428  : 		M_FREE(val);

	mov	ecx, DWORD PTR _val$[ebp]
	push	ecx
	call	_mem_free
	add	esp, 4
	mov	DWORD PTR _val$[ebp], 0

; 429  : 		if(b_invsort) DYNBUF_ADD3_INT(&val, "SORTASC", i, "")

	cmp	DWORD PTR _b_invsort$[ebp], 0
	je	SHORT $L70687
	push	0
	push	OFFSET FLAT:$SG70689
	mov	edx, DWORD PTR _i$[ebp]
	push	edx
	push	7
	push	OFFSET FLAT:$SG70690
	lea	eax, DWORD PTR _val$[ebp]
	push	eax
	call	_dynbuf_add3_int
	add	esp, 24					; 00000018H
	test	eax, eax
	je	SHORT $L70688
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29872], OFFSET FLAT:$SG70692
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 429		; 000001adH
	jmp	$eva_err$70599
$L70688:

; 430  : 		else  DYNBUF_ADD3_INT(&val, "SORTDESC", i, "");

	jmp	SHORT $L70694
$L70687:
	push	0
	push	OFFSET FLAT:$SG70695
	mov	eax, DWORD PTR _i$[ebp]
	push	eax
	push	8
	push	OFFSET FLAT:$SG70696
	lea	ecx, DWORD PTR _val$[ebp]
	push	ecx
	call	_dynbuf_add3_int
	add	esp, 24					; 00000018H
	test	eax, eax
	je	SHORT $L70694
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29872], OFFSET FLAT:$SG70698
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 430		; 000001aeH
	jmp	$eva_err$70599
$L70694:

; 431  : 		CTRL_CGINAMEBTN(&name, NULL, DYNBUF_VAL_SZ(val));

	cmp	DWORD PTR _val$[ebp], 0
	je	SHORT $L73332
	mov	ecx, DWORD PTR _val$[ebp]
	mov	edx, DWORD PTR [ecx+4]
	mov	DWORD PTR -104+[ebp], edx
	jmp	SHORT $L73333
$L73332:
	mov	DWORD PTR -104+[ebp], 0
$L73333:
	cmp	DWORD PTR _val$[ebp], 0
	je	SHORT $L73334
	mov	eax, DWORD PTR _val$[ebp]
	add	eax, 8
	mov	DWORD PTR -108+[ebp], eax
	jmp	SHORT $L73335
$L73334:
	mov	DWORD PTR -108+[ebp], 0
$L73335:
	mov	ecx, DWORD PTR -104+[ebp]
	push	ecx
	mov	edx, DWORD PTR -108+[ebp]
	push	edx
	push	66					; 00000042H
	lea	eax, DWORD PTR _name$[ebp]
	push	eax
	push	1
	push	0
	mov	ecx, DWORD PTR _ctrl$[ebp]
	push	ecx
	mov	edx, DWORD PTR _cntxt$[ebp]
	push	edx
	call	_ctrl_cgi_name
	add	esp, 32					; 00000020H
	test	eax, eax
	je	SHORT $L70701
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 431		; 000001afH
	jmp	$eva_err$70599
$L70701:

; 432  : 		M_FREE(val);

	mov	ecx, DWORD PTR _val$[ebp]
	push	ecx
	call	_mem_free
	add	esp, 4
	mov	DWORD PTR _val$[ebp], 0

; 433  : 		if(i < tbl->field.nbrows)

	mov	edx, DWORD PTR _tbl$[ebp]
	mov	eax, DWORD PTR _i$[ebp]
	cmp	eax, DWORD PTR [edx+380]
	jae	$L70702

; 434  : 			DYNBUF_ADD3_CELLP(&val, "Trier [", LABEL_OR_FIELD_CELL(i), NO_CONV, "] par ordre décroissant")

	mov	ecx, DWORD PTR _i$[ebp]
	push	ecx
	mov	edx, DWORD PTR _tbl$[ebp]
	push	edx
	call	_table_column_label
	add	esp, 8
	mov	DWORD PTR __c$70703[ebp], eax
	cmp	DWORD PTR __c$70703[ebp], 0
	je	SHORT $L73336
	mov	eax, DWORD PTR __c$70703[ebp]
	mov	ecx, DWORD PTR [eax+4]
	mov	DWORD PTR -112+[ebp], ecx
	jmp	SHORT $L73337
$L73336:
	mov	DWORD PTR -112+[ebp], 0
$L73337:
	cmp	DWORD PTR __c$70703[ebp], 0
	je	SHORT $L73338
	mov	edx, DWORD PTR __c$70703[ebp]
	mov	eax, DWORD PTR [edx]
	mov	DWORD PTR -116+[ebp], eax
	jmp	SHORT $L73339
$L73338:
	mov	DWORD PTR -116+[ebp], 0
$L73339:
	push	23					; 00000017H
	push	OFFSET FLAT:$SG70707
	push	0
	push	0
	mov	ecx, DWORD PTR -112+[ebp]
	push	ecx
	mov	edx, DWORD PTR -116+[ebp]
	push	edx
	push	7
	push	OFFSET FLAT:$SG70708
	lea	eax, DWORD PTR _val$[ebp]
	push	eax
	call	_dynbuf_add3
	add	esp, 36					; 00000024H
	test	eax, eax
	je	SHORT $L70706
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29872], OFFSET FLAT:$SG70710
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 434		; 000001b2H
	jmp	$eva_err$70599
$L70706:

; 435  : 		else

	jmp	SHORT $L70713
$L70702:

; 436  : 			DYNBUF_ADD_STR(&val, "Trier par ordre de création des fiches (+ récentes en 1er)\n\n");

	push	0
	push	0
	push	60					; 0000003cH
	push	OFFSET FLAT:$SG70714
	lea	eax, DWORD PTR _val$[ebp]
	push	eax
	call	_dynbuf_add
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L70713
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29872], OFFSET FLAT:$SG70716
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 436		; 000001b4H
	jmp	$eva_err$70599
$L70713:

; 437  : 		if(((tbl->sortcol >= tbl->field.nbrows ? tbl->field.nbrows : tbl->sortcol) == i && b_sortdesc) ?
; 438  : 			put_html_button(cntxt, name->data, NULL, "_eva_sort_desc_s.gif", "_eva_sort_desc.gif", val->data, 0, 0) :
; 439  : 			put_html_button(cntxt, name->data, NULL, "_eva_sort_desc.gif", "_eva_sort_desc_s.gif", val->data, 0, 0))

	mov	eax, DWORD PTR _tbl$[ebp]
	mov	ecx, DWORD PTR _tbl$[ebp]
	mov	edx, DWORD PTR [eax+60]
	cmp	edx, DWORD PTR [ecx+380]
	jb	SHORT $L73340
	mov	eax, DWORD PTR _tbl$[ebp]
	mov	ecx, DWORD PTR [eax+380]
	mov	DWORD PTR -120+[ebp], ecx
	jmp	SHORT $L73341
$L73340:
	mov	edx, DWORD PTR _tbl$[ebp]
	mov	eax, DWORD PTR [edx+60]
	mov	DWORD PTR -120+[ebp], eax
$L73341:
	mov	ecx, DWORD PTR -120+[ebp]
	cmp	ecx, DWORD PTR _i$[ebp]
	jne	SHORT $L73342
	cmp	DWORD PTR _b_sortdesc$70647[ebp], 0
	je	SHORT $L73342
	push	0
	push	0
	push	0
	push	0
	push	0
	mov	edx, DWORD PTR _val$[ebp]
	add	edx, 8
	push	edx
	push	OFFSET FLAT:$SG70722
	push	OFFSET FLAT:$SG70723
	push	0
	mov	eax, DWORD PTR _name$[ebp]
	add	eax, 8
	push	eax
	mov	ecx, DWORD PTR _cntxt$[ebp]
	push	ecx
	call	_put_html_button_sz
	add	esp, 44					; 0000002cH
	mov	DWORD PTR -124+[ebp], eax
	jmp	SHORT $L73343
$L73342:
	push	0
	push	0
	push	0
	push	0
	push	0
	mov	edx, DWORD PTR _val$[ebp]
	add	edx, 8
	push	edx
	push	OFFSET FLAT:$SG70724
	push	OFFSET FLAT:$SG70725
	push	0
	mov	eax, DWORD PTR _name$[ebp]
	add	eax, 8
	push	eax
	mov	ecx, DWORD PTR _cntxt$[ebp]
	push	ecx
	call	_put_html_button_sz
	add	esp, 44					; 0000002cH
	mov	DWORD PTR -124+[ebp], eax
$L73343:
	cmp	DWORD PTR -124+[ebp], 0
	je	SHORT $L70721

; 440  : 				STACK_ERROR;

	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 440		; 000001b8H
	jmp	SHORT $eva_err$70599
$L70721:

; 441  : 		M_FREE(val);

	mov	eax, DWORD PTR _val$[ebp]
	push	eax
	call	_mem_free
	add	esp, 4
	mov	DWORD PTR _val$[ebp], 0
$eva_noerr$70726:

; 443  : 
; 444  : 	RETURN_OK_CLEANUP;

	push	0
	push	OFFSET FLAT:$SG70727
	push	OFFSET FLAT:$SG70728
	mov	ecx, DWORD PTR _cntxt$[ebp]
	push	ecx
	call	_err_clear
	add	esp, 16					; 00000010H
$eva_err$70599:
	mov	edx, DWORD PTR _cntxt$[ebp]
	cmp	DWORD PTR [edx+29872], 0
	je	SHORT $L70729
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	ecx, DWORD PTR [eax+29900]
	push	ecx
	push	OFFSET FLAT:$SG70730
	push	OFFSET FLAT:$SG70731
	mov	edx, DWORD PTR _cntxt$[ebp]
	push	edx
	call	_err_add_context
	add	esp, 16					; 00000010H
$L70729:
	mov	eax, DWORD PTR _name$[ebp]
	push	eax
	call	_mem_free
	add	esp, 4
	mov	DWORD PTR _name$[ebp], 0
	mov	ecx, DWORD PTR _subfield$[ebp]
	push	ecx
	call	_mem_free
	add	esp, 4
	mov	DWORD PTR _subfield$[ebp], 0
	mov	edx, DWORD PTR _cntxt$[ebp]
	xor	eax, eax
	cmp	DWORD PTR [edx+29872], 0
	setne	al
$L70579:

; 445  : }

	mov	esp, ebp
	pop	ebp
	ret	0
_table_add_searchsort_btn ENDP
_TEXT	ENDS
PUBLIC	_table_add_updown_btns
EXTRN	_strlen:NEAR
_BSS	SEGMENT
	ALIGN	4

$SG70768 DB	01H DUP (?)
_BSS	ENDS
_DATA	SEGMENT
	ORG $+3
$SG70761 DB	'<td', 00H
$SG70763 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70769 DB	' bgcolor=#', 00H
	ORG $+1
$SG70771 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70774 DB	' width=1 align=center valign=middle>', 00H
	ORG $+3
$SG70776 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70779 DB	'MOVETOP', 00H
$SG70782 DB	'] en 1', 0e8H, 're ligne', 00H
$SG70783 DB	'Monter [', 00H
	ORG $+3
$SG70785 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70788 DB	'<table cellspacing=0 cellpadding=0 border=0><tr><td>', 00H
	ORG $+3
$SG70790 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70794 DB	'_eva_btn_arrowt_s_small.gif', 00H
$SG70795 DB	'_eva_btn_arrowt_small.gif', 00H
	ORG $+2
$SG70798 DB	'</td>', 0aH, '<td>', 00H
	ORG $+1
$SG70800 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70802 DB	'MOVEUP', 00H
	ORG $+1
$SG70805 DB	'] d''une ligne', 00H
	ORG $+2
$SG70806 DB	'Monter [', 00H
	ORG $+3
$SG70808 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70812 DB	'_eva_btn_arrowu_s_small.gif', 00H
$SG70813 DB	'_eva_btn_arrowu_small.gif', 00H
	ORG $+2
$SG70817 DB	'</td>', 0aH, '</tr><tr><td>', 00H
$SG70819 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70823 DB	'</td></tr></table>', 00H
	ORG $+1
$SG70825 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70828 DB	'MOVEBOTTOM', 00H
	ORG $+1
$SG70831 DB	'] en derni', 0e8H, 're ligne', 00H
$SG70832 DB	'Descendre [', 00H
$SG70834 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70838 DB	'<table cellspacing=0 cellpadding=0 border=0><tr><td>', 00H
	ORG $+3
$SG70840 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70844 DB	'_eva_btn_arrowb_s_small.gif', 00H
$SG70845 DB	'_eva_btn_arrowb_small.gif', 00H
	ORG $+2
$SG70848 DB	'</td>', 0aH, '<td>', 00H
	ORG $+1
$SG70850 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70852 DB	'MOVEDOWN', 00H
	ORG $+3
$SG70855 DB	'] d''une ligne', 00H
	ORG $+2
$SG70856 DB	'Descendre [', 00H
$SG70858 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70862 DB	'_eva_btn_arrowd_s_small.gif', 00H
$SG70863 DB	'_eva_btn_arrowd_small.gif', 00H
	ORG $+2
$SG70866 DB	'</td></tr></table>', 00H
	ORG $+1
$SG70868 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70871 DB	'</td>', 0aH, 00H
	ORG $+1
$SG70873 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70875 DB	'D:\Travail\ABI\EVA\V4.0\CGI\Brunix-2016\table_utils.c', 00H
	ORG $+2
$SG70876 DB	'table_add_updown_btns', 00H
	ORG $+2
$SG70878 DB	'D:\Travail\ABI\EVA\V4.0\CGI\Brunix-2016\table_utils.c', 00H
	ORG $+2
$SG70879 DB	'table_add_updown_btns', 00H
_DATA	ENDS
_TEXT	SEGMENT
_cntxt$ = 8
_ctrl$ = 12
_i_val$ = 16
_label$ = 20
_sz_label$ = 24
_bg_color$ = 28
_val$ = -4
_tooltip$ = -12
_name$ = -20
_b_updown$ = -16
_html$ = -8
_table_add_updown_btns PROC NEAR

; 462  : ){

	push	ebp
	mov	ebp, esp
	sub	esp, 28					; 0000001cH

; 463  : 	DynTableCell *val = dyntab_cell(&ctrl->val, i_val, 0);

	push	0
	mov	eax, DWORD PTR _i_val$[ebp]
	push	eax
	mov	ecx, DWORD PTR _ctrl$[ebp]
	add	ecx, 64					; 00000040H
	push	ecx
	call	_dyntab_cell
	add	esp, 12					; 0000000cH
	mov	DWORD PTR _val$[ebp], eax

; 464  :  	DynBuffer *tooltip = NULL;

	mov	DWORD PTR _tooltip$[ebp], 0

; 465  : 	DynBuffer *name = NULL;

	mov	DWORD PTR _name$[ebp], 0

; 466  : 	int b_updown = (i_val ? 1 : 0) | (i_val < ctrl->val.nbrows - 1 ? 2 : 0);

	xor	edx, edx
	cmp	DWORD PTR _i_val$[ebp], 0
	setne	dl
	mov	eax, DWORD PTR _ctrl$[ebp]
	mov	ecx, DWORD PTR [eax+64]
	sub	ecx, 1
	cmp	DWORD PTR _i_val$[ebp], ecx
	sbb	eax, eax
	and	eax, 2
	or	edx, eax
	mov	DWORD PTR _b_updown$[ebp], edx

; 467  : 	CHECK_HTML_STATUS;

	cmp	DWORD PTR _cntxt$[ebp], 0
	je	SHORT $L73347
	mov	ecx, DWORD PTR _cntxt$[ebp]
	cmp	DWORD PTR [ecx+80], 0
	je	SHORT $L73345
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	eax, DWORD PTR [edx+80]
	mov	ecx, DWORD PTR [eax+232]
	mov	DWORD PTR -24+[ebp], ecx
	jmp	SHORT $L73346
$L73345:
	mov	DWORD PTR -24+[ebp], 0
$L73346:
	mov	edx, DWORD PTR -24+[ebp]
	mov	DWORD PTR -28+[ebp], edx
	jmp	SHORT $L73348
$L73347:
	mov	DWORD PTR -28+[ebp], 0
$L73348:
	mov	eax, DWORD PTR -28+[ebp]
	mov	DWORD PTR _html$[ebp], eax
	cmp	DWORD PTR _html$[ebp], 0
	jne	SHORT $L70758
	xor	eax, eax
	jmp	$L70748
$L70758:

; 468  : 
; 469  : 	DYNBUF_ADD_STR(html, "<td");

	push	0
	push	0
	push	3
	push	OFFSET FLAT:$SG70761
	mov	ecx, DWORD PTR _html$[ebp]
	push	ecx
	call	_dynbuf_add
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L70760
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29872], OFFSET FLAT:$SG70763
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 469		; 000001d5H
	jmp	$eva_err$70764
$L70760:

; 470  : 	if(*bg_color && strlen(bg_color) == 6) DYNBUF_ADD3(html, " bgcolor=#", bg_color, 6, NO_CONV,"");

	mov	ecx, DWORD PTR _bg_color$[ebp]
	movsx	edx, BYTE PTR [ecx]
	test	edx, edx
	je	SHORT $L70767
	mov	eax, DWORD PTR _bg_color$[ebp]
	push	eax
	call	_strlen
	add	esp, 4
	cmp	eax, 6
	jne	SHORT $L70767
	push	0
	push	OFFSET FLAT:$SG70768
	push	0
	push	0
	push	6
	mov	ecx, DWORD PTR _bg_color$[ebp]
	push	ecx
	push	10					; 0000000aH
	push	OFFSET FLAT:$SG70769
	mov	edx, DWORD PTR _html$[ebp]
	push	edx
	call	_dynbuf_add3
	add	esp, 36					; 00000024H
	test	eax, eax
	je	SHORT $L70767
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29872], OFFSET FLAT:$SG70771
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 470		; 000001d6H
	jmp	$eva_err$70764
$L70767:

; 471  : 	DYNBUF_ADD_STR(html, " width=1 align=center valign=middle>");

	push	0
	push	0
	push	36					; 00000024H
	push	OFFSET FLAT:$SG70774
	mov	edx, DWORD PTR _html$[ebp]
	push	edx
	call	_dynbuf_add
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L70773
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29872], OFFSET FLAT:$SG70776
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 471		; 000001d7H
	jmp	$eva_err$70764
$L70773:

; 472  : 	if(b_updown & 1 && cntxt->form->step != HtmlPrint)

	mov	edx, DWORD PTR _b_updown$[ebp]
	and	edx, 1
	test	edx, edx
	je	$L70822
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	ecx, DWORD PTR [eax+80]
	cmp	DWORD PTR [ecx+176], 7
	je	$L70822

; 474  : 		/* Output top arrow button */
; 475  : 		M_FREE(name); M_FREE(tooltip);

	mov	edx, DWORD PTR _name$[ebp]
	push	edx
	call	_mem_free
	add	esp, 4
	mov	DWORD PTR _name$[ebp], 0
	mov	eax, DWORD PTR _tooltip$[ebp]
	push	eax
	call	_mem_free
	add	esp, 4
	mov	DWORD PTR _tooltip$[ebp], 0

; 476  : 		CTRL_CGINAMEBTN(&name, val, add_sz_str("MOVETOP"));

	push	7
	push	OFFSET FLAT:$SG70779
	push	66					; 00000042H
	lea	ecx, DWORD PTR _name$[ebp]
	push	ecx
	push	1
	mov	edx, DWORD PTR _val$[ebp]
	push	edx
	mov	eax, DWORD PTR _ctrl$[ebp]
	push	eax
	mov	ecx, DWORD PTR _cntxt$[ebp]
	push	ecx
	call	_ctrl_cgi_name
	add	esp, 32					; 00000020H
	test	eax, eax
	je	SHORT $L70778
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 476		; 000001dcH
	jmp	$eva_err$70764
$L70778:

; 477  : 		DYNBUF_ADD3(&tooltip, "Monter [", label, sz_label, NO_CONV, "] en 1ère ligne")

	push	15					; 0000000fH
	push	OFFSET FLAT:$SG70782
	push	0
	push	0
	mov	eax, DWORD PTR _sz_label$[ebp]
	push	eax
	mov	ecx, DWORD PTR _label$[ebp]
	push	ecx
	push	8
	push	OFFSET FLAT:$SG70783
	lea	edx, DWORD PTR _tooltip$[ebp]
	push	edx
	call	_dynbuf_add3
	add	esp, 36					; 00000024H
	test	eax, eax
	je	SHORT $L70781
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29872], OFFSET FLAT:$SG70785
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 477		; 000001ddH
	jmp	$eva_err$70764
$L70781:

; 478  : 		DYNBUF_ADD_STR(html, "<table cellspacing=0 cellpadding=0 border=0><tr><td>");

	push	0
	push	0
	push	52					; 00000034H
	push	OFFSET FLAT:$SG70788
	mov	edx, DWORD PTR _html$[ebp]
	push	edx
	call	_dynbuf_add
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L70787
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29872], OFFSET FLAT:$SG70790
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 478		; 000001deH
	jmp	$eva_err$70764
$L70787:

; 479  : 		if(put_html_button(cntxt, name->data, NULL,
; 480  : 				"_eva_btn_arrowt_small.gif", "_eva_btn_arrowt_s_small.gif",
; 481  : 				tooltip->data, 0, 0))

	push	0
	push	0
	push	0
	push	0
	push	0
	mov	edx, DWORD PTR _tooltip$[ebp]
	add	edx, 8
	push	edx
	push	OFFSET FLAT:$SG70794
	push	OFFSET FLAT:$SG70795
	push	0
	mov	eax, DWORD PTR _name$[ebp]
	add	eax, 8
	push	eax
	mov	ecx, DWORD PTR _cntxt$[ebp]
	push	ecx
	call	_put_html_button_sz
	add	esp, 44					; 0000002cH
	test	eax, eax
	je	SHORT $L70793

; 482  : 			STACK_ERROR;

	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 482		; 000001e2H
	jmp	$eva_err$70764
$L70793:

; 483  : 		DYNBUF_ADD_STR(html, "</td>\n<td>");

	push	0
	push	0
	push	10					; 0000000aH
	push	OFFSET FLAT:$SG70798
	mov	eax, DWORD PTR _html$[ebp]
	push	eax
	call	_dynbuf_add
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L70797
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29872], OFFSET FLAT:$SG70800
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 483		; 000001e3H
	jmp	$eva_err$70764
$L70797:

; 484  : 
; 485  : 		/* Output up arrow button */
; 486  : 		M_FREE(name); M_FREE(tooltip);

	mov	eax, DWORD PTR _name$[ebp]
	push	eax
	call	_mem_free
	add	esp, 4
	mov	DWORD PTR _name$[ebp], 0
	mov	ecx, DWORD PTR _tooltip$[ebp]
	push	ecx
	call	_mem_free
	add	esp, 4
	mov	DWORD PTR _tooltip$[ebp], 0

; 487  : 		CTRL_CGINAMEBTN(&name, val, add_sz_str("MOVEUP"));

	push	6
	push	OFFSET FLAT:$SG70802
	push	66					; 00000042H
	lea	edx, DWORD PTR _name$[ebp]
	push	edx
	push	1
	mov	eax, DWORD PTR _val$[ebp]
	push	eax
	mov	ecx, DWORD PTR _ctrl$[ebp]
	push	ecx
	mov	edx, DWORD PTR _cntxt$[ebp]
	push	edx
	call	_ctrl_cgi_name
	add	esp, 32					; 00000020H
	test	eax, eax
	je	SHORT $L70801
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 487		; 000001e7H
	jmp	$eva_err$70764
$L70801:

; 488  : 		DYNBUF_ADD3(&tooltip, "Monter [", label, sz_label, NO_CONV, "] d'une ligne")

	push	13					; 0000000dH
	push	OFFSET FLAT:$SG70805
	push	0
	push	0
	mov	ecx, DWORD PTR _sz_label$[ebp]
	push	ecx
	mov	edx, DWORD PTR _label$[ebp]
	push	edx
	push	8
	push	OFFSET FLAT:$SG70806
	lea	eax, DWORD PTR _tooltip$[ebp]
	push	eax
	call	_dynbuf_add3
	add	esp, 36					; 00000024H
	test	eax, eax
	je	SHORT $L70804
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29872], OFFSET FLAT:$SG70808
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 488		; 000001e8H
	jmp	$eva_err$70764
$L70804:

; 489  : 		if(put_html_button(cntxt, name->data, NULL,
; 490  : 				"_eva_btn_arrowu_small.gif", "_eva_btn_arrowu_s_small.gif",
; 491  : 				tooltip->data, 0, 0))

	push	0
	push	0
	push	0
	push	0
	push	0
	mov	eax, DWORD PTR _tooltip$[ebp]
	add	eax, 8
	push	eax
	push	OFFSET FLAT:$SG70812
	push	OFFSET FLAT:$SG70813
	push	0
	mov	ecx, DWORD PTR _name$[ebp]
	add	ecx, 8
	push	ecx
	mov	edx, DWORD PTR _cntxt$[ebp]
	push	edx
	call	_put_html_button_sz
	add	esp, 44					; 0000002cH
	test	eax, eax
	je	SHORT $L70811

; 492  : 			STACK_ERROR;

	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 492		; 000001ecH
	jmp	$eva_err$70764
$L70811:

; 493  : 		if(b_updown & 2) DYNBUF_ADD_STR(html, "</td>\n</tr><tr><td>")

	mov	ecx, DWORD PTR _b_updown$[ebp]
	and	ecx, 2
	test	ecx, ecx
	je	SHORT $L70814
	push	0
	push	0
	push	19					; 00000013H
	push	OFFSET FLAT:$SG70817
	mov	edx, DWORD PTR _html$[ebp]
	push	edx
	call	_dynbuf_add
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L70816
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29872], OFFSET FLAT:$SG70819
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 493		; 000001edH
	jmp	$eva_err$70764
$L70816:

; 494  : 		else DYNBUF_ADD_STR(html, "</td></tr></table>")

	jmp	SHORT $L70822
$L70814:
	push	0
	push	0
	push	18					; 00000012H
	push	OFFSET FLAT:$SG70823
	mov	edx, DWORD PTR _html$[ebp]
	push	edx
	call	_dynbuf_add
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L70822
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29872], OFFSET FLAT:$SG70825
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 494		; 000001eeH
	jmp	$eva_err$70764
$L70822:

; 496  : 
; 497  : 	if(b_updown & 2 && cntxt->form->step != HtmlPrint)

	mov	edx, DWORD PTR _b_updown$[ebp]
	and	edx, 2
	test	edx, edx
	je	$L70865
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	ecx, DWORD PTR [eax+80]
	cmp	DWORD PTR [ecx+176], 7
	je	$L70865

; 499  : 		/* Output bottom arrow button */
; 500  : 		M_FREE(name); M_FREE(tooltip);

	mov	edx, DWORD PTR _name$[ebp]
	push	edx
	call	_mem_free
	add	esp, 4
	mov	DWORD PTR _name$[ebp], 0
	mov	eax, DWORD PTR _tooltip$[ebp]
	push	eax
	call	_mem_free
	add	esp, 4
	mov	DWORD PTR _tooltip$[ebp], 0

; 501  : 		CTRL_CGINAMEBTN(&name, val, add_sz_str("MOVEBOTTOM"));

	push	10					; 0000000aH
	push	OFFSET FLAT:$SG70828
	push	66					; 00000042H
	lea	ecx, DWORD PTR _name$[ebp]
	push	ecx
	push	1
	mov	edx, DWORD PTR _val$[ebp]
	push	edx
	mov	eax, DWORD PTR _ctrl$[ebp]
	push	eax
	mov	ecx, DWORD PTR _cntxt$[ebp]
	push	ecx
	call	_ctrl_cgi_name
	add	esp, 32					; 00000020H
	test	eax, eax
	je	SHORT $L70827
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 501		; 000001f5H
	jmp	$eva_err$70764
$L70827:

; 502  : 		DYNBUF_ADD3(&tooltip, "Descendre [", label, sz_label, NO_CONV, "] en dernière ligne")

	push	19					; 00000013H
	push	OFFSET FLAT:$SG70831
	push	0
	push	0
	mov	eax, DWORD PTR _sz_label$[ebp]
	push	eax
	mov	ecx, DWORD PTR _label$[ebp]
	push	ecx
	push	11					; 0000000bH
	push	OFFSET FLAT:$SG70832
	lea	edx, DWORD PTR _tooltip$[ebp]
	push	edx
	call	_dynbuf_add3
	add	esp, 36					; 00000024H
	test	eax, eax
	je	SHORT $L70830
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29872], OFFSET FLAT:$SG70834
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 502		; 000001f6H
	jmp	$eva_err$70764
$L70830:

; 503  : 		if(!(b_updown & 1)) DYNBUF_ADD_STR(html, "<table cellspacing=0 cellpadding=0 border=0><tr><td>");

	mov	edx, DWORD PTR _b_updown$[ebp]
	and	edx, 1
	test	edx, edx
	jne	SHORT $L70837
	push	0
	push	0
	push	52					; 00000034H
	push	OFFSET FLAT:$SG70838
	mov	eax, DWORD PTR _html$[ebp]
	push	eax
	call	_dynbuf_add
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L70837
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29872], OFFSET FLAT:$SG70840
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 503		; 000001f7H
	jmp	$eva_err$70764
$L70837:

; 504  : 		if(put_html_button(cntxt, name->data, NULL,
; 505  : 				"_eva_btn_arrowb_small.gif", "_eva_btn_arrowb_s_small.gif",
; 506  : 				tooltip->data, 0, 0))

	push	0
	push	0
	push	0
	push	0
	push	0
	mov	eax, DWORD PTR _tooltip$[ebp]
	add	eax, 8
	push	eax
	push	OFFSET FLAT:$SG70844
	push	OFFSET FLAT:$SG70845
	push	0
	mov	ecx, DWORD PTR _name$[ebp]
	add	ecx, 8
	push	ecx
	mov	edx, DWORD PTR _cntxt$[ebp]
	push	edx
	call	_put_html_button_sz
	add	esp, 44					; 0000002cH
	test	eax, eax
	je	SHORT $L70843

; 507  : 			STACK_ERROR;

	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 507		; 000001fbH
	jmp	$eva_err$70764
$L70843:

; 508  : 		M_FREE(name); M_FREE(tooltip);

	mov	ecx, DWORD PTR _name$[ebp]
	push	ecx
	call	_mem_free
	add	esp, 4
	mov	DWORD PTR _name$[ebp], 0
	mov	edx, DWORD PTR _tooltip$[ebp]
	push	edx
	call	_mem_free
	add	esp, 4
	mov	DWORD PTR _tooltip$[ebp], 0

; 509  : 		DYNBUF_ADD_STR(html, "</td>\n<td>");

	push	0
	push	0
	push	10					; 0000000aH
	push	OFFSET FLAT:$SG70848
	mov	eax, DWORD PTR _html$[ebp]
	push	eax
	call	_dynbuf_add
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L70847
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29872], OFFSET FLAT:$SG70850
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 509		; 000001fdH
	jmp	$eva_err$70764
$L70847:

; 510  : 
; 511  : 		/* Output down arrow button */
; 512  : 		M_FREE(name); M_FREE(tooltip);

	mov	eax, DWORD PTR _name$[ebp]
	push	eax
	call	_mem_free
	add	esp, 4
	mov	DWORD PTR _name$[ebp], 0
	mov	ecx, DWORD PTR _tooltip$[ebp]
	push	ecx
	call	_mem_free
	add	esp, 4
	mov	DWORD PTR _tooltip$[ebp], 0

; 513  : 		CTRL_CGINAMEBTN(&name, val, add_sz_str("MOVEDOWN"));

	push	8
	push	OFFSET FLAT:$SG70852
	push	66					; 00000042H
	lea	edx, DWORD PTR _name$[ebp]
	push	edx
	push	1
	mov	eax, DWORD PTR _val$[ebp]
	push	eax
	mov	ecx, DWORD PTR _ctrl$[ebp]
	push	ecx
	mov	edx, DWORD PTR _cntxt$[ebp]
	push	edx
	call	_ctrl_cgi_name
	add	esp, 32					; 00000020H
	test	eax, eax
	je	SHORT $L70851
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 513		; 00000201H
	jmp	$eva_err$70764
$L70851:

; 514  : 		DYNBUF_ADD3(&tooltip, "Descendre [", label, sz_label, NO_CONV, "] d'une ligne")

	push	13					; 0000000dH
	push	OFFSET FLAT:$SG70855
	push	0
	push	0
	mov	ecx, DWORD PTR _sz_label$[ebp]
	push	ecx
	mov	edx, DWORD PTR _label$[ebp]
	push	edx
	push	11					; 0000000bH
	push	OFFSET FLAT:$SG70856
	lea	eax, DWORD PTR _tooltip$[ebp]
	push	eax
	call	_dynbuf_add3
	add	esp, 36					; 00000024H
	test	eax, eax
	je	SHORT $L70854
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29872], OFFSET FLAT:$SG70858
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 514		; 00000202H
	jmp	$eva_err$70764
$L70854:

; 515  : 		if(put_html_button(cntxt, name->data, NULL,
; 516  : 				"_eva_btn_arrowd_small.gif", "_eva_btn_arrowd_s_small.gif",
; 517  : 				tooltip->data, 0, 0))

	push	0
	push	0
	push	0
	push	0
	push	0
	mov	eax, DWORD PTR _tooltip$[ebp]
	add	eax, 8
	push	eax
	push	OFFSET FLAT:$SG70862
	push	OFFSET FLAT:$SG70863
	push	0
	mov	ecx, DWORD PTR _name$[ebp]
	add	ecx, 8
	push	ecx
	mov	edx, DWORD PTR _cntxt$[ebp]
	push	edx
	call	_put_html_button_sz
	add	esp, 44					; 0000002cH
	test	eax, eax
	je	SHORT $L70861

; 518  : 			STACK_ERROR;

	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 518		; 00000206H
	jmp	$eva_err$70764
$L70861:

; 519  : 		M_FREE(name); M_FREE(tooltip);

	mov	ecx, DWORD PTR _name$[ebp]
	push	ecx
	call	_mem_free
	add	esp, 4
	mov	DWORD PTR _name$[ebp], 0
	mov	edx, DWORD PTR _tooltip$[ebp]
	push	edx
	call	_mem_free
	add	esp, 4
	mov	DWORD PTR _tooltip$[ebp], 0

; 520  : 		DYNBUF_ADD_STR(html, "</td></tr></table>");

	push	0
	push	0
	push	18					; 00000012H
	push	OFFSET FLAT:$SG70866
	mov	eax, DWORD PTR _html$[ebp]
	push	eax
	call	_dynbuf_add
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L70865
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29872], OFFSET FLAT:$SG70868
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 520		; 00000208H
	jmp	SHORT $eva_err$70764
$L70865:

; 522  : 	DYNBUF_ADD_STR(html, "</td>\n");

	push	0
	push	0
	push	6
	push	OFFSET FLAT:$SG70871
	mov	eax, DWORD PTR _html$[ebp]
	push	eax
	call	_dynbuf_add
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L70870
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29872], OFFSET FLAT:$SG70873
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 522		; 0000020aH
	jmp	SHORT $eva_err$70764
$L70870:
$eva_noerr$70874:

; 523  : 
; 524  : 	RETURN_OK_CLEANUP;

	push	0
	push	OFFSET FLAT:$SG70875
	push	OFFSET FLAT:$SG70876
	mov	eax, DWORD PTR _cntxt$[ebp]
	push	eax
	call	_err_clear
	add	esp, 16					; 00000010H
$eva_err$70764:
	mov	ecx, DWORD PTR _cntxt$[ebp]
	cmp	DWORD PTR [ecx+29872], 0
	je	SHORT $L70877
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	eax, DWORD PTR [edx+29900]
	push	eax
	push	OFFSET FLAT:$SG70878
	push	OFFSET FLAT:$SG70879
	mov	ecx, DWORD PTR _cntxt$[ebp]
	push	ecx
	call	_err_add_context
	add	esp, 16					; 00000010H
$L70877:
	mov	edx, DWORD PTR _tooltip$[ebp]
	push	edx
	call	_mem_free
	add	esp, 4
	mov	DWORD PTR _tooltip$[ebp], 0
	mov	eax, DWORD PTR _name$[ebp]
	push	eax
	call	_mem_free
	add	esp, 4
	mov	DWORD PTR _name$[ebp], 0
	mov	ecx, DWORD PTR _cntxt$[ebp]
	xor	eax, eax
	cmp	DWORD PTR [ecx+29872], 0
	setne	al
$L70748:

; 525  : }

	mov	esp, ebp
	pop	ebp
	ret	0
_table_add_updown_btns ENDP
_TEXT	ENDS
PUBLIC	_table_put_closesearch_btn
_DATA	SEGMENT
	ORG $+2
$SG70894 DB	'_eva_btn_opensel.gif', 00H
	ORG $+3
$SG70895 DB	'_eva_searchoff.gif', 00H
	ORG $+1
$SG70897 DB	'_eva_btn_opensel_s.gif', 00H
	ORG $+1
$SG70898 DB	'_eva_searchoff_s.gif', 00H
	ORG $+3
$SG70900 DB	'Cliquez pour voir les fiches s', 0e9H, 'lectionn', 0e9H, 'e'
	DB	's et masquer la recherche', 00H
	ORG $+1
$SG70901 DB	'Cliquez pour masquer la recherche et voir toutes les fic'
	DB	'hes', 00H
$SG70906 DB	'CLOSESEARCH', 00H
$SG70910 DB	'Fiches s', 0e9H, 'lectionn', 0e9H, 'es', 00H
	ORG $+3
$SG70911 DB	'D:\Travail\ABI\EVA\V4.0\CGI\Brunix-2016\table_utils.c', 00H
	ORG $+2
$SG70912 DB	'table_put_closesearch_btn', 00H
	ORG $+2
$SG70914 DB	'D:\Travail\ABI\EVA\V4.0\CGI\Brunix-2016\table_utils.c', 00H
	ORG $+2
$SG70915 DB	'table_put_closesearch_btn', 00H
_DATA	ENDS
_TEXT	SEGMENT
_cntxt$ = 8
_i_ctrl$ = 12
_form$ = -4
_ctrl$ = -28
_tbl$ = -12
_name$ = -24
_btn$ = -16
_btn1$ = -8
_help$ = -20
_table_put_closesearch_btn PROC NEAR

; 538  : ){

	push	ebp
	mov	ebp, esp
	sub	esp, 40					; 00000028H

; 539  : 	EVA_form *form = cntxt->form;

	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	ecx, DWORD PTR [eax+80]
	mov	DWORD PTR _form$[ebp], ecx

; 540  : 	EVA_ctrl *ctrl = form->ctrl + i_ctrl;

	mov	edx, DWORD PTR _i_ctrl$[ebp]
	imul	edx, 480				; 000001e0H
	mov	eax, DWORD PTR _form$[ebp]
	mov	ecx, DWORD PTR [eax]
	add	ecx, edx
	mov	DWORD PTR _ctrl$[ebp], ecx

; 541  : 	ObjTableFormat *tbl = ctrl->objtbl;

	mov	edx, DWORD PTR _ctrl$[ebp]
	mov	eax, DWORD PTR [edx+232]
	mov	DWORD PTR _tbl$[ebp], eax

; 542  : 	DynBuffer *name = NULL;

	mov	DWORD PTR _name$[ebp], 0

; 543  : 	char *btn = tbl->status & TblCtrl_sel ? "_eva_btn_opensel.gif" : "_eva_searchoff.gif";

	mov	ecx, DWORD PTR _tbl$[ebp]
	mov	edx, DWORD PTR [ecx+32]
	and	edx, 256				; 00000100H
	test	edx, edx
	je	SHORT $L73350
	mov	DWORD PTR -32+[ebp], OFFSET FLAT:$SG70894
	jmp	SHORT $L73351
$L73350:
	mov	DWORD PTR -32+[ebp], OFFSET FLAT:$SG70895
$L73351:
	mov	eax, DWORD PTR -32+[ebp]
	mov	DWORD PTR _btn$[ebp], eax

; 544  : 	char *btn1 = tbl->status & TblCtrl_sel ? "_eva_btn_opensel_s.gif" : "_eva_searchoff_s.gif";

	mov	ecx, DWORD PTR _tbl$[ebp]
	mov	edx, DWORD PTR [ecx+32]
	and	edx, 256				; 00000100H
	test	edx, edx
	je	SHORT $L73352
	mov	DWORD PTR -36+[ebp], OFFSET FLAT:$SG70897
	jmp	SHORT $L73353
$L73352:
	mov	DWORD PTR -36+[ebp], OFFSET FLAT:$SG70898
$L73353:
	mov	eax, DWORD PTR -36+[ebp]
	mov	DWORD PTR _btn1$[ebp], eax

; 545  : 	char *help = tbl->status & TblCtrl_sel ?
; 546  : 		"Cliquez pour voir les fiches sélectionnées et masquer la recherche" :
; 547  : 		"Cliquez pour masquer la recherche et voir toutes les fiches";

	mov	ecx, DWORD PTR _tbl$[ebp]
	mov	edx, DWORD PTR [ecx+32]
	and	edx, 256				; 00000100H
	test	edx, edx
	je	SHORT $L73354
	mov	DWORD PTR -40+[ebp], OFFSET FLAT:$SG70900
	jmp	SHORT $L73355
$L73354:
	mov	DWORD PTR -40+[ebp], OFFSET FLAT:$SG70901
$L73355:
	mov	eax, DWORD PTR -40+[ebp]
	mov	DWORD PTR _help$[ebp], eax

; 548  : 	if(cntxt->form->step == HtmlPrint) RETURN_OK;

	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	edx, DWORD PTR [ecx+80]
	cmp	DWORD PTR [edx+176], 7
	jne	SHORT $L70902
	jmp	SHORT $eva_noerr$70903
$L70902:

; 549  : 
; 550  : 	CTRL_CGINAMEBTN(&name, NULL, add_sz_str("CLOSESEARCH"));

	push	11					; 0000000bH
	push	OFFSET FLAT:$SG70906
	push	66					; 00000042H
	lea	eax, DWORD PTR _name$[ebp]
	push	eax
	push	1
	push	0
	mov	ecx, DWORD PTR _ctrl$[ebp]
	push	ecx
	mov	edx, DWORD PTR _cntxt$[ebp]
	push	edx
	call	_ctrl_cgi_name
	add	esp, 32					; 00000020H
	test	eax, eax
	je	SHORT $L70905
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 550		; 00000226H
	jmp	SHORT $eva_err$70907
$L70905:

; 551  : 	if(put_html_button(cntxt, name->data, "Fiches sélectionnées", btn, btn1, help, 0, 0)) STACK_ERROR;

	push	0
	push	0
	push	0
	push	0
	push	0
	mov	ecx, DWORD PTR _help$[ebp]
	push	ecx
	mov	edx, DWORD PTR _btn1$[ebp]
	push	edx
	mov	eax, DWORD PTR _btn$[ebp]
	push	eax
	push	OFFSET FLAT:$SG70910
	mov	ecx, DWORD PTR _name$[ebp]
	add	ecx, 8
	push	ecx
	mov	edx, DWORD PTR _cntxt$[ebp]
	push	edx
	call	_put_html_button_sz
	add	esp, 44					; 0000002cH
	test	eax, eax
	je	SHORT $eva_noerr$70903
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 551		; 00000227H
	jmp	SHORT $eva_err$70907
$eva_noerr$70903:

; 552  : 
; 553  : 	RETURN_OK_CLEANUP;

	push	0
	push	OFFSET FLAT:$SG70911
	push	OFFSET FLAT:$SG70912
	mov	ecx, DWORD PTR _cntxt$[ebp]
	push	ecx
	call	_err_clear
	add	esp, 16					; 00000010H
$eva_err$70907:
	mov	edx, DWORD PTR _cntxt$[ebp]
	cmp	DWORD PTR [edx+29872], 0
	je	SHORT $L70913
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	ecx, DWORD PTR [eax+29900]
	push	ecx
	push	OFFSET FLAT:$SG70914
	push	OFFSET FLAT:$SG70915
	mov	edx, DWORD PTR _cntxt$[ebp]
	push	edx
	call	_err_add_context
	add	esp, 16					; 00000010H
$L70913:
	mov	eax, DWORD PTR _name$[ebp]
	push	eax
	call	_mem_free
	add	esp, 4
	mov	DWORD PTR _name$[ebp], 0
	mov	ecx, DWORD PTR _cntxt$[ebp]
	xor	eax, eax
	cmp	DWORD PTR [ecx+29872], 0
	setne	al

; 554  : }

	mov	esp, ebp
	pop	ebp
	ret	0
_table_put_closesearch_btn ENDP
_TEXT	ENDS
PUBLIC	_table_put_opensearch_btn
_DATA	SEGMENT
	ORG $+2
$SG70935 DB	'OPENSEARCH', 00H
	ORG $+1
$SG70939 DB	'Cliquez pour chercher dans la liste des fiches', 00H
	ORG $+1
$SG70940 DB	'_eva_search_s.gif', 00H
	ORG $+2
$SG70941 DB	'_eva_search.gif', 00H
$SG70942 DB	'Chercher', 00H
	ORG $+3
$SG70943 DB	'D:\Travail\ABI\EVA\V4.0\CGI\Brunix-2016\table_utils.c', 00H
	ORG $+2
$SG70944 DB	'table_put_opensearch_btn', 00H
	ORG $+3
$SG70946 DB	'D:\Travail\ABI\EVA\V4.0\CGI\Brunix-2016\table_utils.c', 00H
	ORG $+2
$SG70947 DB	'table_put_opensearch_btn', 00H
_DATA	ENDS
_TEXT	SEGMENT
_cntxt$ = 8
_i_ctrl$ = 12
_tooltip$ = 16
_form$ = -4
_ctrl$ = -12
_name$ = -8
_table_put_opensearch_btn PROC NEAR

; 568  : ){

	push	ebp
	mov	ebp, esp
	sub	esp, 16					; 00000010H

; 569  : 	EVA_form *form = cntxt->form;

	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	ecx, DWORD PTR [eax+80]
	mov	DWORD PTR _form$[ebp], ecx

; 570  : 	EVA_ctrl *ctrl = form->ctrl + i_ctrl;

	mov	edx, DWORD PTR _i_ctrl$[ebp]
	imul	edx, 480				; 000001e0H
	mov	eax, DWORD PTR _form$[ebp]
	mov	ecx, DWORD PTR [eax]
	add	ecx, edx
	mov	DWORD PTR _ctrl$[ebp], ecx

; 571  : 	DynBuffer *name = NULL;

	mov	DWORD PTR _name$[ebp], 0

; 572  : 	if(cntxt->form->step == HtmlPrint) return 0;

	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	eax, DWORD PTR [edx+80]
	cmp	DWORD PTR [eax+176], 7
	jne	SHORT $L70930
	xor	eax, eax
	jmp	$L70925
$L70930:

; 573  : 
; 574  : 	if(ctrl->objtbl && !(ctrl->objtbl->status & TblCtrl_search)) RETURN_OK;

	mov	ecx, DWORD PTR _ctrl$[ebp]
	cmp	DWORD PTR [ecx+232], 0
	je	SHORT $L70931
	mov	edx, DWORD PTR _ctrl$[ebp]
	mov	eax, DWORD PTR [edx+232]
	mov	ecx, DWORD PTR [eax+32]
	and	ecx, 16					; 00000010H
	test	ecx, ecx
	jne	SHORT $L70931
	jmp	$eva_noerr$70932
$L70931:

; 575  : 	CTRL_CGINAMEBTN(&name, NULL, add_sz_str("OPENSEARCH"));

	push	10					; 0000000aH
	push	OFFSET FLAT:$SG70935
	push	66					; 00000042H
	lea	edx, DWORD PTR _name$[ebp]
	push	edx
	push	1
	push	0
	mov	eax, DWORD PTR _ctrl$[ebp]
	push	eax
	mov	ecx, DWORD PTR _cntxt$[ebp]
	push	ecx
	call	_ctrl_cgi_name
	add	esp, 32					; 00000020H
	test	eax, eax
	je	SHORT $L70934
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 575		; 0000023fH
	jmp	SHORT $eva_err$70936
$L70934:

; 576  : 	if(put_html_button(cntxt, name->data, "Chercher", "_eva_search.gif", "_eva_search_s.gif",
; 577  : 		tooltip ? tooltip : "Cliquez pour chercher dans la liste des fiches", 0, 0)) STACK_ERROR;

	cmp	DWORD PTR _tooltip$[ebp], 0
	je	SHORT $L73357
	mov	eax, DWORD PTR _tooltip$[ebp]
	mov	DWORD PTR -16+[ebp], eax
	jmp	SHORT $L73358
$L73357:
	mov	DWORD PTR -16+[ebp], OFFSET FLAT:$SG70939
$L73358:
	push	0
	push	0
	push	0
	push	0
	push	0
	mov	ecx, DWORD PTR -16+[ebp]
	push	ecx
	push	OFFSET FLAT:$SG70940
	push	OFFSET FLAT:$SG70941
	push	OFFSET FLAT:$SG70942
	mov	edx, DWORD PTR _name$[ebp]
	add	edx, 8
	push	edx
	mov	eax, DWORD PTR _cntxt$[ebp]
	push	eax
	call	_put_html_button_sz
	add	esp, 44					; 0000002cH
	test	eax, eax
	je	SHORT $eva_noerr$70932
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 577		; 00000241H
	jmp	SHORT $eva_err$70936
$eva_noerr$70932:

; 578  : 
; 579  : 	RETURN_OK_CLEANUP;

	push	0
	push	OFFSET FLAT:$SG70943
	push	OFFSET FLAT:$SG70944
	mov	edx, DWORD PTR _cntxt$[ebp]
	push	edx
	call	_err_clear
	add	esp, 16					; 00000010H
$eva_err$70936:
	mov	eax, DWORD PTR _cntxt$[ebp]
	cmp	DWORD PTR [eax+29872], 0
	je	SHORT $L70945
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	edx, DWORD PTR [ecx+29900]
	push	edx
	push	OFFSET FLAT:$SG70946
	push	OFFSET FLAT:$SG70947
	mov	eax, DWORD PTR _cntxt$[ebp]
	push	eax
	call	_err_add_context
	add	esp, 16					; 00000010H
$L70945:
	mov	ecx, DWORD PTR _name$[ebp]
	push	ecx
	call	_mem_free
	add	esp, 4
	mov	DWORD PTR _name$[ebp], 0
	mov	edx, DWORD PTR _cntxt$[ebp]
	xor	eax, eax
	cmp	DWORD PTR [edx+29872], 0
	setne	al
$L70925:

; 580  : }

	mov	esp, ebp
	pop	ebp
	ret	0
_table_put_opensearch_btn ENDP
_TEXT	ENDS
PUBLIC	_table_put_export_btn
EXTRN	_dyntab_field_val:NEAR
_DATA	SEGMENT
	ORG $+3
$SG70963 DB	'_EVA_EXPORTLIST', 00H
$SG70974 DB	'<td align=right>', 00H
	ORG $+3
$SG70976 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70980 DB	'EXPORT_EXCEL', 00H
	ORG $+3
$SG70983 DB	'Cliquez pour obtenir la liste des fiches au format Excel'
	DB	00H
	ORG $+3
$SG70984 DB	'_eva_excel_icon_small_s.gif', 00H
$SG70985 DB	'_eva_excel_icon_small.gif', 00H
	ORG $+2
$SG70986 DB	'Exporter', 00H
	ORG $+3
$SG70989 DB	'EXPORT_WORD', 00H
$SG70992 DB	'Cliquez pour obtenir la liste des fiches au format Word', 00H
$SG70993 DB	'_eva_word_icon_small_s.gif', 00H
	ORG $+1
$SG70994 DB	'_eva_word_icon_small.gif', 00H
	ORG $+3
$SG70995 DB	'Exporter', 00H
	ORG $+3
$SG70998 DB	'</td>', 00H
	ORG $+2
$SG71000 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG71001 DB	'D:\Travail\ABI\EVA\V4.0\CGI\Brunix-2016\table_utils.c', 00H
	ORG $+2
$SG71002 DB	'table_put_export_btn', 00H
	ORG $+3
$SG71004 DB	'D:\Travail\ABI\EVA\V4.0\CGI\Brunix-2016\table_utils.c', 00H
	ORG $+2
$SG71005 DB	'table_put_export_btn', 00H
_DATA	ENDS
_TEXT	SEGMENT
_cntxt$ = 8
_i_ctrl$ = 12
_form$ = -4
_ctrl$ = -24
_tbl$ = -12
_name$ = -20
_b_export$ = -16
_html$ = -8
_table_put_export_btn PROC NEAR

; 593  : ){

	push	ebp
	mov	ebp, esp
	sub	esp, 32					; 00000020H

; 594  : 	EVA_form *form = cntxt->form;

	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	ecx, DWORD PTR [eax+80]
	mov	DWORD PTR _form$[ebp], ecx

; 595  : 	EVA_ctrl *ctrl = form->ctrl + i_ctrl;

	mov	edx, DWORD PTR _i_ctrl$[ebp]
	imul	edx, 480				; 000001e0H
	mov	eax, DWORD PTR _form$[ebp]
	mov	ecx, DWORD PTR [eax]
	add	ecx, edx
	mov	DWORD PTR _ctrl$[ebp], ecx

; 596  : 	ObjTableFormat *tbl = ctrl->objtbl;

	mov	edx, DWORD PTR _ctrl$[ebp]
	mov	eax, DWORD PTR [edx+232]
	mov	DWORD PTR _tbl$[ebp], eax

; 597  : 	DynBuffer *name = NULL;

	mov	DWORD PTR _name$[ebp], 0

; 598  : 	char *b_export = DYNTAB_FIELD_VAL(tbl->attr, EXPORTLIST);

	push	0
	push	-1
	push	OFFSET FLAT:$SG70963
	mov	ecx, DWORD PTR _tbl$[ebp]
	mov	edx, DWORD PTR [ecx]
	push	edx
	call	_dyntab_field_val
	add	esp, 16					; 00000010H
	mov	DWORD PTR _b_export$[ebp], eax

; 599  : 	CHECK_HTML_STATUS;

	cmp	DWORD PTR _cntxt$[ebp], 0
	je	SHORT $L73362
	mov	eax, DWORD PTR _cntxt$[ebp]
	cmp	DWORD PTR [eax+80], 0
	je	SHORT $L73360
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	edx, DWORD PTR [ecx+80]
	mov	eax, DWORD PTR [edx+232]
	mov	DWORD PTR -28+[ebp], eax
	jmp	SHORT $L73361
$L73360:
	mov	DWORD PTR -28+[ebp], 0
$L73361:
	mov	ecx, DWORD PTR -28+[ebp]
	mov	DWORD PTR -32+[ebp], ecx
	jmp	SHORT $L73363
$L73362:
	mov	DWORD PTR -32+[ebp], 0
$L73363:
	mov	edx, DWORD PTR -32+[ebp]
	mov	DWORD PTR _html$[ebp], edx
	cmp	DWORD PTR _html$[ebp], 0
	jne	SHORT $L70967
	xor	eax, eax
	jmp	$L70956
$L70967:

; 600  : 
; 601  : 	/* If export available */
; 602  : 	if(cntxt->form->step == HtmlPrint || !(tbl && tbl->attr && *b_export && *b_export != '0')) RETURN_OK;

	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	ecx, DWORD PTR [eax+80]
	cmp	DWORD PTR [ecx+176], 7
	je	SHORT $L70970
	cmp	DWORD PTR _tbl$[ebp], 0
	je	SHORT $L70970
	mov	edx, DWORD PTR _tbl$[ebp]
	cmp	DWORD PTR [edx], 0
	je	SHORT $L70970
	mov	eax, DWORD PTR _b_export$[ebp]
	movsx	ecx, BYTE PTR [eax]
	test	ecx, ecx
	je	SHORT $L70970
	mov	edx, DWORD PTR _b_export$[ebp]
	movsx	eax, BYTE PTR [edx]
	cmp	eax, 48					; 00000030H
	jne	SHORT $L70968
$L70970:
	jmp	$eva_noerr$70971
$L70968:

; 603  : 
; 604  : 	/* Output export buttons */
; 605  : 	DYNBUF_ADD_STR(html, "<td align=right>");

	push	0
	push	0
	push	16					; 00000010H
	push	OFFSET FLAT:$SG70974
	mov	ecx, DWORD PTR _html$[ebp]
	push	ecx
	call	_dynbuf_add
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L70973
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29872], OFFSET FLAT:$SG70976
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 605		; 0000025dH
	jmp	$eva_err$70977
$L70973:

; 606  : 	CTRL_CGINAMEBTN(&name, NULL, add_sz_str("EXPORT_EXCEL"));

	push	12					; 0000000cH
	push	OFFSET FLAT:$SG70980
	push	66					; 00000042H
	lea	ecx, DWORD PTR _name$[ebp]
	push	ecx
	push	1
	push	0
	mov	edx, DWORD PTR _ctrl$[ebp]
	push	edx
	mov	eax, DWORD PTR _cntxt$[ebp]
	push	eax
	call	_ctrl_cgi_name
	add	esp, 32					; 00000020H
	test	eax, eax
	je	SHORT $L70979
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 606		; 0000025eH
	jmp	$eva_err$70977
$L70979:

; 607  : 	if(put_html_button(cntxt, name->data, "Exporter", "_eva_excel_icon_small.gif", "_eva_excel_icon_small_s.gif",
; 608  : 		"Cliquez pour obtenir la liste des fiches au format Excel", 0, 0)) STACK_ERROR;

	push	0
	push	0
	push	0
	push	0
	push	0
	push	OFFSET FLAT:$SG70983
	push	OFFSET FLAT:$SG70984
	push	OFFSET FLAT:$SG70985
	push	OFFSET FLAT:$SG70986
	mov	edx, DWORD PTR _name$[ebp]
	add	edx, 8
	push	edx
	mov	eax, DWORD PTR _cntxt$[ebp]
	push	eax
	call	_put_html_button_sz
	add	esp, 44					; 0000002cH
	test	eax, eax
	je	SHORT $L70982
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 608		; 00000260H
	jmp	$eva_err$70977
$L70982:

; 609  : 	CTRL_CGINAMEBTN(&name, NULL, add_sz_str("EXPORT_WORD"));

	push	11					; 0000000bH
	push	OFFSET FLAT:$SG70989
	push	66					; 00000042H
	lea	edx, DWORD PTR _name$[ebp]
	push	edx
	push	1
	push	0
	mov	eax, DWORD PTR _ctrl$[ebp]
	push	eax
	mov	ecx, DWORD PTR _cntxt$[ebp]
	push	ecx
	call	_ctrl_cgi_name
	add	esp, 32					; 00000020H
	test	eax, eax
	je	SHORT $L70988
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 609		; 00000261H
	jmp	$eva_err$70977
$L70988:

; 610  : 	if(put_html_button(cntxt, name->data, "Exporter", "_eva_word_icon_small.gif", "_eva_word_icon_small_s.gif",
; 611  : 		"Cliquez pour obtenir la liste des fiches au format Word", 0, 0)) STACK_ERROR;

	push	0
	push	0
	push	0
	push	0
	push	0
	push	OFFSET FLAT:$SG70992
	push	OFFSET FLAT:$SG70993
	push	OFFSET FLAT:$SG70994
	push	OFFSET FLAT:$SG70995
	mov	eax, DWORD PTR _name$[ebp]
	add	eax, 8
	push	eax
	mov	ecx, DWORD PTR _cntxt$[ebp]
	push	ecx
	call	_put_html_button_sz
	add	esp, 44					; 0000002cH
	test	eax, eax
	je	SHORT $L70991
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 611		; 00000263H
	jmp	SHORT $eva_err$70977
$L70991:

; 612  : 	DYNBUF_ADD_STR(html, "</td>");

	push	0
	push	0
	push	5
	push	OFFSET FLAT:$SG70998
	mov	eax, DWORD PTR _html$[ebp]
	push	eax
	call	_dynbuf_add
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L70997
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29872], OFFSET FLAT:$SG71000
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 612		; 00000264H
	jmp	SHORT $eva_err$70977
$L70997:
$eva_noerr$70971:

; 613  : 
; 614  : 	/* Output print mode button
; 615  : 	DYNBUF_ADD_STR(html, "<td align=right>");
; 616  : 	CTRL_CGINAMEBTN(&name, NULL, add_sz_str("PRINT"));
; 617  : 	if(tbl->status & TblCtrl_printmode ?
; 618  : 		put_html_button(cntxt, name->data, NULL, "_eva_print_s.gif", "_eva_print.gif",
; 619  : 			"Mode impression en cours\n\nCliquez pour afficher la liste en mode normal", 0, 0) :
; 620  : 		put_html_button(cntxt, name->data, NULL, "_eva_print.gif", "_eva_print_s.gif",
; 621  : 			"Mode impression\n\nCliquez pour copier / coller directement la liste depuis la page", 0, 0)) STACK_ERROR;
; 622  : 	DYNBUF_ADD_STR(html, "</td>"); */
; 623  : 
; 624  : 	RETURN_OK_CLEANUP;

	push	0
	push	OFFSET FLAT:$SG71001
	push	OFFSET FLAT:$SG71002
	mov	eax, DWORD PTR _cntxt$[ebp]
	push	eax
	call	_err_clear
	add	esp, 16					; 00000010H
$eva_err$70977:
	mov	ecx, DWORD PTR _cntxt$[ebp]
	cmp	DWORD PTR [ecx+29872], 0
	je	SHORT $L71003
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	eax, DWORD PTR [edx+29900]
	push	eax
	push	OFFSET FLAT:$SG71004
	push	OFFSET FLAT:$SG71005
	mov	ecx, DWORD PTR _cntxt$[ebp]
	push	ecx
	call	_err_add_context
	add	esp, 16					; 00000010H
$L71003:
	mov	edx, DWORD PTR _name$[ebp]
	push	edx
	call	_mem_free
	add	esp, 4
	mov	DWORD PTR _name$[ebp], 0
	mov	eax, DWORD PTR _cntxt$[ebp]
	xor	ecx, ecx
	cmp	DWORD PTR [eax+29872], 0
	setne	cl
	mov	eax, ecx
$L70956:

; 625  : }

	mov	esp, ebp
	pop	ebp
	ret	0
_table_put_export_btn ENDP
_TEXT	ENDS
PUBLIC	_table_put_clear_btn
_DATA	SEGMENT
	ORG $+3
$SG71021 DB	'CLEAR', 00H
	ORG $+2
$SG71025 DB	'Efface les valeurs de cette relation', 00H
	ORG $+3
$SG71026 DB	'_eva_cancel_s.gif', 00H
	ORG $+2
$SG71027 DB	'_eva_cancel.gif', 00H
$SG71028 DB	'Effacer', 00H
$SG71029 DB	'D:\Travail\ABI\EVA\V4.0\CGI\Brunix-2016\table_utils.c', 00H
	ORG $+2
$SG71030 DB	'table_put_clear_btn', 00H
$SG71032 DB	'D:\Travail\ABI\EVA\V4.0\CGI\Brunix-2016\table_utils.c', 00H
	ORG $+2
$SG71033 DB	'table_put_clear_btn', 00H
_DATA	ENDS
_TEXT	SEGMENT
_cntxt$ = 8
_i_ctrl$ = 12
_form$ = -4
_ctrl$ = -12
_name$ = -8
_table_put_clear_btn PROC NEAR

; 638  : ){

	push	ebp
	mov	ebp, esp
	sub	esp, 12					; 0000000cH

; 639  : 	EVA_form *form = cntxt->form;

	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	ecx, DWORD PTR [eax+80]
	mov	DWORD PTR _form$[ebp], ecx

; 640  : 	EVA_ctrl *ctrl = form->ctrl + i_ctrl;

	mov	edx, DWORD PTR _i_ctrl$[ebp]
	imul	edx, 480				; 000001e0H
	mov	eax, DWORD PTR _form$[ebp]
	mov	ecx, DWORD PTR [eax]
	add	ecx, edx
	mov	DWORD PTR _ctrl$[ebp], ecx

; 641  : 	DynBuffer *name = NULL;

	mov	DWORD PTR _name$[ebp], 0

; 642  : 	if(!ctrl->val.nbrows) RETURN_OK;

	mov	edx, DWORD PTR _ctrl$[ebp]
	cmp	DWORD PTR [edx+64], 0
	jne	SHORT $L71018
	jmp	$eva_noerr$71019
$L71018:

; 643  : 	CTRL_CGINAMEBTN(&name, dyntab_cell(&ctrl->val, 0, 0), add_sz_str("CLEAR"));

	push	5
	push	OFFSET FLAT:$SG71021
	push	66					; 00000042H
	lea	eax, DWORD PTR _name$[ebp]
	push	eax
	push	1
	push	0
	push	0
	mov	ecx, DWORD PTR _ctrl$[ebp]
	add	ecx, 64					; 00000040H
	push	ecx
	call	_dyntab_cell
	add	esp, 12					; 0000000cH
	push	eax
	mov	edx, DWORD PTR _ctrl$[ebp]
	push	edx
	mov	eax, DWORD PTR _cntxt$[ebp]
	push	eax
	call	_ctrl_cgi_name
	add	esp, 32					; 00000020H
	test	eax, eax
	je	SHORT $L71020
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 643		; 00000283H
	jmp	SHORT $eva_err$71022
$L71020:

; 644  : 	if(put_html_button(cntxt, name->data,
; 645  : 		"Effacer", "_eva_cancel.gif", "_eva_cancel_s.gif",
; 646  : 		"Efface les valeurs de cette relation", 0, 0)) STACK_ERROR;

	push	0
	push	0
	push	0
	push	0
	push	0
	push	OFFSET FLAT:$SG71025
	push	OFFSET FLAT:$SG71026
	push	OFFSET FLAT:$SG71027
	push	OFFSET FLAT:$SG71028
	mov	edx, DWORD PTR _name$[ebp]
	add	edx, 8
	push	edx
	mov	eax, DWORD PTR _cntxt$[ebp]
	push	eax
	call	_put_html_button_sz
	add	esp, 44					; 0000002cH
	test	eax, eax
	je	SHORT $eva_noerr$71019
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 646		; 00000286H
	jmp	SHORT $eva_err$71022
$eva_noerr$71019:

; 647  : 
; 648  : 	RETURN_OK_CLEANUP;

	push	0
	push	OFFSET FLAT:$SG71029
	push	OFFSET FLAT:$SG71030
	mov	edx, DWORD PTR _cntxt$[ebp]
	push	edx
	call	_err_clear
	add	esp, 16					; 00000010H
$eva_err$71022:
	mov	eax, DWORD PTR _cntxt$[ebp]
	cmp	DWORD PTR [eax+29872], 0
	je	SHORT $L71031
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	edx, DWORD PTR [ecx+29900]
	push	edx
	push	OFFSET FLAT:$SG71032
	push	OFFSET FLAT:$SG71033
	mov	eax, DWORD PTR _cntxt$[ebp]
	push	eax
	call	_err_add_context
	add	esp, 16					; 00000010H
$L71031:
	mov	ecx, DWORD PTR _name$[ebp]
	push	ecx
	call	_mem_free
	add	esp, 4
	mov	DWORD PTR _name$[ebp], 0
	mov	edx, DWORD PTR _cntxt$[ebp]
	xor	eax, eax
	cmp	DWORD PTR [edx+29872], 0
	setne	al

; 649  : }

	mov	esp, ebp
	pop	ebp
	ret	0
_table_put_clear_btn ENDP
_TEXT	ENDS
PUBLIC	_table_put_addnew_btn
EXTRN	_strpbrk:NEAR
_BSS	SEGMENT
	ALIGN	4

$SG71061 DB	01H DUP (?)
_BSS	ENDS
_DATA	SEGMENT
$SG71060 DB	'_EVA_TABLEINSERT', 00H
	ORG $+3
$SG71064 DB	'_EVA_LIST_CREATE_FORM', 00H
	ORG $+2
$SG71068 DB	'.-()[] ,', 00H
	ORG $+3
$SG71070 DB	'1', 00H
	ORG $+2
$SG71073 DB	'0', 00H
	ORG $+2
$SG71077 DB	'_EVA_BASE_FORMS', 00H
$SG71082 DB	'No', 00H
	ORG $+1
$SG71087 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG71092 DB	'OPENADDNEW', 00H
	ORG $+1
$SG71095 DB	'Cliquez pour ajouter une nouvelle fiche ', 0e0H, ' la li'
	DB	'ste', 00H
	ORG $+1
$SG71096 DB	'_eva_plus_s.gif', 00H
$SG71097 DB	'_eva_plus.gif', 00H
	ORG $+2
$SG71098 DB	'Ajouter', 00H
$SG71101 DB	',0', 00H
	ORG $+1
$SG71102 DB	'OPENOBJ=0,', 00H
	ORG $+1
$SG71104 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG71109 DB	'Ouvre une nouvelle fiche ', 0e0H, ' ajouter ', 0e0H, ' l'
	DB	'a liste', 00H
	ORG $+2
$SG71110 DB	'_eva_plus_s.gif', 00H
$SG71111 DB	'_eva_plus.gif', 00H
	ORG $+2
$SG71112 DB	'Nouvelle fiche', 00H
	ORG $+1
$SG71116 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG71117 DB	'D:\Travail\ABI\EVA\V4.0\CGI\Brunix-2016\table_utils.c', 00H
	ORG $+2
$SG71118 DB	'table_put_addnew_btn', 00H
	ORG $+3
$SG71120 DB	'D:\Travail\ABI\EVA\V4.0\CGI\Brunix-2016\table_utils.c', 00H
	ORG $+2
$SG71121 DB	'table_put_addnew_btn', 00H
_DATA	ENDS
_TEXT	SEGMENT
_cntxt$ = 8
_i_ctrl$ = 12
_bef$ = 16
_bef_sz$ = 20
_aft$ = 24
_aft_sz$ = 28
_mode$ = 32
_form$ = -12
_ctrl$ = -40
_tbl$ = -20
_name$ = -36
_val$ = -8
_insert$ = -28
_id_form$ = -4
_field$ = -16
_b_oper$ = -24
_b_direct$ = -32
_table_put_addnew_btn PROC NEAR

; 666  : ){

	push	ebp
	mov	ebp, esp
	sub	esp, 52					; 00000034H

; 667  : 	EVA_form *form = cntxt->form;

	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	ecx, DWORD PTR [eax+80]
	mov	DWORD PTR _form$[ebp], ecx

; 668  : 	EVA_ctrl *ctrl = form->ctrl + i_ctrl;

	mov	edx, DWORD PTR _i_ctrl$[ebp]
	imul	edx, 480				; 000001e0H
	mov	eax, DWORD PTR _form$[ebp]
	mov	ecx, DWORD PTR [eax]
	add	ecx, edx
	mov	DWORD PTR _ctrl$[ebp], ecx

; 669  : 	ObjTableFormat *tbl = ctrl->objtbl;

	mov	edx, DWORD PTR _ctrl$[ebp]
	mov	eax, DWORD PTR [edx+232]
	mov	DWORD PTR _tbl$[ebp], eax

; 670  : 	DynBuffer *name = NULL;

	mov	DWORD PTR _name$[ebp], 0

; 671  : 	DynBuffer *val = NULL;

	mov	DWORD PTR _val$[ebp], 0

; 672  : 	char *insert = CTRL_ATTR_VAL(TABLEINSERT);

	cmp	DWORD PTR _ctrl$[ebp], 0
	je	SHORT $L73366
	push	0
	push	-1
	push	OFFSET FLAT:$SG71060
	mov	ecx, DWORD PTR _ctrl$[ebp]
	add	ecx, 44					; 0000002cH
	push	ecx
	call	_dyntab_field_val
	add	esp, 16					; 00000010H
	mov	DWORD PTR -44+[ebp], eax
	jmp	SHORT $L73367
$L73366:
	mov	DWORD PTR -44+[ebp], OFFSET FLAT:$SG71061
$L73367:
	mov	edx, DWORD PTR -44+[ebp]
	mov	DWORD PTR _insert$[ebp], edx

; 673  : 	unsigned long id_form = strtoul(DYNTAB_FIELD_VAL(tbl->attr, LIST_CREATE_FORM), NULL, 10);

	push	10					; 0000000aH
	push	0
	push	0
	push	-1
	push	OFFSET FLAT:$SG71064
	mov	eax, DWORD PTR _tbl$[ebp]
	mov	ecx, DWORD PTR [eax]
	push	ecx
	call	_dyntab_field_val
	add	esp, 16					; 00000010H
	push	eax
	call	_strtoul
	add	esp, 12					; 0000000cH
	mov	DWORD PTR _id_form$[ebp], eax

; 674  : 	char *field = dyntab_val(&tbl->field, 0, 0);

	push	0
	push	0
	mov	edx, DWORD PTR _tbl$[ebp]
	add	edx, 380				; 0000017cH
	push	edx
	call	_dyntab_val
	add	esp, 12					; 0000000cH
	mov	DWORD PTR _field$[ebp], eax

; 675  : 	int b_oper = strpbrk(field, ".-()[] ,") != NULL;

	push	OFFSET FLAT:$SG71068
	mov	eax, DWORD PTR _field$[ebp]
	push	eax
	call	_strpbrk
	add	esp, 8
	neg	eax
	sbb	eax, eax
	neg	eax
	mov	DWORD PTR _b_oper$[ebp], eax

; 676  : 	int b_direct = !strcmp(insert, "1");

	push	OFFSET FLAT:$SG71070
	mov	ecx, DWORD PTR _insert$[ebp]
	push	ecx
	call	_strcmp
	add	esp, 8
	neg	eax
	sbb	eax, eax
	inc	eax
	mov	DWORD PTR _b_direct$[ebp], eax

; 677  : 
; 678  : 	/* Return if no insert button */
; 679  : 	if(!*insert || !strcmp(insert, "0") || form->step == HtmlPrint) RETURN_OK;

	mov	edx, DWORD PTR _insert$[ebp]
	movsx	eax, BYTE PTR [edx]
	test	eax, eax
	je	SHORT $L71072
	push	OFFSET FLAT:$SG71073
	mov	ecx, DWORD PTR _insert$[ebp]
	push	ecx
	call	_strcmp
	add	esp, 8
	test	eax, eax
	je	SHORT $L71072
	mov	edx, DWORD PTR _form$[ebp]
	cmp	DWORD PTR [edx+176], 7
	jne	SHORT $L71071
$L71072:
	jmp	$eva_noerr$71074
$L71071:

; 680  : 
; 681  : 	/* Return if insert button not applicable */
; 682  : 	if(!id_form) id_form = strtoul(DYNTAB_FIELD_VAL(tbl->attr, BASE_FORMS), NULL, 10);

	cmp	DWORD PTR _id_form$[ebp], 0
	jne	SHORT $L71075
	push	10					; 0000000aH
	push	0
	push	0
	push	-1
	push	OFFSET FLAT:$SG71077
	mov	eax, DWORD PTR _tbl$[ebp]
	mov	ecx, DWORD PTR [eax]
	push	ecx
	call	_dyntab_field_val
	add	esp, 16					; 00000010H
	push	eax
	call	_strtoul
	add	esp, 12					; 0000000cH
	mov	DWORD PTR _id_form$[ebp], eax
$L71075:

; 683  : 	if((tbl->status & TblCtrl_sel && (form->step != HtmlEdit || !(ctrl->access & AccessEdit))) ||
; 684  : 			(ctrl->val.nbrows && (!ctrl->MULTIPLE[0] || !strcmp("No", ctrl->MULTIPLE))) ||
; 685  : 			!id_form || (b_direct && (!*field || b_oper))) RETURN_OK;

	mov	edx, DWORD PTR _tbl$[ebp]
	mov	eax, DWORD PTR [edx+32]
	and	eax, 256				; 00000100H
	test	eax, eax
	je	SHORT $L71080
	mov	ecx, DWORD PTR _form$[ebp]
	cmp	DWORD PTR [ecx+176], 4
	jne	SHORT $L71083
	mov	edx, DWORD PTR _ctrl$[ebp]
	mov	eax, DWORD PTR [edx+184]
	and	eax, 2
	test	eax, eax
	je	SHORT $L71083
$L71080:
	mov	ecx, DWORD PTR _ctrl$[ebp]
	cmp	DWORD PTR [ecx+64], 0
	je	SHORT $L71081
	mov	edx, DWORD PTR _ctrl$[ebp]
	mov	eax, DWORD PTR [edx+344]
	movsx	ecx, BYTE PTR [eax]
	test	ecx, ecx
	je	SHORT $L71083
	mov	edx, DWORD PTR _ctrl$[ebp]
	mov	eax, DWORD PTR [edx+344]
	push	eax
	push	OFFSET FLAT:$SG71082
	call	_strcmp
	add	esp, 8
	test	eax, eax
	je	SHORT $L71083
$L71081:
	cmp	DWORD PTR _id_form$[ebp], 0
	je	SHORT $L71083
	cmp	DWORD PTR _b_direct$[ebp], 0
	je	SHORT $L71078
	mov	ecx, DWORD PTR _field$[ebp]
	movsx	edx, BYTE PTR [ecx]
	test	edx, edx
	je	SHORT $L71083
	cmp	DWORD PTR _b_oper$[ebp], 0
	je	SHORT $L71078
$L71083:
	jmp	$eva_noerr$71074
$L71078:

; 686  : 
; 687  : 	/* Output separator */
; 688  : 	DYNBUF_ADD(form->html, bef, bef_sz, NO_CONV);

	push	0
	push	0
	mov	eax, DWORD PTR _bef_sz$[ebp]
	push	eax
	mov	ecx, DWORD PTR _bef$[ebp]
	push	ecx
	mov	edx, DWORD PTR _form$[ebp]
	mov	eax, DWORD PTR [edx+232]
	push	eax
	call	_dynbuf_add
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L71085
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29872], OFFSET FLAT:$SG71087
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 688		; 000002b0H
	jmp	$eva_err$71088
$L71085:

; 689  : 
; 690  : 	if(b_direct && !mode)

	cmp	DWORD PTR _b_direct$[ebp], 0
	je	$L71089
	cmp	DWORD PTR _mode$[ebp], 0
	jne	$L71089

; 692  : 		/* Insert from table : add OPENADDNEW button */
; 693  : 		CTRL_CGINAMEBTN(&name, NULL, add_sz_str("OPENADDNEW"));

	push	10					; 0000000aH
	push	OFFSET FLAT:$SG71092
	push	66					; 00000042H
	lea	eax, DWORD PTR _name$[ebp]
	push	eax
	push	1
	push	0
	mov	ecx, DWORD PTR _ctrl$[ebp]
	push	ecx
	mov	edx, DWORD PTR _cntxt$[ebp]
	push	edx
	call	_ctrl_cgi_name
	add	esp, 32					; 00000020H
	test	eax, eax
	je	SHORT $L71091
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 693		; 000002b5H
	jmp	$eva_err$71088
$L71091:

; 694  : 		if(put_html_button(cntxt, name->data, "Ajouter", "_eva_plus.gif", "_eva_plus_s.gif",
; 695  : 						"Cliquez pour ajouter une nouvelle fiche à la liste", 0, 0)) STACK_ERROR;

	push	0
	push	0
	push	0
	push	0
	push	0
	push	OFFSET FLAT:$SG71095
	push	OFFSET FLAT:$SG71096
	push	OFFSET FLAT:$SG71097
	push	OFFSET FLAT:$SG71098
	mov	ecx, DWORD PTR _name$[ebp]
	add	ecx, 8
	push	ecx
	mov	edx, DWORD PTR _cntxt$[ebp]
	push	edx
	call	_put_html_button_sz
	add	esp, 44					; 0000002cH
	test	eax, eax
	je	SHORT $L71094
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 695		; 000002b7H
	jmp	$eva_err$71088
$L71094:

; 697  : 	else

	jmp	$L71108
$L71089:

; 699  : 		/* Insert with new form : add OPENOBJ button */
; 700  : 		DYNBUF_ADD3_INT(&val, "OPENOBJ=0,", id_form, ",0");

	push	2
	push	OFFSET FLAT:$SG71101
	mov	ecx, DWORD PTR _id_form$[ebp]
	push	ecx
	push	10					; 0000000aH
	push	OFFSET FLAT:$SG71102
	lea	edx, DWORD PTR _val$[ebp]
	push	edx
	call	_dynbuf_add3_int
	add	esp, 24					; 00000018H
	test	eax, eax
	je	SHORT $L71100
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29872], OFFSET FLAT:$SG71104
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 700		; 000002bcH
	jmp	$eva_err$71088
$L71100:

; 701  : 		CTRL_CGINAMEBTN(&name, dyntab_cell(&ctrl->val, 0, 0), DYNBUF_VAL_SZ(val));

	cmp	DWORD PTR _val$[ebp], 0
	je	SHORT $L73368
	mov	edx, DWORD PTR _val$[ebp]
	mov	eax, DWORD PTR [edx+4]
	mov	DWORD PTR -48+[ebp], eax
	jmp	SHORT $L73369
$L73368:
	mov	DWORD PTR -48+[ebp], 0
$L73369:
	cmp	DWORD PTR _val$[ebp], 0
	je	SHORT $L73370
	mov	ecx, DWORD PTR _val$[ebp]
	add	ecx, 8
	mov	DWORD PTR -52+[ebp], ecx
	jmp	SHORT $L73371
$L73370:
	mov	DWORD PTR -52+[ebp], 0
$L73371:
	mov	edx, DWORD PTR -48+[ebp]
	push	edx
	mov	eax, DWORD PTR -52+[ebp]
	push	eax
	push	66					; 00000042H
	lea	ecx, DWORD PTR _name$[ebp]
	push	ecx
	push	1
	push	0
	push	0
	mov	edx, DWORD PTR _ctrl$[ebp]
	add	edx, 64					; 00000040H
	push	edx
	call	_dyntab_cell
	add	esp, 12					; 0000000cH
	push	eax
	mov	eax, DWORD PTR _ctrl$[ebp]
	push	eax
	mov	ecx, DWORD PTR _cntxt$[ebp]
	push	ecx
	call	_ctrl_cgi_name
	add	esp, 32					; 00000020H
	test	eax, eax
	je	SHORT $L71106
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 701		; 000002bdH
	jmp	$eva_err$71088
$L71106:

; 702  : 		if(put_html_button(cntxt, name->data, "Nouvelle fiche", "_eva_plus.gif", "_eva_plus_s.gif",
; 703  : 						"Ouvre une nouvelle fiche à ajouter à la liste", 0, mode)) STACK_ERROR;

	mov	eax, DWORD PTR _mode$[ebp]
	push	eax
	push	0
	push	0
	push	0
	push	0
	push	OFFSET FLAT:$SG71109
	push	OFFSET FLAT:$SG71110
	push	OFFSET FLAT:$SG71111
	push	OFFSET FLAT:$SG71112
	mov	ecx, DWORD PTR _name$[ebp]
	add	ecx, 8
	push	ecx
	mov	edx, DWORD PTR _cntxt$[ebp]
	push	edx
	call	_put_html_button_sz
	add	esp, 44					; 0000002cH
	test	eax, eax
	je	SHORT $L71108
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 703		; 000002bfH
	jmp	SHORT $eva_err$71088
$L71108:

; 705  : 
; 706  : 	/* Output separator */
; 707  : 	DYNBUF_ADD(form->html, aft, aft_sz, NO_CONV);

	push	0
	push	0
	mov	ecx, DWORD PTR _aft_sz$[ebp]
	push	ecx
	mov	edx, DWORD PTR _aft$[ebp]
	push	edx
	mov	eax, DWORD PTR _form$[ebp]
	mov	ecx, DWORD PTR [eax+232]
	push	ecx
	call	_dynbuf_add
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L71114
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29872], OFFSET FLAT:$SG71116
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 707		; 000002c3H
	jmp	SHORT $eva_err$71088
$L71114:
$eva_noerr$71074:

; 708  : 
; 709  : 	RETURN_OK_CLEANUP;

	push	0
	push	OFFSET FLAT:$SG71117
	push	OFFSET FLAT:$SG71118
	mov	ecx, DWORD PTR _cntxt$[ebp]
	push	ecx
	call	_err_clear
	add	esp, 16					; 00000010H
$eva_err$71088:
	mov	edx, DWORD PTR _cntxt$[ebp]
	cmp	DWORD PTR [edx+29872], 0
	je	SHORT $L71119
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	ecx, DWORD PTR [eax+29900]
	push	ecx
	push	OFFSET FLAT:$SG71120
	push	OFFSET FLAT:$SG71121
	mov	edx, DWORD PTR _cntxt$[ebp]
	push	edx
	call	_err_add_context
	add	esp, 16					; 00000010H
$L71119:
	mov	eax, DWORD PTR _name$[ebp]
	push	eax
	call	_mem_free
	add	esp, 4
	mov	DWORD PTR _name$[ebp], 0
	mov	ecx, DWORD PTR _val$[ebp]
	push	ecx
	call	_mem_free
	add	esp, 4
	mov	DWORD PTR _val$[ebp], 0
	mov	edx, DWORD PTR _cntxt$[ebp]
	xor	eax, eax
	cmp	DWORD PTR [edx+29872], 0
	setne	al

; 710  : }

	mov	esp, ebp
	pop	ebp
	ret	0
_table_put_addnew_btn ENDP
_TEXT	ENDS
PUBLIC	_table_put_action_button
_DATA	SEGMENT
	ORG $+3
$SG71144 DB	'ACTBTN', 00H
	ORG $+1
$SG71150 DB	'D:\Travail\ABI\EVA\V4.0\CGI\Brunix-2016\table_utils.c', 00H
	ORG $+2
$SG71151 DB	'table_put_action_button', 00H
$SG71153 DB	'D:\Travail\ABI\EVA\V4.0\CGI\Brunix-2016\table_utils.c', 00H
	ORG $+2
$SG71154 DB	'table_put_action_button', 00H
_DATA	ENDS
_TEXT	SEGMENT
_cntxt$ = 8
_i_ctrl$ = 12
_idobj$ = 16
_ifld$ = 20
_form$ = -4
_ctrl$ = -80
_tbl$ = -8
_name$ = -76
_v$ = -72
_table_put_action_button PROC NEAR

; 725  : ){

	push	ebp
	mov	ebp, esp
	sub	esp, 80					; 00000050H
	push	edi

; 726  : 	EVA_form *form = cntxt->form;

	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	ecx, DWORD PTR [eax+80]
	mov	DWORD PTR _form$[ebp], ecx

; 727  : 	EVA_ctrl *ctrl = form->ctrl + i_ctrl;

	mov	edx, DWORD PTR _i_ctrl$[ebp]
	imul	edx, 480				; 000001e0H
	mov	eax, DWORD PTR _form$[ebp]
	mov	ecx, DWORD PTR [eax]
	add	ecx, edx
	mov	DWORD PTR _ctrl$[ebp], ecx

; 728  : 	ObjTableFormat *tbl = ctrl->objtbl;

	mov	edx, DWORD PTR _ctrl$[ebp]
	mov	eax, DWORD PTR [edx+232]
	mov	DWORD PTR _tbl$[ebp], eax

; 729  : 	DynBuffer *name = NULL;

	mov	DWORD PTR _name$[ebp], 0

; 730  : 	DynTableCell v = {0};

	mov	DWORD PTR _v$[ebp], 0
	mov	ecx, 15					; 0000000fH
	xor	eax, eax
	lea	edi, DWORD PTR _v$[ebp+4]
	rep stosd

; 731  : 	if(!idobj) RETURN_OK;

	cmp	DWORD PTR _idobj$[ebp], 0
	jne	SHORT $L71141
	jmp	$eva_noerr$71142
$L71141:

; 732  : 	v.Num = ifld;

	mov	ecx, DWORD PTR _ifld$[ebp]
	mov	DWORD PTR _v$[ebp+36], ecx

; 733  : 	v.Line = idobj;

	mov	edx, DWORD PTR _idobj$[ebp]
	mov	DWORD PTR _v$[ebp+40], edx

; 734  : 	CTRL_CGINAMEBTN(&name, &v, add_sz_str("ACTBTN"));

	push	6
	push	OFFSET FLAT:$SG71144
	push	66					; 00000042H
	lea	eax, DWORD PTR _name$[ebp]
	push	eax
	push	1
	lea	ecx, DWORD PTR _v$[ebp]
	push	ecx
	mov	edx, DWORD PTR _ctrl$[ebp]
	push	edx
	mov	eax, DWORD PTR _cntxt$[ebp]
	push	eax
	call	_ctrl_cgi_name
	add	esp, 32					; 00000020H
	test	eax, eax
	je	SHORT $L71143
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 734		; 000002deH
	jmp	SHORT $eva_err$71145
$L71143:

; 735  : 	if(put_html_button(cntxt, name->data,
; 736  : 		dyntab_val(&tbl->label, ifld, 0), NULL, NULL,
; 737  : 		dyntab_val(&tbl->notes, ifld, 0), 0, 0)) STACK_ERROR;

	push	0
	push	0
	push	0
	push	0
	push	0
	push	0
	mov	edx, DWORD PTR _ifld$[ebp]
	push	edx
	mov	eax, DWORD PTR _tbl$[ebp]
	add	eax, 580				; 00000244H
	push	eax
	call	_dyntab_val
	add	esp, 12					; 0000000cH
	push	eax
	push	0
	push	0
	push	0
	mov	ecx, DWORD PTR _ifld$[ebp]
	push	ecx
	mov	edx, DWORD PTR _tbl$[ebp]
	add	edx, 360				; 00000168H
	push	edx
	call	_dyntab_val
	add	esp, 12					; 0000000cH
	push	eax
	mov	eax, DWORD PTR _name$[ebp]
	add	eax, 8
	push	eax
	mov	ecx, DWORD PTR _cntxt$[ebp]
	push	ecx
	call	_put_html_button_sz
	add	esp, 44					; 0000002cH
	test	eax, eax
	je	SHORT $eva_noerr$71142
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 737		; 000002e1H
	jmp	SHORT $eva_err$71145
$eva_noerr$71142:

; 738  : 
; 739  : 	RETURN_OK_CLEANUP;

	push	0
	push	OFFSET FLAT:$SG71150
	push	OFFSET FLAT:$SG71151
	mov	eax, DWORD PTR _cntxt$[ebp]
	push	eax
	call	_err_clear
	add	esp, 16					; 00000010H
$eva_err$71145:
	mov	ecx, DWORD PTR _cntxt$[ebp]
	cmp	DWORD PTR [ecx+29872], 0
	je	SHORT $L71152
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	eax, DWORD PTR [edx+29900]
	push	eax
	push	OFFSET FLAT:$SG71153
	push	OFFSET FLAT:$SG71154
	mov	ecx, DWORD PTR _cntxt$[ebp]
	push	ecx
	call	_err_add_context
	add	esp, 16					; 00000010H
$L71152:
	mov	edx, DWORD PTR _name$[ebp]
	push	edx
	call	_mem_free
	add	esp, 4
	mov	DWORD PTR _name$[ebp], 0
	mov	eax, DWORD PTR _cntxt$[ebp]
	xor	ecx, ecx
	cmp	DWORD PTR [eax+29872], 0
	setne	cl
	mov	eax, ecx

; 740  : }

	pop	edi
	mov	esp, ebp
	pop	ebp
	ret	0
_table_put_action_button ENDP
_TEXT	ENDS
PUBLIC	_table_put_functions_btn
_BSS	SEGMENT
	ALIGN	4

$SG71177 DB	01H DUP (?)
_BSS	ENDS
_DATA	SEGMENT
$SG71176 DB	'_EVA_COPYPASTE', 00H
	ORG $+1
$SG71180 DB	'COPY', 00H
	ORG $+3
$SG71185 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG71189 DB	'Copier', 0aH, 0aH, 'Place les valeurs de cette relation '
	DB	'dans le presse papier', 00H
	ORG $+2
$SG71190 DB	'btn_copy_small1_s.gif', 00H
	ORG $+2
$SG71191 DB	'btn_copy_small1.gif', 00H
$SG71194 DB	'CB', 00H
	ORG $+1
$SG71197 DB	'PASTE', 00H
	ORG $+2
$SG71201 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG71205 DB	'Coller', 0aH, 0aH, 'Ajoute le contenu du presse papier a'
	DB	'ux valeurs de cette relation', 00H
	ORG $+3
$SG71206 DB	'btn_paste_small1_s.gif', 00H
	ORG $+1
$SG71207 DB	'btn_paste_small1.gif', 00H
	ORG $+3
$SG71210 DB	'D:\Travail\ABI\EVA\V4.0\CGI\Brunix-2016\table_utils.c', 00H
	ORG $+2
$SG71211 DB	'table_put_functions_btn', 00H
$SG71213 DB	'D:\Travail\ABI\EVA\V4.0\CGI\Brunix-2016\table_utils.c', 00H
	ORG $+2
$SG71214 DB	'table_put_functions_btn', 00H
_DATA	ENDS
_TEXT	SEGMENT
_cntxt$ = 8
_i_ctrl$ = 12
_separ$ = 16
_separ_sz$ = 20
_form$ = -4
_ctrl$ = -36
_tbl$ = -8
_cgival$ = -28
_name$ = -32
_table_put_functions_btn PROC NEAR

; 755  : ){

	push	ebp
	mov	ebp, esp
	sub	esp, 40					; 00000028H

; 756  : 	EVA_form *form = cntxt->form;

	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	ecx, DWORD PTR [eax+80]
	mov	DWORD PTR _form$[ebp], ecx

; 757  : 	EVA_ctrl *ctrl = form->ctrl + i_ctrl;

	mov	edx, DWORD PTR _i_ctrl$[ebp]
	imul	edx, 480				; 000001e0H
	mov	eax, DWORD PTR _form$[ebp]
	mov	ecx, DWORD PTR [eax]
	add	ecx, edx
	mov	DWORD PTR _ctrl$[ebp], ecx

; 758  : 	ObjTableFormat *tbl = ctrl->objtbl;

	mov	edx, DWORD PTR _ctrl$[ebp]
	mov	eax, DWORD PTR [edx+232]
	mov	DWORD PTR _tbl$[ebp], eax

; 759  : 	DynTable cgival = {0};

	mov	DWORD PTR _cgival$[ebp], 0
	xor	ecx, ecx
	mov	DWORD PTR _cgival$[ebp+4], ecx
	mov	DWORD PTR _cgival$[ebp+8], ecx
	mov	DWORD PTR _cgival$[ebp+12], ecx
	mov	DWORD PTR _cgival$[ebp+16], ecx

; 760  : 	DynBuffer *name = NULL;

	mov	DWORD PTR _name$[ebp], 0

; 761  : 	if(form->step == HtmlPrint) RETURN_OK;

	mov	edx, DWORD PTR _form$[ebp]
	cmp	DWORD PTR [edx+176], 7
	jne	SHORT $L71173
	jmp	$eva_noerr$71174
$L71173:

; 762  : 
; 763  : 	/* Output copy / paste buttons */
; 764  : 	if(*CTRL_ATTR_VAL(COPYPASTE) == '1')

	cmp	DWORD PTR _ctrl$[ebp], 0
	je	SHORT $L73374
	push	0
	push	-1
	push	OFFSET FLAT:$SG71176
	mov	eax, DWORD PTR _ctrl$[ebp]
	add	eax, 44					; 0000002cH
	push	eax
	call	_dyntab_field_val
	add	esp, 16					; 00000010H
	mov	DWORD PTR -40+[ebp], eax
	jmp	SHORT $L73375
$L73374:
	mov	DWORD PTR -40+[ebp], OFFSET FLAT:$SG71177
$L73375:
	mov	ecx, DWORD PTR -40+[ebp]
	movsx	edx, BYTE PTR [ecx]
	cmp	edx, 49					; 00000031H
	jne	$L71204

; 766  : 		if(ctrl->val.nbrows)

	mov	eax, DWORD PTR _ctrl$[ebp]
	cmp	DWORD PTR [eax+64], 0
	je	$L71188

; 768  : 			CTRL_CGINAMEBTN(&name, dyntab_cell(&ctrl->val, 0, 0), add_sz_str("COPY"));

	push	4
	push	OFFSET FLAT:$SG71180
	push	66					; 00000042H
	lea	ecx, DWORD PTR _name$[ebp]
	push	ecx
	push	1
	push	0
	push	0
	mov	edx, DWORD PTR _ctrl$[ebp]
	add	edx, 64					; 00000040H
	push	edx
	call	_dyntab_cell
	add	esp, 12					; 0000000cH
	push	eax
	mov	eax, DWORD PTR _ctrl$[ebp]
	push	eax
	mov	ecx, DWORD PTR _cntxt$[ebp]
	push	ecx
	call	_ctrl_cgi_name
	add	esp, 32					; 00000020H
	test	eax, eax
	je	SHORT $L71179
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 768		; 00000300H
	jmp	$eva_err$71181
$L71179:

; 769  : 			DYNBUF_ADD(form->html, separ, separ_sz, NO_CONV);

	push	0
	push	0
	mov	eax, DWORD PTR _separ_sz$[ebp]
	push	eax
	mov	ecx, DWORD PTR _separ$[ebp]
	push	ecx
	mov	edx, DWORD PTR _form$[ebp]
	mov	eax, DWORD PTR [edx+232]
	push	eax
	call	_dynbuf_add
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L71183
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29872], OFFSET FLAT:$SG71185
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 769		; 00000301H
	jmp	$eva_err$71181
$L71183:

; 770  : 			if(put_html_button(cntxt, name->data,
; 771  : 				NULL, "btn_copy_small1.gif", "btn_copy_small1_s.gif",
; 772  : 				"Copier\n\nPlace les valeurs de cette relation dans le presse papier", 0, 0)) STACK_ERROR;

	push	0
	push	0
	push	0
	push	0
	push	0
	push	OFFSET FLAT:$SG71189
	push	OFFSET FLAT:$SG71190
	push	OFFSET FLAT:$SG71191
	push	0
	mov	eax, DWORD PTR _name$[ebp]
	add	eax, 8
	push	eax
	mov	ecx, DWORD PTR _cntxt$[ebp]
	push	ecx
	call	_put_html_button_sz
	add	esp, 44					; 0000002cH
	test	eax, eax
	je	SHORT $L71188
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 772		; 00000304H
	jmp	$eva_err$71181
$L71188:

; 774  : 		if(tbl->status & TblCtrl_sel && cntxt->form->step == HtmlEdit &&
; 775  : 			cgi_filter_values(cntxt, &cgival, 'D', 0, 0, 0, "CB", NULL, 0, 0)) STACK_ERROR;

	mov	eax, DWORD PTR _tbl$[ebp]
	mov	ecx, DWORD PTR [eax+32]
	and	ecx, 256				; 00000100H
	test	ecx, ecx
	je	SHORT $L71193
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	eax, DWORD PTR [edx+80]
	cmp	DWORD PTR [eax+176], 4
	jne	SHORT $L71193
	push	0
	push	0
	push	0
	push	OFFSET FLAT:$SG71194
	push	0
	push	0
	push	0
	push	68					; 00000044H
	lea	ecx, DWORD PTR _cgival$[ebp]
	push	ecx
	mov	edx, DWORD PTR _cntxt$[ebp]
	push	edx
	call	_cgi_filter_values
	add	esp, 40					; 00000028H
	test	eax, eax
	je	SHORT $L71193
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 775		; 00000307H
	jmp	$eva_err$71181
$L71193:

; 776  : 		if(cgival.nbrows)

	cmp	DWORD PTR _cgival$[ebp], 0
	je	$L71204

; 778  : 			CTRL_CGINAMEBTN(&name, dyntab_cell(&ctrl->val, 0, 0), add_sz_str("PASTE"));

	push	5
	push	OFFSET FLAT:$SG71197
	push	66					; 00000042H
	lea	ecx, DWORD PTR _name$[ebp]
	push	ecx
	push	1
	push	0
	push	0
	mov	edx, DWORD PTR _ctrl$[ebp]
	add	edx, 64					; 00000040H
	push	edx
	call	_dyntab_cell
	add	esp, 12					; 0000000cH
	push	eax
	mov	eax, DWORD PTR _ctrl$[ebp]
	push	eax
	mov	ecx, DWORD PTR _cntxt$[ebp]
	push	ecx
	call	_ctrl_cgi_name
	add	esp, 32					; 00000020H
	test	eax, eax
	je	SHORT $L71196
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 778		; 0000030aH
	jmp	$eva_err$71181
$L71196:

; 779  : 			DYNBUF_ADD(form->html, separ, separ_sz, NO_CONV);

	push	0
	push	0
	mov	eax, DWORD PTR _separ_sz$[ebp]
	push	eax
	mov	ecx, DWORD PTR _separ$[ebp]
	push	ecx
	mov	edx, DWORD PTR _form$[ebp]
	mov	eax, DWORD PTR [edx+232]
	push	eax
	call	_dynbuf_add
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L71199
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29872], OFFSET FLAT:$SG71201
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 779		; 0000030bH
	jmp	$eva_err$71181
$L71199:

; 780  : 			if(put_html_button(cntxt, name->data,
; 781  : 				NULL, "btn_paste_small1.gif", "btn_paste_small1_s.gif",
; 782  : 				"Coller\n\nAjoute le contenu du presse papier aux valeurs de cette relation", 0, 0)) STACK_ERROR;

	push	0
	push	0
	push	0
	push	0
	push	0
	push	OFFSET FLAT:$SG71205
	push	OFFSET FLAT:$SG71206
	push	OFFSET FLAT:$SG71207
	push	0
	mov	eax, DWORD PTR _name$[ebp]
	add	eax, 8
	push	eax
	mov	ecx, DWORD PTR _cntxt$[ebp]
	push	ecx
	call	_put_html_button_sz
	add	esp, 44					; 0000002cH
	test	eax, eax
	je	SHORT $L71204
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 782		; 0000030eH
	jmp	SHORT $eva_err$71181
$L71204:

; 785  : 
; 786  : 	/* Output insert button if applicable */
; 787  : 	if(table_put_addnew_btn(cntxt, i_ctrl, separ, separ_sz, NULL, 0, 0)) STACK_ERROR;

	push	0
	push	0
	push	0
	mov	eax, DWORD PTR _separ_sz$[ebp]
	push	eax
	mov	ecx, DWORD PTR _separ$[ebp]
	push	ecx
	mov	edx, DWORD PTR _i_ctrl$[ebp]
	push	edx
	mov	eax, DWORD PTR _cntxt$[ebp]
	push	eax
	call	_table_put_addnew_btn
	add	esp, 28					; 0000001cH
	test	eax, eax
	je	SHORT $eva_noerr$71174
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 787		; 00000313H
	jmp	SHORT $eva_err$71181
$eva_noerr$71174:

; 788  : 
; 789  : 	RETURN_OK_CLEANUP;

	push	0
	push	OFFSET FLAT:$SG71210
	push	OFFSET FLAT:$SG71211
	mov	edx, DWORD PTR _cntxt$[ebp]
	push	edx
	call	_err_clear
	add	esp, 16					; 00000010H
$eva_err$71181:
	mov	eax, DWORD PTR _cntxt$[ebp]
	cmp	DWORD PTR [eax+29872], 0
	je	SHORT $L71212
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	edx, DWORD PTR [ecx+29900]
	push	edx
	push	OFFSET FLAT:$SG71213
	push	OFFSET FLAT:$SG71214
	mov	eax, DWORD PTR _cntxt$[ebp]
	push	eax
	call	_err_add_context
	add	esp, 16					; 00000010H
$L71212:
	lea	ecx, DWORD PTR _cgival$[ebp]
	push	ecx
	call	_dyntab_free
	add	esp, 4
	mov	edx, DWORD PTR _name$[ebp]
	push	edx
	call	_mem_free
	add	esp, 4
	mov	DWORD PTR _name$[ebp], 0
	mov	eax, DWORD PTR _cntxt$[ebp]
	xor	ecx, ecx
	cmp	DWORD PTR [eax+29872], 0
	setne	cl
	mov	eax, ecx

; 790  : }

	mov	esp, ebp
	pop	ebp
	ret	0
_table_put_functions_btn ENDP
_TEXT	ENDS
PUBLIC	_table_put_search_input
EXTRN	_put_html_text_input:NEAR
EXTRN	_plain_to_xml:BYTE
_DATA	SEGMENT
$SG71252 DB	'Ajouter', 00H
$SG71254 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG71258 DB	'ADDNEWOBJ', 00H
	ORG $+2
$SG71260 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG71265 DB	'] et cliquez sur Ok pour cr', 0e9H, 'er une nouvelle fic'
	DB	'he et l''ajouter ', 0e0H, ' la liste', 00H
	ORG $+2
$SG71266 DB	'Entrez une valeur pour le champ [', 00H
	ORG $+2
$SG71268 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG71273 DB	'SEARCH', 00H
	ORG $+1
$SG71275 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG71282 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG71284 DB	'_EVA_AGE', 00H
	ORG $+3
$SG71287 DB	'Entrer un age ou une tranche d''age (2 nombres s', 0e9H, 'p'
	DB	'ar', 0e9H, 's par un tiret)', 0aH, 0aH, 'exemples :', 0aH, '1'
	DB	'5-18 : 15 ', 0e0H, ' 18 ans inclus', 0aH, '15 : 15 ans', 0aH, '1'
	DB	'5- : 15 ans et +', 0aH, '-15 : 15 ans et moins', 00H
	ORG $+1
$SG71289 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG71292 DB	'_EVA_DATE', 00H
	ORG $+2
$SG71295 DB	'Recherche de dates', 0aH, ' Entrer une date ou une p', 0e9H
	DB	'riode (2 dates s', 0e9H, 'par', 0e9H, 'es par un tiret)', 0aH
	DB	'Exemple : 1/1-1/4 pour le 1er trimestre de l''ann', 0e9H, 'e '
	DB	'en cours', 00H
	ORG $+1
$SG71297 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG71301 DB	'Entrer le texte ', 0e0H, ' chercher', 00H
	ORG $+1
$SG71303 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG71307 DB	'Chercher', 00H
	ORG $+3
$SG71309 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG71312 DB	'Cherche sur tous les champs des fiches', 00H
	ORG $+1
$SG71314 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG71320 DB	'Chercher', 00H
	ORG $+3
$SG71322 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG71325 DB	'Cherche sur les champs [', 00H
	ORG $+3
$SG71327 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG71335 DB	',', 00H
	ORG $+2
$SG71337 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG71343 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG71346 DB	']', 00H
	ORG $+2
$SG71348 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG71352 DB	0aH, 0aH, 'Si vous entrez plusieurs mots, ils sont recher'
	DB	'ch', 0e9H, 's individuellement et seules les fiches contenant'
	DB	' tous les mots sont affich', 0e9H, 'es', 0aH, 0aH, 'Pour cher'
	DB	'cher un texte contenant un espace, entourez le avec des doubl'
	DB	'es guillements', 00H
$SG71354 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG71359 DB	'</td><td valign=middle><nobr>', 00H
	ORG $+2
$SG71360 DB	'<td align=right valign=middle>&nbsp;', 00H
	ORG $+3
$SG71362 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG71365 DB	'INPUT', 00H
	ORG $+2
$SG71372 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG71377 DB	'Ok', 00H
	ORG $+1
$SG71383 DB	'_EVA_DATE', 00H
	ORG $+2
$SG71384 DB	'_EVA_AGE', 00H
	ORG $+3
$SG71388 DB	'SEARCHBEGIN', 00H
$SG71392 DB	'Augmente le nombre de r', 0e9H, 'ponses en recherchant l'
	DB	'es valeurs qui commencent par les mots donn', 0e9H, 's', 00H
	ORG $+3
$SG71393 DB	'_eva_srchmode_begin.gif', 00H
$SG71394 DB	'_eva_srchmode_exact.gif', 00H
$SG71399 DB	'SEARCHCONTAIN', 00H
	ORG $+2
$SG71403 DB	'Augmente le nombre de r', 0e9H, 'ponses en recherchant l'
	DB	'es valeurs qui contiennent les mots donn', 0e9H, 's', 00H
	ORG $+2
$SG71404 DB	'_eva_srchmode_contain.gif', 00H
	ORG $+2
$SG71405 DB	'_eva_srchmode_begin.gif', 00H
$SG71409 DB	'SEARCHEXACT', 00H
$SG71413 DB	'Diminue le nombre de r', 0e9H, 'ponses en recherchant ex'
	DB	'actement les mots donn', 0e9H, 's', 00H
$SG71414 DB	'_eva_srchmode_exact.gif', 00H
$SG71415 DB	'_eva_srchmode_contain.gif', 00H
	ORG $+2
$SG71419 DB	'</td>', 00H
	ORG $+2
$SG71421 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG71422 DB	'D:\Travail\ABI\EVA\V4.0\CGI\Brunix-2016\table_utils.c', 00H
	ORG $+2
$SG71423 DB	'table_put_search_input', 00H
	ORG $+1
$SG71425 DB	'D:\Travail\ABI\EVA\V4.0\CGI\Brunix-2016\table_utils.c', 00H
	ORG $+2
$SG71426 DB	'table_put_search_input', 00H
_DATA	ENDS
_TEXT	SEGMENT
_cntxt$ = 8
_i_ctrl$ = 12
_b_label$ = 16
_form$ = -8
_ctrl$ = -64
_tbl$ = -16
_cgival$ = -44
_name$ = -60
_label$ = -48
_tooltip$ = -52
_subfield$ = -4
_srchcol1$ = -56
_i$ = -24
_blabel$ = -20
_b_onecol$ = -68
_html$ = -12
__c$71261 = -72
_b_words$71270 = -76
__c$71278 = -80
_b_first$71316 = -84
_i$71317 = -88
__c$71339 = -92
_table_put_search_input PROC NEAR

; 809  : ){

	push	ebp
	mov	ebp, esp
	sub	esp, 136				; 00000088H

; 810  : 	EVA_form *form = cntxt->form;

	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	ecx, DWORD PTR [eax+80]
	mov	DWORD PTR _form$[ebp], ecx

; 811  : 	EVA_ctrl *ctrl = form->ctrl + i_ctrl;

	mov	edx, DWORD PTR _i_ctrl$[ebp]
	imul	edx, 480				; 000001e0H
	mov	eax, DWORD PTR _form$[ebp]
	mov	ecx, DWORD PTR [eax]
	add	ecx, edx
	mov	DWORD PTR _ctrl$[ebp], ecx

; 812  : 	ObjTableFormat *tbl = ctrl->objtbl;

	mov	edx, DWORD PTR _ctrl$[ebp]
	mov	eax, DWORD PTR [edx+232]
	mov	DWORD PTR _tbl$[ebp], eax

; 813  : 	DynTable cgival = {0};

	mov	DWORD PTR _cgival$[ebp], 0
	xor	ecx, ecx
	mov	DWORD PTR _cgival$[ebp+4], ecx
	mov	DWORD PTR _cgival$[ebp+8], ecx
	mov	DWORD PTR _cgival$[ebp+12], ecx
	mov	DWORD PTR _cgival$[ebp+16], ecx

; 814  : 	DynBuffer *name = NULL;

	mov	DWORD PTR _name$[ebp], 0

; 815  : 	DynBuffer *label = NULL;

	mov	DWORD PTR _label$[ebp], 0

; 816  : 	DynBuffer *tooltip = NULL;

	mov	DWORD PTR _tooltip$[ebp], 0

; 817  : 	DynBuffer *subfield = NULL;

	mov	DWORD PTR _subfield$[ebp], 0

; 818  : 	unsigned long srchcol1 = unique_bit_index(tbl->srchcol);

	mov	edx, DWORD PTR _tbl$[ebp]
	mov	eax, DWORD PTR [edx+124]
	push	eax
	call	_unique_bit_index
	add	esp, 4
	mov	DWORD PTR _srchcol1$[ebp], eax

; 819  : 	unsigned long i;
; 820  : 	int blabel = !b_label || *b_label, b_onecol = srchcol1;

	cmp	DWORD PTR _b_label$[ebp], 0
	je	SHORT $L73377
	mov	ecx, DWORD PTR _b_label$[ebp]
	cmp	DWORD PTR [ecx], 0
	jne	SHORT $L73377
	mov	DWORD PTR -96+[ebp], 0
	jmp	SHORT $L73378
$L73377:
	mov	DWORD PTR -96+[ebp], 1
$L73378:
	mov	edx, DWORD PTR -96+[ebp]
	mov	DWORD PTR _blabel$[ebp], edx
	mov	eax, DWORD PTR _srchcol1$[ebp]
	mov	DWORD PTR _b_onecol$[ebp], eax

; 821  : 	CHECK_HTML_STATUS;

	cmp	DWORD PTR _cntxt$[ebp], 0
	je	SHORT $L73381
	mov	ecx, DWORD PTR _cntxt$[ebp]
	cmp	DWORD PTR [ecx+80], 0
	je	SHORT $L73379
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	eax, DWORD PTR [edx+80]
	mov	ecx, DWORD PTR [eax+232]
	mov	DWORD PTR -100+[ebp], ecx
	jmp	SHORT $L73380
$L73379:
	mov	DWORD PTR -100+[ebp], 0
$L73380:
	mov	edx, DWORD PTR -100+[ebp]
	mov	DWORD PTR -104+[ebp], edx
	jmp	SHORT $L73382
$L73381:
	mov	DWORD PTR -104+[ebp], 0
$L73382:
	mov	eax, DWORD PTR -104+[ebp]
	mov	DWORD PTR _html$[ebp], eax
	cmp	DWORD PTR _html$[ebp], 0
	jne	SHORT $L71244
	xor	eax, eax
	jmp	$L71224
$L71244:

; 822  : 	if(b_label) *b_label = 0;

	cmp	DWORD PTR _b_label$[ebp], 0
	je	SHORT $L71245
	mov	ecx, DWORD PTR _b_label$[ebp]
	mov	DWORD PTR [ecx], 0
$L71245:

; 823  : 
; 824  : 	/* Return if external controls or print mode with no search string */
; 825  : 	if(tbl->status & TblCtrl_extsearch || (!*tbl->input && form->step == HtmlPrint)) RETURN_OK;

	mov	edx, DWORD PTR _tbl$[ebp]
	mov	eax, DWORD PTR [edx+32]
	and	eax, 8192				; 00002000H
	test	eax, eax
	jne	SHORT $L71247
	mov	ecx, DWORD PTR _tbl$[ebp]
	mov	edx, DWORD PTR [ecx+100]
	movsx	eax, BYTE PTR [edx]
	test	eax, eax
	jne	SHORT $L71246
	mov	ecx, DWORD PTR _form$[ebp]
	cmp	DWORD PTR [ecx+176], 7
	jne	SHORT $L71246
$L71247:
	jmp	$eva_noerr$71248
$L71246:

; 826  : 
; 827  : 	/* Build text label & help button tooltip */
; 828  : 	if(tbl->status & TblCtrl_openaddnew)

	mov	edx, DWORD PTR _tbl$[ebp]
	mov	eax, DWORD PTR [edx+32]
	and	eax, 128				; 00000080H
	test	eax, eax
	je	$L71249

; 830  : 		/* Add new object button */
; 831  : 		DYNBUF_ADD_STR(&label, "Ajouter");

	push	0
	push	0
	push	7
	push	OFFSET FLAT:$SG71252
	lea	ecx, DWORD PTR _label$[ebp]
	push	ecx
	call	_dynbuf_add
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L71251
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29872], OFFSET FLAT:$SG71254
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 831		; 0000033fH
	jmp	$eva_err$71255
$L71251:

; 832  : 		DYNBUF_ADD_STR(&subfield, "ADDNEWOBJ");

	push	0
	push	0
	push	9
	push	OFFSET FLAT:$SG71258
	lea	ecx, DWORD PTR _subfield$[ebp]
	push	ecx
	call	_dynbuf_add
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L71257
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29872], OFFSET FLAT:$SG71260
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 832		; 00000340H
	jmp	$eva_err$71255
$L71257:

; 834  : 			LABEL_OR_FIELD_CELL(0), NO_CONV,
; 835  : 			"] et cliquez sur Ok pour créer une nouvelle fiche et l'ajouter à la liste");

	push	0
	mov	ecx, DWORD PTR _tbl$[ebp]
	push	ecx
	call	_table_column_label
	add	esp, 8
	mov	DWORD PTR __c$71261[ebp], eax
	cmp	DWORD PTR __c$71261[ebp], 0
	je	SHORT $L73383
	mov	edx, DWORD PTR __c$71261[ebp]
	mov	eax, DWORD PTR [edx+4]
	mov	DWORD PTR -108+[ebp], eax
	jmp	SHORT $L73384
$L73383:
	mov	DWORD PTR -108+[ebp], 0
$L73384:
	cmp	DWORD PTR __c$71261[ebp], 0
	je	SHORT $L73385
	mov	ecx, DWORD PTR __c$71261[ebp]
	mov	edx, DWORD PTR [ecx]
	mov	DWORD PTR -112+[ebp], edx
	jmp	SHORT $L73386
$L73385:
	mov	DWORD PTR -112+[ebp], 0
$L73386:
	push	73					; 00000049H
	push	OFFSET FLAT:$SG71265
	push	0
	push	0
	mov	eax, DWORD PTR -108+[ebp]
	push	eax
	mov	ecx, DWORD PTR -112+[ebp]
	push	ecx
	push	33					; 00000021H
	push	OFFSET FLAT:$SG71266
	lea	edx, DWORD PTR _tooltip$[ebp]
	push	edx
	call	_dynbuf_add3
	add	esp, 36					; 00000024H
	test	eax, eax
	je	SHORT $L71264
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29872], OFFSET FLAT:$SG71268
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 835		; 00000343H
	jmp	$eva_err$71255
$L71264:

; 837  : 	else

	jmp	$L71351
$L71249:

; 839  : 		int b_words = 1;

	mov	DWORD PTR _b_words$71270[ebp], 1

; 840  : 		DYNBUF_ADD_STR(&subfield, "SEARCH");

	push	0
	push	0
	push	6
	push	OFFSET FLAT:$SG71273
	lea	edx, DWORD PTR _subfield$[ebp]
	push	edx
	call	_dynbuf_add
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L71272
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29872], OFFSET FLAT:$SG71275
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 840		; 00000348H
	jmp	$eva_err$71255
$L71272:

; 841  : 		if(b_onecol)

	cmp	DWORD PTR _b_onecol$[ebp], 0
	je	$L71276

; 843  : 			srchcol1--;

	mov	edx, DWORD PTR _srchcol1$[ebp]
	sub	edx, 1
	mov	DWORD PTR _srchcol1$[ebp], edx

; 844  : 			if(srchcol1 < tbl->field.nbrows)

	mov	eax, DWORD PTR _tbl$[ebp]
	mov	ecx, DWORD PTR _srchcol1$[ebp]
	cmp	ecx, DWORD PTR [eax+380]
	jae	$L71277

; 846  : 				/* Search on single field */
; 847  : 				DYNBUF_ADD_CELLP(&label, dyntab_cell(&tbl->label, srchcol1, 0), NO_CONV);

	push	0
	mov	edx, DWORD PTR _srchcol1$[ebp]
	push	edx
	mov	eax, DWORD PTR _tbl$[ebp]
	add	eax, 360				; 00000168H
	push	eax
	call	_dyntab_cell
	add	esp, 12					; 0000000cH
	mov	DWORD PTR __c$71278[ebp], eax
	cmp	DWORD PTR __c$71278[ebp], 0
	je	SHORT $L71280
	push	0
	push	0
	mov	ecx, DWORD PTR __c$71278[ebp]
	mov	edx, DWORD PTR [ecx+4]
	push	edx
	mov	eax, DWORD PTR __c$71278[ebp]
	mov	ecx, DWORD PTR [eax]
	push	ecx
	lea	edx, DWORD PTR _label$[ebp]
	push	edx
	call	_dynbuf_add
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L71280
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29872], OFFSET FLAT:$SG71282
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 847		; 0000034fH
	jmp	$eva_err$71255
$L71280:

; 848  : 				if(!strcmp(dyntab_val(&tbl->format, srchcol1, 0), "_EVA_AGE"))

	push	OFFSET FLAT:$SG71284
	push	0
	mov	edx, DWORD PTR _srchcol1$[ebp]
	push	edx
	mov	eax, DWORD PTR _tbl$[ebp]
	add	eax, 400				; 00000190H
	push	eax
	call	_dyntab_val
	add	esp, 12					; 0000000cH
	push	eax
	call	_strcmp
	add	esp, 8
	test	eax, eax
	jne	SHORT $L71283

; 850  : 					/* Search on single age field */
; 851  : 					b_words = 0;

	mov	DWORD PTR _b_words$71270[ebp], 0

; 853  : 						"exemples :\n"
; 854  : 						"15-18 : 15 à 18 ans inclus\n"
; 855  : 						"15 : 15 ans\n"
; 856  : 						"15- : 15 ans et +\n"
; 857  : 						"-15 : 15 ans et moins");

	push	0
	push	0
	push	158					; 0000009eH
	push	OFFSET FLAT:$SG71287
	lea	ecx, DWORD PTR _tooltip$[ebp]
	push	ecx
	call	_dynbuf_add
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L71286
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29872], OFFSET FLAT:$SG71289
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 857		; 00000359H
	jmp	$eva_err$71255
$L71286:

; 859  : 				else if(!strncmp(dyntab_val(&tbl->format, srchcol1, 0), add_sz_str("_EVA_DATE")))

	jmp	$L71300
$L71283:
	push	9
	push	OFFSET FLAT:$SG71292
	push	0
	mov	ecx, DWORD PTR _srchcol1$[ebp]
	push	ecx
	mov	edx, DWORD PTR _tbl$[ebp]
	add	edx, 400				; 00000190H
	push	edx
	call	_dyntab_val
	add	esp, 12					; 0000000cH
	push	eax
	call	_strncmp
	add	esp, 12					; 0000000cH
	test	eax, eax
	jne	SHORT $L71291

; 861  : 					/* Search on single date field */
; 862  : 					b_words = 0;

	mov	DWORD PTR _b_words$71270[ebp], 0

; 864  : 											" Entrer une date ou une période (2 dates séparées par un tiret)\n"
; 865  : 											"Exemple : 1/1-1/4 pour le 1er trimestre de l'année en cours")

	push	0
	push	0
	push	142					; 0000008eH
	push	OFFSET FLAT:$SG71295
	lea	eax, DWORD PTR _tooltip$[ebp]
	push	eax
	call	_dynbuf_add
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L71294
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29872], OFFSET FLAT:$SG71297
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 865		; 00000361H
	jmp	$eva_err$71255
$L71294:

; 867  : 				else

	jmp	SHORT $L71300
$L71291:

; 868  : 					DYNBUF_ADD_STR(&tooltip, "Entrer le texte à chercher")

	push	0
	push	0
	push	26					; 0000001aH
	push	OFFSET FLAT:$SG71301
	lea	eax, DWORD PTR _tooltip$[ebp]
	push	eax
	call	_dynbuf_add
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L71300
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29872], OFFSET FLAT:$SG71303
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 868		; 00000364H
	jmp	$eva_err$71255
$L71300:

; 870  : 			else

	jmp	SHORT $L71311
$L71277:

; 872  : 				/* Search on all object fields */
; 873  : 				DYNBUF_ADD_STR(&label, "Chercher");

	push	0
	push	0
	push	8
	push	OFFSET FLAT:$SG71307
	lea	eax, DWORD PTR _label$[ebp]
	push	eax
	call	_dynbuf_add
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L71306
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29872], OFFSET FLAT:$SG71309
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 873		; 00000369H
	jmp	$eva_err$71255
$L71306:

; 874  : 				DYNBUF_ADD_STR(&tooltip, "Cherche sur tous les champs des fiches");

	push	0
	push	0
	push	38					; 00000026H
	push	OFFSET FLAT:$SG71312
	lea	eax, DWORD PTR _tooltip$[ebp]
	push	eax
	call	_dynbuf_add
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L71311
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29872], OFFSET FLAT:$SG71314
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 874		; 0000036aH
	jmp	$eva_err$71255
$L71311:

; 877  : 		else

	jmp	$L71345
$L71276:

; 879  : 			/* Search on multiple fields */
; 880  : 			int b_first = 1;

	mov	DWORD PTR _b_first$71316[ebp], 1

; 881  : 			unsigned long i;
; 882  : 			DYNBUF_ADD_STR(&label, "Chercher");

	push	0
	push	0
	push	8
	push	OFFSET FLAT:$SG71320
	lea	eax, DWORD PTR _label$[ebp]
	push	eax
	call	_dynbuf_add
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L71319
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29872], OFFSET FLAT:$SG71322
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 882		; 00000372H
	jmp	$eva_err$71255
$L71319:

; 883  : 			DYNBUF_ADD_STR(&tooltip, "Cherche sur les champs [");

	push	0
	push	0
	push	24					; 00000018H
	push	OFFSET FLAT:$SG71325
	lea	eax, DWORD PTR _tooltip$[ebp]
	push	eax
	call	_dynbuf_add
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L71324
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29872], OFFSET FLAT:$SG71327
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 883		; 00000373H
	jmp	$eva_err$71255
$L71324:

; 884  : 			for(i = 0; i < tbl->field.nbrows; i++) if(tbl->srchcol & ( 1 << i))

	mov	DWORD PTR _i$71317[ebp], 0
	jmp	SHORT $L71328
$L71329:
	mov	eax, DWORD PTR _i$71317[ebp]
	add	eax, 1
	mov	DWORD PTR _i$71317[ebp], eax
$L71328:
	mov	ecx, DWORD PTR _tbl$[ebp]
	mov	edx, DWORD PTR _i$71317[ebp]
	cmp	edx, DWORD PTR [ecx+380]
	jae	$L71330
	mov	eax, 1
	mov	ecx, DWORD PTR _i$71317[ebp]
	shl	eax, cl
	mov	ecx, DWORD PTR _tbl$[ebp]
	mov	edx, DWORD PTR [ecx+124]
	and	edx, eax
	test	edx, edx
	je	$L71341

; 886  : 				if(!b_first) DYNBUF_ADD_STR(&tooltip, ",")

	cmp	DWORD PTR _b_first$71316[ebp], 0
	jne	SHORT $L71332
	push	0
	push	0
	push	1
	push	OFFSET FLAT:$SG71335
	lea	eax, DWORD PTR _tooltip$[ebp]
	push	eax
	call	_dynbuf_add
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L71334
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29872], OFFSET FLAT:$SG71337
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 886		; 00000376H
	jmp	$eva_err$71255
$L71334:

; 887  : 				else b_first = 0;

	jmp	SHORT $L71338
$L71332:
	mov	DWORD PTR _b_first$71316[ebp], 0
$L71338:

; 888  : 				DYNBUF_ADD_CELLP(&tooltip, LABEL_OR_FIELD_CELL(i), NO_CONV);

	mov	eax, DWORD PTR _i$71317[ebp]
	push	eax
	mov	ecx, DWORD PTR _tbl$[ebp]
	push	ecx
	call	_table_column_label
	add	esp, 8
	mov	DWORD PTR __c$71339[ebp], eax
	cmp	DWORD PTR __c$71339[ebp], 0
	je	SHORT $L71341
	push	0
	push	0
	mov	edx, DWORD PTR __c$71339[ebp]
	mov	eax, DWORD PTR [edx+4]
	push	eax
	mov	ecx, DWORD PTR __c$71339[ebp]
	mov	edx, DWORD PTR [ecx]
	push	edx
	lea	eax, DWORD PTR _tooltip$[ebp]
	push	eax
	call	_dynbuf_add
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L71341
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29872], OFFSET FLAT:$SG71343
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 888		; 00000378H
	jmp	$eva_err$71255
$L71341:

; 890  : 			DYNBUF_ADD_STR(&tooltip, "]");

	jmp	$L71329
$L71330:
	push	0
	push	0
	push	1
	push	OFFSET FLAT:$SG71346
	lea	eax, DWORD PTR _tooltip$[ebp]
	push	eax
	call	_dynbuf_add
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L71345
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29872], OFFSET FLAT:$SG71348
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 890		; 0000037aH
	jmp	$eva_err$71255
$L71345:

; 892  : 		if(b_words) DYNBUF_ADD_STR(&tooltip,

	cmp	DWORD PTR _b_words$71270[ebp], 0
	je	SHORT $L71351

; 893  : 			"\n\n"
; 894  : 			"Si vous entrez plusieurs mots, ils sont recherchés individuellement et seules les fiches contenant tous les mots sont affichées\n\n"
; 895  : 			"Pour chercher un texte contenant un espace, entourez le avec des doubles guillements");

	push	0
	push	0
	push	215					; 000000d7H
	push	OFFSET FLAT:$SG71352
	lea	eax, DWORD PTR _tooltip$[ebp]
	push	eax
	call	_dynbuf_add
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L71351
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29872], OFFSET FLAT:$SG71354
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 895		; 0000037fH
	jmp	$eva_err$71255
$L71351:

; 897  : 
; 898  : 	/* Output label, text input & Ok button */
; 899  : 	if(b_label) *b_label = 1;

	cmp	DWORD PTR _b_label$[ebp], 0
	je	SHORT $L71355
	mov	eax, DWORD PTR _b_label$[ebp]
	mov	DWORD PTR [eax], 1
$L71355:

; 900  : 	if(blabel) DYNBUF_ADD3_BUF(html, "<td align=right valign=middle>&nbsp;", label, TO_XML, "</td><td valign=middle><nobr>");

	cmp	DWORD PTR _blabel$[ebp], 0
	je	SHORT $L71358
	cmp	DWORD PTR _label$[ebp], 0
	je	SHORT $L73387
	mov	ecx, DWORD PTR _label$[ebp]
	mov	edx, DWORD PTR [ecx+4]
	mov	DWORD PTR -116+[ebp], edx
	jmp	SHORT $L73388
$L73387:
	mov	DWORD PTR -116+[ebp], 0
$L73388:
	cmp	DWORD PTR _label$[ebp], 0
	je	SHORT $L73389
	mov	eax, DWORD PTR _label$[ebp]
	add	eax, 8
	mov	DWORD PTR -120+[ebp], eax
	jmp	SHORT $L73390
$L73389:
	mov	DWORD PTR -120+[ebp], 0
$L73390:
	push	29					; 0000001dH
	push	OFFSET FLAT:$SG71359
	push	1
	push	OFFSET FLAT:_plain_to_xml
	mov	ecx, DWORD PTR -116+[ebp]
	push	ecx
	mov	edx, DWORD PTR -120+[ebp]
	push	edx
	push	36					; 00000024H
	push	OFFSET FLAT:$SG71360
	mov	eax, DWORD PTR _html$[ebp]
	push	eax
	call	_dynbuf_add3
	add	esp, 36					; 00000024H
	test	eax, eax
	je	SHORT $L71358
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29872], OFFSET FLAT:$SG71362
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 900		; 00000384H
	jmp	$eva_err$71255
$L71358:

; 901  : 	CTRL_CGINAMESUBFIELD(&name, NULL, "INPUT");

	push	5
	push	OFFSET FLAT:$SG71365
	push	68					; 00000044H
	lea	eax, DWORD PTR _name$[ebp]
	push	eax
	push	1
	push	0
	mov	ecx, DWORD PTR _ctrl$[ebp]
	push	ecx
	mov	edx, DWORD PTR _cntxt$[ebp]
	push	edx
	call	_ctrl_cgi_name
	add	esp, 32					; 00000020H
	test	eax, eax
	je	SHORT $L71364
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 901		; 00000385H
	jmp	$eva_err$71255
$L71364:

; 902  : 	if(put_html_text_input(cntxt, DYNBUF_VAL_SZ(name), tbl->input, strlen(tbl->input), 0, 0, 1, tbl->inputwidth, 0)) STACK_ERROR;

	cmp	DWORD PTR _name$[ebp], 0
	je	SHORT $L73391
	mov	ecx, DWORD PTR _name$[ebp]
	mov	edx, DWORD PTR [ecx+4]
	mov	DWORD PTR -124+[ebp], edx
	jmp	SHORT $L73392
$L73391:
	mov	DWORD PTR -124+[ebp], 0
$L73392:
	cmp	DWORD PTR _name$[ebp], 0
	je	SHORT $L73393
	mov	eax, DWORD PTR _name$[ebp]
	add	eax, 8
	mov	DWORD PTR -128+[ebp], eax
	jmp	SHORT $L73394
$L73393:
	mov	DWORD PTR -128+[ebp], 0
$L73394:
	push	0
	mov	ecx, DWORD PTR _tbl$[ebp]
	mov	edx, DWORD PTR [ecx+136]
	push	edx
	push	1
	push	0
	push	0
	mov	eax, DWORD PTR _tbl$[ebp]
	mov	ecx, DWORD PTR [eax+100]
	push	ecx
	call	_strlen
	add	esp, 4
	push	eax
	mov	edx, DWORD PTR _tbl$[ebp]
	mov	eax, DWORD PTR [edx+100]
	push	eax
	mov	ecx, DWORD PTR -124+[ebp]
	push	ecx
	mov	edx, DWORD PTR -128+[ebp]
	push	edx
	mov	eax, DWORD PTR _cntxt$[ebp]
	push	eax
	call	_put_html_text_input
	add	esp, 40					; 00000028H
	test	eax, eax
	je	SHORT $L71367
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 902		; 00000386H
	jmp	$eva_err$71255
$L71367:

; 903  : 	if(ctrl_cgi_name(cntxt, ctrl, NULL, 0, &name, 'B', DYNBUF_VAL_SZ(subfield))) RETURN_ERR_MEMORY;

	cmp	DWORD PTR _subfield$[ebp], 0
	je	SHORT $L73395
	mov	edx, DWORD PTR _subfield$[ebp]
	mov	eax, DWORD PTR [edx+4]
	mov	DWORD PTR -132+[ebp], eax
	jmp	SHORT $L73396
$L73395:
	mov	DWORD PTR -132+[ebp], 0
$L73396:
	cmp	DWORD PTR _subfield$[ebp], 0
	je	SHORT $L73397
	mov	ecx, DWORD PTR _subfield$[ebp]
	add	ecx, 8
	mov	DWORD PTR -136+[ebp], ecx
	jmp	SHORT $L73398
$L73397:
	mov	DWORD PTR -136+[ebp], 0
$L73398:
	mov	edx, DWORD PTR -132+[ebp]
	push	edx
	mov	eax, DWORD PTR -136+[ebp]
	push	eax
	push	66					; 00000042H
	lea	ecx, DWORD PTR _name$[ebp]
	push	ecx
	push	0
	push	0
	mov	edx, DWORD PTR _ctrl$[ebp]
	push	edx
	mov	eax, DWORD PTR _cntxt$[ebp]
	push	eax
	call	_ctrl_cgi_name
	add	esp, 32					; 00000020H
	test	eax, eax
	je	SHORT $L71370
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29872], OFFSET FLAT:$SG71372
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 903		; 00000387H
	jmp	$eva_err$71255
$L71370:

; 904  : 	if(put_html_button(cntxt, name->data, "Ok", NULL, NULL, tooltip->data, 0, 0)) STACK_ERROR;

	push	0
	push	0
	push	0
	push	0
	push	0
	mov	eax, DWORD PTR _tooltip$[ebp]
	add	eax, 8
	push	eax
	push	0
	push	0
	push	OFFSET FLAT:$SG71377
	mov	ecx, DWORD PTR _name$[ebp]
	add	ecx, 8
	push	ecx
	mov	edx, DWORD PTR _cntxt$[ebp]
	push	edx
	call	_put_html_button_sz
	add	esp, 44					; 0000002cH
	test	eax, eax
	je	SHORT $L71376
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 904		; 00000388H
	jmp	$eva_err$71255
$L71376:

; 905  : 	for(i = 0; i < tbl->cgiinput.nbrows; i++) cgi_value_setkeep(cntxt, &tbl->cgiinput, i, 1);

	mov	DWORD PTR _i$[ebp], 0
	jmp	SHORT $L71378
$L71379:
	mov	ecx, DWORD PTR _i$[ebp]
	add	ecx, 1
	mov	DWORD PTR _i$[ebp], ecx
$L71378:
	mov	edx, DWORD PTR _tbl$[ebp]
	mov	eax, DWORD PTR _i$[ebp]
	cmp	eax, DWORD PTR [edx+80]
	jae	SHORT $L71380
	push	1
	mov	ecx, DWORD PTR _i$[ebp]
	push	ecx
	mov	edx, DWORD PTR _tbl$[ebp]
	add	edx, 80					; 00000050H
	push	edx
	mov	eax, DWORD PTR _cntxt$[ebp]
	push	eax
	call	_cgi_value_setkeep
	add	esp, 16					; 00000010H
	jmp	SHORT $L71379
$L71380:

; 906  : 
; 907  : 	/* Output exact search button if applicable */
; 908  : 	if(tbl->status & TblCtrl_opensearch &&
; 909  : 		*tbl->input && (!srchcol1 ||(
; 910  : 						strncmp(dyntab_val(&tbl->format, srchcol1, 0), add_sz_str("_EVA_DATE")) &&
; 911  : 						strcmp(dyntab_val(&tbl->format, srchcol1, 0), "_EVA_AGE"))))

	mov	ecx, DWORD PTR _tbl$[ebp]
	mov	edx, DWORD PTR [ecx+32]
	and	edx, 32					; 00000020H
	test	edx, edx
	je	$L71412
	mov	eax, DWORD PTR _tbl$[ebp]
	mov	ecx, DWORD PTR [eax+100]
	movsx	edx, BYTE PTR [ecx]
	test	edx, edx
	je	$L71412
	cmp	DWORD PTR _srchcol1$[ebp], 0
	je	SHORT $L71382
	push	9
	push	OFFSET FLAT:$SG71383
	push	0
	mov	eax, DWORD PTR _srchcol1$[ebp]
	push	eax
	mov	ecx, DWORD PTR _tbl$[ebp]
	add	ecx, 400				; 00000190H
	push	ecx
	call	_dyntab_val
	add	esp, 12					; 0000000cH
	push	eax
	call	_strncmp
	add	esp, 12					; 0000000cH
	test	eax, eax
	je	$L71412
	push	OFFSET FLAT:$SG71384
	push	0
	mov	edx, DWORD PTR _srchcol1$[ebp]
	push	edx
	mov	eax, DWORD PTR _tbl$[ebp]
	add	eax, 400				; 00000190H
	push	eax
	call	_dyntab_val
	add	esp, 12					; 0000000cH
	push	eax
	call	_strcmp
	add	esp, 8
	test	eax, eax
	je	$L71412
$L71382:

; 913  : 		if(tbl->srchmode == Exact)

	mov	ecx, DWORD PTR _tbl$[ebp]
	cmp	DWORD PTR [ecx+72], 6
	jne	$L71385

; 915  : 			CTRL_CGINAMEBTN(&name, NULL, add_sz_str("SEARCHBEGIN"));

	push	11					; 0000000bH
	push	OFFSET FLAT:$SG71388
	push	66					; 00000042H
	lea	edx, DWORD PTR _name$[ebp]
	push	edx
	push	1
	push	0
	mov	eax, DWORD PTR _ctrl$[ebp]
	push	eax
	mov	ecx, DWORD PTR _cntxt$[ebp]
	push	ecx
	call	_ctrl_cgi_name
	add	esp, 32					; 00000020H
	test	eax, eax
	je	SHORT $L71387
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 915		; 00000393H
	jmp	$eva_err$71255
$L71387:

; 916  : 			if(put_html_button(cntxt, name->data, NULL, "_eva_srchmode_exact.gif", "_eva_srchmode_begin.gif",
; 917  : 									"Augmente le nombre de réponses en recherchant les valeurs qui commencent par les mots donnés", 0, 4)) STACK_ERROR;

	push	4
	push	0
	push	0
	push	0
	push	0
	push	OFFSET FLAT:$SG71392
	push	OFFSET FLAT:$SG71393
	push	OFFSET FLAT:$SG71394
	push	0
	mov	eax, DWORD PTR _name$[ebp]
	add	eax, 8
	push	eax
	mov	ecx, DWORD PTR _cntxt$[ebp]
	push	ecx
	call	_put_html_button_sz
	add	esp, 44					; 0000002cH
	test	eax, eax
	je	SHORT $L71391
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 917		; 00000395H
	jmp	$eva_err$71255
$L71391:

; 919  : 		else if(tbl->srchmode == Begin)

	jmp	$L71412
$L71385:
	mov	eax, DWORD PTR _tbl$[ebp]
	cmp	DWORD PTR [eax+72], 13			; 0000000dH
	jne	SHORT $L71396

; 921  : 			CTRL_CGINAMEBTN(&name, NULL, add_sz_str("SEARCHCONTAIN"));

	push	13					; 0000000dH
	push	OFFSET FLAT:$SG71399
	push	66					; 00000042H
	lea	ecx, DWORD PTR _name$[ebp]
	push	ecx
	push	1
	push	0
	mov	edx, DWORD PTR _ctrl$[ebp]
	push	edx
	mov	eax, DWORD PTR _cntxt$[ebp]
	push	eax
	call	_ctrl_cgi_name
	add	esp, 32					; 00000020H
	test	eax, eax
	je	SHORT $L71398
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 921		; 00000399H
	jmp	$eva_err$71255
$L71398:

; 922  : 			if(put_html_button(cntxt, name->data, NULL, "_eva_srchmode_begin.gif", "_eva_srchmode_contain.gif",
; 923  : 									"Augmente le nombre de réponses en recherchant les valeurs qui contiennent les mots donnés", 0, 4)) STACK_ERROR;

	push	4
	push	0
	push	0
	push	0
	push	0
	push	OFFSET FLAT:$SG71403
	push	OFFSET FLAT:$SG71404
	push	OFFSET FLAT:$SG71405
	push	0
	mov	edx, DWORD PTR _name$[ebp]
	add	edx, 8
	push	edx
	mov	eax, DWORD PTR _cntxt$[ebp]
	push	eax
	call	_put_html_button_sz
	add	esp, 44					; 0000002cH
	test	eax, eax
	je	SHORT $L71402
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 923		; 0000039bH
	jmp	$eva_err$71255
$L71402:

; 925  : 		else

	jmp	SHORT $L71412
$L71396:

; 927  : 			CTRL_CGINAMEBTN(&name, NULL, add_sz_str("SEARCHEXACT"));

	push	11					; 0000000bH
	push	OFFSET FLAT:$SG71409
	push	66					; 00000042H
	lea	edx, DWORD PTR _name$[ebp]
	push	edx
	push	1
	push	0
	mov	eax, DWORD PTR _ctrl$[ebp]
	push	eax
	mov	ecx, DWORD PTR _cntxt$[ebp]
	push	ecx
	call	_ctrl_cgi_name
	add	esp, 32					; 00000020H
	test	eax, eax
	je	SHORT $L71408
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 927		; 0000039fH
	jmp	$eva_err$71255
$L71408:

; 928  : 			if(put_html_button(cntxt, name->data, NULL, "_eva_srchmode_contain.gif", "_eva_srchmode_exact.gif",
; 929  : 									"Diminue le nombre de réponses en recherchant exactement les mots donnés", 0, 4)) STACK_ERROR;

	push	4
	push	0
	push	0
	push	0
	push	0
	push	OFFSET FLAT:$SG71413
	push	OFFSET FLAT:$SG71414
	push	OFFSET FLAT:$SG71415
	push	0
	mov	eax, DWORD PTR _name$[ebp]
	add	eax, 8
	push	eax
	mov	ecx, DWORD PTR _cntxt$[ebp]
	push	ecx
	call	_put_html_button_sz
	add	esp, 44					; 0000002cH
	test	eax, eax
	je	SHORT $L71412
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 929		; 000003a1H
	jmp	SHORT $eva_err$71255
$L71412:

; 932  : 
; 933  : 	if(blabel) DYNBUF_ADD_STR(html, "</td>");

	cmp	DWORD PTR _blabel$[ebp], 0
	je	SHORT $L71418
	push	0
	push	0
	push	5
	push	OFFSET FLAT:$SG71419
	mov	eax, DWORD PTR _html$[ebp]
	push	eax
	call	_dynbuf_add
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L71418
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29872], OFFSET FLAT:$SG71421
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 933		; 000003a5H
	jmp	SHORT $eva_err$71255
$L71418:
$eva_noerr$71248:

; 934  : 
; 935  : 	RETURN_OK_CLEANUP;

	push	0
	push	OFFSET FLAT:$SG71422
	push	OFFSET FLAT:$SG71423
	mov	eax, DWORD PTR _cntxt$[ebp]
	push	eax
	call	_err_clear
	add	esp, 16					; 00000010H
$eva_err$71255:
	mov	ecx, DWORD PTR _cntxt$[ebp]
	cmp	DWORD PTR [ecx+29872], 0
	je	SHORT $L71424
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	eax, DWORD PTR [edx+29900]
	push	eax
	push	OFFSET FLAT:$SG71425
	push	OFFSET FLAT:$SG71426
	mov	ecx, DWORD PTR _cntxt$[ebp]
	push	ecx
	call	_err_add_context
	add	esp, 16					; 00000010H
$L71424:
	lea	edx, DWORD PTR _cgival$[ebp]
	push	edx
	call	_dyntab_free
	add	esp, 4
	mov	eax, DWORD PTR _name$[ebp]
	push	eax
	call	_mem_free
	add	esp, 4
	mov	DWORD PTR _name$[ebp], 0
	mov	ecx, DWORD PTR _label$[ebp]
	push	ecx
	call	_mem_free
	add	esp, 4
	mov	DWORD PTR _label$[ebp], 0
	mov	edx, DWORD PTR _tooltip$[ebp]
	push	edx
	call	_mem_free
	add	esp, 4
	mov	DWORD PTR _tooltip$[ebp], 0
	mov	eax, DWORD PTR _subfield$[ebp]
	push	eax
	call	_mem_free
	add	esp, 4
	mov	DWORD PTR _subfield$[ebp], 0
	mov	ecx, DWORD PTR _cntxt$[ebp]
	xor	eax, eax
	cmp	DWORD PTR [ecx+29872], 0
	setne	al
$L71224:

; 936  : }

	mov	esp, ebp
	pop	ebp
	ret	0
_table_put_search_input ENDP
_TEXT	ENDS
PUBLIC	_table_put_filter_list
EXTRN	_put_html_list:NEAR
EXTRN	_get_id_value:NEAR
EXTRN	_qry_obj_idfield:NEAR
EXTRN	_cgi_get_subfield:NEAR
_BSS	SEGMENT
	ALIGN	4

$SG71460 DB	01H DUP (?)
_BSS	ENDS
_DATA	SEGMENT
	ORG $+1
$SG71455 DB	'Pas de filtre', 00H
	ORG $+2
$SG71457 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG71462 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG71463 DB	'_EVA_LABEL', 00H
	ORG $+1
$SG71472 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG71475 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG71482 DB	'SELFILTER', 00H
	ORG $+2
$SG71485 DB	'SELFILTER', 00H
	ORG $+2
$SG71490 DB	'<td align=right valign=middle>&nbsp;Filtrer</td><td vali'
	DB	'gn=middle>', 00H
	ORG $+1
$SG71492 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG71498 DB	'</td>', 00H
	ORG $+2
$SG71500 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG71501 DB	'D:\Travail\ABI\EVA\V4.0\CGI\Brunix-2016\table_utils.c', 00H
	ORG $+2
$SG71502 DB	'table_put_filter_list', 00H
	ORG $+2
$SG71504 DB	'D:\Travail\ABI\EVA\V4.0\CGI\Brunix-2016\table_utils.c', 00H
	ORG $+2
$SG71505 DB	'table_put_filter_list', 00H
_DATA	ENDS
_TEXT	SEGMENT
_cntxt$ = 8
_i_ctrl$ = 12
_b_label$ = 16
_form$ = -4
_ctrl$ = -96
_tbl$ = -36
_name$ = -72
_optlist$ = -92
_data$ = -32
_cgival$ = -68
_val_LABEL$ = -44
_i$ = -48
_row$ = -8
_blabel$ = -40
_html$ = -12
_table_put_filter_list PROC NEAR

; 954  : ){

	push	ebp
	mov	ebp, esp
	sub	esp, 108				; 0000006cH

; 955  : 	EVA_form *form = cntxt->form;

	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	ecx, DWORD PTR [eax+80]
	mov	DWORD PTR _form$[ebp], ecx

; 956  : 	EVA_ctrl *ctrl = form->ctrl + i_ctrl;

	mov	edx, DWORD PTR _i_ctrl$[ebp]
	imul	edx, 480				; 000001e0H
	mov	eax, DWORD PTR _form$[ebp]
	mov	ecx, DWORD PTR [eax]
	add	ecx, edx
	mov	DWORD PTR _ctrl$[ebp], ecx

; 957  : 	ObjTableFormat *tbl = ctrl->objtbl;

	mov	edx, DWORD PTR _ctrl$[ebp]
	mov	eax, DWORD PTR [edx+232]
	mov	DWORD PTR _tbl$[ebp], eax

; 958  : 	DynBuffer *name = NULL;

	mov	DWORD PTR _name$[ebp], 0

; 959  : 	DynTable optlist = { 0 };

	mov	DWORD PTR _optlist$[ebp], 0
	xor	ecx, ecx
	mov	DWORD PTR _optlist$[ebp+4], ecx
	mov	DWORD PTR _optlist$[ebp+8], ecx
	mov	DWORD PTR _optlist$[ebp+12], ecx
	mov	DWORD PTR _optlist$[ebp+16], ecx

; 960  : 	DynTable data = { 0 };

	mov	DWORD PTR _data$[ebp], 0
	xor	edx, edx
	mov	DWORD PTR _data$[ebp+4], edx
	mov	DWORD PTR _data$[ebp+8], edx
	mov	DWORD PTR _data$[ebp+12], edx
	mov	DWORD PTR _data$[ebp+16], edx

; 961  : 	DynTable cgival = { 0 };

	mov	DWORD PTR _cgival$[ebp], 0
	xor	eax, eax
	mov	DWORD PTR _cgival$[ebp+4], eax
	mov	DWORD PTR _cgival$[ebp+8], eax
	mov	DWORD PTR _cgival$[ebp+12], eax
	mov	DWORD PTR _cgival$[ebp+16], eax

; 962  : 	unsigned long val_LABEL;
; 963  : 	unsigned long i, row = 0;

	mov	DWORD PTR _row$[ebp], 0

; 964  : 	int blabel = !b_label || *b_label;

	cmp	DWORD PTR _b_label$[ebp], 0
	je	SHORT $L73400
	mov	ecx, DWORD PTR _b_label$[ebp]
	cmp	DWORD PTR [ecx], 0
	jne	SHORT $L73400
	mov	DWORD PTR -100+[ebp], 0
	jmp	SHORT $L73401
$L73400:
	mov	DWORD PTR -100+[ebp], 1
$L73401:
	mov	edx, DWORD PTR -100+[ebp]
	mov	DWORD PTR _blabel$[ebp], edx

; 965  : 	CHECK_HTML_STATUS;

	cmp	DWORD PTR _cntxt$[ebp], 0
	je	SHORT $L73404
	mov	eax, DWORD PTR _cntxt$[ebp]
	cmp	DWORD PTR [eax+80], 0
	je	SHORT $L73402
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	edx, DWORD PTR [ecx+80]
	mov	eax, DWORD PTR [edx+232]
	mov	DWORD PTR -104+[ebp], eax
	jmp	SHORT $L73403
$L73402:
	mov	DWORD PTR -104+[ebp], 0
$L73403:
	mov	ecx, DWORD PTR -104+[ebp]
	mov	DWORD PTR -108+[ebp], ecx
	jmp	SHORT $L73405
$L73404:
	mov	DWORD PTR -108+[ebp], 0
$L73405:
	mov	edx, DWORD PTR -108+[ebp]
	mov	DWORD PTR _html$[ebp], edx
	cmp	DWORD PTR _html$[ebp], 0
	jne	SHORT $L71452
	xor	eax, eax
	jmp	$L71436
$L71452:

; 966  : 	if(b_label) *b_label = 0;

	cmp	DWORD PTR _b_label$[ebp], 0
	je	SHORT $L71453
	mov	eax, DWORD PTR _b_label$[ebp]
	mov	DWORD PTR [eax], 0
$L71453:

; 967  : 
; 968  : 	/* Get filters selected by user & prepare list of user selectable filters */
; 969  : 	DYNTAB_SET(&optlist, 0, 1, "Pas de filtre");

	push	13					; 0000000dH
	push	OFFSET FLAT:$SG71455
	push	1
	push	0
	lea	ecx, DWORD PTR _optlist$[ebp]
	push	ecx
	call	_dyntab_set_txt
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L71454
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29872], OFFSET FLAT:$SG71457
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 969		; 000003c9H
	jmp	$eva_err$71458
$L71454:

; 970  : 	DYNTAB_SET(&optlist, 0, 0, "");

	push	0
	push	OFFSET FLAT:$SG71460
	push	0
	push	0
	lea	ecx, DWORD PTR _optlist$[ebp]
	push	ecx
	call	_dyntab_set_txt
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L71459
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29872], OFFSET FLAT:$SG71462
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 970		; 000003caH
	jmp	$eva_err$71458
$L71459:

; 971  : 	val_LABEL = get_id_value(cntxt, add_sz_str("_EVA_LABEL"));

	push	10					; 0000000aH
	push	OFFSET FLAT:$SG71463
	mov	ecx, DWORD PTR _cntxt$[ebp]
	push	ecx
	call	_get_id_value
	add	esp, 12					; 0000000cH
	mov	DWORD PTR _val_LABEL$[ebp], eax

; 972  : 	for(i = 0; i < tbl->altfilter.nbrows; i++) if(!dyntab_sz(&tbl->typfilter, i, 0))

	mov	DWORD PTR _i$[ebp], 0
	jmp	SHORT $L71464
$L71465:
	mov	edx, DWORD PTR _i$[ebp]
	add	edx, 1
	mov	DWORD PTR _i$[ebp], edx
$L71464:
	mov	eax, DWORD PTR _tbl$[ebp]
	mov	ecx, DWORD PTR _i$[ebp]
	cmp	ecx, DWORD PTR [eax+260]
	jae	$L71466
	push	0
	mov	edx, DWORD PTR _i$[ebp]
	push	edx
	mov	eax, DWORD PTR _tbl$[ebp]
	add	eax, 280				; 00000118H
	push	eax
	call	_dyntab_sz
	add	esp, 12					; 0000000cH
	test	eax, eax
	jne	$L71473

; 974  : 		row = optlist.nbrows;

	mov	ecx, DWORD PTR _optlist$[ebp]
	mov	DWORD PTR _row$[ebp], ecx

; 975  : 		if(qry_obj_idfield(cntxt, &data, DYNTAB_TOULRC(&tbl->altfilter, i, 0), val_LABEL)) STACK_ERROR;

	mov	edx, DWORD PTR _val_LABEL$[ebp]
	push	edx
	push	10					; 0000000aH
	push	0
	push	0
	mov	eax, DWORD PTR _i$[ebp]
	push	eax
	mov	ecx, DWORD PTR _tbl$[ebp]
	add	ecx, 260				; 00000104H
	push	ecx
	call	_dyntab_val
	add	esp, 12					; 0000000cH
	push	eax
	call	_strtoul
	add	esp, 12					; 0000000cH
	push	eax
	lea	edx, DWORD PTR _data$[ebp]
	push	edx
	mov	eax, DWORD PTR _cntxt$[ebp]
	push	eax
	call	_qry_obj_idfield
	add	esp, 16					; 00000010H
	test	eax, eax
	je	SHORT $L71469
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 975		; 000003cfH
	jmp	$eva_err$71458
$L71469:

; 976  : 		DYNTAB_ADD_CELL(&optlist, row, 1, &data, 0, 0);

	push	1
	push	0
	push	0
	lea	edx, DWORD PTR _data$[ebp]
	push	edx
	call	_dyntab_cell
	add	esp, 12					; 0000000cH
	push	eax
	push	1
	mov	eax, DWORD PTR _row$[ebp]
	push	eax
	lea	ecx, DWORD PTR _optlist$[ebp]
	push	ecx
	call	_dyntab_copy
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L71470
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29872], OFFSET FLAT:$SG71472
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 976		; 000003d0H
	jmp	$eva_err$71458
$L71470:

; 977  : 		DYNTAB_ADD_CELL(&optlist, row, 0, &tbl->altfilter, i, 0);

	push	1
	push	0
	mov	ecx, DWORD PTR _i$[ebp]
	push	ecx
	mov	edx, DWORD PTR _tbl$[ebp]
	add	edx, 260				; 00000104H
	push	edx
	call	_dyntab_cell
	add	esp, 12					; 0000000cH
	push	eax
	push	0
	mov	eax, DWORD PTR _row$[ebp]
	push	eax
	lea	ecx, DWORD PTR _optlist$[ebp]
	push	ecx
	call	_dyntab_copy
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L71473
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29872], OFFSET FLAT:$SG71475
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 977		; 000003d1H
	jmp	$eva_err$71458
$L71473:

; 979  : 
; 980  : 	/* Return if list must not be output */
; 981  : 	if(!tbl->altfilter.nbrows ||

	jmp	$L71465
$L71466:

; 982  : 		(!(tbl->status & TblCtrl_opensel) && tbl->status & TblCtrl_sel) ||
; 983  : 		(!tbl->idobj.nbrows && !tbl->selfilter.nbrows) ||
; 984  : 		optlist.nbrows < 2) RETURN_OK;

	mov	ecx, DWORD PTR _tbl$[ebp]
	cmp	DWORD PTR [ecx+260], 0
	je	SHORT $L71477
	mov	edx, DWORD PTR _tbl$[ebp]
	mov	eax, DWORD PTR [edx+32]
	and	eax, 512				; 00000200H
	test	eax, eax
	jne	SHORT $L71478
	mov	ecx, DWORD PTR _tbl$[ebp]
	mov	edx, DWORD PTR [ecx+32]
	and	edx, 256				; 00000100H
	test	edx, edx
	jne	SHORT $L71477
$L71478:
	mov	eax, DWORD PTR _tbl$[ebp]
	cmp	DWORD PTR [eax+184], 0
	jne	SHORT $L71479
	mov	ecx, DWORD PTR _tbl$[ebp]
	cmp	DWORD PTR [ecx+340], 0
	je	SHORT $L71477
$L71479:
	cmp	DWORD PTR _optlist$[ebp], 2
	jae	SHORT $L71476
$L71477:
	jmp	$eva_noerr$71480
$L71476:

; 985  : 
; 986  : 	/* Output filters list */
; 987  : 	CTRL_GET_CGI_SUBFIELD("SELFILTER")

	push	0
	push	0
	push	0
	push	OFFSET FLAT:$SG71482
	mov	edx, DWORD PTR _ctrl$[ebp]
	push	edx
	lea	eax, DWORD PTR _cgival$[ebp]
	push	eax
	mov	ecx, DWORD PTR _cntxt$[ebp]
	push	ecx
	call	_cgi_get_subfield
	add	esp, 28					; 0000001cH
	test	eax, eax
	je	SHORT $L71481
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 987		; 000003dbH
	jmp	$eva_err$71458
$L71481:

; 988  : 	CTRL_CGINAMESUBFIELD(&name, NULL, "SELFILTER");

	push	9
	push	OFFSET FLAT:$SG71485
	push	68					; 00000044H
	lea	eax, DWORD PTR _name$[ebp]
	push	eax
	push	1
	push	0
	mov	ecx, DWORD PTR _ctrl$[ebp]
	push	ecx
	mov	edx, DWORD PTR _cntxt$[ebp]
	push	edx
	call	_ctrl_cgi_name
	add	esp, 32					; 00000020H
	test	eax, eax
	je	SHORT $L71484
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 988		; 000003dcH
	jmp	$eva_err$71458
$L71484:

; 989  : 	if(b_label) *b_label = 1;

	cmp	DWORD PTR _b_label$[ebp], 0
	je	SHORT $L71486
	mov	ecx, DWORD PTR _b_label$[ebp]
	mov	DWORD PTR [ecx], 1
$L71486:

; 990  : 	if(blabel) DYNBUF_ADD_STR(html, "<td align=right valign=middle>&nbsp;Filtrer</td><td valign=middle>");

	cmp	DWORD PTR _blabel$[ebp], 0
	je	SHORT $L71489
	push	0
	push	0
	push	66					; 00000042H
	push	OFFSET FLAT:$SG71490
	mov	edx, DWORD PTR _html$[ebp]
	push	edx
	call	_dynbuf_add
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L71489
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29872], OFFSET FLAT:$SG71492
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 990		; 000003deH
	jmp	$eva_err$71458
$L71489:

; 991  : 	if(put_html_list(cntxt, name, &optlist, &tbl->selfilter, 1, 0, 0, 1, 1, NULL)) STACK_ERROR;

	push	0
	push	1
	push	1
	push	0
	push	0
	push	1
	mov	edx, DWORD PTR _tbl$[ebp]
	add	edx, 340				; 00000154H
	push	edx
	lea	eax, DWORD PTR _optlist$[ebp]
	push	eax
	mov	ecx, DWORD PTR _name$[ebp]
	push	ecx
	mov	edx, DWORD PTR _cntxt$[ebp]
	push	edx
	call	_put_html_list
	add	esp, 40					; 00000028H
	test	eax, eax
	je	SHORT $L71494
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 991		; 000003dfH
	jmp	SHORT $eva_err$71458
$L71494:

; 992  : 	if(blabel) DYNBUF_ADD_STR(html, "</td>");

	cmp	DWORD PTR _blabel$[ebp], 0
	je	SHORT $L71497
	push	0
	push	0
	push	5
	push	OFFSET FLAT:$SG71498
	mov	ecx, DWORD PTR _html$[ebp]
	push	ecx
	call	_dynbuf_add
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L71497
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29872], OFFSET FLAT:$SG71500
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 992		; 000003e0H
	jmp	SHORT $eva_err$71458
$L71497:
$eva_noerr$71480:

; 993  : 
; 994  : 	RETURN_OK_CLEANUP;

	push	0
	push	OFFSET FLAT:$SG71501
	push	OFFSET FLAT:$SG71502
	mov	ecx, DWORD PTR _cntxt$[ebp]
	push	ecx
	call	_err_clear
	add	esp, 16					; 00000010H
$eva_err$71458:
	mov	edx, DWORD PTR _cntxt$[ebp]
	cmp	DWORD PTR [edx+29872], 0
	je	SHORT $L71503
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	ecx, DWORD PTR [eax+29900]
	push	ecx
	push	OFFSET FLAT:$SG71504
	push	OFFSET FLAT:$SG71505
	mov	edx, DWORD PTR _cntxt$[ebp]
	push	edx
	call	_err_add_context
	add	esp, 16					; 00000010H
$L71503:
	mov	eax, DWORD PTR _name$[ebp]
	push	eax
	call	_mem_free
	add	esp, 4
	mov	DWORD PTR _name$[ebp], 0
	lea	ecx, DWORD PTR _optlist$[ebp]
	push	ecx
	call	_dyntab_free
	add	esp, 4
	lea	edx, DWORD PTR _data$[ebp]
	push	edx
	call	_dyntab_free
	add	esp, 4
	lea	eax, DWORD PTR _cgival$[ebp]
	push	eax
	call	_dyntab_free
	add	esp, 4
	mov	ecx, DWORD PTR _cntxt$[ebp]
	xor	eax, eax
	cmp	DWORD PTR [ecx+29872], 0
	setne	al
$L71436:

; 995  : }

	mov	esp, ebp
	pop	ebp
	ret	0
_table_put_filter_list ENDP
_TEXT	ENDS
PUBLIC	_table_put_page_navigator
EXTRN	_put_html_img:NEAR
EXTRN	_plain_to_html:BYTE
EXTRN	_dynbuf_add_int:NEAR
_BSS	SEGMENT
	ALIGN	4

$SG71524 DB	01H DUP (?)
	ALIGN	4

$SG71529 DB	01H DUP (?)
	ALIGN	4

$SG71614 DB	01H DUP (?)
	ALIGN	4

$SG71621 DB	01H DUP (?)
_BSS	ENDS
_DATA	SEGMENT
	ORG $+2
$SG71528 DB	'_EVA_PAGE_CTRL', 00H
	ORG $+1
$SG71541 DB	' -->', 0aH, 00H
	ORG $+2
$SG71542 DB	0aH, '<!--- Start TablePageNavigator ', 00H
	ORG $+3
$SG71544 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG71547 DB	'_EVA_INPUT', 00H
	ORG $+1
$SG71550 DB	'_EVA_LABEL_NOSEL', 00H
	ORG $+3
$SG71551 DB	'fiche', 00H
	ORG $+2
$SG71555 DB	'_EVA_LABEL_NOMATCH', 00H
	ORG $+1
$SG71556 DB	'fiche', 00H
	ORG $+2
$SG71558 DB	' rules=none width=100%><tr>', 00H
$SG71559 DB	'<td colspan=99><table cellspacing=0 cellpadding=0 border'
	DB	'=', 00H
	ORG $+2
$SG71561 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG71565 DB	'<td>', 00H
	ORG $+3
$SG71567 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG71573 DB	'La liste n''affiche pas toutes les fiches', 0aH, 'Utilis'
	DB	'ez les boutons ', 0e0H, ' droite pour changer de page ou le n'
	DB	'ombre de fiches par page', 00H
$SG71574 DB	'_eva_morepage.gif', 00H
	ORG $+2
$SG71577 DB	'</td>', 00H
	ORG $+2
$SG71579 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG71584 DB	'<td><font size=-1><b><nobr>', 00H
$SG71586 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG71596 DB	'?', 00H
	ORG $+2
$SG71598 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG71601 DB	' car)', 00H
	ORG $+2
$SG71602 DB	' (', 00H
	ORG $+1
$SG71604 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG71610 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG71615 DB	'0 ', 00H
	ORG $+1
$SG71617 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG71622 DB	'1 ', 00H
	ORG $+1
$SG71624 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG71628 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG71631 DB	' ', 00H
	ORG $+2
$SG71633 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG71637 DB	's', 00H
	ORG $+2
$SG71638 DB	' ', 00H
	ORG $+2
$SG71640 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG71643 DB	' / ', 00H
$SG71644 DB	' -</nobr> <nobr>page ', 00H
	ORG $+2
$SG71646 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG71649 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG71652 DB	'</nobr></b></font></td>', 00H
$SG71654 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG71659 DB	'<td><nobr>', 00H
	ORG $+1
$SG71661 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG71666 DB	'TOP', 00H
$SG71669 DB	'Remonte en haut de la table', 00H
$SG71670 DB	'_eva_btn_arrowl1_small_s.gif', 00H
	ORG $+3
$SG71671 DB	'_eva_btn_arrowl1_small.gif', 00H
	ORG $+1
$SG71672 DB	'D', 0e9H, 'but', 00H
	ORG $+2
$SG71676 DB	'LINEUP', 00H
	ORG $+1
$SG71679 DB	'Remonte d''une ligne dans la table', 00H
	ORG $+2
$SG71680 DB	'_eva_btn_arrowl_small_s.gif', 00H
$SG71681 DB	'_eva_btn_arrowl_small.gif', 00H
	ORG $+2
$SG71682 DB	'Ligne pr', 0e9H, 'c', 0e9H, 'dente', 00H
	ORG $+3
$SG71685 DB	'PAGEUP', 00H
	ORG $+1
$SG71688 DB	'Remonte d''une page dans la table', 00H
	ORG $+3
$SG71689 DB	'_eva_pgprev_s.gif', 00H
	ORG $+2
$SG71690 DB	'_eva_pgprv_s.gif', 00H
	ORG $+3
$SG71691 DB	'_eva_pgprev.gif', 00H
$SG71692 DB	'_eva_pgprv.gif', 00H
	ORG $+1
$SG71693 DB	'Page pr', 0e9H, 'c', 0e9H, 'dente', 00H
$SG71700 DB	'Page pr', 0e9H, 'c', 0e9H, 'dente d', 0e9H, 'sactiv', 0e9H
	DB	'e : d', 0e9H, 'but de liste', 00H
$SG71701 DB	'_eva_pgprev_d.gif', 00H
	ORG $+2
$SG71702 DB	'_eva_pgprv_d.gif', 00H
	ORG $+3
$SG71706 DB	'</nobr> <nobr>', 00H
	ORG $+1
$SG71708 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG71712 DB	'PAGEDOWN', 00H
	ORG $+3
$SG71715 DB	'Descend d''une page dans la table', 00H
	ORG $+3
$SG71716 DB	'_eva_pgnext_s.gif', 00H
	ORG $+2
$SG71717 DB	'_eva_pgnxt_s.gif', 00H
	ORG $+3
$SG71718 DB	'_eva_pgnext.gif', 00H
$SG71719 DB	'_eva_pgnxt.gif', 00H
	ORG $+1
$SG71720 DB	'Page suivante', 00H
	ORG $+2
$SG71724 DB	'LINEDOWN', 00H
	ORG $+3
$SG71727 DB	'Descend d''une ligne dans la table', 00H
	ORG $+2
$SG71728 DB	'_eva_btn_arrowr_small_s.gif', 00H
$SG71729 DB	'_eva_btn_arrowr_small.gif', 00H
	ORG $+2
$SG71730 DB	'Ligne suivante', 00H
	ORG $+1
$SG71734 DB	'BOTTOM', 00H
	ORG $+1
$SG71737 DB	'Descend en bas de la table', 00H
	ORG $+1
$SG71738 DB	'_eva_btn_arrowr1_small_s.gif', 00H
	ORG $+3
$SG71739 DB	'_eva_btn_arrowr1_small.gif', 00H
	ORG $+1
$SG71740 DB	'Fin', 00H
$SG71747 DB	'Page suivante d', 0e9H, 'sactiv', 0e9H, 'e : fin de list'
	DB	'e', 00H
$SG71748 DB	'_eva_pgnext_d.gif', 00H
	ORG $+2
$SG71749 DB	'_eva_pgnxt_d.gif', 00H
	ORG $+3
$SG71752 DB	'</nobr></td>', 00H
	ORG $+3
$SG71754 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG71760 DB	'<td align=right>', 00H
	ORG $+3
$SG71762 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG71766 DB	'SHRINK', 00H
	ORG $+1
$SG71770 DB	'R', 0e9H, 'duit le nombre de lignes affich', 0e9H, 'es', 00H
	ORG $+3
$SG71771 DB	'_eva_btn_shrink_s.gif', 00H
	ORG $+2
$SG71772 DB	'_eva_btn_shrink.gif', 00H
$SG71777 DB	'PAGESIZE=2', 00H
	ORG $+1
$SG71781 DB	'2 lignes affich', 0e9H, 'es par page', 00H
$SG71782 DB	'Affiche 2 lignes par page', 00H
	ORG $+2
$SG71783 DB	'_eva_btn_2.gif', 00H
	ORG $+1
$SG71784 DB	'_eva_btn_2_s.gif', 00H
	ORG $+3
$SG71785 DB	'_eva_btn_2_s.gif', 00H
	ORG $+3
$SG71786 DB	'_eva_btn_2.gif', 00H
	ORG $+1
$SG71789 DB	'PAGESIZE=5', 00H
	ORG $+1
$SG71793 DB	'5 lignes affich', 0e9H, 'es par page', 00H
$SG71794 DB	'Affiche 5 lignes par page', 00H
	ORG $+2
$SG71795 DB	'_eva_btn_5.gif', 00H
	ORG $+1
$SG71796 DB	'_eva_btn_5_s.gif', 00H
	ORG $+3
$SG71797 DB	'_eva_btn_5_s.gif', 00H
	ORG $+3
$SG71798 DB	'_eva_btn_5.gif', 00H
	ORG $+1
$SG71802 DB	'PAGESIZE=10', 00H
$SG71806 DB	'10 lignes affich', 0e9H, 'es par page', 00H
	ORG $+3
$SG71807 DB	'Affiche 10 lignes par page', 00H
	ORG $+1
$SG71808 DB	'_eva_btn_10.gif', 00H
$SG71809 DB	'_eva_btn_10_s.gif', 00H
	ORG $+2
$SG71810 DB	'_eva_btn_10_s.gif', 00H
	ORG $+2
$SG71811 DB	'_eva_btn_10.gif', 00H
$SG71815 DB	'PAGESIZE=30', 00H
$SG71819 DB	'30 lignes affich', 0e9H, 'es par page', 00H
	ORG $+3
$SG71820 DB	'Affiche 30 lignes par page', 00H
	ORG $+1
$SG71821 DB	'_eva_btn_30.gif', 00H
$SG71822 DB	'_eva_btn_30_s.gif', 00H
	ORG $+2
$SG71823 DB	'_eva_btn_30_s.gif', 00H
	ORG $+2
$SG71824 DB	'_eva_btn_30.gif', 00H
$SG71828 DB	'PAGESIZE=100', 00H
	ORG $+3
$SG71832 DB	'100 lignes affich', 0e9H, 'es par page', 00H
	ORG $+2
$SG71833 DB	'Affiche 100 lignes par page', 00H
$SG71834 DB	'_eva_btn_100.gif', 00H
	ORG $+3
$SG71835 DB	'_eva_btn_100_s.gif', 00H
	ORG $+1
$SG71836 DB	'_eva_btn_100_s.gif', 00H
	ORG $+1
$SG71837 DB	'_eva_btn_100.gif', 00H
	ORG $+3
$SG71841 DB	'EXPAND', 00H
	ORG $+1
$SG71845 DB	'Augmente le nombre de lignes affich', 0e9H, 'es', 00H
	ORG $+1
$SG71846 DB	'_eva_btn_expand_s.gif', 00H
	ORG $+2
$SG71847 DB	'_eva_btn_expand.gif', 00H
$SG71850 DB	'</td>', 00H
	ORG $+2
$SG71852 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG71856 DB	'</tr></table></td>', 0aH, 00H
$SG71858 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG71862 DB	' -->', 0aH, 00H
	ORG $+2
$SG71863 DB	0aH, '<!--- EndOf TablePageNavigator ', 00H
	ORG $+3
$SG71865 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG71866 DB	'D:\Travail\ABI\EVA\V4.0\CGI\Brunix-2016\table_utils.c', 00H
	ORG $+2
$SG71867 DB	'table_put_page_navigator', 00H
	ORG $+3
$SG71869 DB	'D:\Travail\ABI\EVA\V4.0\CGI\Brunix-2016\table_utils.c', 00H
	ORG $+2
$SG71870 DB	'table_put_page_navigator', 00H
_DATA	ENDS
_TEXT	SEGMENT
_cntxt$ = 8
_i_ctrl$ = 12
_options$ = 16
_form$ = -4
_ctrl$ = -44
_tbl$ = -16
_name$ = -36
_nbpages$ = -28
_page$ = -24
_counttype$ = -20
_lbl$ = -32
_txtpagectrl$ = -40
_pagectrl$ = -12
_html$ = -8
__c$71607 = -48
_table_put_page_navigator PROC NEAR

; 1010 : ){

	push	ebp
	mov	ebp, esp
	sub	esp, 176				; 000000b0H

; 1011 : 	EVA_form *form = cntxt->form;

	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	ecx, DWORD PTR [eax+80]
	mov	DWORD PTR _form$[ebp], ecx

; 1012 : 	EVA_ctrl *ctrl = form->ctrl + i_ctrl;

	mov	edx, DWORD PTR _i_ctrl$[ebp]
	imul	edx, 480				; 000001e0H
	mov	eax, DWORD PTR _form$[ebp]
	mov	ecx, DWORD PTR [eax]
	add	ecx, edx
	mov	DWORD PTR _ctrl$[ebp], ecx

; 1013 : 	ObjTableFormat *tbl = ctrl->objtbl;

	mov	edx, DWORD PTR _ctrl$[ebp]
	mov	eax, DWORD PTR [edx+232]
	mov	DWORD PTR _tbl$[ebp], eax

; 1014 : 	DynBuffer *name = NULL;

	mov	DWORD PTR _name$[ebp], 0

; 1015 : 	unsigned long nbpages = !tbl->totlines ? 1 : ((tbl->totlines - 1) / tbl->lines) + 1;

	mov	ecx, DWORD PTR _tbl$[ebp]
	cmp	DWORD PTR [ecx+52], 0
	jne	SHORT $L73407
	mov	DWORD PTR -52+[ebp], 1
	jmp	SHORT $L73408
$L73407:
	mov	edx, DWORD PTR _tbl$[ebp]
	mov	eax, DWORD PTR [edx+52]
	sub	eax, 1
	mov	ecx, DWORD PTR _tbl$[ebp]
	xor	edx, edx
	div	DWORD PTR [ecx+44]
	add	eax, 1
	mov	DWORD PTR -52+[ebp], eax
$L73408:
	mov	edx, DWORD PTR -52+[ebp]
	mov	DWORD PTR _nbpages$[ebp], edx

; 1016 : 	unsigned long page = !tbl->line ? 1 : (tbl->line + tbl->lines - 1) / tbl->lines + 1;

	mov	eax, DWORD PTR _tbl$[ebp]
	cmp	DWORD PTR [eax+40], 0
	jne	SHORT $L73409
	mov	DWORD PTR -56+[ebp], 1
	jmp	SHORT $L73410
$L73409:
	mov	ecx, DWORD PTR _tbl$[ebp]
	mov	edx, DWORD PTR [ecx+40]
	mov	eax, DWORD PTR _tbl$[ebp]
	mov	ecx, DWORD PTR [eax+44]
	lea	eax, DWORD PTR [edx+ecx-1]
	mov	ecx, DWORD PTR _tbl$[ebp]
	xor	edx, edx
	div	DWORD PTR [ecx+44]
	add	eax, 1
	mov	DWORD PTR -56+[ebp], eax
$L73410:
	mov	edx, DWORD PTR -56+[ebp]
	mov	DWORD PTR _page$[ebp], edx

; 1017 : 	char *counttype = "";

	mov	DWORD PTR _counttype$[ebp], OFFSET FLAT:$SG71524

; 1018 : 	DynTableCell *lbl = NULL;

	mov	DWORD PTR _lbl$[ebp], 0

; 1019 : 	char *txtpagectrl = CTRL_ATTR_VAL(PAGE_CTRL);

	cmp	DWORD PTR _ctrl$[ebp], 0
	je	SHORT $L73411
	push	0
	push	-1
	push	OFFSET FLAT:$SG71528
	mov	eax, DWORD PTR _ctrl$[ebp]
	add	eax, 44					; 0000002cH
	push	eax
	call	_dyntab_field_val
	add	esp, 16					; 00000010H
	mov	DWORD PTR -60+[ebp], eax
	jmp	SHORT $L73412
$L73411:
	mov	DWORD PTR -60+[ebp], OFFSET FLAT:$SG71529
$L73412:
	mov	ecx, DWORD PTR -60+[ebp]
	mov	DWORD PTR _txtpagectrl$[ebp], ecx

; 1020 : 	unsigned long pagectrl = *txtpagectrl ? strtoul(txtpagectrl, NULL, 10) : 7;

	mov	edx, DWORD PTR _txtpagectrl$[ebp]
	movsx	eax, BYTE PTR [edx]
	test	eax, eax
	je	SHORT $L73413
	push	10					; 0000000aH
	push	0
	mov	ecx, DWORD PTR _txtpagectrl$[ebp]
	push	ecx
	call	_strtoul
	add	esp, 12					; 0000000cH
	mov	DWORD PTR -64+[ebp], eax
	jmp	SHORT $L73414
$L73413:
	mov	DWORD PTR -64+[ebp], 7
$L73414:
	mov	edx, DWORD PTR -64+[ebp]
	mov	DWORD PTR _pagectrl$[ebp], edx

; 1021 : 	CHECK_HTML_STATUS;

	cmp	DWORD PTR _cntxt$[ebp], 0
	je	SHORT $L73417
	mov	eax, DWORD PTR _cntxt$[ebp]
	cmp	DWORD PTR [eax+80], 0
	je	SHORT $L73415
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	edx, DWORD PTR [ecx+80]
	mov	eax, DWORD PTR [edx+232]
	mov	DWORD PTR -68+[ebp], eax
	jmp	SHORT $L73416
$L73415:
	mov	DWORD PTR -68+[ebp], 0
$L73416:
	mov	ecx, DWORD PTR -68+[ebp]
	mov	DWORD PTR -72+[ebp], ecx
	jmp	SHORT $L73418
$L73417:
	mov	DWORD PTR -72+[ebp], 0
$L73418:
	mov	edx, DWORD PTR -72+[ebp]
	mov	DWORD PTR _html$[ebp], edx
	cmp	DWORD PTR _html$[ebp], 0
	jne	SHORT $L71535
	xor	eax, eax
	jmp	$L71515
$L71535:

; 1022 : 
; 1023 : 	/* Handle no page control */
; 1024 : 	if(!pagectrl) RETURN_OK;

	cmp	DWORD PTR _pagectrl$[ebp], 0
	jne	SHORT $L71536
	jmp	$eva_noerr$71537
$L71536:

; 1025 : 
; 1026 : 	if(cntxt->debug & DEBUG_HTML) DYNBUF_ADD3(cntxt->form->html, "\n<!--- Start TablePageNavigator ", ctrl->LABEL, 0, NO_CONV, " -->\n");

	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	ecx, DWORD PTR [eax+29860]
	and	ecx, 128				; 00000080H
	test	ecx, ecx
	je	SHORT $L71540
	push	5
	push	OFFSET FLAT:$SG71541
	push	0
	push	0
	push	0
	mov	edx, DWORD PTR _ctrl$[ebp]
	mov	eax, DWORD PTR [edx+284]
	push	eax
	push	32					; 00000020H
	push	OFFSET FLAT:$SG71542
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	edx, DWORD PTR [ecx+80]
	mov	eax, DWORD PTR [edx+232]
	push	eax
	call	_dynbuf_add3
	add	esp, 36					; 00000024H
	test	eax, eax
	je	SHORT $L71540
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29872], OFFSET FLAT:$SG71544
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 1026		; 00000402H
	jmp	$eva_err$71545
$L71540:

; 1027 : 
; 1028 : 	/* Handle search / select labels */
; 1029 : 	if(!strcmp(ctrl->CONTROL, "_EVA_INPUT") && !(tbl->status & TblCtrl_opensel))

	push	OFFSET FLAT:$SG71547
	mov	eax, DWORD PTR _ctrl$[ebp]
	mov	ecx, DWORD PTR [eax+272]
	push	ecx
	call	_strcmp
	add	esp, 8
	test	eax, eax
	jne	SHORT $L71546
	mov	edx, DWORD PTR _tbl$[ebp]
	mov	eax, DWORD PTR [edx+32]
	and	eax, 512				; 00000200H
	test	eax, eax
	jne	SHORT $L71546

; 1031 : 		lbl = !tbl->totlines ? CTRL_ATTR_CELL(LABEL_NOSEL) : NULL;

	mov	ecx, DWORD PTR _tbl$[ebp]
	cmp	DWORD PTR [ecx+52], 0
	jne	SHORT $L73421
	cmp	DWORD PTR _ctrl$[ebp], 0
	je	SHORT $L73419
	push	0
	push	-1
	push	OFFSET FLAT:$SG71550
	mov	edx, DWORD PTR _ctrl$[ebp]
	add	edx, 44					; 0000002cH
	push	edx
	call	_dyntab_field_cell
	add	esp, 16					; 00000010H
	mov	DWORD PTR -76+[ebp], eax
	jmp	SHORT $L73420
$L73419:
	mov	DWORD PTR -76+[ebp], 0
$L73420:
	mov	eax, DWORD PTR -76+[ebp]
	mov	DWORD PTR -80+[ebp], eax
	jmp	SHORT $L73422
$L73421:
	mov	DWORD PTR -80+[ebp], 0
$L73422:
	mov	ecx, DWORD PTR -80+[ebp]
	mov	DWORD PTR _lbl$[ebp], ecx

; 1032 : 		counttype = "fiche";

	mov	DWORD PTR _counttype$[ebp], OFFSET FLAT:$SG71551

; 1034 : 	else

	jmp	SHORT $L71552
$L71546:

; 1036 : 		lbl = !tbl->totlines ? CTRL_ATTR_CELL(LABEL_NOMATCH) : NULL;

	mov	edx, DWORD PTR _tbl$[ebp]
	cmp	DWORD PTR [edx+52], 0
	jne	SHORT $L73425
	cmp	DWORD PTR _ctrl$[ebp], 0
	je	SHORT $L73423
	push	0
	push	-1
	push	OFFSET FLAT:$SG71555
	mov	eax, DWORD PTR _ctrl$[ebp]
	add	eax, 44					; 0000002cH
	push	eax
	call	_dyntab_field_cell
	add	esp, 16					; 00000010H
	mov	DWORD PTR -84+[ebp], eax
	jmp	SHORT $L73424
$L73423:
	mov	DWORD PTR -84+[ebp], 0
$L73424:
	mov	ecx, DWORD PTR -84+[ebp]
	mov	DWORD PTR -88+[ebp], ecx
	jmp	SHORT $L73426
$L73425:
	mov	DWORD PTR -88+[ebp], 0
$L73426:
	mov	edx, DWORD PTR -88+[ebp]
	mov	DWORD PTR _lbl$[ebp], edx

; 1037 : 		counttype = "fiche";

	mov	DWORD PTR _counttype$[ebp], OFFSET FLAT:$SG71556
$L71552:

; 1042 : 		"<td colspan=99><table cellspacing=0 cellpadding=0 border=", 0, " rules=none width=100%><tr>");

	push	27					; 0000001bH
	push	OFFSET FLAT:$SG71558
	push	0
	push	57					; 00000039H
	push	OFFSET FLAT:$SG71559
	mov	eax, DWORD PTR _html$[ebp]
	push	eax
	call	_dynbuf_add3_int
	add	esp, 24					; 00000018H
	test	eax, eax
	je	SHORT $L71557
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29872], OFFSET FLAT:$SG71561
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 1042		; 00000412H
	jmp	$eva_err$71545
$L71557:

; 1043 : 
; 1044 : 	/* Output partial list indicator */
; 1045 : 	if(nbpages > 1 && (options & 1) && pagectrl)

	cmp	DWORD PTR _nbpages$[ebp], 1
	jbe	$L71576
	mov	eax, DWORD PTR _options$[ebp]
	and	eax, 1
	test	eax, eax
	je	$L71576
	cmp	DWORD PTR _pagectrl$[ebp], 0
	je	$L71576

; 1047 : 		DYNBUF_ADD_STR(html, "<td>");

	push	0
	push	0
	push	4
	push	OFFSET FLAT:$SG71565
	mov	ecx, DWORD PTR _html$[ebp]
	push	ecx
	call	_dynbuf_add
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L71564
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29872], OFFSET FLAT:$SG71567
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 1047		; 00000417H
	jmp	$eva_err$71545
$L71564:

; 1048 : 		if(put_html_image(cntxt, NULL, "_eva_morepage.gif",
; 1049 : 			"La liste n'affiche pas toutes les fiches\n"
; 1050 : 			"Utilisez les boutons à droite pour changer de page ou le nombre de fiches par page",
; 1051 : 			NULL, NULL, 0)) STACK_ERROR;

	push	0
	push	0
	push	0
	push	0
	push	OFFSET FLAT:$SG71573
	push	OFFSET FLAT:$SG71574
	push	0
	mov	ecx, DWORD PTR _cntxt$[ebp]
	push	ecx
	call	_put_html_img
	add	esp, 32					; 00000020H
	test	eax, eax
	je	SHORT $L71572
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 1051		; 0000041bH
	jmp	$eva_err$71545
$L71572:

; 1052 : 		DYNBUF_ADD_STR(html, "</td>");

	push	0
	push	0
	push	5
	push	OFFSET FLAT:$SG71577
	mov	eax, DWORD PTR _html$[ebp]
	push	eax
	call	_dynbuf_add
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L71576
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29872], OFFSET FLAT:$SG71579
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 1052		; 0000041cH
	jmp	$eva_err$71545
$L71576:

; 1054 : 
; 1055 : 	/* Output record & page count */
; 1056 : 	if(!(options & 1) || (pagectrl & 6))

	mov	eax, DWORD PTR _options$[ebp]
	and	eax, 1
	test	eax, eax
	je	SHORT $L71581
	mov	ecx, DWORD PTR _pagectrl$[ebp]
	and	ecx, 6
	test	ecx, ecx
	je	$L71651
$L71581:

; 1058 : 		DYNBUF_ADD_STR(html, "<td><font size=-1><b><nobr>");

	push	0
	push	0
	push	27					; 0000001bH
	push	OFFSET FLAT:$SG71584
	mov	edx, DWORD PTR _html$[ebp]
	push	edx
	call	_dynbuf_add
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L71583
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29872], OFFSET FLAT:$SG71586
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 1058		; 00000422H
	jmp	$eva_err$71545
$L71583:

; 1059 : 		switch(tbl->totlines)
; 1060 : 		{

	mov	edx, DWORD PTR _tbl$[ebp]
	mov	eax, DWORD PTR [edx+52]
	mov	DWORD PTR -92+[ebp], eax
	cmp	DWORD PTR -92+[ebp], 0
	je	SHORT $L71591
	cmp	DWORD PTR -92+[ebp], 1
	je	$L71618
	jmp	$L71625
$L71591:

; 1061 : 		case 0:
; 1062 : 			if((!tbl->input || !tbl->input[0]) && tbl->minsearchlen && (tbl->status & TblCtrl_opensearch) )

	mov	ecx, DWORD PTR _tbl$[ebp]
	cmp	DWORD PTR [ecx+100], 0
	je	SHORT $L71593
	mov	edx, DWORD PTR _tbl$[ebp]
	mov	eax, DWORD PTR [edx+100]
	movsx	ecx, BYTE PTR [eax]
	test	ecx, ecx
	jne	$L71592
$L71593:
	mov	edx, DWORD PTR _tbl$[ebp]
	cmp	DWORD PTR [edx+76], 0
	je	$L71592
	mov	eax, DWORD PTR _tbl$[ebp]
	mov	ecx, DWORD PTR [eax+32]
	and	ecx, 32					; 00000020H
	test	ecx, ecx
	je	$L71592

; 1064 : 				/* Opened search with no input and min search len */
; 1065 : 				DYNBUF_ADD_STR(html, "?");

	push	0
	push	0
	push	1
	push	OFFSET FLAT:$SG71596
	mov	edx, DWORD PTR _html$[ebp]
	push	edx
	call	_dynbuf_add
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L71595
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29872], OFFSET FLAT:$SG71598
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 1065		; 00000429H
	jmp	$eva_err$71545
$L71595:

; 1066 : 				if(tbl->minsearchlen > 1)

	mov	edx, DWORD PTR _tbl$[ebp]
	cmp	DWORD PTR [edx+76], 1
	jbe	SHORT $L71600

; 1067 : 					DYNBUF_ADD3_INT(html, " (", tbl->minsearchlen, " car)")

	push	5
	push	OFFSET FLAT:$SG71601
	mov	eax, DWORD PTR _tbl$[ebp]
	mov	ecx, DWORD PTR [eax+76]
	push	ecx
	push	2
	push	OFFSET FLAT:$SG71602
	mov	edx, DWORD PTR _html$[ebp]
	push	edx
	call	_dynbuf_add3_int
	add	esp, 24					; 00000018H
	test	eax, eax
	je	SHORT $L71600
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29872], OFFSET FLAT:$SG71604
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 1067		; 0000042bH
	jmp	$eva_err$71545
$L71600:

; 1069 : 			else if(lbl) DYNBUF_ADD_CELLP(html, lbl, TO_HTML)

	jmp	$L71613
$L71592:
	cmp	DWORD PTR _lbl$[ebp], 0
	je	SHORT $L71606
	mov	edx, DWORD PTR _lbl$[ebp]
	mov	DWORD PTR __c$71607[ebp], edx
	cmp	DWORD PTR __c$71607[ebp], 0
	je	SHORT $L71608
	push	1
	push	OFFSET FLAT:_plain_to_html
	mov	eax, DWORD PTR __c$71607[ebp]
	mov	ecx, DWORD PTR [eax+4]
	push	ecx
	mov	edx, DWORD PTR __c$71607[ebp]
	mov	eax, DWORD PTR [edx]
	push	eax
	mov	ecx, DWORD PTR _html$[ebp]
	push	ecx
	call	_dynbuf_add
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L71608
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29872], OFFSET FLAT:$SG71610
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 1069		; 0000042dH
	jmp	$eva_err$71545
$L71608:

; 1070 : 			else DYNBUF_ADD3(html, "0 ", counttype, 0, NO_CONV, "");

	jmp	SHORT $L71613
$L71606:
	push	0
	push	OFFSET FLAT:$SG71614
	push	0
	push	0
	push	0
	mov	ecx, DWORD PTR _counttype$[ebp]
	push	ecx
	push	2
	push	OFFSET FLAT:$SG71615
	mov	edx, DWORD PTR _html$[ebp]
	push	edx
	call	_dynbuf_add3
	add	esp, 36					; 00000024H
	test	eax, eax
	je	SHORT $L71613
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29872], OFFSET FLAT:$SG71617
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 1070		; 0000042eH
	jmp	$eva_err$71545
$L71613:

; 1071 : 			break;

	jmp	$L71588
$L71618:

; 1072 : 
; 1073 : 		case 1:
; 1074 : 			DYNBUF_ADD3(html, "1 ", counttype, 0, NO_CONV, "")

	push	0
	push	OFFSET FLAT:$SG71621
	push	0
	push	0
	push	0
	mov	edx, DWORD PTR _counttype$[ebp]
	push	edx
	push	2
	push	OFFSET FLAT:$SG71622
	mov	eax, DWORD PTR _html$[ebp]
	push	eax
	call	_dynbuf_add3
	add	esp, 36					; 00000024H
	test	eax, eax
	je	SHORT $L71620
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29872], OFFSET FLAT:$SG71624
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 1074		; 00000432H
	jmp	$eva_err$71545
$L71620:

; 1075 : 			break;

	jmp	$L71588
$L71625:

; 1076 : 
; 1077 : 		default:
; 1078 : 			DYNBUF_ADD_INT(html, tbl->totlines);

	mov	eax, DWORD PTR _tbl$[ebp]
	mov	ecx, DWORD PTR [eax+52]
	push	ecx
	mov	edx, DWORD PTR _html$[ebp]
	push	edx
	call	_dynbuf_add_int
	add	esp, 8
	test	eax, eax
	je	SHORT $L71626
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29872], OFFSET FLAT:$SG71628
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 1078		; 00000436H
	jmp	$eva_err$71545
$L71626:

; 1079 : 			DYNBUF_ADD_STR(html, " ");

	push	0
	push	0
	push	1
	push	OFFSET FLAT:$SG71631
	mov	edx, DWORD PTR _html$[ebp]
	push	edx
	call	_dynbuf_add
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L71630
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29872], OFFSET FLAT:$SG71633
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 1079		; 00000437H
	jmp	$eva_err$71545
$L71630:

; 1080 : 			if(*counttype) DYNBUF_ADD3(html, " ", counttype, 0, NO_CONV, "s");

	mov	edx, DWORD PTR _counttype$[ebp]
	movsx	eax, BYTE PTR [edx]
	test	eax, eax
	je	SHORT $L71636
	push	1
	push	OFFSET FLAT:$SG71637
	push	0
	push	0
	push	0
	mov	ecx, DWORD PTR _counttype$[ebp]
	push	ecx
	push	1
	push	OFFSET FLAT:$SG71638
	mov	edx, DWORD PTR _html$[ebp]
	push	edx
	call	_dynbuf_add3
	add	esp, 36					; 00000024H
	test	eax, eax
	je	SHORT $L71636
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29872], OFFSET FLAT:$SG71640
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 1080		; 00000438H
	jmp	$eva_err$71545
$L71636:

; 1081 : 			if(nbpages > 1)

	cmp	DWORD PTR _nbpages$[ebp], 1
	jbe	SHORT $L71647

; 1083 : 				DYNBUF_ADD3_INT(html, " -</nobr> <nobr>page ", page, " / ");

	push	3
	push	OFFSET FLAT:$SG71643
	mov	edx, DWORD PTR _page$[ebp]
	push	edx
	push	21					; 00000015H
	push	OFFSET FLAT:$SG71644
	mov	eax, DWORD PTR _html$[ebp]
	push	eax
	call	_dynbuf_add3_int
	add	esp, 24					; 00000018H
	test	eax, eax
	je	SHORT $L71642
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29872], OFFSET FLAT:$SG71646
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 1083		; 0000043bH
	jmp	$eva_err$71545
$L71642:

; 1084 : 				DYNBUF_ADD_INT(html, nbpages);

	mov	eax, DWORD PTR _nbpages$[ebp]
	push	eax
	mov	ecx, DWORD PTR _html$[ebp]
	push	ecx
	call	_dynbuf_add_int
	add	esp, 8
	test	eax, eax
	je	SHORT $L71647
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29872], OFFSET FLAT:$SG71649
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 1084		; 0000043cH
	jmp	$eva_err$71545
$L71647:
$L71588:

; 1087 : 		DYNBUF_ADD_STR(html, "</nobr></b></font></td>");

	push	0
	push	0
	push	23					; 00000017H
	push	OFFSET FLAT:$SG71652
	mov	ecx, DWORD PTR _html$[ebp]
	push	ecx
	call	_dynbuf_add
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L71651
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29872], OFFSET FLAT:$SG71654
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 1087		; 0000043fH
	jmp	$eva_err$71545
$L71651:

; 1089 : 
; 1090 : 
; 1091 : 	/* Output navigator buttons */
; 1092 : 	if(nbpages > 1 && ((options & 1) || (pagectrl & 6)))

	cmp	DWORD PTR _nbpages$[ebp], 1
	jbe	$L71751
	mov	ecx, DWORD PTR _options$[ebp]
	and	ecx, 1
	test	ecx, ecx
	jne	SHORT $L71656
	mov	edx, DWORD PTR _pagectrl$[ebp]
	and	edx, 6
	test	edx, edx
	je	$L71751
$L71656:

; 1094 : 		/* Output previous page buttons */
; 1095 : 		DYNBUF_ADD_STR(html, "<td><nobr>");

	push	0
	push	0
	push	10					; 0000000aH
	push	OFFSET FLAT:$SG71659
	mov	eax, DWORD PTR _html$[ebp]
	push	eax
	call	_dynbuf_add
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L71658
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29872], OFFSET FLAT:$SG71661
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 1095		; 00000447H
	jmp	$eva_err$71545
$L71658:

; 1096 : 		if(tbl->line)

	mov	eax, DWORD PTR _tbl$[ebp]
	cmp	DWORD PTR [eax+40], 0
	je	$L71662

; 1098 : 			/* Top of table */
; 1099 : 			if(nbpages > 2)

	cmp	DWORD PTR _nbpages$[ebp], 2
	jbe	SHORT $L71668

; 1101 : 				CTRL_CGINAMEBTN(&name, NULL, add_sz_str("TOP"));

	push	3
	push	OFFSET FLAT:$SG71666
	push	66					; 00000042H
	lea	ecx, DWORD PTR _name$[ebp]
	push	ecx
	push	1
	push	0
	mov	edx, DWORD PTR _ctrl$[ebp]
	push	edx
	mov	eax, DWORD PTR _cntxt$[ebp]
	push	eax
	call	_ctrl_cgi_name
	add	esp, 32					; 00000020H
	test	eax, eax
	je	SHORT $L71665
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 1101		; 0000044dH
	jmp	$eva_err$71545
$L71665:

; 1102 : 				if(put_html_button(cntxt, name->data, "Début", "_eva_btn_arrowl1_small.gif", "_eva_btn_arrowl1_small_s.gif",
; 1103 : 													"Remonte en haut de la table", 0, 4)) STACK_ERROR;

	push	4
	push	0
	push	0
	push	0
	push	0
	push	OFFSET FLAT:$SG71669
	push	OFFSET FLAT:$SG71670
	push	OFFSET FLAT:$SG71671
	push	OFFSET FLAT:$SG71672
	mov	edx, DWORD PTR _name$[ebp]
	add	edx, 8
	push	edx
	mov	eax, DWORD PTR _cntxt$[ebp]
	push	eax
	call	_put_html_button_sz
	add	esp, 44					; 0000002cH
	test	eax, eax
	je	SHORT $L71668
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 1103		; 0000044fH
	jmp	$eva_err$71545
$L71668:

; 1105 : 
; 1106 : 			/* Previous line */
; 1107 : 			if(pagectrl & 8)

	mov	edx, DWORD PTR _pagectrl$[ebp]
	and	edx, 8
	test	edx, edx
	je	SHORT $L71678

; 1109 : 				CTRL_CGINAMEBTN(&name, NULL, add_sz_str("LINEUP"));

	push	6
	push	OFFSET FLAT:$SG71676
	push	66					; 00000042H
	lea	eax, DWORD PTR _name$[ebp]
	push	eax
	push	1
	push	0
	mov	ecx, DWORD PTR _ctrl$[ebp]
	push	ecx
	mov	edx, DWORD PTR _cntxt$[ebp]
	push	edx
	call	_ctrl_cgi_name
	add	esp, 32					; 00000020H
	test	eax, eax
	je	SHORT $L71675
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 1109		; 00000455H
	jmp	$eva_err$71545
$L71675:

; 1110 : 				if(put_html_button(cntxt, name->data, "Ligne précédente", "_eva_btn_arrowl_small.gif", "_eva_btn_arrowl_small_s.gif",
; 1111 : 													"Remonte d'une ligne dans la table", 0, 4)) STACK_ERROR;

	push	4
	push	0
	push	0
	push	0
	push	0
	push	OFFSET FLAT:$SG71679
	push	OFFSET FLAT:$SG71680
	push	OFFSET FLAT:$SG71681
	push	OFFSET FLAT:$SG71682
	mov	ecx, DWORD PTR _name$[ebp]
	add	ecx, 8
	push	ecx
	mov	edx, DWORD PTR _cntxt$[ebp]
	push	edx
	call	_put_html_button_sz
	add	esp, 44					; 0000002cH
	test	eax, eax
	je	SHORT $L71678
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 1111		; 00000457H
	jmp	$eva_err$71545
$L71678:

; 1113 : 
; 1114 : 			/* Previous page */
; 1115 : 			CTRL_CGINAMEBTN(&name, NULL, add_sz_str("PAGEUP"));

	push	6
	push	OFFSET FLAT:$SG71685
	push	66					; 00000042H
	lea	ecx, DWORD PTR _name$[ebp]
	push	ecx
	push	1
	push	0
	mov	edx, DWORD PTR _ctrl$[ebp]
	push	edx
	mov	eax, DWORD PTR _cntxt$[ebp]
	push	eax
	call	_ctrl_cgi_name
	add	esp, 32					; 00000020H
	test	eax, eax
	je	SHORT $L71684
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 1115		; 0000045bH
	jmp	$eva_err$71545
$L71684:

; 1116 : 			if(put_html_button(cntxt, name->data, "Page précédente",
; 1117 : 					(pagectrl & 4) ? "_eva_pgprev.gif" : "_eva_pgprv.gif",
; 1118 : 					(pagectrl & 4) ? "_eva_pgprev_s.gif" : "_eva_pgprv_s.gif",
; 1119 : 					"Remonte d'une page dans la table", 0, 4)) STACK_ERROR;

	mov	edx, DWORD PTR _pagectrl$[ebp]
	and	edx, 4
	test	edx, edx
	je	SHORT $L73427
	mov	DWORD PTR -96+[ebp], OFFSET FLAT:$SG71689
	jmp	SHORT $L73428
$L73427:
	mov	DWORD PTR -96+[ebp], OFFSET FLAT:$SG71690
$L73428:
	mov	eax, DWORD PTR _pagectrl$[ebp]
	and	eax, 4
	test	eax, eax
	je	SHORT $L73429
	mov	DWORD PTR -100+[ebp], OFFSET FLAT:$SG71691
	jmp	SHORT $L73430
$L73429:
	mov	DWORD PTR -100+[ebp], OFFSET FLAT:$SG71692
$L73430:
	push	4
	push	0
	push	0
	push	0
	push	0
	push	OFFSET FLAT:$SG71688
	mov	ecx, DWORD PTR -96+[ebp]
	push	ecx
	mov	edx, DWORD PTR -100+[ebp]
	push	edx
	push	OFFSET FLAT:$SG71693
	mov	eax, DWORD PTR _name$[ebp]
	add	eax, 8
	push	eax
	mov	ecx, DWORD PTR _cntxt$[ebp]
	push	ecx
	call	_put_html_button_sz
	add	esp, 44					; 0000002cH
	test	eax, eax
	je	SHORT $L71687
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 1119		; 0000045fH
	jmp	$eva_err$71545
$L71687:

; 1121 : 		else

	jmp	SHORT $L71699
$L71662:

; 1123 : 			/* Disabled previous page */
; 1124 : 			if(put_html_image(cntxt, NULL,
; 1125 : 							(pagectrl & 4) ? "_eva_pgprev_d.gif" : "_eva_pgprv_d.gif",
; 1126 : 							"Page précédente désactivée : début de liste", NULL, NULL, 0)) STACK_ERROR;

	mov	eax, DWORD PTR _pagectrl$[ebp]
	and	eax, 4
	test	eax, eax
	je	SHORT $L73431
	mov	DWORD PTR -104+[ebp], OFFSET FLAT:$SG71701
	jmp	SHORT $L73432
$L73431:
	mov	DWORD PTR -104+[ebp], OFFSET FLAT:$SG71702
$L73432:
	push	0
	push	0
	push	0
	push	0
	push	OFFSET FLAT:$SG71700
	mov	ecx, DWORD PTR -104+[ebp]
	push	ecx
	push	0
	mov	edx, DWORD PTR _cntxt$[ebp]
	push	edx
	call	_put_html_img
	add	esp, 32					; 00000020H
	test	eax, eax
	je	SHORT $L71699
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 1126		; 00000466H
	jmp	$eva_err$71545
$L71699:

; 1128 : 
; 1129 : 		/* Allow break between previon & next controls if large images */
; 1130 : 		if(pagectrl & 4) DYNBUF_ADD_STR(html, "</nobr> <nobr>");

	mov	ecx, DWORD PTR _pagectrl$[ebp]
	and	ecx, 4
	test	ecx, ecx
	je	SHORT $L71705
	push	0
	push	0
	push	14					; 0000000eH
	push	OFFSET FLAT:$SG71706
	mov	edx, DWORD PTR _html$[ebp]
	push	edx
	call	_dynbuf_add
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L71705
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29872], OFFSET FLAT:$SG71708
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 1130		; 0000046aH
	jmp	$eva_err$71545
$L71705:

; 1131 : 
; 1132 : 		/* Output next page buttons */
; 1133 : 		if(tbl->line < tbl->totlines - tbl->lines)

	mov	edx, DWORD PTR _tbl$[ebp]
	mov	eax, DWORD PTR _tbl$[ebp]
	mov	ecx, DWORD PTR [edx+52]
	sub	ecx, DWORD PTR [eax+44]
	mov	edx, DWORD PTR _tbl$[ebp]
	cmp	DWORD PTR [edx+40], ecx
	jae	$L71709

; 1135 : 			/* Next page */
; 1136 : 			CTRL_CGINAMEBTN(&name, NULL, add_sz_str("PAGEDOWN"));

	push	8
	push	OFFSET FLAT:$SG71712
	push	66					; 00000042H
	lea	eax, DWORD PTR _name$[ebp]
	push	eax
	push	1
	push	0
	mov	ecx, DWORD PTR _ctrl$[ebp]
	push	ecx
	mov	edx, DWORD PTR _cntxt$[ebp]
	push	edx
	call	_ctrl_cgi_name
	add	esp, 32					; 00000020H
	test	eax, eax
	je	SHORT $L71711
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 1136		; 00000470H
	jmp	$eva_err$71545
$L71711:

; 1137 : 			if(put_html_button(cntxt, name->data, "Page suivante",
; 1138 : 					(pagectrl & 4) ? "_eva_pgnext.gif" : "_eva_pgnxt.gif",
; 1139 : 					(pagectrl & 4) ? "_eva_pgnext_s.gif" : "_eva_pgnxt_s.gif",
; 1140 : 					"Descend d'une page dans la table", 0, 4)) STACK_ERROR;

	mov	ecx, DWORD PTR _pagectrl$[ebp]
	and	ecx, 4
	test	ecx, ecx
	je	SHORT $L73433
	mov	DWORD PTR -108+[ebp], OFFSET FLAT:$SG71716
	jmp	SHORT $L73434
$L73433:
	mov	DWORD PTR -108+[ebp], OFFSET FLAT:$SG71717
$L73434:
	mov	edx, DWORD PTR _pagectrl$[ebp]
	and	edx, 4
	test	edx, edx
	je	SHORT $L73435
	mov	DWORD PTR -112+[ebp], OFFSET FLAT:$SG71718
	jmp	SHORT $L73436
$L73435:
	mov	DWORD PTR -112+[ebp], OFFSET FLAT:$SG71719
$L73436:
	push	4
	push	0
	push	0
	push	0
	push	0
	push	OFFSET FLAT:$SG71715
	mov	eax, DWORD PTR -108+[ebp]
	push	eax
	mov	ecx, DWORD PTR -112+[ebp]
	push	ecx
	push	OFFSET FLAT:$SG71720
	mov	edx, DWORD PTR _name$[ebp]
	add	edx, 8
	push	edx
	mov	eax, DWORD PTR _cntxt$[ebp]
	push	eax
	call	_put_html_button_sz
	add	esp, 44					; 0000002cH
	test	eax, eax
	je	SHORT $L71714
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 1140		; 00000474H
	jmp	$eva_err$71545
$L71714:

; 1141 : 
; 1142 : 			/* Next line */
; 1143 : 			if(pagectrl & 8)

	mov	edx, DWORD PTR _pagectrl$[ebp]
	and	edx, 8
	test	edx, edx
	je	SHORT $L71726

; 1145 : 				CTRL_CGINAMEBTN(&name, NULL, add_sz_str("LINEDOWN"));

	push	8
	push	OFFSET FLAT:$SG71724
	push	66					; 00000042H
	lea	eax, DWORD PTR _name$[ebp]
	push	eax
	push	1
	push	0
	mov	ecx, DWORD PTR _ctrl$[ebp]
	push	ecx
	mov	edx, DWORD PTR _cntxt$[ebp]
	push	edx
	call	_ctrl_cgi_name
	add	esp, 32					; 00000020H
	test	eax, eax
	je	SHORT $L71723
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 1145		; 00000479H
	jmp	$eva_err$71545
$L71723:

; 1146 : 				if(put_html_button(cntxt, name->data, "Ligne suivante", "_eva_btn_arrowr_small.gif", "_eva_btn_arrowr_small_s.gif",
; 1147 : 													"Descend d'une ligne dans la table", 0, 4)) STACK_ERROR;

	push	4
	push	0
	push	0
	push	0
	push	0
	push	OFFSET FLAT:$SG71727
	push	OFFSET FLAT:$SG71728
	push	OFFSET FLAT:$SG71729
	push	OFFSET FLAT:$SG71730
	mov	ecx, DWORD PTR _name$[ebp]
	add	ecx, 8
	push	ecx
	mov	edx, DWORD PTR _cntxt$[ebp]
	push	edx
	call	_put_html_button_sz
	add	esp, 44					; 0000002cH
	test	eax, eax
	je	SHORT $L71726
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 1147		; 0000047bH
	jmp	$eva_err$71545
$L71726:

; 1149 : 
; 1150 : 			/* Bottom of table */
; 1151 : 			if(nbpages > 2)

	cmp	DWORD PTR _nbpages$[ebp], 2
	jbe	SHORT $L71736

; 1153 : 				CTRL_CGINAMEBTN(&name, NULL, add_sz_str("BOTTOM"));

	push	6
	push	OFFSET FLAT:$SG71734
	push	66					; 00000042H
	lea	ecx, DWORD PTR _name$[ebp]
	push	ecx
	push	1
	push	0
	mov	edx, DWORD PTR _ctrl$[ebp]
	push	edx
	mov	eax, DWORD PTR _cntxt$[ebp]
	push	eax
	call	_ctrl_cgi_name
	add	esp, 32					; 00000020H
	test	eax, eax
	je	SHORT $L71733
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 1153		; 00000481H
	jmp	$eva_err$71545
$L71733:

; 1154 : 				if(put_html_button(cntxt, name->data, "Fin", "_eva_btn_arrowr1_small.gif", "_eva_btn_arrowr1_small_s.gif",
; 1155 : 													"Descend en bas de la table", 0, 4)) STACK_ERROR;

	push	4
	push	0
	push	0
	push	0
	push	0
	push	OFFSET FLAT:$SG71737
	push	OFFSET FLAT:$SG71738
	push	OFFSET FLAT:$SG71739
	push	OFFSET FLAT:$SG71740
	mov	edx, DWORD PTR _name$[ebp]
	add	edx, 8
	push	edx
	mov	eax, DWORD PTR _cntxt$[ebp]
	push	eax
	call	_put_html_button_sz
	add	esp, 44					; 0000002cH
	test	eax, eax
	je	SHORT $L71736
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 1155		; 00000483H
	jmp	$eva_err$71545
$L71736:

; 1158 : 		else

	jmp	SHORT $L71746
$L71709:

; 1160 : 			/* Disabled next page */
; 1161 : 			if(put_html_image(cntxt, NULL,
; 1162 : 							(pagectrl & 4) ? "_eva_pgnext_d.gif" : "_eva_pgnxt_d.gif",
; 1163 : 							"Page suivante désactivée : fin de liste", NULL, NULL, 0)) STACK_ERROR;

	mov	edx, DWORD PTR _pagectrl$[ebp]
	and	edx, 4
	test	edx, edx
	je	SHORT $L73437
	mov	DWORD PTR -116+[ebp], OFFSET FLAT:$SG71748
	jmp	SHORT $L73438
$L73437:
	mov	DWORD PTR -116+[ebp], OFFSET FLAT:$SG71749
$L73438:
	push	0
	push	0
	push	0
	push	0
	push	OFFSET FLAT:$SG71747
	mov	eax, DWORD PTR -116+[ebp]
	push	eax
	push	0
	mov	ecx, DWORD PTR _cntxt$[ebp]
	push	ecx
	call	_put_html_img
	add	esp, 32					; 00000020H
	test	eax, eax
	je	SHORT $L71746
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 1163		; 0000048bH
	jmp	$eva_err$71545
$L71746:

; 1165 : 		DYNBUF_ADD_STR(html, "</nobr></td>");

	push	0
	push	0
	push	12					; 0000000cH
	push	OFFSET FLAT:$SG71752
	mov	eax, DWORD PTR _html$[ebp]
	push	eax
	call	_dynbuf_add
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L71751
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29872], OFFSET FLAT:$SG71754
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 1165		; 0000048dH
	jmp	$eva_err$71545
$L71751:

; 1167 : 
; 1168 : 	/* Output page size buttons */
; 1169 : #define PAGESIZE_BTN(n) { \
; 1170 : 	CTRL_CGINAMEBTN(&name, NULL, add_sz_str("PAGESIZE=" #n)); \
; 1171 : 	if(put_html_button(cntxt, name->data, NULL, (n == tbl->lines ? "_eva_btn_" #n "_s.gif" : "_eva_btn_" #n ".gif"), \
; 1172 : 												(n == tbl->lines ? "_eva_btn_" #n ".gif" : "_eva_btn_" #n "_s.gif"), \
; 1173 : 												tbl->lines == n ? #n " lignes affichées par page" : "Affiche " #n " lignes par page", 0, \
; 1174 : 												tbl->lines == n ? 1 : 4)) STACK_ERROR; }
; 1175 : 	if((options & 1) || (pagectrl & 6))

	mov	eax, DWORD PTR _options$[ebp]
	and	eax, 1
	test	eax, eax
	jne	SHORT $L71757
	mov	ecx, DWORD PTR _pagectrl$[ebp]
	and	ecx, 6
	test	ecx, ecx
	je	$L71849
$L71757:

; 1177 : 		DYNBUF_ADD_STR(html, "<td align=right>");

	push	0
	push	0
	push	16					; 00000010H
	push	OFFSET FLAT:$SG71760
	mov	edx, DWORD PTR _html$[ebp]
	push	edx
	call	_dynbuf_add
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L71759
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29872], OFFSET FLAT:$SG71762
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 1177		; 00000499H
	jmp	$eva_err$71545
$L71759:

; 1178 : 		if(tbl->totlines > 2 && tbl->lines > 2)

	mov	edx, DWORD PTR _tbl$[ebp]
	cmp	DWORD PTR [edx+52], 2
	jbe	$L71769
	mov	eax, DWORD PTR _tbl$[ebp]
	cmp	DWORD PTR [eax+44], 2
	jbe	SHORT $L71769

; 1180 : 			CTRL_CGINAMEBTN(&name, NULL, add_sz_str("SHRINK"));

	push	6
	push	OFFSET FLAT:$SG71766
	push	66					; 00000042H
	lea	ecx, DWORD PTR _name$[ebp]
	push	ecx
	push	1
	push	0
	mov	edx, DWORD PTR _ctrl$[ebp]
	push	edx
	mov	eax, DWORD PTR _cntxt$[ebp]
	push	eax
	call	_ctrl_cgi_name
	add	esp, 32					; 00000020H
	test	eax, eax
	je	SHORT $L71765
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 1180		; 0000049cH
	jmp	$eva_err$71545
$L71765:

; 1181 : 			if(put_html_button(cntxt, name->data, NULL, "_eva_btn_shrink.gif", "_eva_btn_shrink_s.gif",
; 1182 : 												"Réduit le nombre de lignes affichées", 0, 4)) STACK_ERROR;

	push	4
	push	0
	push	0
	push	0
	push	0
	push	OFFSET FLAT:$SG71770
	push	OFFSET FLAT:$SG71771
	push	OFFSET FLAT:$SG71772
	push	0
	mov	edx, DWORD PTR _name$[ebp]
	add	edx, 8
	push	edx
	mov	eax, DWORD PTR _cntxt$[ebp]
	push	eax
	call	_put_html_button_sz
	add	esp, 44					; 0000002cH
	test	eax, eax
	je	SHORT $L71769
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 1182		; 0000049eH
	jmp	$eva_err$71545
$L71769:

; 1184 : 		if(pagectrl & 6)

	mov	edx, DWORD PTR _pagectrl$[ebp]
	and	edx, 6
	test	edx, edx
	je	$L71831

; 1186 : 			if(tbl->totlines > 2)

	mov	eax, DWORD PTR _tbl$[ebp]
	cmp	DWORD PTR [eax+52], 2
	jbe	$L71792

; 1188 : 				PAGESIZE_BTN(2)

	push	10					; 0000000aH
	push	OFFSET FLAT:$SG71777
	push	66					; 00000042H
	lea	ecx, DWORD PTR _name$[ebp]
	push	ecx
	push	1
	push	0
	mov	edx, DWORD PTR _ctrl$[ebp]
	push	edx
	mov	eax, DWORD PTR _cntxt$[ebp]
	push	eax
	call	_ctrl_cgi_name
	add	esp, 32					; 00000020H
	test	eax, eax
	je	SHORT $L71776
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 1188		; 000004a4H
	jmp	$eva_err$71545
$L71776:
	mov	edx, DWORD PTR _tbl$[ebp]
	cmp	DWORD PTR [edx+44], 2
	jne	SHORT $L73439
	mov	DWORD PTR -120+[ebp], OFFSET FLAT:$SG71781
	jmp	SHORT $L73440
$L73439:
	mov	DWORD PTR -120+[ebp], OFFSET FLAT:$SG71782
$L73440:
	mov	eax, DWORD PTR _tbl$[ebp]
	cmp	DWORD PTR [eax+44], 2
	jne	SHORT $L73441
	mov	DWORD PTR -124+[ebp], OFFSET FLAT:$SG71783
	jmp	SHORT $L73442
$L73441:
	mov	DWORD PTR -124+[ebp], OFFSET FLAT:$SG71784
$L73442:
	mov	ecx, DWORD PTR _tbl$[ebp]
	cmp	DWORD PTR [ecx+44], 2
	jne	SHORT $L73443
	mov	DWORD PTR -128+[ebp], OFFSET FLAT:$SG71785
	jmp	SHORT $L73444
$L73443:
	mov	DWORD PTR -128+[ebp], OFFSET FLAT:$SG71786
$L73444:
	mov	edx, DWORD PTR _tbl$[ebp]
	mov	eax, DWORD PTR [edx+44]
	sub	eax, 2
	neg	eax
	sbb	eax, eax
	and	eax, 3
	add	eax, 1
	push	eax
	push	0
	push	0
	push	0
	push	0
	mov	ecx, DWORD PTR -120+[ebp]
	push	ecx
	mov	edx, DWORD PTR -124+[ebp]
	push	edx
	mov	eax, DWORD PTR -128+[ebp]
	push	eax
	push	0
	mov	ecx, DWORD PTR _name$[ebp]
	add	ecx, 8
	push	ecx
	mov	edx, DWORD PTR _cntxt$[ebp]
	push	edx
	call	_put_html_button_sz
	add	esp, 44					; 0000002cH
	test	eax, eax
	je	SHORT $L71780
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 1188		; 000004a4H
	jmp	$eva_err$71545
$L71780:

; 1189 : 				PAGESIZE_BTN(5)

	push	10					; 0000000aH
	push	OFFSET FLAT:$SG71789
	push	66					; 00000042H
	lea	ecx, DWORD PTR _name$[ebp]
	push	ecx
	push	1
	push	0
	mov	edx, DWORD PTR _ctrl$[ebp]
	push	edx
	mov	eax, DWORD PTR _cntxt$[ebp]
	push	eax
	call	_ctrl_cgi_name
	add	esp, 32					; 00000020H
	test	eax, eax
	je	SHORT $L71788
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 1189		; 000004a5H
	jmp	$eva_err$71545
$L71788:
	mov	edx, DWORD PTR _tbl$[ebp]
	cmp	DWORD PTR [edx+44], 5
	jne	SHORT $L73445
	mov	DWORD PTR -132+[ebp], OFFSET FLAT:$SG71793
	jmp	SHORT $L73446
$L73445:
	mov	DWORD PTR -132+[ebp], OFFSET FLAT:$SG71794
$L73446:
	mov	eax, DWORD PTR _tbl$[ebp]
	cmp	DWORD PTR [eax+44], 5
	jne	SHORT $L73447
	mov	DWORD PTR -136+[ebp], OFFSET FLAT:$SG71795
	jmp	SHORT $L73448
$L73447:
	mov	DWORD PTR -136+[ebp], OFFSET FLAT:$SG71796
$L73448:
	mov	ecx, DWORD PTR _tbl$[ebp]
	cmp	DWORD PTR [ecx+44], 5
	jne	SHORT $L73449
	mov	DWORD PTR -140+[ebp], OFFSET FLAT:$SG71797
	jmp	SHORT $L73450
$L73449:
	mov	DWORD PTR -140+[ebp], OFFSET FLAT:$SG71798
$L73450:
	mov	edx, DWORD PTR _tbl$[ebp]
	mov	eax, DWORD PTR [edx+44]
	sub	eax, 5
	neg	eax
	sbb	eax, eax
	and	eax, 3
	add	eax, 1
	push	eax
	push	0
	push	0
	push	0
	push	0
	mov	ecx, DWORD PTR -132+[ebp]
	push	ecx
	mov	edx, DWORD PTR -136+[ebp]
	push	edx
	mov	eax, DWORD PTR -140+[ebp]
	push	eax
	push	0
	mov	ecx, DWORD PTR _name$[ebp]
	add	ecx, 8
	push	ecx
	mov	edx, DWORD PTR _cntxt$[ebp]
	push	edx
	call	_put_html_button_sz
	add	esp, 44					; 0000002cH
	test	eax, eax
	je	SHORT $L71792
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 1189		; 000004a5H
	jmp	$eva_err$71545
$L71792:

; 1191 : 			if(tbl->totlines > 5) PAGESIZE_BTN(10)

	mov	ecx, DWORD PTR _tbl$[ebp]
	cmp	DWORD PTR [ecx+52], 5
	jbe	$L71805
	push	11					; 0000000bH
	push	OFFSET FLAT:$SG71802
	push	66					; 00000042H
	lea	edx, DWORD PTR _name$[ebp]
	push	edx
	push	1
	push	0
	mov	eax, DWORD PTR _ctrl$[ebp]
	push	eax
	mov	ecx, DWORD PTR _cntxt$[ebp]
	push	ecx
	call	_ctrl_cgi_name
	add	esp, 32					; 00000020H
	test	eax, eax
	je	SHORT $L71801
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 1191		; 000004a7H
	jmp	$eva_err$71545
$L71801:
	mov	eax, DWORD PTR _tbl$[ebp]
	cmp	DWORD PTR [eax+44], 10			; 0000000aH
	jne	SHORT $L73451
	mov	DWORD PTR -144+[ebp], OFFSET FLAT:$SG71806
	jmp	SHORT $L73452
$L73451:
	mov	DWORD PTR -144+[ebp], OFFSET FLAT:$SG71807
$L73452:
	mov	ecx, DWORD PTR _tbl$[ebp]
	cmp	DWORD PTR [ecx+44], 10			; 0000000aH
	jne	SHORT $L73453
	mov	DWORD PTR -148+[ebp], OFFSET FLAT:$SG71808
	jmp	SHORT $L73454
$L73453:
	mov	DWORD PTR -148+[ebp], OFFSET FLAT:$SG71809
$L73454:
	mov	edx, DWORD PTR _tbl$[ebp]
	cmp	DWORD PTR [edx+44], 10			; 0000000aH
	jne	SHORT $L73455
	mov	DWORD PTR -152+[ebp], OFFSET FLAT:$SG71810
	jmp	SHORT $L73456
$L73455:
	mov	DWORD PTR -152+[ebp], OFFSET FLAT:$SG71811
$L73456:
	mov	eax, DWORD PTR _tbl$[ebp]
	mov	ecx, DWORD PTR [eax+44]
	sub	ecx, 10					; 0000000aH
	neg	ecx
	sbb	ecx, ecx
	and	ecx, 3
	add	ecx, 1
	push	ecx
	push	0
	push	0
	push	0
	push	0
	mov	edx, DWORD PTR -144+[ebp]
	push	edx
	mov	eax, DWORD PTR -148+[ebp]
	push	eax
	mov	ecx, DWORD PTR -152+[ebp]
	push	ecx
	push	0
	mov	edx, DWORD PTR _name$[ebp]
	add	edx, 8
	push	edx
	mov	eax, DWORD PTR _cntxt$[ebp]
	push	eax
	call	_put_html_button_sz
	add	esp, 44					; 0000002cH
	test	eax, eax
	je	SHORT $L71805
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 1191		; 000004a7H
	jmp	$eva_err$71545
$L71805:

; 1192 : 			if(tbl->totlines > 10) PAGESIZE_BTN(30)

	mov	edx, DWORD PTR _tbl$[ebp]
	cmp	DWORD PTR [edx+52], 10			; 0000000aH
	jbe	$L71818
	push	11					; 0000000bH
	push	OFFSET FLAT:$SG71815
	push	66					; 00000042H
	lea	eax, DWORD PTR _name$[ebp]
	push	eax
	push	1
	push	0
	mov	ecx, DWORD PTR _ctrl$[ebp]
	push	ecx
	mov	edx, DWORD PTR _cntxt$[ebp]
	push	edx
	call	_ctrl_cgi_name
	add	esp, 32					; 00000020H
	test	eax, eax
	je	SHORT $L71814
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 1192		; 000004a8H
	jmp	$eva_err$71545
$L71814:
	mov	ecx, DWORD PTR _tbl$[ebp]
	cmp	DWORD PTR [ecx+44], 30			; 0000001eH
	jne	SHORT $L73457
	mov	DWORD PTR -156+[ebp], OFFSET FLAT:$SG71819
	jmp	SHORT $L73458
$L73457:
	mov	DWORD PTR -156+[ebp], OFFSET FLAT:$SG71820
$L73458:
	mov	edx, DWORD PTR _tbl$[ebp]
	cmp	DWORD PTR [edx+44], 30			; 0000001eH
	jne	SHORT $L73459
	mov	DWORD PTR -160+[ebp], OFFSET FLAT:$SG71821
	jmp	SHORT $L73460
$L73459:
	mov	DWORD PTR -160+[ebp], OFFSET FLAT:$SG71822
$L73460:
	mov	eax, DWORD PTR _tbl$[ebp]
	cmp	DWORD PTR [eax+44], 30			; 0000001eH
	jne	SHORT $L73461
	mov	DWORD PTR -164+[ebp], OFFSET FLAT:$SG71823
	jmp	SHORT $L73462
$L73461:
	mov	DWORD PTR -164+[ebp], OFFSET FLAT:$SG71824
$L73462:
	mov	ecx, DWORD PTR _tbl$[ebp]
	mov	edx, DWORD PTR [ecx+44]
	sub	edx, 30					; 0000001eH
	neg	edx
	sbb	edx, edx
	and	edx, 3
	add	edx, 1
	push	edx
	push	0
	push	0
	push	0
	push	0
	mov	eax, DWORD PTR -156+[ebp]
	push	eax
	mov	ecx, DWORD PTR -160+[ebp]
	push	ecx
	mov	edx, DWORD PTR -164+[ebp]
	push	edx
	push	0
	mov	eax, DWORD PTR _name$[ebp]
	add	eax, 8
	push	eax
	mov	ecx, DWORD PTR _cntxt$[ebp]
	push	ecx
	call	_put_html_button_sz
	add	esp, 44					; 0000002cH
	test	eax, eax
	je	SHORT $L71818
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 1192		; 000004a8H
	jmp	$eva_err$71545
$L71818:

; 1193 : 			if(tbl->totlines > 30) PAGESIZE_BTN(100)

	mov	eax, DWORD PTR _tbl$[ebp]
	cmp	DWORD PTR [eax+52], 30			; 0000001eH
	jbe	$L71831
	push	12					; 0000000cH
	push	OFFSET FLAT:$SG71828
	push	66					; 00000042H
	lea	ecx, DWORD PTR _name$[ebp]
	push	ecx
	push	1
	push	0
	mov	edx, DWORD PTR _ctrl$[ebp]
	push	edx
	mov	eax, DWORD PTR _cntxt$[ebp]
	push	eax
	call	_ctrl_cgi_name
	add	esp, 32					; 00000020H
	test	eax, eax
	je	SHORT $L71827
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 1193		; 000004a9H
	jmp	$eva_err$71545
$L71827:
	mov	edx, DWORD PTR _tbl$[ebp]
	cmp	DWORD PTR [edx+44], 100			; 00000064H
	jne	SHORT $L73463
	mov	DWORD PTR -168+[ebp], OFFSET FLAT:$SG71832
	jmp	SHORT $L73464
$L73463:
	mov	DWORD PTR -168+[ebp], OFFSET FLAT:$SG71833
$L73464:
	mov	eax, DWORD PTR _tbl$[ebp]
	cmp	DWORD PTR [eax+44], 100			; 00000064H
	jne	SHORT $L73465
	mov	DWORD PTR -172+[ebp], OFFSET FLAT:$SG71834
	jmp	SHORT $L73466
$L73465:
	mov	DWORD PTR -172+[ebp], OFFSET FLAT:$SG71835
$L73466:
	mov	ecx, DWORD PTR _tbl$[ebp]
	cmp	DWORD PTR [ecx+44], 100			; 00000064H
	jne	SHORT $L73467
	mov	DWORD PTR -176+[ebp], OFFSET FLAT:$SG71836
	jmp	SHORT $L73468
$L73467:
	mov	DWORD PTR -176+[ebp], OFFSET FLAT:$SG71837
$L73468:
	mov	edx, DWORD PTR _tbl$[ebp]
	mov	eax, DWORD PTR [edx+44]
	sub	eax, 100				; 00000064H
	neg	eax
	sbb	eax, eax
	and	eax, 3
	add	eax, 1
	push	eax
	push	0
	push	0
	push	0
	push	0
	mov	ecx, DWORD PTR -168+[ebp]
	push	ecx
	mov	edx, DWORD PTR -172+[ebp]
	push	edx
	mov	eax, DWORD PTR -176+[ebp]
	push	eax
	push	0
	mov	ecx, DWORD PTR _name$[ebp]
	add	ecx, 8
	push	ecx
	mov	edx, DWORD PTR _cntxt$[ebp]
	push	edx
	call	_put_html_button_sz
	add	esp, 44					; 0000002cH
	test	eax, eax
	je	SHORT $L71831
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 1193		; 000004a9H
	jmp	$eva_err$71545
$L71831:

; 1195 : 		if(nbpages > 1)

	cmp	DWORD PTR _nbpages$[ebp], 1
	jbe	SHORT $L71844

; 1197 : 			CTRL_CGINAMEBTN(&name, NULL, add_sz_str("EXPAND"));

	push	6
	push	OFFSET FLAT:$SG71841
	push	66					; 00000042H
	lea	ecx, DWORD PTR _name$[ebp]
	push	ecx
	push	1
	push	0
	mov	edx, DWORD PTR _ctrl$[ebp]
	push	edx
	mov	eax, DWORD PTR _cntxt$[ebp]
	push	eax
	call	_ctrl_cgi_name
	add	esp, 32					; 00000020H
	test	eax, eax
	je	SHORT $L71840
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 1197		; 000004adH
	jmp	$eva_err$71545
$L71840:

; 1198 : 			if(put_html_button(cntxt, name->data, NULL, "_eva_btn_expand.gif", "_eva_btn_expand_s.gif",
; 1199 : 												"Augmente le nombre de lignes affichées", 0, 4)) STACK_ERROR;

	push	4
	push	0
	push	0
	push	0
	push	0
	push	OFFSET FLAT:$SG71845
	push	OFFSET FLAT:$SG71846
	push	OFFSET FLAT:$SG71847
	push	0
	mov	edx, DWORD PTR _name$[ebp]
	add	edx, 8
	push	edx
	mov	eax, DWORD PTR _cntxt$[ebp]
	push	eax
	call	_put_html_button_sz
	add	esp, 44					; 0000002cH
	test	eax, eax
	je	SHORT $L71844
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 1199		; 000004afH
	jmp	$eva_err$71545
$L71844:

; 1201 : 		DYNBUF_ADD_STR(html, "</td>");

	push	0
	push	0
	push	5
	push	OFFSET FLAT:$SG71850
	mov	edx, DWORD PTR _html$[ebp]
	push	edx
	call	_dynbuf_add
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L71849
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29872], OFFSET FLAT:$SG71852
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 1201		; 000004b1H
	jmp	$eva_err$71545
$L71849:

; 1203 : #undef PAGESIZE_BTN
; 1204 : 
; 1205 : 	/* Output export buttons */
; 1206 : 	if(tbl->totlines && table_put_export_btn(cntxt, i_ctrl)) STACK_ERROR;

	mov	edx, DWORD PTR _tbl$[ebp]
	cmp	DWORD PTR [edx+52], 0
	je	SHORT $L71853
	mov	eax, DWORD PTR _i_ctrl$[ebp]
	push	eax
	mov	ecx, DWORD PTR _cntxt$[ebp]
	push	ecx
	call	_table_put_export_btn
	add	esp, 8
	test	eax, eax
	je	SHORT $L71853
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 1206		; 000004b6H
	jmp	$eva_err$71545
$L71853:

; 1207 : 
; 1208 : 	/* Output table footer */
; 1209 : 	DYNBUF_ADD_STR(html, "</tr></table></td>\n");

	push	0
	push	0
	push	19					; 00000013H
	push	OFFSET FLAT:$SG71856
	mov	eax, DWORD PTR _html$[ebp]
	push	eax
	call	_dynbuf_add
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L71855
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29872], OFFSET FLAT:$SG71858
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 1209		; 000004b9H
	jmp	SHORT $eva_err$71545
$L71855:

; 1210 : 
; 1211 : 	if(cntxt->debug & DEBUG_HTML) DYNBUF_ADD3(cntxt->form->html, "\n<!--- EndOf TablePageNavigator ", ctrl->LABEL, 0, NO_CONV, " -->\n");

	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	ecx, DWORD PTR [eax+29860]
	and	ecx, 128				; 00000080H
	test	ecx, ecx
	je	SHORT $L71861
	push	5
	push	OFFSET FLAT:$SG71862
	push	0
	push	0
	push	0
	mov	edx, DWORD PTR _ctrl$[ebp]
	mov	eax, DWORD PTR [edx+284]
	push	eax
	push	32					; 00000020H
	push	OFFSET FLAT:$SG71863
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	edx, DWORD PTR [ecx+80]
	mov	eax, DWORD PTR [edx+232]
	push	eax
	call	_dynbuf_add3
	add	esp, 36					; 00000024H
	test	eax, eax
	je	SHORT $L71861
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29872], OFFSET FLAT:$SG71865
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 1211		; 000004bbH
	jmp	SHORT $eva_err$71545
$L71861:
$eva_noerr$71537:

; 1212 : 
; 1213 : 	RETURN_OK_CLEANUP;

	push	0
	push	OFFSET FLAT:$SG71866
	push	OFFSET FLAT:$SG71867
	mov	eax, DWORD PTR _cntxt$[ebp]
	push	eax
	call	_err_clear
	add	esp, 16					; 00000010H
$eva_err$71545:
	mov	ecx, DWORD PTR _cntxt$[ebp]
	cmp	DWORD PTR [ecx+29872], 0
	je	SHORT $L71868
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	eax, DWORD PTR [edx+29900]
	push	eax
	push	OFFSET FLAT:$SG71869
	push	OFFSET FLAT:$SG71870
	mov	ecx, DWORD PTR _cntxt$[ebp]
	push	ecx
	call	_err_add_context
	add	esp, 16					; 00000010H
$L71868:
	mov	edx, DWORD PTR _name$[ebp]
	push	edx
	call	_mem_free
	add	esp, 4
	mov	DWORD PTR _name$[ebp], 0
	mov	eax, DWORD PTR _cntxt$[ebp]
	xor	ecx, ecx
	cmp	DWORD PTR [eax+29872], 0
	setne	cl
	mov	eax, ecx
$L71515:

; 1214 : }

	mov	esp, ebp
	pop	ebp
	ret	0
_table_put_page_navigator ENDP
_TEXT	ENDS
PUBLIC	_table_put_controls
_DATA	SEGMENT
	ORG $+3
$SG71893 DB	' -->', 0aH, 00H
	ORG $+2
$SG71894 DB	0aH, '<!--- Start TableControls ', 00H
$SG71896 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG71901 DB	'<td width=10><table cellspacing=0 cellpadding=0 border=0'
	DB	' rules=none width=100%><tr><td width=10>', 00H
	ORG $+3
$SG71903 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG71908 DB	'</td>', 00H
	ORG $+2
$SG71910 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG71916 DB	' rules=none width=100%><tr><td>', 00H
$SG71917 DB	'<td><table cellspacing=0 cellpadding=0 border=', 00H
	ORG $+1
$SG71919 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG71929 DB	'</td>', 00H
	ORG $+2
$SG71931 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG71941 DB	'</tr><tr>', 00H
	ORG $+2
$SG71943 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG71947 DB	'</tr></table></td>', 00H
	ORG $+1
$SG71949 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG71953 DB	'</tr><tr>', 00H
	ORG $+2
$SG71955 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG71959 DB	' -->', 0aH, 00H
	ORG $+2
$SG71960 DB	0aH, '<!--- EndOf TableControls ', 00H
$SG71962 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG71964 DB	'D:\Travail\ABI\EVA\V4.0\CGI\Brunix-2016\table_utils.c', 00H
	ORG $+2
$SG71965 DB	'table_put_controls', 00H
	ORG $+1
$SG71967 DB	'D:\Travail\ABI\EVA\V4.0\CGI\Brunix-2016\table_utils.c', 00H
	ORG $+2
$SG71968 DB	'table_put_controls', 00H
_DATA	ENDS
_TEXT	SEGMENT
_cntxt$ = 8
_i_ctrl$ = 12
_b_shrink$ = 16
_form$ = -4
_ctrl$ = -20
_tbl$ = -12
_b_opensearch$ = -16
_html$ = -8
_b_label$71913 = -24
_nblabel$71914 = -28
_table_put_controls PROC NEAR

; 1228 : ){

	push	ebp
	mov	ebp, esp
	sub	esp, 48					; 00000030H

; 1229 : 	EVA_form *form = cntxt->form;

	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	ecx, DWORD PTR [eax+80]
	mov	DWORD PTR _form$[ebp], ecx

; 1230 : 	EVA_ctrl *ctrl = form->ctrl + i_ctrl;

	mov	edx, DWORD PTR _i_ctrl$[ebp]
	imul	edx, 480				; 000001e0H
	mov	eax, DWORD PTR _form$[ebp]
	mov	ecx, DWORD PTR [eax]
	add	ecx, edx
	mov	DWORD PTR _ctrl$[ebp], ecx

; 1231 : 	ObjTableFormat *tbl = ctrl->objtbl;

	mov	edx, DWORD PTR _ctrl$[ebp]
	mov	eax, DWORD PTR [edx+232]
	mov	DWORD PTR _tbl$[ebp], eax

; 1232 : 	int b_opensearch = !(tbl->status & (TblCtrl_opensearch | TblCtrl_opensel)) && tbl->status & (TblCtrl_search | TblCtrl_sel);

	mov	ecx, DWORD PTR _tbl$[ebp]
	mov	edx, DWORD PTR [ecx+32]
	and	edx, 544				; 00000220H
	test	edx, edx
	jne	SHORT $L73470
	mov	eax, DWORD PTR _tbl$[ebp]
	mov	ecx, DWORD PTR [eax+32]
	and	ecx, 272				; 00000110H
	test	ecx, ecx
	je	SHORT $L73470
	mov	DWORD PTR -32+[ebp], 1
	jmp	SHORT $L73471
$L73470:
	mov	DWORD PTR -32+[ebp], 0
$L73471:
	mov	edx, DWORD PTR -32+[ebp]
	mov	DWORD PTR _b_opensearch$[ebp], edx

; 1233 : 	CHECK_HTML_STATUS;

	cmp	DWORD PTR _cntxt$[ebp], 0
	je	SHORT $L73474
	mov	eax, DWORD PTR _cntxt$[ebp]
	cmp	DWORD PTR [eax+80], 0
	je	SHORT $L73472
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	edx, DWORD PTR [ecx+80]
	mov	eax, DWORD PTR [edx+232]
	mov	DWORD PTR -36+[ebp], eax
	jmp	SHORT $L73473
$L73472:
	mov	DWORD PTR -36+[ebp], 0
$L73473:
	mov	ecx, DWORD PTR -36+[ebp]
	mov	DWORD PTR -40+[ebp], ecx
	jmp	SHORT $L73475
$L73474:
	mov	DWORD PTR -40+[ebp], 0
$L73475:
	mov	edx, DWORD PTR -40+[ebp]
	mov	DWORD PTR _html$[ebp], edx
	cmp	DWORD PTR _html$[ebp], 0
	jne	SHORT $L71889
	xor	eax, eax
	jmp	$L71881
$L71889:

; 1234 : 
; 1235 : 	if(cntxt->debug & DEBUG_HTML) DYNBUF_ADD3(cntxt->form->html, "\n<!--- Start TableControls ", ctrl->LABEL, 0, NO_CONV, " -->\n");

	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	ecx, DWORD PTR [eax+29860]
	and	ecx, 128				; 00000080H
	test	ecx, ecx
	je	SHORT $L71892
	push	5
	push	OFFSET FLAT:$SG71893
	push	0
	push	0
	push	0
	mov	edx, DWORD PTR _ctrl$[ebp]
	mov	eax, DWORD PTR [edx+284]
	push	eax
	push	27					; 0000001bH
	push	OFFSET FLAT:$SG71894
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	edx, DWORD PTR [ecx+80]
	mov	eax, DWORD PTR [edx+232]
	push	eax
	call	_dynbuf_add3
	add	esp, 36					; 00000024H
	test	eax, eax
	je	SHORT $L71892
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29872], OFFSET FLAT:$SG71896
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 1235		; 000004d3H
	jmp	$eva_err$71897
$L71892:

; 1236 : 
; 1237 : 	if(b_shrink)

	cmp	DWORD PTR _b_shrink$[ebp], 0
	je	$L71898

; 1239 : 		/* Output enclosing table header & Add OPENSEARCH button */
; 1240 : 		DYNBUF_ADD_STR(html, "<td width=10><table cellspacing=0 cellpadding=0 border=0 rules=none width=100%><tr><td width=10>");

	push	0
	push	0
	push	96					; 00000060H
	push	OFFSET FLAT:$SG71901
	mov	eax, DWORD PTR _html$[ebp]
	push	eax
	call	_dynbuf_add
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L71900
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29872], OFFSET FLAT:$SG71903
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 1240		; 000004d8H
	jmp	$eva_err$71897
$L71900:

; 1241 : 		if(b_opensearch && table_put_opensearch_btn(cntxt, i_ctrl, NULL)) STACK_ERROR;

	cmp	DWORD PTR _b_opensearch$[ebp], 0
	je	SHORT $L71905
	push	0
	mov	eax, DWORD PTR _i_ctrl$[ebp]
	push	eax
	mov	ecx, DWORD PTR _cntxt$[ebp]
	push	ecx
	call	_table_put_opensearch_btn
	add	esp, 12					; 0000000cH
	test	eax, eax
	je	SHORT $L71905
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 1241		; 000004d9H
	jmp	$eva_err$71897
$L71905:

; 1242 : 		DYNBUF_ADD_STR(html, "</td>");

	push	0
	push	0
	push	5
	push	OFFSET FLAT:$SG71908
	mov	eax, DWORD PTR _html$[ebp]
	push	eax
	call	_dynbuf_add
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L71907
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29872], OFFSET FLAT:$SG71910
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 1242		; 000004daH
	jmp	$eva_err$71897
$L71907:

; 1243 : 		if(!tbl->totlines && table_put_page_navigator(cntxt, i_ctrl, 0)) STACK_ERROR;

	mov	eax, DWORD PTR _tbl$[ebp]
	cmp	DWORD PTR [eax+52], 0
	jne	SHORT $L71911
	push	0
	mov	ecx, DWORD PTR _i_ctrl$[ebp]
	push	ecx
	mov	edx, DWORD PTR _cntxt$[ebp]
	push	edx
	call	_table_put_page_navigator
	add	esp, 12					; 0000000cH
	test	eax, eax
	je	SHORT $L71911
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 1243		; 000004dbH
	jmp	$eva_err$71897
$L71911:

; 1245 : 	else

	jmp	$L71944
$L71898:

; 1247 : 		int b_label = 0, nblabel = 0;

	mov	DWORD PTR _b_label$71913[ebp], 0
	mov	DWORD PTR _nblabel$71914[ebp], 0

; 1248 : 
; 1249 : 		/* Output enclosing table header */
; 1250 : 		DYNBUF_ADD3_INT(html, "<td><table cellspacing=0 cellpadding=0 border=", 0, " rules=none width=100%><tr><td>");

	push	31					; 0000001fH
	push	OFFSET FLAT:$SG71916
	push	0
	push	46					; 0000002eH
	push	OFFSET FLAT:$SG71917
	mov	ecx, DWORD PTR _html$[ebp]
	push	ecx
	call	_dynbuf_add3_int
	add	esp, 24					; 00000018H
	test	eax, eax
	je	SHORT $L71915
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29872], OFFSET FLAT:$SG71919
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 1250		; 000004e2H
	jmp	$eva_err$71897
$L71915:

; 1251 : 
; 1252 : 		/* Add CLOSESEARCH / OPENSEARCH button */
; 1253 : 		if(!(tbl->status & TblCtrl_extsearch) || (tbl->status & TblCtrl_sel))

	mov	ecx, DWORD PTR _tbl$[ebp]
	mov	edx, DWORD PTR [ecx+32]
	and	edx, 8192				; 00002000H
	test	edx, edx
	je	SHORT $L71921
	mov	eax, DWORD PTR _tbl$[ebp]
	mov	ecx, DWORD PTR [eax+32]
	and	ecx, 256				; 00000100H
	test	ecx, ecx
	je	SHORT $L71923
$L71921:

; 1254 : 			if(b_opensearch ?
; 1255 : 				table_put_opensearch_btn(cntxt, i_ctrl, NULL) :
; 1256 : 				(tbl->status & (TblCtrl_search | TblCtrl_sel) &&
; 1257 : 					table_put_closesearch_btn(cntxt, i_ctrl))) STACK_ERROR

	cmp	DWORD PTR _b_opensearch$[ebp], 0
	je	SHORT $L73478
	push	0
	mov	edx, DWORD PTR _i_ctrl$[ebp]
	push	edx
	mov	eax, DWORD PTR _cntxt$[ebp]
	push	eax
	call	_table_put_opensearch_btn
	add	esp, 12					; 0000000cH
	mov	DWORD PTR -44+[ebp], eax
	jmp	SHORT $L73479
$L73478:
	mov	ecx, DWORD PTR _tbl$[ebp]
	mov	edx, DWORD PTR [ecx+32]
	and	edx, 272				; 00000110H
	test	edx, edx
	je	SHORT $L73476
	mov	eax, DWORD PTR _i_ctrl$[ebp]
	push	eax
	mov	ecx, DWORD PTR _cntxt$[ebp]
	push	ecx
	call	_table_put_closesearch_btn
	add	esp, 8
	test	eax, eax
	je	SHORT $L73476
	mov	DWORD PTR -48+[ebp], 1
	jmp	SHORT $L73477
$L73476:
	mov	DWORD PTR -48+[ebp], 0
$L73477:
	mov	edx, DWORD PTR -48+[ebp]
	mov	DWORD PTR -44+[ebp], edx
$L73479:
	cmp	DWORD PTR -44+[ebp], 0
	je	SHORT $L71923
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 1257		; 000004e9H
	jmp	$eva_err$71897
$L71923:

; 1258 : 
; 1259 : 		/* Add function buttons */
; 1260 : 		if(table_put_functions_btn(cntxt, i_ctrl, NULL, 0)) STACK_ERROR;

	push	0
	push	0
	mov	ecx, DWORD PTR _i_ctrl$[ebp]
	push	ecx
	mov	edx, DWORD PTR _cntxt$[ebp]
	push	edx
	call	_table_put_functions_btn
	add	esp, 16					; 00000010H
	test	eax, eax
	je	SHORT $L71925
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 1260		; 000004ecH
	jmp	$eva_err$71897
$L71925:

; 1261 : 
; 1262 : 		/* Add CLEAR button */
; 1263 : 		if(tbl->status & TblCtrl_sel && form->step == HtmlEdit &&
; 1264 : 			table_put_clear_btn(cntxt, i_ctrl)) STACK_ERROR;

	mov	ecx, DWORD PTR _tbl$[ebp]
	mov	edx, DWORD PTR [ecx+32]
	and	edx, 256				; 00000100H
	test	edx, edx
	je	SHORT $L71926
	mov	eax, DWORD PTR _form$[ebp]
	cmp	DWORD PTR [eax+176], 4
	jne	SHORT $L71926
	mov	ecx, DWORD PTR _i_ctrl$[ebp]
	push	ecx
	mov	edx, DWORD PTR _cntxt$[ebp]
	push	edx
	call	_table_put_clear_btn
	add	esp, 8
	test	eax, eax
	je	SHORT $L71926
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 1264		; 000004f0H
	jmp	$eva_err$71897
$L71926:

; 1265 : 		DYNBUF_ADD_STR(html, "</td>");

	push	0
	push	0
	push	5
	push	OFFSET FLAT:$SG71929
	mov	ecx, DWORD PTR _html$[ebp]
	push	ecx
	call	_dynbuf_add
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L71928
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29872], OFFSET FLAT:$SG71931
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 1265		; 000004f1H
	jmp	$eva_err$71897
$L71928:

; 1266 : 
; 1267 : 		/* Output extra filters list if applicable */
; 1268 : 		if(tbl->altfilter.nbrows)

	mov	ecx, DWORD PTR _tbl$[ebp]
	cmp	DWORD PTR [ecx+260], 0
	je	SHORT $L71934

; 1270 : 			b_label = 1;

	mov	DWORD PTR _b_label$71913[ebp], 1

; 1271 : 			if(table_put_filter_list(cntxt, i_ctrl, &b_label)) STACK_ERROR;

	lea	edx, DWORD PTR _b_label$71913[ebp]
	push	edx
	mov	eax, DWORD PTR _i_ctrl$[ebp]
	push	eax
	mov	ecx, DWORD PTR _cntxt$[ebp]
	push	ecx
	call	_table_put_filter_list
	add	esp, 12					; 0000000cH
	test	eax, eax
	je	SHORT $L71933
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 1271		; 000004f7H
	jmp	$eva_err$71897
$L71933:

; 1272 : 			if(b_label) nblabel++;

	cmp	DWORD PTR _b_label$71913[ebp], 0
	je	SHORT $L71934
	mov	eax, DWORD PTR _nblabel$71914[ebp]
	add	eax, 1
	mov	DWORD PTR _nblabel$71914[ebp], eax
$L71934:

; 1274 : 
; 1275 : 		/* Add text input for seach & add functions */
; 1276 : 		if(tbl->status & (TblCtrl_opensearch | TblCtrl_openaddnew))

	mov	ecx, DWORD PTR _tbl$[ebp]
	mov	edx, DWORD PTR [ecx+32]
	and	edx, 160				; 000000a0H
	test	edx, edx
	je	SHORT $L71937

; 1278 : 			b_label = 1;

	mov	DWORD PTR _b_label$71913[ebp], 1

; 1279 : 			if(table_put_search_input(cntxt, i_ctrl, &b_label)) STACK_ERROR;

	lea	eax, DWORD PTR _b_label$71913[ebp]
	push	eax
	mov	ecx, DWORD PTR _i_ctrl$[ebp]
	push	ecx
	mov	edx, DWORD PTR _cntxt$[ebp]
	push	edx
	call	_table_put_search_input
	add	esp, 12					; 0000000cH
	test	eax, eax
	je	SHORT $L71936
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 1279		; 000004ffH
	jmp	$eva_err$71897
$L71936:

; 1280 : 			if(b_label) nblabel++;

	cmp	DWORD PTR _b_label$71913[ebp], 0
	je	SHORT $L71937
	mov	ecx, DWORD PTR _nblabel$71914[ebp]
	add	ecx, 1
	mov	DWORD PTR _nblabel$71914[ebp], ecx
$L71937:

; 1282 : 
; 1283 : 		/* Output navigation controls */
; 1284 : 		if(tbl->totlines > tbl->lines && nblabel) DYNBUF_ADD_STR(html, "</tr><tr>");

	mov	edx, DWORD PTR _tbl$[ebp]
	mov	eax, DWORD PTR _tbl$[ebp]
	mov	ecx, DWORD PTR [edx+52]
	cmp	ecx, DWORD PTR [eax+44]
	jbe	SHORT $L71940
	cmp	DWORD PTR _nblabel$71914[ebp], 0
	je	SHORT $L71940
	push	0
	push	0
	push	9
	push	OFFSET FLAT:$SG71941
	mov	edx, DWORD PTR _html$[ebp]
	push	edx
	call	_dynbuf_add
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L71940
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29872], OFFSET FLAT:$SG71943
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 1284		; 00000504H
	jmp	$eva_err$71897
$L71940:

; 1285 : 		if(table_put_page_navigator(cntxt, i_ctrl, 0)) STACK_ERROR;

	push	0
	mov	edx, DWORD PTR _i_ctrl$[ebp]
	push	edx
	mov	eax, DWORD PTR _cntxt$[ebp]
	push	eax
	call	_table_put_page_navigator
	add	esp, 12					; 0000000cH
	test	eax, eax
	je	SHORT $L71944
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 1285		; 00000505H
	jmp	$eva_err$71897
$L71944:

; 1287 : 
; 1288 : 	/* Output table footer */
; 1289 : 	DYNBUF_ADD_STR(html, "</tr></table></td>");

	push	0
	push	0
	push	18					; 00000012H
	push	OFFSET FLAT:$SG71947
	mov	edx, DWORD PTR _html$[ebp]
	push	edx
	call	_dynbuf_add
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L71946
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29872], OFFSET FLAT:$SG71949
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 1289		; 00000509H
	jmp	$eva_err$71897
$L71946:

; 1290 : 	if(!b_shrink) DYNBUF_ADD_STR(html, "</tr><tr>");

	cmp	DWORD PTR _b_shrink$[ebp], 0
	jne	SHORT $L71952
	push	0
	push	0
	push	9
	push	OFFSET FLAT:$SG71953
	mov	edx, DWORD PTR _html$[ebp]
	push	edx
	call	_dynbuf_add
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L71952
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29872], OFFSET FLAT:$SG71955
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 1290		; 0000050aH
	jmp	SHORT $eva_err$71897
$L71952:

; 1291 : 
; 1292 : 	if(cntxt->debug & DEBUG_HTML) DYNBUF_ADD3(cntxt->form->html, "\n<!--- EndOf TableControls ", ctrl->LABEL, 0, NO_CONV, " -->\n");

	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	eax, DWORD PTR [edx+29860]
	and	eax, 128				; 00000080H
	test	eax, eax
	je	SHORT $L71958
	push	5
	push	OFFSET FLAT:$SG71959
	push	0
	push	0
	push	0
	mov	ecx, DWORD PTR _ctrl$[ebp]
	mov	edx, DWORD PTR [ecx+284]
	push	edx
	push	27					; 0000001bH
	push	OFFSET FLAT:$SG71960
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	ecx, DWORD PTR [eax+80]
	mov	edx, DWORD PTR [ecx+232]
	push	edx
	call	_dynbuf_add3
	add	esp, 36					; 00000024H
	test	eax, eax
	je	SHORT $L71958
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29872], OFFSET FLAT:$SG71962
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 1292		; 0000050cH
	jmp	SHORT $eva_err$71897
$L71958:
$eva_noerr$71963:

; 1293 : 
; 1294 : 	RETURN_OK_CLEANUP;

	push	0
	push	OFFSET FLAT:$SG71964
	push	OFFSET FLAT:$SG71965
	mov	edx, DWORD PTR _cntxt$[ebp]
	push	edx
	call	_err_clear
	add	esp, 16					; 00000010H
$eva_err$71897:
	mov	eax, DWORD PTR _cntxt$[ebp]
	cmp	DWORD PTR [eax+29872], 0
	je	SHORT $L71966
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	edx, DWORD PTR [ecx+29900]
	push	edx
	push	OFFSET FLAT:$SG71967
	push	OFFSET FLAT:$SG71968
	mov	eax, DWORD PTR _cntxt$[ebp]
	push	eax
	call	_err_add_context
	add	esp, 16					; 00000010H
$L71966:
	mov	ecx, DWORD PTR _cntxt$[ebp]
	xor	eax, eax
	cmp	DWORD PTR [ecx+29872], 0
	setne	al
$L71881:

; 1295 : }

	mov	esp, ebp
	pop	ebp
	ret	0
_table_put_controls ENDP
_TEXT	ENDS
PUBLIC	_table_put_title_row
_BSS	SEGMENT
	ALIGN	4

$SG72052 DB	01H DUP (?)
_BSS	ENDS
_DATA	SEGMENT
	ORG $+1
$SG71989 DB	'_EVA_TITLE_HEIGHT', 00H
	ORG $+2
$SG72003 DB	'2', 00H
	ORG $+2
$SG72004 DB	'_EVA_TABLE_NOTITLESHRINK', 00H
	ORG $+3
$SG72007 DB	'</tr>', 00H
	ORG $+2
$SG72009 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG72014 DB	' -->', 0aH, 00H
	ORG $+2
$SG72015 DB	0aH, '<!--- Start TableTitleRow ', 00H
$SG72017 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG72021 DB	'<th>&nbsp;</th>', 00H
$SG72023 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG72027 DB	'<th><nobr>&nbsp;', 00H
	ORG $+3
$SG72029 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG72033 DB	'</th>', 00H
	ORG $+2
$SG72035 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG72043 DB	'<th', 00H
$SG72045 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG72048 DB	'center', 00H
	ORG $+1
$SG72049 DB	'right', 00H
	ORG $+2
$SG72053 DB	' align=', 00H
$SG72055 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG72059 DB	'>', 00H
	ORG $+2
$SG72060 DB	' class=', 00H
$SG72062 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG72066 DB	'><font size=-1>', 00H
$SG72068 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG72072 DB	'<nobr>', 00H
	ORG $+1
$SG72074 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG72077 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG72081 DB	'<br><center>', 00H
	ORG $+3
$SG72083 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG72087 DB	' ', 00H
	ORG $+2
$SG72089 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG72091 DB	'_EVA_AGE', 00H
	ORG $+3
$SG72094 DB	'</th>', 0aH, 00H
	ORG $+1
$SG72096 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG72099 DB	'</tr>', 00H
	ORG $+2
$SG72101 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG72105 DB	' -->', 0aH, 00H
	ORG $+2
$SG72106 DB	0aH, '<!--- EndOf TableTitleRow ', 00H
$SG72108 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG72109 DB	'D:\Travail\ABI\EVA\V4.0\CGI\Brunix-2016\table_utils.c', 00H
	ORG $+2
$SG72110 DB	'table_put_title_row', 00H
$SG72112 DB	'D:\Travail\ABI\EVA\V4.0\CGI\Brunix-2016\table_utils.c', 00H
	ORG $+2
$SG72113 DB	'table_put_title_row', 00H
_DATA	ENDS
_TEXT	SEGMENT
_cntxt$ = 8
_i_ctrl$ = 12
_titlemode$ = 16
_form$ = -8
_ctrl$ = -44
_tbl$ = -16
_val$ = -4
_name$ = -40
_height$ = -36
_i$ = -24
_k$ = -32
_b_search$ = -28
_b_sort$ = -20
_html$ = -12
_style$72039 = -52
_align$72040 = -48
_table_put_title_row PROC NEAR

; 1310 : ){

	push	ebp
	mov	ebp, esp
	sub	esp, 72					; 00000048H

; 1311 : 	EVA_form *form = cntxt->form;

	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	ecx, DWORD PTR [eax+80]
	mov	DWORD PTR _form$[ebp], ecx

; 1312 : 	EVA_ctrl *ctrl = form->ctrl + i_ctrl;

	mov	edx, DWORD PTR _i_ctrl$[ebp]
	imul	edx, 480				; 000001e0H
	mov	eax, DWORD PTR _form$[ebp]
	mov	ecx, DWORD PTR [eax]
	add	ecx, edx
	mov	DWORD PTR _ctrl$[ebp], ecx

; 1313 : 	ObjTableFormat *tbl = ctrl->objtbl;

	mov	edx, DWORD PTR _ctrl$[ebp]
	mov	eax, DWORD PTR [edx+232]
	mov	DWORD PTR _tbl$[ebp], eax

; 1314 : 	DynBuffer *val = NULL;

	mov	DWORD PTR _val$[ebp], 0

; 1315 : 	DynBuffer *name = NULL;

	mov	DWORD PTR _name$[ebp], 0

; 1316 : 	unsigned height = strtoul(DYNTAB_FIELD_VAL(tbl->attr, TITLE_HEIGHT), NULL, 10);

	push	10					; 0000000aH
	push	0
	push	0
	push	-1
	push	OFFSET FLAT:$SG71989
	mov	ecx, DWORD PTR _tbl$[ebp]
	mov	edx, DWORD PTR [ecx]
	push	edx
	call	_dyntab_field_val
	add	esp, 16					; 00000010H
	push	eax
	call	_strtoul
	add	esp, 12					; 0000000cH
	mov	DWORD PTR _height$[ebp], eax

; 1317 : 	unsigned long i, k;
; 1318 : 	int b_search = tbl->status & TblCtrl_opensearch && form->step != HtmlPrint;

	mov	eax, DWORD PTR _tbl$[ebp]
	mov	ecx, DWORD PTR [eax+32]
	and	ecx, 32					; 00000020H
	test	ecx, ecx
	je	SHORT $L73481
	mov	edx, DWORD PTR _form$[ebp]
	cmp	DWORD PTR [edx+176], 7
	je	SHORT $L73481
	mov	DWORD PTR -56+[ebp], 1
	jmp	SHORT $L73482
$L73481:
	mov	DWORD PTR -56+[ebp], 0
$L73482:
	mov	eax, DWORD PTR -56+[ebp]
	mov	DWORD PTR _b_search$[ebp], eax

; 1319 : 	int b_sort = (tbl->b_sortsel || tbl->status & TblCtrl_sort) && cntxt->form->step != HtmlPrint;

	mov	ecx, DWORD PTR _tbl$[ebp]
	cmp	DWORD PTR [ecx+68], 0
	jne	SHORT $L73483
	mov	edx, DWORD PTR _tbl$[ebp]
	mov	eax, DWORD PTR [edx+32]
	and	eax, 1
	test	eax, eax
	je	SHORT $L73484
$L73483:
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	edx, DWORD PTR [ecx+80]
	cmp	DWORD PTR [edx+176], 7
	je	SHORT $L73484
	mov	DWORD PTR -60+[ebp], 1
	jmp	SHORT $L73485
$L73484:
	mov	DWORD PTR -60+[ebp], 0
$L73485:
	mov	eax, DWORD PTR -60+[ebp]
	mov	DWORD PTR _b_sort$[ebp], eax

; 1320 : 	CHECK_HTML_STATUS;

	cmp	DWORD PTR _cntxt$[ebp], 0
	je	SHORT $L73488
	mov	ecx, DWORD PTR _cntxt$[ebp]
	cmp	DWORD PTR [ecx+80], 0
	je	SHORT $L73486
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	eax, DWORD PTR [edx+80]
	mov	ecx, DWORD PTR [eax+232]
	mov	DWORD PTR -64+[ebp], ecx
	jmp	SHORT $L73487
$L73486:
	mov	DWORD PTR -64+[ebp], 0
$L73487:
	mov	edx, DWORD PTR -64+[ebp]
	mov	DWORD PTR -68+[ebp], edx
	jmp	SHORT $L73489
$L73488:
	mov	DWORD PTR -68+[ebp], 0
$L73489:
	mov	eax, DWORD PTR -68+[ebp]
	mov	DWORD PTR _html$[ebp], eax
	cmp	DWORD PTR _html$[ebp], 0
	jne	SHORT $L71997
	xor	eax, eax
	jmp	$L71979
$L71997:

; 1321 : 	if(!tbl->totlines && !(tbl->status & TblCtrl_opensearch)) RETURN_OK;

	mov	ecx, DWORD PTR _tbl$[ebp]
	cmp	DWORD PTR [ecx+52], 0
	jne	SHORT $L71998
	mov	edx, DWORD PTR _tbl$[ebp]
	mov	eax, DWORD PTR [edx+32]
	and	eax, 32					; 00000020H
	test	eax, eax
	jne	SHORT $L71998
	jmp	$eva_noerr$71999
$L71998:

; 1322 : 
; 1323 : 	/* Do not output if not applicable */
; 1324 : 	if(!(tbl->label.nbrows || b_sort) || !strcmp(DYNTAB_FIELD_VAL(tbl->attr, TABLE_NOTITLESHRINK), "2"))

	mov	ecx, DWORD PTR _tbl$[ebp]
	cmp	DWORD PTR [ecx+360], 0
	jne	SHORT $L72002
	cmp	DWORD PTR _b_sort$[ebp], 0
	je	SHORT $L72001
$L72002:
	push	OFFSET FLAT:$SG72003
	push	0
	push	-1
	push	OFFSET FLAT:$SG72004
	mov	edx, DWORD PTR _tbl$[ebp]
	mov	eax, DWORD PTR [edx]
	push	eax
	call	_dyntab_field_val
	add	esp, 16					; 00000010H
	push	eax
	call	_strcmp
	add	esp, 8
	test	eax, eax
	jne	SHORT $L72000
$L72001:

; 1326 : 		DYNBUF_ADD_STR(html, "</tr>");

	push	0
	push	0
	push	5
	push	OFFSET FLAT:$SG72007
	mov	ecx, DWORD PTR _html$[ebp]
	push	ecx
	call	_dynbuf_add
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L72006
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29872], OFFSET FLAT:$SG72009
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 1326		; 0000052eH
	jmp	$eva_err$72010
$L72006:

; 1327 : 		RETURN_OK;

	jmp	$eva_noerr$71999
$L72000:

; 1329 : 
; 1330 : 	if(cntxt->debug & DEBUG_HTML) DYNBUF_ADD3(cntxt->form->html, "\n<!--- Start TableTitleRow ", ctrl->LABEL, 0, NO_CONV, " -->\n");

	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	edx, DWORD PTR [ecx+29860]
	and	edx, 128				; 00000080H
	test	edx, edx
	je	SHORT $L72013
	push	5
	push	OFFSET FLAT:$SG72014
	push	0
	push	0
	push	0
	mov	eax, DWORD PTR _ctrl$[ebp]
	mov	ecx, DWORD PTR [eax+284]
	push	ecx
	push	27					; 0000001bH
	push	OFFSET FLAT:$SG72015
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	eax, DWORD PTR [edx+80]
	mov	ecx, DWORD PTR [eax+232]
	push	ecx
	call	_dynbuf_add3
	add	esp, 36					; 00000024H
	test	eax, eax
	je	SHORT $L72013
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29872], OFFSET FLAT:$SG72017
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 1330		; 00000532H
	jmp	$eva_err$72010
$L72013:

; 1331 : 
; 1332 : 	/* Leave blank cells for selection checkbox & open button */
; 1333 : 	if(tbl->status & TblCtrl_sel) DYNBUF_ADD_STR(html, "<th>&nbsp;</th>");

	mov	ecx, DWORD PTR _tbl$[ebp]
	mov	edx, DWORD PTR [ecx+32]
	and	edx, 256				; 00000100H
	test	edx, edx
	je	SHORT $L72020
	push	0
	push	0
	push	15					; 0000000fH
	push	OFFSET FLAT:$SG72021
	mov	eax, DWORD PTR _html$[ebp]
	push	eax
	call	_dynbuf_add
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L72020
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29872], OFFSET FLAT:$SG72023
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 1333		; 00000535H
	jmp	$eva_err$72010
$L72020:

; 1334 : 	if(tbl->status & TblCtrl_openbtn)

	mov	eax, DWORD PTR _tbl$[ebp]
	mov	ecx, DWORD PTR [eax+32]
	and	ecx, 2048				; 00000800H
	test	ecx, ecx
	je	$L72032

; 1336 : 		DYNBUF_ADD_STR(html, "<th><nobr>&nbsp;");

	push	0
	push	0
	push	16					; 00000010H
	push	OFFSET FLAT:$SG72027
	mov	edx, DWORD PTR _html$[ebp]
	push	edx
	call	_dynbuf_add
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L72026
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29872], OFFSET FLAT:$SG72029
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 1336		; 00000538H
	jmp	$eva_err$72010
$L72026:

; 1337 : 		if(titlemode != 4 && table_add_searchsort_btn(cntxt, ctrl, tbl->field.nbrows, b_search, b_sort, 0)) STACK_ERROR;

	cmp	DWORD PTR _titlemode$[ebp], 4
	je	SHORT $L72030
	push	0
	mov	edx, DWORD PTR _b_sort$[ebp]
	push	edx
	mov	eax, DWORD PTR _b_search$[ebp]
	push	eax
	mov	ecx, DWORD PTR _tbl$[ebp]
	mov	edx, DWORD PTR [ecx+380]
	push	edx
	mov	eax, DWORD PTR _ctrl$[ebp]
	push	eax
	mov	ecx, DWORD PTR _cntxt$[ebp]
	push	ecx
	call	_table_add_searchsort_btn
	add	esp, 24					; 00000018H
	test	eax, eax
	je	SHORT $L72030
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 1337		; 00000539H
	jmp	$eva_err$72010
$L72030:

; 1338 : 		DYNBUF_ADD_STR(html, "</th>");

	push	0
	push	0
	push	5
	push	OFFSET FLAT:$SG72033
	mov	eax, DWORD PTR _html$[ebp]
	push	eax
	call	_dynbuf_add
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L72032
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29872], OFFSET FLAT:$SG72035
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 1338		; 0000053aH
	jmp	$eva_err$72010
$L72032:

; 1340 : 
; 1341 : 	/* For each display field */
; 1342 : 	k = (tbl->colbrk > 0 && tbl->colbrk <= tbl->field.nbrows) ? tbl->colbrk - 1 : tbl->field.nbrows;

	mov	eax, DWORD PTR _tbl$[ebp]
	cmp	DWORD PTR [eax+660], 0
	jbe	SHORT $L73490
	mov	ecx, DWORD PTR _tbl$[ebp]
	mov	edx, DWORD PTR _tbl$[ebp]
	mov	eax, DWORD PTR [ecx+660]
	cmp	eax, DWORD PTR [edx+380]
	ja	SHORT $L73490
	mov	ecx, DWORD PTR _tbl$[ebp]
	mov	edx, DWORD PTR [ecx+660]
	sub	edx, 1
	mov	DWORD PTR -72+[ebp], edx
	jmp	SHORT $L73491
$L73490:
	mov	eax, DWORD PTR _tbl$[ebp]
	mov	ecx, DWORD PTR [eax+380]
	mov	DWORD PTR -72+[ebp], ecx
$L73491:
	mov	edx, DWORD PTR -72+[ebp]
	mov	DWORD PTR _k$[ebp], edx

; 1343 : 	for(i = 0; i < k; i++)

	mov	DWORD PTR _i$[ebp], 0
	jmp	SHORT $L72036
$L72037:
	mov	eax, DWORD PTR _i$[ebp]
	add	eax, 1
	mov	DWORD PTR _i$[ebp], eax
$L72036:
	mov	ecx, DWORD PTR _i$[ebp]
	cmp	ecx, DWORD PTR _k$[ebp]
	jae	$L72038

; 1345 : 		char * style = dyntab_val(&tbl->lblstyle, i, 0);

	push	0
	mov	edx, DWORD PTR _i$[ebp]
	push	edx
	mov	eax, DWORD PTR _tbl$[ebp]
	add	eax, 540				; 0000021cH
	push	eax
	call	_dyntab_val
	add	esp, 12					; 0000000cH
	mov	DWORD PTR _style$72039[ebp], eax

; 1346 : 		char * align = dyntab_val(&tbl->align, i, 0);

	push	0
	mov	ecx, DWORD PTR _i$[ebp]
	push	ecx
	mov	edx, DWORD PTR _tbl$[ebp]
	add	edx, 440				; 000001b8H
	push	edx
	call	_dyntab_val
	add	esp, 12					; 0000000cH
	mov	DWORD PTR _align$72040[ebp], eax

; 1347 : 
; 1348 : 		/* Output title label */
; 1349 : 		DYNBUF_ADD_STR(html, "<th");

	push	0
	push	0
	push	3
	push	OFFSET FLAT:$SG72043
	mov	eax, DWORD PTR _html$[ebp]
	push	eax
	call	_dynbuf_add
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L72042
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29872], OFFSET FLAT:$SG72045
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 1349		; 00000545H
	jmp	$eva_err$72010
$L72042:

; 1350 : 		if(!strcmp(align, "center") || !strcmp(align, "right"))

	push	OFFSET FLAT:$SG72048
	mov	eax, DWORD PTR _align$72040[ebp]
	push	eax
	call	_strcmp
	add	esp, 8
	test	eax, eax
	je	SHORT $L72047
	push	OFFSET FLAT:$SG72049
	mov	ecx, DWORD PTR _align$72040[ebp]
	push	ecx
	call	_strcmp
	add	esp, 8
	test	eax, eax
	jne	SHORT $L72051
$L72047:

; 1351 : 			DYNBUF_ADD3(html, " align=", align, 0, NO_CONV, "");

	push	0
	push	OFFSET FLAT:$SG72052
	push	0
	push	0
	push	0
	mov	edx, DWORD PTR _align$72040[ebp]
	push	edx
	push	7
	push	OFFSET FLAT:$SG72053
	mov	eax, DWORD PTR _html$[ebp]
	push	eax
	call	_dynbuf_add3
	add	esp, 36					; 00000024H
	test	eax, eax
	je	SHORT $L72051
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29872], OFFSET FLAT:$SG72055
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 1351		; 00000547H
	jmp	$eva_err$72010
$L72051:

; 1352 : 		if(*style) DYNBUF_ADD3(html, " class=", style, 0, NO_CONV, ">")

	mov	eax, DWORD PTR _style$72039[ebp]
	movsx	ecx, BYTE PTR [eax]
	test	ecx, ecx
	je	SHORT $L72056
	push	1
	push	OFFSET FLAT:$SG72059
	push	0
	push	0
	push	0
	mov	edx, DWORD PTR _style$72039[ebp]
	push	edx
	push	7
	push	OFFSET FLAT:$SG72060
	mov	eax, DWORD PTR _html$[ebp]
	push	eax
	call	_dynbuf_add3
	add	esp, 36					; 00000024H
	test	eax, eax
	je	SHORT $L72058
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29872], OFFSET FLAT:$SG72062
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 1352		; 00000548H
	jmp	$eva_err$72010
$L72058:

; 1353 : 		else DYNBUF_ADD_STR(html, "><font size=-1>");

	jmp	SHORT $L72065
$L72056:
	push	0
	push	0
	push	15					; 0000000fH
	push	OFFSET FLAT:$SG72066
	mov	eax, DWORD PTR _html$[ebp]
	push	eax
	call	_dynbuf_add
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L72065
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29872], OFFSET FLAT:$SG72068
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 1353		; 00000549H
	jmp	$eva_err$72010
$L72065:

; 1354 : 		if(height < 3 && !*style) DYNBUF_ADD_STR(html, "<nobr>");

	cmp	DWORD PTR _height$[ebp], 3
	jae	SHORT $L72071
	mov	eax, DWORD PTR _style$72039[ebp]
	movsx	ecx, BYTE PTR [eax]
	test	ecx, ecx
	jne	SHORT $L72071
	push	0
	push	0
	push	6
	push	OFFSET FLAT:$SG72072
	mov	edx, DWORD PTR _html$[ebp]
	push	edx
	call	_dynbuf_add
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L72071
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29872], OFFSET FLAT:$SG72074
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 1354		; 0000054aH
	jmp	$eva_err$72010
$L72071:

; 1355 : 		DYNBUF_ADD_CELL(html, &tbl->label, i, 0, TO_HTML);

	push	1
	push	OFFSET FLAT:_plain_to_html
	push	0
	mov	edx, DWORD PTR _i$[ebp]
	push	edx
	mov	eax, DWORD PTR _tbl$[ebp]
	add	eax, 360				; 00000168H
	push	eax
	call	_dyntab_sz
	add	esp, 12					; 0000000cH
	push	eax
	push	0
	mov	ecx, DWORD PTR _i$[ebp]
	push	ecx
	mov	edx, DWORD PTR _tbl$[ebp]
	add	edx, 360				; 00000168H
	push	edx
	call	_dyntab_val
	add	esp, 12					; 0000000cH
	push	eax
	mov	eax, DWORD PTR _html$[ebp]
	push	eax
	call	_dynbuf_add
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L72075
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29872], OFFSET FLAT:$SG72077
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 1355		; 0000054bH
	jmp	$eva_err$72010
$L72075:

; 1356 : 		if(height == 2) DYNBUF_ADD_STR(html, "<br><center>")

	cmp	DWORD PTR _height$[ebp], 2
	jne	SHORT $L72078
	push	0
	push	0
	push	12					; 0000000cH
	push	OFFSET FLAT:$SG72081
	mov	eax, DWORD PTR _html$[ebp]
	push	eax
	call	_dynbuf_add
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L72080
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29872], OFFSET FLAT:$SG72083
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 1356		; 0000054cH
	jmp	$eva_err$72010
$L72080:

; 1357 : 		else DYNBUF_ADD_STR(html, " ");

	jmp	SHORT $L72086
$L72078:
	push	0
	push	0
	push	1
	push	OFFSET FLAT:$SG72087
	mov	eax, DWORD PTR _html$[ebp]
	push	eax
	call	_dynbuf_add
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L72086
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29872], OFFSET FLAT:$SG72089
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 1357		; 0000054dH
	jmp	$eva_err$72010
$L72086:

; 1358 : 
; 1359 : 		/* Output search & sort buttons as applicable */
; 1360 : 		if(titlemode != 4 && table_add_searchsort_btn(cntxt, ctrl, i, b_search, b_sort, !strcmp("_EVA_AGE", dyntab_val(&tbl->format, i, 0)))) STACK_ERROR;

	cmp	DWORD PTR _titlemode$[ebp], 4
	je	SHORT $L72090
	push	0
	mov	eax, DWORD PTR _i$[ebp]
	push	eax
	mov	ecx, DWORD PTR _tbl$[ebp]
	add	ecx, 400				; 00000190H
	push	ecx
	call	_dyntab_val
	add	esp, 12					; 0000000cH
	push	eax
	push	OFFSET FLAT:$SG72091
	call	_strcmp
	add	esp, 8
	neg	eax
	sbb	eax, eax
	inc	eax
	push	eax
	mov	edx, DWORD PTR _b_sort$[ebp]
	push	edx
	mov	eax, DWORD PTR _b_search$[ebp]
	push	eax
	mov	ecx, DWORD PTR _i$[ebp]
	push	ecx
	mov	edx, DWORD PTR _ctrl$[ebp]
	push	edx
	mov	eax, DWORD PTR _cntxt$[ebp]
	push	eax
	call	_table_add_searchsort_btn
	add	esp, 24					; 00000018H
	test	eax, eax
	je	SHORT $L72090
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 1360		; 00000550H
	jmp	$eva_err$72010
$L72090:

; 1361 : 		DYNBUF_ADD_STR(html, "</th>\n");

	push	0
	push	0
	push	6
	push	OFFSET FLAT:$SG72094
	mov	edx, DWORD PTR _html$[ebp]
	push	edx
	call	_dynbuf_add
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L72093
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29872], OFFSET FLAT:$SG72096
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 1361		; 00000551H
	jmp	$eva_err$72010
$L72093:

; 1362 : 	}

	jmp	$L72037
$L72038:

; 1363 : 	DYNBUF_ADD_STR(html, "</tr>");

	push	0
	push	0
	push	5
	push	OFFSET FLAT:$SG72099
	mov	edx, DWORD PTR _html$[ebp]
	push	edx
	call	_dynbuf_add
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L72098
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29872], OFFSET FLAT:$SG72101
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 1363		; 00000553H
	jmp	SHORT $eva_err$72010
$L72098:

; 1364 : 
; 1365 : 	if(cntxt->debug & DEBUG_HTML) DYNBUF_ADD3(cntxt->form->html, "\n<!--- EndOf TableTitleRow ", ctrl->LABEL, 0, NO_CONV, " -->\n");

	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	eax, DWORD PTR [edx+29860]
	and	eax, 128				; 00000080H
	test	eax, eax
	je	SHORT $L72104
	push	5
	push	OFFSET FLAT:$SG72105
	push	0
	push	0
	push	0
	mov	ecx, DWORD PTR _ctrl$[ebp]
	mov	edx, DWORD PTR [ecx+284]
	push	edx
	push	27					; 0000001bH
	push	OFFSET FLAT:$SG72106
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	ecx, DWORD PTR [eax+80]
	mov	edx, DWORD PTR [ecx+232]
	push	edx
	call	_dynbuf_add3
	add	esp, 36					; 00000024H
	test	eax, eax
	je	SHORT $L72104
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29872], OFFSET FLAT:$SG72108
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 1365		; 00000555H
	jmp	SHORT $eva_err$72010
$L72104:
$eva_noerr$71999:

; 1366 : 
; 1367 : 	RETURN_OK_CLEANUP;

	push	0
	push	OFFSET FLAT:$SG72109
	push	OFFSET FLAT:$SG72110
	mov	edx, DWORD PTR _cntxt$[ebp]
	push	edx
	call	_err_clear
	add	esp, 16					; 00000010H
$eva_err$72010:
	mov	eax, DWORD PTR _cntxt$[ebp]
	cmp	DWORD PTR [eax+29872], 0
	je	SHORT $L72111
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	edx, DWORD PTR [ecx+29900]
	push	edx
	push	OFFSET FLAT:$SG72112
	push	OFFSET FLAT:$SG72113
	mov	eax, DWORD PTR _cntxt$[ebp]
	push	eax
	call	_err_add_context
	add	esp, 16					; 00000010H
$L72111:
	mov	ecx, DWORD PTR _val$[ebp]
	push	ecx
	call	_mem_free
	add	esp, 4
	mov	DWORD PTR _val$[ebp], 0
	mov	edx, DWORD PTR _name$[ebp]
	push	edx
	call	_mem_free
	add	esp, 4
	mov	DWORD PTR _name$[ebp], 0
	mov	eax, DWORD PTR _cntxt$[ebp]
	xor	ecx, ecx
	cmp	DWORD PTR [eax+29872], 0
	setne	cl
	mov	eax, ecx
$L71979:

; 1368 : }

	mov	esp, ebp
	pop	ebp
	ret	0
_table_put_title_row ENDP
_TEXT	ENDS
PUBLIC	_table_init_bgseq
_BSS	SEGMENT
	ALIGN	4

$SG72208 DB	01H DUP (?)
	ALIGN	4

$SG72213 DB	01H DUP (?)
_BSS	ENDS
_DATA	SEGMENT
$SG72129 DB	'_EVA_TABLEROWCOLORS', 00H
$SG72131 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG72137 DB	'_EVA_TABLEROWCOLORS', 00H
$SG72139 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG72144 DB	'_EVA_TABLEROWCOLORS', 00H
$SG72146 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG72150 DB	'_EVA_TABLEROWTRANSP', 00H
$SG72152 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG72157 DB	'_EVA_TABLEROWTRANSP', 00H
$SG72159 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG72164 DB	'_EVA_TABLEROWTRANSP', 00H
$SG72166 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG72170 DB	'_EVA_TABLEROWBG', 00H
$SG72172 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG72177 DB	'_EVA_TABLEROWBG', 00H
$SG72179 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG72184 DB	'_EVA_TABLEROWBG', 00H
$SG72186 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG72189 DB	'DDFFEE', 00H
	ORG $+1
$SG72191 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG72193 DB	'FFFFFF', 00H
	ORG $+1
$SG72195 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG72199 DB	'_EVA_LAST', 00H
	ORG $+2
$SG72203 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG72206 DB	'_EVA_FIRST', 00H
	ORG $+1
$SG72210 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG72215 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG72217 DB	'D:\Travail\ABI\EVA\V4.0\CGI\Brunix-2016\table_utils.c', 00H
	ORG $+2
$SG72218 DB	'table_init_bgseq', 00H
	ORG $+3
$SG72220 DB	'D:\Travail\ABI\EVA\V4.0\CGI\Brunix-2016\table_utils.c', 00H
	ORG $+2
$SG72221 DB	'table_init_bgseq', 00H
_DATA	ENDS
_TEXT	SEGMENT
_cntxt$ = 8
_tbl$ = 12
_bgseq$ = -8
_nbrows$ = -4
_table_init_bgseq PROC NEAR

; 1382 : ){

	push	ebp
	mov	ebp, esp
	sub	esp, 16					; 00000010H

; 1383 : 	char *bgseq;
; 1384 : 	int nbrows;
; 1385 : 	if(!tbl) return 0;

	cmp	DWORD PTR _tbl$[ebp], 0
	jne	SHORT $L72125
	xor	eax, eax
	jmp	$L72122
$L72125:

; 1386 : 
; 1387 : 	DYNTAB_FIELD_TABDEF(&tbl->bgcol, tbl->attr, TABLEROWCOLORS);

	mov	eax, DWORD PTR _tbl$[ebp]
	add	eax, 140				; 0000008cH
	push	eax
	call	_dyntab_free
	add	esp, 4
	push	0
	push	-1
	push	OFFSET FLAT:$SG72129
	mov	ecx, DWORD PTR _tbl$[ebp]
	mov	edx, DWORD PTR [ecx]
	push	edx
	push	0
	mov	eax, DWORD PTR _tbl$[ebp]
	add	eax, 140				; 0000008cH
	push	eax
	call	_dyntab_filter_field
	add	esp, 24					; 00000018H
	test	eax, eax
	jne	SHORT $L72128
	mov	ecx, DWORD PTR _tbl$[ebp]
	add	ecx, 140				; 0000008cH
	push	ecx
	call	_dyntab_order_lines
	add	esp, 4
	test	eax, eax
	je	SHORT $L72127
$L72128:
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29872], OFFSET FLAT:$SG72131
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 1387		; 0000056bH
	jmp	$eva_err$72132
$L72127:
	mov	ecx, DWORD PTR _tbl$[ebp]
	cmp	DWORD PTR [ecx+140], 0
	jne	$L72135
	mov	edx, DWORD PTR _cntxt$[ebp]
	cmp	DWORD PTR [edx+80], 0
	je	SHORT $L72135
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	ecx, DWORD PTR [eax+80]
	cmp	DWORD PTR [ecx], 0
	je	SHORT $L72135
	mov	edx, DWORD PTR _tbl$[ebp]
	add	edx, 140				; 0000008cH
	push	edx
	call	_dyntab_free
	add	esp, 4
	push	0
	push	-1
	push	OFFSET FLAT:$SG72137
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	ecx, DWORD PTR [eax+80]
	mov	edx, DWORD PTR [ecx]
	add	edx, 44					; 0000002cH
	push	edx
	push	0
	mov	eax, DWORD PTR _tbl$[ebp]
	add	eax, 140				; 0000008cH
	push	eax
	call	_dyntab_filter_field
	add	esp, 24					; 00000018H
	test	eax, eax
	jne	SHORT $L72136
	mov	ecx, DWORD PTR _tbl$[ebp]
	add	ecx, 140				; 0000008cH
	push	ecx
	call	_dyntab_order_lines
	add	esp, 4
	test	eax, eax
	je	SHORT $L72135
$L72136:
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29872], OFFSET FLAT:$SG72139
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 1387		; 0000056bH
	jmp	$eva_err$72132
$L72135:
	mov	ecx, DWORD PTR _tbl$[ebp]
	cmp	DWORD PTR [ecx+140], 0
	jne	SHORT $L72142
	mov	edx, DWORD PTR _tbl$[ebp]
	add	edx, 140				; 0000008cH
	push	edx
	call	_dyntab_free
	add	esp, 4
	push	0
	push	-1
	push	OFFSET FLAT:$SG72144
	mov	eax, DWORD PTR _cntxt$[ebp]
	add	eax, 29360				; 000072b0H
	push	eax
	push	0
	mov	ecx, DWORD PTR _tbl$[ebp]
	add	ecx, 140				; 0000008cH
	push	ecx
	call	_dyntab_filter_field
	add	esp, 24					; 00000018H
	test	eax, eax
	jne	SHORT $L72143
	mov	edx, DWORD PTR _tbl$[ebp]
	add	edx, 140				; 0000008cH
	push	edx
	call	_dyntab_order_lines
	add	esp, 4
	test	eax, eax
	je	SHORT $L72142
$L72143:
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29872], OFFSET FLAT:$SG72146
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 1387		; 0000056bH
	jmp	$eva_err$72132
$L72142:

; 1388 : 	DYNTAB_FIELD_TABDEF(&tbl->bgimg, tbl->attr, TABLEROWTRANSP);

	mov	edx, DWORD PTR _tbl$[ebp]
	add	edx, 160				; 000000a0H
	push	edx
	call	_dyntab_free
	add	esp, 4
	push	0
	push	-1
	push	OFFSET FLAT:$SG72150
	mov	eax, DWORD PTR _tbl$[ebp]
	mov	ecx, DWORD PTR [eax]
	push	ecx
	push	0
	mov	edx, DWORD PTR _tbl$[ebp]
	add	edx, 160				; 000000a0H
	push	edx
	call	_dyntab_filter_field
	add	esp, 24					; 00000018H
	test	eax, eax
	jne	SHORT $L72149
	mov	eax, DWORD PTR _tbl$[ebp]
	add	eax, 160				; 000000a0H
	push	eax
	call	_dyntab_order_lines
	add	esp, 4
	test	eax, eax
	je	SHORT $L72148
$L72149:
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29872], OFFSET FLAT:$SG72152
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 1388		; 0000056cH
	jmp	$eva_err$72132
$L72148:
	mov	eax, DWORD PTR _tbl$[ebp]
	cmp	DWORD PTR [eax+160], 0
	jne	$L72155
	mov	ecx, DWORD PTR _cntxt$[ebp]
	cmp	DWORD PTR [ecx+80], 0
	je	SHORT $L72155
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	eax, DWORD PTR [edx+80]
	cmp	DWORD PTR [eax], 0
	je	SHORT $L72155
	mov	ecx, DWORD PTR _tbl$[ebp]
	add	ecx, 160				; 000000a0H
	push	ecx
	call	_dyntab_free
	add	esp, 4
	push	0
	push	-1
	push	OFFSET FLAT:$SG72157
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	eax, DWORD PTR [edx+80]
	mov	ecx, DWORD PTR [eax]
	add	ecx, 44					; 0000002cH
	push	ecx
	push	0
	mov	edx, DWORD PTR _tbl$[ebp]
	add	edx, 160				; 000000a0H
	push	edx
	call	_dyntab_filter_field
	add	esp, 24					; 00000018H
	test	eax, eax
	jne	SHORT $L72156
	mov	eax, DWORD PTR _tbl$[ebp]
	add	eax, 160				; 000000a0H
	push	eax
	call	_dyntab_order_lines
	add	esp, 4
	test	eax, eax
	je	SHORT $L72155
$L72156:
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29872], OFFSET FLAT:$SG72159
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 1388		; 0000056cH
	jmp	$eva_err$72132
$L72155:
	mov	eax, DWORD PTR _tbl$[ebp]
	cmp	DWORD PTR [eax+160], 0
	jne	SHORT $L72162
	mov	ecx, DWORD PTR _tbl$[ebp]
	add	ecx, 160				; 000000a0H
	push	ecx
	call	_dyntab_free
	add	esp, 4
	push	0
	push	-1
	push	OFFSET FLAT:$SG72164
	mov	edx, DWORD PTR _cntxt$[ebp]
	add	edx, 29360				; 000072b0H
	push	edx
	push	0
	mov	eax, DWORD PTR _tbl$[ebp]
	add	eax, 160				; 000000a0H
	push	eax
	call	_dyntab_filter_field
	add	esp, 24					; 00000018H
	test	eax, eax
	jne	SHORT $L72163
	mov	ecx, DWORD PTR _tbl$[ebp]
	add	ecx, 160				; 000000a0H
	push	ecx
	call	_dyntab_order_lines
	add	esp, 4
	test	eax, eax
	je	SHORT $L72162
$L72163:
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29872], OFFSET FLAT:$SG72166
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 1388		; 0000056cH
	jmp	$eva_err$72132
$L72162:

; 1389 : 	bgseq = dyntab_val(&tbl->bgimg, 0, 0);

	push	0
	push	0
	mov	ecx, DWORD PTR _tbl$[ebp]
	add	ecx, 160				; 000000a0H
	push	ecx
	call	_dyntab_val
	add	esp, 12					; 0000000cH
	mov	DWORD PTR _bgseq$[ebp], eax

; 1390 : 	DYNTAB_FIELD_TABDEF(&tbl->bgimg, tbl->attr, TABLEROWBG);

	mov	edx, DWORD PTR _tbl$[ebp]
	add	edx, 160				; 000000a0H
	push	edx
	call	_dyntab_free
	add	esp, 4
	push	0
	push	-1
	push	OFFSET FLAT:$SG72170
	mov	eax, DWORD PTR _tbl$[ebp]
	mov	ecx, DWORD PTR [eax]
	push	ecx
	push	0
	mov	edx, DWORD PTR _tbl$[ebp]
	add	edx, 160				; 000000a0H
	push	edx
	call	_dyntab_filter_field
	add	esp, 24					; 00000018H
	test	eax, eax
	jne	SHORT $L72169
	mov	eax, DWORD PTR _tbl$[ebp]
	add	eax, 160				; 000000a0H
	push	eax
	call	_dyntab_order_lines
	add	esp, 4
	test	eax, eax
	je	SHORT $L72168
$L72169:
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29872], OFFSET FLAT:$SG72172
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 1390		; 0000056eH
	jmp	$eva_err$72132
$L72168:
	mov	eax, DWORD PTR _tbl$[ebp]
	cmp	DWORD PTR [eax+160], 0
	jne	$L72175
	mov	ecx, DWORD PTR _cntxt$[ebp]
	cmp	DWORD PTR [ecx+80], 0
	je	SHORT $L72175
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	eax, DWORD PTR [edx+80]
	cmp	DWORD PTR [eax], 0
	je	SHORT $L72175
	mov	ecx, DWORD PTR _tbl$[ebp]
	add	ecx, 160				; 000000a0H
	push	ecx
	call	_dyntab_free
	add	esp, 4
	push	0
	push	-1
	push	OFFSET FLAT:$SG72177
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	eax, DWORD PTR [edx+80]
	mov	ecx, DWORD PTR [eax]
	add	ecx, 44					; 0000002cH
	push	ecx
	push	0
	mov	edx, DWORD PTR _tbl$[ebp]
	add	edx, 160				; 000000a0H
	push	edx
	call	_dyntab_filter_field
	add	esp, 24					; 00000018H
	test	eax, eax
	jne	SHORT $L72176
	mov	eax, DWORD PTR _tbl$[ebp]
	add	eax, 160				; 000000a0H
	push	eax
	call	_dyntab_order_lines
	add	esp, 4
	test	eax, eax
	je	SHORT $L72175
$L72176:
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29872], OFFSET FLAT:$SG72179
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 1390		; 0000056eH
	jmp	$eva_err$72132
$L72175:
	mov	eax, DWORD PTR _tbl$[ebp]
	cmp	DWORD PTR [eax+160], 0
	jne	SHORT $L72182
	mov	ecx, DWORD PTR _tbl$[ebp]
	add	ecx, 160				; 000000a0H
	push	ecx
	call	_dyntab_free
	add	esp, 4
	push	0
	push	-1
	push	OFFSET FLAT:$SG72184
	mov	edx, DWORD PTR _cntxt$[ebp]
	add	edx, 29360				; 000072b0H
	push	edx
	push	0
	mov	eax, DWORD PTR _tbl$[ebp]
	add	eax, 160				; 000000a0H
	push	eax
	call	_dyntab_filter_field
	add	esp, 24					; 00000018H
	test	eax, eax
	jne	SHORT $L72183
	mov	ecx, DWORD PTR _tbl$[ebp]
	add	ecx, 160				; 000000a0H
	push	ecx
	call	_dyntab_order_lines
	add	esp, 4
	test	eax, eax
	je	SHORT $L72182
$L72183:
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29872], OFFSET FLAT:$SG72186
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 1390		; 0000056eH
	jmp	$eva_err$72132
$L72182:

; 1391 : 	nbrows = MAX(tbl->bgcol.nbrows, tbl->bgimg.nbrows);

	mov	ecx, DWORD PTR _tbl$[ebp]
	mov	edx, DWORD PTR _tbl$[ebp]
	mov	eax, DWORD PTR [ecx+140]
	cmp	eax, DWORD PTR [edx+160]
	jbe	SHORT $L73493
	mov	ecx, DWORD PTR _tbl$[ebp]
	mov	edx, DWORD PTR [ecx+140]
	mov	DWORD PTR -12+[ebp], edx
	jmp	SHORT $L73494
$L73493:
	mov	eax, DWORD PTR _tbl$[ebp]
	mov	ecx, DWORD PTR [eax+160]
	mov	DWORD PTR -12+[ebp], ecx
$L73494:
	mov	edx, DWORD PTR -12+[ebp]
	mov	DWORD PTR _nbrows$[ebp], edx

; 1392 : 
; 1393 : 	/* Handle full automatic mode */
; 1394 : 	if(!*bgseq && !tbl->bgcol.nbrows && !tbl->bgimg.nbrows)

	mov	eax, DWORD PTR _bgseq$[ebp]
	movsx	ecx, BYTE PTR [eax]
	test	ecx, ecx
	jne	$L72187
	mov	edx, DWORD PTR _tbl$[ebp]
	cmp	DWORD PTR [edx+140], 0
	jne	$L72187
	mov	eax, DWORD PTR _tbl$[ebp]
	cmp	DWORD PTR [eax+160], 0
	jne	$L72187

; 1396 : 		/* Light green / white sequence */
; 1397 : 		DYNTAB_SET(&tbl->bgcol, 0, 0, "DDFFEE");

	push	6
	push	OFFSET FLAT:$SG72189
	push	0
	push	0
	mov	ecx, DWORD PTR _tbl$[ebp]
	add	ecx, 140				; 0000008cH
	push	ecx
	call	_dyntab_set_txt
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L72188
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29872], OFFSET FLAT:$SG72191
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 1397		; 00000575H
	jmp	$eva_err$72132
$L72188:

; 1398 : 		DYNTAB_SET(&tbl->bgcol, 1, 0, "FFFFFF");

	push	6
	push	OFFSET FLAT:$SG72193
	push	0
	push	1
	mov	ecx, DWORD PTR _tbl$[ebp]
	add	ecx, 140				; 0000008cH
	push	ecx
	call	_dyntab_set_txt
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L72192
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29872], OFFSET FLAT:$SG72195
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 1398		; 00000576H
	jmp	$eva_err$72132
$L72192:

; 1400 : 	else if(!strcmp(bgseq, "_EVA_LAST") || (!*bgseq && nbrows <= 1))

	jmp	$L72207
$L72187:
	push	OFFSET FLAT:$SG72199
	mov	ecx, DWORD PTR _bgseq$[ebp]
	push	ecx
	call	_strcmp
	add	esp, 8
	test	eax, eax
	je	SHORT $L72198
	mov	edx, DWORD PTR _bgseq$[ebp]
	movsx	eax, BYTE PTR [edx]
	test	eax, eax
	jne	SHORT $L72197
	cmp	DWORD PTR _nbrows$[ebp], 1
	jg	SHORT $L72197
$L72198:

; 1402 : 		DYNTAB_ADD_CELLP(&tbl->bgcol, MAX(tbl->bgcol.nbrows, tbl->bgimg.nbrows), 0, NULL);

	mov	ecx, DWORD PTR _tbl$[ebp]
	mov	edx, DWORD PTR _tbl$[ebp]
	mov	eax, DWORD PTR [ecx+140]
	cmp	eax, DWORD PTR [edx+160]
	jbe	SHORT $L73495
	mov	ecx, DWORD PTR _tbl$[ebp]
	mov	edx, DWORD PTR [ecx+140]
	mov	DWORD PTR -16+[ebp], edx
	jmp	SHORT $L73496
$L73495:
	mov	eax, DWORD PTR _tbl$[ebp]
	mov	ecx, DWORD PTR [eax+160]
	mov	DWORD PTR -16+[ebp], ecx
$L73496:
	push	1
	push	0
	push	0
	mov	edx, DWORD PTR -16+[ebp]
	push	edx
	mov	eax, DWORD PTR _tbl$[ebp]
	add	eax, 140				; 0000008cH
	push	eax
	call	_dyntab_copy
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L72201
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29872], OFFSET FLAT:$SG72203
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 1402		; 0000057aH
	jmp	$eva_err$72132
$L72201:

; 1404 : 	else if(!strcmp(bgseq, "_EVA_FIRST"))

	jmp	SHORT $L72207
$L72197:
	push	OFFSET FLAT:$SG72206
	mov	eax, DWORD PTR _bgseq$[ebp]
	push	eax
	call	_strcmp
	add	esp, 8
	test	eax, eax
	jne	SHORT $L72207

; 1406 : 		tbl->bgseqstart = nbrows;

	mov	ecx, DWORD PTR _tbl$[ebp]
	mov	edx, DWORD PTR _nbrows$[ebp]
	mov	DWORD PTR [ecx+180], edx

; 1407 : 		DYNTAB_SET(&tbl->bgcol, nbrows, 0, "");

	push	0
	push	OFFSET FLAT:$SG72208
	push	0
	mov	eax, DWORD PTR _nbrows$[ebp]
	push	eax
	mov	ecx, DWORD PTR _tbl$[ebp]
	add	ecx, 140				; 0000008cH
	push	ecx
	call	_dyntab_set_txt
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L72207
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29872], OFFSET FLAT:$SG72210
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 1407		; 0000057fH
	jmp	SHORT $eva_err$72132
$L72207:

; 1409 : 	if(!tbl->bgcol.nbrows) DYNTAB_SET(&tbl->bgcol, 0, 0, "");

	mov	ecx, DWORD PTR _tbl$[ebp]
	cmp	DWORD PTR [ecx+140], 0
	jne	SHORT $L72212
	push	0
	push	OFFSET FLAT:$SG72213
	push	0
	push	0
	mov	edx, DWORD PTR _tbl$[ebp]
	add	edx, 140				; 0000008cH
	push	edx
	call	_dyntab_set_txt
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L72212
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29872], OFFSET FLAT:$SG72215
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 1409		; 00000581H
	jmp	SHORT $eva_err$72132
$L72212:
$eva_noerr$72216:

; 1410 : 	RETURN_OK_CLEANUP;

	push	0
	push	OFFSET FLAT:$SG72217
	push	OFFSET FLAT:$SG72218
	mov	edx, DWORD PTR _cntxt$[ebp]
	push	edx
	call	_err_clear
	add	esp, 16					; 00000010H
$eva_err$72132:
	mov	eax, DWORD PTR _cntxt$[ebp]
	cmp	DWORD PTR [eax+29872], 0
	je	SHORT $L72219
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	edx, DWORD PTR [ecx+29900]
	push	edx
	push	OFFSET FLAT:$SG72220
	push	OFFSET FLAT:$SG72221
	mov	eax, DWORD PTR _cntxt$[ebp]
	push	eax
	call	_err_add_context
	add	esp, 16					; 00000010H
$L72219:
	mov	ecx, DWORD PTR _cntxt$[ebp]
	xor	eax, eax
	cmp	DWORD PTR [ecx+29872], 0
	setne	al
$L72122:

; 1411 : }

	mov	esp, ebp
	pop	ebp
	ret	0
_table_init_bgseq ENDP
_TEXT	ENDS
PUBLIC	_table_row_bgcolor
EXTRN	_form_eval_fieldexpr:NEAR
_BSS	SEGMENT
	ALIGN	4

$SG72238 DB	01H DUP (?)
_BSS	ENDS
_DATA	SEGMENT
	ORG $+3
$SG72240 DB	'FFFFFF', 00H
	ORG $+1
$SG72245 DB	'%s', 00H
_DATA	ENDS
_TEXT	SEGMENT
_cntxt$ = 8
_tbl$ = 12
_i$ = 16
_colorfield$ = 20
_nbrows$ = -4
_data$ = -24
_res$ = -28
_table_row_bgcolor PROC NEAR

; 1424 : ){

	push	ebp
	mov	ebp, esp
	sub	esp, 36					; 00000024H

; 1425 : 	int nbrows;
; 1426 : 	DynTable data = {0};

	mov	DWORD PTR _data$[ebp], 0
	xor	eax, eax
	mov	DWORD PTR _data$[ebp+4], eax
	mov	DWORD PTR _data$[ebp+8], eax
	mov	DWORD PTR _data$[ebp+12], eax
	mov	DWORD PTR _data$[ebp+16], eax

; 1427 : 	static char color[16] = {0};
; 1428 : 	char *res;
; 1429 : 	if(!tbl) return "";

	cmp	DWORD PTR _tbl$[ebp], 0
	jne	SHORT $L72237
	mov	eax, OFFSET FLAT:$SG72238
	jmp	$L72231
$L72237:

; 1430 : 
; 1431 : 	if(!tbl->bgcol.nbrows && !i) table_init_bgseq(cntxt, tbl);

	mov	ecx, DWORD PTR _tbl$[ebp]
	cmp	DWORD PTR [ecx+140], 0
	jne	SHORT $L72239
	cmp	DWORD PTR _i$[ebp], 0
	jne	SHORT $L72239
	mov	edx, DWORD PTR _tbl$[ebp]
	push	edx
	mov	eax, DWORD PTR _cntxt$[ebp]
	push	eax
	call	_table_init_bgseq
	add	esp, 8
$L72239:

; 1432 : 	nbrows = MAX(tbl->bgcol.nbrows, tbl->bgimg.nbrows);

	mov	ecx, DWORD PTR _tbl$[ebp]
	mov	edx, DWORD PTR _tbl$[ebp]
	mov	eax, DWORD PTR [ecx+140]
	cmp	eax, DWORD PTR [edx+160]
	jbe	SHORT $L73498
	mov	ecx, DWORD PTR _tbl$[ebp]
	mov	edx, DWORD PTR [ecx+140]
	mov	DWORD PTR -32+[ebp], edx
	jmp	SHORT $L73499
$L73498:
	mov	eax, DWORD PTR _tbl$[ebp]
	mov	ecx, DWORD PTR [eax+160]
	mov	DWORD PTR -32+[ebp], ecx
$L73499:
	mov	edx, DWORD PTR -32+[ebp]
	mov	DWORD PTR _nbrows$[ebp], edx

; 1433 : 	res = nbrows ? dyntab_val(&tbl->bgcol, (i + tbl->bgseqstart) % nbrows,0) : "FFFFFF";

	cmp	DWORD PTR _nbrows$[ebp], 0
	je	SHORT $L73500
	push	0
	mov	eax, DWORD PTR _tbl$[ebp]
	mov	ecx, DWORD PTR _i$[ebp]
	add	ecx, DWORD PTR [eax+180]
	mov	eax, ecx
	xor	edx, edx
	div	DWORD PTR _nbrows$[ebp]
	push	edx
	mov	edx, DWORD PTR _tbl$[ebp]
	add	edx, 140				; 0000008cH
	push	edx
	call	_dyntab_val
	add	esp, 12					; 0000000cH
	mov	DWORD PTR -36+[ebp], eax
	jmp	SHORT $L73501
$L73500:
	mov	DWORD PTR -36+[ebp], OFFSET FLAT:$SG72240
$L73501:
	mov	eax, DWORD PTR -36+[ebp]
	mov	DWORD PTR _res$[ebp], eax

; 1434 : 
; 1435 : 	if(colorfield && *colorfield)

	cmp	DWORD PTR _colorfield$[ebp], 0
	je	$L72241
	mov	ecx, DWORD PTR _colorfield$[ebp]
	movsx	edx, BYTE PTR [ecx]
	test	edx, edx
	je	$L72241

; 1437 : 		form_eval_fieldexpr(cntxt, &data, 0, DYNTAB_TOULRC(&tbl->idobj, i, 0), colorfield, strlen(colorfield), NULL, 0);

	push	0
	push	0
	mov	eax, DWORD PTR _colorfield$[ebp]
	push	eax
	call	_strlen
	add	esp, 4
	push	eax
	mov	ecx, DWORD PTR _colorfield$[ebp]
	push	ecx
	push	10					; 0000000aH
	push	0
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
	push	eax
	push	0
	lea	ecx, DWORD PTR _data$[ebp]
	push	ecx
	mov	edx, DWORD PTR _cntxt$[ebp]
	push	edx
	call	_form_eval_fieldexpr
	add	esp, 32					; 00000020H

; 1438 : 		if(data.nbrows && data.cell && data.cell->len == 6)

	cmp	DWORD PTR _data$[ebp], 0
	je	SHORT $L72244
	cmp	DWORD PTR _data$[ebp+16], 0
	je	SHORT $L72244
	mov	eax, DWORD PTR _data$[ebp+16]
	cmp	DWORD PTR [eax+4], 6
	jne	SHORT $L72244

; 1440 : 			snprintf(add_sz_str(color)-1, "%s", data.cell->txt);

	mov	ecx, DWORD PTR _data$[ebp+16]
	mov	edx, DWORD PTR [ecx]
	push	edx
	push	OFFSET FLAT:$SG72245
	push	14					; 0000000eH
	push	OFFSET FLAT:_?color@?1??table_row_bgcolor@@9@9
	call	__snprintf
	add	esp, 16					; 00000010H

; 1441 : 			res = color;

	mov	DWORD PTR _res$[ebp], OFFSET FLAT:_?color@?1??table_row_bgcolor@@9@9
$L72244:

; 1443 : 		DYNTAB_FREE(data);

	lea	eax, DWORD PTR _data$[ebp]
	push	eax
	call	_dyntab_free
	add	esp, 4
$L72241:

; 1445 : 	return res;

	mov	eax, DWORD PTR _res$[ebp]
$L72231:

; 1446 : }

	mov	esp, ebp
	pop	ebp
	ret	0
_table_row_bgcolor ENDP
_TEXT	ENDS
PUBLIC	_table_put_rows
EXTRN	_qry_obj_label:NEAR
EXTRN	_put_html_format_pos:NEAR
EXTRN	_get_image_file:NEAR
EXTRN	_get_image_thumb:NEAR
EXTRN	_free:NEAR
EXTRN	_html_put_value_fmt:NEAR
EXTRN	_qry_obj_field:NEAR
EXTRN	_ctrl_read_baseobj:NEAR
EXTRN	_qry_eval_var_expr_table:NEAR
EXTRN	_strchr:NEAR
EXTRN	_build_open_btn_name:NEAR
EXTRN	_strncpy:NEAR
EXTRN	_dyntab_cmp:NEAR
EXTRN	_ctrl_add_symbol_btn:NEAR
EXTRN	_stricmp:NEAR
_BSS	SEGMENT
	ALIGN	4

$SG72712 DB	01H DUP (?)
	ALIGN	4

$SG72282 DB	01H DUP (?)
	ALIGN	4

$SG72286 DB	01H DUP (?)
	ALIGN	4

$SG72294 DB	01H DUP (?)
	ALIGN	4

$SG72298 DB	01H DUP (?)
	ALIGN	4

$SG72362 DB	01H DUP (?)
	ALIGN	4

$SG72388 DB	01H DUP (?)
	ALIGN	4

$SG72398 DB	01H DUP (?)
	ALIGN	4

$SG72508 DB	01H DUP (?)
	ALIGN	4

$SG72513 DB	01H DUP (?)
	ALIGN	4

$SG72526 DB	01H DUP (?)
	ALIGN	4

$SG72584 DB	01H DUP (?)
	ALIGN	4

$SG72589 DB	01H DUP (?)
	ALIGN	4

$SG72599 DB	01H DUP (?)
	ALIGN	4

$SG72617 DB	01H DUP (?)
_BSS	ENDS
_DATA	SEGMENT
	ORG $+1
$SG72267 DB	'_EVA_OPENBUTTON', 00H
$SG72277 DB	'_EVA_BG_LINE_SPEC', 00H
	ORG $+2
$SG72281 DB	'_EVA_DYNLINES', 00H
	ORG $+2
$SG72283 DB	'_EVA_INPUT', 00H
	ORG $+1
$SG72285 DB	'_EVA_ALTFORM', 00H
	ORG $+3
$SG72288 DB	'_EVA_REUSE', 00H
	ORG $+1
$SG72293 DB	'_EVA_LIST_OPENFORM', 00H
	ORG $+1
$SG72297 DB	'_EVA_BASE_FORMS', 00H
$SG72301 DB	'_EVA_LIST_OPENFIXED', 00H
$SG72317 DB	'<tr>', 00H
	ORG $+3
$SG72321 DB	' -->', 0aH, 00H
	ORG $+2
$SG72322 DB	0aH, '<!--- Start TableRows ', 00H
$SG72324 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG72330 DB	'D:\Travail\ABI\EVA\V4.0\CGI\Brunix-2016\table_utils.c', 00H
	ORG $+2
$SG72331 DB	'table_put_rows', 00H
	ORG $+1
$SG72335 DB	'_EVA_FIELD', 00H
	ORG $+1
$SG72337 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG72342 DB	'_EVA_SRCFIELD', 00H
	ORG $+2
$SG72344 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG72346 DB	'D:\Travail\ABI\EVA\V4.0\CGI\Brunix-2016\table_utils.c', 00H
	ORG $+2
$SG72347 DB	'table_put_rows', 00H
	ORG $+1
$SG72349 DB	'_EVA_IMAGE', 00H
	ORG $+1
$SG72354 DB	'_EVA_IMGBTN_CTRL', 00H
	ORG $+3
$SG72355 DB	'D:\Travail\ABI\EVA\V4.0\CGI\Brunix-2016\table_utils.c', 00H
	ORG $+2
$SG72356 DB	'table_put_rows', 00H
	ORG $+1
$SG72357 DB	'_EVA_IMAGE_DIR', 00H
	ORG $+1
$SG72358 DB	'_EVA_FIELD', 00H
	ORG $+1
$SG72360 DB	'_EVA_SRCFIELD', 00H
	ORG $+2
$SG72365 DB	'_EVA_WIDTH', 00H
	ORG $+1
$SG72367 DB	'_EVA_HEIGHT', 00H
$SG72383 DB	'<tr', 00H
$SG72385 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG72387 DB	'_EVA_OPEN_MODE', 00H
	ORG $+1
$SG72391 DB	'''', 00H
	ORG $+2
$SG72392 DB	' onMouseOver=RowHL(this) opname=''', 00H
	ORG $+2
$SG72394 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG72399 DB	' bgcolor=#', 00H
	ORG $+1
$SG72401 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG72404 DB	'>', 00H
	ORG $+2
$SG72406 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG72411 DB	'>', 00H
	ORG $+2
$SG72412 DB	'<td>#NAR#</td><td colspan=', 00H
	ORG $+1
$SG72414 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG72417 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG72420 DB	'</td>', 00H
	ORG $+2
$SG72422 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG72429 DB	'_EVA_NONE', 00H
	ORG $+2
$SG72439 DB	'<td', 00H
$SG72441 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG72444 DB	'_EVA_SYMBOL', 00H
$SG72445 DB	'_EVA_IMAGE', 00H
	ORG $+1
$SG72448 DB	' align=right width=1%', 00H
	ORG $+2
$SG72450 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG72454 DB	' rowspan=2 valign=top', 00H
	ORG $+2
$SG72456 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG72459 DB	'>', 00H
	ORG $+2
$SG72461 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG72463 DB	'_EVA_IMAGE', 00H
	ORG $+1
$SG72468 DB	'D:\Travail\ABI\EVA\V4.0\CGI\Brunix-2016\table_utils.c', 00H
	ORG $+2
$SG72469 DB	'table_put_rows', 00H
	ORG $+1
$SG72474 DB	'_EVA_FILE_SERVER_NAME', 00H
	ORG $+2
$SG72475 DB	'../docs/%s/', 00H
$SG72478 DB	'../docs/%s/%s/', 00H
	ORG $+1
$SG72482 DB	'%s', 00H
	ORG $+1
$SG72490 DB	'SYMBOL', 00H
	ORG $+1
$SG72502 DB	'D:\Travail\ABI\EVA\V4.0\CGI\Brunix-2016\table_utils.c', 00H
	ORG $+2
$SG72503 DB	'table_put_rows', 00H
	ORG $+1
$SG72509 DB	0aH, 00H
	ORG $+2
$SG72511 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG72512 DB	'_EVA_OPEN_MODE', 00H
	ORG $+1
$SG72522 DB	'<table border=0 cellspacing=0 cellpadding=0><tr>', 00H
	ORG $+3
$SG72524 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG72529 DB	'</tr></table>', 00H
	ORG $+2
$SG72531 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG72534 DB	'</td>', 00H
	ORG $+2
$SG72536 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG72550 DB	', ', 00H
	ORG $+1
$SG72556 DB	'_EVA_NewColumn', 00H
	ORG $+1
$SG72557 DB	'_EVA_SameCell', 00H
	ORG $+2
$SG72564 DB	' -->', 0aH, 00H
	ORG $+2
$SG72565 DB	0aH, '<!--- Start TableCell ', 00H
$SG72567 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG72571 DB	'_EVA_MONEY', 00H
	ORG $+1
$SG72572 DB	'_EVA_DATE', 00H
	ORG $+2
$SG72573 DB	'right', 00H
	ORG $+2
$SG72576 DB	'_EVA_NUMBER', 00H
$SG72577 DB	'center', 00H
	ORG $+1
$SG72580 DB	'_EVA_RELATION_BTN', 00H
	ORG $+2
$SG72581 DB	'space', 00H
	ORG $+2
$SG72583 DB	'newline', 00H
$SG72585 DB	'<br>', 00H
	ORG $+3
$SG72588 DB	'space', 00H
	ORG $+2
$SG72590 DB	' ', 00H
	ORG $+2
$SG72593 DB	'+', 00H
	ORG $+2
$SG72594 DB	'center', 00H
	ORG $+1
$SG72595 DB	' + ', 00H
$SG72598 DB	'index', 00H
	ORG $+2
$SG72600 DB	'top', 00H
$SG72604 DB	'</tr><tr', 00H
	ORG $+3
$SG72606 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG72610 DB	'''', 00H
	ORG $+2
$SG72611 DB	' onMouseOver=RowHL(this) opname=''', 00H
	ORG $+2
$SG72613 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG72618 DB	' bgcolor=#', 00H
	ORG $+1
$SG72620 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG72622 DB	'>', 00H
	ORG $+2
$SG72623 DB	'><td colspan=', 00H
	ORG $+2
$SG72625 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG72637 DB	'<br>', 00H
	ORG $+3
$SG72639 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG72642 DB	'</u> : ', 00H
$SG72643 DB	'<u>', 00H
$SG72645 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG72649 DB	'<br>', 00H
	ORG $+3
$SG72651 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG72653 DB	'_EVA_BUTTON', 00H
$SG72664 DB	'&nbsp;', 00H
	ORG $+1
$SG72666 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG72671 DB	' ...', 00H
	ORG $+3
$SG72673 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG72686 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG72693 DB	'<br>', 00H
	ORG $+3
$SG72695 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG72701 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG72704 DB	'D:\Travail\ABI\EVA\V4.0\CGI\Brunix-2016\table_utils.c', 00H
	ORG $+2
$SG72705 DB	'table_put_rows', 00H
	ORG $+1
$SG72713 DB	' ', 00H
	ORG $+2
$SG72715 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG72727 DB	'</td>', 00H
	ORG $+2
$SG72729 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG72732 DB	' -->', 0aH, 00H
	ORG $+2
$SG72733 DB	0aH, '<!--- EndOf TableCell ', 00H
$SG72735 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG72739 DB	'</tr>', 00H
	ORG $+2
$SG72741 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG72745 DB	' -->', 0aH, 00H
	ORG $+2
$SG72746 DB	0aH, '<!--- EndOf TableRows ', 00H
$SG72748 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG72749 DB	'D:\Travail\ABI\EVA\V4.0\CGI\Brunix-2016\table_utils.c', 00H
	ORG $+2
$SG72750 DB	'table_put_rows', 00H
	ORG $+1
$SG72752 DB	'D:\Travail\ABI\EVA\V4.0\CGI\Brunix-2016\table_utils.c', 00H
	ORG $+2
$SG72753 DB	'table_put_rows', 00H
_DATA	ENDS
_TEXT	SEGMENT
_lbl$72707 = -1500
__c$72709 = -1504
_cntxt$ = 8
_i_ctrl$ = 12
_form$ = -32
_ctrl$ = -1272
_buf$ = -112
_buf1$ = -108
_data$ = -172
_objdata$ = -228
_ctrldata$ = -28
_ctrldata1$ = -152
_colorfld$ = -1292
_tbl$ = -132
_openbtn$ = -128
_imgbtnfield$ = -1268
_imgdir$ = -124
_imgbtn_maxh$ = -4
_imgbtn_maxw$ = -120
_imgbtnpath$ = -1260
_idcolor$ = -1264
_colorfield$ = -8
_b_rowhilite$ = -188
_alt$ = -236
_loc$ = -204
_sz_imgbtnpath$ = -104
_opname$ = -100
_fixform$ = -184
_baseform$ = -180
_opform$ = -176
_i$ = -200
_j$ = -208
_k$ = -232
_rowstart$ = -196
_nbwords$ = -36
_b_arrows$ = -192
_html$ = -116
_h$72315 = -1296
_bg_color$72371 = -1316
_idend$72372 = -1308
_idobj$72373 = -1300
_i_label$72374 = -1304
_i_val$72375 = -1312
_b_firstcolbrk$72424 = -1320
_w$72430 = -1332
_h$72431 = -1336
_img$72432 = -1328
_thumb$72434 = -1340
_opbtn$72436 = -1324
_end$72464 = -1344
_idimg$72466 = -1348
_s$72484 = -1352
_name$72493 = -1424
_d$72494 = -1356
_i_fc$72495 = -1360
_fmt$72541 = -1432
_s_strip$72542 = -1456
_strip$72543 = -1472
_b_stripped$72544 = -1452
_tot_char$72545 = -1440
_valign$72546 = -1468
_align$72548 = -1448
_separ$72549 = -1488
_b_index$72551 = -1476
_line$72552 = -1436
_i0$72553 = -1464
_b_distinct$72554 = -1444
_pos$72555 = -1484
_cell$72558 = -1480
_b_colbrk$72559 = -1428
_b_colbrknoval$72560 = -1460
_b_sel$72561 = -1492
_b_found$72659 = -1496
_table_put_rows PROC NEAR

; 1463 : ){

	push	ebp
	mov	ebp, esp
	sub	esp, 1616				; 00000650H
	push	edi

; 1464 : 	EVA_form *form = cntxt->form;

	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	ecx, DWORD PTR [eax+80]
	mov	DWORD PTR _form$[ebp], ecx

; 1465 : 	EVA_ctrl *ctrl = form->ctrl + i_ctrl;

	mov	edx, DWORD PTR _i_ctrl$[ebp]
	imul	edx, 480				; 000001e0H
	mov	eax, DWORD PTR _form$[ebp]
	mov	ecx, DWORD PTR [eax]
	add	ecx, edx
	mov	DWORD PTR _ctrl$[ebp], ecx

; 1466 : 	DynBuffer *buf = NULL;

	mov	DWORD PTR _buf$[ebp], 0

; 1467 : 	DynBuffer *buf1 = NULL;

	mov	DWORD PTR _buf1$[ebp], 0

; 1468 : 	DynTable data = {0};

	mov	DWORD PTR _data$[ebp], 0
	xor	edx, edx
	mov	DWORD PTR _data$[ebp+4], edx
	mov	DWORD PTR _data$[ebp+8], edx
	mov	DWORD PTR _data$[ebp+12], edx
	mov	DWORD PTR _data$[ebp+16], edx

; 1469 : 	DynTable objdata = {0};

	mov	DWORD PTR _objdata$[ebp], 0
	xor	eax, eax
	mov	DWORD PTR _objdata$[ebp+4], eax
	mov	DWORD PTR _objdata$[ebp+8], eax
	mov	DWORD PTR _objdata$[ebp+12], eax
	mov	DWORD PTR _objdata$[ebp+16], eax

; 1470 : 	DynTable ctrldata = {0};

	mov	DWORD PTR _ctrldata$[ebp], 0
	xor	ecx, ecx
	mov	DWORD PTR _ctrldata$[ebp+4], ecx
	mov	DWORD PTR _ctrldata$[ebp+8], ecx
	mov	DWORD PTR _ctrldata$[ebp+12], ecx
	mov	DWORD PTR _ctrldata$[ebp+16], ecx

; 1471 : 	DynTable ctrldata1 = {0};

	mov	DWORD PTR _ctrldata1$[ebp], 0
	xor	edx, edx
	mov	DWORD PTR _ctrldata1$[ebp+4], edx
	mov	DWORD PTR _ctrldata1$[ebp+8], edx
	mov	DWORD PTR _ctrldata1$[ebp+12], edx
	mov	DWORD PTR _ctrldata1$[ebp+16], edx

; 1472 : 	DynTable colorfld = {0};

	mov	DWORD PTR _colorfld$[ebp], 0
	xor	eax, eax
	mov	DWORD PTR _colorfld$[ebp+4], eax
	mov	DWORD PTR _colorfld$[ebp+8], eax
	mov	DWORD PTR _colorfld$[ebp+12], eax
	mov	DWORD PTR _colorfld$[ebp+16], eax

; 1473 : 	ObjTableFormat *tbl = ctrl->objtbl;

	mov	ecx, DWORD PTR _ctrl$[ebp]
	mov	edx, DWORD PTR [ecx+232]
	mov	DWORD PTR _tbl$[ebp], edx

; 1474 : 	char *openbtn = DYNTAB_FIELD_VAL(tbl->attr, OPENBUTTON);

	push	0
	push	-1
	push	OFFSET FLAT:$SG72267
	mov	eax, DWORD PTR _tbl$[ebp]
	mov	ecx, DWORD PTR [eax]
	push	ecx
	call	_dyntab_field_val
	add	esp, 16					; 00000010H
	mov	DWORD PTR _openbtn$[ebp], eax

; 1475 : 	char *imgbtnfield = NULL, *imgdir = NULL;

	mov	DWORD PTR _imgbtnfield$[ebp], 0
	mov	DWORD PTR _imgdir$[ebp], 0

; 1476 : 	unsigned long imgbtn_maxh = 0, imgbtn_maxw = 0;

	mov	DWORD PTR _imgbtn_maxh$[ebp], 0
	mov	DWORD PTR _imgbtn_maxw$[ebp], 0

; 1477 : 	char imgbtnpath[1024];
; 1478 : 	unsigned long idcolor = strtoul(DYNTAB_FIELD_VAL(tbl->attr, BG_LINE_SPEC), NULL, 10);

	push	10					; 0000000aH
	push	0
	push	0
	push	-1
	push	OFFSET FLAT:$SG72277
	mov	edx, DWORD PTR _tbl$[ebp]
	mov	eax, DWORD PTR [edx]
	push	eax
	call	_dyntab_field_val
	add	esp, 16					; 00000010H
	push	eax
	call	_strtoul
	add	esp, 12					; 0000000cH
	mov	DWORD PTR _idcolor$[ebp], eax

; 1479 : 	char *colorfield = NULL;

	mov	DWORD PTR _colorfield$[ebp], 0

; 1480 : 	int b_rowhilite = *CTRL_ATTR_VAL(DYNLINES) == '1' &&
; 1481 : 						!(form->step == HtmlEdit && !strcmp(ctrl->CONTROL, "_EVA_INPUT"));

	cmp	DWORD PTR _ctrl$[ebp], 0
	je	SHORT $L73503
	push	0
	push	-1
	push	OFFSET FLAT:$SG72281
	mov	ecx, DWORD PTR _ctrl$[ebp]
	add	ecx, 44					; 0000002cH
	push	ecx
	call	_dyntab_field_val
	add	esp, 16					; 00000010H
	mov	DWORD PTR -1508+[ebp], eax
	jmp	SHORT $L73504
$L73503:
	mov	DWORD PTR -1508+[ebp], OFFSET FLAT:$SG72282
$L73504:
	mov	edx, DWORD PTR -1508+[ebp]
	movsx	eax, BYTE PTR [edx]
	cmp	eax, 49					; 00000031H
	jne	SHORT $L73506
	mov	ecx, DWORD PTR _form$[ebp]
	cmp	DWORD PTR [ecx+176], 4
	jne	SHORT $L73505
	push	OFFSET FLAT:$SG72283
	mov	edx, DWORD PTR _ctrl$[ebp]
	mov	eax, DWORD PTR [edx+272]
	push	eax
	call	_strcmp
	add	esp, 8
	test	eax, eax
	je	SHORT $L73506
$L73505:
	mov	DWORD PTR -1512+[ebp], 1
	jmp	SHORT $L73507
$L73506:
	mov	DWORD PTR -1512+[ebp], 0
$L73507:
	mov	ecx, DWORD PTR -1512+[ebp]
	mov	DWORD PTR _b_rowhilite$[ebp], ecx

; 1482 : 	char *alt = CTRL_ATTR_VAL(ALTFORM);

	cmp	DWORD PTR _ctrl$[ebp], 0
	je	SHORT $L73508
	push	0
	push	-1
	push	OFFSET FLAT:$SG72285
	mov	edx, DWORD PTR _ctrl$[ebp]
	add	edx, 44					; 0000002cH
	push	edx
	call	_dyntab_field_val
	add	esp, 16					; 00000010H
	mov	DWORD PTR -1516+[ebp], eax
	jmp	SHORT $L73509
$L73508:
	mov	DWORD PTR -1516+[ebp], OFFSET FLAT:$SG72286
$L73509:
	mov	eax, DWORD PTR -1516+[ebp]
	mov	DWORD PTR _alt$[ebp], eax

; 1483 : 	int loc = strcmp(alt, "_EVA_REUSE") ? 0 : 3;

	push	OFFSET FLAT:$SG72288
	mov	ecx, DWORD PTR _alt$[ebp]
	push	ecx
	call	_strcmp
	add	esp, 8
	neg	eax
	sbb	eax, eax
	and	al, -3					; fffffffdH
	add	eax, 3
	mov	DWORD PTR _loc$[ebp], eax

; 1484 : 	size_t sz_imgbtnpath = 0;

	mov	DWORD PTR _sz_imgbtnpath$[ebp], 0

; 1485 : 	char opname[64] = {0};

	mov	BYTE PTR _opname$[ebp], 0
	mov	ecx, 15					; 0000000fH
	xor	eax, eax
	lea	edi, DWORD PTR _opname$[ebp+1]
	rep stosd
	stosw
	stosb

; 1486 : 	unsigned long fixform = strtoul(CTRL_ATTR_VAL(LIST_OPENFORM), NULL, 10);

	cmp	DWORD PTR _ctrl$[ebp], 0
	je	SHORT $L73510
	push	0
	push	-1
	push	OFFSET FLAT:$SG72293
	mov	edx, DWORD PTR _ctrl$[ebp]
	add	edx, 44					; 0000002cH
	push	edx
	call	_dyntab_field_val
	add	esp, 16					; 00000010H
	mov	DWORD PTR -1520+[ebp], eax
	jmp	SHORT $L73511
$L73510:
	mov	DWORD PTR -1520+[ebp], OFFSET FLAT:$SG72294
$L73511:
	push	10					; 0000000aH
	push	0
	mov	eax, DWORD PTR -1520+[ebp]
	push	eax
	call	_strtoul
	add	esp, 12					; 0000000cH
	mov	DWORD PTR _fixform$[ebp], eax

; 1487 : 	unsigned long baseform = strtoul(CTRL_ATTR_VAL(BASE_FORMS), NULL, 10);

	cmp	DWORD PTR _ctrl$[ebp], 0
	je	SHORT $L73512
	push	0
	push	-1
	push	OFFSET FLAT:$SG72297
	mov	ecx, DWORD PTR _ctrl$[ebp]
	add	ecx, 44					; 0000002cH
	push	ecx
	call	_dyntab_field_val
	add	esp, 16					; 00000010H
	mov	DWORD PTR -1524+[ebp], eax
	jmp	SHORT $L73513
$L73512:
	mov	DWORD PTR -1524+[ebp], OFFSET FLAT:$SG72298
$L73513:
	push	10					; 0000000aH
	push	0
	mov	edx, DWORD PTR -1524+[ebp]
	push	edx
	call	_strtoul
	add	esp, 12					; 0000000cH
	mov	DWORD PTR _baseform$[ebp], eax

; 1488 : 	unsigned long opform = CTRL_ATTR_CELL(LIST_OPENFIXED) ? fixform ? fixform : baseform : 0;

	cmp	DWORD PTR _ctrl$[ebp], 0
	je	SHORT $L73514
	push	0
	push	-1
	push	OFFSET FLAT:$SG72301
	mov	eax, DWORD PTR _ctrl$[ebp]
	add	eax, 44					; 0000002cH
	push	eax
	call	_dyntab_field_cell
	add	esp, 16					; 00000010H
	mov	DWORD PTR -1528+[ebp], eax
	jmp	SHORT $L73515
$L73514:
	mov	DWORD PTR -1528+[ebp], 0
$L73515:
	cmp	DWORD PTR -1528+[ebp], 0
	je	SHORT $L73518
	cmp	DWORD PTR _fixform$[ebp], 0
	je	SHORT $L73516
	mov	ecx, DWORD PTR _fixform$[ebp]
	mov	DWORD PTR -1532+[ebp], ecx
	jmp	SHORT $L73517
$L73516:
	mov	edx, DWORD PTR _baseform$[ebp]
	mov	DWORD PTR -1532+[ebp], edx
$L73517:
	mov	eax, DWORD PTR -1532+[ebp]
	mov	DWORD PTR -1536+[ebp], eax
	jmp	SHORT $L73519
$L73518:
	mov	DWORD PTR -1536+[ebp], 0
$L73519:
	mov	ecx, DWORD PTR -1536+[ebp]
	mov	DWORD PTR _opform$[ebp], ecx

; 1489 : 	unsigned long i, j, k;
; 1490 : 	unsigned long rowstart;
; 1491 : 	unsigned long nbwords = tbl->srchwords.nbrows;

	mov	edx, DWORD PTR _tbl$[ebp]
	mov	eax, DWORD PTR [edx+104]
	mov	DWORD PTR _nbwords$[ebp], eax

; 1492 : 	int b_arrows = form->step == HtmlEdit && !tbl->b_sortsel && !(tbl->status & TblCtrl_opensel) && (tbl->status & TblCtrl_sel) && ctrl->val.nbrows > 1;

	mov	ecx, DWORD PTR _form$[ebp]
	cmp	DWORD PTR [ecx+176], 4
	jne	SHORT $L73520
	mov	edx, DWORD PTR _tbl$[ebp]
	cmp	DWORD PTR [edx+68], 0
	jne	SHORT $L73520
	mov	eax, DWORD PTR _tbl$[ebp]
	mov	ecx, DWORD PTR [eax+32]
	and	ecx, 512				; 00000200H
	test	ecx, ecx
	jne	SHORT $L73520
	mov	edx, DWORD PTR _tbl$[ebp]
	mov	eax, DWORD PTR [edx+32]
	and	eax, 256				; 00000100H
	test	eax, eax
	je	SHORT $L73520
	mov	ecx, DWORD PTR _ctrl$[ebp]
	cmp	DWORD PTR [ecx+64], 1
	jbe	SHORT $L73520
	mov	DWORD PTR -1540+[ebp], 1
	jmp	SHORT $L73521
$L73520:
	mov	DWORD PTR -1540+[ebp], 0
$L73521:
	mov	edx, DWORD PTR -1540+[ebp]
	mov	DWORD PTR _b_arrows$[ebp], edx

; 1493 : 	CHECK_HTML_STATUS;

	cmp	DWORD PTR _cntxt$[ebp], 0
	je	SHORT $L73524
	mov	eax, DWORD PTR _cntxt$[ebp]
	cmp	DWORD PTR [eax+80], 0
	je	SHORT $L73522
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	edx, DWORD PTR [ecx+80]
	mov	eax, DWORD PTR [edx+232]
	mov	DWORD PTR -1544+[ebp], eax
	jmp	SHORT $L73523
$L73522:
	mov	DWORD PTR -1544+[ebp], 0
$L73523:
	mov	ecx, DWORD PTR -1544+[ebp]
	mov	DWORD PTR -1548+[ebp], ecx
	jmp	SHORT $L73525
$L73524:
	mov	DWORD PTR -1548+[ebp], 0
$L73525:
	mov	edx, DWORD PTR -1548+[ebp]
	mov	DWORD PTR _html$[ebp], edx
	cmp	DWORD PTR _html$[ebp], 0
	jne	SHORT $L72311
	xor	eax, eax
	jmp	$L72253
$L72311:

; 1494 : 
; 1495 : 	/* Return if no rows */
; 1496 : 	if(!tbl->idobj.nbrows) RETURN_OK;

	mov	eax, DWORD PTR _tbl$[ebp]
	cmp	DWORD PTR [eax+184], 0
	jne	SHORT $L72312
	jmp	$eva_noerr$72313
$L72312:

; 1497 : 
; 1498 : 	/* Remove previous <tr> if applicable */
; 1499 : 	if(*html)

	mov	ecx, DWORD PTR _html$[ebp]
	cmp	DWORD PTR [ecx], 0
	je	SHORT $L72316

; 1501 : 		DynBuffer *h = *html;

	mov	edx, DWORD PTR _html$[ebp]
	mov	eax, DWORD PTR [edx]
	mov	DWORD PTR _h$72315[ebp], eax

; 1502 : 		if(h->cnt > 4 && !strncmp(h->data + h->cnt - 4, add_sz_str("<tr>"))) h->cnt -= 4;

	mov	ecx, DWORD PTR _h$72315[ebp]
	cmp	DWORD PTR [ecx+4], 4
	jbe	SHORT $L72316
	push	4
	push	OFFSET FLAT:$SG72317
	mov	edx, DWORD PTR _h$72315[ebp]
	mov	eax, DWORD PTR [edx+4]
	mov	ecx, DWORD PTR _h$72315[ebp]
	lea	edx, DWORD PTR [ecx+eax+4]
	push	edx
	call	_strncmp
	add	esp, 12					; 0000000cH
	test	eax, eax
	jne	SHORT $L72316
	mov	eax, DWORD PTR _h$72315[ebp]
	mov	ecx, DWORD PTR [eax+4]
	sub	ecx, 4
	mov	edx, DWORD PTR _h$72315[ebp]
	mov	DWORD PTR [edx+4], ecx
$L72316:

; 1504 : 
; 1505 : 	/* Output HTML comment if applicable */
; 1506 : 	if(cntxt->debug & DEBUG_HTML) DYNBUF_ADD3(cntxt->form->html, "\n<!--- Start TableRows ", ctrl->LABEL, 0, NO_CONV, " -->\n");

	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	ecx, DWORD PTR [eax+29860]
	and	ecx, 128				; 00000080H
	test	ecx, ecx
	je	SHORT $L72320
	push	5
	push	OFFSET FLAT:$SG72321
	push	0
	push	0
	push	0
	mov	edx, DWORD PTR _ctrl$[ebp]
	mov	eax, DWORD PTR [edx+284]
	push	eax
	push	23					; 00000017H
	push	OFFSET FLAT:$SG72322
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	edx, DWORD PTR [ecx+80]
	mov	eax, DWORD PTR [edx+232]
	push	eax
	call	_dynbuf_add3
	add	esp, 36					; 00000024H
	test	eax, eax
	je	SHORT $L72320
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29872], OFFSET FLAT:$SG72324
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 1506		; 000005e2H
	jmp	$eva_err$72325
$L72320:

; 1507 : 
; 1508 : 	/* Read color field for line background */
; 1509 : 	if(idcolor)

	cmp	DWORD PTR _idcolor$[ebp], 0
	je	$L72326

; 1511 : 		if(qry_obj_field(cntxt, &ctrldata1, idcolor, NULL) || ctrl_read_baseobj(cntxt, &ctrldata1)) CLEAR_ERROR;

	push	0
	mov	eax, DWORD PTR _idcolor$[ebp]
	push	eax
	lea	ecx, DWORD PTR _ctrldata1$[ebp]
	push	ecx
	mov	edx, DWORD PTR _cntxt$[ebp]
	push	edx
	call	_qry_obj_field
	add	esp, 16					; 00000010H
	test	eax, eax
	jne	SHORT $L72329
	lea	eax, DWORD PTR _ctrldata1$[ebp]
	push	eax
	mov	ecx, DWORD PTR _cntxt$[ebp]
	push	ecx
	call	_ctrl_read_baseobj
	add	esp, 8
	test	eax, eax
	je	SHORT $L72328
$L72329:
	push	1511					; 000005e7H
	push	OFFSET FLAT:$SG72330
	push	OFFSET FLAT:$SG72331
	mov	edx, DWORD PTR _cntxt$[ebp]
	push	edx
	call	_err_clear
	add	esp, 16					; 00000010H
$L72328:

; 1512 : 		DYNTAB_FIELD_TAB(&colorfld, &ctrldata1, FIELD);

	lea	eax, DWORD PTR _colorfld$[ebp]
	push	eax
	call	_dyntab_free
	add	esp, 4
	push	0
	push	-1
	push	OFFSET FLAT:$SG72335
	lea	ecx, DWORD PTR _ctrldata1$[ebp]
	push	ecx
	push	0
	lea	edx, DWORD PTR _colorfld$[ebp]
	push	edx
	call	_dyntab_filter_field
	add	esp, 24					; 00000018H
	test	eax, eax
	jne	SHORT $L72334
	lea	eax, DWORD PTR _colorfld$[ebp]
	push	eax
	call	_dyntab_order_lines
	add	esp, 4
	test	eax, eax
	je	SHORT $L72333
$L72334:
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29872], OFFSET FLAT:$SG72337
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 1512		; 000005e8H
	jmp	$eva_err$72325
$L72333:

; 1513 : 		if(!colorfld.nbrows) DYNTAB_FIELD_TAB(&colorfld, &ctrldata1, SRCFIELD);

	cmp	DWORD PTR _colorfld$[ebp], 0
	jne	SHORT $L72340
	lea	eax, DWORD PTR _colorfld$[ebp]
	push	eax
	call	_dyntab_free
	add	esp, 4
	push	0
	push	-1
	push	OFFSET FLAT:$SG72342
	lea	ecx, DWORD PTR _ctrldata1$[ebp]
	push	ecx
	push	0
	lea	edx, DWORD PTR _colorfld$[ebp]
	push	edx
	call	_dyntab_filter_field
	add	esp, 24					; 00000018H
	test	eax, eax
	jne	SHORT $L72341
	lea	eax, DWORD PTR _colorfld$[ebp]
	push	eax
	call	_dyntab_order_lines
	add	esp, 4
	test	eax, eax
	je	SHORT $L72340
$L72341:
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29872], OFFSET FLAT:$SG72344
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 1513		; 000005e9H
	jmp	$eva_err$72325
$L72340:

; 1514 : 		if(qry_eval_var_expr_table(cntxt, &colorfld, tbl->attr)) CLEAR_ERROR;

	mov	eax, DWORD PTR _tbl$[ebp]
	mov	ecx, DWORD PTR [eax]
	push	ecx
	lea	edx, DWORD PTR _colorfld$[ebp]
	push	edx
	mov	eax, DWORD PTR _cntxt$[ebp]
	push	eax
	call	_qry_eval_var_expr_table
	add	esp, 12					; 0000000cH
	test	eax, eax
	je	SHORT $L72345
	push	1514					; 000005eaH
	push	OFFSET FLAT:$SG72346
	push	OFFSET FLAT:$SG72347
	mov	ecx, DWORD PTR _cntxt$[ebp]
	push	ecx
	call	_err_clear
	add	esp, 16					; 00000010H
$L72345:

; 1515 : 		colorfield = dyntab_val(&colorfld, 0, 0);

	push	0
	push	0
	lea	edx, DWORD PTR _colorfld$[ebp]
	push	edx
	call	_dyntab_val
	add	esp, 12					; 0000000cH
	mov	DWORD PTR _colorfield$[ebp], eax
$L72326:

; 1517 : 
; 1518 : 	/* Read image field for open button if applicable */
; 1519 : 	if(!strcmp(openbtn, "_EVA_IMAGE"))

	push	OFFSET FLAT:$SG72349
	mov	eax, DWORD PTR _openbtn$[ebp]
	push	eax
	call	_strcmp
	add	esp, 8
	test	eax, eax
	jne	$L72363

; 1521 : 		if(qry_obj_field(cntxt, &ctrldata, strtoul(DYNTAB_FIELD_VAL(tbl->attr, IMGBTN_CTRL), NULL, 10), NULL) || ctrl_read_baseobj(cntxt, &ctrldata)) CLEAR_ERROR;

	push	0
	push	10					; 0000000aH
	push	0
	push	0
	push	-1
	push	OFFSET FLAT:$SG72354
	mov	ecx, DWORD PTR _tbl$[ebp]
	mov	edx, DWORD PTR [ecx]
	push	edx
	call	_dyntab_field_val
	add	esp, 16					; 00000010H
	push	eax
	call	_strtoul
	add	esp, 12					; 0000000cH
	push	eax
	lea	eax, DWORD PTR _ctrldata$[ebp]
	push	eax
	mov	ecx, DWORD PTR _cntxt$[ebp]
	push	ecx
	call	_qry_obj_field
	add	esp, 16					; 00000010H
	test	eax, eax
	jne	SHORT $L72353
	lea	edx, DWORD PTR _ctrldata$[ebp]
	push	edx
	mov	eax, DWORD PTR _cntxt$[ebp]
	push	eax
	call	_ctrl_read_baseobj
	add	esp, 8
	test	eax, eax
	je	SHORT $L72352
$L72353:
	push	1521					; 000005f1H
	push	OFFSET FLAT:$SG72355
	push	OFFSET FLAT:$SG72356
	mov	ecx, DWORD PTR _cntxt$[ebp]
	push	ecx
	call	_err_clear
	add	esp, 16					; 00000010H
$L72352:

; 1522 : 		imgdir = DYNTAB_FIELD_VAL(&ctrldata, IMAGE_DIR);

	push	0
	push	-1
	push	OFFSET FLAT:$SG72357
	lea	edx, DWORD PTR _ctrldata$[ebp]
	push	edx
	call	_dyntab_field_val
	add	esp, 16					; 00000010H
	mov	DWORD PTR _imgdir$[ebp], eax

; 1523 : 		imgbtnfield = DYNTAB_FIELD_VAL(&ctrldata, FIELD);

	push	0
	push	-1
	push	OFFSET FLAT:$SG72358
	lea	eax, DWORD PTR _ctrldata$[ebp]
	push	eax
	call	_dyntab_field_val
	add	esp, 16					; 00000010H
	mov	DWORD PTR _imgbtnfield$[ebp], eax

; 1524 : 		if(!*imgbtnfield) imgbtnfield = DYNTAB_FIELD_VAL(&ctrldata, SRCFIELD);

	mov	ecx, DWORD PTR _imgbtnfield$[ebp]
	movsx	edx, BYTE PTR [ecx]
	test	edx, edx
	jne	SHORT $L72359
	push	0
	push	-1
	push	OFFSET FLAT:$SG72360
	lea	eax, DWORD PTR _ctrldata$[ebp]
	push	eax
	call	_dyntab_field_val
	add	esp, 16					; 00000010H
	mov	DWORD PTR _imgbtnfield$[ebp], eax
$L72359:

; 1525 : 
; 1526 : 		/* Disable image open button if no field */
; 1527 : 		if(!*imgbtnfield)

	mov	ecx, DWORD PTR _imgbtnfield$[ebp]
	movsx	edx, BYTE PTR [ecx]
	test	edx, edx
	jne	SHORT $L72361

; 1528 : 			openbtn = "";

	mov	DWORD PTR _openbtn$[ebp], OFFSET FLAT:$SG72362

; 1529 : 		else

	jmp	SHORT $L72363
$L72361:

; 1531 : 			imgbtn_maxw = strtoul(DYNTAB_FIELD_VAL(&ctrldata, WIDTH), NULL, 10);

	push	10					; 0000000aH
	push	0
	push	0
	push	-1
	push	OFFSET FLAT:$SG72365
	lea	eax, DWORD PTR _ctrldata$[ebp]
	push	eax
	call	_dyntab_field_val
	add	esp, 16					; 00000010H
	push	eax
	call	_strtoul
	add	esp, 12					; 0000000cH
	mov	DWORD PTR _imgbtn_maxw$[ebp], eax

; 1532 : 			imgbtn_maxh = strtoul(DYNTAB_FIELD_VAL(&ctrldata, HEIGHT), NULL, 10);

	push	10					; 0000000aH
	push	0
	push	0
	push	-1
	push	OFFSET FLAT:$SG72367
	lea	ecx, DWORD PTR _ctrldata$[ebp]
	push	ecx
	call	_dyntab_field_val
	add	esp, 16					; 00000010H
	push	eax
	call	_strtoul
	add	esp, 12					; 0000000cH
	mov	DWORD PTR _imgbtn_maxh$[ebp], eax
$L72363:

; 1535 : 
; 1536 : 	for(i = 0; i < tbl->idobj.nbrows; i++)

	mov	DWORD PTR _i$[ebp], 0
	jmp	SHORT $L72368
$L72369:
	mov	edx, DWORD PTR _i$[ebp]
	add	edx, 1
	mov	DWORD PTR _i$[ebp], edx
$L72368:
	mov	eax, DWORD PTR _tbl$[ebp]
	mov	ecx, DWORD PTR _i$[ebp]
	cmp	ecx, DWORD PTR [eax+184]
	jae	$L72370

; 1538 : 		char *bg_color = table_row_bgcolor(cntxt, tbl, i, colorfield);

	mov	edx, DWORD PTR _colorfield$[ebp]
	push	edx
	mov	eax, DWORD PTR _i$[ebp]
	push	eax
	mov	ecx, DWORD PTR _tbl$[ebp]
	push	ecx
	mov	edx, DWORD PTR _cntxt$[ebp]
	push	edx
	call	_table_row_bgcolor
	add	esp, 16					; 00000010H
	mov	DWORD PTR _bg_color$72371[ebp], eax

; 1539 : 		char *idend;
; 1540 : 		unsigned long idobj = strtoul(dyntab_val(&tbl->idobj, i, 0), &idend, 10);

	push	10					; 0000000aH
	lea	eax, DWORD PTR _idend$72372[ebp]
	push	eax
	push	0
	mov	ecx, DWORD PTR _i$[ebp]
	push	ecx
	mov	edx, DWORD PTR _tbl$[ebp]
	add	edx, 184				; 000000b8H
	push	edx
	call	_dyntab_val
	add	esp, 12					; 0000000cH
	push	eax
	call	_strtoul
	add	esp, 12					; 0000000cH
	mov	DWORD PTR _idobj$72373[ebp], eax

; 1541 : 		unsigned long i_label = tbl->data.nbrows;

	mov	eax, DWORD PTR _tbl$[ebp]
	mov	ecx, DWORD PTR [eax+220]
	mov	DWORD PTR _i_label$72374[ebp], ecx

; 1542 : 		unsigned long i_val = ctrl->val.nbrows;

	mov	edx, DWORD PTR _ctrl$[ebp]
	mov	eax, DWORD PTR [edx+64]
	mov	DWORD PTR _i_val$72375[ebp], eax

; 1543 : 
; 1544 : 		/* Check selection status */
; 1545 : 		if(ctrl->val.nbrows && tbl->status & TblCtrl_sel)

	mov	ecx, DWORD PTR _ctrl$[ebp]
	cmp	DWORD PTR [ecx+64], 0
	je	$L72380
	mov	edx, DWORD PTR _tbl$[ebp]
	mov	eax, DWORD PTR [edx+32]
	and	eax, 256				; 00000100H
	test	eax, eax
	je	$L72380

; 1547 : 			/* Search current line in selection */
; 1548 : 			for(i_val = 0; i_val < ctrl->val.nbrows && dyntab_cmp(&ctrl->val, i_val, 0, &tbl->idobj, i, 0); i_val++);

	mov	DWORD PTR _i_val$72375[ebp], 0
	jmp	SHORT $L72377
$L72378:
	mov	ecx, DWORD PTR _i_val$72375[ebp]
	add	ecx, 1
	mov	DWORD PTR _i_val$72375[ebp], ecx
$L72377:
	mov	edx, DWORD PTR _ctrl$[ebp]
	mov	eax, DWORD PTR _i_val$72375[ebp]
	cmp	eax, DWORD PTR [edx+64]
	jae	SHORT $L72379
	push	0
	mov	ecx, DWORD PTR _i$[ebp]
	push	ecx
	mov	edx, DWORD PTR _tbl$[ebp]
	add	edx, 184				; 000000b8H
	push	edx
	push	0
	mov	eax, DWORD PTR _i_val$72375[ebp]
	push	eax
	mov	ecx, DWORD PTR _ctrl$[ebp]
	add	ecx, 64					; 00000040H
	push	ecx
	call	_dyntab_cmp
	add	esp, 24					; 00000018H
	test	eax, eax
	je	SHORT $L72379
	jmp	SHORT $L72378
$L72379:

; 1549 : 
; 1550 : 			/* If found : mark cell with col = 1 */
; 1551 : 			if(i_val < ctrl->val.nbrows) dyntab_cell(&ctrl->val, i_val, 0)->col = 1;

	mov	edx, DWORD PTR _ctrl$[ebp]
	mov	eax, DWORD PTR _i_val$72375[ebp]
	cmp	eax, DWORD PTR [edx+64]
	jae	SHORT $L72380
	push	0
	mov	ecx, DWORD PTR _i_val$72375[ebp]
	push	ecx
	mov	edx, DWORD PTR _ctrl$[ebp]
	add	edx, 64					; 00000040H
	push	edx
	call	_dyntab_cell
	add	esp, 12					; 0000000cH
	mov	DWORD PTR [eax+56], 1
$L72380:

; 1553 : 
; 1554 : 		/* Output line start */
; 1555 : 		DYNBUF_ADD_STR(html, "<tr");

	push	0
	push	0
	push	3
	push	OFFSET FLAT:$SG72383
	mov	eax, DWORD PTR _html$[ebp]
	push	eax
	call	_dynbuf_add
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L72382
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29872], OFFSET FLAT:$SG72385
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 1555		; 00000613H
	jmp	$eva_err$72325
$L72382:

; 1556 : 		if(b_rowhilite)

	cmp	DWORD PTR _b_rowhilite$[ebp], 0
	je	$L72390

; 1558 : 			build_open_btn_name(cntxt, opname, opform, idobj, loc, atoi(CTRL_ATTR_VAL(OPEN_MODE)));

	cmp	DWORD PTR _ctrl$[ebp], 0
	je	SHORT $L73526
	push	0
	push	-1
	push	OFFSET FLAT:$SG72387
	mov	eax, DWORD PTR _ctrl$[ebp]
	add	eax, 44					; 0000002cH
	push	eax
	call	_dyntab_field_val
	add	esp, 16					; 00000010H
	mov	DWORD PTR -1552+[ebp], eax
	jmp	SHORT $L73527
$L73526:
	mov	DWORD PTR -1552+[ebp], OFFSET FLAT:$SG72388
$L73527:
	mov	ecx, DWORD PTR -1552+[ebp]
	push	ecx
	call	_atoi
	add	esp, 4
	push	eax
	mov	edx, DWORD PTR _loc$[ebp]
	push	edx
	mov	eax, DWORD PTR _idobj$72373[ebp]
	push	eax
	mov	ecx, DWORD PTR _opform$[ebp]
	push	ecx
	lea	edx, DWORD PTR _opname$[ebp]
	push	edx
	mov	eax, DWORD PTR _cntxt$[ebp]
	push	eax
	call	_build_open_btn_name
	add	esp, 24					; 00000018H

; 1559 : 			DYNBUF_ADD3(html, " onMouseOver=RowHL(this) opname='", opname, 0, NO_CONV, "'");

	push	1
	push	OFFSET FLAT:$SG72391
	push	0
	push	0
	push	0
	lea	ecx, DWORD PTR _opname$[ebp]
	push	ecx
	push	33					; 00000021H
	push	OFFSET FLAT:$SG72392
	mov	edx, DWORD PTR _html$[ebp]
	push	edx
	call	_dynbuf_add3
	add	esp, 36					; 00000024H
	test	eax, eax
	je	SHORT $L72390
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29872], OFFSET FLAT:$SG72394
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 1559		; 00000617H
	jmp	$eva_err$72325
$L72390:

; 1561 : 		if(*bg_color && strlen(bg_color) == 6) DYNBUF_ADD3(html, " bgcolor=#", bg_color, 6, NO_CONV,"")

	mov	edx, DWORD PTR _bg_color$72371[ebp]
	movsx	eax, BYTE PTR [edx]
	test	eax, eax
	je	SHORT $L72397
	mov	ecx, DWORD PTR _bg_color$72371[ebp]
	push	ecx
	call	_strlen
	add	esp, 4
	cmp	eax, 6
	jne	SHORT $L72397
	push	0
	push	OFFSET FLAT:$SG72398
	push	0
	push	0
	push	6
	mov	edx, DWORD PTR _bg_color$72371[ebp]
	push	edx
	push	10					; 0000000aH
	push	OFFSET FLAT:$SG72399
	mov	eax, DWORD PTR _html$[ebp]
	push	eax
	call	_dynbuf_add3
	add	esp, 36					; 00000024H
	test	eax, eax
	je	SHORT $L72397
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29872], OFFSET FLAT:$SG72401
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 1561		; 00000619H
	jmp	$eva_err$72325
$L72397:

; 1562 : 		DYNBUF_ADD_STR(html, ">");

	push	0
	push	0
	push	1
	push	OFFSET FLAT:$SG72404
	mov	eax, DWORD PTR _html$[ebp]
	push	eax
	call	_dynbuf_add
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L72403
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29872], OFFSET FLAT:$SG72406
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 1562		; 0000061aH
	jmp	$eva_err$72325
$L72403:

; 1563 : 
; 1564 : 		/* Output selection checkbox where applicable */
; 1565 : 		if(tbl->status & TblCtrl_sel &&
; 1566 : 				table_add_sel_chkbox(cntxt, ctrl, i_val, DYNTAB_VAL_SZ(&tbl->idobj, i, 0)))STACK_ERROR;

	mov	eax, DWORD PTR _tbl$[ebp]
	mov	ecx, DWORD PTR [eax+32]
	and	ecx, 256				; 00000100H
	test	ecx, ecx
	je	SHORT $L72407
	push	0
	mov	edx, DWORD PTR _i$[ebp]
	push	edx
	mov	eax, DWORD PTR _tbl$[ebp]
	add	eax, 184				; 000000b8H
	push	eax
	call	_dyntab_sz
	add	esp, 12					; 0000000cH
	push	eax
	push	0
	mov	ecx, DWORD PTR _i$[ebp]
	push	ecx
	mov	edx, DWORD PTR _tbl$[ebp]
	add	edx, 184				; 000000b8H
	push	edx
	call	_dyntab_val
	add	esp, 12					; 0000000cH
	push	eax
	mov	eax, DWORD PTR _i_val$72375[ebp]
	push	eax
	mov	ecx, DWORD PTR _ctrl$[ebp]
	push	ecx
	mov	edx, DWORD PTR _cntxt$[ebp]
	push	edx
	call	_table_add_sel_chkbox
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L72407
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 1566		; 0000061eH
	jmp	$eva_err$72325
$L72407:

; 1567 : 
; 1568 : 
; 1569 : 		/* If object is not a relation */
; 1570 : 		if(!idobj || *idend)

	cmp	DWORD PTR _idobj$72373[ebp], 0
	je	SHORT $L72409
	mov	ecx, DWORD PTR _idend$72372[ebp]
	movsx	edx, BYTE PTR [ecx]
	test	edx, edx
	je	$L72408
$L72409:

; 1572 : 			DYNBUF_ADD3_INT(html, "<td>#NAR#</td><td colspan=", tbl->field.nbrows, ">");

	push	1
	push	OFFSET FLAT:$SG72411
	mov	eax, DWORD PTR _tbl$[ebp]
	mov	ecx, DWORD PTR [eax+380]
	push	ecx
	push	26					; 0000001aH
	push	OFFSET FLAT:$SG72412
	mov	edx, DWORD PTR _html$[ebp]
	push	edx
	call	_dynbuf_add3_int
	add	esp, 24					; 00000018H
	test	eax, eax
	je	SHORT $L72410
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29872], OFFSET FLAT:$SG72414
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 1572		; 00000624H
	jmp	$eva_err$72325
$L72410:

; 1573 : 			DYNBUF_ADD_CELL(html, &tbl->idobj, i, 0, TO_HTML);

	push	1
	push	OFFSET FLAT:_plain_to_html
	push	0
	mov	edx, DWORD PTR _i$[ebp]
	push	edx
	mov	eax, DWORD PTR _tbl$[ebp]
	add	eax, 184				; 000000b8H
	push	eax
	call	_dyntab_sz
	add	esp, 12					; 0000000cH
	push	eax
	push	0
	mov	ecx, DWORD PTR _i$[ebp]
	push	ecx
	mov	edx, DWORD PTR _tbl$[ebp]
	add	edx, 184				; 000000b8H
	push	edx
	call	_dyntab_val
	add	esp, 12					; 0000000cH
	push	eax
	mov	eax, DWORD PTR _html$[ebp]
	push	eax
	call	_dynbuf_add
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L72415
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29872], OFFSET FLAT:$SG72417
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 1573		; 00000625H
	jmp	$eva_err$72325
$L72415:

; 1574 : 			DYNBUF_ADD_STR(html, "</td>");

	push	0
	push	0
	push	5
	push	OFFSET FLAT:$SG72420
	mov	eax, DWORD PTR _html$[ebp]
	push	eax
	call	_dynbuf_add
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L72419
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29872], OFFSET FLAT:$SG72422
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 1574		; 00000626H
	jmp	$eva_err$72325
$L72419:

; 1576 : 		else

	jmp	$L72540
$L72408:

; 1578 : 			int b_firstcolbrk = 1;

	mov	DWORD PTR _b_firstcolbrk$72424[ebp], 1

; 1579 : 
; 1580 : 			/* Find object in objects data */
; 1581 : 			for(j = 0; j < tbl->data.nbrows && dyntab_cell(&tbl->data, j, 0)->IdObj != idobj; j++);

	mov	DWORD PTR _j$[ebp], 0
	jmp	SHORT $L72425
$L72426:
	mov	eax, DWORD PTR _j$[ebp]
	add	eax, 1
	mov	DWORD PTR _j$[ebp], eax
$L72425:
	mov	ecx, DWORD PTR _tbl$[ebp]
	mov	edx, DWORD PTR _j$[ebp]
	cmp	edx, DWORD PTR [ecx+220]
	jae	SHORT $L72427
	push	0
	mov	eax, DWORD PTR _j$[ebp]
	push	eax
	mov	ecx, DWORD PTR _tbl$[ebp]
	add	ecx, 220				; 000000dcH
	push	ecx
	call	_dyntab_cell
	add	esp, 12					; 0000000cH
	mov	edx, DWORD PTR [eax+20]
	cmp	edx, DWORD PTR _idobj$72373[ebp]
	je	SHORT $L72427
	jmp	SHORT $L72426
$L72427:

; 1582 : 			rowstart = j;

	mov	eax, DWORD PTR _j$[ebp]
	mov	DWORD PTR _rowstart$[ebp], eax

; 1583 : 
; 1584 : 			/* Output open button where applicable */
; 1585 : 			if(tbl->status & TblCtrl_openbtn && strcmp(openbtn, "_EVA_NONE"))

	mov	ecx, DWORD PTR _tbl$[ebp]
	mov	edx, DWORD PTR [ecx+32]
	and	edx, 2048				; 00000800H
	test	edx, edx
	je	$L72537
	push	OFFSET FLAT:$SG72429
	mov	eax, DWORD PTR _openbtn$[ebp]
	push	eax
	call	_strcmp
	add	esp, 8
	test	eax, eax
	je	$L72537

; 1587 : 				unsigned long w = 0, h = 0;

	mov	DWORD PTR _w$72430[ebp], 0
	mov	DWORD PTR _h$72431[ebp], 0

; 1588 : 				char *img = NULL;

	mov	DWORD PTR _img$72432[ebp], 0

; 1589 : 				char *thumb = NULL;

	mov	DWORD PTR _thumb$72434[ebp], 0

; 1590 : 				char *opbtn = openbtn;

	mov	ecx, DWORD PTR _openbtn$[ebp]
	mov	DWORD PTR _opbtn$72436[ebp], ecx

; 1591 : 
; 1592 : 				/* Output cell header */
; 1593 : 				DYNBUF_ADD_STR(html, "<td");

	push	0
	push	0
	push	3
	push	OFFSET FLAT:$SG72439
	mov	edx, DWORD PTR _html$[ebp]
	push	edx
	call	_dynbuf_add
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L72438
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29872], OFFSET FLAT:$SG72441
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 1593		; 00000639H
	jmp	$eva_err$72325
$L72438:

; 1594 : 				if(!*openbtn || !strcmp(openbtn, "_EVA_SYMBOL") || !strcmp(openbtn, "_EVA_IMAGE"))

	mov	edx, DWORD PTR _openbtn$[ebp]
	movsx	eax, BYTE PTR [edx]
	test	eax, eax
	je	SHORT $L72443
	push	OFFSET FLAT:$SG72444
	mov	ecx, DWORD PTR _openbtn$[ebp]
	push	ecx
	call	_strcmp
	add	esp, 8
	test	eax, eax
	je	SHORT $L72443
	push	OFFSET FLAT:$SG72445
	mov	edx, DWORD PTR _openbtn$[ebp]
	push	edx
	call	_strcmp
	add	esp, 8
	test	eax, eax
	jne	SHORT $L72447
$L72443:

; 1595 : 					DYNBUF_ADD_STR(html, " align=right width=1%")

	push	0
	push	0
	push	21					; 00000015H
	push	OFFSET FLAT:$SG72448
	mov	eax, DWORD PTR _html$[ebp]
	push	eax
	call	_dynbuf_add
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L72447
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29872], OFFSET FLAT:$SG72450
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 1595		; 0000063bH
	jmp	$eva_err$72325
$L72447:

; 1596 : 				if(tbl->colbrk && tbl->colbrk <= tbl->field.nbrows) DYNBUF_ADD_STR(html, " rowspan=2 valign=top");

	mov	eax, DWORD PTR _tbl$[ebp]
	cmp	DWORD PTR [eax+660], 0
	je	SHORT $L72453
	mov	ecx, DWORD PTR _tbl$[ebp]
	mov	edx, DWORD PTR _tbl$[ebp]
	mov	eax, DWORD PTR [ecx+660]
	cmp	eax, DWORD PTR [edx+380]
	ja	SHORT $L72453
	push	0
	push	0
	push	21					; 00000015H
	push	OFFSET FLAT:$SG72454
	mov	ecx, DWORD PTR _html$[ebp]
	push	ecx
	call	_dynbuf_add
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L72453
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29872], OFFSET FLAT:$SG72456
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 1596		; 0000063cH
	jmp	$eva_err$72325
$L72453:

; 1597 : 				DYNBUF_ADD_STR(html, ">");

	push	0
	push	0
	push	1
	push	OFFSET FLAT:$SG72459
	mov	ecx, DWORD PTR _html$[ebp]
	push	ecx
	call	_dynbuf_add
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L72458
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29872], OFFSET FLAT:$SG72461
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 1597		; 0000063dH
	jmp	$eva_err$72325
$L72458:

; 1598 : 
; 1599 : 				/* Handle dynamic image button */
; 1600 : 				if(!strcmp(openbtn, "_EVA_IMAGE"))

	push	OFFSET FLAT:$SG72463
	mov	ecx, DWORD PTR _openbtn$[ebp]
	push	ecx
	call	_strcmp
	add	esp, 8
	test	eax, eax
	jne	$L72489

; 1602 : 					char *end = NULL;

	mov	DWORD PTR _end$72464[ebp], 0

; 1603 : 					unsigned long idimg = 0;

	mov	DWORD PTR _idimg$72466[ebp], 0

; 1604 : 
; 1605 : 					/* Compute image from field expression */
; 1606 : 					if(form_eval_fieldexpr(cntxt, &data, 0, idobj, imgbtnfield, strlen(imgbtnfield), &tbl->data, rowstart)) CLEAR_ERROR;

	mov	edx, DWORD PTR _rowstart$[ebp]
	push	edx
	mov	eax, DWORD PTR _tbl$[ebp]
	add	eax, 220				; 000000dcH
	push	eax
	mov	ecx, DWORD PTR _imgbtnfield$[ebp]
	push	ecx
	call	_strlen
	add	esp, 4
	push	eax
	mov	edx, DWORD PTR _imgbtnfield$[ebp]
	push	edx
	mov	eax, DWORD PTR _idobj$72373[ebp]
	push	eax
	push	0
	lea	ecx, DWORD PTR _data$[ebp]
	push	ecx
	mov	edx, DWORD PTR _cntxt$[ebp]
	push	edx
	call	_form_eval_fieldexpr
	add	esp, 32					; 00000020H
	test	eax, eax
	je	SHORT $L72467
	push	1606					; 00000646H
	push	OFFSET FLAT:$SG72468
	push	OFFSET FLAT:$SG72469
	mov	eax, DWORD PTR _cntxt$[ebp]
	push	eax
	call	_err_clear
	add	esp, 16					; 00000010H
$L72467:

; 1607 : 					if(data.nbrows) img = dyntab_val(&data, 0, 0);

	cmp	DWORD PTR _data$[ebp], 0
	je	SHORT $L72470
	push	0
	push	0
	lea	ecx, DWORD PTR _data$[ebp]
	push	ecx
	call	_dyntab_val
	add	esp, 12					; 0000000cH
	mov	DWORD PTR _img$72432[ebp], eax
$L72470:

; 1608 : 
; 1609 : 					/* Handle file link : (image file name is a number with no extension) */
; 1610 : 					if(img) idimg = strtoul(img, &end, 10);

	cmp	DWORD PTR _img$72432[ebp], 0
	je	SHORT $L72471
	push	10					; 0000000aH
	lea	edx, DWORD PTR _end$72464[ebp]
	push	edx
	mov	eax, DWORD PTR _img$72432[ebp]
	push	eax
	call	_strtoul
	add	esp, 12					; 0000000cH
	mov	DWORD PTR _idimg$72466[ebp], eax
$L72471:

; 1611 : 					if(idimg && end && !*end)

	cmp	DWORD PTR _idimg$72466[ebp], 0
	je	$L72472
	cmp	DWORD PTR _end$72464[ebp], 0
	je	$L72472
	mov	ecx, DWORD PTR _end$72464[ebp]
	movsx	edx, BYTE PTR [ecx]
	test	edx, edx
	jne	SHORT $L72472

; 1613 : 						/* Get file path */
; 1614 : 						if(qry_obj_field(cntxt, &data, idimg, "_EVA_FILE_SERVER_NAME")) STACK_ERROR;

	push	OFFSET FLAT:$SG72474
	mov	eax, DWORD PTR _idimg$72466[ebp]
	push	eax
	lea	ecx, DWORD PTR _data$[ebp]
	push	ecx
	mov	edx, DWORD PTR _cntxt$[ebp]
	push	edx
	call	_qry_obj_field
	add	esp, 16					; 00000010H
	test	eax, eax
	je	SHORT $L72473
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 1614		; 0000064eH
	jmp	$eva_err$72325
$L72473:

; 1615 : 						img = dyntab_val(&data, 0, 0);

	push	0
	push	0
	lea	ecx, DWORD PTR _data$[ebp]
	push	ecx
	call	_dyntab_val
	add	esp, 12					; 0000000cH
	mov	DWORD PTR _img$72432[ebp], eax

; 1616 : 						sz_imgbtnpath = snprintf(add_sz_str(imgbtnpath), "../docs/%s/", cntxt->dbname);

	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	eax, DWORD PTR [edx+29804]
	push	eax
	push	OFFSET FLAT:$SG72475
	push	1023					; 000003ffH
	lea	ecx, DWORD PTR _imgbtnpath$[ebp]
	push	ecx
	call	__snprintf
	add	esp, 16					; 00000010H
	mov	DWORD PTR _sz_imgbtnpath$[ebp], eax

; 1618 : 					else if(*imgdir)

	jmp	SHORT $L72479
$L72472:
	mov	edx, DWORD PTR _imgdir$[ebp]
	movsx	eax, BYTE PTR [edx]
	test	eax, eax
	je	SHORT $L72477

; 1619 : 						sz_imgbtnpath = snprintf(add_sz_str(imgbtnpath), "../docs/%s/%s/", cntxt->dbname, imgdir);

	mov	ecx, DWORD PTR _imgdir$[ebp]
	push	ecx
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	eax, DWORD PTR [edx+29804]
	push	eax
	push	OFFSET FLAT:$SG72478
	push	1023					; 000003ffH
	lea	ecx, DWORD PTR _imgbtnpath$[ebp]
	push	ecx
	call	__snprintf
	add	esp, 20					; 00000014H
	mov	DWORD PTR _sz_imgbtnpath$[ebp], eax

; 1620 : 					else

	jmp	SHORT $L72479
$L72477:

; 1621 : 						sz_imgbtnpath = 0;

	mov	DWORD PTR _sz_imgbtnpath$[ebp], 0
$L72479:

; 1622 : 
; 1623 : 					/* Handle image if present */
; 1624 : 					if(img)

	cmp	DWORD PTR _img$72432[ebp], 0
	je	$L72487

; 1626 : 						/* Build image path */
; 1627 : 						if(sz_imgbtnpath)

	cmp	DWORD PTR _sz_imgbtnpath$[ebp], 0
	je	SHORT $L72481

; 1628 : 							snprintf(imgbtnpath + sz_imgbtnpath, sizeof(imgbtnpath) - sz_imgbtnpath, "%s", img);

	mov	edx, DWORD PTR _img$72432[ebp]
	push	edx
	push	OFFSET FLAT:$SG72482
	mov	eax, 1024				; 00000400H
	sub	eax, DWORD PTR _sz_imgbtnpath$[ebp]
	push	eax
	mov	ecx, DWORD PTR _sz_imgbtnpath$[ebp]
	lea	edx, DWORD PTR _imgbtnpath$[ebp+ecx]
	push	edx
	call	__snprintf
	add	esp, 16					; 00000010H

; 1629 : 						else

	jmp	SHORT $L72483
$L72481:

; 1631 : 							char *s = get_image_file(cntxt, img, NULL, NULL);

	push	0
	push	0
	mov	eax, DWORD PTR _img$72432[ebp]
	push	eax
	mov	ecx, DWORD PTR _cntxt$[ebp]
	push	ecx
	call	_get_image_file
	add	esp, 16					; 00000010H
	mov	DWORD PTR _s$72484[ebp], eax

; 1632 : 							strncpy(imgbtnpath, s, sizeof(imgbtnpath));

	push	1024					; 00000400H
	mov	edx, DWORD PTR _s$72484[ebp]
	push	edx
	lea	eax, DWORD PTR _imgbtnpath$[ebp]
	push	eax
	call	_strncpy
	add	esp, 12					; 0000000cH

; 1633 : 							M_FREE(s);

	mov	ecx, DWORD PTR _s$72484[ebp]
	push	ecx
	call	_mem_free
	add	esp, 4
	mov	DWORD PTR _s$72484[ebp], 0
$L72483:

; 1635 : 
; 1636 : 						/* Handle image resizing */
; 1637 : 						if(imgbtn_maxh || imgbtn_maxw)

	cmp	DWORD PTR _imgbtn_maxh$[ebp], 0
	jne	SHORT $L72488
	cmp	DWORD PTR _imgbtn_maxw$[ebp], 0
	je	SHORT $L72487
$L72488:

; 1639 : 							/* Get image thumbnail */
; 1640 : 							thumb = get_image_thumb(cntxt, imgbtnpath, sz_imgbtnpath, imgbtn_maxw, imgbtn_maxh, &w, &h);

	lea	edx, DWORD PTR _h$72431[ebp]
	push	edx
	lea	eax, DWORD PTR _w$72430[ebp]
	push	eax
	mov	ecx, DWORD PTR _imgbtn_maxh$[ebp]
	push	ecx
	mov	edx, DWORD PTR _imgbtn_maxw$[ebp]
	push	edx
	mov	eax, DWORD PTR _sz_imgbtnpath$[ebp]
	push	eax
	lea	ecx, DWORD PTR _imgbtnpath$[ebp]
	push	ecx
	mov	edx, DWORD PTR _cntxt$[ebp]
	push	edx
	call	_get_image_thumb
	add	esp, 28					; 0000001cH
	mov	DWORD PTR _thumb$72434[ebp], eax
$L72487:

; 1643 : 					if(!(thumb || img)) opbtn = "SYMBOL";

	cmp	DWORD PTR _thumb$72434[ebp], 0
	jne	SHORT $L72489
	cmp	DWORD PTR _img$72432[ebp], 0
	jne	SHORT $L72489
	mov	DWORD PTR _opbtn$72436[ebp], OFFSET FLAT:$SG72490
$L72489:

; 1645 : 
; 1646 : 				/* If thumbnail or image available */
; 1647 : 				if(thumb || img)

	cmp	DWORD PTR _thumb$72434[ebp], 0
	jne	SHORT $L72492
	cmp	DWORD PTR _img$72432[ebp], 0
	je	$L72491
$L72492:

; 1649 : 					/* Build open button name */
; 1650 : 					char name[64];
; 1651 : 					DynTable *d = &tbl->data;

	mov	eax, DWORD PTR _tbl$[ebp]
	add	eax, 220				; 000000dcH
	mov	DWORD PTR _d$72494[ebp], eax

; 1652 : 					unsigned long i_fc;
; 1653 : 					M_FREE(buf);

	mov	ecx, DWORD PTR _buf$[ebp]
	push	ecx
	call	_mem_free
	add	esp, 4
	mov	DWORD PTR _buf$[ebp], 0

; 1654 : 					M_FREE(buf1);

	mov	edx, DWORD PTR _buf1$[ebp]
	push	edx
	call	_mem_free
	add	esp, 4
	mov	DWORD PTR _buf1$[ebp], 0

; 1655 : 					if(qry_obj_label(cntxt, NULL, NULL, &buf, NULL, &buf1, NULL, NULL, &i_fc, 0, d, rowstart)) CLEAR_ERROR;

	mov	eax, DWORD PTR _rowstart$[ebp]
	push	eax
	mov	ecx, DWORD PTR _d$72494[ebp]
	push	ecx
	push	0
	lea	edx, DWORD PTR _i_fc$72495[ebp]
	push	edx
	push	0
	push	0
	lea	eax, DWORD PTR _buf1$[ebp]
	push	eax
	push	0
	lea	ecx, DWORD PTR _buf$[ebp]
	push	ecx
	push	0
	push	0
	mov	edx, DWORD PTR _cntxt$[ebp]
	push	edx
	call	_qry_obj_label
	add	esp, 48					; 00000030H
	test	eax, eax
	je	SHORT $L72501
	push	1655					; 00000677H
	push	OFFSET FLAT:$SG72502
	push	OFFSET FLAT:$SG72503
	mov	eax, DWORD PTR _cntxt$[ebp]
	push	eax
	call	_err_clear
	add	esp, 16					; 00000010H
$L72501:

; 1656 : 					if(buf1) DYNBUF_ADD3_BUF(&buf, "\n", buf1, NO_CONV, "");

	cmp	DWORD PTR _buf1$[ebp], 0
	je	$L72507
	cmp	DWORD PTR _buf1$[ebp], 0
	je	SHORT $L73528
	mov	ecx, DWORD PTR _buf1$[ebp]
	mov	edx, DWORD PTR [ecx+4]
	mov	DWORD PTR -1556+[ebp], edx
	jmp	SHORT $L73529
$L73528:
	mov	DWORD PTR -1556+[ebp], 0
$L73529:
	cmp	DWORD PTR _buf1$[ebp], 0
	je	SHORT $L73530
	mov	eax, DWORD PTR _buf1$[ebp]
	add	eax, 8
	mov	DWORD PTR -1560+[ebp], eax
	jmp	SHORT $L73531
$L73530:
	mov	DWORD PTR -1560+[ebp], 0
$L73531:
	push	0
	push	OFFSET FLAT:$SG72508
	push	0
	push	0
	mov	ecx, DWORD PTR -1556+[ebp]
	push	ecx
	mov	edx, DWORD PTR -1560+[ebp]
	push	edx
	push	1
	push	OFFSET FLAT:$SG72509
	lea	eax, DWORD PTR _buf$[ebp]
	push	eax
	call	_dynbuf_add3
	add	esp, 36					; 00000024H
	test	eax, eax
	je	SHORT $L72507
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29872], OFFSET FLAT:$SG72511
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 1656		; 00000678H
	jmp	$eva_err$72325
$L72507:

; 1657 : 					build_open_btn_name(cntxt, name, opform ? opform : cntxt->fc[i_fc].idform, dyntab_cell(d, rowstart, 0)->IdObj, loc,
; 1658 : 												atoi(CTRL_ATTR_VAL(OPEN_MODE)));

	cmp	DWORD PTR _ctrl$[ebp], 0
	je	SHORT $L73532
	push	0
	push	-1
	push	OFFSET FLAT:$SG72512
	mov	eax, DWORD PTR _ctrl$[ebp]
	add	eax, 44					; 0000002cH
	push	eax
	call	_dyntab_field_val
	add	esp, 16					; 00000010H
	mov	DWORD PTR -1564+[ebp], eax
	jmp	SHORT $L73533
$L73532:
	mov	DWORD PTR -1564+[ebp], OFFSET FLAT:$SG72513
$L73533:
	cmp	DWORD PTR _opform$[ebp], 0
	je	SHORT $L73534
	mov	ecx, DWORD PTR _opform$[ebp]
	mov	DWORD PTR -1568+[ebp], ecx
	jmp	SHORT $L73535
$L73534:
	mov	edx, DWORD PTR _i_fc$72495[ebp]
	imul	edx, 292				; 00000124H
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	ecx, DWORD PTR [eax+edx+96]
	mov	DWORD PTR -1568+[ebp], ecx
$L73535:
	mov	edx, DWORD PTR -1564+[ebp]
	push	edx
	call	_atoi
	add	esp, 4
	push	eax
	mov	eax, DWORD PTR _loc$[ebp]
	push	eax
	push	0
	mov	ecx, DWORD PTR _rowstart$[ebp]
	push	ecx
	mov	edx, DWORD PTR _d$72494[ebp]
	push	edx
	call	_dyntab_cell
	add	esp, 12					; 0000000cH
	mov	eax, DWORD PTR [eax+20]
	push	eax
	mov	ecx, DWORD PTR -1568+[ebp]
	push	ecx
	lea	edx, DWORD PTR _name$72493[ebp]
	push	edx
	mov	eax, DWORD PTR _cntxt$[ebp]
	push	eax
	call	_build_open_btn_name
	add	esp, 24					; 00000018H

; 1659 : 					/* Output image button */
; 1660 : 					if(put_html_button_sz(cntxt, name, NULL, thumb ? thumb : imgbtnpath, NULL, buf ? buf->data : NULL, NULL, w, h, 0, 2))

	cmp	DWORD PTR _buf$[ebp], 0
	je	SHORT $L73536
	mov	ecx, DWORD PTR _buf$[ebp]
	add	ecx, 8
	mov	DWORD PTR -1572+[ebp], ecx
	jmp	SHORT $L73537
$L73536:
	mov	DWORD PTR -1572+[ebp], 0
$L73537:
	cmp	DWORD PTR _thumb$72434[ebp], 0
	je	SHORT $L73538
	mov	edx, DWORD PTR _thumb$72434[ebp]
	mov	DWORD PTR -1576+[ebp], edx
	jmp	SHORT $L73539
$L73538:
	lea	eax, DWORD PTR _imgbtnpath$[ebp]
	mov	DWORD PTR -1576+[ebp], eax
$L73539:
	push	2
	push	0
	mov	ecx, DWORD PTR _h$72431[ebp]
	push	ecx
	mov	edx, DWORD PTR _w$72430[ebp]
	push	edx
	push	0
	mov	eax, DWORD PTR -1572+[ebp]
	push	eax
	push	0
	mov	ecx, DWORD PTR -1576+[ebp]
	push	ecx
	push	0
	lea	edx, DWORD PTR _name$72493[ebp]
	push	edx
	mov	eax, DWORD PTR _cntxt$[ebp]
	push	eax
	call	_put_html_button_sz
	add	esp, 44					; 0000002cH
	test	eax, eax
	je	SHORT $L72518

; 1661 : 						STACK_ERROR;

	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 1661		; 0000067dH
	jmp	$eva_err$72325
$L72518:

; 1663 : 				else

	jmp	$L72528
$L72491:

; 1665 : 					/* Output object symbol button */
; 1666 : 					DYNBUF_ADD_STR(html, "<table border=0 cellspacing=0 cellpadding=0><tr>");

	push	0
	push	0
	push	48					; 00000030H
	push	OFFSET FLAT:$SG72522
	mov	edx, DWORD PTR _html$[ebp]
	push	edx
	call	_dynbuf_add
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L72521
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29872], OFFSET FLAT:$SG72524
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 1666		; 00000682H
	jmp	$eva_err$72325
$L72521:

; 1667 : 					if(ctrl_add_symbol_btn(cntxt, ctrl, dyntab_cell(&ctrl->val, i_val, 0),
; 1668 : 											&tbl->data, j, "", opbtn))

	mov	edx, DWORD PTR _opbtn$72436[ebp]
	push	edx
	push	OFFSET FLAT:$SG72526
	mov	eax, DWORD PTR _j$[ebp]
	push	eax
	mov	ecx, DWORD PTR _tbl$[ebp]
	add	ecx, 220				; 000000dcH
	push	ecx
	push	0
	mov	edx, DWORD PTR _i_val$72375[ebp]
	push	edx
	mov	eax, DWORD PTR _ctrl$[ebp]
	add	eax, 64					; 00000040H
	push	eax
	call	_dyntab_cell
	add	esp, 12					; 0000000cH
	push	eax
	mov	ecx, DWORD PTR _ctrl$[ebp]
	push	ecx
	mov	edx, DWORD PTR _cntxt$[ebp]
	push	edx
	call	_ctrl_add_symbol_btn
	add	esp, 28					; 0000001cH
	test	eax, eax
	je	SHORT $L72525

; 1669 : 						STACK_ERROR;

	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 1669		; 00000685H
	jmp	$eva_err$72325
$L72525:

; 1670 : 					DYNBUF_ADD_STR(html, "</tr></table>");

	push	0
	push	0
	push	13					; 0000000dH
	push	OFFSET FLAT:$SG72529
	mov	ecx, DWORD PTR _html$[ebp]
	push	ecx
	call	_dynbuf_add
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L72528
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29872], OFFSET FLAT:$SG72531
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 1670		; 00000686H
	jmp	$eva_err$72325
$L72528:

; 1672 : 				DYNBUF_ADD_STR(html, "</td>");

	push	0
	push	0
	push	5
	push	OFFSET FLAT:$SG72534
	mov	ecx, DWORD PTR _html$[ebp]
	push	ecx
	call	_dynbuf_add
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L72533
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29872], OFFSET FLAT:$SG72536
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 1672		; 00000688H
	jmp	$eva_err$72325
$L72533:

; 1673 : 
; 1674 : 				/* Free alloc-ed path */
; 1675 : 				if(thumb) free(thumb);

	cmp	DWORD PTR _thumb$72434[ebp], 0
	je	SHORT $L72537
	mov	ecx, DWORD PTR _thumb$72434[ebp]
	push	ecx
	call	_free
	add	esp, 4
$L72537:

; 1677 : 
; 1678 : 			/* Output line data in tbl->field order */
; 1679 : 			for(j = 0; j < tbl->field.nbrows; j++)

	mov	DWORD PTR _j$[ebp], 0
	jmp	SHORT $L72538
$L72539:
	mov	edx, DWORD PTR _j$[ebp]
	add	edx, 1
	mov	DWORD PTR _j$[ebp], edx
$L72538:
	mov	eax, DWORD PTR _tbl$[ebp]
	mov	ecx, DWORD PTR _j$[ebp]
	cmp	ecx, DWORD PTR [eax+380]
	jae	$L72540

; 1681 : 				char *fmt = dyntab_val(&tbl->format, j, 0);

	push	0
	mov	edx, DWORD PTR _j$[ebp]
	push	edx
	mov	eax, DWORD PTR _tbl$[ebp]
	add	eax, 400				; 00000190H
	push	eax
	call	_dyntab_val
	add	esp, 12					; 0000000cH
	mov	DWORD PTR _fmt$72541[ebp], eax

; 1682 : 				char *s_strip = dyntab_val(&tbl->strip, j, 0);

	push	0
	mov	ecx, DWORD PTR _j$[ebp]
	push	ecx
	mov	edx, DWORD PTR _tbl$[ebp]
	add	edx, 500				; 000001f4H
	push	edx
	call	_dyntab_val
	add	esp, 12					; 0000000cH
	mov	DWORD PTR _s_strip$72542[ebp], eax

; 1683 : 				unsigned long strip = atoi(s_strip);

	mov	eax, DWORD PTR _s_strip$72542[ebp]
	push	eax
	call	_atoi
	add	esp, 4
	mov	DWORD PTR _strip$72543[ebp], eax

; 1684 : 				int b_stripped = 0;

	mov	DWORD PTR _b_stripped$72544[ebp], 0

; 1685 : 				size_t tot_char = 0;

	mov	DWORD PTR _tot_char$72545[ebp], 0

; 1686 : 				char *valign = NULL;

	mov	DWORD PTR _valign$72546[ebp], 0

; 1687 : 				char *align = dyntab_val(&tbl->align, j, 0);

	push	0
	mov	ecx, DWORD PTR _j$[ebp]
	push	ecx
	mov	edx, DWORD PTR _tbl$[ebp]
	add	edx, 440				; 000001b8H
	push	edx
	call	_dyntab_val
	add	esp, 12					; 0000000cH
	mov	DWORD PTR _align$72548[ebp], eax

; 1688 : 				char *separ = ", ";

	mov	DWORD PTR _separ$72549[ebp], OFFSET FLAT:$SG72550

; 1689 : 				int b_index = 0;

	mov	DWORD PTR _b_index$72551[ebp], 0

; 1690 : 				unsigned long line = 1;

	mov	DWORD PTR _line$72552[ebp], 1

; 1691 : 				unsigned long i0;
; 1692 : 				int b_distinct = dyntab_sz(&tbl->distinctval, j, 0);

	push	0
	mov	eax, DWORD PTR _j$[ebp]
	push	eax
	mov	ecx, DWORD PTR _tbl$[ebp]
	add	ecx, 520				; 00000208H
	push	ecx
	call	_dyntab_sz
	add	esp, 12					; 0000000cH
	mov	DWORD PTR _b_distinct$72554[ebp], eax

; 1693 : 				char *pos =	(!tbl->colbrk || j + 1 < tbl->colbrk) ? "_EVA_NewColumn" : "_EVA_SameCell";

	mov	edx, DWORD PTR _tbl$[ebp]
	cmp	DWORD PTR [edx+660], 0
	je	SHORT $L73540
	mov	eax, DWORD PTR _j$[ebp]
	add	eax, 1
	mov	ecx, DWORD PTR _tbl$[ebp]
	cmp	eax, DWORD PTR [ecx+660]
	jb	SHORT $L73540
	mov	DWORD PTR -1580+[ebp], OFFSET FLAT:$SG72557
	jmp	SHORT $L73541
$L73540:
	mov	DWORD PTR -1580+[ebp], OFFSET FLAT:$SG72556
$L73541:
	mov	edx, DWORD PTR -1580+[ebp]
	mov	DWORD PTR _pos$72555[ebp], edx

; 1694 : 				DynTableCell *cell = dyntab_cell(&tbl->data, rowstart, 0);

	push	0
	mov	eax, DWORD PTR _rowstart$[ebp]
	push	eax
	mov	ecx, DWORD PTR _tbl$[ebp]
	add	ecx, 220				; 000000dcH
	push	ecx
	call	_dyntab_cell
	add	esp, 12					; 0000000cH
	mov	DWORD PTR _cell$72558[ebp], eax

; 1695 : 				int b_colbrk = tbl->colbrk && j + 1 >= tbl->colbrk;

	mov	edx, DWORD PTR _tbl$[ebp]
	cmp	DWORD PTR [edx+660], 0
	je	SHORT $L73542
	mov	eax, DWORD PTR _j$[ebp]
	add	eax, 1
	mov	ecx, DWORD PTR _tbl$[ebp]
	cmp	eax, DWORD PTR [ecx+660]
	jb	SHORT $L73542
	mov	DWORD PTR -1584+[ebp], 1
	jmp	SHORT $L73543
$L73542:
	mov	DWORD PTR -1584+[ebp], 0
$L73543:
	mov	edx, DWORD PTR -1584+[ebp]
	mov	DWORD PTR _b_colbrk$72559[ebp], edx

; 1696 : 				int b_colbrknoval = b_colbrk && !(cell && cell->col == j);

	cmp	DWORD PTR _b_colbrk$72559[ebp], 0
	je	SHORT $L73545
	cmp	DWORD PTR _cell$72558[ebp], 0
	je	SHORT $L73544
	mov	eax, DWORD PTR _cell$72558[ebp]
	mov	ecx, DWORD PTR [eax+56]
	cmp	ecx, DWORD PTR _j$[ebp]
	je	SHORT $L73545
$L73544:
	mov	DWORD PTR -1588+[ebp], 1
	jmp	SHORT $L73546
$L73545:
	mov	DWORD PTR -1588+[ebp], 0
$L73546:
	mov	edx, DWORD PTR -1588+[ebp]
	mov	DWORD PTR _b_colbrknoval$72560[ebp], edx

; 1697 : 				int b_sel = tbl->srchcol & (1 << j);

	mov	eax, 1
	mov	ecx, DWORD PTR _j$[ebp]
	shl	eax, cl
	mov	ecx, DWORD PTR _tbl$[ebp]
	mov	edx, DWORD PTR [ecx+124]
	and	edx, eax
	mov	DWORD PTR _b_sel$72561[ebp], edx

; 1698 : 
; 1699 : 				if(cntxt->debug & DEBUG_HTML) DYNBUF_ADD3_INT(cntxt->form->html, "\n<!--- Start TableCell ", i, " -->\n");

	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	ecx, DWORD PTR [eax+29860]
	and	ecx, 128				; 00000080H
	test	ecx, ecx
	je	SHORT $L72563
	push	5
	push	OFFSET FLAT:$SG72564
	mov	edx, DWORD PTR _i$[ebp]
	push	edx
	push	23					; 00000017H
	push	OFFSET FLAT:$SG72565
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	ecx, DWORD PTR [eax+80]
	mov	edx, DWORD PTR [ecx+232]
	push	edx
	call	_dynbuf_add3_int
	add	esp, 24					; 00000018H
	test	eax, eax
	je	SHORT $L72563
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29872], OFFSET FLAT:$SG72567
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 1699		; 000006a3H
	jmp	$eva_err$72325
$L72563:

; 1700 : 
; 1701 : 				/* Set alignment & value separator */
; 1702 : 				if(!*align && !b_colbrk)

	mov	edx, DWORD PTR _align$72548[ebp]
	movsx	eax, BYTE PTR [edx]
	test	eax, eax
	jne	$L72579
	cmp	DWORD PTR _b_colbrk$72559[ebp], 0
	jne	$L72579

; 1704 : 					if(!STRCMPCASE(fmt, "_EVA_MONEY") || !strncmp(fmt, add_sz_str("_EVA_DATE"))) align = "right";

	push	OFFSET FLAT:$SG72571
	mov	ecx, DWORD PTR _fmt$72541[ebp]
	push	ecx
	call	_stricmp
	add	esp, 8
	test	eax, eax
	je	SHORT $L72570
	push	9
	push	OFFSET FLAT:$SG72572
	mov	edx, DWORD PTR _fmt$72541[ebp]
	push	edx
	call	_strncmp
	add	esp, 12					; 0000000cH
	test	eax, eax
	jne	SHORT $L72569
$L72570:
	mov	DWORD PTR _align$72548[ebp], OFFSET FLAT:$SG72573

; 1705 : 					else if(!strcmp(fmt, "_EVA_NUMBER")) align = "center";

	jmp	SHORT $L72579
$L72569:
	push	OFFSET FLAT:$SG72576
	mov	eax, DWORD PTR _fmt$72541[ebp]
	push	eax
	call	_strcmp
	add	esp, 8
	test	eax, eax
	jne	SHORT $L72575
	mov	DWORD PTR _align$72548[ebp], OFFSET FLAT:$SG72577

; 1706 : 					else if(!strncmp(fmt, add_sz_str("_EVA_RELATION_BTN"))) align = "space";

	jmp	SHORT $L72579
$L72575:
	push	17					; 00000011H
	push	OFFSET FLAT:$SG72580
	mov	ecx, DWORD PTR _fmt$72541[ebp]
	push	ecx
	call	_strncmp
	add	esp, 12					; 0000000cH
	test	eax, eax
	jne	SHORT $L72579
	mov	DWORD PTR _align$72548[ebp], OFFSET FLAT:$SG72581
$L72579:

; 1708 : 				if(!strcmp(align, "newline")) { align = ""; separ = "<br>"; }

	push	OFFSET FLAT:$SG72583
	mov	edx, DWORD PTR _align$72548[ebp]
	push	edx
	call	_strcmp
	add	esp, 8
	test	eax, eax
	jne	SHORT $L72582
	mov	DWORD PTR _align$72548[ebp], OFFSET FLAT:$SG72584
	mov	DWORD PTR _separ$72549[ebp], OFFSET FLAT:$SG72585

; 1709 : 				else if(!strcmp(align, "space")) { align = ""; separ = " "; }

	jmp	$L72597
$L72582:
	push	OFFSET FLAT:$SG72588
	mov	eax, DWORD PTR _align$72548[ebp]
	push	eax
	call	_strcmp
	add	esp, 8
	test	eax, eax
	jne	SHORT $L72587
	mov	DWORD PTR _align$72548[ebp], OFFSET FLAT:$SG72589
	mov	DWORD PTR _separ$72549[ebp], OFFSET FLAT:$SG72590

; 1710 : 				else if(!strcmp(align, "+")) { align = "center"; separ = " + "; }

	jmp	SHORT $L72597
$L72587:
	push	OFFSET FLAT:$SG72593
	mov	ecx, DWORD PTR _align$72548[ebp]
	push	ecx
	call	_strcmp
	add	esp, 8
	test	eax, eax
	jne	SHORT $L72592
	mov	DWORD PTR _align$72548[ebp], OFFSET FLAT:$SG72594
	mov	DWORD PTR _separ$72549[ebp], OFFSET FLAT:$SG72595

; 1711 : 				else if(!strcmp(align, "index")) { align = ""; b_index = 1; valign = "top"; }

	jmp	SHORT $L72597
$L72592:
	push	OFFSET FLAT:$SG72598
	mov	edx, DWORD PTR _align$72548[ebp]
	push	edx
	call	_strcmp
	add	esp, 8
	test	eax, eax
	jne	SHORT $L72597
	mov	DWORD PTR _align$72548[ebp], OFFSET FLAT:$SG72599
	mov	DWORD PTR _b_index$72551[ebp], 1
	mov	DWORD PTR _valign$72546[ebp], OFFSET FLAT:$SG72600
$L72597:

; 1712 : 
; 1713 : 				/* Handle column break mode */
; 1714 : 				if(b_colbrk && j + 1 == tbl->colbrk)

	cmp	DWORD PTR _b_colbrk$72559[ebp], 0
	je	$L72621
	mov	eax, DWORD PTR _j$[ebp]
	add	eax, 1
	mov	ecx, DWORD PTR _tbl$[ebp]
	cmp	eax, DWORD PTR [ecx+660]
	jne	$L72621

; 1716 : 					DYNBUF_ADD_STR(html, "</tr><tr");

	push	0
	push	0
	push	8
	push	OFFSET FLAT:$SG72604
	mov	edx, DWORD PTR _html$[ebp]
	push	edx
	call	_dynbuf_add
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L72603
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29872], OFFSET FLAT:$SG72606
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 1716		; 000006b4H
	jmp	$eva_err$72325
$L72603:

; 1717 : 					if(b_rowhilite) DYNBUF_ADD3(html, " onMouseOver=RowHL(this) opname='", opname, 0, NO_CONV, "'");

	cmp	DWORD PTR _b_rowhilite$[ebp], 0
	je	SHORT $L72609
	push	1
	push	OFFSET FLAT:$SG72610
	push	0
	push	0
	push	0
	lea	edx, DWORD PTR _opname$[ebp]
	push	edx
	push	33					; 00000021H
	push	OFFSET FLAT:$SG72611
	mov	eax, DWORD PTR _html$[ebp]
	push	eax
	call	_dynbuf_add3
	add	esp, 36					; 00000024H
	test	eax, eax
	je	SHORT $L72609
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29872], OFFSET FLAT:$SG72613
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 1717		; 000006b5H
	jmp	$eva_err$72325
$L72609:

; 1718 : 					if(*bg_color && strlen(bg_color) == 6) DYNBUF_ADD3(html, " bgcolor=#", bg_color, 6, NO_CONV,"")

	mov	eax, DWORD PTR _bg_color$72371[ebp]
	movsx	ecx, BYTE PTR [eax]
	test	ecx, ecx
	je	SHORT $L72616
	mov	edx, DWORD PTR _bg_color$72371[ebp]
	push	edx
	call	_strlen
	add	esp, 4
	cmp	eax, 6
	jne	SHORT $L72616
	push	0
	push	OFFSET FLAT:$SG72617
	push	0
	push	0
	push	6
	mov	eax, DWORD PTR _bg_color$72371[ebp]
	push	eax
	push	10					; 0000000aH
	push	OFFSET FLAT:$SG72618
	mov	ecx, DWORD PTR _html$[ebp]
	push	ecx
	call	_dynbuf_add3
	add	esp, 36					; 00000024H
	test	eax, eax
	je	SHORT $L72616
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29872], OFFSET FLAT:$SG72620
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 1718		; 000006b6H
	jmp	$eva_err$72325
$L72616:

; 1719 : 					DYNBUF_ADD3_INT(html, "><td colspan=", tbl->colbrk + 2, ">");

	push	1
	push	OFFSET FLAT:$SG72622
	mov	ecx, DWORD PTR _tbl$[ebp]
	mov	edx, DWORD PTR [ecx+660]
	add	edx, 2
	push	edx
	push	13					; 0000000dH
	push	OFFSET FLAT:$SG72623
	mov	eax, DWORD PTR _html$[ebp]
	push	eax
	call	_dynbuf_add3_int
	add	esp, 24					; 00000018H
	test	eax, eax
	je	SHORT $L72621
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29872], OFFSET FLAT:$SG72625
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 1719		; 000006b7H
	jmp	$eva_err$72325
$L72621:

; 1721 : 
; 1722 : 				/* Output cell header */
; 1723 : 				if(!b_colbrknoval && put_html_format_pos(cntxt, pos,
; 1724 : 					align, valign, NULL, NULL, NULL, NULL, 1, 1, NULL,
; 1725 : 					dyntab_sz(&tbl->fontsize, j, 0) ? dyntab_val(&tbl->fontsize, j, 0) : ctrl->FONTSIZE, NULL,
; 1726 : 					dyntab_val(&tbl->celstyle, j, 0),
; 1727 : 					dyntab_val(&tbl->bold, j, 0)[0] == '1', 0, dyntab_val(&tbl->underline, j, 0)[0] == '1',
; 1728 : 					!strip && *s_strip,
; 1729 : 					1)) STACK_ERROR;

	cmp	DWORD PTR _b_colbrknoval$72560[ebp], 0
	jne	$L72632
	cmp	DWORD PTR _strip$72543[ebp], 0
	jne	SHORT $L73547
	mov	eax, DWORD PTR _s_strip$72542[ebp]
	movsx	ecx, BYTE PTR [eax]
	test	ecx, ecx
	je	SHORT $L73547
	mov	DWORD PTR -1592+[ebp], 1
	jmp	SHORT $L73548
$L73547:
	mov	DWORD PTR -1592+[ebp], 0
$L73548:
	push	0
	mov	edx, DWORD PTR _j$[ebp]
	push	edx
	mov	eax, DWORD PTR _tbl$[ebp]
	add	eax, 420				; 000001a4H
	push	eax
	call	_dyntab_sz
	add	esp, 12					; 0000000cH
	test	eax, eax
	je	SHORT $L73549
	push	0
	mov	ecx, DWORD PTR _j$[ebp]
	push	ecx
	mov	edx, DWORD PTR _tbl$[ebp]
	add	edx, 420				; 000001a4H
	push	edx
	call	_dyntab_val
	add	esp, 12					; 0000000cH
	mov	DWORD PTR -1596+[ebp], eax
	jmp	SHORT $L73550
$L73549:
	mov	eax, DWORD PTR _ctrl$[ebp]
	mov	ecx, DWORD PTR [eax+356]
	mov	DWORD PTR -1596+[ebp], ecx
$L73550:
	push	1
	mov	edx, DWORD PTR -1592+[ebp]
	push	edx
	push	0
	mov	eax, DWORD PTR _j$[ebp]
	push	eax
	mov	ecx, DWORD PTR _tbl$[ebp]
	add	ecx, 480				; 000001e0H
	push	ecx
	call	_dyntab_val
	add	esp, 12					; 0000000cH
	movsx	edx, BYTE PTR [eax]
	xor	eax, eax
	cmp	edx, 49					; 00000031H
	sete	al
	push	eax
	push	0
	push	0
	mov	ecx, DWORD PTR _j$[ebp]
	push	ecx
	mov	edx, DWORD PTR _tbl$[ebp]
	add	edx, 460				; 000001ccH
	push	edx
	call	_dyntab_val
	add	esp, 12					; 0000000cH
	movsx	eax, BYTE PTR [eax]
	xor	ecx, ecx
	cmp	eax, 49					; 00000031H
	sete	cl
	push	ecx
	push	0
	mov	edx, DWORD PTR _j$[ebp]
	push	edx
	mov	eax, DWORD PTR _tbl$[ebp]
	add	eax, 560				; 00000230H
	push	eax
	call	_dyntab_val
	add	esp, 12					; 0000000cH
	push	eax
	push	0
	mov	ecx, DWORD PTR -1596+[ebp]
	push	ecx
	push	0
	push	1
	push	1
	push	0
	push	0
	push	0
	push	0
	mov	edx, DWORD PTR _valign$72546[ebp]
	push	edx
	mov	eax, DWORD PTR _align$72548[ebp]
	push	eax
	mov	ecx, DWORD PTR _pos$72555[ebp]
	push	ecx
	mov	edx, DWORD PTR _cntxt$[ebp]
	push	edx
	call	_put_html_format_pos
	add	esp, 76					; 0000004cH
	test	eax, eax
	je	SHORT $L72632
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 1729		; 000006c1H
	jmp	$eva_err$72325
$L72632:

; 1730 : 
; 1731 : 				/* Handle column break mode */
; 1732 : 				if(b_colbrk && !b_colbrknoval)

	cmp	DWORD PTR _b_colbrk$72559[ebp], 0
	je	$L72648
	cmp	DWORD PTR _b_colbrknoval$72560[ebp], 0
	jne	$L72648

; 1734 : 					if(!b_firstcolbrk) DYNBUF_ADD_STR(html, "<br>");

	cmp	DWORD PTR _b_firstcolbrk$72424[ebp], 0
	jne	SHORT $L72636
	push	0
	push	0
	push	4
	push	OFFSET FLAT:$SG72637
	mov	ecx, DWORD PTR _html$[ebp]
	push	ecx
	call	_dynbuf_add
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L72636
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29872], OFFSET FLAT:$SG72639
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 1734		; 000006c6H
	jmp	$eva_err$72325
$L72636:

; 1735 : 					b_firstcolbrk = 0;

	mov	DWORD PTR _b_firstcolbrk$72424[ebp], 0

; 1736 : 					if(dyntab_sz(&tbl->label, j, 0))

	push	0
	mov	ecx, DWORD PTR _j$[ebp]
	push	ecx
	mov	edx, DWORD PTR _tbl$[ebp]
	add	edx, 360				; 00000168H
	push	edx
	call	_dyntab_sz
	add	esp, 12					; 0000000cH
	test	eax, eax
	je	$L72648

; 1738 : 						DYNBUF_ADD3_CELL(html, "<u>", &tbl->label, j, 0, TO_HTML, "</u> : ");

	push	7
	push	OFFSET FLAT:$SG72642
	push	1
	push	OFFSET FLAT:_plain_to_html
	push	0
	mov	eax, DWORD PTR _j$[ebp]
	push	eax
	mov	ecx, DWORD PTR _tbl$[ebp]
	add	ecx, 360				; 00000168H
	push	ecx
	call	_dyntab_sz
	add	esp, 12					; 0000000cH
	push	eax
	push	0
	mov	edx, DWORD PTR _j$[ebp]
	push	edx
	mov	eax, DWORD PTR _tbl$[ebp]
	add	eax, 360				; 00000168H
	push	eax
	call	_dyntab_val
	add	esp, 12					; 0000000cH
	push	eax
	push	3
	push	OFFSET FLAT:$SG72643
	mov	ecx, DWORD PTR _html$[ebp]
	push	ecx
	call	_dynbuf_add3
	add	esp, 36					; 00000024H
	test	eax, eax
	je	SHORT $L72641
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29872], OFFSET FLAT:$SG72645
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 1738		; 000006caH
	jmp	$eva_err$72325
$L72641:

; 1739 : 						if(cell && cell->txt && strchr(cell->txt, '\n')) DYNBUF_ADD_STR(html, "<br>");

	cmp	DWORD PTR _cell$72558[ebp], 0
	je	SHORT $L72648
	mov	ecx, DWORD PTR _cell$72558[ebp]
	cmp	DWORD PTR [ecx], 0
	je	SHORT $L72648
	push	10					; 0000000aH
	mov	edx, DWORD PTR _cell$72558[ebp]
	mov	eax, DWORD PTR [edx]
	push	eax
	call	_strchr
	add	esp, 8
	test	eax, eax
	je	SHORT $L72648
	push	0
	push	0
	push	4
	push	OFFSET FLAT:$SG72649
	mov	ecx, DWORD PTR _html$[ebp]
	push	ecx
	call	_dynbuf_add
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L72648
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29872], OFFSET FLAT:$SG72651
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 1739		; 000006cbH
	jmp	$eva_err$72325
$L72648:

; 1742 : 
; 1743 : 				/* Handle buttons */
; 1744 : 				if(!strcmp(dyntab_val(&tbl->field, j, 0), "_EVA_BUTTON"))

	push	OFFSET FLAT:$SG72653
	push	0
	mov	ecx, DWORD PTR _j$[ebp]
	push	ecx
	mov	edx, DWORD PTR _tbl$[ebp]
	add	edx, 380				; 0000017cH
	push	edx
	call	_dyntab_val
	add	esp, 12					; 0000000cH
	push	eax
	call	_strcmp
	add	esp, 8
	test	eax, eax
	jne	SHORT $L72652

; 1746 : 					if(table_put_action_button(cntxt, i_ctrl, idobj, j)) STACK_ERROR;

	mov	eax, DWORD PTR _j$[ebp]
	push	eax
	mov	ecx, DWORD PTR _idobj$72373[ebp]
	push	ecx
	mov	edx, DWORD PTR _i_ctrl$[ebp]
	push	edx
	mov	eax, DWORD PTR _cntxt$[ebp]
	push	eax
	call	_table_put_action_button
	add	esp, 16					; 00000010H
	test	eax, eax
	je	SHORT $L72654
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 1746		; 000006d2H
	jmp	$eva_err$72325
$L72654:

; 1748 : 				/* Data field : read cell values & output formated */
; 1749 : 				else for(k = 0; rowstart < tbl->data.nbrows; k++, rowstart++)

	jmp	$L72658
$L72652:
	mov	DWORD PTR _k$[ebp], 0
	jmp	SHORT $L72656
$L72657:
	mov	edx, DWORD PTR _k$[ebp]
	add	edx, 1
	mov	DWORD PTR _k$[ebp], edx
	mov	eax, DWORD PTR _rowstart$[ebp]
	add	eax, 1
	mov	DWORD PTR _rowstart$[ebp], eax
$L72656:
	mov	ecx, DWORD PTR _tbl$[ebp]
	mov	edx, DWORD PTR _rowstart$[ebp]
	cmp	edx, DWORD PTR [ecx+220]
	jae	$L72658

; 1751 : 					/* Insert space & break if column changes */
; 1752 : 					int b_found = 0;

	mov	DWORD PTR _b_found$72659[ebp], 0

; 1753 : 					cell = dyntab_cell(&tbl->data, rowstart, 0);

	push	0
	mov	eax, DWORD PTR _rowstart$[ebp]
	push	eax
	mov	ecx, DWORD PTR _tbl$[ebp]
	add	ecx, 220				; 000000dcH
	push	ecx
	call	_dyntab_cell
	add	esp, 12					; 0000000cH
	mov	DWORD PTR _cell$72558[ebp], eax

; 1754 : 					if(cell->col != j)

	mov	edx, DWORD PTR _cell$72558[ebp]
	mov	eax, DWORD PTR [edx+56]
	cmp	eax, DWORD PTR _j$[ebp]
	je	SHORT $L72660

; 1756 : 						if(!k && !b_colbrk) DYNBUF_ADD_STR(html, "&nbsp;");

	cmp	DWORD PTR _k$[ebp], 0
	jne	SHORT $L72663
	cmp	DWORD PTR _b_colbrk$72559[ebp], 0
	jne	SHORT $L72663
	push	0
	push	0
	push	6
	push	OFFSET FLAT:$SG72664
	mov	ecx, DWORD PTR _html$[ebp]
	push	ecx
	call	_dynbuf_add
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L72663
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29872], OFFSET FLAT:$SG72666
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 1756		; 000006dcH
	jmp	$eva_err$72325
$L72663:

; 1757 : 						break;

	jmp	$L72658
$L72660:

; 1759 : 
; 1760 : 					/* Ignore values after stripping */
; 1761 : 					if(b_stripped) continue;

	cmp	DWORD PTR _b_stripped$72544[ebp], 0
	je	SHORT $L72667
	jmp	$L72657
$L72667:

; 1762 : 
; 1763 : 					/* If max strip count is reached : strip */
; 1764 : 					if(strip && tot_char >= strip)

	cmp	DWORD PTR _strip$72543[ebp], 0
	je	SHORT $L72668
	mov	ecx, DWORD PTR _tot_char$72545[ebp]
	cmp	ecx, DWORD PTR _strip$72543[ebp]
	jb	SHORT $L72668

; 1766 : 						DYNBUF_ADD_STR(html, " ...");

	push	0
	push	0
	push	4
	push	OFFSET FLAT:$SG72671
	mov	edx, DWORD PTR _html$[ebp]
	push	edx
	call	_dynbuf_add
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L72670
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29872], OFFSET FLAT:$SG72673
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 1766		; 000006e6H
	jmp	$eva_err$72325
$L72670:

; 1767 : 						b_stripped = 1;

	mov	DWORD PTR _b_stripped$72544[ebp], 1

; 1768 : 						continue;

	jmp	$L72657
$L72668:

; 1770 : 
; 1771 : 					/* Distinct values required : search for same previous value - ignore if found */
; 1772 : 					if(b_distinct) for(i0 = 0; i0 < k && !b_found; i0++)

	cmp	DWORD PTR _b_distinct$72554[ebp], 0
	je	SHORT $L72677
	mov	DWORD PTR _i0$72553[ebp], 0
	jmp	SHORT $L72675
$L72676:
	mov	edx, DWORD PTR _i0$72553[ebp]
	add	edx, 1
	mov	DWORD PTR _i0$72553[ebp], edx
$L72675:
	mov	eax, DWORD PTR _i0$72553[ebp]
	cmp	eax, DWORD PTR _k$[ebp]
	jae	SHORT $L72677
	cmp	DWORD PTR _b_found$72659[ebp], 0
	jne	SHORT $L72677

; 1773 : 						if(!dyntab_cmp(&tbl->data, rowstart, 0, &tbl->data, rowstart - i0 - 1, 0))

	push	0
	mov	ecx, DWORD PTR _rowstart$[ebp]
	sub	ecx, DWORD PTR _i0$72553[ebp]
	sub	ecx, 1
	push	ecx
	mov	edx, DWORD PTR _tbl$[ebp]
	add	edx, 220				; 000000dcH
	push	edx
	push	0
	mov	eax, DWORD PTR _rowstart$[ebp]
	push	eax
	mov	ecx, DWORD PTR _tbl$[ebp]
	add	ecx, 220				; 000000dcH
	push	ecx
	call	_dyntab_cmp
	add	esp, 24					; 00000018H
	test	eax, eax
	jne	SHORT $L72678

; 1774 : 							b_found = 1;

	mov	DWORD PTR _b_found$72659[ebp], 1
$L72678:

; 1775 : 					if(b_found) continue;

	jmp	SHORT $L72676
$L72677:
	cmp	DWORD PTR _b_found$72659[ebp], 0
	je	SHORT $L72679
	jmp	$L72657
$L72679:

; 1776 : 
; 1777 : 					/* Output value separator if applicable */
; 1778 : 					if(b_index || (cell->Line && !dyntab_sz(&tbl->align, j, 0)))

	cmp	DWORD PTR _b_index$72551[ebp], 0
	jne	SHORT $L72681
	mov	edx, DWORD PTR _cell$72558[ebp]
	cmp	DWORD PTR [edx+40], 0
	je	$L72680
	push	0
	mov	eax, DWORD PTR _j$[ebp]
	push	eax
	mov	ecx, DWORD PTR _tbl$[ebp]
	add	ecx, 440				; 000001b8H
	push	ecx
	call	_dyntab_sz
	add	esp, 12					; 0000000cH
	test	eax, eax
	jne	$L72680
$L72681:

; 1780 : 						if(line >= cell->Line && k) DYNBUF_ADD(html, separ, 0, NO_CONV)

	mov	edx, DWORD PTR _cell$72558[ebp]
	mov	eax, DWORD PTR _line$72552[ebp]
	cmp	eax, DWORD PTR [edx+40]
	jb	SHORT $L72682
	cmp	DWORD PTR _k$[ebp], 0
	je	SHORT $L72682
	push	0
	push	0
	push	0
	mov	ecx, DWORD PTR _separ$72549[ebp]
	push	ecx
	mov	edx, DWORD PTR _html$[ebp]
	push	edx
	call	_dynbuf_add
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L72684
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29872], OFFSET FLAT:$SG72686
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 1780		; 000006f4H
	jmp	$eva_err$72325
$L72684:

; 1781 : 						else while(line < cell->Line) { DYNBUF_ADD_STR(html, "<br>"); line++; }

	jmp	SHORT $L72690
$L72682:
	mov	edx, DWORD PTR _cell$72558[ebp]
	mov	eax, DWORD PTR _line$72552[ebp]
	cmp	eax, DWORD PTR [edx+40]
	jae	SHORT $L72690
	push	0
	push	0
	push	4
	push	OFFSET FLAT:$SG72693
	mov	ecx, DWORD PTR _html$[ebp]
	push	ecx
	call	_dynbuf_add
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L72692
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29872], OFFSET FLAT:$SG72695
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 1781		; 000006f5H
	jmp	$eva_err$72325
$L72692:
	mov	ecx, DWORD PTR _line$72552[ebp]
	add	ecx, 1
	mov	DWORD PTR _line$72552[ebp], ecx
	jmp	SHORT $L72682
$L72690:

; 1783 : 					else if(k) DYNBUF_ADD(html, separ, 0, NO_CONV);

	jmp	SHORT $L72699
$L72680:
	cmp	DWORD PTR _k$[ebp], 0
	je	SHORT $L72699
	push	0
	push	0
	push	0
	mov	edx, DWORD PTR _separ$72549[ebp]
	push	edx
	mov	eax, DWORD PTR _html$[ebp]
	push	eax
	call	_dynbuf_add
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L72699
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29872], OFFSET FLAT:$SG72701
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 1783		; 000006f7H
	jmp	$eva_err$72325
$L72699:

; 1784 : 
; 1785 : 					/* Memorize first value for line buttons tooltip */
; 1786 : 					if(i_label == tbl->data.nbrows) i_label = rowstart;

	mov	eax, DWORD PTR _tbl$[ebp]
	mov	ecx, DWORD PTR _i_label$72374[ebp]
	cmp	ecx, DWORD PTR [eax+220]
	jne	SHORT $L72702
	mov	edx, DWORD PTR _rowstart$[ebp]
	mov	DWORD PTR _i_label$72374[ebp], edx
$L72702:

; 1787 : 
; 1788 : 					/* Put formated value */
; 1789 : 					tbl->srchwords.nbrows = b_sel ? nbwords : 0;

	mov	eax, DWORD PTR _b_sel$72561[ebp]
	neg	eax
	sbb	eax, eax
	and	eax, DWORD PTR _nbwords$[ebp]
	mov	ecx, DWORD PTR _tbl$[ebp]
	mov	DWORD PTR [ecx+104], eax

; 1790 : 					if(html_put_value_fmt(cntxt, ctrl, &tbl->data, rowstart, fmt, strip, &tot_char, &b_stripped))

	lea	edx, DWORD PTR _b_stripped$72544[ebp]
	push	edx
	lea	eax, DWORD PTR _tot_char$72545[ebp]
	push	eax
	mov	ecx, DWORD PTR _strip$72543[ebp]
	push	ecx
	mov	edx, DWORD PTR _fmt$72541[ebp]
	push	edx
	mov	eax, DWORD PTR _rowstart$[ebp]
	push	eax
	mov	ecx, DWORD PTR _tbl$[ebp]
	add	ecx, 220				; 000000dcH
	push	ecx
	mov	edx, DWORD PTR _ctrl$[ebp]
	push	edx
	mov	eax, DWORD PTR _cntxt$[ebp]
	push	eax
	call	_html_put_value_fmt
	add	esp, 32					; 00000020H
	test	eax, eax
	je	SHORT $L72703

; 1791 : 						CLEAR_ERROR;

	push	1791					; 000006ffH
	push	OFFSET FLAT:$SG72704
	push	OFFSET FLAT:$SG72705
	mov	ecx, DWORD PTR _cntxt$[ebp]
	push	ecx
	call	_err_clear
	add	esp, 16					; 00000010H
$L72703:

; 1792 : 
; 1793 : 					/* Add unit if column break */
; 1794 : 					if(b_colbrk)

	cmp	DWORD PTR _b_colbrk$72559[ebp], 0
	je	$L72711

; 1796 : 						DynTableCell *lbl = dyntab_cell(&tbl->lblunit, j, 0);

	push	0
	mov	edx, DWORD PTR _j$[ebp]
	push	edx
	mov	eax, DWORD PTR _tbl$[ebp]
	add	eax, 640				; 00000280H
	push	eax
	call	_dyntab_cell
	add	esp, 12					; 0000000cH
	mov	DWORD PTR _lbl$72707[ebp], eax

; 1797 : 						if(lbl && lbl->len) DYNBUF_ADD3_CELLP(html, " ", lbl, TO_HTML, "");

	cmp	DWORD PTR _lbl$72707[ebp], 0
	je	$L72711
	mov	ecx, DWORD PTR _lbl$72707[ebp]
	cmp	DWORD PTR [ecx+4], 0
	je	$L72711
	mov	edx, DWORD PTR _lbl$72707[ebp]
	mov	DWORD PTR __c$72709[ebp], edx
	cmp	DWORD PTR __c$72709[ebp], 0
	je	SHORT $L73551
	mov	eax, DWORD PTR __c$72709[ebp]
	mov	ecx, DWORD PTR [eax+4]
	mov	DWORD PTR -1600+[ebp], ecx
	jmp	SHORT $L73552
$L73551:
	mov	DWORD PTR -1600+[ebp], 0
$L73552:
	cmp	DWORD PTR __c$72709[ebp], 0
	je	SHORT $L73553
	mov	edx, DWORD PTR __c$72709[ebp]
	mov	eax, DWORD PTR [edx]
	mov	DWORD PTR -1604+[ebp], eax
	jmp	SHORT $L73554
$L73553:
	mov	DWORD PTR -1604+[ebp], 0
$L73554:
	push	0
	push	OFFSET FLAT:$SG72712
	push	1
	push	OFFSET FLAT:_plain_to_html
	mov	ecx, DWORD PTR -1600+[ebp]
	push	ecx
	mov	edx, DWORD PTR -1604+[ebp]
	push	edx
	push	1
	push	OFFSET FLAT:$SG72713
	mov	eax, DWORD PTR _html$[ebp]
	push	eax
	call	_dynbuf_add3
	add	esp, 36					; 00000024H
	test	eax, eax
	je	SHORT $L72711
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29872], OFFSET FLAT:$SG72715
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 1797		; 00000705H
	jmp	$eva_err$72325
$L72711:

; 1799 : 				}

	jmp	$L72657
$L72658:

; 1800 : 
; 1801 : 				/* Output cell footer */
; 1802 : 				if(put_html_format_pos(cntxt, pos,
; 1803 : 					align, valign, NULL, NULL, NULL, NULL, 1, 1, NULL,
; 1804 : 					dyntab_sz(&tbl->fontsize, j, 0) ? dyntab_val(&tbl->fontsize, j, 0) : ctrl->FONTSIZE, NULL, NULL,
; 1805 : 					dyntab_val(&tbl->bold, j, 0)[0] == '1', 0, dyntab_val(&tbl->underline, j, 0)[0] == '1',
; 1806 : 					!strip && s_strip,
; 1807 : 					0)) STACK_ERROR;

	cmp	DWORD PTR _strip$72543[ebp], 0
	jne	SHORT $L73555
	cmp	DWORD PTR _s_strip$72542[ebp], 0
	je	SHORT $L73555
	mov	DWORD PTR -1608+[ebp], 1
	jmp	SHORT $L73556
$L73555:
	mov	DWORD PTR -1608+[ebp], 0
$L73556:
	push	0
	mov	eax, DWORD PTR _j$[ebp]
	push	eax
	mov	ecx, DWORD PTR _tbl$[ebp]
	add	ecx, 420				; 000001a4H
	push	ecx
	call	_dyntab_sz
	add	esp, 12					; 0000000cH
	test	eax, eax
	je	SHORT $L73557
	push	0
	mov	edx, DWORD PTR _j$[ebp]
	push	edx
	mov	eax, DWORD PTR _tbl$[ebp]
	add	eax, 420				; 000001a4H
	push	eax
	call	_dyntab_val
	add	esp, 12					; 0000000cH
	mov	DWORD PTR -1612+[ebp], eax
	jmp	SHORT $L73558
$L73557:
	mov	ecx, DWORD PTR _ctrl$[ebp]
	mov	edx, DWORD PTR [ecx+356]
	mov	DWORD PTR -1612+[ebp], edx
$L73558:
	push	0
	mov	eax, DWORD PTR -1608+[ebp]
	push	eax
	push	0
	mov	ecx, DWORD PTR _j$[ebp]
	push	ecx
	mov	edx, DWORD PTR _tbl$[ebp]
	add	edx, 480				; 000001e0H
	push	edx
	call	_dyntab_val
	add	esp, 12					; 0000000cH
	movsx	eax, BYTE PTR [eax]
	xor	ecx, ecx
	cmp	eax, 49					; 00000031H
	sete	cl
	push	ecx
	push	0
	push	0
	mov	edx, DWORD PTR _j$[ebp]
	push	edx
	mov	eax, DWORD PTR _tbl$[ebp]
	add	eax, 460				; 000001ccH
	push	eax
	call	_dyntab_val
	add	esp, 12					; 0000000cH
	movsx	ecx, BYTE PTR [eax]
	xor	edx, edx
	cmp	ecx, 49					; 00000031H
	sete	dl
	push	edx
	push	0
	push	0
	mov	eax, DWORD PTR -1612+[ebp]
	push	eax
	push	0
	push	1
	push	1
	push	0
	push	0
	push	0
	push	0
	mov	ecx, DWORD PTR _valign$72546[ebp]
	push	ecx
	mov	edx, DWORD PTR _align$72548[ebp]
	push	edx
	mov	eax, DWORD PTR _pos$72555[ebp]
	push	eax
	mov	ecx, DWORD PTR _cntxt$[ebp]
	push	ecx
	call	_put_html_format_pos
	add	esp, 76					; 0000004cH
	test	eax, eax
	je	SHORT $L72723
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 1807		; 0000070fH
	jmp	$eva_err$72325
$L72723:

; 1808 : 
; 1809 : 				/* Handle column break mode */
; 1810 : 				if(b_colbrk && j + 1 == tbl->field.nbrows)

	cmp	DWORD PTR _b_colbrk$72559[ebp], 0
	je	SHORT $L72726
	mov	eax, DWORD PTR _j$[ebp]
	add	eax, 1
	mov	ecx, DWORD PTR _tbl$[ebp]
	cmp	eax, DWORD PTR [ecx+380]
	jne	SHORT $L72726

; 1811 : 					DYNBUF_ADD_STR(html, "</td>");

	push	0
	push	0
	push	5
	push	OFFSET FLAT:$SG72727
	mov	edx, DWORD PTR _html$[ebp]
	push	edx
	call	_dynbuf_add
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L72726
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29872], OFFSET FLAT:$SG72729
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 1811		; 00000713H
	jmp	$eva_err$72325
$L72726:

; 1812 : 
; 1813 : 				if(cntxt->debug & DEBUG_HTML) DYNBUF_ADD3_INT(cntxt->form->html, "\n<!--- EndOf TableCell ", i, " -->\n");

	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	eax, DWORD PTR [edx+29860]
	and	eax, 128				; 00000080H
	test	eax, eax
	je	SHORT $L72731
	push	5
	push	OFFSET FLAT:$SG72732
	mov	ecx, DWORD PTR _i$[ebp]
	push	ecx
	push	23					; 00000017H
	push	OFFSET FLAT:$SG72733
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	eax, DWORD PTR [edx+80]
	mov	ecx, DWORD PTR [eax+232]
	push	ecx
	call	_dynbuf_add3_int
	add	esp, 24					; 00000018H
	test	eax, eax
	je	SHORT $L72731
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29872], OFFSET FLAT:$SG72735
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 1813		; 00000715H
	jmp	$eva_err$72325
$L72731:

; 1814 : 
; 1815 : 				/* Output arrows where applicable */
; 1816 : 				if(b_arrows && j + 1 == (tbl->colbrk ? tbl->colbrk - 1 : tbl->field.nbrows) &&
; 1817 : 					table_add_updown_btns(cntxt, ctrl, i + tbl->line, DYNTAB_VAL_SZ(&tbl->data, i_label, 0), bg_color))

	cmp	DWORD PTR _b_arrows$[ebp], 0
	je	$L72736
	mov	ecx, DWORD PTR _tbl$[ebp]
	cmp	DWORD PTR [ecx+660], 0
	je	SHORT $L73559
	mov	edx, DWORD PTR _tbl$[ebp]
	mov	eax, DWORD PTR [edx+660]
	sub	eax, 1
	mov	DWORD PTR -1616+[ebp], eax
	jmp	SHORT $L73560
$L73559:
	mov	ecx, DWORD PTR _tbl$[ebp]
	mov	edx, DWORD PTR [ecx+380]
	mov	DWORD PTR -1616+[ebp], edx
$L73560:
	mov	eax, DWORD PTR _j$[ebp]
	add	eax, 1
	cmp	eax, DWORD PTR -1616+[ebp]
	jne	SHORT $L72736
	mov	ecx, DWORD PTR _bg_color$72371[ebp]
	push	ecx
	push	0
	mov	edx, DWORD PTR _i_label$72374[ebp]
	push	edx
	mov	eax, DWORD PTR _tbl$[ebp]
	add	eax, 220				; 000000dcH
	push	eax
	call	_dyntab_sz
	add	esp, 12					; 0000000cH
	push	eax
	push	0
	mov	ecx, DWORD PTR _i_label$72374[ebp]
	push	ecx
	mov	edx, DWORD PTR _tbl$[ebp]
	add	edx, 220				; 000000dcH
	push	edx
	call	_dyntab_val
	add	esp, 12					; 0000000cH
	push	eax
	mov	eax, DWORD PTR _tbl$[ebp]
	mov	ecx, DWORD PTR _i$[ebp]
	add	ecx, DWORD PTR [eax+40]
	push	ecx
	mov	edx, DWORD PTR _ctrl$[ebp]
	push	edx
	mov	eax, DWORD PTR _cntxt$[ebp]
	push	eax
	call	_table_add_updown_btns
	add	esp, 24					; 00000018H
	test	eax, eax
	je	SHORT $L72736

; 1818 : 					STACK_ERROR;

	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 1818		; 0000071aH
	jmp	$eva_err$72325
$L72736:

; 1819 : 			}

	jmp	$L72539
$L72540:

; 1821 : 
; 1822 : 		/* Output line end */
; 1823 : 		DYNBUF_ADD_STR(html, "</tr>");

	push	0
	push	0
	push	5
	push	OFFSET FLAT:$SG72739
	mov	edx, DWORD PTR _html$[ebp]
	push	edx
	call	_dynbuf_add
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L72738
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29872], OFFSET FLAT:$SG72741
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 1823		; 0000071fH
	jmp	$eva_err$72325
$L72738:

; 1824 : 	}

	jmp	$L72369
$L72370:

; 1825 : 
; 1826 : 	if(cntxt->debug & DEBUG_HTML) DYNBUF_ADD3(cntxt->form->html, "\n<!--- EndOf TableRows ", ctrl->LABEL, 0, NO_CONV, " -->\n");

	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	eax, DWORD PTR [edx+29860]
	and	eax, 128				; 00000080H
	test	eax, eax
	je	SHORT $L72744
	push	5
	push	OFFSET FLAT:$SG72745
	push	0
	push	0
	push	0
	mov	ecx, DWORD PTR _ctrl$[ebp]
	mov	edx, DWORD PTR [ecx+284]
	push	edx
	push	23					; 00000017H
	push	OFFSET FLAT:$SG72746
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	ecx, DWORD PTR [eax+80]
	mov	edx, DWORD PTR [ecx+232]
	push	edx
	call	_dynbuf_add3
	add	esp, 36					; 00000024H
	test	eax, eax
	je	SHORT $L72744
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29872], OFFSET FLAT:$SG72748
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 1826		; 00000722H
	jmp	SHORT $eva_err$72325
$L72744:
$eva_noerr$72313:

; 1827 : 
; 1828 : 	RETURN_OK_CLEANUP;

	push	0
	push	OFFSET FLAT:$SG72749
	push	OFFSET FLAT:$SG72750
	mov	edx, DWORD PTR _cntxt$[ebp]
	push	edx
	call	_err_clear
	add	esp, 16					; 00000010H
$eva_err$72325:
	mov	eax, DWORD PTR _cntxt$[ebp]
	cmp	DWORD PTR [eax+29872], 0
	je	SHORT $L72751
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	edx, DWORD PTR [ecx+29900]
	push	edx
	push	OFFSET FLAT:$SG72752
	push	OFFSET FLAT:$SG72753
	mov	eax, DWORD PTR _cntxt$[ebp]
	push	eax
	call	_err_add_context
	add	esp, 16					; 00000010H
$L72751:
	mov	ecx, DWORD PTR _buf$[ebp]
	push	ecx
	call	_mem_free
	add	esp, 4
	mov	DWORD PTR _buf$[ebp], 0
	mov	edx, DWORD PTR _buf1$[ebp]
	push	edx
	call	_mem_free
	add	esp, 4
	mov	DWORD PTR _buf1$[ebp], 0
	lea	eax, DWORD PTR _data$[ebp]
	push	eax
	call	_dyntab_free
	add	esp, 4
	lea	ecx, DWORD PTR _objdata$[ebp]
	push	ecx
	call	_dyntab_free
	add	esp, 4
	lea	edx, DWORD PTR _ctrldata$[ebp]
	push	edx
	call	_dyntab_free
	add	esp, 4
	lea	eax, DWORD PTR _ctrldata1$[ebp]
	push	eax
	call	_dyntab_free
	add	esp, 4
	lea	ecx, DWORD PTR _colorfld$[ebp]
	push	ecx
	call	_dyntab_free
	add	esp, 4
	mov	edx, DWORD PTR _cntxt$[ebp]
	xor	eax, eax
	cmp	DWORD PTR [edx+29872], 0
	setne	al
$L72253:

; 1829 : }

	pop	edi
	mov	esp, ebp
	pop	ebp
	ret	0
_table_put_rows ENDP
_TEXT	ENDS
PUBLIC	_table_put_status
EXTRN	_cgi_put_subfield:NEAR
_DATA	SEGMENT
	ORG $+1
$SG72770 DB	'STATUS', 00H
	ORG $+1
$SG72773 DB	'%d,%lu,%lu,%lu,%d,%lu,%lu,%du', 00H
	ORG $+2
$SG72775 DB	'STATUS', 00H
	ORG $+1
$SG72776 DB	'D:\Travail\ABI\EVA\V4.0\CGI\Brunix-2016\table_utils.c', 00H
	ORG $+2
$SG72777 DB	'table_put_status', 00H
	ORG $+3
$SG72779 DB	'D:\Travail\ABI\EVA\V4.0\CGI\Brunix-2016\table_utils.c', 00H
	ORG $+2
$SG72780 DB	'table_put_status', 00H
_DATA	ENDS
_TEXT	SEGMENT
_cntxt$ = 8
_i_ctrl$ = 12
_form$ = -4
_ctrl$ = -96
_tbl$ = -8
_cgival$ = -28
_status$ = -92
_table_put_status PROC NEAR

; 1842 : ){

	push	ebp
	mov	ebp, esp
	sub	esp, 96					; 00000060H

; 1843 : 	EVA_form *form = cntxt->form;

	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	ecx, DWORD PTR [eax+80]
	mov	DWORD PTR _form$[ebp], ecx

; 1844 : 	EVA_ctrl *ctrl = form->ctrl + i_ctrl;

	mov	edx, DWORD PTR _i_ctrl$[ebp]
	imul	edx, 480				; 000001e0H
	mov	eax, DWORD PTR _form$[ebp]
	mov	ecx, DWORD PTR [eax]
	add	ecx, edx
	mov	DWORD PTR _ctrl$[ebp], ecx

; 1845 : 	ObjTableFormat *tbl = ctrl->objtbl;

	mov	edx, DWORD PTR _ctrl$[ebp]
	mov	eax, DWORD PTR [edx+232]
	mov	DWORD PTR _tbl$[ebp], eax

; 1846 : 	DynTable cgival = { 0 };

	mov	DWORD PTR _cgival$[ebp], 0
	xor	ecx, ecx
	mov	DWORD PTR _cgival$[ebp+4], ecx
	mov	DWORD PTR _cgival$[ebp+8], ecx
	mov	DWORD PTR _cgival$[ebp+12], ecx
	mov	DWORD PTR _cgival$[ebp+16], ecx

; 1847 : 	char status[64];
; 1848 : 
; 1849 : 	if(tbl->b_no_status) RETURN_OK;

	mov	edx, DWORD PTR _tbl$[ebp]
	cmp	DWORD PTR [edx+36], 0
	je	SHORT $L72767
	jmp	$eva_noerr$72768
$L72767:

; 1850 : 	CTRL_GET_CGI_SUBFIELD("STATUS");

	push	0
	push	0
	push	0
	push	OFFSET FLAT:$SG72770
	mov	eax, DWORD PTR _ctrl$[ebp]
	push	eax
	lea	ecx, DWORD PTR _cgival$[ebp]
	push	ecx
	mov	edx, DWORD PTR _cntxt$[ebp]
	push	edx
	call	_cgi_get_subfield
	add	esp, 28					; 0000001cH
	test	eax, eax
	je	SHORT $L72769
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 1850		; 0000073aH
	jmp	$eva_err$72771
$L72769:

; 1851 : 	if(!tbl->status) RETURN_OK;

	mov	ecx, DWORD PTR _tbl$[ebp]
	cmp	DWORD PTR [ecx+32], 0
	jne	SHORT $L72772
	jmp	SHORT $eva_noerr$72768
$L72772:

; 1852 : 
; 1853 : 	sprintf(status, "%d,%lu,%lu,%lu,%d,%lu,%lu,%du",
; 1854 : 		tbl->status, tbl->line, tbl->lines, tbl->sortcol, tbl->b_sortdesc, tbl->srchcol, tbl->ctrlline, tbl->srchmode);

	mov	edx, DWORD PTR _tbl$[ebp]
	mov	eax, DWORD PTR [edx+72]
	push	eax
	mov	ecx, DWORD PTR _tbl$[ebp]
	mov	edx, DWORD PTR [ecx+56]
	push	edx
	mov	eax, DWORD PTR _tbl$[ebp]
	mov	ecx, DWORD PTR [eax+124]
	push	ecx
	mov	edx, DWORD PTR _tbl$[ebp]
	mov	eax, DWORD PTR [edx+64]
	push	eax
	mov	ecx, DWORD PTR _tbl$[ebp]
	mov	edx, DWORD PTR [ecx+60]
	push	edx
	mov	eax, DWORD PTR _tbl$[ebp]
	mov	ecx, DWORD PTR [eax+44]
	push	ecx
	mov	edx, DWORD PTR _tbl$[ebp]
	mov	eax, DWORD PTR [edx+40]
	push	eax
	mov	ecx, DWORD PTR _tbl$[ebp]
	mov	edx, DWORD PTR [ecx+32]
	push	edx
	push	OFFSET FLAT:$SG72773
	lea	eax, DWORD PTR _status$[ebp]
	push	eax
	call	_sprintf
	add	esp, 40					; 00000028H

; 1855 : 	CTRL_PUT_CGI_SUBFIELD_VAL("STATUS", status, 0);

	push	0
	lea	ecx, DWORD PTR _status$[ebp]
	push	ecx
	push	OFFSET FLAT:$SG72775
	mov	edx, DWORD PTR _ctrl$[ebp]
	push	edx
	mov	eax, DWORD PTR _cntxt$[ebp]
	push	eax
	call	_cgi_put_subfield
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L72774
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 1855		; 0000073fH
	jmp	SHORT $eva_err$72771
$L72774:
$eva_noerr$72768:

; 1856 : 	RETURN_OK_CLEANUP;

	push	0
	push	OFFSET FLAT:$SG72776
	push	OFFSET FLAT:$SG72777
	mov	edx, DWORD PTR _cntxt$[ebp]
	push	edx
	call	_err_clear
	add	esp, 16					; 00000010H
$eva_err$72771:
	mov	eax, DWORD PTR _cntxt$[ebp]
	cmp	DWORD PTR [eax+29872], 0
	je	SHORT $L72778
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	edx, DWORD PTR [ecx+29900]
	push	edx
	push	OFFSET FLAT:$SG72779
	push	OFFSET FLAT:$SG72780
	mov	eax, DWORD PTR _cntxt$[ebp]
	push	eax
	call	_err_add_context
	add	esp, 16					; 00000010H
$L72778:
	lea	ecx, DWORD PTR _cgival$[ebp]
	push	ecx
	call	_dyntab_free
	add	esp, 4
	mov	edx, DWORD PTR _cntxt$[ebp]
	xor	eax, eax
	cmp	DWORD PTR [edx+29872], 0
	setne	al

; 1857 : }

	mov	esp, ebp
	pop	ebp
	ret	0
_table_put_status ENDP
_TEXT	ENDS
PUBLIC	_table_init_obj_list
EXTRN	_table_word_search:NEAR
EXTRN	_sql_exec_query:NEAR
EXTRN	_ctrl_add_value:NEAR
EXTRN	_ctrl_del_value:NEAR
EXTRN	_sql_get_table:NEAR
_BSS	SEGMENT
	ALIGN	4

$SG72800 DB	01H DUP (?)
	ALIGN	4

$SG72803 DB	01H DUP (?)
	ALIGN	4

$SG72849 DB	01H DUP (?)
	ALIGN	4

$SG72851 DB	01H DUP (?)
_BSS	ENDS
_DATA	SEGMENT
	ORG $+3
$SG72798 DB	'_EVA_INPUT', 00H
	ORG $+1
$SG72799 DB	'_EVA_NOTABLESORT', 00H
	ORG $+3
$SG72801 DB	'_EVA_FILTER_LISTOBJ', 00H
$SG72802 DB	'_EVA_FILTER_TYPE', 00H
	ORG $+3
$SG72806 DB	'_EVA_LISTOBJ', 00H
	ORG $+3
$SG72808 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG72812 DB	'_EVA_INPUT', 00H
	ORG $+1
$SG72816 DB	'_EVA_INPUT', 00H
	ORG $+1
$SG72821 DB	'D:\Travail\ABI\EVA\V4.0\CGI\Brunix-2016\table_utils.c', 00H
	ORG $+2
$SG72822 DB	'table_init_obj_list', 00H
$SG72825 DB	'No', 00H
	ORG $+1
$SG72830 DB	'SELECT DISTINCT IdObj FROM IdList', 00H
	ORG $+2
$SG72847 DB	'Unique', 00H
	ORG $+1
$SG72853 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG72856 DB	'D:\Travail\ABI\EVA\V4.0\CGI\Brunix-2016\table_utils.c', 00H
	ORG $+2
$SG72857 DB	'table_init_obj_list', 00H
$SG72859 DB	'D:\Travail\ABI\EVA\V4.0\CGI\Brunix-2016\table_utils.c', 00H
	ORG $+2
$SG72860 DB	'table_init_obj_list', 00H
_DATA	ENDS
_TEXT	SEGMENT
_cntxt$ = 8
_i_ctrl$ = 12
_selobj$ = 16
_form$ = -4
_ctrl$ = -16
_tbl$ = -8
_b_selobj$ = -12
_b_1val$72824 = -24
_i$72826 = -28
_c$72827 = -20
_num$72838 = -32
_b_found$72839 = -36
_c1$72843 = -40
_table_init_obj_list PROC NEAR

; 1871 : ){

	push	ebp
	mov	ebp, esp
	sub	esp, 56					; 00000038H

; 1872 : 	EVA_form *form = cntxt->form;

	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	ecx, DWORD PTR [eax+80]
	mov	DWORD PTR _form$[ebp], ecx

; 1873 : 	EVA_ctrl *ctrl = form->ctrl + i_ctrl;

	mov	edx, DWORD PTR _i_ctrl$[ebp]
	imul	edx, 480				; 000001e0H
	mov	eax, DWORD PTR _form$[ebp]
	mov	ecx, DWORD PTR [eax]
	add	ecx, edx
	mov	DWORD PTR _ctrl$[ebp], ecx

; 1874 : 	ObjTableFormat *tbl = ctrl->objtbl;

	mov	edx, DWORD PTR _ctrl$[ebp]
	mov	eax, DWORD PTR [edx+232]
	mov	DWORD PTR _tbl$[ebp], eax

; 1875 : 	int b_selobj = 0;

	mov	DWORD PTR _b_selobj$[ebp], 0

; 1876 : 
; 1877 : 	/* Set default table attributes	*/
; 1878 : 	if(tbl->b_ctrl) tbl->attr = &ctrl->attr;

	mov	ecx, DWORD PTR _tbl$[ebp]
	cmp	DWORD PTR [ecx+24], 0
	je	SHORT $L72795
	mov	edx, DWORD PTR _ctrl$[ebp]
	add	edx, 44					; 0000002cH
	mov	eax, DWORD PTR _tbl$[ebp]
	mov	DWORD PTR [eax], edx
$L72795:

; 1879 : 	if(!tbl->input) tbl->input = dyntab_val(&tbl->cgiinput, 0, 0);

	mov	ecx, DWORD PTR _tbl$[ebp]
	cmp	DWORD PTR [ecx+100], 0
	jne	SHORT $L72796
	push	0
	push	0
	mov	edx, DWORD PTR _tbl$[ebp]
	add	edx, 80					; 00000050H
	push	edx
	call	_dyntab_val
	add	esp, 12					; 0000000cH
	mov	ecx, DWORD PTR _tbl$[ebp]
	mov	DWORD PTR [ecx+100], eax
$L72796:

; 1880 : 
; 1881 : 
; 1882 : 	/* Handle unsorted list of objects */
; 1883 : 	if(strcmp(ctrl->CONTROL, "_EVA_INPUT") && *CTRL_ATTR_VAL(NOTABLESORT) == '1' && !strcmp(CTRL_ATTR_VAL(FILTER_TYPE), "_EVA_FILTER_LISTOBJ"))

	push	OFFSET FLAT:$SG72798
	mov	edx, DWORD PTR _ctrl$[ebp]
	mov	eax, DWORD PTR [edx+272]
	push	eax
	call	_strcmp
	add	esp, 8
	test	eax, eax
	je	$L72797
	cmp	DWORD PTR _ctrl$[ebp], 0
	je	SHORT $L73563
	push	0
	push	-1
	push	OFFSET FLAT:$SG72799
	mov	ecx, DWORD PTR _ctrl$[ebp]
	add	ecx, 44					; 0000002cH
	push	ecx
	call	_dyntab_field_val
	add	esp, 16					; 00000010H
	mov	DWORD PTR -44+[ebp], eax
	jmp	SHORT $L73564
$L73563:
	mov	DWORD PTR -44+[ebp], OFFSET FLAT:$SG72800
$L73564:
	mov	edx, DWORD PTR -44+[ebp]
	movsx	eax, BYTE PTR [edx]
	cmp	eax, 49					; 00000031H
	jne	$L72797
	cmp	DWORD PTR _ctrl$[ebp], 0
	je	SHORT $L73565
	push	0
	push	-1
	push	OFFSET FLAT:$SG72802
	mov	ecx, DWORD PTR _ctrl$[ebp]
	add	ecx, 44					; 0000002cH
	push	ecx
	call	_dyntab_field_val
	add	esp, 16					; 00000010H
	mov	DWORD PTR -48+[ebp], eax
	jmp	SHORT $L73566
$L73565:
	mov	DWORD PTR -48+[ebp], OFFSET FLAT:$SG72803
$L73566:
	push	OFFSET FLAT:$SG72801
	mov	edx, DWORD PTR -48+[ebp]
	push	edx
	call	_strcmp
	add	esp, 8
	test	eax, eax
	jne	SHORT $L72797

; 1885 : 		tbl->status &= ~(TblCtrl_opensearch | TblCtrl_search | TblCtrl_openaddnew | TblCtrl_addnew | TblCtrl_sel | TblCtrl_opensel | TblCtrl_sort);

	mov	eax, DWORD PTR _tbl$[ebp]
	mov	ecx, DWORD PTR [eax+32]
	and	ecx, -1010				; fffffc0eH
	mov	edx, DWORD PTR _tbl$[ebp]
	mov	DWORD PTR [edx+32], ecx

; 1886 : 		CTRL_ATTR(ctrl->val, LISTOBJ);

	mov	eax, DWORD PTR _ctrl$[ebp]
	add	eax, 64					; 00000040H
	push	eax
	call	_dyntab_free
	add	esp, 4
	push	0
	push	-1
	push	OFFSET FLAT:$SG72806
	mov	ecx, DWORD PTR _ctrl$[ebp]
	add	ecx, 44					; 0000002cH
	push	ecx
	push	0
	mov	edx, DWORD PTR _ctrl$[ebp]
	add	edx, 64					; 00000040H
	push	edx
	call	_dyntab_filter_field
	add	esp, 24					; 00000018H
	test	eax, eax
	je	SHORT $L72805
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29872], OFFSET FLAT:$SG72808
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 1886		; 0000075eH
	jmp	$eva_err$72809
$L72805:

; 1887 : 		b_selobj = 1;

	mov	DWORD PTR _b_selobj$[ebp], 1

; 1889 : 	/* Handle relation control selection status */
; 1890 : 	else if(!strcmp(ctrl->CONTROL, "_EVA_INPUT") && !(form->step == HtmlEdit && ctrl->access & AccessEdit))

	jmp	$L72817
$L72797:
	push	OFFSET FLAT:$SG72812
	mov	edx, DWORD PTR _ctrl$[ebp]
	mov	eax, DWORD PTR [edx+272]
	push	eax
	call	_strcmp
	add	esp, 8
	test	eax, eax
	jne	SHORT $L72811
	mov	ecx, DWORD PTR _form$[ebp]
	cmp	DWORD PTR [ecx+176], 4
	jne	SHORT $L72813
	mov	edx, DWORD PTR _ctrl$[ebp]
	mov	eax, DWORD PTR [edx+184]
	and	eax, 2
	test	eax, eax
	jne	SHORT $L72811
$L72813:

; 1892 : 		tbl->status &= ~(TblCtrl_opensearch | TblCtrl_search | TblCtrl_openaddnew | TblCtrl_addnew | TblCtrl_sel | TblCtrl_opensel);

	mov	ecx, DWORD PTR _tbl$[ebp]
	mov	edx, DWORD PTR [ecx+32]
	and	edx, -1009				; fffffc0fH
	mov	eax, DWORD PTR _tbl$[ebp]
	mov	DWORD PTR [eax+32], edx

; 1893 : 		b_selobj = 1;

	mov	DWORD PTR _b_selobj$[ebp], 1

; 1895 : 	else if(!strcmp(ctrl->CONTROL, "_EVA_INPUT") && strlen(tbl->input) < tbl->minsearchlen )

	jmp	SHORT $L72817
$L72811:
	push	OFFSET FLAT:$SG72816
	mov	ecx, DWORD PTR _ctrl$[ebp]
	mov	edx, DWORD PTR [ecx+272]
	push	edx
	call	_strcmp
	add	esp, 8
	test	eax, eax
	jne	SHORT $L72815
	mov	eax, DWORD PTR _tbl$[ebp]
	mov	ecx, DWORD PTR [eax+100]
	push	ecx
	call	_strlen
	add	esp, 4
	mov	edx, DWORD PTR _tbl$[ebp]
	cmp	eax, DWORD PTR [edx+76]
	jae	SHORT $L72815

; 1897 : 		b_selobj = 1;

	mov	DWORD PTR _b_selobj$[ebp], 1

; 1899 : 	else

	jmp	SHORT $L72817
$L72815:

; 1900 : 		b_selobj = tbl->status & TblCtrl_sel && !(tbl->status & TblCtrl_opensel);

	mov	eax, DWORD PTR _tbl$[ebp]
	mov	ecx, DWORD PTR [eax+32]
	and	ecx, 256				; 00000100H
	test	ecx, ecx
	je	SHORT $L73567
	mov	edx, DWORD PTR _tbl$[ebp]
	mov	eax, DWORD PTR [edx+32]
	and	eax, 512				; 00000200H
	test	eax, eax
	jne	SHORT $L73567
	mov	DWORD PTR -52+[ebp], 1
	jmp	SHORT $L73568
$L73567:
	mov	DWORD PTR -52+[ebp], 0
$L73568:
	mov	ecx, DWORD PTR -52+[ebp]
	mov	DWORD PTR _b_selobj$[ebp], ecx
$L72817:

; 1901 : 
; 1902 : 	/* Fetch list of objects to display */
; 1903 : 	dyntab_free(&tbl->idobj);

	mov	edx, DWORD PTR _tbl$[ebp]
	add	edx, 184				; 000000b8H
	push	edx
	call	_dyntab_free
	add	esp, 4

; 1904 : 	if(b_selobj)

	cmp	DWORD PTR _b_selobj$[ebp], 0
	je	SHORT $L72818

; 1905 : 		/* Selection mode : use control values */
; 1906 : 		tbl->totlines = ctrl->val.nbrows;

	mov	eax, DWORD PTR _tbl$[ebp]
	mov	ecx, DWORD PTR _ctrl$[ebp]
	mov	edx, DWORD PTR [ecx+64]
	mov	DWORD PTR [eax+52], edx

; 1907 : 	else

	jmp	$L72850
$L72818:

; 1909 : 		/* Search mode : execute search */
; 1910 : 		if(table_word_search(cntxt, i_ctrl)) CLEAR_ERROR;

	mov	eax, DWORD PTR _i_ctrl$[ebp]
	push	eax
	mov	ecx, DWORD PTR _cntxt$[ebp]
	push	ecx
	call	_table_word_search
	add	esp, 8
	test	eax, eax
	je	SHORT $L72820
	push	1910					; 00000776H
	push	OFFSET FLAT:$SG72821
	push	OFFSET FLAT:$SG72822
	mov	edx, DWORD PTR _cntxt$[ebp]
	push	edx
	call	_err_clear
	add	esp, 16					; 00000010H
$L72820:

; 1911 : 
; 1912 : 		/* Handle auto selection */
; 1913 : 		if((tbl->status & TblCtrl_opensel) && tbl->totlines == 1 && tbl->input && *tbl->input)

	mov	eax, DWORD PTR _tbl$[ebp]
	mov	ecx, DWORD PTR [eax+32]
	and	ecx, 512				; 00000200H
	test	ecx, ecx
	je	$L72850
	mov	edx, DWORD PTR _tbl$[ebp]
	cmp	DWORD PTR [edx+52], 1
	jne	$L72850
	mov	eax, DWORD PTR _tbl$[ebp]
	cmp	DWORD PTR [eax+100], 0
	je	$L72850
	mov	ecx, DWORD PTR _tbl$[ebp]
	mov	edx, DWORD PTR [ecx+100]
	movsx	eax, BYTE PTR [edx]
	test	eax, eax
	je	$L72850

; 1915 : 			/* Check if control allows multiple values */
; 1916 : 			int b_1val = !ctrl->MULTIPLE || !*ctrl->MULTIPLE || !strcmp("No", ctrl->MULTIPLE);

	mov	ecx, DWORD PTR _ctrl$[ebp]
	cmp	DWORD PTR [ecx+344], 0
	je	SHORT $L73569
	mov	edx, DWORD PTR _ctrl$[ebp]
	mov	eax, DWORD PTR [edx+344]
	movsx	ecx, BYTE PTR [eax]
	test	ecx, ecx
	je	SHORT $L73569
	mov	edx, DWORD PTR _ctrl$[ebp]
	mov	eax, DWORD PTR [edx+344]
	push	eax
	push	OFFSET FLAT:$SG72825
	call	_strcmp
	add	esp, 8
	test	eax, eax
	je	SHORT $L73569
	mov	DWORD PTR -56+[ebp], 0
	jmp	SHORT $L73570
$L73569:
	mov	DWORD PTR -56+[ebp], 1
$L73570:
	mov	ecx, DWORD PTR -56+[ebp]
	mov	DWORD PTR _b_1val$72824[ebp], ecx

; 1917 : 			unsigned long i;
; 1918 : 			DynTableCell *c;
; 1919 : 
; 1920 : 			/* Read found IdObj */
; 1921 : 			if(sql_exec_query(cntxt, "SELECT DISTINCT IdObj FROM IdList") ||
; 1922 : 				sql_get_table(cntxt, &tbl->idobj, 2)) STACK_ERROR;

	push	OFFSET FLAT:$SG72830
	mov	edx, DWORD PTR _cntxt$[ebp]
	push	edx
	call	_sql_exec_query
	add	esp, 8
	test	eax, eax
	jne	SHORT $L72829
	push	2
	mov	eax, DWORD PTR _tbl$[ebp]
	add	eax, 184				; 000000b8H
	push	eax
	mov	ecx, DWORD PTR _cntxt$[ebp]
	push	ecx
	call	_sql_get_table
	add	esp, 12					; 0000000cH
	test	eax, eax
	je	SHORT $L72828
$L72829:
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 1922		; 00000782H
	jmp	$eva_err$72809
$L72828:

; 1923 : 			c = tbl->idobj.cell;

	mov	eax, DWORD PTR _tbl$[ebp]
	mov	ecx, DWORD PTR [eax+200]
	mov	DWORD PTR _c$72827[ebp], ecx

; 1924 : 			if(c)

	cmp	DWORD PTR _c$72827[ebp], 0
	je	$L72848

; 1926 : 				/* If control does not allows multiple values */
; 1927 : 				if(b_1val)

	cmp	DWORD PTR _b_1val$72824[ebp], 0
	je	$L72832

; 1929 : 					/* Clear old values & set table status to closed search */
; 1930 : 					for(i = 0; i < ctrl->val.nbrows; i++) ctrl_del_value(cntxt, i_ctrl, i);

	mov	DWORD PTR _i$72826[ebp], 0
	jmp	SHORT $L72833
$L72834:
	mov	edx, DWORD PTR _i$72826[ebp]
	add	edx, 1
	mov	DWORD PTR _i$72826[ebp], edx
$L72833:
	mov	eax, DWORD PTR _ctrl$[ebp]
	mov	ecx, DWORD PTR _i$72826[ebp]
	cmp	ecx, DWORD PTR [eax+64]
	jae	SHORT $L72835
	mov	edx, DWORD PTR _i$72826[ebp]
	push	edx
	mov	eax, DWORD PTR _i_ctrl$[ebp]
	push	eax
	mov	ecx, DWORD PTR _cntxt$[ebp]
	push	ecx
	call	_ctrl_del_value
	add	esp, 12					; 0000000cH
	jmp	SHORT $L72834
$L72835:

; 1931 : 					tbl->status &= ~(TblCtrl_opensel | TblCtrl_opensearch);

	mov	edx, DWORD PTR _tbl$[ebp]
	mov	eax, DWORD PTR [edx+32]
	and	eax, -545				; fffffddfH
	mov	ecx, DWORD PTR _tbl$[ebp]
	mov	DWORD PTR [ecx+32], eax

; 1932 : 					tbl->ctrlline = 0;

	mov	edx, DWORD PTR _tbl$[ebp]
	mov	DWORD PTR [edx+56], 0

; 1933 : 					b_selobj = 1;

	mov	DWORD PTR _b_selobj$[ebp], 1

; 1934 : 
; 1935 : 					/* Add found object to control values */
; 1936 : 					if(ctrl_add_value(cntxt, i_ctrl, c->txt, c->len, 1, tbl->ctrlline, 1)) STACK_ERROR;

	push	1
	mov	eax, DWORD PTR _tbl$[ebp]
	mov	ecx, DWORD PTR [eax+56]
	push	ecx
	push	1
	mov	edx, DWORD PTR _c$72827[ebp]
	mov	eax, DWORD PTR [edx+4]
	push	eax
	mov	ecx, DWORD PTR _c$72827[ebp]
	mov	edx, DWORD PTR [ecx]
	push	edx
	mov	eax, DWORD PTR _i_ctrl$[ebp]
	push	eax
	mov	ecx, DWORD PTR _cntxt$[ebp]
	push	ecx
	call	_ctrl_add_value
	add	esp, 28					; 0000001cH
	test	eax, eax
	je	SHORT $L72836
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 1936		; 00000790H
	jmp	$eva_err$72809
$L72836:

; 1938 : 				else

	jmp	$L72848
$L72832:

; 1940 : 					/* Multiple values allowed : Search for found IdObj & max Num for the control line */
; 1941 : 					unsigned long num = 0;

	mov	DWORD PTR _num$72838[ebp], 0

; 1942 : 					int b_found = 0;

	mov	DWORD PTR _b_found$72839[ebp], 0

; 1943 :  					for(i = 0; i < ctrl->val.nbrows; i++)

	mov	DWORD PTR _i$72826[ebp], 0
	jmp	SHORT $L72840
$L72841:
	mov	eax, DWORD PTR _i$72826[ebp]
	add	eax, 1
	mov	DWORD PTR _i$72826[ebp], eax
$L72840:
	mov	ecx, DWORD PTR _ctrl$[ebp]
	mov	edx, DWORD PTR _i$72826[ebp]
	cmp	edx, DWORD PTR [ecx+64]
	jae	SHORT $L72842

; 1945 : 						DynTableCell *c1 = dyntab_cell(&ctrl->val, i, 0);

	push	0
	mov	eax, DWORD PTR _i$72826[ebp]
	push	eax
	mov	ecx, DWORD PTR _ctrl$[ebp]
	add	ecx, 64					; 00000040H
	push	ecx
	call	_dyntab_cell
	add	esp, 12					; 0000000cH
	mov	DWORD PTR _c1$72843[ebp], eax

; 1946 : 						b_found |= !strcmp(c->txt, c1->txt);

	mov	edx, DWORD PTR _c1$72843[ebp]
	mov	eax, DWORD PTR [edx]
	push	eax
	mov	ecx, DWORD PTR _c$72827[ebp]
	mov	edx, DWORD PTR [ecx]
	push	edx
	call	_strcmp
	add	esp, 8
	neg	eax
	sbb	eax, eax
	inc	eax
	mov	ecx, DWORD PTR _b_found$72839[ebp]
	or	ecx, eax
	mov	DWORD PTR _b_found$72839[ebp], ecx

; 1947 : 						if(c->Line == tbl->ctrlline && c->Num > num) num = c->Num;

	mov	edx, DWORD PTR _c$72827[ebp]
	mov	eax, DWORD PTR _tbl$[ebp]
	mov	ecx, DWORD PTR [edx+40]
	cmp	ecx, DWORD PTR [eax+56]
	jne	SHORT $L72844
	mov	edx, DWORD PTR _c$72827[ebp]
	mov	eax, DWORD PTR [edx+36]
	cmp	eax, DWORD PTR _num$72838[ebp]
	jbe	SHORT $L72844
	mov	ecx, DWORD PTR _c$72827[ebp]
	mov	edx, DWORD PTR [ecx+36]
	mov	DWORD PTR _num$72838[ebp], edx
$L72844:

; 1948 : 					}

	jmp	SHORT $L72841
$L72842:

; 1949 : 
; 1950 : 
; 1951 : 					/* If duplicates allowed or IdObj not in control values : add IdObj */
; 1952 : 					if(strcmp("Unique", ctrl->MULTIPLE) || !b_found)

	mov	eax, DWORD PTR _ctrl$[ebp]
	mov	ecx, DWORD PTR [eax+344]
	push	ecx
	push	OFFSET FLAT:$SG72847
	call	_strcmp
	add	esp, 8
	test	eax, eax
	jne	SHORT $L72846
	cmp	DWORD PTR _b_found$72839[ebp], 0
	jne	SHORT $L72848
$L72846:

; 1953 : 						if(ctrl_add_value(cntxt, i_ctrl, c->txt, c->len, num, tbl->ctrlline, 1)) STACK_ERROR;

	push	1
	mov	edx, DWORD PTR _tbl$[ebp]
	mov	eax, DWORD PTR [edx+56]
	push	eax
	mov	ecx, DWORD PTR _num$72838[ebp]
	push	ecx
	mov	edx, DWORD PTR _c$72827[ebp]
	mov	eax, DWORD PTR [edx+4]
	push	eax
	mov	ecx, DWORD PTR _c$72827[ebp]
	mov	edx, DWORD PTR [ecx]
	push	edx
	mov	eax, DWORD PTR _i_ctrl$[ebp]
	push	eax
	mov	ecx, DWORD PTR _cntxt$[ebp]
	push	ecx
	call	_ctrl_add_value
	add	esp, 28					; 0000001cH
	test	eax, eax
	je	SHORT $L72848
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 1953		; 000007a1H
	jmp	$eva_err$72809
$L72848:

; 1956 : 
; 1957 : 			/* Clear search string */
; 1958 : 			tbl->input = "";

	mov	eax, DWORD PTR _tbl$[ebp]
	mov	DWORD PTR [eax+100], OFFSET FLAT:$SG72849

; 1959 : 			cgi_value_setkeep(cntxt, &tbl->cgiinput, 0, 2);

	push	2
	push	0
	mov	ecx, DWORD PTR _tbl$[ebp]
	add	ecx, 80					; 00000050H
	push	ecx
	mov	edx, DWORD PTR _cntxt$[ebp]
	push	edx
	call	_cgi_value_setkeep
	add	esp, 16					; 00000010H

; 1960 : 			DYNTAB_SET(&tbl->cgiinput, 0, 0, "");

	push	0
	push	OFFSET FLAT:$SG72851
	push	0
	push	0
	mov	eax, DWORD PTR _tbl$[ebp]
	add	eax, 80					; 00000050H
	push	eax
	call	_dyntab_set_txt
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L72850
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29872], OFFSET FLAT:$SG72853
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 1960		; 000007a8H
	jmp	SHORT $eva_err$72809
$L72850:

; 1963 : 
; 1964 : 	if(selobj) *selobj = b_selobj;

	cmp	DWORD PTR _selobj$[ebp], 0
	je	SHORT $eva_noerr$72855
	mov	eax, DWORD PTR _selobj$[ebp]
	mov	ecx, DWORD PTR _b_selobj$[ebp]
	mov	DWORD PTR [eax], ecx
$eva_noerr$72855:

; 1965 : 	RETURN_OK_CLEANUP;

	push	0
	push	OFFSET FLAT:$SG72856
	push	OFFSET FLAT:$SG72857
	mov	edx, DWORD PTR _cntxt$[ebp]
	push	edx
	call	_err_clear
	add	esp, 16					; 00000010H
$eva_err$72809:
	mov	eax, DWORD PTR _cntxt$[ebp]
	cmp	DWORD PTR [eax+29872], 0
	je	SHORT $L72858
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	edx, DWORD PTR [ecx+29900]
	push	edx
	push	OFFSET FLAT:$SG72859
	push	OFFSET FLAT:$SG72860
	mov	eax, DWORD PTR _cntxt$[ebp]
	push	eax
	call	_err_add_context
	add	esp, 16					; 00000010H
$L72858:
	mov	ecx, DWORD PTR _cntxt$[ebp]
	xor	eax, eax
	cmp	DWORD PTR [ecx+29872], 0
	setne	al

; 1966 : }

	mov	esp, ebp
	pop	ebp
	ret	0
_table_init_obj_list ENDP
_TEXT	ENDS
PUBLIC	_table_sort_obj_list
EXTRN	_table_read_obj_list:NEAR
EXTRN	_table_prepare_rows:NEAR
EXTRN	_remove:NEAR
EXTRN	_rename:NEAR
EXTRN	_file_write_tabrc:NEAR
EXTRN	_chdir_user_doc:NEAR
EXTRN	_file_compatible_name:NEAR
EXTRN	_file_output_link:NEAR
EXTRN	_system:NEAR
EXTRN	_getcwd:NEAR
EXTRN	__chkstk:NEAR
_BSS	SEGMENT
	ALIGN	4

$SG72878 DB	01H DUP (?)
	ALIGN	4

$SG72901 DB	01H DUP (?)
_BSS	ENDS
_DATA	SEGMENT
$SG72880 DB	'EXCEL', 00H
	ORG $+2
$SG72882 DB	'xls', 00H
$SG72883 DB	'doc', 00H
$SG72885 DB	'EXCEL', 00H
	ORG $+2
$SG72886 DB	'WINWORD', 00H
$SG72903 DB	'dump.txt', 00H
	ORG $+3
$SG72906 DB	'Fields', 00H
	ORG $+1
$SG72908 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG72910 DB	'Formats', 00H
$SG72912 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG72914 DB	'Fixed', 00H
	ORG $+2
$SG72916 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG72921 DB	'_EVA_RELATION_BTN0', 00H
	ORG $+1
$SG72924 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG72927 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG72929 DB	'0', 00H
	ORG $+2
$SG72931 DB	'X', 00H
	ORG $+2
$SG72933 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG72935 DB	'dumpfmt.txt', 00H
$SG72936 DB	'copy %stemplates\TableList.%s %s > msg.txt 2>err.txt', 00H
	ORG $+3
$SG72937 DB	'call "%s\Office\%s.EXE" %s\TableList.%s', 00H
$SG72938 DB	'dump.txt', 00H
	ORG $+3
$SG72939 DB	'dumpfmt.txt', 00H
$SG72940 DB	'TableList.xls', 00H
	ORG $+2
$SG72941 DB	'err.txt', 00H
$SG72942 DB	'msg.txt', 00H
$SG72950 DB	'%s %s', 00H
	ORG $+2
$SG72951 DB	'%s', 00H
	ORG $+1
$SG72952 DB	'%s.%s', 00H
	ORG $+2
$SG72953 DB	'List.xls', 00H
	ORG $+3
$SG72954 DB	'TableList.doc', 00H
	ORG $+2
$SG72956 DB	']</b><hr>', 00H
	ORG $+2
$SG72957 DB	'<font face=Arial><center><hr><b>Contenu de [', 00H
	ORG $+3
$SG72959 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG72963 DB	'#user', 00H
	ORG $+2
$SG72964 DB	'Excel', 00H
	ORG $+2
$SG72965 DB	'Word', 00H
	ORG $+3
$SG72966 DB	'Fichier %s : ', 00H
	ORG $+2
$SG72969 DB	'</center></font><br>', 00H
	ORG $+3
$SG72971 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG72972 DB	'D:\Travail\ABI\EVA\V4.0\CGI\Brunix-2016\table_utils.c', 00H
	ORG $+2
$SG72973 DB	'table_export_list', 00H
	ORG $+2
$SG72975 DB	'D:\Travail\ABI\EVA\V4.0\CGI\Brunix-2016\table_utils.c', 00H
	ORG $+2
$SG72976 DB	'table_export_list', 00H
_DATA	ENDS
_TEXT	SEGMENT
_cntxt$ = 8
_i_ctrl$ = 12
_form$ = -4104
_ctrl$ = -12336
_tbl$ = -4108
_label$ = -8224
_step$ = -12332
_b_selobj$ = -4116
_i$ = -8220
_btn$ = -4112
_b_xl$ = -8216
_ext$ = -12320
_exe$ = -12328
_name$ = -12316
_sz_name$ = -4100
_fname$ = -4096
_sz_fname$ = -12324
_cmd$ = -16432
_cwd$ = -8212
_table_export_list PROC NEAR

; 1980 : ){

	push	ebp
	mov	ebp, esp
	mov	eax, 16460				; 0000404cH
	call	__chkstk
	push	edi

; 1981 : 	EVA_form *form = cntxt->form;

	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	ecx, DWORD PTR [eax+80]
	mov	DWORD PTR _form$[ebp], ecx

; 1982 : 	EVA_ctrl *ctrl = form->ctrl + i_ctrl;

	mov	edx, DWORD PTR _i_ctrl$[ebp]
	imul	edx, 480				; 000001e0H
	mov	eax, DWORD PTR _form$[ebp]
	mov	ecx, DWORD PTR [eax]
	add	ecx, edx
	mov	DWORD PTR _ctrl$[ebp], ecx

; 1983 : 	ObjTableFormat *tbl = ctrl->objtbl;

	mov	edx, DWORD PTR _ctrl$[ebp]
	mov	eax, DWORD PTR [edx+232]
	mov	DWORD PTR _tbl$[ebp], eax

; 1984 : 	DynBuffer *label = NULL;

	mov	DWORD PTR _label$[ebp], 0

; 1985 : 	int step = form->step;

	mov	ecx, DWORD PTR _form$[ebp]
	mov	edx, DWORD PTR [ecx+176]
	mov	DWORD PTR _step$[ebp], edx

; 1986 : 	int b_selobj = 0;

	mov	DWORD PTR _b_selobj$[ebp], 0

; 1987 : 	unsigned long i;
; 1988 : 	char *btn = CGI_CLICK_BTN_SUBFIELD;

	mov	eax, DWORD PTR _cntxt$[ebp]
	cmp	DWORD PTR [eax+29648], 0
	je	SHORT $L73572
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	edx, DWORD PTR [ecx+29656]
	imul	edx, 56					; 00000038H
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	ecx, DWORD PTR [eax+29648]
	mov	edx, DWORD PTR [ecx+edx]
	movsx	eax, BYTE PTR [edx]
	cmp	eax, 66					; 00000042H
	jne	SHORT $L73572
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	edx, DWORD PTR [ecx+29656]
	imul	edx, 56					; 00000038H
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	ecx, DWORD PTR [eax+29648]
	cmp	DWORD PTR [ecx+edx+32], 0
	je	SHORT $L73572
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	eax, DWORD PTR [edx+29656]
	imul	eax, 56					; 00000038H
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	edx, DWORD PTR [ecx+29648]
	mov	eax, DWORD PTR [edx+eax+32]
	mov	DWORD PTR -16436+[ebp], eax
	jmp	SHORT $L73573
$L73572:
	mov	DWORD PTR -16436+[ebp], OFFSET FLAT:$SG72878
$L73573:
	mov	ecx, DWORD PTR -16436+[ebp]
	mov	DWORD PTR _btn$[ebp], ecx

; 1989 : 	int b_xl = strstr(btn, "EXCEL") ? 1 : 0;

	push	OFFSET FLAT:$SG72880
	mov	edx, DWORD PTR _btn$[ebp]
	push	edx
	call	_strstr
	add	esp, 8
	neg	eax
	sbb	eax, eax
	neg	eax
	mov	DWORD PTR _b_xl$[ebp], eax

; 1990 : 	char *ext = b_xl ? "xls" : "doc";

	cmp	DWORD PTR _b_xl$[ebp], 0
	je	SHORT $L73574
	mov	DWORD PTR -16440+[ebp], OFFSET FLAT:$SG72882
	jmp	SHORT $L73575
$L73574:
	mov	DWORD PTR -16440+[ebp], OFFSET FLAT:$SG72883
$L73575:
	mov	eax, DWORD PTR -16440+[ebp]
	mov	DWORD PTR _ext$[ebp], eax

; 1991 : 	char *exe = b_xl ? "EXCEL" : "WINWORD";

	cmp	DWORD PTR _b_xl$[ebp], 0
	je	SHORT $L73576
	mov	DWORD PTR -16444+[ebp], OFFSET FLAT:$SG72885
	jmp	SHORT $L73577
$L73576:
	mov	DWORD PTR -16444+[ebp], OFFSET FLAT:$SG72886
$L73577:
	mov	ecx, DWORD PTR -16444+[ebp]
	mov	DWORD PTR _exe$[ebp], ecx

; 1992 : 	char name[4090] = {0}; size_t sz_name;

	mov	BYTE PTR _name$[ebp], 0
	mov	ecx, 1022				; 000003feH
	xor	eax, eax
	lea	edi, DWORD PTR _name$[ebp+1]
	rep stosd
	stosb

; 1993 : 	char fname[4096] = {0}; size_t sz_fname;

	mov	BYTE PTR _fname$[ebp], 0
	mov	ecx, 1023				; 000003ffH
	xor	eax, eax
	lea	edi, DWORD PTR _fname$[ebp+1]
	rep stosd
	stosw
	stosb

; 1994 : 	char cmd[4096];
; 1995 : 	char cwd[4096];
; 1996 : 	if(!tbl) RETURN_OK;

	cmp	DWORD PTR _tbl$[ebp], 0
	jne	SHORT $L72893
	jmp	$eva_noerr$72894
$L72893:

; 1997 : 
; 1998 : 	/* Set temp directory for user */
; 1999 : 	if(chdir_user_doc(cntxt)) STACK_ERROR;

	mov	edx, DWORD PTR _cntxt$[ebp]
	push	edx
	call	_chdir_user_doc
	add	esp, 4
	test	eax, eax
	je	SHORT $L72895
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 1999		; 000007cfH
	jmp	$eva_err$72896
$L72895:

; 2000 : 	getcwd(add_sz_str(cwd));

	push	4095					; 00000fffH
	lea	ecx, DWORD PTR _cwd$[ebp]
	push	ecx
	call	_getcwd
	add	esp, 8

; 2001 : 
; 2002 : 	/* Prepare text file with table data */
; 2003 : 	form->step = form->prevstep;

	mov	edx, DWORD PTR _form$[ebp]
	mov	eax, DWORD PTR _form$[ebp]
	mov	ecx, DWORD PTR [eax+168]
	mov	DWORD PTR [edx+176], ecx

; 2004 : 	if(table_init_obj_list(cntxt, i_ctrl, &b_selobj)) STACK_ERROR;

	lea	edx, DWORD PTR _b_selobj$[ebp]
	push	edx
	mov	eax, DWORD PTR _i_ctrl$[ebp]
	push	eax
	mov	ecx, DWORD PTR _cntxt$[ebp]
	push	ecx
	call	_table_init_obj_list
	add	esp, 12					; 0000000cH
	test	eax, eax
	je	SHORT $L72897
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 2004		; 000007d4H
	jmp	$eva_err$72896
$L72897:

; 2005 : 	tbl->line = 0;

	mov	eax, DWORD PTR _tbl$[ebp]
	mov	DWORD PTR [eax+40], 0

; 2006 : 	tbl->lines = b_xl ? 65000 : tbl->totlines;

	cmp	DWORD PTR _b_xl$[ebp], 0
	je	SHORT $L73578
	mov	DWORD PTR -16448+[ebp], 65000		; 0000fde8H
	jmp	SHORT $L73579
$L73578:
	mov	ecx, DWORD PTR _tbl$[ebp]
	mov	edx, DWORD PTR [ecx+52]
	mov	DWORD PTR -16448+[ebp], edx
$L73579:
	mov	eax, DWORD PTR _tbl$[ebp]
	mov	ecx, DWORD PTR -16448+[ebp]
	mov	DWORD PTR [eax+44], ecx

; 2007 : 	if(table_sort_obj_list(cntxt, i_ctrl, b_selobj)) STACK_ERROR;

	mov	edx, DWORD PTR _b_selobj$[ebp]
	push	edx
	mov	eax, DWORD PTR _i_ctrl$[ebp]
	push	eax
	mov	ecx, DWORD PTR _cntxt$[ebp]
	push	ecx
	call	_table_sort_obj_list
	add	esp, 12					; 0000000cH
	test	eax, eax
	je	SHORT $L72898
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 2007		; 000007d7H
	jmp	$eva_err$72896
$L72898:

; 2008 : 	if(table_read_obj_list(cntxt, i_ctrl, b_selobj)) STACK_ERROR;

	mov	eax, DWORD PTR _b_selobj$[ebp]
	push	eax
	mov	ecx, DWORD PTR _i_ctrl$[ebp]
	push	ecx
	mov	edx, DWORD PTR _cntxt$[ebp]
	push	edx
	call	_table_read_obj_list
	add	esp, 12					; 0000000cH
	test	eax, eax
	je	SHORT $L72899
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 2008		; 000007d8H
	jmp	$eva_err$72896
$L72899:

; 2009 : 	if(table_prepare_rows(cntxt, i_ctrl, "")) STACK_ERROR;

	push	OFFSET FLAT:$SG72901
	mov	ecx, DWORD PTR _i_ctrl$[ebp]
	push	ecx
	mov	edx, DWORD PTR _cntxt$[ebp]
	push	edx
	call	_table_prepare_rows
	add	esp, 12					; 0000000cH
	test	eax, eax
	je	SHORT $L72900
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 2009		; 000007d9H
	jmp	$eva_err$72896
$L72900:

; 2010 : 	if(file_write_tabrc(cntxt, &tbl->cellval, "dump.txt")) STACK_ERROR;

	push	OFFSET FLAT:$SG72903
	mov	ecx, DWORD PTR _tbl$[ebp]
	add	ecx, 240				; 000000f0H
	push	ecx
	mov	edx, DWORD PTR _cntxt$[ebp]
	push	edx
	call	_file_write_tabrc
	add	esp, 12					; 0000000cH
	test	eax, eax
	je	SHORT $L72902
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 2010		; 000007daH
	jmp	$eva_err$72896
$L72902:

; 2011 : 
; 2012 : 	/* Prepare output format file */
; 2013 : 	if(b_xl)

	cmp	DWORD PTR _b_xl$[ebp], 0
	je	$L72934

; 2015 : 		dyntab_free(&tbl->cellval);

	mov	ecx, DWORD PTR _tbl$[ebp]
	add	ecx, 240				; 000000f0H
	push	ecx
	call	_dyntab_free
	add	esp, 4

; 2016 : 		DYNTAB_SET(&tbl->cellval, 0, 0, "Fields");

	push	6
	push	OFFSET FLAT:$SG72906
	push	0
	push	0
	mov	edx, DWORD PTR _tbl$[ebp]
	add	edx, 240				; 000000f0H
	push	edx
	call	_dyntab_set_txt
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L72905
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29872], OFFSET FLAT:$SG72908
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 2016		; 000007e0H
	jmp	$eva_err$72896
$L72905:

; 2017 : 		DYNTAB_SET(&tbl->cellval, 1, 0, "Formats");

	push	7
	push	OFFSET FLAT:$SG72910
	push	0
	push	1
	mov	edx, DWORD PTR _tbl$[ebp]
	add	edx, 240				; 000000f0H
	push	edx
	call	_dyntab_set_txt
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L72909
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29872], OFFSET FLAT:$SG72912
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 2017		; 000007e1H
	jmp	$eva_err$72896
$L72909:

; 2018 : 		DYNTAB_SET(&tbl->cellval, 2, 0, "Fixed");

	push	5
	push	OFFSET FLAT:$SG72914
	push	0
	push	2
	mov	edx, DWORD PTR _tbl$[ebp]
	add	edx, 240				; 000000f0H
	push	edx
	call	_dyntab_set_txt
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L72913
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29872], OFFSET FLAT:$SG72916
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 2018		; 000007e2H
	jmp	$eva_err$72896
$L72913:

; 2019 : 		for(i = 0; i < tbl->field.nbrows; i++)

	mov	DWORD PTR _i$[ebp], 0
	jmp	SHORT $L72917
$L72918:
	mov	edx, DWORD PTR _i$[ebp]
	add	edx, 1
	mov	DWORD PTR _i$[ebp], edx
$L72917:
	mov	eax, DWORD PTR _tbl$[ebp]
	mov	ecx, DWORD PTR _i$[ebp]
	cmp	ecx, DWORD PTR [eax+380]
	jae	$L72919

; 2021 : 			if(!strcmp("_EVA_RELATION_BTN0", dyntab_val(&tbl->format, i, 0))) continue;

	push	0
	mov	edx, DWORD PTR _i$[ebp]
	push	edx
	mov	eax, DWORD PTR _tbl$[ebp]
	add	eax, 400				; 00000190H
	push	eax
	call	_dyntab_val
	add	esp, 12					; 0000000cH
	push	eax
	push	OFFSET FLAT:$SG72921
	call	_strcmp
	add	esp, 8
	test	eax, eax
	jne	SHORT $L72920
	jmp	SHORT $L72918
$L72920:

; 2022 : 			DYNTAB_SET_CELL(&tbl->cellval, 0, i + 1, &tbl->field, i, 0);

	push	0
	push	0
	mov	ecx, DWORD PTR _i$[ebp]
	push	ecx
	mov	edx, DWORD PTR _tbl$[ebp]
	add	edx, 380				; 0000017cH
	push	edx
	call	_dyntab_cell
	add	esp, 12					; 0000000cH
	push	eax
	mov	eax, DWORD PTR _i$[ebp]
	add	eax, 1
	push	eax
	push	0
	mov	ecx, DWORD PTR _tbl$[ebp]
	add	ecx, 240				; 000000f0H
	push	ecx
	call	_dyntab_copy
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L72922
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29872], OFFSET FLAT:$SG72924
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 2022		; 000007e6H
	jmp	$eva_err$72896
$L72922:

; 2023 : 			DYNTAB_SET_CELL(&tbl->cellval, 1, i + 1, &tbl->format, i, 0);

	push	0
	push	0
	mov	ecx, DWORD PTR _i$[ebp]
	push	ecx
	mov	edx, DWORD PTR _tbl$[ebp]
	add	edx, 400				; 00000190H
	push	edx
	call	_dyntab_cell
	add	esp, 12					; 0000000cH
	push	eax
	mov	eax, DWORD PTR _i$[ebp]
	add	eax, 1
	push	eax
	push	1
	mov	ecx, DWORD PTR _tbl$[ebp]
	add	ecx, 240				; 000000f0H
	push	ecx
	call	_dyntab_copy
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L72925
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29872], OFFSET FLAT:$SG72927
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 2023		; 000007e7H
	jmp	$eva_err$72896
$L72925:

; 2024 : 			if(!strcmp("0", dyntab_val(&tbl->strip, i, 0))) DYNTAB_SET(&tbl->cellval, 2, i + 1, "X");

	push	0
	mov	ecx, DWORD PTR _i$[ebp]
	push	ecx
	mov	edx, DWORD PTR _tbl$[ebp]
	add	edx, 500				; 000001f4H
	push	edx
	call	_dyntab_val
	add	esp, 12					; 0000000cH
	push	eax
	push	OFFSET FLAT:$SG72929
	call	_strcmp
	add	esp, 8
	test	eax, eax
	jne	SHORT $L72930
	push	1
	push	OFFSET FLAT:$SG72931
	mov	eax, DWORD PTR _i$[ebp]
	add	eax, 1
	push	eax
	push	2
	mov	ecx, DWORD PTR _tbl$[ebp]
	add	ecx, 240				; 000000f0H
	push	ecx
	call	_dyntab_set_txt
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L72930
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29872], OFFSET FLAT:$SG72933
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 2024		; 000007e8H
	jmp	$eva_err$72896
$L72930:

; 2025 : 		}

	jmp	$L72918
$L72919:

; 2026 : 		if(file_write_tabrc(cntxt, &tbl->cellval, "dumpfmt.txt")) STACK_ERROR;

	push	OFFSET FLAT:$SG72935
	mov	ecx, DWORD PTR _tbl$[ebp]
	add	ecx, 240				; 000000f0H
	push	ecx
	mov	edx, DWORD PTR _cntxt$[ebp]
	push	edx
	call	_file_write_tabrc
	add	esp, 12					; 0000000cH
	test	eax, eax
	je	SHORT $L72934
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 2026		; 000007eaH
	jmp	$eva_err$72896
$L72934:

; 2028 : 
; 2029 : 	/* Copy & launch template */
; 2030 : 	snprintf(add_sz_str(cmd), "copy %stemplates\\TableList.%s %s > msg.txt 2>err.txt", cntxt->rootdir , ext, cwd);

	lea	ecx, DWORD PTR _cwd$[ebp]
	push	ecx
	mov	edx, DWORD PTR _ext$[ebp]
	push	edx
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	ecx, DWORD PTR [eax+29724]
	push	ecx
	push	OFFSET FLAT:$SG72936
	push	4095					; 00000fffH
	lea	edx, DWORD PTR _cmd$[ebp]
	push	edx
	call	__snprintf
	add	esp, 24					; 00000018H

; 2031 : 	system(cmd);

	lea	eax, DWORD PTR _cmd$[ebp]
	push	eax
	call	_system
	add	esp, 4

; 2032 : 	snprintf(add_sz_str(cmd), "call \"%s\\Office\\%s.EXE\" %s\\TableList.%s", dyntab_val(&cntxt->cnf_server, 0, 0), exe, cwd, ext);

	mov	ecx, DWORD PTR _ext$[ebp]
	push	ecx
	lea	edx, DWORD PTR _cwd$[ebp]
	push	edx
	mov	eax, DWORD PTR _exe$[ebp]
	push	eax
	push	0
	push	0
	mov	ecx, DWORD PTR _cntxt$[ebp]
	add	ecx, 29380				; 000072c4H
	push	ecx
	call	_dyntab_val
	add	esp, 12					; 0000000cH
	push	eax
	push	OFFSET FLAT:$SG72937
	push	4095					; 00000fffH
	lea	edx, DWORD PTR _cmd$[ebp]
	push	edx
	call	__snprintf
	add	esp, 28					; 0000001cH

; 2033 : 	system(cmd);

	lea	eax, DWORD PTR _cmd$[ebp]
	push	eax
	call	_system
	add	esp, 4

; 2034 : 
; 2035 : 	/* Clear temp files */
; 2036 : 	remove("dump.txt");

	push	OFFSET FLAT:$SG72938
	call	_remove
	add	esp, 4

; 2037 : 	remove("dumpfmt.txt");

	push	OFFSET FLAT:$SG72939
	call	_remove
	add	esp, 4

; 2038 : 	remove("TableList.xls");

	push	OFFSET FLAT:$SG72940
	call	_remove
	add	esp, 4

; 2039 : 	remove("err.txt");

	push	OFFSET FLAT:$SG72941
	call	_remove
	add	esp, 4

; 2040 : 	remove("msg.txt");

	push	OFFSET FLAT:$SG72942
	call	_remove
	add	esp, 4

; 2041 : 
; 2042 : 	/* Build destination file name */
; 2043 : 	qry_obj_label(cntxt, NULL, NULL, NULL, &label, NULL, NULL, NULL, NULL, 0, &form->objdata, 0);

	push	0
	mov	ecx, DWORD PTR _form$[ebp]
	add	ecx, 52					; 00000034H
	push	ecx
	push	0
	push	0
	push	0
	push	0
	push	0
	lea	edx, DWORD PTR _label$[ebp]
	push	edx
	push	0
	push	0
	push	0
	mov	eax, DWORD PTR _cntxt$[ebp]
	push	eax
	call	_qry_obj_label
	add	esp, 48					; 00000030H

; 2044 : 	sz_name = label ?
; 2045 : 		snprintf(add_sz_str(name), "%s %s", ctrl->LABEL, label->data) :
; 2046 : 		snprintf(add_sz_str(name), "%s", ctrl->LABEL);

	cmp	DWORD PTR _label$[ebp], 0
	je	SHORT $L73580
	mov	ecx, DWORD PTR _label$[ebp]
	add	ecx, 8
	push	ecx
	mov	edx, DWORD PTR _ctrl$[ebp]
	mov	eax, DWORD PTR [edx+284]
	push	eax
	push	OFFSET FLAT:$SG72950
	push	4089					; 00000ff9H
	lea	ecx, DWORD PTR _name$[ebp]
	push	ecx
	call	__snprintf
	add	esp, 20					; 00000014H
	mov	DWORD PTR -16452+[ebp], eax
	jmp	SHORT $L73581
$L73580:
	mov	edx, DWORD PTR _ctrl$[ebp]
	mov	eax, DWORD PTR [edx+284]
	push	eax
	push	OFFSET FLAT:$SG72951
	push	4089					; 00000ff9H
	lea	ecx, DWORD PTR _name$[ebp]
	push	ecx
	call	__snprintf
	add	esp, 16					; 00000010H
	mov	DWORD PTR -16452+[ebp], eax
$L73581:
	mov	edx, DWORD PTR -16452+[ebp]
	mov	DWORD PTR _sz_name$[ebp], edx

; 2047 : 	snprintf(add_sz_str(fname), "%s.%s", name, ext);

	mov	eax, DWORD PTR _ext$[ebp]
	push	eax
	lea	ecx, DWORD PTR _name$[ebp]
	push	ecx
	push	OFFSET FLAT:$SG72952
	push	4095					; 00000fffH
	lea	edx, DWORD PTR _fname$[ebp]
	push	edx
	call	__snprintf
	add	esp, 20					; 00000014H

; 2048 : 	sz_fname = file_compatible_name(fname);

	lea	eax, DWORD PTR _fname$[ebp]
	push	eax
	call	_file_compatible_name
	add	esp, 4
	mov	DWORD PTR _sz_fname$[ebp], eax

; 2049 : 	remove(fname);

	lea	ecx, DWORD PTR _fname$[ebp]
	push	ecx
	call	_remove
	add	esp, 4

; 2050 : 	rename(b_xl ? "List.xls" : "TableList.doc", fname);

	cmp	DWORD PTR _b_xl$[ebp], 0
	je	SHORT $L73582
	mov	DWORD PTR -16456+[ebp], OFFSET FLAT:$SG72953
	jmp	SHORT $L73583
$L73582:
	mov	DWORD PTR -16456+[ebp], OFFSET FLAT:$SG72954
$L73583:
	lea	edx, DWORD PTR _fname$[ebp]
	push	edx
	mov	eax, DWORD PTR -16456+[ebp]
	push	eax
	call	_rename
	add	esp, 8

; 2054 : 		"<font face=Arial><center><hr>"
; 2055 : 		"<b>Contenu de [", name, sz_name, TO_HTML, "]</b><hr>");

	push	9
	push	OFFSET FLAT:$SG72956
	push	1
	push	OFFSET FLAT:_plain_to_html
	mov	ecx, DWORD PTR _sz_name$[ebp]
	push	ecx
	lea	edx, DWORD PTR _name$[ebp]
	push	edx
	push	44					; 0000002cH
	push	OFFSET FLAT:$SG72957
	mov	eax, DWORD PTR _cntxt$[ebp]
	add	eax, 29784				; 00007458H
	push	eax
	call	_dynbuf_add3
	add	esp, 36					; 00000024H
	test	eax, eax
	je	SHORT $L72955
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29872], OFFSET FLAT:$SG72959
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 2055		; 00000807H
	jmp	$eva_err$72896
$L72955:

; 2056 : 
; 2057 : 	/* Output link to file */
; 2058 : 	if(file_output_link(cntxt, &cntxt->html,
; 2059 : 				cmd, snprintf(add_sz_str(cmd), "Fichier %s : ", b_xl ? "Excel" : "Word"),
; 2060 : 				name, sz_name, fname, sz_fname, "#user", NULL, 0, NULL, 0,
; 2061 : 				7 | (form->b_modified ? 0 : 8))) STACK_ERROR;

	cmp	DWORD PTR _b_xl$[ebp], 0
	je	SHORT $L73584
	mov	DWORD PTR -16460+[ebp], OFFSET FLAT:$SG72964
	jmp	SHORT $L73585
$L73584:
	mov	DWORD PTR -16460+[ebp], OFFSET FLAT:$SG72965
$L73585:
	mov	eax, DWORD PTR _form$[ebp]
	mov	ecx, DWORD PTR [eax+128]
	neg	ecx
	sbb	ecx, ecx
	and	ecx, -8					; fffffff8H
	add	ecx, 8
	or	ecx, 7
	push	ecx
	push	0
	push	0
	push	0
	push	0
	push	OFFSET FLAT:$SG72963
	mov	edx, DWORD PTR _sz_fname$[ebp]
	push	edx
	lea	eax, DWORD PTR _fname$[ebp]
	push	eax
	mov	ecx, DWORD PTR _sz_name$[ebp]
	push	ecx
	lea	edx, DWORD PTR _name$[ebp]
	push	edx
	mov	eax, DWORD PTR -16460+[ebp]
	push	eax
	push	OFFSET FLAT:$SG72966
	push	4095					; 00000fffH
	lea	ecx, DWORD PTR _cmd$[ebp]
	push	ecx
	call	__snprintf
	add	esp, 16					; 00000010H
	push	eax
	lea	edx, DWORD PTR _cmd$[ebp]
	push	edx
	mov	eax, DWORD PTR _cntxt$[ebp]
	add	eax, 29784				; 00007458H
	push	eax
	mov	ecx, DWORD PTR _cntxt$[ebp]
	push	ecx
	call	_file_output_link
	add	esp, 56					; 00000038H
	test	eax, eax
	je	SHORT $L72962
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 2061		; 0000080dH
	jmp	SHORT $eva_err$72896
$L72962:

; 2062 : 
; 2063 : 	DYNBUF_ADD_STR(&cntxt->html, "</center></font><br>");

	push	0
	push	0
	push	20					; 00000014H
	push	OFFSET FLAT:$SG72969
	mov	eax, DWORD PTR _cntxt$[ebp]
	add	eax, 29784				; 00007458H
	push	eax
	call	_dynbuf_add
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L72968
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29872], OFFSET FLAT:$SG72971
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 2063		; 0000080fH
	jmp	SHORT $eva_err$72896
$L72968:

; 2064 : 	cntxt->b_terminate = 15;

	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29776], 15		; 0000000fH
$eva_noerr$72894:

; 2065 : 
; 2066 : 	RETURN_OK_CLEANUP;

	push	0
	push	OFFSET FLAT:$SG72972
	push	OFFSET FLAT:$SG72973
	mov	ecx, DWORD PTR _cntxt$[ebp]
	push	ecx
	call	_err_clear
	add	esp, 16					; 00000010H
$eva_err$72896:
	mov	edx, DWORD PTR _cntxt$[ebp]
	cmp	DWORD PTR [edx+29872], 0
	je	SHORT $L72974
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	ecx, DWORD PTR [eax+29900]
	push	ecx
	push	OFFSET FLAT:$SG72975
	push	OFFSET FLAT:$SG72976
	mov	edx, DWORD PTR _cntxt$[ebp]
	push	edx
	call	_err_add_context
	add	esp, 16					; 00000010H
$L72974:
	mov	eax, DWORD PTR _label$[ebp]
	push	eax
	call	_mem_free
	add	esp, 4
	mov	DWORD PTR _label$[ebp], 0
	mov	ecx, DWORD PTR _form$[ebp]
	mov	edx, DWORD PTR _step$[ebp]
	mov	DWORD PTR [ecx+176], edx
	mov	eax, DWORD PTR _cntxt$[ebp]
	xor	ecx, ecx
	cmp	DWORD PTR [eax+29872], 0
	setne	cl
	mov	eax, ecx

; 2067 : }

	pop	edi
	mov	esp, ebp
	pop	ebp
	ret	0
_table_export_list ENDP
_TEXT	ENDS
EXTRN	_qsort_col0i:NEAR
EXTRN	_qsort_col0idesc:NEAR
EXTRN	_qsort_col0desc:NEAR
EXTRN	_qsort_col0:NEAR
EXTRN	_setcase:NEAR
EXTRN	_qry_values_list:NEAR
EXTRN	_dyntab_resize:NEAR
EXTRN	_sql_get_listcol:NEAR
EXTRN	_memcpy:NEAR
EXTRN	_memset:NEAR
EXTRN	_qry_eval_sqlexpr_var:NEAR
EXTRN	_dyntab_from_tab:NEAR
EXTRN	_qry_eval_sql_fieldexpr:NEAR
EXTRN	_qry_build_free:NEAR
EXTRN	_qry_parse_fieldexpr:NEAR
_BSS	SEGMENT
	ALIGN	4

$SG73105 DB	01H DUP (?)
_BSS	ENDS
_DATA	SEGMENT
	ORG $+2
$SG72999 DB	'_EVA_NUMBER', 00H
$SG73000 DB	'_EVA_MONEY', 00H
	ORG $+1
$SG73001 DB	'_EVA_FILESIZE', 00H
	ORG $+2
$SG73007 DB	'SELECT ', 00H
$SG73014 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG73019 DB	'SELECT IdObj FROM IdList', 00H
	ORG $+3
$SG73022 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG73043 DB	'%lu', 00H
$SG73047 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG73050 DB	'IdList', 00H
	ORG $+1
$SG73051 DB	'ValList', 00H
$SG73054 DB	'_EVA_TXTLINK', 00H
	ORG $+3
$SG73055 DB	'_EVA_EMAIL', 00H
	ORG $+1
$SG73061 DB	'ALTER TABLE ValList MODIFY Val FLOAT', 00H
	ORG $+3
$SG73064 DB	'ALTER TABLE ValList MODIFY IdObj INT NOT NULL', 00H
	ORG $+2
$SG73065 DB	'ALTER TABLE ValList ADD INDEX (IdObj)', 00H
	ORG $+2
$SG73068 DB	'ValList.Val', 00H
$SG73069 DB	'UCASE(ValList.Val)', 00H
	ORG $+1
$SG73070 DB	'SELECT IdList.IdObj,MAX(%s) AS OrdVal FROM ', 00H
$SG73072 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG73076 DB	'TLink AS IdList', 00H
$SG73078 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG73082 DB	'IdList', 00H
	ORG $+1
$SG73084 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG73087 DB	0aH, 'LEFT JOIN ValList ON IdList.IdObj=ValList.IdObj ', 0aH
	DB	00H
	ORG $+1
$SG73089 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG73093 DB	'WHERE IdList.IdObj IN(', 00H
	ORG $+1
$SG73095 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG73099 DB	')', 0aH, 00H
	ORG $+1
$SG73101 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG73104 DB	'DESC', 00H
	ORG $+3
$SG73106 DB	'GROUP BY IdList.IdObj ORDER BY OrdVal %s, IdList.IdObj D'
	DB	'ESC LIMIT %lu,%lu', 00H
	ORG $+2
$SG73108 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG73111 DB	'D:\Travail\ABI\EVA\V4.0\CGI\Brunix-2016\table_utils.c', 00H
	ORG $+2
$SG73112 DB	'table_sort_obj_list', 00H
$SG73114 DB	'D:\Travail\ABI\EVA\V4.0\CGI\Brunix-2016\table_utils.c', 00H
	ORG $+2
$SG73115 DB	'table_sort_obj_list', 00H
_DATA	ENDS
_TEXT	SEGMENT
_cntxt$ = 8
_i_ctrl$ = 12
_b_selobj$ = 16
_form$ = -16
_ctrl$ = -5548
_tbl$ = -1068
_flt$ = -5544
_data$ = -1064
_sort$ = -1088
_sql$ = -12
_field$ = -1044
_printbuf$ = -1040
_fmt$ = -8
_b_num$ = -4
_j$73010 = -5552
_idobj$73028 = -5556
_s$73030 = -5560
_d$73031 = -5564
_c$73040 = -5568
__tmp$73042 = -5600
_fmt$73053 = -5604
_table_sort_obj_list PROC NEAR

; 2084 : ){

	push	ebp
	mov	ebp, esp
	mov	eax, 5648				; 00001610H
	call	__chkstk
	push	edi

; 2085 : 	EVA_form *form = cntxt->form;

	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	ecx, DWORD PTR [eax+80]
	mov	DWORD PTR _form$[ebp], ecx

; 2086 : 	EVA_ctrl *ctrl = form->ctrl + i_ctrl;

	mov	edx, DWORD PTR _i_ctrl$[ebp]
	imul	edx, 480				; 000001e0H
	mov	eax, DWORD PTR _form$[ebp]
	mov	ecx, DWORD PTR [eax]
	add	ecx, edx
	mov	DWORD PTR _ctrl$[ebp], ecx

; 2087 : 	ObjTableFormat *tbl = ctrl->objtbl;

	mov	edx, DWORD PTR _ctrl$[ebp]
	mov	eax, DWORD PTR [edx+232]
	mov	DWORD PTR _tbl$[ebp], eax

; 2088 : 	QryBuild flt = {{0}};

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

; 2089 : 	DynTable data = {0};

	mov	DWORD PTR _data$[ebp], 0
	xor	edx, edx
	mov	DWORD PTR _data$[ebp+4], edx
	mov	DWORD PTR _data$[ebp+8], edx
	mov	DWORD PTR _data$[ebp+12], edx
	mov	DWORD PTR _data$[ebp+16], edx

; 2090 : 	DynTable sort = {0};

	mov	DWORD PTR _sort$[ebp], 0
	xor	eax, eax
	mov	DWORD PTR _sort$[ebp+4], eax
	mov	DWORD PTR _sort$[ebp+8], eax
	mov	DWORD PTR _sort$[ebp+12], eax
	mov	DWORD PTR _sort$[ebp+16], eax

; 2091 : 	DynBuffer *sql = NULL;

	mov	DWORD PTR _sql$[ebp], 0

; 2092 : 	DynTableCell *field = dyntab_cell(&tbl->field, tbl->sortcol, 0);

	push	0
	mov	ecx, DWORD PTR _tbl$[ebp]
	mov	edx, DWORD PTR [ecx+60]
	push	edx
	mov	eax, DWORD PTR _tbl$[ebp]
	add	eax, 380				; 0000017cH
	push	eax
	call	_dyntab_cell
	add	esp, 12					; 0000000cH
	mov	DWORD PTR _field$[ebp], eax

; 2093 : 	char printbuf[1024] = {0};

	mov	BYTE PTR _printbuf$[ebp], 0
	mov	ecx, 255				; 000000ffH
	xor	eax, eax
	lea	edi, DWORD PTR _printbuf$[ebp+1]
	rep stosd
	stosw
	stosb

; 2094 : 	char *fmt = dyntab_val(&tbl->format, tbl->sortcol, 0);

	push	0
	mov	ecx, DWORD PTR _tbl$[ebp]
	mov	edx, DWORD PTR [ecx+60]
	push	edx
	mov	eax, DWORD PTR _tbl$[ebp]
	add	eax, 400				; 00000190H
	push	eax
	call	_dyntab_val
	add	esp, 12					; 0000000cH
	mov	DWORD PTR _fmt$[ebp], eax

; 2095 : 	int b_num = !strcmp(fmt, "_EVA_NUMBER") ||
; 2096 : 				!STRCMPCASE(fmt, "_EVA_MONEY")||
; 2097 : 				!strcmp(fmt, "_EVA_FILESIZE");

	push	OFFSET FLAT:$SG72999
	mov	ecx, DWORD PTR _fmt$[ebp]
	push	ecx
	call	_strcmp
	add	esp, 8
	test	eax, eax
	je	SHORT $L73588
	push	OFFSET FLAT:$SG73000
	mov	edx, DWORD PTR _fmt$[ebp]
	push	edx
	call	_stricmp
	add	esp, 8
	test	eax, eax
	je	SHORT $L73588
	push	OFFSET FLAT:$SG73001
	mov	eax, DWORD PTR _fmt$[ebp]
	push	eax
	call	_strcmp
	add	esp, 8
	test	eax, eax
	je	SHORT $L73588
	mov	DWORD PTR -5608+[ebp], 0
	jmp	SHORT $L73589
$L73588:
	mov	DWORD PTR -5608+[ebp], 1
$L73589:
	mov	ecx, DWORD PTR -5608+[ebp]
	mov	DWORD PTR _b_num$[ebp], ecx

; 2098 : 	if(!field || !field->txt) RETURN_OK;

	cmp	DWORD PTR _field$[ebp], 0
	je	SHORT $L73003
	mov	edx, DWORD PTR _field$[ebp]
	cmp	DWORD PTR [edx], 0
	jne	SHORT $L73002
$L73003:
	jmp	$eva_noerr$73004
$L73002:

; 2099 : 
; 2100 : 	/* Check sort column type */
; 2101 : 	if(strchr(field->txt, '[') || !strncmp(field->txt, add_sz_str("SELECT ")))

	push	91					; 0000005bH
	mov	eax, DWORD PTR _field$[ebp]
	mov	ecx, DWORD PTR [eax]
	push	ecx
	call	_strchr
	add	esp, 8
	test	eax, eax
	jne	SHORT $L73006
	push	7
	push	OFFSET FLAT:$SG73007
	mov	edx, DWORD PTR _field$[ebp]
	mov	eax, DWORD PTR [edx]
	push	eax
	call	_strncmp
	add	esp, 12					; 0000000cH
	test	eax, eax
	jne	$L73005
$L73006:

; 2103 : 		/* Handle SQL expression - check optimization */
; 2104 : 		if(*dyntab_val(&tbl->notable, tbl->sortcol, 0) == '1' || b_selobj)

	push	0
	mov	ecx, DWORD PTR _tbl$[ebp]
	mov	edx, DWORD PTR [ecx+60]
	push	edx
	mov	eax, DWORD PTR _tbl$[ebp]
	add	eax, 620				; 0000026cH
	push	eax
	call	_dyntab_val
	add	esp, 12					; 0000000cH
	movsx	ecx, BYTE PTR [eax]
	cmp	ecx, 49					; 00000031H
	je	SHORT $L73009
	cmp	DWORD PTR _b_selobj$[ebp], 0
	je	$L73008
$L73009:

; 2106 : 			/* SQL expression without tables - loop on objects */
; 2107 : 			unsigned long j;
; 2108 : 			if(b_selobj)

	cmp	DWORD PTR _b_selobj$[ebp], 0
	je	SHORT $L73011

; 2110 : 				if(dyntab_from_tab(&tbl->idobj, 0, 0, &ctrl->val, 0, 0, ctrl->val.nbrows, 1, 1)) RETURN_ERR_MEMORY;

	push	1
	push	1
	mov	edx, DWORD PTR _ctrl$[ebp]
	mov	eax, DWORD PTR [edx+64]
	push	eax
	push	0
	push	0
	mov	ecx, DWORD PTR _ctrl$[ebp]
	add	ecx, 64					; 00000040H
	push	ecx
	push	0
	push	0
	mov	edx, DWORD PTR _tbl$[ebp]
	add	edx, 184				; 000000b8H
	push	edx
	call	_dyntab_from_tab
	add	esp, 36					; 00000024H
	test	eax, eax
	je	SHORT $L73012
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29872], OFFSET FLAT:$SG73014
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 2110		; 0000083eH
	jmp	$eva_err$73015
$L73012:

; 2112 : 			else if(sql_exec_query(cntxt, "SELECT IdObj FROM IdList") || sql_get_table(cntxt, &tbl->idobj, 2)) STACK_ERROR

	jmp	SHORT $L73017
$L73011:
	push	OFFSET FLAT:$SG73019
	mov	edx, DWORD PTR _cntxt$[ebp]
	push	edx
	call	_sql_exec_query
	add	esp, 8
	test	eax, eax
	jne	SHORT $L73018
	push	2
	mov	eax, DWORD PTR _tbl$[ebp]
	add	eax, 184				; 000000b8H
	push	eax
	mov	ecx, DWORD PTR _cntxt$[ebp]
	push	ecx
	call	_sql_get_table
	add	esp, 12					; 0000000cH
	test	eax, eax
	je	SHORT $L73017
$L73018:
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 2112		; 00000840H
	jmp	$eva_err$73015
$L73017:

; 2113 : 			if(dyntab_resize(&sort, tbl->idobj.nbrows - 1, 0)) RETURN_ERR_MEMORY;

	push	0
	mov	eax, DWORD PTR _tbl$[ebp]
	mov	ecx, DWORD PTR [eax+184]
	sub	ecx, 1
	push	ecx
	lea	edx, DWORD PTR _sort$[ebp]
	push	edx
	call	_dyntab_resize
	add	esp, 12					; 0000000cH
	test	eax, eax
	je	SHORT $L73020
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29872], OFFSET FLAT:$SG73022
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 2113		; 00000841H
	jmp	$eva_err$73015
$L73020:

; 2114 : 			if(qry_eval_sqlexpr_var(cntxt, &sql, field->txt, tbl->attr, NULL)) STACK_ERROR

	push	0
	mov	edx, DWORD PTR _tbl$[ebp]
	mov	eax, DWORD PTR [edx]
	push	eax
	mov	ecx, DWORD PTR _field$[ebp]
	mov	edx, DWORD PTR [ecx]
	push	edx
	lea	eax, DWORD PTR _sql$[ebp]
	push	eax
	mov	ecx, DWORD PTR _cntxt$[ebp]
	push	ecx
	call	_qry_eval_sqlexpr_var
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L73024
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 2114		; 00000842H
	jmp	$eva_err$73015
$L73024:

; 2115 : 			for(j = 0; j < tbl->idobj.nbrows; j++)

	mov	DWORD PTR _j$73010[ebp], 0
	jmp	SHORT $L73025
$L73026:
	mov	eax, DWORD PTR _j$73010[ebp]
	add	eax, 1
	mov	DWORD PTR _j$73010[ebp], eax
$L73025:
	mov	ecx, DWORD PTR _tbl$[ebp]
	mov	edx, DWORD PTR _j$73010[ebp]
	cmp	edx, DWORD PTR [ecx+184]
	jae	$L73027

; 2117 : 				/* Evaluate expression on object & set result in sort table */
; 2118 : 				unsigned long idobj = DYNTAB_TOULRC(&tbl->idobj, j, 0);

	push	10					; 0000000aH
	push	0
	push	0
	mov	eax, DWORD PTR _j$73010[ebp]
	push	eax
	mov	ecx, DWORD PTR _tbl$[ebp]
	add	ecx, 184				; 000000b8H
	push	ecx
	call	_dyntab_val
	add	esp, 12					; 0000000cH
	push	eax
	call	_strtoul
	add	esp, 12					; 0000000cH
	mov	DWORD PTR _idobj$73028[ebp], eax

; 2119 : 				DynTableCell *s, *d = dyntab_cell(&sort, j, 0);

	push	0
	mov	edx, DWORD PTR _j$73010[ebp]
	push	edx
	lea	eax, DWORD PTR _sort$[ebp]
	push	eax
	call	_dyntab_cell
	add	esp, 12					; 0000000cH
	mov	DWORD PTR _d$73031[ebp], eax

; 2120 : 				if(form_eval_fieldexpr(cntxt, &data, 0, idobj, sql->data, sql->cnt, NULL, 0)) STACK_ERROR;

	push	0
	push	0
	mov	ecx, DWORD PTR _sql$[ebp]
	mov	edx, DWORD PTR [ecx+4]
	push	edx
	mov	eax, DWORD PTR _sql$[ebp]
	add	eax, 8
	push	eax
	mov	ecx, DWORD PTR _idobj$73028[ebp]
	push	ecx
	push	0
	lea	edx, DWORD PTR _data$[ebp]
	push	edx
	mov	eax, DWORD PTR _cntxt$[ebp]
	push	eax
	call	_form_eval_fieldexpr
	add	esp, 32					; 00000020H
	test	eax, eax
	je	SHORT $L73033
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 2120		; 00000848H
	jmp	$eva_err$73015
$L73033:

; 2121 : 				if(data.nbrows > 1)

	cmp	DWORD PTR _data$[ebp], 1
	jbe	SHORT $L73034

; 2122 : 					dyntab_sort(&data, 	tbl->b_sortdesc ?
; 2123 : 						b_num ?	qsort_col0idesc : qsort_col0desc :
; 2124 : 						b_num ?	qsort_col0i : qsort_col0);

	mov	edx, DWORD PTR _tbl$[ebp]
	cmp	DWORD PTR [edx+64], 0
	je	SHORT $L73594
	cmp	DWORD PTR _b_num$[ebp], 0
	je	SHORT $L73590
	mov	DWORD PTR -5612+[ebp], OFFSET FLAT:_qsort_col0idesc
	jmp	SHORT $L73591
$L73590:
	mov	DWORD PTR -5612+[ebp], OFFSET FLAT:_qsort_col0desc
$L73591:
	mov	eax, DWORD PTR -5612+[ebp]
	mov	DWORD PTR -5616+[ebp], eax
	jmp	SHORT $L73595
$L73594:
	cmp	DWORD PTR _b_num$[ebp], 0
	je	SHORT $L73592
	mov	DWORD PTR -5620+[ebp], OFFSET FLAT:_qsort_col0i
	jmp	SHORT $L73593
$L73592:
	mov	DWORD PTR -5620+[ebp], OFFSET FLAT:_qsort_col0
$L73593:
	mov	ecx, DWORD PTR -5620+[ebp]
	mov	DWORD PTR -5616+[ebp], ecx
$L73595:
	mov	edx, DWORD PTR -5616+[ebp]
	push	edx
	lea	eax, DWORD PTR _data$[ebp]
	push	eax
	call	_dyntab_sort
	add	esp, 8
$L73034:

; 2125 : 				s = dyntab_cell(&data, 0, 0);

	push	0
	push	0
	lea	ecx, DWORD PTR _data$[ebp]
	push	ecx
	call	_dyntab_cell
	add	esp, 12					; 0000000cH
	mov	DWORD PTR _s$73030[ebp], eax

; 2126 : 				if(s)

	cmp	DWORD PTR _s$73030[ebp], 0
	je	SHORT $L73035

; 2128 : 					if(!b_num) setcase(3, s->txt, s->len);

	cmp	DWORD PTR _b_num$[ebp], 0
	jne	SHORT $L73036
	mov	edx, DWORD PTR _s$73030[ebp]
	mov	eax, DWORD PTR [edx+4]
	push	eax
	mov	ecx, DWORD PTR _s$73030[ebp]
	mov	edx, DWORD PTR [ecx]
	push	edx
	push	3
	call	_setcase
	add	esp, 12					; 0000000cH
$L73036:

; 2129 : 					memcpy(d, s, sizeof(d[0]));

	push	64					; 00000040H
	mov	eax, DWORD PTR _s$73030[ebp]
	push	eax
	mov	ecx, DWORD PTR _d$73031[ebp]
	push	ecx
	call	_memcpy
	add	esp, 12					; 0000000cH

; 2130 : 					memset(s, 0, sizeof(d[0]));

	push	64					; 00000040H
	push	0
	mov	edx, DWORD PTR _s$73030[ebp]
	push	edx
	call	_memset
	add	esp, 12					; 0000000cH
$L73035:

; 2132 : 				d->IdObj = idobj;

	mov	eax, DWORD PTR _d$73031[ebp]
	mov	ecx, DWORD PTR _idobj$73028[ebp]
	mov	DWORD PTR [eax+20], ecx

; 2133 : 			}

	jmp	$L73026
$L73027:

; 2134 : 
; 2135 : 			/* Sort table & replace tbl->idobj */
; 2136 : 			dyntab_sort(&sort, 	tbl->b_sortdesc ?
; 2137 : 				b_num ?	qsort_col0idesc : qsort_col0desc :
; 2138 : 				b_num ?	qsort_col0i : qsort_col0);

	mov	edx, DWORD PTR _tbl$[ebp]
	cmp	DWORD PTR [edx+64], 0
	je	SHORT $L73600
	cmp	DWORD PTR _b_num$[ebp], 0
	je	SHORT $L73596
	mov	DWORD PTR -5624+[ebp], OFFSET FLAT:_qsort_col0idesc
	jmp	SHORT $L73597
$L73596:
	mov	DWORD PTR -5624+[ebp], OFFSET FLAT:_qsort_col0desc
$L73597:
	mov	eax, DWORD PTR -5624+[ebp]
	mov	DWORD PTR -5628+[ebp], eax
	jmp	SHORT $L73601
$L73600:
	cmp	DWORD PTR _b_num$[ebp], 0
	je	SHORT $L73598
	mov	DWORD PTR -5632+[ebp], OFFSET FLAT:_qsort_col0i
	jmp	SHORT $L73599
$L73598:
	mov	DWORD PTR -5632+[ebp], OFFSET FLAT:_qsort_col0
$L73599:
	mov	ecx, DWORD PTR -5632+[ebp]
	mov	DWORD PTR -5628+[ebp], ecx
$L73601:
	mov	edx, DWORD PTR -5628+[ebp]
	push	edx
	lea	eax, DWORD PTR _sort$[ebp]
	push	eax
	call	_dyntab_sort
	add	esp, 8

; 2139 : 			dyntab_free(&tbl->idobj);

	mov	ecx, DWORD PTR _tbl$[ebp]
	add	ecx, 184				; 000000b8H
	push	ecx
	call	_dyntab_free
	add	esp, 4

; 2140 : 			for(j = 0; j < tbl->lines; j++)

	mov	DWORD PTR _j$73010[ebp], 0
	jmp	SHORT $L73037
$L73038:
	mov	edx, DWORD PTR _j$73010[ebp]
	add	edx, 1
	mov	DWORD PTR _j$73010[ebp], edx
$L73037:
	mov	eax, DWORD PTR _tbl$[ebp]
	mov	ecx, DWORD PTR _j$73010[ebp]
	cmp	ecx, DWORD PTR [eax+44]
	jae	$L73039

; 2142 : 				DynTableCell *c = dyntab_cell(&sort, j + tbl->line, 0);

	push	0
	mov	edx, DWORD PTR _tbl$[ebp]
	mov	eax, DWORD PTR _j$73010[ebp]
	add	eax, DWORD PTR [edx+40]
	push	eax
	lea	ecx, DWORD PTR _sort$[ebp]
	push	ecx
	call	_dyntab_cell
	add	esp, 12					; 0000000cH
	mov	DWORD PTR _c$73040[ebp], eax

; 2143 : 				if(!c) break;

	cmp	DWORD PTR _c$73040[ebp], 0
	jne	SHORT $L73041
	jmp	$L73039
$L73041:

; 2144 : 				DYNTAB_ADD_INT(&tbl->idobj, j, 0, c->IdObj);

	mov	BYTE PTR __tmp$73042[ebp], 0
	mov	ecx, 7
	xor	eax, eax
	lea	edi, DWORD PTR __tmp$73042[ebp+1]
	rep stosd
	stosw
	stosb
	mov	edx, DWORD PTR _c$73040[ebp]
	mov	eax, DWORD PTR [edx+20]
	push	eax
	push	OFFSET FLAT:$SG73043
	lea	ecx, DWORD PTR __tmp$73042[ebp]
	push	ecx
	call	_sprintf
	add	esp, 12					; 0000000cH
	push	0
	push	0
	push	0
	lea	edx, DWORD PTR __tmp$73042[ebp]
	push	edx
	push	0
	mov	eax, DWORD PTR _j$73010[ebp]
	push	eax
	mov	ecx, DWORD PTR _tbl$[ebp]
	add	ecx, 184				; 000000b8H
	push	ecx
	call	_dyntab_add
	add	esp, 28					; 0000001cH
	test	eax, eax
	je	SHORT $L73045
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29872], OFFSET FLAT:$SG73047
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 2144		; 00000860H
	jmp	$eva_err$73015
$L73045:

; 2145 : 			}

	jmp	$L73038
$L73039:

; 2146 : 			RETURN_OK;

	jmp	$eva_noerr$73004
$L73008:

; 2150 : 			/* SQL expression with tables - eval expression on IdList to ValList */
; 2151 : 			if(qry_eval_sql_fieldexpr(cntxt, "ValList", field->txt, "IdList", tbl->attr)) STACK_ERROR;

	mov	ecx, DWORD PTR _tbl$[ebp]
	mov	edx, DWORD PTR [ecx]
	push	edx
	push	OFFSET FLAT:$SG73050
	mov	eax, DWORD PTR _field$[ebp]
	mov	ecx, DWORD PTR [eax]
	push	ecx
	push	OFFSET FLAT:$SG73051
	mov	edx, DWORD PTR _cntxt$[ebp]
	push	edx
	call	_qry_eval_sql_fieldexpr
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L73049
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 2151		; 00000867H
	jmp	$eva_err$73015
$L73049:

; 2154 : 	else

	jmp	$L73058
$L73005:

; 2156 : 		/* Sort on 1st field only if applicable */
; 2157 : 		char *fmt = dyntab_val(&tbl->format, tbl->sortcol, 0);

	push	0
	mov	ecx, DWORD PTR _tbl$[ebp]
	mov	edx, DWORD PTR [ecx+60]
	push	edx
	mov	eax, DWORD PTR _tbl$[ebp]
	add	eax, 400				; 00000190H
	push	eax
	call	_dyntab_val
	add	esp, 12					; 0000000cH
	mov	DWORD PTR _fmt$73053[ebp], eax

; 2158 : 		flt.b_single_last_field = field->txt && !strchr(field->txt, '(') &&
; 2159 : 								(!*fmt ||
; 2160 : 									!strcmp(fmt, "_EVA_TXTLINK") ||
; 2161 : 									!strcmp(fmt, "_EVA_EMAIL"));

	mov	ecx, DWORD PTR _field$[ebp]
	cmp	DWORD PTR [ecx], 0
	je	SHORT $L73602
	push	40					; 00000028H
	mov	edx, DWORD PTR _field$[ebp]
	mov	eax, DWORD PTR [edx]
	push	eax
	call	_strchr
	add	esp, 8
	test	eax, eax
	jne	SHORT $L73602
	mov	ecx, DWORD PTR _fmt$73053[ebp]
	movsx	edx, BYTE PTR [ecx]
	test	edx, edx
	je	SHORT $L73603
	push	OFFSET FLAT:$SG73054
	mov	eax, DWORD PTR _fmt$73053[ebp]
	push	eax
	call	_strcmp
	add	esp, 8
	test	eax, eax
	je	SHORT $L73603
	push	OFFSET FLAT:$SG73055
	mov	ecx, DWORD PTR _fmt$73053[ebp]
	push	ecx
	call	_strcmp
	add	esp, 8
	test	eax, eax
	jne	SHORT $L73602
$L73603:
	mov	DWORD PTR -5636+[ebp], 1
	jmp	SHORT $L73604
$L73602:
	mov	DWORD PTR -5636+[ebp], 0
$L73604:
	mov	edx, DWORD PTR -5636+[ebp]
	mov	DWORD PTR _flt$[ebp+4452], edx

; 2162 : 
; 2163 : 		/* Build temporary table with sort values */
; 2164 : 		if(qry_parse_fieldexpr(cntxt, field->txt, field->len, &flt) ||
; 2165 : 			sql_get_listcol(cntxt, NULL, b_selobj ? &ctrl->val : NULL, &flt, 0)) STACK_ERROR;

	lea	eax, DWORD PTR _flt$[ebp]
	push	eax
	mov	ecx, DWORD PTR _field$[ebp]
	mov	edx, DWORD PTR [ecx+4]
	push	edx
	mov	eax, DWORD PTR _field$[ebp]
	mov	ecx, DWORD PTR [eax]
	push	ecx
	mov	edx, DWORD PTR _cntxt$[ebp]
	push	edx
	call	_qry_parse_fieldexpr
	add	esp, 16					; 00000010H
	test	eax, eax
	jne	SHORT $L73059
	cmp	DWORD PTR _b_selobj$[ebp], 0
	je	SHORT $L73605
	mov	eax, DWORD PTR _ctrl$[ebp]
	add	eax, 64					; 00000040H
	mov	DWORD PTR -5640+[ebp], eax
	jmp	SHORT $L73606
$L73605:
	mov	DWORD PTR -5640+[ebp], 0
$L73606:
	push	0
	lea	ecx, DWORD PTR _flt$[ebp]
	push	ecx
	mov	edx, DWORD PTR -5640+[ebp]
	push	edx
	push	0
	mov	eax, DWORD PTR _cntxt$[ebp]
	push	eax
	call	_sql_get_listcol
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L73058
$L73059:
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 2165		; 00000875H
	jmp	$eva_err$73015
$L73058:

; 2167 : 
; 2168 : 	/* Handle numerical sorting */
; 2169 : 	if(b_num && sql_exec_query(cntxt, "ALTER TABLE ValList MODIFY Val FLOAT")) STACK_ERROR;

	cmp	DWORD PTR _b_num$[ebp], 0
	je	SHORT $L73060
	push	OFFSET FLAT:$SG73061
	mov	edx, DWORD PTR _cntxt$[ebp]
	push	edx
	call	_sql_exec_query
	add	esp, 8
	test	eax, eax
	je	SHORT $L73060
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 2169		; 00000879H
	jmp	$eva_err$73015
$L73060:

; 2170 : 
; 2171 : 	/* Add indexes */
; 2172 : 	if(sql_exec_query(cntxt, "ALTER TABLE ValList MODIFY IdObj INT NOT NULL") ||
; 2173 : 		sql_exec_query(cntxt, "ALTER TABLE ValList ADD INDEX (IdObj)")) STACK_ERROR;

	push	OFFSET FLAT:$SG73064
	mov	ecx, DWORD PTR _cntxt$[ebp]
	push	ecx
	call	_sql_exec_query
	add	esp, 8
	test	eax, eax
	jne	SHORT $L73063
	push	OFFSET FLAT:$SG73065
	mov	edx, DWORD PTR _cntxt$[ebp]
	push	edx
	call	_sql_exec_query
	add	esp, 8
	test	eax, eax
	je	SHORT $L73062
$L73063:
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 2173		; 0000087dH
	jmp	$eva_err$73015
$L73062:

; 2174 : 
; 2175 : 	/* Handle numerical / case insensitive sorting */
; 2176 : 	if(dynbuf_print(&sql,
; 2177 : 		"SELECT IdList.IdObj,MAX(%s) AS OrdVal FROM ",
; 2178 : 		b_num ? "ValList.Val" : "UCASE(ValList.Val)")) RETURN_ERR_MEMORY;

	cmp	DWORD PTR _b_num$[ebp], 0
	je	SHORT $L73607
	mov	DWORD PTR -5644+[ebp], OFFSET FLAT:$SG73068
	jmp	SHORT $L73608
$L73607:
	mov	DWORD PTR -5644+[ebp], OFFSET FLAT:$SG73069
$L73608:
	push	0
	push	0
	mov	ecx, DWORD PTR -5644+[ebp]
	push	ecx
	push	OFFSET FLAT:$SG73070
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
	test	eax, eax
	je	SHORT $L73067
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29872], OFFSET FLAT:$SG73072
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 2178		; 00000882H
	jmp	$eva_err$73015
$L73067:

; 2179 : 	if(b_selobj) DYNBUF_ADD_STR(&sql, "TLink AS IdList")

	cmp	DWORD PTR _b_selobj$[ebp], 0
	je	SHORT $L73073
	push	0
	push	0
	push	15					; 0000000fH
	push	OFFSET FLAT:$SG73076
	lea	ecx, DWORD PTR _sql$[ebp]
	push	ecx
	call	_dynbuf_add
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L73075
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29872], OFFSET FLAT:$SG73078
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 2179		; 00000883H
	jmp	$eva_err$73015
$L73075:

; 2180 : 	else DYNBUF_ADD_STR(&sql, "IdList");

	jmp	SHORT $L73081
$L73073:
	push	0
	push	0
	push	6
	push	OFFSET FLAT:$SG73082
	lea	ecx, DWORD PTR _sql$[ebp]
	push	ecx
	call	_dynbuf_add
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L73081
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29872], OFFSET FLAT:$SG73084
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 2180		; 00000884H
	jmp	$eva_err$73015
$L73081:

; 2182 : 		"\nLEFT JOIN ValList ON IdList.IdObj=ValList.IdObj \n");

	push	0
	push	0
	push	50					; 00000032H
	push	OFFSET FLAT:$SG73087
	lea	ecx, DWORD PTR _sql$[ebp]
	push	ecx
	call	_dynbuf_add
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L73086
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29872], OFFSET FLAT:$SG73089
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 2182		; 00000886H
	jmp	$eva_err$73015
$L73086:

; 2183 : 	if(b_selobj)

	cmp	DWORD PTR _b_selobj$[ebp], 0
	je	$L73098

; 2185 : 		DYNBUF_ADD_STR(&sql, "WHERE IdList.IdObj IN(");

	push	0
	push	0
	push	22					; 00000016H
	push	OFFSET FLAT:$SG73093
	lea	ecx, DWORD PTR _sql$[ebp]
	push	ecx
	call	_dynbuf_add
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L73092
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29872], OFFSET FLAT:$SG73095
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 2185		; 00000889H
	jmp	$eva_err$73015
$L73092:

; 2186 : 		if(qry_values_list(cntxt, &ctrl->val, 0, &sql)) STACK_ERROR;

	lea	ecx, DWORD PTR _sql$[ebp]
	push	ecx
	push	0
	mov	edx, DWORD PTR _ctrl$[ebp]
	add	edx, 64					; 00000040H
	push	edx
	mov	eax, DWORD PTR _cntxt$[ebp]
	push	eax
	call	_qry_values_list
	add	esp, 16					; 00000010H
	test	eax, eax
	je	SHORT $L73096
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 2186		; 0000088aH
	jmp	$eva_err$73015
$L73096:

; 2187 : 		DYNBUF_ADD_STR(&sql, ")\n");

	push	0
	push	0
	push	2
	push	OFFSET FLAT:$SG73099
	lea	edx, DWORD PTR _sql$[ebp]
	push	edx
	call	_dynbuf_add
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L73098
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29872], OFFSET FLAT:$SG73101
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 2187		; 0000088bH
	jmp	$eva_err$73015
$L73098:

; 2189 : 
; 2190 : 	/* Ordered & clipped list of objects */
; 2191 : 	if(dynbuf_print3(&sql,
; 2192 : 		"GROUP BY IdList.IdObj ORDER BY OrdVal %s, IdList.IdObj DESC LIMIT %lu,%lu",
; 2193 : 		tbl->b_sortdesc ? "DESC" : "",
; 2194 : 		tbl->line, tbl->lines)) RETURN_ERR_MEMORY;

	mov	edx, DWORD PTR _tbl$[ebp]
	cmp	DWORD PTR [edx+64], 0
	je	SHORT $L73609
	mov	DWORD PTR -5648+[ebp], OFFSET FLAT:$SG73104
	jmp	SHORT $L73610
$L73609:
	mov	DWORD PTR -5648+[ebp], OFFSET FLAT:$SG73105
$L73610:
	push	0
	push	0
	mov	eax, DWORD PTR _tbl$[ebp]
	mov	ecx, DWORD PTR [eax+44]
	push	ecx
	mov	edx, DWORD PTR _tbl$[ebp]
	mov	eax, DWORD PTR [edx+40]
	push	eax
	mov	ecx, DWORD PTR -5648+[ebp]
	push	ecx
	push	OFFSET FLAT:$SG73106
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
	test	eax, eax
	je	SHORT $L73103
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29872], OFFSET FLAT:$SG73108
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 2194		; 00000892H
	jmp	SHORT $eva_err$73015
$L73103:

; 2195 : 
; 2196 : 	/* Exec query & place it in table list of objects */
; 2197 : 	if(sql_exec_query(cntxt, sql->data) ||
; 2198 : 		sql_get_table(cntxt, &tbl->idobj, 2)) STACK_ERROR;

	mov	ecx, DWORD PTR _sql$[ebp]
	add	ecx, 8
	push	ecx
	mov	edx, DWORD PTR _cntxt$[ebp]
	push	edx
	call	_sql_exec_query
	add	esp, 8
	test	eax, eax
	jne	SHORT $L73110
	push	2
	mov	eax, DWORD PTR _tbl$[ebp]
	add	eax, 184				; 000000b8H
	push	eax
	mov	ecx, DWORD PTR _cntxt$[ebp]
	push	ecx
	call	_sql_get_table
	add	esp, 12					; 0000000cH
	test	eax, eax
	je	SHORT $eva_noerr$73004
$L73110:
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 2198		; 00000896H
	jmp	SHORT $eva_err$73015
$eva_noerr$73004:

; 2199 : 
; 2200 : 	RETURN_OK_CLEANUP;

	push	0
	push	OFFSET FLAT:$SG73111
	push	OFFSET FLAT:$SG73112
	mov	eax, DWORD PTR _cntxt$[ebp]
	push	eax
	call	_err_clear
	add	esp, 16					; 00000010H
$eva_err$73015:
	mov	ecx, DWORD PTR _cntxt$[ebp]
	cmp	DWORD PTR [ecx+29872], 0
	je	SHORT $L73113
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	eax, DWORD PTR [edx+29900]
	push	eax
	push	OFFSET FLAT:$SG73114
	push	OFFSET FLAT:$SG73115
	mov	ecx, DWORD PTR _cntxt$[ebp]
	push	ecx
	call	_err_add_context
	add	esp, 16					; 00000010H
$L73113:
	lea	edx, DWORD PTR _flt$[ebp]
	push	edx
	call	_qry_build_free
	add	esp, 4
	lea	eax, DWORD PTR _data$[ebp]
	push	eax
	call	_dyntab_free
	add	esp, 4
	lea	ecx, DWORD PTR _sort$[ebp]
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

; 2201 : }

	pop	edi
	mov	esp, ebp
	pop	ebp
	ret	0
_table_sort_obj_list ENDP
_TEXT	ENDS
PUBLIC	_table_prepare_obj_list
_BSS	SEGMENT
	ALIGN	4

$SG73131 DB	01H DUP (?)
	ALIGN	4

$SG73132 DB	01H DUP (?)
_BSS	ENDS
_DATA	SEGMENT
$SG73137 DB	'SHRINK', 00H
	ORG $+1
$SG73146 DB	'D:\Travail\ABI\EVA\V4.0\CGI\Brunix-2016\table_utils.c', 00H
	ORG $+2
$SG73147 DB	'table_prepare_obj_list', 00H
	ORG $+1
$SG73150 DB	'D:\Travail\ABI\EVA\V4.0\CGI\Brunix-2016\table_utils.c', 00H
	ORG $+2
$SG73151 DB	'table_prepare_obj_list', 00H
	ORG $+1
$SG73153 DB	'D:\Travail\ABI\EVA\V4.0\CGI\Brunix-2016\table_utils.c', 00H
	ORG $+2
$SG73154 DB	'table_prepare_obj_list', 00H
_DATA	ENDS
_TEXT	SEGMENT
_cntxt$ = 8
_i_ctrl$ = 12
_form$ = -4
_ctrl$ = -24
_tbl$ = -8
_b_sort$ = -12
_b_selobj$ = -20
_btn$ = -16
_table_prepare_obj_list PROC NEAR

; 2214 : ){

	push	ebp
	mov	ebp, esp
	sub	esp, 40					; 00000028H

; 2215 : 	EVA_form *form = cntxt->form;

	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	ecx, DWORD PTR [eax+80]
	mov	DWORD PTR _form$[ebp], ecx

; 2216 : 	EVA_ctrl *ctrl = form->ctrl + i_ctrl;

	mov	edx, DWORD PTR _i_ctrl$[ebp]
	imul	edx, 480				; 000001e0H
	mov	eax, DWORD PTR _form$[ebp]
	mov	ecx, DWORD PTR [eax]
	add	ecx, edx
	mov	DWORD PTR _ctrl$[ebp], ecx

; 2217 : 	ObjTableFormat *tbl = ctrl->objtbl;

	mov	edx, DWORD PTR _ctrl$[ebp]
	mov	eax, DWORD PTR [edx+232]
	mov	DWORD PTR _tbl$[ebp], eax

; 2218 : 	int b_sort, b_selobj = 0;

	mov	DWORD PTR _b_selobj$[ebp], 0

; 2219 : 	char *btn = form->i_ctrl_clic == i_ctrl ? CGI_CLICK_BTN_SUBFIELD : "";

	mov	ecx, DWORD PTR _form$[ebp]
	mov	edx, DWORD PTR [ecx+124]
	cmp	edx, DWORD PTR _i_ctrl$[ebp]
	jne	SHORT $L73614
	mov	eax, DWORD PTR _cntxt$[ebp]
	cmp	DWORD PTR [eax+29648], 0
	je	SHORT $L73612
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	edx, DWORD PTR [ecx+29656]
	imul	edx, 56					; 00000038H
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	ecx, DWORD PTR [eax+29648]
	mov	edx, DWORD PTR [ecx+edx]
	movsx	eax, BYTE PTR [edx]
	cmp	eax, 66					; 00000042H
	jne	SHORT $L73612
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	edx, DWORD PTR [ecx+29656]
	imul	edx, 56					; 00000038H
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	ecx, DWORD PTR [eax+29648]
	cmp	DWORD PTR [ecx+edx+32], 0
	je	SHORT $L73612
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	eax, DWORD PTR [edx+29656]
	imul	eax, 56					; 00000038H
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	edx, DWORD PTR [ecx+29648]
	mov	eax, DWORD PTR [edx+eax+32]
	mov	DWORD PTR -28+[ebp], eax
	jmp	SHORT $L73613
$L73612:
	mov	DWORD PTR -28+[ebp], OFFSET FLAT:$SG73131
$L73613:
	mov	ecx, DWORD PTR -28+[ebp]
	mov	DWORD PTR -32+[ebp], ecx
	jmp	SHORT $L73615
$L73614:
	mov	DWORD PTR -32+[ebp], OFFSET FLAT:$SG73132
$L73615:
	mov	edx, DWORD PTR -32+[ebp]
	mov	DWORD PTR _btn$[ebp], edx

; 2220 : 
; 2221 : 	/* Initialize table	*/
; 2222 : 	if(table_init_obj_list(cntxt, i_ctrl, &b_selobj)) STACK_ERROR;

	lea	eax, DWORD PTR _b_selobj$[ebp]
	push	eax
	mov	ecx, DWORD PTR _i_ctrl$[ebp]
	push	ecx
	mov	edx, DWORD PTR _cntxt$[ebp]
	push	edx
	call	_table_init_obj_list
	add	esp, 12					; 0000000cH
	test	eax, eax
	je	SHORT $L73133
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 2222		; 000008aeH
	jmp	$eva_err$73134
$L73133:

; 2223 : 
; 2224 : 	/* Handle automatic setting of display parameters */
; 2225 : 	if(tbl->lines < 2) tbl->lines = 2;

	mov	ecx, DWORD PTR _tbl$[ebp]
	cmp	DWORD PTR [ecx+44], 2
	jae	SHORT $L73135
	mov	edx, DWORD PTR _tbl$[ebp]
	mov	DWORD PTR [edx+44], 2
$L73135:

; 2226 : 	if(tbl->totlines <= tbl->lines && !strcmp(btn, "SHRINK"))

	mov	eax, DWORD PTR _tbl$[ebp]
	mov	ecx, DWORD PTR _tbl$[ebp]
	mov	edx, DWORD PTR [eax+52]
	cmp	edx, DWORD PTR [ecx+44]
	ja	SHORT $L73136
	push	OFFSET FLAT:$SG73137
	mov	eax, DWORD PTR _btn$[ebp]
	push	eax
	call	_strcmp
	add	esp, 8
	test	eax, eax
	jne	SHORT $L73136

; 2227 : 		tbl->lines = tbl->totlines > 4 ? tbl->totlines / 2 : 2;

	mov	ecx, DWORD PTR _tbl$[ebp]
	cmp	DWORD PTR [ecx+52], 4
	jbe	SHORT $L73616
	mov	edx, DWORD PTR _tbl$[ebp]
	mov	eax, DWORD PTR [edx+52]
	shr	eax, 1
	mov	DWORD PTR -36+[ebp], eax
	jmp	SHORT $L73617
$L73616:
	mov	DWORD PTR -36+[ebp], 2
$L73617:
	mov	ecx, DWORD PTR _tbl$[ebp]
	mov	edx, DWORD PTR -36+[ebp]
	mov	DWORD PTR [ecx+44], edx
$L73136:

; 2228 : 	if(tbl->totlines <= tbl->lines) tbl->line = 0;

	mov	eax, DWORD PTR _tbl$[ebp]
	mov	ecx, DWORD PTR _tbl$[ebp]
	mov	edx, DWORD PTR [eax+52]
	cmp	edx, DWORD PTR [ecx+44]
	ja	SHORT $L73138
	mov	eax, DWORD PTR _tbl$[ebp]
	mov	DWORD PTR [eax+40], 0

; 2229 : 	else if(tbl->line == ~0UL) tbl->line = tbl->totlines - tbl->lines;

	jmp	SHORT $L73142
$L73138:
	mov	ecx, DWORD PTR _tbl$[ebp]
	cmp	DWORD PTR [ecx+40], -1
	jne	SHORT $L73140
	mov	edx, DWORD PTR _tbl$[ebp]
	mov	eax, DWORD PTR _tbl$[ebp]
	mov	ecx, DWORD PTR [edx+52]
	sub	ecx, DWORD PTR [eax+44]
	mov	edx, DWORD PTR _tbl$[ebp]
	mov	DWORD PTR [edx+40], ecx

; 2230 : 	else if(tbl->line > tbl->totlines) tbl->line = tbl->totlines - 1;

	jmp	SHORT $L73142
$L73140:
	mov	eax, DWORD PTR _tbl$[ebp]
	mov	ecx, DWORD PTR _tbl$[ebp]
	mov	edx, DWORD PTR [eax+40]
	cmp	edx, DWORD PTR [ecx+52]
	jbe	SHORT $L73142
	mov	eax, DWORD PTR _tbl$[ebp]
	mov	ecx, DWORD PTR [eax+52]
	sub	ecx, 1
	mov	edx, DWORD PTR _tbl$[ebp]
	mov	DWORD PTR [edx+40], ecx
$L73142:

; 2231 : 	b_sort = (tbl->b_sortsel  || !b_selobj) && tbl->status & TblCtrl_sort;

	mov	eax, DWORD PTR _tbl$[ebp]
	cmp	DWORD PTR [eax+68], 0
	jne	SHORT $L73618
	cmp	DWORD PTR _b_selobj$[ebp], 0
	jne	SHORT $L73619
$L73618:
	mov	ecx, DWORD PTR _tbl$[ebp]
	mov	edx, DWORD PTR [ecx+32]
	and	edx, 1
	test	edx, edx
	je	SHORT $L73619
	mov	DWORD PTR -40+[ebp], 1
	jmp	SHORT $L73620
$L73619:
	mov	DWORD PTR -40+[ebp], 0
$L73620:
	mov	eax, DWORD PTR -40+[ebp]
	mov	DWORD PTR _b_sort$[ebp], eax

; 2232 : 	if(!b_sort)

	cmp	DWORD PTR _b_sort$[ebp], 0
	jne	SHORT $L73143

; 2233 : 		tbl->status &= ~TblCtrl_sort;

	mov	ecx, DWORD PTR _tbl$[ebp]
	mov	edx, DWORD PTR [ecx+32]
	and	edx, -2					; fffffffeH
	mov	eax, DWORD PTR _tbl$[ebp]
	mov	DWORD PTR [eax+32], edx

; 2234 : 	else if(tbl->totlines > 1 &&

	jmp	SHORT $L73145
$L73143:

; 2235 : 		table_sort_obj_list(cntxt, i_ctrl, b_selobj)) CLEAR_ERROR;

	mov	ecx, DWORD PTR _tbl$[ebp]
	cmp	DWORD PTR [ecx+52], 1
	jbe	SHORT $L73145
	mov	edx, DWORD PTR _b_selobj$[ebp]
	push	edx
	mov	eax, DWORD PTR _i_ctrl$[ebp]
	push	eax
	mov	ecx, DWORD PTR _cntxt$[ebp]
	push	ecx
	call	_table_sort_obj_list
	add	esp, 12					; 0000000cH
	test	eax, eax
	je	SHORT $L73145
	push	2235					; 000008bbH
	push	OFFSET FLAT:$SG73146
	push	OFFSET FLAT:$SG73147
	mov	edx, DWORD PTR _cntxt$[ebp]
	push	edx
	call	_err_clear
	add	esp, 16					; 00000010H
$L73145:

; 2236 : 
; 2237 : 	/* Read displayed objects data */
; 2238 : 	if(table_read_obj_list(cntxt, i_ctrl, b_selobj)) STACK_ERROR;

	mov	eax, DWORD PTR _b_selobj$[ebp]
	push	eax
	mov	ecx, DWORD PTR _i_ctrl$[ebp]
	push	ecx
	mov	edx, DWORD PTR _cntxt$[ebp]
	push	edx
	call	_table_read_obj_list
	add	esp, 12					; 0000000cH
	test	eax, eax
	je	SHORT $eva_noerr$73149
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 2238		; 000008beH
	jmp	SHORT $eva_err$73134
$eva_noerr$73149:

; 2239 : 
; 2240 : 	RETURN_OK_CLEANUP;

	push	0
	push	OFFSET FLAT:$SG73150
	push	OFFSET FLAT:$SG73151
	mov	ecx, DWORD PTR _cntxt$[ebp]
	push	ecx
	call	_err_clear
	add	esp, 16					; 00000010H
$eva_err$73134:
	mov	edx, DWORD PTR _cntxt$[ebp]
	cmp	DWORD PTR [edx+29872], 0
	je	SHORT $L73152
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	ecx, DWORD PTR [eax+29900]
	push	ecx
	push	OFFSET FLAT:$SG73153
	push	OFFSET FLAT:$SG73154
	mov	edx, DWORD PTR _cntxt$[ebp]
	push	edx
	call	_err_add_context
	add	esp, 16					; 00000010H
$L73152:
	mov	eax, DWORD PTR _cntxt$[ebp]
	xor	ecx, ecx
	cmp	DWORD PTR [eax+29872], 0
	setne	cl
	mov	eax, ecx

; 2241 : }

	mov	esp, ebp
	pop	ebp
	ret	0
_table_prepare_obj_list ENDP
_TEXT	ENDS
PUBLIC	_table_put_html_obj_list
EXTRN	_put_html_table_header:NEAR
EXTRN	_ctrl_put_hidden:NEAR
_BSS	SEGMENT
	ALIGN	4

$SG73173 DB	01H DUP (?)
_BSS	ENDS
_DATA	SEGMENT
	ORG $+1
$SG73172 DB	'_EVA_PAGE_CTRL', 00H
	ORG $+1
$SG73181 DB	'_EVA_TABLESEARCH', 00H
	ORG $+3
$SG73182 DB	'_EVA_TABLE_NOTITLESHRINK', 00H
	ORG $+3
$SG73184 DB	'_EVA_INPUT', 00H
	ORG $+1
$SG73188 DB	'_EVA_BORDER', 00H
$SG73190 DB	'all', 00H
$SG73191 DB	'cols', 00H
	ORG $+3
$SG73192 DB	'none', 00H
	ORG $+3
$SG73198 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG73206 DB	'_EVA_TABLEALIGN', 00H
$SG73211 DB	'<td>', 00H
	ORG $+3
$SG73213 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG73219 DB	'_EVA_CELLPADDING', 00H
	ORG $+3
$SG73220 DB	'_EVA_CELLSPACING', 00H
	ORG $+3
$SG73221 DB	'100%', 00H
	ORG $+3
$SG73225 DB	'</table>', 0aH, '</td></tr>', 00H
$SG73227 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG73232 DB	'</tr>', 00H
	ORG $+2
$SG73234 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG73237 DB	'</table>', 0aH, 00H
	ORG $+2
$SG73239 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG73251 DB	' -->', 0aH, 00H
	ORG $+2
$SG73252 DB	0aH, '<!--- End   ObjTable ', 00H
	ORG $+1
$SG73254 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG73255 DB	'D:\Travail\ABI\EVA\V4.0\CGI\Brunix-2016\table_utils.c', 00H
	ORG $+2
$SG73256 DB	'table_put_html_obj_list', 00H
$SG73258 DB	'D:\Travail\ABI\EVA\V4.0\CGI\Brunix-2016\table_utils.c', 00H
	ORG $+2
$SG73259 DB	'table_put_html_obj_list', 00H
_DATA	ENDS
_TEXT	SEGMENT
_cntxt$ = 8
_i_ctrl$ = 12
_form$ = -4
_ctrl$ = -40
_tbl$ = -24
_i$ = -28
_b_shrink$ = -20
_titlemode$ = -8
_step$ = -36
_tablesearch$ = -32
_pagectrl$ = -16
_html$ = -12
_val$73244 = -44
_table_put_html_obj_list PROC NEAR

; 2254 : ){

	push	ebp
	mov	ebp, esp
	sub	esp, 72					; 00000048H

; 2255 : 	EVA_form *form = cntxt->form;

	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	ecx, DWORD PTR [eax+80]
	mov	DWORD PTR _form$[ebp], ecx

; 2256 : 	EVA_ctrl *ctrl = form->ctrl + i_ctrl;

	mov	edx, DWORD PTR _i_ctrl$[ebp]
	imul	edx, 480				; 000001e0H
	mov	eax, DWORD PTR _form$[ebp]
	mov	ecx, DWORD PTR [eax]
	add	ecx, edx
	mov	DWORD PTR _ctrl$[ebp], ecx

; 2257 : 	ObjTableFormat *tbl = ctrl->objtbl;

	mov	edx, DWORD PTR _ctrl$[ebp]
	mov	eax, DWORD PTR [edx+232]
	mov	DWORD PTR _tbl$[ebp], eax

; 2258 : 	unsigned long i;
; 2259 : 	int b_shrink, titlemode;
; 2260 : 	int step = form->step;

	mov	ecx, DWORD PTR _form$[ebp]
	mov	edx, DWORD PTR [ecx+176]
	mov	DWORD PTR _step$[ebp], edx

; 2261 : 	char *tablesearch;
; 2262 : 	char *pagectrl = CTRL_ATTR_VAL(PAGE_CTRL);

	cmp	DWORD PTR _ctrl$[ebp], 0
	je	SHORT $L73622
	push	0
	push	-1
	push	OFFSET FLAT:$SG73172
	mov	eax, DWORD PTR _ctrl$[ebp]
	add	eax, 44					; 0000002cH
	push	eax
	call	_dyntab_field_val
	add	esp, 16					; 00000010H
	mov	DWORD PTR -48+[ebp], eax
	jmp	SHORT $L73623
$L73622:
	mov	DWORD PTR -48+[ebp], OFFSET FLAT:$SG73173
$L73623:
	mov	ecx, DWORD PTR -48+[ebp]
	mov	DWORD PTR _pagectrl$[ebp], ecx

; 2263 : 	CHECK_HTML_STATUS;

	cmp	DWORD PTR _cntxt$[ebp], 0
	je	SHORT $L73626
	mov	edx, DWORD PTR _cntxt$[ebp]
	cmp	DWORD PTR [edx+80], 0
	je	SHORT $L73624
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	ecx, DWORD PTR [eax+80]
	mov	edx, DWORD PTR [ecx+232]
	mov	DWORD PTR -52+[ebp], edx
	jmp	SHORT $L73625
$L73624:
	mov	DWORD PTR -52+[ebp], 0
$L73625:
	mov	eax, DWORD PTR -52+[ebp]
	mov	DWORD PTR -56+[ebp], eax
	jmp	SHORT $L73627
$L73626:
	mov	DWORD PTR -56+[ebp], 0
$L73627:
	mov	ecx, DWORD PTR -56+[ebp]
	mov	DWORD PTR _html$[ebp], ecx
	cmp	DWORD PTR _html$[ebp], 0
	jne	SHORT $L73177
	xor	eax, eax
	jmp	$L73162
$L73177:

; 2264 : 	if(!tbl) RETURN_OK;

	cmp	DWORD PTR _tbl$[ebp], 0
	jne	SHORT $L73178
	jmp	$eva_noerr$73179
$L73178:

; 2265 : 
; 2266 : 	/* Handle edit mode if no title */
; 2267 : 	if(tbl->b_ctrl) tbl->attr = &ctrl->attr;

	mov	edx, DWORD PTR _tbl$[ebp]
	cmp	DWORD PTR [edx+24], 0
	je	SHORT $L73180
	mov	eax, DWORD PTR _ctrl$[ebp]
	add	eax, 44					; 0000002cH
	mov	ecx, DWORD PTR _tbl$[ebp]
	mov	DWORD PTR [ecx], eax
$L73180:

; 2268 : 	tablesearch = DYNTAB_FIELD_VAL(tbl->attr, TABLESEARCH);

	push	0
	push	-1
	push	OFFSET FLAT:$SG73181
	mov	edx, DWORD PTR _tbl$[ebp]
	mov	eax, DWORD PTR [edx]
	push	eax
	call	_dyntab_field_val
	add	esp, 16					; 00000010H
	mov	DWORD PTR _tablesearch$[ebp], eax

; 2269 : 	titlemode = atoi(DYNTAB_FIELD_VAL(tbl->attr, TABLE_NOTITLESHRINK));

	push	0
	push	-1
	push	OFFSET FLAT:$SG73182
	mov	ecx, DWORD PTR _tbl$[ebp]
	mov	edx, DWORD PTR [ecx]
	push	edx
	call	_dyntab_field_val
	add	esp, 16					; 00000010H
	push	eax
	call	_atoi
	add	esp, 4
	mov	DWORD PTR _titlemode$[ebp], eax

; 2270 : 	if(titlemode == 2 && !*tablesearch && !strcmp(ctrl->CONTROL, "_EVA_INPUT") && form->step == HtmlEdit && (ctrl->access & AccessEdit))

	cmp	DWORD PTR _titlemode$[ebp], 2
	jne	SHORT $L73183
	mov	eax, DWORD PTR _tablesearch$[ebp]
	movsx	ecx, BYTE PTR [eax]
	test	ecx, ecx
	jne	SHORT $L73183
	push	OFFSET FLAT:$SG73184
	mov	edx, DWORD PTR _ctrl$[ebp]
	mov	eax, DWORD PTR [edx+272]
	push	eax
	call	_strcmp
	add	esp, 8
	test	eax, eax
	jne	SHORT $L73183
	mov	ecx, DWORD PTR _form$[ebp]
	cmp	DWORD PTR [ecx+176], 4
	jne	SHORT $L73183
	mov	edx, DWORD PTR _ctrl$[ebp]
	mov	eax, DWORD PTR [edx+184]
	and	eax, 2
	test	eax, eax
	je	SHORT $L73183

; 2271 : 		tbl->status |= TblCtrl_opensel;

	mov	ecx, DWORD PTR _tbl$[ebp]
	mov	edx, DWORD PTR [ecx+32]
	or	dh, 2
	mov	eax, DWORD PTR _tbl$[ebp]
	mov	DWORD PTR [eax+32], edx
$L73183:

; 2272 : 
; 2273 : 	/* Prepare list of objects	*/
; 2274 : 	if(table_prepare_obj_list(cntxt, i_ctrl)) STACK_ERROR;

	mov	ecx, DWORD PTR _i_ctrl$[ebp]
	push	ecx
	mov	edx, DWORD PTR _cntxt$[ebp]
	push	edx
	call	_table_prepare_obj_list
	add	esp, 8
	test	eax, eax
	je	SHORT $L73185
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 2274		; 000008e2H
	jmp	$eva_err$73186
$L73185:

; 2275 : 
; 2276 : 	/* Set default table attributes	*/
; 2277 : 	if(!DYNTAB_FIELD_CELL(tbl->attr, BORDER) && !ctrl->TABLE_STYLE[0])

	push	0
	push	-1
	push	OFFSET FLAT:$SG73188
	mov	ecx, DWORD PTR _tbl$[ebp]
	mov	edx, DWORD PTR [ecx]
	push	edx
	call	_dyntab_field_cell
	add	esp, 16					; 00000010H
	test	eax, eax
	jne	SHORT $L73187
	mov	eax, DWORD PTR _ctrl$[ebp]
	mov	ecx, DWORD PTR [eax+476]
	movsx	edx, BYTE PTR [ecx]
	test	edx, edx
	jne	SHORT $L73187

; 2278 : 		ctrl->BORDER = 1;

	mov	eax, DWORD PTR _ctrl$[ebp]
	mov	DWORD PTR [eax+460], 1
$L73187:

; 2279 : 	if(!ctrl->TABLERULES[0] && !ctrl->TABLE_STYLE[0])

	mov	ecx, DWORD PTR _ctrl$[ebp]
	mov	edx, DWORD PTR [ecx+448]
	movsx	eax, BYTE PTR [edx]
	test	eax, eax
	jne	SHORT $L73189
	mov	ecx, DWORD PTR _ctrl$[ebp]
	mov	edx, DWORD PTR [ecx+476]
	movsx	eax, BYTE PTR [edx]
	test	eax, eax
	jne	SHORT $L73189

; 2280 : 		ctrl->TABLERULES = ctrl->BORDER ? (form->step == HtmlPrint || tbl->status & TblCtrl_printmode) ? "all" : "cols" : "none";

	mov	ecx, DWORD PTR _ctrl$[ebp]
	cmp	DWORD PTR [ecx+460], 0
	je	SHORT $L73630
	mov	edx, DWORD PTR _form$[ebp]
	cmp	DWORD PTR [edx+176], 7
	je	SHORT $L73628
	mov	eax, DWORD PTR _tbl$[ebp]
	mov	ecx, DWORD PTR [eax+32]
	and	ecx, 4096				; 00001000H
	test	ecx, ecx
	jne	SHORT $L73628
	mov	DWORD PTR -60+[ebp], OFFSET FLAT:$SG73191
	jmp	SHORT $L73629
$L73628:
	mov	DWORD PTR -60+[ebp], OFFSET FLAT:$SG73190
$L73629:
	mov	edx, DWORD PTR -60+[ebp]
	mov	DWORD PTR -64+[ebp], edx
	jmp	SHORT $L73631
$L73630:
	mov	DWORD PTR -64+[ebp], OFFSET FLAT:$SG73192
$L73631:
	mov	eax, DWORD PTR _ctrl$[ebp]
	mov	ecx, DWORD PTR -64+[ebp]
	mov	DWORD PTR [eax+448], ecx
$L73189:

; 2281 : 
; 2282 : 	/* Handle search output in logs */
; 2283 : 	if(tbl->input[0] && tbl->status & TblCtrl_opensearch && (!cntxt->log_srchtxt || form->i_ctrl_clic == i_ctrl))

	mov	edx, DWORD PTR _tbl$[ebp]
	mov	eax, DWORD PTR [edx+100]
	movsx	ecx, BYTE PTR [eax]
	test	ecx, ecx
	je	$L73196
	mov	edx, DWORD PTR _tbl$[ebp]
	mov	eax, DWORD PTR [edx+32]
	and	eax, 32					; 00000020H
	test	eax, eax
	je	SHORT $L73196
	mov	ecx, DWORD PTR _cntxt$[ebp]
	cmp	DWORD PTR [ecx+32056], 0
	je	SHORT $L73194
	mov	edx, DWORD PTR _form$[ebp]
	mov	eax, DWORD PTR [edx+124]
	cmp	eax, DWORD PTR _i_ctrl$[ebp]
	jne	SHORT $L73196
$L73194:

; 2285 : 		M_FREE(cntxt->log_srchtxt);

	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	edx, DWORD PTR [ecx+32056]
	push	edx
	call	_mem_free
	add	esp, 4
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+32056], 0

; 2286 : 		DYNBUF_ADD(&cntxt->log_srchtxt, tbl->input, 0, NO_CONV);

	push	0
	push	0
	push	0
	mov	ecx, DWORD PTR _tbl$[ebp]
	mov	edx, DWORD PTR [ecx+100]
	push	edx
	mov	eax, DWORD PTR _cntxt$[ebp]
	add	eax, 32056				; 00007d38H
	push	eax
	call	_dynbuf_add
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L73196
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29872], OFFSET FLAT:$SG73198
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 2286		; 000008eeH
	jmp	$eva_err$73186
$L73196:

; 2288 : 
; 2289 : 	/* Handle minimal table display (closed & 2 or less values) */
; 2290 : 	b_shrink = (!titlemode || !tbl->totlines) && tbl->totlines < 3 &&
; 2291 : 		!(tbl->status & (TblCtrl_opensearch | TblCtrl_opensel)) && !(tbl->status & TblCtrl_openaddnew);

	cmp	DWORD PTR _titlemode$[ebp], 0
	je	SHORT $L73632
	mov	eax, DWORD PTR _tbl$[ebp]
	cmp	DWORD PTR [eax+52], 0
	jne	SHORT $L73633
$L73632:
	mov	ecx, DWORD PTR _tbl$[ebp]
	cmp	DWORD PTR [ecx+52], 3
	jae	SHORT $L73633
	mov	edx, DWORD PTR _tbl$[ebp]
	mov	eax, DWORD PTR [edx+32]
	and	eax, 544				; 00000220H
	test	eax, eax
	jne	SHORT $L73633
	mov	ecx, DWORD PTR _tbl$[ebp]
	mov	edx, DWORD PTR [ecx+32]
	and	edx, 128				; 00000080H
	test	edx, edx
	jne	SHORT $L73633
	mov	DWORD PTR -68+[ebp], 1
	jmp	SHORT $L73634
$L73633:
	mov	DWORD PTR -68+[ebp], 0
$L73634:
	mov	eax, DWORD PTR -68+[ebp]
	mov	DWORD PTR _b_shrink$[ebp], eax

; 2292 : 
; 2293 : 	/* Handle print mode */
; 2294 : 	if(tbl->status & TblCtrl_printmode) form->step = HtmlPrint;

	mov	ecx, DWORD PTR _tbl$[ebp]
	mov	edx, DWORD PTR [ecx+32]
	and	edx, 4096				; 00001000H
	test	edx, edx
	je	SHORT $L73199
	mov	eax, DWORD PTR _form$[ebp]
	mov	DWORD PTR [eax+176], 7
$L73199:

; 2295 : 
; 2296 : 	/* Output global table header */
; 2297 : 	if(put_html_table_header(cntxt,
; 2298 : 			DYNTAB_FIELD_VAL(tbl->attr, TABLEALIGN),
; 2299 : 			ctrl->TABLEWIDTH,
; 2300 : 			ctrl->TABLEHEIGHT,
; 2301 : 			NULL, NULL,
; 2302 : 			0, 0, 0, NULL, NULL, NULL)) STACK_ERROR;

	push	0
	push	0
	push	0
	push	0
	push	0
	push	0
	push	0
	push	0
	mov	ecx, DWORD PTR _ctrl$[ebp]
	mov	edx, DWORD PTR [ecx+444]
	push	edx
	mov	eax, DWORD PTR _ctrl$[ebp]
	mov	ecx, DWORD PTR [eax+440]
	push	ecx
	push	0
	push	-1
	push	OFFSET FLAT:$SG73206
	mov	edx, DWORD PTR _tbl$[ebp]
	mov	eax, DWORD PTR [edx]
	push	eax
	call	_dyntab_field_val
	add	esp, 16					; 00000010H
	push	eax
	mov	ecx, DWORD PTR _cntxt$[ebp]
	push	ecx
	call	_put_html_table_header
	add	esp, 48					; 00000030H
	test	eax, eax
	je	SHORT $L73205
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 2302		; 000008feH
	jmp	$eva_err$73186
$L73205:

; 2303 : 
; 2304 : 	/* Add input controls for table functions */
; 2305 : 	if((!tbl->idobj.nbrows || tbl->lines <= tbl->idobj.nbrows || pagectrl[0] != '0' || tbl->status & TblCtrl_search) &&
; 2306 : 		table_put_controls(cntxt, i_ctrl, b_shrink)) STACK_ERROR;

	mov	eax, DWORD PTR _tbl$[ebp]
	cmp	DWORD PTR [eax+184], 0
	je	SHORT $L73208
	mov	ecx, DWORD PTR _tbl$[ebp]
	mov	edx, DWORD PTR _tbl$[ebp]
	mov	eax, DWORD PTR [ecx+44]
	cmp	eax, DWORD PTR [edx+184]
	jbe	SHORT $L73208
	mov	ecx, DWORD PTR _pagectrl$[ebp]
	movsx	edx, BYTE PTR [ecx]
	cmp	edx, 48					; 00000030H
	jne	SHORT $L73208
	mov	eax, DWORD PTR _tbl$[ebp]
	mov	ecx, DWORD PTR [eax+32]
	and	ecx, 16					; 00000010H
	test	ecx, ecx
	je	SHORT $L73207
$L73208:
	mov	edx, DWORD PTR _b_shrink$[ebp]
	push	edx
	mov	eax, DWORD PTR _i_ctrl$[ebp]
	push	eax
	mov	ecx, DWORD PTR _cntxt$[ebp]
	push	ecx
	call	_table_put_controls
	add	esp, 12					; 0000000cH
	test	eax, eax
	je	SHORT $L73207
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 2306		; 00000902H
	jmp	$eva_err$73186
$L73207:

; 2307 : 
; 2308 : 	/* Output status, table header &  rows */
; 2309 : 	DYNBUF_ADD_STR(html, "<td>");

	push	0
	push	0
	push	4
	push	OFFSET FLAT:$SG73211
	mov	eax, DWORD PTR _html$[ebp]
	push	eax
	call	_dynbuf_add
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L73210
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29872], OFFSET FLAT:$SG73213
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 2309		; 00000905H
	jmp	$eva_err$73186
$L73210:

; 2310 : 	if(table_put_status(cntxt, i_ctrl) ||
; 2311 : 		put_html_table_header(cntxt,
; 2312 : 			NULL, "100%", NULL,
; 2313 : 			ctrl->TABLEBGCOLOR,
; 2314 : 			ctrl->TABLEBACKGROUND,
; 2315 : 			atoi(DYNTAB_FIELD_VAL(tbl->attr, CELLSPACING)),
; 2316 : 			atoi(DYNTAB_FIELD_VAL(tbl->attr, CELLPADDING)),
; 2317 : 			ctrl->BORDER,
; 2318 : 			ctrl->TABLERULES, ctrl->TABLE_STYLE, NULL) ||
; 2319 : 		(!b_shrink && titlemode != 2 && table_put_title_row(cntxt, i_ctrl, titlemode)) ||
; 2320 : 		table_put_rows(cntxt, i_ctrl)) STACK_ERROR;

	mov	eax, DWORD PTR _i_ctrl$[ebp]
	push	eax
	mov	ecx, DWORD PTR _cntxt$[ebp]
	push	ecx
	call	_table_put_status
	add	esp, 8
	test	eax, eax
	jne	$L73218
	push	0
	mov	edx, DWORD PTR _ctrl$[ebp]
	mov	eax, DWORD PTR [edx+476]
	push	eax
	mov	ecx, DWORD PTR _ctrl$[ebp]
	mov	edx, DWORD PTR [ecx+448]
	push	edx
	mov	eax, DWORD PTR _ctrl$[ebp]
	mov	ecx, DWORD PTR [eax+460]
	push	ecx
	push	0
	push	-1
	push	OFFSET FLAT:$SG73219
	mov	edx, DWORD PTR _tbl$[ebp]
	mov	eax, DWORD PTR [edx]
	push	eax
	call	_dyntab_field_val
	add	esp, 16					; 00000010H
	push	eax
	call	_atoi
	add	esp, 4
	push	eax
	push	0
	push	-1
	push	OFFSET FLAT:$SG73220
	mov	ecx, DWORD PTR _tbl$[ebp]
	mov	edx, DWORD PTR [ecx]
	push	edx
	call	_dyntab_field_val
	add	esp, 16					; 00000010H
	push	eax
	call	_atoi
	add	esp, 4
	push	eax
	mov	eax, DWORD PTR _ctrl$[ebp]
	mov	ecx, DWORD PTR [eax+456]
	push	ecx
	mov	edx, DWORD PTR _ctrl$[ebp]
	mov	eax, DWORD PTR [edx+452]
	push	eax
	push	0
	push	OFFSET FLAT:$SG73221
	push	0
	mov	ecx, DWORD PTR _cntxt$[ebp]
	push	ecx
	call	_put_html_table_header
	add	esp, 48					; 00000030H
	test	eax, eax
	jne	SHORT $L73218
	cmp	DWORD PTR _b_shrink$[ebp], 0
	jne	SHORT $L73222
	cmp	DWORD PTR _titlemode$[ebp], 2
	je	SHORT $L73222
	mov	edx, DWORD PTR _titlemode$[ebp]
	push	edx
	mov	eax, DWORD PTR _i_ctrl$[ebp]
	push	eax
	mov	ecx, DWORD PTR _cntxt$[ebp]
	push	ecx
	call	_table_put_title_row
	add	esp, 12					; 0000000cH
	test	eax, eax
	jne	SHORT $L73218
$L73222:
	mov	edx, DWORD PTR _i_ctrl$[ebp]
	push	edx
	mov	eax, DWORD PTR _cntxt$[ebp]
	push	eax
	call	_table_put_rows
	add	esp, 8
	test	eax, eax
	je	SHORT $L73217
$L73218:
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 2320		; 00000910H
	jmp	$eva_err$73186
$L73217:

; 2321 : 
; 2322 : 	/* Output table footer */
; 2323 : 	DYNBUF_ADD_STR(html, "</table>\n</td></tr>");

	push	0
	push	0
	push	19					; 00000013H
	push	OFFSET FLAT:$SG73225
	mov	edx, DWORD PTR _html$[ebp]
	push	edx
	call	_dynbuf_add
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L73224
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29872], OFFSET FLAT:$SG73227
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 2323		; 00000913H
	jmp	$eva_err$73186
$L73224:

; 2324 : 	if(tbl->totlines > tbl->lines)

	mov	edx, DWORD PTR _tbl$[ebp]
	mov	eax, DWORD PTR _tbl$[ebp]
	mov	ecx, DWORD PTR [edx+52]
	cmp	ecx, DWORD PTR [eax+44]
	jbe	SHORT $L73231

; 2326 : 		if(table_put_page_navigator(cntxt, i_ctrl, 1)) STACK_ERROR;

	push	1
	mov	edx, DWORD PTR _i_ctrl$[ebp]
	push	edx
	mov	eax, DWORD PTR _cntxt$[ebp]
	push	eax
	call	_table_put_page_navigator
	add	esp, 12					; 0000000cH
	test	eax, eax
	je	SHORT $L73229
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 2326		; 00000916H
	jmp	$eva_err$73186
$L73229:

; 2327 : 		DYNBUF_ADD_STR(html, "</tr>");

	push	0
	push	0
	push	5
	push	OFFSET FLAT:$SG73232
	mov	edx, DWORD PTR _html$[ebp]
	push	edx
	call	_dynbuf_add
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L73231
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29872], OFFSET FLAT:$SG73234
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 2327		; 00000917H
	jmp	$eva_err$73186
$L73231:

; 2329 : 	DYNBUF_ADD_STR(html, "</table>\n");

	push	0
	push	0
	push	9
	push	OFFSET FLAT:$SG73237
	mov	edx, DWORD PTR _html$[ebp]
	push	edx
	call	_dynbuf_add
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L73236
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29872], OFFSET FLAT:$SG73239
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 2329		; 00000919H
	jmp	$eva_err$73186
$L73236:

; 2330 : 
; 2331 : 	/* Output non visible values as hidden input */
; 2332 : 	if(form->step == HtmlEdit && tbl->status & TblCtrl_sel)

	mov	edx, DWORD PTR _form$[ebp]
	cmp	DWORD PTR [edx+176], 4
	jne	$L73243
	mov	eax, DWORD PTR _tbl$[ebp]
	mov	ecx, DWORD PTR [eax+32]
	and	ecx, 256				; 00000100H
	test	ecx, ecx
	je	$L73243

; 2333 : 		for(i = 0; i < (ctrl->val.nbrows ? ctrl->val.nbrows : 1); i++)

	mov	DWORD PTR _i$[ebp], 0
	jmp	SHORT $L73241
$L73242:
	mov	edx, DWORD PTR _i$[ebp]
	add	edx, 1
	mov	DWORD PTR _i$[ebp], edx
$L73241:
	mov	eax, DWORD PTR _ctrl$[ebp]
	cmp	DWORD PTR [eax+64], 0
	je	SHORT $L73635
	mov	ecx, DWORD PTR _ctrl$[ebp]
	mov	edx, DWORD PTR [ecx+64]
	mov	DWORD PTR -72+[ebp], edx
	jmp	SHORT $L73636
$L73635:
	mov	DWORD PTR -72+[ebp], 1
$L73636:
	mov	eax, DWORD PTR _i$[ebp]
	cmp	eax, DWORD PTR -72+[ebp]
	jae	SHORT $L73243

; 2335 : 			DynTableCell *val = dyntab_cell(&ctrl->val, i, 0);

	push	0
	mov	ecx, DWORD PTR _i$[ebp]
	push	ecx
	mov	edx, DWORD PTR _ctrl$[ebp]
	add	edx, 64					; 00000040H
	push	edx
	call	_dyntab_cell
	add	esp, 12					; 0000000cH
	mov	DWORD PTR _val$73244[ebp], eax

; 2336 : 			if(!val || !val->col)

	cmp	DWORD PTR _val$73244[ebp], 0
	je	SHORT $L73246
	mov	eax, DWORD PTR _val$73244[ebp]
	cmp	DWORD PTR [eax+56], 0
	jne	SHORT $L73247
$L73246:

; 2337 : 				if(ctrl_put_hidden(cntxt, ctrl, i)) STACK_ERROR;

	mov	ecx, DWORD PTR _i$[ebp]
	push	ecx
	mov	edx, DWORD PTR _ctrl$[ebp]
	push	edx
	mov	eax, DWORD PTR _cntxt$[ebp]
	push	eax
	call	_ctrl_put_hidden
	add	esp, 12					; 0000000cH
	test	eax, eax
	je	SHORT $L73247
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 2337		; 00000921H
	jmp	SHORT $eva_err$73186
$L73247:

; 2338 : 		}

	jmp	SHORT $L73242
$L73243:

; 2339 : 
; 2340 : 	if(cntxt->debug & DEBUG_HTML) DYNBUF_ADD3(html, "\n<!--- End   ObjTable ", ctrl->LABEL, 0, NO_CONV, " -->\n");

	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	eax, DWORD PTR [edx+29860]
	and	eax, 128				; 00000080H
	test	eax, eax
	je	SHORT $L73250
	push	5
	push	OFFSET FLAT:$SG73251
	push	0
	push	0
	push	0
	mov	ecx, DWORD PTR _ctrl$[ebp]
	mov	edx, DWORD PTR [ecx+284]
	push	edx
	push	22					; 00000016H
	push	OFFSET FLAT:$SG73252
	mov	eax, DWORD PTR _html$[ebp]
	push	eax
	call	_dynbuf_add3
	add	esp, 36					; 00000024H
	test	eax, eax
	je	SHORT $L73250
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29872], OFFSET FLAT:$SG73254
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 2340		; 00000924H
	jmp	SHORT $eva_err$73186
$L73250:
$eva_noerr$73179:

; 2341 : 
; 2342 : 	RETURN_OK_CLEANUP;

	push	0
	push	OFFSET FLAT:$SG73255
	push	OFFSET FLAT:$SG73256
	mov	eax, DWORD PTR _cntxt$[ebp]
	push	eax
	call	_err_clear
	add	esp, 16					; 00000010H
$eva_err$73186:
	mov	ecx, DWORD PTR _cntxt$[ebp]
	cmp	DWORD PTR [ecx+29872], 0
	je	SHORT $L73257
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	eax, DWORD PTR [edx+29900]
	push	eax
	push	OFFSET FLAT:$SG73258
	push	OFFSET FLAT:$SG73259
	mov	ecx, DWORD PTR _cntxt$[ebp]
	push	ecx
	call	_err_add_context
	add	esp, 16					; 00000010H
$L73257:
	mov	edx, DWORD PTR _form$[ebp]
	mov	eax, DWORD PTR _step$[ebp]
	mov	DWORD PTR [edx+176], eax
	mov	ecx, DWORD PTR _cntxt$[ebp]
	xor	eax, eax
	cmp	DWORD PTR [ecx+29872], 0
	setne	al
$L73162:

; 2343 : }

	mov	esp, ebp
	pop	ebp
	ret	0
_table_put_html_obj_list ENDP
_TEXT	ENDS
END
