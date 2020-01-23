	TITLE	D:\Travail\ABI\EVA\V4.0\CGI\Brunix-2016\action_misc.c
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
PUBLIC	_action_openform
EXTRN	_ctrl_eval_fieldexpr:NEAR
EXTRN	_form_set_values:NEAR
EXTRN	_ctrl_eval_valtyp:NEAR
EXTRN	_form_load_from_ctrl:NEAR
EXTRN	_atoi:NEAR
EXTRN	_mem_free:NEAR
EXTRN	_strtoul:NEAR
EXTRN	_qry_obj_field:NEAR
EXTRN	_ctrl_read_baseobj:NEAR
EXTRN	_dyntab_free:NEAR
EXTRN	_dyntab_sz:NEAR
EXTRN	_dyntab_val:NEAR
EXTRN	_dyntab_cell:NEAR
EXTRN	_qry_cache_idobj_field:NEAR
EXTRN	_dyntab_copy:NEAR
EXTRN	_dyntab_add:NEAR
EXTRN	_strcmp:NEAR
EXTRN	_qry_eval_sqlexpr_var:NEAR
EXTRN	_err_add_context:NEAR
EXTRN	_err_clear:NEAR
EXTRN	_dyntab_filter_field:NEAR
EXTRN	_dyntab_field_val:NEAR
EXTRN	_dyntab_order_lines:NEAR
EXTRN	_form_btn_do_save:NEAR
_BSS	SEGMENT
$SG70225 DB	01H DUP (?)
	ALIGN	4

$SG70228 DB	01H DUP (?)
	ALIGN	4

$SG70231 DB	01H DUP (?)
	ALIGN	4

$SG70238 DB	01H DUP (?)
	ALIGN	4

$SG70248 DB	01H DUP (?)
_BSS	ENDS
_DATA	SEGMENT
$SG70224 DB	'_EVA_OPENFORM_TYPE', 00H
	ORG $+1
$SG70227 DB	'_EVA_OPENOBJ_TYPE', 00H
	ORG $+2
$SG70230 DB	'_EVA_ALTFORM', 00H
	ORG $+3
$SG70237 DB	'_EVA_OPEN_MODE', 00H
	ORG $+1
$SG70245 DB	'_EVA_CURRENT', 00H
	ORG $+3
$SG70247 DB	'_EVA_SRCFIELD', 00H
	ORG $+2
$SG70251 DB	'D:\Travail\ABI\EVA\V4.0\CGI\Brunix-2016\action_misc.c', 00H
	ORG $+2
$SG70252 DB	'action_openform', 00H
$SG70256 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70260 DB	'_EVA_OPENFORM', 00H
	ORG $+2
$SG70262 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70266 DB	'_EVA_OPENFIELD', 00H
	ORG $+1
$SG70268 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70271 DB	'_EVA_LISTOBJ', 00H
	ORG $+3
$SG70273 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70275 DB	'D:\Travail\ABI\EVA\V4.0\CGI\Brunix-2016\action_misc.c', 00H
	ORG $+2
$SG70276 DB	'action_openform', 00H
$SG70283 DB	'_EVA_FORMSTAMP', 00H
	ORG $+1
$SG70286 DB	'_EVA_DESTFIELD', 00H
	ORG $+1
$SG70288 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70291 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70294 DB	'_EVA_SRCTYPE', 00H
	ORG $+3
$SG70296 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70299 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70302 DB	'_EVA_SRCLISTOBJ', 00H
$SG70304 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70307 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70310 DB	'_EVA_SRCFIELD', 00H
	ORG $+2
$SG70312 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70315 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70318 DB	'_EVA_SET_MODE', 00H
	ORG $+2
$SG70320 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70323 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70326 DB	'_EVA_DEBUG_SQL_EXPR', 00H
$SG70328 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70331 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70345 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70352 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70358 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70363 DB	'D:\Travail\ABI\EVA\V4.0\CGI\Brunix-2016\action_misc.c', 00H
	ORG $+2
$SG70364 DB	'action_openform', 00H
$SG70367 DB	'_EVA_COPY_FIELDS', 00H
	ORG $+3
$SG70369 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70372 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70383 DB	'_EVA_FIELD', 00H
	ORG $+1
$SG70385 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70390 DB	'_EVA_REPLACE', 00H
	ORG $+3
$SG70391 DB	'_EVA_CURRENTOBJ', 00H
$SG70392 DB	'D:\Travail\ABI\EVA\V4.0\CGI\Brunix-2016\action_misc.c', 00H
	ORG $+2
$SG70393 DB	'action_openform', 00H
$SG70395 DB	'_EVA_BOTTOM', 00H
$SG70398 DB	'_EVA_TOP', 00H
	ORG $+3
$SG70401 DB	'_EVA_REUSE', 00H
	ORG $+1
$SG70407 DB	'D:\Travail\ABI\EVA\V4.0\CGI\Brunix-2016\action_misc.c', 00H
	ORG $+2
$SG70408 DB	'action_openform', 00H
$SG70410 DB	'D:\Travail\ABI\EVA\V4.0\CGI\Brunix-2016\action_misc.c', 00H
	ORG $+2
$SG70411 DB	'action_openform', 00H
_DATA	ENDS
_TEXT	SEGMENT
_cntxt$ = 8
_i_ctrl$ = 12
_form$ = -44
_ctrl$ = -228
_id_form$ = -20
_id_obj$ = -76
_destfield$ = -40
_srctype$ = -248
_srcobj$ = -176
_srcval$ = -156
_setmode$ = -224
_lineobj$ = -124
_lineval$ = -104
_debug$ = -204
_expr$ = -56
_formtype$ = -48
_objtype$ = -184
_altform$ = -136
_i$ = -84
_j$ = -132
_loc$ = -80
_b_edit$ = -52
_openmode$ = -180
_b_done$ = -128
_srcfield$70246 = -252
_c$70336 = -260
_sql_trace$70337 = -256
_row$70342 = -264
_idfield$70376 = -268
_action_openform PROC NEAR

; 34   : ){

	push	ebp
	mov	ebp, esp
	sub	esp, 296				; 00000128H

; 35   : 	EVA_form *form = cntxt->form;

	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	ecx, DWORD PTR [eax+80]
	mov	DWORD PTR _form$[ebp], ecx

; 36   : 	EVA_ctrl *ctrl = form->ctrl + i_ctrl;

	mov	edx, DWORD PTR _i_ctrl$[ebp]
	imul	edx, 480				; 000001e0H
	mov	eax, DWORD PTR _form$[ebp]
	mov	ecx, DWORD PTR [eax]
	add	ecx, edx
	mov	DWORD PTR _ctrl$[ebp], ecx

; 37   : 	DynTable id_form = { 0 };

	mov	DWORD PTR _id_form$[ebp], 0
	xor	edx, edx
	mov	DWORD PTR _id_form$[ebp+4], edx
	mov	DWORD PTR _id_form$[ebp+8], edx
	mov	DWORD PTR _id_form$[ebp+12], edx
	mov	DWORD PTR _id_form$[ebp+16], edx

; 38   : 	DynTable id_obj = { 0 };

	mov	DWORD PTR _id_obj$[ebp], 0
	xor	eax, eax
	mov	DWORD PTR _id_obj$[ebp+4], eax
	mov	DWORD PTR _id_obj$[ebp+8], eax
	mov	DWORD PTR _id_obj$[ebp+12], eax
	mov	DWORD PTR _id_obj$[ebp+16], eax

; 39   : 	DynTable destfield = { 0 };

	mov	DWORD PTR _destfield$[ebp], 0
	xor	ecx, ecx
	mov	DWORD PTR _destfield$[ebp+4], ecx
	mov	DWORD PTR _destfield$[ebp+8], ecx
	mov	DWORD PTR _destfield$[ebp+12], ecx
	mov	DWORD PTR _destfield$[ebp+16], ecx

; 40   : 	DynTable srctype = { 0 };

	mov	DWORD PTR _srctype$[ebp], 0
	xor	edx, edx
	mov	DWORD PTR _srctype$[ebp+4], edx
	mov	DWORD PTR _srctype$[ebp+8], edx
	mov	DWORD PTR _srctype$[ebp+12], edx
	mov	DWORD PTR _srctype$[ebp+16], edx

; 41   : 	DynTable srcobj = { 0 };

	mov	DWORD PTR _srcobj$[ebp], 0
	xor	eax, eax
	mov	DWORD PTR _srcobj$[ebp+4], eax
	mov	DWORD PTR _srcobj$[ebp+8], eax
	mov	DWORD PTR _srcobj$[ebp+12], eax
	mov	DWORD PTR _srcobj$[ebp+16], eax

; 42   : 	DynTable srcval = { 0 };

	mov	DWORD PTR _srcval$[ebp], 0
	xor	ecx, ecx
	mov	DWORD PTR _srcval$[ebp+4], ecx
	mov	DWORD PTR _srcval$[ebp+8], ecx
	mov	DWORD PTR _srcval$[ebp+12], ecx
	mov	DWORD PTR _srcval$[ebp+16], ecx

; 43   : 	DynTable setmode = { 0 };

	mov	DWORD PTR _setmode$[ebp], 0
	xor	edx, edx
	mov	DWORD PTR _setmode$[ebp+4], edx
	mov	DWORD PTR _setmode$[ebp+8], edx
	mov	DWORD PTR _setmode$[ebp+12], edx
	mov	DWORD PTR _setmode$[ebp+16], edx

; 44   : 	DynTable lineobj = { 0 };

	mov	DWORD PTR _lineobj$[ebp], 0
	xor	eax, eax
	mov	DWORD PTR _lineobj$[ebp+4], eax
	mov	DWORD PTR _lineobj$[ebp+8], eax
	mov	DWORD PTR _lineobj$[ebp+12], eax
	mov	DWORD PTR _lineobj$[ebp+16], eax

; 45   : 	DynTable lineval = { 0 };

	mov	DWORD PTR _lineval$[ebp], 0
	xor	ecx, ecx
	mov	DWORD PTR _lineval$[ebp+4], ecx
	mov	DWORD PTR _lineval$[ebp+8], ecx
	mov	DWORD PTR _lineval$[ebp+12], ecx
	mov	DWORD PTR _lineval$[ebp+16], ecx

; 46   : 	DynTable debug = { 0 };

	mov	DWORD PTR _debug$[ebp], 0
	xor	edx, edx
	mov	DWORD PTR _debug$[ebp+4], edx
	mov	DWORD PTR _debug$[ebp+8], edx
	mov	DWORD PTR _debug$[ebp+12], edx
	mov	DWORD PTR _debug$[ebp+16], edx

; 47   : 	DynBuffer *expr = NULL;

	mov	DWORD PTR _expr$[ebp], 0

; 48   : 	char *formtype = CTRL_ATTR_VAL(OPENFORM_TYPE);

	cmp	DWORD PTR _ctrl$[ebp], 0
	je	SHORT $L70902
	push	0
	push	-1
	push	OFFSET FLAT:$SG70224
	mov	eax, DWORD PTR _ctrl$[ebp]
	add	eax, 44					; 0000002cH
	push	eax
	call	_dyntab_field_val
	add	esp, 16					; 00000010H
	mov	DWORD PTR -272+[ebp], eax
	jmp	SHORT $L70903
$L70902:
	mov	DWORD PTR -272+[ebp], OFFSET FLAT:$SG70225
$L70903:
	mov	ecx, DWORD PTR -272+[ebp]
	mov	DWORD PTR _formtype$[ebp], ecx

; 49   : 	char *objtype = CTRL_ATTR_VAL(OPENOBJ_TYPE);

	cmp	DWORD PTR _ctrl$[ebp], 0
	je	SHORT $L70904
	push	0
	push	-1
	push	OFFSET FLAT:$SG70227
	mov	edx, DWORD PTR _ctrl$[ebp]
	add	edx, 44					; 0000002cH
	push	edx
	call	_dyntab_field_val
	add	esp, 16					; 00000010H
	mov	DWORD PTR -276+[ebp], eax
	jmp	SHORT $L70905
$L70904:
	mov	DWORD PTR -276+[ebp], OFFSET FLAT:$SG70228
$L70905:
	mov	eax, DWORD PTR -276+[ebp]
	mov	DWORD PTR _objtype$[ebp], eax

; 50   : 	char *altform = CTRL_ATTR_VAL(ALTFORM);

	cmp	DWORD PTR _ctrl$[ebp], 0
	je	SHORT $L70906
	push	0
	push	-1
	push	OFFSET FLAT:$SG70230
	mov	ecx, DWORD PTR _ctrl$[ebp]
	add	ecx, 44					; 0000002cH
	push	ecx
	call	_dyntab_field_val
	add	esp, 16					; 00000010H
	mov	DWORD PTR -280+[ebp], eax
	jmp	SHORT $L70907
$L70906:
	mov	DWORD PTR -280+[ebp], OFFSET FLAT:$SG70231
$L70907:
	mov	edx, DWORD PTR -280+[ebp]
	mov	DWORD PTR _altform$[ebp], edx

; 51   : 	unsigned long i, j;
; 52   : 	int loc = 0, b_edit, openmode = atoi(CTRL_ATTR_VAL(OPEN_MODE));

	mov	DWORD PTR _loc$[ebp], 0
	cmp	DWORD PTR _ctrl$[ebp], 0
	je	SHORT $L70908
	push	0
	push	-1
	push	OFFSET FLAT:$SG70237
	mov	eax, DWORD PTR _ctrl$[ebp]
	add	eax, 44					; 0000002cH
	push	eax
	call	_dyntab_field_val
	add	esp, 16					; 00000010H
	mov	DWORD PTR -284+[ebp], eax
	jmp	SHORT $L70909
$L70908:
	mov	DWORD PTR -284+[ebp], OFFSET FLAT:$SG70238
$L70909:
	mov	ecx, DWORD PTR -284+[ebp]
	push	ecx
	call	_atoi
	add	esp, 4
	mov	DWORD PTR _openmode$[ebp], eax

; 53   : 
; 54   : 	/* Handle save before */
; 55   : 	int b_done = 0;

	mov	DWORD PTR _b_done$[ebp], 0

; 56   : 	if(form_btn_do_save(cntxt, i_ctrl, &b_done)) STACK_ERROR;

	lea	edx, DWORD PTR _b_done$[ebp]
	push	edx
	mov	eax, DWORD PTR _i_ctrl$[ebp]
	push	eax
	mov	ecx, DWORD PTR _cntxt$[ebp]
	push	ecx
	call	_form_btn_do_save
	add	esp, 12					; 0000000cH
	test	eax, eax
	je	SHORT $L70240
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 56		; 00000038H
	jmp	$eva_err$70241
$L70240:

; 57   : 	if(!b_done) RETURN_OK;

	cmp	DWORD PTR _b_done$[ebp], 0
	jne	SHORT $L70242
	jmp	$eva_noerr$70243
$L70242:

; 58   : 	form = cntxt->form;

	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	ecx, DWORD PTR [eax+80]
	mov	DWORD PTR _form$[ebp], ecx

; 59   : 	ctrl = form->ctrl + i_ctrl;

	mov	edx, DWORD PTR _i_ctrl$[ebp]
	imul	edx, 480				; 000001e0H
	mov	eax, DWORD PTR _form$[ebp]
	mov	ecx, DWORD PTR [eax]
	add	ecx, edx
	mov	DWORD PTR _ctrl$[ebp], ecx

; 60   : 
; 61   : 	/* Select opened form */
; 62   : 	if(!strcmp("_EVA_CURRENT", formtype))

	mov	edx, DWORD PTR _formtype$[ebp]
	push	edx
	push	OFFSET FLAT:$SG70245
	call	_strcmp
	add	esp, 8
	test	eax, eax
	jne	$L70244

; 64   : 		char *srcfield = CTRL_ATTR_VAL(SRCFIELD);

	cmp	DWORD PTR _ctrl$[ebp], 0
	je	SHORT $L70910
	push	0
	push	-1
	push	OFFSET FLAT:$SG70247
	mov	eax, DWORD PTR _ctrl$[ebp]
	add	eax, 44					; 0000002cH
	push	eax
	call	_dyntab_field_val
	add	esp, 16					; 00000010H
	mov	DWORD PTR -288+[ebp], eax
	jmp	SHORT $L70911
$L70910:
	mov	DWORD PTR -288+[ebp], OFFSET FLAT:$SG70248
$L70911:
	mov	ecx, DWORD PTR -288+[ebp]
	mov	DWORD PTR _srcfield$70246[ebp], ecx

; 65   : 		if(*srcfield)

	mov	edx, DWORD PTR _srcfield$70246[ebp]
	movsx	eax, BYTE PTR [edx]
	test	eax, eax
	je	SHORT $L70249

; 67   : 			if(ctrl_eval_fieldexpr(cntxt, ctrl, &id_form, srcfield)) CLEAR_ERROR;

	mov	ecx, DWORD PTR _srcfield$70246[ebp]
	push	ecx
	lea	edx, DWORD PTR _id_form$[ebp]
	push	edx
	mov	eax, DWORD PTR _ctrl$[ebp]
	push	eax
	mov	ecx, DWORD PTR _cntxt$[ebp]
	push	ecx
	call	_ctrl_eval_fieldexpr
	add	esp, 16					; 00000010H
	test	eax, eax
	je	SHORT $L70250
	push	67					; 00000043H
	push	OFFSET FLAT:$SG70251
	push	OFFSET FLAT:$SG70252
	mov	edx, DWORD PTR _cntxt$[ebp]
	push	edx
	call	_err_clear
	add	esp, 16					; 00000010H
$L70250:

; 69   : 		else

	jmp	SHORT $L70254
$L70249:

; 70   : 			DYNTAB_ADD_CELL(&id_form, 0, 0, &form->id_obj, 0, 0);

	push	1
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
	lea	ecx, DWORD PTR _id_form$[ebp]
	push	ecx
	call	_dyntab_copy
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L70254
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29872], OFFSET FLAT:$SG70256
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 70		; 00000046H
	jmp	$eva_err$70241
$L70254:

; 72   : 	else

	jmp	SHORT $L70259
$L70244:

; 74   : 		CTRL_ATTR(id_form, OPENFORM);

	lea	ecx, DWORD PTR _id_form$[ebp]
	push	ecx
	call	_dyntab_free
	add	esp, 4
	push	0
	push	-1
	push	OFFSET FLAT:$SG70260
	mov	edx, DWORD PTR _ctrl$[ebp]
	add	edx, 44					; 0000002cH
	push	edx
	push	0
	lea	eax, DWORD PTR _id_form$[ebp]
	push	eax
	call	_dyntab_filter_field
	add	esp, 24					; 00000018H
	test	eax, eax
	je	SHORT $L70259
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29872], OFFSET FLAT:$SG70262
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 74		; 0000004aH
	jmp	$eva_err$70241
$L70259:

; 76   : 
; 77   : 	/* Select opened object */
; 78   : 	if(*objtype)

	mov	eax, DWORD PTR _objtype$[ebp]
	movsx	ecx, BYTE PTR [eax]
	test	ecx, ecx
	je	$L70279

; 80   : 		CTRL_ATTR(srcval, OPENFIELD);

	lea	edx, DWORD PTR _srcval$[ebp]
	push	edx
	call	_dyntab_free
	add	esp, 4
	push	0
	push	-1
	push	OFFSET FLAT:$SG70266
	mov	eax, DWORD PTR _ctrl$[ebp]
	add	eax, 44					; 0000002cH
	push	eax
	push	0
	lea	ecx, DWORD PTR _srcval$[ebp]
	push	ecx
	call	_dyntab_filter_field
	add	esp, 24					; 00000018H
	test	eax, eax
	je	SHORT $L70265
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29872], OFFSET FLAT:$SG70268
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 80		; 00000050H
	jmp	$eva_err$70241
$L70265:

; 81   : 		CTRL_ATTR(srcobj, LISTOBJ);

	lea	ecx, DWORD PTR _srcobj$[ebp]
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
	lea	eax, DWORD PTR _srcobj$[ebp]
	push	eax
	call	_dyntab_filter_field
	add	esp, 24					; 00000018H
	test	eax, eax
	je	SHORT $L70270
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29872], OFFSET FLAT:$SG70273
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 81		; 00000051H
	jmp	$eva_err$70241
$L70270:

; 82   : 		if(ctrl_eval_valtyp(cntxt, ctrl, &id_obj, objtype, &srcobj, &srcval)) CLEAR_ERROR;

	lea	eax, DWORD PTR _srcval$[ebp]
	push	eax
	lea	ecx, DWORD PTR _srcobj$[ebp]
	push	ecx
	mov	edx, DWORD PTR _objtype$[ebp]
	push	edx
	lea	eax, DWORD PTR _id_obj$[ebp]
	push	eax
	mov	ecx, DWORD PTR _ctrl$[ebp]
	push	ecx
	mov	edx, DWORD PTR _cntxt$[ebp]
	push	edx
	call	_ctrl_eval_valtyp
	add	esp, 24					; 00000018H
	test	eax, eax
	je	SHORT $L70274
	push	82					; 00000052H
	push	OFFSET FLAT:$SG70275
	push	OFFSET FLAT:$SG70276
	mov	eax, DWORD PTR _cntxt$[ebp]
	push	eax
	call	_err_clear
	add	esp, 16					; 00000010H
$L70274:

; 83   : 		if(id_obj.nbrows > 1) id_obj.nbrows = 1;

	cmp	DWORD PTR _id_obj$[ebp], 1
	jbe	SHORT $L70277
	mov	DWORD PTR _id_obj$[ebp], 1
$L70277:

; 84   : 		if(!DYNTAB_TOUL(&id_obj)) DYNTAB_FREE(id_obj);

	push	10					; 0000000aH
	push	0
	push	0
	push	0
	lea	ecx, DWORD PTR _id_obj$[ebp]
	push	ecx
	call	_dyntab_val
	add	esp, 12					; 0000000cH
	push	eax
	call	_strtoul
	add	esp, 12					; 0000000cH
	test	eax, eax
	jne	SHORT $L70279
	lea	edx, DWORD PTR _id_obj$[ebp]
	push	edx
	call	_dyntab_free
	add	esp, 4
$L70279:

; 86   : 
; 87   : 	/* Return if no form for object */
; 88   : 	if(!dyntab_sz(&id_obj, 0, 0) && !dyntab_sz(&id_form, 0, 0)) RETURN_OK;

	push	0
	push	0
	lea	eax, DWORD PTR _id_obj$[ebp]
	push	eax
	call	_dyntab_sz
	add	esp, 12					; 0000000cH
	test	eax, eax
	jne	SHORT $L70280
	push	0
	push	0
	lea	ecx, DWORD PTR _id_form$[ebp]
	push	ecx
	call	_dyntab_sz
	add	esp, 12					; 0000000cH
	test	eax, eax
	jne	SHORT $L70280
	jmp	$eva_noerr$70243
$L70280:

; 89   : 
; 90   : 	/* Set default form if none specified */
; 91   : 	if(!id_form.nbrows && qry_obj_field(cntxt, &id_form, DYNTAB_TOUL(&id_obj), "_EVA_FORMSTAMP")) STACK_ERROR;

	cmp	DWORD PTR _id_form$[ebp], 0
	jne	SHORT $L70282
	push	OFFSET FLAT:$SG70283
	push	10					; 0000000aH
	push	0
	push	0
	push	0
	lea	edx, DWORD PTR _id_obj$[ebp]
	push	edx
	call	_dyntab_val
	add	esp, 12					; 0000000cH
	push	eax
	call	_strtoul
	add	esp, 12					; 0000000cH
	push	eax
	lea	eax, DWORD PTR _id_form$[ebp]
	push	eax
	mov	ecx, DWORD PTR _cntxt$[ebp]
	push	ecx
	call	_qry_obj_field
	add	esp, 16					; 00000010H
	test	eax, eax
	je	SHORT $L70282
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 91		; 0000005bH
	jmp	$eva_err$70241
$L70282:

; 92   : 
; 93   : 	/* Set initial values */
; 94   : 	CTRL_ATTR_TAB(destfield, DESTFIELD);

	lea	eax, DWORD PTR _destfield$[ebp]
	push	eax
	call	_dyntab_free
	add	esp, 4
	push	0
	push	-1
	push	OFFSET FLAT:$SG70286
	mov	ecx, DWORD PTR _ctrl$[ebp]
	add	ecx, 44					; 0000002cH
	push	ecx
	push	0
	lea	edx, DWORD PTR _destfield$[ebp]
	push	edx
	call	_dyntab_filter_field
	add	esp, 24					; 00000018H
	test	eax, eax
	je	SHORT $L70285
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29872], OFFSET FLAT:$SG70288
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 94		; 0000005eH
	jmp	$eva_err$70241
$L70285:
	lea	edx, DWORD PTR _destfield$[ebp]
	push	edx
	call	_dyntab_order_lines
	add	esp, 4
	test	eax, eax
	je	SHORT $L70289
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29872], OFFSET FLAT:$SG70291
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 94		; 0000005eH
	jmp	$eva_err$70241
$L70289:

; 95   : 	b_edit = destfield.nbrows > 0;

	xor	edx, edx
	cmp	edx, DWORD PTR _destfield$[ebp]
	sbb	eax, eax
	neg	eax
	mov	DWORD PTR _b_edit$[ebp], eax

; 96   : 	CTRL_ATTR_TAB(srctype, SRCTYPE);

	lea	ecx, DWORD PTR _srctype$[ebp]
	push	ecx
	call	_dyntab_free
	add	esp, 4
	push	0
	push	-1
	push	OFFSET FLAT:$SG70294
	mov	edx, DWORD PTR _ctrl$[ebp]
	add	edx, 44					; 0000002cH
	push	edx
	push	0
	lea	eax, DWORD PTR _srctype$[ebp]
	push	eax
	call	_dyntab_filter_field
	add	esp, 24					; 00000018H
	test	eax, eax
	je	SHORT $L70293
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29872], OFFSET FLAT:$SG70296
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 96		; 00000060H
	jmp	$eva_err$70241
$L70293:
	lea	eax, DWORD PTR _srctype$[ebp]
	push	eax
	call	_dyntab_order_lines
	add	esp, 4
	test	eax, eax
	je	SHORT $L70297
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29872], OFFSET FLAT:$SG70299
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 96		; 00000060H
	jmp	$eva_err$70241
$L70297:

; 97   : 	CTRL_ATTR_TAB(srcobj, SRCLISTOBJ);

	lea	eax, DWORD PTR _srcobj$[ebp]
	push	eax
	call	_dyntab_free
	add	esp, 4
	push	0
	push	-1
	push	OFFSET FLAT:$SG70302
	mov	ecx, DWORD PTR _ctrl$[ebp]
	add	ecx, 44					; 0000002cH
	push	ecx
	push	0
	lea	edx, DWORD PTR _srcobj$[ebp]
	push	edx
	call	_dyntab_filter_field
	add	esp, 24					; 00000018H
	test	eax, eax
	je	SHORT $L70301
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29872], OFFSET FLAT:$SG70304
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 97		; 00000061H
	jmp	$eva_err$70241
$L70301:
	lea	edx, DWORD PTR _srcobj$[ebp]
	push	edx
	call	_dyntab_order_lines
	add	esp, 4
	test	eax, eax
	je	SHORT $L70305
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29872], OFFSET FLAT:$SG70307
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 97		; 00000061H
	jmp	$eva_err$70241
$L70305:

; 98   : 	CTRL_ATTR_TAB(srcval, SRCFIELD);

	lea	edx, DWORD PTR _srcval$[ebp]
	push	edx
	call	_dyntab_free
	add	esp, 4
	push	0
	push	-1
	push	OFFSET FLAT:$SG70310
	mov	eax, DWORD PTR _ctrl$[ebp]
	add	eax, 44					; 0000002cH
	push	eax
	push	0
	lea	ecx, DWORD PTR _srcval$[ebp]
	push	ecx
	call	_dyntab_filter_field
	add	esp, 24					; 00000018H
	test	eax, eax
	je	SHORT $L70309
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29872], OFFSET FLAT:$SG70312
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 98		; 00000062H
	jmp	$eva_err$70241
$L70309:
	lea	ecx, DWORD PTR _srcval$[ebp]
	push	ecx
	call	_dyntab_order_lines
	add	esp, 4
	test	eax, eax
	je	SHORT $L70313
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29872], OFFSET FLAT:$SG70315
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 98		; 00000062H
	jmp	$eva_err$70241
$L70313:

; 99   : 	CTRL_ATTR_TAB(setmode, SET_MODE);

	lea	ecx, DWORD PTR _setmode$[ebp]
	push	ecx
	call	_dyntab_free
	add	esp, 4
	push	0
	push	-1
	push	OFFSET FLAT:$SG70318
	mov	edx, DWORD PTR _ctrl$[ebp]
	add	edx, 44					; 0000002cH
	push	edx
	push	0
	lea	eax, DWORD PTR _setmode$[ebp]
	push	eax
	call	_dyntab_filter_field
	add	esp, 24					; 00000018H
	test	eax, eax
	je	SHORT $L70317
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29872], OFFSET FLAT:$SG70320
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 99		; 00000063H
	jmp	$eva_err$70241
$L70317:
	lea	eax, DWORD PTR _setmode$[ebp]
	push	eax
	call	_dyntab_order_lines
	add	esp, 4
	test	eax, eax
	je	SHORT $L70321
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29872], OFFSET FLAT:$SG70323
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 99		; 00000063H
	jmp	$eva_err$70241
$L70321:

; 100  : 	CTRL_ATTR_TAB(debug, DEBUG_SQL_EXPR);

	lea	eax, DWORD PTR _debug$[ebp]
	push	eax
	call	_dyntab_free
	add	esp, 4
	push	0
	push	-1
	push	OFFSET FLAT:$SG70326
	mov	ecx, DWORD PTR _ctrl$[ebp]
	add	ecx, 44					; 0000002cH
	push	ecx
	push	0
	lea	edx, DWORD PTR _debug$[ebp]
	push	edx
	call	_dyntab_filter_field
	add	esp, 24					; 00000018H
	test	eax, eax
	je	SHORT $L70325
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29872], OFFSET FLAT:$SG70328
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 100		; 00000064H
	jmp	$eva_err$70241
$L70325:
	lea	edx, DWORD PTR _debug$[ebp]
	push	edx
	call	_dyntab_order_lines
	add	esp, 4
	test	eax, eax
	je	SHORT $L70329
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29872], OFFSET FLAT:$SG70331
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 100		; 00000064H
	jmp	$eva_err$70241
$L70329:

; 101  : 	for(i = 0; i < destfield.nbrows; i++)

	mov	DWORD PTR _i$[ebp], 0
	jmp	SHORT $L70332
$L70333:
	mov	edx, DWORD PTR _i$[ebp]
	add	edx, 1
	mov	DWORD PTR _i$[ebp], edx
$L70332:
	mov	eax, DWORD PTR _i$[ebp]
	cmp	eax, DWORD PTR _destfield$[ebp]
	jae	$L70334

; 102  : 		if(dyntab_sz(&destfield, i, 0))

	push	0
	mov	ecx, DWORD PTR _i$[ebp]
	push	ecx
	lea	edx, DWORD PTR _destfield$[ebp]
	push	edx
	call	_dyntab_sz
	add	esp, 12					; 0000000cH
	test	eax, eax
	je	$L70335

; 104  : 			DynTableCell *c;
; 105  : 			int sql_trace = cntxt->sql_trace;

	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	ecx, DWORD PTR [eax+29852]
	mov	DWORD PTR _sql_trace$70337[ebp], ecx

; 106  : 			dyntab_free(&lineobj);

	lea	edx, DWORD PTR _lineobj$[ebp]
	push	edx
	call	_dyntab_free
	add	esp, 4

; 107  : 			for(j = 0; j < srcobj.nbcols; j++) if(dyntab_sz(&srcobj, i, j))

	mov	DWORD PTR _j$[ebp], 0
	jmp	SHORT $L70338
$L70339:
	mov	eax, DWORD PTR _j$[ebp]
	add	eax, 1
	mov	DWORD PTR _j$[ebp], eax
$L70338:
	mov	ecx, DWORD PTR _j$[ebp]
	cmp	ecx, DWORD PTR _srcobj$[ebp+8]
	jae	$L70340
	mov	edx, DWORD PTR _j$[ebp]
	push	edx
	mov	eax, DWORD PTR _i$[ebp]
	push	eax
	lea	ecx, DWORD PTR _srcobj$[ebp]
	push	ecx
	call	_dyntab_sz
	add	esp, 12					; 0000000cH
	test	eax, eax
	je	$L70341

; 109  : 				unsigned long row = lineobj.nbrows;

	mov	edx, DWORD PTR _lineobj$[ebp]
	mov	DWORD PTR _row$70342[ebp], edx

; 110  : 				DYNTAB_SET_CELL(&lineobj, row, 0, &srcobj, i, j);

	push	0
	mov	eax, DWORD PTR _j$[ebp]
	push	eax
	mov	ecx, DWORD PTR _i$[ebp]
	push	ecx
	lea	edx, DWORD PTR _srcobj$[ebp]
	push	edx
	call	_dyntab_cell
	add	esp, 12					; 0000000cH
	push	eax
	push	0
	mov	eax, DWORD PTR _row$70342[ebp]
	push	eax
	lea	ecx, DWORD PTR _lineobj$[ebp]
	push	ecx
	call	_dyntab_copy
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L70343
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29872], OFFSET FLAT:$SG70345
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 110		; 0000006eH
	jmp	$eva_err$70241
$L70343:

; 111  : 				c = dyntab_cell(&lineobj, row, 0);

	push	0
	mov	ecx, DWORD PTR _row$70342[ebp]
	push	ecx
	lea	edx, DWORD PTR _lineobj$[ebp]
	push	edx
	call	_dyntab_cell
	add	esp, 12					; 0000000cH
	mov	DWORD PTR _c$70336[ebp], eax

; 112  : 				c->Num = 0;

	mov	eax, DWORD PTR _c$70336[ebp]
	mov	DWORD PTR [eax+36], 0

; 113  : 				c->Line = 0;

	mov	ecx, DWORD PTR _c$70336[ebp]
	mov	DWORD PTR [ecx+40], 0
$L70341:

; 115  : 			M_FREE(expr);

	jmp	$L70339
$L70340:
	mov	edx, DWORD PTR _expr$[ebp]
	push	edx
	call	_mem_free
	add	esp, 4
	mov	DWORD PTR _expr$[ebp], 0

; 116  : 			if(qry_eval_sqlexpr_var(cntxt, &expr, dyntab_val(&srcval, i, 0), &ctrl->attr, NULL)) STACK_ERROR;

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
	je	SHORT $L70347
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 116		; 00000074H
	jmp	$eva_err$70241
$L70347:

; 117  : 			DYNTAB_ADD_BUF(&lineval, 0, 0, expr);

	cmp	DWORD PTR _expr$[ebp], 0
	je	SHORT $L70348
	mov	eax, DWORD PTR _expr$[ebp]
	cmp	DWORD PTR [eax+4], 0
	je	SHORT $L70348
	push	0
	push	0
	mov	ecx, DWORD PTR _expr$[ebp]
	mov	edx, DWORD PTR [ecx+4]
	push	edx
	mov	eax, DWORD PTR _expr$[ebp]
	add	eax, 8
	push	eax
	push	0
	push	0
	lea	ecx, DWORD PTR _lineval$[ebp]
	push	ecx
	call	_dyntab_add
	add	esp, 28					; 0000001cH
	test	eax, eax
	je	SHORT $L70350
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29872], OFFSET FLAT:$SG70352
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 117		; 00000075H
	jmp	$eva_err$70241
$L70350:
	jmp	SHORT $L70356
$L70348:
	push	0
	push	0
	push	0
	push	0
	push	0
	push	0
	lea	ecx, DWORD PTR _lineval$[ebp]
	push	ecx
	call	_dyntab_add
	add	esp, 28					; 0000001cH
	test	eax, eax
	je	SHORT $L70356
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29872], OFFSET FLAT:$SG70358
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 117		; 00000075H
	jmp	$eva_err$70241
$L70356:

; 118  : 			if(*dyntab_val(&debug, i, 0)) cntxt->sql_trace = DEBUG_SQL_RES;

	push	0
	mov	ecx, DWORD PTR _i$[ebp]
	push	ecx
	lea	edx, DWORD PTR _debug$[ebp]
	push	edx
	call	_dyntab_val
	add	esp, 12					; 0000000cH
	movsx	eax, BYTE PTR [eax]
	test	eax, eax
	je	SHORT $L70359
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29852], 2
$L70359:

; 119  : 			if(form_set_values(cntxt,
; 120  : 					DYNTAB_TOUL(&id_form),
; 121  : 					DYNTAB_TOUL(&id_obj),
; 122  : 					DYNTAB_VAL_SZ(&destfield, i, 0),
; 123  : 					dyntab_val(&srctype, i, 0),
; 124  : 					&lineobj,
; 125  : 					&lineval,
; 126  : 					dyntab_val(&setmode, i, 0)))

	push	0
	mov	edx, DWORD PTR _i$[ebp]
	push	edx
	lea	eax, DWORD PTR _setmode$[ebp]
	push	eax
	call	_dyntab_val
	add	esp, 12					; 0000000cH
	push	eax
	lea	ecx, DWORD PTR _lineval$[ebp]
	push	ecx
	lea	edx, DWORD PTR _lineobj$[ebp]
	push	edx
	push	0
	mov	eax, DWORD PTR _i$[ebp]
	push	eax
	lea	ecx, DWORD PTR _srctype$[ebp]
	push	ecx
	call	_dyntab_val
	add	esp, 12					; 0000000cH
	push	eax
	push	0
	mov	edx, DWORD PTR _i$[ebp]
	push	edx
	lea	eax, DWORD PTR _destfield$[ebp]
	push	eax
	call	_dyntab_sz
	add	esp, 12					; 0000000cH
	push	eax
	push	0
	mov	ecx, DWORD PTR _i$[ebp]
	push	ecx
	lea	edx, DWORD PTR _destfield$[ebp]
	push	edx
	call	_dyntab_val
	add	esp, 12					; 0000000cH
	push	eax
	push	10					; 0000000aH
	push	0
	push	0
	push	0
	lea	eax, DWORD PTR _id_obj$[ebp]
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
	lea	ecx, DWORD PTR _id_form$[ebp]
	push	ecx
	call	_dyntab_val
	add	esp, 12					; 0000000cH
	push	eax
	call	_strtoul
	add	esp, 12					; 0000000cH
	push	eax
	mov	edx, DWORD PTR _cntxt$[ebp]
	push	edx
	call	_form_set_values
	add	esp, 36					; 00000024H
	test	eax, eax
	je	SHORT $L70362

; 127  : 				CLEAR_ERROR;

	push	127					; 0000007fH
	push	OFFSET FLAT:$SG70363
	push	OFFSET FLAT:$SG70364
	mov	eax, DWORD PTR _cntxt$[ebp]
	push	eax
	call	_err_clear
	add	esp, 16					; 00000010H
$L70362:

; 128  : 			cntxt->sql_trace = sql_trace;

	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	edx, DWORD PTR _sql_trace$70337[ebp]
	mov	DWORD PTR [ecx+29852], edx
$L70335:

; 130  : 
; 131  : 	/* Transfer fields from current object */
; 132  : 	CTRL_ATTR_TAB(destfield, COPY_FIELDS);

	jmp	$L70333
$L70334:
	lea	eax, DWORD PTR _destfield$[ebp]
	push	eax
	call	_dyntab_free
	add	esp, 4
	push	0
	push	-1
	push	OFFSET FLAT:$SG70367
	mov	ecx, DWORD PTR _ctrl$[ebp]
	add	ecx, 44					; 0000002cH
	push	ecx
	push	0
	lea	edx, DWORD PTR _destfield$[ebp]
	push	edx
	call	_dyntab_filter_field
	add	esp, 24					; 00000018H
	test	eax, eax
	je	SHORT $L70366
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29872], OFFSET FLAT:$SG70369
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 132		; 00000084H
	jmp	$eva_err$70241
$L70366:
	lea	edx, DWORD PTR _destfield$[ebp]
	push	edx
	call	_dyntab_order_lines
	add	esp, 4
	test	eax, eax
	je	SHORT $L70370
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29872], OFFSET FLAT:$SG70372
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 132		; 00000084H
	jmp	$eva_err$70241
$L70370:

; 133  : 	for(i = 0; i < destfield.nbrows; i++)

	mov	DWORD PTR _i$[ebp], 0
	jmp	SHORT $L70373
$L70374:
	mov	edx, DWORD PTR _i$[ebp]
	add	edx, 1
	mov	DWORD PTR _i$[ebp], edx
$L70373:
	mov	eax, DWORD PTR _i$[ebp]
	cmp	eax, DWORD PTR _destfield$[ebp]
	jae	$L70375

; 135  : 		unsigned long idfield = DYNTAB_TOULRC(&destfield, i, 0);

	push	10					; 0000000aH
	push	0
	push	0
	mov	ecx, DWORD PTR _i$[ebp]
	push	ecx
	lea	edx, DWORD PTR _destfield$[ebp]
	push	edx
	call	_dyntab_val
	add	esp, 12					; 0000000cH
	push	eax
	call	_strtoul
	add	esp, 12					; 0000000cH
	mov	DWORD PTR _idfield$70376[ebp], eax

; 136  : 		if(qry_cache_idobj(&lineobj, idfield) || ctrl_read_baseobj(cntxt,  &lineobj)) STACK_ERROR;

	push	3
	push	0
	mov	eax, DWORD PTR _idfield$70376[ebp]
	push	eax
	lea	ecx, DWORD PTR _lineobj$[ebp]
	push	ecx
	mov	edx, DWORD PTR _cntxt$[ebp]
	push	edx
	call	_qry_cache_idobj_field
	add	esp, 20					; 00000014H
	test	eax, eax
	jne	SHORT $L70380
	lea	eax, DWORD PTR _lineobj$[ebp]
	push	eax
	mov	ecx, DWORD PTR _cntxt$[ebp]
	push	ecx
	call	_ctrl_read_baseobj
	add	esp, 8
	test	eax, eax
	je	SHORT $L70379
$L70380:
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 136		; 00000088H
	jmp	$eva_err$70241
$L70379:

; 137  : 		DYNTAB_FIELD(&srcval, &lineobj, FIELD);

	lea	eax, DWORD PTR _srcval$[ebp]
	push	eax
	call	_dyntab_free
	add	esp, 4
	push	0
	push	-1
	push	OFFSET FLAT:$SG70383
	lea	ecx, DWORD PTR _lineobj$[ebp]
	push	ecx
	push	0
	lea	edx, DWORD PTR _srcval$[ebp]
	push	edx
	call	_dyntab_filter_field
	add	esp, 24					; 00000018H
	test	eax, eax
	je	SHORT $L70382
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29872], OFFSET FLAT:$SG70385
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 137		; 00000089H
	jmp	$eva_err$70241
$L70382:

; 138  : 		if(form_set_values(cntxt,
; 139  : 				DYNTAB_TOUL(&id_form),
; 140  : 				DYNTAB_TOUL(&id_obj),
; 141  : 				DYNTAB_VAL_SZ(&srcval, 0, 0),
; 142  : 				"_EVA_CURRENTOBJ",
; 143  : 				NULL,
; 144  : 				&srcval,
; 145  : 				"_EVA_REPLACE"))

	push	OFFSET FLAT:$SG70390
	lea	edx, DWORD PTR _srcval$[ebp]
	push	edx
	push	0
	push	OFFSET FLAT:$SG70391
	push	0
	push	0
	lea	eax, DWORD PTR _srcval$[ebp]
	push	eax
	call	_dyntab_sz
	add	esp, 12					; 0000000cH
	push	eax
	push	0
	push	0
	lea	ecx, DWORD PTR _srcval$[ebp]
	push	ecx
	call	_dyntab_val
	add	esp, 12					; 0000000cH
	push	eax
	push	10					; 0000000aH
	push	0
	push	0
	push	0
	lea	edx, DWORD PTR _id_obj$[ebp]
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
	lea	eax, DWORD PTR _id_form$[ebp]
	push	eax
	call	_dyntab_val
	add	esp, 12					; 0000000cH
	push	eax
	call	_strtoul
	add	esp, 12					; 0000000cH
	push	eax
	mov	ecx, DWORD PTR _cntxt$[ebp]
	push	ecx
	call	_form_set_values
	add	esp, 36					; 00000024H
	test	eax, eax
	je	SHORT $L70389

; 146  : 			CLEAR_ERROR;

	push	146					; 00000092H
	push	OFFSET FLAT:$SG70392
	push	OFFSET FLAT:$SG70393
	mov	edx, DWORD PTR _cntxt$[ebp]
	push	edx
	call	_err_clear
	add	esp, 16					; 00000010H
$L70389:

; 147  : 	}

	jmp	$L70374
$L70375:

; 148  : 
; 149  : 	/* Select form location */
; 150  : 	if(!strcmp("_EVA_BOTTOM", altform)) loc = 2;

	mov	eax, DWORD PTR _altform$[ebp]
	push	eax
	push	OFFSET FLAT:$SG70395
	call	_strcmp
	add	esp, 8
	test	eax, eax
	jne	SHORT $L70394
	mov	DWORD PTR _loc$[ebp], 2

; 151  : 	else if(!strcmp("_EVA_TOP", altform)) loc = 1;

	jmp	SHORT $L70400
$L70394:
	mov	ecx, DWORD PTR _altform$[ebp]
	push	ecx
	push	OFFSET FLAT:$SG70398
	call	_strcmp
	add	esp, 8
	test	eax, eax
	jne	SHORT $L70397
	mov	DWORD PTR _loc$[ebp], 1

; 152  : 	else if(!strcmp("_EVA_REUSE", altform)) loc = 3;

	jmp	SHORT $L70400
$L70397:
	mov	edx, DWORD PTR _altform$[ebp]
	push	edx
	push	OFFSET FLAT:$SG70401
	call	_strcmp
	add	esp, 8
	test	eax, eax
	jne	SHORT $L70400
	mov	DWORD PTR _loc$[ebp], 3
$L70400:

; 153  : 
; 154  : 	/* Open form with given object */
; 155  : 	if(form_load_from_ctrl(cntxt, &id_form, &id_obj, loc, 0)) STACK_ERROR;

	push	0
	mov	eax, DWORD PTR _loc$[ebp]
	push	eax
	lea	ecx, DWORD PTR _id_obj$[ebp]
	push	ecx
	lea	edx, DWORD PTR _id_form$[ebp]
	push	edx
	mov	eax, DWORD PTR _cntxt$[ebp]
	push	eax
	call	_form_load_from_ctrl
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L70402
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 155		; 0000009bH
	jmp	$eva_err$70241
$L70402:

; 156  : 
; 157  : 	/* Set edit mode if enougth rights & data modified */
; 158  : 	form = cntxt->form;

	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	eax, DWORD PTR [edx+80]
	mov	DWORD PTR _form$[ebp], eax

; 159  : 	if(openmode)  form->nextstep = openmode == 3 ? HtmlPrint :

	cmp	DWORD PTR _openmode$[ebp], 0
	je	SHORT $L70403

; 160  : 									(openmode == 1 && (form->ctrl->access & AccessEdit)) ? HtmlEdit : HtmlView;

	cmp	DWORD PTR _openmode$[ebp], 3
	jne	SHORT $L70914
	mov	DWORD PTR -292+[ebp], 7
	jmp	SHORT $L70915
$L70914:
	cmp	DWORD PTR _openmode$[ebp], 1
	jne	SHORT $L70912
	mov	ecx, DWORD PTR _form$[ebp]
	mov	edx, DWORD PTR [ecx]
	mov	eax, DWORD PTR [edx+184]
	and	eax, 2
	test	eax, eax
	je	SHORT $L70912
	mov	DWORD PTR -296+[ebp], 4
	jmp	SHORT $L70913
$L70912:
	mov	DWORD PTR -296+[ebp], 6
$L70913:
	mov	ecx, DWORD PTR -296+[ebp]
	mov	DWORD PTR -292+[ebp], ecx
$L70915:
	mov	edx, DWORD PTR _form$[ebp]
	mov	eax, DWORD PTR -292+[ebp]
	mov	DWORD PTR [edx+172], eax

; 161  : 	else if((b_edit || openmode == 1) && form->ctrl->access & AccessEdit) form->nextstep = HtmlEdit;

	jmp	SHORT $eva_noerr$70243
$L70403:
	cmp	DWORD PTR _b_edit$[ebp], 0
	jne	SHORT $L70406
	cmp	DWORD PTR _openmode$[ebp], 1
	jne	SHORT $eva_noerr$70243
$L70406:
	mov	ecx, DWORD PTR _form$[ebp]
	mov	edx, DWORD PTR [ecx]
	mov	eax, DWORD PTR [edx+184]
	and	eax, 2
	test	eax, eax
	je	SHORT $eva_noerr$70243
	mov	ecx, DWORD PTR _form$[ebp]
	mov	DWORD PTR [ecx+172], 4
$eva_noerr$70243:

; 162  : 
; 163  : 	RETURN_OK_CLEANUP;

	push	0
	push	OFFSET FLAT:$SG70407
	push	OFFSET FLAT:$SG70408
	mov	edx, DWORD PTR _cntxt$[ebp]
	push	edx
	call	_err_clear
	add	esp, 16					; 00000010H
$eva_err$70241:
	mov	eax, DWORD PTR _cntxt$[ebp]
	cmp	DWORD PTR [eax+29872], 0
	je	SHORT $L70409
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	edx, DWORD PTR [ecx+29900]
	push	edx
	push	OFFSET FLAT:$SG70410
	push	OFFSET FLAT:$SG70411
	mov	eax, DWORD PTR _cntxt$[ebp]
	push	eax
	call	_err_add_context
	add	esp, 16					; 00000010H
$L70409:
	lea	ecx, DWORD PTR _id_form$[ebp]
	push	ecx
	call	_dyntab_free
	add	esp, 4
	lea	edx, DWORD PTR _id_obj$[ebp]
	push	edx
	call	_dyntab_free
	add	esp, 4
	lea	eax, DWORD PTR _destfield$[ebp]
	push	eax
	call	_dyntab_free
	add	esp, 4
	lea	ecx, DWORD PTR _srctype$[ebp]
	push	ecx
	call	_dyntab_free
	add	esp, 4
	lea	edx, DWORD PTR _srcobj$[ebp]
	push	edx
	call	_dyntab_free
	add	esp, 4
	lea	eax, DWORD PTR _srcval$[ebp]
	push	eax
	call	_dyntab_free
	add	esp, 4
	lea	ecx, DWORD PTR _setmode$[ebp]
	push	ecx
	call	_dyntab_free
	add	esp, 4
	lea	edx, DWORD PTR _lineobj$[ebp]
	push	edx
	call	_dyntab_free
	add	esp, 4
	lea	eax, DWORD PTR _debug$[ebp]
	push	eax
	call	_dyntab_free
	add	esp, 4
	mov	ecx, DWORD PTR _expr$[ebp]
	push	ecx
	call	_mem_free
	add	esp, 4
	mov	DWORD PTR _expr$[ebp], 0
	mov	edx, DWORD PTR _cntxt$[ebp]
	xor	eax, eax
	cmp	DWORD PTR [edx+29872], 0
	setne	al

; 164  : }

	mov	esp, ebp
	pop	ebp
	ret	0
_action_openform ENDP
_TEXT	ENDS
PUBLIC	_action_formbuttons
EXTRN	_form_close_nosave:NEAR
EXTRN	_form_save_dialog:NEAR
_BSS	SEGMENT
	ALIGN	4

$SG70424 DB	01H DUP (?)
	ALIGN	4

$SG70427 DB	01H DUP (?)
_BSS	ENDS
_DATA	SEGMENT
$SG70423 DB	'_EVA_ACTION', 00H
$SG70426 DB	'_EVA_CONFIRM', 00H
	ORG $+3
$SG70431 DB	'_EVA_CLOSE', 00H
	ORG $+1
$SG70441 DB	'_EVA_SAVE', 00H
	ORG $+2
$SG70444 DB	'_EVA_CLOSE', 00H
	ORG $+1
$SG70447 DB	'_EVA_SAVECLOSE', 00H
	ORG $+1
$SG70450 DB	'_EVA_PRINTMODE', 00H
	ORG $+1
$SG70453 DB	'_EVA_LISTMODE', 00H
	ORG $+2
$SG70456 DB	'_EVA_STATSMODE', 00H
	ORG $+1
$SG70459 DB	'_EVA_VALUESMODE', 00H
$SG70462 DB	'_EVA_EDITMODE', 00H
	ORG $+2
$SG70465 DB	'_EVA_VIEWMODE', 00H
	ORG $+2
$SG70468 DB	'_EVA_SEARCHMODE', 00H
$SG70471 DB	'_EVA_NEWOBJ', 00H
$SG70477 DB	'D:\Travail\ABI\EVA\V4.0\CGI\Brunix-2016\action_misc.c', 00H
	ORG $+2
$SG70478 DB	'action_formbuttons', 00H
	ORG $+1
$SG70480 DB	'D:\Travail\ABI\EVA\V4.0\CGI\Brunix-2016\action_misc.c', 00H
	ORG $+2
$SG70481 DB	'action_formbuttons', 00H
_DATA	ENDS
_TEXT	SEGMENT
_cntxt$ = 8
_i_ctrl$ = 12
_form$ = -4
_ctrl$ = -20
_action$ = -12
_confirm$ = -16
_buttons$ = -8
_mode$ = -24
_btn$70473 = -28
_action_formbuttons PROC NEAR

; 177  : ){

	push	ebp
	mov	ebp, esp
	sub	esp, 36					; 00000024H

; 178  : 	EVA_form *form = cntxt->form;

	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	ecx, DWORD PTR [eax+80]
	mov	DWORD PTR _form$[ebp], ecx

; 179  : 	EVA_ctrl *ctrl = form->ctrl + i_ctrl;

	mov	edx, DWORD PTR _i_ctrl$[ebp]
	imul	edx, 480				; 000001e0H
	mov	eax, DWORD PTR _form$[ebp]
	mov	ecx, DWORD PTR [eax]
	add	ecx, edx
	mov	DWORD PTR _ctrl$[ebp], ecx

; 180  : 	char *action = CTRL_ATTR_VAL(ACTION);

	cmp	DWORD PTR _ctrl$[ebp], 0
	je	SHORT $L70917
	push	0
	push	-1
	push	OFFSET FLAT:$SG70423
	mov	edx, DWORD PTR _ctrl$[ebp]
	add	edx, 44					; 0000002cH
	push	edx
	call	_dyntab_field_val
	add	esp, 16					; 00000010H
	mov	DWORD PTR -32+[ebp], eax
	jmp	SHORT $L70918
$L70917:
	mov	DWORD PTR -32+[ebp], OFFSET FLAT:$SG70424
$L70918:
	mov	eax, DWORD PTR -32+[ebp]
	mov	DWORD PTR _action$[ebp], eax

; 181  : 	char *confirm = CTRL_ATTR_VAL(CONFIRM);

	cmp	DWORD PTR _ctrl$[ebp], 0
	je	SHORT $L70919
	push	0
	push	-1
	push	OFFSET FLAT:$SG70426
	mov	ecx, DWORD PTR _ctrl$[ebp]
	add	ecx, 44					; 0000002cH
	push	ecx
	call	_dyntab_field_val
	add	esp, 16					; 00000010H
	mov	DWORD PTR -36+[ebp], eax
	jmp	SHORT $L70920
$L70919:
	mov	DWORD PTR -36+[ebp], OFFSET FLAT:$SG70427
$L70920:
	mov	edx, DWORD PTR -36+[ebp]
	mov	DWORD PTR _confirm$[ebp], edx

; 182  : 	int buttons = 0, mode = 0;

	mov	DWORD PTR _buttons$[ebp], 0
	mov	DWORD PTR _mode$[ebp], 0

; 183  : 
; 184  : 	/* Handle close button on unchanged object */
; 185  : 	if(!strcmp(action, "_EVA_CLOSE") && (
; 186  : 		(!dyntab_sz(&form->id_obj, 0, 0) && !form->b_modified) ||
; 187  : 		form->prevstep == HtmlView))

	push	OFFSET FLAT:$SG70431
	mov	eax, DWORD PTR _action$[ebp]
	push	eax
	call	_strcmp
	add	esp, 8
	test	eax, eax
	jne	$L70430
	push	0
	push	0
	mov	ecx, DWORD PTR _form$[ebp]
	add	ecx, 32					; 00000020H
	push	ecx
	call	_dyntab_sz
	add	esp, 12					; 0000000cH
	test	eax, eax
	jne	SHORT $L70433
	mov	edx, DWORD PTR _form$[ebp]
	cmp	DWORD PTR [edx+128], 0
	je	SHORT $L70432
$L70433:
	mov	eax, DWORD PTR _form$[ebp]
	cmp	DWORD PTR [eax+168], 6
	jne	SHORT $L70430
$L70432:

; 189  : 		if(form_close_nosave(cntxt, DYNTAB_TOUL(&form->id_form), DYNTAB_TOUL(&form->id_obj), &form->call_data)) STACK_ERROR;

	mov	ecx, DWORD PTR _form$[ebp]
	add	ecx, 88					; 00000058H
	push	ecx
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
	je	SHORT $L70436
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 189		; 000000bdH
	jmp	$eva_err$70437
$L70436:

; 190  : 		RETURN_OK;

	jmp	$eva_noerr$70438
$L70430:

; 192  : 
; 193  : 	/* Handle button action */
; 194  : #define DEFACTION(t, b, m)	if(!strcmp(action, "_EVA_"#t)) { buttons = b; mode = m; }
; 195  : 		 DEFACTION(SAVE, BUTN_SAVE_BACK, 0)

	push	OFFSET FLAT:$SG70441
	mov	eax, DWORD PTR _action$[ebp]
	push	eax
	call	_strcmp
	add	esp, 8
	test	eax, eax
	jne	SHORT $L70440
	mov	DWORD PTR _buttons$[ebp], 4
	mov	DWORD PTR _mode$[ebp], 0

; 196  : 	else DEFACTION(CLOSE, BUTN_CLOSE, 0)

	jmp	$L70470
$L70440:
	push	OFFSET FLAT:$SG70444
	mov	ecx, DWORD PTR _action$[ebp]
	push	ecx
	call	_strcmp
	add	esp, 8
	test	eax, eax
	jne	SHORT $L70443
	mov	DWORD PTR _buttons$[ebp], 8
	mov	DWORD PTR _mode$[ebp], 0

; 197  : 	else DEFACTION(SAVECLOSE, BUTN_SAVE_CLOSE, 0)

	jmp	$L70470
$L70443:
	push	OFFSET FLAT:$SG70447
	mov	edx, DWORD PTR _action$[ebp]
	push	edx
	call	_strcmp
	add	esp, 8
	test	eax, eax
	jne	SHORT $L70446
	mov	DWORD PTR _buttons$[ebp], 2
	mov	DWORD PTR _mode$[ebp], 0

; 198  : 	else DEFACTION(PRINTMODE, (form->prevstep == HtmlPrint ? 0 : BUTN_SAVE_NEXT),

	jmp	$L70470
$L70446:

; 199  : 							(form->prevstep == HtmlPrint ? HtmlView : HtmlPrint))

	push	OFFSET FLAT:$SG70450
	mov	eax, DWORD PTR _action$[ebp]
	push	eax
	call	_strcmp
	add	esp, 8
	test	eax, eax
	jne	SHORT $L70449
	mov	ecx, DWORD PTR _form$[ebp]
	xor	edx, edx
	cmp	DWORD PTR [ecx+168], 7
	setne	dl
	mov	DWORD PTR _buttons$[ebp], edx
	mov	eax, DWORD PTR _form$[ebp]
	xor	ecx, ecx
	cmp	DWORD PTR [eax+168], 7
	setne	cl
	add	ecx, 6
	mov	DWORD PTR _mode$[ebp], ecx

; 200  : 	else DEFACTION(LISTMODE, 0, FormList)

	jmp	$L70470
$L70449:
	push	OFFSET FLAT:$SG70453
	mov	edx, DWORD PTR _action$[ebp]
	push	edx
	call	_strcmp
	add	esp, 8
	test	eax, eax
	jne	SHORT $L70452
	mov	DWORD PTR _buttons$[ebp], 0
	mov	DWORD PTR _mode$[ebp], 8

; 201  : 	else DEFACTION(STATSMODE, BUTN_SAVE_NEXT, FormStats)

	jmp	$L70470
$L70452:
	push	OFFSET FLAT:$SG70456
	mov	eax, DWORD PTR _action$[ebp]
	push	eax
	call	_strcmp
	add	esp, 8
	test	eax, eax
	jne	SHORT $L70455
	mov	DWORD PTR _buttons$[ebp], 1
	mov	DWORD PTR _mode$[ebp], 10		; 0000000aH

; 202  : 	else DEFACTION(VALUESMODE, 0, FormValues)

	jmp	$L70470
$L70455:
	push	OFFSET FLAT:$SG70459
	mov	ecx, DWORD PTR _action$[ebp]
	push	ecx
	call	_strcmp
	add	esp, 8
	test	eax, eax
	jne	SHORT $L70458
	mov	DWORD PTR _buttons$[ebp], 0
	mov	DWORD PTR _mode$[ebp], 11		; 0000000bH

; 203  : 	else DEFACTION(EDITMODE, 0, HtmlEdit)

	jmp	$L70470
$L70458:
	push	OFFSET FLAT:$SG70462
	mov	edx, DWORD PTR _action$[ebp]
	push	edx
	call	_strcmp
	add	esp, 8
	test	eax, eax
	jne	SHORT $L70461
	mov	DWORD PTR _buttons$[ebp], 0
	mov	DWORD PTR _mode$[ebp], 4

; 204  : 	else DEFACTION(VIEWMODE, BUTN_SAVE_NEXT, HtmlView)

	jmp	SHORT $L70470
$L70461:
	push	OFFSET FLAT:$SG70465
	mov	eax, DWORD PTR _action$[ebp]
	push	eax
	call	_strcmp
	add	esp, 8
	test	eax, eax
	jne	SHORT $L70464
	mov	DWORD PTR _buttons$[ebp], 1
	mov	DWORD PTR _mode$[ebp], 6

; 205  : 	else DEFACTION(SEARCHMODE, 0, FormSearch)

	jmp	SHORT $L70470
$L70464:
	push	OFFSET FLAT:$SG70468
	mov	ecx, DWORD PTR _action$[ebp]
	push	ecx
	call	_strcmp
	add	esp, 8
	test	eax, eax
	jne	SHORT $L70467
	mov	DWORD PTR _buttons$[ebp], 0
	mov	DWORD PTR _mode$[ebp], 9

; 206  : 	else DEFACTION(NEWOBJ, BUTN_SAVE_NEXT, HtmlEdit)

	jmp	SHORT $L70470
$L70467:
	push	OFFSET FLAT:$SG70471
	mov	edx, DWORD PTR _action$[ebp]
	push	edx
	call	_strcmp
	add	esp, 8
	test	eax, eax
	jne	SHORT $L70470
	mov	DWORD PTR _buttons$[ebp], 1
	mov	DWORD PTR _mode$[ebp], 4
$L70470:

; 207  : #undef DEFACTION
; 208  : 
; 209  : 	/* Call save dialog */
; 210  : 	if(buttons)

	cmp	DWORD PTR _buttons$[ebp], 0
	je	SHORT $L70472

; 212  : 		int btn = buttons;

	mov	eax, DWORD PTR _buttons$[ebp]
	mov	DWORD PTR _btn$70473[ebp], eax

; 213  : 		if(form_save_dialog(cntxt, i_ctrl, confirm, buttons | BUTN_SAVE_CLOSE | BUTN_CLOSE | BUTN_RESTORE, &btn))

	lea	ecx, DWORD PTR _btn$70473[ebp]
	push	ecx
	mov	edx, DWORD PTR _buttons$[ebp]
	or	edx, 2
	or	edx, 8
	or	edx, 16					; 00000010H
	push	edx
	mov	eax, DWORD PTR _confirm$[ebp]
	push	eax
	mov	ecx, DWORD PTR _i_ctrl$[ebp]
	push	ecx
	mov	edx, DWORD PTR _cntxt$[ebp]
	push	edx
	call	_form_save_dialog
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L70474

; 214  : 			STACK_ERROR;

	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 214		; 000000d6H
	jmp	SHORT $eva_err$70437
$L70474:

; 215  : 
; 216  : 		/* Set form mode if dialog succeded */
; 217  : 		if(btn == buttons && mode && form)

	mov	ecx, DWORD PTR _btn$70473[ebp]
	cmp	ecx, DWORD PTR _buttons$[ebp]
	jne	SHORT $L70475
	cmp	DWORD PTR _mode$[ebp], 0
	je	SHORT $L70475
	cmp	DWORD PTR _form$[ebp], 0
	je	SHORT $L70475

; 219  : 			form->nextstep = mode;

	mov	edx, DWORD PTR _form$[ebp]
	mov	eax, DWORD PTR _mode$[ebp]
	mov	DWORD PTR [edx+172], eax
$L70475:

; 222  : 	else

	jmp	SHORT $eva_noerr$70438
$L70472:

; 224  : 		form->nextstep = mode;

	mov	ecx, DWORD PTR _form$[ebp]
	mov	edx, DWORD PTR _mode$[ebp]
	mov	DWORD PTR [ecx+172], edx
$eva_noerr$70438:

; 226  : 
; 227  : 	RETURN_OK_CLEANUP;

	push	0
	push	OFFSET FLAT:$SG70477
	push	OFFSET FLAT:$SG70478
	mov	eax, DWORD PTR _cntxt$[ebp]
	push	eax
	call	_err_clear
	add	esp, 16					; 00000010H
$eva_err$70437:
	mov	ecx, DWORD PTR _cntxt$[ebp]
	cmp	DWORD PTR [ecx+29872], 0
	je	SHORT $L70479
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	eax, DWORD PTR [edx+29900]
	push	eax
	push	OFFSET FLAT:$SG70480
	push	OFFSET FLAT:$SG70481
	mov	ecx, DWORD PTR _cntxt$[ebp]
	push	ecx
	call	_err_add_context
	add	esp, 16					; 00000010H
$L70479:
	mov	edx, DWORD PTR _cntxt$[ebp]
	xor	eax, eax
	cmp	DWORD PTR [edx+29872], 0
	setne	al

; 228  : }

	mov	esp, ebp
	pop	ebp
	ret	0
_action_formbuttons ENDP
_TEXT	ENDS
PUBLIC	_action_closeall
_DATA	SEGMENT
	ORG $+1
$SG70489 DB	'D:\Travail\ABI\EVA\V4.0\CGI\Brunix-2016\action_misc.c', 00H
	ORG $+2
$SG70490 DB	'action_closeall', 00H
$SG70493 DB	'D:\Travail\ABI\EVA\V4.0\CGI\Brunix-2016\action_misc.c', 00H
	ORG $+2
$SG70494 DB	'action_closeall', 00H
_DATA	ENDS
_TEXT	SEGMENT
_cntxt$ = 8
_action_closeall PROC NEAR

; 240  : ){

	push	ebp
	mov	ebp, esp

; 241  : 	DYNTAB_FREE(cntxt->id_form);

	mov	eax, DWORD PTR _cntxt$[ebp]
	push	eax
	call	_dyntab_free
	add	esp, 4

; 242  : 	DYNTAB_FREE(cntxt->id_obj);

	mov	ecx, DWORD PTR _cntxt$[ebp]
	add	ecx, 20					; 00000014H
	push	ecx
	call	_dyntab_free
	add	esp, 4

; 243  : 	DYNTAB_FREE(cntxt->alt_form);

	mov	edx, DWORD PTR _cntxt$[ebp]
	add	edx, 40					; 00000028H
	push	edx
	call	_dyntab_free
	add	esp, 4

; 244  : 	DYNTAB_FREE(cntxt->alt_obj);

	mov	eax, DWORD PTR _cntxt$[ebp]
	add	eax, 60					; 0000003cH
	push	eax
	call	_dyntab_free
	add	esp, 4
$eva_noerr$70488:

; 245  : 
; 246  : 	RETURN_OK_CLEANUP;

	push	0
	push	OFFSET FLAT:$SG70489
	push	OFFSET FLAT:$SG70490
	mov	ecx, DWORD PTR _cntxt$[ebp]
	push	ecx
	call	_err_clear
	add	esp, 16					; 00000010H
$eva_err$70491:
	mov	edx, DWORD PTR _cntxt$[ebp]
	cmp	DWORD PTR [edx+29872], 0
	je	SHORT $L70492
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	ecx, DWORD PTR [eax+29900]
	push	ecx
	push	OFFSET FLAT:$SG70493
	push	OFFSET FLAT:$SG70494
	mov	edx, DWORD PTR _cntxt$[ebp]
	push	edx
	call	_err_add_context
	add	esp, 16					; 00000010H
$L70492:
	mov	eax, DWORD PTR _cntxt$[ebp]
	xor	ecx, ecx
	cmp	DWORD PTR [eax+29872], 0
	setne	cl
	mov	eax, ecx

; 247  : }

	pop	ebp
	ret	0
_action_closeall ENDP
_TEXT	ENDS
PUBLIC	_action_end_session
EXTRN	_put_html_page_header:NEAR
EXTRN	__iob:BYTE
EXTRN	_fflush:NEAR
EXTRN	_table_row_bgcolor:NEAR
EXTRN	_cgi_free:NEAR
EXTRN	_printf:NEAR
EXTRN	_sprintf:NEAR
EXTRN	_cgi_filter_values:NEAR
EXTRN	_cgi_check_form_change:NEAR
EXTRN	_form_free:NEAR
EXTRN	_qry_complete_data:NEAR
EXTRN	_dynbuf_add:NEAR
EXTRN	_ctrl_cgi_name:NEAR
EXTRN	_qry_add_obj_field_val:NEAR
EXTRN	_dyntab_del_rows:NEAR
EXTRN	_ctrl_add_symbol_btn:NEAR
_BSS	SEGMENT
	ALIGN	4

$SG70514 DB	01H DUP (?)
	ALIGN	4

$SG70538 DB	01H DUP (?)
_BSS	ENDS
_DATA	SEGMENT
$SG70513 DB	'ENDSESSION', 00H
	ORG $+1
$SG70518 DB	'1', 00H
	ORG $+2
$SG70519 DB	'_EVA_TERMINATE', 00H
	ORG $+1
$SG70523 DB	'Fin de session', 00H
	ORG $+1
$SG70526 DB	'ENDSESSION', 00H
	ORG $+1
$SG70527 DB	'<font face=Arial><br><center><font size=+1><b>Terminer l'
	DB	'a session</b></font></center><br><hr><br><u>Avertissement con'
	DB	'cernant la s', 0e9H, 'curit', 0e9H, ' : </u>la plupart des na'
	DB	'vigateurs disposent d''une fonction ''Page pr', 0e9H, 'c', 0e9H
	DB	'dente'' qui permet de visualiser votre travail si vous laisse'
	DB	'z cette fen', 0eaH, 'tre ouverte. Il est donc fortement recom'
	DB	'mand', 0e9H, ' de fermer la fen', 0eaH, 'tre pour ', 0e9H, 'v'
	DB	'iter toute indiscr', 0e9H, 'tion, sauf si vous souhaitez vous'
	DB	' identifier sous un autre nom. Dans ce cas utilisez le bouton'
	DB	' ci dessous.<br><br><center><input type=submit value=''Change'
	DB	'r d&#39;identification'' name=''%s''><br></center><hr>', 00H
	ORG $+3
$SG70550 DB	'_EVA_FORMSTAMP', 00H
	ORG $+1
$SG70552 DB	'%lu', 00H
$SG70556 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70558 DB	'_EVA_FORMSTAMP', 00H
	ORG $+1
$SG70561 DB	'<tr>', 00H
	ORG $+3
$SG70563 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70567 DB	'SYMBOL+NAME+LABEL+OBJNOTES', 00H
	ORG $+1
$SG70568 DB	'D:\Travail\ABI\EVA\V4.0\CGI\Brunix-2016\action_misc.c', 00H
	ORG $+2
$SG70569 DB	'action_end_session', 00H
	ORG $+1
$SG70572 DB	'</tr>', 00H
	ORG $+2
$SG70574 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70576 DB	'</tr></table><br><center><li>si voulez enregistrer vos m'
	DB	'odifications, ouvrez chaque fiche modifi', 0e9H, 'e et enregi'
	DB	'strez-la<br><br><li>si vous ne voulez pas enregistrer vos mod'
	DB	'ifications, fermez cette fen', 0eaH, 'tre</li><br><a href=''j'
	DB	'avascript:window.close()'' title=''Ferme cette fen', 0eaH, 't'
	DB	're''><br><br><img src=''../img/_eva_btn_closenosave_fr.gif'' '
	DB	'border=0></a><br><br></center>', 00H
	ORG $+1
$SG70577 DB	'<u>Attention : vous avez modifi', 0e9H, ' les formulaire'
	DB	's suivants sans les enregistrer</u><br><br><table border=0 wi'
	DB	'dth=100% bgcolor=#EEEEEE cellspacing=0 cellpadding=2><tr>', 00H
	ORG $+2
$SG70578 DB	'%s%s%s', 00H
	ORG $+1
$SG70580 DB	'<script>window.close();</script>', 00H
	ORG $+3
$SG70581 DB	'D:\Travail\ABI\EVA\V4.0\CGI\Brunix-2016\action_misc.c', 00H
	ORG $+2
$SG70582 DB	'action_end_session', 00H
	ORG $+1
$SG70584 DB	'D:\Travail\ABI\EVA\V4.0\CGI\Brunix-2016\action_misc.c', 00H
	ORG $+2
$SG70585 DB	'action_end_session', 00H
_DATA	ENDS
_TEXT	SEGMENT
_cntxt$ = 8
_i_ctrl$ = 12
_form$ = -4
_ctrl$ = -724
_cgival$ = -712
_data$ = -688
_name$ = -720
_tbl$ = -668
_i$ = -692
_j$ = -716
_cgi$70532 = -732
_bgcolor$70533 = -728
_k$70540 = -736
__tmp$70551 = -768
_c$70557 = -772
_action_end_session PROC NEAR

; 262  : ){

	push	ebp
	mov	ebp, esp
	sub	esp, 780				; 0000030cH
	push	edi

; 263  : 	EVA_form *form = cntxt->form;

	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	ecx, DWORD PTR [eax+80]
	mov	DWORD PTR _form$[ebp], ecx

; 264  : 	EVA_ctrl *ctrl = form->ctrl + i_ctrl;

	mov	edx, DWORD PTR _i_ctrl$[ebp]
	imul	edx, 480				; 000001e0H
	mov	eax, DWORD PTR _form$[ebp]
	mov	ecx, DWORD PTR [eax]
	add	ecx, edx
	mov	DWORD PTR _ctrl$[ebp], ecx

; 265  : 	DynTable cgival = { 0 };

	mov	DWORD PTR _cgival$[ebp], 0
	xor	edx, edx
	mov	DWORD PTR _cgival$[ebp+4], edx
	mov	DWORD PTR _cgival$[ebp+8], edx
	mov	DWORD PTR _cgival$[ebp+12], edx
	mov	DWORD PTR _cgival$[ebp+16], edx

; 266  : 	DynTable data = { 0 };

	mov	DWORD PTR _data$[ebp], 0
	xor	eax, eax
	mov	DWORD PTR _data$[ebp+4], eax
	mov	DWORD PTR _data$[ebp+8], eax
	mov	DWORD PTR _data$[ebp+12], eax
	mov	DWORD PTR _data$[ebp+16], eax

; 267  : 	DynBuffer *name = NULL;

	mov	DWORD PTR _name$[ebp], 0

; 268  : 	ObjTableFormat tbl = {0};

	mov	DWORD PTR _tbl$[ebp], 0
	mov	ecx, 165				; 000000a5H
	xor	eax, eax
	lea	edi, DWORD PTR _tbl$[ebp+4]
	rep stosd

; 269  : 	unsigned long i, j;
; 270  : 
; 271  : 	/* End session if confirm button clicked */
; 272  : 	if(!strcmp(CGI_CLICK_BTN_SUBFIELD, "ENDSESSION"))

	mov	ecx, DWORD PTR _cntxt$[ebp]
	cmp	DWORD PTR [ecx+29648], 0
	je	SHORT $L70923
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	eax, DWORD PTR [edx+29656]
	imul	eax, 56					; 00000038H
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	edx, DWORD PTR [ecx+29648]
	mov	eax, DWORD PTR [edx+eax]
	movsx	ecx, BYTE PTR [eax]
	cmp	ecx, 66					; 00000042H
	jne	SHORT $L70923
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	eax, DWORD PTR [edx+29656]
	imul	eax, 56					; 00000038H
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	edx, DWORD PTR [ecx+29648]
	cmp	DWORD PTR [edx+eax+32], 0
	je	SHORT $L70923
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	ecx, DWORD PTR [eax+29656]
	imul	ecx, 56					; 00000038H
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	eax, DWORD PTR [edx+29648]
	mov	ecx, DWORD PTR [eax+ecx+32]
	mov	DWORD PTR -776+[ebp], ecx
	jmp	SHORT $L70924
$L70923:
	mov	DWORD PTR -776+[ebp], OFFSET FLAT:$SG70514
$L70924:
	push	OFFSET FLAT:$SG70513
	mov	edx, DWORD PTR -776+[ebp]
	push	edx
	call	_strcmp
	add	esp, 8
	test	eax, eax
	jne	$L70512

; 274  : 		if(action_closeall(cntxt)) STACK_ERROR;

	mov	eax, DWORD PTR _cntxt$[ebp]
	push	eax
	call	_action_closeall
	add	esp, 4
	test	eax, eax
	je	SHORT $L70515
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 274		; 00000112H
	jmp	$eva_err$70516
$L70515:

; 275  : 		M_FREE(cntxt->html);

	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	eax, DWORD PTR [edx+29784]
	push	eax
	call	_mem_free
	add	esp, 4
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29784], 0

; 276  : 		M_FREE(cntxt->html0);

	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	eax, DWORD PTR [edx+29792]
	push	eax
	call	_mem_free
	add	esp, 4
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29792], 0

; 277  : 		M_FREE(cntxt->html1);

	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	eax, DWORD PTR [edx+29788]
	push	eax
	call	_mem_free
	add	esp, 4
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29788], 0

; 278  : 		form_free(cntxt);

	mov	edx, DWORD PTR _cntxt$[ebp]
	push	edx
	call	_form_free
	add	esp, 4

; 279  : 		cgi_free(cntxt);

	mov	eax, DWORD PTR _cntxt$[ebp]
	push	eax
	call	_cgi_free
	add	esp, 4

; 280  : 		cntxt->b_identified= 0;

	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29400], 0

; 281  : 		if(qry_add_obj_field_val(cntxt, &cntxt->session, "_EVA_TERMINATE", add_sz_str("1"), 0, 1)) STACK_ERROR;

	push	1
	push	0
	push	1
	push	OFFSET FLAT:$SG70518
	push	OFFSET FLAT:$SG70519
	mov	edx, DWORD PTR _cntxt$[ebp]
	add	edx, 29300				; 00007274H
	push	edx
	mov	eax, DWORD PTR _cntxt$[ebp]
	push	eax
	call	_qry_add_obj_field_val
	add	esp, 28					; 0000001cH
	test	eax, eax
	je	SHORT $L70517
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 281		; 00000119H
	jmp	$eva_err$70516
$L70517:

; 282  : 		DYNTAB_FREE(cntxt->session);

	mov	edx, DWORD PTR _cntxt$[ebp]
	add	edx, 29300				; 00007274H
	push	edx
	call	_dyntab_free
	add	esp, 4

; 283  : 		RETURN_OK;

	jmp	$eva_noerr$70520
$L70512:

; 285  : 
; 286  : 	/* Output page header */
; 287  : 	put_html_page_header(cntxt, NULL, "Fin de session", NULL, 3);

	push	3
	push	0
	push	OFFSET FLAT:$SG70523
	push	0
	mov	eax, DWORD PTR _cntxt$[ebp]
	push	eax
	call	_put_html_page_header
	add	esp, 20					; 00000014H

; 288  : 	form->html = &form->html_top;

	mov	ecx, DWORD PTR _form$[ebp]
	add	ecx, 216				; 000000d8H
	mov	edx, DWORD PTR _form$[ebp]
	mov	DWORD PTR [edx+232], ecx

; 289  : 	cntxt->b_terminate = 15;

	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29776], 15		; 0000000fH

; 290  : 	fflush(stdout);

	push	OFFSET FLAT:__iob+32
	call	_fflush
	add	esp, 4

; 291  : 	CTRL_CGINAMEBTN(&name, NULL, add_sz_str("ENDSESSION"));

	push	10					; 0000000aH
	push	OFFSET FLAT:$SG70526
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
	je	SHORT $L70525
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 291		; 00000123H
	jmp	$eva_err$70516
$L70525:

; 292  : 	printf(
; 293  : 		"<font face=Arial><br>"
; 294  : 		"<center><font size=+1><b>Terminer la session</b></font></center><br><hr><br>"
; 295  : 		"<u>Avertissement concernant la sécurité : </u>"
; 296  : 		"la plupart des navigateurs disposent d'une fonction 'Page précédente' qui permet "
; 297  : 		"de visualiser votre travail si vous laissez cette fenêtre ouverte. "
; 298  : 		"Il est donc fortement recommandé de fermer la fenêtre pour éviter toute indiscrétion, "
; 299  : 		"sauf si vous souhaitez vous identifier sous un autre nom. Dans ce cas utilisez le bouton ci dessous."
; 300  : 		"<br><br><center><input type=submit value='Changer d&#39;identification' name='%s'><br></center><hr>",
; 301  : 		name->data);

	mov	edx, DWORD PTR _name$[ebp]
	add	edx, 8
	push	edx
	push	OFFSET FLAT:$SG70527
	call	_printf
	add	esp, 8

; 302  : 
; 303  : 	/* Output forms with modified data in CGI */
; 304  : 	for(i = cntxt->nb_cgi - 1, j = 0; i; i--) if(cntxt->cgi[i].name[0] == 'F')

	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	ecx, DWORD PTR [eax+29652]
	sub	ecx, 1
	mov	DWORD PTR _i$[ebp], ecx
	mov	DWORD PTR _j$[ebp], 0
	jmp	SHORT $L70528
$L70529:
	mov	edx, DWORD PTR _i$[ebp]
	sub	edx, 1
	mov	DWORD PTR _i$[ebp], edx
$L70528:
	cmp	DWORD PTR _i$[ebp], 0
	je	$L70530
	mov	eax, DWORD PTR _i$[ebp]
	imul	eax, 56					; 00000038H
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	edx, DWORD PTR [ecx+29648]
	mov	eax, DWORD PTR [edx+eax]
	movsx	ecx, BYTE PTR [eax]
	cmp	ecx, 70					; 00000046H
	jne	$L70571

; 306  : 		/* Check if form was modified */
; 307  : 		CGIData *cgi = cntxt->cgi + i;

	mov	edx, DWORD PTR _i$[ebp]
	imul	edx, 56					; 00000038H
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	ecx, DWORD PTR [eax+29648]
	add	ecx, edx
	mov	DWORD PTR _cgi$70532[ebp], ecx

; 308  : 		char *bgcolor = table_row_bgcolor(cntxt, &tbl, j, NULL);

	push	0
	mov	edx, DWORD PTR _j$[ebp]
	push	edx
	lea	eax, DWORD PTR _tbl$[ebp]
	push	eax
	mov	ecx, DWORD PTR _cntxt$[ebp]
	push	ecx
	call	_table_row_bgcolor
	add	esp, 16					; 00000010H
	mov	DWORD PTR _bgcolor$70533[ebp], eax

; 309  : 		if(cgi_check_form_change(cntxt, cgi->IdForm, cgi->IdObj) != 1) continue;

	mov	edx, DWORD PTR _cgi$70532[ebp]
	mov	eax, DWORD PTR [edx+24]
	push	eax
	mov	ecx, DWORD PTR _cgi$70532[ebp]
	mov	edx, DWORD PTR [ecx+20]
	push	edx
	mov	eax, DWORD PTR _cntxt$[ebp]
	push	eax
	call	_cgi_check_form_change
	add	esp, 12					; 0000000cH
	cmp	eax, 1
	je	SHORT $L70535
	jmp	$L70529
$L70535:

; 310  : 		j++;

	mov	ecx, DWORD PTR _j$[ebp]
	add	ecx, 1
	mov	DWORD PTR _j$[ebp], ecx

; 311  : 
; 312  : 		/* Read object data */
; 313  : 		if(cgi_filter_values(cntxt, &cgival, 'D', ~0UL,
; 314  : 								cgi->IdObj ? ~0UL : cgi->IdForm,
; 315  : 								cgi->IdObj, NULL, "", 0, 0)) STACK_ERROR;

	mov	edx, DWORD PTR _cgi$70532[ebp]
	cmp	DWORD PTR [edx+24], 0
	je	SHORT $L70925
	mov	DWORD PTR -780+[ebp], -1
	jmp	SHORT $L70926
$L70925:
	mov	eax, DWORD PTR _cgi$70532[ebp]
	mov	ecx, DWORD PTR [eax+20]
	mov	DWORD PTR -780+[ebp], ecx
$L70926:
	push	0
	push	0
	push	OFFSET FLAT:$SG70538
	push	0
	mov	edx, DWORD PTR _cgi$70532[ebp]
	mov	eax, DWORD PTR [edx+24]
	push	eax
	mov	ecx, DWORD PTR -780+[ebp]
	push	ecx
	push	-1
	push	68					; 00000044H
	lea	edx, DWORD PTR _cgival$[ebp]
	push	edx
	mov	eax, DWORD PTR _cntxt$[ebp]
	push	eax
	call	_cgi_filter_values
	add	esp, 40					; 00000028H
	test	eax, eax
	je	SHORT $L70537
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 315		; 0000013bH
	jmp	$eva_err$70516
$L70537:

; 316  : 		if(cgi->IdObj)

	mov	edx, DWORD PTR _cgi$70532[ebp]
	cmp	DWORD PTR [edx+24], 0
	je	$L70548

; 318  : 			unsigned long k;
; 319  : 			if(qry_cache_idobj(&data, cgi->IdObj)) STACK_ERROR;

	push	3
	push	0
	mov	eax, DWORD PTR _cgi$70532[ebp]
	mov	ecx, DWORD PTR [eax+24]
	push	ecx
	lea	edx, DWORD PTR _data$[ebp]
	push	edx
	mov	eax, DWORD PTR _cntxt$[ebp]
	push	eax
	call	_qry_cache_idobj_field
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L70542
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 319		; 0000013fH
	jmp	$eva_err$70516
$L70542:

; 320  : 			if(qry_complete_data(cntxt, &cgival, &data, NULL, NULL)) STACK_ERROR;

	push	0
	push	0
	lea	edx, DWORD PTR _data$[ebp]
	push	edx
	lea	eax, DWORD PTR _cgival$[ebp]
	push	eax
	mov	ecx, DWORD PTR _cntxt$[ebp]
	push	ecx
	call	_qry_complete_data
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L70545
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 320		; 00000140H
	jmp	$eva_err$70516
$L70545:

; 321  : 			for(k = cgival.nbrows; k; k--)

	mov	eax, DWORD PTR _cgival$[ebp]
	mov	DWORD PTR _k$70540[ebp], eax
	jmp	SHORT $L70546
$L70547:
	mov	ecx, DWORD PTR _k$70540[ebp]
	sub	ecx, 1
	mov	DWORD PTR _k$70540[ebp], ecx
$L70546:
	cmp	DWORD PTR _k$70540[ebp], 0
	je	SHORT $L70548

; 322  : 				if(!strcmp(dyntab_cell(&cgival, k - 1, 0)->field, "_EVA_FORMSTAMP"))

	push	OFFSET FLAT:$SG70550
	push	0
	mov	edx, DWORD PTR _k$70540[ebp]
	sub	edx, 1
	push	edx
	lea	eax, DWORD PTR _cgival$[ebp]
	push	eax
	call	_dyntab_cell
	add	esp, 12					; 0000000cH
	mov	ecx, DWORD PTR [eax+8]
	push	ecx
	call	_strcmp
	add	esp, 8
	test	eax, eax
	jne	SHORT $L70549

; 323  : 					dyntab_del_rows(&cgival, k - 1, 1);

	push	1
	mov	edx, DWORD PTR _k$70540[ebp]
	sub	edx, 1
	push	edx
	lea	eax, DWORD PTR _cgival$[ebp]
	push	eax
	call	_dyntab_del_rows
	add	esp, 12					; 0000000cH
$L70549:

; 324  : 		}

	jmp	SHORT $L70547
$L70548:

; 325  : 		DYNTAB_ADD_INT(&cgival, cgival.nbrows, 0, cgi->IdForm);

	mov	BYTE PTR __tmp$70551[ebp], 0
	mov	ecx, 7
	xor	eax, eax
	lea	edi, DWORD PTR __tmp$70551[ebp+1]
	rep stosd
	stosw
	stosb
	mov	ecx, DWORD PTR _cgi$70532[ebp]
	mov	edx, DWORD PTR [ecx+20]
	push	edx
	push	OFFSET FLAT:$SG70552
	lea	eax, DWORD PTR __tmp$70551[ebp]
	push	eax
	call	_sprintf
	add	esp, 12					; 0000000cH
	push	0
	push	0
	push	0
	lea	ecx, DWORD PTR __tmp$70551[ebp]
	push	ecx
	push	0
	mov	edx, DWORD PTR _cgival$[ebp]
	push	edx
	lea	eax, DWORD PTR _cgival$[ebp]
	push	eax
	call	_dyntab_add
	add	esp, 28					; 0000001cH
	test	eax, eax
	je	SHORT $L70554
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29872], OFFSET FLAT:$SG70556
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 325		; 00000145H
	jmp	$eva_err$70516
$L70554:

; 327  : 			DynTableCell *c = dyntab_cell(&cgival, cgival.nbrows - 1, 0);

	push	0
	mov	eax, DWORD PTR _cgival$[ebp]
	sub	eax, 1
	push	eax
	lea	ecx, DWORD PTR _cgival$[ebp]
	push	ecx
	call	_dyntab_cell
	add	esp, 12					; 0000000cH
	mov	DWORD PTR _c$70557[ebp], eax

; 328  : 			c->field = "_EVA_FORMSTAMP";

	mov	edx, DWORD PTR _c$70557[ebp]
	mov	DWORD PTR [edx+8], OFFSET FLAT:$SG70558

; 329  : 			c->b_dontfreefield = 1;

	mov	eax, DWORD PTR _c$70557[ebp]
	mov	BYTE PTR [eax+15], 1

; 330  : 			c->IdObj = cgi->IdObj;

	mov	ecx, DWORD PTR _c$70557[ebp]
	mov	edx, DWORD PTR _cgi$70532[ebp]
	mov	eax, DWORD PTR [edx+24]
	mov	DWORD PTR [ecx+20], eax

; 332  : 
; 333  : 		/* Output open button */
; 334  : 		DYNBUF_ADD_STR(form->html, "<tr>");

	push	0
	push	0
	push	4
	push	OFFSET FLAT:$SG70561
	mov	ecx, DWORD PTR _form$[ebp]
	mov	edx, DWORD PTR [ecx+232]
	push	edx
	call	_dynbuf_add
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L70560
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29872], OFFSET FLAT:$SG70563
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 334		; 0000014eH
	jmp	$eva_err$70516
$L70560:

; 335  : 		if(ctrl_add_symbol_btn(cntxt, NULL, NULL, &cgival, 0, bgcolor, "SYMBOL+NAME+LABEL+OBJNOTES"))

	push	OFFSET FLAT:$SG70567
	mov	edx, DWORD PTR _bgcolor$70533[ebp]
	push	edx
	push	0
	lea	eax, DWORD PTR _cgival$[ebp]
	push	eax
	push	0
	push	0
	mov	ecx, DWORD PTR _cntxt$[ebp]
	push	ecx
	call	_ctrl_add_symbol_btn
	add	esp, 28					; 0000001cH
	test	eax, eax
	je	SHORT $L70566

; 336  : 			CLEAR_ERROR;

	push	336					; 00000150H
	push	OFFSET FLAT:$SG70568
	push	OFFSET FLAT:$SG70569
	mov	edx, DWORD PTR _cntxt$[ebp]
	push	edx
	call	_err_clear
	add	esp, 16					; 00000010H
$L70566:

; 337  : 		DYNBUF_ADD_STR(form->html, "</tr>");

	push	0
	push	0
	push	5
	push	OFFSET FLAT:$SG70572
	mov	eax, DWORD PTR _form$[ebp]
	mov	ecx, DWORD PTR [eax+232]
	push	ecx
	call	_dynbuf_add
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L70571
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29872], OFFSET FLAT:$SG70574
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 337		; 00000151H
	jmp	SHORT $eva_err$70516
$L70571:

; 339  : 
; 340  : 	/* Output message & open buttons for modified forms if applicable */
; 341  : 	if(form->html_top)

	jmp	$L70529
$L70530:
	mov	ecx, DWORD PTR _form$[ebp]
	cmp	DWORD PTR [ecx+216], 0
	je	SHORT $L70575

; 343  : 		printf("%s%s%s",
; 344  : 			"<u>Attention : vous avez modifié les formulaires suivants sans les enregistrer</u><br><br>"
; 345  : 			"<table border=0 width=100% bgcolor=#EEEEEE cellspacing=0 cellpadding=2><tr>",
; 346  : 			form->html_top->data,
; 347  : 			"</tr></table><br><center>"
; 348  : 			"<li>si voulez enregistrer vos modifications, ouvrez chaque fiche modifiée et enregistrez-la<br><br>"
; 349  : 			"<li>si vous ne voulez pas enregistrer vos modifications, fermez cette fenêtre</li>"
; 350  : 			"<br><a href='javascript:window.close()' title='Ferme cette fenêtre'>"
; 351  : 			"<br><br><img src='../img/_eva_btn_closenosave_fr.gif' border=0></a><br><br></center>");

	push	OFFSET FLAT:$SG70576
	mov	edx, DWORD PTR _form$[ebp]
	mov	eax, DWORD PTR [edx+216]
	add	eax, 8
	push	eax
	push	OFFSET FLAT:$SG70577
	push	OFFSET FLAT:$SG70578
	call	_printf
	add	esp, 16					; 00000010H

; 353  : 	else

	jmp	SHORT $eva_noerr$70520
$L70575:

; 355  : 		/* Close window */
; 356  : 		printf("<script>window.close();</script>");

	push	OFFSET FLAT:$SG70580
	call	_printf
	add	esp, 4
$eva_noerr$70520:

; 358  : 
; 359  : 	RETURN_OK_CLEANUP;

	push	0
	push	OFFSET FLAT:$SG70581
	push	OFFSET FLAT:$SG70582
	mov	ecx, DWORD PTR _cntxt$[ebp]
	push	ecx
	call	_err_clear
	add	esp, 16					; 00000010H
$eva_err$70516:
	mov	edx, DWORD PTR _cntxt$[ebp]
	cmp	DWORD PTR [edx+29872], 0
	je	SHORT $L70583
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	ecx, DWORD PTR [eax+29900]
	push	ecx
	push	OFFSET FLAT:$SG70584
	push	OFFSET FLAT:$SG70585
	mov	edx, DWORD PTR _cntxt$[ebp]
	push	edx
	call	_err_add_context
	add	esp, 16					; 00000010H
$L70583:
	lea	eax, DWORD PTR _data$[ebp]
	push	eax
	call	_dyntab_free
	add	esp, 4
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

; 360  : }

	pop	edi
	mov	esp, ebp
	pop	ebp
	ret	0
_action_end_session ENDP
_TEXT	ENDS
PUBLIC	_action_delete
EXTRN	_sql_exec_query:NEAR
EXTRN	_qry_values_list:NEAR
EXTRN	_qry_get_obj_data:NEAR
EXTRN	_dynbuf_add3:NEAR
EXTRN	_dynbuf_add3_int:NEAR
EXTRN	_qry_add_val:NEAR
_DATA	SEGMENT
	ORG $+1
$SG70609 DB	'_EVA_DELOBJ', 00H
$SG70612 DB	'_EVA_DELETE_TYPE', 00H
	ORG $+3
$SG70617 DB	'_EVA_DELETE_ALL', 00H
$SG70622 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70626 DB	'(DateDel IS NULL AND IdRelObj IN (', 00H
	ORG $+1
$SG70628 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70631 DB	',', 00H
	ORG $+2
$SG70632 DB	') AND IdObj NOT IN (', 00H
	ORG $+3
$SG70634 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70638 DB	'))', 00H
	ORG $+1
$SG70640 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70644 DB	'_EVA_DELETE_KEEPALL', 00H
$SG70647 DB	'(DateDel IS NULL AND IdObj IN (', 00H
$SG70649 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70652 DB	',', 00H
	ORG $+2
$SG70653 DB	') AND IF(ISNULL(IdRelObj),1,IdRelObj NOT IN (', 00H
	ORG $+2
$SG70655 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70659 DB	')))', 00H
$SG70661 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70676 DB	0aH, 'WHERE IdWhoCr IN(', 00H
	ORG $+1
$SG70677 DB	'-- Handle IdWhoCr', 0aH, 'UPDATE TLink SET IdWhoCr=', 00H
$SG70679 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70683 DB	')', 00H
	ORG $+2
$SG70685 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70688 DB	0aH, 'WHERE IdWhoDel IN(', 00H
$SG70689 DB	'-- Handle IdWhoDel', 0aH, 'UPDATE TLink SET IdWhoDel=', 00H
	ORG $+2
$SG70691 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70695 DB	')', 00H
	ORG $+2
$SG70697 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70701 DB	'''', 00H
	ORG $+2
$SG70702 DB	'-- Delete objects & links', 0aH, 'UPDATE TLink SET DateD'
	DB	'el=''', 00H
	ORG $+3
$SG70704 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70707 DB	0aH, 'WHERE DateDel IS NULL AND IdObj IN(', 00H
	ORG $+3
$SG70708 DB	',IdWhoDel=', 00H
	ORG $+1
$SG70710 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70714 DB	')', 00H
	ORG $+2
$SG70716 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70720 DB	'''', 00H
	ORG $+2
$SG70721 DB	'-- Delete objects & links', 0aH, 'UPDATE TLink SET DateD'
	DB	'el=''', 00H
	ORG $+3
$SG70723 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70726 DB	0aH, 'WHERE DateDel IS NULL AND IdRelObj IN(', 00H
$SG70727 DB	',IdWhoDel=', 00H
	ORG $+1
$SG70729 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70733 DB	')', 00H
	ORG $+2
$SG70735 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70754 DB	'D:\Travail\ABI\EVA\V4.0\CGI\Brunix-2016\action_misc.c', 00H
	ORG $+2
$SG70755 DB	'action_delete', 00H
	ORG $+2
$SG70757 DB	'D:\Travail\ABI\EVA\V4.0\CGI\Brunix-2016\action_misc.c', 00H
	ORG $+2
$SG70758 DB	'action_delete', 00H
_DATA	ENDS
_TEXT	SEGMENT
_c$70666 = -92
_c$70672 = -96
_idform$70738 = -100
_idobj$70743 = -104
_cgi$70748 = -108
_cntxt$ = 8
_form$ = -32
_i$ = -40
_j$ = -64
_ctrl_delobj$ = -8
_ctrl_delmode$ = -68
_keepobj$ = -36
_t_keepobj$ = -28
_objdata$ = -60
_linkdata$ = -88
_sql$ = -4
_action_delete PROC NEAR

; 376  : ){

	push	ebp
	mov	ebp, esp
	sub	esp, 108				; 0000006cH

; 377  : 
; 378  : 	EVA_form *form = cntxt->form;

	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	ecx, DWORD PTR [eax+80]
	mov	DWORD PTR _form$[ebp], ecx

; 379  : 	unsigned long i, j;
; 380  : 	EVA_ctrl *ctrl_delobj = 0;

	mov	DWORD PTR _ctrl_delobj$[ebp], 0

; 381  : 	EVA_ctrl *ctrl_delmode = 0;

	mov	DWORD PTR _ctrl_delmode$[ebp], 0

; 382  : 	unsigned long keepobj = 0;

	mov	DWORD PTR _keepobj$[ebp], 0

; 383  : 	DynTable t_keepobj = {0};

	mov	DWORD PTR _t_keepobj$[ebp], 0
	xor	edx, edx
	mov	DWORD PTR _t_keepobj$[ebp+4], edx
	mov	DWORD PTR _t_keepobj$[ebp+8], edx
	mov	DWORD PTR _t_keepobj$[ebp+12], edx
	mov	DWORD PTR _t_keepobj$[ebp+16], edx

; 384  : 	DynTable objdata = {0};

	mov	DWORD PTR _objdata$[ebp], 0
	xor	eax, eax
	mov	DWORD PTR _objdata$[ebp+4], eax
	mov	DWORD PTR _objdata$[ebp+8], eax
	mov	DWORD PTR _objdata$[ebp+12], eax
	mov	DWORD PTR _objdata$[ebp+16], eax

; 385  : 	DynTable linkdata = {0};

	mov	DWORD PTR _linkdata$[ebp], 0
	xor	ecx, ecx
	mov	DWORD PTR _linkdata$[ebp+4], ecx
	mov	DWORD PTR _linkdata$[ebp+8], ecx
	mov	DWORD PTR _linkdata$[ebp+12], ecx
	mov	DWORD PTR _linkdata$[ebp+16], ecx

; 386  : 	DynBuffer *sql = NULL;

	mov	DWORD PTR _sql$[ebp], 0

; 387  : 
; 388  : 	/* Retrieve delete parameters controls index */
; 389  : 	for(i = 0; i < form->nb_ctrl; i++)

	mov	DWORD PTR _i$[ebp], 0
	jmp	SHORT $L70605
$L70606:
	mov	edx, DWORD PTR _i$[ebp]
	add	edx, 1
	mov	DWORD PTR _i$[ebp], edx
$L70605:
	mov	eax, DWORD PTR _form$[ebp]
	mov	ecx, DWORD PTR _i$[ebp]
	cmp	ecx, DWORD PTR [eax+4]
	jae	SHORT $L70607

; 390  : 		if(!strcmp(form->ctrl[i].FIELD, "_EVA_DELOBJ")) ctrl_delobj = form->ctrl + i;

	push	OFFSET FLAT:$SG70609
	mov	edx, DWORD PTR _i$[ebp]
	imul	edx, 480				; 000001e0H
	mov	eax, DWORD PTR _form$[ebp]
	mov	ecx, DWORD PTR [eax]
	mov	edx, DWORD PTR [ecx+edx+280]
	push	edx
	call	_strcmp
	add	esp, 8
	test	eax, eax
	jne	SHORT $L70608
	mov	eax, DWORD PTR _i$[ebp]
	imul	eax, 480				; 000001e0H
	mov	ecx, DWORD PTR _form$[ebp]
	mov	edx, DWORD PTR [ecx]
	add	edx, eax
	mov	DWORD PTR _ctrl_delobj$[ebp], edx

; 391  : 		else if(!strcmp(form->ctrl[i].FIELD, "_EVA_DELETE_TYPE")) ctrl_delmode = form->ctrl + i;

	jmp	SHORT $L70611
$L70608:
	push	OFFSET FLAT:$SG70612
	mov	eax, DWORD PTR _i$[ebp]
	imul	eax, 480				; 000001e0H
	mov	ecx, DWORD PTR _form$[ebp]
	mov	edx, DWORD PTR [ecx]
	mov	eax, DWORD PTR [edx+eax+280]
	push	eax
	call	_strcmp
	add	esp, 8
	test	eax, eax
	jne	SHORT $L70611
	mov	ecx, DWORD PTR _i$[ebp]
	imul	ecx, 480				; 000001e0H
	mov	edx, DWORD PTR _form$[ebp]
	mov	eax, DWORD PTR [edx]
	add	eax, ecx
	mov	DWORD PTR _ctrl_delmode$[ebp], eax
$L70611:

; 392  : 	if(!ctrl_delobj) RETURN_OK;

	jmp	$L70606
$L70607:
	cmp	DWORD PTR _ctrl_delobj$[ebp], 0
	jne	SHORT $L70613
	jmp	$eva_noerr$70614
$L70613:

; 393  : 
; 394  : 	/* If not delete all mode */
; 395  : 	if(!ctrl_delmode || strcmp(dyntab_val(&ctrl_delmode->val, 0, 0), "_EVA_DELETE_ALL"))

	cmp	DWORD PTR _ctrl_delmode$[ebp], 0
	je	SHORT $L70616
	push	OFFSET FLAT:$SG70617
	push	0
	push	0
	mov	ecx, DWORD PTR _ctrl_delmode$[ebp]
	add	ecx, 64					; 00000040H
	push	ecx
	call	_dyntab_val
	add	esp, 12					; 0000000cH
	push	eax
	call	_strcmp
	add	esp, 8
	test	eax, eax
	je	$L70615
$L70616:

; 397  : 		/* Keep 1st object : save id & remove from delete list */
; 398  : 		if(ctrl_delobj->val.nbrows < 2) RETURN_OK;

	mov	edx, DWORD PTR _ctrl_delobj$[ebp]
	cmp	DWORD PTR [edx+64], 2
	jae	SHORT $L70618
	jmp	$eva_noerr$70614
$L70618:

; 399  : 		keepobj = DYNTAB_TOUL(&ctrl_delobj->val);

	push	10					; 0000000aH
	push	0
	push	0
	push	0
	mov	eax, DWORD PTR _ctrl_delobj$[ebp]
	add	eax, 64					; 00000040H
	push	eax
	call	_dyntab_val
	add	esp, 12					; 0000000cH
	push	eax
	call	_strtoul
	add	esp, 12					; 0000000cH
	mov	DWORD PTR _keepobj$[ebp], eax

; 400  : 		DYNTAB_ADD_CELL(&t_keepobj, 0, 0, &ctrl_delobj->val, 0, 0);

	push	1
	push	0
	push	0
	mov	ecx, DWORD PTR _ctrl_delobj$[ebp]
	add	ecx, 64					; 00000040H
	push	ecx
	call	_dyntab_cell
	add	esp, 12					; 0000000cH
	push	eax
	push	0
	push	0
	lea	edx, DWORD PTR _t_keepobj$[ebp]
	push	edx
	call	_dyntab_copy
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L70620
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29872], OFFSET FLAT:$SG70622
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 400		; 00000190H
	jmp	$eva_err$70623
$L70620:

; 401  : 		dyntab_del_rows(&ctrl_delobj->val, 0, 1);

	push	1
	push	0
	mov	edx, DWORD PTR _ctrl_delobj$[ebp]
	add	edx, 64					; 00000040H
	push	edx
	call	_dyntab_del_rows
	add	esp, 12					; 0000000cH

; 402  : 
; 403  : 		/* Read links to be transfered to kept object */
; 404  : 		DYNBUF_ADD_STR(&sql, "(DateDel IS NULL AND IdRelObj IN (");

	push	0
	push	0
	push	34					; 00000022H
	push	OFFSET FLAT:$SG70626
	lea	eax, DWORD PTR _sql$[ebp]
	push	eax
	call	_dynbuf_add
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L70625
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29872], OFFSET FLAT:$SG70628
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 404		; 00000194H
	jmp	$eva_err$70623
$L70625:

; 405  : 		if(qry_values_list(cntxt, &ctrl_delobj->val, 0, &sql)) STACK_ERROR;

	lea	eax, DWORD PTR _sql$[ebp]
	push	eax
	push	0
	mov	ecx, DWORD PTR _ctrl_delobj$[ebp]
	add	ecx, 64					; 00000040H
	push	ecx
	mov	edx, DWORD PTR _cntxt$[ebp]
	push	edx
	call	_qry_values_list
	add	esp, 16					; 00000010H
	test	eax, eax
	je	SHORT $L70629
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 405		; 00000195H
	jmp	$eva_err$70623
$L70629:

; 406  : 		DYNBUF_ADD3_INT(&sql, ") AND IdObj NOT IN (", keepobj, ",");

	push	1
	push	OFFSET FLAT:$SG70631
	mov	ecx, DWORD PTR _keepobj$[ebp]
	push	ecx
	push	20					; 00000014H
	push	OFFSET FLAT:$SG70632
	lea	edx, DWORD PTR _sql$[ebp]
	push	edx
	call	_dynbuf_add3_int
	add	esp, 24					; 00000018H
	test	eax, eax
	je	SHORT $L70630
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29872], OFFSET FLAT:$SG70634
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 406		; 00000196H
	jmp	$eva_err$70623
$L70630:

; 407  : 		if(qry_values_list(cntxt, &ctrl_delobj->val, 0, &sql)) STACK_ERROR;

	lea	edx, DWORD PTR _sql$[ebp]
	push	edx
	push	0
	mov	eax, DWORD PTR _ctrl_delobj$[ebp]
	add	eax, 64					; 00000040H
	push	eax
	mov	ecx, DWORD PTR _cntxt$[ebp]
	push	ecx
	call	_qry_values_list
	add	esp, 16					; 00000010H
	test	eax, eax
	je	SHORT $L70635
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 407		; 00000197H
	jmp	$eva_err$70623
$L70635:

; 408  : 		DYNBUF_ADD_STR(&sql, "))");

	push	0
	push	0
	push	2
	push	OFFSET FLAT:$SG70638
	lea	eax, DWORD PTR _sql$[ebp]
	push	eax
	call	_dynbuf_add
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L70637
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29872], OFFSET FLAT:$SG70640
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 408		; 00000198H
	jmp	$eva_err$70623
$L70637:

; 409  : 		if(qry_get_obj_data(cntxt, &linkdata, sql->data)) STACK_ERROR;

	mov	eax, DWORD PTR _sql$[ebp]
	add	eax, 8
	push	eax
	lea	ecx, DWORD PTR _linkdata$[ebp]
	push	ecx
	mov	edx, DWORD PTR _cntxt$[ebp]
	push	edx
	call	_qry_get_obj_data
	add	esp, 12					; 0000000cH
	test	eax, eax
	je	SHORT $L70641
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 409		; 00000199H
	jmp	$eva_err$70623
$L70641:

; 410  : 		M_FREE(sql);

	mov	ecx, DWORD PTR _sql$[ebp]
	push	ecx
	call	_mem_free
	add	esp, 4
	mov	DWORD PTR _sql$[ebp], 0

; 411  : 
; 412  : 		/* If fusion mode */
; 413  : 		if(!ctrl_delmode || !strcmp(dyntab_val(&ctrl_delmode->val, 0, 0), "_EVA_DELETE_KEEPALL"))

	cmp	DWORD PTR _ctrl_delmode$[ebp], 0
	je	SHORT $L70643
	push	OFFSET FLAT:$SG70644
	push	0
	push	0
	mov	edx, DWORD PTR _ctrl_delmode$[ebp]
	add	edx, 64					; 00000040H
	push	edx
	call	_dyntab_val
	add	esp, 12					; 0000000cH
	push	eax
	call	_strcmp
	add	esp, 8
	test	eax, eax
	jne	$L70665
$L70643:

; 415  : 			/* Read objects data if fusion mode */
; 416  : 			DYNBUF_ADD_STR(&sql, "(DateDel IS NULL AND IdObj IN (");

	push	0
	push	0
	push	31					; 0000001fH
	push	OFFSET FLAT:$SG70647
	lea	eax, DWORD PTR _sql$[ebp]
	push	eax
	call	_dynbuf_add
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L70646
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29872], OFFSET FLAT:$SG70649
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 416		; 000001a0H
	jmp	$eva_err$70623
$L70646:

; 417  : 			if(qry_values_list(cntxt, &ctrl_delobj->val, 0, &sql)) STACK_ERROR;

	lea	eax, DWORD PTR _sql$[ebp]
	push	eax
	push	0
	mov	ecx, DWORD PTR _ctrl_delobj$[ebp]
	add	ecx, 64					; 00000040H
	push	ecx
	mov	edx, DWORD PTR _cntxt$[ebp]
	push	edx
	call	_qry_values_list
	add	esp, 16					; 00000010H
	test	eax, eax
	je	SHORT $L70650
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 417		; 000001a1H
	jmp	$eva_err$70623
$L70650:

; 418  : 			DYNBUF_ADD3_INT(&sql, ") AND IF(ISNULL(IdRelObj),1,IdRelObj NOT IN (", keepobj, ",");

	push	1
	push	OFFSET FLAT:$SG70652
	mov	ecx, DWORD PTR _keepobj$[ebp]
	push	ecx
	push	45					; 0000002dH
	push	OFFSET FLAT:$SG70653
	lea	edx, DWORD PTR _sql$[ebp]
	push	edx
	call	_dynbuf_add3_int
	add	esp, 24					; 00000018H
	test	eax, eax
	je	SHORT $L70651
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29872], OFFSET FLAT:$SG70655
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 418		; 000001a2H
	jmp	$eva_err$70623
$L70651:

; 419  : 			if(qry_values_list(cntxt, &ctrl_delobj->val, 0, &sql)) STACK_ERROR;

	lea	edx, DWORD PTR _sql$[ebp]
	push	edx
	push	0
	mov	eax, DWORD PTR _ctrl_delobj$[ebp]
	add	eax, 64					; 00000040H
	push	eax
	mov	ecx, DWORD PTR _cntxt$[ebp]
	push	ecx
	call	_qry_values_list
	add	esp, 16					; 00000010H
	test	eax, eax
	je	SHORT $L70656
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 419		; 000001a3H
	jmp	$eva_err$70623
$L70656:

; 420  : 			DYNBUF_ADD_STR(&sql, ")))");

	push	0
	push	0
	push	3
	push	OFFSET FLAT:$SG70659
	lea	eax, DWORD PTR _sql$[ebp]
	push	eax
	call	_dynbuf_add
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L70658
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29872], OFFSET FLAT:$SG70661
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 420		; 000001a4H
	jmp	$eva_err$70623
$L70658:

; 421  : 			if(qry_get_obj_data(cntxt, &objdata, sql->data)) STACK_ERROR;

	mov	eax, DWORD PTR _sql$[ebp]
	add	eax, 8
	push	eax
	lea	ecx, DWORD PTR _objdata$[ebp]
	push	ecx
	mov	edx, DWORD PTR _cntxt$[ebp]
	push	edx
	call	_qry_get_obj_data
	add	esp, 12					; 0000000cH
	test	eax, eax
	je	SHORT $L70662
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 421		; 000001a5H
	jmp	$eva_err$70623
$L70662:

; 422  : 			M_FREE(sql);

	mov	ecx, DWORD PTR _sql$[ebp]
	push	ecx
	call	_mem_free
	add	esp, 4
	mov	DWORD PTR _sql$[ebp], 0

; 423  : 
; 424  : 			/* Copy other objects data to kept object */
; 425  : 			for(i = 0; i < objdata.nbrows; i++)

	mov	DWORD PTR _i$[ebp], 0
	jmp	SHORT $L70663
$L70664:
	mov	edx, DWORD PTR _i$[ebp]
	add	edx, 1
	mov	DWORD PTR _i$[ebp], edx
$L70663:
	mov	eax, DWORD PTR _i$[ebp]
	cmp	eax, DWORD PTR _objdata$[ebp]
	jae	SHORT $L70665

; 427  : 				DynTableCell *c = dyntab_cell(&objdata, i, 0);

	push	0
	mov	ecx, DWORD PTR _i$[ebp]
	push	ecx
	lea	edx, DWORD PTR _objdata$[ebp]
	push	edx
	call	_dyntab_cell
	add	esp, 12					; 0000000cH
	mov	DWORD PTR _c$70666[ebp], eax

; 428  : 				c->IdObj = keepobj;

	mov	eax, DWORD PTR _c$70666[ebp]
	mov	ecx, DWORD PTR _keepobj$[ebp]
	mov	DWORD PTR [eax+20], ecx

; 429  : 				if(qry_add_val(cntxt, c, 1, NULL)) STACK_ERROR;

	push	0
	push	1
	mov	edx, DWORD PTR _c$70666[ebp]
	push	edx
	mov	eax, DWORD PTR _cntxt$[ebp]
	push	eax
	call	_qry_add_val
	add	esp, 16					; 00000010H
	test	eax, eax
	je	SHORT $L70668
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 429		; 000001adH
	jmp	$eva_err$70623
$L70668:

; 430  : 			}

	jmp	SHORT $L70664
$L70665:

; 432  : 
; 433  : 		/* Copy links to kept object */
; 434  : 		for(i = 0; i < linkdata.nbrows; i++)

	mov	DWORD PTR _i$[ebp], 0
	jmp	SHORT $L70669
$L70670:
	mov	edx, DWORD PTR _i$[ebp]
	add	edx, 1
	mov	DWORD PTR _i$[ebp], edx
$L70669:
	mov	eax, DWORD PTR _i$[ebp]
	cmp	eax, DWORD PTR _linkdata$[ebp]
	jae	$L70671

; 436  : 			DynTableCell *c = dyntab_cell(&linkdata, i, 0);

	push	0
	mov	ecx, DWORD PTR _i$[ebp]
	push	ecx
	lea	edx, DWORD PTR _linkdata$[ebp]
	push	edx
	call	_dyntab_cell
	add	esp, 12					; 0000000cH
	mov	DWORD PTR _c$70672[ebp], eax

; 437  : 			M_FREE(c->txt);

	mov	eax, DWORD PTR _c$70672[ebp]
	mov	ecx, DWORD PTR [eax]
	push	ecx
	call	_mem_free
	add	esp, 4
	mov	edx, DWORD PTR _c$70672[ebp]
	mov	DWORD PTR [edx], 0

; 438  : 			c->b_dontfreetxt = 1;

	mov	eax, DWORD PTR _c$70672[ebp]
	mov	BYTE PTR [eax+14], 1

; 439  : 			c->txt = dyntab_val(&t_keepobj, 0, 0);

	push	0
	push	0
	lea	ecx, DWORD PTR _t_keepobj$[ebp]
	push	ecx
	call	_dyntab_val
	add	esp, 12					; 0000000cH
	mov	edx, DWORD PTR _c$70672[ebp]
	mov	DWORD PTR [edx], eax

; 440  : 			c->len = dyntab_sz(&t_keepobj, 0, 0);

	push	0
	push	0
	lea	eax, DWORD PTR _t_keepobj$[ebp]
	push	eax
	call	_dyntab_sz
	add	esp, 12					; 0000000cH
	mov	ecx, DWORD PTR _c$70672[ebp]
	mov	DWORD PTR [ecx+4], eax

; 441  : 			if(qry_add_val(cntxt, c, 1, NULL)) STACK_ERROR;

	push	0
	push	1
	mov	edx, DWORD PTR _c$70672[ebp]
	push	edx
	mov	eax, DWORD PTR _cntxt$[ebp]
	push	eax
	call	_qry_add_val
	add	esp, 16					; 00000010H
	test	eax, eax
	je	SHORT $L70674
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 441		; 000001b9H
	jmp	$eva_err$70623
$L70674:

; 442  : 		}

	jmp	$L70670
$L70671:

; 446  : 			"UPDATE TLink SET IdWhoCr=", keepobj, "\nWHERE IdWhoCr IN(");

	push	18					; 00000012H
	push	OFFSET FLAT:$SG70676
	mov	edx, DWORD PTR _keepobj$[ebp]
	push	edx
	push	43					; 0000002bH
	push	OFFSET FLAT:$SG70677
	lea	eax, DWORD PTR _sql$[ebp]
	push	eax
	call	_dynbuf_add3_int
	add	esp, 24					; 00000018H
	test	eax, eax
	je	SHORT $L70675
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29872], OFFSET FLAT:$SG70679
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 446		; 000001beH
	jmp	$eva_err$70623
$L70675:

; 447  : 		if(qry_values_list(cntxt, &ctrl_delobj->val, 0, &sql)) STACK_ERROR;

	lea	eax, DWORD PTR _sql$[ebp]
	push	eax
	push	0
	mov	ecx, DWORD PTR _ctrl_delobj$[ebp]
	add	ecx, 64					; 00000040H
	push	ecx
	mov	edx, DWORD PTR _cntxt$[ebp]
	push	edx
	call	_qry_values_list
	add	esp, 16					; 00000010H
	test	eax, eax
	je	SHORT $L70680
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 447		; 000001bfH
	jmp	$eva_err$70623
$L70680:

; 448  : 		DYNBUF_ADD_STR(&sql, ")");

	push	0
	push	0
	push	1
	push	OFFSET FLAT:$SG70683
	lea	ecx, DWORD PTR _sql$[ebp]
	push	ecx
	call	_dynbuf_add
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L70682
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29872], OFFSET FLAT:$SG70685
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 448		; 000001c0H
	jmp	$eva_err$70623
$L70682:

; 449  : 		if(sql_exec_query(cntxt, sql->data)) STACK_ERROR;

	mov	ecx, DWORD PTR _sql$[ebp]
	add	ecx, 8
	push	ecx
	mov	edx, DWORD PTR _cntxt$[ebp]
	push	edx
	call	_sql_exec_query
	add	esp, 8
	test	eax, eax
	je	SHORT $L70686
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 449		; 000001c1H
	jmp	$eva_err$70623
$L70686:

; 450  : 		M_FREE(sql);

	mov	ecx, DWORD PTR _sql$[ebp]
	push	ecx
	call	_mem_free
	add	esp, 4
	mov	DWORD PTR _sql$[ebp], 0

; 454  : 			"UPDATE TLink SET IdWhoDel=", keepobj, "\nWHERE IdWhoDel IN(");

	push	19					; 00000013H
	push	OFFSET FLAT:$SG70688
	mov	edx, DWORD PTR _keepobj$[ebp]
	push	edx
	push	45					; 0000002dH
	push	OFFSET FLAT:$SG70689
	lea	eax, DWORD PTR _sql$[ebp]
	push	eax
	call	_dynbuf_add3_int
	add	esp, 24					; 00000018H
	test	eax, eax
	je	SHORT $L70687
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29872], OFFSET FLAT:$SG70691
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 454		; 000001c6H
	jmp	$eva_err$70623
$L70687:

; 455  : 		if(qry_values_list(cntxt, &ctrl_delobj->val, 0, &sql)) STACK_ERROR;

	lea	eax, DWORD PTR _sql$[ebp]
	push	eax
	push	0
	mov	ecx, DWORD PTR _ctrl_delobj$[ebp]
	add	ecx, 64					; 00000040H
	push	ecx
	mov	edx, DWORD PTR _cntxt$[ebp]
	push	edx
	call	_qry_values_list
	add	esp, 16					; 00000010H
	test	eax, eax
	je	SHORT $L70692
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 455		; 000001c7H
	jmp	$eva_err$70623
$L70692:

; 456  : 		DYNBUF_ADD_STR(&sql, ")");

	push	0
	push	0
	push	1
	push	OFFSET FLAT:$SG70695
	lea	ecx, DWORD PTR _sql$[ebp]
	push	ecx
	call	_dynbuf_add
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L70694
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29872], OFFSET FLAT:$SG70697
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 456		; 000001c8H
	jmp	$eva_err$70623
$L70694:

; 457  : 		if(sql_exec_query(cntxt, sql->data)) STACK_ERROR;

	mov	ecx, DWORD PTR _sql$[ebp]
	add	ecx, 8
	push	ecx
	mov	edx, DWORD PTR _cntxt$[ebp]
	push	edx
	call	_sql_exec_query
	add	esp, 8
	test	eax, eax
	je	SHORT $L70698
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 457		; 000001c9H
	jmp	$eva_err$70623
$L70698:

; 458  : 		M_FREE(sql);

	mov	ecx, DWORD PTR _sql$[ebp]
	push	ecx
	call	_mem_free
	add	esp, 4
	mov	DWORD PTR _sql$[ebp], 0
$L70615:

; 463  : 		"UPDATE TLink SET DateDel='", cntxt->timestamp, 0, NO_CONV, "'");

	push	1
	push	OFFSET FLAT:$SG70701
	push	0
	push	0
	push	0
	mov	edx, DWORD PTR _cntxt$[ebp]
	add	edx, 29704				; 00007408H
	push	edx
	push	52					; 00000034H
	push	OFFSET FLAT:$SG70702
	lea	eax, DWORD PTR _sql$[ebp]
	push	eax
	call	_dynbuf_add3
	add	esp, 36					; 00000024H
	test	eax, eax
	je	SHORT $L70700
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29872], OFFSET FLAT:$SG70704
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 463		; 000001cfH
	jmp	$eva_err$70623
$L70700:

; 464  : 	DYNBUF_ADD3_CELL(&sql, ",IdWhoDel=", &cntxt->id_user, 0, 0, NO_CONV, "\nWHERE DateDel IS NULL AND IdObj IN(");

	push	36					; 00000024H
	push	OFFSET FLAT:$SG70707
	push	0
	push	0
	push	0
	push	0
	mov	eax, DWORD PTR _cntxt$[ebp]
	add	eax, 29408				; 000072e0H
	push	eax
	call	_dyntab_sz
	add	esp, 12					; 0000000cH
	push	eax
	push	0
	push	0
	mov	ecx, DWORD PTR _cntxt$[ebp]
	add	ecx, 29408				; 000072e0H
	push	ecx
	call	_dyntab_val
	add	esp, 12					; 0000000cH
	push	eax
	push	10					; 0000000aH
	push	OFFSET FLAT:$SG70708
	lea	edx, DWORD PTR _sql$[ebp]
	push	edx
	call	_dynbuf_add3
	add	esp, 36					; 00000024H
	test	eax, eax
	je	SHORT $L70706
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29872], OFFSET FLAT:$SG70710
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 464		; 000001d0H
	jmp	$eva_err$70623
$L70706:

; 465  : 	if(qry_values_list(cntxt, &ctrl_delobj->val, 0, &sql)) STACK_ERROR;

	lea	edx, DWORD PTR _sql$[ebp]
	push	edx
	push	0
	mov	eax, DWORD PTR _ctrl_delobj$[ebp]
	add	eax, 64					; 00000040H
	push	eax
	mov	ecx, DWORD PTR _cntxt$[ebp]
	push	ecx
	call	_qry_values_list
	add	esp, 16					; 00000010H
	test	eax, eax
	je	SHORT $L70711
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 465		; 000001d1H
	jmp	$eva_err$70623
$L70711:

; 466  : 	DYNBUF_ADD_STR(&sql, ")");

	push	0
	push	0
	push	1
	push	OFFSET FLAT:$SG70714
	lea	eax, DWORD PTR _sql$[ebp]
	push	eax
	call	_dynbuf_add
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L70713
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29872], OFFSET FLAT:$SG70716
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 466		; 000001d2H
	jmp	$eva_err$70623
$L70713:

; 467  : 	if(sql_exec_query(cntxt, sql->data)) STACK_ERROR;

	mov	eax, DWORD PTR _sql$[ebp]
	add	eax, 8
	push	eax
	mov	ecx, DWORD PTR _cntxt$[ebp]
	push	ecx
	call	_sql_exec_query
	add	esp, 8
	test	eax, eax
	je	SHORT $L70717
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 467		; 000001d3H
	jmp	$eva_err$70623
$L70717:

; 468  : 	M_FREE(sql);

	mov	eax, DWORD PTR _sql$[ebp]
	push	eax
	call	_mem_free
	add	esp, 4
	mov	DWORD PTR _sql$[ebp], 0

; 472  : 		"UPDATE TLink SET DateDel='", cntxt->timestamp, 0, NO_CONV, "'");

	push	1
	push	OFFSET FLAT:$SG70720
	push	0
	push	0
	push	0
	mov	ecx, DWORD PTR _cntxt$[ebp]
	add	ecx, 29704				; 00007408H
	push	ecx
	push	52					; 00000034H
	push	OFFSET FLAT:$SG70721
	lea	edx, DWORD PTR _sql$[ebp]
	push	edx
	call	_dynbuf_add3
	add	esp, 36					; 00000024H
	test	eax, eax
	je	SHORT $L70719
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29872], OFFSET FLAT:$SG70723
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 472		; 000001d8H
	jmp	$eva_err$70623
$L70719:

; 473  : 	DYNBUF_ADD3_CELL(&sql, ",IdWhoDel=", &cntxt->id_user, 0, 0, NO_CONV, "\nWHERE DateDel IS NULL AND IdRelObj IN(");

	push	39					; 00000027H
	push	OFFSET FLAT:$SG70726
	push	0
	push	0
	push	0
	push	0
	mov	edx, DWORD PTR _cntxt$[ebp]
	add	edx, 29408				; 000072e0H
	push	edx
	call	_dyntab_sz
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
	push	10					; 0000000aH
	push	OFFSET FLAT:$SG70727
	lea	ecx, DWORD PTR _sql$[ebp]
	push	ecx
	call	_dynbuf_add3
	add	esp, 36					; 00000024H
	test	eax, eax
	je	SHORT $L70725
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29872], OFFSET FLAT:$SG70729
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 473		; 000001d9H
	jmp	$eva_err$70623
$L70725:

; 474  : 	if(qry_values_list(cntxt, &ctrl_delobj->val, 0, &sql)) STACK_ERROR;

	lea	ecx, DWORD PTR _sql$[ebp]
	push	ecx
	push	0
	mov	edx, DWORD PTR _ctrl_delobj$[ebp]
	add	edx, 64					; 00000040H
	push	edx
	mov	eax, DWORD PTR _cntxt$[ebp]
	push	eax
	call	_qry_values_list
	add	esp, 16					; 00000010H
	test	eax, eax
	je	SHORT $L70730
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 474		; 000001daH
	jmp	$eva_err$70623
$L70730:

; 475  : 	DYNBUF_ADD_STR(&sql, ")");

	push	0
	push	0
	push	1
	push	OFFSET FLAT:$SG70733
	lea	edx, DWORD PTR _sql$[ebp]
	push	edx
	call	_dynbuf_add
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L70732
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29872], OFFSET FLAT:$SG70735
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 475		; 000001dbH
	jmp	$eva_err$70623
$L70732:

; 476  : 	if(sql_exec_query(cntxt, sql->data)) STACK_ERROR;

	mov	edx, DWORD PTR _sql$[ebp]
	add	edx, 8
	push	edx
	mov	eax, DWORD PTR _cntxt$[ebp]
	push	eax
	call	_sql_exec_query
	add	esp, 8
	test	eax, eax
	je	SHORT $L70736
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 476		; 000001dcH
	jmp	$eva_err$70623
$L70736:

; 477  : 	M_FREE(sql);

	mov	edx, DWORD PTR _sql$[ebp]
	push	edx
	call	_mem_free
	add	esp, 4
	mov	DWORD PTR _sql$[ebp], 0

; 478  : 
; 479  : 	/* Close forms containg deleted objects */
; 480  : 	if(cntxt->cgi)

	mov	eax, DWORD PTR _cntxt$[ebp]
	cmp	DWORD PTR [eax+29648], 0
	je	$L70742

; 482  : 		unsigned long idform = DYNTAB_TOUL(&form->id_form);

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
	mov	DWORD PTR _idform$70738[ebp], eax

; 483  : 		for(i = 0; i < ctrl_delobj->val.nbrows; i++)

	mov	DWORD PTR _i$[ebp], 0
	jmp	SHORT $L70740
$L70741:
	mov	edx, DWORD PTR _i$[ebp]
	add	edx, 1
	mov	DWORD PTR _i$[ebp], edx
$L70740:
	mov	eax, DWORD PTR _ctrl_delobj$[ebp]
	mov	ecx, DWORD PTR _i$[ebp]
	cmp	ecx, DWORD PTR [eax+64]
	jae	SHORT $L70742

; 485  : 			unsigned long idobj = DYNTAB_TOULRC(&ctrl_delobj->val, i, 0);

	push	10					; 0000000aH
	push	0
	push	0
	mov	edx, DWORD PTR _i$[ebp]
	push	edx
	mov	eax, DWORD PTR _ctrl_delobj$[ebp]
	add	eax, 64					; 00000040H
	push	eax
	call	_dyntab_val
	add	esp, 12					; 0000000cH
	push	eax
	call	_strtoul
	add	esp, 12					; 0000000cH
	mov	DWORD PTR _idobj$70743[ebp], eax

; 486  : 			for(j = 0; j < cntxt->nb_cgi; j++)

	mov	DWORD PTR _j$[ebp], 0
	jmp	SHORT $L70745
$L70746:
	mov	ecx, DWORD PTR _j$[ebp]
	add	ecx, 1
	mov	DWORD PTR _j$[ebp], ecx
$L70745:
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	eax, DWORD PTR _j$[ebp]
	cmp	eax, DWORD PTR [edx+29652]
	jae	SHORT $L70747

; 488  : 				CGIData *cgi = cntxt->cgi + j;

	mov	ecx, DWORD PTR _j$[ebp]
	imul	ecx, 56					; 00000038H
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	eax, DWORD PTR [edx+29648]
	add	eax, ecx
	mov	DWORD PTR _cgi$70748[ebp], eax

; 489  : 				if(cgi->IdObj == idobj || cgi->IdForm == idform) cgi->name[0] = 0;

	mov	ecx, DWORD PTR _cgi$70748[ebp]
	mov	edx, DWORD PTR [ecx+24]
	cmp	edx, DWORD PTR _idobj$70743[ebp]
	je	SHORT $L70750
	mov	eax, DWORD PTR _cgi$70748[ebp]
	mov	ecx, DWORD PTR [eax+20]
	cmp	ecx, DWORD PTR _idform$70738[ebp]
	jne	SHORT $L70749
$L70750:
	mov	edx, DWORD PTR _cgi$70748[ebp]
	mov	eax, DWORD PTR [edx]
	mov	BYTE PTR [eax], 0
$L70749:

; 490  : 			}

	jmp	SHORT $L70746
$L70747:

; 491  : 		}

	jmp	$L70741
$L70742:

; 493  : 	form_close_nosave(cntxt, DYNTAB_TOUL(&form->id_form), DYNTAB_TOUL(&form->id_obj), NULL);

	push	0
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
	mov	eax, DWORD PTR _cntxt$[ebp]
	push	eax
	call	_form_close_nosave
	add	esp, 16					; 00000010H
$eva_noerr$70614:

; 494  : 
; 495  : 	RETURN_OK_CLEANUP;

	push	0
	push	OFFSET FLAT:$SG70754
	push	OFFSET FLAT:$SG70755
	mov	ecx, DWORD PTR _cntxt$[ebp]
	push	ecx
	call	_err_clear
	add	esp, 16					; 00000010H
$eva_err$70623:
	mov	edx, DWORD PTR _cntxt$[ebp]
	cmp	DWORD PTR [edx+29872], 0
	je	SHORT $L70756
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	ecx, DWORD PTR [eax+29900]
	push	ecx
	push	OFFSET FLAT:$SG70757
	push	OFFSET FLAT:$SG70758
	mov	edx, DWORD PTR _cntxt$[ebp]
	push	edx
	call	_err_add_context
	add	esp, 16					; 00000010H
$L70756:
	lea	eax, DWORD PTR _t_keepobj$[ebp]
	push	eax
	call	_dyntab_free
	add	esp, 4
	lea	ecx, DWORD PTR _objdata$[ebp]
	push	ecx
	call	_dyntab_free
	add	esp, 4
	lea	edx, DWORD PTR _linkdata$[ebp]
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

; 496  : }

	mov	esp, ebp
	pop	ebp
	ret	0
_action_delete ENDP
_TEXT	ENDS
PUBLIC	_action_copyobj
EXTRN	_cgi_value_setkeep:NEAR
EXTRN	_cgi_add_input:NEAR
_BSS	SEGMENT
	ALIGN	4

$SG70773 DB	01H DUP (?)
_BSS	ENDS
_DATA	SEGMENT
	ORG $+2
$SG70772 DB	'_EVA_ADD', 00H
	ORG $+3
$SG70777 DB	'CB', 00H
	ORG $+1
$SG70784 DB	'D0$0#CB$1', 00H
	ORG $+2
$SG70786 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70791 DB	'D:\Travail\ABI\EVA\V4.0\CGI\Brunix-2016\action_misc.c', 00H
	ORG $+2
$SG70792 DB	'action_copyobj', 00H
	ORG $+1
$SG70794 DB	'D:\Travail\ABI\EVA\V4.0\CGI\Brunix-2016\action_misc.c', 00H
	ORG $+2
$SG70795 DB	'action_copyobj', 00H
_DATA	ENDS
_TEXT	SEGMENT
_cntxt$ = 8
_i_ctrl$ = 12
_form$ = -4
_ctrl$ = -12
_name$ = -8
_i$70774 = -16
_action_copyobj PROC NEAR

; 509  : ){

	push	ebp
	mov	ebp, esp
	sub	esp, 28					; 0000001cH

; 510  : 	EVA_form *form = cntxt->form;

	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	ecx, DWORD PTR [eax+80]
	mov	DWORD PTR _form$[ebp], ecx

; 511  : 	EVA_ctrl *ctrl = form->ctrl + i_ctrl;

	mov	edx, DWORD PTR _i_ctrl$[ebp]
	imul	edx, 480				; 000001e0H
	mov	eax, DWORD PTR _form$[ebp]
	mov	ecx, DWORD PTR [eax]
	add	ecx, edx
	mov	DWORD PTR _ctrl$[ebp], ecx

; 512  : 	DynBuffer *name = NULL;

	mov	DWORD PTR _name$[ebp], 0

; 513  : 
; 514  : 	/* Clear current clipboard values if applicable */
; 515  : 	if(*CTRL_ATTR_VAL(ADD) != '1')

	cmp	DWORD PTR _ctrl$[ebp], 0
	je	SHORT $L70929
	push	0
	push	-1
	push	OFFSET FLAT:$SG70772
	mov	edx, DWORD PTR _ctrl$[ebp]
	add	edx, 44					; 0000002cH
	push	edx
	call	_dyntab_field_val
	add	esp, 16					; 00000010H
	mov	DWORD PTR -20+[ebp], eax
	jmp	SHORT $L70930
$L70929:
	mov	DWORD PTR -20+[ebp], OFFSET FLAT:$SG70773
$L70930:
	mov	eax, DWORD PTR -20+[ebp]
	movsx	ecx, BYTE PTR [eax]
	cmp	ecx, 49					; 00000031H
	je	SHORT $L70781

; 517  : 		unsigned long i;
; 518  : 		if(cgi_filter_values(cntxt, &ctrl->cgival, 'D', 0, 0, 0, "CB", NULL, 0, 0)) STACK_ERROR;

	push	0
	push	0
	push	0
	push	OFFSET FLAT:$SG70777
	push	0
	push	0
	push	0
	push	68					; 00000044H
	mov	edx, DWORD PTR _ctrl$[ebp]
	add	edx, 104				; 00000068H
	push	edx
	mov	eax, DWORD PTR _cntxt$[ebp]
	push	eax
	call	_cgi_filter_values
	add	esp, 40					; 00000028H
	test	eax, eax
	je	SHORT $L70776
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 518		; 00000206H
	jmp	$eva_err$70778
$L70776:

; 519  : 		for(i = 0; i < ctrl->cgival.nbrows; i++) cgi_value_setkeep(cntxt, &ctrl->cgival, i, 2);

	mov	DWORD PTR _i$70774[ebp], 0
	jmp	SHORT $L70779
$L70780:
	mov	edx, DWORD PTR _i$70774[ebp]
	add	edx, 1
	mov	DWORD PTR _i$70774[ebp], edx
$L70779:
	mov	eax, DWORD PTR _ctrl$[ebp]
	mov	ecx, DWORD PTR _i$70774[ebp]
	cmp	ecx, DWORD PTR [eax+104]
	jae	SHORT $L70781
	push	2
	mov	edx, DWORD PTR _i$70774[ebp]
	push	edx
	mov	eax, DWORD PTR _ctrl$[ebp]
	add	eax, 104				; 00000068H
	push	eax
	mov	ecx, DWORD PTR _cntxt$[ebp]
	push	ecx
	call	_cgi_value_setkeep
	add	esp, 16					; 00000010H
	jmp	SHORT $L70780
$L70781:

; 521  : 
; 522  : 	/* Add new values */
; 523  : 	DYNBUF_ADD_STR(&name, "D0$0#CB$1");

	push	0
	push	0
	push	9
	push	OFFSET FLAT:$SG70784
	lea	edx, DWORD PTR _name$[ebp]
	push	edx
	call	_dynbuf_add
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L70783
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29872], OFFSET FLAT:$SG70786
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 523		; 0000020bH
	jmp	$eva_err$70778
$L70783:

; 524  : 	if(cgi_add_input(cntxt, NULL, DYNBUF_VAL_SZ(name), DYNTAB_VAL_SZ(&form->id_obj, 0, 0))) STACK_ERROR;

	cmp	DWORD PTR _name$[ebp], 0
	je	SHORT $L70931
	mov	edx, DWORD PTR _name$[ebp]
	mov	eax, DWORD PTR [edx+4]
	mov	DWORD PTR -24+[ebp], eax
	jmp	SHORT $L70932
$L70931:
	mov	DWORD PTR -24+[ebp], 0
$L70932:
	cmp	DWORD PTR _name$[ebp], 0
	je	SHORT $L70933
	mov	ecx, DWORD PTR _name$[ebp]
	add	ecx, 8
	mov	DWORD PTR -28+[ebp], ecx
	jmp	SHORT $L70934
$L70933:
	mov	DWORD PTR -28+[ebp], 0
$L70934:
	push	0
	push	0
	mov	edx, DWORD PTR _form$[ebp]
	add	edx, 32					; 00000020H
	push	edx
	call	_dyntab_sz
	add	esp, 12					; 0000000cH
	push	eax
	push	0
	push	0
	mov	eax, DWORD PTR _form$[ebp]
	add	eax, 32					; 00000020H
	push	eax
	call	_dyntab_val
	add	esp, 12					; 0000000cH
	push	eax
	mov	ecx, DWORD PTR -24+[ebp]
	push	ecx
	mov	edx, DWORD PTR -28+[ebp]
	push	edx
	push	0
	mov	eax, DWORD PTR _cntxt$[ebp]
	push	eax
	call	_cgi_add_input
	add	esp, 24					; 00000018H
	test	eax, eax
	je	SHORT $eva_noerr$70790
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 524		; 0000020cH
	jmp	SHORT $eva_err$70778
$eva_noerr$70790:

; 525  : 
; 526  : 	RETURN_OK_CLEANUP;

	push	0
	push	OFFSET FLAT:$SG70791
	push	OFFSET FLAT:$SG70792
	mov	edx, DWORD PTR _cntxt$[ebp]
	push	edx
	call	_err_clear
	add	esp, 16					; 00000010H
$eva_err$70778:
	mov	eax, DWORD PTR _cntxt$[ebp]
	cmp	DWORD PTR [eax+29872], 0
	je	SHORT $L70793
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	edx, DWORD PTR [ecx+29900]
	push	edx
	push	OFFSET FLAT:$SG70794
	push	OFFSET FLAT:$SG70795
	mov	eax, DWORD PTR _cntxt$[ebp]
	push	eax
	call	_err_add_context
	add	esp, 16					; 00000010H
$L70793:
	mov	ecx, DWORD PTR _name$[ebp]
	push	ecx
	call	_mem_free
	add	esp, 4
	mov	DWORD PTR _name$[ebp], 0
	mov	edx, DWORD PTR _cntxt$[ebp]
	xor	eax, eax
	cmp	DWORD PTR [edx+29872], 0
	setne	al

; 527  : }

	mov	esp, ebp
	pop	ebp
	ret	0
_action_copyobj ENDP
_TEXT	ENDS
PUBLIC	_action_default
EXTRN	_cgi_set_field_values:NEAR
EXTRN	_remove:NEAR
EXTRN	_sscanf:NEAR
EXTRN	_chdir:NEAR
EXTRN	_strchr:NEAR
EXTRN	_dyntab_from_list:NEAR
EXTRN	_strncmp:NEAR
_BSS	SEGMENT
	ALIGN	4

$SG70810 DB	01H DUP (?)
_BSS	ENDS
_DATA	SEGMENT
	ORG $+1
$SG70820 DB	'%lu', 00H
$SG70824 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70827 DB	'%lu', 00H
$SG70831 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70842 DB	'OPENOBJ', 00H
$SG70844 DB	'%lu,%lu,%d,%d', 00H
	ORG $+2
$SG70847 DB	'%lu', 00H
$SG70851 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70854 DB	'%lu', 00H
$SG70858 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70862 DB	'CLOSESETVAL', 00H
$SG70864 DB	'/', 00H
	ORG $+2
$SG70874 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70876 DB	'_EVA_REPLACE', 00H
	ORG $+3
$SG70879 DB	'CLOSE', 00H
	ORG $+2
$SG70883 DB	'DELOBJLIB', 00H
	ORG $+2
$SG70885 DB	'objlib', 00H
	ORG $+1
$SG70888 DB	'CLOSE', 00H
	ORG $+2
$SG70893 DB	'D:\Travail\ABI\EVA\V4.0\CGI\Brunix-2016\action_misc.c', 00H
	ORG $+2
$SG70894 DB	'action_default', 00H
	ORG $+1
$SG70896 DB	'D:\Travail\ABI\EVA\V4.0\CGI\Brunix-2016\action_misc.c', 00H
	ORG $+2
$SG70897 DB	'action_default', 00H
_DATA	ENDS
_TEXT	SEGMENT
_cntxt$ = 8
_i_ctrl$ = 12
_form$ = -24
_id_obj$ = -48
_id_form$ = -20
_alt$ = -68
_cgi$ = -72
_btn$ = -28
_equal$ = -76
__tmp$70818 = -108
__tmp$70826 = -140
_idobj$70837 = -144
_idform$70838 = -152
_loc$70839 = -148
_mode$70840 = -156
__tmp$70846 = -188
__tmp$70853 = -220
_sep$70863 = -224
_action_default PROC NEAR

; 542  : ){

	push	ebp
	mov	ebp, esp
	sub	esp, 244				; 000000f4H
	push	edi

; 543  : 	EVA_form *form = cntxt->form;

	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	ecx, DWORD PTR [eax+80]
	mov	DWORD PTR _form$[ebp], ecx

; 544  : 	DynTable id_obj = { 0 };

	mov	DWORD PTR _id_obj$[ebp], 0
	xor	edx, edx
	mov	DWORD PTR _id_obj$[ebp+4], edx
	mov	DWORD PTR _id_obj$[ebp+8], edx
	mov	DWORD PTR _id_obj$[ebp+12], edx
	mov	DWORD PTR _id_obj$[ebp+16], edx

; 545  : 	DynTable id_form = { 0 };

	mov	DWORD PTR _id_form$[ebp], 0
	xor	eax, eax
	mov	DWORD PTR _id_form$[ebp+4], eax
	mov	DWORD PTR _id_form$[ebp+8], eax
	mov	DWORD PTR _id_form$[ebp+12], eax
	mov	DWORD PTR _id_form$[ebp+16], eax

; 546  : 	DynTable alt = { 0 };

	mov	DWORD PTR _alt$[ebp], 0
	xor	ecx, ecx
	mov	DWORD PTR _alt$[ebp+4], ecx
	mov	DWORD PTR _alt$[ebp+8], ecx
	mov	DWORD PTR _alt$[ebp+12], ecx
	mov	DWORD PTR _alt$[ebp+16], ecx

; 547  : 	CGIData *cgi = cntxt->cgi + cntxt->cgibtn;

	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	eax, DWORD PTR [edx+29656]
	imul	eax, 56					; 00000038H
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	edx, DWORD PTR [ecx+29648]
	add	edx, eax
	mov	DWORD PTR _cgi$[ebp], edx

; 548  : 	char *btn = CGI_CLICK_BTN_SUBFIELD;

	mov	eax, DWORD PTR _cntxt$[ebp]
	cmp	DWORD PTR [eax+29648], 0
	je	SHORT $L70936
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	edx, DWORD PTR [ecx+29656]
	imul	edx, 56					; 00000038H
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	ecx, DWORD PTR [eax+29648]
	mov	edx, DWORD PTR [ecx+edx]
	movsx	eax, BYTE PTR [edx]
	cmp	eax, 66					; 00000042H
	jne	SHORT $L70936
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	edx, DWORD PTR [ecx+29656]
	imul	edx, 56					; 00000038H
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	ecx, DWORD PTR [eax+29648]
	cmp	DWORD PTR [ecx+edx+32], 0
	je	SHORT $L70936
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	eax, DWORD PTR [edx+29656]
	imul	eax, 56					; 00000038H
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	edx, DWORD PTR [ecx+29648]
	mov	eax, DWORD PTR [edx+eax+32]
	mov	DWORD PTR -228+[ebp], eax
	jmp	SHORT $L70937
$L70936:
	mov	DWORD PTR -228+[ebp], OFFSET FLAT:$SG70810
$L70937:
	mov	ecx, DWORD PTR -228+[ebp]
	mov	DWORD PTR _btn$[ebp], ecx

; 549  : 	char *equal = btn ? strchr(btn, '=') : NULL;

	cmp	DWORD PTR _btn$[ebp], 0
	je	SHORT $L70938
	push	61					; 0000003dH
	mov	edx, DWORD PTR _btn$[ebp]
	push	edx
	call	_strchr
	add	esp, 8
	mov	DWORD PTR -232+[ebp], eax
	jmp	SHORT $L70939
$L70938:
	mov	DWORD PTR -232+[ebp], 0
$L70939:
	mov	eax, DWORD PTR -232+[ebp]
	mov	DWORD PTR _equal$[ebp], eax

; 550  : 
; 551  : 	/* Switch on button type */
; 552  : 	switch(cgi->name[0])
; 553  : 	{

	mov	ecx, DWORD PTR _cgi$[ebp]
	mov	edx, DWORD PTR [ecx]
	mov	al, BYTE PTR [edx]
	mov	BYTE PTR -236+[ebp], al
	cmp	BYTE PTR -236+[ebp], 73			; 00000049H
	je	SHORT $L70817
	cmp	BYTE PTR -236+[ebp], 84			; 00000054H
	je	$L70834
	jmp	$L70835
$L70817:

; 554  : 	case 'I':	/* Info button : display control info */
; 555  : 		/* Load alternate form */
; 556  : 		DYNTAB_ADD_INT(&id_form, 0, 0, (unsigned long int)OBJ_FORM_CONTROL);

	mov	BYTE PTR __tmp$70818[ebp], 0
	mov	ecx, 7
	xor	eax, eax
	lea	edi, DWORD PTR __tmp$70818[ebp+1]
	rep stosd
	stosw
	stosb
	push	10					; 0000000aH
	push	OFFSET FLAT:$SG70820
	lea	ecx, DWORD PTR __tmp$70818[ebp]
	push	ecx
	call	_sprintf
	add	esp, 12					; 0000000cH
	push	0
	push	0
	push	0
	lea	edx, DWORD PTR __tmp$70818[ebp]
	push	edx
	push	0
	push	0
	lea	eax, DWORD PTR _id_form$[ebp]
	push	eax
	call	_dyntab_add
	add	esp, 28					; 0000001cH
	test	eax, eax
	je	SHORT $L70822
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29872], OFFSET FLAT:$SG70824
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 556		; 0000022cH
	jmp	$eva_err$70825
$L70822:

; 557  : 		DYNTAB_ADD_INT(&id_obj, 0, 0, cgi->IdCtrl);

	mov	BYTE PTR __tmp$70826[ebp], 0
	mov	ecx, 7
	xor	eax, eax
	lea	edi, DWORD PTR __tmp$70826[ebp+1]
	rep stosd
	stosw
	stosb
	mov	eax, DWORD PTR _cgi$[ebp]
	mov	ecx, DWORD PTR [eax+16]
	push	ecx
	push	OFFSET FLAT:$SG70827
	lea	edx, DWORD PTR __tmp$70826[ebp]
	push	edx
	call	_sprintf
	add	esp, 12					; 0000000cH
	push	0
	push	0
	push	0
	lea	eax, DWORD PTR __tmp$70826[ebp]
	push	eax
	push	0
	push	0
	lea	ecx, DWORD PTR _id_obj$[ebp]
	push	ecx
	call	_dyntab_add
	add	esp, 28					; 0000001cH
	test	eax, eax
	je	SHORT $L70829
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29872], OFFSET FLAT:$SG70831
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 557		; 0000022dH
	jmp	$eva_err$70825
$L70829:

; 558  : 		if((cntxt->opt_btn_mode == OptBtn_OpenSame || cntxt->opt_btn_mode ==  OptBtn_OpenBottom) &&
; 559  : 			form_load_from_ctrl(cntxt, &id_form, &id_obj, cntxt->opt_btn_mode == OptBtn_OpenSame ? 0 : 2, 0)) STACK_ERROR;

	mov	ecx, DWORD PTR _cntxt$[ebp]
	cmp	DWORD PTR [ecx+29588], 2
	je	SHORT $L70833
	mov	edx, DWORD PTR _cntxt$[ebp]
	cmp	DWORD PTR [edx+29588], 3
	jne	SHORT $L70832
$L70833:
	push	0
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	ecx, DWORD PTR [eax+29588]
	sub	ecx, 2
	neg	ecx
	sbb	ecx, ecx
	and	ecx, 2
	push	ecx
	lea	edx, DWORD PTR _id_obj$[ebp]
	push	edx
	lea	eax, DWORD PTR _id_form$[ebp]
	push	eax
	mov	ecx, DWORD PTR _cntxt$[ebp]
	push	ecx
	call	_form_load_from_ctrl
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L70832
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 559		; 0000022fH
	jmp	$eva_err$70825
$L70832:

; 560  : 		break;

	jmp	$eva_noerr$70892
$L70834:

; 561  : 
; 562  : 	case 'T':	/* TAB button : memorize selected tab */
; 563  : 		form->seltab = i_ctrl;

	mov	eax, DWORD PTR _form$[ebp]
	mov	ecx, DWORD PTR _i_ctrl$[ebp]
	mov	DWORD PTR [eax+116], ecx

; 564  : 		break;

	jmp	$eva_noerr$70892
$L70835:

; 565  : 
; 566  : 	default:
; 567  : 		/* Check for program specific actions */
; 568  : 		if(equal)

	cmp	DWORD PTR _equal$[ebp], 0
	je	$L70836

; 570  : 			/* Get parameters : IdObj,IdForm,Location,Mode */
; 571  : 			unsigned long idobj = 0, idform = 0;

	mov	DWORD PTR _idobj$70837[ebp], 0
	mov	DWORD PTR _idform$70838[ebp], 0

; 572  : 			int loc = 0, mode = 0;

	mov	DWORD PTR _loc$70839[ebp], 0
	mov	DWORD PTR _mode$70840[ebp], 0

; 573  : 
; 574  : 			if(!strncmp(btn, add_sz_str("OPENOBJ")))

	push	7
	push	OFFSET FLAT:$SG70842
	mov	edx, DWORD PTR _btn$[ebp]
	push	edx
	call	_strncmp
	add	esp, 12					; 0000000cH
	test	eax, eax
	jne	$L70841

; 576  : 				/* Open object in given form */
; 577  : 				if(sscanf(equal + 1, "%lu,%lu,%d,%d", &idobj, &idform, &loc, &mode) > 0)

	lea	eax, DWORD PTR _mode$70840[ebp]
	push	eax
	lea	ecx, DWORD PTR _loc$70839[ebp]
	push	ecx
	lea	edx, DWORD PTR _idform$70838[ebp]
	push	edx
	lea	eax, DWORD PTR _idobj$70837[ebp]
	push	eax
	push	OFFSET FLAT:$SG70844
	mov	ecx, DWORD PTR _equal$[ebp]
	add	ecx, 1
	push	ecx
	call	_sscanf
	add	esp, 24					; 00000018H
	test	eax, eax
	jle	$L70859

; 579  : 					if(idform) DYNTAB_ADD_INT(&id_form, 0, 0, idform);

	cmp	DWORD PTR _idform$70838[ebp], 0
	je	SHORT $L70849
	mov	BYTE PTR __tmp$70846[ebp], 0
	mov	ecx, 7
	xor	eax, eax
	lea	edi, DWORD PTR __tmp$70846[ebp+1]
	rep stosd
	stosw
	stosb
	mov	edx, DWORD PTR _idform$70838[ebp]
	push	edx
	push	OFFSET FLAT:$SG70847
	lea	eax, DWORD PTR __tmp$70846[ebp]
	push	eax
	call	_sprintf
	add	esp, 12					; 0000000cH
	push	0
	push	0
	push	0
	lea	ecx, DWORD PTR __tmp$70846[ebp]
	push	ecx
	push	0
	push	0
	lea	edx, DWORD PTR _id_form$[ebp]
	push	edx
	call	_dyntab_add
	add	esp, 28					; 0000001cH
	test	eax, eax
	je	SHORT $L70849
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29872], OFFSET FLAT:$SG70851
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 579		; 00000243H
	jmp	$eva_err$70825
$L70849:

; 580  : 					if(idobj) DYNTAB_ADD_INT(&id_obj, 0, 0, idobj);

	cmp	DWORD PTR _idobj$70837[ebp], 0
	je	SHORT $L70856
	mov	BYTE PTR __tmp$70853[ebp], 0
	mov	ecx, 7
	xor	eax, eax
	lea	edi, DWORD PTR __tmp$70853[ebp+1]
	rep stosd
	stosw
	stosb
	mov	edx, DWORD PTR _idobj$70837[ebp]
	push	edx
	push	OFFSET FLAT:$SG70854
	lea	eax, DWORD PTR __tmp$70853[ebp]
	push	eax
	call	_sprintf
	add	esp, 12					; 0000000cH
	push	0
	push	0
	push	0
	lea	ecx, DWORD PTR __tmp$70853[ebp]
	push	ecx
	push	0
	push	0
	lea	edx, DWORD PTR _id_obj$[ebp]
	push	edx
	call	_dyntab_add
	add	esp, 28					; 0000001cH
	test	eax, eax
	je	SHORT $L70856
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29872], OFFSET FLAT:$SG70858
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 580		; 00000244H
	jmp	$eva_err$70825
$L70856:

; 581  : 					if(form_load_from_ctrl(cntxt, &id_form, &id_obj, loc, mode)) STACK_ERROR;

	mov	edx, DWORD PTR _mode$70840[ebp]
	push	edx
	mov	eax, DWORD PTR _loc$70839[ebp]
	push	eax
	lea	ecx, DWORD PTR _id_obj$[ebp]
	push	ecx
	lea	edx, DWORD PTR _id_form$[ebp]
	push	edx
	mov	eax, DWORD PTR _cntxt$[ebp]
	push	eax
	call	_form_load_from_ctrl
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L70859
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 581		; 00000245H
	jmp	$eva_err$70825
$L70859:

; 584  : 			else if(!strncmp(btn, add_sz_str("CLOSESETVAL")))

	jmp	$L70884
$L70841:
	push	11					; 0000000bH
	push	OFFSET FLAT:$SG70862
	mov	edx, DWORD PTR _btn$[ebp]
	push	edx
	call	_strncmp
	add	esp, 12					; 0000000cH
	test	eax, eax
	jne	$L70861

; 586  : 				char *sep = strchr(equal + 1, '=');

	push	61					; 0000003dH
	mov	eax, DWORD PTR _equal$[ebp]
	add	eax, 1
	push	eax
	call	_strchr
	add	esp, 8
	mov	DWORD PTR _sep$70863[ebp], eax

; 587  : 				dyntab_from_list(&id_obj, DYNTAB_VAL_SZ(&form->call_data, 0, 0), "/", 0, 6);

	push	6
	push	0
	push	OFFSET FLAT:$SG70864
	push	0
	push	0
	mov	ecx, DWORD PTR _form$[ebp]
	add	ecx, 88					; 00000058H
	push	ecx
	call	_dyntab_sz
	add	esp, 12					; 0000000cH
	push	eax
	push	0
	push	0
	mov	edx, DWORD PTR _form$[ebp]
	add	edx, 88					; 00000058H
	push	edx
	call	_dyntab_val
	add	esp, 12					; 0000000cH
	push	eax
	lea	eax, DWORD PTR _id_obj$[ebp]
	push	eax
	call	_dyntab_from_list
	add	esp, 24					; 00000018H

; 588  : 				idform = DYNTAB_TOUL(&id_obj);

	push	10					; 0000000aH
	push	0
	push	0
	push	0
	lea	ecx, DWORD PTR _id_obj$[ebp]
	push	ecx
	call	_dyntab_val
	add	esp, 12					; 0000000cH
	push	eax
	call	_strtoul
	add	esp, 12					; 0000000cH
	mov	DWORD PTR _idform$70838[ebp], eax

; 589  : 				idobj = DYNTAB_TOULRC(&id_obj, 1, 0);

	push	10					; 0000000aH
	push	0
	push	0
	push	1
	lea	edx, DWORD PTR _id_obj$[ebp]
	push	edx
	call	_dyntab_val
	add	esp, 12					; 0000000cH
	push	eax
	call	_strtoul
	add	esp, 12					; 0000000cH
	mov	DWORD PTR _idobj$70837[ebp], eax

; 590  : 				form_close_nosave(cntxt, DYNTAB_TOUL(&form->id_form), DYNTAB_TOUL(&form->id_obj), NULL);

	push	0
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
	mov	edx, DWORD PTR _cntxt$[ebp]
	push	edx
	call	_form_close_nosave
	add	esp, 16					; 00000010H

; 591  : 				if(sep && sep - equal > 1 && idform)

	cmp	DWORD PTR _sep$70863[ebp], 0
	je	$L70875
	mov	eax, DWORD PTR _sep$70863[ebp]
	sub	eax, DWORD PTR _equal$[ebp]
	cmp	eax, 1
	jle	$L70875
	cmp	DWORD PTR _idform$70838[ebp], 0
	je	$L70875

; 593  : 					DYNTAB_ADD(&id_form, 0, 0, sep + 1, 0, NO_CONV);

	push	0
	push	0
	push	0
	mov	ecx, DWORD PTR _sep$70863[ebp]
	add	ecx, 1
	push	ecx
	push	0
	push	0
	lea	edx, DWORD PTR _id_form$[ebp]
	push	edx
	call	_dyntab_add
	add	esp, 28					; 0000001cH
	test	eax, eax
	je	SHORT $L70872
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29872], OFFSET FLAT:$SG70874
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 593		; 00000251H
	jmp	$eva_err$70825
$L70872:

; 594  : 					if(cgi_set_field_values(cntxt, idform, idobj, equal + 1, sep - equal - 1, &id_form, "_EVA_REPLACE", 0)) STACK_ERROR;

	push	0
	push	OFFSET FLAT:$SG70876
	lea	edx, DWORD PTR _id_form$[ebp]
	push	edx
	mov	eax, DWORD PTR _sep$70863[ebp]
	sub	eax, DWORD PTR _equal$[ebp]
	sub	eax, 1
	push	eax
	mov	ecx, DWORD PTR _equal$[ebp]
	add	ecx, 1
	push	ecx
	mov	edx, DWORD PTR _idobj$70837[ebp]
	push	edx
	mov	eax, DWORD PTR _idform$70838[ebp]
	push	eax
	mov	ecx, DWORD PTR _cntxt$[ebp]
	push	ecx
	call	_cgi_set_field_values
	add	esp, 32					; 00000020H
	test	eax, eax
	je	SHORT $L70875
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 594		; 00000252H
	jmp	$eva_err$70825
$L70875:

; 597  : 			else if(!strncmp(btn, add_sz_str("CLOSE")))

	jmp	$L70884
$L70861:
	push	5
	push	OFFSET FLAT:$SG70879
	mov	eax, DWORD PTR _btn$[ebp]
	push	eax
	call	_strncmp
	add	esp, 12					; 0000000cH
	test	eax, eax
	jne	SHORT $L70878

; 599  : 				form_close_nosave(cntxt, idform, idobj, NULL);

	push	0
	mov	ecx, DWORD PTR _idobj$70837[ebp]
	push	ecx
	mov	edx, DWORD PTR _idform$70838[ebp]
	push	edx
	mov	eax, DWORD PTR _cntxt$[ebp]
	push	eax
	call	_form_close_nosave
	add	esp, 16					; 00000010H

; 601  : 			else if(!strncmp(btn, add_sz_str("DELOBJLIB")))

	jmp	SHORT $L70884
$L70878:
	push	9
	push	OFFSET FLAT:$SG70883
	mov	ecx, DWORD PTR _btn$[ebp]
	push	ecx
	call	_strncmp
	add	esp, 12					; 0000000cH
	test	eax, eax
	jne	SHORT $L70884

; 603  : 				if(!chdir(cntxt->rootdir) && !chdir("objlib"))

	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	eax, DWORD PTR [edx+29724]
	push	eax
	call	_chdir
	add	esp, 4
	test	eax, eax
	jne	SHORT $L70884
	push	OFFSET FLAT:$SG70885
	call	_chdir
	add	esp, 4
	test	eax, eax
	jne	SHORT $L70884

; 604  : 					remove(equal + 1);

	mov	ecx, DWORD PTR _equal$[ebp]
	add	ecx, 1
	push	ecx
	call	_remove
	add	esp, 4
$L70884:

; 607  : 		else if(!strcmp(btn, "CLOSE"))

	jmp	$L70887
$L70836:
	push	OFFSET FLAT:$SG70888
	mov	edx, DWORD PTR _btn$[ebp]
	push	edx
	call	_strcmp
	add	esp, 8
	test	eax, eax
	jne	$L70887

; 609  : 			form_close_nosave(cntxt, DYNTAB_TOUL(form ? &form->id_form : &cntxt->id_form),
; 610  : 										DYNTAB_TOUL(form ? &form->id_obj : &cntxt->id_obj),
; 611  : 										NULL);

	cmp	DWORD PTR _form$[ebp], 0
	je	SHORT $L70940
	mov	eax, DWORD PTR _form$[ebp]
	add	eax, 32					; 00000020H
	mov	DWORD PTR -240+[ebp], eax
	jmp	SHORT $L70941
$L70940:
	mov	ecx, DWORD PTR _cntxt$[ebp]
	add	ecx, 20					; 00000014H
	mov	DWORD PTR -240+[ebp], ecx
$L70941:
	cmp	DWORD PTR _form$[ebp], 0
	je	SHORT $L70942
	mov	edx, DWORD PTR _form$[ebp]
	add	edx, 12					; 0000000cH
	mov	DWORD PTR -244+[ebp], edx
	jmp	SHORT $L70943
$L70942:
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR -244+[ebp], eax
$L70943:
	push	0
	push	10					; 0000000aH
	push	0
	push	0
	push	0
	mov	ecx, DWORD PTR -240+[ebp]
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
	mov	edx, DWORD PTR -244+[ebp]
	push	edx
	call	_dyntab_val
	add	esp, 12					; 0000000cH
	push	eax
	call	_strtoul
	add	esp, 12					; 0000000cH
	push	eax
	mov	eax, DWORD PTR _cntxt$[ebp]
	push	eax
	call	_form_close_nosave
	add	esp, 16					; 00000010H
$L70887:
$eva_noerr$70892:

; 615  : 
; 616  : 
; 617  : 	RETURN_OK_CLEANUP;

	push	0
	push	OFFSET FLAT:$SG70893
	push	OFFSET FLAT:$SG70894
	mov	ecx, DWORD PTR _cntxt$[ebp]
	push	ecx
	call	_err_clear
	add	esp, 16					; 00000010H
$eva_err$70825:
	mov	edx, DWORD PTR _cntxt$[ebp]
	cmp	DWORD PTR [edx+29872], 0
	je	SHORT $L70895
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	ecx, DWORD PTR [eax+29900]
	push	ecx
	push	OFFSET FLAT:$SG70896
	push	OFFSET FLAT:$SG70897
	mov	edx, DWORD PTR _cntxt$[ebp]
	push	edx
	call	_err_add_context
	add	esp, 16					; 00000010H
$L70895:
	lea	eax, DWORD PTR _id_obj$[ebp]
	push	eax
	call	_dyntab_free
	add	esp, 4
	lea	ecx, DWORD PTR _id_form$[ebp]
	push	ecx
	call	_dyntab_free
	add	esp, 4
	lea	edx, DWORD PTR _alt$[ebp]
	push	edx
	call	_dyntab_free
	add	esp, 4
	mov	eax, DWORD PTR _cntxt$[ebp]
	xor	ecx, ecx
	cmp	DWORD PTR [eax+29872], 0
	setne	cl
	mov	eax, ecx

; 618  : }

	pop	edi
	mov	esp, ebp
	pop	ebp
	ret	0
_action_default ENDP
_TEXT	ENDS
END
