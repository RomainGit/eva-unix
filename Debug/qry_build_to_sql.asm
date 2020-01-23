	TITLE	D:\Travail\ABI\EVA\V4.0\CGI\Brunix-2016\qry_build_to_sql.c
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
PUBLIC	_qry_filter_rel_to_sql
EXTRN	_form_eval_valtype:NEAR
EXTRN	_qry_values_list:NEAR
EXTRN	_dynbuf_add:NEAR
EXTRN	_dyntab_free:NEAR
EXTRN	_strcmp:NEAR
EXTRN	_err_add_context:NEAR
EXTRN	_dyntab_to_dynbuf:NEAR
EXTRN	_err_clear:NEAR
EXTRN	_dyntab_filter_field:NEAR
EXTRN	_dyntab_field_val:NEAR
_DATA	SEGMENT
$SG70218 DB	'_EVA_FILTER_RELTYPE', 00H
$SG70220 DB	'_EVA_FILTER_RELWITH', 00H
$SG70222 DB	'_EVA_FILTER_NOT', 00H
$SG70225 DB	'_EVA_LISTOBJ', 00H
	ORG $+3
$SG70227 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70231 DB	'_EVA_FILTER_LINKFIELD', 00H
	ORG $+2
$SG70233 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70236 DB	'_EVA_RELREVERSE', 00H
$SG70237 DB	'[FIRST(<-', 00H
	ORG $+2
$SG70238 DB	'[FIRST(', 00H
$SG70240 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70244 DB	'->', 00H
	ORG $+1
$SG70246 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70250 DB	',', 00H
	ORG $+2
$SG70251 DB	',', 00H
	ORG $+2
$SG70253 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70256 DB	')]', 00H
	ORG $+1
$SG70258 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70264 DB	' NOT', 00H
	ORG $+3
$SG70266 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70269 DB	' IN(', 00H
	ORG $+3
$SG70271 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70275 DB	')', 00H
	ORG $+2
$SG70277 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70281 DB	'_EVA_FILTERS', 00H
	ORG $+3
$SG70283 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70286 DB	'Relation to objects matching other filter is not impleme'
	DB	'nted yet', 00H
	ORG $+3
$SG70290 DB	'<>''''', 00H
	ORG $+3
$SG70292 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70294 DB	'D:\Travail\ABI\EVA\V4.0\CGI\Brunix-2016\qry_build_to_sql'
	DB	'.c', 00H
	ORG $+1
$SG70295 DB	'qry_filter_rel_to_sql', 00H
	ORG $+2
$SG70297 DB	'D:\Travail\ABI\EVA\V4.0\CGI\Brunix-2016\qry_build_to_sql'
	DB	'.c', 00H
	ORG $+1
$SG70298 DB	'qry_filter_rel_to_sql', 00H
_DATA	ENDS
_TEXT	SEGMENT
_cntxt$ = 8
_sqlexpr$ = 12
_fltfield$ = 16
_flt_data$ = 20
_fltval$ = -20
_fltobj$ = -68
_resdata$ = -44
_reltype$ = -48
_fltop$ = -24
_b_not$ = -72
_qry_filter_rel_to_sql PROC NEAR

; 29   : ){

	push	ebp
	mov	ebp, esp
	sub	esp, 76					; 0000004cH

; 30   : 	DynTable fltval = { 0 };

	mov	DWORD PTR _fltval$[ebp], 0
	xor	eax, eax
	mov	DWORD PTR _fltval$[ebp+4], eax
	mov	DWORD PTR _fltval$[ebp+8], eax
	mov	DWORD PTR _fltval$[ebp+12], eax
	mov	DWORD PTR _fltval$[ebp+16], eax

; 31   : 	DynTable fltobj = { 0 };

	mov	DWORD PTR _fltobj$[ebp], 0
	xor	ecx, ecx
	mov	DWORD PTR _fltobj$[ebp+4], ecx
	mov	DWORD PTR _fltobj$[ebp+8], ecx
	mov	DWORD PTR _fltobj$[ebp+12], ecx
	mov	DWORD PTR _fltobj$[ebp+16], ecx

; 32   : 	DynTable resdata = { 0 };

	mov	DWORD PTR _resdata$[ebp], 0
	xor	edx, edx
	mov	DWORD PTR _resdata$[ebp+4], edx
	mov	DWORD PTR _resdata$[ebp+8], edx
	mov	DWORD PTR _resdata$[ebp+12], edx
	mov	DWORD PTR _resdata$[ebp+16], edx

; 33   : 	char *reltype = DYNTAB_FIELD_VAL(flt_data, FILTER_RELTYPE);

	push	0
	push	-1
	push	OFFSET FLAT:$SG70218
	mov	eax, DWORD PTR _flt_data$[ebp]
	push	eax
	call	_dyntab_field_val
	add	esp, 16					; 00000010H
	mov	DWORD PTR _reltype$[ebp], eax

; 34   : 	char *fltop = DYNTAB_FIELD_VAL(flt_data, FILTER_RELWITH);

	push	0
	push	-1
	push	OFFSET FLAT:$SG70220
	mov	ecx, DWORD PTR _flt_data$[ebp]
	push	ecx
	call	_dyntab_field_val
	add	esp, 16					; 00000010H
	mov	DWORD PTR _fltop$[ebp], eax

; 35   : 	int b_not = DYNTAB_FIELD_VAL(flt_data, FILTER_NOT)[0] != 0;

	push	0
	push	-1
	push	OFFSET FLAT:$SG70222
	mov	edx, DWORD PTR _flt_data$[ebp]
	push	edx
	call	_dyntab_field_val
	add	esp, 16					; 00000010H
	movsx	eax, BYTE PTR [eax]
	neg	eax
	sbb	eax, eax
	neg	eax
	mov	DWORD PTR _b_not$[ebp], eax

; 36   : 	DYNTAB_FIELD(&fltobj, flt_data, LISTOBJ);

	lea	ecx, DWORD PTR _fltobj$[ebp]
	push	ecx
	call	_dyntab_free
	add	esp, 4
	push	0
	push	-1
	push	OFFSET FLAT:$SG70225
	mov	edx, DWORD PTR _flt_data$[ebp]
	push	edx
	push	0
	lea	eax, DWORD PTR _fltobj$[ebp]
	push	eax
	call	_dyntab_filter_field
	add	esp, 24					; 00000018H
	test	eax, eax
	je	SHORT $L70224
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29872], OFFSET FLAT:$SG70227
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 36		; 00000024H
	jmp	$eva_err$70228
$L70224:

; 37   : 	DYNTAB_FIELD(&fltval, flt_data, FILTER_LINKFIELD);

	lea	eax, DWORD PTR _fltval$[ebp]
	push	eax
	call	_dyntab_free
	add	esp, 4
	push	0
	push	-1
	push	OFFSET FLAT:$SG70231
	mov	ecx, DWORD PTR _flt_data$[ebp]
	push	ecx
	push	0
	lea	edx, DWORD PTR _fltval$[ebp]
	push	edx
	call	_dyntab_filter_field
	add	esp, 24					; 00000018H
	test	eax, eax
	je	SHORT $L70230
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29872], OFFSET FLAT:$SG70233
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 37		; 00000025H
	jmp	$eva_err$70228
$L70230:

; 38   : 
; 39   : 	/* Add relation type, field, & NOT operator if applicable */
; 40   : 	DYNBUF_ADD(sqlexpr, !strcmp("_EVA_RELREVERSE", reltype) ? "[FIRST(<-" : "[FIRST(", 0, NO_CONV);

	mov	edx, DWORD PTR _reltype$[ebp]
	push	edx
	push	OFFSET FLAT:$SG70236
	call	_strcmp
	add	esp, 8
	test	eax, eax
	jne	SHORT $L70731
	mov	DWORD PTR -76+[ebp], OFFSET FLAT:$SG70237
	jmp	SHORT $L70732
$L70731:
	mov	DWORD PTR -76+[ebp], OFFSET FLAT:$SG70238
$L70732:
	push	0
	push	0
	push	0
	mov	eax, DWORD PTR -76+[ebp]
	push	eax
	mov	ecx, DWORD PTR _sqlexpr$[ebp]
	push	ecx
	call	_dynbuf_add
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L70235
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29872], OFFSET FLAT:$SG70240
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 40		; 00000028H
	jmp	$eva_err$70228
$L70235:

; 41   : 	if(!fltfield->nbrows)

	mov	ecx, DWORD PTR _fltfield$[ebp]
	cmp	DWORD PTR [ecx], 0
	jne	SHORT $L70241

; 43   : 		DYNBUF_ADD_STR(sqlexpr, "->");

	push	0
	push	0
	push	2
	push	OFFSET FLAT:$SG70244
	mov	edx, DWORD PTR _sqlexpr$[ebp]
	push	edx
	call	_dynbuf_add
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L70243
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29872], OFFSET FLAT:$SG70246
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 43		; 0000002bH
	jmp	$eva_err$70228
$L70243:

; 45   : 	else

	jmp	SHORT $L70249
$L70241:

; 46   : 		if(dyntab_to_dynbuf(fltfield, sqlexpr, ",", 1, ",", 1, NO_CONV)) RETURN_ERR_MEMORY;

	push	0
	push	0
	push	1
	push	OFFSET FLAT:$SG70250
	push	1
	push	OFFSET FLAT:$SG70251
	mov	edx, DWORD PTR _sqlexpr$[ebp]
	push	edx
	mov	eax, DWORD PTR _fltfield$[ebp]
	push	eax
	call	_dyntab_to_dynbuf
	add	esp, 32					; 00000020H
	test	eax, eax
	je	SHORT $L70249
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29872], OFFSET FLAT:$SG70253
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 46		; 0000002eH
	jmp	$eva_err$70228
$L70249:

; 47   : 	DYNBUF_ADD_STR(sqlexpr, ")]");

	push	0
	push	0
	push	2
	push	OFFSET FLAT:$SG70256
	mov	eax, DWORD PTR _sqlexpr$[ebp]
	push	eax
	call	_dynbuf_add
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L70255
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29872], OFFSET FLAT:$SG70258
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 47		; 0000002fH
	jmp	$eva_err$70228
$L70255:

; 48   : 
; 49   : 	if(*fltop)

	mov	eax, DWORD PTR _fltop$[ebp]
	movsx	ecx, BYTE PTR [eax]
	test	ecx, ecx
	je	$L70259

; 51   : 		/* Relation to field/expression of given object : evaluate field expression */
; 52   : 		if(form_eval_valtype(cntxt, &resdata, fltop, &fltobj, &fltval)) STACK_ERROR;

	lea	edx, DWORD PTR _fltval$[ebp]
	push	edx
	lea	eax, DWORD PTR _fltobj$[ebp]
	push	eax
	mov	ecx, DWORD PTR _fltop$[ebp]
	push	ecx
	lea	edx, DWORD PTR _resdata$[ebp]
	push	edx
	mov	eax, DWORD PTR _cntxt$[ebp]
	push	eax
	call	_form_eval_valtype
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L70260
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 52		; 00000034H
	jmp	$eva_err$70228
$L70260:

; 53   : 		if(b_not) DYNBUF_ADD_STR(sqlexpr, " NOT");

	cmp	DWORD PTR _b_not$[ebp], 0
	je	SHORT $L70263
	push	0
	push	0
	push	4
	push	OFFSET FLAT:$SG70264
	mov	edx, DWORD PTR _sqlexpr$[ebp]
	push	edx
	call	_dynbuf_add
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L70263
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29872], OFFSET FLAT:$SG70266
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 53		; 00000035H
	jmp	$eva_err$70228
$L70263:

; 54   : 		DYNBUF_ADD_STR(sqlexpr, " IN(");

	push	0
	push	0
	push	4
	push	OFFSET FLAT:$SG70269
	mov	edx, DWORD PTR _sqlexpr$[ebp]
	push	edx
	call	_dynbuf_add
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L70268
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29872], OFFSET FLAT:$SG70271
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 54		; 00000036H
	jmp	$eva_err$70228
$L70268:

; 55   : 		if(qry_values_list(cntxt, &resdata, 0, sqlexpr)) STACK_ERROR;

	mov	edx, DWORD PTR _sqlexpr$[ebp]
	push	edx
	push	0
	lea	eax, DWORD PTR _resdata$[ebp]
	push	eax
	mov	ecx, DWORD PTR _cntxt$[ebp]
	push	ecx
	call	_qry_values_list
	add	esp, 16					; 00000010H
	test	eax, eax
	je	SHORT $L70272
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 55		; 00000037H
	jmp	$eva_err$70228
$L70272:

; 56   : 		DYNBUF_ADD_STR(sqlexpr, ")");

	push	0
	push	0
	push	1
	push	OFFSET FLAT:$SG70275
	mov	eax, DWORD PTR _sqlexpr$[ebp]
	push	eax
	call	_dynbuf_add
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L70274
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29872], OFFSET FLAT:$SG70277
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 56		; 00000038H
	jmp	$eva_err$70228
$L70274:

; 58   : 	else

	jmp	$L70289
$L70259:

; 60   : 		/* Relation to objects matching other filter */
; 61   : 		DYNTAB_FIELD(&fltval, flt_data, FILTERS);

	lea	eax, DWORD PTR _fltval$[ebp]
	push	eax
	call	_dyntab_free
	add	esp, 4
	push	0
	push	-1
	push	OFFSET FLAT:$SG70281
	mov	ecx, DWORD PTR _flt_data$[ebp]
	push	ecx
	push	0
	lea	edx, DWORD PTR _fltval$[ebp]
	push	edx
	call	_dyntab_filter_field
	add	esp, 24					; 00000018H
	test	eax, eax
	je	SHORT $L70280
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29872], OFFSET FLAT:$SG70283
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 61		; 0000003dH
	jmp	SHORT $eva_err$70228
$L70280:

; 62   : 		if(fltval.nbrows)

	cmp	DWORD PTR _fltval$[ebp], 0
	je	SHORT $L70284

; 64   : 			RETURN_ERROR("Relation to objects matching other filter is not implemented yet", NOP);

	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29872], OFFSET FLAT:$SG70286
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 64		; 00000040H
	jmp	SHORT $eva_err$70228
$L70284:

; 66   : 		else
; 67   : 			DYNBUF_ADD_STR(sqlexpr, "<>''");

	push	0
	push	0
	push	4
	push	OFFSET FLAT:$SG70290
	mov	ecx, DWORD PTR _sqlexpr$[ebp]
	push	ecx
	call	_dynbuf_add
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L70289
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29872], OFFSET FLAT:$SG70292
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 67		; 00000043H
	jmp	SHORT $eva_err$70228
$L70289:
$eva_noerr$70293:

; 69   : 
; 70   : 	RETURN_OK_CLEANUP;

	push	0
	push	OFFSET FLAT:$SG70294
	push	OFFSET FLAT:$SG70295
	mov	ecx, DWORD PTR _cntxt$[ebp]
	push	ecx
	call	_err_clear
	add	esp, 16					; 00000010H
$eva_err$70228:
	mov	edx, DWORD PTR _cntxt$[ebp]
	cmp	DWORD PTR [edx+29872], 0
	je	SHORT $L70296
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	ecx, DWORD PTR [eax+29900]
	push	ecx
	push	OFFSET FLAT:$SG70297
	push	OFFSET FLAT:$SG70298
	mov	edx, DWORD PTR _cntxt$[ebp]
	push	edx
	call	_err_add_context
	add	esp, 16					; 00000010H
$L70296:
	lea	eax, DWORD PTR _fltobj$[ebp]
	push	eax
	call	_dyntab_free
	add	esp, 4
	lea	ecx, DWORD PTR _fltval$[ebp]
	push	ecx
	call	_dyntab_free
	add	esp, 4
	lea	edx, DWORD PTR _resdata$[ebp]
	push	edx
	call	_dyntab_free
	add	esp, 4
	mov	eax, DWORD PTR _cntxt$[ebp]
	xor	ecx, ecx
	cmp	DWORD PTR [eax+29872], 0
	setne	cl
	mov	eax, ecx

; 71   : }

	mov	esp, ebp
	pop	ebp
	ret	0
_qry_filter_rel_to_sql ENDP
_TEXT	ENDS
PUBLIC	_qry_filter_val_to_sql
EXTRN	_dynbuf_add3:NEAR
EXTRN	_dyntab_sz:NEAR
EXTRN	_dyntab_val:NEAR
_BSS	SEGMENT
$SG70408 DB	01H DUP (?)
	ALIGN	4

$SG70409 DB	01H DUP (?)
	ALIGN	4

$SG70414 DB	01H DUP (?)
	ALIGN	4

$SG70415 DB	01H DUP (?)
_BSS	ENDS
_DATA	SEGMENT
	ORG $+2
$SG70317 DB	'_EVA_FILTER_OP', 00H
	ORG $+1
$SG70319 DB	'_EVA_FILTER_VAL_TYPE', 00H
	ORG $+3
$SG70323 DB	' IN (', 00H
	ORG $+2
$SG70325 DB	')', 00H
	ORG $+2
$SG70330 DB	'_EVA_LISTOBJ', 00H
	ORG $+3
$SG70332 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70336 DB	'_EVA_FILTER_VALUE', 00H
	ORG $+2
$SG70338 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70341 DB	'_EVA_DIFFERENT', 00H
	ORG $+1
$SG70342 DB	' NOT IN (', 00H
	ORG $+2
$SG70343 DB	')', 00H
	ORG $+2
$SG70347 DB	'_EVA_SMALLER', 00H
	ORG $+3
$SG70348 DB	'<GREATEST('''',', 00H
	ORG $+2
$SG70349 DB	')', 00H
	ORG $+2
$SG70353 DB	'_EVA_SMALLEREQUAL', 00H
	ORG $+2
$SG70354 DB	'<=GREATEST('''',', 00H
	ORG $+1
$SG70355 DB	')', 00H
	ORG $+2
$SG70358 DB	'_EVA_GREATER', 00H
	ORG $+3
$SG70359 DB	'>LEAST('''',', 00H
	ORG $+1
$SG70360 DB	')', 00H
	ORG $+2
$SG70364 DB	'_EVA_GREATEREQUAL', 00H
	ORG $+2
$SG70365 DB	'>=LEAST('''',', 00H
$SG70366 DB	')', 00H
	ORG $+2
$SG70370 DB	'_EVA_BEGINWITH', 00H
	ORG $+1
$SG70371 DB	' LIKE ''', 00H
$SG70372 DB	'%''', 00H
	ORG $+1
$SG70373 DB	' OR ', 00H
	ORG $+3
$SG70376 DB	'_EVA_NOT_BEGINWITH', 00H
	ORG $+1
$SG70377 DB	' NOT LIKE ''', 00H
$SG70378 DB	'%''', 00H
	ORG $+1
$SG70379 DB	' OR ', 00H
	ORG $+3
$SG70382 DB	'_EVA_CONTAIN', 00H
	ORG $+3
$SG70383 DB	' LIKE ''%', 00H
	ORG $+3
$SG70384 DB	'%''', 00H
	ORG $+1
$SG70385 DB	' AND ', 00H
	ORG $+2
$SG70388 DB	'_EVA_NOT_CONTAIN', 00H
	ORG $+3
$SG70389 DB	' NOT LIKE ''%', 00H
	ORG $+3
$SG70390 DB	'%''', 00H
	ORG $+1
$SG70391 DB	' AND ', 00H
	ORG $+2
$SG70394 DB	'_EVA_LIKE', 00H
	ORG $+2
$SG70395 DB	' LIKE ''', 00H
$SG70396 DB	'''', 00H
	ORG $+2
$SG70397 DB	' OR ', 00H
	ORG $+3
$SG70400 DB	'_EVA_NOT_LIKE', 00H
	ORG $+2
$SG70401 DB	' NOT LIKE ''', 00H
$SG70402 DB	'''', 00H
	ORG $+2
$SG70403 DB	' AND ', 00H
	ORG $+2
$SG70406 DB	'_EVA_ISEMPTY', 00H
	ORG $+3
$SG70407 DB	'=''''', 00H
$SG70412 DB	'_EVA_ISNOTEMPTY', 00H
$SG70413 DB	'<>''''', 00H
	ORG $+3
$SG70419 DB	'_EVA_INTERVAL', 00H
	ORG $+2
$SG70420 DB	'_EVA_NOT_INTERVAL', 00H
	ORG $+2
$SG70422 DB	'_EVA_INTERVAL', 00H
	ORG $+2
$SG70425 DB	'NOT ', 00H
	ORG $+3
$SG70427 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70430 DB	'_EVA_FILTER_VAL_MIN', 00H
$SG70432 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70436 DB	'([FIRST(', 00H
	ORG $+3
$SG70438 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70441 DB	',', 00H
	ORG $+2
$SG70442 DB	',', 00H
	ORG $+2
$SG70444 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70447 DB	')]>LEAST(', 00H
	ORG $+2
$SG70449 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70453 DB	')', 00H
	ORG $+2
$SG70455 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70458 DB	'_EVA_FILTER_VAL_MAX', 00H
$SG70460 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70464 DB	' AND [FIRST(', 00H
	ORG $+3
$SG70466 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70469 DB	',', 00H
	ORG $+2
$SG70470 DB	',', 00H
	ORG $+2
$SG70472 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70475 DB	')]<=GREATEST(', 00H
	ORG $+2
$SG70477 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70481 DB	'))', 00H
	ORG $+1
$SG70483 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70494 DB	'[FIRST(', 00H
$SG70496 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70499 DB	',', 00H
	ORG $+2
$SG70500 DB	',', 00H
	ORG $+2
$SG70502 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70505 DB	')]', 00H
	ORG $+1
$SG70507 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70511 DB	' ', 00H
	ORG $+2
$SG70512 DB	' ', 00H
	ORG $+2
$SG70514 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70518 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70522 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70526 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70530 DB	'[FIRST(', 00H
$SG70532 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70535 DB	',', 00H
	ORG $+2
$SG70536 DB	',', 00H
	ORG $+2
$SG70538 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70541 DB	')]', 00H
	ORG $+1
$SG70543 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70547 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70552 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70554 DB	'D:\Travail\ABI\EVA\V4.0\CGI\Brunix-2016\qry_build_to_sql'
	DB	'.c', 00H
	ORG $+1
$SG70555 DB	'qry_filter_val_to_sql', 00H
	ORG $+2
$SG70557 DB	'D:\Travail\ABI\EVA\V4.0\CGI\Brunix-2016\qry_build_to_sql'
	DB	'.c', 00H
	ORG $+1
$SG70558 DB	'qry_filter_val_to_sql', 00H
_DATA	ENDS
_TEXT	SEGMENT
_cntxt$ = 8
_sqlexpr$ = 12
_fltfield$ = 16
_flt_data$ = 20
_fltval$ = -24
_fltobj$ = -92
_resdata$ = -68
_i$ = -72
_fltop$ = -44
_valtype$ = -40
_b_std$ = -36
_b_num$ = -4
_bef$ = -28
_aft$ = -32
_oper$ = -48
_qry_filter_val_to_sql PROC NEAR

; 88   : ){

	push	ebp
	mov	ebp, esp
	sub	esp, 92					; 0000005cH

; 89   : 	DynTable fltval = { 0 };

	mov	DWORD PTR _fltval$[ebp], 0
	xor	eax, eax
	mov	DWORD PTR _fltval$[ebp+4], eax
	mov	DWORD PTR _fltval$[ebp+8], eax
	mov	DWORD PTR _fltval$[ebp+12], eax
	mov	DWORD PTR _fltval$[ebp+16], eax

; 90   : 	DynTable fltobj = { 0 };

	mov	DWORD PTR _fltobj$[ebp], 0
	xor	ecx, ecx
	mov	DWORD PTR _fltobj$[ebp+4], ecx
	mov	DWORD PTR _fltobj$[ebp+8], ecx
	mov	DWORD PTR _fltobj$[ebp+12], ecx
	mov	DWORD PTR _fltobj$[ebp+16], ecx

; 91   : 	DynTable resdata = { 0 };

	mov	DWORD PTR _resdata$[ebp], 0
	xor	edx, edx
	mov	DWORD PTR _resdata$[ebp+4], edx
	mov	DWORD PTR _resdata$[ebp+8], edx
	mov	DWORD PTR _resdata$[ebp+12], edx
	mov	DWORD PTR _resdata$[ebp+16], edx

; 92   : 	unsigned long i;
; 93   : 	char *fltop = DYNTAB_FIELD_VAL(flt_data, FILTER_OP);

	push	0
	push	-1
	push	OFFSET FLAT:$SG70317
	mov	eax, DWORD PTR _flt_data$[ebp]
	push	eax
	call	_dyntab_field_val
	add	esp, 16					; 00000010H
	mov	DWORD PTR _fltop$[ebp], eax

; 94   : 	char *valtype = DYNTAB_FIELD_VAL(flt_data, FILTER_VAL_TYPE);

	push	0
	push	-1
	push	OFFSET FLAT:$SG70319
	mov	ecx, DWORD PTR _flt_data$[ebp]
	push	ecx
	call	_dyntab_field_val
	add	esp, 16					; 00000010H
	mov	DWORD PTR _valtype$[ebp], eax

; 95   : 	int b_std = 1, b_num = 0;

	mov	DWORD PTR _b_std$[ebp], 1
	mov	DWORD PTR _b_num$[ebp], 0

; 96   : 	char *bef = " IN (", *aft = ")", *oper = NULL;

	mov	DWORD PTR _bef$[ebp], OFFSET FLAT:$SG70323
	mov	DWORD PTR _aft$[ebp], OFFSET FLAT:$SG70325
	mov	DWORD PTR _oper$[ebp], 0

; 97   : 	DYNTAB_FIELD(&fltobj, flt_data, LISTOBJ);

	lea	edx, DWORD PTR _fltobj$[ebp]
	push	edx
	call	_dyntab_free
	add	esp, 4
	push	0
	push	-1
	push	OFFSET FLAT:$SG70330
	mov	eax, DWORD PTR _flt_data$[ebp]
	push	eax
	push	0
	lea	ecx, DWORD PTR _fltobj$[ebp]
	push	ecx
	call	_dyntab_filter_field
	add	esp, 24					; 00000018H
	test	eax, eax
	je	SHORT $L70329
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29872], OFFSET FLAT:$SG70332
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 97		; 00000061H
	jmp	$eva_err$70333
$L70329:

; 98   : 	DYNTAB_FIELD(&fltval, flt_data, FILTER_VALUE);

	lea	ecx, DWORD PTR _fltval$[ebp]
	push	ecx
	call	_dyntab_free
	add	esp, 4
	push	0
	push	-1
	push	OFFSET FLAT:$SG70336
	mov	edx, DWORD PTR _flt_data$[ebp]
	push	edx
	push	0
	lea	eax, DWORD PTR _fltval$[ebp]
	push	eax
	call	_dyntab_filter_field
	add	esp, 24					; 00000018H
	test	eax, eax
	je	SHORT $L70335
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29872], OFFSET FLAT:$SG70338
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 98		; 00000062H
	jmp	$eva_err$70333
$L70335:

; 99   : 
; 100  : 	/* Set match mode & values depending on comparison type */
; 101  : #define USE_STD_VAL(tag, b, a, o) if(!strcmp("_EVA_"#tag, fltop)) { bef = b; aft = a; oper = o; }
; 102  : 	USE_STD_VAL(DIFFERENT, " NOT IN (", ")", NULL) else

	mov	eax, DWORD PTR _fltop$[ebp]
	push	eax
	push	OFFSET FLAT:$SG70341
	call	_strcmp
	add	esp, 8
	test	eax, eax
	jne	SHORT $L70340
	mov	DWORD PTR _bef$[ebp], OFFSET FLAT:$SG70342
	mov	DWORD PTR _aft$[ebp], OFFSET FLAT:$SG70343
	mov	DWORD PTR _oper$[ebp], 0
	jmp	$L70480
$L70340:

; 103  : 	USE_STD_VAL(SMALLER, "<GREATEST('',", ")", NULL) else

	mov	ecx, DWORD PTR _fltop$[ebp]
	push	ecx
	push	OFFSET FLAT:$SG70347
	call	_strcmp
	add	esp, 8
	test	eax, eax
	jne	SHORT $L70346
	mov	DWORD PTR _bef$[ebp], OFFSET FLAT:$SG70348
	mov	DWORD PTR _aft$[ebp], OFFSET FLAT:$SG70349
	mov	DWORD PTR _oper$[ebp], 0
	jmp	$L70480
$L70346:

; 104  : 	USE_STD_VAL(SMALLEREQUAL, "<=GREATEST('',", ")", 0) else

	mov	edx, DWORD PTR _fltop$[ebp]
	push	edx
	push	OFFSET FLAT:$SG70353
	call	_strcmp
	add	esp, 8
	test	eax, eax
	jne	SHORT $L70352
	mov	DWORD PTR _bef$[ebp], OFFSET FLAT:$SG70354
	mov	DWORD PTR _aft$[ebp], OFFSET FLAT:$SG70355
	mov	DWORD PTR _oper$[ebp], 0
	jmp	$L70480
$L70352:

; 105  : 	USE_STD_VAL(GREATER, ">LEAST('',", ")", NULL) else

	mov	eax, DWORD PTR _fltop$[ebp]
	push	eax
	push	OFFSET FLAT:$SG70358
	call	_strcmp
	add	esp, 8
	test	eax, eax
	jne	SHORT $L70357
	mov	DWORD PTR _bef$[ebp], OFFSET FLAT:$SG70359
	mov	DWORD PTR _aft$[ebp], OFFSET FLAT:$SG70360
	mov	DWORD PTR _oper$[ebp], 0
	jmp	$L70480
$L70357:

; 106  : 	USE_STD_VAL(GREATEREQUAL, ">=LEAST('',", ")", NULL) else

	mov	ecx, DWORD PTR _fltop$[ebp]
	push	ecx
	push	OFFSET FLAT:$SG70364
	call	_strcmp
	add	esp, 8
	test	eax, eax
	jne	SHORT $L70363
	mov	DWORD PTR _bef$[ebp], OFFSET FLAT:$SG70365
	mov	DWORD PTR _aft$[ebp], OFFSET FLAT:$SG70366
	mov	DWORD PTR _oper$[ebp], 0
	jmp	$L70480
$L70363:

; 107  : 	USE_STD_VAL(BEGINWITH, " LIKE '", "%'", " OR ") else

	mov	edx, DWORD PTR _fltop$[ebp]
	push	edx
	push	OFFSET FLAT:$SG70370
	call	_strcmp
	add	esp, 8
	test	eax, eax
	jne	SHORT $L70369
	mov	DWORD PTR _bef$[ebp], OFFSET FLAT:$SG70371
	mov	DWORD PTR _aft$[ebp], OFFSET FLAT:$SG70372
	mov	DWORD PTR _oper$[ebp], OFFSET FLAT:$SG70373
	jmp	$L70480
$L70369:

; 108  : 	USE_STD_VAL(NOT_BEGINWITH, " NOT LIKE '", "%'", " OR ") else

	mov	eax, DWORD PTR _fltop$[ebp]
	push	eax
	push	OFFSET FLAT:$SG70376
	call	_strcmp
	add	esp, 8
	test	eax, eax
	jne	SHORT $L70375
	mov	DWORD PTR _bef$[ebp], OFFSET FLAT:$SG70377
	mov	DWORD PTR _aft$[ebp], OFFSET FLAT:$SG70378
	mov	DWORD PTR _oper$[ebp], OFFSET FLAT:$SG70379
	jmp	$L70480
$L70375:

; 109  : 	USE_STD_VAL(CONTAIN, " LIKE '%", "%'", " AND ") else

	mov	ecx, DWORD PTR _fltop$[ebp]
	push	ecx
	push	OFFSET FLAT:$SG70382
	call	_strcmp
	add	esp, 8
	test	eax, eax
	jne	SHORT $L70381
	mov	DWORD PTR _bef$[ebp], OFFSET FLAT:$SG70383
	mov	DWORD PTR _aft$[ebp], OFFSET FLAT:$SG70384
	mov	DWORD PTR _oper$[ebp], OFFSET FLAT:$SG70385
	jmp	$L70480
$L70381:

; 110  : 	USE_STD_VAL(NOT_CONTAIN, " NOT LIKE '%", "%'", " AND ") else

	mov	edx, DWORD PTR _fltop$[ebp]
	push	edx
	push	OFFSET FLAT:$SG70388
	call	_strcmp
	add	esp, 8
	test	eax, eax
	jne	SHORT $L70387
	mov	DWORD PTR _bef$[ebp], OFFSET FLAT:$SG70389
	mov	DWORD PTR _aft$[ebp], OFFSET FLAT:$SG70390
	mov	DWORD PTR _oper$[ebp], OFFSET FLAT:$SG70391
	jmp	$L70480
$L70387:

; 111  : 	USE_STD_VAL(LIKE, " LIKE '", "'", " OR ") else

	mov	eax, DWORD PTR _fltop$[ebp]
	push	eax
	push	OFFSET FLAT:$SG70394
	call	_strcmp
	add	esp, 8
	test	eax, eax
	jne	SHORT $L70393
	mov	DWORD PTR _bef$[ebp], OFFSET FLAT:$SG70395
	mov	DWORD PTR _aft$[ebp], OFFSET FLAT:$SG70396
	mov	DWORD PTR _oper$[ebp], OFFSET FLAT:$SG70397
	jmp	$L70480
$L70393:

; 112  : 	USE_STD_VAL(NOT_LIKE, " NOT LIKE '", "'", " AND ")	else

	mov	ecx, DWORD PTR _fltop$[ebp]
	push	ecx
	push	OFFSET FLAT:$SG70400
	call	_strcmp
	add	esp, 8
	test	eax, eax
	jne	SHORT $L70399
	mov	DWORD PTR _bef$[ebp], OFFSET FLAT:$SG70401
	mov	DWORD PTR _aft$[ebp], OFFSET FLAT:$SG70402
	mov	DWORD PTR _oper$[ebp], OFFSET FLAT:$SG70403
	jmp	$L70480
$L70399:

; 113  : 	USE_STD_VAL(ISEMPTY, "=''", "", "")	else

	mov	edx, DWORD PTR _fltop$[ebp]
	push	edx
	push	OFFSET FLAT:$SG70406
	call	_strcmp
	add	esp, 8
	test	eax, eax
	jne	SHORT $L70405
	mov	DWORD PTR _bef$[ebp], OFFSET FLAT:$SG70407
	mov	DWORD PTR _aft$[ebp], OFFSET FLAT:$SG70408
	mov	DWORD PTR _oper$[ebp], OFFSET FLAT:$SG70409
	jmp	$L70480
$L70405:

; 114  : 	USE_STD_VAL(ISNOTEMPTY, "<>''", "", "")

	mov	eax, DWORD PTR _fltop$[ebp]
	push	eax
	push	OFFSET FLAT:$SG70412
	call	_strcmp
	add	esp, 8
	test	eax, eax
	jne	SHORT $L70411
	mov	DWORD PTR _bef$[ebp], OFFSET FLAT:$SG70413
	mov	DWORD PTR _aft$[ebp], OFFSET FLAT:$SG70414
	mov	DWORD PTR _oper$[ebp], OFFSET FLAT:$SG70415

; 115  : #undef USE_STD_VAL
; 116  : 	else if(!strcmp("_EVA_INTERVAL", fltop) || !strcmp("_EVA_NOT_INTERVAL", fltop))

	jmp	$L70480
$L70411:
	mov	ecx, DWORD PTR _fltop$[ebp]
	push	ecx
	push	OFFSET FLAT:$SG70419
	call	_strcmp
	add	esp, 8
	test	eax, eax
	je	SHORT $L70418
	mov	edx, DWORD PTR _fltop$[ebp]
	push	edx
	push	OFFSET FLAT:$SG70420
	call	_strcmp
	add	esp, 8
	test	eax, eax
	jne	$L70480
$L70418:

; 118  : 		b_std = 0;

	mov	DWORD PTR _b_std$[ebp], 0

; 119  : 		if(strcmp("_EVA_INTERVAL", fltop)) DYNBUF_ADD_STR(sqlexpr, "NOT ");

	mov	eax, DWORD PTR _fltop$[ebp]
	push	eax
	push	OFFSET FLAT:$SG70422
	call	_strcmp
	add	esp, 8
	test	eax, eax
	je	SHORT $L70424
	push	0
	push	0
	push	4
	push	OFFSET FLAT:$SG70425
	mov	ecx, DWORD PTR _sqlexpr$[ebp]
	push	ecx
	call	_dynbuf_add
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L70424
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29872], OFFSET FLAT:$SG70427
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 119		; 00000077H
	jmp	$eva_err$70333
$L70424:

; 120  : 
; 121  : 		/* Evaluate min comparison values */
; 122  : 		DYNTAB_FIELD(&fltval, flt_data, FILTER_VAL_MIN);

	lea	ecx, DWORD PTR _fltval$[ebp]
	push	ecx
	call	_dyntab_free
	add	esp, 4
	push	0
	push	-1
	push	OFFSET FLAT:$SG70430
	mov	edx, DWORD PTR _flt_data$[ebp]
	push	edx
	push	0
	lea	eax, DWORD PTR _fltval$[ebp]
	push	eax
	call	_dyntab_filter_field
	add	esp, 24					; 00000018H
	test	eax, eax
	je	SHORT $L70429
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29872], OFFSET FLAT:$SG70432
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 122		; 0000007aH
	jmp	$eva_err$70333
$L70429:

; 123  : 		if(form_eval_valtype(cntxt, &resdata, valtype, &fltobj, &fltval)) STACK_ERROR;

	lea	eax, DWORD PTR _fltval$[ebp]
	push	eax
	lea	ecx, DWORD PTR _fltobj$[ebp]
	push	ecx
	mov	edx, DWORD PTR _valtype$[ebp]
	push	edx
	lea	eax, DWORD PTR _resdata$[ebp]
	push	eax
	mov	ecx, DWORD PTR _cntxt$[ebp]
	push	ecx
	call	_form_eval_valtype
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L70433
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 123		; 0000007bH
	jmp	$eva_err$70333
$L70433:

; 124  : 		DYNBUF_ADD_STR(sqlexpr, "([FIRST(");

	push	0
	push	0
	push	8
	push	OFFSET FLAT:$SG70436
	mov	eax, DWORD PTR _sqlexpr$[ebp]
	push	eax
	call	_dynbuf_add
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L70435
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29872], OFFSET FLAT:$SG70438
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 124		; 0000007cH
	jmp	$eva_err$70333
$L70435:

; 125  : 		if(dyntab_to_dynbuf(fltfield, sqlexpr, ",", 1, ",", 1, NO_CONV)) RETURN_ERR_MEMORY;

	push	0
	push	0
	push	1
	push	OFFSET FLAT:$SG70441
	push	1
	push	OFFSET FLAT:$SG70442
	mov	eax, DWORD PTR _sqlexpr$[ebp]
	push	eax
	mov	ecx, DWORD PTR _fltfield$[ebp]
	push	ecx
	call	_dyntab_to_dynbuf
	add	esp, 32					; 00000020H
	test	eax, eax
	je	SHORT $L70440
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29872], OFFSET FLAT:$SG70444
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 125		; 0000007dH
	jmp	$eva_err$70333
$L70440:

; 126  : 		DYNBUF_ADD_STR(sqlexpr, ")]>LEAST(");

	push	0
	push	0
	push	9
	push	OFFSET FLAT:$SG70447
	mov	ecx, DWORD PTR _sqlexpr$[ebp]
	push	ecx
	call	_dynbuf_add
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L70446
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29872], OFFSET FLAT:$SG70449
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 126		; 0000007eH
	jmp	$eva_err$70333
$L70446:

; 127  : 		if(qry_values_list(cntxt, &resdata, b_num ? 0 : 5, sqlexpr)) STACK_ERROR;

	mov	ecx, DWORD PTR _sqlexpr$[ebp]
	push	ecx
	mov	edx, DWORD PTR _b_num$[ebp]
	neg	edx
	sbb	edx, edx
	and	edx, -5					; fffffffbH
	add	edx, 5
	push	edx
	lea	eax, DWORD PTR _resdata$[ebp]
	push	eax
	mov	ecx, DWORD PTR _cntxt$[ebp]
	push	ecx
	call	_qry_values_list
	add	esp, 16					; 00000010H
	test	eax, eax
	je	SHORT $L70450
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 127		; 0000007fH
	jmp	$eva_err$70333
$L70450:

; 128  : 		DYNBUF_ADD_STR(sqlexpr, ")");

	push	0
	push	0
	push	1
	push	OFFSET FLAT:$SG70453
	mov	eax, DWORD PTR _sqlexpr$[ebp]
	push	eax
	call	_dynbuf_add
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L70452
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29872], OFFSET FLAT:$SG70455
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 128		; 00000080H
	jmp	$eva_err$70333
$L70452:

; 129  : 
; 130  : 		/* Evaluate max comparison values */
; 131  : 		DYNTAB_FIELD(&fltval, flt_data, FILTER_VAL_MAX);

	lea	eax, DWORD PTR _fltval$[ebp]
	push	eax
	call	_dyntab_free
	add	esp, 4
	push	0
	push	-1
	push	OFFSET FLAT:$SG70458
	mov	ecx, DWORD PTR _flt_data$[ebp]
	push	ecx
	push	0
	lea	edx, DWORD PTR _fltval$[ebp]
	push	edx
	call	_dyntab_filter_field
	add	esp, 24					; 00000018H
	test	eax, eax
	je	SHORT $L70457
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29872], OFFSET FLAT:$SG70460
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 131		; 00000083H
	jmp	$eva_err$70333
$L70457:

; 132  : 		if(form_eval_valtype(cntxt, &resdata, valtype, &fltobj, &fltval)) STACK_ERROR;

	lea	edx, DWORD PTR _fltval$[ebp]
	push	edx
	lea	eax, DWORD PTR _fltobj$[ebp]
	push	eax
	mov	ecx, DWORD PTR _valtype$[ebp]
	push	ecx
	lea	edx, DWORD PTR _resdata$[ebp]
	push	edx
	mov	eax, DWORD PTR _cntxt$[ebp]
	push	eax
	call	_form_eval_valtype
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L70461
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 132		; 00000084H
	jmp	$eva_err$70333
$L70461:

; 133  : 		DYNBUF_ADD_STR(sqlexpr, " AND [FIRST(");

	push	0
	push	0
	push	12					; 0000000cH
	push	OFFSET FLAT:$SG70464
	mov	edx, DWORD PTR _sqlexpr$[ebp]
	push	edx
	call	_dynbuf_add
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L70463
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29872], OFFSET FLAT:$SG70466
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 133		; 00000085H
	jmp	$eva_err$70333
$L70463:

; 134  : 		if(dyntab_to_dynbuf(fltfield, sqlexpr, ",", 1, ",", 1, NO_CONV)) RETURN_ERR_MEMORY;

	push	0
	push	0
	push	1
	push	OFFSET FLAT:$SG70469
	push	1
	push	OFFSET FLAT:$SG70470
	mov	edx, DWORD PTR _sqlexpr$[ebp]
	push	edx
	mov	eax, DWORD PTR _fltfield$[ebp]
	push	eax
	call	_dyntab_to_dynbuf
	add	esp, 32					; 00000020H
	test	eax, eax
	je	SHORT $L70468
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29872], OFFSET FLAT:$SG70472
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 134		; 00000086H
	jmp	$eva_err$70333
$L70468:

; 135  : 		DYNBUF_ADD_STR(sqlexpr, ")]<=GREATEST(");

	push	0
	push	0
	push	13					; 0000000dH
	push	OFFSET FLAT:$SG70475
	mov	eax, DWORD PTR _sqlexpr$[ebp]
	push	eax
	call	_dynbuf_add
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L70474
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29872], OFFSET FLAT:$SG70477
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 135		; 00000087H
	jmp	$eva_err$70333
$L70474:

; 136  : 		if(qry_values_list(cntxt, &resdata, b_num ? 0 : 5, sqlexpr)) STACK_ERROR;

	mov	eax, DWORD PTR _sqlexpr$[ebp]
	push	eax
	mov	ecx, DWORD PTR _b_num$[ebp]
	neg	ecx
	sbb	ecx, ecx
	and	ecx, -5					; fffffffbH
	add	ecx, 5
	push	ecx
	lea	edx, DWORD PTR _resdata$[ebp]
	push	edx
	mov	eax, DWORD PTR _cntxt$[ebp]
	push	eax
	call	_qry_values_list
	add	esp, 16					; 00000010H
	test	eax, eax
	je	SHORT $L70478
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 136		; 00000088H
	jmp	$eva_err$70333
$L70478:

; 137  : 		DYNBUF_ADD_STR(sqlexpr, "))");

	push	0
	push	0
	push	2
	push	OFFSET FLAT:$SG70481
	mov	edx, DWORD PTR _sqlexpr$[ebp]
	push	edx
	call	_dynbuf_add
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L70480
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29872], OFFSET FLAT:$SG70483
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 137		; 00000089H
	jmp	$eva_err$70333
$L70480:

; 139  : 
; 140  : 	/* If comparison value not processed */
; 141  : 	if(b_std)

	cmp	DWORD PTR _b_std$[ebp], 0
	je	$L70550

; 143  : 		/* Evaluate comparison value if applicable */
; 144  : 		if((!oper || *oper) && form_eval_valtype(cntxt, &resdata, valtype, &fltobj, &fltval)) STACK_ERROR;

	cmp	DWORD PTR _oper$[ebp], 0
	je	SHORT $L70486
	mov	edx, DWORD PTR _oper$[ebp]
	movsx	eax, BYTE PTR [edx]
	test	eax, eax
	je	SHORT $L70485
$L70486:
	lea	ecx, DWORD PTR _fltval$[ebp]
	push	ecx
	lea	edx, DWORD PTR _fltobj$[ebp]
	push	edx
	mov	eax, DWORD PTR _valtype$[ebp]
	push	eax
	lea	ecx, DWORD PTR _resdata$[ebp]
	push	ecx
	mov	edx, DWORD PTR _cntxt$[ebp]
	push	edx
	call	_form_eval_valtype
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L70485
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 144		; 00000090H
	jmp	$eva_err$70333
$L70485:

; 145  : 
; 146  : 		/* Combine values if applicable */
; 147  : 		if(oper && *oper) for(i = 0; !i || i < resdata.nbrows; i++)

	cmp	DWORD PTR _oper$[ebp], 0
	je	$L70487
	mov	ecx, DWORD PTR _oper$[ebp]
	movsx	edx, BYTE PTR [ecx]
	test	edx, edx
	je	$L70487
	mov	DWORD PTR _i$[ebp], 0
	jmp	SHORT $L70488
$L70489:
	mov	eax, DWORD PTR _i$[ebp]
	add	eax, 1
	mov	DWORD PTR _i$[ebp], eax
$L70488:
	cmp	DWORD PTR _i$[ebp], 0
	je	SHORT $L70491
	mov	ecx, DWORD PTR _i$[ebp]
	cmp	ecx, DWORD PTR _resdata$[ebp]
	jae	$L70490
$L70491:

; 149  : 			DYNBUF_ADD_STR(sqlexpr, "[FIRST(");

	push	0
	push	0
	push	7
	push	OFFSET FLAT:$SG70494
	mov	edx, DWORD PTR _sqlexpr$[ebp]
	push	edx
	call	_dynbuf_add
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L70493
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29872], OFFSET FLAT:$SG70496
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 149		; 00000095H
	jmp	$eva_err$70333
$L70493:

; 150  : 			if(dyntab_to_dynbuf(fltfield, sqlexpr, ",", 1, ",", 1, NO_CONV)) RETURN_ERR_MEMORY;

	push	0
	push	0
	push	1
	push	OFFSET FLAT:$SG70499
	push	1
	push	OFFSET FLAT:$SG70500
	mov	edx, DWORD PTR _sqlexpr$[ebp]
	push	edx
	mov	eax, DWORD PTR _fltfield$[ebp]
	push	eax
	call	_dyntab_to_dynbuf
	add	esp, 32					; 00000020H
	test	eax, eax
	je	SHORT $L70498
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29872], OFFSET FLAT:$SG70502
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 150		; 00000096H
	jmp	$eva_err$70333
$L70498:

; 151  : 			DYNBUF_ADD_STR(sqlexpr, ")]");

	push	0
	push	0
	push	2
	push	OFFSET FLAT:$SG70505
	mov	eax, DWORD PTR _sqlexpr$[ebp]
	push	eax
	call	_dynbuf_add
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L70504
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29872], OFFSET FLAT:$SG70507
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 151		; 00000097H
	jmp	$eva_err$70333
$L70504:

; 152  : 			if(i) DYNBUF_ADD3(sqlexpr, " ", oper, 0, NO_CONV, " ");

	cmp	DWORD PTR _i$[ebp], 0
	je	SHORT $L70510
	push	1
	push	OFFSET FLAT:$SG70511
	push	0
	push	0
	push	0
	mov	eax, DWORD PTR _oper$[ebp]
	push	eax
	push	1
	push	OFFSET FLAT:$SG70512
	mov	ecx, DWORD PTR _sqlexpr$[ebp]
	push	ecx
	call	_dynbuf_add3
	add	esp, 36					; 00000024H
	test	eax, eax
	je	SHORT $L70510
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29872], OFFSET FLAT:$SG70514
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 152		; 00000098H
	jmp	$eva_err$70333
$L70510:

; 153  : 			DYNBUF_ADD(sqlexpr, bef, 0, NO_CONV);

	push	0
	push	0
	push	0
	mov	ecx, DWORD PTR _bef$[ebp]
	push	ecx
	mov	edx, DWORD PTR _sqlexpr$[ebp]
	push	edx
	call	_dynbuf_add
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L70516
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29872], OFFSET FLAT:$SG70518
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 153		; 00000099H
	jmp	$eva_err$70333
$L70516:

; 154  : 			DYNBUF_ADD_CELL(sqlexpr, &resdata, i, 0, NO_CONV);

	push	0
	push	0
	push	0
	mov	edx, DWORD PTR _i$[ebp]
	push	edx
	lea	eax, DWORD PTR _resdata$[ebp]
	push	eax
	call	_dyntab_sz
	add	esp, 12					; 0000000cH
	push	eax
	push	0
	mov	ecx, DWORD PTR _i$[ebp]
	push	ecx
	lea	edx, DWORD PTR _resdata$[ebp]
	push	edx
	call	_dyntab_val
	add	esp, 12					; 0000000cH
	push	eax
	mov	eax, DWORD PTR _sqlexpr$[ebp]
	push	eax
	call	_dynbuf_add
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L70520
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29872], OFFSET FLAT:$SG70522
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 154		; 0000009aH
	jmp	$eva_err$70333
$L70520:

; 155  : 			DYNBUF_ADD(sqlexpr, aft, 0, NO_CONV);

	push	0
	push	0
	push	0
	mov	eax, DWORD PTR _aft$[ebp]
	push	eax
	mov	ecx, DWORD PTR _sqlexpr$[ebp]
	push	ecx
	call	_dynbuf_add
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L70524
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29872], OFFSET FLAT:$SG70526
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 155		; 0000009bH
	jmp	$eva_err$70333
$L70524:

; 156  : 		}

	jmp	$L70489
$L70490:

; 157  : 		else

	jmp	$L70550
$L70487:

; 159  : 			/* Add list of values */
; 160  : 			DYNBUF_ADD_STR(sqlexpr, "[FIRST(");

	push	0
	push	0
	push	7
	push	OFFSET FLAT:$SG70530
	mov	ecx, DWORD PTR _sqlexpr$[ebp]
	push	ecx
	call	_dynbuf_add
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L70529
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29872], OFFSET FLAT:$SG70532
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 160		; 000000a0H
	jmp	$eva_err$70333
$L70529:

; 161  : 			if(dyntab_to_dynbuf(fltfield, sqlexpr, ",", 1, ",", 1, NO_CONV)) RETURN_ERR_MEMORY;

	push	0
	push	0
	push	1
	push	OFFSET FLAT:$SG70535
	push	1
	push	OFFSET FLAT:$SG70536
	mov	ecx, DWORD PTR _sqlexpr$[ebp]
	push	ecx
	mov	edx, DWORD PTR _fltfield$[ebp]
	push	edx
	call	_dyntab_to_dynbuf
	add	esp, 32					; 00000020H
	test	eax, eax
	je	SHORT $L70534
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29872], OFFSET FLAT:$SG70538
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 161		; 000000a1H
	jmp	$eva_err$70333
$L70534:

; 162  : 			DYNBUF_ADD_STR(sqlexpr, ")]");

	push	0
	push	0
	push	2
	push	OFFSET FLAT:$SG70541
	mov	edx, DWORD PTR _sqlexpr$[ebp]
	push	edx
	call	_dynbuf_add
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L70540
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29872], OFFSET FLAT:$SG70543
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 162		; 000000a2H
	jmp	$eva_err$70333
$L70540:

; 163  : 			DYNBUF_ADD(sqlexpr, bef, 0, NO_CONV);

	push	0
	push	0
	push	0
	mov	edx, DWORD PTR _bef$[ebp]
	push	edx
	mov	eax, DWORD PTR _sqlexpr$[ebp]
	push	eax
	call	_dynbuf_add
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L70545
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29872], OFFSET FLAT:$SG70547
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 163		; 000000a3H
	jmp	$eva_err$70333
$L70545:

; 164  : 			if(!oper && qry_values_list(cntxt, &resdata, b_num ? 0 : 5, sqlexpr)) STACK_ERROR;

	cmp	DWORD PTR _oper$[ebp], 0
	jne	SHORT $L70548
	mov	eax, DWORD PTR _sqlexpr$[ebp]
	push	eax
	mov	ecx, DWORD PTR _b_num$[ebp]
	neg	ecx
	sbb	ecx, ecx
	and	ecx, -5					; fffffffbH
	add	ecx, 5
	push	ecx
	lea	edx, DWORD PTR _resdata$[ebp]
	push	edx
	mov	eax, DWORD PTR _cntxt$[ebp]
	push	eax
	call	_qry_values_list
	add	esp, 16					; 00000010H
	test	eax, eax
	je	SHORT $L70548
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 164		; 000000a4H
	jmp	SHORT $eva_err$70333
$L70548:

; 165  : 			DYNBUF_ADD(sqlexpr, aft, 0, NO_CONV);

	push	0
	push	0
	push	0
	mov	edx, DWORD PTR _aft$[ebp]
	push	edx
	mov	eax, DWORD PTR _sqlexpr$[ebp]
	push	eax
	call	_dynbuf_add
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L70550
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29872], OFFSET FLAT:$SG70552
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 165		; 000000a5H
	jmp	SHORT $eva_err$70333
$L70550:
$eva_noerr$70553:

; 168  : 
; 169  : 	RETURN_OK_CLEANUP;

	push	0
	push	OFFSET FLAT:$SG70554
	push	OFFSET FLAT:$SG70555
	mov	eax, DWORD PTR _cntxt$[ebp]
	push	eax
	call	_err_clear
	add	esp, 16					; 00000010H
$eva_err$70333:
	mov	ecx, DWORD PTR _cntxt$[ebp]
	cmp	DWORD PTR [ecx+29872], 0
	je	SHORT $L70556
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	eax, DWORD PTR [edx+29900]
	push	eax
	push	OFFSET FLAT:$SG70557
	push	OFFSET FLAT:$SG70558
	mov	ecx, DWORD PTR _cntxt$[ebp]
	push	ecx
	call	_err_add_context
	add	esp, 16					; 00000010H
$L70556:
	lea	edx, DWORD PTR _fltobj$[ebp]
	push	edx
	call	_dyntab_free
	add	esp, 4
	lea	eax, DWORD PTR _fltval$[ebp]
	push	eax
	call	_dyntab_free
	add	esp, 4
	lea	ecx, DWORD PTR _resdata$[ebp]
	push	ecx
	call	_dyntab_free
	add	esp, 4
	mov	edx, DWORD PTR _cntxt$[ebp]
	xor	eax, eax
	cmp	DWORD PTR [edx+29872], 0
	setne	al

; 170  : }

	mov	esp, ebp
	pop	ebp
	ret	0
_qry_filter_val_to_sql ENDP
_TEXT	ENDS
PUBLIC	_qry_filter_to_sql
PUBLIC	_qry_filterlist_to_sql
EXTRN	_qry_eval_sqlexpr_var:NEAR
EXTRN	_qry_parse_relval_fields:NEAR
_DATA	SEGMENT
	ORG $+2
$SG70574 DB	'_EVA_FILTER_TYPE', 00H
	ORG $+3
$SG70577 DB	'_EVA_FILTER_LISTOBJ', 00H
$SG70578 DB	'_EVA_LISTOBJ', 00H
	ORG $+3
$SG70581 DB	'_EVA_LISTOBJ', 00H
	ORG $+3
$SG70583 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70587 DB	'[MIN(_EVA_FORMSTAMP.IdObj)] IN(', 00H
$SG70589 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70592 DB	',', 00H
	ORG $+2
$SG70593 DB	',', 00H
	ORG $+2
$SG70595 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70598 DB	')', 00H
	ORG $+2
$SG70600 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70603 DB	'_EVA_FILTER_FORM', 00H
	ORG $+3
$SG70607 DB	'_EVA_FILTER_FORM', 00H
	ORG $+3
$SG70609 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70613 DB	'(', 00H
	ORG $+2
$SG70615 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70622 DB	' OR ', 00H
	ORG $+3
$SG70624 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70628 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70631 DB	' IN ([_EVA_FORMSTAMP])', 00H
	ORG $+1
$SG70633 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70637 DB	')', 00H
	ORG $+2
$SG70639 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70642 DB	'_EVA_FILTER_CTRLVAL', 00H
$SG70648 DB	'_EVA_FILTER_FIELD', 00H
	ORG $+2
$SG70651 DB	'_EVA_FILTER_FIELD', 00H
	ORG $+2
$SG70653 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70657 DB	'_EVA_FILTER_REL', 00H
$SG70660 DB	'_EVA_FILTER_REL', 00H
$SG70662 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70667 DB	'_EVA_FILTER', 00H
$SG70668 DB	'_EVA_FILTER_AND', 00H
$SG70669 DB	'_EVA_FILTER_ANDJOIN', 00H
$SG70670 DB	'_EVA_FILTER_OR', 00H
	ORG $+1
$SG70673 DB	'_EVA_FILTERS', 00H
	ORG $+3
$SG70675 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70677 DB	'_EVA_FILTER_OR', 00H
	ORG $+1
$SG70678 DB	'AND', 00H
$SG70679 DB	'OR', 00H
	ORG $+1
$SG70682 DB	'_EVA_FILTER_SQLCOND', 00H
$SG70685 DB	'_EVA_FILTER_COND', 00H
	ORG $+3
$SG70687 DB	'D:\Travail\ABI\EVA\V4.0\CGI\Brunix-2016\qry_build_to_sql'
	DB	'.c', 00H
	ORG $+1
$SG70688 DB	'qry_filter_to_sql', 00H
	ORG $+2
$SG70690 DB	'D:\Travail\ABI\EVA\V4.0\CGI\Brunix-2016\qry_build_to_sql'
	DB	'.c', 00H
	ORG $+1
$SG70691 DB	'qry_filter_to_sql', 00H
_DATA	ENDS
_TEXT	SEGMENT
_cntxt$ = 8
_sqlexpr$ = 12
_flt_data$ = 16
_fltfield$ = -40
_fltval$ = -20
_fltobj$ = -60
_flttype$ = -64
_i$70604 = -68
_qry_filter_to_sql PROC NEAR

; 186  : ){

	push	ebp
	mov	ebp, esp
	sub	esp, 72					; 00000048H

; 187  : 	DynTable fltfield = { 0 };

	mov	DWORD PTR _fltfield$[ebp], 0
	xor	eax, eax
	mov	DWORD PTR _fltfield$[ebp+4], eax
	mov	DWORD PTR _fltfield$[ebp+8], eax
	mov	DWORD PTR _fltfield$[ebp+12], eax
	mov	DWORD PTR _fltfield$[ebp+16], eax

; 188  : 	DynTable fltval = { 0 };

	mov	DWORD PTR _fltval$[ebp], 0
	xor	ecx, ecx
	mov	DWORD PTR _fltval$[ebp+4], ecx
	mov	DWORD PTR _fltval$[ebp+8], ecx
	mov	DWORD PTR _fltval$[ebp+12], ecx
	mov	DWORD PTR _fltval$[ebp+16], ecx

; 189  : 	DynTable fltobj = { 0 };

	mov	DWORD PTR _fltobj$[ebp], 0
	xor	edx, edx
	mov	DWORD PTR _fltobj$[ebp+4], edx
	mov	DWORD PTR _fltobj$[ebp+8], edx
	mov	DWORD PTR _fltobj$[ebp+12], edx
	mov	DWORD PTR _fltobj$[ebp+16], edx

; 190  : 	char *flttype = DYNTAB_FIELD_VAL(flt_data, FILTER_TYPE);

	push	0
	push	-1
	push	OFFSET FLAT:$SG70574
	mov	eax, DWORD PTR _flt_data$[ebp]
	push	eax
	call	_dyntab_field_val
	add	esp, 16					; 00000010H
	mov	DWORD PTR _flttype$[ebp], eax

; 191  : 
; 192  : 	/* Process depending on filter type */
; 193  : 	if(!strcmp("_EVA_FILTER_LISTOBJ", flttype) ||
; 194  : 		!strcmp("_EVA_LISTOBJ", flttype))

	mov	ecx, DWORD PTR _flttype$[ebp]
	push	ecx
	push	OFFSET FLAT:$SG70577
	call	_strcmp
	add	esp, 8
	test	eax, eax
	je	SHORT $L70576
	mov	edx, DWORD PTR _flttype$[ebp]
	push	edx
	push	OFFSET FLAT:$SG70578
	call	_strcmp
	add	esp, 8
	test	eax, eax
	jne	$L70575
$L70576:

; 196  : 		/* List of predefined objects */
; 197  : 		DYNTAB_FIELD(&fltobj, flt_data, LISTOBJ);

	lea	eax, DWORD PTR _fltobj$[ebp]
	push	eax
	call	_dyntab_free
	add	esp, 4
	push	0
	push	-1
	push	OFFSET FLAT:$SG70581
	mov	ecx, DWORD PTR _flt_data$[ebp]
	push	ecx
	push	0
	lea	edx, DWORD PTR _fltobj$[ebp]
	push	edx
	call	_dyntab_filter_field
	add	esp, 24					; 00000018H
	test	eax, eax
	je	SHORT $L70580
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29872], OFFSET FLAT:$SG70583
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 197		; 000000c5H
	jmp	$eva_err$70584
$L70580:

; 198  : 		DYNBUF_ADD_STR(sqlexpr, "[MIN(_EVA_FORMSTAMP.IdObj)] IN(");

	push	0
	push	0
	push	31					; 0000001fH
	push	OFFSET FLAT:$SG70587
	mov	edx, DWORD PTR _sqlexpr$[ebp]
	push	edx
	call	_dynbuf_add
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L70586
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29872], OFFSET FLAT:$SG70589
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 198		; 000000c6H
	jmp	$eva_err$70584
$L70586:

; 199  : 		if(dyntab_to_dynbuf(&fltobj, sqlexpr, ",", 1, ",", 1, NO_CONV)) RETURN_ERR_MEMORY;

	push	0
	push	0
	push	1
	push	OFFSET FLAT:$SG70592
	push	1
	push	OFFSET FLAT:$SG70593
	mov	edx, DWORD PTR _sqlexpr$[ebp]
	push	edx
	lea	eax, DWORD PTR _fltobj$[ebp]
	push	eax
	call	_dyntab_to_dynbuf
	add	esp, 32					; 00000020H
	test	eax, eax
	je	SHORT $L70591
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29872], OFFSET FLAT:$SG70595
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 199		; 000000c7H
	jmp	$eva_err$70584
$L70591:

; 200  : 		DYNBUF_ADD_STR(sqlexpr, ")");

	push	0
	push	0
	push	1
	push	OFFSET FLAT:$SG70598
	mov	eax, DWORD PTR _sqlexpr$[ebp]
	push	eax
	call	_dynbuf_add
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L70597
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29872], OFFSET FLAT:$SG70600
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 200		; 000000c8H
	jmp	$eva_err$70584
$L70597:

; 202  : 	else if(!strcmp("_EVA_FILTER_FORM", flttype))

	jmp	$L70684
$L70575:
	mov	eax, DWORD PTR _flttype$[ebp]
	push	eax
	push	OFFSET FLAT:$SG70603
	call	_strcmp
	add	esp, 8
	test	eax, eax
	jne	$L70602

; 204  : 		/* Objects created/edited with one or more forms */
; 205  : 		unsigned long i;
; 206  : 		DYNTAB_FIELD(&fltobj, flt_data, FILTER_FORM);

	lea	ecx, DWORD PTR _fltobj$[ebp]
	push	ecx
	call	_dyntab_free
	add	esp, 4
	push	0
	push	-1
	push	OFFSET FLAT:$SG70607
	mov	edx, DWORD PTR _flt_data$[ebp]
	push	edx
	push	0
	lea	eax, DWORD PTR _fltobj$[ebp]
	push	eax
	call	_dyntab_filter_field
	add	esp, 24					; 00000018H
	test	eax, eax
	je	SHORT $L70606
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29872], OFFSET FLAT:$SG70609
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 206		; 000000ceH
	jmp	$eva_err$70584
$L70606:

; 207  : 		if(fltobj.nbrows > 1) DYNBUF_ADD_STR(sqlexpr, "(");

	cmp	DWORD PTR _fltobj$[ebp], 1
	jbe	SHORT $L70612
	push	0
	push	0
	push	1
	push	OFFSET FLAT:$SG70613
	mov	eax, DWORD PTR _sqlexpr$[ebp]
	push	eax
	call	_dynbuf_add
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L70612
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29872], OFFSET FLAT:$SG70615
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 207		; 000000cfH
	jmp	$eva_err$70584
$L70612:

; 208  : 		for(i = 0; i < fltobj.nbrows; i++)

	mov	DWORD PTR _i$70604[ebp], 0
	jmp	SHORT $L70616
$L70617:
	mov	eax, DWORD PTR _i$70604[ebp]
	add	eax, 1
	mov	DWORD PTR _i$70604[ebp], eax
$L70616:
	mov	ecx, DWORD PTR _i$70604[ebp]
	cmp	ecx, DWORD PTR _fltobj$[ebp]
	jae	$L70618

; 210  : 			if(i) DYNBUF_ADD_STR(sqlexpr, " OR ");

	cmp	DWORD PTR _i$70604[ebp], 0
	je	SHORT $L70621
	push	0
	push	0
	push	4
	push	OFFSET FLAT:$SG70622
	mov	edx, DWORD PTR _sqlexpr$[ebp]
	push	edx
	call	_dynbuf_add
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L70621
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29872], OFFSET FLAT:$SG70624
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 210		; 000000d2H
	jmp	$eva_err$70584
$L70621:

; 211  : 			DYNBUF_ADD_CELL(sqlexpr, &fltobj, i, 0, NO_CONV);

	push	0
	push	0
	push	0
	mov	edx, DWORD PTR _i$70604[ebp]
	push	edx
	lea	eax, DWORD PTR _fltobj$[ebp]
	push	eax
	call	_dyntab_sz
	add	esp, 12					; 0000000cH
	push	eax
	push	0
	mov	ecx, DWORD PTR _i$70604[ebp]
	push	ecx
	lea	edx, DWORD PTR _fltobj$[ebp]
	push	edx
	call	_dyntab_val
	add	esp, 12					; 0000000cH
	push	eax
	mov	eax, DWORD PTR _sqlexpr$[ebp]
	push	eax
	call	_dynbuf_add
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L70626
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29872], OFFSET FLAT:$SG70628
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 211		; 000000d3H
	jmp	$eva_err$70584
$L70626:

; 212  : 			DYNBUF_ADD_STR(sqlexpr, " IN ([_EVA_FORMSTAMP])");

	push	0
	push	0
	push	22					; 00000016H
	push	OFFSET FLAT:$SG70631
	mov	eax, DWORD PTR _sqlexpr$[ebp]
	push	eax
	call	_dynbuf_add
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L70630
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29872], OFFSET FLAT:$SG70633
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 212		; 000000d4H
	jmp	$eva_err$70584
$L70630:

; 213  : 		}

	jmp	$L70617
$L70618:

; 214  : 		if(fltobj.nbrows > 1) DYNBUF_ADD_STR(sqlexpr, ")");

	cmp	DWORD PTR _fltobj$[ebp], 1
	jbe	SHORT $L70636
	push	0
	push	0
	push	1
	push	OFFSET FLAT:$SG70637
	mov	eax, DWORD PTR _sqlexpr$[ebp]
	push	eax
	call	_dynbuf_add
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L70636
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29872], OFFSET FLAT:$SG70639
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 214		; 000000d6H
	jmp	$eva_err$70584
$L70636:

; 216  : 	else if(!strcmp("_EVA_FILTER_CTRLVAL", flttype))

	jmp	$L70684
$L70602:
	mov	eax, DWORD PTR _flttype$[ebp]
	push	eax
	push	OFFSET FLAT:$SG70642
	call	_strcmp
	add	esp, 8
	test	eax, eax
	jne	$L70641

; 218  : 		if(qry_parse_relval_fields(cntxt, &fltval, &fltobj, flt_data)) STACK_ERROR;

	mov	ecx, DWORD PTR _flt_data$[ebp]
	push	ecx
	lea	edx, DWORD PTR _fltobj$[ebp]
	push	edx
	lea	eax, DWORD PTR _fltval$[ebp]
	push	eax
	mov	ecx, DWORD PTR _cntxt$[ebp]
	push	ecx
	call	_qry_parse_relval_fields
	add	esp, 16					; 00000010H
	test	eax, eax
	je	SHORT $L70643
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 218		; 000000daH
	jmp	$eva_err$70584
$L70643:

; 219  : 		if(fltval.nbrows && qry_filter_val_to_sql(cntxt, sqlexpr, &fltval, flt_data)) STACK_ERROR;

	cmp	DWORD PTR _fltval$[ebp], 0
	je	SHORT $L70644
	mov	eax, DWORD PTR _flt_data$[ebp]
	push	eax
	lea	ecx, DWORD PTR _fltval$[ebp]
	push	ecx
	mov	edx, DWORD PTR _sqlexpr$[ebp]
	push	edx
	mov	eax, DWORD PTR _cntxt$[ebp]
	push	eax
	call	_qry_filter_val_to_sql
	add	esp, 16					; 00000010H
	test	eax, eax
	je	SHORT $L70644
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 219		; 000000dbH
	jmp	$eva_err$70584
$L70644:

; 220  : 		if(fltobj.nbrows && qry_filter_rel_to_sql(cntxt, sqlexpr, &fltobj, flt_data)) STACK_ERROR;

	cmp	DWORD PTR _fltobj$[ebp], 0
	je	SHORT $L70645
	mov	edx, DWORD PTR _flt_data$[ebp]
	push	edx
	lea	eax, DWORD PTR _fltobj$[ebp]
	push	eax
	mov	ecx, DWORD PTR _sqlexpr$[ebp]
	push	ecx
	mov	edx, DWORD PTR _cntxt$[ebp]
	push	edx
	call	_qry_filter_rel_to_sql
	add	esp, 16					; 00000010H
	test	eax, eax
	je	SHORT $L70645
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 220		; 000000dcH
	jmp	$eva_err$70584
$L70645:

; 222  : 	else if(!strcmp("_EVA_FILTER_FIELD", flttype))

	jmp	$L70684
$L70641:
	mov	ecx, DWORD PTR _flttype$[ebp]
	push	ecx
	push	OFFSET FLAT:$SG70648
	call	_strcmp
	add	esp, 8
	test	eax, eax
	jne	SHORT $L70647

; 224  : 		/* Objects with given fields & values */
; 225  : 		DYNTAB_FIELD(&fltfield, flt_data, FILTER_FIELD);

	lea	edx, DWORD PTR _fltfield$[ebp]
	push	edx
	call	_dyntab_free
	add	esp, 4
	push	0
	push	-1
	push	OFFSET FLAT:$SG70651
	mov	eax, DWORD PTR _flt_data$[ebp]
	push	eax
	push	0
	lea	ecx, DWORD PTR _fltfield$[ebp]
	push	ecx
	call	_dyntab_filter_field
	add	esp, 24					; 00000018H
	test	eax, eax
	je	SHORT $L70650
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29872], OFFSET FLAT:$SG70653
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 225		; 000000e1H
	jmp	$eva_err$70584
$L70650:

; 226  : 		if(qry_filter_val_to_sql(cntxt, sqlexpr, &fltfield, flt_data)) STACK_ERROR;

	mov	ecx, DWORD PTR _flt_data$[ebp]
	push	ecx
	lea	edx, DWORD PTR _fltfield$[ebp]
	push	edx
	mov	eax, DWORD PTR _sqlexpr$[ebp]
	push	eax
	mov	ecx, DWORD PTR _cntxt$[ebp]
	push	ecx
	call	_qry_filter_val_to_sql
	add	esp, 16					; 00000010H
	test	eax, eax
	je	SHORT $L70654
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 226		; 000000e2H
	jmp	$eva_err$70584
$L70654:

; 228  : 	else if(!strcmp("_EVA_FILTER_REL", flttype))

	jmp	$L70684
$L70647:
	mov	eax, DWORD PTR _flttype$[ebp]
	push	eax
	push	OFFSET FLAT:$SG70657
	call	_strcmp
	add	esp, 8
	test	eax, eax
	jne	SHORT $L70656

; 230  : 		/* Relation with other objects */
; 231  : 		DYNTAB_FIELD(&fltfield, flt_data, FILTER_REL);

	lea	ecx, DWORD PTR _fltfield$[ebp]
	push	ecx
	call	_dyntab_free
	add	esp, 4
	push	0
	push	-1
	push	OFFSET FLAT:$SG70660
	mov	edx, DWORD PTR _flt_data$[ebp]
	push	edx
	push	0
	lea	eax, DWORD PTR _fltfield$[ebp]
	push	eax
	call	_dyntab_filter_field
	add	esp, 24					; 00000018H
	test	eax, eax
	je	SHORT $L70659
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29872], OFFSET FLAT:$SG70662
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 231		; 000000e7H
	jmp	$eva_err$70584
$L70659:

; 232  : 		if(qry_filter_rel_to_sql(cntxt, sqlexpr, &fltfield, flt_data)) STACK_ERROR;

	mov	eax, DWORD PTR _flt_data$[ebp]
	push	eax
	lea	ecx, DWORD PTR _fltfield$[ebp]
	push	ecx
	mov	edx, DWORD PTR _sqlexpr$[ebp]
	push	edx
	mov	eax, DWORD PTR _cntxt$[ebp]
	push	eax
	call	_qry_filter_rel_to_sql
	add	esp, 16					; 00000010H
	test	eax, eax
	je	SHORT $L70663
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 232		; 000000e8H
	jmp	$eva_err$70584
$L70663:

; 234  : 	else if(!strcmp("_EVA_FILTER", flttype) ||

	jmp	$L70684
$L70656:

; 235  : 			!strcmp("_EVA_FILTER_AND", flttype) ||
; 236  : 			!strcmp("_EVA_FILTER_ANDJOIN", flttype) ||
; 237  : 			!strcmp("_EVA_FILTER_OR", flttype))

	mov	edx, DWORD PTR _flttype$[ebp]
	push	edx
	push	OFFSET FLAT:$SG70667
	call	_strcmp
	add	esp, 8
	test	eax, eax
	je	SHORT $L70666
	mov	eax, DWORD PTR _flttype$[ebp]
	push	eax
	push	OFFSET FLAT:$SG70668
	call	_strcmp
	add	esp, 8
	test	eax, eax
	je	SHORT $L70666
	mov	ecx, DWORD PTR _flttype$[ebp]
	push	ecx
	push	OFFSET FLAT:$SG70669
	call	_strcmp
	add	esp, 8
	test	eax, eax
	je	SHORT $L70666
	mov	edx, DWORD PTR _flttype$[ebp]
	push	edx
	push	OFFSET FLAT:$SG70670
	call	_strcmp
	add	esp, 8
	test	eax, eax
	jne	$L70665
$L70666:

; 239  : 		/* AND / OR combination of filters on same object  - process filter list */
; 240  : 		DYNTAB_FIELD(&fltval, flt_data, FILTERS);

	lea	eax, DWORD PTR _fltval$[ebp]
	push	eax
	call	_dyntab_free
	add	esp, 4
	push	0
	push	-1
	push	OFFSET FLAT:$SG70673
	mov	ecx, DWORD PTR _flt_data$[ebp]
	push	ecx
	push	0
	lea	edx, DWORD PTR _fltval$[ebp]
	push	edx
	call	_dyntab_filter_field
	add	esp, 24					; 00000018H
	test	eax, eax
	je	SHORT $L70672
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29872], OFFSET FLAT:$SG70675
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 240		; 000000f0H
	jmp	$eva_err$70584
$L70672:

; 241  : 		if(qry_filterlist_to_sql(cntxt, sqlexpr, &fltval, strcmp("_EVA_FILTER_OR", flttype) ? "AND" : "OR")) STACK_ERROR;

	mov	edx, DWORD PTR _flttype$[ebp]
	push	edx
	push	OFFSET FLAT:$SG70677
	call	_strcmp
	add	esp, 8
	test	eax, eax
	je	SHORT $L70735
	mov	DWORD PTR -72+[ebp], OFFSET FLAT:$SG70678
	jmp	SHORT $L70736
$L70735:
	mov	DWORD PTR -72+[ebp], OFFSET FLAT:$SG70679
$L70736:
	mov	eax, DWORD PTR -72+[ebp]
	push	eax
	lea	ecx, DWORD PTR _fltval$[ebp]
	push	ecx
	mov	edx, DWORD PTR _sqlexpr$[ebp]
	push	edx
	mov	eax, DWORD PTR _cntxt$[ebp]
	push	eax
	call	_qry_filterlist_to_sql
	add	esp, 16					; 00000010H
	test	eax, eax
	je	SHORT $L70676
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 241		; 000000f1H
	jmp	SHORT $eva_err$70584
$L70676:

; 243  : 	else if(!strcmp("_EVA_FILTER_SQLCOND", flttype))

	jmp	SHORT $L70684
$L70665:
	mov	edx, DWORD PTR _flttype$[ebp]
	push	edx
	push	OFFSET FLAT:$SG70682
	call	_strcmp
	add	esp, 8
	test	eax, eax
	jne	SHORT $L70684

; 245  : 		/* Evaluate variables in expression && add to result expresion */
; 246  : 		if(qry_eval_sqlexpr_var(cntxt, sqlexpr, DYNTAB_FIELD_VAL(flt_data, FILTER_COND), flt_data, NULL)) STACK_ERROR;

	push	0
	mov	eax, DWORD PTR _flt_data$[ebp]
	push	eax
	push	0
	push	-1
	push	OFFSET FLAT:$SG70685
	mov	ecx, DWORD PTR _flt_data$[ebp]
	push	ecx
	call	_dyntab_field_val
	add	esp, 16					; 00000010H
	push	eax
	mov	edx, DWORD PTR _sqlexpr$[ebp]
	push	edx
	mov	eax, DWORD PTR _cntxt$[ebp]
	push	eax
	call	_qry_eval_sqlexpr_var
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L70684
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 246		; 000000f6H
	jmp	SHORT $eva_err$70584
$L70684:
$eva_noerr$70686:

; 248  : 
; 249  : 	RETURN_OK_CLEANUP;

	push	0
	push	OFFSET FLAT:$SG70687
	push	OFFSET FLAT:$SG70688
	mov	edx, DWORD PTR _cntxt$[ebp]
	push	edx
	call	_err_clear
	add	esp, 16					; 00000010H
$eva_err$70584:
	mov	eax, DWORD PTR _cntxt$[ebp]
	cmp	DWORD PTR [eax+29872], 0
	je	SHORT $L70689
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	edx, DWORD PTR [ecx+29900]
	push	edx
	push	OFFSET FLAT:$SG70690
	push	OFFSET FLAT:$SG70691
	mov	eax, DWORD PTR _cntxt$[ebp]
	push	eax
	call	_err_add_context
	add	esp, 16					; 00000010H
$L70689:
	lea	ecx, DWORD PTR _fltfield$[ebp]
	push	ecx
	call	_dyntab_free
	add	esp, 4
	lea	edx, DWORD PTR _fltobj$[ebp]
	push	edx
	call	_dyntab_free
	add	esp, 4
	lea	eax, DWORD PTR _fltval$[ebp]
	push	eax
	call	_dyntab_free
	add	esp, 4
	mov	ecx, DWORD PTR _cntxt$[ebp]
	xor	eax, eax
	cmp	DWORD PTR [ecx+29872], 0
	setne	al

; 250  : }

	mov	esp, ebp
	pop	ebp
	ret	0
_qry_filter_to_sql ENDP
_TEXT	ENDS
EXTRN	_strtoul:NEAR
EXTRN	_qry_cache_idobj_field:NEAR
_DATA	SEGMENT
	ORG $+2
$SG70712 DB	' ', 00H
	ORG $+2
$SG70713 DB	' ', 00H
	ORG $+2
$SG70715 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70722 DB	'D:\Travail\ABI\EVA\V4.0\CGI\Brunix-2016\qry_build_to_sql'
	DB	'.c', 00H
	ORG $+1
$SG70723 DB	'qry_filterlist_to_sql', 00H
	ORG $+2
$SG70725 DB	'D:\Travail\ABI\EVA\V4.0\CGI\Brunix-2016\qry_build_to_sql'
	DB	'.c', 00H
	ORG $+1
$SG70726 DB	'qry_filterlist_to_sql', 00H
_DATA	ENDS
_TEXT	SEGMENT
_cntxt$ = 8
_sqlexpr$ = 12
_idflt$ = 16
_oper$ = 20
_fltdata$ = -24
_i$ = -4
_qry_filterlist_to_sql PROC NEAR

; 265  : ){

	push	ebp
	mov	ebp, esp
	sub	esp, 24					; 00000018H

; 266  : 	DynTable fltdata = { 0 };

	mov	DWORD PTR _fltdata$[ebp], 0
	xor	eax, eax
	mov	DWORD PTR _fltdata$[ebp+4], eax
	mov	DWORD PTR _fltdata$[ebp+8], eax
	mov	DWORD PTR _fltdata$[ebp+12], eax
	mov	DWORD PTR _fltdata$[ebp+16], eax

; 267  : 	unsigned long i;
; 268  : 
; 269  : 	/* Parse each filter */
; 270  : 	for(i = 0; i < idflt->nbrows; i++)

	mov	DWORD PTR _i$[ebp], 0
	jmp	SHORT $L70706
$L70707:
	mov	ecx, DWORD PTR _i$[ebp]
	add	ecx, 1
	mov	DWORD PTR _i$[ebp], ecx
$L70706:
	mov	edx, DWORD PTR _idflt$[ebp]
	mov	eax, DWORD PTR _i$[ebp]
	cmp	eax, DWORD PTR [edx]
	jae	$eva_noerr$70721

; 272  : 		/* Add operator to expression */
; 273  : 		if(i) DYNBUF_ADD3(sqlexpr, " ", oper, 0, NO_CONV, " ");

	cmp	DWORD PTR _i$[ebp], 0
	je	SHORT $L70711
	push	1
	push	OFFSET FLAT:$SG70712
	push	0
	push	0
	push	0
	mov	ecx, DWORD PTR _oper$[ebp]
	push	ecx
	push	1
	push	OFFSET FLAT:$SG70713
	mov	edx, DWORD PTR _sqlexpr$[ebp]
	push	edx
	call	_dynbuf_add3
	add	esp, 36					; 00000024H
	test	eax, eax
	je	SHORT $L70711
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29872], OFFSET FLAT:$SG70715
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 273		; 00000111H
	jmp	$eva_err$70716
$L70711:

; 274  : 
; 275  : 		/* Read filter data */
; 276  : 		if(qry_cache_idobj(&fltdata, DYNTAB_TOULRC(idflt, i, 0))) STACK_ERROR;

	push	3
	push	0
	push	10					; 0000000aH
	push	0
	push	0
	mov	edx, DWORD PTR _i$[ebp]
	push	edx
	mov	eax, DWORD PTR _idflt$[ebp]
	push	eax
	call	_dyntab_val
	add	esp, 12					; 0000000cH
	push	eax
	call	_strtoul
	add	esp, 12					; 0000000cH
	push	eax
	lea	ecx, DWORD PTR _fltdata$[ebp]
	push	ecx
	mov	edx, DWORD PTR _cntxt$[ebp]
	push	edx
	call	_qry_cache_idobj_field
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L70719
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 276		; 00000114H
	jmp	SHORT $eva_err$70716
$L70719:

; 277  : 
; 278  : 		/* Add SQL to expression */
; 279  : 		if(qry_filter_to_sql(cntxt, sqlexpr, &fltdata)) STACK_ERROR;

	lea	ecx, DWORD PTR _fltdata$[ebp]
	push	ecx
	mov	edx, DWORD PTR _sqlexpr$[ebp]
	push	edx
	mov	eax, DWORD PTR _cntxt$[ebp]
	push	eax
	call	_qry_filter_to_sql
	add	esp, 12					; 0000000cH
	test	eax, eax
	je	SHORT $L70720
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 279		; 00000117H
	jmp	SHORT $eva_err$70716
$L70720:

; 280  : 	}

	jmp	$L70707
$eva_noerr$70721:

; 281  : 
; 282  : 	RETURN_OK_CLEANUP;

	push	0
	push	OFFSET FLAT:$SG70722
	push	OFFSET FLAT:$SG70723
	mov	edx, DWORD PTR _cntxt$[ebp]
	push	edx
	call	_err_clear
	add	esp, 16					; 00000010H
$eva_err$70716:
	mov	eax, DWORD PTR _cntxt$[ebp]
	cmp	DWORD PTR [eax+29872], 0
	je	SHORT $L70724
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	edx, DWORD PTR [ecx+29900]
	push	edx
	push	OFFSET FLAT:$SG70725
	push	OFFSET FLAT:$SG70726
	mov	eax, DWORD PTR _cntxt$[ebp]
	push	eax
	call	_err_add_context
	add	esp, 16					; 00000010H
$L70724:
	lea	ecx, DWORD PTR _fltdata$[ebp]
	push	ecx
	call	_dyntab_free
	add	esp, 4
	mov	edx, DWORD PTR _cntxt$[ebp]
	xor	eax, eax
	cmp	DWORD PTR [edx+29872], 0
	setne	al

; 283  : }

	mov	esp, ebp
	pop	ebp
	ret	0
_qry_filterlist_to_sql ENDP
_TEXT	ENDS
END
