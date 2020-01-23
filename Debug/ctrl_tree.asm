	TITLE	D:\Travail\ABI\EVA\V4.0\CGI\Brunix-2016\ctrl_tree.c
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
PUBLIC	_get_node_status
EXTRN	_dyntab_cell:NEAR
EXTRN	_dyntab_txt_cmp:NEAR
_TEXT	SEGMENT
_treenodes$ = 8
_path$ = 12
_sz_path$ = 16
_status$ = 20
_i$ = -4
_get_node_status PROC NEAR

; 43   : ){

	push	ebp
	mov	ebp, esp
	push	ecx

; 44   : 	unsigned long i;
; 45   : 
; 46   : 	if(status) *status = 0;

	cmp	DWORD PTR _status$[ebp], 0
	je	SHORT $L70229
	mov	eax, DWORD PTR _status$[ebp]
	mov	DWORD PTR [eax], 0
$L70229:

; 47   : 	if(!treenodes) return 0;

	cmp	DWORD PTR _treenodes$[ebp], 0
	jne	SHORT $L70230
	xor	eax, eax
	jmp	SHORT $L70227
$L70230:

; 48   : 
; 49   : 	/* Search path in CGI data */
; 50   : 	for(i = 0; i < treenodes->nbrows && dyntab_txt_cmp(path, sz_path, treenodes, i, 0); i++);

	mov	DWORD PTR _i$[ebp], 0
	jmp	SHORT $L70231
$L70232:
	mov	ecx, DWORD PTR _i$[ebp]
	add	ecx, 1
	mov	DWORD PTR _i$[ebp], ecx
$L70231:
	mov	edx, DWORD PTR _treenodes$[ebp]
	mov	eax, DWORD PTR _i$[ebp]
	cmp	eax, DWORD PTR [edx]
	jae	SHORT $L70233
	push	0
	mov	ecx, DWORD PTR _i$[ebp]
	push	ecx
	mov	edx, DWORD PTR _treenodes$[ebp]
	push	edx
	mov	eax, DWORD PTR _sz_path$[ebp]
	push	eax
	mov	ecx, DWORD PTR _path$[ebp]
	push	ecx
	call	_dyntab_txt_cmp
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L70233
	jmp	SHORT $L70232
$L70233:

; 51   : 
; 52   : 	/* If node not found : return */
; 53   : 	if(i >= treenodes->nbrows) return i;

	mov	edx, DWORD PTR _treenodes$[ebp]
	mov	eax, DWORD PTR _i$[ebp]
	cmp	eax, DWORD PTR [edx]
	jb	SHORT $L70234
	mov	eax, DWORD PTR _i$[ebp]
	jmp	SHORT $L70227
$L70234:

; 54   : 
; 55   : 	/* Read status */
; 56   : 	if(status) *status = dyntab_cell(treenodes, i, 0)->ctype;

	cmp	DWORD PTR _status$[ebp], 0
	je	SHORT $L70235
	push	0
	mov	ecx, DWORD PTR _i$[ebp]
	push	ecx
	mov	edx, DWORD PTR _treenodes$[ebp]
	push	edx
	call	_dyntab_cell
	add	esp, 12					; 0000000cH
	mov	ecx, DWORD PTR _status$[ebp]
	mov	edx, DWORD PTR [eax+52]
	mov	DWORD PTR [ecx], edx
$L70235:

; 57   : 
; 58   : 	return i;

	mov	eax, DWORD PTR _i$[ebp]
$L70227:

; 59   : }

	mov	esp, ebp
	pop	ebp
	ret	0
_get_node_status ENDP
_TEXT	ENDS
PUBLIC	_set_node_status
EXTRN	_strtoul:NEAR
EXTRN	_dyntab_add:NEAR
EXTRN	_err_add_context:NEAR
EXTRN	_err_clear:NEAR
_DATA	SEGMENT
$SG70259 DB	'Logic error', 00H
$SG70264 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70268 DB	'D:\Travail\ABI\EVA\V4.0\CGI\Brunix-2016\ctrl_tree.c', 00H
$SG70269 DB	'set_node_status', 00H
$SG70271 DB	'D:\Travail\ABI\EVA\V4.0\CGI\Brunix-2016\ctrl_tree.c', 00H
$SG70272 DB	'set_node_status', 00H
_DATA	ENDS
_TEXT	SEGMENT
_cntxt$ = 8
_treenodes$ = 12
_path$ = 16
_sz_path$ = 20
_i$ = 24
_status$ = 28
_c$ = -4
_set_node_status PROC NEAR

; 73   : ){

	push	ebp
	mov	ebp, esp
	push	ecx

; 74   : 	DynTableCell *c;
; 75   : 
; 76   : 	if(i == ~0UL) i = get_node_status(treenodes, path, sz_path, NULL);

	cmp	DWORD PTR _i$[ebp], -1
	jne	SHORT $L70253
	push	0
	mov	eax, DWORD PTR _sz_path$[ebp]
	push	eax
	mov	ecx, DWORD PTR _path$[ebp]
	push	ecx
	mov	edx, DWORD PTR _treenodes$[ebp]
	push	edx
	call	_get_node_status
	add	esp, 16					; 00000010H
	mov	DWORD PTR _i$[ebp], eax
$L70253:

; 77   : 
; 78   : 	if(i >= treenodes->nbrows)

	mov	eax, DWORD PTR _treenodes$[ebp]
	mov	ecx, DWORD PTR _i$[ebp]
	cmp	ecx, DWORD PTR [eax]
	jb	SHORT $L70262

; 80   : 		if(!path || !*path || !sz_path) RETURN_ERROR("Logic error", NOP);

	cmp	DWORD PTR _path$[ebp], 0
	je	SHORT $L70257
	mov	edx, DWORD PTR _path$[ebp]
	movsx	eax, BYTE PTR [edx]
	test	eax, eax
	je	SHORT $L70257
	cmp	DWORD PTR _sz_path$[ebp], 0
	jne	SHORT $L70256
$L70257:
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29872], OFFSET FLAT:$SG70259
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 80		; 00000050H
	jmp	$eva_err$70260
$L70256:

; 81   : 		i = treenodes->nbrows;

	mov	eax, DWORD PTR _treenodes$[ebp]
	mov	ecx, DWORD PTR [eax]
	mov	DWORD PTR _i$[ebp], ecx

; 82   : 		DYNTAB_ADD(treenodes, treenodes->nbrows, 0, path, sz_path, NO_CONV);

	push	0
	push	0
	mov	edx, DWORD PTR _sz_path$[ebp]
	push	edx
	mov	eax, DWORD PTR _path$[ebp]
	push	eax
	push	0
	mov	ecx, DWORD PTR _treenodes$[ebp]
	mov	edx, DWORD PTR [ecx]
	push	edx
	mov	eax, DWORD PTR _treenodes$[ebp]
	push	eax
	call	_dyntab_add
	add	esp, 28					; 0000001cH
	test	eax, eax
	je	SHORT $L70262
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29872], OFFSET FLAT:$SG70264
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 82		; 00000052H
	jmp	SHORT $eva_err$70260
$L70262:

; 84   : 	c = dyntab_cell(treenodes, i, 0);

	push	0
	mov	eax, DWORD PTR _i$[ebp]
	push	eax
	mov	ecx, DWORD PTR _treenodes$[ebp]
	push	ecx
	call	_dyntab_cell
	add	esp, 12					; 0000000cH
	mov	DWORD PTR _c$[ebp], eax

; 85   : 	c->ctype = status;

	mov	edx, DWORD PTR _c$[ebp]
	mov	eax, DWORD PTR _status$[ebp]
	mov	DWORD PTR [edx+52], eax

; 86   : 	if(!c->IdObj) c->IdObj = strtoul(c->txt, NULL, 10);

	mov	ecx, DWORD PTR _c$[ebp]
	cmp	DWORD PTR [ecx+20], 0
	jne	SHORT $eva_noerr$70267
	push	10					; 0000000aH
	push	0
	mov	edx, DWORD PTR _c$[ebp]
	mov	eax, DWORD PTR [edx]
	push	eax
	call	_strtoul
	add	esp, 12					; 0000000cH
	mov	ecx, DWORD PTR _c$[ebp]
	mov	DWORD PTR [ecx+20], eax
$eva_noerr$70267:

; 87   : 
; 88   : 	RETURN_OK_CLEANUP;

	push	0
	push	OFFSET FLAT:$SG70268
	push	OFFSET FLAT:$SG70269
	mov	edx, DWORD PTR _cntxt$[ebp]
	push	edx
	call	_err_clear
	add	esp, 16					; 00000010H
$eva_err$70260:
	mov	eax, DWORD PTR _cntxt$[ebp]
	cmp	DWORD PTR [eax+29872], 0
	je	SHORT $L70270
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	edx, DWORD PTR [ecx+29900]
	push	edx
	push	OFFSET FLAT:$SG70271
	push	OFFSET FLAT:$SG70272
	mov	eax, DWORD PTR _cntxt$[ebp]
	push	eax
	call	_err_add_context
	add	esp, 16					; 00000010H
$L70270:
	mov	ecx, DWORD PTR _cntxt$[ebp]
	xor	eax, eax
	cmp	DWORD PTR [ecx+29872], 0
	setne	al

; 89   : }

	mov	esp, ebp
	pop	ebp
	ret	0
_set_node_status ENDP
_TEXT	ENDS
PUBLIC	_ctrl_tree_qry_children
EXTRN	_sql_exec_query:NEAR
EXTRN	_mem_free:NEAR
EXTRN	_qry_values_list:NEAR
EXTRN	_dynbuf_add:NEAR
EXTRN	_dynbuf_add3:NEAR
EXTRN	_sql_get_table:NEAR
_DATA	SEGMENT
$SG70293 DB	'IdObj', 00H
	ORG $+2
$SG70295 DB	'IdRelObj', 00H
	ORG $+3
$SG70303 DB	',IdField FROM TLink ', 0aH, 00H
	ORG $+2
$SG70304 DB	'-- ctrl_tree_qry_children : read IdObj ', 0aH, 'SELECT D'
	DB	'ISTINCTROW ', 00H
$SG70306 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70310 DB	' IN (', 00H
	ORG $+2
$SG70311 DB	'WHERE TLink.DateDel IS NULL ', 0aH, 'AND TLink.IdRelObj '
	DB	'IS NOT NULL ', 0aH, 'AND TLink.', 00H
$SG70313 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70317 DB	') ', 0aH, 00H
$SG70319 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70323 DB	' NOT IN (', 00H
	ORG $+2
$SG70324 DB	'AND TLink.', 00H
	ORG $+1
$SG70326 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70330 DB	') ', 0aH, 00H
$SG70332 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70336 DB	'AND TLink.IdField', 00H
	ORG $+2
$SG70338 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70342 DB	' NOT', 00H
	ORG $+3
$SG70344 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70347 DB	') ', 0aH, 00H
$SG70348 DB	' IN (', 00H
	ORG $+2
$SG70350 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70353 DB	'ORDER BY TLink.IdField, TLink.Line, TLink.Num, TLink.Dat'
	DB	'eCr, TLink.Pkey', 00H
$SG70355 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70358 DB	'D:\Travail\ABI\EVA\V4.0\CGI\Brunix-2016\ctrl_tree.c', 00H
$SG70359 DB	'ctrl_tree_qry_children', 00H
	ORG $+1
$SG70361 DB	'D:\Travail\ABI\EVA\V4.0\CGI\Brunix-2016\ctrl_tree.c', 00H
$SG70362 DB	'ctrl_tree_qry_children', 00H
_DATA	ENDS
_TEXT	SEGMENT
_cntxt$ = 8
_res$ = 12
_idfld$ = 16
_idfld_sz$ = 20
_options$ = 24
_id_obj$ = 28
_sql$ = -4
_obj$ = -12
_rel$ = -16
_tmp$ = -8
_ctrl_tree_qry_children PROC NEAR

; 107  : ){

	push	ebp
	mov	ebp, esp
	sub	esp, 16					; 00000010H

; 108  : 	DynBuffer *sql = NULL;

	mov	DWORD PTR _sql$[ebp], 0

; 109  : 	char *obj = "IdObj", *rel = "IdRelObj", *tmp;

	mov	DWORD PTR _obj$[ebp], OFFSET FLAT:$SG70293
	mov	DWORD PTR _rel$[ebp], OFFSET FLAT:$SG70295

; 110  : 
; 111  : 	/* Return if no objects given */
; 112  : 	if(!id_obj || !id_obj->nbrows) RETURN_OK;

	cmp	DWORD PTR _id_obj$[ebp], 0
	je	SHORT $L70298
	mov	eax, DWORD PTR _id_obj$[ebp]
	cmp	DWORD PTR [eax], 0
	jne	SHORT $L70297
$L70298:
	jmp	$eva_noerr$70299
$L70297:

; 113  : 
; 114  : 	/* Swap obj / relobj if reverse relation tree */
; 115  : 	if(options & 2) { tmp = obj; obj = rel; rel = tmp; }

	mov	ecx, DWORD PTR _options$[ebp]
	and	ecx, 2
	test	ecx, ecx
	je	SHORT $L70300
	mov	edx, DWORD PTR _obj$[ebp]
	mov	DWORD PTR _tmp$[ebp], edx
	mov	eax, DWORD PTR _rel$[ebp]
	mov	DWORD PTR _obj$[ebp], eax
	mov	ecx, DWORD PTR _tmp$[ebp]
	mov	DWORD PTR _rel$[ebp], ecx
$L70300:

; 119  : 		"-- ctrl_tree_qry_children : read IdObj \n"
; 120  : 		"SELECT DISTINCTROW ", rel, 0, NO_CONV, ",IdField FROM TLink \n");

	push	21					; 00000015H
	push	OFFSET FLAT:$SG70303
	push	0
	push	0
	push	0
	mov	edx, DWORD PTR _rel$[ebp]
	push	edx
	push	59					; 0000003bH
	push	OFFSET FLAT:$SG70304
	lea	eax, DWORD PTR _sql$[ebp]
	push	eax
	call	_dynbuf_add3
	add	esp, 36					; 00000024H
	test	eax, eax
	je	SHORT $L70302
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29872], OFFSET FLAT:$SG70306
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 120		; 00000078H
	jmp	$eva_err$70307
$L70302:

; 122  : 		"WHERE TLink.DateDel IS NULL \n"
; 123  : 			"AND TLink.IdRelObj IS NOT NULL \n"
; 124  : 			"AND TLink.", obj, 0, NO_CONV, " IN (");

	push	5
	push	OFFSET FLAT:$SG70310
	push	0
	push	0
	push	0
	mov	eax, DWORD PTR _obj$[ebp]
	push	eax
	push	71					; 00000047H
	push	OFFSET FLAT:$SG70311
	lea	ecx, DWORD PTR _sql$[ebp]
	push	ecx
	call	_dynbuf_add3
	add	esp, 36					; 00000024H
	test	eax, eax
	je	SHORT $L70309
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29872], OFFSET FLAT:$SG70313
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 124		; 0000007cH
	jmp	$eva_err$70307
$L70309:

; 125  : 	if(qry_values_list(cntxt, id_obj, 0, &sql)) STACK_ERROR;

	lea	ecx, DWORD PTR _sql$[ebp]
	push	ecx
	push	0
	mov	edx, DWORD PTR _id_obj$[ebp]
	push	edx
	mov	eax, DWORD PTR _cntxt$[ebp]
	push	eax
	call	_qry_values_list
	add	esp, 16					; 00000010H
	test	eax, eax
	je	SHORT $L70314
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 125		; 0000007dH
	jmp	$eva_err$70307
$L70314:

; 126  : 	DYNBUF_ADD_STR(&sql, ") \n");

	push	0
	push	0
	push	3
	push	OFFSET FLAT:$SG70317
	lea	edx, DWORD PTR _sql$[ebp]
	push	edx
	call	_dynbuf_add
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L70316
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29872], OFFSET FLAT:$SG70319
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 126		; 0000007eH
	jmp	$eva_err$70307
$L70316:

; 127  : 	if(res->nbrows)

	mov	edx, DWORD PTR _res$[ebp]
	cmp	DWORD PTR [edx], 0
	je	$L70329

; 130  : 			"AND TLink.", rel, 0, NO_CONV, " NOT IN (");

	push	9
	push	OFFSET FLAT:$SG70323
	push	0
	push	0
	push	0
	mov	eax, DWORD PTR _rel$[ebp]
	push	eax
	push	10					; 0000000aH
	push	OFFSET FLAT:$SG70324
	lea	ecx, DWORD PTR _sql$[ebp]
	push	ecx
	call	_dynbuf_add3
	add	esp, 36					; 00000024H
	test	eax, eax
	je	SHORT $L70322
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29872], OFFSET FLAT:$SG70326
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 130		; 00000082H
	jmp	$eva_err$70307
$L70322:

; 131  : 		if(qry_values_list(cntxt, res, 0, &sql)) STACK_ERROR;

	lea	ecx, DWORD PTR _sql$[ebp]
	push	ecx
	push	0
	mov	edx, DWORD PTR _res$[ebp]
	push	edx
	mov	eax, DWORD PTR _cntxt$[ebp]
	push	eax
	call	_qry_values_list
	add	esp, 16					; 00000010H
	test	eax, eax
	je	SHORT $L70327
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 131		; 00000083H
	jmp	$eva_err$70307
$L70327:

; 132  : 		DYNBUF_ADD_STR(&sql, ") \n");

	push	0
	push	0
	push	3
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
	mov	DWORD PTR [ecx+29900], 132		; 00000084H
	jmp	$eva_err$70307
$L70329:

; 134  : 	if(idfld && *idfld && idfld_sz)

	cmp	DWORD PTR _idfld$[ebp], 0
	je	$L70346
	mov	edx, DWORD PTR _idfld$[ebp]
	movsx	eax, BYTE PTR [edx]
	test	eax, eax
	je	$L70346
	cmp	DWORD PTR _idfld_sz$[ebp], 0
	je	$L70346

; 136  : 		DYNBUF_ADD_STR(&sql, "AND TLink.IdField");

	push	0
	push	0
	push	17					; 00000011H
	push	OFFSET FLAT:$SG70336
	lea	ecx, DWORD PTR _sql$[ebp]
	push	ecx
	call	_dynbuf_add
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L70335
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29872], OFFSET FLAT:$SG70338
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 136		; 00000088H
	jmp	$eva_err$70307
$L70335:

; 137  : 		if(options & 1) DYNBUF_ADD_STR(&sql, " NOT");

	mov	ecx, DWORD PTR _options$[ebp]
	and	ecx, 1
	test	ecx, ecx
	je	SHORT $L70341
	push	0
	push	0
	push	4
	push	OFFSET FLAT:$SG70342
	lea	edx, DWORD PTR _sql$[ebp]
	push	edx
	call	_dynbuf_add
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L70341
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29872], OFFSET FLAT:$SG70344
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 137		; 00000089H
	jmp	$eva_err$70307
$L70341:

; 138  : 		DYNBUF_ADD3(&sql,  " IN (", idfld, idfld_sz, NO_CONV, ") \n");

	push	3
	push	OFFSET FLAT:$SG70347
	push	0
	push	0
	mov	edx, DWORD PTR _idfld_sz$[ebp]
	push	edx
	mov	eax, DWORD PTR _idfld$[ebp]
	push	eax
	push	5
	push	OFFSET FLAT:$SG70348
	lea	ecx, DWORD PTR _sql$[ebp]
	push	ecx
	call	_dynbuf_add3
	add	esp, 36					; 00000024H
	test	eax, eax
	je	SHORT $L70346
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29872], OFFSET FLAT:$SG70350
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 138		; 0000008aH
	jmp	$eva_err$70307
$L70346:

; 141  : 		"ORDER BY TLink.IdField, TLink.Line, TLink.Num, TLink.DateCr, TLink.Pkey");

	push	0
	push	0
	push	71					; 00000047H
	push	OFFSET FLAT:$SG70353
	lea	ecx, DWORD PTR _sql$[ebp]
	push	ecx
	call	_dynbuf_add
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L70352
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29872], OFFSET FLAT:$SG70355
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 141		; 0000008dH
	jmp	SHORT $eva_err$70307
$L70352:

; 142  : 	if(sql_exec_query(cntxt , sql->data) || sql_get_table(cntxt, res, 0)) STACK_ERROR;

	mov	ecx, DWORD PTR _sql$[ebp]
	add	ecx, 8
	push	ecx
	mov	edx, DWORD PTR _cntxt$[ebp]
	push	edx
	call	_sql_exec_query
	add	esp, 8
	test	eax, eax
	jne	SHORT $L70357
	push	0
	mov	eax, DWORD PTR _res$[ebp]
	push	eax
	mov	ecx, DWORD PTR _cntxt$[ebp]
	push	ecx
	call	_sql_get_table
	add	esp, 12					; 0000000cH
	test	eax, eax
	je	SHORT $eva_noerr$70299
$L70357:
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 142		; 0000008eH
	jmp	SHORT $eva_err$70307
$eva_noerr$70299:

; 143  : 
; 144  : 	RETURN_OK_CLEANUP;

	push	0
	push	OFFSET FLAT:$SG70358
	push	OFFSET FLAT:$SG70359
	mov	eax, DWORD PTR _cntxt$[ebp]
	push	eax
	call	_err_clear
	add	esp, 16					; 00000010H
$eva_err$70307:
	mov	ecx, DWORD PTR _cntxt$[ebp]
	cmp	DWORD PTR [ecx+29872], 0
	je	SHORT $L70360
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	eax, DWORD PTR [edx+29900]
	push	eax
	push	OFFSET FLAT:$SG70361
	push	OFFSET FLAT:$SG70362
	mov	ecx, DWORD PTR _cntxt$[ebp]
	push	ecx
	call	_err_add_context
	add	esp, 16					; 00000010H
$L70360:
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

; 145  : }

	mov	esp, ebp
	pop	ebp
	ret	0
_ctrl_tree_qry_children ENDP
_TEXT	ENDS
PUBLIC	_ctrl_tree_status
EXTRN	_sprintf:NEAR
EXTRN	_dyntab_free:NEAR
EXTRN	_dyntab_sz:NEAR
EXTRN	_dyntab_val:NEAR
_BSS	SEGMENT
$SG70408 DB	01H DUP (?)
_BSS	ENDS
_DATA	SEGMENT
	ORG $+1
$SG70391 DB	'%lu', 00H
$SG70395 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70407 DB	'/', 00H
	ORG $+2
$SG70410 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70414 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70422 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70428 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70430 DB	'D:\Travail\ABI\EVA\V4.0\CGI\Brunix-2016\ctrl_tree.c', 00H
$SG70431 DB	'ctrl_tree_status', 00H
	ORG $+3
$SG70433 DB	'D:\Travail\ABI\EVA\V4.0\CGI\Brunix-2016\ctrl_tree.c', 00H
$SG70434 DB	'ctrl_tree_status', 00H
_DATA	ENDS
_TEXT	SEGMENT
_cntxt$ = 8
_tr$ = 12
_inode$ = 16
_status$ = 20
_maxlvl$ = 24
_list$ = -24
_id_obj$ = -44
_child_path$ = -4
_i$ = -48
__tmp$70390 = -80
_msk$70399 = -84
_childnode$70404 = -88
_ctrl_tree_status PROC NEAR

; 163  : ){

	push	ebp
	mov	ebp, esp
	sub	esp, 96					; 00000060H
	push	edi

; 164  : 	DynTable list = { 0 };

	mov	DWORD PTR _list$[ebp], 0
	xor	eax, eax
	mov	DWORD PTR _list$[ebp+4], eax
	mov	DWORD PTR _list$[ebp+8], eax
	mov	DWORD PTR _list$[ebp+12], eax
	mov	DWORD PTR _list$[ebp+16], eax

; 165  : 	DynTable id_obj = { 0 };

	mov	DWORD PTR _id_obj$[ebp], 0
	xor	ecx, ecx
	mov	DWORD PTR _id_obj$[ebp+4], ecx
	mov	DWORD PTR _id_obj$[ebp+8], ecx
	mov	DWORD PTR _id_obj$[ebp+12], ecx
	mov	DWORD PTR _id_obj$[ebp+16], ecx

; 166  : 	DynBuffer *child_path = NULL;

	mov	DWORD PTR _child_path$[ebp], 0

; 167  : 	unsigned long i;
; 168  : 
; 169  : 	/* Return if maximum level reached */
; 170  : 	if(maxlvl <= 0 || inode >= tr->treenodes.nbrows) RETURN_OK;

	cmp	DWORD PTR _maxlvl$[ebp], 0
	jle	SHORT $L70384
	mov	edx, DWORD PTR _tr$[ebp]
	mov	eax, DWORD PTR _inode$[ebp]
	cmp	eax, DWORD PTR [edx+132]
	jb	SHORT $L70383
$L70384:
	jmp	$eva_noerr$70385
$L70383:

; 171  : 	if(tr->treenodes.nbrows > tr->maxobj)

	mov	ecx, DWORD PTR _tr$[ebp]
	mov	edx, DWORD PTR _tr$[ebp]
	mov	eax, DWORD PTR [ecx+132]
	cmp	eax, DWORD PTR [edx+8]
	jbe	SHORT $L70386

; 173  : 		tr->b_maxobj = 1;

	mov	ecx, DWORD PTR _tr$[ebp]
	mov	DWORD PTR [ecx+128], 1

; 174  : 		RETURN_OK;

	jmp	$eva_noerr$70385
$L70386:

; 176  : 
; 177  : 	/* Change node status */
; 178  : 	if(set_node_status(cntxt, &tr->treenodes, NULL, 0, inode, status)) STACK_ERROR;

	mov	edx, DWORD PTR _status$[ebp]
	push	edx
	mov	eax, DWORD PTR _inode$[ebp]
	push	eax
	push	0
	push	0
	mov	ecx, DWORD PTR _tr$[ebp]
	add	ecx, 132				; 00000084H
	push	ecx
	mov	edx, DWORD PTR _cntxt$[ebp]
	push	edx
	call	_set_node_status
	add	esp, 24					; 00000018H
	test	eax, eax
	je	SHORT $L70388
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 178		; 000000b2H
	jmp	$eva_err$70389
$L70388:

; 179  : 
; 180  : 	/* Read related objects Ids */
; 181  : 	DYNTAB_ADD_INT(&id_obj, 0, 0, dyntab_cell(&tr->treenodes, inode, 0)->IdObj);

	mov	BYTE PTR __tmp$70390[ebp], 0
	mov	ecx, 7
	xor	eax, eax
	lea	edi, DWORD PTR __tmp$70390[ebp+1]
	rep stosd
	stosw
	stosb
	push	0
	mov	ecx, DWORD PTR _inode$[ebp]
	push	ecx
	mov	edx, DWORD PTR _tr$[ebp]
	add	edx, 132				; 00000084H
	push	edx
	call	_dyntab_cell
	add	esp, 12					; 0000000cH
	mov	eax, DWORD PTR [eax+20]
	push	eax
	push	OFFSET FLAT:$SG70391
	lea	ecx, DWORD PTR __tmp$70390[ebp]
	push	ecx
	call	_sprintf
	add	esp, 12					; 0000000cH
	push	0
	push	0
	push	0
	lea	edx, DWORD PTR __tmp$70390[ebp]
	push	edx
	push	0
	push	0
	lea	eax, DWORD PTR _id_obj$[ebp]
	push	eax
	call	_dyntab_add
	add	esp, 28					; 0000001cH
	test	eax, eax
	je	SHORT $L70393
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29872], OFFSET FLAT:$SG70395
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 181		; 000000b5H
	jmp	$eva_err$70389
$L70393:

; 182  : 	for(i = 0; i < tr->nbrel; i++)

	mov	DWORD PTR _i$[ebp], 0
	jmp	SHORT $L70396
$L70397:
	mov	eax, DWORD PTR _i$[ebp]
	add	eax, 1
	mov	DWORD PTR _i$[ebp], eax
$L70396:
	mov	ecx, DWORD PTR _tr$[ebp]
	mov	edx, DWORD PTR _i$[ebp]
	cmp	edx, DWORD PTR [ecx+4]
	jae	$L70398

; 184  : 		char *msk = dyntab_val(&tr->relmask, i, 0);

	push	0
	mov	eax, DWORD PTR _i$[ebp]
	push	eax
	mov	ecx, DWORD PTR _tr$[ebp]
	add	ecx, 92					; 0000005cH
	push	ecx
	call	_dyntab_val
	add	esp, 12					; 0000000cH
	mov	DWORD PTR _msk$70399[ebp], eax

; 185  : 		if(!*msk &&
; 186  : 			ctrl_tree_qry_children(cntxt, &list,
; 187  : 										DYNTAB_VAL_SZ(&tr->relfields, i, 1),
; 188  : 										(dyntab_sz(&tr->exclude, i, 0) ? 1 : 0) |
; 189  : 										(tr->b_reverse ? 2 : 0), &id_obj)) STACK_ERROR;

	mov	edx, DWORD PTR _msk$70399[ebp]
	movsx	eax, BYTE PTR [edx]
	test	eax, eax
	jne	$L70400
	lea	ecx, DWORD PTR _id_obj$[ebp]
	push	ecx
	push	0
	mov	edx, DWORD PTR _i$[ebp]
	push	edx
	mov	eax, DWORD PTR _tr$[ebp]
	add	eax, 72					; 00000048H
	push	eax
	call	_dyntab_sz
	add	esp, 12					; 0000000cH
	neg	eax
	sbb	eax, eax
	neg	eax
	mov	ecx, DWORD PTR _tr$[ebp]
	mov	edx, DWORD PTR [ecx+112]
	neg	edx
	sbb	edx, edx
	and	edx, 2
	or	eax, edx
	push	eax
	push	1
	mov	eax, DWORD PTR _i$[ebp]
	push	eax
	mov	ecx, DWORD PTR _tr$[ebp]
	add	ecx, 12					; 0000000cH
	push	ecx
	call	_dyntab_sz
	add	esp, 12					; 0000000cH
	push	eax
	push	1
	mov	edx, DWORD PTR _i$[ebp]
	push	edx
	mov	eax, DWORD PTR _tr$[ebp]
	add	eax, 12					; 0000000cH
	push	eax
	call	_dyntab_val
	add	esp, 12					; 0000000cH
	push	eax
	lea	ecx, DWORD PTR _list$[ebp]
	push	ecx
	mov	edx, DWORD PTR _cntxt$[ebp]
	push	edx
	call	_ctrl_tree_qry_children
	add	esp, 24					; 00000018H
	test	eax, eax
	je	SHORT $L70400
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 189		; 000000bdH
	jmp	$eva_err$70389
$L70400:

; 190  : 	}

	jmp	$L70397
$L70398:

; 191  : 
; 192  : 	/* Process children nodes */
; 193  : 	for(i = 0; i < list.nbrows; i++)

	mov	DWORD PTR _i$[ebp], 0
	jmp	SHORT $L70401
$L70402:
	mov	ecx, DWORD PTR _i$[ebp]
	add	ecx, 1
	mov	DWORD PTR _i$[ebp], ecx
$L70401:
	mov	edx, DWORD PTR _i$[ebp]
	cmp	edx, DWORD PTR _list$[ebp]
	jae	$eva_noerr$70385

; 195  : 		unsigned long childnode;
; 196  : 		M_FREE(child_path);

	mov	eax, DWORD PTR _child_path$[ebp]
	push	eax
	call	_mem_free
	add	esp, 4
	mov	DWORD PTR _child_path$[ebp], 0

; 197  : 		DYNBUF_ADD3_CELL(&child_path, "", &list, i, 0, NO_CONV, "/");

	push	1
	push	OFFSET FLAT:$SG70407
	push	0
	push	0
	push	0
	mov	ecx, DWORD PTR _i$[ebp]
	push	ecx
	lea	edx, DWORD PTR _list$[ebp]
	push	edx
	call	_dyntab_sz
	add	esp, 12					; 0000000cH
	push	eax
	push	0
	mov	eax, DWORD PTR _i$[ebp]
	push	eax
	lea	ecx, DWORD PTR _list$[ebp]
	push	ecx
	call	_dyntab_val
	add	esp, 12					; 0000000cH
	push	eax
	push	0
	push	OFFSET FLAT:$SG70408
	lea	edx, DWORD PTR _child_path$[ebp]
	push	edx
	call	_dynbuf_add3
	add	esp, 36					; 00000024H
	test	eax, eax
	je	SHORT $L70406
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29872], OFFSET FLAT:$SG70410
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 197		; 000000c5H
	jmp	$eva_err$70389
$L70406:

; 198  : 		DYNBUF_ADD_CELL(&child_path, &tr->treenodes, inode, 0, NO_CONV);

	push	0
	push	0
	push	0
	mov	edx, DWORD PTR _inode$[ebp]
	push	edx
	mov	eax, DWORD PTR _tr$[ebp]
	add	eax, 132				; 00000084H
	push	eax
	call	_dyntab_sz
	add	esp, 12					; 0000000cH
	push	eax
	push	0
	mov	ecx, DWORD PTR _inode$[ebp]
	push	ecx
	mov	edx, DWORD PTR _tr$[ebp]
	add	edx, 132				; 00000084H
	push	edx
	call	_dyntab_val
	add	esp, 12					; 0000000cH
	push	eax
	lea	eax, DWORD PTR _child_path$[ebp]
	push	eax
	call	_dynbuf_add
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L70412
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29872], OFFSET FLAT:$SG70414
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 198		; 000000c6H
	jmp	$eva_err$70389
$L70412:

; 199  : 		childnode = get_node_status(&tr->treenodes, DYNBUF_VAL_SZ(child_path), NULL);

	cmp	DWORD PTR _child_path$[ebp], 0
	je	SHORT $L70967
	mov	eax, DWORD PTR _child_path$[ebp]
	mov	ecx, DWORD PTR [eax+4]
	mov	DWORD PTR -92+[ebp], ecx
	jmp	SHORT $L70968
$L70967:
	mov	DWORD PTR -92+[ebp], 0
$L70968:
	cmp	DWORD PTR _child_path$[ebp], 0
	je	SHORT $L70969
	mov	edx, DWORD PTR _child_path$[ebp]
	add	edx, 8
	mov	DWORD PTR -96+[ebp], edx
	jmp	SHORT $L70970
$L70969:
	mov	DWORD PTR -96+[ebp], 0
$L70970:
	push	0
	mov	eax, DWORD PTR -92+[ebp]
	push	eax
	mov	ecx, DWORD PTR -96+[ebp]
	push	ecx
	mov	edx, DWORD PTR _tr$[ebp]
	add	edx, 132				; 00000084H
	push	edx
	call	_get_node_status
	add	esp, 16					; 00000010H
	mov	DWORD PTR _childnode$70404[ebp], eax

; 200  : 		if(childnode >= tr->treenodes.nbrows) DYNTAB_ADD_BUF(&tr->treenodes, childnode, 0, child_path);

	mov	eax, DWORD PTR _tr$[ebp]
	mov	ecx, DWORD PTR _childnode$70404[ebp]
	cmp	ecx, DWORD PTR [eax+132]
	jb	$L70426
	cmp	DWORD PTR _child_path$[ebp], 0
	je	SHORT $L70418
	mov	edx, DWORD PTR _child_path$[ebp]
	cmp	DWORD PTR [edx+4], 0
	je	SHORT $L70418
	push	0
	push	0
	mov	eax, DWORD PTR _child_path$[ebp]
	mov	ecx, DWORD PTR [eax+4]
	push	ecx
	mov	edx, DWORD PTR _child_path$[ebp]
	add	edx, 8
	push	edx
	push	0
	mov	eax, DWORD PTR _childnode$70404[ebp]
	push	eax
	mov	ecx, DWORD PTR _tr$[ebp]
	add	ecx, 132				; 00000084H
	push	ecx
	call	_dyntab_add
	add	esp, 28					; 0000001cH
	test	eax, eax
	je	SHORT $L70420
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29872], OFFSET FLAT:$SG70422
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 200		; 000000c8H
	jmp	$eva_err$70389
$L70420:
	jmp	SHORT $L70426
$L70418:
	push	0
	push	0
	push	0
	push	0
	push	0
	mov	ecx, DWORD PTR _childnode$70404[ebp]
	push	ecx
	mov	edx, DWORD PTR _tr$[ebp]
	add	edx, 132				; 00000084H
	push	edx
	call	_dyntab_add
	add	esp, 28					; 0000001cH
	test	eax, eax
	je	SHORT $L70426
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29872], OFFSET FLAT:$SG70428
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 200		; 000000c8H
	jmp	SHORT $eva_err$70389
$L70426:

; 201  : 		if(ctrl_tree_status(cntxt, tr, childnode, status, maxlvl-1)) STACK_ERROR;

	mov	edx, DWORD PTR _maxlvl$[ebp]
	sub	edx, 1
	push	edx
	mov	eax, DWORD PTR _status$[ebp]
	push	eax
	mov	ecx, DWORD PTR _childnode$70404[ebp]
	push	ecx
	mov	edx, DWORD PTR _tr$[ebp]
	push	edx
	mov	eax, DWORD PTR _cntxt$[ebp]
	push	eax
	call	_ctrl_tree_status
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L70429
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 201		; 000000c9H
	jmp	SHORT $eva_err$70389
$L70429:

; 202  : 	}

	jmp	$L70402
$eva_noerr$70385:

; 203  : 
; 204  : 	RETURN_OK_CLEANUP;

	push	0
	push	OFFSET FLAT:$SG70430
	push	OFFSET FLAT:$SG70431
	mov	edx, DWORD PTR _cntxt$[ebp]
	push	edx
	call	_err_clear
	add	esp, 16					; 00000010H
$eva_err$70389:
	mov	eax, DWORD PTR _cntxt$[ebp]
	cmp	DWORD PTR [eax+29872], 0
	je	SHORT $L70432
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	edx, DWORD PTR [ecx+29900]
	push	edx
	push	OFFSET FLAT:$SG70433
	push	OFFSET FLAT:$SG70434
	mov	eax, DWORD PTR _cntxt$[ebp]
	push	eax
	call	_err_add_context
	add	esp, 16					; 00000010H
$L70432:
	lea	ecx, DWORD PTR _list$[ebp]
	push	ecx
	call	_dyntab_free
	add	esp, 4
	lea	edx, DWORD PTR _id_obj$[ebp]
	push	edx
	call	_dyntab_free
	add	esp, 4
	mov	eax, DWORD PTR _child_path$[ebp]
	push	eax
	call	_mem_free
	add	esp, 4
	mov	DWORD PTR _child_path$[ebp], 0
	mov	ecx, DWORD PTR _cntxt$[ebp]
	xor	eax, eax
	cmp	DWORD PTR [ecx+29872], 0
	setne	al

; 205  : }

	pop	edi
	mov	esp, ebp
	pop	ebp
	ret	0
_ctrl_tree_status ENDP
_TEXT	ENDS
PUBLIC	_ctrl_tree_minmax
EXTRN	_strncmp:NEAR
EXTRN	_dyntab_del_rows:NEAR
_DATA	SEGMENT
	ORG $+3
$SG70464 DB	'D:\Travail\ABI\EVA\V4.0\CGI\Brunix-2016\ctrl_tree.c', 00H
$SG70465 DB	'ctrl_tree_minmax', 00H
	ORG $+3
$SG70468 DB	'D:\Travail\ABI\EVA\V4.0\CGI\Brunix-2016\ctrl_tree.c', 00H
$SG70469 DB	'ctrl_tree_minmax', 00H
_DATA	ENDS
_TEXT	SEGMENT
_cntxt$ = 8
_treenodes$ = 12
_path$ = 16
_sz_path$ = 20
_i$ = -4
_c$70452 = -12
_p$70453 = -8
_l$70454 = -16
_ctrl_tree_minmax PROC NEAR

; 219  : ){

	push	ebp
	mov	ebp, esp
	sub	esp, 16					; 00000010H

; 220  : 	unsigned long i;
; 221  : 
; 222  : 	/* Process given cgi values */
; 223  : 	for(i = treenodes->nbrows; i; i--)

	mov	eax, DWORD PTR _treenodes$[ebp]
	mov	ecx, DWORD PTR [eax]
	mov	DWORD PTR _i$[ebp], ecx
	jmp	SHORT $L70449
$L70450:
	mov	edx, DWORD PTR _i$[ebp]
	sub	edx, 1
	mov	DWORD PTR _i$[ebp], edx
$L70449:
	cmp	DWORD PTR _i$[ebp], 0
	je	$eva_noerr$70463

; 225  : 		DynTableCell *c = dyntab_cell(treenodes, i - 1, 0);

	push	0
	mov	eax, DWORD PTR _i$[ebp]
	sub	eax, 1
	push	eax
	mov	ecx, DWORD PTR _treenodes$[ebp]
	push	ecx
	call	_dyntab_cell
	add	esp, 12					; 0000000cH
	mov	DWORD PTR _c$70452[ebp], eax

; 226  : 		char *p = c->txt;

	mov	edx, DWORD PTR _c$70452[ebp]
	mov	eax, DWORD PTR [edx]
	mov	DWORD PTR _p$70453[ebp], eax

; 227  : 		size_t l = c->len;

	mov	ecx, DWORD PTR _c$70452[ebp]
	mov	edx, DWORD PTR [ecx+4]
	mov	DWORD PTR _l$70454[ebp], edx

; 228  : 		if(!l) continue;

	cmp	DWORD PTR _l$70454[ebp], 0
	jne	SHORT $L70455
	jmp	SHORT $L70450
$L70455:

; 229  : 
; 230  : 		/* Hide details if subnode */
; 231  : 		if(l > sz_path && !strncmp(p + l - sz_path, path, sz_path))

	mov	eax, DWORD PTR _l$70454[ebp]
	cmp	eax, DWORD PTR _sz_path$[ebp]
	jbe	SHORT $L70456
	mov	ecx, DWORD PTR _sz_path$[ebp]
	push	ecx
	mov	edx, DWORD PTR _path$[ebp]
	push	edx
	mov	eax, DWORD PTR _p$70453[ebp]
	add	eax, DWORD PTR _l$70454[ebp]
	sub	eax, DWORD PTR _sz_path$[ebp]
	push	eax
	call	_strncmp
	add	esp, 12					; 0000000cH
	test	eax, eax
	jne	SHORT $L70456

; 232  : 			c->ctype = 1;

	mov	ecx, DWORD PTR _c$70452[ebp]
	mov	DWORD PTR [ecx+52], 1

; 233  : 
; 234  : 		/* Hide children if parent */
; 235  : 		else if(l < sz_path && !strncmp(p, path + sz_path - l, l))

	jmp	SHORT $L70462
$L70456:
	mov	edx, DWORD PTR _l$70454[ebp]
	cmp	edx, DWORD PTR _sz_path$[ebp]
	jae	SHORT $L70458
	mov	eax, DWORD PTR _l$70454[ebp]
	push	eax
	mov	ecx, DWORD PTR _path$[ebp]
	add	ecx, DWORD PTR _sz_path$[ebp]
	sub	ecx, DWORD PTR _l$70454[ebp]
	push	ecx
	mov	edx, DWORD PTR _p$70453[ebp]
	push	edx
	call	_strncmp
	add	esp, 12					; 0000000cH
	test	eax, eax
	jne	SHORT $L70458

; 236  : 			c->ctype = 5;

	mov	eax, DWORD PTR _c$70452[ebp]
	mov	DWORD PTR [eax+52], 5

; 237  : 
; 238  : 		/* Hide others */
; 239  : 		else if(l != sz_path || strncmp(p, path, l))

	jmp	SHORT $L70462
$L70458:
	mov	ecx, DWORD PTR _l$70454[ebp]
	cmp	ecx, DWORD PTR _sz_path$[ebp]
	jne	SHORT $L70461
	mov	edx, DWORD PTR _l$70454[ebp]
	push	edx
	mov	eax, DWORD PTR _path$[ebp]
	push	eax
	mov	ecx, DWORD PTR _p$70453[ebp]
	push	ecx
	call	_strncmp
	add	esp, 12					; 0000000cH
	test	eax, eax
	je	SHORT $L70462
$L70461:

; 241  : 			dyntab_del_rows(treenodes, i - 1, 1);

	push	1
	mov	edx, DWORD PTR _i$[ebp]
	sub	edx, 1
	push	edx
	mov	eax, DWORD PTR _treenodes$[ebp]
	push	eax
	call	_dyntab_del_rows
	add	esp, 12					; 0000000cH

; 242  : 			if(i < treenodes->nbrows) i++;

	mov	ecx, DWORD PTR _treenodes$[ebp]
	mov	edx, DWORD PTR _i$[ebp]
	cmp	edx, DWORD PTR [ecx]
	jae	SHORT $L70462
	mov	eax, DWORD PTR _i$[ebp]
	add	eax, 1
	mov	DWORD PTR _i$[ebp], eax
$L70462:

; 244  : 	}

	jmp	$L70450
$eva_noerr$70463:

; 245  : 	RETURN_OK_CLEANUP;

	push	0
	push	OFFSET FLAT:$SG70464
	push	OFFSET FLAT:$SG70465
	mov	ecx, DWORD PTR _cntxt$[ebp]
	push	ecx
	call	_err_clear
	add	esp, 16					; 00000010H
$eva_err$70466:
	mov	edx, DWORD PTR _cntxt$[ebp]
	cmp	DWORD PTR [edx+29872], 0
	je	SHORT $L70467
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	ecx, DWORD PTR [eax+29900]
	push	ecx
	push	OFFSET FLAT:$SG70468
	push	OFFSET FLAT:$SG70469
	mov	edx, DWORD PTR _cntxt$[ebp]
	push	edx
	call	_err_add_context
	add	esp, 16					; 00000010H
$L70467:
	mov	eax, DWORD PTR _cntxt$[ebp]
	xor	ecx, ecx
	cmp	DWORD PTR [eax+29872], 0
	setne	cl
	mov	eax, ecx

; 246  : }

	mov	esp, ebp
	pop	ebp
	ret	0
_ctrl_tree_minmax ENDP
_TEXT	ENDS
PUBLIC	_put_html_tree
EXTRN	_form_eval_fieldexpr:NEAR
EXTRN	_put_html_button_sz:NEAR
EXTRN	_plain_to_html:BYTE
EXTRN	_qry_obj_data:NEAR
EXTRN	_ctrl_cgi_name:NEAR
EXTRN	_dynbuf_add3_int:NEAR
EXTRN	_dyntab_copy:NEAR
EXTRN	_dyntab_cmp:NEAR
EXTRN	_ctrl_add_symbol_btn:NEAR
_BSS	SEGMENT
	ALIGN	4

$SG70699 DB	01H DUP (?)
	ALIGN	4

$SG70518 DB	01H DUP (?)
	ALIGN	4

$SG70543 DB	01H DUP (?)
	ALIGN	4

$SG70584 DB	01H DUP (?)
_BSS	ENDS
_DATA	SEGMENT
	ORG $+3
$SG70512 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70519 DB	'/', 00H
	ORG $+2
$SG70521 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70530 DB	'''', 00H
	ORG $+2
$SG70531 DB	'<input type=hidden name=''', 00H
	ORG $+2
$SG70533 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70537 DB	0a7H, 00H
	ORG $+2
$SG70538 DB	' value=''', 00H
	ORG $+3
$SG70540 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70542 DB	'''>', 00H
	ORG $+1
$SG70545 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70549 DB	0aH, 00H
	ORG $+2
$SG70551 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70565 DB	'<table cellspacing=0 cellpadding=0 border=0>', 00H
	ORG $+3
$SG70567 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70571 DB	'<tr><td valign=top width=20', 00H
$SG70573 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70578 DB	' background=''../img/_eva_tree_bar.gif''', 00H
	ORG $+1
$SG70580 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70585 DB	' bgcolor=#', 00H
	ORG $+1
$SG70587 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70590 DB	'>', 00H
	ORG $+2
$SG70592 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70596 DB	0a7H, 00H
	ORG $+2
$SG70597 DB	'TREEOPEN=', 00H
	ORG $+2
$SG70599 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70606 DB	'<img src=''../img/_eva_tree_end.gif''>', 00H
	ORG $+3
$SG70608 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70614 DB	'Ouvrir la branche', 00H
	ORG $+2
$SG70615 DB	'_eva_tree_single_s.gif', 00H
	ORG $+1
$SG70616 DB	'_eva_tree_single.gif', 00H
	ORG $+3
$SG70622 DB	'Refermer la branche', 00H
$SG70623 DB	'_eva_tree_minus_s.gif', 00H
	ORG $+2
$SG70624 DB	'_eva_tree_minus.gif', 00H
$SG70629 DB	'Ouvrir la branche', 00H
	ORG $+2
$SG70630 DB	'_eva_tree_plus_s.gif', 00H
	ORG $+3
$SG70631 DB	'_eva_tree_plus.gif', 00H
	ORG $+1
$SG70634 DB	'</td><td>', 0aH, 00H
	ORG $+1
$SG70636 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70639 DB	'<table cellspacing=0 cellpadding=0 border=0><tr>', 00H
	ORG $+3
$SG70641 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70644 DB	'<td valign=top width=1%', 00H
$SG70646 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70650 DB	' background=''../img/_eva_tree_bar.gif''', 00H
	ORG $+1
$SG70652 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70655 DB	'>', 00H
	ORG $+2
$SG70657 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70660 DB	'SYMBOL+LABEL+NOTES', 00H
	ORG $+1
$SG70661 DB	'*><font size=-1', 00H
$SG70664 DB	'</font><font size=-2>', 00H
	ORG $+2
$SG70666 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70669 DB	')', 00H
	ORG $+2
$SG70670 DB	' (', 00H
	ORG $+1
$SG70672 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70677 DB	0a7H, 00H
	ORG $+2
$SG70678 DB	'TREEOPENALL=', 00H
	ORG $+3
$SG70680 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70687 DB	'D', 0e9H, 'velopper toutes les branches', 00H
	ORG $+1
$SG70688 DB	'_eva_tree_plus2_s.gif', 00H
	ORG $+2
$SG70689 DB	'_eva_tree_plus2.gif', 00H
$SG70693 DB	'D:\Travail\ABI\EVA\V4.0\CGI\Brunix-2016\ctrl_tree.c', 00H
$SG70694 DB	'put_html_tree', 00H
	ORG $+2
$SG70700 DB	'<br>', 00H
	ORG $+3
$SG70702 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70705 DB	'</font></td></tr>', 00H
	ORG $+2
$SG70707 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70714 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70717 DB	'<tr><td colspan=3>', 00H
	ORG $+1
$SG70719 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70723 DB	'</td>', 0aH, '</tr>', 00H
$SG70725 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70729 DB	'</table></td>', 0aH, '</tr>', 00H
$SG70731 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70734 DB	'</table>', 00H
	ORG $+3
$SG70736 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70737 DB	'D:\Travail\ABI\EVA\V4.0\CGI\Brunix-2016\ctrl_tree.c', 00H
$SG70738 DB	'put_html_tree', 00H
	ORG $+2
$SG70740 DB	'D:\Travail\ABI\EVA\V4.0\CGI\Brunix-2016\ctrl_tree.c', 00H
$SG70741 DB	'put_html_tree', 00H
_DATA	ENDS
_TEXT	SEGMENT
_cntxt$ = 8
_tr$ = 12
_path$ = 16
_id_obj$ = 20
_b_last$ = 24
_parent_status$ = 28
_form$ = -8
_ctrl$ = -124
_i$ = -68
_inode$ = -116
_idobj$ = -32
_status$ = -112
_data$ = -56
_objdata$ = -108
_children$ = -88
_id_child$ = -28
_subfield$ = -4
_name$ = -120
_child_path$ = -64
_b_hide$ = -60
_html$ = -36
_row$70557 = -128
_j$70558 = -132
_put_html_tree PROC NEAR

; 269  : ){

	push	ebp
	mov	ebp, esp
	sub	esp, 208				; 000000d0H
	push	esi

; 270  : 	EVA_form *form = cntxt->form;

	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	ecx, DWORD PTR [eax+80]
	mov	DWORD PTR _form$[ebp], ecx

; 271  : 	EVA_ctrl *ctrl = form->ctrl + tr->i_ctrl;

	mov	edx, DWORD PTR _tr$[ebp]
	mov	eax, DWORD PTR [edx]
	imul	eax, 480				; 000001e0H
	mov	ecx, DWORD PTR _form$[ebp]
	mov	edx, DWORD PTR [ecx]
	add	edx, eax
	mov	DWORD PTR _ctrl$[ebp], edx

; 272  : 	unsigned long i, inode;
; 273  : 	unsigned long idobj = DYNTAB_TOUL(id_obj);

	push	10					; 0000000aH
	push	0
	push	0
	push	0
	mov	eax, DWORD PTR _id_obj$[ebp]
	push	eax
	call	_dyntab_val
	add	esp, 12					; 0000000cH
	push	eax
	call	_strtoul
	add	esp, 12					; 0000000cH
	mov	DWORD PTR _idobj$[ebp], eax

; 274  : 	int status;
; 275  : 	DynTable data = { 0 };

	mov	DWORD PTR _data$[ebp], 0
	xor	ecx, ecx
	mov	DWORD PTR _data$[ebp+4], ecx
	mov	DWORD PTR _data$[ebp+8], ecx
	mov	DWORD PTR _data$[ebp+12], ecx
	mov	DWORD PTR _data$[ebp+16], ecx

; 276  : 	DynTable objdata = { 0 };

	mov	DWORD PTR _objdata$[ebp], 0
	xor	edx, edx
	mov	DWORD PTR _objdata$[ebp+4], edx
	mov	DWORD PTR _objdata$[ebp+8], edx
	mov	DWORD PTR _objdata$[ebp+12], edx
	mov	DWORD PTR _objdata$[ebp+16], edx

; 277  : 	DynTable children = { 0 };

	mov	DWORD PTR _children$[ebp], 0
	xor	eax, eax
	mov	DWORD PTR _children$[ebp+4], eax
	mov	DWORD PTR _children$[ebp+8], eax
	mov	DWORD PTR _children$[ebp+12], eax
	mov	DWORD PTR _children$[ebp+16], eax

; 278  : 	DynTable id_child = { 0 };

	mov	DWORD PTR _id_child$[ebp], 0
	xor	ecx, ecx
	mov	DWORD PTR _id_child$[ebp+4], ecx
	mov	DWORD PTR _id_child$[ebp+8], ecx
	mov	DWORD PTR _id_child$[ebp+12], ecx
	mov	DWORD PTR _id_child$[ebp+16], ecx

; 279  : 	DynBuffer *subfield = NULL;

	mov	DWORD PTR _subfield$[ebp], 0

; 280  : 	DynBuffer *name = NULL;

	mov	DWORD PTR _name$[ebp], 0

; 281  : 	DynBuffer *child_path = NULL;

	mov	DWORD PTR _child_path$[ebp], 0

; 282  : 	int b_hide = tr->b_level1 && !dyntab_cmp(id_obj, 0, 0, &form->id_obj, 0, 0);

	mov	edx, DWORD PTR _tr$[ebp]
	cmp	DWORD PTR [edx+124], 0
	je	SHORT $L70973
	push	0
	push	0
	mov	eax, DWORD PTR _form$[ebp]
	add	eax, 32					; 00000020H
	push	eax
	push	0
	push	0
	mov	ecx, DWORD PTR _id_obj$[ebp]
	push	ecx
	call	_dyntab_cmp
	add	esp, 24					; 00000018H
	test	eax, eax
	jne	SHORT $L70973
	mov	DWORD PTR -136+[ebp], 1
	jmp	SHORT $L70974
$L70973:
	mov	DWORD PTR -136+[ebp], 0
$L70974:
	mov	edx, DWORD PTR -136+[ebp]
	mov	DWORD PTR _b_hide$[ebp], edx

; 283  : 	CHECK_HTML_STATUS;

	cmp	DWORD PTR _cntxt$[ebp], 0
	je	SHORT $L70977
	mov	eax, DWORD PTR _cntxt$[ebp]
	cmp	DWORD PTR [eax+80], 0
	je	SHORT $L70975
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	edx, DWORD PTR [ecx+80]
	mov	eax, DWORD PTR [edx+232]
	mov	DWORD PTR -140+[ebp], eax
	jmp	SHORT $L70976
$L70975:
	mov	DWORD PTR -140+[ebp], 0
$L70976:
	mov	ecx, DWORD PTR -140+[ebp]
	mov	DWORD PTR -144+[ebp], ecx
	jmp	SHORT $L70978
$L70977:
	mov	DWORD PTR -144+[ebp], 0
$L70978:
	mov	edx, DWORD PTR -144+[ebp]
	mov	DWORD PTR _html$[ebp], edx
	cmp	DWORD PTR _html$[ebp], 0
	jne	SHORT $L70508
	xor	eax, eax
	jmp	$L70486
$L70508:

; 284  : 
; 285  : 	/* Build node path */
; 286  : 	DYNBUF_ADD_CELL(&child_path, id_obj, 0, 0, NO_CONV);

	push	0
	push	0
	push	0
	push	0
	mov	eax, DWORD PTR _id_obj$[ebp]
	push	eax
	call	_dyntab_sz
	add	esp, 12					; 0000000cH
	push	eax
	push	0
	push	0
	mov	ecx, DWORD PTR _id_obj$[ebp]
	push	ecx
	call	_dyntab_val
	add	esp, 12					; 0000000cH
	push	eax
	lea	edx, DWORD PTR _child_path$[ebp]
	push	edx
	call	_dynbuf_add
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L70510
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29872], OFFSET FLAT:$SG70512
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 286		; 0000011eH
	jmp	$eva_err$70513
$L70510:

; 287  : 	if(path) DYNBUF_ADD3_BUF(&child_path, "/", path, NO_CONV, "");

	cmp	DWORD PTR _path$[ebp], 0
	je	$L70517
	cmp	DWORD PTR _path$[ebp], 0
	je	SHORT $L70979
	mov	edx, DWORD PTR _path$[ebp]
	mov	eax, DWORD PTR [edx+4]
	mov	DWORD PTR -148+[ebp], eax
	jmp	SHORT $L70980
$L70979:
	mov	DWORD PTR -148+[ebp], 0
$L70980:
	cmp	DWORD PTR _path$[ebp], 0
	je	SHORT $L70981
	mov	ecx, DWORD PTR _path$[ebp]
	add	ecx, 8
	mov	DWORD PTR -152+[ebp], ecx
	jmp	SHORT $L70982
$L70981:
	mov	DWORD PTR -152+[ebp], 0
$L70982:
	push	0
	push	OFFSET FLAT:$SG70518
	push	0
	push	0
	mov	edx, DWORD PTR -148+[ebp]
	push	edx
	mov	eax, DWORD PTR -152+[ebp]
	push	eax
	push	1
	push	OFFSET FLAT:$SG70519
	lea	ecx, DWORD PTR _child_path$[ebp]
	push	ecx
	call	_dynbuf_add3
	add	esp, 36					; 00000024H
	test	eax, eax
	je	SHORT $L70517
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29872], OFFSET FLAT:$SG70521
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 287		; 0000011fH
	jmp	$eva_err$70513
$L70517:

; 288  : 
; 289  : 	/* Read node status */
; 290  : 	inode = get_node_status(&tr->treenodes, DYNBUF_VAL_SZ(child_path), &status);

	cmp	DWORD PTR _child_path$[ebp], 0
	je	SHORT $L70983
	mov	ecx, DWORD PTR _child_path$[ebp]
	mov	edx, DWORD PTR [ecx+4]
	mov	DWORD PTR -156+[ebp], edx
	jmp	SHORT $L70984
$L70983:
	mov	DWORD PTR -156+[ebp], 0
$L70984:
	cmp	DWORD PTR _child_path$[ebp], 0
	je	SHORT $L70985
	mov	eax, DWORD PTR _child_path$[ebp]
	add	eax, 8
	mov	DWORD PTR -160+[ebp], eax
	jmp	SHORT $L70986
$L70985:
	mov	DWORD PTR -160+[ebp], 0
$L70986:
	lea	ecx, DWORD PTR _status$[ebp]
	push	ecx
	mov	edx, DWORD PTR -156+[ebp]
	push	edx
	mov	eax, DWORD PTR -160+[ebp]
	push	eax
	mov	ecx, DWORD PTR _tr$[ebp]
	add	ecx, 132				; 00000084H
	push	ecx
	call	_get_node_status
	add	esp, 16					; 00000010H
	mov	DWORD PTR _inode$[ebp], eax

; 291  : 
; 292  : 	/* Return if parent status is single node and node not displayed */
; 293  : 	if(parent_status & 4 && inode >= tr->treenodes.nbrows) RETURN_OK;

	mov	edx, DWORD PTR _parent_status$[ebp]
	and	edx, 4
	test	edx, edx
	je	SHORT $L70523
	mov	eax, DWORD PTR _tr$[ebp]
	mov	ecx, DWORD PTR _inode$[ebp]
	cmp	ecx, DWORD PTR [eax+132]
	jb	SHORT $L70523
	jmp	$eva_noerr$70524
$L70523:

; 294  : 
; 295  : 	/* Output node status as CGI hidden input */
; 296  : 	if(status || !inode)

	cmp	DWORD PTR _status$[ebp], 0
	jne	SHORT $L70526
	cmp	DWORD PTR _inode$[ebp], 0
	jne	$L70548
$L70526:

; 298  : 		DYNBUF_ADD3_BUF(html, "<input type=hidden name='", ctrl->cginame, NO_CONV, "'");

	mov	edx, DWORD PTR _ctrl$[ebp]
	cmp	DWORD PTR [edx+40], 0
	je	SHORT $L70987
	mov	eax, DWORD PTR _ctrl$[ebp]
	mov	ecx, DWORD PTR [eax+40]
	mov	edx, DWORD PTR [ecx+4]
	mov	DWORD PTR -164+[ebp], edx
	jmp	SHORT $L70988
$L70987:
	mov	DWORD PTR -164+[ebp], 0
$L70988:
	mov	eax, DWORD PTR _ctrl$[ebp]
	cmp	DWORD PTR [eax+40], 0
	je	SHORT $L70989
	mov	ecx, DWORD PTR _ctrl$[ebp]
	mov	edx, DWORD PTR [ecx+40]
	add	edx, 8
	mov	DWORD PTR -168+[ebp], edx
	jmp	SHORT $L70990
$L70989:
	mov	DWORD PTR -168+[ebp], 0
$L70990:
	push	1
	push	OFFSET FLAT:$SG70530
	push	0
	push	0
	mov	eax, DWORD PTR -164+[ebp]
	push	eax
	mov	ecx, DWORD PTR -168+[ebp]
	push	ecx
	push	25					; 00000019H
	push	OFFSET FLAT:$SG70531
	mov	edx, DWORD PTR _html$[ebp]
	push	edx
	call	_dynbuf_add3
	add	esp, 36					; 00000024H
	test	eax, eax
	je	SHORT $L70529
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29872], OFFSET FLAT:$SG70533
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 298		; 0000012aH
	jmp	$eva_err$70513
$L70529:

; 299  : 		DYNBUF_ADD3_BUF(html, " value='", child_path, NO_CONV, "§");

	cmp	DWORD PTR _child_path$[ebp], 0
	je	SHORT $L70991
	mov	edx, DWORD PTR _child_path$[ebp]
	mov	eax, DWORD PTR [edx+4]
	mov	DWORD PTR -172+[ebp], eax
	jmp	SHORT $L70992
$L70991:
	mov	DWORD PTR -172+[ebp], 0
$L70992:
	cmp	DWORD PTR _child_path$[ebp], 0
	je	SHORT $L70993
	mov	ecx, DWORD PTR _child_path$[ebp]
	add	ecx, 8
	mov	DWORD PTR -176+[ebp], ecx
	jmp	SHORT $L70994
$L70993:
	mov	DWORD PTR -176+[ebp], 0
$L70994:
	push	1
	push	OFFSET FLAT:$SG70537
	push	0
	push	0
	mov	edx, DWORD PTR -172+[ebp]
	push	edx
	mov	eax, DWORD PTR -176+[ebp]
	push	eax
	push	8
	push	OFFSET FLAT:$SG70538
	mov	ecx, DWORD PTR _html$[ebp]
	push	ecx
	call	_dynbuf_add3
	add	esp, 36					; 00000024H
	test	eax, eax
	je	SHORT $L70536
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29872], OFFSET FLAT:$SG70540
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 299		; 0000012bH
	jmp	$eva_err$70513
$L70536:

; 300  : 		DYNBUF_ADD3_INT(html, "", status, "'>");

	push	2
	push	OFFSET FLAT:$SG70542
	mov	ecx, DWORD PTR _status$[ebp]
	push	ecx
	push	0
	push	OFFSET FLAT:$SG70543
	mov	edx, DWORD PTR _html$[ebp]
	push	edx
	call	_dynbuf_add3_int
	add	esp, 24					; 00000018H
	test	eax, eax
	je	SHORT $L70541
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29872], OFFSET FLAT:$SG70545
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 300		; 0000012cH
	jmp	$eva_err$70513
$L70541:

; 301  : 		if(cntxt->debug & DEBUG_HTML) DYNBUF_ADD_STR(cntxt->form->html, "\n");

	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	eax, DWORD PTR [edx+29860]
	and	eax, 128				; 00000080H
	test	eax, eax
	je	SHORT $L70548
	push	0
	push	0
	push	1
	push	OFFSET FLAT:$SG70549
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	edx, DWORD PTR [ecx+80]
	mov	eax, DWORD PTR [edx+232]
	push	eax
	call	_dynbuf_add
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L70548
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29872], OFFSET FLAT:$SG70551
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 301		; 0000012dH
	jmp	$eva_err$70513
$L70548:

; 303  : 
; 304  : 	/* Read object data */
; 305  : 	if(qry_obj_data(cntxt, &objdata, id_obj, NULL)) STACK_ERROR;

	push	0
	mov	eax, DWORD PTR _id_obj$[ebp]
	push	eax
	lea	ecx, DWORD PTR _objdata$[ebp]
	push	ecx
	mov	edx, DWORD PTR _cntxt$[ebp]
	push	edx
	call	_qry_obj_data
	add	esp, 16					; 00000010H
	test	eax, eax
	je	SHORT $L70553
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 305		; 00000131H
	jmp	$eva_err$70513
$L70553:

; 306  : 
; 307  : 	/* Read children objects Ids */
; 308  : 	for(i = 0; i < tr->nbrel; i++)

	mov	DWORD PTR _i$[ebp], 0
	jmp	SHORT $L70554
$L70555:
	mov	ecx, DWORD PTR _i$[ebp]
	add	ecx, 1
	mov	DWORD PTR _i$[ebp], ecx
$L70554:
	mov	edx, DWORD PTR _tr$[ebp]
	mov	eax, DWORD PTR _i$[ebp]
	cmp	eax, DWORD PTR [edx+4]
	jae	$L70556

; 310  : 		unsigned long row = children.nbrows, j;

	mov	ecx, DWORD PTR _children$[ebp]
	mov	DWORD PTR _row$70557[ebp], ecx

; 311  : 		if(ctrl_tree_qry_children(cntxt, &children,
; 312  : 					DYNTAB_VAL_SZ(&tr->relfields, i, 1),
; 313  : 					(dyntab_sz(&tr->exclude, i, 0) ? 1 : 0) |
; 314  : 					(tr->b_reverse ? 2 : 0), id_obj)) STACK_ERROR;

	mov	edx, DWORD PTR _id_obj$[ebp]
	push	edx
	push	0
	mov	eax, DWORD PTR _i$[ebp]
	push	eax
	mov	ecx, DWORD PTR _tr$[ebp]
	add	ecx, 72					; 00000048H
	push	ecx
	call	_dyntab_sz
	add	esp, 12					; 0000000cH
	neg	eax
	sbb	eax, eax
	neg	eax
	mov	edx, DWORD PTR _tr$[ebp]
	mov	ecx, DWORD PTR [edx+112]
	neg	ecx
	sbb	ecx, ecx
	and	ecx, 2
	or	eax, ecx
	push	eax
	push	1
	mov	edx, DWORD PTR _i$[ebp]
	push	edx
	mov	eax, DWORD PTR _tr$[ebp]
	add	eax, 12					; 0000000cH
	push	eax
	call	_dyntab_sz
	add	esp, 12					; 0000000cH
	push	eax
	push	1
	mov	ecx, DWORD PTR _i$[ebp]
	push	ecx
	mov	edx, DWORD PTR _tr$[ebp]
	add	edx, 12					; 0000000cH
	push	edx
	call	_dyntab_val
	add	esp, 12					; 0000000cH
	push	eax
	lea	eax, DWORD PTR _children$[ebp]
	push	eax
	mov	ecx, DWORD PTR _cntxt$[ebp]
	push	ecx
	call	_ctrl_tree_qry_children
	add	esp, 24					; 00000018H
	test	eax, eax
	je	SHORT $L70559
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 314		; 0000013aH
	jmp	$eva_err$70513
$L70559:

; 315  : 		for(j = row; j < children.nbrows; j++) dyntab_cell(&children, j, 0)->col = i + 1;

	mov	eax, DWORD PTR _row$70557[ebp]
	mov	DWORD PTR _j$70558[ebp], eax
	jmp	SHORT $L70560
$L70561:
	mov	ecx, DWORD PTR _j$70558[ebp]
	add	ecx, 1
	mov	DWORD PTR _j$70558[ebp], ecx
$L70560:
	mov	edx, DWORD PTR _j$70558[ebp]
	cmp	edx, DWORD PTR _children$[ebp]
	jae	SHORT $L70562
	mov	esi, DWORD PTR _i$[ebp]
	add	esi, 1
	push	0
	mov	eax, DWORD PTR _j$70558[ebp]
	push	eax
	lea	ecx, DWORD PTR _children$[ebp]
	push	ecx
	call	_dyntab_cell
	add	esp, 12					; 0000000cH
	mov	DWORD PTR [eax+56], esi
	jmp	SHORT $L70561
$L70562:

; 316  : 	}

	jmp	$L70555
$L70556:

; 317  : 
; 318  : 	/* Output table header */
; 319  : 	DYNBUF_ADD_STR(html, "<table cellspacing=0 cellpadding=0 border=0>");

	push	0
	push	0
	push	44					; 0000002cH
	push	OFFSET FLAT:$SG70565
	mov	edx, DWORD PTR _html$[ebp]
	push	edx
	call	_dynbuf_add
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L70564
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29872], OFFSET FLAT:$SG70567
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 319		; 0000013fH
	jmp	$eva_err$70513
$L70564:

; 320  : 
; 321  : 	/* If not hidden first node */
; 322  : 	if(!b_hide)

	cmp	DWORD PTR _b_hide$[ebp], 0
	jne	$L70704

; 324  : 		/* Output cell header */
; 325  : 		DYNBUF_ADD_STR(html, "<tr><td valign=top width=20");

	push	0
	push	0
	push	27					; 0000001bH
	push	OFFSET FLAT:$SG70571
	mov	edx, DWORD PTR _html$[ebp]
	push	edx
	call	_dynbuf_add
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L70570
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29872], OFFSET FLAT:$SG70573
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 325		; 00000145H
	jmp	$eva_err$70513
$L70570:

; 326  : 		if(!b_last || parent_status & 4) DYNBUF_ADD_STR(html, " background='../img/_eva_tree_bar.gif'");

	cmp	DWORD PTR _b_last$[ebp], 0
	je	SHORT $L70575
	mov	edx, DWORD PTR _parent_status$[ebp]
	and	edx, 4
	test	edx, edx
	je	SHORT $L70577
$L70575:
	push	0
	push	0
	push	38					; 00000026H
	push	OFFSET FLAT:$SG70578
	mov	eax, DWORD PTR _html$[ebp]
	push	eax
	call	_dynbuf_add
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L70577
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29872], OFFSET FLAT:$SG70580
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 326		; 00000146H
	jmp	$eva_err$70513
$L70577:

; 327  : 		i = dyntab_cell(id_obj, 0, 0)->col;

	push	0
	push	0
	mov	eax, DWORD PTR _id_obj$[ebp]
	push	eax
	call	_dyntab_cell
	add	esp, 12					; 0000000cH
	mov	ecx, DWORD PTR [eax+56]
	mov	DWORD PTR _i$[ebp], ecx

; 328  : 		if(i && dyntab_sz(&tr->relcolor, i - 1, 0))

	cmp	DWORD PTR _i$[ebp], 0
	je	$L70583
	push	0
	mov	edx, DWORD PTR _i$[ebp]
	sub	edx, 1
	push	edx
	mov	eax, DWORD PTR _tr$[ebp]
	add	eax, 52					; 00000034H
	push	eax
	call	_dyntab_sz
	add	esp, 12					; 0000000cH
	test	eax, eax
	je	SHORT $L70583

; 329  : 			DYNBUF_ADD3_CELL(html, " bgcolor=#", &tr->relcolor, i - 1, 0, NO_CONV, "");

	push	0
	push	OFFSET FLAT:$SG70584
	push	0
	push	0
	push	0
	mov	ecx, DWORD PTR _i$[ebp]
	sub	ecx, 1
	push	ecx
	mov	edx, DWORD PTR _tr$[ebp]
	add	edx, 52					; 00000034H
	push	edx
	call	_dyntab_sz
	add	esp, 12					; 0000000cH
	push	eax
	push	0
	mov	eax, DWORD PTR _i$[ebp]
	sub	eax, 1
	push	eax
	mov	ecx, DWORD PTR _tr$[ebp]
	add	ecx, 52					; 00000034H
	push	ecx
	call	_dyntab_val
	add	esp, 12					; 0000000cH
	push	eax
	push	10					; 0000000aH
	push	OFFSET FLAT:$SG70585
	mov	edx, DWORD PTR _html$[ebp]
	push	edx
	call	_dynbuf_add3
	add	esp, 36					; 00000024H
	test	eax, eax
	je	SHORT $L70583
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29872], OFFSET FLAT:$SG70587
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 329		; 00000149H
	jmp	$eva_err$70513
$L70583:

; 330  : 		DYNBUF_ADD_STR(html, ">");

	push	0
	push	0
	push	1
	push	OFFSET FLAT:$SG70590
	mov	edx, DWORD PTR _html$[ebp]
	push	edx
	call	_dynbuf_add
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L70589
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29872], OFFSET FLAT:$SG70592
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 330		; 0000014aH
	jmp	$eva_err$70513
$L70589:

; 331  : 
; 332  : 		/* Output tree structure (plus / minus buttons & continuation bars) */
; 333  : 		M_FREE(subfield);

	mov	edx, DWORD PTR _subfield$[ebp]
	push	edx
	call	_mem_free
	add	esp, 4
	mov	DWORD PTR _subfield$[ebp], 0

; 334  : 		DYNBUF_ADD3_BUF(&subfield, "TREEOPEN=", child_path, NO_CONV, "§");

	cmp	DWORD PTR _child_path$[ebp], 0
	je	SHORT $L70995
	mov	eax, DWORD PTR _child_path$[ebp]
	mov	ecx, DWORD PTR [eax+4]
	mov	DWORD PTR -180+[ebp], ecx
	jmp	SHORT $L70996
$L70995:
	mov	DWORD PTR -180+[ebp], 0
$L70996:
	cmp	DWORD PTR _child_path$[ebp], 0
	je	SHORT $L70997
	mov	edx, DWORD PTR _child_path$[ebp]
	add	edx, 8
	mov	DWORD PTR -184+[ebp], edx
	jmp	SHORT $L70998
$L70997:
	mov	DWORD PTR -184+[ebp], 0
$L70998:
	push	1
	push	OFFSET FLAT:$SG70596
	push	0
	push	0
	mov	eax, DWORD PTR -180+[ebp]
	push	eax
	mov	ecx, DWORD PTR -184+[ebp]
	push	ecx
	push	9
	push	OFFSET FLAT:$SG70597
	lea	edx, DWORD PTR _subfield$[ebp]
	push	edx
	call	_dynbuf_add3
	add	esp, 36					; 00000024H
	test	eax, eax
	je	SHORT $L70595
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29872], OFFSET FLAT:$SG70599
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 334		; 0000014eH
	jmp	$eva_err$70513
$L70595:

; 335  : 		CTRL_CGINAMEBTN(&name, NULL, DYNBUF_VAL_SZ(subfield));

	cmp	DWORD PTR _subfield$[ebp], 0
	je	SHORT $L70999
	mov	edx, DWORD PTR _subfield$[ebp]
	mov	eax, DWORD PTR [edx+4]
	mov	DWORD PTR -188+[ebp], eax
	jmp	SHORT $L71000
$L70999:
	mov	DWORD PTR -188+[ebp], 0
$L71000:
	cmp	DWORD PTR _subfield$[ebp], 0
	je	SHORT $L71001
	mov	ecx, DWORD PTR _subfield$[ebp]
	add	ecx, 8
	mov	DWORD PTR -192+[ebp], ecx
	jmp	SHORT $L71002
$L71001:
	mov	DWORD PTR -192+[ebp], 0
$L71002:
	mov	edx, DWORD PTR -188+[ebp]
	push	edx
	mov	eax, DWORD PTR -192+[ebp]
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
	je	SHORT $L70602
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 335		; 0000014fH
	jmp	$eva_err$70513
$L70602:

; 336  : 		if(!children.nbrows)

	cmp	DWORD PTR _children$[ebp], 0
	jne	SHORT $L70603

; 337  : 			DYNBUF_ADD_STR(html, "<img src='../img/_eva_tree_end.gif'>")

	push	0
	push	0
	push	36					; 00000024H
	push	OFFSET FLAT:$SG70606
	mov	edx, DWORD PTR _html$[ebp]
	push	edx
	call	_dynbuf_add
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L70605
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29872], OFFSET FLAT:$SG70608
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 337		; 00000151H
	jmp	$eva_err$70513
$L70605:

; 338  : 		else if(status & 4)

	jmp	$L70628
$L70603:
	mov	edx, DWORD PTR _status$[ebp]
	and	edx, 4
	test	edx, edx
	je	SHORT $L70610

; 340  : 			if(put_html_button(cntxt, name->data, NULL,
; 341  : 						"_eva_tree_single.gif",
; 342  : 						"_eva_tree_single_s.gif",
; 343  : 						"Ouvrir la branche",
; 344  : 						0, 0))

	push	0
	push	0
	push	0
	push	0
	push	0
	push	OFFSET FLAT:$SG70614
	push	OFFSET FLAT:$SG70615
	push	OFFSET FLAT:$SG70616
	push	0
	mov	eax, DWORD PTR _name$[ebp]
	add	eax, 8
	push	eax
	mov	ecx, DWORD PTR _cntxt$[ebp]
	push	ecx
	call	_put_html_button_sz
	add	esp, 44					; 0000002cH
	test	eax, eax
	je	SHORT $L70613

; 345  : 					STACK_ERROR;

	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 345		; 00000159H
	jmp	$eva_err$70513
$L70613:

; 347  : 		else if(status & 1)

	jmp	$L70628
$L70610:
	mov	eax, DWORD PTR _status$[ebp]
	and	eax, 1
	test	eax, eax
	je	SHORT $L70618

; 349  : 			if(put_html_button(cntxt, name->data, NULL,
; 350  : 						"_eva_tree_minus.gif",
; 351  : 						"_eva_tree_minus_s.gif",
; 352  : 						"Refermer la branche",
; 353  : 						0, 0))

	push	0
	push	0
	push	0
	push	0
	push	0
	push	OFFSET FLAT:$SG70622
	push	OFFSET FLAT:$SG70623
	push	OFFSET FLAT:$SG70624
	push	0
	mov	ecx, DWORD PTR _name$[ebp]
	add	ecx, 8
	push	ecx
	mov	edx, DWORD PTR _cntxt$[ebp]
	push	edx
	call	_put_html_button_sz
	add	esp, 44					; 0000002cH
	test	eax, eax
	je	SHORT $L70621

; 354  : 					STACK_ERROR;

	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 354		; 00000162H
	jmp	$eva_err$70513
$L70621:

; 356  : 		else

	jmp	SHORT $L70628
$L70618:

; 358  : 			if(put_html_button(cntxt, name->data, NULL,
; 359  : 						"_eva_tree_plus.gif",
; 360  : 						"_eva_tree_plus_s.gif",
; 361  : 						"Ouvrir la branche",
; 362  : 						0, 0))

	push	0
	push	0
	push	0
	push	0
	push	0
	push	OFFSET FLAT:$SG70629
	push	OFFSET FLAT:$SG70630
	push	OFFSET FLAT:$SG70631
	push	0
	mov	ecx, DWORD PTR _name$[ebp]
	add	ecx, 8
	push	ecx
	mov	edx, DWORD PTR _cntxt$[ebp]
	push	edx
	call	_put_html_button_sz
	add	esp, 44					; 0000002cH
	test	eax, eax
	je	SHORT $L70628

; 363  : 					STACK_ERROR;

	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 363		; 0000016bH
	jmp	$eva_err$70513
$L70628:

; 365  : 		M_FREE(name);

	mov	ecx, DWORD PTR _name$[ebp]
	push	ecx
	call	_mem_free
	add	esp, 4
	mov	DWORD PTR _name$[ebp], 0

; 366  : 		DYNBUF_ADD_STR(html, "</td><td>\n");

	push	0
	push	0
	push	10					; 0000000aH
	push	OFFSET FLAT:$SG70634
	mov	edx, DWORD PTR _html$[ebp]
	push	edx
	call	_dynbuf_add
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L70633
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29872], OFFSET FLAT:$SG70636
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 366		; 0000016eH
	jmp	$eva_err$70513
$L70633:

; 367  : 		DYNBUF_ADD_STR(html, "<table cellspacing=0 cellpadding=0 border=0><tr>");

	push	0
	push	0
	push	48					; 00000030H
	push	OFFSET FLAT:$SG70639
	mov	edx, DWORD PTR _html$[ebp]
	push	edx
	call	_dynbuf_add
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L70638
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29872], OFFSET FLAT:$SG70641
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 367		; 0000016fH
	jmp	$eva_err$70513
$L70638:

; 368  : 
; 369  : 		/* Output column with vertical treebar background if open with children */
; 370  : 		DYNBUF_ADD_STR(html, "<td valign=top width=1%");

	push	0
	push	0
	push	23					; 00000017H
	push	OFFSET FLAT:$SG70644
	mov	edx, DWORD PTR _html$[ebp]
	push	edx
	call	_dynbuf_add
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L70643
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29872], OFFSET FLAT:$SG70646
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 370		; 00000172H
	jmp	$eva_err$70513
$L70643:

; 371  : 		if(children.nbrows && status & 1) DYNBUF_ADD_STR(html, " background='../img/_eva_tree_bar.gif'");

	cmp	DWORD PTR _children$[ebp], 0
	je	SHORT $L70649
	mov	edx, DWORD PTR _status$[ebp]
	and	edx, 1
	test	edx, edx
	je	SHORT $L70649
	push	0
	push	0
	push	38					; 00000026H
	push	OFFSET FLAT:$SG70650
	mov	eax, DWORD PTR _html$[ebp]
	push	eax
	call	_dynbuf_add
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L70649
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29872], OFFSET FLAT:$SG70652
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 371		; 00000173H
	jmp	$eva_err$70513
$L70649:

; 372  : 		DYNBUF_ADD_STR(html, ">");

	push	0
	push	0
	push	1
	push	OFFSET FLAT:$SG70655
	mov	eax, DWORD PTR _html$[ebp]
	push	eax
	call	_dynbuf_add
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L70654
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29872], OFFSET FLAT:$SG70657
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 372		; 00000174H
	jmp	$eva_err$70513
$L70654:

; 373  : 
; 374  : 		/* Output symbol for object */
; 375  : 		if(ctrl_add_symbol_btn(cntxt, ctrl, NULL, &objdata, 0, "*><font size=-1", "SYMBOL+LABEL+NOTES"))

	push	OFFSET FLAT:$SG70660
	push	OFFSET FLAT:$SG70661
	push	0
	lea	eax, DWORD PTR _objdata$[ebp]
	push	eax
	push	0
	mov	ecx, DWORD PTR _ctrl$[ebp]
	push	ecx
	mov	edx, DWORD PTR _cntxt$[ebp]
	push	edx
	call	_ctrl_add_symbol_btn
	add	esp, 28					; 0000001cH
	test	eax, eax
	je	SHORT $L70659

; 376  : 				STACK_ERROR;

	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 376		; 00000178H
	jmp	$eva_err$70513
$L70659:

; 377  : 		M_FREE(name);

	mov	ecx, DWORD PTR _name$[ebp]
	push	ecx
	call	_mem_free
	add	esp, 4
	mov	DWORD PTR _name$[ebp], 0

; 378  : 		DYNBUF_ADD_STR(html, "</font><font size=-2>");

	push	0
	push	0
	push	21					; 00000015H
	push	OFFSET FLAT:$SG70664
	mov	edx, DWORD PTR _html$[ebp]
	push	edx
	call	_dynbuf_add
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L70663
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29872], OFFSET FLAT:$SG70666
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 378		; 0000017aH
	jmp	$eva_err$70513
$L70663:

; 379  : 		if(children.nbrows) DYNBUF_ADD3_INT(html, " (", children.nbrows, ")");

	cmp	DWORD PTR _children$[ebp], 0
	je	SHORT $L70668
	push	1
	push	OFFSET FLAT:$SG70669
	mov	edx, DWORD PTR _children$[ebp]
	push	edx
	push	2
	push	OFFSET FLAT:$SG70670
	mov	eax, DWORD PTR _html$[ebp]
	push	eax
	call	_dynbuf_add3_int
	add	esp, 24					; 00000018H
	test	eax, eax
	je	SHORT $L70668
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29872], OFFSET FLAT:$SG70672
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 379		; 0000017bH
	jmp	$eva_err$70513
$L70668:

; 380  : 
; 381  : 		/* Output 'Open all' button */
; 382  : 		if(children.nbrows)

	cmp	DWORD PTR _children$[ebp], 0
	je	$L70673

; 384  : 			M_FREE(subfield);

	mov	eax, DWORD PTR _subfield$[ebp]
	push	eax
	call	_mem_free
	add	esp, 4
	mov	DWORD PTR _subfield$[ebp], 0

; 385  : 			DYNBUF_ADD3_BUF(&subfield, "TREEOPENALL=", child_path, NO_CONV, "§");

	cmp	DWORD PTR _child_path$[ebp], 0
	je	SHORT $L71003
	mov	ecx, DWORD PTR _child_path$[ebp]
	mov	edx, DWORD PTR [ecx+4]
	mov	DWORD PTR -196+[ebp], edx
	jmp	SHORT $L71004
$L71003:
	mov	DWORD PTR -196+[ebp], 0
$L71004:
	cmp	DWORD PTR _child_path$[ebp], 0
	je	SHORT $L71005
	mov	eax, DWORD PTR _child_path$[ebp]
	add	eax, 8
	mov	DWORD PTR -200+[ebp], eax
	jmp	SHORT $L71006
$L71005:
	mov	DWORD PTR -200+[ebp], 0
$L71006:
	push	1
	push	OFFSET FLAT:$SG70677
	push	0
	push	0
	mov	ecx, DWORD PTR -196+[ebp]
	push	ecx
	mov	edx, DWORD PTR -200+[ebp]
	push	edx
	push	12					; 0000000cH
	push	OFFSET FLAT:$SG70678
	lea	eax, DWORD PTR _subfield$[ebp]
	push	eax
	call	_dynbuf_add3
	add	esp, 36					; 00000024H
	test	eax, eax
	je	SHORT $L70676
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29872], OFFSET FLAT:$SG70680
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 385		; 00000181H
	jmp	$eva_err$70513
$L70676:

; 386  : 			CTRL_CGINAMEBTN(&name, NULL, DYNBUF_VAL_SZ(subfield));

	cmp	DWORD PTR _subfield$[ebp], 0
	je	SHORT $L71007
	mov	eax, DWORD PTR _subfield$[ebp]
	mov	ecx, DWORD PTR [eax+4]
	mov	DWORD PTR -204+[ebp], ecx
	jmp	SHORT $L71008
$L71007:
	mov	DWORD PTR -204+[ebp], 0
$L71008:
	cmp	DWORD PTR _subfield$[ebp], 0
	je	SHORT $L71009
	mov	edx, DWORD PTR _subfield$[ebp]
	add	edx, 8
	mov	DWORD PTR -208+[ebp], edx
	jmp	SHORT $L71010
$L71009:
	mov	DWORD PTR -208+[ebp], 0
$L71010:
	mov	eax, DWORD PTR -204+[ebp]
	push	eax
	mov	ecx, DWORD PTR -208+[ebp]
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
	je	SHORT $L70683
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 386		; 00000182H
	jmp	$eva_err$70513
$L70683:

; 387  : 			if(put_html_button(cntxt, name->data, NULL,
; 388  : 					"_eva_tree_plus2.gif",
; 389  : 					"_eva_tree_plus2_s.gif",
; 390  : 					"Développer toutes les branches",
; 391  : 					0, 4))

	push	4
	push	0
	push	0
	push	0
	push	0
	push	OFFSET FLAT:$SG70687
	push	OFFSET FLAT:$SG70688
	push	OFFSET FLAT:$SG70689
	push	0
	mov	eax, DWORD PTR _name$[ebp]
	add	eax, 8
	push	eax
	mov	ecx, DWORD PTR _cntxt$[ebp]
	push	ecx
	call	_put_html_button_sz
	add	esp, 44					; 0000002cH
	test	eax, eax
	je	SHORT $L70686

; 392  : 				STACK_ERROR;

	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 392		; 00000188H
	jmp	$eva_err$70513
$L70686:

; 393  : 			M_FREE(name);

	mov	eax, DWORD PTR _name$[ebp]
	push	eax
	call	_mem_free
	add	esp, 4
	mov	DWORD PTR _name$[ebp], 0
$L70673:

; 395  : 
; 396  : 		/* Output extra display field if applicable */
; 397  : 		if(status & 1)

	mov	ecx, DWORD PTR _status$[ebp]
	and	ecx, 1
	test	ecx, ecx
	je	$L70697

; 399  : 			if(tr->notesexpr && tr->notesexpr[0])

	mov	edx, DWORD PTR _tr$[ebp]
	cmp	DWORD PTR [edx+116], 0
	je	$L70697
	mov	eax, DWORD PTR _tr$[ebp]
	mov	ecx, DWORD PTR [eax+116]
	movsx	edx, BYTE PTR [ecx]
	test	edx, edx
	je	$L70697

; 401  : 				data.nbrows=0;

	mov	DWORD PTR _data$[ebp], 0

; 402  : 				if(form_eval_fieldexpr(cntxt, &data, 0, idobj, tr->notesexpr, tr->notesexpr_sz, &objdata, 0)) CLEAR_ERROR;

	push	0
	lea	eax, DWORD PTR _objdata$[ebp]
	push	eax
	mov	ecx, DWORD PTR _tr$[ebp]
	mov	edx, DWORD PTR [ecx+120]
	push	edx
	mov	eax, DWORD PTR _tr$[ebp]
	mov	ecx, DWORD PTR [eax+116]
	push	ecx
	mov	edx, DWORD PTR _idobj$[ebp]
	push	edx
	push	0
	lea	eax, DWORD PTR _data$[ebp]
	push	eax
	mov	ecx, DWORD PTR _cntxt$[ebp]
	push	ecx
	call	_form_eval_fieldexpr
	add	esp, 32					; 00000020H
	test	eax, eax
	je	SHORT $L70692
	push	402					; 00000192H
	push	OFFSET FLAT:$SG70693
	push	OFFSET FLAT:$SG70694
	mov	edx, DWORD PTR _cntxt$[ebp]
	push	edx
	call	_err_clear
	add	esp, 16					; 00000010H
$L70692:

; 403  : 				for(i = 0; i < data.nbrows; i++) DYNBUF_ADD3_CELL(html, "<br>", &data, i, 0, TO_HTML, "");

	mov	DWORD PTR _i$[ebp], 0
	jmp	SHORT $L70695
$L70696:
	mov	eax, DWORD PTR _i$[ebp]
	add	eax, 1
	mov	DWORD PTR _i$[ebp], eax
$L70695:
	mov	ecx, DWORD PTR _i$[ebp]
	cmp	ecx, DWORD PTR _data$[ebp]
	jae	SHORT $L70697
	push	0
	push	OFFSET FLAT:$SG70699
	push	1
	push	OFFSET FLAT:_plain_to_html
	push	0
	mov	edx, DWORD PTR _i$[ebp]
	push	edx
	lea	eax, DWORD PTR _data$[ebp]
	push	eax
	call	_dyntab_sz
	add	esp, 12					; 0000000cH
	push	eax
	push	0
	mov	ecx, DWORD PTR _i$[ebp]
	push	ecx
	lea	edx, DWORD PTR _data$[ebp]
	push	edx
	call	_dyntab_val
	add	esp, 12					; 0000000cH
	push	eax
	push	4
	push	OFFSET FLAT:$SG70700
	mov	eax, DWORD PTR _html$[ebp]
	push	eax
	call	_dynbuf_add3
	add	esp, 36					; 00000024H
	test	eax, eax
	je	SHORT $L70698
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29872], OFFSET FLAT:$SG70702
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 403		; 00000193H
	jmp	$eva_err$70513
$L70698:
	jmp	SHORT $L70696
$L70697:

; 406  : 
; 407  : 		DYNBUF_ADD_STR(html, "</font></td></tr>");

	push	0
	push	0
	push	17					; 00000011H
	push	OFFSET FLAT:$SG70705
	mov	eax, DWORD PTR _html$[ebp]
	push	eax
	call	_dynbuf_add
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L70704
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29872], OFFSET FLAT:$SG70707
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 407		; 00000197H
	jmp	$eva_err$70513
$L70704:

; 409  : 
; 410  : 	/* Recursively output related objects */
; 411  : 	if(status & 1) for(i = 0; i < children.nbrows; i++)

	mov	eax, DWORD PTR _status$[ebp]
	and	eax, 1
	test	eax, eax
	je	$L70711
	mov	DWORD PTR _i$[ebp], 0
	jmp	SHORT $L70709
$L70710:
	mov	ecx, DWORD PTR _i$[ebp]
	add	ecx, 1
	mov	DWORD PTR _i$[ebp], ecx
$L70709:
	mov	edx, DWORD PTR _i$[ebp]
	cmp	edx, DWORD PTR _children$[ebp]
	jae	$L70711

; 413  : 		DYNTAB_SET_CELL(&id_child, 0, 0, &children, i, 0);

	push	0
	push	0
	mov	eax, DWORD PTR _i$[ebp]
	push	eax
	lea	ecx, DWORD PTR _children$[ebp]
	push	ecx
	call	_dyntab_cell
	add	esp, 12					; 0000000cH
	push	eax
	push	0
	push	0
	lea	edx, DWORD PTR _id_child$[ebp]
	push	edx
	call	_dyntab_copy
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L70712
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29872], OFFSET FLAT:$SG70714
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 413		; 0000019dH
	jmp	$eva_err$70513
$L70712:

; 414  : 		DYNBUF_ADD_STR(html, "<tr><td colspan=3>");

	push	0
	push	0
	push	18					; 00000012H
	push	OFFSET FLAT:$SG70717
	mov	edx, DWORD PTR _html$[ebp]
	push	edx
	call	_dynbuf_add
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L70716
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29872], OFFSET FLAT:$SG70719
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 414		; 0000019eH
	jmp	$eva_err$70513
$L70716:

; 415  : 		if(put_html_tree(cntxt, tr, child_path, &id_child, i == children.nbrows - 1, status))

	mov	edx, DWORD PTR _status$[ebp]
	push	edx
	mov	eax, DWORD PTR _children$[ebp]
	sub	eax, 1
	xor	ecx, ecx
	cmp	DWORD PTR _i$[ebp], eax
	sete	cl
	push	ecx
	lea	edx, DWORD PTR _id_child$[ebp]
	push	edx
	mov	eax, DWORD PTR _child_path$[ebp]
	push	eax
	mov	ecx, DWORD PTR _tr$[ebp]
	push	ecx
	mov	edx, DWORD PTR _cntxt$[ebp]
	push	edx
	call	_put_html_tree
	add	esp, 24					; 00000018H
	test	eax, eax
	je	SHORT $L70720

; 416  : 			STACK_ERROR;

	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 416		; 000001a0H
	jmp	$eva_err$70513
$L70720:

; 417  : 		DYNBUF_ADD_STR(html, "</td>\n</tr>");

	push	0
	push	0
	push	11					; 0000000bH
	push	OFFSET FLAT:$SG70723
	mov	ecx, DWORD PTR _html$[ebp]
	push	ecx
	call	_dynbuf_add
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L70722
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29872], OFFSET FLAT:$SG70725
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 417		; 000001a1H
	jmp	$eva_err$70513
$L70722:

; 418  : 	}

	jmp	$L70710
$L70711:

; 419  : 
; 420  : 	/* Put table footer */
; 421  : 	if(!b_hide) DYNBUF_ADD_STR(html, "</table></td>\n</tr>");

	cmp	DWORD PTR _b_hide$[ebp], 0
	jne	SHORT $L70728
	push	0
	push	0
	push	19					; 00000013H
	push	OFFSET FLAT:$SG70729
	mov	ecx, DWORD PTR _html$[ebp]
	push	ecx
	call	_dynbuf_add
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L70728
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29872], OFFSET FLAT:$SG70731
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 421		; 000001a5H
	jmp	SHORT $eva_err$70513
$L70728:

; 422  : 	DYNBUF_ADD_STR(html, "</table>");

	push	0
	push	0
	push	8
	push	OFFSET FLAT:$SG70734
	mov	ecx, DWORD PTR _html$[ebp]
	push	ecx
	call	_dynbuf_add
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L70733
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29872], OFFSET FLAT:$SG70736
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 422		; 000001a6H
	jmp	SHORT $eva_err$70513
$L70733:
$eva_noerr$70524:

; 423  : 
; 424  : 	RETURN_OK_CLEANUP;

	push	0
	push	OFFSET FLAT:$SG70737
	push	OFFSET FLAT:$SG70738
	mov	ecx, DWORD PTR _cntxt$[ebp]
	push	ecx
	call	_err_clear
	add	esp, 16					; 00000010H
$eva_err$70513:
	mov	edx, DWORD PTR _cntxt$[ebp]
	cmp	DWORD PTR [edx+29872], 0
	je	SHORT $L70739
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	ecx, DWORD PTR [eax+29900]
	push	ecx
	push	OFFSET FLAT:$SG70740
	push	OFFSET FLAT:$SG70741
	mov	edx, DWORD PTR _cntxt$[ebp]
	push	edx
	call	_err_add_context
	add	esp, 16					; 00000010H
$L70739:
	lea	eax, DWORD PTR _data$[ebp]
	push	eax
	call	_dyntab_free
	add	esp, 4
	lea	ecx, DWORD PTR _objdata$[ebp]
	push	ecx
	call	_dyntab_free
	add	esp, 4
	lea	edx, DWORD PTR _children$[ebp]
	push	edx
	call	_dyntab_free
	add	esp, 4
	lea	eax, DWORD PTR _id_child$[ebp]
	push	eax
	call	_dyntab_free
	add	esp, 4
	mov	ecx, DWORD PTR _subfield$[ebp]
	push	ecx
	call	_mem_free
	add	esp, 4
	mov	DWORD PTR _subfield$[ebp], 0
	mov	edx, DWORD PTR _child_path$[ebp]
	push	edx
	call	_mem_free
	add	esp, 4
	mov	DWORD PTR _child_path$[ebp], 0
	mov	eax, DWORD PTR _name$[ebp]
	push	eax
	call	_mem_free
	add	esp, 4
	mov	DWORD PTR _name$[ebp], 0
	mov	ecx, DWORD PTR _cntxt$[ebp]
	xor	eax, eax
	cmp	DWORD PTR [ecx+29872], 0
	setne	al
$L70486:

; 425  : }

	pop	esi
	mov	esp, ebp
	pop	ebp
	ret	0
_put_html_tree ENDP
_TEXT	ENDS
PUBLIC	_ctrl_add_reltree
EXTRN	_log10:NEAR
EXTRN	_cgi_build_basename:NEAR
EXTRN	_cgi_get_values:NEAR
EXTRN	_cgi_value_setkeep:NEAR
EXTRN	__ftol:NEAR
EXTRN	__fltused:NEAR
EXTRN	_atoi:NEAR
EXTRN	_ctrl_format_pos:NEAR
EXTRN	_strcmp:NEAR
EXTRN	_dyntab_from_tab:NEAR
EXTRN	_strchr:NEAR
EXTRN	_dyntab_from_list:NEAR
EXTRN	_dyntab_filter_field:NEAR
EXTRN	_dyntab_field_val:NEAR
EXTRN	_dyntab_field_cell:NEAR
EXTRN	_dyntab_order_lines:NEAR
_BSS	SEGMENT
	ALIGN	4

$SG70774 DB	01H DUP (?)
	ALIGN	4

$SG70876 DB	01H DUP (?)
	ALIGN	4

$SG70929 DB	01H DUP (?)
_BSS	ENDS
_DATA	SEGMENT
	ORG $+2
$SG70773 DB	'_EVA_STARTOBJ', 00H
	ORG $+2
$SG70776 DB	'_EVA_LEVEL1', 00H
$SG70779 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70784 DB	'_EVA_LISTOBJ', 00H
	ORG $+3
$SG70786 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70790 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70794 DB	'_EVA_REL_LABEL', 00H
	ORG $+1
$SG70796 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70799 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70802 DB	'_EVA_RELFIELDS', 00H
	ORG $+1
$SG70804 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70807 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70810 DB	'_EVA_EXCLUDE', 00H
	ORG $+3
$SG70812 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70815 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70818 DB	'_EVA_REL_COLOR', 00H
	ORG $+1
$SG70820 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70823 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70826 DB	'_EVA_MASK_INIT', 00H
	ORG $+1
$SG70828 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70831 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70833 DB	'_EVA_MAX_OBJ', 00H
	ORG $+3
$SG70836 DB	'_EVA_NOTES_EXPR', 00H
$SG70841 DB	'_EVA_REL_REVERSE', 00H
	ORG $+3
$SG70847 DB	',', 00H
	ORG $+2
$SG70849 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70855 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70861 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70888 DB	'TREEOPEN=', 00H
	ORG $+2
$SG70892 DB	'TREEOPENALL=', 00H
	ORG $+3
$SG70900 DB	'MOVETO=', 00H
$SG70901 DB	'ADDTO=', 00H
	ORG $+1
$SG70913 DB	'SELECT Pkey, IdField, Num FROM TLink WHERE DateDel IS NU'
	DB	'LL AND IdObj=%d AND IdRelObj=%d', 00H
$SG70917 DB	'INSERT TLink SET IdObj=%d, IdRelObj=%d, IdField=%s, Num='
	DB	'%s DateCr=%s, IdWhoCr=%s', 00H
	ORG $+3
$SG70920 DB	'MOVETO=', 00H
$SG70923 DB	'UPDATE TLink SET DateDel=''%s'',IdWhoDel=%s WHERE Pkey=%'
	DB	's', 00H
$SG70928 DB	'_EVA_SHOW_LEVELS', 00H
	ORG $+3
$SG70932 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70940 DB	')</b></p>', 00H
	ORG $+2
$SG70941 DB	'<p><b>*** Affichage incomplet (max=', 00H
$SG70943 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70949 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70955 DB	'D:\Travail\ABI\EVA\V4.0\CGI\Brunix-2016\ctrl_tree.c', 00H
$SG70956 DB	'ctrl_add_reltree', 00H
	ORG $+3
$SG70958 DB	'D:\Travail\ABI\EVA\V4.0\CGI\Brunix-2016\ctrl_tree.c', 00H
$SG70959 DB	'ctrl_add_reltree', 00H
_DATA	ENDS
_TEXT	SEGMENT
_cntxt$ = 8
_i_ctrl$ = 12
_form$ = -8
_ctrl$ = -264
__tr$ = -212
_tr$ = -240
_cgival$ = -236
_srcrec$ = -260
_idobj$ = -52
_id_child$ = -32
_buf$ = -12
_c$ = -56
_txt$ = -60
_i$ = -216
_node$ = -4
__i$70863 = -268
_p$70870 = -272
_s$70871 = -276
_btn$70875 = -288
_path$70877 = -280
_sz_path$70878 = -284
_status$70879 = -292
_iddest$70902 = -296
_sql$70907 = -552
_idrelobj$70908 = -560
_idobjint$70909 = -556
_val$70921 = -564
_nb$70927 = -568
_ctrl_add_reltree PROC NEAR

; 446  : ){

	push	ebp
	mov	ebp, esp
	sub	esp, 608				; 00000260H
	push	esi
	push	edi

; 447  : 	EVA_form *form = cntxt->form;

	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	ecx, DWORD PTR [eax+80]
	mov	DWORD PTR _form$[ebp], ecx

; 448  : 	EVA_ctrl *ctrl = form->ctrl + i_ctrl;

	mov	edx, DWORD PTR _i_ctrl$[ebp]
	imul	edx, 480				; 000001e0H
	mov	eax, DWORD PTR _form$[ebp]
	mov	ecx, DWORD PTR [eax]
	add	ecx, edx
	mov	DWORD PTR _ctrl$[ebp], ecx

; 449  : 	TreeDef _tr = {0}, *tr = &_tr;

	mov	DWORD PTR __tr$[ebp], 0
	mov	ecx, 37					; 00000025H
	xor	eax, eax
	lea	edi, DWORD PTR __tr$[ebp+4]
	rep stosd
	lea	edx, DWORD PTR __tr$[ebp]
	mov	DWORD PTR _tr$[ebp], edx

; 450  : 	DynTable cgival = { 0 };

	mov	DWORD PTR _cgival$[ebp], 0
	xor	eax, eax
	mov	DWORD PTR _cgival$[ebp+4], eax
	mov	DWORD PTR _cgival$[ebp+8], eax
	mov	DWORD PTR _cgival$[ebp+12], eax
	mov	DWORD PTR _cgival$[ebp+16], eax

; 451  : 	DynTable srcrec = { 0 };

	mov	DWORD PTR _srcrec$[ebp], 0
	xor	ecx, ecx
	mov	DWORD PTR _srcrec$[ebp+4], ecx
	mov	DWORD PTR _srcrec$[ebp+8], ecx
	mov	DWORD PTR _srcrec$[ebp+12], ecx
	mov	DWORD PTR _srcrec$[ebp+16], ecx

; 452  : 	DynTable idobj = { 0 };

	mov	DWORD PTR _idobj$[ebp], 0
	xor	edx, edx
	mov	DWORD PTR _idobj$[ebp+4], edx
	mov	DWORD PTR _idobj$[ebp+8], edx
	mov	DWORD PTR _idobj$[ebp+12], edx
	mov	DWORD PTR _idobj$[ebp+16], edx

; 453  : 	DynTable id_child = { 0 };

	mov	DWORD PTR _id_child$[ebp], 0
	xor	eax, eax
	mov	DWORD PTR _id_child$[ebp+4], eax
	mov	DWORD PTR _id_child$[ebp+8], eax
	mov	DWORD PTR _id_child$[ebp+12], eax
	mov	DWORD PTR _id_child$[ebp+16], eax

; 454  :   	DynBuffer *buf = NULL;

	mov	DWORD PTR _buf$[ebp], 0

; 455  : 	DynTableCell *c;
; 456  : 	char *txt;
; 457  : 	unsigned long i, node;
; 458  : 
; 459  : 	switch(form->step)
; 460  : 	{

	mov	ecx, DWORD PTR _form$[ebp]
	mov	edx, DWORD PTR [ecx+176]
	mov	DWORD PTR -572+[ebp], edx
	cmp	DWORD PTR -572+[ebp], 7
	ja	$L70953
	mov	eax, DWORD PTR -572+[ebp]
	jmp	DWORD PTR $L71031[eax*4]
$L70768:

; 461  : 	case CtrlRead:
; 462  : 		if(cgi_build_basename(cntxt, &ctrl->cginame, i_ctrl, 'D')) STACK_ERROR;

	push	68					; 00000044H
	mov	ecx, DWORD PTR _i_ctrl$[ebp]
	push	ecx
	mov	edx, DWORD PTR _ctrl$[ebp]
	add	edx, 40					; 00000028H
	push	edx
	mov	eax, DWORD PTR _cntxt$[ebp]
	push	eax
	call	_cgi_build_basename
	add	esp, 16					; 00000010H
	test	eax, eax
	je	SHORT $L70769
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 462		; 000001ceH
	jmp	$eva_err$70770
$L70769:

; 463  : 		break;

	jmp	$eva_noerr$70954
$L70771:

; 464  : 	case HtmlView:
; 465  : 	case HtmlPrint:
; 466  : 	case HtmlEdit:
; 467  : 		if(!form->html) break;

	mov	edx, DWORD PTR _form$[ebp]
	cmp	DWORD PTR [edx+232], 0
	jne	SHORT $L70772
	jmp	$eva_noerr$70954
$L70772:

; 468  : 
; 469  : 		/* Read tree base objects */
; 470  : 		txt = CTRL_ATTR_VAL(STARTOBJ);

	cmp	DWORD PTR _ctrl$[ebp], 0
	je	SHORT $L71012
	push	0
	push	-1
	push	OFFSET FLAT:$SG70773
	mov	eax, DWORD PTR _ctrl$[ebp]
	add	eax, 44					; 0000002cH
	push	eax
	call	_dyntab_field_val
	add	esp, 16					; 00000010H
	mov	DWORD PTR -576+[ebp], eax
	jmp	SHORT $L71013
$L71012:
	mov	DWORD PTR -576+[ebp], OFFSET FLAT:$SG70774
$L71013:
	mov	ecx, DWORD PTR -576+[ebp]
	mov	DWORD PTR _txt$[ebp], ecx

; 471  : 		if(!strcmp(txt, "_EVA_LEVEL1"))

	push	OFFSET FLAT:$SG70776
	mov	edx, DWORD PTR _txt$[ebp]
	push	edx
	call	_strcmp
	add	esp, 8
	test	eax, eax
	jne	SHORT $L70775

; 473  : 			tr->b_level1 = 1;

	mov	eax, DWORD PTR _tr$[ebp]
	mov	DWORD PTR [eax+124], 1

; 474  : 			DYNTAB_SET_CELL(&idobj, 0, 0, &form->id_obj, 0, 0);

	push	0
	push	0
	push	0
	mov	ecx, DWORD PTR _form$[ebp]
	add	ecx, 32					; 00000020H
	push	ecx
	call	_dyntab_cell
	add	esp, 12					; 0000000cH
	push	eax
	push	0
	push	0
	lea	edx, DWORD PTR _idobj$[ebp]
	push	edx
	call	_dyntab_copy
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L70777
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29872], OFFSET FLAT:$SG70779
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 474		; 000001daH
	jmp	$eva_err$70770
$L70777:

; 476  : 		else if(*txt)

	jmp	$L70788
$L70775:
	mov	edx, DWORD PTR _txt$[ebp]
	movsx	eax, BYTE PTR [edx]
	test	eax, eax
	je	SHORT $L70781

; 477  : 			CTRL_ATTR(idobj, LISTOBJ)

	lea	ecx, DWORD PTR _idobj$[ebp]
	push	ecx
	call	_dyntab_free
	add	esp, 4
	push	0
	push	-1
	push	OFFSET FLAT:$SG70784
	mov	edx, DWORD PTR _ctrl$[ebp]
	add	edx, 44					; 0000002cH
	push	edx
	push	0
	lea	eax, DWORD PTR _idobj$[ebp]
	push	eax
	call	_dyntab_filter_field
	add	esp, 24					; 00000018H
	test	eax, eax
	je	SHORT $L70783
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29872], OFFSET FLAT:$SG70786
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 477		; 000001ddH
	jmp	$eva_err$70770
$L70783:

; 478  : 		else

	jmp	SHORT $L70788
$L70781:

; 479  : 			DYNTAB_SET_CELL(&idobj, 0, 0, &form->id_obj, 0, 0);

	push	0
	push	0
	push	0
	mov	eax, DWORD PTR _form$[ebp]
	add	eax, 32					; 00000020H
	push	eax
	call	_dyntab_cell
	add	esp, 12					; 0000000cH
	push	eax
	push	0
	push	0
	lea	ecx, DWORD PTR _idobj$[ebp]
	push	ecx
	call	_dyntab_copy
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L70788
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29872], OFFSET FLAT:$SG70790
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 479		; 000001dfH
	jmp	$eva_err$70770
$L70788:

; 480  : 		if(!idobj.nbrows) break;

	cmp	DWORD PTR _idobj$[ebp], 0
	jne	SHORT $L70791
	jmp	$eva_noerr$70954
$L70791:

; 481  : 
; 482  : 		/* Read control attributes */
; 483  : 		tr->i_ctrl = i_ctrl;

	mov	ecx, DWORD PTR _tr$[ebp]
	mov	edx, DWORD PTR _i_ctrl$[ebp]
	mov	DWORD PTR [ecx], edx

; 484  : 		CTRL_ATTR_TAB(tr->rellabel, REL_LABEL);

	mov	eax, DWORD PTR _tr$[ebp]
	add	eax, 32					; 00000020H
	push	eax
	call	_dyntab_free
	add	esp, 4
	push	0
	push	-1
	push	OFFSET FLAT:$SG70794
	mov	ecx, DWORD PTR _ctrl$[ebp]
	add	ecx, 44					; 0000002cH
	push	ecx
	push	0
	mov	edx, DWORD PTR _tr$[ebp]
	add	edx, 32					; 00000020H
	push	edx
	call	_dyntab_filter_field
	add	esp, 24					; 00000018H
	test	eax, eax
	je	SHORT $L70793
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29872], OFFSET FLAT:$SG70796
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 484		; 000001e4H
	jmp	$eva_err$70770
$L70793:
	mov	edx, DWORD PTR _tr$[ebp]
	add	edx, 32					; 00000020H
	push	edx
	call	_dyntab_order_lines
	add	esp, 4
	test	eax, eax
	je	SHORT $L70797
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29872], OFFSET FLAT:$SG70799
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 484		; 000001e4H
	jmp	$eva_err$70770
$L70797:

; 485  : 		CTRL_ATTR_TAB(tr->relfields, RELFIELDS);

	mov	edx, DWORD PTR _tr$[ebp]
	add	edx, 12					; 0000000cH
	push	edx
	call	_dyntab_free
	add	esp, 4
	push	0
	push	-1
	push	OFFSET FLAT:$SG70802
	mov	eax, DWORD PTR _ctrl$[ebp]
	add	eax, 44					; 0000002cH
	push	eax
	push	0
	mov	ecx, DWORD PTR _tr$[ebp]
	add	ecx, 12					; 0000000cH
	push	ecx
	call	_dyntab_filter_field
	add	esp, 24					; 00000018H
	test	eax, eax
	je	SHORT $L70801
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29872], OFFSET FLAT:$SG70804
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 485		; 000001e5H
	jmp	$eva_err$70770
$L70801:
	mov	ecx, DWORD PTR _tr$[ebp]
	add	ecx, 12					; 0000000cH
	push	ecx
	call	_dyntab_order_lines
	add	esp, 4
	test	eax, eax
	je	SHORT $L70805
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29872], OFFSET FLAT:$SG70807
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 485		; 000001e5H
	jmp	$eva_err$70770
$L70805:

; 486  : 		CTRL_ATTR_TAB(tr->exclude, EXCLUDE);

	mov	ecx, DWORD PTR _tr$[ebp]
	add	ecx, 72					; 00000048H
	push	ecx
	call	_dyntab_free
	add	esp, 4
	push	0
	push	-1
	push	OFFSET FLAT:$SG70810
	mov	edx, DWORD PTR _ctrl$[ebp]
	add	edx, 44					; 0000002cH
	push	edx
	push	0
	mov	eax, DWORD PTR _tr$[ebp]
	add	eax, 72					; 00000048H
	push	eax
	call	_dyntab_filter_field
	add	esp, 24					; 00000018H
	test	eax, eax
	je	SHORT $L70809
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29872], OFFSET FLAT:$SG70812
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 486		; 000001e6H
	jmp	$eva_err$70770
$L70809:
	mov	eax, DWORD PTR _tr$[ebp]
	add	eax, 72					; 00000048H
	push	eax
	call	_dyntab_order_lines
	add	esp, 4
	test	eax, eax
	je	SHORT $L70813
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29872], OFFSET FLAT:$SG70815
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 486		; 000001e6H
	jmp	$eva_err$70770
$L70813:

; 487  : 		CTRL_ATTR_TAB(tr->relcolor, REL_COLOR);

	mov	eax, DWORD PTR _tr$[ebp]
	add	eax, 52					; 00000034H
	push	eax
	call	_dyntab_free
	add	esp, 4
	push	0
	push	-1
	push	OFFSET FLAT:$SG70818
	mov	ecx, DWORD PTR _ctrl$[ebp]
	add	ecx, 44					; 0000002cH
	push	ecx
	push	0
	mov	edx, DWORD PTR _tr$[ebp]
	add	edx, 52					; 00000034H
	push	edx
	call	_dyntab_filter_field
	add	esp, 24					; 00000018H
	test	eax, eax
	je	SHORT $L70817
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29872], OFFSET FLAT:$SG70820
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 487		; 000001e7H
	jmp	$eva_err$70770
$L70817:
	mov	edx, DWORD PTR _tr$[ebp]
	add	edx, 52					; 00000034H
	push	edx
	call	_dyntab_order_lines
	add	esp, 4
	test	eax, eax
	je	SHORT $L70821
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29872], OFFSET FLAT:$SG70823
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 487		; 000001e7H
	jmp	$eva_err$70770
$L70821:

; 488  : 		CTRL_ATTR_TAB(tr->relmask, MASK_INIT);

	mov	edx, DWORD PTR _tr$[ebp]
	add	edx, 92					; 0000005cH
	push	edx
	call	_dyntab_free
	add	esp, 4
	push	0
	push	-1
	push	OFFSET FLAT:$SG70826
	mov	eax, DWORD PTR _ctrl$[ebp]
	add	eax, 44					; 0000002cH
	push	eax
	push	0
	mov	ecx, DWORD PTR _tr$[ebp]
	add	ecx, 92					; 0000005cH
	push	ecx
	call	_dyntab_filter_field
	add	esp, 24					; 00000018H
	test	eax, eax
	je	SHORT $L70825
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29872], OFFSET FLAT:$SG70828
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 488		; 000001e8H
	jmp	$eva_err$70770
$L70825:
	mov	ecx, DWORD PTR _tr$[ebp]
	add	ecx, 92					; 0000005cH
	push	ecx
	call	_dyntab_order_lines
	add	esp, 4
	test	eax, eax
	je	SHORT $L70829
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29872], OFFSET FLAT:$SG70831
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 488		; 000001e8H
	jmp	$eva_err$70770
$L70829:

; 489  : 		c = CTRL_ATTR_CELL(MAX_OBJ);

	cmp	DWORD PTR _ctrl$[ebp], 0
	je	SHORT $L71014
	push	0
	push	-1
	push	OFFSET FLAT:$SG70833
	mov	ecx, DWORD PTR _ctrl$[ebp]
	add	ecx, 44					; 0000002cH
	push	ecx
	call	_dyntab_field_cell
	add	esp, 16					; 00000010H
	mov	DWORD PTR -580+[ebp], eax
	jmp	SHORT $L71015
$L71014:
	mov	DWORD PTR -580+[ebp], 0
$L71015:
	mov	edx, DWORD PTR -580+[ebp]
	mov	DWORD PTR _c$[ebp], edx

; 490  : 		tr->maxobj = c ? strtoul(c->txt, NULL, 10) : 1000;

	cmp	DWORD PTR _c$[ebp], 0
	je	SHORT $L71016
	push	10					; 0000000aH
	push	0
	mov	eax, DWORD PTR _c$[ebp]
	mov	ecx, DWORD PTR [eax]
	push	ecx
	call	_strtoul
	add	esp, 12					; 0000000cH
	mov	DWORD PTR -584+[ebp], eax
	jmp	SHORT $L71017
$L71016:
	mov	DWORD PTR -584+[ebp], 1000		; 000003e8H
$L71017:
	mov	edx, DWORD PTR _tr$[ebp]
	mov	eax, DWORD PTR -584+[ebp]
	mov	DWORD PTR [edx+8], eax

; 491  : 		c = CTRL_ATTR_CELL(NOTES_EXPR);

	cmp	DWORD PTR _ctrl$[ebp], 0
	je	SHORT $L71018
	push	0
	push	-1
	push	OFFSET FLAT:$SG70836
	mov	ecx, DWORD PTR _ctrl$[ebp]
	add	ecx, 44					; 0000002cH
	push	ecx
	call	_dyntab_field_cell
	add	esp, 16					; 00000010H
	mov	DWORD PTR -588+[ebp], eax
	jmp	SHORT $L71019
$L71018:
	mov	DWORD PTR -588+[ebp], 0
$L71019:
	mov	edx, DWORD PTR -588+[ebp]
	mov	DWORD PTR _c$[ebp], edx

; 492  : 		if(c) { tr->notesexpr = c->txt; tr->notesexpr_sz = c->len; }

	cmp	DWORD PTR _c$[ebp], 0
	je	SHORT $L70837
	mov	eax, DWORD PTR _tr$[ebp]
	mov	ecx, DWORD PTR _c$[ebp]
	mov	edx, DWORD PTR [ecx]
	mov	DWORD PTR [eax+116], edx
	mov	eax, DWORD PTR _tr$[ebp]
	mov	ecx, DWORD PTR _c$[ebp]
	mov	edx, DWORD PTR [ecx+4]
	mov	DWORD PTR [eax+120], edx
$L70837:

; 493  : 		tr->nbrel = tr->relfields.nbrows;

	mov	eax, DWORD PTR _tr$[ebp]
	mov	ecx, DWORD PTR _tr$[ebp]
	mov	edx, DWORD PTR [ecx+12]
	mov	DWORD PTR [eax+4], edx

; 494  : 		if(tr->nbrel < tr->exclude.nbrows) tr->nbrel = tr->exclude.nbrows;

	mov	eax, DWORD PTR _tr$[ebp]
	mov	ecx, DWORD PTR _tr$[ebp]
	mov	edx, DWORD PTR [eax+4]
	cmp	edx, DWORD PTR [ecx+72]
	jae	SHORT $L70838
	mov	eax, DWORD PTR _tr$[ebp]
	mov	ecx, DWORD PTR _tr$[ebp]
	mov	edx, DWORD PTR [ecx+72]
	mov	DWORD PTR [eax+4], edx
$L70838:

; 495  : 		if(tr->nbrel < tr->rellabel.nbrows) tr->nbrel = tr->rellabel.nbrows;

	mov	eax, DWORD PTR _tr$[ebp]
	mov	ecx, DWORD PTR _tr$[ebp]
	mov	edx, DWORD PTR [eax+4]
	cmp	edx, DWORD PTR [ecx+32]
	jae	SHORT $L70839
	mov	eax, DWORD PTR _tr$[ebp]
	mov	ecx, DWORD PTR _tr$[ebp]
	mov	edx, DWORD PTR [ecx+32]
	mov	DWORD PTR [eax+4], edx
$L70839:

; 496  : 		tr->b_reverse = CTRL_ATTR_CELL(REL_REVERSE) != 0;

	cmp	DWORD PTR _ctrl$[ebp], 0
	je	SHORT $L71020
	push	0
	push	-1
	push	OFFSET FLAT:$SG70841
	mov	eax, DWORD PTR _ctrl$[ebp]
	add	eax, 44					; 0000002cH
	push	eax
	call	_dyntab_field_cell
	add	esp, 16					; 00000010H
	mov	DWORD PTR -592+[ebp], eax
	jmp	SHORT $L71021
$L71020:
	mov	DWORD PTR -592+[ebp], 0
$L71021:
	xor	ecx, ecx
	cmp	DWORD PTR -592+[ebp], 0
	setne	cl
	mov	edx, DWORD PTR _tr$[ebp]
	mov	DWORD PTR [edx+112], ecx

; 497  : 
; 498  : 		/* Build list of relations Ids */
; 499  : 		for(i = 0; i < tr->nbrel; i++) if(dyntab_sz(&tr->relfields, i, 0))

	mov	DWORD PTR _i$[ebp], 0
	jmp	SHORT $L70842
$L70843:
	mov	eax, DWORD PTR _i$[ebp]
	add	eax, 1
	mov	DWORD PTR _i$[ebp], eax
$L70842:
	mov	ecx, DWORD PTR _tr$[ebp]
	mov	edx, DWORD PTR _i$[ebp]
	cmp	edx, DWORD PTR [ecx+4]
	jae	$L70844
	push	0
	mov	eax, DWORD PTR _i$[ebp]
	push	eax
	mov	ecx, DWORD PTR _tr$[ebp]
	add	ecx, 12					; 0000000cH
	push	ecx
	call	_dyntab_sz
	add	esp, 12					; 0000000cH
	test	eax, eax
	je	$L70859

; 501  : 			M_FREE(buf);

	mov	edx, DWORD PTR _buf$[ebp]
	push	edx
	call	_mem_free
	add	esp, 4
	mov	DWORD PTR _buf$[ebp], 0

; 502  : 			DYNTAB_FREE(cgival);

	lea	eax, DWORD PTR _cgival$[ebp]
	push	eax
	call	_dyntab_free
	add	esp, 4

; 503  : 			if(dyntab_from_list(&cgival, DYNTAB_VAL_SZ(&tr->relfields, i, 0), ",",  0, 2)) RETURN_ERR_MEMORY;

	push	2
	push	0
	push	OFFSET FLAT:$SG70847
	push	0
	mov	ecx, DWORD PTR _i$[ebp]
	push	ecx
	mov	edx, DWORD PTR _tr$[ebp]
	add	edx, 12					; 0000000cH
	push	edx
	call	_dyntab_sz
	add	esp, 12					; 0000000cH
	push	eax
	push	0
	mov	eax, DWORD PTR _i$[ebp]
	push	eax
	mov	ecx, DWORD PTR _tr$[ebp]
	add	ecx, 12					; 0000000cH
	push	ecx
	call	_dyntab_val
	add	esp, 12					; 0000000cH
	push	eax
	lea	edx, DWORD PTR _cgival$[ebp]
	push	edx
	call	_dyntab_from_list
	add	esp, 24					; 00000018H
	test	eax, eax
	je	SHORT $L70846
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29872], OFFSET FLAT:$SG70849
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 503		; 000001f7H
	jmp	$eva_err$70770
$L70846:

; 504  : 			if(qry_values_list(cntxt, &cgival, 3, &buf)) STACK_ERROR;

	lea	edx, DWORD PTR _buf$[ebp]
	push	edx
	push	3
	lea	eax, DWORD PTR _cgival$[ebp]
	push	eax
	mov	ecx, DWORD PTR _cntxt$[ebp]
	push	ecx
	call	_qry_values_list
	add	esp, 16					; 00000010H
	test	eax, eax
	je	SHORT $L70850
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 504		; 000001f8H
	jmp	$eva_err$70770
$L70850:

; 505  : 			DYNTAB_ADD_BUF(&tr->relfields, i, 1, buf);

	cmp	DWORD PTR _buf$[ebp], 0
	je	SHORT $L70851
	mov	eax, DWORD PTR _buf$[ebp]
	cmp	DWORD PTR [eax+4], 0
	je	SHORT $L70851
	push	0
	push	0
	mov	ecx, DWORD PTR _buf$[ebp]
	mov	edx, DWORD PTR [ecx+4]
	push	edx
	mov	eax, DWORD PTR _buf$[ebp]
	add	eax, 8
	push	eax
	push	1
	mov	ecx, DWORD PTR _i$[ebp]
	push	ecx
	mov	edx, DWORD PTR _tr$[ebp]
	add	edx, 12					; 0000000cH
	push	edx
	call	_dyntab_add
	add	esp, 28					; 0000001cH
	test	eax, eax
	je	SHORT $L70853
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29872], OFFSET FLAT:$SG70855
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 505		; 000001f9H
	jmp	$eva_err$70770
$L70853:
	jmp	SHORT $L70859
$L70851:
	push	0
	push	0
	push	0
	push	0
	push	1
	mov	edx, DWORD PTR _i$[ebp]
	push	edx
	mov	eax, DWORD PTR _tr$[ebp]
	add	eax, 12					; 0000000cH
	push	eax
	call	_dyntab_add
	add	esp, 28					; 0000001cH
	test	eax, eax
	je	SHORT $L70859
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29872], OFFSET FLAT:$SG70861
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 505		; 000001f9H
	jmp	$eva_err$70770
$L70859:

; 507  : 
; 508  : 		/* Read nodes status in CGI data */
; 509  : 		if(cgi_get_values(cntxt, &tr->treenodes, ctrl->cginame->data, 4)) STACK_ERROR;

	jmp	$L70843
$L70844:
	push	4
	mov	eax, DWORD PTR _ctrl$[ebp]
	mov	ecx, DWORD PTR [eax+40]
	add	ecx, 8
	push	ecx
	mov	edx, DWORD PTR _tr$[ebp]
	add	edx, 132				; 00000084H
	push	edx
	mov	eax, DWORD PTR _cntxt$[ebp]
	push	eax
	call	_cgi_get_values
	add	esp, 16					; 00000010H
	test	eax, eax
	je	SHORT $L70862
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 509		; 000001fdH
	jmp	$eva_err$70770
$L70862:

; 510  : 		tr->b_maxobj = tr->treenodes.nbrows > tr->maxobj;

	mov	edx, DWORD PTR _tr$[ebp]
	mov	eax, DWORD PTR _tr$[ebp]
	mov	ecx, DWORD PTR [edx+132]
	cmp	DWORD PTR [eax+8], ecx
	sbb	edx, edx
	neg	edx
	mov	eax, DWORD PTR _tr$[ebp]
	mov	DWORD PTR [eax+128], edx

; 511  : 		CGI_VALUES_DONTKEEP(&tr->treenodes);

	mov	DWORD PTR __i$70863[ebp], 0
	jmp	SHORT $L70864
$L70865:
	mov	ecx, DWORD PTR __i$70863[ebp]
	add	ecx, 1
	mov	DWORD PTR __i$70863[ebp], ecx
$L70864:
	mov	edx, DWORD PTR _tr$[ebp]
	mov	eax, DWORD PTR __i$70863[ebp]
	cmp	eax, DWORD PTR [edx+132]
	jae	SHORT $L70866
	push	1
	mov	ecx, DWORD PTR __i$70863[ebp]
	push	ecx
	mov	edx, DWORD PTR _tr$[ebp]
	add	edx, 132				; 00000084H
	push	edx
	mov	eax, DWORD PTR _cntxt$[ebp]
	push	eax
	call	_cgi_value_setkeep
	add	esp, 16					; 00000010H
	jmp	SHORT $L70865
$L70866:

; 512  : 		for(i = 0; i < tr->treenodes.nbrows; i++)

	mov	DWORD PTR _i$[ebp], 0
	jmp	SHORT $L70867
$L70868:
	mov	ecx, DWORD PTR _i$[ebp]
	add	ecx, 1
	mov	DWORD PTR _i$[ebp], ecx
$L70867:
	mov	edx, DWORD PTR _tr$[ebp]
	mov	eax, DWORD PTR _i$[ebp]
	cmp	eax, DWORD PTR [edx+132]
	jae	$L70869

; 514  : 			DynTableCell *p = dyntab_cell(&tr->treenodes, i, 0);

	push	0
	mov	ecx, DWORD PTR _i$[ebp]
	push	ecx
	mov	edx, DWORD PTR _tr$[ebp]
	add	edx, 132				; 00000084H
	push	edx
	call	_dyntab_cell
	add	esp, 12					; 0000000cH
	mov	DWORD PTR _p$70870[ebp], eax

; 515  : 			char *s = strchr(p->txt, '§');

	push	-89					; ffffffa7H
	mov	eax, DWORD PTR _p$70870[ebp]
	mov	ecx, DWORD PTR [eax]
	push	ecx
	call	_strchr
	add	esp, 8
	mov	DWORD PTR _s$70871[ebp], eax

; 516  : 			if(!s) continue;

	cmp	DWORD PTR _s$70871[ebp], 0
	jne	SHORT $L70872
	jmp	SHORT $L70868
$L70872:

; 517  : 			*s = 0;

	mov	edx, DWORD PTR _s$70871[ebp]
	mov	BYTE PTR [edx], 0

; 518  : 			p->len = s - p->txt;

	mov	eax, DWORD PTR _p$70870[ebp]
	mov	ecx, DWORD PTR _s$70871[ebp]
	sub	ecx, DWORD PTR [eax]
	mov	edx, DWORD PTR _p$70870[ebp]
	mov	DWORD PTR [edx+4], ecx

; 519  : 			p->ctype = strtoul(s + 1, NULL, 10);

	push	10					; 0000000aH
	push	0
	mov	eax, DWORD PTR _s$70871[ebp]
	add	eax, 1
	push	eax
	call	_strtoul
	add	esp, 12					; 0000000cH
	mov	ecx, DWORD PTR _p$70870[ebp]
	mov	DWORD PTR [ecx+52], eax

; 520  : 		}

	jmp	$L70868
$L70869:

; 521  : 
; 522  : 		/* Handle tree buttons click */
; 523  : 		if(form->i_ctrl_clic == i_ctrl)

	mov	edx, DWORD PTR _form$[ebp]
	mov	eax, DWORD PTR [edx+124]
	cmp	eax, DWORD PTR _i_ctrl$[ebp]
	jne	$L70874

; 525  : 			char *btn = CGI_CLICK_BTN_SUBFIELD;

	mov	ecx, DWORD PTR _cntxt$[ebp]
	cmp	DWORD PTR [ecx+29648], 0
	je	SHORT $L71022
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	eax, DWORD PTR [edx+29656]
	imul	eax, 56					; 00000038H
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	edx, DWORD PTR [ecx+29648]
	mov	eax, DWORD PTR [edx+eax]
	movsx	ecx, BYTE PTR [eax]
	cmp	ecx, 66					; 00000042H
	jne	SHORT $L71022
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	eax, DWORD PTR [edx+29656]
	imul	eax, 56					; 00000038H
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	edx, DWORD PTR [ecx+29648]
	cmp	DWORD PTR [edx+eax+32], 0
	je	SHORT $L71022
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	ecx, DWORD PTR [eax+29656]
	imul	ecx, 56					; 00000038H
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	eax, DWORD PTR [edx+29648]
	mov	ecx, DWORD PTR [eax+ecx+32]
	mov	DWORD PTR -596+[ebp], ecx
	jmp	SHORT $L71023
$L71022:
	mov	DWORD PTR -596+[ebp], OFFSET FLAT:$SG70876
$L71023:
	mov	edx, DWORD PTR -596+[ebp]
	mov	DWORD PTR _btn$70875[ebp], edx

; 526  : 			char *path = btn;

	mov	eax, DWORD PTR _btn$70875[ebp]
	mov	DWORD PTR _path$70877[ebp], eax

; 527  : 			size_t sz_path = 0;

	mov	DWORD PTR _sz_path$70878[ebp], 0
$L70881:

; 528  : 			int status;
; 529  : 
; 530  : 			/* Delimit path data in button name */
; 531  : 			while(*path && *path != '=') path++;

	mov	ecx, DWORD PTR _path$70877[ebp]
	movsx	edx, BYTE PTR [ecx]
	test	edx, edx
	je	SHORT $L70882
	mov	eax, DWORD PTR _path$70877[ebp]
	movsx	ecx, BYTE PTR [eax]
	cmp	ecx, 61					; 0000003dH
	je	SHORT $L70882
	mov	edx, DWORD PTR _path$70877[ebp]
	add	edx, 1
	mov	DWORD PTR _path$70877[ebp], edx
	jmp	SHORT $L70881
$L70882:

; 532  : 			if(*path) path++;

	mov	eax, DWORD PTR _path$70877[ebp]
	movsx	ecx, BYTE PTR [eax]
	test	ecx, ecx
	je	SHORT $L70883
	mov	edx, DWORD PTR _path$70877[ebp]
	add	edx, 1
	mov	DWORD PTR _path$70877[ebp], edx
$L70883:

; 533  : 			while(*path && path[sz_path] != '§') sz_path++;

	mov	eax, DWORD PTR _path$70877[ebp]
	movsx	ecx, BYTE PTR [eax]
	test	ecx, ecx
	je	SHORT $L70886
	mov	edx, DWORD PTR _path$70877[ebp]
	add	edx, DWORD PTR _sz_path$70878[ebp]
	movsx	eax, BYTE PTR [edx]
	cmp	eax, -89				; ffffffa7H
	je	SHORT $L70886
	mov	ecx, DWORD PTR _sz_path$70878[ebp]
	add	ecx, 1
	mov	DWORD PTR _sz_path$70878[ebp], ecx
	jmp	SHORT $L70883
$L70886:

; 534  : 
; 535  : 			/* Handle status changes depending on clicked button */
; 536  : 			node = get_node_status(&tr->treenodes, path, sz_path, &status);

	lea	edx, DWORD PTR _status$70879[ebp]
	push	edx
	mov	eax, DWORD PTR _sz_path$70878[ebp]
	push	eax
	mov	ecx, DWORD PTR _path$70877[ebp]
	push	ecx
	mov	edx, DWORD PTR _tr$[ebp]
	add	edx, 132				; 00000084H
	push	edx
	call	_get_node_status
	add	esp, 16					; 00000010H
	mov	DWORD PTR _node$[ebp], eax

; 537  : 			if(!strncmp(btn, add_sz_str("TREEOPEN=")))

	push	9
	push	OFFSET FLAT:$SG70888
	mov	eax, DWORD PTR _btn$70875[ebp]
	push	eax
	call	_strncmp
	add	esp, 12					; 0000000cH
	test	eax, eax
	jne	SHORT $L70887

; 539  : 				/* Tree open / close */
; 540  : 				if(set_node_status(cntxt, &tr->treenodes, path, sz_path, node, ((status & 4) || !status) ? 1 : 0)) STACK_ERROR;

	mov	ecx, DWORD PTR _status$70879[ebp]
	and	ecx, 4
	test	ecx, ecx
	jne	SHORT $L71024
	cmp	DWORD PTR _status$70879[ebp], 0
	je	SHORT $L71024
	mov	DWORD PTR -600+[ebp], 0
	jmp	SHORT $L71025
$L71024:
	mov	DWORD PTR -600+[ebp], 1
$L71025:
	mov	edx, DWORD PTR -600+[ebp]
	push	edx
	mov	eax, DWORD PTR _node$[ebp]
	push	eax
	mov	ecx, DWORD PTR _sz_path$70878[ebp]
	push	ecx
	mov	edx, DWORD PTR _path$70877[ebp]
	push	edx
	mov	eax, DWORD PTR _tr$[ebp]
	add	eax, 132				; 00000084H
	push	eax
	mov	ecx, DWORD PTR _cntxt$[ebp]
	push	ecx
	call	_set_node_status
	add	esp, 24					; 00000018H
	test	eax, eax
	je	SHORT $L70889
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 540		; 0000021cH
	jmp	$eva_err$70770
$L70889:

; 542  : 			else if(!strncmp(btn, add_sz_str("TREEOPENALL=")))

	jmp	$L70906
$L70887:
	push	12					; 0000000cH
	push	OFFSET FLAT:$SG70892
	mov	eax, DWORD PTR _btn$70875[ebp]
	push	eax
	call	_strncmp
	add	esp, 12					; 0000000cH
	test	eax, eax
	jne	$L70891

; 544  : 				/* Open all nodes under clicked node */
; 545  : 				if(ctrl_tree_minmax(cntxt, &tr->treenodes, path, sz_path)) STACK_ERROR;

	mov	ecx, DWORD PTR _sz_path$70878[ebp]
	push	ecx
	mov	edx, DWORD PTR _path$70877[ebp]
	push	edx
	mov	eax, DWORD PTR _tr$[ebp]
	add	eax, 132				; 00000084H
	push	eax
	mov	ecx, DWORD PTR _cntxt$[ebp]
	push	ecx
	call	_ctrl_tree_minmax
	add	esp, 16					; 00000010H
	test	eax, eax
	je	SHORT $L70893
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 545		; 00000221H
	jmp	$eva_err$70770
$L70893:

; 546  : 				if(set_node_status(cntxt, &tr->treenodes, path, sz_path, ~0UL, 1)) STACK_ERROR;

	push	1
	push	-1
	mov	eax, DWORD PTR _sz_path$70878[ebp]
	push	eax
	mov	ecx, DWORD PTR _path$70877[ebp]
	push	ecx
	mov	edx, DWORD PTR _tr$[ebp]
	add	edx, 132				; 00000084H
	push	edx
	mov	eax, DWORD PTR _cntxt$[ebp]
	push	eax
	call	_set_node_status
	add	esp, 24					; 00000018H
	test	eax, eax
	je	SHORT $L70894
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 546		; 00000222H
	jmp	$eva_err$70770
$L70894:

; 547  : 				node = get_node_status(&tr->treenodes, path, sz_path, NULL);

	push	0
	mov	edx, DWORD PTR _sz_path$70878[ebp]
	push	edx
	mov	eax, DWORD PTR _path$70877[ebp]
	push	eax
	mov	ecx, DWORD PTR _tr$[ebp]
	add	ecx, 132				; 00000084H
	push	ecx
	call	_get_node_status
	add	esp, 16					; 00000010H
	mov	DWORD PTR _node$[ebp], eax

; 548  : 				if(ctrl_tree_status(cntxt, tr, node, 1, 4)) STACK_ERROR;

	push	4
	push	1
	mov	edx, DWORD PTR _node$[ebp]
	push	edx
	mov	eax, DWORD PTR _tr$[ebp]
	push	eax
	mov	ecx, DWORD PTR _cntxt$[ebp]
	push	ecx
	call	_ctrl_tree_status
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L70896
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 548		; 00000224H
	jmp	$eva_err$70770
$L70896:

; 550  : 			else if(!strncmp(btn, add_sz_str("MOVETO=")) || !strncmp(btn, add_sz_str("ADDTO=")))

	jmp	$L70906
$L70891:
	push	7
	push	OFFSET FLAT:$SG70900
	mov	eax, DWORD PTR _btn$70875[ebp]
	push	eax
	call	_strncmp
	add	esp, 12					; 0000000cH
	test	eax, eax
	je	SHORT $L70899
	push	6
	push	OFFSET FLAT:$SG70901
	mov	ecx, DWORD PTR _btn$70875[ebp]
	push	ecx
	call	_strncmp
	add	esp, 12					; 0000000cH
	test	eax, eax
	jne	$L70906
$L70899:

; 552  : 				/* Read destination object */
; 553  : 				int iddest = atoi(path);

	mov	edx, DWORD PTR _path$70877[ebp]
	push	edx
	call	_atoi
	add	esp, 4
	mov	DWORD PTR _iddest$70902[ebp], eax

; 554  : 				if(!iddest) break;

	cmp	DWORD PTR _iddest$70902[ebp], 0
	jne	SHORT $L70903
	jmp	$eva_noerr$70954
$L70903:

; 555  : 
; 556  : 				/* Build confirmation page */
; 557  : 				/* Display confirmation dialog */
; 558  : 				/* Move selected nodes */
; 559  : 				for(i = 0; i < cgival.nbrows; i++)

	mov	DWORD PTR _i$[ebp], 0
	jmp	SHORT $L70904
$L70905:
	mov	eax, DWORD PTR _i$[ebp]
	add	eax, 1
	mov	DWORD PTR _i$[ebp], eax
$L70904:
	mov	ecx, DWORD PTR _i$[ebp]
	cmp	ecx, DWORD PTR _cgival$[ebp]
	jae	$L70906

; 561  : 					char sql[256];
; 562  : 
; 563  : 					/* Read moved object id */
; 564  : 					int idrelobj = atoi(dyntab_val(&cgival, i, 0));

	push	0
	mov	edx, DWORD PTR _i$[ebp]
	push	edx
	lea	eax, DWORD PTR _cgival$[ebp]
	push	eax
	call	_dyntab_val
	add	esp, 12					; 0000000cH
	push	eax
	call	_atoi
	add	esp, 4
	mov	DWORD PTR _idrelobj$70908[ebp], eax

; 565  : 					int idobjint = atoi(dyntab_val(&cgival, i, 0)+ 2 + (int)log10((double)idrelobj));

	push	0
	mov	ecx, DWORD PTR _i$[ebp]
	push	ecx
	lea	edx, DWORD PTR _cgival$[ebp]
	push	edx
	call	_dyntab_val
	add	esp, 12					; 0000000cH
	mov	esi, eax
	fild	DWORD PTR _idrelobj$70908[ebp]
	sub	esp, 8
	fstp	QWORD PTR [esp]
	call	_log10
	add	esp, 8
	call	__ftol
	lea	eax, DWORD PTR [esi+eax+2]
	push	eax
	call	_atoi
	add	esp, 4
	mov	DWORD PTR _idobjint$70909[ebp], eax

; 566  : 					if(!idrelobj) continue;

	cmp	DWORD PTR _idrelobj$70908[ebp], 0
	jne	SHORT $L70912
	jmp	$L70905
$L70912:

; 567  : 
; 568  : 					/* Build SQL request for source relation record */
; 569  : 					sprintf(sql, "SELECT Pkey, IdField, Num FROM TLink WHERE DateDel IS NULL AND IdObj=%d AND IdRelObj=%d", idobjint, idrelobj);

	mov	ecx, DWORD PTR _idrelobj$70908[ebp]
	push	ecx
	mov	edx, DWORD PTR _idobjint$70909[ebp]
	push	edx
	push	OFFSET FLAT:$SG70913
	lea	eax, DWORD PTR _sql$70907[ebp]
	push	eax
	call	_sprintf
	add	esp, 16					; 00000010H

; 570  : 					if(sql_exec_query(cntxt, sql) || sql_get_table(cntxt, &srcrec, 2)) STACK_ERROR;

	lea	ecx, DWORD PTR _sql$70907[ebp]
	push	ecx
	mov	edx, DWORD PTR _cntxt$[ebp]
	push	edx
	call	_sql_exec_query
	add	esp, 8
	test	eax, eax
	jne	SHORT $L70915
	push	2
	lea	eax, DWORD PTR _srcrec$[ebp]
	push	eax
	mov	ecx, DWORD PTR _cntxt$[ebp]
	push	ecx
	call	_sql_get_table
	add	esp, 12					; 0000000cH
	test	eax, eax
	je	SHORT $L70914
$L70915:
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 570		; 0000023aH
	jmp	$eva_err$70770
$L70914:

; 571  : 
; 572  : 					/* Process move if found */
; 573  : 					if(srcrec.nbrows)

	cmp	DWORD PTR _srcrec$[ebp], 0
	je	$L70924

; 575  : 						/* Create new record for relation */
; 576  : 						sprintf(sql, "INSERT TLink SET IdObj=%d, IdRelObj=%d, IdField=%s, Num=%s DateCr=%s, IdWhoCr=%s",
; 577  : 									iddest, idrelobj, dyntab_val(&srcrec, 0, 1), dyntab_val(&srcrec, 0, 2),
; 578  : 									cntxt->timestamp, dyntab_val(&cntxt->id_user, 0, 0));

	push	0
	push	0
	mov	eax, DWORD PTR _cntxt$[ebp]
	add	eax, 29408				; 000072e0H
	push	eax
	call	_dyntab_val
	add	esp, 12					; 0000000cH
	push	eax
	mov	ecx, DWORD PTR _cntxt$[ebp]
	add	ecx, 29704				; 00007408H
	push	ecx
	push	2
	push	0
	lea	edx, DWORD PTR _srcrec$[ebp]
	push	edx
	call	_dyntab_val
	add	esp, 12					; 0000000cH
	push	eax
	push	1
	push	0
	lea	eax, DWORD PTR _srcrec$[ebp]
	push	eax
	call	_dyntab_val
	add	esp, 12					; 0000000cH
	push	eax
	mov	ecx, DWORD PTR _idrelobj$70908[ebp]
	push	ecx
	mov	edx, DWORD PTR _iddest$70902[ebp]
	push	edx
	push	OFFSET FLAT:$SG70917
	lea	eax, DWORD PTR _sql$70907[ebp]
	push	eax
	call	_sprintf
	add	esp, 32					; 00000020H

; 579  : 						if(sql_exec_query(cntxt, sql)) STACK_ERROR;

	lea	ecx, DWORD PTR _sql$70907[ebp]
	push	ecx
	mov	edx, DWORD PTR _cntxt$[ebp]
	push	edx
	call	_sql_exec_query
	add	esp, 8
	test	eax, eax
	je	SHORT $L70918
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 579		; 00000243H
	jmp	$eva_err$70770
$L70918:

; 580  : 
; 581  : 						/* If move mode */
; 582  : 						if(!strncmp(btn, add_sz_str("MOVETO=")))

	push	7
	push	OFFSET FLAT:$SG70920
	mov	ecx, DWORD PTR _btn$70875[ebp]
	push	ecx
	call	_strncmp
	add	esp, 12					; 0000000cH
	test	eax, eax
	jne	$L70924

; 584  : 							/* Remove node from move data (clear in CGI data) */
; 585  : 							DynTableCell *val = dyntab_cell(&tr->treenodes, i, 0);

	push	0
	mov	edx, DWORD PTR _i$[ebp]
	push	edx
	mov	eax, DWORD PTR _tr$[ebp]
	add	eax, 132				; 00000084H
	push	eax
	call	_dyntab_cell
	add	esp, 12					; 0000000cH
	mov	DWORD PTR _val$70921[ebp], eax

; 586  : 							if(val && val->i_cgi)

	cmp	DWORD PTR _val$70921[ebp], 0
	je	SHORT $L70922
	mov	ecx, DWORD PTR _val$70921[ebp]
	cmp	DWORD PTR [ecx+48], 0
	je	SHORT $L70922

; 588  : 								cntxt->cgi[val->i_cgi].name[0] = 0;

	mov	edx, DWORD PTR _val$70921[ebp]
	mov	eax, DWORD PTR [edx+48]
	imul	eax, 56					; 00000038H
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	edx, DWORD PTR [ecx+29648]
	mov	eax, DWORD PTR [edx+eax]
	mov	BYTE PTR [eax], 0

; 589  : 								cntxt->cgi[val->i_cgi].name_sz = 0;

	mov	ecx, DWORD PTR _val$70921[ebp]
	mov	edx, DWORD PTR [ecx+48]
	imul	edx, 56					; 00000038H
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	ecx, DWORD PTR [eax+29648]
	mov	DWORD PTR [ecx+edx+4], 0
$L70922:

; 591  : 
; 592  : 							/* Remove old record */
; 593  : 							sprintf(sql, "UPDATE TLink SET DateDel='%s',IdWhoDel=%s WHERE Pkey=%s",
; 594  : 										cntxt->timestamp, dyntab_val(&cntxt->id_user, 0, 0), dyntab_val(&srcrec, 0, 0));

	push	0
	push	0
	lea	edx, DWORD PTR _srcrec$[ebp]
	push	edx
	call	_dyntab_val
	add	esp, 12					; 0000000cH
	push	eax
	push	0
	push	0
	mov	eax, DWORD PTR _cntxt$[ebp]
	add	eax, 29408				; 000072e0H
	push	eax
	call	_dyntab_val
	add	esp, 12					; 0000000cH
	push	eax
	mov	ecx, DWORD PTR _cntxt$[ebp]
	add	ecx, 29704				; 00007408H
	push	ecx
	push	OFFSET FLAT:$SG70923
	lea	edx, DWORD PTR _sql$70907[ebp]
	push	edx
	call	_sprintf
	add	esp, 20					; 00000014H

; 595  : 							if(sql_exec_query(cntxt, sql)) STACK_ERROR;

	lea	eax, DWORD PTR _sql$70907[ebp]
	push	eax
	mov	ecx, DWORD PTR _cntxt$[ebp]
	push	ecx
	call	_sql_exec_query
	add	esp, 8
	test	eax, eax
	je	SHORT $L70924
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 595		; 00000253H
	jmp	$eva_err$70770
$L70924:

; 598  : 
; 599  : 				}

	jmp	$L70905
$L70906:

; 603  : 		/* Handle first display */
; 604  : 		else if(!tr->treenodes.nbrows)

	jmp	$L70935
$L70874:
	mov	eax, DWORD PTR _tr$[ebp]
	cmp	DWORD PTR [eax+132], 0
	jne	$L70935

; 606  : 			/* Open nodes under selected node */
; 607  : 			int nb = atoi(CTRL_ATTR_VAL(SHOW_LEVELS));

	cmp	DWORD PTR _ctrl$[ebp], 0
	je	SHORT $L71026
	push	0
	push	-1
	push	OFFSET FLAT:$SG70928
	mov	ecx, DWORD PTR _ctrl$[ebp]
	add	ecx, 44					; 0000002cH
	push	ecx
	call	_dyntab_field_val
	add	esp, 16					; 00000010H
	mov	DWORD PTR -604+[ebp], eax
	jmp	SHORT $L71027
$L71026:
	mov	DWORD PTR -604+[ebp], OFFSET FLAT:$SG70929
$L71027:
	mov	edx, DWORD PTR -604+[ebp]
	push	edx
	call	_atoi
	add	esp, 4
	mov	DWORD PTR _nb$70927[ebp], eax

; 608  : 			if(dyntab_from_tab(&tr->treenodes, 0, 0, &idobj, 0, 0, idobj.nbrows, 1, 1)) RETURN_ERR_MEMORY;

	push	1
	push	1
	mov	eax, DWORD PTR _idobj$[ebp]
	push	eax
	push	0
	push	0
	lea	ecx, DWORD PTR _idobj$[ebp]
	push	ecx
	push	0
	push	0
	mov	edx, DWORD PTR _tr$[ebp]
	add	edx, 132				; 00000084H
	push	edx
	call	_dyntab_from_tab
	add	esp, 36					; 00000024H
	test	eax, eax
	je	SHORT $L70930
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29872], OFFSET FLAT:$SG70932
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 608		; 00000260H
	jmp	$eva_err$70770
$L70930:

; 609  : 			for(i = 0; i < idobj.nbrows; i++)

	mov	DWORD PTR _i$[ebp], 0
	jmp	SHORT $L70933
$L70934:
	mov	edx, DWORD PTR _i$[ebp]
	add	edx, 1
	mov	DWORD PTR _i$[ebp], edx
$L70933:
	mov	eax, DWORD PTR _i$[ebp]
	cmp	eax, DWORD PTR _idobj$[ebp]
	jae	SHORT $L70935

; 610  : 				if(ctrl_tree_status(cntxt, tr, i, 1, nb > 0 ? nb : 4)) STACK_ERROR;

	cmp	DWORD PTR _nb$70927[ebp], 0
	jle	SHORT $L71028
	mov	ecx, DWORD PTR _nb$70927[ebp]
	mov	DWORD PTR -608+[ebp], ecx
	jmp	SHORT $L71029
$L71028:
	mov	DWORD PTR -608+[ebp], 4
$L71029:
	mov	edx, DWORD PTR -608+[ebp]
	push	edx
	push	1
	mov	eax, DWORD PTR _i$[ebp]
	push	eax
	mov	ecx, DWORD PTR _tr$[ebp]
	push	ecx
	mov	edx, DWORD PTR _cntxt$[ebp]
	push	edx
	call	_ctrl_tree_status
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L70936
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 610		; 00000262H
	jmp	$eva_err$70770
$L70936:
	jmp	SHORT $L70934
$L70935:

; 612  : 
; 613  : 		/* Output control header */
; 614  : 		if(ctrl_format_pos(cntxt, ctrl, 1)) STACK_ERROR;

	push	1
	mov	ecx, DWORD PTR _ctrl$[ebp]
	push	ecx
	mov	edx, DWORD PTR _cntxt$[ebp]
	push	edx
	call	_ctrl_format_pos
	add	esp, 12					; 0000000cH
	test	eax, eax
	je	SHORT $L70937
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 614		; 00000266H
	jmp	$eva_err$70770
$L70937:

; 615  : 		if(tr->b_maxobj)

	mov	ecx, DWORD PTR _tr$[ebp]
	cmp	DWORD PTR [ecx+128], 0
	je	SHORT $L70939

; 617  : 			DYNBUF_ADD3_INT(form->html, "<p><b>*** Affichage incomplet (max=", tr->maxobj, ")</b></p>");

	push	9
	push	OFFSET FLAT:$SG70940
	mov	edx, DWORD PTR _tr$[ebp]
	mov	eax, DWORD PTR [edx+8]
	push	eax
	push	35					; 00000023H
	push	OFFSET FLAT:$SG70941
	mov	ecx, DWORD PTR _form$[ebp]
	mov	edx, DWORD PTR [ecx+232]
	push	edx
	call	_dynbuf_add3_int
	add	esp, 24					; 00000018H
	test	eax, eax
	je	SHORT $L70939
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29872], OFFSET FLAT:$SG70943
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 617		; 00000269H
	jmp	$eva_err$70770
$L70939:

; 619  : 
; 620  : 		/* Output tree control */
; 621  : 		for(i = 0; i < idobj.nbrows; i++)

	mov	DWORD PTR _i$[ebp], 0
	jmp	SHORT $L70944
$L70945:
	mov	edx, DWORD PTR _i$[ebp]
	add	edx, 1
	mov	DWORD PTR _i$[ebp], edx
$L70944:
	mov	eax, DWORD PTR _i$[ebp]
	cmp	eax, DWORD PTR _idobj$[ebp]
	jae	$L70946

; 623  : 			DYNTAB_SET_CELL(&id_child, 0, 0, &idobj, i, 0);

	push	0
	push	0
	mov	ecx, DWORD PTR _i$[ebp]
	push	ecx
	lea	edx, DWORD PTR _idobj$[ebp]
	push	edx
	call	_dyntab_cell
	add	esp, 12					; 0000000cH
	push	eax
	push	0
	push	0
	lea	eax, DWORD PTR _id_child$[ebp]
	push	eax
	call	_dyntab_copy
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L70947
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29872], OFFSET FLAT:$SG70949
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 623		; 0000026fH
	jmp	$eva_err$70770
$L70947:

; 624  :  			if(put_html_tree(cntxt, tr, NULL, &id_child, i == idobj.nbrows - 1, 1)) STACK_ERROR;

	push	1
	mov	eax, DWORD PTR _idobj$[ebp]
	sub	eax, 1
	xor	ecx, ecx
	cmp	DWORD PTR _i$[ebp], eax
	sete	cl
	push	ecx
	lea	edx, DWORD PTR _id_child$[ebp]
	push	edx
	push	0
	mov	eax, DWORD PTR _tr$[ebp]
	push	eax
	mov	ecx, DWORD PTR _cntxt$[ebp]
	push	ecx
	call	_put_html_tree
	add	esp, 24					; 00000018H
	test	eax, eax
	je	SHORT $L70951
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 624		; 00000270H
	jmp	SHORT $eva_err$70770
$L70951:

; 625  : 		}

	jmp	$L70945
$L70946:

; 626  : 
; 627  : 		/* Output control footer */
; 628  : 		if(ctrl_format_pos(cntxt, ctrl, 0)) STACK_ERROR;

	push	0
	mov	eax, DWORD PTR _ctrl$[ebp]
	push	eax
	mov	ecx, DWORD PTR _cntxt$[ebp]
	push	ecx
	call	_ctrl_format_pos
	add	esp, 12					; 0000000cH
	test	eax, eax
	je	SHORT $L70953
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 628		; 00000274H
	jmp	SHORT $eva_err$70770
$L70953:
$eva_noerr$70954:

; 633  : 
; 634  : 	RETURN_OK_CLEANUP;

	push	0
	push	OFFSET FLAT:$SG70955
	push	OFFSET FLAT:$SG70956
	mov	eax, DWORD PTR _cntxt$[ebp]
	push	eax
	call	_err_clear
	add	esp, 16					; 00000010H
$eva_err$70770:
	mov	ecx, DWORD PTR _cntxt$[ebp]
	cmp	DWORD PTR [ecx+29872], 0
	je	SHORT $L70957
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	eax, DWORD PTR [edx+29900]
	push	eax
	push	OFFSET FLAT:$SG70958
	push	OFFSET FLAT:$SG70959
	mov	ecx, DWORD PTR _cntxt$[ebp]
	push	ecx
	call	_err_add_context
	add	esp, 16					; 00000010H
$L70957:
	mov	edx, DWORD PTR _tr$[ebp]
	add	edx, 12					; 0000000cH
	push	edx
	call	_dyntab_free
	add	esp, 4
	mov	eax, DWORD PTR _tr$[ebp]
	add	eax, 32					; 00000020H
	push	eax
	call	_dyntab_free
	add	esp, 4
	mov	ecx, DWORD PTR _tr$[ebp]
	add	ecx, 72					; 00000048H
	push	ecx
	call	_dyntab_free
	add	esp, 4
	mov	edx, DWORD PTR _tr$[ebp]
	add	edx, 52					; 00000034H
	push	edx
	call	_dyntab_free
	add	esp, 4
	mov	eax, DWORD PTR _tr$[ebp]
	add	eax, 92					; 0000005cH
	push	eax
	call	_dyntab_free
	add	esp, 4
	mov	ecx, DWORD PTR _tr$[ebp]
	add	ecx, 132				; 00000084H
	push	ecx
	call	_dyntab_free
	add	esp, 4
	lea	edx, DWORD PTR _idobj$[ebp]
	push	edx
	call	_dyntab_free
	add	esp, 4
	lea	eax, DWORD PTR _id_child$[ebp]
	push	eax
	call	_dyntab_free
	add	esp, 4
	lea	ecx, DWORD PTR _srcrec$[ebp]
	push	ecx
	call	_dyntab_free
	add	esp, 4
	mov	edx, DWORD PTR _cntxt$[ebp]
	xor	eax, eax
	cmp	DWORD PTR [edx+29872], 0
	setne	al

; 635  : }

	pop	edi
	pop	esi
	mov	esp, ebp
	pop	ebp
	ret	0
$L71031:
	DD	$L70768
	DD	$L70953
	DD	$L70953
	DD	$L70953
	DD	$L70771
	DD	$L70953
	DD	$L70771
	DD	$L70771
_ctrl_add_reltree ENDP
_TEXT	ENDS
END
