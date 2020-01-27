	TITLE	D:\Travail\ABI\EVA\V4.0\CGI\Brunix-2016\qry_build.c
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
_?tblnum@?DG@??qry_parse_filter_nodes@@9@9 DD 01H DUP (?)
_BSS	ENDS
PUBLIC	_qry_build_free_nodes
EXTRN	_mem_free:NEAR
EXTRN	_dyntab_free:NEAR
EXTRN	_memset:NEAR
_TEXT	SEGMENT
_flt$ = 8
_i$ = -4
_qry_build_free_nodes PROC NEAR

; 30   : {

	push	ebp
	mov	ebp, esp
	push	ecx
	push	esi

; 31   : 	unsigned long i;
; 32   : 	if(!flt) return;

	cmp	DWORD PTR _flt$[ebp], 0
	jne	SHORT $L70209
	jmp	$L70207
$L70209:

; 33   : 	M_FREE(flt->select);

	mov	eax, DWORD PTR _flt$[ebp]
	mov	ecx, DWORD PTR [eax+28]
	push	ecx
	call	_mem_free
	add	esp, 4
	mov	edx, DWORD PTR _flt$[ebp]
	mov	DWORD PTR [edx+28], 0

; 34   : 	M_FREE(flt->optselect);

	mov	eax, DWORD PTR _flt$[ebp]
	mov	ecx, DWORD PTR [eax+32]
	push	ecx
	call	_mem_free
	add	esp, 4
	mov	edx, DWORD PTR _flt$[ebp]
	mov	DWORD PTR [edx+32], 0

; 35   : 	M_FREE(flt->join);

	mov	eax, DWORD PTR _flt$[ebp]
	mov	ecx, DWORD PTR [eax+36]
	push	ecx
	call	_mem_free
	add	esp, 4
	mov	edx, DWORD PTR _flt$[ebp]
	mov	DWORD PTR [edx+36], 0

; 36   : 	M_FREE(flt->where);

	mov	eax, DWORD PTR _flt$[ebp]
	mov	ecx, DWORD PTR [eax+40]
	push	ecx
	call	_mem_free
	add	esp, 4
	mov	edx, DWORD PTR _flt$[ebp]
	mov	DWORD PTR [edx+40], 0

; 37   : 	M_FREE(flt->groupfn);

	mov	eax, DWORD PTR _flt$[ebp]
	mov	ecx, DWORD PTR [eax+44]
	push	ecx
	call	_mem_free
	add	esp, 4
	mov	edx, DWORD PTR _flt$[ebp]
	mov	DWORD PTR [edx+44], 0

; 38   : 	M_FREE(flt->having);

	mov	eax, DWORD PTR _flt$[ebp]
	mov	ecx, DWORD PTR [eax+48]
	push	ecx
	call	_mem_free
	add	esp, 4
	mov	edx, DWORD PTR _flt$[ebp]
	mov	DWORD PTR [edx+48], 0

; 39   : 	M_FREE(flt->orderby);

	mov	eax, DWORD PTR _flt$[ebp]
	mov	ecx, DWORD PTR [eax+52]
	push	ecx
	call	_mem_free
	add	esp, 4
	mov	edx, DWORD PTR _flt$[ebp]
	mov	DWORD PTR [edx+52], 0

; 40   : 	for(i = 0; i < sizeof(flt->node)/sizeof(flt->node[0]); i++)

	mov	DWORD PTR _i$[ebp], 0
	jmp	SHORT $L70210
$L70211:
	mov	eax, DWORD PTR _i$[ebp]
	add	eax, 1
	mov	DWORD PTR _i$[ebp], eax
$L70210:
	cmp	DWORD PTR _i$[ebp], 32			; 00000020H
	jae	$L70212

; 42   : 		DYNTAB_FREE(flt->node[i].field);

	mov	ecx, DWORD PTR _i$[ebp]
	imul	ecx, 136				; 00000088H
	mov	edx, DWORD PTR _flt$[ebp]
	lea	eax, DWORD PTR [edx+ecx+72]
	push	eax
	call	_dyntab_free
	add	esp, 4

; 43   : 		DYNTAB_FREE(flt->node[i].value);

	mov	ecx, DWORD PTR _i$[ebp]
	imul	ecx, 136				; 00000088H
	mov	edx, DWORD PTR _flt$[ebp]
	lea	eax, DWORD PTR [edx+ecx+104]
	push	eax
	call	_dyntab_free
	add	esp, 4

; 44   : 		DYNTAB_FREE(flt->node[i].idobjmatch);

	mov	ecx, DWORD PTR _i$[ebp]
	imul	ecx, 136				; 00000088H
	mov	edx, DWORD PTR _flt$[ebp]
	lea	eax, DWORD PTR [edx+ecx+168]
	push	eax
	call	_dyntab_free
	add	esp, 4

; 45   : 		if(flt->node[i].whocr == flt->node[i].whodel) flt->node[i].whodel = NULL;

	mov	ecx, DWORD PTR _i$[ebp]
	imul	ecx, 136				; 00000088H
	mov	edx, DWORD PTR _i$[ebp]
	imul	edx, 136				; 00000088H
	mov	eax, DWORD PTR _flt$[ebp]
	mov	esi, DWORD PTR _flt$[ebp]
	mov	ecx, DWORD PTR [eax+ecx+188]
	cmp	ecx, DWORD PTR [esi+edx+192]
	jne	SHORT $L70213
	mov	edx, DWORD PTR _i$[ebp]
	imul	edx, 136				; 00000088H
	mov	eax, DWORD PTR _flt$[ebp]
	mov	DWORD PTR [eax+edx+192], 0
$L70213:

; 46   : 		M_FREE(flt->node[i].whocr);

	mov	ecx, DWORD PTR _i$[ebp]
	imul	ecx, 136				; 00000088H
	mov	edx, DWORD PTR _flt$[ebp]
	mov	eax, DWORD PTR [edx+ecx+188]
	push	eax
	call	_mem_free
	add	esp, 4
	mov	ecx, DWORD PTR _i$[ebp]
	imul	ecx, 136				; 00000088H
	mov	edx, DWORD PTR _flt$[ebp]
	mov	DWORD PTR [edx+ecx+188], 0

; 47   : 		M_FREE(flt->node[i].whodel);

	mov	eax, DWORD PTR _i$[ebp]
	imul	eax, 136				; 00000088H
	mov	ecx, DWORD PTR _flt$[ebp]
	mov	edx, DWORD PTR [ecx+eax+192]
	push	edx
	call	_mem_free
	add	esp, 4
	mov	eax, DWORD PTR _i$[ebp]
	imul	eax, 136				; 00000088H
	mov	ecx, DWORD PTR _flt$[ebp]
	mov	DWORD PTR [ecx+eax+192], 0

; 48   : 		M_FREE(flt->node[i].cond);

	mov	edx, DWORD PTR _i$[ebp]
	imul	edx, 136				; 00000088H
	mov	eax, DWORD PTR _flt$[ebp]
	mov	ecx, DWORD PTR [eax+edx+196]
	push	ecx
	call	_mem_free
	add	esp, 4
	mov	edx, DWORD PTR _i$[ebp]
	imul	edx, 136				; 00000088H
	mov	eax, DWORD PTR _flt$[ebp]
	mov	DWORD PTR [eax+edx+196], 0

; 49   : 	}

	jmp	$L70211
$L70212:

; 50   : 	memset(flt->node, 0, sizeof(flt->node));

	push	4352					; 00001100H
	push	0
	mov	ecx, DWORD PTR _flt$[ebp]
	add	ecx, 72					; 00000048H
	push	ecx
	call	_memset
	add	esp, 12					; 0000000cH

; 51   : 	flt->srctable = NULL;

	mov	edx, DWORD PTR _flt$[ebp]
	mov	DWORD PTR [edx+20], 0

; 52   : 	flt->srcjoin = 0;

	mov	eax, DWORD PTR _flt$[ebp]
	mov	DWORD PTR [eax+64], 0

; 53   : 	flt->nbjoin = 0;

	mov	ecx, DWORD PTR _flt$[ebp]
	mov	DWORD PTR [ecx+68], 0

; 54   : 	flt->valnode = NULL;

	mov	edx, DWORD PTR _flt$[ebp]
	mov	DWORD PTR [edx+4428], 0

; 55   : 	flt->nbnode = 0;

	mov	eax, DWORD PTR _flt$[ebp]
	mov	DWORD PTR [eax+4424], 0

; 56   : 	flt->b_userelobj = 0;

	mov	ecx, DWORD PTR _flt$[ebp]
	mov	DWORD PTR [ecx+4436], 0

; 57   : 	flt->b_single_last_field = 0;

	mov	edx, DWORD PTR _flt$[ebp]
	mov	DWORD PTR [edx+4452], 0

; 58   : 	flt->selidobj = NULL;

	mov	eax, DWORD PTR _flt$[ebp]
	mov	DWORD PTR [eax+4440], 0
$L70207:

; 59   : }

	pop	esi
	mov	esp, ebp
	pop	ebp
	ret	0
_qry_build_free_nodes ENDP
_TEXT	ENDS
PUBLIC	_qry_build_free
_TEXT	SEGMENT
_flt$ = 8
_qry_build_free PROC NEAR

; 66   : {

	push	ebp
	mov	ebp, esp

; 67   : 	if(!flt) return;

	cmp	DWORD PTR _flt$[ebp], 0
	jne	SHORT $L70221
	jmp	SHORT $L70220
$L70221:

; 68   : 	DYNTAB_FREE(flt->name);

	mov	eax, DWORD PTR _flt$[ebp]
	push	eax
	call	_dyntab_free
	add	esp, 4

; 69   : 	qry_build_free_nodes(flt);

	mov	ecx, DWORD PTR _flt$[ebp]
	push	ecx
	call	_qry_build_free_nodes
	add	esp, 4

; 70   : 	memset(flt, 0, sizeof(flt[0]));

	push	4456					; 00001168H
	push	0
	mov	edx, DWORD PTR _flt$[ebp]
	push	edx
	call	_memset
	add	esp, 12					; 0000000cH
$L70220:

; 71   : }

	pop	ebp
	ret	0
_qry_build_free ENDP
_TEXT	ENDS
PUBLIC	_qry_parse_field_modifier
EXTRN	_strcmp:NEAR
_DATA	SEGMENT
$SG70225 DB	'IdObj', 00H
	ORG $+2
$SG70226 DB	'Obj', 00H
$SG70227 DB	'Pkey', 00H
	ORG $+3
$SG70228 DB	'IdField', 00H
$SG70229 DB	'Field', 00H
	ORG $+2
$SG70230 DB	'IdValue', 00H
$SG70231 DB	'TxtValue', 00H
	ORG $+3
$SG70232 DB	'Value', 00H
	ORG $+2
$SG70233 DB	'Num', 00H
$SG70234 DB	'Line', 00H
	ORG $+3
$SG70235 DB	'IdRelObj', 00H
	ORG $+3
$SG70236 DB	'RelObj', 00H
	ORG $+1
$SG70237 DB	'DateCr', 00H
	ORG $+1
$SG70238 DB	'IdWhoCr', 00H
$SG70239 DB	'WhoCr', 00H
	ORG $+2
$SG70240 DB	'DateDel', 00H
$SG70241 DB	'IdWhoDel', 00H
	ORG $+3
$SG70242 DB	'WhoDel', 00H
_DATA	ENDS
_TEXT	SEGMENT
_fm$ = 8
_qry_parse_field_modifier PROC NEAR

; 79   : ){

	push	ebp
	mov	ebp, esp
	sub	esp, 56					; 00000038H

; 80   : 	return (!(fm && *fm) ? F_None :
; 81   : 				(!strcmp(fm, "IdObj") || !strcmp(fm, "Obj")) ? F_Obj :
; 82   : 				!strcmp(fm, "Pkey") ? F_Pkey :
; 83   : 				!strcmp(fm, "IdField") ? F_IdField :
; 84   : 				!strcmp(fm, "Field") ? F_Field :
; 85   : 				!strcmp(fm, "IdValue") ? F_IdValue :
; 86   : 				(!strcmp(fm, "TxtValue") || !strcmp(fm, "Value")) ? F_Value :
; 87   : 				!strcmp(fm, "Num") ? F_Num :
; 88   : 				!strcmp(fm, "Line") ? F_Line :
; 89   : 				(!strcmp(fm, "IdRelObj") || !strcmp(fm, "RelObj")) ? F_RelObj :
; 90   : 				!strcmp(fm, "DateCr") ? F_DateCr :
; 91   : 				(!strcmp(fm, "IdWhoCr") || !strcmp(fm, "WhoCr")) ? F_WhoCr :
; 92   : 				!strcmp(fm, "DateDel") ? F_DateDel :
; 93   : 				(!strcmp(fm, "IdWhoDel") || !strcmp(fm, "WhoDel")) ? F_WhoDel :
; 94   : 				F_None);

	cmp	DWORD PTR _fm$[ebp], 0
	je	$L74306
	mov	eax, DWORD PTR _fm$[ebp]
	movsx	ecx, BYTE PTR [eax]
	test	ecx, ecx
	je	$L74306
	push	OFFSET FLAT:$SG70225
	mov	edx, DWORD PTR _fm$[ebp]
	push	edx
	call	_strcmp
	add	esp, 8
	test	eax, eax
	je	$L74307
	push	OFFSET FLAT:$SG70226
	mov	eax, DWORD PTR _fm$[ebp]
	push	eax
	call	_strcmp
	add	esp, 8
	test	eax, eax
	je	$L74307
	push	OFFSET FLAT:$SG70227
	mov	ecx, DWORD PTR _fm$[ebp]
	push	ecx
	call	_strcmp
	add	esp, 8
	test	eax, eax
	jne	SHORT $L74330
	mov	DWORD PTR -4+[ebp], 1
	jmp	$L74331
$L74330:
	push	OFFSET FLAT:$SG70228
	mov	edx, DWORD PTR _fm$[ebp]
	push	edx
	call	_strcmp
	add	esp, 8
	test	eax, eax
	jne	SHORT $L74328
	mov	DWORD PTR -8+[ebp], 3
	jmp	$L74329
$L74328:
	push	OFFSET FLAT:$SG70229
	mov	eax, DWORD PTR _fm$[ebp]
	push	eax
	call	_strcmp
	add	esp, 8
	test	eax, eax
	jne	SHORT $L74326
	mov	DWORD PTR -12+[ebp], 5
	jmp	$L74327
$L74326:
	push	OFFSET FLAT:$SG70230
	mov	ecx, DWORD PTR _fm$[ebp]
	push	ecx
	call	_strcmp
	add	esp, 8
	test	eax, eax
	jne	SHORT $L74324
	mov	DWORD PTR -16+[ebp], 4
	jmp	$L74325
$L74324:
	push	OFFSET FLAT:$SG70231
	mov	edx, DWORD PTR _fm$[ebp]
	push	edx
	call	_strcmp
	add	esp, 8
	test	eax, eax
	je	$L74308
	push	OFFSET FLAT:$SG70232
	mov	eax, DWORD PTR _fm$[ebp]
	push	eax
	call	_strcmp
	add	esp, 8
	test	eax, eax
	je	$L74308
	push	OFFSET FLAT:$SG70233
	mov	ecx, DWORD PTR _fm$[ebp]
	push	ecx
	call	_strcmp
	add	esp, 8
	test	eax, eax
	jne	SHORT $L74321
	mov	DWORD PTR -20+[ebp], 8
	jmp	$L74322
$L74321:
	push	OFFSET FLAT:$SG70234
	mov	edx, DWORD PTR _fm$[ebp]
	push	edx
	call	_strcmp
	add	esp, 8
	test	eax, eax
	jne	SHORT $L74319
	mov	DWORD PTR -24+[ebp], 9
	jmp	$L74320
$L74319:
	push	OFFSET FLAT:$SG70235
	mov	eax, DWORD PTR _fm$[ebp]
	push	eax
	call	_strcmp
	add	esp, 8
	test	eax, eax
	je	$L74309
	push	OFFSET FLAT:$SG70236
	mov	ecx, DWORD PTR _fm$[ebp]
	push	ecx
	call	_strcmp
	add	esp, 8
	test	eax, eax
	je	$L74309
	push	OFFSET FLAT:$SG70237
	mov	edx, DWORD PTR _fm$[ebp]
	push	edx
	call	_strcmp
	add	esp, 8
	test	eax, eax
	jne	SHORT $L74316
	mov	DWORD PTR -28+[ebp], 10			; 0000000aH
	jmp	$L74317
$L74316:
	push	OFFSET FLAT:$SG70238
	mov	eax, DWORD PTR _fm$[ebp]
	push	eax
	call	_strcmp
	add	esp, 8
	test	eax, eax
	je	SHORT $L74310
	push	OFFSET FLAT:$SG70239
	mov	ecx, DWORD PTR _fm$[ebp]
	push	ecx
	call	_strcmp
	add	esp, 8
	test	eax, eax
	je	SHORT $L74310
	push	OFFSET FLAT:$SG70240
	mov	edx, DWORD PTR _fm$[ebp]
	push	edx
	call	_strcmp
	add	esp, 8
	test	eax, eax
	jne	SHORT $L74313
	mov	DWORD PTR -32+[ebp], 12			; 0000000cH
	jmp	SHORT $L74314
$L74313:
	push	OFFSET FLAT:$SG70241
	mov	eax, DWORD PTR _fm$[ebp]
	push	eax
	call	_strcmp
	add	esp, 8
	test	eax, eax
	je	SHORT $L74311
	push	OFFSET FLAT:$SG70242
	mov	ecx, DWORD PTR _fm$[ebp]
	push	ecx
	call	_strcmp
	add	esp, 8
	test	eax, eax
	je	SHORT $L74311
	mov	DWORD PTR -36+[ebp], 0
	jmp	SHORT $L74312
$L74311:
	mov	DWORD PTR -36+[ebp], 13			; 0000000dH
$L74312:
	mov	edx, DWORD PTR -36+[ebp]
	mov	DWORD PTR -32+[ebp], edx
$L74314:
	mov	eax, DWORD PTR -32+[ebp]
	mov	DWORD PTR -40+[ebp], eax
	jmp	SHORT $L74315
$L74310:
	mov	DWORD PTR -40+[ebp], 11			; 0000000bH
$L74315:
	mov	ecx, DWORD PTR -40+[ebp]
	mov	DWORD PTR -28+[ebp], ecx
$L74317:
	mov	edx, DWORD PTR -28+[ebp]
	mov	DWORD PTR -44+[ebp], edx
	jmp	SHORT $L74318
$L74309:
	mov	DWORD PTR -44+[ebp], 7
$L74318:
	mov	eax, DWORD PTR -44+[ebp]
	mov	DWORD PTR -24+[ebp], eax
$L74320:
	mov	ecx, DWORD PTR -24+[ebp]
	mov	DWORD PTR -20+[ebp], ecx
$L74322:
	mov	edx, DWORD PTR -20+[ebp]
	mov	DWORD PTR -48+[ebp], edx
	jmp	SHORT $L74323
$L74308:
	mov	DWORD PTR -48+[ebp], 6
$L74323:
	mov	eax, DWORD PTR -48+[ebp]
	mov	DWORD PTR -16+[ebp], eax
$L74325:
	mov	ecx, DWORD PTR -16+[ebp]
	mov	DWORD PTR -12+[ebp], ecx
$L74327:
	mov	edx, DWORD PTR -12+[ebp]
	mov	DWORD PTR -8+[ebp], edx
$L74329:
	mov	eax, DWORD PTR -8+[ebp]
	mov	DWORD PTR -4+[ebp], eax
$L74331:
	mov	ecx, DWORD PTR -4+[ebp]
	mov	DWORD PTR -52+[ebp], ecx
	jmp	SHORT $L74332
$L74307:
	mov	DWORD PTR -52+[ebp], 2
$L74332:
	mov	edx, DWORD PTR -52+[ebp]
	mov	DWORD PTR -56+[ebp], edx
	jmp	SHORT $L74333
$L74306:
	mov	DWORD PTR -56+[ebp], 0
$L74333:
	mov	eax, DWORD PTR -56+[ebp]

; 95   : }

	mov	esp, ebp
	pop	ebp
	ret	0
_qry_parse_field_modifier ENDP
_TEXT	ENDS
PUBLIC	_qry_copy_filter
EXTRN	_dynbuf_add:NEAR
EXTRN	_dyntab_cell:NEAR
EXTRN	_memcpy:NEAR
EXTRN	_dyntab_copy:NEAR
EXTRN	_err_add_context:NEAR
EXTRN	_err_clear:NEAR
_DATA	SEGMENT
	ORG $+1
$SG70262 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70271 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70276 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70281 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70286 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70291 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70296 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70301 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70306 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70315 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70321 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70327 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70332 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70337 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70342 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70343 DB	'D:\Travail\ABI\EVA\V4.0\CGI\Brunix-2016\qry_build.c', 00H
$SG70344 DB	'qry_copy_filter', 00H
$SG70346 DB	'D:\Travail\ABI\EVA\V4.0\CGI\Brunix-2016\qry_build.c', 00H
$SG70347 DB	'qry_copy_filter', 00H
_DATA	ENDS
_TEXT	SEGMENT
_cntxt$ = 8
_dest$ = 12
_src$ = 16
_i$ = -4
_j$ = -8
_qry_copy_filter PROC NEAR

; 107  : ){

	push	ebp
	mov	ebp, esp
	sub	esp, 8

; 108  : 	unsigned long i, j;
; 109  : 	if(!src || !dest) RETURN_OK;

	cmp	DWORD PTR _src$[ebp], 0
	je	SHORT $L70255
	cmp	DWORD PTR _dest$[ebp], 0
	jne	SHORT $L70254
$L70255:
	jmp	$eva_noerr$70256
$L70254:

; 110  : 	qry_build_free(dest);

	mov	eax, DWORD PTR _dest$[ebp]
	push	eax
	call	_qry_build_free
	add	esp, 4

; 111  : 	memcpy(dest, src, sizeof(dest[0]));

	push	4456					; 00001168H
	mov	ecx, DWORD PTR _src$[ebp]
	push	ecx
	mov	edx, DWORD PTR _dest$[ebp]
	push	edx
	call	_memcpy
	add	esp, 12					; 0000000cH

; 112  : 	for(j = 0; j < src->name.nbrows; j++) DYNTAB_ADD_CELL(&dest->name, j, 0, &src->name, j, 0);

	mov	DWORD PTR _j$[ebp], 0
	jmp	SHORT $L70257
$L70258:
	mov	eax, DWORD PTR _j$[ebp]
	add	eax, 1
	mov	DWORD PTR _j$[ebp], eax
$L70257:
	mov	ecx, DWORD PTR _src$[ebp]
	mov	edx, DWORD PTR _j$[ebp]
	cmp	edx, DWORD PTR [ecx]
	jae	SHORT $L70259
	push	1
	push	0
	mov	eax, DWORD PTR _j$[ebp]
	push	eax
	mov	ecx, DWORD PTR _src$[ebp]
	push	ecx
	call	_dyntab_cell
	add	esp, 12					; 0000000cH
	push	eax
	push	0
	mov	edx, DWORD PTR _j$[ebp]
	push	edx
	mov	eax, DWORD PTR _dest$[ebp]
	push	eax
	call	_dyntab_copy
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L70260
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29872], OFFSET FLAT:$SG70262
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 112		; 00000070H
	jmp	$eva_err$70263
$L70260:
	jmp	SHORT $L70258
$L70259:

; 113  : #define COPY_BUF(buf) dest->buf = NULL; DYNBUF_ADD_BUF(&dest->buf, src->buf, NO_CONV)
; 114  : #define COPY_TAB(tab) \
; 115  : 				memset(&dest->tab, 0, sizeof(dest->tab)); \
; 116  : 				for(j = 0; j < src->tab.nbrows; j++) \
; 117  : 					DYNTAB_ADD_CELL(&dest->tab, j, 0, &src->tab, j, 0)
; 118  : 	COPY_TAB(name);

	push	20					; 00000014H
	push	0
	mov	eax, DWORD PTR _dest$[ebp]
	push	eax
	call	_memset
	add	esp, 12					; 0000000cH
	mov	DWORD PTR _j$[ebp], 0
	jmp	SHORT $L70266
$L70267:
	mov	ecx, DWORD PTR _j$[ebp]
	add	ecx, 1
	mov	DWORD PTR _j$[ebp], ecx
$L70266:
	mov	edx, DWORD PTR _src$[ebp]
	mov	eax, DWORD PTR _j$[ebp]
	cmp	eax, DWORD PTR [edx]
	jae	SHORT $L70268
	push	1
	push	0
	mov	ecx, DWORD PTR _j$[ebp]
	push	ecx
	mov	edx, DWORD PTR _src$[ebp]
	push	edx
	call	_dyntab_cell
	add	esp, 12					; 0000000cH
	push	eax
	push	0
	mov	eax, DWORD PTR _j$[ebp]
	push	eax
	mov	ecx, DWORD PTR _dest$[ebp]
	push	ecx
	call	_dyntab_copy
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L70269
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29872], OFFSET FLAT:$SG70271
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 118		; 00000076H
	jmp	$eva_err$70263
$L70269:
	jmp	SHORT $L70267
$L70268:

; 119  : 	COPY_BUF(select);

	mov	ecx, DWORD PTR _dest$[ebp]
	mov	DWORD PTR [ecx+28], 0
	mov	edx, DWORD PTR _src$[ebp]
	cmp	DWORD PTR [edx+28], 0
	je	SHORT $L70274
	push	0
	push	0
	mov	eax, DWORD PTR _src$[ebp]
	mov	ecx, DWORD PTR [eax+28]
	mov	edx, DWORD PTR [ecx+4]
	push	edx
	mov	eax, DWORD PTR _src$[ebp]
	mov	ecx, DWORD PTR [eax+28]
	add	ecx, 8
	push	ecx
	mov	edx, DWORD PTR _dest$[ebp]
	add	edx, 28					; 0000001cH
	push	edx
	call	_dynbuf_add
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L70274
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29872], OFFSET FLAT:$SG70276
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 119		; 00000077H
	jmp	$eva_err$70263
$L70274:

; 120  : 	COPY_BUF(optselect);

	mov	edx, DWORD PTR _dest$[ebp]
	mov	DWORD PTR [edx+32], 0
	mov	eax, DWORD PTR _src$[ebp]
	cmp	DWORD PTR [eax+32], 0
	je	SHORT $L70279
	push	0
	push	0
	mov	ecx, DWORD PTR _src$[ebp]
	mov	edx, DWORD PTR [ecx+32]
	mov	eax, DWORD PTR [edx+4]
	push	eax
	mov	ecx, DWORD PTR _src$[ebp]
	mov	edx, DWORD PTR [ecx+32]
	add	edx, 8
	push	edx
	mov	eax, DWORD PTR _dest$[ebp]
	add	eax, 32					; 00000020H
	push	eax
	call	_dynbuf_add
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L70279
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29872], OFFSET FLAT:$SG70281
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 120		; 00000078H
	jmp	$eva_err$70263
$L70279:

; 121  : 	COPY_BUF(join);

	mov	eax, DWORD PTR _dest$[ebp]
	mov	DWORD PTR [eax+36], 0
	mov	ecx, DWORD PTR _src$[ebp]
	cmp	DWORD PTR [ecx+36], 0
	je	SHORT $L70284
	push	0
	push	0
	mov	edx, DWORD PTR _src$[ebp]
	mov	eax, DWORD PTR [edx+36]
	mov	ecx, DWORD PTR [eax+4]
	push	ecx
	mov	edx, DWORD PTR _src$[ebp]
	mov	eax, DWORD PTR [edx+36]
	add	eax, 8
	push	eax
	mov	ecx, DWORD PTR _dest$[ebp]
	add	ecx, 36					; 00000024H
	push	ecx
	call	_dynbuf_add
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L70284
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29872], OFFSET FLAT:$SG70286
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 121		; 00000079H
	jmp	$eva_err$70263
$L70284:

; 122  : 	COPY_BUF(where);

	mov	ecx, DWORD PTR _dest$[ebp]
	mov	DWORD PTR [ecx+40], 0
	mov	edx, DWORD PTR _src$[ebp]
	cmp	DWORD PTR [edx+40], 0
	je	SHORT $L70289
	push	0
	push	0
	mov	eax, DWORD PTR _src$[ebp]
	mov	ecx, DWORD PTR [eax+40]
	mov	edx, DWORD PTR [ecx+4]
	push	edx
	mov	eax, DWORD PTR _src$[ebp]
	mov	ecx, DWORD PTR [eax+40]
	add	ecx, 8
	push	ecx
	mov	edx, DWORD PTR _dest$[ebp]
	add	edx, 40					; 00000028H
	push	edx
	call	_dynbuf_add
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L70289
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29872], OFFSET FLAT:$SG70291
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 122		; 0000007aH
	jmp	$eva_err$70263
$L70289:

; 123  : 	COPY_BUF(groupfn);

	mov	edx, DWORD PTR _dest$[ebp]
	mov	DWORD PTR [edx+44], 0
	mov	eax, DWORD PTR _src$[ebp]
	cmp	DWORD PTR [eax+44], 0
	je	SHORT $L70294
	push	0
	push	0
	mov	ecx, DWORD PTR _src$[ebp]
	mov	edx, DWORD PTR [ecx+44]
	mov	eax, DWORD PTR [edx+4]
	push	eax
	mov	ecx, DWORD PTR _src$[ebp]
	mov	edx, DWORD PTR [ecx+44]
	add	edx, 8
	push	edx
	mov	eax, DWORD PTR _dest$[ebp]
	add	eax, 44					; 0000002cH
	push	eax
	call	_dynbuf_add
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L70294
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29872], OFFSET FLAT:$SG70296
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 123		; 0000007bH
	jmp	$eva_err$70263
$L70294:

; 124  : 	COPY_BUF(having);

	mov	eax, DWORD PTR _dest$[ebp]
	mov	DWORD PTR [eax+48], 0
	mov	ecx, DWORD PTR _src$[ebp]
	cmp	DWORD PTR [ecx+48], 0
	je	SHORT $L70299
	push	0
	push	0
	mov	edx, DWORD PTR _src$[ebp]
	mov	eax, DWORD PTR [edx+48]
	mov	ecx, DWORD PTR [eax+4]
	push	ecx
	mov	edx, DWORD PTR _src$[ebp]
	mov	eax, DWORD PTR [edx+48]
	add	eax, 8
	push	eax
	mov	ecx, DWORD PTR _dest$[ebp]
	add	ecx, 48					; 00000030H
	push	ecx
	call	_dynbuf_add
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L70299
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29872], OFFSET FLAT:$SG70301
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 124		; 0000007cH
	jmp	$eva_err$70263
$L70299:

; 125  : 	COPY_BUF(orderby);

	mov	ecx, DWORD PTR _dest$[ebp]
	mov	DWORD PTR [ecx+52], 0
	mov	edx, DWORD PTR _src$[ebp]
	cmp	DWORD PTR [edx+52], 0
	je	SHORT $L70304
	push	0
	push	0
	mov	eax, DWORD PTR _src$[ebp]
	mov	ecx, DWORD PTR [eax+52]
	mov	edx, DWORD PTR [ecx+4]
	push	edx
	mov	eax, DWORD PTR _src$[ebp]
	mov	ecx, DWORD PTR [eax+52]
	add	ecx, 8
	push	ecx
	mov	edx, DWORD PTR _dest$[ebp]
	add	edx, 52					; 00000034H
	push	edx
	call	_dynbuf_add
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L70304
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29872], OFFSET FLAT:$SG70306
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 125		; 0000007dH
	jmp	$eva_err$70263
$L70304:

; 126  : 	for(i = 0; i < sizeof(dest->node)/sizeof(dest->node[0]); i++)

	mov	DWORD PTR _i$[ebp], 0
	jmp	SHORT $L70307
$L70308:
	mov	edx, DWORD PTR _i$[ebp]
	add	edx, 1
	mov	DWORD PTR _i$[ebp], edx
$L70307:
	cmp	DWORD PTR _i$[ebp], 32			; 00000020H
	jae	$eva_noerr$70256

; 128  : 		COPY_TAB(node[i].field);

	push	20					; 00000014H
	push	0
	mov	eax, DWORD PTR _i$[ebp]
	imul	eax, 136				; 00000088H
	mov	ecx, DWORD PTR _dest$[ebp]
	lea	edx, DWORD PTR [ecx+eax+72]
	push	edx
	call	_memset
	add	esp, 12					; 0000000cH
	mov	DWORD PTR _j$[ebp], 0
	jmp	SHORT $L70310
$L70311:
	mov	eax, DWORD PTR _j$[ebp]
	add	eax, 1
	mov	DWORD PTR _j$[ebp], eax
$L70310:
	mov	ecx, DWORD PTR _i$[ebp]
	imul	ecx, 136				; 00000088H
	mov	edx, DWORD PTR _src$[ebp]
	mov	eax, DWORD PTR _j$[ebp]
	cmp	eax, DWORD PTR [edx+ecx+72]
	jae	SHORT $L70312
	push	1
	push	0
	mov	ecx, DWORD PTR _j$[ebp]
	push	ecx
	mov	edx, DWORD PTR _i$[ebp]
	imul	edx, 136				; 00000088H
	mov	eax, DWORD PTR _src$[ebp]
	lea	ecx, DWORD PTR [eax+edx+72]
	push	ecx
	call	_dyntab_cell
	add	esp, 12					; 0000000cH
	push	eax
	push	0
	mov	edx, DWORD PTR _j$[ebp]
	push	edx
	mov	eax, DWORD PTR _i$[ebp]
	imul	eax, 136				; 00000088H
	mov	ecx, DWORD PTR _dest$[ebp]
	lea	edx, DWORD PTR [ecx+eax+72]
	push	edx
	call	_dyntab_copy
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L70313
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29872], OFFSET FLAT:$SG70315
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 128		; 00000080H
	jmp	$eva_err$70263
$L70313:
	jmp	$L70311
$L70312:

; 129  : 		COPY_TAB(node[i].value);

	push	20					; 00000014H
	push	0
	mov	edx, DWORD PTR _i$[ebp]
	imul	edx, 136				; 00000088H
	mov	eax, DWORD PTR _dest$[ebp]
	lea	ecx, DWORD PTR [eax+edx+104]
	push	ecx
	call	_memset
	add	esp, 12					; 0000000cH
	mov	DWORD PTR _j$[ebp], 0
	jmp	SHORT $L70316
$L70317:
	mov	edx, DWORD PTR _j$[ebp]
	add	edx, 1
	mov	DWORD PTR _j$[ebp], edx
$L70316:
	mov	eax, DWORD PTR _i$[ebp]
	imul	eax, 136				; 00000088H
	mov	ecx, DWORD PTR _src$[ebp]
	mov	edx, DWORD PTR _j$[ebp]
	cmp	edx, DWORD PTR [ecx+eax+104]
	jae	SHORT $L70318
	push	1
	push	0
	mov	eax, DWORD PTR _j$[ebp]
	push	eax
	mov	ecx, DWORD PTR _i$[ebp]
	imul	ecx, 136				; 00000088H
	mov	edx, DWORD PTR _src$[ebp]
	lea	eax, DWORD PTR [edx+ecx+104]
	push	eax
	call	_dyntab_cell
	add	esp, 12					; 0000000cH
	push	eax
	push	0
	mov	ecx, DWORD PTR _j$[ebp]
	push	ecx
	mov	edx, DWORD PTR _i$[ebp]
	imul	edx, 136				; 00000088H
	mov	eax, DWORD PTR _dest$[ebp]
	lea	ecx, DWORD PTR [eax+edx+104]
	push	ecx
	call	_dyntab_copy
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L70319
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29872], OFFSET FLAT:$SG70321
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 129		; 00000081H
	jmp	$eva_err$70263
$L70319:
	jmp	$L70317
$L70318:

; 130  : 		COPY_TAB(node[i].idobjmatch);

	push	20					; 00000014H
	push	0
	mov	ecx, DWORD PTR _i$[ebp]
	imul	ecx, 136				; 00000088H
	mov	edx, DWORD PTR _dest$[ebp]
	lea	eax, DWORD PTR [edx+ecx+168]
	push	eax
	call	_memset
	add	esp, 12					; 0000000cH
	mov	DWORD PTR _j$[ebp], 0
	jmp	SHORT $L70322
$L70323:
	mov	ecx, DWORD PTR _j$[ebp]
	add	ecx, 1
	mov	DWORD PTR _j$[ebp], ecx
$L70322:
	mov	edx, DWORD PTR _i$[ebp]
	imul	edx, 136				; 00000088H
	mov	eax, DWORD PTR _src$[ebp]
	mov	ecx, DWORD PTR _j$[ebp]
	cmp	ecx, DWORD PTR [eax+edx+168]
	jae	SHORT $L70324
	push	1
	push	0
	mov	edx, DWORD PTR _j$[ebp]
	push	edx
	mov	eax, DWORD PTR _i$[ebp]
	imul	eax, 136				; 00000088H
	mov	ecx, DWORD PTR _src$[ebp]
	lea	edx, DWORD PTR [ecx+eax+168]
	push	edx
	call	_dyntab_cell
	add	esp, 12					; 0000000cH
	push	eax
	push	0
	mov	eax, DWORD PTR _j$[ebp]
	push	eax
	mov	ecx, DWORD PTR _i$[ebp]
	imul	ecx, 136				; 00000088H
	mov	edx, DWORD PTR _dest$[ebp]
	lea	eax, DWORD PTR [edx+ecx+168]
	push	eax
	call	_dyntab_copy
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L70325
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29872], OFFSET FLAT:$SG70327
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 130		; 00000082H
	jmp	$eva_err$70263
$L70325:
	jmp	$L70323
$L70324:

; 131  : 		COPY_BUF(node[i].whocr);

	mov	eax, DWORD PTR _i$[ebp]
	imul	eax, 136				; 00000088H
	mov	ecx, DWORD PTR _dest$[ebp]
	mov	DWORD PTR [ecx+eax+188], 0
	mov	edx, DWORD PTR _i$[ebp]
	imul	edx, 136				; 00000088H
	mov	eax, DWORD PTR _src$[ebp]
	cmp	DWORD PTR [eax+edx+188], 0
	je	SHORT $L70330
	push	0
	push	0
	mov	ecx, DWORD PTR _i$[ebp]
	imul	ecx, 136				; 00000088H
	mov	edx, DWORD PTR _src$[ebp]
	mov	eax, DWORD PTR [edx+ecx+188]
	mov	ecx, DWORD PTR [eax+4]
	push	ecx
	mov	edx, DWORD PTR _i$[ebp]
	imul	edx, 136				; 00000088H
	mov	eax, DWORD PTR _src$[ebp]
	mov	ecx, DWORD PTR [eax+edx+188]
	add	ecx, 8
	push	ecx
	mov	edx, DWORD PTR _i$[ebp]
	imul	edx, 136				; 00000088H
	mov	eax, DWORD PTR _dest$[ebp]
	lea	ecx, DWORD PTR [eax+edx+188]
	push	ecx
	call	_dynbuf_add
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L70330
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29872], OFFSET FLAT:$SG70332
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 131		; 00000083H
	jmp	$eva_err$70263
$L70330:

; 132  : 		COPY_BUF(node[i].whodel);

	mov	ecx, DWORD PTR _i$[ebp]
	imul	ecx, 136				; 00000088H
	mov	edx, DWORD PTR _dest$[ebp]
	mov	DWORD PTR [edx+ecx+192], 0
	mov	eax, DWORD PTR _i$[ebp]
	imul	eax, 136				; 00000088H
	mov	ecx, DWORD PTR _src$[ebp]
	cmp	DWORD PTR [ecx+eax+192], 0
	je	SHORT $L70335
	push	0
	push	0
	mov	edx, DWORD PTR _i$[ebp]
	imul	edx, 136				; 00000088H
	mov	eax, DWORD PTR _src$[ebp]
	mov	ecx, DWORD PTR [eax+edx+192]
	mov	edx, DWORD PTR [ecx+4]
	push	edx
	mov	eax, DWORD PTR _i$[ebp]
	imul	eax, 136				; 00000088H
	mov	ecx, DWORD PTR _src$[ebp]
	mov	edx, DWORD PTR [ecx+eax+192]
	add	edx, 8
	push	edx
	mov	eax, DWORD PTR _i$[ebp]
	imul	eax, 136				; 00000088H
	mov	ecx, DWORD PTR _dest$[ebp]
	lea	edx, DWORD PTR [ecx+eax+192]
	push	edx
	call	_dynbuf_add
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L70335
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29872], OFFSET FLAT:$SG70337
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 132		; 00000084H
	jmp	$eva_err$70263
$L70335:

; 133  : 		COPY_BUF(node[i].cond);

	mov	edx, DWORD PTR _i$[ebp]
	imul	edx, 136				; 00000088H
	mov	eax, DWORD PTR _dest$[ebp]
	mov	DWORD PTR [eax+edx+196], 0
	mov	ecx, DWORD PTR _i$[ebp]
	imul	ecx, 136				; 00000088H
	mov	edx, DWORD PTR _src$[ebp]
	cmp	DWORD PTR [edx+ecx+196], 0
	je	SHORT $L70340
	push	0
	push	0
	mov	eax, DWORD PTR _i$[ebp]
	imul	eax, 136				; 00000088H
	mov	ecx, DWORD PTR _src$[ebp]
	mov	edx, DWORD PTR [ecx+eax+196]
	mov	eax, DWORD PTR [edx+4]
	push	eax
	mov	ecx, DWORD PTR _i$[ebp]
	imul	ecx, 136				; 00000088H
	mov	edx, DWORD PTR _src$[ebp]
	mov	eax, DWORD PTR [edx+ecx+196]
	add	eax, 8
	push	eax
	mov	ecx, DWORD PTR _i$[ebp]
	imul	ecx, 136				; 00000088H
	mov	edx, DWORD PTR _dest$[ebp]
	lea	eax, DWORD PTR [edx+ecx+196]
	push	eax
	call	_dynbuf_add
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L70340
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29872], OFFSET FLAT:$SG70342
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 133		; 00000085H
	jmp	SHORT $eva_err$70263
$L70340:

; 134  : 	}

	jmp	$L70308
$eva_noerr$70256:

; 135  : #undef COPY_BUF
; 136  : 
; 137  : 	RETURN_OK_CLEANUP;

	push	0
	push	OFFSET FLAT:$SG70343
	push	OFFSET FLAT:$SG70344
	mov	eax, DWORD PTR _cntxt$[ebp]
	push	eax
	call	_err_clear
	add	esp, 16					; 00000010H
$eva_err$70263:
	mov	ecx, DWORD PTR _cntxt$[ebp]
	cmp	DWORD PTR [ecx+29872], 0
	je	SHORT $L70345
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	eax, DWORD PTR [edx+29900]
	push	eax
	push	OFFSET FLAT:$SG70346
	push	OFFSET FLAT:$SG70347
	mov	ecx, DWORD PTR _cntxt$[ebp]
	push	ecx
	call	_err_add_context
	add	esp, 16					; 00000010H
$L70345:
	mov	edx, DWORD PTR _cntxt$[ebp]
	xor	eax, eax
	cmp	DWORD PTR [edx+29872], 0
	setne	al

; 138  : }

	mov	esp, ebp
	pop	ebp
	ret	0
_qry_copy_filter ENDP
_TEXT	ENDS
PUBLIC	_qry_add_valnode_field
EXTRN	_dynbuf_add_int:NEAR
EXTRN	_dynbuf_add3_int:NEAR
EXTRN	_strchr:NEAR
_DATA	SEGMENT
$SG70364 DB	'AS', 00H
	ORG $+1
$SG70369 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70373 DB	'(', 00H
	ORG $+2
$SG70375 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70382 DB	'.IdWhoCr', 00H
	ORG $+3
$SG70383 DB	'TLink', 00H
	ORG $+2
$SG70385 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70388 DB	'.DateCr', 00H
$SG70389 DB	'TLink', 00H
	ORG $+2
$SG70391 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70394 DB	'.IdWhoDel', 00H
	ORG $+2
$SG70395 DB	'TLink', 00H
	ORG $+2
$SG70397 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70400 DB	'.DateDel', 00H
	ORG $+3
$SG70401 DB	'TLink', 00H
	ORG $+2
$SG70403 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70406 DB	'.IdRelObj', 00H
	ORG $+2
$SG70407 DB	'TLink', 00H
	ORG $+2
$SG70409 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70412 DB	'.Pkey', 00H
	ORG $+2
$SG70413 DB	'TLink', 00H
	ORG $+2
$SG70415 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70418 DB	'.IdObj', 00H
	ORG $+1
$SG70419 DB	'TLink', 00H
	ORG $+2
$SG70421 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70424 DB	'.Num', 00H
	ORG $+3
$SG70425 DB	'TLink', 00H
	ORG $+2
$SG70427 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70430 DB	'.Line', 00H
	ORG $+2
$SG70431 DB	'TLink', 00H
	ORG $+2
$SG70433 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70436 DB	'.IdValue', 00H
	ORG $+3
$SG70437 DB	'TLink', 00H
	ORG $+2
$SG70439 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70442 DB	'.IdField', 00H
	ORG $+3
$SG70443 DB	'TLink', 00H
	ORG $+2
$SG70445 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70449 DB	' ON TVal', 00H
	ORG $+3
$SG70450 DB	'INNER JOIN TVal AS TVal', 00H
$SG70452 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70455 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70457 DB	'.IdValue ', 0aH, 00H
	ORG $+1
$SG70458 DB	'.IdValue=TLink', 00H
	ORG $+1
$SG70460 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70462 DB	'.TxtValue', 00H
	ORG $+2
$SG70463 DB	'TVal', 00H
	ORG $+3
$SG70465 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70469 DB	' ON TField', 00H
	ORG $+1
$SG70470 DB	'INNER JOIN TVal AS TField', 00H
	ORG $+2
$SG70472 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70475 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70477 DB	'.IdField ', 0aH, 00H
	ORG $+1
$SG70478 DB	'.IdValue=TLink', 00H
	ORG $+1
$SG70480 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70482 DB	'.TxtValue', 00H
	ORG $+2
$SG70483 DB	'TField', 00H
	ORG $+1
$SG70485 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70489 DB	' ON TVal', 00H
	ORG $+3
$SG70490 DB	'LEFT JOIN TVal AS TVal', 00H
	ORG $+1
$SG70492 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70495 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70497 DB	'.IdValue ', 0aH, 00H
	ORG $+1
$SG70498 DB	'.IdValue=TLink', 00H
	ORG $+1
$SG70500 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70502 DB	'.TxtValue IS NULL,', 00H
	ORG $+1
$SG70503 DB	'IF(TVal', 00H
$SG70505 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70507 DB	'.IdRelObj,', 00H
	ORG $+1
$SG70508 DB	'TLink', 00H
	ORG $+2
$SG70510 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70512 DB	'.TxtValue)', 00H
	ORG $+1
$SG70513 DB	'TVal', 00H
	ORG $+3
$SG70515 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70518 DB	'Invalid value modifier', 00H
	ORG $+1
$SG70521 DB	')', 00H
	ORG $+2
$SG70523 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70525 DB	'D:\Travail\ABI\EVA\V4.0\CGI\Brunix-2016\qry_build.c', 00H
$SG70526 DB	'qry_add_valnode_field', 00H
	ORG $+2
$SG70528 DB	'D:\Travail\ABI\EVA\V4.0\CGI\Brunix-2016\qry_build.c', 00H
$SG70529 DB	'qry_add_valnode_field', 00H
_DATA	ENDS
_TEXT	SEGMENT
_cntxt$ = 8
_flt$ = 12
_modif$ = 16
_valjoin$ = -4
_qry_add_valnode_field PROC NEAR

; 153  : ){

	push	ebp
	mov	ebp, esp
	sub	esp, 8

; 154  : 	unsigned long valjoin = flt->valnode->curjoin;

	mov	eax, DWORD PTR _flt$[ebp]
	mov	ecx, DWORD PTR [eax+4428]
	mov	edx, DWORD PTR [ecx+60]
	mov	DWORD PTR _valjoin$[ebp], edx

; 155  : 
; 156  : 	/* Optimize modifier */
; 157  : 	if(modif == F_None)

	cmp	DWORD PTR _modif$[ebp], 0
	jne	SHORT $L70363

; 159  : 		if(flt->valnode > flt->node && flt->node[flt->valnode->srcjoin].rel == RelReverse)

	mov	eax, DWORD PTR _flt$[ebp]
	add	eax, 72					; 00000048H
	mov	ecx, DWORD PTR _flt$[ebp]
	cmp	DWORD PTR [ecx+4428], eax
	jbe	SHORT $L70361
	mov	edx, DWORD PTR _flt$[ebp]
	mov	eax, DWORD PTR [edx+4428]
	mov	ecx, DWORD PTR [eax+56]
	imul	ecx, 136				; 00000088H
	mov	edx, DWORD PTR _flt$[ebp]
	cmp	DWORD PTR [edx+ecx+124], 2
	jne	SHORT $L70361

; 160  : 			modif = F_Obj;

	mov	DWORD PTR _modif$[ebp], 2

; 161  : 		else if(flt->groupfn && strchr("AS", *flt->groupfn->data))

	jmp	SHORT $L70363
$L70361:
	mov	eax, DWORD PTR _flt$[ebp]
	cmp	DWORD PTR [eax+44], 0
	je	SHORT $L70363
	mov	ecx, DWORD PTR _flt$[ebp]
	mov	edx, DWORD PTR [ecx+44]
	movsx	eax, BYTE PTR [edx+8]
	push	eax
	push	OFFSET FLAT:$SG70364
	call	_strchr
	add	esp, 8
	test	eax, eax
	je	SHORT $L70363

; 162  : 			modif = F_Value;

	mov	DWORD PTR _modif$[ebp], 6
$L70363:

; 164  : 
; 165  : 	/* Parse modifier */
; 166  : 	if(flt->groupfn) DYNBUF_ADD_BUF(&flt->select, flt->groupfn, NO_CONV);

	mov	ecx, DWORD PTR _flt$[ebp]
	cmp	DWORD PTR [ecx+44], 0
	je	SHORT $L70367
	mov	edx, DWORD PTR _flt$[ebp]
	cmp	DWORD PTR [edx+44], 0
	je	SHORT $L70367
	push	0
	push	0
	mov	eax, DWORD PTR _flt$[ebp]
	mov	ecx, DWORD PTR [eax+44]
	mov	edx, DWORD PTR [ecx+4]
	push	edx
	mov	eax, DWORD PTR _flt$[ebp]
	mov	ecx, DWORD PTR [eax+44]
	add	ecx, 8
	push	ecx
	mov	edx, DWORD PTR _flt$[ebp]
	add	edx, 28					; 0000001cH
	push	edx
	call	_dynbuf_add
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L70367
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29872], OFFSET FLAT:$SG70369
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 166		; 000000a6H
	jmp	$eva_err$70370
$L70367:

; 167  : 	DYNBUF_ADD_STR(&flt->select, "(");

	push	0
	push	0
	push	1
	push	OFFSET FLAT:$SG70373
	mov	edx, DWORD PTR _flt$[ebp]
	add	edx, 28					; 0000001cH
	push	edx
	call	_dynbuf_add
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L70372
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29872], OFFSET FLAT:$SG70375
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 167		; 000000a7H
	jmp	$eva_err$70370
$L70372:

; 168  : 	switch(modif)
; 169  : 	{

	mov	edx, DWORD PTR _modif$[ebp]
	mov	DWORD PTR -8+[ebp], edx
	cmp	DWORD PTR -8+[ebp], 13			; 0000000dH
	ja	$L70516
	mov	eax, DWORD PTR -8+[ebp]
	jmp	DWORD PTR $L74336[eax*4]
$L70380:

; 170  : 	case F_WhoCr: DYNBUF_ADD3_INT(&flt->select, "TLink", valjoin, ".IdWhoCr"); break;

	push	8
	push	OFFSET FLAT:$SG70382
	mov	ecx, DWORD PTR _valjoin$[ebp]
	push	ecx
	push	5
	push	OFFSET FLAT:$SG70383
	mov	edx, DWORD PTR _flt$[ebp]
	add	edx, 28					; 0000001cH
	push	edx
	call	_dynbuf_add3_int
	add	esp, 24					; 00000018H
	test	eax, eax
	je	SHORT $L70381
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29872], OFFSET FLAT:$SG70385
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 170		; 000000aaH
	jmp	$eva_err$70370
$L70381:
	jmp	$L70377
$L70386:

; 171  : 	case F_DateCr: DYNBUF_ADD3_INT(&flt->select, "TLink", valjoin, ".DateCr"); break;

	push	7
	push	OFFSET FLAT:$SG70388
	mov	edx, DWORD PTR _valjoin$[ebp]
	push	edx
	push	5
	push	OFFSET FLAT:$SG70389
	mov	eax, DWORD PTR _flt$[ebp]
	add	eax, 28					; 0000001cH
	push	eax
	call	_dynbuf_add3_int
	add	esp, 24					; 00000018H
	test	eax, eax
	je	SHORT $L70387
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29872], OFFSET FLAT:$SG70391
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 171		; 000000abH
	jmp	$eva_err$70370
$L70387:
	jmp	$L70377
$L70392:

; 172  : 	case F_WhoDel: DYNBUF_ADD3_INT(&flt->select, "TLink", valjoin, ".IdWhoDel"); break;

	push	9
	push	OFFSET FLAT:$SG70394
	mov	eax, DWORD PTR _valjoin$[ebp]
	push	eax
	push	5
	push	OFFSET FLAT:$SG70395
	mov	ecx, DWORD PTR _flt$[ebp]
	add	ecx, 28					; 0000001cH
	push	ecx
	call	_dynbuf_add3_int
	add	esp, 24					; 00000018H
	test	eax, eax
	je	SHORT $L70393
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29872], OFFSET FLAT:$SG70397
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 172		; 000000acH
	jmp	$eva_err$70370
$L70393:
	jmp	$L70377
$L70398:

; 173  : 	case F_DateDel: DYNBUF_ADD3_INT(&flt->select, "TLink", valjoin, ".DateDel"); break;

	push	8
	push	OFFSET FLAT:$SG70400
	mov	ecx, DWORD PTR _valjoin$[ebp]
	push	ecx
	push	5
	push	OFFSET FLAT:$SG70401
	mov	edx, DWORD PTR _flt$[ebp]
	add	edx, 28					; 0000001cH
	push	edx
	call	_dynbuf_add3_int
	add	esp, 24					; 00000018H
	test	eax, eax
	je	SHORT $L70399
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29872], OFFSET FLAT:$SG70403
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 173		; 000000adH
	jmp	$eva_err$70370
$L70399:
	jmp	$L70377
$L70404:

; 174  : 	case F_RelObj: DYNBUF_ADD3_INT(&flt->select, "TLink", valjoin, ".IdRelObj"); break;

	push	9
	push	OFFSET FLAT:$SG70406
	mov	edx, DWORD PTR _valjoin$[ebp]
	push	edx
	push	5
	push	OFFSET FLAT:$SG70407
	mov	eax, DWORD PTR _flt$[ebp]
	add	eax, 28					; 0000001cH
	push	eax
	call	_dynbuf_add3_int
	add	esp, 24					; 00000018H
	test	eax, eax
	je	SHORT $L70405
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29872], OFFSET FLAT:$SG70409
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 174		; 000000aeH
	jmp	$eva_err$70370
$L70405:
	jmp	$L70377
$L70410:

; 175  : 	case F_Pkey: DYNBUF_ADD3_INT(&flt->select, "TLink", valjoin, ".Pkey"); break;

	push	5
	push	OFFSET FLAT:$SG70412
	mov	eax, DWORD PTR _valjoin$[ebp]
	push	eax
	push	5
	push	OFFSET FLAT:$SG70413
	mov	ecx, DWORD PTR _flt$[ebp]
	add	ecx, 28					; 0000001cH
	push	ecx
	call	_dynbuf_add3_int
	add	esp, 24					; 00000018H
	test	eax, eax
	je	SHORT $L70411
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29872], OFFSET FLAT:$SG70415
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 175		; 000000afH
	jmp	$eva_err$70370
$L70411:
	jmp	$L70377
$L70416:

; 176  : 	case F_Obj: DYNBUF_ADD3_INT(&flt->select, "TLink", valjoin, ".IdObj"); break;

	push	6
	push	OFFSET FLAT:$SG70418
	mov	ecx, DWORD PTR _valjoin$[ebp]
	push	ecx
	push	5
	push	OFFSET FLAT:$SG70419
	mov	edx, DWORD PTR _flt$[ebp]
	add	edx, 28					; 0000001cH
	push	edx
	call	_dynbuf_add3_int
	add	esp, 24					; 00000018H
	test	eax, eax
	je	SHORT $L70417
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29872], OFFSET FLAT:$SG70421
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 176		; 000000b0H
	jmp	$eva_err$70370
$L70417:
	jmp	$L70377
$L70422:

; 177  : 	case F_Num: DYNBUF_ADD3_INT(&flt->select, "TLink", valjoin, ".Num"); break;

	push	4
	push	OFFSET FLAT:$SG70424
	mov	edx, DWORD PTR _valjoin$[ebp]
	push	edx
	push	5
	push	OFFSET FLAT:$SG70425
	mov	eax, DWORD PTR _flt$[ebp]
	add	eax, 28					; 0000001cH
	push	eax
	call	_dynbuf_add3_int
	add	esp, 24					; 00000018H
	test	eax, eax
	je	SHORT $L70423
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29872], OFFSET FLAT:$SG70427
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 177		; 000000b1H
	jmp	$eva_err$70370
$L70423:
	jmp	$L70377
$L70428:

; 178  : 	case F_Line: DYNBUF_ADD3_INT(&flt->select, "TLink", valjoin, ".Line"); break;

	push	5
	push	OFFSET FLAT:$SG70430
	mov	eax, DWORD PTR _valjoin$[ebp]
	push	eax
	push	5
	push	OFFSET FLAT:$SG70431
	mov	ecx, DWORD PTR _flt$[ebp]
	add	ecx, 28					; 0000001cH
	push	ecx
	call	_dynbuf_add3_int
	add	esp, 24					; 00000018H
	test	eax, eax
	je	SHORT $L70429
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29872], OFFSET FLAT:$SG70433
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 178		; 000000b2H
	jmp	$eva_err$70370
$L70429:
	jmp	$L70377
$L70434:

; 179  : 	case F_IdValue: DYNBUF_ADD3_INT(&flt->select, "TLink", valjoin, ".IdValue"); break;

	push	8
	push	OFFSET FLAT:$SG70436
	mov	ecx, DWORD PTR _valjoin$[ebp]
	push	ecx
	push	5
	push	OFFSET FLAT:$SG70437
	mov	edx, DWORD PTR _flt$[ebp]
	add	edx, 28					; 0000001cH
	push	edx
	call	_dynbuf_add3_int
	add	esp, 24					; 00000018H
	test	eax, eax
	je	SHORT $L70435
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29872], OFFSET FLAT:$SG70439
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 179		; 000000b3H
	jmp	$eva_err$70370
$L70435:
	jmp	$L70377
$L70440:

; 180  : 	case F_IdField: DYNBUF_ADD3_INT(&flt->select, "TLink", valjoin, ".IdField"); break;

	push	8
	push	OFFSET FLAT:$SG70442
	mov	edx, DWORD PTR _valjoin$[ebp]
	push	edx
	push	5
	push	OFFSET FLAT:$SG70443
	mov	eax, DWORD PTR _flt$[ebp]
	add	eax, 28					; 0000001cH
	push	eax
	call	_dynbuf_add3_int
	add	esp, 24					; 00000018H
	test	eax, eax
	je	SHORT $L70441
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29872], OFFSET FLAT:$SG70445
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 180		; 000000b4H
	jmp	$eva_err$70370
$L70441:
	jmp	$L70377
$L70446:

; 181  : 	case F_Value:
; 182  : 		if(!flt->valnode->b_joinval)

	mov	eax, DWORD PTR _flt$[ebp]
	mov	ecx, DWORD PTR [eax+4428]
	cmp	DWORD PTR [ecx+128], 0
	jne	$L70447

; 184  : 			DYNBUF_ADD3_INT(&flt->join, "INNER JOIN TVal AS TVal", valjoin, " ON TVal")

	push	8
	push	OFFSET FLAT:$SG70449
	mov	edx, DWORD PTR _valjoin$[ebp]
	push	edx
	push	23					; 00000017H
	push	OFFSET FLAT:$SG70450
	mov	eax, DWORD PTR _flt$[ebp]
	add	eax, 36					; 00000024H
	push	eax
	call	_dynbuf_add3_int
	add	esp, 24					; 00000018H
	test	eax, eax
	je	SHORT $L70448
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29872], OFFSET FLAT:$SG70452
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 184		; 000000b8H
	jmp	$eva_err$70370
$L70448:

; 185  : 			DYNBUF_ADD_INT(&flt->join, valjoin)

	mov	eax, DWORD PTR _valjoin$[ebp]
	push	eax
	mov	ecx, DWORD PTR _flt$[ebp]
	add	ecx, 36					; 00000024H
	push	ecx
	call	_dynbuf_add_int
	add	esp, 8
	test	eax, eax
	je	SHORT $L70453
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29872], OFFSET FLAT:$SG70455
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 185		; 000000b9H
	jmp	$eva_err$70370
$L70453:

; 186  : 			DYNBUF_ADD3_INT(&flt->join, ".IdValue=TLink", valjoin, ".IdValue \n")

	push	10					; 0000000aH
	push	OFFSET FLAT:$SG70457
	mov	ecx, DWORD PTR _valjoin$[ebp]
	push	ecx
	push	14					; 0000000eH
	push	OFFSET FLAT:$SG70458
	mov	edx, DWORD PTR _flt$[ebp]
	add	edx, 36					; 00000024H
	push	edx
	call	_dynbuf_add3_int
	add	esp, 24					; 00000018H
	test	eax, eax
	je	SHORT $L70456
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29872], OFFSET FLAT:$SG70460
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 186		; 000000baH
	jmp	$eva_err$70370
$L70456:

; 187  : 			flt->valnode->b_joinval = 1;

	mov	edx, DWORD PTR _flt$[ebp]
	mov	eax, DWORD PTR [edx+4428]
	mov	DWORD PTR [eax+128], 1
$L70447:

; 189  : 		DYNBUF_ADD3_INT(&flt->select, "TVal", valjoin, ".TxtValue");

	push	9
	push	OFFSET FLAT:$SG70462
	mov	ecx, DWORD PTR _valjoin$[ebp]
	push	ecx
	push	4
	push	OFFSET FLAT:$SG70463
	mov	edx, DWORD PTR _flt$[ebp]
	add	edx, 28					; 0000001cH
	push	edx
	call	_dynbuf_add3_int
	add	esp, 24					; 00000018H
	test	eax, eax
	je	SHORT $L70461
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29872], OFFSET FLAT:$SG70465
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 189		; 000000bdH
	jmp	$eva_err$70370
$L70461:

; 190  : 		break;

	jmp	$L70377
$L70466:

; 191  : 	case F_Field:
; 192  : 		if(!flt->valnode->b_joinfld)

	mov	edx, DWORD PTR _flt$[ebp]
	mov	eax, DWORD PTR [edx+4428]
	cmp	DWORD PTR [eax+132], 0
	jne	$L70467

; 194  : 			DYNBUF_ADD3_INT(&flt->join, "INNER JOIN TVal AS TField", valjoin, " ON TField")

	push	10					; 0000000aH
	push	OFFSET FLAT:$SG70469
	mov	ecx, DWORD PTR _valjoin$[ebp]
	push	ecx
	push	25					; 00000019H
	push	OFFSET FLAT:$SG70470
	mov	edx, DWORD PTR _flt$[ebp]
	add	edx, 36					; 00000024H
	push	edx
	call	_dynbuf_add3_int
	add	esp, 24					; 00000018H
	test	eax, eax
	je	SHORT $L70468
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29872], OFFSET FLAT:$SG70472
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 194		; 000000c2H
	jmp	$eva_err$70370
$L70468:

; 195  : 			DYNBUF_ADD_INT(&flt->join, valjoin)

	mov	edx, DWORD PTR _valjoin$[ebp]
	push	edx
	mov	eax, DWORD PTR _flt$[ebp]
	add	eax, 36					; 00000024H
	push	eax
	call	_dynbuf_add_int
	add	esp, 8
	test	eax, eax
	je	SHORT $L70473
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29872], OFFSET FLAT:$SG70475
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 195		; 000000c3H
	jmp	$eva_err$70370
$L70473:

; 196  : 			DYNBUF_ADD3_INT(&flt->join, ".IdValue=TLink", valjoin, ".IdField \n")

	push	10					; 0000000aH
	push	OFFSET FLAT:$SG70477
	mov	eax, DWORD PTR _valjoin$[ebp]
	push	eax
	push	14					; 0000000eH
	push	OFFSET FLAT:$SG70478
	mov	ecx, DWORD PTR _flt$[ebp]
	add	ecx, 36					; 00000024H
	push	ecx
	call	_dynbuf_add3_int
	add	esp, 24					; 00000018H
	test	eax, eax
	je	SHORT $L70476
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29872], OFFSET FLAT:$SG70480
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 196		; 000000c4H
	jmp	$eva_err$70370
$L70476:

; 197  : 			flt->valnode->b_joinfld = 1;

	mov	ecx, DWORD PTR _flt$[ebp]
	mov	edx, DWORD PTR [ecx+4428]
	mov	DWORD PTR [edx+132], 1
$L70467:

; 199  : 		DYNBUF_ADD3_INT(&flt->select, "TField", valjoin, ".TxtValue");

	push	9
	push	OFFSET FLAT:$SG70482
	mov	eax, DWORD PTR _valjoin$[ebp]
	push	eax
	push	6
	push	OFFSET FLAT:$SG70483
	mov	ecx, DWORD PTR _flt$[ebp]
	add	ecx, 28					; 0000001cH
	push	ecx
	call	_dynbuf_add3_int
	add	esp, 24					; 00000018H
	test	eax, eax
	je	SHORT $L70481
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29872], OFFSET FLAT:$SG70485
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 199		; 000000c7H
	jmp	$eva_err$70370
$L70481:

; 200  : 		break;

	jmp	$L70377
$L70486:

; 201  : 	case F_None:
; 202  : 		if(!flt->valnode->b_joinval)

	mov	ecx, DWORD PTR _flt$[ebp]
	mov	edx, DWORD PTR [ecx+4428]
	cmp	DWORD PTR [edx+128], 0
	jne	$L70487

; 204  : 			DYNBUF_ADD3_INT(&flt->join, "LEFT JOIN TVal AS TVal", valjoin, " ON TVal")

	push	8
	push	OFFSET FLAT:$SG70489
	mov	eax, DWORD PTR _valjoin$[ebp]
	push	eax
	push	22					; 00000016H
	push	OFFSET FLAT:$SG70490
	mov	ecx, DWORD PTR _flt$[ebp]
	add	ecx, 36					; 00000024H
	push	ecx
	call	_dynbuf_add3_int
	add	esp, 24					; 00000018H
	test	eax, eax
	je	SHORT $L70488
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29872], OFFSET FLAT:$SG70492
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 204		; 000000ccH
	jmp	$eva_err$70370
$L70488:

; 205  : 			DYNBUF_ADD_INT(&flt->join, valjoin)

	mov	ecx, DWORD PTR _valjoin$[ebp]
	push	ecx
	mov	edx, DWORD PTR _flt$[ebp]
	add	edx, 36					; 00000024H
	push	edx
	call	_dynbuf_add_int
	add	esp, 8
	test	eax, eax
	je	SHORT $L70493
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29872], OFFSET FLAT:$SG70495
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 205		; 000000cdH
	jmp	$eva_err$70370
$L70493:

; 206  : 			DYNBUF_ADD3_INT(&flt->join, ".IdValue=TLink", valjoin, ".IdValue \n")

	push	10					; 0000000aH
	push	OFFSET FLAT:$SG70497
	mov	edx, DWORD PTR _valjoin$[ebp]
	push	edx
	push	14					; 0000000eH
	push	OFFSET FLAT:$SG70498
	mov	eax, DWORD PTR _flt$[ebp]
	add	eax, 36					; 00000024H
	push	eax
	call	_dynbuf_add3_int
	add	esp, 24					; 00000018H
	test	eax, eax
	je	SHORT $L70496
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29872], OFFSET FLAT:$SG70500
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 206		; 000000ceH
	jmp	$eva_err$70370
$L70496:

; 207  : 			flt->valnode->b_joinval = 1;

	mov	eax, DWORD PTR _flt$[ebp]
	mov	ecx, DWORD PTR [eax+4428]
	mov	DWORD PTR [ecx+128], 1
$L70487:

; 209  : 		DYNBUF_ADD3_INT(&flt->select, "IF(TVal", valjoin, ".TxtValue IS NULL,");

	push	18					; 00000012H
	push	OFFSET FLAT:$SG70502
	mov	edx, DWORD PTR _valjoin$[ebp]
	push	edx
	push	7
	push	OFFSET FLAT:$SG70503
	mov	eax, DWORD PTR _flt$[ebp]
	add	eax, 28					; 0000001cH
	push	eax
	call	_dynbuf_add3_int
	add	esp, 24					; 00000018H
	test	eax, eax
	je	SHORT $L70501
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29872], OFFSET FLAT:$SG70505
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 209		; 000000d1H
	jmp	$eva_err$70370
$L70501:

; 210  : 		DYNBUF_ADD3_INT(&flt->select, "TLink", valjoin, ".IdRelObj,");

	push	10					; 0000000aH
	push	OFFSET FLAT:$SG70507
	mov	eax, DWORD PTR _valjoin$[ebp]
	push	eax
	push	5
	push	OFFSET FLAT:$SG70508
	mov	ecx, DWORD PTR _flt$[ebp]
	add	ecx, 28					; 0000001cH
	push	ecx
	call	_dynbuf_add3_int
	add	esp, 24					; 00000018H
	test	eax, eax
	je	SHORT $L70506
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29872], OFFSET FLAT:$SG70510
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 210		; 000000d2H
	jmp	$eva_err$70370
$L70506:

; 211  : 		DYNBUF_ADD3_INT(&flt->select, "TVal", valjoin, ".TxtValue)");

	push	10					; 0000000aH
	push	OFFSET FLAT:$SG70512
	mov	ecx, DWORD PTR _valjoin$[ebp]
	push	ecx
	push	4
	push	OFFSET FLAT:$SG70513
	mov	edx, DWORD PTR _flt$[ebp]
	add	edx, 28					; 0000001cH
	push	edx
	call	_dynbuf_add3_int
	add	esp, 24					; 00000018H
	test	eax, eax
	je	SHORT $L70511
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29872], OFFSET FLAT:$SG70515
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 211		; 000000d3H
	jmp	SHORT $eva_err$70370
$L70511:

; 212  : 		break;

	jmp	SHORT $L70377
$L70516:

; 213  : 	default:
; 214  : 		RETURN_FILTER_ERROR("Invalid value modifier");

	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29872], OFFSET FLAT:$SG70518
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 214		; 000000d6H
	jmp	SHORT $eva_err$70370
$L70377:

; 216  : 	DYNBUF_ADD_STR(&flt->select, ")");

	push	0
	push	0
	push	1
	push	OFFSET FLAT:$SG70521
	mov	ecx, DWORD PTR _flt$[ebp]
	add	ecx, 28					; 0000001cH
	push	ecx
	call	_dynbuf_add
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L70520
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29872], OFFSET FLAT:$SG70523
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 216		; 000000d8H
	jmp	SHORT $eva_err$70370
$L70520:
$eva_noerr$70524:

; 217  : 
; 218  : 	RETURN_OK_CLEANUP;

	push	0
	push	OFFSET FLAT:$SG70525
	push	OFFSET FLAT:$SG70526
	mov	ecx, DWORD PTR _cntxt$[ebp]
	push	ecx
	call	_err_clear
	add	esp, 16					; 00000010H
$eva_err$70370:
	mov	edx, DWORD PTR _cntxt$[ebp]
	cmp	DWORD PTR [edx+29872], 0
	je	SHORT $L70527
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	ecx, DWORD PTR [eax+29900]
	push	ecx
	push	OFFSET FLAT:$SG70528
	push	OFFSET FLAT:$SG70529
	mov	edx, DWORD PTR _cntxt$[ebp]
	push	edx
	call	_err_add_context
	add	esp, 16					; 00000010H
$L70527:
	mov	eax, DWORD PTR _cntxt$[ebp]
	xor	ecx, ecx
	cmp	DWORD PTR [eax+29872], 0
	setne	cl
	mov	eax, ecx

; 219  : }

	mov	esp, ebp
	pop	ebp
	ret	0
$L74336:
	DD	$L70486
	DD	$L70410
	DD	$L70416
	DD	$L70440
	DD	$L70434
	DD	$L70466
	DD	$L70446
	DD	$L70404
	DD	$L70422
	DD	$L70428
	DD	$L70386
	DD	$L70380
	DD	$L70398
	DD	$L70392
_qry_add_valnode_field ENDP
_TEXT	ENDS
PUBLIC	_qry_add_create_del_filter
EXTRN	_qry_values_list:NEAR
EXTRN	_strcpy:NEAR
EXTRN	_dyntab_field_val:NEAR
_DATA	SEGMENT
	ORG $+2
$SG70542 DB	'_EVA_USE_OLD_VALUES', 00H
$SG70544 DB	'_EVA_FILTER_IDWHOCR', 00H
$SG70548 DB	'_EVA_CURRENTUSER', 00H
	ORG $+3
$SG70549 DB	'_EVA_CURRENT_USER', 00H
	ORG $+2
$SG70550 DB	'_EVA_CURRENTOBJ', 00H
$SG70558 DB	'D:\Travail\ABI\EVA\V4.0\CGI\Brunix-2016\qry_build.c', 00H
$SG70559 DB	'qry_add_create_del_filter', 00H
	ORG $+2
$SG70561 DB	'D:\Travail\ABI\EVA\V4.0\CGI\Brunix-2016\qry_build.c', 00H
$SG70562 DB	'qry_add_create_del_filter', 00H
_DATA	ENDS
_TEXT	SEGMENT
_cntxt$ = 8
_flt$ = 12
_flt_data$ = 16
_flthisto$ = -36
_fltwhocr$ = -32
_usergroup$ = -24
_id_obj$ = -28
_node$ = -4
_qry_add_create_del_filter PROC NEAR

; 234  : ){

	push	ebp
	mov	ebp, esp
	sub	esp, 44					; 0000002cH

; 235  : 	char *flthisto = DYNTAB_FIELD_VAL(flt_data, USE_OLD_VALUES);

	push	0
	push	-1
	push	OFFSET FLAT:$SG70542
	mov	eax, DWORD PTR _flt_data$[ebp]
	push	eax
	call	_dyntab_field_val
	add	esp, 16					; 00000010H
	mov	DWORD PTR _flthisto$[ebp], eax

; 236  : 	char *fltwhocr = DYNTAB_FIELD_VAL(flt_data, FILTER_IDWHOCR);

	push	0
	push	-1
	push	OFFSET FLAT:$SG70544
	mov	ecx, DWORD PTR _flt_data$[ebp]
	push	ecx
	call	_dyntab_field_val
	add	esp, 16					; 00000010H
	mov	DWORD PTR _fltwhocr$[ebp], eax

; 237  : 	DynTable usergroup = { 0 };

	mov	DWORD PTR _usergroup$[ebp], 0
	xor	edx, edx
	mov	DWORD PTR _usergroup$[ebp+4], edx
	mov	DWORD PTR _usergroup$[ebp+8], edx
	mov	DWORD PTR _usergroup$[ebp+12], edx
	mov	DWORD PTR _usergroup$[ebp+16], edx

; 238  : 	DynTable *id_obj = (!strcmp(fltwhocr, "_EVA_CURRENTUSER") ||
; 239  : 						!strcmp(fltwhocr, "_EVA_CURRENT_USER")) ? &cntxt->id_user :
; 240  : 						!strcmp(fltwhocr, "_EVA_CURRENTOBJ") ? &cntxt->form->id_obj : NULL;

	push	OFFSET FLAT:$SG70548
	mov	eax, DWORD PTR _fltwhocr$[ebp]
	push	eax
	call	_strcmp
	add	esp, 8
	test	eax, eax
	je	SHORT $L74338
	push	OFFSET FLAT:$SG70549
	mov	ecx, DWORD PTR _fltwhocr$[ebp]
	push	ecx
	call	_strcmp
	add	esp, 8
	test	eax, eax
	je	SHORT $L74338
	push	OFFSET FLAT:$SG70550
	mov	edx, DWORD PTR _fltwhocr$[ebp]
	push	edx
	call	_strcmp
	add	esp, 8
	test	eax, eax
	jne	SHORT $L74339
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	ecx, DWORD PTR [eax+80]
	add	ecx, 32					; 00000020H
	mov	DWORD PTR -40+[ebp], ecx
	jmp	SHORT $L74340
$L74339:
	mov	DWORD PTR -40+[ebp], 0
$L74340:
	mov	edx, DWORD PTR -40+[ebp]
	mov	DWORD PTR -44+[ebp], edx
	jmp	SHORT $L74341
$L74338:
	mov	eax, DWORD PTR _cntxt$[ebp]
	add	eax, 29408				; 000072e0H
	mov	DWORD PTR -44+[ebp], eax
$L74341:
	mov	ecx, DWORD PTR -44+[ebp]
	mov	DWORD PTR _id_obj$[ebp], ecx

; 241  : 	QryBuilNode *node = flt->node + flt->nbnode;

	mov	edx, DWORD PTR _flt$[ebp]
	mov	eax, DWORD PTR [edx+4424]
	imul	eax, 136				; 00000088H
	mov	ecx, DWORD PTR _flt$[ebp]
	lea	edx, DWORD PTR [ecx+eax+72]
	mov	DWORD PTR _node$[ebp], edx

; 242  : 
; 243  : 	if(*flthisto)

	mov	eax, DWORD PTR _flthisto$[ebp]
	movsx	ecx, BYTE PTR [eax]
	test	ecx, ecx
	je	SHORT $L70552

; 245  : 		strcpy(node->datemax, cntxt->timestamp);

	mov	edx, DWORD PTR _cntxt$[ebp]
	add	edx, 29704				; 00007408H
	push	edx
	mov	eax, DWORD PTR _node$[ebp]
	add	eax, 80					; 00000050H
	push	eax
	call	_strcpy
	add	esp, 8
$L70552:

; 247  : 
; 248  : 	if(*fltwhocr && id_obj)

	mov	ecx, DWORD PTR _fltwhocr$[ebp]
	movsx	edx, BYTE PTR [ecx]
	test	edx, edx
	je	SHORT $L70556
	cmp	DWORD PTR _id_obj$[ebp], 0
	je	SHORT $L70556

; 250  : 		if(qry_values_list(cntxt, id_obj, 0, &node->whocr)) STACK_ERROR;

	mov	eax, DWORD PTR _node$[ebp]
	add	eax, 116				; 00000074H
	push	eax
	push	0
	mov	ecx, DWORD PTR _id_obj$[ebp]
	push	ecx
	mov	edx, DWORD PTR _cntxt$[ebp]
	push	edx
	call	_qry_values_list
	add	esp, 16					; 00000010H
	test	eax, eax
	je	SHORT $L70554
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 250		; 000000faH
	jmp	SHORT $eva_err$70555
$L70554:

; 251  : 		if(*flthisto)

	mov	ecx, DWORD PTR _flthisto$[ebp]
	movsx	edx, BYTE PTR [ecx]
	test	edx, edx
	je	SHORT $L70556

; 253  : 			node->whodel = node->whocr;

	mov	eax, DWORD PTR _node$[ebp]
	mov	ecx, DWORD PTR _node$[ebp]
	mov	edx, DWORD PTR [ecx+116]
	mov	DWORD PTR [eax+120], edx
$L70556:
$eva_noerr$70557:

; 256  : 	RETURN_OK_CLEANUP;

	push	0
	push	OFFSET FLAT:$SG70558
	push	OFFSET FLAT:$SG70559
	mov	eax, DWORD PTR _cntxt$[ebp]
	push	eax
	call	_err_clear
	add	esp, 16					; 00000010H
$eva_err$70555:
	mov	ecx, DWORD PTR _cntxt$[ebp]
	cmp	DWORD PTR [ecx+29872], 0
	je	SHORT $L70560
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	eax, DWORD PTR [edx+29900]
	push	eax
	push	OFFSET FLAT:$SG70561
	push	OFFSET FLAT:$SG70562
	mov	ecx, DWORD PTR _cntxt$[ebp]
	push	ecx
	call	_err_add_context
	add	esp, 16					; 00000010H
$L70560:
	lea	edx, DWORD PTR _usergroup$[ebp]
	push	edx
	call	_dyntab_free
	add	esp, 4
	mov	eax, DWORD PTR _cntxt$[ebp]
	xor	ecx, ecx
	cmp	DWORD PTR [eax+29872], 0
	setne	cl
	mov	eax, ecx

; 257  : }

	mov	esp, ebp
	pop	ebp
	ret	0
_qry_add_create_del_filter ENDP
_TEXT	ENDS
PUBLIC	_qry_add_filterlist
PUBLIC	_qry_parse_filter_nodes
EXTRN	_strtoul:NEAR
EXTRN	_dyntab_val:NEAR
EXTRN	_qry_cache_idobj_field:NEAR
_DATA	SEGMENT
	ORG $+2
$SG70588 DB	'D:\Travail\ABI\EVA\V4.0\CGI\Brunix-2016\qry_build.c', 00H
$SG70589 DB	'qry_add_filterlist', 00H
	ORG $+1
$SG70591 DB	'D:\Travail\ABI\EVA\V4.0\CGI\Brunix-2016\qry_build.c', 00H
$SG70592 DB	'qry_add_filterlist', 00H
_DATA	ENDS
_TEXT	SEGMENT
_cntxt$ = 8
_flt$ = 12
_fltlist$ = 16
_data$ = -24
_i$ = -28
_srcjoin$ = -4
_curjoin$ = -32
_qry_add_filterlist PROC NEAR

; 271  : ){

	push	ebp
	mov	ebp, esp
	sub	esp, 32					; 00000020H

; 272  : 	DynTable data = {0};

	mov	DWORD PTR _data$[ebp], 0
	xor	eax, eax
	mov	DWORD PTR _data$[ebp+4], eax
	mov	DWORD PTR _data$[ebp+8], eax
	mov	DWORD PTR _data$[ebp+12], eax
	mov	DWORD PTR _data$[ebp+16], eax

; 273  : 
; 274  : 	/* Process each filter */
; 275  : 	unsigned long i, srcjoin = flt->srcjoin, curjoin = flt->nbnode;

	mov	ecx, DWORD PTR _flt$[ebp]
	mov	edx, DWORD PTR [ecx+64]
	mov	DWORD PTR _srcjoin$[ebp], edx
	mov	eax, DWORD PTR _flt$[ebp]
	mov	ecx, DWORD PTR [eax+4424]
	mov	DWORD PTR _curjoin$[ebp], ecx

; 276  : 	for(i = 0; i < fltlist->nbrows; i++)

	mov	DWORD PTR _i$[ebp], 0
	jmp	SHORT $L70578
$L70579:
	mov	edx, DWORD PTR _i$[ebp]
	add	edx, 1
	mov	DWORD PTR _i$[ebp], edx
$L70578:
	mov	eax, DWORD PTR _fltlist$[ebp]
	mov	ecx, DWORD PTR _i$[ebp]
	cmp	ecx, DWORD PTR [eax]
	jae	$L70580

; 278  : 		flt->srcjoin = srcjoin;

	mov	edx, DWORD PTR _flt$[ebp]
	mov	eax, DWORD PTR _srcjoin$[ebp]
	mov	DWORD PTR [edx+64], eax

; 279  : 		if(qry_cache_idobj(&data, DYNTAB_TOULRC(fltlist, i, 0)) ||
; 280  : 			qry_parse_filter_nodes(cntxt, flt, &data)) STACK_ERROR;

	push	3
	push	0
	push	10					; 0000000aH
	push	0
	push	0
	mov	ecx, DWORD PTR _i$[ebp]
	push	ecx
	mov	edx, DWORD PTR _fltlist$[ebp]
	push	edx
	call	_dyntab_val
	add	esp, 12					; 0000000cH
	push	eax
	call	_strtoul
	add	esp, 12					; 0000000cH
	push	eax
	lea	eax, DWORD PTR _data$[ebp]
	push	eax
	mov	ecx, DWORD PTR _cntxt$[ebp]
	push	ecx
	call	_qry_cache_idobj_field
	add	esp, 20					; 00000014H
	test	eax, eax
	jne	SHORT $L70584
	lea	edx, DWORD PTR _data$[ebp]
	push	edx
	mov	eax, DWORD PTR _flt$[ebp]
	push	eax
	mov	ecx, DWORD PTR _cntxt$[ebp]
	push	ecx
	call	_qry_parse_filter_nodes
	add	esp, 12					; 0000000cH
	test	eax, eax
	je	SHORT $L70583
$L70584:
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 280		; 00000118H
	jmp	SHORT $eva_err$70585
$L70583:

; 281  : 
; 282  : 		/* Handle source join in case of direct relation for previous node */
; 283  : 		if(i == 0 && flt->node[srcjoin].rel == RelDirect) srcjoin = curjoin;

	cmp	DWORD PTR _i$[ebp], 0
	jne	SHORT $L70586
	mov	eax, DWORD PTR _srcjoin$[ebp]
	imul	eax, 136				; 00000088H
	mov	ecx, DWORD PTR _flt$[ebp]
	cmp	DWORD PTR [ecx+eax+124], 1
	jne	SHORT $L70586
	mov	edx, DWORD PTR _curjoin$[ebp]
	mov	DWORD PTR _srcjoin$[ebp], edx
$L70586:

; 284  : 	}

	jmp	$L70579
$L70580:

; 285  : 	flt->srcjoin = srcjoin;

	mov	eax, DWORD PTR _flt$[ebp]
	mov	ecx, DWORD PTR _srcjoin$[ebp]
	mov	DWORD PTR [eax+64], ecx
$eva_noerr$70587:

; 286  : 	RETURN_OK_CLEANUP;

	push	0
	push	OFFSET FLAT:$SG70588
	push	OFFSET FLAT:$SG70589
	mov	edx, DWORD PTR _cntxt$[ebp]
	push	edx
	call	_err_clear
	add	esp, 16					; 00000010H
$eva_err$70585:
	mov	eax, DWORD PTR _cntxt$[ebp]
	cmp	DWORD PTR [eax+29872], 0
	je	SHORT $L70590
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	edx, DWORD PTR [ecx+29900]
	push	edx
	push	OFFSET FLAT:$SG70591
	push	OFFSET FLAT:$SG70592
	mov	eax, DWORD PTR _cntxt$[ebp]
	push	eax
	call	_err_add_context
	add	esp, 16					; 00000010H
$L70590:
	lea	ecx, DWORD PTR _data$[ebp]
	push	ecx
	call	_dyntab_free
	add	esp, 4
	mov	edx, DWORD PTR _cntxt$[ebp]
	xor	eax, eax
	cmp	DWORD PTR [edx+29872], 0
	setne	al

; 287  : }

	mov	esp, ebp
	pop	ebp
	ret	0
_qry_add_filterlist ENDP
_TEXT	ENDS
PUBLIC	_qry_add_filter
PUBLIC	_qry_add_filter_forms
EXTRN	_dyntab_add:NEAR
_DATA	SEGMENT
	ORG $+1
$SG70613 DB	'_EVA_FORMSTAMP', 00H
	ORG $+1
$SG70615 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70621 DB	'D:\Travail\ABI\EVA\V4.0\CGI\Brunix-2016\qry_build.c', 00H
$SG70622 DB	'qry_add_filter_forms', 00H
	ORG $+3
$SG70624 DB	'D:\Travail\ABI\EVA\V4.0\CGI\Brunix-2016\qry_build.c', 00H
$SG70625 DB	'qry_add_filter_forms', 00H
_DATA	ENDS
_TEXT	SEGMENT
_cntxt$ = 8
_flt$ = 12
_forms$ = 16
_filters$ = 20
_data$ = -20
_id$70607 = -36
_row$70608 = -28
_col$70609 = -24
__c$70610 = -32
_qry_add_filter_forms PROC NEAR

; 302  : ){

	push	ebp
	mov	ebp, esp
	sub	esp, 36					; 00000024H

; 303  : 	DynTable data = {0};

	mov	DWORD PTR _data$[ebp], 0
	xor	eax, eax
	mov	DWORD PTR _data$[ebp+4], eax
	mov	DWORD PTR _data$[ebp+8], eax
	mov	DWORD PTR _data$[ebp+12], eax
	mov	DWORD PTR _data$[ebp+16], eax

; 304  : 
; 305  : 	/* Handle formstamp condition */
; 306  : 	if(forms && forms->nbrows)

	cmp	DWORD PTR _forms$[ebp], 0
	je	$L70618
	mov	ecx, DWORD PTR _forms$[ebp]
	cmp	DWORD PTR [ecx], 0
	je	$L70618

; 308  : 		DYNTAB_ADD_TXTID(&data, 0, 0, "_EVA_FORMSTAMP", cntxt->val_FORMSTAMP);

	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	eax, DWORD PTR [edx+269636]
	mov	DWORD PTR _id$70607[ebp], eax
	mov	DWORD PTR _row$70608[ebp], 0
	mov	DWORD PTR _col$70609[ebp], 0
	push	0
	push	0
	push	14					; 0000000eH
	push	OFFSET FLAT:$SG70613
	mov	ecx, DWORD PTR _col$70609[ebp]
	push	ecx
	mov	edx, DWORD PTR _row$70608[ebp]
	push	edx
	lea	eax, DWORD PTR _data$[ebp]
	push	eax
	call	_dyntab_add
	add	esp, 28					; 0000001cH
	test	eax, eax
	je	SHORT $L70612
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29872], OFFSET FLAT:$SG70615
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 308		; 00000134H
	jmp	$eva_err$70616
$L70612:
	mov	eax, DWORD PTR _col$70609[ebp]
	push	eax
	mov	ecx, DWORD PTR _row$70608[ebp]
	push	ecx
	lea	edx, DWORD PTR _data$[ebp]
	push	edx
	call	_dyntab_cell
	add	esp, 12					; 0000000cH
	mov	DWORD PTR __c$70610[ebp], eax
	mov	eax, DWORD PTR __c$70610[ebp]
	mov	ecx, DWORD PTR _id$70607[ebp]
	mov	DWORD PTR [eax+32], ecx

; 309  : 		if(qry_add_filter(cntxt, flt, RelNone, &data, RelList, forms)) STACK_ERROR;

	mov	edx, DWORD PTR _forms$[ebp]
	push	edx
	push	3
	lea	eax, DWORD PTR _data$[ebp]
	push	eax
	push	0
	mov	ecx, DWORD PTR _flt$[ebp]
	push	ecx
	mov	edx, DWORD PTR _cntxt$[ebp]
	push	edx
	call	_qry_add_filter
	add	esp, 24					; 00000018H
	test	eax, eax
	je	SHORT $L70617
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 309		; 00000135H
	jmp	SHORT $eva_err$70616
$L70617:

; 310  : 		if(flt->node[flt->srcjoin].rel == RelDirect) flt->srcjoin = flt->nbnode - 1;

	mov	ecx, DWORD PTR _flt$[ebp]
	mov	edx, DWORD PTR [ecx+64]
	imul	edx, 136				; 00000088H
	mov	eax, DWORD PTR _flt$[ebp]
	cmp	DWORD PTR [eax+edx+124], 1
	jne	SHORT $L70618
	mov	ecx, DWORD PTR _flt$[ebp]
	mov	edx, DWORD PTR [ecx+4424]
	sub	edx, 1
	mov	eax, DWORD PTR _flt$[ebp]
	mov	DWORD PTR [eax+64], edx
$L70618:

; 312  : 
; 313  : 	/* Handle filter condition */
; 314  : 	if(filters && qry_add_filterlist(cntxt, flt, filters)) STACK_ERROR;

	cmp	DWORD PTR _filters$[ebp], 0
	je	SHORT $eva_noerr$70620
	mov	ecx, DWORD PTR _filters$[ebp]
	push	ecx
	mov	edx, DWORD PTR _flt$[ebp]
	push	edx
	mov	eax, DWORD PTR _cntxt$[ebp]
	push	eax
	call	_qry_add_filterlist
	add	esp, 12					; 0000000cH
	test	eax, eax
	je	SHORT $eva_noerr$70620
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 314		; 0000013aH
	jmp	SHORT $eva_err$70616
$eva_noerr$70620:

; 315  : 	RETURN_OK_CLEANUP;

	push	0
	push	OFFSET FLAT:$SG70621
	push	OFFSET FLAT:$SG70622
	mov	edx, DWORD PTR _cntxt$[ebp]
	push	edx
	call	_err_clear
	add	esp, 16					; 00000010H
$eva_err$70616:
	mov	eax, DWORD PTR _cntxt$[ebp]
	cmp	DWORD PTR [eax+29872], 0
	je	SHORT $L70623
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	edx, DWORD PTR [ecx+29900]
	push	edx
	push	OFFSET FLAT:$SG70624
	push	OFFSET FLAT:$SG70625
	mov	eax, DWORD PTR _cntxt$[ebp]
	push	eax
	call	_err_add_context
	add	esp, 16					; 00000010H
$L70623:
	lea	ecx, DWORD PTR _data$[ebp]
	push	ecx
	call	_dyntab_free
	add	esp, 4
	mov	edx, DWORD PTR _cntxt$[ebp]
	xor	eax, eax
	cmp	DWORD PTR [edx+29872], 0
	setne	al

; 316  : }

	mov	esp, ebp
	pop	ebp
	ret	0
_qry_add_filter_forms ENDP
_TEXT	ENDS
PUBLIC	_qry_add_filter_simple_txt
EXTRN	_strlen:NEAR
EXTRN	_dyntab_from_list:NEAR
_DATA	SEGMENT
	ORG $+3
$SG70644 DB	',', 00H
	ORG $+2
$SG70649 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70651 DB	'D:\Travail\ABI\EVA\V4.0\CGI\Brunix-2016\qry_build.c', 00H
$SG70652 DB	'qry_add_filter_simple_txt', 00H
	ORG $+2
$SG70654 DB	'D:\Travail\ABI\EVA\V4.0\CGI\Brunix-2016\qry_build.c', 00H
$SG70655 DB	'qry_add_filter_simple_txt', 00H
_DATA	ENDS
_TEXT	SEGMENT
_cntxt$ = 8
_flt$ = 12
_rel$ = 16
_field$ = 20
_matchmode$ = 24
_value$ = 28
_node$ = -4
_qry_add_filter_simple_txt PROC NEAR

; 333  : ){

	push	ebp
	mov	ebp, esp
	push	ecx

; 334  : 	QryBuilNode *node = flt->node + flt->nbnode;

	mov	eax, DWORD PTR _flt$[ebp]
	mov	ecx, DWORD PTR [eax+4424]
	imul	ecx, 136				; 00000088H
	mov	edx, DWORD PTR _flt$[ebp]
	lea	eax, DWORD PTR [edx+ecx+72]
	mov	DWORD PTR _node$[ebp], eax

; 335  : 	node->rel = rel;

	mov	ecx, DWORD PTR _node$[ebp]
	mov	edx, DWORD PTR _rel$[ebp]
	mov	DWORD PTR [ecx+52], edx

; 336  : 	if(dyntab_from_list(&node->field, field, strlen(field), ",", 0, 1)) STACK_ERROR;

	push	1
	push	0
	push	OFFSET FLAT:$SG70644
	mov	eax, DWORD PTR _field$[ebp]
	push	eax
	call	_strlen
	add	esp, 4
	push	eax
	mov	ecx, DWORD PTR _field$[ebp]
	push	ecx
	mov	edx, DWORD PTR _node$[ebp]
	push	edx
	call	_dyntab_from_list
	add	esp, 24					; 00000018H
	test	eax, eax
	je	SHORT $L70643
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 336		; 00000150H
	jmp	SHORT $eva_err$70645
$L70643:

; 337  : 	node->match = matchmode;

	mov	ecx, DWORD PTR _node$[ebp]
	mov	edx, DWORD PTR _matchmode$[ebp]
	mov	DWORD PTR [ecx+24], edx

; 338  : 	DYNTAB_ADD(&node->value, 0, 0, value, 0, NO_CONV);

	push	0
	push	0
	push	0
	mov	eax, DWORD PTR _value$[ebp]
	push	eax
	push	0
	push	0
	mov	ecx, DWORD PTR _node$[ebp]
	add	ecx, 32					; 00000020H
	push	ecx
	call	_dyntab_add
	add	esp, 28					; 0000001cH
	test	eax, eax
	je	SHORT $L70647
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29872], OFFSET FLAT:$SG70649
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 338		; 00000152H
	jmp	SHORT $eva_err$70645
$L70647:

; 339  : 	flt->nbnode++;

	mov	ecx, DWORD PTR _flt$[ebp]
	mov	edx, DWORD PTR [ecx+4424]
	add	edx, 1
	mov	eax, DWORD PTR _flt$[ebp]
	mov	DWORD PTR [eax+4424], edx
$eva_noerr$70650:

; 340  : 	RETURN_OK_CLEANUP;

	push	0
	push	OFFSET FLAT:$SG70651
	push	OFFSET FLAT:$SG70652
	mov	ecx, DWORD PTR _cntxt$[ebp]
	push	ecx
	call	_err_clear
	add	esp, 16					; 00000010H
$eva_err$70645:
	mov	edx, DWORD PTR _cntxt$[ebp]
	cmp	DWORD PTR [edx+29872], 0
	je	SHORT $L70653
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	ecx, DWORD PTR [eax+29900]
	push	ecx
	push	OFFSET FLAT:$SG70654
	push	OFFSET FLAT:$SG70655
	mov	edx, DWORD PTR _cntxt$[ebp]
	push	edx
	call	_err_add_context
	add	esp, 16					; 00000010H
$L70653:
	mov	eax, DWORD PTR _cntxt$[ebp]
	xor	ecx, ecx
	cmp	DWORD PTR [eax+29872], 0
	setne	cl
	mov	eax, ecx

; 341  : }

	mov	esp, ebp
	pop	ebp
	ret	0
_qry_add_filter_simple_txt ENDP
_TEXT	ENDS
PUBLIC	_qry_add_filter_simple_int
EXTRN	_sprintf:NEAR
_DATA	SEGMENT
	ORG $+2
$SG70674 DB	',', 00H
	ORG $+2
$SG70677 DB	'%lu', 00H
$SG70681 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70683 DB	'D:\Travail\ABI\EVA\V4.0\CGI\Brunix-2016\qry_build.c', 00H
$SG70684 DB	'qry_add_filter_simple_int', 00H
	ORG $+2
$SG70686 DB	'D:\Travail\ABI\EVA\V4.0\CGI\Brunix-2016\qry_build.c', 00H
$SG70687 DB	'qry_add_filter_simple_int', 00H
_DATA	ENDS
_TEXT	SEGMENT
_cntxt$ = 8
_flt$ = 12
_rel$ = 16
_field$ = 20
_matchmode$ = 24
_value$ = 28
_node$ = -4
__tmp$70676 = -36
_qry_add_filter_simple_int PROC NEAR

; 358  : ){

	push	ebp
	mov	ebp, esp
	sub	esp, 36					; 00000024H
	push	edi

; 359  : 	QryBuilNode *node = flt->node + flt->nbnode;

	mov	eax, DWORD PTR _flt$[ebp]
	mov	ecx, DWORD PTR [eax+4424]
	imul	ecx, 136				; 00000088H
	mov	edx, DWORD PTR _flt$[ebp]
	lea	eax, DWORD PTR [edx+ecx+72]
	mov	DWORD PTR _node$[ebp], eax

; 360  : 	node->rel = rel;

	mov	ecx, DWORD PTR _node$[ebp]
	mov	edx, DWORD PTR _rel$[ebp]
	mov	DWORD PTR [ecx+52], edx

; 361  : 	if(dyntab_from_list(&node->field, field, strlen(field), ",", 0, 1)) STACK_ERROR;

	push	1
	push	0
	push	OFFSET FLAT:$SG70674
	mov	eax, DWORD PTR _field$[ebp]
	push	eax
	call	_strlen
	add	esp, 4
	push	eax
	mov	ecx, DWORD PTR _field$[ebp]
	push	ecx
	mov	edx, DWORD PTR _node$[ebp]
	push	edx
	call	_dyntab_from_list
	add	esp, 24					; 00000018H
	test	eax, eax
	je	SHORT $L70673
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 361		; 00000169H
	jmp	$eva_err$70675
$L70673:

; 362  : 	node->match = matchmode;

	mov	ecx, DWORD PTR _node$[ebp]
	mov	edx, DWORD PTR _matchmode$[ebp]
	mov	DWORD PTR [ecx+24], edx

; 363  : 	DYNTAB_ADD_INT(&node->value, 0, 0, value);

	mov	BYTE PTR __tmp$70676[ebp], 0
	mov	ecx, 7
	xor	eax, eax
	lea	edi, DWORD PTR __tmp$70676[ebp+1]
	rep stosd
	stosw
	stosb
	mov	eax, DWORD PTR _value$[ebp]
	push	eax
	push	OFFSET FLAT:$SG70677
	lea	ecx, DWORD PTR __tmp$70676[ebp]
	push	ecx
	call	_sprintf
	add	esp, 12					; 0000000cH
	push	0
	push	0
	push	0
	lea	edx, DWORD PTR __tmp$70676[ebp]
	push	edx
	push	0
	push	0
	mov	eax, DWORD PTR _node$[ebp]
	add	eax, 32					; 00000020H
	push	eax
	call	_dyntab_add
	add	esp, 28					; 0000001cH
	test	eax, eax
	je	SHORT $L70679
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29872], OFFSET FLAT:$SG70681
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 363		; 0000016bH
	jmp	SHORT $eva_err$70675
$L70679:

; 364  : 	flt->nbnode++;

	mov	eax, DWORD PTR _flt$[ebp]
	mov	ecx, DWORD PTR [eax+4424]
	add	ecx, 1
	mov	edx, DWORD PTR _flt$[ebp]
	mov	DWORD PTR [edx+4424], ecx
$eva_noerr$70682:

; 365  : 	RETURN_OK_CLEANUP;

	push	0
	push	OFFSET FLAT:$SG70683
	push	OFFSET FLAT:$SG70684
	mov	eax, DWORD PTR _cntxt$[ebp]
	push	eax
	call	_err_clear
	add	esp, 16					; 00000010H
$eva_err$70675:
	mov	ecx, DWORD PTR _cntxt$[ebp]
	cmp	DWORD PTR [ecx+29872], 0
	je	SHORT $L70685
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	eax, DWORD PTR [edx+29900]
	push	eax
	push	OFFSET FLAT:$SG70686
	push	OFFSET FLAT:$SG70687
	mov	ecx, DWORD PTR _cntxt$[ebp]
	push	ecx
	call	_err_add_context
	add	esp, 16					; 00000010H
$L70685:
	mov	edx, DWORD PTR _cntxt$[ebp]
	xor	eax, eax
	cmp	DWORD PTR [edx+29872], 0
	setne	al

; 366  : }

	pop	edi
	mov	esp, ebp
	pop	ebp
	ret	0
_qry_add_filter_simple_int ENDP
_TEXT	ENDS
EXTRN	_dyntab_sz:NEAR
_DATA	SEGMENT
	ORG $+2
$SG70713 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70722 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70724 DB	'D:\Travail\ABI\EVA\V4.0\CGI\Brunix-2016\qry_build.c', 00H
$SG70725 DB	'qry_add_filter', 00H
	ORG $+1
$SG70727 DB	'D:\Travail\ABI\EVA\V4.0\CGI\Brunix-2016\qry_build.c', 00H
$SG70728 DB	'qry_add_filter', 00H
_DATA	ENDS
_TEXT	SEGMENT
_cntxt$ = 8
_flt$ = 12
_joinmode$ = 16
_fltfld$ = 20
_matchmode$ = 24
_fltval$ = 28
_node$ = -4
_i$ = -8
_qry_add_filter PROC NEAR

; 383  : ){

	push	ebp
	mov	ebp, esp
	sub	esp, 8

; 384  : 	QryBuilNode *node = flt->node + flt->nbnode;

	mov	eax, DWORD PTR _flt$[ebp]
	mov	ecx, DWORD PTR [eax+4424]
	imul	ecx, 136				; 00000088H
	mov	edx, DWORD PTR _flt$[ebp]
	lea	eax, DWORD PTR [edx+ecx+72]
	mov	DWORD PTR _node$[ebp], eax

; 385  : 	unsigned long i;
; 386  : 
; 387  : 	/* Store fields */
; 388  : 	if(fltfld) for(i = 0; i < fltfld->nbrows; i++)

	cmp	DWORD PTR _fltfld$[ebp], 0
	je	$L70709
	mov	DWORD PTR _i$[ebp], 0
	jmp	SHORT $L70707
$L70708:
	mov	ecx, DWORD PTR _i$[ebp]
	add	ecx, 1
	mov	DWORD PTR _i$[ebp], ecx
$L70707:
	mov	edx, DWORD PTR _fltfld$[ebp]
	mov	eax, DWORD PTR _i$[ebp]
	cmp	eax, DWORD PTR [edx]
	jae	SHORT $L70709

; 389  : 		if(dyntab_sz(fltfld, i, 0))

	push	0
	mov	ecx, DWORD PTR _i$[ebp]
	push	ecx
	mov	edx, DWORD PTR _fltfld$[ebp]
	push	edx
	call	_dyntab_sz
	add	esp, 12					; 0000000cH
	test	eax, eax
	je	SHORT $L70711

; 390  : 			DYNTAB_ADD_CELL(&node->field, node->field.nbrows, 0, fltfld, i, 0);

	push	1
	push	0
	mov	eax, DWORD PTR _i$[ebp]
	push	eax
	mov	ecx, DWORD PTR _fltfld$[ebp]
	push	ecx
	call	_dyntab_cell
	add	esp, 12					; 0000000cH
	push	eax
	push	0
	mov	edx, DWORD PTR _node$[ebp]
	mov	eax, DWORD PTR [edx]
	push	eax
	mov	ecx, DWORD PTR _node$[ebp]
	push	ecx
	call	_dyntab_copy
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L70711
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29872], OFFSET FLAT:$SG70713
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 390		; 00000186H
	jmp	$eva_err$70714
$L70711:
	jmp	SHORT $L70708
$L70709:

; 391  : 
; 392  : 	/* Store values */
; 393  : 	if(fltval) for(i = 0; i < fltval->nbrows; i++)

	cmp	DWORD PTR _fltval$[ebp], 0
	je	$L70718
	mov	DWORD PTR _i$[ebp], 0
	jmp	SHORT $L70716
$L70717:
	mov	ecx, DWORD PTR _i$[ebp]
	add	ecx, 1
	mov	DWORD PTR _i$[ebp], ecx
$L70716:
	mov	edx, DWORD PTR _fltval$[ebp]
	mov	eax, DWORD PTR _i$[ebp]
	cmp	eax, DWORD PTR [edx]
	jae	SHORT $L70718

; 394  : 		if(dyntab_sz(fltval, i, 0))

	push	0
	mov	ecx, DWORD PTR _i$[ebp]
	push	ecx
	mov	edx, DWORD PTR _fltval$[ebp]
	push	edx
	call	_dyntab_sz
	add	esp, 12					; 0000000cH
	test	eax, eax
	je	SHORT $L70720

; 395  : 			DYNTAB_ADD_CELL(&node->value, node->value.nbrows, 0, fltval, i, 0);

	push	1
	push	0
	mov	eax, DWORD PTR _i$[ebp]
	push	eax
	mov	ecx, DWORD PTR _fltval$[ebp]
	push	ecx
	call	_dyntab_cell
	add	esp, 12					; 0000000cH
	push	eax
	push	0
	mov	edx, DWORD PTR _node$[ebp]
	mov	eax, DWORD PTR [edx+32]
	push	eax
	mov	ecx, DWORD PTR _node$[ebp]
	add	ecx, 32					; 00000020H
	push	ecx
	call	_dyntab_copy
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L70720
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29872], OFFSET FLAT:$SG70722
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 395		; 0000018bH
	jmp	SHORT $eva_err$70714
$L70720:
	jmp	SHORT $L70717
$L70718:

; 396  : 
; 397  : 	/* Store relation & match mode */
; 398  : 	node->rel = joinmode;

	mov	ecx, DWORD PTR _node$[ebp]
	mov	edx, DWORD PTR _joinmode$[ebp]
	mov	DWORD PTR [ecx+52], edx

; 399  : 	node->match = matchmode;

	mov	eax, DWORD PTR _node$[ebp]
	mov	ecx, DWORD PTR _matchmode$[ebp]
	mov	DWORD PTR [eax+24], ecx

; 400  : 	node->srcjoin = flt->srcjoin;

	mov	edx, DWORD PTR _node$[ebp]
	mov	eax, DWORD PTR _flt$[ebp]
	mov	ecx, DWORD PTR [eax+64]
	mov	DWORD PTR [edx+56], ecx

; 401  : 	flt->nbnode++;

	mov	edx, DWORD PTR _flt$[ebp]
	mov	eax, DWORD PTR [edx+4424]
	add	eax, 1
	mov	ecx, DWORD PTR _flt$[ebp]
	mov	DWORD PTR [ecx+4424], eax
$eva_noerr$70723:

; 402  : 
; 403  : 	RETURN_OK_CLEANUP;

	push	0
	push	OFFSET FLAT:$SG70724
	push	OFFSET FLAT:$SG70725
	mov	edx, DWORD PTR _cntxt$[ebp]
	push	edx
	call	_err_clear
	add	esp, 16					; 00000010H
$eva_err$70714:
	mov	eax, DWORD PTR _cntxt$[ebp]
	cmp	DWORD PTR [eax+29872], 0
	je	SHORT $L70726
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	edx, DWORD PTR [ecx+29900]
	push	edx
	push	OFFSET FLAT:$SG70727
	push	OFFSET FLAT:$SG70728
	mov	eax, DWORD PTR _cntxt$[ebp]
	push	eax
	call	_err_add_context
	add	esp, 16					; 00000010H
$L70726:
	mov	ecx, DWORD PTR _cntxt$[ebp]
	xor	eax, eax
	cmp	DWORD PTR [ecx+29872], 0
	setne	al

; 404  : }

	mov	esp, ebp
	pop	ebp
	ret	0
_qry_add_filter ENDP
_TEXT	ENDS
PUBLIC	_qry_table_from_list
PUBLIC	_qry_build_flt_select
PUBLIC	_qry_filter_table
PUBLIC	_qry_parse_fieldexpr
EXTRN	__snprintf:NEAR
EXTRN	_sql_exec_query:NEAR
EXTRN	_qry_exec_filter:NEAR
EXTRN	_dynbuf_add3:NEAR
EXTRN	__chkstk:NEAR
EXTRN	_ctrl_read_baseobj:NEAR
EXTRN	_dyntab_filter_field:NEAR
EXTRN	_dyntab_field_cell:NEAR
EXTRN	_dyntab_order_lines:NEAR
_BSS	SEGMENT
$SG70899 DB	01H DUP (?)
	ALIGN	4

$SG71023 DB	01H DUP (?)
_BSS	ENDS
_DATA	SEGMENT
	ORG $+1
$SG70758 DB	'_EVA_LABEL', 00H
	ORG $+1
$SG70759 DB	'`%s`', 00H
	ORG $+3
$SG70760 DB	'Tmp%lu', 00H
	ORG $+1
$SG70763 DB	0aH, 00H
	ORG $+2
$SG70764 DB	'-- Create table from list ', 00H
	ORG $+1
$SG70766 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70769 DB	' (', 0aH, 'IdObj INT UNSIGNED PRIMARY KEY', 00H
	ORG $+2
$SG70770 DB	'CREATE TEMPORARY TABLE ', 00H
$SG70772 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70776 DB	'_EVA_DISPLAYFORMAT', 00H
	ORG $+1
$SG70778 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70782 DB	'_EVA_DISPLAYLABELS', 00H
	ORG $+1
$SG70784 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70791 DB	'` ', 00H
	ORG $+1
$SG70792 DB	',', 0aH, '`', 00H
$SG70794 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70797 DB	'_EVA_RELATION', 00H
	ORG $+2
$SG70798 DB	'_EVA_RELATION_BTN', 00H
	ORG $+2
$SG70799 DB	'_EVA_RELATION_BTN0', 00H
	ORG $+1
$SG70800 DB	'_EVA_DOCUMENT', 00H
	ORG $+2
$SG70803 DB	'INT UNSIGNED', 00H
	ORG $+3
$SG70805 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70808 DB	'_EVA_MONEY', 00H
	ORG $+1
$SG70811 DB	'DOUBLE', 00H
	ORG $+1
$SG70813 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70817 DB	'_EVA_NUMBER', 00H
$SG70818 DB	'_EVA_FILESIZE', 00H
	ORG $+2
$SG70821 DB	'INT', 00H
$SG70823 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70827 DB	'_EVA_DATETIME', 00H
	ORG $+2
$SG70828 DB	'_EVA_AGE', 00H
	ORG $+3
$SG70831 DB	'CHAR(14)', 00H
	ORG $+3
$SG70833 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70836 DB	'_EVA_DATE', 00H
	ORG $+2
$SG70839 DB	'CHAR(8)', 00H
$SG70841 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70844 DB	'_EVA_NORMAL', 00H
$SG70847 DB	'TEXT', 00H
	ORG $+3
$SG70849 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70853 DB	'CHAR(32)', 00H
	ORG $+3
$SG70855 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70858 DB	0aH, ') TYPE=HEAP', 00H
	ORG $+3
$SG70860 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70862 DB	'_EVA_DEBUG_SQL_FILTER', 00H
	ORG $+2
$SG70864 DB	'D:\Travail\ABI\EVA\V4.0\CGI\Brunix-2016\qry_build.c', 00H
$SG70865 DB	'qry_table_from_list', 00H
$SG70869 DB	'_EVA_BASE_FORMS', 00H
$SG70871 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70879 DB	'_EVA_DISPLAYFIELDS', 00H
	ORG $+1
$SG70881 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70885 DB	'_EVA_DEBUG_SQL_EXPR', 00H
$SG70887 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70900 DB	'DROP TABLE IF EXISTS ', 00H
	ORG $+2
$SG70902 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70906 DB	']', 0aH, 00H
	ORG $+1
$SG70907 DB	'-- Create values table for column [', 00H
$SG70909 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70912 DB	' TYPE=HEAP', 0aH, 00H
$SG70913 DB	'CREATE TEMPORARY TABLE ', 00H
$SG70915 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70920 DB	']', 0aH, 00H
	ORG $+1
$SG70921 DB	'-- Update values from table for column [', 00H
	ORG $+3
$SG70923 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70926 DB	',', 00H
	ORG $+2
$SG70927 DB	'UPDATE ', 00H
$SG70929 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70933 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70936 DB	'.`', 00H
	ORG $+1
$SG70937 DB	' SET ', 00H
	ORG $+2
$SG70939 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70943 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70946 DB	'.Val', 0aH, 00H
	ORG $+2
$SG70947 DB	'`=', 00H
	ORG $+1
$SG70949 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70952 DB	'.IdObj=', 00H
$SG70953 DB	'WHERE ', 00H
	ORG $+1
$SG70955 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70959 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70962 DB	'.IdObj', 00H
	ORG $+1
$SG70964 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70969 DB	']', 0aH, 00H
	ORG $+1
$SG70970 DB	'-- Update values for column [', 00H
	ORG $+2
$SG70972 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70975 DB	',TLink AS TLink0', 0aH, 00H
	ORG $+2
$SG70976 DB	'UPDATE ', 00H
$SG70978 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70983 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70986 DB	'.`', 00H
	ORG $+1
$SG70987 DB	'SET ', 00H
	ORG $+3
$SG70989 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70993 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70997 DB	0aH, 00H
	ORG $+2
$SG70998 DB	'`=', 00H
	ORG $+1
$SG71000 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG71003 DB	'.IdObj=TLink0.', 00H
	ORG $+1
$SG71004 DB	'WHERE ', 00H
	ORG $+1
$SG71006 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG71010 DB	'IdRelObj', 00H
	ORG $+3
$SG71012 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG71016 DB	'IdObj', 00H
	ORG $+2
$SG71018 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG71024 DB	0aH, 'AND ', 00H
	ORG $+2
$SG71026 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG71028 DB	'D:\Travail\ABI\EVA\V4.0\CGI\Brunix-2016\qry_build.c', 00H
$SG71029 DB	'qry_table_from_list', 00H
$SG71031 DB	'D:\Travail\ABI\EVA\V4.0\CGI\Brunix-2016\qry_build.c', 00H
$SG71032 DB	'qry_table_from_list', 00H
_DATA	ENDS
_TEXT	SEGMENT
_cntxt$ = 8
_idctrl$ = 12
_sql$ = -4
_flt$ = -4756
_attr$ = -228
_label$ = -280
_field$ = -172
_format$ = -252
_debug$ = -4776
_data$ = -152
_empty$ = -300
_tbl$ = -132
_sz_tbl$ = -208
_tmp$ = -204
_sz_tmp$ = -232
_i$ = -256
_sqltrace$ = -260
_fmt$70788 = -4780
_fld$70891 = -4784
_qry_table_from_list PROC NEAR

; 425  : ){

	push	ebp
	mov	ebp, esp
	mov	eax, 4804				; 000012c4H
	call	__chkstk
	push	edi

; 426  : 	DynBuffer *sql = NULL;

	mov	DWORD PTR _sql$[ebp], 0

; 427  : 	QryBuild flt = {{0}};

	mov	DWORD PTR _flt$[ebp], 0
	xor	eax, eax
	mov	DWORD PTR _flt$[ebp+4], eax
	mov	DWORD PTR _flt$[ebp+8], eax
	mov	DWORD PTR _flt$[ebp+12], eax
	mov	DWORD PTR _flt$[ebp+16], eax
	mov	ecx, 1109				; 00000455H
	xor	eax, eax
	lea	edi, DWORD PTR _flt$[ebp+20]
	rep stosd

; 428  : 	DynTable attr = {0};

	mov	DWORD PTR _attr$[ebp], 0
	xor	ecx, ecx
	mov	DWORD PTR _attr$[ebp+4], ecx
	mov	DWORD PTR _attr$[ebp+8], ecx
	mov	DWORD PTR _attr$[ebp+12], ecx
	mov	DWORD PTR _attr$[ebp+16], ecx

; 429  : 	DynTable label = {0};

	mov	DWORD PTR _label$[ebp], 0
	xor	edx, edx
	mov	DWORD PTR _label$[ebp+4], edx
	mov	DWORD PTR _label$[ebp+8], edx
	mov	DWORD PTR _label$[ebp+12], edx
	mov	DWORD PTR _label$[ebp+16], edx

; 430  : 	DynTable field = {0};

	mov	DWORD PTR _field$[ebp], 0
	xor	eax, eax
	mov	DWORD PTR _field$[ebp+4], eax
	mov	DWORD PTR _field$[ebp+8], eax
	mov	DWORD PTR _field$[ebp+12], eax
	mov	DWORD PTR _field$[ebp+16], eax

; 431  : 	DynTable format = {0};

	mov	DWORD PTR _format$[ebp], 0
	xor	ecx, ecx
	mov	DWORD PTR _format$[ebp+4], ecx
	mov	DWORD PTR _format$[ebp+8], ecx
	mov	DWORD PTR _format$[ebp+12], ecx
	mov	DWORD PTR _format$[ebp+16], ecx

; 432  : 	DynTable debug = {0};

	mov	DWORD PTR _debug$[ebp], 0
	xor	edx, edx
	mov	DWORD PTR _debug$[ebp+4], edx
	mov	DWORD PTR _debug$[ebp+8], edx
	mov	DWORD PTR _debug$[ebp+12], edx
	mov	DWORD PTR _debug$[ebp+16], edx

; 433  : 	DynTable data = {0};

	mov	DWORD PTR _data$[ebp], 0
	xor	eax, eax
	mov	DWORD PTR _data$[ebp+4], eax
	mov	DWORD PTR _data$[ebp+8], eax
	mov	DWORD PTR _data$[ebp+12], eax
	mov	DWORD PTR _data$[ebp+16], eax

; 434  : 	DynTable empty = {0};

	mov	DWORD PTR _empty$[ebp], 0
	xor	ecx, ecx
	mov	DWORD PTR _empty$[ebp+4], ecx
	mov	DWORD PTR _empty$[ebp+8], ecx
	mov	DWORD PTR _empty$[ebp+12], ecx
	mov	DWORD PTR _empty$[ebp+16], ecx

; 435  : 	char tbl[128] = {0};

	mov	BYTE PTR _tbl$[ebp], 0
	mov	ecx, 31					; 0000001fH
	xor	eax, eax
	lea	edi, DWORD PTR _tbl$[ebp+1]
	rep stosd
	stosw
	stosb

; 436  : 	size_t sz_tbl;
; 437  : 	char tmp[32] = {0};

	mov	BYTE PTR _tmp$[ebp], 0
	mov	ecx, 7
	xor	eax, eax
	lea	edi, DWORD PTR _tmp$[ebp+1]
	rep stosd
	stosw
	stosb

; 438  : 	size_t sz_tmp;
; 439  : 	unsigned long i;
; 440  : 	int sqltrace = cntxt->sql_trace;

	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	eax, DWORD PTR [edx+29852]
	mov	DWORD PTR _sqltrace$[ebp], eax

; 441  : 
; 442  : 	/* Read list control attributes & set debug status */
; 443  : 	if(qry_cache_idobj(&attr, idctrl) || ctrl_read_baseobj(cntxt, &attr)) STACK_ERROR;

	push	3
	push	0
	mov	ecx, DWORD PTR _idctrl$[ebp]
	push	ecx
	lea	edx, DWORD PTR _attr$[ebp]
	push	edx
	mov	eax, DWORD PTR _cntxt$[ebp]
	push	eax
	call	_qry_cache_idobj_field
	add	esp, 20					; 00000014H
	test	eax, eax
	jne	SHORT $L70756
	lea	ecx, DWORD PTR _attr$[ebp]
	push	ecx
	mov	edx, DWORD PTR _cntxt$[ebp]
	push	edx
	call	_ctrl_read_baseobj
	add	esp, 8
	test	eax, eax
	je	SHORT $L70755
$L70756:
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 443		; 000001bbH
	jmp	$eva_err$70757
$L70755:

; 444  : 
; 445  : 	/* Create temporary table with list control label - return on error */
; 446  : 	sz_tbl = snprintf(tbl, sizeof(tbl)-1, "`%s`", DYNTAB_FIELD_VAL(&attr, LABEL));

	push	0
	push	-1
	push	OFFSET FLAT:$SG70758
	lea	ecx, DWORD PTR _attr$[ebp]
	push	ecx
	call	_dyntab_field_val
	add	esp, 16					; 00000010H
	push	eax
	push	OFFSET FLAT:$SG70759
	push	127					; 0000007fH
	lea	edx, DWORD PTR _tbl$[ebp]
	push	edx
	call	__snprintf
	add	esp, 16					; 00000010H
	mov	DWORD PTR _sz_tbl$[ebp], eax

; 447  : 	sz_tmp = snprintf(tmp, sizeof(tmp)-1, "Tmp%lu", idctrl);

	mov	eax, DWORD PTR _idctrl$[ebp]
	push	eax
	push	OFFSET FLAT:$SG70760
	push	31					; 0000001fH
	lea	ecx, DWORD PTR _tmp$[ebp]
	push	ecx
	call	__snprintf
	add	esp, 16					; 00000010H
	mov	DWORD PTR _sz_tmp$[ebp], eax

; 448  : 	DYNBUF_ADD3(&sql, "-- Create table from list ", tbl, sz_tbl, NO_CONV, "\n");

	push	1
	push	OFFSET FLAT:$SG70763
	push	0
	push	0
	mov	edx, DWORD PTR _sz_tbl$[ebp]
	push	edx
	lea	eax, DWORD PTR _tbl$[ebp]
	push	eax
	push	26					; 0000001aH
	push	OFFSET FLAT:$SG70764
	lea	ecx, DWORD PTR _sql$[ebp]
	push	ecx
	call	_dynbuf_add3
	add	esp, 36					; 00000024H
	test	eax, eax
	je	SHORT $L70762
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29872], OFFSET FLAT:$SG70766
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 448		; 000001c0H
	jmp	$eva_err$70757
$L70762:

; 449  : 	DYNBUF_ADD3(&sql, "CREATE TEMPORARY TABLE ", tbl, sz_tbl, NO_CONV, " (\nIdObj INT UNSIGNED PRIMARY KEY");

	push	33					; 00000021H
	push	OFFSET FLAT:$SG70769
	push	0
	push	0
	mov	ecx, DWORD PTR _sz_tbl$[ebp]
	push	ecx
	lea	edx, DWORD PTR _tbl$[ebp]
	push	edx
	push	23					; 00000017H
	push	OFFSET FLAT:$SG70770
	lea	eax, DWORD PTR _sql$[ebp]
	push	eax
	call	_dynbuf_add3
	add	esp, 36					; 00000024H
	test	eax, eax
	je	SHORT $L70768
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29872], OFFSET FLAT:$SG70772
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 449		; 000001c1H
	jmp	$eva_err$70757
$L70768:

; 450  : 	DYNTAB_FIELD_TAB(&format, &attr, DISPLAYFORMAT);

	lea	eax, DWORD PTR _format$[ebp]
	push	eax
	call	_dyntab_free
	add	esp, 4
	push	0
	push	-1
	push	OFFSET FLAT:$SG70776
	lea	ecx, DWORD PTR _attr$[ebp]
	push	ecx
	push	0
	lea	edx, DWORD PTR _format$[ebp]
	push	edx
	call	_dyntab_filter_field
	add	esp, 24					; 00000018H
	test	eax, eax
	jne	SHORT $L70775
	lea	eax, DWORD PTR _format$[ebp]
	push	eax
	call	_dyntab_order_lines
	add	esp, 4
	test	eax, eax
	je	SHORT $L70774
$L70775:
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29872], OFFSET FLAT:$SG70778
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 450		; 000001c2H
	jmp	$eva_err$70757
$L70774:

; 451  : 	DYNTAB_FIELD_TAB(&label, &attr, DISPLAYLABELS);

	lea	eax, DWORD PTR _label$[ebp]
	push	eax
	call	_dyntab_free
	add	esp, 4
	push	0
	push	-1
	push	OFFSET FLAT:$SG70782
	lea	ecx, DWORD PTR _attr$[ebp]
	push	ecx
	push	0
	lea	edx, DWORD PTR _label$[ebp]
	push	edx
	call	_dyntab_filter_field
	add	esp, 24					; 00000018H
	test	eax, eax
	jne	SHORT $L70781
	lea	eax, DWORD PTR _label$[ebp]
	push	eax
	call	_dyntab_order_lines
	add	esp, 4
	test	eax, eax
	je	SHORT $L70780
$L70781:
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29872], OFFSET FLAT:$SG70784
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 451		; 000001c3H
	jmp	$eva_err$70757
$L70780:

; 452  : 	for(i = 0; i < label.nbrows; i++)

	mov	DWORD PTR _i$[ebp], 0
	jmp	SHORT $L70785
$L70786:
	mov	eax, DWORD PTR _i$[ebp]
	add	eax, 1
	mov	DWORD PTR _i$[ebp], eax
$L70785:
	mov	ecx, DWORD PTR _i$[ebp]
	cmp	ecx, DWORD PTR _label$[ebp]
	jae	$L70787

; 454  : 		char *fmt = dyntab_val(&format, i, 0);

	push	0
	mov	edx, DWORD PTR _i$[ebp]
	push	edx
	lea	eax, DWORD PTR _format$[ebp]
	push	eax
	call	_dyntab_val
	add	esp, 12					; 0000000cH
	mov	DWORD PTR _fmt$70788[ebp], eax

; 455  : 		DYNBUF_ADD3_CELL(&sql, ",\n`", &label, i, 0, NO_CONV, "` ");

	push	2
	push	OFFSET FLAT:$SG70791
	push	0
	push	0
	push	0
	mov	ecx, DWORD PTR _i$[ebp]
	push	ecx
	lea	edx, DWORD PTR _label$[ebp]
	push	edx
	call	_dyntab_sz
	add	esp, 12					; 0000000cH
	push	eax
	push	0
	mov	eax, DWORD PTR _i$[ebp]
	push	eax
	lea	ecx, DWORD PTR _label$[ebp]
	push	ecx
	call	_dyntab_val
	add	esp, 12					; 0000000cH
	push	eax
	push	3
	push	OFFSET FLAT:$SG70792
	lea	edx, DWORD PTR _sql$[ebp]
	push	edx
	call	_dynbuf_add3
	add	esp, 36					; 00000024H
	test	eax, eax
	je	SHORT $L70790
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29872], OFFSET FLAT:$SG70794
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 455		; 000001c7H
	jmp	$eva_err$70757
$L70790:

; 456  : 		if(!strcmp(fmt, "_EVA_RELATION") || !strcmp(fmt, "_EVA_RELATION_BTN") || !strcmp(fmt, "_EVA_RELATION_BTN0") ||
; 457  : 			!strcmp(fmt, "_EVA_DOCUMENT")) DYNBUF_ADD_STR(&sql, "INT UNSIGNED")

	push	OFFSET FLAT:$SG70797
	mov	edx, DWORD PTR _fmt$70788[ebp]
	push	edx
	call	_strcmp
	add	esp, 8
	test	eax, eax
	je	SHORT $L70796
	push	OFFSET FLAT:$SG70798
	mov	eax, DWORD PTR _fmt$70788[ebp]
	push	eax
	call	_strcmp
	add	esp, 8
	test	eax, eax
	je	SHORT $L70796
	push	OFFSET FLAT:$SG70799
	mov	ecx, DWORD PTR _fmt$70788[ebp]
	push	ecx
	call	_strcmp
	add	esp, 8
	test	eax, eax
	je	SHORT $L70796
	push	OFFSET FLAT:$SG70800
	mov	edx, DWORD PTR _fmt$70788[ebp]
	push	edx
	call	_strcmp
	add	esp, 8
	test	eax, eax
	jne	SHORT $L70795
$L70796:
	push	0
	push	0
	push	12					; 0000000cH
	push	OFFSET FLAT:$SG70803
	lea	eax, DWORD PTR _sql$[ebp]
	push	eax
	call	_dynbuf_add
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L70802
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29872], OFFSET FLAT:$SG70805
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 457		; 000001c9H
	jmp	$eva_err$70757
$L70802:

; 458  : 		else if(!strcmp(fmt, "_EVA_MONEY"))DYNBUF_ADD_STR(&sql, "DOUBLE")

	jmp	$L70852
$L70795:
	push	OFFSET FLAT:$SG70808
	mov	eax, DWORD PTR _fmt$70788[ebp]
	push	eax
	call	_strcmp
	add	esp, 8
	test	eax, eax
	jne	SHORT $L70807
	push	0
	push	0
	push	6
	push	OFFSET FLAT:$SG70811
	lea	ecx, DWORD PTR _sql$[ebp]
	push	ecx
	call	_dynbuf_add
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L70810
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29872], OFFSET FLAT:$SG70813
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 458		; 000001caH
	jmp	$eva_err$70757
$L70810:

; 459  : 		else if(!strcmp(fmt, "_EVA_NUMBER") || !strcmp(fmt, "_EVA_FILESIZE")) DYNBUF_ADD_STR(&sql, "INT")

	jmp	$L70852
$L70807:
	push	OFFSET FLAT:$SG70817
	mov	ecx, DWORD PTR _fmt$70788[ebp]
	push	ecx
	call	_strcmp
	add	esp, 8
	test	eax, eax
	je	SHORT $L70816
	push	OFFSET FLAT:$SG70818
	mov	edx, DWORD PTR _fmt$70788[ebp]
	push	edx
	call	_strcmp
	add	esp, 8
	test	eax, eax
	jne	SHORT $L70815
$L70816:
	push	0
	push	0
	push	3
	push	OFFSET FLAT:$SG70821
	lea	eax, DWORD PTR _sql$[ebp]
	push	eax
	call	_dynbuf_add
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L70820
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29872], OFFSET FLAT:$SG70823
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 459		; 000001cbH
	jmp	$eva_err$70757
$L70820:

; 460  : 		else if(!strcmp(fmt, "_EVA_DATETIME") || !strcmp(fmt, "_EVA_AGE")) DYNBUF_ADD_STR(&sql, "CHAR(14)")

	jmp	$L70852
$L70815:
	push	OFFSET FLAT:$SG70827
	mov	eax, DWORD PTR _fmt$70788[ebp]
	push	eax
	call	_strcmp
	add	esp, 8
	test	eax, eax
	je	SHORT $L70826
	push	OFFSET FLAT:$SG70828
	mov	ecx, DWORD PTR _fmt$70788[ebp]
	push	ecx
	call	_strcmp
	add	esp, 8
	test	eax, eax
	jne	SHORT $L70825
$L70826:
	push	0
	push	0
	push	8
	push	OFFSET FLAT:$SG70831
	lea	edx, DWORD PTR _sql$[ebp]
	push	edx
	call	_dynbuf_add
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L70830
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29872], OFFSET FLAT:$SG70833
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 460		; 000001ccH
	jmp	$eva_err$70757
$L70830:

; 461  : 		else if(!strcmp(fmt, "_EVA_DATE"))DYNBUF_ADD_STR(&sql, "CHAR(8)")

	jmp	$L70852
$L70825:
	push	OFFSET FLAT:$SG70836
	mov	edx, DWORD PTR _fmt$70788[ebp]
	push	edx
	call	_strcmp
	add	esp, 8
	test	eax, eax
	jne	SHORT $L70835
	push	0
	push	0
	push	7
	push	OFFSET FLAT:$SG70839
	lea	eax, DWORD PTR _sql$[ebp]
	push	eax
	call	_dynbuf_add
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L70838
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29872], OFFSET FLAT:$SG70841
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 461		; 000001cdH
	jmp	$eva_err$70757
$L70838:

; 462  : 		else if(!strcmp(fmt, "_EVA_NORMAL"))DYNBUF_ADD_STR(&sql, "TEXT")

	jmp	$L70852
$L70835:
	push	OFFSET FLAT:$SG70844
	mov	eax, DWORD PTR _fmt$70788[ebp]
	push	eax
	call	_strcmp
	add	esp, 8
	test	eax, eax
	jne	SHORT $L70843
	push	0
	push	0
	push	4
	push	OFFSET FLAT:$SG70847
	lea	ecx, DWORD PTR _sql$[ebp]
	push	ecx
	call	_dynbuf_add
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L70846
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29872], OFFSET FLAT:$SG70849
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 462		; 000001ceH
	jmp	$eva_err$70757
$L70846:

; 463  : 		else DYNBUF_ADD_STR(&sql, "CHAR(32)");

	jmp	SHORT $L70852
$L70843:
	push	0
	push	0
	push	8
	push	OFFSET FLAT:$SG70853
	lea	ecx, DWORD PTR _sql$[ebp]
	push	ecx
	call	_dynbuf_add
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L70852
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29872], OFFSET FLAT:$SG70855
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 463		; 000001cfH
	jmp	$eva_err$70757
$L70852:

; 464  : 	}

	jmp	$L70786
$L70787:

; 465  : 	DYNBUF_ADD_STR(&sql, "\n) TYPE=HEAP");

	push	0
	push	0
	push	12					; 0000000cH
	push	OFFSET FLAT:$SG70858
	lea	ecx, DWORD PTR _sql$[ebp]
	push	ecx
	call	_dynbuf_add
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L70857
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29872], OFFSET FLAT:$SG70860
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 465		; 000001d1H
	jmp	$eva_err$70757
$L70857:

; 466  : 	if(DYNTAB_FIELD_CELL(&attr, DEBUG_SQL_FILTER)) cntxt->sql_trace = DEBUG_SQL_RES;

	push	0
	push	-1
	push	OFFSET FLAT:$SG70862
	lea	ecx, DWORD PTR _attr$[ebp]
	push	ecx
	call	_dyntab_field_cell
	add	esp, 16					; 00000010H
	test	eax, eax
	je	SHORT $L70861
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29852], 2
$L70861:

; 467  : 	if(sql_exec_query(cntxt, sql->data)) CLEAR_ERROR_RETURN;

	mov	eax, DWORD PTR _sql$[ebp]
	add	eax, 8
	push	eax
	mov	ecx, DWORD PTR _cntxt$[ebp]
	push	ecx
	call	_sql_exec_query
	add	esp, 8
	test	eax, eax
	je	SHORT $L70863
	push	467					; 000001d3H
	push	OFFSET FLAT:$SG70864
	push	OFFSET FLAT:$SG70865
	mov	edx, DWORD PTR _cntxt$[ebp]
	push	edx
	call	_err_clear
	add	esp, 16					; 00000010H
	jmp	$eva_noerr$70866
$L70863:

; 468  : 
; 469  : 	/* Insert objects from list filters */
; 470  : 	DYNTAB_FIELD(&data, &attr, BASE_FORMS);

	lea	eax, DWORD PTR _data$[ebp]
	push	eax
	call	_dyntab_free
	add	esp, 4
	push	0
	push	-1
	push	OFFSET FLAT:$SG70869
	lea	ecx, DWORD PTR _attr$[ebp]
	push	ecx
	push	0
	lea	edx, DWORD PTR _data$[ebp]
	push	edx
	call	_dyntab_filter_field
	add	esp, 24					; 00000018H
	test	eax, eax
	je	SHORT $L70868
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29872], OFFSET FLAT:$SG70871
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 470		; 000001d6H
	jmp	$eva_err$70757
$L70868:

; 471  : 	if(data.nbrows && qry_add_filter_forms(cntxt, &flt, &data, NULL)) STACK_ERROR;

	cmp	DWORD PTR _data$[ebp], 0
	je	SHORT $L70873
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
	je	SHORT $L70873
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 471		; 000001d7H
	jmp	$eva_err$70757
$L70873:

; 472  : 	if(qry_parse_filter_nodes(cntxt, &flt, &attr) || qry_filter_table(cntxt, tbl, &flt, 2)) STACK_ERROR;

	lea	eax, DWORD PTR _attr$[ebp]
	push	eax
	lea	ecx, DWORD PTR _flt$[ebp]
	push	ecx
	mov	edx, DWORD PTR _cntxt$[ebp]
	push	edx
	call	_qry_parse_filter_nodes
	add	esp, 12					; 0000000cH
	test	eax, eax
	jne	SHORT $L70875
	push	2
	lea	eax, DWORD PTR _flt$[ebp]
	push	eax
	lea	ecx, DWORD PTR _tbl$[ebp]
	push	ecx
	mov	edx, DWORD PTR _cntxt$[ebp]
	push	edx
	call	_qry_filter_table
	add	esp, 16					; 00000010H
	test	eax, eax
	je	SHORT $L70874
$L70875:
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 472		; 000001d8H
	jmp	$eva_err$70757
$L70874:

; 473  : 
; 474  : 	/* Fill table columns from fields definition */
; 475  : 	DYNTAB_FIELD_TAB(&field, &attr, DISPLAYFIELDS);

	lea	ecx, DWORD PTR _field$[ebp]
	push	ecx
	call	_dyntab_free
	add	esp, 4
	push	0
	push	-1
	push	OFFSET FLAT:$SG70879
	lea	edx, DWORD PTR _attr$[ebp]
	push	edx
	push	0
	lea	eax, DWORD PTR _field$[ebp]
	push	eax
	call	_dyntab_filter_field
	add	esp, 24					; 00000018H
	test	eax, eax
	jne	SHORT $L70878
	lea	ecx, DWORD PTR _field$[ebp]
	push	ecx
	call	_dyntab_order_lines
	add	esp, 4
	test	eax, eax
	je	SHORT $L70877
$L70878:
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29872], OFFSET FLAT:$SG70881
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 475		; 000001dbH
	jmp	$eva_err$70757
$L70877:

; 476  : 	DYNTAB_FIELD_TAB(&debug, &attr, DEBUG_SQL_EXPR);

	lea	ecx, DWORD PTR _debug$[ebp]
	push	ecx
	call	_dyntab_free
	add	esp, 4
	push	0
	push	-1
	push	OFFSET FLAT:$SG70885
	lea	edx, DWORD PTR _attr$[ebp]
	push	edx
	push	0
	lea	eax, DWORD PTR _debug$[ebp]
	push	eax
	call	_dyntab_filter_field
	add	esp, 24					; 00000018H
	test	eax, eax
	jne	SHORT $L70884
	lea	ecx, DWORD PTR _debug$[ebp]
	push	ecx
	call	_dyntab_order_lines
	add	esp, 4
	test	eax, eax
	je	SHORT $L70883
$L70884:
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29872], OFFSET FLAT:$SG70887
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 476		; 000001dcH
	jmp	$eva_err$70757
$L70883:

; 477  : 	for(i = 0; i < label.nbrows; i++)

	mov	DWORD PTR _i$[ebp], 0
	jmp	SHORT $L70888
$L70889:
	mov	ecx, DWORD PTR _i$[ebp]
	add	ecx, 1
	mov	DWORD PTR _i$[ebp], ecx
$L70888:
	mov	edx, DWORD PTR _i$[ebp]
	cmp	edx, DWORD PTR _label$[ebp]
	jae	$eva_noerr$70866

; 479  : 		/* Parse field expression - continue if empty */
; 480  : 		DynTableCell *fld = dyntab_cell(&field, i, 0);

	push	0
	mov	eax, DWORD PTR _i$[ebp]
	push	eax
	lea	ecx, DWORD PTR _field$[ebp]
	push	ecx
	call	_dyntab_cell
	add	esp, 12					; 0000000cH
	mov	DWORD PTR _fld$70891[ebp], eax

; 481  : 		if(!fld || !fld->len) continue;

	cmp	DWORD PTR _fld$70891[ebp], 0
	je	SHORT $L70893
	mov	edx, DWORD PTR _fld$70891[ebp]
	cmp	DWORD PTR [edx+4], 0
	jne	SHORT $L70892
$L70893:
	jmp	SHORT $L70889
$L70892:

; 482  : 		cntxt->sql_trace = dyntab_sz(&debug, i, 0) ? DEBUG_SQL_RES : sqltrace;

	push	0
	mov	eax, DWORD PTR _i$[ebp]
	push	eax
	lea	ecx, DWORD PTR _debug$[ebp]
	push	ecx
	call	_dyntab_sz
	add	esp, 12					; 0000000cH
	test	eax, eax
	je	SHORT $L74348
	mov	DWORD PTR -4788+[ebp], 2
	jmp	SHORT $L74349
$L74348:
	mov	edx, DWORD PTR _sqltrace$[ebp]
	mov	DWORD PTR -4788+[ebp], edx
$L74349:
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	ecx, DWORD PTR -4788+[ebp]
	mov	DWORD PTR [eax+29852], ecx

; 483  : 		qry_build_free(&flt);

	lea	edx, DWORD PTR _flt$[ebp]
	push	edx
	call	_qry_build_free
	add	esp, 4

; 484  : 		if(qry_parse_fieldexpr(cntxt, DYNTAB_VAL_SZ(&field, i, 0), &flt)) STACK_ERROR;

	lea	eax, DWORD PTR _flt$[ebp]
	push	eax
	push	0
	mov	ecx, DWORD PTR _i$[ebp]
	push	ecx
	lea	edx, DWORD PTR _field$[ebp]
	push	edx
	call	_dyntab_sz
	add	esp, 12					; 0000000cH
	push	eax
	push	0
	mov	eax, DWORD PTR _i$[ebp]
	push	eax
	lea	ecx, DWORD PTR _field$[ebp]
	push	ecx
	call	_dyntab_val
	add	esp, 12					; 0000000cH
	push	eax
	mov	edx, DWORD PTR _cntxt$[ebp]
	push	edx
	call	_qry_parse_fieldexpr
	add	esp, 16					; 00000010H
	test	eax, eax
	je	SHORT $L70894
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 484		; 000001e4H
	jmp	$eva_err$70757
$L70894:

; 485  : 		if(!flt.select) continue;

	cmp	DWORD PTR _flt$[ebp+28], 0
	jne	SHORT $L70895
	jmp	$L70889
$L70895:

; 486  : 
; 487  : 		M_FREE(sql);

	mov	ecx, DWORD PTR _sql$[ebp]
	push	ecx
	call	_mem_free
	add	esp, 4
	mov	DWORD PTR _sql$[ebp], 0

; 488  : 		if(flt.groupfn)

	cmp	DWORD PTR _flt$[ebp+44], 0
	je	$L70896

; 490  : 			/* Query uses group function : use intermediate temporary table */
; 491  : 			DYNBUF_ADD3(&sql, "DROP TABLE IF EXISTS ", tmp, sz_tmp, NO_CONV, "");

	push	0
	push	OFFSET FLAT:$SG70899
	push	0
	push	0
	mov	edx, DWORD PTR _sz_tmp$[ebp]
	push	edx
	lea	eax, DWORD PTR _tmp$[ebp]
	push	eax
	push	21					; 00000015H
	push	OFFSET FLAT:$SG70900
	lea	ecx, DWORD PTR _sql$[ebp]
	push	ecx
	call	_dynbuf_add3
	add	esp, 36					; 00000024H
	test	eax, eax
	je	SHORT $L70898
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29872], OFFSET FLAT:$SG70902
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 491		; 000001ebH
	jmp	$eva_err$70757
$L70898:

; 492  : 			if(sql_exec_query(cntxt, sql->data)) STACK_ERROR;

	mov	ecx, DWORD PTR _sql$[ebp]
	add	ecx, 8
	push	ecx
	mov	edx, DWORD PTR _cntxt$[ebp]
	push	edx
	call	_sql_exec_query
	add	esp, 8
	test	eax, eax
	je	SHORT $L70903
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 492		; 000001ecH
	jmp	$eva_err$70757
$L70903:

; 493  : 			M_FREE(sql);

	mov	ecx, DWORD PTR _sql$[ebp]
	push	ecx
	call	_mem_free
	add	esp, 4
	mov	DWORD PTR _sql$[ebp], 0

; 494  : 			DYNBUF_ADD3_CELL(&sql, "-- Create values table for column [", &label, i, 0, NO_CONV, "]\n");

	push	2
	push	OFFSET FLAT:$SG70906
	push	0
	push	0
	push	0
	mov	edx, DWORD PTR _i$[ebp]
	push	edx
	lea	eax, DWORD PTR _label$[ebp]
	push	eax
	call	_dyntab_sz
	add	esp, 12					; 0000000cH
	push	eax
	push	0
	mov	ecx, DWORD PTR _i$[ebp]
	push	ecx
	lea	edx, DWORD PTR _label$[ebp]
	push	edx
	call	_dyntab_val
	add	esp, 12					; 0000000cH
	push	eax
	push	35					; 00000023H
	push	OFFSET FLAT:$SG70907
	lea	eax, DWORD PTR _sql$[ebp]
	push	eax
	call	_dynbuf_add3
	add	esp, 36					; 00000024H
	test	eax, eax
	je	SHORT $L70905
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29872], OFFSET FLAT:$SG70909
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 494		; 000001eeH
	jmp	$eva_err$70757
$L70905:

; 495  : 			DYNBUF_ADD3(&sql, "CREATE TEMPORARY TABLE ", tmp, sz_tmp, NO_CONV, " TYPE=HEAP\n");

	push	11					; 0000000bH
	push	OFFSET FLAT:$SG70912
	push	0
	push	0
	mov	eax, DWORD PTR _sz_tmp$[ebp]
	push	eax
	lea	ecx, DWORD PTR _tmp$[ebp]
	push	ecx
	push	23					; 00000017H
	push	OFFSET FLAT:$SG70913
	lea	edx, DWORD PTR _sql$[ebp]
	push	edx
	call	_dynbuf_add3
	add	esp, 36					; 00000024H
	test	eax, eax
	je	SHORT $L70911
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29872], OFFSET FLAT:$SG70915
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 495		; 000001efH
	jmp	$eva_err$70757
$L70911:

; 496  : 			flt.srctable = tbl;

	lea	edx, DWORD PTR _tbl$[ebp]
	mov	DWORD PTR _flt$[ebp+20], edx

; 497  : 			if(qry_build_flt_select(cntxt, &sql, &empty, &flt, 0, 0) || qry_exec_filter(cntxt, &flt, sql->data)) STACK_ERROR;

	push	0
	push	0
	lea	eax, DWORD PTR _flt$[ebp]
	push	eax
	lea	ecx, DWORD PTR _empty$[ebp]
	push	ecx
	lea	edx, DWORD PTR _sql$[ebp]
	push	edx
	mov	eax, DWORD PTR _cntxt$[ebp]
	push	eax
	call	_qry_build_flt_select
	add	esp, 24					; 00000018H
	test	eax, eax
	jne	SHORT $L70917
	mov	ecx, DWORD PTR _sql$[ebp]
	add	ecx, 8
	push	ecx
	lea	edx, DWORD PTR _flt$[ebp]
	push	edx
	mov	eax, DWORD PTR _cntxt$[ebp]
	push	eax
	call	_qry_exec_filter
	add	esp, 12					; 0000000cH
	test	eax, eax
	je	SHORT $L70916
$L70917:
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 497		; 000001f1H
	jmp	$eva_err$70757
$L70916:

; 498  : 			M_FREE(sql);

	mov	edx, DWORD PTR _sql$[ebp]
	push	edx
	call	_mem_free
	add	esp, 4
	mov	DWORD PTR _sql$[ebp], 0

; 499  : 			DYNBUF_ADD3_CELL(&sql, "-- Update values from table for column [", &label, i, 0, NO_CONV, "]\n");

	push	2
	push	OFFSET FLAT:$SG70920
	push	0
	push	0
	push	0
	mov	eax, DWORD PTR _i$[ebp]
	push	eax
	lea	ecx, DWORD PTR _label$[ebp]
	push	ecx
	call	_dyntab_sz
	add	esp, 12					; 0000000cH
	push	eax
	push	0
	mov	edx, DWORD PTR _i$[ebp]
	push	edx
	lea	eax, DWORD PTR _label$[ebp]
	push	eax
	call	_dyntab_val
	add	esp, 12					; 0000000cH
	push	eax
	push	40					; 00000028H
	push	OFFSET FLAT:$SG70921
	lea	ecx, DWORD PTR _sql$[ebp]
	push	ecx
	call	_dynbuf_add3
	add	esp, 36					; 00000024H
	test	eax, eax
	je	SHORT $L70919
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29872], OFFSET FLAT:$SG70923
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 499		; 000001f3H
	jmp	$eva_err$70757
$L70919:

; 500  : 			DYNBUF_ADD3(&sql, "UPDATE ", tbl, sz_tbl, NO_CONV, ",");

	push	1
	push	OFFSET FLAT:$SG70926
	push	0
	push	0
	mov	ecx, DWORD PTR _sz_tbl$[ebp]
	push	ecx
	lea	edx, DWORD PTR _tbl$[ebp]
	push	edx
	push	7
	push	OFFSET FLAT:$SG70927
	lea	eax, DWORD PTR _sql$[ebp]
	push	eax
	call	_dynbuf_add3
	add	esp, 36					; 00000024H
	test	eax, eax
	je	SHORT $L70925
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29872], OFFSET FLAT:$SG70929
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 500		; 000001f4H
	jmp	$eva_err$70757
$L70925:

; 501  : 			DYNBUF_ADD(&sql, tmp, sz_tmp, NO_CONV);

	push	0
	push	0
	mov	eax, DWORD PTR _sz_tmp$[ebp]
	push	eax
	lea	ecx, DWORD PTR _tmp$[ebp]
	push	ecx
	lea	edx, DWORD PTR _sql$[ebp]
	push	edx
	call	_dynbuf_add
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L70931
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29872], OFFSET FLAT:$SG70933
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 501		; 000001f5H
	jmp	$eva_err$70757
$L70931:

; 502  : 			DYNBUF_ADD3(&sql, " SET ", tbl, sz_tbl, NO_CONV, ".`");

	push	2
	push	OFFSET FLAT:$SG70936
	push	0
	push	0
	mov	edx, DWORD PTR _sz_tbl$[ebp]
	push	edx
	lea	eax, DWORD PTR _tbl$[ebp]
	push	eax
	push	5
	push	OFFSET FLAT:$SG70937
	lea	ecx, DWORD PTR _sql$[ebp]
	push	ecx
	call	_dynbuf_add3
	add	esp, 36					; 00000024H
	test	eax, eax
	je	SHORT $L70935
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29872], OFFSET FLAT:$SG70939
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 502		; 000001f6H
	jmp	$eva_err$70757
$L70935:

; 503  : 			DYNBUF_ADD_CELL(&sql, &label, i, 0, NO_CONV);

	push	0
	push	0
	push	0
	mov	ecx, DWORD PTR _i$[ebp]
	push	ecx
	lea	edx, DWORD PTR _label$[ebp]
	push	edx
	call	_dyntab_sz
	add	esp, 12					; 0000000cH
	push	eax
	push	0
	mov	eax, DWORD PTR _i$[ebp]
	push	eax
	lea	ecx, DWORD PTR _label$[ebp]
	push	ecx
	call	_dyntab_val
	add	esp, 12					; 0000000cH
	push	eax
	lea	edx, DWORD PTR _sql$[ebp]
	push	edx
	call	_dynbuf_add
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L70941
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29872], OFFSET FLAT:$SG70943
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 503		; 000001f7H
	jmp	$eva_err$70757
$L70941:

; 504  : 			DYNBUF_ADD3(&sql, "`=", tmp, sz_tmp, NO_CONV, ".Val\n");

	push	5
	push	OFFSET FLAT:$SG70946
	push	0
	push	0
	mov	edx, DWORD PTR _sz_tmp$[ebp]
	push	edx
	lea	eax, DWORD PTR _tmp$[ebp]
	push	eax
	push	2
	push	OFFSET FLAT:$SG70947
	lea	ecx, DWORD PTR _sql$[ebp]
	push	ecx
	call	_dynbuf_add3
	add	esp, 36					; 00000024H
	test	eax, eax
	je	SHORT $L70945
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29872], OFFSET FLAT:$SG70949
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 504		; 000001f8H
	jmp	$eva_err$70757
$L70945:

; 505  : 			DYNBUF_ADD3(&sql, "WHERE ", tbl, sz_tbl, NO_CONV, ".IdObj=");

	push	7
	push	OFFSET FLAT:$SG70952
	push	0
	push	0
	mov	ecx, DWORD PTR _sz_tbl$[ebp]
	push	ecx
	lea	edx, DWORD PTR _tbl$[ebp]
	push	edx
	push	6
	push	OFFSET FLAT:$SG70953
	lea	eax, DWORD PTR _sql$[ebp]
	push	eax
	call	_dynbuf_add3
	add	esp, 36					; 00000024H
	test	eax, eax
	je	SHORT $L70951
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29872], OFFSET FLAT:$SG70955
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 505		; 000001f9H
	jmp	$eva_err$70757
$L70951:

; 506  : 			DYNBUF_ADD(&sql, tmp, sz_tmp, NO_CONV);

	push	0
	push	0
	mov	eax, DWORD PTR _sz_tmp$[ebp]
	push	eax
	lea	ecx, DWORD PTR _tmp$[ebp]
	push	ecx
	lea	edx, DWORD PTR _sql$[ebp]
	push	edx
	call	_dynbuf_add
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L70957
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29872], OFFSET FLAT:$SG70959
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 506		; 000001faH
	jmp	$eva_err$70757
$L70957:

; 507  : 			DYNBUF_ADD_STR(&sql, ".IdObj");

	push	0
	push	0
	push	6
	push	OFFSET FLAT:$SG70962
	lea	edx, DWORD PTR _sql$[ebp]
	push	edx
	call	_dynbuf_add
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L70961
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29872], OFFSET FLAT:$SG70964
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 507		; 000001fbH
	jmp	$eva_err$70757
$L70961:

; 508  : 			if(sql_exec_query(cntxt, sql->data)) STACK_ERROR;

	mov	edx, DWORD PTR _sql$[ebp]
	add	edx, 8
	push	edx
	mov	eax, DWORD PTR _cntxt$[ebp]
	push	eax
	call	_sql_exec_query
	add	esp, 8
	test	eax, eax
	je	SHORT $L70965
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 508		; 000001fcH
	jmp	$eva_err$70757
$L70965:

; 510  : 		else

	jmp	$L71027
$L70896:

; 512  : 			DYNBUF_ADD3_CELL(&sql, "-- Update values for column [", &label, i, 0, NO_CONV, "]\n");

	push	2
	push	OFFSET FLAT:$SG70969
	push	0
	push	0
	push	0
	mov	edx, DWORD PTR _i$[ebp]
	push	edx
	lea	eax, DWORD PTR _label$[ebp]
	push	eax
	call	_dyntab_sz
	add	esp, 12					; 0000000cH
	push	eax
	push	0
	mov	ecx, DWORD PTR _i$[ebp]
	push	ecx
	lea	edx, DWORD PTR _label$[ebp]
	push	edx
	call	_dyntab_val
	add	esp, 12					; 0000000cH
	push	eax
	push	29					; 0000001dH
	push	OFFSET FLAT:$SG70970
	lea	eax, DWORD PTR _sql$[ebp]
	push	eax
	call	_dynbuf_add3
	add	esp, 36					; 00000024H
	test	eax, eax
	je	SHORT $L70968
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29872], OFFSET FLAT:$SG70972
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 512		; 00000200H
	jmp	$eva_err$70757
$L70968:

; 513  : 			DYNBUF_ADD3(&sql, "UPDATE ", tbl, sz_tbl, NO_CONV, ",TLink AS TLink0\n");

	push	17					; 00000011H
	push	OFFSET FLAT:$SG70975
	push	0
	push	0
	mov	eax, DWORD PTR _sz_tbl$[ebp]
	push	eax
	lea	ecx, DWORD PTR _tbl$[ebp]
	push	ecx
	push	7
	push	OFFSET FLAT:$SG70976
	lea	edx, DWORD PTR _sql$[ebp]
	push	edx
	call	_dynbuf_add3
	add	esp, 36					; 00000024H
	test	eax, eax
	je	SHORT $L70974
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29872], OFFSET FLAT:$SG70978
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 513		; 00000201H
	jmp	$eva_err$70757
$L70974:

; 514  : 			if(flt.join) DYNBUF_ADD_BUF(&sql, flt.join, NO_CONV);

	cmp	DWORD PTR _flt$[ebp+36], 0
	je	SHORT $L70981
	cmp	DWORD PTR _flt$[ebp+36], 0
	je	SHORT $L70981
	push	0
	push	0
	mov	edx, DWORD PTR _flt$[ebp+36]
	mov	eax, DWORD PTR [edx+4]
	push	eax
	mov	ecx, DWORD PTR _flt$[ebp+36]
	add	ecx, 8
	push	ecx
	lea	edx, DWORD PTR _sql$[ebp]
	push	edx
	call	_dynbuf_add
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L70981
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29872], OFFSET FLAT:$SG70983
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 514		; 00000202H
	jmp	$eva_err$70757
$L70981:

; 515  : 			DYNBUF_ADD3(&sql, "SET ", tbl, sz_tbl, NO_CONV, ".`");

	push	2
	push	OFFSET FLAT:$SG70986
	push	0
	push	0
	mov	edx, DWORD PTR _sz_tbl$[ebp]
	push	edx
	lea	eax, DWORD PTR _tbl$[ebp]
	push	eax
	push	4
	push	OFFSET FLAT:$SG70987
	lea	ecx, DWORD PTR _sql$[ebp]
	push	ecx
	call	_dynbuf_add3
	add	esp, 36					; 00000024H
	test	eax, eax
	je	SHORT $L70985
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29872], OFFSET FLAT:$SG70989
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 515		; 00000203H
	jmp	$eva_err$70757
$L70985:

; 516  : 			DYNBUF_ADD_CELL(&sql, &label, i, 0, NO_CONV);

	push	0
	push	0
	push	0
	mov	ecx, DWORD PTR _i$[ebp]
	push	ecx
	lea	edx, DWORD PTR _label$[ebp]
	push	edx
	call	_dyntab_sz
	add	esp, 12					; 0000000cH
	push	eax
	push	0
	mov	eax, DWORD PTR _i$[ebp]
	push	eax
	lea	ecx, DWORD PTR _label$[ebp]
	push	ecx
	call	_dyntab_val
	add	esp, 12					; 0000000cH
	push	eax
	lea	edx, DWORD PTR _sql$[ebp]
	push	edx
	call	_dynbuf_add
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L70991
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29872], OFFSET FLAT:$SG70993
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 516		; 00000204H
	jmp	$eva_err$70757
$L70991:

; 517  : 			DYNBUF_ADD3_BUF(&sql, "`=", flt.select, NO_CONV, "\n");

	cmp	DWORD PTR _flt$[ebp+28], 0
	je	SHORT $L74350
	mov	edx, DWORD PTR _flt$[ebp+28]
	mov	eax, DWORD PTR [edx+4]
	mov	DWORD PTR -4792+[ebp], eax
	jmp	SHORT $L74351
$L74350:
	mov	DWORD PTR -4792+[ebp], 0
$L74351:
	cmp	DWORD PTR _flt$[ebp+28], 0
	je	SHORT $L74352
	mov	ecx, DWORD PTR _flt$[ebp+28]
	add	ecx, 8
	mov	DWORD PTR -4796+[ebp], ecx
	jmp	SHORT $L74353
$L74352:
	mov	DWORD PTR -4796+[ebp], 0
$L74353:
	push	1
	push	OFFSET FLAT:$SG70997
	push	0
	push	0
	mov	edx, DWORD PTR -4792+[ebp]
	push	edx
	mov	eax, DWORD PTR -4796+[ebp]
	push	eax
	push	2
	push	OFFSET FLAT:$SG70998
	lea	ecx, DWORD PTR _sql$[ebp]
	push	ecx
	call	_dynbuf_add3
	add	esp, 36					; 00000024H
	test	eax, eax
	je	SHORT $L70996
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29872], OFFSET FLAT:$SG71000
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 517		; 00000205H
	jmp	$eva_err$70757
$L70996:

; 518  : 			DYNBUF_ADD3(&sql, "WHERE ", tbl, sz_tbl, NO_CONV, ".IdObj=TLink0.");

	push	14					; 0000000eH
	push	OFFSET FLAT:$SG71003
	push	0
	push	0
	mov	ecx, DWORD PTR _sz_tbl$[ebp]
	push	ecx
	lea	edx, DWORD PTR _tbl$[ebp]
	push	edx
	push	6
	push	OFFSET FLAT:$SG71004
	lea	eax, DWORD PTR _sql$[ebp]
	push	eax
	call	_dynbuf_add3
	add	esp, 36					; 00000024H
	test	eax, eax
	je	SHORT $L71002
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29872], OFFSET FLAT:$SG71006
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 518		; 00000206H
	jmp	$eva_err$70757
$L71002:

; 519  : 			if(flt.b_userelobj) DYNBUF_ADD_STR(&sql, "IdRelObj") else DYNBUF_ADD_STR(&sql, "IdObj");

	cmp	DWORD PTR _flt$[ebp+4436], 0
	je	SHORT $L71007
	push	0
	push	0
	push	8
	push	OFFSET FLAT:$SG71010
	lea	eax, DWORD PTR _sql$[ebp]
	push	eax
	call	_dynbuf_add
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L71009
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29872], OFFSET FLAT:$SG71012
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 519		; 00000207H
	jmp	$eva_err$70757
$L71009:
	jmp	SHORT $L71015
$L71007:
	push	0
	push	0
	push	5
	push	OFFSET FLAT:$SG71016
	lea	eax, DWORD PTR _sql$[ebp]
	push	eax
	call	_dynbuf_add
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L71015
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29872], OFFSET FLAT:$SG71018
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 519		; 00000207H
	jmp	$eva_err$70757
$L71015:

; 520  : 			if(flt.where) DYNBUF_ADD3_BUF(&sql, "\nAND ", flt.where, NO_CONV, "");

	cmp	DWORD PTR _flt$[ebp+40], 0
	je	$L71022
	cmp	DWORD PTR _flt$[ebp+40], 0
	je	SHORT $L74354
	mov	eax, DWORD PTR _flt$[ebp+40]
	mov	ecx, DWORD PTR [eax+4]
	mov	DWORD PTR -4800+[ebp], ecx
	jmp	SHORT $L74355
$L74354:
	mov	DWORD PTR -4800+[ebp], 0
$L74355:
	cmp	DWORD PTR _flt$[ebp+40], 0
	je	SHORT $L74356
	mov	edx, DWORD PTR _flt$[ebp+40]
	add	edx, 8
	mov	DWORD PTR -4804+[ebp], edx
	jmp	SHORT $L74357
$L74356:
	mov	DWORD PTR -4804+[ebp], 0
$L74357:
	push	0
	push	OFFSET FLAT:$SG71023
	push	0
	push	0
	mov	eax, DWORD PTR -4800+[ebp]
	push	eax
	mov	ecx, DWORD PTR -4804+[ebp]
	push	ecx
	push	5
	push	OFFSET FLAT:$SG71024
	lea	edx, DWORD PTR _sql$[ebp]
	push	edx
	call	_dynbuf_add3
	add	esp, 36					; 00000024H
	test	eax, eax
	je	SHORT $L71022
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29872], OFFSET FLAT:$SG71026
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 520		; 00000208H
	jmp	SHORT $eva_err$70757
$L71022:

; 521  : 			if(qry_exec_filter(cntxt, &flt, sql->data)) STACK_ERROR;

	mov	edx, DWORD PTR _sql$[ebp]
	add	edx, 8
	push	edx
	lea	eax, DWORD PTR _flt$[ebp]
	push	eax
	mov	ecx, DWORD PTR _cntxt$[ebp]
	push	ecx
	call	_qry_exec_filter
	add	esp, 12					; 0000000cH
	test	eax, eax
	je	SHORT $L71027
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 521		; 00000209H
	jmp	SHORT $eva_err$70757
$L71027:

; 523  : 	}

	jmp	$L70889
$eva_noerr$70866:

; 524  : 
; 525  : 	RETURN_OK_CLEANUP;

	push	0
	push	OFFSET FLAT:$SG71028
	push	OFFSET FLAT:$SG71029
	mov	eax, DWORD PTR _cntxt$[ebp]
	push	eax
	call	_err_clear
	add	esp, 16					; 00000010H
$eva_err$70757:
	mov	ecx, DWORD PTR _cntxt$[ebp]
	cmp	DWORD PTR [ecx+29872], 0
	je	SHORT $L71030
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	eax, DWORD PTR [edx+29900]
	push	eax
	push	OFFSET FLAT:$SG71031
	push	OFFSET FLAT:$SG71032
	mov	ecx, DWORD PTR _cntxt$[ebp]
	push	ecx
	call	_err_add_context
	add	esp, 16					; 00000010H
$L71030:
	mov	edx, DWORD PTR _sql$[ebp]
	push	edx
	call	_mem_free
	add	esp, 4
	mov	DWORD PTR _sql$[ebp], 0
	lea	eax, DWORD PTR _flt$[ebp]
	push	eax
	call	_qry_build_free
	add	esp, 4
	lea	ecx, DWORD PTR _attr$[ebp]
	push	ecx
	call	_dyntab_free
	add	esp, 4
	lea	edx, DWORD PTR _label$[ebp]
	push	edx
	call	_dyntab_free
	add	esp, 4
	lea	eax, DWORD PTR _field$[ebp]
	push	eax
	call	_dyntab_free
	add	esp, 4
	lea	ecx, DWORD PTR _format$[ebp]
	push	ecx
	call	_dyntab_free
	add	esp, 4
	lea	edx, DWORD PTR _debug$[ebp]
	push	edx
	call	_dyntab_free
	add	esp, 4
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	ecx, DWORD PTR _sqltrace$[ebp]
	mov	DWORD PTR [eax+29852], ecx
	lea	edx, DWORD PTR _data$[ebp]
	push	edx
	call	_dyntab_free
	add	esp, 4
	mov	eax, DWORD PTR _cntxt$[ebp]
	xor	ecx, ecx
	cmp	DWORD PTR [eax+29872], 0
	setne	cl
	mov	eax, ecx

; 526  : }

	pop	edi
	mov	esp, ebp
	pop	ebp
	ret	0
_qry_table_from_list ENDP
_TEXT	ENDS
PUBLIC	_qry_eval_sqlexpr_var
EXTRN	_form_eval_fieldexpr:NEAR
EXTRN	__pctype:DWORD
EXTRN	__isctype:NEAR
EXTRN	_form_eval_valtype:NEAR
EXTRN	___mb_cur_max:DWORD
EXTRN	_sql_id_value:NEAR
EXTRN	_dyntab_set_txt:NEAR
EXTRN	_strncmp:NEAR
EXTRN	_dyntab_txt_cmp:NEAR
EXTRN	_dyntab_group:NEAR
_BSS	SEGMENT
	ALIGN	4

$SG71144 DB	01H DUP (?)
	ALIGN	4

$SG71158 DB	01H DUP (?)
	ALIGN	4

$SG71166 DB	01H DUP (?)
	ALIGN	4

$SG71174 DB	01H DUP (?)
	ALIGN	4

$SG71309 DB	01H DUP (?)
_BSS	ENDS
_DATA	SEGMENT
$SG71063 DB	'_EVA_VAR_NAME', 00H
	ORG $+2
$SG71065 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG71071 DB	'_EVA_VAR_NAME', 00H
	ORG $+2
$SG71073 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG71077 DB	'_EVA_VAR_NAME', 00H
	ORG $+2
$SG71079 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG71099 DB	'CUROBJ', 00H
	ORG $+1
$SG71100 DB	'CUROBJ', 00H
	ORG $+1
$SG71105 DB	'CURFORM', 00H
$SG71106 DB	'CURFORM', 00H
$SG71110 DB	'CURCTL', 00H
	ORG $+1
$SG71111 DB	'CURCTL', 00H
	ORG $+1
$SG71115 DB	'MAINFORM', 00H
	ORG $+3
$SG71116 DB	'MAINFORM', 00H
	ORG $+3
$SG71120 DB	'MAINOBJ', 00H
$SG71121 DB	'MAINOBJ', 00H
$SG71125 DB	'USER', 00H
	ORG $+3
$SG71126 DB	'USER', 00H
	ORG $+3
$SG71131 DB	'SESSION', 00H
$SG71132 DB	'SESSION', 00H
$SG71137 DB	'SELTAB', 00H
	ORG $+1
$SG71138 DB	'SELTAB', 00H
	ORG $+1
$SG71143 DB	'TIME', 00H
	ORG $+3
$SG71148 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG71151 DB	'SRVCNF', 00H
	ORG $+1
$SG71152 DB	'SRVCNF', 00H
	ORG $+1
$SG71157 DB	'SRVNAME', 00H
$SG71162 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG71165 DB	'SRVADR', 00H
	ORG $+1
$SG71170 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG71173 DB	'QRYSTR', 00H
	ORG $+1
$SG71178 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG71181 DB	'NUM', 00H
$SG71182 DB	'.', 00H
	ORG $+2
$SG71184 DB	'%lu', 00H
$SG71188 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG71191 DB	'LINE', 00H
	ORG $+3
$SG71192 DB	'.', 00H
	ORG $+2
$SG71194 DB	'%lu', 00H
$SG71198 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG71201 DB	'SRCTBL', 00H
	ORG $+1
$SG71202 DB	'.', 00H
	ORG $+2
$SG71205 DB	'V0', 00H
	ORG $+1
$SG71206 DB	'NULL', 00H
	ORG $+3
$SG71208 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG71211 DB	'SRCOBJ', 00H
	ORG $+1
$SG71212 DB	'.', 00H
	ORG $+2
$SG71215 DB	'V0', 00H
	ORG $+1
$SG71216 DB	'%s.IdObj', 00H
	ORG $+3
$SG71217 DB	'IdObj', 00H
	ORG $+2
$SG71219 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG71224 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG71226 DB	'Invalid symbol', 00H
	ORG $+1
$SG71229 DB	0aH, 'Expression :', 0aH, 00H
	ORG $+1
$SG71230 DB	'Symbol : ', 00H
	ORG $+2
$SG71232 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG71236 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG71237 DB	'D:\Travail\ABI\EVA\V4.0\CGI\Brunix-2016\qry_build.c', 00H
$SG71238 DB	'qry_eval_sqlexpr_var', 00H
	ORG $+3
$SG71241 DB	'''''', 00H
	ORG $+1
$SG71243 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG71248 DB	'''', 00H
	ORG $+2
$SG71249 DB	'''', 00H
	ORG $+2
$SG71251 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG71257 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG71262 DB	'CUROBJ', 00H
	ORG $+1
$SG71263 DB	'D:\Travail\ABI\EVA\V4.0\CGI\Brunix-2016\qry_build.c', 00H
$SG71264 DB	'qry_eval_sqlexpr_var', 00H
	ORG $+3
$SG71267 DB	'NULL', 00H
	ORG $+3
$SG71269 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG71274 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG71289 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG71307 DB	'variable : ', 00H
$SG71310 DB	'Unknown variable in SQL expression', 00H
	ORG $+1
$SG71312 DB	'_EVA_VAR_SRC', 00H
	ORG $+3
$SG71318 DB	'_EVA_TEMP_TABLE', 00H
$SG71322 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG71327 DB	'_EVA_VAR_FMT', 00H
	ORG $+3
$SG71329 DB	'_EVA_VAR_FUNC', 00H
	ORG $+2
$SG71332 DB	'MIN', 00H
$SG71333 DB	'NMIN', 00H
	ORG $+3
$SG71336 DB	'MAX', 00H
$SG71337 DB	'NMAX', 00H
	ORG $+3
$SG71340 DB	'_EVA_VAR_EXPR', 00H
	ORG $+2
$SG71342 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG71344 DB	'_EVA_EXPRVAL', 00H
	ORG $+3
$SG71347 DB	'_EVA_VAR_EXPRVAL', 00H
	ORG $+3
$SG71349 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG71352 DB	'_EVA_SRC_FILTER', 00H
$SG71355 DB	'_EVA_SRC_FILTER', 00H
$SG71357 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG71361 DB	'_EVA_VAR_LISTOBJ', 00H
	ORG $+3
$SG71363 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG71365 DB	'_EVA_LIST_TABLE', 00H
$SG71369 DB	'_EVA_VAR_LIST_TABLE', 00H
$SG71371 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG71377 DB	'D:\Travail\ABI\EVA\V4.0\CGI\Brunix-2016\qry_build.c', 00H
$SG71378 DB	'qry_eval_sqlexpr_var', 00H
	ORG $+3
$SG71380 DB	'1', 00H
	ORG $+2
$SG71382 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG71385 DB	'D:\Travail\ABI\EVA\V4.0\CGI\Brunix-2016\qry_build.c', 00H
$SG71386 DB	'qry_eval_sqlexpr_var', 00H
	ORG $+3
$SG71389 DB	'_EVA_VALUEID', 00H
	ORG $+3
$SG71394 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG71400 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG71405 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG71410 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG71419 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG71422 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG71427 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG71432 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG71433 DB	'D:\Travail\ABI\EVA\V4.0\CGI\Brunix-2016\qry_build.c', 00H
$SG71434 DB	'qry_eval_sqlexpr_var', 00H
	ORG $+3
$SG71436 DB	'D:\Travail\ABI\EVA\V4.0\CGI\Brunix-2016\qry_build.c', 00H
$SG71437 DB	'qry_eval_sqlexpr_var', 00H
_DATA	ENDS
_TEXT	SEGMENT
_cntxt$ = 8
_sqlexpr$ = 12
_expr$ = 16
_vardata$ = 20
_srctbl$ = 24
_sql$ = -24
_varname$ = -64
_varform$ = -104
_varserv$ = -44
_listobj$ = -20
_srcval$ = -124
_varval$ = -144
_data$ = -84
_next$ = -148
_fieldbeg$71083 = -152
_fieldend$71084 = -156
_srctblobj$71089 = -288
_id$71090 = -296
_objsym$71091 = -292
_beg$71093 = -160
__tmp$71183 = -328
__tmp$71193 = -360
_end$71279 = -368
_line$71280 = -364
_src$71281 = -372
_i$71285 = -376
_typ$71311 = -384
_ctrl$71313 = -392
_varsvalues$71315 = -388
_val$71316 = -380
_fmt$71326 = -396
_fn$71328 = -400
_i$71366 = -404
__c$71406 = -408
_id$71413 = -412
_qry_eval_sqlexpr_var PROC NEAR

; 549  : ){

	push	ebp
	mov	ebp, esp
	sub	esp, 484				; 000001e4H
	push	edi

; 550  : 	DynBuffer *sql = NULL;

	mov	DWORD PTR _sql$[ebp], 0

; 551  : 	DynTable varname = {0};

	mov	DWORD PTR _varname$[ebp], 0
	xor	eax, eax
	mov	DWORD PTR _varname$[ebp+4], eax
	mov	DWORD PTR _varname$[ebp+8], eax
	mov	DWORD PTR _varname$[ebp+12], eax
	mov	DWORD PTR _varname$[ebp+16], eax

; 552  : 	DynTable varform = {0};

	mov	DWORD PTR _varform$[ebp], 0
	xor	ecx, ecx
	mov	DWORD PTR _varform$[ebp+4], ecx
	mov	DWORD PTR _varform$[ebp+8], ecx
	mov	DWORD PTR _varform$[ebp+12], ecx
	mov	DWORD PTR _varform$[ebp+16], ecx

; 553  : 	DynTable varserv = {0};

	mov	DWORD PTR _varserv$[ebp], 0
	xor	edx, edx
	mov	DWORD PTR _varserv$[ebp+4], edx
	mov	DWORD PTR _varserv$[ebp+8], edx
	mov	DWORD PTR _varserv$[ebp+12], edx
	mov	DWORD PTR _varserv$[ebp+16], edx

; 554  : 	DynTable listobj = {0};

	mov	DWORD PTR _listobj$[ebp], 0
	xor	eax, eax
	mov	DWORD PTR _listobj$[ebp+4], eax
	mov	DWORD PTR _listobj$[ebp+8], eax
	mov	DWORD PTR _listobj$[ebp+12], eax
	mov	DWORD PTR _listobj$[ebp+16], eax

; 555  : 	DynTable srcval = {0};

	mov	DWORD PTR _srcval$[ebp], 0
	xor	ecx, ecx
	mov	DWORD PTR _srcval$[ebp+4], ecx
	mov	DWORD PTR _srcval$[ebp+8], ecx
	mov	DWORD PTR _srcval$[ebp+12], ecx
	mov	DWORD PTR _srcval$[ebp+16], ecx

; 556  : 	DynTable varval = {0};

	mov	DWORD PTR _varval$[ebp], 0
	xor	edx, edx
	mov	DWORD PTR _varval$[ebp+4], edx
	mov	DWORD PTR _varval$[ebp+8], edx
	mov	DWORD PTR _varval$[ebp+12], edx
	mov	DWORD PTR _varval$[ebp+16], edx

; 557  : 	DynTable data = {0};

	mov	DWORD PTR _data$[ebp], 0
	xor	eax, eax
	mov	DWORD PTR _data$[ebp+4], eax
	mov	DWORD PTR _data$[ebp+8], eax
	mov	DWORD PTR _data$[ebp+12], eax
	mov	DWORD PTR _data$[ebp+16], eax

; 558  : 	char *next;
; 559  : 
; 560  : 	/* Read variables names for filter, form & server */
; 561  : 	if(!expr || !*expr) RETURN_OK;

	cmp	DWORD PTR _expr$[ebp], 0
	je	SHORT $L71058
	mov	ecx, DWORD PTR _expr$[ebp]
	movsx	edx, BYTE PTR [ecx]
	test	edx, edx
	jne	SHORT $L71057
$L71058:
	jmp	$eva_noerr$71059
$L71057:

; 562  : 	DYNTAB_FIELD_TAB(&varname, vardata, VAR_NAME);

	lea	eax, DWORD PTR _varname$[ebp]
	push	eax
	call	_dyntab_free
	add	esp, 4
	push	0
	push	-1
	push	OFFSET FLAT:$SG71063
	mov	ecx, DWORD PTR _vardata$[ebp]
	push	ecx
	push	0
	lea	edx, DWORD PTR _varname$[ebp]
	push	edx
	call	_dyntab_filter_field
	add	esp, 24					; 00000018H
	test	eax, eax
	jne	SHORT $L71062
	lea	eax, DWORD PTR _varname$[ebp]
	push	eax
	call	_dyntab_order_lines
	add	esp, 4
	test	eax, eax
	je	SHORT $L71061
$L71062:
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29872], OFFSET FLAT:$SG71065
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 562		; 00000232H
	jmp	$eva_err$71066
$L71061:

; 563  : 	if(cntxt->form && cntxt->form->ctrl)

	mov	eax, DWORD PTR _cntxt$[ebp]
	cmp	DWORD PTR [eax+80], 0
	je	SHORT $L71069
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	edx, DWORD PTR [ecx+80]
	cmp	DWORD PTR [edx], 0
	je	SHORT $L71069

; 564  : 		DYNTAB_FIELD_TAB(&varform, &cntxt->form->ctrl->attr, VAR_NAME);

	lea	eax, DWORD PTR _varform$[ebp]
	push	eax
	call	_dyntab_free
	add	esp, 4
	push	0
	push	-1
	push	OFFSET FLAT:$SG71071
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	edx, DWORD PTR [ecx+80]
	mov	eax, DWORD PTR [edx]
	add	eax, 44					; 0000002cH
	push	eax
	push	0
	lea	ecx, DWORD PTR _varform$[ebp]
	push	ecx
	call	_dyntab_filter_field
	add	esp, 24					; 00000018H
	test	eax, eax
	jne	SHORT $L71070
	lea	edx, DWORD PTR _varform$[ebp]
	push	edx
	call	_dyntab_order_lines
	add	esp, 4
	test	eax, eax
	je	SHORT $L71069
$L71070:
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29872], OFFSET FLAT:$SG71073
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 564		; 00000234H
	jmp	$eva_err$71066
$L71069:

; 565  : 	DYNTAB_FIELD_TAB(&varserv, &cntxt->cnf_data, VAR_NAME);

	lea	edx, DWORD PTR _varserv$[ebp]
	push	edx
	call	_dyntab_free
	add	esp, 4
	push	0
	push	-1
	push	OFFSET FLAT:$SG71077
	mov	eax, DWORD PTR _cntxt$[ebp]
	add	eax, 29360				; 000072b0H
	push	eax
	push	0
	lea	ecx, DWORD PTR _varserv$[ebp]
	push	ecx
	call	_dyntab_filter_field
	add	esp, 24					; 00000018H
	test	eax, eax
	jne	SHORT $L71076
	lea	edx, DWORD PTR _varserv$[ebp]
	push	edx
	call	_dyntab_order_lines
	add	esp, 4
	test	eax, eax
	je	SHORT $L71075
$L71076:
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29872], OFFSET FLAT:$SG71079
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 565		; 00000235H
	jmp	$eva_err$71066
$L71075:

; 566  : 
; 567  : 	/* Evaluate variable expressions in brackets */
; 568  : 	FOR_EACH_BRACKET

	mov	edx, DWORD PTR _expr$[ebp]
	mov	DWORD PTR _next$[ebp], edx
$L71081:
	mov	eax, DWORD PTR _next$[ebp]
	movsx	ecx, BYTE PTR [eax]
	test	ecx, ecx
	je	$L71082
	push	91					; 0000005bH
	mov	edx, DWORD PTR _next$[ebp]
	push	edx
	call	_strchr
	add	esp, 8
	mov	DWORD PTR _fieldbeg$71083[ebp], eax
	cmp	DWORD PTR _fieldbeg$71083[ebp], 0
	je	SHORT $L74360
	push	93					; 0000005dH
	mov	eax, DWORD PTR _fieldbeg$71083[ebp]
	push	eax
	call	_strchr
	add	esp, 8
	mov	DWORD PTR -416+[ebp], eax
	jmp	SHORT $L74361
$L74360:
	mov	DWORD PTR -416+[ebp], 0
$L74361:
	mov	ecx, DWORD PTR -416+[ebp]
	mov	DWORD PTR _fieldend$71084[ebp], ecx
	cmp	DWORD PTR _fieldbeg$71083[ebp], 0
	je	SHORT $L71087
	cmp	DWORD PTR _fieldend$71084[ebp], 0
	jne	SHORT $L71086
$L71087:
	jmp	$L71082
$L71086:

; 570  : 		/* If brackets hold a a specific object symbol [#NAME.FIELD] */
; 571  : 		if(fieldbeg[1] == '#')

	mov	edx, DWORD PTR _fieldbeg$71083[ebp]
	movsx	eax, BYTE PTR [edx+1]
	cmp	eax, 35					; 00000023H
	jne	$L71088

; 573  : 			/* Parse symbol name */
; 574  : 			char srctblobj[128] = {0};

	mov	BYTE PTR _srctblobj$71089[ebp], 0
	mov	ecx, 31					; 0000001fH
	xor	eax, eax
	lea	edi, DWORD PTR _srctblobj$71089[ebp+1]
	rep stosd
	stosw
	stosb

; 575  : 			unsigned long id = 0;

	mov	DWORD PTR _id$71090[ebp], 0

; 576  : 			char *objsym = NULL;

	mov	DWORD PTR _objsym$71091[ebp], 0

; 577  : 			char *beg = fieldbeg + 2;

	mov	ecx, DWORD PTR _fieldbeg$71083[ebp]
	add	ecx, 2
	mov	DWORD PTR _beg$71093[ebp], ecx

; 578  : #define PARSE_SYM_OBJ(sym, obj) if(!strncmp(sym, beg, sizeof(sym) - 1)) { objsym = sym; beg += sizeof(sym) - 1; id = obj; if(*beg == '.') beg++; }
; 579  : #define PARSE_SYM_VAL(sym, v) if(!strncmp(sym, beg, sizeof(sym) - 1)) { objsym = ""; dyntab_free(&data); DYNTAB_ADD(&data, 0, 0, v, 0, NO_CONV); }
; 580  : #define PARSE_SYM_RAW(sym, v) if(!strncmp(sym, beg, sizeof(sym) - 1)) { objsym = "."; dyntab_free(&data); DYNTAB_ADD(&data, 0, 0, v, 0, NO_CONV); }
; 581  : #define PARSE_SYM_INT(sym, v) if(!strncmp(sym, beg, sizeof(sym) - 1)) { objsym = "."; dyntab_free(&data); DYNTAB_ADD_INT(&data, 0, 0, v); }
; 582  : 			PARSE_SYM_OBJ("CUROBJ", DYNTAB_TOUL(&cntxt->form->id_obj)) else

	push	6
	mov	edx, DWORD PTR _beg$71093[ebp]
	push	edx
	push	OFFSET FLAT:$SG71099
	call	_strncmp
	add	esp, 12					; 0000000cH
	test	eax, eax
	jne	SHORT $L71098
	mov	DWORD PTR _objsym$71091[ebp], OFFSET FLAT:$SG71100
	mov	eax, DWORD PTR _beg$71093[ebp]
	add	eax, 6
	mov	DWORD PTR _beg$71093[ebp], eax
	push	10					; 0000000aH
	push	0
	push	0
	push	0
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	edx, DWORD PTR [ecx+80]
	add	edx, 32					; 00000020H
	push	edx
	call	_dyntab_val
	add	esp, 12					; 0000000cH
	push	eax
	call	_strtoul
	add	esp, 12					; 0000000cH
	mov	DWORD PTR _id$71090[ebp], eax
	mov	eax, DWORD PTR _beg$71093[ebp]
	movsx	ecx, BYTE PTR [eax]
	cmp	ecx, 46					; 0000002eH
	jne	SHORT $L71102
	mov	edx, DWORD PTR _beg$71093[ebp]
	add	edx, 1
	mov	DWORD PTR _beg$71093[ebp], edx
$L71102:
	jmp	SHORT $L71108
$L71098:

; 583  : 			PARSE_SYM_OBJ("CURFORM", DYNTAB_TOUL(&cntxt->form->id_form))

	push	7
	mov	eax, DWORD PTR _beg$71093[ebp]
	push	eax
	push	OFFSET FLAT:$SG71105
	call	_strncmp
	add	esp, 12					; 0000000cH
	test	eax, eax
	jne	SHORT $L71108
	mov	DWORD PTR _objsym$71091[ebp], OFFSET FLAT:$SG71106
	mov	ecx, DWORD PTR _beg$71093[ebp]
	add	ecx, 7
	mov	DWORD PTR _beg$71093[ebp], ecx
	push	10					; 0000000aH
	push	0
	push	0
	push	0
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	eax, DWORD PTR [edx+80]
	add	eax, 12					; 0000000cH
	push	eax
	call	_dyntab_val
	add	esp, 12					; 0000000cH
	push	eax
	call	_strtoul
	add	esp, 12					; 0000000cH
	mov	DWORD PTR _id$71090[ebp], eax
	mov	ecx, DWORD PTR _beg$71093[ebp]
	movsx	edx, BYTE PTR [ecx]
	cmp	edx, 46					; 0000002eH
	jne	SHORT $L71108
	mov	eax, DWORD PTR _beg$71093[ebp]
	add	eax, 1
	mov	DWORD PTR _beg$71093[ebp], eax
$L71108:

; 584  : 			PARSE_SYM_OBJ("CURCTL", DYNTAB_TOUL(&cntxt->form->ctrl[cntxt->form->i_ctrl].id))

	push	6
	mov	ecx, DWORD PTR _beg$71093[ebp]
	push	ecx
	push	OFFSET FLAT:$SG71110
	call	_strncmp
	add	esp, 12					; 0000000cH
	test	eax, eax
	jne	SHORT $L71113
	mov	DWORD PTR _objsym$71091[ebp], OFFSET FLAT:$SG71111
	mov	edx, DWORD PTR _beg$71093[ebp]
	add	edx, 6
	mov	DWORD PTR _beg$71093[ebp], edx
	push	10					; 0000000aH
	push	0
	push	0
	push	0
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	ecx, DWORD PTR [eax+80]
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	eax, DWORD PTR [edx+80]
	mov	edx, DWORD PTR [eax+8]
	imul	edx, 480				; 000001e0H
	mov	eax, DWORD PTR [ecx]
	add	eax, edx
	push	eax
	call	_dyntab_val
	add	esp, 12					; 0000000cH
	push	eax
	call	_strtoul
	add	esp, 12					; 0000000cH
	mov	DWORD PTR _id$71090[ebp], eax
	mov	ecx, DWORD PTR _beg$71093[ebp]
	movsx	edx, BYTE PTR [ecx]
	cmp	edx, 46					; 0000002eH
	jne	SHORT $L71113
	mov	eax, DWORD PTR _beg$71093[ebp]
	add	eax, 1
	mov	DWORD PTR _beg$71093[ebp], eax
$L71113:

; 585  : 			PARSE_SYM_OBJ("MAINFORM", DYNTAB_TOUL(&cntxt->id_form))

	push	8
	mov	ecx, DWORD PTR _beg$71093[ebp]
	push	ecx
	push	OFFSET FLAT:$SG71115
	call	_strncmp
	add	esp, 12					; 0000000cH
	test	eax, eax
	jne	SHORT $L71118
	mov	DWORD PTR _objsym$71091[ebp], OFFSET FLAT:$SG71116
	mov	edx, DWORD PTR _beg$71093[ebp]
	add	edx, 8
	mov	DWORD PTR _beg$71093[ebp], edx
	push	10					; 0000000aH
	push	0
	push	0
	push	0
	mov	eax, DWORD PTR _cntxt$[ebp]
	push	eax
	call	_dyntab_val
	add	esp, 12					; 0000000cH
	push	eax
	call	_strtoul
	add	esp, 12					; 0000000cH
	mov	DWORD PTR _id$71090[ebp], eax
	mov	ecx, DWORD PTR _beg$71093[ebp]
	movsx	edx, BYTE PTR [ecx]
	cmp	edx, 46					; 0000002eH
	jne	SHORT $L71118
	mov	eax, DWORD PTR _beg$71093[ebp]
	add	eax, 1
	mov	DWORD PTR _beg$71093[ebp], eax
$L71118:

; 586  : 			PARSE_SYM_OBJ("MAINOBJ", DYNTAB_TOUL(&cntxt->id_obj))

	push	7
	mov	ecx, DWORD PTR _beg$71093[ebp]
	push	ecx
	push	OFFSET FLAT:$SG71120
	call	_strncmp
	add	esp, 12					; 0000000cH
	test	eax, eax
	jne	SHORT $L71123
	mov	DWORD PTR _objsym$71091[ebp], OFFSET FLAT:$SG71121
	mov	edx, DWORD PTR _beg$71093[ebp]
	add	edx, 7
	mov	DWORD PTR _beg$71093[ebp], edx
	push	10					; 0000000aH
	push	0
	push	0
	push	0
	mov	eax, DWORD PTR _cntxt$[ebp]
	add	eax, 20					; 00000014H
	push	eax
	call	_dyntab_val
	add	esp, 12					; 0000000cH
	push	eax
	call	_strtoul
	add	esp, 12					; 0000000cH
	mov	DWORD PTR _id$71090[ebp], eax
	mov	ecx, DWORD PTR _beg$71093[ebp]
	movsx	edx, BYTE PTR [ecx]
	cmp	edx, 46					; 0000002eH
	jne	SHORT $L71123
	mov	eax, DWORD PTR _beg$71093[ebp]
	add	eax, 1
	mov	DWORD PTR _beg$71093[ebp], eax
$L71123:

; 587  : 			PARSE_SYM_OBJ("USER", DYNTAB_TOUL(&cntxt->id_user)) else

	push	4
	mov	ecx, DWORD PTR _beg$71093[ebp]
	push	ecx
	push	OFFSET FLAT:$SG71125
	call	_strncmp
	add	esp, 12					; 0000000cH
	test	eax, eax
	jne	SHORT $L71124
	mov	DWORD PTR _objsym$71091[ebp], OFFSET FLAT:$SG71126
	mov	edx, DWORD PTR _beg$71093[ebp]
	add	edx, 4
	mov	DWORD PTR _beg$71093[ebp], edx
	push	10					; 0000000aH
	push	0
	push	0
	push	0
	mov	eax, DWORD PTR _cntxt$[ebp]
	add	eax, 29408				; 000072e0H
	push	eax
	call	_dyntab_val
	add	esp, 12					; 0000000cH
	push	eax
	call	_strtoul
	add	esp, 12					; 0000000cH
	mov	DWORD PTR _id$71090[ebp], eax
	mov	ecx, DWORD PTR _beg$71093[ebp]
	movsx	edx, BYTE PTR [ecx]
	cmp	edx, 46					; 0000002eH
	jne	SHORT $L71128
	mov	eax, DWORD PTR _beg$71093[ebp]
	add	eax, 1
	mov	DWORD PTR _beg$71093[ebp], eax
$L71128:
	jmp	$L71214
$L71124:

; 588  : 			PARSE_SYM_OBJ("SESSION", DYNTAB_TOUL(&cntxt->session)) else

	push	7
	mov	ecx, DWORD PTR _beg$71093[ebp]
	push	ecx
	push	OFFSET FLAT:$SG71131
	call	_strncmp
	add	esp, 12					; 0000000cH
	test	eax, eax
	jne	SHORT $L71130
	mov	DWORD PTR _objsym$71091[ebp], OFFSET FLAT:$SG71132
	mov	edx, DWORD PTR _beg$71093[ebp]
	add	edx, 7
	mov	DWORD PTR _beg$71093[ebp], edx
	push	10					; 0000000aH
	push	0
	push	0
	push	0
	mov	eax, DWORD PTR _cntxt$[ebp]
	add	eax, 29300				; 00007274H
	push	eax
	call	_dyntab_val
	add	esp, 12					; 0000000cH
	push	eax
	call	_strtoul
	add	esp, 12					; 0000000cH
	mov	DWORD PTR _id$71090[ebp], eax
	mov	ecx, DWORD PTR _beg$71093[ebp]
	movsx	edx, BYTE PTR [ecx]
	cmp	edx, 46					; 0000002eH
	jne	SHORT $L71134
	mov	eax, DWORD PTR _beg$71093[ebp]
	add	eax, 1
	mov	DWORD PTR _beg$71093[ebp], eax
$L71134:
	jmp	$L71214
$L71130:

; 589  : 			PARSE_SYM_OBJ("SELTAB", (cntxt->form && cntxt->form->seltab) ? DYNTAB_TOUL(&cntxt->form->ctrl[cntxt->form->seltab].id) : 0) else

	push	6
	mov	ecx, DWORD PTR _beg$71093[ebp]
	push	ecx
	push	OFFSET FLAT:$SG71137
	call	_strncmp
	add	esp, 12					; 0000000cH
	test	eax, eax
	jne	$L71136
	mov	DWORD PTR _objsym$71091[ebp], OFFSET FLAT:$SG71138
	mov	edx, DWORD PTR _beg$71093[ebp]
	add	edx, 6
	mov	DWORD PTR _beg$71093[ebp], edx
	mov	eax, DWORD PTR _cntxt$[ebp]
	cmp	DWORD PTR [eax+80], 0
	je	SHORT $L74362
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	edx, DWORD PTR [ecx+80]
	cmp	DWORD PTR [edx+116], 0
	je	SHORT $L74362
	push	10					; 0000000aH
	push	0
	push	0
	push	0
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	ecx, DWORD PTR [eax+80]
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	eax, DWORD PTR [edx+80]
	mov	edx, DWORD PTR [eax+116]
	imul	edx, 480				; 000001e0H
	mov	eax, DWORD PTR [ecx]
	add	eax, edx
	push	eax
	call	_dyntab_val
	add	esp, 12					; 0000000cH
	push	eax
	call	_strtoul
	add	esp, 12					; 0000000cH
	mov	DWORD PTR -420+[ebp], eax
	jmp	SHORT $L74363
$L74362:
	mov	DWORD PTR -420+[ebp], 0
$L74363:
	mov	ecx, DWORD PTR -420+[ebp]
	mov	DWORD PTR _id$71090[ebp], ecx
	mov	edx, DWORD PTR _beg$71093[ebp]
	movsx	eax, BYTE PTR [edx]
	cmp	eax, 46					; 0000002eH
	jne	SHORT $L71140
	mov	ecx, DWORD PTR _beg$71093[ebp]
	add	ecx, 1
	mov	DWORD PTR _beg$71093[ebp], ecx
$L71140:
	jmp	$L71214
$L71136:

; 590  : 			PARSE_SYM_VAL("TIME", cntxt->timestamp) else

	push	4
	mov	edx, DWORD PTR _beg$71093[ebp]
	push	edx
	push	OFFSET FLAT:$SG71143
	call	_strncmp
	add	esp, 12					; 0000000cH
	test	eax, eax
	jne	SHORT $L71142
	mov	DWORD PTR _objsym$71091[ebp], OFFSET FLAT:$SG71144
	lea	eax, DWORD PTR _data$[ebp]
	push	eax
	call	_dyntab_free
	add	esp, 4
	push	0
	push	0
	push	0
	mov	ecx, DWORD PTR _cntxt$[ebp]
	add	ecx, 29704				; 00007408H
	push	ecx
	push	0
	push	0
	lea	edx, DWORD PTR _data$[ebp]
	push	edx
	call	_dyntab_add
	add	esp, 28					; 0000001cH
	test	eax, eax
	je	SHORT $L71146
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29872], OFFSET FLAT:$SG71148
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 590		; 0000024eH
	jmp	$eva_err$71066
$L71146:
	jmp	$L71214
$L71142:

; 591  : 			PARSE_SYM_OBJ("SRVCNF", DYNTAB_TOUL(&cntxt->id_cnf)) else

	push	6
	mov	edx, DWORD PTR _beg$71093[ebp]
	push	edx
	push	OFFSET FLAT:$SG71151
	call	_strncmp
	add	esp, 12					; 0000000cH
	test	eax, eax
	jne	SHORT $L71150
	mov	DWORD PTR _objsym$71091[ebp], OFFSET FLAT:$SG71152
	mov	eax, DWORD PTR _beg$71093[ebp]
	add	eax, 6
	mov	DWORD PTR _beg$71093[ebp], eax
	push	10					; 0000000aH
	push	0
	push	0
	push	0
	mov	ecx, DWORD PTR _cntxt$[ebp]
	add	ecx, 29340				; 0000729cH
	push	ecx
	call	_dyntab_val
	add	esp, 12					; 0000000cH
	push	eax
	call	_strtoul
	add	esp, 12					; 0000000cH
	mov	DWORD PTR _id$71090[ebp], eax
	mov	edx, DWORD PTR _beg$71093[ebp]
	movsx	eax, BYTE PTR [edx]
	cmp	eax, 46					; 0000002eH
	jne	SHORT $L71154
	mov	ecx, DWORD PTR _beg$71093[ebp]
	add	ecx, 1
	mov	DWORD PTR _beg$71093[ebp], ecx
$L71154:
	jmp	$L71214
$L71150:

; 592  : 			PARSE_SYM_VAL("SRVNAME", cntxt->dbname) else

	push	7
	mov	edx, DWORD PTR _beg$71093[ebp]
	push	edx
	push	OFFSET FLAT:$SG71157
	call	_strncmp
	add	esp, 12					; 0000000cH
	test	eax, eax
	jne	SHORT $L71156
	mov	DWORD PTR _objsym$71091[ebp], OFFSET FLAT:$SG71158
	lea	eax, DWORD PTR _data$[ebp]
	push	eax
	call	_dyntab_free
	add	esp, 4
	push	0
	push	0
	push	0
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	edx, DWORD PTR [ecx+29804]
	push	edx
	push	0
	push	0
	lea	eax, DWORD PTR _data$[ebp]
	push	eax
	call	_dyntab_add
	add	esp, 28					; 0000001cH
	test	eax, eax
	je	SHORT $L71160
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29872], OFFSET FLAT:$SG71162
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 592		; 00000250H
	jmp	$eva_err$71066
$L71160:
	jmp	$L71214
$L71156:

; 593  : 			PARSE_SYM_VAL("SRVADR", cntxt->srvname) else

	push	6
	mov	eax, DWORD PTR _beg$71093[ebp]
	push	eax
	push	OFFSET FLAT:$SG71165
	call	_strncmp
	add	esp, 12					; 0000000cH
	test	eax, eax
	jne	SHORT $L71164
	mov	DWORD PTR _objsym$71091[ebp], OFFSET FLAT:$SG71166
	lea	ecx, DWORD PTR _data$[ebp]
	push	ecx
	call	_dyntab_free
	add	esp, 4
	push	0
	push	0
	push	0
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	eax, DWORD PTR [edx+29744]
	push	eax
	push	0
	push	0
	lea	ecx, DWORD PTR _data$[ebp]
	push	ecx
	call	_dyntab_add
	add	esp, 28					; 0000001cH
	test	eax, eax
	je	SHORT $L71168
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29872], OFFSET FLAT:$SG71170
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 593		; 00000251H
	jmp	$eva_err$71066
$L71168:
	jmp	$L71214
$L71164:

; 594  : 			PARSE_SYM_VAL("QRYSTR", cntxt->qrystr) else

	push	6
	mov	ecx, DWORD PTR _beg$71093[ebp]
	push	ecx
	push	OFFSET FLAT:$SG71173
	call	_strncmp
	add	esp, 12					; 0000000cH
	test	eax, eax
	jne	SHORT $L71172
	mov	DWORD PTR _objsym$71091[ebp], OFFSET FLAT:$SG71174
	lea	edx, DWORD PTR _data$[ebp]
	push	edx
	call	_dyntab_free
	add	esp, 4
	push	0
	push	0
	push	0
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	ecx, DWORD PTR [eax+29736]
	push	ecx
	push	0
	push	0
	lea	edx, DWORD PTR _data$[ebp]
	push	edx
	call	_dyntab_add
	add	esp, 28					; 0000001cH
	test	eax, eax
	je	SHORT $L71176
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29872], OFFSET FLAT:$SG71178
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 594		; 00000252H
	jmp	$eva_err$71066
$L71176:
	jmp	$L71214
$L71172:

; 595  : 			PARSE_SYM_INT("NUM", cntxt->form ? cntxt->form->Num : 0) else

	push	3
	mov	edx, DWORD PTR _beg$71093[ebp]
	push	edx
	push	OFFSET FLAT:$SG71181
	call	_strncmp
	add	esp, 12					; 0000000cH
	test	eax, eax
	jne	$L71180
	mov	DWORD PTR _objsym$71091[ebp], OFFSET FLAT:$SG71182
	lea	eax, DWORD PTR _data$[ebp]
	push	eax
	call	_dyntab_free
	add	esp, 4
	mov	BYTE PTR __tmp$71183[ebp], 0
	mov	ecx, 7
	xor	eax, eax
	lea	edi, DWORD PTR __tmp$71183[ebp+1]
	rep stosd
	stosw
	stosb
	mov	ecx, DWORD PTR _cntxt$[ebp]
	cmp	DWORD PTR [ecx+80], 0
	je	SHORT $L74364
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	eax, DWORD PTR [edx+80]
	mov	ecx, DWORD PTR [eax+236]
	mov	DWORD PTR -424+[ebp], ecx
	jmp	SHORT $L74365
$L74364:
	mov	DWORD PTR -424+[ebp], 0
$L74365:
	mov	edx, DWORD PTR -424+[ebp]
	push	edx
	push	OFFSET FLAT:$SG71184
	lea	eax, DWORD PTR __tmp$71183[ebp]
	push	eax
	call	_sprintf
	add	esp, 12					; 0000000cH
	push	0
	push	0
	push	0
	lea	ecx, DWORD PTR __tmp$71183[ebp]
	push	ecx
	push	0
	push	0
	lea	edx, DWORD PTR _data$[ebp]
	push	edx
	call	_dyntab_add
	add	esp, 28					; 0000001cH
	test	eax, eax
	je	SHORT $L71186
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29872], OFFSET FLAT:$SG71188
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 595		; 00000253H
	jmp	$eva_err$71066
$L71186:
	jmp	$L71214
$L71180:

; 596  : 			PARSE_SYM_INT("LINE", cntxt->form ? cntxt->form->Line : 0) else

	push	4
	mov	edx, DWORD PTR _beg$71093[ebp]
	push	edx
	push	OFFSET FLAT:$SG71191
	call	_strncmp
	add	esp, 12					; 0000000cH
	test	eax, eax
	jne	$L71190
	mov	DWORD PTR _objsym$71091[ebp], OFFSET FLAT:$SG71192
	lea	eax, DWORD PTR _data$[ebp]
	push	eax
	call	_dyntab_free
	add	esp, 4
	mov	BYTE PTR __tmp$71193[ebp], 0
	mov	ecx, 7
	xor	eax, eax
	lea	edi, DWORD PTR __tmp$71193[ebp+1]
	rep stosd
	stosw
	stosb
	mov	ecx, DWORD PTR _cntxt$[ebp]
	cmp	DWORD PTR [ecx+80], 0
	je	SHORT $L74366
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	eax, DWORD PTR [edx+80]
	mov	ecx, DWORD PTR [eax+240]
	mov	DWORD PTR -428+[ebp], ecx
	jmp	SHORT $L74367
$L74366:
	mov	DWORD PTR -428+[ebp], 0
$L74367:
	mov	edx, DWORD PTR -428+[ebp]
	push	edx
	push	OFFSET FLAT:$SG71194
	lea	eax, DWORD PTR __tmp$71193[ebp]
	push	eax
	call	_sprintf
	add	esp, 12					; 0000000cH
	push	0
	push	0
	push	0
	lea	ecx, DWORD PTR __tmp$71193[ebp]
	push	ecx
	push	0
	push	0
	lea	edx, DWORD PTR _data$[ebp]
	push	edx
	call	_dyntab_add
	add	esp, 28					; 0000001cH
	test	eax, eax
	je	SHORT $L71196
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29872], OFFSET FLAT:$SG71198
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 596		; 00000254H
	jmp	$eva_err$71066
$L71196:
	jmp	$L71214
$L71190:

; 597  : 			PARSE_SYM_RAW("SRCTBL", srctbl ? *srctbl ? srctbl : "V0" : "NULL") else

	push	6
	mov	edx, DWORD PTR _beg$71093[ebp]
	push	edx
	push	OFFSET FLAT:$SG71201
	call	_strncmp
	add	esp, 12					; 0000000cH
	test	eax, eax
	jne	$L71200
	mov	DWORD PTR _objsym$71091[ebp], OFFSET FLAT:$SG71202
	lea	eax, DWORD PTR _data$[ebp]
	push	eax
	call	_dyntab_free
	add	esp, 4
	cmp	DWORD PTR _srctbl$[ebp], 0
	je	SHORT $L74370
	mov	ecx, DWORD PTR _srctbl$[ebp]
	movsx	edx, BYTE PTR [ecx]
	test	edx, edx
	je	SHORT $L74368
	mov	eax, DWORD PTR _srctbl$[ebp]
	mov	DWORD PTR -432+[ebp], eax
	jmp	SHORT $L74369
$L74368:
	mov	DWORD PTR -432+[ebp], OFFSET FLAT:$SG71205
$L74369:
	mov	ecx, DWORD PTR -432+[ebp]
	mov	DWORD PTR -436+[ebp], ecx
	jmp	SHORT $L74371
$L74370:
	mov	DWORD PTR -436+[ebp], OFFSET FLAT:$SG71206
$L74371:
	push	0
	push	0
	push	0
	mov	edx, DWORD PTR -436+[ebp]
	push	edx
	push	0
	push	0
	lea	eax, DWORD PTR _data$[ebp]
	push	eax
	call	_dyntab_add
	add	esp, 28					; 0000001cH
	test	eax, eax
	je	SHORT $L71204
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29872], OFFSET FLAT:$SG71208
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 597		; 00000255H
	jmp	$eva_err$71066
$L71204:
	jmp	$L71214
$L71200:

; 598  : 			PARSE_SYM_RAW("SRCOBJ", (srctbl && snprintf(add_sz_str(srctblobj), "%s.IdObj", (srctbl && *srctbl) ? srctbl : "V0")) ? srctblobj : "IdObj")

	push	6
	mov	eax, DWORD PTR _beg$71093[ebp]
	push	eax
	push	OFFSET FLAT:$SG71211
	call	_strncmp
	add	esp, 12					; 0000000cH
	test	eax, eax
	jne	$L71214
	mov	DWORD PTR _objsym$71091[ebp], OFFSET FLAT:$SG71212
	lea	ecx, DWORD PTR _data$[ebp]
	push	ecx
	call	_dyntab_free
	add	esp, 4
	cmp	DWORD PTR _srctbl$[ebp], 0
	je	SHORT $L74374
	cmp	DWORD PTR _srctbl$[ebp], 0
	je	SHORT $L74372
	mov	edx, DWORD PTR _srctbl$[ebp]
	movsx	eax, BYTE PTR [edx]
	test	eax, eax
	je	SHORT $L74372
	mov	ecx, DWORD PTR _srctbl$[ebp]
	mov	DWORD PTR -440+[ebp], ecx
	jmp	SHORT $L74373
$L74372:
	mov	DWORD PTR -440+[ebp], OFFSET FLAT:$SG71215
$L74373:
	mov	edx, DWORD PTR -440+[ebp]
	push	edx
	push	OFFSET FLAT:$SG71216
	push	127					; 0000007fH
	lea	eax, DWORD PTR _srctblobj$71089[ebp]
	push	eax
	call	__snprintf
	add	esp, 16					; 00000010H
	test	eax, eax
	je	SHORT $L74374
	lea	ecx, DWORD PTR _srctblobj$71089[ebp]
	mov	DWORD PTR -444+[ebp], ecx
	jmp	SHORT $L74375
$L74374:
	mov	DWORD PTR -444+[ebp], OFFSET FLAT:$SG71217
$L74375:
	push	0
	push	0
	push	0
	mov	edx, DWORD PTR -444+[ebp]
	push	edx
	push	0
	push	0
	lea	eax, DWORD PTR _data$[ebp]
	push	eax
	call	_dyntab_add
	add	esp, 28					; 0000001cH
	test	eax, eax
	je	SHORT $L71214
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29872], OFFSET FLAT:$SG71219
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 598		; 00000256H
	jmp	$eva_err$71066
$L71214:

; 599  : 
; 600  : 			if(fieldbeg > next) DYNBUF_ADD(sqlexpr, next, fieldbeg - next, NO_CONV);

	mov	eax, DWORD PTR _fieldbeg$71083[ebp]
	cmp	eax, DWORD PTR _next$[ebp]
	jbe	SHORT $L71222
	push	0
	push	0
	mov	ecx, DWORD PTR _fieldbeg$71083[ebp]
	sub	ecx, DWORD PTR _next$[ebp]
	push	ecx
	mov	edx, DWORD PTR _next$[ebp]
	push	edx
	mov	eax, DWORD PTR _sqlexpr$[ebp]
	push	eax
	call	_dynbuf_add
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L71222
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29872], OFFSET FLAT:$SG71224
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 600		; 00000258H
	jmp	$eva_err$71066
$L71222:

; 601  : 			if(!objsym)

	cmp	DWORD PTR _objsym$71091[ebp], 0
	jne	$L71225

; 603  : 				/* Invalid symbol : warnig message */
; 604  : 				cntxt->err.text = "Invalid symbol";

	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29872], OFFSET FLAT:$SG71226

; 605  : 				DYNBUF_ADD3(&cntxt->err.detail, "Symbol : ", fieldbeg, fieldend - fieldbeg + 1, NO_CONV, "\nExpression :\n");

	push	14					; 0000000eH
	push	OFFSET FLAT:$SG71229
	push	0
	push	0
	mov	ecx, DWORD PTR _fieldend$71084[ebp]
	sub	ecx, DWORD PTR _fieldbeg$71083[ebp]
	add	ecx, 1
	push	ecx
	mov	edx, DWORD PTR _fieldbeg$71083[ebp]
	push	edx
	push	9
	push	OFFSET FLAT:$SG71230
	mov	eax, DWORD PTR _cntxt$[ebp]
	add	eax, 29876				; 000074b4H
	push	eax
	call	_dynbuf_add3
	add	esp, 36					; 00000024H
	test	eax, eax
	je	SHORT $L71228
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29872], OFFSET FLAT:$SG71232
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 605		; 0000025dH
	jmp	$eva_err$71066
$L71228:

; 606  : 				DYNBUF_ADD(&cntxt->err.detail, expr, 0, NO_CONV);

	push	0
	push	0
	push	0
	mov	eax, DWORD PTR _expr$[ebp]
	push	eax
	mov	ecx, DWORD PTR _cntxt$[ebp]
	add	ecx, 29876				; 000074b4H
	push	ecx
	call	_dynbuf_add
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L71234
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29872], OFFSET FLAT:$SG71236
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 606		; 0000025eH
	jmp	$eva_err$71066
$L71234:

; 607  : 				CLEAR_ERROR;

	push	607					; 0000025fH
	push	OFFSET FLAT:$SG71237
	push	OFFSET FLAT:$SG71238
	mov	ecx, DWORD PTR _cntxt$[ebp]
	push	ecx
	call	_err_clear
	add	esp, 16					; 00000010H

; 608  : 				DYNBUF_ADD_STR(sqlexpr, "''");

	push	0
	push	0
	push	2
	push	OFFSET FLAT:$SG71241
	mov	edx, DWORD PTR _sqlexpr$[ebp]
	push	edx
	call	_dynbuf_add
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L71240
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29872], OFFSET FLAT:$SG71243
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 608		; 00000260H
	jmp	$eva_err$71066
$L71240:

; 610  : 			else if(!*objsym)

	jmp	$L71276
$L71225:
	mov	edx, DWORD PTR _objsym$71091[ebp]
	movsx	eax, BYTE PTR [edx]
	test	eax, eax
	jne	SHORT $L71245

; 612  : 				/* String value symbol : output */
; 613  : 				DYNBUF_ADD3_CELL(sqlexpr, "'", &data, 0, 0, NO_CONV, "'");

	push	1
	push	OFFSET FLAT:$SG71248
	push	0
	push	0
	push	0
	push	0
	lea	ecx, DWORD PTR _data$[ebp]
	push	ecx
	call	_dyntab_sz
	add	esp, 12					; 0000000cH
	push	eax
	push	0
	push	0
	lea	edx, DWORD PTR _data$[ebp]
	push	edx
	call	_dyntab_val
	add	esp, 12					; 0000000cH
	push	eax
	push	1
	push	OFFSET FLAT:$SG71249
	mov	eax, DWORD PTR _sqlexpr$[ebp]
	push	eax
	call	_dynbuf_add3
	add	esp, 36					; 00000024H
	test	eax, eax
	je	SHORT $L71247
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29872], OFFSET FLAT:$SG71251
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 613		; 00000265H
	jmp	$eva_err$71066
$L71247:

; 615  : 			else if(*objsym == '.')

	jmp	$L71276
$L71245:
	mov	eax, DWORD PTR _objsym$71091[ebp]
	movsx	ecx, BYTE PTR [eax]
	cmp	ecx, 46					; 0000002eH
	jne	SHORT $L71253

; 617  : 				/* Raw value symbol : output */
; 618  : 				DYNBUF_ADD_CELL(sqlexpr, &data, 0, 0, NO_CONV);

	push	0
	push	0
	push	0
	push	0
	lea	edx, DWORD PTR _data$[ebp]
	push	edx
	call	_dyntab_sz
	add	esp, 12					; 0000000cH
	push	eax
	push	0
	push	0
	lea	eax, DWORD PTR _data$[ebp]
	push	eax
	call	_dyntab_val
	add	esp, 12					; 0000000cH
	push	eax
	mov	ecx, DWORD PTR _sqlexpr$[ebp]
	push	ecx
	call	_dynbuf_add
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L71255
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29872], OFFSET FLAT:$SG71257
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 618		; 0000026aH
	jmp	$eva_err$71066
$L71255:

; 620  : 			else if(beg < fieldend && form_eval_fieldexpr(cntxt, &data,

	jmp	$L71276
$L71253:

; 621  : 										!strcmp(objsym, "CUROBJ") ? DYNTAB_TOUL(&cntxt->form->id_form) : 0, id,
; 622  : 										beg, fieldend - beg, NULL, 0))

	mov	ecx, DWORD PTR _beg$71093[ebp]
	cmp	ecx, DWORD PTR _fieldend$71084[ebp]
	jae	$L71261
	push	OFFSET FLAT:$SG71262
	mov	edx, DWORD PTR _objsym$71091[ebp]
	push	edx
	call	_strcmp
	add	esp, 8
	test	eax, eax
	jne	SHORT $L74376
	push	10					; 0000000aH
	push	0
	push	0
	push	0
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	ecx, DWORD PTR [eax+80]
	add	ecx, 12					; 0000000cH
	push	ecx
	call	_dyntab_val
	add	esp, 12					; 0000000cH
	push	eax
	call	_strtoul
	add	esp, 12					; 0000000cH
	mov	DWORD PTR -448+[ebp], eax
	jmp	SHORT $L74377
$L74376:
	mov	DWORD PTR -448+[ebp], 0
$L74377:
	push	0
	push	0
	mov	edx, DWORD PTR _fieldend$71084[ebp]
	sub	edx, DWORD PTR _beg$71093[ebp]
	push	edx
	mov	eax, DWORD PTR _beg$71093[ebp]
	push	eax
	mov	ecx, DWORD PTR _id$71090[ebp]
	push	ecx
	mov	edx, DWORD PTR -448+[ebp]
	push	edx
	lea	eax, DWORD PTR _data$[ebp]
	push	eax
	mov	ecx, DWORD PTR _cntxt$[ebp]
	push	ecx
	call	_form_eval_fieldexpr
	add	esp, 32					; 00000020H
	test	eax, eax
	je	SHORT $L71261

; 624  : 				CLEAR_ERROR;

	push	624					; 00000270H
	push	OFFSET FLAT:$SG71263
	push	OFFSET FLAT:$SG71264
	mov	edx, DWORD PTR _cntxt$[ebp]
	push	edx
	call	_err_clear
	add	esp, 16					; 00000010H

; 625  : 				DYNBUF_ADD_STR(sqlexpr, "NULL");

	push	0
	push	0
	push	4
	push	OFFSET FLAT:$SG71267
	mov	eax, DWORD PTR _sqlexpr$[ebp]
	push	eax
	call	_dynbuf_add
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L71266
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29872], OFFSET FLAT:$SG71269
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 625		; 00000271H
	jmp	$eva_err$71066
$L71266:

; 627  : 			else

	jmp	SHORT $L71276
$L71261:

; 629  : 				/* Replace brackets with variable values in SQL expression */
; 630  : 				if(beg >= fieldend) DYNBUF_ADD_INT(sqlexpr, id)

	mov	eax, DWORD PTR _beg$71093[ebp]
	cmp	eax, DWORD PTR _fieldend$71084[ebp]
	jb	SHORT $L71271
	mov	ecx, DWORD PTR _id$71090[ebp]
	push	ecx
	mov	edx, DWORD PTR _sqlexpr$[ebp]
	push	edx
	call	_dynbuf_add_int
	add	esp, 8
	test	eax, eax
	je	SHORT $L71272
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29872], OFFSET FLAT:$SG71274
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 630		; 00000276H
	jmp	$eva_err$71066
$L71272:

; 631  : 				else if(qry_values_list(cntxt, &data, 5, sqlexpr)) STACK_ERROR;

	jmp	SHORT $L71276
$L71271:
	mov	edx, DWORD PTR _sqlexpr$[ebp]
	push	edx
	push	5
	lea	eax, DWORD PTR _data$[ebp]
	push	eax
	mov	ecx, DWORD PTR _cntxt$[ebp]
	push	ecx
	call	_qry_values_list
	add	esp, 16					; 00000010H
	test	eax, eax
	je	SHORT $L71276
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 631		; 00000277H
	jmp	$eva_err$71066
$L71276:

; 634  : 
; 635  : 		/* If brackets hold a variable */
; 636  : 		else if(fieldbeg[1] == '%' && fieldend - fieldbeg > 2)

	jmp	$L71425
$L71088:
	mov	eax, DWORD PTR _fieldbeg$71083[ebp]
	movsx	ecx, BYTE PTR [eax+1]
	cmp	ecx, 37					; 00000025H
	jne	$L71278
	mov	edx, DWORD PTR _fieldend$71084[ebp]
	sub	edx, DWORD PTR _fieldbeg$71083[ebp]
	cmp	edx, 2
	jle	$L71278

; 638  : 			/* Fetch variable definition */
; 639  : 			char *end;
; 640  : 			unsigned long line = strtoul(fieldbeg + 2, &end, 10);

	push	10					; 0000000aH
	lea	eax, DWORD PTR _end$71279[ebp]
	push	eax
	mov	ecx, DWORD PTR _fieldbeg$71083[ebp]
	add	ecx, 2
	push	ecx
	call	_strtoul
	add	esp, 12					; 0000000cH
	mov	DWORD PTR _line$71280[ebp], eax

; 641  : 			DynTable *src = NULL;

	mov	DWORD PTR _src$71281[ebp], 0

; 642  : 			if(isdigit(fieldbeg[2]) && line && *end == ']')

	cmp	DWORD PTR ___mb_cur_max, 1
	jle	SHORT $L74378
	push	4
	mov	edx, DWORD PTR _fieldbeg$71083[ebp]
	movsx	eax, BYTE PTR [edx+2]
	push	eax
	call	__isctype
	add	esp, 8
	mov	DWORD PTR -452+[ebp], eax
	jmp	SHORT $L74379
$L74378:
	mov	ecx, DWORD PTR _fieldbeg$71083[ebp]
	movsx	edx, BYTE PTR [ecx+2]
	mov	eax, DWORD PTR __pctype
	xor	ecx, ecx
	mov	cx, WORD PTR [eax+edx*2]
	and	ecx, 4
	mov	DWORD PTR -452+[ebp], ecx
$L74379:
	cmp	DWORD PTR -452+[ebp], 0
	je	SHORT $L71283
	cmp	DWORD PTR _line$71280[ebp], 0
	je	SHORT $L71283
	mov	edx, DWORD PTR _end$71279[ebp]
	movsx	eax, BYTE PTR [edx]
	cmp	eax, 93					; 0000005dH
	jne	SHORT $L71283

; 643  : 				/* [%number] : use as variable line number */
; 644  : 				src = vardata;

	mov	ecx, DWORD PTR _vardata$[ebp]
	mov	DWORD PTR _src$71281[ebp], ecx

; 645  : 			else

	jmp	$L71305
$L71283:

; 647  : 				/* [%name] : search name in object variables */
; 648  : 				unsigned long i;
; 649  : 				M_FREE(sql);

	mov	edx, DWORD PTR _sql$[ebp]
	push	edx
	call	_mem_free
	add	esp, 4
	mov	DWORD PTR _sql$[ebp], 0

; 650  : 				DYNBUF_ADD(&sql, fieldbeg + 2, fieldend - fieldbeg - 2, NO_CONV);

	push	0
	push	0
	mov	eax, DWORD PTR _fieldend$71084[ebp]
	sub	eax, DWORD PTR _fieldbeg$71083[ebp]
	sub	eax, 2
	push	eax
	mov	ecx, DWORD PTR _fieldbeg$71083[ebp]
	add	ecx, 2
	push	ecx
	lea	edx, DWORD PTR _sql$[ebp]
	push	edx
	call	_dynbuf_add
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L71287
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29872], OFFSET FLAT:$SG71289
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 650		; 0000028aH
	jmp	$eva_err$71066
$L71287:

; 651  : 				for(i = 0; i < varname.nbrows && dyntab_txt_cmp(sql->data, sql->cnt, &varname, i, 0); i++);

	mov	DWORD PTR _i$71285[ebp], 0
	jmp	SHORT $L71290
$L71291:
	mov	edx, DWORD PTR _i$71285[ebp]
	add	edx, 1
	mov	DWORD PTR _i$71285[ebp], edx
$L71290:
	mov	eax, DWORD PTR _i$71285[ebp]
	cmp	eax, DWORD PTR _varname$[ebp]
	jae	SHORT $L71292
	push	0
	mov	ecx, DWORD PTR _i$71285[ebp]
	push	ecx
	lea	edx, DWORD PTR _varname$[ebp]
	push	edx
	mov	eax, DWORD PTR _sql$[ebp]
	mov	ecx, DWORD PTR [eax+4]
	push	ecx
	mov	edx, DWORD PTR _sql$[ebp]
	add	edx, 8
	push	edx
	call	_dyntab_txt_cmp
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L71292
	jmp	SHORT $L71291
$L71292:

; 652  : 				if(i < varname.nbrows)

	mov	eax, DWORD PTR _i$71285[ebp]
	cmp	eax, DWORD PTR _varname$[ebp]
	jae	SHORT $L71293

; 654  : 					/* Name found in given variables : use it */
; 655  : 					line = i + 1;

	mov	ecx, DWORD PTR _i$71285[ebp]
	add	ecx, 1
	mov	DWORD PTR _line$71280[ebp], ecx

; 656  : 					src = vardata;

	mov	edx, DWORD PTR _vardata$[ebp]
	mov	DWORD PTR _src$71281[ebp], edx

; 658  : 				else if(cntxt->form && cntxt->form->ctrl)

	jmp	$L71305
$L71293:
	mov	eax, DWORD PTR _cntxt$[ebp]
	cmp	DWORD PTR [eax+80], 0
	je	$L71305
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	edx, DWORD PTR [ecx+80]
	cmp	DWORD PTR [edx], 0
	je	$L71305

; 660  : 					/* Search in form variables */
; 661  : 					for(i = 0; i < varform.nbrows && dyntab_txt_cmp(sql->data, sql->cnt, &varform, i, 0); i++);

	mov	DWORD PTR _i$71285[ebp], 0
	jmp	SHORT $L71296
$L71297:
	mov	eax, DWORD PTR _i$71285[ebp]
	add	eax, 1
	mov	DWORD PTR _i$71285[ebp], eax
$L71296:
	mov	ecx, DWORD PTR _i$71285[ebp]
	cmp	ecx, DWORD PTR _varform$[ebp]
	jae	SHORT $L71298
	push	0
	mov	edx, DWORD PTR _i$71285[ebp]
	push	edx
	lea	eax, DWORD PTR _varform$[ebp]
	push	eax
	mov	ecx, DWORD PTR _sql$[ebp]
	mov	edx, DWORD PTR [ecx+4]
	push	edx
	mov	eax, DWORD PTR _sql$[ebp]
	add	eax, 8
	push	eax
	call	_dyntab_txt_cmp
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L71298
	jmp	SHORT $L71297
$L71298:

; 662  : 					if(i < varform.nbrows)

	mov	ecx, DWORD PTR _i$71285[ebp]
	cmp	ecx, DWORD PTR _varform$[ebp]
	jae	SHORT $L71299

; 664  : 						/* Name found in form : use form data */
; 665  : 						line = i + 1;

	mov	edx, DWORD PTR _i$71285[ebp]
	add	edx, 1
	mov	DWORD PTR _line$71280[ebp], edx

; 666  : 						src = &cntxt->form->ctrl->attr;

	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	ecx, DWORD PTR [eax+80]
	mov	edx, DWORD PTR [ecx]
	add	edx, 44					; 0000002cH
	mov	DWORD PTR _src$71281[ebp], edx

; 668  : 					else

	jmp	$L71305
$L71299:

; 670  : 						/* Search in server variables */
; 671  : 						for(i = 0; i < varserv.nbrows && dyntab_txt_cmp(sql->data, sql->cnt, &varserv, i, 0); i++);

	mov	DWORD PTR _i$71285[ebp], 0
	jmp	SHORT $L71301
$L71302:
	mov	eax, DWORD PTR _i$71285[ebp]
	add	eax, 1
	mov	DWORD PTR _i$71285[ebp], eax
$L71301:
	mov	ecx, DWORD PTR _i$71285[ebp]
	cmp	ecx, DWORD PTR _varserv$[ebp]
	jae	SHORT $L71303
	push	0
	mov	edx, DWORD PTR _i$71285[ebp]
	push	edx
	lea	eax, DWORD PTR _varserv$[ebp]
	push	eax
	mov	ecx, DWORD PTR _sql$[ebp]
	mov	edx, DWORD PTR [ecx+4]
	push	edx
	mov	eax, DWORD PTR _sql$[ebp]
	add	eax, 8
	push	eax
	call	_dyntab_txt_cmp
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L71303
	jmp	SHORT $L71302
$L71303:

; 672  : 						if(i < varserv.nbrows)

	mov	ecx, DWORD PTR _i$71285[ebp]
	cmp	ecx, DWORD PTR _varserv$[ebp]
	jae	SHORT $L71304

; 674  : 							/* Name found in server config : use server config data */
; 675  : 							line = i + 1;

	mov	edx, DWORD PTR _i$71285[ebp]
	add	edx, 1
	mov	DWORD PTR _line$71280[ebp], edx

; 676  : 							src = &cntxt->cnf_data;

	mov	eax, DWORD PTR _cntxt$[ebp]
	add	eax, 29360				; 000072b0H
	mov	DWORD PTR _src$71281[ebp], eax

; 678  : 						else

	jmp	$L71305
$L71304:

; 679  : 							RETURN_ERROR("Unknown variable in SQL expression", ERR_PUT_BUF("variable : ", sql))

	push	0
	push	0
	push	11					; 0000000bH
	push	OFFSET FLAT:$SG71307
	mov	ecx, DWORD PTR _cntxt$[ebp]
	add	ecx, 29876				; 000074b4H
	push	ecx
	call	_dynbuf_add
	add	esp, 20					; 00000014H
	cmp	DWORD PTR _sql$[ebp], 0
	je	SHORT $L74380
	mov	edx, DWORD PTR _sql$[ebp]
	mov	eax, DWORD PTR [edx+4]
	mov	DWORD PTR -456+[ebp], eax
	jmp	SHORT $L74381
$L74380:
	mov	DWORD PTR -456+[ebp], 0
$L74381:
	cmp	DWORD PTR _sql$[ebp], 0
	je	SHORT $L74382
	mov	ecx, DWORD PTR _sql$[ebp]
	add	ecx, 8
	mov	DWORD PTR -460+[ebp], ecx
	jmp	SHORT $L74383
$L74382:
	mov	DWORD PTR -460+[ebp], OFFSET FLAT:$SG71309
$L74383:
	push	0
	push	0
	mov	edx, DWORD PTR -456+[ebp]
	push	edx
	mov	eax, DWORD PTR -460+[ebp]
	push	eax
	mov	ecx, DWORD PTR _cntxt$[ebp]
	add	ecx, 29876				; 000074b4H
	push	ecx
	call	_dynbuf_add
	add	esp, 20					; 00000014H
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29872], OFFSET FLAT:$SG71310
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 679		; 000002a7H
	jmp	$eva_err$71066
$L71305:

; 686  : 				/* Get variable type */
; 687  : 				char *typ = DYNTAB_FIELDLINE_VAL(src, VAR_SRC, line);

	push	0
	mov	ecx, DWORD PTR _line$71280[ebp]
	push	ecx
	push	OFFSET FLAT:$SG71312
	mov	edx, DWORD PTR _src$71281[ebp]
	push	edx
	call	_dyntab_field_val
	add	esp, 16					; 00000010H
	mov	DWORD PTR _typ$71311[ebp], eax

; 688  : 				EVA_ctrl *ctrl = (!cntxt->form || !cntxt->form->ctrl) ? NULL : (cntxt->form->ctrl + cntxt->form->i_ctrl);

	mov	eax, DWORD PTR _cntxt$[ebp]
	cmp	DWORD PTR [eax+80], 0
	je	SHORT $L74384
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	edx, DWORD PTR [ecx+80]
	cmp	DWORD PTR [edx], 0
	je	SHORT $L74384
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	ecx, DWORD PTR [eax+80]
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	eax, DWORD PTR [edx+80]
	mov	edx, DWORD PTR [eax+8]
	imul	edx, 480				; 000001e0H
	mov	eax, DWORD PTR [ecx]
	add	eax, edx
	mov	DWORD PTR -464+[ebp], eax
	jmp	SHORT $L74385
$L74384:
	mov	DWORD PTR -464+[ebp], 0
$L74385:
	mov	ecx, DWORD PTR -464+[ebp]
	mov	DWORD PTR _ctrl$71313[ebp], ecx

; 689  : 
; 690  : 				/* Use local, control, form or global table to store variable content (avoid multiple calculations) */
; 691  : 				DynTable *varsvalues = src == vardata ? (ctrl && &ctrl->attr == src) ? &ctrl->varsvalues : &varval :
; 692  : 										src == &cntxt->cnf_data ? &cntxt->varsvalues : &cntxt->form->varsvalues;

	mov	edx, DWORD PTR _src$71281[ebp]
	cmp	edx, DWORD PTR _vardata$[ebp]
	jne	SHORT $L74390
	cmp	DWORD PTR _ctrl$71313[ebp], 0
	je	SHORT $L74386
	mov	eax, DWORD PTR _ctrl$71313[ebp]
	add	eax, 44					; 0000002cH
	cmp	eax, DWORD PTR _src$71281[ebp]
	jne	SHORT $L74386
	mov	ecx, DWORD PTR _ctrl$71313[ebp]
	add	ecx, 164				; 000000a4H
	mov	DWORD PTR -468+[ebp], ecx
	jmp	SHORT $L74387
$L74386:
	lea	edx, DWORD PTR _varval$[ebp]
	mov	DWORD PTR -468+[ebp], edx
$L74387:
	mov	eax, DWORD PTR -468+[ebp]
	mov	DWORD PTR -472+[ebp], eax
	jmp	SHORT $L74391
$L74390:
	mov	ecx, DWORD PTR _cntxt$[ebp]
	add	ecx, 29360				; 000072b0H
	cmp	DWORD PTR _src$71281[ebp], ecx
	jne	SHORT $L74388
	mov	edx, DWORD PTR _cntxt$[ebp]
	add	edx, 270228				; 00041f94H
	mov	DWORD PTR -476+[ebp], edx
	jmp	SHORT $L74389
$L74388:
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	ecx, DWORD PTR [eax+80]
	add	ecx, 148				; 00000094H
	mov	DWORD PTR -476+[ebp], ecx
$L74389:
	mov	edx, DWORD PTR -476+[ebp]
	mov	DWORD PTR -472+[ebp], edx
$L74391:
	mov	eax, DWORD PTR -472+[ebp]
	mov	DWORD PTR _varsvalues$71315[ebp], eax

; 693  : 				DynTableCell *val = dyntab_cell(varsvalues, line, 0);

	push	0
	mov	ecx, DWORD PTR _line$71280[ebp]
	push	ecx
	mov	edx, DWORD PTR _varsvalues$71315[ebp]
	push	edx
	call	_dyntab_cell
	add	esp, 12					; 0000000cH
	mov	DWORD PTR _val$71316[ebp], eax

; 694  : 
; 695  : 				/* Leave unmodified if temporary table (evaluated with relational values) */
; 696  : 				if(!strcmp("_EVA_TEMP_TABLE", typ))

	mov	eax, DWORD PTR _typ$71311[ebp]
	push	eax
	push	OFFSET FLAT:$SG71318
	call	_strcmp
	add	esp, 8
	test	eax, eax
	jne	SHORT $L71317

; 698  : 					DYNBUF_ADD(sqlexpr, next, fieldend - next + 1, NO_CONV);

	push	0
	push	0
	mov	ecx, DWORD PTR _fieldend$71084[ebp]
	sub	ecx, DWORD PTR _next$[ebp]
	add	ecx, 1
	push	ecx
	mov	edx, DWORD PTR _next$[ebp]
	push	edx
	mov	eax, DWORD PTR _sqlexpr$[ebp]
	push	eax
	call	_dynbuf_add
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L71320
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29872], OFFSET FLAT:$SG71322
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 698		; 000002baH
	jmp	$eva_err$71066
$L71320:

; 700  : 				else

	jmp	$L71408
$L71317:

; 702  : 					/* Evaluate variable if not done */
; 703  : 					if(!val || !val->col)

	cmp	DWORD PTR _val$71316[ebp], 0
	je	SHORT $L71325
	mov	eax, DWORD PTR _val$71316[ebp]
	cmp	DWORD PTR [eax+56], 0
	jne	$L71324
$L71325:

; 705  : 						/* Get variable definition from src line */
; 706  : 						char *fmt = DYNTAB_FIELDLINE_VAL(src, VAR_FMT, line);

	push	0
	mov	ecx, DWORD PTR _line$71280[ebp]
	push	ecx
	push	OFFSET FLAT:$SG71327
	mov	edx, DWORD PTR _src$71281[ebp]
	push	edx
	call	_dyntab_field_val
	add	esp, 16					; 00000010H
	mov	DWORD PTR _fmt$71326[ebp], eax

; 707  : 						char *fn = DYNTAB_FIELDLINE_VAL(src, VAR_FUNC, line);

	push	0
	mov	eax, DWORD PTR _line$71280[ebp]
	push	eax
	push	OFFSET FLAT:$SG71329
	mov	ecx, DWORD PTR _src$71281[ebp]
	push	ecx
	call	_dyntab_field_val
	add	esp, 16					; 00000010H
	mov	DWORD PTR _fn$71328[ebp], eax

; 708  : 						if(*fmt == '1' && *fn == 'M')

	mov	edx, DWORD PTR _fmt$71326[ebp]
	movsx	eax, BYTE PTR [edx]
	cmp	eax, 49					; 00000031H
	jne	SHORT $L71335
	mov	ecx, DWORD PTR _fn$71328[ebp]
	movsx	edx, BYTE PTR [ecx]
	cmp	edx, 77					; 0000004dH
	jne	SHORT $L71335

; 710  : 							if(!strcmp(fn, "MIN")) fn = "NMIN";

	push	OFFSET FLAT:$SG71332
	mov	eax, DWORD PTR _fn$71328[ebp]
	push	eax
	call	_strcmp
	add	esp, 8
	test	eax, eax
	jne	SHORT $L71331
	mov	DWORD PTR _fn$71328[ebp], OFFSET FLAT:$SG71333

; 711  : 							else if(!strcmp(fn, "MAX")) fn = "NMAX";

	jmp	SHORT $L71335
$L71331:
	push	OFFSET FLAT:$SG71336
	mov	ecx, DWORD PTR _fn$71328[ebp]
	push	ecx
	call	_strcmp
	add	esp, 8
	test	eax, eax
	jne	SHORT $L71335
	mov	DWORD PTR _fn$71328[ebp], OFFSET FLAT:$SG71337
$L71335:

; 713  : 						DYNTAB_FIELDLINE(&srcval, src, VAR_EXPR, line);

	lea	edx, DWORD PTR _srcval$[ebp]
	push	edx
	call	_dyntab_free
	add	esp, 4
	push	0
	mov	eax, DWORD PTR _line$71280[ebp]
	push	eax
	push	OFFSET FLAT:$SG71340
	mov	ecx, DWORD PTR _src$71281[ebp]
	push	ecx
	push	0
	lea	edx, DWORD PTR _srcval$[ebp]
	push	edx
	call	_dyntab_filter_field
	add	esp, 24					; 00000018H
	test	eax, eax
	je	SHORT $L71339
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29872], OFFSET FLAT:$SG71342
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 713		; 000002c9H
	jmp	$eva_err$71066
$L71339:

; 714  : 						if(!strcmp(typ, "_EVA_EXPRVAL"))

	push	OFFSET FLAT:$SG71344
	mov	edx, DWORD PTR _typ$71311[ebp]
	push	edx
	call	_strcmp
	add	esp, 8
	test	eax, eax
	jne	SHORT $L71343

; 715  : 							DYNTAB_FIELDLINE(&listobj, src, VAR_EXPRVAL, line)

	lea	eax, DWORD PTR _listobj$[ebp]
	push	eax
	call	_dyntab_free
	add	esp, 4
	push	0
	mov	ecx, DWORD PTR _line$71280[ebp]
	push	ecx
	push	OFFSET FLAT:$SG71347
	mov	edx, DWORD PTR _src$71281[ebp]
	push	edx
	push	0
	lea	eax, DWORD PTR _listobj$[ebp]
	push	eax
	call	_dyntab_filter_field
	add	esp, 24					; 00000018H
	test	eax, eax
	je	SHORT $L71346
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29872], OFFSET FLAT:$SG71349
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 715		; 000002cbH
	jmp	$eva_err$71066
$L71346:

; 716  : 						else if(!strcmp(typ, "_EVA_SRC_FILTER"))

	jmp	$L71360
$L71343:
	push	OFFSET FLAT:$SG71352
	mov	eax, DWORD PTR _typ$71311[ebp]
	push	eax
	call	_strcmp
	add	esp, 8
	test	eax, eax
	jne	SHORT $L71351

; 717  : 							DYNTAB_FIELDLINE(&listobj, src, SRC_FILTER, line)

	lea	ecx, DWORD PTR _listobj$[ebp]
	push	ecx
	call	_dyntab_free
	add	esp, 4
	push	0
	mov	edx, DWORD PTR _line$71280[ebp]
	push	edx
	push	OFFSET FLAT:$SG71355
	mov	eax, DWORD PTR _src$71281[ebp]
	push	eax
	push	0
	lea	ecx, DWORD PTR _listobj$[ebp]
	push	ecx
	call	_dyntab_filter_field
	add	esp, 24					; 00000018H
	test	eax, eax
	je	SHORT $L71354
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29872], OFFSET FLAT:$SG71357
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 717		; 000002cdH
	jmp	$eva_err$71066
$L71354:

; 718  : 						else

	jmp	SHORT $L71360
$L71351:

; 719  : 							DYNTAB_FIELDLINE(&listobj, src, VAR_LISTOBJ, line);

	lea	ecx, DWORD PTR _listobj$[ebp]
	push	ecx
	call	_dyntab_free
	add	esp, 4
	push	0
	mov	edx, DWORD PTR _line$71280[ebp]
	push	edx
	push	OFFSET FLAT:$SG71361
	mov	eax, DWORD PTR _src$71281[ebp]
	push	eax
	push	0
	lea	ecx, DWORD PTR _listobj$[ebp]
	push	ecx
	call	_dyntab_filter_field
	add	esp, 24					; 00000018H
	test	eax, eax
	je	SHORT $L71360
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29872], OFFSET FLAT:$SG71363
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 719		; 000002cfH
	jmp	$eva_err$71066
$L71360:

; 720  : 
; 721  : 						/* Evaluate variable & store in temp location (avoid multiple calculations) */
; 722  : 						if(!strcmp("_EVA_LIST_TABLE", typ))

	mov	ecx, DWORD PTR _typ$71311[ebp]
	push	ecx
	push	OFFSET FLAT:$SG71365
	call	_strcmp
	add	esp, 8
	test	eax, eax
	jne	$L71364

; 724  : 							/* Create temporary table from list definition */
; 725  : 							unsigned long i;
; 726  : 							DYNTAB_FIELDLINE(&listobj, src, VAR_LIST_TABLE, line);

	lea	edx, DWORD PTR _listobj$[ebp]
	push	edx
	call	_dyntab_free
	add	esp, 4
	push	0
	mov	eax, DWORD PTR _line$71280[ebp]
	push	eax
	push	OFFSET FLAT:$SG71369
	mov	ecx, DWORD PTR _src$71281[ebp]
	push	ecx
	push	0
	lea	edx, DWORD PTR _listobj$[ebp]
	push	edx
	call	_dyntab_filter_field
	add	esp, 24					; 00000018H
	test	eax, eax
	je	SHORT $L71368
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29872], OFFSET FLAT:$SG71371
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 726		; 000002d6H
	jmp	$eva_err$71066
$L71368:

; 727  : 							for(i = 0; i < listobj.nbrows; i ++)

	mov	DWORD PTR _i$71366[ebp], 0
	jmp	SHORT $L71372
$L71373:
	mov	edx, DWORD PTR _i$71366[ebp]
	add	edx, 1
	mov	DWORD PTR _i$71366[ebp], edx
$L71372:
	mov	eax, DWORD PTR _i$71366[ebp]
	cmp	eax, DWORD PTR _listobj$[ebp]
	jae	SHORT $L71374

; 728  : 								if(qry_table_from_list(cntxt, DYNTAB_TOULRC(&listobj, i, 0))) CLEAR_ERROR;

	push	10					; 0000000aH
	push	0
	push	0
	mov	ecx, DWORD PTR _i$71366[ebp]
	push	ecx
	lea	edx, DWORD PTR _listobj$[ebp]
	push	edx
	call	_dyntab_val
	add	esp, 12					; 0000000cH
	push	eax
	call	_strtoul
	add	esp, 12					; 0000000cH
	push	eax
	mov	eax, DWORD PTR _cntxt$[ebp]
	push	eax
	call	_qry_table_from_list
	add	esp, 8
	test	eax, eax
	je	SHORT $L71376
	push	728					; 000002d8H
	push	OFFSET FLAT:$SG71377
	push	OFFSET FLAT:$SG71378
	mov	ecx, DWORD PTR _cntxt$[ebp]
	push	ecx
	call	_err_clear
	add	esp, 16					; 00000010H
$L71376:

; 729  : 							DYNTAB_FREE(data);

	jmp	SHORT $L71373
$L71374:
	lea	edx, DWORD PTR _data$[ebp]
	push	edx
	call	_dyntab_free
	add	esp, 4

; 730  : 							DYNTAB_ADD_STR(&data, 0, 0, "1");

	push	1
	push	OFFSET FLAT:$SG71380
	push	0
	push	0
	lea	eax, DWORD PTR _data$[ebp]
	push	eax
	call	_dyntab_set_txt
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L71379
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29872], OFFSET FLAT:$SG71382
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 730		; 000002daH
	jmp	$eva_err$71066
$L71379:

; 732  : 						else if(form_eval_valtype(cntxt, &data, typ, &listobj, &srcval)) CLEAR_ERROR;

	jmp	SHORT $L71384
$L71364:
	lea	eax, DWORD PTR _srcval$[ebp]
	push	eax
	lea	ecx, DWORD PTR _listobj$[ebp]
	push	ecx
	mov	edx, DWORD PTR _typ$71311[ebp]
	push	edx
	lea	eax, DWORD PTR _data$[ebp]
	push	eax
	mov	ecx, DWORD PTR _cntxt$[ebp]
	push	ecx
	call	_form_eval_valtype
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L71384
	push	732					; 000002dcH
	push	OFFSET FLAT:$SG71385
	push	OFFSET FLAT:$SG71386
	mov	edx, DWORD PTR _cntxt$[ebp]
	push	edx
	call	_err_clear
	add	esp, 16					; 00000010H
$L71384:

; 733  : 						M_FREE(sql);

	mov	eax, DWORD PTR _sql$[ebp]
	push	eax
	call	_mem_free
	add	esp, 4
	mov	DWORD PTR _sql$[ebp], 0

; 734  : 						if(*fn) dyntab_group(&data, fn);

	mov	ecx, DWORD PTR _fn$71328[ebp]
	movsx	edx, BYTE PTR [ecx]
	test	edx, edx
	je	SHORT $L71387
	mov	eax, DWORD PTR _fn$71328[ebp]
	push	eax
	lea	ecx, DWORD PTR _data$[ebp]
	push	ecx
	call	_dyntab_group
	add	esp, 8
$L71387:

; 735  : 						if(qry_values_list(cntxt, &data, !strcmp(typ, "_EVA_VALUEID") ? 3 : *fmt == '1' ? 0 :  *fmt == '2' ? 7 : 5, &sql)) STACK_ERROR;

	push	OFFSET FLAT:$SG71389
	mov	edx, DWORD PTR _typ$71311[ebp]
	push	edx
	call	_strcmp
	add	esp, 8
	test	eax, eax
	jne	SHORT $L74394
	mov	DWORD PTR -480+[ebp], 3
	jmp	SHORT $L74395
$L74394:
	mov	eax, DWORD PTR _fmt$71326[ebp]
	movsx	ecx, BYTE PTR [eax]
	cmp	ecx, 49					; 00000031H
	jne	SHORT $L74392
	mov	DWORD PTR -484+[ebp], 0
	jmp	SHORT $L74393
$L74392:
	mov	edx, DWORD PTR _fmt$71326[ebp]
	movsx	eax, BYTE PTR [edx]
	sub	eax, 50					; 00000032H
	neg	eax
	sbb	eax, eax
	and	al, -2					; fffffffeH
	add	eax, 7
	mov	DWORD PTR -484+[ebp], eax
$L74393:
	mov	ecx, DWORD PTR -484+[ebp]
	mov	DWORD PTR -480+[ebp], ecx
$L74395:
	lea	edx, DWORD PTR _sql$[ebp]
	push	edx
	mov	eax, DWORD PTR -480+[ebp]
	push	eax
	lea	ecx, DWORD PTR _data$[ebp]
	push	ecx
	mov	edx, DWORD PTR _cntxt$[ebp]
	push	edx
	call	_qry_values_list
	add	esp, 16					; 00000010H
	test	eax, eax
	je	SHORT $L71388
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 735		; 000002dfH
	jmp	$eva_err$71066
$L71388:

; 736  : 						DYNTAB_ADD_BUF(varsvalues, line, 0, sql);

	cmp	DWORD PTR _sql$[ebp], 0
	je	SHORT $L71390
	mov	ecx, DWORD PTR _sql$[ebp]
	cmp	DWORD PTR [ecx+4], 0
	je	SHORT $L71390
	push	0
	push	0
	mov	edx, DWORD PTR _sql$[ebp]
	mov	eax, DWORD PTR [edx+4]
	push	eax
	mov	ecx, DWORD PTR _sql$[ebp]
	add	ecx, 8
	push	ecx
	push	0
	mov	edx, DWORD PTR _line$71280[ebp]
	push	edx
	mov	eax, DWORD PTR _varsvalues$71315[ebp]
	push	eax
	call	_dyntab_add
	add	esp, 28					; 0000001cH
	test	eax, eax
	je	SHORT $L71392
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29872], OFFSET FLAT:$SG71394
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 736		; 000002e0H
	jmp	$eva_err$71066
$L71392:
	jmp	SHORT $L71398
$L71390:
	push	0
	push	0
	push	0
	push	0
	push	0
	mov	eax, DWORD PTR _line$71280[ebp]
	push	eax
	mov	ecx, DWORD PTR _varsvalues$71315[ebp]
	push	ecx
	call	_dyntab_add
	add	esp, 28					; 0000001cH
	test	eax, eax
	je	SHORT $L71398
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29872], OFFSET FLAT:$SG71400
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 736		; 000002e0H
	jmp	$eva_err$71066
$L71398:

; 737  : 						val = dyntab_cell(varsvalues, line, 0);

	push	0
	mov	ecx, DWORD PTR _line$71280[ebp]
	push	ecx
	mov	edx, DWORD PTR _varsvalues$71315[ebp]
	push	edx
	call	_dyntab_cell
	add	esp, 12					; 0000000cH
	mov	DWORD PTR _val$71316[ebp], eax

; 738  : 						val->col = 1;

	mov	eax, DWORD PTR _val$71316[ebp]
	mov	DWORD PTR [eax+56], 1
$L71324:

; 740  : 
; 741  : 					/* Replace brackets with stored variable values in SQL expression */
; 742  : 					if(fieldbeg > next) DYNBUF_ADD(sqlexpr, next, fieldbeg - next, NO_CONV);

	mov	ecx, DWORD PTR _fieldbeg$71083[ebp]
	cmp	ecx, DWORD PTR _next$[ebp]
	jbe	SHORT $L71403
	push	0
	push	0
	mov	edx, DWORD PTR _fieldbeg$71083[ebp]
	sub	edx, DWORD PTR _next$[ebp]
	push	edx
	mov	eax, DWORD PTR _next$[ebp]
	push	eax
	mov	ecx, DWORD PTR _sqlexpr$[ebp]
	push	ecx
	call	_dynbuf_add
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L71403
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29872], OFFSET FLAT:$SG71405
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 742		; 000002e6H
	jmp	$eva_err$71066
$L71403:

; 743  : 					DYNBUF_ADD_CELLP(sqlexpr, val, NO_CONV);

	mov	ecx, DWORD PTR _val$71316[ebp]
	mov	DWORD PTR __c$71406[ebp], ecx
	cmp	DWORD PTR __c$71406[ebp], 0
	je	SHORT $L71408
	push	0
	push	0
	mov	edx, DWORD PTR __c$71406[ebp]
	mov	eax, DWORD PTR [edx+4]
	push	eax
	mov	ecx, DWORD PTR __c$71406[ebp]
	mov	edx, DWORD PTR [ecx]
	push	edx
	mov	eax, DWORD PTR _sqlexpr$[ebp]
	push	eax
	call	_dynbuf_add
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L71408
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29872], OFFSET FLAT:$SG71410
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 743		; 000002e7H
	jmp	$eva_err$71066
$L71408:

; 747  : 
; 748  : 		/* If brackets hold a fixed string : get value Id */
; 749  : 		else if(fieldbeg[1] == '\'' && fieldend - fieldbeg > 2)

	jmp	$L71425
$L71278:
	mov	eax, DWORD PTR _fieldbeg$71083[ebp]
	movsx	ecx, BYTE PTR [eax+1]
	cmp	ecx, 39					; 00000027H
	jne	$L71412
	mov	edx, DWORD PTR _fieldend$71084[ebp]
	sub	edx, DWORD PTR _fieldbeg$71083[ebp]
	cmp	edx, 2
	jle	$L71412

; 751  : 			unsigned long id;
; 752  :  			if(sql_id_value(cntxt, fieldbeg + 2, fieldend - fieldbeg - 2, &id)) STACK_ERROR;

	lea	eax, DWORD PTR _id$71413[ebp]
	push	eax
	mov	ecx, DWORD PTR _fieldend$71084[ebp]
	sub	ecx, DWORD PTR _fieldbeg$71083[ebp]
	sub	ecx, 2
	push	ecx
	mov	edx, DWORD PTR _fieldbeg$71083[ebp]
	add	edx, 2
	push	edx
	mov	eax, DWORD PTR _cntxt$[ebp]
	push	eax
	call	_sql_id_value
	add	esp, 16					; 00000010H
	test	eax, eax
	je	SHORT $L71414
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 752		; 000002f0H
	jmp	$eva_err$71066
$L71414:

; 753  : 			if(fieldbeg > next) DYNBUF_ADD(sqlexpr, next, fieldbeg - next, NO_CONV);

	mov	edx, DWORD PTR _fieldbeg$71083[ebp]
	cmp	edx, DWORD PTR _next$[ebp]
	jbe	SHORT $L71417
	push	0
	push	0
	mov	eax, DWORD PTR _fieldbeg$71083[ebp]
	sub	eax, DWORD PTR _next$[ebp]
	push	eax
	mov	ecx, DWORD PTR _next$[ebp]
	push	ecx
	mov	edx, DWORD PTR _sqlexpr$[ebp]
	push	edx
	call	_dynbuf_add
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L71417
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29872], OFFSET FLAT:$SG71419
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 753		; 000002f1H
	jmp	$eva_err$71066
$L71417:

; 754  : 			DYNBUF_ADD_INT(sqlexpr, id);

	mov	edx, DWORD PTR _id$71413[ebp]
	push	edx
	mov	eax, DWORD PTR _sqlexpr$[ebp]
	push	eax
	call	_dynbuf_add_int
	add	esp, 8
	test	eax, eax
	je	SHORT $L71420
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29872], OFFSET FLAT:$SG71422
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 754		; 000002f2H
	jmp	$eva_err$71066
$L71420:

; 756  : 		else

	jmp	SHORT $L71425
$L71412:

; 758  : 			/* Field expression : leave unmodified */
; 759  : 			DYNBUF_ADD(sqlexpr, next, fieldend - next + 1, NO_CONV);

	push	0
	push	0
	mov	eax, DWORD PTR _fieldend$71084[ebp]
	sub	eax, DWORD PTR _next$[ebp]
	add	eax, 1
	push	eax
	mov	ecx, DWORD PTR _next$[ebp]
	push	ecx
	mov	edx, DWORD PTR _sqlexpr$[ebp]
	push	edx
	call	_dynbuf_add
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L71425
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29872], OFFSET FLAT:$SG71427
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 759		; 000002f7H
	jmp	SHORT $eva_err$71066
$L71425:

; 762  : 	END_EACH_BRACKET

	mov	edx, DWORD PTR _fieldend$71084[ebp]
	add	edx, 1
	mov	DWORD PTR _next$[ebp], edx
	jmp	$L71081
$L71082:

; 763  : 
; 764  : 	/* Add rest of expression after last brackets */
; 765  : 	if(*next) DYNBUF_ADD(sqlexpr, next, 0, NO_CONV);

	mov	eax, DWORD PTR _next$[ebp]
	movsx	ecx, BYTE PTR [eax]
	test	ecx, ecx
	je	SHORT $L71430
	push	0
	push	0
	push	0
	mov	edx, DWORD PTR _next$[ebp]
	push	edx
	mov	eax, DWORD PTR _sqlexpr$[ebp]
	push	eax
	call	_dynbuf_add
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L71430
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29872], OFFSET FLAT:$SG71432
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 765		; 000002fdH
	jmp	SHORT $eva_err$71066
$L71430:
$eva_noerr$71059:

; 766  : 
; 767  : 	RETURN_OK_CLEANUP;

	push	0
	push	OFFSET FLAT:$SG71433
	push	OFFSET FLAT:$SG71434
	mov	eax, DWORD PTR _cntxt$[ebp]
	push	eax
	call	_err_clear
	add	esp, 16					; 00000010H
$eva_err$71066:
	mov	ecx, DWORD PTR _cntxt$[ebp]
	cmp	DWORD PTR [ecx+29872], 0
	je	SHORT $L71435
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	eax, DWORD PTR [edx+29900]
	push	eax
	push	OFFSET FLAT:$SG71436
	push	OFFSET FLAT:$SG71437
	mov	ecx, DWORD PTR _cntxt$[ebp]
	push	ecx
	call	_err_add_context
	add	esp, 16					; 00000010H
$L71435:
	mov	edx, DWORD PTR _sql$[ebp]
	push	edx
	call	_mem_free
	add	esp, 4
	mov	DWORD PTR _sql$[ebp], 0
	lea	eax, DWORD PTR _varname$[ebp]
	push	eax
	call	_dyntab_free
	add	esp, 4
	lea	ecx, DWORD PTR _varform$[ebp]
	push	ecx
	call	_dyntab_free
	add	esp, 4
	lea	edx, DWORD PTR _varserv$[ebp]
	push	edx
	call	_dyntab_free
	add	esp, 4
	lea	eax, DWORD PTR _listobj$[ebp]
	push	eax
	call	_dyntab_free
	add	esp, 4
	lea	ecx, DWORD PTR _srcval$[ebp]
	push	ecx
	call	_dyntab_free
	add	esp, 4
	lea	edx, DWORD PTR _varval$[ebp]
	push	edx
	call	_dyntab_free
	add	esp, 4
	lea	eax, DWORD PTR _data$[ebp]
	push	eax
	call	_dyntab_free
	add	esp, 4
	mov	ecx, DWORD PTR _cntxt$[ebp]
	xor	eax, eax
	cmp	DWORD PTR [ecx+29872], 0
	setne	al

; 768  : }

	pop	edi
	mov	esp, ebp
	pop	ebp
	ret	0
_qry_eval_sqlexpr_var ENDP
_TEXT	ENDS
PUBLIC	_drop_tmptables
EXTRN	_sql_drop_table:NEAR
_DATA	SEGMENT
	ORG $+3
$SG71452 DB	'%s%lu', 00H
_DATA	ENDS
_TEXT	SEGMENT
_cntxt$ = 8
_pfx$ = 12
_n$ = 16
_i$ = -36
_tbl$ = -32
_drop_tmptables PROC NEAR

; 780  : ){

	push	ebp
	mov	ebp, esp
	sub	esp, 36					; 00000024H

; 781  : 	unsigned long i;
; 782  : 	char tbl[32];
; 783  : 	for(i = 0; i < n; i++)

	mov	DWORD PTR _i$[ebp], 0
	jmp	SHORT $L71449
$L71450:
	mov	eax, DWORD PTR _i$[ebp]
	add	eax, 1
	mov	DWORD PTR _i$[ebp], eax
$L71449:
	mov	ecx, DWORD PTR _i$[ebp]
	cmp	ecx, DWORD PTR _n$[ebp]
	jae	SHORT $L71451

; 785  : 		snprintf(add_sz_str(tbl), "%s%lu", pfx, i);

	mov	edx, DWORD PTR _i$[ebp]
	push	edx
	mov	eax, DWORD PTR _pfx$[ebp]
	push	eax
	push	OFFSET FLAT:$SG71452
	push	31					; 0000001fH
	lea	ecx, DWORD PTR _tbl$[ebp]
	push	ecx
	call	__snprintf
	add	esp, 20					; 00000014H

; 786  : 		sql_drop_table(cntxt, tbl);

	lea	edx, DWORD PTR _tbl$[ebp]
	push	edx
	mov	eax, DWORD PTR _cntxt$[ebp]
	push	eax
	call	_sql_drop_table
	add	esp, 8

; 787  : 	}

	jmp	SHORT $L71450
$L71451:

; 788  : }

	mov	esp, ebp
	pop	ebp
	ret	0
_drop_tmptables ENDP
_TEXT	ENDS
PUBLIC	__real@8@3ffbccccccccccccd000
PUBLIC	_qry_build_sqlexpr
PUBLIC	_qry_eval_sql_fieldexpr
PUBLIC	_qry_build_clauses
PUBLIC	_qry_parse_fieldexpr_nodes
EXTRN	_mem_alloc:NEAR
EXTRN	__fltused:NEAR
EXTRN	_put_debug_sqltable:NEAR
EXTRN	_err_print_filter:NEAR
EXTRN	_strstr:NEAR
_BSS	SEGMENT
	ALIGN	4

$SG71745 DB	01H DUP (?)
	ALIGN	4

$SG71652 DB	01H DUP (?)
	ALIGN	4

$SG71653 DB	01H DUP (?)
_BSS	ENDS
_DATA	SEGMENT
	ORG $+2
$SG71499 DB	'_EVA_VAR_SRC', 00H
	ORG $+3
$SG71501 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG71505 DB	'_EVA_TEMP_TABLE_EXPR', 00H
	ORG $+3
$SG71507 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG71511 DB	'_EVA_TEMP_TABLE_RELEXPR', 00H
$SG71513 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG71517 DB	'_EVA_TEMP_TABLE_FUNC', 00H
	ORG $+3
$SG71519 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG71549 DB	'P%lu', 00H
	ORG $+3
$SG71551 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG71559 DB	0aH, 'CREATE TEMPORARY TABLE TV1 TYPE=HEAP', 0aH, 00H
	ORG $+1
$SG71560 DB	'-- qry_build_sqlexpr - Evaluate source relation for var '
	DB	'%', 00H
	ORG $+2
$SG71562 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG71567 DB	'ORDER BY IdObj,Val', 00H
	ORG $+1
$SG71569 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG71572 DB	'ALTER TABLE TV1 ADD INDEX (Val)', 00H
$SG71574 DB	'-- qry_build_sqlexpr - Build list of distinct related ob'
	DB	'jects', 0aH, 'CREATE TEMPORARY TABLE TV0 TYPE=HEAP', 0aH, 'SE'
	DB	'LECT DISTINCT Val AS IdObj FROM TV1', 00H
	ORG $+3
$SG71576 DB	'TV0', 00H
$SG71577 DB	'TV2', 00H
$SG71580 DB	0aH, 00H
	ORG $+2
$SG71581 DB	'-- qry_build_sqlexpr - Build related values table for va'
	DB	'r %', 00H
$SG71583 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG71586 DB	0aH, 00H
	ORG $+2
$SG71587 DB	'CREATE TEMPORARY TABLE ', 00H
$SG71589 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG71593 DB	'(TV2.Val) AS Val,NULL AS Line', 0aH, 00H
	ORG $+1
$SG71594 DB	'SELECT TV1.IdObj,', 00H
	ORG $+2
$SG71596 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG71600 DB	'SELECT DISTINCT TV1.IdObj,TV2.Val,TV2.Line', 0aH, 00H
$SG71602 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG71605 DB	'FROM TV1 INNER JOIN TV2 ON TV1.Val=TV2.IdObj', 0aH, 00H
	ORG $+2
$SG71607 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG71611 DB	'GROUP BY TV1.IdObj', 00H
	ORG $+1
$SG71613 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG71615 DB	'TV', 00H
	ORG $+1
$SG71619 DB	0aH, 00H
	ORG $+2
$SG71620 DB	'-- qry_build_sqlexpr - Build grouped values table for va'
	DB	'r %', 00H
$SG71622 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG71625 DB	0aH, 00H
	ORG $+2
$SG71626 DB	'CREATE TEMPORARY TABLE ', 00H
$SG71628 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG71631 DB	'(Val) AS Val,NULL AS Line', 0aH, 'FROM TV2 GROUP BY IdOb'
	DB	'j', 00H
	ORG $+2
$SG71632 DB	'SELECT IdObj,', 00H
	ORG $+2
$SG71634 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG71636 DB	'TV2', 00H
$SG71642 DB	'.<->()', 00H
	ORG $+1
$SG71659 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG71666 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG71669 DB	'Line', 00H
	ORG $+3
$SG71680 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG71687 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG71691 DB	'Del', 00H
$SG71700 DB	'ALTER TABLE %s RENAME V%lu', 00H
	ORG $+1
$SG71705 DB	0aH, 00H
	ORG $+2
$SG71706 DB	'-- qry_build_sqlexpr - build values table V', 00H
$SG71708 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG71710 DB	0aH, 00H
	ORG $+2
$SG71711 DB	'CREATE TEMPORARY TABLE V', 00H
	ORG $+3
$SG71713 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG71721 DB	' AS Val', 00H
$SG71723 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG71727 DB	',NULL AS Line', 00H
	ORG $+2
$SG71729 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG71739 DB	',', 00H
	ORG $+2
$SG71741 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG71746 DB	'IdObj', 00H
	ORG $+2
$SG71747 DB	'IdValObj', 00H
	ORG $+3
$SG71748 DB	'Val', 00H
$SG71749 DB	' AS ', 00H
	ORG $+3
$SG71751 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG71755 DB	'D:\Travail\ABI\EVA\V4.0\CGI\Brunix-2016\qry_build.c', 00H
$SG71756 DB	'qry_build_sqlexpr', 00H
	ORG $+2
$SG71759 DB	'NULL', 00H
	ORG $+3
$SG71761 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG71763 DB	'V%lu', 00H
	ORG $+3
$SG71767 DB	']', 0aH, 00H
	ORG $+1
$SG71768 DB	'*** Done [', 00H
	ORG $+1
$SG71770 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG71773 DB	'ALTER TABLE V%lu ADD INDEX (IdObj)', 00H
	ORG $+1
$SG71776 DB	'LEFT JOIN V%lu ON V%lu.IdObj=%s.IdObj ', 0aH, 00H
$SG71797 DB	'Program error', 00H
	ORG $+2
$SG71799 DB	'IdObj', 00H
	ORG $+2
$SG71800 DB	'IdValObj', 00H
	ORG $+3
$SG71801 DB	'Val', 00H
$SG71806 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG71808 DB	'IF(V%lu.%s IS NULL,'''',V%lu.%s)', 00H
	ORG $+1
$SG71813 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG71814 DB	'D:\Travail\ABI\EVA\V4.0\CGI\Brunix-2016\qry_build.c', 00H
$SG71815 DB	'qry_build_sqlexpr', 00H
	ORG $+2
$SG71817 DB	'D:\Travail\ABI\EVA\V4.0\CGI\Brunix-2016\qry_build.c', 00H
$SG71818 DB	'qry_build_sqlexpr', 00H
_DATA	ENDS
;	COMDAT __real@8@3ffbccccccccccccd000
; File D:\Travail\ABI\EVA\V4.0\CGI\Brunix-2016\qry_build.c
CONST	SEGMENT
__real@8@3ffbccccccccccccd000 DQ 03fb999999999999ar ; 0.1
CONST	ENDS
_TEXT	SEGMENT
_size$71682 = -5752
_src$71683 = -5756
_size1$71684 = -5760
_fld$71695 = -5768
_b_usedel$71696 = -5764
_line$71698 = -5772
_fieldbeg$71780 = -5776
_fieldend$71781 = -5780
_f$71798 = -5784
_cntxt$ = 8
_member$ = 12
_join$ = 16
_expr$ = 20
_srctbl$ = 24
_vardata$ = 28
_nbtemp$ = 32
_sql$ = -4
_exprbuf$ = -1116
_valtyp$ = -1112
_valexpr$ = -1088
_valrel$ = -1048
_valfunc$ = -1136
_empty$ = -1168
_tables$ = -5652
_data$ = -1068
_flt$ = -5628
_printbuf$ = -1028
_i$ = -1144
_j$ = -1148
_next$ = -5632
_fld$ = -1172
_b_srcobj$ = -1140
_b_line$ = -1092
_fieldbeg$71523 = -5656
_fieldend$71524 = -5660
_field$71528 = -5668
_szfield$71529 = -5692
_szmodif$71530 = -5696
_paropn$71531 = -5664
_b_groupfn$71532 = -5676
_modif$71534 = -5688
_irow$71535 = -5680
_icol$71536 = -5672
_ibase$71537 = -5684
_line$71539 = -5700
_tbl$71542 = -5716
_vexpr$71543 = -5720
_func$71544 = -5724
_rel$71545 = -5728
_lastnode$71555 = -5732
_size$71661 = -5736
_src$71662 = -5740
_size1$71663 = -5744
_m$71674 = -5748
_qry_build_sqlexpr PROC NEAR

; 816  : ){

	push	ebp
	mov	ebp, esp
	mov	eax, 5856				; 000016e0H
	call	__chkstk
	push	edi

; 817  : 	DynBuffer *sql = NULL;

	mov	DWORD PTR _sql$[ebp], 0

; 818  : 	DynBuffer *exprbuf = NULL;

	mov	DWORD PTR _exprbuf$[ebp], 0

; 819  : 	DynTable valtyp = {0};

	mov	DWORD PTR _valtyp$[ebp], 0
	xor	eax, eax
	mov	DWORD PTR _valtyp$[ebp+4], eax
	mov	DWORD PTR _valtyp$[ebp+8], eax
	mov	DWORD PTR _valtyp$[ebp+12], eax
	mov	DWORD PTR _valtyp$[ebp+16], eax

; 820  : 	DynTable valexpr = {0};

	mov	DWORD PTR _valexpr$[ebp], 0
	xor	ecx, ecx
	mov	DWORD PTR _valexpr$[ebp+4], ecx
	mov	DWORD PTR _valexpr$[ebp+8], ecx
	mov	DWORD PTR _valexpr$[ebp+12], ecx
	mov	DWORD PTR _valexpr$[ebp+16], ecx

; 821  : 	DynTable valrel = {0};

	mov	DWORD PTR _valrel$[ebp], 0
	xor	edx, edx
	mov	DWORD PTR _valrel$[ebp+4], edx
	mov	DWORD PTR _valrel$[ebp+8], edx
	mov	DWORD PTR _valrel$[ebp+12], edx
	mov	DWORD PTR _valrel$[ebp+16], edx

; 822  : 	DynTable valfunc = {0};

	mov	DWORD PTR _valfunc$[ebp], 0
	xor	eax, eax
	mov	DWORD PTR _valfunc$[ebp+4], eax
	mov	DWORD PTR _valfunc$[ebp+8], eax
	mov	DWORD PTR _valfunc$[ebp+12], eax
	mov	DWORD PTR _valfunc$[ebp+16], eax

; 823  : 	DynTable empty = {0};

	mov	DWORD PTR _empty$[ebp], 0
	xor	ecx, ecx
	mov	DWORD PTR _empty$[ebp+4], ecx
	mov	DWORD PTR _empty$[ebp+8], ecx
	mov	DWORD PTR _empty$[ebp+12], ecx
	mov	DWORD PTR _empty$[ebp+16], ecx

; 824  : 	DynTable tables = {0};

	mov	DWORD PTR _tables$[ebp], 0
	xor	edx, edx
	mov	DWORD PTR _tables$[ebp+4], edx
	mov	DWORD PTR _tables$[ebp+8], edx
	mov	DWORD PTR _tables$[ebp+12], edx
	mov	DWORD PTR _tables$[ebp+16], edx

; 825  : 	DynTable data = {0};

	mov	DWORD PTR _data$[ebp], 0
	xor	eax, eax
	mov	DWORD PTR _data$[ebp+4], eax
	mov	DWORD PTR _data$[ebp+8], eax
	mov	DWORD PTR _data$[ebp+12], eax
	mov	DWORD PTR _data$[ebp+16], eax

; 826  : 	QryBuild flt = {{0}};

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

; 827  : 	char printbuf[1024];
; 828  : 	unsigned long i, j = 0;

	mov	DWORD PTR _j$[ebp], 0

; 829  : 	char *next;
; 830  : 	DynTableCell *fld = NULL;

	mov	DWORD PTR _fld$[ebp], 0

; 831  : 	int b_srcobj = nbtemp && !(*nbtemp & 1);

	cmp	DWORD PTR _nbtemp$[ebp], 0
	je	SHORT $L74398
	mov	edx, DWORD PTR _nbtemp$[ebp]
	mov	eax, DWORD PTR [edx]
	and	eax, 1
	test	eax, eax
	jne	SHORT $L74398
	mov	DWORD PTR -5788+[ebp], 1
	jmp	SHORT $L74399
$L74398:
	mov	DWORD PTR -5788+[ebp], 0
$L74399:
	mov	ecx, DWORD PTR -5788+[ebp]
	mov	DWORD PTR _b_srcobj$[ebp], ecx

; 832  : 	int b_line = nbtemp && *nbtemp & 2;

	cmp	DWORD PTR _nbtemp$[ebp], 0
	je	SHORT $L74400
	mov	edx, DWORD PTR _nbtemp$[ebp]
	mov	eax, DWORD PTR [edx]
	and	eax, 2
	test	eax, eax
	je	SHORT $L74400
	mov	DWORD PTR -5792+[ebp], 1
	jmp	SHORT $L74401
$L74400:
	mov	DWORD PTR -5792+[ebp], 0
$L74401:
	mov	ecx, DWORD PTR -5792+[ebp]
	mov	DWORD PTR _b_line$[ebp], ecx

; 833  : 
; 834  : 	/* Evaluate variables in expression */
; 835  : 	if(!expr || !*expr) RETURN_OK;

	cmp	DWORD PTR _expr$[ebp], 0
	je	SHORT $L71492
	mov	edx, DWORD PTR _expr$[ebp]
	movsx	eax, BYTE PTR [edx]
	test	eax, eax
	jne	SHORT $L71491
$L71492:
	jmp	$eva_noerr$71493
$L71491:

; 836  : 	if(qry_eval_sqlexpr_var(cntxt, &exprbuf, expr, vardata, srctbl)) STACK_ERROR;

	mov	ecx, DWORD PTR _srctbl$[ebp]
	push	ecx
	mov	edx, DWORD PTR _vardata$[ebp]
	push	edx
	mov	eax, DWORD PTR _expr$[ebp]
	push	eax
	lea	ecx, DWORD PTR _exprbuf$[ebp]
	push	ecx
	mov	edx, DWORD PTR _cntxt$[ebp]
	push	edx
	call	_qry_eval_sqlexpr_var
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L71494
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 836		; 00000344H
	jmp	$eva_err$71495
$L71494:

; 837  : 	expr = exprbuf->data;

	mov	ecx, DWORD PTR _exprbuf$[ebp]
	add	ecx, 8
	mov	DWORD PTR _expr$[ebp], ecx

; 838  : 	DYNTAB_FIELD_TAB(&valtyp, vardata, VAR_SRC);

	lea	edx, DWORD PTR _valtyp$[ebp]
	push	edx
	call	_dyntab_free
	add	esp, 4
	push	0
	push	-1
	push	OFFSET FLAT:$SG71499
	mov	eax, DWORD PTR _vardata$[ebp]
	push	eax
	push	0
	lea	ecx, DWORD PTR _valtyp$[ebp]
	push	ecx
	call	_dyntab_filter_field
	add	esp, 24					; 00000018H
	test	eax, eax
	jne	SHORT $L71498
	lea	edx, DWORD PTR _valtyp$[ebp]
	push	edx
	call	_dyntab_order_lines
	add	esp, 4
	test	eax, eax
	je	SHORT $L71497
$L71498:
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29872], OFFSET FLAT:$SG71501
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 838		; 00000346H
	jmp	$eva_err$71495
$L71497:

; 839  : 	DYNTAB_FIELD_TAB(&valexpr, vardata, TEMP_TABLE_EXPR);

	lea	edx, DWORD PTR _valexpr$[ebp]
	push	edx
	call	_dyntab_free
	add	esp, 4
	push	0
	push	-1
	push	OFFSET FLAT:$SG71505
	mov	eax, DWORD PTR _vardata$[ebp]
	push	eax
	push	0
	lea	ecx, DWORD PTR _valexpr$[ebp]
	push	ecx
	call	_dyntab_filter_field
	add	esp, 24					; 00000018H
	test	eax, eax
	jne	SHORT $L71504
	lea	edx, DWORD PTR _valexpr$[ebp]
	push	edx
	call	_dyntab_order_lines
	add	esp, 4
	test	eax, eax
	je	SHORT $L71503
$L71504:
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29872], OFFSET FLAT:$SG71507
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 839		; 00000347H
	jmp	$eva_err$71495
$L71503:

; 840  : 	DYNTAB_FIELD_TAB(&valrel, vardata, TEMP_TABLE_RELEXPR);

	lea	edx, DWORD PTR _valrel$[ebp]
	push	edx
	call	_dyntab_free
	add	esp, 4
	push	0
	push	-1
	push	OFFSET FLAT:$SG71511
	mov	eax, DWORD PTR _vardata$[ebp]
	push	eax
	push	0
	lea	ecx, DWORD PTR _valrel$[ebp]
	push	ecx
	call	_dyntab_filter_field
	add	esp, 24					; 00000018H
	test	eax, eax
	jne	SHORT $L71510
	lea	edx, DWORD PTR _valrel$[ebp]
	push	edx
	call	_dyntab_order_lines
	add	esp, 4
	test	eax, eax
	je	SHORT $L71509
$L71510:
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29872], OFFSET FLAT:$SG71513
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 840		; 00000348H
	jmp	$eva_err$71495
$L71509:

; 841  : 	DYNTAB_FIELD_TAB(&valfunc, vardata, TEMP_TABLE_FUNC);

	lea	edx, DWORD PTR _valfunc$[ebp]
	push	edx
	call	_dyntab_free
	add	esp, 4
	push	0
	push	-1
	push	OFFSET FLAT:$SG71517
	mov	eax, DWORD PTR _vardata$[ebp]
	push	eax
	push	0
	lea	ecx, DWORD PTR _valfunc$[ebp]
	push	ecx
	call	_dyntab_filter_field
	add	esp, 24					; 00000018H
	test	eax, eax
	jne	SHORT $L71516
	lea	edx, DWORD PTR _valfunc$[ebp]
	push	edx
	call	_dyntab_order_lines
	add	esp, 4
	test	eax, eax
	je	SHORT $L71515
$L71516:
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29872], OFFSET FLAT:$SG71519
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 841		; 00000349H
	jmp	$eva_err$71495
$L71515:

; 842  : 
; 843  : 	/* Locate expressions in brackets & prepare values tables definitions */
; 844  : 	FOR_EACH_BRACKET

	mov	edx, DWORD PTR _expr$[ebp]
	mov	DWORD PTR _next$[ebp], edx
$L71521:
	mov	eax, DWORD PTR _next$[ebp]
	movsx	ecx, BYTE PTR [eax]
	test	ecx, ecx
	je	$L71522
	push	91					; 0000005bH
	mov	edx, DWORD PTR _next$[ebp]
	push	edx
	call	_strchr
	add	esp, 8
	mov	DWORD PTR _fieldbeg$71523[ebp], eax
	cmp	DWORD PTR _fieldbeg$71523[ebp], 0
	je	SHORT $L74402
	push	93					; 0000005dH
	mov	eax, DWORD PTR _fieldbeg$71523[ebp]
	push	eax
	call	_strchr
	add	esp, 8
	mov	DWORD PTR -5796+[ebp], eax
	jmp	SHORT $L74403
$L74402:
	mov	DWORD PTR -5796+[ebp], 0
$L74403:
	mov	ecx, DWORD PTR -5796+[ebp]
	mov	DWORD PTR _fieldend$71524[ebp], ecx
	cmp	DWORD PTR _fieldbeg$71523[ebp], 0
	je	SHORT $L71527
	cmp	DWORD PTR _fieldend$71524[ebp], 0
	jne	SHORT $L71526
$L71527:
	jmp	$L71522
$L71526:

; 846  : 		char *field = fieldbeg + 1;

	mov	edx, DWORD PTR _fieldbeg$71523[ebp]
	add	edx, 1
	mov	DWORD PTR _field$71528[ebp], edx

; 847  : 		size_t szfield = fieldend - fieldbeg  -1, szmodif = 0;

	mov	eax, DWORD PTR _fieldend$71524[ebp]
	sub	eax, DWORD PTR _fieldbeg$71523[ebp]
	sub	eax, 1
	mov	DWORD PTR _szfield$71529[ebp], eax
	mov	DWORD PTR _szmodif$71530[ebp], 0

; 848  : 		char *paropn = strchr(field, '(');

	push	40					; 00000028H
	mov	ecx, DWORD PTR _field$71528[ebp]
	push	ecx
	call	_strchr
	add	esp, 8
	mov	DWORD PTR _paropn$71531[ebp], eax

; 849  : 		int b_groupfn = (size_t)(paropn - field) < szfield;

	mov	edx, DWORD PTR _paropn$71531[ebp]
	sub	edx, DWORD PTR _field$71528[ebp]
	cmp	edx, DWORD PTR _szfield$71529[ebp]
	sbb	eax, eax
	neg	eax
	mov	DWORD PTR _b_groupfn$71532[ebp], eax

; 850  : 		char *modif = field + szfield;

	mov	ecx, DWORD PTR _field$71528[ebp]
	add	ecx, DWORD PTR _szfield$71529[ebp]
	mov	DWORD PTR _modif$71534[ebp], ecx

; 851  : 		unsigned long irow, icol = 0, ibase = 0;

	mov	DWORD PTR _icol$71536[ebp], 0
	mov	DWORD PTR _ibase$71537[ebp], 0

; 852  : 
; 853  : 		/* If brackets hold a variable index : build temporary table if applicable */
; 854  : 		if(fieldbeg[1] == '%')

	mov	edx, DWORD PTR _fieldbeg$71523[ebp]
	movsx	eax, BYTE PTR [edx+1]
	cmp	eax, 37					; 00000025H
	jne	$L71637

; 856  : 			unsigned long line = strtoul(fieldbeg + 2, NULL, 10) - 1;

	push	10					; 0000000aH
	push	0
	mov	ecx, DWORD PTR _fieldbeg$71523[ebp]
	add	ecx, 2
	push	ecx
	call	_strtoul
	add	esp, 12					; 0000000cH
	sub	eax, 1
	mov	DWORD PTR _line$71539[ebp], eax

; 857  : 			if(!dyntab_sz(&valtyp, line, 1))

	push	1
	mov	edx, DWORD PTR _line$71539[ebp]
	push	edx
	lea	eax, DWORD PTR _valtyp$[ebp]
	push	eax
	call	_dyntab_sz
	add	esp, 12					; 0000000cH
	test	eax, eax
	jne	$L71637

; 859  : 				char tbl[16];
; 860  : 				char *vexpr = dyntab_val(&valexpr, line, 0);

	push	0
	mov	ecx, DWORD PTR _line$71539[ebp]
	push	ecx
	lea	edx, DWORD PTR _valexpr$[ebp]
	push	edx
	call	_dyntab_val
	add	esp, 12					; 0000000cH
	mov	DWORD PTR _vexpr$71543[ebp], eax

; 861  : 				char *func = dyntab_val(&valfunc, line, 0);

	push	0
	mov	eax, DWORD PTR _line$71539[ebp]
	push	eax
	lea	ecx, DWORD PTR _valfunc$[ebp]
	push	ecx
	call	_dyntab_val
	add	esp, 12					; 0000000cH
	mov	DWORD PTR _func$71544[ebp], eax

; 862  : 				DynTableCell *rel = dyntab_cell(&valrel, line, 0);

	push	0
	mov	edx, DWORD PTR _line$71539[ebp]
	push	edx
	lea	eax, DWORD PTR _valrel$[ebp]
	push	eax
	call	_dyntab_cell
	add	esp, 12					; 0000000cH
	mov	DWORD PTR _rel$71545[ebp], eax

; 863  : 				if(*vexpr)

	mov	ecx, DWORD PTR _vexpr$71543[ebp]
	movsx	edx, BYTE PTR [ecx]
	test	edx, edx
	je	$L71637

; 865  : 					/* Set temp table name */
; 866  : 					DYNTAB_ADD(&valtyp, line, 1, tbl, sprintf(tbl, "P%lu", line), NO_CONV);

	push	0
	push	0
	mov	eax, DWORD PTR _line$71539[ebp]
	push	eax
	push	OFFSET FLAT:$SG71549
	lea	ecx, DWORD PTR _tbl$71542[ebp]
	push	ecx
	call	_sprintf
	add	esp, 12					; 0000000cH
	push	eax
	lea	edx, DWORD PTR _tbl$71542[ebp]
	push	edx
	push	1
	mov	eax, DWORD PTR _line$71539[ebp]
	push	eax
	lea	ecx, DWORD PTR _valtyp$[ebp]
	push	ecx
	call	_dyntab_add
	add	esp, 28					; 0000001cH
	test	eax, eax
	je	SHORT $L71548
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29872], OFFSET FLAT:$SG71551
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 866		; 00000362H
	jmp	$eva_err$71495
$L71548:

; 867  : 
; 868  : 					/* Evaluate	source relation if applicable */
; 869  : 					if(rel && !rel->len) rel = NULL;

	cmp	DWORD PTR _rel$71545[ebp], 0
	je	SHORT $L71552
	mov	ecx, DWORD PTR _rel$71545[ebp]
	cmp	DWORD PTR [ecx+4], 0
	jne	SHORT $L71552
	mov	DWORD PTR _rel$71545[ebp], 0
$L71552:

; 870  : 					if(rel)

	cmp	DWORD PTR _rel$71545[ebp], 0
	je	$L71573

; 872  : 						/* Evaluate source expression */
; 873  : 						QryBuilNode *lastnode;
; 874  : 						qry_build_free(&flt);

	lea	edx, DWORD PTR _flt$[ebp]
	push	edx
	call	_qry_build_free
	add	esp, 4

; 875  : 						if(qry_parse_fieldexpr_nodes(cntxt, rel->txt, rel->len, &flt)) STACK_ERROR;

	lea	eax, DWORD PTR _flt$[ebp]
	push	eax
	mov	ecx, DWORD PTR _rel$71545[ebp]
	mov	edx, DWORD PTR [ecx+4]
	push	edx
	mov	eax, DWORD PTR _rel$71545[ebp]
	mov	ecx, DWORD PTR [eax]
	push	ecx
	mov	edx, DWORD PTR _cntxt$[ebp]
	push	edx
	call	_qry_parse_fieldexpr_nodes
	add	esp, 16					; 00000010H
	test	eax, eax
	je	SHORT $L71556
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 875		; 0000036bH
	jmp	$eva_err$71495
$L71556:

; 876  : 						lastnode = flt.node + (flt.nbnode ? flt.nbnode - 1 : 0);

	cmp	DWORD PTR _flt$[ebp+4424], 0
	je	SHORT $L74404
	mov	ecx, DWORD PTR _flt$[ebp+4424]
	sub	ecx, 1
	mov	DWORD PTR -5800+[ebp], ecx
	jmp	SHORT $L74405
$L74404:
	mov	DWORD PTR -5800+[ebp], 0
$L74405:
	mov	edx, DWORD PTR -5800+[ebp]
	imul	edx, 136				; 00000088H
	lea	eax, DWORD PTR _flt$[ebp+edx+72]
	mov	DWORD PTR _lastnode$71555[ebp], eax

; 877  : 						if(!lastnode->modif && !lastnode->rel) lastnode->modif =

	mov	ecx, DWORD PTR _lastnode$71555[ebp]
	cmp	DWORD PTR [ecx+20], 0
	jne	SHORT $L71557
	mov	edx, DWORD PTR _lastnode$71555[ebp]
	cmp	DWORD PTR [edx+52], 0
	jne	SHORT $L71557

; 878  : 							(flt.nbnode <= 1 || (lastnode-1)->rel == RelDirect) ? F_RelObj : F_Obj;

	cmp	DWORD PTR _flt$[ebp+4424], 1
	jbe	SHORT $L74406
	mov	eax, DWORD PTR _lastnode$71555[ebp]
	cmp	DWORD PTR [eax-84], 1
	je	SHORT $L74406
	mov	DWORD PTR -5804+[ebp], 2
	jmp	SHORT $L74407
$L74406:
	mov	DWORD PTR -5804+[ebp], 7
$L74407:
	mov	ecx, DWORD PTR _lastnode$71555[ebp]
	mov	edx, DWORD PTR -5804+[ebp]
	mov	DWORD PTR [ecx+20], edx
$L71557:

; 879  : 
; 880  : 						/* Build table of relations TV1 */
; 881  : 						M_FREE(sql);

	mov	eax, DWORD PTR _sql$[ebp]
	push	eax
	call	_mem_free
	add	esp, 4
	mov	DWORD PTR _sql$[ebp], 0

; 883  : 											  "\nCREATE TEMPORARY TABLE TV1 TYPE=HEAP\n");

	push	38					; 00000026H
	push	OFFSET FLAT:$SG71559
	mov	ecx, DWORD PTR _line$71539[ebp]
	add	ecx, 1
	push	ecx
	push	57					; 00000039H
	push	OFFSET FLAT:$SG71560
	lea	edx, DWORD PTR _sql$[ebp]
	push	edx
	call	_dynbuf_add3_int
	add	esp, 24					; 00000018H
	test	eax, eax
	je	SHORT $L71558
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29872], OFFSET FLAT:$SG71562
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 883		; 00000373H
	jmp	$eva_err$71495
$L71558:

; 884  : 						if(qry_build_clauses(cntxt, &flt, 0)) STACK_ERROR;

	push	0
	lea	edx, DWORD PTR _flt$[ebp]
	push	edx
	mov	eax, DWORD PTR _cntxt$[ebp]
	push	eax
	call	_qry_build_clauses
	add	esp, 12					; 0000000cH
	test	eax, eax
	je	SHORT $L71563
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 884		; 00000374H
	jmp	$eva_err$71495
$L71563:

; 885  : 						if(qry_build_flt_select(cntxt, &sql, &empty, &flt, 0, 0)) STACK_ERROR;

	push	0
	push	0
	lea	edx, DWORD PTR _flt$[ebp]
	push	edx
	lea	eax, DWORD PTR _empty$[ebp]
	push	eax
	lea	ecx, DWORD PTR _sql$[ebp]
	push	ecx
	mov	edx, DWORD PTR _cntxt$[ebp]
	push	edx
	call	_qry_build_flt_select
	add	esp, 24					; 00000018H
	test	eax, eax
	je	SHORT $L71564
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 885		; 00000375H
	jmp	$eva_err$71495
$L71564:

; 886  : 						DYNBUF_ADD_STR(&sql, "ORDER BY IdObj,Val");

	push	0
	push	0
	push	18					; 00000012H
	push	OFFSET FLAT:$SG71567
	lea	ecx, DWORD PTR _sql$[ebp]
	push	ecx
	call	_dynbuf_add
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L71566
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29872], OFFSET FLAT:$SG71569
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 886		; 00000376H
	jmp	$eva_err$71495
$L71566:

; 887  : 						if(sql_exec_query(cntxt, sql->data)) STACK_ERROR;

	mov	ecx, DWORD PTR _sql$[ebp]
	add	ecx, 8
	push	ecx
	mov	edx, DWORD PTR _cntxt$[ebp]
	push	edx
	call	_sql_exec_query
	add	esp, 8
	test	eax, eax
	je	SHORT $L71570
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 887		; 00000377H
	jmp	$eva_err$71495
$L71570:

; 888  : 						if(sql_exec_query(cntxt, "ALTER TABLE TV1 ADD INDEX (Val)")) STACK_ERROR;

	push	OFFSET FLAT:$SG71572
	mov	ecx, DWORD PTR _cntxt$[ebp]
	push	ecx
	call	_sql_exec_query
	add	esp, 8
	test	eax, eax
	je	SHORT $L71571
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 888		; 00000378H
	jmp	$eva_err$71495
$L71571:

; 889  : 
; 890  : 						/* Build list of distinct related objects */
; 891  : 						if(sql_exec_query(cntxt,
; 892  : 							"-- qry_build_sqlexpr - Build list of distinct related objects\n"
; 893  : 							"CREATE TEMPORARY TABLE TV0 TYPE=HEAP\n"
; 894  : 							"SELECT DISTINCT Val AS IdObj FROM TV1")) STACK_ERROR;

	push	OFFSET FLAT:$SG71574
	mov	eax, DWORD PTR _cntxt$[ebp]
	push	eax
	call	_sql_exec_query
	add	esp, 8
	test	eax, eax
	je	SHORT $L71573
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 894		; 0000037eH
	jmp	$eva_err$71495
$L71573:

; 896  : 
; 897  : 					/* Evaluate expression */
; 898  : 					if(qry_eval_sql_fieldexpr(cntxt, rel || func ? "TV2" : tbl,
; 899  : 											vexpr, rel ? "TV0" : srctbl, vardata)) STACK_ERROR;

	cmp	DWORD PTR _rel$71545[ebp], 0
	je	SHORT $L74408
	mov	DWORD PTR -5808+[ebp], OFFSET FLAT:$SG71576
	jmp	SHORT $L74409
$L74408:
	mov	edx, DWORD PTR _srctbl$[ebp]
	mov	DWORD PTR -5808+[ebp], edx
$L74409:
	cmp	DWORD PTR _rel$71545[ebp], 0
	jne	SHORT $L74410
	cmp	DWORD PTR _func$71544[ebp], 0
	jne	SHORT $L74410
	lea	eax, DWORD PTR _tbl$71542[ebp]
	mov	DWORD PTR -5812+[ebp], eax
	jmp	SHORT $L74411
$L74410:
	mov	DWORD PTR -5812+[ebp], OFFSET FLAT:$SG71577
$L74411:
	mov	ecx, DWORD PTR _vardata$[ebp]
	push	ecx
	mov	edx, DWORD PTR -5808+[ebp]
	push	edx
	mov	eax, DWORD PTR _vexpr$71543[ebp]
	push	eax
	mov	ecx, DWORD PTR -5812+[ebp]
	push	ecx
	mov	edx, DWORD PTR _cntxt$[ebp]
	push	edx
	call	_qry_eval_sql_fieldexpr
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L71575
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 899		; 00000383H
	jmp	$eva_err$71495
$L71575:

; 900  : 
; 901  : 					/* Build final values table if relation */
; 902  : 					if(rel)

	cmp	DWORD PTR _rel$71545[ebp], 0
	je	$L71578

; 904  : 						M_FREE(sql);

	mov	ecx, DWORD PTR _sql$[ebp]
	push	ecx
	call	_mem_free
	add	esp, 4
	mov	DWORD PTR _sql$[ebp], 0

; 906  : 							"-- qry_build_sqlexpr - Build related values table for var %", line + 1, "\n");

	push	1
	push	OFFSET FLAT:$SG71580
	mov	edx, DWORD PTR _line$71539[ebp]
	add	edx, 1
	push	edx
	push	59					; 0000003bH
	push	OFFSET FLAT:$SG71581
	lea	eax, DWORD PTR _sql$[ebp]
	push	eax
	call	_dynbuf_add3_int
	add	esp, 24					; 00000018H
	test	eax, eax
	je	SHORT $L71579
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29872], OFFSET FLAT:$SG71583
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 906		; 0000038aH
	jmp	$eva_err$71495
$L71579:

; 908  : 							"CREATE TEMPORARY TABLE ", tbl, 0, NO_CONV, "\n");

	push	1
	push	OFFSET FLAT:$SG71586
	push	0
	push	0
	push	0
	lea	eax, DWORD PTR _tbl$71542[ebp]
	push	eax
	push	23					; 00000017H
	push	OFFSET FLAT:$SG71587
	lea	ecx, DWORD PTR _sql$[ebp]
	push	ecx
	call	_dynbuf_add3
	add	esp, 36					; 00000024H
	test	eax, eax
	je	SHORT $L71585
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29872], OFFSET FLAT:$SG71589
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 908		; 0000038cH
	jmp	$eva_err$71495
$L71585:

; 909  : 						if(func)

	cmp	DWORD PTR _func$71544[ebp], 0
	je	SHORT $L71590

; 911  : 								"SELECT TV1.IdObj,", func, 0, NO_CONV, "(TV2.Val) AS Val,NULL AS Line\n")

	push	30					; 0000001eH
	push	OFFSET FLAT:$SG71593
	push	0
	push	0
	push	0
	mov	ecx, DWORD PTR _func$71544[ebp]
	push	ecx
	push	17					; 00000011H
	push	OFFSET FLAT:$SG71594
	lea	edx, DWORD PTR _sql$[ebp]
	push	edx
	call	_dynbuf_add3
	add	esp, 36					; 00000024H
	test	eax, eax
	je	SHORT $L71592
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29872], OFFSET FLAT:$SG71596
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 911		; 0000038fH
	jmp	$eva_err$71495
$L71592:

; 912  : 						else

	jmp	SHORT $L71599
$L71590:

; 914  : 								"SELECT DISTINCT TV1.IdObj,TV2.Val,TV2.Line\n");

	push	0
	push	0
	push	43					; 0000002bH
	push	OFFSET FLAT:$SG71600
	lea	edx, DWORD PTR _sql$[ebp]
	push	edx
	call	_dynbuf_add
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L71599
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29872], OFFSET FLAT:$SG71602
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 914		; 00000392H
	jmp	$eva_err$71495
$L71599:

; 916  : 								"FROM TV1 INNER JOIN TV2 ON TV1.Val=TV2.IdObj\n");

	push	0
	push	0
	push	45					; 0000002dH
	push	OFFSET FLAT:$SG71605
	lea	edx, DWORD PTR _sql$[ebp]
	push	edx
	call	_dynbuf_add
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L71604
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29872], OFFSET FLAT:$SG71607
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 916		; 00000394H
	jmp	$eva_err$71495
$L71604:

; 917  : 						if(func)

	cmp	DWORD PTR _func$71544[ebp], 0
	je	SHORT $L71610

; 918  : 							DYNBUF_ADD_STR(&sql, "GROUP BY TV1.IdObj");

	push	0
	push	0
	push	18					; 00000012H
	push	OFFSET FLAT:$SG71611
	lea	edx, DWORD PTR _sql$[ebp]
	push	edx
	call	_dynbuf_add
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L71610
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29872], OFFSET FLAT:$SG71613
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 918		; 00000396H
	jmp	$eva_err$71495
$L71610:

; 919  : 
; 920  : 						if(sql_exec_query(cntxt, sql->data)) STACK_ERROR;

	mov	edx, DWORD PTR _sql$[ebp]
	add	edx, 8
	push	edx
	mov	eax, DWORD PTR _cntxt$[ebp]
	push	eax
	call	_sql_exec_query
	add	esp, 8
	test	eax, eax
	je	SHORT $L71614
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 920		; 00000398H
	jmp	$eva_err$71495
$L71614:

; 921  : 						drop_tmptables(cntxt, "TV", 3);

	push	3
	push	OFFSET FLAT:$SG71615
	mov	edx, DWORD PTR _cntxt$[ebp]
	push	edx
	call	_drop_tmptables
	add	esp, 12					; 0000000cH

; 923  : 					else if(func)

	jmp	$L71617
$L71578:
	cmp	DWORD PTR _func$71544[ebp], 0
	je	$L71617

; 925  : 						M_FREE(sql);

	mov	eax, DWORD PTR _sql$[ebp]
	push	eax
	call	_mem_free
	add	esp, 4
	mov	DWORD PTR _sql$[ebp], 0

; 927  : 							"-- qry_build_sqlexpr - Build grouped values table for var %", line + 1, "\n");

	push	1
	push	OFFSET FLAT:$SG71619
	mov	ecx, DWORD PTR _line$71539[ebp]
	add	ecx, 1
	push	ecx
	push	59					; 0000003bH
	push	OFFSET FLAT:$SG71620
	lea	edx, DWORD PTR _sql$[ebp]
	push	edx
	call	_dynbuf_add3_int
	add	esp, 24					; 00000018H
	test	eax, eax
	je	SHORT $L71618
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29872], OFFSET FLAT:$SG71622
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 927		; 0000039fH
	jmp	$eva_err$71495
$L71618:

; 929  : 							"CREATE TEMPORARY TABLE ", tbl, 0, NO_CONV, "\n");

	push	1
	push	OFFSET FLAT:$SG71625
	push	0
	push	0
	push	0
	lea	edx, DWORD PTR _tbl$71542[ebp]
	push	edx
	push	23					; 00000017H
	push	OFFSET FLAT:$SG71626
	lea	eax, DWORD PTR _sql$[ebp]
	push	eax
	call	_dynbuf_add3
	add	esp, 36					; 00000024H
	test	eax, eax
	je	SHORT $L71624
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29872], OFFSET FLAT:$SG71628
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 929		; 000003a1H
	jmp	$eva_err$71495
$L71624:

; 931  : 							"SELECT IdObj,", func, 0, NO_CONV, "(Val) AS Val,NULL AS Line\n"
; 932  : 							"FROM TV2 GROUP BY IdObj");

	push	49					; 00000031H
	push	OFFSET FLAT:$SG71631
	push	0
	push	0
	push	0
	mov	eax, DWORD PTR _func$71544[ebp]
	push	eax
	push	13					; 0000000dH
	push	OFFSET FLAT:$SG71632
	lea	ecx, DWORD PTR _sql$[ebp]
	push	ecx
	call	_dynbuf_add3
	add	esp, 36					; 00000024H
	test	eax, eax
	je	SHORT $L71630
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29872], OFFSET FLAT:$SG71634
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 932		; 000003a4H
	jmp	$eva_err$71495
$L71630:

; 933  : 						if(sql_exec_query(cntxt, sql->data)) STACK_ERROR;

	mov	ecx, DWORD PTR _sql$[ebp]
	add	ecx, 8
	push	ecx
	mov	edx, DWORD PTR _cntxt$[ebp]
	push	edx
	call	_sql_exec_query
	add	esp, 8
	test	eax, eax
	je	SHORT $L71635
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 933		; 000003a5H
	jmp	$eva_err$71495
$L71635:

; 934  : 						sql_drop_table(cntxt, "TV2");

	push	OFFSET FLAT:$SG71636
	mov	ecx, DWORD PTR _cntxt$[ebp]
	push	ecx
	call	_sql_drop_table
	add	esp, 8
$L71617:

; 936  : 					if(cntxt->sql_trace) put_debug_sqltable(cntxt, tbl);

	mov	edx, DWORD PTR _cntxt$[ebp]
	cmp	DWORD PTR [edx+29852], 0
	je	SHORT $L71637
	lea	eax, DWORD PTR _tbl$71542[ebp]
	push	eax
	mov	ecx, DWORD PTR _cntxt$[ebp]
	push	ecx
	call	_put_debug_sqltable
	add	esp, 8
$L71637:

; 940  : 
; 941  : 		/* Locate last modifier in field if present */
; 942  : 		if(!b_groupfn)

	cmp	DWORD PTR _b_groupfn$71532[ebp], 0
	jne	$L71645
$L71640:

; 944  : 			while(modif >= field && !strchr(".<->()", *modif)) modif--;

	mov	edx, DWORD PTR _modif$71534[ebp]
	cmp	edx, DWORD PTR _field$71528[ebp]
	jb	SHORT $L71641
	mov	eax, DWORD PTR _modif$71534[ebp]
	movsx	ecx, BYTE PTR [eax]
	push	ecx
	push	OFFSET FLAT:$SG71642
	call	_strchr
	add	esp, 8
	test	eax, eax
	jne	SHORT $L71641
	mov	edx, DWORD PTR _modif$71534[ebp]
	sub	edx, 1
	mov	DWORD PTR _modif$71534[ebp], edx
	jmp	SHORT $L71640
$L71641:

; 945  : 			if(modif < field || *modif != '.') modif = field + szfield;

	mov	eax, DWORD PTR _modif$71534[ebp]
	cmp	eax, DWORD PTR _field$71528[ebp]
	jb	SHORT $L71644
	mov	ecx, DWORD PTR _modif$71534[ebp]
	movsx	edx, BYTE PTR [ecx]
	cmp	edx, 46					; 0000002eH
	je	SHORT $L71643
$L71644:
	mov	eax, DWORD PTR _field$71528[ebp]
	add	eax, DWORD PTR _szfield$71529[ebp]
	mov	DWORD PTR _modif$71534[ebp], eax

; 946  : 			else szmodif = szfield - (modif - field);

	jmp	SHORT $L71645
$L71643:
	mov	ecx, DWORD PTR _modif$71534[ebp]
	sub	ecx, DWORD PTR _field$71528[ebp]
	mov	edx, DWORD PTR _szfield$71529[ebp]
	sub	edx, ecx
	mov	DWORD PTR _szmodif$71530[ebp], edx
$L71645:

; 948  : 
; 949  : 		/* Search for same field in tables */
; 950  : 		for(irow = 0; irow < tables.nbrows; irow++)

	mov	DWORD PTR _irow$71535[ebp], 0
	jmp	SHORT $L71646
$L71647:
	mov	eax, DWORD PTR _irow$71535[ebp]
	add	eax, 1
	mov	DWORD PTR _irow$71535[ebp], eax
$L71646:
	mov	ecx, DWORD PTR _irow$71535[ebp]
	cmp	ecx, DWORD PTR _tables$[ebp]
	jae	$L71648

; 952  : 			fld = dyntab_cell(&tables, irow, 0);

	push	0
	mov	edx, DWORD PTR _irow$71535[ebp]
	push	edx
	lea	eax, DWORD PTR _tables$[ebp]
	push	eax
	call	_dyntab_cell
	add	esp, 12					; 0000000cH
	mov	DWORD PTR _fld$[ebp], eax

; 953  : 			if((size_t)(modif - field) == fld->len && (!fld->len ||
; 954  : 				!strncmp(modif == field ? "" : field, fld->len ? fld->txt : "", fld->len))) break;

	mov	ecx, DWORD PTR _modif$71534[ebp]
	sub	ecx, DWORD PTR _field$71528[ebp]
	mov	edx, DWORD PTR _fld$[ebp]
	cmp	ecx, DWORD PTR [edx+4]
	jne	SHORT $L71650
	mov	eax, DWORD PTR _fld$[ebp]
	cmp	DWORD PTR [eax+4], 0
	je	SHORT $L71651
	mov	ecx, DWORD PTR _fld$[ebp]
	cmp	DWORD PTR [ecx+4], 0
	je	SHORT $L74412
	mov	edx, DWORD PTR _fld$[ebp]
	mov	eax, DWORD PTR [edx]
	mov	DWORD PTR -5816+[ebp], eax
	jmp	SHORT $L74413
$L74412:
	mov	DWORD PTR -5816+[ebp], OFFSET FLAT:$SG71652
$L74413:
	mov	ecx, DWORD PTR _modif$71534[ebp]
	cmp	ecx, DWORD PTR _field$71528[ebp]
	jne	SHORT $L74414
	mov	DWORD PTR -5820+[ebp], OFFSET FLAT:$SG71653
	jmp	SHORT $L74415
$L74414:
	mov	edx, DWORD PTR _field$71528[ebp]
	mov	DWORD PTR -5820+[ebp], edx
$L74415:
	mov	eax, DWORD PTR _fld$[ebp]
	mov	ecx, DWORD PTR [eax+4]
	push	ecx
	mov	edx, DWORD PTR -5816+[ebp]
	push	edx
	mov	eax, DWORD PTR -5820+[ebp]
	push	eax
	call	_strncmp
	add	esp, 12					; 0000000cH
	test	eax, eax
	jne	SHORT $L71650
$L71651:
	jmp	SHORT $L71648
$L71650:

; 955  : 		}

	jmp	$L71647
$L71648:

; 956  : 
; 957  : 		/* Add required values if applicable */
; 958  : 		if(!b_groupfn && irow == tables.nbrows)

	cmp	DWORD PTR _b_groupfn$71532[ebp], 0
	jne	$L71655
	mov	ecx, DWORD PTR _irow$71535[ebp]
	cmp	ecx, DWORD PTR _tables$[ebp]
	jne	$L71655

; 960  : 			if(b_line)

	cmp	DWORD PTR _b_line$[ebp], 0
	je	$L71655

; 962  : 				DYNTAB_ADD_CELLP(&tables, irow, 0, NULL);

	push	1
	push	0
	push	0
	mov	edx, DWORD PTR _irow$71535[ebp]
	push	edx
	lea	eax, DWORD PTR _tables$[ebp]
	push	eax
	call	_dyntab_copy
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L71657
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29872], OFFSET FLAT:$SG71659
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 962		; 000003c2H
	jmp	$eva_err$71495
$L71657:

; 963  : 				fld = dyntab_cell(&tables, irow, 0);

	push	0
	mov	eax, DWORD PTR _irow$71535[ebp]
	push	eax
	lea	ecx, DWORD PTR _tables$[ebp]
	push	ecx
	call	_dyntab_cell
	add	esp, 12					; 0000000cH
	mov	DWORD PTR _fld$[ebp], eax

; 964  : 				fld->len = modif - field;

	mov	edx, DWORD PTR _modif$71534[ebp]
	sub	edx, DWORD PTR _field$71528[ebp]
	mov	eax, DWORD PTR _fld$[ebp]
	mov	DWORD PTR [eax+4], edx

; 965  : 				if(modif > field) M_STRDUP(fld->txt, field, modif - field);

	mov	ecx, DWORD PTR _modif$71534[ebp]
	cmp	ecx, DWORD PTR _field$71528[ebp]
	jbe	$L71668
	mov	edx, DWORD PTR _modif$71534[ebp]
	sub	edx, DWORD PTR _field$71528[ebp]
	mov	DWORD PTR _size$71661[ebp], edx
	mov	eax, DWORD PTR _field$71528[ebp]
	mov	DWORD PTR _src$71662[ebp], eax
	mov	ecx, DWORD PTR _size$71661[ebp]
	add	ecx, 1
	mov	DWORD PTR _size1$71663[ebp], ecx
	mov	edx, DWORD PTR _size1$71663[ebp]
	push	edx
	call	_mem_alloc
	add	esp, 4
	mov	ecx, DWORD PTR _fld$[ebp]
	mov	DWORD PTR [ecx], eax
	cmp	DWORD PTR _size1$71663[ebp], 0
	je	SHORT $L71664
	mov	edx, DWORD PTR _fld$[ebp]
	cmp	DWORD PTR [edx], 0
	jne	SHORT $L71664
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29872], OFFSET FLAT:$SG71666
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 965		; 000003c5H
	jmp	$eva_err$71495
$L71664:
	cmp	DWORD PTR _src$71662[ebp], 0
	je	SHORT $L71668
	cmp	DWORD PTR _size$71661[ebp], 0
	je	SHORT $L71668
	mov	edx, DWORD PTR _size$71661[ebp]
	push	edx
	mov	eax, DWORD PTR _src$71662[ebp]
	push	eax
	mov	ecx, DWORD PTR _fld$[ebp]
	mov	edx, DWORD PTR [ecx]
	push	edx
	call	_memcpy
	add	esp, 12					; 0000000cH
$L71668:

; 966  : 				fld->b_dontfreetxt = 1;

	mov	eax, DWORD PTR _fld$[ebp]
	mov	BYTE PTR [eax+14], 1

; 967  : 				fld->field = "Line";

	mov	ecx, DWORD PTR _fld$[ebp]
	mov	DWORD PTR [ecx+8], OFFSET FLAT:$SG71669

; 968  : 				fld->b_dontfreefield = 1;

	mov	edx, DWORD PTR _fld$[ebp]
	mov	BYTE PTR [edx+15], 1
$L71655:

; 971  : 
; 972  : 		/* Look for first available column position */
; 973  : 		if(irow < tables.nbrows)

	mov	eax, DWORD PTR _irow$71535[ebp]
	cmp	eax, DWORD PTR _tables$[ebp]
	jae	$L71673

; 974  : 			for(icol = 0; icol < tables.nbcols && dyntab_cell(&tables, irow, icol)->txt; icol++)

	mov	DWORD PTR _icol$71536[ebp], 0
	jmp	SHORT $L71671
$L71672:
	mov	ecx, DWORD PTR _icol$71536[ebp]
	add	ecx, 1
	mov	DWORD PTR _icol$71536[ebp], ecx
$L71671:
	mov	edx, DWORD PTR _icol$71536[ebp]
	cmp	edx, DWORD PTR _tables$[ebp+8]
	jae	$L71673
	mov	eax, DWORD PTR _icol$71536[ebp]
	push	eax
	mov	ecx, DWORD PTR _irow$71535[ebp]
	push	ecx
	lea	edx, DWORD PTR _tables$[ebp]
	push	edx
	call	_dyntab_cell
	add	esp, 12					; 0000000cH
	cmp	DWORD PTR [eax], 0
	je	$L71673

; 976  : 				char *m = dyntab_cell(&tables, irow, icol)->field;

	mov	eax, DWORD PTR _icol$71536[ebp]
	push	eax
	mov	ecx, DWORD PTR _irow$71535[ebp]
	push	ecx
	lea	edx, DWORD PTR _tables$[ebp]
	push	edx
	call	_dyntab_cell
	add	esp, 12					; 0000000cH
	mov	eax, DWORD PTR [eax+8]
	mov	DWORD PTR _m$71674[ebp], eax

; 977  : 
; 978  : 				/* Memorize first other bracket with same modifier */
; 979  : 				if(!ibase && (b_groupfn || (szmodif ? m && !strncmp(modif + 1, m, szmodif - 1) : !m)))

	cmp	DWORD PTR _ibase$71537[ebp], 0
	jne	$L71675
	cmp	DWORD PTR _b_groupfn$71532[ebp], 0
	jne	SHORT $L71676
	cmp	DWORD PTR _szmodif$71530[ebp], 0
	je	SHORT $L74418
	cmp	DWORD PTR _m$71674[ebp], 0
	je	SHORT $L74416
	mov	ecx, DWORD PTR _szmodif$71530[ebp]
	sub	ecx, 1
	push	ecx
	mov	edx, DWORD PTR _m$71674[ebp]
	push	edx
	mov	eax, DWORD PTR _modif$71534[ebp]
	add	eax, 1
	push	eax
	call	_strncmp
	add	esp, 12					; 0000000cH
	test	eax, eax
	jne	SHORT $L74416
	mov	DWORD PTR -5824+[ebp], 1
	jmp	SHORT $L74417
$L74416:
	mov	DWORD PTR -5824+[ebp], 0
$L74417:
	mov	ecx, DWORD PTR -5824+[ebp]
	mov	DWORD PTR -5828+[ebp], ecx
	jmp	SHORT $L74419
$L74418:
	xor	edx, edx
	cmp	DWORD PTR _m$71674[ebp], 0
	sete	dl
	mov	DWORD PTR -5828+[ebp], edx
$L74419:
	cmp	DWORD PTR -5828+[ebp], 0
	je	SHORT $L71675
$L71676:

; 980  : 					ibase = icol + 1;

	mov	eax, DWORD PTR _icol$71536[ebp]
	add	eax, 1
	mov	DWORD PTR _ibase$71537[ebp], eax
$L71675:

; 981  : 			}

	jmp	$L71672
$L71673:

; 982  : 
; 983  : 		/* Store field expression in first available position */
; 984  : 		DYNTAB_ADD_CELLP(&tables, irow, icol, NULL);

	push	1
	push	0
	mov	ecx, DWORD PTR _icol$71536[ebp]
	push	ecx
	mov	edx, DWORD PTR _irow$71535[ebp]
	push	edx
	lea	eax, DWORD PTR _tables$[ebp]
	push	eax
	call	_dyntab_copy
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L71678
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29872], OFFSET FLAT:$SG71680
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 984		; 000003d8H
	jmp	$eva_err$71495
$L71678:

; 985  : 		fld = dyntab_cell(&tables, irow, icol);

	mov	eax, DWORD PTR _icol$71536[ebp]
	push	eax
	mov	ecx, DWORD PTR _irow$71535[ebp]
	push	ecx
	lea	edx, DWORD PTR _tables$[ebp]
	push	edx
	call	_dyntab_cell
	add	esp, 12					; 0000000cH
	mov	DWORD PTR _fld$[ebp], eax

; 986  : 		fld->len = modif - field;

	mov	eax, DWORD PTR _modif$71534[ebp]
	sub	eax, DWORD PTR _field$71528[ebp]
	mov	ecx, DWORD PTR _fld$[ebp]
	mov	DWORD PTR [ecx+4], eax

; 987  : 		fld->txt = field;

	mov	edx, DWORD PTR _fld$[ebp]
	mov	eax, DWORD PTR _field$71528[ebp]
	mov	DWORD PTR [edx], eax

; 988  : 		fld->b_dontfreetxt = 1;

	mov	ecx, DWORD PTR _fld$[ebp]
	mov	BYTE PTR [ecx+14], 1

; 989  : 		if(szmodif)

	cmp	DWORD PTR _szmodif$71530[ebp], 0
	je	$L71690

; 991  : 			M_STRDUP(fld->field, modif + 1, szmodif - 1);

	mov	edx, DWORD PTR _szmodif$71530[ebp]
	sub	edx, 1
	mov	DWORD PTR _size$71682[ebp], edx
	mov	eax, DWORD PTR _modif$71534[ebp]
	add	eax, 1
	mov	DWORD PTR _src$71683[ebp], eax
	mov	ecx, DWORD PTR _size$71682[ebp]
	add	ecx, 1
	mov	DWORD PTR _size1$71684[ebp], ecx
	mov	edx, DWORD PTR _size1$71684[ebp]
	push	edx
	call	_mem_alloc
	add	esp, 4
	mov	ecx, DWORD PTR _fld$[ebp]
	mov	DWORD PTR [ecx+8], eax
	cmp	DWORD PTR _size1$71684[ebp], 0
	je	SHORT $L71685
	mov	edx, DWORD PTR _fld$[ebp]
	cmp	DWORD PTR [edx+8], 0
	jne	SHORT $L71685
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29872], OFFSET FLAT:$SG71687
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 991		; 000003dfH
	jmp	$eva_err$71495
$L71685:
	cmp	DWORD PTR _src$71683[ebp], 0
	je	SHORT $L71689
	cmp	DWORD PTR _size$71682[ebp], 0
	je	SHORT $L71689
	mov	edx, DWORD PTR _size$71682[ebp]
	push	edx
	mov	eax, DWORD PTR _src$71683[ebp]
	push	eax
	mov	ecx, DWORD PTR _fld$[ebp]
	mov	edx, DWORD PTR [ecx+8]
	push	edx
	call	_memcpy
	add	esp, 12					; 0000000cH
$L71689:

; 992  : 			/* Mark 1st column with row=1 if Del modifier used (allow deleted values in result) */
; 993  : 			if(strstr(fld->field, "Del")) dyntab_cell(&tables, irow, 0)->row = 1;

	push	OFFSET FLAT:$SG71691
	mov	eax, DWORD PTR _fld$[ebp]
	mov	ecx, DWORD PTR [eax+8]
	push	ecx
	call	_strstr
	add	esp, 8
	test	eax, eax
	je	SHORT $L71690
	push	0
	mov	edx, DWORD PTR _irow$71535[ebp]
	push	edx
	lea	eax, DWORD PTR _tables$[ebp]
	push	eax
	call	_dyntab_cell
	add	esp, 12					; 0000000cH
	mov	DWORD PTR [eax+60], 1
$L71690:

; 995  : 		fld->col = ibase;

	mov	ecx, DWORD PTR _fld$[ebp]
	mov	edx, DWORD PTR _ibase$71537[ebp]
	mov	DWORD PTR [ecx+56], edx

; 997  : 	END_EACH_BRACKET

	mov	eax, DWORD PTR _fieldend$71524[ebp]
	add	eax, 1
	mov	DWORD PTR _next$[ebp], eax
	jmp	$L71521
$L71522:

; 998  : 
; 999  : 	/* Build temporary values tables for each expression in brackets */
; 1000 : 	for(i = 0; i < tables.nbrows; i++)

	mov	DWORD PTR _i$[ebp], 0
	jmp	SHORT $L71692
$L71693:
	mov	ecx, DWORD PTR _i$[ebp]
	add	ecx, 1
	mov	DWORD PTR _i$[ebp], ecx
$L71692:
	mov	edx, DWORD PTR _i$[ebp]
	cmp	edx, DWORD PTR _tables$[ebp]
	jae	$L71694

; 1002 : 		DynTableCell *fld = dyntab_cell(&tables, i, 0);

	push	0
	mov	eax, DWORD PTR _i$[ebp]
	push	eax
	lea	ecx, DWORD PTR _tables$[ebp]
	push	ecx
	call	_dyntab_cell
	add	esp, 12					; 0000000cH
	mov	DWORD PTR _fld$71695[ebp], eax

; 1003 : 		int b_usedel = fld->row;

	mov	edx, DWORD PTR _fld$71695[ebp]
	mov	eax, DWORD PTR [edx+60]
	mov	DWORD PTR _b_usedel$71696[ebp], eax

; 1004 : 
; 1005 : 		/* Handle temporary values table from parameters */
; 1006 : 		if(fld->txt && fld->txt[0] == '%')

	mov	ecx, DWORD PTR _fld$71695[ebp]
	cmp	DWORD PTR [ecx], 0
	je	$L71697
	mov	edx, DWORD PTR _fld$71695[ebp]
	mov	eax, DWORD PTR [edx]
	movsx	ecx, BYTE PTR [eax]
	cmp	ecx, 37					; 00000025H
	jne	$L71697

; 1008 : 			unsigned long line = strtoul(fld->txt + 1, NULL, 10) - 1;

	push	10					; 0000000aH
	push	0
	mov	edx, DWORD PTR _fld$71695[ebp]
	mov	eax, DWORD PTR [edx]
	add	eax, 1
	push	eax
	call	_strtoul
	add	esp, 12					; 0000000cH
	sub	eax, 1
	mov	DWORD PTR _line$71698[ebp], eax

; 1009 : 			snprintf(add_sz_str(printbuf), "ALTER TABLE %s RENAME V%lu", dyntab_val(&valtyp, line, 1), i);

	mov	ecx, DWORD PTR _i$[ebp]
	push	ecx
	push	1
	mov	edx, DWORD PTR _line$71698[ebp]
	push	edx
	lea	eax, DWORD PTR _valtyp$[ebp]
	push	eax
	call	_dyntab_val
	add	esp, 12					; 0000000cH
	push	eax
	push	OFFSET FLAT:$SG71700
	push	1023					; 000003ffH
	lea	ecx, DWORD PTR _printbuf$[ebp]
	push	ecx
	call	__snprintf
	add	esp, 20					; 00000014H

; 1010 : 			if(sql_exec_query(cntxt, printbuf)) STACK_ERROR;

	lea	edx, DWORD PTR _printbuf$[ebp]
	push	edx
	mov	eax, DWORD PTR _cntxt$[ebp]
	push	eax
	call	_sql_exec_query
	add	esp, 8
	test	eax, eax
	je	SHORT $L71701
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 1010		; 000003f2H
	jmp	$eva_err$71495
$L71701:

; 1012 : 		else

	jmp	$L71774
$L71697:

; 1014 : 			/* Parse field expression */
; 1015 : 			M_FREE(sql);

	mov	edx, DWORD PTR _sql$[ebp]
	push	edx
	call	_mem_free
	add	esp, 4
	mov	DWORD PTR _sql$[ebp], 0

; 1016 : 			qry_build_free(&flt);

	lea	eax, DWORD PTR _flt$[ebp]
	push	eax
	call	_qry_build_free
	add	esp, 4

; 1017 : 			flt.b_recdata = 1;

	mov	DWORD PTR _flt$[ebp+4448], 1

; 1018 : 			if(b_srcobj) flt.srctable = srctbl;

	cmp	DWORD PTR _b_srcobj$[ebp], 0
	je	SHORT $L71703
	mov	ecx, DWORD PTR _srctbl$[ebp]
	mov	DWORD PTR _flt$[ebp+20], ecx
$L71703:

; 1020 : 				"-- qry_build_sqlexpr - build values table V", i, "\n");

	push	1
	push	OFFSET FLAT:$SG71705
	mov	edx, DWORD PTR _i$[ebp]
	push	edx
	push	43					; 0000002bH
	push	OFFSET FLAT:$SG71706
	lea	eax, DWORD PTR _sql$[ebp]
	push	eax
	call	_dynbuf_add3_int
	add	esp, 24					; 00000018H
	test	eax, eax
	je	SHORT $L71704
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29872], OFFSET FLAT:$SG71708
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 1020		; 000003fcH
	jmp	$eva_err$71495
$L71704:

; 1022 : 				"CREATE TEMPORARY TABLE V", i, "\n");

	push	1
	push	OFFSET FLAT:$SG71710
	mov	eax, DWORD PTR _i$[ebp]
	push	eax
	push	24					; 00000018H
	push	OFFSET FLAT:$SG71711
	lea	ecx, DWORD PTR _sql$[ebp]
	push	ecx
	call	_dynbuf_add3_int
	add	esp, 24					; 00000018H
	test	eax, eax
	je	SHORT $L71709
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29872], OFFSET FLAT:$SG71713
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 1022		; 000003feH
	jmp	$eva_err$71495
$L71709:

; 1023 : 			if(qry_parse_fieldexpr_nodes(cntxt, fld->txt, fld->len, &flt)) STACK_ERROR;

	lea	ecx, DWORD PTR _flt$[ebp]
	push	ecx
	mov	edx, DWORD PTR _fld$71695[ebp]
	mov	eax, DWORD PTR [edx+4]
	push	eax
	mov	ecx, DWORD PTR _fld$71695[ebp]
	mov	edx, DWORD PTR [ecx]
	push	edx
	mov	eax, DWORD PTR _cntxt$[ebp]
	push	eax
	call	_qry_parse_fieldexpr_nodes
	add	esp, 16					; 00000010H
	test	eax, eax
	je	SHORT $L71714
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 1023		; 000003ffH
	jmp	$eva_err$71495
$L71714:

; 1024 : 
; 1025 : 			/* Allow deleted values in result if Del modifier used */
; 1026 : 			if(b_usedel) strcpy(flt.node[flt.nbnode ? flt.nbnode - 1 : 0].datemax, cntxt->timestamp);

	cmp	DWORD PTR _b_usedel$71696[ebp], 0
	je	SHORT $L71715
	cmp	DWORD PTR _flt$[ebp+4424], 0
	je	SHORT $L74420
	mov	edx, DWORD PTR _flt$[ebp+4424]
	sub	edx, 1
	mov	DWORD PTR -5832+[ebp], edx
	jmp	SHORT $L74421
$L74420:
	mov	DWORD PTR -5832+[ebp], 0
$L74421:
	mov	eax, DWORD PTR _cntxt$[ebp]
	add	eax, 29704				; 00007408H
	push	eax
	mov	ecx, DWORD PTR -5832+[ebp]
	imul	ecx, 136				; 00000088H
	lea	edx, DWORD PTR _flt$[ebp+ecx+152]
	push	edx
	call	_strcpy
	add	esp, 8
$L71715:

; 1027 : 			if(qry_build_clauses(cntxt, &flt, 1)) STACK_ERROR;

	push	1
	lea	eax, DWORD PTR _flt$[ebp]
	push	eax
	mov	ecx, DWORD PTR _cntxt$[ebp]
	push	ecx
	call	_qry_build_clauses
	add	esp, 12					; 0000000cH
	test	eax, eax
	je	SHORT $L71716
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 1027		; 00000403H
	jmp	$eva_err$71495
$L71716:

; 1028 : 
; 1029 : 			/* If group function is used */
; 1030 : 			if(flt.groupfn)

	cmp	DWORD PTR _flt$[ebp+44], 0
	je	$L71717

; 1032 : 				/* Add select members for value - no modifiers */
; 1033 : 				if(qry_add_valnode_field(cntxt, &flt, flt.valnode ? flt.valnode->modif : F_None)) STACK_ERROR;

	cmp	DWORD PTR _flt$[ebp+4428], 0
	je	SHORT $L74422
	mov	eax, DWORD PTR _flt$[ebp+4428]
	mov	ecx, DWORD PTR [eax+20]
	mov	DWORD PTR -5836+[ebp], ecx
	jmp	SHORT $L74423
$L74422:
	mov	DWORD PTR -5836+[ebp], 0
$L74423:
	mov	edx, DWORD PTR -5836+[ebp]
	push	edx
	lea	eax, DWORD PTR _flt$[ebp]
	push	eax
	mov	ecx, DWORD PTR _cntxt$[ebp]
	push	ecx
	call	_qry_add_valnode_field
	add	esp, 12					; 0000000cH
	test	eax, eax
	je	SHORT $L71718
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 1033		; 00000409H
	jmp	$eva_err$71495
$L71718:

; 1034 : 				DYNBUF_ADD_STR(&flt.select, " AS Val");

	push	0
	push	0
	push	7
	push	OFFSET FLAT:$SG71721
	lea	eax, DWORD PTR _flt$[ebp+28]
	push	eax
	call	_dynbuf_add
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L71720
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29872], OFFSET FLAT:$SG71723
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 1034		; 0000040aH
	jmp	$eva_err$71495
$L71720:

; 1035 : 				if(b_line) DYNBUF_ADD_STR(&flt.select, ",NULL AS Line");

	cmp	DWORD PTR _b_line$[ebp], 0
	je	SHORT $L71726
	push	0
	push	0
	push	13					; 0000000dH
	push	OFFSET FLAT:$SG71727
	lea	eax, DWORD PTR _flt$[ebp+28]
	push	eax
	call	_dynbuf_add
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L71726
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29872], OFFSET FLAT:$SG71729
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 1035		; 0000040bH
	jmp	$eva_err$71495
$L71726:

; 1037 : 			/* Else : Add select members for field modifiers */
; 1038 : 			else for(j = 0; j < tables.nbcols; j++)

	jmp	$L71733
$L71717:
	mov	DWORD PTR _j$[ebp], 0
	jmp	SHORT $L71731
$L71732:
	mov	eax, DWORD PTR _j$[ebp]
	add	eax, 1
	mov	DWORD PTR _j$[ebp], eax
$L71731:
	mov	ecx, DWORD PTR _j$[ebp]
	cmp	ecx, DWORD PTR _tables$[ebp+8]
	jae	$L71733

; 1040 : 				fld = dyntab_cell(&tables, i, j);

	mov	edx, DWORD PTR _j$[ebp]
	push	edx
	mov	eax, DWORD PTR _i$[ebp]
	push	eax
	lea	ecx, DWORD PTR _tables$[ebp]
	push	ecx
	call	_dyntab_cell
	add	esp, 12					; 0000000cH
	mov	DWORD PTR _fld$71695[ebp], eax

; 1041 : 				if(!fld->txt) break;

	mov	edx, DWORD PTR _fld$71695[ebp]
	cmp	DWORD PTR [edx], 0
	jne	SHORT $L71734
	jmp	$L71733
$L71734:

; 1042 : 				if(fld->col) continue;

	mov	eax, DWORD PTR _fld$71695[ebp]
	cmp	DWORD PTR [eax+56], 0
	je	SHORT $L71735
	jmp	SHORT $L71732
$L71735:

; 1043 : 				if(flt.select) DYNBUF_ADD_STR(&flt.select, ",");

	cmp	DWORD PTR _flt$[ebp+28], 0
	je	SHORT $L71738
	push	0
	push	0
	push	1
	push	OFFSET FLAT:$SG71739
	lea	ecx, DWORD PTR _flt$[ebp+28]
	push	ecx
	call	_dynbuf_add
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L71738
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29872], OFFSET FLAT:$SG71741
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 1043		; 00000413H
	jmp	$eva_err$71495
$L71738:

; 1044 : 				if(qry_add_valnode_field(cntxt, &flt, qry_parse_field_modifier(fld->field))) STACK_ERROR;

	mov	ecx, DWORD PTR _fld$71695[ebp]
	mov	edx, DWORD PTR [ecx+8]
	push	edx
	call	_qry_parse_field_modifier
	add	esp, 4
	push	eax
	lea	eax, DWORD PTR _flt$[ebp]
	push	eax
	mov	ecx, DWORD PTR _cntxt$[ebp]
	push	ecx
	call	_qry_add_valnode_field
	add	esp, 12					; 0000000cH
	test	eax, eax
	je	SHORT $L71742
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 1044		; 00000414H
	jmp	$eva_err$71495
$L71742:

; 1045 : 				DYNBUF_ADD3(&flt.select, " AS ", fld->field ? strcmp(fld->field, "IdObj") ? fld->field : "IdValObj" : "Val", 0, NO_CONV, "");

	mov	eax, DWORD PTR _fld$71695[ebp]
	cmp	DWORD PTR [eax+8], 0
	je	SHORT $L74426
	push	OFFSET FLAT:$SG71746
	mov	ecx, DWORD PTR _fld$71695[ebp]
	mov	edx, DWORD PTR [ecx+8]
	push	edx
	call	_strcmp
	add	esp, 8
	test	eax, eax
	je	SHORT $L74424
	mov	eax, DWORD PTR _fld$71695[ebp]
	mov	ecx, DWORD PTR [eax+8]
	mov	DWORD PTR -5840+[ebp], ecx
	jmp	SHORT $L74425
$L74424:
	mov	DWORD PTR -5840+[ebp], OFFSET FLAT:$SG71747
$L74425:
	mov	edx, DWORD PTR -5840+[ebp]
	mov	DWORD PTR -5844+[ebp], edx
	jmp	SHORT $L74427
$L74426:
	mov	DWORD PTR -5844+[ebp], OFFSET FLAT:$SG71748
$L74427:
	push	0
	push	OFFSET FLAT:$SG71745
	push	0
	push	0
	push	0
	mov	eax, DWORD PTR -5844+[ebp]
	push	eax
	push	4
	push	OFFSET FLAT:$SG71749
	lea	ecx, DWORD PTR _flt$[ebp+28]
	push	ecx
	call	_dynbuf_add3
	add	esp, 36					; 00000024H
	test	eax, eax
	je	SHORT $L71744
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29872], OFFSET FLAT:$SG71751
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 1045		; 00000415H
	jmp	$eva_err$71495
$L71744:

; 1046 : 			}

	jmp	$L71732
$L71733:

; 1047 : 			flt.optselect = flt.select;

	mov	ecx, DWORD PTR _flt$[ebp+28]
	mov	DWORD PTR _flt$[ebp+32], ecx

; 1048 : 			flt.select = NULL;

	mov	DWORD PTR _flt$[ebp+28], 0

; 1049 : 
; 1050 : 			/* Build & exec query for values table */
; 1051 : 			if(qry_build_flt_select(cntxt, &sql, &empty, &flt, 0, 0)) STACK_ERROR;

	push	0
	push	0
	lea	edx, DWORD PTR _flt$[ebp]
	push	edx
	lea	eax, DWORD PTR _empty$[ebp]
	push	eax
	lea	ecx, DWORD PTR _sql$[ebp]
	push	ecx
	mov	edx, DWORD PTR _cntxt$[ebp]
	push	edx
	call	_qry_build_flt_select
	add	esp, 24					; 00000018H
	test	eax, eax
	je	SHORT $L71753
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 1051		; 0000041bH
	jmp	$eva_err$71495
$L71753:

; 1052 : 			if(sql_exec_query(cntxt, sql->data))

	mov	ecx, DWORD PTR _sql$[ebp]
	add	ecx, 8
	push	ecx
	mov	edx, DWORD PTR _cntxt$[ebp]
	push	edx
	call	_sql_exec_query
	add	esp, 8
	test	eax, eax
	je	SHORT $L71754

; 1054 : 				CLEAR_ERROR;

	push	1054					; 0000041eH
	push	OFFSET FLAT:$SG71755
	push	OFFSET FLAT:$SG71756
	mov	eax, DWORD PTR _cntxt$[ebp]
	push	eax
	call	_err_clear
	add	esp, 16					; 00000010H

; 1055 : 				DYNBUF_ADD_STR(member, "NULL");

	push	0
	push	0
	push	4
	push	OFFSET FLAT:$SG71759
	mov	ecx, DWORD PTR _member$[ebp]
	push	ecx
	call	_dynbuf_add
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L71758
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29872], OFFSET FLAT:$SG71761
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 1055		; 0000041fH
	jmp	$eva_err$71495
$L71758:

; 1057 : 			else

	jmp	$L71772
$L71754:

; 1059 : 				snprintf(add_sz_str(printbuf), "V%lu", i);

	mov	ecx, DWORD PTR _i$[ebp]
	push	ecx
	push	OFFSET FLAT:$SG71763
	push	1023					; 000003ffH
	lea	edx, DWORD PTR _printbuf$[ebp]
	push	edx
	call	__snprintf
	add	esp, 16					; 00000010H

; 1060 : 				if(cntxt->sql_trace)

	mov	eax, DWORD PTR _cntxt$[ebp]
	cmp	DWORD PTR [eax+29852], 0
	je	$L71764

; 1062 : 					DYNBUF_ADD3_CELL(&cntxt->debug_msg, "*** Done [", &tables, i, 0, NO_CONV, "]\n");

	push	2
	push	OFFSET FLAT:$SG71767
	push	0
	push	0
	push	0
	mov	ecx, DWORD PTR _i$[ebp]
	push	ecx
	lea	edx, DWORD PTR _tables$[ebp]
	push	edx
	call	_dyntab_sz
	add	esp, 12					; 0000000cH
	push	eax
	push	0
	mov	eax, DWORD PTR _i$[ebp]
	push	eax
	lea	ecx, DWORD PTR _tables$[ebp]
	push	ecx
	call	_dyntab_val
	add	esp, 12					; 0000000cH
	push	eax
	push	10					; 0000000aH
	push	OFFSET FLAT:$SG71768
	mov	edx, DWORD PTR _cntxt$[ebp]
	add	edx, 29864				; 000074a8H
	push	edx
	call	_dynbuf_add3
	add	esp, 36					; 00000024H
	test	eax, eax
	je	SHORT $L71766
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29872], OFFSET FLAT:$SG71770
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 1062		; 00000426H
	jmp	$eva_err$71495
$L71766:

; 1063 : 					put_debug_sqltable(cntxt, printbuf);

	lea	edx, DWORD PTR _printbuf$[ebp]
	push	edx
	mov	eax, DWORD PTR _cntxt$[ebp]
	push	eax
	call	_put_debug_sqltable
	add	esp, 8

; 1065 : 				else if(cntxt->debug & DEBUG_SQL_SLOW && cntxt->sql_restime > DEBUG_SQL_SLOW_TH)

	jmp	SHORT $L71772
$L71764:
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	edx, DWORD PTR [ecx+29860]
	and	edx, 64					; 00000040H
	test	edx, edx
	je	SHORT $L71772
	mov	eax, DWORD PTR _cntxt$[ebp]
	fld	QWORD PTR [eax+29840]
	fcomp	QWORD PTR __real@8@3ffbccccccccccccd000
	fnstsw	ax
	test	ah, 65					; 00000041H
	jne	SHORT $L71772

; 1066 : 					err_print_filter(&cntxt->debug_msg, &flt);

	lea	ecx, DWORD PTR _flt$[ebp]
	push	ecx
	mov	edx, DWORD PTR _cntxt$[ebp]
	add	edx, 29864				; 000074a8H
	push	edx
	call	_err_print_filter
	add	esp, 8
$L71772:

; 1068 : 
; 1069 : 			/* Add index to values table */
; 1070 : 			snprintf(add_sz_str(printbuf), "ALTER TABLE V%lu ADD INDEX (IdObj)", i);

	mov	eax, DWORD PTR _i$[ebp]
	push	eax
	push	OFFSET FLAT:$SG71773
	push	1023					; 000003ffH
	lea	ecx, DWORD PTR _printbuf$[ebp]
	push	ecx
	call	__snprintf
	add	esp, 16					; 00000010H

; 1071 : 			if(sql_exec_query(cntxt, printbuf)) STACK_ERROR;

	lea	edx, DWORD PTR _printbuf$[ebp]
	push	edx
	mov	eax, DWORD PTR _cntxt$[ebp]
	push	eax
	call	_sql_exec_query
	add	esp, 8
	test	eax, eax
	je	SHORT $L71774
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 1071		; 0000042fH
	jmp	$eva_err$71495
$L71774:

; 1073 : 
; 1074 : 		/* Add join clause on values table */
; 1075 : 		dynbuf_print3(join, "LEFT JOIN V%lu ON V%lu.IdObj=%s.IdObj \n", i, i, srctbl);

	push	0
	push	0
	mov	edx, DWORD PTR _srctbl$[ebp]
	push	edx
	mov	eax, DWORD PTR _i$[ebp]
	push	eax
	mov	ecx, DWORD PTR _i$[ebp]
	push	ecx
	push	OFFSET FLAT:$SG71776
	push	1023					; 000003ffH
	lea	edx, DWORD PTR _printbuf$[ebp]
	push	edx
	call	__snprintf
	add	esp, 24					; 00000018H
	push	eax
	lea	eax, DWORD PTR _printbuf$[ebp]
	push	eax
	mov	ecx, DWORD PTR _join$[ebp]
	push	ecx
	call	_dynbuf_add
	add	esp, 20					; 00000014H

; 1076 : 	}

	jmp	$L71693
$L71694:

; 1077 : 
; 1078 : 	/* Evaluate expressions in brackets & build select statement */
; 1079 : 	FOR_EACH_BRACKET

	mov	edx, DWORD PTR _expr$[ebp]
	mov	DWORD PTR _next$[ebp], edx
$L71778:
	mov	eax, DWORD PTR _next$[ebp]
	movsx	ecx, BYTE PTR [eax]
	test	ecx, ecx
	je	$L71779
	push	91					; 0000005bH
	mov	edx, DWORD PTR _next$[ebp]
	push	edx
	call	_strchr
	add	esp, 8
	mov	DWORD PTR _fieldbeg$71780[ebp], eax
	cmp	DWORD PTR _fieldbeg$71780[ebp], 0
	je	SHORT $L74428
	push	93					; 0000005dH
	mov	eax, DWORD PTR _fieldbeg$71780[ebp]
	push	eax
	call	_strchr
	add	esp, 8
	mov	DWORD PTR -5848+[ebp], eax
	jmp	SHORT $L74429
$L74428:
	mov	DWORD PTR -5848+[ebp], 0
$L74429:
	mov	ecx, DWORD PTR -5848+[ebp]
	mov	DWORD PTR _fieldend$71781[ebp], ecx
	cmp	DWORD PTR _fieldbeg$71780[ebp], 0
	je	SHORT $L71784
	cmp	DWORD PTR _fieldend$71781[ebp], 0
	jne	SHORT $L71783
$L71784:
	jmp	$L71779
$L71783:

; 1081 : 		/* Search for corresponding table & value modifier */
; 1082 : 		for(i = 0; i < tables.nbrows; i++)

	mov	DWORD PTR _i$[ebp], 0
	jmp	SHORT $L71785
$L71786:
	mov	edx, DWORD PTR _i$[ebp]
	add	edx, 1
	mov	DWORD PTR _i$[ebp], edx
$L71785:
	mov	eax, DWORD PTR _i$[ebp]
	cmp	eax, DWORD PTR _tables$[ebp]
	jae	$L71787

; 1084 : 			for(j = 0; j < tables.nbcols; j++)

	mov	DWORD PTR _j$[ebp], 0
	jmp	SHORT $L71788
$L71789:
	mov	ecx, DWORD PTR _j$[ebp]
	add	ecx, 1
	mov	DWORD PTR _j$[ebp], ecx
$L71788:
	mov	edx, DWORD PTR _j$[ebp]
	cmp	edx, DWORD PTR _tables$[ebp+8]
	jae	SHORT $L71790

; 1086 : 				fld = dyntab_cell(&tables, i, j);

	mov	eax, DWORD PTR _j$[ebp]
	push	eax
	mov	ecx, DWORD PTR _i$[ebp]
	push	ecx
	lea	edx, DWORD PTR _tables$[ebp]
	push	edx
	call	_dyntab_cell
	add	esp, 12					; 0000000cH
	mov	DWORD PTR _fld$[ebp], eax

; 1087 : 				if(fld->txt == fieldbeg + 1)

	mov	eax, DWORD PTR _fieldbeg$71780[ebp]
	add	eax, 1
	mov	ecx, DWORD PTR _fld$[ebp]
	cmp	DWORD PTR [ecx], eax
	jne	SHORT $L71791

; 1089 : 					if(fld->col) j = fld->col - 1;

	mov	edx, DWORD PTR _fld$[ebp]
	cmp	DWORD PTR [edx+56], 0
	je	SHORT $L71792
	mov	eax, DWORD PTR _fld$[ebp]
	mov	ecx, DWORD PTR [eax+56]
	sub	ecx, 1
	mov	DWORD PTR _j$[ebp], ecx
$L71792:

; 1090 : 					break;

	jmp	SHORT $L71790
$L71791:

; 1092 : 			}

	jmp	SHORT $L71789
$L71790:

; 1093 : 			if(fld->txt == fieldbeg + 1) break;

	mov	edx, DWORD PTR _fieldbeg$71780[ebp]
	add	edx, 1
	mov	eax, DWORD PTR _fld$[ebp]
	cmp	DWORD PTR [eax], edx
	jne	SHORT $L71793
	jmp	SHORT $L71787
$L71793:

; 1094 : 		}

	jmp	$L71786
$L71787:

; 1095 : 		if(!fld || fld->txt != fieldbeg + 1) RETURN_ERROR("Program error", NOP);

	cmp	DWORD PTR _fld$[ebp], 0
	je	SHORT $L71795
	mov	ecx, DWORD PTR _fieldbeg$71780[ebp]
	add	ecx, 1
	mov	edx, DWORD PTR _fld$[ebp]
	cmp	DWORD PTR [edx], ecx
	je	SHORT $L71794
$L71795:
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29872], OFFSET FLAT:$SG71797
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 1095		; 00000447H
	jmp	$eva_err$71495
$L71794:

; 1099 : 			char *f = fld->field ? strcmp(fld->field, "IdObj") ? fld->field : "IdValObj" : "Val";

	mov	edx, DWORD PTR _fld$[ebp]
	cmp	DWORD PTR [edx+8], 0
	je	SHORT $L74432
	push	OFFSET FLAT:$SG71799
	mov	eax, DWORD PTR _fld$[ebp]
	mov	ecx, DWORD PTR [eax+8]
	push	ecx
	call	_strcmp
	add	esp, 8
	test	eax, eax
	je	SHORT $L74430
	mov	edx, DWORD PTR _fld$[ebp]
	mov	eax, DWORD PTR [edx+8]
	mov	DWORD PTR -5852+[ebp], eax
	jmp	SHORT $L74431
$L74430:
	mov	DWORD PTR -5852+[ebp], OFFSET FLAT:$SG71800
$L74431:
	mov	ecx, DWORD PTR -5852+[ebp]
	mov	DWORD PTR -5856+[ebp], ecx
	jmp	SHORT $L74433
$L74432:
	mov	DWORD PTR -5856+[ebp], OFFSET FLAT:$SG71801
$L74433:
	mov	edx, DWORD PTR -5856+[ebp]
	mov	DWORD PTR _f$71798[ebp], edx

; 1100 : 			if(fieldbeg > next) DYNBUF_ADD(member, next, fieldbeg - next, NO_CONV);

	mov	eax, DWORD PTR _fieldbeg$71780[ebp]
	cmp	eax, DWORD PTR _next$[ebp]
	jbe	SHORT $L71804
	push	0
	push	0
	mov	ecx, DWORD PTR _fieldbeg$71780[ebp]
	sub	ecx, DWORD PTR _next$[ebp]
	push	ecx
	mov	edx, DWORD PTR _next$[ebp]
	push	edx
	mov	eax, DWORD PTR _member$[ebp]
	push	eax
	call	_dynbuf_add
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L71804
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29872], OFFSET FLAT:$SG71806
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 1100		; 0000044cH
	jmp	$eva_err$71495
$L71804:

; 1101 : 			dynbuf_print4(member, "IF(V%lu.%s IS NULL,'',V%lu.%s)", i, f, i, f);

	push	0
	push	0
	mov	eax, DWORD PTR _f$71798[ebp]
	push	eax
	mov	ecx, DWORD PTR _i$[ebp]
	push	ecx
	mov	edx, DWORD PTR _f$71798[ebp]
	push	edx
	mov	eax, DWORD PTR _i$[ebp]
	push	eax
	push	OFFSET FLAT:$SG71808
	push	1023					; 000003ffH
	lea	ecx, DWORD PTR _printbuf$[ebp]
	push	ecx
	call	__snprintf
	add	esp, 28					; 0000001cH
	push	eax
	lea	edx, DWORD PTR _printbuf$[ebp]
	push	edx
	mov	eax, DWORD PTR _member$[ebp]
	push	eax
	call	_dynbuf_add
	add	esp, 20					; 00000014H

; 1104 : 	END_EACH_BRACKET

	mov	ecx, DWORD PTR _fieldend$71781[ebp]
	add	ecx, 1
	mov	DWORD PTR _next$[ebp], ecx
	jmp	$L71778
$L71779:

; 1105 : 	if(*next) DYNBUF_ADD(member, next, 0, NO_CONV);

	mov	edx, DWORD PTR _next$[ebp]
	movsx	eax, BYTE PTR [edx]
	test	eax, eax
	je	SHORT $L71811
	push	0
	push	0
	push	0
	mov	ecx, DWORD PTR _next$[ebp]
	push	ecx
	mov	edx, DWORD PTR _member$[ebp]
	push	edx
	call	_dynbuf_add
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L71811
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29872], OFFSET FLAT:$SG71813
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 1105		; 00000451H
	jmp	SHORT $eva_err$71495
$L71811:

; 1106 : 
; 1107 : 	*nbtemp = tables.nbrows;

	mov	edx, DWORD PTR _nbtemp$[ebp]
	mov	eax, DWORD PTR _tables$[ebp]
	mov	DWORD PTR [edx], eax
$eva_noerr$71493:

; 1108 : 
; 1109 : 	RETURN_OK_CLEANUP;

	push	0
	push	OFFSET FLAT:$SG71814
	push	OFFSET FLAT:$SG71815
	mov	ecx, DWORD PTR _cntxt$[ebp]
	push	ecx
	call	_err_clear
	add	esp, 16					; 00000010H
$eva_err$71495:
	mov	edx, DWORD PTR _cntxt$[ebp]
	cmp	DWORD PTR [edx+29872], 0
	je	SHORT $L71816
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	ecx, DWORD PTR [eax+29900]
	push	ecx
	push	OFFSET FLAT:$SG71817
	push	OFFSET FLAT:$SG71818
	mov	edx, DWORD PTR _cntxt$[ebp]
	push	edx
	call	_err_add_context
	add	esp, 16					; 00000010H
$L71816:
	mov	eax, DWORD PTR _sql$[ebp]
	push	eax
	call	_mem_free
	add	esp, 4
	mov	DWORD PTR _sql$[ebp], 0
	mov	ecx, DWORD PTR _exprbuf$[ebp]
	push	ecx
	call	_mem_free
	add	esp, 4
	mov	DWORD PTR _exprbuf$[ebp], 0
	lea	edx, DWORD PTR _valtyp$[ebp]
	push	edx
	call	_dyntab_free
	add	esp, 4
	lea	eax, DWORD PTR _valexpr$[ebp]
	push	eax
	call	_dyntab_free
	add	esp, 4
	lea	ecx, DWORD PTR _valrel$[ebp]
	push	ecx
	call	_dyntab_free
	add	esp, 4
	lea	edx, DWORD PTR _valfunc$[ebp]
	push	edx
	call	_dyntab_free
	add	esp, 4
	lea	eax, DWORD PTR _tables$[ebp]
	push	eax
	call	_dyntab_free
	add	esp, 4
	lea	ecx, DWORD PTR _data$[ebp]
	push	ecx
	call	_dyntab_free
	add	esp, 4
	lea	edx, DWORD PTR _flt$[ebp]
	push	edx
	call	_qry_build_free
	add	esp, 4
	mov	eax, DWORD PTR _cntxt$[ebp]
	xor	ecx, ecx
	cmp	DWORD PTR [eax+29872], 0
	setne	cl
	mov	eax, ecx

; 1110 : }

	pop	edi
	mov	esp, ebp
	pop	ebp
	ret	0
_qry_build_sqlexpr ENDP
_TEXT	ENDS
PUBLIC	_qry_eval_fieldexpr
EXTRN	_sql_result_next_row:NEAR
_DATA	SEGMENT
	ORG $+2
$SG71838 DB	'TmpFieldExpr', 00H
	ORG $+3
$SG71839 DB	'SELECT * FROM TmpFieldExpr', 00H
	ORG $+1
$SG71850 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG71856 DB	'D:\Travail\ABI\EVA\V4.0\CGI\Brunix-2016\qry_build.c', 00H
$SG71857 DB	'qry_eval_fieldexpr', 00H
	ORG $+1
$SG71859 DB	'D:\Travail\ABI\EVA\V4.0\CGI\Brunix-2016\qry_build.c', 00H
$SG71860 DB	'qry_eval_fieldexpr', 00H
	ORG $+1
$SG71861 DB	'TmpFieldExpr', 00H
_DATA	ENDS
_TEXT	SEGMENT
_cntxt$ = 8
_res$ = 12
_expr$ = 16
_srctbl$ = 20
_vardata$ = 24
_row$ = -20
_c$ = -24
_r$ = -4
_qry_eval_fieldexpr PROC NEAR

; 1126 : ){

	push	ebp
	mov	ebp, esp
	sub	esp, 24					; 00000018H

; 1127 : 	EVA_sql_row row = {0};

	mov	DWORD PTR _row$[ebp], 0
	xor	eax, eax
	mov	DWORD PTR _row$[ebp+4], eax
	mov	DWORD PTR _row$[ebp+8], eax
	mov	DWORD PTR _row$[ebp+12], eax

; 1128 : 	DynTableCell *c;
; 1129 : 	unsigned long r;
; 1130 : 
; 1131 : 	/* Evaluate expression */
; 1132 : 	if(qry_eval_sql_fieldexpr(cntxt, "TmpFieldExpr", expr, srctbl, vardata) ||
; 1133 : 		sql_exec_query(cntxt, "SELECT * FROM TmpFieldExpr")) STACK_ERROR;

	mov	ecx, DWORD PTR _vardata$[ebp]
	push	ecx
	mov	edx, DWORD PTR _srctbl$[ebp]
	push	edx
	mov	eax, DWORD PTR _expr$[ebp]
	push	eax
	push	OFFSET FLAT:$SG71838
	mov	ecx, DWORD PTR _cntxt$[ebp]
	push	ecx
	call	_qry_eval_sql_fieldexpr
	add	esp, 20					; 00000014H
	test	eax, eax
	jne	SHORT $L71837
	push	OFFSET FLAT:$SG71839
	mov	edx, DWORD PTR _cntxt$[ebp]
	push	edx
	call	_sql_exec_query
	add	esp, 8
	test	eax, eax
	je	SHORT $L71836
$L71837:
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 1133		; 0000046dH
	jmp	$eva_err$71840
$L71836:

; 1137 : 		if(sql_result_next_row(cntxt, &row)) STACK_ERROR;

	lea	ecx, DWORD PTR _row$[ebp]
	push	ecx
	mov	edx, DWORD PTR _cntxt$[ebp]
	push	edx
	call	_sql_result_next_row
	add	esp, 8
	test	eax, eax
	je	SHORT $L71844
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 1137		; 00000471H
	jmp	$eva_err$71840
$L71844:

; 1138 : 		if(!row.sz || !row.sz[1]) continue;

	cmp	DWORD PTR _row$[ebp+12], 0
	je	SHORT $L71846
	mov	ecx, DWORD PTR _row$[ebp+12]
	cmp	DWORD PTR [ecx+4], 0
	jne	SHORT $L71845
$L71846:
	jmp	$L71853
$L71845:

; 1139 : 		r = res->nbrows;

	mov	edx, DWORD PTR _res$[ebp]
	mov	eax, DWORD PTR [edx]
	mov	DWORD PTR _r$[ebp], eax

; 1140 : 		if(dyntab_add(res, r, 0, row.value[1], row.sz[1], NO_CONV)) RETURN_ERR_MEMORY;

	push	0
	push	0
	mov	ecx, DWORD PTR _row$[ebp+12]
	mov	edx, DWORD PTR [ecx+4]
	push	edx
	mov	eax, DWORD PTR _row$[ebp+8]
	mov	ecx, DWORD PTR [eax+4]
	push	ecx
	push	0
	mov	edx, DWORD PTR _r$[ebp]
	push	edx
	mov	eax, DWORD PTR _res$[ebp]
	push	eax
	call	_dyntab_add
	add	esp, 28					; 0000001cH
	test	eax, eax
	je	SHORT $L71848
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29872], OFFSET FLAT:$SG71850
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 1140		; 00000474H
	jmp	SHORT $eva_err$71840
$L71848:

; 1141 : 		c = dyntab_cell(res, r, 0);

	push	0
	mov	eax, DWORD PTR _r$[ebp]
	push	eax
	mov	ecx, DWORD PTR _res$[ebp]
	push	ecx
	call	_dyntab_cell
	add	esp, 12					; 0000000cH
	mov	DWORD PTR _c$[ebp], eax

; 1142 : 		if(row.value[0]) c->IdObj = strtoul(row.value[0], NULL, 10);

	mov	edx, DWORD PTR _row$[ebp+8]
	cmp	DWORD PTR [edx], 0
	je	SHORT $L71851
	push	10					; 0000000aH
	push	0
	mov	eax, DWORD PTR _row$[ebp+8]
	mov	ecx, DWORD PTR [eax]
	push	ecx
	call	_strtoul
	add	esp, 12					; 0000000cH
	mov	edx, DWORD PTR _c$[ebp]
	mov	DWORD PTR [edx+20], eax
$L71851:

; 1143 : 		if(row.value[2]) c->Line = strtoul(row.value[2], NULL, 10);

	mov	eax, DWORD PTR _row$[ebp+8]
	cmp	DWORD PTR [eax+8], 0
	je	SHORT $L71853
	push	10					; 0000000aH
	push	0
	mov	ecx, DWORD PTR _row$[ebp+8]
	mov	edx, DWORD PTR [ecx+8]
	push	edx
	call	_strtoul
	add	esp, 12					; 0000000cH
	mov	ecx, DWORD PTR _c$[ebp]
	mov	DWORD PTR [ecx+40], eax
$L71853:

; 1145 : 	while(row.sz);

	cmp	DWORD PTR _row$[ebp+12], 0
	jne	$L71836
$eva_noerr$71855:

; 1146 : 
; 1147 : 	RETURN_OK_CLEANUP;

	push	0
	push	OFFSET FLAT:$SG71856
	push	OFFSET FLAT:$SG71857
	mov	edx, DWORD PTR _cntxt$[ebp]
	push	edx
	call	_err_clear
	add	esp, 16					; 00000010H
$eva_err$71840:
	mov	eax, DWORD PTR _cntxt$[ebp]
	cmp	DWORD PTR [eax+29872], 0
	je	SHORT $L71858
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	edx, DWORD PTR [ecx+29900]
	push	edx
	push	OFFSET FLAT:$SG71859
	push	OFFSET FLAT:$SG71860
	mov	eax, DWORD PTR _cntxt$[ebp]
	push	eax
	call	_err_add_context
	add	esp, 16					; 00000010H
$L71858:
	push	OFFSET FLAT:$SG71861
	mov	ecx, DWORD PTR _cntxt$[ebp]
	push	ecx
	call	_sql_drop_table
	add	esp, 8
	mov	edx, DWORD PTR _cntxt$[ebp]
	xor	eax, eax
	cmp	DWORD PTR [edx+29872], 0
	setne	al

; 1148 : }

	mov	esp, ebp
	pop	ebp
	ret	0
_qry_eval_fieldexpr ENDP
_TEXT	ENDS
_DATA	SEGMENT
	ORG $+3
$SG71891 DB	0aH, 00H
	ORG $+2
$SG71892 DB	'-- qry_eval_sql_fieldexpr', 0aH, 'CREATE TEMPORARY TABLE'
	DB	' ', 00H
	ORG $+2
$SG71894 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG71897 DB	'SELECT ', 00H
$SG71899 DB	'D:\Travail\ABI\EVA\V4.0\CGI\Brunix-2016\qry_build.c', 00H
$SG71900 DB	'qry_eval_sql_fieldexpr', 00H
	ORG $+1
$SG71902 DB	'D:\Travail\ABI\EVA\V4.0\CGI\Brunix-2016\qry_build.c', 00H
$SG71903 DB	'qry_eval_sql_fieldexpr', 00H
	ORG $+1
$SG71908 DB	'TLink', 00H
	ORG $+2
$SG71911 DB	'TmpSQLExpr', 00H
	ORG $+1
$SG71914 DB	'.IdObj AS IdObj', 00H
$SG71915 DB	'SELECT DISTINCT ', 00H
	ORG $+3
$SG71917 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG71919 DB	' WHERE ', 00H
$SG71924 DB	'NULL', 00H
	ORG $+3
$SG71926 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG71929 DB	',', 00H
	ORG $+2
$SG71931 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG71935 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG71937 DB	' AS Val,', 00H
	ORG $+3
$SG71938 DB	' AS Line', 00H
	ORG $+3
$SG71941 DB	' AS Val, NULL AS Line ', 0aH, 00H
$SG71943 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG71946 DB	0aH, 00H
	ORG $+2
$SG71947 DB	0aH, 'FROM ', 00H
	ORG $+1
$SG71949 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG71953 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG71958 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG71961 DB	'CREATE TABLE TmpSQLExpr (IdObj INT NOT NULL PRIMARY KEY)'
	DB	' TYPE=HEAP', 0aH, 00H
$SG71965 DB	'INSERT IGNORE TmpSQLExpr (IdObj) SELECT DISTINCT IdObj F'
	DB	'ROM V%lu', 00H
	ORG $+3
$SG71969 DB	'V', 00H
	ORG $+2
$SG71970 DB	'TmpSQLExpr', 00H
	ORG $+1
$SG71971 DB	'D:\Travail\ABI\EVA\V4.0\CGI\Brunix-2016\qry_build.c', 00H
$SG71972 DB	'qry_eval_sql_fieldexpr', 00H
	ORG $+1
$SG71974 DB	'D:\Travail\ABI\EVA\V4.0\CGI\Brunix-2016\qry_build.c', 00H
$SG71975 DB	'qry_eval_sql_fieldexpr', 00H
_DATA	ENDS
_TEXT	SEGMENT
_cntxt$ = 8
_dsttbl$ = 12
_expr$ = 16
_srctbl$ = 20
_vardata$ = 24
_sql$ = -8
_member$ = -1056
_join$ = -1044
_printbuf$ = -1036
_nbtemp$ = -12
_i$ = -1052
_b_nosrctbl$ = -1040
_where$ = -1048
_sz_where$ = -4
_qry_eval_sql_fieldexpr PROC NEAR

; 1166 : ){

	push	ebp
	mov	ebp, esp
	sub	esp, 1056				; 00000420H

; 1167 : 	DynBuffer *sql = NULL;

	mov	DWORD PTR _sql$[ebp], 0

; 1168 : 	DynBuffer *member = NULL;

	mov	DWORD PTR _member$[ebp], 0

; 1169 : 	DynBuffer *join = NULL;

	mov	DWORD PTR _join$[ebp], 0

; 1170 : 	char printbuf[1024];
; 1171 : 	unsigned long nbtemp = 0, i;

	mov	DWORD PTR _nbtemp$[ebp], 0

; 1172 : 	int b_nosrctbl = 0;

	mov	DWORD PTR _b_nosrctbl$[ebp], 0

; 1173 : 	char *where = NULL; size_t sz_where = 0;

	mov	DWORD PTR _where$[ebp], 0
	mov	DWORD PTR _sz_where$[ebp], 0

; 1177 : 		"-- qry_eval_sql_fieldexpr\n"
; 1178 : 		"CREATE TEMPORARY TABLE ", dsttbl, 0, NO_CONV, "\n");

	push	1
	push	OFFSET FLAT:$SG71891
	push	0
	push	0
	push	0
	mov	eax, DWORD PTR _dsttbl$[ebp]
	push	eax
	push	49					; 00000031H
	push	OFFSET FLAT:$SG71892
	lea	ecx, DWORD PTR _sql$[ebp]
	push	ecx
	call	_dynbuf_add3
	add	esp, 36					; 00000024H
	test	eax, eax
	je	SHORT $L71890
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29872], OFFSET FLAT:$SG71894
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 1178		; 0000049aH
	jmp	$eva_err$71895
$L71890:

; 1179 : 
; 1180 : 	if(!strncmp(expr, add_sz_str("SELECT ")))

	push	7
	push	OFFSET FLAT:$SG71897
	mov	ecx, DWORD PTR _expr$[ebp]
	push	ecx
	call	_strncmp
	add	esp, 12					; 0000000cH
	test	eax, eax
	jne	SHORT $L71896

; 1182 : 		/* Handle raw SELECT statement */
; 1183 : 		if(qry_eval_sqlexpr_var(cntxt, &sql, expr, vardata, srctbl)) CLEAR_ERROR;

	mov	edx, DWORD PTR _srctbl$[ebp]
	push	edx
	mov	eax, DWORD PTR _vardata$[ebp]
	push	eax
	mov	ecx, DWORD PTR _expr$[ebp]
	push	ecx
	lea	edx, DWORD PTR _sql$[ebp]
	push	edx
	mov	eax, DWORD PTR _cntxt$[ebp]
	push	eax
	call	_qry_eval_sqlexpr_var
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L71898
	push	1183					; 0000049fH
	push	OFFSET FLAT:$SG71899
	push	OFFSET FLAT:$SG71900
	mov	ecx, DWORD PTR _cntxt$[ebp]
	push	ecx
	call	_err_clear
	add	esp, 16					; 00000010H
$L71898:

; 1184 : 		if(sql_exec_query(cntxt, sql->data)) CLEAR_ERROR;

	mov	edx, DWORD PTR _sql$[ebp]
	add	edx, 8
	push	edx
	mov	eax, DWORD PTR _cntxt$[ebp]
	push	eax
	call	_sql_exec_query
	add	esp, 8
	test	eax, eax
	je	SHORT $L71901
	push	1184					; 000004a0H
	push	OFFSET FLAT:$SG71902
	push	OFFSET FLAT:$SG71903
	mov	ecx, DWORD PTR _cntxt$[ebp]
	push	ecx
	call	_err_clear
	add	esp, 16					; 00000010H
$L71901:

; 1185 : 		RETURN_OK;

	jmp	$eva_noerr$71904
$L71896:

; 1187 : 	else
; 1188 : 		/* Handle SQL/relational statement */
; 1189 : 		if(qry_build_sqlexpr(cntxt, &member, &join, expr, srctbl, vardata, &nbtemp)) STACK_ERROR;

	lea	edx, DWORD PTR _nbtemp$[ebp]
	push	edx
	mov	eax, DWORD PTR _vardata$[ebp]
	push	eax
	mov	ecx, DWORD PTR _srctbl$[ebp]
	push	ecx
	mov	edx, DWORD PTR _expr$[ebp]
	push	edx
	lea	eax, DWORD PTR _join$[ebp]
	push	eax
	lea	ecx, DWORD PTR _member$[ebp]
	push	ecx
	mov	edx, DWORD PTR _cntxt$[ebp]
	push	edx
	call	_qry_build_sqlexpr
	add	esp, 28					; 0000001cH
	test	eax, eax
	je	SHORT $L71906
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 1189		; 000004a5H
	jmp	$eva_err$71895
$L71906:

; 1190 : 
; 1191 : 	/* Prepare base table if applicable */
; 1192 : 	if(srctbl && !strcmp(srctbl, "TLink")) srctbl = NULL;

	cmp	DWORD PTR _srctbl$[ebp], 0
	je	SHORT $L71907
	push	OFFSET FLAT:$SG71908
	mov	ecx, DWORD PTR _srctbl$[ebp]
	push	ecx
	call	_strcmp
	add	esp, 8
	test	eax, eax
	jne	SHORT $L71907
	mov	DWORD PTR _srctbl$[ebp], 0
$L71907:

; 1193 : 	if(!srctbl)

	cmp	DWORD PTR _srctbl$[ebp], 0
	jne	SHORT $L71910

; 1195 : 		srctbl = "TmpSQLExpr";

	mov	DWORD PTR _srctbl$[ebp], OFFSET FLAT:$SG71911

; 1196 : 		nbtemp = 0;

	mov	DWORD PTR _nbtemp$[ebp], 0

; 1197 : 		b_nosrctbl = 1;

	mov	DWORD PTR _b_nosrctbl$[ebp], 1
$L71910:

; 1202 : 		"SELECT DISTINCT ", srctbl, 0, NO_CONV, ".IdObj AS IdObj");

	push	15					; 0000000fH
	push	OFFSET FLAT:$SG71914
	push	0
	push	0
	push	0
	mov	edx, DWORD PTR _srctbl$[ebp]
	push	edx
	push	16					; 00000010H
	push	OFFSET FLAT:$SG71915
	lea	eax, DWORD PTR _sql$[ebp]
	push	eax
	call	_dynbuf_add3
	add	esp, 36					; 00000024H
	test	eax, eax
	je	SHORT $L71913
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29872], OFFSET FLAT:$SG71917
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 1202		; 000004b2H
	jmp	$eva_err$71895
$L71913:

; 1203 : 
; 1204 : 	/* Handle SELECT value member */
; 1205 : 	if(member)

	cmp	DWORD PTR _member$[ebp], 0
	je	SHORT $L71918

; 1207 : 		/* Separate where clause if applicable */
; 1208 : 		where = strstr(member->data, " WHERE ");

	push	OFFSET FLAT:$SG71919
	mov	eax, DWORD PTR _member$[ebp]
	add	eax, 8
	push	eax
	call	_strstr
	add	esp, 8
	mov	DWORD PTR _where$[ebp], eax

; 1209 : 		if(where)

	cmp	DWORD PTR _where$[ebp], 0
	je	SHORT $L71920

; 1211 : 			*where = 0;

	mov	ecx, DWORD PTR _where$[ebp]
	mov	BYTE PTR [ecx], 0

; 1212 : 			sz_where = member->cnt - (where - member->data) - 1;

	mov	edx, DWORD PTR _member$[ebp]
	add	edx, 8
	mov	eax, DWORD PTR _where$[ebp]
	sub	eax, edx
	mov	ecx, DWORD PTR _member$[ebp]
	mov	edx, DWORD PTR [ecx+4]
	sub	edx, eax
	sub	edx, 1
	mov	DWORD PTR _sz_where$[ebp], edx

; 1213 : 			member->cnt -= sz_where + 1;

	mov	eax, DWORD PTR _sz_where$[ebp]
	add	eax, 1
	mov	ecx, DWORD PTR _member$[ebp]
	mov	edx, DWORD PTR [ecx+4]
	sub	edx, eax
	mov	eax, DWORD PTR _member$[ebp]
	mov	DWORD PTR [eax+4], edx

; 1214 : 			where++;

	mov	ecx, DWORD PTR _where$[ebp]
	add	ecx, 1
	mov	DWORD PTR _where$[ebp], ecx
$L71920:

; 1217 : 	else

	jmp	SHORT $L71923
$L71918:

; 1218 : 		DYNBUF_ADD_STR(&member, "NULL");

	push	0
	push	0
	push	4
	push	OFFSET FLAT:$SG71924
	lea	edx, DWORD PTR _member$[ebp]
	push	edx
	call	_dynbuf_add
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L71923
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29872], OFFSET FLAT:$SG71926
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 1218		; 000004c2H
	jmp	$eva_err$71895
$L71923:

; 1219 : 	DYNBUF_ADD_STR(&sql, ",");

	push	0
	push	0
	push	1
	push	OFFSET FLAT:$SG71929
	lea	edx, DWORD PTR _sql$[ebp]
	push	edx
	call	_dynbuf_add
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L71928
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29872], OFFSET FLAT:$SG71931
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 1219		; 000004c3H
	jmp	$eva_err$71895
$L71928:

; 1220 : 	DYNBUF_ADD_BUF(&sql, member, NO_CONV);

	cmp	DWORD PTR _member$[ebp], 0
	je	SHORT $L71933
	push	0
	push	0
	mov	edx, DWORD PTR _member$[ebp]
	mov	eax, DWORD PTR [edx+4]
	push	eax
	mov	ecx, DWORD PTR _member$[ebp]
	add	ecx, 8
	push	ecx
	lea	edx, DWORD PTR _sql$[ebp]
	push	edx
	call	_dynbuf_add
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L71933
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29872], OFFSET FLAT:$SG71935
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 1220		; 000004c4H
	jmp	$eva_err$71895
$L71933:

; 1221 : 	if(!strstr(member->data, " AS Val,") && !strstr(member->data, " AS Line"))

	push	OFFSET FLAT:$SG71937
	mov	edx, DWORD PTR _member$[ebp]
	add	edx, 8
	push	edx
	call	_strstr
	add	esp, 8
	test	eax, eax
	jne	SHORT $L71940
	push	OFFSET FLAT:$SG71938
	mov	eax, DWORD PTR _member$[ebp]
	add	eax, 8
	push	eax
	call	_strstr
	add	esp, 8
	test	eax, eax
	jne	SHORT $L71940

; 1222 : 		DYNBUF_ADD_STR(&sql, " AS Val, NULL AS Line \n");

	push	0
	push	0
	push	23					; 00000017H
	push	OFFSET FLAT:$SG71941
	lea	ecx, DWORD PTR _sql$[ebp]
	push	ecx
	call	_dynbuf_add
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L71940
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29872], OFFSET FLAT:$SG71943
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 1222		; 000004c6H
	jmp	$eva_err$71895
$L71940:

; 1226 : 		"\nFROM ", srctbl, 0, NO_CONV, "\n");

	push	1
	push	OFFSET FLAT:$SG71946
	push	0
	push	0
	push	0
	mov	ecx, DWORD PTR _srctbl$[ebp]
	push	ecx
	push	6
	push	OFFSET FLAT:$SG71947
	lea	edx, DWORD PTR _sql$[ebp]
	push	edx
	call	_dynbuf_add3
	add	esp, 36					; 00000024H
	test	eax, eax
	je	SHORT $L71945
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29872], OFFSET FLAT:$SG71949
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 1226		; 000004caH
	jmp	$eva_err$71895
$L71945:

; 1227 : 	DYNBUF_ADD_BUF(&sql, join, NO_CONV);

	cmp	DWORD PTR _join$[ebp], 0
	je	SHORT $L71951
	push	0
	push	0
	mov	edx, DWORD PTR _join$[ebp]
	mov	eax, DWORD PTR [edx+4]
	push	eax
	mov	ecx, DWORD PTR _join$[ebp]
	add	ecx, 8
	push	ecx
	lea	edx, DWORD PTR _sql$[ebp]
	push	edx
	call	_dynbuf_add
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L71951
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29872], OFFSET FLAT:$SG71953
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 1227		; 000004cbH
	jmp	$eva_err$71895
$L71951:

; 1228 : 	if(where) DYNBUF_ADD(&sql, where, sz_where, NO_CONV);

	cmp	DWORD PTR _where$[ebp], 0
	je	SHORT $L71956
	push	0
	push	0
	mov	edx, DWORD PTR _sz_where$[ebp]
	push	edx
	mov	eax, DWORD PTR _where$[ebp]
	push	eax
	lea	ecx, DWORD PTR _sql$[ebp]
	push	ecx
	call	_dynbuf_add
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L71956
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29872], OFFSET FLAT:$SG71958
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 1228		; 000004ccH
	jmp	$eva_err$71895
$L71956:

; 1229 : 
; 1230 : 	/* Create base table from values tables if applicable */
; 1231 : 	if(b_nosrctbl)

	cmp	DWORD PTR _b_nosrctbl$[ebp], 0
	je	$L71964

; 1233 : 		if(sql_exec_query(cntxt, "CREATE TABLE TmpSQLExpr (IdObj INT NOT NULL PRIMARY KEY) TYPE=HEAP\n")) STACK_ERROR;

	push	OFFSET FLAT:$SG71961
	mov	ecx, DWORD PTR _cntxt$[ebp]
	push	ecx
	call	_sql_exec_query
	add	esp, 8
	test	eax, eax
	je	SHORT $L71960
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 1233		; 000004d1H
	jmp	$eva_err$71895
$L71960:

; 1234 : 		for(i = 0; i < nbtemp; i++)

	mov	DWORD PTR _i$[ebp], 0
	jmp	SHORT $L71962
$L71963:
	mov	eax, DWORD PTR _i$[ebp]
	add	eax, 1
	mov	DWORD PTR _i$[ebp], eax
$L71962:
	mov	ecx, DWORD PTR _i$[ebp]
	cmp	ecx, DWORD PTR _nbtemp$[ebp]
	jae	SHORT $L71964

; 1236 : 			snprintf(add_sz_str(printbuf), "INSERT IGNORE TmpSQLExpr (IdObj) SELECT DISTINCT IdObj FROM V%lu", i);

	mov	edx, DWORD PTR _i$[ebp]
	push	edx
	push	OFFSET FLAT:$SG71965
	push	1023					; 000003ffH
	lea	eax, DWORD PTR _printbuf$[ebp]
	push	eax
	call	__snprintf
	add	esp, 16					; 00000010H

; 1237 : 			if(sql_exec_query(cntxt, printbuf)) STACK_ERROR;

	lea	ecx, DWORD PTR _printbuf$[ebp]
	push	ecx
	mov	edx, DWORD PTR _cntxt$[ebp]
	push	edx
	call	_sql_exec_query
	add	esp, 8
	test	eax, eax
	je	SHORT $L71966
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 1237		; 000004d5H
	jmp	$eva_err$71895
$L71966:

; 1238 : 		}

	jmp	SHORT $L71963
$L71964:

; 1240 : 
; 1241 : 	/* Exec query */
; 1242 : 	if(sql_exec_query(cntxt, sql->data)) STACK_ERROR;

	mov	ecx, DWORD PTR _sql$[ebp]
	add	ecx, 8
	push	ecx
	mov	edx, DWORD PTR _cntxt$[ebp]
	push	edx
	call	_sql_exec_query
	add	esp, 8
	test	eax, eax
	je	SHORT $L71967
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 1242		; 000004daH
	jmp	SHORT $eva_err$71895
$L71967:

; 1243 : 
; 1244 : 	/* Trace result if debug mode */
; 1245 : 	if(cntxt->sql_trace) put_debug_sqltable(cntxt, dsttbl);

	mov	ecx, DWORD PTR _cntxt$[ebp]
	cmp	DWORD PTR [ecx+29852], 0
	je	SHORT $L71968
	mov	edx, DWORD PTR _dsttbl$[ebp]
	push	edx
	mov	eax, DWORD PTR _cntxt$[ebp]
	push	eax
	call	_put_debug_sqltable
	add	esp, 8
$L71968:

; 1246 : 
; 1247 : 	/* Drop temporary tables */
; 1248 : 	drop_tmptables(cntxt,"V", nbtemp);

	mov	ecx, DWORD PTR _nbtemp$[ebp]
	push	ecx
	push	OFFSET FLAT:$SG71969
	mov	edx, DWORD PTR _cntxt$[ebp]
	push	edx
	call	_drop_tmptables
	add	esp, 12					; 0000000cH

; 1249 : 	sql_drop_table(cntxt, "TmpSQLExpr");

	push	OFFSET FLAT:$SG71970
	mov	eax, DWORD PTR _cntxt$[ebp]
	push	eax
	call	_sql_drop_table
	add	esp, 8
$eva_noerr$71904:

; 1250 : 
; 1251 : 	RETURN_OK_CLEANUP;

	push	0
	push	OFFSET FLAT:$SG71971
	push	OFFSET FLAT:$SG71972
	mov	ecx, DWORD PTR _cntxt$[ebp]
	push	ecx
	call	_err_clear
	add	esp, 16					; 00000010H
$eva_err$71895:
	mov	edx, DWORD PTR _cntxt$[ebp]
	cmp	DWORD PTR [edx+29872], 0
	je	SHORT $L71973
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	ecx, DWORD PTR [eax+29900]
	push	ecx
	push	OFFSET FLAT:$SG71974
	push	OFFSET FLAT:$SG71975
	mov	edx, DWORD PTR _cntxt$[ebp]
	push	edx
	call	_err_add_context
	add	esp, 16					; 00000010H
$L71973:
	mov	eax, DWORD PTR _sql$[ebp]
	push	eax
	call	_mem_free
	add	esp, 4
	mov	DWORD PTR _sql$[ebp], 0
	mov	ecx, DWORD PTR _member$[ebp]
	push	ecx
	call	_mem_free
	add	esp, 4
	mov	DWORD PTR _member$[ebp], 0
	mov	edx, DWORD PTR _join$[ebp]
	push	edx
	call	_mem_free
	add	esp, 4
	mov	DWORD PTR _join$[ebp], 0
	mov	eax, DWORD PTR _cntxt$[ebp]
	xor	ecx, ecx
	cmp	DWORD PTR [eax+29872], 0
	setne	cl
	mov	eax, ecx

; 1252 : }

	mov	esp, ebp
	pop	ebp
	ret	0
_qry_eval_sql_fieldexpr ENDP
_TEXT	ENDS
PUBLIC	_qry_filter_sql_fieldexpr
EXTRN	_sql_get_table:NEAR
_DATA	SEGMENT
	ORG $+1
$SG72000 DB	'TLink', 00H
	ORG $+2
$SG72001 DB	'CREATE TEMPORARY TABLE TmpCondExpr TYPE=HEAP', 0aH, 'SEL'
	DB	'ECT DISTINCT IdObj FROM TLink', 00H
	ORG $+2
$SG72004 DB	'ALTER TABLE TmpCondExpr ADD INDEX (IdObj)', 00H
	ORG $+2
$SG72006 DB	'TmpCondExpr', 00H
$SG72009 DB	'CREATE TABLE ResSqlCond (IdObj INT) TYPE=HEAP', 0aH, 00H
	ORG $+1
$SG72012 DB	'INSERT INTO ResSqlCond', 0aH, 00H
$SG72014 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG72016 DB	'-- qry_filter_sql_fieldexpr - select matching objects', 0aH
	DB	'SELECT DISTINCT %s.IdObj FROM %s ', 0aH, 00H
	ORG $+3
$SG72022 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG72026 DB	0aH, 'WHERE', 0aH, 00H
$SG72028 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG72032 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG72034 DB	'D:\Travail\ABI\EVA\V4.0\CGI\Brunix-2016\qry_build.c', 00H
$SG72035 DB	'qry_filter_sql_fieldexpr', 00H
	ORG $+3
$SG72041 DB	'0', 00H
	ORG $+2
$SG72043 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG72044 DB	'V', 00H
	ORG $+2
$SG72045 DB	'TmpCondExpr', 00H
$SG72047 DB	'D:\Travail\ABI\EVA\V4.0\CGI\Brunix-2016\qry_build.c', 00H
$SG72048 DB	'qry_filter_sql_fieldexpr', 00H
	ORG $+3
$SG72050 DB	'D:\Travail\ABI\EVA\V4.0\CGI\Brunix-2016\qry_build.c', 00H
$SG72051 DB	'qry_filter_sql_fieldexpr', 00H
_DATA	ENDS
_TEXT	SEGMENT
_cntxt$ = 8
_res$ = 12
_expr$ = 16
_srcobj$ = 20
_vardata$ = 24
_member$ = -1040
_join$ = -1036
_sql$ = -4
_nbtemp$ = -8
_printbuf$ = -1032
_qry_filter_sql_fieldexpr PROC NEAR

; 1271 : ){

	push	ebp
	mov	ebp, esp
	sub	esp, 1040				; 00000410H

; 1272 : 	DynBuffer *member = NULL;

	mov	DWORD PTR _member$[ebp], 0

; 1273 : 	DynBuffer *join = NULL;

	mov	DWORD PTR _join$[ebp], 0

; 1274 : 	DynBuffer *sql = NULL;

	mov	DWORD PTR _sql$[ebp], 0

; 1275 : 	unsigned long nbtemp = 0;

	mov	DWORD PTR _nbtemp$[ebp], 0

; 1276 : 	char printbuf[1024];
; 1277 : 
; 1278 : 	/* Prepare base table */
; 1279 : 	if(!srcobj || !*srcobj || !strcmp(srcobj, "TLink"))

	cmp	DWORD PTR _srcobj$[ebp], 0
	je	SHORT $L71999
	mov	eax, DWORD PTR _srcobj$[ebp]
	movsx	ecx, BYTE PTR [eax]
	test	ecx, ecx
	je	SHORT $L71999
	push	OFFSET FLAT:$SG72000
	mov	edx, DWORD PTR _srcobj$[ebp]
	push	edx
	call	_strcmp
	add	esp, 8
	test	eax, eax
	jne	SHORT $L71998
$L71999:

; 1281 : 		snprintf(add_sz_str(printbuf), "CREATE TEMPORARY TABLE TmpCondExpr TYPE=HEAP\n"
; 1282 : 									"SELECT DISTINCT IdObj FROM TLink");

	push	OFFSET FLAT:$SG72001
	push	1023					; 000003ffH
	lea	eax, DWORD PTR _printbuf$[ebp]
	push	eax
	call	__snprintf
	add	esp, 12					; 0000000cH

; 1283 : 		if(sql_exec_query(cntxt, printbuf) ||
; 1284 : 			sql_exec_query(cntxt, "ALTER TABLE TmpCondExpr ADD INDEX (IdObj)")) STACK_ERROR;

	lea	ecx, DWORD PTR _printbuf$[ebp]
	push	ecx
	mov	edx, DWORD PTR _cntxt$[ebp]
	push	edx
	call	_sql_exec_query
	add	esp, 8
	test	eax, eax
	jne	SHORT $L72003
	push	OFFSET FLAT:$SG72004
	mov	eax, DWORD PTR _cntxt$[ebp]
	push	eax
	call	_sql_exec_query
	add	esp, 8
	test	eax, eax
	je	SHORT $L72002
$L72003:
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 1284		; 00000504H
	jmp	$eva_err$72005
$L72002:

; 1285 : 		srcobj = "TmpCondExpr";

	mov	DWORD PTR _srcobj$[ebp], OFFSET FLAT:$SG72006
$L71998:

; 1287 : 
; 1288 : 	/* Prepare select statement */
; 1289 : 	if(!res)

	cmp	DWORD PTR _res$[ebp], 0
	jne	SHORT $L72011

; 1291 : 		if(sql_exec_query(cntxt, "CREATE TABLE ResSqlCond (IdObj INT) TYPE=HEAP\n")) STACK_ERROR;

	push	OFFSET FLAT:$SG72009
	mov	edx, DWORD PTR _cntxt$[ebp]
	push	edx
	call	_sql_exec_query
	add	esp, 8
	test	eax, eax
	je	SHORT $L72008
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 1291		; 0000050bH
	jmp	$eva_err$72005
$L72008:

; 1292 : 		DYNBUF_ADD_STR(&sql, "INSERT INTO ResSqlCond\n");

	push	0
	push	0
	push	23					; 00000017H
	push	OFFSET FLAT:$SG72012
	lea	ecx, DWORD PTR _sql$[ebp]
	push	ecx
	call	_dynbuf_add
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L72011
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29872], OFFSET FLAT:$SG72014
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 1292		; 0000050cH
	jmp	$eva_err$72005
$L72011:

; 1294 : 	dynbuf_print2(&sql,
; 1295 : 		"-- qry_filter_sql_fieldexpr - select matching objects\n"
; 1296 : 		"SELECT DISTINCT %s.IdObj FROM %s \n", srcobj, srcobj);

	push	0
	push	0
	mov	ecx, DWORD PTR _srcobj$[ebp]
	push	ecx
	mov	edx, DWORD PTR _srcobj$[ebp]
	push	edx
	push	OFFSET FLAT:$SG72016
	push	1023					; 000003ffH
	lea	eax, DWORD PTR _printbuf$[ebp]
	push	eax
	call	__snprintf
	add	esp, 20					; 00000014H
	push	eax
	lea	ecx, DWORD PTR _printbuf$[ebp]
	push	ecx
	lea	edx, DWORD PTR _sql$[ebp]
	push	edx
	call	_dynbuf_add
	add	esp, 20					; 00000014H

; 1297 : 
; 1298 : 	/* Parse field expressions */
; 1299 : 	if(qry_build_sqlexpr(cntxt, &member, &join, expr, srcobj, vardata, &nbtemp)) STACK_ERROR;

	lea	eax, DWORD PTR _nbtemp$[ebp]
	push	eax
	mov	ecx, DWORD PTR _vardata$[ebp]
	push	ecx
	mov	edx, DWORD PTR _srcobj$[ebp]
	push	edx
	mov	eax, DWORD PTR _expr$[ebp]
	push	eax
	lea	ecx, DWORD PTR _join$[ebp]
	push	ecx
	lea	edx, DWORD PTR _member$[ebp]
	push	edx
	mov	eax, DWORD PTR _cntxt$[ebp]
	push	eax
	call	_qry_build_sqlexpr
	add	esp, 28					; 0000001cH
	test	eax, eax
	je	SHORT $L72017
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 1299		; 00000513H
	jmp	$eva_err$72005
$L72017:

; 1300 : 
; 1301 : 	/* Read matching objects in result table */
; 1302 : 	if(join) DYNBUF_ADD_BUF(&sql, join, NO_CONV);

	cmp	DWORD PTR _join$[ebp], 0
	je	SHORT $L72020
	cmp	DWORD PTR _join$[ebp], 0
	je	SHORT $L72020
	push	0
	push	0
	mov	edx, DWORD PTR _join$[ebp]
	mov	eax, DWORD PTR [edx+4]
	push	eax
	mov	ecx, DWORD PTR _join$[ebp]
	add	ecx, 8
	push	ecx
	lea	edx, DWORD PTR _sql$[ebp]
	push	edx
	call	_dynbuf_add
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L72020
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29872], OFFSET FLAT:$SG72022
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 1302		; 00000516H
	jmp	$eva_err$72005
$L72020:

; 1303 : 	if(member)

	cmp	DWORD PTR _member$[ebp], 0
	je	$L72030

; 1305 : 		DYNBUF_ADD_STR(&sql, "\nWHERE\n");

	push	0
	push	0
	push	7
	push	OFFSET FLAT:$SG72026
	lea	edx, DWORD PTR _sql$[ebp]
	push	edx
	call	_dynbuf_add
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L72025
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29872], OFFSET FLAT:$SG72028
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 1305		; 00000519H
	jmp	$eva_err$72005
$L72025:

; 1306 : 		DYNBUF_ADD_BUF(&sql, member, NO_CONV);

	cmp	DWORD PTR _member$[ebp], 0
	je	SHORT $L72030
	push	0
	push	0
	mov	edx, DWORD PTR _member$[ebp]
	mov	eax, DWORD PTR [edx+4]
	push	eax
	mov	ecx, DWORD PTR _member$[ebp]
	add	ecx, 8
	push	ecx
	lea	edx, DWORD PTR _sql$[ebp]
	push	edx
	call	_dynbuf_add
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L72030
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29872], OFFSET FLAT:$SG72032
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 1306		; 0000051aH
	jmp	$eva_err$72005
$L72030:

; 1308 : 	if(sql_exec_query(cntxt, sql->data)) CLEAR_ERROR;

	mov	edx, DWORD PTR _sql$[ebp]
	add	edx, 8
	push	edx
	mov	eax, DWORD PTR _cntxt$[ebp]
	push	eax
	call	_sql_exec_query
	add	esp, 8
	test	eax, eax
	je	SHORT $L72033
	push	1308					; 0000051cH
	push	OFFSET FLAT:$SG72034
	push	OFFSET FLAT:$SG72035
	mov	ecx, DWORD PTR _cntxt$[ebp]
	push	ecx
	call	_err_clear
	add	esp, 16					; 00000010H

; 1309 : 	else if(res)

	jmp	SHORT $L72040
$L72033:
	cmp	DWORD PTR _res$[ebp], 0
	je	SHORT $L72040

; 1311 : 		if(sql_get_table(cntxt, res, 2)) STACK_ERROR;

	push	2
	mov	edx, DWORD PTR _res$[ebp]
	push	edx
	mov	eax, DWORD PTR _cntxt$[ebp]
	push	eax
	call	_sql_get_table
	add	esp, 12					; 0000000cH
	test	eax, eax
	je	SHORT $L72038
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 1311		; 0000051fH
	jmp	SHORT $eva_err$72005
$L72038:

; 1312 : 		if(!res->nbrows) DYNTAB_SET(res, 0, 0, "0")

	mov	edx, DWORD PTR _res$[ebp]
	cmp	DWORD PTR [edx], 0
	jne	SHORT $L72040
	push	1
	push	OFFSET FLAT:$SG72041
	push	0
	push	0
	mov	eax, DWORD PTR _res$[ebp]
	push	eax
	call	_dyntab_set_txt
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L72040
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29872], OFFSET FLAT:$SG72043
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 1312		; 00000520H
	jmp	SHORT $eva_err$72005
$L72040:

; 1314 : 
; 1315 : 	/* Drop temporary tables */
; 1316 : 	drop_tmptables(cntxt, "V", nbtemp);

	mov	eax, DWORD PTR _nbtemp$[ebp]
	push	eax
	push	OFFSET FLAT:$SG72044
	mov	ecx, DWORD PTR _cntxt$[ebp]
	push	ecx
	call	_drop_tmptables
	add	esp, 12					; 0000000cH

; 1317 : 	sql_drop_table(cntxt, "TmpCondExpr");

	push	OFFSET FLAT:$SG72045
	mov	edx, DWORD PTR _cntxt$[ebp]
	push	edx
	call	_sql_drop_table
	add	esp, 8
$eva_noerr$72046:

; 1318 : 
; 1319 : 	RETURN_OK_CLEANUP;

	push	0
	push	OFFSET FLAT:$SG72047
	push	OFFSET FLAT:$SG72048
	mov	eax, DWORD PTR _cntxt$[ebp]
	push	eax
	call	_err_clear
	add	esp, 16					; 00000010H
$eva_err$72005:
	mov	ecx, DWORD PTR _cntxt$[ebp]
	cmp	DWORD PTR [ecx+29872], 0
	je	SHORT $L72049
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	eax, DWORD PTR [edx+29900]
	push	eax
	push	OFFSET FLAT:$SG72050
	push	OFFSET FLAT:$SG72051
	mov	ecx, DWORD PTR _cntxt$[ebp]
	push	ecx
	call	_err_add_context
	add	esp, 16					; 00000010H
$L72049:
	mov	edx, DWORD PTR _member$[ebp]
	push	edx
	call	_mem_free
	add	esp, 4
	mov	DWORD PTR _member$[ebp], 0
	mov	eax, DWORD PTR _join$[ebp]
	push	eax
	call	_mem_free
	add	esp, 4
	mov	DWORD PTR _join$[ebp], 0
	mov	ecx, DWORD PTR _sql$[ebp]
	push	ecx
	call	_mem_free
	add	esp, 4
	mov	DWORD PTR _sql$[ebp], 0
	mov	edx, DWORD PTR _cntxt$[ebp]
	xor	eax, eax
	cmp	DWORD PTR [edx+29872], 0
	setne	al

; 1320 : }

	mov	esp, ebp
	pop	ebp
	ret	0
_qry_filter_sql_fieldexpr ENDP
_TEXT	ENDS
PUBLIC	_qry_parse_filter_rel
PUBLIC	_qry_filter_objects
EXTRN	_atoi:NEAR
EXTRN	_qry_obj_field:NEAR
_BSS	SEGMENT
	ALIGN	4

$SG72172 DB	01H DUP (?)
_BSS	ENDS
_DATA	SEGMENT
	ORG $+3
$SG72075 DB	'_EVA_FILTER_RELTYPE', 00H
$SG72077 DB	'_EVA_FILTER_REL_OP', 00H
	ORG $+1
$SG72079 DB	'_EVA_FILTER_RELWITH', 00H
$SG72081 DB	'_EVA_RELREVERSE', 00H
$SG72083 DB	'_EVA_MULTILEVEL', 00H
$SG72088 DB	'_EVA_ISEMPTY', 00H
	ORG $+3
$SG72091 DB	' FROM TLink', 0aH, 'WHERE DateDel IS NULL AND IdField IN'
	DB	'(', 00H
	ORG $+2
$SG72092 DB	'IdObj', 00H
	ORG $+2
$SG72093 DB	'IdRelObj', 00H
	ORG $+3
$SG72094 DB	'-- qry_parse_filter_rel : read objects with given relati'
	DB	'on', 0aH, 'SELECT DISTINCT ', 00H
$SG72096 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG72100 DB	')', 00H
	ORG $+2
$SG72102 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG72110 DB	'_EVA_ISNOTEMPTY', 00H
$SG72123 DB	'_EVA_DIFFERENT', 00H
	ORG $+1
$SG72125 DB	'IdObj', 00H
	ORG $+2
$SG72127 DB	'IdRelObj', 00H
	ORG $+3
$SG72129 DB	'_EVA_MAX_LEVEL', 00H
	ORG $+1
$SG72131 DB	'IdRelObj', 00H
	ORG $+3
$SG72132 DB	'IdObj', 00H
	ORG $+2
$SG72136 DB	'_EVA_LISTOBJ', 00H
	ORG $+3
$SG72138 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG72141 DB	'_EVA_FILTER_LINKFIELD', 00H
	ORG $+2
$SG72143 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG72148 DB	'_EVA_FILTERS', 00H
	ORG $+3
$SG72150 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG72159 DB	0aH, 00H
	ORG $+2
$SG72160 DB	'-- Multilevel relation - level ', 00H
$SG72162 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG72165 DB	' FROM TLink WHERE DateDel IS NULL AND', 0aH, 00H
	ORG $+1
$SG72166 DB	'SELECT DISTINCT ', 00H
	ORG $+3
$SG72168 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG72171 DB	' IN(', 00H
	ORG $+3
$SG72174 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG72178 DB	' NOT IN (', 00H
	ORG $+2
$SG72179 DB	') AND', 0aH, 00H
	ORG $+1
$SG72181 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG72185 DB	')', 00H
	ORG $+2
$SG72187 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG72192 DB	' AND', 0aH, 'IdField NOT IN (', 00H
	ORG $+2
$SG72194 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG72198 DB	' AND', 0aH, 'IdField IN (', 00H
	ORG $+2
$SG72200 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG72204 DB	')', 00H
	ORG $+2
$SG72206 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG72214 DB	'_EVA_DIFFERENT', 00H
	ORG $+1
$SG72218 DB	'_EVA_LISTOBJ', 00H
	ORG $+3
$SG72220 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG72223 DB	'_EVA_FILTER_LINKFIELD', 00H
	ORG $+2
$SG72225 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG72233 DB	'%lu', 00H
$SG72237 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG72247 DB	'%lu', 00H
$SG72251 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG72256 DB	'_EVA_FILTERS', 00H
	ORG $+3
$SG72258 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG72265 DB	'_EVA_FILTER_TYPE', 00H
	ORG $+3
$SG72266 DB	'_EVA_FILTER_SQLCOND', 00H
$SG72283 DB	'Different operator is not handled yet for relation to ot'
	DB	'her filter result', 00H
	ORG $+2
$SG72301 DB	'D:\Travail\ABI\EVA\V4.0\CGI\Brunix-2016\qry_build.c', 00H
$SG72302 DB	'qry_parse_filter_rel', 00H
	ORG $+3
$SG72304 DB	'D:\Travail\ABI\EVA\V4.0\CGI\Brunix-2016\qry_build.c', 00H
$SG72305 DB	'qry_parse_filter_rel', 00H
_DATA	ENDS
_TEXT	SEGMENT
_cntxt$ = 8
_flt$ = 12
_field$ = 16
_flt_data$ = 20
_fltval$ = -28
_fltform$ = -4552
_data$ = -56
_flt1$ = -4524
_sql$ = -8
_objlist$ = -36
_node$ = -4
_reltype$ = -64
_fltoper$ = -32
_fltobjtyp$ = -4528
_rel$ = -4532
_b_multilevel$ = -60
_i$ = -68
_b_not$72122 = -4568
_obj$72124 = -4564
_relobj$72126 = -4560
_max_level$72128 = -4556
_b_not$72213 = -4572
__tmp$72231 = -4604
__tmp$72245 = -4636
_srcjoin$72253 = -4640
_qry_parse_filter_rel PROC NEAR

; 1340 : ){

	push	ebp
	mov	ebp, esp
	mov	eax, 4644				; 00001224H
	call	__chkstk
	push	edi

; 1341 : 	DynTable fltval = { 0 };

	mov	DWORD PTR _fltval$[ebp], 0
	xor	eax, eax
	mov	DWORD PTR _fltval$[ebp+4], eax
	mov	DWORD PTR _fltval$[ebp+8], eax
	mov	DWORD PTR _fltval$[ebp+12], eax
	mov	DWORD PTR _fltval$[ebp+16], eax

; 1342 : 	DynTable fltform = { 0 };

	mov	DWORD PTR _fltform$[ebp], 0
	xor	ecx, ecx
	mov	DWORD PTR _fltform$[ebp+4], ecx
	mov	DWORD PTR _fltform$[ebp+8], ecx
	mov	DWORD PTR _fltform$[ebp+12], ecx
	mov	DWORD PTR _fltform$[ebp+16], ecx

; 1343 : 	DynTable data = { 0 };

	mov	DWORD PTR _data$[ebp], 0
	xor	edx, edx
	mov	DWORD PTR _data$[ebp+4], edx
	mov	DWORD PTR _data$[ebp+8], edx
	mov	DWORD PTR _data$[ebp+12], edx
	mov	DWORD PTR _data$[ebp+16], edx

; 1344 : 	QryBuild flt1 = {{0}};

	mov	DWORD PTR _flt1$[ebp], 0
	xor	eax, eax
	mov	DWORD PTR _flt1$[ebp+4], eax
	mov	DWORD PTR _flt1$[ebp+8], eax
	mov	DWORD PTR _flt1$[ebp+12], eax
	mov	DWORD PTR _flt1$[ebp+16], eax
	mov	ecx, 1109				; 00000455H
	xor	eax, eax
	lea	edi, DWORD PTR _flt1$[ebp+20]
	rep stosd

; 1345 : 	DynBuffer *sql = NULL;

	mov	DWORD PTR _sql$[ebp], 0

; 1346 : 	DynBuffer *objlist = NULL;

	mov	DWORD PTR _objlist$[ebp], 0

; 1347 : 	QryBuilNode *node = flt->node + flt->nbnode;

	mov	ecx, DWORD PTR _flt$[ebp]
	mov	edx, DWORD PTR [ecx+4424]
	imul	edx, 136				; 00000088H
	mov	eax, DWORD PTR _flt$[ebp]
	lea	ecx, DWORD PTR [eax+edx+72]
	mov	DWORD PTR _node$[ebp], ecx

; 1348 : 	char *reltype = DYNTAB_FIELD_VAL(flt_data, FILTER_RELTYPE);

	push	0
	push	-1
	push	OFFSET FLAT:$SG72075
	mov	edx, DWORD PTR _flt_data$[ebp]
	push	edx
	call	_dyntab_field_val
	add	esp, 16					; 00000010H
	mov	DWORD PTR _reltype$[ebp], eax

; 1349 : 	char *fltoper = DYNTAB_FIELD_VAL(flt_data, FILTER_REL_OP);

	push	0
	push	-1
	push	OFFSET FLAT:$SG72077
	mov	eax, DWORD PTR _flt_data$[ebp]
	push	eax
	call	_dyntab_field_val
	add	esp, 16					; 00000010H
	mov	DWORD PTR _fltoper$[ebp], eax

; 1350 : 	char *fltobjtyp = DYNTAB_FIELD_VAL(flt_data, FILTER_RELWITH);

	push	0
	push	-1
	push	OFFSET FLAT:$SG72079
	mov	ecx, DWORD PTR _flt_data$[ebp]
	push	ecx
	call	_dyntab_field_val
	add	esp, 16					; 00000010H
	mov	DWORD PTR _fltobjtyp$[ebp], eax

; 1351 : 	RelationMode rel = !strcmp("_EVA_RELREVERSE", reltype) ? RelReverse : RelDirect;

	mov	edx, DWORD PTR _reltype$[ebp]
	push	edx
	push	OFFSET FLAT:$SG72081
	call	_strcmp
	add	esp, 8
	neg	eax
	sbb	eax, eax
	add	eax, 2
	mov	DWORD PTR _rel$[ebp], eax

; 1352 : 	int b_multilevel = atoi(DYNTAB_FIELD_VAL(flt_data, MULTILEVEL));

	push	0
	push	-1
	push	OFFSET FLAT:$SG72083
	mov	eax, DWORD PTR _flt_data$[ebp]
	push	eax
	call	_dyntab_field_val
	add	esp, 16					; 00000010H
	push	eax
	call	_atoi
	add	esp, 4
	mov	DWORD PTR _b_multilevel$[ebp], eax

; 1353 : 	unsigned long i;
; 1354 : 
; 1355 : 	/* Set node create condition */
; 1356 : 	if(qry_add_create_del_filter(cntxt, flt, flt_data)) STACK_ERROR;

	mov	ecx, DWORD PTR _flt_data$[ebp]
	push	ecx
	mov	edx, DWORD PTR _flt$[ebp]
	push	edx
	mov	eax, DWORD PTR _cntxt$[ebp]
	push	eax
	call	_qry_add_create_del_filter
	add	esp, 12					; 0000000cH
	test	eax, eax
	je	SHORT $L72085
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 1356		; 0000054cH
	jmp	$eva_err$72086
$L72085:

; 1357 : 
; 1358 : 	/* Handle match mode */
; 1359 : 	if(!strcmp(fltoper, "_EVA_ISEMPTY"))

	push	OFFSET FLAT:$SG72088
	mov	edx, DWORD PTR _fltoper$[ebp]
	push	edx
	call	_strcmp
	add	esp, 8
	test	eax, eax
	jne	$L72087

; 1363 : 			"-- qry_parse_filter_rel : read objects with given relation\n"
; 1364 : 			"SELECT DISTINCT ", rel == RelDirect ? "IdObj" : "IdRelObj", 0, NO_CONV, " FROM TLink\n"
; 1365 : 			"WHERE DateDel IS NULL AND IdField IN(");

	cmp	DWORD PTR _rel$[ebp], 1
	jne	SHORT $L74441
	mov	DWORD PTR -4644+[ebp], OFFSET FLAT:$SG72092
	jmp	SHORT $L74442
$L74441:
	mov	DWORD PTR -4644+[ebp], OFFSET FLAT:$SG72093
$L74442:
	push	49					; 00000031H
	push	OFFSET FLAT:$SG72091
	push	0
	push	0
	push	0
	mov	eax, DWORD PTR -4644+[ebp]
	push	eax
	push	75					; 0000004bH
	push	OFFSET FLAT:$SG72094
	lea	ecx, DWORD PTR _sql$[ebp]
	push	ecx
	call	_dynbuf_add3
	add	esp, 36					; 00000024H
	test	eax, eax
	je	SHORT $L72090
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29872], OFFSET FLAT:$SG72096
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 1365		; 00000555H
	jmp	$eva_err$72086
$L72090:

; 1366 : 		if(qry_values_list(cntxt, field, 3, &sql)) STACK_ERROR;

	lea	ecx, DWORD PTR _sql$[ebp]
	push	ecx
	push	3
	mov	edx, DWORD PTR _field$[ebp]
	push	edx
	mov	eax, DWORD PTR _cntxt$[ebp]
	push	eax
	call	_qry_values_list
	add	esp, 16					; 00000010H
	test	eax, eax
	je	SHORT $L72097
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 1366		; 00000556H
	jmp	$eva_err$72086
$L72097:

; 1367 : 		DYNBUF_ADD_STR(&sql, ")");

	push	0
	push	0
	push	1
	push	OFFSET FLAT:$SG72100
	lea	edx, DWORD PTR _sql$[ebp]
	push	edx
	call	_dynbuf_add
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L72099
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29872], OFFSET FLAT:$SG72102
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 1367		; 00000557H
	jmp	$eva_err$72086
$L72099:

; 1368 : 		if(sql_exec_query(cntxt, sql->data)) STACK_ERROR;

	mov	edx, DWORD PTR _sql$[ebp]
	add	edx, 8
	push	edx
	mov	eax, DWORD PTR _cntxt$[ebp]
	push	eax
	call	_sql_exec_query
	add	esp, 8
	test	eax, eax
	je	SHORT $L72103
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 1368		; 00000558H
	jmp	$eva_err$72086
$L72103:

; 1369 : 		if(sql_get_table(cntxt, &node->value, 2)) STACK_ERROR;

	push	2
	mov	edx, DWORD PTR _node$[ebp]
	add	edx, 32					; 00000020H
	push	edx
	mov	eax, DWORD PTR _cntxt$[ebp]
	push	eax
	call	_sql_get_table
	add	esp, 12					; 0000000cH
	test	eax, eax
	je	SHORT $L72104
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 1369		; 00000559H
	jmp	$eva_err$72086
$L72104:

; 1370 : 		if(qry_add_filter(cntxt, flt, RelNone, NULL, NotObjList, NULL)) STACK_ERROR;

	push	0
	push	2
	push	0
	push	0
	mov	edx, DWORD PTR _flt$[ebp]
	push	edx
	mov	eax, DWORD PTR _cntxt$[ebp]
	push	eax
	call	_qry_add_filter
	add	esp, 24					; 00000018H
	test	eax, eax
	je	SHORT $L72107
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 1370		; 0000055aH
	jmp	$eva_err$72086
$L72107:

; 1372 : 	else if(!strcmp(fltoper, "_EVA_ISNOTEMPTY"))

	jmp	$L72280
$L72087:
	push	OFFSET FLAT:$SG72110
	mov	edx, DWORD PTR _fltoper$[ebp]
	push	edx
	call	_strcmp
	add	esp, 8
	test	eax, eax
	jne	$L72109

; 1374 : 		/* Add nodes depending on relation type */
; 1375 : 		if(rel == RelDirect)

	cmp	DWORD PTR _rel$[ebp], 1
	jne	SHORT $L72111

; 1377 : 			/* Direct relation : use single node */
; 1378 : 			if(qry_add_filter(cntxt, flt, RelNone, field, NoMatch, NULL)) STACK_ERROR;

	push	0
	push	0
	mov	eax, DWORD PTR _field$[ebp]
	push	eax
	push	0
	mov	ecx, DWORD PTR _flt$[ebp]
	push	ecx
	mov	edx, DWORD PTR _cntxt$[ebp]
	push	edx
	call	_qry_add_filter
	add	esp, 24					; 00000018H
	test	eax, eax
	je	SHORT $L72113
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 1378		; 00000562H
	jmp	$eva_err$72086
$L72113:

; 1380 : 		else

	jmp	SHORT $L72114
$L72111:

; 1382 : 			/* Reverse relation : use 2 nodes / fields & values in second node */
; 1383 : 			if(qry_add_filter(cntxt, flt, RelReverse, NULL, NoMatch, NULL) ||
; 1384 : 				qry_add_create_del_filter(cntxt, flt, flt_data) ||
; 1385 : 				qry_add_filter(cntxt, flt, RelNone, field, NoMatch, NULL)) STACK_ERROR;

	push	0
	push	0
	push	0
	push	2
	mov	ecx, DWORD PTR _flt$[ebp]
	push	ecx
	mov	edx, DWORD PTR _cntxt$[ebp]
	push	edx
	call	_qry_add_filter
	add	esp, 24					; 00000018H
	test	eax, eax
	jne	SHORT $L72119
	mov	eax, DWORD PTR _flt_data$[ebp]
	push	eax
	mov	ecx, DWORD PTR _flt$[ebp]
	push	ecx
	mov	edx, DWORD PTR _cntxt$[ebp]
	push	edx
	call	_qry_add_create_del_filter
	add	esp, 12					; 0000000cH
	test	eax, eax
	jne	SHORT $L72119
	push	0
	push	0
	mov	eax, DWORD PTR _field$[ebp]
	push	eax
	push	0
	mov	ecx, DWORD PTR _flt$[ebp]
	push	ecx
	mov	edx, DWORD PTR _cntxt$[ebp]
	push	edx
	call	_qry_add_filter
	add	esp, 24					; 00000018H
	test	eax, eax
	je	SHORT $L72118
$L72119:
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 1385		; 00000569H
	jmp	$eva_err$72086
$L72118:

; 1386 : 			(node+1)->srcjoin = flt->nbnode - 2;

	mov	ecx, DWORD PTR _flt$[ebp]
	mov	edx, DWORD PTR [ecx+4424]
	sub	edx, 2
	mov	eax, DWORD PTR _node$[ebp]
	mov	DWORD PTR [eax+192], edx
$L72114:

; 1389 : 	else if(b_multilevel)

	jmp	$L72280
$L72109:
	cmp	DWORD PTR _b_multilevel$[ebp], 0
	je	$L72121

; 1391 : 		/* Handle multiple level relation */
; 1392 : 		int b_not = !strcmp(fltoper, "_EVA_DIFFERENT");

	push	OFFSET FLAT:$SG72123
	mov	ecx, DWORD PTR _fltoper$[ebp]
	push	ecx
	call	_strcmp
	add	esp, 8
	neg	eax
	sbb	eax, eax
	inc	eax
	mov	DWORD PTR _b_not$72122[ebp], eax

; 1393 : 		char *obj = "IdObj", *relobj = "IdRelObj";

	mov	DWORD PTR _obj$72124[ebp], OFFSET FLAT:$SG72125
	mov	DWORD PTR _relobj$72126[ebp], OFFSET FLAT:$SG72127

; 1394 : 		unsigned int max_level = atoi(DYNTAB_FIELD_VAL(flt_data, MAX_LEVEL));

	push	0
	push	-1
	push	OFFSET FLAT:$SG72129
	mov	edx, DWORD PTR _flt_data$[ebp]
	push	edx
	call	_dyntab_field_val
	add	esp, 16					; 00000010H
	push	eax
	call	_atoi
	add	esp, 4
	mov	DWORD PTR _max_level$72128[ebp], eax

; 1395 : 
; 1396 : 
; 1397 : 		/* Swap Obj/RelObj if reverse relation */
; 1398 : 		if(rel == RelDirect)

	cmp	DWORD PTR _rel$[ebp], 1
	jne	SHORT $L72130

; 1400 : 			obj = "IdRelObj"; relobj = "IdObj";

	mov	DWORD PTR _obj$72124[ebp], OFFSET FLAT:$SG72131
	mov	DWORD PTR _relobj$72126[ebp], OFFSET FLAT:$SG72132
$L72130:

; 1402 : 
; 1403 : 		/* Handle relation to what */
; 1404 : 		if(*fltobjtyp)

	mov	eax, DWORD PTR _fltobjtyp$[ebp]
	movsx	ecx, BYTE PTR [eax]
	test	ecx, ecx
	je	$L72133

; 1406 : 			/* Relation to given object : evaluate field expression */
; 1407 : 			GET_ATTR(fltform, LISTOBJ);

	lea	edx, DWORD PTR _fltform$[ebp]
	push	edx
	call	_dyntab_free
	add	esp, 4
	push	0
	push	-1
	push	OFFSET FLAT:$SG72136
	mov	eax, DWORD PTR _flt_data$[ebp]
	push	eax
	push	1
	lea	ecx, DWORD PTR _fltform$[ebp]
	push	ecx
	call	_dyntab_filter_field
	add	esp, 24					; 00000018H
	test	eax, eax
	je	SHORT $L72135
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29872], OFFSET FLAT:$SG72138
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 1407		; 0000057fH
	jmp	$eva_err$72086
$L72135:

; 1408 : 			GET_ATTR(fltval, FILTER_LINKFIELD);

	lea	ecx, DWORD PTR _fltval$[ebp]
	push	ecx
	call	_dyntab_free
	add	esp, 4
	push	0
	push	-1
	push	OFFSET FLAT:$SG72141
	mov	edx, DWORD PTR _flt_data$[ebp]
	push	edx
	push	1
	lea	eax, DWORD PTR _fltval$[ebp]
	push	eax
	call	_dyntab_filter_field
	add	esp, 24					; 00000018H
	test	eax, eax
	je	SHORT $L72140
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29872], OFFSET FLAT:$SG72143
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 1408		; 00000580H
	jmp	$eva_err$72086
$L72140:

; 1409 : 			if(form_eval_valtype(cntxt, &node->value, fltobjtyp, &fltform, &fltval)) STACK_ERROR;

	lea	eax, DWORD PTR _fltval$[ebp]
	push	eax
	lea	ecx, DWORD PTR _fltform$[ebp]
	push	ecx
	mov	edx, DWORD PTR _fltobjtyp$[ebp]
	push	edx
	mov	eax, DWORD PTR _node$[ebp]
	add	eax, 32					; 00000020H
	push	eax
	mov	ecx, DWORD PTR _cntxt$[ebp]
	push	ecx
	call	_form_eval_valtype
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L72144
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 1409		; 00000581H
	jmp	$eva_err$72086
$L72144:

; 1411 : 		else

	jmp	$L72151
$L72133:

; 1413 : 			/* Relation to objects matching other filter : evaluate filter */
; 1414 : 			GET_ATTR(fltval, FILTERS);

	lea	eax, DWORD PTR _fltval$[ebp]
	push	eax
	call	_dyntab_free
	add	esp, 4
	push	0
	push	-1
	push	OFFSET FLAT:$SG72148
	mov	ecx, DWORD PTR _flt_data$[ebp]
	push	ecx
	push	1
	lea	edx, DWORD PTR _fltval$[ebp]
	push	edx
	call	_dyntab_filter_field
	add	esp, 24					; 00000018H
	test	eax, eax
	je	SHORT $L72147
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29872], OFFSET FLAT:$SG72150
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 1414		; 00000586H
	jmp	$eva_err$72086
$L72147:

; 1415 : 			if(qry_add_filterlist(cntxt, &flt1, &fltval) ||
; 1416 : 				qry_filter_objects(cntxt, &node->value, &flt1)) STACK_ERROR;

	lea	edx, DWORD PTR _fltval$[ebp]
	push	edx
	lea	eax, DWORD PTR _flt1$[ebp]
	push	eax
	mov	ecx, DWORD PTR _cntxt$[ebp]
	push	ecx
	call	_qry_add_filterlist
	add	esp, 12					; 0000000cH
	test	eax, eax
	jne	SHORT $L72152
	lea	edx, DWORD PTR _flt1$[ebp]
	push	edx
	mov	eax, DWORD PTR _node$[ebp]
	add	eax, 32					; 00000020H
	push	eax
	mov	ecx, DWORD PTR _cntxt$[ebp]
	push	ecx
	call	_qry_filter_objects
	add	esp, 12					; 0000000cH
	test	eax, eax
	je	SHORT $L72151
$L72152:
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 1416		; 00000588H
	jmp	$eva_err$72086
$L72151:

; 1418 : 
; 1419 : 		/* Read related objects until no more found */
; 1420 : 		for(i = 0; !i || (cntxt->sql_nbrows && (!max_level || i < max_level)); i++)

	mov	DWORD PTR _i$[ebp], 0
	jmp	SHORT $L72153
$L72154:
	mov	eax, DWORD PTR _i$[ebp]
	add	eax, 1
	mov	DWORD PTR _i$[ebp], eax
$L72153:
	cmp	DWORD PTR _i$[ebp], 0
	je	SHORT $L72157
	mov	ecx, DWORD PTR _cntxt$[ebp]
	cmp	DWORD PTR [ecx+29848], 0
	je	$L72155
	cmp	DWORD PTR _max_level$72128[ebp], 0
	je	SHORT $L72157
	mov	edx, DWORD PTR _i$[ebp]
	cmp	edx, DWORD PTR _max_level$72128[ebp]
	jae	$L72155
$L72157:

; 1422 : 			M_FREE(sql);

	mov	eax, DWORD PTR _sql$[ebp]
	push	eax
	call	_mem_free
	add	esp, 4
	mov	DWORD PTR _sql$[ebp], 0

; 1423 : 			DYNBUF_ADD3_INT(&sql, "-- Multilevel relation - level ", i, "\n");

	push	1
	push	OFFSET FLAT:$SG72159
	mov	ecx, DWORD PTR _i$[ebp]
	push	ecx
	push	31					; 0000001fH
	push	OFFSET FLAT:$SG72160
	lea	edx, DWORD PTR _sql$[ebp]
	push	edx
	call	_dynbuf_add3_int
	add	esp, 24					; 00000018H
	test	eax, eax
	je	SHORT $L72158
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29872], OFFSET FLAT:$SG72162
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 1423		; 0000058fH
	jmp	$eva_err$72086
$L72158:

; 1424 : 			DYNBUF_ADD3(&sql, "SELECT DISTINCT ", relobj, 0, NO_CONV, " FROM TLink WHERE DateDel IS NULL AND\n");

	push	38					; 00000026H
	push	OFFSET FLAT:$SG72165
	push	0
	push	0
	push	0
	mov	edx, DWORD PTR _relobj$72126[ebp]
	push	edx
	push	16					; 00000010H
	push	OFFSET FLAT:$SG72166
	lea	eax, DWORD PTR _sql$[ebp]
	push	eax
	call	_dynbuf_add3
	add	esp, 36					; 00000024H
	test	eax, eax
	je	SHORT $L72164
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29872], OFFSET FLAT:$SG72168
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 1424		; 00000590H
	jmp	$eva_err$72086
$L72164:

; 1425 : 			DYNBUF_ADD3(&sql, "", obj, 0, NO_CONV, " IN(");

	push	4
	push	OFFSET FLAT:$SG72171
	push	0
	push	0
	push	0
	mov	eax, DWORD PTR _obj$72124[ebp]
	push	eax
	push	0
	push	OFFSET FLAT:$SG72172
	lea	ecx, DWORD PTR _sql$[ebp]
	push	ecx
	call	_dynbuf_add3
	add	esp, 36					; 00000024H
	test	eax, eax
	je	SHORT $L72170
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29872], OFFSET FLAT:$SG72174
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 1425		; 00000591H
	jmp	$eva_err$72086
$L72170:

; 1426 : 			if(qry_values_list(cntxt, &node->value, 0, &sql)) STACK_ERROR;

	lea	ecx, DWORD PTR _sql$[ebp]
	push	ecx
	push	0
	mov	edx, DWORD PTR _node$[ebp]
	add	edx, 32					; 00000020H
	push	edx
	mov	eax, DWORD PTR _cntxt$[ebp]
	push	eax
	call	_qry_values_list
	add	esp, 16					; 00000010H
	test	eax, eax
	je	SHORT $L72175
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 1426		; 00000592H
	jmp	$eva_err$72086
$L72175:

; 1427 : 			DYNBUF_ADD3(&sql, ") AND\n", relobj, 0, NO_CONV, " NOT IN (");

	push	9
	push	OFFSET FLAT:$SG72178
	push	0
	push	0
	push	0
	mov	edx, DWORD PTR _relobj$72126[ebp]
	push	edx
	push	6
	push	OFFSET FLAT:$SG72179
	lea	eax, DWORD PTR _sql$[ebp]
	push	eax
	call	_dynbuf_add3
	add	esp, 36					; 00000024H
	test	eax, eax
	je	SHORT $L72177
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29872], OFFSET FLAT:$SG72181
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 1427		; 00000593H
	jmp	$eva_err$72086
$L72177:

; 1428 : 			if(qry_values_list(cntxt, &node->value, 0, &sql)) STACK_ERROR;

	lea	eax, DWORD PTR _sql$[ebp]
	push	eax
	push	0
	mov	ecx, DWORD PTR _node$[ebp]
	add	ecx, 32					; 00000020H
	push	ecx
	mov	edx, DWORD PTR _cntxt$[ebp]
	push	edx
	call	_qry_values_list
	add	esp, 16					; 00000010H
	test	eax, eax
	je	SHORT $L72182
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 1428		; 00000594H
	jmp	$eva_err$72086
$L72182:

; 1429 : 			DYNBUF_ADD_STR(&sql, ")");

	push	0
	push	0
	push	1
	push	OFFSET FLAT:$SG72185
	lea	ecx, DWORD PTR _sql$[ebp]
	push	ecx
	call	_dynbuf_add
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L72184
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29872], OFFSET FLAT:$SG72187
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 1429		; 00000595H
	jmp	$eva_err$72086
$L72184:

; 1430 : 
; 1431 : 			/* Handle relation field */
; 1432 : 			if(field && field->nbrows)

	cmp	DWORD PTR _field$[ebp], 0
	je	$L72203
	mov	ecx, DWORD PTR _field$[ebp]
	cmp	DWORD PTR [ecx], 0
	je	$L72203

; 1434 : 				if(b_multilevel == 2)

	cmp	DWORD PTR _b_multilevel$[ebp], 2
	jne	SHORT $L72189

; 1435 : 					DYNBUF_ADD_STR(&sql, " AND\nIdField NOT IN (")

	push	0
	push	0
	push	21					; 00000015H
	push	OFFSET FLAT:$SG72192
	lea	edx, DWORD PTR _sql$[ebp]
	push	edx
	call	_dynbuf_add
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L72191
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29872], OFFSET FLAT:$SG72194
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 1435		; 0000059bH
	jmp	$eva_err$72086
$L72191:

; 1436 : 				else

	jmp	SHORT $L72197
$L72189:

; 1437 : 					DYNBUF_ADD_STR(&sql, " AND\nIdField IN (");

	push	0
	push	0
	push	17					; 00000011H
	push	OFFSET FLAT:$SG72198
	lea	edx, DWORD PTR _sql$[ebp]
	push	edx
	call	_dynbuf_add
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L72197
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29872], OFFSET FLAT:$SG72200
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 1437		; 0000059dH
	jmp	$eva_err$72086
$L72197:

; 1438 : 				if(qry_values_list(cntxt, field, 3, &sql)) STACK_ERROR;

	lea	edx, DWORD PTR _sql$[ebp]
	push	edx
	push	3
	mov	eax, DWORD PTR _field$[ebp]
	push	eax
	mov	ecx, DWORD PTR _cntxt$[ebp]
	push	ecx
	call	_qry_values_list
	add	esp, 16					; 00000010H
	test	eax, eax
	je	SHORT $L72201
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 1438		; 0000059eH
	jmp	$eva_err$72086
$L72201:

; 1439 : 				DYNBUF_ADD_STR(&sql, ")");

	push	0
	push	0
	push	1
	push	OFFSET FLAT:$SG72204
	lea	eax, DWORD PTR _sql$[ebp]
	push	eax
	call	_dynbuf_add
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L72203
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29872], OFFSET FLAT:$SG72206
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 1439		; 0000059fH
	jmp	$eva_err$72086
$L72203:

; 1441 : 			if(sql_exec_query(cntxt, sql->data) || sql_get_table(cntxt, &node->value, 0)) STACK_ERROR;

	mov	eax, DWORD PTR _sql$[ebp]
	add	eax, 8
	push	eax
	mov	ecx, DWORD PTR _cntxt$[ebp]
	push	ecx
	call	_sql_exec_query
	add	esp, 8
	test	eax, eax
	jne	SHORT $L72208
	push	0
	mov	edx, DWORD PTR _node$[ebp]
	add	edx, 32					; 00000020H
	push	edx
	mov	eax, DWORD PTR _cntxt$[ebp]
	push	eax
	call	_sql_get_table
	add	esp, 12					; 0000000cH
	test	eax, eax
	je	SHORT $L72207
$L72208:
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 1441		; 000005a1H
	jmp	$eva_err$72086
$L72207:

; 1442 : 		}

	jmp	$L72154
$L72155:

; 1443 : 		if(qry_add_filter(cntxt, flt, RelNone, NULL, b_not ? NotObjList : ObjList, NULL)) STACK_ERROR;

	push	0
	xor	edx, edx
	cmp	DWORD PTR _b_not$72122[ebp], 0
	setne	dl
	inc	edx
	push	edx
	push	0
	push	0
	mov	eax, DWORD PTR _flt$[ebp]
	push	eax
	mov	ecx, DWORD PTR _cntxt$[ebp]
	push	ecx
	call	_qry_add_filter
	add	esp, 24					; 00000018H
	test	eax, eax
	je	SHORT $L72211
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 1443		; 000005a3H
	jmp	$eva_err$72086
$L72211:

; 1445 : 	else

	jmp	$L72280
$L72121:

; 1447 : 		/* Relation to other objects - handle objects selection mode */
; 1448 : 		int b_not = !strcmp(fltoper, "_EVA_DIFFERENT");

	push	OFFSET FLAT:$SG72214
	mov	eax, DWORD PTR _fltoper$[ebp]
	push	eax
	call	_strcmp
	add	esp, 8
	neg	eax
	sbb	eax, eax
	inc	eax
	mov	DWORD PTR _b_not$72213[ebp], eax

; 1449 : 		if(*fltobjtyp)

	mov	ecx, DWORD PTR _fltobjtyp$[ebp]
	movsx	edx, BYTE PTR [ecx]
	test	edx, edx
	je	$L72215

; 1451 : 			/* Relation to given object : evaluate field expression */
; 1452 : 			GET_ATTR(fltform, LISTOBJ);

	lea	eax, DWORD PTR _fltform$[ebp]
	push	eax
	call	_dyntab_free
	add	esp, 4
	push	0
	push	-1
	push	OFFSET FLAT:$SG72218
	mov	ecx, DWORD PTR _flt_data$[ebp]
	push	ecx
	push	1
	lea	edx, DWORD PTR _fltform$[ebp]
	push	edx
	call	_dyntab_filter_field
	add	esp, 24					; 00000018H
	test	eax, eax
	je	SHORT $L72217
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29872], OFFSET FLAT:$SG72220
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 1452		; 000005acH
	jmp	$eva_err$72086
$L72217:

; 1453 : 			GET_ATTR(fltval, FILTER_LINKFIELD);

	lea	edx, DWORD PTR _fltval$[ebp]
	push	edx
	call	_dyntab_free
	add	esp, 4
	push	0
	push	-1
	push	OFFSET FLAT:$SG72223
	mov	eax, DWORD PTR _flt_data$[ebp]
	push	eax
	push	1
	lea	ecx, DWORD PTR _fltval$[ebp]
	push	ecx
	call	_dyntab_filter_field
	add	esp, 24					; 00000018H
	test	eax, eax
	je	SHORT $L72222
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29872], OFFSET FLAT:$SG72225
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 1453		; 000005adH
	jmp	$eva_err$72086
$L72222:

; 1454 : 
; 1455 : 			/* Add nodes depending on relation type */
; 1456 : 			if(rel == RelDirect)

	cmp	DWORD PTR _rel$[ebp], 1
	jne	$L72226

; 1458 : 				/* Direct relation : use single node */
; 1459 : 				if(form_eval_valtype(cntxt, &node->value, fltobjtyp, &fltform, &fltval) ||
; 1460 : 					qry_add_filter(cntxt, flt, RelNone, field, b_not ? NotRelList : RelList, NULL)) STACK_ERROR;

	lea	ecx, DWORD PTR _fltval$[ebp]
	push	ecx
	lea	edx, DWORD PTR _fltform$[ebp]
	push	edx
	mov	eax, DWORD PTR _fltobjtyp$[ebp]
	push	eax
	mov	ecx, DWORD PTR _node$[ebp]
	add	ecx, 32					; 00000020H
	push	ecx
	mov	edx, DWORD PTR _cntxt$[ebp]
	push	edx
	call	_form_eval_valtype
	add	esp, 20					; 00000014H
	test	eax, eax
	jne	SHORT $L72229
	push	0
	xor	eax, eax
	cmp	DWORD PTR _b_not$72213[ebp], 0
	setne	al
	add	eax, 3
	push	eax
	mov	ecx, DWORD PTR _field$[ebp]
	push	ecx
	push	0
	mov	edx, DWORD PTR _flt$[ebp]
	push	edx
	mov	eax, DWORD PTR _cntxt$[ebp]
	push	eax
	call	_qry_add_filter
	add	esp, 24					; 00000018H
	test	eax, eax
	je	SHORT $L72228
$L72229:
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 1460		; 000005b4H
	jmp	$eva_err$72086
$L72228:

; 1461 : 				if(!node->value.nbrows) DYNTAB_ADD_INT(&node->value, 0, 0, (unsigned long int)0);

	mov	edx, DWORD PTR _node$[ebp]
	cmp	DWORD PTR [edx+32], 0
	jne	SHORT $L72235
	mov	BYTE PTR __tmp$72231[ebp], 0
	mov	ecx, 7
	xor	eax, eax
	lea	edi, DWORD PTR __tmp$72231[ebp+1]
	rep stosd
	stosw
	stosb
	push	0
	push	OFFSET FLAT:$SG72233
	lea	eax, DWORD PTR __tmp$72231[ebp]
	push	eax
	call	_sprintf
	add	esp, 12					; 0000000cH
	push	0
	push	0
	push	0
	lea	ecx, DWORD PTR __tmp$72231[ebp]
	push	ecx
	push	0
	push	0
	mov	edx, DWORD PTR _node$[ebp]
	add	edx, 32					; 00000020H
	push	edx
	call	_dyntab_add
	add	esp, 28					; 0000001cH
	test	eax, eax
	je	SHORT $L72235
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29872], OFFSET FLAT:$SG72237
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 1461		; 000005b5H
	jmp	$eva_err$72086
$L72235:

; 1463 : 			else

	jmp	$L72238
$L72226:

; 1465 : 				/* Reverse relation : use 2 nodes / fields & values in second node */
; 1466 : 				if(qry_add_filter(cntxt, flt, RelReverse, NULL, NoMatch, NULL) ||
; 1467 : 					form_eval_valtype(cntxt, &(node+1)->value, fltobjtyp, &fltform, &fltval) ||
; 1468 : 					qry_add_create_del_filter(cntxt, flt, flt_data) ||
; 1469 : 					qry_add_filter(cntxt, flt, RelNone, field, b_not ? NotObjList : ObjList, NULL)) STACK_ERROR;

	push	0
	push	0
	push	0
	push	2
	mov	edx, DWORD PTR _flt$[ebp]
	push	edx
	mov	eax, DWORD PTR _cntxt$[ebp]
	push	eax
	call	_qry_add_filter
	add	esp, 24					; 00000018H
	test	eax, eax
	jne	SHORT $L72243
	lea	ecx, DWORD PTR _fltval$[ebp]
	push	ecx
	lea	edx, DWORD PTR _fltform$[ebp]
	push	edx
	mov	eax, DWORD PTR _fltobjtyp$[ebp]
	push	eax
	mov	ecx, DWORD PTR _node$[ebp]
	add	ecx, 168				; 000000a8H
	push	ecx
	mov	edx, DWORD PTR _cntxt$[ebp]
	push	edx
	call	_form_eval_valtype
	add	esp, 20					; 00000014H
	test	eax, eax
	jne	SHORT $L72243
	mov	eax, DWORD PTR _flt_data$[ebp]
	push	eax
	mov	ecx, DWORD PTR _flt$[ebp]
	push	ecx
	mov	edx, DWORD PTR _cntxt$[ebp]
	push	edx
	call	_qry_add_create_del_filter
	add	esp, 12					; 0000000cH
	test	eax, eax
	jne	SHORT $L72243
	push	0
	xor	eax, eax
	cmp	DWORD PTR _b_not$72213[ebp], 0
	setne	al
	inc	eax
	push	eax
	mov	ecx, DWORD PTR _field$[ebp]
	push	ecx
	push	0
	mov	edx, DWORD PTR _flt$[ebp]
	push	edx
	mov	eax, DWORD PTR _cntxt$[ebp]
	push	eax
	call	_qry_add_filter
	add	esp, 24					; 00000018H
	test	eax, eax
	je	SHORT $L72242
$L72243:
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 1469		; 000005bdH
	jmp	$eva_err$72086
$L72242:

; 1470 : 				if(!(node+1)->value.nbrows) DYNTAB_ADD_INT(&(node+1)->value, 0, 0, (unsigned long int)0);

	mov	edx, DWORD PTR _node$[ebp]
	cmp	DWORD PTR [edx+168], 0
	jne	SHORT $L72249
	mov	BYTE PTR __tmp$72245[ebp], 0
	mov	ecx, 7
	xor	eax, eax
	lea	edi, DWORD PTR __tmp$72245[ebp+1]
	rep stosd
	stosw
	stosb
	push	0
	push	OFFSET FLAT:$SG72247
	lea	eax, DWORD PTR __tmp$72245[ebp]
	push	eax
	call	_sprintf
	add	esp, 12					; 0000000cH
	push	0
	push	0
	push	0
	lea	ecx, DWORD PTR __tmp$72245[ebp]
	push	ecx
	push	0
	push	0
	mov	edx, DWORD PTR _node$[ebp]
	add	edx, 168				; 000000a8H
	push	edx
	call	_dyntab_add
	add	esp, 28					; 0000001cH
	test	eax, eax
	je	SHORT $L72249
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29872], OFFSET FLAT:$SG72251
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 1470		; 000005beH
	jmp	$eva_err$72086
$L72249:

; 1471 : 				(node+1)->srcjoin = flt->nbnode - 2;

	mov	edx, DWORD PTR _flt$[ebp]
	mov	eax, DWORD PTR [edx+4424]
	sub	eax, 2
	mov	ecx, DWORD PTR _node$[ebp]
	mov	DWORD PTR [ecx+192], eax
$L72238:

; 1474 : 		else

	jmp	$L72280
$L72215:

; 1476 : 			/* Relation to objects matching other filter */
; 1477 : 			unsigned long srcjoin;
; 1478 : 			GET_ATTR(fltval, FILTERS);

	lea	edx, DWORD PTR _fltval$[ebp]
	push	edx
	call	_dyntab_free
	add	esp, 4
	push	0
	push	-1
	push	OFFSET FLAT:$SG72256
	mov	eax, DWORD PTR _flt_data$[ebp]
	push	eax
	push	1
	lea	ecx, DWORD PTR _fltval$[ebp]
	push	ecx
	call	_dyntab_filter_field
	add	esp, 24					; 00000018H
	test	eax, eax
	je	SHORT $L72255
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29872], OFFSET FLAT:$SG72258
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 1478		; 000005c6H
	jmp	$eva_err$72086
$L72255:

; 1479 : 
; 1480 : 			/* Optimize : check for SQL expression in filters */
; 1481 : 			for(i = 1, srcjoin = 0; i < fltval.nbrows && !srcjoin; i++)

	mov	DWORD PTR _i$[ebp], 1
	mov	DWORD PTR _srcjoin$72253[ebp], 0
	jmp	SHORT $L72259
$L72260:
	mov	ecx, DWORD PTR _i$[ebp]
	add	ecx, 1
	mov	DWORD PTR _i$[ebp], ecx
$L72259:
	mov	edx, DWORD PTR _i$[ebp]
	cmp	edx, DWORD PTR _fltval$[ebp]
	jae	$L72261
	cmp	DWORD PTR _srcjoin$72253[ebp], 0
	jne	SHORT $L72261

; 1483 : 				if(qry_obj_field(cntxt, &data, DYNTAB_TOULRC(&fltval, i, 0), NULL)) STACK_ERROR;

	push	0
	push	10					; 0000000aH
	push	0
	push	0
	mov	eax, DWORD PTR _i$[ebp]
	push	eax
	lea	ecx, DWORD PTR _fltval$[ebp]
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
	call	_qry_obj_field
	add	esp, 16					; 00000010H
	test	eax, eax
	je	SHORT $L72264
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 1483		; 000005cbH
	jmp	$eva_err$72086
$L72264:

; 1484 : 				srcjoin = !strcmp("_EVA_FILTER_SQLCOND", DYNTAB_FIELD_VAL(&data, FILTER_TYPE));

	push	0
	push	-1
	push	OFFSET FLAT:$SG72265
	lea	edx, DWORD PTR _data$[ebp]
	push	edx
	call	_dyntab_field_val
	add	esp, 16					; 00000010H
	push	eax
	push	OFFSET FLAT:$SG72266
	call	_strcmp
	add	esp, 8
	neg	eax
	sbb	eax, eax
	inc	eax
	mov	DWORD PTR _srcjoin$72253[ebp], eax

; 1485 : 			}

	jmp	$L72260
$L72261:

; 1486 : 			if(srcjoin)

	cmp	DWORD PTR _srcjoin$72253[ebp], 0
	je	$L72267

; 1488 : 				/* SQL expression : evaluate filters first */
; 1489 : 				qry_build_free(&flt1);

	lea	eax, DWORD PTR _flt1$[ebp]
	push	eax
	call	_qry_build_free
	add	esp, 4

; 1490 : 				DYNTAB_FREE(data);

	lea	ecx, DWORD PTR _data$[ebp]
	push	ecx
	call	_dyntab_free
	add	esp, 4

; 1491 : 				if(qry_add_filterlist(cntxt, &flt1, &fltval) ||
; 1492 : 					qry_build_clauses(cntxt, &flt1, 0) ||
; 1493 : 					qry_build_flt_select(cntxt, &sql, &data, &flt1, 0, 0) ||
; 1494 : 					sql_exec_query(cntxt, sql->data)) STACK_ERROR;

	lea	edx, DWORD PTR _fltval$[ebp]
	push	edx
	lea	eax, DWORD PTR _flt1$[ebp]
	push	eax
	mov	ecx, DWORD PTR _cntxt$[ebp]
	push	ecx
	call	_qry_add_filterlist
	add	esp, 12					; 0000000cH
	test	eax, eax
	jne	SHORT $L72269
	push	0
	lea	edx, DWORD PTR _flt1$[ebp]
	push	edx
	mov	eax, DWORD PTR _cntxt$[ebp]
	push	eax
	call	_qry_build_clauses
	add	esp, 12					; 0000000cH
	test	eax, eax
	jne	SHORT $L72269
	push	0
	push	0
	lea	ecx, DWORD PTR _flt1$[ebp]
	push	ecx
	lea	edx, DWORD PTR _data$[ebp]
	push	edx
	lea	eax, DWORD PTR _sql$[ebp]
	push	eax
	mov	ecx, DWORD PTR _cntxt$[ebp]
	push	ecx
	call	_qry_build_flt_select
	add	esp, 24					; 00000018H
	test	eax, eax
	jne	SHORT $L72269
	mov	edx, DWORD PTR _sql$[ebp]
	add	edx, 8
	push	edx
	mov	eax, DWORD PTR _cntxt$[ebp]
	push	eax
	call	_sql_exec_query
	add	esp, 8
	test	eax, eax
	je	SHORT $L72268
$L72269:
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 1494		; 000005d6H
	jmp	$eva_err$72086
$L72268:

; 1495 : 
; 1496 : 				/* Add nodes depending on relation type */
; 1497 : 				if(rel == RelDirect)

	cmp	DWORD PTR _rel$[ebp], 1
	jne	SHORT $L72270

; 1499 : 					/* Direct relation : use single node */
; 1500 : 					if(sql_get_table(cntxt, &node->value, 2) ||
; 1501 : 						qry_add_filter(cntxt, flt, RelNone, field, b_not ? NotRelList : RelList, NULL)) STACK_ERROR;

	push	2
	mov	edx, DWORD PTR _node$[ebp]
	add	edx, 32					; 00000020H
	push	edx
	mov	eax, DWORD PTR _cntxt$[ebp]
	push	eax
	call	_sql_get_table
	add	esp, 12					; 0000000cH
	test	eax, eax
	jne	SHORT $L72273
	push	0
	xor	ecx, ecx
	cmp	DWORD PTR _b_not$72213[ebp], 0
	setne	cl
	add	ecx, 3
	push	ecx
	mov	edx, DWORD PTR _field$[ebp]
	push	edx
	push	0
	mov	eax, DWORD PTR _flt$[ebp]
	push	eax
	mov	ecx, DWORD PTR _cntxt$[ebp]
	push	ecx
	call	_qry_add_filter
	add	esp, 24					; 00000018H
	test	eax, eax
	je	SHORT $L72272
$L72273:
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 1501		; 000005ddH
	jmp	$eva_err$72086
$L72272:

; 1503 : 				else

	jmp	$L72274
$L72270:

; 1505 : 					/* Reverse relation : use 2 nodes / fields & values in second node */
; 1506 : 					if(qry_add_filter(cntxt, flt, RelReverse, NULL, NoMatch, NULL) ||
; 1507 : 						sql_get_table(cntxt, &(node+1)->value, 2) ||
; 1508 : 						qry_add_create_del_filter(cntxt, flt, flt_data) ||
; 1509 : 						qry_add_filter(cntxt, flt, RelNone, field, b_not ? NotObjList : ObjList, NULL)) STACK_ERROR;

	push	0
	push	0
	push	0
	push	2
	mov	eax, DWORD PTR _flt$[ebp]
	push	eax
	mov	ecx, DWORD PTR _cntxt$[ebp]
	push	ecx
	call	_qry_add_filter
	add	esp, 24					; 00000018H
	test	eax, eax
	jne	SHORT $L72279
	push	2
	mov	edx, DWORD PTR _node$[ebp]
	add	edx, 168				; 000000a8H
	push	edx
	mov	eax, DWORD PTR _cntxt$[ebp]
	push	eax
	call	_sql_get_table
	add	esp, 12					; 0000000cH
	test	eax, eax
	jne	SHORT $L72279
	mov	ecx, DWORD PTR _flt_data$[ebp]
	push	ecx
	mov	edx, DWORD PTR _flt$[ebp]
	push	edx
	mov	eax, DWORD PTR _cntxt$[ebp]
	push	eax
	call	_qry_add_create_del_filter
	add	esp, 12					; 0000000cH
	test	eax, eax
	jne	SHORT $L72279
	push	0
	xor	ecx, ecx
	cmp	DWORD PTR _b_not$72213[ebp], 0
	setne	cl
	inc	ecx
	push	ecx
	mov	edx, DWORD PTR _field$[ebp]
	push	edx
	push	0
	mov	eax, DWORD PTR _flt$[ebp]
	push	eax
	mov	ecx, DWORD PTR _cntxt$[ebp]
	push	ecx
	call	_qry_add_filter
	add	esp, 24					; 00000018H
	test	eax, eax
	je	SHORT $L72278
$L72279:
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 1509		; 000005e5H
	jmp	$eva_err$72086
$L72278:

; 1510 : 					(node+1)->srcjoin = flt->nbnode - 2;

	mov	eax, DWORD PTR _flt$[ebp]
	mov	ecx, DWORD PTR [eax+4424]
	sub	ecx, 2
	mov	edx, DWORD PTR _node$[ebp]
	mov	DWORD PTR [edx+192], ecx
$L72274:

; 1513 : 			else

	jmp	$L72280
$L72267:

; 1515 : 				/* Handle operator */
; 1516 : 				if(b_not) RETURN_ERROR("Different operator is not handled yet for relation to other filter result", NOP);

	cmp	DWORD PTR _b_not$72213[ebp], 0
	je	SHORT $L72281
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29872], OFFSET FLAT:$SG72283
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 1516		; 000005ecH
	jmp	$eva_err$72086
$L72281:

; 1517 : 
; 1518 : 				/* Add nodes depending on relation type */
; 1519 : 				if(rel == RelDirect)

	cmp	DWORD PTR _rel$[ebp], 1
	jne	SHORT $L72284

; 1521 : 					/* Direct relation : use single node */
; 1522 : 					if(qry_add_filter(cntxt, flt, RelDirect, field, NoMatch, NULL)) STACK_ERROR;

	push	0
	push	0
	mov	edx, DWORD PTR _field$[ebp]
	push	edx
	push	1
	mov	eax, DWORD PTR _flt$[ebp]
	push	eax
	mov	ecx, DWORD PTR _cntxt$[ebp]
	push	ecx
	call	_qry_add_filter
	add	esp, 24					; 00000018H
	test	eax, eax
	je	SHORT $L72286
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 1522		; 000005f2H
	jmp	$eva_err$72086
$L72286:

; 1524 : 				else

	jmp	SHORT $L72287
$L72284:

; 1526 : 					/* Reverse relation : use 2 nodes / fields & values in second node */
; 1527 : 					if(qry_add_filter(cntxt, flt, RelReverse, NULL, NoMatch, NULL) ||
; 1528 : 						qry_add_create_del_filter(cntxt, flt, flt_data) ||
; 1529 : 						qry_add_filter(cntxt, flt, RelNone, field, NoMatch, NULL)) STACK_ERROR;

	push	0
	push	0
	push	0
	push	2
	mov	eax, DWORD PTR _flt$[ebp]
	push	eax
	mov	ecx, DWORD PTR _cntxt$[ebp]
	push	ecx
	call	_qry_add_filter
	add	esp, 24					; 00000018H
	test	eax, eax
	jne	SHORT $L72292
	mov	edx, DWORD PTR _flt_data$[ebp]
	push	edx
	mov	eax, DWORD PTR _flt$[ebp]
	push	eax
	mov	ecx, DWORD PTR _cntxt$[ebp]
	push	ecx
	call	_qry_add_create_del_filter
	add	esp, 12					; 0000000cH
	test	eax, eax
	jne	SHORT $L72292
	push	0
	push	0
	mov	edx, DWORD PTR _field$[ebp]
	push	edx
	push	0
	mov	eax, DWORD PTR _flt$[ebp]
	push	eax
	mov	ecx, DWORD PTR _cntxt$[ebp]
	push	ecx
	call	_qry_add_filter
	add	esp, 24					; 00000018H
	test	eax, eax
	je	SHORT $L72291
$L72292:
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 1529		; 000005f9H
	jmp	$eva_err$72086
$L72291:

; 1530 : 					(node+1)->srcjoin = flt->nbnode - 2;

	mov	eax, DWORD PTR _flt$[ebp]
	mov	ecx, DWORD PTR [eax+4424]
	sub	ecx, 2
	mov	edx, DWORD PTR _node$[ebp]
	mov	DWORD PTR [edx+192], ecx
$L72287:

; 1532 : 
; 1533 : 				/* Add nodes for other filters */
; 1534 : 				srcjoin = flt->nbnode - 1;

	mov	eax, DWORD PTR _flt$[ebp]
	mov	ecx, DWORD PTR [eax+4424]
	sub	ecx, 1
	mov	DWORD PTR _srcjoin$72253[ebp], ecx

; 1535 : 				for(i = 0; i < fltval.nbrows; i++)

	mov	DWORD PTR _i$[ebp], 0
	jmp	SHORT $L72293
$L72294:
	mov	edx, DWORD PTR _i$[ebp]
	add	edx, 1
	mov	DWORD PTR _i$[ebp], edx
$L72293:
	mov	eax, DWORD PTR _i$[ebp]
	cmp	eax, DWORD PTR _fltval$[ebp]
	jae	SHORT $L72295

; 1537 : 					flt->srcjoin = srcjoin;

	mov	ecx, DWORD PTR _flt$[ebp]
	mov	edx, DWORD PTR _srcjoin$72253[ebp]
	mov	DWORD PTR [ecx+64], edx

; 1538 : 					if(qry_obj_field(cntxt, &data, DYNTAB_TOULRC(&fltval, i, 0), NULL) ||
; 1539 : 						qry_parse_filter_nodes(cntxt, flt, &data)) STACK_ERROR;

	push	0
	push	10					; 0000000aH
	push	0
	push	0
	mov	eax, DWORD PTR _i$[ebp]
	push	eax
	lea	ecx, DWORD PTR _fltval$[ebp]
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
	call	_qry_obj_field
	add	esp, 16					; 00000010H
	test	eax, eax
	jne	SHORT $L72299
	lea	ecx, DWORD PTR _data$[ebp]
	push	ecx
	mov	edx, DWORD PTR _flt$[ebp]
	push	edx
	mov	eax, DWORD PTR _cntxt$[ebp]
	push	eax
	call	_qry_parse_filter_nodes
	add	esp, 12					; 0000000cH
	test	eax, eax
	je	SHORT $L72298
$L72299:
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 1539		; 00000603H
	jmp	SHORT $eva_err$72086
$L72298:

; 1540 : 				}

	jmp	SHORT $L72294
$L72295:

; 1541 : 				flt->srcjoin = srcjoin;

	mov	edx, DWORD PTR _flt$[ebp]
	mov	eax, DWORD PTR _srcjoin$72253[ebp]
	mov	DWORD PTR [edx+64], eax
$L72280:
$eva_noerr$72300:

; 1545 : 
; 1546 : 	RETURN_OK_CLEANUP;

	push	0
	push	OFFSET FLAT:$SG72301
	push	OFFSET FLAT:$SG72302
	mov	ecx, DWORD PTR _cntxt$[ebp]
	push	ecx
	call	_err_clear
	add	esp, 16					; 00000010H
$eva_err$72086:
	mov	edx, DWORD PTR _cntxt$[ebp]
	cmp	DWORD PTR [edx+29872], 0
	je	SHORT $L72303
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	ecx, DWORD PTR [eax+29900]
	push	ecx
	push	OFFSET FLAT:$SG72304
	push	OFFSET FLAT:$SG72305
	mov	edx, DWORD PTR _cntxt$[ebp]
	push	edx
	call	_err_add_context
	add	esp, 16					; 00000010H
$L72303:
	lea	eax, DWORD PTR _fltval$[ebp]
	push	eax
	call	_dyntab_free
	add	esp, 4
	lea	ecx, DWORD PTR _fltform$[ebp]
	push	ecx
	call	_dyntab_free
	add	esp, 4
	lea	edx, DWORD PTR _data$[ebp]
	push	edx
	call	_dyntab_free
	add	esp, 4
	mov	eax, DWORD PTR _sql$[ebp]
	push	eax
	call	_mem_free
	add	esp, 4
	mov	DWORD PTR _sql$[ebp], 0
	mov	ecx, DWORD PTR _objlist$[ebp]
	push	ecx
	call	_mem_free
	add	esp, 4
	mov	DWORD PTR _objlist$[ebp], 0
	lea	edx, DWORD PTR _flt1$[ebp]
	push	edx
	call	_qry_build_free
	add	esp, 4
	mov	eax, DWORD PTR _cntxt$[ebp]
	xor	ecx, ecx
	cmp	DWORD PTR [eax+29872], 0
	setne	cl
	mov	eax, ecx

; 1547 : }

	pop	edi
	mov	esp, ebp
	pop	ebp
	ret	0
_qry_parse_filter_rel ENDP
_TEXT	ENDS
PUBLIC	_qry_eval_var_expr_table
_DATA	SEGMENT
	ORG $+3
$SG72324 DB	'[%', 00H
	ORG $+1
$SG72332 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG72338 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG72341 DB	'D:\Travail\ABI\EVA\V4.0\CGI\Brunix-2016\qry_build.c', 00H
$SG72342 DB	'qry_eval_var_expr_table', 00H
$SG72344 DB	'D:\Travail\ABI\EVA\V4.0\CGI\Brunix-2016\qry_build.c', 00H
$SG72345 DB	'qry_eval_var_expr_table', 00H
_DATA	ENDS
_TEXT	SEGMENT
_cntxt$ = 8
_varexpr$ = 12
_var_data$ = 16
_expr$ = -4
_i$ = -8
_vexpr$72322 = -12
_qry_eval_var_expr_table PROC NEAR

; 1561 : ){

	push	ebp
	mov	ebp, esp
	sub	esp, 12					; 0000000cH

; 1562 : 	DynBuffer *expr = NULL;

	mov	DWORD PTR _expr$[ebp], 0

; 1563 : 	unsigned long i;
; 1564 : 
; 1565 : 	for(i = 0; i < varexpr->nbrows; i++)

	mov	DWORD PTR _i$[ebp], 0
	jmp	SHORT $L72319
$L72320:
	mov	eax, DWORD PTR _i$[ebp]
	add	eax, 1
	mov	DWORD PTR _i$[ebp], eax
$L72319:
	mov	ecx, DWORD PTR _varexpr$[ebp]
	mov	edx, DWORD PTR _i$[ebp]
	cmp	edx, DWORD PTR [ecx]
	jae	$eva_noerr$72340

; 1567 : 		char *vexpr = dyntab_val(varexpr, i, 0);

	push	0
	mov	eax, DWORD PTR _i$[ebp]
	push	eax
	mov	ecx, DWORD PTR _varexpr$[ebp]
	push	ecx
	call	_dyntab_val
	add	esp, 12					; 0000000cH
	mov	DWORD PTR _vexpr$72322[ebp], eax

; 1568 : 		if(strstr(vexpr, "[%"))

	push	OFFSET FLAT:$SG72324
	mov	edx, DWORD PTR _vexpr$72322[ebp]
	push	edx
	call	_strstr
	add	esp, 8
	test	eax, eax
	je	$L72339

; 1570 : 			if(qry_eval_sqlexpr_var(cntxt, &expr, vexpr, var_data, NULL)) STACK_ERROR;

	push	0
	mov	eax, DWORD PTR _var_data$[ebp]
	push	eax
	mov	ecx, DWORD PTR _vexpr$72322[ebp]
	push	ecx
	lea	edx, DWORD PTR _expr$[ebp]
	push	edx
	mov	eax, DWORD PTR _cntxt$[ebp]
	push	eax
	call	_qry_eval_sqlexpr_var
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L72326
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 1570		; 00000622H
	jmp	$eva_err$72327
$L72326:

; 1571 : 			DYNTAB_ADD_BUF(varexpr, i, 0, expr);

	cmp	DWORD PTR _expr$[ebp], 0
	je	SHORT $L72328
	mov	edx, DWORD PTR _expr$[ebp]
	cmp	DWORD PTR [edx+4], 0
	je	SHORT $L72328
	push	0
	push	0
	mov	eax, DWORD PTR _expr$[ebp]
	mov	ecx, DWORD PTR [eax+4]
	push	ecx
	mov	edx, DWORD PTR _expr$[ebp]
	add	edx, 8
	push	edx
	push	0
	mov	eax, DWORD PTR _i$[ebp]
	push	eax
	mov	ecx, DWORD PTR _varexpr$[ebp]
	push	ecx
	call	_dyntab_add
	add	esp, 28					; 0000001cH
	test	eax, eax
	je	SHORT $L72330
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29872], OFFSET FLAT:$SG72332
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 1571		; 00000623H
	jmp	SHORT $eva_err$72327
$L72330:
	jmp	SHORT $L72336
$L72328:
	push	0
	push	0
	push	0
	push	0
	push	0
	mov	ecx, DWORD PTR _i$[ebp]
	push	ecx
	mov	edx, DWORD PTR _varexpr$[ebp]
	push	edx
	call	_dyntab_add
	add	esp, 28					; 0000001cH
	test	eax, eax
	je	SHORT $L72336
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29872], OFFSET FLAT:$SG72338
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 1571		; 00000623H
	jmp	SHORT $eva_err$72327
$L72336:

; 1572 : 			if(expr) expr->cnt = 0;

	cmp	DWORD PTR _expr$[ebp], 0
	je	SHORT $L72339
	mov	edx, DWORD PTR _expr$[ebp]
	mov	DWORD PTR [edx+4], 0
$L72339:

; 1574 : 	}

	jmp	$L72320
$eva_noerr$72340:

; 1575 : 
; 1576 : 	RETURN_OK_CLEANUP;

	push	0
	push	OFFSET FLAT:$SG72341
	push	OFFSET FLAT:$SG72342
	mov	eax, DWORD PTR _cntxt$[ebp]
	push	eax
	call	_err_clear
	add	esp, 16					; 00000010H
$eva_err$72327:
	mov	ecx, DWORD PTR _cntxt$[ebp]
	cmp	DWORD PTR [ecx+29872], 0
	je	SHORT $L72343
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	eax, DWORD PTR [edx+29900]
	push	eax
	push	OFFSET FLAT:$SG72344
	push	OFFSET FLAT:$SG72345
	mov	ecx, DWORD PTR _cntxt$[ebp]
	push	ecx
	call	_err_add_context
	add	esp, 16					; 00000010H
$L72343:
	mov	edx, DWORD PTR _expr$[ebp]
	push	edx
	call	_mem_free
	add	esp, 4
	mov	DWORD PTR _expr$[ebp], 0
	mov	eax, DWORD PTR _cntxt$[ebp]
	xor	ecx, ecx
	cmp	DWORD PTR [eax+29872], 0
	setne	cl
	mov	eax, ecx

; 1577 : }

	mov	esp, ebp
	pop	ebp
	ret	0
_qry_eval_var_expr_table ENDP
_TEXT	ENDS
PUBLIC	_qry_parse_filter_val
_DATA	SEGMENT
$SG72367 DB	'_EVA_FILTER_OP', 00H
	ORG $+1
$SG72369 DB	'_EVA_FILTER_VAL_TYPE', 00H
	ORG $+3
$SG72371 DB	'_EVA_COMPARE_MODE', 00H
	ORG $+2
$SG72376 DB	'_EVA_LISTOBJ', 00H
	ORG $+3
$SG72378 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG72382 DB	'_EVA_FILTER_VALUE', 00H
	ORG $+2
$SG72384 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG72387 DB	'_EVA_DIFFERENT', 00H
	ORG $+1
$SG72390 DB	'_EVA_SMALLER', 00H
	ORG $+3
$SG72393 DB	'_EVA_SMALLEREQUAL', 00H
	ORG $+2
$SG72396 DB	'_EVA_GREATER', 00H
	ORG $+3
$SG72399 DB	'_EVA_GREATEREQUAL', 00H
	ORG $+2
$SG72402 DB	'_EVA_BEGINWITH', 00H
	ORG $+1
$SG72405 DB	'_EVA_NOT_BEGINWITH', 00H
	ORG $+1
$SG72408 DB	'_EVA_CONTAIN', 00H
	ORG $+3
$SG72411 DB	'_EVA_NOT_CONTAIN', 00H
	ORG $+3
$SG72414 DB	'_EVA_LIKE', 00H
	ORG $+2
$SG72417 DB	'_EVA_NOT_LIKE', 00H
	ORG $+2
$SG72419 DB	'_EVA_ISNOTEMPTY', 00H
$SG72423 DB	'_EVA_INTERVAL', 00H
	ORG $+2
$SG72424 DB	'_EVA_NOT_INTERVAL', 00H
	ORG $+2
$SG72425 DB	'_EVA_INTERVAL', 00H
	ORG $+2
$SG72428 DB	'_EVA_FILTER_VAL_MIN', 00H
$SG72430 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG72435 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG72438 DB	'_EVA_FILTER_VAL_MAX', 00H
$SG72440 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG72445 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG72448 DB	'_EVA_ISEMPTY', 00H
	ORG $+3
$SG72459 DB	'_EVA_NOCASE', 00H
$SG72460 DB	'_EVA_NUM', 00H
	ORG $+3
$SG72462 DB	'D:\Travail\ABI\EVA\V4.0\CGI\Brunix-2016\qry_build.c', 00H
$SG72463 DB	'qry_parse_filter_val', 00H
	ORG $+3
$SG72465 DB	'D:\Travail\ABI\EVA\V4.0\CGI\Brunix-2016\qry_build.c', 00H
$SG72466 DB	'qry_parse_filter_val', 00H
_DATA	ENDS
_TEXT	SEGMENT
_cntxt$ = 8
_flt$ = 12
_field$ = 16
_flt_data$ = 20
_fltval$ = -24
_fltform$ = -4544
_cgival$ = -64
_expr$ = -32
_flt1$ = -4520
_node$ = -4
_fltop$ = -44
_valtype$ = -40
_mtype$ = -4524
_b_std$ = -36
_match$ = -28
_qry_parse_filter_val PROC NEAR

; 1596 : ){

	push	ebp
	mov	ebp, esp
	mov	eax, 4548				; 000011c4H
	call	__chkstk
	push	edi

; 1597 : 	DynTable fltval = { 0 };

	mov	DWORD PTR _fltval$[ebp], 0
	xor	eax, eax
	mov	DWORD PTR _fltval$[ebp+4], eax
	mov	DWORD PTR _fltval$[ebp+8], eax
	mov	DWORD PTR _fltval$[ebp+12], eax
	mov	DWORD PTR _fltval$[ebp+16], eax

; 1598 : 	DynTable fltform = { 0 };

	mov	DWORD PTR _fltform$[ebp], 0
	xor	ecx, ecx
	mov	DWORD PTR _fltform$[ebp+4], ecx
	mov	DWORD PTR _fltform$[ebp+8], ecx
	mov	DWORD PTR _fltform$[ebp+12], ecx
	mov	DWORD PTR _fltform$[ebp+16], ecx

; 1599 : 	DynTable cgival = { 0 };

	mov	DWORD PTR _cgival$[ebp], 0
	xor	edx, edx
	mov	DWORD PTR _cgival$[ebp+4], edx
	mov	DWORD PTR _cgival$[ebp+8], edx
	mov	DWORD PTR _cgival$[ebp+12], edx
	mov	DWORD PTR _cgival$[ebp+16], edx

; 1600 : 	DynBuffer *expr = NULL;

	mov	DWORD PTR _expr$[ebp], 0

; 1601 : 	QryBuild flt1 = {{0}};

	mov	DWORD PTR _flt1$[ebp], 0
	xor	eax, eax
	mov	DWORD PTR _flt1$[ebp+4], eax
	mov	DWORD PTR _flt1$[ebp+8], eax
	mov	DWORD PTR _flt1$[ebp+12], eax
	mov	DWORD PTR _flt1$[ebp+16], eax
	mov	ecx, 1109				; 00000455H
	xor	eax, eax
	lea	edi, DWORD PTR _flt1$[ebp+20]
	rep stosd

; 1602 : 	QryBuilNode *node = flt->node + flt->nbnode;

	mov	ecx, DWORD PTR _flt$[ebp]
	mov	edx, DWORD PTR [ecx+4424]
	imul	edx, 136				; 00000088H
	mov	eax, DWORD PTR _flt$[ebp]
	lea	ecx, DWORD PTR [eax+edx+72]
	mov	DWORD PTR _node$[ebp], ecx

; 1603 : 	char *fltop = DYNTAB_FIELD_VAL(flt_data, FILTER_OP);

	push	0
	push	-1
	push	OFFSET FLAT:$SG72367
	mov	edx, DWORD PTR _flt_data$[ebp]
	push	edx
	call	_dyntab_field_val
	add	esp, 16					; 00000010H
	mov	DWORD PTR _fltop$[ebp], eax

; 1604 : 	char *valtype = DYNTAB_FIELD_VAL(flt_data, FILTER_VAL_TYPE);

	push	0
	push	-1
	push	OFFSET FLAT:$SG72369
	mov	eax, DWORD PTR _flt_data$[ebp]
	push	eax
	call	_dyntab_field_val
	add	esp, 16					; 00000010H
	mov	DWORD PTR _valtype$[ebp], eax

; 1605 : 	char *mtype = DYNTAB_FIELD_VAL(flt_data, COMPARE_MODE);

	push	0
	push	-1
	push	OFFSET FLAT:$SG72371
	mov	ecx, DWORD PTR _flt_data$[ebp]
	push	ecx
	call	_dyntab_field_val
	add	esp, 16					; 00000010H
	mov	DWORD PTR _mtype$[ebp], eax

; 1606 : 	int b_std = 1;

	mov	DWORD PTR _b_std$[ebp], 1

; 1607 : 	MatchMode match = Exact;

	mov	DWORD PTR _match$[ebp], 6

; 1608 : 	GET_ATTR(fltform, LISTOBJ);

	lea	edx, DWORD PTR _fltform$[ebp]
	push	edx
	call	_dyntab_free
	add	esp, 4
	push	0
	push	-1
	push	OFFSET FLAT:$SG72376
	mov	eax, DWORD PTR _flt_data$[ebp]
	push	eax
	push	1
	lea	ecx, DWORD PTR _fltform$[ebp]
	push	ecx
	call	_dyntab_filter_field
	add	esp, 24					; 00000018H
	test	eax, eax
	je	SHORT $L72375
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29872], OFFSET FLAT:$SG72378
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 1608		; 00000648H
	jmp	$eva_err$72379
$L72375:

; 1609 : 	GET_ATTR(fltval, FILTER_VALUE);

	lea	ecx, DWORD PTR _fltval$[ebp]
	push	ecx
	call	_dyntab_free
	add	esp, 4
	push	0
	push	-1
	push	OFFSET FLAT:$SG72382
	mov	edx, DWORD PTR _flt_data$[ebp]
	push	edx
	push	1
	lea	eax, DWORD PTR _fltval$[ebp]
	push	eax
	call	_dyntab_filter_field
	add	esp, 24					; 00000018H
	test	eax, eax
	je	SHORT $L72381
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29872], OFFSET FLAT:$SG72384
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 1609		; 00000649H
	jmp	$eva_err$72379
$L72381:

; 1610 : 
; 1611 : 	/* Set match mode & values depending on comparison type */
; 1612 : #define USE_STD_VAL(tag, mode) if(!strcmp("_EVA_"#tag, fltop)) match = mode;
; 1613 : 	USE_STD_VAL(DIFFERENT, Different) else

	mov	eax, DWORD PTR _fltop$[ebp]
	push	eax
	push	OFFSET FLAT:$SG72387
	call	_strcmp
	add	esp, 8
	test	eax, eax
	jne	SHORT $L72386
	mov	DWORD PTR _match$[ebp], 5
	jmp	$L72416
$L72386:

; 1614 : 	USE_STD_VAL(SMALLER, Smaller) else

	mov	ecx, DWORD PTR _fltop$[ebp]
	push	ecx
	push	OFFSET FLAT:$SG72390
	call	_strcmp
	add	esp, 8
	test	eax, eax
	jne	SHORT $L72389
	mov	DWORD PTR _match$[ebp], 17		; 00000011H
	jmp	$L72416
$L72389:

; 1615 : 	USE_STD_VAL(SMALLEREQUAL, SmallerEqual) else

	mov	edx, DWORD PTR _fltop$[ebp]
	push	edx
	push	OFFSET FLAT:$SG72393
	call	_strcmp
	add	esp, 8
	test	eax, eax
	jne	SHORT $L72392
	mov	DWORD PTR _match$[ebp], 18		; 00000012H
	jmp	$L72416
$L72392:

; 1616 : 	USE_STD_VAL(GREATER, Larger) else

	mov	eax, DWORD PTR _fltop$[ebp]
	push	eax
	push	OFFSET FLAT:$SG72396
	call	_strcmp
	add	esp, 8
	test	eax, eax
	jne	SHORT $L72395
	mov	DWORD PTR _match$[ebp], 15		; 0000000fH
	jmp	$L72416
$L72395:

; 1617 : 	USE_STD_VAL(GREATEREQUAL, LargerEqual) else

	mov	ecx, DWORD PTR _fltop$[ebp]
	push	ecx
	push	OFFSET FLAT:$SG72399
	call	_strcmp
	add	esp, 8
	test	eax, eax
	jne	SHORT $L72398
	mov	DWORD PTR _match$[ebp], 16		; 00000010H
	jmp	$L72416
$L72398:

; 1618 : 	USE_STD_VAL(BEGINWITH, Begin) else

	mov	edx, DWORD PTR _fltop$[ebp]
	push	edx
	push	OFFSET FLAT:$SG72402
	call	_strcmp
	add	esp, 8
	test	eax, eax
	jne	SHORT $L72401
	mov	DWORD PTR _match$[ebp], 13		; 0000000dH
	jmp	$L72416
$L72401:

; 1619 : 	USE_STD_VAL(NOT_BEGINWITH, NotBegin) else

	mov	eax, DWORD PTR _fltop$[ebp]
	push	eax
	push	OFFSET FLAT:$SG72405
	call	_strcmp
	add	esp, 8
	test	eax, eax
	jne	SHORT $L72404
	mov	DWORD PTR _match$[ebp], 14		; 0000000eH
	jmp	SHORT $L72416
$L72404:

; 1620 : 	USE_STD_VAL(CONTAIN, Contain) else

	mov	ecx, DWORD PTR _fltop$[ebp]
	push	ecx
	push	OFFSET FLAT:$SG72408
	call	_strcmp
	add	esp, 8
	test	eax, eax
	jne	SHORT $L72407
	mov	DWORD PTR _match$[ebp], 11		; 0000000bH
	jmp	SHORT $L72416
$L72407:

; 1621 : 	USE_STD_VAL(NOT_CONTAIN, NotContain) else

	mov	edx, DWORD PTR _fltop$[ebp]
	push	edx
	push	OFFSET FLAT:$SG72411
	call	_strcmp
	add	esp, 8
	test	eax, eax
	jne	SHORT $L72410
	mov	DWORD PTR _match$[ebp], 12		; 0000000cH
	jmp	SHORT $L72416
$L72410:

; 1622 : 	USE_STD_VAL(LIKE, Like) else

	mov	eax, DWORD PTR _fltop$[ebp]
	push	eax
	push	OFFSET FLAT:$SG72414
	call	_strcmp
	add	esp, 8
	test	eax, eax
	jne	SHORT $L72413
	mov	DWORD PTR _match$[ebp], 9
	jmp	SHORT $L72416
$L72413:

; 1623 : 	USE_STD_VAL(NOT_LIKE, NotLike)

	mov	ecx, DWORD PTR _fltop$[ebp]
	push	ecx
	push	OFFSET FLAT:$SG72417
	call	_strcmp
	add	esp, 8
	test	eax, eax
	jne	SHORT $L72416
	mov	DWORD PTR _match$[ebp], 10		; 0000000aH
$L72416:

; 1624 : 	USE_STD_VAL(ISNOTEMPTY, NoMatch)

	mov	edx, DWORD PTR _fltop$[ebp]
	push	edx
	push	OFFSET FLAT:$SG72419
	call	_strcmp
	add	esp, 8
	test	eax, eax
	jne	SHORT $L72418
	mov	DWORD PTR _match$[ebp], 0

; 1625 : #undef USE_STD_VAL
; 1626 : 	else if(!strcmp("_EVA_INTERVAL", fltop) || !strcmp("_EVA_NOT_INTERVAL", fltop))

	jmp	$L72447
$L72418:
	mov	eax, DWORD PTR _fltop$[ebp]
	push	eax
	push	OFFSET FLAT:$SG72423
	call	_strcmp
	add	esp, 8
	test	eax, eax
	je	SHORT $L72422
	mov	ecx, DWORD PTR _fltop$[ebp]
	push	ecx
	push	OFFSET FLAT:$SG72424
	call	_strcmp
	add	esp, 8
	test	eax, eax
	jne	$L72421
$L72422:

; 1628 : 		/* Interval operator : handle min / max values */
; 1629 : 		match = !strcmp("_EVA_INTERVAL", fltop) ? InBound : NotInBound;

	mov	edx, DWORD PTR _fltop$[ebp]
	push	edx
	push	OFFSET FLAT:$SG72425
	call	_strcmp
	add	esp, 8
	neg	eax
	sbb	eax, eax
	neg	eax
	add	eax, 19					; 00000013H
	mov	DWORD PTR _match$[ebp], eax

; 1630 : 		b_std = 0;

	mov	DWORD PTR _b_std$[ebp], 0

; 1631 : 
; 1632 : 		/* Evaluate comparison values */
; 1633 : 		GET_ATTR(fltval, FILTER_VAL_MIN);

	lea	eax, DWORD PTR _fltval$[ebp]
	push	eax
	call	_dyntab_free
	add	esp, 4
	push	0
	push	-1
	push	OFFSET FLAT:$SG72428
	mov	ecx, DWORD PTR _flt_data$[ebp]
	push	ecx
	push	1
	lea	edx, DWORD PTR _fltval$[ebp]
	push	edx
	call	_dyntab_filter_field
	add	esp, 24					; 00000018H
	test	eax, eax
	je	SHORT $L72427
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29872], OFFSET FLAT:$SG72430
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 1633		; 00000661H
	jmp	$eva_err$72379
$L72427:

; 1634 : 		if(qry_eval_var_expr_table(cntxt, &fltval, flt_data) ||
; 1635 : 			form_eval_valtype(cntxt, &cgival, valtype, &fltform, &fltval)) STACK_ERROR;

	mov	edx, DWORD PTR _flt_data$[ebp]
	push	edx
	lea	eax, DWORD PTR _fltval$[ebp]
	push	eax
	mov	ecx, DWORD PTR _cntxt$[ebp]
	push	ecx
	call	_qry_eval_var_expr_table
	add	esp, 12					; 0000000cH
	test	eax, eax
	jne	SHORT $L72432
	lea	edx, DWORD PTR _fltval$[ebp]
	push	edx
	lea	eax, DWORD PTR _fltform$[ebp]
	push	eax
	mov	ecx, DWORD PTR _valtype$[ebp]
	push	ecx
	lea	edx, DWORD PTR _cgival$[ebp]
	push	edx
	mov	eax, DWORD PTR _cntxt$[ebp]
	push	eax
	call	_form_eval_valtype
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L72431
$L72432:
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 1635		; 00000663H
	jmp	$eva_err$72379
$L72431:

; 1636 : 		DYNTAB_ADD_CELL(&node->value, 0, 0, &cgival, 0, 0);

	push	1
	push	0
	push	0
	lea	edx, DWORD PTR _cgival$[ebp]
	push	edx
	call	_dyntab_cell
	add	esp, 12					; 0000000cH
	push	eax
	push	0
	push	0
	mov	eax, DWORD PTR _node$[ebp]
	add	eax, 32					; 00000020H
	push	eax
	call	_dyntab_copy
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L72433
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29872], OFFSET FLAT:$SG72435
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 1636		; 00000664H
	jmp	$eva_err$72379
$L72433:

; 1637 : 		GET_ATTR(fltval, FILTER_VAL_MAX);

	lea	eax, DWORD PTR _fltval$[ebp]
	push	eax
	call	_dyntab_free
	add	esp, 4
	push	0
	push	-1
	push	OFFSET FLAT:$SG72438
	mov	ecx, DWORD PTR _flt_data$[ebp]
	push	ecx
	push	1
	lea	edx, DWORD PTR _fltval$[ebp]
	push	edx
	call	_dyntab_filter_field
	add	esp, 24					; 00000018H
	test	eax, eax
	je	SHORT $L72437
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29872], OFFSET FLAT:$SG72440
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 1637		; 00000665H
	jmp	$eva_err$72379
$L72437:

; 1638 : 		if(qry_eval_var_expr_table(cntxt, &fltval, flt_data) ||
; 1639 : 			form_eval_valtype(cntxt, &cgival, valtype, &fltform, &fltval)) STACK_ERROR;

	mov	edx, DWORD PTR _flt_data$[ebp]
	push	edx
	lea	eax, DWORD PTR _fltval$[ebp]
	push	eax
	mov	ecx, DWORD PTR _cntxt$[ebp]
	push	ecx
	call	_qry_eval_var_expr_table
	add	esp, 12					; 0000000cH
	test	eax, eax
	jne	SHORT $L72442
	lea	edx, DWORD PTR _fltval$[ebp]
	push	edx
	lea	eax, DWORD PTR _fltform$[ebp]
	push	eax
	mov	ecx, DWORD PTR _valtype$[ebp]
	push	ecx
	lea	edx, DWORD PTR _cgival$[ebp]
	push	edx
	mov	eax, DWORD PTR _cntxt$[ebp]
	push	eax
	call	_form_eval_valtype
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L72441
$L72442:
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 1639		; 00000667H
	jmp	$eva_err$72379
$L72441:

; 1640 : 		DYNTAB_ADD_CELL(&node->value, 1, 0, &cgival, 0, 0);

	push	1
	push	0
	push	0
	lea	edx, DWORD PTR _cgival$[ebp]
	push	edx
	call	_dyntab_cell
	add	esp, 12					; 0000000cH
	push	eax
	push	0
	push	1
	mov	eax, DWORD PTR _node$[ebp]
	add	eax, 32					; 00000020H
	push	eax
	call	_dyntab_copy
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L72443
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29872], OFFSET FLAT:$SG72445
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 1640		; 00000668H
	jmp	$eva_err$72379
$L72443:

; 1642 : 	else if(!strcmp("_EVA_ISEMPTY", fltop))

	jmp	$L72447
$L72421:
	mov	eax, DWORD PTR _fltop$[ebp]
	push	eax
	push	OFFSET FLAT:$SG72448
	call	_strcmp
	add	esp, 8
	test	eax, eax
	jne	$L72447

; 1644 : 		/* Empty operator : read objects having a value for the field & use NOT IN() */
; 1645 : 		if(qry_add_create_del_filter(cntxt, &flt1, flt_data)) STACK_ERROR;

	mov	ecx, DWORD PTR _flt_data$[ebp]
	push	ecx
	lea	edx, DWORD PTR _flt1$[ebp]
	push	edx
	mov	eax, DWORD PTR _cntxt$[ebp]
	push	eax
	call	_qry_add_create_del_filter
	add	esp, 12					; 0000000cH
	test	eax, eax
	je	SHORT $L72449
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 1645		; 0000066dH
	jmp	$eva_err$72379
$L72449:

; 1646 : 		if(qry_add_filter(cntxt, &flt1, RelNone, field, NoMatch, NULL) ||
; 1647 : 			qry_filter_objects(cntxt, &node->value, &flt1)) STACK_ERROR;

	push	0
	push	0
	mov	edx, DWORD PTR _field$[ebp]
	push	edx
	push	0
	lea	eax, DWORD PTR _flt1$[ebp]
	push	eax
	mov	ecx, DWORD PTR _cntxt$[ebp]
	push	ecx
	call	_qry_add_filter
	add	esp, 24					; 00000018H
	test	eax, eax
	jne	SHORT $L72452
	lea	edx, DWORD PTR _flt1$[ebp]
	push	edx
	mov	eax, DWORD PTR _node$[ebp]
	add	eax, 32					; 00000020H
	push	eax
	mov	ecx, DWORD PTR _cntxt$[ebp]
	push	ecx
	call	_qry_filter_objects
	add	esp, 12					; 0000000cH
	test	eax, eax
	je	SHORT $L72451
$L72452:
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 1647		; 0000066fH
	jmp	$eva_err$72379
$L72451:

; 1648 : 		b_std = 0;

	mov	DWORD PTR _b_std$[ebp], 0

; 1649 : 		match = NotObjList;

	mov	DWORD PTR _match$[ebp], 2

; 1650 : 		field = NULL;

	mov	DWORD PTR _field$[ebp], 0
$L72447:

; 1652 : 
; 1653 : 	/* Evaluate comparison value if applicable */
; 1654 : 	if(b_std && match != NoMatch && (
; 1655 : 		qry_eval_var_expr_table(cntxt, &fltval, flt_data) ||
; 1656 : 		form_eval_valtype(cntxt, &node->value, valtype, &fltform, &fltval))) STACK_ERROR;

	cmp	DWORD PTR _b_std$[ebp], 0
	je	SHORT $L72454
	cmp	DWORD PTR _match$[ebp], 0
	je	SHORT $L72454
	mov	eax, DWORD PTR _flt_data$[ebp]
	push	eax
	lea	ecx, DWORD PTR _fltval$[ebp]
	push	ecx
	mov	edx, DWORD PTR _cntxt$[ebp]
	push	edx
	call	_qry_eval_var_expr_table
	add	esp, 12					; 0000000cH
	test	eax, eax
	jne	SHORT $L72455
	lea	eax, DWORD PTR _fltval$[ebp]
	push	eax
	lea	ecx, DWORD PTR _fltform$[ebp]
	push	ecx
	mov	edx, DWORD PTR _valtype$[ebp]
	push	edx
	mov	eax, DWORD PTR _node$[ebp]
	add	eax, 32					; 00000020H
	push	eax
	mov	ecx, DWORD PTR _cntxt$[ebp]
	push	ecx
	call	_form_eval_valtype
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L72454
$L72455:
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 1656		; 00000678H
	jmp	$eva_err$72379
$L72454:

; 1657 : 
; 1658 : 	/* Add node */
; 1659 : 	if(qry_add_create_del_filter(cntxt, flt, flt_data)) STACK_ERROR;

	mov	eax, DWORD PTR _flt_data$[ebp]
	push	eax
	mov	ecx, DWORD PTR _flt$[ebp]
	push	ecx
	mov	edx, DWORD PTR _cntxt$[ebp]
	push	edx
	call	_qry_add_create_del_filter
	add	esp, 12					; 0000000cH
	test	eax, eax
	je	SHORT $L72456
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 1659		; 0000067bH
	jmp	$eva_err$72379
$L72456:

; 1660 : 	if(qry_add_filter(cntxt, flt, RelNone, field, match, NULL)) STACK_ERROR;

	push	0
	mov	ecx, DWORD PTR _match$[ebp]
	push	ecx
	mov	edx, DWORD PTR _field$[ebp]
	push	edx
	push	0
	mov	eax, DWORD PTR _flt$[ebp]
	push	eax
	mov	ecx, DWORD PTR _cntxt$[ebp]
	push	ecx
	call	_qry_add_filter
	add	esp, 24					; 00000018H
	test	eax, eax
	je	SHORT $L72458
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 1660		; 0000067cH
	jmp	SHORT $eva_err$72379
$L72458:

; 1661 : 	node->mtype = !strcmp(mtype, "_EVA_NOCASE") ? MatchNoCase :
; 1662 : 					!strcmp(mtype, "_EVA_NUM") ? MatchNum : MatchText;

	push	OFFSET FLAT:$SG72459
	mov	eax, DWORD PTR _mtype$[ebp]
	push	eax
	call	_strcmp
	add	esp, 8
	test	eax, eax
	jne	SHORT $L74445
	mov	DWORD PTR -4548+[ebp], 1
	jmp	SHORT $L74446
$L74445:
	push	OFFSET FLAT:$SG72460
	mov	ecx, DWORD PTR _mtype$[ebp]
	push	ecx
	call	_strcmp
	add	esp, 8
	neg	eax
	sbb	eax, eax
	and	al, -3					; fffffffdH
	add	eax, 3
	mov	DWORD PTR -4548+[ebp], eax
$L74446:
	mov	edx, DWORD PTR _node$[ebp]
	mov	eax, DWORD PTR -4548+[ebp]
	mov	DWORD PTR [edx+28], eax
$eva_noerr$72461:

; 1663 : 
; 1664 : 	RETURN_OK_CLEANUP;

	push	0
	push	OFFSET FLAT:$SG72462
	push	OFFSET FLAT:$SG72463
	mov	ecx, DWORD PTR _cntxt$[ebp]
	push	ecx
	call	_err_clear
	add	esp, 16					; 00000010H
$eva_err$72379:
	mov	edx, DWORD PTR _cntxt$[ebp]
	cmp	DWORD PTR [edx+29872], 0
	je	SHORT $L72464
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	ecx, DWORD PTR [eax+29900]
	push	ecx
	push	OFFSET FLAT:$SG72465
	push	OFFSET FLAT:$SG72466
	mov	edx, DWORD PTR _cntxt$[ebp]
	push	edx
	call	_err_add_context
	add	esp, 16					; 00000010H
$L72464:
	lea	eax, DWORD PTR _fltval$[ebp]
	push	eax
	call	_dyntab_free
	add	esp, 4
	lea	ecx, DWORD PTR _fltform$[ebp]
	push	ecx
	call	_dyntab_free
	add	esp, 4
	lea	edx, DWORD PTR _cgival$[ebp]
	push	edx
	call	_dyntab_free
	add	esp, 4
	mov	eax, DWORD PTR _expr$[ebp]
	push	eax
	call	_mem_free
	add	esp, 4
	mov	DWORD PTR _expr$[ebp], 0
	lea	ecx, DWORD PTR _flt1$[ebp]
	push	ecx
	call	_qry_build_free
	add	esp, 4
	mov	edx, DWORD PTR _cntxt$[ebp]
	xor	eax, eax
	cmp	DWORD PTR [edx+29872], 0
	setne	al

; 1665 : }

	pop	edi
	mov	esp, ebp
	pop	ebp
	ret	0
_qry_parse_filter_val ENDP
_TEXT	ENDS
PUBLIC	_qry_parse_relval_fields
EXTRN	_qry_obj_data:NEAR
_DATA	SEGMENT
	ORG $+3
$SG72490 DB	'_EVA_TYPE', 00H
	ORG $+2
$SG72492 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG72500 DB	'_EVA_FIELD', 00H
	ORG $+1
$SG72502 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG72505 DB	'_EVA_FILTER_CTRL', 00H
	ORG $+3
$SG72507 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG72516 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG72518 DB	'_EVA_TYPE', 00H
	ORG $+2
$SG72519 DB	'_EVA_FIELD', 00H
	ORG $+1
$SG72522 DB	'_EVA_RELATION', 00H
	ORG $+2
$SG72523 DB	'_EVA_FILEUPLOAD', 00H
$SG72526 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG72528 DB	'D:\Travail\ABI\EVA\V4.0\CGI\Brunix-2016\qry_build.c', 00H
$SG72529 DB	'qry_parse_relval_fields', 00H
$SG72531 DB	'D:\Travail\ABI\EVA\V4.0\CGI\Brunix-2016\qry_build.c', 00H
$SG72532 DB	'qry_parse_relval_fields', 00H
_DATA	ENDS
_TEXT	SEGMENT
_cntxt$ = 8
_fldval$ = 12
_fldrel$ = 16
_flt_data$ = 20
_fltctl$ = -40
_val$ = -20
_obj$ = -84
_fld$ = -64
_i$ = -44
_id$72484 = -100
_row$72485 = -92
_col$72486 = -88
__c$72487 = -96
_id$72494 = -116
_row$72495 = -108
_col$72496 = -104
__c$72497 = -112
_type$72511 = -128
_field$72512 = -124
_dest$72513 = -120
_qry_parse_relval_fields PROC NEAR

; 1683 : ){

	push	ebp
	mov	ebp, esp
	sub	esp, 132				; 00000084H

; 1684 : 	DynTable fltctl = { 0 };

	mov	DWORD PTR _fltctl$[ebp], 0
	xor	eax, eax
	mov	DWORD PTR _fltctl$[ebp+4], eax
	mov	DWORD PTR _fltctl$[ebp+8], eax
	mov	DWORD PTR _fltctl$[ebp+12], eax
	mov	DWORD PTR _fltctl$[ebp+16], eax

; 1685 : 	DynTable val = { 0 };

	mov	DWORD PTR _val$[ebp], 0
	xor	ecx, ecx
	mov	DWORD PTR _val$[ebp+4], ecx
	mov	DWORD PTR _val$[ebp+8], ecx
	mov	DWORD PTR _val$[ebp+12], ecx
	mov	DWORD PTR _val$[ebp+16], ecx

; 1686 : 	DynTable obj = { 0 };

	mov	DWORD PTR _obj$[ebp], 0
	xor	edx, edx
	mov	DWORD PTR _obj$[ebp+4], edx
	mov	DWORD PTR _obj$[ebp+8], edx
	mov	DWORD PTR _obj$[ebp+12], edx
	mov	DWORD PTR _obj$[ebp+16], edx

; 1687 : 	DynTable fld = { 0 };

	mov	DWORD PTR _fld$[ebp], 0
	xor	eax, eax
	mov	DWORD PTR _fld$[ebp+4], eax
	mov	DWORD PTR _fld$[ebp+8], eax
	mov	DWORD PTR _fld$[ebp+12], eax
	mov	DWORD PTR _fld$[ebp+16], eax

; 1688 : 	unsigned long i;
; 1689 : 
; 1690 : 	/* Read filter controls */
; 1691 : 	DYNTAB_ADD_TXTID(&fld, 0, 0, "_EVA_TYPE", cntxt->val_TYPE);

	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	edx, DWORD PTR [ecx+269640]
	mov	DWORD PTR _id$72484[ebp], edx
	mov	DWORD PTR _row$72485[ebp], 0
	mov	DWORD PTR _col$72486[ebp], 0
	push	0
	push	0
	push	9
	push	OFFSET FLAT:$SG72490
	mov	eax, DWORD PTR _col$72486[ebp]
	push	eax
	mov	ecx, DWORD PTR _row$72485[ebp]
	push	ecx
	lea	edx, DWORD PTR _fld$[ebp]
	push	edx
	call	_dyntab_add
	add	esp, 28					; 0000001cH
	test	eax, eax
	je	SHORT $L72489
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29872], OFFSET FLAT:$SG72492
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 1691		; 0000069bH
	jmp	$eva_err$72493
$L72489:
	mov	edx, DWORD PTR _col$72486[ebp]
	push	edx
	mov	eax, DWORD PTR _row$72485[ebp]
	push	eax
	lea	ecx, DWORD PTR _fld$[ebp]
	push	ecx
	call	_dyntab_cell
	add	esp, 12					; 0000000cH
	mov	DWORD PTR __c$72487[ebp], eax
	mov	edx, DWORD PTR __c$72487[ebp]
	mov	eax, DWORD PTR _id$72484[ebp]
	mov	DWORD PTR [edx+32], eax

; 1692 : 	DYNTAB_ADD_TXTID(&fld, 1, 0, "_EVA_FIELD", cntxt->val_FIELD);

	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	edx, DWORD PTR [ecx+269644]
	mov	DWORD PTR _id$72494[ebp], edx
	mov	DWORD PTR _row$72495[ebp], 1
	mov	DWORD PTR _col$72496[ebp], 0
	push	0
	push	0
	push	10					; 0000000aH
	push	OFFSET FLAT:$SG72500
	mov	eax, DWORD PTR _col$72496[ebp]
	push	eax
	mov	ecx, DWORD PTR _row$72495[ebp]
	push	ecx
	lea	edx, DWORD PTR _fld$[ebp]
	push	edx
	call	_dyntab_add
	add	esp, 28					; 0000001cH
	test	eax, eax
	je	SHORT $L72499
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29872], OFFSET FLAT:$SG72502
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 1692		; 0000069cH
	jmp	$eva_err$72493
$L72499:
	mov	edx, DWORD PTR _col$72496[ebp]
	push	edx
	mov	eax, DWORD PTR _row$72495[ebp]
	push	eax
	lea	ecx, DWORD PTR _fld$[ebp]
	push	ecx
	call	_dyntab_cell
	add	esp, 12					; 0000000cH
	mov	DWORD PTR __c$72497[ebp], eax
	mov	edx, DWORD PTR __c$72497[ebp]
	mov	eax, DWORD PTR _id$72494[ebp]
	mov	DWORD PTR [edx+32], eax

; 1693 : 	GET_ATTR(fltctl, FILTER_CTRL);

	lea	ecx, DWORD PTR _fltctl$[ebp]
	push	ecx
	call	_dyntab_free
	add	esp, 4
	push	0
	push	-1
	push	OFFSET FLAT:$SG72505
	mov	edx, DWORD PTR _flt_data$[ebp]
	push	edx
	push	1
	lea	eax, DWORD PTR _fltctl$[ebp]
	push	eax
	call	_dyntab_filter_field
	add	esp, 24					; 00000018H
	test	eax, eax
	je	SHORT $L72504
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29872], OFFSET FLAT:$SG72507
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 1693		; 0000069dH
	jmp	$eva_err$72493
$L72504:

; 1694 : 	for(i = 0; i < fltctl.nbrows; i++)

	mov	DWORD PTR _i$[ebp], 0
	jmp	SHORT $L72508
$L72509:
	mov	eax, DWORD PTR _i$[ebp]
	add	eax, 1
	mov	DWORD PTR _i$[ebp], eax
$L72508:
	mov	ecx, DWORD PTR _i$[ebp]
	cmp	ecx, DWORD PTR _fltctl$[ebp]
	jae	$eva_noerr$72527

; 1696 : 		/* Read control type & field */
; 1697 : 		char *type;
; 1698 : 		DynTableCell *field;
; 1699 : 		DynTable *dest;
; 1700 : 		DYNTAB_SET_CELL(&obj, 0, 0, &fltctl, i, 0);

	push	0
	push	0
	mov	edx, DWORD PTR _i$[ebp]
	push	edx
	lea	eax, DWORD PTR _fltctl$[ebp]
	push	eax
	call	_dyntab_cell
	add	esp, 12					; 0000000cH
	push	eax
	push	0
	push	0
	lea	ecx, DWORD PTR _obj$[ebp]
	push	ecx
	call	_dyntab_copy
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L72514
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29872], OFFSET FLAT:$SG72516
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 1700		; 000006a4H
	jmp	$eva_err$72493
$L72514:

; 1701 : 		if(qry_obj_data(cntxt, &val, &obj, &fld)) STACK_ERROR;

	lea	ecx, DWORD PTR _fld$[ebp]
	push	ecx
	lea	edx, DWORD PTR _obj$[ebp]
	push	edx
	lea	eax, DWORD PTR _val$[ebp]
	push	eax
	mov	ecx, DWORD PTR _cntxt$[ebp]
	push	ecx
	call	_qry_obj_data
	add	esp, 16					; 00000010H
	test	eax, eax
	je	SHORT $L72517
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 1701		; 000006a5H
	jmp	$eva_err$72493
$L72517:

; 1702 : 		type = DYNTAB_FIELD_VAL(&val, TYPE);

	push	0
	push	-1
	push	OFFSET FLAT:$SG72518
	lea	eax, DWORD PTR _val$[ebp]
	push	eax
	call	_dyntab_field_val
	add	esp, 16					; 00000010H
	mov	DWORD PTR _type$72511[ebp], eax

; 1703 : 		field = DYNTAB_FIELD_CELL(&val, FIELD);

	push	0
	push	-1
	push	OFFSET FLAT:$SG72519
	lea	ecx, DWORD PTR _val$[ebp]
	push	ecx
	call	_dyntab_field_cell
	add	esp, 16					; 00000010H
	mov	DWORD PTR _field$72512[ebp], eax

; 1704 : 		if(!*type || !field) continue;

	mov	edx, DWORD PTR _type$72511[ebp]
	movsx	eax, BYTE PTR [edx]
	test	eax, eax
	je	SHORT $L72521
	cmp	DWORD PTR _field$72512[ebp], 0
	jne	SHORT $L72520
$L72521:
	jmp	$L72509
$L72520:

; 1705 : 
; 1706 : 		/* Put relation fields in fldrel, others in fldval */
; 1707 : 		dest = (strcmp(type, "_EVA_RELATION") && strcmp(type, "_EVA_FILEUPLOAD")) ? fldval : fldrel;

	push	OFFSET FLAT:$SG72522
	mov	ecx, DWORD PTR _type$72511[ebp]
	push	ecx
	call	_strcmp
	add	esp, 8
	test	eax, eax
	je	SHORT $L74448
	push	OFFSET FLAT:$SG72523
	mov	edx, DWORD PTR _type$72511[ebp]
	push	edx
	call	_strcmp
	add	esp, 8
	test	eax, eax
	je	SHORT $L74448
	mov	eax, DWORD PTR _fldval$[ebp]
	mov	DWORD PTR -132+[ebp], eax
	jmp	SHORT $L74449
$L74448:
	mov	ecx, DWORD PTR _fldrel$[ebp]
	mov	DWORD PTR -132+[ebp], ecx
$L74449:
	mov	edx, DWORD PTR -132+[ebp]
	mov	DWORD PTR _dest$72513[ebp], edx

; 1708 : 		DYNTAB_ADD_CELLP(dest, dest->nbrows, 0, field);

	push	1
	mov	eax, DWORD PTR _field$72512[ebp]
	push	eax
	push	0
	mov	ecx, DWORD PTR _dest$72513[ebp]
	mov	edx, DWORD PTR [ecx]
	push	edx
	mov	eax, DWORD PTR _dest$72513[ebp]
	push	eax
	call	_dyntab_copy
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L72524
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29872], OFFSET FLAT:$SG72526
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 1708		; 000006acH
	jmp	SHORT $eva_err$72493
$L72524:

; 1709 : 	}

	jmp	$L72509
$eva_noerr$72527:

; 1710 : 
; 1711 : 	RETURN_OK_CLEANUP;

	push	0
	push	OFFSET FLAT:$SG72528
	push	OFFSET FLAT:$SG72529
	mov	eax, DWORD PTR _cntxt$[ebp]
	push	eax
	call	_err_clear
	add	esp, 16					; 00000010H
$eva_err$72493:
	mov	ecx, DWORD PTR _cntxt$[ebp]
	cmp	DWORD PTR [ecx+29872], 0
	je	SHORT $L72530
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	eax, DWORD PTR [edx+29900]
	push	eax
	push	OFFSET FLAT:$SG72531
	push	OFFSET FLAT:$SG72532
	mov	ecx, DWORD PTR _cntxt$[ebp]
	push	ecx
	call	_err_add_context
	add	esp, 16					; 00000010H
$L72530:
	lea	edx, DWORD PTR _fltctl$[ebp]
	push	edx
	call	_dyntab_free
	add	esp, 4
	lea	eax, DWORD PTR _val$[ebp]
	push	eax
	call	_dyntab_free
	add	esp, 4
	lea	ecx, DWORD PTR _obj$[ebp]
	push	ecx
	call	_dyntab_free
	add	esp, 4
	lea	edx, DWORD PTR _fld$[ebp]
	push	edx
	call	_dyntab_free
	add	esp, 4
	mov	eax, DWORD PTR _cntxt$[ebp]
	xor	ecx, ecx
	cmp	DWORD PTR [eax+29872], 0
	setne	cl
	mov	eax, ecx

; 1712 : }

	mov	esp, ebp
	pop	ebp
	ret	0
_qry_parse_relval_fields ENDP
_TEXT	ENDS
EXTRN	_clock:NEAR
EXTRN	_qry_filterlist_to_sql:NEAR
_BSS	SEGMENT
	ALIGN	4

$SG72565 DB	01H DUP (?)
_BSS	ENDS
_DATA	SEGMENT
$SG72545 DB	'_EVA_FILTER_TYPE', 00H
	ORG $+3
$SG72558 DB	'_EVA_LABEL', 00H
	ORG $+1
$SG72559 DB	'_EVA_DEBUG_SQL_FILTER', 00H
	ORG $+2
$SG72566 DB	0aH, '========> qry_parse_filter_nodes : ', 00H
	ORG $+3
$SG72568 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG72570 DB	'_EVA_OPTIMIZER', 00H
	ORG $+1
$SG72576 DB	'_EVA_ACTIVATE_FILTER', 00H
	ORG $+3
$SG72578 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG72582 DB	'=', 00H
	ORG $+2
$SG72584 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG72586 DB	'AND', 00H
$SG72587 DB	'D:\Travail\ABI\EVA\V4.0\CGI\Brunix-2016\qry_build.c', 00H
$SG72588 DB	'qry_parse_filter_nodes', 00H
	ORG $+1
$SG72594 DB	'D:\Travail\ABI\EVA\V4.0\CGI\Brunix-2016\qry_build.c', 00H
$SG72595 DB	'qry_parse_filter_nodes', 00H
	ORG $+1
$SG72597 DB	'1', 00H
	ORG $+2
$SG72600 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG72602 DB	'%lu', 00H
$SG72606 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG72609 DB	'_EVA_FILTER_LISTOBJ', 00H
$SG72610 DB	'_EVA_LISTOBJ', 00H
	ORG $+3
$SG72613 DB	'_EVA_LISTOBJ', 00H
	ORG $+3
$SG72615 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG72621 DB	'_EVA_FILTER_FORM', 00H
	ORG $+3
$SG72624 DB	'_EVA_FILTER_FORM', 00H
	ORG $+3
$SG72626 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG72633 DB	'_EVA_FORMSTAMP', 00H
	ORG $+1
$SG72635 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG72642 DB	'_EVA_FILTER_CTRLVAL', 00H
$SG72648 DB	'_EVA_FILTER_FIELD', 00H
	ORG $+2
$SG72651 DB	'_EVA_FILTER_FIELD', 00H
	ORG $+2
$SG72653 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG72657 DB	'_EVA_FILTER_REL', 00H
$SG72660 DB	'_EVA_FILTER_REL', 00H
$SG72662 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG72667 DB	'_EVA_FILTER', 00H
$SG72668 DB	'_EVA_FILTER_AND', 00H
$SG72669 DB	'_EVA_FILTER_ANDJOIN', 00H
$SG72672 DB	'_EVA_FILTERS', 00H
	ORG $+3
$SG72674 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG72678 DB	'_EVA_FILTER_SQLNODE', 00H
$SG72681 DB	'_EVA_FILTER_COND', 00H
	ORG $+3
$SG72684 DB	'_EVA_FILTER_SQL', 00H
$SG72687 DB	'_EVA_FILTER_SQL', 00H
$SG72694 DB	'%lu', 00H
$SG72698 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG72701 DB	'_EVA_FILTER_SQLCOND', 00H
$SG72708 DB	'tmpSQL%u', 00H
	ORG $+3
$SG72711 DB	' TYPE=HEAP ', 0aH, 00H
	ORG $+3
$SG72712 DB	'CREATE TEMPORARY TABLE ', 00H
$SG72714 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG72719 DB	' ADD INDEX (IdObj)', 00H
	ORG $+1
$SG72720 DB	'ALTER TABLE ', 00H
	ORG $+3
$SG72722 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG72725 DB	'_EVA_FILTER_COND', 00H
	ORG $+3
$SG72730 DB	'_EVA_FILTER_COND', 00H
	ORG $+3
$SG72733 DB	'_EVA_FILTER_OR', 00H
	ORG $+1
$SG72735 DB	'Or%lX', 00H
	ORG $+2
$SG72736 DB	'-- OR combination - use temporary table %s', 0aH, 'CREAT'
	DB	'E TEMPORARY TABLE %s (IdObj INT) TYPE=HEAP', 00H
	ORG $+1
$SG72740 DB	'_EVA_FILTERS', 00H
	ORG $+3
$SG72742 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG72753 DB	'-- OR combination - [%s]', 0aH, 00H
	ORG $+2
$SG72755 DB	'INSERT INTO %s (IdObj)', 0aH, 00H
$SG72758 DB	'-- OR combination - get distinct objects', 0aH, 'SELECT '
	DB	'DISTINCT IdObj FROM %s', 00H
	ORG $+1
$SG72764 DB	'%lu', 00H
$SG72768 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG72774 DB	0aH, 00H
	ORG $+2
$SG72775 DB	'<======== END qry_parse_filter_nodes : ', 00H
$SG72777 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG72778 DB	'D:\Travail\ABI\EVA\V4.0\CGI\Brunix-2016\qry_build.c', 00H
$SG72779 DB	'qry_parse_filter_nodes', 00H
	ORG $+1
$SG72781 DB	'D:\Travail\ABI\EVA\V4.0\CGI\Brunix-2016\qry_build.c', 00H
$SG72782 DB	'qry_parse_filter_nodes', 00H
_DATA	ENDS
_TEXT	SEGMENT
_tblname$72706 = -5688
_tblsz$72707 = -5692
_tmptbl$72734 = -5724
__tmp$72762 = -5756
__c$72770 = -5760
_cntxt$ = 8
_flt$ = 12
_flt_data$ = 16
_form$ = -32
_flttype$ = -5568
_fltfield$ = -1080
_fltval$ = -28
_fltform$ = -5588
_cgival$ = -1108
_sql$ = -8
_flt1$ = -5564
_node$ = -4
_printbuf$ = -1056
_i$ = -1088
_sql_trace$ = -1060
_fltlabel$ = -1084
__c$72561 = -5592
__tmp$72601 = -5624
_id$72627 = -5640
_row$72628 = -5632
_col$72629 = -5628
__c$72630 = -5636
__tmp$72692 = -5672
_qry_parse_filter_nodes PROC NEAR

; 1733 : ){

	push	ebp
	mov	ebp, esp
	mov	eax, 5788				; 0000169cH
	call	__chkstk
	push	edi

; 1734 : 	EVA_form *form = cntxt->form;

	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	ecx, DWORD PTR [eax+80]
	mov	DWORD PTR _form$[ebp], ecx

; 1735 : 	char *flttype = DYNTAB_FIELD_VAL(flt_data, FILTER_TYPE);

	push	0
	push	-1
	push	OFFSET FLAT:$SG72545
	mov	edx, DWORD PTR _flt_data$[ebp]
	push	edx
	call	_dyntab_field_val
	add	esp, 16					; 00000010H
	mov	DWORD PTR _flttype$[ebp], eax

; 1736 : 	DynTable fltfield = { 0 };

	mov	DWORD PTR _fltfield$[ebp], 0
	xor	eax, eax
	mov	DWORD PTR _fltfield$[ebp+4], eax
	mov	DWORD PTR _fltfield$[ebp+8], eax
	mov	DWORD PTR _fltfield$[ebp+12], eax
	mov	DWORD PTR _fltfield$[ebp+16], eax

; 1737 : 	DynTable fltval = { 0 };

	mov	DWORD PTR _fltval$[ebp], 0
	xor	ecx, ecx
	mov	DWORD PTR _fltval$[ebp+4], ecx
	mov	DWORD PTR _fltval$[ebp+8], ecx
	mov	DWORD PTR _fltval$[ebp+12], ecx
	mov	DWORD PTR _fltval$[ebp+16], ecx

; 1738 : 	DynTable fltform = { 0 };

	mov	DWORD PTR _fltform$[ebp], 0
	xor	edx, edx
	mov	DWORD PTR _fltform$[ebp+4], edx
	mov	DWORD PTR _fltform$[ebp+8], edx
	mov	DWORD PTR _fltform$[ebp+12], edx
	mov	DWORD PTR _fltform$[ebp+16], edx

; 1739 : 	DynTable cgival = { 0 };

	mov	DWORD PTR _cgival$[ebp], 0
	xor	eax, eax
	mov	DWORD PTR _cgival$[ebp+4], eax
	mov	DWORD PTR _cgival$[ebp+8], eax
	mov	DWORD PTR _cgival$[ebp+12], eax
	mov	DWORD PTR _cgival$[ebp+16], eax

; 1740 : 	DynBuffer *sql = NULL;

	mov	DWORD PTR _sql$[ebp], 0

; 1741 : 	QryBuild flt1 = {{0}};

	mov	DWORD PTR _flt1$[ebp], 0
	xor	ecx, ecx
	mov	DWORD PTR _flt1$[ebp+4], ecx
	mov	DWORD PTR _flt1$[ebp+8], ecx
	mov	DWORD PTR _flt1$[ebp+12], ecx
	mov	DWORD PTR _flt1$[ebp+16], ecx
	mov	ecx, 1109				; 00000455H
	xor	eax, eax
	lea	edi, DWORD PTR _flt1$[ebp+20]
	rep stosd

; 1742 : 	QryBuilNode *node = flt->node + flt->nbnode;

	mov	edx, DWORD PTR _flt$[ebp]
	mov	eax, DWORD PTR [edx+4424]
	imul	eax, 136				; 00000088H
	mov	ecx, DWORD PTR _flt$[ebp]
	lea	edx, DWORD PTR [ecx+eax+72]
	mov	DWORD PTR _node$[ebp], edx

; 1743 : 	char printbuf[1024];
; 1744 : 	unsigned long i;
; 1745 : 	int sql_trace = cntxt->sql_trace;

	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	ecx, DWORD PTR [eax+29852]
	mov	DWORD PTR _sql_trace$[ebp], ecx

; 1746 : 	DynTableCell *fltlabel = DYNTAB_FIELD_CELL(flt_data, LABEL);

	push	0
	push	-1
	push	OFFSET FLAT:$SG72558
	mov	edx, DWORD PTR _flt_data$[ebp]
	push	edx
	call	_dyntab_field_cell
	add	esp, 16					; 00000010H
	mov	DWORD PTR _fltlabel$[ebp], eax

; 1747 : 
; 1748 : 	/* Handle debug */
; 1749 : 	flt->debug |= *DYNTAB_FIELD_VAL(flt_data, DEBUG_SQL_FILTER) == '1';

	push	0
	push	-1
	push	OFFSET FLAT:$SG72559
	mov	eax, DWORD PTR _flt_data$[ebp]
	push	eax
	call	_dyntab_field_val
	add	esp, 16					; 00000010H
	movsx	ecx, BYTE PTR [eax]
	xor	edx, edx
	cmp	ecx, 49					; 00000031H
	sete	dl
	mov	eax, DWORD PTR _flt$[ebp]
	mov	ecx, DWORD PTR [eax+4444]
	or	ecx, edx
	mov	edx, DWORD PTR _flt$[ebp]
	mov	DWORD PTR [edx+4444], ecx

; 1750 : 	if(flt->debug)

	mov	eax, DWORD PTR _flt$[ebp]
	cmp	DWORD PTR [eax+4444], 0
	je	$L72560

; 1752 : 		DYNBUF_ADD3_CELLP(&cntxt->debug_msg, "\n========> qry_parse_filter_nodes : ", fltlabel, NO_CONV, "");

	mov	ecx, DWORD PTR _fltlabel$[ebp]
	mov	DWORD PTR __c$72561[ebp], ecx
	cmp	DWORD PTR __c$72561[ebp], 0
	je	SHORT $L74451
	mov	edx, DWORD PTR __c$72561[ebp]
	mov	eax, DWORD PTR [edx+4]
	mov	DWORD PTR -5764+[ebp], eax
	jmp	SHORT $L74452
$L74451:
	mov	DWORD PTR -5764+[ebp], 0
$L74452:
	cmp	DWORD PTR __c$72561[ebp], 0
	je	SHORT $L74453
	mov	ecx, DWORD PTR __c$72561[ebp]
	mov	edx, DWORD PTR [ecx]
	mov	DWORD PTR -5768+[ebp], edx
	jmp	SHORT $L74454
$L74453:
	mov	DWORD PTR -5768+[ebp], 0
$L74454:
	push	0
	push	OFFSET FLAT:$SG72565
	push	0
	push	0
	mov	eax, DWORD PTR -5764+[ebp]
	push	eax
	mov	ecx, DWORD PTR -5768+[ebp]
	push	ecx
	push	36					; 00000024H
	push	OFFSET FLAT:$SG72566
	mov	edx, DWORD PTR _cntxt$[ebp]
	add	edx, 29864				; 000074a8H
	push	edx
	call	_dynbuf_add3
	add	esp, 36					; 00000024H
	test	eax, eax
	je	SHORT $L72564
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29872], OFFSET FLAT:$SG72568
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 1752		; 000006d8H
	jmp	$eva_err$72569
$L72564:

; 1753 : 		cntxt->sql_trace = DEBUG_SQL_RES;

	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29852], 2
$L72560:

; 1755 : 
; 1756 : 	/* Handle optimisation */
; 1757 : 	flt->b_straightjoin |= *DYNTAB_FIELD_VAL(flt_data, OPTIMIZER) == '1';

	push	0
	push	-1
	push	OFFSET FLAT:$SG72570
	mov	eax, DWORD PTR _flt_data$[ebp]
	push	eax
	call	_dyntab_field_val
	add	esp, 16					; 00000010H
	movsx	ecx, BYTE PTR [eax]
	xor	edx, edx
	cmp	ecx, 49					; 00000031H
	sete	dl
	mov	eax, DWORD PTR _flt$[ebp]
	mov	ecx, DWORD PTR [eax+60]
	or	ecx, edx
	mov	edx, DWORD PTR _flt$[ebp]
	mov	DWORD PTR [edx+60], ecx

; 1758 : 
; 1759 : 	/* Check params */
; 1760 : 	if(!flt || !flt_data || !flt_data->nbrows) RETURN_OK;

	cmp	DWORD PTR _flt$[ebp], 0
	je	SHORT $L72572
	cmp	DWORD PTR _flt_data$[ebp], 0
	je	SHORT $L72572
	mov	eax, DWORD PTR _flt_data$[ebp]
	cmp	DWORD PTR [eax], 0
	jne	SHORT $L72571
$L72572:
	jmp	$eva_noerr$72573
$L72571:

; 1761 : 
; 1762 : 	/* Check if filter is enabled */
; 1763 : 	GET_ATTR(fltfield, ACTIVATE_FILTER);

	lea	ecx, DWORD PTR _fltfield$[ebp]
	push	ecx
	call	_dyntab_free
	add	esp, 4
	push	0
	push	-1
	push	OFFSET FLAT:$SG72576
	mov	edx, DWORD PTR _flt_data$[ebp]
	push	edx
	push	1
	lea	eax, DWORD PTR _fltfield$[ebp]
	push	eax
	call	_dyntab_filter_field
	add	esp, 24					; 00000018H
	test	eax, eax
	je	SHORT $L72575
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29872], OFFSET FLAT:$SG72578
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 1763		; 000006e3H
	jmp	$eva_err$72569
$L72575:

; 1764 : 	if(fltfield.nbrows)

	cmp	DWORD PTR _fltfield$[ebp], 0
	je	$L72579

; 1766 : 		/* A condition is given : evaluate on current form & object */
; 1767 : 		DYNBUF_ADD_STR(&sql, "=");

	push	0
	push	0
	push	1
	push	OFFSET FLAT:$SG72582
	lea	eax, DWORD PTR _sql$[ebp]
	push	eax
	call	_dynbuf_add
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L72581
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29872], OFFSET FLAT:$SG72584
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 1767		; 000006e7H
	jmp	$eva_err$72569
$L72581:

; 1768 : 		if(qry_filterlist_to_sql(cntxt, &sql, &fltfield, "AND")) CLEAR_ERROR;

	push	OFFSET FLAT:$SG72586
	lea	eax, DWORD PTR _fltfield$[ebp]
	push	eax
	lea	ecx, DWORD PTR _sql$[ebp]
	push	ecx
	mov	edx, DWORD PTR _cntxt$[ebp]
	push	edx
	call	_qry_filterlist_to_sql
	add	esp, 16					; 00000010H
	test	eax, eax
	je	SHORT $L72585
	push	1768					; 000006e8H
	push	OFFSET FLAT:$SG72587
	push	OFFSET FLAT:$SG72588
	mov	eax, DWORD PTR _cntxt$[ebp]
	push	eax
	call	_err_clear
	add	esp, 16					; 00000010H
$L72585:

; 1769 : 		if(sql && form_eval_fieldexpr(cntxt, &fltval,
; 1770 : 					DYNTAB_TOUL(&form->id_form), DYNTAB_TOUL(&form->id_obj),
; 1771 : 					DYNBUF_VAL_SZ(sql), NULL, 0)) CLEAR_ERROR;

	cmp	DWORD PTR _sql$[ebp], 0
	je	$L72593
	cmp	DWORD PTR _sql$[ebp], 0
	je	SHORT $L74455
	mov	ecx, DWORD PTR _sql$[ebp]
	mov	edx, DWORD PTR [ecx+4]
	mov	DWORD PTR -5772+[ebp], edx
	jmp	SHORT $L74456
$L74455:
	mov	DWORD PTR -5772+[ebp], 0
$L74456:
	cmp	DWORD PTR _sql$[ebp], 0
	je	SHORT $L74457
	mov	eax, DWORD PTR _sql$[ebp]
	add	eax, 8
	mov	DWORD PTR -5776+[ebp], eax
	jmp	SHORT $L74458
$L74457:
	mov	DWORD PTR -5776+[ebp], 0
$L74458:
	push	0
	push	0
	mov	ecx, DWORD PTR -5772+[ebp]
	push	ecx
	mov	edx, DWORD PTR -5776+[ebp]
	push	edx
	push	10					; 0000000aH
	push	0
	push	0
	push	0
	mov	eax, DWORD PTR _form$[ebp]
	add	eax, 32					; 00000020H
	push	eax
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
	mov	ecx, DWORD PTR _form$[ebp]
	add	ecx, 12					; 0000000cH
	push	ecx
	call	_dyntab_val
	add	esp, 12					; 0000000cH
	push	eax
	call	_strtoul
	add	esp, 12					; 0000000cH
	push	eax
	lea	edx, DWORD PTR _fltval$[ebp]
	push	edx
	mov	eax, DWORD PTR _cntxt$[ebp]
	push	eax
	call	_form_eval_fieldexpr
	add	esp, 32					; 00000020H
	test	eax, eax
	je	SHORT $L72593
	push	1771					; 000006ebH
	push	OFFSET FLAT:$SG72594
	push	OFFSET FLAT:$SG72595
	mov	ecx, DWORD PTR _cntxt$[ebp]
	push	ecx
	call	_err_clear
	add	esp, 16					; 00000010H
$L72593:

; 1772 : 
; 1773 : 		/* Ignore condition if result is not "1" */
; 1774 : 		if(strcmp(dyntab_val(&fltval, 0, 0), "1")) RETURN_OK;

	push	OFFSET FLAT:$SG72597
	push	0
	push	0
	lea	edx, DWORD PTR _fltval$[ebp]
	push	edx
	call	_dyntab_val
	add	esp, 12					; 0000000cH
	push	eax
	call	_strcmp
	add	esp, 8
	test	eax, eax
	je	SHORT $L72596
	jmp	$eva_noerr$72573
$L72596:

; 1775 : 		dyntab_free(&fltfield);

	lea	eax, DWORD PTR _fltfield$[ebp]
	push	eax
	call	_dyntab_free
	add	esp, 4

; 1776 : 		dyntab_free(&fltval);

	lea	ecx, DWORD PTR _fltval$[ebp]
	push	ecx
	call	_dyntab_free
	add	esp, 4

; 1777 : 		M_FREE(sql);

	mov	edx, DWORD PTR _sql$[ebp]
	push	edx
	call	_mem_free
	add	esp, 4
	mov	DWORD PTR _sql$[ebp], 0
$L72579:

; 1779 : 
; 1780 : 	/* Add filter name & id for further use */
; 1781 : 	DYNTAB_ADD_CELLP(&flt->name, flt->name.nbrows, 0, fltlabel);

	push	1
	mov	eax, DWORD PTR _fltlabel$[ebp]
	push	eax
	push	0
	mov	ecx, DWORD PTR _flt$[ebp]
	mov	edx, DWORD PTR [ecx]
	push	edx
	mov	eax, DWORD PTR _flt$[ebp]
	push	eax
	call	_dyntab_copy
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L72598
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29872], OFFSET FLAT:$SG72600
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 1781		; 000006f5H
	jmp	$eva_err$72569
$L72598:

; 1782 : 	DYNTAB_ADD_INT(&flt->name, flt->name.nbrows - 1, 1, flt_data->cell->IdObj);

	mov	BYTE PTR __tmp$72601[ebp], 0
	mov	ecx, 7
	xor	eax, eax
	lea	edi, DWORD PTR __tmp$72601[ebp+1]
	rep stosd
	stosw
	stosb
	mov	eax, DWORD PTR _flt_data$[ebp]
	mov	ecx, DWORD PTR [eax+16]
	mov	edx, DWORD PTR [ecx+20]
	push	edx
	push	OFFSET FLAT:$SG72602
	lea	eax, DWORD PTR __tmp$72601[ebp]
	push	eax
	call	_sprintf
	add	esp, 12					; 0000000cH
	push	0
	push	0
	push	0
	lea	ecx, DWORD PTR __tmp$72601[ebp]
	push	ecx
	push	1
	mov	edx, DWORD PTR _flt$[ebp]
	mov	eax, DWORD PTR [edx]
	sub	eax, 1
	push	eax
	mov	ecx, DWORD PTR _flt$[ebp]
	push	ecx
	call	_dyntab_add
	add	esp, 28					; 0000001cH
	test	eax, eax
	je	SHORT $L72604
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29872], OFFSET FLAT:$SG72606
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 1782		; 000006f6H
	jmp	$eva_err$72569
$L72604:

; 1783 : 
; 1784 : 	/* Process depending on filter type */
; 1785 : 	if(!strcmp("_EVA_FILTER_LISTOBJ", flttype) ||
; 1786 : 		!strcmp("_EVA_LISTOBJ", flttype))

	mov	ecx, DWORD PTR _flttype$[ebp]
	push	ecx
	push	OFFSET FLAT:$SG72609
	call	_strcmp
	add	esp, 8
	test	eax, eax
	je	SHORT $L72608
	mov	edx, DWORD PTR _flttype$[ebp]
	push	edx
	push	OFFSET FLAT:$SG72610
	call	_strcmp
	add	esp, 8
	test	eax, eax
	jne	$L72607
$L72608:

; 1788 : 		/* List of predefined objects */
; 1789 : 		GET_ATTR(node->value, LISTOBJ);

	mov	eax, DWORD PTR _node$[ebp]
	add	eax, 32					; 00000020H
	push	eax
	call	_dyntab_free
	add	esp, 4
	push	0
	push	-1
	push	OFFSET FLAT:$SG72613
	mov	ecx, DWORD PTR _flt_data$[ebp]
	push	ecx
	push	1
	mov	edx, DWORD PTR _node$[ebp]
	add	edx, 32					; 00000020H
	push	edx
	call	_dyntab_filter_field
	add	esp, 24					; 00000018H
	test	eax, eax
	je	SHORT $L72612
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29872], OFFSET FLAT:$SG72615
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 1789		; 000006fdH
	jmp	$eva_err$72569
$L72612:

; 1790 : 		if(qry_add_filter(cntxt, flt, RelNone, NULL, ObjList, NULL)) STACK_ERROR;

	push	0
	push	1
	push	0
	push	0
	mov	edx, DWORD PTR _flt$[ebp]
	push	edx
	mov	eax, DWORD PTR _cntxt$[ebp]
	push	eax
	call	_qry_add_filter
	add	esp, 24					; 00000018H
	test	eax, eax
	je	SHORT $L72618
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 1790		; 000006feH
	jmp	$eva_err$72569
$L72618:

; 1792 : 	else if(!strcmp("_EVA_FILTER_FORM", flttype))

	jmp	$L72766
$L72607:
	mov	edx, DWORD PTR _flttype$[ebp]
	push	edx
	push	OFFSET FLAT:$SG72621
	call	_strcmp
	add	esp, 8
	test	eax, eax
	jne	$L72620

; 1794 : 		/* Objects created/edited with one or more forms */
; 1795 : 		GET_ATTR(node->value, FILTER_FORM);

	mov	eax, DWORD PTR _node$[ebp]
	add	eax, 32					; 00000020H
	push	eax
	call	_dyntab_free
	add	esp, 4
	push	0
	push	-1
	push	OFFSET FLAT:$SG72624
	mov	ecx, DWORD PTR _flt_data$[ebp]
	push	ecx
	push	1
	mov	edx, DWORD PTR _node$[ebp]
	add	edx, 32					; 00000020H
	push	edx
	call	_dyntab_filter_field
	add	esp, 24					; 00000018H
	test	eax, eax
	je	SHORT $L72623
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29872], OFFSET FLAT:$SG72626
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 1795		; 00000703H
	jmp	$eva_err$72569
$L72623:

; 1796 : 		DYNTAB_ADD_TXTID(&node->field, 0, 0, "_EVA_FORMSTAMP", cntxt->val_FORMSTAMP);

	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	eax, DWORD PTR [edx+269636]
	mov	DWORD PTR _id$72627[ebp], eax
	mov	DWORD PTR _row$72628[ebp], 0
	mov	DWORD PTR _col$72629[ebp], 0
	push	0
	push	0
	push	14					; 0000000eH
	push	OFFSET FLAT:$SG72633
	mov	ecx, DWORD PTR _col$72629[ebp]
	push	ecx
	mov	edx, DWORD PTR _row$72628[ebp]
	push	edx
	mov	eax, DWORD PTR _node$[ebp]
	push	eax
	call	_dyntab_add
	add	esp, 28					; 0000001cH
	test	eax, eax
	je	SHORT $L72632
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29872], OFFSET FLAT:$SG72635
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 1796		; 00000704H
	jmp	$eva_err$72569
$L72632:
	mov	eax, DWORD PTR _col$72629[ebp]
	push	eax
	mov	ecx, DWORD PTR _row$72628[ebp]
	push	ecx
	mov	edx, DWORD PTR _node$[ebp]
	push	edx
	call	_dyntab_cell
	add	esp, 12					; 0000000cH
	mov	DWORD PTR __c$72630[ebp], eax
	mov	eax, DWORD PTR __c$72630[ebp]
	mov	ecx, DWORD PTR _id$72627[ebp]
	mov	DWORD PTR [eax+32], ecx

; 1797 : 		if(qry_add_create_del_filter(cntxt, flt, flt_data)) STACK_ERROR;

	mov	edx, DWORD PTR _flt_data$[ebp]
	push	edx
	mov	eax, DWORD PTR _flt$[ebp]
	push	eax
	mov	ecx, DWORD PTR _cntxt$[ebp]
	push	ecx
	call	_qry_add_create_del_filter
	add	esp, 12					; 0000000cH
	test	eax, eax
	je	SHORT $L72636
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 1797		; 00000705H
	jmp	$eva_err$72569
$L72636:

; 1798 : 		if(qry_add_filter(cntxt, flt, RelNone, NULL, RelList, NULL)) STACK_ERROR;

	push	0
	push	3
	push	0
	push	0
	mov	eax, DWORD PTR _flt$[ebp]
	push	eax
	mov	ecx, DWORD PTR _cntxt$[ebp]
	push	ecx
	call	_qry_add_filter
	add	esp, 24					; 00000018H
	test	eax, eax
	je	SHORT $L72639
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 1798		; 00000706H
	jmp	$eva_err$72569
$L72639:

; 1800 : 	else if(!strcmp("_EVA_FILTER_CTRLVAL", flttype))

	jmp	$L72766
$L72620:
	mov	eax, DWORD PTR _flttype$[ebp]
	push	eax
	push	OFFSET FLAT:$SG72642
	call	_strcmp
	add	esp, 8
	test	eax, eax
	jne	$L72641

; 1802 : 		/* Value of an input control - split values / relations fields & add appropriate filters */
; 1803 : 		if(qry_parse_relval_fields(cntxt, &fltfield, &fltform, flt_data)) STACK_ERROR;

	mov	ecx, DWORD PTR _flt_data$[ebp]
	push	ecx
	lea	edx, DWORD PTR _fltform$[ebp]
	push	edx
	lea	eax, DWORD PTR _fltfield$[ebp]
	push	eax
	mov	ecx, DWORD PTR _cntxt$[ebp]
	push	ecx
	call	_qry_parse_relval_fields
	add	esp, 16					; 00000010H
	test	eax, eax
	je	SHORT $L72643
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 1803		; 0000070bH
	jmp	$eva_err$72569
$L72643:

; 1804 : 		if(fltfield.nbrows && qry_parse_filter_val(cntxt, flt, &fltfield, flt_data)) STACK_ERROR;

	cmp	DWORD PTR _fltfield$[ebp], 0
	je	SHORT $L72644
	mov	eax, DWORD PTR _flt_data$[ebp]
	push	eax
	lea	ecx, DWORD PTR _fltfield$[ebp]
	push	ecx
	mov	edx, DWORD PTR _flt$[ebp]
	push	edx
	mov	eax, DWORD PTR _cntxt$[ebp]
	push	eax
	call	_qry_parse_filter_val
	add	esp, 16					; 00000010H
	test	eax, eax
	je	SHORT $L72644
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 1804		; 0000070cH
	jmp	$eva_err$72569
$L72644:

; 1805 : 		if(fltform.nbrows && qry_parse_filter_rel(cntxt, flt, &fltform, flt_data)) STACK_ERROR;

	cmp	DWORD PTR _fltform$[ebp], 0
	je	SHORT $L72645
	mov	edx, DWORD PTR _flt_data$[ebp]
	push	edx
	lea	eax, DWORD PTR _fltform$[ebp]
	push	eax
	mov	ecx, DWORD PTR _flt$[ebp]
	push	ecx
	mov	edx, DWORD PTR _cntxt$[ebp]
	push	edx
	call	_qry_parse_filter_rel
	add	esp, 16					; 00000010H
	test	eax, eax
	je	SHORT $L72645
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 1805		; 0000070dH
	jmp	$eva_err$72569
$L72645:

; 1807 : 	else if(!strcmp("_EVA_FILTER_FIELD", flttype))

	jmp	$L72766
$L72641:
	mov	ecx, DWORD PTR _flttype$[ebp]
	push	ecx
	push	OFFSET FLAT:$SG72648
	call	_strcmp
	add	esp, 8
	test	eax, eax
	jne	$L72647

; 1809 : 		/* Objects with given fields & values */
; 1810 : 		GET_ATTR(fltfield, FILTER_FIELD);

	lea	edx, DWORD PTR _fltfield$[ebp]
	push	edx
	call	_dyntab_free
	add	esp, 4
	push	0
	push	-1
	push	OFFSET FLAT:$SG72651
	mov	eax, DWORD PTR _flt_data$[ebp]
	push	eax
	push	1
	lea	ecx, DWORD PTR _fltfield$[ebp]
	push	ecx
	call	_dyntab_filter_field
	add	esp, 24					; 00000018H
	test	eax, eax
	je	SHORT $L72650
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29872], OFFSET FLAT:$SG72653
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 1810		; 00000712H
	jmp	$eva_err$72569
$L72650:

; 1811 : 		if(qry_parse_filter_val(cntxt, flt, &fltfield, flt_data)) STACK_ERROR;

	mov	ecx, DWORD PTR _flt_data$[ebp]
	push	ecx
	lea	edx, DWORD PTR _fltfield$[ebp]
	push	edx
	mov	eax, DWORD PTR _flt$[ebp]
	push	eax
	mov	ecx, DWORD PTR _cntxt$[ebp]
	push	ecx
	call	_qry_parse_filter_val
	add	esp, 16					; 00000010H
	test	eax, eax
	je	SHORT $L72654
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 1811		; 00000713H
	jmp	$eva_err$72569
$L72654:

; 1813 : 	else if(!strcmp("_EVA_FILTER_REL", flttype))

	jmp	$L72766
$L72647:
	mov	eax, DWORD PTR _flttype$[ebp]
	push	eax
	push	OFFSET FLAT:$SG72657
	call	_strcmp
	add	esp, 8
	test	eax, eax
	jne	$L72656

; 1815 : 		/* Relation with other objects */
; 1816 : 		GET_ATTR(fltfield, FILTER_REL);

	lea	ecx, DWORD PTR _fltfield$[ebp]
	push	ecx
	call	_dyntab_free
	add	esp, 4
	push	0
	push	-1
	push	OFFSET FLAT:$SG72660
	mov	edx, DWORD PTR _flt_data$[ebp]
	push	edx
	push	1
	lea	eax, DWORD PTR _fltfield$[ebp]
	push	eax
	call	_dyntab_filter_field
	add	esp, 24					; 00000018H
	test	eax, eax
	je	SHORT $L72659
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29872], OFFSET FLAT:$SG72662
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 1816		; 00000718H
	jmp	$eva_err$72569
$L72659:

; 1817 : 		if(qry_parse_filter_rel(cntxt, flt, &fltfield, flt_data)) STACK_ERROR;

	mov	eax, DWORD PTR _flt_data$[ebp]
	push	eax
	lea	ecx, DWORD PTR _fltfield$[ebp]
	push	ecx
	mov	edx, DWORD PTR _flt$[ebp]
	push	edx
	mov	eax, DWORD PTR _cntxt$[ebp]
	push	eax
	call	_qry_parse_filter_rel
	add	esp, 16					; 00000010H
	test	eax, eax
	je	SHORT $L72663
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 1817		; 00000719H
	jmp	$eva_err$72569
$L72663:

; 1819 : 	else if(!strcmp("_EVA_FILTER", flttype) ||

	jmp	$L72766
$L72656:

; 1820 : 			!strcmp("_EVA_FILTER_AND", flttype) ||
; 1821 : 			!strcmp("_EVA_FILTER_ANDJOIN", flttype))

	mov	edx, DWORD PTR _flttype$[ebp]
	push	edx
	push	OFFSET FLAT:$SG72667
	call	_strcmp
	add	esp, 8
	test	eax, eax
	je	SHORT $L72666
	mov	eax, DWORD PTR _flttype$[ebp]
	push	eax
	push	OFFSET FLAT:$SG72668
	call	_strcmp
	add	esp, 8
	test	eax, eax
	je	SHORT $L72666
	mov	ecx, DWORD PTR _flttype$[ebp]
	push	ecx
	push	OFFSET FLAT:$SG72669
	call	_strcmp
	add	esp, 8
	test	eax, eax
	jne	SHORT $L72665
$L72666:

; 1823 : 		/* AND combination of filters on same object  - process filter list */
; 1824 : 		GET_ATTR(fltval, FILTERS);

	lea	edx, DWORD PTR _fltval$[ebp]
	push	edx
	call	_dyntab_free
	add	esp, 4
	push	0
	push	-1
	push	OFFSET FLAT:$SG72672
	mov	eax, DWORD PTR _flt_data$[ebp]
	push	eax
	push	1
	lea	ecx, DWORD PTR _fltval$[ebp]
	push	ecx
	call	_dyntab_filter_field
	add	esp, 24					; 00000018H
	test	eax, eax
	je	SHORT $L72671
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29872], OFFSET FLAT:$SG72674
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 1824		; 00000720H
	jmp	$eva_err$72569
$L72671:

; 1825 : 		if(qry_add_filterlist(cntxt, flt, &fltval)) STACK_ERROR;

	lea	ecx, DWORD PTR _fltval$[ebp]
	push	ecx
	mov	edx, DWORD PTR _flt$[ebp]
	push	edx
	mov	eax, DWORD PTR _cntxt$[ebp]
	push	eax
	call	_qry_add_filterlist
	add	esp, 12					; 0000000cH
	test	eax, eax
	je	SHORT $L72675
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 1825		; 00000721H
	jmp	$eva_err$72569
$L72675:

; 1827 : 	else if(!strcmp("_EVA_FILTER_SQLNODE", flttype))

	jmp	$L72766
$L72665:
	mov	edx, DWORD PTR _flttype$[ebp]
	push	edx
	push	OFFSET FLAT:$SG72678
	call	_strcmp
	add	esp, 8
	test	eax, eax
	jne	SHORT $L72677

; 1829 : 		/* SQL condition on node - replace variables with their values & put result in node condition */
; 1830 : 		if(qry_eval_sqlexpr_var(cntxt, &node->cond, DYNTAB_FIELD_VAL(flt_data, FILTER_COND), flt_data, NULL)) STACK_ERROR;

	push	0
	mov	eax, DWORD PTR _flt_data$[ebp]
	push	eax
	push	0
	push	-1
	push	OFFSET FLAT:$SG72681
	mov	ecx, DWORD PTR _flt_data$[ebp]
	push	ecx
	call	_dyntab_field_val
	add	esp, 16					; 00000010H
	push	eax
	mov	edx, DWORD PTR _node$[ebp]
	add	edx, 124				; 0000007cH
	push	edx
	mov	eax, DWORD PTR _cntxt$[ebp]
	push	eax
	call	_qry_eval_sqlexpr_var
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L72680
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 1830		; 00000726H
	jmp	$eva_err$72569
$L72680:

; 1831 : 		node->srcjoin = flt->srcjoin;

	mov	edx, DWORD PTR _node$[ebp]
	mov	eax, DWORD PTR _flt$[ebp]
	mov	ecx, DWORD PTR [eax+64]
	mov	DWORD PTR [edx+56], ecx

; 1832 : 		flt->nbnode++;

	mov	edx, DWORD PTR _flt$[ebp]
	mov	eax, DWORD PTR [edx+4424]
	add	eax, 1
	mov	ecx, DWORD PTR _flt$[ebp]
	mov	DWORD PTR [ecx+4424], eax

; 1835 : 	else if(!strcmp("_EVA_FILTER_SQL", flttype))

	jmp	$L72766
$L72677:
	mov	edx, DWORD PTR _flttype$[ebp]
	push	edx
	push	OFFSET FLAT:$SG72684
	call	_strcmp
	add	esp, 8
	test	eax, eax
	jne	$L72683

; 1837 : 		/* SQL condition - replace variables with their values & place result in list of objects */
; 1838 : 		if(qry_eval_sqlexpr_var(cntxt, &sql, DYNTAB_FIELD_VAL(flt_data, FILTER_SQL), flt_data, NULL)) STACK_ERROR;

	push	0
	mov	eax, DWORD PTR _flt_data$[ebp]
	push	eax
	push	0
	push	-1
	push	OFFSET FLAT:$SG72687
	mov	ecx, DWORD PTR _flt_data$[ebp]
	push	ecx
	call	_dyntab_field_val
	add	esp, 16					; 00000010H
	push	eax
	lea	edx, DWORD PTR _sql$[ebp]
	push	edx
	mov	eax, DWORD PTR _cntxt$[ebp]
	push	eax
	call	_qry_eval_sqlexpr_var
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L72686
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 1838		; 0000072eH
	jmp	$eva_err$72569
$L72686:

; 1839 : 		if(sql)

	cmp	DWORD PTR _sql$[ebp], 0
	je	$L72688

; 1841 : 			if(sql_exec_query(cntxt, sql->data) || sql_get_table(cntxt, &node->idobjmatch, 0)) STACK_ERROR;

	mov	edx, DWORD PTR _sql$[ebp]
	add	edx, 8
	push	edx
	mov	eax, DWORD PTR _cntxt$[ebp]
	push	eax
	call	_sql_exec_query
	add	esp, 8
	test	eax, eax
	jne	SHORT $L72690
	push	0
	mov	ecx, DWORD PTR _node$[ebp]
	add	ecx, 96					; 00000060H
	push	ecx
	mov	edx, DWORD PTR _cntxt$[ebp]
	push	edx
	call	_sql_get_table
	add	esp, 12					; 0000000cH
	test	eax, eax
	je	SHORT $L72689
$L72690:
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 1841		; 00000731H
	jmp	$eva_err$72569
$L72689:

; 1842 : 			if(!node->idobjmatch.nbrows) DYNTAB_ADD_INT(&node->idobjmatch, 0, 0, (unsigned long int)0);

	mov	ecx, DWORD PTR _node$[ebp]
	cmp	DWORD PTR [ecx+96], 0
	jne	SHORT $L72696
	mov	BYTE PTR __tmp$72692[ebp], 0
	mov	ecx, 7
	xor	eax, eax
	lea	edi, DWORD PTR __tmp$72692[ebp+1]
	rep stosd
	stosw
	stosb
	push	0
	push	OFFSET FLAT:$SG72694
	lea	edx, DWORD PTR __tmp$72692[ebp]
	push	edx
	call	_sprintf
	add	esp, 12					; 0000000cH
	push	0
	push	0
	push	0
	lea	eax, DWORD PTR __tmp$72692[ebp]
	push	eax
	push	0
	push	0
	mov	ecx, DWORD PTR _node$[ebp]
	add	ecx, 96					; 00000060H
	push	ecx
	call	_dyntab_add
	add	esp, 28					; 0000001cH
	test	eax, eax
	je	SHORT $L72696
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29872], OFFSET FLAT:$SG72698
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 1842		; 00000732H
	jmp	$eva_err$72569
$L72696:

; 1843 : 			flt->nbnode++;

	mov	ecx, DWORD PTR _flt$[ebp]
	mov	edx, DWORD PTR [ecx+4424]
	add	edx, 1
	mov	eax, DWORD PTR _flt$[ebp]
	mov	DWORD PTR [eax+4424], edx
$L72688:

; 1846 : 	else if(!strcmp("_EVA_FILTER_SQLCOND", flttype))

	jmp	$L72766
$L72683:
	mov	ecx, DWORD PTR _flttype$[ebp]
	push	ecx
	push	OFFSET FLAT:$SG72701
	call	_strcmp
	add	esp, 8
	test	eax, eax
	jne	$L72700

; 1848 : 		/* Mixed SQL / fields expression : optimize if source join is first */
; 1849 : 		if(!flt->srcjoin && (flt->nbnode || node->idobjmatch.nbrows))

	mov	edx, DWORD PTR _flt$[ebp]
	cmp	DWORD PTR [edx+64], 0
	jne	$L72702
	mov	eax, DWORD PTR _flt$[ebp]
	cmp	DWORD PTR [eax+4424], 0
	jne	SHORT $L72703
	mov	ecx, DWORD PTR _node$[ebp]
	cmp	DWORD PTR [ecx+96], 0
	je	$L72702
$L72703:

; 1851 : 			/* Exec filter at its current status & replace with IdObj condition */
; 1852 : 			static unsigned tblnum = 0;
; 1853 : 			char tblname[16];
; 1854 : 			size_t tblsz = sprintf(tblname, "tmpSQL%u", tblnum++);

	mov	edx, DWORD PTR _?tblnum@?DG@??qry_parse_filter_nodes@@9@9
	mov	DWORD PTR -5780+[ebp], edx
	mov	eax, DWORD PTR -5780+[ebp]
	push	eax
	push	OFFSET FLAT:$SG72708
	lea	ecx, DWORD PTR _tblname$72706[ebp]
	push	ecx
	mov	edx, DWORD PTR _?tblnum@?DG@??qry_parse_filter_nodes@@9@9
	add	edx, 1
	mov	DWORD PTR _?tblnum@?DG@??qry_parse_filter_nodes@@9@9, edx
	call	_sprintf
	add	esp, 12					; 0000000cH
	mov	DWORD PTR _tblsz$72707[ebp], eax

; 1855 : 			node = flt->node;

	mov	eax, DWORD PTR _flt$[ebp]
	add	eax, 72					; 00000048H
	mov	DWORD PTR _node$[ebp], eax

; 1856 : 			DYNBUF_ADD3(&sql, "CREATE TEMPORARY TABLE ", tblname, tblsz, NO_CONV, " TYPE=HEAP \n");

	push	12					; 0000000cH
	push	OFFSET FLAT:$SG72711
	push	0
	push	0
	mov	ecx, DWORD PTR _tblsz$72707[ebp]
	push	ecx
	lea	edx, DWORD PTR _tblname$72706[ebp]
	push	edx
	push	23					; 00000017H
	push	OFFSET FLAT:$SG72712
	lea	eax, DWORD PTR _sql$[ebp]
	push	eax
	call	_dynbuf_add3
	add	esp, 36					; 00000024H
	test	eax, eax
	je	SHORT $L72710
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29872], OFFSET FLAT:$SG72714
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 1856		; 00000740H
	jmp	$eva_err$72569
$L72710:

; 1857 : 			if( qry_build_clauses(cntxt, flt, 1) ||
; 1858 : 				qry_build_flt_select(cntxt, &sql, &node->idobjmatch, flt, 0, 0) ||
; 1859 : 				sql_exec_query(cntxt, sql->data)) STACK_ERROR;

	push	1
	mov	eax, DWORD PTR _flt$[ebp]
	push	eax
	mov	ecx, DWORD PTR _cntxt$[ebp]
	push	ecx
	call	_qry_build_clauses
	add	esp, 12					; 0000000cH
	test	eax, eax
	jne	SHORT $L72716
	push	0
	push	0
	mov	edx, DWORD PTR _flt$[ebp]
	push	edx
	mov	eax, DWORD PTR _node$[ebp]
	add	eax, 96					; 00000060H
	push	eax
	lea	ecx, DWORD PTR _sql$[ebp]
	push	ecx
	mov	edx, DWORD PTR _cntxt$[ebp]
	push	edx
	call	_qry_build_flt_select
	add	esp, 24					; 00000018H
	test	eax, eax
	jne	SHORT $L72716
	mov	eax, DWORD PTR _sql$[ebp]
	add	eax, 8
	push	eax
	mov	ecx, DWORD PTR _cntxt$[ebp]
	push	ecx
	call	_sql_exec_query
	add	esp, 8
	test	eax, eax
	je	SHORT $L72715
$L72716:
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 1859		; 00000743H
	jmp	$eva_err$72569
$L72715:

; 1860 : 			sql->cnt = 0;

	mov	eax, DWORD PTR _sql$[ebp]
	mov	DWORD PTR [eax+4], 0

; 1861 : 			DYNBUF_ADD3(&sql, "ALTER TABLE ", tblname, tblsz, NO_CONV, " ADD INDEX (IdObj)");

	push	18					; 00000012H
	push	OFFSET FLAT:$SG72719
	push	0
	push	0
	mov	ecx, DWORD PTR _tblsz$72707[ebp]
	push	ecx
	lea	edx, DWORD PTR _tblname$72706[ebp]
	push	edx
	push	12					; 0000000cH
	push	OFFSET FLAT:$SG72720
	lea	eax, DWORD PTR _sql$[ebp]
	push	eax
	call	_dynbuf_add3
	add	esp, 36					; 00000024H
	test	eax, eax
	je	SHORT $L72718
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29872], OFFSET FLAT:$SG72722
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 1861		; 00000745H
	jmp	$eva_err$72569
$L72718:

; 1862 : 			if(sql_exec_query(cntxt, sql->data)) STACK_ERROR;

	mov	eax, DWORD PTR _sql$[ebp]
	add	eax, 8
	push	eax
	mov	ecx, DWORD PTR _cntxt$[ebp]
	push	ecx
	call	_sql_exec_query
	add	esp, 8
	test	eax, eax
	je	SHORT $L72723
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 1862		; 00000746H
	jmp	$eva_err$72569
$L72723:

; 1863 : 			qry_build_free_nodes(flt);

	mov	eax, DWORD PTR _flt$[ebp]
	push	eax
	call	_qry_build_free_nodes
	add	esp, 4

; 1864 : 			if(qry_filter_sql_fieldexpr(cntxt, &node->idobjmatch, DYNTAB_FIELD_VAL(flt_data, FILTER_COND),
; 1865 : 						tblname, flt_data)) STACK_ERROR;

	mov	ecx, DWORD PTR _flt_data$[ebp]
	push	ecx
	lea	edx, DWORD PTR _tblname$72706[ebp]
	push	edx
	push	0
	push	-1
	push	OFFSET FLAT:$SG72725
	mov	eax, DWORD PTR _flt_data$[ebp]
	push	eax
	call	_dyntab_field_val
	add	esp, 16					; 00000010H
	push	eax
	mov	ecx, DWORD PTR _node$[ebp]
	add	ecx, 96					; 00000060H
	push	ecx
	mov	edx, DWORD PTR _cntxt$[ebp]
	push	edx
	call	_qry_filter_sql_fieldexpr
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L72724
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 1865		; 00000749H
	jmp	$eva_err$72569
$L72724:

; 1866 : 			sql_drop_table(cntxt, tblname);

	lea	ecx, DWORD PTR _tblname$72706[ebp]
	push	ecx
	mov	edx, DWORD PTR _cntxt$[ebp]
	push	edx
	call	_sql_drop_table
	add	esp, 8

; 1868 : 		else

	jmp	SHORT $L72729
$L72702:

; 1870 : 			/* Filter objects matching expression on current node */
; 1871 : 			node = flt->node + flt->srcjoin;

	mov	eax, DWORD PTR _flt$[ebp]
	mov	ecx, DWORD PTR [eax+64]
	imul	ecx, 136				; 00000088H
	mov	edx, DWORD PTR _flt$[ebp]
	lea	eax, DWORD PTR [edx+ecx+72]
	mov	DWORD PTR _node$[ebp], eax

; 1872 : 			if(node->rel == RelDirect) node++;

	mov	ecx, DWORD PTR _node$[ebp]
	cmp	DWORD PTR [ecx+52], 1
	jne	SHORT $L72727
	mov	edx, DWORD PTR _node$[ebp]
	add	edx, 136				; 00000088H
	mov	DWORD PTR _node$[ebp], edx
$L72727:

; 1873 : 			if(qry_filter_sql_fieldexpr(cntxt, &node->idobjmatch, DYNTAB_FIELD_VAL(flt_data, FILTER_COND), NULL, flt_data)) STACK_ERROR;

	mov	eax, DWORD PTR _flt_data$[ebp]
	push	eax
	push	0
	push	0
	push	-1
	push	OFFSET FLAT:$SG72730
	mov	ecx, DWORD PTR _flt_data$[ebp]
	push	ecx
	call	_dyntab_field_val
	add	esp, 16					; 00000010H
	push	eax
	mov	edx, DWORD PTR _node$[ebp]
	add	edx, 96					; 00000060H
	push	edx
	mov	eax, DWORD PTR _cntxt$[ebp]
	push	eax
	call	_qry_filter_sql_fieldexpr
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L72729
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 1873		; 00000751H
	jmp	$eva_err$72569
$L72729:

; 1876 : 	else if(!strcmp("_EVA_FILTER_OR", flttype))

	jmp	$L72766
$L72700:
	mov	edx, DWORD PTR _flttype$[ebp]
	push	edx
	push	OFFSET FLAT:$SG72733
	call	_strcmp
	add	esp, 8
	test	eax, eax
	jne	$L72766

; 1878 : 		/* OR combination of filters on same object - use temporary table to build matched objects list */
; 1879 : 		char tmptbl[32] = {0};

	mov	BYTE PTR _tmptbl$72734[ebp], 0
	mov	ecx, 7
	xor	eax, eax
	lea	edi, DWORD PTR _tmptbl$72734[ebp+1]
	rep stosd
	stosw
	stosb

; 1880 : 		snprintf(add_sz_str(tmptbl), "Or%lX", clock());

	call	_clock
	push	eax
	push	OFFSET FLAT:$SG72735
	push	31					; 0000001fH
	lea	eax, DWORD PTR _tmptbl$72734[ebp]
	push	eax
	call	__snprintf
	add	esp, 16					; 00000010H

; 1881 : 		snprintf(add_sz_str(printbuf),
; 1882 : 			"-- OR combination - use temporary table %s\n"
; 1883 : 			"CREATE TEMPORARY TABLE %s (IdObj INT) TYPE=HEAP", tmptbl, tmptbl);

	lea	ecx, DWORD PTR _tmptbl$72734[ebp]
	push	ecx
	lea	edx, DWORD PTR _tmptbl$72734[ebp]
	push	edx
	push	OFFSET FLAT:$SG72736
	push	1023					; 000003ffH
	lea	eax, DWORD PTR _printbuf$[ebp]
	push	eax
	call	__snprintf
	add	esp, 20					; 00000014H

; 1884 : 		if(sql_exec_query(cntxt, printbuf)) STACK_ERROR;

	lea	ecx, DWORD PTR _printbuf$[ebp]
	push	ecx
	mov	edx, DWORD PTR _cntxt$[ebp]
	push	edx
	call	_sql_exec_query
	add	esp, 8
	test	eax, eax
	je	SHORT $L72737
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 1884		; 0000075cH
	jmp	$eva_err$72569
$L72737:

; 1885 : 		GET_ATTR(fltval, FILTERS);

	lea	ecx, DWORD PTR _fltval$[ebp]
	push	ecx
	call	_dyntab_free
	add	esp, 4
	push	0
	push	-1
	push	OFFSET FLAT:$SG72740
	mov	edx, DWORD PTR _flt_data$[ebp]
	push	edx
	push	1
	lea	eax, DWORD PTR _fltval$[ebp]
	push	eax
	call	_dyntab_filter_field
	add	esp, 24					; 00000018H
	test	eax, eax
	je	SHORT $L72739
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29872], OFFSET FLAT:$SG72742
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 1885		; 0000075dH
	jmp	$eva_err$72569
$L72739:

; 1886 : 
; 1887 : 		/* Process each filter */
; 1888 : 		for(i = 0; i < fltval.nbrows; i++)

	mov	DWORD PTR _i$[ebp], 0
	jmp	SHORT $L72743
$L72744:
	mov	eax, DWORD PTR _i$[ebp]
	add	eax, 1
	mov	DWORD PTR _i$[ebp], eax
$L72743:
	mov	ecx, DWORD PTR _i$[ebp]
	cmp	ecx, DWORD PTR _fltval$[ebp]
	jae	$L72745

; 1890 : 			qry_build_free(&flt1);

	lea	edx, DWORD PTR _flt1$[ebp]
	push	edx
	call	_qry_build_free
	add	esp, 4

; 1891 : 			M_FREE(sql);

	mov	eax, DWORD PTR _sql$[ebp]
	push	eax
	call	_mem_free
	add	esp, 4
	mov	DWORD PTR _sql$[ebp], 0

; 1892 : 			if( qry_obj_field(cntxt, &cgival, DYNTAB_TOULRC(&fltval, i, 0), NULL) ||
; 1893 : 				qry_parse_filter_nodes(cntxt, &flt1, &cgival)) STACK_ERROR;

	push	0
	push	10					; 0000000aH
	push	0
	push	0
	mov	ecx, DWORD PTR _i$[ebp]
	push	ecx
	lea	edx, DWORD PTR _fltval$[ebp]
	push	edx
	call	_dyntab_val
	add	esp, 12					; 0000000cH
	push	eax
	call	_strtoul
	add	esp, 12					; 0000000cH
	push	eax
	lea	eax, DWORD PTR _cgival$[ebp]
	push	eax
	mov	ecx, DWORD PTR _cntxt$[ebp]
	push	ecx
	call	_qry_obj_field
	add	esp, 16					; 00000010H
	test	eax, eax
	jne	SHORT $L72749
	lea	edx, DWORD PTR _cgival$[ebp]
	push	edx
	lea	eax, DWORD PTR _flt1$[ebp]
	push	eax
	mov	ecx, DWORD PTR _cntxt$[ebp]
	push	ecx
	call	_qry_parse_filter_nodes
	add	esp, 12					; 0000000cH
	test	eax, eax
	je	SHORT $L72748
$L72749:
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 1893		; 00000765H
	jmp	$eva_err$72569
$L72748:

; 1894 : 			if(flt1.nbnode || flt1.node->idobjmatch.nbrows)

	cmp	DWORD PTR _flt1$[ebp+4424], 0
	jne	SHORT $L72751
	cmp	DWORD PTR _flt1$[ebp+168], 0
	je	$L72756
$L72751:

; 1896 : 				dynbuf_print(&sql, "-- OR combination - [%s]\n", dyntab_val(&flt1.name, 0, 0));

	push	0
	push	0
	push	0
	push	0
	lea	eax, DWORD PTR _flt1$[ebp]
	push	eax
	call	_dyntab_val
	add	esp, 12					; 0000000cH
	push	eax
	push	OFFSET FLAT:$SG72753
	push	1023					; 000003ffH
	lea	ecx, DWORD PTR _printbuf$[ebp]
	push	ecx
	call	__snprintf
	add	esp, 16					; 00000010H
	push	eax
	lea	edx, DWORD PTR _printbuf$[ebp]
	push	edx
	lea	eax, DWORD PTR _sql$[ebp]
	push	eax
	call	_dynbuf_add
	add	esp, 20					; 00000014H

; 1897 : 				dynbuf_print(&sql, "INSERT INTO %s (IdObj)\n", tmptbl);

	push	0
	push	0
	lea	ecx, DWORD PTR _tmptbl$72734[ebp]
	push	ecx
	push	OFFSET FLAT:$SG72755
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

; 1898 : 				if( qry_build_clauses(cntxt, &flt1, 1) ||
; 1899 : 					qry_build_flt_select(cntxt, &sql, &flt->node[flt->srcjoin].idobjmatch, &flt1, 0, 0) ||
; 1900 : 					sql_exec_query(cntxt, sql->data)) STACK_ERROR;

	push	1
	lea	edx, DWORD PTR _flt1$[ebp]
	push	edx
	mov	eax, DWORD PTR _cntxt$[ebp]
	push	eax
	call	_qry_build_clauses
	add	esp, 12					; 0000000cH
	test	eax, eax
	jne	SHORT $L72757
	push	0
	push	0
	lea	ecx, DWORD PTR _flt1$[ebp]
	push	ecx
	mov	edx, DWORD PTR _flt$[ebp]
	mov	eax, DWORD PTR [edx+64]
	imul	eax, 136				; 00000088H
	mov	ecx, DWORD PTR _flt$[ebp]
	lea	edx, DWORD PTR [ecx+eax+168]
	push	edx
	lea	eax, DWORD PTR _sql$[ebp]
	push	eax
	mov	ecx, DWORD PTR _cntxt$[ebp]
	push	ecx
	call	_qry_build_flt_select
	add	esp, 24					; 00000018H
	test	eax, eax
	jne	SHORT $L72757
	mov	edx, DWORD PTR _sql$[ebp]
	add	edx, 8
	push	edx
	mov	eax, DWORD PTR _cntxt$[ebp]
	push	eax
	call	_sql_exec_query
	add	esp, 8
	test	eax, eax
	je	SHORT $L72756
$L72757:
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 1900		; 0000076cH
	jmp	$eva_err$72569
$L72756:

; 1902 : 		}

	jmp	$L72744
$L72745:

; 1903 : 
; 1904 : 		/* Set list of match object for source join */
; 1905 : 		snprintf(add_sz_str(printbuf),
; 1906 : 			"-- OR combination - get distinct objects\n"
; 1907 : 			"SELECT DISTINCT IdObj FROM %s", tmptbl);

	lea	edx, DWORD PTR _tmptbl$72734[ebp]
	push	edx
	push	OFFSET FLAT:$SG72758
	push	1023					; 000003ffH
	lea	eax, DWORD PTR _printbuf$[ebp]
	push	eax
	call	__snprintf
	add	esp, 16					; 00000010H

; 1908 : 		if(sql_exec_query(cntxt, printbuf) ||
; 1909 : 			sql_get_table(cntxt, &flt->node[flt->srcjoin].idobjmatch, 2)) STACK_ERROR;

	lea	ecx, DWORD PTR _printbuf$[ebp]
	push	ecx
	mov	edx, DWORD PTR _cntxt$[ebp]
	push	edx
	call	_sql_exec_query
	add	esp, 8
	test	eax, eax
	jne	SHORT $L72760
	push	2
	mov	eax, DWORD PTR _flt$[ebp]
	mov	ecx, DWORD PTR [eax+64]
	imul	ecx, 136				; 00000088H
	mov	edx, DWORD PTR _flt$[ebp]
	lea	eax, DWORD PTR [edx+ecx+168]
	push	eax
	mov	ecx, DWORD PTR _cntxt$[ebp]
	push	ecx
	call	_sql_get_table
	add	esp, 12					; 0000000cH
	test	eax, eax
	je	SHORT $L72759
$L72760:
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 1909		; 00000775H
	jmp	$eva_err$72569
$L72759:

; 1910 : 		sql_drop_table(cntxt, tmptbl);

	lea	eax, DWORD PTR _tmptbl$72734[ebp]
	push	eax
	mov	ecx, DWORD PTR _cntxt$[ebp]
	push	ecx
	call	_sql_drop_table
	add	esp, 8

; 1911 : 		if(!flt->node[flt->srcjoin].idobjmatch.nbrows) DYNTAB_ADD_INT(&flt->node[flt->srcjoin].idobjmatch, 0, 0, (unsigned long int)0);

	mov	edx, DWORD PTR _flt$[ebp]
	mov	eax, DWORD PTR [edx+64]
	imul	eax, 136				; 00000088H
	mov	ecx, DWORD PTR _flt$[ebp]
	cmp	DWORD PTR [ecx+eax+168], 0
	jne	$L72766
	mov	BYTE PTR __tmp$72762[ebp], 0
	mov	ecx, 7
	xor	eax, eax
	lea	edi, DWORD PTR __tmp$72762[ebp+1]
	rep stosd
	stosw
	stosb
	push	0
	push	OFFSET FLAT:$SG72764
	lea	edx, DWORD PTR __tmp$72762[ebp]
	push	edx
	call	_sprintf
	add	esp, 12					; 0000000cH
	push	0
	push	0
	push	0
	lea	eax, DWORD PTR __tmp$72762[ebp]
	push	eax
	push	0
	push	0
	mov	ecx, DWORD PTR _flt$[ebp]
	mov	edx, DWORD PTR [ecx+64]
	imul	edx, 136				; 00000088H
	mov	eax, DWORD PTR _flt$[ebp]
	lea	ecx, DWORD PTR [eax+edx+168]
	push	ecx
	call	_dyntab_add
	add	esp, 28					; 0000001cH
	test	eax, eax
	je	SHORT $L72766
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29872], OFFSET FLAT:$SG72768
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 1911		; 00000777H
	jmp	$eva_err$72569
$L72766:

; 1913 : 
; 1914 : 	if(flt->debug)

	mov	ecx, DWORD PTR _flt$[ebp]
	cmp	DWORD PTR [ecx+4444], 0
	je	$L72773

; 1916 : 		err_print_filter(&cntxt->debug_msg, flt);

	mov	edx, DWORD PTR _flt$[ebp]
	push	edx
	mov	eax, DWORD PTR _cntxt$[ebp]
	add	eax, 29864				; 000074a8H
	push	eax
	call	_err_print_filter
	add	esp, 8

; 1917 : 		DYNBUF_ADD3_CELLP(&cntxt->debug_msg, "<======== END qry_parse_filter_nodes : ", fltlabel, NO_CONV, "\n");

	mov	ecx, DWORD PTR _fltlabel$[ebp]
	mov	DWORD PTR __c$72770[ebp], ecx
	cmp	DWORD PTR __c$72770[ebp], 0
	je	SHORT $L74459
	mov	edx, DWORD PTR __c$72770[ebp]
	mov	eax, DWORD PTR [edx+4]
	mov	DWORD PTR -5784+[ebp], eax
	jmp	SHORT $L74460
$L74459:
	mov	DWORD PTR -5784+[ebp], 0
$L74460:
	cmp	DWORD PTR __c$72770[ebp], 0
	je	SHORT $L74461
	mov	ecx, DWORD PTR __c$72770[ebp]
	mov	edx, DWORD PTR [ecx]
	mov	DWORD PTR -5788+[ebp], edx
	jmp	SHORT $L74462
$L74461:
	mov	DWORD PTR -5788+[ebp], 0
$L74462:
	push	1
	push	OFFSET FLAT:$SG72774
	push	0
	push	0
	mov	eax, DWORD PTR -5784+[ebp]
	push	eax
	mov	ecx, DWORD PTR -5788+[ebp]
	push	ecx
	push	39					; 00000027H
	push	OFFSET FLAT:$SG72775
	mov	edx, DWORD PTR _cntxt$[ebp]
	add	edx, 29864				; 000074a8H
	push	edx
	call	_dynbuf_add3
	add	esp, 36					; 00000024H
	test	eax, eax
	je	SHORT $L72773
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29872], OFFSET FLAT:$SG72777
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 1917		; 0000077dH
	jmp	SHORT $eva_err$72569
$L72773:
$eva_noerr$72573:

; 1919 : 	RETURN_OK_CLEANUP;

	push	0
	push	OFFSET FLAT:$SG72778
	push	OFFSET FLAT:$SG72779
	mov	edx, DWORD PTR _cntxt$[ebp]
	push	edx
	call	_err_clear
	add	esp, 16					; 00000010H
$eva_err$72569:
	mov	eax, DWORD PTR _cntxt$[ebp]
	cmp	DWORD PTR [eax+29872], 0
	je	SHORT $L72780
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	edx, DWORD PTR [ecx+29900]
	push	edx
	push	OFFSET FLAT:$SG72781
	push	OFFSET FLAT:$SG72782
	mov	eax, DWORD PTR _cntxt$[ebp]
	push	eax
	call	_err_add_context
	add	esp, 16					; 00000010H
$L72780:
	lea	ecx, DWORD PTR _fltfield$[ebp]
	push	ecx
	call	_dyntab_free
	add	esp, 4
	lea	edx, DWORD PTR _fltval$[ebp]
	push	edx
	call	_dyntab_free
	add	esp, 4
	lea	eax, DWORD PTR _fltform$[ebp]
	push	eax
	call	_dyntab_free
	add	esp, 4
	lea	ecx, DWORD PTR _cgival$[ebp]
	push	ecx
	call	_dyntab_free
	add	esp, 4
	mov	edx, DWORD PTR _sql$[ebp]
	push	edx
	call	_mem_free
	add	esp, 4
	mov	DWORD PTR _sql$[ebp], 0
	lea	eax, DWORD PTR _flt1$[ebp]
	push	eax
	call	_qry_build_free
	add	esp, 4
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	edx, DWORD PTR _sql_trace$[ebp]
	mov	DWORD PTR [ecx+29852], edx
	mov	eax, DWORD PTR _cntxt$[ebp]
	cmp	DWORD PTR [eax+29872], 0
	je	SHORT $L72783
	mov	ecx, DWORD PTR _flt$[ebp]
	push	ecx
	mov	edx, DWORD PTR _cntxt$[ebp]
	add	edx, 29876				; 000074b4H
	push	edx
	call	_err_print_filter
	add	esp, 8
$L72783:
	mov	eax, DWORD PTR _cntxt$[ebp]
	xor	ecx, ecx
	cmp	DWORD PTR [eax+29872], 0
	setne	cl
	mov	eax, ecx

; 1920 : }

	pop	edi
	mov	esp, ebp
	pop	ebp
	ret	0
_qry_parse_filter_nodes ENDP
_TEXT	ENDS
PUBLIC	_qry_parse_filter
_DATA	SEGMENT
	ORG $+1
$SG72798 DB	'D:\Travail\ABI\EVA\V4.0\CGI\Brunix-2016\qry_build.c', 00H
$SG72799 DB	'qry_parse_filter', 00H
	ORG $+3
$SG72801 DB	'D:\Travail\ABI\EVA\V4.0\CGI\Brunix-2016\qry_build.c', 00H
$SG72802 DB	'qry_parse_filter', 00H
_DATA	ENDS
_TEXT	SEGMENT
_cntxt$ = 8
_flt$ = 12
_flt_data$ = 16
_qry_parse_filter PROC NEAR

; 1934 : ){

	push	ebp
	mov	ebp, esp

; 1935 : 	/* Build filter nodes */
; 1936 : 	if(qry_parse_filter_nodes(cntxt, flt, flt_data)) STACK_ERROR;

	mov	eax, DWORD PTR _flt_data$[ebp]
	push	eax
	mov	ecx, DWORD PTR _flt$[ebp]
	push	ecx
	mov	edx, DWORD PTR _cntxt$[ebp]
	push	edx
	call	_qry_parse_filter_nodes
	add	esp, 12					; 0000000cH
	test	eax, eax
	je	SHORT $L72794
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 1936		; 00000790H
	jmp	SHORT $eva_err$72795
$L72794:

; 1937 : 	if(qry_build_clauses(cntxt, flt, 1)) STACK_ERROR;

	push	1
	mov	ecx, DWORD PTR _flt$[ebp]
	push	ecx
	mov	edx, DWORD PTR _cntxt$[ebp]
	push	edx
	call	_qry_build_clauses
	add	esp, 12					; 0000000cH
	test	eax, eax
	je	SHORT $eva_noerr$72797
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 1937		; 00000791H
	jmp	SHORT $eva_err$72795
$eva_noerr$72797:

; 1938 : 
; 1939 : 	RETURN_OK_CLEANUP;

	push	0
	push	OFFSET FLAT:$SG72798
	push	OFFSET FLAT:$SG72799
	mov	ecx, DWORD PTR _cntxt$[ebp]
	push	ecx
	call	_err_clear
	add	esp, 16					; 00000010H
$eva_err$72795:
	mov	edx, DWORD PTR _cntxt$[ebp]
	cmp	DWORD PTR [edx+29872], 0
	je	SHORT $L72800
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	ecx, DWORD PTR [eax+29900]
	push	ecx
	push	OFFSET FLAT:$SG72801
	push	OFFSET FLAT:$SG72802
	mov	edx, DWORD PTR _cntxt$[ebp]
	push	edx
	call	_err_add_context
	add	esp, 16					; 00000010H
$L72800:
	mov	eax, DWORD PTR _cntxt$[ebp]
	xor	ecx, ecx
	cmp	DWORD PTR [eax+29872], 0
	setne	cl
	mov	eax, ecx

; 1940 : }

	pop	ebp
	ret	0
_qry_parse_filter ENDP
_TEXT	ENDS
_DATA	SEGMENT
	ORG $+3
$SG72822 DB	'D:\Travail\ABI\EVA\V4.0\CGI\Brunix-2016\qry_build.c', 00H
$SG72823 DB	'qry_filter_objects', 00H
	ORG $+1
$SG72825 DB	'D:\Travail\ABI\EVA\V4.0\CGI\Brunix-2016\qry_build.c', 00H
$SG72826 DB	'qry_filter_objects', 00H
_DATA	ENDS
_TEXT	SEGMENT
_cntxt$ = 8
_res$ = 12
_flt$ = 16
_sql$ = -4
_empty$ = -24
_qry_filter_objects PROC NEAR

; 1954 : ){

	push	ebp
	mov	ebp, esp
	sub	esp, 24					; 00000018H

; 1955 :  	DynBuffer *sql = NULL;

	mov	DWORD PTR _sql$[ebp], 0

; 1956 : 	DynTable empty = {0};

	mov	DWORD PTR _empty$[ebp], 0
	xor	eax, eax
	mov	DWORD PTR _empty$[ebp+4], eax
	mov	DWORD PTR _empty$[ebp+8], eax
	mov	DWORD PTR _empty$[ebp+12], eax
	mov	DWORD PTR _empty$[ebp+16], eax

; 1957 : 
; 1958 : 	if(qry_build_clauses(cntxt, flt, 1) ||
; 1959 : 		qry_build_flt_select(cntxt, &sql, &empty, flt, 0, 0)) STACK_ERROR;

	push	1
	mov	ecx, DWORD PTR _flt$[ebp]
	push	ecx
	mov	edx, DWORD PTR _cntxt$[ebp]
	push	edx
	call	_qry_build_clauses
	add	esp, 12					; 0000000cH
	test	eax, eax
	jne	SHORT $L72817
	push	0
	push	0
	mov	eax, DWORD PTR _flt$[ebp]
	push	eax
	lea	ecx, DWORD PTR _empty$[ebp]
	push	ecx
	lea	edx, DWORD PTR _sql$[ebp]
	push	edx
	mov	eax, DWORD PTR _cntxt$[ebp]
	push	eax
	call	_qry_build_flt_select
	add	esp, 24					; 00000018H
	test	eax, eax
	je	SHORT $L72816
$L72817:
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 1959		; 000007a7H
	jmp	SHORT $eva_err$72818
$L72816:

; 1960 : 	if(qry_exec_filter(cntxt, flt, sql->data)) STACK_ERROR;

	mov	edx, DWORD PTR _sql$[ebp]
	add	edx, 8
	push	edx
	mov	eax, DWORD PTR _flt$[ebp]
	push	eax
	mov	ecx, DWORD PTR _cntxt$[ebp]
	push	ecx
	call	_qry_exec_filter
	add	esp, 12					; 0000000cH
	test	eax, eax
	je	SHORT $L72819
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 1960		; 000007a8H
	jmp	SHORT $eva_err$72818
$L72819:

; 1961 : 	if(sql_get_table(cntxt, res, 2)) STACK_ERROR;

	push	2
	mov	eax, DWORD PTR _res$[ebp]
	push	eax
	mov	ecx, DWORD PTR _cntxt$[ebp]
	push	ecx
	call	_sql_get_table
	add	esp, 12					; 0000000cH
	test	eax, eax
	je	SHORT $eva_noerr$72821
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 1961		; 000007a9H
	jmp	SHORT $eva_err$72818
$eva_noerr$72821:

; 1962 : 
; 1963 : 	RETURN_OK_CLEANUP;

	push	0
	push	OFFSET FLAT:$SG72822
	push	OFFSET FLAT:$SG72823
	mov	eax, DWORD PTR _cntxt$[ebp]
	push	eax
	call	_err_clear
	add	esp, 16					; 00000010H
$eva_err$72818:
	mov	ecx, DWORD PTR _cntxt$[ebp]
	cmp	DWORD PTR [ecx+29872], 0
	je	SHORT $L72824
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	eax, DWORD PTR [edx+29900]
	push	eax
	push	OFFSET FLAT:$SG72825
	push	OFFSET FLAT:$SG72826
	mov	ecx, DWORD PTR _cntxt$[ebp]
	push	ecx
	call	_err_add_context
	add	esp, 16					; 00000010H
$L72824:
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

; 1964 : }

	mov	esp, ebp
	pop	ebp
	ret	0
_qry_filter_objects ENDP
_TEXT	ENDS
PUBLIC	_qry_filter_listobj
EXTRN	_sql_get_buf:NEAR
_DATA	SEGMENT
	ORG $+1
$SG72846 DB	'D:\Travail\ABI\EVA\V4.0\CGI\Brunix-2016\qry_build.c', 00H
$SG72847 DB	'qry_filter_listobj', 00H
	ORG $+1
$SG72849 DB	'D:\Travail\ABI\EVA\V4.0\CGI\Brunix-2016\qry_build.c', 00H
$SG72850 DB	'qry_filter_listobj', 00H
_DATA	ENDS
_TEXT	SEGMENT
_cntxt$ = 8
_res$ = 12
_flt$ = 16
_sql$ = -4
_empty$ = -24
_qry_filter_listobj PROC NEAR

; 1978 : ){

	push	ebp
	mov	ebp, esp
	sub	esp, 24					; 00000018H

; 1979 :  	DynBuffer *sql = NULL;

	mov	DWORD PTR _sql$[ebp], 0

; 1980 : 	DynTable empty = {0};

	mov	DWORD PTR _empty$[ebp], 0
	xor	eax, eax
	mov	DWORD PTR _empty$[ebp+4], eax
	mov	DWORD PTR _empty$[ebp+8], eax
	mov	DWORD PTR _empty$[ebp+12], eax
	mov	DWORD PTR _empty$[ebp+16], eax

; 1981 : 
; 1982 : 	if(qry_build_clauses(cntxt, flt, 1) ||
; 1983 : 		qry_build_flt_select(cntxt, &sql, &empty, flt, 0, 0)) STACK_ERROR;

	push	1
	mov	ecx, DWORD PTR _flt$[ebp]
	push	ecx
	mov	edx, DWORD PTR _cntxt$[ebp]
	push	edx
	call	_qry_build_clauses
	add	esp, 12					; 0000000cH
	test	eax, eax
	jne	SHORT $L72841
	push	0
	push	0
	mov	eax, DWORD PTR _flt$[ebp]
	push	eax
	lea	ecx, DWORD PTR _empty$[ebp]
	push	ecx
	lea	edx, DWORD PTR _sql$[ebp]
	push	edx
	mov	eax, DWORD PTR _cntxt$[ebp]
	push	eax
	call	_qry_build_flt_select
	add	esp, 24					; 00000018H
	test	eax, eax
	je	SHORT $L72840
$L72841:
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 1983		; 000007bfH
	jmp	SHORT $eva_err$72842
$L72840:

; 1984 : 	if(qry_exec_filter(cntxt, flt, sql->data)) STACK_ERROR;

	mov	edx, DWORD PTR _sql$[ebp]
	add	edx, 8
	push	edx
	mov	eax, DWORD PTR _flt$[ebp]
	push	eax
	mov	ecx, DWORD PTR _cntxt$[ebp]
	push	ecx
	call	_qry_exec_filter
	add	esp, 12					; 0000000cH
	test	eax, eax
	je	SHORT $L72843
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 1984		; 000007c0H
	jmp	SHORT $eva_err$72842
$L72843:

; 1985 : 	if(sql_get_buf(cntxt, res, 2)) STACK_ERROR;

	push	2
	mov	eax, DWORD PTR _res$[ebp]
	push	eax
	mov	ecx, DWORD PTR _cntxt$[ebp]
	push	ecx
	call	_sql_get_buf
	add	esp, 12					; 0000000cH
	test	eax, eax
	je	SHORT $eva_noerr$72845
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 1985		; 000007c1H
	jmp	SHORT $eva_err$72842
$eva_noerr$72845:

; 1986 : 
; 1987 : 	RETURN_OK_CLEANUP;

	push	0
	push	OFFSET FLAT:$SG72846
	push	OFFSET FLAT:$SG72847
	mov	eax, DWORD PTR _cntxt$[ebp]
	push	eax
	call	_err_clear
	add	esp, 16					; 00000010H
$eva_err$72842:
	mov	ecx, DWORD PTR _cntxt$[ebp]
	cmp	DWORD PTR [ecx+29872], 0
	je	SHORT $L72848
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	eax, DWORD PTR [edx+29900]
	push	eax
	push	OFFSET FLAT:$SG72849
	push	OFFSET FLAT:$SG72850
	mov	ecx, DWORD PTR _cntxt$[ebp]
	push	ecx
	call	_err_add_context
	add	esp, 16					; 00000010H
$L72848:
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

; 1988 : }

	mov	esp, ebp
	pop	ebp
	ret	0
_qry_filter_listobj ENDP
_TEXT	ENDS
PUBLIC	_qry_to_listobj
_DATA	SEGMENT
	ORG $+1
$SG72868 DB	'D:\Travail\ABI\EVA\V4.0\CGI\Brunix-2016\qry_build.c', 00H
$SG72869 DB	'qry_to_listobj', 00H
	ORG $+1
$SG72871 DB	'D:\Travail\ABI\EVA\V4.0\CGI\Brunix-2016\qry_build.c', 00H
$SG72872 DB	'qry_to_listobj', 00H
_DATA	ENDS
_TEXT	SEGMENT
_cntxt$ = 8
_res$ = 12
_forms$ = 16
_filters$ = 20
_flt$ = -4456
_qry_to_listobj PROC NEAR

; 2003 : ){

	push	ebp
	mov	ebp, esp
	mov	eax, 4456				; 00001168H
	call	__chkstk
	push	edi

; 2004 : 	QryBuild flt = {{0}};

	mov	DWORD PTR _flt$[ebp], 0
	xor	eax, eax
	mov	DWORD PTR _flt$[ebp+4], eax
	mov	DWORD PTR _flt$[ebp+8], eax
	mov	DWORD PTR _flt$[ebp+12], eax
	mov	DWORD PTR _flt$[ebp+16], eax
	mov	ecx, 1109				; 00000455H
	xor	eax, eax
	lea	edi, DWORD PTR _flt$[ebp+20]
	rep stosd

; 2005 : 
; 2006 : 	if(qry_add_filter_forms(cntxt, &flt, forms, filters) ||
; 2007 : 		qry_filter_listobj(cntxt, res, &flt)) STACK_ERROR;

	mov	ecx, DWORD PTR _filters$[ebp]
	push	ecx
	mov	edx, DWORD PTR _forms$[ebp]
	push	edx
	lea	eax, DWORD PTR _flt$[ebp]
	push	eax
	mov	ecx, DWORD PTR _cntxt$[ebp]
	push	ecx
	call	_qry_add_filter_forms
	add	esp, 16					; 00000010H
	test	eax, eax
	jne	SHORT $L72865
	lea	edx, DWORD PTR _flt$[ebp]
	push	edx
	mov	eax, DWORD PTR _res$[ebp]
	push	eax
	mov	ecx, DWORD PTR _cntxt$[ebp]
	push	ecx
	call	_qry_filter_listobj
	add	esp, 12					; 0000000cH
	test	eax, eax
	je	SHORT $eva_noerr$72867
$L72865:
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 2007		; 000007d7H
	jmp	SHORT $eva_err$72866
$eva_noerr$72867:

; 2008 : 
; 2009 : 	RETURN_OK_CLEANUP;

	push	0
	push	OFFSET FLAT:$SG72868
	push	OFFSET FLAT:$SG72869
	mov	eax, DWORD PTR _cntxt$[ebp]
	push	eax
	call	_err_clear
	add	esp, 16					; 00000010H
$eva_err$72866:
	mov	ecx, DWORD PTR _cntxt$[ebp]
	cmp	DWORD PTR [ecx+29872], 0
	je	SHORT $L72870
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	eax, DWORD PTR [edx+29900]
	push	eax
	push	OFFSET FLAT:$SG72871
	push	OFFSET FLAT:$SG72872
	mov	ecx, DWORD PTR _cntxt$[ebp]
	push	ecx
	call	_err_add_context
	add	esp, 16					; 00000010H
$L72870:
	lea	edx, DWORD PTR _flt$[ebp]
	push	edx
	call	_qry_build_free
	add	esp, 4
	mov	eax, DWORD PTR _cntxt$[ebp]
	xor	ecx, ecx
	cmp	DWORD PTR [eax+29872], 0
	setne	cl
	mov	eax, ecx

; 2010 : }

	pop	edi
	mov	esp, ebp
	pop	ebp
	ret	0
_qry_to_listobj ENDP
_TEXT	ENDS
_DATA	SEGMENT
	ORG $+1
$SG72890 DB	0aH, 00H
	ORG $+2
$SG72891 DB	'-- qry_filter_table : ', 00H
	ORG $+1
$SG72893 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG72898 DB	' (IdObj)', 0aH, 00H
	ORG $+2
$SG72899 DB	'INSERT INTO ', 00H
	ORG $+3
$SG72901 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG72906 DB	0aH, 00H
	ORG $+2
$SG72907 DB	'INSERT INTO ', 00H
	ORG $+3
$SG72909 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG72913 DB	' TYPE=HEAP', 0aH, 00H
$SG72914 DB	'CREATE TEMPORARY TABLE ', 00H
$SG72916 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG72920 DB	'D:\Travail\ABI\EVA\V4.0\CGI\Brunix-2016\qry_build.c', 00H
$SG72921 DB	'qry_filter_table', 00H
	ORG $+3
$SG72923 DB	'D:\Travail\ABI\EVA\V4.0\CGI\Brunix-2016\qry_build.c', 00H
$SG72924 DB	'qry_filter_table', 00H
_DATA	ENDS
_TEXT	SEGMENT
_cntxt$ = 8
_res$ = 12
_flt$ = 16
_options$ = 20
_sql$ = -4
_empty$ = -24
_qry_filter_table PROC NEAR

; 2027 : ){

	push	ebp
	mov	ebp, esp
	sub	esp, 24					; 00000018H

; 2028 :  	DynBuffer *sql = NULL;

	mov	DWORD PTR _sql$[ebp], 0

; 2029 : 	DynTable empty = {0};

	mov	DWORD PTR _empty$[ebp], 0
	xor	eax, eax
	mov	DWORD PTR _empty$[ebp+4], eax
	mov	DWORD PTR _empty$[ebp+8], eax
	mov	DWORD PTR _empty$[ebp+12], eax
	mov	DWORD PTR _empty$[ebp+16], eax

; 2030 : 
; 2031 : 	DYNBUF_ADD3_CELL(&sql, "-- qry_filter_table : ", &flt->name, 0, 0, NO_CONV, "\n");

	push	1
	push	OFFSET FLAT:$SG72890
	push	0
	push	0
	push	0
	push	0
	mov	ecx, DWORD PTR _flt$[ebp]
	push	ecx
	call	_dyntab_sz
	add	esp, 12					; 0000000cH
	push	eax
	push	0
	push	0
	mov	edx, DWORD PTR _flt$[ebp]
	push	edx
	call	_dyntab_val
	add	esp, 12					; 0000000cH
	push	eax
	push	22					; 00000016H
	push	OFFSET FLAT:$SG72891
	lea	eax, DWORD PTR _sql$[ebp]
	push	eax
	call	_dynbuf_add3
	add	esp, 36					; 00000024H
	test	eax, eax
	je	SHORT $L72889
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29872], OFFSET FLAT:$SG72893
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 2031		; 000007efH
	jmp	$eva_err$72894
$L72889:

; 2032 : 	if(options & 2)

	mov	eax, DWORD PTR _options$[ebp]
	and	eax, 2
	test	eax, eax
	je	SHORT $L72895

; 2033 : 		DYNBUF_ADD3(&sql, "INSERT INTO ", res, 0, NO_CONV, " (IdObj)\n")

	push	9
	push	OFFSET FLAT:$SG72898
	push	0
	push	0
	push	0
	mov	ecx, DWORD PTR _res$[ebp]
	push	ecx
	push	12					; 0000000cH
	push	OFFSET FLAT:$SG72899
	lea	edx, DWORD PTR _sql$[ebp]
	push	edx
	call	_dynbuf_add3
	add	esp, 36					; 00000024H
	test	eax, eax
	je	SHORT $L72897
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29872], OFFSET FLAT:$SG72901
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 2033		; 000007f1H
	jmp	$eva_err$72894
$L72897:

; 2034 : 	else if(options & 1)

	jmp	$L72912
$L72895:
	mov	edx, DWORD PTR _options$[ebp]
	and	edx, 1
	test	edx, edx
	je	SHORT $L72903

; 2035 : 		DYNBUF_ADD3(&sql, "INSERT INTO ", res, 0, NO_CONV, "\n")

	push	1
	push	OFFSET FLAT:$SG72906
	push	0
	push	0
	push	0
	mov	eax, DWORD PTR _res$[ebp]
	push	eax
	push	12					; 0000000cH
	push	OFFSET FLAT:$SG72907
	lea	ecx, DWORD PTR _sql$[ebp]
	push	ecx
	call	_dynbuf_add3
	add	esp, 36					; 00000024H
	test	eax, eax
	je	SHORT $L72905
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29872], OFFSET FLAT:$SG72909
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 2035		; 000007f3H
	jmp	$eva_err$72894
$L72905:

; 2036 : 	else

	jmp	SHORT $L72912
$L72903:

; 2037 : 		DYNBUF_ADD3(&sql, "CREATE TEMPORARY TABLE ", res, 0, NO_CONV, " TYPE=HEAP\n");

	push	11					; 0000000bH
	push	OFFSET FLAT:$SG72913
	push	0
	push	0
	push	0
	mov	ecx, DWORD PTR _res$[ebp]
	push	ecx
	push	23					; 00000017H
	push	OFFSET FLAT:$SG72914
	lea	edx, DWORD PTR _sql$[ebp]
	push	edx
	call	_dynbuf_add3
	add	esp, 36					; 00000024H
	test	eax, eax
	je	SHORT $L72912
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29872], OFFSET FLAT:$SG72916
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 2037		; 000007f5H
	jmp	SHORT $eva_err$72894
$L72912:

; 2038 : 	if(qry_build_clauses(cntxt, flt, 1) ||
; 2039 : 		qry_build_flt_select(cntxt, &sql, &empty, flt, 0, 0) ||
; 2040 : 		qry_exec_filter(cntxt, flt, sql->data)) STACK_ERROR;

	push	1
	mov	edx, DWORD PTR _flt$[ebp]
	push	edx
	mov	eax, DWORD PTR _cntxt$[ebp]
	push	eax
	call	_qry_build_clauses
	add	esp, 12					; 0000000cH
	test	eax, eax
	jne	SHORT $L72918
	push	0
	push	0
	mov	ecx, DWORD PTR _flt$[ebp]
	push	ecx
	lea	edx, DWORD PTR _empty$[ebp]
	push	edx
	lea	eax, DWORD PTR _sql$[ebp]
	push	eax
	mov	ecx, DWORD PTR _cntxt$[ebp]
	push	ecx
	call	_qry_build_flt_select
	add	esp, 24					; 00000018H
	test	eax, eax
	jne	SHORT $L72918
	mov	edx, DWORD PTR _sql$[ebp]
	add	edx, 8
	push	edx
	mov	eax, DWORD PTR _flt$[ebp]
	push	eax
	mov	ecx, DWORD PTR _cntxt$[ebp]
	push	ecx
	call	_qry_exec_filter
	add	esp, 12					; 0000000cH
	test	eax, eax
	je	SHORT $eva_noerr$72919
$L72918:
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 2040		; 000007f8H
	jmp	SHORT $eva_err$72894
$eva_noerr$72919:

; 2041 : 
; 2042 : 	RETURN_OK_CLEANUP;

	push	0
	push	OFFSET FLAT:$SG72920
	push	OFFSET FLAT:$SG72921
	mov	eax, DWORD PTR _cntxt$[ebp]
	push	eax
	call	_err_clear
	add	esp, 16					; 00000010H
$eva_err$72894:
	mov	ecx, DWORD PTR _cntxt$[ebp]
	cmp	DWORD PTR [ecx+29872], 0
	je	SHORT $L72922
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	eax, DWORD PTR [edx+29900]
	push	eax
	push	OFFSET FLAT:$SG72923
	push	OFFSET FLAT:$SG72924
	mov	ecx, DWORD PTR _cntxt$[ebp]
	push	ecx
	call	_err_add_context
	add	esp, 16					; 00000010H
$L72922:
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

; 2043 : }

	mov	esp, ebp
	pop	ebp
	ret	0
_qry_filter_table ENDP
_TEXT	ENDS
_BSS	SEGMENT
	ALIGN	4

$SG72974 DB	01H DUP (?)
	ALIGN	4

$SG72982 DB	01H DUP (?)
	ALIGN	4

$SG73004 DB	01H DUP (?)
	ALIGN	4

$SG73042 DB	01H DUP (?)
_BSS	ENDS
_DATA	SEGMENT
	ORG $+3
$SG72944 DB	'IdRelObj', 00H
	ORG $+3
$SG72945 DB	'IdObj', 00H
	ORG $+2
$SG72948 DB	'IdList', 00H
	ORG $+1
$SG72954 DB	'SELECT ', 00H
$SG72956 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG72961 DB	'DISTINCT ', 00H
	ORG $+2
$SG72963 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG72967 DB	'STRAIGHT_JOIN ', 00H
	ORG $+1
$SG72969 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG72973 DB	'.IdObj AS IdObj', 00H
$SG72976 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG72981 DB	'.IdObj AS IdObj', 00H
$SG72984 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG72988 DB	' AS IdObj', 00H
	ORG $+2
$SG72989 DB	'TLink0.', 00H
$SG72991 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG72996 DB	' AS Val', 00H
$SG72997 DB	',', 00H
	ORG $+2
$SG72999 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG73005 DB	',', 00H
	ORG $+2
$SG73007 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG73010 DB	0aH, 00H
	ORG $+2
$SG73012 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG73017 DB	'FROM TLink AS TLink0 ', 0aH, 00H
	ORG $+1
$SG73019 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG73022 DB	'IdRelObj', 00H
	ORG $+3
$SG73023 DB	'IdObj', 00H
	ORG $+2
$SG73024 DB	'FROM %s', 0aH, 'INNER JOIN TLink AS TLink0 ON %s.%s=TLin'
	DB	'k0.%s', 0aH, 00H
	ORG $+1
$SG73029 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG73034 DB	' IN (', 00H
	ORG $+2
$SG73035 DB	'WHERE TLink0.', 00H
	ORG $+2
$SG73037 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG73041 DB	') ', 0aH, 00H
$SG73044 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG73049 DB	0aH, 00H
	ORG $+2
$SG73050 DB	'AND ', 00H
	ORG $+3
$SG73052 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG73058 DB	0aH, 00H
	ORG $+2
$SG73059 DB	'WHERE ', 00H
	ORG $+1
$SG73061 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG73065 DB	'GROUP BY IdObj', 0aH, 00H
$SG73067 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG73072 DB	0aH, 00H
	ORG $+2
$SG73073 DB	'HAVING ', 00H
$SG73075 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG73080 DB	0aH, 00H
	ORG $+2
$SG73081 DB	'ORDER BY ', 00H
	ORG $+2
$SG73083 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG73086 DB	',', 00H
	ORG $+2
$SG73087 DB	'LIMIT ', 00H
	ORG $+1
$SG73089 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG73092 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG73095 DB	0aH, 00H
	ORG $+2
$SG73097 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG73098 DB	'D:\Travail\ABI\EVA\V4.0\CGI\Brunix-2016\qry_build.c', 00H
$SG73099 DB	'qry_build_flt_select', 00H
	ORG $+3
$SG73101 DB	'D:\Travail\ABI\EVA\V4.0\CGI\Brunix-2016\qry_build.c', 00H
$SG73102 DB	'qry_build_flt_select', 00H
_DATA	ENDS
_TEXT	SEGMENT
_cntxt$ = 8
_sql$ = 12
_idlist$ = 16
_flt$ = 20
_row$ = 24
_nbrows$ = 28
_l_idobj$ = -1036
_selobj$ = -1028
_srctable$ = -1032
_printbuf$ = -1024
_qry_build_flt_select PROC NEAR

; 2063 : ){

	push	ebp
	mov	ebp, esp
	sub	esp, 1104				; 00000450H

; 2064 :  	DynBuffer *l_idobj = NULL;

	mov	DWORD PTR _l_idobj$[ebp], 0

; 2065 : 	char *selobj = flt->b_userelobj ? "IdRelObj" : "IdObj";

	mov	eax, DWORD PTR _flt$[ebp]
	cmp	DWORD PTR [eax+4436], 0
	je	SHORT $L74469
	mov	DWORD PTR -1040+[ebp], OFFSET FLAT:$SG72944
	jmp	SHORT $L74470
$L74469:
	mov	DWORD PTR -1040+[ebp], OFFSET FLAT:$SG72945
$L74470:
	mov	ecx, DWORD PTR -1040+[ebp]
	mov	DWORD PTR _selobj$[ebp], ecx

; 2066 : 	char *srctable = flt->srctable ? flt->srctable : !idlist ? "IdList" : NULL;

	mov	edx, DWORD PTR _flt$[ebp]
	cmp	DWORD PTR [edx+20], 0
	je	SHORT $L74471
	mov	eax, DWORD PTR _flt$[ebp]
	mov	ecx, DWORD PTR [eax+20]
	mov	DWORD PTR -1044+[ebp], ecx
	jmp	SHORT $L74472
$L74471:
	mov	edx, DWORD PTR _idlist$[ebp]
	neg	edx
	sbb	edx, edx
	not	edx
	and	edx, OFFSET FLAT:$SG72948
	mov	DWORD PTR -1044+[ebp], edx
$L74472:
	mov	eax, DWORD PTR -1044+[ebp]
	mov	DWORD PTR _srctable$[ebp], eax

; 2067 : 	char printbuf[1024];
; 2068 : 
; 2069 : 	if(!sql) RETURN_OK;

	cmp	DWORD PTR _sql$[ebp], 0
	jne	SHORT $L72950
	jmp	$eva_noerr$72951
$L72950:

; 2070 : 
; 2071 : 	/* Build SELECT clause - IdObj member */
; 2072 : 	DYNBUF_ADD_STR(sql, "SELECT " );

	push	0
	push	0
	push	7
	push	OFFSET FLAT:$SG72954
	mov	ecx, DWORD PTR _sql$[ebp]
	push	ecx
	call	_dynbuf_add
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L72953
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29872], OFFSET FLAT:$SG72956
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 2072		; 00000818H
	jmp	$eva_err$72957
$L72953:

; 2073 : 	if(!flt->b_nodistinct) DYNBUF_ADD_STR(sql, "DISTINCT " );

	mov	ecx, DWORD PTR _flt$[ebp]
	cmp	DWORD PTR [ecx+56], 0
	jne	SHORT $L72960
	push	0
	push	0
	push	9
	push	OFFSET FLAT:$SG72961
	mov	edx, DWORD PTR _sql$[ebp]
	push	edx
	call	_dynbuf_add
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L72960
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29872], OFFSET FLAT:$SG72963
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 2073		; 00000819H
	jmp	$eva_err$72957
$L72960:

; 2074 : 	if(flt->b_straightjoin) DYNBUF_ADD_STR(sql, "STRAIGHT_JOIN " );

	mov	edx, DWORD PTR _flt$[ebp]
	cmp	DWORD PTR [edx+60], 0
	je	SHORT $L72966
	push	0
	push	0
	push	14					; 0000000eH
	push	OFFSET FLAT:$SG72967
	mov	eax, DWORD PTR _sql$[ebp]
	push	eax
	call	_dynbuf_add
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L72966
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29872], OFFSET FLAT:$SG72969
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 2074		; 0000081aH
	jmp	$eva_err$72957
$L72966:

; 2075 : 	if(flt->selidobj)

	mov	eax, DWORD PTR _flt$[ebp]
	cmp	DWORD PTR [eax+4440], 0
	je	SHORT $L72970

; 2076 : 		DYNBUF_ADD3(sql, "", flt->selidobj, 0, NO_CONV, ".IdObj AS IdObj")

	push	15					; 0000000fH
	push	OFFSET FLAT:$SG72973
	push	0
	push	0
	push	0
	mov	ecx, DWORD PTR _flt$[ebp]
	mov	edx, DWORD PTR [ecx+4440]
	push	edx
	push	0
	push	OFFSET FLAT:$SG72974
	mov	eax, DWORD PTR _sql$[ebp]
	push	eax
	call	_dynbuf_add3
	add	esp, 36					; 00000024H
	test	eax, eax
	je	SHORT $L72972
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29872], OFFSET FLAT:$SG72976
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 2076		; 0000081cH
	jmp	$eva_err$72957
$L72972:

; 2077 : 	else if(flt->b_linkonrelobj)

	jmp	$L72987
$L72970:
	mov	eax, DWORD PTR _flt$[ebp]
	cmp	DWORD PTR [eax+24], 0
	je	SHORT $L72978

; 2078 : 		DYNBUF_ADD3(sql, "", flt->srctable, 0, NO_CONV, ".IdObj AS IdObj")

	push	15					; 0000000fH
	push	OFFSET FLAT:$SG72981
	push	0
	push	0
	push	0
	mov	ecx, DWORD PTR _flt$[ebp]
	mov	edx, DWORD PTR [ecx+20]
	push	edx
	push	0
	push	OFFSET FLAT:$SG72982
	mov	eax, DWORD PTR _sql$[ebp]
	push	eax
	call	_dynbuf_add3
	add	esp, 36					; 00000024H
	test	eax, eax
	je	SHORT $L72980
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29872], OFFSET FLAT:$SG72984
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 2078		; 0000081eH
	jmp	$eva_err$72957
$L72980:

; 2079 : 	else

	jmp	SHORT $L72987
$L72978:

; 2080 : 		DYNBUF_ADD3(sql, "TLink0.", selobj, 0, NO_CONV, " AS IdObj");

	push	9
	push	OFFSET FLAT:$SG72988
	push	0
	push	0
	push	0
	mov	eax, DWORD PTR _selobj$[ebp]
	push	eax
	push	7
	push	OFFSET FLAT:$SG72989
	mov	ecx, DWORD PTR _sql$[ebp]
	push	ecx
	call	_dynbuf_add3
	add	esp, 36					; 00000024H
	test	eax, eax
	je	SHORT $L72987
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29872], OFFSET FLAT:$SG72991
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 2080		; 00000820H
	jmp	$eva_err$72957
$L72987:

; 2081 : 
; 2082 : 	/* Build SELECT clause - other values members */
; 2083 : 	if(flt->select) DYNBUF_ADD3_BUF(sql, ",", flt->select, NO_CONV, " AS Val");

	mov	ecx, DWORD PTR _flt$[ebp]
	cmp	DWORD PTR [ecx+28], 0
	je	$L72995
	mov	edx, DWORD PTR _flt$[ebp]
	cmp	DWORD PTR [edx+28], 0
	je	SHORT $L74473
	mov	eax, DWORD PTR _flt$[ebp]
	mov	ecx, DWORD PTR [eax+28]
	mov	edx, DWORD PTR [ecx+4]
	mov	DWORD PTR -1048+[ebp], edx
	jmp	SHORT $L74474
$L74473:
	mov	DWORD PTR -1048+[ebp], 0
$L74474:
	mov	eax, DWORD PTR _flt$[ebp]
	cmp	DWORD PTR [eax+28], 0
	je	SHORT $L74475
	mov	ecx, DWORD PTR _flt$[ebp]
	mov	edx, DWORD PTR [ecx+28]
	add	edx, 8
	mov	DWORD PTR -1052+[ebp], edx
	jmp	SHORT $L74476
$L74475:
	mov	DWORD PTR -1052+[ebp], 0
$L74476:
	push	7
	push	OFFSET FLAT:$SG72996
	push	0
	push	0
	mov	eax, DWORD PTR -1048+[ebp]
	push	eax
	mov	ecx, DWORD PTR -1052+[ebp]
	push	ecx
	push	1
	push	OFFSET FLAT:$SG72997
	mov	edx, DWORD PTR _sql$[ebp]
	push	edx
	call	_dynbuf_add3
	add	esp, 36					; 00000024H
	test	eax, eax
	je	SHORT $L72995
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29872], OFFSET FLAT:$SG72999
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 2083		; 00000823H
	jmp	$eva_err$72957
$L72995:

; 2084 : 	if(flt->optselect) DYNBUF_ADD3_BUF(sql, ",", flt->optselect, NO_CONV, "");

	mov	edx, DWORD PTR _flt$[ebp]
	cmp	DWORD PTR [edx+32], 0
	je	$L73003
	mov	eax, DWORD PTR _flt$[ebp]
	cmp	DWORD PTR [eax+32], 0
	je	SHORT $L74477
	mov	ecx, DWORD PTR _flt$[ebp]
	mov	edx, DWORD PTR [ecx+32]
	mov	eax, DWORD PTR [edx+4]
	mov	DWORD PTR -1056+[ebp], eax
	jmp	SHORT $L74478
$L74477:
	mov	DWORD PTR -1056+[ebp], 0
$L74478:
	mov	ecx, DWORD PTR _flt$[ebp]
	cmp	DWORD PTR [ecx+32], 0
	je	SHORT $L74479
	mov	edx, DWORD PTR _flt$[ebp]
	mov	eax, DWORD PTR [edx+32]
	add	eax, 8
	mov	DWORD PTR -1060+[ebp], eax
	jmp	SHORT $L74480
$L74479:
	mov	DWORD PTR -1060+[ebp], 0
$L74480:
	push	0
	push	OFFSET FLAT:$SG73004
	push	0
	push	0
	mov	ecx, DWORD PTR -1056+[ebp]
	push	ecx
	mov	edx, DWORD PTR -1060+[ebp]
	push	edx
	push	1
	push	OFFSET FLAT:$SG73005
	mov	eax, DWORD PTR _sql$[ebp]
	push	eax
	call	_dynbuf_add3
	add	esp, 36					; 00000024H
	test	eax, eax
	je	SHORT $L73003
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29872], OFFSET FLAT:$SG73007
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 2084		; 00000824H
	jmp	$eva_err$72957
$L73003:

; 2085 : 	DYNBUF_ADD_STR(sql, "\n" );

	push	0
	push	0
	push	1
	push	OFFSET FLAT:$SG73010
	mov	eax, DWORD PTR _sql$[ebp]
	push	eax
	call	_dynbuf_add
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L73009
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29872], OFFSET FLAT:$SG73012
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 2085		; 00000825H
	jmp	$eva_err$72957
$L73009:

; 2086 : 
; 2087 : 	/* Build FROM clause */
; 2088 : 	if(!srctable || !*srctable)

	cmp	DWORD PTR _srctable$[ebp], 0
	je	SHORT $L73014
	mov	eax, DWORD PTR _srctable$[ebp]
	movsx	ecx, BYTE PTR [eax]
	test	ecx, ecx
	jne	SHORT $L73013
$L73014:

; 2090 : 		DYNBUF_ADD_STR(sql, "FROM TLink AS TLink0 \n");

	push	0
	push	0
	push	22					; 00000016H
	push	OFFSET FLAT:$SG73017
	mov	edx, DWORD PTR _sql$[ebp]
	push	edx
	call	_dynbuf_add
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L73016
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29872], OFFSET FLAT:$SG73019
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 2090		; 0000082aH
	jmp	$eva_err$72957
$L73016:

; 2092 : 	else

	jmp	SHORT $L73020
$L73013:

; 2094 : 		dynbuf_print4(sql,
; 2095 : 			"FROM %s\nINNER JOIN TLink AS TLink0 ON %s.%s=TLink0.%s\n",
; 2096 : 				srctable, srctable, flt->b_linkonrelobj ? "IdRelObj" : "IdObj", selobj);

	mov	edx, DWORD PTR _flt$[ebp]
	cmp	DWORD PTR [edx+24], 0
	je	SHORT $L74481
	mov	DWORD PTR -1064+[ebp], OFFSET FLAT:$SG73022
	jmp	SHORT $L74482
$L74481:
	mov	DWORD PTR -1064+[ebp], OFFSET FLAT:$SG73023
$L74482:
	push	0
	push	0
	mov	eax, DWORD PTR _selobj$[ebp]
	push	eax
	mov	ecx, DWORD PTR -1064+[ebp]
	push	ecx
	mov	edx, DWORD PTR _srctable$[ebp]
	push	edx
	mov	eax, DWORD PTR _srctable$[ebp]
	push	eax
	push	OFFSET FLAT:$SG73024
	push	1023					; 000003ffH
	lea	ecx, DWORD PTR _printbuf$[ebp]
	push	ecx
	call	__snprintf
	add	esp, 28					; 0000001cH
	push	eax
	lea	edx, DWORD PTR _printbuf$[ebp]
	push	edx
	mov	eax, DWORD PTR _sql$[ebp]
	push	eax
	call	_dynbuf_add
	add	esp, 20					; 00000014H
$L73020:

; 2098 : 
; 2099 : 	/* Add JOIN clause members */
; 2100 : 	if(flt->join) DYNBUF_ADD_BUF(sql, flt->join, NO_CONV);

	mov	ecx, DWORD PTR _flt$[ebp]
	cmp	DWORD PTR [ecx+36], 0
	je	SHORT $L73027
	mov	edx, DWORD PTR _flt$[ebp]
	cmp	DWORD PTR [edx+36], 0
	je	SHORT $L73027
	push	0
	push	0
	mov	eax, DWORD PTR _flt$[ebp]
	mov	ecx, DWORD PTR [eax+36]
	mov	edx, DWORD PTR [ecx+4]
	push	edx
	mov	eax, DWORD PTR _flt$[ebp]
	mov	ecx, DWORD PTR [eax+36]
	add	ecx, 8
	push	ecx
	mov	edx, DWORD PTR _sql$[ebp]
	push	edx
	call	_dynbuf_add
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L73027
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29872], OFFSET FLAT:$SG73029
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 2100		; 00000834H
	jmp	$eva_err$72957
$L73027:

; 2101 : 
; 2102 : 	/* Build WHERE clause */
; 2103 : 	if(idlist && idlist->nbrows)

	cmp	DWORD PTR _idlist$[ebp], 0
	je	$L73030
	mov	edx, DWORD PTR _idlist$[ebp]
	cmp	DWORD PTR [edx], 0
	je	$L73030

; 2105 : 		if(qry_values_list(cntxt, idlist, 0, &l_idobj)) STACK_ERROR;

	lea	eax, DWORD PTR _l_idobj$[ebp]
	push	eax
	push	0
	mov	ecx, DWORD PTR _idlist$[ebp]
	push	ecx
	mov	edx, DWORD PTR _cntxt$[ebp]
	push	edx
	call	_qry_values_list
	add	esp, 16					; 00000010H
	test	eax, eax
	je	SHORT $L73031
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 2105		; 00000839H
	jmp	$eva_err$72957
$L73031:

; 2106 : 		DYNBUF_ADD3(sql, "WHERE TLink0.", selobj, 0, NO_CONV, " IN (");

	push	5
	push	OFFSET FLAT:$SG73034
	push	0
	push	0
	push	0
	mov	ecx, DWORD PTR _selobj$[ebp]
	push	ecx
	push	13					; 0000000dH
	push	OFFSET FLAT:$SG73035
	mov	edx, DWORD PTR _sql$[ebp]
	push	edx
	call	_dynbuf_add3
	add	esp, 36					; 00000024H
	test	eax, eax
	je	SHORT $L73033
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29872], OFFSET FLAT:$SG73037
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 2106		; 0000083aH
	jmp	$eva_err$72957
$L73033:

; 2107 : 		DYNBUF_ADD3_BUF(sql, "", l_idobj, NO_CONV, ") \n");

	cmp	DWORD PTR _l_idobj$[ebp], 0
	je	SHORT $L74483
	mov	edx, DWORD PTR _l_idobj$[ebp]
	mov	eax, DWORD PTR [edx+4]
	mov	DWORD PTR -1068+[ebp], eax
	jmp	SHORT $L74484
$L74483:
	mov	DWORD PTR -1068+[ebp], 0
$L74484:
	cmp	DWORD PTR _l_idobj$[ebp], 0
	je	SHORT $L74485
	mov	ecx, DWORD PTR _l_idobj$[ebp]
	add	ecx, 8
	mov	DWORD PTR -1072+[ebp], ecx
	jmp	SHORT $L74486
$L74485:
	mov	DWORD PTR -1072+[ebp], 0
$L74486:
	push	3
	push	OFFSET FLAT:$SG73041
	push	0
	push	0
	mov	edx, DWORD PTR -1068+[ebp]
	push	edx
	mov	eax, DWORD PTR -1072+[ebp]
	push	eax
	push	0
	push	OFFSET FLAT:$SG73042
	mov	ecx, DWORD PTR _sql$[ebp]
	push	ecx
	call	_dynbuf_add3
	add	esp, 36					; 00000024H
	test	eax, eax
	je	SHORT $L73040
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29872], OFFSET FLAT:$SG73044
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 2107		; 0000083bH
	jmp	$eva_err$72957
$L73040:

; 2108 : 		if(flt->where) DYNBUF_ADD3_BUF(sql, "AND ", flt->where, NO_CONV, "\n");

	mov	ecx, DWORD PTR _flt$[ebp]
	cmp	DWORD PTR [ecx+40], 0
	je	$L73048
	mov	edx, DWORD PTR _flt$[ebp]
	cmp	DWORD PTR [edx+40], 0
	je	SHORT $L74487
	mov	eax, DWORD PTR _flt$[ebp]
	mov	ecx, DWORD PTR [eax+40]
	mov	edx, DWORD PTR [ecx+4]
	mov	DWORD PTR -1076+[ebp], edx
	jmp	SHORT $L74488
$L74487:
	mov	DWORD PTR -1076+[ebp], 0
$L74488:
	mov	eax, DWORD PTR _flt$[ebp]
	cmp	DWORD PTR [eax+40], 0
	je	SHORT $L74489
	mov	ecx, DWORD PTR _flt$[ebp]
	mov	edx, DWORD PTR [ecx+40]
	add	edx, 8
	mov	DWORD PTR -1080+[ebp], edx
	jmp	SHORT $L74490
$L74489:
	mov	DWORD PTR -1080+[ebp], 0
$L74490:
	push	1
	push	OFFSET FLAT:$SG73049
	push	0
	push	0
	mov	eax, DWORD PTR -1076+[ebp]
	push	eax
	mov	ecx, DWORD PTR -1080+[ebp]
	push	ecx
	push	4
	push	OFFSET FLAT:$SG73050
	mov	edx, DWORD PTR _sql$[ebp]
	push	edx
	call	_dynbuf_add3
	add	esp, 36					; 00000024H
	test	eax, eax
	je	SHORT $L73048
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29872], OFFSET FLAT:$SG73052
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 2108		; 0000083cH
	jmp	$eva_err$72957
$L73048:

; 2110 : 	else if(flt->where)

	jmp	$L73057
$L73030:
	mov	edx, DWORD PTR _flt$[ebp]
	cmp	DWORD PTR [edx+40], 0
	je	$L73057

; 2111 : 		DYNBUF_ADD3_BUF(sql, "WHERE ", flt->where, NO_CONV, "\n");

	mov	eax, DWORD PTR _flt$[ebp]
	cmp	DWORD PTR [eax+40], 0
	je	SHORT $L74491
	mov	ecx, DWORD PTR _flt$[ebp]
	mov	edx, DWORD PTR [ecx+40]
	mov	eax, DWORD PTR [edx+4]
	mov	DWORD PTR -1084+[ebp], eax
	jmp	SHORT $L74492
$L74491:
	mov	DWORD PTR -1084+[ebp], 0
$L74492:
	mov	ecx, DWORD PTR _flt$[ebp]
	cmp	DWORD PTR [ecx+40], 0
	je	SHORT $L74493
	mov	edx, DWORD PTR _flt$[ebp]
	mov	eax, DWORD PTR [edx+40]
	add	eax, 8
	mov	DWORD PTR -1088+[ebp], eax
	jmp	SHORT $L74494
$L74493:
	mov	DWORD PTR -1088+[ebp], 0
$L74494:
	push	1
	push	OFFSET FLAT:$SG73058
	push	0
	push	0
	mov	ecx, DWORD PTR -1084+[ebp]
	push	ecx
	mov	edx, DWORD PTR -1088+[ebp]
	push	edx
	push	6
	push	OFFSET FLAT:$SG73059
	mov	eax, DWORD PTR _sql$[ebp]
	push	eax
	call	_dynbuf_add3
	add	esp, 36					; 00000024H
	test	eax, eax
	je	SHORT $L73057
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29872], OFFSET FLAT:$SG73061
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 2111		; 0000083fH
	jmp	$eva_err$72957
$L73057:

; 2112 : 
; 2113 : 	/* Build GROUP BY clause */
; 2114 : 	if(flt->groupfn)

	mov	eax, DWORD PTR _flt$[ebp]
	cmp	DWORD PTR [eax+44], 0
	je	$L73071

; 2116 : 		DYNBUF_ADD_STR(sql, "GROUP BY IdObj\n");

	push	0
	push	0
	push	15					; 0000000fH
	push	OFFSET FLAT:$SG73065
	mov	ecx, DWORD PTR _sql$[ebp]
	push	ecx
	call	_dynbuf_add
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L73064
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29872], OFFSET FLAT:$SG73067
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 2116		; 00000844H
	jmp	$eva_err$72957
$L73064:

; 2117 : 		if(flt->having) DYNBUF_ADD3_BUF(sql, "HAVING ", flt->having, NO_CONV, "\n");

	mov	ecx, DWORD PTR _flt$[ebp]
	cmp	DWORD PTR [ecx+48], 0
	je	$L73071
	mov	edx, DWORD PTR _flt$[ebp]
	cmp	DWORD PTR [edx+48], 0
	je	SHORT $L74495
	mov	eax, DWORD PTR _flt$[ebp]
	mov	ecx, DWORD PTR [eax+48]
	mov	edx, DWORD PTR [ecx+4]
	mov	DWORD PTR -1092+[ebp], edx
	jmp	SHORT $L74496
$L74495:
	mov	DWORD PTR -1092+[ebp], 0
$L74496:
	mov	eax, DWORD PTR _flt$[ebp]
	cmp	DWORD PTR [eax+48], 0
	je	SHORT $L74497
	mov	ecx, DWORD PTR _flt$[ebp]
	mov	edx, DWORD PTR [ecx+48]
	add	edx, 8
	mov	DWORD PTR -1096+[ebp], edx
	jmp	SHORT $L74498
$L74497:
	mov	DWORD PTR -1096+[ebp], 0
$L74498:
	push	1
	push	OFFSET FLAT:$SG73072
	push	0
	push	0
	mov	eax, DWORD PTR -1092+[ebp]
	push	eax
	mov	ecx, DWORD PTR -1096+[ebp]
	push	ecx
	push	7
	push	OFFSET FLAT:$SG73073
	mov	edx, DWORD PTR _sql$[ebp]
	push	edx
	call	_dynbuf_add3
	add	esp, 36					; 00000024H
	test	eax, eax
	je	SHORT $L73071
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29872], OFFSET FLAT:$SG73075
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 2117		; 00000845H
	jmp	$eva_err$72957
$L73071:

; 2119 : 
; 2120 : 	/* Build ORDER BY clause */
; 2121 : 	if(flt->orderby)

	mov	edx, DWORD PTR _flt$[ebp]
	cmp	DWORD PTR [edx+52], 0
	je	$L73079

; 2122 : 		DYNBUF_ADD3_BUF(sql, "ORDER BY ", flt->orderby, NO_CONV, "\n")

	mov	eax, DWORD PTR _flt$[ebp]
	cmp	DWORD PTR [eax+52], 0
	je	SHORT $L74499
	mov	ecx, DWORD PTR _flt$[ebp]
	mov	edx, DWORD PTR [ecx+52]
	mov	eax, DWORD PTR [edx+4]
	mov	DWORD PTR -1100+[ebp], eax
	jmp	SHORT $L74500
$L74499:
	mov	DWORD PTR -1100+[ebp], 0
$L74500:
	mov	ecx, DWORD PTR _flt$[ebp]
	cmp	DWORD PTR [ecx+52], 0
	je	SHORT $L74501
	mov	edx, DWORD PTR _flt$[ebp]
	mov	eax, DWORD PTR [edx+52]
	add	eax, 8
	mov	DWORD PTR -1104+[ebp], eax
	jmp	SHORT $L74502
$L74501:
	mov	DWORD PTR -1104+[ebp], 0
$L74502:
	push	1
	push	OFFSET FLAT:$SG73080
	push	0
	push	0
	mov	ecx, DWORD PTR -1100+[ebp]
	push	ecx
	mov	edx, DWORD PTR -1104+[ebp]
	push	edx
	push	9
	push	OFFSET FLAT:$SG73081
	mov	eax, DWORD PTR _sql$[ebp]
	push	eax
	call	_dynbuf_add3
	add	esp, 36					; 00000024H
	test	eax, eax
	je	SHORT $L73079
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29872], OFFSET FLAT:$SG73083
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 2122		; 0000084aH
	jmp	$eva_err$72957
$L73079:

; 2123 : 
; 2124 : 	/* Build LIMIT clause */
; 2125 : 	if(nbrows)

	cmp	DWORD PTR _nbrows$[ebp], 0
	je	$L73094

; 2127 : 		DYNBUF_ADD3_INT(sql, "LIMIT ", row, ",");

	push	1
	push	OFFSET FLAT:$SG73086
	mov	eax, DWORD PTR _row$[ebp]
	push	eax
	push	6
	push	OFFSET FLAT:$SG73087
	mov	ecx, DWORD PTR _sql$[ebp]
	push	ecx
	call	_dynbuf_add3_int
	add	esp, 24					; 00000018H
	test	eax, eax
	je	SHORT $L73085
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29872], OFFSET FLAT:$SG73089
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 2127		; 0000084fH
	jmp	SHORT $eva_err$72957
$L73085:

; 2128 : 		DYNBUF_ADD_INT(sql, nbrows);

	mov	ecx, DWORD PTR _nbrows$[ebp]
	push	ecx
	mov	edx, DWORD PTR _sql$[ebp]
	push	edx
	call	_dynbuf_add_int
	add	esp, 8
	test	eax, eax
	je	SHORT $L73090
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29872], OFFSET FLAT:$SG73092
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 2128		; 00000850H
	jmp	SHORT $eva_err$72957
$L73090:

; 2129 : 		DYNBUF_ADD_STR(sql, "\n" );

	push	0
	push	0
	push	1
	push	OFFSET FLAT:$SG73095
	mov	edx, DWORD PTR _sql$[ebp]
	push	edx
	call	_dynbuf_add
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L73094
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29872], OFFSET FLAT:$SG73097
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 2129		; 00000851H
	jmp	SHORT $eva_err$72957
$L73094:
$eva_noerr$72951:

; 2131 : 
; 2132 : 	RETURN_OK_CLEANUP;

	push	0
	push	OFFSET FLAT:$SG73098
	push	OFFSET FLAT:$SG73099
	mov	edx, DWORD PTR _cntxt$[ebp]
	push	edx
	call	_err_clear
	add	esp, 16					; 00000010H
$eva_err$72957:
	mov	eax, DWORD PTR _cntxt$[ebp]
	cmp	DWORD PTR [eax+29872], 0
	je	SHORT $L73100
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	edx, DWORD PTR [ecx+29900]
	push	edx
	push	OFFSET FLAT:$SG73101
	push	OFFSET FLAT:$SG73102
	mov	eax, DWORD PTR _cntxt$[ebp]
	push	eax
	call	_err_add_context
	add	esp, 16					; 00000010H
$L73100:
	mov	ecx, DWORD PTR _l_idobj$[ebp]
	push	ecx
	call	_mem_free
	add	esp, 4
	mov	DWORD PTR _l_idobj$[ebp], 0
	mov	edx, DWORD PTR _cntxt$[ebp]
	xor	eax, eax
	cmp	DWORD PTR [edx+29872], 0
	setne	al

; 2133 : }

	mov	esp, ebp
	pop	ebp
	ret	0
_qry_build_flt_select ENDP
_TEXT	ENDS
PUBLIC	_qry_build_compare
EXTRN	_sql_no_quote:BYTE
EXTRN	_sql_no_like_ops:BYTE
_DATA	SEGMENT
	ORG $+3
$SG73137 DB	' ', 00H
	ORG $+2
$SG73139 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG73142 DB	'D:\Travail\ABI\EVA\V4.0\CGI\Brunix-2016\qry_build.c', 00H
$SG73143 DB	'qry_build_compare', 00H
	ORG $+2
$SG73145 DB	'D:\Travail\ABI\EVA\V4.0\CGI\Brunix-2016\qry_build.c', 00H
$SG73146 DB	'qry_build_compare', 00H
_DATA	ENDS
_TEXT	SEGMENT
_cntxt$ = 8
_sql$ = 12
_member$ = 16
_sz_member$ = 20
_oper$ = 24
_sz_oper$ = 28
_val$ = 32
_sz_val$ = 36
_clos$ = 40
_sz_clos$ = 44
_conv$ = 48
_qry_build_compare PROC NEAR

; 2154 : ){

	push	ebp
	mov	ebp, esp
	sub	esp, 8

; 2155 : 	if(dynbuf_add(sql, member, sz_member, NO_CONV) ||
; 2156 : 		dynbuf_add(sql, add_sz_str(" "), NO_CONV) ||
; 2157 : 		dynbuf_add(sql, oper, sz_oper, NO_CONV) ||
; 2158 : 		(
; 2159 : 		conv == 1 ? dynbuf_add(sql, val, sz_val, SQL_NO_LIKE_OPS) :
; 2160 : 		conv == 2 ? dynbuf_add(sql, val, sz_val, SQL_NO_QUOTE) :
; 2161 : 					dynbuf_add(sql, val, sz_val, NO_CONV)
; 2162 : 		) ||
; 2163 : 		dynbuf_add(sql, clos, sz_clos, NO_CONV))

	push	0
	push	0
	mov	eax, DWORD PTR _sz_member$[ebp]
	push	eax
	mov	ecx, DWORD PTR _member$[ebp]
	push	ecx
	mov	edx, DWORD PTR _sql$[ebp]
	push	edx
	call	_dynbuf_add
	add	esp, 20					; 00000014H
	test	eax, eax
	jne	$L73136
	push	0
	push	0
	push	1
	push	OFFSET FLAT:$SG73137
	mov	eax, DWORD PTR _sql$[ebp]
	push	eax
	call	_dynbuf_add
	add	esp, 20					; 00000014H
	test	eax, eax
	jne	$L73136
	push	0
	push	0
	mov	ecx, DWORD PTR _sz_oper$[ebp]
	push	ecx
	mov	edx, DWORD PTR _oper$[ebp]
	push	edx
	mov	eax, DWORD PTR _sql$[ebp]
	push	eax
	call	_dynbuf_add
	add	esp, 20					; 00000014H
	test	eax, eax
	jne	$L73136
	cmp	DWORD PTR _conv$[ebp], 1
	jne	SHORT $L74506
	push	1
	push	OFFSET FLAT:_sql_no_like_ops
	mov	ecx, DWORD PTR _sz_val$[ebp]
	push	ecx
	mov	edx, DWORD PTR _val$[ebp]
	push	edx
	mov	eax, DWORD PTR _sql$[ebp]
	push	eax
	call	_dynbuf_add
	add	esp, 20					; 00000014H
	mov	DWORD PTR -4+[ebp], eax
	jmp	SHORT $L74507
$L74506:
	cmp	DWORD PTR _conv$[ebp], 2
	jne	SHORT $L74504
	push	1
	push	OFFSET FLAT:_sql_no_quote
	mov	ecx, DWORD PTR _sz_val$[ebp]
	push	ecx
	mov	edx, DWORD PTR _val$[ebp]
	push	edx
	mov	eax, DWORD PTR _sql$[ebp]
	push	eax
	call	_dynbuf_add
	add	esp, 20					; 00000014H
	mov	DWORD PTR -8+[ebp], eax
	jmp	SHORT $L74505
$L74504:
	push	0
	push	0
	mov	ecx, DWORD PTR _sz_val$[ebp]
	push	ecx
	mov	edx, DWORD PTR _val$[ebp]
	push	edx
	mov	eax, DWORD PTR _sql$[ebp]
	push	eax
	call	_dynbuf_add
	add	esp, 20					; 00000014H
	mov	DWORD PTR -8+[ebp], eax
$L74505:
	mov	ecx, DWORD PTR -8+[ebp]
	mov	DWORD PTR -4+[ebp], ecx
$L74507:
	cmp	DWORD PTR -4+[ebp], 0
	jne	SHORT $L73136
	push	0
	push	0
	mov	edx, DWORD PTR _sz_clos$[ebp]
	push	edx
	mov	eax, DWORD PTR _clos$[ebp]
	push	eax
	mov	ecx, DWORD PTR _sql$[ebp]
	push	ecx
	call	_dynbuf_add
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $eva_noerr$73141
$L73136:

; 2164 : 		RETURN_ERR_MEMORY;

	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29872], OFFSET FLAT:$SG73139
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 2164		; 00000874H
	jmp	SHORT $eva_err$73140
$eva_noerr$73141:

; 2165 : 
; 2166 : 	RETURN_OK_CLEANUP;

	push	0
	push	OFFSET FLAT:$SG73142
	push	OFFSET FLAT:$SG73143
	mov	ecx, DWORD PTR _cntxt$[ebp]
	push	ecx
	call	_err_clear
	add	esp, 16					; 00000010H
$eva_err$73140:
	mov	edx, DWORD PTR _cntxt$[ebp]
	cmp	DWORD PTR [edx+29872], 0
	je	SHORT $L73144
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	ecx, DWORD PTR [eax+29900]
	push	ecx
	push	OFFSET FLAT:$SG73145
	push	OFFSET FLAT:$SG73146
	mov	edx, DWORD PTR _cntxt$[ebp]
	push	edx
	call	_err_add_context
	add	esp, 16					; 00000010H
$L73144:
	mov	eax, DWORD PTR _cntxt$[ebp]
	xor	ecx, ecx
	cmp	DWORD PTR [eax+29872], 0
	setne	cl
	mov	eax, ecx

; 2167 : }

	mov	esp, ebp
	pop	ebp
	ret	0
_qry_build_compare ENDP
_TEXT	ENDS
PUBLIC	_qry_parse_matchmode
EXTRN	_sql_id_values:NEAR
_BSS	SEGMENT
	ALIGN	4

$SG73183 DB	01H DUP (?)
	ALIGN	4

$SG73245 DB	01H DUP (?)
	ALIGN	4

$SG73258 DB	01H DUP (?)
	ALIGN	4

$SG73445 DB	01H DUP (?)
	ALIGN	4

$SG73459 DB	01H DUP (?)
	ALIGN	4

$SG73473 DB	01H DUP (?)
	ALIGN	4

$SG73487 DB	01H DUP (?)
	ALIGN	4

$SG73559 DB	01H DUP (?)
	ALIGN	4

$SG73564 DB	01H DUP (?)
	ALIGN	4

$SG73569 DB	01H DUP (?)
	ALIGN	4

$SG73604 DB	01H DUP (?)
	ALIGN	4

$SG73609 DB	01H DUP (?)
	ALIGN	4

$SG73614 DB	01H DUP (?)
_BSS	ENDS
_DATA	SEGMENT
	ORG $+2
$SG73176 DB	'TxtValue', 00H
	ORG $+3
$SG73209 DB	',', 00H
	ORG $+2
$SG73211 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG73218 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG73224 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG73225 DB	'IdValue', 00H
$SG73229 DB	'TVal', 00H
	ORG $+3
$SG73230 DB	'TLink', 00H
	ORG $+2
$SG73231 DB	'%s%lu.%s', 00H
	ORG $+3
$SG73244 DB	' NOT IN (', 00H
	ORG $+2
$SG73247 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG73251 DB	')', 00H
	ORG $+2
$SG73253 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG73257 DB	' IN (', 00H
	ORG $+2
$SG73260 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG73264 DB	')', 00H
	ORG $+2
$SG73266 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG73275 DB	' AND ', 00H
	ORG $+2
$SG73277 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG73279 DB	'''', 00H
	ORG $+2
$SG73280 DB	'<>''', 00H
$SG73285 DB	'(', 00H
	ORG $+2
$SG73287 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG73295 DB	' OR ', 00H
	ORG $+3
$SG73297 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG73299 DB	'''', 00H
	ORG $+2
$SG73300 DB	'=''', 00H
	ORG $+1
$SG73304 DB	')', 00H
	ORG $+2
$SG73306 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG73315 DB	' AND ', 00H
	ORG $+2
$SG73317 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG73319 DB	'%''', 00H
	ORG $+1
$SG73320 DB	'NOT LIKE ''%', 00H
$SG73325 DB	'(', 00H
	ORG $+2
$SG73327 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG73335 DB	' OR ', 00H
	ORG $+3
$SG73337 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG73339 DB	'%''', 00H
	ORG $+1
$SG73340 DB	'LIKE ''%', 00H
$SG73344 DB	')', 00H
	ORG $+2
$SG73346 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG73355 DB	' AND ', 00H
	ORG $+2
$SG73357 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG73359 DB	'%''', 00H
	ORG $+1
$SG73360 DB	'NOT LIKE ''', 00H
	ORG $+1
$SG73365 DB	'(', 00H
	ORG $+2
$SG73367 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG73375 DB	' OR ', 00H
	ORG $+3
$SG73377 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG73379 DB	'%''', 00H
	ORG $+1
$SG73380 DB	'LIKE ''', 00H
	ORG $+1
$SG73384 DB	')', 00H
	ORG $+2
$SG73386 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG73395 DB	' AND ', 00H
	ORG $+2
$SG73397 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG73399 DB	'''', 00H
	ORG $+2
$SG73400 DB	'NOT LIKE ''', 00H
	ORG $+1
$SG73405 DB	'(', 00H
	ORG $+2
$SG73407 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG73415 DB	' OR ', 00H
	ORG $+3
$SG73417 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG73419 DB	'''', 00H
	ORG $+2
$SG73420 DB	'LIKE ''', 00H
	ORG $+1
$SG73424 DB	')', 00H
	ORG $+2
$SG73426 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG73441 DB	' AND ', 00H
	ORG $+2
$SG73443 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG73446 DB	'<', 00H
	ORG $+2
$SG73455 DB	' AND ', 00H
	ORG $+2
$SG73457 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG73460 DB	'<=', 00H
	ORG $+1
$SG73469 DB	' AND ', 00H
	ORG $+2
$SG73471 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG73474 DB	'>', 00H
	ORG $+2
$SG73483 DB	' AND ', 00H
	ORG $+2
$SG73485 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG73488 DB	'>=', 00H
	ORG $+1
$SG73503 DB	' AND ', 00H
	ORG $+2
$SG73505 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG73507 DB	'''', 00H
	ORG $+2
$SG73508 DB	'<''', 00H
	ORG $+1
$SG73517 DB	' AND ', 00H
	ORG $+2
$SG73519 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG73521 DB	'''', 00H
	ORG $+2
$SG73522 DB	'<=''', 00H
$SG73531 DB	' AND ', 00H
	ORG $+2
$SG73533 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG73535 DB	'''', 00H
	ORG $+2
$SG73536 DB	'>''', 00H
	ORG $+1
$SG73545 DB	' AND ', 00H
	ORG $+2
$SG73547 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG73549 DB	'''', 00H
	ORG $+2
$SG73550 DB	'>=''', 00H
$SG73556 DB	' AND ', 00H
	ORG $+2
$SG73557 DB	'<', 00H
	ORG $+2
$SG73560 DB	'>=', 00H
	ORG $+1
$SG73565 DB	'<', 00H
	ORG $+2
$SG73570 DB	'<', 00H
	ORG $+2
$SG73573 DB	'''', 00H
	ORG $+2
$SG73574 DB	'<>''', 00H
$SG73578 DB	''' AND ', 00H
	ORG $+1
$SG73579 DB	'<''', 00H
	ORG $+1
$SG73581 DB	'''', 00H
	ORG $+2
$SG73582 DB	'>=''', 00H
$SG73586 DB	'''', 00H
	ORG $+2
$SG73587 DB	'<''', 00H
	ORG $+1
$SG73591 DB	'''', 00H
	ORG $+2
$SG73592 DB	'<''', 00H
	ORG $+1
$SG73595 DB	'''', 00H
	ORG $+2
$SG73596 DB	'<>''', 00H
$SG73601 DB	' AND ', 00H
	ORG $+2
$SG73602 DB	'>=', 00H
	ORG $+1
$SG73605 DB	'<', 00H
	ORG $+2
$SG73610 DB	'>=', 00H
	ORG $+1
$SG73615 DB	'<', 00H
	ORG $+2
$SG73618 DB	'''', 00H
	ORG $+2
$SG73619 DB	'<>''', 00H
$SG73623 DB	''' AND ', 00H
	ORG $+1
$SG73624 DB	'>=''', 00H
$SG73626 DB	'''', 00H
	ORG $+2
$SG73627 DB	'<''', 00H
	ORG $+1
$SG73631 DB	'''', 00H
	ORG $+2
$SG73632 DB	'>=''', 00H
$SG73636 DB	'''', 00H
	ORG $+2
$SG73637 DB	'<''', 00H
	ORG $+1
$SG73640 DB	'''', 00H
	ORG $+2
$SG73641 DB	'<>''', 00H
$SG73644 DB	'D:\Travail\ABI\EVA\V4.0\CGI\Brunix-2016\qry_build.c', 00H
$SG73645 DB	'qry_parse_matchmode', 00H
$SG73647 DB	'D:\Travail\ABI\EVA\V4.0\CGI\Brunix-2016\qry_build.c', 00H
$SG73648 DB	'qry_parse_matchmode', 00H
_DATA	ENDS
_TEXT	SEGMENT
_cntxt$ = 8
_sql$ = 12
_member$ = 16
_join$ = 20
_match$ = 24
_mtyp$ = 28
_values$ = 32
_b_valjoin$ = 36
_data$ = -28
_val$ = -8
_listval$ = -4
_i$ = -1064
_limit$ = -1068
_tblmember$ = -1060
_tmember$ = -36
_valjoin$ = -32
_sz$ = -1080
_newmatch$ = -1072
_valmatch$ = -1076
_c$73200 = -1084
_qry_parse_matchmode PROC NEAR

; 2188 : ){

	push	ebp
	mov	ebp, esp
	sub	esp, 1108				; 00000454H

; 2189 : 	DynTable data = {0};

	mov	DWORD PTR _data$[ebp], 0
	xor	eax, eax
	mov	DWORD PTR _data$[ebp+4], eax
	mov	DWORD PTR _data$[ebp+8], eax
	mov	DWORD PTR _data$[ebp+12], eax
	mov	DWORD PTR _data$[ebp+16], eax

; 2190 : 	DynTable *val = values;

	mov	ecx, DWORD PTR _values$[ebp]
	mov	DWORD PTR _val$[ebp], ecx

; 2191 : 	DynBuffer *listval = NULL;

	mov	DWORD PTR _listval$[ebp], 0

; 2192 : 	unsigned long i, limit = 100;

	mov	DWORD PTR _limit$[ebp], 100		; 00000064H

; 2193 : 	char tblmember[1024], *tmember = member;

	mov	edx, DWORD PTR _member$[ebp]
	mov	DWORD PTR _tmember$[ebp], edx

; 2194 : 	int valjoin = member && !strcmp(member, "TxtValue");

	cmp	DWORD PTR _member$[ebp], 0
	je	SHORT $L74509
	push	OFFSET FLAT:$SG73176
	mov	eax, DWORD PTR _member$[ebp]
	push	eax
	call	_strcmp
	add	esp, 8
	test	eax, eax
	jne	SHORT $L74509
	mov	DWORD PTR -1088+[ebp], 1
	jmp	SHORT $L74510
$L74509:
	mov	DWORD PTR -1088+[ebp], 0
$L74510:
	mov	ecx, DWORD PTR -1088+[ebp]
	mov	DWORD PTR _valjoin$[ebp], ecx

; 2195 : 	size_t sz;
; 2196 : 	MatchMode newmatch = NoMatch, valmatch = match;

	mov	DWORD PTR _newmatch$[ebp], 0
	mov	edx, DWORD PTR _match$[ebp]
	mov	DWORD PTR _valmatch$[ebp], edx

; 2197 : 	if(match == NoMatch || !sql) return 0;

	cmp	DWORD PTR _match$[ebp], 0
	je	SHORT $L73181
	cmp	DWORD PTR _sql$[ebp], 0
	jne	SHORT $L73180
$L73181:
	xor	eax, eax
	jmp	$L73166
$L73180:

; 2198 : 	if(!member) member = "";

	cmp	DWORD PTR _member$[ebp], 0
	jne	SHORT $L73182
	mov	DWORD PTR _member$[ebp], OFFSET FLAT:$SG73183
$L73182:

; 2199 : 
; 2200 : 	/* Minimize joins by fetching values Ids when reasonable */
; 2201 : 	if(valjoin && b_valjoin)

	cmp	DWORD PTR _valjoin$[ebp], 0
	je	$L73213
	cmp	DWORD PTR _b_valjoin$[ebp], 0
	je	$L73213

; 2203 : 		switch(match)
; 2204 : 		{

	mov	eax, DWORD PTR _match$[ebp]
	mov	DWORD PTR -1092+[ebp], eax
	mov	ecx, DWORD PTR -1092+[ebp]
	sub	ecx, 5
	mov	DWORD PTR -1092+[ebp], ecx
	cmp	DWORD PTR -1092+[ebp], 9
	ja	SHORT $L73194
	mov	edx, DWORD PTR -1092+[ebp]
	jmp	DWORD PTR $L74513[edx*4]
$L73189:

; 2205 : 		case NotContain: newmatch = NotIdValList; valmatch = Contain; break;

	mov	DWORD PTR _newmatch$[ebp], 8
	mov	DWORD PTR _valmatch$[ebp], 11		; 0000000bH
	jmp	SHORT $L73186
$L73190:

; 2206 : 		case NotBegin: newmatch = NotIdValList; valmatch = Begin; break;

	mov	DWORD PTR _newmatch$[ebp], 8
	mov	DWORD PTR _valmatch$[ebp], 13		; 0000000dH
	jmp	SHORT $L73186
$L73191:

; 2207 : 		case NotLike: newmatch = NotIdValList; valmatch = Like; break;

	mov	DWORD PTR _newmatch$[ebp], 8
	mov	DWORD PTR _valmatch$[ebp], 9
	jmp	SHORT $L73186
$L73192:

; 2208 : 		case Different: newmatch = NotIdValList; valmatch = Exact; break;

	mov	DWORD PTR _newmatch$[ebp], 8
	mov	DWORD PTR _valmatch$[ebp], 6
	jmp	SHORT $L73186
$L73193:

; 2209 : 		case Contain:
; 2210 : 		case Begin:
; 2211 : 		case Like:
; 2212 : 		case Exact:
; 2213 : 			newmatch = IdValList;

	mov	DWORD PTR _newmatch$[ebp], 7
$L73194:
$L73186:

; 2218 : 
; 2219 : 		if(newmatch != NoMatch)

	cmp	DWORD PTR _newmatch$[ebp], 0
	je	$L73213

; 2221 : 			/* Query Ids for each value */
; 2222 : 			for(i = 0; !i || i < values->nbrows; i++)

	mov	DWORD PTR _i$[ebp], 0
	jmp	SHORT $L73196
$L73197:
	mov	eax, DWORD PTR _i$[ebp]
	add	eax, 1
	mov	DWORD PTR _i$[ebp], eax
$L73196:
	cmp	DWORD PTR _i$[ebp], 0
	je	SHORT $L73199
	mov	ecx, DWORD PTR _values$[ebp]
	mov	edx, DWORD PTR _i$[ebp]
	cmp	edx, DWORD PTR [ecx]
	jae	$L73198
$L73199:

; 2224 : 				DynTableCell *c = dyntab_cell(values, i, 0);

	push	0
	mov	eax, DWORD PTR _i$[ebp]
	push	eax
	mov	ecx, DWORD PTR _values$[ebp]
	push	ecx
	call	_dyntab_cell
	add	esp, 12					; 0000000cH
	mov	DWORD PTR _c$73200[ebp], eax

; 2225 : 				if(!c) dyntab_free(&data);

	cmp	DWORD PTR _c$73200[ebp], 0
	jne	SHORT $L73201
	lea	edx, DWORD PTR _data$[ebp]
	push	edx
	call	_dyntab_free
	add	esp, 4

; 2226 : 				else if(sql_id_values(cntxt, &data, c->txt, c->len, valmatch, limit)) STACK_ERROR;

	jmp	SHORT $L73203
$L73201:
	mov	eax, DWORD PTR _limit$[ebp]
	push	eax
	mov	ecx, DWORD PTR _valmatch$[ebp]
	push	ecx
	mov	edx, DWORD PTR _c$73200[ebp]
	mov	eax, DWORD PTR [edx+4]
	push	eax
	mov	ecx, DWORD PTR _c$73200[ebp]
	mov	edx, DWORD PTR [ecx]
	push	edx
	lea	eax, DWORD PTR _data$[ebp]
	push	eax
	mov	ecx, DWORD PTR _cntxt$[ebp]
	push	ecx
	call	_sql_id_values
	add	esp, 24					; 00000018H
	test	eax, eax
	je	SHORT $L73203
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 2226		; 000008b2H
	jmp	$eva_err$73204
$L73203:

; 2227 : 				if(data.nbrows == limit) break;

	mov	eax, DWORD PTR _data$[ebp]
	cmp	eax, DWORD PTR _limit$[ebp]
	jne	SHORT $L73205
	jmp	SHORT $L73198
$L73205:

; 2228 : 				if(listval) DYNBUF_ADD_STR(&listval, ",");

	cmp	DWORD PTR _listval$[ebp], 0
	je	SHORT $L73208
	push	0
	push	0
	push	1
	push	OFFSET FLAT:$SG73209
	lea	ecx, DWORD PTR _listval$[ebp]
	push	ecx
	call	_dynbuf_add
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L73208
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29872], OFFSET FLAT:$SG73211
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 2228		; 000008b4H
	jmp	$eva_err$73204
$L73208:

; 2229 : 				if(qry_values_list(cntxt, &data, 0, &listval)) STACK_ERROR;

	lea	ecx, DWORD PTR _listval$[ebp]
	push	ecx
	push	0
	lea	edx, DWORD PTR _data$[ebp]
	push	edx
	mov	eax, DWORD PTR _cntxt$[ebp]
	push	eax
	call	_qry_values_list
	add	esp, 16					; 00000010H
	test	eax, eax
	je	SHORT $L73212
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 2229		; 000008b5H
	jmp	$eva_err$73204
$L73212:

; 2230 : 			}

	jmp	$L73197
$L73198:

; 2231 : 			/* Set optimized node if not too many matches */
; 2232 : 			if(i == values->nbrows)

	mov	edx, DWORD PTR _values$[ebp]
	mov	eax, DWORD PTR _i$[ebp]
	cmp	eax, DWORD PTR [edx]
	jne	$L73213

; 2234 : 				dyntab_free(&data);

	lea	ecx, DWORD PTR _data$[ebp]
	push	ecx
	call	_dyntab_free
	add	esp, 4

; 2235 : 				DYNTAB_ADD_BUF(&data, 0, 0, listval)

	cmp	DWORD PTR _listval$[ebp], 0
	je	SHORT $L73214
	mov	edx, DWORD PTR _listval$[ebp]
	cmp	DWORD PTR [edx+4], 0
	je	SHORT $L73214
	push	0
	push	0
	mov	eax, DWORD PTR _listval$[ebp]
	mov	ecx, DWORD PTR [eax+4]
	push	ecx
	mov	edx, DWORD PTR _listval$[ebp]
	add	edx, 8
	push	edx
	push	0
	push	0
	lea	eax, DWORD PTR _data$[ebp]
	push	eax
	call	_dyntab_add
	add	esp, 28					; 0000001cH
	test	eax, eax
	je	SHORT $L73216
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29872], OFFSET FLAT:$SG73218
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 2235		; 000008bbH
	jmp	$eva_err$73204
$L73216:
	jmp	SHORT $L73222
$L73214:
	push	0
	push	0
	push	0
	push	0
	push	0
	push	0
	lea	eax, DWORD PTR _data$[ebp]
	push	eax
	call	_dyntab_add
	add	esp, 28					; 0000001cH
	test	eax, eax
	je	SHORT $L73222
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29872], OFFSET FLAT:$SG73224
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 2235		; 000008bbH
	jmp	$eva_err$73204
$L73222:

; 2236 : 				val = &data;

	lea	eax, DWORD PTR _data$[ebp]
	mov	DWORD PTR _val$[ebp], eax

; 2237 : 				match = newmatch;

	mov	ecx, DWORD PTR _newmatch$[ebp]
	mov	DWORD PTR _match$[ebp], ecx

; 2238 : 				member = "IdValue";

	mov	DWORD PTR _member$[ebp], OFFSET FLAT:$SG73225

; 2239 : 				valjoin = 0;

	mov	DWORD PTR _valjoin$[ebp], 0
$L73213:

; 2243 : 
; 2244 : 	/* Prepare value table expression */
; 2245 : 	if(b_valjoin) *b_valjoin = valjoin;

	cmp	DWORD PTR _b_valjoin$[ebp], 0
	je	SHORT $L73226
	mov	edx, DWORD PTR _b_valjoin$[ebp]
	mov	eax, DWORD PTR _valjoin$[ebp]
	mov	DWORD PTR [edx], eax
$L73226:

; 2246 : 	if(join == ~0UL)

	cmp	DWORD PTR _join$[ebp], -1
	jne	SHORT $L73227

; 2247 : 		sz = strlen(member);

	mov	ecx, DWORD PTR _member$[ebp]
	push	ecx
	call	_strlen
	add	esp, 4
	mov	DWORD PTR _sz$[ebp], eax

; 2248 : 	else

	jmp	SHORT $L73228
$L73227:

; 2250 : 		sz = snprintf(add_sz_str(tblmember), "%s%lu.%s", valjoin ? "TVal" : "TLink", join, member);

	cmp	DWORD PTR _valjoin$[ebp], 0
	je	SHORT $L74511
	mov	DWORD PTR -1096+[ebp], OFFSET FLAT:$SG73229
	jmp	SHORT $L74512
$L74511:
	mov	DWORD PTR -1096+[ebp], OFFSET FLAT:$SG73230
$L74512:
	mov	edx, DWORD PTR _member$[ebp]
	push	edx
	mov	eax, DWORD PTR _join$[ebp]
	push	eax
	mov	ecx, DWORD PTR -1096+[ebp]
	push	ecx
	push	OFFSET FLAT:$SG73231
	push	1023					; 000003ffH
	lea	edx, DWORD PTR _tblmember$[ebp]
	push	edx
	call	__snprintf
	add	esp, 24					; 00000018H
	mov	DWORD PTR _sz$[ebp], eax

; 2251 : 		tmember = tblmember;

	lea	eax, DWORD PTR _tblmember$[ebp]
	mov	DWORD PTR _tmember$[ebp], eax
$L73228:

; 2253 : 
; 2254 : #define PARSE(oper, i, clos, conv) if(qry_build_compare(cntxt, sql, tmember, sz, add_sz_str(oper), DYNTAB_VAL_SZ(val, i, 0), add_sz_str(clos), conv)) STACK_ERROR
; 2255 : #define PARSE_LOOP(oper, sep, clos, conv) for(i = 0; !i || i < val->nbrows; i++) { if(i) DYNBUF_ADD_STR(sql, sep);  PARSE(oper, i, clos, conv); }
; 2256 : #define PARSE_NUM(oper, clos) DYNBUF_ADD3(sql, "", tmember, sz, NO_CONV, " " oper); if(qry_values_list(cntxt, val, 0, sql)) STACK_ERROR; DYNBUF_ADD_STR(sql, clos)
; 2257 : #define PARSE_AND(oper, clos, conv) PARSE_LOOP(oper, " AND ", clos, conv)
; 2258 : #define PARSE_OR(oper, clos, conv) if(val->nbrows > 1) DYNBUF_ADD_STR(sql, "("); PARSE_LOOP(oper, " OR ", clos, conv); if(val->nbrows > 1) DYNBUF_ADD_STR(sql, ")")
; 2259 : 
; 2260 : 	switch(match)
; 2261 : 	{

	mov	ecx, DWORD PTR _match$[ebp]
	mov	DWORD PTR -1100+[ebp], ecx
	mov	edx, DWORD PTR -1100+[ebp]
	sub	edx, 1
	mov	DWORD PTR -1100+[ebp], edx
	cmp	DWORD PTR -1100+[ebp], 19		; 00000013H
	ja	$L73642
	mov	eax, DWORD PTR -1100+[ebp]
	jmp	DWORD PTR $L74514[eax*4]
$L73241:

; 2262 :     case NotObjList:
; 2263 : 	case NotRelList:
; 2264 : 	case NotIdValList:	PARSE_NUM("NOT IN (", ")"); break;

	push	9
	push	OFFSET FLAT:$SG73244
	push	0
	push	0
	mov	ecx, DWORD PTR _sz$[ebp]
	push	ecx
	mov	edx, DWORD PTR _tmember$[ebp]
	push	edx
	push	0
	push	OFFSET FLAT:$SG73245
	mov	eax, DWORD PTR _sql$[ebp]
	push	eax
	call	_dynbuf_add3
	add	esp, 36					; 00000024H
	test	eax, eax
	je	SHORT $L73243
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29872], OFFSET FLAT:$SG73247
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 2264		; 000008d8H
	jmp	$eva_err$73204
$L73243:
	mov	eax, DWORD PTR _sql$[ebp]
	push	eax
	push	0
	mov	ecx, DWORD PTR _val$[ebp]
	push	ecx
	mov	edx, DWORD PTR _cntxt$[ebp]
	push	edx
	call	_qry_values_list
	add	esp, 16					; 00000010H
	test	eax, eax
	je	SHORT $L73248
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 2264		; 000008d8H
	jmp	$eva_err$73204
$L73248:
	push	0
	push	0
	push	1
	push	OFFSET FLAT:$SG73251
	mov	ecx, DWORD PTR _sql$[ebp]
	push	ecx
	call	_dynbuf_add
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L73250
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29872], OFFSET FLAT:$SG73253
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 2264		; 000008d8H
	jmp	$eva_err$73204
$L73250:
	jmp	$eva_noerr$73643
$L73254:

; 2265 : 	case ObjList:
; 2266 : 	case RelList:
; 2267 : 	case IdValList:		PARSE_NUM("IN (", ")"); break;

	push	5
	push	OFFSET FLAT:$SG73257
	push	0
	push	0
	mov	ecx, DWORD PTR _sz$[ebp]
	push	ecx
	mov	edx, DWORD PTR _tmember$[ebp]
	push	edx
	push	0
	push	OFFSET FLAT:$SG73258
	mov	eax, DWORD PTR _sql$[ebp]
	push	eax
	call	_dynbuf_add3
	add	esp, 36					; 00000024H
	test	eax, eax
	je	SHORT $L73256
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29872], OFFSET FLAT:$SG73260
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 2267		; 000008dbH
	jmp	$eva_err$73204
$L73256:
	mov	eax, DWORD PTR _sql$[ebp]
	push	eax
	push	0
	mov	ecx, DWORD PTR _val$[ebp]
	push	ecx
	mov	edx, DWORD PTR _cntxt$[ebp]
	push	edx
	call	_qry_values_list
	add	esp, 16					; 00000010H
	test	eax, eax
	je	SHORT $L73261
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 2267		; 000008dbH
	jmp	$eva_err$73204
$L73261:
	push	0
	push	0
	push	1
	push	OFFSET FLAT:$SG73264
	mov	ecx, DWORD PTR _sql$[ebp]
	push	ecx
	call	_dynbuf_add
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L73263
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29872], OFFSET FLAT:$SG73266
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 2267		; 000008dbH
	jmp	$eva_err$73204
$L73263:
	jmp	$eva_noerr$73643
$L73267:

; 2268 : 	case Different:		PARSE_AND("<>'", "'", 2); break;

	mov	DWORD PTR _i$[ebp], 0
	jmp	SHORT $L73268
$L73269:
	mov	ecx, DWORD PTR _i$[ebp]
	add	ecx, 1
	mov	DWORD PTR _i$[ebp], ecx
$L73268:
	cmp	DWORD PTR _i$[ebp], 0
	je	SHORT $L73271
	mov	edx, DWORD PTR _val$[ebp]
	mov	eax, DWORD PTR _i$[ebp]
	cmp	eax, DWORD PTR [edx]
	jae	$L73270
$L73271:
	cmp	DWORD PTR _i$[ebp], 0
	je	SHORT $L73274
	push	0
	push	0
	push	5
	push	OFFSET FLAT:$SG73275
	mov	ecx, DWORD PTR _sql$[ebp]
	push	ecx
	call	_dynbuf_add
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L73274
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29872], OFFSET FLAT:$SG73277
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 2268		; 000008dcH
	jmp	$eva_err$73204
$L73274:
	push	2
	push	1
	push	OFFSET FLAT:$SG73279
	push	0
	mov	ecx, DWORD PTR _i$[ebp]
	push	ecx
	mov	edx, DWORD PTR _val$[ebp]
	push	edx
	call	_dyntab_sz
	add	esp, 12					; 0000000cH
	push	eax
	push	0
	mov	eax, DWORD PTR _i$[ebp]
	push	eax
	mov	ecx, DWORD PTR _val$[ebp]
	push	ecx
	call	_dyntab_val
	add	esp, 12					; 0000000cH
	push	eax
	push	3
	push	OFFSET FLAT:$SG73280
	mov	edx, DWORD PTR _sz$[ebp]
	push	edx
	mov	eax, DWORD PTR _tmember$[ebp]
	push	eax
	mov	ecx, DWORD PTR _sql$[ebp]
	push	ecx
	mov	edx, DWORD PTR _cntxt$[ebp]
	push	edx
	call	_qry_build_compare
	add	esp, 44					; 0000002cH
	test	eax, eax
	je	SHORT $L73278
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 2268		; 000008dcH
	jmp	$eva_err$73204
$L73278:
	jmp	$L73269
$L73270:
	jmp	$eva_noerr$73643
$L73281:

; 2269 : 	case Exact:			PARSE_OR("='", "'", 2); break;

	mov	ecx, DWORD PTR _val$[ebp]
	cmp	DWORD PTR [ecx], 1
	jbe	SHORT $L73284
	push	0
	push	0
	push	1
	push	OFFSET FLAT:$SG73285
	mov	edx, DWORD PTR _sql$[ebp]
	push	edx
	call	_dynbuf_add
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L73284
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29872], OFFSET FLAT:$SG73287
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 2269		; 000008ddH
	jmp	$eva_err$73204
$L73284:
	mov	DWORD PTR _i$[ebp], 0
	jmp	SHORT $L73288
$L73289:
	mov	edx, DWORD PTR _i$[ebp]
	add	edx, 1
	mov	DWORD PTR _i$[ebp], edx
$L73288:
	cmp	DWORD PTR _i$[ebp], 0
	je	SHORT $L73291
	mov	eax, DWORD PTR _val$[ebp]
	mov	ecx, DWORD PTR _i$[ebp]
	cmp	ecx, DWORD PTR [eax]
	jae	$L73290
$L73291:
	cmp	DWORD PTR _i$[ebp], 0
	je	SHORT $L73294
	push	0
	push	0
	push	4
	push	OFFSET FLAT:$SG73295
	mov	edx, DWORD PTR _sql$[ebp]
	push	edx
	call	_dynbuf_add
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L73294
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29872], OFFSET FLAT:$SG73297
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 2269		; 000008ddH
	jmp	$eva_err$73204
$L73294:
	push	2
	push	1
	push	OFFSET FLAT:$SG73299
	push	0
	mov	edx, DWORD PTR _i$[ebp]
	push	edx
	mov	eax, DWORD PTR _val$[ebp]
	push	eax
	call	_dyntab_sz
	add	esp, 12					; 0000000cH
	push	eax
	push	0
	mov	ecx, DWORD PTR _i$[ebp]
	push	ecx
	mov	edx, DWORD PTR _val$[ebp]
	push	edx
	call	_dyntab_val
	add	esp, 12					; 0000000cH
	push	eax
	push	2
	push	OFFSET FLAT:$SG73300
	mov	eax, DWORD PTR _sz$[ebp]
	push	eax
	mov	ecx, DWORD PTR _tmember$[ebp]
	push	ecx
	mov	edx, DWORD PTR _sql$[ebp]
	push	edx
	mov	eax, DWORD PTR _cntxt$[ebp]
	push	eax
	call	_qry_build_compare
	add	esp, 44					; 0000002cH
	test	eax, eax
	je	SHORT $L73298
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 2269		; 000008ddH
	jmp	$eva_err$73204
$L73298:
	jmp	$L73289
$L73290:
	mov	edx, DWORD PTR _val$[ebp]
	cmp	DWORD PTR [edx], 1
	jbe	SHORT $L73303
	push	0
	push	0
	push	1
	push	OFFSET FLAT:$SG73304
	mov	eax, DWORD PTR _sql$[ebp]
	push	eax
	call	_dynbuf_add
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L73303
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29872], OFFSET FLAT:$SG73306
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 2269		; 000008ddH
	jmp	$eva_err$73204
$L73303:
	jmp	$eva_noerr$73643
$L73307:

; 2270 : 	case NotContain:	PARSE_AND("NOT LIKE '%", "%'", 1); break;

	mov	DWORD PTR _i$[ebp], 0
	jmp	SHORT $L73308
$L73309:
	mov	eax, DWORD PTR _i$[ebp]
	add	eax, 1
	mov	DWORD PTR _i$[ebp], eax
$L73308:
	cmp	DWORD PTR _i$[ebp], 0
	je	SHORT $L73311
	mov	ecx, DWORD PTR _val$[ebp]
	mov	edx, DWORD PTR _i$[ebp]
	cmp	edx, DWORD PTR [ecx]
	jae	$L73310
$L73311:
	cmp	DWORD PTR _i$[ebp], 0
	je	SHORT $L73314
	push	0
	push	0
	push	5
	push	OFFSET FLAT:$SG73315
	mov	eax, DWORD PTR _sql$[ebp]
	push	eax
	call	_dynbuf_add
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L73314
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29872], OFFSET FLAT:$SG73317
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 2270		; 000008deH
	jmp	$eva_err$73204
$L73314:
	push	1
	push	2
	push	OFFSET FLAT:$SG73319
	push	0
	mov	eax, DWORD PTR _i$[ebp]
	push	eax
	mov	ecx, DWORD PTR _val$[ebp]
	push	ecx
	call	_dyntab_sz
	add	esp, 12					; 0000000cH
	push	eax
	push	0
	mov	edx, DWORD PTR _i$[ebp]
	push	edx
	mov	eax, DWORD PTR _val$[ebp]
	push	eax
	call	_dyntab_val
	add	esp, 12					; 0000000cH
	push	eax
	push	11					; 0000000bH
	push	OFFSET FLAT:$SG73320
	mov	ecx, DWORD PTR _sz$[ebp]
	push	ecx
	mov	edx, DWORD PTR _tmember$[ebp]
	push	edx
	mov	eax, DWORD PTR _sql$[ebp]
	push	eax
	mov	ecx, DWORD PTR _cntxt$[ebp]
	push	ecx
	call	_qry_build_compare
	add	esp, 44					; 0000002cH
	test	eax, eax
	je	SHORT $L73318
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 2270		; 000008deH
	jmp	$eva_err$73204
$L73318:
	jmp	$L73309
$L73310:
	jmp	$eva_noerr$73643
$L73321:

; 2271 : 	case Contain:		PARSE_OR("LIKE '%", "%'", 1); break;

	mov	eax, DWORD PTR _val$[ebp]
	cmp	DWORD PTR [eax], 1
	jbe	SHORT $L73324
	push	0
	push	0
	push	1
	push	OFFSET FLAT:$SG73325
	mov	ecx, DWORD PTR _sql$[ebp]
	push	ecx
	call	_dynbuf_add
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L73324
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29872], OFFSET FLAT:$SG73327
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 2271		; 000008dfH
	jmp	$eva_err$73204
$L73324:
	mov	DWORD PTR _i$[ebp], 0
	jmp	SHORT $L73328
$L73329:
	mov	ecx, DWORD PTR _i$[ebp]
	add	ecx, 1
	mov	DWORD PTR _i$[ebp], ecx
$L73328:
	cmp	DWORD PTR _i$[ebp], 0
	je	SHORT $L73331
	mov	edx, DWORD PTR _val$[ebp]
	mov	eax, DWORD PTR _i$[ebp]
	cmp	eax, DWORD PTR [edx]
	jae	$L73330
$L73331:
	cmp	DWORD PTR _i$[ebp], 0
	je	SHORT $L73334
	push	0
	push	0
	push	4
	push	OFFSET FLAT:$SG73335
	mov	ecx, DWORD PTR _sql$[ebp]
	push	ecx
	call	_dynbuf_add
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L73334
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29872], OFFSET FLAT:$SG73337
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 2271		; 000008dfH
	jmp	$eva_err$73204
$L73334:
	push	1
	push	2
	push	OFFSET FLAT:$SG73339
	push	0
	mov	ecx, DWORD PTR _i$[ebp]
	push	ecx
	mov	edx, DWORD PTR _val$[ebp]
	push	edx
	call	_dyntab_sz
	add	esp, 12					; 0000000cH
	push	eax
	push	0
	mov	eax, DWORD PTR _i$[ebp]
	push	eax
	mov	ecx, DWORD PTR _val$[ebp]
	push	ecx
	call	_dyntab_val
	add	esp, 12					; 0000000cH
	push	eax
	push	7
	push	OFFSET FLAT:$SG73340
	mov	edx, DWORD PTR _sz$[ebp]
	push	edx
	mov	eax, DWORD PTR _tmember$[ebp]
	push	eax
	mov	ecx, DWORD PTR _sql$[ebp]
	push	ecx
	mov	edx, DWORD PTR _cntxt$[ebp]
	push	edx
	call	_qry_build_compare
	add	esp, 44					; 0000002cH
	test	eax, eax
	je	SHORT $L73338
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 2271		; 000008dfH
	jmp	$eva_err$73204
$L73338:
	jmp	$L73329
$L73330:
	mov	ecx, DWORD PTR _val$[ebp]
	cmp	DWORD PTR [ecx], 1
	jbe	SHORT $L73343
	push	0
	push	0
	push	1
	push	OFFSET FLAT:$SG73344
	mov	edx, DWORD PTR _sql$[ebp]
	push	edx
	call	_dynbuf_add
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L73343
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29872], OFFSET FLAT:$SG73346
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 2271		; 000008dfH
	jmp	$eva_err$73204
$L73343:
	jmp	$eva_noerr$73643
$L73347:

; 2272 : 	case NotBegin:		PARSE_AND("NOT LIKE '", "%'", 1); break;

	mov	DWORD PTR _i$[ebp], 0
	jmp	SHORT $L73348
$L73349:
	mov	edx, DWORD PTR _i$[ebp]
	add	edx, 1
	mov	DWORD PTR _i$[ebp], edx
$L73348:
	cmp	DWORD PTR _i$[ebp], 0
	je	SHORT $L73351
	mov	eax, DWORD PTR _val$[ebp]
	mov	ecx, DWORD PTR _i$[ebp]
	cmp	ecx, DWORD PTR [eax]
	jae	$L73350
$L73351:
	cmp	DWORD PTR _i$[ebp], 0
	je	SHORT $L73354
	push	0
	push	0
	push	5
	push	OFFSET FLAT:$SG73355
	mov	edx, DWORD PTR _sql$[ebp]
	push	edx
	call	_dynbuf_add
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L73354
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29872], OFFSET FLAT:$SG73357
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 2272		; 000008e0H
	jmp	$eva_err$73204
$L73354:
	push	1
	push	2
	push	OFFSET FLAT:$SG73359
	push	0
	mov	edx, DWORD PTR _i$[ebp]
	push	edx
	mov	eax, DWORD PTR _val$[ebp]
	push	eax
	call	_dyntab_sz
	add	esp, 12					; 0000000cH
	push	eax
	push	0
	mov	ecx, DWORD PTR _i$[ebp]
	push	ecx
	mov	edx, DWORD PTR _val$[ebp]
	push	edx
	call	_dyntab_val
	add	esp, 12					; 0000000cH
	push	eax
	push	10					; 0000000aH
	push	OFFSET FLAT:$SG73360
	mov	eax, DWORD PTR _sz$[ebp]
	push	eax
	mov	ecx, DWORD PTR _tmember$[ebp]
	push	ecx
	mov	edx, DWORD PTR _sql$[ebp]
	push	edx
	mov	eax, DWORD PTR _cntxt$[ebp]
	push	eax
	call	_qry_build_compare
	add	esp, 44					; 0000002cH
	test	eax, eax
	je	SHORT $L73358
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 2272		; 000008e0H
	jmp	$eva_err$73204
$L73358:
	jmp	$L73349
$L73350:
	jmp	$eva_noerr$73643
$L73361:

; 2273 : 	case Begin:			PARSE_OR("LIKE '", "%'", 1); break;

	mov	edx, DWORD PTR _val$[ebp]
	cmp	DWORD PTR [edx], 1
	jbe	SHORT $L73364
	push	0
	push	0
	push	1
	push	OFFSET FLAT:$SG73365
	mov	eax, DWORD PTR _sql$[ebp]
	push	eax
	call	_dynbuf_add
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L73364
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29872], OFFSET FLAT:$SG73367
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 2273		; 000008e1H
	jmp	$eva_err$73204
$L73364:
	mov	DWORD PTR _i$[ebp], 0
	jmp	SHORT $L73368
$L73369:
	mov	eax, DWORD PTR _i$[ebp]
	add	eax, 1
	mov	DWORD PTR _i$[ebp], eax
$L73368:
	cmp	DWORD PTR _i$[ebp], 0
	je	SHORT $L73371
	mov	ecx, DWORD PTR _val$[ebp]
	mov	edx, DWORD PTR _i$[ebp]
	cmp	edx, DWORD PTR [ecx]
	jae	$L73370
$L73371:
	cmp	DWORD PTR _i$[ebp], 0
	je	SHORT $L73374
	push	0
	push	0
	push	4
	push	OFFSET FLAT:$SG73375
	mov	eax, DWORD PTR _sql$[ebp]
	push	eax
	call	_dynbuf_add
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L73374
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29872], OFFSET FLAT:$SG73377
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 2273		; 000008e1H
	jmp	$eva_err$73204
$L73374:
	push	1
	push	2
	push	OFFSET FLAT:$SG73379
	push	0
	mov	eax, DWORD PTR _i$[ebp]
	push	eax
	mov	ecx, DWORD PTR _val$[ebp]
	push	ecx
	call	_dyntab_sz
	add	esp, 12					; 0000000cH
	push	eax
	push	0
	mov	edx, DWORD PTR _i$[ebp]
	push	edx
	mov	eax, DWORD PTR _val$[ebp]
	push	eax
	call	_dyntab_val
	add	esp, 12					; 0000000cH
	push	eax
	push	6
	push	OFFSET FLAT:$SG73380
	mov	ecx, DWORD PTR _sz$[ebp]
	push	ecx
	mov	edx, DWORD PTR _tmember$[ebp]
	push	edx
	mov	eax, DWORD PTR _sql$[ebp]
	push	eax
	mov	ecx, DWORD PTR _cntxt$[ebp]
	push	ecx
	call	_qry_build_compare
	add	esp, 44					; 0000002cH
	test	eax, eax
	je	SHORT $L73378
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 2273		; 000008e1H
	jmp	$eva_err$73204
$L73378:
	jmp	$L73369
$L73370:
	mov	eax, DWORD PTR _val$[ebp]
	cmp	DWORD PTR [eax], 1
	jbe	SHORT $L73383
	push	0
	push	0
	push	1
	push	OFFSET FLAT:$SG73384
	mov	ecx, DWORD PTR _sql$[ebp]
	push	ecx
	call	_dynbuf_add
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L73383
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29872], OFFSET FLAT:$SG73386
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 2273		; 000008e1H
	jmp	$eva_err$73204
$L73383:
	jmp	$eva_noerr$73643
$L73387:

; 2274 : 	case NotLike:		PARSE_AND("NOT LIKE '", "'", 1); break;

	mov	DWORD PTR _i$[ebp], 0
	jmp	SHORT $L73388
$L73389:
	mov	ecx, DWORD PTR _i$[ebp]
	add	ecx, 1
	mov	DWORD PTR _i$[ebp], ecx
$L73388:
	cmp	DWORD PTR _i$[ebp], 0
	je	SHORT $L73391
	mov	edx, DWORD PTR _val$[ebp]
	mov	eax, DWORD PTR _i$[ebp]
	cmp	eax, DWORD PTR [edx]
	jae	$L73390
$L73391:
	cmp	DWORD PTR _i$[ebp], 0
	je	SHORT $L73394
	push	0
	push	0
	push	5
	push	OFFSET FLAT:$SG73395
	mov	ecx, DWORD PTR _sql$[ebp]
	push	ecx
	call	_dynbuf_add
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L73394
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29872], OFFSET FLAT:$SG73397
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 2274		; 000008e2H
	jmp	$eva_err$73204
$L73394:
	push	1
	push	1
	push	OFFSET FLAT:$SG73399
	push	0
	mov	ecx, DWORD PTR _i$[ebp]
	push	ecx
	mov	edx, DWORD PTR _val$[ebp]
	push	edx
	call	_dyntab_sz
	add	esp, 12					; 0000000cH
	push	eax
	push	0
	mov	eax, DWORD PTR _i$[ebp]
	push	eax
	mov	ecx, DWORD PTR _val$[ebp]
	push	ecx
	call	_dyntab_val
	add	esp, 12					; 0000000cH
	push	eax
	push	10					; 0000000aH
	push	OFFSET FLAT:$SG73400
	mov	edx, DWORD PTR _sz$[ebp]
	push	edx
	mov	eax, DWORD PTR _tmember$[ebp]
	push	eax
	mov	ecx, DWORD PTR _sql$[ebp]
	push	ecx
	mov	edx, DWORD PTR _cntxt$[ebp]
	push	edx
	call	_qry_build_compare
	add	esp, 44					; 0000002cH
	test	eax, eax
	je	SHORT $L73398
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 2274		; 000008e2H
	jmp	$eva_err$73204
$L73398:
	jmp	$L73389
$L73390:
	jmp	$eva_noerr$73643
$L73401:

; 2275 : 	case Like:			PARSE_OR("LIKE '", "'", 1); break;

	mov	ecx, DWORD PTR _val$[ebp]
	cmp	DWORD PTR [ecx], 1
	jbe	SHORT $L73404
	push	0
	push	0
	push	1
	push	OFFSET FLAT:$SG73405
	mov	edx, DWORD PTR _sql$[ebp]
	push	edx
	call	_dynbuf_add
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L73404
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29872], OFFSET FLAT:$SG73407
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 2275		; 000008e3H
	jmp	$eva_err$73204
$L73404:
	mov	DWORD PTR _i$[ebp], 0
	jmp	SHORT $L73408
$L73409:
	mov	edx, DWORD PTR _i$[ebp]
	add	edx, 1
	mov	DWORD PTR _i$[ebp], edx
$L73408:
	cmp	DWORD PTR _i$[ebp], 0
	je	SHORT $L73411
	mov	eax, DWORD PTR _val$[ebp]
	mov	ecx, DWORD PTR _i$[ebp]
	cmp	ecx, DWORD PTR [eax]
	jae	$L73410
$L73411:
	cmp	DWORD PTR _i$[ebp], 0
	je	SHORT $L73414
	push	0
	push	0
	push	4
	push	OFFSET FLAT:$SG73415
	mov	edx, DWORD PTR _sql$[ebp]
	push	edx
	call	_dynbuf_add
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L73414
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29872], OFFSET FLAT:$SG73417
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 2275		; 000008e3H
	jmp	$eva_err$73204
$L73414:
	push	1
	push	1
	push	OFFSET FLAT:$SG73419
	push	0
	mov	edx, DWORD PTR _i$[ebp]
	push	edx
	mov	eax, DWORD PTR _val$[ebp]
	push	eax
	call	_dyntab_sz
	add	esp, 12					; 0000000cH
	push	eax
	push	0
	mov	ecx, DWORD PTR _i$[ebp]
	push	ecx
	mov	edx, DWORD PTR _val$[ebp]
	push	edx
	call	_dyntab_val
	add	esp, 12					; 0000000cH
	push	eax
	push	6
	push	OFFSET FLAT:$SG73420
	mov	eax, DWORD PTR _sz$[ebp]
	push	eax
	mov	ecx, DWORD PTR _tmember$[ebp]
	push	ecx
	mov	edx, DWORD PTR _sql$[ebp]
	push	edx
	mov	eax, DWORD PTR _cntxt$[ebp]
	push	eax
	call	_qry_build_compare
	add	esp, 44					; 0000002cH
	test	eax, eax
	je	SHORT $L73418
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 2275		; 000008e3H
	jmp	$eva_err$73204
$L73418:
	jmp	$L73409
$L73410:
	mov	edx, DWORD PTR _val$[ebp]
	cmp	DWORD PTR [edx], 1
	jbe	SHORT $L73423
	push	0
	push	0
	push	1
	push	OFFSET FLAT:$SG73424
	mov	eax, DWORD PTR _sql$[ebp]
	push	eax
	call	_dynbuf_add
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L73423
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29872], OFFSET FLAT:$SG73426
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 2275		; 000008e3H
	jmp	$eva_err$73204
$L73423:
	jmp	$eva_noerr$73643
$L73427:

; 2276 : 	case Smaller:
; 2277 :     case SmallerEqual:
; 2278 : 	case Larger:
; 2279 : 	case LargerEqual:
; 2280 : 		if(mtyp == MatchNum && val->nbrows) switch(match)

	cmp	DWORD PTR _mtyp$[ebp], 3
	jne	$L73428
	mov	eax, DWORD PTR _val$[ebp]
	cmp	DWORD PTR [eax], 0
	je	$L73428

; 2281 : 		{

	mov	ecx, DWORD PTR _match$[ebp]
	mov	DWORD PTR -1104+[ebp], ecx
	mov	edx, DWORD PTR -1104+[ebp]
	sub	edx, 15					; 0000000fH
	mov	DWORD PTR -1104+[ebp], edx
	cmp	DWORD PTR -1104+[ebp], 3
	ja	$L73489
	mov	eax, DWORD PTR -1104+[ebp]
	jmp	DWORD PTR $L74515[eax*4]
$L73433:

; 2282 : 		case Smaller:		PARSE_AND("<", "", 0); break;

	mov	DWORD PTR _i$[ebp], 0
	jmp	SHORT $L73434
$L73435:
	mov	ecx, DWORD PTR _i$[ebp]
	add	ecx, 1
	mov	DWORD PTR _i$[ebp], ecx
$L73434:
	cmp	DWORD PTR _i$[ebp], 0
	je	SHORT $L73437
	mov	edx, DWORD PTR _val$[ebp]
	mov	eax, DWORD PTR _i$[ebp]
	cmp	eax, DWORD PTR [edx]
	jae	$L73436
$L73437:
	cmp	DWORD PTR _i$[ebp], 0
	je	SHORT $L73440
	push	0
	push	0
	push	5
	push	OFFSET FLAT:$SG73441
	mov	ecx, DWORD PTR _sql$[ebp]
	push	ecx
	call	_dynbuf_add
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L73440
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29872], OFFSET FLAT:$SG73443
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 2282		; 000008eaH
	jmp	$eva_err$73204
$L73440:
	push	0
	push	0
	push	OFFSET FLAT:$SG73445
	push	0
	mov	ecx, DWORD PTR _i$[ebp]
	push	ecx
	mov	edx, DWORD PTR _val$[ebp]
	push	edx
	call	_dyntab_sz
	add	esp, 12					; 0000000cH
	push	eax
	push	0
	mov	eax, DWORD PTR _i$[ebp]
	push	eax
	mov	ecx, DWORD PTR _val$[ebp]
	push	ecx
	call	_dyntab_val
	add	esp, 12					; 0000000cH
	push	eax
	push	1
	push	OFFSET FLAT:$SG73446
	mov	edx, DWORD PTR _sz$[ebp]
	push	edx
	mov	eax, DWORD PTR _tmember$[ebp]
	push	eax
	mov	ecx, DWORD PTR _sql$[ebp]
	push	ecx
	mov	edx, DWORD PTR _cntxt$[ebp]
	push	edx
	call	_qry_build_compare
	add	esp, 44					; 0000002cH
	test	eax, eax
	je	SHORT $L73444
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 2282		; 000008eaH
	jmp	$eva_err$73204
$L73444:
	jmp	$L73435
$L73436:
	jmp	$L73430
$L73447:

; 2283 : 		case SmallerEqual:	PARSE_AND("<=", "", 0); break;

	mov	DWORD PTR _i$[ebp], 0
	jmp	SHORT $L73448
$L73449:
	mov	ecx, DWORD PTR _i$[ebp]
	add	ecx, 1
	mov	DWORD PTR _i$[ebp], ecx
$L73448:
	cmp	DWORD PTR _i$[ebp], 0
	je	SHORT $L73451
	mov	edx, DWORD PTR _val$[ebp]
	mov	eax, DWORD PTR _i$[ebp]
	cmp	eax, DWORD PTR [edx]
	jae	$L73450
$L73451:
	cmp	DWORD PTR _i$[ebp], 0
	je	SHORT $L73454
	push	0
	push	0
	push	5
	push	OFFSET FLAT:$SG73455
	mov	ecx, DWORD PTR _sql$[ebp]
	push	ecx
	call	_dynbuf_add
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L73454
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29872], OFFSET FLAT:$SG73457
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 2283		; 000008ebH
	jmp	$eva_err$73204
$L73454:
	push	0
	push	0
	push	OFFSET FLAT:$SG73459
	push	0
	mov	ecx, DWORD PTR _i$[ebp]
	push	ecx
	mov	edx, DWORD PTR _val$[ebp]
	push	edx
	call	_dyntab_sz
	add	esp, 12					; 0000000cH
	push	eax
	push	0
	mov	eax, DWORD PTR _i$[ebp]
	push	eax
	mov	ecx, DWORD PTR _val$[ebp]
	push	ecx
	call	_dyntab_val
	add	esp, 12					; 0000000cH
	push	eax
	push	2
	push	OFFSET FLAT:$SG73460
	mov	edx, DWORD PTR _sz$[ebp]
	push	edx
	mov	eax, DWORD PTR _tmember$[ebp]
	push	eax
	mov	ecx, DWORD PTR _sql$[ebp]
	push	ecx
	mov	edx, DWORD PTR _cntxt$[ebp]
	push	edx
	call	_qry_build_compare
	add	esp, 44					; 0000002cH
	test	eax, eax
	je	SHORT $L73458
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 2283		; 000008ebH
	jmp	$eva_err$73204
$L73458:
	jmp	$L73449
$L73450:
	jmp	$L73430
$L73461:

; 2284 : 		case Larger:		PARSE_AND(">", "", 0); break;

	mov	DWORD PTR _i$[ebp], 0
	jmp	SHORT $L73462
$L73463:
	mov	ecx, DWORD PTR _i$[ebp]
	add	ecx, 1
	mov	DWORD PTR _i$[ebp], ecx
$L73462:
	cmp	DWORD PTR _i$[ebp], 0
	je	SHORT $L73465
	mov	edx, DWORD PTR _val$[ebp]
	mov	eax, DWORD PTR _i$[ebp]
	cmp	eax, DWORD PTR [edx]
	jae	$L73464
$L73465:
	cmp	DWORD PTR _i$[ebp], 0
	je	SHORT $L73468
	push	0
	push	0
	push	5
	push	OFFSET FLAT:$SG73469
	mov	ecx, DWORD PTR _sql$[ebp]
	push	ecx
	call	_dynbuf_add
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L73468
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29872], OFFSET FLAT:$SG73471
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 2284		; 000008ecH
	jmp	$eva_err$73204
$L73468:
	push	0
	push	0
	push	OFFSET FLAT:$SG73473
	push	0
	mov	ecx, DWORD PTR _i$[ebp]
	push	ecx
	mov	edx, DWORD PTR _val$[ebp]
	push	edx
	call	_dyntab_sz
	add	esp, 12					; 0000000cH
	push	eax
	push	0
	mov	eax, DWORD PTR _i$[ebp]
	push	eax
	mov	ecx, DWORD PTR _val$[ebp]
	push	ecx
	call	_dyntab_val
	add	esp, 12					; 0000000cH
	push	eax
	push	1
	push	OFFSET FLAT:$SG73474
	mov	edx, DWORD PTR _sz$[ebp]
	push	edx
	mov	eax, DWORD PTR _tmember$[ebp]
	push	eax
	mov	ecx, DWORD PTR _sql$[ebp]
	push	ecx
	mov	edx, DWORD PTR _cntxt$[ebp]
	push	edx
	call	_qry_build_compare
	add	esp, 44					; 0000002cH
	test	eax, eax
	je	SHORT $L73472
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 2284		; 000008ecH
	jmp	$eva_err$73204
$L73472:
	jmp	$L73463
$L73464:
	jmp	$L73430
$L73475:

; 2285 : 		case LargerEqual:	PARSE_AND(">=", "", 0); break;

	mov	DWORD PTR _i$[ebp], 0
	jmp	SHORT $L73476
$L73477:
	mov	ecx, DWORD PTR _i$[ebp]
	add	ecx, 1
	mov	DWORD PTR _i$[ebp], ecx
$L73476:
	cmp	DWORD PTR _i$[ebp], 0
	je	SHORT $L73479
	mov	edx, DWORD PTR _val$[ebp]
	mov	eax, DWORD PTR _i$[ebp]
	cmp	eax, DWORD PTR [edx]
	jae	$L73489
$L73479:
	cmp	DWORD PTR _i$[ebp], 0
	je	SHORT $L73482
	push	0
	push	0
	push	5
	push	OFFSET FLAT:$SG73483
	mov	ecx, DWORD PTR _sql$[ebp]
	push	ecx
	call	_dynbuf_add
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L73482
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29872], OFFSET FLAT:$SG73485
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 2285		; 000008edH
	jmp	$eva_err$73204
$L73482:
	push	0
	push	0
	push	OFFSET FLAT:$SG73487
	push	0
	mov	ecx, DWORD PTR _i$[ebp]
	push	ecx
	mov	edx, DWORD PTR _val$[ebp]
	push	edx
	call	_dyntab_sz
	add	esp, 12					; 0000000cH
	push	eax
	push	0
	mov	eax, DWORD PTR _i$[ebp]
	push	eax
	mov	ecx, DWORD PTR _val$[ebp]
	push	ecx
	call	_dyntab_val
	add	esp, 12					; 0000000cH
	push	eax
	push	2
	push	OFFSET FLAT:$SG73488
	mov	edx, DWORD PTR _sz$[ebp]
	push	edx
	mov	eax, DWORD PTR _tmember$[ebp]
	push	eax
	mov	ecx, DWORD PTR _sql$[ebp]
	push	ecx
	mov	edx, DWORD PTR _cntxt$[ebp]
	push	edx
	call	_qry_build_compare
	add	esp, 44					; 0000002cH
	test	eax, eax
	je	SHORT $L73486
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 2285		; 000008edH
	jmp	$eva_err$73204
$L73486:
	jmp	$L73477
$L73489:
$L73430:

; 2289 : 		else switch(match)

	jmp	$L73492
$L73428:

; 2290 : 		{

	mov	ecx, DWORD PTR _match$[ebp]
	mov	DWORD PTR -1108+[ebp], ecx
	mov	edx, DWORD PTR -1108+[ebp]
	sub	edx, 15					; 0000000fH
	mov	DWORD PTR -1108+[ebp], edx
	cmp	DWORD PTR -1108+[ebp], 3
	ja	$L73551
	mov	eax, DWORD PTR -1108+[ebp]
	jmp	DWORD PTR $L74516[eax*4]
$L73495:

; 2291 : 		case Smaller:		PARSE_AND("<'", "'", 2); break;

	mov	DWORD PTR _i$[ebp], 0
	jmp	SHORT $L73496
$L73497:
	mov	ecx, DWORD PTR _i$[ebp]
	add	ecx, 1
	mov	DWORD PTR _i$[ebp], ecx
$L73496:
	cmp	DWORD PTR _i$[ebp], 0
	je	SHORT $L73499
	mov	edx, DWORD PTR _val$[ebp]
	mov	eax, DWORD PTR _i$[ebp]
	cmp	eax, DWORD PTR [edx]
	jae	$L73498
$L73499:
	cmp	DWORD PTR _i$[ebp], 0
	je	SHORT $L73502
	push	0
	push	0
	push	5
	push	OFFSET FLAT:$SG73503
	mov	ecx, DWORD PTR _sql$[ebp]
	push	ecx
	call	_dynbuf_add
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L73502
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29872], OFFSET FLAT:$SG73505
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 2291		; 000008f3H
	jmp	$eva_err$73204
$L73502:
	push	2
	push	1
	push	OFFSET FLAT:$SG73507
	push	0
	mov	ecx, DWORD PTR _i$[ebp]
	push	ecx
	mov	edx, DWORD PTR _val$[ebp]
	push	edx
	call	_dyntab_sz
	add	esp, 12					; 0000000cH
	push	eax
	push	0
	mov	eax, DWORD PTR _i$[ebp]
	push	eax
	mov	ecx, DWORD PTR _val$[ebp]
	push	ecx
	call	_dyntab_val
	add	esp, 12					; 0000000cH
	push	eax
	push	2
	push	OFFSET FLAT:$SG73508
	mov	edx, DWORD PTR _sz$[ebp]
	push	edx
	mov	eax, DWORD PTR _tmember$[ebp]
	push	eax
	mov	ecx, DWORD PTR _sql$[ebp]
	push	ecx
	mov	edx, DWORD PTR _cntxt$[ebp]
	push	edx
	call	_qry_build_compare
	add	esp, 44					; 0000002cH
	test	eax, eax
	je	SHORT $L73506
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 2291		; 000008f3H
	jmp	$eva_err$73204
$L73506:
	jmp	$L73497
$L73498:
	jmp	$L73492
$L73509:

; 2292 : 		case SmallerEqual:	PARSE_AND("<='", "'", 2); break;

	mov	DWORD PTR _i$[ebp], 0
	jmp	SHORT $L73510
$L73511:
	mov	ecx, DWORD PTR _i$[ebp]
	add	ecx, 1
	mov	DWORD PTR _i$[ebp], ecx
$L73510:
	cmp	DWORD PTR _i$[ebp], 0
	je	SHORT $L73513
	mov	edx, DWORD PTR _val$[ebp]
	mov	eax, DWORD PTR _i$[ebp]
	cmp	eax, DWORD PTR [edx]
	jae	$L73512
$L73513:
	cmp	DWORD PTR _i$[ebp], 0
	je	SHORT $L73516
	push	0
	push	0
	push	5
	push	OFFSET FLAT:$SG73517
	mov	ecx, DWORD PTR _sql$[ebp]
	push	ecx
	call	_dynbuf_add
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L73516
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29872], OFFSET FLAT:$SG73519
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 2292		; 000008f4H
	jmp	$eva_err$73204
$L73516:
	push	2
	push	1
	push	OFFSET FLAT:$SG73521
	push	0
	mov	ecx, DWORD PTR _i$[ebp]
	push	ecx
	mov	edx, DWORD PTR _val$[ebp]
	push	edx
	call	_dyntab_sz
	add	esp, 12					; 0000000cH
	push	eax
	push	0
	mov	eax, DWORD PTR _i$[ebp]
	push	eax
	mov	ecx, DWORD PTR _val$[ebp]
	push	ecx
	call	_dyntab_val
	add	esp, 12					; 0000000cH
	push	eax
	push	3
	push	OFFSET FLAT:$SG73522
	mov	edx, DWORD PTR _sz$[ebp]
	push	edx
	mov	eax, DWORD PTR _tmember$[ebp]
	push	eax
	mov	ecx, DWORD PTR _sql$[ebp]
	push	ecx
	mov	edx, DWORD PTR _cntxt$[ebp]
	push	edx
	call	_qry_build_compare
	add	esp, 44					; 0000002cH
	test	eax, eax
	je	SHORT $L73520
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 2292		; 000008f4H
	jmp	$eva_err$73204
$L73520:
	jmp	$L73511
$L73512:
	jmp	$L73492
$L73523:

; 2293 : 		case Larger:		PARSE_AND(">'", "'", 2); break;

	mov	DWORD PTR _i$[ebp], 0
	jmp	SHORT $L73524
$L73525:
	mov	ecx, DWORD PTR _i$[ebp]
	add	ecx, 1
	mov	DWORD PTR _i$[ebp], ecx
$L73524:
	cmp	DWORD PTR _i$[ebp], 0
	je	SHORT $L73527
	mov	edx, DWORD PTR _val$[ebp]
	mov	eax, DWORD PTR _i$[ebp]
	cmp	eax, DWORD PTR [edx]
	jae	$L73526
$L73527:
	cmp	DWORD PTR _i$[ebp], 0
	je	SHORT $L73530
	push	0
	push	0
	push	5
	push	OFFSET FLAT:$SG73531
	mov	ecx, DWORD PTR _sql$[ebp]
	push	ecx
	call	_dynbuf_add
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L73530
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29872], OFFSET FLAT:$SG73533
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 2293		; 000008f5H
	jmp	$eva_err$73204
$L73530:
	push	2
	push	1
	push	OFFSET FLAT:$SG73535
	push	0
	mov	ecx, DWORD PTR _i$[ebp]
	push	ecx
	mov	edx, DWORD PTR _val$[ebp]
	push	edx
	call	_dyntab_sz
	add	esp, 12					; 0000000cH
	push	eax
	push	0
	mov	eax, DWORD PTR _i$[ebp]
	push	eax
	mov	ecx, DWORD PTR _val$[ebp]
	push	ecx
	call	_dyntab_val
	add	esp, 12					; 0000000cH
	push	eax
	push	2
	push	OFFSET FLAT:$SG73536
	mov	edx, DWORD PTR _sz$[ebp]
	push	edx
	mov	eax, DWORD PTR _tmember$[ebp]
	push	eax
	mov	ecx, DWORD PTR _sql$[ebp]
	push	ecx
	mov	edx, DWORD PTR _cntxt$[ebp]
	push	edx
	call	_qry_build_compare
	add	esp, 44					; 0000002cH
	test	eax, eax
	je	SHORT $L73534
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 2293		; 000008f5H
	jmp	$eva_err$73204
$L73534:
	jmp	$L73525
$L73526:
	jmp	$L73492
$L73537:

; 2294 : 		case LargerEqual:	PARSE_AND(">='", "'", 2); break;

	mov	DWORD PTR _i$[ebp], 0
	jmp	SHORT $L73538
$L73539:
	mov	ecx, DWORD PTR _i$[ebp]
	add	ecx, 1
	mov	DWORD PTR _i$[ebp], ecx
$L73538:
	cmp	DWORD PTR _i$[ebp], 0
	je	SHORT $L73541
	mov	edx, DWORD PTR _val$[ebp]
	mov	eax, DWORD PTR _i$[ebp]
	cmp	eax, DWORD PTR [edx]
	jae	$L73551
$L73541:
	cmp	DWORD PTR _i$[ebp], 0
	je	SHORT $L73544
	push	0
	push	0
	push	5
	push	OFFSET FLAT:$SG73545
	mov	ecx, DWORD PTR _sql$[ebp]
	push	ecx
	call	_dynbuf_add
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L73544
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29872], OFFSET FLAT:$SG73547
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 2294		; 000008f6H
	jmp	$eva_err$73204
$L73544:
	push	2
	push	1
	push	OFFSET FLAT:$SG73549
	push	0
	mov	ecx, DWORD PTR _i$[ebp]
	push	ecx
	mov	edx, DWORD PTR _val$[ebp]
	push	edx
	call	_dyntab_sz
	add	esp, 12					; 0000000cH
	push	eax
	push	0
	mov	eax, DWORD PTR _i$[ebp]
	push	eax
	mov	ecx, DWORD PTR _val$[ebp]
	push	ecx
	call	_dyntab_val
	add	esp, 12					; 0000000cH
	push	eax
	push	3
	push	OFFSET FLAT:$SG73550
	mov	edx, DWORD PTR _sz$[ebp]
	push	edx
	mov	eax, DWORD PTR _tmember$[ebp]
	push	eax
	mov	ecx, DWORD PTR _sql$[ebp]
	push	ecx
	mov	edx, DWORD PTR _cntxt$[ebp]
	push	edx
	call	_qry_build_compare
	add	esp, 44					; 0000002cH
	test	eax, eax
	je	SHORT $L73548
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 2294		; 000008f6H
	jmp	$eva_err$73204
$L73548:
	jmp	$L73539
$L73551:
$L73492:

; 2298 : 		break;

	jmp	$eva_noerr$73643
$L73552:

; 2299 : 
; 2300 : 	case NotInBound:
; 2301 : 		if(mtyp == MatchNum)

	cmp	DWORD PTR _mtyp$[ebp], 3
	jne	$L73553

; 2303 : 			if(dyntab_sz(val, 0, 0) && dyntab_sz(val, 1, 0))

	push	0
	push	0
	mov	ecx, DWORD PTR _val$[ebp]
	push	ecx
	call	_dyntab_sz
	add	esp, 12					; 0000000cH
	test	eax, eax
	je	$L73554
	push	0
	push	1
	mov	edx, DWORD PTR _val$[ebp]
	push	edx
	call	_dyntab_sz
	add	esp, 12					; 0000000cH
	test	eax, eax
	je	$L73554

; 2304 : 			{				PARSE("<", 0, " AND ", 0); PARSE(">=", 1, "", 0) }

	push	0
	push	5
	push	OFFSET FLAT:$SG73556
	push	0
	push	0
	mov	eax, DWORD PTR _val$[ebp]
	push	eax
	call	_dyntab_sz
	add	esp, 12					; 0000000cH
	push	eax
	push	0
	push	0
	mov	ecx, DWORD PTR _val$[ebp]
	push	ecx
	call	_dyntab_val
	add	esp, 12					; 0000000cH
	push	eax
	push	1
	push	OFFSET FLAT:$SG73557
	mov	edx, DWORD PTR _sz$[ebp]
	push	edx
	mov	eax, DWORD PTR _tmember$[ebp]
	push	eax
	mov	ecx, DWORD PTR _sql$[ebp]
	push	ecx
	mov	edx, DWORD PTR _cntxt$[ebp]
	push	edx
	call	_qry_build_compare
	add	esp, 44					; 0000002cH
	test	eax, eax
	je	SHORT $L73555
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 2304		; 00000900H
	jmp	$eva_err$73204
$L73555:
	push	0
	push	0
	push	OFFSET FLAT:$SG73559
	push	0
	push	1
	mov	ecx, DWORD PTR _val$[ebp]
	push	ecx
	call	_dyntab_sz
	add	esp, 12					; 0000000cH
	push	eax
	push	0
	push	1
	mov	edx, DWORD PTR _val$[ebp]
	push	edx
	call	_dyntab_val
	add	esp, 12					; 0000000cH
	push	eax
	push	2
	push	OFFSET FLAT:$SG73560
	mov	eax, DWORD PTR _sz$[ebp]
	push	eax
	mov	ecx, DWORD PTR _tmember$[ebp]
	push	ecx
	mov	edx, DWORD PTR _sql$[ebp]
	push	edx
	mov	eax, DWORD PTR _cntxt$[ebp]
	push	eax
	call	_qry_build_compare
	add	esp, 44					; 0000002cH
	test	eax, eax
	je	SHORT $L73558
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 2304		; 00000900H
	jmp	$eva_err$73204
$L73558:

; 2305 : 			else if(dyntab_sz(val, 0, 0))

	jmp	$L73572
$L73554:
	push	0
	push	0
	mov	edx, DWORD PTR _val$[ebp]
	push	edx
	call	_dyntab_sz
	add	esp, 12					; 0000000cH
	test	eax, eax
	je	SHORT $L73562

; 2306 : 			{				PARSE("<", 0, "", 0); }

	push	0
	push	0
	push	OFFSET FLAT:$SG73564
	push	0
	push	0
	mov	eax, DWORD PTR _val$[ebp]
	push	eax
	call	_dyntab_sz
	add	esp, 12					; 0000000cH
	push	eax
	push	0
	push	0
	mov	ecx, DWORD PTR _val$[ebp]
	push	ecx
	call	_dyntab_val
	add	esp, 12					; 0000000cH
	push	eax
	push	1
	push	OFFSET FLAT:$SG73565
	mov	edx, DWORD PTR _sz$[ebp]
	push	edx
	mov	eax, DWORD PTR _tmember$[ebp]
	push	eax
	mov	ecx, DWORD PTR _sql$[ebp]
	push	ecx
	mov	edx, DWORD PTR _cntxt$[ebp]
	push	edx
	call	_qry_build_compare
	add	esp, 44					; 0000002cH
	test	eax, eax
	je	SHORT $L73563
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 2306		; 00000902H
	jmp	$eva_err$73204
$L73563:

; 2307 : 			else if(dyntab_sz(val, 1, 0))

	jmp	$L73572
$L73562:
	push	0
	push	1
	mov	ecx, DWORD PTR _val$[ebp]
	push	ecx
	call	_dyntab_sz
	add	esp, 12					; 0000000cH
	test	eax, eax
	je	SHORT $L73567

; 2308 : 			{				PARSE("<", 1, "", 0); }

	push	0
	push	0
	push	OFFSET FLAT:$SG73569
	push	0
	push	1
	mov	edx, DWORD PTR _val$[ebp]
	push	edx
	call	_dyntab_sz
	add	esp, 12					; 0000000cH
	push	eax
	push	0
	push	1
	mov	eax, DWORD PTR _val$[ebp]
	push	eax
	call	_dyntab_val
	add	esp, 12					; 0000000cH
	push	eax
	push	1
	push	OFFSET FLAT:$SG73570
	mov	ecx, DWORD PTR _sz$[ebp]
	push	ecx
	mov	edx, DWORD PTR _tmember$[ebp]
	push	edx
	mov	eax, DWORD PTR _sql$[ebp]
	push	eax
	mov	ecx, DWORD PTR _cntxt$[ebp]
	push	ecx
	call	_qry_build_compare
	add	esp, 44					; 0000002cH
	test	eax, eax
	je	SHORT $L73568
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 2308		; 00000904H
	jmp	$eva_err$73204
$L73568:

; 2309 : 			else

	jmp	SHORT $L73572
$L73567:

; 2310 : 			{				PARSE("<>'", 0, "'", 2); }

	push	2
	push	1
	push	OFFSET FLAT:$SG73573
	push	0
	push	0
	mov	eax, DWORD PTR _val$[ebp]
	push	eax
	call	_dyntab_sz
	add	esp, 12					; 0000000cH
	push	eax
	push	0
	push	0
	mov	ecx, DWORD PTR _val$[ebp]
	push	ecx
	call	_dyntab_val
	add	esp, 12					; 0000000cH
	push	eax
	push	3
	push	OFFSET FLAT:$SG73574
	mov	edx, DWORD PTR _sz$[ebp]
	push	edx
	mov	eax, DWORD PTR _tmember$[ebp]
	push	eax
	mov	ecx, DWORD PTR _sql$[ebp]
	push	ecx
	mov	edx, DWORD PTR _cntxt$[ebp]
	push	edx
	call	_qry_build_compare
	add	esp, 44					; 0000002cH
	test	eax, eax
	je	SHORT $L73572
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 2310		; 00000906H
	jmp	$eva_err$73204
$L73572:

; 2312 : 		else

	jmp	$L73594
$L73553:

; 2314 : 			if(dyntab_sz(val, 0, 0) && dyntab_sz(val, 1, 0))

	push	0
	push	0
	mov	ecx, DWORD PTR _val$[ebp]
	push	ecx
	call	_dyntab_sz
	add	esp, 12					; 0000000cH
	test	eax, eax
	je	$L73576
	push	0
	push	1
	mov	edx, DWORD PTR _val$[ebp]
	push	edx
	call	_dyntab_sz
	add	esp, 12					; 0000000cH
	test	eax, eax
	je	$L73576

; 2315 : 			{				PARSE("<'", 0, "' AND ", 2); PARSE(">='", 1, "'", 2) }

	push	2
	push	6
	push	OFFSET FLAT:$SG73578
	push	0
	push	0
	mov	eax, DWORD PTR _val$[ebp]
	push	eax
	call	_dyntab_sz
	add	esp, 12					; 0000000cH
	push	eax
	push	0
	push	0
	mov	ecx, DWORD PTR _val$[ebp]
	push	ecx
	call	_dyntab_val
	add	esp, 12					; 0000000cH
	push	eax
	push	2
	push	OFFSET FLAT:$SG73579
	mov	edx, DWORD PTR _sz$[ebp]
	push	edx
	mov	eax, DWORD PTR _tmember$[ebp]
	push	eax
	mov	ecx, DWORD PTR _sql$[ebp]
	push	ecx
	mov	edx, DWORD PTR _cntxt$[ebp]
	push	edx
	call	_qry_build_compare
	add	esp, 44					; 0000002cH
	test	eax, eax
	je	SHORT $L73577
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 2315		; 0000090bH
	jmp	$eva_err$73204
$L73577:
	push	2
	push	1
	push	OFFSET FLAT:$SG73581
	push	0
	push	1
	mov	ecx, DWORD PTR _val$[ebp]
	push	ecx
	call	_dyntab_sz
	add	esp, 12					; 0000000cH
	push	eax
	push	0
	push	1
	mov	edx, DWORD PTR _val$[ebp]
	push	edx
	call	_dyntab_val
	add	esp, 12					; 0000000cH
	push	eax
	push	3
	push	OFFSET FLAT:$SG73582
	mov	eax, DWORD PTR _sz$[ebp]
	push	eax
	mov	ecx, DWORD PTR _tmember$[ebp]
	push	ecx
	mov	edx, DWORD PTR _sql$[ebp]
	push	edx
	mov	eax, DWORD PTR _cntxt$[ebp]
	push	eax
	call	_qry_build_compare
	add	esp, 44					; 0000002cH
	test	eax, eax
	je	SHORT $L73580
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 2315		; 0000090bH
	jmp	$eva_err$73204
$L73580:

; 2316 : 			else if(dyntab_sz(val, 0, 0))

	jmp	$L73594
$L73576:
	push	0
	push	0
	mov	edx, DWORD PTR _val$[ebp]
	push	edx
	call	_dyntab_sz
	add	esp, 12					; 0000000cH
	test	eax, eax
	je	SHORT $L73584

; 2317 : 			{				PARSE("<'", 0, "'", 2); }

	push	2
	push	1
	push	OFFSET FLAT:$SG73586
	push	0
	push	0
	mov	eax, DWORD PTR _val$[ebp]
	push	eax
	call	_dyntab_sz
	add	esp, 12					; 0000000cH
	push	eax
	push	0
	push	0
	mov	ecx, DWORD PTR _val$[ebp]
	push	ecx
	call	_dyntab_val
	add	esp, 12					; 0000000cH
	push	eax
	push	2
	push	OFFSET FLAT:$SG73587
	mov	edx, DWORD PTR _sz$[ebp]
	push	edx
	mov	eax, DWORD PTR _tmember$[ebp]
	push	eax
	mov	ecx, DWORD PTR _sql$[ebp]
	push	ecx
	mov	edx, DWORD PTR _cntxt$[ebp]
	push	edx
	call	_qry_build_compare
	add	esp, 44					; 0000002cH
	test	eax, eax
	je	SHORT $L73585
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 2317		; 0000090dH
	jmp	$eva_err$73204
$L73585:

; 2318 : 			else if(dyntab_sz(val, 1, 0))

	jmp	$L73594
$L73584:
	push	0
	push	1
	mov	ecx, DWORD PTR _val$[ebp]
	push	ecx
	call	_dyntab_sz
	add	esp, 12					; 0000000cH
	test	eax, eax
	je	SHORT $L73589

; 2319 : 			{				PARSE("<'", 1, "'", 2); }

	push	2
	push	1
	push	OFFSET FLAT:$SG73591
	push	0
	push	1
	mov	edx, DWORD PTR _val$[ebp]
	push	edx
	call	_dyntab_sz
	add	esp, 12					; 0000000cH
	push	eax
	push	0
	push	1
	mov	eax, DWORD PTR _val$[ebp]
	push	eax
	call	_dyntab_val
	add	esp, 12					; 0000000cH
	push	eax
	push	2
	push	OFFSET FLAT:$SG73592
	mov	ecx, DWORD PTR _sz$[ebp]
	push	ecx
	mov	edx, DWORD PTR _tmember$[ebp]
	push	edx
	mov	eax, DWORD PTR _sql$[ebp]
	push	eax
	mov	ecx, DWORD PTR _cntxt$[ebp]
	push	ecx
	call	_qry_build_compare
	add	esp, 44					; 0000002cH
	test	eax, eax
	je	SHORT $L73590
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 2319		; 0000090fH
	jmp	$eva_err$73204
$L73590:

; 2320 : 			else

	jmp	SHORT $L73594
$L73589:

; 2321 : 			{				PARSE("<>'", 0, "'", 2); }

	push	2
	push	1
	push	OFFSET FLAT:$SG73595
	push	0
	push	0
	mov	eax, DWORD PTR _val$[ebp]
	push	eax
	call	_dyntab_sz
	add	esp, 12					; 0000000cH
	push	eax
	push	0
	push	0
	mov	ecx, DWORD PTR _val$[ebp]
	push	ecx
	call	_dyntab_val
	add	esp, 12					; 0000000cH
	push	eax
	push	3
	push	OFFSET FLAT:$SG73596
	mov	edx, DWORD PTR _sz$[ebp]
	push	edx
	mov	eax, DWORD PTR _tmember$[ebp]
	push	eax
	mov	ecx, DWORD PTR _sql$[ebp]
	push	ecx
	mov	edx, DWORD PTR _cntxt$[ebp]
	push	edx
	call	_qry_build_compare
	add	esp, 44					; 0000002cH
	test	eax, eax
	je	SHORT $L73594
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 2321		; 00000911H
	jmp	$eva_err$73204
$L73594:

; 2323 : 		break;

	jmp	$eva_noerr$73643
$L73597:

; 2324 : 
; 2325 : 	case InBound:
; 2326 : 		if(mtyp == MatchNum)

	cmp	DWORD PTR _mtyp$[ebp], 3
	jne	$L73598

; 2328 : 			if(dyntab_sz(val, 0, 0) && dyntab_sz(val, 1, 0))

	push	0
	push	0
	mov	ecx, DWORD PTR _val$[ebp]
	push	ecx
	call	_dyntab_sz
	add	esp, 12					; 0000000cH
	test	eax, eax
	je	$L73599
	push	0
	push	1
	mov	edx, DWORD PTR _val$[ebp]
	push	edx
	call	_dyntab_sz
	add	esp, 12					; 0000000cH
	test	eax, eax
	je	$L73599

; 2329 : 			{				PARSE(">=", 0, " AND ", 0); PARSE("<", 1, "", 0) }

	push	0
	push	5
	push	OFFSET FLAT:$SG73601
	push	0
	push	0
	mov	eax, DWORD PTR _val$[ebp]
	push	eax
	call	_dyntab_sz
	add	esp, 12					; 0000000cH
	push	eax
	push	0
	push	0
	mov	ecx, DWORD PTR _val$[ebp]
	push	ecx
	call	_dyntab_val
	add	esp, 12					; 0000000cH
	push	eax
	push	2
	push	OFFSET FLAT:$SG73602
	mov	edx, DWORD PTR _sz$[ebp]
	push	edx
	mov	eax, DWORD PTR _tmember$[ebp]
	push	eax
	mov	ecx, DWORD PTR _sql$[ebp]
	push	ecx
	mov	edx, DWORD PTR _cntxt$[ebp]
	push	edx
	call	_qry_build_compare
	add	esp, 44					; 0000002cH
	test	eax, eax
	je	SHORT $L73600
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 2329		; 00000919H
	jmp	$eva_err$73204
$L73600:
	push	0
	push	0
	push	OFFSET FLAT:$SG73604
	push	0
	push	1
	mov	ecx, DWORD PTR _val$[ebp]
	push	ecx
	call	_dyntab_sz
	add	esp, 12					; 0000000cH
	push	eax
	push	0
	push	1
	mov	edx, DWORD PTR _val$[ebp]
	push	edx
	call	_dyntab_val
	add	esp, 12					; 0000000cH
	push	eax
	push	1
	push	OFFSET FLAT:$SG73605
	mov	eax, DWORD PTR _sz$[ebp]
	push	eax
	mov	ecx, DWORD PTR _tmember$[ebp]
	push	ecx
	mov	edx, DWORD PTR _sql$[ebp]
	push	edx
	mov	eax, DWORD PTR _cntxt$[ebp]
	push	eax
	call	_qry_build_compare
	add	esp, 44					; 0000002cH
	test	eax, eax
	je	SHORT $L73603
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 2329		; 00000919H
	jmp	$eva_err$73204
$L73603:

; 2330 : 			else if(dyntab_sz(val, 0, 0))

	jmp	$L73617
$L73599:
	push	0
	push	0
	mov	edx, DWORD PTR _val$[ebp]
	push	edx
	call	_dyntab_sz
	add	esp, 12					; 0000000cH
	test	eax, eax
	je	SHORT $L73607

; 2331 : 			{				PARSE(">=", 0, "", 0); }

	push	0
	push	0
	push	OFFSET FLAT:$SG73609
	push	0
	push	0
	mov	eax, DWORD PTR _val$[ebp]
	push	eax
	call	_dyntab_sz
	add	esp, 12					; 0000000cH
	push	eax
	push	0
	push	0
	mov	ecx, DWORD PTR _val$[ebp]
	push	ecx
	call	_dyntab_val
	add	esp, 12					; 0000000cH
	push	eax
	push	2
	push	OFFSET FLAT:$SG73610
	mov	edx, DWORD PTR _sz$[ebp]
	push	edx
	mov	eax, DWORD PTR _tmember$[ebp]
	push	eax
	mov	ecx, DWORD PTR _sql$[ebp]
	push	ecx
	mov	edx, DWORD PTR _cntxt$[ebp]
	push	edx
	call	_qry_build_compare
	add	esp, 44					; 0000002cH
	test	eax, eax
	je	SHORT $L73608
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 2331		; 0000091bH
	jmp	$eva_err$73204
$L73608:

; 2332 : 			else if(dyntab_sz(val, 1, 0))

	jmp	$L73617
$L73607:
	push	0
	push	1
	mov	ecx, DWORD PTR _val$[ebp]
	push	ecx
	call	_dyntab_sz
	add	esp, 12					; 0000000cH
	test	eax, eax
	je	SHORT $L73612

; 2333 : 			{				PARSE("<", 1, "", 0); }

	push	0
	push	0
	push	OFFSET FLAT:$SG73614
	push	0
	push	1
	mov	edx, DWORD PTR _val$[ebp]
	push	edx
	call	_dyntab_sz
	add	esp, 12					; 0000000cH
	push	eax
	push	0
	push	1
	mov	eax, DWORD PTR _val$[ebp]
	push	eax
	call	_dyntab_val
	add	esp, 12					; 0000000cH
	push	eax
	push	1
	push	OFFSET FLAT:$SG73615
	mov	ecx, DWORD PTR _sz$[ebp]
	push	ecx
	mov	edx, DWORD PTR _tmember$[ebp]
	push	edx
	mov	eax, DWORD PTR _sql$[ebp]
	push	eax
	mov	ecx, DWORD PTR _cntxt$[ebp]
	push	ecx
	call	_qry_build_compare
	add	esp, 44					; 0000002cH
	test	eax, eax
	je	SHORT $L73613
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 2333		; 0000091dH
	jmp	$eva_err$73204
$L73613:

; 2334 : 			else

	jmp	SHORT $L73617
$L73612:

; 2335 : 			{				PARSE("<>'", 0, "'", 2); }

	push	2
	push	1
	push	OFFSET FLAT:$SG73618
	push	0
	push	0
	mov	eax, DWORD PTR _val$[ebp]
	push	eax
	call	_dyntab_sz
	add	esp, 12					; 0000000cH
	push	eax
	push	0
	push	0
	mov	ecx, DWORD PTR _val$[ebp]
	push	ecx
	call	_dyntab_val
	add	esp, 12					; 0000000cH
	push	eax
	push	3
	push	OFFSET FLAT:$SG73619
	mov	edx, DWORD PTR _sz$[ebp]
	push	edx
	mov	eax, DWORD PTR _tmember$[ebp]
	push	eax
	mov	ecx, DWORD PTR _sql$[ebp]
	push	ecx
	mov	edx, DWORD PTR _cntxt$[ebp]
	push	edx
	call	_qry_build_compare
	add	esp, 44					; 0000002cH
	test	eax, eax
	je	SHORT $L73617
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 2335		; 0000091fH
	jmp	$eva_err$73204
$L73617:

; 2337 : 		else

	jmp	$L73639
$L73598:

; 2339 : 			if(dyntab_sz(val, 0, 0) && dyntab_sz(val, 1, 0))

	push	0
	push	0
	mov	ecx, DWORD PTR _val$[ebp]
	push	ecx
	call	_dyntab_sz
	add	esp, 12					; 0000000cH
	test	eax, eax
	je	$L73621
	push	0
	push	1
	mov	edx, DWORD PTR _val$[ebp]
	push	edx
	call	_dyntab_sz
	add	esp, 12					; 0000000cH
	test	eax, eax
	je	$L73621

; 2340 : 			{				PARSE(">='", 0, "' AND ", 2); PARSE("<'", 1, "'", 2) }

	push	2
	push	6
	push	OFFSET FLAT:$SG73623
	push	0
	push	0
	mov	eax, DWORD PTR _val$[ebp]
	push	eax
	call	_dyntab_sz
	add	esp, 12					; 0000000cH
	push	eax
	push	0
	push	0
	mov	ecx, DWORD PTR _val$[ebp]
	push	ecx
	call	_dyntab_val
	add	esp, 12					; 0000000cH
	push	eax
	push	3
	push	OFFSET FLAT:$SG73624
	mov	edx, DWORD PTR _sz$[ebp]
	push	edx
	mov	eax, DWORD PTR _tmember$[ebp]
	push	eax
	mov	ecx, DWORD PTR _sql$[ebp]
	push	ecx
	mov	edx, DWORD PTR _cntxt$[ebp]
	push	edx
	call	_qry_build_compare
	add	esp, 44					; 0000002cH
	test	eax, eax
	je	SHORT $L73622
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 2340		; 00000924H
	jmp	$eva_err$73204
$L73622:
	push	2
	push	1
	push	OFFSET FLAT:$SG73626
	push	0
	push	1
	mov	ecx, DWORD PTR _val$[ebp]
	push	ecx
	call	_dyntab_sz
	add	esp, 12					; 0000000cH
	push	eax
	push	0
	push	1
	mov	edx, DWORD PTR _val$[ebp]
	push	edx
	call	_dyntab_val
	add	esp, 12					; 0000000cH
	push	eax
	push	2
	push	OFFSET FLAT:$SG73627
	mov	eax, DWORD PTR _sz$[ebp]
	push	eax
	mov	ecx, DWORD PTR _tmember$[ebp]
	push	ecx
	mov	edx, DWORD PTR _sql$[ebp]
	push	edx
	mov	eax, DWORD PTR _cntxt$[ebp]
	push	eax
	call	_qry_build_compare
	add	esp, 44					; 0000002cH
	test	eax, eax
	je	SHORT $L73625
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 2340		; 00000924H
	jmp	$eva_err$73204
$L73625:

; 2341 : 			else if(dyntab_sz(val, 0, 0))

	jmp	$L73639
$L73621:
	push	0
	push	0
	mov	edx, DWORD PTR _val$[ebp]
	push	edx
	call	_dyntab_sz
	add	esp, 12					; 0000000cH
	test	eax, eax
	je	SHORT $L73629

; 2342 : 			{				PARSE(">='", 0, "'", 2); }

	push	2
	push	1
	push	OFFSET FLAT:$SG73631
	push	0
	push	0
	mov	eax, DWORD PTR _val$[ebp]
	push	eax
	call	_dyntab_sz
	add	esp, 12					; 0000000cH
	push	eax
	push	0
	push	0
	mov	ecx, DWORD PTR _val$[ebp]
	push	ecx
	call	_dyntab_val
	add	esp, 12					; 0000000cH
	push	eax
	push	3
	push	OFFSET FLAT:$SG73632
	mov	edx, DWORD PTR _sz$[ebp]
	push	edx
	mov	eax, DWORD PTR _tmember$[ebp]
	push	eax
	mov	ecx, DWORD PTR _sql$[ebp]
	push	ecx
	mov	edx, DWORD PTR _cntxt$[ebp]
	push	edx
	call	_qry_build_compare
	add	esp, 44					; 0000002cH
	test	eax, eax
	je	SHORT $L73630
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 2342		; 00000926H
	jmp	$eva_err$73204
$L73630:

; 2343 : 			else if(dyntab_sz(val, 1, 0))

	jmp	$L73639
$L73629:
	push	0
	push	1
	mov	ecx, DWORD PTR _val$[ebp]
	push	ecx
	call	_dyntab_sz
	add	esp, 12					; 0000000cH
	test	eax, eax
	je	SHORT $L73634

; 2344 : 			{				PARSE("<'", 1, "'", 2); }

	push	2
	push	1
	push	OFFSET FLAT:$SG73636
	push	0
	push	1
	mov	edx, DWORD PTR _val$[ebp]
	push	edx
	call	_dyntab_sz
	add	esp, 12					; 0000000cH
	push	eax
	push	0
	push	1
	mov	eax, DWORD PTR _val$[ebp]
	push	eax
	call	_dyntab_val
	add	esp, 12					; 0000000cH
	push	eax
	push	2
	push	OFFSET FLAT:$SG73637
	mov	ecx, DWORD PTR _sz$[ebp]
	push	ecx
	mov	edx, DWORD PTR _tmember$[ebp]
	push	edx
	mov	eax, DWORD PTR _sql$[ebp]
	push	eax
	mov	ecx, DWORD PTR _cntxt$[ebp]
	push	ecx
	call	_qry_build_compare
	add	esp, 44					; 0000002cH
	test	eax, eax
	je	SHORT $L73635
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 2344		; 00000928H
	jmp	SHORT $eva_err$73204
$L73635:

; 2345 : 			else

	jmp	SHORT $L73639
$L73634:

; 2346 : 			{				PARSE("<>'", 0, "'", 2); }

	push	2
	push	1
	push	OFFSET FLAT:$SG73640
	push	0
	push	0
	mov	eax, DWORD PTR _val$[ebp]
	push	eax
	call	_dyntab_sz
	add	esp, 12					; 0000000cH
	push	eax
	push	0
	push	0
	mov	ecx, DWORD PTR _val$[ebp]
	push	ecx
	call	_dyntab_val
	add	esp, 12					; 0000000cH
	push	eax
	push	3
	push	OFFSET FLAT:$SG73641
	mov	edx, DWORD PTR _sz$[ebp]
	push	edx
	mov	eax, DWORD PTR _tmember$[ebp]
	push	eax
	mov	ecx, DWORD PTR _sql$[ebp]
	push	ecx
	mov	edx, DWORD PTR _cntxt$[ebp]
	push	edx
	call	_qry_build_compare
	add	esp, 44					; 0000002cH
	test	eax, eax
	je	SHORT $L73639
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 2346		; 0000092aH
	jmp	SHORT $eva_err$73204
$L73639:
$L73642:
$eva_noerr$73643:

; 2353 : #undef PARSE
; 2354 : #undef PARSE_LOOP
; 2355 : #undef PARSE_NUM
; 2356 : #undef PARSE_AND
; 2357 : #undef PARSE_OR
; 2358 : 
; 2359 : 	RETURN_OK_CLEANUP;

	push	0
	push	OFFSET FLAT:$SG73644
	push	OFFSET FLAT:$SG73645
	mov	ecx, DWORD PTR _cntxt$[ebp]
	push	ecx
	call	_err_clear
	add	esp, 16					; 00000010H
$eva_err$73204:
	mov	edx, DWORD PTR _cntxt$[ebp]
	cmp	DWORD PTR [edx+29872], 0
	je	SHORT $L73646
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	ecx, DWORD PTR [eax+29900]
	push	ecx
	push	OFFSET FLAT:$SG73647
	push	OFFSET FLAT:$SG73648
	mov	edx, DWORD PTR _cntxt$[ebp]
	push	edx
	call	_err_add_context
	add	esp, 16					; 00000010H
$L73646:
	lea	eax, DWORD PTR _data$[ebp]
	push	eax
	call	_dyntab_free
	add	esp, 4
	mov	ecx, DWORD PTR _listval$[ebp]
	push	ecx
	call	_mem_free
	add	esp, 4
	mov	DWORD PTR _listval$[ebp], 0
	mov	edx, DWORD PTR _cntxt$[ebp]
	xor	eax, eax
	cmp	DWORD PTR [edx+29872], 0
	setne	al
$L73166:

; 2360 : }

	mov	esp, ebp
	pop	ebp
	ret	0
$L74513:
	DD	$L73192
	DD	$L73193
	DD	$L73194
	DD	$L73194
	DD	$L73193
	DD	$L73191
	DD	$L73193
	DD	$L73189
	DD	$L73193
	DD	$L73190
$L74514:
	DD	$L73254
	DD	$L73241
	DD	$L73254
	DD	$L73241
	DD	$L73267
	DD	$L73281
	DD	$L73254
	DD	$L73241
	DD	$L73401
	DD	$L73387
	DD	$L73321
	DD	$L73307
	DD	$L73361
	DD	$L73347
	DD	$L73427
	DD	$L73427
	DD	$L73427
	DD	$L73427
	DD	$L73597
	DD	$L73552
$L74515:
	DD	$L73461
	DD	$L73475
	DD	$L73433
	DD	$L73447
$L74516:
	DD	$L73523
	DD	$L73537
	DD	$L73495
	DD	$L73509
_qry_parse_matchmode ENDP
_TEXT	ENDS
_DATA	SEGMENT
$SG73685 DB	'IdObj', 00H
	ORG $+2
$SG73686 DB	'IdObj', 00H
	ORG $+2
$SG73689 DB	'IdRelObj', 00H
	ORG $+3
$SG73690 DB	'IdRelObj', 00H
	ORG $+3
$SG73693 DB	'IdObj', 00H
	ORG $+2
$SG73694 DB	'IdRelObj', 00H
	ORG $+3
$SG73696 DB	'IdRelObj', 00H
	ORG $+3
$SG73697 DB	'IdObj', 00H
	ORG $+2
$SG73707 DB	'IdWhoCr', 00H
$SG73709 DB	'IdWhoDel', 00H
	ORG $+3
$SG73713 DB	'Invalid relation field modifier', 00H
$SG73717 DB	'INNER JOIN TLink AS TLink%lu ON TLink%lu.%s=TLink%lu.%s', 0aH
	DB	00H
	ORG $+3
$SG73719 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG73724 DB	' AND ', 00H
	ORG $+2
$SG73726 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG73728 DB	'.IdField IN(', 00H
	ORG $+3
$SG73729 DB	'TLink', 00H
	ORG $+2
$SG73731 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG73736 DB	')', 00H
	ORG $+2
$SG73738 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG73743 DB	' AND ', 00H
	ORG $+2
$SG73745 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG73748 DB	'.IdRelObj IN(', 00H
	ORG $+2
$SG73749 DB	'TLink', 00H
	ORG $+2
$SG73751 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG73754 DB	'.IdObj IN(', 00H
	ORG $+1
$SG73755 DB	'TLink', 00H
	ORG $+2
$SG73757 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG73761 DB	')', 00H
	ORG $+2
$SG73763 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG73780 DB	' AND ', 00H
	ORG $+2
$SG73782 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG73784 DB	'DateCr', 00H
	ORG $+1
$SG73795 DB	' AND ', 00H
	ORG $+2
$SG73797 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG73799 DB	'DateDel', 00H
$SG73810 DB	' AND ', 00H
	ORG $+2
$SG73812 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG73814 DB	'IdWhoCr', 00H
$SG73825 DB	' AND ', 00H
	ORG $+2
$SG73827 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG73829 DB	'IdWhoDel', 00H
	ORG $+3
$SG73840 DB	' AND ', 00H
	ORG $+2
$SG73842 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG73844 DB	'IdRelObj', 00H
	ORG $+3
$SG73849 DB	' AND ', 00H
	ORG $+2
$SG73851 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG73853 DB	'IdObj', 00H
	ORG $+2
$SG73864 DB	' AND ', 00H
	ORG $+2
$SG73866 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG73868 DB	'IdRelObj', 00H
	ORG $+3
$SG73879 DB	' AND ', 00H
	ORG $+2
$SG73881 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG73883 DB	'IdValue', 00H
$SG73888 DB	' AND ', 00H
	ORG $+2
$SG73890 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG73892 DB	'TxtValue', 00H
	ORG $+3
$SG73903 DB	' AND ', 00H
	ORG $+2
$SG73905 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG73907 DB	'IdObj', 00H
	ORG $+2
$SG73912 DB	' AND ', 00H
	ORG $+2
$SG73914 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG73916 DB	'IdRelObj', 00H
	ORG $+3
$SG73921 DB	' AND ', 00H
	ORG $+2
$SG73923 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG73925 DB	'IdValue', 00H
$SG73930 DB	' AND ', 00H
	ORG $+2
$SG73932 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG73934 DB	'TxtValue', 00H
	ORG $+3
$SG73938 DB	'Invalid match mode for the modifier', 00H
$SG73945 DB	0aH, 'AND ', 00H
	ORG $+2
$SG73947 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG73955 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG73958 DB	'Pkey', 00H
	ORG $+3
$SG73959 DB	'IdObj', 00H
	ORG $+2
$SG73960 DB	'IdField', 00H
$SG73961 DB	'IdValue', 00H
$SG73962 DB	'IdRelObj', 00H
	ORG $+3
$SG73963 DB	'Num', 00H
$SG73964 DB	'Line', 00H
	ORG $+3
$SG73965 DB	'Lang', 00H
	ORG $+3
$SG73966 DB	'DateCr', 00H
	ORG $+1
$SG73967 DB	'IdWhoCr', 00H
$SG73968 DB	'DateDel', 00H
$SG73969 DB	'IdWhoDel', 00H
	ORG $+3
$SG73971 DB	'.', 00H
	ORG $+2
$SG73972 DB	'TLink', 00H
	ORG $+2
$SG73974 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG73977 DB	'Field', 00H
	ORG $+2
$SG73979 DB	'.TxtValue', 00H
	ORG $+2
$SG73980 DB	'TField', 00H
	ORG $+1
$SG73982 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG73985 DB	'TxtValue', 00H
	ORG $+3
$SG73987 DB	'.TxtValue', 00H
	ORG $+2
$SG73988 DB	'TVal', 00H
	ORG $+3
$SG73990 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG73994 DB	'.', 00H
	ORG $+2
$SG73996 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG74000 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG74006 DB	' AND ', 00H
	ORG $+2
$SG74008 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG74011 DB	'(TLink%lu.IdWhoCr IN(%s) OR TLink%lu.IdWhoDel IN(%s))', 00H
	ORG $+2
$SG74013 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG74019 DB	' AND ', 00H
	ORG $+2
$SG74021 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG74024 DB	'TLink%lu.IdWhoCr IN(%s)', 00H
$SG74026 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG74031 DB	' AND ', 00H
	ORG $+2
$SG74033 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG74036 DB	'TLink%lu.IdWhoDel IN(%s)', 00H
	ORG $+3
$SG74038 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG74043 DB	' AND ', 00H
	ORG $+2
$SG74045 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG74047 DB	'.DateDel IS NULL ', 0aH, 00H
	ORG $+1
$SG74048 DB	'TLink', 00H
	ORG $+2
$SG74050 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG74058 DB	' AND ', 00H
	ORG $+2
$SG74060 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG74063 DB	'TLink%lu.DateCr>=''%s'' AND (TLink%lu.DateDel IS NULL OR'
	DB	' TLink%lu.DateDel>''%s'')', 00H
	ORG $+2
$SG74065 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG74070 DB	' AND ', 00H
	ORG $+2
$SG74072 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG74075 DB	'TLink%lu.DateCr<=''%s'' AND (TLink%lu.DateDel IS NULL OR'
	DB	' TLink%lu.DateDel<''%s'')', 00H
	ORG $+2
$SG74077 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG74081 DB	'INNER JOIN TVal AS TVal%lu ON TLink%lu.IdValue=TVal%lu.I'
	DB	'dValue', 0aH, 00H
$SG74083 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG74087 DB	'INNER JOIN TVal AS TField%lu ON TLink%lu.IdField=TField%'
	DB	'lu.IdValue', 0aH, 00H
$SG74089 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG74097 DB	'.IdObj AS IdRelObj', 00H
	ORG $+1
$SG74098 DB	'TLink', 00H
	ORG $+2
$SG74100 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG74105 DB	'.IdObj AS IdValObj', 00H
	ORG $+1
$SG74106 DB	'TLink', 00H
	ORG $+2
$SG74108 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG74111 DB	'IdObj,IdValObj', 00H
	ORG $+1
$SG74113 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG74115 DB	'.Num AS Num', 00H
$SG74116 DB	',TLink', 00H
	ORG $+1
$SG74118 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG74120 DB	'.Line AS Line', 00H
	ORG $+2
$SG74121 DB	',TLink', 00H
	ORG $+1
$SG74123 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG74127 DB	',TField.TxtValue AS Field', 00H
	ORG $+2
$SG74129 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG74131 DB	'.IdField=TField.IdValue', 0aH, 00H
	ORG $+3
$SG74132 DB	'LEFT JOIN TVal AS TField ON TLink', 00H
	ORG $+2
$SG74134 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG74136 DB	'.IdField AS IdField', 00H
$SG74137 DB	',TLink', 00H
	ORG $+1
$SG74139 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG74141 DB	'.IdValue AS IdValue', 00H
$SG74142 DB	',TLink', 00H
	ORG $+1
$SG74144 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG74147 DB	',Field', 00H
	ORG $+1
$SG74149 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG74152 DB	'.IdRelObj IS NULL,0,1) AS IsRel', 00H
$SG74153 DB	',IF(TLink', 00H
	ORG $+2
$SG74155 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG74160 DB	',1 AS IsRel', 00H
$SG74162 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG74165 DB	',Num,Line', 00H
	ORG $+2
$SG74167 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG74169 DB	'D:\Travail\ABI\EVA\V4.0\CGI\Brunix-2016\qry_build.c', 00H
$SG74170 DB	'qry_build_clauses', 00H
	ORG $+2
$SG74172 DB	'D:\Travail\ABI\EVA\V4.0\CGI\Brunix-2016\qry_build.c', 00H
$SG74173 DB	'qry_build_clauses', 00H
_DATA	ENDS
_TEXT	SEGMENT
_b_ok$73766 = -1076
_start$73940 = -1084
_dot$73941 = -1080
_cntxt$ = 8
_flt$ = 12
_mode$ = 16
_i$ = -1040
_valjoin$ = -1032
_lastnode$ = -1044
_where$ = -1036
_sql_trace$ = -1028
_printbuf$ = -1024
_b_joinval$73673 = -1056
_b_joinfld$73674 = -1052
_node$73675 = -1048
_n1$73677 = -1072
_n2$73678 = -1060
_left$73680 = -1068
_right$73681 = -1064
_qry_build_clauses PROC NEAR

; 2379 : ){

	push	ebp
	mov	ebp, esp
	sub	esp, 1140				; 00000474H

; 2380 : 	unsigned long i;
; 2381 : 	unsigned long valjoin;
; 2382 : 	QryBuilNode *lastnode = flt->node + flt->nbnode - (flt->nbnode ? 1 : 0);

	mov	eax, DWORD PTR _flt$[ebp]
	mov	ecx, DWORD PTR [eax+4424]
	imul	ecx, 136				; 00000088H
	mov	edx, DWORD PTR _flt$[ebp]
	lea	eax, DWORD PTR [edx+ecx+72]
	mov	ecx, DWORD PTR _flt$[ebp]
	xor	edx, edx
	cmp	DWORD PTR [ecx+4424], 0
	setne	dl
	imul	edx, 136				; 00000088H
	sub	eax, edx
	mov	DWORD PTR _lastnode$[ebp], eax

; 2383 : 	DynBuffer **where = &flt->where;

	mov	eax, DWORD PTR _flt$[ebp]
	add	eax, 40					; 00000028H
	mov	DWORD PTR _where$[ebp], eax

; 2384 : 	int sql_trace = cntxt->sql_trace;

	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	edx, DWORD PTR [ecx+29852]
	mov	DWORD PTR _sql_trace$[ebp], edx

; 2385 : 	char printbuf[1024];
; 2386 : 
; 2387 : 	/* Set link object part */
; 2388 : 	flt->b_userelobj = flt->node[0].rel == RelReverse && EMPTY_NODE(flt->node);

	mov	eax, DWORD PTR _flt$[ebp]
	cmp	DWORD PTR [eax+124], 2
	jne	SHORT $L74518
	mov	ecx, DWORD PTR _flt$[ebp]
	cmp	DWORD PTR [ecx+72], 0
	jne	SHORT $L74518
	mov	edx, DWORD PTR _flt$[ebp]
	cmp	DWORD PTR [edx+196], 0
	jne	SHORT $L74518
	mov	eax, DWORD PTR _flt$[ebp]
	cmp	DWORD PTR [eax+96], 0
	jne	SHORT $L74518
	mov	ecx, DWORD PTR _flt$[ebp]
	cmp	DWORD PTR [ecx+92], 0
	jne	SHORT $L74518
	mov	DWORD PTR -1088+[ebp], 1
	jmp	SHORT $L74519
$L74518:
	mov	DWORD PTR -1088+[ebp], 0
$L74519:
	mov	edx, DWORD PTR _flt$[ebp]
	mov	eax, DWORD PTR -1088+[ebp]
	mov	DWORD PTR [edx+4436], eax

; 2389 : 
; 2390 : 	/* Add last node if applicable */
; 2391 : 	if(!flt->nbnode) flt->nbnode = 1;

	mov	ecx, DWORD PTR _flt$[ebp]
	cmp	DWORD PTR [ecx+4424], 0
	jne	SHORT $L73665
	mov	edx, DWORD PTR _flt$[ebp]
	mov	DWORD PTR [edx+4424], 1

; 2392 : 	else if(lastnode->rel != RelNone)

	jmp	$L73669
$L73665:
	mov	eax, DWORD PTR _lastnode$[ebp]
	cmp	DWORD PTR [eax+52], 0
	je	SHORT $L73667

; 2394 : 		lastnode = flt->node + flt->nbnode;

	mov	ecx, DWORD PTR _flt$[ebp]
	mov	edx, DWORD PTR [ecx+4424]
	imul	edx, 136				; 00000088H
	mov	eax, DWORD PTR _flt$[ebp]
	lea	ecx, DWORD PTR [eax+edx+72]
	mov	DWORD PTR _lastnode$[ebp], ecx

; 2395 : 		lastnode->srcjoin = flt->nbnode - 1;

	mov	edx, DWORD PTR _flt$[ebp]
	mov	eax, DWORD PTR [edx+4424]
	sub	eax, 1
	mov	ecx, DWORD PTR _lastnode$[ebp]
	mov	DWORD PTR [ecx+56], eax

; 2396 : 		if(!lastnode->modif) lastnode->modif = (lastnode-1)->rel == RelDirect ? F_RelObj : F_Obj;

	mov	edx, DWORD PTR _lastnode$[ebp]
	cmp	DWORD PTR [edx+20], 0
	jne	SHORT $L73668
	mov	eax, DWORD PTR _lastnode$[ebp]
	mov	ecx, DWORD PTR [eax-84]
	sub	ecx, 1
	neg	ecx
	sbb	ecx, ecx
	and	ecx, -5					; fffffffbH
	add	ecx, 7
	mov	edx, DWORD PTR _lastnode$[ebp]
	mov	DWORD PTR [edx+20], ecx
$L73668:

; 2397 : 		flt->nbnode++;

	mov	eax, DWORD PTR _flt$[ebp]
	mov	ecx, DWORD PTR [eax+4424]
	add	ecx, 1
	mov	edx, DWORD PTR _flt$[ebp]
	mov	DWORD PTR [edx+4424], ecx

; 2399 : 	else

	jmp	SHORT $L73669
$L73667:

; 2400 : 		lastnode = flt->node + flt->nbnode - 1;

	mov	eax, DWORD PTR _flt$[ebp]
	mov	ecx, DWORD PTR [eax+4424]
	imul	ecx, 136				; 00000088H
	mov	edx, DWORD PTR _flt$[ebp]
	lea	eax, DWORD PTR [edx+ecx-64]
	mov	DWORD PTR _lastnode$[ebp], eax
$L73669:

; 2401 : 
; 2402 : 	/* Process each node */
; 2403 : 	for(i = 0; i < flt->nbnode; i++)

	mov	DWORD PTR _i$[ebp], 0
	jmp	SHORT $L73670
$L73671:
	mov	ecx, DWORD PTR _i$[ebp]
	add	ecx, 1
	mov	DWORD PTR _i$[ebp], ecx
$L73670:
	mov	edx, DWORD PTR _flt$[ebp]
	mov	eax, DWORD PTR _i$[ebp]
	cmp	eax, DWORD PTR [edx+4424]
	jae	$L73672

; 2405 : 		int b_joinval = 0, b_joinfld = 0;

	mov	DWORD PTR _b_joinval$73673[ebp], 0
	mov	DWORD PTR _b_joinfld$73674[ebp], 0

; 2406 : 		QryBuilNode *node = flt->node + i;

	mov	ecx, DWORD PTR _i$[ebp]
	imul	ecx, 136				; 00000088H
	mov	edx, DWORD PTR _flt$[ebp]
	lea	eax, DWORD PTR [edx+ecx+72]
	mov	DWORD PTR _node$73675[ebp], eax

; 2407 : 
; 2408 : 		/* Add JOIN clause if applicable */
; 2409 : 		if(i)

	cmp	DWORD PTR _i$[ebp], 0
	je	$L73716

; 2411 : 			QryBuilNode *n1 = flt->node + node->srcjoin;

	mov	ecx, DWORD PTR _node$73675[ebp]
	mov	edx, DWORD PTR [ecx+56]
	imul	edx, 136				; 00000088H
	mov	eax, DWORD PTR _flt$[ebp]
	lea	ecx, DWORD PTR [eax+edx+72]
	mov	DWORD PTR _n1$73677[ebp], ecx

; 2412 : 			QryBuilNode *n2 = (n1->srcjoin || node->srcjoin) ? flt->node + n1->srcjoin : NULL;

	mov	edx, DWORD PTR _n1$73677[ebp]
	cmp	DWORD PTR [edx+56], 0
	jne	SHORT $L74520
	mov	eax, DWORD PTR _node$73675[ebp]
	cmp	DWORD PTR [eax+56], 0
	jne	SHORT $L74520
	mov	DWORD PTR -1092+[ebp], 0
	jmp	SHORT $L74521
$L74520:
	mov	ecx, DWORD PTR _n1$73677[ebp]
	mov	edx, DWORD PTR [ecx+56]
	imul	edx, 136				; 00000088H
	mov	eax, DWORD PTR _flt$[ebp]
	lea	ecx, DWORD PTR [eax+edx+72]
	mov	DWORD PTR -1092+[ebp], ecx
$L74521:
	mov	edx, DWORD PTR -1092+[ebp]
	mov	DWORD PTR _n2$73678[ebp], edx

; 2413 : 			char *left, *right;
; 2414 : 
; 2415 : 			/* Compute left & right TLink members of join expresion */
; 2416 : 			if(n1->rel == RelNone || (!node->srcjoin && i > 1) ||
; 2417 : 					(n1->rel == RelDirect && n2 && n2->rel == RelReverse))

	mov	eax, DWORD PTR _n1$73677[ebp]
	cmp	DWORD PTR [eax+52], 0
	je	SHORT $L73683
	mov	ecx, DWORD PTR _node$73675[ebp]
	cmp	DWORD PTR [ecx+56], 0
	jne	SHORT $L73684
	cmp	DWORD PTR _i$[ebp], 1
	ja	SHORT $L73683
$L73684:
	mov	edx, DWORD PTR _n1$73677[ebp]
	cmp	DWORD PTR [edx+52], 1
	jne	SHORT $L73682
	cmp	DWORD PTR _n2$73678[ebp], 0
	je	SHORT $L73682
	mov	eax, DWORD PTR _n2$73678[ebp]
	cmp	DWORD PTR [eax+52], 2
	jne	SHORT $L73682
$L73683:

; 2419 : 				left = "IdObj";

	mov	DWORD PTR _left$73680[ebp], OFFSET FLAT:$SG73685

; 2420 : 				right = "IdObj";

	mov	DWORD PTR _right$73681[ebp], OFFSET FLAT:$SG73686

; 2422 : 			else if(n1->rel == RelReverse && (n2 ? n2->rel == RelDirect : n1->field.nbrows))

	jmp	$L73695
$L73682:
	mov	ecx, DWORD PTR _n1$73677[ebp]
	cmp	DWORD PTR [ecx+52], 2
	jne	SHORT $L73688
	cmp	DWORD PTR _n2$73678[ebp], 0
	je	SHORT $L74522
	mov	edx, DWORD PTR _n2$73678[ebp]
	xor	eax, eax
	cmp	DWORD PTR [edx+52], 1
	sete	al
	mov	DWORD PTR -1096+[ebp], eax
	jmp	SHORT $L74523
$L74522:
	mov	ecx, DWORD PTR _n1$73677[ebp]
	mov	edx, DWORD PTR [ecx]
	mov	DWORD PTR -1096+[ebp], edx
$L74523:
	cmp	DWORD PTR -1096+[ebp], 0
	je	SHORT $L73688

; 2424 : 				left = "IdRelObj";

	mov	DWORD PTR _left$73680[ebp], OFFSET FLAT:$SG73689

; 2425 : 				right = "IdRelObj";

	mov	DWORD PTR _right$73681[ebp], OFFSET FLAT:$SG73690

; 2427 : 			else if(n1->rel == RelReverse)

	jmp	SHORT $L73695
$L73688:
	mov	eax, DWORD PTR _n1$73677[ebp]
	cmp	DWORD PTR [eax+52], 2
	jne	SHORT $L73692

; 2429 : 				left = "IdObj";

	mov	DWORD PTR _left$73680[ebp], OFFSET FLAT:$SG73693

; 2430 : 				right = "IdRelObj";

	mov	DWORD PTR _right$73681[ebp], OFFSET FLAT:$SG73694

; 2432 : 			else

	jmp	SHORT $L73695
$L73692:

; 2434 : 				left = "IdRelObj";

	mov	DWORD PTR _left$73680[ebp], OFFSET FLAT:$SG73696

; 2435 : 				right = "IdObj";

	mov	DWORD PTR _right$73681[ebp], OFFSET FLAT:$SG73697
$L73695:

; 2437 : 
; 2438 : 			/* Determine if a new join table is to be added */
; 2439 : 			if((!flt->b_userelobj || i > 1) && !(node->rel == RelReverse  && EMPTY_NODE(node) && !node->srcjoin))

	mov	ecx, DWORD PTR _flt$[ebp]
	cmp	DWORD PTR [ecx+4436], 0
	je	SHORT $L73699
	cmp	DWORD PTR _i$[ebp], 1
	jbe	SHORT $L73698
$L73699:
	mov	edx, DWORD PTR _node$73675[ebp]
	cmp	DWORD PTR [edx+52], 2
	jne	SHORT $L73700
	mov	eax, DWORD PTR _node$73675[ebp]
	cmp	DWORD PTR [eax], 0
	jne	SHORT $L73700
	mov	ecx, DWORD PTR _node$73675[ebp]
	cmp	DWORD PTR [ecx+124], 0
	jne	SHORT $L73700
	mov	edx, DWORD PTR _node$73675[ebp]
	cmp	DWORD PTR [edx+24], 0
	jne	SHORT $L73700
	mov	eax, DWORD PTR _node$73675[ebp]
	cmp	DWORD PTR [eax+20], 0
	jne	SHORT $L73700
	mov	ecx, DWORD PTR _node$73675[ebp]
	cmp	DWORD PTR [ecx+56], 0
	je	SHORT $L73698
$L73700:

; 2440 : 				node->curjoin = ++flt->nbjoin;

	mov	edx, DWORD PTR _flt$[ebp]
	mov	eax, DWORD PTR [edx+68]
	add	eax, 1
	mov	ecx, DWORD PTR _flt$[ebp]
	mov	DWORD PTR [ecx+68], eax
	mov	edx, DWORD PTR _node$73675[ebp]
	mov	eax, DWORD PTR _flt$[ebp]
	mov	ecx, DWORD PTR [eax+68]
	mov	DWORD PTR [edx+60], ecx

; 2441 : 			else

	jmp	SHORT $L73701
$L73698:

; 2442 : 				node->curjoin = n1->curjoin;

	mov	edx, DWORD PTR _node$73675[ebp]
	mov	eax, DWORD PTR _n1$73677[ebp]
	mov	ecx, DWORD PTR [eax+60]
	mov	DWORD PTR [edx+60], ecx
$L73701:

; 2443 : 			switch(n1->modif)
; 2444 : 			{

	mov	edx, DWORD PTR _n1$73677[ebp]
	mov	eax, DWORD PTR [edx+20]
	mov	DWORD PTR -1100+[ebp], eax
	cmp	DWORD PTR -1100+[ebp], 0
	je	SHORT $L73710
	cmp	DWORD PTR -1100+[ebp], 11		; 0000000bH
	je	SHORT $L73706
	cmp	DWORD PTR -1100+[ebp], 13		; 0000000dH
	je	SHORT $L73708
	jmp	SHORT $L73711
$L73706:

; 2445 : 			case F_WhoCr: left = "IdWhoCr"; break;

	mov	DWORD PTR _left$73680[ebp], OFFSET FLAT:$SG73707
	jmp	SHORT $L73703
$L73708:

; 2446 : 			case F_WhoDel: left = "IdWhoDel"; break;

	mov	DWORD PTR _left$73680[ebp], OFFSET FLAT:$SG73709
	jmp	SHORT $L73703
$L73710:

; 2447 : 			case F_None: break;

	jmp	SHORT $L73703
$L73711:

; 2448 : 			default:
; 2449 : 				RETURN_FILTER_ERROR("Invalid relation field modifier");

	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29872], OFFSET FLAT:$SG73713
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 2449		; 00000991H
	jmp	$eva_err$73714
$L73703:

; 2451 : 			if(n1->curjoin != node->curjoin && node->curjoin &&
; 2452 : 				dynbuf_print5(&flt->join, "INNER JOIN TLink AS TLink%lu ON TLink%lu.%s=TLink%lu.%s\n",
; 2453 : 											node->curjoin, n1->curjoin, left, node->curjoin, right))

	mov	eax, DWORD PTR _n1$73677[ebp]
	mov	ecx, DWORD PTR _node$73675[ebp]
	mov	edx, DWORD PTR [eax+60]
	cmp	edx, DWORD PTR [ecx+60]
	je	$L73716
	mov	eax, DWORD PTR _node$73675[ebp]
	cmp	DWORD PTR [eax+60], 0
	je	$L73716
	push	0
	push	0
	mov	ecx, DWORD PTR _right$73681[ebp]
	push	ecx
	mov	edx, DWORD PTR _node$73675[ebp]
	mov	eax, DWORD PTR [edx+60]
	push	eax
	mov	ecx, DWORD PTR _left$73680[ebp]
	push	ecx
	mov	edx, DWORD PTR _n1$73677[ebp]
	mov	eax, DWORD PTR [edx+60]
	push	eax
	mov	ecx, DWORD PTR _node$73675[ebp]
	mov	edx, DWORD PTR [ecx+60]
	push	edx
	push	OFFSET FLAT:$SG73717
	push	1023					; 000003ffH
	lea	eax, DWORD PTR _printbuf$[ebp]
	push	eax
	call	__snprintf
	add	esp, 32					; 00000020H
	push	eax
	lea	ecx, DWORD PTR _printbuf$[ebp]
	push	ecx
	mov	edx, DWORD PTR _flt$[ebp]
	add	edx, 36					; 00000024H
	push	edx
	call	_dynbuf_add
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L73716

; 2454 : 				RETURN_ERR_MEMORY;

	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29872], OFFSET FLAT:$SG73719
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 2454		; 00000996H
	jmp	$eva_err$73714
$L73716:

; 2456 : 
; 2457 : 		/* Add WHERE clause for fields */
; 2458 : 		if(node->field.nbrows)

	mov	edx, DWORD PTR _node$73675[ebp]
	cmp	DWORD PTR [edx], 0
	je	$L73735

; 2460 : 			if(flt->where) DYNBUF_ADD_STR(&flt->where, " AND ");

	mov	eax, DWORD PTR _flt$[ebp]
	cmp	DWORD PTR [eax+40], 0
	je	SHORT $L73723
	push	0
	push	0
	push	5
	push	OFFSET FLAT:$SG73724
	mov	ecx, DWORD PTR _flt$[ebp]
	add	ecx, 40					; 00000028H
	push	ecx
	call	_dynbuf_add
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L73723
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29872], OFFSET FLAT:$SG73726
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 2460		; 0000099cH
	jmp	$eva_err$73714
$L73723:

; 2461 : 			DYNBUF_ADD3_INT(&flt->where, "TLink", node->curjoin, ".IdField IN(");

	push	12					; 0000000cH
	push	OFFSET FLAT:$SG73728
	mov	ecx, DWORD PTR _node$73675[ebp]
	mov	edx, DWORD PTR [ecx+60]
	push	edx
	push	5
	push	OFFSET FLAT:$SG73729
	mov	eax, DWORD PTR _flt$[ebp]
	add	eax, 40					; 00000028H
	push	eax
	call	_dynbuf_add3_int
	add	esp, 24					; 00000018H
	test	eax, eax
	je	SHORT $L73727
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29872], OFFSET FLAT:$SG73731
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 2461		; 0000099dH
	jmp	$eva_err$73714
$L73727:

; 2462 : 			if(flt->b_single_last_field && node == lastnode && lastnode->field.nbrows > 1) lastnode->field.nbrows = 1;

	mov	eax, DWORD PTR _flt$[ebp]
	cmp	DWORD PTR [eax+4452], 0
	je	SHORT $L73732
	mov	ecx, DWORD PTR _node$73675[ebp]
	cmp	ecx, DWORD PTR _lastnode$[ebp]
	jne	SHORT $L73732
	mov	edx, DWORD PTR _lastnode$[ebp]
	cmp	DWORD PTR [edx], 1
	jbe	SHORT $L73732
	mov	eax, DWORD PTR _lastnode$[ebp]
	mov	DWORD PTR [eax], 1
$L73732:

; 2463 : 			if(qry_values_list(cntxt, &node->field, 3, &flt->where)) STACK_ERROR;

	mov	ecx, DWORD PTR _flt$[ebp]
	add	ecx, 40					; 00000028H
	push	ecx
	push	3
	mov	edx, DWORD PTR _node$73675[ebp]
	push	edx
	mov	eax, DWORD PTR _cntxt$[ebp]
	push	eax
	call	_qry_values_list
	add	esp, 16					; 00000010H
	test	eax, eax
	je	SHORT $L73733
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 2463		; 0000099fH
	jmp	$eva_err$73714
$L73733:

; 2464 : 			DYNBUF_ADD_STR(&flt->where, ")");

	push	0
	push	0
	push	1
	push	OFFSET FLAT:$SG73736
	mov	edx, DWORD PTR _flt$[ebp]
	add	edx, 40					; 00000028H
	push	edx
	call	_dynbuf_add
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L73735
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29872], OFFSET FLAT:$SG73738
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 2464		; 000009a0H
	jmp	$eva_err$73714
$L73735:

; 2466 : 
; 2467 : 		/* Add WHERE clause for IdObj match list */
; 2468 : 		if(node->idobjmatch.nbrows)

	mov	edx, DWORD PTR _node$73675[ebp]
	cmp	DWORD PTR [edx+96], 0
	je	$L73760

; 2470 : 			if(flt->where) DYNBUF_ADD_STR(&flt->where, " AND ");

	mov	eax, DWORD PTR _flt$[ebp]
	cmp	DWORD PTR [eax+40], 0
	je	SHORT $L73742
	push	0
	push	0
	push	5
	push	OFFSET FLAT:$SG73743
	mov	ecx, DWORD PTR _flt$[ebp]
	add	ecx, 40					; 00000028H
	push	ecx
	call	_dynbuf_add
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L73742
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29872], OFFSET FLAT:$SG73745
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 2470		; 000009a6H
	jmp	$eva_err$73714
$L73742:

; 2471 : 			if(flt->b_userelobj)

	mov	ecx, DWORD PTR _flt$[ebp]
	cmp	DWORD PTR [ecx+4436], 0
	je	SHORT $L73746

; 2472 : 				DYNBUF_ADD3_INT(&flt->where, "TLink", node->curjoin, ".IdRelObj IN(")

	push	13					; 0000000dH
	push	OFFSET FLAT:$SG73748
	mov	edx, DWORD PTR _node$73675[ebp]
	mov	eax, DWORD PTR [edx+60]
	push	eax
	push	5
	push	OFFSET FLAT:$SG73749
	mov	ecx, DWORD PTR _flt$[ebp]
	add	ecx, 40					; 00000028H
	push	ecx
	call	_dynbuf_add3_int
	add	esp, 24					; 00000018H
	test	eax, eax
	je	SHORT $L73747
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29872], OFFSET FLAT:$SG73751
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 2472		; 000009a8H
	jmp	$eva_err$73714
$L73747:

; 2473 : 			else

	jmp	SHORT $L73753
$L73746:

; 2474 : 				DYNBUF_ADD3_INT(&flt->where, "TLink", node->curjoin, ".IdObj IN(");

	push	10					; 0000000aH
	push	OFFSET FLAT:$SG73754
	mov	ecx, DWORD PTR _node$73675[ebp]
	mov	edx, DWORD PTR [ecx+60]
	push	edx
	push	5
	push	OFFSET FLAT:$SG73755
	mov	eax, DWORD PTR _flt$[ebp]
	add	eax, 40					; 00000028H
	push	eax
	call	_dynbuf_add3_int
	add	esp, 24					; 00000018H
	test	eax, eax
	je	SHORT $L73753
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29872], OFFSET FLAT:$SG73757
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 2474		; 000009aaH
	jmp	$eva_err$73714
$L73753:

; 2475 : 			if(qry_values_list(cntxt, &node->idobjmatch, 0, &flt->where)) STACK_ERROR;

	mov	eax, DWORD PTR _flt$[ebp]
	add	eax, 40					; 00000028H
	push	eax
	push	0
	mov	ecx, DWORD PTR _node$73675[ebp]
	add	ecx, 96					; 00000060H
	push	ecx
	mov	edx, DWORD PTR _cntxt$[ebp]
	push	edx
	call	_qry_values_list
	add	esp, 16					; 00000010H
	test	eax, eax
	je	SHORT $L73758
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 2475		; 000009abH
	jmp	$eva_err$73714
$L73758:

; 2476 : 			DYNBUF_ADD_STR(&flt->where, ")");

	push	0
	push	0
	push	1
	push	OFFSET FLAT:$SG73761
	mov	ecx, DWORD PTR _flt$[ebp]
	add	ecx, 40					; 00000028H
	push	ecx
	call	_dynbuf_add
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L73760
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29872], OFFSET FLAT:$SG73763
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 2476		; 000009acH
	jmp	$eva_err$73714
$L73760:

; 2478 : 
; 2479 : 		/* Parse match mode depending on node modifier */
; 2480 : #define USE_MEMBER(m) b_ok = 1; if(*where) DYNBUF_ADD_STR(where, " AND "); \
; 2481 : 		if(qry_parse_matchmode(cntxt, where, m, node->curjoin, node->match, node->mtype, &node->value, &b_joinval))\
; 2482 : 			STACK_ERROR; break;
; 2483 : 		if(node->match != NoMatch)

	mov	ecx, DWORD PTR _node$73675[ebp]
	cmp	DWORD PTR [ecx+24], 0
	je	$L73936

; 2485 : 			int b_ok = 0;

	mov	DWORD PTR _b_ok$73766[ebp], 0

; 2486 : 			switch(node->modif)
; 2487 : 			{

	mov	edx, DWORD PTR _node$73675[ebp]
	mov	eax, DWORD PTR [edx+20]
	mov	DWORD PTR -1104+[ebp], eax
	mov	ecx, DWORD PTR -1104+[ebp]
	sub	ecx, 2
	mov	DWORD PTR -1104+[ebp], ecx
	cmp	DWORD PTR -1104+[ebp], 11		; 0000000bH
	ja	$L73894
	mov	edx, DWORD PTR -1104+[ebp]
	jmp	DWORD PTR $L74524[edx*4]
$L73771:

; 2488 : 			case F_DateCr:
; 2489 : 				switch(node->match)
; 2490 : 				{

	mov	eax, DWORD PTR _node$73675[ebp]
	mov	ecx, DWORD PTR [eax+24]
	mov	DWORD PTR -1108+[ebp], ecx
	mov	edx, DWORD PTR -1108+[ebp]
	sub	edx, 5
	mov	DWORD PTR -1108+[ebp], edx
	cmp	DWORD PTR -1108+[ebp], 15		; 0000000fH
	ja	$L73785
	mov	ecx, DWORD PTR -1108+[ebp]
	xor	eax, eax
	mov	al, BYTE PTR $L74525[ecx]
	jmp	DWORD PTR $L74526[eax*4]
$L73776:

; 2491 : 				case Exact:
; 2492 : 				case Different:
; 2493 : 				case Begin:
; 2494 : 				case NotBegin:
; 2495 : 				case Smaller:
; 2496 : 				case SmallerEqual:
; 2497 : 				case Larger:
; 2498 : 				case LargerEqual:
; 2499 : 				case InBound:
; 2500 :                 case NotInBound: USE_MEMBER("DateCr");

	mov	DWORD PTR _b_ok$73766[ebp], 1
	mov	edx, DWORD PTR _where$[ebp]
	cmp	DWORD PTR [edx], 0
	je	SHORT $L73779
	push	0
	push	0
	push	5
	push	OFFSET FLAT:$SG73780
	mov	eax, DWORD PTR _where$[ebp]
	push	eax
	call	_dynbuf_add
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L73779
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29872], OFFSET FLAT:$SG73782
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 2500		; 000009c4H
	jmp	$eva_err$73714
$L73779:
	lea	eax, DWORD PTR _b_joinval$73673[ebp]
	push	eax
	mov	ecx, DWORD PTR _node$73675[ebp]
	add	ecx, 32					; 00000020H
	push	ecx
	mov	edx, DWORD PTR _node$73675[ebp]
	mov	eax, DWORD PTR [edx+28]
	push	eax
	mov	ecx, DWORD PTR _node$73675[ebp]
	mov	edx, DWORD PTR [ecx+24]
	push	edx
	mov	eax, DWORD PTR _node$73675[ebp]
	mov	ecx, DWORD PTR [eax+60]
	push	ecx
	push	OFFSET FLAT:$SG73784
	mov	edx, DWORD PTR _where$[ebp]
	push	edx
	mov	eax, DWORD PTR _cntxt$[ebp]
	push	eax
	call	_qry_parse_matchmode
	add	esp, 32					; 00000020H
	test	eax, eax
	je	SHORT $L73785
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 2500		; 000009c4H
	jmp	$eva_err$73714
$L73785:

; 2504 : 				break;

	jmp	$L73768
$L73786:

; 2505 : 			case F_DateDel:
; 2506 : 				switch(node->match)
; 2507 : 				{

	mov	edx, DWORD PTR _node$73675[ebp]
	mov	eax, DWORD PTR [edx+24]
	mov	DWORD PTR -1112+[ebp], eax
	mov	ecx, DWORD PTR -1112+[ebp]
	sub	ecx, 5
	mov	DWORD PTR -1112+[ebp], ecx
	cmp	DWORD PTR -1112+[ebp], 15		; 0000000fH
	ja	$L73800
	mov	eax, DWORD PTR -1112+[ebp]
	xor	edx, edx
	mov	dl, BYTE PTR $L74527[eax]
	jmp	DWORD PTR $L74528[edx*4]
$L73791:

; 2508 : 				case Exact:
; 2509 : 				case Different:
; 2510 : 				case Begin:
; 2511 : 				case NotBegin:
; 2512 : 				case Smaller:
; 2513 : 				case SmallerEqual:
; 2514 : 				case Larger:
; 2515 : 				case LargerEqual:
; 2516 : 				case InBound:
; 2517 : 				case NotInBound: USE_MEMBER("DateDel");

	mov	DWORD PTR _b_ok$73766[ebp], 1
	mov	ecx, DWORD PTR _where$[ebp]
	cmp	DWORD PTR [ecx], 0
	je	SHORT $L73794
	push	0
	push	0
	push	5
	push	OFFSET FLAT:$SG73795
	mov	edx, DWORD PTR _where$[ebp]
	push	edx
	call	_dynbuf_add
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L73794
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29872], OFFSET FLAT:$SG73797
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 2517		; 000009d5H
	jmp	$eva_err$73714
$L73794:
	lea	edx, DWORD PTR _b_joinval$73673[ebp]
	push	edx
	mov	eax, DWORD PTR _node$73675[ebp]
	add	eax, 32					; 00000020H
	push	eax
	mov	ecx, DWORD PTR _node$73675[ebp]
	mov	edx, DWORD PTR [ecx+28]
	push	edx
	mov	eax, DWORD PTR _node$73675[ebp]
	mov	ecx, DWORD PTR [eax+24]
	push	ecx
	mov	edx, DWORD PTR _node$73675[ebp]
	mov	eax, DWORD PTR [edx+60]
	push	eax
	push	OFFSET FLAT:$SG73799
	mov	ecx, DWORD PTR _where$[ebp]
	push	ecx
	mov	edx, DWORD PTR _cntxt$[ebp]
	push	edx
	call	_qry_parse_matchmode
	add	esp, 32					; 00000020H
	test	eax, eax
	je	SHORT $L73800
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 2517		; 000009d5H
	jmp	$eva_err$73714
$L73800:

; 2521 : 				break;

	jmp	$L73768
$L73801:

; 2522 : 			case F_WhoCr:
; 2523 : 				switch(node->match)
; 2524 : 				{

	mov	ecx, DWORD PTR _node$73675[ebp]
	mov	edx, DWORD PTR [ecx+24]
	mov	DWORD PTR -1116+[ebp], edx
	cmp	DWORD PTR -1116+[ebp], 0
	jle	$L73815
	cmp	DWORD PTR -1116+[ebp], 2
	jle	SHORT $L73806
	jmp	$L73815
$L73806:

; 2525 : 				case ObjList:
; 2526 : 				case NotObjList: USE_MEMBER("IdWhoCr");

	mov	DWORD PTR _b_ok$73766[ebp], 1
	mov	eax, DWORD PTR _where$[ebp]
	cmp	DWORD PTR [eax], 0
	je	SHORT $L73809
	push	0
	push	0
	push	5
	push	OFFSET FLAT:$SG73810
	mov	ecx, DWORD PTR _where$[ebp]
	push	ecx
	call	_dynbuf_add
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L73809
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29872], OFFSET FLAT:$SG73812
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 2526		; 000009deH
	jmp	$eva_err$73714
$L73809:
	lea	ecx, DWORD PTR _b_joinval$73673[ebp]
	push	ecx
	mov	edx, DWORD PTR _node$73675[ebp]
	add	edx, 32					; 00000020H
	push	edx
	mov	eax, DWORD PTR _node$73675[ebp]
	mov	ecx, DWORD PTR [eax+28]
	push	ecx
	mov	edx, DWORD PTR _node$73675[ebp]
	mov	eax, DWORD PTR [edx+24]
	push	eax
	mov	ecx, DWORD PTR _node$73675[ebp]
	mov	edx, DWORD PTR [ecx+60]
	push	edx
	push	OFFSET FLAT:$SG73814
	mov	eax, DWORD PTR _where$[ebp]
	push	eax
	mov	ecx, DWORD PTR _cntxt$[ebp]
	push	ecx
	call	_qry_parse_matchmode
	add	esp, 32					; 00000020H
	test	eax, eax
	je	SHORT $L73815
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 2526		; 000009deH
	jmp	$eva_err$73714
$L73815:

; 2530 : 				break;

	jmp	$L73768
$L73816:

; 2531 : 			case F_WhoDel:
; 2532 : 				switch(node->match)
; 2533 : 				{

	mov	eax, DWORD PTR _node$73675[ebp]
	mov	ecx, DWORD PTR [eax+24]
	mov	DWORD PTR -1120+[ebp], ecx
	cmp	DWORD PTR -1120+[ebp], 0
	jle	$L73830
	cmp	DWORD PTR -1120+[ebp], 2
	jle	SHORT $L73821
	jmp	$L73830
$L73821:

; 2534 : 				case ObjList:
; 2535 : 				case NotObjList: USE_MEMBER("IdWhoDel");

	mov	DWORD PTR _b_ok$73766[ebp], 1
	mov	edx, DWORD PTR _where$[ebp]
	cmp	DWORD PTR [edx], 0
	je	SHORT $L73824
	push	0
	push	0
	push	5
	push	OFFSET FLAT:$SG73825
	mov	eax, DWORD PTR _where$[ebp]
	push	eax
	call	_dynbuf_add
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L73824
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29872], OFFSET FLAT:$SG73827
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 2535		; 000009e7H
	jmp	$eva_err$73714
$L73824:
	lea	eax, DWORD PTR _b_joinval$73673[ebp]
	push	eax
	mov	ecx, DWORD PTR _node$73675[ebp]
	add	ecx, 32					; 00000020H
	push	ecx
	mov	edx, DWORD PTR _node$73675[ebp]
	mov	eax, DWORD PTR [edx+28]
	push	eax
	mov	ecx, DWORD PTR _node$73675[ebp]
	mov	edx, DWORD PTR [ecx+24]
	push	edx
	mov	eax, DWORD PTR _node$73675[ebp]
	mov	ecx, DWORD PTR [eax+60]
	push	ecx
	push	OFFSET FLAT:$SG73829
	mov	edx, DWORD PTR _where$[ebp]
	push	edx
	mov	eax, DWORD PTR _cntxt$[ebp]
	push	eax
	call	_qry_parse_matchmode
	add	esp, 32					; 00000020H
	test	eax, eax
	je	SHORT $L73830
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 2535		; 000009e7H
	jmp	$eva_err$73714
$L73830:

; 2539 : 				break;

	jmp	$L73768
$L73831:

; 2540 : 			case F_Obj:
; 2541 : 				switch(node->match)
; 2542 : 				{

	mov	edx, DWORD PTR _node$73675[ebp]
	mov	eax, DWORD PTR [edx+24]
	mov	DWORD PTR -1124+[ebp], eax
	mov	ecx, DWORD PTR -1124+[ebp]
	sub	ecx, 1
	mov	DWORD PTR -1124+[ebp], ecx
	cmp	DWORD PTR -1124+[ebp], 3
	ja	$L73854
	mov	edx, DWORD PTR -1124+[ebp]
	jmp	DWORD PTR $L74529[edx*4]
$L73836:

; 2543 : 				case RelList:
; 2544 : 				case NotRelList: USE_MEMBER("IdRelObj");

	mov	DWORD PTR _b_ok$73766[ebp], 1
	mov	eax, DWORD PTR _where$[ebp]
	cmp	DWORD PTR [eax], 0
	je	SHORT $L73839
	push	0
	push	0
	push	5
	push	OFFSET FLAT:$SG73840
	mov	ecx, DWORD PTR _where$[ebp]
	push	ecx
	call	_dynbuf_add
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L73839
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29872], OFFSET FLAT:$SG73842
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 2544		; 000009f0H
	jmp	$eva_err$73714
$L73839:
	lea	ecx, DWORD PTR _b_joinval$73673[ebp]
	push	ecx
	mov	edx, DWORD PTR _node$73675[ebp]
	add	edx, 32					; 00000020H
	push	edx
	mov	eax, DWORD PTR _node$73675[ebp]
	mov	ecx, DWORD PTR [eax+28]
	push	ecx
	mov	edx, DWORD PTR _node$73675[ebp]
	mov	eax, DWORD PTR [edx+24]
	push	eax
	mov	ecx, DWORD PTR _node$73675[ebp]
	mov	edx, DWORD PTR [ecx+60]
	push	edx
	push	OFFSET FLAT:$SG73844
	mov	eax, DWORD PTR _where$[ebp]
	push	eax
	mov	ecx, DWORD PTR _cntxt$[ebp]
	push	ecx
	call	_qry_parse_matchmode
	add	esp, 32					; 00000020H
	test	eax, eax
	je	SHORT $L73843
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 2544		; 000009f0H
	jmp	$eva_err$73714
$L73843:
	jmp	$L73833
$L73845:

; 2545 :                 case ObjList:
; 2546 : 				case NotObjList: USE_MEMBER("IdObj");

	mov	DWORD PTR _b_ok$73766[ebp], 1
	mov	eax, DWORD PTR _where$[ebp]
	cmp	DWORD PTR [eax], 0
	je	SHORT $L73848
	push	0
	push	0
	push	5
	push	OFFSET FLAT:$SG73849
	mov	ecx, DWORD PTR _where$[ebp]
	push	ecx
	call	_dynbuf_add
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L73848
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29872], OFFSET FLAT:$SG73851
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 2546		; 000009f2H
	jmp	$eva_err$73714
$L73848:
	lea	ecx, DWORD PTR _b_joinval$73673[ebp]
	push	ecx
	mov	edx, DWORD PTR _node$73675[ebp]
	add	edx, 32					; 00000020H
	push	edx
	mov	eax, DWORD PTR _node$73675[ebp]
	mov	ecx, DWORD PTR [eax+28]
	push	ecx
	mov	edx, DWORD PTR _node$73675[ebp]
	mov	eax, DWORD PTR [edx+24]
	push	eax
	mov	ecx, DWORD PTR _node$73675[ebp]
	mov	edx, DWORD PTR [ecx+60]
	push	edx
	push	OFFSET FLAT:$SG73853
	mov	eax, DWORD PTR _where$[ebp]
	push	eax
	mov	ecx, DWORD PTR _cntxt$[ebp]
	push	ecx
	call	_qry_parse_matchmode
	add	esp, 32					; 00000020H
	test	eax, eax
	je	SHORT $L73854
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 2546		; 000009f2H
	jmp	$eva_err$73714
$L73854:
$L73833:

; 2550 : 			case F_RelObj:
; 2551 : 				switch(node->match)
; 2552 : 				{

	mov	eax, DWORD PTR _node$73675[ebp]
	mov	ecx, DWORD PTR [eax+24]
	mov	DWORD PTR -1128+[ebp], ecx
	cmp	DWORD PTR -1128+[ebp], 0
	jle	$L73869
	cmp	DWORD PTR -1128+[ebp], 2
	jle	SHORT $L73860
	jmp	$L73869
$L73860:

; 2553 : 				case ObjList:
; 2554 : 				case NotObjList: USE_MEMBER("IdRelObj");

	mov	DWORD PTR _b_ok$73766[ebp], 1
	mov	edx, DWORD PTR _where$[ebp]
	cmp	DWORD PTR [edx], 0
	je	SHORT $L73863
	push	0
	push	0
	push	5
	push	OFFSET FLAT:$SG73864
	mov	eax, DWORD PTR _where$[ebp]
	push	eax
	call	_dynbuf_add
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L73863
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29872], OFFSET FLAT:$SG73866
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 2554		; 000009faH
	jmp	$eva_err$73714
$L73863:
	lea	eax, DWORD PTR _b_joinval$73673[ebp]
	push	eax
	mov	ecx, DWORD PTR _node$73675[ebp]
	add	ecx, 32					; 00000020H
	push	ecx
	mov	edx, DWORD PTR _node$73675[ebp]
	mov	eax, DWORD PTR [edx+28]
	push	eax
	mov	ecx, DWORD PTR _node$73675[ebp]
	mov	edx, DWORD PTR [ecx+24]
	push	edx
	mov	eax, DWORD PTR _node$73675[ebp]
	mov	ecx, DWORD PTR [eax+60]
	push	ecx
	push	OFFSET FLAT:$SG73868
	mov	edx, DWORD PTR _where$[ebp]
	push	edx
	mov	eax, DWORD PTR _cntxt$[ebp]
	push	eax
	call	_qry_parse_matchmode
	add	esp, 32					; 00000020H
	test	eax, eax
	je	SHORT $L73869
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 2554		; 000009faH
	jmp	$eva_err$73714
$L73869:

; 2558 : 				break;

	jmp	$L73768
$L73870:

; 2559 : 			case F_Value:
; 2560 : 				switch(node->match)
; 2561 : 				{

	mov	edx, DWORD PTR _node$73675[ebp]
	mov	eax, DWORD PTR [edx+24]
	mov	DWORD PTR -1132+[ebp], eax
	mov	ecx, DWORD PTR -1132+[ebp]
	sub	ecx, 5
	mov	DWORD PTR -1132+[ebp], ecx
	cmp	DWORD PTR -1132+[ebp], 15		; 0000000fH
	ja	$L73893
	mov	eax, DWORD PTR -1132+[ebp]
	xor	edx, edx
	mov	dl, BYTE PTR $L74530[eax]
	jmp	DWORD PTR $L74531[edx*4]
$L73875:

; 2562 : 				case NotIdValList:
; 2563 :                 case IdValList:	USE_MEMBER("IdValue");

	mov	DWORD PTR _b_ok$73766[ebp], 1
	mov	ecx, DWORD PTR _where$[ebp]
	cmp	DWORD PTR [ecx], 0
	je	SHORT $L73878
	push	0
	push	0
	push	5
	push	OFFSET FLAT:$SG73879
	mov	edx, DWORD PTR _where$[ebp]
	push	edx
	call	_dynbuf_add
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L73878
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29872], OFFSET FLAT:$SG73881
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 2563		; 00000a03H
	jmp	$eva_err$73714
$L73878:
	lea	edx, DWORD PTR _b_joinval$73673[ebp]
	push	edx
	mov	eax, DWORD PTR _node$73675[ebp]
	add	eax, 32					; 00000020H
	push	eax
	mov	ecx, DWORD PTR _node$73675[ebp]
	mov	edx, DWORD PTR [ecx+28]
	push	edx
	mov	eax, DWORD PTR _node$73675[ebp]
	mov	ecx, DWORD PTR [eax+24]
	push	ecx
	mov	edx, DWORD PTR _node$73675[ebp]
	mov	eax, DWORD PTR [edx+60]
	push	eax
	push	OFFSET FLAT:$SG73883
	mov	ecx, DWORD PTR _where$[ebp]
	push	ecx
	mov	edx, DWORD PTR _cntxt$[ebp]
	push	edx
	call	_qry_parse_matchmode
	add	esp, 32					; 00000020H
	test	eax, eax
	je	SHORT $L73882
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 2563		; 00000a03H
	jmp	$eva_err$73714
$L73882:
	jmp	$L73872
$L73884:

; 2564 : 				case Exact:
; 2565 : 				case Different:
; 2566 : 				case Contain:
; 2567 : 				case NotContain:
; 2568 : 				case Begin:
; 2569 : 				case NotBegin:
; 2570 : 				case Like:
; 2571 : 				case NotLike:
; 2572 : 				case Smaller:
; 2573 : 				case SmallerEqual:
; 2574 : 				case Larger:
; 2575 : 				case LargerEqual:
; 2576 : 				case InBound:
; 2577 : 				case NotInBound: USE_MEMBER("TxtValue");

	mov	DWORD PTR _b_ok$73766[ebp], 1
	mov	ecx, DWORD PTR _where$[ebp]
	cmp	DWORD PTR [ecx], 0
	je	SHORT $L73887
	push	0
	push	0
	push	5
	push	OFFSET FLAT:$SG73888
	mov	edx, DWORD PTR _where$[ebp]
	push	edx
	call	_dynbuf_add
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L73887
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29872], OFFSET FLAT:$SG73890
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 2577		; 00000a11H
	jmp	$eva_err$73714
$L73887:
	lea	edx, DWORD PTR _b_joinval$73673[ebp]
	push	edx
	mov	eax, DWORD PTR _node$73675[ebp]
	add	eax, 32					; 00000020H
	push	eax
	mov	ecx, DWORD PTR _node$73675[ebp]
	mov	edx, DWORD PTR [ecx+28]
	push	edx
	mov	eax, DWORD PTR _node$73675[ebp]
	mov	ecx, DWORD PTR [eax+24]
	push	ecx
	mov	edx, DWORD PTR _node$73675[ebp]
	mov	eax, DWORD PTR [edx+60]
	push	eax
	push	OFFSET FLAT:$SG73892
	mov	ecx, DWORD PTR _where$[ebp]
	push	ecx
	mov	edx, DWORD PTR _cntxt$[ebp]
	push	edx
	call	_qry_parse_matchmode
	add	esp, 32					; 00000020H
	test	eax, eax
	je	SHORT $L73893
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 2577		; 00000a11H
	jmp	$eva_err$73714
$L73893:
$L73872:

; 2581 : 				break;

	jmp	$L73768
$L73894:

; 2582 : 			default:
; 2583 : 				switch(node->match)
; 2584 : 				{

	mov	ecx, DWORD PTR _node$73675[ebp]
	mov	edx, DWORD PTR [ecx+24]
	mov	DWORD PTR -1136+[ebp], edx
	mov	eax, DWORD PTR -1136+[ebp]
	sub	eax, 1
	mov	DWORD PTR -1136+[ebp], eax
	cmp	DWORD PTR -1136+[ebp], 19		; 00000013H
	ja	$L73935
	mov	edx, DWORD PTR -1136+[ebp]
	xor	ecx, ecx
	mov	cl, BYTE PTR $L74532[edx]
	jmp	DWORD PTR $L74533[ecx*4]
$L73899:

; 2585 : 				case ObjList:
; 2586 : 				case NotObjList: USE_MEMBER("IdObj");

	mov	DWORD PTR _b_ok$73766[ebp], 1
	mov	eax, DWORD PTR _where$[ebp]
	cmp	DWORD PTR [eax], 0
	je	SHORT $L73902
	push	0
	push	0
	push	5
	push	OFFSET FLAT:$SG73903
	mov	ecx, DWORD PTR _where$[ebp]
	push	ecx
	call	_dynbuf_add
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L73902
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29872], OFFSET FLAT:$SG73905
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 2586		; 00000a1aH
	jmp	$eva_err$73714
$L73902:
	lea	ecx, DWORD PTR _b_joinval$73673[ebp]
	push	ecx
	mov	edx, DWORD PTR _node$73675[ebp]
	add	edx, 32					; 00000020H
	push	edx
	mov	eax, DWORD PTR _node$73675[ebp]
	mov	ecx, DWORD PTR [eax+28]
	push	ecx
	mov	edx, DWORD PTR _node$73675[ebp]
	mov	eax, DWORD PTR [edx+24]
	push	eax
	mov	ecx, DWORD PTR _node$73675[ebp]
	mov	edx, DWORD PTR [ecx+60]
	push	edx
	push	OFFSET FLAT:$SG73907
	mov	eax, DWORD PTR _where$[ebp]
	push	eax
	mov	ecx, DWORD PTR _cntxt$[ebp]
	push	ecx
	call	_qry_parse_matchmode
	add	esp, 32					; 00000020H
	test	eax, eax
	je	SHORT $L73906
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 2586		; 00000a1aH
	jmp	$eva_err$73714
$L73906:
	jmp	$L73896
$L73908:

; 2587 : 				case RelList:
; 2588 : 				case NotRelList: USE_MEMBER("IdRelObj");

	mov	DWORD PTR _b_ok$73766[ebp], 1
	mov	eax, DWORD PTR _where$[ebp]
	cmp	DWORD PTR [eax], 0
	je	SHORT $L73911
	push	0
	push	0
	push	5
	push	OFFSET FLAT:$SG73912
	mov	ecx, DWORD PTR _where$[ebp]
	push	ecx
	call	_dynbuf_add
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L73911
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29872], OFFSET FLAT:$SG73914
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 2588		; 00000a1cH
	jmp	$eva_err$73714
$L73911:
	lea	ecx, DWORD PTR _b_joinval$73673[ebp]
	push	ecx
	mov	edx, DWORD PTR _node$73675[ebp]
	add	edx, 32					; 00000020H
	push	edx
	mov	eax, DWORD PTR _node$73675[ebp]
	mov	ecx, DWORD PTR [eax+28]
	push	ecx
	mov	edx, DWORD PTR _node$73675[ebp]
	mov	eax, DWORD PTR [edx+24]
	push	eax
	mov	ecx, DWORD PTR _node$73675[ebp]
	mov	edx, DWORD PTR [ecx+60]
	push	edx
	push	OFFSET FLAT:$SG73916
	mov	eax, DWORD PTR _where$[ebp]
	push	eax
	mov	ecx, DWORD PTR _cntxt$[ebp]
	push	ecx
	call	_qry_parse_matchmode
	add	esp, 32					; 00000020H
	test	eax, eax
	je	SHORT $L73915
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 2588		; 00000a1cH
	jmp	$eva_err$73714
$L73915:
	jmp	$L73896
$L73917:

; 2589 : 				case NotIdValList:
; 2590 : 				case IdValList:	USE_MEMBER("IdValue");

	mov	DWORD PTR _b_ok$73766[ebp], 1
	mov	eax, DWORD PTR _where$[ebp]
	cmp	DWORD PTR [eax], 0
	je	SHORT $L73920
	push	0
	push	0
	push	5
	push	OFFSET FLAT:$SG73921
	mov	ecx, DWORD PTR _where$[ebp]
	push	ecx
	call	_dynbuf_add
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L73920
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29872], OFFSET FLAT:$SG73923
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 2590		; 00000a1eH
	jmp	$eva_err$73714
$L73920:
	lea	ecx, DWORD PTR _b_joinval$73673[ebp]
	push	ecx
	mov	edx, DWORD PTR _node$73675[ebp]
	add	edx, 32					; 00000020H
	push	edx
	mov	eax, DWORD PTR _node$73675[ebp]
	mov	ecx, DWORD PTR [eax+28]
	push	ecx
	mov	edx, DWORD PTR _node$73675[ebp]
	mov	eax, DWORD PTR [edx+24]
	push	eax
	mov	ecx, DWORD PTR _node$73675[ebp]
	mov	edx, DWORD PTR [ecx+60]
	push	edx
	push	OFFSET FLAT:$SG73925
	mov	eax, DWORD PTR _where$[ebp]
	push	eax
	mov	ecx, DWORD PTR _cntxt$[ebp]
	push	ecx
	call	_qry_parse_matchmode
	add	esp, 32					; 00000020H
	test	eax, eax
	je	SHORT $L73924
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 2590		; 00000a1eH
	jmp	$eva_err$73714
$L73924:
	jmp	$L73896
$L73926:

; 2591 : 				case Exact:
; 2592 : 				case Different:
; 2593 : 				case Contain:
; 2594 : 				case NotContain:
; 2595 : 				case Begin:
; 2596 : 				case NotBegin:
; 2597 : 				case Like:
; 2598 : 				case NotLike:
; 2599 : 				case Smaller:
; 2600 : 				case SmallerEqual:
; 2601 : 				case Larger:
; 2602 : 				case LargerEqual:
; 2603 : 				case InBound:
; 2604 : 				case NotInBound: USE_MEMBER("TxtValue");

	mov	DWORD PTR _b_ok$73766[ebp], 1
	mov	eax, DWORD PTR _where$[ebp]
	cmp	DWORD PTR [eax], 0
	je	SHORT $L73929
	push	0
	push	0
	push	5
	push	OFFSET FLAT:$SG73930
	mov	ecx, DWORD PTR _where$[ebp]
	push	ecx
	call	_dynbuf_add
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L73929
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29872], OFFSET FLAT:$SG73932
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 2604		; 00000a2cH
	jmp	$eva_err$73714
$L73929:
	lea	ecx, DWORD PTR _b_joinval$73673[ebp]
	push	ecx
	mov	edx, DWORD PTR _node$73675[ebp]
	add	edx, 32					; 00000020H
	push	edx
	mov	eax, DWORD PTR _node$73675[ebp]
	mov	ecx, DWORD PTR [eax+28]
	push	ecx
	mov	edx, DWORD PTR _node$73675[ebp]
	mov	eax, DWORD PTR [edx+24]
	push	eax
	mov	ecx, DWORD PTR _node$73675[ebp]
	mov	edx, DWORD PTR [ecx+60]
	push	edx
	push	OFFSET FLAT:$SG73934
	mov	eax, DWORD PTR _where$[ebp]
	push	eax
	mov	ecx, DWORD PTR _cntxt$[ebp]
	push	ecx
	call	_qry_parse_matchmode
	add	esp, 32					; 00000020H
	test	eax, eax
	je	SHORT $L73935
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 2604		; 00000a2cH
	jmp	$eva_err$73714
$L73935:
$L73896:
$L73768:

; 2609 : 
; 2610 : 			/* Handle error & return if applicable */
; 2611 : 			if(!b_ok) RETURN_FILTER_ERROR("Invalid match mode for the modifier");

	cmp	DWORD PTR _b_ok$73766[ebp], 0
	jne	SHORT $L73936
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29872], OFFSET FLAT:$SG73938
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 2611		; 00000a33H
	jmp	$eva_err$73714
$L73936:

; 2613 : #undef USE_MEMBER
; 2614 : 
; 2615 : 		/* Handle node condition */
; 2616 : 		if(node->cond)

	mov	edx, DWORD PTR _node$73675[ebp]
	cmp	DWORD PTR [edx+124], 0
	je	$L73939

; 2618 : 			char *start = node->cond->data;

	mov	eax, DWORD PTR _node$73675[ebp]
	mov	ecx, DWORD PTR [eax+124]
	add	ecx, 8
	mov	DWORD PTR _start$73940[ebp], ecx

; 2619 : 			char *dot = strchr(start, '.');

	push	46					; 0000002eH
	mov	edx, DWORD PTR _start$73940[ebp]
	push	edx
	call	_strchr
	add	esp, 8
	mov	DWORD PTR _dot$73941[ebp], eax

; 2620 : 			if(*where) DYNBUF_ADD_STR(where, "\nAND ");

	mov	eax, DWORD PTR _where$[ebp]
	cmp	DWORD PTR [eax], 0
	je	SHORT $L73944
	push	0
	push	0
	push	5
	push	OFFSET FLAT:$SG73945
	mov	ecx, DWORD PTR _where$[ebp]
	push	ecx
	call	_dynbuf_add
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L73944
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29872], OFFSET FLAT:$SG73947
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 2620		; 00000a3cH
	jmp	$eva_err$73714
$L73944:

; 2621 : 			while(dot)

	cmp	DWORD PTR _dot$73941[ebp], 0
	je	$L73950

; 2623 : 				if(dot > start) DYNBUF_ADD(where, start, dot - start, NO_CONV);

	mov	ecx, DWORD PTR _dot$73941[ebp]
	cmp	ecx, DWORD PTR _start$73940[ebp]
	jbe	SHORT $L73953
	push	0
	push	0
	mov	edx, DWORD PTR _dot$73941[ebp]
	sub	edx, DWORD PTR _start$73940[ebp]
	push	edx
	mov	eax, DWORD PTR _start$73940[ebp]
	push	eax
	mov	ecx, DWORD PTR _where$[ebp]
	push	ecx
	call	_dynbuf_add
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L73953
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29872], OFFSET FLAT:$SG73955
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 2623		; 00000a3fH
	jmp	$eva_err$73714
$L73953:

; 2624 : 				if(!strncmp(dot + 1, add_sz_str("Pkey")) ||
; 2625 : 					!strncmp(dot + 1, add_sz_str("IdObj")) ||
; 2626 : 					!strncmp(dot + 1, add_sz_str("IdField")) ||
; 2627 : 					!strncmp(dot + 1, add_sz_str("IdValue")) ||
; 2628 : 					!strncmp(dot + 1, add_sz_str("IdRelObj")) ||
; 2629 : 					!strncmp(dot + 1, add_sz_str("Num")) ||
; 2630 : 					!strncmp(dot + 1, add_sz_str("Line")) ||
; 2631 : 					!strncmp(dot + 1, add_sz_str("Lang")) ||
; 2632 : 					!strncmp(dot + 1, add_sz_str("DateCr")) ||
; 2633 : 					!strncmp(dot + 1, add_sz_str("IdWhoCr")) ||
; 2634 : 					!strncmp(dot + 1, add_sz_str("DateDel")) ||
; 2635 : 					!strncmp(dot + 1, add_sz_str("IdWhoDel")))

	push	4
	push	OFFSET FLAT:$SG73958
	mov	ecx, DWORD PTR _dot$73941[ebp]
	add	ecx, 1
	push	ecx
	call	_strncmp
	add	esp, 12					; 0000000cH
	test	eax, eax
	je	$L73957
	push	5
	push	OFFSET FLAT:$SG73959
	mov	edx, DWORD PTR _dot$73941[ebp]
	add	edx, 1
	push	edx
	call	_strncmp
	add	esp, 12					; 0000000cH
	test	eax, eax
	je	$L73957
	push	7
	push	OFFSET FLAT:$SG73960
	mov	eax, DWORD PTR _dot$73941[ebp]
	add	eax, 1
	push	eax
	call	_strncmp
	add	esp, 12					; 0000000cH
	test	eax, eax
	je	$L73957
	push	7
	push	OFFSET FLAT:$SG73961
	mov	ecx, DWORD PTR _dot$73941[ebp]
	add	ecx, 1
	push	ecx
	call	_strncmp
	add	esp, 12					; 0000000cH
	test	eax, eax
	je	$L73957
	push	8
	push	OFFSET FLAT:$SG73962
	mov	edx, DWORD PTR _dot$73941[ebp]
	add	edx, 1
	push	edx
	call	_strncmp
	add	esp, 12					; 0000000cH
	test	eax, eax
	je	$L73957
	push	3
	push	OFFSET FLAT:$SG73963
	mov	eax, DWORD PTR _dot$73941[ebp]
	add	eax, 1
	push	eax
	call	_strncmp
	add	esp, 12					; 0000000cH
	test	eax, eax
	je	$L73957
	push	4
	push	OFFSET FLAT:$SG73964
	mov	ecx, DWORD PTR _dot$73941[ebp]
	add	ecx, 1
	push	ecx
	call	_strncmp
	add	esp, 12					; 0000000cH
	test	eax, eax
	je	$L73957
	push	4
	push	OFFSET FLAT:$SG73965
	mov	edx, DWORD PTR _dot$73941[ebp]
	add	edx, 1
	push	edx
	call	_strncmp
	add	esp, 12					; 0000000cH
	test	eax, eax
	je	SHORT $L73957
	push	6
	push	OFFSET FLAT:$SG73966
	mov	eax, DWORD PTR _dot$73941[ebp]
	add	eax, 1
	push	eax
	call	_strncmp
	add	esp, 12					; 0000000cH
	test	eax, eax
	je	SHORT $L73957
	push	7
	push	OFFSET FLAT:$SG73967
	mov	ecx, DWORD PTR _dot$73941[ebp]
	add	ecx, 1
	push	ecx
	call	_strncmp
	add	esp, 12					; 0000000cH
	test	eax, eax
	je	SHORT $L73957
	push	7
	push	OFFSET FLAT:$SG73968
	mov	edx, DWORD PTR _dot$73941[ebp]
	add	edx, 1
	push	edx
	call	_strncmp
	add	esp, 12					; 0000000cH
	test	eax, eax
	je	SHORT $L73957
	push	8
	push	OFFSET FLAT:$SG73969
	mov	eax, DWORD PTR _dot$73941[ebp]
	add	eax, 1
	push	eax
	call	_strncmp
	add	esp, 12					; 0000000cH
	test	eax, eax
	jne	SHORT $L73956
$L73957:

; 2637 : 					DYNBUF_ADD3_INT(where, "TLink", node->curjoin, ".");

	push	1
	push	OFFSET FLAT:$SG73971
	mov	ecx, DWORD PTR _node$73675[ebp]
	mov	edx, DWORD PTR [ecx+60]
	push	edx
	push	5
	push	OFFSET FLAT:$SG73972
	mov	eax, DWORD PTR _where$[ebp]
	push	eax
	call	_dynbuf_add3_int
	add	esp, 24					; 00000018H
	test	eax, eax
	je	SHORT $L73970
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29872], OFFSET FLAT:$SG73974
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 2637		; 00000a4dH
	jmp	$eva_err$73714
$L73970:

; 2638 : 					start = dot + 1;

	mov	eax, DWORD PTR _dot$73941[ebp]
	add	eax, 1
	mov	DWORD PTR _start$73940[ebp], eax

; 2640 : 				else if(!strncmp(dot + 1, add_sz_str("Field")))

	jmp	$L73991
$L73956:
	push	5
	push	OFFSET FLAT:$SG73977
	mov	ecx, DWORD PTR _dot$73941[ebp]
	add	ecx, 1
	push	ecx
	call	_strncmp
	add	esp, 12					; 0000000cH
	test	eax, eax
	jne	SHORT $L73976

; 2642 : 					DYNBUF_ADD3_INT(where, "TField", node->curjoin, ".TxtValue");

	push	9
	push	OFFSET FLAT:$SG73979
	mov	edx, DWORD PTR _node$73675[ebp]
	mov	eax, DWORD PTR [edx+60]
	push	eax
	push	6
	push	OFFSET FLAT:$SG73980
	mov	ecx, DWORD PTR _where$[ebp]
	push	ecx
	call	_dynbuf_add3_int
	add	esp, 24					; 00000018H
	test	eax, eax
	je	SHORT $L73978
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29872], OFFSET FLAT:$SG73982
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 2642		; 00000a52H
	jmp	$eva_err$73714
$L73978:

; 2643 : 					start = dot + 6;

	mov	ecx, DWORD PTR _dot$73941[ebp]
	add	ecx, 6
	mov	DWORD PTR _start$73940[ebp], ecx

; 2644 : 					b_joinfld = 1;

	mov	DWORD PTR _b_joinfld$73674[ebp], 1

; 2646 : 				else if(!strncmp(dot + 1, add_sz_str("TxtValue")))

	jmp	$L73991
$L73976:
	push	8
	push	OFFSET FLAT:$SG73985
	mov	edx, DWORD PTR _dot$73941[ebp]
	add	edx, 1
	push	edx
	call	_strncmp
	add	esp, 12					; 0000000cH
	test	eax, eax
	jne	SHORT $L73984

; 2648 : 					DYNBUF_ADD3_INT(where, "TVal", node->curjoin, ".TxtValue");

	push	9
	push	OFFSET FLAT:$SG73987
	mov	eax, DWORD PTR _node$73675[ebp]
	mov	ecx, DWORD PTR [eax+60]
	push	ecx
	push	4
	push	OFFSET FLAT:$SG73988
	mov	edx, DWORD PTR _where$[ebp]
	push	edx
	call	_dynbuf_add3_int
	add	esp, 24					; 00000018H
	test	eax, eax
	je	SHORT $L73986
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29872], OFFSET FLAT:$SG73990
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 2648		; 00000a58H
	jmp	$eva_err$73714
$L73986:

; 2649 : 					start = dot + 9;

	mov	edx, DWORD PTR _dot$73941[ebp]
	add	edx, 9
	mov	DWORD PTR _start$73940[ebp], edx

; 2650 : 					b_joinval = 1;

	mov	DWORD PTR _b_joinval$73673[ebp], 1

; 2652 : 				else

	jmp	SHORT $L73991
$L73984:

; 2654 : 					DYNBUF_ADD_STR(where, ".");

	push	0
	push	0
	push	1
	push	OFFSET FLAT:$SG73994
	mov	eax, DWORD PTR _where$[ebp]
	push	eax
	call	_dynbuf_add
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L73993
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29872], OFFSET FLAT:$SG73996
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 2654		; 00000a5eH
	jmp	$eva_err$73714
$L73993:

; 2655 : 					start = dot + 1;

	mov	eax, DWORD PTR _dot$73941[ebp]
	add	eax, 1
	mov	DWORD PTR _start$73940[ebp], eax
$L73991:

; 2657 : 				dot = strchr(start, '.');

	push	46					; 0000002eH
	mov	ecx, DWORD PTR _start$73940[ebp]
	push	ecx
	call	_strchr
	add	esp, 8
	mov	DWORD PTR _dot$73941[ebp], eax

; 2658 : 			}

	jmp	$L73944
$L73950:

; 2659 : 			DYNBUF_ADD(where, start, node->cond->cnt - (start - node->cond->data), NO_CONV);

	push	0
	push	0
	mov	edx, DWORD PTR _node$73675[ebp]
	mov	eax, DWORD PTR [edx+124]
	mov	ecx, DWORD PTR _node$73675[ebp]
	mov	edx, DWORD PTR [ecx+124]
	add	edx, 8
	mov	ecx, DWORD PTR _start$73940[ebp]
	sub	ecx, edx
	mov	edx, DWORD PTR [eax+4]
	sub	edx, ecx
	push	edx
	mov	eax, DWORD PTR _start$73940[ebp]
	push	eax
	mov	ecx, DWORD PTR _where$[ebp]
	push	ecx
	call	_dynbuf_add
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L73998
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29872], OFFSET FLAT:$SG74000
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 2659		; 00000a63H
	jmp	$eva_err$73714
$L73998:

; 2661 : 		else

	jmp	$L74074
$L73939:

; 2663 : 			/* Handle Create / Delete user */
; 2664 : 			if(node->whocr && node->whodel && node->whocr == node->whodel)

	mov	ecx, DWORD PTR _node$73675[ebp]
	cmp	DWORD PTR [ecx+116], 0
	je	$L74002
	mov	edx, DWORD PTR _node$73675[ebp]
	cmp	DWORD PTR [edx+120], 0
	je	$L74002
	mov	eax, DWORD PTR _node$73675[ebp]
	mov	ecx, DWORD PTR _node$73675[ebp]
	mov	edx, DWORD PTR [eax+116]
	cmp	edx, DWORD PTR [ecx+120]
	jne	$L74002

; 2666 : 				if(flt->where) DYNBUF_ADD_STR(&flt->where, " AND ");

	mov	eax, DWORD PTR _flt$[ebp]
	cmp	DWORD PTR [eax+40], 0
	je	SHORT $L74005
	push	0
	push	0
	push	5
	push	OFFSET FLAT:$SG74006
	mov	ecx, DWORD PTR _flt$[ebp]
	add	ecx, 40					; 00000028H
	push	ecx
	call	_dynbuf_add
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L74005
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29872], OFFSET FLAT:$SG74008
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 2666		; 00000a6aH
	jmp	$eva_err$73714
$L74005:

; 2667 : 				if(dynbuf_print4(&flt->where, "(TLink%lu.IdWhoCr IN(%s) OR TLink%lu.IdWhoDel IN(%s))",
; 2668 : 					node->curjoin, node->whocr->data, node->curjoin, node->whocr->data))

	push	0
	push	0
	mov	ecx, DWORD PTR _node$73675[ebp]
	mov	edx, DWORD PTR [ecx+116]
	add	edx, 8
	push	edx
	mov	eax, DWORD PTR _node$73675[ebp]
	mov	ecx, DWORD PTR [eax+60]
	push	ecx
	mov	edx, DWORD PTR _node$73675[ebp]
	mov	eax, DWORD PTR [edx+116]
	add	eax, 8
	push	eax
	mov	ecx, DWORD PTR _node$73675[ebp]
	mov	edx, DWORD PTR [ecx+60]
	push	edx
	push	OFFSET FLAT:$SG74011
	push	1023					; 000003ffH
	lea	eax, DWORD PTR _printbuf$[ebp]
	push	eax
	call	__snprintf
	add	esp, 28					; 0000001cH
	push	eax
	lea	ecx, DWORD PTR _printbuf$[ebp]
	push	ecx
	mov	edx, DWORD PTR _flt$[ebp]
	add	edx, 40					; 00000028H
	push	edx
	call	_dynbuf_add
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L74010

; 2669 : 					RETURN_ERR_MEMORY;

	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29872], OFFSET FLAT:$SG74013
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 2669		; 00000a6dH
	jmp	$eva_err$73714
$L74010:

; 2671 : 			else

	jmp	$L74035
$L74002:

; 2673 : 				if(node->whocr)

	mov	edx, DWORD PTR _node$73675[ebp]
	cmp	DWORD PTR [edx+116], 0
	je	$L74023

; 2675 : 					if(flt->where) DYNBUF_ADD_STR(&flt->where, " AND ");

	mov	eax, DWORD PTR _flt$[ebp]
	cmp	DWORD PTR [eax+40], 0
	je	SHORT $L74018
	push	0
	push	0
	push	5
	push	OFFSET FLAT:$SG74019
	mov	ecx, DWORD PTR _flt$[ebp]
	add	ecx, 40					; 00000028H
	push	ecx
	call	_dynbuf_add
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L74018
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29872], OFFSET FLAT:$SG74021
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 2675		; 00000a73H
	jmp	$eva_err$73714
$L74018:

; 2676 : 					if(dynbuf_print2(&flt->where, "TLink%lu.IdWhoCr IN(%s)",
; 2677 : 						node->curjoin, node->whocr->data))

	push	0
	push	0
	mov	ecx, DWORD PTR _node$73675[ebp]
	mov	edx, DWORD PTR [ecx+116]
	add	edx, 8
	push	edx
	mov	eax, DWORD PTR _node$73675[ebp]
	mov	ecx, DWORD PTR [eax+60]
	push	ecx
	push	OFFSET FLAT:$SG74024
	push	1023					; 000003ffH
	lea	edx, DWORD PTR _printbuf$[ebp]
	push	edx
	call	__snprintf
	add	esp, 20					; 00000014H
	push	eax
	lea	eax, DWORD PTR _printbuf$[ebp]
	push	eax
	mov	ecx, DWORD PTR _flt$[ebp]
	add	ecx, 40					; 00000028H
	push	ecx
	call	_dynbuf_add
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L74023

; 2678 : 						RETURN_ERR_MEMORY;

	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29872], OFFSET FLAT:$SG74026
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 2678		; 00000a76H
	jmp	$eva_err$73714
$L74023:

; 2680 : 				if(node->whodel)

	mov	ecx, DWORD PTR _node$73675[ebp]
	cmp	DWORD PTR [ecx+120], 0
	je	$L74035

; 2682 : 					if(flt->where) DYNBUF_ADD_STR(&flt->where, " AND ");

	mov	edx, DWORD PTR _flt$[ebp]
	cmp	DWORD PTR [edx+40], 0
	je	SHORT $L74030
	push	0
	push	0
	push	5
	push	OFFSET FLAT:$SG74031
	mov	eax, DWORD PTR _flt$[ebp]
	add	eax, 40					; 00000028H
	push	eax
	call	_dynbuf_add
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L74030
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29872], OFFSET FLAT:$SG74033
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 2682		; 00000a7aH
	jmp	$eva_err$73714
$L74030:

; 2683 : 					if(dynbuf_print2(&flt->where, "TLink%lu.IdWhoDel IN(%s)",
; 2684 : 						node->curjoin, node->whodel->data))

	push	0
	push	0
	mov	eax, DWORD PTR _node$73675[ebp]
	mov	ecx, DWORD PTR [eax+120]
	add	ecx, 8
	push	ecx
	mov	edx, DWORD PTR _node$73675[ebp]
	mov	eax, DWORD PTR [edx+60]
	push	eax
	push	OFFSET FLAT:$SG74036
	push	1023					; 000003ffH
	lea	ecx, DWORD PTR _printbuf$[ebp]
	push	ecx
	call	__snprintf
	add	esp, 20					; 00000014H
	push	eax
	lea	edx, DWORD PTR _printbuf$[ebp]
	push	edx
	mov	eax, DWORD PTR _flt$[ebp]
	add	eax, 40					; 00000028H
	push	eax
	call	_dynbuf_add
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L74035

; 2685 : 						RETURN_ERR_MEMORY;

	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29872], OFFSET FLAT:$SG74038
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 2685		; 00000a7dH
	jmp	$eva_err$73714
$L74035:

; 2688 : 
; 2689 : 			/* Handle node create / delete dates criteria */
; 2690 : 			if(!node->datemin[0] && !node->datemax[0])

	mov	eax, DWORD PTR _node$73675[ebp]
	movsx	ecx, BYTE PTR [eax+64]
	test	ecx, ecx
	jne	$L74039
	mov	edx, DWORD PTR _node$73675[ebp]
	movsx	eax, BYTE PTR [edx+80]
	test	eax, eax
	jne	$L74039

; 2692 : 				if(flt->where) DYNBUF_ADD_STR(&flt->where, " AND ");

	mov	ecx, DWORD PTR _flt$[ebp]
	cmp	DWORD PTR [ecx+40], 0
	je	SHORT $L74042
	push	0
	push	0
	push	5
	push	OFFSET FLAT:$SG74043
	mov	edx, DWORD PTR _flt$[ebp]
	add	edx, 40					; 00000028H
	push	edx
	call	_dynbuf_add
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L74042
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29872], OFFSET FLAT:$SG74045
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 2692		; 00000a84H
	jmp	$eva_err$73714
$L74042:

; 2693 : 				DYNBUF_ADD3_INT(&flt->where, "TLink", node->curjoin, ".DateDel IS NULL \n");

	push	18					; 00000012H
	push	OFFSET FLAT:$SG74047
	mov	edx, DWORD PTR _node$73675[ebp]
	mov	eax, DWORD PTR [edx+60]
	push	eax
	push	5
	push	OFFSET FLAT:$SG74048
	mov	ecx, DWORD PTR _flt$[ebp]
	add	ecx, 40					; 00000028H
	push	ecx
	call	_dynbuf_add3_int
	add	esp, 24					; 00000018H
	test	eax, eax
	je	SHORT $L74046
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29872], OFFSET FLAT:$SG74050
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 2693		; 00000a85H
	jmp	$eva_err$73714
$L74046:

; 2695 : 			else if(node->datemin[0] || (node->datemax[0] && strcmp(node->datemax, cntxt->timestamp) < 0))

	jmp	$L74074
$L74039:
	mov	ecx, DWORD PTR _node$73675[ebp]
	movsx	edx, BYTE PTR [ecx+64]
	test	edx, edx
	jne	SHORT $L74053
	mov	eax, DWORD PTR _node$73675[ebp]
	movsx	ecx, BYTE PTR [eax+80]
	test	ecx, ecx
	je	$L74074
	mov	edx, DWORD PTR _cntxt$[ebp]
	add	edx, 29704				; 00007408H
	push	edx
	mov	eax, DWORD PTR _node$73675[ebp]
	add	eax, 80					; 00000050H
	push	eax
	call	_strcmp
	add	esp, 8
	test	eax, eax
	jge	$L74074
$L74053:

; 2697 : 				if(node->datemin[0])

	mov	ecx, DWORD PTR _node$73675[ebp]
	movsx	edx, BYTE PTR [ecx+64]
	test	edx, edx
	je	$L74062

; 2699 : 					if(flt->where) DYNBUF_ADD_STR(&flt->where, " AND ");

	mov	eax, DWORD PTR _flt$[ebp]
	cmp	DWORD PTR [eax+40], 0
	je	SHORT $L74057
	push	0
	push	0
	push	5
	push	OFFSET FLAT:$SG74058
	mov	ecx, DWORD PTR _flt$[ebp]
	add	ecx, 40					; 00000028H
	push	ecx
	call	_dynbuf_add
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L74057
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29872], OFFSET FLAT:$SG74060
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 2699		; 00000a8bH
	jmp	$eva_err$73714
$L74057:

; 2700 : 					if(dynbuf_print5(&flt->where,
; 2701 : 						"TLink%lu.DateCr>='%s' AND (TLink%lu.DateDel IS NULL OR TLink%lu.DateDel>'%s')",
; 2702 : 						node->curjoin, node->datemin, node->curjoin, node->curjoin, node->datemin))

	push	0
	push	0
	mov	ecx, DWORD PTR _node$73675[ebp]
	add	ecx, 64					; 00000040H
	push	ecx
	mov	edx, DWORD PTR _node$73675[ebp]
	mov	eax, DWORD PTR [edx+60]
	push	eax
	mov	ecx, DWORD PTR _node$73675[ebp]
	mov	edx, DWORD PTR [ecx+60]
	push	edx
	mov	eax, DWORD PTR _node$73675[ebp]
	add	eax, 64					; 00000040H
	push	eax
	mov	ecx, DWORD PTR _node$73675[ebp]
	mov	edx, DWORD PTR [ecx+60]
	push	edx
	push	OFFSET FLAT:$SG74063
	push	1023					; 000003ffH
	lea	eax, DWORD PTR _printbuf$[ebp]
	push	eax
	call	__snprintf
	add	esp, 32					; 00000020H
	push	eax
	lea	ecx, DWORD PTR _printbuf$[ebp]
	push	ecx
	mov	edx, DWORD PTR _flt$[ebp]
	add	edx, 40					; 00000028H
	push	edx
	call	_dynbuf_add
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L74062

; 2703 : 						RETURN_ERR_MEMORY;

	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29872], OFFSET FLAT:$SG74065
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 2703		; 00000a8fH
	jmp	$eva_err$73714
$L74062:

; 2705 : 				if(node->datemax[0])

	mov	edx, DWORD PTR _node$73675[ebp]
	movsx	eax, BYTE PTR [edx+80]
	test	eax, eax
	je	$L74074

; 2707 : 					if(flt->where) DYNBUF_ADD_STR(&flt->where, " AND ");

	mov	ecx, DWORD PTR _flt$[ebp]
	cmp	DWORD PTR [ecx+40], 0
	je	SHORT $L74069
	push	0
	push	0
	push	5
	push	OFFSET FLAT:$SG74070
	mov	edx, DWORD PTR _flt$[ebp]
	add	edx, 40					; 00000028H
	push	edx
	call	_dynbuf_add
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L74069
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29872], OFFSET FLAT:$SG74072
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 2707		; 00000a93H
	jmp	$eva_err$73714
$L74069:

; 2708 : 					if(dynbuf_print5(&flt->where,
; 2709 : 						"TLink%lu.DateCr<='%s' AND (TLink%lu.DateDel IS NULL OR TLink%lu.DateDel<'%s')",
; 2710 : 						node->curjoin, node->datemax, node->curjoin, node->curjoin, node->datemax))

	push	0
	push	0
	mov	edx, DWORD PTR _node$73675[ebp]
	add	edx, 80					; 00000050H
	push	edx
	mov	eax, DWORD PTR _node$73675[ebp]
	mov	ecx, DWORD PTR [eax+60]
	push	ecx
	mov	edx, DWORD PTR _node$73675[ebp]
	mov	eax, DWORD PTR [edx+60]
	push	eax
	mov	ecx, DWORD PTR _node$73675[ebp]
	add	ecx, 80					; 00000050H
	push	ecx
	mov	edx, DWORD PTR _node$73675[ebp]
	mov	eax, DWORD PTR [edx+60]
	push	eax
	push	OFFSET FLAT:$SG74075
	push	1023					; 000003ffH
	lea	ecx, DWORD PTR _printbuf$[ebp]
	push	ecx
	call	__snprintf
	add	esp, 32					; 00000020H
	push	eax
	lea	edx, DWORD PTR _printbuf$[ebp]
	push	edx
	mov	eax, DWORD PTR _flt$[ebp]
	add	eax, 40					; 00000028H
	push	eax
	call	_dynbuf_add
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L74074

; 2711 : 						RETURN_ERR_MEMORY;

	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29872], OFFSET FLAT:$SG74077
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 2711		; 00000a97H
	jmp	$eva_err$73714
$L74074:

; 2715 : 
; 2716 : 		/* Add JOIN clause for TVal if applicable */
; 2717 : 		if(b_joinval && !node->b_joinval)

	cmp	DWORD PTR _b_joinval$73673[ebp], 0
	je	$L74080
	mov	eax, DWORD PTR _node$73675[ebp]
	cmp	DWORD PTR [eax+128], 0
	jne	$L74080

; 2719 : 			node->b_joinval = 1;

	mov	ecx, DWORD PTR _node$73675[ebp]
	mov	DWORD PTR [ecx+128], 1

; 2720 : 			if(dynbuf_print3(&flt->join, "INNER JOIN TVal AS TVal%lu ON TLink%lu.IdValue=TVal%lu.IdValue\n",
; 2721 : 											node->curjoin, node->curjoin, node->curjoin))

	push	0
	push	0
	mov	edx, DWORD PTR _node$73675[ebp]
	mov	eax, DWORD PTR [edx+60]
	push	eax
	mov	ecx, DWORD PTR _node$73675[ebp]
	mov	edx, DWORD PTR [ecx+60]
	push	edx
	mov	eax, DWORD PTR _node$73675[ebp]
	mov	ecx, DWORD PTR [eax+60]
	push	ecx
	push	OFFSET FLAT:$SG74081
	push	1023					; 000003ffH
	lea	edx, DWORD PTR _printbuf$[ebp]
	push	edx
	call	__snprintf
	add	esp, 24					; 00000018H
	push	eax
	lea	eax, DWORD PTR _printbuf$[ebp]
	push	eax
	mov	ecx, DWORD PTR _flt$[ebp]
	add	ecx, 36					; 00000024H
	push	ecx
	call	_dynbuf_add
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L74080

; 2722 : 				RETURN_ERR_MEMORY;

	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29872], OFFSET FLAT:$SG74083
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 2722		; 00000aa2H
	jmp	$eva_err$73714
$L74080:

; 2724 : 
; 2725 : 		/* Add JOIN clause for TField if applicable */
; 2726 : 		if(b_joinfld && !node->b_joinfld)

	cmp	DWORD PTR _b_joinfld$73674[ebp], 0
	je	$L74086
	mov	ecx, DWORD PTR _node$73675[ebp]
	cmp	DWORD PTR [ecx+132], 0
	jne	$L74086

; 2728 : 			node->b_joinfld = 1;

	mov	edx, DWORD PTR _node$73675[ebp]
	mov	DWORD PTR [edx+132], 1

; 2729 : 			if(dynbuf_print3(&flt->join, "INNER JOIN TVal AS TField%lu ON TLink%lu.IdField=TField%lu.IdValue\n",
; 2730 : 											node->curjoin, node->curjoin, node->curjoin))

	push	0
	push	0
	mov	eax, DWORD PTR _node$73675[ebp]
	mov	ecx, DWORD PTR [eax+60]
	push	ecx
	mov	edx, DWORD PTR _node$73675[ebp]
	mov	eax, DWORD PTR [edx+60]
	push	eax
	mov	ecx, DWORD PTR _node$73675[ebp]
	mov	edx, DWORD PTR [ecx+60]
	push	edx
	push	OFFSET FLAT:$SG74087
	push	1023					; 000003ffH
	lea	eax, DWORD PTR _printbuf$[ebp]
	push	eax
	call	__snprintf
	add	esp, 24					; 00000018H
	push	eax
	lea	ecx, DWORD PTR _printbuf$[ebp]
	push	ecx
	mov	edx, DWORD PTR _flt$[ebp]
	add	edx, 36					; 00000024H
	push	edx
	call	_dynbuf_add
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L74086

; 2731 : 				RETURN_ERR_MEMORY;

	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29872], OFFSET FLAT:$SG74089
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 2731		; 00000aabH
	jmp	$eva_err$73714
$L74086:

; 2733 : 	}

	jmp	$L73671
$L73672:

; 2734 : 
; 2735 : 	/* Handle SELECT member */
; 2736 : 	flt->valnode = lastnode;

	mov	edx, DWORD PTR _flt$[ebp]
	mov	eax, DWORD PTR _lastnode$[ebp]
	mov	DWORD PTR [edx+4428], eax

; 2737 : 	valjoin = flt->valnode->curjoin;

	mov	ecx, DWORD PTR _flt$[ebp]
	mov	edx, DWORD PTR [ecx+4428]
	mov	eax, DWORD PTR [edx+60]
	mov	DWORD PTR _valjoin$[ebp], eax

; 2738 : 	switch(mode)
; 2739 : 	{

	mov	ecx, DWORD PTR _mode$[ebp]
	mov	DWORD PTR -1140+[ebp], ecx
	cmp	DWORD PTR -1140+[ebp], 0
	je	$L74101
	cmp	DWORD PTR -1140+[ebp], 1
	jle	$eva_noerr$74168
	cmp	DWORD PTR -1140+[ebp], 3
	jle	SHORT $L74094
	jmp	$eva_noerr$74168
$L74094:

; 2740 : 	case 3:
; 2741 : 	case 2:
; 2742 : 		/* Build selected IdObj + IdRelObj list */
; 2743 : 		if(mode == 3) flt->selidobj = flt->srctable;

	cmp	DWORD PTR _mode$[ebp], 3
	jne	SHORT $L74095
	mov	edx, DWORD PTR _flt$[ebp]
	mov	eax, DWORD PTR _flt$[ebp]
	mov	ecx, DWORD PTR [eax+20]
	mov	DWORD PTR [edx+4440], ecx
$L74095:

; 2744 : 		DYNBUF_ADD3_INT(&flt->optselect, "TLink", valjoin ? 1 : 0, ".IdObj AS IdRelObj");

	push	18					; 00000012H
	push	OFFSET FLAT:$SG74097
	xor	edx, edx
	cmp	DWORD PTR _valjoin$[ebp], 0
	setne	dl
	push	edx
	push	5
	push	OFFSET FLAT:$SG74098
	mov	eax, DWORD PTR _flt$[ebp]
	add	eax, 32					; 00000020H
	push	eax
	call	_dynbuf_add3_int
	add	esp, 24					; 00000018H
	test	eax, eax
	je	SHORT $L74096
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29872], OFFSET FLAT:$SG74100
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 2744		; 00000ab8H
	jmp	$eva_err$73714
$L74096:

; 2745 : 		break;

	jmp	$eva_noerr$74168
$L74101:

; 2746 : 
; 2747 : 	case 0:
; 2748 : 		/* Build selected value */
; 2749 : 		if(qry_add_valnode_field(cntxt, flt, lastnode->modif)) STACK_ERROR;

	mov	eax, DWORD PTR _lastnode$[ebp]
	mov	ecx, DWORD PTR [eax+20]
	push	ecx
	mov	edx, DWORD PTR _flt$[ebp]
	push	edx
	mov	eax, DWORD PTR _cntxt$[ebp]
	push	eax
	call	_qry_add_valnode_field
	add	esp, 12					; 0000000cH
	test	eax, eax
	je	SHORT $L74102
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 2749		; 00000abdH
	jmp	$eva_err$73714
$L74102:

; 2750 : 
; 2751 : 		/* Output extended info if applicable */
; 2752 : 		if(!flt->groupfn && flt->b_recdata)

	mov	edx, DWORD PTR _flt$[ebp]
	cmp	DWORD PTR [edx+44], 0
	jne	$L74164
	mov	eax, DWORD PTR _flt$[ebp]
	cmp	DWORD PTR [eax+4448], 0
	je	$L74164

; 2754 : 			DYNBUF_ADD3_INT(&flt->optselect, "TLink", valjoin, ".IdObj AS IdValObj");

	push	18					; 00000012H
	push	OFFSET FLAT:$SG74105
	mov	ecx, DWORD PTR _valjoin$[ebp]
	push	ecx
	push	5
	push	OFFSET FLAT:$SG74106
	mov	edx, DWORD PTR _flt$[ebp]
	add	edx, 32					; 00000020H
	push	edx
	call	_dynbuf_add3_int
	add	esp, 24					; 00000018H
	test	eax, eax
	je	SHORT $L74104
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29872], OFFSET FLAT:$SG74108
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 2754		; 00000ac2H
	jmp	$eva_err$73714
$L74104:

; 2755 : 			DYNBUF_ADD_STR(&flt->orderby, "IdObj,IdValObj");

	push	0
	push	0
	push	14					; 0000000eH
	push	OFFSET FLAT:$SG74111
	mov	edx, DWORD PTR _flt$[ebp]
	add	edx, 52					; 00000034H
	push	edx
	call	_dynbuf_add
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L74110
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29872], OFFSET FLAT:$SG74113
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 2755		; 00000ac3H
	jmp	$eva_err$73714
$L74110:

; 2756 : 			DYNBUF_ADD3_INT(&flt->optselect, ",TLink", valjoin, ".Num AS Num");

	push	11					; 0000000bH
	push	OFFSET FLAT:$SG74115
	mov	edx, DWORD PTR _valjoin$[ebp]
	push	edx
	push	6
	push	OFFSET FLAT:$SG74116
	mov	eax, DWORD PTR _flt$[ebp]
	add	eax, 32					; 00000020H
	push	eax
	call	_dynbuf_add3_int
	add	esp, 24					; 00000018H
	test	eax, eax
	je	SHORT $L74114
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29872], OFFSET FLAT:$SG74118
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 2756		; 00000ac4H
	jmp	$eva_err$73714
$L74114:

; 2757 : 			DYNBUF_ADD3_INT(&flt->optselect, ",TLink", valjoin, ".Line AS Line");

	push	13					; 0000000dH
	push	OFFSET FLAT:$SG74120
	mov	eax, DWORD PTR _valjoin$[ebp]
	push	eax
	push	6
	push	OFFSET FLAT:$SG74121
	mov	ecx, DWORD PTR _flt$[ebp]
	add	ecx, 32					; 00000020H
	push	ecx
	call	_dynbuf_add3_int
	add	esp, 24					; 00000018H
	test	eax, eax
	je	SHORT $L74119
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29872], OFFSET FLAT:$SG74123
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 2757		; 00000ac5H
	jmp	$eva_err$73714
$L74119:

; 2758 : 
; 2759 : 			if(flt->b_recdata > 1)

	mov	ecx, DWORD PTR _flt$[ebp]
	cmp	DWORD PTR [ecx+4448], 1
	jle	$L74159

; 2761 : 				DYNBUF_ADD_STR(&flt->optselect, ",TField.TxtValue AS Field");

	push	0
	push	0
	push	25					; 00000019H
	push	OFFSET FLAT:$SG74127
	mov	edx, DWORD PTR _flt$[ebp]
	add	edx, 32					; 00000020H
	push	edx
	call	_dynbuf_add
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L74126
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29872], OFFSET FLAT:$SG74129
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 2761		; 00000ac9H
	jmp	$eva_err$73714
$L74126:

; 2762 : 				DYNBUF_ADD3_INT(&flt->join, "LEFT JOIN TVal AS TField ON TLink", valjoin, ".IdField=TField.IdValue\n");

	push	24					; 00000018H
	push	OFFSET FLAT:$SG74131
	mov	edx, DWORD PTR _valjoin$[ebp]
	push	edx
	push	33					; 00000021H
	push	OFFSET FLAT:$SG74132
	mov	eax, DWORD PTR _flt$[ebp]
	add	eax, 36					; 00000024H
	push	eax
	call	_dynbuf_add3_int
	add	esp, 24					; 00000018H
	test	eax, eax
	je	SHORT $L74130
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29872], OFFSET FLAT:$SG74134
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 2762		; 00000acaH
	jmp	$eva_err$73714
$L74130:

; 2763 : 				DYNBUF_ADD3_INT(&flt->optselect, ",TLink", valjoin, ".IdField AS IdField");

	push	19					; 00000013H
	push	OFFSET FLAT:$SG74136
	mov	eax, DWORD PTR _valjoin$[ebp]
	push	eax
	push	6
	push	OFFSET FLAT:$SG74137
	mov	ecx, DWORD PTR _flt$[ebp]
	add	ecx, 32					; 00000020H
	push	ecx
	call	_dynbuf_add3_int
	add	esp, 24					; 00000018H
	test	eax, eax
	je	SHORT $L74135
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29872], OFFSET FLAT:$SG74139
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 2763		; 00000acbH
	jmp	$eva_err$73714
$L74135:

; 2764 : 				DYNBUF_ADD3_INT(&flt->optselect, ",TLink", valjoin, ".IdValue AS IdValue");

	push	19					; 00000013H
	push	OFFSET FLAT:$SG74141
	mov	ecx, DWORD PTR _valjoin$[ebp]
	push	ecx
	push	6
	push	OFFSET FLAT:$SG74142
	mov	edx, DWORD PTR _flt$[ebp]
	add	edx, 32					; 00000020H
	push	edx
	call	_dynbuf_add3_int
	add	esp, 24					; 00000018H
	test	eax, eax
	je	SHORT $L74140
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29872], OFFSET FLAT:$SG74144
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 2764		; 00000accH
	jmp	$eva_err$73714
$L74140:

; 2765 : 				DYNBUF_ADD_STR(&flt->orderby, ",Field");

	push	0
	push	0
	push	6
	push	OFFSET FLAT:$SG74147
	mov	edx, DWORD PTR _flt$[ebp]
	add	edx, 52					; 00000034H
	push	edx
	call	_dynbuf_add
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L74146
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29872], OFFSET FLAT:$SG74149
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 2765		; 00000acdH
	jmp	$eva_err$73714
$L74146:

; 2766 : 				if(lastnode->modif == F_None)

	mov	edx, DWORD PTR _lastnode$[ebp]
	cmp	DWORD PTR [edx+20], 0
	jne	SHORT $L74150

; 2767 : 					DYNBUF_ADD3_INT(&flt->optselect, ",IF(TLink", valjoin, ".IdRelObj IS NULL,0,1) AS IsRel")

	push	31					; 0000001fH
	push	OFFSET FLAT:$SG74152
	mov	eax, DWORD PTR _valjoin$[ebp]
	push	eax
	push	9
	push	OFFSET FLAT:$SG74153
	mov	ecx, DWORD PTR _flt$[ebp]
	add	ecx, 32					; 00000020H
	push	ecx
	call	_dynbuf_add3_int
	add	esp, 24					; 00000018H
	test	eax, eax
	je	SHORT $L74151
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29872], OFFSET FLAT:$SG74155
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 2767		; 00000acfH
	jmp	$eva_err$73714
$L74151:

; 2768 : 				else if(lastnode->modif != F_Value)

	jmp	SHORT $L74159
$L74150:
	mov	ecx, DWORD PTR _lastnode$[ebp]
	cmp	DWORD PTR [ecx+20], 6
	je	SHORT $L74159

; 2769 : 					DYNBUF_ADD_STR(&flt->optselect, ",1 AS IsRel");

	push	0
	push	0
	push	11					; 0000000bH
	push	OFFSET FLAT:$SG74160
	mov	edx, DWORD PTR _flt$[ebp]
	add	edx, 32					; 00000020H
	push	edx
	call	_dynbuf_add
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L74159
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29872], OFFSET FLAT:$SG74162
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 2769		; 00000ad1H
	jmp	SHORT $eva_err$73714
$L74159:

; 2771 : 			DYNBUF_ADD_STR(&flt->orderby, ",Num,Line");

	push	0
	push	0
	push	9
	push	OFFSET FLAT:$SG74165
	mov	edx, DWORD PTR _flt$[ebp]
	add	edx, 52					; 00000034H
	push	edx
	call	_dynbuf_add
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L74164
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29872], OFFSET FLAT:$SG74167
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 2771		; 00000ad3H
	jmp	SHORT $eva_err$73714
$L74164:
$eva_noerr$74168:

; 2774 : 
; 2775 : 	RETURN_OK_CLEANUP;

	push	0
	push	OFFSET FLAT:$SG74169
	push	OFFSET FLAT:$SG74170
	mov	edx, DWORD PTR _cntxt$[ebp]
	push	edx
	call	_err_clear
	add	esp, 16					; 00000010H
$eva_err$73714:
	mov	eax, DWORD PTR _cntxt$[ebp]
	cmp	DWORD PTR [eax+29872], 0
	je	SHORT $L74171
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	edx, DWORD PTR [ecx+29900]
	push	edx
	push	OFFSET FLAT:$SG74172
	push	OFFSET FLAT:$SG74173
	mov	eax, DWORD PTR _cntxt$[ebp]
	push	eax
	call	_err_add_context
	add	esp, 16					; 00000010H
$L74171:
	mov	ecx, DWORD PTR _cntxt$[ebp]
	cmp	DWORD PTR [ecx+29872], 0
	je	SHORT $L74174
	mov	edx, DWORD PTR _flt$[ebp]
	push	edx
	mov	eax, DWORD PTR _cntxt$[ebp]
	add	eax, 29876				; 000074b4H
	push	eax
	call	_err_print_filter
	add	esp, 8
$L74174:
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	edx, DWORD PTR _sql_trace$[ebp]
	mov	DWORD PTR [ecx+29852], edx
	mov	eax, DWORD PTR _cntxt$[ebp]
	xor	ecx, ecx
	cmp	DWORD PTR [eax+29872], 0
	setne	cl
	mov	eax, ecx

; 2776 : }

	mov	esp, ebp
	pop	ebp
	ret	0
$L74524:
	DD	$L73831
	DD	$L73894
	DD	$L73894
	DD	$L73894
	DD	$L73870
	DD	$L73833
	DD	$L73894
	DD	$L73894
	DD	$L73771
	DD	$L73801
	DD	$L73786
	DD	$L73816
$L74526:
	DD	$L73776
	DD	$L73785
$L74525:
	DB	0
	DB	0
	DB	1
	DB	1
	DB	1
	DB	1
	DB	1
	DB	1
	DB	0
	DB	0
	DB	0
	DB	0
	DB	0
	DB	0
	DB	0
	DB	0
$L74528:
	DD	$L73791
	DD	$L73800
$L74527:
	DB	0
	DB	0
	DB	1
	DB	1
	DB	1
	DB	1
	DB	1
	DB	1
	DB	0
	DB	0
	DB	0
	DB	0
	DB	0
	DB	0
	DB	0
	DB	0
$L74529:
	DD	$L73845
	DD	$L73845
	DD	$L73836
	DD	$L73836
$L74531:
	DD	$L73884
	DD	$L73875
$L74530:
	DB	0
	DB	0
	DB	1
	DB	1
	DB	0
	DB	0
	DB	0
	DB	0
	DB	0
	DB	0
	DB	0
	DB	0
	DB	0
	DB	0
	DB	0
	DB	0
$L74533:
	DD	$L73899
	DD	$L73908
	DD	$L73926
	DD	$L73917
$L74532:
	DB	0
	DB	0
	DB	1
	DB	1
	DB	2
	DB	2
	DB	3
	DB	3
	DB	2
	DB	2
	DB	2
	DB	2
	DB	2
	DB	2
	DB	2
	DB	2
	DB	2
	DB	2
	DB	2
	DB	2
_qry_build_clauses ENDP
_TEXT	ENDS
_DATA	SEGMENT
	ORG $+2
$SG74191 DB	'D:\Travail\ABI\EVA\V4.0\CGI\Brunix-2016\qry_build.c', 00H
$SG74192 DB	'qry_parse_fieldexpr', 00H
$SG74194 DB	'D:\Travail\ABI\EVA\V4.0\CGI\Brunix-2016\qry_build.c', 00H
$SG74195 DB	'qry_parse_fieldexpr', 00H
_DATA	ENDS
_TEXT	SEGMENT
_cntxt$ = 8
_field$ = 12
_sz_field$ = 16
_flt$ = 20
_qry_parse_fieldexpr PROC NEAR

; 2790 : ){

	push	ebp
	mov	ebp, esp

; 2791 : 	if(qry_parse_fieldexpr_nodes(cntxt, field, sz_field, flt)) STACK_ERROR;

	mov	eax, DWORD PTR _flt$[ebp]
	push	eax
	mov	ecx, DWORD PTR _sz_field$[ebp]
	push	ecx
	mov	edx, DWORD PTR _field$[ebp]
	push	edx
	mov	eax, DWORD PTR _cntxt$[ebp]
	push	eax
	call	_qry_parse_fieldexpr_nodes
	add	esp, 16					; 00000010H
	test	eax, eax
	je	SHORT $L74187
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 2791		; 00000ae7H
	jmp	SHORT $eva_err$74188
$L74187:

; 2792 : 	if(qry_build_clauses(cntxt, flt, 0)) STACK_ERROR;

	push	0
	mov	edx, DWORD PTR _flt$[ebp]
	push	edx
	mov	eax, DWORD PTR _cntxt$[ebp]
	push	eax
	call	_qry_build_clauses
	add	esp, 12					; 0000000cH
	test	eax, eax
	je	SHORT $eva_noerr$74190
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 2792		; 00000ae8H
	jmp	SHORT $eva_err$74188
$eva_noerr$74190:

; 2793 : 
; 2794 : 	RETURN_OK_CLEANUP;

	push	0
	push	OFFSET FLAT:$SG74191
	push	OFFSET FLAT:$SG74192
	mov	edx, DWORD PTR _cntxt$[ebp]
	push	edx
	call	_err_clear
	add	esp, 16					; 00000010H
$eva_err$74188:
	mov	eax, DWORD PTR _cntxt$[ebp]
	cmp	DWORD PTR [eax+29872], 0
	je	SHORT $L74193
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	edx, DWORD PTR [ecx+29900]
	push	edx
	push	OFFSET FLAT:$SG74194
	push	OFFSET FLAT:$SG74195
	mov	eax, DWORD PTR _cntxt$[ebp]
	push	eax
	call	_err_add_context
	add	esp, 16					; 00000010H
$L74193:
	mov	ecx, DWORD PTR _cntxt$[ebp]
	xor	eax, eax
	cmp	DWORD PTR [ecx+29872], 0
	setne	al

; 2795 : }

	pop	ebp
	ret	0
_qry_parse_fieldexpr ENDP
_TEXT	ENDS
_BSS	SEGMENT
	ALIGN	4

$SG74278 DB	01H DUP (?)
_BSS	ENDS
_DATA	SEGMENT
$SG74228 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG74230 DB	'->', 00H
	ORG $+1
$SG74231 DB	'<-', 00H
	ORG $+1
$SG74237 DB	'Group function : invalid position or parentheses', 00H
	ORG $+3
$SG74241 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG74245 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG74250 DB	'->', 00H
	ORG $+1
$SG74251 DB	'<-', 00H
	ORG $+1
$SG74256 DB	'Multiple fields sequence in same node', 00H
	ORG $+2
$SG74267 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG74272 DB	'Multiple field modifiers not allowed', 00H
	ORG $+3
$SG74277 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG74281 DB	'Invalid field modifier', 00H
	ORG $+1
$SG74286 DB	'Invalid modifier before relation', 00H
	ORG $+3
$SG74290 DB	'Invalid operator', 00H
	ORG $+3
$SG74294 DB	'D:\Travail\ABI\EVA\V4.0\CGI\Brunix-2016\qry_build.c', 00H
$SG74295 DB	'qry_parse_fieldexpr_nodes', 00H
	ORG $+2
$SG74297 DB	'D:\Travail\ABI\EVA\V4.0\CGI\Brunix-2016\qry_build.c', 00H
$SG74298 DB	'qry_parse_fieldexpr_nodes', 00H
_DATA	ENDS
_TEXT	SEGMENT
_cntxt$ = 8
_field$ = 12
_sz_field$ = 16
_flt$ = 20
_nextfield$ = -16
_modif$ = -36
_dotsep$ = -32
_reldir$ = -48
_relrev$ = -12
_relop$ = -24
_paropn$ = -8
_oper$ = -20
_parse$ = -28
_next$ = -44
_node$ = -4
_n$ = -40
_b_usedel$74249 = -52
_field$74253 = -56
_comma$74260 = -60
_qry_parse_fieldexpr_nodes PROC NEAR

; 2811 : ){

	push	ebp
	mov	ebp, esp
	sub	esp, 100				; 00000064H

; 2812 : 	DynBuffer *nextfield = NULL;

	mov	DWORD PTR _nextfield$[ebp], 0

; 2813 : 	DynBuffer *modif = NULL;

	mov	DWORD PTR _modif$[ebp], 0

; 2814 : 	DECLARE_FIELDEXPR_OP;
; 2815 : 	char *parse, *next;
; 2816 : 	QryBuilNode *node = flt->node + flt->nbnode;

	mov	eax, DWORD PTR _flt$[ebp]
	mov	ecx, DWORD PTR [eax+4424]
	imul	ecx, 136				; 00000088H
	mov	edx, DWORD PTR _flt$[ebp]
	lea	eax, DWORD PTR [edx+ecx+72]
	mov	DWORD PTR _node$[ebp], eax

; 2817 : 	unsigned long n = flt->name.nbrows;

	mov	ecx, DWORD PTR _flt$[ebp]
	mov	edx, DWORD PTR [ecx]
	mov	DWORD PTR _n$[ebp], edx

; 2818 : 
; 2819 : 	/* Initialize parsing */
; 2820 : 	if(!field || !sz_field || !*field) RETURN_OK;

	cmp	DWORD PTR _field$[ebp], 0
	je	SHORT $L74223
	cmp	DWORD PTR _sz_field$[ebp], 0
	je	SHORT $L74223
	mov	eax, DWORD PTR _field$[ebp]
	movsx	ecx, BYTE PTR [eax]
	test	ecx, ecx
	jne	SHORT $L74222
$L74223:
	jmp	$eva_noerr$74224
$L74222:

; 2821 : 	DYNTAB_ADD(&flt->name, n, 0, field, sz_field, NO_CONV);

	push	0
	push	0
	mov	edx, DWORD PTR _sz_field$[ebp]
	push	edx
	mov	eax, DWORD PTR _field$[ebp]
	push	eax
	push	0
	mov	ecx, DWORD PTR _n$[ebp]
	push	ecx
	mov	edx, DWORD PTR _flt$[ebp]
	push	edx
	call	_dyntab_add
	add	esp, 28					; 0000001cH
	test	eax, eax
	je	SHORT $L74226
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29872], OFFSET FLAT:$SG74228
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 2821		; 00000b05H
	jmp	$eva_err$74229
$L74226:

; 2822 : 	field = dyntab_val(&flt->name, n, 0);

	push	0
	mov	edx, DWORD PTR _n$[ebp]
	push	edx
	mov	eax, DWORD PTR _flt$[ebp]
	push	eax
	call	_dyntab_val
	add	esp, 12					; 0000000cH
	mov	DWORD PTR _field$[ebp], eax

; 2823 : 	sz_field = dyntab_sz(&flt->name, n, 0);

	push	0
	mov	ecx, DWORD PTR _n$[ebp]
	push	ecx
	mov	edx, DWORD PTR _flt$[ebp]
	push	edx
	call	_dyntab_sz
	add	esp, 12					; 0000000cH
	mov	DWORD PTR _sz_field$[ebp], eax

; 2824 : 	SEARCH_FIELDEXPR_OP(field);

	push	46					; 0000002eH
	mov	eax, DWORD PTR _field$[ebp]
	push	eax
	call	_strchr
	add	esp, 8
	mov	DWORD PTR _dotsep$[ebp], eax
	push	OFFSET FLAT:$SG74230
	mov	ecx, DWORD PTR _field$[ebp]
	push	ecx
	call	_strstr
	add	esp, 8
	mov	DWORD PTR _reldir$[ebp], eax
	push	OFFSET FLAT:$SG74231
	mov	edx, DWORD PTR _field$[ebp]
	push	edx
	call	_strstr
	add	esp, 8
	mov	DWORD PTR _relrev$[ebp], eax
	cmp	DWORD PTR _reldir$[ebp], 0
	je	SHORT $L74537
	cmp	DWORD PTR _relrev$[ebp], 0
	je	SHORT $L74536
	mov	eax, DWORD PTR _reldir$[ebp]
	cmp	eax, DWORD PTR _relrev$[ebp]
	jae	SHORT $L74537
$L74536:
	mov	ecx, DWORD PTR _reldir$[ebp]
	mov	DWORD PTR -64+[ebp], ecx
	jmp	SHORT $L74538
$L74537:
	mov	edx, DWORD PTR _relrev$[ebp]
	mov	DWORD PTR -64+[ebp], edx
$L74538:
	mov	eax, DWORD PTR -64+[ebp]
	mov	DWORD PTR _relop$[ebp], eax
	push	40					; 00000028H
	mov	ecx, DWORD PTR _field$[ebp]
	push	ecx
	call	_strchr
	add	esp, 8
	mov	DWORD PTR _paropn$[ebp], eax
	cmp	DWORD PTR _dotsep$[ebp], 0
	je	SHORT $L74540
	cmp	DWORD PTR _relop$[ebp], 0
	je	SHORT $L74539
	mov	edx, DWORD PTR _dotsep$[ebp]
	cmp	edx, DWORD PTR _relop$[ebp]
	jae	SHORT $L74540
$L74539:
	mov	eax, DWORD PTR _dotsep$[ebp]
	mov	DWORD PTR -68+[ebp], eax
	jmp	SHORT $L74541
$L74540:
	mov	ecx, DWORD PTR _relop$[ebp]
	mov	DWORD PTR -68+[ebp], ecx
$L74541:
	mov	edx, DWORD PTR -68+[ebp]
	mov	DWORD PTR _oper$[ebp], edx

; 2825 : 	node->srcjoin = flt->srcjoin;

	mov	eax, DWORD PTR _node$[ebp]
	mov	ecx, DWORD PTR _flt$[ebp]
	mov	edx, DWORD PTR [ecx+64]
	mov	DWORD PTR [eax+56], edx

; 2826 : 
; 2827 : 	/* Disable optimization - USE STRAIGHT_JOIN */
; 2828 : 	/*flt->b_straightjoin = 1;*/
; 2829 : 
; 2830 : 	/* Handle group function */
; 2831 : 	if(paropn && paropn[1] != ')')

	cmp	DWORD PTR _paropn$[ebp], 0
	je	$L74232
	mov	eax, DWORD PTR _paropn$[ebp]
	movsx	ecx, BYTE PTR [eax+1]
	cmp	ecx, 41					; 00000029H
	je	$L74232

; 2833 : 		/* Function must enclose the rest of the expression - return empty result if not */
; 2834 : 		if(paropn < field + 2 || field[sz_field - 1] != ')' || (relop && paropn > relop) || (dotsep && paropn > dotsep))

	mov	edx, DWORD PTR _field$[ebp]
	add	edx, 2
	cmp	DWORD PTR _paropn$[ebp], edx
	jb	SHORT $L74234
	mov	eax, DWORD PTR _field$[ebp]
	add	eax, DWORD PTR _sz_field$[ebp]
	movsx	ecx, BYTE PTR [eax-1]
	cmp	ecx, 41					; 00000029H
	jne	SHORT $L74234
	cmp	DWORD PTR _relop$[ebp], 0
	je	SHORT $L74235
	mov	edx, DWORD PTR _paropn$[ebp]
	cmp	edx, DWORD PTR _relop$[ebp]
	ja	SHORT $L74234
$L74235:
	cmp	DWORD PTR _dotsep$[ebp], 0
	je	SHORT $L74233
	mov	eax, DWORD PTR _paropn$[ebp]
	cmp	eax, DWORD PTR _dotsep$[ebp]
	jbe	SHORT $L74233
$L74234:

; 2835 : 			RETURN_FILTER_ERROR("Group function : invalid position or parentheses");

	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29872], OFFSET FLAT:$SG74237
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 2835		; 00000b13H
	jmp	$eva_err$74229
$L74233:

; 2836 : 		flt->b_oper = 1;

	mov	eax, DWORD PTR _flt$[ebp]
	mov	DWORD PTR [eax+4432], 1

; 2837 : 		DYNBUF_ADD(&flt->groupfn, field, paropn - field, NO_CONV);

	push	0
	push	0
	mov	ecx, DWORD PTR _paropn$[ebp]
	sub	ecx, DWORD PTR _field$[ebp]
	push	ecx
	mov	edx, DWORD PTR _field$[ebp]
	push	edx
	mov	eax, DWORD PTR _flt$[ebp]
	add	eax, 44					; 0000002cH
	push	eax
	call	_dynbuf_add
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L74239
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29872], OFFSET FLAT:$SG74241
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 2837		; 00000b15H
	jmp	$eva_err$74229
$L74239:

; 2838 : 		sz_field -= 2 + paropn - field;

	mov	eax, DWORD PTR _paropn$[ebp]
	add	eax, 2
	sub	eax, DWORD PTR _field$[ebp]
	mov	ecx, DWORD PTR _sz_field$[ebp]
	sub	ecx, eax
	mov	DWORD PTR _sz_field$[ebp], ecx

; 2839 : 		field = paropn + 1;

	mov	edx, DWORD PTR _paropn$[ebp]
	add	edx, 1
	mov	DWORD PTR _field$[ebp], edx
$L74232:

; 2841 : 	DYNBUF_ADD(&nextfield, field, sz_field, NO_CONV);

	push	0
	push	0
	mov	eax, DWORD PTR _sz_field$[ebp]
	push	eax
	mov	ecx, DWORD PTR _field$[ebp]
	push	ecx
	lea	edx, DWORD PTR _nextfield$[ebp]
	push	edx
	call	_dynbuf_add
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L74243
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29872], OFFSET FLAT:$SG74245
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 2841		; 00000b19H
	jmp	$eva_err$74229
$L74243:

; 2842 : 	field = nextfield->data;

	mov	edx, DWORD PTR _nextfield$[ebp]
	add	edx, 8
	mov	DWORD PTR _field$[ebp], edx

; 2843 : 
; 2844 : 	/* Parse expression : build nodes with field, modifiers & operators */
; 2845 : 	parse = field;

	mov	eax, DWORD PTR _field$[ebp]
	mov	DWORD PTR _parse$[ebp], eax
$L74247:

; 2846 : 	while(*parse)

	mov	ecx, DWORD PTR _parse$[ebp]
	movsx	edx, BYTE PTR [ecx]
	test	edx, edx
	je	$L74248

; 2848 : 		/* Look for operators */
; 2849 : 		int b_usedel = 0;

	mov	DWORD PTR _b_usedel$74249[ebp], 0

; 2850 : 		SEARCH_FIELDEXPR_OP(parse);

	push	46					; 0000002eH
	mov	eax, DWORD PTR _parse$[ebp]
	push	eax
	call	_strchr
	add	esp, 8
	mov	DWORD PTR _dotsep$[ebp], eax
	push	OFFSET FLAT:$SG74250
	mov	ecx, DWORD PTR _parse$[ebp]
	push	ecx
	call	_strstr
	add	esp, 8
	mov	DWORD PTR _reldir$[ebp], eax
	push	OFFSET FLAT:$SG74251
	mov	edx, DWORD PTR _parse$[ebp]
	push	edx
	call	_strstr
	add	esp, 8
	mov	DWORD PTR _relrev$[ebp], eax
	cmp	DWORD PTR _reldir$[ebp], 0
	je	SHORT $L74543
	cmp	DWORD PTR _relrev$[ebp], 0
	je	SHORT $L74542
	mov	eax, DWORD PTR _reldir$[ebp]
	cmp	eax, DWORD PTR _relrev$[ebp]
	jae	SHORT $L74543
$L74542:
	mov	ecx, DWORD PTR _reldir$[ebp]
	mov	DWORD PTR -72+[ebp], ecx
	jmp	SHORT $L74544
$L74543:
	mov	edx, DWORD PTR _relrev$[ebp]
	mov	DWORD PTR -72+[ebp], edx
$L74544:
	mov	eax, DWORD PTR -72+[ebp]
	mov	DWORD PTR _relop$[ebp], eax
	push	40					; 00000028H
	mov	ecx, DWORD PTR _parse$[ebp]
	push	ecx
	call	_strchr
	add	esp, 8
	mov	DWORD PTR _paropn$[ebp], eax
	cmp	DWORD PTR _dotsep$[ebp], 0
	je	SHORT $L74546
	cmp	DWORD PTR _relop$[ebp], 0
	je	SHORT $L74545
	mov	edx, DWORD PTR _dotsep$[ebp]
	cmp	edx, DWORD PTR _relop$[ebp]
	jae	SHORT $L74546
$L74545:
	mov	eax, DWORD PTR _dotsep$[ebp]
	mov	DWORD PTR -76+[ebp], eax
	jmp	SHORT $L74547
$L74546:
	mov	ecx, DWORD PTR _relop$[ebp]
	mov	DWORD PTR -76+[ebp], ecx
$L74547:
	mov	edx, DWORD PTR -76+[ebp]
	mov	DWORD PTR _oper$[ebp], edx

; 2851 : 		next = oper ? oper : field + sz_field;

	cmp	DWORD PTR _oper$[ebp], 0
	je	SHORT $L74548
	mov	eax, DWORD PTR _oper$[ebp]
	mov	DWORD PTR -80+[ebp], eax
	jmp	SHORT $L74549
$L74548:
	mov	ecx, DWORD PTR _field$[ebp]
	add	ecx, DWORD PTR _sz_field$[ebp]
	mov	DWORD PTR -80+[ebp], ecx
$L74549:
	mov	edx, DWORD PTR -80+[ebp]
	mov	DWORD PTR _next$[ebp], edx

; 2852 : 
; 2853 : 		/* Add field to filter node */
; 2854 : 		if(next > parse)

	mov	eax, DWORD PTR _next$[ebp]
	cmp	eax, DWORD PTR _parse$[ebp]
	jbe	$L74268

; 2856 : 			/* Read multiple fields separated with a comma */
; 2857 : 			char *field = parse;

	mov	ecx, DWORD PTR _parse$[ebp]
	mov	DWORD PTR _field$74253[ebp], ecx

; 2858 : 			if(node->field.nbrows)	RETURN_FILTER_ERROR("Multiple fields sequence in same node");

	mov	edx, DWORD PTR _node$[ebp]
	cmp	DWORD PTR [edx], 0
	je	SHORT $L74254
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29872], OFFSET FLAT:$SG74256
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 2858		; 00000b2aH
	jmp	$eva_err$74229
$L74254:

; 2861 : 				char *comma = strchr(field, ',');

	push	44					; 0000002cH
	mov	edx, DWORD PTR _field$74253[ebp]
	push	edx
	call	_strchr
	add	esp, 8
	mov	DWORD PTR _comma$74260[ebp], eax

; 2862 : 				if(!comma || comma > next) comma = next;

	cmp	DWORD PTR _comma$74260[ebp], 0
	je	SHORT $L74262
	mov	eax, DWORD PTR _comma$74260[ebp]
	cmp	eax, DWORD PTR _next$[ebp]
	jbe	SHORT $L74261
$L74262:
	mov	ecx, DWORD PTR _next$[ebp]
	mov	DWORD PTR _comma$74260[ebp], ecx
$L74261:

; 2863 : 				if(comma > field) DYNTAB_ADD(&node->field, node->field.nbrows, 0, field, comma - field, NO_CONV);

	mov	edx, DWORD PTR _comma$74260[ebp]
	cmp	edx, DWORD PTR _field$74253[ebp]
	jbe	SHORT $L74265
	push	0
	push	0
	mov	eax, DWORD PTR _comma$74260[ebp]
	sub	eax, DWORD PTR _field$74253[ebp]
	push	eax
	mov	ecx, DWORD PTR _field$74253[ebp]
	push	ecx
	push	0
	mov	edx, DWORD PTR _node$[ebp]
	mov	eax, DWORD PTR [edx]
	push	eax
	mov	ecx, DWORD PTR _node$[ebp]
	push	ecx
	call	_dyntab_add
	add	esp, 28					; 0000001cH
	test	eax, eax
	je	SHORT $L74265
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29872], OFFSET FLAT:$SG74267
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 2863		; 00000b2fH
	jmp	$eva_err$74229
$L74265:

; 2864 : 				field = comma + 1;

	mov	ecx, DWORD PTR _comma$74260[ebp]
	add	ecx, 1
	mov	DWORD PTR _field$74253[ebp], ecx

; 2866 : 			while(*field && field < next);

	mov	edx, DWORD PTR _field$74253[ebp]
	movsx	eax, BYTE PTR [edx]
	test	eax, eax
	je	SHORT $L74268
	mov	ecx, DWORD PTR _field$74253[ebp]
	cmp	ecx, DWORD PTR _next$[ebp]
	jb	$L74254
$L74268:

; 2868 : 
; 2869 : 		/* Handle dot operator */
; 2870 : 		if(oper && oper == dotsep)

	cmp	DWORD PTR _oper$[ebp], 0
	je	$L74269
	mov	edx, DWORD PTR _oper$[ebp]
	cmp	edx, DWORD PTR _dotsep$[ebp]
	jne	$L74269

; 2872 : 			if(node->modif != F_None) RETURN_FILTER_ERROR("Multiple field modifiers not allowed");

	mov	eax, DWORD PTR _node$[ebp]
	cmp	DWORD PTR [eax+20], 0
	je	SHORT $L74270
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29872], OFFSET FLAT:$SG74272
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 2872		; 00000b38H
	jmp	$eva_err$74229
$L74270:

; 2873 : 			next = relop ? relop : field + sz_field;

	cmp	DWORD PTR _relop$[ebp], 0
	je	SHORT $L74550
	mov	eax, DWORD PTR _relop$[ebp]
	mov	DWORD PTR -84+[ebp], eax
	jmp	SHORT $L74551
$L74550:
	mov	ecx, DWORD PTR _field$[ebp]
	add	ecx, DWORD PTR _sz_field$[ebp]
	mov	DWORD PTR -84+[ebp], ecx
$L74551:
	mov	edx, DWORD PTR -84+[ebp]
	mov	DWORD PTR _next$[ebp], edx

; 2874 : 			M_FREE(modif);

	mov	eax, DWORD PTR _modif$[ebp]
	push	eax
	call	_mem_free
	add	esp, 4
	mov	DWORD PTR _modif$[ebp], 0

; 2875 : 			if(next > ++dotsep) DYNBUF_ADD(&modif, dotsep, next - dotsep, NO_CONV);

	mov	ecx, DWORD PTR _dotsep$[ebp]
	add	ecx, 1
	mov	DWORD PTR _dotsep$[ebp], ecx
	mov	edx, DWORD PTR _next$[ebp]
	cmp	edx, DWORD PTR _dotsep$[ebp]
	jbe	SHORT $L74275
	push	0
	push	0
	mov	eax, DWORD PTR _next$[ebp]
	sub	eax, DWORD PTR _dotsep$[ebp]
	push	eax
	mov	ecx, DWORD PTR _dotsep$[ebp]
	push	ecx
	lea	edx, DWORD PTR _modif$[ebp]
	push	edx
	call	_dynbuf_add
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L74275
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29872], OFFSET FLAT:$SG74277
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 2875		; 00000b3bH
	jmp	$eva_err$74229
$L74275:

; 2876 : 			parse = modif ? modif->data : "";

	cmp	DWORD PTR _modif$[ebp], 0
	je	SHORT $L74552
	mov	edx, DWORD PTR _modif$[ebp]
	add	edx, 8
	mov	DWORD PTR -88+[ebp], edx
	jmp	SHORT $L74553
$L74552:
	mov	DWORD PTR -88+[ebp], OFFSET FLAT:$SG74278
$L74553:
	mov	eax, DWORD PTR -88+[ebp]
	mov	DWORD PTR _parse$[ebp], eax

; 2877 : 			node->modif = qry_parse_field_modifier(parse);

	mov	ecx, DWORD PTR _parse$[ebp]
	push	ecx
	call	_qry_parse_field_modifier
	add	esp, 4
	mov	edx, DWORD PTR _node$[ebp]
	mov	DWORD PTR [edx+20], eax

; 2878 : 			if(node->modif == F_None) RETURN_FILTER_ERROR("Invalid field modifier");

	mov	eax, DWORD PTR _node$[ebp]
	cmp	DWORD PTR [eax+20], 0
	jne	SHORT $L74279
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29872], OFFSET FLAT:$SG74281
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 2878		; 00000b3eH
	jmp	$eva_err$74229
$L74279:

; 2879 : 			b_usedel = node->modif == F_DateDel || node->modif == F_WhoDel;

	mov	eax, DWORD PTR _node$[ebp]
	cmp	DWORD PTR [eax+20], 12			; 0000000cH
	je	SHORT $L74554
	mov	ecx, DWORD PTR _node$[ebp]
	cmp	DWORD PTR [ecx+20], 13			; 0000000dH
	je	SHORT $L74554
	mov	DWORD PTR -92+[ebp], 0
	jmp	SHORT $L74555
$L74554:
	mov	DWORD PTR -92+[ebp], 1
$L74555:
	mov	edx, DWORD PTR -92+[ebp]
	mov	DWORD PTR _b_usedel$74249[ebp], edx

; 2881 : 
; 2882 : 		/* Handle relation operators */
; 2883 : 		else if(oper && oper == relop)

	jmp	$L74288
$L74269:
	cmp	DWORD PTR _oper$[ebp], 0
	je	$L74283
	mov	eax, DWORD PTR _oper$[ebp]
	cmp	eax, DWORD PTR _relop$[ebp]
	jne	$L74283

; 2885 : 			/* Error if invalid modifier */
; 2886 : 			if(node->modif != F_None && node->modif != F_WhoCr && node->modif != F_WhoDel)

	mov	ecx, DWORD PTR _node$[ebp]
	cmp	DWORD PTR [ecx+20], 0
	je	SHORT $L74284
	mov	edx, DWORD PTR _node$[ebp]
	cmp	DWORD PTR [edx+20], 11			; 0000000bH
	je	SHORT $L74284
	mov	eax, DWORD PTR _node$[ebp]
	cmp	DWORD PTR [eax+20], 13			; 0000000dH
	je	SHORT $L74284

; 2887 : 				RETURN_FILTER_ERROR("Invalid modifier before relation");

	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29872], OFFSET FLAT:$SG74286
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 2887		; 00000b47H
	jmp	$eva_err$74229
$L74284:

; 2888 : 			node->rel = relop == reldir ? RelDirect : RelReverse;

	mov	eax, DWORD PTR _relop$[ebp]
	xor	ecx, ecx
	cmp	eax, DWORD PTR _reldir$[ebp]
	setne	cl
	inc	ecx
	mov	edx, DWORD PTR _node$[ebp]
	mov	DWORD PTR [edx+52], ecx

; 2889 : 			flt->srcjoin = flt->nbnode;

	mov	eax, DWORD PTR _flt$[ebp]
	mov	ecx, DWORD PTR _flt$[ebp]
	mov	edx, DWORD PTR [ecx+4424]
	mov	DWORD PTR [eax+64], edx

; 2890 : 			node++;

	mov	eax, DWORD PTR _node$[ebp]
	add	eax, 136				; 00000088H
	mov	DWORD PTR _node$[ebp], eax

; 2891 : 			flt->nbnode++;

	mov	ecx, DWORD PTR _flt$[ebp]
	mov	edx, DWORD PTR [ecx+4424]
	add	edx, 1
	mov	eax, DWORD PTR _flt$[ebp]
	mov	DWORD PTR [eax+4424], edx

; 2892 : 			node->srcjoin = flt->srcjoin;

	mov	ecx, DWORD PTR _node$[ebp]
	mov	edx, DWORD PTR _flt$[ebp]
	mov	eax, DWORD PTR [edx+64]
	mov	DWORD PTR [ecx+56], eax

; 2893 : 			next = relop + 2;

	mov	ecx, DWORD PTR _relop$[ebp]
	add	ecx, 2
	mov	DWORD PTR _next$[ebp], ecx

; 2895 : 		else if(oper)

	jmp	SHORT $L74288
$L74283:
	cmp	DWORD PTR _oper$[ebp], 0
	je	SHORT $L74288

; 2897 : 			RETURN_FILTER_ERROR("Invalid operator");

	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29872], OFFSET FLAT:$SG74290
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 2897		; 00000b51H
	jmp	$eva_err$74229
$L74288:

; 2899 : 
; 2900 : 		/* Allow deleted values if Del modifier used */
; 2901 : 		if(b_usedel) strcpy(flt->node[flt->nbnode ? flt->nbnode - 1 : 0].datemax, cntxt->timestamp);

	cmp	DWORD PTR _b_usedel$74249[ebp], 0
	je	SHORT $L74291
	mov	ecx, DWORD PTR _flt$[ebp]
	cmp	DWORD PTR [ecx+4424], 0
	je	SHORT $L74556
	mov	edx, DWORD PTR _flt$[ebp]
	mov	eax, DWORD PTR [edx+4424]
	sub	eax, 1
	mov	DWORD PTR -96+[ebp], eax
	jmp	SHORT $L74557
$L74556:
	mov	DWORD PTR -96+[ebp], 0
$L74557:
	mov	ecx, DWORD PTR _cntxt$[ebp]
	add	ecx, 29704				; 00007408H
	push	ecx
	mov	edx, DWORD PTR -96+[ebp]
	imul	edx, 136				; 00000088H
	mov	eax, DWORD PTR _flt$[ebp]
	lea	ecx, DWORD PTR [eax+edx+152]
	push	ecx
	call	_strcpy
	add	esp, 8
$L74291:

; 2902 : 
; 2903 : 		parse = next;

	mov	edx, DWORD PTR _next$[ebp]
	mov	DWORD PTR _parse$[ebp], edx

; 2904 : 	}

	jmp	$L74247
$L74248:

; 2905 : 	flt->b_oper = flt->nbnode || flt->groupfn || flt->node[0].modif != F_None;

	mov	eax, DWORD PTR _flt$[ebp]
	cmp	DWORD PTR [eax+4424], 0
	jne	SHORT $L74558
	mov	ecx, DWORD PTR _flt$[ebp]
	cmp	DWORD PTR [ecx+44], 0
	jne	SHORT $L74558
	mov	edx, DWORD PTR _flt$[ebp]
	cmp	DWORD PTR [edx+92], 0
	jne	SHORT $L74558
	mov	DWORD PTR -100+[ebp], 0
	jmp	SHORT $L74559
$L74558:
	mov	DWORD PTR -100+[ebp], 1
$L74559:
	mov	eax, DWORD PTR _flt$[ebp]
	mov	ecx, DWORD PTR -100+[ebp]
	mov	DWORD PTR [eax+4432], ecx

; 2906 : 	if(!EMPTY_NODE(node)) flt->nbnode++;

	mov	edx, DWORD PTR _node$[ebp]
	cmp	DWORD PTR [edx], 0
	jne	SHORT $L74293
	mov	eax, DWORD PTR _node$[ebp]
	cmp	DWORD PTR [eax+124], 0
	jne	SHORT $L74293
	mov	ecx, DWORD PTR _node$[ebp]
	cmp	DWORD PTR [ecx+24], 0
	jne	SHORT $L74293
	mov	edx, DWORD PTR _node$[ebp]
	cmp	DWORD PTR [edx+20], 0
	je	SHORT $eva_noerr$74224
$L74293:
	mov	eax, DWORD PTR _flt$[ebp]
	mov	ecx, DWORD PTR [eax+4424]
	add	ecx, 1
	mov	edx, DWORD PTR _flt$[ebp]
	mov	DWORD PTR [edx+4424], ecx
$eva_noerr$74224:

; 2907 : 
; 2908 : 	RETURN_OK_CLEANUP;

	push	0
	push	OFFSET FLAT:$SG74294
	push	OFFSET FLAT:$SG74295
	mov	eax, DWORD PTR _cntxt$[ebp]
	push	eax
	call	_err_clear
	add	esp, 16					; 00000010H
$eva_err$74229:
	mov	ecx, DWORD PTR _cntxt$[ebp]
	cmp	DWORD PTR [ecx+29872], 0
	je	SHORT $L74296
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	eax, DWORD PTR [edx+29900]
	push	eax
	push	OFFSET FLAT:$SG74297
	push	OFFSET FLAT:$SG74298
	mov	ecx, DWORD PTR _cntxt$[ebp]
	push	ecx
	call	_err_add_context
	add	esp, 16					; 00000010H
$L74296:
	mov	edx, DWORD PTR _nextfield$[ebp]
	push	edx
	call	_mem_free
	add	esp, 4
	mov	DWORD PTR _nextfield$[ebp], 0
	mov	eax, DWORD PTR _modif$[ebp]
	push	eax
	call	_mem_free
	add	esp, 4
	mov	DWORD PTR _modif$[ebp], 0
	mov	ecx, DWORD PTR _cntxt$[ebp]
	cmp	DWORD PTR [ecx+29872], 0
	je	SHORT $L74299
	mov	edx, DWORD PTR _flt$[ebp]
	push	edx
	mov	eax, DWORD PTR _cntxt$[ebp]
	add	eax, 29876				; 000074b4H
	push	eax
	call	_err_print_filter
	add	esp, 8
$L74299:
	mov	ecx, DWORD PTR _cntxt$[ebp]
	xor	eax, eax
	cmp	DWORD PTR [ecx+29872], 0
	setne	al

; 2909 : }

	mov	esp, ebp
	pop	ebp
	ret	0
_qry_parse_fieldexpr_nodes ENDP
_TEXT	ENDS
END
