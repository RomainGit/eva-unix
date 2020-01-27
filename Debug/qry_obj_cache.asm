	TITLE	D:\Travail\ABI\EVA\V4.0\CGI\Brunix-2016\qry_obj_cache.c
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
PUBLIC	_qry_cache_idobj_field
EXTRN	_qry_obj_field:NEAR
EXTRN	_dyntab_free:NEAR
EXTRN	_dyntab_from_tab:NEAR
EXTRN	_err_add_context:NEAR
EXTRN	_err_clear:NEAR
EXTRN	_dyntab_filter_field:NEAR
_DATA	SEGMENT
$SG70230 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70234 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70235 DB	'D:\Travail\ABI\EVA\V4.0\CGI\Brunix-2016\qry_obj_cache.c', 00H
$SG70236 DB	'qry_cache_idobj_field', 00H
	ORG $+2
$SG70238 DB	'D:\Travail\ABI\EVA\V4.0\CGI\Brunix-2016\qry_obj_cache.c', 00H
$SG70239 DB	'qry_cache_idobj_field', 00H
_DATA	ENDS
_TEXT	SEGMENT
_cntxt$ = 8
_res$ = 12
_idobj$ = 16
_field$ = 20
_mode$ = 24
_i$ = -4
_qry_cache_idobj_field PROC NEAR

; 30   : ){

	push	ebp
	mov	ebp, esp
	push	ecx

; 31   : 	unsigned long i;
; 32   : 
; 33   : 	/* Free result if applicable */
; 34   : 	if(mode & 2) dyntab_free(res);

	mov	eax, DWORD PTR _mode$[ebp]
	and	eax, 2
	test	eax, eax
	je	SHORT $L70216
	mov	ecx, DWORD PTR _res$[ebp]
	push	ecx
	call	_dyntab_free
	add	esp, 4
$L70216:

; 35   : 
; 36   : 	/* Search object in cache */
; 37   : 	for(i = 0; i < cntxt->oc_nb && cntxt->oc[i].id != idobj; i++);

	mov	DWORD PTR _i$[ebp], 0
	jmp	SHORT $L70217
$L70218:
	mov	edx, DWORD PTR _i$[ebp]
	add	edx, 1
	mov	DWORD PTR _i$[ebp], edx
$L70217:
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	ecx, DWORD PTR _i$[ebp]
	cmp	ecx, DWORD PTR [eax+130364]
	jae	SHORT $L70219
	mov	edx, DWORD PTR _i$[ebp]
	imul	edx, 24					; 00000018H
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	ecx, DWORD PTR [eax+edx+32060]
	cmp	ecx, DWORD PTR _idobj$[ebp]
	je	SHORT $L70219
	jmp	SHORT $L70218
$L70219:

; 38   : 	if(i >= cntxt->oc_nb)

	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	eax, DWORD PTR _i$[ebp]
	cmp	eax, DWORD PTR [edx+130364]
	jb	$L70226

; 40   : 		/* Object is in not cache : check if space left in buffer */
; 41   : 		if(i >= nbelem(cntxt->oc))

	cmp	DWORD PTR _i$[ebp], 4096		; 00001000H
	jb	SHORT $L70221

; 43   : 			/* No space left : read object from DB & return */
; 44   : 			if(qry_obj_field(cntxt, res, idobj, field)) STACK_ERROR;

	mov	ecx, DWORD PTR _field$[ebp]
	push	ecx
	mov	edx, DWORD PTR _idobj$[ebp]
	push	edx
	mov	eax, DWORD PTR _res$[ebp]
	push	eax
	mov	ecx, DWORD PTR _cntxt$[ebp]
	push	ecx
	call	_qry_obj_field
	add	esp, 16					; 00000010H
	test	eax, eax
	je	SHORT $L70222
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 44		; 0000002cH
	jmp	$eva_err$70223
$L70222:

; 45   : 			RETURN_OK;

	jmp	$eva_noerr$70224
$L70221:

; 47   : 
; 48   : 		/* Read data in cache */
; 49   : 		cntxt->oc_nb++;

	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	ecx, DWORD PTR [eax+130364]
	add	ecx, 1
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+130364], ecx

; 50   : 		cntxt->oc[i].id = idobj;

	mov	eax, DWORD PTR _i$[ebp]
	imul	eax, 24					; 00000018H
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	edx, DWORD PTR _idobj$[ebp]
	mov	DWORD PTR [ecx+eax+32060], edx

; 51   : 		if(qry_obj_field(cntxt, &cntxt->oc[i].data, idobj, NULL)) STACK_ERROR;

	push	0
	mov	eax, DWORD PTR _idobj$[ebp]
	push	eax
	mov	ecx, DWORD PTR _i$[ebp]
	imul	ecx, 24					; 00000018H
	mov	edx, DWORD PTR _cntxt$[ebp]
	lea	eax, DWORD PTR [edx+ecx+32064]
	push	eax
	mov	ecx, DWORD PTR _cntxt$[ebp]
	push	ecx
	call	_qry_obj_field
	add	esp, 16					; 00000010H
	test	eax, eax
	je	SHORT $L70226
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 51		; 00000033H
	jmp	$eva_err$70223
$L70226:

; 53   : 
; 54   : 	/* Copy data to result */
; 55   : 	if(field)

	cmp	DWORD PTR _field$[ebp], 0
	je	SHORT $L70227

; 57   : 		if(dyntab_filter_field(res, 1, &cntxt->oc[i].data, field, 0, 0))	RETURN_ERR_MEMORY;

	push	0
	push	0
	mov	eax, DWORD PTR _field$[ebp]
	push	eax
	mov	ecx, DWORD PTR _i$[ebp]
	imul	ecx, 24					; 00000018H
	mov	edx, DWORD PTR _cntxt$[ebp]
	lea	eax, DWORD PTR [edx+ecx+32064]
	push	eax
	push	1
	mov	ecx, DWORD PTR _res$[ebp]
	push	ecx
	call	_dyntab_filter_field
	add	esp, 24					; 00000018H
	test	eax, eax
	je	SHORT $L70228
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29872], OFFSET FLAT:$SG70230
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 57		; 00000039H
	jmp	$eva_err$70223
$L70228:

; 59   : 	else

	jmp	SHORT $eva_noerr$70224
$L70227:

; 60   : 		if(dyntab_from_tab(res, res->nbrows, 0, &cntxt->oc[i].data, 0, 0, cntxt->oc[i].data.nbrows, 1, 1 | (mode & 1 ? 32 : 0))) RETURN_ERR_MEMORY;

	mov	ecx, DWORD PTR _mode$[ebp]
	and	ecx, 1
	neg	ecx
	sbb	ecx, ecx
	and	ecx, 32					; 00000020H
	or	ecx, 1
	push	ecx
	push	1
	mov	edx, DWORD PTR _i$[ebp]
	imul	edx, 24					; 00000018H
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	ecx, DWORD PTR [eax+edx+32064]
	push	ecx
	push	0
	push	0
	mov	edx, DWORD PTR _i$[ebp]
	imul	edx, 24					; 00000018H
	mov	eax, DWORD PTR _cntxt$[ebp]
	lea	ecx, DWORD PTR [eax+edx+32064]
	push	ecx
	push	0
	mov	edx, DWORD PTR _res$[ebp]
	mov	eax, DWORD PTR [edx]
	push	eax
	mov	ecx, DWORD PTR _res$[ebp]
	push	ecx
	call	_dyntab_from_tab
	add	esp, 36					; 00000024H
	test	eax, eax
	je	SHORT $eva_noerr$70224
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29872], OFFSET FLAT:$SG70234
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 60		; 0000003cH
	jmp	SHORT $eva_err$70223
$eva_noerr$70224:

; 61   : 
; 62   : 	RETURN_OK_CLEANUP;

	push	0
	push	OFFSET FLAT:$SG70235
	push	OFFSET FLAT:$SG70236
	mov	ecx, DWORD PTR _cntxt$[ebp]
	push	ecx
	call	_err_clear
	add	esp, 16					; 00000010H
$eva_err$70223:
	mov	edx, DWORD PTR _cntxt$[ebp]
	cmp	DWORD PTR [edx+29872], 0
	je	SHORT $L70237
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	ecx, DWORD PTR [eax+29900]
	push	ecx
	push	OFFSET FLAT:$SG70238
	push	OFFSET FLAT:$SG70239
	mov	edx, DWORD PTR _cntxt$[ebp]
	push	edx
	call	_err_add_context
	add	esp, 16					; 00000010H
$L70237:
	mov	eax, DWORD PTR _cntxt$[ebp]
	xor	ecx, ecx
	cmp	DWORD PTR [eax+29872], 0
	setne	cl
	mov	eax, ecx

; 63   : }

	mov	esp, ebp
	pop	ebp
	ret	0
_qry_cache_idobj_field ENDP
_TEXT	ENDS
PUBLIC	_qry_uncache_idobj
_TEXT	SEGMENT
_cntxt$ = 8
_idobj$ = 12
_i$ = -4
_qry_uncache_idobj PROC NEAR

; 74   : ){

	push	ebp
	mov	ebp, esp
	push	ecx

; 75   : 	unsigned long i;
; 76   : 
; 77   : 	/* Search object in cache - return if not found */
; 78   : 	for(i = 0; i < cntxt->oc_nb && cntxt->oc[i].id != idobj; i++);

	mov	DWORD PTR _i$[ebp], 0
	jmp	SHORT $L70247
$L70248:
	mov	eax, DWORD PTR _i$[ebp]
	add	eax, 1
	mov	DWORD PTR _i$[ebp], eax
$L70247:
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	edx, DWORD PTR _i$[ebp]
	cmp	edx, DWORD PTR [ecx+130364]
	jae	SHORT $L70249
	mov	eax, DWORD PTR _i$[ebp]
	imul	eax, 24					; 00000018H
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	edx, DWORD PTR [ecx+eax+32060]
	cmp	edx, DWORD PTR _idobj$[ebp]
	je	SHORT $L70249
	jmp	SHORT $L70248
$L70249:

; 79   : 	if(i >= cntxt->oc_nb) return;

	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	ecx, DWORD PTR _i$[ebp]
	cmp	ecx, DWORD PTR [eax+130364]
	jb	SHORT $L70250
	jmp	SHORT $L70245
$L70250:

; 80   : 
; 81   : 	/* Free cache position */
; 82   : 	dyntab_free(&cntxt->oc[i].data);

	mov	edx, DWORD PTR _i$[ebp]
	imul	edx, 24					; 00000018H
	mov	eax, DWORD PTR _cntxt$[ebp]
	lea	ecx, DWORD PTR [eax+edx+32064]
	push	ecx
	call	_dyntab_free
	add	esp, 4

; 83   : 	cntxt->oc[i].id = 0;

	mov	edx, DWORD PTR _i$[ebp]
	imul	edx, 24					; 00000018H
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+edx+32060], 0
$L70245:

; 84   : }

	mov	esp, ebp
	pop	ebp
	ret	0
_qry_uncache_idobj ENDP
_TEXT	ENDS
PUBLIC	_qry_cache_objlist_field
EXTRN	_strtoul:NEAR
EXTRN	_dyntab_val:NEAR
_DATA	SEGMENT
	ORG $+2
$SG70272 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70275 DB	'D:\Travail\ABI\EVA\V4.0\CGI\Brunix-2016\qry_obj_cache.c', 00H
$SG70276 DB	'qry_cache_objlist_field', 00H
$SG70278 DB	'D:\Travail\ABI\EVA\V4.0\CGI\Brunix-2016\qry_obj_cache.c', 00H
$SG70279 DB	'qry_cache_objlist_field', 00H
_DATA	ENDS
_TEXT	SEGMENT
_cntxt$ = 8
_res$ = 12
_idobj$ = 16
_field$ = 20
_mode$ = 24
_i$ = -4
_qry_cache_objlist_field PROC NEAR

; 100  : ){

	push	ebp
	mov	ebp, esp
	push	ecx

; 101  : 	unsigned long i;
; 102  : 
; 103  : 	/* Read given objects from cache */
; 104  : 	if(mode & 2) dyntab_free(res);

	mov	eax, DWORD PTR _mode$[ebp]
	and	eax, 2
	test	eax, eax
	je	SHORT $L70265
	mov	ecx, DWORD PTR _res$[ebp]
	push	ecx
	call	_dyntab_free
	add	esp, 4
$L70265:

; 105  : 	for(i = 0; i < idobj->nbrows; i++)

	mov	DWORD PTR _i$[ebp], 0
	jmp	SHORT $L70266
$L70267:
	mov	edx, DWORD PTR _i$[ebp]
	add	edx, 1
	mov	DWORD PTR _i$[ebp], edx
$L70266:
	mov	eax, DWORD PTR _idobj$[ebp]
	mov	ecx, DWORD PTR _i$[ebp]
	cmp	ecx, DWORD PTR [eax]
	jae	SHORT $eva_noerr$70274

; 106  : 		if(qry_cache_idobj_field(cntxt, res, DYNTAB_TOULRC(idobj, i, 0), field, mode & ~2L)) RETURN_ERR_MEMORY;

	mov	edx, DWORD PTR _mode$[ebp]
	and	edx, -3					; fffffffdH
	push	edx
	mov	eax, DWORD PTR _field$[ebp]
	push	eax
	push	10					; 0000000aH
	push	0
	push	0
	mov	ecx, DWORD PTR _i$[ebp]
	push	ecx
	mov	edx, DWORD PTR _idobj$[ebp]
	push	edx
	call	_dyntab_val
	add	esp, 12					; 0000000cH
	push	eax
	call	_strtoul
	add	esp, 12					; 0000000cH
	push	eax
	mov	eax, DWORD PTR _res$[ebp]
	push	eax
	mov	ecx, DWORD PTR _cntxt$[ebp]
	push	ecx
	call	_qry_cache_idobj_field
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L70270
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29872], OFFSET FLAT:$SG70272
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 106		; 0000006aH
	jmp	SHORT $eva_err$70273
$L70270:
	jmp	SHORT $L70267
$eva_noerr$70274:

; 107  : 
; 108  : 	RETURN_OK_CLEANUP;

	push	0
	push	OFFSET FLAT:$SG70275
	push	OFFSET FLAT:$SG70276
	mov	ecx, DWORD PTR _cntxt$[ebp]
	push	ecx
	call	_err_clear
	add	esp, 16					; 00000010H
$eva_err$70273:
	mov	edx, DWORD PTR _cntxt$[ebp]
	cmp	DWORD PTR [edx+29872], 0
	je	SHORT $L70277
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	ecx, DWORD PTR [eax+29900]
	push	ecx
	push	OFFSET FLAT:$SG70278
	push	OFFSET FLAT:$SG70279
	mov	edx, DWORD PTR _cntxt$[ebp]
	push	edx
	call	_err_add_context
	add	esp, 16					; 00000010H
$L70277:
	mov	eax, DWORD PTR _cntxt$[ebp]
	xor	ecx, ecx
	cmp	DWORD PTR [eax+29872], 0
	setne	cl
	mov	eax, ecx

; 109  : }

	mov	esp, ebp
	pop	ebp
	ret	0
_qry_cache_objlist_field ENDP
_TEXT	ENDS
END
