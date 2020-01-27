	TITLE	D:\Travail\ABI\EVA\V4.0\CGI\Brunix-2016\sql_values.c
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
PUBLIC	_sql_id_values
EXTRN	_sql_exec_query:NEAR
EXTRN	_mem_free:NEAR
EXTRN	_export_tabrc:BYTE
EXTRN	_dynbuf_add3:NEAR
EXTRN	_dynbuf_add3_int:NEAR
EXTRN	_dyntab_free:NEAR
EXTRN	_sql_get_table:NEAR
EXTRN	_dyntab_add:NEAR
EXTRN	_strchr:NEAR
EXTRN	_err_add_context:NEAR
EXTRN	_err_clear:NEAR
EXTRN	_qry_parse_matchmode:NEAR
_BSS	SEGMENT
$SG70248 DB	01H DUP (?)
_BSS	ENDS
_DATA	SEGMENT
$SG70226 DB	' ', 0aH, 09H, 0dH, 00H
	ORG $+3
$SG70230 DB	' ', 0aH, 09H, 0dH, 00H
	ORG $+3
$SG70236 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70239 DB	']', 0aH, 'SELECT IdValue, TxtValue FROM TVal AS TVal0 WH'
	DB	'ERE ', 00H
	ORG $+3
$SG70240 DB	'-- sql_id_values : [', 00H
	ORG $+3
$SG70242 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70245 DB	'TxtValue', 00H
	ORG $+3
$SG70249 DB	' LIMIT ', 00H
$SG70251 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70254 DB	'D:\Travail\ABI\EVA\V4.0\CGI\Brunix-2016\sql_values.c', 00H
	ORG $+3
$SG70255 DB	'sql_id_values', 00H
	ORG $+2
$SG70257 DB	'D:\Travail\ABI\EVA\V4.0\CGI\Brunix-2016\sql_values.c', 00H
	ORG $+3
$SG70258 DB	'sql_id_values', 00H
_DATA	ENDS
_TEXT	SEGMENT
_cntxt$ = 8
_res$ = 12
_val$ = 16
_sz_val$ = 20
_matchmode$ = 24
_limit$ = 28
_sql$ = -4
_value$ = -24
_sql_id_values PROC NEAR

; 29   : ){

	push	ebp
	mov	ebp, esp
	sub	esp, 28					; 0000001cH

; 30   :  	DynBuffer *sql = NULL;

	mov	DWORD PTR _sql$[ebp], 0

; 31   : 	DynTable value = {0};

	mov	DWORD PTR _value$[ebp], 0
	xor	eax, eax
	mov	DWORD PTR _value$[ebp+4], eax
	mov	DWORD PTR _value$[ebp+8], eax
	mov	DWORD PTR _value$[ebp+12], eax
	mov	DWORD PTR _value$[ebp+16], eax

; 32   : 
; 33   : 	/* Check & init params */
; 34   : 	if(!res) RETURN_OK;

	cmp	DWORD PTR _res$[ebp], 0
	jne	SHORT $L70220
	jmp	$eva_noerr$70221
$L70220:

; 35   : 	dyntab_free(res);

	mov	ecx, DWORD PTR _res$[ebp]
	push	ecx
	call	_dyntab_free
	add	esp, 4

; 36   : 	STRIP_SPACES_AROUND(val, sz_val);

	cmp	DWORD PTR _val$[ebp], 0
	je	SHORT $L70229
$L70224:
	cmp	DWORD PTR _sz_val$[ebp], 0
	je	SHORT $L70225
	mov	edx, DWORD PTR _val$[ebp]
	movsx	eax, BYTE PTR [edx]
	push	eax
	push	OFFSET FLAT:$SG70226
	call	_strchr
	add	esp, 8
	test	eax, eax
	je	SHORT $L70225
	mov	ecx, DWORD PTR _val$[ebp]
	add	ecx, 1
	mov	DWORD PTR _val$[ebp], ecx
	mov	edx, DWORD PTR _sz_val$[ebp]
	sub	edx, 1
	mov	DWORD PTR _sz_val$[ebp], edx
	jmp	SHORT $L70224
$L70225:
	cmp	DWORD PTR _sz_val$[ebp], 0
	je	SHORT $L70229
	mov	eax, DWORD PTR _val$[ebp]
	add	eax, DWORD PTR _sz_val$[ebp]
	movsx	ecx, BYTE PTR [eax-1]
	push	ecx
	push	OFFSET FLAT:$SG70230
	call	_strchr
	add	esp, 8
	test	eax, eax
	je	SHORT $L70229
	mov	edx, DWORD PTR _sz_val$[ebp]
	sub	edx, 1
	mov	DWORD PTR _sz_val$[ebp], edx
	jmp	SHORT $L70225
$L70229:

; 37   : 	if(!val || !*val || !sz_val) RETURN_OK;

	cmp	DWORD PTR _val$[ebp], 0
	je	SHORT $L70232
	mov	eax, DWORD PTR _val$[ebp]
	movsx	ecx, BYTE PTR [eax]
	test	ecx, ecx
	je	SHORT $L70232
	cmp	DWORD PTR _sz_val$[ebp], 0
	jne	SHORT $L70231
$L70232:
	jmp	$eva_noerr$70221
$L70231:

; 38   : 	DYNTAB_ADD(&value, 0, 0, val, sz_val, NO_CONV);

	push	0
	push	0
	mov	edx, DWORD PTR _sz_val$[ebp]
	push	edx
	mov	eax, DWORD PTR _val$[ebp]
	push	eax
	push	0
	push	0
	lea	ecx, DWORD PTR _value$[ebp]
	push	ecx
	call	_dyntab_add
	add	esp, 28					; 0000001cH
	test	eax, eax
	je	SHORT $L70234
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29872], OFFSET FLAT:$SG70236
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 38		; 00000026H
	jmp	$eva_err$70237
$L70234:

; 42   : 		"-- sql_id_values : [", val, sz_val > 30 ? 30 : sz_val, EXPORT_TABRC, "]\n"
; 43   : 		"SELECT IdValue, TxtValue FROM TVal AS TVal0 WHERE ");

	cmp	DWORD PTR _sz_val$[ebp], 30		; 0000001eH
	jbe	SHORT $L70363
	mov	DWORD PTR -28+[ebp], 30			; 0000001eH
	jmp	SHORT $L70364
$L70363:
	mov	ecx, DWORD PTR _sz_val$[ebp]
	mov	DWORD PTR -28+[ebp], ecx
$L70364:
	push	52					; 00000034H
	push	OFFSET FLAT:$SG70239
	push	1
	push	OFFSET FLAT:_export_tabrc
	mov	edx, DWORD PTR -28+[ebp]
	push	edx
	mov	eax, DWORD PTR _val$[ebp]
	push	eax
	push	20					; 00000014H
	push	OFFSET FLAT:$SG70240
	lea	ecx, DWORD PTR _sql$[ebp]
	push	ecx
	call	_dynbuf_add3
	add	esp, 36					; 00000024H
	test	eax, eax
	je	SHORT $L70238
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29872], OFFSET FLAT:$SG70242
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 43		; 0000002bH
	jmp	$eva_err$70237
$L70238:

; 44   : 	if(qry_parse_matchmode(cntxt, &sql, "TxtValue", 0, matchmode, 0, &value, NULL))

	push	0
	lea	ecx, DWORD PTR _value$[ebp]
	push	ecx
	push	0
	mov	edx, DWORD PTR _matchmode$[ebp]
	push	edx
	push	0
	push	OFFSET FLAT:$SG70245
	lea	eax, DWORD PTR _sql$[ebp]
	push	eax
	mov	ecx, DWORD PTR _cntxt$[ebp]
	push	ecx
	call	_qry_parse_matchmode
	add	esp, 32					; 00000020H
	test	eax, eax
	je	SHORT $L70244

; 45   : 		STACK_ERROR;

	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 45		; 0000002dH
	jmp	$eva_err$70237
$L70244:

; 46   : 	if(limit)

	cmp	DWORD PTR _limit$[ebp], 0
	je	SHORT $L70247

; 47   : 		DYNBUF_ADD3_INT(&sql, " LIMIT ", limit, "");

	push	0
	push	OFFSET FLAT:$SG70248
	mov	eax, DWORD PTR _limit$[ebp]
	push	eax
	push	7
	push	OFFSET FLAT:$SG70249
	lea	ecx, DWORD PTR _sql$[ebp]
	push	ecx
	call	_dynbuf_add3_int
	add	esp, 24					; 00000018H
	test	eax, eax
	je	SHORT $L70247
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29872], OFFSET FLAT:$SG70251
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 47		; 0000002fH
	jmp	SHORT $eva_err$70237
$L70247:

; 48   : 	if(sql_exec_query(cntxt , sql->data) || sql_get_table(cntxt, res, 0)) STACK_ERROR;

	mov	ecx, DWORD PTR _sql$[ebp]
	add	ecx, 8
	push	ecx
	mov	edx, DWORD PTR _cntxt$[ebp]
	push	edx
	call	_sql_exec_query
	add	esp, 8
	test	eax, eax
	jne	SHORT $L70253
	push	0
	mov	eax, DWORD PTR _res$[ebp]
	push	eax
	mov	ecx, DWORD PTR _cntxt$[ebp]
	push	ecx
	call	_sql_get_table
	add	esp, 12					; 0000000cH
	test	eax, eax
	je	SHORT $eva_noerr$70221
$L70253:
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 48		; 00000030H
	jmp	SHORT $eva_err$70237
$eva_noerr$70221:

; 49   : 
; 50   : 	RETURN_OK_CLEANUP;

	push	0
	push	OFFSET FLAT:$SG70254
	push	OFFSET FLAT:$SG70255
	mov	eax, DWORD PTR _cntxt$[ebp]
	push	eax
	call	_err_clear
	add	esp, 16					; 00000010H
$eva_err$70237:
	mov	ecx, DWORD PTR _cntxt$[ebp]
	cmp	DWORD PTR [ecx+29872], 0
	je	SHORT $L70256
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	eax, DWORD PTR [edx+29900]
	push	eax
	push	OFFSET FLAT:$SG70257
	push	OFFSET FLAT:$SG70258
	mov	ecx, DWORD PTR _cntxt$[ebp]
	push	ecx
	call	_err_add_context
	add	esp, 16					; 00000010H
$L70256:
	lea	edx, DWORD PTR _value$[ebp]
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

; 51   : }

	mov	esp, ebp
	pop	ebp
	ret	0
_sql_id_values ENDP
_TEXT	ENDS
PUBLIC	_sql_id_value
EXTRN	_bsearch:NEAR
EXTRN	_qsort:NEAR
EXTRN	_strtoul:NEAR
EXTRN	_dyntab_val:NEAR
EXTRN	_strcmp:NEAR
EXTRN	_strncpy:NEAR
EXTRN	_dyntab_txt_cmp:NEAR
_DATA	SEGMENT
	ORG $+2
$SG70297 DB	'D:\Travail\ABI\EVA\V4.0\CGI\Brunix-2016\sql_values.c', 00H
	ORG $+3
$SG70298 DB	'sql_id_value', 00H
	ORG $+3
$SG70300 DB	'D:\Travail\ABI\EVA\V4.0\CGI\Brunix-2016\sql_values.c', 00H
	ORG $+3
$SG70301 DB	'sql_id_value', 00H
_DATA	ENDS
_TEXT	SEGMENT
_cntxt$ = 8
_val$ = 12
_sz_val$ = 16
_id$ = 20
_sqlres$ = -20
_i$ = -24
_vc$70279 = -28
_v$70280 = -92
_vc$70293 = -96
_sql_id_value PROC NEAR

; 66   : ){

	push	ebp
	mov	ebp, esp
	sub	esp, 96					; 00000060H
	push	edi

; 67   : 	DynTable sqlres = { 0 };

	mov	DWORD PTR _sqlres$[ebp], 0
	xor	eax, eax
	mov	DWORD PTR _sqlres$[ebp+4], eax
	mov	DWORD PTR _sqlres$[ebp+8], eax
	mov	DWORD PTR _sqlres$[ebp+12], eax
	mov	DWORD PTR _sqlres$[ebp+16], eax

; 68   : 	unsigned long i;
; 69   : 
; 70   : 	/* Initialize & check params */
; 71   : 	if(!id) RETURN_OK;

	cmp	DWORD PTR _id$[ebp], 0
	jne	SHORT $L70273
	jmp	$eva_noerr$70274
$L70273:

; 72   : 	*id = 0;

	mov	ecx, DWORD PTR _id$[ebp]
	mov	DWORD PTR [ecx], 0

; 73   : 	if(!val || !*val) RETURN_OK;

	cmp	DWORD PTR _val$[ebp], 0
	je	SHORT $L70276
	mov	edx, DWORD PTR _val$[ebp]
	movsx	eax, BYTE PTR [edx]
	test	eax, eax
	jne	SHORT $L70275
$L70276:
	jmp	$eva_noerr$70274
$L70275:

; 74   : 
; 75   : 	/* Handle value cache if value fits in cache */
; 76   : 	if(!(cntxt && cntxt->form && cntxt->form->b_extern) && sz_val < sizeof(cntxt->vc[0].val))

	cmp	DWORD PTR _cntxt$[ebp], 0
	je	SHORT $L70278
	mov	ecx, DWORD PTR _cntxt$[ebp]
	cmp	DWORD PTR [ecx+80], 0
	je	SHORT $L70278
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	eax, DWORD PTR [edx+80]
	cmp	DWORD PTR [eax+76], 0
	jne	SHORT $L70284
$L70278:
	cmp	DWORD PTR _sz_val$[ebp], 64		; 00000040H
	jae	SHORT $L70284

; 78   : 		struct ValCache *vc;
; 79   : 		char v[sizeof(vc->val)] = {0};

	mov	BYTE PTR _v$70280[ebp], 0
	mov	ecx, 15					; 0000000fH
	xor	eax, eax
	lea	edi, DWORD PTR _v$70280[ebp+1]
	rep stosd
	stosw
	stosb

; 80   : 		strncpy(v, val, sz_val);

	mov	ecx, DWORD PTR _sz_val$[ebp]
	push	ecx
	mov	edx, DWORD PTR _val$[ebp]
	push	edx
	lea	eax, DWORD PTR _v$70280[ebp]
	push	eax
	call	_strncpy
	add	esp, 12					; 0000000cH

; 81   : 		vc = bsearch(v, cntxt->vc, cntxt->vc_nb, sizeof(cntxt->vc[0]), (int(*) (const void*,const void*)) strcmp);

	push	OFFSET FLAT:_strcmp
	push	68					; 00000044H
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	edx, DWORD PTR [ecx+269632]
	push	edx
	mov	eax, DWORD PTR _cntxt$[ebp]
	add	eax, 130368				; 0001fd40H
	push	eax
	lea	ecx, DWORD PTR _v$70280[ebp]
	push	ecx
	call	_bsearch
	add	esp, 20					; 00000014H
	mov	DWORD PTR _vc$70279[ebp], eax

; 82   : 		if(vc)

	cmp	DWORD PTR _vc$70279[ebp], 0
	je	SHORT $L70284

; 84   : 			/* Return if value found in cache */
; 85   : 			*id = vc->id;

	mov	edx, DWORD PTR _id$[ebp]
	mov	eax, DWORD PTR _vc$70279[ebp]
	mov	ecx, DWORD PTR [eax+64]
	mov	DWORD PTR [edx], ecx

; 86   : 			RETURN_OK;

	jmp	$eva_noerr$70274
$L70284:

; 89   : 
; 90   : 	/* Search value in values table */
; 91   : 	if(sql_id_values(cntxt , &sqlres, val, sz_val, Exact, 0)) STACK_ERROR;

	push	0
	push	6
	mov	edx, DWORD PTR _sz_val$[ebp]
	push	edx
	mov	eax, DWORD PTR _val$[ebp]
	push	eax
	lea	ecx, DWORD PTR _sqlres$[ebp]
	push	ecx
	mov	edx, DWORD PTR _cntxt$[ebp]
	push	edx
	call	_sql_id_values
	add	esp, 24					; 00000018H
	test	eax, eax
	je	SHORT $L70285
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 91		; 0000005bH
	jmp	$eva_err$70286
$L70285:

; 92   : 
; 93   : 	/* Search for exact value in results */
; 94   : 	for(i = 0; !*id && i < sqlres.nbrows; i++)

	mov	DWORD PTR _i$[ebp], 0
	jmp	SHORT $L70287
$L70288:
	mov	ecx, DWORD PTR _i$[ebp]
	add	ecx, 1
	mov	DWORD PTR _i$[ebp], ecx
$L70287:
	mov	edx, DWORD PTR _id$[ebp]
	cmp	DWORD PTR [edx], 0
	jne	SHORT $L70289
	mov	eax, DWORD PTR _i$[ebp]
	cmp	eax, DWORD PTR _sqlres$[ebp]
	jae	SHORT $L70289

; 95   : 		if(!dyntab_txt_cmp(val, sz_val, &sqlres, i, 1))

	push	1
	mov	ecx, DWORD PTR _i$[ebp]
	push	ecx
	lea	edx, DWORD PTR _sqlres$[ebp]
	push	edx
	mov	eax, DWORD PTR _sz_val$[ebp]
	push	eax
	mov	ecx, DWORD PTR _val$[ebp]
	push	ecx
	call	_dyntab_txt_cmp
	add	esp, 20					; 00000014H
	test	eax, eax
	jne	SHORT $L70290

; 96   : 			*id = DYNTAB_TOULRC(&sqlres, i, 0);

	push	10					; 0000000aH
	push	0
	push	0
	mov	edx, DWORD PTR _i$[ebp]
	push	edx
	lea	eax, DWORD PTR _sqlres$[ebp]
	push	eax
	call	_dyntab_val
	add	esp, 12					; 0000000cH
	push	eax
	call	_strtoul
	add	esp, 12					; 0000000cH
	mov	ecx, DWORD PTR _id$[ebp]
	mov	DWORD PTR [ecx], eax
$L70290:

; 97   : 
; 98   : 	/* Insert value in cache if applicable */
; 99   : 	if(*id && sz_val < sizeof(cntxt->vc[0].val) && cntxt->vc_nb < sizeof(cntxt->vc)/sizeof(cntxt->vc[0]))

	jmp	SHORT $L70288
$L70289:
	mov	edx, DWORD PTR _id$[ebp]
	cmp	DWORD PTR [edx], 0
	je	$eva_noerr$70274
	cmp	DWORD PTR _sz_val$[ebp], 64		; 00000040H
	jae	SHORT $eva_noerr$70274
	mov	eax, DWORD PTR _cntxt$[ebp]
	cmp	DWORD PTR [eax+269632], 2048		; 00000800H
	jae	SHORT $eva_noerr$70274

; 101  : 		struct ValCache *vc = cntxt->vc + cntxt->vc_nb++;

	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	edx, DWORD PTR [ecx+269632]
	imul	edx, 68					; 00000044H
	mov	eax, DWORD PTR _cntxt$[ebp]
	lea	ecx, DWORD PTR [eax+edx+130368]
	mov	DWORD PTR _vc$70293[ebp], ecx
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	eax, DWORD PTR [edx+269632]
	add	eax, 1
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+269632], eax

; 102  : 		strncpy(vc->val, val, sz_val);

	mov	edx, DWORD PTR _sz_val$[ebp]
	push	edx
	mov	eax, DWORD PTR _val$[ebp]
	push	eax
	mov	ecx, DWORD PTR _vc$70293[ebp]
	push	ecx
	call	_strncpy
	add	esp, 12					; 0000000cH

; 103  : 		vc->id = *id;

	mov	edx, DWORD PTR _vc$70293[ebp]
	mov	eax, DWORD PTR _id$[ebp]
	mov	ecx, DWORD PTR [eax]
	mov	DWORD PTR [edx+64], ecx

; 104  : 		qsort(cntxt->vc, cntxt->vc_nb, sizeof(cntxt->vc[0]), (int(*) (const void*,const void*)) strcmp);

	push	OFFSET FLAT:_strcmp
	push	68					; 00000044H
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	eax, DWORD PTR [edx+269632]
	push	eax
	mov	ecx, DWORD PTR _cntxt$[ebp]
	add	ecx, 130368				; 0001fd40H
	push	ecx
	call	_qsort
	add	esp, 16					; 00000010H
$eva_noerr$70274:

; 106  : 	RETURN_OK_CLEANUP;

	push	0
	push	OFFSET FLAT:$SG70297
	push	OFFSET FLAT:$SG70298
	mov	edx, DWORD PTR _cntxt$[ebp]
	push	edx
	call	_err_clear
	add	esp, 16					; 00000010H
$eva_err$70286:
	mov	eax, DWORD PTR _cntxt$[ebp]
	cmp	DWORD PTR [eax+29872], 0
	je	SHORT $L70299
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	edx, DWORD PTR [ecx+29900]
	push	edx
	push	OFFSET FLAT:$SG70300
	push	OFFSET FLAT:$SG70301
	mov	eax, DWORD PTR _cntxt$[ebp]
	push	eax
	call	_err_add_context
	add	esp, 16					; 00000010H
$L70299:
	lea	ecx, DWORD PTR _sqlres$[ebp]
	push	ecx
	call	_dyntab_free
	add	esp, 4
	mov	edx, DWORD PTR _cntxt$[ebp]
	xor	eax, eax
	cmp	DWORD PTR [edx+29872], 0
	setne	al

; 107  : }

	pop	edi
	mov	esp, ebp
	pop	ebp
	ret	0
_sql_id_value ENDP
_TEXT	ENDS
PUBLIC	_get_id_value
_TEXT	SEGMENT
_cntxt$ = 8
_val$ = 12
_sz_val$ = 16
_res$ = -4
_get_id_value PROC NEAR

; 119  : ){

	push	ebp
	mov	ebp, esp
	push	ecx

; 120  : 	unsigned long res;
; 121  : 	return sql_id_value(cntxt , val, sz_val, &res) ? 0 : res;

	lea	eax, DWORD PTR _res$[ebp]
	push	eax
	mov	ecx, DWORD PTR _sz_val$[ebp]
	push	ecx
	mov	edx, DWORD PTR _val$[ebp]
	push	edx
	mov	eax, DWORD PTR _cntxt$[ebp]
	push	eax
	call	_sql_id_value
	add	esp, 16					; 00000010H
	neg	eax
	sbb	eax, eax
	not	eax
	and	eax, DWORD PTR _res$[ebp]

; 122  : }

	mov	esp, ebp
	pop	ebp
	ret	0
_get_id_value ENDP
_TEXT	ENDS
PUBLIC	_sql_add_value
EXTRN	_sql_no_quote:BYTE
EXTRN	_dynbuf_add:NEAR
_DATA	SEGMENT
	ORG $+3
$SG70327 DB	'Il y a un bug - mauvais param', 0e8H, 'tres', 00H
	ORG $+1
$SG70336 DB	'-- sql_add_value : Get the next available IdValue', 0aH, 'S'
	DB	'ELECT Max(IdValue)+1 FROM TVal', 00H
	ORG $+2
$SG70339 DB	', ', 00H
	ORG $+1
$SG70340 DB	'-- sql_add_value : Insert New value in values table', 0aH
	DB	'INSERT INTO TVal (IdValue, TxtValue) VALUES (', 00H
	ORG $+2
$SG70342 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70344 DB	''')', 00H
	ORG $+1
$SG70345 DB	'''', 00H
	ORG $+2
$SG70347 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70351 DB	'val=', 00H
	ORG $+3
$SG70353 DB	'Impossible de cr', 0e9H, 'er une nouvelle valeur', 00H
$SG70354 DB	'D:\Travail\ABI\EVA\V4.0\CGI\Brunix-2016\sql_values.c', 00H
	ORG $+3
$SG70355 DB	'sql_add_value', 00H
	ORG $+2
$SG70357 DB	'D:\Travail\ABI\EVA\V4.0\CGI\Brunix-2016\sql_values.c', 00H
	ORG $+3
$SG70358 DB	'sql_add_value', 00H
_DATA	ENDS
_TEXT	SEGMENT
_cntxt$ = 8
_val$ = 12
_sz_val$ = 16
_id$ = 20
_sqlres$ = -24
_sql$ = -4
_sql_add_value PROC NEAR

; 139  : {

	push	ebp
	mov	ebp, esp
	sub	esp, 28					; 0000001cH

; 140  : 	DynTable sqlres = { 0 };

	mov	DWORD PTR _sqlres$[ebp], 0
	xor	eax, eax
	mov	DWORD PTR _sqlres$[ebp+4], eax
	mov	DWORD PTR _sqlres$[ebp+8], eax
	mov	DWORD PTR _sqlres$[ebp+12], eax
	mov	DWORD PTR _sqlres$[ebp+16], eax

; 141  :  	DynBuffer *sql = NULL;

	mov	DWORD PTR _sql$[ebp], 0

; 142  : 
; 143  : 	/* Check params */
; 144  : 	if(!id) RETURN_ERR_PARAM(NOP);

	cmp	DWORD PTR _id$[ebp], 0
	jne	SHORT $L70325
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29872], OFFSET FLAT:$SG70327
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 144		; 00000090H
	jmp	$eva_err$70328
$L70325:

; 145  : 	*id = 0;

	mov	eax, DWORD PTR _id$[ebp]
	mov	DWORD PTR [eax], 0

; 146  : 	if(!val || !*val || !sz_val) RETURN_OK;

	cmp	DWORD PTR _val$[ebp], 0
	je	SHORT $L70330
	mov	ecx, DWORD PTR _val$[ebp]
	movsx	edx, BYTE PTR [ecx]
	test	edx, edx
	je	SHORT $L70330
	cmp	DWORD PTR _sz_val$[ebp], 0
	jne	SHORT $L70329
$L70330:
	jmp	$eva_noerr$70331
$L70329:

; 147  : 
; 148  : 	/* Get value Id & return if found */
; 149  : 	if(sql_id_value(cntxt, val, sz_val, id)) STACK_ERROR;

	mov	eax, DWORD PTR _id$[ebp]
	push	eax
	mov	ecx, DWORD PTR _sz_val$[ebp]
	push	ecx
	mov	edx, DWORD PTR _val$[ebp]
	push	edx
	mov	eax, DWORD PTR _cntxt$[ebp]
	push	eax
	call	_sql_id_value
	add	esp, 16					; 00000010H
	test	eax, eax
	je	SHORT $L70332
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 149		; 00000095H
	jmp	$eva_err$70328
$L70332:

; 150  : 	if(*id) RETURN_OK;

	mov	edx, DWORD PTR _id$[ebp]
	cmp	DWORD PTR [edx], 0
	je	SHORT $L70333
	jmp	$eva_noerr$70331
$L70333:

; 154  : 		/* Get the next available IdValue */
; 155  : 		if(sql_exec_query(cntxt ,
; 156  : 			"-- sql_add_value : Get the next available IdValue\n"
; 157  : 			"SELECT Max(IdValue)+1 FROM TVal") ||
; 158  : 			sql_get_table(cntxt, &sqlres, 0)) STACK_ERROR;

	push	OFFSET FLAT:$SG70336
	mov	eax, DWORD PTR _cntxt$[ebp]
	push	eax
	call	_sql_exec_query
	add	esp, 8
	test	eax, eax
	jne	SHORT $L70335
	push	0
	lea	ecx, DWORD PTR _sqlres$[ebp]
	push	ecx
	mov	edx, DWORD PTR _cntxt$[ebp]
	push	edx
	call	_sql_get_table
	add	esp, 12					; 0000000cH
	test	eax, eax
	je	SHORT $L70334
$L70335:
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 158		; 0000009eH
	jmp	$eva_err$70328
$L70334:

; 159  : 		*id = sqlres.nbrows ? DYNTAB_TOUL(&sqlres) : 1;

	cmp	DWORD PTR _sqlres$[ebp], 0
	je	SHORT $L70368
	push	10					; 0000000aH
	push	0
	push	0
	push	0
	lea	ecx, DWORD PTR _sqlres$[ebp]
	push	ecx
	call	_dyntab_val
	add	esp, 12					; 0000000cH
	push	eax
	call	_strtoul
	add	esp, 12					; 0000000cH
	mov	DWORD PTR -28+[ebp], eax
	jmp	SHORT $L70369
$L70368:
	mov	DWORD PTR -28+[ebp], 1
$L70369:
	mov	edx, DWORD PTR _id$[ebp]
	mov	eax, DWORD PTR -28+[ebp]
	mov	DWORD PTR [edx], eax

; 163  : 			"-- sql_add_value : Insert New value in values table\n"
; 164  : 			"INSERT INTO TVal (IdValue, TxtValue) VALUES (", *id, ", ");

	push	2
	push	OFFSET FLAT:$SG70339
	mov	ecx, DWORD PTR _id$[ebp]
	mov	edx, DWORD PTR [ecx]
	push	edx
	push	97					; 00000061H
	push	OFFSET FLAT:$SG70340
	lea	eax, DWORD PTR _sql$[ebp]
	push	eax
	call	_dynbuf_add3_int
	add	esp, 24					; 00000018H
	test	eax, eax
	je	SHORT $L70338
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29872], OFFSET FLAT:$SG70342
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 164		; 000000a4H
	jmp	$eva_err$70328
$L70338:

; 165  : 		DYNBUF_ADD3(&sql, "'", val, sz_val, SQL_NO_QUOTE, "')");

	push	2
	push	OFFSET FLAT:$SG70344
	push	1
	push	OFFSET FLAT:_sql_no_quote
	mov	eax, DWORD PTR _sz_val$[ebp]
	push	eax
	mov	ecx, DWORD PTR _val$[ebp]
	push	ecx
	push	1
	push	OFFSET FLAT:$SG70345
	lea	edx, DWORD PTR _sql$[ebp]
	push	edx
	call	_dynbuf_add3
	add	esp, 36					; 00000024H
	test	eax, eax
	je	SHORT $L70343
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29872], OFFSET FLAT:$SG70347
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 165		; 000000a5H
	jmp	$eva_err$70328
$L70343:

; 166  : 		if(sql_exec_query(cntxt , sql->data)) STACK_ERROR;

	mov	edx, DWORD PTR _sql$[ebp]
	add	edx, 8
	push	edx
	mov	eax, DWORD PTR _cntxt$[ebp]
	push	eax
	call	_sql_exec_query
	add	esp, 8
	test	eax, eax
	je	SHORT $L70348
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 166		; 000000a6H
	jmp	SHORT $eva_err$70328
$L70348:

; 168  : 
; 169  : 	//if(sql_id_value(cntxt, val, sz_val, id)) STACK_ERROR;
; 170  : 	if(!*id) RETURN_ERROR("Impossible de créer une nouvelle valeur", ERR_PUT_TXT("val=", val, sz_val));

	mov	edx, DWORD PTR _id$[ebp]
	cmp	DWORD PTR [edx], 0
	jne	SHORT $eva_noerr$70331
	push	0
	push	0
	push	4
	push	OFFSET FLAT:$SG70351
	mov	eax, DWORD PTR _cntxt$[ebp]
	add	eax, 29876				; 000074b4H
	push	eax
	call	_dynbuf_add
	add	esp, 20					; 00000014H
	push	0
	push	0
	mov	ecx, DWORD PTR _sz_val$[ebp]
	push	ecx
	mov	edx, DWORD PTR _val$[ebp]
	push	edx
	mov	eax, DWORD PTR _cntxt$[ebp]
	add	eax, 29876				; 000074b4H
	push	eax
	call	_dynbuf_add
	add	esp, 20					; 00000014H
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29872], OFFSET FLAT:$SG70353
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 170		; 000000aaH
	jmp	SHORT $eva_err$70328
$eva_noerr$70331:

; 171  : 
; 172  : 	RETURN_OK_CLEANUP;

	push	0
	push	OFFSET FLAT:$SG70354
	push	OFFSET FLAT:$SG70355
	mov	eax, DWORD PTR _cntxt$[ebp]
	push	eax
	call	_err_clear
	add	esp, 16					; 00000010H
$eva_err$70328:
	mov	ecx, DWORD PTR _cntxt$[ebp]
	cmp	DWORD PTR [ecx+29872], 0
	je	SHORT $L70356
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	eax, DWORD PTR [edx+29900]
	push	eax
	push	OFFSET FLAT:$SG70357
	push	OFFSET FLAT:$SG70358
	mov	ecx, DWORD PTR _cntxt$[ebp]
	push	ecx
	call	_err_add_context
	add	esp, 16					; 00000010H
$L70356:
	lea	edx, DWORD PTR _sqlres$[ebp]
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

; 173  : }

	mov	esp, ebp
	pop	ebp
	ret	0
_sql_add_value ENDP
_TEXT	ENDS
END
