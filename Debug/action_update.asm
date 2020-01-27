	TITLE	D:\Travail\ABI\EVA\V4.0\CGI\Brunix-2016\action_update.c
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
PUBLIC	_action_update
EXTRN	_form_eval_fieldexpr:NEAR
EXTRN	_cgi_set_field_values:NEAR
EXTRN	_ctrl_eval_valtyp:NEAR
EXTRN	_input_to_number:NEAR
EXTRN	_form_close_nosave:NEAR
EXTRN	_form_save_dialog:NEAR
EXTRN	_mem_free:NEAR
EXTRN	_strtoul:NEAR
EXTRN	_dynbuf_add:NEAR
EXTRN	_qry_update_idobj_idfield:NEAR
EXTRN	_dyntab_free:NEAR
EXTRN	_dyntab_sz:NEAR
EXTRN	_dyntab_val:NEAR
EXTRN	_dyntab_cell:NEAR
EXTRN	_dyntab_copy:NEAR
EXTRN	_dyntab_add:NEAR
EXTRN	_strcmp:NEAR
EXTRN	_strlen:NEAR
EXTRN	_qry_eval_sqlexpr_var:NEAR
EXTRN	_dyntab_set_txt:NEAR
EXTRN	_err_add_context:NEAR
EXTRN	_err_clear:NEAR
EXTRN	_action_sequence:NEAR
EXTRN	_dyntab_filter_field:NEAR
EXTRN	_dyntab_field_val:NEAR
EXTRN	_dyntab_order_lines:NEAR
EXTRN	_form_get_field_values:NEAR
_BSS	SEGMENT
$SG70231 DB	01H DUP (?)
	ALIGN	4

$SG70234 DB	01H DUP (?)
	ALIGN	4

$SG70242 DB	01H DUP (?)
_BSS	ENDS
_DATA	SEGMENT
$SG70230 DB	'_EVA_CONFIRM', 00H
	ORG $+3
$SG70233 DB	'_EVA_EXEC_AFTER', 00H
$SG70236 DB	'_EVA_NOSAVE', 00H
$SG70241 DB	'_EVA_UPDATE', 00H
$SG70244 DB	'_EVA_CURRENTOBJ', 00H
$SG70254 DB	'_EVA_UPDATE_OBJFIELD', 00H
	ORG $+3
$SG70256 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70259 DB	'_EVA_CURRENTOBJ', 00H
$SG70261 DB	'_EVA_FILTER', 00H
$SG70264 DB	'_EVA_FILTERS', 00H
	ORG $+3
$SG70266 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70269 DB	'No filter given : UPDATE operation ignored for button', 00H
	ORG $+2
$SG70273 DB	'_EVA_LISTOBJ', 00H
	ORG $+3
$SG70275 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70279 DB	'Too many objects selected (over 1000) : UPDATE operation'
	DB	' ignored for button', 00H
$SG70282 DB	'0', 00H
	ORG $+2
$SG70284 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70287 DB	'_EVA_DESTFIELD', 00H
	ORG $+1
$SG70289 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70292 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70295 DB	'_EVA_SRCTYPE', 00H
	ORG $+3
$SG70297 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70300 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70303 DB	'_EVA_SRCLISTOBJ', 00H
$SG70305 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70308 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70311 DB	'_EVA_SRCFIELD', 00H
	ORG $+2
$SG70313 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70316 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70319 DB	'_EVA_SET_MODE', 00H
	ORG $+2
$SG70321 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70324 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70327 DB	'_EVA_DEST_RELMODE', 00H
	ORG $+2
$SG70329 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70332 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70335 DB	'_EVA_DEBUG_SQL_EXPR', 00H
$SG70337 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70340 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70348 DB	'_EVA_DESTOBJ', 00H
	ORG $+3
$SG70356 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70363 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70365 DB	'D:\Travail\ABI\EVA\V4.0\CGI\Brunix-2016\action_update.c', 00H
$SG70366 DB	'action_update', 00H
	ORG $+2
$SG70372 DB	'_EVA_REPLACE', 00H
	ORG $+3
$SG70384 DB	'D:\Travail\ABI\EVA\V4.0\CGI\Brunix-2016\action_update.c', 00H
$SG70385 DB	'action_update', 00H
	ORG $+2
$SG70387 DB	'_EVA_ADD_LINE', 00H
	ORG $+2
$SG70416 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70419 DB	'_EVA_SELTAB', 00H
$SG70421 DB	'_EVA_REPLACE', 00H
	ORG $+3
$SG70422 DB	'_EVA_ADD', 00H
	ORG $+3
$SG70423 DB	'_EVA_REMOVE', 00H
$SG70427 DB	'D:\Travail\ABI\EVA\V4.0\CGI\Brunix-2016\action_update.c', 00H
$SG70428 DB	'action_update', 00H
	ORG $+2
$SG70431 DB	'_EVA_NONE', 00H
	ORG $+2
$SG70435 DB	'_EVA_CLOSE', 00H
	ORG $+1
$SG70442 DB	'_EVA_ACTION', 00H
$SG70444 DB	'D:\Travail\ABI\EVA\V4.0\CGI\Brunix-2016\action_update.c', 00H
$SG70445 DB	'action_update', 00H
	ORG $+2
$SG70447 DB	'D:\Travail\ABI\EVA\V4.0\CGI\Brunix-2016\action_update.c', 00H
$SG70448 DB	'action_update', 00H
_DATA	ENDS
_TEXT	SEGMENT
_cntxt$ = 8
_i_ctrl$ = 12
_form$ = -68
_ctrl$ = -268
_destfield$ = -64
_srctype$ = -308
_srcvalobj$ = -88
_srcval$ = -196
_setmode$ = -264
_userel$ = -116
_values$ = -176
_debug$ = -244
_updobj$ = -144
_updfield$ = -216
_listobj$ = -20
_tmpval$ = -288
_curval$ = -44
_expr$ = -96
_sql_trace$ = -92
_i$ = -148
_j$ = -156
_confirm$ = -220
_after$ = -224
_b_savetodb$ = -152
_curobj$ = -124
_curform$ = -120
_updobjtyp$ = -24
_b_done$70246 = -312
_idfield$70344 = -320
_mode$70345 = -328
_typ$70346 = -316
_b_same$70347 = -324
_idobj$70376 = -336
_k$70378 = -340
_num$70379 = -344
_line$70380 = -332
_c$70392 = -348
_c$70398 = -352
_v$70400 = -360
_tmp$70401 = -356
_c$70405 = -364
_action_update PROC NEAR

; 40   : ){

	push	ebp
	mov	ebp, esp
	sub	esp, 400				; 00000190H

; 41   : 	EVA_form *form = cntxt->form;

	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	ecx, DWORD PTR [eax+80]
	mov	DWORD PTR _form$[ebp], ecx

; 42   : 	EVA_ctrl *ctrl = form->ctrl + i_ctrl;

	mov	edx, DWORD PTR _i_ctrl$[ebp]
	imul	edx, 480				; 000001e0H
	mov	eax, DWORD PTR _form$[ebp]
	mov	ecx, DWORD PTR [eax]
	add	ecx, edx
	mov	DWORD PTR _ctrl$[ebp], ecx

; 43   : 	DynTable destfield = { 0 };

	mov	DWORD PTR _destfield$[ebp], 0
	xor	edx, edx
	mov	DWORD PTR _destfield$[ebp+4], edx
	mov	DWORD PTR _destfield$[ebp+8], edx
	mov	DWORD PTR _destfield$[ebp+12], edx
	mov	DWORD PTR _destfield$[ebp+16], edx

; 44   : 	DynTable srctype = { 0 };

	mov	DWORD PTR _srctype$[ebp], 0
	xor	eax, eax
	mov	DWORD PTR _srctype$[ebp+4], eax
	mov	DWORD PTR _srctype$[ebp+8], eax
	mov	DWORD PTR _srctype$[ebp+12], eax
	mov	DWORD PTR _srctype$[ebp+16], eax

; 45   : 	DynTable srcvalobj = { 0 };

	mov	DWORD PTR _srcvalobj$[ebp], 0
	xor	ecx, ecx
	mov	DWORD PTR _srcvalobj$[ebp+4], ecx
	mov	DWORD PTR _srcvalobj$[ebp+8], ecx
	mov	DWORD PTR _srcvalobj$[ebp+12], ecx
	mov	DWORD PTR _srcvalobj$[ebp+16], ecx

; 46   : 	DynTable srcval = { 0 };

	mov	DWORD PTR _srcval$[ebp], 0
	xor	edx, edx
	mov	DWORD PTR _srcval$[ebp+4], edx
	mov	DWORD PTR _srcval$[ebp+8], edx
	mov	DWORD PTR _srcval$[ebp+12], edx
	mov	DWORD PTR _srcval$[ebp+16], edx

; 47   : 	DynTable setmode = { 0 };

	mov	DWORD PTR _setmode$[ebp], 0
	xor	eax, eax
	mov	DWORD PTR _setmode$[ebp+4], eax
	mov	DWORD PTR _setmode$[ebp+8], eax
	mov	DWORD PTR _setmode$[ebp+12], eax
	mov	DWORD PTR _setmode$[ebp+16], eax

; 48   : 	DynTable userel = { 0 };

	mov	DWORD PTR _userel$[ebp], 0
	xor	ecx, ecx
	mov	DWORD PTR _userel$[ebp+4], ecx
	mov	DWORD PTR _userel$[ebp+8], ecx
	mov	DWORD PTR _userel$[ebp+12], ecx
	mov	DWORD PTR _userel$[ebp+16], ecx

; 49   : 	DynTable values = { 0 };

	mov	DWORD PTR _values$[ebp], 0
	xor	edx, edx
	mov	DWORD PTR _values$[ebp+4], edx
	mov	DWORD PTR _values$[ebp+8], edx
	mov	DWORD PTR _values$[ebp+12], edx
	mov	DWORD PTR _values$[ebp+16], edx

; 50   : 	DynTable debug = { 0 };

	mov	DWORD PTR _debug$[ebp], 0
	xor	eax, eax
	mov	DWORD PTR _debug$[ebp+4], eax
	mov	DWORD PTR _debug$[ebp+8], eax
	mov	DWORD PTR _debug$[ebp+12], eax
	mov	DWORD PTR _debug$[ebp+16], eax

; 51   : 	DynTable updobj = { 0 };

	mov	DWORD PTR _updobj$[ebp], 0
	xor	ecx, ecx
	mov	DWORD PTR _updobj$[ebp+4], ecx
	mov	DWORD PTR _updobj$[ebp+8], ecx
	mov	DWORD PTR _updobj$[ebp+12], ecx
	mov	DWORD PTR _updobj$[ebp+16], ecx

; 52   : 	DynTable updfield = { 0 };

	mov	DWORD PTR _updfield$[ebp], 0
	xor	edx, edx
	mov	DWORD PTR _updfield$[ebp+4], edx
	mov	DWORD PTR _updfield$[ebp+8], edx
	mov	DWORD PTR _updfield$[ebp+12], edx
	mov	DWORD PTR _updfield$[ebp+16], edx

; 53   : 	DynTable listobj = { 0 };

	mov	DWORD PTR _listobj$[ebp], 0
	xor	eax, eax
	mov	DWORD PTR _listobj$[ebp+4], eax
	mov	DWORD PTR _listobj$[ebp+8], eax
	mov	DWORD PTR _listobj$[ebp+12], eax
	mov	DWORD PTR _listobj$[ebp+16], eax

; 54   : 	DynTable tmpval = { 0 };

	mov	DWORD PTR _tmpval$[ebp], 0
	xor	ecx, ecx
	mov	DWORD PTR _tmpval$[ebp+4], ecx
	mov	DWORD PTR _tmpval$[ebp+8], ecx
	mov	DWORD PTR _tmpval$[ebp+12], ecx
	mov	DWORD PTR _tmpval$[ebp+16], ecx

; 55   : 	DynTable curval = { 0 };

	mov	DWORD PTR _curval$[ebp], 0
	xor	edx, edx
	mov	DWORD PTR _curval$[ebp+4], edx
	mov	DWORD PTR _curval$[ebp+8], edx
	mov	DWORD PTR _curval$[ebp+12], edx
	mov	DWORD PTR _curval$[ebp+16], edx

; 56   : 	DynBuffer *expr = NULL;

	mov	DWORD PTR _expr$[ebp], 0

; 57   : 	int sql_trace = cntxt->sql_trace;

	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	ecx, DWORD PTR [eax+29852]
	mov	DWORD PTR _sql_trace$[ebp], ecx

; 58   : 	unsigned long i, j;
; 59   : 	char *confirm = CTRL_ATTR_VAL(CONFIRM);

	cmp	DWORD PTR _ctrl$[ebp], 0
	je	SHORT $L70453
	push	0
	push	-1
	push	OFFSET FLAT:$SG70230
	mov	edx, DWORD PTR _ctrl$[ebp]
	add	edx, 44					; 0000002cH
	push	edx
	call	_dyntab_field_val
	add	esp, 16					; 00000010H
	mov	DWORD PTR -368+[ebp], eax
	jmp	SHORT $L70454
$L70453:
	mov	DWORD PTR -368+[ebp], OFFSET FLAT:$SG70231
$L70454:
	mov	eax, DWORD PTR -368+[ebp]
	mov	DWORD PTR _confirm$[ebp], eax

; 60   : 	char *after = CTRL_ATTR_VAL(EXEC_AFTER);

	cmp	DWORD PTR _ctrl$[ebp], 0
	je	SHORT $L70455
	push	0
	push	-1
	push	OFFSET FLAT:$SG70233
	mov	ecx, DWORD PTR _ctrl$[ebp]
	add	ecx, 44					; 0000002cH
	push	ecx
	call	_dyntab_field_val
	add	esp, 16					; 00000010H
	mov	DWORD PTR -372+[ebp], eax
	jmp	SHORT $L70456
$L70455:
	mov	DWORD PTR -372+[ebp], OFFSET FLAT:$SG70234
$L70456:
	mov	edx, DWORD PTR -372+[ebp]
	mov	DWORD PTR _after$[ebp], edx

; 61   : 	int b_savetodb = *confirm && strcmp(confirm, "_EVA_NOSAVE");

	mov	eax, DWORD PTR _confirm$[ebp]
	movsx	ecx, BYTE PTR [eax]
	test	ecx, ecx
	je	SHORT $L70457
	push	OFFSET FLAT:$SG70236
	mov	edx, DWORD PTR _confirm$[ebp]
	push	edx
	call	_strcmp
	add	esp, 8
	test	eax, eax
	je	SHORT $L70457
	mov	DWORD PTR -376+[ebp], 1
	jmp	SHORT $L70458
$L70457:
	mov	DWORD PTR -376+[ebp], 0
$L70458:
	mov	eax, DWORD PTR -376+[ebp]
	mov	DWORD PTR _b_savetodb$[ebp], eax

; 62   : 	unsigned long curobj;
; 63   : 	unsigned long curform = DYNTAB_TOUL(&cntxt->form->id_form);

	push	10					; 0000000aH
	push	0
	push	0
	push	0
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	edx, DWORD PTR [ecx+80]
	add	edx, 12					; 0000000cH
	push	edx
	call	_dyntab_val
	add	esp, 12					; 0000000cH
	push	eax
	call	_strtoul
	add	esp, 12					; 0000000cH
	mov	DWORD PTR _curform$[ebp], eax

; 64   : 	char *updobjtyp = CTRL_ATTR_VAL(UPDATE);

	cmp	DWORD PTR _ctrl$[ebp], 0
	je	SHORT $L70459
	push	0
	push	-1
	push	OFFSET FLAT:$SG70241
	mov	eax, DWORD PTR _ctrl$[ebp]
	add	eax, 44					; 0000002cH
	push	eax
	call	_dyntab_field_val
	add	esp, 16					; 00000010H
	mov	DWORD PTR -380+[ebp], eax
	jmp	SHORT $L70460
$L70459:
	mov	DWORD PTR -380+[ebp], OFFSET FLAT:$SG70242
$L70460:
	mov	ecx, DWORD PTR -380+[ebp]
	mov	DWORD PTR _updobjtyp$[ebp], ecx

; 65   : 	if(!*updobjtyp) updobjtyp = "_EVA_CURRENTOBJ";

	mov	edx, DWORD PTR _updobjtyp$[ebp]
	movsx	eax, BYTE PTR [edx]
	test	eax, eax
	jne	SHORT $L70243
	mov	DWORD PTR _updobjtyp$[ebp], OFFSET FLAT:$SG70244
$L70243:

; 66   : 
; 67   : 	/* Handle save before */
; 68   : 	if(b_savetodb)

	cmp	DWORD PTR _b_savetodb$[ebp], 0
	je	SHORT $L70249

; 70   : 		int b_done = BUTN_SAVE_NEXT;

	mov	DWORD PTR _b_done$70246[ebp], 1

; 71   : 		if(form_save_dialog(cntxt, i_ctrl, confirm, BUTN_SAVE_NEXT, &b_done)) STACK_ERROR;

	lea	ecx, DWORD PTR _b_done$70246[ebp]
	push	ecx
	push	1
	mov	edx, DWORD PTR _confirm$[ebp]
	push	edx
	mov	eax, DWORD PTR _i_ctrl$[ebp]
	push	eax
	mov	ecx, DWORD PTR _cntxt$[ebp]
	push	ecx
	call	_form_save_dialog
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L70247
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 71		; 00000047H
	jmp	$eva_err$70248
$L70247:

; 72   : 		if(b_done != BUTN_SAVE_NEXT) RETURN_OK;

	cmp	DWORD PTR _b_done$70246[ebp], 1
	je	SHORT $L70249
	jmp	$eva_noerr$70250
$L70249:

; 74   : 	curobj = DYNTAB_TOUL(&cntxt->form->id_obj);

	push	10					; 0000000aH
	push	0
	push	0
	push	0
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	ecx, DWORD PTR [eax+80]
	add	ecx, 32					; 00000020H
	push	ecx
	call	_dyntab_val
	add	esp, 12					; 0000000cH
	push	eax
	call	_strtoul
	add	esp, 12					; 0000000cH
	mov	DWORD PTR _curobj$[ebp], eax

; 75   : 
; 76   : 	/* Read list of objects to uppdate */
; 77   : 	CTRL_ATTR(updfield, UPDATE_OBJFIELD);

	lea	edx, DWORD PTR _updfield$[ebp]
	push	edx
	call	_dyntab_free
	add	esp, 4
	push	0
	push	-1
	push	OFFSET FLAT:$SG70254
	mov	eax, DWORD PTR _ctrl$[ebp]
	add	eax, 44					; 0000002cH
	push	eax
	push	0
	lea	ecx, DWORD PTR _updfield$[ebp]
	push	ecx
	call	_dyntab_filter_field
	add	esp, 24					; 00000018H
	test	eax, eax
	je	SHORT $L70253
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29872], OFFSET FLAT:$SG70256
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 77		; 0000004dH
	jmp	$eva_err$70248
$L70253:

; 78   : 	if(strcmp(updobjtyp, "_EVA_CURRENTOBJ") || curobj || updfield.nbrows)

	push	OFFSET FLAT:$SG70259
	mov	ecx, DWORD PTR _updobjtyp$[ebp]
	push	ecx
	call	_strcmp
	add	esp, 8
	test	eax, eax
	jne	SHORT $L70258
	cmp	DWORD PTR _curobj$[ebp], 0
	jne	SHORT $L70258
	cmp	DWORD PTR _updfield$[ebp], 0
	je	$L70257
$L70258:

; 80   : 		if(!strcmp(updobjtyp, "_EVA_FILTER"))

	push	OFFSET FLAT:$SG70261
	mov	edx, DWORD PTR _updobjtyp$[ebp]
	push	edx
	call	_strcmp
	add	esp, 8
	test	eax, eax
	jne	SHORT $L70260

; 82   : 			CTRL_ATTR(listobj, FILTERS);

	lea	eax, DWORD PTR _listobj$[ebp]
	push	eax
	call	_dyntab_free
	add	esp, 4
	push	0
	push	-1
	push	OFFSET FLAT:$SG70264
	mov	ecx, DWORD PTR _ctrl$[ebp]
	add	ecx, 44					; 0000002cH
	push	ecx
	push	0
	lea	edx, DWORD PTR _listobj$[ebp]
	push	edx
	call	_dyntab_filter_field
	add	esp, 24					; 00000018H
	test	eax, eax
	je	SHORT $L70263
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29872], OFFSET FLAT:$SG70266
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 82		; 00000052H
	jmp	$eva_err$70248
$L70263:

; 83   : 			if(!listobj.nbrows) RETURN_WARNING("No filter given : UPDATE operation ignored for button");

	cmp	DWORD PTR _listobj$[ebp], 0
	jne	SHORT $L70267
	push	0
	push	0
	push	53					; 00000035H
	push	OFFSET FLAT:$SG70269
	mov	edx, DWORD PTR _cntxt$[ebp]
	add	edx, 29864				; 000074a8H
	push	edx
	call	_dynbuf_add
	add	esp, 20					; 00000014H
	jmp	$eva_noerr$70250
$L70267:

; 85   : 		else CTRL_ATTR(listobj, LISTOBJ);

	jmp	SHORT $L70272
$L70260:
	lea	eax, DWORD PTR _listobj$[ebp]
	push	eax
	call	_dyntab_free
	add	esp, 4
	push	0
	push	-1
	push	OFFSET FLAT:$SG70273
	mov	ecx, DWORD PTR _ctrl$[ebp]
	add	ecx, 44					; 0000002cH
	push	ecx
	push	0
	lea	edx, DWORD PTR _listobj$[ebp]
	push	edx
	call	_dyntab_filter_field
	add	esp, 24					; 00000018H
	test	eax, eax
	je	SHORT $L70272
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29872], OFFSET FLAT:$SG70275
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 85		; 00000055H
	jmp	$eva_err$70248
$L70272:

; 86   : 		if(ctrl_eval_valtyp(cntxt, ctrl, &updobj, updobjtyp, &listobj, &updfield)) STACK_ERROR;

	lea	edx, DWORD PTR _updfield$[ebp]
	push	edx
	lea	eax, DWORD PTR _listobj$[ebp]
	push	eax
	mov	ecx, DWORD PTR _updobjtyp$[ebp]
	push	ecx
	lea	edx, DWORD PTR _updobj$[ebp]
	push	edx
	mov	eax, DWORD PTR _ctrl$[ebp]
	push	eax
	mov	ecx, DWORD PTR _cntxt$[ebp]
	push	ecx
	call	_ctrl_eval_valtyp
	add	esp, 24					; 00000018H
	test	eax, eax
	je	SHORT $L70276
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 86		; 00000056H
	jmp	$eva_err$70248
$L70276:

; 87   : 		if(!updobj.nbrows > 1000) RETURN_WARNING("Too many objects selected (over 1000) : UPDATE operation ignored for button");

	xor	eax, eax
	cmp	DWORD PTR _updobj$[ebp], 0
	sete	al
	cmp	eax, 1000				; 000003e8H
	jle	SHORT $L70277
	push	0
	push	0
	push	75					; 0000004bH
	push	OFFSET FLAT:$SG70279
	mov	ecx, DWORD PTR _cntxt$[ebp]
	add	ecx, 29864				; 000074a8H
	push	ecx
	call	_dynbuf_add
	add	esp, 20					; 00000014H
	jmp	$eva_noerr$70250
$L70277:

; 89   :   	else DYNTAB_ADD_STR(&updobj, 0, 0, "0");

	jmp	SHORT $L70281
$L70257:
	push	1
	push	OFFSET FLAT:$SG70282
	push	0
	push	0
	lea	edx, DWORD PTR _updobj$[ebp]
	push	edx
	call	_dyntab_set_txt
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L70281
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29872], OFFSET FLAT:$SG70284
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 89		; 00000059H
	jmp	$eva_err$70248
$L70281:

; 90   : 
; 91   : 	/* Read update parameters */
; 92   : 	CTRL_ATTR_TAB(destfield, DESTFIELD);

	lea	edx, DWORD PTR _destfield$[ebp]
	push	edx
	call	_dyntab_free
	add	esp, 4
	push	0
	push	-1
	push	OFFSET FLAT:$SG70287
	mov	eax, DWORD PTR _ctrl$[ebp]
	add	eax, 44					; 0000002cH
	push	eax
	push	0
	lea	ecx, DWORD PTR _destfield$[ebp]
	push	ecx
	call	_dyntab_filter_field
	add	esp, 24					; 00000018H
	test	eax, eax
	je	SHORT $L70286
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29872], OFFSET FLAT:$SG70289
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 92		; 0000005cH
	jmp	$eva_err$70248
$L70286:
	lea	ecx, DWORD PTR _destfield$[ebp]
	push	ecx
	call	_dyntab_order_lines
	add	esp, 4
	test	eax, eax
	je	SHORT $L70290
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29872], OFFSET FLAT:$SG70292
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 92		; 0000005cH
	jmp	$eva_err$70248
$L70290:

; 93   : 	CTRL_ATTR_TAB(srctype, SRCTYPE);

	lea	ecx, DWORD PTR _srctype$[ebp]
	push	ecx
	call	_dyntab_free
	add	esp, 4
	push	0
	push	-1
	push	OFFSET FLAT:$SG70295
	mov	edx, DWORD PTR _ctrl$[ebp]
	add	edx, 44					; 0000002cH
	push	edx
	push	0
	lea	eax, DWORD PTR _srctype$[ebp]
	push	eax
	call	_dyntab_filter_field
	add	esp, 24					; 00000018H
	test	eax, eax
	je	SHORT $L70294
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29872], OFFSET FLAT:$SG70297
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 93		; 0000005dH
	jmp	$eva_err$70248
$L70294:
	lea	eax, DWORD PTR _srctype$[ebp]
	push	eax
	call	_dyntab_order_lines
	add	esp, 4
	test	eax, eax
	je	SHORT $L70298
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29872], OFFSET FLAT:$SG70300
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 93		; 0000005dH
	jmp	$eva_err$70248
$L70298:

; 94   : 	CTRL_ATTR_TAB(srcvalobj, SRCLISTOBJ);

	lea	eax, DWORD PTR _srcvalobj$[ebp]
	push	eax
	call	_dyntab_free
	add	esp, 4
	push	0
	push	-1
	push	OFFSET FLAT:$SG70303
	mov	ecx, DWORD PTR _ctrl$[ebp]
	add	ecx, 44					; 0000002cH
	push	ecx
	push	0
	lea	edx, DWORD PTR _srcvalobj$[ebp]
	push	edx
	call	_dyntab_filter_field
	add	esp, 24					; 00000018H
	test	eax, eax
	je	SHORT $L70302
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29872], OFFSET FLAT:$SG70305
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 94		; 0000005eH
	jmp	$eva_err$70248
$L70302:
	lea	edx, DWORD PTR _srcvalobj$[ebp]
	push	edx
	call	_dyntab_order_lines
	add	esp, 4
	test	eax, eax
	je	SHORT $L70306
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29872], OFFSET FLAT:$SG70308
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 94		; 0000005eH
	jmp	$eva_err$70248
$L70306:

; 95   : 	CTRL_ATTR_TAB(srcval, SRCFIELD);

	lea	edx, DWORD PTR _srcval$[ebp]
	push	edx
	call	_dyntab_free
	add	esp, 4
	push	0
	push	-1
	push	OFFSET FLAT:$SG70311
	mov	eax, DWORD PTR _ctrl$[ebp]
	add	eax, 44					; 0000002cH
	push	eax
	push	0
	lea	ecx, DWORD PTR _srcval$[ebp]
	push	ecx
	call	_dyntab_filter_field
	add	esp, 24					; 00000018H
	test	eax, eax
	je	SHORT $L70310
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29872], OFFSET FLAT:$SG70313
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 95		; 0000005fH
	jmp	$eva_err$70248
$L70310:
	lea	ecx, DWORD PTR _srcval$[ebp]
	push	ecx
	call	_dyntab_order_lines
	add	esp, 4
	test	eax, eax
	je	SHORT $L70314
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29872], OFFSET FLAT:$SG70316
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 95		; 0000005fH
	jmp	$eva_err$70248
$L70314:

; 96   : 	CTRL_ATTR_TAB(setmode, SET_MODE);

	lea	ecx, DWORD PTR _setmode$[ebp]
	push	ecx
	call	_dyntab_free
	add	esp, 4
	push	0
	push	-1
	push	OFFSET FLAT:$SG70319
	mov	edx, DWORD PTR _ctrl$[ebp]
	add	edx, 44					; 0000002cH
	push	edx
	push	0
	lea	eax, DWORD PTR _setmode$[ebp]
	push	eax
	call	_dyntab_filter_field
	add	esp, 24					; 00000018H
	test	eax, eax
	je	SHORT $L70318
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29872], OFFSET FLAT:$SG70321
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 96		; 00000060H
	jmp	$eva_err$70248
$L70318:
	lea	eax, DWORD PTR _setmode$[ebp]
	push	eax
	call	_dyntab_order_lines
	add	esp, 4
	test	eax, eax
	je	SHORT $L70322
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29872], OFFSET FLAT:$SG70324
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 96		; 00000060H
	jmp	$eva_err$70248
$L70322:

; 97   : 	CTRL_ATTR_TAB(userel, DEST_RELMODE);

	lea	eax, DWORD PTR _userel$[ebp]
	push	eax
	call	_dyntab_free
	add	esp, 4
	push	0
	push	-1
	push	OFFSET FLAT:$SG70327
	mov	ecx, DWORD PTR _ctrl$[ebp]
	add	ecx, 44					; 0000002cH
	push	ecx
	push	0
	lea	edx, DWORD PTR _userel$[ebp]
	push	edx
	call	_dyntab_filter_field
	add	esp, 24					; 00000018H
	test	eax, eax
	je	SHORT $L70326
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29872], OFFSET FLAT:$SG70329
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 97		; 00000061H
	jmp	$eva_err$70248
$L70326:
	lea	edx, DWORD PTR _userel$[ebp]
	push	edx
	call	_dyntab_order_lines
	add	esp, 4
	test	eax, eax
	je	SHORT $L70330
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29872], OFFSET FLAT:$SG70332
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 97		; 00000061H
	jmp	$eva_err$70248
$L70330:

; 98   : 	CTRL_ATTR_TAB(debug, DEBUG_SQL_EXPR);

	lea	edx, DWORD PTR _debug$[ebp]
	push	edx
	call	_dyntab_free
	add	esp, 4
	push	0
	push	-1
	push	OFFSET FLAT:$SG70335
	mov	eax, DWORD PTR _ctrl$[ebp]
	add	eax, 44					; 0000002cH
	push	eax
	push	0
	lea	ecx, DWORD PTR _debug$[ebp]
	push	ecx
	call	_dyntab_filter_field
	add	esp, 24					; 00000018H
	test	eax, eax
	je	SHORT $L70334
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29872], OFFSET FLAT:$SG70337
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 98		; 00000062H
	jmp	$eva_err$70248
$L70334:
	lea	ecx, DWORD PTR _debug$[ebp]
	push	ecx
	call	_dyntab_order_lines
	add	esp, 4
	test	eax, eax
	je	SHORT $L70338
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29872], OFFSET FLAT:$SG70340
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 98		; 00000062H
	jmp	$eva_err$70248
$L70338:

; 99   : 
; 100  : 	/* For each destination field */
; 101  : 	for(i = 0; i < destfield.nbrows; i++)

	mov	DWORD PTR _i$[ebp], 0
	jmp	SHORT $L70341
$L70342:
	mov	ecx, DWORD PTR _i$[ebp]
	add	ecx, 1
	mov	DWORD PTR _i$[ebp], ecx
$L70341:
	mov	edx, DWORD PTR _i$[ebp]
	cmp	edx, DWORD PTR _destfield$[ebp]
	jae	$L70343

; 103  : 		/* Read source value / expression  for this destination field */
; 104  : 		unsigned long idfield = dyntab_cell(&destfield, i, 0)->IdValue;

	push	0
	mov	eax, DWORD PTR _i$[ebp]
	push	eax
	lea	ecx, DWORD PTR _destfield$[ebp]
	push	ecx
	call	_dyntab_cell
	add	esp, 12					; 0000000cH
	mov	edx, DWORD PTR [eax+32]
	mov	DWORD PTR _idfield$70344[ebp], edx

; 105  : 		char *mode = dyntab_val(&setmode, i, 0);

	push	0
	mov	eax, DWORD PTR _i$[ebp]
	push	eax
	lea	ecx, DWORD PTR _setmode$[ebp]
	push	ecx
	call	_dyntab_val
	add	esp, 12					; 0000000cH
	mov	DWORD PTR _mode$70345[ebp], eax

; 106  : 		char *typ = dyntab_val(&srctype, i, 0);

	push	0
	mov	edx, DWORD PTR _i$[ebp]
	push	edx
	lea	eax, DWORD PTR _srctype$[ebp]
	push	eax
	call	_dyntab_val
	add	esp, 12					; 0000000cH
	mov	DWORD PTR _typ$70346[ebp], eax

; 107  : 		int b_same = !strcmp(typ, "_EVA_DESTOBJ");

	push	OFFSET FLAT:$SG70348
	mov	ecx, DWORD PTR _typ$70346[ebp]
	push	ecx
	call	_strcmp
	add	esp, 8
	neg	eax
	sbb	eax, eax
	inc	eax
	mov	DWORD PTR _b_same$70347[ebp], eax

; 108  : 
; 109  : 		/* Handle debug */
; 110  : 		cntxt->sql_trace = dyntab_sz(&debug, i, 0) ? 2 : 0;

	push	0
	mov	edx, DWORD PTR _i$[ebp]
	push	edx
	lea	eax, DWORD PTR _debug$[ebp]
	push	eax
	call	_dyntab_sz
	add	esp, 12					; 0000000cH
	neg	eax
	sbb	eax, eax
	and	eax, 2
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29852], eax

; 111  : 
; 112  : 		/* Evaluate source expression on source object if not destination object */
; 113  : 		if(!b_same)

	cmp	DWORD PTR _b_same$70347[ebp], 0
	jne	$L70349

; 115  : 			DYNTAB_FREE(values);

	lea	edx, DWORD PTR _values$[ebp]
	push	edx
	call	_dyntab_free
	add	esp, 4

; 116  : 			DYNTAB_FREE(listobj);

	lea	eax, DWORD PTR _listobj$[ebp]
	push	eax
	call	_dyntab_free
	add	esp, 4

; 117  : 			for(j = 0; j < srcvalobj.nbcols; j++)

	mov	DWORD PTR _j$[ebp], 0
	jmp	SHORT $L70350
$L70351:
	mov	ecx, DWORD PTR _j$[ebp]
	add	ecx, 1
	mov	DWORD PTR _j$[ebp], ecx
$L70350:
	mov	edx, DWORD PTR _j$[ebp]
	cmp	edx, DWORD PTR _srcvalobj$[ebp+8]
	jae	SHORT $L70352

; 118  : 				if(dyntab_sz(&srcvalobj, i, j))

	mov	eax, DWORD PTR _j$[ebp]
	push	eax
	mov	ecx, DWORD PTR _i$[ebp]
	push	ecx
	lea	edx, DWORD PTR _srcvalobj$[ebp]
	push	edx
	call	_dyntab_sz
	add	esp, 12					; 0000000cH
	test	eax, eax
	je	SHORT $L70354

; 119  : 					DYNTAB_SET_CELL(&listobj, listobj.nbrows, 0, &srcvalobj, i, j);

	push	0
	mov	eax, DWORD PTR _j$[ebp]
	push	eax
	mov	ecx, DWORD PTR _i$[ebp]
	push	ecx
	lea	edx, DWORD PTR _srcvalobj$[ebp]
	push	edx
	call	_dyntab_cell
	add	esp, 12					; 0000000cH
	push	eax
	push	0
	mov	eax, DWORD PTR _listobj$[ebp]
	push	eax
	lea	ecx, DWORD PTR _listobj$[ebp]
	push	ecx
	call	_dyntab_copy
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L70354
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29872], OFFSET FLAT:$SG70356
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 119		; 00000077H
	jmp	$eva_err$70248
$L70354:
	jmp	$L70351
$L70352:

; 120  : 			for(j = 0; j < srcval.nbcols; j++)

	mov	DWORD PTR _j$[ebp], 0
	jmp	SHORT $L70357
$L70358:
	mov	ecx, DWORD PTR _j$[ebp]
	add	ecx, 1
	mov	DWORD PTR _j$[ebp], ecx
$L70357:
	mov	edx, DWORD PTR _j$[ebp]
	cmp	edx, DWORD PTR _srcval$[ebp+8]
	jae	$L70359

; 121  : 				if(dyntab_sz(&srcval, i, j))

	mov	eax, DWORD PTR _j$[ebp]
	push	eax
	mov	ecx, DWORD PTR _i$[ebp]
	push	ecx
	lea	edx, DWORD PTR _srcval$[ebp]
	push	edx
	call	_dyntab_sz
	add	esp, 12					; 0000000cH
	test	eax, eax
	je	SHORT $L70361

; 122  : 					DYNTAB_ADD_CELL(&values, values.nbrows, 0, &srcval, i, j);

	push	1
	mov	eax, DWORD PTR _j$[ebp]
	push	eax
	mov	ecx, DWORD PTR _i$[ebp]
	push	ecx
	lea	edx, DWORD PTR _srcval$[ebp]
	push	edx
	call	_dyntab_cell
	add	esp, 12					; 0000000cH
	push	eax
	push	0
	mov	eax, DWORD PTR _values$[ebp]
	push	eax
	lea	ecx, DWORD PTR _values$[ebp]
	push	ecx
	call	_dyntab_copy
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L70361
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29872], OFFSET FLAT:$SG70363
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 122		; 0000007aH
	jmp	$eva_err$70248
$L70361:
	jmp	$L70358
$L70359:

; 123  : 			if(ctrl_eval_valtyp(cntxt, ctrl, &tmpval, typ, &listobj, &values)) CLEAR_ERROR_CONT;

	lea	ecx, DWORD PTR _values$[ebp]
	push	ecx
	lea	edx, DWORD PTR _listobj$[ebp]
	push	edx
	mov	eax, DWORD PTR _typ$70346[ebp]
	push	eax
	lea	ecx, DWORD PTR _tmpval$[ebp]
	push	ecx
	mov	edx, DWORD PTR _ctrl$[ebp]
	push	edx
	mov	eax, DWORD PTR _cntxt$[ebp]
	push	eax
	call	_ctrl_eval_valtyp
	add	esp, 24					; 00000018H
	test	eax, eax
	je	SHORT $L70364
	push	123					; 0000007bH
	push	OFFSET FLAT:$SG70365
	push	OFFSET FLAT:$SG70366
	mov	ecx, DWORD PTR _cntxt$[ebp]
	push	ecx
	call	_err_clear
	add	esp, 16					; 00000010H
	jmp	$L70342
$L70364:

; 125  : 		else

	jmp	SHORT $L70369
$L70349:

; 127  : 			/* Optimize variable evaluation */
; 128  : 			M_FREE(expr);

	mov	edx, DWORD PTR _expr$[ebp]
	push	edx
	call	_mem_free
	add	esp, 4
	mov	DWORD PTR _expr$[ebp], 0

; 129  : 			if(qry_eval_sqlexpr_var(cntxt, &expr, dyntab_val(&srcval, i, 0), &ctrl->attr, NULL)) STACK_ERROR;

	push	0
	mov	eax, DWORD PTR _ctrl$[ebp]
	add	eax, 44					; 0000002cH
	push	eax
	push	0
	mov	ecx, DWORD PTR _i$[ebp]
	push	ecx
	lea	edx, DWORD PTR _srcval$[ebp]
	push	edx
	call	_dyntab_val
	add	esp, 12					; 0000000cH
	push	eax
	lea	eax, DWORD PTR _expr$[ebp]
	push	eax
	mov	ecx, DWORD PTR _cntxt$[ebp]
	push	ecx
	call	_qry_eval_sqlexpr_var
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L70369
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 129		; 00000081H
	jmp	$eva_err$70248
$L70369:

; 131  : 
; 132  : 		/* For each object to update */
; 133  : 		if(tmpval.nbrows || !strcmp("_EVA_REPLACE", mode) || b_same)

	cmp	DWORD PTR _tmpval$[ebp], 0
	jne	SHORT $L70371
	mov	eax, DWORD PTR _mode$70345[ebp]
	push	eax
	push	OFFSET FLAT:$SG70372
	call	_strcmp
	add	esp, 8
	test	eax, eax
	je	SHORT $L70371
	cmp	DWORD PTR _b_same$70347[ebp], 0
	je	$L70375
$L70371:

; 134  : 			for(j = 0; j < updobj.nbrows; j++)

	mov	DWORD PTR _j$[ebp], 0
	jmp	SHORT $L70373
$L70374:
	mov	ecx, DWORD PTR _j$[ebp]
	add	ecx, 1
	mov	DWORD PTR _j$[ebp], ecx
$L70373:
	mov	edx, DWORD PTR _j$[ebp]
	cmp	edx, DWORD PTR _updobj$[ebp]
	jae	$L70375

; 136  : 				unsigned long idobj = DYNTAB_TOULRC(&updobj, j, 0);

	push	10					; 0000000aH
	push	0
	push	0
	mov	eax, DWORD PTR _j$[ebp]
	push	eax
	lea	ecx, DWORD PTR _updobj$[ebp]
	push	ecx
	call	_dyntab_val
	add	esp, 12					; 0000000cH
	push	eax
	call	_strtoul
	add	esp, 12					; 0000000cH
	mov	DWORD PTR _idobj$70376[ebp], eax

; 137  : 				unsigned long k, num = 0, line= 0;

	mov	DWORD PTR _num$70379[ebp], 0
	mov	DWORD PTR _line$70380[ebp], 0

; 138  : 
; 139  : 				/* Evaluate source expression on destination object */
; 140  : 				if(b_same && form_eval_fieldexpr(cntxt, &tmpval, 0, idobj, DYNBUF_VAL_SZ(expr), NULL, 0)) CLEAR_ERROR_CONT;

	cmp	DWORD PTR _b_same$70347[ebp], 0
	je	$L70383
	cmp	DWORD PTR _expr$[ebp], 0
	je	SHORT $L70461
	mov	edx, DWORD PTR _expr$[ebp]
	mov	eax, DWORD PTR [edx+4]
	mov	DWORD PTR -384+[ebp], eax
	jmp	SHORT $L70462
$L70461:
	mov	DWORD PTR -384+[ebp], 0
$L70462:
	cmp	DWORD PTR _expr$[ebp], 0
	je	SHORT $L70463
	mov	ecx, DWORD PTR _expr$[ebp]
	add	ecx, 8
	mov	DWORD PTR -388+[ebp], ecx
	jmp	SHORT $L70464
$L70463:
	mov	DWORD PTR -388+[ebp], 0
$L70464:
	push	0
	push	0
	mov	edx, DWORD PTR -384+[ebp]
	push	edx
	mov	eax, DWORD PTR -388+[ebp]
	push	eax
	mov	ecx, DWORD PTR _idobj$70376[ebp]
	push	ecx
	push	0
	lea	edx, DWORD PTR _tmpval$[ebp]
	push	edx
	mov	eax, DWORD PTR _cntxt$[ebp]
	push	eax
	call	_form_eval_fieldexpr
	add	esp, 32					; 00000020H
	test	eax, eax
	je	SHORT $L70383
	push	140					; 0000008cH
	push	OFFSET FLAT:$SG70384
	push	OFFSET FLAT:$SG70385
	mov	ecx, DWORD PTR _cntxt$[ebp]
	push	ecx
	call	_err_clear
	add	esp, 16					; 00000010H
	jmp	$L70374
$L70383:

; 141  : 
; 142  : 				/* Handle destination values indexes if add line mode */
; 143  : 				if(!strcmp(mode, "_EVA_ADD_LINE"))

	push	OFFSET FLAT:$SG70387
	mov	edx, DWORD PTR _mode$70345[ebp]
	push	edx
	call	_strcmp
	add	esp, 8
	test	eax, eax
	jne	$L70397

; 145  : 					/* Get values for destination field in destination object */
; 146  : 					if(form_get_field_values(cntxt, &curval, dyntab_val(&destfield, i, 0),
; 147  : 											idobj == curobj ? curform : 0, idobj)) STACK_ERROR;

	mov	eax, DWORD PTR _idobj$70376[ebp]
	push	eax
	mov	ecx, DWORD PTR _idobj$70376[ebp]
	sub	ecx, DWORD PTR _curobj$[ebp]
	neg	ecx
	sbb	ecx, ecx
	not	ecx
	and	ecx, DWORD PTR _curform$[ebp]
	push	ecx
	push	0
	mov	edx, DWORD PTR _i$[ebp]
	push	edx
	lea	eax, DWORD PTR _destfield$[ebp]
	push	eax
	call	_dyntab_val
	add	esp, 12					; 0000000cH
	push	eax
	lea	ecx, DWORD PTR _curval$[ebp]
	push	ecx
	mov	edx, DWORD PTR _cntxt$[ebp]
	push	edx
	call	_form_get_field_values
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L70388
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 147		; 00000093H
	jmp	$eva_err$70248
$L70388:

; 148  : 					for(k = 0; k < curval.nbrows; k++)

	mov	DWORD PTR _k$70378[ebp], 0
	jmp	SHORT $L70389
$L70390:
	mov	ecx, DWORD PTR _k$70378[ebp]
	add	ecx, 1
	mov	DWORD PTR _k$70378[ebp], ecx
$L70389:
	mov	edx, DWORD PTR _k$70378[ebp]
	cmp	edx, DWORD PTR _curval$[ebp]
	jae	SHORT $L70391

; 150  : 						DynTableCell *c = dyntab_cell(&curval, k, 0);

	push	0
	mov	eax, DWORD PTR _k$70378[ebp]
	push	eax
	lea	ecx, DWORD PTR _curval$[ebp]
	push	ecx
	call	_dyntab_cell
	add	esp, 12					; 0000000cH
	mov	DWORD PTR _c$70392[ebp], eax

; 151  : 						if(c->Line > line) line = c->Line;

	mov	edx, DWORD PTR _c$70392[ebp]
	mov	eax, DWORD PTR [edx+40]
	cmp	eax, DWORD PTR _line$70380[ebp]
	jbe	SHORT $L70393
	mov	ecx, DWORD PTR _c$70392[ebp]
	mov	edx, DWORD PTR [ecx+40]
	mov	DWORD PTR _line$70380[ebp], edx
$L70393:

; 152  : 						if(c->Num > num) num = c->Num;

	mov	eax, DWORD PTR _c$70392[ebp]
	mov	ecx, DWORD PTR [eax+36]
	cmp	ecx, DWORD PTR _num$70379[ebp]
	jbe	SHORT $L70394
	mov	edx, DWORD PTR _c$70392[ebp]
	mov	eax, DWORD PTR [edx+36]
	mov	DWORD PTR _num$70379[ebp], eax
$L70394:

; 153  : 					}

	jmp	SHORT $L70390
$L70391:

; 154  : 
; 155  : 					/* Set values indexes */
; 156  : 					for(k = 0; k < tmpval.nbrows; k++)

	mov	DWORD PTR _k$70378[ebp], 0
	jmp	SHORT $L70395
$L70396:
	mov	ecx, DWORD PTR _k$70378[ebp]
	add	ecx, 1
	mov	DWORD PTR _k$70378[ebp], ecx
$L70395:
	mov	edx, DWORD PTR _k$70378[ebp]
	cmp	edx, DWORD PTR _tmpval$[ebp]
	jae	SHORT $L70397

; 158  : 						DynTableCell *c = dyntab_cell(&tmpval, k, 0);

	push	0
	mov	eax, DWORD PTR _k$70378[ebp]
	push	eax
	lea	ecx, DWORD PTR _tmpval$[ebp]
	push	ecx
	call	_dyntab_cell
	add	esp, 12					; 0000000cH
	mov	DWORD PTR _c$70398[ebp], eax

; 159  : 						c->Num = 1;

	mov	edx, DWORD PTR _c$70398[ebp]
	mov	DWORD PTR [edx+36], 1

; 160  : 						c->Line = line + k + 1;

	mov	eax, DWORD PTR _k$70378[ebp]
	mov	ecx, DWORD PTR _line$70380[ebp]
	lea	edx, DWORD PTR [ecx+eax+1]
	mov	eax, DWORD PTR _c$70398[ebp]
	mov	DWORD PTR [eax+40], edx

; 161  : 					}

	jmp	SHORT $L70396
$L70397:

; 163  : 
; 164  : 				/* Set values format as applicable */
; 165  : 				if(*dyntab_val(&userel, i, 0))

	push	0
	mov	ecx, DWORD PTR _i$[ebp]
	push	ecx
	lea	edx, DWORD PTR _userel$[ebp]
	push	edx
	call	_dyntab_val
	add	esp, 12					; 0000000cH
	movsx	eax, BYTE PTR [eax]
	test	eax, eax
	je	$L70404

; 167  : 					char *v = dyntab_val(&userel, i, 0), *tmp;

	push	0
	mov	ecx, DWORD PTR _i$[ebp]
	push	ecx
	lea	edx, DWORD PTR _userel$[ebp]
	push	edx
	call	_dyntab_val
	add	esp, 12					; 0000000cH
	mov	DWORD PTR _v$70400[ebp], eax

; 168  : 					for(k = 0; k < tmpval.nbrows; k++)

	mov	DWORD PTR _k$70378[ebp], 0
	jmp	SHORT $L70402
$L70403:
	mov	eax, DWORD PTR _k$70378[ebp]
	add	eax, 1
	mov	DWORD PTR _k$70378[ebp], eax
$L70402:
	mov	ecx, DWORD PTR _k$70378[ebp]
	cmp	ecx, DWORD PTR _tmpval$[ebp]
	jae	$L70404

; 170  : 						DynTableCell *c =  dyntab_cell(&tmpval, k, 0);

	push	0
	mov	edx, DWORD PTR _k$70378[ebp]
	push	edx
	lea	eax, DWORD PTR _tmpval$[ebp]
	push	eax
	call	_dyntab_cell
	add	esp, 12					; 0000000cH
	mov	DWORD PTR _c$70405[ebp], eax

; 171  : 						switch(*v)
; 172  : 						{

	mov	ecx, DWORD PTR _v$70400[ebp]
	mov	dl, BYTE PTR [ecx]
	mov	BYTE PTR -392+[ebp], dl
	cmp	BYTE PTR -392+[ebp], 49			; 00000031H
	je	SHORT $L70410
	cmp	BYTE PTR -392+[ebp], 50			; 00000032H
	je	SHORT $L70411
	jmp	$L70407
$L70410:

; 173  : 						case '1':
; 174  : 							c->b_relation = 1;

	mov	eax, DWORD PTR _c$70405[ebp]
	mov	BYTE PTR [eax+12], 1

; 175  : 							break;

	jmp	$L70407
$L70411:

; 176  : 						case '2':
; 177  : 							tmp = input_to_number(c->txt);

	mov	ecx, DWORD PTR _c$70405[ebp]
	mov	edx, DWORD PTR [ecx]
	push	edx
	call	_input_to_number
	add	esp, 4
	mov	DWORD PTR _tmp$70401[ebp], eax

; 178  : 							if(strcmp(tmp, c->txt)) DYNTAB_ADD(&tmpval, k, 0, tmp, strlen(tmp), NO_CONV);

	mov	eax, DWORD PTR _c$70405[ebp]
	mov	ecx, DWORD PTR [eax]
	push	ecx
	mov	edx, DWORD PTR _tmp$70401[ebp]
	push	edx
	call	_strcmp
	add	esp, 8
	test	eax, eax
	je	SHORT $L70414
	push	0
	push	0
	mov	eax, DWORD PTR _tmp$70401[ebp]
	push	eax
	call	_strlen
	add	esp, 4
	push	eax
	mov	ecx, DWORD PTR _tmp$70401[ebp]
	push	ecx
	push	0
	mov	edx, DWORD PTR _k$70378[ebp]
	push	edx
	lea	eax, DWORD PTR _tmpval$[ebp]
	push	eax
	call	_dyntab_add
	add	esp, 28					; 0000001cH
	test	eax, eax
	je	SHORT $L70414
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29872], OFFSET FLAT:$SG70416
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 178		; 000000b2H
	jmp	$eva_err$70248
$L70414:
$L70407:

; 181  : 					}

	jmp	$L70403
$L70404:

; 183  : 
; 184  : 				/* If object was saved or is not current object */
; 185  : 				if((b_savetodb || idobj != curobj) && strcmp(dyntab_val(&destfield, i, 0), "_EVA_SELTAB"))

	cmp	DWORD PTR _b_savetodb$[ebp], 0
	jne	SHORT $L70418
	mov	eax, DWORD PTR _idobj$70376[ebp]
	cmp	eax, DWORD PTR _curobj$[ebp]
	je	$L70417
$L70418:
	push	OFFSET FLAT:$SG70419
	push	0
	mov	ecx, DWORD PTR _i$[ebp]
	push	ecx
	lea	edx, DWORD PTR _destfield$[ebp]
	push	edx
	call	_dyntab_val
	add	esp, 12					; 0000000cH
	push	eax
	call	_strcmp
	add	esp, 8
	test	eax, eax
	je	$L70417

; 187  : 					/* Update data base */
; 188  : 					if(qry_update_idobj_idfield(cntxt, idobj, idfield, &tmpval,
; 189  : 							!strcmp("_EVA_REPLACE", mode) ? 3 : !strcmp("_EVA_ADD", mode) ? 0 : !strcmp("_EVA_REMOVE", mode) ? 5 : 1))

	mov	eax, DWORD PTR _mode$70345[ebp]
	push	eax
	push	OFFSET FLAT:$SG70421
	call	_strcmp
	add	esp, 8
	test	eax, eax
	jne	SHORT $L70467
	mov	DWORD PTR -396+[ebp], 3
	jmp	SHORT $L70468
$L70467:
	mov	ecx, DWORD PTR _mode$70345[ebp]
	push	ecx
	push	OFFSET FLAT:$SG70422
	call	_strcmp
	add	esp, 8
	test	eax, eax
	jne	SHORT $L70465
	mov	DWORD PTR -400+[ebp], 0
	jmp	SHORT $L70466
$L70465:
	mov	edx, DWORD PTR _mode$70345[ebp]
	push	edx
	push	OFFSET FLAT:$SG70423
	call	_strcmp
	add	esp, 8
	neg	eax
	sbb	eax, eax
	and	al, -4					; fffffffcH
	add	eax, 5
	mov	DWORD PTR -400+[ebp], eax
$L70466:
	mov	eax, DWORD PTR -400+[ebp]
	mov	DWORD PTR -396+[ebp], eax
$L70468:
	mov	ecx, DWORD PTR -396+[ebp]
	push	ecx
	lea	edx, DWORD PTR _tmpval$[ebp]
	push	edx
	mov	eax, DWORD PTR _idfield$70344[ebp]
	push	eax
	mov	ecx, DWORD PTR _idobj$70376[ebp]
	push	ecx
	mov	edx, DWORD PTR _cntxt$[ebp]
	push	edx
	call	_qry_update_idobj_idfield
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L70420

; 190  : 						STACK_ERROR;

	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 190		; 000000beH
	jmp	$eva_err$70248
$L70420:

; 192  : 				else 

	jmp	$L70426
$L70417:

; 193  : 					/* Update CGI data */
; 194  : 					if(cgi_set_field_values(cntxt,
; 195  : 							DYNTAB_TOUL(&cntxt->form->id_form), idobj,
; 196  : 							DYNTAB_VAL_SZ(&destfield, i, 0), 
; 197  : 							&tmpval, mode, 0))

	push	0
	mov	ecx, DWORD PTR _mode$70345[ebp]
	push	ecx
	lea	edx, DWORD PTR _tmpval$[ebp]
	push	edx
	push	0
	mov	eax, DWORD PTR _i$[ebp]
	push	eax
	lea	ecx, DWORD PTR _destfield$[ebp]
	push	ecx
	call	_dyntab_sz
	add	esp, 12					; 0000000cH
	push	eax
	push	0
	mov	edx, DWORD PTR _i$[ebp]
	push	edx
	lea	eax, DWORD PTR _destfield$[ebp]
	push	eax
	call	_dyntab_val
	add	esp, 12					; 0000000cH
	push	eax
	mov	ecx, DWORD PTR _idobj$70376[ebp]
	push	ecx
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
	push	eax
	mov	ecx, DWORD PTR _cntxt$[ebp]
	push	ecx
	call	_cgi_set_field_values
	add	esp, 32					; 00000020H
	test	eax, eax
	je	SHORT $L70426

; 198  : 						CLEAR_ERROR;

	push	198					; 000000c6H
	push	OFFSET FLAT:$SG70427
	push	OFFSET FLAT:$SG70428
	mov	edx, DWORD PTR _cntxt$[ebp]
	push	edx
	call	_err_clear
	add	esp, 16					; 00000010H
$L70426:

; 199  : 			}

	jmp	$L70374
$L70375:

; 200  : 	}

	jmp	$L70342
$L70343:

; 201  : 
; 202  : 	if(!*after || !strcmp(after, "_EVA_NONE"))

	mov	eax, DWORD PTR _after$[ebp]
	movsx	ecx, BYTE PTR [eax]
	test	ecx, ecx
	je	SHORT $L70430
	push	OFFSET FLAT:$SG70431
	mov	edx, DWORD PTR _after$[ebp]
	push	edx
	call	_strcmp
	add	esp, 8
	test	eax, eax
	jne	SHORT $L70429
$L70430:

; 204  : 		if(!b_savetodb) form->nextstep = HtmlEdit;

	cmp	DWORD PTR _b_savetodb$[ebp], 0
	jne	SHORT $L70432
	mov	eax, DWORD PTR _form$[ebp]
	mov	DWORD PTR [eax+172], 4
$L70432:

; 206  : 	else if(!strcmp(after, "_EVA_CLOSE"))

	jmp	$L70443
$L70429:
	push	OFFSET FLAT:$SG70435
	mov	ecx, DWORD PTR _after$[ebp]
	push	ecx
	call	_strcmp
	add	esp, 8
	test	eax, eax
	jne	SHORT $L70434

; 208  : 		if(form_close_nosave(cntxt, DYNTAB_TOUL(&form->id_form), DYNTAB_TOUL(&form->id_obj), NULL)) STACK_ERROR;

	push	0
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
	push	eax
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
	push	eax
	mov	ecx, DWORD PTR _cntxt$[ebp]
	push	ecx
	call	_form_close_nosave
	add	esp, 16					; 00000010H
	test	eax, eax
	je	SHORT $L70439
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 208		; 000000d0H
	jmp	SHORT $eva_err$70248
$L70439:

; 210  : 	else if(!strcmp(after, "_EVA_ACTION"))

	jmp	SHORT $L70443
$L70434:
	push	OFFSET FLAT:$SG70442
	mov	eax, DWORD PTR _after$[ebp]
	push	eax
	call	_strcmp
	add	esp, 8
	test	eax, eax
	jne	SHORT $L70443

; 212  : 		if(action_sequence(cntxt, i_ctrl)) STACK_ERROR;

	mov	ecx, DWORD PTR _i_ctrl$[ebp]
	push	ecx
	mov	edx, DWORD PTR _cntxt$[ebp]
	push	edx
	call	_action_sequence
	add	esp, 8
	test	eax, eax
	je	SHORT $L70443
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 212		; 000000d4H
	jmp	SHORT $eva_err$70248
$L70443:

; 214  : 	form->b_reload = 1;

	mov	ecx, DWORD PTR _form$[ebp]
	mov	DWORD PTR [ecx+140], 1
$eva_noerr$70250:

; 215  : 
; 216  : 	RETURN_OK_CLEANUP;

	push	0
	push	OFFSET FLAT:$SG70444
	push	OFFSET FLAT:$SG70445
	mov	edx, DWORD PTR _cntxt$[ebp]
	push	edx
	call	_err_clear
	add	esp, 16					; 00000010H
$eva_err$70248:
	mov	eax, DWORD PTR _cntxt$[ebp]
	cmp	DWORD PTR [eax+29872], 0
	je	SHORT $L70446
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	edx, DWORD PTR [ecx+29900]
	push	edx
	push	OFFSET FLAT:$SG70447
	push	OFFSET FLAT:$SG70448
	mov	eax, DWORD PTR _cntxt$[ebp]
	push	eax
	call	_err_add_context
	add	esp, 16					; 00000010H
$L70446:
	lea	ecx, DWORD PTR _destfield$[ebp]
	push	ecx
	call	_dyntab_free
	add	esp, 4
	lea	edx, DWORD PTR _srctype$[ebp]
	push	edx
	call	_dyntab_free
	add	esp, 4
	lea	eax, DWORD PTR _srcvalobj$[ebp]
	push	eax
	call	_dyntab_free
	add	esp, 4
	lea	ecx, DWORD PTR _srcval$[ebp]
	push	ecx
	call	_dyntab_free
	add	esp, 4
	lea	edx, DWORD PTR _setmode$[ebp]
	push	edx
	call	_dyntab_free
	add	esp, 4
	lea	eax, DWORD PTR _userel$[ebp]
	push	eax
	call	_dyntab_free
	add	esp, 4
	lea	ecx, DWORD PTR _values$[ebp]
	push	ecx
	call	_dyntab_free
	add	esp, 4
	lea	edx, DWORD PTR _debug$[ebp]
	push	edx
	call	_dyntab_free
	add	esp, 4
	lea	eax, DWORD PTR _updobj$[ebp]
	push	eax
	call	_dyntab_free
	add	esp, 4
	lea	ecx, DWORD PTR _updfield$[ebp]
	push	ecx
	call	_dyntab_free
	add	esp, 4
	lea	edx, DWORD PTR _listobj$[ebp]
	push	edx
	call	_dyntab_free
	add	esp, 4
	lea	eax, DWORD PTR _tmpval$[ebp]
	push	eax
	call	_dyntab_free
	add	esp, 4
	lea	ecx, DWORD PTR _curval$[ebp]
	push	ecx
	call	_dyntab_free
	add	esp, 4
	mov	edx, DWORD PTR _expr$[ebp]
	push	edx
	call	_mem_free
	add	esp, 4
	mov	DWORD PTR _expr$[ebp], 0
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	ecx, DWORD PTR _sql_trace$[ebp]
	mov	DWORD PTR [eax+29852], ecx
	mov	edx, DWORD PTR _cntxt$[ebp]
	xor	eax, eax
	cmp	DWORD PTR [edx+29872], 0
	setne	al

; 217  : }

	mov	esp, ebp
	pop	ebp
	ret	0
_action_update ENDP
_TEXT	ENDS
END
