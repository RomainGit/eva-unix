	TITLE	D:\Travail\ABI\EVA\V4.0\CGI\Brunix-2016\ctrl_input.c
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
PUBLIC	_ctrl_check_changes
EXTRN	_dyntab_cell:NEAR
EXTRN	_strcmp:NEAR
_BSS	SEGMENT
$SG70227 DB	01H DUP (?)
	ALIGN	4

$SG70228 DB	01H DUP (?)
	ALIGN	4

$SG70237 DB	01H DUP (?)
	ALIGN	4

$SG70238 DB	01H DUP (?)
_BSS	ENDS
_TEXT	SEGMENT
_cntxt$ = 8
_i_ctrl$ = 12
_b_ignorenew$ = 16
_form$ = -8
_ctrl$ = -24
_i$ = -16
_j$ = -20
_dbval$ = -12
_val$ = -4
_ctrl_check_changes PROC NEAR

; 24   : ){

	push	ebp
	mov	ebp, esp
	sub	esp, 40					; 00000028H

; 25   : 	EVA_form *form = cntxt->form;

	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	ecx, DWORD PTR [eax+80]
	mov	DWORD PTR _form$[ebp], ecx

; 26   : 	EVA_ctrl *ctrl = form->ctrl + i_ctrl;

	mov	edx, DWORD PTR _i_ctrl$[ebp]
	imul	edx, 480				; 000001e0H
	mov	eax, DWORD PTR _form$[ebp]
	mov	ecx, DWORD PTR [eax]
	add	ecx, edx
	mov	DWORD PTR _ctrl$[ebp], ecx

; 27   : 	unsigned long i, j;
; 28   : 	DynTableCell *dbval, *val;
; 29   : 
; 30   : 	if(form->b_newobj) return;

	mov	edx, DWORD PTR _form$[ebp]
	cmp	DWORD PTR [edx+72], 0
	je	SHORT $L70216
	jmp	$L70231
$L70216:

; 31   : 	ctrl->b_modified = 0;

	mov	eax, DWORD PTR _ctrl$[ebp]
	mov	DWORD PTR [eax+200], 0

; 32   : 	if(!ctrl->storage) return;

	mov	ecx, DWORD PTR _ctrl$[ebp]
	cmp	DWORD PTR [ecx+36], 0
	jne	SHORT $L70217
	jmp	$L70231
$L70217:

; 33   : 
; 34   : 	/* Mark new values */
; 35   : 	for(i = 0; i < ctrl->val.nbrows; i++)

	mov	DWORD PTR _i$[ebp], 0
	jmp	SHORT $L70218
$L70219:
	mov	edx, DWORD PTR _i$[ebp]
	add	edx, 1
	mov	DWORD PTR _i$[ebp], edx
$L70218:
	mov	eax, DWORD PTR _ctrl$[ebp]
	mov	ecx, DWORD PTR _i$[ebp]
	cmp	ecx, DWORD PTR [eax+64]
	jae	$L70220

; 37   : 		val = dyntab_cell(&ctrl->val, i, 0);

	push	0
	mov	edx, DWORD PTR _i$[ebp]
	push	edx
	mov	eax, DWORD PTR _ctrl$[ebp]
	add	eax, 64					; 00000040H
	push	eax
	call	_dyntab_cell
	add	esp, 12					; 0000000cH
	mov	DWORD PTR _val$[ebp], eax

; 38   : 		if(b_ignorenew && form->b_newobj && !val->b_modified) continue;

	cmp	DWORD PTR _b_ignorenew$[ebp], 0
	je	SHORT $L70221
	mov	ecx, DWORD PTR _form$[ebp]
	cmp	DWORD PTR [ecx+72], 0
	je	SHORT $L70221
	mov	edx, DWORD PTR _val$[ebp]
	movsx	eax, BYTE PTR [edx+13]
	test	eax, eax
	jne	SHORT $L70221
	jmp	SHORT $L70219
$L70221:

; 39   : 		val->b_modified = 1;

	mov	ecx, DWORD PTR _val$[ebp]
	mov	BYTE PTR [ecx+13], 1

; 40   : 		for(j = 0; j < ctrl->dbval.nbrows; j++)

	mov	DWORD PTR _j$[ebp], 0
	jmp	SHORT $L70222
$L70223:
	mov	edx, DWORD PTR _j$[ebp]
	add	edx, 1
	mov	DWORD PTR _j$[ebp], edx
$L70222:
	mov	eax, DWORD PTR _ctrl$[ebp]
	mov	ecx, DWORD PTR _j$[ebp]
	cmp	ecx, DWORD PTR [eax+84]
	jae	$L70224

; 42   : 			dbval = dyntab_cell(&ctrl->dbval, j, 0);

	push	0
	mov	edx, DWORD PTR _j$[ebp]
	push	edx
	mov	eax, DWORD PTR _ctrl$[ebp]
	add	eax, 84					; 00000054H
	push	eax
	call	_dyntab_cell
	add	esp, 12					; 0000000cH
	mov	DWORD PTR _dbval$[ebp], eax

; 43   : 			if(!DYNTAB_SAMEVAL(val, dbval)) continue;

	mov	ecx, DWORD PTR _val$[ebp]
	mov	edx, DWORD PTR _dbval$[ebp]
	mov	eax, DWORD PTR [ecx+4]
	cmp	eax, DWORD PTR [edx+4]
	jne	SHORT $L70226
	mov	ecx, DWORD PTR _val$[ebp]
	mov	edx, DWORD PTR _dbval$[ebp]
	mov	eax, DWORD PTR [ecx+36]
	cmp	eax, DWORD PTR [edx+36]
	jne	SHORT $L70226
	mov	ecx, DWORD PTR _val$[ebp]
	mov	edx, DWORD PTR _dbval$[ebp]
	mov	eax, DWORD PTR [ecx+40]
	cmp	eax, DWORD PTR [edx+40]
	jne	SHORT $L70226
	mov	ecx, DWORD PTR _val$[ebp]
	mov	edx, DWORD PTR _dbval$[ebp]
	mov	eax, DWORD PTR [ecx+4]
	cmp	eax, DWORD PTR [edx+4]
	jne	SHORT $L70226
	mov	ecx, DWORD PTR _dbval$[ebp]
	cmp	DWORD PTR [ecx], 0
	je	SHORT $L70728
	mov	edx, DWORD PTR _dbval$[ebp]
	mov	eax, DWORD PTR [edx]
	mov	DWORD PTR -28+[ebp], eax
	jmp	SHORT $L70729
$L70728:
	mov	DWORD PTR -28+[ebp], OFFSET FLAT:$SG70227
$L70729:
	mov	ecx, DWORD PTR _val$[ebp]
	cmp	DWORD PTR [ecx], 0
	je	SHORT $L70730
	mov	edx, DWORD PTR _val$[ebp]
	mov	eax, DWORD PTR [edx]
	mov	DWORD PTR -32+[ebp], eax
	jmp	SHORT $L70731
$L70730:
	mov	DWORD PTR -32+[ebp], OFFSET FLAT:$SG70228
$L70731:
	mov	ecx, DWORD PTR -28+[ebp]
	push	ecx
	mov	edx, DWORD PTR -32+[ebp]
	push	edx
	call	_strcmp
	add	esp, 8
	test	eax, eax
	je	SHORT $L70225
$L70226:
	jmp	$L70223
$L70225:

; 44   : 			val->b_modified = 0;

	mov	eax, DWORD PTR _val$[ebp]
	mov	BYTE PTR [eax+13], 0
$L70224:

; 47   : 		ctrl->b_modified |= val->b_modified;

	mov	ecx, DWORD PTR _val$[ebp]
	movsx	edx, BYTE PTR [ecx+13]
	mov	eax, DWORD PTR _ctrl$[ebp]
	mov	ecx, DWORD PTR [eax+200]
	or	ecx, edx
	mov	edx, DWORD PTR _ctrl$[ebp]
	mov	DWORD PTR [edx+200], ecx

; 48   : 	}

	jmp	$L70219
$L70220:

; 49   : 
; 50   : 	/* Mark deleted values */
; 51   : 	for(j = 0; j < ctrl->dbval.nbrows; j++)

	mov	DWORD PTR _j$[ebp], 0
	jmp	SHORT $L70229
$L70230:
	mov	eax, DWORD PTR _j$[ebp]
	add	eax, 1
	mov	DWORD PTR _j$[ebp], eax
$L70229:
	mov	ecx, DWORD PTR _ctrl$[ebp]
	mov	edx, DWORD PTR _j$[ebp]
	cmp	edx, DWORD PTR [ecx+84]
	jae	$L70231

; 53   : 		dbval = dyntab_cell(&ctrl->dbval, j, 0);

	push	0
	mov	eax, DWORD PTR _j$[ebp]
	push	eax
	mov	ecx, DWORD PTR _ctrl$[ebp]
	add	ecx, 84					; 00000054H
	push	ecx
	call	_dyntab_cell
	add	esp, 12					; 0000000cH
	mov	DWORD PTR _dbval$[ebp], eax

; 54   : 		dbval->b_modified = 1;

	mov	edx, DWORD PTR _dbval$[ebp]
	mov	BYTE PTR [edx+13], 1

; 55   : 		for(i = 0; i < ctrl->val.nbrows; i++)

	mov	DWORD PTR _i$[ebp], 0
	jmp	SHORT $L70232
$L70233:
	mov	eax, DWORD PTR _i$[ebp]
	add	eax, 1
	mov	DWORD PTR _i$[ebp], eax
$L70232:
	mov	ecx, DWORD PTR _ctrl$[ebp]
	mov	edx, DWORD PTR _i$[ebp]
	cmp	edx, DWORD PTR [ecx+64]
	jae	$L70234

; 57   : 			val = dyntab_cell(&ctrl->val, i, 0);

	push	0
	mov	eax, DWORD PTR _i$[ebp]
	push	eax
	mov	ecx, DWORD PTR _ctrl$[ebp]
	add	ecx, 64					; 00000040H
	push	ecx
	call	_dyntab_cell
	add	esp, 12					; 0000000cH
	mov	DWORD PTR _val$[ebp], eax

; 58   : 			if(!DYNTAB_SAMEVAL(val, dbval)) continue;

	mov	edx, DWORD PTR _val$[ebp]
	mov	eax, DWORD PTR _dbval$[ebp]
	mov	ecx, DWORD PTR [edx+4]
	cmp	ecx, DWORD PTR [eax+4]
	jne	SHORT $L70236
	mov	edx, DWORD PTR _val$[ebp]
	mov	eax, DWORD PTR _dbval$[ebp]
	mov	ecx, DWORD PTR [edx+36]
	cmp	ecx, DWORD PTR [eax+36]
	jne	SHORT $L70236
	mov	edx, DWORD PTR _val$[ebp]
	mov	eax, DWORD PTR _dbval$[ebp]
	mov	ecx, DWORD PTR [edx+40]
	cmp	ecx, DWORD PTR [eax+40]
	jne	SHORT $L70236
	mov	edx, DWORD PTR _val$[ebp]
	mov	eax, DWORD PTR _dbval$[ebp]
	mov	ecx, DWORD PTR [edx+4]
	cmp	ecx, DWORD PTR [eax+4]
	jne	SHORT $L70236
	mov	edx, DWORD PTR _dbval$[ebp]
	cmp	DWORD PTR [edx], 0
	je	SHORT $L70732
	mov	eax, DWORD PTR _dbval$[ebp]
	mov	ecx, DWORD PTR [eax]
	mov	DWORD PTR -36+[ebp], ecx
	jmp	SHORT $L70733
$L70732:
	mov	DWORD PTR -36+[ebp], OFFSET FLAT:$SG70237
$L70733:
	mov	edx, DWORD PTR _val$[ebp]
	cmp	DWORD PTR [edx], 0
	je	SHORT $L70734
	mov	eax, DWORD PTR _val$[ebp]
	mov	ecx, DWORD PTR [eax]
	mov	DWORD PTR -40+[ebp], ecx
	jmp	SHORT $L70735
$L70734:
	mov	DWORD PTR -40+[ebp], OFFSET FLAT:$SG70238
$L70735:
	mov	edx, DWORD PTR -36+[ebp]
	push	edx
	mov	eax, DWORD PTR -40+[ebp]
	push	eax
	call	_strcmp
	add	esp, 8
	test	eax, eax
	je	SHORT $L70235
$L70236:
	jmp	$L70233
$L70235:

; 59   : 			dbval->b_modified = 0;

	mov	ecx, DWORD PTR _dbval$[ebp]
	mov	BYTE PTR [ecx+13], 0
$L70234:

; 62   : 		ctrl->b_modified |= dbval->b_modified;

	mov	edx, DWORD PTR _dbval$[ebp]
	movsx	eax, BYTE PTR [edx+13]
	mov	ecx, DWORD PTR _ctrl$[ebp]
	mov	edx, DWORD PTR [ecx+200]
	or	edx, eax
	mov	eax, DWORD PTR _ctrl$[ebp]
	mov	DWORD PTR [eax+200], edx

; 63   : 	}

	jmp	$L70230
$L70231:

; 64   : }

	mov	esp, ebp
	pop	ebp
	ret	0
_ctrl_check_changes ENDP
_TEXT	ENDS
PUBLIC	_ctrl_default_value
EXTRN	_ctrl_eval_valtyp:NEAR
EXTRN	_dyntab_free:NEAR
EXTRN	_dyntab_sz:NEAR
EXTRN	_dyntab_copy:NEAR
EXTRN	_err_add_context:NEAR
EXTRN	_err_clear:NEAR
EXTRN	_dyntab_del_rows:NEAR
EXTRN	_dyntab_filter_field:NEAR
EXTRN	_dyntab_field_val:NEAR
EXTRN	_dyntab_field_cell:NEAR
_BSS	SEGMENT
	ALIGN	4

$SG70255 DB	01H DUP (?)
	ALIGN	4

$SG70259 DB	01H DUP (?)
_BSS	ENDS
_DATA	SEGMENT
$SG70254 DB	'_EVA_DEFAULTWHEN', 00H
	ORG $+3
$SG70256 DB	'_EVA_ALWAYS', 00H
$SG70258 DB	'_EVA_DEFAULTVALUETYPE', 00H
	ORG $+2
$SG70261 DB	'_EVA_NONE', 00H
	ORG $+2
$SG70265 DB	'_EVA_DEFAULTVALUE', 00H
	ORG $+2
$SG70267 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70272 DB	'_EVA_ALWAYS', 00H
$SG70274 DB	'_EVA_OPEN', 00H
	ORG $+2
$SG70276 DB	'_EVA_NEWOBJ', 00H
$SG70281 DB	'_EVA_INIT_OBJ', 00H
	ORG $+2
$SG70283 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70286 DB	'_EVA_DEBUG_SQL_DEFVAL', 00H
	ORG $+2
$SG70288 DB	'D:\Travail\ABI\EVA\V4.0\CGI\Brunix-2016\ctrl_input.c', 00H
	ORG $+3
$SG70289 DB	'ctrl_default_value', 00H
	ORG $+1
$SG70293 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70304 DB	'D:\Travail\ABI\EVA\V4.0\CGI\Brunix-2016\ctrl_input.c', 00H
	ORG $+3
$SG70305 DB	'ctrl_default_value', 00H
	ORG $+1
$SG70307 DB	'D:\Travail\ABI\EVA\V4.0\CGI\Brunix-2016\ctrl_input.c', 00H
	ORG $+3
$SG70308 DB	'ctrl_default_value', 00H
_DATA	ENDS
_TEXT	SEGMENT
_cntxt$ = 8
_i_ctrl$ = 12
_form$ = -44
_ctrl$ = -52
_defaultval$ = -40
_listobj$ = -20
_i$ = -48
_defaultwhen$70253 = -56
_defaulttype$70257 = -60
_sql_trace$70278 = -64
_ctrl_default_value PROC NEAR

; 75   : ){

	push	ebp
	mov	ebp, esp
	sub	esp, 80					; 00000050H

; 76   : 	EVA_form *form = cntxt->form;

	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	ecx, DWORD PTR [eax+80]
	mov	DWORD PTR _form$[ebp], ecx

; 77   : 	EVA_ctrl *ctrl = form->ctrl + i_ctrl;

	mov	edx, DWORD PTR _i_ctrl$[ebp]
	imul	edx, 480				; 000001e0H
	mov	eax, DWORD PTR _form$[ebp]
	mov	ecx, DWORD PTR [eax]
	add	ecx, edx
	mov	DWORD PTR _ctrl$[ebp], ecx

; 78   : 	DynTable defaultval = {0};

	mov	DWORD PTR _defaultval$[ebp], 0
	xor	edx, edx
	mov	DWORD PTR _defaultval$[ebp+4], edx
	mov	DWORD PTR _defaultval$[ebp+8], edx
	mov	DWORD PTR _defaultval$[ebp+12], edx
	mov	DWORD PTR _defaultval$[ebp+16], edx

; 79   : 	DynTable listobj = {0};

	mov	DWORD PTR _listobj$[ebp], 0
	xor	eax, eax
	mov	DWORD PTR _listobj$[ebp+4], eax
	mov	DWORD PTR _listobj$[ebp+8], eax
	mov	DWORD PTR _listobj$[ebp+12], eax
	mov	DWORD PTR _listobj$[ebp+16], eax

; 80   : 	unsigned long i;
; 81   : 
; 82   : 	/* Use default value if applicable */
; 83   : 	if(!ctrl->val.nbrows)

	mov	ecx, DWORD PTR _ctrl$[ebp]
	cmp	DWORD PTR [ecx+64], 0
	jne	$L70300

; 85   : 		char *defaultwhen = (ctrl->storage || ctrl->cgival.nbrows) ? CTRL_ATTR_VAL(DEFAULTWHEN) : "_EVA_ALWAYS";

	mov	edx, DWORD PTR _ctrl$[ebp]
	cmp	DWORD PTR [edx+36], 0
	jne	SHORT $L70737
	mov	eax, DWORD PTR _ctrl$[ebp]
	cmp	DWORD PTR [eax+104], 0
	jne	SHORT $L70737
	mov	DWORD PTR -68+[ebp], OFFSET FLAT:$SG70256
	jmp	SHORT $L70740
$L70737:
	cmp	DWORD PTR _ctrl$[ebp], 0
	je	SHORT $L70738
	push	0
	push	-1
	push	OFFSET FLAT:$SG70254
	mov	ecx, DWORD PTR _ctrl$[ebp]
	add	ecx, 44					; 0000002cH
	push	ecx
	call	_dyntab_field_val
	add	esp, 16					; 00000010H
	mov	DWORD PTR -72+[ebp], eax
	jmp	SHORT $L70739
$L70738:
	mov	DWORD PTR -72+[ebp], OFFSET FLAT:$SG70255
$L70739:
	mov	edx, DWORD PTR -72+[ebp]
	mov	DWORD PTR -68+[ebp], edx
$L70740:
	mov	eax, DWORD PTR -68+[ebp]
	mov	DWORD PTR _defaultwhen$70253[ebp], eax

; 86   : 		char *defaulttype = CTRL_ATTR_VAL(DEFAULTVALUETYPE);

	cmp	DWORD PTR _ctrl$[ebp], 0
	je	SHORT $L70741
	push	0
	push	-1
	push	OFFSET FLAT:$SG70258
	mov	ecx, DWORD PTR _ctrl$[ebp]
	add	ecx, 44					; 0000002cH
	push	ecx
	call	_dyntab_field_val
	add	esp, 16					; 00000010H
	mov	DWORD PTR -76+[ebp], eax
	jmp	SHORT $L70742
$L70741:
	mov	DWORD PTR -76+[ebp], OFFSET FLAT:$SG70259
$L70742:
	mov	edx, DWORD PTR -76+[ebp]
	mov	DWORD PTR _defaulttype$70257[ebp], edx

; 87   : 
; 88   : 		/* Check if applicable */
; 89   : 		if(!strcmp(defaulttype, "_EVA_NONE")) RETURN_OK;

	push	OFFSET FLAT:$SG70261
	mov	eax, DWORD PTR _defaulttype$70257[ebp]
	push	eax
	call	_strcmp
	add	esp, 8
	test	eax, eax
	jne	SHORT $L70260
	jmp	$eva_noerr$70262
$L70260:

; 90   : 		CTRL_ATTR(defaultval, DEFAULTVALUE);

	lea	ecx, DWORD PTR _defaultval$[ebp]
	push	ecx
	call	_dyntab_free
	add	esp, 4
	push	0
	push	-1
	push	OFFSET FLAT:$SG70265
	mov	edx, DWORD PTR _ctrl$[ebp]
	add	edx, 44					; 0000002cH
	push	edx
	push	0
	lea	eax, DWORD PTR _defaultval$[ebp]
	push	eax
	call	_dyntab_filter_field
	add	esp, 24					; 00000018H
	test	eax, eax
	je	SHORT $L70264
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29872], OFFSET FLAT:$SG70267
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 90		; 0000005aH
	jmp	$eva_err$70268
$L70264:

; 91   : 		if((defaultval.nbrows || *defaulttype) && (
; 92   : 			!strcmp(defaultwhen, "_EVA_ALWAYS") ||
; 93   : 			(!strcmp(defaultwhen, "_EVA_OPEN") && !form->ctrl->cgival.nbrows) ||
; 94   : 			(!strcmp(defaultwhen, "_EVA_NEWOBJ") && form->b_newobj) ||
; 95   : 			(form->b_newobj && !form->ctrl->cgival.nbrows)))

	cmp	DWORD PTR _defaultval$[ebp], 0
	jne	SHORT $L70270
	mov	eax, DWORD PTR _defaulttype$70257[ebp]
	movsx	ecx, BYTE PTR [eax]
	test	ecx, ecx
	je	$L70300
$L70270:
	push	OFFSET FLAT:$SG70272
	mov	edx, DWORD PTR _defaultwhen$70253[ebp]
	push	edx
	call	_strcmp
	add	esp, 8
	test	eax, eax
	je	SHORT $L70271
	push	OFFSET FLAT:$SG70274
	mov	eax, DWORD PTR _defaultwhen$70253[ebp]
	push	eax
	call	_strcmp
	add	esp, 8
	test	eax, eax
	jne	SHORT $L70273
	mov	ecx, DWORD PTR _form$[ebp]
	mov	edx, DWORD PTR [ecx]
	cmp	DWORD PTR [edx+104], 0
	je	SHORT $L70271
$L70273:
	push	OFFSET FLAT:$SG70276
	mov	eax, DWORD PTR _defaultwhen$70253[ebp]
	push	eax
	call	_strcmp
	add	esp, 8
	test	eax, eax
	jne	SHORT $L70275
	mov	ecx, DWORD PTR _form$[ebp]
	cmp	DWORD PTR [ecx+72], 0
	jne	SHORT $L70271
$L70275:
	mov	edx, DWORD PTR _form$[ebp]
	cmp	DWORD PTR [edx+72], 0
	je	$L70300
	mov	eax, DWORD PTR _form$[ebp]
	mov	ecx, DWORD PTR [eax]
	cmp	DWORD PTR [ecx+104], 0
	jne	$L70300
$L70271:

; 97   : 			if(*defaulttype)

	mov	edx, DWORD PTR _defaulttype$70257[ebp]
	movsx	eax, BYTE PTR [edx]
	test	eax, eax
	je	$L70277

; 99   : 				/* Expression : evaluate & set ctrl->val */
; 100  : 				int sql_trace = cntxt->sql_trace;

	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	edx, DWORD PTR [ecx+29852]
	mov	DWORD PTR _sql_trace$70278[ebp], edx

; 101  : 				CTRL_ATTR(listobj, INIT_OBJ);

	lea	eax, DWORD PTR _listobj$[ebp]
	push	eax
	call	_dyntab_free
	add	esp, 4
	push	0
	push	-1
	push	OFFSET FLAT:$SG70281
	mov	ecx, DWORD PTR _ctrl$[ebp]
	add	ecx, 44					; 0000002cH
	push	ecx
	push	0
	lea	edx, DWORD PTR _listobj$[ebp]
	push	edx
	call	_dyntab_filter_field
	add	esp, 24					; 00000018H
	test	eax, eax
	je	SHORT $L70280
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29872], OFFSET FLAT:$SG70283
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 101		; 00000065H
	jmp	$eva_err$70268
$L70280:

; 102  : 				if(CTRL_ATTR_CELL(DEBUG_SQL_DEFVAL)) cntxt->sql_trace = DEBUG_SQL_RES;

	cmp	DWORD PTR _ctrl$[ebp], 0
	je	SHORT $L70743
	push	0
	push	-1
	push	OFFSET FLAT:$SG70286
	mov	edx, DWORD PTR _ctrl$[ebp]
	add	edx, 44					; 0000002cH
	push	edx
	call	_dyntab_field_cell
	add	esp, 16					; 00000010H
	mov	DWORD PTR -80+[ebp], eax
	jmp	SHORT $L70744
$L70743:
	mov	DWORD PTR -80+[ebp], 0
$L70744:
	cmp	DWORD PTR -80+[ebp], 0
	je	SHORT $L70285
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29852], 2
$L70285:

; 103  : 				if(ctrl_eval_valtyp(cntxt, ctrl, &ctrl->val, defaulttype, &listobj, &defaultval)) CLEAR_ERROR;

	lea	ecx, DWORD PTR _defaultval$[ebp]
	push	ecx
	lea	edx, DWORD PTR _listobj$[ebp]
	push	edx
	mov	eax, DWORD PTR _defaulttype$70257[ebp]
	push	eax
	mov	ecx, DWORD PTR _ctrl$[ebp]
	add	ecx, 64					; 00000040H
	push	ecx
	mov	edx, DWORD PTR _ctrl$[ebp]
	push	edx
	mov	eax, DWORD PTR _cntxt$[ebp]
	push	eax
	call	_ctrl_eval_valtyp
	add	esp, 24					; 00000018H
	test	eax, eax
	je	SHORT $L70287
	push	103					; 00000067H
	push	OFFSET FLAT:$SG70288
	push	OFFSET FLAT:$SG70289
	mov	ecx, DWORD PTR _cntxt$[ebp]
	push	ecx
	call	_err_clear
	add	esp, 16					; 00000010H
$L70287:

; 104  : 				cntxt->sql_trace = sql_trace;

	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	eax, DWORD PTR _sql_trace$70278[ebp]
	mov	DWORD PTR [edx+29852], eax

; 106  : 			else

	jmp	SHORT $L70291
$L70277:

; 107  : 				/* Fixed value : set ctrl->val */
; 108  : 				DYNTAB_ADD_CELL(&ctrl->val, 0, 0, &defaultval, 0, 0);

	push	1
	push	0
	push	0
	lea	ecx, DWORD PTR _defaultval$[ebp]
	push	ecx
	call	_dyntab_cell
	add	esp, 12					; 0000000cH
	push	eax
	push	0
	push	0
	mov	edx, DWORD PTR _ctrl$[ebp]
	add	edx, 64					; 00000040H
	push	edx
	call	_dyntab_copy
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L70291
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29872], OFFSET FLAT:$SG70293
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 108		; 0000006cH
	jmp	$eva_err$70268
$L70291:

; 109  : 
; 110  : 			/* Delete empty values */
; 111  : 			for(i = 1; i <= ctrl->val.nbrows; i++)

	mov	DWORD PTR _i$[ebp], 1
	jmp	SHORT $L70294
$L70295:
	mov	edx, DWORD PTR _i$[ebp]
	add	edx, 1
	mov	DWORD PTR _i$[ebp], edx
$L70294:
	mov	eax, DWORD PTR _ctrl$[ebp]
	mov	ecx, DWORD PTR _i$[ebp]
	cmp	ecx, DWORD PTR [eax+64]
	ja	SHORT $L70296

; 112  : 				if(!dyntab_sz(&ctrl->val, ctrl->val.nbrows - i, 0))

	push	0
	mov	edx, DWORD PTR _ctrl$[ebp]
	mov	eax, DWORD PTR [edx+64]
	sub	eax, DWORD PTR _i$[ebp]
	push	eax
	mov	ecx, DWORD PTR _ctrl$[ebp]
	add	ecx, 64					; 00000040H
	push	ecx
	call	_dyntab_sz
	add	esp, 12					; 0000000cH
	test	eax, eax
	jne	SHORT $L70297

; 113  : 					dyntab_del_rows(&ctrl->val, ctrl->val.nbrows - i, 1);

	push	1
	mov	edx, DWORD PTR _ctrl$[ebp]
	mov	eax, DWORD PTR [edx+64]
	sub	eax, DWORD PTR _i$[ebp]
	push	eax
	mov	ecx, DWORD PTR _ctrl$[ebp]
	add	ecx, 64					; 00000040H
	push	ecx
	call	_dyntab_del_rows
	add	esp, 12					; 0000000cH
$L70297:

; 114  : 
; 115  : 			/* If no default value was added : free control values */
; 116  : 			if(!dyntab_sz(&ctrl->val, 0, 0))

	jmp	SHORT $L70295
$L70296:
	push	0
	push	0
	mov	edx, DWORD PTR _ctrl$[ebp]
	add	edx, 64					; 00000040H
	push	edx
	call	_dyntab_sz
	add	esp, 12					; 0000000cH
	test	eax, eax
	jne	SHORT $L70298

; 117  : 				dyntab_free(&ctrl->val);

	mov	eax, DWORD PTR _ctrl$[ebp]
	add	eax, 64					; 00000040H
	push	eax
	call	_dyntab_free
	add	esp, 4

; 118  : 
; 119  : 			/* Else if existing object */
; 120  : 			else if(!dyntab_sz(&ctrl->val, 0, 0) && !form->b_newobj)

	jmp	SHORT $L70300
$L70298:
	push	0
	push	0
	mov	ecx, DWORD PTR _ctrl$[ebp]
	add	ecx, 64					; 00000040H
	push	ecx
	call	_dyntab_sz
	add	esp, 12					; 0000000cH
	test	eax, eax
	jne	SHORT $L70300
	mov	edx, DWORD PTR _form$[ebp]
	cmp	DWORD PTR [edx+72], 0
	jne	SHORT $L70300

; 122  : 				/* Mark default values & ctrl as modified */
; 123  : 				for(i = 0; i < ctrl->val.nbrows; i++) dyntab_cell(&ctrl->val, i, 0)->b_modified = 1;

	mov	DWORD PTR _i$[ebp], 0
	jmp	SHORT $L70301
$L70302:
	mov	eax, DWORD PTR _i$[ebp]
	add	eax, 1
	mov	DWORD PTR _i$[ebp], eax
$L70301:
	mov	ecx, DWORD PTR _ctrl$[ebp]
	mov	edx, DWORD PTR _i$[ebp]
	cmp	edx, DWORD PTR [ecx+64]
	jae	SHORT $L70303
	push	0
	mov	eax, DWORD PTR _i$[ebp]
	push	eax
	mov	ecx, DWORD PTR _ctrl$[ebp]
	add	ecx, 64					; 00000040H
	push	ecx
	call	_dyntab_cell
	add	esp, 12					; 0000000cH
	mov	BYTE PTR [eax+13], 1
	jmp	SHORT $L70302
$L70303:

; 124  : 				ctrl->b_modified = 1;

	mov	edx, DWORD PTR _ctrl$[ebp]
	mov	DWORD PTR [edx+200], 1
$L70300:
$eva_noerr$70262:

; 128  : 
; 129  : 	RETURN_OK_CLEANUP;

	push	0
	push	OFFSET FLAT:$SG70304
	push	OFFSET FLAT:$SG70305
	mov	eax, DWORD PTR _cntxt$[ebp]
	push	eax
	call	_err_clear
	add	esp, 16					; 00000010H
$eva_err$70268:
	mov	ecx, DWORD PTR _cntxt$[ebp]
	cmp	DWORD PTR [ecx+29872], 0
	je	SHORT $L70306
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	eax, DWORD PTR [edx+29900]
	push	eax
	push	OFFSET FLAT:$SG70307
	push	OFFSET FLAT:$SG70308
	mov	ecx, DWORD PTR _cntxt$[ebp]
	push	ecx
	call	_err_add_context
	add	esp, 16					; 00000010H
$L70306:
	lea	edx, DWORD PTR _defaultval$[ebp]
	push	edx
	call	_dyntab_free
	add	esp, 4
	mov	eax, DWORD PTR _cntxt$[ebp]
	xor	ecx, ecx
	cmp	DWORD PTR [eax+29872], 0
	setne	cl
	mov	eax, ecx

; 130  : }

	mov	esp, ebp
	pop	ebp
	ret	0
_ctrl_default_value ENDP
_TEXT	ENDS
PUBLIC	_ctrl_read_values
EXTRN	_ctrl_handlers:BYTE
EXTRN	_cgi_filter_values:NEAR
EXTRN	_cgi_value_setkeep:NEAR
EXTRN	_strtoul:NEAR
EXTRN	_dyntab_val:NEAR
_BSS	SEGMENT
	ALIGN	4

$SG70329 DB	01H DUP (?)
	ALIGN	4

$SG70338 DB	01H DUP (?)
	ALIGN	4

$SG70339 DB	01H DUP (?)
_BSS	ENDS
_DATA	SEGMENT
	ORG $+1
$SG70343 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70349 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70353 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70362 DB	'D:\Travail\ABI\EVA\V4.0\CGI\Brunix-2016\ctrl_input.c', 00H
	ORG $+3
$SG70363 DB	'ctrl_read_values', 00H
	ORG $+3
$SG70365 DB	'D:\Travail\ABI\EVA\V4.0\CGI\Brunix-2016\ctrl_input.c', 00H
	ORG $+3
$SG70366 DB	'ctrl_read_values', 00H
_DATA	ENDS
_TEXT	SEGMENT
_cntxt$ = 8
_i_ctrl$ = 12
_form$ = -4
_ctrl$ = -20
_i$ = -12
_idform$ = -16
_idobj$ = -8
_val$70334 = -24
_cgi$70335 = -32
_b_modified$70337 = -28
__i$70358 = -36
_ctrl_read_values PROC NEAR

; 143  : ){

	push	ebp
	mov	ebp, esp
	sub	esp, 56					; 00000038H

; 144  : 	EVA_form *form = cntxt->form;

	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	ecx, DWORD PTR [eax+80]
	mov	DWORD PTR _form$[ebp], ecx

; 145  : 	EVA_ctrl *ctrl = form->ctrl + i_ctrl;

	mov	edx, DWORD PTR _i_ctrl$[ebp]
	imul	edx, 480				; 000001e0H
	mov	eax, DWORD PTR _form$[ebp]
	mov	ecx, DWORD PTR [eax]
	add	ecx, edx
	mov	DWORD PTR _ctrl$[ebp], ecx

; 146  : 	unsigned long i;
; 147  : 	unsigned long idform = DYNTAB_TOUL(&form->id_form);

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
	mov	DWORD PTR _idform$[ebp], eax

; 148  : 	unsigned long idobj = DYNTAB_TOUL(&form->id_obj);

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
	mov	DWORD PTR _idobj$[ebp], eax

; 149  : 
; 150  : 	/* Call handler & return if no field info */
; 151  : 	if(!ctrl->FIELD[0])

	mov	ecx, DWORD PTR _ctrl$[ebp]
	mov	edx, DWORD PTR [ecx+280]
	movsx	eax, BYTE PTR [edx]
	test	eax, eax
	jne	SHORT $L70324

; 153  : 		ctrl->storage = 0;

	mov	ecx, DWORD PTR _ctrl$[ebp]
	mov	DWORD PTR [ecx+36], 0

; 154  : 		CTRL_SEC_HDLR(i_ctrl);

	cmp	DWORD PTR _i_ctrl$[ebp], 0
	je	SHORT $L70325
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	eax, DWORD PTR [edx+80]
	mov	ecx, DWORD PTR _i_ctrl$[ebp]
	imul	ecx, 480				; 000001e0H
	mov	edx, DWORD PTR [eax]
	mov	eax, DWORD PTR [edx+ecx+32]
	shl	eax, 4
	cmp	DWORD PTR _ctrl_handlers[eax+12], 0
	je	SHORT $L70325
	mov	ecx, DWORD PTR _i_ctrl$[ebp]
	push	ecx
	mov	edx, DWORD PTR _cntxt$[ebp]
	push	edx
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	ecx, DWORD PTR [eax+80]
	mov	edx, DWORD PTR _i_ctrl$[ebp]
	imul	edx, 480				; 000001e0H
	mov	eax, DWORD PTR [ecx]
	mov	ecx, DWORD PTR [eax+edx+32]
	shl	ecx, 4
	call	DWORD PTR _ctrl_handlers[ecx+12]
	add	esp, 8
	test	eax, eax
	je	SHORT $L70325
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 154		; 0000009aH
	jmp	$eva_err$70326
$L70325:

; 155  : 		RETURN_OK;

	jmp	$eva_noerr$70327
$L70324:

; 157  : 
; 158  : 	/* Read control values & status in CGI data */
; 159  : 	if(cgi_filter_values(cntxt, &ctrl->cgival, 'D', ~0UL, idobj ? ~0UL : idform, idobj, ctrl->FIELD, "", 0, 0))

	cmp	DWORD PTR _idobj$[ebp], 0
	je	SHORT $L70746
	mov	DWORD PTR -40+[ebp], -1
	jmp	SHORT $L70747
$L70746:
	mov	eax, DWORD PTR _idform$[ebp]
	mov	DWORD PTR -40+[ebp], eax
$L70747:
	push	0
	push	0
	push	OFFSET FLAT:$SG70329
	mov	ecx, DWORD PTR _ctrl$[ebp]
	mov	edx, DWORD PTR [ecx+280]
	push	edx
	mov	eax, DWORD PTR _idobj$[ebp]
	push	eax
	mov	ecx, DWORD PTR -40+[ebp]
	push	ecx
	push	-1
	push	68					; 00000044H
	mov	edx, DWORD PTR _ctrl$[ebp]
	add	edx, 104				; 00000068H
	push	edx
	mov	eax, DWORD PTR _cntxt$[ebp]
	push	eax
	call	_cgi_filter_values
	add	esp, 40					; 00000028H
	test	eax, eax
	je	SHORT $L70328

; 160  : 		STACK_ERROR;

	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 160		; 000000a0H
	jmp	$eva_err$70326
$L70328:

; 161  : 
; 162  : 	/* Process CGI values if any */
; 163  : 	if(ctrl->cgival.nbrows) for(i = 0; i < ctrl->cgival.nbrows; i++)

	mov	edx, DWORD PTR _ctrl$[ebp]
	cmp	DWORD PTR [edx+104], 0
	je	$L70330
	mov	DWORD PTR _i$[ebp], 0
	jmp	SHORT $L70331
$L70332:
	mov	eax, DWORD PTR _i$[ebp]
	add	eax, 1
	mov	DWORD PTR _i$[ebp], eax
$L70331:
	mov	ecx, DWORD PTR _ctrl$[ebp]
	mov	edx, DWORD PTR _i$[ebp]
	cmp	edx, DWORD PTR [ecx+104]
	jae	$L70333

; 165  : 		DynTableCell *val = dyntab_cell(&ctrl->cgival, i, 0);

	push	0
	mov	eax, DWORD PTR _i$[ebp]
	push	eax
	mov	ecx, DWORD PTR _ctrl$[ebp]
	add	ecx, 104				; 00000068H
	push	ecx
	call	_dyntab_cell
	add	esp, 12					; 0000000cH
	mov	DWORD PTR _val$70334[ebp], eax

; 166  : 		CGIData *cgi = val->i_cgi ? cntxt->cgi + val->i_cgi : NULL;

	mov	edx, DWORD PTR _val$70334[ebp]
	cmp	DWORD PTR [edx+48], 0
	je	SHORT $L70748
	mov	eax, DWORD PTR _val$70334[ebp]
	mov	ecx, DWORD PTR [eax+48]
	imul	ecx, 56					; 00000038H
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	eax, DWORD PTR [edx+29648]
	add	eax, ecx
	mov	DWORD PTR -44+[ebp], eax
	jmp	SHORT $L70749
$L70748:
	mov	DWORD PTR -44+[ebp], 0
$L70749:
	mov	ecx, DWORD PTR -44+[ebp]
	mov	DWORD PTR _cgi$70335[ebp], ecx

; 167  : 		int b_modified = ctrl->storage && cgi &&
; 168  : 						((form->b_newobj && !cgi->i_old && val->len)||
; 169  : 							STRCMPNUL(cgi->value, cntxt->cgi[cgi->i_old].value));

	mov	edx, DWORD PTR _ctrl$[ebp]
	cmp	DWORD PTR [edx+36], 0
	je	$L70750
	cmp	DWORD PTR _cgi$70335[ebp], 0
	je	$L70750
	mov	eax, DWORD PTR _form$[ebp]
	cmp	DWORD PTR [eax+72], 0
	je	SHORT $L70751
	mov	ecx, DWORD PTR _cgi$70335[ebp]
	cmp	DWORD PTR [ecx+48], 0
	jne	SHORT $L70751
	mov	edx, DWORD PTR _val$70334[ebp]
	cmp	DWORD PTR [edx+4], 0
	jne	SHORT $L70756
$L70751:
	mov	eax, DWORD PTR _cgi$70335[ebp]
	mov	ecx, DWORD PTR [eax+48]
	imul	ecx, 56					; 00000038H
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	eax, DWORD PTR [edx+29648]
	cmp	DWORD PTR [eax+ecx+8], 0
	je	SHORT $L70752
	mov	ecx, DWORD PTR _cgi$70335[ebp]
	mov	edx, DWORD PTR [ecx+48]
	imul	edx, 56					; 00000038H
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	ecx, DWORD PTR [eax+29648]
	mov	edx, DWORD PTR [ecx+edx+8]
	mov	DWORD PTR -48+[ebp], edx
	jmp	SHORT $L70753
$L70752:
	mov	DWORD PTR -48+[ebp], OFFSET FLAT:$SG70338
$L70753:
	mov	eax, DWORD PTR _cgi$70335[ebp]
	cmp	DWORD PTR [eax+8], 0
	je	SHORT $L70754
	mov	ecx, DWORD PTR _cgi$70335[ebp]
	mov	edx, DWORD PTR [ecx+8]
	mov	DWORD PTR -52+[ebp], edx
	jmp	SHORT $L70755
$L70754:
	mov	DWORD PTR -52+[ebp], OFFSET FLAT:$SG70339
$L70755:
	mov	eax, DWORD PTR -48+[ebp]
	push	eax
	mov	ecx, DWORD PTR -52+[ebp]
	push	ecx
	call	_strcmp
	add	esp, 8
	test	eax, eax
	je	SHORT $L70750
$L70756:
	mov	DWORD PTR -56+[ebp], 1
	jmp	SHORT $L70757
$L70750:
	mov	DWORD PTR -56+[ebp], 0
$L70757:
	mov	edx, DWORD PTR -56+[ebp]
	mov	DWORD PTR _b_modified$70337[ebp], edx

; 170  : 
; 171  : 
; 172  : 		/* Add non empty CGI value to control values table */
; 173  : 		if(val->len)

	mov	eax, DWORD PTR _val$70334[ebp]
	cmp	DWORD PTR [eax+4], 0
	je	$L70340

; 175  : 			DYNTAB_ADD_CELL(&ctrl->val, ctrl->val.nbrows, 0, &ctrl->cgival, i, 0);

	push	1
	push	0
	mov	ecx, DWORD PTR _i$[ebp]
	push	ecx
	mov	edx, DWORD PTR _ctrl$[ebp]
	add	edx, 104				; 00000068H
	push	edx
	call	_dyntab_cell
	add	esp, 12					; 0000000cH
	push	eax
	push	0
	mov	eax, DWORD PTR _ctrl$[ebp]
	mov	ecx, DWORD PTR [eax+64]
	push	ecx
	mov	edx, DWORD PTR _ctrl$[ebp]
	add	edx, 64					; 00000040H
	push	edx
	call	_dyntab_copy
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L70341
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29872], OFFSET FLAT:$SG70343
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 175		; 000000afH
	jmp	$eva_err$70326
$L70341:

; 176  : 			val = dyntab_cell(&ctrl->val, ctrl->val.nbrows - 1, 0);

	push	0
	mov	edx, DWORD PTR _ctrl$[ebp]
	mov	eax, DWORD PTR [edx+64]
	sub	eax, 1
	push	eax
	mov	ecx, DWORD PTR _ctrl$[ebp]
	add	ecx, 64					; 00000040H
	push	ecx
	call	_dyntab_cell
	add	esp, 12					; 0000000cH
	mov	DWORD PTR _val$70334[ebp], eax

; 177  : 			val->b_modified = (char)b_modified;

	mov	edx, DWORD PTR _val$70334[ebp]
	mov	al, BYTE PTR _b_modified$70337[ebp]
	mov	BYTE PTR [edx+13], al

; 178  : 			form->has_data |= ctrl->storage;

	mov	ecx, DWORD PTR _form$[ebp]
	mov	edx, DWORD PTR _ctrl$[ebp]
	mov	eax, DWORD PTR [ecx+136]
	or	eax, DWORD PTR [edx+36]
	mov	ecx, DWORD PTR _form$[ebp]
	mov	DWORD PTR [ecx+136], eax
$L70340:

; 180  : 		ctrl->b_modified |= b_modified;

	mov	edx, DWORD PTR _ctrl$[ebp]
	mov	eax, DWORD PTR [edx+200]
	or	eax, DWORD PTR _b_modified$70337[ebp]
	mov	ecx, DWORD PTR _ctrl$[ebp]
	mov	DWORD PTR [ecx+200], eax

; 181  : 	}

	jmp	$L70332
$L70333:

; 182  : 	else

	jmp	SHORT $L70347
$L70330:

; 183  : 		/* Read control values from DB if no CGI */
; 184  : 		if(!form->b_newobj &&
; 185  : 			dyntab_filter_field(&ctrl->val, 0, &form->objdata, ctrl->FIELD, ~0UL, NULL)) RETURN_ERR_MEMORY;

	mov	edx, DWORD PTR _form$[ebp]
	cmp	DWORD PTR [edx+72], 0
	jne	SHORT $L70347
	push	0
	push	-1
	mov	eax, DWORD PTR _ctrl$[ebp]
	mov	ecx, DWORD PTR [eax+280]
	push	ecx
	mov	edx, DWORD PTR _form$[ebp]
	add	edx, 52					; 00000034H
	push	edx
	push	0
	mov	eax, DWORD PTR _ctrl$[ebp]
	add	eax, 64					; 00000040H
	push	eax
	call	_dyntab_filter_field
	add	esp, 24					; 00000018H
	test	eax, eax
	je	SHORT $L70347
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29872], OFFSET FLAT:$SG70349
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 185		; 000000b9H
	jmp	$eva_err$70326
$L70347:

; 186  : 
; 187  : 	/* Read DB values if applicable */
; 188  : 	if(!form->b_newobj &&
; 189  : 		dyntab_filter_field(&ctrl->dbval, 0, &form->objdata, ctrl->FIELD, ~0UL, NULL)) RETURN_ERR_MEMORY;

	mov	eax, DWORD PTR _form$[ebp]
	cmp	DWORD PTR [eax+72], 0
	jne	SHORT $L70351
	push	0
	push	-1
	mov	ecx, DWORD PTR _ctrl$[ebp]
	mov	edx, DWORD PTR [ecx+280]
	push	edx
	mov	eax, DWORD PTR _form$[ebp]
	add	eax, 52					; 00000034H
	push	eax
	push	0
	mov	ecx, DWORD PTR _ctrl$[ebp]
	add	ecx, 84					; 00000054H
	push	ecx
	call	_dyntab_filter_field
	add	esp, 24					; 00000018H
	test	eax, eax
	je	SHORT $L70351
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29872], OFFSET FLAT:$SG70353
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 189		; 000000bdH
	jmp	$eva_err$70326
$L70351:

; 190  : 
; 191  : 	/* Handle default values */
; 192  : 	if((form->nextstep == HtmlEdit ||
; 193  : 		(form->nextstep == HtmlView && !ctrl->storage)) &&
; 194  : 		ctrl_default_value(cntxt, i_ctrl)) STACK_ERROR;

	mov	ecx, DWORD PTR _form$[ebp]
	cmp	DWORD PTR [ecx+172], 4
	je	SHORT $L70355
	mov	edx, DWORD PTR _form$[ebp]
	cmp	DWORD PTR [edx+172], 6
	jne	SHORT $L70354
	mov	eax, DWORD PTR _ctrl$[ebp]
	cmp	DWORD PTR [eax+36], 0
	jne	SHORT $L70354
$L70355:
	mov	ecx, DWORD PTR _i_ctrl$[ebp]
	push	ecx
	mov	edx, DWORD PTR _cntxt$[ebp]
	push	edx
	call	_ctrl_default_value
	add	esp, 8
	test	eax, eax
	je	SHORT $L70354
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 194		; 000000c2H
	jmp	$eva_err$70326
$L70354:

; 195  : 
; 196  : 	/* Call control handler */
; 197  : 	CTRL_SEC_HDLR(i_ctrl);

	cmp	DWORD PTR _i_ctrl$[ebp], 0
	je	SHORT $L70356
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	edx, DWORD PTR [ecx+80]
	mov	eax, DWORD PTR _i_ctrl$[ebp]
	imul	eax, 480				; 000001e0H
	mov	ecx, DWORD PTR [edx]
	mov	edx, DWORD PTR [ecx+eax+32]
	shl	edx, 4
	cmp	DWORD PTR _ctrl_handlers[edx+12], 0
	je	SHORT $L70356
	mov	eax, DWORD PTR _i_ctrl$[ebp]
	push	eax
	mov	ecx, DWORD PTR _cntxt$[ebp]
	push	ecx
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	eax, DWORD PTR [edx+80]
	mov	ecx, DWORD PTR _i_ctrl$[ebp]
	imul	ecx, 480				; 000001e0H
	mov	edx, DWORD PTR [eax]
	mov	eax, DWORD PTR [edx+ecx+32]
	shl	eax, 4
	call	DWORD PTR _ctrl_handlers[eax+12]
	add	esp, 8
	test	eax, eax
	je	SHORT $L70356
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 197		; 000000c5H
	jmp	$eva_err$70326
$L70356:

; 198  : 	ctrl = form->ctrl + i_ctrl;

	mov	edx, DWORD PTR _i_ctrl$[ebp]
	imul	edx, 480				; 000001e0H
	mov	eax, DWORD PTR _form$[ebp]
	mov	ecx, DWORD PTR [eax]
	add	ecx, edx
	mov	DWORD PTR _ctrl$[ebp], ecx

; 199  : 
; 200  : 	/* Check values changes */
; 201  : 	ctrl_check_changes(cntxt, i_ctrl, 1);

	push	1
	mov	edx, DWORD PTR _i_ctrl$[ebp]
	push	edx
	mov	eax, DWORD PTR _cntxt$[ebp]
	push	eax
	call	_ctrl_check_changes
	add	esp, 12					; 0000000cH

; 202  : 	form->b_modified |= ctrl->b_modified;

	mov	ecx, DWORD PTR _form$[ebp]
	mov	edx, DWORD PTR _ctrl$[ebp]
	mov	eax, DWORD PTR [ecx+128]
	or	eax, DWORD PTR [edx+200]
	mov	ecx, DWORD PTR _form$[ebp]
	mov	DWORD PTR [ecx+128], eax

; 203  : 
; 204  : 	/* Clear CGI values if control unchanged (to optimize size of transmitted data) */
; 205  : 	if(!form->b_newobj && ctrl->storage && !ctrl->b_modified && form->prevstep != HtmlSaveDlg)

	mov	edx, DWORD PTR _form$[ebp]
	cmp	DWORD PTR [edx+72], 0
	jne	SHORT $eva_noerr$70327
	mov	eax, DWORD PTR _ctrl$[ebp]
	cmp	DWORD PTR [eax+36], 0
	je	SHORT $eva_noerr$70327
	mov	ecx, DWORD PTR _ctrl$[ebp]
	cmp	DWORD PTR [ecx+200], 0
	jne	SHORT $eva_noerr$70327
	mov	edx, DWORD PTR _form$[ebp]
	cmp	DWORD PTR [edx+168], 3
	je	SHORT $eva_noerr$70327

; 207  : 		CGI_VALUES_DONTKEEP(&ctrl->cgival);

	mov	DWORD PTR __i$70358[ebp], 0
	jmp	SHORT $L70359
$L70360:
	mov	eax, DWORD PTR __i$70358[ebp]
	add	eax, 1
	mov	DWORD PTR __i$70358[ebp], eax
$L70359:
	mov	ecx, DWORD PTR _ctrl$[ebp]
	mov	edx, DWORD PTR __i$70358[ebp]
	cmp	edx, DWORD PTR [ecx+104]
	jae	SHORT $L70361
	push	1
	mov	eax, DWORD PTR __i$70358[ebp]
	push	eax
	mov	ecx, DWORD PTR _ctrl$[ebp]
	add	ecx, 104				; 00000068H
	push	ecx
	mov	edx, DWORD PTR _cntxt$[ebp]
	push	edx
	call	_cgi_value_setkeep
	add	esp, 16					; 00000010H
	jmp	SHORT $L70360
$L70361:

; 208  : 		ctrl->b_cgicleared = 1;

	mov	eax, DWORD PTR _ctrl$[ebp]
	mov	DWORD PTR [eax+268], 1
$eva_noerr$70327:

; 210  : 
; 211  : 	RETURN_OK_CLEANUP;

	push	0
	push	OFFSET FLAT:$SG70362
	push	OFFSET FLAT:$SG70363
	mov	ecx, DWORD PTR _cntxt$[ebp]
	push	ecx
	call	_err_clear
	add	esp, 16					; 00000010H
$eva_err$70326:
	mov	edx, DWORD PTR _cntxt$[ebp]
	cmp	DWORD PTR [edx+29872], 0
	je	SHORT $L70364
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	ecx, DWORD PTR [eax+29900]
	push	ecx
	push	OFFSET FLAT:$SG70365
	push	OFFSET FLAT:$SG70366
	mov	edx, DWORD PTR _cntxt$[ebp]
	push	edx
	call	_err_add_context
	add	esp, 16					; 00000010H
$L70364:
	mov	eax, DWORD PTR _cntxt$[ebp]
	xor	ecx, ecx
	cmp	DWORD PTR [eax+29872], 0
	setne	cl
	mov	eax, ecx

; 212  : }

	mov	esp, ebp
	pop	ebp
	ret	0
_ctrl_read_values ENDP
_TEXT	ENDS
PUBLIC	_ctrl_filter_tables
_DATA	SEGMENT
	ORG $+3
$SG70407 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70410 DB	'D:\Travail\ABI\EVA\V4.0\CGI\Brunix-2016\ctrl_input.c', 00H
	ORG $+3
$SG70411 DB	'ctrl_filter_tables', 00H
	ORG $+1
$SG70413 DB	'D:\Travail\ABI\EVA\V4.0\CGI\Brunix-2016\ctrl_input.c', 00H
	ORG $+3
$SG70414 DB	'ctrl_filter_tables', 00H
_DATA	ENDS
_TEXT	SEGMENT
_cntxt$ = 8
_dest$ = 12
_src$ = 16
_form$ = -8
_i$ = -12
_j$ = -16
_num$ = -20
_line$ = -4
_val$70386 = -24
_val$70395 = -28
_val$70401 = -32
_ctrl_filter_tables PROC NEAR

; 227  : ){

	push	ebp
	mov	ebp, esp
	sub	esp, 32					; 00000020H

; 228  : 	EVA_form *form = cntxt->form;

	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	ecx, DWORD PTR [eax+80]
	mov	DWORD PTR _form$[ebp], ecx

; 229  : 	unsigned long i, j, num = 0, line = 0;

	mov	DWORD PTR _num$[ebp], 0
	mov	DWORD PTR _line$[ebp], 0

; 230  : 
; 231  : 	/* Check line / number index mismatch (handle Line/Num index switching) */
; 232  : 	for(i = 0; i < src->nbrows; i++)

	mov	DWORD PTR _i$[ebp], 0
	jmp	SHORT $L70383
$L70384:
	mov	edx, DWORD PTR _i$[ebp]
	add	edx, 1
	mov	DWORD PTR _i$[ebp], edx
$L70383:
	mov	eax, DWORD PTR _src$[ebp]
	mov	ecx, DWORD PTR _i$[ebp]
	cmp	ecx, DWORD PTR [eax]
	jae	SHORT $L70385

; 234  : 		DynTableCell *val = dyntab_cell(src, i, 0);

	push	0
	mov	edx, DWORD PTR _i$[ebp]
	push	edx
	mov	eax, DWORD PTR _src$[ebp]
	push	eax
	call	_dyntab_cell
	add	esp, 12					; 0000000cH
	mov	DWORD PTR _val$70386[ebp], eax

; 235  : 		if(num < val->Num) num = val->Num;

	mov	ecx, DWORD PTR _val$70386[ebp]
	mov	edx, DWORD PTR _num$[ebp]
	cmp	edx, DWORD PTR [ecx+36]
	jae	SHORT $L70387
	mov	eax, DWORD PTR _val$70386[ebp]
	mov	ecx, DWORD PTR [eax+36]
	mov	DWORD PTR _num$[ebp], ecx
$L70387:

; 236  : 		if(line < val->Line) line = val->Line;

	mov	edx, DWORD PTR _val$70386[ebp]
	mov	eax, DWORD PTR _line$[ebp]
	cmp	eax, DWORD PTR [edx+40]
	jae	SHORT $L70388
	mov	ecx, DWORD PTR _val$70386[ebp]
	mov	edx, DWORD PTR [ecx+40]
	mov	DWORD PTR _line$[ebp], edx
$L70388:

; 237  : 	}

	jmp	SHORT $L70384
$L70385:

; 238  : 	if((form->Line && !line && num) || (form->Num && !num && line))

	mov	eax, DWORD PTR _form$[ebp]
	cmp	DWORD PTR [eax+240], 0
	je	SHORT $L70391
	cmp	DWORD PTR _line$[ebp], 0
	jne	SHORT $L70391
	cmp	DWORD PTR _num$[ebp], 0
	jne	SHORT $L70390
$L70391:
	mov	ecx, DWORD PTR _form$[ebp]
	cmp	DWORD PTR [ecx+236], 0
	je	SHORT $L70394
	cmp	DWORD PTR _num$[ebp], 0
	jne	SHORT $L70394
	cmp	DWORD PTR _line$[ebp], 0
	je	SHORT $L70394
$L70390:

; 239  : 		for(i = 0; i < src->nbrows; i++)

	mov	DWORD PTR _i$[ebp], 0
	jmp	SHORT $L70392
$L70393:
	mov	edx, DWORD PTR _i$[ebp]
	add	edx, 1
	mov	DWORD PTR _i$[ebp], edx
$L70392:
	mov	eax, DWORD PTR _src$[ebp]
	mov	ecx, DWORD PTR _i$[ebp]
	cmp	ecx, DWORD PTR [eax]
	jae	SHORT $L70394

; 241  : 			DynTableCell *val = dyntab_cell(src, i, 0);

	push	0
	mov	edx, DWORD PTR _i$[ebp]
	push	edx
	mov	eax, DWORD PTR _src$[ebp]
	push	eax
	call	_dyntab_cell
	add	esp, 12					; 0000000cH
	mov	DWORD PTR _val$70395[ebp], eax

; 242  : 			if(form->Line) { val->Line = val->Num; val->Num = 0; }

	mov	ecx, DWORD PTR _form$[ebp]
	cmp	DWORD PTR [ecx+240], 0
	je	SHORT $L70396
	mov	edx, DWORD PTR _val$70395[ebp]
	mov	eax, DWORD PTR _val$70395[ebp]
	mov	ecx, DWORD PTR [eax+36]
	mov	DWORD PTR [edx+40], ecx
	mov	edx, DWORD PTR _val$70395[ebp]
	mov	DWORD PTR [edx+36], 0

; 243  : 			else { val->Num = val->Line; val->Line = 0; }

	jmp	SHORT $L70397
$L70396:
	mov	eax, DWORD PTR _val$70395[ebp]
	mov	ecx, DWORD PTR _val$70395[ebp]
	mov	edx, DWORD PTR [ecx+40]
	mov	DWORD PTR [eax+36], edx
	mov	eax, DWORD PTR _val$70395[ebp]
	mov	DWORD PTR [eax+40], 0
$L70397:

; 244  : 		}

	jmp	SHORT $L70393
$L70394:

; 245  : 
; 246  : 	/* For each value */
; 247  : 	for(i = 0; i < src->nbrows; i++)

	mov	DWORD PTR _i$[ebp], 0
	jmp	SHORT $L70398
$L70399:
	mov	ecx, DWORD PTR _i$[ebp]
	add	ecx, 1
	mov	DWORD PTR _i$[ebp], ecx
$L70398:
	mov	edx, DWORD PTR _src$[ebp]
	mov	eax, DWORD PTR _i$[ebp]
	cmp	eax, DWORD PTR [edx]
	jae	$eva_noerr$70409

; 249  : 		DynTableCell *val = dyntab_cell(src, i, 0);

	push	0
	mov	ecx, DWORD PTR _i$[ebp]
	push	ecx
	mov	edx, DWORD PTR _src$[ebp]
	push	edx
	call	_dyntab_cell
	add	esp, 12					; 0000000cH
	mov	DWORD PTR _val$70401[ebp], eax

; 250  : 
; 251  : 		/* If value matches form Line & Num indexes : add to control values */
; 252  : 		if((!form->Line || form->Line == val->Line) && (!form->Num || form->Num == val->Num))

	mov	eax, DWORD PTR _form$[ebp]
	cmp	DWORD PTR [eax+240], 0
	je	SHORT $L70403
	mov	ecx, DWORD PTR _form$[ebp]
	mov	edx, DWORD PTR _val$70401[ebp]
	mov	eax, DWORD PTR [ecx+240]
	cmp	eax, DWORD PTR [edx+40]
	jne	$L70402
$L70403:
	mov	ecx, DWORD PTR _form$[ebp]
	cmp	DWORD PTR [ecx+236], 0
	je	SHORT $L70404
	mov	edx, DWORD PTR _form$[ebp]
	mov	eax, DWORD PTR _val$70401[ebp]
	mov	ecx, DWORD PTR [edx+236]
	cmp	ecx, DWORD PTR [eax+36]
	jne	SHORT $L70402
$L70404:

; 254  : 			j = dest->nbrows;

	mov	edx, DWORD PTR _dest$[ebp]
	mov	eax, DWORD PTR [edx]
	mov	DWORD PTR _j$[ebp], eax

; 255  : 			val->Line = form->Line;

	mov	ecx, DWORD PTR _val$70401[ebp]
	mov	edx, DWORD PTR _form$[ebp]
	mov	eax, DWORD PTR [edx+240]
	mov	DWORD PTR [ecx+40], eax

; 256  : 			DYNTAB_SET_CELLP(dest, j, 0, val);

	push	0
	mov	ecx, DWORD PTR _val$70401[ebp]
	push	ecx
	push	0
	mov	edx, DWORD PTR _j$[ebp]
	push	edx
	mov	eax, DWORD PTR _dest$[ebp]
	push	eax
	call	_dyntab_copy
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L70405
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29872], OFFSET FLAT:$SG70407
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 256		; 00000100H
	jmp	SHORT $eva_err$70408
$L70405:

; 257  : 			val = dyntab_cell(dest, j, 0);

	push	0
	mov	eax, DWORD PTR _j$[ebp]
	push	eax
	mov	ecx, DWORD PTR _dest$[ebp]
	push	ecx
	call	_dyntab_cell
	add	esp, 12					; 0000000cH
	mov	DWORD PTR _val$70401[ebp], eax

; 258  : 			val->row = i + 1;

	mov	edx, DWORD PTR _i$[ebp]
	add	edx, 1
	mov	eax, DWORD PTR _val$70401[ebp]
	mov	DWORD PTR [eax+60], edx
$L70402:

; 260  : 	}

	jmp	$L70399
$eva_noerr$70409:

; 261  : 
; 262  : 	RETURN_OK_CLEANUP;

	push	0
	push	OFFSET FLAT:$SG70410
	push	OFFSET FLAT:$SG70411
	mov	ecx, DWORD PTR _cntxt$[ebp]
	push	ecx
	call	_err_clear
	add	esp, 16					; 00000010H
$eva_err$70408:
	mov	edx, DWORD PTR _cntxt$[ebp]
	cmp	DWORD PTR [edx+29872], 0
	je	SHORT $L70412
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	ecx, DWORD PTR [eax+29900]
	push	ecx
	push	OFFSET FLAT:$SG70413
	push	OFFSET FLAT:$SG70414
	mov	edx, DWORD PTR _cntxt$[ebp]
	push	edx
	call	_err_add_context
	add	esp, 16					; 00000010H
$L70412:
	mov	eax, DWORD PTR _cntxt$[ebp]
	xor	ecx, ecx
	cmp	DWORD PTR [eax+29872], 0
	setne	cl
	mov	eax, ecx

; 263  : }

	mov	esp, ebp
	pop	ebp
	ret	0
_ctrl_filter_tables ENDP
_TEXT	ENDS
PUBLIC	_ctrl_filter_values
EXTRN	_dyntab_moveto:NEAR
_DATA	SEGMENT
	ORG $+1
$SG70433 DB	'D:\Travail\ABI\EVA\V4.0\CGI\Brunix-2016\ctrl_input.c', 00H
	ORG $+3
$SG70434 DB	'ctrl_filter_values', 00H
	ORG $+1
$SG70436 DB	'D:\Travail\ABI\EVA\V4.0\CGI\Brunix-2016\ctrl_input.c', 00H
	ORG $+3
$SG70437 DB	'ctrl_filter_values', 00H
_DATA	ENDS
_TEXT	SEGMENT
_cntxt$ = 8
_i_ctrl$ = 12
_form$ = -4
_ctrl$ = -8
_ctrl_filter_values PROC NEAR

; 279  : ){

	push	ebp
	mov	ebp, esp
	sub	esp, 8

; 280  : 	EVA_form *form = cntxt->form;

	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	ecx, DWORD PTR [eax+80]
	mov	DWORD PTR _form$[ebp], ecx

; 281  : 	EVA_ctrl *ctrl = form->ctrl + i_ctrl;

	mov	edx, DWORD PTR _i_ctrl$[ebp]
	imul	edx, 480				; 000001e0H
	mov	eax, DWORD PTR _form$[ebp]
	mov	ecx, DWORD PTR [eax]
	add	ecx, edx
	mov	DWORD PTR _ctrl$[ebp], ecx

; 282  : 
; 283  : 	/* If control is already filtered - free previous filtered values */
; 284  : 	if(ctrl->allval.nbrows || ctrl->alldbval.nbrows)

	mov	edx, DWORD PTR _ctrl$[ebp]
	cmp	DWORD PTR [edx+124], 0
	jne	SHORT $L70427
	mov	eax, DWORD PTR _ctrl$[ebp]
	cmp	DWORD PTR [eax+144], 0
	je	SHORT $L70426
$L70427:

; 286  : 		dyntab_free(&ctrl->val);

	mov	ecx, DWORD PTR _ctrl$[ebp]
	add	ecx, 64					; 00000040H
	push	ecx
	call	_dyntab_free
	add	esp, 4

; 287  : 		dyntab_free(&ctrl->dbval);

	mov	edx, DWORD PTR _ctrl$[ebp]
	add	edx, 84					; 00000054H
	push	edx
	call	_dyntab_free
	add	esp, 4

; 289  : 
; 290  : 	/* Else transfer values to ctrl->allval */
; 291  : 	else

	jmp	SHORT $L70428
$L70426:

; 293  : 		dyntab_moveto(&ctrl->allval, &ctrl->val);

	mov	eax, DWORD PTR _ctrl$[ebp]
	add	eax, 64					; 00000040H
	push	eax
	mov	ecx, DWORD PTR _ctrl$[ebp]
	add	ecx, 124				; 0000007cH
	push	ecx
	call	_dyntab_moveto
	add	esp, 8

; 294  : 		dyntab_moveto(&ctrl->alldbval, &ctrl->dbval);

	mov	edx, DWORD PTR _ctrl$[ebp]
	add	edx, 84					; 00000054H
	push	edx
	mov	eax, DWORD PTR _ctrl$[ebp]
	add	eax, 144				; 00000090H
	push	eax
	call	_dyntab_moveto
	add	esp, 8
$L70428:

; 296  : 
; 297  : 	/* Filter value to ctrl->val */
; 298  : 	if(ctrl_filter_tables(cntxt, &ctrl->val, &ctrl->allval)) STACK_ERROR;

	mov	ecx, DWORD PTR _ctrl$[ebp]
	add	ecx, 124				; 0000007cH
	push	ecx
	mov	edx, DWORD PTR _ctrl$[ebp]
	add	edx, 64					; 00000040H
	push	edx
	mov	eax, DWORD PTR _cntxt$[ebp]
	push	eax
	call	_ctrl_filter_tables
	add	esp, 12					; 0000000cH
	test	eax, eax
	je	SHORT $L70429
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 298		; 0000012aH
	jmp	SHORT $eva_err$70430
$L70429:

; 299  : 	if(ctrl_filter_tables(cntxt, &ctrl->dbval, &ctrl->alldbval)) STACK_ERROR;

	mov	edx, DWORD PTR _ctrl$[ebp]
	add	edx, 144				; 00000090H
	push	edx
	mov	eax, DWORD PTR _ctrl$[ebp]
	add	eax, 84					; 00000054H
	push	eax
	mov	ecx, DWORD PTR _cntxt$[ebp]
	push	ecx
	call	_ctrl_filter_tables
	add	esp, 12					; 0000000cH
	test	eax, eax
	je	SHORT $eva_noerr$70432
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 299		; 0000012bH
	jmp	SHORT $eva_err$70430
$eva_noerr$70432:

; 300  : 
; 301  : 	RETURN_OK_CLEANUP;

	push	0
	push	OFFSET FLAT:$SG70433
	push	OFFSET FLAT:$SG70434
	mov	eax, DWORD PTR _cntxt$[ebp]
	push	eax
	call	_err_clear
	add	esp, 16					; 00000010H
$eva_err$70430:
	mov	ecx, DWORD PTR _cntxt$[ebp]
	cmp	DWORD PTR [ecx+29872], 0
	je	SHORT $L70435
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	eax, DWORD PTR [edx+29900]
	push	eax
	push	OFFSET FLAT:$SG70436
	push	OFFSET FLAT:$SG70437
	mov	ecx, DWORD PTR _cntxt$[ebp]
	push	ecx
	call	_err_add_context
	add	esp, 16					; 00000010H
$L70435:
	mov	edx, DWORD PTR _cntxt$[ebp]
	xor	eax, eax
	cmp	DWORD PTR [edx+29872], 0
	setne	al

; 302  : }

	mov	esp, ebp
	pop	ebp
	ret	0
_ctrl_filter_values ENDP
_TEXT	ENDS
PUBLIC	_ctrl_add_input
PUBLIC	_ctrl_filter_check_values
_DATA	SEGMENT
	ORG $+1
$SG70454 DB	'D:\Travail\ABI\EVA\V4.0\CGI\Brunix-2016\ctrl_input.c', 00H
	ORG $+3
$SG70455 DB	'ctrl_filter_check_values', 00H
	ORG $+3
$SG70457 DB	'D:\Travail\ABI\EVA\V4.0\CGI\Brunix-2016\ctrl_input.c', 00H
	ORG $+3
$SG70458 DB	'ctrl_filter_check_values', 00H
_DATA	ENDS
_TEXT	SEGMENT
_cntxt$ = 8
_i_ctrl$ = 12
_form$ = -4
_step$ = -12
_b_noctrltree$ = -8
_ctrl_filter_check_values PROC NEAR

; 315  : ){

	push	ebp
	mov	ebp, esp
	sub	esp, 12					; 0000000cH

; 316  : 	EVA_form *form = cntxt->form;

	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	ecx, DWORD PTR [eax+80]
	mov	DWORD PTR _form$[ebp], ecx

; 317  : 	int step = form->step, b_noctrltree = form->b_noctrltree;

	mov	edx, DWORD PTR _form$[ebp]
	mov	eax, DWORD PTR [edx+176]
	mov	DWORD PTR _step$[ebp], eax
	mov	ecx, DWORD PTR _form$[ebp]
	mov	edx, DWORD PTR [ecx+200]
	mov	DWORD PTR _b_noctrltree$[ebp], edx

; 318  : 
; 319  : 	/* Return if no filter active */
; 320  : 	if(!form->Line && !form->Num) RETURN_OK;

	mov	eax, DWORD PTR _form$[ebp]
	cmp	DWORD PTR [eax+240], 0
	jne	SHORT $L70450
	mov	ecx, DWORD PTR _form$[ebp]
	cmp	DWORD PTR [ecx+236], 0
	jne	SHORT $L70450
	jmp	SHORT $eva_noerr$70451
$L70450:

; 321  : 
; 322  : 	/* Call control handler for InputCheck */
; 323  : 	form->step = InputCheck;

	mov	edx, DWORD PTR _form$[ebp]
	mov	DWORD PTR [edx+176], 2

; 324  : 	form->b_noctrltree = 1;

	mov	eax, DWORD PTR _form$[ebp]
	mov	DWORD PTR [eax+200], 1

; 325  : 	if(ctrl_add_input(cntxt, i_ctrl)) STACK_ERROR;

	mov	ecx, DWORD PTR _i_ctrl$[ebp]
	push	ecx
	mov	edx, DWORD PTR _cntxt$[ebp]
	push	edx
	call	_ctrl_add_input
	add	esp, 8
	test	eax, eax
	je	SHORT $L70452
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 325		; 00000145H
	jmp	SHORT $eva_err$70453
$L70452:

; 326  : 	form->step = step;

	mov	ecx, DWORD PTR _form$[ebp]
	mov	edx, DWORD PTR _step$[ebp]
	mov	DWORD PTR [ecx+176], edx

; 327  : 	form->b_noctrltree = b_noctrltree;

	mov	eax, DWORD PTR _form$[ebp]
	mov	ecx, DWORD PTR _b_noctrltree$[ebp]
	mov	DWORD PTR [eax+200], ecx
$eva_noerr$70451:

; 328  : 
; 329  : 	RETURN_OK_CLEANUP;

	push	0
	push	OFFSET FLAT:$SG70454
	push	OFFSET FLAT:$SG70455
	mov	edx, DWORD PTR _cntxt$[ebp]
	push	edx
	call	_err_clear
	add	esp, 16					; 00000010H
$eva_err$70453:
	mov	eax, DWORD PTR _cntxt$[ebp]
	cmp	DWORD PTR [eax+29872], 0
	je	SHORT $L70456
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	edx, DWORD PTR [ecx+29900]
	push	edx
	push	OFFSET FLAT:$SG70457
	push	OFFSET FLAT:$SG70458
	mov	eax, DWORD PTR _cntxt$[ebp]
	push	eax
	call	_err_add_context
	add	esp, 16					; 00000010H
$L70456:
	mov	ecx, DWORD PTR _cntxt$[ebp]
	xor	eax, eax
	cmp	DWORD PTR [ecx+29872], 0
	setne	al

; 330  : }

	mov	esp, ebp
	pop	ebp
	ret	0
_ctrl_filter_check_values ENDP
_TEXT	ENDS
PUBLIC	_ctrl_dontkeep_cgi_input
_TEXT	SEGMENT
_cntxt$ = 8
_i_ctrl$ = 12
_form$ = -4
_ctrl$ = -12
_i$ = -8
_val$70473 = -16
_ctrl_dontkeep_cgi_input PROC NEAR

; 341  : ){

	push	ebp
	mov	ebp, esp
	sub	esp, 16					; 00000010H

; 342  : 	EVA_form *form = cntxt->form;

	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	ecx, DWORD PTR [eax+80]
	mov	DWORD PTR _form$[ebp], ecx

; 343  : 	EVA_ctrl *ctrl = form->ctrl + i_ctrl;

	mov	edx, DWORD PTR _i_ctrl$[ebp]
	imul	edx, 480				; 000001e0H
	mov	eax, DWORD PTR _form$[ebp]
	mov	ecx, DWORD PTR [eax]
	add	ecx, edx
	mov	DWORD PTR _ctrl$[ebp], ecx

; 344  : 	unsigned long i;
; 345  : 	if(form->html) for(i = 0; i < ctrl->cgival.nbrows; i++)

	mov	edx, DWORD PTR _form$[ebp]
	cmp	DWORD PTR [edx+232], 0
	je	$L70472
	mov	DWORD PTR _i$[ebp], 0
	jmp	SHORT $L70470
$L70471:
	mov	eax, DWORD PTR _i$[ebp]
	add	eax, 1
	mov	DWORD PTR _i$[ebp], eax
$L70470:
	mov	ecx, DWORD PTR _ctrl$[ebp]
	mov	edx, DWORD PTR _i$[ebp]
	cmp	edx, DWORD PTR [ecx+104]
	jae	SHORT $L70472

; 347  : 		DynTableCell *val = dyntab_cell(&ctrl->cgival, i, 0);

	push	0
	mov	eax, DWORD PTR _i$[ebp]
	push	eax
	mov	ecx, DWORD PTR _ctrl$[ebp]
	add	ecx, 104				; 00000068H
	push	ecx
	call	_dyntab_cell
	add	esp, 12					; 0000000cH
	mov	DWORD PTR _val$70473[ebp], eax

; 348  : 		if((!form->Num || val->Num == form->Num) && (!form->Line || !val->Line || val->Line == form->Line))

	mov	edx, DWORD PTR _form$[ebp]
	cmp	DWORD PTR [edx+236], 0
	je	SHORT $L70475
	mov	eax, DWORD PTR _val$70473[ebp]
	mov	ecx, DWORD PTR _form$[ebp]
	mov	edx, DWORD PTR [eax+36]
	cmp	edx, DWORD PTR [ecx+236]
	jne	SHORT $L70474
$L70475:
	mov	eax, DWORD PTR _form$[ebp]
	cmp	DWORD PTR [eax+240], 0
	je	SHORT $L70476
	mov	ecx, DWORD PTR _val$70473[ebp]
	cmp	DWORD PTR [ecx+40], 0
	je	SHORT $L70476
	mov	edx, DWORD PTR _val$70473[ebp]
	mov	eax, DWORD PTR _form$[ebp]
	mov	ecx, DWORD PTR [edx+40]
	cmp	ecx, DWORD PTR [eax+240]
	jne	SHORT $L70474
$L70476:

; 349  : 			cgi_value_setkeep(cntxt, &ctrl->cgival, i, 1);

	push	1
	mov	edx, DWORD PTR _i$[ebp]
	push	edx
	mov	eax, DWORD PTR _ctrl$[ebp]
	add	eax, 104				; 00000068H
	push	eax
	mov	ecx, DWORD PTR _cntxt$[ebp]
	push	ecx
	call	_cgi_value_setkeep
	add	esp, 16					; 00000010H
$L70474:

; 350  : 	}

	jmp	$L70471
$L70472:

; 351  : }

	mov	esp, ebp
	pop	ebp
	ret	0
_ctrl_dontkeep_cgi_input ENDP
_TEXT	ENDS
PUBLIC	_ctrl_renumber_values
EXTRN	_qsort_ctrlval:NEAR
EXTRN	_dyntab_sort:NEAR
_BSS	SEGMENT
	ALIGN	4

$SG70507 DB	01H DUP (?)
	ALIGN	4

$SG70508 DB	01H DUP (?)
_BSS	ENDS
_DATA	SEGMENT
	ORG $+3
$SG70493 DB	'_EVA_MULTIPLE_AUTO_ORDER', 00H
	ORG $+3
$SG70497 DB	'Yes', 00H
_DATA	ENDS
_TEXT	SEGMENT
_cntxt$ = 8
_i_ctrl$ = 12
_form$ = -12
_ctrl$ = -36
_i$ = -28
_line$ = -8
_maxnum$ = -20
_maxline$ = -32
_ctlval$ = -16
_val$ = -4
_b_keepold$ = -24
_v1$70504 = -40
_v2$70505 = -44
_ctrl_renumber_values PROC NEAR

; 362  : ){

	push	ebp
	mov	ebp, esp
	sub	esp, 68					; 00000044H

; 363  : 	EVA_form *form = cntxt->form;

	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	ecx, DWORD PTR [eax+80]
	mov	DWORD PTR _form$[ebp], ecx

; 364  : 	EVA_ctrl *ctrl = form->ctrl + i_ctrl;

	mov	edx, DWORD PTR _i_ctrl$[ebp]
	imul	edx, 480				; 000001e0H
	mov	eax, DWORD PTR _form$[ebp]
	mov	ecx, DWORD PTR [eax]
	add	ecx, edx
	mov	DWORD PTR _ctrl$[ebp], ecx

; 365  : 	unsigned long i, line, maxnum, maxline = 0;

	mov	DWORD PTR _maxline$[ebp], 0

; 366  : 	DynTable *ctlval = (ctrl->allval.nbrows || ctrl->alldbval.nbrows) ? &ctrl->allval : & ctrl->val;

	mov	edx, DWORD PTR _ctrl$[ebp]
	cmp	DWORD PTR [edx+124], 0
	jne	SHORT $L70763
	mov	eax, DWORD PTR _ctrl$[ebp]
	cmp	DWORD PTR [eax+144], 0
	jne	SHORT $L70763
	mov	ecx, DWORD PTR _ctrl$[ebp]
	add	ecx, 64					; 00000040H
	mov	DWORD PTR -48+[ebp], ecx
	jmp	SHORT $L70764
$L70763:
	mov	edx, DWORD PTR _ctrl$[ebp]
	add	edx, 124				; 0000007cH
	mov	DWORD PTR -48+[ebp], edx
$L70764:
	mov	eax, DWORD PTR -48+[ebp]
	mov	DWORD PTR _ctlval$[ebp], eax

; 367  : 	DynTableCell *val;
; 368  : 	int b_keepold = form->step == CtrlRead || CTRL_ATTR_CELL(MULTIPLE_AUTO_ORDER) || form->Num;

	mov	ecx, DWORD PTR _form$[ebp]
	cmp	DWORD PTR [ecx+176], 0
	je	SHORT $L70767
	cmp	DWORD PTR _ctrl$[ebp], 0
	je	SHORT $L70765
	push	0
	push	-1
	push	OFFSET FLAT:$SG70493
	mov	edx, DWORD PTR _ctrl$[ebp]
	add	edx, 44					; 0000002cH
	push	edx
	call	_dyntab_field_cell
	add	esp, 16					; 00000010H
	mov	DWORD PTR -52+[ebp], eax
	jmp	SHORT $L70766
$L70765:
	mov	DWORD PTR -52+[ebp], 0
$L70766:
	cmp	DWORD PTR -52+[ebp], 0
	jne	SHORT $L70767
	mov	eax, DWORD PTR _form$[ebp]
	cmp	DWORD PTR [eax+236], 0
	jne	SHORT $L70767
	mov	DWORD PTR -56+[ebp], 0
	jmp	SHORT $L70768
$L70767:
	mov	DWORD PTR -56+[ebp], 1
$L70768:
	mov	ecx, DWORD PTR -56+[ebp]
	mov	DWORD PTR _b_keepold$[ebp], ecx

; 369  : 
; 370  : 	if(!ctrl || !ctlval->nbrows) return;

	cmp	DWORD PTR _ctrl$[ebp], 0
	je	SHORT $L70495
	mov	edx, DWORD PTR _ctlval$[ebp]
	cmp	DWORD PTR [edx], 0
	jne	SHORT $L70494
$L70495:
	jmp	$L70482
$L70494:

; 371  : 
; 372  : 	/* Handle duplicate values if applicable */
; 373  : 	if(strcmp(ctrl->MULTIPLE, "Yes"))

	push	OFFSET FLAT:$SG70497
	mov	eax, DWORD PTR _ctrl$[ebp]
	mov	ecx, DWORD PTR [eax+344]
	push	ecx
	call	_strcmp
	add	esp, 8
	test	eax, eax
	je	$L70500

; 374  : 		for(i = 0; i < ctlval->nbrows; i++)

	mov	DWORD PTR _i$[ebp], 0
	jmp	SHORT $L70498
$L70499:
	mov	edx, DWORD PTR _i$[ebp]
	add	edx, 1
	mov	DWORD PTR _i$[ebp], edx
$L70498:
	mov	eax, DWORD PTR _ctlval$[ebp]
	mov	ecx, DWORD PTR _i$[ebp]
	cmp	ecx, DWORD PTR [eax]
	jae	$L70500

; 375  : 			for(line = i + 1; line < ctlval->nbrows; line ++)

	mov	edx, DWORD PTR _i$[ebp]
	add	edx, 1
	mov	DWORD PTR _line$[ebp], edx
	jmp	SHORT $L70501
$L70502:
	mov	eax, DWORD PTR _line$[ebp]
	add	eax, 1
	mov	DWORD PTR _line$[ebp], eax
$L70501:
	mov	ecx, DWORD PTR _ctlval$[ebp]
	mov	edx, DWORD PTR _line$[ebp]
	cmp	edx, DWORD PTR [ecx]
	jae	$L70503

; 377  : 				DynTableCell *v1 = dyntab_cell(ctlval, i, 0);

	push	0
	mov	eax, DWORD PTR _i$[ebp]
	push	eax
	mov	ecx, DWORD PTR _ctlval$[ebp]
	push	ecx
	call	_dyntab_cell
	add	esp, 12					; 0000000cH
	mov	DWORD PTR _v1$70504[ebp], eax

; 378  : 				DynTableCell *v2 = dyntab_cell(ctlval, line, 0);

	push	0
	mov	edx, DWORD PTR _line$[ebp]
	push	edx
	mov	eax, DWORD PTR _ctlval$[ebp]
	push	eax
	call	_dyntab_cell
	add	esp, 12					; 0000000cH
	mov	DWORD PTR _v2$70505[ebp], eax

; 379  : 				if(v1->Line == v2->Line && !STRCMPNUL(v1->txt, v2->txt))

	mov	ecx, DWORD PTR _v1$70504[ebp]
	mov	edx, DWORD PTR _v2$70505[ebp]
	mov	eax, DWORD PTR [ecx+40]
	cmp	eax, DWORD PTR [edx+40]
	jne	SHORT $L70506
	mov	ecx, DWORD PTR _v2$70505[ebp]
	cmp	DWORD PTR [ecx], 0
	je	SHORT $L70769
	mov	edx, DWORD PTR _v2$70505[ebp]
	mov	eax, DWORD PTR [edx]
	mov	DWORD PTR -60+[ebp], eax
	jmp	SHORT $L70770
$L70769:
	mov	DWORD PTR -60+[ebp], OFFSET FLAT:$SG70507
$L70770:
	mov	ecx, DWORD PTR _v1$70504[ebp]
	cmp	DWORD PTR [ecx], 0
	je	SHORT $L70771
	mov	edx, DWORD PTR _v1$70504[ebp]
	mov	eax, DWORD PTR [edx]
	mov	DWORD PTR -64+[ebp], eax
	jmp	SHORT $L70772
$L70771:
	mov	DWORD PTR -64+[ebp], OFFSET FLAT:$SG70508
$L70772:
	mov	ecx, DWORD PTR -60+[ebp]
	push	ecx
	mov	edx, DWORD PTR -64+[ebp]
	push	edx
	call	_strcmp
	add	esp, 8
	test	eax, eax
	jne	SHORT $L70506

; 380  : 					dyntab_del_rows(ctlval, line--, 1);

	push	1
	mov	eax, DWORD PTR _line$[ebp]
	mov	DWORD PTR -68+[ebp], eax
	mov	ecx, DWORD PTR -68+[ebp]
	push	ecx
	mov	edx, DWORD PTR _ctlval$[ebp]
	push	edx
	mov	eax, DWORD PTR _line$[ebp]
	sub	eax, 1
	mov	DWORD PTR _line$[ebp], eax
	call	_dyntab_del_rows
	add	esp, 12					; 0000000cH
$L70506:

; 381  : 			}

	jmp	$L70502
$L70503:
	jmp	$L70499
$L70500:

; 382  : 
; 383  : 	/* Look for maximum line number */
; 384  : 	for(i = 0; i < ctlval->nbrows; i++)

	mov	DWORD PTR _i$[ebp], 0
	jmp	SHORT $L70509
$L70510:
	mov	ecx, DWORD PTR _i$[ebp]
	add	ecx, 1
	mov	DWORD PTR _i$[ebp], ecx
$L70509:
	mov	edx, DWORD PTR _ctlval$[ebp]
	mov	eax, DWORD PTR _i$[ebp]
	cmp	eax, DWORD PTR [edx]
	jae	SHORT $L70511

; 386  : 		val = dyntab_cell(ctlval, i, 0);

	push	0
	mov	ecx, DWORD PTR _i$[ebp]
	push	ecx
	mov	edx, DWORD PTR _ctlval$[ebp]
	push	edx
	call	_dyntab_cell
	add	esp, 12					; 0000000cH
	mov	DWORD PTR _val$[ebp], eax

; 387  : 		if(val->Line > maxline) maxline = val->Line;

	mov	eax, DWORD PTR _val$[ebp]
	mov	ecx, DWORD PTR [eax+40]
	cmp	ecx, DWORD PTR _maxline$[ebp]
	jbe	SHORT $L70512
	mov	edx, DWORD PTR _val$[ebp]
	mov	eax, DWORD PTR [edx+40]
	mov	DWORD PTR _maxline$[ebp], eax
$L70512:

; 388  : 	}

	jmp	SHORT $L70510
$L70511:

; 389  : 
; 390  : 	/* Process each line */
; 391  : 	for(line = 0; line <= maxline; line ++)

	mov	DWORD PTR _line$[ebp], 0
	jmp	SHORT $L70513
$L70514:
	mov	ecx, DWORD PTR _line$[ebp]
	add	ecx, 1
	mov	DWORD PTR _line$[ebp], ecx
$L70513:
	mov	edx, DWORD PTR _line$[ebp]
	cmp	edx, DWORD PTR _maxline$[ebp]
	ja	$L70515

; 393  : 		/* Look for maximum index numbers */
; 394  : 		maxnum = 0;

	mov	DWORD PTR _maxnum$[ebp], 0

; 395  : 		if(b_keepold) for(i = 0; i < ctlval->nbrows; i++)

	cmp	DWORD PTR _b_keepold$[ebp], 0
	je	SHORT $L70519
	mov	DWORD PTR _i$[ebp], 0
	jmp	SHORT $L70517
$L70518:
	mov	eax, DWORD PTR _i$[ebp]
	add	eax, 1
	mov	DWORD PTR _i$[ebp], eax
$L70517:
	mov	ecx, DWORD PTR _ctlval$[ebp]
	mov	edx, DWORD PTR _i$[ebp]
	cmp	edx, DWORD PTR [ecx]
	jae	SHORT $L70519

; 397  : 			val = dyntab_cell(ctlval, i, 0);

	push	0
	mov	eax, DWORD PTR _i$[ebp]
	push	eax
	mov	ecx, DWORD PTR _ctlval$[ebp]
	push	ecx
	call	_dyntab_cell
	add	esp, 12					; 0000000cH
	mov	DWORD PTR _val$[ebp], eax

; 398  : 			if(val->Line != line) continue;

	mov	edx, DWORD PTR _val$[ebp]
	mov	eax, DWORD PTR [edx+40]
	cmp	eax, DWORD PTR _line$[ebp]
	je	SHORT $L70520
	jmp	SHORT $L70518
$L70520:

; 399  : 			if(val->Num > maxnum) maxnum = val->Num;

	mov	ecx, DWORD PTR _val$[ebp]
	mov	edx, DWORD PTR [ecx+36]
	cmp	edx, DWORD PTR _maxnum$[ebp]
	jbe	SHORT $L70521
	mov	eax, DWORD PTR _val$[ebp]
	mov	ecx, DWORD PTR [eax+36]
	mov	DWORD PTR _maxnum$[ebp], ecx
$L70521:

; 400  : 		}

	jmp	SHORT $L70518
$L70519:

; 401  : 
; 402  : 		/* Renumber values */
; 403  : 		for(i = 0; i < ctlval->nbrows; i ++)

	mov	DWORD PTR _i$[ebp], 0
	jmp	SHORT $L70522
$L70523:
	mov	edx, DWORD PTR _i$[ebp]
	add	edx, 1
	mov	DWORD PTR _i$[ebp], edx
$L70522:
	mov	eax, DWORD PTR _ctlval$[ebp]
	mov	ecx, DWORD PTR _i$[ebp]
	cmp	ecx, DWORD PTR [eax]
	jae	SHORT $L70524

; 405  : 			val = dyntab_cell(ctlval, i, 0);

	push	0
	mov	edx, DWORD PTR _i$[ebp]
	push	edx
	mov	eax, DWORD PTR _ctlval$[ebp]
	push	eax
	call	_dyntab_cell
	add	esp, 12					; 0000000cH
	mov	DWORD PTR _val$[ebp], eax

; 406  : 			if(val->Line != line) continue;

	mov	ecx, DWORD PTR _val$[ebp]
	mov	edx, DWORD PTR [ecx+40]
	cmp	edx, DWORD PTR _line$[ebp]
	je	SHORT $L70525
	jmp	SHORT $L70523
$L70525:

; 407  : 			if(!b_keepold || !val->Num)

	cmp	DWORD PTR _b_keepold$[ebp], 0
	je	SHORT $L70527
	mov	eax, DWORD PTR _val$[ebp]
	cmp	DWORD PTR [eax+36], 0
	jne	SHORT $L70526
$L70527:

; 409  : 				maxnum++;

	mov	ecx, DWORD PTR _maxnum$[ebp]
	add	ecx, 1
	mov	DWORD PTR _maxnum$[ebp], ecx

; 410  : 				val->Num = maxnum;

	mov	edx, DWORD PTR _val$[ebp]
	mov	eax, DWORD PTR _maxnum$[ebp]
	mov	DWORD PTR [edx+36], eax
$L70526:

; 412  : 		}

	jmp	SHORT $L70523
$L70524:

; 413  : 	}

	jmp	$L70514
$L70515:

; 414  : 
; 415  : 	/* Sort values on Line / Num */
; 416  : 	dyntab_sort(ctlval, qsort_ctrlval);

	push	OFFSET FLAT:_qsort_ctrlval
	mov	ecx, DWORD PTR _ctlval$[ebp]
	push	ecx
	call	_dyntab_sort
	add	esp, 8
$L70482:

; 417  : 
; 418  : 	return;
; 419  : }

	mov	esp, ebp
	pop	ebp
	ret	0
_ctrl_renumber_values ENDP
_TEXT	ENDS
EXTRN	_sprintf:NEAR
EXTRN	_cgi_add_input:NEAR
EXTRN	_sql_exec_query:NEAR
EXTRN	_mem_free:NEAR
EXTRN	_plain_to_html:BYTE
EXTRN	_dynbuf_add:NEAR
EXTRN	_ctrl_cgi_name:NEAR
EXTRN	_qry_add_new_obj:NEAR
EXTRN	_dynbuf_add3:NEAR
EXTRN	_qry_add_val:NEAR
EXTRN	_ctrl_set_common_attr:NEAR
EXTRN	_ctrl_check_error_status:NEAR
EXTRN	_ctrl_put_label:NEAR
EXTRN	_strlen:NEAR
_BSS	SEGMENT
	ALIGN	4

$SG70555 DB	01H DUP (?)
	ALIGN	4

$SG70580 DB	01H DUP (?)
	ALIGN	4

$SG70581 DB	01H DUP (?)
	ALIGN	4

$SG70582 DB	01H DUP (?)
	ALIGN	4

$SG70583 DB	01H DUP (?)
	ALIGN	4

$SG70589 DB	01H DUP (?)
	ALIGN	4

$SG70590 DB	01H DUP (?)
	ALIGN	4

$SG70591 DB	01H DUP (?)
	ALIGN	4

$SG70593 DB	01H DUP (?)
	ALIGN	4

$SG70594 DB	01H DUP (?)
_BSS	ENDS
_DATA	SEGMENT
$SG70554 DB	'_EVA_STORAGE', 00H
	ORG $+3
$SG70556 DB	'_EVA_NONE', 00H
	ORG $+2
$SG70557 DB	'_EVA_USER_PARAM', 00H
$SG70579 DB	'_EVA_SameCell', 00H
	ORG $+2
$SG70587 DB	'Arial', 00H
	ORG $+2
$SG70588 DB	'_EVA_SameCell', 00H
	ORG $+2
$SG70592 DB	'_EVA_ALWAYS', 00H
$SG70597 DB	'''>', 00H
	ORG $+1
$SG70598 DB	'<td colspan=2><hr></td></tr><tr><td align=right valign=t'
	DB	'op><font face=''', 00H
$SG70600 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70602 DB	'_EVA_SameCell', 00H
	ORG $+2
$SG70607 DB	'<br><font size=-1>', 00H
	ORG $+1
$SG70609 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70613 DB	'Champ modifi', 0e9H, 00H
	ORG $+2
$SG70615 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70620 DB	' Vous n''avec pas acc', 0e8H, 's ', 0e0H, ' ce champ en '
	DB	'modification', 00H
	ORG $+2
$SG70622 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70627 DB	'<br>', 00H
	ORG $+3
$SG70629 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70632 DB	'</font></b>', 00H
$SG70633 DB	'<font color=#FF0000><b>', 00H
$SG70635 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70638 DB	'</font>', 0aH, 00H
	ORG $+3
$SG70640 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70643 DB	'''>', 00H
	ORG $+1
$SG70644 DB	'</td><td valign=top><font face=''', 00H
	ORG $+3
$SG70646 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70664 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70666 DB	'_EVA_FILEUPLOAD', 00H
$SG70667 DB	'_EVA_NONE', 00H
	ORG $+2
$SG70672 DB	'</font>', 00H
$SG70673 DB	0aH, '<br><font size=-1>', 00H
$SG70675 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70678 DB	'</td>', 0aH, '</tr><tr>', 0aH, 00H
	ORG $+3
$SG70680 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70692 DB	'UPDATE TLink SET DateDel=''%s'', IdWhoDel=%s WHERE Pkey='
	DB	'%lu', 00H
	ORG $+2
$SG70695 DB	'_EVA_FIELD', 00H
	ORG $+1
$SG70719 DB	'D:\Travail\ABI\EVA\V4.0\CGI\Brunix-2016\ctrl_input.c', 00H
	ORG $+3
$SG70720 DB	'ctrl_add_input', 00H
	ORG $+1
$SG70722 DB	'D:\Travail\ABI\EVA\V4.0\CGI\Brunix-2016\ctrl_input.c', 00H
	ORG $+3
$SG70723 DB	'ctrl_add_input', 00H
_DATA	ENDS
_TEXT	SEGMENT
_i_cgi$70658 = -52
_sql$70690 = -564
_cntxt$ = 8
_i_ctrl$ = 12
_form$ = -8
_ctrl$ = -40
_htmlbuf$ = -24
_name$ = -28
_html$ = -16
_field$ = -12
_val$ = -4
_i$ = -20
_step$ = -36
_error$ = -32
_storage$70553 = -44
_dbval$70648 = -48
_ctrl_add_input PROC NEAR

; 432  : ){

	push	ebp
	mov	ebp, esp
	sub	esp, 600				; 00000258H

; 433  : 	EVA_form *form = cntxt->form;

	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	ecx, DWORD PTR [eax+80]
	mov	DWORD PTR _form$[ebp], ecx

; 434  : 	EVA_ctrl *ctrl = form->ctrl + i_ctrl;

	mov	edx, DWORD PTR _i_ctrl$[ebp]
	imul	edx, 480				; 000001e0H
	mov	eax, DWORD PTR _form$[ebp]
	mov	ecx, DWORD PTR [eax]
	add	ecx, edx
	mov	DWORD PTR _ctrl$[ebp], ecx

; 435  : 	DynBuffer *htmlbuf = NULL;

	mov	DWORD PTR _htmlbuf$[ebp], 0

; 436  : 	DynBuffer *name = NULL;

	mov	DWORD PTR _name$[ebp], 0

; 437  : 	DynBuffer **html = form->html;

	mov	edx, DWORD PTR _form$[ebp]
	mov	eax, DWORD PTR [edx+232]
	mov	DWORD PTR _html$[ebp], eax

; 438  : 	DynTableCell *field, *val;
; 439  : 	unsigned long i;
; 440  : 	int step = form->step, error = 0;

	mov	ecx, DWORD PTR _form$[ebp]
	mov	edx, DWORD PTR [ecx+176]
	mov	DWORD PTR _step$[ebp], edx
	mov	DWORD PTR _error$[ebp], 0

; 441  : 
; 442  : 	/* Unsaved controls are always in edit mode if allowed */
; 443  : 	if(step == HtmlView && !ctrl->storage && ctrl->access & AccessEdit) form->step = HtmlEdit;

	cmp	DWORD PTR _step$[ebp], 6
	jne	SHORT $L70547
	mov	eax, DWORD PTR _ctrl$[ebp]
	cmp	DWORD PTR [eax+36], 0
	jne	SHORT $L70547
	mov	ecx, DWORD PTR _ctrl$[ebp]
	mov	edx, DWORD PTR [ecx+184]
	and	edx, 2
	test	edx, edx
	je	SHORT $L70547
	mov	eax, DWORD PTR _form$[ebp]
	mov	DWORD PTR [eax+176], 4
$L70547:

; 444  : 
; 445  : 	switch(form->step)
; 446  : 	{

	mov	ecx, DWORD PTR _form$[ebp]
	mov	edx, DWORD PTR [ecx+176]
	mov	DWORD PTR -568+[ebp], edx
	cmp	DWORD PTR -568+[ebp], 7
	ja	$L70716
	mov	eax, DWORD PTR -568+[ebp]
	jmp	DWORD PTR $L70791[eax*4]
$L70552:

; 447  : 	case CtrlRead:
; 448  : 		/* Set CGI base name */
; 449  : 		ctrl->cginame->data[0] = 'D';

	mov	ecx, DWORD PTR _ctrl$[ebp]
	mov	edx, DWORD PTR [ecx+40]
	mov	BYTE PTR [edx+8], 68			; 00000044H

; 451  : 			char *storage = CTRL_ATTR_VAL(STORAGE);

	cmp	DWORD PTR _ctrl$[ebp], 0
	je	SHORT $L70774
	push	0
	push	-1
	push	OFFSET FLAT:$SG70554
	mov	eax, DWORD PTR _ctrl$[ebp]
	add	eax, 44					; 0000002cH
	push	eax
	call	_dyntab_field_val
	add	esp, 16					; 00000010H
	mov	DWORD PTR -572+[ebp], eax
	jmp	SHORT $L70775
$L70774:
	mov	DWORD PTR -572+[ebp], OFFSET FLAT:$SG70555
$L70775:
	mov	ecx, DWORD PTR -572+[ebp]
	mov	DWORD PTR _storage$70553[ebp], ecx

; 452  : 			ctrl->storage = !strcmp("_EVA_NONE", storage) ? 0 :
; 453  : 							!strcmp("_EVA_USER_PARAM", storage) ? 0 : 1;

	mov	edx, DWORD PTR _storage$70553[ebp]
	push	edx
	push	OFFSET FLAT:$SG70556
	call	_strcmp
	add	esp, 8
	test	eax, eax
	jne	SHORT $L70776
	mov	DWORD PTR -576+[ebp], 0
	jmp	SHORT $L70777
$L70776:
	mov	eax, DWORD PTR _storage$70553[ebp]
	push	eax
	push	OFFSET FLAT:$SG70557
	call	_strcmp
	add	esp, 8
	neg	eax
	sbb	eax, eax
	neg	eax
	mov	DWORD PTR -576+[ebp], eax
$L70777:
	mov	ecx, DWORD PTR _ctrl$[ebp]
	mov	edx, DWORD PTR -576+[ebp]
	mov	DWORD PTR [ecx+36], edx

; 455  : 
; 456  : 		/* Read control values & renumber */
; 457  : 		if(ctrl_read_values(cntxt, i_ctrl)) STACK_ERROR;

	mov	eax, DWORD PTR _i_ctrl$[ebp]
	push	eax
	mov	ecx, DWORD PTR _cntxt$[ebp]
	push	ecx
	call	_ctrl_read_values
	add	esp, 8
	test	eax, eax
	je	SHORT $L70558
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 457		; 000001c9H
	jmp	$eva_err$70559
$L70558:

; 458  : 		ctrl_renumber_values(cntxt, i_ctrl);

	mov	eax, DWORD PTR _i_ctrl$[ebp]
	push	eax
	mov	ecx, DWORD PTR _cntxt$[ebp]
	push	ecx
	call	_ctrl_renumber_values
	add	esp, 8

; 459  : 		break;

	jmp	$eva_noerr$70718
$L70560:

; 460  : 
; 461  : 	case InputCheck:
; 462  : 		/* Renumber values / handle duplicates */
; 463  : 		ctrl_renumber_values(cntxt, i_ctrl);

	mov	edx, DWORD PTR _i_ctrl$[ebp]
	push	edx
	mov	eax, DWORD PTR _cntxt$[ebp]
	push	eax
	call	_ctrl_renumber_values
	add	esp, 8

; 464  : 
; 465  : 		/* Filter control values for current line & num index */
; 466  : 		if(ctrl_filter_values(cntxt, i_ctrl)) STACK_ERROR;

	mov	ecx, DWORD PTR _i_ctrl$[ebp]
	push	ecx
	mov	edx, DWORD PTR _cntxt$[ebp]
	push	edx
	call	_ctrl_filter_values
	add	esp, 8
	test	eax, eax
	je	SHORT $L70561
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 466		; 000001d2H
	jmp	$eva_err$70559
$L70561:

; 467  : 
; 468  : 		/* Call control secondary handler */
; 469  : 		ctrl->error = 0;

	mov	ecx, DWORD PTR _ctrl$[ebp]
	mov	DWORD PTR [ecx+212], 0

; 470  : 		M_FREE(ctrl->errmsg);

	mov	edx, DWORD PTR _ctrl$[ebp]
	mov	eax, DWORD PTR [edx+216]
	push	eax
	call	_mem_free
	add	esp, 4
	mov	ecx, DWORD PTR _ctrl$[ebp]
	mov	DWORD PTR [ecx+216], 0

; 471  : 		CTRL_SEC_HDLR(i_ctrl);

	cmp	DWORD PTR _i_ctrl$[ebp], 0
	je	SHORT $L70562
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	eax, DWORD PTR [edx+80]
	mov	ecx, DWORD PTR _i_ctrl$[ebp]
	imul	ecx, 480				; 000001e0H
	mov	edx, DWORD PTR [eax]
	mov	eax, DWORD PTR [edx+ecx+32]
	shl	eax, 4
	cmp	DWORD PTR _ctrl_handlers[eax+12], 0
	je	SHORT $L70562
	mov	ecx, DWORD PTR _i_ctrl$[ebp]
	push	ecx
	mov	edx, DWORD PTR _cntxt$[ebp]
	push	edx
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	ecx, DWORD PTR [eax+80]
	mov	edx, DWORD PTR _i_ctrl$[ebp]
	imul	edx, 480				; 000001e0H
	mov	eax, DWORD PTR [ecx]
	mov	ecx, DWORD PTR [eax+edx+32]
	shl	ecx, 4
	call	DWORD PTR _ctrl_handlers[ecx+12]
	add	esp, 8
	test	eax, eax
	je	SHORT $L70562
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 471		; 000001d7H
	jmp	$eva_err$70559
$L70562:

; 472  : 		error = ctrl->error;

	mov	eax, DWORD PTR _ctrl$[ebp]
	mov	ecx, DWORD PTR [eax+212]
	mov	DWORD PTR _error$[ebp], ecx

; 473  : 
; 474  : 		/* Check error status */
; 475  : 		if(ctrl_check_error_status(cntxt, ctrl)) STACK_ERROR;

	mov	edx, DWORD PTR _ctrl$[ebp]
	push	edx
	mov	eax, DWORD PTR _cntxt$[ebp]
	push	eax
	call	_ctrl_check_error_status
	add	esp, 8
	test	eax, eax
	je	SHORT $L70563
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 475		; 000001dbH
	jmp	$eva_err$70559
$L70563:

; 476  : 		ctrl->error |= error;

	mov	edx, DWORD PTR _ctrl$[ebp]
	mov	eax, DWORD PTR [edx+212]
	or	eax, DWORD PTR _error$[ebp]
	mov	ecx, DWORD PTR _ctrl$[ebp]
	mov	DWORD PTR [ecx+212], eax

; 477  : 		form->error |= ctrl->error;

	mov	edx, DWORD PTR _form$[ebp]
	mov	eax, DWORD PTR _ctrl$[ebp]
	mov	ecx, DWORD PTR [edx+132]
	or	ecx, DWORD PTR [eax+212]
	mov	edx, DWORD PTR _form$[ebp]
	mov	DWORD PTR [edx+132], ecx

; 478  : 
; 479  : 		/* Check for changes in values */
; 480  : 		if(!ctrl->storage) ctrl->b_modified = 0;

	mov	eax, DWORD PTR _ctrl$[ebp]
	cmp	DWORD PTR [eax+36], 0
	jne	SHORT $L70564
	mov	ecx, DWORD PTR _ctrl$[ebp]
	mov	DWORD PTR [ecx+200], 0

; 481  : 		else ctrl_check_changes(cntxt, i_ctrl, 1);

	jmp	SHORT $L70565
$L70564:
	push	1
	mov	edx, DWORD PTR _i_ctrl$[ebp]
	push	edx
	mov	eax, DWORD PTR _cntxt$[ebp]
	push	eax
	call	_ctrl_check_changes
	add	esp, 12					; 0000000cH
$L70565:

; 482  : 		form->b_modified |= ctrl->b_modified;

	mov	ecx, DWORD PTR _form$[ebp]
	mov	edx, DWORD PTR _ctrl$[ebp]
	mov	eax, DWORD PTR [ecx+128]
	or	eax, DWORD PTR [edx+200]
	mov	ecx, DWORD PTR _form$[ebp]
	mov	DWORD PTR [ecx+128], eax

; 483  : 		break;

	jmp	$eva_noerr$70718
$L70566:

; 484  : 
; 485  : 	case HtmlSaveDlg:
; 486  : 		/* Ignore if input not stored */
; 487  : 		if(!ctrl->storage || !form->html) break;

	mov	edx, DWORD PTR _ctrl$[ebp]
	cmp	DWORD PTR [edx+36], 0
	je	SHORT $L70568
	mov	eax, DWORD PTR _form$[ebp]
	cmp	DWORD PTR [eax+232], 0
	jne	SHORT $L70567
$L70568:
	jmp	$eva_noerr$70718
$L70567:

; 488  : 
; 489  : 		/* Filter control values for current line & num index */
; 490  : 		if(ctrl_filter_check_values(cntxt, i_ctrl)) STACK_ERROR;

	mov	ecx, DWORD PTR _i_ctrl$[ebp]
	push	ecx
	mov	edx, DWORD PTR _cntxt$[ebp]
	push	edx
	call	_ctrl_filter_check_values
	add	esp, 8
	test	eax, eax
	je	SHORT $L70569
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 490		; 000001eaH
	jmp	$eva_err$70559
$L70569:

; 491  : 
; 492  : 		/* Check if control was already output */
; 493  : 		for(i = 1; i < i_ctrl && (strcmp(ctrl->FIELD, form->ctrl[i].FIELD) ||
; 494  : 									form->ctrl[i].outmode != HtmlEdit); i++);

	mov	DWORD PTR _i$[ebp], 1
	jmp	SHORT $L70570
$L70571:
	mov	ecx, DWORD PTR _i$[ebp]
	add	ecx, 1
	mov	DWORD PTR _i$[ebp], ecx
$L70570:
	mov	edx, DWORD PTR _i$[ebp]
	cmp	edx, DWORD PTR _i_ctrl$[ebp]
	jae	SHORT $L70572
	mov	eax, DWORD PTR _i$[ebp]
	imul	eax, 480				; 000001e0H
	mov	ecx, DWORD PTR _form$[ebp]
	mov	edx, DWORD PTR [ecx]
	mov	eax, DWORD PTR [edx+eax+280]
	push	eax
	mov	ecx, DWORD PTR _ctrl$[ebp]
	mov	edx, DWORD PTR [ecx+280]
	push	edx
	call	_strcmp
	add	esp, 8
	test	eax, eax
	jne	SHORT $L70573
	mov	eax, DWORD PTR _i$[ebp]
	imul	eax, 480				; 000001e0H
	mov	ecx, DWORD PTR _form$[ebp]
	mov	edx, DWORD PTR [ecx]
	cmp	DWORD PTR [edx+eax+204], 4
	je	SHORT $L70572
$L70573:
	jmp	SHORT $L70571
$L70572:

; 495  : 
; 496  : 		/* If control is elegible for output */
; 497  : 		if(i == i_ctrl && ((form->savedlg_outmode & 8 && ctrl->val.nbrows) ||
; 498  : 			(ctrl->error & 2 && form->savedlg_outmode & 2) ||
; 499  : 			(ctrl->error & 1 && form->savedlg_outmode & 1) ||
; 500  : 			(ctrl->b_modified && form->savedlg_outmode & 4)))

	mov	eax, DWORD PTR _i$[ebp]
	cmp	eax, DWORD PTR _i_ctrl$[ebp]
	jne	$L70574
	mov	ecx, DWORD PTR _form$[ebp]
	mov	edx, DWORD PTR [ecx+204]
	and	edx, 8
	test	edx, edx
	je	SHORT $L70576
	mov	eax, DWORD PTR _ctrl$[ebp]
	cmp	DWORD PTR [eax+64], 0
	jne	SHORT $L70575
$L70576:
	mov	ecx, DWORD PTR _ctrl$[ebp]
	mov	edx, DWORD PTR [ecx+212]
	and	edx, 2
	test	edx, edx
	je	SHORT $L70577
	mov	eax, DWORD PTR _form$[ebp]
	mov	ecx, DWORD PTR [eax+204]
	and	ecx, 2
	test	ecx, ecx
	jne	SHORT $L70575
$L70577:
	mov	edx, DWORD PTR _ctrl$[ebp]
	mov	eax, DWORD PTR [edx+212]
	and	eax, 1
	test	eax, eax
	je	SHORT $L70578
	mov	ecx, DWORD PTR _form$[ebp]
	mov	edx, DWORD PTR [ecx+204]
	and	edx, 1
	test	edx, edx
	jne	SHORT $L70575
$L70578:
	mov	eax, DWORD PTR _ctrl$[ebp]
	cmp	DWORD PTR [eax+200], 0
	je	$L70574
	mov	ecx, DWORD PTR _form$[ebp]
	mov	edx, DWORD PTR [ecx+204]
	and	edx, 4
	test	edx, edx
	je	$L70574
$L70575:

; 502  : 			/* Set output format suitable for dialog */
; 503  : 			form->step = (ctrl->access & AccessEdit && (ctrl->error || ctrl->b_modified)) ? HtmlEdit : HtmlView;

	mov	eax, DWORD PTR _ctrl$[ebp]
	mov	ecx, DWORD PTR [eax+184]
	and	ecx, 2
	test	ecx, ecx
	je	SHORT $L70779
	mov	edx, DWORD PTR _ctrl$[ebp]
	cmp	DWORD PTR [edx+212], 0
	jne	SHORT $L70778
	mov	eax, DWORD PTR _ctrl$[ebp]
	cmp	DWORD PTR [eax+200], 0
	je	SHORT $L70779
$L70778:
	mov	DWORD PTR -580+[ebp], 4
	jmp	SHORT $L70780
$L70779:
	mov	DWORD PTR -580+[ebp], 6
$L70780:
	mov	ecx, DWORD PTR _form$[ebp]
	mov	edx, DWORD PTR -580+[ebp]
	mov	DWORD PTR [ecx+176], edx

; 504  : 			form->b_noctrltree = 1;

	mov	eax, DWORD PTR _form$[ebp]
	mov	DWORD PTR [eax+200], 1

; 505  : 			ctrl->outmode = form->step;

	mov	ecx, DWORD PTR _ctrl$[ebp]
	mov	edx, DWORD PTR _form$[ebp]
	mov	eax, DWORD PTR [edx+176]
	mov	DWORD PTR [ecx+204], eax

; 506  : 			ctrl->POSITION = "_EVA_SameCell";

	mov	ecx, DWORD PTR _ctrl$[ebp]
	mov	DWORD PTR [ecx+296], OFFSET FLAT:$SG70579

; 507  : 			ctrl->ALIGN = "";

	mov	edx, DWORD PTR _ctrl$[ebp]
	mov	DWORD PTR [edx+300], OFFSET FLAT:$SG70580

; 508  : 			ctrl->BACKGROUND = "";

	mov	eax, DWORD PTR _ctrl$[ebp]
	mov	DWORD PTR [eax+324], OFFSET FLAT:$SG70581

; 509  : 			ctrl->FONTCOLOR = "";

	mov	ecx, DWORD PTR _ctrl$[ebp]
	mov	DWORD PTR [ecx+360], OFFSET FLAT:$SG70582

; 510  : 			ctrl->FONTSIZE = "";

	mov	edx, DWORD PTR _ctrl$[ebp]
	mov	DWORD PTR [edx+356], OFFSET FLAT:$SG70583

; 511  : 			ctrl->COLSPAN = 0;

	mov	eax, DWORD PTR _ctrl$[ebp]
	mov	DWORD PTR [eax+328], 0

; 512  : 			ctrl->ROWSPAN = 0;

	mov	ecx, DWORD PTR _ctrl$[ebp]
	mov	DWORD PTR [ecx+332], 0

; 513  : 			if(ctrl->LINES > 5) ctrl->LINES = 5;

	mov	edx, DWORD PTR _ctrl$[ebp]
	cmp	DWORD PTR [edx+376], 5
	jbe	SHORT $L70584
	mov	eax, DWORD PTR _ctrl$[ebp]
	mov	DWORD PTR [eax+376], 5
$L70584:

; 514  : 			if(ctrl->COLUMNS > 50) ctrl->COLUMNS = 50;

	mov	ecx, DWORD PTR _ctrl$[ebp]
	cmp	DWORD PTR [ecx+380], 50			; 00000032H
	jbe	SHORT $L70585
	mov	edx, DWORD PTR _ctrl$[ebp]
	mov	DWORD PTR [edx+380], 50			; 00000032H
$L70585:

; 515  : 			if(!ctrl->FONTFACE[0]) ctrl->FONTFACE = "Arial";

	mov	eax, DWORD PTR _ctrl$[ebp]
	mov	ecx, DWORD PTR [eax+352]
	movsx	edx, BYTE PTR [ecx]
	test	edx, edx
	jne	SHORT $L70586
	mov	eax, DWORD PTR _ctrl$[ebp]
	mov	DWORD PTR [eax+352], OFFSET FLAT:$SG70587
$L70586:

; 516  : 			ctrl->LABELPOS = "_EVA_SameCell";

	mov	ecx, DWORD PTR _ctrl$[ebp]
	mov	DWORD PTR [ecx+292], OFFSET FLAT:$SG70588

; 517  : 			ctrl->LABELBOLD = "";

	mov	edx, DWORD PTR _ctrl$[ebp]
	mov	DWORD PTR [edx+420], OFFSET FLAT:$SG70589

; 518  : 			ctrl->LABELFONTCOLOR = "";

	mov	eax, DWORD PTR _ctrl$[ebp]
	mov	DWORD PTR [eax+416], OFFSET FLAT:$SG70590

; 519  : 			ctrl->LABELFONTSIZE = "";

	mov	ecx, DWORD PTR _ctrl$[ebp]
	mov	DWORD PTR [ecx+412], OFFSET FLAT:$SG70591

; 520  : 			ctrl->OPTIONBUTTON = "_EVA_ALWAYS";

	mov	edx, DWORD PTR _ctrl$[ebp]
	mov	DWORD PTR [edx+336], OFFSET FLAT:$SG70592

; 521  : 			ctrl->CELL_STYLE = "";

	mov	eax, DWORD PTR _ctrl$[ebp]
	mov	DWORD PTR [eax+468], OFFSET FLAT:$SG70593

; 522  : 			ctrl->LABEL_STYLE = "";

	mov	ecx, DWORD PTR _ctrl$[ebp]
	mov	DWORD PTR [ecx+472], OFFSET FLAT:$SG70594

; 526  : 				"<td colspan=2><hr></td></tr><tr>"
; 527  : 				"<td align=right valign=top><font face='", ctrl->FONTFACE, 0, NO_CONV, "'>");

	push	2
	push	OFFSET FLAT:$SG70597
	push	0
	push	0
	push	0
	mov	edx, DWORD PTR _ctrl$[ebp]
	mov	eax, DWORD PTR [edx+352]
	push	eax
	push	71					; 00000047H
	push	OFFSET FLAT:$SG70598
	mov	ecx, DWORD PTR _html$[ebp]
	push	ecx
	call	_dynbuf_add3
	add	esp, 36					; 00000024H
	test	eax, eax
	je	SHORT $L70596
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29872], OFFSET FLAT:$SG70600
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 527		; 0000020fH
	jmp	$eva_err$70559
$L70596:

; 528  : 			if(ctrl_put_label(cntxt, ctrl, "_EVA_SameCell")) STACK_ERROR;

	push	OFFSET FLAT:$SG70602
	mov	ecx, DWORD PTR _ctrl$[ebp]
	push	ecx
	mov	edx, DWORD PTR _cntxt$[ebp]
	push	edx
	call	_ctrl_put_label
	add	esp, 12					; 0000000cH
	test	eax, eax
	je	SHORT $L70601
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 528		; 00000210H
	jmp	$eva_err$70559
$L70601:

; 529  : 			if(form->step == HtmlEdit || ctrl->error > 1)

	mov	ecx, DWORD PTR _form$[ebp]
	cmp	DWORD PTR [ecx+176], 4
	je	SHORT $L70604
	mov	edx, DWORD PTR _ctrl$[ebp]
	cmp	DWORD PTR [edx+212], 1
	jle	$L70637
$L70604:

; 531  : 				DYNBUF_ADD_STR(form->html, "<br><font size=-1>");

	push	0
	push	0
	push	18					; 00000012H
	push	OFFSET FLAT:$SG70607
	mov	eax, DWORD PTR _form$[ebp]
	mov	ecx, DWORD PTR [eax+232]
	push	ecx
	call	_dynbuf_add
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L70606
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29872], OFFSET FLAT:$SG70609
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 531		; 00000213H
	jmp	$eva_err$70559
$L70606:

; 532  : 				if(ctrl->b_modified) DYNBUF_ADD_STR(html, "Champ modifié");

	mov	ecx, DWORD PTR _ctrl$[ebp]
	cmp	DWORD PTR [ecx+200], 0
	je	SHORT $L70612
	push	0
	push	0
	push	13					; 0000000dH
	push	OFFSET FLAT:$SG70613
	mov	edx, DWORD PTR _html$[ebp]
	push	edx
	call	_dynbuf_add
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L70612
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29872], OFFSET FLAT:$SG70615
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 532		; 00000214H
	jmp	$eva_err$70559
$L70612:

; 533  : 				if(ctrl->errmsg)

	mov	edx, DWORD PTR _ctrl$[ebp]
	cmp	DWORD PTR [edx+216], 0
	je	$L70631

; 535  : 					if(form->step != HtmlEdit) DYNBUF_ADD_STR(html, " Vous n'avec pas accès à ce champ en modification");

	mov	eax, DWORD PTR _form$[ebp]
	cmp	DWORD PTR [eax+176], 4
	je	SHORT $L70619
	push	0
	push	0
	push	49					; 00000031H
	push	OFFSET FLAT:$SG70620
	mov	ecx, DWORD PTR _html$[ebp]
	push	ecx
	call	_dynbuf_add
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L70619
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29872], OFFSET FLAT:$SG70622
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 535		; 00000217H
	jmp	$eva_err$70559
$L70619:

; 536  : 					if(ctrl->b_modified || form->step != HtmlEdit) DYNBUF_ADD_STR(html, "<br>");

	mov	ecx, DWORD PTR _ctrl$[ebp]
	cmp	DWORD PTR [ecx+200], 0
	jne	SHORT $L70624
	mov	edx, DWORD PTR _form$[ebp]
	cmp	DWORD PTR [edx+176], 4
	je	SHORT $L70626
$L70624:
	push	0
	push	0
	push	4
	push	OFFSET FLAT:$SG70627
	mov	eax, DWORD PTR _html$[ebp]
	push	eax
	call	_dynbuf_add
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L70626
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29872], OFFSET FLAT:$SG70629
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 536		; 00000218H
	jmp	$eva_err$70559
$L70626:

; 537  : 					DYNBUF_ADD3_BUF(html, "<font color=#FF0000><b>", ctrl->errmsg, TO_HTML, "</font></b>");

	mov	eax, DWORD PTR _ctrl$[ebp]
	cmp	DWORD PTR [eax+216], 0
	je	SHORT $L70781
	mov	ecx, DWORD PTR _ctrl$[ebp]
	mov	edx, DWORD PTR [ecx+216]
	mov	eax, DWORD PTR [edx+4]
	mov	DWORD PTR -584+[ebp], eax
	jmp	SHORT $L70782
$L70781:
	mov	DWORD PTR -584+[ebp], 0
$L70782:
	mov	ecx, DWORD PTR _ctrl$[ebp]
	cmp	DWORD PTR [ecx+216], 0
	je	SHORT $L70783
	mov	edx, DWORD PTR _ctrl$[ebp]
	mov	eax, DWORD PTR [edx+216]
	add	eax, 8
	mov	DWORD PTR -588+[ebp], eax
	jmp	SHORT $L70784
$L70783:
	mov	DWORD PTR -588+[ebp], 0
$L70784:
	push	11					; 0000000bH
	push	OFFSET FLAT:$SG70632
	push	1
	push	OFFSET FLAT:_plain_to_html
	mov	ecx, DWORD PTR -584+[ebp]
	push	ecx
	mov	edx, DWORD PTR -588+[ebp]
	push	edx
	push	23					; 00000017H
	push	OFFSET FLAT:$SG70633
	mov	eax, DWORD PTR _html$[ebp]
	push	eax
	call	_dynbuf_add3
	add	esp, 36					; 00000024H
	test	eax, eax
	je	SHORT $L70631
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29872], OFFSET FLAT:$SG70635
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 537		; 00000219H
	jmp	$eva_err$70559
$L70631:

; 539  : 				DYNBUF_ADD_STR(html, "</font>\n");

	push	0
	push	0
	push	8
	push	OFFSET FLAT:$SG70638
	mov	eax, DWORD PTR _html$[ebp]
	push	eax
	call	_dynbuf_add
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L70637
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29872], OFFSET FLAT:$SG70640
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 539		; 0000021bH
	jmp	$eva_err$70559
$L70637:

; 541  : 			DYNBUF_ADD3(html, "</td><td valign=top><font face='", ctrl->FONTFACE, 0, NO_CONV, "'>");

	push	2
	push	OFFSET FLAT:$SG70643
	push	0
	push	0
	push	0
	mov	eax, DWORD PTR _ctrl$[ebp]
	mov	ecx, DWORD PTR [eax+352]
	push	ecx
	push	32					; 00000020H
	push	OFFSET FLAT:$SG70644
	mov	edx, DWORD PTR _html$[ebp]
	push	edx
	call	_dynbuf_add3
	add	esp, 36					; 00000024H
	test	eax, eax
	je	SHORT $L70642
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29872], OFFSET FLAT:$SG70646
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 541		; 0000021dH
	jmp	$eva_err$70559
$L70642:

; 542  : 
; 543  : 			/* If edit mode : handle hidden inputs */
; 544  : 			if(form->step == HtmlEdit)

	mov	edx, DWORD PTR _form$[ebp]
	cmp	DWORD PTR [edx+176], 4
	jne	$L70665

; 546  : 				/* If control has cleared CGI input : restore values */
; 547  : 				DynTable *dbval = ctrl->alldbval.nbrows ? &ctrl->alldbval  : &ctrl->dbval;

	mov	eax, DWORD PTR _ctrl$[ebp]
	cmp	DWORD PTR [eax+144], 0
	je	SHORT $L70785
	mov	ecx, DWORD PTR _ctrl$[ebp]
	add	ecx, 144				; 00000090H
	mov	DWORD PTR -592+[ebp], ecx
	jmp	SHORT $L70786
$L70785:
	mov	edx, DWORD PTR _ctrl$[ebp]
	add	edx, 84					; 00000054H
	mov	DWORD PTR -592+[ebp], edx
$L70786:
	mov	eax, DWORD PTR -592+[ebp]
	mov	DWORD PTR _dbval$70648[ebp], eax

; 548  : 				if(ctrl->b_cgicleared && ctrl->cgival.nbrows)

	mov	ecx, DWORD PTR _ctrl$[ebp]
	cmp	DWORD PTR [ecx+268], 0
	je	SHORT $L70649
	mov	edx, DWORD PTR _ctrl$[ebp]
	cmp	DWORD PTR [edx+104], 0
	je	SHORT $L70649

; 550  : 					for(i = 0; i < ctrl->cgival.nbrows; i++) cgi_value_setkeep(cntxt, &ctrl->cgival, i, 0);

	mov	DWORD PTR _i$[ebp], 0
	jmp	SHORT $L70650
$L70651:
	mov	eax, DWORD PTR _i$[ebp]
	add	eax, 1
	mov	DWORD PTR _i$[ebp], eax
$L70650:
	mov	ecx, DWORD PTR _ctrl$[ebp]
	mov	edx, DWORD PTR _i$[ebp]
	cmp	edx, DWORD PTR [ecx+104]
	jae	SHORT $L70652
	push	0
	mov	eax, DWORD PTR _i$[ebp]
	push	eax
	mov	ecx, DWORD PTR _ctrl$[ebp]
	add	ecx, 104				; 00000068H
	push	ecx
	mov	edx, DWORD PTR _cntxt$[ebp]
	push	edx
	call	_cgi_value_setkeep
	add	esp, 16					; 00000010H
	jmp	SHORT $L70651
$L70652:

; 551  : 					ctrl->b_cgicleared = 0;

	mov	eax, DWORD PTR _ctrl$[ebp]
	mov	DWORD PTR [eax+268], 0

; 553  : 				/* If control has values but no CGI input : Add hidden input for db values */
; 554  : 				else if(dbval->nbrows && !ctrl->cgival.nbrows)

	jmp	$L70657
$L70649:
	mov	ecx, DWORD PTR _dbval$70648[ebp]
	cmp	DWORD PTR [ecx], 0
	je	$L70657
	mov	edx, DWORD PTR _ctrl$[ebp]
	cmp	DWORD PTR [edx+104], 0
	jne	$L70657

; 555  : 					for(i = 0; i < dbval->nbrows; i++)

	mov	DWORD PTR _i$[ebp], 0
	jmp	SHORT $L70655
$L70656:
	mov	eax, DWORD PTR _i$[ebp]
	add	eax, 1
	mov	DWORD PTR _i$[ebp], eax
$L70655:
	mov	ecx, DWORD PTR _dbval$70648[ebp]
	mov	edx, DWORD PTR _i$[ebp]
	cmp	edx, DWORD PTR [ecx]
	jae	$L70657

; 557  : 						unsigned long i_cgi = 0;

	mov	DWORD PTR _i_cgi$70658[ebp], 0

; 558  : 						val = dyntab_cell(dbval, i, 0);

	push	0
	mov	eax, DWORD PTR _i$[ebp]
	push	eax
	mov	ecx, DWORD PTR _dbval$70648[ebp]
	push	ecx
	call	_dyntab_cell
	add	esp, 12					; 0000000cH
	mov	DWORD PTR _val$[ebp], eax

; 559  : 						if(ctrl_cgi_name(cntxt, ctrl, val, 1, &name, 0, NULL, 0)) STACK_ERROR;

	push	0
	push	0
	push	0
	lea	edx, DWORD PTR _name$[ebp]
	push	edx
	push	1
	mov	eax, DWORD PTR _val$[ebp]
	push	eax
	mov	ecx, DWORD PTR _ctrl$[ebp]
	push	ecx
	mov	edx, DWORD PTR _cntxt$[ebp]
	push	edx
	call	_ctrl_cgi_name
	add	esp, 32					; 00000020H
	test	eax, eax
	je	SHORT $L70660
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 559		; 0000022fH
	jmp	$eva_err$70559
$L70660:

; 560  : 						if(cgi_add_input(cntxt, &i_cgi, name->data, name->cnt, val->txt, val->len)) STACK_ERROR;

	mov	ecx, DWORD PTR _val$[ebp]
	mov	edx, DWORD PTR [ecx+4]
	push	edx
	mov	eax, DWORD PTR _val$[ebp]
	mov	ecx, DWORD PTR [eax]
	push	ecx
	mov	edx, DWORD PTR _name$[ebp]
	mov	eax, DWORD PTR [edx+4]
	push	eax
	mov	ecx, DWORD PTR _name$[ebp]
	add	ecx, 8
	push	ecx
	lea	edx, DWORD PTR _i_cgi$70658[ebp]
	push	edx
	mov	eax, DWORD PTR _cntxt$[ebp]
	push	eax
	call	_cgi_add_input
	add	esp, 24					; 00000018H
	test	eax, eax
	je	SHORT $L70661
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 560		; 00000230H
	jmp	$eva_err$70559
$L70661:

; 561  : 						DYNTAB_SET_CELLP(&ctrl->cgival, i, 0, val);

	push	0
	mov	edx, DWORD PTR _val$[ebp]
	push	edx
	push	0
	mov	eax, DWORD PTR _i$[ebp]
	push	eax
	mov	ecx, DWORD PTR _ctrl$[ebp]
	add	ecx, 104				; 00000068H
	push	ecx
	call	_dyntab_copy
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L70662
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29872], OFFSET FLAT:$SG70664
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 561		; 00000231H
	jmp	$eva_err$70559
$L70662:

; 562  : 						val = dyntab_cell(&ctrl->cgival, i, 0);

	push	0
	mov	ecx, DWORD PTR _i$[ebp]
	push	ecx
	mov	edx, DWORD PTR _ctrl$[ebp]
	add	edx, 104				; 00000068H
	push	edx
	call	_dyntab_cell
	add	esp, 12					; 0000000cH
	mov	DWORD PTR _val$[ebp], eax

; 563  : 						val->i_cgi = i_cgi;

	mov	eax, DWORD PTR _val$[ebp]
	mov	ecx, DWORD PTR _i_cgi$70658[ebp]
	mov	DWORD PTR [eax+48], ecx

; 564  : 					}

	jmp	$L70656
$L70657:

; 565  : 
; 566  : 				/* Clear out CGI values from input for the values in ctrl->val */
; 567  : 				ctrl_dontkeep_cgi_input(cntxt, i_ctrl);

	mov	edx, DWORD PTR _i_ctrl$[ebp]
	push	edx
	mov	eax, DWORD PTR _cntxt$[ebp]
	push	eax
	call	_ctrl_dontkeep_cgi_input
	add	esp, 8

; 568  : 
; 569  : 				/* Handle selection mode for relations */
; 570  : 				if(ctrl->objtbl && ctrl->error && strcmp(ctrl->TYPE, "_EVA_FILEUPLOAD"))

	mov	ecx, DWORD PTR _ctrl$[ebp]
	cmp	DWORD PTR [ecx+232], 0
	je	SHORT $L70665
	mov	edx, DWORD PTR _ctrl$[ebp]
	cmp	DWORD PTR [edx+212], 0
	je	SHORT $L70665
	push	OFFSET FLAT:$SG70666
	mov	eax, DWORD PTR _ctrl$[ebp]
	mov	ecx, DWORD PTR [eax+276]
	push	ecx
	call	_strcmp
	add	esp, 8
	test	eax, eax
	je	SHORT $L70665

; 571  : 					ctrl->objtbl->status = ctrl->val.nbrows ?
; 572  : 								ctrl->objtbl->status & ~(TblCtrl_opensearch | TblCtrl_opensel) :
; 573  : 								ctrl->objtbl->status | TblCtrl_opensearch | TblCtrl_opensel;

	mov	edx, DWORD PTR _ctrl$[ebp]
	cmp	DWORD PTR [edx+64], 0
	je	SHORT $L70787
	mov	eax, DWORD PTR _ctrl$[ebp]
	mov	ecx, DWORD PTR [eax+232]
	mov	edx, DWORD PTR [ecx+32]
	and	edx, -545				; fffffddfH
	mov	DWORD PTR -596+[ebp], edx
	jmp	SHORT $L70788
$L70787:
	mov	eax, DWORD PTR _ctrl$[ebp]
	mov	ecx, DWORD PTR [eax+232]
	mov	edx, DWORD PTR [ecx+32]
	or	edx, 32					; 00000020H
	or	dh, 2
	mov	DWORD PTR -596+[ebp], edx
$L70788:
	mov	eax, DWORD PTR _ctrl$[ebp]
	mov	ecx, DWORD PTR [eax+232]
	mov	edx, DWORD PTR -596+[ebp]
	mov	DWORD PTR [ecx+32], edx
$L70665:

; 575  : 
; 576  : 			/* Output control */
; 577  : 			ctrl->LABELPOS = "_EVA_NONE";

	mov	eax, DWORD PTR _ctrl$[ebp]
	mov	DWORD PTR [eax+292], OFFSET FLAT:$SG70667

; 578  : 			CTRL_SEC_HDLR(i_ctrl);

	cmp	DWORD PTR _i_ctrl$[ebp], 0
	je	SHORT $L70668
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	edx, DWORD PTR [ecx+80]
	mov	eax, DWORD PTR _i_ctrl$[ebp]
	imul	eax, 480				; 000001e0H
	mov	ecx, DWORD PTR [edx]
	mov	edx, DWORD PTR [ecx+eax+32]
	shl	edx, 4
	cmp	DWORD PTR _ctrl_handlers[edx+12], 0
	je	SHORT $L70668
	mov	eax, DWORD PTR _i_ctrl$[ebp]
	push	eax
	mov	ecx, DWORD PTR _cntxt$[ebp]
	push	ecx
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	eax, DWORD PTR [edx+80]
	mov	ecx, DWORD PTR _i_ctrl$[ebp]
	imul	ecx, 480				; 000001e0H
	mov	edx, DWORD PTR [eax]
	mov	eax, DWORD PTR [edx+ecx+32]
	shl	eax, 4
	call	DWORD PTR _ctrl_handlers[eax+12]
	add	esp, 8
	test	eax, eax
	je	SHORT $L70668
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 578		; 00000242H
	jmp	$eva_err$70559
$L70668:

; 579  : 
; 580  : 			/* Output help text if applicable */
; 581  : 			if((form->step == HtmlEdit || ctrl->error > 1) && ctrl->NOTES && *ctrl->NOTES)

	mov	edx, DWORD PTR _form$[ebp]
	cmp	DWORD PTR [edx+176], 4
	je	SHORT $L70670
	mov	eax, DWORD PTR _ctrl$[ebp]
	cmp	DWORD PTR [eax+212], 1
	jle	SHORT $L70671
$L70670:
	mov	ecx, DWORD PTR _ctrl$[ebp]
	cmp	DWORD PTR [ecx+288], 0
	je	SHORT $L70671
	mov	edx, DWORD PTR _ctrl$[ebp]
	mov	eax, DWORD PTR [edx+288]
	movsx	ecx, BYTE PTR [eax]
	test	ecx, ecx
	je	SHORT $L70671

; 582  : 				DYNBUF_ADD3(form->html, "\n<br><font size=-1>", ctrl->NOTES, 0, TO_HTML, "</font>");

	push	7
	push	OFFSET FLAT:$SG70672
	push	1
	push	OFFSET FLAT:_plain_to_html
	push	0
	mov	edx, DWORD PTR _ctrl$[ebp]
	mov	eax, DWORD PTR [edx+288]
	push	eax
	push	19					; 00000013H
	push	OFFSET FLAT:$SG70673
	mov	ecx, DWORD PTR _form$[ebp]
	mov	edx, DWORD PTR [ecx+232]
	push	edx
	call	_dynbuf_add3
	add	esp, 36					; 00000024H
	test	eax, eax
	je	SHORT $L70671
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29872], OFFSET FLAT:$SG70675
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 582		; 00000246H
	jmp	$eva_err$70559
$L70671:

; 583  : 			DYNBUF_ADD_STR(html, "</td>\n</tr><tr>\n");

	push	0
	push	0
	push	16					; 00000010H
	push	OFFSET FLAT:$SG70678
	mov	edx, DWORD PTR _html$[ebp]
	push	edx
	call	_dynbuf_add
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L70677
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29872], OFFSET FLAT:$SG70680
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 583		; 00000247H
	jmp	$eva_err$70559
$L70677:

; 584  : 
; 585  : 			/* Restore context */
; 586  : 			if(ctrl_set_common_attr(cntxt, ctrl)) STACK_ERROR;

	mov	edx, DWORD PTR _ctrl$[ebp]
	push	edx
	mov	eax, DWORD PTR _cntxt$[ebp]
	push	eax
	call	_ctrl_set_common_attr
	add	esp, 8
	test	eax, eax
	je	SHORT $L70681
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 586		; 0000024aH
	jmp	$eva_err$70559
$L70681:

; 587  : 			form->step = HtmlSaveDlg;

	mov	edx, DWORD PTR _form$[ebp]
	mov	DWORD PTR [edx+176], 3

; 588  : 			form->b_noctrltree = 0;

	mov	eax, DWORD PTR _form$[ebp]
	mov	DWORD PTR [eax+200], 0
$L70574:

; 590  : 
; 591  : 		/* Call control secondary handler to process child controls */
; 592  : 		CTRL_SEC_HDLR(i_ctrl);

	cmp	DWORD PTR _i_ctrl$[ebp], 0
	je	SHORT $L70682
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	edx, DWORD PTR [ecx+80]
	mov	eax, DWORD PTR _i_ctrl$[ebp]
	imul	eax, 480				; 000001e0H
	mov	ecx, DWORD PTR [edx]
	mov	edx, DWORD PTR [ecx+eax+32]
	shl	edx, 4
	cmp	DWORD PTR _ctrl_handlers[edx+12], 0
	je	SHORT $L70682
	mov	eax, DWORD PTR _i_ctrl$[ebp]
	push	eax
	mov	ecx, DWORD PTR _cntxt$[ebp]
	push	ecx
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	eax, DWORD PTR [edx+80]
	mov	ecx, DWORD PTR _i_ctrl$[ebp]
	imul	ecx, 480				; 000001e0H
	mov	edx, DWORD PTR [eax]
	mov	eax, DWORD PTR [edx+ecx+32]
	shl	eax, 4
	call	DWORD PTR _ctrl_handlers[eax+12]
	add	esp, 8
	test	eax, eax
	je	SHORT $L70682
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 592		; 00000250H
	jmp	$eva_err$70559
$L70682:

; 593  : 		break;

	jmp	$eva_noerr$70718
$L70683:

; 594  : 
; 595  : 	case FormSave:
; 596  : 		/* Ignore if input not stored */
; 597  : 		if(!ctrl->storage) break;

	mov	edx, DWORD PTR _ctrl$[ebp]
	cmp	DWORD PTR [edx+36], 0
	jne	SHORT $L70684
	jmp	$eva_noerr$70718
$L70684:

; 598  : 
; 599  : 		/* Restore unfiltered control values */
; 600  : 		if(ctrl->allval.nbrows || ctrl->alldbval.nbrows)

	mov	eax, DWORD PTR _ctrl$[ebp]
	cmp	DWORD PTR [eax+124], 0
	jne	SHORT $L70686
	mov	ecx, DWORD PTR _ctrl$[ebp]
	cmp	DWORD PTR [ecx+144], 0
	je	SHORT $L70685
$L70686:

; 602  : 			dyntab_moveto(&ctrl->val, &ctrl->allval);

	mov	edx, DWORD PTR _ctrl$[ebp]
	add	edx, 124				; 0000007cH
	push	edx
	mov	eax, DWORD PTR _ctrl$[ebp]
	add	eax, 64					; 00000040H
	push	eax
	call	_dyntab_moveto
	add	esp, 8

; 603  : 			dyntab_moveto(&ctrl->dbval, &ctrl->alldbval);

	mov	ecx, DWORD PTR _ctrl$[ebp]
	add	ecx, 144				; 00000090H
	push	ecx
	mov	edx, DWORD PTR _ctrl$[ebp]
	add	edx, 84					; 00000054H
	push	edx
	call	_dyntab_moveto
	add	esp, 8
$L70685:

; 605  : 
; 606  : 		/* Check for changes against original DB values */
; 607  : 		ctrl_check_changes(cntxt, i_ctrl, 0);

	push	0
	mov	eax, DWORD PTR _i_ctrl$[ebp]
	push	eax
	mov	ecx, DWORD PTR _cntxt$[ebp]
	push	ecx
	call	_ctrl_check_changes
	add	esp, 12					; 0000000cH

; 608  : 
; 609  : 		/* Archive old values - set delete time & user */
; 610  : 		for(i = 0; i < ctrl->dbval.nbrows; i++)

	mov	DWORD PTR _i$[ebp], 0
	jmp	SHORT $L70687
$L70688:
	mov	edx, DWORD PTR _i$[ebp]
	add	edx, 1
	mov	DWORD PTR _i$[ebp], edx
$L70687:
	mov	eax, DWORD PTR _ctrl$[ebp]
	mov	ecx, DWORD PTR _i$[ebp]
	cmp	ecx, DWORD PTR [eax+84]
	jae	$L70689

; 612  :  			char sql[512];
; 613  : 			val = dyntab_cell(&ctrl->dbval, i, 0);

	push	0
	mov	edx, DWORD PTR _i$[ebp]
	push	edx
	mov	eax, DWORD PTR _ctrl$[ebp]
	add	eax, 84					; 00000054H
	push	eax
	call	_dyntab_cell
	add	esp, 12					; 0000000cH
	mov	DWORD PTR _val$[ebp], eax

; 614  : 			if(!val->b_modified) continue;

	mov	ecx, DWORD PTR _val$[ebp]
	movsx	edx, BYTE PTR [ecx+13]
	test	edx, edx
	jne	SHORT $L70691
	jmp	SHORT $L70688
$L70691:

; 615  : 			sprintf(sql, "UPDATE TLink SET DateDel='%s', IdWhoDel=%s WHERE Pkey=%lu",
; 616  : 				cntxt->timestamp, dyntab_val(&cntxt->id_user, 0, 0), val->Pkey);

	mov	eax, DWORD PTR _val$[ebp]
	mov	ecx, DWORD PTR [eax+16]
	push	ecx
	push	0
	push	0
	mov	edx, DWORD PTR _cntxt$[ebp]
	add	edx, 29408				; 000072e0H
	push	edx
	call	_dyntab_val
	add	esp, 12					; 0000000cH
	push	eax
	mov	eax, DWORD PTR _cntxt$[ebp]
	add	eax, 29704				; 00007408H
	push	eax
	push	OFFSET FLAT:$SG70692
	lea	ecx, DWORD PTR _sql$70690[ebp]
	push	ecx
	call	_sprintf
	add	esp, 20					; 00000014H

; 617  : 			if(sql_exec_query(cntxt , sql)) STACK_ERROR;

	lea	edx, DWORD PTR _sql$70690[ebp]
	push	edx
	mov	eax, DWORD PTR _cntxt$[ebp]
	push	eax
	call	_sql_exec_query
	add	esp, 8
	test	eax, eax
	je	SHORT $L70693
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 617		; 00000269H
	jmp	$eva_err$70559
$L70693:

; 618  : 		}

	jmp	$L70688
$L70689:

; 619  : 
; 620  : 		/* For each value */
; 621  : 		field = CTRL_ATTR_CELL(FIELD);

	cmp	DWORD PTR _ctrl$[ebp], 0
	je	SHORT $L70789
	push	0
	push	-1
	push	OFFSET FLAT:$SG70695
	mov	edx, DWORD PTR _ctrl$[ebp]
	add	edx, 44					; 0000002cH
	push	edx
	call	_dyntab_field_cell
	add	esp, 16					; 00000010H
	mov	DWORD PTR -600+[ebp], eax
	jmp	SHORT $L70790
$L70789:
	mov	DWORD PTR -600+[ebp], 0
$L70790:
	mov	eax, DWORD PTR -600+[ebp]
	mov	DWORD PTR _field$[ebp], eax

; 622  : 		for(i = 0; i < ctrl->val.nbrows; i++)

	mov	DWORD PTR _i$[ebp], 0
	jmp	SHORT $L70696
$L70697:
	mov	ecx, DWORD PTR _i$[ebp]
	add	ecx, 1
	mov	DWORD PTR _i$[ebp], ecx
$L70696:
	mov	edx, DWORD PTR _ctrl$[ebp]
	mov	eax, DWORD PTR _i$[ebp]
	cmp	eax, DWORD PTR [edx+64]
	jae	$L70698

; 624  : 			/* Create new object if needed */
; 625  : 			if(!dyntab_sz(&form->id_obj, 0, 0) &&
; 626  : 				qry_add_new_obj(cntxt, &form->id_obj, form->id_formsave)) STACK_ERROR;

	push	0
	push	0
	mov	ecx, DWORD PTR _form$[ebp]
	add	ecx, 32					; 00000020H
	push	ecx
	call	_dyntab_sz
	add	esp, 12					; 0000000cH
	test	eax, eax
	jne	SHORT $L70699
	mov	edx, DWORD PTR _form$[ebp]
	mov	eax, DWORD PTR [edx+80]
	push	eax
	mov	ecx, DWORD PTR _form$[ebp]
	add	ecx, 32					; 00000020H
	push	ecx
	mov	edx, DWORD PTR _cntxt$[ebp]
	push	edx
	call	_qry_add_new_obj
	add	esp, 12					; 0000000cH
	test	eax, eax
	je	SHORT $L70699
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 626		; 00000272H
	jmp	$eva_err$70559
$L70699:

; 627  : 
; 628  : 			/* Read value & set object id & field */
; 629  : 			val = dyntab_cell(&ctrl->val, i, 0);

	push	0
	mov	ecx, DWORD PTR _i$[ebp]
	push	ecx
	mov	edx, DWORD PTR _ctrl$[ebp]
	add	edx, 64					; 00000040H
	push	edx
	call	_dyntab_cell
	add	esp, 12					; 0000000cH
	mov	DWORD PTR _val$[ebp], eax

; 630  : 			val->IdObj = DYNTAB_TOUL(&form->id_obj);

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
	mov	ecx, DWORD PTR _val$[ebp]
	mov	DWORD PTR [ecx+20], eax

; 631  : 			val->IdField = field->IdValue;

	mov	edx, DWORD PTR _val$[ebp]
	mov	eax, DWORD PTR _field$[ebp]
	mov	ecx, DWORD PTR [eax+32]
	mov	DWORD PTR [edx+28], ecx

; 632  : 			if(val->txt) val->len = strlen(val->txt);

	mov	edx, DWORD PTR _val$[ebp]
	cmp	DWORD PTR [edx], 0
	je	SHORT $L70701
	mov	eax, DWORD PTR _val$[ebp]
	mov	ecx, DWORD PTR [eax]
	push	ecx
	call	_strlen
	add	esp, 4
	mov	edx, DWORD PTR _val$[ebp]
	mov	DWORD PTR [edx+4], eax
$L70701:

; 633  : 
; 634  : 			/* If modified or new : add value in db */
; 635  : 			if(ctrl->storage == 3) val->b_relation = 1;

	mov	eax, DWORD PTR _ctrl$[ebp]
	cmp	DWORD PTR [eax+36], 3
	jne	SHORT $L70702
	mov	ecx, DWORD PTR _val$[ebp]
	mov	BYTE PTR [ecx+12], 1
$L70702:

; 636  : 			if(val->len && (val->b_modified || !form->objdata.nbrows) &&
; 637  : 				qry_add_val(cntxt, val, 2, NULL)) STACK_ERROR;

	mov	edx, DWORD PTR _val$[ebp]
	cmp	DWORD PTR [edx+4], 0
	je	SHORT $L70704
	mov	eax, DWORD PTR _val$[ebp]
	movsx	ecx, BYTE PTR [eax+13]
	test	ecx, ecx
	jne	SHORT $L70705
	mov	edx, DWORD PTR _form$[ebp]
	cmp	DWORD PTR [edx+52], 0
	jne	SHORT $L70704
$L70705:
	push	0
	push	2
	mov	eax, DWORD PTR _val$[ebp]
	push	eax
	mov	ecx, DWORD PTR _cntxt$[ebp]
	push	ecx
	call	_qry_add_val
	add	esp, 16					; 00000010H
	test	eax, eax
	je	SHORT $L70704
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 637		; 0000027dH
	jmp	$eva_err$70559
$L70704:

; 638  : 		}

	jmp	$L70697
$L70698:

; 639  : 
; 640  : 		/* Call control secondary handler */
; 641  : 		CTRL_SEC_HDLR(i_ctrl);

	cmp	DWORD PTR _i_ctrl$[ebp], 0
	je	SHORT $L70706
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	ecx, DWORD PTR [eax+80]
	mov	edx, DWORD PTR _i_ctrl$[ebp]
	imul	edx, 480				; 000001e0H
	mov	eax, DWORD PTR [ecx]
	mov	ecx, DWORD PTR [eax+edx+32]
	shl	ecx, 4
	cmp	DWORD PTR _ctrl_handlers[ecx+12], 0
	je	SHORT $L70706
	mov	edx, DWORD PTR _i_ctrl$[ebp]
	push	edx
	mov	eax, DWORD PTR _cntxt$[ebp]
	push	eax
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	edx, DWORD PTR [ecx+80]
	mov	eax, DWORD PTR _i_ctrl$[ebp]
	imul	eax, 480				; 000001e0H
	mov	ecx, DWORD PTR [edx]
	mov	edx, DWORD PTR [ecx+eax+32]
	shl	edx, 4
	call	DWORD PTR _ctrl_handlers[edx+12]
	add	esp, 8
	test	eax, eax
	je	SHORT $L70706
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 641		; 00000281H
	jmp	$eva_err$70559
$L70706:

; 642  : 
; 643  : 		/* Clear modified status */
; 644  : 		for(i = 0; i < ctrl->val.nbrows; i++)

	mov	DWORD PTR _i$[ebp], 0
	jmp	SHORT $L70707
$L70708:
	mov	ecx, DWORD PTR _i$[ebp]
	add	ecx, 1
	mov	DWORD PTR _i$[ebp], ecx
$L70707:
	mov	edx, DWORD PTR _ctrl$[ebp]
	mov	eax, DWORD PTR _i$[ebp]
	cmp	eax, DWORD PTR [edx+64]
	jae	SHORT $L70709

; 645  : 			dyntab_cell(&ctrl->val, i, 0)->b_modified = 0;

	push	0
	mov	ecx, DWORD PTR _i$[ebp]
	push	ecx
	mov	edx, DWORD PTR _ctrl$[ebp]
	add	edx, 64					; 00000040H
	push	edx
	call	_dyntab_cell
	add	esp, 12					; 0000000cH
	mov	BYTE PTR [eax+13], 0
	jmp	SHORT $L70708
$L70709:

; 646  : 		ctrl->b_modified = 0;

	mov	eax, DWORD PTR _ctrl$[ebp]
	mov	DWORD PTR [eax+200], 0

; 647  : 		break;

	jmp	$eva_noerr$70718
$L70710:

; 648  : 
; 649  : 	case HtmlPrint:
; 650  : 	case HtmlView:
; 651  : 		/* Filter control values & Call control secondary handler */
; 652  : 		if(ctrl_filter_values(cntxt, i_ctrl)) STACK_ERROR;

	mov	ecx, DWORD PTR _i_ctrl$[ebp]
	push	ecx
	mov	edx, DWORD PTR _cntxt$[ebp]
	push	edx
	call	_ctrl_filter_values
	add	esp, 8
	test	eax, eax
	je	SHORT $L70711
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 652		; 0000028cH
	jmp	$eva_err$70559
$L70711:

; 653  : 		CTRL_SEC_HDLR(i_ctrl);

	cmp	DWORD PTR _i_ctrl$[ebp], 0
	je	SHORT $L70712
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	edx, DWORD PTR [ecx+80]
	mov	eax, DWORD PTR _i_ctrl$[ebp]
	imul	eax, 480				; 000001e0H
	mov	ecx, DWORD PTR [edx]
	mov	edx, DWORD PTR [ecx+eax+32]
	shl	edx, 4
	cmp	DWORD PTR _ctrl_handlers[edx+12], 0
	je	SHORT $L70712
	mov	eax, DWORD PTR _i_ctrl$[ebp]
	push	eax
	mov	ecx, DWORD PTR _cntxt$[ebp]
	push	ecx
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	eax, DWORD PTR [edx+80]
	mov	ecx, DWORD PTR _i_ctrl$[ebp]
	imul	ecx, 480				; 000001e0H
	mov	edx, DWORD PTR [eax]
	mov	eax, DWORD PTR [edx+ecx+32]
	shl	eax, 4
	call	DWORD PTR _ctrl_handlers[eax+12]
	add	esp, 8
	test	eax, eax
	je	SHORT $L70712
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 653		; 0000028dH
	jmp	$eva_err$70559
$L70712:

; 654  : 		break;

	jmp	$eva_noerr$70718
$L70713:

; 655  : 
; 656  : 	case HtmlEdit:
; 657  : 		/* Filter + check control values & Call control secondary handler */
; 658  : 		if(ctrl_filter_check_values(cntxt, i_ctrl)) STACK_ERROR;

	mov	edx, DWORD PTR _i_ctrl$[ebp]
	push	edx
	mov	eax, DWORD PTR _cntxt$[ebp]
	push	eax
	call	_ctrl_filter_check_values
	add	esp, 8
	test	eax, eax
	je	SHORT $L70714
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 658		; 00000292H
	jmp	$eva_err$70559
$L70714:

; 659  : 		CTRL_SEC_HDLR(i_ctrl);

	cmp	DWORD PTR _i_ctrl$[ebp], 0
	je	SHORT $L70715
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	eax, DWORD PTR [edx+80]
	mov	ecx, DWORD PTR _i_ctrl$[ebp]
	imul	ecx, 480				; 000001e0H
	mov	edx, DWORD PTR [eax]
	mov	eax, DWORD PTR [edx+ecx+32]
	shl	eax, 4
	cmp	DWORD PTR _ctrl_handlers[eax+12], 0
	je	SHORT $L70715
	mov	ecx, DWORD PTR _i_ctrl$[ebp]
	push	ecx
	mov	edx, DWORD PTR _cntxt$[ebp]
	push	edx
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	ecx, DWORD PTR [eax+80]
	mov	edx, DWORD PTR _i_ctrl$[ebp]
	imul	edx, 480				; 000001e0H
	mov	eax, DWORD PTR [ecx]
	mov	ecx, DWORD PTR [eax+edx+32]
	shl	ecx, 4
	call	DWORD PTR _ctrl_handlers[ecx+12]
	add	esp, 8
	test	eax, eax
	je	SHORT $L70715
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 659		; 00000293H
	jmp	$eva_err$70559
$L70715:

; 660  : 
; 661  : 		/* Mark corresponding CGI inputs for no reoutput */
; 662  : 		ctrl_dontkeep_cgi_input(cntxt, i_ctrl);

	mov	eax, DWORD PTR _i_ctrl$[ebp]
	push	eax
	mov	ecx, DWORD PTR _cntxt$[ebp]
	push	ecx
	call	_ctrl_dontkeep_cgi_input
	add	esp, 8

; 663  : 		break;

	jmp	SHORT $eva_noerr$70718
$L70716:

; 664  : 
; 665  : 	default:
; 666  : 		/* Call control secondary handler */
; 667  : 		CTRL_SEC_HDLR(i_ctrl);

	cmp	DWORD PTR _i_ctrl$[ebp], 0
	je	SHORT $L70717
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	eax, DWORD PTR [edx+80]
	mov	ecx, DWORD PTR _i_ctrl$[ebp]
	imul	ecx, 480				; 000001e0H
	mov	edx, DWORD PTR [eax]
	mov	eax, DWORD PTR [edx+ecx+32]
	shl	eax, 4
	cmp	DWORD PTR _ctrl_handlers[eax+12], 0
	je	SHORT $L70717
	mov	ecx, DWORD PTR _i_ctrl$[ebp]
	push	ecx
	mov	edx, DWORD PTR _cntxt$[ebp]
	push	edx
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	ecx, DWORD PTR [eax+80]
	mov	edx, DWORD PTR _i_ctrl$[ebp]
	imul	edx, 480				; 000001e0H
	mov	eax, DWORD PTR [ecx]
	mov	ecx, DWORD PTR [eax+edx+32]
	shl	ecx, 4
	call	DWORD PTR _ctrl_handlers[ecx+12]
	add	esp, 8
	test	eax, eax
	je	SHORT $L70717
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 667		; 0000029bH
	jmp	SHORT $eva_err$70559
$L70717:
$eva_noerr$70718:

; 669  : 
; 670  : 	RETURN_OK_CLEANUP;

	push	0
	push	OFFSET FLAT:$SG70719
	push	OFFSET FLAT:$SG70720
	mov	eax, DWORD PTR _cntxt$[ebp]
	push	eax
	call	_err_clear
	add	esp, 16					; 00000010H
$eva_err$70559:
	mov	ecx, DWORD PTR _cntxt$[ebp]
	cmp	DWORD PTR [ecx+29872], 0
	je	SHORT $L70721
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	eax, DWORD PTR [edx+29900]
	push	eax
	push	OFFSET FLAT:$SG70722
	push	OFFSET FLAT:$SG70723
	mov	ecx, DWORD PTR _cntxt$[ebp]
	push	ecx
	call	_err_add_context
	add	esp, 16					; 00000010H
$L70721:
	mov	edx, DWORD PTR _htmlbuf$[ebp]
	push	edx
	call	_mem_free
	add	esp, 4
	mov	DWORD PTR _htmlbuf$[ebp], 0
	mov	eax, DWORD PTR _name$[ebp]
	push	eax
	call	_mem_free
	add	esp, 4
	mov	DWORD PTR _name$[ebp], 0
	mov	ecx, DWORD PTR _form$[ebp]
	mov	edx, DWORD PTR _step$[ebp]
	mov	DWORD PTR [ecx+176], edx
	mov	eax, DWORD PTR _cntxt$[ebp]
	xor	ecx, ecx
	cmp	DWORD PTR [eax+29872], 0
	setne	cl
	mov	eax, ecx

; 671  : }

	mov	esp, ebp
	pop	ebp
	ret	0
$L70791:
	DD	$L70552
	DD	$L70683
	DD	$L70560
	DD	$L70566
	DD	$L70713
	DD	$L70716
	DD	$L70710
	DD	$L70710
_ctrl_add_input ENDP
_TEXT	ENDS
END
