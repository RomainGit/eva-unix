	TITLE	D:\Travail\ABI\EVA\V4.0\CGI\Brunix-2016\table_search.c
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
PUBLIC	_table_search_set_node
EXTRN	_sql_id_values:NEAR
EXTRN	_mem_free:NEAR
EXTRN	_qry_values_list:NEAR
EXTRN	_sql_no_quote:BYTE
EXTRN	_dynbuf_add:NEAR
EXTRN	_dynbuf_add3:NEAR
EXTRN	_dyntab_free:NEAR
EXTRN	_dyntab_sz:NEAR
EXTRN	_dyntab_val:NEAR
EXTRN	_dyntab_cell:NEAR
EXTRN	_dyntab_copy:NEAR
EXTRN	_dyntab_add:NEAR
EXTRN	_strcmp:NEAR
EXTRN	_dyntab_set_txt:NEAR
EXTRN	_err_add_context:NEAR
EXTRN	_err_clear:NEAR
EXTRN	_strncmp:NEAR
EXTRN	_qry_build_clauses:NEAR
_BSS	SEGMENT
$SG70238 DB	01H DUP (?)
	ALIGN	4

$SG70243 DB	01H DUP (?)
	ALIGN	4

$SG70257 DB	01H DUP (?)
	ALIGN	4

$SG70262 DB	01H DUP (?)
	ALIGN	4

$SG70277 DB	01H DUP (?)
	ALIGN	4

$SG70282 DB	01H DUP (?)
	ALIGN	4

$SG70290 DB	01H DUP (?)
	ALIGN	4

$SG70295 DB	01H DUP (?)
_BSS	ENDS
_DATA	SEGMENT
$SG70225 DB	'_EVA_AGE', 00H
	ORG $+3
$SG70226 DB	'_EVA_DATE', 00H
	ORG $+2
$SG70231 DB	' AND ', 00H
	ORG $+2
$SG70233 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70237 DB	'>=''', 00H
$SG70240 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70242 DB	'''', 00H
	ORG $+2
$SG70245 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70250 DB	' AND ', 00H
	ORG $+2
$SG70252 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70256 DB	'<''', 00H
	ORG $+1
$SG70259 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70261 DB	'''', 00H
	ORG $+2
$SG70264 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70269 DB	' AND ', 00H
	ORG $+2
$SG70271 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70276 DB	'=''', 00H
	ORG $+1
$SG70279 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70281 DB	'''', 00H
	ORG $+2
$SG70284 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70289 DB	' LIKE ''%', 00H
	ORG $+3
$SG70292 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70294 DB	'%''', 00H
	ORG $+1
$SG70297 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70302 DB	'_EVA_AGE', 00H
	ORG $+3
$SG70303 DB	'_EVA_DATE', 00H
	ORG $+2
$SG70314 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70320 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70323 DB	'0', 00H
	ORG $+2
$SG70325 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70327 DB	'0', 00H
	ORG $+2
$SG70331 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70334 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70339 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70343 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70347 DB	'D:\Travail\ABI\EVA\V4.0\CGI\Brunix-2016\table_search.c', 00H
	ORG $+1
$SG70348 DB	'table_search_set_node', 00H
	ORG $+2
$SG70350 DB	'D:\Travail\ABI\EVA\V4.0\CGI\Brunix-2016\table_search.c', 00H
	ORG $+1
$SG70351 DB	'table_search_set_node', 00H
_DATA	ENDS
_TEXT	SEGMENT
_cntxt$ = 8
_i_ctrl$ = 12
_flt$ = 16
_i_word$ = 20
_form$ = -4
_ctrl$ = -36
_tbl$ = -28
_data$ = -24
_idlist$ = -32
_node$70299 = -40
_limit$70306 = -44
_table_search_set_node PROC NEAR

; 28   : ){

	push	ebp
	mov	ebp, esp
	sub	esp, 80					; 00000050H

; 29   : 	EVA_form *form = cntxt->form;

	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	ecx, DWORD PTR [eax+80]
	mov	DWORD PTR _form$[ebp], ecx

; 30   : 	EVA_ctrl *ctrl = form->ctrl + i_ctrl;

	mov	edx, DWORD PTR _i_ctrl$[ebp]
	imul	edx, 480				; 000001e0H
	mov	eax, DWORD PTR _form$[ebp]
	mov	ecx, DWORD PTR [eax]
	add	ecx, edx
	mov	DWORD PTR _ctrl$[ebp], ecx

; 31   : 	ObjTableFormat *tbl = ctrl->objtbl;

	mov	edx, DWORD PTR _ctrl$[ebp]
	mov	eax, DWORD PTR [edx+232]
	mov	DWORD PTR _tbl$[ebp], eax

; 32   : 	DynTable data = {0};

	mov	DWORD PTR _data$[ebp], 0
	xor	ecx, ecx
	mov	DWORD PTR _data$[ebp+4], ecx
	mov	DWORD PTR _data$[ebp+8], ecx
	mov	DWORD PTR _data$[ebp+12], ecx
	mov	DWORD PTR _data$[ebp+16], ecx

; 33   : 	DynBuffer *idlist = NULL;

	mov	DWORD PTR _idlist$[ebp], 0

; 34   : 
; 35   : 	if(flt->groupfn)

	mov	edx, DWORD PTR _flt$[ebp]
	cmp	DWORD PTR [edx+44], 0
	je	$L70220

; 37   : 		/* There is a group function : use HAVING clause */
; 38   : 		if(qry_build_clauses(cntxt, flt, 0)) STACK_ERROR;

	push	0
	mov	eax, DWORD PTR _flt$[ebp]
	push	eax
	mov	ecx, DWORD PTR _cntxt$[ebp]
	push	ecx
	call	_qry_build_clauses
	add	esp, 12					; 0000000cH
	test	eax, eax
	je	SHORT $L70221
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 38		; 00000026H
	jmp	$eva_err$70222
$L70221:

; 39   : 		if(!strcmp(tbl->srchfmt, "_EVA_AGE") ||
; 40   : 			!strncmp(tbl->srchfmt, add_sz_str("_EVA_DATE")))

	push	OFFSET FLAT:$SG70225
	mov	eax, DWORD PTR _tbl$[ebp]
	mov	ecx, DWORD PTR [eax+128]
	push	ecx
	call	_strcmp
	add	esp, 8
	test	eax, eax
	je	SHORT $L70224
	push	9
	push	OFFSET FLAT:$SG70226
	mov	edx, DWORD PTR _tbl$[ebp]
	mov	eax, DWORD PTR [edx+128]
	push	eax
	call	_strncmp
	add	esp, 12					; 0000000cH
	test	eax, eax
	jne	$L70223
$L70224:

; 42   : 			if(dyntab_sz(&tbl->srchwords, 0, 0))

	push	0
	push	0
	mov	ecx, DWORD PTR _tbl$[ebp]
	add	ecx, 104				; 00000068H
	push	ecx
	call	_dyntab_sz
	add	esp, 12					; 0000000cH
	test	eax, eax
	je	$L70241

; 44   : 				if(flt->having) DYNBUF_ADD_STR(&flt->having, " AND ");

	mov	edx, DWORD PTR _flt$[ebp]
	cmp	DWORD PTR [edx+48], 0
	je	SHORT $L70230
	push	0
	push	0
	push	5
	push	OFFSET FLAT:$SG70231
	mov	eax, DWORD PTR _flt$[ebp]
	add	eax, 48					; 00000030H
	push	eax
	call	_dynbuf_add
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L70230
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29872], OFFSET FLAT:$SG70233
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 44		; 0000002cH
	jmp	$eva_err$70222
$L70230:

; 45   : 				DYNBUF_ADD3_BUF(&flt->having, "", flt->select, NO_CONV, ">='");

	mov	eax, DWORD PTR _flt$[ebp]
	cmp	DWORD PTR [eax+28], 0
	je	SHORT $L70711
	mov	ecx, DWORD PTR _flt$[ebp]
	mov	edx, DWORD PTR [ecx+28]
	mov	eax, DWORD PTR [edx+4]
	mov	DWORD PTR -48+[ebp], eax
	jmp	SHORT $L70712
$L70711:
	mov	DWORD PTR -48+[ebp], 0
$L70712:
	mov	ecx, DWORD PTR _flt$[ebp]
	cmp	DWORD PTR [ecx+28], 0
	je	SHORT $L70713
	mov	edx, DWORD PTR _flt$[ebp]
	mov	eax, DWORD PTR [edx+28]
	add	eax, 8
	mov	DWORD PTR -52+[ebp], eax
	jmp	SHORT $L70714
$L70713:
	mov	DWORD PTR -52+[ebp], 0
$L70714:
	push	3
	push	OFFSET FLAT:$SG70237
	push	0
	push	0
	mov	ecx, DWORD PTR -48+[ebp]
	push	ecx
	mov	edx, DWORD PTR -52+[ebp]
	push	edx
	push	0
	push	OFFSET FLAT:$SG70238
	mov	eax, DWORD PTR _flt$[ebp]
	add	eax, 48					; 00000030H
	push	eax
	call	_dynbuf_add3
	add	esp, 36					; 00000024H
	test	eax, eax
	je	SHORT $L70236
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29872], OFFSET FLAT:$SG70240
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 45		; 0000002dH
	jmp	$eva_err$70222
$L70236:

; 46   : 				DYNBUF_ADD3_CELL(&flt->having, "", &tbl->srchwords, 0, 0, SQL_NO_QUOTE, "'");

	push	1
	push	OFFSET FLAT:$SG70242
	push	1
	push	OFFSET FLAT:_sql_no_quote
	push	0
	push	0
	mov	eax, DWORD PTR _tbl$[ebp]
	add	eax, 104				; 00000068H
	push	eax
	call	_dyntab_sz
	add	esp, 12					; 0000000cH
	push	eax
	push	0
	push	0
	mov	ecx, DWORD PTR _tbl$[ebp]
	add	ecx, 104				; 00000068H
	push	ecx
	call	_dyntab_val
	add	esp, 12					; 0000000cH
	push	eax
	push	0
	push	OFFSET FLAT:$SG70243
	mov	edx, DWORD PTR _flt$[ebp]
	add	edx, 48					; 00000030H
	push	edx
	call	_dynbuf_add3
	add	esp, 36					; 00000024H
	test	eax, eax
	je	SHORT $L70241
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29872], OFFSET FLAT:$SG70245
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 46		; 0000002eH
	jmp	$eva_err$70222
$L70241:

; 48   : 			if(dyntab_sz(&tbl->srchwords, 1, 0))

	push	0
	push	1
	mov	edx, DWORD PTR _tbl$[ebp]
	add	edx, 104				; 00000068H
	push	edx
	call	_dyntab_sz
	add	esp, 12					; 0000000cH
	test	eax, eax
	je	$L70260

; 50   : 				if(flt->having) DYNBUF_ADD_STR(&flt->having, " AND ");

	mov	eax, DWORD PTR _flt$[ebp]
	cmp	DWORD PTR [eax+48], 0
	je	SHORT $L70249
	push	0
	push	0
	push	5
	push	OFFSET FLAT:$SG70250
	mov	ecx, DWORD PTR _flt$[ebp]
	add	ecx, 48					; 00000030H
	push	ecx
	call	_dynbuf_add
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L70249
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29872], OFFSET FLAT:$SG70252
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 50		; 00000032H
	jmp	$eva_err$70222
$L70249:

; 51   : 				DYNBUF_ADD3_BUF(&flt->having, "", flt->select, NO_CONV, "<'");

	mov	ecx, DWORD PTR _flt$[ebp]
	cmp	DWORD PTR [ecx+28], 0
	je	SHORT $L70715
	mov	edx, DWORD PTR _flt$[ebp]
	mov	eax, DWORD PTR [edx+28]
	mov	ecx, DWORD PTR [eax+4]
	mov	DWORD PTR -56+[ebp], ecx
	jmp	SHORT $L70716
$L70715:
	mov	DWORD PTR -56+[ebp], 0
$L70716:
	mov	edx, DWORD PTR _flt$[ebp]
	cmp	DWORD PTR [edx+28], 0
	je	SHORT $L70717
	mov	eax, DWORD PTR _flt$[ebp]
	mov	ecx, DWORD PTR [eax+28]
	add	ecx, 8
	mov	DWORD PTR -60+[ebp], ecx
	jmp	SHORT $L70718
$L70717:
	mov	DWORD PTR -60+[ebp], 0
$L70718:
	push	2
	push	OFFSET FLAT:$SG70256
	push	0
	push	0
	mov	edx, DWORD PTR -56+[ebp]
	push	edx
	mov	eax, DWORD PTR -60+[ebp]
	push	eax
	push	0
	push	OFFSET FLAT:$SG70257
	mov	ecx, DWORD PTR _flt$[ebp]
	add	ecx, 48					; 00000030H
	push	ecx
	call	_dynbuf_add3
	add	esp, 36					; 00000024H
	test	eax, eax
	je	SHORT $L70255
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29872], OFFSET FLAT:$SG70259
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 51		; 00000033H
	jmp	$eva_err$70222
$L70255:

; 52   : 				DYNBUF_ADD3_CELL(&flt->having, "", &tbl->srchwords, 1, 0, SQL_NO_QUOTE, "'");

	push	1
	push	OFFSET FLAT:$SG70261
	push	1
	push	OFFSET FLAT:_sql_no_quote
	push	0
	push	1
	mov	ecx, DWORD PTR _tbl$[ebp]
	add	ecx, 104				; 00000068H
	push	ecx
	call	_dyntab_sz
	add	esp, 12					; 0000000cH
	push	eax
	push	0
	push	1
	mov	edx, DWORD PTR _tbl$[ebp]
	add	edx, 104				; 00000068H
	push	edx
	call	_dyntab_val
	add	esp, 12					; 0000000cH
	push	eax
	push	0
	push	OFFSET FLAT:$SG70262
	mov	eax, DWORD PTR _flt$[ebp]
	add	eax, 48					; 00000030H
	push	eax
	call	_dynbuf_add3
	add	esp, 36					; 00000024H
	test	eax, eax
	je	SHORT $L70260
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29872], OFFSET FLAT:$SG70264
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 52		; 00000034H
	jmp	$eva_err$70222
$L70260:

; 55   : 		else

	jmp	$L70293
$L70223:

; 57   : 			if(flt->having) DYNBUF_ADD_STR(&flt->having, " AND ");

	mov	eax, DWORD PTR _flt$[ebp]
	cmp	DWORD PTR [eax+48], 0
	je	SHORT $L70268
	push	0
	push	0
	push	5
	push	OFFSET FLAT:$SG70269
	mov	ecx, DWORD PTR _flt$[ebp]
	add	ecx, 48					; 00000030H
	push	ecx
	call	_dynbuf_add
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L70268
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29872], OFFSET FLAT:$SG70271
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 57		; 00000039H
	jmp	$eva_err$70222
$L70268:

; 58   : 			if(tbl->srchmode == Exact)

	mov	ecx, DWORD PTR _tbl$[ebp]
	cmp	DWORD PTR [ecx+72], 6
	jne	$L70272

; 60   : 				DYNBUF_ADD3_BUF(&flt->having, "", flt->select, NO_CONV, "='");

	mov	edx, DWORD PTR _flt$[ebp]
	cmp	DWORD PTR [edx+28], 0
	je	SHORT $L70719
	mov	eax, DWORD PTR _flt$[ebp]
	mov	ecx, DWORD PTR [eax+28]
	mov	edx, DWORD PTR [ecx+4]
	mov	DWORD PTR -64+[ebp], edx
	jmp	SHORT $L70720
$L70719:
	mov	DWORD PTR -64+[ebp], 0
$L70720:
	mov	eax, DWORD PTR _flt$[ebp]
	cmp	DWORD PTR [eax+28], 0
	je	SHORT $L70721
	mov	ecx, DWORD PTR _flt$[ebp]
	mov	edx, DWORD PTR [ecx+28]
	add	edx, 8
	mov	DWORD PTR -68+[ebp], edx
	jmp	SHORT $L70722
$L70721:
	mov	DWORD PTR -68+[ebp], 0
$L70722:
	push	2
	push	OFFSET FLAT:$SG70276
	push	0
	push	0
	mov	eax, DWORD PTR -64+[ebp]
	push	eax
	mov	ecx, DWORD PTR -68+[ebp]
	push	ecx
	push	0
	push	OFFSET FLAT:$SG70277
	mov	edx, DWORD PTR _flt$[ebp]
	add	edx, 48					; 00000030H
	push	edx
	call	_dynbuf_add3
	add	esp, 36					; 00000024H
	test	eax, eax
	je	SHORT $L70275
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29872], OFFSET FLAT:$SG70279
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 60		; 0000003cH
	jmp	$eva_err$70222
$L70275:

; 61   : 				DYNBUF_ADD3_CELL(&flt->having, "", &tbl->srchwords, i_word, 0, SQL_NO_QUOTE, "'");

	push	1
	push	OFFSET FLAT:$SG70281
	push	1
	push	OFFSET FLAT:_sql_no_quote
	push	0
	mov	edx, DWORD PTR _i_word$[ebp]
	push	edx
	mov	eax, DWORD PTR _tbl$[ebp]
	add	eax, 104				; 00000068H
	push	eax
	call	_dyntab_sz
	add	esp, 12					; 0000000cH
	push	eax
	push	0
	mov	ecx, DWORD PTR _i_word$[ebp]
	push	ecx
	mov	edx, DWORD PTR _tbl$[ebp]
	add	edx, 104				; 00000068H
	push	edx
	call	_dyntab_val
	add	esp, 12					; 0000000cH
	push	eax
	push	0
	push	OFFSET FLAT:$SG70282
	mov	eax, DWORD PTR _flt$[ebp]
	add	eax, 48					; 00000030H
	push	eax
	call	_dynbuf_add3
	add	esp, 36					; 00000024H
	test	eax, eax
	je	SHORT $L70280
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29872], OFFSET FLAT:$SG70284
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 61		; 0000003dH
	jmp	$eva_err$70222
$L70280:

; 63   : 			else

	jmp	$L70293
$L70272:

; 65   : 				DYNBUF_ADD3_BUF(&flt->having, "", flt->select, NO_CONV, " LIKE '%");

	mov	eax, DWORD PTR _flt$[ebp]
	cmp	DWORD PTR [eax+28], 0
	je	SHORT $L70723
	mov	ecx, DWORD PTR _flt$[ebp]
	mov	edx, DWORD PTR [ecx+28]
	mov	eax, DWORD PTR [edx+4]
	mov	DWORD PTR -72+[ebp], eax
	jmp	SHORT $L70724
$L70723:
	mov	DWORD PTR -72+[ebp], 0
$L70724:
	mov	ecx, DWORD PTR _flt$[ebp]
	cmp	DWORD PTR [ecx+28], 0
	je	SHORT $L70725
	mov	edx, DWORD PTR _flt$[ebp]
	mov	eax, DWORD PTR [edx+28]
	add	eax, 8
	mov	DWORD PTR -76+[ebp], eax
	jmp	SHORT $L70726
$L70725:
	mov	DWORD PTR -76+[ebp], 0
$L70726:
	push	8
	push	OFFSET FLAT:$SG70289
	push	0
	push	0
	mov	ecx, DWORD PTR -72+[ebp]
	push	ecx
	mov	edx, DWORD PTR -76+[ebp]
	push	edx
	push	0
	push	OFFSET FLAT:$SG70290
	mov	eax, DWORD PTR _flt$[ebp]
	add	eax, 48					; 00000030H
	push	eax
	call	_dynbuf_add3
	add	esp, 36					; 00000024H
	test	eax, eax
	je	SHORT $L70288
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29872], OFFSET FLAT:$SG70292
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 65		; 00000041H
	jmp	$eva_err$70222
$L70288:

; 66   : 				DYNBUF_ADD3_CELL(&flt->having, "", &tbl->srchwords, i_word, 0, SQL_NO_QUOTE, "%'");

	push	2
	push	OFFSET FLAT:$SG70294
	push	1
	push	OFFSET FLAT:_sql_no_quote
	push	0
	mov	eax, DWORD PTR _i_word$[ebp]
	push	eax
	mov	ecx, DWORD PTR _tbl$[ebp]
	add	ecx, 104				; 00000068H
	push	ecx
	call	_dyntab_sz
	add	esp, 12					; 0000000cH
	push	eax
	push	0
	mov	edx, DWORD PTR _i_word$[ebp]
	push	edx
	mov	eax, DWORD PTR _tbl$[ebp]
	add	eax, 104				; 00000068H
	push	eax
	call	_dyntab_val
	add	esp, 12					; 0000000cH
	push	eax
	push	0
	push	OFFSET FLAT:$SG70295
	mov	ecx, DWORD PTR _flt$[ebp]
	add	ecx, 48					; 00000030H
	push	ecx
	call	_dynbuf_add3
	add	esp, 36					; 00000024H
	test	eax, eax
	je	SHORT $L70293
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29872], OFFSET FLAT:$SG70297
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 66		; 00000042H
	jmp	$eva_err$70222
$L70293:

; 70   : 	else

	jmp	$L70345
$L70220:

; 72   : 		/* No group function : set value node condition */
; 73   : 		QryBuilNode *node = flt->node + (flt->nbnode - 1);

	mov	ecx, DWORD PTR _flt$[ebp]
	mov	edx, DWORD PTR [ecx+4424]
	sub	edx, 1
	imul	edx, 136				; 00000088H
	mov	eax, DWORD PTR _flt$[ebp]
	lea	ecx, DWORD PTR [eax+edx+72]
	mov	DWORD PTR _node$70299[ebp], ecx

; 74   : 		if(!flt->nbnode || node->rel != RelNone) node++;

	mov	edx, DWORD PTR _flt$[ebp]
	cmp	DWORD PTR [edx+4424], 0
	je	SHORT $L70301
	mov	eax, DWORD PTR _node$70299[ebp]
	cmp	DWORD PTR [eax+52], 0
	je	SHORT $L70300
$L70301:
	mov	ecx, DWORD PTR _node$70299[ebp]
	add	ecx, 136				; 00000088H
	mov	DWORD PTR _node$70299[ebp], ecx
$L70300:

; 75   : 		node->match =	!strcmp(tbl->srchfmt, "_EVA_AGE") ||
; 76   : 						!strncmp(tbl->srchfmt, add_sz_str("_EVA_DATE")) ? InBound : IdValList;

	push	OFFSET FLAT:$SG70302
	mov	edx, DWORD PTR _tbl$[ebp]
	mov	eax, DWORD PTR [edx+128]
	push	eax
	call	_strcmp
	add	esp, 8
	test	eax, eax
	je	SHORT $L70727
	push	9
	push	OFFSET FLAT:$SG70303
	mov	ecx, DWORD PTR _tbl$[ebp]
	mov	edx, DWORD PTR [ecx+128]
	push	edx
	call	_strncmp
	add	esp, 12					; 0000000cH
	test	eax, eax
	je	SHORT $L70727
	mov	DWORD PTR -80+[ebp], 7
	jmp	SHORT $L70728
$L70727:
	mov	DWORD PTR -80+[ebp], 19			; 00000013H
$L70728:
	mov	eax, DWORD PTR _node$70299[ebp]
	mov	ecx, DWORD PTR -80+[ebp]
	mov	DWORD PTR [eax+24], ecx

; 77   : 
; 78   : 		/* Query values Id list if applicable */
; 79   : 		if(node->match == IdValList)

	mov	edx, DWORD PTR _node$70299[ebp]
	cmp	DWORD PTR [edx+24], 7
	jne	$L70326

; 81   : 			/* If query not executed (result is stored in column 1 of tbl->srchwords) */
; 82   : 			if(!dyntab_sz(&tbl->srchwords, i_word, 1))

	push	1
	mov	eax, DWORD PTR _i_word$[ebp]
	push	eax
	mov	ecx, DWORD PTR _tbl$[ebp]
	add	ecx, 104				; 00000068H
	push	ecx
	call	_dyntab_sz
	add	esp, 12					; 0000000cH
	test	eax, eax
	jne	$L70322

; 84   : 				/* Do not use IdValList if more than 1000 values matched */
; 85   : 				unsigned long limit = 1000;

	mov	DWORD PTR _limit$70306[ebp], 1000	; 000003e8H

; 86   : 				if(sql_id_values(cntxt, &data, DYNTAB_VAL_SZ(&tbl->srchwords, i_word, 0), tbl->srchmode, limit)) STACK_ERROR;

	mov	edx, DWORD PTR _limit$70306[ebp]
	push	edx
	mov	eax, DWORD PTR _tbl$[ebp]
	mov	ecx, DWORD PTR [eax+72]
	push	ecx
	push	0
	mov	edx, DWORD PTR _i_word$[ebp]
	push	edx
	mov	eax, DWORD PTR _tbl$[ebp]
	add	eax, 104				; 00000068H
	push	eax
	call	_dyntab_sz
	add	esp, 12					; 0000000cH
	push	eax
	push	0
	mov	ecx, DWORD PTR _i_word$[ebp]
	push	ecx
	mov	edx, DWORD PTR _tbl$[ebp]
	add	edx, 104				; 00000068H
	push	edx
	call	_dyntab_val
	add	esp, 12					; 0000000cH
	push	eax
	lea	eax, DWORD PTR _data$[ebp]
	push	eax
	mov	ecx, DWORD PTR _cntxt$[ebp]
	push	ecx
	call	_sql_id_values
	add	esp, 24					; 00000018H
	test	eax, eax
	je	SHORT $L70307
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 86		; 00000056H
	jmp	$eva_err$70222
$L70307:

; 87   : 				if(data.nbrows < limit)

	mov	eax, DWORD PTR _data$[ebp]
	cmp	eax, DWORD PTR _limit$70306[ebp]
	jae	$L70308

; 89   : 					if(qry_values_list(cntxt, &data, 0, &idlist)) STACK_ERROR;

	lea	ecx, DWORD PTR _idlist$[ebp]
	push	ecx
	push	0
	lea	edx, DWORD PTR _data$[ebp]
	push	edx
	mov	eax, DWORD PTR _cntxt$[ebp]
	push	eax
	call	_qry_values_list
	add	esp, 16					; 00000010H
	test	eax, eax
	je	SHORT $L70309
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 89		; 00000059H
	jmp	$eva_err$70222
$L70309:

; 90   : 					DYNTAB_ADD_BUF(&tbl->srchwords, i_word, 1, idlist);

	cmp	DWORD PTR _idlist$[ebp], 0
	je	SHORT $L70310
	mov	edx, DWORD PTR _idlist$[ebp]
	cmp	DWORD PTR [edx+4], 0
	je	SHORT $L70310
	push	0
	push	0
	mov	eax, DWORD PTR _idlist$[ebp]
	mov	ecx, DWORD PTR [eax+4]
	push	ecx
	mov	edx, DWORD PTR _idlist$[ebp]
	add	edx, 8
	push	edx
	push	1
	mov	eax, DWORD PTR _i_word$[ebp]
	push	eax
	mov	ecx, DWORD PTR _tbl$[ebp]
	add	ecx, 104				; 00000068H
	push	ecx
	call	_dyntab_add
	add	esp, 28					; 0000001cH
	test	eax, eax
	je	SHORT $L70312
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29872], OFFSET FLAT:$SG70314
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 90		; 0000005aH
	jmp	$eva_err$70222
$L70312:
	jmp	SHORT $L70318
$L70310:
	push	0
	push	0
	push	0
	push	0
	push	1
	mov	ecx, DWORD PTR _i_word$[ebp]
	push	ecx
	mov	edx, DWORD PTR _tbl$[ebp]
	add	edx, 104				; 00000068H
	push	edx
	call	_dyntab_add
	add	esp, 28					; 0000001cH
	test	eax, eax
	je	SHORT $L70318
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29872], OFFSET FLAT:$SG70320
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 90		; 0000005aH
	jmp	$eva_err$70222
$L70318:

; 92   : 				else

	jmp	SHORT $L70322
$L70308:

; 93   : 					DYNTAB_SET(&tbl->srchwords, i_word, 1, "0");

	push	1
	push	OFFSET FLAT:$SG70323
	push	1
	mov	edx, DWORD PTR _i_word$[ebp]
	push	edx
	mov	eax, DWORD PTR _tbl$[ebp]
	add	eax, 104				; 00000068H
	push	eax
	call	_dyntab_set_txt
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L70322
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29872], OFFSET FLAT:$SG70325
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 93		; 0000005dH
	jmp	$eva_err$70222
$L70322:

; 95   : 			if(!strcmp(dyntab_val(&tbl->srchwords, i_word, 1), "0")) node->match = tbl->srchmode;

	push	OFFSET FLAT:$SG70327
	push	1
	mov	eax, DWORD PTR _i_word$[ebp]
	push	eax
	mov	ecx, DWORD PTR _tbl$[ebp]
	add	ecx, 104				; 00000068H
	push	ecx
	call	_dyntab_val
	add	esp, 12					; 0000000cH
	push	eax
	call	_strcmp
	add	esp, 8
	test	eax, eax
	jne	SHORT $L70326
	mov	edx, DWORD PTR _node$70299[ebp]
	mov	eax, DWORD PTR _tbl$[ebp]
	mov	ecx, DWORD PTR [eax+72]
	mov	DWORD PTR [edx+24], ecx
$L70326:

; 97   : 
; 98   : 		if(node->match == InBound)

	mov	edx, DWORD PTR _node$70299[ebp]
	cmp	DWORD PTR [edx+24], 19			; 00000013H
	jne	$L70328

; 100  : 			DYNTAB_ADD_CELL(&node->value, 0, 0, &tbl->srchwords, 0, 0);

	push	1
	push	0
	push	0
	mov	eax, DWORD PTR _tbl$[ebp]
	add	eax, 104				; 00000068H
	push	eax
	call	_dyntab_cell
	add	esp, 12					; 0000000cH
	push	eax
	push	0
	push	0
	mov	ecx, DWORD PTR _node$70299[ebp]
	add	ecx, 32					; 00000020H
	push	ecx
	call	_dyntab_copy
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L70329
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29872], OFFSET FLAT:$SG70331
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 100		; 00000064H
	jmp	$eva_err$70222
$L70329:

; 101  : 			DYNTAB_ADD_CELL(&node->value, 1, 0, &tbl->srchwords, 1, 0);

	push	1
	push	0
	push	1
	mov	ecx, DWORD PTR _tbl$[ebp]
	add	ecx, 104				; 00000068H
	push	ecx
	call	_dyntab_cell
	add	esp, 12					; 0000000cH
	push	eax
	push	0
	push	1
	mov	edx, DWORD PTR _node$70299[ebp]
	add	edx, 32					; 00000020H
	push	edx
	call	_dyntab_copy
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L70332
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29872], OFFSET FLAT:$SG70334
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 101		; 00000065H
	jmp	$eva_err$70222
$L70332:

; 103  : 		else if(node->match == IdValList)

	jmp	$L70341
$L70328:
	mov	edx, DWORD PTR _node$70299[ebp]
	cmp	DWORD PTR [edx+24], 7
	jne	SHORT $L70336

; 105  : 			DYNTAB_ADD_CELL(&node->value, 0, 0, &tbl->srchwords, i_word, 1);

	push	1
	push	1
	mov	eax, DWORD PTR _i_word$[ebp]
	push	eax
	mov	ecx, DWORD PTR _tbl$[ebp]
	add	ecx, 104				; 00000068H
	push	ecx
	call	_dyntab_cell
	add	esp, 12					; 0000000cH
	push	eax
	push	0
	push	0
	mov	edx, DWORD PTR _node$70299[ebp]
	add	edx, 32					; 00000020H
	push	edx
	call	_dyntab_copy
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L70337
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29872], OFFSET FLAT:$SG70339
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 105		; 00000069H
	jmp	$eva_err$70222
$L70337:

; 107  : 		else

	jmp	SHORT $L70341
$L70336:

; 109  : 			DYNTAB_ADD_CELL(&node->value, 0, 0, &tbl->srchwords, i_word, 0);

	push	1
	push	0
	mov	edx, DWORD PTR _i_word$[ebp]
	push	edx
	mov	eax, DWORD PTR _tbl$[ebp]
	add	eax, 104				; 00000068H
	push	eax
	call	_dyntab_cell
	add	esp, 12					; 0000000cH
	push	eax
	push	0
	push	0
	mov	ecx, DWORD PTR _node$70299[ebp]
	add	ecx, 32					; 00000020H
	push	ecx
	call	_dyntab_copy
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L70341
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29872], OFFSET FLAT:$SG70343
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 109		; 0000006dH
	jmp	SHORT $eva_err$70222
$L70341:

; 111  : 		if(node->modif == F_None) node->modif = F_Value;

	mov	ecx, DWORD PTR _node$70299[ebp]
	cmp	DWORD PTR [ecx+20], 0
	jne	SHORT $L70344
	mov	edx, DWORD PTR _node$70299[ebp]
	mov	DWORD PTR [edx+20], 6
$L70344:

; 112  : 		if(qry_build_clauses(cntxt, flt, 1)) STACK_ERROR;

	push	1
	mov	eax, DWORD PTR _flt$[ebp]
	push	eax
	mov	ecx, DWORD PTR _cntxt$[ebp]
	push	ecx
	call	_qry_build_clauses
	add	esp, 12					; 0000000cH
	test	eax, eax
	je	SHORT $L70345
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 112		; 00000070H
	jmp	SHORT $eva_err$70222
$L70345:
$eva_noerr$70346:

; 114  : 
; 115  : 	RETURN_OK_CLEANUP;

	push	0
	push	OFFSET FLAT:$SG70347
	push	OFFSET FLAT:$SG70348
	mov	eax, DWORD PTR _cntxt$[ebp]
	push	eax
	call	_err_clear
	add	esp, 16					; 00000010H
$eva_err$70222:
	mov	ecx, DWORD PTR _cntxt$[ebp]
	cmp	DWORD PTR [ecx+29872], 0
	je	SHORT $L70349
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	eax, DWORD PTR [edx+29900]
	push	eax
	push	OFFSET FLAT:$SG70350
	push	OFFSET FLAT:$SG70351
	mov	ecx, DWORD PTR _cntxt$[ebp]
	push	ecx
	call	_err_add_context
	add	esp, 16					; 00000010H
$L70349:
	lea	edx, DWORD PTR _data$[ebp]
	push	edx
	call	_dyntab_free
	add	esp, 4
	mov	eax, DWORD PTR _idlist$[ebp]
	push	eax
	call	_mem_free
	add	esp, 4
	mov	DWORD PTR _idlist$[ebp], 0
	mov	ecx, DWORD PTR _cntxt$[ebp]
	xor	eax, eax
	cmp	DWORD PTR [ecx+29872], 0
	setne	al

; 116  : }

	mov	esp, ebp
	pop	ebp
	ret	0
_table_search_set_node ENDP
_TEXT	ENDS
PUBLIC	__real@8@3ffbccccccccccccd000
PUBLIC	_table_add_flt_idlist
EXTRN	__fltused:NEAR
EXTRN	_sql_exec_query:NEAR
EXTRN	_qry_build_flt_select:NEAR
EXTRN	_err_print_filter:NEAR
_DATA	SEGMENT
	ORG $+2
$SG70374 DB	'CREATE TEMPORARY TABLE IdListMatch TYPE=HEAP', 0aH, 00H
	ORG $+2
$SG70376 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70381 DB	' (IdObj)', 0aH, 00H
	ORG $+2
$SG70382 DB	'IdListMatch', 00H
$SG70383 DB	'IdList', 00H
	ORG $+1
$SG70384 DB	'INSERT INTO ', 00H
	ORG $+3
$SG70386 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70393 DB	'DROP TABLE IdList', 00H
	ORG $+2
$SG70394 DB	'CREATE TEMPORARY TABLE IdList TYPE=HEAP SELECT DISTINCT '
	DB	'IdObj FROM IdListMatch', 00H
	ORG $+1
$SG70395 DB	'ALTER TABLE IdList ADD INDEX (IdObj)', 00H
	ORG $+3
$SG70396 DB	'DROP TABLE IdListMatch', 00H
	ORG $+1
$SG70398 DB	'D:\Travail\ABI\EVA\V4.0\CGI\Brunix-2016\table_search.c', 00H
	ORG $+1
$SG70399 DB	'table_add_flt_idlist', 00H
	ORG $+3
$SG70401 DB	'D:\Travail\ABI\EVA\V4.0\CGI\Brunix-2016\table_search.c', 00H
	ORG $+1
$SG70402 DB	'table_add_flt_idlist', 00H
_DATA	ENDS
;	COMDAT __real@8@3ffbccccccccccccd000
; File D:\Travail\ABI\EVA\V4.0\CGI\Brunix-2016\table_search.c
CONST	SEGMENT
__real@8@3ffbccccccccccccd000 DQ 03fb999999999999ar ; 0.1
CONST	ENDS
_TEXT	SEGMENT
_cntxt$ = 8
_i_ctrl$ = 12
_flt$ = 16
_mode$ = 20
_form$ = -8
_ctrl$ = -36
_tbl$ = -12
_sql$ = -4
_empty$ = -32
_table_add_flt_idlist PROC NEAR

; 135  : ){

	push	ebp
	mov	ebp, esp
	sub	esp, 48					; 00000030H

; 136  : 	EVA_form *form = cntxt->form;

	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	ecx, DWORD PTR [eax+80]
	mov	DWORD PTR _form$[ebp], ecx

; 137  : 	EVA_ctrl *ctrl = form->ctrl + i_ctrl;

	mov	edx, DWORD PTR _i_ctrl$[ebp]
	imul	edx, 480				; 000001e0H
	mov	eax, DWORD PTR _form$[ebp]
	mov	ecx, DWORD PTR [eax]
	add	ecx, edx
	mov	DWORD PTR _ctrl$[ebp], ecx

; 138  : 	ObjTableFormat *tbl = ctrl->objtbl;

	mov	edx, DWORD PTR _ctrl$[ebp]
	mov	eax, DWORD PTR [edx+232]
	mov	DWORD PTR _tbl$[ebp], eax

; 139  : 	DynBuffer *sql = NULL;

	mov	DWORD PTR _sql$[ebp], 0

; 140  : 	DynTable empty = {0};

	mov	DWORD PTR _empty$[ebp], 0
	xor	ecx, ecx
	mov	DWORD PTR _empty$[ebp+4], ecx
	mov	DWORD PTR _empty$[ebp+8], ecx
	mov	DWORD PTR _empty$[ebp+12], ecx
	mov	DWORD PTR _empty$[ebp+16], ecx

; 141  : 	M_FREE(flt->select);

	mov	edx, DWORD PTR _flt$[ebp]
	mov	eax, DWORD PTR [edx+28]
	push	eax
	call	_mem_free
	add	esp, 4
	mov	ecx, DWORD PTR _flt$[ebp]
	mov	DWORD PTR [ecx+28], 0

; 142  : 	M_FREE(flt->optselect);

	mov	edx, DWORD PTR _flt$[ebp]
	mov	eax, DWORD PTR [edx+32]
	push	eax
	call	_mem_free
	add	esp, 4
	mov	ecx, DWORD PTR _flt$[ebp]
	mov	DWORD PTR [ecx+32], 0

; 143  : 	M_FREE(flt->orderby);

	mov	edx, DWORD PTR _flt$[ebp]
	mov	eax, DWORD PTR [edx+52]
	push	eax
	call	_mem_free
	add	esp, 4
	mov	ecx, DWORD PTR _flt$[ebp]
	mov	DWORD PTR [ecx+52], 0

; 144  : 	M_FREE(sql);

	mov	edx, DWORD PTR _sql$[ebp]
	push	edx
	call	_mem_free
	add	esp, 4
	mov	DWORD PTR _sql$[ebp], 0

; 145  : 	if(mode == 3)

	cmp	DWORD PTR _mode$[ebp], 3
	jne	SHORT $L70371

; 146  : 		DYNBUF_ADD_STR(&sql, "CREATE TEMPORARY TABLE IdListMatch TYPE=HEAP\n")

	push	0
	push	0
	push	45					; 0000002dH
	push	OFFSET FLAT:$SG70374
	lea	eax, DWORD PTR _sql$[ebp]
	push	eax
	call	_dynbuf_add
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L70373
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29872], OFFSET FLAT:$SG70376
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 146		; 00000092H
	jmp	$eva_err$70377
$L70373:

; 147  : 	else

	jmp	SHORT $L70380
$L70371:

; 148  : 		DYNBUF_ADD3(&sql, "INSERT INTO ", mode >= 2 ? "IdListMatch" : "IdList", 0, NO_CONV, " (IdObj)\n");

	cmp	DWORD PTR _mode$[ebp], 2
	jl	SHORT $L70730
	mov	DWORD PTR -40+[ebp], OFFSET FLAT:$SG70382
	jmp	SHORT $L70731
$L70730:
	mov	DWORD PTR -40+[ebp], OFFSET FLAT:$SG70383
$L70731:
	push	9
	push	OFFSET FLAT:$SG70381
	push	0
	push	0
	push	0
	mov	eax, DWORD PTR -40+[ebp]
	push	eax
	push	12					; 0000000cH
	push	OFFSET FLAT:$SG70384
	lea	ecx, DWORD PTR _sql$[ebp]
	push	ecx
	call	_dynbuf_add3
	add	esp, 36					; 00000024H
	test	eax, eax
	je	SHORT $L70380
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29872], OFFSET FLAT:$SG70386
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 148		; 00000094H
	jmp	$eva_err$70377
$L70380:

; 149  : 	if(	qry_build_flt_select(cntxt, &sql, mode >= 2 ? NULL : &empty, flt,
; 150  : 								mode == 1 ? tbl->line : 0,
; 151  : 								mode == 1 ? tbl->lines : 0) ||
; 152  : 		sql_exec_query(cntxt, sql->data))

	cmp	DWORD PTR _mode$[ebp], 1
	jne	SHORT $L70732
	mov	ecx, DWORD PTR _tbl$[ebp]
	mov	edx, DWORD PTR [ecx+44]
	mov	DWORD PTR -44+[ebp], edx
	jmp	SHORT $L70733
$L70732:
	mov	DWORD PTR -44+[ebp], 0
$L70733:
	cmp	DWORD PTR _mode$[ebp], 1
	jne	SHORT $L70734
	mov	eax, DWORD PTR _tbl$[ebp]
	mov	ecx, DWORD PTR [eax+40]
	mov	DWORD PTR -48+[ebp], ecx
	jmp	SHORT $L70735
$L70734:
	mov	DWORD PTR -48+[ebp], 0
$L70735:
	mov	edx, DWORD PTR -44+[ebp]
	push	edx
	mov	eax, DWORD PTR -48+[ebp]
	push	eax
	mov	ecx, DWORD PTR _flt$[ebp]
	push	ecx
	xor	edx, edx
	cmp	DWORD PTR _mode$[ebp], 2
	setge	dl
	dec	edx
	lea	eax, DWORD PTR _empty$[ebp]
	and	edx, eax
	push	edx
	lea	ecx, DWORD PTR _sql$[ebp]
	push	ecx
	mov	edx, DWORD PTR _cntxt$[ebp]
	push	edx
	call	_qry_build_flt_select
	add	esp, 24					; 00000018H
	test	eax, eax
	jne	SHORT $L70389
	mov	eax, DWORD PTR _sql$[ebp]
	add	eax, 8
	push	eax
	mov	ecx, DWORD PTR _cntxt$[ebp]
	push	ecx
	call	_sql_exec_query
	add	esp, 8
	test	eax, eax
	je	SHORT $L70388
$L70389:

; 153  : 		STACK_ERROR_INFO(err_print_filter(&cntxt->debug_msg, flt));

	mov	edx, DWORD PTR _flt$[ebp]
	push	edx
	mov	eax, DWORD PTR _cntxt$[ebp]
	add	eax, 29864				; 000074a8H
	push	eax
	call	_err_print_filter
	add	esp, 8
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 153		; 00000099H
	jmp	$eva_err$70377
$L70388:

; 154  : 	if(cntxt->debug & DEBUG_SQL_SLOW && cntxt->sql_restime > DEBUG_SQL_SLOW_TH) err_print_filter(&cntxt->debug_msg, flt);

	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	eax, DWORD PTR [edx+29860]
	and	eax, 64					; 00000040H
	test	eax, eax
	je	SHORT $L70390
	mov	ecx, DWORD PTR _cntxt$[ebp]
	fld	QWORD PTR [ecx+29840]
	fcomp	QWORD PTR __real@8@3ffbccccccccccccd000
	fnstsw	ax
	test	ah, 65					; 00000041H
	jne	SHORT $L70390
	mov	edx, DWORD PTR _flt$[ebp]
	push	edx
	mov	eax, DWORD PTR _cntxt$[ebp]
	add	eax, 29864				; 000074a8H
	push	eax
	call	_err_print_filter
	add	esp, 8
$L70390:

; 155  : 
; 156  : 	/* Store # of lines in table */
; 157  : 	tbl->totlines = cntxt->sql_nbrows;

	mov	ecx, DWORD PTR _tbl$[ebp]
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	eax, DWORD PTR [edx+29848]
	mov	DWORD PTR [ecx+52], eax

; 158  : 
; 159  : 	/* Rename table if applicable */
; 160  : 	if(mode == 3 && (
; 161  : 		sql_exec_query(cntxt, "DROP TABLE IdList") ||
; 162  : 		sql_exec_query(cntxt, "CREATE TEMPORARY TABLE IdList TYPE=HEAP SELECT DISTINCT IdObj FROM IdListMatch") ||
; 163  : 		sql_exec_query(cntxt, "ALTER TABLE IdList ADD INDEX (IdObj)") ||
; 164  : 		sql_exec_query(cntxt, "DROP TABLE IdListMatch"))) STACK_ERROR;

	cmp	DWORD PTR _mode$[ebp], 3
	jne	SHORT $eva_noerr$70397
	push	OFFSET FLAT:$SG70393
	mov	ecx, DWORD PTR _cntxt$[ebp]
	push	ecx
	call	_sql_exec_query
	add	esp, 8
	test	eax, eax
	jne	SHORT $L70392
	push	OFFSET FLAT:$SG70394
	mov	edx, DWORD PTR _cntxt$[ebp]
	push	edx
	call	_sql_exec_query
	add	esp, 8
	test	eax, eax
	jne	SHORT $L70392
	push	OFFSET FLAT:$SG70395
	mov	eax, DWORD PTR _cntxt$[ebp]
	push	eax
	call	_sql_exec_query
	add	esp, 8
	test	eax, eax
	jne	SHORT $L70392
	push	OFFSET FLAT:$SG70396
	mov	ecx, DWORD PTR _cntxt$[ebp]
	push	ecx
	call	_sql_exec_query
	add	esp, 8
	test	eax, eax
	je	SHORT $eva_noerr$70397
$L70392:
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 164		; 000000a4H
	jmp	SHORT $eva_err$70377
$eva_noerr$70397:

; 165  : 
; 166  : 	RETURN_OK_CLEANUP;

	push	0
	push	OFFSET FLAT:$SG70398
	push	OFFSET FLAT:$SG70399
	mov	eax, DWORD PTR _cntxt$[ebp]
	push	eax
	call	_err_clear
	add	esp, 16					; 00000010H
$eva_err$70377:
	mov	ecx, DWORD PTR _cntxt$[ebp]
	cmp	DWORD PTR [ecx+29872], 0
	je	SHORT $L70400
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	eax, DWORD PTR [edx+29900]
	push	eax
	push	OFFSET FLAT:$SG70401
	push	OFFSET FLAT:$SG70402
	mov	ecx, DWORD PTR _cntxt$[ebp]
	push	ecx
	call	_err_add_context
	add	esp, 16					; 00000010H
$L70400:
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

; 167  : }

	mov	esp, ebp
	pop	ebp
	ret	0
_table_add_flt_idlist ENDP
_TEXT	ENDS
PUBLIC	_table_search_filter
EXTRN	__chkstk:NEAR
EXTRN	_sql_drop_table:NEAR
EXTRN	_strchr:NEAR
EXTRN	_qry_eval_sql_fieldexpr:NEAR
EXTRN	_qry_build_free:NEAR
EXTRN	_strrchr:NEAR
EXTRN	_qry_add_filter:NEAR
EXTRN	_qry_parse_matchmode:NEAR
EXTRN	_qry_parse_fieldexpr_nodes:NEAR
_DATA	SEGMENT
	ORG $+3
$SG70425 DB	'CREATE TEMPORARY TABLE IdListMatch (IdObj INT NOT NULL) '
	DB	'TYPE=HEAP', 00H
	ORG $+2
$SG70439 DB	'INSERT INTO IdListMatch (IdObj) SELECT DISTINCT IdObj FR'
	DB	'OM ValList WHERE ', 00H
	ORG $+2
$SG70441 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70444 DB	'_EVA_AGE', 00H
	ORG $+3
$SG70445 DB	'_EVA_DATE', 00H
	ORG $+2
$SG70448 DB	'Val', 00H
$SG70452 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70455 DB	'Val', 00H
$SG70459 DB	'IdList', 00H
	ORG $+1
$SG70460 DB	'ValList', 00H
$SG70463 DB	'ALTER TABLE ValList MODIFY Val TEXT', 00H
$SG70464 DB	'ValList', 00H
$SG70473 DB	'.IdWhoCr', 00H
	ORG $+3
$SG70474 DB	'.IdWhoDel', 00H
	ORG $+2
$SG70475 DB	'.WhoCr', 00H
	ORG $+1
$SG70476 DB	'.WhoDel', 00H
$SG70477 DB	'.IdObj', 00H
	ORG $+1
$SG70478 DB	'.IdRelObj', 00H
	ORG $+2
$SG70479 DB	'.Obj', 00H
	ORG $+3
$SG70480 DB	'.RelObj', 00H
$SG70485 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70489 DB	'_EVA_DOCUMENT', 00H
	ORG $+2
$SG70491 DB	'.IdObj', 00H
	ORG $+1
$SG70494 DB	'->_EVA_FILE_CLIENT_PATH.Value', 00H
	ORG $+2
$SG70496 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70499 DB	'_EVA_RELATION', 00H
	ORG $+2
$SG70502 DB	'->.Value', 00H
	ORG $+3
$SG70504 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70509 DB	'.Value', 00H
	ORG $+1
$SG70511 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70514 DB	'D:\Travail\ABI\EVA\V4.0\CGI\Brunix-2016\table_search.c', 00H
	ORG $+1
$SG70515 DB	'table_search_filter', 00H
$SG70523 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70526 DB	'D:\Travail\ABI\EVA\V4.0\CGI\Brunix-2016\table_search.c', 00H
	ORG $+1
$SG70527 DB	'table_search_filter', 00H
$SG70535 DB	'DROP TABLE IdList', 00H
	ORG $+2
$SG70536 DB	'CREATE TEMPORARY TABLE IdList TYPE=HEAP SELECT DISTINCT '
	DB	'IdObj FROM IdListMatch', 00H
	ORG $+1
$SG70537 DB	'ALTER TABLE IdList ADD INDEX (IdObj)', 00H
	ORG $+3
$SG70538 DB	'IdListMatch', 00H
$SG70540 DB	'D:\Travail\ABI\EVA\V4.0\CGI\Brunix-2016\table_search.c', 00H
	ORG $+1
$SG70541 DB	'table_search_filter', 00H
$SG70543 DB	'D:\Travail\ABI\EVA\V4.0\CGI\Brunix-2016\table_search.c', 00H
	ORG $+1
$SG70544 DB	'table_search_filter', 00H
_DATA	ENDS
_TEXT	SEGMENT
_cntxt$ = 8
_i_ctrl$ = 12
_i_word$ = 16
_form$ = -8
_ctrl$ = -4500
_tbl$ = -16
_flt$ = -4496
_fields$ = -36
_expr$ = -12
_sql$ = -4
_i_col$ = -40
_c$70433 = -4504
_bracket$70434 = -4508
_dotsep$70466 = -4524
_relop$70468 = -4512
_groupfn$70470 = -4520
_b_reldotsep$70472 = -4516
__c$70481 = -4528
_j$70517 = -4532
_table_search_filter PROC NEAR

; 184  : ){

	push	ebp
	mov	ebp, esp
	mov	eax, 4560				; 000011d0H
	call	__chkstk
	push	edi

; 185  : 	EVA_form *form = cntxt->form;

	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	ecx, DWORD PTR [eax+80]
	mov	DWORD PTR _form$[ebp], ecx

; 186  : 	EVA_ctrl *ctrl = form->ctrl + i_ctrl;

	mov	edx, DWORD PTR _i_ctrl$[ebp]
	imul	edx, 480				; 000001e0H
	mov	eax, DWORD PTR _form$[ebp]
	mov	ecx, DWORD PTR [eax]
	add	ecx, edx
	mov	DWORD PTR _ctrl$[ebp], ecx

; 187  : 	ObjTableFormat *tbl = ctrl->objtbl;

	mov	edx, DWORD PTR _ctrl$[ebp]
	mov	eax, DWORD PTR [edx+232]
	mov	DWORD PTR _tbl$[ebp], eax

; 188  : 	QryBuild flt = { {0} };

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

; 189  : 	DynTable fields = {0};

	mov	DWORD PTR _fields$[ebp], 0
	xor	edx, edx
	mov	DWORD PTR _fields$[ebp+4], edx
	mov	DWORD PTR _fields$[ebp+8], edx
	mov	DWORD PTR _fields$[ebp+12], edx
	mov	DWORD PTR _fields$[ebp+16], edx

; 190  : 	DynBuffer *expr = NULL;

	mov	DWORD PTR _expr$[ebp], 0

; 191  : 	DynBuffer *sql = NULL;

	mov	DWORD PTR _sql$[ebp], 0

; 192  : 	unsigned long i_col;
; 193  : 
; 194  : 	/* Create temporary IdListMatch table */
; 195  : 	if(sql_exec_query(cntxt, "CREATE TEMPORARY TABLE IdListMatch (IdObj INT NOT NULL) TYPE=HEAP"))

	push	OFFSET FLAT:$SG70425
	mov	eax, DWORD PTR _cntxt$[ebp]
	push	eax
	call	_sql_exec_query
	add	esp, 8
	test	eax, eax
	je	SHORT $L70424

; 196  : 		STACK_ERROR;

	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 196		; 000000c4H
	jmp	$eva_err$70426
$L70424:

; 197  : 	if(!tbl->srchmode) tbl->srchmode = Contain;

	mov	edx, DWORD PTR _tbl$[ebp]
	cmp	DWORD PTR [edx+72], 0
	jne	SHORT $L70427
	mov	eax, DWORD PTR _tbl$[ebp]
	mov	DWORD PTR [eax+72], 11			; 0000000bH
$L70427:

; 198  : 
; 199  : 	/* Build query clauses for non trivial field expression of selected search columns */
; 200  : 	if(tbl->srchwords.nbrows)

	mov	ecx, DWORD PTR _tbl$[ebp]
	cmp	DWORD PTR [ecx+104], 0
	je	$L70431

; 201  : 		for(i_col = 0; i_col < tbl->field.nbrows; i_col++)

	mov	DWORD PTR _i_col$[ebp], 0
	jmp	SHORT $L70429
$L70430:
	mov	edx, DWORD PTR _i_col$[ebp]
	add	edx, 1
	mov	DWORD PTR _i_col$[ebp], edx
$L70429:
	mov	eax, DWORD PTR _tbl$[ebp]
	mov	ecx, DWORD PTR _i_col$[ebp]
	cmp	ecx, DWORD PTR [eax+380]
	jae	$L70431

; 202  : 			if(tbl->srchcol & (1 << i_col))

	mov	edx, 1
	mov	ecx, DWORD PTR _i_col$[ebp]
	shl	edx, cl
	mov	eax, DWORD PTR _tbl$[ebp]
	mov	ecx, DWORD PTR [eax+124]
	and	ecx, edx
	test	ecx, ecx
	je	$L70524

; 204  : 		DynTableCell *c = dyntab_cell(&tbl->field, i_col, 0);

	push	0
	mov	edx, DWORD PTR _i_col$[ebp]
	push	edx
	mov	eax, DWORD PTR _tbl$[ebp]
	add	eax, 380				; 0000017cH
	push	eax
	call	_dyntab_cell
	add	esp, 12					; 0000000cH
	mov	DWORD PTR _c$70433[ebp], eax

; 205  : 		char *bracket = c && c->txt ? strchr(c->txt, '[') : NULL;

	cmp	DWORD PTR _c$70433[ebp], 0
	je	SHORT $L70740
	mov	ecx, DWORD PTR _c$70433[ebp]
	cmp	DWORD PTR [ecx], 0
	je	SHORT $L70740
	push	91					; 0000005bH
	mov	edx, DWORD PTR _c$70433[ebp]
	mov	eax, DWORD PTR [edx]
	push	eax
	call	_strchr
	add	esp, 8
	mov	DWORD PTR -4536+[ebp], eax
	jmp	SHORT $L70741
$L70740:
	mov	DWORD PTR -4536+[ebp], 0
$L70741:
	mov	ecx, DWORD PTR -4536+[ebp]
	mov	DWORD PTR _bracket$70434[ebp], ecx

; 206  : 		if(bracket)

	cmp	DWORD PTR _bracket$70434[ebp], 0
	je	$L70436

; 208  : 			/* Handle SQL expression : check search format */
; 209  : 			M_FREE(sql);

	mov	edx, DWORD PTR _sql$[ebp]
	push	edx
	call	_mem_free
	add	esp, 4
	mov	DWORD PTR _sql$[ebp], 0

; 210  : 			DYNBUF_ADD_STR(&sql, "INSERT INTO IdListMatch (IdObj) SELECT DISTINCT IdObj FROM ValList WHERE ");

	push	0
	push	0
	push	73					; 00000049H
	push	OFFSET FLAT:$SG70439
	lea	eax, DWORD PTR _sql$[ebp]
	push	eax
	call	_dynbuf_add
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L70438
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29872], OFFSET FLAT:$SG70441
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 210		; 000000d2H
	jmp	$eva_err$70426
$L70438:

; 211  : 			if(!strcmp(tbl->srchfmt, "_EVA_AGE") || !strncmp(tbl->srchfmt, add_sz_str("_EVA_DATE")))

	push	OFFSET FLAT:$SG70444
	mov	eax, DWORD PTR _tbl$[ebp]
	mov	ecx, DWORD PTR [eax+128]
	push	ecx
	call	_strcmp
	add	esp, 8
	test	eax, eax
	je	SHORT $L70443
	push	9
	push	OFFSET FLAT:$SG70445
	mov	edx, DWORD PTR _tbl$[ebp]
	mov	eax, DWORD PTR [edx+128]
	push	eax
	call	_strncmp
	add	esp, 12					; 0000000cH
	test	eax, eax
	jne	SHORT $L70442
$L70443:

; 213  : 				if(qry_parse_matchmode(cntxt, &sql, "Val", ~0UL, tbl->srchwords.nbrows > 1 ? InBound : Begin, 0, &tbl->srchwords, NULL)) STACK_ERROR;

	push	0
	mov	ecx, DWORD PTR _tbl$[ebp]
	add	ecx, 104				; 00000068H
	push	ecx
	push	0
	mov	edx, DWORD PTR _tbl$[ebp]
	mov	eax, 1
	cmp	eax, DWORD PTR [edx+104]
	sbb	ecx, ecx
	and	ecx, 6
	add	ecx, 13					; 0000000dH
	push	ecx
	push	-1
	push	OFFSET FLAT:$SG70448
	lea	edx, DWORD PTR _sql$[ebp]
	push	edx
	mov	eax, DWORD PTR _cntxt$[ebp]
	push	eax
	call	_qry_parse_matchmode
	add	esp, 32					; 00000020H
	test	eax, eax
	je	SHORT $L70447
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 213		; 000000d5H
	jmp	$eva_err$70426
$L70447:

; 215  : 			else

	jmp	$L70454
$L70442:

; 217  : 				DYNTAB_ADD_CELL(&fields, 0, 0, &tbl->srchwords, i_word, 0);

	push	1
	push	0
	mov	edx, DWORD PTR _i_word$[ebp]
	push	edx
	mov	eax, DWORD PTR _tbl$[ebp]
	add	eax, 104				; 00000068H
	push	eax
	call	_dyntab_cell
	add	esp, 12					; 0000000cH
	push	eax
	push	0
	push	0
	lea	ecx, DWORD PTR _fields$[ebp]
	push	ecx
	call	_dyntab_copy
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L70450
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29872], OFFSET FLAT:$SG70452
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 217		; 000000d9H
	jmp	$eva_err$70426
$L70450:

; 218  : 				if(qry_parse_matchmode(cntxt, &sql, "Val", ~0UL, tbl->srchmode, 0, &fields, NULL)) STACK_ERROR;

	push	0
	lea	ecx, DWORD PTR _fields$[ebp]
	push	ecx
	push	0
	mov	edx, DWORD PTR _tbl$[ebp]
	mov	eax, DWORD PTR [edx+72]
	push	eax
	push	-1
	push	OFFSET FLAT:$SG70455
	lea	ecx, DWORD PTR _sql$[ebp]
	push	ecx
	mov	edx, DWORD PTR _cntxt$[ebp]
	push	edx
	call	_qry_parse_matchmode
	add	esp, 32					; 00000020H
	test	eax, eax
	je	SHORT $L70454
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 218		; 000000daH
	jmp	$eva_err$70426
$L70454:

; 220  : 			if(sql && c->len)

	cmp	DWORD PTR _sql$[ebp], 0
	je	$L70456
	mov	ecx, DWORD PTR _c$70433[ebp]
	cmp	DWORD PTR [ecx+4], 0
	je	$L70456

; 222  : 				if(qry_eval_sql_fieldexpr(cntxt, "ValList", c->txt, "IdList", NULL)) STACK_ERROR;

	push	0
	push	OFFSET FLAT:$SG70459
	mov	edx, DWORD PTR _c$70433[ebp]
	mov	eax, DWORD PTR [edx]
	push	eax
	push	OFFSET FLAT:$SG70460
	mov	ecx, DWORD PTR _cntxt$[ebp]
	push	ecx
	call	_qry_eval_sql_fieldexpr
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L70458
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 222		; 000000deH
	jmp	$eva_err$70426
$L70458:

; 223  : 				if(sql_exec_query(cntxt, "ALTER TABLE ValList MODIFY Val TEXT") ||
; 224  : 					sql_exec_query(cntxt, sql->data)) STACK_ERROR;

	push	OFFSET FLAT:$SG70463
	mov	eax, DWORD PTR _cntxt$[ebp]
	push	eax
	call	_sql_exec_query
	add	esp, 8
	test	eax, eax
	jne	SHORT $L70462
	mov	ecx, DWORD PTR _sql$[ebp]
	add	ecx, 8
	push	ecx
	mov	edx, DWORD PTR _cntxt$[ebp]
	push	edx
	call	_sql_exec_query
	add	esp, 8
	test	eax, eax
	je	SHORT $L70461
$L70462:
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 224		; 000000e0H
	jmp	$eva_err$70426
$L70461:

; 225  : 				sql_drop_table(cntxt, "ValList");

	push	OFFSET FLAT:$SG70464
	mov	ecx, DWORD PTR _cntxt$[ebp]
	push	ecx
	call	_sql_drop_table
	add	esp, 8
$L70456:

; 228  : 		else

	jmp	$L70524
$L70436:

; 230  : 			char *dotsep = c && c->txt ? strrchr(c->txt, '.') : NULL;

	cmp	DWORD PTR _c$70433[ebp], 0
	je	SHORT $L70742
	mov	edx, DWORD PTR _c$70433[ebp]
	cmp	DWORD PTR [edx], 0
	je	SHORT $L70742
	push	46					; 0000002eH
	mov	eax, DWORD PTR _c$70433[ebp]
	mov	ecx, DWORD PTR [eax]
	push	ecx
	call	_strrchr
	add	esp, 8
	mov	DWORD PTR -4540+[ebp], eax
	jmp	SHORT $L70743
$L70742:
	mov	DWORD PTR -4540+[ebp], 0
$L70743:
	mov	edx, DWORD PTR -4540+[ebp]
	mov	DWORD PTR _dotsep$70466[ebp], edx

; 231  : 			char *relop = c && c->txt ? strrchr(c->txt, '-') : NULL;

	cmp	DWORD PTR _c$70433[ebp], 0
	je	SHORT $L70744
	mov	eax, DWORD PTR _c$70433[ebp]
	cmp	DWORD PTR [eax], 0
	je	SHORT $L70744
	push	45					; 0000002dH
	mov	ecx, DWORD PTR _c$70433[ebp]
	mov	edx, DWORD PTR [ecx]
	push	edx
	call	_strrchr
	add	esp, 8
	mov	DWORD PTR -4544+[ebp], eax
	jmp	SHORT $L70745
$L70744:
	mov	DWORD PTR -4544+[ebp], 0
$L70745:
	mov	eax, DWORD PTR -4544+[ebp]
	mov	DWORD PTR _relop$70468[ebp], eax

; 232  : 			char *groupfn = c && c->txt ? strchr(c->txt, '(') : NULL;

	cmp	DWORD PTR _c$70433[ebp], 0
	je	SHORT $L70746
	mov	ecx, DWORD PTR _c$70433[ebp]
	cmp	DWORD PTR [ecx], 0
	je	SHORT $L70746
	push	40					; 00000028H
	mov	edx, DWORD PTR _c$70433[ebp]
	mov	eax, DWORD PTR [edx]
	push	eax
	call	_strchr
	add	esp, 8
	mov	DWORD PTR -4548+[ebp], eax
	jmp	SHORT $L70747
$L70746:
	mov	DWORD PTR -4548+[ebp], 0
$L70747:
	mov	ecx, DWORD PTR -4548+[ebp]
	mov	DWORD PTR _groupfn$70470[ebp], ecx

; 233  : 			int b_reldotsep = dotsep && (!strcmp(".IdWhoCr", dotsep) ||
; 234  : 										 !strcmp(".IdWhoDel", dotsep) ||
; 235  : 										 !strcmp(".WhoCr", dotsep) ||
; 236  : 										 !strcmp(".WhoDel", dotsep) ||
; 237  : 										 !strcmp(".IdObj", dotsep) ||
; 238  : 										 !strcmp(".IdRelObj", dotsep) ||
; 239  : 										 !strcmp(".Obj", dotsep) ||
; 240  : 										 !strcmp(".RelObj", dotsep));

	cmp	DWORD PTR _dotsep$70466[ebp], 0
	je	$L70749
	mov	edx, DWORD PTR _dotsep$70466[ebp]
	push	edx
	push	OFFSET FLAT:$SG70473
	call	_strcmp
	add	esp, 8
	test	eax, eax
	je	$L70748
	mov	eax, DWORD PTR _dotsep$70466[ebp]
	push	eax
	push	OFFSET FLAT:$SG70474
	call	_strcmp
	add	esp, 8
	test	eax, eax
	je	$L70748
	mov	ecx, DWORD PTR _dotsep$70466[ebp]
	push	ecx
	push	OFFSET FLAT:$SG70475
	call	_strcmp
	add	esp, 8
	test	eax, eax
	je	SHORT $L70748
	mov	edx, DWORD PTR _dotsep$70466[ebp]
	push	edx
	push	OFFSET FLAT:$SG70476
	call	_strcmp
	add	esp, 8
	test	eax, eax
	je	SHORT $L70748
	mov	eax, DWORD PTR _dotsep$70466[ebp]
	push	eax
	push	OFFSET FLAT:$SG70477
	call	_strcmp
	add	esp, 8
	test	eax, eax
	je	SHORT $L70748
	mov	ecx, DWORD PTR _dotsep$70466[ebp]
	push	ecx
	push	OFFSET FLAT:$SG70478
	call	_strcmp
	add	esp, 8
	test	eax, eax
	je	SHORT $L70748
	mov	edx, DWORD PTR _dotsep$70466[ebp]
	push	edx
	push	OFFSET FLAT:$SG70479
	call	_strcmp
	add	esp, 8
	test	eax, eax
	je	SHORT $L70748
	mov	eax, DWORD PTR _dotsep$70466[ebp]
	push	eax
	push	OFFSET FLAT:$SG70480
	call	_strcmp
	add	esp, 8
	test	eax, eax
	jne	SHORT $L70749
$L70748:
	mov	DWORD PTR -4552+[ebp], 1
	jmp	SHORT $L70750
$L70749:
	mov	DWORD PTR -4552+[ebp], 0
$L70750:
	mov	ecx, DWORD PTR -4552+[ebp]
	mov	DWORD PTR _b_reldotsep$70472[ebp], ecx

; 241  : 			M_FREE(expr);

	mov	edx, DWORD PTR _expr$[ebp]
	push	edx
	call	_mem_free
	add	esp, 4
	mov	DWORD PTR _expr$[ebp], 0

; 242  : 			DYNBUF_ADD_CELLP(&expr, c, NO_CONV);

	mov	eax, DWORD PTR _c$70433[ebp]
	mov	DWORD PTR __c$70481[ebp], eax
	cmp	DWORD PTR __c$70481[ebp], 0
	je	SHORT $L70483
	push	0
	push	0
	mov	ecx, DWORD PTR __c$70481[ebp]
	mov	edx, DWORD PTR [ecx+4]
	push	edx
	mov	eax, DWORD PTR __c$70481[ebp]
	mov	ecx, DWORD PTR [eax]
	push	ecx
	lea	edx, DWORD PTR _expr$[ebp]
	push	edx
	call	_dynbuf_add
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L70483
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29872], OFFSET FLAT:$SG70485
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 242		; 000000f2H
	jmp	$eva_err$70426
$L70483:

; 243  : 			if(!groupfn && (!dotsep || b_reldotsep || (relop && dotsep < relop)))

	cmp	DWORD PTR _groupfn$70470[ebp], 0
	jne	$L70508
	cmp	DWORD PTR _dotsep$70466[ebp], 0
	je	SHORT $L70487
	cmp	DWORD PTR _b_reldotsep$70472[ebp], 0
	jne	SHORT $L70487
	cmp	DWORD PTR _relop$70468[ebp], 0
	je	$L70508
	mov	edx, DWORD PTR _dotsep$70466[ebp]
	cmp	edx, DWORD PTR _relop$70468[ebp]
	jae	$L70508
$L70487:

; 245  : 				if(!strcmp("_EVA_DOCUMENT", dyntab_val(&tbl->format, i_col, 0)))

	push	0
	mov	eax, DWORD PTR _i_col$[ebp]
	push	eax
	mov	ecx, DWORD PTR _tbl$[ebp]
	add	ecx, 400				; 00000190H
	push	ecx
	call	_dyntab_val
	add	esp, 12					; 0000000cH
	push	eax
	push	OFFSET FLAT:$SG70489
	call	_strcmp
	add	esp, 8
	test	eax, eax
	jne	SHORT $L70488

; 247  : 					if(expr && expr->cnt >= 6 && !strcmp(expr->data + expr->cnt - 6, ".IdObj")) expr->cnt -= 6;

	cmp	DWORD PTR _expr$[ebp], 0
	je	SHORT $L70490
	mov	edx, DWORD PTR _expr$[ebp]
	cmp	DWORD PTR [edx+4], 6
	jb	SHORT $L70490
	push	OFFSET FLAT:$SG70491
	mov	eax, DWORD PTR _expr$[ebp]
	mov	ecx, DWORD PTR [eax+4]
	mov	edx, DWORD PTR _expr$[ebp]
	lea	eax, DWORD PTR [edx+ecx+2]
	push	eax
	call	_strcmp
	add	esp, 8
	test	eax, eax
	jne	SHORT $L70490
	mov	ecx, DWORD PTR _expr$[ebp]
	mov	edx, DWORD PTR [ecx+4]
	sub	edx, 6
	mov	eax, DWORD PTR _expr$[ebp]
	mov	DWORD PTR [eax+4], edx
$L70490:

; 248  : 					DYNBUF_ADD_STR(&expr, "->_EVA_FILE_CLIENT_PATH.Value");

	push	0
	push	0
	push	29					; 0000001dH
	push	OFFSET FLAT:$SG70494
	lea	ecx, DWORD PTR _expr$[ebp]
	push	ecx
	call	_dynbuf_add
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L70493
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29872], OFFSET FLAT:$SG70496
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 248		; 000000f8H
	jmp	$eva_err$70426
$L70493:

; 250  : 				else if(!strncmp(dyntab_val(&tbl->format, i_col, 0), add_sz_str("_EVA_RELATION")))

	jmp	$L70508
$L70488:
	push	13					; 0000000dH
	push	OFFSET FLAT:$SG70499
	push	0
	mov	ecx, DWORD PTR _i_col$[ebp]
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
	jne	SHORT $L70498

; 252  : 					DYNBUF_ADD_STR(&expr, "->.Value");

	push	0
	push	0
	push	8
	push	OFFSET FLAT:$SG70502
	lea	eax, DWORD PTR _expr$[ebp]
	push	eax
	call	_dynbuf_add
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L70501
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29872], OFFSET FLAT:$SG70504
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 252		; 000000fcH
	jmp	$eva_err$70426
$L70501:

; 254  : 				else if(!b_reldotsep)

	jmp	SHORT $L70508
$L70498:
	cmp	DWORD PTR _b_reldotsep$70472[ebp], 0
	jne	SHORT $L70508

; 256  : 					DYNBUF_ADD_STR(&expr, ".Value");

	push	0
	push	0
	push	6
	push	OFFSET FLAT:$SG70509
	lea	eax, DWORD PTR _expr$[ebp]
	push	eax
	call	_dynbuf_add
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L70508
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29872], OFFSET FLAT:$SG70511
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 256		; 00000100H
	jmp	$eva_err$70426
$L70508:

; 259  : 			qry_build_free(&flt);

	lea	eax, DWORD PTR _flt$[ebp]
	push	eax
	call	_qry_build_free
	add	esp, 4

; 260  : 			if(qry_parse_fieldexpr_nodes(cntxt, DYNBUF_VAL_SZ(expr), &flt)) CLEAR_ERROR_CONT;

	cmp	DWORD PTR _expr$[ebp], 0
	je	SHORT $L70751
	mov	ecx, DWORD PTR _expr$[ebp]
	mov	edx, DWORD PTR [ecx+4]
	mov	DWORD PTR -4556+[ebp], edx
	jmp	SHORT $L70752
$L70751:
	mov	DWORD PTR -4556+[ebp], 0
$L70752:
	cmp	DWORD PTR _expr$[ebp], 0
	je	SHORT $L70753
	mov	eax, DWORD PTR _expr$[ebp]
	add	eax, 8
	mov	DWORD PTR -4560+[ebp], eax
	jmp	SHORT $L70754
$L70753:
	mov	DWORD PTR -4560+[ebp], 0
$L70754:
	lea	ecx, DWORD PTR _flt$[ebp]
	push	ecx
	mov	edx, DWORD PTR -4556+[ebp]
	push	edx
	mov	eax, DWORD PTR -4560+[ebp]
	push	eax
	mov	ecx, DWORD PTR _cntxt$[ebp]
	push	ecx
	call	_qry_parse_fieldexpr_nodes
	add	esp, 16					; 00000010H
	test	eax, eax
	je	SHORT $L70513
	push	260					; 00000104H
	push	OFFSET FLAT:$SG70514
	push	OFFSET FLAT:$SG70515
	mov	edx, DWORD PTR _cntxt$[ebp]
	push	edx
	call	_err_clear
	add	esp, 16					; 00000010H
	jmp	$L70430
$L70513:

; 261  : 			if(!flt.b_oper)

	cmp	DWORD PTR _flt$[ebp+4432], 0
	jne	$L70516

; 263  : 				/* If trivial field : add node fields to trivial fields list & continue */
; 264  : 				unsigned long j;
; 265  : 				for(j = 0; j < flt.node->field.nbrows; j++)

	mov	DWORD PTR _j$70517[ebp], 0
	jmp	SHORT $L70518
$L70519:
	mov	eax, DWORD PTR _j$70517[ebp]
	add	eax, 1
	mov	DWORD PTR _j$70517[ebp], eax
$L70518:
	mov	ecx, DWORD PTR _j$70517[ebp]
	cmp	ecx, DWORD PTR _flt$[ebp+72]
	jae	SHORT $L70520

; 266  : 					DYNTAB_ADD_CELL(&fields, fields.nbrows, 0, &flt.node->field, j, 0);

	push	1
	push	0
	mov	edx, DWORD PTR _j$70517[ebp]
	push	edx
	lea	eax, DWORD PTR _flt$[ebp+72]
	push	eax
	call	_dyntab_cell
	add	esp, 12					; 0000000cH
	push	eax
	push	0
	mov	ecx, DWORD PTR _fields$[ebp]
	push	ecx
	lea	edx, DWORD PTR _fields$[ebp]
	push	edx
	call	_dyntab_copy
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L70521
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29872], OFFSET FLAT:$SG70523
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 266		; 0000010aH
	jmp	$eva_err$70426
$L70521:
	jmp	SHORT $L70519
$L70520:

; 267  : 				continue;

	jmp	$L70430
$L70516:

; 269  : 
; 270  : 			/* Build & exec query for non trivial field - continue on error */
; 271  : 			if(	table_search_set_node(cntxt, i_ctrl, &flt, i_word) ||
; 272  : 				table_add_flt_idlist(cntxt, i_ctrl, &flt, 2))

	mov	edx, DWORD PTR _i_word$[ebp]
	push	edx
	lea	eax, DWORD PTR _flt$[ebp]
	push	eax
	mov	ecx, DWORD PTR _i_ctrl$[ebp]
	push	ecx
	mov	edx, DWORD PTR _cntxt$[ebp]
	push	edx
	call	_table_search_set_node
	add	esp, 16					; 00000010H
	test	eax, eax
	jne	SHORT $L70525
	push	2
	lea	eax, DWORD PTR _flt$[ebp]
	push	eax
	mov	ecx, DWORD PTR _i_ctrl$[ebp]
	push	ecx
	mov	edx, DWORD PTR _cntxt$[ebp]
	push	edx
	call	_table_add_flt_idlist
	add	esp, 16					; 00000010H
	test	eax, eax
	je	SHORT $L70524
$L70525:

; 273  : 					CLEAR_ERROR;

	push	273					; 00000111H
	push	OFFSET FLAT:$SG70526
	push	OFFSET FLAT:$SG70527
	mov	eax, DWORD PTR _cntxt$[ebp]
	push	eax
	call	_err_clear
	add	esp, 16					; 00000010H
$L70524:

; 276  : 
; 277  : 	/* Build query for trivial field expressions if applicable */
; 278  : 	if(fields.nbrows || tbl->srchcol & (1 << tbl->field.nbrows))

	jmp	$L70430
$L70431:
	cmp	DWORD PTR _fields$[ebp], 0
	jne	SHORT $L70529
	mov	ecx, DWORD PTR _tbl$[ebp]
	mov	edx, 1
	mov	ecx, DWORD PTR [ecx+380]
	shl	edx, cl
	mov	eax, DWORD PTR _tbl$[ebp]
	mov	ecx, DWORD PTR [eax+124]
	and	ecx, edx
	test	ecx, ecx
	je	SHORT $L70531
$L70529:

; 280  : 		qry_build_free(&flt);

	lea	edx, DWORD PTR _flt$[ebp]
	push	edx
	call	_qry_build_free
	add	esp, 4

; 281  : 		if(	qry_add_filter(cntxt, &flt, RelNone, &fields, NoMatch, NULL) ||
; 282  : 			table_search_set_node(cntxt, i_ctrl, &flt, i_word) ||
; 283  : 			table_add_flt_idlist(cntxt, i_ctrl, &flt, 2))

	push	0
	push	0
	lea	eax, DWORD PTR _fields$[ebp]
	push	eax
	push	0
	lea	ecx, DWORD PTR _flt$[ebp]
	push	ecx
	mov	edx, DWORD PTR _cntxt$[ebp]
	push	edx
	call	_qry_add_filter
	add	esp, 24					; 00000018H
	test	eax, eax
	jne	SHORT $L70532
	mov	eax, DWORD PTR _i_word$[ebp]
	push	eax
	lea	ecx, DWORD PTR _flt$[ebp]
	push	ecx
	mov	edx, DWORD PTR _i_ctrl$[ebp]
	push	edx
	mov	eax, DWORD PTR _cntxt$[ebp]
	push	eax
	call	_table_search_set_node
	add	esp, 16					; 00000010H
	test	eax, eax
	jne	SHORT $L70532
	push	2
	lea	ecx, DWORD PTR _flt$[ebp]
	push	ecx
	mov	edx, DWORD PTR _i_ctrl$[ebp]
	push	edx
	mov	eax, DWORD PTR _cntxt$[ebp]
	push	eax
	call	_table_add_flt_idlist
	add	esp, 16					; 00000010H
	test	eax, eax
	je	SHORT $L70531
$L70532:

; 284  : 			STACK_ERROR;

	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 284		; 0000011cH
	jmp	$eva_err$70426
$L70531:

; 286  : 
; 287  : 	/* Replace IdList with IdListMatch */
; 288  : 	if(sql_exec_query(cntxt, "DROP TABLE IdList") ||
; 289  : 		sql_exec_query(cntxt, "CREATE TEMPORARY TABLE IdList TYPE=HEAP SELECT DISTINCT IdObj FROM IdListMatch") ||
; 290  : 		sql_exec_query(cntxt, "ALTER TABLE IdList ADD INDEX (IdObj)")) STACK_ERROR;

	push	OFFSET FLAT:$SG70535
	mov	edx, DWORD PTR _cntxt$[ebp]
	push	edx
	call	_sql_exec_query
	add	esp, 8
	test	eax, eax
	jne	SHORT $L70534
	push	OFFSET FLAT:$SG70536
	mov	eax, DWORD PTR _cntxt$[ebp]
	push	eax
	call	_sql_exec_query
	add	esp, 8
	test	eax, eax
	jne	SHORT $L70534
	push	OFFSET FLAT:$SG70537
	mov	ecx, DWORD PTR _cntxt$[ebp]
	push	ecx
	call	_sql_exec_query
	add	esp, 8
	test	eax, eax
	je	SHORT $L70533
$L70534:
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 290		; 00000122H
	jmp	SHORT $eva_err$70426
$L70533:

; 291  : 	tbl->totlines = cntxt->sql_nbrows;

	mov	eax, DWORD PTR _tbl$[ebp]
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	edx, DWORD PTR [ecx+29848]
	mov	DWORD PTR [eax+52], edx

; 292  : 	sql_drop_table(cntxt, "IdListMatch");

	push	OFFSET FLAT:$SG70538
	mov	eax, DWORD PTR _cntxt$[ebp]
	push	eax
	call	_sql_drop_table
	add	esp, 8
$eva_noerr$70539:

; 293  : 
; 294  : 	RETURN_OK_CLEANUP;

	push	0
	push	OFFSET FLAT:$SG70540
	push	OFFSET FLAT:$SG70541
	mov	ecx, DWORD PTR _cntxt$[ebp]
	push	ecx
	call	_err_clear
	add	esp, 16					; 00000010H
$eva_err$70426:
	mov	edx, DWORD PTR _cntxt$[ebp]
	cmp	DWORD PTR [edx+29872], 0
	je	SHORT $L70542
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	ecx, DWORD PTR [eax+29900]
	push	ecx
	push	OFFSET FLAT:$SG70543
	push	OFFSET FLAT:$SG70544
	mov	edx, DWORD PTR _cntxt$[ebp]
	push	edx
	call	_err_add_context
	add	esp, 16					; 00000010H
$L70542:
	lea	eax, DWORD PTR _flt$[ebp]
	push	eax
	call	_qry_build_free
	add	esp, 4
	lea	ecx, DWORD PTR _fields$[ebp]
	push	ecx
	call	_dyntab_free
	add	esp, 4
	mov	edx, DWORD PTR _expr$[ebp]
	push	edx
	call	_mem_free
	add	esp, 4
	mov	DWORD PTR _expr$[ebp], 0
	mov	eax, DWORD PTR _sql$[ebp]
	push	eax
	call	_mem_free
	add	esp, 4
	mov	DWORD PTR _sql$[ebp], 0
	mov	ecx, DWORD PTR _cntxt$[ebp]
	xor	eax, eax
	cmp	DWORD PTR [ecx+29872], 0
	setne	al

; 295  : }

	pop	edi
	mov	esp, ebp
	pop	ebp
	ret	0
_table_search_filter ENDP
_TEXT	ENDS
PUBLIC	_table_word_search
EXTRN	_ctrl_eval_fieldexpr:NEAR
EXTRN	_input_to_datetxt:NEAR
EXTRN	_delay_to_datetxt:NEAR
EXTRN	_atoi:NEAR
EXTRN	_strtoul:NEAR
EXTRN	_qry_obj_idfield:NEAR
EXTRN	_strlen:NEAR
EXTRN	_dyntab_from_list:NEAR
EXTRN	_dyntab_txt_cmp:NEAR
EXTRN	_stricmp:NEAR
EXTRN	_qry_add_filter_forms:NEAR
EXTRN	_qry_parse_filter_nodes:NEAR
EXTRN	_dyntab_filter_field:NEAR
EXTRN	_dyntab_field_val:NEAR
_BSS	SEGMENT
	ALIGN	4

$SG70566 DB	01H DUP (?)
	ALIGN	4

$SG70570 DB	01H DUP (?)
_BSS	ENDS
_DATA	SEGMENT
$SG70565 DB	'_EVA_FILTER_TYPE', 00H
	ORG $+3
$SG70572 DB	'_EVA_DEBUG_SQL_FILTER', 00H
	ORG $+2
$SG70575 DB	'CREATE TEMPORARY TABLE IdList (IdObj INT NOT NULL, PRIMA'
	DB	'RY KEY (IdObj)) TYPE=HEAP', 00H
	ORG $+2
$SG70581 DB	'_EVA_DEFAUT_FILTERS', 00H
$SG70587 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70593 DB	'_EVA_ALTFILTER_FILTER', 00H
	ORG $+2
$SG70598 DB	'D:\Travail\ABI\EVA\V4.0\CGI\Brunix-2016\table_search.c', 00H
	ORG $+1
$SG70599 DB	'table_word_search', 00H
	ORG $+2
$SG70601 DB	'0', 00H
	ORG $+2
$SG70602 DB	'NULL', 00H
	ORG $+3
$SG70615 DB	'_EVA_NOTGROUP', 00H
	ORG $+2
$SG70618 DB	'_EVA_BASE_FORMS', 00H
$SG70620 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70625 DB	'_EVA_FILTER_FORM', 00H
	ORG $+3
$SG70645 DB	'_EVA_AGE', 00H
	ORG $+3
$SG70654 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70659 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70663 DB	'_EVA_DATE', 00H
	ORG $+2
$SG70673 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70680 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70688 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70693 DB	' ', 00H
	ORG $+2
$SG70695 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70700 DB	'D:\Travail\ABI\EVA\V4.0\CGI\Brunix-2016\table_search.c', 00H
	ORG $+1
$SG70701 DB	'table_word_search', 00H
	ORG $+2
$SG70702 DB	'D:\Travail\ABI\EVA\V4.0\CGI\Brunix-2016\table_search.c', 00H
	ORG $+1
$SG70703 DB	'table_word_search', 00H
	ORG $+2
$SG70705 DB	'D:\Travail\ABI\EVA\V4.0\CGI\Brunix-2016\table_search.c', 00H
	ORG $+1
$SG70706 DB	'table_word_search', 00H
_DATA	ENDS
_TEXT	SEGMENT
_date$70664 = -4596
_datetxt$70665 = -4604
_datesep$70666 = -4600
_s$70667 = -4580
_i$70691 = -4608
_cntxt$ = 8
_i_ctrl$ = 12
_form$ = -8
_ctrl$ = -4520
_tbl$ = -36
_flt$ = -4504
_sz$ = -4516
_b_outputall$ = -4512
_sql_trace$ = -32
_data$ = -28
_i$ = -40
_j$ = -44
_k$ = -48
_filter_type$ = -4508
_val$ = -4
_sel$70580 = -4528
_isel$70582 = -4524
_typ$70591 = -4532
_c$70594 = -4536
_b_found$70605 = -4540
_c$70609 = -4544
_c$70636 = -4548
_date$70646 = -4572
_agesep$70647 = -4556
_agemin$70648 = -4552
_agemax$70649 = -4576
_table_word_search PROC NEAR

; 310  : ){

	push	ebp
	mov	ebp, esp
	mov	eax, 4648				; 00001228H
	call	__chkstk
	push	edi

; 311  : 	EVA_form *form = cntxt->form;

	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	ecx, DWORD PTR [eax+80]
	mov	DWORD PTR _form$[ebp], ecx

; 312  : 	EVA_ctrl *ctrl = form->ctrl + i_ctrl;

	mov	edx, DWORD PTR _i_ctrl$[ebp]
	imul	edx, 480				; 000001e0H
	mov	eax, DWORD PTR _form$[ebp]
	mov	ecx, DWORD PTR [eax]
	add	ecx, edx
	mov	DWORD PTR _ctrl$[ebp], ecx

; 313  : 	ObjTableFormat *tbl = ctrl->objtbl;

	mov	edx, DWORD PTR _ctrl$[ebp]
	mov	eax, DWORD PTR [edx+232]
	mov	DWORD PTR _tbl$[ebp], eax

; 314  : 	QryBuild flt = { {0} };

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

; 315  : 	size_t sz = tbl->input ? strlen(tbl->input) : 0;

	mov	edx, DWORD PTR _tbl$[ebp]
	cmp	DWORD PTR [edx+100], 0
	je	SHORT $L70757
	mov	eax, DWORD PTR _tbl$[ebp]
	mov	ecx, DWORD PTR [eax+100]
	push	ecx
	call	_strlen
	add	esp, 4
	mov	DWORD PTR -4612+[ebp], eax
	jmp	SHORT $L70758
$L70757:
	mov	DWORD PTR -4612+[ebp], 0
$L70758:
	mov	edx, DWORD PTR -4612+[ebp]
	mov	DWORD PTR _sz$[ebp], edx

; 316  : 	int b_outputall = !(tbl->status & TblCtrl_opensearch) || !sz;

	mov	eax, DWORD PTR _tbl$[ebp]
	mov	ecx, DWORD PTR [eax+32]
	and	ecx, 32					; 00000020H
	test	ecx, ecx
	je	SHORT $L70759
	cmp	DWORD PTR _sz$[ebp], 0
	je	SHORT $L70759
	mov	DWORD PTR -4616+[ebp], 0
	jmp	SHORT $L70760
$L70759:
	mov	DWORD PTR -4616+[ebp], 1
$L70760:
	mov	edx, DWORD PTR -4616+[ebp]
	mov	DWORD PTR _b_outputall$[ebp], edx

; 317  : 	int sql_trace = cntxt->sql_trace;

	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	ecx, DWORD PTR [eax+29852]
	mov	DWORD PTR _sql_trace$[ebp], ecx

; 318  : 	DynTable data = {0};

	mov	DWORD PTR _data$[ebp], 0
	xor	edx, edx
	mov	DWORD PTR _data$[ebp+4], edx
	mov	DWORD PTR _data$[ebp+8], edx
	mov	DWORD PTR _data$[ebp+12], edx
	mov	DWORD PTR _data$[ebp+16], edx

; 319  : 	unsigned long i, j, k;
; 320  : 	char *filter_type = CTRL_ATTR_VAL(FILTER_TYPE);

	cmp	DWORD PTR _ctrl$[ebp], 0
	je	SHORT $L70761
	push	0
	push	-1
	push	OFFSET FLAT:$SG70565
	mov	eax, DWORD PTR _ctrl$[ebp]
	add	eax, 44					; 0000002cH
	push	eax
	call	_dyntab_field_val
	add	esp, 16					; 00000010H
	mov	DWORD PTR -4620+[ebp], eax
	jmp	SHORT $L70762
$L70761:
	mov	DWORD PTR -4620+[ebp], OFFSET FLAT:$SG70566
$L70762:
	mov	ecx, DWORD PTR -4620+[ebp]
	mov	DWORD PTR _filter_type$[ebp], ecx

; 321  : 	char *val;
; 322  : 	if(tbl->b_ctrl) tbl->attr = &ctrl->attr;

	mov	edx, DWORD PTR _tbl$[ebp]
	cmp	DWORD PTR [edx+24], 0
	je	SHORT $L70568
	mov	eax, DWORD PTR _ctrl$[ebp]
	add	eax, 44					; 0000002cH
	mov	ecx, DWORD PTR _tbl$[ebp]
	mov	DWORD PTR [ecx], eax
$L70568:

; 323  : 	if(!tbl->input) tbl->input = "";

	mov	edx, DWORD PTR _tbl$[ebp]
	cmp	DWORD PTR [edx+100], 0
	jne	SHORT $L70569
	mov	eax, DWORD PTR _tbl$[ebp]
	mov	DWORD PTR [eax+100], OFFSET FLAT:$SG70570
$L70569:

; 324  : 
; 325  : 	/* Handle filter debug */
; 326  : 	if(*DYNTAB_FIELD_VAL(tbl->attr, DEBUG_SQL_FILTER) == '1') cntxt->sql_trace = DEBUG_SQL_RES;

	push	0
	push	-1
	push	OFFSET FLAT:$SG70572
	mov	ecx, DWORD PTR _tbl$[ebp]
	mov	edx, DWORD PTR [ecx]
	push	edx
	call	_dyntab_field_val
	add	esp, 16					; 00000010H
	movsx	eax, BYTE PTR [eax]
	cmp	eax, 49					; 00000031H
	jne	SHORT $L70571
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29852], 2
$L70571:

; 327  : 
; 328  : 	/* Build selected objects table from base filters if applicable */
; 329  : 	if(!tbl->from_idlist)

	mov	edx, DWORD PTR _tbl$[ebp]
	cmp	DWORD PTR [edx+28], 0
	jne	$L70623

; 331  : 		/* Create temporary results list table */
; 332  : 		if(sql_exec_query(cntxt,
; 333  : 			"CREATE TEMPORARY TABLE IdList (IdObj INT NOT NULL, PRIMARY KEY (IdObj)) TYPE=HEAP"))

	push	OFFSET FLAT:$SG70575
	mov	eax, DWORD PTR _cntxt$[ebp]
	push	eax
	call	_sql_exec_query
	add	esp, 8
	test	eax, eax
	je	SHORT $L70574

; 334  : 			STACK_ERROR;

	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 334		; 0000014eH
	jmp	$eva_err$70576
$L70574:

; 335  : 
; 336  : 		/* Search mode with insufficient input : return with empty list */
; 337  : 		if(tbl->status & TblCtrl_opensearch && tbl->minsearchlen && sz < tbl->minsearchlen) RETURN_OK;

	mov	edx, DWORD PTR _tbl$[ebp]
	mov	eax, DWORD PTR [edx+32]
	and	eax, 32					; 00000020H
	test	eax, eax
	je	SHORT $L70577
	mov	ecx, DWORD PTR _tbl$[ebp]
	cmp	DWORD PTR [ecx+76], 0
	je	SHORT $L70577
	mov	edx, DWORD PTR _tbl$[ebp]
	mov	eax, DWORD PTR _sz$[ebp]
	cmp	eax, DWORD PTR [edx+76]
	jae	SHORT $L70577
	jmp	$eva_noerr$70578
$L70577:

; 338  : 
; 339  : 		/* Select initial filters */
; 340  : 		if(!tbl->selfilter.nbrows && tbl->altfilter.nbrows)

	mov	ecx, DWORD PTR _tbl$[ebp]
	cmp	DWORD PTR [ecx+340], 0
	jne	$L70585
	mov	edx, DWORD PTR _tbl$[ebp]
	cmp	DWORD PTR [edx+260], 0
	je	$L70585

; 342  : 			char *sel = DYNTAB_FIELD_VAL(tbl->attr, DEFAUT_FILTERS);

	push	0
	push	-1
	push	OFFSET FLAT:$SG70581
	mov	eax, DWORD PTR _tbl$[ebp]
	mov	ecx, DWORD PTR [eax]
	push	ecx
	call	_dyntab_field_val
	add	esp, 16					; 00000010H
	mov	DWORD PTR _sel$70580[ebp], eax

; 343  : 			int isel = atoi(sel);

	mov	edx, DWORD PTR _sel$70580[ebp]
	push	edx
	call	_atoi
	add	esp, 4
	mov	DWORD PTR _isel$70582[ebp], eax

; 344  : 			if(isel > 0) isel--;

	cmp	DWORD PTR _isel$70582[ebp], 0
	jle	SHORT $L70583
	mov	eax, DWORD PTR _isel$70582[ebp]
	sub	eax, 1
	mov	DWORD PTR _isel$70582[ebp], eax
$L70583:

; 345  : 			if(*sel) DYNTAB_ADD_CELL(&tbl->selfilter, 0, 0, &tbl->altfilter, isel, 0);

	mov	ecx, DWORD PTR _sel$70580[ebp]
	movsx	edx, BYTE PTR [ecx]
	test	edx, edx
	je	SHORT $L70585
	push	1
	push	0
	mov	eax, DWORD PTR _isel$70582[ebp]
	push	eax
	mov	ecx, DWORD PTR _tbl$[ebp]
	add	ecx, 260				; 00000104H
	push	ecx
	call	_dyntab_cell
	add	esp, 12					; 0000000cH
	push	eax
	push	0
	push	0
	mov	edx, DWORD PTR _tbl$[ebp]
	add	edx, 340				; 00000154H
	push	edx
	call	_dyntab_copy
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L70585
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29872], OFFSET FLAT:$SG70587
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 345		; 00000159H
	jmp	$eva_err$70576
$L70585:

; 347  : 
; 348  : 		/* Process extra filters list */
; 349  : 		for(i = 0; i < tbl->altfilter.nbrows; i++)

	mov	DWORD PTR _i$[ebp], 0
	jmp	SHORT $L70588
$L70589:
	mov	edx, DWORD PTR _i$[ebp]
	add	edx, 1
	mov	DWORD PTR _i$[ebp], edx
$L70588:
	mov	eax, DWORD PTR _tbl$[ebp]
	mov	ecx, DWORD PTR _i$[ebp]
	cmp	ecx, DWORD PTR [eax+260]
	jae	$L70590

; 351  : 			char *typ = dyntab_val(&tbl->typfilter, i, 0);

	push	0
	mov	edx, DWORD PTR _i$[ebp]
	push	edx
	mov	eax, DWORD PTR _tbl$[ebp]
	add	eax, 280				; 00000118H
	push	eax
	call	_dyntab_val
	add	esp, 12					; 0000000cH
	mov	DWORD PTR _typ$70591[ebp], eax

; 352  : 			if(!strcmp(typ, "_EVA_ALTFILTER_FILTER"))

	push	OFFSET FLAT:$SG70593
	mov	ecx, DWORD PTR _typ$70591[ebp]
	push	ecx
	call	_strcmp
	add	esp, 8
	test	eax, eax
	jne	$L70592

; 354  : 				/* Filter selected on condition : read & eval condition */
; 355  : 				DynTableCell *c = dyntab_cell(&tbl->condfilter, i, 0);

	push	0
	mov	edx, DWORD PTR _i$[ebp]
	push	edx
	mov	eax, DWORD PTR _tbl$[ebp]
	add	eax, 300				; 0000012cH
	push	eax
	call	_dyntab_cell
	add	esp, 12					; 0000000cH
	mov	DWORD PTR _c$70594[ebp], eax

; 356  : 				if(!c || !c->txt || !c->len) continue;

	cmp	DWORD PTR _c$70594[ebp], 0
	je	SHORT $L70596
	mov	ecx, DWORD PTR _c$70594[ebp]
	cmp	DWORD PTR [ecx], 0
	je	SHORT $L70596
	mov	edx, DWORD PTR _c$70594[ebp]
	cmp	DWORD PTR [edx+4], 0
	jne	SHORT $L70595
$L70596:
	jmp	$L70589
$L70595:

; 357  : 				if(ctrl_eval_fieldexpr(cntxt, ctrl, &data, c->txt)) CLEAR_ERROR_CONT;

	mov	eax, DWORD PTR _c$70594[ebp]
	mov	ecx, DWORD PTR [eax]
	push	ecx
	lea	edx, DWORD PTR _data$[ebp]
	push	edx
	mov	eax, DWORD PTR _ctrl$[ebp]
	push	eax
	mov	ecx, DWORD PTR _cntxt$[ebp]
	push	ecx
	call	_ctrl_eval_fieldexpr
	add	esp, 16					; 00000010H
	test	eax, eax
	je	SHORT $L70597
	push	357					; 00000165H
	push	OFFSET FLAT:$SG70598
	push	OFFSET FLAT:$SG70599
	mov	edx, DWORD PTR _cntxt$[ebp]
	push	edx
	call	_err_clear
	add	esp, 16					; 00000010H
	jmp	$L70589
$L70597:

; 358  : 
; 359  : 				/* Matched condition : set col attribute of tbl->typfilter */
; 360  : 				val = dyntab_val(&data, 0, 0);

	push	0
	push	0
	lea	eax, DWORD PTR _data$[ebp]
	push	eax
	call	_dyntab_val
	add	esp, 12					; 0000000cH
	mov	DWORD PTR _val$[ebp], eax

; 361  : 				if(*val && strcmp("0", val) && STRCMPCASE("NULL", val))

	mov	ecx, DWORD PTR _val$[ebp]
	movsx	edx, BYTE PTR [ecx]
	test	edx, edx
	je	SHORT $L70600
	mov	eax, DWORD PTR _val$[ebp]
	push	eax
	push	OFFSET FLAT:$SG70601
	call	_strcmp
	add	esp, 8
	test	eax, eax
	je	SHORT $L70600
	mov	ecx, DWORD PTR _val$[ebp]
	push	ecx
	push	OFFSET FLAT:$SG70602
	call	_stricmp
	add	esp, 8
	test	eax, eax
	je	SHORT $L70600

; 362  : 					dyntab_cell(&tbl->typfilter, i, 0)->col = 1;

	push	0
	mov	edx, DWORD PTR _i$[ebp]
	push	edx
	mov	eax, DWORD PTR _tbl$[ebp]
	add	eax, 280				; 00000118H
	push	eax
	call	_dyntab_cell
	add	esp, 12					; 0000000cH
	mov	DWORD PTR [eax+56], 1
$L70600:

; 364  : 			else if(*typ)

	jmp	$L70614
$L70592:
	mov	ecx, DWORD PTR _typ$70591[ebp]
	movsx	edx, BYTE PTR [ecx]
	test	edx, edx
	je	$L70614

; 366  : 				/* Filter when selected user group : check */
; 367  : 				int b_found = 0;

	mov	DWORD PTR _b_found$70605[ebp], 0

; 368  : 				for(k = 0; !b_found && k < tbl->groupfilter.nbcols; k++)

	mov	DWORD PTR _k$[ebp], 0
	jmp	SHORT $L70606
$L70607:
	mov	eax, DWORD PTR _k$[ebp]
	add	eax, 1
	mov	DWORD PTR _k$[ebp], eax
$L70606:
	cmp	DWORD PTR _b_found$70605[ebp], 0
	jne	$L70608
	mov	ecx, DWORD PTR _tbl$[ebp]
	mov	edx, DWORD PTR _k$[ebp]
	cmp	edx, DWORD PTR [ecx+328]
	jae	$L70608

; 370  : 					DynTableCell *c = dyntab_cell(&tbl->groupfilter, i, k);

	mov	eax, DWORD PTR _k$[ebp]
	push	eax
	mov	ecx, DWORD PTR _i$[ebp]
	push	ecx
	mov	edx, DWORD PTR _tbl$[ebp]
	add	edx, 320				; 00000140H
	push	edx
	call	_dyntab_cell
	add	esp, 12					; 0000000cH
	mov	DWORD PTR _c$70609[ebp], eax

; 371  : 					if(c && c->len)

	cmp	DWORD PTR _c$70609[ebp], 0
	je	SHORT $L70613
	mov	eax, DWORD PTR _c$70609[ebp]
	cmp	DWORD PTR [eax+4], 0
	je	SHORT $L70613

; 372  : 						for(j = 0; !b_found && j < cntxt->user_groups.nbrows; j++)

	mov	DWORD PTR _j$[ebp], 0
	jmp	SHORT $L70611
$L70612:
	mov	ecx, DWORD PTR _j$[ebp]
	add	ecx, 1
	mov	DWORD PTR _j$[ebp], ecx
$L70611:
	cmp	DWORD PTR _b_found$70605[ebp], 0
	jne	SHORT $L70613
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	eax, DWORD PTR _j$[ebp]
	cmp	eax, DWORD PTR [edx+29448]
	jae	SHORT $L70613

; 373  : 							b_found = !dyntab_txt_cmp(c->txt, c->len, &cntxt->user_groups, j, 0);

	push	0
	mov	ecx, DWORD PTR _j$[ebp]
	push	ecx
	mov	edx, DWORD PTR _cntxt$[ebp]
	add	edx, 29448				; 00007308H
	push	edx
	mov	eax, DWORD PTR _c$70609[ebp]
	mov	ecx, DWORD PTR [eax+4]
	push	ecx
	mov	edx, DWORD PTR _c$70609[ebp]
	mov	eax, DWORD PTR [edx]
	push	eax
	call	_dyntab_txt_cmp
	add	esp, 20					; 00000014H
	neg	eax
	sbb	eax, eax
	inc	eax
	mov	DWORD PTR _b_found$70605[ebp], eax
	jmp	SHORT $L70612
$L70613:

; 374  : 				}

	jmp	$L70607
$L70608:

; 375  : 
; 376  : 				/* Matched condition : set col attribute of tbl->typfilter */
; 377  : 				if(b_found ^ !strcmp(typ, "_EVA_NOTGROUP"))

	push	OFFSET FLAT:$SG70615
	mov	ecx, DWORD PTR _typ$70591[ebp]
	push	ecx
	call	_strcmp
	add	esp, 8
	neg	eax
	sbb	eax, eax
	inc	eax
	mov	edx, DWORD PTR _b_found$70605[ebp]
	xor	edx, eax
	test	edx, edx
	je	SHORT $L70614

; 378  : 					dyntab_cell(&tbl->typfilter, i, 0)->col = 1;

	push	0
	mov	eax, DWORD PTR _i$[ebp]
	push	eax
	mov	ecx, DWORD PTR _tbl$[ebp]
	add	ecx, 280				; 00000118H
	push	ecx
	call	_dyntab_cell
	add	esp, 12					; 0000000cH
	mov	DWORD PTR [eax+56], 1
$L70614:

; 380  : 		}

	jmp	$L70589
$L70590:

; 381  : 
; 382  : 		/* Add table main filter */
; 383  : 		flt.srcjoin = 0;

	mov	DWORD PTR _flt$[ebp+64], 0

; 384  : 		DYNTAB_FIELD(&data, tbl->attr, BASE_FORMS);

	lea	edx, DWORD PTR _data$[ebp]
	push	edx
	call	_dyntab_free
	add	esp, 4
	push	0
	push	-1
	push	OFFSET FLAT:$SG70618
	mov	eax, DWORD PTR _tbl$[ebp]
	mov	ecx, DWORD PTR [eax]
	push	ecx
	push	0
	lea	edx, DWORD PTR _data$[ebp]
	push	edx
	call	_dyntab_filter_field
	add	esp, 24					; 00000018H
	test	eax, eax
	je	SHORT $L70617
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29872], OFFSET FLAT:$SG70620
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 384		; 00000180H
	jmp	$eva_err$70576
$L70617:

; 385  : 		if(data.nbrows && qry_add_filter_forms(cntxt, &flt, &data, NULL)) STACK_ERROR;

	cmp	DWORD PTR _data$[ebp], 0
	je	SHORT $L70622
	push	0
	lea	edx, DWORD PTR _data$[ebp]
	push	edx
	lea	eax, DWORD PTR _flt$[ebp]
	push	eax
	mov	ecx, DWORD PTR _cntxt$[ebp]
	push	ecx
	call	_qry_add_filter_forms
	add	esp, 16					; 00000010H
	test	eax, eax
	je	SHORT $L70622
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 385		; 00000181H
	jmp	$eva_err$70576
$L70622:

; 386  : 		if((!data.nbrows || (*filter_type && strcmp(filter_type, "_EVA_FILTER_FORM"))) &&
; 387  : 			qry_parse_filter_nodes(cntxt, &flt, tbl->attr)) STACK_ERROR;

	cmp	DWORD PTR _data$[ebp], 0
	je	SHORT $L70624
	mov	eax, DWORD PTR _filter_type$[ebp]
	movsx	ecx, BYTE PTR [eax]
	test	ecx, ecx
	je	SHORT $L70623
	push	OFFSET FLAT:$SG70625
	mov	edx, DWORD PTR _filter_type$[ebp]
	push	edx
	call	_strcmp
	add	esp, 8
	test	eax, eax
	je	SHORT $L70623
$L70624:
	mov	eax, DWORD PTR _tbl$[ebp]
	mov	ecx, DWORD PTR [eax]
	push	ecx
	lea	edx, DWORD PTR _flt$[ebp]
	push	edx
	mov	eax, DWORD PTR _cntxt$[ebp]
	push	eax
	call	_qry_parse_filter_nodes
	add	esp, 12					; 0000000cH
	test	eax, eax
	je	SHORT $L70623
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 387		; 00000183H
	jmp	$eva_err$70576
$L70623:

; 389  : 
; 390  : 	/* Add user selected filters */
; 391  : 	for(i = 0; i < tbl->selfilter.nbrows; i++)

	mov	DWORD PTR _i$[ebp], 0
	jmp	SHORT $L70626
$L70627:
	mov	edx, DWORD PTR _i$[ebp]
	add	edx, 1
	mov	DWORD PTR _i$[ebp], edx
$L70626:
	mov	eax, DWORD PTR _tbl$[ebp]
	mov	ecx, DWORD PTR _i$[ebp]
	cmp	ecx, DWORD PTR [eax+340]
	jae	SHORT $L70628

; 393  : 		flt.srcjoin = 0;

	mov	DWORD PTR _flt$[ebp+64], 0

; 394  : 		if(qry_obj_idfield(cntxt, &data, DYNTAB_TOULRC(&tbl->selfilter, i, 0), 0) ||
; 395  : 			(data.nbrows && qry_parse_filter_nodes(cntxt, &flt, &data))) STACK_ERROR;

	push	0
	push	10					; 0000000aH
	push	0
	push	0
	mov	edx, DWORD PTR _i$[ebp]
	push	edx
	mov	eax, DWORD PTR _tbl$[ebp]
	add	eax, 340				; 00000154H
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
	call	_qry_obj_idfield
	add	esp, 16					; 00000010H
	test	eax, eax
	jne	SHORT $L70631
	cmp	DWORD PTR _data$[ebp], 0
	je	SHORT $L70630
	lea	eax, DWORD PTR _data$[ebp]
	push	eax
	lea	ecx, DWORD PTR _flt$[ebp]
	push	ecx
	mov	edx, DWORD PTR _cntxt$[ebp]
	push	edx
	call	_qry_parse_filter_nodes
	add	esp, 12					; 0000000cH
	test	eax, eax
	je	SHORT $L70630
$L70631:
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 395		; 0000018bH
	jmp	$eva_err$70576
$L70630:

; 396  : 	}

	jmp	$L70627
$L70628:

; 397  : 
; 398  : 	/* Add matched condition filters */
; 399  : 	if(!tbl->from_idlist) for(i = 0; i < tbl->typfilter.nbrows; i++)

	mov	ecx, DWORD PTR _tbl$[ebp]
	cmp	DWORD PTR [ecx+28], 0
	jne	$L70635
	mov	DWORD PTR _i$[ebp], 0
	jmp	SHORT $L70633
$L70634:
	mov	edx, DWORD PTR _i$[ebp]
	add	edx, 1
	mov	DWORD PTR _i$[ebp], edx
$L70633:
	mov	eax, DWORD PTR _tbl$[ebp]
	mov	ecx, DWORD PTR _i$[ebp]
	cmp	ecx, DWORD PTR [eax+280]
	jae	$L70635

; 401  : 		DynTableCell *c = dyntab_cell(&tbl->typfilter, i, 0);

	push	0
	mov	edx, DWORD PTR _i$[ebp]
	push	edx
	mov	eax, DWORD PTR _tbl$[ebp]
	add	eax, 280				; 00000118H
	push	eax
	call	_dyntab_cell
	add	esp, 12					; 0000000cH
	mov	DWORD PTR _c$70636[ebp], eax

; 402  : 		if(!c->col) continue;

	mov	ecx, DWORD PTR _c$70636[ebp]
	cmp	DWORD PTR [ecx+56], 0
	jne	SHORT $L70637
	jmp	SHORT $L70634
$L70637:

; 403  : 		flt.srcjoin = 0;

	mov	DWORD PTR _flt$[ebp+64], 0

; 404  : 		if(qry_obj_idfield(cntxt, &data, DYNTAB_TOULRC(&tbl->altfilter, i, 0), 0) ||
; 405  : 			(data.nbrows && qry_parse_filter_nodes(cntxt, &flt, &data)) ) STACK_ERROR;

	push	0
	push	10					; 0000000aH
	push	0
	push	0
	mov	edx, DWORD PTR _i$[ebp]
	push	edx
	mov	eax, DWORD PTR _tbl$[ebp]
	add	eax, 260				; 00000104H
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
	call	_qry_obj_idfield
	add	esp, 16					; 00000010H
	test	eax, eax
	jne	SHORT $L70640
	cmp	DWORD PTR _data$[ebp], 0
	je	SHORT $L70639
	lea	eax, DWORD PTR _data$[ebp]
	push	eax
	lea	ecx, DWORD PTR _flt$[ebp]
	push	ecx
	mov	edx, DWORD PTR _cntxt$[ebp]
	push	edx
	call	_qry_parse_filter_nodes
	add	esp, 12					; 0000000cH
	test	eax, eax
	je	SHORT $L70639
$L70640:
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 405		; 00000195H
	jmp	$eva_err$70576
$L70639:

; 406  : 	}

	jmp	$L70634
$L70635:

; 407  : 
; 408  : 	/* Fill IdList with initial filter results */
; 409  : 	if(qry_build_clauses(cntxt, &flt, 1) ||
; 410  : 		table_add_flt_idlist(cntxt, i_ctrl, &flt, tbl->from_idlist ? 3 : 0)) STACK_ERROR;

	push	1
	lea	ecx, DWORD PTR _flt$[ebp]
	push	ecx
	mov	edx, DWORD PTR _cntxt$[ebp]
	push	edx
	call	_qry_build_clauses
	add	esp, 12					; 0000000cH
	test	eax, eax
	jne	SHORT $L70642
	mov	eax, DWORD PTR _tbl$[ebp]
	mov	ecx, DWORD PTR [eax+28]
	neg	ecx
	sbb	ecx, ecx
	and	ecx, 3
	push	ecx
	lea	edx, DWORD PTR _flt$[ebp]
	push	edx
	mov	eax, DWORD PTR _i_ctrl$[ebp]
	push	eax
	mov	ecx, DWORD PTR _cntxt$[ebp]
	push	ecx
	call	_table_add_flt_idlist
	add	esp, 16					; 00000010H
	test	eax, eax
	je	SHORT $L70641
$L70642:
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 410		; 0000019aH
	jmp	$eva_err$70576
$L70641:

; 411  : 	tbl->totlines0 = tbl->totlines;

	mov	eax, DWORD PTR _tbl$[ebp]
	mov	ecx, DWORD PTR _tbl$[ebp]
	mov	edx, DWORD PTR [ecx+52]
	mov	DWORD PTR [eax+48], edx

; 412  : 
; 413  : 	/* Search inactive or no input : return with full list */
; 414  : 	if(b_outputall) RETURN_OK;

	cmp	DWORD PTR _b_outputall$[ebp], 0
	je	SHORT $L70643
	jmp	$eva_noerr$70578
$L70643:

; 415  : 
; 416  : 	/* Process search string depending on column format */
; 417  : 	DYNTAB_FREE(data);

	lea	eax, DWORD PTR _data$[ebp]
	push	eax
	call	_dyntab_free
	add	esp, 4

; 418  : 	DYNTAB_FREE(tbl->srchwords);

	mov	ecx, DWORD PTR _tbl$[ebp]
	add	ecx, 104				; 00000068H
	push	ecx
	call	_dyntab_free
	add	esp, 4

; 419  : 	if(sz && !strcmp(tbl->srchfmt, "_EVA_AGE"))

	cmp	DWORD PTR _sz$[ebp], 0
	je	$L70644
	push	OFFSET FLAT:$SG70645
	mov	edx, DWORD PTR _tbl$[ebp]
	mov	eax, DWORD PTR [edx+128]
	push	eax
	call	_strcmp
	add	esp, 8
	test	eax, eax
	jne	$L70644

; 421  : 		/* Search in age column : use date comparison */
; 422  : 		char date[16] = {0};

	mov	BYTE PTR _date$70646[ebp], 0
	xor	ecx, ecx
	mov	DWORD PTR _date$70646[ebp+1], ecx
	mov	DWORD PTR _date$70646[ebp+5], ecx
	mov	DWORD PTR _date$70646[ebp+9], ecx
	mov	WORD PTR _date$70646[ebp+13], cx
	mov	BYTE PTR _date$70646[ebp+15], cl

; 423  : 		char *agesep = strchr(tbl->input, '-');

	push	45					; 0000002dH
	mov	edx, DWORD PTR _tbl$[ebp]
	mov	eax, DWORD PTR [edx+100]
	push	eax
	call	_strchr
	add	esp, 8
	mov	DWORD PTR _agesep$70647[ebp], eax

; 424  : 		int agemin = atoi(tbl->input), agemax = agesep ? atoi(agesep + 1) : 0;

	mov	ecx, DWORD PTR _tbl$[ebp]
	mov	edx, DWORD PTR [ecx+100]
	push	edx
	call	_atoi
	add	esp, 4
	mov	DWORD PTR _agemin$70648[ebp], eax
	cmp	DWORD PTR _agesep$70647[ebp], 0
	je	SHORT $L70763
	mov	eax, DWORD PTR _agesep$70647[ebp]
	add	eax, 1
	push	eax
	call	_atoi
	add	esp, 4
	mov	DWORD PTR -4624+[ebp], eax
	jmp	SHORT $L70764
$L70763:
	mov	DWORD PTR -4624+[ebp], 0
$L70764:
	mov	ecx, DWORD PTR -4624+[ebp]
	mov	DWORD PTR _agemax$70649[ebp], ecx

; 425  : 		agemin = (!agesep || agesep > tbl->input) ? atoi(tbl->input) : 0;

	cmp	DWORD PTR _agesep$70647[ebp], 0
	je	SHORT $L70765
	mov	edx, DWORD PTR _tbl$[ebp]
	mov	eax, DWORD PTR _agesep$70647[ebp]
	cmp	eax, DWORD PTR [edx+100]
	ja	SHORT $L70765
	mov	DWORD PTR -4628+[ebp], 0
	jmp	SHORT $L70766
$L70765:
	mov	ecx, DWORD PTR _tbl$[ebp]
	mov	edx, DWORD PTR [ecx+100]
	push	edx
	call	_atoi
	add	esp, 4
	mov	DWORD PTR -4628+[ebp], eax
$L70766:
	mov	eax, DWORD PTR -4628+[ebp]
	mov	DWORD PTR _agemin$70648[ebp], eax

; 426  : 		agemax = agesep ? atoi(agesep + 1) : 0;

	cmp	DWORD PTR _agesep$70647[ebp], 0
	je	SHORT $L70767
	mov	ecx, DWORD PTR _agesep$70647[ebp]
	add	ecx, 1
	push	ecx
	call	_atoi
	add	esp, 4
	mov	DWORD PTR -4632+[ebp], eax
	jmp	SHORT $L70768
$L70767:
	mov	DWORD PTR -4632+[ebp], 0
$L70768:
	mov	edx, DWORD PTR -4632+[ebp]
	mov	DWORD PTR _agemax$70649[ebp], edx

; 427  : 		if(agemin && !delay_to_datetxt(date, cntxt->timestamp, -agemin, 'Y'))

	cmp	DWORD PTR _agemin$70648[ebp], 0
	je	SHORT $L70652
	push	89					; 00000059H
	mov	eax, DWORD PTR _agemin$70648[ebp]
	neg	eax
	push	eax
	mov	ecx, DWORD PTR _cntxt$[ebp]
	add	ecx, 29704				; 00007408H
	push	ecx
	lea	edx, DWORD PTR _date$70646[ebp]
	push	edx
	call	_delay_to_datetxt
	add	esp, 16					; 00000010H
	test	eax, eax
	jne	SHORT $L70652

; 428  : 			DYNTAB_ADD(&tbl->srchwords, 1, 0, date, 0, NO_CONV);

	push	0
	push	0
	push	0
	lea	eax, DWORD PTR _date$70646[ebp]
	push	eax
	push	0
	push	1
	mov	ecx, DWORD PTR _tbl$[ebp]
	add	ecx, 104				; 00000068H
	push	ecx
	call	_dyntab_add
	add	esp, 28					; 0000001cH
	test	eax, eax
	je	SHORT $L70652
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29872], OFFSET FLAT:$SG70654
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 428		; 000001acH
	jmp	$eva_err$70576
$L70652:

; 429  : 		agemax = agemax ? agemax + 1 : agesep ? 0 : agemin + 1;

	cmp	DWORD PTR _agemax$70649[ebp], 0
	je	SHORT $L70771
	mov	ecx, DWORD PTR _agemax$70649[ebp]
	add	ecx, 1
	mov	DWORD PTR -4636+[ebp], ecx
	jmp	SHORT $L70772
$L70771:
	cmp	DWORD PTR _agesep$70647[ebp], 0
	je	SHORT $L70769
	mov	DWORD PTR -4640+[ebp], 0
	jmp	SHORT $L70770
$L70769:
	mov	edx, DWORD PTR _agemin$70648[ebp]
	add	edx, 1
	mov	DWORD PTR -4640+[ebp], edx
$L70770:
	mov	eax, DWORD PTR -4640+[ebp]
	mov	DWORD PTR -4636+[ebp], eax
$L70772:
	mov	ecx, DWORD PTR -4636+[ebp]
	mov	DWORD PTR _agemax$70649[ebp], ecx

; 430  : 		if(agemax)

	cmp	DWORD PTR _agemax$70649[ebp], 0
	je	SHORT $L70657

; 432  : 			delay_to_datetxt(date, cntxt->timestamp, -agemax, 'Y');

	push	89					; 00000059H
	mov	edx, DWORD PTR _agemax$70649[ebp]
	neg	edx
	push	edx
	mov	eax, DWORD PTR _cntxt$[ebp]
	add	eax, 29704				; 00007408H
	push	eax
	lea	ecx, DWORD PTR _date$70646[ebp]
	push	ecx
	call	_delay_to_datetxt
	add	esp, 16					; 00000010H

; 433  : 			DYNTAB_ADD(&tbl->srchwords, 0, 0, date, 0, NO_CONV);

	push	0
	push	0
	push	0
	lea	edx, DWORD PTR _date$70646[ebp]
	push	edx
	push	0
	push	0
	mov	eax, DWORD PTR _tbl$[ebp]
	add	eax, 104				; 00000068H
	push	eax
	call	_dyntab_add
	add	esp, 28					; 0000001cH
	test	eax, eax
	je	SHORT $L70657
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29872], OFFSET FLAT:$SG70659
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 433		; 000001b1H
	jmp	$eva_err$70576
$L70657:

; 435  : 		if(table_search_filter(cntxt, i_ctrl, 0)) STACK_ERROR;

	push	0
	mov	eax, DWORD PTR _i_ctrl$[ebp]
	push	eax
	mov	ecx, DWORD PTR _cntxt$[ebp]
	push	ecx
	call	_table_search_filter
	add	esp, 12					; 0000000cH
	test	eax, eax
	je	SHORT $L70660
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 435		; 000001b3H
	jmp	$eva_err$70576
$L70660:

; 437  : 	else if(sz && !strncmp(tbl->srchfmt, add_sz_str("_EVA_DATE")))

	jmp	$L70698
$L70644:
	cmp	DWORD PTR _sz$[ebp], 0
	je	$L70662
	push	9
	push	OFFSET FLAT:$SG70663
	mov	eax, DWORD PTR _tbl$[ebp]
	mov	ecx, DWORD PTR [eax+128]
	push	ecx
	call	_strncmp
	add	esp, 12					; 0000000cH
	test	eax, eax
	jne	$L70662

; 439  : 		/* Search in date column */
; 440  : 		char date[16], *datetxt = tbl->input;

	mov	edx, DWORD PTR _tbl$[ebp]
	mov	eax, DWORD PTR [edx+100]
	mov	DWORD PTR _datetxt$70665[ebp], eax

; 441  : 		char *datesep = strchr(tbl->input, '-');

	push	45					; 0000002dH
	mov	ecx, DWORD PTR _tbl$[ebp]
	mov	edx, DWORD PTR [ecx+100]
	push	edx
	call	_strchr
	add	esp, 8
	mov	DWORD PTR _datesep$70666[ebp], eax

; 442  : 		size_t s;
; 443  : 		if(datesep) *datesep = 0;

	cmp	DWORD PTR _datesep$70666[ebp], 0
	je	SHORT $L70668
	mov	eax, DWORD PTR _datesep$70666[ebp]
	mov	BYTE PTR [eax], 0
$L70668:

; 444  : 		if(!input_to_datetxt(tbl->input, date)) datetxt = date;

	lea	ecx, DWORD PTR _date$70664[ebp]
	push	ecx
	mov	edx, DWORD PTR _tbl$[ebp]
	mov	eax, DWORD PTR [edx+100]
	push	eax
	call	_input_to_datetxt
	add	esp, 8
	test	eax, eax
	jne	SHORT $L70669
	lea	ecx, DWORD PTR _date$70664[ebp]
	mov	DWORD PTR _datetxt$70665[ebp], ecx
$L70669:

; 445  : 		s = strlen(datetxt);

	mov	edx, DWORD PTR _datetxt$70665[ebp]
	push	edx
	call	_strlen
	add	esp, 4
	mov	DWORD PTR _s$70667[ebp], eax

; 446  : 		DYNTAB_ADD(&tbl->srchwords, 0, 0, datetxt, 0, NO_CONV);

	push	0
	push	0
	push	0
	mov	eax, DWORD PTR _datetxt$70665[ebp]
	push	eax
	push	0
	push	0
	mov	ecx, DWORD PTR _tbl$[ebp]
	add	ecx, 104				; 00000068H
	push	ecx
	call	_dyntab_add
	add	esp, 28					; 0000001cH
	test	eax, eax
	je	SHORT $L70671
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29872], OFFSET FLAT:$SG70673
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 446		; 000001beH
	jmp	$eva_err$70576
$L70671:

; 447  : 		if(datesep)

	cmp	DWORD PTR _datesep$70666[ebp], 0
	je	SHORT $L70674

; 449  : 			input_to_datetxt(datesep + 1, date);

	lea	ecx, DWORD PTR _date$70664[ebp]
	push	ecx
	mov	edx, DWORD PTR _datesep$70666[ebp]
	add	edx, 1
	push	edx
	call	_input_to_datetxt
	add	esp, 8

; 450  : 			*datesep = '-';

	mov	eax, DWORD PTR _datesep$70666[ebp]
	mov	BYTE PTR [eax], 45			; 0000002dH

; 452  : 		else

	jmp	SHORT $L70675
$L70674:

; 454  : 			delay_to_datetxt(date, date, 1, (char)(s > 9 ? 'h' : s > 7 ? 'D' : s > 5 ? 'M' : 'Y'));

	cmp	DWORD PTR _s$70667[ebp], 9
	jbe	SHORT $L70775
	mov	DWORD PTR -4644+[ebp], 104		; 00000068H
	jmp	SHORT $L70776
$L70775:
	cmp	DWORD PTR _s$70667[ebp], 7
	jbe	SHORT $L70773
	mov	DWORD PTR -4648+[ebp], 68		; 00000044H
	jmp	SHORT $L70774
$L70773:
	mov	ecx, 5
	cmp	ecx, DWORD PTR _s$70667[ebp]
	sbb	edx, edx
	and	edx, -12				; fffffff4H
	add	edx, 89					; 00000059H
	mov	DWORD PTR -4648+[ebp], edx
$L70774:
	mov	eax, DWORD PTR -4648+[ebp]
	mov	DWORD PTR -4644+[ebp], eax
$L70776:
	mov	cl, BYTE PTR -4644+[ebp]
	push	ecx
	push	1
	lea	edx, DWORD PTR _date$70664[ebp]
	push	edx
	lea	eax, DWORD PTR _date$70664[ebp]
	push	eax
	call	_delay_to_datetxt
	add	esp, 16					; 00000010H

; 455  : 			date[s] = 0;

	mov	ecx, DWORD PTR _s$70667[ebp]
	mov	BYTE PTR _date$70664[ebp+ecx], 0
$L70675:

; 457  : 		DYNTAB_ADD(&tbl->srchwords, 1, 0, date, 0, NO_CONV);

	push	0
	push	0
	push	0
	lea	edx, DWORD PTR _date$70664[ebp]
	push	edx
	push	0
	push	1
	mov	eax, DWORD PTR _tbl$[ebp]
	add	eax, 104				; 00000068H
	push	eax
	call	_dyntab_add
	add	esp, 28					; 0000001cH
	test	eax, eax
	je	SHORT $L70678
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29872], OFFSET FLAT:$SG70680
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 457		; 000001c9H
	jmp	$eva_err$70576
$L70678:

; 458  : 		if((dyntab_sz(&tbl->srchwords, 0, 0) || dyntab_sz(&tbl->srchwords, 1, 0)) &&
; 459  : 			table_search_filter(cntxt, i_ctrl, 0)) STACK_ERROR;

	push	0
	push	0
	mov	eax, DWORD PTR _tbl$[ebp]
	add	eax, 104				; 00000068H
	push	eax
	call	_dyntab_sz
	add	esp, 12					; 0000000cH
	test	eax, eax
	jne	SHORT $L70682
	push	0
	push	1
	mov	ecx, DWORD PTR _tbl$[ebp]
	add	ecx, 104				; 00000068H
	push	ecx
	call	_dyntab_sz
	add	esp, 12					; 0000000cH
	test	eax, eax
	je	SHORT $L70681
$L70682:
	push	0
	mov	edx, DWORD PTR _i_ctrl$[ebp]
	push	edx
	mov	eax, DWORD PTR _cntxt$[ebp]
	push	eax
	call	_table_search_filter
	add	esp, 12					; 0000000cH
	test	eax, eax
	je	SHORT $L70681
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 459		; 000001cbH
	jmp	$eva_err$70576
$L70681:

; 461  : 	else if(sz > 2 && tbl->input[0] == '"' && tbl->input[sz - 1] == '"')

	jmp	$L70698
$L70662:
	cmp	DWORD PTR _sz$[ebp], 2
	jbe	$L70684
	mov	edx, DWORD PTR _tbl$[ebp]
	mov	eax, DWORD PTR [edx+100]
	movsx	ecx, BYTE PTR [eax]
	cmp	ecx, 34					; 00000022H
	jne	$L70684
	mov	edx, DWORD PTR _tbl$[ebp]
	mov	eax, DWORD PTR [edx+100]
	mov	ecx, DWORD PTR _sz$[ebp]
	movsx	edx, BYTE PTR [eax+ecx-1]
	cmp	edx, 34					; 00000022H
	jne	SHORT $L70684

; 463  : 		/* Double quoted input : use single string */
; 464  : 		DYNTAB_ADD(&tbl->srchwords, 0, 0, tbl->input + 1, sz - 2, NO_CONV);

	push	0
	push	0
	mov	eax, DWORD PTR _sz$[ebp]
	sub	eax, 2
	push	eax
	mov	ecx, DWORD PTR _tbl$[ebp]
	mov	edx, DWORD PTR [ecx+100]
	add	edx, 1
	push	edx
	push	0
	push	0
	mov	eax, DWORD PTR _tbl$[ebp]
	add	eax, 104				; 00000068H
	push	eax
	call	_dyntab_add
	add	esp, 28					; 0000001cH
	test	eax, eax
	je	SHORT $L70686
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29872], OFFSET FLAT:$SG70688
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 464		; 000001d0H
	jmp	$eva_err$70576
$L70686:

; 465  : 		if(table_search_filter(cntxt, i_ctrl, 0)) STACK_ERROR;

	push	0
	mov	eax, DWORD PTR _i_ctrl$[ebp]
	push	eax
	mov	ecx, DWORD PTR _cntxt$[ebp]
	push	ecx
	call	_table_search_filter
	add	esp, 12					; 0000000cH
	test	eax, eax
	je	SHORT $L70689
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 465		; 000001d1H
	jmp	$eva_err$70576
$L70689:

; 467  : 	else

	jmp	$L70698
$L70684:

; 469  : 		/* Split words in search string */
; 470  : 		unsigned long i;
; 471  : 		if(dyntab_from_list(&tbl->srchwords, tbl->input, strlen(tbl->input), " ", 0, 0))

	push	0
	push	0
	push	OFFSET FLAT:$SG70693
	mov	eax, DWORD PTR _tbl$[ebp]
	mov	ecx, DWORD PTR [eax+100]
	push	ecx
	call	_strlen
	add	esp, 4
	push	eax
	mov	edx, DWORD PTR _tbl$[ebp]
	mov	eax, DWORD PTR [edx+100]
	push	eax
	mov	ecx, DWORD PTR _tbl$[ebp]
	add	ecx, 104				; 00000068H
	push	ecx
	call	_dyntab_from_list
	add	esp, 24					; 00000018H
	test	eax, eax
	je	SHORT $L70692

; 472  : 			RETURN_ERR_MEMORY;

	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29872], OFFSET FLAT:$SG70695
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 472		; 000001d8H
	jmp	SHORT $eva_err$70576
$L70692:

; 473  : 
; 474  : 		/* Build match list for each word */
; 475  : 		for(i = 0; i < tbl->srchwords.nbrows; i++)

	mov	DWORD PTR _i$70691[ebp], 0
	jmp	SHORT $L70696
$L70697:
	mov	ecx, DWORD PTR _i$70691[ebp]
	add	ecx, 1
	mov	DWORD PTR _i$70691[ebp], ecx
$L70696:
	mov	edx, DWORD PTR _tbl$[ebp]
	mov	eax, DWORD PTR _i$70691[ebp]
	cmp	eax, DWORD PTR [edx+104]
	jae	SHORT $L70698

; 476  : 			if(table_search_filter(cntxt, i_ctrl, i)) CLEAR_ERROR;

	mov	ecx, DWORD PTR _i$70691[ebp]
	push	ecx
	mov	edx, DWORD PTR _i_ctrl$[ebp]
	push	edx
	mov	eax, DWORD PTR _cntxt$[ebp]
	push	eax
	call	_table_search_filter
	add	esp, 12					; 0000000cH
	test	eax, eax
	je	SHORT $L70699
	push	476					; 000001dcH
	push	OFFSET FLAT:$SG70700
	push	OFFSET FLAT:$SG70701
	mov	ecx, DWORD PTR _cntxt$[ebp]
	push	ecx
	call	_err_clear
	add	esp, 16					; 00000010H
$L70699:

; 477  : 	}

	jmp	SHORT $L70697
$L70698:
$eva_noerr$70578:

; 478  : 
; 479  : 	RETURN_OK_CLEANUP;

	push	0
	push	OFFSET FLAT:$SG70702
	push	OFFSET FLAT:$SG70703
	mov	edx, DWORD PTR _cntxt$[ebp]
	push	edx
	call	_err_clear
	add	esp, 16					; 00000010H
$eva_err$70576:
	mov	eax, DWORD PTR _cntxt$[ebp]
	cmp	DWORD PTR [eax+29872], 0
	je	SHORT $L70704
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	edx, DWORD PTR [ecx+29900]
	push	edx
	push	OFFSET FLAT:$SG70705
	push	OFFSET FLAT:$SG70706
	mov	eax, DWORD PTR _cntxt$[ebp]
	push	eax
	call	_err_add_context
	add	esp, 16					; 00000010H
$L70704:
	lea	ecx, DWORD PTR _flt$[ebp]
	push	ecx
	call	_qry_build_free
	add	esp, 4
	lea	edx, DWORD PTR _data$[ebp]
	push	edx
	call	_dyntab_free
	add	esp, 4
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	ecx, DWORD PTR _sql_trace$[ebp]
	mov	DWORD PTR [eax+29852], ecx
	mov	edx, DWORD PTR _cntxt$[ebp]
	xor	eax, eax
	cmp	DWORD PTR [edx+29872], 0
	setne	al

; 480  : }

	pop	edi
	mov	esp, ebp
	pop	ebp
	ret	0
_table_word_search ENDP
_TEXT	ENDS
END
