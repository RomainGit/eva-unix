	TITLE	D:\Travail\ABI\EVA\V4.0\CGI\Brunix-2016\ctrl_access.c
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
PUBLIC	_ctrl_parse_access
EXTRN	_strcmp:NEAR
_DATA	SEGMENT
$SG70212 DB	'_EVA_ACCES_NONE', 00H
$SG70214 DB	'_EVA_ACCES_VIEW', 00H
_DATA	ENDS
_TEXT	SEGMENT
_access$ = 8
_exec$ = 12
_objcreat$ = 16
_objdel$ = 20
_ctrl_parse_access PROC NEAR

; 26   : ){

	push	ebp
	mov	ebp, esp

; 27   : 	/* Control view / edit access */
; 28   : 	*access = AccessNone;

	mov	eax, DWORD PTR _access$[ebp]
	mov	DWORD PTR [eax], 0

; 29   : 	if(!strcmp("_EVA_ACCES_NONE", exec)) return;

	mov	ecx, DWORD PTR _exec$[ebp]
	push	ecx
	push	OFFSET FLAT:$SG70212
	call	_strcmp
	add	esp, 8
	test	eax, eax
	jne	SHORT $L70211
	jmp	SHORT $L70217
$L70211:

; 30   : 	if(!strcmp("_EVA_ACCES_VIEW", exec)) *access |= AccessView;

	mov	edx, DWORD PTR _exec$[ebp]
	push	edx
	push	OFFSET FLAT:$SG70214
	call	_strcmp
	add	esp, 8
	test	eax, eax
	jne	SHORT $L70213
	mov	eax, DWORD PTR _access$[ebp]
	mov	ecx, DWORD PTR [eax]
	or	ecx, 1
	mov	edx, DWORD PTR _access$[ebp]
	mov	DWORD PTR [edx], ecx

; 31   : 	else *access |= AccessView | AccessEdit;

	jmp	SHORT $L70215
$L70213:
	mov	eax, DWORD PTR _access$[ebp]
	mov	ecx, DWORD PTR [eax]
	or	ecx, 3
	mov	edx, DWORD PTR _access$[ebp]
	mov	DWORD PTR [edx], ecx
$L70215:

; 32   : 
; 33   : 	/* Form create / delete access */
; 34   : 	if(objcreat && !*objcreat) *access |= AccessCreate;

	cmp	DWORD PTR _objcreat$[ebp], 0
	je	SHORT $L70216
	mov	eax, DWORD PTR _objcreat$[ebp]
	movsx	ecx, BYTE PTR [eax]
	test	ecx, ecx
	jne	SHORT $L70216
	mov	edx, DWORD PTR _access$[ebp]
	mov	eax, DWORD PTR [edx]
	or	al, 4
	mov	ecx, DWORD PTR _access$[ebp]
	mov	DWORD PTR [ecx], eax
$L70216:

; 35   : 	if(objdel && !*objdel) *access |= AccessDelete;

	cmp	DWORD PTR _objdel$[ebp], 0
	je	SHORT $L70217
	mov	edx, DWORD PTR _objdel$[ebp]
	movsx	eax, BYTE PTR [edx]
	test	eax, eax
	jne	SHORT $L70217
	mov	ecx, DWORD PTR _access$[ebp]
	mov	edx, DWORD PTR [ecx]
	or	edx, 8
	mov	eax, DWORD PTR _access$[ebp]
	mov	DWORD PTR [eax], edx
$L70217:

; 36   :  }

	pop	ebp
	ret	0
_ctrl_parse_access ENDP
_TEXT	ENDS
PUBLIC	_obj_check_user_access
EXTRN	_dyntab_free:NEAR
EXTRN	_dyntab_cell:NEAR
EXTRN	_err_add_context:NEAR
EXTRN	_err_clear:NEAR
EXTRN	_dyntab_txt_cmp:NEAR
EXTRN	_dyntab_cmp:NEAR
EXTRN	_dyntab_filter_field:NEAR
_DATA	SEGMENT
$SG70233 DB	'_EVA_GRANT_EDIT', 00H
$SG70235 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70238 DB	'_EVA_GRANT_VIEW', 00H
$SG70240 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70248 DB	'_EVA_GRANT_EDIT', 00H
$SG70259 DB	'_EVA_GRANT_EDIT', 00H
$SG70260 DB	'D:\Travail\ABI\EVA\V4.0\CGI\Brunix-2016\ctrl_access.c', 00H
	ORG $+2
$SG70261 DB	'obj_check_user_access', 00H
	ORG $+2
$SG70263 DB	'D:\Travail\ABI\EVA\V4.0\CGI\Brunix-2016\ctrl_access.c', 00H
	ORG $+2
$SG70264 DB	'obj_check_user_access', 00H
_DATA	ENDS
_TEXT	SEGMENT
_cntxt$ = 8
_data$ = 12
_beg$ = 16
_acc$ = 20
_usergroup$ = -20
_i$ = -24
_j$ = -28
_c$70247 = -32
_c$70252 = -36
_txt$70253 = -40
_sz$70254 = -44
_obj_check_user_access PROC NEAR

; 49   : ){

	push	ebp
	mov	ebp, esp
	sub	esp, 52					; 00000034H

; 50   : 	DynTable usergroup = { 0 };

	mov	DWORD PTR _usergroup$[ebp], 0
	xor	eax, eax
	mov	DWORD PTR _usergroup$[ebp+4], eax
	mov	DWORD PTR _usergroup$[ebp+8], eax
	mov	DWORD PTR _usergroup$[ebp+12], eax
	mov	DWORD PTR _usergroup$[ebp+16], eax

; 51   : 	unsigned long i, j;
; 52   : 
; 53   : 	/* Read access grants - return full access if no restrictions */
; 54   : 	i = beg;

	mov	ecx, DWORD PTR _beg$[ebp]
	mov	DWORD PTR _i$[ebp], ecx

; 55   : 	if(dyntab_filter_field(&usergroup, 0, data, "_EVA_GRANT_EDIT", ~0UL, &i)) RETURN_ERR_MEMORY;

	lea	edx, DWORD PTR _i$[ebp]
	push	edx
	push	-1
	push	OFFSET FLAT:$SG70233
	mov	eax, DWORD PTR _data$[ebp]
	push	eax
	push	0
	lea	ecx, DWORD PTR _usergroup$[ebp]
	push	ecx
	call	_dyntab_filter_field
	add	esp, 24					; 00000018H
	test	eax, eax
	je	SHORT $L70232
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29872], OFFSET FLAT:$SG70235
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 55		; 00000037H
	jmp	$eva_err$70236
$L70232:

; 56   : 	i = beg;

	mov	ecx, DWORD PTR _beg$[ebp]
	mov	DWORD PTR _i$[ebp], ecx

; 57   : 	if(dyntab_filter_field(&usergroup, 0, data, "_EVA_GRANT_VIEW", ~0UL, &i)) RETURN_ERR_MEMORY;

	lea	edx, DWORD PTR _i$[ebp]
	push	edx
	push	-1
	push	OFFSET FLAT:$SG70238
	mov	eax, DWORD PTR _data$[ebp]
	push	eax
	push	0
	lea	ecx, DWORD PTR _usergroup$[ebp]
	push	ecx
	call	_dyntab_filter_field
	add	esp, 24					; 00000018H
	test	eax, eax
	je	SHORT $L70237
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29872], OFFSET FLAT:$SG70240
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 57		; 00000039H
	jmp	$eva_err$70236
$L70237:

; 58   : 	if(!usergroup.nbrows)

	cmp	DWORD PTR _usergroup$[ebp], 0
	jne	SHORT $L70241

; 60   : 		*acc = AccessView | AccessEdit;

	mov	ecx, DWORD PTR _acc$[ebp]
	mov	DWORD PTR [ecx], 3

; 61   : 		RETURN_OK;

	jmp	$eva_noerr$70242
$L70241:

; 63   : 
; 64   : 	/*  Select access on user */
; 65   : 	for(i = 0; i < usergroup.nbrows; i++)

	mov	DWORD PTR _i$[ebp], 0
	jmp	SHORT $L70243
$L70244:
	mov	edx, DWORD PTR _i$[ebp]
	add	edx, 1
	mov	DWORD PTR _i$[ebp], edx
$L70243:
	mov	eax, DWORD PTR _i$[ebp]
	cmp	eax, DWORD PTR _usergroup$[ebp]
	jae	SHORT $L70245

; 66   : 		if(!dyntab_cmp(&usergroup, i, 0, &cntxt->id_user, 0, 0))

	push	0
	push	0
	mov	ecx, DWORD PTR _cntxt$[ebp]
	add	ecx, 29408				; 000072e0H
	push	ecx
	push	0
	mov	edx, DWORD PTR _i$[ebp]
	push	edx
	lea	eax, DWORD PTR _usergroup$[ebp]
	push	eax
	call	_dyntab_cmp
	add	esp, 24					; 00000018H
	test	eax, eax
	jne	SHORT $L70246

; 68   : 			DynTableCell *c = dyntab_cell(&usergroup, i, 0);

	push	0
	mov	ecx, DWORD PTR _i$[ebp]
	push	ecx
	lea	edx, DWORD PTR _usergroup$[ebp]
	push	edx
	call	_dyntab_cell
	add	esp, 12					; 0000000cH
	mov	DWORD PTR _c$70247[ebp], eax

; 69   : 			*acc |= (c->field && strcmp(c->field, "_EVA_GRANT_EDIT")) ? AccessView : AccessEdit;

	mov	eax, DWORD PTR _c$70247[ebp]
	cmp	DWORD PTR [eax+8], 0
	je	SHORT $L71127
	push	OFFSET FLAT:$SG70248
	mov	ecx, DWORD PTR _c$70247[ebp]
	mov	edx, DWORD PTR [ecx+8]
	push	edx
	call	_strcmp
	add	esp, 8
	test	eax, eax
	je	SHORT $L71127
	mov	DWORD PTR -48+[ebp], 1
	jmp	SHORT $L71128
$L71127:
	mov	DWORD PTR -48+[ebp], 2
$L71128:
	mov	eax, DWORD PTR _acc$[ebp]
	mov	ecx, DWORD PTR [eax]
	or	ecx, DWORD PTR -48+[ebp]
	mov	edx, DWORD PTR _acc$[ebp]
	mov	DWORD PTR [edx], ecx
$L70246:

; 71   : 
; 72   : 	/*  Select access on user groups */
; 73   : 	for(i = 0; i < usergroup.nbrows; i++)

	jmp	$L70244
$L70245:
	mov	DWORD PTR _i$[ebp], 0
	jmp	SHORT $L70249
$L70250:
	mov	eax, DWORD PTR _i$[ebp]
	add	eax, 1
	mov	DWORD PTR _i$[ebp], eax
$L70249:
	mov	ecx, DWORD PTR _i$[ebp]
	cmp	ecx, DWORD PTR _usergroup$[ebp]
	jae	$eva_noerr$70242

; 75   : 		DynTableCell *c = dyntab_cell(&usergroup, i, 0);

	push	0
	mov	edx, DWORD PTR _i$[ebp]
	push	edx
	lea	eax, DWORD PTR _usergroup$[ebp]
	push	eax
	call	_dyntab_cell
	add	esp, 12					; 0000000cH
	mov	DWORD PTR _c$70252[ebp], eax

; 76   : 		char *txt = c->txt;

	mov	ecx, DWORD PTR _c$70252[ebp]
	mov	edx, DWORD PTR [ecx]
	mov	DWORD PTR _txt$70253[ebp], edx

; 77   : 		size_t sz = c->len;

	mov	eax, DWORD PTR _c$70252[ebp]
	mov	ecx, DWORD PTR [eax+4]
	mov	DWORD PTR _sz$70254[ebp], ecx

; 78   : 		for(j = 0; j < cntxt->user_groups.nbrows; j++)

	mov	DWORD PTR _j$[ebp], 0
	jmp	SHORT $L70255
$L70256:
	mov	edx, DWORD PTR _j$[ebp]
	add	edx, 1
	mov	DWORD PTR _j$[ebp], edx
$L70255:
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	ecx, DWORD PTR _j$[ebp]
	cmp	ecx, DWORD PTR [eax+29448]
	jae	SHORT $L70257

; 79   : 			if(!dyntab_txt_cmp(txt, sz, &cntxt->user_groups, j, 0))

	push	0
	mov	edx, DWORD PTR _j$[ebp]
	push	edx
	mov	eax, DWORD PTR _cntxt$[ebp]
	add	eax, 29448				; 00007308H
	push	eax
	mov	ecx, DWORD PTR _sz$70254[ebp]
	push	ecx
	mov	edx, DWORD PTR _txt$70253[ebp]
	push	edx
	call	_dyntab_txt_cmp
	add	esp, 20					; 00000014H
	test	eax, eax
	jne	SHORT $L70258

; 81   : 				*acc |= (c->field && strcmp(c->field, "_EVA_GRANT_EDIT")) ? AccessView : AccessEdit;

	mov	eax, DWORD PTR _c$70252[ebp]
	cmp	DWORD PTR [eax+8], 0
	je	SHORT $L71129
	push	OFFSET FLAT:$SG70259
	mov	ecx, DWORD PTR _c$70252[ebp]
	mov	edx, DWORD PTR [ecx+8]
	push	edx
	call	_strcmp
	add	esp, 8
	test	eax, eax
	je	SHORT $L71129
	mov	DWORD PTR -52+[ebp], 1
	jmp	SHORT $L71130
$L71129:
	mov	DWORD PTR -52+[ebp], 2
$L71130:
	mov	eax, DWORD PTR _acc$[ebp]
	mov	ecx, DWORD PTR [eax]
	or	ecx, DWORD PTR -52+[ebp]
	mov	edx, DWORD PTR _acc$[ebp]
	mov	DWORD PTR [edx], ecx
$L70258:

; 83   : 	}

	jmp	SHORT $L70256
$L70257:
	jmp	$L70250
$eva_noerr$70242:

; 84   : 
; 85   : 	RETURN_OK_CLEANUP;

	push	0
	push	OFFSET FLAT:$SG70260
	push	OFFSET FLAT:$SG70261
	mov	eax, DWORD PTR _cntxt$[ebp]
	push	eax
	call	_err_clear
	add	esp, 16					; 00000010H
$eva_err$70236:
	mov	ecx, DWORD PTR _cntxt$[ebp]
	cmp	DWORD PTR [ecx+29872], 0
	je	SHORT $L70262
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	eax, DWORD PTR [edx+29900]
	push	eax
	push	OFFSET FLAT:$SG70263
	push	OFFSET FLAT:$SG70264
	mov	ecx, DWORD PTR _cntxt$[ebp]
	push	ecx
	call	_err_add_context
	add	esp, 16					; 00000010H
$L70262:
	lea	edx, DWORD PTR _usergroup$[ebp]
	push	edx
	call	_dyntab_free
	add	esp, 4
	mov	eax, DWORD PTR _cntxt$[ebp]
	xor	ecx, ecx
	cmp	DWORD PTR [eax+29872], 0
	setne	cl
	mov	eax, ecx

; 86   : }

	mov	esp, ebp
	pop	ebp
	ret	0
_obj_check_user_access ENDP
_TEXT	ENDS
PUBLIC	_ctrl_check_user_access
EXTRN	_strtoul:NEAR
EXTRN	_dyntab_sz:NEAR
EXTRN	_dyntab_val:NEAR
EXTRN	_dyntab_field_val:NEAR
EXTRN	_dyntab_order_lines:NEAR
_BSS	SEGMENT
$SG70360 DB	01H DUP (?)
	ALIGN	4

$SG70361 DB	01H DUP (?)
	ALIGN	4

$SG70366 DB	01H DUP (?)
	ALIGN	4

$SG70367 DB	01H DUP (?)
_BSS	ENDS
_DATA	SEGMENT
	ORG $+2
$SG70291 DB	'_EVA_FORM', 00H
	ORG $+2
$SG70292 DB	'_EVA_CONTROL', 00H
	ORG $+3
$SG70302 DB	'_EVA_USERGROUP', 00H
	ORG $+1
$SG70304 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70308 DB	'_EVA_ACCES_NOT_IDENT', 00H
	ORG $+3
$SG70310 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70313 DB	'_EVA_CREATE_NOT_IDENT', 00H
	ORG $+2
$SG70315 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70318 DB	'_EVA_DELETE_NOT_IDENT', 00H
	ORG $+2
$SG70320 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70329 DB	'_EVA_ACCES_IDENT', 00H
	ORG $+3
$SG70331 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70335 DB	'_EVA_CREATE_IDENT', 00H
	ORG $+2
$SG70337 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70341 DB	'_EVA_DELETE_IDENT', 00H
	ORG $+2
$SG70343 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70362 DB	'_EVA_ACCES_NEWOBJ', 00H
	ORG $+2
$SG70368 DB	'_EVA_ACCES_EXISTOBJ', 00H
$SG70369 DB	'D:\Travail\ABI\EVA\V4.0\CGI\Brunix-2016\ctrl_access.c', 00H
	ORG $+2
$SG70370 DB	'ctrl_check_user_access', 00H
	ORG $+1
$SG70372 DB	'D:\Travail\ABI\EVA\V4.0\CGI\Brunix-2016\ctrl_access.c', 00H
	ORG $+2
$SG70373 DB	'ctrl_check_user_access', 00H
_DATA	ENDS
_TEXT	SEGMENT
_cntxt$ = 8
_attr$ = 12
_obj_data$ = 16
_beg$ = 20
_acc$ = 24
_access$ = -20
_ctrlgroup$ = -52
_objcreat$ = -84
_objdel$ = -108
_line$ = -24
_lines$ = -60
_matchline$ = -88
_i$ = -56
_j$ = -64
_objbeg$ = -32
_b_form$ = -28
_acc1$70359 = -112
_acc1$70365 = -116
_ctrl_check_user_access PROC NEAR

; 105  : ){

	push	ebp
	mov	ebp, esp
	sub	esp, 120				; 00000078H

; 106  : 	DynTable access = { 0 };

	mov	DWORD PTR _access$[ebp], 0
	xor	eax, eax
	mov	DWORD PTR _access$[ebp+4], eax
	mov	DWORD PTR _access$[ebp+8], eax
	mov	DWORD PTR _access$[ebp+12], eax
	mov	DWORD PTR _access$[ebp+16], eax

; 107  : 	DynTable ctrlgroup = { 0 };

	mov	DWORD PTR _ctrlgroup$[ebp], 0
	xor	ecx, ecx
	mov	DWORD PTR _ctrlgroup$[ebp+4], ecx
	mov	DWORD PTR _ctrlgroup$[ebp+8], ecx
	mov	DWORD PTR _ctrlgroup$[ebp+12], ecx
	mov	DWORD PTR _ctrlgroup$[ebp+16], ecx

; 108  : 	DynTable objcreat = { 0 };

	mov	DWORD PTR _objcreat$[ebp], 0
	xor	edx, edx
	mov	DWORD PTR _objcreat$[ebp+4], edx
	mov	DWORD PTR _objcreat$[ebp+8], edx
	mov	DWORD PTR _objcreat$[ebp+12], edx
	mov	DWORD PTR _objcreat$[ebp+16], edx

; 109  : 	DynTable objdel = { 0 };

	mov	DWORD PTR _objdel$[ebp], 0
	xor	eax, eax
	mov	DWORD PTR _objdel$[ebp+4], eax
	mov	DWORD PTR _objdel$[ebp+8], eax
	mov	DWORD PTR _objdel$[ebp+12], eax
	mov	DWORD PTR _objdel$[ebp+16], eax

; 110  : 	unsigned long line, lines, matchline;
; 111  : 	unsigned long i, j;
; 112  : 	DynTableCell *objbeg = dyntab_cell(obj_data, beg, 0);

	push	0
	mov	ecx, DWORD PTR _beg$[ebp]
	push	ecx
	mov	edx, DWORD PTR _obj_data$[ebp]
	push	edx
	call	_dyntab_cell
	add	esp, 12					; 0000000cH
	mov	DWORD PTR _objbeg$[ebp], eax

; 113  : 	int b_form = !strcmp(DYNTAB_FIELD_VAL(attr, CONTROL), "_EVA_FORM");

	push	OFFSET FLAT:$SG70291
	push	0
	push	-1
	push	OFFSET FLAT:$SG70292
	mov	eax, DWORD PTR _attr$[ebp]
	push	eax
	call	_dyntab_field_val
	add	esp, 16					; 00000010H
	push	eax
	call	_strcmp
	add	esp, 8
	neg	eax
	sbb	eax, eax
	inc	eax
	mov	DWORD PTR _b_form$[ebp], eax

; 114  : 	if(!acc) return 0;

	cmp	DWORD PTR _acc$[ebp], 0
	jne	SHORT $L70293
	xor	eax, eax
	jmp	$L70279
$L70293:

; 115  : 
; 116  : 	/* Check object access if control is a form */
; 117  : 	if(b_form)

	cmp	DWORD PTR _b_form$[ebp], 0
	je	SHORT $L70297

; 119  : 		if(obj_check_user_access(cntxt, obj_data, beg, acc)) STACK_ERROR;

	mov	ecx, DWORD PTR _acc$[ebp]
	push	ecx
	mov	edx, DWORD PTR _beg$[ebp]
	push	edx
	mov	eax, DWORD PTR _obj_data$[ebp]
	push	eax
	mov	ecx, DWORD PTR _cntxt$[ebp]
	push	ecx
	call	_obj_check_user_access
	add	esp, 16					; 00000010H
	test	eax, eax
	je	SHORT $L70295
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 119		; 00000077H
	jmp	$eva_err$70296
$L70295:

; 120  : 		if(!(*acc & AccessEdit)) RETURN_OK;

	mov	eax, DWORD PTR _acc$[ebp]
	mov	ecx, DWORD PTR [eax]
	and	ecx, 2
	test	ecx, ecx
	jne	SHORT $L70297
	jmp	$eva_noerr$70298
$L70297:

; 122  : 
; 123  : 	DYNTAB_FIELD_TAB(&ctrlgroup, attr, USERGROUP);

	lea	edx, DWORD PTR _ctrlgroup$[ebp]
	push	edx
	call	_dyntab_free
	add	esp, 4
	push	0
	push	-1
	push	OFFSET FLAT:$SG70302
	mov	eax, DWORD PTR _attr$[ebp]
	push	eax
	push	0
	lea	ecx, DWORD PTR _ctrlgroup$[ebp]
	push	ecx
	call	_dyntab_filter_field
	add	esp, 24					; 00000018H
	test	eax, eax
	jne	SHORT $L70301
	lea	edx, DWORD PTR _ctrlgroup$[ebp]
	push	edx
	call	_dyntab_order_lines
	add	esp, 4
	test	eax, eax
	je	SHORT $L70300
$L70301:
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29872], OFFSET FLAT:$SG70304
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 123		; 0000007bH
	jmp	$eva_err$70296
$L70300:

; 124  : 	if(!cntxt->b_identified)

	mov	edx, DWORD PTR _cntxt$[ebp]
	cmp	DWORD PTR [edx+29400], 0
	jne	$L70305

; 126  : 		/* Select access for non identified users */
; 127  : 		DYNTAB_FIELD(&access, attr, ACCES_NOT_IDENT);

	lea	eax, DWORD PTR _access$[ebp]
	push	eax
	call	_dyntab_free
	add	esp, 4
	push	0
	push	-1
	push	OFFSET FLAT:$SG70308
	mov	ecx, DWORD PTR _attr$[ebp]
	push	ecx
	push	0
	lea	edx, DWORD PTR _access$[ebp]
	push	edx
	call	_dyntab_filter_field
	add	esp, 24					; 00000018H
	test	eax, eax
	je	SHORT $L70307
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29872], OFFSET FLAT:$SG70310
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 127		; 0000007fH
	jmp	$eva_err$70296
$L70307:

; 128  : 		DYNTAB_FIELD(&objcreat, attr, CREATE_NOT_IDENT);

	lea	edx, DWORD PTR _objcreat$[ebp]
	push	edx
	call	_dyntab_free
	add	esp, 4
	push	0
	push	-1
	push	OFFSET FLAT:$SG70313
	mov	eax, DWORD PTR _attr$[ebp]
	push	eax
	push	0
	lea	ecx, DWORD PTR _objcreat$[ebp]
	push	ecx
	call	_dyntab_filter_field
	add	esp, 24					; 00000018H
	test	eax, eax
	je	SHORT $L70312
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29872], OFFSET FLAT:$SG70315
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 128		; 00000080H
	jmp	$eva_err$70296
$L70312:

; 129  : 		DYNTAB_FIELD(&objdel, attr, DELETE_NOT_IDENT);

	lea	ecx, DWORD PTR _objdel$[ebp]
	push	ecx
	call	_dyntab_free
	add	esp, 4
	push	0
	push	-1
	push	OFFSET FLAT:$SG70318
	mov	edx, DWORD PTR _attr$[ebp]
	push	edx
	push	0
	lea	eax, DWORD PTR _objdel$[ebp]
	push	eax
	call	_dyntab_filter_field
	add	esp, 24					; 00000018H
	test	eax, eax
	je	SHORT $L70317
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29872], OFFSET FLAT:$SG70320
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 129		; 00000081H
	jmp	$eva_err$70296
$L70317:

; 130  : 		if(!access.nbrows && ctrlgroup.nbrows)

	cmp	DWORD PTR _access$[ebp], 0
	jne	SHORT $L70321
	cmp	DWORD PTR _ctrlgroup$[ebp], 0
	je	SHORT $L70321

; 131  : 			/* No access if unspecified & control has usergroups */
; 132  : 			*acc = AccessNone;

	mov	eax, DWORD PTR _acc$[ebp]
	mov	DWORD PTR [eax], 0

; 133  : 		else

	jmp	SHORT $L70322
$L70321:

; 134  : 			ctrl_parse_access(acc, dyntab_val(&access, 0, 0),
; 135  : 											dyntab_val(&objcreat, 0, 0),
; 136  : 											dyntab_val(&objdel, 0, 0));

	push	0
	push	0
	lea	ecx, DWORD PTR _objdel$[ebp]
	push	ecx
	call	_dyntab_val
	add	esp, 12					; 0000000cH
	push	eax
	push	0
	push	0
	lea	edx, DWORD PTR _objcreat$[ebp]
	push	edx
	call	_dyntab_val
	add	esp, 12					; 0000000cH
	push	eax
	push	0
	push	0
	lea	eax, DWORD PTR _access$[ebp]
	push	eax
	call	_dyntab_val
	add	esp, 12					; 0000000cH
	push	eax
	mov	ecx, DWORD PTR _acc$[ebp]
	push	ecx
	call	_ctrl_parse_access
	add	esp, 16					; 00000010H
$L70322:

; 138  : 	else

	jmp	$L70357
$L70305:

; 140  : 		/* Always allow acces to identified user account form */
; 141  : 		if(objbeg && objbeg->IdObj == DYNTAB_TOUL(&cntxt->id_user) && b_form)

	cmp	DWORD PTR _objbeg$[ebp], 0
	je	SHORT $L70325
	push	10					; 0000000aH
	push	0
	push	0
	push	0
	mov	edx, DWORD PTR _cntxt$[ebp]
	add	edx, 29408				; 000072e0H
	push	edx
	call	_dyntab_val
	add	esp, 12					; 0000000cH
	push	eax
	call	_strtoul
	add	esp, 12					; 0000000cH
	mov	ecx, DWORD PTR _objbeg$[ebp]
	cmp	DWORD PTR [ecx+20], eax
	jne	SHORT $L70325
	cmp	DWORD PTR _b_form$[ebp], 0
	je	SHORT $L70325

; 143  : 			*acc = AccessView | AccessEdit;

	mov	edx, DWORD PTR _acc$[ebp]
	mov	DWORD PTR [edx], 3

; 144  : 			RETURN_OK;

	jmp	$eva_noerr$70298
$L70325:

; 146  : 
; 147  : 		/*  Select acces on user groups */
; 148  : 		DYNTAB_FIELD_TAB(&access, attr, ACCES_IDENT);

	lea	eax, DWORD PTR _access$[ebp]
	push	eax
	call	_dyntab_free
	add	esp, 4
	push	0
	push	-1
	push	OFFSET FLAT:$SG70329
	mov	ecx, DWORD PTR _attr$[ebp]
	push	ecx
	push	0
	lea	edx, DWORD PTR _access$[ebp]
	push	edx
	call	_dyntab_filter_field
	add	esp, 24					; 00000018H
	test	eax, eax
	jne	SHORT $L70328
	lea	eax, DWORD PTR _access$[ebp]
	push	eax
	call	_dyntab_order_lines
	add	esp, 4
	test	eax, eax
	je	SHORT $L70327
$L70328:
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29872], OFFSET FLAT:$SG70331
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 148		; 00000094H
	jmp	$eva_err$70296
$L70327:

; 149  : 		DYNTAB_FIELD_TAB(&objcreat, attr, CREATE_IDENT);

	lea	eax, DWORD PTR _objcreat$[ebp]
	push	eax
	call	_dyntab_free
	add	esp, 4
	push	0
	push	-1
	push	OFFSET FLAT:$SG70335
	mov	ecx, DWORD PTR _attr$[ebp]
	push	ecx
	push	0
	lea	edx, DWORD PTR _objcreat$[ebp]
	push	edx
	call	_dyntab_filter_field
	add	esp, 24					; 00000018H
	test	eax, eax
	jne	SHORT $L70334
	lea	eax, DWORD PTR _objcreat$[ebp]
	push	eax
	call	_dyntab_order_lines
	add	esp, 4
	test	eax, eax
	je	SHORT $L70333
$L70334:
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29872], OFFSET FLAT:$SG70337
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 149		; 00000095H
	jmp	$eva_err$70296
$L70333:

; 150  : 		DYNTAB_FIELD_TAB(&objdel, attr, DELETE_IDENT);

	lea	eax, DWORD PTR _objdel$[ebp]
	push	eax
	call	_dyntab_free
	add	esp, 4
	push	0
	push	-1
	push	OFFSET FLAT:$SG70341
	mov	ecx, DWORD PTR _attr$[ebp]
	push	ecx
	push	0
	lea	edx, DWORD PTR _objdel$[ebp]
	push	edx
	call	_dyntab_filter_field
	add	esp, 24					; 00000018H
	test	eax, eax
	jne	SHORT $L70340
	lea	eax, DWORD PTR _objdel$[ebp]
	push	eax
	call	_dyntab_order_lines
	add	esp, 4
	test	eax, eax
	je	SHORT $L70339
$L70340:
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29872], OFFSET FLAT:$SG70343
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 150		; 00000096H
	jmp	$eva_err$70296
$L70339:

; 151  : 
; 152  : 		/* For each line of control acces / users groups table */
; 153  : 		lines = (access.nbrows > ctrlgroup.nbrows) ? access.nbrows : ctrlgroup.nbrows;

	mov	eax, DWORD PTR _access$[ebp]
	cmp	eax, DWORD PTR _ctrlgroup$[ebp]
	jbe	SHORT $L71132
	mov	ecx, DWORD PTR _access$[ebp]
	mov	DWORD PTR -120+[ebp], ecx
	jmp	SHORT $L71133
$L71132:
	mov	edx, DWORD PTR _ctrlgroup$[ebp]
	mov	DWORD PTR -120+[ebp], edx
$L71133:
	mov	eax, DWORD PTR -120+[ebp]
	mov	DWORD PTR _lines$[ebp], eax

; 154  : 		matchline = lines;

	mov	ecx, DWORD PTR _lines$[ebp]
	mov	DWORD PTR _matchline$[ebp], ecx

; 155  : 		for(line = 0; line < lines && matchline == lines; line++)

	mov	DWORD PTR _line$[ebp], 0
	jmp	SHORT $L70344
$L70345:
	mov	edx, DWORD PTR _line$[ebp]
	add	edx, 1
	mov	DWORD PTR _line$[ebp], edx
$L70344:
	mov	eax, DWORD PTR _line$[ebp]
	cmp	eax, DWORD PTR _lines$[ebp]
	jae	$L70346
	mov	ecx, DWORD PTR _matchline$[ebp]
	cmp	ecx, DWORD PTR _lines$[ebp]
	jne	$L70346

; 157  : 			/* Match line if no user group selected */
; 158  : 			if(!dyntab_sz(&ctrlgroup, line, 0))

	push	0
	mov	edx, DWORD PTR _line$[ebp]
	push	edx
	lea	eax, DWORD PTR _ctrlgroup$[ebp]
	push	eax
	call	_dyntab_sz
	add	esp, 12					; 0000000cH
	test	eax, eax
	jne	SHORT $L70347

; 160  : 				matchline = line;

	mov	ecx, DWORD PTR _line$[ebp]
	mov	DWORD PTR _matchline$[ebp], ecx

; 161  : 				break;

	jmp	$L70346
$L70347:

; 163  : 
; 164  : 			/* Search for user groups in control */
; 165  : 			for(i = 0; i < ctrlgroup.nbcols && matchline == lines; i++)

	mov	DWORD PTR _i$[ebp], 0
	jmp	SHORT $L70348
$L70349:
	mov	edx, DWORD PTR _i$[ebp]
	add	edx, 1
	mov	DWORD PTR _i$[ebp], edx
$L70348:
	mov	eax, DWORD PTR _i$[ebp]
	cmp	eax, DWORD PTR _ctrlgroup$[ebp+8]
	jae	SHORT $L70350
	mov	ecx, DWORD PTR _matchline$[ebp]
	cmp	ecx, DWORD PTR _lines$[ebp]
	jne	SHORT $L70350

; 166  : 				for(j = 0; j < cntxt->user_groups.nbrows && matchline == lines; j++)

	mov	DWORD PTR _j$[ebp], 0
	jmp	SHORT $L70351
$L70352:
	mov	edx, DWORD PTR _j$[ebp]
	add	edx, 1
	mov	DWORD PTR _j$[ebp], edx
$L70351:
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	ecx, DWORD PTR _j$[ebp]
	cmp	ecx, DWORD PTR [eax+29448]
	jae	SHORT $L70353
	mov	edx, DWORD PTR _matchline$[ebp]
	cmp	edx, DWORD PTR _lines$[ebp]
	jne	SHORT $L70353

; 167  : 					if(!dyntab_cmp(&ctrlgroup, line, i, &cntxt->user_groups, j, 0))

	push	0
	mov	eax, DWORD PTR _j$[ebp]
	push	eax
	mov	ecx, DWORD PTR _cntxt$[ebp]
	add	ecx, 29448				; 00007308H
	push	ecx
	mov	edx, DWORD PTR _i$[ebp]
	push	edx
	mov	eax, DWORD PTR _line$[ebp]
	push	eax
	lea	ecx, DWORD PTR _ctrlgroup$[ebp]
	push	ecx
	call	_dyntab_cmp
	add	esp, 24					; 00000018H
	test	eax, eax
	jne	SHORT $L70354

; 168  : 						matchline = line;

	mov	edx, DWORD PTR _line$[ebp]
	mov	DWORD PTR _matchline$[ebp], edx
$L70354:

; 169  : 		}

	jmp	SHORT $L70352
$L70353:
	jmp	SHORT $L70349
$L70350:
	jmp	$L70345
$L70346:

; 170  : 
; 171  : 		/* Select access of 1st line matching user group */
; 172  : 		if(!lines || matchline < lines)

	cmp	DWORD PTR _lines$[ebp], 0
	je	SHORT $L70356
	mov	eax, DWORD PTR _matchline$[ebp]
	cmp	eax, DWORD PTR _lines$[ebp]
	jae	SHORT $L70355
$L70356:

; 174  : 			ctrl_parse_access(acc, dyntab_val(&access, matchline, 0),
; 175  : 									dyntab_val(&objcreat, matchline, 0),
; 176  : 									dyntab_val(&objdel, matchline, 0));

	push	0
	mov	ecx, DWORD PTR _matchline$[ebp]
	push	ecx
	lea	edx, DWORD PTR _objdel$[ebp]
	push	edx
	call	_dyntab_val
	add	esp, 12					; 0000000cH
	push	eax
	push	0
	mov	eax, DWORD PTR _matchline$[ebp]
	push	eax
	lea	ecx, DWORD PTR _objcreat$[ebp]
	push	ecx
	call	_dyntab_val
	add	esp, 12					; 0000000cH
	push	eax
	push	0
	mov	edx, DWORD PTR _matchline$[ebp]
	push	edx
	lea	eax, DWORD PTR _access$[ebp]
	push	eax
	call	_dyntab_val
	add	esp, 12					; 0000000cH
	push	eax
	mov	ecx, DWORD PTR _acc$[ebp]
	push	ecx
	call	_ctrl_parse_access
	add	esp, 16					; 00000010H

; 178  : 		else

	jmp	SHORT $L70357
$L70355:

; 179  : 			*acc = AccessNone;

	mov	edx, DWORD PTR _acc$[ebp]
	mov	DWORD PTR [edx], 0
$L70357:

; 181  : 
; 182  : 	/* Select access on new object */
; 183  : 	if(*acc != AccessNone && !dyntab_sz(obj_data, beg, 0))

	mov	eax, DWORD PTR _acc$[ebp]
	cmp	DWORD PTR [eax], 0
	je	SHORT $L70358
	push	0
	mov	ecx, DWORD PTR _beg$[ebp]
	push	ecx
	mov	edx, DWORD PTR _obj_data$[ebp]
	push	edx
	call	_dyntab_sz
	add	esp, 12					; 0000000cH
	test	eax, eax
	jne	SHORT $L70358

; 185  : 		int acc1;
; 186  : 		ctrl_parse_access(&acc1, DYNTAB_FIELD_VAL(attr, ACCES_NEWOBJ), "", "");

	push	OFFSET FLAT:$SG70360
	push	OFFSET FLAT:$SG70361
	push	0
	push	-1
	push	OFFSET FLAT:$SG70362
	mov	eax, DWORD PTR _attr$[ebp]
	push	eax
	call	_dyntab_field_val
	add	esp, 16					; 00000010H
	push	eax
	lea	ecx, DWORD PTR _acc1$70359[ebp]
	push	ecx
	call	_ctrl_parse_access
	add	esp, 16					; 00000010H

; 187  : 		*acc &= acc1;

	mov	edx, DWORD PTR _acc$[ebp]
	mov	eax, DWORD PTR [edx]
	and	eax, DWORD PTR _acc1$70359[ebp]
	mov	ecx, DWORD PTR _acc$[ebp]
	mov	DWORD PTR [ecx], eax

; 189  : 
; 190  : 	/* Select access on existing object */
; 191  : 	else if(acc != AccessNone)

	jmp	SHORT $eva_noerr$70298
$L70358:
	cmp	DWORD PTR _acc$[ebp], 0
	je	SHORT $eva_noerr$70298

; 193  : 		int acc1;
; 194  : 		ctrl_parse_access(&acc1, DYNTAB_FIELD_VAL(attr, ACCES_EXISTOBJ), "", "");

	push	OFFSET FLAT:$SG70366
	push	OFFSET FLAT:$SG70367
	push	0
	push	-1
	push	OFFSET FLAT:$SG70368
	mov	edx, DWORD PTR _attr$[ebp]
	push	edx
	call	_dyntab_field_val
	add	esp, 16					; 00000010H
	push	eax
	lea	eax, DWORD PTR _acc1$70365[ebp]
	push	eax
	call	_ctrl_parse_access
	add	esp, 16					; 00000010H

; 195  : 		*acc &= acc1;

	mov	ecx, DWORD PTR _acc$[ebp]
	mov	edx, DWORD PTR [ecx]
	and	edx, DWORD PTR _acc1$70365[ebp]
	mov	eax, DWORD PTR _acc$[ebp]
	mov	DWORD PTR [eax], edx
$eva_noerr$70298:

; 197  : 
; 198  : 	RETURN_OK_CLEANUP;

	push	0
	push	OFFSET FLAT:$SG70369
	push	OFFSET FLAT:$SG70370
	mov	ecx, DWORD PTR _cntxt$[ebp]
	push	ecx
	call	_err_clear
	add	esp, 16					; 00000010H
$eva_err$70296:
	mov	edx, DWORD PTR _cntxt$[ebp]
	cmp	DWORD PTR [edx+29872], 0
	je	SHORT $L70371
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	ecx, DWORD PTR [eax+29900]
	push	ecx
	push	OFFSET FLAT:$SG70372
	push	OFFSET FLAT:$SG70373
	mov	edx, DWORD PTR _cntxt$[ebp]
	push	edx
	call	_err_add_context
	add	esp, 16					; 00000010H
$L70371:
	lea	eax, DWORD PTR _access$[ebp]
	push	eax
	call	_dyntab_free
	add	esp, 4
	lea	ecx, DWORD PTR _ctrlgroup$[ebp]
	push	ecx
	call	_dyntab_free
	add	esp, 4
	lea	edx, DWORD PTR _objcreat$[ebp]
	push	edx
	call	_dyntab_free
	add	esp, 4
	lea	eax, DWORD PTR _objdel$[ebp]
	push	eax
	call	_dyntab_free
	add	esp, 4
	mov	ecx, DWORD PTR _cntxt$[ebp]
	xor	eax, eax
	cmp	DWORD PTR [ecx+29872], 0
	setne	al
$L70279:

; 199  : }

	mov	esp, ebp
	pop	ebp
	ret	0
_ctrl_check_user_access ENDP
_TEXT	ENDS
PUBLIC	_ctrl_check_access_v0
EXTRN	_ctrl_eval_fieldexpr:NEAR
EXTRN	_ctrl_eval_valtyp:NEAR
EXTRN	_dyntab_copy:NEAR
_BSS	SEGMENT
	ALIGN	4

$SG70505 DB	01H DUP (?)
	ALIGN	4

$SG70506 DB	01H DUP (?)
_BSS	ENDS
_DATA	SEGMENT
	ORG $+1
$SG70404 DB	'_EVA_ACCES_EDIT', 00H
$SG70406 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70412 DB	'_EVA_VIEWONLY', 00H
	ORG $+2
$SG70413 DB	'_EVA_EDITONLY', 00H
	ORG $+2
$SG70415 DB	'_EVA_ALWAYS', 00H
$SG70418 DB	'_EVA_ACCESS_FILTER_SIMPLE_FIELD', 00H
$SG70420 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70423 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70426 DB	'_EVA_ACCESS_FILTER_SIMPLE_OP', 00H
	ORG $+3
$SG70428 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70431 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70434 DB	'_EVA_ACCESS_FILTER_SIMPLE_VALTYPE', 00H
	ORG $+2
$SG70436 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70439 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70442 DB	'_EVA_ACCESS_FILTER_SIMPLE_VALUE', 00H
$SG70444 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70447 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70450 DB	'_EVA_ACCESS_FILTER_SIMPLE', 00H
	ORG $+2
$SG70452 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70455 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70458 DB	'_EVA_DEBUG_SQL_EXPR', 00H
$SG70460 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70463 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70469 DB	'_EVA_EQUAL', 00H
	ORG $+1
$SG70474 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70478 DB	'D:\Travail\ABI\EVA\V4.0\CGI\Brunix-2016\ctrl_access.c', 00H
	ORG $+2
$SG70479 DB	'ctrl_check_access_v0', 00H
	ORG $+3
$SG70481 DB	'D:\Travail\ABI\EVA\V4.0\CGI\Brunix-2016\ctrl_access.c', 00H
	ORG $+2
$SG70482 DB	'ctrl_check_access_v0', 00H
	ORG $+3
$SG70487 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70492 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70508 DB	'D:\Travail\ABI\EVA\V4.0\CGI\Brunix-2016\ctrl_access.c', 00H
	ORG $+2
$SG70509 DB	'ctrl_check_access_v0', 00H
	ORG $+3
$SG70511 DB	'D:\Travail\ABI\EVA\V4.0\CGI\Brunix-2016\ctrl_access.c', 00H
	ORG $+2
$SG70512 DB	'ctrl_check_access_v0', 00H
_DATA	ENDS
_TEXT	SEGMENT
_cntxt$ = 8
_ctrl$ = 12
_form$ = -48
_access$ = -40
_fltfield$ = -72
_fltval$ = -20
_fltvaltyp$ = -168
_fltop$ = -116
_values$ = -148
_values1$ = -96
_debug$ = -188
_line$ = -44
_lines$ = -124
_matchline$ = -192
_i$ = -120
_j$ = -128
_acc$ = -76
_sql_trace$ = -52
_acc$70409 = -200
_b_edit$70410 = -196
_op$70467 = -208
_b_equal$70468 = -204
_field$70470 = -212
_ctrl_check_access_v0 PROC NEAR

; 221  : ){

	push	ebp
	mov	ebp, esp
	sub	esp, 228				; 000000e4H

; 222  : 	EVA_form *form = cntxt->form;

	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	ecx, DWORD PTR [eax+80]
	mov	DWORD PTR _form$[ebp], ecx

; 223  : 	DynTable access = { 0 };

	mov	DWORD PTR _access$[ebp], 0
	xor	edx, edx
	mov	DWORD PTR _access$[ebp+4], edx
	mov	DWORD PTR _access$[ebp+8], edx
	mov	DWORD PTR _access$[ebp+12], edx
	mov	DWORD PTR _access$[ebp+16], edx

; 224  : 	DynTable fltfield = { 0 };

	mov	DWORD PTR _fltfield$[ebp], 0
	xor	eax, eax
	mov	DWORD PTR _fltfield$[ebp+4], eax
	mov	DWORD PTR _fltfield$[ebp+8], eax
	mov	DWORD PTR _fltfield$[ebp+12], eax
	mov	DWORD PTR _fltfield$[ebp+16], eax

; 225  : 	DynTable fltval = { 0 };

	mov	DWORD PTR _fltval$[ebp], 0
	xor	ecx, ecx
	mov	DWORD PTR _fltval$[ebp+4], ecx
	mov	DWORD PTR _fltval$[ebp+8], ecx
	mov	DWORD PTR _fltval$[ebp+12], ecx
	mov	DWORD PTR _fltval$[ebp+16], ecx

; 226  : 	DynTable fltvaltyp = { 0 };

	mov	DWORD PTR _fltvaltyp$[ebp], 0
	xor	edx, edx
	mov	DWORD PTR _fltvaltyp$[ebp+4], edx
	mov	DWORD PTR _fltvaltyp$[ebp+8], edx
	mov	DWORD PTR _fltvaltyp$[ebp+12], edx
	mov	DWORD PTR _fltvaltyp$[ebp+16], edx

; 227  : 	DynTable fltop = { 0 };

	mov	DWORD PTR _fltop$[ebp], 0
	xor	eax, eax
	mov	DWORD PTR _fltop$[ebp+4], eax
	mov	DWORD PTR _fltop$[ebp+8], eax
	mov	DWORD PTR _fltop$[ebp+12], eax
	mov	DWORD PTR _fltop$[ebp+16], eax

; 228  : 	DynTable values = { 0 };

	mov	DWORD PTR _values$[ebp], 0
	xor	ecx, ecx
	mov	DWORD PTR _values$[ebp+4], ecx
	mov	DWORD PTR _values$[ebp+8], ecx
	mov	DWORD PTR _values$[ebp+12], ecx
	mov	DWORD PTR _values$[ebp+16], ecx

; 229  : 	DynTable values1 = { 0 };

	mov	DWORD PTR _values1$[ebp], 0
	xor	edx, edx
	mov	DWORD PTR _values1$[ebp+4], edx
	mov	DWORD PTR _values1$[ebp+8], edx
	mov	DWORD PTR _values1$[ebp+12], edx
	mov	DWORD PTR _values1$[ebp+16], edx

; 230  : 	DynTable debug = { 0 };

	mov	DWORD PTR _debug$[ebp], 0
	xor	eax, eax
	mov	DWORD PTR _debug$[ebp+4], eax
	mov	DWORD PTR _debug$[ebp+8], eax
	mov	DWORD PTR _debug$[ebp+12], eax
	mov	DWORD PTR _debug$[ebp+16], eax

; 231  : 	unsigned long line, lines, matchline;
; 232  : 	unsigned long i, j;
; 233  : 	int acc, sql_trace = cntxt->sql_trace;

	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	edx, DWORD PTR [ecx+29852]
	mov	DWORD PTR _sql_trace$[ebp], edx

; 234  : 
; 235  : 	/* Check access once during read for user rights */
; 236  : 	if(form->step == CtrlRead)

	mov	eax, DWORD PTR _form$[ebp]
	cmp	DWORD PTR [eax+176], 0
	jne	SHORT $L70399

; 238  : 		ctrl_check_user_access(cntxt, &ctrl->attr, &form->objdata, 0, &ctrl->access);

	mov	ecx, DWORD PTR _ctrl$[ebp]
	add	ecx, 184				; 000000b8H
	push	ecx
	push	0
	mov	edx, DWORD PTR _form$[ebp]
	add	edx, 52					; 00000034H
	push	edx
	mov	eax, DWORD PTR _ctrl$[ebp]
	add	eax, 44					; 0000002cH
	push	eax
	mov	ecx, DWORD PTR _cntxt$[ebp]
	push	ecx
	call	_ctrl_check_user_access
	add	esp, 20					; 00000014H

; 239  : 		ctrl->access0 = ctrl->access;

	mov	edx, DWORD PTR _ctrl$[ebp]
	mov	eax, DWORD PTR _ctrl$[ebp]
	mov	ecx, DWORD PTR [eax+184]
	mov	DWORD PTR [edx+188], ecx

; 240  : 
; 241  : 		/* No other checking during read process */
; 242  : 		RETURN_OK;

	jmp	$eva_noerr$70400
$L70399:

; 244  : 
; 245  : 	/* Return if no access */
; 246  : 	ctrl->access = ctrl->access0;

	mov	edx, DWORD PTR _ctrl$[ebp]
	mov	eax, DWORD PTR _ctrl$[ebp]
	mov	ecx, DWORD PTR [eax+188]
	mov	DWORD PTR [edx+184], ecx

; 247  : 	if(ctrl->access == AccessNone) RETURN_OK;

	mov	edx, DWORD PTR _ctrl$[ebp]
	cmp	DWORD PTR [edx+184], 0
	jne	SHORT $L70401
	jmp	$eva_noerr$70400
$L70401:

; 248  : 
; 249  : 	/* Check access for edit mode */
; 250  : 	CTRL_ATTR(access, ACCES_EDIT);

	lea	eax, DWORD PTR _access$[ebp]
	push	eax
	call	_dyntab_free
	add	esp, 4
	push	0
	push	-1
	push	OFFSET FLAT:$SG70404
	mov	ecx, DWORD PTR _ctrl$[ebp]
	add	ecx, 44					; 0000002cH
	push	ecx
	push	0
	lea	edx, DWORD PTR _access$[ebp]
	push	edx
	call	_dyntab_filter_field
	add	esp, 24					; 00000018H
	test	eax, eax
	je	SHORT $L70403
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29872], OFFSET FLAT:$SG70406
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 250		; 000000faH
	jmp	$eva_err$70407
$L70403:

; 251  : 	if(access.nbrows)

	cmp	DWORD PTR _access$[ebp], 0
	je	$L70414

; 253  : 		char *acc = dyntab_val(&access, 0, 0);

	push	0
	push	0
	lea	edx, DWORD PTR _access$[ebp]
	push	edx
	call	_dyntab_val
	add	esp, 12					; 0000000cH
	mov	DWORD PTR _acc$70409[ebp], eax

; 254  : 		int b_edit = (form->prevstep == HtmlEdit || form->prevstep == HtmlSaveDlg || form->nextstep == HtmlEdit)
; 255  : 					&& form->step != HtmlView;

	mov	eax, DWORD PTR _form$[ebp]
	cmp	DWORD PTR [eax+168], 4
	je	SHORT $L71135
	mov	ecx, DWORD PTR _form$[ebp]
	cmp	DWORD PTR [ecx+168], 3
	je	SHORT $L71135
	mov	edx, DWORD PTR _form$[ebp]
	cmp	DWORD PTR [edx+172], 4
	jne	SHORT $L71136
$L71135:
	mov	eax, DWORD PTR _form$[ebp]
	cmp	DWORD PTR [eax+176], 6
	je	SHORT $L71136
	mov	DWORD PTR -216+[ebp], 1
	jmp	SHORT $L71137
$L71136:
	mov	DWORD PTR -216+[ebp], 0
$L71137:
	mov	ecx, DWORD PTR -216+[ebp]
	mov	DWORD PTR _b_edit$70410[ebp], ecx

; 256  : 		if(b_edit ? !strcmp(acc, "_EVA_VIEWONLY") : !strcmp(acc, "_EVA_EDITONLY"))

	cmp	DWORD PTR _b_edit$70410[ebp], 0
	je	SHORT $L71138
	push	OFFSET FLAT:$SG70412
	mov	edx, DWORD PTR _acc$70409[ebp]
	push	edx
	call	_strcmp
	add	esp, 8
	neg	eax
	sbb	eax, eax
	inc	eax
	mov	DWORD PTR -220+[ebp], eax
	jmp	SHORT $L71139
$L71138:
	push	OFFSET FLAT:$SG70413
	mov	eax, DWORD PTR _acc$70409[ebp]
	push	eax
	call	_strcmp
	add	esp, 8
	neg	eax
	sbb	eax, eax
	inc	eax
	mov	DWORD PTR -220+[ebp], eax
$L71139:
	cmp	DWORD PTR -220+[ebp], 0
	je	SHORT $L70411

; 258  : 			/* No access if edit mode does not match requested mode */
; 259  : 			ctrl->access = AccessNone;

	mov	ecx, DWORD PTR _ctrl$[ebp]
	mov	DWORD PTR [ecx+184], 0

; 260  : 			RETURN_OK;

	jmp	$eva_noerr$70400
$L70411:

; 262  : 		if(!strcmp(acc, "_EVA_ALWAYS"))

	push	OFFSET FLAT:$SG70415
	mov	edx, DWORD PTR _acc$70409[ebp]
	push	edx
	call	_strcmp
	add	esp, 8
	test	eax, eax
	jne	SHORT $L70414

; 264  : 			/* Edit access if forced */
; 265  : 			ctrl->access = AccessEdit;

	mov	eax, DWORD PTR _ctrl$[ebp]
	mov	DWORD PTR [eax+184], 2

; 266  : 			RETURN_OK;

	jmp	$eva_noerr$70400
$L70414:

; 269  : 
; 270  : 	/* Select access on current object data */
; 271  : 	CTRL_ATTR_TAB(fltfield, ACCESS_FILTER_SIMPLE_FIELD);

	lea	ecx, DWORD PTR _fltfield$[ebp]
	push	ecx
	call	_dyntab_free
	add	esp, 4
	push	0
	push	-1
	push	OFFSET FLAT:$SG70418
	mov	edx, DWORD PTR _ctrl$[ebp]
	add	edx, 44					; 0000002cH
	push	edx
	push	0
	lea	eax, DWORD PTR _fltfield$[ebp]
	push	eax
	call	_dyntab_filter_field
	add	esp, 24					; 00000018H
	test	eax, eax
	je	SHORT $L70417
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29872], OFFSET FLAT:$SG70420
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 271		; 0000010fH
	jmp	$eva_err$70407
$L70417:
	lea	eax, DWORD PTR _fltfield$[ebp]
	push	eax
	call	_dyntab_order_lines
	add	esp, 4
	test	eax, eax
	je	SHORT $L70421
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29872], OFFSET FLAT:$SG70423
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 271		; 0000010fH
	jmp	$eva_err$70407
$L70421:

; 272  : 	CTRL_ATTR_TAB(fltop, ACCESS_FILTER_SIMPLE_OP);

	lea	eax, DWORD PTR _fltop$[ebp]
	push	eax
	call	_dyntab_free
	add	esp, 4
	push	0
	push	-1
	push	OFFSET FLAT:$SG70426
	mov	ecx, DWORD PTR _ctrl$[ebp]
	add	ecx, 44					; 0000002cH
	push	ecx
	push	0
	lea	edx, DWORD PTR _fltop$[ebp]
	push	edx
	call	_dyntab_filter_field
	add	esp, 24					; 00000018H
	test	eax, eax
	je	SHORT $L70425
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29872], OFFSET FLAT:$SG70428
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 272		; 00000110H
	jmp	$eva_err$70407
$L70425:
	lea	edx, DWORD PTR _fltop$[ebp]
	push	edx
	call	_dyntab_order_lines
	add	esp, 4
	test	eax, eax
	je	SHORT $L70429
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29872], OFFSET FLAT:$SG70431
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 272		; 00000110H
	jmp	$eva_err$70407
$L70429:

; 273  : 	CTRL_ATTR_TAB(fltvaltyp, ACCESS_FILTER_SIMPLE_VALTYPE);

	lea	edx, DWORD PTR _fltvaltyp$[ebp]
	push	edx
	call	_dyntab_free
	add	esp, 4
	push	0
	push	-1
	push	OFFSET FLAT:$SG70434
	mov	eax, DWORD PTR _ctrl$[ebp]
	add	eax, 44					; 0000002cH
	push	eax
	push	0
	lea	ecx, DWORD PTR _fltvaltyp$[ebp]
	push	ecx
	call	_dyntab_filter_field
	add	esp, 24					; 00000018H
	test	eax, eax
	je	SHORT $L70433
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29872], OFFSET FLAT:$SG70436
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 273		; 00000111H
	jmp	$eva_err$70407
$L70433:
	lea	ecx, DWORD PTR _fltvaltyp$[ebp]
	push	ecx
	call	_dyntab_order_lines
	add	esp, 4
	test	eax, eax
	je	SHORT $L70437
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29872], OFFSET FLAT:$SG70439
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 273		; 00000111H
	jmp	$eva_err$70407
$L70437:

; 274  : 	CTRL_ATTR_TAB(fltval, ACCESS_FILTER_SIMPLE_VALUE);

	lea	ecx, DWORD PTR _fltval$[ebp]
	push	ecx
	call	_dyntab_free
	add	esp, 4
	push	0
	push	-1
	push	OFFSET FLAT:$SG70442
	mov	edx, DWORD PTR _ctrl$[ebp]
	add	edx, 44					; 0000002cH
	push	edx
	push	0
	lea	eax, DWORD PTR _fltval$[ebp]
	push	eax
	call	_dyntab_filter_field
	add	esp, 24					; 00000018H
	test	eax, eax
	je	SHORT $L70441
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29872], OFFSET FLAT:$SG70444
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 274		; 00000112H
	jmp	$eva_err$70407
$L70441:
	lea	eax, DWORD PTR _fltval$[ebp]
	push	eax
	call	_dyntab_order_lines
	add	esp, 4
	test	eax, eax
	je	SHORT $L70445
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29872], OFFSET FLAT:$SG70447
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 274		; 00000112H
	jmp	$eva_err$70407
$L70445:

; 275  : 	CTRL_ATTR_TAB(access, ACCESS_FILTER_SIMPLE);

	lea	eax, DWORD PTR _access$[ebp]
	push	eax
	call	_dyntab_free
	add	esp, 4
	push	0
	push	-1
	push	OFFSET FLAT:$SG70450
	mov	ecx, DWORD PTR _ctrl$[ebp]
	add	ecx, 44					; 0000002cH
	push	ecx
	push	0
	lea	edx, DWORD PTR _access$[ebp]
	push	edx
	call	_dyntab_filter_field
	add	esp, 24					; 00000018H
	test	eax, eax
	je	SHORT $L70449
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29872], OFFSET FLAT:$SG70452
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 275		; 00000113H
	jmp	$eva_err$70407
$L70449:
	lea	edx, DWORD PTR _access$[ebp]
	push	edx
	call	_dyntab_order_lines
	add	esp, 4
	test	eax, eax
	je	SHORT $L70453
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29872], OFFSET FLAT:$SG70455
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 275		; 00000113H
	jmp	$eva_err$70407
$L70453:

; 276  : 	CTRL_ATTR_TAB(debug, DEBUG_SQL_EXPR);

	lea	edx, DWORD PTR _debug$[ebp]
	push	edx
	call	_dyntab_free
	add	esp, 4
	push	0
	push	-1
	push	OFFSET FLAT:$SG70458
	mov	eax, DWORD PTR _ctrl$[ebp]
	add	eax, 44					; 0000002cH
	push	eax
	push	0
	lea	ecx, DWORD PTR _debug$[ebp]
	push	ecx
	call	_dyntab_filter_field
	add	esp, 24					; 00000018H
	test	eax, eax
	je	SHORT $L70457
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29872], OFFSET FLAT:$SG70460
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 276		; 00000114H
	jmp	$eva_err$70407
$L70457:
	lea	ecx, DWORD PTR _debug$[ebp]
	push	ecx
	call	_dyntab_order_lines
	add	esp, 4
	test	eax, eax
	je	SHORT $L70461
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29872], OFFSET FLAT:$SG70463
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 276		; 00000114H
	jmp	$eva_err$70407
$L70461:

; 277  : 
; 278  : 	/* For each line of control acces / field condition table */
; 279  : 	lines = access.nbrows > fltfield.nbrows ?	access.nbrows : fltfield.nbrows;

	mov	ecx, DWORD PTR _access$[ebp]
	cmp	ecx, DWORD PTR _fltfield$[ebp]
	jbe	SHORT $L71140
	mov	edx, DWORD PTR _access$[ebp]
	mov	DWORD PTR -224+[ebp], edx
	jmp	SHORT $L71141
$L71140:
	mov	eax, DWORD PTR _fltfield$[ebp]
	mov	DWORD PTR -224+[ebp], eax
$L71141:
	mov	ecx, DWORD PTR -224+[ebp]
	mov	DWORD PTR _lines$[ebp], ecx

; 280  : 	matchline = lines;

	mov	edx, DWORD PTR _lines$[ebp]
	mov	DWORD PTR _matchline$[ebp], edx

; 281  : 	for(line = 0; line < lines && matchline == lines; line++)

	mov	DWORD PTR _line$[ebp], 0
	jmp	SHORT $L70464
$L70465:
	mov	eax, DWORD PTR _line$[ebp]
	add	eax, 1
	mov	DWORD PTR _line$[ebp], eax
$L70464:
	mov	ecx, DWORD PTR _line$[ebp]
	cmp	ecx, DWORD PTR _lines$[ebp]
	jae	$L70466
	mov	edx, DWORD PTR _matchline$[ebp]
	cmp	edx, DWORD PTR _lines$[ebp]
	jne	$L70466

; 283  : 		/* Check for field presence - match line if no field */
; 284  : 		char *op = dyntab_val(&fltop, line, 0);

	push	0
	mov	eax, DWORD PTR _line$[ebp]
	push	eax
	lea	ecx, DWORD PTR _fltop$[ebp]
	push	ecx
	call	_dyntab_val
	add	esp, 12					; 0000000cH
	mov	DWORD PTR _op$70467[ebp], eax

; 285  : 		int b_equal = !*op || !strcmp(op, "_EVA_EQUAL");

	mov	edx, DWORD PTR _op$70467[ebp]
	movsx	eax, BYTE PTR [edx]
	test	eax, eax
	je	SHORT $L71142
	push	OFFSET FLAT:$SG70469
	mov	ecx, DWORD PTR _op$70467[ebp]
	push	ecx
	call	_strcmp
	add	esp, 8
	test	eax, eax
	je	SHORT $L71142
	mov	DWORD PTR -228+[ebp], 0
	jmp	SHORT $L71143
$L71142:
	mov	DWORD PTR -228+[ebp], 1
$L71143:
	mov	edx, DWORD PTR -228+[ebp]
	mov	DWORD PTR _b_equal$70468[ebp], edx

; 286  : 		char *field = dyntab_val(&fltfield, line, 0);

	push	0
	mov	eax, DWORD PTR _line$[ebp]
	push	eax
	lea	ecx, DWORD PTR _fltfield$[ebp]
	push	ecx
	call	_dyntab_val
	add	esp, 12					; 0000000cH
	mov	DWORD PTR _field$70470[ebp], eax

; 287  : 		if(!*field)

	mov	edx, DWORD PTR _field$70470[ebp]
	movsx	eax, BYTE PTR [edx]
	test	eax, eax
	jne	SHORT $L70471

; 289  : 			matchline = line;

	mov	ecx, DWORD PTR _line$[ebp]
	mov	DWORD PTR _matchline$[ebp], ecx

; 290  : 			break;

	jmp	$L70466
$L70471:

; 292  : 
; 293  : 		/* Evaluate value expression */
; 294  : 		dyntab_free(&values);

	lea	edx, DWORD PTR _values$[ebp]
	push	edx
	call	_dyntab_free
	add	esp, 4

; 295  : 		DYNTAB_SET_CELL(&values, 0, 0, &fltval, line, 0);

	push	0
	push	0
	mov	eax, DWORD PTR _line$[ebp]
	push	eax
	lea	ecx, DWORD PTR _fltval$[ebp]
	push	ecx
	call	_dyntab_cell
	add	esp, 12					; 0000000cH
	push	eax
	push	0
	push	0
	lea	edx, DWORD PTR _values$[ebp]
	push	edx
	call	_dyntab_copy
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L70472
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29872], OFFSET FLAT:$SG70474
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 295		; 00000127H
	jmp	$eva_err$70407
$L70472:

; 296  : 		if(dyntab_sz(&debug, line, 0))

	push	0
	mov	edx, DWORD PTR _line$[ebp]
	push	edx
	lea	eax, DWORD PTR _debug$[ebp]
	push	eax
	call	_dyntab_sz
	add	esp, 12					; 0000000cH
	test	eax, eax
	je	SHORT $L70475

; 297  : 			cntxt->sql_trace = DEBUG_SQL_RES;

	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29852], 2
$L70475:

; 298  : 		if(ctrl_eval_valtyp(cntxt, ctrl, &values1, dyntab_val(&fltvaltyp, line, 0), NULL, &values)) CLEAR_ERROR;

	lea	edx, DWORD PTR _values$[ebp]
	push	edx
	push	0
	push	0
	mov	eax, DWORD PTR _line$[ebp]
	push	eax
	lea	ecx, DWORD PTR _fltvaltyp$[ebp]
	push	ecx
	call	_dyntab_val
	add	esp, 12					; 0000000cH
	push	eax
	lea	edx, DWORD PTR _values1$[ebp]
	push	edx
	mov	eax, DWORD PTR _ctrl$[ebp]
	push	eax
	mov	ecx, DWORD PTR _cntxt$[ebp]
	push	ecx
	call	_ctrl_eval_valtyp
	add	esp, 24					; 00000018H
	test	eax, eax
	je	SHORT $L70477
	push	298					; 0000012aH
	push	OFFSET FLAT:$SG70478
	push	OFFSET FLAT:$SG70479
	mov	edx, DWORD PTR _cntxt$[ebp]
	push	edx
	call	_err_clear
	add	esp, 16					; 00000010H
$L70477:

; 299  : 
; 300  : 		/* Evaluate field expression */
; 301  : 		dyntab_free(&values);

	lea	eax, DWORD PTR _values$[ebp]
	push	eax
	call	_dyntab_free
	add	esp, 4

; 302  : 		if(ctrl_eval_fieldexpr(cntxt, ctrl, &values, field)) CLEAR_ERROR;

	mov	ecx, DWORD PTR _field$70470[ebp]
	push	ecx
	lea	edx, DWORD PTR _values$[ebp]
	push	edx
	mov	eax, DWORD PTR _ctrl$[ebp]
	push	eax
	mov	ecx, DWORD PTR _cntxt$[ebp]
	push	ecx
	call	_ctrl_eval_fieldexpr
	add	esp, 16					; 00000010H
	test	eax, eax
	je	SHORT $L70480
	push	302					; 0000012eH
	push	OFFSET FLAT:$SG70481
	push	OFFSET FLAT:$SG70482
	mov	edx, DWORD PTR _cntxt$[ebp]
	push	edx
	call	_err_clear
	add	esp, 16					; 00000010H
$L70480:

; 303  : 		cntxt->sql_trace = sql_trace;

	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	ecx, DWORD PTR _sql_trace$[ebp]
	mov	DWORD PTR [eax+29852], ecx

; 304  : 
; 305  : 		/* Set empty values if applicable & check each value */
; 306  : 		if(!values.nbrows) DYNTAB_ADD_CELLP(&values, 0, 0, NULL);

	cmp	DWORD PTR _values$[ebp], 0
	jne	SHORT $L70485
	push	1
	push	0
	push	0
	push	0
	lea	edx, DWORD PTR _values$[ebp]
	push	edx
	call	_dyntab_copy
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L70485
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29872], OFFSET FLAT:$SG70487
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 306		; 00000132H
	jmp	$eva_err$70407
$L70485:

; 307  : 		if(!values1.nbrows) DYNTAB_ADD_CELLP(&values1, 0, 0, NULL);

	cmp	DWORD PTR _values1$[ebp], 0
	jne	SHORT $L70490
	push	1
	push	0
	push	0
	push	0
	lea	edx, DWORD PTR _values1$[ebp]
	push	edx
	call	_dyntab_copy
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L70490
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29872], OFFSET FLAT:$SG70492
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 307		; 00000133H
	jmp	$eva_err$70407
$L70490:

; 308  : 		for(i = 0; i < values.nbrows && matchline == lines; i++)

	mov	DWORD PTR _i$[ebp], 0
	jmp	SHORT $L70493
$L70494:
	mov	edx, DWORD PTR _i$[ebp]
	add	edx, 1
	mov	DWORD PTR _i$[ebp], edx
$L70493:
	mov	eax, DWORD PTR _i$[ebp]
	cmp	eax, DWORD PTR _values$[ebp]
	jae	SHORT $L70495
	mov	ecx, DWORD PTR _matchline$[ebp]
	cmp	ecx, DWORD PTR _lines$[ebp]
	jne	SHORT $L70495

; 309  : 			for(j = 0; j < values1.nbrows && matchline == lines; j++)

	mov	DWORD PTR _j$[ebp], 0
	jmp	SHORT $L70496
$L70497:
	mov	edx, DWORD PTR _j$[ebp]
	add	edx, 1
	mov	DWORD PTR _j$[ebp], edx
$L70496:
	mov	eax, DWORD PTR _j$[ebp]
	cmp	eax, DWORD PTR _values1$[ebp]
	jae	SHORT $L70498
	mov	ecx, DWORD PTR _matchline$[ebp]
	cmp	ecx, DWORD PTR _lines$[ebp]
	jne	SHORT $L70498

; 310  : 				if(!dyntab_cmp(&values, i, 0, &values1, j, 0))

	push	0
	mov	edx, DWORD PTR _j$[ebp]
	push	edx
	lea	eax, DWORD PTR _values1$[ebp]
	push	eax
	push	0
	mov	ecx, DWORD PTR _i$[ebp]
	push	ecx
	lea	edx, DWORD PTR _values$[ebp]
	push	edx
	call	_dyntab_cmp
	add	esp, 24					; 00000018H
	test	eax, eax
	jne	SHORT $L70499

; 311  : 					matchline = line;

	mov	eax, DWORD PTR _line$[ebp]
	mov	DWORD PTR _matchline$[ebp], eax
$L70499:

; 312  : 
; 313  : 		/* Handle different operator */
; 314  : 		if(!b_equal)

	jmp	SHORT $L70497
$L70498:
	jmp	SHORT $L70494
$L70495:
	cmp	DWORD PTR _b_equal$70468[ebp], 0
	jne	SHORT $L70502

; 316  : 			if(matchline < lines) matchline = lines;

	mov	ecx, DWORD PTR _matchline$[ebp]
	cmp	ecx, DWORD PTR _lines$[ebp]
	jae	SHORT $L70501
	mov	edx, DWORD PTR _lines$[ebp]
	mov	DWORD PTR _matchline$[ebp], edx

; 317  : 			else matchline = line;

	jmp	SHORT $L70502
$L70501:
	mov	eax, DWORD PTR _line$[ebp]
	mov	DWORD PTR _matchline$[ebp], eax
$L70502:

; 319  : 	}

	jmp	$L70465
$L70466:

; 320  : 
; 321  : 	/* Select access of 1st line matching user group */
; 322  : 	if(!lines || matchline < lines)

	cmp	DWORD PTR _lines$[ebp], 0
	je	SHORT $L70504
	mov	ecx, DWORD PTR _matchline$[ebp]
	cmp	ecx, DWORD PTR _lines$[ebp]
	jae	SHORT $L70503
$L70504:

; 324  : 		ctrl_parse_access(&acc, dyntab_val(&access, matchline, 0), "", "");

	push	OFFSET FLAT:$SG70505
	push	OFFSET FLAT:$SG70506
	push	0
	mov	edx, DWORD PTR _matchline$[ebp]
	push	edx
	lea	eax, DWORD PTR _access$[ebp]
	push	eax
	call	_dyntab_val
	add	esp, 12					; 0000000cH
	push	eax
	lea	ecx, DWORD PTR _acc$[ebp]
	push	ecx
	call	_ctrl_parse_access
	add	esp, 16					; 00000010H

; 325  : 		ctrl->access &= acc;

	mov	edx, DWORD PTR _ctrl$[ebp]
	mov	eax, DWORD PTR [edx+184]
	and	eax, DWORD PTR _acc$[ebp]
	mov	ecx, DWORD PTR _ctrl$[ebp]
	mov	DWORD PTR [ecx+184], eax

; 327  : 	else

	jmp	SHORT $eva_noerr$70400
$L70503:

; 328  : 		ctrl->access = AccessNone;

	mov	edx, DWORD PTR _ctrl$[ebp]
	mov	DWORD PTR [edx+184], 0
$eva_noerr$70400:

; 329  : 
; 330  : 	RETURN_OK_CLEANUP;

	push	0
	push	OFFSET FLAT:$SG70508
	push	OFFSET FLAT:$SG70509
	mov	eax, DWORD PTR _cntxt$[ebp]
	push	eax
	call	_err_clear
	add	esp, 16					; 00000010H
$eva_err$70407:
	mov	ecx, DWORD PTR _cntxt$[ebp]
	cmp	DWORD PTR [ecx+29872], 0
	je	SHORT $L70510
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	eax, DWORD PTR [edx+29900]
	push	eax
	push	OFFSET FLAT:$SG70511
	push	OFFSET FLAT:$SG70512
	mov	ecx, DWORD PTR _cntxt$[ebp]
	push	ecx
	call	_err_add_context
	add	esp, 16					; 00000010H
$L70510:
	lea	edx, DWORD PTR _access$[ebp]
	push	edx
	call	_dyntab_free
	add	esp, 4
	lea	eax, DWORD PTR _fltfield$[ebp]
	push	eax
	call	_dyntab_free
	add	esp, 4
	lea	ecx, DWORD PTR _fltval$[ebp]
	push	ecx
	call	_dyntab_free
	add	esp, 4
	lea	edx, DWORD PTR _fltvaltyp$[ebp]
	push	edx
	call	_dyntab_free
	add	esp, 4
	lea	eax, DWORD PTR _fltop$[ebp]
	push	eax
	call	_dyntab_free
	add	esp, 4
	lea	ecx, DWORD PTR _values$[ebp]
	push	ecx
	call	_dyntab_free
	add	esp, 4
	lea	edx, DWORD PTR _values1$[ebp]
	push	edx
	call	_dyntab_free
	add	esp, 4
	lea	eax, DWORD PTR _debug$[ebp]
	push	eax
	call	_dyntab_free
	add	esp, 4
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	edx, DWORD PTR _sql_trace$[ebp]
	mov	DWORD PTR [ecx+29852], edx
	mov	eax, DWORD PTR _cntxt$[ebp]
	xor	ecx, ecx
	cmp	DWORD PTR [eax+29872], 0
	setne	cl
	mov	eax, ecx

; 331  : }

	mov	esp, ebp
	pop	ebp
	ret	0
_ctrl_check_access_v0 ENDP
_TEXT	ENDS
PUBLIC	_debug_compare_res
EXTRN	__snprintf:NEAR
EXTRN	_dynbuf_add:NEAR
EXTRN	_dyntab_to_dynbuf:NEAR
_BSS	SEGMENT
	ALIGN	4

$SG70532 DB	01H DUP (?)
_BSS	ENDS
_DATA	SEGMENT
	ORG $+3
$SG70536 DB	0aH, '*** compare_values : (''', 00H
	ORG $+3
$SG70538 DB	''',''', 00H
$SG70539 DB	',', 00H
	ORG $+2
$SG70541 DB	''') ', 00H
$SG70548 DB	'<', 00H
	ORG $+2
$SG70550 DB	'<=', 00H
	ORG $+1
$SG70552 DB	'>', 00H
	ORG $+2
$SG70554 DB	'=>', 00H
	ORG $+1
$SG70556 DB	'!=', 00H
	ORG $+1
$SG70558 DB	'==', 00H
	ORG $+1
$SG70561 DB	' (''', 00H
$SG70563 DB	''',''', 00H
$SG70564 DB	',', 00H
	ORG $+2
$SG70566 DB	''')', 00H
	ORG $+1
$SG70568 DB	'NoMatch', 00H
$SG70569 DB	'NoMatch', 00H
$SG70570 DB	'TRUE', 00H
	ORG $+3
$SG70571 DB	'FALSE', 00H
	ORG $+2
$SG70572 DB	'IS %s on ''%s'' %s ''%s''', 00H
_DATA	ENDS
_TEXT	SEGMENT
_cntxt$ = 8
_val1$ = 12
_i1$ = 16
_val2$ = 20
_i2$ = 24
_match$ = 28
_res$ = 32
_op$70531 = -132
_sz$70533 = -136
_buf$70534 = -128
_debug_compare_res PROC NEAR

; 347  : ){

	push	ebp
	mov	ebp, esp
	sub	esp, 152				; 00000098H

; 348  : 	/* Return if not debuging */
; 349  : 	if(!cntxt->sql_trace) return res;

	mov	eax, DWORD PTR _cntxt$[ebp]
	cmp	DWORD PTR [eax+29852], 0
	jne	SHORT $L70530
	mov	eax, DWORD PTR _res$[ebp]
	jmp	$L70529
$L70530:

; 351  : 		char *op = "";

	mov	DWORD PTR _op$70531[ebp], OFFSET FLAT:$SG70532

; 352  : 		size_t sz = 0;

	mov	DWORD PTR _sz$70533[ebp], 0

; 353  : 		char buf[128];
; 354  : 
; 355  : 		/* Output comparison value 1 */
; 356  : 		dynbuf_add(&cntxt->debug_msg, add_sz_str("\n*** compare_values : ('"), NO_CONV);

	push	0
	push	0
	push	24					; 00000018H
	push	OFFSET FLAT:$SG70536
	mov	ecx, DWORD PTR _cntxt$[ebp]
	add	ecx, 29864				; 000074a8H
	push	ecx
	call	_dynbuf_add
	add	esp, 20					; 00000014H

; 357  : 		dyntab_to_dynbuf(val1, &cntxt->debug_msg, add_sz_str(","), add_sz_str("','"), NO_CONV);

	push	0
	push	0
	push	3
	push	OFFSET FLAT:$SG70538
	push	1
	push	OFFSET FLAT:$SG70539
	mov	edx, DWORD PTR _cntxt$[ebp]
	add	edx, 29864				; 000074a8H
	push	edx
	mov	eax, DWORD PTR _val1$[ebp]
	push	eax
	call	_dyntab_to_dynbuf
	add	esp, 32					; 00000020H

; 358  : 		dynbuf_add(&cntxt->debug_msg, add_sz_str("') "), NO_CONV);

	push	0
	push	0
	push	3
	push	OFFSET FLAT:$SG70541
	mov	ecx, DWORD PTR _cntxt$[ebp]
	add	ecx, 29864				; 000074a8H
	push	ecx
	call	_dynbuf_add
	add	esp, 20					; 00000014H

; 359  : 
; 360  : 		/* Output comparison query */
; 361  : #define PRINT(x) op = x; sz = sizeof(x) - 1; break
; 362  : 		switch(match)
; 363  : 		{

	mov	edx, DWORD PTR _match$[ebp]
	mov	DWORD PTR -140+[ebp], edx
	mov	eax, DWORD PTR -140+[ebp]
	sub	eax, 5
	mov	DWORD PTR -140+[ebp], eax
	cmp	DWORD PTR -140+[ebp], 13		; 0000000dH
	ja	$L70557
	mov	edx, DWORD PTR -140+[ebp]
	xor	ecx, ecx
	mov	cl, BYTE PTR $L71151[edx]
	jmp	DWORD PTR $L71152[ecx*4]
$L70547:

; 364  : 		case Smaller:		PRINT("<");

	mov	DWORD PTR _op$70531[ebp], OFFSET FLAT:$SG70548
	mov	DWORD PTR _sz$70533[ebp], 1
	jmp	SHORT $L70544
$L70549:

; 365  : 		case SmallerEqual:	PRINT("<=");

	mov	DWORD PTR _op$70531[ebp], OFFSET FLAT:$SG70550
	mov	DWORD PTR _sz$70533[ebp], 2
	jmp	SHORT $L70544
$L70551:

; 366  : 		case Larger:		PRINT(">");

	mov	DWORD PTR _op$70531[ebp], OFFSET FLAT:$SG70552
	mov	DWORD PTR _sz$70533[ebp], 1
	jmp	SHORT $L70544
$L70553:

; 367  : 		case LargerEqual:	PRINT("=>");

	mov	DWORD PTR _op$70531[ebp], OFFSET FLAT:$SG70554
	mov	DWORD PTR _sz$70533[ebp], 2
	jmp	SHORT $L70544
$L70555:

; 368  : 		case Different:		PRINT("!=");

	mov	DWORD PTR _op$70531[ebp], OFFSET FLAT:$SG70556
	mov	DWORD PTR _sz$70533[ebp], 2
	jmp	SHORT $L70544
$L70557:

; 369  : 		default:			PRINT("==");

	mov	DWORD PTR _op$70531[ebp], OFFSET FLAT:$SG70558
	mov	DWORD PTR _sz$70533[ebp], 2
$L70544:

; 371  : #undef PRINT
; 372  : 		dynbuf_add(&cntxt->debug_msg, op, sz, NO_CONV);

	push	0
	push	0
	mov	eax, DWORD PTR _sz$70533[ebp]
	push	eax
	mov	ecx, DWORD PTR _op$70531[ebp]
	push	ecx
	mov	edx, DWORD PTR _cntxt$[ebp]
	add	edx, 29864				; 000074a8H
	push	edx
	call	_dynbuf_add
	add	esp, 20					; 00000014H

; 373  : 
; 374  : 		/* Output comparison value 2 */
; 375  : 		dynbuf_add(&cntxt->debug_msg, add_sz_str(" ('"), NO_CONV);

	push	0
	push	0
	push	3
	push	OFFSET FLAT:$SG70561
	mov	eax, DWORD PTR _cntxt$[ebp]
	add	eax, 29864				; 000074a8H
	push	eax
	call	_dynbuf_add
	add	esp, 20					; 00000014H

; 376  : 		dyntab_to_dynbuf(val2, &cntxt->debug_msg, add_sz_str(","), add_sz_str("','"), NO_CONV);

	push	0
	push	0
	push	3
	push	OFFSET FLAT:$SG70563
	push	1
	push	OFFSET FLAT:$SG70564
	mov	ecx, DWORD PTR _cntxt$[ebp]
	add	ecx, 29864				; 000074a8H
	push	ecx
	mov	edx, DWORD PTR _val2$[ebp]
	push	edx
	call	_dyntab_to_dynbuf
	add	esp, 32					; 00000020H

; 377  : 		dynbuf_add(&cntxt->debug_msg, add_sz_str("')"), NO_CONV);

	push	0
	push	0
	push	2
	push	OFFSET FLAT:$SG70566
	mov	eax, DWORD PTR _cntxt$[ebp]
	add	eax, 29864				; 000074a8H
	push	eax
	call	_dynbuf_add
	add	esp, 20					; 00000014H

; 378  : 
; 379  : 		/* Output comparison result */
; 380  : 		dynbuf_add(&cntxt->debug_msg, buf,
; 381  : 					snprintf(add_sz_str(buf), "IS %s on '%s' %s '%s'", res ? "TRUE" : "FALSE",
; 382  : 					i1 < val1->nbrows ? dyntab_val(val1, i1, 0) : "NoMatch" , op,
; 383  : 					i2 < val2->nbrows ? dyntab_val(val2, i2, 0) : "NoMatch"), NO_CONV);

	mov	ecx, DWORD PTR _val2$[ebp]
	mov	edx, DWORD PTR _i2$[ebp]
	cmp	edx, DWORD PTR [ecx]
	jae	SHORT $L71145
	push	0
	mov	eax, DWORD PTR _i2$[ebp]
	push	eax
	mov	ecx, DWORD PTR _val2$[ebp]
	push	ecx
	call	_dyntab_val
	add	esp, 12					; 0000000cH
	mov	DWORD PTR -144+[ebp], eax
	jmp	SHORT $L71146
$L71145:
	mov	DWORD PTR -144+[ebp], OFFSET FLAT:$SG70568
$L71146:
	mov	edx, DWORD PTR _val1$[ebp]
	mov	eax, DWORD PTR _i1$[ebp]
	cmp	eax, DWORD PTR [edx]
	jae	SHORT $L71147
	push	0
	mov	ecx, DWORD PTR _i1$[ebp]
	push	ecx
	mov	edx, DWORD PTR _val1$[ebp]
	push	edx
	call	_dyntab_val
	add	esp, 12					; 0000000cH
	mov	DWORD PTR -148+[ebp], eax
	jmp	SHORT $L71148
$L71147:
	mov	DWORD PTR -148+[ebp], OFFSET FLAT:$SG70569
$L71148:
	cmp	DWORD PTR _res$[ebp], 0
	je	SHORT $L71149
	mov	DWORD PTR -152+[ebp], OFFSET FLAT:$SG70570
	jmp	SHORT $L71150
$L71149:
	mov	DWORD PTR -152+[ebp], OFFSET FLAT:$SG70571
$L71150:
	push	0
	push	0
	mov	eax, DWORD PTR -144+[ebp]
	push	eax
	mov	ecx, DWORD PTR _op$70531[ebp]
	push	ecx
	mov	edx, DWORD PTR -148+[ebp]
	push	edx
	mov	eax, DWORD PTR -152+[ebp]
	push	eax
	push	OFFSET FLAT:$SG70572
	push	127					; 0000007fH
	lea	ecx, DWORD PTR _buf$70534[ebp]
	push	ecx
	call	__snprintf
	add	esp, 28					; 0000001cH
	push	eax
	lea	edx, DWORD PTR _buf$70534[ebp]
	push	edx
	mov	eax, DWORD PTR _cntxt$[ebp]
	add	eax, 29864				; 000074a8H
	push	eax
	call	_dynbuf_add
	add	esp, 20					; 00000014H

; 385  : 	return res;

	mov	eax, DWORD PTR _res$[ebp]
$L70529:

; 386  : }

	mov	esp, ebp
	pop	ebp
	ret	0
$L71152:
	DD	$L70555
	DD	$L70551
	DD	$L70553
	DD	$L70547
	DD	$L70549
	DD	$L70557
$L71151:
	DB	0
	DB	5
	DB	5
	DB	5
	DB	5
	DB	5
	DB	5
	DB	5
	DB	5
	DB	5
	DB	1
	DB	2
	DB	3
	DB	4
_debug_compare_res ENDP
_TEXT	ENDS
PUBLIC	_compare_values
EXTRN	_atof:NEAR
EXTRN	__fltused:NEAR
_DATA	SEGMENT
	ORG $+2
$SG70589 DB	'_EVA_NUMERIC', 00H
	ORG $+3
$SG70596 DB	'_EVA_DIFFERENT', 00H
	ORG $+1
$SG70599 DB	'_EVA_SMALLER', 00H
	ORG $+3
$SG70602 DB	'_EVA_SMALLEREQUAL', 00H
	ORG $+2
$SG70605 DB	'_EVA_GREATER', 00H
	ORG $+3
$SG70608 DB	'_EVA_GREATEREQUAL', 00H
	ORG $+2
$SG70611 DB	'_EVA_BEGINWITH', 00H
	ORG $+1
$SG70614 DB	'_EVA_NOT_BEGINWITH', 00H
	ORG $+1
$SG70617 DB	'_EVA_CONTAIN', 00H
	ORG $+3
$SG70620 DB	'_EVA_NOT_CONTAIN', 00H
_DATA	ENDS
_TEXT	SEGMENT
_cntxt$ = 8
_val1$ = 12
_oper$ = 16
_val2$ = 20
_mode$ = 24
_multiple$ = 28
_match$ = -12
_b_num$ = -4
_b_all$ = -8
_i$ = -20
_j$ = -24
_res$ = -16
_v1$70626 = -32
_v2$70631 = -40
_compare_values PROC NEAR

; 400  : ){

	push	ebp
	mov	ebp, esp
	sub	esp, 116				; 00000074H

; 401  : 	MatchMode match = Exact;

	mov	DWORD PTR _match$[ebp], 6

; 402  : 	int b_num = mode && !strcmp(mode, "_EVA_NUMERIC");

	cmp	DWORD PTR _mode$[ebp], 0
	je	SHORT $L71154
	push	OFFSET FLAT:$SG70589
	mov	eax, DWORD PTR _mode$[ebp]
	push	eax
	call	_strcmp
	add	esp, 8
	test	eax, eax
	jne	SHORT $L71154
	mov	DWORD PTR -44+[ebp], 1
	jmp	SHORT $L71155
$L71154:
	mov	DWORD PTR -44+[ebp], 0
$L71155:
	mov	ecx, DWORD PTR -44+[ebp]
	mov	DWORD PTR _b_num$[ebp], ecx

; 403  : 	int b_all = multiple && *multiple == '0';

	cmp	DWORD PTR _multiple$[ebp], 0
	je	SHORT $L71156
	mov	edx, DWORD PTR _multiple$[ebp]
	movsx	eax, BYTE PTR [edx]
	cmp	eax, 48					; 00000030H
	jne	SHORT $L71156
	mov	DWORD PTR -48+[ebp], 1
	jmp	SHORT $L71157
$L71156:
	mov	DWORD PTR -48+[ebp], 0
$L71157:
	mov	ecx, DWORD PTR -48+[ebp]
	mov	DWORD PTR _b_all$[ebp], ecx

; 404  : 	unsigned long i, j = 0;

	mov	DWORD PTR _j$[ebp], 0

; 405  : 	int res = 0;

	mov	DWORD PTR _res$[ebp], 0

; 406  : 
; 407  : 	/* Set match mode & values depending on comparison type */
; 408  : #define USE_STD_VAL(tag, mode) if(!strcmp("_EVA_"#tag, oper)) match = mode;
; 409  : 	USE_STD_VAL(DIFFERENT, Different) else

	mov	edx, DWORD PTR _oper$[ebp]
	push	edx
	push	OFFSET FLAT:$SG70596
	call	_strcmp
	add	esp, 8
	test	eax, eax
	jne	SHORT $L70595
	mov	DWORD PTR _match$[ebp], 5
	jmp	$L70619
$L70595:

; 410  : 	USE_STD_VAL(SMALLER, Smaller) else

	mov	eax, DWORD PTR _oper$[ebp]
	push	eax
	push	OFFSET FLAT:$SG70599
	call	_strcmp
	add	esp, 8
	test	eax, eax
	jne	SHORT $L70598
	mov	DWORD PTR _match$[ebp], 17		; 00000011H
	jmp	$L70619
$L70598:

; 411  : 	USE_STD_VAL(SMALLEREQUAL, SmallerEqual) else

	mov	ecx, DWORD PTR _oper$[ebp]
	push	ecx
	push	OFFSET FLAT:$SG70602
	call	_strcmp
	add	esp, 8
	test	eax, eax
	jne	SHORT $L70601
	mov	DWORD PTR _match$[ebp], 18		; 00000012H
	jmp	$L70619
$L70601:

; 412  : 	USE_STD_VAL(GREATER, Larger) else

	mov	edx, DWORD PTR _oper$[ebp]
	push	edx
	push	OFFSET FLAT:$SG70605
	call	_strcmp
	add	esp, 8
	test	eax, eax
	jne	SHORT $L70604
	mov	DWORD PTR _match$[ebp], 15		; 0000000fH
	jmp	$L70619
$L70604:

; 413  : 	USE_STD_VAL(GREATEREQUAL, LargerEqual) else

	mov	eax, DWORD PTR _oper$[ebp]
	push	eax
	push	OFFSET FLAT:$SG70608
	call	_strcmp
	add	esp, 8
	test	eax, eax
	jne	SHORT $L70607
	mov	DWORD PTR _match$[ebp], 16		; 00000010H
	jmp	SHORT $L70619
$L70607:

; 414  : 	USE_STD_VAL(BEGINWITH, Begin) else

	mov	ecx, DWORD PTR _oper$[ebp]
	push	ecx
	push	OFFSET FLAT:$SG70611
	call	_strcmp
	add	esp, 8
	test	eax, eax
	jne	SHORT $L70610
	mov	DWORD PTR _match$[ebp], 13		; 0000000dH
	jmp	SHORT $L70619
$L70610:

; 415  : 	USE_STD_VAL(NOT_BEGINWITH, NotBegin) else

	mov	edx, DWORD PTR _oper$[ebp]
	push	edx
	push	OFFSET FLAT:$SG70614
	call	_strcmp
	add	esp, 8
	test	eax, eax
	jne	SHORT $L70613
	mov	DWORD PTR _match$[ebp], 14		; 0000000eH
	jmp	SHORT $L70619
$L70613:

; 416  : 	USE_STD_VAL(CONTAIN, Contain) else

	mov	eax, DWORD PTR _oper$[ebp]
	push	eax
	push	OFFSET FLAT:$SG70617
	call	_strcmp
	add	esp, 8
	test	eax, eax
	jne	SHORT $L70616
	mov	DWORD PTR _match$[ebp], 11		; 0000000bH
	jmp	SHORT $L70619
$L70616:

; 417  : 	USE_STD_VAL(NOT_CONTAIN, NotContain)

	mov	ecx, DWORD PTR _oper$[ebp]
	push	ecx
	push	OFFSET FLAT:$SG70620
	call	_strcmp
	add	esp, 8
	test	eax, eax
	jne	SHORT $L70619
	mov	DWORD PTR _match$[ebp], 12		; 0000000cH
$L70619:

; 418  : #undef USE_STD_VAL
; 419  : 
; 420  : 	/* Always check all values for Different operator */
; 421  : 	if(match == Different) b_all = 1;

	cmp	DWORD PTR _match$[ebp], 5
	jne	SHORT $L70621
	mov	DWORD PTR _b_all$[ebp], 1
$L70621:

; 422  : 
; 423  : 	for(i = 0; !i || i < val1->nbrows; i++)

	mov	DWORD PTR _i$[ebp], 0
	jmp	SHORT $L70622
$L70623:
	mov	edx, DWORD PTR _i$[ebp]
	add	edx, 1
	mov	DWORD PTR _i$[ebp], edx
$L70622:
	cmp	DWORD PTR _i$[ebp], 0
	je	SHORT $L70625
	mov	eax, DWORD PTR _val1$[ebp]
	mov	ecx, DWORD PTR _i$[ebp]
	cmp	ecx, DWORD PTR [eax]
	jae	$L70624
$L70625:

; 425  : 		double v1 = b_num ? atof(dyntab_val(val1, i, 0)) : 0;

	cmp	DWORD PTR _b_num$[ebp], 0
	je	SHORT $L71158
	push	0
	mov	edx, DWORD PTR _i$[ebp]
	push	edx
	mov	eax, DWORD PTR _val1$[ebp]
	push	eax
	call	_dyntab_val
	add	esp, 12					; 0000000cH
	push	eax
	call	_atof
	add	esp, 4
	fstp	QWORD PTR -56+[ebp]
	jmp	SHORT $L71159
$L71158:
	mov	DWORD PTR -56+[ebp], 0
	mov	DWORD PTR -56+[ebp+4], 0
$L71159:
	mov	ecx, DWORD PTR -56+[ebp]
	mov	DWORD PTR _v1$70626[ebp], ecx
	mov	edx, DWORD PTR -56+[ebp+4]
	mov	DWORD PTR _v1$70626[ebp+4], edx

; 426  : 		for(j = 0; !j || j < val2->nbrows; j++)

	mov	DWORD PTR _j$[ebp], 0
	jmp	SHORT $L70627
$L70628:
	mov	eax, DWORD PTR _j$[ebp]
	add	eax, 1
	mov	DWORD PTR _j$[ebp], eax
$L70627:
	cmp	DWORD PTR _j$[ebp], 0
	je	SHORT $L70630
	mov	ecx, DWORD PTR _val2$[ebp]
	mov	edx, DWORD PTR _j$[ebp]
	cmp	edx, DWORD PTR [ecx]
	jae	$L70629
$L70630:

; 428  : 			double v2 = b_num ? atof(dyntab_val(val2, j, 0)) : 0;

	cmp	DWORD PTR _b_num$[ebp], 0
	je	SHORT $L71160
	push	0
	mov	eax, DWORD PTR _j$[ebp]
	push	eax
	mov	ecx, DWORD PTR _val2$[ebp]
	push	ecx
	call	_dyntab_val
	add	esp, 12					; 0000000cH
	push	eax
	call	_atof
	add	esp, 4
	fstp	QWORD PTR -64+[ebp]
	jmp	SHORT $L71161
$L71160:
	mov	DWORD PTR -64+[ebp], 0
	mov	DWORD PTR -64+[ebp+4], 0
$L71161:
	mov	edx, DWORD PTR -64+[ebp]
	mov	DWORD PTR _v2$70631[ebp], edx
	mov	eax, DWORD PTR -64+[ebp+4]
	mov	DWORD PTR _v2$70631[ebp+4], eax

; 429  : 			switch(match)
; 430  : 			{

	mov	ecx, DWORD PTR _match$[ebp]
	mov	DWORD PTR -68+[ebp], ecx
	mov	edx, DWORD PTR -68+[ebp]
	sub	edx, 5
	mov	DWORD PTR -68+[ebp], edx
	cmp	DWORD PTR -68+[ebp], 13			; 0000000dH
	ja	$L70641
	mov	ecx, DWORD PTR -68+[ebp]
	xor	eax, eax
	mov	al, BYTE PTR $L71186[ecx]
	jmp	DWORD PTR $L71187[eax*4]
$L70636:

; 431  : 			case Smaller:
; 432  : 				res = b_num ? v1 < v2 : dyntab_cmp(val1, i, 0, val2, j, 0) < 0;

	cmp	DWORD PTR _b_num$[ebp], 0
	je	SHORT $L71164
	fld	QWORD PTR _v1$70626[ebp]
	fcomp	QWORD PTR _v2$70631[ebp]
	fnstsw	ax
	test	ah, 1
	je	SHORT $L71162
	mov	DWORD PTR -72+[ebp], 1
	jmp	SHORT $L71163
$L71162:
	mov	DWORD PTR -72+[ebp], 0
$L71163:
	mov	edx, DWORD PTR -72+[ebp]
	mov	DWORD PTR -76+[ebp], edx
	jmp	SHORT $L71165
$L71164:
	push	0
	mov	eax, DWORD PTR _j$[ebp]
	push	eax
	mov	ecx, DWORD PTR _val2$[ebp]
	push	ecx
	push	0
	mov	edx, DWORD PTR _i$[ebp]
	push	edx
	mov	eax, DWORD PTR _val1$[ebp]
	push	eax
	call	_dyntab_cmp
	add	esp, 24					; 00000018H
	xor	ecx, ecx
	test	eax, eax
	setl	cl
	mov	DWORD PTR -76+[ebp], ecx
$L71165:
	mov	edx, DWORD PTR -76+[ebp]
	mov	DWORD PTR _res$[ebp], edx

; 433  : 				break;

	jmp	$L70633
$L70637:

; 434  : 			case SmallerEqual:
; 435  : 				res = b_num ? v1 <= v2 : dyntab_cmp(val1, i, 0, val2, j, 0) <= 0;

	cmp	DWORD PTR _b_num$[ebp], 0
	je	SHORT $L71168
	fld	QWORD PTR _v1$70626[ebp]
	fcomp	QWORD PTR _v2$70631[ebp]
	fnstsw	ax
	test	ah, 65					; 00000041H
	je	SHORT $L71166
	mov	DWORD PTR -80+[ebp], 1
	jmp	SHORT $L71167
$L71166:
	mov	DWORD PTR -80+[ebp], 0
$L71167:
	mov	eax, DWORD PTR -80+[ebp]
	mov	DWORD PTR -84+[ebp], eax
	jmp	SHORT $L71169
$L71168:
	push	0
	mov	ecx, DWORD PTR _j$[ebp]
	push	ecx
	mov	edx, DWORD PTR _val2$[ebp]
	push	edx
	push	0
	mov	eax, DWORD PTR _i$[ebp]
	push	eax
	mov	ecx, DWORD PTR _val1$[ebp]
	push	ecx
	call	_dyntab_cmp
	add	esp, 24					; 00000018H
	xor	edx, edx
	test	eax, eax
	setle	dl
	mov	DWORD PTR -84+[ebp], edx
$L71169:
	mov	eax, DWORD PTR -84+[ebp]
	mov	DWORD PTR _res$[ebp], eax

; 436  : 				break;

	jmp	$L70633
$L70638:

; 437  : 			case Larger:
; 438  : 				res = b_num ? v1 > v2 : dyntab_cmp(val1, i, 0, val2, j, 0) > 0;

	cmp	DWORD PTR _b_num$[ebp], 0
	je	SHORT $L71172
	fld	QWORD PTR _v1$70626[ebp]
	fcomp	QWORD PTR _v2$70631[ebp]
	fnstsw	ax
	test	ah, 65					; 00000041H
	jne	SHORT $L71170
	mov	DWORD PTR -88+[ebp], 1
	jmp	SHORT $L71171
$L71170:
	mov	DWORD PTR -88+[ebp], 0
$L71171:
	mov	ecx, DWORD PTR -88+[ebp]
	mov	DWORD PTR -92+[ebp], ecx
	jmp	SHORT $L71173
$L71172:
	push	0
	mov	edx, DWORD PTR _j$[ebp]
	push	edx
	mov	eax, DWORD PTR _val2$[ebp]
	push	eax
	push	0
	mov	ecx, DWORD PTR _i$[ebp]
	push	ecx
	mov	edx, DWORD PTR _val1$[ebp]
	push	edx
	call	_dyntab_cmp
	add	esp, 24					; 00000018H
	xor	ecx, ecx
	test	eax, eax
	setg	cl
	mov	DWORD PTR -92+[ebp], ecx
$L71173:
	mov	edx, DWORD PTR -92+[ebp]
	mov	DWORD PTR _res$[ebp], edx

; 439  : 				break;

	jmp	$L70633
$L70639:

; 440  : 			case LargerEqual:
; 441  : 				res = b_num ? v1 >= v2 : dyntab_cmp(val1, i, 0, val2, j, 0) >= 0;

	cmp	DWORD PTR _b_num$[ebp], 0
	je	SHORT $L71176
	fld	QWORD PTR _v1$70626[ebp]
	fcomp	QWORD PTR _v2$70631[ebp]
	fnstsw	ax
	test	ah, 1
	jne	SHORT $L71174
	mov	DWORD PTR -96+[ebp], 1
	jmp	SHORT $L71175
$L71174:
	mov	DWORD PTR -96+[ebp], 0
$L71175:
	mov	eax, DWORD PTR -96+[ebp]
	mov	DWORD PTR -100+[ebp], eax
	jmp	SHORT $L71177
$L71176:
	push	0
	mov	ecx, DWORD PTR _j$[ebp]
	push	ecx
	mov	edx, DWORD PTR _val2$[ebp]
	push	edx
	push	0
	mov	eax, DWORD PTR _i$[ebp]
	push	eax
	mov	ecx, DWORD PTR _val1$[ebp]
	push	ecx
	call	_dyntab_cmp
	add	esp, 24					; 00000018H
	xor	edx, edx
	test	eax, eax
	setge	dl
	mov	DWORD PTR -100+[ebp], edx
$L71177:
	mov	eax, DWORD PTR -100+[ebp]
	mov	DWORD PTR _res$[ebp], eax

; 442  : 				break;

	jmp	$L70633
$L70640:

; 443  : 			case Different:
; 444  : 				res = b_num ? v1 != v2 : dyntab_cmp(val1, i, 0, val2, j, 0) != 0;

	cmp	DWORD PTR _b_num$[ebp], 0
	je	SHORT $L71180
	fld	QWORD PTR _v1$70626[ebp]
	fcomp	QWORD PTR _v2$70631[ebp]
	fnstsw	ax
	test	ah, 64					; 00000040H
	jne	SHORT $L71178
	mov	DWORD PTR -104+[ebp], 1
	jmp	SHORT $L71179
$L71178:
	mov	DWORD PTR -104+[ebp], 0
$L71179:
	mov	ecx, DWORD PTR -104+[ebp]
	mov	DWORD PTR -108+[ebp], ecx
	jmp	SHORT $L71181
$L71180:
	push	0
	mov	edx, DWORD PTR _j$[ebp]
	push	edx
	mov	eax, DWORD PTR _val2$[ebp]
	push	eax
	push	0
	mov	ecx, DWORD PTR _i$[ebp]
	push	ecx
	mov	edx, DWORD PTR _val1$[ebp]
	push	edx
	call	_dyntab_cmp
	add	esp, 24					; 00000018H
	neg	eax
	sbb	eax, eax
	neg	eax
	mov	DWORD PTR -108+[ebp], eax
$L71181:
	mov	eax, DWORD PTR -108+[ebp]
	mov	DWORD PTR _res$[ebp], eax

; 445  : 				break;

	jmp	SHORT $L70633
$L70641:

; 446  : 			default:
; 447  : 				res = b_num ? v1 == v2 : !dyntab_cmp(val1, i, 0, val2, j, 0);

	cmp	DWORD PTR _b_num$[ebp], 0
	je	SHORT $L71184
	fld	QWORD PTR _v1$70626[ebp]
	fcomp	QWORD PTR _v2$70631[ebp]
	fnstsw	ax
	test	ah, 64					; 00000040H
	je	SHORT $L71182
	mov	DWORD PTR -112+[ebp], 1
	jmp	SHORT $L71183
$L71182:
	mov	DWORD PTR -112+[ebp], 0
$L71183:
	mov	ecx, DWORD PTR -112+[ebp]
	mov	DWORD PTR -116+[ebp], ecx
	jmp	SHORT $L71185
$L71184:
	push	0
	mov	edx, DWORD PTR _j$[ebp]
	push	edx
	mov	eax, DWORD PTR _val2$[ebp]
	push	eax
	push	0
	mov	ecx, DWORD PTR _i$[ebp]
	push	ecx
	mov	edx, DWORD PTR _val1$[ebp]
	push	edx
	call	_dyntab_cmp
	add	esp, 24					; 00000018H
	neg	eax
	sbb	eax, eax
	inc	eax
	mov	DWORD PTR -116+[ebp], eax
$L71185:
	mov	eax, DWORD PTR -116+[ebp]
	mov	DWORD PTR _res$[ebp], eax
$L70633:

; 449  : 
; 450  : 			if(res ^ b_all) return debug_compare_res(cntxt, val1, i, val2, j, match, res);

	mov	ecx, DWORD PTR _res$[ebp]
	xor	ecx, DWORD PTR _b_all$[ebp]
	test	ecx, ecx
	je	SHORT $L70642
	mov	edx, DWORD PTR _res$[ebp]
	push	edx
	mov	eax, DWORD PTR _match$[ebp]
	push	eax
	mov	ecx, DWORD PTR _j$[ebp]
	push	ecx
	mov	edx, DWORD PTR _val2$[ebp]
	push	edx
	mov	eax, DWORD PTR _i$[ebp]
	push	eax
	mov	ecx, DWORD PTR _val1$[ebp]
	push	ecx
	mov	edx, DWORD PTR _cntxt$[ebp]
	push	edx
	call	_debug_compare_res
	add	esp, 28					; 0000001cH
	jmp	SHORT $L70586
$L70642:

; 451  : 		}

	jmp	$L70628
$L70629:

; 452  : 	}

	jmp	$L70623
$L70624:

; 453  : 	return debug_compare_res(cntxt, val1, i, val2, j, match, res);

	mov	eax, DWORD PTR _res$[ebp]
	push	eax
	mov	ecx, DWORD PTR _match$[ebp]
	push	ecx
	mov	edx, DWORD PTR _j$[ebp]
	push	edx
	mov	eax, DWORD PTR _val2$[ebp]
	push	eax
	mov	ecx, DWORD PTR _i$[ebp]
	push	ecx
	mov	edx, DWORD PTR _val1$[ebp]
	push	edx
	mov	eax, DWORD PTR _cntxt$[ebp]
	push	eax
	call	_debug_compare_res
	add	esp, 28					; 0000001cH
$L70586:

; 454  : }

	mov	esp, ebp
	pop	ebp
	ret	0
$L71187:
	DD	$L70640
	DD	$L70638
	DD	$L70639
	DD	$L70636
	DD	$L70637
	DD	$L70641
$L71186:
	DB	0
	DB	5
	DB	5
	DB	5
	DB	5
	DB	5
	DB	5
	DB	5
	DB	5
	DB	5
	DB	1
	DB	2
	DB	3
	DB	4
_compare_values ENDP
_TEXT	ENDS
PUBLIC	_qry_values
EXTRN	_form_eval_fieldexpr:NEAR
EXTRN	_form_eval_valtype:NEAR
EXTRN	_ctrl_output_exprval:NEAR
EXTRN	_ctrl_read_baseobj:NEAR
EXTRN	_qry_cache_idobj_field:NEAR
EXTRN	_qry_cache_objlist_field:NEAR
EXTRN	_dyntab_from_tab:NEAR
_DATA	SEGMENT
	ORG $+3
$SG70664 DB	'_EVA_CURRENTOBJ', 00H
$SG70670 DB	'_EVA_CONTROL', 00H
	ORG $+3
$SG70673 DB	'_EVA_CALC', 00H
	ORG $+2
$SG70681 DB	'D:\Travail\ABI\EVA\V4.0\CGI\Brunix-2016\ctrl_access.c', 00H
	ORG $+2
$SG70682 DB	'qry_values', 00H
	ORG $+1
$SG70687 DB	'_EVA_INPUT', 00H
	ORG $+1
$SG70690 DB	'_EVA_TYPE', 00H
	ORG $+2
$SG70693 DB	'_EVA_RELATION', 00H
	ORG $+2
$SG70694 DB	'_EVA_FILE_UPLOAD', 00H
	ORG $+3
$SG70696 DB	'_EVA_FIELD', 00H
	ORG $+1
$SG70699 DB	'D:\Travail\ABI\EVA\V4.0\CGI\Brunix-2016\ctrl_access.c', 00H
	ORG $+2
$SG70700 DB	'qry_values', 00H
	ORG $+1
$SG70711 DB	'D:\Travail\ABI\EVA\V4.0\CGI\Brunix-2016\ctrl_access.c', 00H
	ORG $+2
$SG70712 DB	'qry_values', 00H
	ORG $+1
$SG70716 DB	'_EVA_FIELD', 00H
	ORG $+1
$SG70719 DB	'D:\Travail\ABI\EVA\V4.0\CGI\Brunix-2016\ctrl_access.c', 00H
	ORG $+2
$SG70720 DB	'qry_values', 00H
	ORG $+1
$SG70723 DB	'D:\Travail\ABI\EVA\V4.0\CGI\Brunix-2016\ctrl_access.c', 00H
	ORG $+2
$SG70724 DB	'qry_values', 00H
	ORG $+1
$SG70725 DB	'D:\Travail\ABI\EVA\V4.0\CGI\Brunix-2016\ctrl_access.c', 00H
	ORG $+2
$SG70726 DB	'qry_values', 00H
	ORG $+1
$SG70728 DB	'D:\Travail\ABI\EVA\V4.0\CGI\Brunix-2016\ctrl_access.c', 00H
	ORG $+2
$SG70729 DB	'qry_values', 00H
_DATA	ENDS
_TEXT	SEGMENT
_data$ = -40
_obj$ = -68
_val$ = -20
_i$ = -44
_j$ = -48
_ctrltyp$70666 = -72
_ctrl$70667 = -552
_cntxt$ = 8
_res$ = 12
_valtyp$ = 16
_fields$ = 20
_expr$ = 24
_qry_values PROC NEAR

; 470  : ){

	push	ebp
	mov	ebp, esp
	sub	esp, 552				; 00000228H
	push	edi

; 471  : 	DynTable data = { 0 };

	mov	DWORD PTR _data$[ebp], 0
	xor	eax, eax
	mov	DWORD PTR _data$[ebp+4], eax
	mov	DWORD PTR _data$[ebp+8], eax
	mov	DWORD PTR _data$[ebp+12], eax
	mov	DWORD PTR _data$[ebp+16], eax

; 472  : 	DynTable obj = { 0 };

	mov	DWORD PTR _obj$[ebp], 0
	xor	ecx, ecx
	mov	DWORD PTR _obj$[ebp+4], ecx
	mov	DWORD PTR _obj$[ebp+8], ecx
	mov	DWORD PTR _obj$[ebp+12], ecx
	mov	DWORD PTR _obj$[ebp+16], ecx

; 473  : 	DynTable val = { 0 };

	mov	DWORD PTR _val$[ebp], 0
	xor	edx, edx
	mov	DWORD PTR _val$[ebp+4], edx
	mov	DWORD PTR _val$[ebp+8], edx
	mov	DWORD PTR _val$[ebp+12], edx
	mov	DWORD PTR _val$[ebp+16], edx

; 474  : 	unsigned long i, j;
; 475  : 
; 476  : 	/* Initialize */
; 477  : 	if(!valtyp || !*valtyp) valtyp = "_EVA_CURRENTOBJ";

	cmp	DWORD PTR _valtyp$[ebp], 0
	je	SHORT $L70663
	mov	eax, DWORD PTR _valtyp$[ebp]
	movsx	ecx, BYTE PTR [eax]
	test	ecx, ecx
	jne	SHORT $L70662
$L70663:
	mov	DWORD PTR _valtyp$[ebp], OFFSET FLAT:$SG70664
$L70662:

; 478  : 	dyntab_free(res);

	mov	edx, DWORD PTR _res$[ebp]
	push	edx
	call	_dyntab_free
	add	esp, 4

; 479  : 
; 480  : 	/* Handle fields if present */
; 481  : 	if(fields && fields->nbrows)

	cmp	DWORD PTR _fields$[ebp], 0
	je	$L70686
	mov	eax, DWORD PTR _fields$[ebp]
	cmp	DWORD PTR [eax], 0
	je	$L70686

; 483  : 		/* Read control type */
; 484  : 		char *ctrltyp;
; 485  : 		EVA_ctrl ctrl = {{0}};

	mov	DWORD PTR _ctrl$70667[ebp], 0
	xor	ecx, ecx
	mov	DWORD PTR _ctrl$70667[ebp+4], ecx
	mov	DWORD PTR _ctrl$70667[ebp+8], ecx
	mov	DWORD PTR _ctrl$70667[ebp+12], ecx
	mov	DWORD PTR _ctrl$70667[ebp+16], ecx
	mov	ecx, 115				; 00000073H
	xor	eax, eax
	lea	edi, DWORD PTR _ctrl$70667[ebp+20]
	rep stosd

; 486  : 		if(qry_cache_idobj_field(cntxt, &data, DYNTAB_TOUL(fields), "_EVA_CONTROL", 0)) STACK_ERROR;

	push	0
	push	OFFSET FLAT:$SG70670
	push	10					; 0000000aH
	push	0
	push	0
	push	0
	mov	edx, DWORD PTR _fields$[ebp]
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
	je	SHORT $L70669
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 486		; 000001e6H
	jmp	$eva_err$70671
$L70669:

; 487  : 		ctrltyp = dyntab_val(&data, 0, 0);

	push	0
	push	0
	lea	eax, DWORD PTR _data$[ebp]
	push	eax
	call	_dyntab_val
	add	esp, 12					; 0000000cH
	mov	DWORD PTR _ctrltyp$70666[ebp], eax

; 488  : 
; 489  : 		/* Calc-ed value : compute & add to result */
; 490  : 		if(!strcmp(ctrltyp, "_EVA_CALC"))

	push	OFFSET FLAT:$SG70673
	mov	ecx, DWORD PTR _ctrltyp$70666[ebp]
	push	ecx
	call	_strcmp
	add	esp, 8
	test	eax, eax
	jne	$L70672

; 492  : 			/* Calc-ed value : compute each value & add to result */
; 493  : 			for(i = 0; i < fields->nbrows; i++)

	mov	DWORD PTR _i$[ebp], 0
	jmp	SHORT $L70674
$L70675:
	mov	edx, DWORD PTR _i$[ebp]
	add	edx, 1
	mov	DWORD PTR _i$[ebp], edx
$L70674:
	mov	eax, DWORD PTR _fields$[ebp]
	mov	ecx, DWORD PTR _i$[ebp]
	cmp	ecx, DWORD PTR [eax]
	jae	$L70676

; 495  : 				if(qry_cache_idobj(&ctrl.attr, DYNTAB_TOUL(fields)) ||
; 496  : 					ctrl_read_baseobj(cntxt, &ctrl.attr) ||
; 497  : 					ctrl_output_exprval(cntxt, &ctrl, 3)) CLEAR_ERROR;

	push	3
	push	0
	push	10					; 0000000aH
	push	0
	push	0
	push	0
	mov	edx, DWORD PTR _fields$[ebp]
	push	edx
	call	_dyntab_val
	add	esp, 12					; 0000000cH
	push	eax
	call	_strtoul
	add	esp, 12					; 0000000cH
	push	eax
	lea	eax, DWORD PTR _ctrl$70667[ebp+44]
	push	eax
	mov	ecx, DWORD PTR _cntxt$[ebp]
	push	ecx
	call	_qry_cache_idobj_field
	add	esp, 20					; 00000014H
	test	eax, eax
	jne	SHORT $L70680
	lea	edx, DWORD PTR _ctrl$70667[ebp+44]
	push	edx
	mov	eax, DWORD PTR _cntxt$[ebp]
	push	eax
	call	_ctrl_read_baseobj
	add	esp, 8
	test	eax, eax
	jne	SHORT $L70680
	push	3
	lea	ecx, DWORD PTR _ctrl$70667[ebp]
	push	ecx
	mov	edx, DWORD PTR _cntxt$[ebp]
	push	edx
	call	_ctrl_output_exprval
	add	esp, 12					; 0000000cH
	test	eax, eax
	je	SHORT $L70679
$L70680:
	push	497					; 000001f1H
	push	OFFSET FLAT:$SG70681
	push	OFFSET FLAT:$SG70682
	mov	eax, DWORD PTR _cntxt$[ebp]
	push	eax
	call	_err_clear
	add	esp, 16					; 00000010H
$L70679:

; 498  : 				if(dyntab_from_tab(res, res->nbrows, 0, &ctrl.val, 0, 0, ctrl.val.nbrows, ctrl.val.nbcols, 33)) STACK_ERROR;

	push	33					; 00000021H
	mov	ecx, DWORD PTR _ctrl$70667[ebp+72]
	push	ecx
	mov	edx, DWORD PTR _ctrl$70667[ebp+64]
	push	edx
	push	0
	push	0
	lea	eax, DWORD PTR _ctrl$70667[ebp+64]
	push	eax
	push	0
	mov	ecx, DWORD PTR _res$[ebp]
	mov	edx, DWORD PTR [ecx]
	push	edx
	mov	eax, DWORD PTR _res$[ebp]
	push	eax
	call	_dyntab_from_tab
	add	esp, 36					; 00000024H
	test	eax, eax
	je	SHORT $L70683
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 498		; 000001f2H
	jmp	$eva_err$70671
$L70683:

; 499  : 			}

	jmp	$L70675
$L70676:

; 500  : 			RETURN_OK;

	jmp	$eva_noerr$70684
$L70672:

; 502  : 		else if(!strcmp(ctrltyp, "_EVA_INPUT"))

	push	OFFSET FLAT:$SG70687
	mov	edx, DWORD PTR _ctrltyp$70666[ebp]
	push	edx
	call	_strcmp
	add	esp, 8
	test	eax, eax
	jne	$L70686

; 504  : 
; 505  : 			/* Input : Check input type */
; 506  : 			if(qry_cache_idobj_field(cntxt, &data, DYNTAB_TOUL(fields), "_EVA_TYPE", 2)) STACK_ERROR;

	push	2
	push	OFFSET FLAT:$SG70690
	push	10					; 0000000aH
	push	0
	push	0
	push	0
	mov	eax, DWORD PTR _fields$[ebp]
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
	call	_qry_cache_idobj_field
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L70689
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 506		; 000001faH
	jmp	$eva_err$70671
$L70689:

; 507  : 			ctrltyp = dyntab_val(&data, 0, 0);

	push	0
	push	0
	lea	ecx, DWORD PTR _data$[ebp]
	push	ecx
	call	_dyntab_val
	add	esp, 12					; 0000000cH
	mov	DWORD PTR _ctrltyp$70666[ebp], eax

; 508  : 			if((!strcmp(ctrltyp, "_EVA_RELATION") || !strcmp(ctrltyp, "_EVA_FILE_UPLOAD")) && expr && expr->nbrows)

	push	OFFSET FLAT:$SG70693
	mov	edx, DWORD PTR _ctrltyp$70666[ebp]
	push	edx
	call	_strcmp
	add	esp, 8
	test	eax, eax
	je	SHORT $L70692
	push	OFFSET FLAT:$SG70694
	mov	eax, DWORD PTR _ctrltyp$70666[ebp]
	push	eax
	call	_strcmp
	add	esp, 8
	test	eax, eax
	jne	$L70691
$L70692:
	cmp	DWORD PTR _expr$[ebp], 0
	je	$L70691
	mov	ecx, DWORD PTR _expr$[ebp]
	cmp	DWORD PTR [ecx], 0
	je	$L70691

; 510  : 				/* Relation with expressions : read inputs values */
; 511  : 				if(qry_cache_objlist_field(cntxt, &data, fields, "_EVA_FIELD", 2)) STACK_ERROR;

	push	2
	push	OFFSET FLAT:$SG70696
	mov	edx, DWORD PTR _fields$[ebp]
	push	edx
	lea	eax, DWORD PTR _data$[ebp]
	push	eax
	mov	ecx, DWORD PTR _cntxt$[ebp]
	push	ecx
	call	_qry_cache_objlist_field
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L70695
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 511		; 000001ffH
	jmp	$eva_err$70671
$L70695:

; 512  : 				if(form_eval_valtype(cntxt, &val, valtyp, NULL, &data)) CLEAR_ERROR;

	lea	eax, DWORD PTR _data$[ebp]
	push	eax
	push	0
	mov	ecx, DWORD PTR _valtyp$[ebp]
	push	ecx
	lea	edx, DWORD PTR _val$[ebp]
	push	edx
	mov	eax, DWORD PTR _cntxt$[ebp]
	push	eax
	call	_form_eval_valtype
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L70698
	push	512					; 00000200H
	push	OFFSET FLAT:$SG70699
	push	OFFSET FLAT:$SG70700
	mov	ecx, DWORD PTR _cntxt$[ebp]
	push	ecx
	call	_err_clear
	add	esp, 16					; 00000010H
$L70698:

; 513  : 
; 514  : 				/* Evaluate expressions on each relation object & add to result */
; 515  : 				if(expr) for(i = 0; i < val.nbrows; i++)

	cmp	DWORD PTR _expr$[ebp], 0
	je	$L70704
	mov	DWORD PTR _i$[ebp], 0
	jmp	SHORT $L70702
$L70703:
	mov	edx, DWORD PTR _i$[ebp]
	add	edx, 1
	mov	DWORD PTR _i$[ebp], edx
$L70702:
	mov	eax, DWORD PTR _i$[ebp]
	cmp	eax, DWORD PTR _val$[ebp]
	jae	$L70704

; 516  : 					for(j = 0; j < expr->nbrows; j++)

	mov	DWORD PTR _j$[ebp], 0
	jmp	SHORT $L70705
$L70706:
	mov	ecx, DWORD PTR _j$[ebp]
	add	ecx, 1
	mov	DWORD PTR _j$[ebp], ecx
$L70705:
	mov	edx, DWORD PTR _expr$[ebp]
	mov	eax, DWORD PTR _j$[ebp]
	cmp	eax, DWORD PTR [edx]
	jae	$L70707

; 518  : 						if(form_eval_fieldexpr(cntxt, &data, 0, DYNTAB_TOULRC(&val, i, 0), DYNTAB_VAL_SZ(expr, j, 0), NULL, 0))

	push	0
	push	0
	push	0
	mov	ecx, DWORD PTR _j$[ebp]
	push	ecx
	mov	edx, DWORD PTR _expr$[ebp]
	push	edx
	call	_dyntab_sz
	add	esp, 12					; 0000000cH
	push	eax
	push	0
	mov	eax, DWORD PTR _j$[ebp]
	push	eax
	mov	ecx, DWORD PTR _expr$[ebp]
	push	ecx
	call	_dyntab_val
	add	esp, 12					; 0000000cH
	push	eax
	push	10					; 0000000aH
	push	0
	push	0
	mov	edx, DWORD PTR _i$[ebp]
	push	edx
	lea	eax, DWORD PTR _val$[ebp]
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
	test	eax, eax
	je	SHORT $L70710

; 519  : 							CLEAR_ERROR_CONT;

	push	519					; 00000207H
	push	OFFSET FLAT:$SG70711
	push	OFFSET FLAT:$SG70712
	mov	eax, DWORD PTR _cntxt$[ebp]
	push	eax
	call	_err_clear
	add	esp, 16					; 00000010H
	jmp	$L70706
$L70710:

; 520  : 						if(dyntab_from_tab(res, res->nbrows, 0, &data, 0, 0, data.nbrows, data.nbcols, 33)) STACK_ERROR;

	push	33					; 00000021H
	mov	ecx, DWORD PTR _data$[ebp+8]
	push	ecx
	mov	edx, DWORD PTR _data$[ebp]
	push	edx
	push	0
	push	0
	lea	eax, DWORD PTR _data$[ebp]
	push	eax
	push	0
	mov	ecx, DWORD PTR _res$[ebp]
	mov	edx, DWORD PTR [ecx]
	push	edx
	mov	eax, DWORD PTR _res$[ebp]
	push	eax
	call	_dyntab_from_tab
	add	esp, 36					; 00000024H
	test	eax, eax
	je	SHORT $L70713
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 520		; 00000208H
	jmp	$eva_err$70671
$L70713:

; 521  : 					}

	jmp	$L70706
$L70707:
	jmp	$L70703
$L70704:

; 523  : 			else

	jmp	SHORT $L70718
$L70691:

; 525  : 				/* Text input or relation without expressions : read inputs values */
; 526  : 				if(qry_cache_objlist_field(cntxt, &data, fields, "_EVA_FIELD", 2)) STACK_ERROR;

	push	2
	push	OFFSET FLAT:$SG70716
	mov	edx, DWORD PTR _fields$[ebp]
	push	edx
	lea	eax, DWORD PTR _data$[ebp]
	push	eax
	mov	ecx, DWORD PTR _cntxt$[ebp]
	push	ecx
	call	_qry_cache_objlist_field
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L70715
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 526		; 0000020eH
	jmp	$eva_err$70671
$L70715:

; 527  : 				if(form_eval_valtype(cntxt, res, valtyp, NULL, &data)) CLEAR_ERROR;

	lea	eax, DWORD PTR _data$[ebp]
	push	eax
	push	0
	mov	ecx, DWORD PTR _valtyp$[ebp]
	push	ecx
	mov	edx, DWORD PTR _res$[ebp]
	push	edx
	mov	eax, DWORD PTR _cntxt$[ebp]
	push	eax
	call	_form_eval_valtype
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L70718
	push	527					; 0000020fH
	push	OFFSET FLAT:$SG70719
	push	OFFSET FLAT:$SG70720
	mov	ecx, DWORD PTR _cntxt$[ebp]
	push	ecx
	call	_err_clear
	add	esp, 16					; 00000010H
$L70718:

; 529  : 			RETURN_OK;

	jmp	SHORT $eva_noerr$70684
$L70686:

; 532  : 
; 533  : 	/* Evaluate expressions */
; 534  : 	if(form_eval_valtype(cntxt, res, valtyp, NULL, expr)) CLEAR_ERROR;

	mov	edx, DWORD PTR _expr$[ebp]
	push	edx
	push	0
	mov	eax, DWORD PTR _valtyp$[ebp]
	push	eax
	mov	ecx, DWORD PTR _res$[ebp]
	push	ecx
	mov	edx, DWORD PTR _cntxt$[ebp]
	push	edx
	call	_form_eval_valtype
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $eva_noerr$70684
	push	534					; 00000216H
	push	OFFSET FLAT:$SG70723
	push	OFFSET FLAT:$SG70724
	mov	eax, DWORD PTR _cntxt$[ebp]
	push	eax
	call	_err_clear
	add	esp, 16					; 00000010H
$eva_noerr$70684:

; 535  : 
; 536  : 
; 537  : 	RETURN_OK_CLEANUP;

	push	0
	push	OFFSET FLAT:$SG70725
	push	OFFSET FLAT:$SG70726
	mov	ecx, DWORD PTR _cntxt$[ebp]
	push	ecx
	call	_err_clear
	add	esp, 16					; 00000010H
$eva_err$70671:
	mov	edx, DWORD PTR _cntxt$[ebp]
	cmp	DWORD PTR [edx+29872], 0
	je	SHORT $L70727
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	ecx, DWORD PTR [eax+29900]
	push	ecx
	push	OFFSET FLAT:$SG70728
	push	OFFSET FLAT:$SG70729
	mov	edx, DWORD PTR _cntxt$[ebp]
	push	edx
	call	_err_add_context
	add	esp, 16					; 00000010H
$L70727:
	lea	eax, DWORD PTR _data$[ebp]
	push	eax
	call	_dyntab_free
	add	esp, 4
	lea	ecx, DWORD PTR _obj$[ebp]
	push	ecx
	call	_dyntab_free
	add	esp, 4
	lea	edx, DWORD PTR _val$[ebp]
	push	edx
	call	_dyntab_free
	add	esp, 4
	mov	eax, DWORD PTR _cntxt$[ebp]
	xor	ecx, ecx
	cmp	DWORD PTR [eax+29872], 0
	setne	cl
	mov	eax, ecx

; 538  : }

	pop	edi
	mov	esp, ebp
	pop	ebp
	ret	0
_qry_values ENDP
_TEXT	ENDS
PUBLIC	_ctrl_check_cond
EXTRN	_mem_free:NEAR
EXTRN	_qry_filterlist_to_sql:NEAR
EXTRN	_qry_to_listobj:NEAR
_BSS	SEGMENT
	ALIGN	4

$SG70757 DB	01H DUP (?)
_BSS	ENDS
_DATA	SEGMENT
	ORG $+1
$SG70763 DB	'_EVA_TYPE_COND', 00H
	ORG $+1
$SG70768 DB	'_EVA_USERINGROUP', 00H
	ORG $+3
$SG70769 DB	'_EVA_USERNOTINGROUP', 00H
$SG70773 DB	'_EVA_USERGROUP_COND', 00H
$SG70775 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70784 DB	'_EVA_USERINGROUP', 00H
	ORG $+3
$SG70788 DB	'_EVA_CURCONDTRUE', 00H
	ORG $+3
$SG70789 DB	'_EVA_CURCONDFALSE', 00H
	ORG $+2
$SG70793 DB	'_EVA_FILTER_CONDSEQ', 00H
$SG70795 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70798 DB	'=', 00H
	ORG $+2
$SG70800 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70802 DB	'AND', 00H
$SG70803 DB	'D:\Travail\ABI\EVA\V4.0\CGI\Brunix-2016\ctrl_access.c', 00H
	ORG $+2
$SG70804 DB	'ctrl_check_cond', 00H
$SG70811 DB	'D:\Travail\ABI\EVA\V4.0\CGI\Brunix-2016\ctrl_access.c', 00H
	ORG $+2
$SG70812 DB	'ctrl_check_cond', 00H
$SG70813 DB	'_EVA_CURCONDTRUE', 00H
	ORG $+3
$SG70814 DB	'1', 00H
	ORG $+2
$SG70818 DB	'_EVA_CONDTRUE', 00H
	ORG $+2
$SG70819 DB	'_EVA_CONDFALSE', 00H
	ORG $+1
$SG70822 DB	'_EVA_FILTER_CONDSEQ', 00H
$SG70824 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70827 DB	'D:\Travail\ABI\EVA\V4.0\CGI\Brunix-2016\ctrl_access.c', 00H
	ORG $+2
$SG70828 DB	'ctrl_check_cond', 00H
$SG70830 DB	'_EVA_CONDTRUE', 00H
	ORG $+2
$SG70834 DB	'_EVA_ISNOTEMPTY', 00H
$SG70835 DB	'_EVA_ISEMPTY', 00H
	ORG $+3
$SG70839 DB	'_EVA_CTRL_VAL1', 00H
	ORG $+1
$SG70841 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70844 DB	'_EVA_EXPR_VAL1', 00H
	ORG $+1
$SG70846 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70848 DB	'_EVA_TYPE_VAL1', 00H
	ORG $+1
$SG70849 DB	'D:\Travail\ABI\EVA\V4.0\CGI\Brunix-2016\ctrl_access.c', 00H
	ORG $+2
$SG70850 DB	'ctrl_check_cond', 00H
$SG70855 DB	'D:\Travail\ABI\EVA\V4.0\CGI\Brunix-2016\ctrl_access.c', 00H
	ORG $+2
$SG70856 DB	'ctrl_check_cond', 00H
$SG70857 DB	'_EVA_ISEMPTY', 00H
	ORG $+3
$SG70860 DB	'_EVA_COMPARE_STATIC', 00H
$SG70863 DB	'_EVA_CTRL_VAL1', 00H
	ORG $+1
$SG70865 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70868 DB	'_EVA_EXPR_VAL1', 00H
	ORG $+1
$SG70870 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70873 DB	'_EVA_COMPARE_VALUE', 00H
	ORG $+1
$SG70875 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70877 DB	'_EVA_TYPE_VAL1', 00H
	ORG $+1
$SG70878 DB	'D:\Travail\ABI\EVA\V4.0\CGI\Brunix-2016\ctrl_access.c', 00H
	ORG $+2
$SG70879 DB	'ctrl_check_cond', 00H
$SG70880 DB	'_EVA_MULTIPLE_COMPARE', 00H
	ORG $+2
$SG70881 DB	'_EVA_MODE_COMPARE', 00H
	ORG $+2
$SG70882 DB	'_EVA_TYPE_COMPARE', 00H
	ORG $+2
$SG70885 DB	'_EVA_COMPARE_VALUES', 00H
$SG70888 DB	'_EVA_CTRL_VAL1', 00H
	ORG $+1
$SG70890 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70893 DB	'_EVA_EXPR_VAL1', 00H
	ORG $+1
$SG70895 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70898 DB	'_EVA_CTRL_VAL2', 00H
	ORG $+1
$SG70900 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70903 DB	'_EVA_EXPR_VAL2', 00H
	ORG $+1
$SG70905 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70908 DB	'_EVA_TYPE_VAL1', 00H
	ORG $+1
$SG70909 DB	'_EVA_TYPE_VAL2', 00H
	ORG $+1
$SG70910 DB	'D:\Travail\ABI\EVA\V4.0\CGI\Brunix-2016\ctrl_access.c', 00H
	ORG $+2
$SG70911 DB	'ctrl_check_cond', 00H
$SG70912 DB	'_EVA_MULTIPLE_COMPARE', 00H
	ORG $+2
$SG70913 DB	'_EVA_MODE_COMPARE', 00H
	ORG $+2
$SG70914 DB	'_EVA_TYPE_COMPARE', 00H
	ORG $+2
$SG70916 DB	'_EVA_ALWAYS', 00H
$SG70917 DB	'_EVA_NEWOBJ', 00H
$SG70918 DB	'_EVA_EXISTOBJ', 00H
	ORG $+2
$SG70919 DB	'_EVA_USERIDENT', 00H
	ORG $+1
$SG70920 DB	'_EVA_USERUNKNOWN', 00H
	ORG $+3
$SG70921 DB	'_EVA_FORMEDIT', 00H
	ORG $+2
$SG70922 DB	'_EVA_FORMDISPLAY', 00H
	ORG $+3
$SG70923 DB	'D:\Travail\ABI\EVA\V4.0\CGI\Brunix-2016\ctrl_access.c', 00H
	ORG $+2
$SG70924 DB	'ctrl_check_cond', 00H
$SG70926 DB	'D:\Travail\ABI\EVA\V4.0\CGI\Brunix-2016\ctrl_access.c', 00H
	ORG $+2
$SG70927 DB	'ctrl_check_cond', 00H
_DATA	ENDS
_TEXT	SEGMENT
_cntxt$ = 8
_res$ = 12
_idcond$ = 16
_altdata$ = 20
_form$ = -24
_data$ = -116
_obj$ = -168
_expr$ = -96
_val$ = -20
_obj1$ = -52
_expr1$ = -76
_val1$ = -148
_idobj$ = -32
_buf$ = -28
_i$ = -124
_j$ = -128
_typ$ = -120
_b_edit$ = -56
_c$70779 = -172
_ctrl_check_cond PROC NEAR

; 560  : ){

	push	ebp
	mov	ebp, esp
	sub	esp, 192				; 000000c0H
	push	ebx
	push	esi

; 561  : 	EVA_form *form = cntxt->form;

	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	ecx, DWORD PTR [eax+80]
	mov	DWORD PTR _form$[ebp], ecx

; 562  : 	DynTable data = { 0 };

	mov	DWORD PTR _data$[ebp], 0
	xor	edx, edx
	mov	DWORD PTR _data$[ebp+4], edx
	mov	DWORD PTR _data$[ebp+8], edx
	mov	DWORD PTR _data$[ebp+12], edx
	mov	DWORD PTR _data$[ebp+16], edx

; 563  : 	DynTable obj = { 0 };

	mov	DWORD PTR _obj$[ebp], 0
	xor	eax, eax
	mov	DWORD PTR _obj$[ebp+4], eax
	mov	DWORD PTR _obj$[ebp+8], eax
	mov	DWORD PTR _obj$[ebp+12], eax
	mov	DWORD PTR _obj$[ebp+16], eax

; 564  : 	DynTable expr = { 0 };

	mov	DWORD PTR _expr$[ebp], 0
	xor	ecx, ecx
	mov	DWORD PTR _expr$[ebp+4], ecx
	mov	DWORD PTR _expr$[ebp+8], ecx
	mov	DWORD PTR _expr$[ebp+12], ecx
	mov	DWORD PTR _expr$[ebp+16], ecx

; 565  : 	DynTable val = { 0 };

	mov	DWORD PTR _val$[ebp], 0
	xor	edx, edx
	mov	DWORD PTR _val$[ebp+4], edx
	mov	DWORD PTR _val$[ebp+8], edx
	mov	DWORD PTR _val$[ebp+12], edx
	mov	DWORD PTR _val$[ebp+16], edx

; 566  : 	DynTable obj1 = { 0 };

	mov	DWORD PTR _obj1$[ebp], 0
	xor	eax, eax
	mov	DWORD PTR _obj1$[ebp+4], eax
	mov	DWORD PTR _obj1$[ebp+8], eax
	mov	DWORD PTR _obj1$[ebp+12], eax
	mov	DWORD PTR _obj1$[ebp+16], eax

; 567  : 	DynTable expr1 = { 0 };

	mov	DWORD PTR _expr1$[ebp], 0
	xor	ecx, ecx
	mov	DWORD PTR _expr1$[ebp+4], ecx
	mov	DWORD PTR _expr1$[ebp+8], ecx
	mov	DWORD PTR _expr1$[ebp+12], ecx
	mov	DWORD PTR _expr1$[ebp+16], ecx

; 568  : 	DynTable val1 = { 0 };

	mov	DWORD PTR _val1$[ebp], 0
	xor	edx, edx
	mov	DWORD PTR _val1$[ebp+4], edx
	mov	DWORD PTR _val1$[ebp+8], edx
	mov	DWORD PTR _val1$[ebp+12], edx
	mov	DWORD PTR _val1$[ebp+16], edx

; 569  : 	DynTable *idobj = idcond ? &obj : altdata;

	cmp	DWORD PTR _idcond$[ebp], 0
	je	SHORT $L71191
	lea	eax, DWORD PTR _obj$[ebp]
	mov	DWORD PTR -176+[ebp], eax
	jmp	SHORT $L71192
$L71191:
	mov	ecx, DWORD PTR _altdata$[ebp]
	mov	DWORD PTR -176+[ebp], ecx
$L71192:
	mov	edx, DWORD PTR -176+[ebp]
	mov	DWORD PTR _idobj$[ebp], edx

; 570  : 	DynBuffer *buf = NULL;

	mov	DWORD PTR _buf$[ebp], 0

; 571  : 	unsigned long i, j;
; 572  : 	char *typ = "";

	mov	DWORD PTR _typ$[ebp], OFFSET FLAT:$SG70757

; 573  : 	int b_edit = form->prevstep == HtmlEdit || form->prevstep == HtmlSaveDlg || form->nextstep == HtmlEdit;

	mov	eax, DWORD PTR _form$[ebp]
	cmp	DWORD PTR [eax+168], 4
	je	SHORT $L71193
	mov	ecx, DWORD PTR _form$[ebp]
	cmp	DWORD PTR [ecx+168], 3
	je	SHORT $L71193
	mov	edx, DWORD PTR _form$[ebp]
	cmp	DWORD PTR [edx+172], 4
	je	SHORT $L71193
	mov	DWORD PTR -180+[ebp], 0
	jmp	SHORT $L71194
$L71193:
	mov	DWORD PTR -180+[ebp], 1
$L71194:
	mov	eax, DWORD PTR -180+[ebp]
	mov	DWORD PTR _b_edit$[ebp], eax

; 574  : 
; 575  : 	/* Initialize */
; 576  : 	*res = 0;

	mov	ecx, DWORD PTR _res$[ebp]
	mov	DWORD PTR [ecx], 0

; 577  : 
; 578  : 	/* Read condition definition */
; 579  : 	if(idcond)

	cmp	DWORD PTR _idcond$[ebp], 0
	je	SHORT $L70759

; 581  : 		if(qry_cache_idobj(&data, idcond)) STACK_ERROR;

	push	3
	push	0
	mov	edx, DWORD PTR _idcond$[ebp]
	push	edx
	lea	eax, DWORD PTR _data$[ebp]
	push	eax
	mov	ecx, DWORD PTR _cntxt$[ebp]
	push	ecx
	call	_qry_cache_idobj_field
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L70761
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 581		; 00000245H
	jmp	$eva_err$70762
$L70761:

; 582  : 		typ = DYNTAB_FIELD_VAL(&data, TYPE_COND);

	push	0
	push	-1
	push	OFFSET FLAT:$SG70763
	lea	eax, DWORD PTR _data$[ebp]
	push	eax
	call	_dyntab_field_val
	add	esp, 16					; 00000010H
	mov	DWORD PTR _typ$[ebp], eax

; 584  : 	else if(altdata && altdata->cell && altdata->cell->field)

	jmp	SHORT $L70765
$L70759:
	cmp	DWORD PTR _altdata$[ebp], 0
	je	SHORT $L70765
	mov	ecx, DWORD PTR _altdata$[ebp]
	cmp	DWORD PTR [ecx+16], 0
	je	SHORT $L70765
	mov	edx, DWORD PTR _altdata$[ebp]
	mov	eax, DWORD PTR [edx+16]
	cmp	DWORD PTR [eax+8], 0
	je	SHORT $L70765

; 585  : 		typ = altdata->cell->field;

	mov	ecx, DWORD PTR _altdata$[ebp]
	mov	edx, DWORD PTR [ecx+16]
	mov	eax, DWORD PTR [edx+8]
	mov	DWORD PTR _typ$[ebp], eax
$L70765:

; 586  : 
; 587  : 	/* Check condition type */
; 588  : 	if(!strcmp(typ, "_EVA_USERINGROUP") || !strcmp(typ, "_EVA_USERNOTINGROUP"))

	push	OFFSET FLAT:$SG70768
	mov	ecx, DWORD PTR _typ$[ebp]
	push	ecx
	call	_strcmp
	add	esp, 8
	test	eax, eax
	je	SHORT $L70767
	push	OFFSET FLAT:$SG70769
	mov	edx, DWORD PTR _typ$[ebp]
	push	edx
	call	_strcmp
	add	esp, 8
	test	eax, eax
	jne	$L70766
$L70767:

; 590  : 		/* Check user group */
; 591  : 		if(idcond) DYNTAB_FIELD(&obj, &data, USERGROUP_COND);

	cmp	DWORD PTR _idcond$[ebp], 0
	je	SHORT $L70772
	lea	eax, DWORD PTR _obj$[ebp]
	push	eax
	call	_dyntab_free
	add	esp, 4
	push	0
	push	-1
	push	OFFSET FLAT:$SG70773
	lea	ecx, DWORD PTR _data$[ebp]
	push	ecx
	push	0
	lea	edx, DWORD PTR _obj$[ebp]
	push	edx
	call	_dyntab_filter_field
	add	esp, 24					; 00000018H
	test	eax, eax
	je	SHORT $L70772
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29872], OFFSET FLAT:$SG70775
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 591		; 0000024fH
	jmp	$eva_err$70762
$L70772:

; 592  : 		for(i = 0; i < idobj->nbrows; i++)

	mov	DWORD PTR _i$[ebp], 0
	jmp	SHORT $L70776
$L70777:
	mov	edx, DWORD PTR _i$[ebp]
	add	edx, 1
	mov	DWORD PTR _i$[ebp], edx
$L70776:
	mov	eax, DWORD PTR _idobj$[ebp]
	mov	ecx, DWORD PTR _i$[ebp]
	cmp	ecx, DWORD PTR [eax]
	jae	SHORT $L70778

; 594  : 			/* Search selected group in user groups */
; 595  : 			DynTableCell *c = dyntab_cell(idobj, i, 0);

	push	0
	mov	edx, DWORD PTR _i$[ebp]
	push	edx
	mov	eax, DWORD PTR _idobj$[ebp]
	push	eax
	call	_dyntab_cell
	add	esp, 12					; 0000000cH
	mov	DWORD PTR _c$70779[ebp], eax

; 596  : 			for(j = 0; j < cntxt->user_groups.nbrows && dyntab_txt_cmp(c->txt, c->len, &cntxt->user_groups, j, 0); j++);

	mov	DWORD PTR _j$[ebp], 0
	jmp	SHORT $L70780
$L70781:
	mov	ecx, DWORD PTR _j$[ebp]
	add	ecx, 1
	mov	DWORD PTR _j$[ebp], ecx
$L70780:
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	eax, DWORD PTR _j$[ebp]
	cmp	eax, DWORD PTR [edx+29448]
	jae	SHORT $L70782
	push	0
	mov	ecx, DWORD PTR _j$[ebp]
	push	ecx
	mov	edx, DWORD PTR _cntxt$[ebp]
	add	edx, 29448				; 00007308H
	push	edx
	mov	eax, DWORD PTR _c$70779[ebp]
	mov	ecx, DWORD PTR [eax+4]
	push	ecx
	mov	edx, DWORD PTR _c$70779[ebp]
	mov	eax, DWORD PTR [edx]
	push	eax
	call	_dyntab_txt_cmp
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L70782
	jmp	SHORT $L70781
$L70782:

; 597  : 			if(j < cntxt->user_groups.nbrows) break;

	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	edx, DWORD PTR _j$[ebp]
	cmp	edx, DWORD PTR [ecx+29448]
	jae	SHORT $L70783
	jmp	SHORT $L70778
$L70783:

; 598  : 		}

	jmp	$L70777
$L70778:

; 599  : 		/* Matched if INGROUP and found or NOTINGROUP and not found */
; 600  : 		*res = !strcmp(typ, "_EVA_USERINGROUP") ^ (i == idobj->nbrows);

	push	OFFSET FLAT:$SG70784
	mov	eax, DWORD PTR _typ$[ebp]
	push	eax
	call	_strcmp
	add	esp, 8
	neg	eax
	sbb	eax, eax
	inc	eax
	mov	ecx, DWORD PTR _idobj$[ebp]
	mov	edx, DWORD PTR _i$[ebp]
	xor	ebx, ebx
	cmp	edx, DWORD PTR [ecx]
	sete	bl
	xor	eax, ebx
	mov	ecx, DWORD PTR _res$[ebp]
	mov	DWORD PTR [ecx], eax

; 602  : 	else if(!strcmp(typ, "_EVA_CURCONDTRUE") || !strcmp(typ, "_EVA_CURCONDFALSE"))

	jmp	$eva_noerr$70805
$L70766:
	push	OFFSET FLAT:$SG70788
	mov	edx, DWORD PTR _typ$[ebp]
	push	edx
	call	_strcmp
	add	esp, 8
	test	eax, eax
	je	SHORT $L70787
	push	OFFSET FLAT:$SG70789
	mov	eax, DWORD PTR _typ$[ebp]
	push	eax
	call	_strcmp
	add	esp, 8
	test	eax, eax
	jne	$L70786
$L70787:

; 604  : 		/* Check condition on current object */
; 605  : 		if(idcond) DYNTAB_FIELD(&obj, &data, FILTER_CONDSEQ);

	cmp	DWORD PTR _idcond$[ebp], 0
	je	SHORT $L70792
	lea	ecx, DWORD PTR _obj$[ebp]
	push	ecx
	call	_dyntab_free
	add	esp, 4
	push	0
	push	-1
	push	OFFSET FLAT:$SG70793
	lea	edx, DWORD PTR _data$[ebp]
	push	edx
	push	0
	lea	eax, DWORD PTR _obj$[ebp]
	push	eax
	call	_dyntab_filter_field
	add	esp, 24					; 00000018H
	test	eax, eax
	je	SHORT $L70792
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29872], OFFSET FLAT:$SG70795
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 605		; 0000025dH
	jmp	$eva_err$70762
$L70792:

; 606  : 		DYNBUF_ADD_STR(&buf, "=");

	push	0
	push	0
	push	1
	push	OFFSET FLAT:$SG70798
	lea	eax, DWORD PTR _buf$[ebp]
	push	eax
	call	_dynbuf_add
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L70797
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29872], OFFSET FLAT:$SG70800
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 606		; 0000025eH
	jmp	$eva_err$70762
$L70797:

; 607  : 		if(idobj->nbrows && qry_filterlist_to_sql(cntxt, &buf, idobj, "AND")) CLEAR_ERROR_RETURN;

	mov	eax, DWORD PTR _idobj$[ebp]
	cmp	DWORD PTR [eax], 0
	je	SHORT $L70801
	push	OFFSET FLAT:$SG70802
	mov	ecx, DWORD PTR _idobj$[ebp]
	push	ecx
	lea	edx, DWORD PTR _buf$[ebp]
	push	edx
	mov	eax, DWORD PTR _cntxt$[ebp]
	push	eax
	call	_qry_filterlist_to_sql
	add	esp, 16					; 00000010H
	test	eax, eax
	je	SHORT $L70801
	push	607					; 0000025fH
	push	OFFSET FLAT:$SG70803
	push	OFFSET FLAT:$SG70804
	mov	ecx, DWORD PTR _cntxt$[ebp]
	push	ecx
	call	_err_clear
	add	esp, 16					; 00000010H
	jmp	$eva_noerr$70805
$L70801:

; 608  : 		if(buf && form_eval_fieldexpr(cntxt, &obj, DYNTAB_TOUL(&form->id_form), DYNTAB_TOUL(&form->id_obj), DYNBUF_VAL_SZ(buf), NULL, 0)) CLEAR_ERROR_RETURN;

	cmp	DWORD PTR _buf$[ebp], 0
	je	$L70810
	cmp	DWORD PTR _buf$[ebp], 0
	je	SHORT $L71195
	mov	edx, DWORD PTR _buf$[ebp]
	mov	eax, DWORD PTR [edx+4]
	mov	DWORD PTR -184+[ebp], eax
	jmp	SHORT $L71196
$L71195:
	mov	DWORD PTR -184+[ebp], 0
$L71196:
	cmp	DWORD PTR _buf$[ebp], 0
	je	SHORT $L71197
	mov	ecx, DWORD PTR _buf$[ebp]
	add	ecx, 8
	mov	DWORD PTR -188+[ebp], ecx
	jmp	SHORT $L71198
$L71197:
	mov	DWORD PTR -188+[ebp], 0
$L71198:
	push	0
	push	0
	mov	edx, DWORD PTR -184+[ebp]
	push	edx
	mov	eax, DWORD PTR -188+[ebp]
	push	eax
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
	lea	eax, DWORD PTR _obj$[ebp]
	push	eax
	mov	ecx, DWORD PTR _cntxt$[ebp]
	push	ecx
	call	_form_eval_fieldexpr
	add	esp, 32					; 00000020H
	test	eax, eax
	je	SHORT $L70810
	push	608					; 00000260H
	push	OFFSET FLAT:$SG70811
	push	OFFSET FLAT:$SG70812
	mov	edx, DWORD PTR _cntxt$[ebp]
	push	edx
	call	_err_clear
	add	esp, 16					; 00000010H
	jmp	$eva_noerr$70805
$L70810:

; 609  : 
; 610  : 		/* Matched if CONDTRUE and 1 or CONDFALSE and not 1 */
; 611  : 		*res = !strcmp(typ, "_EVA_CURCONDTRUE") ^ (strcmp(dyntab_val(&obj, 0, 0), "1") != 0);

	push	OFFSET FLAT:$SG70813
	mov	eax, DWORD PTR _typ$[ebp]
	push	eax
	call	_strcmp
	add	esp, 8
	mov	esi, eax
	neg	esi
	sbb	esi, esi
	inc	esi
	push	OFFSET FLAT:$SG70814
	push	0
	push	0
	lea	ecx, DWORD PTR _obj$[ebp]
	push	ecx
	call	_dyntab_val
	add	esp, 12					; 0000000cH
	push	eax
	call	_strcmp
	add	esp, 8
	neg	eax
	sbb	eax, eax
	neg	eax
	xor	esi, eax
	mov	edx, DWORD PTR _res$[ebp]
	mov	DWORD PTR [edx], esi

; 613  : 	else if(!strcmp(typ, "_EVA_CONDTRUE") || !strcmp(typ, "_EVA_CONDFALSE"))

	jmp	$eva_noerr$70805
$L70786:
	push	OFFSET FLAT:$SG70818
	mov	eax, DWORD PTR _typ$[ebp]
	push	eax
	call	_strcmp
	add	esp, 8
	test	eax, eax
	je	SHORT $L70817
	push	OFFSET FLAT:$SG70819
	mov	ecx, DWORD PTR _typ$[ebp]
	push	ecx
	call	_strcmp
	add	esp, 8
	test	eax, eax
	jne	$L70816
$L70817:

; 615  : 		/* Check condition on all objects */
; 616  : 		DYNTAB_FIELD(&obj, &data, FILTER_CONDSEQ);

	lea	edx, DWORD PTR _obj$[ebp]
	push	edx
	call	_dyntab_free
	add	esp, 4
	push	0
	push	-1
	push	OFFSET FLAT:$SG70822
	lea	eax, DWORD PTR _data$[ebp]
	push	eax
	push	0
	lea	ecx, DWORD PTR _obj$[ebp]
	push	ecx
	call	_dyntab_filter_field
	add	esp, 24					; 00000018H
	test	eax, eax
	je	SHORT $L70821
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29872], OFFSET FLAT:$SG70824
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 616		; 00000268H
	jmp	$eva_err$70762
$L70821:

; 617  : 		if(qry_to_listobj(cntxt, &buf, NULL, &obj)) CLEAR_ERROR_RETURN;

	lea	ecx, DWORD PTR _obj$[ebp]
	push	ecx
	push	0
	lea	edx, DWORD PTR _buf$[ebp]
	push	edx
	mov	eax, DWORD PTR _cntxt$[ebp]
	push	eax
	call	_qry_to_listobj
	add	esp, 16					; 00000010H
	test	eax, eax
	je	SHORT $L70826
	push	617					; 00000269H
	push	OFFSET FLAT:$SG70827
	push	OFFSET FLAT:$SG70828
	mov	ecx, DWORD PTR _cntxt$[ebp]
	push	ecx
	call	_err_clear
	add	esp, 16					; 00000010H
	jmp	$eva_noerr$70805
$L70826:

; 618  : 
; 619  : 		/* Matched if CONDTRUE and objects found or CONDFALSE and no objects found */
; 620  : 		*res = !strcmp(typ, "_EVA_CONDTRUE") ^ (buf == NULL);

	push	OFFSET FLAT:$SG70830
	mov	edx, DWORD PTR _typ$[ebp]
	push	edx
	call	_strcmp
	add	esp, 8
	neg	eax
	sbb	eax, eax
	inc	eax
	xor	ecx, ecx
	cmp	DWORD PTR _buf$[ebp], 0
	sete	cl
	xor	eax, ecx
	mov	edx, DWORD PTR _res$[ebp]
	mov	DWORD PTR [edx], eax

; 622  : 	else if(!strcmp(typ, "_EVA_ISNOTEMPTY") || !strcmp(typ, "_EVA_ISEMPTY"))

	jmp	$eva_noerr$70805
$L70816:
	push	OFFSET FLAT:$SG70834
	mov	eax, DWORD PTR _typ$[ebp]
	push	eax
	call	_strcmp
	add	esp, 8
	test	eax, eax
	je	SHORT $L70833
	push	OFFSET FLAT:$SG70835
	mov	ecx, DWORD PTR _typ$[ebp]
	push	ecx
	call	_strcmp
	add	esp, 8
	test	eax, eax
	jne	$L70832
$L70833:

; 624  : 		/* Check value presence */
; 625  : 		if(idcond)

	cmp	DWORD PTR _idcond$[ebp], 0
	je	$L70836

; 627  : 			DYNTAB_FIELD(&obj, &data, CTRL_VAL1);

	lea	edx, DWORD PTR _obj$[ebp]
	push	edx
	call	_dyntab_free
	add	esp, 4
	push	0
	push	-1
	push	OFFSET FLAT:$SG70839
	lea	eax, DWORD PTR _data$[ebp]
	push	eax
	push	0
	lea	ecx, DWORD PTR _obj$[ebp]
	push	ecx
	call	_dyntab_filter_field
	add	esp, 24					; 00000018H
	test	eax, eax
	je	SHORT $L70838
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29872], OFFSET FLAT:$SG70841
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 627		; 00000273H
	jmp	$eva_err$70762
$L70838:

; 628  : 			DYNTAB_FIELD(&expr, &data, EXPR_VAL1);

	lea	ecx, DWORD PTR _expr$[ebp]
	push	ecx
	call	_dyntab_free
	add	esp, 4
	push	0
	push	-1
	push	OFFSET FLAT:$SG70844
	lea	edx, DWORD PTR _data$[ebp]
	push	edx
	push	0
	lea	eax, DWORD PTR _expr$[ebp]
	push	eax
	call	_dyntab_filter_field
	add	esp, 24					; 00000018H
	test	eax, eax
	je	SHORT $L70843
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29872], OFFSET FLAT:$SG70846
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 628		; 00000274H
	jmp	$eva_err$70762
$L70843:

; 629  : 			if(qry_values(cntxt, &val, DYNTAB_FIELD_VAL(&data, TYPE_VAL1), &obj, &expr)) CLEAR_ERROR_RETURN;

	lea	eax, DWORD PTR _expr$[ebp]
	push	eax
	lea	ecx, DWORD PTR _obj$[ebp]
	push	ecx
	push	0
	push	-1
	push	OFFSET FLAT:$SG70848
	lea	edx, DWORD PTR _data$[ebp]
	push	edx
	call	_dyntab_field_val
	add	esp, 16					; 00000010H
	push	eax
	lea	eax, DWORD PTR _val$[ebp]
	push	eax
	mov	ecx, DWORD PTR _cntxt$[ebp]
	push	ecx
	call	_qry_values
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L70847
	push	629					; 00000275H
	push	OFFSET FLAT:$SG70849
	push	OFFSET FLAT:$SG70850
	mov	edx, DWORD PTR _cntxt$[ebp]
	push	edx
	call	_err_clear
	add	esp, 16					; 00000010H
	jmp	$eva_noerr$70805
$L70847:

; 631  : 		else

	jmp	SHORT $L70854
$L70836:

; 632  : 			if(qry_values(cntxt, &val, NULL, altdata, NULL)) CLEAR_ERROR_RETURN;

	push	0
	mov	eax, DWORD PTR _altdata$[ebp]
	push	eax
	push	0
	lea	ecx, DWORD PTR _val$[ebp]
	push	ecx
	mov	edx, DWORD PTR _cntxt$[ebp]
	push	edx
	call	_qry_values
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L70854
	push	632					; 00000278H
	push	OFFSET FLAT:$SG70855
	push	OFFSET FLAT:$SG70856
	mov	eax, DWORD PTR _cntxt$[ebp]
	push	eax
	call	_err_clear
	add	esp, 16					; 00000010H
	jmp	$eva_noerr$70805
$L70854:

; 633  : 
; 634  : 		/* Matched if ISEMPTY and no values or ISNOTEMPTY and values */
; 635  : 		*res = !strcmp(typ, "_EVA_ISEMPTY") ^ (val.nbrows != 0);

	push	OFFSET FLAT:$SG70857
	mov	ecx, DWORD PTR _typ$[ebp]
	push	ecx
	call	_strcmp
	add	esp, 8
	neg	eax
	sbb	eax, eax
	inc	eax
	xor	edx, edx
	cmp	DWORD PTR _val$[ebp], 0
	setne	dl
	xor	eax, edx
	mov	ecx, DWORD PTR _res$[ebp]
	mov	DWORD PTR [ecx], eax

; 637  : 	else if(!strcmp(typ, "_EVA_COMPARE_STATIC"))

	jmp	$eva_noerr$70805
$L70832:
	push	OFFSET FLAT:$SG70860
	mov	edx, DWORD PTR _typ$[ebp]
	push	edx
	call	_strcmp
	add	esp, 8
	test	eax, eax
	jne	$L70859

; 639  : 		/* Compare values with fixed values */
; 640  : 		DYNTAB_FIELD(&obj1, &data, CTRL_VAL1);

	lea	eax, DWORD PTR _obj1$[ebp]
	push	eax
	call	_dyntab_free
	add	esp, 4
	push	0
	push	-1
	push	OFFSET FLAT:$SG70863
	lea	ecx, DWORD PTR _data$[ebp]
	push	ecx
	push	0
	lea	edx, DWORD PTR _obj1$[ebp]
	push	edx
	call	_dyntab_filter_field
	add	esp, 24					; 00000018H
	test	eax, eax
	je	SHORT $L70862
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29872], OFFSET FLAT:$SG70865
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 640		; 00000280H
	jmp	$eva_err$70762
$L70862:

; 641  : 		DYNTAB_FIELD(&expr1, &data, EXPR_VAL1);

	lea	edx, DWORD PTR _expr1$[ebp]
	push	edx
	call	_dyntab_free
	add	esp, 4
	push	0
	push	-1
	push	OFFSET FLAT:$SG70868
	lea	eax, DWORD PTR _data$[ebp]
	push	eax
	push	0
	lea	ecx, DWORD PTR _expr1$[ebp]
	push	ecx
	call	_dyntab_filter_field
	add	esp, 24					; 00000018H
	test	eax, eax
	je	SHORT $L70867
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29872], OFFSET FLAT:$SG70870
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 641		; 00000281H
	jmp	$eva_err$70762
$L70867:

; 642  : 		DYNTAB_FIELD(&val, &data, COMPARE_VALUE);

	lea	ecx, DWORD PTR _val$[ebp]
	push	ecx
	call	_dyntab_free
	add	esp, 4
	push	0
	push	-1
	push	OFFSET FLAT:$SG70873
	lea	edx, DWORD PTR _data$[ebp]
	push	edx
	push	0
	lea	eax, DWORD PTR _val$[ebp]
	push	eax
	call	_dyntab_filter_field
	add	esp, 24					; 00000018H
	test	eax, eax
	je	SHORT $L70872
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29872], OFFSET FLAT:$SG70875
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 642		; 00000282H
	jmp	$eva_err$70762
$L70872:

; 643  : 		if(qry_values(cntxt, &val1, DYNTAB_FIELD_VAL(&data, TYPE_VAL1), &obj1, &expr1)) CLEAR_ERROR_RETURN;

	lea	eax, DWORD PTR _expr1$[ebp]
	push	eax
	lea	ecx, DWORD PTR _obj1$[ebp]
	push	ecx
	push	0
	push	-1
	push	OFFSET FLAT:$SG70877
	lea	edx, DWORD PTR _data$[ebp]
	push	edx
	call	_dyntab_field_val
	add	esp, 16					; 00000010H
	push	eax
	lea	eax, DWORD PTR _val1$[ebp]
	push	eax
	mov	ecx, DWORD PTR _cntxt$[ebp]
	push	ecx
	call	_qry_values
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L70876
	push	643					; 00000283H
	push	OFFSET FLAT:$SG70878
	push	OFFSET FLAT:$SG70879
	mov	edx, DWORD PTR _cntxt$[ebp]
	push	edx
	call	_err_clear
	add	esp, 16					; 00000010H
	jmp	$eva_noerr$70805
$L70876:

; 644  : 
; 645  : 		/* Match if comparison succeed */
; 646  : 		*res = compare_values(cntxt, &val1, DYNTAB_FIELD_VAL(&data, TYPE_COMPARE), &val,
; 647  : 										DYNTAB_FIELD_VAL(&data, MODE_COMPARE),
; 648  : 										DYNTAB_FIELD_VAL(&data, MULTIPLE_COMPARE));

	push	0
	push	-1
	push	OFFSET FLAT:$SG70880
	lea	eax, DWORD PTR _data$[ebp]
	push	eax
	call	_dyntab_field_val
	add	esp, 16					; 00000010H
	push	eax
	push	0
	push	-1
	push	OFFSET FLAT:$SG70881
	lea	ecx, DWORD PTR _data$[ebp]
	push	ecx
	call	_dyntab_field_val
	add	esp, 16					; 00000010H
	push	eax
	lea	edx, DWORD PTR _val$[ebp]
	push	edx
	push	0
	push	-1
	push	OFFSET FLAT:$SG70882
	lea	eax, DWORD PTR _data$[ebp]
	push	eax
	call	_dyntab_field_val
	add	esp, 16					; 00000010H
	push	eax
	lea	ecx, DWORD PTR _val1$[ebp]
	push	ecx
	mov	edx, DWORD PTR _cntxt$[ebp]
	push	edx
	call	_compare_values
	add	esp, 24					; 00000018H
	mov	ecx, DWORD PTR _res$[ebp]
	mov	DWORD PTR [ecx], eax

; 650  : 	else if(!strcmp(typ, "_EVA_COMPARE_VALUES"))

	jmp	$eva_noerr$70805
$L70859:
	push	OFFSET FLAT:$SG70885
	mov	edx, DWORD PTR _typ$[ebp]
	push	edx
	call	_strcmp
	add	esp, 8
	test	eax, eax
	jne	$L70884

; 652  : 		/* Compare 2 values */
; 653  : 		DYNTAB_FIELD(&obj1, &data, CTRL_VAL1);

	lea	eax, DWORD PTR _obj1$[ebp]
	push	eax
	call	_dyntab_free
	add	esp, 4
	push	0
	push	-1
	push	OFFSET FLAT:$SG70888
	lea	ecx, DWORD PTR _data$[ebp]
	push	ecx
	push	0
	lea	edx, DWORD PTR _obj1$[ebp]
	push	edx
	call	_dyntab_filter_field
	add	esp, 24					; 00000018H
	test	eax, eax
	je	SHORT $L70887
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29872], OFFSET FLAT:$SG70890
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 653		; 0000028dH
	jmp	$eva_err$70762
$L70887:

; 654  : 		DYNTAB_FIELD(&expr1, &data, EXPR_VAL1);

	lea	edx, DWORD PTR _expr1$[ebp]
	push	edx
	call	_dyntab_free
	add	esp, 4
	push	0
	push	-1
	push	OFFSET FLAT:$SG70893
	lea	eax, DWORD PTR _data$[ebp]
	push	eax
	push	0
	lea	ecx, DWORD PTR _expr1$[ebp]
	push	ecx
	call	_dyntab_filter_field
	add	esp, 24					; 00000018H
	test	eax, eax
	je	SHORT $L70892
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29872], OFFSET FLAT:$SG70895
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 654		; 0000028eH
	jmp	$eva_err$70762
$L70892:

; 655  : 		DYNTAB_FIELD(&obj, &data, CTRL_VAL2);

	lea	ecx, DWORD PTR _obj$[ebp]
	push	ecx
	call	_dyntab_free
	add	esp, 4
	push	0
	push	-1
	push	OFFSET FLAT:$SG70898
	lea	edx, DWORD PTR _data$[ebp]
	push	edx
	push	0
	lea	eax, DWORD PTR _obj$[ebp]
	push	eax
	call	_dyntab_filter_field
	add	esp, 24					; 00000018H
	test	eax, eax
	je	SHORT $L70897
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29872], OFFSET FLAT:$SG70900
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 655		; 0000028fH
	jmp	$eva_err$70762
$L70897:

; 656  : 		DYNTAB_FIELD(&expr, &data, EXPR_VAL2);

	lea	eax, DWORD PTR _expr$[ebp]
	push	eax
	call	_dyntab_free
	add	esp, 4
	push	0
	push	-1
	push	OFFSET FLAT:$SG70903
	lea	ecx, DWORD PTR _data$[ebp]
	push	ecx
	push	0
	lea	edx, DWORD PTR _expr$[ebp]
	push	edx
	call	_dyntab_filter_field
	add	esp, 24					; 00000018H
	test	eax, eax
	je	SHORT $L70902
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29872], OFFSET FLAT:$SG70905
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 656		; 00000290H
	jmp	$eva_err$70762
$L70902:

; 657  : 		if(qry_values(cntxt, &val1, DYNTAB_FIELD_VAL(&data, TYPE_VAL1), &obj1, &expr1) ||
; 658  : 			qry_values(cntxt, &val, DYNTAB_FIELD_VAL(&data, TYPE_VAL2), &obj, &expr)) CLEAR_ERROR_RETURN;

	lea	edx, DWORD PTR _expr1$[ebp]
	push	edx
	lea	eax, DWORD PTR _obj1$[ebp]
	push	eax
	push	0
	push	-1
	push	OFFSET FLAT:$SG70908
	lea	ecx, DWORD PTR _data$[ebp]
	push	ecx
	call	_dyntab_field_val
	add	esp, 16					; 00000010H
	push	eax
	lea	edx, DWORD PTR _val1$[ebp]
	push	edx
	mov	eax, DWORD PTR _cntxt$[ebp]
	push	eax
	call	_qry_values
	add	esp, 20					; 00000014H
	test	eax, eax
	jne	SHORT $L70907
	lea	ecx, DWORD PTR _expr$[ebp]
	push	ecx
	lea	edx, DWORD PTR _obj$[ebp]
	push	edx
	push	0
	push	-1
	push	OFFSET FLAT:$SG70909
	lea	eax, DWORD PTR _data$[ebp]
	push	eax
	call	_dyntab_field_val
	add	esp, 16					; 00000010H
	push	eax
	lea	ecx, DWORD PTR _val$[ebp]
	push	ecx
	mov	edx, DWORD PTR _cntxt$[ebp]
	push	edx
	call	_qry_values
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L70906
$L70907:
	push	658					; 00000292H
	push	OFFSET FLAT:$SG70910
	push	OFFSET FLAT:$SG70911
	mov	eax, DWORD PTR _cntxt$[ebp]
	push	eax
	call	_err_clear
	add	esp, 16					; 00000010H
	jmp	$eva_noerr$70805
$L70906:

; 659  : 
; 660  : 		/* Match if comparison succeed */
; 661  : 		*res = compare_values(cntxt, &val1, DYNTAB_FIELD_VAL(&data, TYPE_COMPARE), &val,
; 662  : 										DYNTAB_FIELD_VAL(&data, MODE_COMPARE),
; 663  : 										DYNTAB_FIELD_VAL(&data, MULTIPLE_COMPARE));

	push	0
	push	-1
	push	OFFSET FLAT:$SG70912
	lea	ecx, DWORD PTR _data$[ebp]
	push	ecx
	call	_dyntab_field_val
	add	esp, 16					; 00000010H
	push	eax
	push	0
	push	-1
	push	OFFSET FLAT:$SG70913
	lea	edx, DWORD PTR _data$[ebp]
	push	edx
	call	_dyntab_field_val
	add	esp, 16					; 00000010H
	push	eax
	lea	eax, DWORD PTR _val$[ebp]
	push	eax
	push	0
	push	-1
	push	OFFSET FLAT:$SG70914
	lea	ecx, DWORD PTR _data$[ebp]
	push	ecx
	call	_dyntab_field_val
	add	esp, 16					; 00000010H
	push	eax
	lea	edx, DWORD PTR _val1$[ebp]
	push	edx
	mov	eax, DWORD PTR _cntxt$[ebp]
	push	eax
	call	_compare_values
	add	esp, 24					; 00000018H
	mov	ecx, DWORD PTR _res$[ebp]
	mov	DWORD PTR [ecx], eax

; 665  : 	else

	jmp	$eva_noerr$70805
$L70884:

; 666  : 		/* Check other condition */
; 667  : 		*res =
; 668  : 			/* Empty or always true */
; 669  : 			!*typ || !strcmp(typ, "_EVA_ALWAYS") ||
; 670  : 			/* New object */
; 671  : 			(!strcmp(typ, "_EVA_NEWOBJ") && !dyntab_sz(&form->id_obj, 0, 0)) ||
; 672  : 			/* Existing object */
; 673  : 			(!strcmp(typ, "_EVA_EXISTOBJ") && dyntab_sz(&form->id_obj, 0, 0)) ||
; 674  : 			/* User identified */
; 675  : 			(!strcmp(typ, "_EVA_USERIDENT") && cntxt->b_identified) ||
; 676  : 			/* User not identified */
; 677  : 			(!strcmp(typ, "_EVA_USERUNKNOWN") && !cntxt->b_identified) ||
; 678  : 			/* Form in edit mode */
; 679  : 			(!strcmp(typ, "_EVA_FORMEDIT") && b_edit) ||
; 680  : 			/* Form in display mode */
; 681  : 			(!strcmp(typ, "_EVA_FORMDISPLAY") && !b_edit);

	mov	edx, DWORD PTR _typ$[ebp]
	movsx	eax, BYTE PTR [edx]
	test	eax, eax
	je	$L71199
	push	OFFSET FLAT:$SG70916
	mov	ecx, DWORD PTR _typ$[ebp]
	push	ecx
	call	_strcmp
	add	esp, 8
	test	eax, eax
	je	$L71199
	push	OFFSET FLAT:$SG70917
	mov	edx, DWORD PTR _typ$[ebp]
	push	edx
	call	_strcmp
	add	esp, 8
	test	eax, eax
	jne	SHORT $L71200
	push	0
	push	0
	mov	eax, DWORD PTR _form$[ebp]
	add	eax, 32					; 00000020H
	push	eax
	call	_dyntab_sz
	add	esp, 12					; 0000000cH
	test	eax, eax
	je	$L71199
$L71200:
	push	OFFSET FLAT:$SG70918
	mov	ecx, DWORD PTR _typ$[ebp]
	push	ecx
	call	_strcmp
	add	esp, 8
	test	eax, eax
	jne	SHORT $L71201
	push	0
	push	0
	mov	edx, DWORD PTR _form$[ebp]
	add	edx, 32					; 00000020H
	push	edx
	call	_dyntab_sz
	add	esp, 12					; 0000000cH
	test	eax, eax
	jne	$L71199
$L71201:
	push	OFFSET FLAT:$SG70919
	mov	eax, DWORD PTR _typ$[ebp]
	push	eax
	call	_strcmp
	add	esp, 8
	test	eax, eax
	jne	SHORT $L71202
	mov	ecx, DWORD PTR _cntxt$[ebp]
	cmp	DWORD PTR [ecx+29400], 0
	jne	SHORT $L71199
$L71202:
	push	OFFSET FLAT:$SG70920
	mov	edx, DWORD PTR _typ$[ebp]
	push	edx
	call	_strcmp
	add	esp, 8
	test	eax, eax
	jne	SHORT $L71203
	mov	eax, DWORD PTR _cntxt$[ebp]
	cmp	DWORD PTR [eax+29400], 0
	je	SHORT $L71199
$L71203:
	push	OFFSET FLAT:$SG70921
	mov	ecx, DWORD PTR _typ$[ebp]
	push	ecx
	call	_strcmp
	add	esp, 8
	test	eax, eax
	jne	SHORT $L71204
	cmp	DWORD PTR _b_edit$[ebp], 0
	jne	SHORT $L71199
$L71204:
	push	OFFSET FLAT:$SG70922
	mov	edx, DWORD PTR _typ$[ebp]
	push	edx
	call	_strcmp
	add	esp, 8
	test	eax, eax
	jne	SHORT $L71205
	cmp	DWORD PTR _b_edit$[ebp], 0
	je	SHORT $L71199
$L71205:
	mov	DWORD PTR -192+[ebp], 0
	jmp	SHORT $L71206
$L71199:
	mov	DWORD PTR -192+[ebp], 1
$L71206:
	mov	eax, DWORD PTR _res$[ebp]
	mov	ecx, DWORD PTR -192+[ebp]
	mov	DWORD PTR [eax], ecx
$eva_noerr$70805:

; 682  : 
; 683  : 	RETURN_OK_CLEANUP;

	push	0
	push	OFFSET FLAT:$SG70923
	push	OFFSET FLAT:$SG70924
	mov	edx, DWORD PTR _cntxt$[ebp]
	push	edx
	call	_err_clear
	add	esp, 16					; 00000010H
$eva_err$70762:
	mov	eax, DWORD PTR _cntxt$[ebp]
	cmp	DWORD PTR [eax+29872], 0
	je	SHORT $L70925
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	edx, DWORD PTR [ecx+29900]
	push	edx
	push	OFFSET FLAT:$SG70926
	push	OFFSET FLAT:$SG70927
	mov	eax, DWORD PTR _cntxt$[ebp]
	push	eax
	call	_err_add_context
	add	esp, 16					; 00000010H
$L70925:
	lea	ecx, DWORD PTR _data$[ebp]
	push	ecx
	call	_dyntab_free
	add	esp, 4
	lea	edx, DWORD PTR _obj$[ebp]
	push	edx
	call	_dyntab_free
	add	esp, 4
	lea	eax, DWORD PTR _expr$[ebp]
	push	eax
	call	_dyntab_free
	add	esp, 4
	lea	ecx, DWORD PTR _val$[ebp]
	push	ecx
	call	_dyntab_free
	add	esp, 4
	lea	edx, DWORD PTR _obj1$[ebp]
	push	edx
	call	_dyntab_free
	add	esp, 4
	lea	eax, DWORD PTR _expr1$[ebp]
	push	eax
	call	_dyntab_free
	add	esp, 4
	lea	ecx, DWORD PTR _val1$[ebp]
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

; 684  : }

	pop	esi
	pop	ebx
	mov	esp, ebp
	pop	ebp
	ret	0
_ctrl_check_cond ENDP
_TEXT	ENDS
PUBLIC	_ctrl_check_condlist
EXTRN	_dynbuf_add_int:NEAR
EXTRN	_dynbuf_add3_int:NEAR
EXTRN	_dyntab_field_cell:NEAR
_DATA	SEGMENT
$SG70961 DB	'_EVA_TYPE_COND', 00H
	ORG $+1
$SG70962 DB	'_EVA_CONTROL', 00H
	ORG $+3
$SG70963 DB	'_EVA_FILTER_TYPE', 00H
	ORG $+3
$SG70966 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70968 DB	'_EVA_USERINGROUP', 00H
	ORG $+3
$SG70971 DB	'_EVA_ISNOTEMPTY', 00H
$SG70981 DB	'_EVA_CURCONDTRUE', 00H
	ORG $+3
$SG70985 DB	' res=', 00H
	ORG $+2
$SG70986 DB	0aH, '*** Access - line ', 00H
$SG70988 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70991 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70993 DB	'D:\Travail\ABI\EVA\V4.0\CGI\Brunix-2016\ctrl_access.c', 00H
	ORG $+2
$SG70994 DB	'ctrl_check_condlist', 00H
$SG70996 DB	'D:\Travail\ABI\EVA\V4.0\CGI\Brunix-2016\ctrl_access.c', 00H
	ORG $+2
$SG70997 DB	'ctrl_check_condlist', 00H
_DATA	ENDS
_TEXT	SEGMENT
_cntxt$ = 8
_res$ = 12
_cond$ = 16
_line$ = 20
_data$ = -28
_conds$ = -76
_groups$ = -96
_filters$ = -52
_controls$ = -116
_tab$ = -32
_sql$ = -8
_i$ = -56
_nb$ = -4
_r$70953 = -120
_c$70954 = -124
_idcond$70955 = -128
_ctrl_check_condlist PROC NEAR

; 705  : ){

	push	ebp
	mov	ebp, esp
	sub	esp, 148				; 00000094H

; 706  : 	DynTable data = { 0 };

	mov	DWORD PTR _data$[ebp], 0
	xor	eax, eax
	mov	DWORD PTR _data$[ebp+4], eax
	mov	DWORD PTR _data$[ebp+8], eax
	mov	DWORD PTR _data$[ebp+12], eax
	mov	DWORD PTR _data$[ebp+16], eax

; 707  : 	DynTable conds = { 0 };

	mov	DWORD PTR _conds$[ebp], 0
	xor	ecx, ecx
	mov	DWORD PTR _conds$[ebp+4], ecx
	mov	DWORD PTR _conds$[ebp+8], ecx
	mov	DWORD PTR _conds$[ebp+12], ecx
	mov	DWORD PTR _conds$[ebp+16], ecx

; 708  : 	DynTable groups = { 0 };

	mov	DWORD PTR _groups$[ebp], 0
	xor	edx, edx
	mov	DWORD PTR _groups$[ebp+4], edx
	mov	DWORD PTR _groups$[ebp+8], edx
	mov	DWORD PTR _groups$[ebp+12], edx
	mov	DWORD PTR _groups$[ebp+16], edx

; 709  : 	DynTable filters = { 0 };

	mov	DWORD PTR _filters$[ebp], 0
	xor	eax, eax
	mov	DWORD PTR _filters$[ebp+4], eax
	mov	DWORD PTR _filters$[ebp+8], eax
	mov	DWORD PTR _filters$[ebp+12], eax
	mov	DWORD PTR _filters$[ebp+16], eax

; 710  : 	DynTable controls = { 0 };

	mov	DWORD PTR _controls$[ebp], 0
	xor	ecx, ecx
	mov	DWORD PTR _controls$[ebp+4], ecx
	mov	DWORD PTR _controls$[ebp+8], ecx
	mov	DWORD PTR _controls$[ebp+12], ecx
	mov	DWORD PTR _controls$[ebp+16], ecx

; 711  : 	DynTable *tab;
; 712  : 	DynBuffer *sql = NULL;

	mov	DWORD PTR _sql$[ebp], 0

; 713  : 	unsigned long i, nb = line == ~0UL ? cond->nbrows : cond->nbcols;

	cmp	DWORD PTR _line$[ebp], -1
	jne	SHORT $L71208
	mov	edx, DWORD PTR _cond$[ebp]
	mov	eax, DWORD PTR [edx]
	mov	DWORD PTR -132+[ebp], eax
	jmp	SHORT $L71209
$L71208:
	mov	ecx, DWORD PTR _cond$[ebp]
	mov	edx, DWORD PTR [ecx+8]
	mov	DWORD PTR -132+[ebp], edx
$L71209:
	mov	eax, DWORD PTR -132+[ebp]
	mov	DWORD PTR _nb$[ebp], eax

; 714  : 
; 715  : 	/* Initialize */
; 716  : 	*res = 1;

	mov	ecx, DWORD PTR _res$[ebp]
	mov	DWORD PTR [ecx], 1

; 717  : 
; 718  : 	/* For each condition to process */
; 719  : 	for(i = 0; i < nb; i++)

	mov	DWORD PTR _i$[ebp], 0
	jmp	SHORT $L70950
$L70951:
	mov	edx, DWORD PTR _i$[ebp]
	add	edx, 1
	mov	DWORD PTR _i$[ebp], edx
$L70950:
	mov	eax, DWORD PTR _i$[ebp]
	cmp	eax, DWORD PTR _nb$[ebp]
	jae	$L70952

; 721  : 		/* Read condition type */
; 722  : 		unsigned long r = line == ~0UL ? i : line;

	cmp	DWORD PTR _line$[ebp], -1
	jne	SHORT $L71210
	mov	ecx, DWORD PTR _i$[ebp]
	mov	DWORD PTR -136+[ebp], ecx
	jmp	SHORT $L71211
$L71210:
	mov	edx, DWORD PTR _line$[ebp]
	mov	DWORD PTR -136+[ebp], edx
$L71211:
	mov	eax, DWORD PTR -136+[ebp]
	mov	DWORD PTR _r$70953[ebp], eax

; 723  : 		unsigned long c = line == ~0UL ? 0 : i;

	mov	ecx, DWORD PTR _line$[ebp]
	sub	ecx, -1
	neg	ecx
	sbb	ecx, ecx
	and	ecx, DWORD PTR _i$[ebp]
	mov	DWORD PTR _c$70954[ebp], ecx

; 724  : 		unsigned long idcond = DYNTAB_TOULRC(cond, r, c);

	push	10					; 0000000aH
	push	0
	mov	edx, DWORD PTR _c$70954[ebp]
	push	edx
	mov	eax, DWORD PTR _r$70953[ebp]
	push	eax
	mov	ecx, DWORD PTR _cond$[ebp]
	push	ecx
	call	_dyntab_val
	add	esp, 12					; 0000000cH
	push	eax
	call	_strtoul
	add	esp, 12					; 0000000cH
	mov	DWORD PTR _idcond$70955[ebp], eax

; 725  : 		if(!idcond) continue;

	cmp	DWORD PTR _idcond$70955[ebp], 0
	jne	SHORT $L70957
	jmp	SHORT $L70951
$L70957:

; 726  : 		if(qry_cache_idobj(&data, idcond)) STACK_ERROR;

	push	3
	push	0
	mov	edx, DWORD PTR _idcond$70955[ebp]
	push	edx
	lea	eax, DWORD PTR _data$[ebp]
	push	eax
	mov	ecx, DWORD PTR _cntxt$[ebp]
	push	ecx
	call	_qry_cache_idobj_field
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L70959
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 726		; 000002d6H
	jmp	$eva_err$70960
$L70959:

; 727  : 
; 728  : 		/* Split conditions, user groups & filters */
; 729  : 		tab =	DYNTAB_FIELD_CELL(&data, TYPE_COND) ? &conds :
; 730  : 				DYNTAB_FIELD_CELL(&data, CONTROL) ? &controls :
; 731  : 				DYNTAB_FIELD_CELL(&data, FILTER_TYPE) ? &filters : &groups;

	push	0
	push	-1
	push	OFFSET FLAT:$SG70961
	lea	eax, DWORD PTR _data$[ebp]
	push	eax
	call	_dyntab_field_cell
	add	esp, 16					; 00000010H
	test	eax, eax
	je	SHORT $L71216
	lea	ecx, DWORD PTR _conds$[ebp]
	mov	DWORD PTR -140+[ebp], ecx
	jmp	SHORT $L71217
$L71216:
	push	0
	push	-1
	push	OFFSET FLAT:$SG70962
	lea	edx, DWORD PTR _data$[ebp]
	push	edx
	call	_dyntab_field_cell
	add	esp, 16					; 00000010H
	test	eax, eax
	je	SHORT $L71214
	lea	eax, DWORD PTR _controls$[ebp]
	mov	DWORD PTR -144+[ebp], eax
	jmp	SHORT $L71215
$L71214:
	push	0
	push	-1
	push	OFFSET FLAT:$SG70963
	lea	ecx, DWORD PTR _data$[ebp]
	push	ecx
	call	_dyntab_field_cell
	add	esp, 16					; 00000010H
	test	eax, eax
	je	SHORT $L71212
	lea	edx, DWORD PTR _filters$[ebp]
	mov	DWORD PTR -148+[ebp], edx
	jmp	SHORT $L71213
$L71212:
	lea	eax, DWORD PTR _groups$[ebp]
	mov	DWORD PTR -148+[ebp], eax
$L71213:
	mov	ecx, DWORD PTR -148+[ebp]
	mov	DWORD PTR -144+[ebp], ecx
$L71215:
	mov	edx, DWORD PTR -144+[ebp]
	mov	DWORD PTR -140+[ebp], edx
$L71217:
	mov	eax, DWORD PTR -140+[ebp]
	mov	DWORD PTR _tab$[ebp], eax

; 732  : 		DYNTAB_ADD_CELL(tab, tab->nbrows, 0, cond, r, c);

	push	1
	mov	ecx, DWORD PTR _c$70954[ebp]
	push	ecx
	mov	edx, DWORD PTR _r$70953[ebp]
	push	edx
	mov	eax, DWORD PTR _cond$[ebp]
	push	eax
	call	_dyntab_cell
	add	esp, 12					; 0000000cH
	push	eax
	push	0
	mov	ecx, DWORD PTR _tab$[ebp]
	mov	edx, DWORD PTR [ecx]
	push	edx
	mov	eax, DWORD PTR _tab$[ebp]
	push	eax
	call	_dyntab_copy
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L70964
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29872], OFFSET FLAT:$SG70966
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 732		; 000002dcH
	jmp	$eva_err$70960
$L70964:

; 733  : 	}

	jmp	$L70951
$L70952:

; 734  : 
; 735  : 	/* Check user groups */
; 736  : 	if(groups.nbrows)

	cmp	DWORD PTR _groups$[ebp], 0
	je	SHORT $L70969

; 738  : 		groups.cell->field = "_EVA_USERINGROUP";

	mov	eax, DWORD PTR _groups$[ebp+16]
	mov	DWORD PTR [eax+8], OFFSET FLAT:$SG70968

; 739  : 		groups.cell->b_dontfreefield = 1;

	mov	ecx, DWORD PTR _groups$[ebp+16]
	mov	BYTE PTR [ecx+15], 1

; 740  : 		if(ctrl_check_cond(cntxt, res, 0, &groups)) STACK_ERROR;

	lea	edx, DWORD PTR _groups$[ebp]
	push	edx
	push	0
	mov	eax, DWORD PTR _res$[ebp]
	push	eax
	mov	ecx, DWORD PTR _cntxt$[ebp]
	push	ecx
	call	_ctrl_check_cond
	add	esp, 16					; 00000010H
	test	eax, eax
	je	SHORT $L70969
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 740		; 000002e4H
	jmp	$eva_err$70960
$L70969:

; 742  : 
; 743  : 	/* Check controls */
; 744  : 	if(*res && controls.nbrows)

	mov	eax, DWORD PTR _res$[ebp]
	cmp	DWORD PTR [eax], 0
	je	SHORT $L70972
	cmp	DWORD PTR _controls$[ebp], 0
	je	SHORT $L70972

; 746  : 		controls.cell->field = "_EVA_ISNOTEMPTY";

	mov	ecx, DWORD PTR _controls$[ebp+16]
	mov	DWORD PTR [ecx+8], OFFSET FLAT:$SG70971

; 747  : 		controls.cell->b_dontfreefield = 1;

	mov	edx, DWORD PTR _controls$[ebp+16]
	mov	BYTE PTR [edx+15], 1

; 748  : 		if(ctrl_check_cond(cntxt, res, 0, &controls)) STACK_ERROR;

	lea	eax, DWORD PTR _controls$[ebp]
	push	eax
	push	0
	mov	ecx, DWORD PTR _res$[ebp]
	push	ecx
	mov	edx, DWORD PTR _cntxt$[ebp]
	push	edx
	call	_ctrl_check_cond
	add	esp, 16					; 00000010H
	test	eax, eax
	je	SHORT $L70972
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 748		; 000002ecH
	jmp	$eva_err$70960
$L70972:

; 750  : 
; 751  : 	/* Check conditions */
; 752  : 	if(*res) for(i = 0; i < conds.nbrows && *res; i++)

	mov	ecx, DWORD PTR _res$[ebp]
	cmp	DWORD PTR [ecx], 0
	je	SHORT $L70976
	mov	DWORD PTR _i$[ebp], 0
	jmp	SHORT $L70974
$L70975:
	mov	edx, DWORD PTR _i$[ebp]
	add	edx, 1
	mov	DWORD PTR _i$[ebp], edx
$L70974:
	mov	eax, DWORD PTR _i$[ebp]
	cmp	eax, DWORD PTR _conds$[ebp]
	jae	SHORT $L70976
	mov	ecx, DWORD PTR _res$[ebp]
	cmp	DWORD PTR [ecx], 0
	je	SHORT $L70976

; 753  : 		if(ctrl_check_cond(cntxt, res, DYNTAB_TOULRC(&conds, i, 0), NULL)) STACK_ERROR;

	push	0
	push	10					; 0000000aH
	push	0
	push	0
	mov	edx, DWORD PTR _i$[ebp]
	push	edx
	lea	eax, DWORD PTR _conds$[ebp]
	push	eax
	call	_dyntab_val
	add	esp, 12					; 0000000cH
	push	eax
	call	_strtoul
	add	esp, 12					; 0000000cH
	push	eax
	mov	ecx, DWORD PTR _res$[ebp]
	push	ecx
	mov	edx, DWORD PTR _cntxt$[ebp]
	push	edx
	call	_ctrl_check_cond
	add	esp, 16					; 00000010H
	test	eax, eax
	je	SHORT $L70979
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 753		; 000002f1H
	jmp	$eva_err$70960
$L70979:
	jmp	SHORT $L70975
$L70976:

; 754  : 
; 755  : 	/* Check filters */
; 756  : 	if(*res && filters.nbrows)

	mov	ecx, DWORD PTR _res$[ebp]
	cmp	DWORD PTR [ecx], 0
	je	SHORT $L70982
	cmp	DWORD PTR _filters$[ebp], 0
	je	SHORT $L70982

; 758  : 		filters.cell->field = "_EVA_CURCONDTRUE";

	mov	edx, DWORD PTR _filters$[ebp+16]
	mov	DWORD PTR [edx+8], OFFSET FLAT:$SG70981

; 759  : 		filters.cell->b_dontfreefield = 1;

	mov	eax, DWORD PTR _filters$[ebp+16]
	mov	BYTE PTR [eax+15], 1

; 760  : 		if(ctrl_check_cond(cntxt, res, 0, &filters)) STACK_ERROR;

	lea	ecx, DWORD PTR _filters$[ebp]
	push	ecx
	push	0
	mov	edx, DWORD PTR _res$[ebp]
	push	edx
	mov	eax, DWORD PTR _cntxt$[ebp]
	push	eax
	call	_ctrl_check_cond
	add	esp, 16					; 00000010H
	test	eax, eax
	je	SHORT $L70982
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 760		; 000002f8H
	jmp	$eva_err$70960
$L70982:

; 762  : 
; 763  : 	/* Handle debug */
; 764  : 	if(cntxt->sql_trace)

	mov	edx, DWORD PTR _cntxt$[ebp]
	cmp	DWORD PTR [edx+29852], 0
	je	SHORT $L70989

; 766  : 		DYNBUF_ADD3_INT(&cntxt->debug_msg, "\n*** Access - line ", line, " res=");

	push	5
	push	OFFSET FLAT:$SG70985
	mov	eax, DWORD PTR _line$[ebp]
	push	eax
	push	19					; 00000013H
	push	OFFSET FLAT:$SG70986
	mov	ecx, DWORD PTR _cntxt$[ebp]
	add	ecx, 29864				; 000074a8H
	push	ecx
	call	_dynbuf_add3_int
	add	esp, 24					; 00000018H
	test	eax, eax
	je	SHORT $L70984
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29872], OFFSET FLAT:$SG70988
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 766		; 000002feH
	jmp	SHORT $eva_err$70960
$L70984:

; 767  : 		DYNBUF_ADD_INT(&cntxt->debug_msg, *res);

	mov	ecx, DWORD PTR _res$[ebp]
	mov	edx, DWORD PTR [ecx]
	push	edx
	mov	eax, DWORD PTR _cntxt$[ebp]
	add	eax, 29864				; 000074a8H
	push	eax
	call	_dynbuf_add_int
	add	esp, 8
	test	eax, eax
	je	SHORT $L70989
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29872], OFFSET FLAT:$SG70991
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 767		; 000002ffH
	jmp	SHORT $eva_err$70960
$L70989:
$eva_noerr$70992:

; 769  : 
; 770  : 	RETURN_OK_CLEANUP;

	push	0
	push	OFFSET FLAT:$SG70993
	push	OFFSET FLAT:$SG70994
	mov	eax, DWORD PTR _cntxt$[ebp]
	push	eax
	call	_err_clear
	add	esp, 16					; 00000010H
$eva_err$70960:
	mov	ecx, DWORD PTR _cntxt$[ebp]
	cmp	DWORD PTR [ecx+29872], 0
	je	SHORT $L70995
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	eax, DWORD PTR [edx+29900]
	push	eax
	push	OFFSET FLAT:$SG70996
	push	OFFSET FLAT:$SG70997
	mov	ecx, DWORD PTR _cntxt$[ebp]
	push	ecx
	call	_err_add_context
	add	esp, 16					; 00000010H
$L70995:
	lea	edx, DWORD PTR _data$[ebp]
	push	edx
	call	_dyntab_free
	add	esp, 4
	lea	eax, DWORD PTR _conds$[ebp]
	push	eax
	call	_dyntab_free
	add	esp, 4
	lea	ecx, DWORD PTR _groups$[ebp]
	push	ecx
	call	_dyntab_free
	add	esp, 4
	lea	edx, DWORD PTR _filters$[ebp]
	push	edx
	call	_dyntab_free
	add	esp, 4
	lea	eax, DWORD PTR _controls$[ebp]
	push	eax
	call	_dyntab_free
	add	esp, 4
	mov	ecx, DWORD PTR _sql$[ebp]
	push	ecx
	call	_mem_free
	add	esp, 4
	mov	DWORD PTR _sql$[ebp], 0
	mov	edx, DWORD PTR _cntxt$[ebp]
	xor	eax, eax
	cmp	DWORD PTR [edx+29872], 0
	setne	al

; 771  : }

	mov	esp, ebp
	pop	ebp
	ret	0
_ctrl_check_condlist ENDP
_TEXT	ENDS
PUBLIC	_ctrl_check_condseq
_DATA	SEGMENT
$SG71016 DB	'D:\Travail\ABI\EVA\V4.0\CGI\Brunix-2016\ctrl_access.c', 00H
	ORG $+2
$SG71017 DB	'ctrl_check_condseq', 00H
	ORG $+1
$SG71019 DB	'D:\Travail\ABI\EVA\V4.0\CGI\Brunix-2016\ctrl_access.c', 00H
	ORG $+2
$SG71020 DB	'ctrl_check_condseq', 00H
_DATA	ENDS
_TEXT	SEGMENT
_cntxt$ = 8
_cond$ = 12
_match$ = 16
_res$ = -4
_ctrl_check_condseq PROC NEAR

; 785  : ){

	push	ebp
	mov	ebp, esp
	push	ecx

; 786  : 	int res = 0;

	mov	DWORD PTR _res$[ebp], 0

; 787  : 
; 788  : 	/* For each line of condition table */
; 789  : 	for(*match = 0; *match < cond->nbrows; (*match)++)

	mov	eax, DWORD PTR _match$[ebp]
	mov	DWORD PTR [eax], 0
	jmp	SHORT $L71009
$L71010:
	mov	ecx, DWORD PTR _match$[ebp]
	mov	edx, DWORD PTR [ecx]
	add	edx, 1
	mov	eax, DWORD PTR _match$[ebp]
	mov	DWORD PTR [eax], edx
$L71009:
	mov	ecx, DWORD PTR _match$[ebp]
	mov	edx, DWORD PTR _cond$[ebp]
	mov	eax, DWORD PTR [ecx]
	cmp	eax, DWORD PTR [edx]
	jae	SHORT $eva_noerr$71015

; 791  : 		/* Check condition line */
; 792  : 		if(ctrl_check_condlist(cntxt, &res, cond, *match)) STACK_ERROR;

	mov	ecx, DWORD PTR _match$[ebp]
	mov	edx, DWORD PTR [ecx]
	push	edx
	mov	eax, DWORD PTR _cond$[ebp]
	push	eax
	lea	ecx, DWORD PTR _res$[ebp]
	push	ecx
	mov	edx, DWORD PTR _cntxt$[ebp]
	push	edx
	call	_ctrl_check_condlist
	add	esp, 16					; 00000010H
	test	eax, eax
	je	SHORT $L71012
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 792		; 00000318H
	jmp	SHORT $eva_err$71013
$L71012:

; 793  : 		if(res) break;

	cmp	DWORD PTR _res$[ebp], 0
	je	SHORT $L71014
	jmp	SHORT $eva_noerr$71015
$L71014:

; 794  : 	}

	jmp	SHORT $L71010
$eva_noerr$71015:

; 795  : 
; 796  : 	RETURN_OK_CLEANUP;

	push	0
	push	OFFSET FLAT:$SG71016
	push	OFFSET FLAT:$SG71017
	mov	ecx, DWORD PTR _cntxt$[ebp]
	push	ecx
	call	_err_clear
	add	esp, 16					; 00000010H
$eva_err$71013:
	mov	edx, DWORD PTR _cntxt$[ebp]
	cmp	DWORD PTR [edx+29872], 0
	je	SHORT $L71018
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	ecx, DWORD PTR [eax+29900]
	push	ecx
	push	OFFSET FLAT:$SG71019
	push	OFFSET FLAT:$SG71020
	mov	edx, DWORD PTR _cntxt$[ebp]
	push	edx
	call	_err_add_context
	add	esp, 16					; 00000010H
$L71018:
	mov	eax, DWORD PTR _cntxt$[ebp]
	xor	ecx, ecx
	cmp	DWORD PTR [eax+29872], 0
	setne	cl
	mov	eax, ecx

; 797  : }

	mov	esp, ebp
	pop	ebp
	ret	0
_ctrl_check_condseq ENDP
_TEXT	ENDS
PUBLIC	_ctrl_check_access_condseq
_BSS	SEGMENT
	ALIGN	4

$SG71054 DB	01H DUP (?)
	ALIGN	4

$SG71055 DB	01H DUP (?)
_BSS	ENDS
_DATA	SEGMENT
	ORG $+1
$SG71036 DB	'_EVA_COND_ACCESS', 00H
	ORG $+3
$SG71038 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG71042 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG71045 DB	'_EVA_ACCESS_CONDSEQ', 00H
$SG71047 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG71050 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG71058 DB	'D:\Travail\ABI\EVA\V4.0\CGI\Brunix-2016\ctrl_access.c', 00H
	ORG $+2
$SG71059 DB	'ctrl_check_access_condseq', 00H
	ORG $+2
$SG71061 DB	'D:\Travail\ABI\EVA\V4.0\CGI\Brunix-2016\ctrl_access.c', 00H
	ORG $+2
$SG71062 DB	'ctrl_check_access_condseq', 00H
_DATA	ENDS
_TEXT	SEGMENT
_cntxt$ = 8
_ctrl$ = 12
_access$ = -20
_cond$ = -44
_lines$ = -48
_match$ = -24
_ctrl_check_access_condseq PROC NEAR

; 812  : ){

	push	ebp
	mov	ebp, esp
	sub	esp, 52					; 00000034H

; 813  : 	DynTable access = { 0 };

	mov	DWORD PTR _access$[ebp], 0
	xor	eax, eax
	mov	DWORD PTR _access$[ebp+4], eax
	mov	DWORD PTR _access$[ebp+8], eax
	mov	DWORD PTR _access$[ebp+12], eax
	mov	DWORD PTR _access$[ebp+16], eax

; 814  : 	DynTable cond = { 0 };

	mov	DWORD PTR _cond$[ebp], 0
	xor	ecx, ecx
	mov	DWORD PTR _cond$[ebp+4], ecx
	mov	DWORD PTR _cond$[ebp+8], ecx
	mov	DWORD PTR _cond$[ebp+12], ecx
	mov	DWORD PTR _cond$[ebp+16], ecx

; 815  : 	unsigned long lines, match;
; 816  : 
; 817  : 	/* Read condition sequence definition */
; 818  : 	CTRL_ATTR_TAB(cond, COND_ACCESS);

	lea	edx, DWORD PTR _cond$[ebp]
	push	edx
	call	_dyntab_free
	add	esp, 4
	push	0
	push	-1
	push	OFFSET FLAT:$SG71036
	mov	eax, DWORD PTR _ctrl$[ebp]
	add	eax, 44					; 0000002cH
	push	eax
	push	0
	lea	ecx, DWORD PTR _cond$[ebp]
	push	ecx
	call	_dyntab_filter_field
	add	esp, 24					; 00000018H
	test	eax, eax
	je	SHORT $L71035
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29872], OFFSET FLAT:$SG71038
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 818		; 00000332H
	jmp	$eva_err$71039
$L71035:
	lea	ecx, DWORD PTR _cond$[ebp]
	push	ecx
	call	_dyntab_order_lines
	add	esp, 4
	test	eax, eax
	je	SHORT $L71040
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29872], OFFSET FLAT:$SG71042
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 818		; 00000332H
	jmp	$eva_err$71039
$L71040:

; 819  : 	CTRL_ATTR_TAB(access, ACCESS_CONDSEQ);

	lea	ecx, DWORD PTR _access$[ebp]
	push	ecx
	call	_dyntab_free
	add	esp, 4
	push	0
	push	-1
	push	OFFSET FLAT:$SG71045
	mov	edx, DWORD PTR _ctrl$[ebp]
	add	edx, 44					; 0000002cH
	push	edx
	push	0
	lea	eax, DWORD PTR _access$[ebp]
	push	eax
	call	_dyntab_filter_field
	add	esp, 24					; 00000018H
	test	eax, eax
	je	SHORT $L71044
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29872], OFFSET FLAT:$SG71047
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 819		; 00000333H
	jmp	$eva_err$71039
$L71044:
	lea	eax, DWORD PTR _access$[ebp]
	push	eax
	call	_dyntab_order_lines
	add	esp, 4
	test	eax, eax
	je	SHORT $L71048
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29872], OFFSET FLAT:$SG71050
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 819		; 00000333H
	jmp	$eva_err$71039
$L71048:

; 820  : 
; 821  : 	/* Process condition table */
; 822  : 	if(ctrl_check_condseq(cntxt, &cond, &match)) STACK_ERROR;

	lea	eax, DWORD PTR _match$[ebp]
	push	eax
	lea	ecx, DWORD PTR _cond$[ebp]
	push	ecx
	mov	edx, DWORD PTR _cntxt$[ebp]
	push	edx
	call	_ctrl_check_condseq
	add	esp, 12					; 0000000cH
	test	eax, eax
	je	SHORT $L71051
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 822		; 00000336H
	jmp	$eva_err$71039
$L71051:

; 823  : 
; 824  : 	/* Handle matched condition */
; 825  : 	lines = access.nbrows > cond.nbrows ? access.nbrows : cond.nbrows;

	mov	ecx, DWORD PTR _access$[ebp]
	cmp	ecx, DWORD PTR _cond$[ebp]
	jbe	SHORT $L71220
	mov	edx, DWORD PTR _access$[ebp]
	mov	DWORD PTR -52+[ebp], edx
	jmp	SHORT $L71221
$L71220:
	mov	eax, DWORD PTR _cond$[ebp]
	mov	DWORD PTR -52+[ebp], eax
$L71221:
	mov	ecx, DWORD PTR -52+[ebp]
	mov	DWORD PTR _lines$[ebp], ecx

; 826  : 	if(!lines || match < lines)

	cmp	DWORD PTR _lines$[ebp], 0
	je	SHORT $L71053
	mov	edx, DWORD PTR _match$[ebp]
	cmp	edx, DWORD PTR _lines$[ebp]
	jae	SHORT $L71052
$L71053:

; 827  : 		ctrl_parse_access(&ctrl->access, dyntab_val(&access, match, 0), "", "");

	push	OFFSET FLAT:$SG71054
	push	OFFSET FLAT:$SG71055
	push	0
	mov	eax, DWORD PTR _match$[ebp]
	push	eax
	lea	ecx, DWORD PTR _access$[ebp]
	push	ecx
	call	_dyntab_val
	add	esp, 12					; 0000000cH
	push	eax
	mov	edx, DWORD PTR _ctrl$[ebp]
	add	edx, 184				; 000000b8H
	push	edx
	call	_ctrl_parse_access
	add	esp, 16					; 00000010H

; 828  : 	else

	jmp	SHORT $eva_noerr$71057
$L71052:

; 829  : 		ctrl->access = AccessNone;

	mov	eax, DWORD PTR _ctrl$[ebp]
	mov	DWORD PTR [eax+184], 0
$eva_noerr$71057:

; 830  : 
; 831  : 	RETURN_OK_CLEANUP;

	push	0
	push	OFFSET FLAT:$SG71058
	push	OFFSET FLAT:$SG71059
	mov	ecx, DWORD PTR _cntxt$[ebp]
	push	ecx
	call	_err_clear
	add	esp, 16					; 00000010H
$eva_err$71039:
	mov	edx, DWORD PTR _cntxt$[ebp]
	cmp	DWORD PTR [edx+29872], 0
	je	SHORT $L71060
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	ecx, DWORD PTR [eax+29900]
	push	ecx
	push	OFFSET FLAT:$SG71061
	push	OFFSET FLAT:$SG71062
	mov	edx, DWORD PTR _cntxt$[ebp]
	push	edx
	call	_err_add_context
	add	esp, 16					; 00000010H
$L71060:
	lea	eax, DWORD PTR _access$[ebp]
	push	eax
	call	_dyntab_free
	add	esp, 4
	lea	ecx, DWORD PTR _cond$[ebp]
	push	ecx
	call	_dyntab_free
	add	esp, 4
	mov	edx, DWORD PTR _cntxt$[ebp]
	xor	eax, eax
	cmp	DWORD PTR [edx+29872], 0
	setne	al

; 832  : }

	mov	esp, ebp
	pop	ebp
	ret	0
_ctrl_check_access_condseq ENDP
_TEXT	ENDS
PUBLIC	_ctrl_check_access
EXTRN	_atoi:NEAR
_BSS	SEGMENT
	ALIGN	4

$SG71074 DB	01H DUP (?)
	ALIGN	4

$SG71077 DB	01H DUP (?)
	ALIGN	4

$SG71084 DB	01H DUP (?)
_BSS	ENDS
_DATA	SEGMENT
	ORG $+2
$SG71073 DB	'_EVA_ACCES_TYPE', 00H
$SG71076 DB	'_EVA_ACCES_CHECK_WHEN', 00H
	ORG $+2
$SG71083 DB	'_EVA_DEBUG_ACCESS', 00H
	ORG $+2
$SG71087 DB	'_EVA_BASIC_ACCESS', 00H
	ORG $+2
$SG71094 DB	'_EVA_FORM', 00H
	ORG $+2
$SG71099 DB	'_EVA_INHERIT', 00H
	ORG $+3
$SG71102 DB	'_EVA_READONLY', 00H
	ORG $+2
$SG71105 DB	'_EVA_INHERIT_COND', 00H
	ORG $+2
$SG71111 DB	'_EVA_INHERIT', 00H
	ORG $+3
$SG71114 DB	'_EVA_INHERIT_COND', 00H
	ORG $+2
$SG71117 DB	'D:\Travail\ABI\EVA\V4.0\CGI\Brunix-2016\ctrl_access.c', 00H
	ORG $+2
$SG71118 DB	'ctrl_check_access', 00H
	ORG $+2
$SG71120 DB	'D:\Travail\ABI\EVA\V4.0\CGI\Brunix-2016\ctrl_access.c', 00H
	ORG $+2
$SG71121 DB	'ctrl_check_access', 00H
_DATA	ENDS
_TEXT	SEGMENT
_cntxt$ = 8
_ctrl$ = 12
_form$ = -48
_acctyp$ = -52
_chkwhen$ = -44
_access$ = -20
_acctype$ = -96
_accgroup$ = -40
_acccond$ = -76
_sql_trace$ = -56
_ctrl_check_access PROC NEAR

; 850  : ){

	push	ebp
	mov	ebp, esp
	sub	esp, 108				; 0000006cH

; 851  : 	EVA_form *form = cntxt->form;

	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	ecx, DWORD PTR [eax+80]
	mov	DWORD PTR _form$[ebp], ecx

; 852  : 	char *acctyp = CTRL_ATTR_VAL(ACCES_TYPE);

	cmp	DWORD PTR _ctrl$[ebp], 0
	je	SHORT $L71223
	push	0
	push	-1
	push	OFFSET FLAT:$SG71073
	mov	edx, DWORD PTR _ctrl$[ebp]
	add	edx, 44					; 0000002cH
	push	edx
	call	_dyntab_field_val
	add	esp, 16					; 00000010H
	mov	DWORD PTR -100+[ebp], eax
	jmp	SHORT $L71224
$L71223:
	mov	DWORD PTR -100+[ebp], OFFSET FLAT:$SG71074
$L71224:
	mov	eax, DWORD PTR -100+[ebp]
	mov	DWORD PTR _acctyp$[ebp], eax

; 853  : 	char *chkwhen = CTRL_ATTR_VAL(ACCES_CHECK_WHEN);

	cmp	DWORD PTR _ctrl$[ebp], 0
	je	SHORT $L71225
	push	0
	push	-1
	push	OFFSET FLAT:$SG71076
	mov	ecx, DWORD PTR _ctrl$[ebp]
	add	ecx, 44					; 0000002cH
	push	ecx
	call	_dyntab_field_val
	add	esp, 16					; 00000010H
	mov	DWORD PTR -104+[ebp], eax
	jmp	SHORT $L71226
$L71225:
	mov	DWORD PTR -104+[ebp], OFFSET FLAT:$SG71077
$L71226:
	mov	edx, DWORD PTR -104+[ebp]
	mov	DWORD PTR _chkwhen$[ebp], edx

; 854  : 	DynTable access = { 0 };

	mov	DWORD PTR _access$[ebp], 0
	xor	eax, eax
	mov	DWORD PTR _access$[ebp+4], eax
	mov	DWORD PTR _access$[ebp+8], eax
	mov	DWORD PTR _access$[ebp+12], eax
	mov	DWORD PTR _access$[ebp+16], eax

; 855  : 	DynTable acctype = { 0 };

	mov	DWORD PTR _acctype$[ebp], 0
	xor	ecx, ecx
	mov	DWORD PTR _acctype$[ebp+4], ecx
	mov	DWORD PTR _acctype$[ebp+8], ecx
	mov	DWORD PTR _acctype$[ebp+12], ecx
	mov	DWORD PTR _acctype$[ebp+16], ecx

; 856  : 	DynTable accgroup = { 0 };

	mov	DWORD PTR _accgroup$[ebp], 0
	xor	edx, edx
	mov	DWORD PTR _accgroup$[ebp+4], edx
	mov	DWORD PTR _accgroup$[ebp+8], edx
	mov	DWORD PTR _accgroup$[ebp+12], edx
	mov	DWORD PTR _accgroup$[ebp+16], edx

; 857  : 	DynTable acccond = { 0 };

	mov	DWORD PTR _acccond$[ebp], 0
	xor	eax, eax
	mov	DWORD PTR _acccond$[ebp+4], eax
	mov	DWORD PTR _acccond$[ebp+8], eax
	mov	DWORD PTR _acccond$[ebp+12], eax
	mov	DWORD PTR _acccond$[ebp+16], eax

; 858  : 
; 859  : 	/* Handle debug */
; 860  : 	int sql_trace = cntxt->sql_trace;

	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	edx, DWORD PTR [ecx+29852]
	mov	DWORD PTR _sql_trace$[ebp], edx

; 861  : 	cntxt->sql_trace = atoi(CTRL_ATTR_VAL(DEBUG_ACCESS));

	cmp	DWORD PTR _ctrl$[ebp], 0
	je	SHORT $L71227
	push	0
	push	-1
	push	OFFSET FLAT:$SG71083
	mov	eax, DWORD PTR _ctrl$[ebp]
	add	eax, 44					; 0000002cH
	push	eax
	call	_dyntab_field_val
	add	esp, 16					; 00000010H
	mov	DWORD PTR -108+[ebp], eax
	jmp	SHORT $L71228
$L71227:
	mov	DWORD PTR -108+[ebp], OFFSET FLAT:$SG71084
$L71228:
	mov	ecx, DWORD PTR -108+[ebp]
	push	ecx
	call	_atoi
	add	esp, 4
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29852], eax

; 862  : 
; 863  : 	/* Handle old access definition */
; 864  : 	if(!*acctyp || !strcmp(acctyp, "_EVA_BASIC_ACCESS"))

	mov	eax, DWORD PTR _acctyp$[ebp]
	movsx	ecx, BYTE PTR [eax]
	test	ecx, ecx
	je	SHORT $L71086
	push	OFFSET FLAT:$SG71087
	mov	edx, DWORD PTR _acctyp$[ebp]
	push	edx
	call	_strcmp
	add	esp, 8
	test	eax, eax
	jne	SHORT $L71085
$L71086:

; 866  : 		if(ctrl_check_access_v0(cntxt, ctrl)) STACK_ERROR;

	mov	eax, DWORD PTR _ctrl$[ebp]
	push	eax
	mov	ecx, DWORD PTR _cntxt$[ebp]
	push	ecx
	call	_ctrl_check_access_v0
	add	esp, 8
	test	eax, eax
	je	SHORT $L71088
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 866		; 00000362H
	jmp	$eva_err$71089
$L71088:

; 868  : 	/* Standard access definition */
; 869  : 	else

	jmp	$L71115
$L71085:

; 871  : 		/* Check basic access at read time */
; 872  : 		if(form->step == CtrlRead)

	mov	eax, DWORD PTR _form$[ebp]
	cmp	DWORD PTR [eax+176], 0
	jne	$L71091

; 874  : 			/* Check object access for forms & top level control */
; 875  : 			if(!ctrl->CONTROL || !strcmp(ctrl->CONTROL, "_EVA_FORM") || ctrl == form->ctrl)

	mov	ecx, DWORD PTR _ctrl$[ebp]
	cmp	DWORD PTR [ecx+272], 0
	je	SHORT $L71093
	push	OFFSET FLAT:$SG71094
	mov	edx, DWORD PTR _ctrl$[ebp]
	mov	eax, DWORD PTR [edx+272]
	push	eax
	call	_strcmp
	add	esp, 8
	test	eax, eax
	je	SHORT $L71093
	mov	ecx, DWORD PTR _form$[ebp]
	mov	edx, DWORD PTR _ctrl$[ebp]
	cmp	edx, DWORD PTR [ecx]
	jne	SHORT $L71092
$L71093:

; 877  : 				if(obj_check_user_access(cntxt, &form->objdata, 0, &ctrl->access)) STACK_ERROR;

	mov	eax, DWORD PTR _ctrl$[ebp]
	add	eax, 184				; 000000b8H
	push	eax
	push	0
	mov	ecx, DWORD PTR _form$[ebp]
	add	ecx, 52					; 00000034H
	push	ecx
	mov	edx, DWORD PTR _cntxt$[ebp]
	push	edx
	call	_obj_check_user_access
	add	esp, 16					; 00000010H
	test	eax, eax
	je	SHORT $L71095
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 877		; 0000036dH
	jmp	$eva_err$71089
$L71095:

; 879  : 			else

	jmp	SHORT $L71096
$L71092:

; 880  : 				ctrl->access = AccessAll;

	mov	ecx, DWORD PTR _ctrl$[ebp]
	mov	DWORD PTR [ecx+184], 15			; 0000000fH
$L71096:

; 881  : 
; 882  : 			/* Handle access definition methods */
; 883  : 			if(ctrl->access != AccessNone)

	mov	edx, DWORD PTR _ctrl$[ebp]
	cmp	DWORD PTR [edx+184], 0
	je	$L71107

; 885  : 				if(!strcmp(acctyp, "_EVA_INHERIT"))

	push	OFFSET FLAT:$SG71099
	mov	eax, DWORD PTR _acctyp$[ebp]
	push	eax
	call	_strcmp
	add	esp, 8
	test	eax, eax
	jne	SHORT $L71098

; 887  : 					ctrl->access &= form->ctrl[ctrl->i_parent].access;

	mov	ecx, DWORD PTR _ctrl$[ebp]
	mov	edx, DWORD PTR [ecx+20]
	imul	edx, 480				; 000001e0H
	mov	eax, DWORD PTR _form$[ebp]
	mov	ecx, DWORD PTR [eax]
	mov	eax, DWORD PTR _ctrl$[ebp]
	mov	eax, DWORD PTR [eax+184]
	and	eax, DWORD PTR [ecx+edx+184]
	mov	ecx, DWORD PTR _ctrl$[ebp]
	mov	DWORD PTR [ecx+184], eax

; 889  : 				else if(!strcmp(acctyp, "_EVA_READONLY"))

	jmp	$L71107
$L71098:
	push	OFFSET FLAT:$SG71102
	mov	edx, DWORD PTR _acctyp$[ebp]
	push	edx
	call	_strcmp
	add	esp, 8
	test	eax, eax
	jne	SHORT $L71101

; 891  : 					ctrl->access &= AccessView;

	mov	eax, DWORD PTR _ctrl$[ebp]
	mov	ecx, DWORD PTR [eax+184]
	and	ecx, 1
	mov	edx, DWORD PTR _ctrl$[ebp]
	mov	DWORD PTR [edx+184], ecx

; 893  : 				else if(!strcmp(acctyp, "_EVA_INHERIT_COND"))

	jmp	SHORT $L71107
$L71101:
	push	OFFSET FLAT:$SG71105
	mov	eax, DWORD PTR _acctyp$[ebp]
	push	eax
	call	_strcmp
	add	esp, 8
	test	eax, eax
	jne	SHORT $L71104

; 895  : 					ctrl->access &= form->ctrl[ctrl->i_parent].access;

	mov	ecx, DWORD PTR _ctrl$[ebp]
	mov	edx, DWORD PTR [ecx+20]
	imul	edx, 480				; 000001e0H
	mov	eax, DWORD PTR _form$[ebp]
	mov	ecx, DWORD PTR [eax]
	mov	eax, DWORD PTR _ctrl$[ebp]
	mov	eax, DWORD PTR [eax+184]
	and	eax, DWORD PTR [ecx+edx+184]
	mov	ecx, DWORD PTR _ctrl$[ebp]
	mov	DWORD PTR [ecx+184], eax

; 896  : 					if(!*chkwhen && ctrl_check_access_condseq(cntxt, ctrl)) STACK_ERROR;

	mov	edx, DWORD PTR _chkwhen$[ebp]
	movsx	eax, BYTE PTR [edx]
	test	eax, eax
	jne	SHORT $L71106
	mov	ecx, DWORD PTR _ctrl$[ebp]
	push	ecx
	mov	edx, DWORD PTR _cntxt$[ebp]
	push	edx
	call	_ctrl_check_access_condseq
	add	esp, 8
	test	eax, eax
	je	SHORT $L71106
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 896		; 00000380H
	jmp	$eva_err$71089
$L71106:

; 898  : 				else ctrl->access = AccessNone;

	jmp	SHORT $L71107
$L71104:
	mov	ecx, DWORD PTR _ctrl$[ebp]
	mov	DWORD PTR [ecx+184], 0
$L71107:

; 900  : 			ctrl->access0 = ctrl->access;

	mov	edx, DWORD PTR _ctrl$[ebp]
	mov	eax, DWORD PTR _ctrl$[ebp]
	mov	ecx, DWORD PTR [eax+184]
	mov	DWORD PTR [edx+188], ecx

; 902  : 		/* Check final access after read time */
; 903  : 		else if(!ctrl->accesschkd &&  ctrl->access != AccessNone)

	jmp	$L71115
$L71091:
	mov	edx, DWORD PTR _ctrl$[ebp]
	cmp	DWORD PTR [edx+192], 0
	jne	$L71115
	mov	eax, DWORD PTR _ctrl$[ebp]
	cmp	DWORD PTR [eax+184], 0
	je	$L71115

; 905  : 			ctrl->accesschkd = 1;

	mov	ecx, DWORD PTR _ctrl$[ebp]
	mov	DWORD PTR [ecx+192], 1

; 906  : 			if(!strcmp(acctyp, "_EVA_INHERIT"))

	push	OFFSET FLAT:$SG71111
	mov	edx, DWORD PTR _acctyp$[ebp]
	push	edx
	call	_strcmp
	add	esp, 8
	test	eax, eax
	jne	SHORT $L71110

; 908  : 				ctrl->access &= form->ctrl[ctrl->i_parent].access;

	mov	eax, DWORD PTR _ctrl$[ebp]
	mov	ecx, DWORD PTR [eax+20]
	imul	ecx, 480				; 000001e0H
	mov	edx, DWORD PTR _form$[ebp]
	mov	eax, DWORD PTR [edx]
	mov	edx, DWORD PTR _ctrl$[ebp]
	mov	edx, DWORD PTR [edx+184]
	and	edx, DWORD PTR [eax+ecx+184]
	mov	eax, DWORD PTR _ctrl$[ebp]
	mov	DWORD PTR [eax+184], edx

; 910  : 			else if(!strcmp(acctyp, "_EVA_INHERIT_COND"))

	jmp	SHORT $L71115
$L71110:
	push	OFFSET FLAT:$SG71114
	mov	ecx, DWORD PTR _acctyp$[ebp]
	push	ecx
	call	_strcmp
	add	esp, 8
	test	eax, eax
	jne	SHORT $L71115

; 912  : 				ctrl->access &= form->ctrl[ctrl->i_parent].access;

	mov	edx, DWORD PTR _ctrl$[ebp]
	mov	eax, DWORD PTR [edx+20]
	imul	eax, 480				; 000001e0H
	mov	ecx, DWORD PTR _form$[ebp]
	mov	edx, DWORD PTR [ecx]
	mov	ecx, DWORD PTR _ctrl$[ebp]
	mov	ecx, DWORD PTR [ecx+184]
	and	ecx, DWORD PTR [edx+eax+184]
	mov	edx, DWORD PTR _ctrl$[ebp]
	mov	DWORD PTR [edx+184], ecx

; 913  : 				if(*chkwhen && ctrl_check_access_condseq(cntxt, ctrl)) STACK_ERROR;

	mov	eax, DWORD PTR _chkwhen$[ebp]
	movsx	ecx, BYTE PTR [eax]
	test	ecx, ecx
	je	SHORT $L71115
	mov	edx, DWORD PTR _ctrl$[ebp]
	push	edx
	mov	eax, DWORD PTR _cntxt$[ebp]
	push	eax
	call	_ctrl_check_access_condseq
	add	esp, 8
	test	eax, eax
	je	SHORT $L71115
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 913		; 00000391H
	jmp	SHORT $eva_err$71089
$L71115:
$eva_noerr$71116:

; 917  : 
; 918  : 	RETURN_OK_CLEANUP;

	push	0
	push	OFFSET FLAT:$SG71117
	push	OFFSET FLAT:$SG71118
	mov	edx, DWORD PTR _cntxt$[ebp]
	push	edx
	call	_err_clear
	add	esp, 16					; 00000010H
$eva_err$71089:
	mov	eax, DWORD PTR _cntxt$[ebp]
	cmp	DWORD PTR [eax+29872], 0
	je	SHORT $L71119
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	edx, DWORD PTR [ecx+29900]
	push	edx
	push	OFFSET FLAT:$SG71120
	push	OFFSET FLAT:$SG71121
	mov	eax, DWORD PTR _cntxt$[ebp]
	push	eax
	call	_err_add_context
	add	esp, 16					; 00000010H
$L71119:
	lea	ecx, DWORD PTR _access$[ebp]
	push	ecx
	call	_dyntab_free
	add	esp, 4
	lea	edx, DWORD PTR _acctype$[ebp]
	push	edx
	call	_dyntab_free
	add	esp, 4
	lea	eax, DWORD PTR _accgroup$[ebp]
	push	eax
	call	_dyntab_free
	add	esp, 4
	lea	ecx, DWORD PTR _acccond$[ebp]
	push	ecx
	call	_dyntab_free
	add	esp, 4
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	eax, DWORD PTR _sql_trace$[ebp]
	mov	DWORD PTR [edx+29852], eax
	mov	ecx, DWORD PTR _cntxt$[ebp]
	xor	eax, eax
	cmp	DWORD PTR [ecx+29872], 0
	setne	al

; 919  : }

	mov	esp, ebp
	pop	ebp
	ret	0
_ctrl_check_access ENDP
_TEXT	ENDS
END
