	TITLE	D:\Travail\ABI\EVA\V4.0\CGI\Brunix-2016\action_utils.c
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
PUBLIC	_form_get_fields_values
PUBLIC	_form_get_field_values
EXTRN	_dyntab_free:NEAR
EXTRN	_strlen:NEAR
EXTRN	_dyntab_from_list:NEAR
EXTRN	_err_add_context:NEAR
EXTRN	_err_clear:NEAR
_DATA	SEGMENT
$SG70219 DB	',', 00H
	ORG $+2
$SG70221 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70225 DB	'D:\Travail\ABI\EVA\V4.0\CGI\Brunix-2016\action_utils.c', 00H
	ORG $+1
$SG70226 DB	'form_get_field_values', 00H
	ORG $+2
$SG70228 DB	'D:\Travail\ABI\EVA\V4.0\CGI\Brunix-2016\action_utils.c', 00H
	ORG $+1
$SG70229 DB	'form_get_field_values', 00H
_DATA	ENDS
_TEXT	SEGMENT
_cntxt$ = 8
_res$ = 12
_fieldlist$ = 16
_idform$ = 20
_idobj$ = 24
_fields$ = -20
_form_get_field_values PROC NEAR

; 28   : ){

	push	ebp
	mov	ebp, esp
	sub	esp, 20					; 00000014H

; 29   : 	DynTable fields = {0};

	mov	DWORD PTR _fields$[ebp], 0
	xor	eax, eax
	mov	DWORD PTR _fields$[ebp+4], eax
	mov	DWORD PTR _fields$[ebp+8], eax
	mov	DWORD PTR _fields$[ebp+12], eax
	mov	DWORD PTR _fields$[ebp+16], eax

; 30   : 
; 31   : 	/* Check params & prepare fields list */
; 32   : 	if(!fieldlist || !*fieldlist) return 0;

	cmp	DWORD PTR _fieldlist$[ebp], 0
	je	SHORT $L70217
	mov	ecx, DWORD PTR _fieldlist$[ebp]
	movsx	edx, BYTE PTR [ecx]
	test	edx, edx
	jne	SHORT $L70216
$L70217:
	xor	eax, eax
	jmp	$L70214
$L70216:

; 33   : 	if(dyntab_from_list(&fields, fieldlist, strlen(fieldlist), ",", 0, 0)) RETURN_ERR_MEMORY;

	push	0
	push	0
	push	OFFSET FLAT:$SG70219
	mov	eax, DWORD PTR _fieldlist$[ebp]
	push	eax
	call	_strlen
	add	esp, 4
	push	eax
	mov	ecx, DWORD PTR _fieldlist$[ebp]
	push	ecx
	lea	edx, DWORD PTR _fields$[ebp]
	push	edx
	call	_dyntab_from_list
	add	esp, 24					; 00000018H
	test	eax, eax
	je	SHORT $L70218
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29872], OFFSET FLAT:$SG70221
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 33		; 00000021H
	jmp	SHORT $eva_err$70222
$L70218:

; 34   : 
; 35   : 	/* Call root function */
; 36   : 	if(form_get_fields_values(cntxt, res, &fields, idform, idobj)) STACK_ERROR;

	mov	edx, DWORD PTR _idobj$[ebp]
	push	edx
	mov	eax, DWORD PTR _idform$[ebp]
	push	eax
	lea	ecx, DWORD PTR _fields$[ebp]
	push	ecx
	mov	edx, DWORD PTR _res$[ebp]
	push	edx
	mov	eax, DWORD PTR _cntxt$[ebp]
	push	eax
	call	_form_get_fields_values
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $eva_noerr$70224
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 36		; 00000024H
	jmp	SHORT $eva_err$70222
$eva_noerr$70224:

; 37   : 
; 38   : 	RETURN_OK_CLEANUP;

	push	0
	push	OFFSET FLAT:$SG70225
	push	OFFSET FLAT:$SG70226
	mov	edx, DWORD PTR _cntxt$[ebp]
	push	edx
	call	_err_clear
	add	esp, 16					; 00000010H
$eva_err$70222:
	mov	eax, DWORD PTR _cntxt$[ebp]
	cmp	DWORD PTR [eax+29872], 0
	je	SHORT $L70227
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	edx, DWORD PTR [ecx+29900]
	push	edx
	push	OFFSET FLAT:$SG70228
	push	OFFSET FLAT:$SG70229
	mov	eax, DWORD PTR _cntxt$[ebp]
	push	eax
	call	_err_add_context
	add	esp, 16					; 00000010H
$L70227:
	lea	ecx, DWORD PTR _fields$[ebp]
	push	ecx
	call	_dyntab_free
	add	esp, 4
	mov	edx, DWORD PTR _cntxt$[ebp]
	xor	eax, eax
	cmp	DWORD PTR [edx+29872], 0
	setne	al
$L70214:

; 39   : }

	mov	esp, ebp
	pop	ebp
	ret	0
_form_get_field_values ENDP
_TEXT	ENDS
EXTRN	_cgi_filter_values:NEAR
EXTRN	_strtoul:NEAR
EXTRN	_qry_obj_field:NEAR
EXTRN	_dyntab_sz:NEAR
EXTRN	_dyntab_val:NEAR
EXTRN	_dyntab_cell:NEAR
EXTRN	_dyntab_copy:NEAR
EXTRN	_strcmp:NEAR
_BSS	SEGMENT
$SG70281 DB	01H DUP (?)
_BSS	ENDS
_DATA	SEGMENT
	ORG $+2
$SG70277 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70288 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70290 DB	'D:\Travail\ABI\EVA\V4.0\CGI\Brunix-2016\action_utils.c', 00H
	ORG $+1
$SG70291 DB	'form_get_fields_values', 00H
	ORG $+1
$SG70293 DB	'D:\Travail\ABI\EVA\V4.0\CGI\Brunix-2016\action_utils.c', 00H
	ORG $+1
$SG70294 DB	'form_get_fields_values', 00H
_DATA	ENDS
_TEXT	SEGMENT
_cntxt$ = 8
_res$ = 12
_fields$ = 16
_idform$ = 20
_idobj$ = 24
_form$ = -4
_values$ = -40
_i$ = -16
_j$ = -20
_k$ = -44
_curform$ = -12
_curobj$ = -8
_field$70259 = -48
_val$70261 = -52
_form_get_fields_values PROC NEAR

; 55   : ){

	push	ebp
	mov	ebp, esp
	sub	esp, 72					; 00000048H

; 56   : 	EVA_form *form = cntxt->form;

	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	ecx, DWORD PTR [eax+80]
	mov	DWORD PTR _form$[ebp], ecx

; 57   : 	DynTable values = {0};

	mov	DWORD PTR _values$[ebp], 0
	xor	edx, edx
	mov	DWORD PTR _values$[ebp+4], edx
	mov	DWORD PTR _values$[ebp+8], edx
	mov	DWORD PTR _values$[ebp+12], edx
	mov	DWORD PTR _values$[ebp+16], edx

; 58   : 	unsigned long i = form ? form->nb_ctrl : 0, j, k;

	cmp	DWORD PTR _form$[ebp], 0
	je	SHORT $L71025
	mov	eax, DWORD PTR _form$[ebp]
	mov	ecx, DWORD PTR [eax+4]
	mov	DWORD PTR -56+[ebp], ecx
	jmp	SHORT $L71026
$L71025:
	mov	DWORD PTR -56+[ebp], 0
$L71026:
	mov	edx, DWORD PTR -56+[ebp]
	mov	DWORD PTR _i$[ebp], edx

; 59   : 	unsigned long curform = form ? DYNTAB_TOUL(&form->id_form) : 0;

	cmp	DWORD PTR _form$[ebp], 0
	je	SHORT $L71027
	push	10					; 0000000aH
	push	0
	push	0
	push	0
	mov	eax, DWORD PTR _form$[ebp]
	add	eax, 12					; 0000000cH
	push	eax
	call	_dyntab_val
	add	esp, 12					; 0000000cH
	push	eax
	call	_strtoul
	add	esp, 12					; 0000000cH
	mov	DWORD PTR -60+[ebp], eax
	jmp	SHORT $L71028
$L71027:
	mov	DWORD PTR -60+[ebp], 0
$L71028:
	mov	ecx, DWORD PTR -60+[ebp]
	mov	DWORD PTR _curform$[ebp], ecx

; 60   : 	unsigned long curobj = form ? DYNTAB_TOUL(&form->id_obj) : 0;

	cmp	DWORD PTR _form$[ebp], 0
	je	SHORT $L71029
	push	10					; 0000000aH
	push	0
	push	0
	push	0
	mov	edx, DWORD PTR _form$[ebp]
	add	edx, 32					; 00000020H
	push	edx
	call	_dyntab_val
	add	esp, 12					; 0000000cH
	push	eax
	call	_strtoul
	add	esp, 12					; 0000000cH
	mov	DWORD PTR -64+[ebp], eax
	jmp	SHORT $L71030
$L71029:
	mov	DWORD PTR -64+[ebp], 0
$L71030:
	mov	eax, DWORD PTR -64+[ebp]
	mov	DWORD PTR _curobj$[ebp], eax

; 61   : 
; 62   : 	/* Check params & prepare fields list */
; 63   : 	if(res) dyntab_free(res); else return 0;

	cmp	DWORD PTR _res$[ebp], 0
	je	SHORT $L70253
	mov	ecx, DWORD PTR _res$[ebp]
	push	ecx
	call	_dyntab_free
	add	esp, 4
	jmp	SHORT $L70254
$L70253:
	xor	eax, eax
	jmp	$L70243
$L70254:

; 64   : 	if(!idobj && !idform)

	cmp	DWORD PTR _idobj$[ebp], 0
	jne	SHORT $L70255
	cmp	DWORD PTR _idform$[ebp], 0
	jne	SHORT $L70255

; 66   : 		idobj = curobj;

	mov	edx, DWORD PTR _curobj$[ebp]
	mov	DWORD PTR _idobj$[ebp], edx

; 67   : 		idform = curform;

	mov	eax, DWORD PTR _curform$[ebp]
	mov	DWORD PTR _idform$[ebp], eax
$L70255:

; 69   : 
; 70   : 	/* For each field */
; 71   : 	for(k = 0; k < fields->nbrows; k++)

	mov	DWORD PTR _k$[ebp], 0
	jmp	SHORT $L70256
$L70257:
	mov	ecx, DWORD PTR _k$[ebp]
	add	ecx, 1
	mov	DWORD PTR _k$[ebp], ecx
$L70256:
	mov	edx, DWORD PTR _fields$[ebp]
	mov	eax, DWORD PTR _k$[ebp]
	cmp	eax, DWORD PTR [edx]
	jae	$eva_noerr$70289

; 73   : 		/* If working on current form : use control values first */
; 74   : 		char *field = dyntab_val(fields, k, 0);

	push	0
	mov	ecx, DWORD PTR _k$[ebp]
	push	ecx
	mov	edx, DWORD PTR _fields$[ebp]
	push	edx
	call	_dyntab_val
	add	esp, 12					; 0000000cH
	mov	DWORD PTR _field$70259[ebp], eax

; 75   : 		if(form && idform == curform && idobj == curobj)

	cmp	DWORD PTR _form$[ebp], 0
	je	$L70268
	mov	eax, DWORD PTR _idform$[ebp]
	cmp	eax, DWORD PTR _curform$[ebp]
	jne	$L70268
	mov	ecx, DWORD PTR _idobj$[ebp]
	cmp	ecx, DWORD PTR _curobj$[ebp]
	jne	$L70268

; 77   : 			/* Search for first control with same field that has values */
; 78   : 			DynTable *val = NULL;

	mov	DWORD PTR _val$70261[ebp], 0

; 79   : 			for(i = 0; i < form->nb_ctrl; i++)

	mov	DWORD PTR _i$[ebp], 0
	jmp	SHORT $L70263
$L70264:
	mov	edx, DWORD PTR _i$[ebp]
	add	edx, 1
	mov	DWORD PTR _i$[ebp], edx
$L70263:
	mov	eax, DWORD PTR _form$[ebp]
	mov	ecx, DWORD PTR _i$[ebp]
	cmp	ecx, DWORD PTR [eax+4]
	jae	$L70265

; 81   : 				val = form->ctrl[i].allval.nbrows ? &form->ctrl[i].allval : &form->ctrl[i].val;

	mov	edx, DWORD PTR _i$[ebp]
	imul	edx, 480				; 000001e0H
	mov	eax, DWORD PTR _form$[ebp]
	mov	ecx, DWORD PTR [eax]
	cmp	DWORD PTR [ecx+edx+124], 0
	je	SHORT $L71031
	mov	edx, DWORD PTR _i$[ebp]
	imul	edx, 480				; 000001e0H
	mov	eax, DWORD PTR _form$[ebp]
	mov	ecx, DWORD PTR [eax]
	lea	edx, DWORD PTR [ecx+edx+124]
	mov	DWORD PTR -68+[ebp], edx
	jmp	SHORT $L71032
$L71031:
	mov	eax, DWORD PTR _i$[ebp]
	imul	eax, 480				; 000001e0H
	mov	ecx, DWORD PTR _form$[ebp]
	mov	edx, DWORD PTR [ecx]
	lea	eax, DWORD PTR [edx+eax+64]
	mov	DWORD PTR -68+[ebp], eax
$L71032:
	mov	ecx, DWORD PTR -68+[ebp]
	mov	DWORD PTR _val$70261[ebp], ecx

; 82   : 				if(!strcmp(form->ctrl[i].FIELD, field) && (val->nbrows || form->ctrl[i].b_modified)) break;

	mov	edx, DWORD PTR _field$70259[ebp]
	push	edx
	mov	eax, DWORD PTR _i$[ebp]
	imul	eax, 480				; 000001e0H
	mov	ecx, DWORD PTR _form$[ebp]
	mov	edx, DWORD PTR [ecx]
	mov	eax, DWORD PTR [edx+eax+280]
	push	eax
	call	_strcmp
	add	esp, 8
	test	eax, eax
	jne	SHORT $L70266
	mov	ecx, DWORD PTR _val$70261[ebp]
	cmp	DWORD PTR [ecx], 0
	jne	SHORT $L70267
	mov	edx, DWORD PTR _i$[ebp]
	imul	edx, 480				; 000001e0H
	mov	eax, DWORD PTR _form$[ebp]
	mov	ecx, DWORD PTR [eax]
	cmp	DWORD PTR [ecx+edx+200], 0
	je	SHORT $L70266
$L70267:
	jmp	SHORT $L70265
$L70266:

; 83   : 			}

	jmp	$L70264
$L70265:

; 84   : 			if(i < form->nb_ctrl)

	mov	edx, DWORD PTR _form$[ebp]
	mov	eax, DWORD PTR _i$[ebp]
	cmp	eax, DWORD PTR [edx+4]
	jae	$L70268

; 86   : 				/* Control found : transfer values to result & return */
; 87   : 				if(form->Num || form->Line) val = &form->ctrl[i].val;

	mov	ecx, DWORD PTR _form$[ebp]
	cmp	DWORD PTR [ecx+236], 0
	jne	SHORT $L70270
	mov	edx, DWORD PTR _form$[ebp]
	cmp	DWORD PTR [edx+240], 0
	je	SHORT $L70269
$L70270:
	mov	eax, DWORD PTR _i$[ebp]
	imul	eax, 480				; 000001e0H
	mov	ecx, DWORD PTR _form$[ebp]
	mov	edx, DWORD PTR [ecx]
	lea	eax, DWORD PTR [edx+eax+64]
	mov	DWORD PTR _val$70261[ebp], eax
$L70269:

; 88   : 				for(j = 0; j < val->nbrows; j++) if(dyntab_sz(val, j, 0))

	mov	DWORD PTR _j$[ebp], 0
	jmp	SHORT $L70271
$L70272:
	mov	ecx, DWORD PTR _j$[ebp]
	add	ecx, 1
	mov	DWORD PTR _j$[ebp], ecx
$L70271:
	mov	edx, DWORD PTR _val$70261[ebp]
	mov	eax, DWORD PTR _j$[ebp]
	cmp	eax, DWORD PTR [edx]
	jae	SHORT $L70273
	push	0
	mov	ecx, DWORD PTR _j$[ebp]
	push	ecx
	mov	edx, DWORD PTR _val$70261[ebp]
	push	edx
	call	_dyntab_sz
	add	esp, 12					; 0000000cH
	test	eax, eax
	je	SHORT $L70275

; 89   : 					DYNTAB_SET_CELL(res, res->nbrows, 0, val, j, 0);

	push	0
	push	0
	mov	eax, DWORD PTR _j$[ebp]
	push	eax
	mov	ecx, DWORD PTR _val$70261[ebp]
	push	ecx
	call	_dyntab_cell
	add	esp, 12					; 0000000cH
	push	eax
	push	0
	mov	edx, DWORD PTR _res$[ebp]
	mov	eax, DWORD PTR [edx]
	push	eax
	mov	ecx, DWORD PTR _res$[ebp]
	push	ecx
	call	_dyntab_copy
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L70275
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29872], OFFSET FLAT:$SG70277
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 89		; 00000059H
	jmp	$eva_err$70278
$L70275:
	jmp	SHORT $L70272
$L70273:

; 90   : 				continue;

	jmp	$L70257
$L70268:

; 93   : 
; 94   : 		/* Read from CGI data or DB if no cgi value */
; 95   : 		if((cgi_filter_values(cntxt, &values, 'D', ~0UL, idobj ? ~0UL : idform, idobj, field, "", 0, 0)) ||(
; 96   : 			!values.nbrows && idobj && qry_obj_field(cntxt, &values, idobj, field)))

	cmp	DWORD PTR _idobj$[ebp], 0
	je	SHORT $L71033
	mov	DWORD PTR -72+[ebp], -1
	jmp	SHORT $L71034
$L71033:
	mov	ecx, DWORD PTR _idform$[ebp]
	mov	DWORD PTR -72+[ebp], ecx
$L71034:
	push	0
	push	0
	push	OFFSET FLAT:$SG70281
	mov	edx, DWORD PTR _field$70259[ebp]
	push	edx
	mov	eax, DWORD PTR _idobj$[ebp]
	push	eax
	mov	ecx, DWORD PTR -72+[ebp]
	push	ecx
	push	-1
	push	68					; 00000044H
	lea	edx, DWORD PTR _values$[ebp]
	push	edx
	mov	eax, DWORD PTR _cntxt$[ebp]
	push	eax
	call	_cgi_filter_values
	add	esp, 40					; 00000028H
	test	eax, eax
	jne	SHORT $L70280
	cmp	DWORD PTR _values$[ebp], 0
	jne	SHORT $L70279
	cmp	DWORD PTR _idobj$[ebp], 0
	je	SHORT $L70279
	mov	ecx, DWORD PTR _field$70259[ebp]
	push	ecx
	mov	edx, DWORD PTR _idobj$[ebp]
	push	edx
	lea	eax, DWORD PTR _values$[ebp]
	push	eax
	mov	ecx, DWORD PTR _cntxt$[ebp]
	push	ecx
	call	_qry_obj_field
	add	esp, 16					; 00000010H
	test	eax, eax
	je	SHORT $L70279
$L70280:

; 97   : 			STACK_ERROR;

	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 97		; 00000061H
	jmp	$eva_err$70278
$L70279:

; 98   : 		for(j = 0; j < values.nbrows; j++)

	mov	DWORD PTR _j$[ebp], 0
	jmp	SHORT $L70282
$L70283:
	mov	eax, DWORD PTR _j$[ebp]
	add	eax, 1
	mov	DWORD PTR _j$[ebp], eax
$L70282:
	mov	ecx, DWORD PTR _j$[ebp]
	cmp	ecx, DWORD PTR _values$[ebp]
	jae	SHORT $L70284

; 99   : 			if(dyntab_sz(&values, j, 0)) DYNTAB_ADD_CELL(res, res->nbrows, 0, &values, j, 0);

	push	0
	mov	edx, DWORD PTR _j$[ebp]
	push	edx
	lea	eax, DWORD PTR _values$[ebp]
	push	eax
	call	_dyntab_sz
	add	esp, 12					; 0000000cH
	test	eax, eax
	je	SHORT $L70286
	push	1
	push	0
	mov	ecx, DWORD PTR _j$[ebp]
	push	ecx
	lea	edx, DWORD PTR _values$[ebp]
	push	edx
	call	_dyntab_cell
	add	esp, 12					; 0000000cH
	push	eax
	push	0
	mov	eax, DWORD PTR _res$[ebp]
	mov	ecx, DWORD PTR [eax]
	push	ecx
	mov	edx, DWORD PTR _res$[ebp]
	push	edx
	call	_dyntab_copy
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L70286
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29872], OFFSET FLAT:$SG70288
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 99		; 00000063H
	jmp	SHORT $eva_err$70278
$L70286:
	jmp	SHORT $L70283
$L70284:

; 100  : 	}

	jmp	$L70257
$eva_noerr$70289:

; 101  : 
; 102  : 	RETURN_OK_CLEANUP;

	push	0
	push	OFFSET FLAT:$SG70290
	push	OFFSET FLAT:$SG70291
	mov	edx, DWORD PTR _cntxt$[ebp]
	push	edx
	call	_err_clear
	add	esp, 16					; 00000010H
$eva_err$70278:
	mov	eax, DWORD PTR _cntxt$[ebp]
	cmp	DWORD PTR [eax+29872], 0
	je	SHORT $L70292
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	edx, DWORD PTR [ecx+29900]
	push	edx
	push	OFFSET FLAT:$SG70293
	push	OFFSET FLAT:$SG70294
	mov	eax, DWORD PTR _cntxt$[ebp]
	push	eax
	call	_err_add_context
	add	esp, 16					; 00000010H
$L70292:
	lea	ecx, DWORD PTR _values$[ebp]
	push	ecx
	call	_dyntab_free
	add	esp, 4
	mov	edx, DWORD PTR _cntxt$[ebp]
	xor	eax, eax
	cmp	DWORD PTR [edx+29872], 0
	setne	al
$L70243:

; 103  : }

	mov	esp, ebp
	pop	ebp
	ret	0
_form_get_fields_values ENDP
_TEXT	ENDS
PUBLIC	_cgi_set_field_values
EXTRN	_cgi_build_name:NEAR
EXTRN	_cgi_add_inputold:NEAR
EXTRN	_cgi_add_input:NEAR
EXTRN	_mem_free:NEAR
EXTRN	_dynbuf_add:NEAR
EXTRN	_dyntab_cmp:NEAR
_BSS	SEGMENT
	ALIGN	4

$SG70335 DB	01H DUP (?)
	ALIGN	4

$SG70338 DB	01H DUP (?)
	ALIGN	4

$SG70389 DB	01H DUP (?)
_BSS	ENDS
_DATA	SEGMENT
	ORG $+1
$SG70332 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70340 DB	'_EVA_ADD_IFEMPTY', 00H
	ORG $+3
$SG70341 DB	'_EVA_REMOVE', 00H
$SG70348 DB	'_EVA_REPLACE', 00H
	ORG $+3
$SG70350 DB	'_EVA_REMOVE', 00H
$SG70365 DB	'_EVA_REMOVE', 00H
$SG70393 DB	'D:\Travail\ABI\EVA\V4.0\CGI\Brunix-2016\action_utils.c', 00H
	ORG $+1
$SG70394 DB	'cgi_set_field_values', 00H
	ORG $+3
$SG70396 DB	'D:\Travail\ABI\EVA\V4.0\CGI\Brunix-2016\action_utils.c', 00H
	ORG $+1
$SG70397 DB	'cgi_set_field_values', 00H
_DATA	ENDS
_TEXT	SEGMENT
_cntxt$ = 8
_idform$ = 12
_idobj$ = 16
_dstfield$ = 20
_dstfield_sz$ = 24
_values$ = 28
_setmode$ = 32
_b_old$ = 36
_cgival$ = -44
_name$ = -56
_dstfld$ = -12
_i$ = -24
_j$ = -48
_form$ = -8
_num$ = -52
_line$ = -4
_curform$ = -20
_curobj$ = -16
_val$70346 = -60
_del$70347 = -64
_c$70370 = -68
_val$70380 = -72
_cgi_set_field_values PROC NEAR

; 123  : ){

	push	ebp
	mov	ebp, esp
	sub	esp, 120				; 00000078H

; 124  : 	DynTable cgival = { 0 };

	mov	DWORD PTR _cgival$[ebp], 0
	xor	eax, eax
	mov	DWORD PTR _cgival$[ebp+4], eax
	mov	DWORD PTR _cgival$[ebp+8], eax
	mov	DWORD PTR _cgival$[ebp+12], eax
	mov	DWORD PTR _cgival$[ebp+16], eax

; 125  : 	DynBuffer *name = NULL;

	mov	DWORD PTR _name$[ebp], 0

; 126  : 	DynBuffer *dstfld = NULL;

	mov	DWORD PTR _dstfld$[ebp], 0

; 127  : 	unsigned long i, j;
; 128  : 	EVA_form *form = cntxt->form;

	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	edx, DWORD PTR [ecx+80]
	mov	DWORD PTR _form$[ebp], edx

; 129  : 	unsigned long num = 0, line = 0;

	mov	DWORD PTR _num$[ebp], 0
	mov	DWORD PTR _line$[ebp], 0

; 130  : 	unsigned long curform = form ? DYNTAB_TOUL(&form->id_form) : 0;

	cmp	DWORD PTR _form$[ebp], 0
	je	SHORT $L71036
	push	10					; 0000000aH
	push	0
	push	0
	push	0
	mov	eax, DWORD PTR _form$[ebp]
	add	eax, 12					; 0000000cH
	push	eax
	call	_dyntab_val
	add	esp, 12					; 0000000cH
	push	eax
	call	_strtoul
	add	esp, 12					; 0000000cH
	mov	DWORD PTR -76+[ebp], eax
	jmp	SHORT $L71037
$L71036:
	mov	DWORD PTR -76+[ebp], 0
$L71037:
	mov	ecx, DWORD PTR -76+[ebp]
	mov	DWORD PTR _curform$[ebp], ecx

; 131  : 	unsigned long curobj = form ? DYNTAB_TOUL(&form->id_obj) : 0;

	cmp	DWORD PTR _form$[ebp], 0
	je	SHORT $L71038
	push	10					; 0000000aH
	push	0
	push	0
	push	0
	mov	edx, DWORD PTR _form$[ebp]
	add	edx, 32					; 00000020H
	push	edx
	call	_dyntab_val
	add	esp, 12					; 0000000cH
	push	eax
	call	_strtoul
	add	esp, 12					; 0000000cH
	mov	DWORD PTR -80+[ebp], eax
	jmp	SHORT $L71039
$L71038:
	mov	DWORD PTR -80+[ebp], 0
$L71039:
	mov	eax, DWORD PTR -80+[ebp]
	mov	DWORD PTR _curobj$[ebp], eax

; 132  : 
; 133  : 	/* Read current CGI or DB values of destination field */
; 134  : 	DYNBUF_ADD(&dstfld, dstfield, dstfield_sz, NO_CONV);

	push	0
	push	0
	mov	ecx, DWORD PTR _dstfield_sz$[ebp]
	push	ecx
	mov	edx, DWORD PTR _dstfield$[ebp]
	push	edx
	lea	eax, DWORD PTR _dstfld$[ebp]
	push	eax
	call	_dynbuf_add
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L70330
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29872], OFFSET FLAT:$SG70332
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 134		; 00000086H
	jmp	$eva_err$70333
$L70330:

; 135  : 	if(!setmode) setmode = "";

	cmp	DWORD PTR _setmode$[ebp], 0
	jne	SHORT $L70334
	mov	DWORD PTR _setmode$[ebp], OFFSET FLAT:$SG70335
$L70334:

; 136  : 	if((cgi_filter_values(cntxt, &cgival, 'D', ~0UL, idform, idobj, dstfld->data, "", 0, 0)) ||(
; 137  : 		!cgival.nbrows && qry_obj_field(cntxt, &cgival, idobj, dstfld->data))) STACK_ERROR;

	push	0
	push	0
	push	OFFSET FLAT:$SG70338
	mov	eax, DWORD PTR _dstfld$[ebp]
	add	eax, 8
	push	eax
	mov	ecx, DWORD PTR _idobj$[ebp]
	push	ecx
	mov	edx, DWORD PTR _idform$[ebp]
	push	edx
	push	-1
	push	68					; 00000044H
	lea	eax, DWORD PTR _cgival$[ebp]
	push	eax
	mov	ecx, DWORD PTR _cntxt$[ebp]
	push	ecx
	call	_cgi_filter_values
	add	esp, 40					; 00000028H
	test	eax, eax
	jne	SHORT $L70337
	cmp	DWORD PTR _cgival$[ebp], 0
	jne	SHORT $L70336
	mov	edx, DWORD PTR _dstfld$[ebp]
	add	edx, 8
	push	edx
	mov	eax, DWORD PTR _idobj$[ebp]
	push	eax
	lea	ecx, DWORD PTR _cgival$[ebp]
	push	ecx
	mov	edx, DWORD PTR _cntxt$[ebp]
	push	edx
	call	_qry_obj_field
	add	esp, 16					; 00000010H
	test	eax, eax
	je	SHORT $L70336
$L70337:
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 137		; 00000089H
	jmp	$eva_err$70333
$L70336:

; 138  : 
; 139  : 	/* Return if nothing to do */
; 140  : 	if(cgival.nbrows ? !strcmp("_EVA_ADD_IFEMPTY", setmode) : !strcmp("_EVA_REMOVE", setmode)) RETURN_OK;

	cmp	DWORD PTR _cgival$[ebp], 0
	je	SHORT $L71040
	mov	ecx, DWORD PTR _setmode$[ebp]
	push	ecx
	push	OFFSET FLAT:$SG70340
	call	_strcmp
	add	esp, 8
	neg	eax
	sbb	eax, eax
	inc	eax
	mov	DWORD PTR -84+[ebp], eax
	jmp	SHORT $L71041
$L71040:
	mov	edx, DWORD PTR _setmode$[ebp]
	push	edx
	push	OFFSET FLAT:$SG70341
	call	_strcmp
	add	esp, 8
	neg	eax
	sbb	eax, eax
	inc	eax
	mov	DWORD PTR -84+[ebp], eax
$L71041:
	cmp	DWORD PTR -84+[ebp], 0
	je	SHORT $L70339
	jmp	$eva_noerr$70342
$L70339:

; 141  : 
; 142  : 	/* Delete applicable values & check indexes */
; 143  : 	for(i = 0; i < cgival.nbrows; i++)

	mov	DWORD PTR _i$[ebp], 0
	jmp	SHORT $L70343
$L70344:
	mov	eax, DWORD PTR _i$[ebp]
	add	eax, 1
	mov	DWORD PTR _i$[ebp], eax
$L70343:
	mov	ecx, DWORD PTR _i$[ebp]
	cmp	ecx, DWORD PTR _cgival$[ebp]
	jae	$L70345

; 145  : 		DynTableCell *val = dyntab_cell(&cgival, i, 0);

	push	0
	mov	edx, DWORD PTR _i$[ebp]
	push	edx
	lea	eax, DWORD PTR _cgival$[ebp]
	push	eax
	call	_dyntab_cell
	add	esp, 12					; 0000000cH
	mov	DWORD PTR _val$70346[ebp], eax

; 146  : 		int del = !strcmp("_EVA_REPLACE", setmode);

	mov	ecx, DWORD PTR _setmode$[ebp]
	push	ecx
	push	OFFSET FLAT:$SG70348
	call	_strcmp
	add	esp, 8
	neg	eax
	sbb	eax, eax
	inc	eax
	mov	DWORD PTR _del$70347[ebp], eax

; 147  : 		if(!del && !strcmp("_EVA_REMOVE", setmode))

	cmp	DWORD PTR _del$70347[ebp], 0
	jne	SHORT $L70353
	mov	edx, DWORD PTR _setmode$[ebp]
	push	edx
	push	OFFSET FLAT:$SG70350
	call	_strcmp
	add	esp, 8
	test	eax, eax
	jne	SHORT $L70353

; 148  : 			for(j = 0; j < values->nbrows && !del;
; 149  : 				del = !dyntab_cmp(values, j, 0, &cgival, i, 0), j++);

	mov	DWORD PTR _j$[ebp], 0
	jmp	SHORT $L70351
$L70352:
	push	0
	mov	eax, DWORD PTR _i$[ebp]
	push	eax
	lea	ecx, DWORD PTR _cgival$[ebp]
	push	ecx
	push	0
	mov	edx, DWORD PTR _j$[ebp]
	push	edx
	mov	eax, DWORD PTR _values$[ebp]
	push	eax
	call	_dyntab_cmp
	add	esp, 24					; 00000018H
	neg	eax
	sbb	eax, eax
	inc	eax
	mov	DWORD PTR _del$70347[ebp], eax
	mov	ecx, DWORD PTR _j$[ebp]
	add	ecx, 1
	mov	DWORD PTR _j$[ebp], ecx
$L70351:
	mov	edx, DWORD PTR _values$[ebp]
	mov	eax, DWORD PTR _j$[ebp]
	cmp	eax, DWORD PTR [edx]
	jae	SHORT $L70353
	cmp	DWORD PTR _del$70347[ebp], 0
	jne	SHORT $L70353
	jmp	SHORT $L70352
$L70353:

; 150  : 		if(del)

	cmp	DWORD PTR _del$70347[ebp], 0
	je	SHORT $L70354

; 152  : 			if(val->i_cgi && cntxt->cgi[val->i_cgi].value)

	mov	ecx, DWORD PTR _val$70346[ebp]
	cmp	DWORD PTR [ecx+48], 0
	je	SHORT $L70355
	mov	edx, DWORD PTR _val$70346[ebp]
	mov	eax, DWORD PTR [edx+48]
	imul	eax, 56					; 00000038H
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	edx, DWORD PTR [ecx+29648]
	cmp	DWORD PTR [edx+eax+8], 0
	je	SHORT $L70355

; 154  : 				cntxt->cgi[val->i_cgi].name[0] = 0;

	mov	eax, DWORD PTR _val$70346[ebp]
	mov	ecx, DWORD PTR [eax+48]
	imul	ecx, 56					; 00000038H
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	eax, DWORD PTR [edx+29648]
	mov	ecx, DWORD PTR [eax+ecx]
	mov	BYTE PTR [ecx], 0

; 155  : 				cntxt->cgi[val->i_cgi].name_sz = 0;

	mov	edx, DWORD PTR _val$70346[ebp]
	mov	eax, DWORD PTR [edx+48]
	imul	eax, 56					; 00000038H
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	edx, DWORD PTR [ecx+29648]
	mov	DWORD PTR [edx+eax+4], 0
$L70355:

; 158  : 		else

	jmp	$L70363
$L70354:

; 160  : 			if(!val->i_cgi && (
; 161  : 				cgi_build_name(cntxt, &name, 'D', 0, idform, idobj, dstfield, dstfield_sz, NULL, 0, val->Num, val->Line, 0) ||
; 162  : 				(b_old ? cgi_add_inputold : cgi_add_input)(cntxt, NULL, DYNBUF_VAL_SZ(name), val->txt, val->len)))

	mov	eax, DWORD PTR _val$70346[ebp]
	cmp	DWORD PTR [eax+48], 0
	jne	$L70360
	push	0
	mov	ecx, DWORD PTR _val$70346[ebp]
	mov	edx, DWORD PTR [ecx+40]
	push	edx
	mov	eax, DWORD PTR _val$70346[ebp]
	mov	ecx, DWORD PTR [eax+36]
	push	ecx
	push	0
	push	0
	mov	edx, DWORD PTR _dstfield_sz$[ebp]
	push	edx
	mov	eax, DWORD PTR _dstfield$[ebp]
	push	eax
	mov	ecx, DWORD PTR _idobj$[ebp]
	push	ecx
	mov	edx, DWORD PTR _idform$[ebp]
	push	edx
	push	0
	push	68					; 00000044H
	lea	eax, DWORD PTR _name$[ebp]
	push	eax
	mov	ecx, DWORD PTR _cntxt$[ebp]
	push	ecx
	call	_cgi_build_name
	add	esp, 52					; 00000034H
	test	eax, eax
	jne	SHORT $L70361
	cmp	DWORD PTR _name$[ebp], 0
	je	SHORT $L71044
	mov	edx, DWORD PTR _name$[ebp]
	mov	eax, DWORD PTR [edx+4]
	mov	DWORD PTR -88+[ebp], eax
	jmp	SHORT $L71045
$L71044:
	mov	DWORD PTR -88+[ebp], 0
$L71045:
	cmp	DWORD PTR _name$[ebp], 0
	je	SHORT $L71046
	mov	ecx, DWORD PTR _name$[ebp]
	add	ecx, 8
	mov	DWORD PTR -92+[ebp], ecx
	jmp	SHORT $L71047
$L71046:
	mov	DWORD PTR -92+[ebp], 0
$L71047:
	cmp	DWORD PTR _b_old$[ebp], 0
	je	SHORT $L71042
	mov	DWORD PTR -96+[ebp], OFFSET FLAT:_cgi_add_inputold
	jmp	SHORT $L71043
$L71042:
	mov	DWORD PTR -96+[ebp], OFFSET FLAT:_cgi_add_input
$L71043:
	mov	edx, DWORD PTR _val$70346[ebp]
	mov	eax, DWORD PTR [edx+4]
	push	eax
	mov	ecx, DWORD PTR _val$70346[ebp]
	mov	edx, DWORD PTR [ecx]
	push	edx
	mov	eax, DWORD PTR -88+[ebp]
	push	eax
	mov	ecx, DWORD PTR -92+[ebp]
	push	ecx
	push	0
	mov	edx, DWORD PTR _cntxt$[ebp]
	push	edx
	call	DWORD PTR -96+[ebp]
	add	esp, 24					; 00000018H
	test	eax, eax
	je	SHORT $L70360
$L70361:

; 163  : 				STACK_ERROR;

	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 163		; 000000a3H
	jmp	$eva_err$70333
$L70360:

; 164  : 			if(num < val->Num) num = val->Num;

	mov	ecx, DWORD PTR _val$70346[ebp]
	mov	edx, DWORD PTR _num$[ebp]
	cmp	edx, DWORD PTR [ecx+36]
	jae	SHORT $L70362
	mov	eax, DWORD PTR _val$70346[ebp]
	mov	ecx, DWORD PTR [eax+36]
	mov	DWORD PTR _num$[ebp], ecx
$L70362:

; 165  : 			if(line < val->Line) line = val->Line;

	mov	edx, DWORD PTR _val$70346[ebp]
	mov	eax, DWORD PTR _line$[ebp]
	cmp	eax, DWORD PTR [edx+40]
	jae	SHORT $L70363
	mov	ecx, DWORD PTR _val$70346[ebp]
	mov	edx, DWORD PTR [ecx+40]
	mov	DWORD PTR _line$[ebp], edx
$L70363:

; 167  : 	}

	jmp	$L70344
$L70345:

; 168  : 
; 169  : 	/* Add apropriate values */
; 170  : 	if(strcmp("_EVA_REMOVE", setmode))

	mov	eax, DWORD PTR _setmode$[ebp]
	push	eax
	push	OFFSET FLAT:$SG70365
	call	_strcmp
	add	esp, 8
	test	eax, eax
	je	$L70368

; 171  : 		for(i = 0; !i || i < values->nbrows; i++)

	mov	DWORD PTR _i$[ebp], 0
	jmp	SHORT $L70366
$L70367:
	mov	ecx, DWORD PTR _i$[ebp]
	add	ecx, 1
	mov	DWORD PTR _i$[ebp], ecx
$L70366:
	cmp	DWORD PTR _i$[ebp], 0
	je	SHORT $L70369
	mov	edx, DWORD PTR _values$[ebp]
	mov	eax, DWORD PTR _i$[ebp]
	cmp	eax, DWORD PTR [edx]
	jae	$L70368
$L70369:

; 173  : 			/* Fake CGI input with proper name & indexes */
; 174  : 			DynTableCell *c = dyntab_cell(values, i, 0);

	push	0
	mov	ecx, DWORD PTR _i$[ebp]
	push	ecx
	mov	edx, DWORD PTR _values$[ebp]
	push	edx
	call	_dyntab_cell
	add	esp, 12					; 0000000cH
	mov	DWORD PTR _c$70370[ebp], eax

; 175  : 			if(c && c->Num <= 1 && !c->Line)

	cmp	DWORD PTR _c$70370[ebp], 0
	je	SHORT $L70371
	mov	eax, DWORD PTR _c$70370[ebp]
	cmp	DWORD PTR [eax+36], 1
	ja	SHORT $L70371
	mov	ecx, DWORD PTR _c$70370[ebp]
	cmp	DWORD PTR [ecx+40], 0
	jne	SHORT $L70371

; 177  : 				if(line) line++; else num++;

	cmp	DWORD PTR _line$[ebp], 0
	je	SHORT $L70372
	mov	edx, DWORD PTR _line$[ebp]
	add	edx, 1
	mov	DWORD PTR _line$[ebp], edx
	jmp	SHORT $L70373
$L70372:
	mov	eax, DWORD PTR _num$[ebp]
	add	eax, 1
	mov	DWORD PTR _num$[ebp], eax
$L70373:

; 178  : 				c->Num = num;

	mov	ecx, DWORD PTR _c$70370[ebp]
	mov	edx, DWORD PTR _num$[ebp]
	mov	DWORD PTR [ecx+36], edx

; 179  : 				c->Line = line;

	mov	eax, DWORD PTR _c$70370[ebp]
	mov	ecx, DWORD PTR _line$[ebp]
	mov	DWORD PTR [eax+40], ecx
$L70371:

; 181  : 			if(cgi_build_name(cntxt, &name, 'D', 0, idform, idobj, dstfield, dstfield_sz, NULL, 0, c ? c->Num : 1, c ? c->Line : 0, 0) ||
; 182  : 				(b_old ? cgi_add_inputold : cgi_add_input)(cntxt, NULL, DYNBUF_VAL_SZ(name), DYNTAB_VAL_SZ(values, i, 0)))

	cmp	DWORD PTR _c$70370[ebp], 0
	je	SHORT $L71048
	mov	edx, DWORD PTR _c$70370[ebp]
	mov	eax, DWORD PTR [edx+40]
	mov	DWORD PTR -100+[ebp], eax
	jmp	SHORT $L71049
$L71048:
	mov	DWORD PTR -100+[ebp], 0
$L71049:
	cmp	DWORD PTR _c$70370[ebp], 0
	je	SHORT $L71050
	mov	ecx, DWORD PTR _c$70370[ebp]
	mov	edx, DWORD PTR [ecx+36]
	mov	DWORD PTR -104+[ebp], edx
	jmp	SHORT $L71051
$L71050:
	mov	DWORD PTR -104+[ebp], 1
$L71051:
	push	0
	mov	eax, DWORD PTR -100+[ebp]
	push	eax
	mov	ecx, DWORD PTR -104+[ebp]
	push	ecx
	push	0
	push	0
	mov	edx, DWORD PTR _dstfield_sz$[ebp]
	push	edx
	mov	eax, DWORD PTR _dstfield$[ebp]
	push	eax
	mov	ecx, DWORD PTR _idobj$[ebp]
	push	ecx
	mov	edx, DWORD PTR _idform$[ebp]
	push	edx
	push	0
	push	68					; 00000044H
	lea	eax, DWORD PTR _name$[ebp]
	push	eax
	mov	ecx, DWORD PTR _cntxt$[ebp]
	push	ecx
	call	_cgi_build_name
	add	esp, 52					; 00000034H
	test	eax, eax
	jne	$L70378
	cmp	DWORD PTR _name$[ebp], 0
	je	SHORT $L71054
	mov	edx, DWORD PTR _name$[ebp]
	mov	eax, DWORD PTR [edx+4]
	mov	DWORD PTR -108+[ebp], eax
	jmp	SHORT $L71055
$L71054:
	mov	DWORD PTR -108+[ebp], 0
$L71055:
	cmp	DWORD PTR _name$[ebp], 0
	je	SHORT $L71056
	mov	ecx, DWORD PTR _name$[ebp]
	add	ecx, 8
	mov	DWORD PTR -112+[ebp], ecx
	jmp	SHORT $L71057
$L71056:
	mov	DWORD PTR -112+[ebp], 0
$L71057:
	cmp	DWORD PTR _b_old$[ebp], 0
	je	SHORT $L71052
	mov	DWORD PTR -116+[ebp], OFFSET FLAT:_cgi_add_inputold
	jmp	SHORT $L71053
$L71052:
	mov	DWORD PTR -116+[ebp], OFFSET FLAT:_cgi_add_input
$L71053:
	push	0
	mov	edx, DWORD PTR _i$[ebp]
	push	edx
	mov	eax, DWORD PTR _values$[ebp]
	push	eax
	call	_dyntab_sz
	add	esp, 12					; 0000000cH
	push	eax
	push	0
	mov	ecx, DWORD PTR _i$[ebp]
	push	ecx
	mov	edx, DWORD PTR _values$[ebp]
	push	edx
	call	_dyntab_val
	add	esp, 12					; 0000000cH
	push	eax
	mov	eax, DWORD PTR -108+[ebp]
	push	eax
	mov	ecx, DWORD PTR -112+[ebp]
	push	ecx
	push	0
	mov	edx, DWORD PTR _cntxt$[ebp]
	push	edx
	call	DWORD PTR -116+[ebp]
	add	esp, 24					; 00000018H
	test	eax, eax
	je	SHORT $L70377
$L70378:

; 183  : 				STACK_ERROR;

	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 183		; 000000b7H
	jmp	$eva_err$70333
$L70377:

; 184  : 		}

	jmp	$L70367
$L70368:

; 185  : 
; 186  : 	/* Handle control values if current form & object */
; 187  : 	if(form && idform == curform && idobj == curobj)

	cmp	DWORD PTR _form$[ebp], 0
	je	$L70387
	mov	ecx, DWORD PTR _idform$[ebp]
	cmp	ecx, DWORD PTR _curform$[ebp]
	jne	$L70387
	mov	edx, DWORD PTR _idobj$[ebp]
	cmp	edx, DWORD PTR _curobj$[ebp]
	jne	$L70387

; 189  : 		/* Search for first control with same field that has values */
; 190  : 		DynTable *val = NULL;

	mov	DWORD PTR _val$70380[ebp], 0

; 191  : 		for(i = 0; i < form->nb_ctrl; i++)

	mov	DWORD PTR _i$[ebp], 0
	jmp	SHORT $L70382
$L70383:
	mov	eax, DWORD PTR _i$[ebp]
	add	eax, 1
	mov	DWORD PTR _i$[ebp], eax
$L70382:
	mov	ecx, DWORD PTR _form$[ebp]
	mov	edx, DWORD PTR _i$[ebp]
	cmp	edx, DWORD PTR [ecx+4]
	jae	$L70384

; 193  : 			val = form->ctrl[i].allval.nbrows ? &form->ctrl[i].allval : &form->ctrl[i].val;

	mov	eax, DWORD PTR _i$[ebp]
	imul	eax, 480				; 000001e0H
	mov	ecx, DWORD PTR _form$[ebp]
	mov	edx, DWORD PTR [ecx]
	cmp	DWORD PTR [edx+eax+124], 0
	je	SHORT $L71058
	mov	eax, DWORD PTR _i$[ebp]
	imul	eax, 480				; 000001e0H
	mov	ecx, DWORD PTR _form$[ebp]
	mov	edx, DWORD PTR [ecx]
	lea	eax, DWORD PTR [edx+eax+124]
	mov	DWORD PTR -120+[ebp], eax
	jmp	SHORT $L71059
$L71058:
	mov	ecx, DWORD PTR _i$[ebp]
	imul	ecx, 480				; 000001e0H
	mov	edx, DWORD PTR _form$[ebp]
	mov	eax, DWORD PTR [edx]
	lea	ecx, DWORD PTR [eax+ecx+64]
	mov	DWORD PTR -120+[ebp], ecx
$L71059:
	mov	edx, DWORD PTR -120+[ebp]
	mov	DWORD PTR _val$70380[ebp], edx

; 194  : 			if(!strcmp(form->ctrl[i].FIELD, dstfld->data) && (val->nbrows || form->ctrl[i].b_modified)) break;

	mov	eax, DWORD PTR _dstfld$[ebp]
	add	eax, 8
	push	eax
	mov	ecx, DWORD PTR _i$[ebp]
	imul	ecx, 480				; 000001e0H
	mov	edx, DWORD PTR _form$[ebp]
	mov	eax, DWORD PTR [edx]
	mov	ecx, DWORD PTR [eax+ecx+280]
	push	ecx
	call	_strcmp
	add	esp, 8
	test	eax, eax
	jne	SHORT $L70385
	mov	edx, DWORD PTR _val$70380[ebp]
	cmp	DWORD PTR [edx], 0
	jne	SHORT $L70386
	mov	eax, DWORD PTR _i$[ebp]
	imul	eax, 480				; 000001e0H
	mov	ecx, DWORD PTR _form$[ebp]
	mov	edx, DWORD PTR [ecx]
	cmp	DWORD PTR [edx+eax+200], 0
	je	SHORT $L70385
$L70386:
	jmp	SHORT $L70384
$L70385:

; 195  : 		}

	jmp	$L70383
$L70384:

; 196  : 		if(i < form->nb_ctrl)

	mov	eax, DWORD PTR _form$[ebp]
	mov	ecx, DWORD PTR _i$[ebp]
	cmp	ecx, DWORD PTR [eax+4]
	jae	$L70387

; 198  : 			/* Control found : transfer values to control */
; 199  : 			dyntab_free(&form->ctrl[i].allval);

	mov	edx, DWORD PTR _i$[ebp]
	imul	edx, 480				; 000001e0H
	mov	eax, DWORD PTR _form$[ebp]
	mov	ecx, DWORD PTR [eax]
	lea	edx, DWORD PTR [ecx+edx+124]
	push	edx
	call	_dyntab_free
	add	esp, 4

; 200  : 			if(cgi_filter_values(cntxt, &form->ctrl[i].val, 'D', ~0UL, idform, idobj, dstfld->data, "", 0, 0)) STACK_ERROR;

	push	0
	push	0
	push	OFFSET FLAT:$SG70389
	mov	eax, DWORD PTR _dstfld$[ebp]
	add	eax, 8
	push	eax
	mov	ecx, DWORD PTR _idobj$[ebp]
	push	ecx
	mov	edx, DWORD PTR _idform$[ebp]
	push	edx
	push	-1
	push	68					; 00000044H
	mov	eax, DWORD PTR _i$[ebp]
	imul	eax, 480				; 000001e0H
	mov	ecx, DWORD PTR _form$[ebp]
	mov	edx, DWORD PTR [ecx]
	lea	eax, DWORD PTR [edx+eax+64]
	push	eax
	mov	ecx, DWORD PTR _cntxt$[ebp]
	push	ecx
	call	_cgi_filter_values
	add	esp, 40					; 00000028H
	test	eax, eax
	je	SHORT $L70388
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 200		; 000000c8H
	jmp	$eva_err$70333
$L70388:

; 201  : 			form->ctrl[i].b_modified = 1;

	mov	eax, DWORD PTR _i$[ebp]
	imul	eax, 480				; 000001e0H
	mov	ecx, DWORD PTR _form$[ebp]
	mov	edx, DWORD PTR [ecx]
	mov	DWORD PTR [edx+eax+200], 1
$L70387:

; 204  : 
; 205  : 	/* Set form reload if current form */
; 206  : 	if(form && idform == DYNTAB_TOUL(&form->id_form) && idobj == DYNTAB_TOUL(&form->id_obj))

	cmp	DWORD PTR _form$[ebp], 0
	je	SHORT $eva_noerr$70342
	push	10					; 0000000aH
	push	0
	push	0
	push	0
	mov	eax, DWORD PTR _form$[ebp]
	add	eax, 12					; 0000000cH
	push	eax
	call	_dyntab_val
	add	esp, 12					; 0000000cH
	push	eax
	call	_strtoul
	add	esp, 12					; 0000000cH
	cmp	DWORD PTR _idform$[ebp], eax
	jne	SHORT $eva_noerr$70342
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
	cmp	DWORD PTR _idobj$[ebp], eax
	jne	SHORT $eva_noerr$70342

; 207  : 		form->b_reload = 1;

	mov	edx, DWORD PTR _form$[ebp]
	mov	DWORD PTR [edx+140], 1
$eva_noerr$70342:

; 208  : 
; 209  : 	RETURN_OK_CLEANUP;

	push	0
	push	OFFSET FLAT:$SG70393
	push	OFFSET FLAT:$SG70394
	mov	eax, DWORD PTR _cntxt$[ebp]
	push	eax
	call	_err_clear
	add	esp, 16					; 00000010H
$eva_err$70333:
	mov	ecx, DWORD PTR _cntxt$[ebp]
	cmp	DWORD PTR [ecx+29872], 0
	je	SHORT $L70395
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	eax, DWORD PTR [edx+29900]
	push	eax
	push	OFFSET FLAT:$SG70396
	push	OFFSET FLAT:$SG70397
	mov	ecx, DWORD PTR _cntxt$[ebp]
	push	ecx
	call	_err_add_context
	add	esp, 16					; 00000010H
$L70395:
	lea	edx, DWORD PTR _cgival$[ebp]
	push	edx
	call	_dyntab_free
	add	esp, 4
	mov	eax, DWORD PTR _name$[ebp]
	push	eax
	call	_mem_free
	add	esp, 4
	mov	DWORD PTR _name$[ebp], 0
	mov	ecx, DWORD PTR _dstfld$[ebp]
	push	ecx
	call	_mem_free
	add	esp, 4
	mov	DWORD PTR _dstfld$[ebp], 0
	mov	edx, DWORD PTR _cntxt$[ebp]
	xor	eax, eax
	cmp	DWORD PTR [edx+29872], 0
	setne	al

; 210  : }

	mov	esp, ebp
	pop	ebp
	ret	0
_cgi_set_field_values ENDP
_TEXT	ENDS
PUBLIC	_form_eval_fieldexpr
PUBLIC	_form_set_values
PUBLIC	_form_eval_valtype
_DATA	SEGMENT
	ORG $+3
$SG70423 DB	'_EVA_DESTOBJ', 00H
	ORG $+3
$SG70431 DB	'D:\Travail\ABI\EVA\V4.0\CGI\Brunix-2016\action_utils.c', 00H
	ORG $+1
$SG70432 DB	'form_set_values', 00H
$SG70434 DB	'D:\Travail\ABI\EVA\V4.0\CGI\Brunix-2016\action_utils.c', 00H
	ORG $+1
$SG70435 DB	'form_set_values', 00H
_DATA	ENDS
_TEXT	SEGMENT
_cntxt$ = 8
_idform$ = 12
_idobj$ = 16
_destfield$ = 20
_destfield_sz$ = 24
_srctype$ = 28
_srcobj$ = 32
_srcval$ = 36
_setmode$ = 40
_values$ = -24
_b_old$ = -4
_form_set_values PROC NEAR

; 229  : ){

	push	ebp
	mov	ebp, esp
	sub	esp, 24					; 00000018H

; 230  : 	DynTable values = {0};

	mov	DWORD PTR _values$[ebp], 0
	xor	eax, eax
	mov	DWORD PTR _values$[ebp+4], eax
	mov	DWORD PTR _values$[ebp+8], eax
	mov	DWORD PTR _values$[ebp+12], eax
	mov	DWORD PTR _values$[ebp+16], eax

; 231  : 	int b_old = !idobj;

	xor	ecx, ecx
	cmp	DWORD PTR _idobj$[ebp], 0
	sete	cl
	mov	DWORD PTR _b_old$[ebp], ecx

; 232  : 
; 233  : 	/* Handle expression on destination object */
; 234  : 	if(!strcmp(srctype, "_EVA_DESTOBJ"))

	push	OFFSET FLAT:$SG70423
	mov	edx, DWORD PTR _srctype$[ebp]
	push	edx
	call	_strcmp
	add	esp, 8
	test	eax, eax
	jne	SHORT $L70422

; 236  : 		if(form_eval_fieldexpr(cntxt, &values, idform, idobj, DYNTAB_VAL_SZ(srcval, 0, 0), NULL, 0)) STACK_ERROR;

	push	0
	push	0
	push	0
	push	0
	mov	eax, DWORD PTR _srcval$[ebp]
	push	eax
	call	_dyntab_sz
	add	esp, 12					; 0000000cH
	push	eax
	push	0
	push	0
	mov	ecx, DWORD PTR _srcval$[ebp]
	push	ecx
	call	_dyntab_val
	add	esp, 12					; 0000000cH
	push	eax
	mov	edx, DWORD PTR _idobj$[ebp]
	push	edx
	mov	eax, DWORD PTR _idform$[ebp]
	push	eax
	lea	ecx, DWORD PTR _values$[ebp]
	push	ecx
	mov	edx, DWORD PTR _cntxt$[ebp]
	push	edx
	call	_form_eval_fieldexpr
	add	esp, 32					; 00000020H
	test	eax, eax
	je	SHORT $L70425
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 236		; 000000ecH
	jmp	$eva_err$70426
$L70425:

; 238  : 	else

	jmp	SHORT $L70428
$L70422:

; 240  : 		if(form_eval_valtype(cntxt, &values, srctype, srcobj, srcval)) STACK_ERROR;

	mov	ecx, DWORD PTR _srcval$[ebp]
	push	ecx
	mov	edx, DWORD PTR _srcobj$[ebp]
	push	edx
	mov	eax, DWORD PTR _srctype$[ebp]
	push	eax
	lea	ecx, DWORD PTR _values$[ebp]
	push	ecx
	mov	edx, DWORD PTR _cntxt$[ebp]
	push	edx
	call	_form_eval_valtype
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L70428
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 240		; 000000f0H
	jmp	SHORT $eva_err$70426
$L70428:

; 242  : 
; 243  : 	/* Set values */
; 244  : 	if(cgi_set_field_values(cntxt, idform, idobj, destfield, destfield_sz, &values, setmode, b_old)) STACK_ERROR;

	mov	ecx, DWORD PTR _b_old$[ebp]
	push	ecx
	mov	edx, DWORD PTR _setmode$[ebp]
	push	edx
	lea	eax, DWORD PTR _values$[ebp]
	push	eax
	mov	ecx, DWORD PTR _destfield_sz$[ebp]
	push	ecx
	mov	edx, DWORD PTR _destfield$[ebp]
	push	edx
	mov	eax, DWORD PTR _idobj$[ebp]
	push	eax
	mov	ecx, DWORD PTR _idform$[ebp]
	push	ecx
	mov	edx, DWORD PTR _cntxt$[ebp]
	push	edx
	call	_cgi_set_field_values
	add	esp, 32					; 00000020H
	test	eax, eax
	je	SHORT $eva_noerr$70430
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 244		; 000000f4H
	jmp	SHORT $eva_err$70426
$eva_noerr$70430:

; 245  : 
; 246  : 	RETURN_OK_CLEANUP;

	push	0
	push	OFFSET FLAT:$SG70431
	push	OFFSET FLAT:$SG70432
	mov	ecx, DWORD PTR _cntxt$[ebp]
	push	ecx
	call	_err_clear
	add	esp, 16					; 00000010H
$eva_err$70426:
	mov	edx, DWORD PTR _cntxt$[ebp]
	cmp	DWORD PTR [edx+29872], 0
	je	SHORT $L70433
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	ecx, DWORD PTR [eax+29900]
	push	ecx
	push	OFFSET FLAT:$SG70434
	push	OFFSET FLAT:$SG70435
	mov	edx, DWORD PTR _cntxt$[ebp]
	push	edx
	call	_err_add_context
	add	esp, 16					; 00000010H
$L70433:
	lea	eax, DWORD PTR _values$[ebp]
	push	eax
	call	_dyntab_free
	add	esp, 4
	mov	ecx, DWORD PTR _cntxt$[ebp]
	xor	eax, eax
	cmp	DWORD PTR [ecx+29872], 0
	setne	al

; 247  : }

	mov	esp, ebp
	pop	ebp
	ret	0
_form_set_values ENDP
_TEXT	ENDS
PUBLIC	_ctrl_eval_fieldexpr
EXTRN	_qry_eval_sqlexpr_var:NEAR
_DATA	SEGMENT
$SG70460 DB	'D:\Travail\ABI\EVA\V4.0\CGI\Brunix-2016\action_utils.c', 00H
	ORG $+1
$SG70461 DB	'ctrl_eval_fieldexpr', 00H
$SG70463 DB	'D:\Travail\ABI\EVA\V4.0\CGI\Brunix-2016\action_utils.c', 00H
	ORG $+1
$SG70464 DB	'ctrl_eval_fieldexpr', 00H
_DATA	ENDS
_TEXT	SEGMENT
_cntxt$ = 8
_ctrl$ = 12
_res$ = 16
_expr$ = 20
_form$ = -4
_buf$ = -8
_ctrl_eval_fieldexpr PROC NEAR

; 262  : ){

	push	ebp
	mov	ebp, esp
	sub	esp, 16					; 00000010H

; 263  : 	EVA_form *form = cntxt->form;

	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	ecx, DWORD PTR [eax+80]
	mov	DWORD PTR _form$[ebp], ecx

; 264  : 	DynBuffer *buf = NULL;

	mov	DWORD PTR _buf$[ebp], 0

; 265  : 	if(qry_eval_sqlexpr_var(cntxt, &buf, expr, &ctrl->attr, NULL)) STACK_ERROR;

	push	0
	mov	edx, DWORD PTR _ctrl$[ebp]
	add	edx, 44					; 0000002cH
	push	edx
	mov	eax, DWORD PTR _expr$[ebp]
	push	eax
	lea	ecx, DWORD PTR _buf$[ebp]
	push	ecx
	mov	edx, DWORD PTR _cntxt$[ebp]
	push	edx
	call	_qry_eval_sqlexpr_var
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L70452
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 265		; 00000109H
	jmp	$eva_err$70453
$L70452:

; 266  : 	if(form_eval_fieldexpr(cntxt, res, DYNTAB_TOUL(&form->id_form), DYNTAB_TOUL(&form->id_obj),
; 267  : 										DYNBUF_VAL_SZ(buf), NULL, 0)) STACK_ERROR;

	cmp	DWORD PTR _buf$[ebp], 0
	je	SHORT $L71062
	mov	ecx, DWORD PTR _buf$[ebp]
	mov	edx, DWORD PTR [ecx+4]
	mov	DWORD PTR -12+[ebp], edx
	jmp	SHORT $L71063
$L71062:
	mov	DWORD PTR -12+[ebp], 0
$L71063:
	cmp	DWORD PTR _buf$[ebp], 0
	je	SHORT $L71064
	mov	eax, DWORD PTR _buf$[ebp]
	add	eax, 8
	mov	DWORD PTR -16+[ebp], eax
	jmp	SHORT $L71065
$L71064:
	mov	DWORD PTR -16+[ebp], 0
$L71065:
	push	0
	push	0
	mov	ecx, DWORD PTR -12+[ebp]
	push	ecx
	mov	edx, DWORD PTR -16+[ebp]
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
	mov	edx, DWORD PTR _res$[ebp]
	push	edx
	mov	eax, DWORD PTR _cntxt$[ebp]
	push	eax
	call	_form_eval_fieldexpr
	add	esp, 32					; 00000020H
	test	eax, eax
	je	SHORT $eva_noerr$70459
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 267		; 0000010bH
	jmp	SHORT $eva_err$70453
$eva_noerr$70459:

; 268  : 
; 269  : 	RETURN_OK_CLEANUP;

	push	0
	push	OFFSET FLAT:$SG70460
	push	OFFSET FLAT:$SG70461
	mov	edx, DWORD PTR _cntxt$[ebp]
	push	edx
	call	_err_clear
	add	esp, 16					; 00000010H
$eva_err$70453:
	mov	eax, DWORD PTR _cntxt$[ebp]
	cmp	DWORD PTR [eax+29872], 0
	je	SHORT $L70462
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	edx, DWORD PTR [ecx+29900]
	push	edx
	push	OFFSET FLAT:$SG70463
	push	OFFSET FLAT:$SG70464
	mov	eax, DWORD PTR _cntxt$[ebp]
	push	eax
	call	_err_add_context
	add	esp, 16					; 00000010H
$L70462:
	mov	ecx, DWORD PTR _buf$[ebp]
	push	ecx
	call	_mem_free
	add	esp, 4
	mov	DWORD PTR _buf$[ebp], 0
	mov	edx, DWORD PTR _cntxt$[ebp]
	xor	eax, eax
	cmp	DWORD PTR [edx+29872], 0
	setne	al

; 270  : }

	mov	esp, ebp
	pop	ebp
	ret	0
_ctrl_eval_fieldexpr ENDP
_TEXT	ENDS
PUBLIC	__real@8@400c9c40000000000000
EXTRN	__pctype:DWORD
EXTRN	__isctype:NEAR
EXTRN	_TarifFAP:NEAR
EXTRN	_datetxt_invalid:NEAR
EXTRN	_mystrdup:NEAR
EXTRN	_sprintf:NEAR
EXTRN	___mb_cur_max:DWORD
EXTRN	_sql_exec_query:NEAR
EXTRN	__chkstk:NEAR
EXTRN	__fltused:NEAR
EXTRN	_mem_alloc:NEAR
EXTRN	_strtod:NEAR
EXTRN	_sql_no_quote:BYTE
EXTRN	_dynbuf_add3:NEAR
EXTRN	_sql_get_table:NEAR
EXTRN	_sql_get_listcol:NEAR
EXTRN	_memcpy:NEAR
EXTRN	_dyntab_add:NEAR
EXTRN	_strchr:NEAR
EXTRN	_qry_build_free:NEAR
EXTRN	_strncmp:NEAR
EXTRN	_strstr:NEAR
EXTRN	_dyntab_filter_field:NEAR
EXTRN	_dyntab_group:NEAR
EXTRN	_qry_parse_fieldexpr:NEAR
_BSS	SEGMENT
	ALIGN	4

$SG70689 DB	01H DUP (?)
_BSS	ENDS
_DATA	SEGMENT
$SG70493 DB	'->', 00H
	ORG $+1
$SG70496 DB	'<-', 00H
	ORG $+1
$SG70533 DB	'SELECT ', 00H
$SG70538 DB	'D:\Travail\ABI\EVA\V4.0\CGI\Brunix-2016\action_utils.c', 00H
	ORG $+1
$SG70539 DB	'form_eval_fieldexpr', 00H
$SG70551 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70572 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70576 DB	'$TarifFap', 00H
	ORG $+2
$SG70578 DB	'D:\Travail\ABI\EVA\V4.0\CGI\Brunix-2016\action_utils.c', 00H
	ORG $+1
$SG70579 DB	'form_eval_fieldexpr', 00H
$SG70588 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70594 DB	' IN (', 00H
	ORG $+2
$SG70613 DB	'SELECT ', 00H
$SG70615 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70620 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70634 DB	',', 00H
	ORG $+2
$SG70636 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70640 DB	'''', 00H
	ORG $+2
$SG70641 DB	'''', 00H
	ORG $+2
$SG70643 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70648 DB	'''''', 00H
	ORG $+1
$SG70650 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70655 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70666 DB	',', 00H
	ORG $+2
$SG70668 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70672 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70679 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70685 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70690 DB	'SELECT ', 00H
$SG70692 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70700 DB	',', 00H
	ORG $+2
$SG70702 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70708 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70715 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70730 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70738 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70743 DB	',', 00H
	ORG $+2
$SG70745 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70751 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70771 DB	'%lu', 00H
$SG70775 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70788 DB	'NMIN', 00H
	ORG $+3
$SG70789 DB	'NMAX', 00H
	ORG $+3
$SG70791 DB	'D:\Travail\ABI\EVA\V4.0\CGI\Brunix-2016\action_utils.c', 00H
	ORG $+1
$SG70792 DB	'form_eval_fieldexpr', 00H
$SG70793 DB	'D:\Travail\ABI\EVA\V4.0\CGI\Brunix-2016\action_utils.c', 00H
	ORG $+1
$SG70794 DB	'form_eval_fieldexpr', 00H
$SG70796 DB	'D:\Travail\ABI\EVA\V4.0\CGI\Brunix-2016\action_utils.c', 00H
	ORG $+1
$SG70797 DB	'form_eval_fieldexpr', 00H
_DATA	ENDS
;	COMDAT __real@8@400c9c40000000000000
; File D:\Travail\ABI\EVA\V4.0\CGI\Brunix-2016\action_utils.c
CONST	SEGMENT
__real@8@400c9c40000000000000 DQ 040c3880000000000r ; 10000
CONST	ENDS
_TEXT	SEGMENT
_r$70674 = -5088
_size$70710 = -5092
_src$70711 = -5096
_size1$70712 = -5100
_sz$70723 = -5108
_sz1$70724 = -5104
_size$70725 = -5112
_src$70726 = -5116
_size1$70727 = -5120
_size$70733 = -5124
_src$70734 = -5128
_size1$70735 = -5132
_c$70760 = -5136
_c1$70766 = -5140
__tmp$70770 = -5172
_b_num$70780 = -5176
_e$70784 = -5184
_t$70785 = -5180
_n$70786 = -5192
_cntxt$ = 8
_res$ = 12
_idform$ = 16
_idobj$ = 20
__field$ = 24
_field_sz$ = 28
_data$ = 32
_beg$ = 36
_pfield$ = -504
_field$ = -440
_bracket$ = -4984
_dotsep$ = -500
_reldir$ = -4992
_relrev$ = -444
_relop$ = -480
_paropn$ = -408
_id_obj$ = -472
_restbl$ = -436
_resgroup$ = -4980
_flt$ = -4960
_expr$ = -416
_srchfield$ = -492
_fieldexpr$ = -4988
_fieldgrp$ = -404
_fieldgrp_sz$ = -452
_p$ = -400
_b_expr$ = -448
__groupfn$ = -476
_groupfn$ = -496
_i$ = -484
_j$ = -488
_nbp$ = -412
_sz$70545 = -4996
_size$70546 = -5000
_src$70547 = -5004
_size1$70548 = -5008
_line$70556 = -5012
_num$70557 = -5016
_c$70561 = -5020
_line0$70562 = -5032
_num0$70563 = -5028
_end$70564 = -5024
_sz$70565 = -5036
_size$70567 = -5040
_src$70568 = -5044
_size1$70569 = -5048
_L$70599 = -5052
_N$70600 = -5056
_txt$70608 = -5060
_valcnt$70609 = -5064
_len$70610 = -5068
_c0$70624 = -5072
_b_empty$70625 = -5076
_c$70629 = -5080
__c$70637 = -5084
_form_eval_fieldexpr PROC NEAR

; 297  : ){

	push	ebp
	mov	ebp, esp
	mov	eax, 5280				; 000014a0H
	call	__chkstk
	push	edi

; 298  : 	char *pfield = mystrdup(_field, field_sz);

	mov	eax, DWORD PTR _field_sz$[ebp]
	push	eax
	mov	ecx, DWORD PTR __field$[ebp]
	push	ecx
	call	_mystrdup
	add	esp, 8
	mov	DWORD PTR _pfield$[ebp], eax

; 299  : 	char *field = pfield;

	mov	edx, DWORD PTR _pfield$[ebp]
	mov	DWORD PTR _field$[ebp], edx

; 300  : 	char *bracket = !field ? NULL : strchr(field, '[');

	cmp	DWORD PTR _field$[ebp], 0
	jne	SHORT $L71067
	mov	DWORD PTR -5196+[ebp], 0
	jmp	SHORT $L71068
$L71067:
	push	91					; 0000005bH
	mov	eax, DWORD PTR _field$[ebp]
	push	eax
	call	_strchr
	add	esp, 8
	mov	DWORD PTR -5196+[ebp], eax
$L71068:
	mov	ecx, DWORD PTR -5196+[ebp]
	mov	DWORD PTR _bracket$[ebp], ecx

; 301  : 	char *dotsep = !field ? NULL : strchr(field, '.');

	cmp	DWORD PTR _field$[ebp], 0
	jne	SHORT $L71069
	mov	DWORD PTR -5200+[ebp], 0
	jmp	SHORT $L71070
$L71069:
	push	46					; 0000002eH
	mov	edx, DWORD PTR _field$[ebp]
	push	edx
	call	_strchr
	add	esp, 8
	mov	DWORD PTR -5200+[ebp], eax
$L71070:
	mov	eax, DWORD PTR -5200+[ebp]
	mov	DWORD PTR _dotsep$[ebp], eax

; 302  : 	char *reldir = !field ? NULL : strstr(field, "->");

	cmp	DWORD PTR _field$[ebp], 0
	jne	SHORT $L71071
	mov	DWORD PTR -5204+[ebp], 0
	jmp	SHORT $L71072
$L71071:
	push	OFFSET FLAT:$SG70493
	mov	ecx, DWORD PTR _field$[ebp]
	push	ecx
	call	_strstr
	add	esp, 8
	mov	DWORD PTR -5204+[ebp], eax
$L71072:
	mov	edx, DWORD PTR -5204+[ebp]
	mov	DWORD PTR _reldir$[ebp], edx

; 303  : 	char *relrev = !field ? NULL : strstr(field, "<-");

	cmp	DWORD PTR _field$[ebp], 0
	jne	SHORT $L71073
	mov	DWORD PTR -5208+[ebp], 0
	jmp	SHORT $L71074
$L71073:
	push	OFFSET FLAT:$SG70496
	mov	eax, DWORD PTR _field$[ebp]
	push	eax
	call	_strstr
	add	esp, 8
	mov	DWORD PTR -5208+[ebp], eax
$L71074:
	mov	ecx, DWORD PTR -5208+[ebp]
	mov	DWORD PTR _relrev$[ebp], ecx

; 304  : 	char *relop = (reldir && (!relrev || reldir < relrev)) ? reldir : relrev;

	cmp	DWORD PTR _reldir$[ebp], 0
	je	SHORT $L71076
	cmp	DWORD PTR _relrev$[ebp], 0
	je	SHORT $L71075
	mov	edx, DWORD PTR _reldir$[ebp]
	cmp	edx, DWORD PTR _relrev$[ebp]
	jae	SHORT $L71076
$L71075:
	mov	eax, DWORD PTR _reldir$[ebp]
	mov	DWORD PTR -5212+[ebp], eax
	jmp	SHORT $L71077
$L71076:
	mov	ecx, DWORD PTR _relrev$[ebp]
	mov	DWORD PTR -5212+[ebp], ecx
$L71077:
	mov	edx, DWORD PTR -5212+[ebp]
	mov	DWORD PTR _relop$[ebp], edx

; 305  : 	char *paropn = !field ? NULL : strchr(field, '(');

	cmp	DWORD PTR _field$[ebp], 0
	jne	SHORT $L71078
	mov	DWORD PTR -5216+[ebp], 0
	jmp	SHORT $L71079
$L71078:
	push	40					; 00000028H
	mov	eax, DWORD PTR _field$[ebp]
	push	eax
	call	_strchr
	add	esp, 8
	mov	DWORD PTR -5216+[ebp], eax
$L71079:
	mov	ecx, DWORD PTR -5216+[ebp]
	mov	DWORD PTR _paropn$[ebp], ecx

; 306  : 	DynTable id_obj = { 0 };

	mov	DWORD PTR _id_obj$[ebp], 0
	xor	edx, edx
	mov	DWORD PTR _id_obj$[ebp+4], edx
	mov	DWORD PTR _id_obj$[ebp+8], edx
	mov	DWORD PTR _id_obj$[ebp+12], edx
	mov	DWORD PTR _id_obj$[ebp+16], edx

; 307  : 	DynTable restbl = { 0 };

	mov	DWORD PTR _restbl$[ebp], 0
	xor	eax, eax
	mov	DWORD PTR _restbl$[ebp+4], eax
	mov	DWORD PTR _restbl$[ebp+8], eax
	mov	DWORD PTR _restbl$[ebp+12], eax
	mov	DWORD PTR _restbl$[ebp+16], eax

; 308  : 	DynTable resgroup = { 0 };

	mov	DWORD PTR _resgroup$[ebp], 0
	xor	ecx, ecx
	mov	DWORD PTR _resgroup$[ebp+4], ecx
	mov	DWORD PTR _resgroup$[ebp+8], ecx
	mov	DWORD PTR _resgroup$[ebp+12], ecx
	mov	DWORD PTR _resgroup$[ebp+16], ecx

; 309  : 	QryBuild flt = {{0}};

	mov	DWORD PTR _flt$[ebp], 0
	xor	edx, edx
	mov	DWORD PTR _flt$[ebp+4], edx
	mov	DWORD PTR _flt$[ebp+8], edx
	mov	DWORD PTR _flt$[ebp+12], edx
	mov	DWORD PTR _flt$[ebp+16], edx
	mov	ecx, 1109				; 00000455H
	xor	eax, eax
	lea	edi, DWORD PTR _flt$[ebp+20]
	rep stosd

; 310  : 	DynBuffer *expr = NULL;

	mov	DWORD PTR _expr$[ebp], 0

; 311  : 	char *srchfield = NULL;

	mov	DWORD PTR _srchfield$[ebp], 0

; 312  : 	char *fieldexpr = NULL;

	mov	DWORD PTR _fieldexpr$[ebp], 0

; 313  : 	char *fieldgrp;
; 314  : 	size_t fieldgrp_sz;
; 315  : 	struct _Brackets
; 316  : 	{
; 317  : 		size_t beg;
; 318  : 		size_t end;
; 319  : 	} p[50] = {{0}};

	mov	DWORD PTR _p$[ebp], 0
	xor	eax, eax
	mov	DWORD PTR _p$[ebp+4], eax
	mov	ecx, 98					; 00000062H
	xor	eax, eax
	lea	edi, DWORD PTR _p$[ebp+8]
	rep stosd

; 320  : 	int b_expr;
; 321  : 	char *_groupfn = NULL;

	mov	DWORD PTR __groupfn$[ebp], 0

; 322  : 	char *groupfn = NULL;

	mov	DWORD PTR _groupfn$[ebp], 0

; 323  : 	unsigned long i, j, nbp = 0;

	mov	DWORD PTR _nbp$[ebp], 0

; 324  : 
; 325  : 	/* Check params - return if applicable */
; 326  : 	if(res) dyntab_free(res); else RETURN_OK;

	cmp	DWORD PTR _res$[ebp], 0
	je	SHORT $L70524
	mov	ecx, DWORD PTR _res$[ebp]
	push	ecx
	call	_dyntab_free
	add	esp, 4
	jmp	SHORT $L70525
$L70524:
	jmp	$eva_noerr$70526
$L70525:

; 327  : 	if(!idform && !idobj)

	cmp	DWORD PTR _idform$[ebp], 0
	jne	SHORT $L70527
	cmp	DWORD PTR _idobj$[ebp], 0
	jne	SHORT $L70527

; 329  : 		idform = DYNTAB_TOUL(&cntxt->form->id_form);

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
	mov	DWORD PTR _idform$[ebp], eax

; 330  : 		idobj = DYNTAB_TOUL(&cntxt->form->id_obj);

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
	mov	DWORD PTR _idobj$[ebp], eax
$L70527:

; 332  : 	if(!field || !*field || !field_sz || (!idform && !idobj)) RETURN_OK;

	cmp	DWORD PTR _field$[ebp], 0
	je	SHORT $L70531
	mov	eax, DWORD PTR _field$[ebp]
	movsx	ecx, BYTE PTR [eax]
	test	ecx, ecx
	je	SHORT $L70531
	cmp	DWORD PTR _field_sz$[ebp], 0
	je	SHORT $L70531
	cmp	DWORD PTR _idform$[ebp], 0
	jne	SHORT $L70530
	cmp	DWORD PTR _idobj$[ebp], 0
	jne	SHORT $L70530
$L70531:
	jmp	$eva_noerr$70526
$L70530:

; 333  : 
; 334  : 	/* Handle raw SELECT statement */
; 335  : 	if(!strncmp(field, add_sz_str("SELECT ")))

	push	7
	push	OFFSET FLAT:$SG70533
	mov	edx, DWORD PTR _field$[ebp]
	push	edx
	call	_strncmp
	add	esp, 12					; 0000000cH
	test	eax, eax
	jne	SHORT $L70532

; 337  : 		if(qry_eval_sqlexpr_var(cntxt, &expr, field, NULL, NULL) ||
; 338  : 			sql_exec_query(cntxt, expr->data) ||
; 339  : 			sql_get_table(cntxt, res, 4)) CLEAR_ERROR;

	push	0
	push	0
	mov	eax, DWORD PTR _field$[ebp]
	push	eax
	lea	ecx, DWORD PTR _expr$[ebp]
	push	ecx
	mov	edx, DWORD PTR _cntxt$[ebp]
	push	edx
	call	_qry_eval_sqlexpr_var
	add	esp, 20					; 00000014H
	test	eax, eax
	jne	SHORT $L70537
	mov	eax, DWORD PTR _expr$[ebp]
	add	eax, 8
	push	eax
	mov	ecx, DWORD PTR _cntxt$[ebp]
	push	ecx
	call	_sql_exec_query
	add	esp, 8
	test	eax, eax
	jne	SHORT $L70537
	push	4
	mov	edx, DWORD PTR _res$[ebp]
	push	edx
	mov	eax, DWORD PTR _cntxt$[ebp]
	push	eax
	call	_sql_get_table
	add	esp, 12					; 0000000cH
	test	eax, eax
	je	SHORT $L70536
$L70537:
	push	339					; 00000153H
	push	OFFSET FLAT:$SG70538
	push	OFFSET FLAT:$SG70539
	mov	ecx, DWORD PTR _cntxt$[ebp]
	push	ecx
	call	_err_clear
	add	esp, 16					; 00000010H
$L70536:

; 340  : 		RETURN_OK;

	jmp	$eva_noerr$70526
$L70532:

; 342  : 
; 343  : 	/* Handle forced SQL, string litterals & numbers */
; 344  : 	if(*field == '=') { field++; field_sz--; b_expr = 1; }

	mov	edx, DWORD PTR _field$[ebp]
	movsx	eax, BYTE PTR [edx]
	cmp	eax, 61					; 0000003dH
	jne	SHORT $L70540
	mov	ecx, DWORD PTR _field$[ebp]
	add	ecx, 1
	mov	DWORD PTR _field$[ebp], ecx
	mov	edx, DWORD PTR _field_sz$[ebp]
	sub	edx, 1
	mov	DWORD PTR _field_sz$[ebp], edx
	mov	DWORD PTR _b_expr$[ebp], 1

; 345  : 	else b_expr = *field == '\'' || isdigit(*field) || bracket;

	jmp	$L70541
$L70540:
	mov	eax, DWORD PTR _field$[ebp]
	movsx	ecx, BYTE PTR [eax]
	cmp	ecx, 39					; 00000027H
	je	SHORT $L71082
	cmp	DWORD PTR ___mb_cur_max, 1
	jle	SHORT $L71080
	push	4
	mov	edx, DWORD PTR _field$[ebp]
	movsx	eax, BYTE PTR [edx]
	push	eax
	call	__isctype
	add	esp, 8
	mov	DWORD PTR -5220+[ebp], eax
	jmp	SHORT $L71081
$L71080:
	mov	ecx, DWORD PTR _field$[ebp]
	movsx	edx, BYTE PTR [ecx]
	mov	eax, DWORD PTR __pctype
	xor	ecx, ecx
	mov	cx, WORD PTR [eax+edx*2]
	and	ecx, 4
	mov	DWORD PTR -5220+[ebp], ecx
$L71081:
	cmp	DWORD PTR -5220+[ebp], 0
	jne	SHORT $L71082
	cmp	DWORD PTR _bracket$[ebp], 0
	jne	SHORT $L71082
	mov	DWORD PTR -5224+[ebp], 0
	jmp	SHORT $L71083
$L71082:
	mov	DWORD PTR -5224+[ebp], 1
$L71083:
	mov	edx, DWORD PTR -5224+[ebp]
	mov	DWORD PTR _b_expr$[ebp], edx
$L70541:

; 346  : 	if(!field || !*field || !field_sz) RETURN_OK;

	cmp	DWORD PTR _field$[ebp], 0
	je	SHORT $L70543
	mov	eax, DWORD PTR _field$[ebp]
	movsx	ecx, BYTE PTR [eax]
	test	ecx, ecx
	je	SHORT $L70543
	cmp	DWORD PTR _field_sz$[ebp], 0
	jne	SHORT $L70542
$L70543:
	jmp	$eva_noerr$70526
$L70542:

; 347  : 
; 348  : 	/* Handle grouping */
; 349  : 	fieldgrp = field;

	mov	edx, DWORD PTR _field$[ebp]
	mov	DWORD PTR _fieldgrp$[ebp], edx

; 350  : 	fieldgrp_sz = field_sz;

	mov	eax, DWORD PTR _field_sz$[ebp]
	mov	DWORD PTR _fieldgrp_sz$[ebp], eax

; 351  : 	if(!b_expr && paropn)

	cmp	DWORD PTR _b_expr$[ebp], 0
	jne	$L70544
	cmp	DWORD PTR _paropn$[ebp], 0
	je	$L70544

; 353  : 		size_t sz = paropn - field;

	mov	ecx, DWORD PTR _paropn$[ebp]
	sub	ecx, DWORD PTR _field$[ebp]
	mov	DWORD PTR _sz$70545[ebp], ecx

; 354  : 		M_STRDUP(_groupfn, field, sz);

	mov	edx, DWORD PTR _sz$70545[ebp]
	mov	DWORD PTR _size$70546[ebp], edx
	mov	eax, DWORD PTR _field$[ebp]
	mov	DWORD PTR _src$70547[ebp], eax
	mov	ecx, DWORD PTR _size$70546[ebp]
	add	ecx, 1
	mov	DWORD PTR _size1$70548[ebp], ecx
	mov	edx, DWORD PTR _size1$70548[ebp]
	push	edx
	call	_mem_alloc
	add	esp, 4
	mov	DWORD PTR __groupfn$[ebp], eax
	cmp	DWORD PTR _size1$70548[ebp], 0
	je	SHORT $L70549
	cmp	DWORD PTR __groupfn$[ebp], 0
	jne	SHORT $L70549
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29872], OFFSET FLAT:$SG70551
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 354		; 00000162H
	jmp	$eva_err$70552
$L70549:
	cmp	DWORD PTR _src$70547[ebp], 0
	je	SHORT $L70554
	cmp	DWORD PTR _size$70546[ebp], 0
	je	SHORT $L70554
	mov	edx, DWORD PTR _size$70546[ebp]
	push	edx
	mov	eax, DWORD PTR _src$70547[ebp]
	push	eax
	mov	ecx, DWORD PTR __groupfn$[ebp]
	push	ecx
	call	_memcpy
	add	esp, 12					; 0000000cH
$L70554:

; 355  : 		groupfn = _groupfn;

	mov	edx, DWORD PTR __groupfn$[ebp]
	mov	DWORD PTR _groupfn$[ebp], edx

; 356  : 		fieldgrp += sz + 1;

	mov	eax, DWORD PTR _sz$70545[ebp]
	mov	ecx, DWORD PTR _fieldgrp$[ebp]
	lea	edx, DWORD PTR [ecx+eax+1]
	mov	DWORD PTR _fieldgrp$[ebp], edx

; 357  : 		fieldgrp_sz -= sz + 2;

	mov	eax, DWORD PTR _sz$70545[ebp]
	add	eax, 2
	mov	ecx, DWORD PTR _fieldgrp_sz$[ebp]
	sub	ecx, eax
	mov	DWORD PTR _fieldgrp_sz$[ebp], ecx
$L70544:

; 359  : 
; 360  : 	/* Handle brackets or expression : mixed SQL / fields expression */
; 361  : 	if(b_expr)

	cmp	DWORD PTR _b_expr$[ebp], 0
	je	$L70555

; 363  : 		/* Process field expressions & collect results in restbl */
; 364  : 		unsigned long line = 0, num = 0;

	mov	DWORD PTR _line$70556[ebp], 0
	mov	DWORD PTR _num$70557[ebp], 0
$L70559:

; 365  : 		while(bracket)

	cmp	DWORD PTR _bracket$[ebp], 0
	je	$L70560

; 367  : 			DynTableCell *c;
; 368  : 			unsigned long line0 = 0, num0 = 0;

	mov	DWORD PTR _line0$70562[ebp], 0
	mov	DWORD PTR _num0$70563[ebp], 0

; 369  : 			char *end = strchr(bracket + 1, ']');

	push	93					; 0000005dH
	mov	edx, DWORD PTR _bracket$[ebp]
	add	edx, 1
	push	edx
	call	_strchr
	add	esp, 8
	mov	DWORD PTR _end$70564[ebp], eax

; 370  : 			size_t sz = end - bracket - 1;

	mov	eax, DWORD PTR _end$70564[ebp]
	sub	eax, DWORD PTR _bracket$[ebp]
	sub	eax, 1
	mov	DWORD PTR _sz$70565[ebp], eax

; 371  : 			p[nbp].beg = bracket - fieldgrp;

	mov	ecx, DWORD PTR _bracket$[ebp]
	sub	ecx, DWORD PTR _fieldgrp$[ebp]
	mov	edx, DWORD PTR _nbp$[ebp]
	mov	DWORD PTR _p$[ebp+edx*8], ecx

; 372  : 			p[nbp].end = end - fieldgrp;

	mov	eax, DWORD PTR _end$70564[ebp]
	sub	eax, DWORD PTR _fieldgrp$[ebp]
	mov	ecx, DWORD PTR _nbp$[ebp]
	mov	DWORD PTR _p$[ebp+ecx*8+4], eax

; 373  : 			if(!end) RETURN_OK;

	cmp	DWORD PTR _end$70564[ebp], 0
	jne	SHORT $L70566
	jmp	$eva_noerr$70526
$L70566:

; 374  : 			M_STRDUP(fieldexpr, bracket + 1, sz);

	mov	edx, DWORD PTR _sz$70565[ebp]
	mov	DWORD PTR _size$70567[ebp], edx
	mov	eax, DWORD PTR _bracket$[ebp]
	add	eax, 1
	mov	DWORD PTR _src$70568[ebp], eax
	mov	ecx, DWORD PTR _size$70567[ebp]
	add	ecx, 1
	mov	DWORD PTR _size1$70569[ebp], ecx
	mov	edx, DWORD PTR _size1$70569[ebp]
	push	edx
	call	_mem_alloc
	add	esp, 4
	mov	DWORD PTR _fieldexpr$[ebp], eax
	cmp	DWORD PTR _size1$70569[ebp], 0
	je	SHORT $L70570
	cmp	DWORD PTR _fieldexpr$[ebp], 0
	jne	SHORT $L70570
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29872], OFFSET FLAT:$SG70572
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 374		; 00000176H
	jmp	$eva_err$70552
$L70570:
	cmp	DWORD PTR _src$70568[ebp], 0
	je	SHORT $L70574
	cmp	DWORD PTR _size$70567[ebp], 0
	je	SHORT $L70574
	mov	edx, DWORD PTR _size$70567[ebp]
	push	edx
	mov	eax, DWORD PTR _src$70568[ebp]
	push	eax
	mov	ecx, DWORD PTR _fieldexpr$[ebp]
	push	ecx
	call	_memcpy
	add	esp, 12					; 0000000cH
$L70574:

; 375  : 
; 376  : 			/* Handle functions reference */
; 377  : #ifndef _EVA_DLL
; 378  : 			if(!strncmp(fieldexpr, add_sz_str("$TarifFap")))

	push	9
	push	OFFSET FLAT:$SG70576
	mov	edx, DWORD PTR _fieldexpr$[ebp]
	push	edx
	call	_strncmp
	add	esp, 12					; 0000000cH
	test	eax, eax
	jne	SHORT $L70575

; 380  : 				if(TarifFAP(cntxt, res, idobj, fieldexpr + 9)) CLEAR_ERROR;

	mov	eax, DWORD PTR _fieldexpr$[ebp]
	add	eax, 9
	push	eax
	mov	ecx, DWORD PTR _idobj$[ebp]
	push	ecx
	mov	edx, DWORD PTR _res$[ebp]
	push	edx
	mov	eax, DWORD PTR _cntxt$[ebp]
	push	eax
	call	_TarifFAP
	add	esp, 16					; 00000010H
	test	eax, eax
	je	SHORT $L70577
	push	380					; 0000017cH
	push	OFFSET FLAT:$SG70578
	push	OFFSET FLAT:$SG70579
	mov	ecx, DWORD PTR _cntxt$[ebp]
	push	ecx
	call	_err_clear
	add	esp, 16					; 00000010H
$L70577:

; 382  : 			else

	jmp	SHORT $L70581
$L70575:

; 383  : #endif
; 384  : 				/* Normal case : evaluate bracket contents */
; 385  : 				if(form_eval_fieldexpr(cntxt, res, idform, idobj, fieldexpr, sz, data, beg)) STACK_ERROR;

	mov	edx, DWORD PTR _beg$[ebp]
	push	edx
	mov	eax, DWORD PTR _data$[ebp]
	push	eax
	mov	ecx, DWORD PTR _sz$70565[ebp]
	push	ecx
	mov	edx, DWORD PTR _fieldexpr$[ebp]
	push	edx
	mov	eax, DWORD PTR _idobj$[ebp]
	push	eax
	mov	ecx, DWORD PTR _idform$[ebp]
	push	ecx
	mov	edx, DWORD PTR _res$[ebp]
	push	edx
	mov	eax, DWORD PTR _cntxt$[ebp]
	push	eax
	call	_form_eval_fieldexpr
	add	esp, 32					; 00000020H
	test	eax, eax
	je	SHORT $L70581
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 385		; 00000181H
	jmp	$eva_err$70552
$L70581:

; 386  : 			M_FREE(fieldexpr);

	mov	edx, DWORD PTR _fieldexpr$[ebp]
	push	edx
	call	_mem_free
	add	esp, 4
	mov	DWORD PTR _fieldexpr$[ebp], 0

; 387  : 
; 388  : 			/* Copy values to restbl */
; 389  : 			for(i = 0; !i || i < res->nbrows; i++)

	mov	DWORD PTR _i$[ebp], 0
	jmp	SHORT $L70582
$L70583:
	mov	eax, DWORD PTR _i$[ebp]
	add	eax, 1
	mov	DWORD PTR _i$[ebp], eax
$L70582:
	cmp	DWORD PTR _i$[ebp], 0
	je	SHORT $L70585
	mov	ecx, DWORD PTR _res$[ebp]
	mov	edx, DWORD PTR _i$[ebp]
	cmp	edx, DWORD PTR [ecx]
	jae	$L70584
$L70585:

; 391  : 				c = dyntab_cell(res, i, 0);

	push	0
	mov	eax, DWORD PTR _i$[ebp]
	push	eax
	mov	ecx, DWORD PTR _res$[ebp]
	push	ecx
	call	_dyntab_cell
	add	esp, 12					; 0000000cH
	mov	DWORD PTR _c$70561[ebp], eax

; 392  : 				DYNTAB_ADD_CELLP(&restbl, i, nbp, c);

	push	1
	mov	edx, DWORD PTR _c$70561[ebp]
	push	edx
	mov	eax, DWORD PTR _nbp$[ebp]
	push	eax
	mov	ecx, DWORD PTR _i$[ebp]
	push	ecx
	lea	edx, DWORD PTR _restbl$[ebp]
	push	edx
	call	_dyntab_copy
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L70586
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29872], OFFSET FLAT:$SG70588
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 392		; 00000188H
	jmp	$eva_err$70552
$L70586:

; 393  : 				if(!c) continue;

	cmp	DWORD PTR _c$70561[ebp], 0
	jne	SHORT $L70589
	jmp	$L70583
$L70589:

; 394  : 				if(line0 < c->Line) line0 = c->Line;

	mov	edx, DWORD PTR _c$70561[ebp]
	mov	eax, DWORD PTR _line0$70562[ebp]
	cmp	eax, DWORD PTR [edx+40]
	jae	SHORT $L70590
	mov	ecx, DWORD PTR _c$70561[ebp]
	mov	edx, DWORD PTR [ecx+40]
	mov	DWORD PTR _line0$70562[ebp], edx
$L70590:

; 395  : 				if(num0 < c->Num) num0 = c->Num;

	mov	eax, DWORD PTR _c$70561[ebp]
	mov	ecx, DWORD PTR _num0$70563[ebp]
	cmp	ecx, DWORD PTR [eax+36]
	jae	SHORT $L70591
	mov	edx, DWORD PTR _c$70561[ebp]
	mov	eax, DWORD PTR [edx+36]
	mov	DWORD PTR _num0$70563[ebp], eax
$L70591:

; 396  : 			}

	jmp	$L70583
$L70584:

; 397  : 			c = dyntab_cell(&restbl, 0, nbp);

	mov	ecx, DWORD PTR _nbp$[ebp]
	push	ecx
	push	0
	lea	edx, DWORD PTR _restbl$[ebp]
	push	edx
	call	_dyntab_cell
	add	esp, 12					; 0000000cH
	mov	DWORD PTR _c$70561[ebp], eax

; 398  : 			c->i_cgi = res->nbrows;

	mov	eax, DWORD PTR _c$70561[ebp]
	mov	ecx, DWORD PTR _res$[ebp]
	mov	edx, DWORD PTR [ecx]
	mov	DWORD PTR [eax+48], edx

; 399  : 
; 400  : 			/* Handle result mode : do not use indexes if IN () operator*/
; 401  : 			if(bracket < field + 5 || strncmp(bracket - 5, " IN (", 5))

	mov	eax, DWORD PTR _field$[ebp]
	add	eax, 5
	cmp	DWORD PTR _bracket$[ebp], eax
	jb	SHORT $L70593
	push	5
	push	OFFSET FLAT:$SG70594
	mov	ecx, DWORD PTR _bracket$[ebp]
	sub	ecx, 5
	push	ecx
	call	_strncmp
	add	esp, 12					; 0000000cH
	test	eax, eax
	je	SHORT $L70592
$L70593:

; 403  : 				c->row = num0;

	mov	edx, DWORD PTR _c$70561[ebp]
	mov	eax, DWORD PTR _num0$70563[ebp]
	mov	DWORD PTR [edx+60], eax

; 404  : 				c->col = line0;

	mov	ecx, DWORD PTR _c$70561[ebp]
	mov	edx, DWORD PTR _line0$70562[ebp]
	mov	DWORD PTR [ecx+56], edx

; 406  : 			else

	jmp	SHORT $L70595
$L70592:

; 408  : 				c->row = 0;

	mov	eax, DWORD PTR _c$70561[ebp]
	mov	DWORD PTR [eax+60], 0

; 409  : 				c->col = 0;

	mov	ecx, DWORD PTR _c$70561[ebp]
	mov	DWORD PTR [ecx+56], 0
$L70595:

; 411  : 
; 412  : 			if(line < c->col) line = c->col;

	mov	edx, DWORD PTR _c$70561[ebp]
	mov	eax, DWORD PTR _line$70556[ebp]
	cmp	eax, DWORD PTR [edx+56]
	jae	SHORT $L70596
	mov	ecx, DWORD PTR _c$70561[ebp]
	mov	edx, DWORD PTR [ecx+56]
	mov	DWORD PTR _line$70556[ebp], edx
$L70596:

; 413  : 			if(num < c->row) num = c->row;

	mov	eax, DWORD PTR _c$70561[ebp]
	mov	ecx, DWORD PTR _num$70557[ebp]
	cmp	ecx, DWORD PTR [eax+60]
	jae	SHORT $L70597
	mov	edx, DWORD PTR _c$70561[ebp]
	mov	eax, DWORD PTR [edx+60]
	mov	DWORD PTR _num$70557[ebp], eax
$L70597:

; 414  : 			nbp++;

	mov	ecx, DWORD PTR _nbp$[ebp]
	add	ecx, 1
	mov	DWORD PTR _nbp$[ebp], ecx

; 415  : 			bracket = strchr(end + 1, '[');

	push	91					; 0000005bH
	mov	edx, DWORD PTR _end$70564[ebp]
	add	edx, 1
	push	edx
	call	_strchr
	add	esp, 8
	mov	DWORD PTR _bracket$[ebp], eax

; 416  : 		}

	jmp	$L70559
$L70560:

; 417  : 		dyntab_free(res);

	mov	eax, DWORD PTR _res$[ebp]
	push	eax
	call	_dyntab_free
	add	esp, 4

; 418  : 
; 419  : 		/* If a set of values was evaluated */
; 420  : 		if(restbl.nbrows)

	cmp	DWORD PTR _restbl$[ebp], 0
	je	$L70598

; 422  : 			/* Exec SQL query for each line / num set of values */
; 423  : 			unsigned long L, N;
; 424  : 			for(L = line ? (restbl.nbcols == 1 && restbl.nbrows == 1) ? dyntab_cell(&restbl,0,0)->Line : 1 : 0;
; 425  : 					!L || (line && L <= line); L++)

	cmp	DWORD PTR _line$70556[ebp], 0
	je	SHORT $L71086
	cmp	DWORD PTR _restbl$[ebp+8], 1
	jne	SHORT $L71084
	cmp	DWORD PTR _restbl$[ebp], 1
	jne	SHORT $L71084
	push	0
	push	0
	lea	ecx, DWORD PTR _restbl$[ebp]
	push	ecx
	call	_dyntab_cell
	add	esp, 12					; 0000000cH
	mov	edx, DWORD PTR [eax+40]
	mov	DWORD PTR -5228+[ebp], edx
	jmp	SHORT $L71085
$L71084:
	mov	DWORD PTR -5228+[ebp], 1
$L71085:
	mov	eax, DWORD PTR -5228+[ebp]
	mov	DWORD PTR -5232+[ebp], eax
	jmp	SHORT $L71087
$L71086:
	mov	DWORD PTR -5232+[ebp], 0
$L71087:
	mov	ecx, DWORD PTR -5232+[ebp]
	mov	DWORD PTR _L$70599[ebp], ecx
	jmp	SHORT $L70601
$L70602:
	mov	edx, DWORD PTR _L$70599[ebp]
	add	edx, 1
	mov	DWORD PTR _L$70599[ebp], edx
$L70601:
	cmp	DWORD PTR _L$70599[ebp], 0
	je	SHORT $L70604
	cmp	DWORD PTR _line$70556[ebp], 0
	je	$L70603
	mov	eax, DWORD PTR _L$70599[ebp]
	cmp	eax, DWORD PTR _line$70556[ebp]
	ja	$L70603
$L70604:

; 426  : 				for(N = 1; (line || !num) ? N < 2 : N <= num; N++)

	mov	DWORD PTR _N$70600[ebp], 1
	jmp	SHORT $L70605
$L70606:
	mov	ecx, DWORD PTR _N$70600[ebp]
	add	ecx, 1
	mov	DWORD PTR _N$70600[ebp], ecx
$L70605:
	cmp	DWORD PTR _line$70556[ebp], 0
	jne	SHORT $L71088
	cmp	DWORD PTR _num$70557[ebp], 0
	je	SHORT $L71088
	mov	edx, DWORD PTR _N$70600[ebp]
	cmp	DWORD PTR _num$70557[ebp], edx
	sbb	eax, eax
	inc	eax
	mov	DWORD PTR -5236+[ebp], eax
	jmp	SHORT $L71089
$L71088:
	cmp	DWORD PTR _N$70600[ebp], 2
	sbb	ecx, ecx
	neg	ecx
	mov	DWORD PTR -5236+[ebp], ecx
$L71089:
	cmp	DWORD PTR -5236+[ebp], 0
	je	$L70607

; 428  : 				/* Prepare query build */
; 429  : 				char *txt = fieldgrp;

	mov	edx, DWORD PTR _fieldgrp$[ebp]
	mov	DWORD PTR _txt$70608[ebp], edx

; 430  : 				unsigned long valcnt = 0;

	mov	DWORD PTR _valcnt$70609[ebp], 0

; 431  : 				size_t len = !p[0].end ? fieldgrp_sz : p[0].beg;

	cmp	DWORD PTR _p$[ebp+4], 0
	jne	SHORT $L71090
	mov	eax, DWORD PTR _fieldgrp_sz$[ebp]
	mov	DWORD PTR -5240+[ebp], eax
	jmp	SHORT $L71091
$L71090:
	mov	ecx, DWORD PTR _p$[ebp]
	mov	DWORD PTR -5240+[ebp], ecx
$L71091:
	mov	edx, DWORD PTR -5240+[ebp]
	mov	DWORD PTR _len$70610[ebp], edx

; 432  : 				M_FREE(expr);

	mov	eax, DWORD PTR _expr$[ebp]
	push	eax
	call	_mem_free
	add	esp, 4
	mov	DWORD PTR _expr$[ebp], 0

; 433  : 				DYNBUF_ADD_STR(&expr, "SELECT ");

	push	0
	push	0
	push	7
	push	OFFSET FLAT:$SG70613
	lea	ecx, DWORD PTR _expr$[ebp]
	push	ecx
	call	_dynbuf_add
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L70612
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29872], OFFSET FLAT:$SG70615
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 433		; 000001b1H
	jmp	$eva_err$70552
$L70612:

; 434  : 				if(len) DYNBUF_ADD(&expr, txt, len, NO_CONV);

	cmp	DWORD PTR _len$70610[ebp], 0
	je	SHORT $L70618
	push	0
	push	0
	mov	ecx, DWORD PTR _len$70610[ebp]
	push	ecx
	mov	edx, DWORD PTR _txt$70608[ebp]
	push	edx
	lea	eax, DWORD PTR _expr$[ebp]
	push	eax
	call	_dynbuf_add
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L70618
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29872], OFFSET FLAT:$SG70620
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 434		; 000001b2H
	jmp	$eva_err$70552
$L70618:

; 435  : 
; 436  : 				/* Substitue each bracket result in SQL query */
; 437  : 				for(j = 0; j < restbl.nbcols; j++)

	mov	DWORD PTR _j$[ebp], 0
	jmp	SHORT $L70621
$L70622:
	mov	eax, DWORD PTR _j$[ebp]
	add	eax, 1
	mov	DWORD PTR _j$[ebp], eax
$L70621:
	mov	ecx, DWORD PTR _j$[ebp]
	cmp	ecx, DWORD PTR _restbl$[ebp+8]
	jae	$L70623

; 439  : 					/* Loop on values */
; 440  : 					DynTableCell *c0 = dyntab_cell(&restbl, 0, j);

	mov	edx, DWORD PTR _j$[ebp]
	push	edx
	push	0
	lea	eax, DWORD PTR _restbl$[ebp]
	push	eax
	call	_dyntab_cell
	add	esp, 12					; 0000000cH
	mov	DWORD PTR _c0$70624[ebp], eax

; 441  : 					int b_empty = 1;

	mov	DWORD PTR _b_empty$70625[ebp], 1

; 442  : 					for(i = 0; i < restbl.nbrows; i++)

	mov	DWORD PTR _i$[ebp], 0
	jmp	SHORT $L70626
$L70627:
	mov	ecx, DWORD PTR _i$[ebp]
	add	ecx, 1
	mov	DWORD PTR _i$[ebp], ecx
$L70626:
	mov	edx, DWORD PTR _i$[ebp]
	cmp	edx, DWORD PTR _restbl$[ebp]
	jae	$L70628

; 444  : 						DynTableCell *c = dyntab_cell(&restbl, i, j);

	mov	eax, DWORD PTR _j$[ebp]
	push	eax
	mov	ecx, DWORD PTR _i$[ebp]
	push	ecx
	lea	edx, DWORD PTR _restbl$[ebp]
	push	edx
	call	_dyntab_cell
	add	esp, 12					; 0000000cH
	mov	DWORD PTR _c$70629[ebp], eax

; 445  : 						if(((line ? !c->Line || c->Line == L :
; 446  : 								!num || c->Num == N || (c0->i_cgi <= 1 && c->Num <= 1)) &&
; 447  : 							c->txt && c->txt[0] && c->len))

	cmp	DWORD PTR _line$70556[ebp], 0
	je	SHORT $L71097
	mov	eax, DWORD PTR _c$70629[ebp]
	cmp	DWORD PTR [eax+40], 0
	je	SHORT $L71092
	mov	ecx, DWORD PTR _c$70629[ebp]
	mov	edx, DWORD PTR [ecx+40]
	cmp	edx, DWORD PTR _L$70599[ebp]
	je	SHORT $L71092
	mov	DWORD PTR -5244+[ebp], 0
	jmp	SHORT $L71096
$L71092:
	mov	DWORD PTR -5244+[ebp], 1
$L71096:
	mov	eax, DWORD PTR -5244+[ebp]
	mov	DWORD PTR -5248+[ebp], eax
	jmp	SHORT $L71098
$L71097:
	cmp	DWORD PTR _num$70557[ebp], 0
	je	SHORT $L71093
	mov	ecx, DWORD PTR _c$70629[ebp]
	mov	edx, DWORD PTR [ecx+36]
	cmp	edx, DWORD PTR _N$70600[ebp]
	je	SHORT $L71093
	mov	eax, DWORD PTR _c0$70624[ebp]
	cmp	DWORD PTR [eax+48], 1
	ja	SHORT $L71094
	mov	ecx, DWORD PTR _c$70629[ebp]
	cmp	DWORD PTR [ecx+36], 1
	jbe	SHORT $L71093
$L71094:
	mov	DWORD PTR -5252+[ebp], 0
	jmp	SHORT $L71095
$L71093:
	mov	DWORD PTR -5252+[ebp], 1
$L71095:
	mov	edx, DWORD PTR -5252+[ebp]
	mov	DWORD PTR -5248+[ebp], edx
$L71098:
	cmp	DWORD PTR -5248+[ebp], 0
	je	$L70644
	mov	eax, DWORD PTR _c$70629[ebp]
	cmp	DWORD PTR [eax], 0
	je	$L70644
	mov	ecx, DWORD PTR _c$70629[ebp]
	mov	edx, DWORD PTR [ecx]
	movsx	eax, BYTE PTR [edx]
	test	eax, eax
	je	$L70644
	mov	ecx, DWORD PTR _c$70629[ebp]
	cmp	DWORD PTR [ecx+4], 0
	je	$L70644

; 449  : 							if(!b_empty) DYNBUF_ADD_STR(&expr, ",");

	cmp	DWORD PTR _b_empty$70625[ebp], 0
	jne	SHORT $L70633
	push	0
	push	0
	push	1
	push	OFFSET FLAT:$SG70634
	lea	edx, DWORD PTR _expr$[ebp]
	push	edx
	call	_dynbuf_add
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L70633
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29872], OFFSET FLAT:$SG70636
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 449		; 000001c1H
	jmp	$eva_err$70552
$L70633:

; 450  : 							DYNBUF_ADD3_CELLP(&expr, "'", c, SQL_NO_QUOTE, "'")

	mov	edx, DWORD PTR _c$70629[ebp]
	mov	DWORD PTR __c$70637[ebp], edx
	cmp	DWORD PTR __c$70637[ebp], 0
	je	SHORT $L71099
	mov	eax, DWORD PTR __c$70637[ebp]
	mov	ecx, DWORD PTR [eax+4]
	mov	DWORD PTR -5256+[ebp], ecx
	jmp	SHORT $L71100
$L71099:
	mov	DWORD PTR -5256+[ebp], 0
$L71100:
	cmp	DWORD PTR __c$70637[ebp], 0
	je	SHORT $L71101
	mov	edx, DWORD PTR __c$70637[ebp]
	mov	eax, DWORD PTR [edx]
	mov	DWORD PTR -5260+[ebp], eax
	jmp	SHORT $L71102
$L71101:
	mov	DWORD PTR -5260+[ebp], 0
$L71102:
	push	1
	push	OFFSET FLAT:$SG70640
	push	1
	push	OFFSET FLAT:_sql_no_quote
	mov	ecx, DWORD PTR -5256+[ebp]
	push	ecx
	mov	edx, DWORD PTR -5260+[ebp]
	push	edx
	push	1
	push	OFFSET FLAT:$SG70641
	lea	eax, DWORD PTR _expr$[ebp]
	push	eax
	call	_dynbuf_add3
	add	esp, 36					; 00000024H
	test	eax, eax
	je	SHORT $L70639
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29872], OFFSET FLAT:$SG70643
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 450		; 000001c2H
	jmp	$eva_err$70552
$L70639:

; 451  : 							b_empty = 0;

	mov	DWORD PTR _b_empty$70625[ebp], 0

; 452  : 							if(line ? c->Line : num <= 1 || c->Num > 1 || N == 1) valcnt++;

	cmp	DWORD PTR _line$70556[ebp], 0
	je	SHORT $L71105
	mov	eax, DWORD PTR _c$70629[ebp]
	mov	ecx, DWORD PTR [eax+40]
	mov	DWORD PTR -5264+[ebp], ecx
	jmp	SHORT $L71106
$L71105:
	cmp	DWORD PTR _num$70557[ebp], 1
	jbe	SHORT $L71103
	mov	edx, DWORD PTR _c$70629[ebp]
	cmp	DWORD PTR [edx+36], 1
	ja	SHORT $L71103
	cmp	DWORD PTR _N$70600[ebp], 1
	je	SHORT $L71103
	mov	DWORD PTR -5268+[ebp], 0
	jmp	SHORT $L71104
$L71103:
	mov	DWORD PTR -5268+[ebp], 1
$L71104:
	mov	eax, DWORD PTR -5268+[ebp]
	mov	DWORD PTR -5264+[ebp], eax
$L71106:
	cmp	DWORD PTR -5264+[ebp], 0
	je	SHORT $L70644
	mov	ecx, DWORD PTR _valcnt$70609[ebp]
	add	ecx, 1
	mov	DWORD PTR _valcnt$70609[ebp], ecx
$L70644:

; 454  : 					}

	jmp	$L70627
$L70628:

; 455  : 
; 456  : 					/* Add empty value if no matching value found */
; 457  : 					if(b_empty) DYNBUF_ADD_STR(&expr, "''");

	cmp	DWORD PTR _b_empty$70625[ebp], 0
	je	SHORT $L70647
	push	0
	push	0
	push	2
	push	OFFSET FLAT:$SG70648
	lea	edx, DWORD PTR _expr$[ebp]
	push	edx
	call	_dynbuf_add
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L70647
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29872], OFFSET FLAT:$SG70650
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 457		; 000001c9H
	jmp	$eva_err$70552
$L70647:

; 458  : 
; 459  : 					/* Add out of brackets SQL code piece */
; 460  : 					txt = fieldgrp + p[j].end + 1;

	mov	edx, DWORD PTR _j$[ebp]
	mov	eax, DWORD PTR _p$[ebp+edx*8+4]
	mov	ecx, DWORD PTR _fieldgrp$[ebp]
	lea	edx, DWORD PTR [ecx+eax+1]
	mov	DWORD PTR _txt$70608[ebp], edx

; 461  : 					len = (j < nbp - 1 ? p[j + 1].beg : fieldgrp_sz) - p[j].end - 1;

	mov	eax, DWORD PTR _nbp$[ebp]
	sub	eax, 1
	cmp	DWORD PTR _j$[ebp], eax
	jae	SHORT $L71107
	mov	ecx, DWORD PTR _j$[ebp]
	mov	edx, DWORD PTR _p$[ebp+ecx*8+8]
	mov	DWORD PTR -5272+[ebp], edx
	jmp	SHORT $L71108
$L71107:
	mov	eax, DWORD PTR _fieldgrp_sz$[ebp]
	mov	DWORD PTR -5272+[ebp], eax
$L71108:
	mov	ecx, DWORD PTR _j$[ebp]
	mov	edx, DWORD PTR -5272+[ebp]
	sub	edx, DWORD PTR _p$[ebp+ecx*8+4]
	sub	edx, 1
	mov	DWORD PTR _len$70610[ebp], edx

; 462  : 					if(len) DYNBUF_ADD(&expr, txt, len, NO_CONV);

	cmp	DWORD PTR _len$70610[ebp], 0
	je	SHORT $L70653
	push	0
	push	0
	mov	eax, DWORD PTR _len$70610[ebp]
	push	eax
	mov	ecx, DWORD PTR _txt$70608[ebp]
	push	ecx
	lea	edx, DWORD PTR _expr$[ebp]
	push	edx
	call	_dynbuf_add
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L70653
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29872], OFFSET FLAT:$SG70655
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 462		; 000001ceH
	jmp	$eva_err$70552
$L70653:

; 463  : 				}

	jmp	$L70622
$L70623:

; 464  : 				/* Ignore value set if no value found (except when 1 row without line */
; 465  : 				if(!valcnt && (restbl.nbrows > 1 || line)) continue;

	cmp	DWORD PTR _valcnt$70609[ebp], 0
	jne	SHORT $L70656
	cmp	DWORD PTR _restbl$[ebp], 1
	ja	SHORT $L70657
	cmp	DWORD PTR _line$70556[ebp], 0
	je	SHORT $L70656
$L70657:
	jmp	$L70606
$L70656:

; 466  : 
; 467  : 				/* Exec Query */
; 468  : 				if(sql_exec_query(cntxt, expr->data) || sql_get_table(cntxt, &resgroup, 2)) STACK_ERROR;

	mov	edx, DWORD PTR _expr$[ebp]
	add	edx, 8
	push	edx
	mov	eax, DWORD PTR _cntxt$[ebp]
	push	eax
	call	_sql_exec_query
	add	esp, 8
	test	eax, eax
	jne	SHORT $L70659
	push	2
	lea	ecx, DWORD PTR _resgroup$[ebp]
	push	ecx
	mov	edx, DWORD PTR _cntxt$[ebp]
	push	edx
	call	_sql_get_table
	add	esp, 12					; 0000000cH
	test	eax, eax
	je	SHORT $L70658
$L70659:
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 468		; 000001d4H
	jmp	$eva_err$70552
$L70658:

; 469  : 
; 470  : 				/* Add results to res */
; 471  : 				M_FREE(expr);

	mov	ecx, DWORD PTR _expr$[ebp]
	push	ecx
	call	_mem_free
	add	esp, 4
	mov	DWORD PTR _expr$[ebp], 0

; 472  : 				for(j = 0; j < resgroup.nbrows; j++)

	mov	DWORD PTR _j$[ebp], 0
	jmp	SHORT $L70660
$L70661:
	mov	edx, DWORD PTR _j$[ebp]
	add	edx, 1
	mov	DWORD PTR _j$[ebp], edx
$L70660:
	mov	eax, DWORD PTR _j$[ebp]
	cmp	eax, DWORD PTR _resgroup$[ebp]
	jae	$L70662

; 474  : 					if(expr && expr->cnt) DYNBUF_ADD_STR(&expr, ",");

	cmp	DWORD PTR _expr$[ebp], 0
	je	SHORT $L70665
	mov	ecx, DWORD PTR _expr$[ebp]
	cmp	DWORD PTR [ecx+4], 0
	je	SHORT $L70665
	push	0
	push	0
	push	1
	push	OFFSET FLAT:$SG70666
	lea	edx, DWORD PTR _expr$[ebp]
	push	edx
	call	_dynbuf_add
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L70665
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29872], OFFSET FLAT:$SG70668
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 474		; 000001daH
	jmp	$eva_err$70552
$L70665:

; 475  : 					DYNBUF_ADD_CELL(&expr, &resgroup, j, 0, NO_CONV);

	push	0
	push	0
	push	0
	mov	edx, DWORD PTR _j$[ebp]
	push	edx
	lea	eax, DWORD PTR _resgroup$[ebp]
	push	eax
	call	_dyntab_sz
	add	esp, 12					; 0000000cH
	push	eax
	push	0
	mov	ecx, DWORD PTR _j$[ebp]
	push	ecx
	lea	edx, DWORD PTR _resgroup$[ebp]
	push	edx
	call	_dyntab_val
	add	esp, 12					; 0000000cH
	push	eax
	lea	eax, DWORD PTR _expr$[ebp]
	push	eax
	call	_dynbuf_add
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L70670
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29872], OFFSET FLAT:$SG70672
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 475		; 000001dbH
	jmp	$eva_err$70552
$L70670:

; 476  : 				}

	jmp	$L70661
$L70662:

; 477  : 				if(expr && expr->cnt)

	cmp	DWORD PTR _expr$[ebp], 0
	je	$L70673
	mov	eax, DWORD PTR _expr$[ebp]
	cmp	DWORD PTR [eax+4], 0
	je	$L70673

; 479  : 					unsigned long r = res->nbrows;

	mov	ecx, DWORD PTR _res$[ebp]
	mov	edx, DWORD PTR [ecx]
	mov	DWORD PTR _r$70674[ebp], edx

; 480  : 					DYNTAB_ADD_BUF(res, r, 0, expr);

	cmp	DWORD PTR _expr$[ebp], 0
	je	SHORT $L70675
	mov	eax, DWORD PTR _expr$[ebp]
	cmp	DWORD PTR [eax+4], 0
	je	SHORT $L70675
	push	0
	push	0
	mov	ecx, DWORD PTR _expr$[ebp]
	mov	edx, DWORD PTR [ecx+4]
	push	edx
	mov	eax, DWORD PTR _expr$[ebp]
	add	eax, 8
	push	eax
	push	0
	mov	ecx, DWORD PTR _r$70674[ebp]
	push	ecx
	mov	edx, DWORD PTR _res$[ebp]
	push	edx
	call	_dyntab_add
	add	esp, 28					; 0000001cH
	test	eax, eax
	je	SHORT $L70677
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29872], OFFSET FLAT:$SG70679
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 480		; 000001e0H
	jmp	$eva_err$70552
$L70677:
	jmp	SHORT $L70683
$L70675:
	push	0
	push	0
	push	0
	push	0
	push	0
	mov	edx, DWORD PTR _r$70674[ebp]
	push	edx
	mov	eax, DWORD PTR _res$[ebp]
	push	eax
	call	_dyntab_add
	add	esp, 28					; 0000001cH
	test	eax, eax
	je	SHORT $L70683
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29872], OFFSET FLAT:$SG70685
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 480		; 000001e0H
	jmp	$eva_err$70552
$L70683:

; 481  : 					dyntab_cell(res, r, 0)->Line = L;

	push	0
	mov	eax, DWORD PTR _r$70674[ebp]
	push	eax
	mov	ecx, DWORD PTR _res$[ebp]
	push	ecx
	call	_dyntab_cell
	add	esp, 12					; 0000000cH
	mov	edx, DWORD PTR _L$70599[ebp]
	mov	DWORD PTR [eax+40], edx
$L70673:

; 483  : 			}

	jmp	$L70606
$L70607:
	jmp	$L70602
$L70603:

; 485  : 		else

	jmp	$L70693
$L70598:

; 487  : 			DYNBUF_ADD3(&expr, "SELECT ", fieldgrp, fieldgrp_sz, NO_CONV, "");

	push	0
	push	OFFSET FLAT:$SG70689
	push	0
	push	0
	mov	eax, DWORD PTR _fieldgrp_sz$[ebp]
	push	eax
	mov	ecx, DWORD PTR _fieldgrp$[ebp]
	push	ecx
	push	7
	push	OFFSET FLAT:$SG70690
	lea	edx, DWORD PTR _expr$[ebp]
	push	edx
	call	_dynbuf_add3
	add	esp, 36					; 00000024H
	test	eax, eax
	je	SHORT $L70688
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29872], OFFSET FLAT:$SG70692
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 487		; 000001e7H
	jmp	$eva_err$70552
$L70688:

; 488  : 			if(sql_exec_query(cntxt, expr->data) || sql_get_table(cntxt, res, 6)) STACK_ERROR;

	mov	edx, DWORD PTR _expr$[ebp]
	add	edx, 8
	push	edx
	mov	eax, DWORD PTR _cntxt$[ebp]
	push	eax
	call	_sql_exec_query
	add	esp, 8
	test	eax, eax
	jne	SHORT $L70694
	push	6
	mov	ecx, DWORD PTR _res$[ebp]
	push	ecx
	mov	edx, DWORD PTR _cntxt$[ebp]
	push	edx
	call	_sql_get_table
	add	esp, 12					; 0000000cH
	test	eax, eax
	je	SHORT $L70693
$L70694:
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 488		; 000001e8H
	jmp	$eva_err$70552
$L70693:

; 491  : 	/* Handle trivial case : simple field */
; 492  : 	else if(!relop && !dotsep && (!paropn || groupfn))

	jmp	$L70776
$L70555:
	cmp	DWORD PTR _relop$[ebp], 0
	jne	$L70696
	cmp	DWORD PTR _dotsep$[ebp], 0
	jne	$L70696
	cmp	DWORD PTR _paropn$[ebp], 0
	je	SHORT $L70697
	cmp	DWORD PTR _groupfn$[ebp], 0
	je	$L70696
$L70697:

; 494  : 		if(data)

	cmp	DWORD PTR _data$[ebp], 0
	je	$L70698

; 496  : 			if(dyntab_from_list(&restbl, fieldgrp, fieldgrp_sz, ",", 0, 0)) RETURN_ERR_MEMORY;

	push	0
	push	0
	push	OFFSET FLAT:$SG70700
	mov	ecx, DWORD PTR _fieldgrp_sz$[ebp]
	push	ecx
	mov	edx, DWORD PTR _fieldgrp$[ebp]
	push	edx
	lea	eax, DWORD PTR _restbl$[ebp]
	push	eax
	call	_dyntab_from_list
	add	esp, 24					; 00000018H
	test	eax, eax
	je	SHORT $L70699
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29872], OFFSET FLAT:$SG70702
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 496		; 000001f0H
	jmp	$eva_err$70552
$L70699:

; 497  : 			for(i = 0; i < restbl.nbrows; i++)

	mov	DWORD PTR _i$[ebp], 0
	jmp	SHORT $L70703
$L70704:
	mov	eax, DWORD PTR _i$[ebp]
	add	eax, 1
	mov	DWORD PTR _i$[ebp], eax
$L70703:
	mov	ecx, DWORD PTR _i$[ebp]
	cmp	ecx, DWORD PTR _restbl$[ebp]
	jae	SHORT $L70705

; 499  : 				j = beg;

	mov	edx, DWORD PTR _beg$[ebp]
	mov	DWORD PTR _j$[ebp], edx

; 500  : 				if(dyntab_filter_field(res, 0, data, dyntab_val(&restbl, i, 0), ~0UL, &j)) RETURN_ERR_MEMORY;

	lea	eax, DWORD PTR _j$[ebp]
	push	eax
	push	-1
	push	0
	mov	ecx, DWORD PTR _i$[ebp]
	push	ecx
	lea	edx, DWORD PTR _restbl$[ebp]
	push	edx
	call	_dyntab_val
	add	esp, 12					; 0000000cH
	push	eax
	mov	eax, DWORD PTR _data$[ebp]
	push	eax
	push	0
	mov	ecx, DWORD PTR _res$[ebp]
	push	ecx
	call	_dyntab_filter_field
	add	esp, 24					; 00000018H
	test	eax, eax
	je	SHORT $L70706
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29872], OFFSET FLAT:$SG70708
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 500		; 000001f4H
	jmp	$eva_err$70552
$L70706:

; 501  : 			}

	jmp	SHORT $L70704
$L70705:

; 503  : 		else

	jmp	$L70718
$L70698:

; 505  : 			M_STRDUP(srchfield, fieldgrp, fieldgrp_sz);

	mov	ecx, DWORD PTR _fieldgrp_sz$[ebp]
	mov	DWORD PTR _size$70710[ebp], ecx
	mov	edx, DWORD PTR _fieldgrp$[ebp]
	mov	DWORD PTR _src$70711[ebp], edx
	mov	eax, DWORD PTR _size$70710[ebp]
	add	eax, 1
	mov	DWORD PTR _size1$70712[ebp], eax
	mov	ecx, DWORD PTR _size1$70712[ebp]
	push	ecx
	call	_mem_alloc
	add	esp, 4
	mov	DWORD PTR _srchfield$[ebp], eax
	cmp	DWORD PTR _size1$70712[ebp], 0
	je	SHORT $L70713
	cmp	DWORD PTR _srchfield$[ebp], 0
	jne	SHORT $L70713
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29872], OFFSET FLAT:$SG70715
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 505		; 000001f9H
	jmp	$eva_err$70552
$L70713:
	cmp	DWORD PTR _src$70711[ebp], 0
	je	SHORT $L70717
	cmp	DWORD PTR _size$70710[ebp], 0
	je	SHORT $L70717
	mov	ecx, DWORD PTR _size$70710[ebp]
	push	ecx
	mov	edx, DWORD PTR _src$70711[ebp]
	push	edx
	mov	eax, DWORD PTR _srchfield$[ebp]
	push	eax
	call	_memcpy
	add	esp, 12					; 0000000cH
$L70717:

; 506  : 			if(form_get_field_values(cntxt, res, srchfield, idform, idobj)) STACK_ERROR;

	mov	ecx, DWORD PTR _idobj$[ebp]
	push	ecx
	mov	edx, DWORD PTR _idform$[ebp]
	push	edx
	mov	eax, DWORD PTR _srchfield$[ebp]
	push	eax
	mov	ecx, DWORD PTR _res$[ebp]
	push	ecx
	mov	edx, DWORD PTR _cntxt$[ebp]
	push	edx
	call	_form_get_field_values
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L70718
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 506		; 000001faH
	jmp	$eva_err$70552
$L70718:

; 509  : 	/* Handle first field if it may be read from CGI or data */
; 510  : 	else if(cntxt->nb_cgi && relop > fieldgrp && (!dotsep || (relop && dotsep > relop)) && (!paropn || groupfn))

	jmp	$L70776
$L70696:
	mov	ecx, DWORD PTR _cntxt$[ebp]
	cmp	DWORD PTR [ecx+29652], 0
	je	$L70720
	mov	edx, DWORD PTR _relop$[ebp]
	cmp	edx, DWORD PTR _fieldgrp$[ebp]
	jbe	$L70720
	cmp	DWORD PTR _dotsep$[ebp], 0
	je	SHORT $L70721
	cmp	DWORD PTR _relop$[ebp], 0
	je	$L70720
	mov	eax, DWORD PTR _dotsep$[ebp]
	cmp	eax, DWORD PTR _relop$[ebp]
	jbe	$L70720
$L70721:
	cmp	DWORD PTR _paropn$[ebp], 0
	je	SHORT $L70722
	cmp	DWORD PTR _groupfn$[ebp], 0
	je	$L70720
$L70722:

; 512  : 		/* Read first field values */
; 513  : 		size_t sz = fieldgrp_sz - (relop - fieldgrp) - (relop == reldir ? 2 : 0);

	mov	ecx, DWORD PTR _relop$[ebp]
	sub	ecx, DWORD PTR _fieldgrp$[ebp]
	mov	edx, DWORD PTR _fieldgrp_sz$[ebp]
	sub	edx, ecx
	mov	eax, DWORD PTR _relop$[ebp]
	sub	eax, DWORD PTR _reldir$[ebp]
	neg	eax
	sbb	eax, eax
	and	al, -2					; fffffffeH
	add	eax, 2
	sub	edx, eax
	mov	DWORD PTR _sz$70723[ebp], edx

; 514  : 		size_t sz1 = relop - fieldgrp;

	mov	ecx, DWORD PTR _relop$[ebp]
	sub	ecx, DWORD PTR _fieldgrp$[ebp]
	mov	DWORD PTR _sz1$70724[ebp], ecx

; 515  : 		M_STRDUP(srchfield, fieldgrp, sz1);

	mov	edx, DWORD PTR _sz1$70724[ebp]
	mov	DWORD PTR _size$70725[ebp], edx
	mov	eax, DWORD PTR _fieldgrp$[ebp]
	mov	DWORD PTR _src$70726[ebp], eax
	mov	ecx, DWORD PTR _size$70725[ebp]
	add	ecx, 1
	mov	DWORD PTR _size1$70727[ebp], ecx
	mov	edx, DWORD PTR _size1$70727[ebp]
	push	edx
	call	_mem_alloc
	add	esp, 4
	mov	DWORD PTR _srchfield$[ebp], eax
	cmp	DWORD PTR _size1$70727[ebp], 0
	je	SHORT $L70728
	cmp	DWORD PTR _srchfield$[ebp], 0
	jne	SHORT $L70728
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29872], OFFSET FLAT:$SG70730
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 515		; 00000203H
	jmp	$eva_err$70552
$L70728:
	cmp	DWORD PTR _src$70726[ebp], 0
	je	SHORT $L70732
	cmp	DWORD PTR _size$70725[ebp], 0
	je	SHORT $L70732
	mov	edx, DWORD PTR _size$70725[ebp]
	push	edx
	mov	eax, DWORD PTR _src$70726[ebp]
	push	eax
	mov	ecx, DWORD PTR _srchfield$[ebp]
	push	ecx
	call	_memcpy
	add	esp, 12					; 0000000cH
$L70732:

; 516  : 		M_STRDUP(fieldexpr, relop + (relop == reldir ? 2 : 0), sz);

	mov	edx, DWORD PTR _sz$70723[ebp]
	mov	DWORD PTR _size$70733[ebp], edx
	mov	eax, DWORD PTR _relop$[ebp]
	sub	eax, DWORD PTR _reldir$[ebp]
	neg	eax
	sbb	eax, eax
	and	al, -2					; fffffffeH
	add	eax, 2
	mov	ecx, DWORD PTR _relop$[ebp]
	add	ecx, eax
	mov	DWORD PTR _src$70734[ebp], ecx
	mov	edx, DWORD PTR _size$70733[ebp]
	add	edx, 1
	mov	DWORD PTR _size1$70735[ebp], edx
	mov	eax, DWORD PTR _size1$70735[ebp]
	push	eax
	call	_mem_alloc
	add	esp, 4
	mov	DWORD PTR _fieldexpr$[ebp], eax
	cmp	DWORD PTR _size1$70735[ebp], 0
	je	SHORT $L70736
	cmp	DWORD PTR _fieldexpr$[ebp], 0
	jne	SHORT $L70736
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29872], OFFSET FLAT:$SG70738
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 516		; 00000204H
	jmp	$eva_err$70552
$L70736:
	cmp	DWORD PTR _src$70734[ebp], 0
	je	SHORT $L70740
	cmp	DWORD PTR _size$70733[ebp], 0
	je	SHORT $L70740
	mov	eax, DWORD PTR _size$70733[ebp]
	push	eax
	mov	ecx, DWORD PTR _src$70734[ebp]
	push	ecx
	mov	edx, DWORD PTR _fieldexpr$[ebp]
	push	edx
	call	_memcpy
	add	esp, 12					; 0000000cH
$L70740:

; 517  : 		if(data)

	cmp	DWORD PTR _data$[ebp], 0
	je	$L70741

; 519  : 			if(dyntab_from_list(&restbl, srchfield, sz1, ",", 0, 0)) RETURN_ERR_MEMORY;

	push	0
	push	0
	push	OFFSET FLAT:$SG70743
	mov	eax, DWORD PTR _sz1$70724[ebp]
	push	eax
	mov	ecx, DWORD PTR _srchfield$[ebp]
	push	ecx
	lea	edx, DWORD PTR _restbl$[ebp]
	push	edx
	call	_dyntab_from_list
	add	esp, 24					; 00000018H
	test	eax, eax
	je	SHORT $L70742
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29872], OFFSET FLAT:$SG70745
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 519		; 00000207H
	jmp	$eva_err$70552
$L70742:

; 520  : 			for(i = 0; i < restbl.nbrows; i++)

	mov	DWORD PTR _i$[ebp], 0
	jmp	SHORT $L70746
$L70747:
	mov	edx, DWORD PTR _i$[ebp]
	add	edx, 1
	mov	DWORD PTR _i$[ebp], edx
$L70746:
	mov	eax, DWORD PTR _i$[ebp]
	cmp	eax, DWORD PTR _restbl$[ebp]
	jae	SHORT $L70748

; 522  : 				j = beg;

	mov	ecx, DWORD PTR _beg$[ebp]
	mov	DWORD PTR _j$[ebp], ecx

; 523  : 				if(dyntab_filter_field(&id_obj, 0, data, dyntab_val(&restbl, i, 0), ~0UL, &j)) RETURN_ERR_MEMORY;

	lea	edx, DWORD PTR _j$[ebp]
	push	edx
	push	-1
	push	0
	mov	eax, DWORD PTR _i$[ebp]
	push	eax
	lea	ecx, DWORD PTR _restbl$[ebp]
	push	ecx
	call	_dyntab_val
	add	esp, 12					; 0000000cH
	push	eax
	mov	edx, DWORD PTR _data$[ebp]
	push	edx
	push	0
	lea	eax, DWORD PTR _id_obj$[ebp]
	push	eax
	call	_dyntab_filter_field
	add	esp, 24					; 00000018H
	test	eax, eax
	je	SHORT $L70749
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29872], OFFSET FLAT:$SG70751
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 523		; 0000020bH
	jmp	$eva_err$70552
$L70749:

; 524  : 			}

	jmp	$L70747
$L70748:

; 526  : 		else

	jmp	SHORT $L70753
$L70741:

; 527  : 			if(form_get_field_values(cntxt, &id_obj, srchfield, idform, idobj)) STACK_ERROR;

	mov	eax, DWORD PTR _idobj$[ebp]
	push	eax
	mov	ecx, DWORD PTR _idform$[ebp]
	push	ecx
	mov	edx, DWORD PTR _srchfield$[ebp]
	push	edx
	lea	eax, DWORD PTR _id_obj$[ebp]
	push	eax
	mov	ecx, DWORD PTR _cntxt$[ebp]
	push	ecx
	call	_form_get_field_values
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L70753
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 527		; 0000020fH
	jmp	$eva_err$70552
$L70753:

; 528  : 
; 529  : 		/* Evaluate expression on first field value */
; 530  : 		flt.b_recdata = 1;

	mov	DWORD PTR _flt$[ebp+4448], 1

; 531  : 		if(dyntab_sz(&id_obj, 0, 0) && (
; 532  : 				qry_parse_fieldexpr(cntxt, fieldexpr, sz, &flt) ||
; 533  : 				sql_get_listcol(cntxt, res, &id_obj, &flt, 0))) STACK_ERROR;

	push	0
	push	0
	lea	eax, DWORD PTR _id_obj$[ebp]
	push	eax
	call	_dyntab_sz
	add	esp, 12					; 0000000cH
	test	eax, eax
	je	SHORT $L70754
	lea	ecx, DWORD PTR _flt$[ebp]
	push	ecx
	mov	edx, DWORD PTR _sz$70723[ebp]
	push	edx
	mov	eax, DWORD PTR _fieldexpr$[ebp]
	push	eax
	mov	ecx, DWORD PTR _cntxt$[ebp]
	push	ecx
	call	_qry_parse_fieldexpr
	add	esp, 16					; 00000010H
	test	eax, eax
	jne	SHORT $L70755
	push	0
	lea	edx, DWORD PTR _flt$[ebp]
	push	edx
	lea	eax, DWORD PTR _id_obj$[ebp]
	push	eax
	mov	ecx, DWORD PTR _res$[ebp]
	push	ecx
	mov	edx, DWORD PTR _cntxt$[ebp]
	push	edx
	call	_sql_get_listcol
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L70754
$L70755:
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 533		; 00000215H
	jmp	$eva_err$70552
$L70754:

; 534  : 
; 535  : 		/* Set indexes for values - TODO : this should be explained better in documentation
; 536  : 											it allows some interesting table calculations but is some how obscure */
; 537  : 		if(dyntab_sz(&id_obj, 0, 0) && id_obj.nbrows > 1)

	push	0
	push	0
	lea	ecx, DWORD PTR _id_obj$[ebp]
	push	ecx
	call	_dyntab_sz
	add	esp, 12					; 0000000cH
	test	eax, eax
	je	$L70759
	cmp	DWORD PTR _id_obj$[ebp], 1
	jbe	$L70759

; 538  : 			for(i = 0; i < res->nbrows; i++)

	mov	DWORD PTR _i$[ebp], 0
	jmp	SHORT $L70757
$L70758:
	mov	edx, DWORD PTR _i$[ebp]
	add	edx, 1
	mov	DWORD PTR _i$[ebp], edx
$L70757:
	mov	eax, DWORD PTR _res$[ebp]
	mov	ecx, DWORD PTR _i$[ebp]
	cmp	ecx, DWORD PTR [eax]
	jae	$L70759

; 540  : 			DynTableCell *c = dyntab_cell(res, i, 0);

	push	0
	mov	edx, DWORD PTR _i$[ebp]
	push	edx
	mov	eax, DWORD PTR _res$[ebp]
	push	eax
	call	_dyntab_cell
	add	esp, 12					; 0000000cH
	mov	DWORD PTR _c$70760[ebp], eax

; 541  : 			for(j = 0; j < id_obj.nbrows; j++)

	mov	DWORD PTR _j$[ebp], 0
	jmp	SHORT $L70761
$L70762:
	mov	ecx, DWORD PTR _j$[ebp]
	add	ecx, 1
	mov	DWORD PTR _j$[ebp], ecx
$L70761:
	mov	edx, DWORD PTR _j$[ebp]
	cmp	edx, DWORD PTR _id_obj$[ebp]
	jae	SHORT $L70763

; 542  : 				if(c->IdObj == DYNTAB_TOULRC(&id_obj, j, 0))

	push	10					; 0000000aH
	push	0
	push	0
	mov	eax, DWORD PTR _j$[ebp]
	push	eax
	lea	ecx, DWORD PTR _id_obj$[ebp]
	push	ecx
	call	_dyntab_val
	add	esp, 12					; 0000000cH
	push	eax
	call	_strtoul
	add	esp, 12					; 0000000cH
	mov	edx, DWORD PTR _c$70760[ebp]
	cmp	DWORD PTR [edx+20], eax
	jne	SHORT $L70765

; 544  : 					DynTableCell *c1 = dyntab_cell(&id_obj, j, 0);

	push	0
	mov	eax, DWORD PTR _j$[ebp]
	push	eax
	lea	ecx, DWORD PTR _id_obj$[ebp]
	push	ecx
	call	_dyntab_cell
	add	esp, 12					; 0000000cH
	mov	DWORD PTR _c1$70766[ebp], eax

; 545  : 					c->Num = c1->Num;

	mov	edx, DWORD PTR _c$70760[ebp]
	mov	eax, DWORD PTR _c1$70766[ebp]
	mov	ecx, DWORD PTR [eax+36]
	mov	DWORD PTR [edx+36], ecx

; 546  : 					c->Line = c1->Line;

	mov	edx, DWORD PTR _c$70760[ebp]
	mov	eax, DWORD PTR _c1$70766[ebp]
	mov	ecx, DWORD PTR [eax+40]
	mov	DWORD PTR [edx+40], ecx

; 547  : 					break;

	jmp	SHORT $L70763
$L70765:

; 549  : 		}

	jmp	$L70762
$L70763:
	jmp	$L70758
$L70759:

; 551  : 	/* Other cases : read from DB if object exists */
; 552  : 	else if(idobj)

	jmp	$L70776
$L70720:
	cmp	DWORD PTR _idobj$[ebp], 0
	je	$L70776

; 554  : 		groupfn = NULL;

	mov	DWORD PTR _groupfn$[ebp], 0

; 555  : 		DYNTAB_ADD_INT(&id_obj, 0, 0, idobj);

	mov	BYTE PTR __tmp$70770[ebp], 0
	mov	ecx, 7
	xor	eax, eax
	lea	edi, DWORD PTR __tmp$70770[ebp+1]
	rep stosd
	stosw
	stosb
	mov	edx, DWORD PTR _idobj$[ebp]
	push	edx
	push	OFFSET FLAT:$SG70771
	lea	eax, DWORD PTR __tmp$70770[ebp]
	push	eax
	call	_sprintf
	add	esp, 12					; 0000000cH
	push	0
	push	0
	push	0
	lea	ecx, DWORD PTR __tmp$70770[ebp]
	push	ecx
	push	0
	push	0
	lea	edx, DWORD PTR _id_obj$[ebp]
	push	edx
	call	_dyntab_add
	add	esp, 28					; 0000001cH
	test	eax, eax
	je	SHORT $L70773
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29872], OFFSET FLAT:$SG70775
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 555		; 0000022bH
	jmp	$eva_err$70552
$L70773:

; 556  : 		flt.b_recdata = 1;

	mov	DWORD PTR _flt$[ebp+4448], 1

; 557  : 		if(qry_parse_fieldexpr(cntxt, field, field_sz, &flt) ||
; 558  : 			sql_get_listcol(cntxt, res, &id_obj, &flt, 0)) STACK_ERROR;

	lea	edx, DWORD PTR _flt$[ebp]
	push	edx
	mov	eax, DWORD PTR _field_sz$[ebp]
	push	eax
	mov	ecx, DWORD PTR _field$[ebp]
	push	ecx
	mov	edx, DWORD PTR _cntxt$[ebp]
	push	edx
	call	_qry_parse_fieldexpr
	add	esp, 16					; 00000010H
	test	eax, eax
	jne	SHORT $L70777
	push	0
	lea	eax, DWORD PTR _flt$[ebp]
	push	eax
	lea	ecx, DWORD PTR _id_obj$[ebp]
	push	ecx
	mov	edx, DWORD PTR _res$[ebp]
	push	edx
	mov	eax, DWORD PTR _cntxt$[ebp]
	push	eax
	call	_sql_get_listcol
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L70776
$L70777:
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 558		; 0000022eH
	jmp	$eva_err$70552
$L70776:

; 560  : 
; 561  : 	/* Handle grouping */
; 562  : 	if(groupfn)

	cmp	DWORD PTR _groupfn$[ebp], 0
	je	$L70790

; 564  : 		/* Handle MAX / MIN auto number mode */
; 565  : 		if(*groupfn == 'M')

	mov	edx, DWORD PTR _groupfn$[ebp]
	movsx	eax, BYTE PTR [edx]
	cmp	eax, 77					; 0000004dH
	jne	$L70787

; 567  : 			/* Number mode if all values are full numbers and not date */
; 568  : 			int b_num = 1;

	mov	DWORD PTR _b_num$70780[ebp], 1

; 569  : 			for(i = 0; i < res->nbrows && b_num; i++)

	mov	DWORD PTR _i$[ebp], 0
	jmp	SHORT $L70781
$L70782:
	mov	ecx, DWORD PTR _i$[ebp]
	add	ecx, 1
	mov	DWORD PTR _i$[ebp], ecx
$L70781:
	mov	edx, DWORD PTR _res$[ebp]
	mov	eax, DWORD PTR _i$[ebp]
	cmp	eax, DWORD PTR [edx]
	jae	$L70783
	cmp	DWORD PTR _b_num$70780[ebp], 0
	je	$L70783

; 571  : 				char *e, *t = dyntab_val(res, i, 0);

	push	0
	mov	ecx, DWORD PTR _i$[ebp]
	push	ecx
	mov	edx, DWORD PTR _res$[ebp]
	push	edx
	call	_dyntab_val
	add	esp, 12					; 0000000cH
	mov	DWORD PTR _t$70785[ebp], eax

; 572  : 				double n = strtod(t, &e);

	lea	eax, DWORD PTR _e$70784[ebp]
	push	eax
	mov	ecx, DWORD PTR _t$70785[ebp]
	push	ecx
	call	_strtod
	add	esp, 8
	fstp	QWORD PTR _n$70786[ebp]

; 573  : 				b_num = !*e && (n <= 10000 || datetxt_invalid(t));

	mov	edx, DWORD PTR _e$70784[ebp]
	movsx	eax, BYTE PTR [edx]
	test	eax, eax
	jne	SHORT $L71110
	fld	QWORD PTR _n$70786[ebp]
	fcomp	QWORD PTR __real@8@400c9c40000000000000
	fnstsw	ax
	test	ah, 65					; 00000041H
	jne	SHORT $L71109
	mov	ecx, DWORD PTR _t$70785[ebp]
	push	ecx
	call	_datetxt_invalid
	add	esp, 4
	test	eax, eax
	je	SHORT $L71110
$L71109:
	mov	DWORD PTR -5276+[ebp], 1
	jmp	SHORT $L71111
$L71110:
	mov	DWORD PTR -5276+[ebp], 0
$L71111:
	mov	edx, DWORD PTR -5276+[ebp]
	mov	DWORD PTR _b_num$70780[ebp], edx

; 574  : 			}

	jmp	$L70782
$L70783:

; 575  : 			if(b_num) groupfn = groupfn[1] == 'I' ? "NMIN" : "NMAX";

	cmp	DWORD PTR _b_num$70780[ebp], 0
	je	SHORT $L70787
	mov	eax, DWORD PTR _groupfn$[ebp]
	movsx	ecx, BYTE PTR [eax+1]
	cmp	ecx, 73					; 00000049H
	jne	SHORT $L71112
	mov	DWORD PTR -5280+[ebp], OFFSET FLAT:$SG70788
	jmp	SHORT $L71113
$L71112:
	mov	DWORD PTR -5280+[ebp], OFFSET FLAT:$SG70789
$L71113:
	mov	edx, DWORD PTR -5280+[ebp]
	mov	DWORD PTR _groupfn$[ebp], edx
$L70787:

; 577  : 
; 578  : 		/* Group with selected function */
; 579  : 		if(dyntab_group(res, groupfn)) CLEAR_ERROR;;

	mov	eax, DWORD PTR _groupfn$[ebp]
	push	eax
	mov	ecx, DWORD PTR _res$[ebp]
	push	ecx
	call	_dyntab_group
	add	esp, 8
	test	eax, eax
	je	SHORT $L70790
	push	579					; 00000243H
	push	OFFSET FLAT:$SG70791
	push	OFFSET FLAT:$SG70792
	mov	edx, DWORD PTR _cntxt$[ebp]
	push	edx
	call	_err_clear
	add	esp, 16					; 00000010H
$L70790:
$eva_noerr$70526:

; 581  : 
; 582  : 	RETURN_OK_CLEANUP;

	push	0
	push	OFFSET FLAT:$SG70793
	push	OFFSET FLAT:$SG70794
	mov	eax, DWORD PTR _cntxt$[ebp]
	push	eax
	call	_err_clear
	add	esp, 16					; 00000010H
$eva_err$70552:
	mov	ecx, DWORD PTR _cntxt$[ebp]
	cmp	DWORD PTR [ecx+29872], 0
	je	SHORT $L70795
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	eax, DWORD PTR [edx+29900]
	push	eax
	push	OFFSET FLAT:$SG70796
	push	OFFSET FLAT:$SG70797
	mov	ecx, DWORD PTR _cntxt$[ebp]
	push	ecx
	call	_err_add_context
	add	esp, 16					; 00000010H
$L70795:
	lea	edx, DWORD PTR _id_obj$[ebp]
	push	edx
	call	_dyntab_free
	add	esp, 4
	lea	eax, DWORD PTR _restbl$[ebp]
	push	eax
	call	_dyntab_free
	add	esp, 4
	lea	ecx, DWORD PTR _resgroup$[ebp]
	push	ecx
	call	_dyntab_free
	add	esp, 4
	lea	edx, DWORD PTR _flt$[ebp]
	push	edx
	call	_qry_build_free
	add	esp, 4
	mov	eax, DWORD PTR _pfield$[ebp]
	push	eax
	call	_mem_free
	add	esp, 4
	mov	DWORD PTR _pfield$[ebp], 0
	mov	ecx, DWORD PTR _expr$[ebp]
	push	ecx
	call	_mem_free
	add	esp, 4
	mov	DWORD PTR _expr$[ebp], 0
	mov	edx, DWORD PTR _srchfield$[ebp]
	push	edx
	call	_mem_free
	add	esp, 4
	mov	DWORD PTR _srchfield$[ebp], 0
	mov	eax, DWORD PTR _fieldexpr$[ebp]
	push	eax
	call	_mem_free
	add	esp, 4
	mov	DWORD PTR _fieldexpr$[ebp], 0
	mov	ecx, DWORD PTR __groupfn$[ebp]
	push	ecx
	call	_mem_free
	add	esp, 4
	mov	DWORD PTR __groupfn$[ebp], 0
	mov	edx, DWORD PTR _cntxt$[ebp]
	xor	eax, eax
	cmp	DWORD PTR [edx+29872], 0
	setne	al

; 583  : }

	pop	edi
	mov	esp, ebp
	pop	ebp
	ret	0
_form_eval_fieldexpr ENDP
_TEXT	ENDS
PUBLIC	_qry_parse_valtype
_DATA	SEGMENT
$SG70811 DB	'_EVA_MAIN_FORM', 00H
	ORG $+1
$SG70814 DB	'_EVA_MAIN_OBJ', 00H
	ORG $+2
$SG70817 DB	'_EVA_ALT_FORM', 00H
	ORG $+2
$SG70820 DB	'_EVA_ALT_OBJ', 00H
	ORG $+3
$SG70823 DB	'_EVA_SERVERCONFIG', 00H
	ORG $+2
$SG70826 DB	'_EVA_CURRENTSESSION', 00H
$SG70830 DB	'_EVA_USERID', 00H
$SG70831 DB	'_EVA_CURRENTUSER', 00H
	ORG $+3
$SG70832 DB	'_EVA_CURRENT_USER', 00H
	ORG $+2
$SG70835 DB	'_EVA_CURRENTFORM', 00H
	ORG $+3
$SG70839 DB	'_EVA_CURRENT', 00H
	ORG $+3
$SG70840 DB	'_EVA_CURRENTOBJ', 00H
$SG70841 DB	'_EVA_CURRENTOBJ_FIELD', 00H
	ORG $+2
$SG70842 DB	'_EVA_FIELD', 00H
	ORG $+1
$SG70846 DB	'_EVA_LISTOBJ', 00H
	ORG $+3
$SG70847 DB	'_EVA_FILTER_LISTOBJ', 00H
_DATA	ENDS
_TEXT	SEGMENT
_cntxt$ = 8
_srctype$ = 12
_listobj$ = 16
_id_form$ = 20
_id_obj$ = 24
_qry_parse_valtype PROC NEAR

; 597  : ){

	push	ebp
	mov	ebp, esp

; 598  : 	*id_form = 0;

	mov	eax, DWORD PTR _id_form$[ebp]
	mov	DWORD PTR [eax], 0

; 599  : 	*id_obj = 0;

	mov	ecx, DWORD PTR _id_obj$[ebp]
	mov	DWORD PTR [ecx], 0

; 600  : 
; 601  : 	/* Set base object & form depending on source type */
; 602  : 	if(!strcmp("_EVA_MAIN_FORM", srctype))

	mov	edx, DWORD PTR _srctype$[ebp]
	push	edx
	push	OFFSET FLAT:$SG70811
	call	_strcmp
	add	esp, 8
	test	eax, eax
	jne	SHORT $L70810

; 604  : 		*id_obj = &cntxt->id_form;

	mov	eax, DWORD PTR _id_obj$[ebp]
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax], ecx

; 606  : 	else if(!strcmp("_EVA_MAIN_OBJ", srctype))

	jmp	$L70848
$L70810:
	mov	edx, DWORD PTR _srctype$[ebp]
	push	edx
	push	OFFSET FLAT:$SG70814
	call	_strcmp
	add	esp, 8
	test	eax, eax
	jne	SHORT $L70813

; 608  : 		*id_form = &cntxt->id_form;

	mov	eax, DWORD PTR _id_form$[ebp]
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax], ecx

; 609  : 		*id_obj = &cntxt->id_obj;

	mov	edx, DWORD PTR _cntxt$[ebp]
	add	edx, 20					; 00000014H
	mov	eax, DWORD PTR _id_obj$[ebp]
	mov	DWORD PTR [eax], edx

; 611  : 	else if(!strcmp("_EVA_ALT_FORM", srctype))

	jmp	$L70848
$L70813:
	mov	ecx, DWORD PTR _srctype$[ebp]
	push	ecx
	push	OFFSET FLAT:$SG70817
	call	_strcmp
	add	esp, 8
	test	eax, eax
	jne	SHORT $L70816

; 613  : 		*id_obj = &cntxt->alt_form;

	mov	edx, DWORD PTR _cntxt$[ebp]
	add	edx, 40					; 00000028H
	mov	eax, DWORD PTR _id_obj$[ebp]
	mov	DWORD PTR [eax], edx

; 615  : 	else if(!strcmp("_EVA_ALT_OBJ", srctype))

	jmp	$L70848
$L70816:
	mov	ecx, DWORD PTR _srctype$[ebp]
	push	ecx
	push	OFFSET FLAT:$SG70820
	call	_strcmp
	add	esp, 8
	test	eax, eax
	jne	SHORT $L70819

; 617  : 		*id_form = &cntxt->alt_form;

	mov	edx, DWORD PTR _cntxt$[ebp]
	add	edx, 40					; 00000028H
	mov	eax, DWORD PTR _id_form$[ebp]
	mov	DWORD PTR [eax], edx

; 618  : 		*id_obj = &cntxt->alt_obj;

	mov	ecx, DWORD PTR _cntxt$[ebp]
	add	ecx, 60					; 0000003cH
	mov	edx, DWORD PTR _id_obj$[ebp]
	mov	DWORD PTR [edx], ecx

; 620  : 	else if(!strcmp("_EVA_SERVERCONFIG", srctype))

	jmp	$L70848
$L70819:
	mov	eax, DWORD PTR _srctype$[ebp]
	push	eax
	push	OFFSET FLAT:$SG70823
	call	_strcmp
	add	esp, 8
	test	eax, eax
	jne	SHORT $L70822

; 622  : 		*id_obj = &cntxt->id_cnf;

	mov	ecx, DWORD PTR _cntxt$[ebp]
	add	ecx, 29340				; 0000729cH
	mov	edx, DWORD PTR _id_obj$[ebp]
	mov	DWORD PTR [edx], ecx

; 624  : 	else if(!strcmp("_EVA_CURRENTSESSION", srctype))

	jmp	$L70848
$L70822:
	mov	eax, DWORD PTR _srctype$[ebp]
	push	eax
	push	OFFSET FLAT:$SG70826
	call	_strcmp
	add	esp, 8
	test	eax, eax
	jne	SHORT $L70825

; 626  : 		*id_obj = &cntxt->session;

	mov	ecx, DWORD PTR _cntxt$[ebp]
	add	ecx, 29300				; 00007274H
	mov	edx, DWORD PTR _id_obj$[ebp]
	mov	DWORD PTR [edx], ecx

; 628  : 	else if(!strcmp("_EVA_USERID", srctype) ||

	jmp	$L70848
$L70825:

; 629  : 			!strcmp("_EVA_CURRENTUSER", srctype) ||
; 630  : 			!strcmp("_EVA_CURRENT_USER", srctype))

	mov	eax, DWORD PTR _srctype$[ebp]
	push	eax
	push	OFFSET FLAT:$SG70830
	call	_strcmp
	add	esp, 8
	test	eax, eax
	je	SHORT $L70829
	mov	ecx, DWORD PTR _srctype$[ebp]
	push	ecx
	push	OFFSET FLAT:$SG70831
	call	_strcmp
	add	esp, 8
	test	eax, eax
	je	SHORT $L70829
	mov	edx, DWORD PTR _srctype$[ebp]
	push	edx
	push	OFFSET FLAT:$SG70832
	call	_strcmp
	add	esp, 8
	test	eax, eax
	jne	SHORT $L70828
$L70829:

; 632  : 		*id_obj = &cntxt->id_user;

	mov	eax, DWORD PTR _cntxt$[ebp]
	add	eax, 29408				; 000072e0H
	mov	ecx, DWORD PTR _id_obj$[ebp]
	mov	DWORD PTR [ecx], eax

; 634  : 	else if(!strcmp("_EVA_CURRENTFORM", srctype))

	jmp	$L70848
$L70828:
	mov	edx, DWORD PTR _srctype$[ebp]
	push	edx
	push	OFFSET FLAT:$SG70835
	call	_strcmp
	add	esp, 8
	test	eax, eax
	jne	SHORT $L70834

; 636  : 		*id_obj = &cntxt->form->id_form;

	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	ecx, DWORD PTR [eax+80]
	add	ecx, 12					; 0000000cH
	mov	edx, DWORD PTR _id_obj$[ebp]
	mov	DWORD PTR [edx], ecx

; 638  : 	else if(!strcmp("_EVA_CURRENT", srctype) ||

	jmp	$L70848
$L70834:

; 639  : 			!strcmp("_EVA_CURRENTOBJ", srctype) ||
; 640  : 			!strcmp("_EVA_CURRENTOBJ_FIELD", srctype) ||
; 641  : 			!strcmp("_EVA_FIELD", srctype))

	mov	eax, DWORD PTR _srctype$[ebp]
	push	eax
	push	OFFSET FLAT:$SG70839
	call	_strcmp
	add	esp, 8
	test	eax, eax
	je	SHORT $L70838
	mov	ecx, DWORD PTR _srctype$[ebp]
	push	ecx
	push	OFFSET FLAT:$SG70840
	call	_strcmp
	add	esp, 8
	test	eax, eax
	je	SHORT $L70838
	mov	edx, DWORD PTR _srctype$[ebp]
	push	edx
	push	OFFSET FLAT:$SG70841
	call	_strcmp
	add	esp, 8
	test	eax, eax
	je	SHORT $L70838
	mov	eax, DWORD PTR _srctype$[ebp]
	push	eax
	push	OFFSET FLAT:$SG70842
	call	_strcmp
	add	esp, 8
	test	eax, eax
	jne	SHORT $L70837
$L70838:

; 643  : 		*id_form = &cntxt->form->id_form;

	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	edx, DWORD PTR [ecx+80]
	add	edx, 12					; 0000000cH
	mov	eax, DWORD PTR _id_form$[ebp]
	mov	DWORD PTR [eax], edx

; 644  : 		*id_obj = &cntxt->form->id_obj;

	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	edx, DWORD PTR [ecx+80]
	add	edx, 32					; 00000020H
	mov	eax, DWORD PTR _id_obj$[ebp]
	mov	DWORD PTR [eax], edx

; 646  : 	else if(!strcmp("_EVA_LISTOBJ", srctype) ||

	jmp	SHORT $L70848
$L70837:

; 647  : 			!strcmp("_EVA_FILTER_LISTOBJ", srctype))

	mov	ecx, DWORD PTR _srctype$[ebp]
	push	ecx
	push	OFFSET FLAT:$SG70846
	call	_strcmp
	add	esp, 8
	test	eax, eax
	je	SHORT $L70845
	mov	edx, DWORD PTR _srctype$[ebp]
	push	edx
	push	OFFSET FLAT:$SG70847
	call	_strcmp
	add	esp, 8
	test	eax, eax
	jne	SHORT $L70844
$L70845:

; 649  : 		*id_obj = listobj;

	mov	eax, DWORD PTR _id_obj$[ebp]
	mov	ecx, DWORD PTR _listobj$[ebp]
	mov	DWORD PTR [eax], ecx

; 651  : 	else return 1;

	jmp	SHORT $L70848
$L70844:
	mov	eax, 1
	jmp	SHORT $L70809
$L70848:

; 652  : 	return 0;

	xor	eax, eax
$L70809:

; 653  : }

	pop	ebp
	ret	0
_qry_parse_valtype ENDP
_TEXT	ENDS
PUBLIC	_ctrl_eval_valtyp
_DATA	SEGMENT
$SG70866 DB	'D:\Travail\ABI\EVA\V4.0\CGI\Brunix-2016\action_utils.c', 00H
	ORG $+1
$SG70867 DB	'form_eval_valtype', 00H
	ORG $+2
$SG70869 DB	'D:\Travail\ABI\EVA\V4.0\CGI\Brunix-2016\action_utils.c', 00H
	ORG $+1
$SG70870 DB	'form_eval_valtype', 00H
_DATA	ENDS
_TEXT	SEGMENT
_cntxt$ = 8
_res$ = 12
_srctype$ = 16
_listobj$ = 20
_srcval$ = 24
_form_eval_valtype PROC NEAR

; 667  : ){

	push	ebp
	mov	ebp, esp

; 668  : 	if(ctrl_eval_valtyp(cntxt, NULL, res, srctype, listobj, srcval)) STACK_ERROR;

	mov	eax, DWORD PTR _srcval$[ebp]
	push	eax
	mov	ecx, DWORD PTR _listobj$[ebp]
	push	ecx
	mov	edx, DWORD PTR _srctype$[ebp]
	push	edx
	mov	eax, DWORD PTR _res$[ebp]
	push	eax
	push	0
	mov	ecx, DWORD PTR _cntxt$[ebp]
	push	ecx
	call	_ctrl_eval_valtyp
	add	esp, 24					; 00000018H
	test	eax, eax
	je	SHORT $eva_noerr$70865
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 668		; 0000029cH
	jmp	SHORT $eva_err$70864
$eva_noerr$70865:

; 669  : 	RETURN_OK_CLEANUP;

	push	0
	push	OFFSET FLAT:$SG70866
	push	OFFSET FLAT:$SG70867
	mov	eax, DWORD PTR _cntxt$[ebp]
	push	eax
	call	_err_clear
	add	esp, 16					; 00000010H
$eva_err$70864:
	mov	ecx, DWORD PTR _cntxt$[ebp]
	cmp	DWORD PTR [ecx+29872], 0
	je	SHORT $L70868
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	eax, DWORD PTR [edx+29900]
	push	eax
	push	OFFSET FLAT:$SG70869
	push	OFFSET FLAT:$SG70870
	mov	ecx, DWORD PTR _cntxt$[ebp]
	push	ecx
	call	_err_add_context
	add	esp, 16					; 00000010H
$L70868:
	mov	edx, DWORD PTR _cntxt$[ebp]
	xor	eax, eax
	cmp	DWORD PTR [edx+29872], 0
	setne	al

; 670  : }

	pop	ebp
	ret	0
_form_eval_valtype ENDP
_TEXT	ENDS
EXTRN	_qsort_col1fdesc:NEAR
EXTRN	_qsort_col1f:NEAR
EXTRN	_qry_add_table_col:NEAR
EXTRN	_ctrl_output_exprval:NEAR
EXTRN	_qry_listobj_field:NEAR
EXTRN	_ctrl_read_baseobj:NEAR
EXTRN	_qry_cache_idobj_field:NEAR
EXTRN	_qry_add_filter_forms:NEAR
EXTRN	_qry_filter_objects:NEAR
EXTRN	_dyntab_field_val:NEAR
EXTRN	_dyntab_sort:NEAR
EXTRN	_qsort_col1:NEAR
EXTRN	_qsort_col1desc:NEAR
_BSS	SEGMENT
	ALIGN	4

$SG70900 DB	01H DUP (?)
	ALIGN	4

$SG70920 DB	01H DUP (?)
	ALIGN	4

$SG71004 DB	01H DUP (?)
_BSS	ENDS
_DATA	SEGMENT
	ORG $+2
$SG70899 DB	'_EVA_VALUE', 00H
	ORG $+1
$SG70903 DB	'_EVA_SRC_FILTER', 00H
$SG70904 DB	'_EVA_FILTER', 00H
$SG70914 DB	'_EVA_SORT_VALUE', 00H
$SG70916 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70919 DB	'_EVA_SORT_MODE', 00H
	ORG $+1
$SG70925 DB	'_EVA_CONTROL', 00H
	ORG $+3
$SG70926 DB	'_EVA_INPUT', 00H
	ORG $+1
$SG70927 DB	'_EVA_FIELD', 00H
	ORG $+1
$SG70928 DB	'_EVA_SRCFIELD', 00H
	ORG $+2
$SG70929 DB	'D:\Travail\ABI\EVA\V4.0\CGI\Brunix-2016\action_utils.c', 00H
	ORG $+1
$SG70930 DB	'ctrl_eval_valtyp', 00H
	ORG $+3
$SG70932 DB	'_EVA_NUMASC', 00H
$SG70933 DB	'_EVA_NUMDESC', 00H
	ORG $+3
$SG70934 DB	'_EVA_TXTDESC', 00H
	ORG $+3
$SG70937 DB	'_EVA_EXPRVAL', 00H
	ORG $+3
$SG70944 DB	'D:\Travail\ABI\EVA\V4.0\CGI\Brunix-2016\action_utils.c', 00H
	ORG $+1
$SG70945 DB	'ctrl_eval_valtyp', 00H
	ORG $+3
$SG70952 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70955 DB	'_EVA_SRC_CTRL', 00H
	ORG $+2
$SG70958 DB	'_EVA_FIELD', 00H
	ORG $+1
$SG70968 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70977 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70996 DB	'=', 00H
	ORG $+2
$SG70998 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG71014 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG71015 DB	'D:\Travail\ABI\EVA\V4.0\CGI\Brunix-2016\action_utils.c', 00H
	ORG $+1
$SG71016 DB	'ctrl_eval_valtyp', 00H
	ORG $+3
$SG71018 DB	'D:\Travail\ABI\EVA\V4.0\CGI\Brunix-2016\action_utils.c', 00H
	ORG $+1
$SG71019 DB	'ctrl_eval_valtyp', 00H
_DATA	ENDS
_TEXT	SEGMENT
_cntxt$ = 8
_ctrl$ = 12
_res$ = 16
_srctype$ = 20
_listobj$ = 24
_srcval$ = 28
_id_form$ = -4
_id_obj$ = -32
_selobj$ = -4528
_fields$ = -28
_values$ = -52
_buf$ = -8
_flt$ = -4508
_sortmode$70918 = -4532
_idsort$70921 = -4536
_i$70938 = -5020
_exprval$70939 = -5016
_i$70961 = -5024
_i$70971 = -5028
_i$70980 = -5032
_j$70981 = -5040
_k$70982 = -5044
_idform$70983 = -5036
_expr$70992 = -5048
_sz$70993 = -5052
_ctrl_eval_valtyp PROC NEAR

; 691  : ){

	push	ebp
	mov	ebp, esp
	mov	eax, 5080				; 000013d8H
	call	__chkstk
	push	edi

; 692  : 	DynTable *id_form = NULL;

	mov	DWORD PTR _id_form$[ebp], 0

; 693  : 	DynTable *id_obj = NULL;

	mov	DWORD PTR _id_obj$[ebp], 0

; 694  : 	DynTable selobj = {0};

	mov	DWORD PTR _selobj$[ebp], 0
	xor	eax, eax
	mov	DWORD PTR _selobj$[ebp+4], eax
	mov	DWORD PTR _selobj$[ebp+8], eax
	mov	DWORD PTR _selobj$[ebp+12], eax
	mov	DWORD PTR _selobj$[ebp+16], eax

; 695  : 	DynTable fields = {0};

	mov	DWORD PTR _fields$[ebp], 0
	xor	ecx, ecx
	mov	DWORD PTR _fields$[ebp+4], ecx
	mov	DWORD PTR _fields$[ebp+8], ecx
	mov	DWORD PTR _fields$[ebp+12], ecx
	mov	DWORD PTR _fields$[ebp+16], ecx

; 696  : 	DynTable values = {0};

	mov	DWORD PTR _values$[ebp], 0
	xor	edx, edx
	mov	DWORD PTR _values$[ebp+4], edx
	mov	DWORD PTR _values$[ebp+8], edx
	mov	DWORD PTR _values$[ebp+12], edx
	mov	DWORD PTR _values$[ebp+16], edx

; 697  : 	DynBuffer *buf = NULL;

	mov	DWORD PTR _buf$[ebp], 0

; 698  : 	QryBuild flt = {{0}};

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

; 699  : 
; 700  : 	/* Check params */
; 701  : 	dyntab_free(res);

	mov	ecx, DWORD PTR _res$[ebp]
	push	ecx
	call	_dyntab_free
	add	esp, 4

; 702  : 	if(!srctype || !strcmp(srctype, "_EVA_VALUE")) srctype = "";

	cmp	DWORD PTR _srctype$[ebp], 0
	je	SHORT $L70898
	push	OFFSET FLAT:$SG70899
	mov	edx, DWORD PTR _srctype$[ebp]
	push	edx
	call	_strcmp
	add	esp, 8
	test	eax, eax
	jne	SHORT $L70897
$L70898:
	mov	DWORD PTR _srctype$[ebp], OFFSET FLAT:$SG70900
$L70897:

; 703  : 
; 704  : 	/* Set base object & form depending on source type */
; 705  : 	if(!strcmp(srctype, "_EVA_SRC_FILTER") ||
; 706  : 		!strcmp(srctype, "_EVA_FILTER"))

	push	OFFSET FLAT:$SG70903
	mov	eax, DWORD PTR _srctype$[ebp]
	push	eax
	call	_strcmp
	add	esp, 8
	test	eax, eax
	je	SHORT $L70902
	push	OFFSET FLAT:$SG70904
	mov	ecx, DWORD PTR _srctype$[ebp]
	push	ecx
	call	_strcmp
	add	esp, 8
	test	eax, eax
	jne	$L70901
$L70902:

; 708  : 		/* Source = filter : read matching objects - return empty result if none */
; 709  : 		if(qry_add_filter_forms(cntxt, &flt, NULL, listobj) ||
; 710  : 			qry_filter_objects(cntxt, &selobj, &flt)) STACK_ERROR;

	mov	edx, DWORD PTR _listobj$[ebp]
	push	edx
	push	0
	lea	eax, DWORD PTR _flt$[ebp]
	push	eax
	mov	ecx, DWORD PTR _cntxt$[ebp]
	push	ecx
	call	_qry_add_filter_forms
	add	esp, 16					; 00000010H
	test	eax, eax
	jne	SHORT $L70907
	lea	edx, DWORD PTR _flt$[ebp]
	push	edx
	lea	eax, DWORD PTR _selobj$[ebp]
	push	eax
	mov	ecx, DWORD PTR _cntxt$[ebp]
	push	ecx
	call	_qry_filter_objects
	add	esp, 12					; 0000000cH
	test	eax, eax
	je	SHORT $L70906
$L70907:
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 710		; 000002c6H
	jmp	$eva_err$70908
$L70906:

; 711  : 		if(!selobj.nbrows) RETURN_OK;

	cmp	DWORD PTR _selobj$[ebp], 0
	jne	SHORT $L70909
	jmp	$eva_noerr$70910
$L70909:

; 712  : 		id_obj = &selobj;

	lea	eax, DWORD PTR _selobj$[ebp]
	mov	DWORD PTR _id_obj$[ebp], eax

; 713  : 
; 714  : 		/* Sort objects if applicable */
; 715  : 		if(ctrl) CTRL_ATTR(fields, SORT_VALUE);

	cmp	DWORD PTR _ctrl$[ebp], 0
	je	SHORT $L70913
	lea	ecx, DWORD PTR _fields$[ebp]
	push	ecx
	call	_dyntab_free
	add	esp, 4
	push	0
	push	-1
	push	OFFSET FLAT:$SG70914
	mov	edx, DWORD PTR _ctrl$[ebp]
	add	edx, 44					; 0000002cH
	push	edx
	push	0
	lea	eax, DWORD PTR _fields$[ebp]
	push	eax
	call	_dyntab_filter_field
	add	esp, 24					; 00000018H
	test	eax, eax
	je	SHORT $L70913
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29872], OFFSET FLAT:$SG70916
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 715		; 000002cbH
	jmp	$eva_err$70908
$L70913:

; 716  : 		if(fields.nbrows)

	cmp	DWORD PTR _fields$[ebp], 0
	je	$L70931

; 718  : 			char *sortmode = CTRL_ATTR_VAL(SORT_MODE);

	cmp	DWORD PTR _ctrl$[ebp], 0
	je	SHORT $L71121
	push	0
	push	-1
	push	OFFSET FLAT:$SG70919
	mov	eax, DWORD PTR _ctrl$[ebp]
	add	eax, 44					; 0000002cH
	push	eax
	call	_dyntab_field_val
	add	esp, 16					; 00000010H
	mov	DWORD PTR -5056+[ebp], eax
	jmp	SHORT $L71122
$L71121:
	mov	DWORD PTR -5056+[ebp], OFFSET FLAT:$SG70920
$L71122:
	mov	ecx, DWORD PTR -5056+[ebp]
	mov	DWORD PTR _sortmode$70918[ebp], ecx

; 719  : 			unsigned long idsort = DYNTAB_TOUL(&fields);

	push	10					; 0000000aH
	push	0
	push	0
	push	0
	lea	edx, DWORD PTR _fields$[ebp]
	push	edx
	call	_dyntab_val
	add	esp, 12					; 0000000cH
	push	eax
	call	_strtoul
	add	esp, 12					; 0000000cH
	mov	DWORD PTR _idsort$70921[ebp], eax

; 720  : 			if(qry_obj_field(cntxt, &values, idsort, "_EVA_CONTROL") ||
; 721  : 				qry_obj_field(cntxt, &values, idsort,
; 722  : 					!strcmp(dyntab_val(&values, 0, 0), "_EVA_INPUT") ? "_EVA_FIELD" : "_EVA_SRCFIELD") ||
; 723  : 				qry_add_table_col(cntxt, id_obj, DYNTAB_VAL_SZ(&values, 0, 0))) CLEAR_ERROR;

	push	OFFSET FLAT:$SG70925
	mov	eax, DWORD PTR _idsort$70921[ebp]
	push	eax
	lea	ecx, DWORD PTR _values$[ebp]
	push	ecx
	mov	edx, DWORD PTR _cntxt$[ebp]
	push	edx
	call	_qry_obj_field
	add	esp, 16					; 00000010H
	test	eax, eax
	jne	$L70924
	push	OFFSET FLAT:$SG70926
	push	0
	push	0
	lea	eax, DWORD PTR _values$[ebp]
	push	eax
	call	_dyntab_val
	add	esp, 12					; 0000000cH
	push	eax
	call	_strcmp
	add	esp, 8
	test	eax, eax
	jne	SHORT $L71123
	mov	DWORD PTR -5060+[ebp], OFFSET FLAT:$SG70927
	jmp	SHORT $L71124
$L71123:
	mov	DWORD PTR -5060+[ebp], OFFSET FLAT:$SG70928
$L71124:
	mov	ecx, DWORD PTR -5060+[ebp]
	push	ecx
	mov	edx, DWORD PTR _idsort$70921[ebp]
	push	edx
	lea	eax, DWORD PTR _values$[ebp]
	push	eax
	mov	ecx, DWORD PTR _cntxt$[ebp]
	push	ecx
	call	_qry_obj_field
	add	esp, 16					; 00000010H
	test	eax, eax
	jne	SHORT $L70924
	push	0
	push	0
	lea	edx, DWORD PTR _values$[ebp]
	push	edx
	call	_dyntab_sz
	add	esp, 12					; 0000000cH
	push	eax
	push	0
	push	0
	lea	eax, DWORD PTR _values$[ebp]
	push	eax
	call	_dyntab_val
	add	esp, 12					; 0000000cH
	push	eax
	mov	ecx, DWORD PTR _id_obj$[ebp]
	push	ecx
	mov	edx, DWORD PTR _cntxt$[ebp]
	push	edx
	call	_qry_add_table_col
	add	esp, 16					; 00000010H
	test	eax, eax
	je	SHORT $L70923
$L70924:
	push	723					; 000002d3H
	push	OFFSET FLAT:$SG70929
	push	OFFSET FLAT:$SG70930
	mov	eax, DWORD PTR _cntxt$[ebp]
	push	eax
	call	_err_clear
	add	esp, 16					; 00000010H

; 724  : 			else

	jmp	$L70931
$L70923:

; 725  : 				dyntab_sort(id_obj, !strcmp(sortmode, "_EVA_NUMASC") ? qsort_col1f :
; 726  : 									!strcmp(sortmode, "_EVA_NUMDESC") ? qsort_col1fdesc :
; 727  : 									!strcmp(sortmode, "_EVA_TXTDESC") ? qsort_col1desc :qsort_col1);

	push	OFFSET FLAT:$SG70932
	mov	ecx, DWORD PTR _sortmode$70918[ebp]
	push	ecx
	call	_strcmp
	add	esp, 8
	test	eax, eax
	jne	SHORT $L71129
	mov	DWORD PTR -5064+[ebp], OFFSET FLAT:_qsort_col1f
	jmp	SHORT $L71130
$L71129:
	push	OFFSET FLAT:$SG70933
	mov	edx, DWORD PTR _sortmode$70918[ebp]
	push	edx
	call	_strcmp
	add	esp, 8
	test	eax, eax
	jne	SHORT $L71127
	mov	DWORD PTR -5068+[ebp], OFFSET FLAT:_qsort_col1fdesc
	jmp	SHORT $L71128
$L71127:
	push	OFFSET FLAT:$SG70934
	mov	eax, DWORD PTR _sortmode$70918[ebp]
	push	eax
	call	_strcmp
	add	esp, 8
	test	eax, eax
	jne	SHORT $L71125
	mov	DWORD PTR -5072+[ebp], OFFSET FLAT:_qsort_col1desc
	jmp	SHORT $L71126
$L71125:
	mov	DWORD PTR -5072+[ebp], OFFSET FLAT:_qsort_col1
$L71126:
	mov	ecx, DWORD PTR -5072+[ebp]
	mov	DWORD PTR -5068+[ebp], ecx
$L71128:
	mov	edx, DWORD PTR -5068+[ebp]
	mov	DWORD PTR -5064+[ebp], edx
$L71130:
	mov	eax, DWORD PTR -5064+[ebp]
	push	eax
	mov	ecx, DWORD PTR _id_obj$[ebp]
	push	ecx
	call	_dyntab_sort
	add	esp, 8
$L70931:

; 730  : 	else if(!strcmp(srctype, "_EVA_EXPRVAL"))

	jmp	$L70959
$L70901:
	push	OFFSET FLAT:$SG70937
	mov	edx, DWORD PTR _srctype$[ebp]
	push	edx
	call	_strcmp
	add	esp, 8
	test	eax, eax
	jne	$L70936

; 732  : 		unsigned long i;
; 733  : 		EVA_ctrl exprval = {{0}};

	mov	DWORD PTR _exprval$70939[ebp], 0
	xor	eax, eax
	mov	DWORD PTR _exprval$70939[ebp+4], eax
	mov	DWORD PTR _exprval$70939[ebp+8], eax
	mov	DWORD PTR _exprval$70939[ebp+12], eax
	mov	DWORD PTR _exprval$70939[ebp+16], eax
	mov	ecx, 115				; 00000073H
	xor	eax, eax
	lea	edi, DWORD PTR _exprval$70939[ebp+20]
	rep stosd

; 734  : 		if(qry_cache_idobj(&exprval.attr, DYNTAB_TOUL(listobj)) ||
; 735  : 			ctrl_read_baseobj(cntxt, &exprval.attr) ||
; 736  : 			ctrl_output_exprval(cntxt, &exprval, 3)) CLEAR_ERROR;

	push	3
	push	0
	push	10					; 0000000aH
	push	0
	push	0
	push	0
	mov	ecx, DWORD PTR _listobj$[ebp]
	push	ecx
	call	_dyntab_val
	add	esp, 12					; 0000000cH
	push	eax
	call	_strtoul
	add	esp, 12					; 0000000cH
	push	eax
	lea	edx, DWORD PTR _exprval$70939[ebp+44]
	push	edx
	mov	eax, DWORD PTR _cntxt$[ebp]
	push	eax
	call	_qry_cache_idobj_field
	add	esp, 20					; 00000014H
	test	eax, eax
	jne	SHORT $L70943
	lea	ecx, DWORD PTR _exprval$70939[ebp+44]
	push	ecx
	mov	edx, DWORD PTR _cntxt$[ebp]
	push	edx
	call	_ctrl_read_baseobj
	add	esp, 8
	test	eax, eax
	jne	SHORT $L70943
	push	3
	lea	eax, DWORD PTR _exprval$70939[ebp]
	push	eax
	mov	ecx, DWORD PTR _cntxt$[ebp]
	push	ecx
	call	_ctrl_output_exprval
	add	esp, 12					; 0000000cH
	test	eax, eax
	je	SHORT $L70942
$L70943:
	push	736					; 000002e0H
	push	OFFSET FLAT:$SG70944
	push	OFFSET FLAT:$SG70945
	mov	edx, DWORD PTR _cntxt$[ebp]
	push	edx
	call	_err_clear
	add	esp, 16					; 00000010H
$L70942:

; 737  : 		for(i = 0; i < exprval.val.nbrows; i++) if(dyntab_sz(&exprval.val, i, 0))

	mov	DWORD PTR _i$70938[ebp], 0
	jmp	SHORT $L70946
$L70947:
	mov	eax, DWORD PTR _i$70938[ebp]
	add	eax, 1
	mov	DWORD PTR _i$70938[ebp], eax
$L70946:
	mov	ecx, DWORD PTR _i$70938[ebp]
	cmp	ecx, DWORD PTR _exprval$70939[ebp+64]
	jae	SHORT $L70948
	push	0
	mov	edx, DWORD PTR _i$70938[ebp]
	push	edx
	lea	eax, DWORD PTR _exprval$70939[ebp+64]
	push	eax
	call	_dyntab_sz
	add	esp, 12					; 0000000cH
	test	eax, eax
	je	SHORT $L70950

; 738  : 			DYNTAB_ADD_CELL(res, res->nbrows, 0, &exprval.val, i, 0);

	push	1
	push	0
	mov	ecx, DWORD PTR _i$70938[ebp]
	push	ecx
	lea	edx, DWORD PTR _exprval$70939[ebp+64]
	push	edx
	call	_dyntab_cell
	add	esp, 12					; 0000000cH
	push	eax
	push	0
	mov	eax, DWORD PTR _res$[ebp]
	mov	ecx, DWORD PTR [eax]
	push	ecx
	mov	edx, DWORD PTR _res$[ebp]
	push	edx
	call	_dyntab_copy
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L70950
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29872], OFFSET FLAT:$SG70952
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 738		; 000002e2H
	jmp	$eva_err$70908
$L70950:
	jmp	$L70947
$L70948:

; 739  : 		RETURN_OK;

	jmp	$eva_noerr$70910
$L70936:

; 741  : 	else if(!strcmp(srctype, "_EVA_SRC_CTRL"))

	push	OFFSET FLAT:$SG70955
	mov	edx, DWORD PTR _srctype$[ebp]
	push	edx
	call	_strcmp
	add	esp, 8
	test	eax, eax
	jne	SHORT $L70954

; 743  : 		if(qry_listobj_field(cntxt, &fields, listobj, "_EVA_FIELD") ||
; 744  : 			form_get_fields_values(cntxt, &selobj, &fields, 0, 0)) STACK_ERROR;

	push	OFFSET FLAT:$SG70958
	mov	eax, DWORD PTR _listobj$[ebp]
	push	eax
	lea	ecx, DWORD PTR _fields$[ebp]
	push	ecx
	mov	edx, DWORD PTR _cntxt$[ebp]
	push	edx
	call	_qry_listobj_field
	add	esp, 16					; 00000010H
	test	eax, eax
	jne	SHORT $L70957
	push	0
	push	0
	lea	eax, DWORD PTR _fields$[ebp]
	push	eax
	lea	ecx, DWORD PTR _selobj$[ebp]
	push	ecx
	mov	edx, DWORD PTR _cntxt$[ebp]
	push	edx
	call	_form_get_fields_values
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L70956
$L70957:
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 744		; 000002e8H
	jmp	$eva_err$70908
$L70956:

; 745  : 		id_obj = &selobj;

	lea	ecx, DWORD PTR _selobj$[ebp]
	mov	DWORD PTR _id_obj$[ebp], ecx

; 747  : 	else

	jmp	SHORT $L70959
$L70954:

; 748  : 		qry_parse_valtype(cntxt, srctype, listobj, &id_form, &id_obj);

	lea	edx, DWORD PTR _id_obj$[ebp]
	push	edx
	lea	eax, DWORD PTR _id_form$[ebp]
	push	eax
	mov	ecx, DWORD PTR _listobj$[ebp]
	push	ecx
	mov	edx, DWORD PTR _srctype$[ebp]
	push	edx
	mov	eax, DWORD PTR _cntxt$[ebp]
	push	eax
	call	_qry_parse_valtype
	add	esp, 20					; 00000014H
$L70959:

; 749  : 
; 750  : 	/* Set result depending on base object & values */
; 751  : 	if(!id_obj)

	cmp	DWORD PTR _id_obj$[ebp], 0
	jne	$L70960

; 753  : 		/* Copy fixed values to result */
; 754  : 		unsigned long i;
; 755  : 		if(srcval) for(i = 0; i < srcval->nbrows; i++)

	cmp	DWORD PTR _srcval$[ebp], 0
	je	$L70965
	mov	DWORD PTR _i$70961[ebp], 0
	jmp	SHORT $L70963
$L70964:
	mov	ecx, DWORD PTR _i$70961[ebp]
	add	ecx, 1
	mov	DWORD PTR _i$70961[ebp], ecx
$L70963:
	mov	edx, DWORD PTR _srcval$[ebp]
	mov	eax, DWORD PTR _i$70961[ebp]
	cmp	eax, DWORD PTR [edx]
	jae	$L70965

; 757  : 			DYNTAB_ADD_CELL(res, i, 0, srcval, i, 0);

	push	1
	push	0
	mov	ecx, DWORD PTR _i$70961[ebp]
	push	ecx
	mov	edx, DWORD PTR _srcval$[ebp]
	push	edx
	call	_dyntab_cell
	add	esp, 12					; 0000000cH
	push	eax
	push	0
	mov	eax, DWORD PTR _i$70961[ebp]
	push	eax
	mov	ecx, DWORD PTR _res$[ebp]
	push	ecx
	call	_dyntab_copy
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L70966
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29872], OFFSET FLAT:$SG70968
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 757		; 000002f5H
	jmp	$eva_err$70908
$L70966:

; 758  : 			dyntab_cell(res, i, 0)->Num = 1;

	push	0
	mov	ecx, DWORD PTR _i$70961[ebp]
	push	ecx
	mov	edx, DWORD PTR _res$[ebp]
	push	edx
	call	_dyntab_cell
	add	esp, 12					; 0000000cH
	mov	DWORD PTR [eax+36], 1

; 759  : 			dyntab_cell(res, i, 0)->Line = 0;

	push	0
	mov	eax, DWORD PTR _i$70961[ebp]
	push	eax
	mov	ecx, DWORD PTR _res$[ebp]
	push	ecx
	call	_dyntab_cell
	add	esp, 12					; 0000000cH
	mov	DWORD PTR [eax+40], 0

; 760  : 		}

	jmp	$L70964
$L70965:

; 762  : 	else if(!dyntab_sz(srcval, 0, 0))

	jmp	$L70987
$L70960:
	push	0
	push	0
	mov	edx, DWORD PTR _srcval$[ebp]
	push	edx
	call	_dyntab_sz
	add	esp, 12					; 0000000cH
	test	eax, eax
	jne	$L70970

; 764  : 		/* Copy object id to result */
; 765  : 		unsigned long i;
; 766  : 		for(i = 0; i < id_obj->nbrows; i++)

	mov	DWORD PTR _i$70971[ebp], 0
	jmp	SHORT $L70972
$L70973:
	mov	eax, DWORD PTR _i$70971[ebp]
	add	eax, 1
	mov	DWORD PTR _i$70971[ebp], eax
$L70972:
	mov	ecx, DWORD PTR _id_obj$[ebp]
	mov	edx, DWORD PTR _i$70971[ebp]
	cmp	edx, DWORD PTR [ecx]
	jae	SHORT $L70974

; 768  : 			DYNTAB_ADD_CELL(res, i, 0, id_obj, i, 0);

	push	1
	push	0
	mov	eax, DWORD PTR _i$70971[ebp]
	push	eax
	mov	ecx, DWORD PTR _id_obj$[ebp]
	push	ecx
	call	_dyntab_cell
	add	esp, 12					; 0000000cH
	push	eax
	push	0
	mov	edx, DWORD PTR _i$70971[ebp]
	push	edx
	mov	eax, DWORD PTR _res$[ebp]
	push	eax
	call	_dyntab_copy
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L70975
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29872], OFFSET FLAT:$SG70977
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 768		; 00000300H
	jmp	$eva_err$70908
$L70975:

; 769  : 			dyntab_cell(res, i, 0)->b_relation = 1;

	push	0
	mov	eax, DWORD PTR _i$70971[ebp]
	push	eax
	mov	ecx, DWORD PTR _res$[ebp]
	push	ecx
	call	_dyntab_cell
	add	esp, 12					; 0000000cH
	mov	BYTE PTR [eax+12], 1

; 770  : 		}

	jmp	$L70973
$L70974:

; 772  : 	else if(srcval && srcval->nbrows)

	jmp	$L70987
$L70970:
	cmp	DWORD PTR _srcval$[ebp], 0
	je	$L70987
	mov	edx, DWORD PTR _srcval$[ebp]
	cmp	DWORD PTR [edx], 0
	je	$L70987

; 774  : 		/* Evaluate each expression & add to result */
; 775  : 		unsigned long i, j, k, idform = id_form ? DYNTAB_TOUL(id_form) : 0;

	cmp	DWORD PTR _id_form$[ebp], 0
	je	SHORT $L71131
	push	10					; 0000000aH
	push	0
	push	0
	push	0
	mov	eax, DWORD PTR _id_form$[ebp]
	push	eax
	call	_dyntab_val
	add	esp, 12					; 0000000cH
	push	eax
	call	_strtoul
	add	esp, 12					; 0000000cH
	mov	DWORD PTR -5076+[ebp], eax
	jmp	SHORT $L71132
$L71131:
	mov	DWORD PTR -5076+[ebp], 0
$L71132:
	mov	ecx, DWORD PTR -5076+[ebp]
	mov	DWORD PTR _idform$70983[ebp], ecx

; 776  : 		for(k = 0; !k || k < id_obj->nbrows; k++) for(i = 0; i < srcval->nbrows; i++)

	mov	DWORD PTR _k$70982[ebp], 0
	jmp	SHORT $L70985
$L70986:
	mov	edx, DWORD PTR _k$70982[ebp]
	add	edx, 1
	mov	DWORD PTR _k$70982[ebp], edx
$L70985:
	cmp	DWORD PTR _k$70982[ebp], 0
	je	SHORT $L70988
	mov	eax, DWORD PTR _id_obj$[ebp]
	mov	ecx, DWORD PTR _k$70982[ebp]
	cmp	ecx, DWORD PTR [eax]
	jae	$L70987
$L70988:
	mov	DWORD PTR _i$70980[ebp], 0
	jmp	SHORT $L70989
$L70990:
	mov	edx, DWORD PTR _i$70980[ebp]
	add	edx, 1
	mov	DWORD PTR _i$70980[ebp], edx
$L70989:
	mov	eax, DWORD PTR _srcval$[ebp]
	mov	ecx, DWORD PTR _i$70980[ebp]
	cmp	ecx, DWORD PTR [eax]
	jae	$L70991

; 778  : 			char *expr = dyntab_val(srcval, i, 0);

	push	0
	mov	edx, DWORD PTR _i$70980[ebp]
	push	edx
	mov	eax, DWORD PTR _srcval$[ebp]
	push	eax
	call	_dyntab_val
	add	esp, 12					; 0000000cH
	mov	DWORD PTR _expr$70992[ebp], eax

; 779  : 			size_t sz = dyntab_sz(srcval, i, 0);

	push	0
	mov	ecx, DWORD PTR _i$70980[ebp]
	push	ecx
	mov	edx, DWORD PTR _srcval$[ebp]
	push	edx
	call	_dyntab_sz
	add	esp, 12					; 0000000cH
	mov	DWORD PTR _sz$70993[ebp], eax

; 780  : 			M_FREE(buf);

	mov	eax, DWORD PTR _buf$[ebp]
	push	eax
	call	_mem_free
	add	esp, 4
	mov	DWORD PTR _buf$[ebp], 0

; 781  : 			DYNBUF_ADD_STR(&buf, "=");

	push	0
	push	0
	push	1
	push	OFFSET FLAT:$SG70996
	lea	ecx, DWORD PTR _buf$[ebp]
	push	ecx
	call	_dynbuf_add
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L70995
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29872], OFFSET FLAT:$SG70998
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 781		; 0000030dH
	jmp	$eva_err$70908
$L70995:

; 782  : 			if(qry_eval_sqlexpr_var(cntxt, &buf, expr, ctrl ? &ctrl->attr : NULL, NULL)) STACK_ERROR;

	cmp	DWORD PTR _ctrl$[ebp], 0
	je	SHORT $L71133
	mov	ecx, DWORD PTR _ctrl$[ebp]
	add	ecx, 44					; 0000002cH
	mov	DWORD PTR -5080+[ebp], ecx
	jmp	SHORT $L71134
$L71133:
	mov	DWORD PTR -5080+[ebp], 0
$L71134:
	push	0
	mov	edx, DWORD PTR -5080+[ebp]
	push	edx
	mov	eax, DWORD PTR _expr$70992[ebp]
	push	eax
	lea	ecx, DWORD PTR _buf$[ebp]
	push	ecx
	mov	edx, DWORD PTR _cntxt$[ebp]
	push	edx
	call	_qry_eval_sqlexpr_var
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L71001
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 782		; 0000030eH
	jmp	$eva_err$70908
$L71001:

; 783  : 			if(strcmp(buf->data + 1, expr))

	mov	ecx, DWORD PTR _expr$70992[ebp]
	push	ecx
	mov	edx, DWORD PTR _buf$[ebp]
	add	edx, 9
	push	edx
	call	_strcmp
	add	esp, 8
	test	eax, eax
	je	SHORT $L71003

; 785  : 				j = !strchr(buf->data, '[') ? 0 : 1;

	push	91					; 0000005bH
	mov	eax, DWORD PTR _buf$[ebp]
	add	eax, 8
	push	eax
	call	_strchr
	add	esp, 8
	neg	eax
	sbb	eax, eax
	neg	eax
	mov	DWORD PTR _j$70981[ebp], eax

; 786  : 				expr = buf->data + j;

	mov	ecx, DWORD PTR _j$70981[ebp]
	mov	edx, DWORD PTR _buf$[ebp]
	lea	eax, DWORD PTR [edx+ecx+8]
	mov	DWORD PTR _expr$70992[ebp], eax

; 787  : 				sz = buf->cnt - j;

	mov	ecx, DWORD PTR _buf$[ebp]
	mov	edx, DWORD PTR [ecx+4]
	sub	edx, DWORD PTR _j$70981[ebp]
	mov	DWORD PTR _sz$70993[ebp], edx

; 788  : 				if(!sz) expr = "";

	cmp	DWORD PTR _sz$70993[ebp], 0
	jne	SHORT $L71003
	mov	DWORD PTR _expr$70992[ebp], OFFSET FLAT:$SG71004
$L71003:

; 790  : 			if(form_eval_fieldexpr(cntxt, &values, idform, DYNTAB_TOULRC(id_obj, k, 0), expr, sz, NULL, 0)) STACK_ERROR;

	push	0
	push	0
	mov	eax, DWORD PTR _sz$70993[ebp]
	push	eax
	mov	ecx, DWORD PTR _expr$70992[ebp]
	push	ecx
	push	10					; 0000000aH
	push	0
	push	0
	mov	edx, DWORD PTR _k$70982[ebp]
	push	edx
	mov	eax, DWORD PTR _id_obj$[ebp]
	push	eax
	call	_dyntab_val
	add	esp, 12					; 0000000cH
	push	eax
	call	_strtoul
	add	esp, 12					; 0000000cH
	push	eax
	mov	ecx, DWORD PTR _idform$70983[ebp]
	push	ecx
	lea	edx, DWORD PTR _values$[ebp]
	push	edx
	mov	eax, DWORD PTR _cntxt$[ebp]
	push	eax
	call	_form_eval_fieldexpr
	add	esp, 32					; 00000020H
	test	eax, eax
	je	SHORT $L71007
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 790		; 00000316H
	jmp	$eva_err$70908
$L71007:

; 791  : 			for(j = 0; j < values.nbrows; j++) if(dyntab_sz(&values, j, 0))

	mov	DWORD PTR _j$70981[ebp], 0
	jmp	SHORT $L71008
$L71009:
	mov	edx, DWORD PTR _j$70981[ebp]
	add	edx, 1
	mov	DWORD PTR _j$70981[ebp], edx
$L71008:
	mov	eax, DWORD PTR _j$70981[ebp]
	cmp	eax, DWORD PTR _values$[ebp]
	jae	SHORT $L71010
	push	0
	mov	ecx, DWORD PTR _j$70981[ebp]
	push	ecx
	lea	edx, DWORD PTR _values$[ebp]
	push	edx
	call	_dyntab_sz
	add	esp, 12					; 0000000cH
	test	eax, eax
	je	SHORT $L71012

; 792  : 				DYNTAB_ADD_CELL(res, res->nbrows, 0, &values, j, 0);

	push	1
	push	0
	mov	eax, DWORD PTR _j$70981[ebp]
	push	eax
	lea	ecx, DWORD PTR _values$[ebp]
	push	ecx
	call	_dyntab_cell
	add	esp, 12					; 0000000cH
	push	eax
	push	0
	mov	edx, DWORD PTR _res$[ebp]
	mov	eax, DWORD PTR [edx]
	push	eax
	mov	ecx, DWORD PTR _res$[ebp]
	push	ecx
	call	_dyntab_copy
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L71012
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29872], OFFSET FLAT:$SG71014
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 792		; 00000318H
	jmp	SHORT $eva_err$70908
$L71012:
	jmp	$L71009
$L71010:

; 793  : 		}

	jmp	$L70990
$L70991:
	jmp	$L70986
$L70987:
$eva_noerr$70910:

; 795  : 
; 796  : 	RETURN_OK_CLEANUP;

	push	0
	push	OFFSET FLAT:$SG71015
	push	OFFSET FLAT:$SG71016
	mov	ecx, DWORD PTR _cntxt$[ebp]
	push	ecx
	call	_err_clear
	add	esp, 16					; 00000010H
$eva_err$70908:
	mov	edx, DWORD PTR _cntxt$[ebp]
	cmp	DWORD PTR [edx+29872], 0
	je	SHORT $L71017
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	ecx, DWORD PTR [eax+29900]
	push	ecx
	push	OFFSET FLAT:$SG71018
	push	OFFSET FLAT:$SG71019
	mov	edx, DWORD PTR _cntxt$[ebp]
	push	edx
	call	_err_add_context
	add	esp, 16					; 00000010H
$L71017:
	lea	eax, DWORD PTR _selobj$[ebp]
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
	mov	eax, DWORD PTR _buf$[ebp]
	push	eax
	call	_mem_free
	add	esp, 4
	mov	DWORD PTR _buf$[ebp], 0
	lea	ecx, DWORD PTR _flt$[ebp]
	push	ecx
	call	_qry_build_free
	add	esp, 4
	mov	edx, DWORD PTR _cntxt$[ebp]
	xor	eax, eax
	cmp	DWORD PTR [edx+29872], 0
	setne	al

; 797  : }

	pop	edi
	mov	esp, ebp
	pop	ebp
	ret	0
_ctrl_eval_valtyp ENDP
_TEXT	ENDS
END
