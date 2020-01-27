	TITLE	D:\Travail\ABI\EVA\V4.0\CGI\Brunix-2016\ctrl_input_rel.c
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
PUBLIC	_ctrl_relation_optionslist
EXTRN	_qry_obj_label:NEAR
EXTRN	_form_eval_fieldexpr:NEAR
EXTRN	_sprintf:NEAR
EXTRN	_mem_free:NEAR
EXTRN	_put_value_fmt:NEAR
EXTRN	_strtoul:NEAR
EXTRN	_qry_obj_idfield:NEAR
EXTRN	_dynbuf_add:NEAR
EXTRN	_dynbuf_add3:NEAR
EXTRN	_dynbuf_add3_int:NEAR
EXTRN	_dyntab_free:NEAR
EXTRN	_dyntab_sz:NEAR
EXTRN	_dyntab_val:NEAR
EXTRN	_dyntab_cell:NEAR
EXTRN	_dyntab_copy:NEAR
EXTRN	_dyntab_add:NEAR
EXTRN	_strcmp:NEAR
EXTRN	_err_add_context:NEAR
EXTRN	_err_clear:NEAR
EXTRN	_dyntab_field_val:NEAR
EXTRN	_dyntab_group:NEAR
EXTRN	_dyntab_sort:NEAR
EXTRN	_qsort_col1:NEAR
_BSS	SEGMENT
$SG70224 DB	01H DUP (?)
	ALIGN	4

$SG70259 DB	01H DUP (?)
	ALIGN	4

$SG70314 DB	01H DUP (?)
_BSS	ENDS
_DATA	SEGMENT
$SG70223 DB	'_EVA_INPUTMODE', 00H
	ORG $+1
$SG70226 DB	'_EVA_COMBO_FMT', 00H
	ORG $+1
$SG70227 DB	'_EVA_LIST_FMT', 00H
	ORG $+2
$SG70236 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70249 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70260 DB	'#NAR# : ', 00H
	ORG $+3
$SG70262 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70267 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70273 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70284 DB	' | ', 00H
$SG70286 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70288 DB	'DISTINCT', 00H
	ORG $+3
$SG70295 DB	'+', 00H
	ORG $+2
$SG70297 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70299 DB	'D:\Travail\ABI\EVA\V4.0\CGI\Brunix-2016\ctrl_input_rel.c'
	DB	00H
	ORG $+3
$SG70300 DB	'ctrl_relation_optionslist', 00H
	ORG $+2
$SG70310 DB	'D:\Travail\ABI\EVA\V4.0\CGI\Brunix-2016\ctrl_input_rel.c'
	DB	00H
	ORG $+3
$SG70311 DB	'ctrl_relation_optionslist', 00H
	ORG $+2
$SG70315 DB	'Fiche n', 0b0H, ' ', 00H
	ORG $+2
$SG70317 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70320 DB	' ...', 00H
	ORG $+3
$SG70325 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70331 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70333 DB	'D:\Travail\ABI\EVA\V4.0\CGI\Brunix-2016\ctrl_input_rel.c'
	DB	00H
	ORG $+3
$SG70334 DB	'ctrl_relation_optionslist', 00H
	ORG $+2
$SG70336 DB	'D:\Travail\ABI\EVA\V4.0\CGI\Brunix-2016\ctrl_input_rel.c'
	DB	00H
	ORG $+3
$SG70337 DB	'ctrl_relation_optionslist', 00H
_DATA	ENDS
_TEXT	SEGMENT
_cntxt$ = 8
_i_ctrl$ = 12
_optlist$ = 16
_form$ = -12
_ctrl$ = -80
_tbl$ = -36
_data$ = -32
_objdata$ = -68
_val$ = -4
_i$ = -44
_j$ = -48
_k$ = -76
_inmode$ = -72
_b_fmt$ = -8
_nbcols$ = -40
_id$70241 = -84
_idobj$70253 = -88
_fmt$70280 = -92
_ctrl_relation_optionslist PROC NEAR

; 28   : ){

	push	ebp
	mov	ebp, esp
	sub	esp, 104				; 00000068H

; 29   : 	EVA_form *form = cntxt->form;

	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	ecx, DWORD PTR [eax+80]
	mov	DWORD PTR _form$[ebp], ecx

; 30   : 	EVA_ctrl *ctrl = form->ctrl + i_ctrl;

	mov	edx, DWORD PTR _i_ctrl$[ebp]
	imul	edx, 480				; 000001e0H
	mov	eax, DWORD PTR _form$[ebp]
	mov	ecx, DWORD PTR [eax]
	add	ecx, edx
	mov	DWORD PTR _ctrl$[ebp], ecx

; 31   : 	ObjTableFormat *tbl = ctrl->objtbl;

	mov	edx, DWORD PTR _ctrl$[ebp]
	mov	eax, DWORD PTR [edx+232]
	mov	DWORD PTR _tbl$[ebp], eax

; 32   : 	DynTable data = { 0 };

	mov	DWORD PTR _data$[ebp], 0
	xor	ecx, ecx
	mov	DWORD PTR _data$[ebp+4], ecx
	mov	DWORD PTR _data$[ebp+8], ecx
	mov	DWORD PTR _data$[ebp+12], ecx
	mov	DWORD PTR _data$[ebp+16], ecx

; 33   : 	DynTable objdata = { 0 };

	mov	DWORD PTR _objdata$[ebp], 0
	xor	edx, edx
	mov	DWORD PTR _objdata$[ebp+4], edx
	mov	DWORD PTR _objdata$[ebp+8], edx
	mov	DWORD PTR _objdata$[ebp+12], edx
	mov	DWORD PTR _objdata$[ebp+16], edx

; 34   : 	DynBuffer *val = NULL;

	mov	DWORD PTR _val$[ebp], 0

; 35   : 	unsigned long i, j, k;
; 36   : 	char *inmode = CTRL_ATTR_VAL(INPUTMODE);

	cmp	DWORD PTR _ctrl$[ebp], 0
	je	SHORT $L70930
	push	0
	push	-1
	push	OFFSET FLAT:$SG70223
	mov	eax, DWORD PTR _ctrl$[ebp]
	add	eax, 44					; 0000002cH
	push	eax
	call	_dyntab_field_val
	add	esp, 16					; 00000010H
	mov	DWORD PTR -96+[ebp], eax
	jmp	SHORT $L70931
$L70930:
	mov	DWORD PTR -96+[ebp], OFFSET FLAT:$SG70224
$L70931:
	mov	ecx, DWORD PTR -96+[ebp]
	mov	DWORD PTR _inmode$[ebp], ecx

; 37   : 	int b_fmt = !strcmp(inmode, "_EVA_COMBO_FMT") || !strcmp(inmode, "_EVA_LIST_FMT");

	push	OFFSET FLAT:$SG70226
	mov	edx, DWORD PTR _inmode$[ebp]
	push	edx
	call	_strcmp
	add	esp, 8
	test	eax, eax
	je	SHORT $L70932
	push	OFFSET FLAT:$SG70227
	mov	eax, DWORD PTR _inmode$[ebp]
	push	eax
	call	_strcmp
	add	esp, 8
	test	eax, eax
	je	SHORT $L70932
	mov	DWORD PTR -100+[ebp], 0
	jmp	SHORT $L70933
$L70932:
	mov	DWORD PTR -100+[ebp], 1
$L70933:
	mov	ecx, DWORD PTR -100+[ebp]
	mov	DWORD PTR _b_fmt$[ebp], ecx

; 38   : 	unsigned long nbcols = tbl->field.nbrows;

	mov	edx, DWORD PTR _tbl$[ebp]
	mov	eax, DWORD PTR [edx+380]
	mov	DWORD PTR _nbcols$[ebp], eax

; 39   : 	if(tbl->colbrk > 1 && tbl->colbrk <= tbl->field.nbrows) nbcols = tbl->colbrk - 1;

	mov	ecx, DWORD PTR _tbl$[ebp]
	cmp	DWORD PTR [ecx+660], 1
	jbe	SHORT $L70229
	mov	edx, DWORD PTR _tbl$[ebp]
	mov	eax, DWORD PTR _tbl$[ebp]
	mov	ecx, DWORD PTR [edx+660]
	cmp	ecx, DWORD PTR [eax+380]
	ja	SHORT $L70229
	mov	edx, DWORD PTR _tbl$[ebp]
	mov	eax, DWORD PTR [edx+660]
	sub	eax, 1
	mov	DWORD PTR _nbcols$[ebp], eax
$L70229:

; 40   : 
; 41   : 	/* Initialize list status & values : blank line & objects ids */
; 42   : 	if(tbl->input[0] && !ctrl->val.nbrows) tbl->status |= TblCtrl_opensearch | TblCtrl_opensel;

	mov	ecx, DWORD PTR _tbl$[ebp]
	mov	edx, DWORD PTR [ecx+100]
	movsx	eax, BYTE PTR [edx]
	test	eax, eax
	je	SHORT $L70230
	mov	ecx, DWORD PTR _ctrl$[ebp]
	cmp	DWORD PTR [ecx+64], 0
	jne	SHORT $L70230
	mov	edx, DWORD PTR _tbl$[ebp]
	mov	eax, DWORD PTR [edx+32]
	or	eax, 544				; 00000220H
	mov	ecx, DWORD PTR _tbl$[ebp]
	mov	DWORD PTR [ecx+32], eax
$L70230:

; 43   : 	for(i = 0; i < tbl->idobj.nbrows; i++) DYNTAB_SET_CELL(optlist, i, 0, &tbl->idobj, i, 0);

	mov	DWORD PTR _i$[ebp], 0
	jmp	SHORT $L70231
$L70232:
	mov	edx, DWORD PTR _i$[ebp]
	add	edx, 1
	mov	DWORD PTR _i$[ebp], edx
$L70231:
	mov	eax, DWORD PTR _tbl$[ebp]
	mov	ecx, DWORD PTR _i$[ebp]
	cmp	ecx, DWORD PTR [eax+184]
	jae	SHORT $L70233
	push	0
	push	0
	mov	edx, DWORD PTR _i$[ebp]
	push	edx
	mov	eax, DWORD PTR _tbl$[ebp]
	add	eax, 184				; 000000b8H
	push	eax
	call	_dyntab_cell
	add	esp, 12					; 0000000cH
	push	eax
	push	0
	mov	ecx, DWORD PTR _i$[ebp]
	push	ecx
	mov	edx, DWORD PTR _optlist$[ebp]
	push	edx
	call	_dyntab_copy
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L70234
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29872], OFFSET FLAT:$SG70236
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 43		; 0000002bH
	jmp	$eva_err$70237
$L70234:
	jmp	SHORT $L70232
$L70233:

; 44   : 
; 45   : 	/* Add objects in ctrl->val not in optlist */
; 46   : 	for(i = 0; i < ctrl->val.nbrows; i++)

	mov	DWORD PTR _i$[ebp], 0
	jmp	SHORT $L70238
$L70239:
	mov	edx, DWORD PTR _i$[ebp]
	add	edx, 1
	mov	DWORD PTR _i$[ebp], edx
$L70238:
	mov	eax, DWORD PTR _ctrl$[ebp]
	mov	ecx, DWORD PTR _i$[ebp]
	cmp	ecx, DWORD PTR [eax+64]
	jae	$L70240

; 48   : 		char *id = dyntab_val(&ctrl->val, i, 0);

	push	0
	mov	edx, DWORD PTR _i$[ebp]
	push	edx
	mov	eax, DWORD PTR _ctrl$[ebp]
	add	eax, 64					; 00000040H
	push	eax
	call	_dyntab_val
	add	esp, 12					; 0000000cH
	mov	DWORD PTR _id$70241[ebp], eax

; 49   : 		if(!*id) continue;

	mov	ecx, DWORD PTR _id$70241[ebp]
	movsx	edx, BYTE PTR [ecx]
	test	edx, edx
	jne	SHORT $L70242
	jmp	SHORT $L70239
$L70242:

; 50   : 		for(j = 0; j < optlist->nbrows && strcmp(id, dyntab_val(optlist, j, 0)); j++);

	mov	DWORD PTR _j$[ebp], 0
	jmp	SHORT $L70243
$L70244:
	mov	eax, DWORD PTR _j$[ebp]
	add	eax, 1
	mov	DWORD PTR _j$[ebp], eax
$L70243:
	mov	ecx, DWORD PTR _optlist$[ebp]
	mov	edx, DWORD PTR _j$[ebp]
	cmp	edx, DWORD PTR [ecx]
	jae	SHORT $L70245
	push	0
	mov	eax, DWORD PTR _j$[ebp]
	push	eax
	mov	ecx, DWORD PTR _optlist$[ebp]
	push	ecx
	call	_dyntab_val
	add	esp, 12					; 0000000cH
	push	eax
	mov	edx, DWORD PTR _id$70241[ebp]
	push	edx
	call	_strcmp
	add	esp, 8
	test	eax, eax
	je	SHORT $L70245
	jmp	SHORT $L70244
$L70245:

; 51   : 		if(j == optlist->nbrows) DYNTAB_SET_CELL(optlist, j ? j : 1, 0, &ctrl->val, i, 0);

	mov	eax, DWORD PTR _optlist$[ebp]
	mov	ecx, DWORD PTR _j$[ebp]
	cmp	ecx, DWORD PTR [eax]
	jne	SHORT $L70247
	cmp	DWORD PTR _j$[ebp], 0
	je	SHORT $L70934
	mov	edx, DWORD PTR _j$[ebp]
	mov	DWORD PTR -104+[ebp], edx
	jmp	SHORT $L70935
$L70934:
	mov	DWORD PTR -104+[ebp], 1
$L70935:
	push	0
	push	0
	mov	eax, DWORD PTR _i$[ebp]
	push	eax
	mov	ecx, DWORD PTR _ctrl$[ebp]
	add	ecx, 64					; 00000040H
	push	ecx
	call	_dyntab_cell
	add	esp, 12					; 0000000cH
	push	eax
	push	0
	mov	edx, DWORD PTR -104+[ebp]
	push	edx
	mov	eax, DWORD PTR _optlist$[ebp]
	push	eax
	call	_dyntab_copy
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L70247
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29872], OFFSET FLAT:$SG70249
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 51		; 00000033H
	jmp	$eva_err$70237
$L70247:

; 52   : 	}

	jmp	$L70239
$L70240:

; 53   : 
; 54   : 	/* Set labels for values */
; 55   : 	for(i = 0; i < optlist->nbrows; i++)

	mov	DWORD PTR _i$[ebp], 0
	jmp	SHORT $L70250
$L70251:
	mov	eax, DWORD PTR _i$[ebp]
	add	eax, 1
	mov	DWORD PTR _i$[ebp], eax
$L70250:
	mov	ecx, DWORD PTR _optlist$[ebp]
	mov	edx, DWORD PTR _i$[ebp]
	cmp	edx, DWORD PTR [ecx]
	jae	$L70252

; 57   : 		unsigned long idobj = DYNTAB_TOULRC(optlist, i, 0);

	push	10					; 0000000aH
	push	0
	push	0
	mov	eax, DWORD PTR _i$[ebp]
	push	eax
	mov	ecx, DWORD PTR _optlist$[ebp]
	push	ecx
	call	_dyntab_val
	add	esp, 12					; 0000000cH
	push	eax
	call	_strtoul
	add	esp, 12					; 0000000cH
	mov	DWORD PTR _idobj$70253[ebp], eax

; 58   : 		if(val) val->cnt = 0;

	cmp	DWORD PTR _val$[ebp], 0
	je	SHORT $L70255
	mov	edx, DWORD PTR _val$[ebp]
	mov	DWORD PTR [edx+4], 0
$L70255:

; 59   : 
; 60   : 		/* Handle invalid relation */
; 61   : 		if(!idobj)

	cmp	DWORD PTR _idobj$70253[ebp], 0
	jne	$L70256

; 63   : 			DYNBUF_ADD3_CELL(&val, "#NAR# : ", optlist, i, 0, NO_CONV, "");

	push	0
	push	OFFSET FLAT:$SG70259
	push	0
	push	0
	push	0
	mov	eax, DWORD PTR _i$[ebp]
	push	eax
	mov	ecx, DWORD PTR _optlist$[ebp]
	push	ecx
	call	_dyntab_sz
	add	esp, 12					; 0000000cH
	push	eax
	push	0
	mov	edx, DWORD PTR _i$[ebp]
	push	edx
	mov	eax, DWORD PTR _optlist$[ebp]
	push	eax
	call	_dyntab_val
	add	esp, 12					; 0000000cH
	push	eax
	push	8
	push	OFFSET FLAT:$SG70260
	lea	ecx, DWORD PTR _val$[ebp]
	push	ecx
	call	_dynbuf_add3
	add	esp, 36					; 00000024H
	test	eax, eax
	je	SHORT $L70258
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29872], OFFSET FLAT:$SG70262
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 63		; 0000003fH
	jmp	$eva_err$70237
$L70258:

; 64   : 			DYNTAB_ADD_BUF(optlist, i, 1, val);

	cmp	DWORD PTR _val$[ebp], 0
	je	SHORT $L70263
	mov	ecx, DWORD PTR _val$[ebp]
	cmp	DWORD PTR [ecx+4], 0
	je	SHORT $L70263
	push	0
	push	0
	mov	edx, DWORD PTR _val$[ebp]
	mov	eax, DWORD PTR [edx+4]
	push	eax
	mov	ecx, DWORD PTR _val$[ebp]
	add	ecx, 8
	push	ecx
	push	1
	mov	edx, DWORD PTR _i$[ebp]
	push	edx
	mov	eax, DWORD PTR _optlist$[ebp]
	push	eax
	call	_dyntab_add
	add	esp, 28					; 0000001cH
	test	eax, eax
	je	SHORT $L70265
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29872], OFFSET FLAT:$SG70267
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 64		; 00000040H
	jmp	$eva_err$70237
$L70265:
	jmp	SHORT $L70271
$L70263:
	push	0
	push	0
	push	0
	push	0
	push	1
	mov	eax, DWORD PTR _i$[ebp]
	push	eax
	mov	ecx, DWORD PTR _optlist$[ebp]
	push	ecx
	call	_dyntab_add
	add	esp, 28					; 0000001cH
	test	eax, eax
	je	SHORT $L70271
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29872], OFFSET FLAT:$SG70273
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 64		; 00000040H
	jmp	$eva_err$70237
$L70271:

; 65   : 			continue;

	jmp	$L70251
$L70256:

; 70   : 			/* Read object data */
; 71   : 			if(qry_obj_idfield(cntxt, &objdata, idobj, 0)) STACK_ERROR;

	push	0
	mov	ecx, DWORD PTR _idobj$70253[ebp]
	push	ecx
	lea	edx, DWORD PTR _objdata$[ebp]
	push	edx
	mov	eax, DWORD PTR _cntxt$[ebp]
	push	eax
	call	_qry_obj_idfield
	add	esp, 16					; 00000010H
	test	eax, eax
	je	SHORT $L70275
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 71		; 00000047H
	jmp	$eva_err$70237
$L70275:

; 72   : 
; 73   : 			/* Handle input format */
; 74   : 			if(b_fmt && nbcols)

	cmp	DWORD PTR _b_fmt$[ebp], 0
	je	$L70276
	cmp	DWORD PTR _nbcols$[ebp], 0
	je	$L70276

; 76   : 				/* Formated values : loop on table fields definition */
; 77   : 				for(j = 0; j < nbcols; j++)

	mov	DWORD PTR _j$[ebp], 0
	jmp	SHORT $L70277
$L70278:
	mov	edx, DWORD PTR _j$[ebp]
	add	edx, 1
	mov	DWORD PTR _j$[ebp], edx
$L70277:
	mov	eax, DWORD PTR _j$[ebp]
	cmp	eax, DWORD PTR _nbcols$[ebp]
	jae	$L70279

; 79   : 					char *fmt = dyntab_val(&tbl->format, j, 0);

	push	0
	mov	ecx, DWORD PTR _j$[ebp]
	push	ecx
	mov	edx, DWORD PTR _tbl$[ebp]
	add	edx, 400				; 00000190H
	push	edx
	call	_dyntab_val
	add	esp, 12					; 0000000cH
	mov	DWORD PTR _fmt$70280[ebp], eax

; 80   : 					/* Handle field separator */
; 81   : 					if(j) DYNBUF_ADD_STR(&val, " | ");

	cmp	DWORD PTR _j$[ebp], 0
	je	SHORT $L70283
	push	0
	push	0
	push	3
	push	OFFSET FLAT:$SG70284
	lea	eax, DWORD PTR _val$[ebp]
	push	eax
	call	_dynbuf_add
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L70283
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29872], OFFSET FLAT:$SG70286
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 81		; 00000051H
	jmp	$eva_err$70237
$L70283:

; 82   : 
; 83   : 					/* Evaluate field expression */
; 84   : 					if(form_eval_fieldexpr(cntxt, &data, 0, idobj, DYNTAB_VAL_SZ(&tbl->field, j, 0), &objdata, 0)) STACK_ERROR;

	push	0
	lea	eax, DWORD PTR _objdata$[ebp]
	push	eax
	push	0
	mov	ecx, DWORD PTR _j$[ebp]
	push	ecx
	mov	edx, DWORD PTR _tbl$[ebp]
	add	edx, 380				; 0000017cH
	push	edx
	call	_dyntab_sz
	add	esp, 12					; 0000000cH
	push	eax
	push	0
	mov	eax, DWORD PTR _j$[ebp]
	push	eax
	mov	ecx, DWORD PTR _tbl$[ebp]
	add	ecx, 380				; 0000017cH
	push	ecx
	call	_dyntab_val
	add	esp, 12					; 0000000cH
	push	eax
	mov	edx, DWORD PTR _idobj$70253[ebp]
	push	edx
	push	0
	lea	eax, DWORD PTR _data$[ebp]
	push	eax
	mov	ecx, DWORD PTR _cntxt$[ebp]
	push	ecx
	call	_form_eval_fieldexpr
	add	esp, 32					; 00000020H
	test	eax, eax
	je	SHORT $L70287
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 84		; 00000054H
	jmp	$eva_err$70237
$L70287:

; 85   : 					dyntab_group(&data, "DISTINCT");

	push	OFFSET FLAT:$SG70288
	lea	eax, DWORD PTR _data$[ebp]
	push	eax
	call	_dyntab_group
	add	esp, 8

; 86   : 
; 87   : 					/* Output each value formatted */
; 88   : 					for(k = 0; k < data.nbrows; k++)

	mov	DWORD PTR _k$[ebp], 0
	jmp	SHORT $L70289
$L70290:
	mov	ecx, DWORD PTR _k$[ebp]
	add	ecx, 1
	mov	DWORD PTR _k$[ebp], ecx
$L70289:
	mov	edx, DWORD PTR _k$[ebp]
	cmp	edx, DWORD PTR _data$[ebp]
	jae	$L70291

; 90   : 						/* Handle value separator */
; 91   : 						if(k) DYNBUF_ADD_STR(&val, "+");

	cmp	DWORD PTR _k$[ebp], 0
	je	SHORT $L70294
	push	0
	push	0
	push	1
	push	OFFSET FLAT:$SG70295
	lea	eax, DWORD PTR _val$[ebp]
	push	eax
	call	_dynbuf_add
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L70294
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29872], OFFSET FLAT:$SG70297
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 91		; 0000005bH
	jmp	$eva_err$70237
$L70294:

; 92   : 						if(put_value_fmt(cntxt, &val, DYNTAB_VAL_SZ(&data, k, 0), fmt)) CLEAR_ERROR;

	mov	eax, DWORD PTR _fmt$70280[ebp]
	push	eax
	push	0
	mov	ecx, DWORD PTR _k$[ebp]
	push	ecx
	lea	edx, DWORD PTR _data$[ebp]
	push	edx
	call	_dyntab_sz
	add	esp, 12					; 0000000cH
	push	eax
	push	0
	mov	eax, DWORD PTR _k$[ebp]
	push	eax
	lea	ecx, DWORD PTR _data$[ebp]
	push	ecx
	call	_dyntab_val
	add	esp, 12					; 0000000cH
	push	eax
	lea	edx, DWORD PTR _val$[ebp]
	push	edx
	mov	eax, DWORD PTR _cntxt$[ebp]
	push	eax
	call	_put_value_fmt
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L70298
	push	92					; 0000005cH
	push	OFFSET FLAT:$SG70299
	push	OFFSET FLAT:$SG70300
	mov	ecx, DWORD PTR _cntxt$[ebp]
	push	ecx
	call	_err_clear
	add	esp, 16					; 00000010H
$L70298:

; 93   : 					}

	jmp	$L70290
$L70291:

; 94   : 				}

	jmp	$L70278
$L70279:

; 96   : 			else

	jmp	SHORT $L70309
$L70276:

; 97   : 				/* Standard format : use object title */
; 98   : 				if(qry_obj_label(cntxt, NULL, NULL, NULL, &val, NULL, NULL, NULL, NULL, 0, &objdata, 0))

	push	0
	lea	edx, DWORD PTR _objdata$[ebp]
	push	edx
	push	0
	push	0
	push	0
	push	0
	push	0
	lea	eax, DWORD PTR _val$[ebp]
	push	eax
	push	0
	push	0
	push	0
	mov	ecx, DWORD PTR _cntxt$[ebp]
	push	ecx
	call	_qry_obj_label
	add	esp, 48					; 00000030H
	test	eax, eax
	je	SHORT $L70309

; 99   : 						CLEAR_ERROR;

	push	99					; 00000063H
	push	OFFSET FLAT:$SG70310
	push	OFFSET FLAT:$SG70311
	mov	edx, DWORD PTR _cntxt$[ebp]
	push	edx
	call	_err_clear
	add	esp, 16					; 00000010H
$L70309:

; 100  : 			if(!val) DYNBUF_ADD3_INT(&val, "Fiche n° ", idobj, "")

	cmp	DWORD PTR _val$[ebp], 0
	jne	SHORT $L70312
	push	0
	push	OFFSET FLAT:$SG70314
	mov	eax, DWORD PTR _idobj$70253[ebp]
	push	eax
	push	9
	push	OFFSET FLAT:$SG70315
	lea	ecx, DWORD PTR _val$[ebp]
	push	ecx
	call	_dynbuf_add3_int
	add	esp, 24					; 00000018H
	test	eax, eax
	je	SHORT $L70313
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29872], OFFSET FLAT:$SG70317
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 100		; 00000064H
	jmp	$eva_err$70237
$L70313:

; 101  : 			else if(val->cnt > 100) val->cnt = 97 + sprintf(val->data + 97, " ...");

	jmp	SHORT $L70319
$L70312:
	mov	ecx, DWORD PTR _val$[ebp]
	cmp	DWORD PTR [ecx+4], 100			; 00000064H
	jbe	SHORT $L70319
	push	OFFSET FLAT:$SG70320
	mov	edx, DWORD PTR _val$[ebp]
	add	edx, 105				; 00000069H
	push	edx
	call	_sprintf
	add	esp, 8
	add	eax, 97					; 00000061H
	mov	ecx, DWORD PTR _val$[ebp]
	mov	DWORD PTR [ecx+4], eax
$L70319:

; 102  : 			DYNTAB_ADD_BUF(optlist, i, 1, val);

	cmp	DWORD PTR _val$[ebp], 0
	je	SHORT $L70321
	mov	edx, DWORD PTR _val$[ebp]
	cmp	DWORD PTR [edx+4], 0
	je	SHORT $L70321
	push	0
	push	0
	mov	eax, DWORD PTR _val$[ebp]
	mov	ecx, DWORD PTR [eax+4]
	push	ecx
	mov	edx, DWORD PTR _val$[ebp]
	add	edx, 8
	push	edx
	push	1
	mov	eax, DWORD PTR _i$[ebp]
	push	eax
	mov	ecx, DWORD PTR _optlist$[ebp]
	push	ecx
	call	_dyntab_add
	add	esp, 28					; 0000001cH
	test	eax, eax
	je	SHORT $L70323
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29872], OFFSET FLAT:$SG70325
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 102		; 00000066H
	jmp	SHORT $eva_err$70237
$L70323:
	jmp	SHORT $L70329
$L70321:
	push	0
	push	0
	push	0
	push	0
	push	1
	mov	ecx, DWORD PTR _i$[ebp]
	push	ecx
	mov	edx, DWORD PTR _optlist$[ebp]
	push	edx
	call	_dyntab_add
	add	esp, 28					; 0000001cH
	test	eax, eax
	je	SHORT $L70329
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29872], OFFSET FLAT:$SG70331
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 102		; 00000066H
	jmp	SHORT $eva_err$70237
$L70329:

; 104  : 	}

	jmp	$L70251
$L70252:

; 105  : 	dyntab_sort(optlist, qsort_col1);

	push	OFFSET FLAT:_qsort_col1
	mov	edx, DWORD PTR _optlist$[ebp]
	push	edx
	call	_dyntab_sort
	add	esp, 8
$eva_noerr$70332:

; 106  : 
; 107  : 	RETURN_OK_CLEANUP;

	push	0
	push	OFFSET FLAT:$SG70333
	push	OFFSET FLAT:$SG70334
	mov	eax, DWORD PTR _cntxt$[ebp]
	push	eax
	call	_err_clear
	add	esp, 16					; 00000010H
$eva_err$70237:
	mov	ecx, DWORD PTR _cntxt$[ebp]
	cmp	DWORD PTR [ecx+29872], 0
	je	SHORT $L70335
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	eax, DWORD PTR [edx+29900]
	push	eax
	push	OFFSET FLAT:$SG70336
	push	OFFSET FLAT:$SG70337
	mov	ecx, DWORD PTR _cntxt$[ebp]
	push	ecx
	call	_err_add_context
	add	esp, 16					; 00000010H
$L70335:
	mov	edx, DWORD PTR _val$[ebp]
	push	edx
	call	_mem_free
	add	esp, 4
	mov	DWORD PTR _val$[ebp], 0
	lea	eax, DWORD PTR _objdata$[ebp]
	push	eax
	call	_dyntab_free
	add	esp, 4
	lea	ecx, DWORD PTR _data$[ebp]
	push	ecx
	call	_dyntab_free
	add	esp, 4
	mov	edx, DWORD PTR _cntxt$[ebp]
	xor	eax, eax
	cmp	DWORD PTR [edx+29872], 0
	setne	al

; 108  : }

	mov	esp, ebp
	pop	ebp
	ret	0
_ctrl_relation_optionslist ENDP
_TEXT	ENDS
PUBLIC	_ctrl_relation_searchlist
EXTRN	_table_word_search:NEAR
EXTRN	_sql_exec_query:NEAR
EXTRN	_sql_get_table:NEAR
_DATA	SEGMENT
	ORG $+2
$SG70354 DB	'SELECT DISTINCT IdObj FROM IdList ORDER BY IdObj DESC LI'
	DB	'MIT 200', 00H
$SG70355 DB	'D:\Travail\ABI\EVA\V4.0\CGI\Brunix-2016\ctrl_input_rel.c'
	DB	00H
	ORG $+3
$SG70356 DB	'ctrl_relation_searchlist', 00H
	ORG $+3
$SG70358 DB	'DROP TABLE IF EXISTS IdList', 00H
$SG70359 DB	'D:\Travail\ABI\EVA\V4.0\CGI\Brunix-2016\ctrl_input_rel.c'
	DB	00H
	ORG $+3
$SG70360 DB	'ctrl_relation_searchlist', 00H
	ORG $+3
$SG70361 DB	'D:\Travail\ABI\EVA\V4.0\CGI\Brunix-2016\ctrl_input_rel.c'
	DB	00H
	ORG $+3
$SG70362 DB	'ctrl_relation_searchlist', 00H
	ORG $+3
$SG70365 DB	'D:\Travail\ABI\EVA\V4.0\CGI\Brunix-2016\ctrl_input_rel.c'
	DB	00H
	ORG $+3
$SG70366 DB	'ctrl_relation_searchlist', 00H
_DATA	ENDS
_TEXT	SEGMENT
_cntxt$ = 8
_i_ctrl$ = 12
_form$ = -4
_ctrl$ = -12
_tbl$ = -8
_ctrl_relation_searchlist PROC NEAR

; 121  : ){

	push	ebp
	mov	ebp, esp
	sub	esp, 12					; 0000000cH

; 122  : 	EVA_form *form = cntxt->form;

	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	ecx, DWORD PTR [eax+80]
	mov	DWORD PTR _form$[ebp], ecx

; 123  : 	EVA_ctrl *ctrl = form->ctrl + i_ctrl;

	mov	edx, DWORD PTR _i_ctrl$[ebp]
	imul	edx, 480				; 000001e0H
	mov	eax, DWORD PTR _form$[ebp]
	mov	ecx, DWORD PTR [eax]
	add	ecx, edx
	mov	DWORD PTR _ctrl$[ebp], ecx

; 124  : 	ObjTableFormat *tbl = ctrl->objtbl;

	mov	edx, DWORD PTR _ctrl$[ebp]
	mov	eax, DWORD PTR [edx+232]
	mov	DWORD PTR _tbl$[ebp], eax

; 125  : 
; 126  : 	/* Exec query for objects if not executed */
; 127  : 	if(tbl->idobj.nbcols) RETURN_OK;

	mov	ecx, DWORD PTR _tbl$[ebp]
	cmp	DWORD PTR [ecx+192], 0
	je	SHORT $L70350
	jmp	$eva_noerr$70351
$L70350:

; 128  : 
; 129  : 	if(table_word_search(cntxt, i_ctrl) ||
; 130  : 		sql_exec_query(cntxt, "SELECT DISTINCT IdObj FROM IdList ORDER BY IdObj DESC LIMIT 200") ||
; 131  : 		sql_get_table(cntxt, &tbl->idobj, 2)) CLEAR_ERROR;

	mov	edx, DWORD PTR _i_ctrl$[ebp]
	push	edx
	mov	eax, DWORD PTR _cntxt$[ebp]
	push	eax
	call	_table_word_search
	add	esp, 8
	test	eax, eax
	jne	SHORT $L70353
	push	OFFSET FLAT:$SG70354
	mov	ecx, DWORD PTR _cntxt$[ebp]
	push	ecx
	call	_sql_exec_query
	add	esp, 8
	test	eax, eax
	jne	SHORT $L70353
	push	2
	mov	edx, DWORD PTR _tbl$[ebp]
	add	edx, 184				; 000000b8H
	push	edx
	mov	eax, DWORD PTR _cntxt$[ebp]
	push	eax
	call	_sql_get_table
	add	esp, 12					; 0000000cH
	test	eax, eax
	je	SHORT $L70352
$L70353:
	push	131					; 00000083H
	push	OFFSET FLAT:$SG70355
	push	OFFSET FLAT:$SG70356
	mov	ecx, DWORD PTR _cntxt$[ebp]
	push	ecx
	call	_err_clear
	add	esp, 16					; 00000010H
$L70352:

; 132  : 	if(sql_exec_query(cntxt, "DROP TABLE IF EXISTS IdList")) CLEAR_ERROR;

	push	OFFSET FLAT:$SG70358
	mov	edx, DWORD PTR _cntxt$[ebp]
	push	edx
	call	_sql_exec_query
	add	esp, 8
	test	eax, eax
	je	SHORT $L70357
	push	132					; 00000084H
	push	OFFSET FLAT:$SG70359
	push	OFFSET FLAT:$SG70360
	mov	eax, DWORD PTR _cntxt$[ebp]
	push	eax
	call	_err_clear
	add	esp, 16					; 00000010H
$L70357:

; 133  : 	tbl->idobj.nbcols = 1;

	mov	ecx, DWORD PTR _tbl$[ebp]
	mov	DWORD PTR [ecx+192], 1
$eva_noerr$70351:

; 134  : 
; 135  : 	RETURN_OK_CLEANUP;

	push	0
	push	OFFSET FLAT:$SG70361
	push	OFFSET FLAT:$SG70362
	mov	edx, DWORD PTR _cntxt$[ebp]
	push	edx
	call	_err_clear
	add	esp, 16					; 00000010H
$eva_err$70363:
	mov	eax, DWORD PTR _cntxt$[ebp]
	cmp	DWORD PTR [eax+29872], 0
	je	SHORT $L70364
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	edx, DWORD PTR [ecx+29900]
	push	edx
	push	OFFSET FLAT:$SG70365
	push	OFFSET FLAT:$SG70366
	mov	eax, DWORD PTR _cntxt$[ebp]
	push	eax
	call	_err_add_context
	add	esp, 16					; 00000010H
$L70364:
	mov	ecx, DWORD PTR _cntxt$[ebp]
	xor	eax, eax
	cmp	DWORD PTR [ecx+29872], 0
	setne	al

; 136  : }

	mov	esp, ebp
	pop	ebp
	ret	0
_ctrl_relation_searchlist ENDP
_TEXT	ENDS
PUBLIC	_handle_searchlist_selection
EXTRN	_cgi_filter_values:NEAR
EXTRN	_cgi_get_subfield:NEAR
EXTRN	_ctrl_add_value:NEAR
EXTRN	_ctrl_del_value:NEAR
EXTRN	_dyntab_cmp:NEAR
_BSS	SEGMENT
	ALIGN	4

$SG70405 DB	01H DUP (?)
	ALIGN	4

$SG70406 DB	01H DUP (?)
	ALIGN	4

$SG70414 DB	01H DUP (?)
_BSS	ENDS
_DATA	SEGMENT
	ORG $+3
$SG70382 DB	'No', 00H
	ORG $+1
$SG70386 DB	'SEL', 00H
$SG70395 DB	'SEL', 00H
$SG70415 DB	'D:\Travail\ABI\EVA\V4.0\CGI\Brunix-2016\ctrl_input_rel.c'
	DB	00H
	ORG $+3
$SG70416 DB	'handle_searchlist_selection', 00H
$SG70418 DB	'D:\Travail\ABI\EVA\V4.0\CGI\Brunix-2016\ctrl_input_rel.c'
	DB	00H
	ORG $+3
$SG70419 DB	'handle_searchlist_selection', 00H
_DATA	ENDS
_TEXT	SEGMENT
_cntxt$ = 8
_i_ctrl$ = 12
_form$ = -4
_ctrl$ = -64
_tbl$ = -8
_cgival$ = -32
_objdata$ = -52
_b_multiple$ = -56
_i$ = -12
_num$ = -60
_c$70397 = -68
_b_del$70398 = -72
_b_same$70404 = -76
_handle_searchlist_selection PROC NEAR

; 150  : ){

	push	ebp
	mov	ebp, esp
	sub	esp, 88					; 00000058H

; 151  : 	EVA_form *form = cntxt->form;

	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	ecx, DWORD PTR [eax+80]
	mov	DWORD PTR _form$[ebp], ecx

; 152  : 	EVA_ctrl *ctrl = form->ctrl + i_ctrl;

	mov	edx, DWORD PTR _i_ctrl$[ebp]
	imul	edx, 480				; 000001e0H
	mov	eax, DWORD PTR _form$[ebp]
	mov	ecx, DWORD PTR [eax]
	add	ecx, edx
	mov	DWORD PTR _ctrl$[ebp], ecx

; 153  : 	ObjTableFormat *tbl = ctrl->objtbl;

	mov	edx, DWORD PTR _ctrl$[ebp]
	mov	eax, DWORD PTR [edx+232]
	mov	DWORD PTR _tbl$[ebp], eax

; 154  : 	DynTable cgival = {0};

	mov	DWORD PTR _cgival$[ebp], 0
	xor	ecx, ecx
	mov	DWORD PTR _cgival$[ebp+4], ecx
	mov	DWORD PTR _cgival$[ebp+8], ecx
	mov	DWORD PTR _cgival$[ebp+12], ecx
	mov	DWORD PTR _cgival$[ebp+16], ecx

; 155  : 	DynTable objdata = { 0 };

	mov	DWORD PTR _objdata$[ebp], 0
	xor	edx, edx
	mov	DWORD PTR _objdata$[ebp+4], edx
	mov	DWORD PTR _objdata$[ebp+8], edx
	mov	DWORD PTR _objdata$[ebp+12], edx
	mov	DWORD PTR _objdata$[ebp+16], edx

; 156  : 	int b_multiple = ctrl->MULTIPLE[0] != 0 && strcmp("No", ctrl->MULTIPLE);

	mov	eax, DWORD PTR _ctrl$[ebp]
	mov	ecx, DWORD PTR [eax+344]
	movsx	edx, BYTE PTR [ecx]
	test	edx, edx
	je	SHORT $L70938
	mov	eax, DWORD PTR _ctrl$[ebp]
	mov	ecx, DWORD PTR [eax+344]
	push	ecx
	push	OFFSET FLAT:$SG70382
	call	_strcmp
	add	esp, 8
	test	eax, eax
	je	SHORT $L70938
	mov	DWORD PTR -80+[ebp], 1
	jmp	SHORT $L70939
$L70938:
	mov	DWORD PTR -80+[ebp], 0
$L70939:
	mov	edx, DWORD PTR -80+[ebp]
	mov	DWORD PTR _b_multiple$[ebp], edx

; 157  : 	unsigned long i, num = 0;

	mov	DWORD PTR _num$[ebp], 0

; 158  : 
; 159  : 	/* Detect changes in selection */
; 160  : 	CTRL_GET_CGI_SUBFIELD("SEL");

	push	0
	push	0
	push	0
	push	OFFSET FLAT:$SG70386
	mov	eax, DWORD PTR _ctrl$[ebp]
	push	eax
	lea	ecx, DWORD PTR _cgival$[ebp]
	push	ecx
	mov	edx, DWORD PTR _cntxt$[ebp]
	push	edx
	call	_cgi_get_subfield
	add	esp, 28					; 0000001cH
	test	eax, eax
	je	SHORT $L70385
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 160		; 000000a0H
	jmp	$eva_err$70387
$L70385:

; 161  : 	if(!(tbl->status & TblCtrl_opensel) || cntxt->cgibtn) RETURN_OK;

	mov	ecx, DWORD PTR _tbl$[ebp]
	mov	edx, DWORD PTR [ecx+32]
	and	edx, 512				; 00000200H
	test	edx, edx
	je	SHORT $L70389
	mov	eax, DWORD PTR _cntxt$[ebp]
	cmp	DWORD PTR [eax+29656], 0
	je	SHORT $L70388
$L70389:
	jmp	$eva_noerr$70390
$L70388:

; 162  : 	if(cgi_filter_values(cntxt, &objdata, 'M', DYNTAB_TOUL(&ctrl->id), DYNTAB_TOUL(&form->id_form), DYNTAB_TOUL(&form->id_obj),
; 163  : 								ctrl->FIELD, "SEL", 0, 0)) STACK_ERROR;

	push	0
	push	0
	push	OFFSET FLAT:$SG70395
	mov	ecx, DWORD PTR _ctrl$[ebp]
	mov	edx, DWORD PTR [ecx+280]
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
	push	10					; 0000000aH
	push	0
	push	0
	push	0
	mov	edx, DWORD PTR _ctrl$[ebp]
	push	edx
	call	_dyntab_val
	add	esp, 12					; 0000000cH
	push	eax
	call	_strtoul
	add	esp, 12					; 0000000cH
	push	eax
	push	77					; 0000004dH
	lea	eax, DWORD PTR _objdata$[ebp]
	push	eax
	mov	ecx, DWORD PTR _cntxt$[ebp]
	push	ecx
	call	_cgi_filter_values
	add	esp, 40					; 00000028H
	test	eax, eax
	je	SHORT $L70394
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 163		; 000000a3H
	jmp	$eva_err$70387
$L70394:

; 164  : 	if(dyntab_cmp(&cgival, 0, 0, &objdata, 0, 0) && cgival.nbrows == 1)

	push	0
	push	0
	lea	eax, DWORD PTR _objdata$[ebp]
	push	eax
	push	0
	push	0
	lea	ecx, DWORD PTR _cgival$[ebp]
	push	ecx
	call	_dyntab_cmp
	add	esp, 24					; 00000018H
	test	eax, eax
	je	$L70413
	cmp	DWORD PTR _cgival$[ebp], 1
	jne	$L70413

; 166  : 		/* Value changed : store it */
; 167  : 		DynTableCell *c = dyntab_cell(&cgival, 0, 0);

	push	0
	push	0
	lea	edx, DWORD PTR _cgival$[ebp]
	push	edx
	call	_dyntab_cell
	add	esp, 12					; 0000000cH
	mov	DWORD PTR _c$70397[ebp], eax

; 168  : 		int b_del = 0;

	mov	DWORD PTR _b_del$70398[ebp], 0

; 169  : 
; 170  : 		/* Check previous values of same line - remove if multiple not allowed or value already selected */
; 171  : 		for(i = ctrl->val.nbrows; i; i--)

	mov	eax, DWORD PTR _ctrl$[ebp]
	mov	ecx, DWORD PTR [eax+64]
	mov	DWORD PTR _i$[ebp], ecx
	jmp	SHORT $L70399
$L70400:
	mov	edx, DWORD PTR _i$[ebp]
	sub	edx, 1
	mov	DWORD PTR _i$[ebp], edx
$L70399:
	cmp	DWORD PTR _i$[ebp], 0
	je	$L70401

; 172  : 			if(!c->Line || c->Line == dyntab_cell(&ctrl->val, i - 1, 0)->Line)

	mov	eax, DWORD PTR _c$70397[ebp]
	cmp	DWORD PTR [eax+40], 0
	je	SHORT $L70403
	push	0
	mov	ecx, DWORD PTR _i$[ebp]
	sub	ecx, 1
	push	ecx
	mov	edx, DWORD PTR _ctrl$[ebp]
	add	edx, 64					; 00000040H
	push	edx
	call	_dyntab_cell
	add	esp, 12					; 0000000cH
	mov	ecx, DWORD PTR _c$70397[ebp]
	mov	edx, DWORD PTR [ecx+40]
	cmp	edx, DWORD PTR [eax+40]
	jne	$L70410
$L70403:

; 174  : 				int b_same = !STRCMPNUL(c->txt, dyntab_val(&ctrl->val, i - 1, 0));

	push	0
	mov	eax, DWORD PTR _i$[ebp]
	sub	eax, 1
	push	eax
	mov	ecx, DWORD PTR _ctrl$[ebp]
	add	ecx, 64					; 00000040H
	push	ecx
	call	_dyntab_val
	add	esp, 12					; 0000000cH
	test	eax, eax
	je	SHORT $L70940
	push	0
	mov	edx, DWORD PTR _i$[ebp]
	sub	edx, 1
	push	edx
	mov	eax, DWORD PTR _ctrl$[ebp]
	add	eax, 64					; 00000040H
	push	eax
	call	_dyntab_val
	add	esp, 12					; 0000000cH
	mov	DWORD PTR -84+[ebp], eax
	jmp	SHORT $L70941
$L70940:
	mov	DWORD PTR -84+[ebp], OFFSET FLAT:$SG70405
$L70941:
	mov	ecx, DWORD PTR _c$70397[ebp]
	cmp	DWORD PTR [ecx], 0
	je	SHORT $L70942
	mov	edx, DWORD PTR _c$70397[ebp]
	mov	eax, DWORD PTR [edx]
	mov	DWORD PTR -88+[ebp], eax
	jmp	SHORT $L70943
$L70942:
	mov	DWORD PTR -88+[ebp], OFFSET FLAT:$SG70406
$L70943:
	mov	ecx, DWORD PTR -84+[ebp]
	push	ecx
	mov	edx, DWORD PTR -88+[ebp]
	push	edx
	call	_strcmp
	add	esp, 8
	neg	eax
	sbb	eax, eax
	inc	eax
	mov	DWORD PTR _b_same$70404[ebp], eax

; 175  : 				b_del |= b_same;

	mov	eax, DWORD PTR _b_del$70398[ebp]
	or	eax, DWORD PTR _b_same$70404[ebp]
	mov	DWORD PTR _b_del$70398[ebp], eax

; 176  : 				if(!b_multiple || b_same) ctrl_del_value(cntxt, i_ctrl, i - 1);

	cmp	DWORD PTR _b_multiple$[ebp], 0
	je	SHORT $L70408
	cmp	DWORD PTR _b_same$70404[ebp], 0
	je	SHORT $L70407
$L70408:
	mov	ecx, DWORD PTR _i$[ebp]
	sub	ecx, 1
	push	ecx
	mov	edx, DWORD PTR _i_ctrl$[ebp]
	push	edx
	mov	eax, DWORD PTR _cntxt$[ebp]
	push	eax
	call	_ctrl_del_value
	add	esp, 12					; 0000000cH

; 177  : 				else if(num < c->Num) num = c->Num;

	jmp	SHORT $L70410
$L70407:
	mov	ecx, DWORD PTR _c$70397[ebp]
	mov	edx, DWORD PTR _num$[ebp]
	cmp	edx, DWORD PTR [ecx+36]
	jae	SHORT $L70410
	mov	eax, DWORD PTR _c$70397[ebp]
	mov	ecx, DWORD PTR [eax+36]
	mov	DWORD PTR _num$[ebp], ecx
$L70410:

; 179  : 
; 180  : 		/* Add new value */
; 181  : 		if((!b_multiple || !b_del) && c->txt && ctrl_add_value(cntxt, i_ctrl, c->txt, c->len, num + 1, c->Line, 1)) STACK_ERROR;

	jmp	$L70400
$L70401:
	cmp	DWORD PTR _b_multiple$[ebp], 0
	je	SHORT $L70412
	cmp	DWORD PTR _b_del$70398[ebp], 0
	jne	SHORT $L70411
$L70412:
	mov	edx, DWORD PTR _c$70397[ebp]
	cmp	DWORD PTR [edx], 0
	je	SHORT $L70411
	push	1
	mov	eax, DWORD PTR _c$70397[ebp]
	mov	ecx, DWORD PTR [eax+40]
	push	ecx
	mov	edx, DWORD PTR _num$[ebp]
	add	edx, 1
	push	edx
	mov	eax, DWORD PTR _c$70397[ebp]
	mov	ecx, DWORD PTR [eax+4]
	push	ecx
	mov	edx, DWORD PTR _c$70397[ebp]
	mov	eax, DWORD PTR [edx]
	push	eax
	mov	ecx, DWORD PTR _i_ctrl$[ebp]
	push	ecx
	mov	edx, DWORD PTR _cntxt$[ebp]
	push	edx
	call	_ctrl_add_value
	add	esp, 28					; 0000001cH
	test	eax, eax
	je	SHORT $L70411
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 181		; 000000b5H
	jmp	SHORT $eva_err$70387
$L70411:

; 182  : 		if(!b_multiple)

	cmp	DWORD PTR _b_multiple$[ebp], 0
	jne	SHORT $L70413

; 184  : 			tbl->status &= ~(TblCtrl_opensearch | TblCtrl_opensel);

	mov	ecx, DWORD PTR _tbl$[ebp]
	mov	edx, DWORD PTR [ecx+32]
	and	edx, -545				; fffffddfH
	mov	eax, DWORD PTR _tbl$[ebp]
	mov	DWORD PTR [eax+32], edx

; 185  : 			tbl->input = "";

	mov	ecx, DWORD PTR _tbl$[ebp]
	mov	DWORD PTR [ecx+100], OFFSET FLAT:$SG70414

; 186  : 			dyntab_free(&tbl->cgiinput);

	mov	edx, DWORD PTR _tbl$[ebp]
	add	edx, 80					; 00000050H
	push	edx
	call	_dyntab_free
	add	esp, 4
$L70413:
$eva_noerr$70390:

; 189  : 
; 190  : 	RETURN_OK_CLEANUP;

	push	0
	push	OFFSET FLAT:$SG70415
	push	OFFSET FLAT:$SG70416
	mov	eax, DWORD PTR _cntxt$[ebp]
	push	eax
	call	_err_clear
	add	esp, 16					; 00000010H
$eva_err$70387:
	mov	ecx, DWORD PTR _cntxt$[ebp]
	cmp	DWORD PTR [ecx+29872], 0
	je	SHORT $L70417
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	eax, DWORD PTR [edx+29900]
	push	eax
	push	OFFSET FLAT:$SG70418
	push	OFFSET FLAT:$SG70419
	mov	ecx, DWORD PTR _cntxt$[ebp]
	push	ecx
	call	_err_add_context
	add	esp, 16					; 00000010H
$L70417:
	lea	edx, DWORD PTR _objdata$[ebp]
	push	edx
	call	_dyntab_free
	add	esp, 4
	lea	eax, DWORD PTR _cgival$[ebp]
	push	eax
	call	_dyntab_free
	add	esp, 4
	mov	ecx, DWORD PTR _cntxt$[ebp]
	xor	eax, eax
	cmp	DWORD PTR [ecx+29872], 0
	setne	al

; 191  : }

	mov	esp, ebp
	pop	ebp
	ret	0
_handle_searchlist_selection ENDP
_TEXT	ENDS
PUBLIC	_ctrl_relation_put_values
EXTRN	_table_put_page_navigator:NEAR
EXTRN	_table_put_status:NEAR
EXTRN	_plain_to_html:BYTE
EXTRN	_ctrl_add_symbol_btn:NEAR
_BSS	SEGMENT
	ALIGN	4

$SG70440 DB	01H DUP (?)
	ALIGN	4

$SG70477 DB	01H DUP (?)
_BSS	ENDS
_DATA	SEGMENT
$SG70438 DB	'_EVA_OPENBUTTON', 00H
$SG70439 DB	'_EVA_OPENBUTTON', 00H
$SG70445 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70448 DB	'SYMBOL+LABEL+OBJNOTES', 00H
	ORG $+2
$SG70451 DB	'<table border=0 cellpadding=1 cellspacing=0 rules=none>', 00H
$SG70453 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70457 DB	'<tr bgcolor=#EEEEEE>', 00H
	ORG $+3
$SG70459 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70463 DB	'</tr>', 00H
	ORG $+2
$SG70465 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70471 DB	'<tr>', 00H
	ORG $+3
$SG70473 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70478 DB	'D:\Travail\ABI\EVA\V4.0\CGI\Brunix-2016\ctrl_input_rel.c'
	DB	00H
	ORG $+3
$SG70479 DB	'ctrl_relation_put_values', 00H
	ORG $+3
$SG70482 DB	'</tr>', 00H
	ORG $+2
$SG70484 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70487 DB	'</table>', 00H
	ORG $+3
$SG70489 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70492 DB	'D:\Travail\ABI\EVA\V4.0\CGI\Brunix-2016\ctrl_input_rel.c'
	DB	00H
	ORG $+3
$SG70493 DB	'ctrl_relation_put_values', 00H
	ORG $+3
$SG70495 DB	'D:\Travail\ABI\EVA\V4.0\CGI\Brunix-2016\ctrl_input_rel.c'
	DB	00H
	ORG $+3
$SG70496 DB	'ctrl_relation_put_values', 00H
_DATA	ENDS
_TEXT	SEGMENT
_cntxt$ = 8
_i_ctrl$ = 12
_form$ = -4
_ctrl$ = -48
_tbl$ = -12
_objdata$ = -40
_name$ = -44
_i$ = -20
_html$ = -8
_openbutton$ = -16
_ctrl_relation_put_values PROC NEAR

; 205  : ){

	push	ebp
	mov	ebp, esp
	sub	esp, 56					; 00000038H

; 206  : 	EVA_form *form = cntxt->form;

	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	ecx, DWORD PTR [eax+80]
	mov	DWORD PTR _form$[ebp], ecx

; 207  : 	EVA_ctrl *ctrl = form->ctrl + i_ctrl;

	mov	edx, DWORD PTR _i_ctrl$[ebp]
	imul	edx, 480				; 000001e0H
	mov	eax, DWORD PTR _form$[ebp]
	mov	ecx, DWORD PTR [eax]
	add	ecx, edx
	mov	DWORD PTR _ctrl$[ebp], ecx

; 208  : 	ObjTableFormat *tbl = ctrl->objtbl;

	mov	edx, DWORD PTR _ctrl$[ebp]
	mov	eax, DWORD PTR [edx+232]
	mov	DWORD PTR _tbl$[ebp], eax

; 209  : 	DynTable objdata = { 0 };

	mov	DWORD PTR _objdata$[ebp], 0
	xor	ecx, ecx
	mov	DWORD PTR _objdata$[ebp+4], ecx
	mov	DWORD PTR _objdata$[ebp+8], ecx
	mov	DWORD PTR _objdata$[ebp+12], ecx
	mov	DWORD PTR _objdata$[ebp+16], ecx

; 210  : 	DynBuffer *name = NULL;

	mov	DWORD PTR _name$[ebp], 0

; 211  : 	unsigned long i;
; 212  : 	DynBuffer **html = cntxt->form->html;

	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	eax, DWORD PTR [edx+80]
	mov	ecx, DWORD PTR [eax+232]
	mov	DWORD PTR _html$[ebp], ecx

; 213  : 	char *openbutton = (tbl && tbl->attr) ? DYNTAB_FIELD_VAL(tbl->attr, OPENBUTTON) : CTRL_ATTR_VAL(OPENBUTTON);

	cmp	DWORD PTR _tbl$[ebp], 0
	je	SHORT $L70945
	mov	edx, DWORD PTR _tbl$[ebp]
	cmp	DWORD PTR [edx], 0
	je	SHORT $L70945
	push	0
	push	-1
	push	OFFSET FLAT:$SG70438
	mov	eax, DWORD PTR _tbl$[ebp]
	mov	ecx, DWORD PTR [eax]
	push	ecx
	call	_dyntab_field_val
	add	esp, 16					; 00000010H
	mov	DWORD PTR -52+[ebp], eax
	jmp	SHORT $L70948
$L70945:
	cmp	DWORD PTR _ctrl$[ebp], 0
	je	SHORT $L70946
	push	0
	push	-1
	push	OFFSET FLAT:$SG70439
	mov	edx, DWORD PTR _ctrl$[ebp]
	add	edx, 44					; 0000002cH
	push	edx
	call	_dyntab_field_val
	add	esp, 16					; 00000010H
	mov	DWORD PTR -56+[ebp], eax
	jmp	SHORT $L70947
$L70946:
	mov	DWORD PTR -56+[ebp], OFFSET FLAT:$SG70440
$L70947:
	mov	eax, DWORD PTR -56+[ebp]
	mov	DWORD PTR -52+[ebp], eax
$L70948:
	mov	ecx, DWORD PTR -52+[ebp]
	mov	DWORD PTR _openbutton$[ebp], ecx

; 214  : 
; 215  : 
; 216  : 	/* Handle empty value in view mode */
; 217  : 	if(!ctrl->val.nbrows)

	mov	edx, DWORD PTR _ctrl$[ebp]
	cmp	DWORD PTR [edx+64], 0
	jne	SHORT $L70441

; 219  : 		if(*ctrl->LABEL_NOSEL) DYNBUF_ADD(form->html, ctrl->LABEL_NOSEL, 0, TO_HTML);

	mov	eax, DWORD PTR _ctrl$[ebp]
	mov	ecx, DWORD PTR [eax+348]
	movsx	edx, BYTE PTR [ecx]
	test	edx, edx
	je	SHORT $L70443
	push	1
	push	OFFSET FLAT:_plain_to_html
	push	0
	mov	eax, DWORD PTR _ctrl$[ebp]
	mov	ecx, DWORD PTR [eax+348]
	push	ecx
	mov	edx, DWORD PTR _form$[ebp]
	mov	eax, DWORD PTR [edx+232]
	push	eax
	call	_dynbuf_add
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L70443
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29872], OFFSET FLAT:$SG70445
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 219		; 000000dbH
	jmp	$eva_err$70446
$L70443:

; 220  : 		return 0;

	xor	eax, eax
	jmp	$L70428
$L70441:

; 222  : 
; 223  : 	if(!*openbutton) openbutton = "SYMBOL+LABEL+OBJNOTES";

	mov	eax, DWORD PTR _openbutton$[ebp]
	movsx	ecx, BYTE PTR [eax]
	test	ecx, ecx
	jne	SHORT $L70447
	mov	DWORD PTR _openbutton$[ebp], OFFSET FLAT:$SG70448
$L70447:

; 224  : 	DYNBUF_ADD_STR(html, "<table border=0 cellpadding=1 cellspacing=0 rules=none>");

	push	0
	push	0
	push	55					; 00000037H
	push	OFFSET FLAT:$SG70451
	mov	edx, DWORD PTR _html$[ebp]
	push	edx
	call	_dynbuf_add
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L70450
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29872], OFFSET FLAT:$SG70453
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 224		; 000000e0H
	jmp	$eva_err$70446
$L70450:

; 225  : 	if(tbl->lines < ctrl->val.nbrows)

	mov	edx, DWORD PTR _tbl$[ebp]
	mov	eax, DWORD PTR _ctrl$[ebp]
	mov	ecx, DWORD PTR [edx+44]
	cmp	ecx, DWORD PTR [eax+64]
	jae	$L70462

; 227  : 		DYNBUF_ADD_STR(html, "<tr bgcolor=#EEEEEE>");

	push	0
	push	0
	push	20					; 00000014H
	push	OFFSET FLAT:$SG70457
	mov	edx, DWORD PTR _html$[ebp]
	push	edx
	call	_dynbuf_add
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L70456
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29872], OFFSET FLAT:$SG70459
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 227		; 000000e3H
	jmp	$eva_err$70446
$L70456:

; 228  : 		tbl->totlines = ctrl->val.nbrows;

	mov	edx, DWORD PTR _tbl$[ebp]
	mov	eax, DWORD PTR _ctrl$[ebp]
	mov	ecx, DWORD PTR [eax+64]
	mov	DWORD PTR [edx+52], ecx

; 229  : 		if(table_put_page_navigator(cntxt, i_ctrl, 0)) STACK_ERROR;

	push	0
	mov	edx, DWORD PTR _i_ctrl$[ebp]
	push	edx
	mov	eax, DWORD PTR _cntxt$[ebp]
	push	eax
	call	_table_put_page_navigator
	add	esp, 12					; 0000000cH
	test	eax, eax
	je	SHORT $L70460
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 229		; 000000e5H
	jmp	$eva_err$70446
$L70460:

; 230  : 		DYNBUF_ADD_STR(html, "</tr>");

	push	0
	push	0
	push	5
	push	OFFSET FLAT:$SG70463
	mov	edx, DWORD PTR _html$[ebp]
	push	edx
	call	_dynbuf_add
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L70462
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29872], OFFSET FLAT:$SG70465
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 230		; 000000e6H
	jmp	$eva_err$70446
$L70462:

; 232  : 	for(i = 0; i < tbl->lines && i + tbl->line < ctrl->val.nbrows; i++)

	mov	DWORD PTR _i$[ebp], 0
	jmp	SHORT $L70466
$L70467:
	mov	edx, DWORD PTR _i$[ebp]
	add	edx, 1
	mov	DWORD PTR _i$[ebp], edx
$L70466:
	mov	eax, DWORD PTR _tbl$[ebp]
	mov	ecx, DWORD PTR _i$[ebp]
	cmp	ecx, DWORD PTR [eax+44]
	jae	$L70468
	mov	edx, DWORD PTR _tbl$[ebp]
	mov	eax, DWORD PTR _i$[ebp]
	add	eax, DWORD PTR [edx+40]
	mov	ecx, DWORD PTR _ctrl$[ebp]
	cmp	eax, DWORD PTR [ecx+64]
	jae	$L70468

; 234  : 		DYNBUF_ADD_STR(html, "<tr>");

	push	0
	push	0
	push	4
	push	OFFSET FLAT:$SG70471
	mov	edx, DWORD PTR _html$[ebp]
	push	edx
	call	_dynbuf_add
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L70470
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29872], OFFSET FLAT:$SG70473
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 234		; 000000eaH
	jmp	$eva_err$70446
$L70470:

; 235  : 		if(qry_obj_idfield(cntxt, &objdata, DYNTAB_TOULRC(&ctrl->val, i + tbl->line, 0), 0) ||
; 236  : 			ctrl_add_symbol_btn(cntxt, ctrl, dyntab_cell(&ctrl->val, i + tbl->line, 0), &objdata, 0,
; 237  : 								"", openbutton))

	push	0
	push	10					; 0000000aH
	push	0
	push	0
	mov	edx, DWORD PTR _tbl$[ebp]
	mov	eax, DWORD PTR _i$[ebp]
	add	eax, DWORD PTR [edx+40]
	push	eax
	mov	ecx, DWORD PTR _ctrl$[ebp]
	add	ecx, 64					; 00000040H
	push	ecx
	call	_dyntab_val
	add	esp, 12					; 0000000cH
	push	eax
	call	_strtoul
	add	esp, 12					; 0000000cH
	push	eax
	lea	edx, DWORD PTR _objdata$[ebp]
	push	edx
	mov	eax, DWORD PTR _cntxt$[ebp]
	push	eax
	call	_qry_obj_idfield
	add	esp, 16					; 00000010H
	test	eax, eax
	jne	SHORT $L70476
	mov	ecx, DWORD PTR _openbutton$[ebp]
	push	ecx
	push	OFFSET FLAT:$SG70477
	push	0
	lea	edx, DWORD PTR _objdata$[ebp]
	push	edx
	push	0
	mov	eax, DWORD PTR _tbl$[ebp]
	mov	ecx, DWORD PTR _i$[ebp]
	add	ecx, DWORD PTR [eax+40]
	push	ecx
	mov	edx, DWORD PTR _ctrl$[ebp]
	add	edx, 64					; 00000040H
	push	edx
	call	_dyntab_cell
	add	esp, 12					; 0000000cH
	push	eax
	mov	eax, DWORD PTR _ctrl$[ebp]
	push	eax
	mov	ecx, DWORD PTR _cntxt$[ebp]
	push	ecx
	call	_ctrl_add_symbol_btn
	add	esp, 28					; 0000001cH
	test	eax, eax
	je	SHORT $L70475
$L70476:

; 238  : 			CLEAR_ERROR;

	push	238					; 000000eeH
	push	OFFSET FLAT:$SG70478
	push	OFFSET FLAT:$SG70479
	mov	edx, DWORD PTR _cntxt$[ebp]
	push	edx
	call	_err_clear
	add	esp, 16					; 00000010H
$L70475:

; 239  : 		DYNBUF_ADD_STR(html, "</tr>");

	push	0
	push	0
	push	5
	push	OFFSET FLAT:$SG70482
	mov	eax, DWORD PTR _html$[ebp]
	push	eax
	call	_dynbuf_add
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L70481
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29872], OFFSET FLAT:$SG70484
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 239		; 000000efH
	jmp	SHORT $eva_err$70446
$L70481:

; 240  : 	}

	jmp	$L70467
$L70468:

; 241  : 	DYNBUF_ADD_STR(html, "</table>");

	push	0
	push	0
	push	8
	push	OFFSET FLAT:$SG70487
	mov	eax, DWORD PTR _html$[ebp]
	push	eax
	call	_dynbuf_add
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L70486
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29872], OFFSET FLAT:$SG70489
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 241		; 000000f1H
	jmp	SHORT $eva_err$70446
$L70486:

; 242  : 	if(table_put_status(cntxt, i_ctrl)) STACK_ERROR;

	mov	eax, DWORD PTR _i_ctrl$[ebp]
	push	eax
	mov	ecx, DWORD PTR _cntxt$[ebp]
	push	ecx
	call	_table_put_status
	add	esp, 8
	test	eax, eax
	je	SHORT $eva_noerr$70491
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 242		; 000000f2H
	jmp	SHORT $eva_err$70446
$eva_noerr$70491:

; 243  : 
; 244  : 	RETURN_OK_CLEANUP;

	push	0
	push	OFFSET FLAT:$SG70492
	push	OFFSET FLAT:$SG70493
	mov	eax, DWORD PTR _cntxt$[ebp]
	push	eax
	call	_err_clear
	add	esp, 16					; 00000010H
$eva_err$70446:
	mov	ecx, DWORD PTR _cntxt$[ebp]
	cmp	DWORD PTR [ecx+29872], 0
	je	SHORT $L70494
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	eax, DWORD PTR [edx+29900]
	push	eax
	push	OFFSET FLAT:$SG70495
	push	OFFSET FLAT:$SG70496
	mov	ecx, DWORD PTR _cntxt$[ebp]
	push	ecx
	call	_err_add_context
	add	esp, 16					; 00000010H
$L70494:
	lea	edx, DWORD PTR _objdata$[ebp]
	push	edx
	call	_dyntab_free
	add	esp, 4
	mov	eax, DWORD PTR _name$[ebp]
	push	eax
	call	_mem_free
	add	esp, 4
	mov	DWORD PTR _name$[ebp], 0
	mov	ecx, DWORD PTR _cntxt$[ebp]
	xor	eax, eax
	cmp	DWORD PTR [ecx+29872], 0
	setne	al
$L70428:

; 245  : }

	mov	esp, ebp
	pop	ebp
	ret	0
_ctrl_relation_put_values ENDP
_TEXT	ENDS
PUBLIC	_handle_auto_selection
EXTRN	_cgi_value_setkeep:NEAR
EXTRN	_dyntab_set_txt:NEAR
_BSS	SEGMENT
	ALIGN	4

$SG70539 DB	01H DUP (?)
	ALIGN	4

$SG70545 DB	01H DUP (?)
_BSS	ENDS
_DATA	SEGMENT
	ORG $+3
$SG70510 DB	'No', 00H
	ORG $+1
$SG70541 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70547 DB	'D:\Travail\ABI\EVA\V4.0\CGI\Brunix-2016\ctrl_input_rel.c'
	DB	00H
	ORG $+3
$SG70548 DB	'handle_auto_selection', 00H
	ORG $+2
$SG70550 DB	'D:\Travail\ABI\EVA\V4.0\CGI\Brunix-2016\ctrl_input_rel.c'
	DB	00H
	ORG $+3
$SG70551 DB	'handle_auto_selection', 00H
_DATA	ENDS
_TEXT	SEGMENT
_cntxt$ = 8
_i_ctrl$ = 12
_form$ = -4
_ctrl$ = -24
_tbl$ = -8
_b_multiple$ = -20
_i$ = -12
_j$ = -16
_c$70517 = -28
_nbval$70518 = -32
_num$70519 = -36
_c1$70523 = -40
_status$70528 = -44
_handle_auto_selection PROC NEAR

; 258  : ){

	push	ebp
	mov	ebp, esp
	sub	esp, 48					; 00000030H

; 259  : 	EVA_form *form = cntxt->form;

	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	ecx, DWORD PTR [eax+80]
	mov	DWORD PTR _form$[ebp], ecx

; 260  : 	EVA_ctrl *ctrl = form->ctrl + i_ctrl;

	mov	edx, DWORD PTR _i_ctrl$[ebp]
	imul	edx, 480				; 000001e0H
	mov	eax, DWORD PTR _form$[ebp]
	mov	ecx, DWORD PTR [eax]
	add	ecx, edx
	mov	DWORD PTR _ctrl$[ebp], ecx

; 261  : 	ObjTableFormat *tbl = ctrl->objtbl;

	mov	edx, DWORD PTR _ctrl$[ebp]
	mov	eax, DWORD PTR [edx+232]
	mov	DWORD PTR _tbl$[ebp], eax

; 262  : 	int b_multiple = ctrl->MULTIPLE[0] != 0 && strcmp("No", ctrl->MULTIPLE);

	mov	ecx, DWORD PTR _ctrl$[ebp]
	mov	edx, DWORD PTR [ecx+344]
	movsx	eax, BYTE PTR [edx]
	test	eax, eax
	je	SHORT $L70950
	mov	ecx, DWORD PTR _ctrl$[ebp]
	mov	edx, DWORD PTR [ecx+344]
	push	edx
	push	OFFSET FLAT:$SG70510
	call	_strcmp
	add	esp, 8
	test	eax, eax
	je	SHORT $L70950
	mov	DWORD PTR -48+[ebp], 1
	jmp	SHORT $L70951
$L70950:
	mov	DWORD PTR -48+[ebp], 0
$L70951:
	mov	eax, DWORD PTR -48+[ebp]
	mov	DWORD PTR _b_multiple$[ebp], eax

; 263  : 	unsigned long i, j;
; 264  : 
; 265  : 	/* Ckeck each non empty user input */
; 266  : 	for(i = 0; i < tbl->cgiinput.nbrows; i++) if(dyntab_sz(&tbl->cgiinput, i, 0))

	mov	DWORD PTR _i$[ebp], 0
	jmp	SHORT $L70513
$L70514:
	mov	ecx, DWORD PTR _i$[ebp]
	add	ecx, 1
	mov	DWORD PTR _i$[ebp], ecx
$L70513:
	mov	edx, DWORD PTR _tbl$[ebp]
	mov	eax, DWORD PTR _i$[ebp]
	cmp	eax, DWORD PTR [edx+80]
	jae	$eva_noerr$70546
	push	0
	mov	ecx, DWORD PTR _i$[ebp]
	push	ecx
	mov	edx, DWORD PTR _tbl$[ebp]
	add	edx, 80					; 00000050H
	push	edx
	call	_dyntab_sz
	add	esp, 12					; 0000000cH
	test	eax, eax
	je	$L70526

; 268  : 		/* Count # of values for the line */
; 269  : 		DynTableCell *c = dyntab_cell(&tbl->cgiinput, i, 0);

	push	0
	mov	eax, DWORD PTR _i$[ebp]
	push	eax
	mov	ecx, DWORD PTR _tbl$[ebp]
	add	ecx, 80					; 00000050H
	push	ecx
	call	_dyntab_cell
	add	esp, 12					; 0000000cH
	mov	DWORD PTR _c$70517[ebp], eax

; 270  : 		unsigned long nbval = 0, num = 0;

	mov	DWORD PTR _nbval$70518[ebp], 0
	mov	DWORD PTR _num$70519[ebp], 0

; 271  : 		for(j = 0; j < ctrl->val.nbrows; j++)

	mov	DWORD PTR _j$[ebp], 0
	jmp	SHORT $L70520
$L70521:
	mov	edx, DWORD PTR _j$[ebp]
	add	edx, 1
	mov	DWORD PTR _j$[ebp], edx
$L70520:
	mov	eax, DWORD PTR _ctrl$[ebp]
	mov	ecx, DWORD PTR _j$[ebp]
	cmp	ecx, DWORD PTR [eax+64]
	jae	SHORT $L70522

; 273  : 			DynTableCell *c1 = dyntab_cell(&ctrl->val, j, 0);

	push	0
	mov	edx, DWORD PTR _j$[ebp]
	push	edx
	mov	eax, DWORD PTR _ctrl$[ebp]
	add	eax, 64					; 00000040H
	push	eax
	call	_dyntab_cell
	add	esp, 12					; 0000000cH
	mov	DWORD PTR _c1$70523[ebp], eax

; 274  : 			if(c1->Line != c->Line) break;

	mov	ecx, DWORD PTR _c1$70523[ebp]
	mov	edx, DWORD PTR _c$70517[ebp]
	mov	eax, DWORD PTR [ecx+40]
	cmp	eax, DWORD PTR [edx+40]
	je	SHORT $L70524
	jmp	SHORT $L70522
$L70524:

; 275  : 			nbval++;

	mov	ecx, DWORD PTR _nbval$70518[ebp]
	add	ecx, 1
	mov	DWORD PTR _nbval$70518[ebp], ecx

; 276  : 			if(num < c1->Num) num = c1->Num;

	mov	edx, DWORD PTR _c1$70523[ebp]
	mov	eax, DWORD PTR _num$70519[ebp]
	cmp	eax, DWORD PTR [edx+36]
	jae	SHORT $L70525
	mov	ecx, DWORD PTR _c1$70523[ebp]
	mov	edx, DWORD PTR [ecx+36]
	mov	DWORD PTR _num$70519[ebp], edx
$L70525:

; 277  : 		}

	jmp	SHORT $L70521
$L70522:

; 278  : 
; 279  : 		/* Exec search if applicable */
; 280  : 		if(!nbval || b_multiple)

	cmp	DWORD PTR _nbval$70518[ebp], 0
	je	SHORT $L70527
	cmp	DWORD PTR _b_multiple$[ebp], 0
	je	$L70526
$L70527:

; 282  : 			int status = tbl->status;

	mov	eax, DWORD PTR _tbl$[ebp]
	mov	ecx, DWORD PTR [eax+32]
	mov	DWORD PTR _status$70528[ebp], ecx

; 283  : 			tbl->status |= TblCtrl_opensearch | TblCtrl_opensel;

	mov	edx, DWORD PTR _tbl$[ebp]
	mov	eax, DWORD PTR [edx+32]
	or	eax, 544				; 00000220H
	mov	ecx, DWORD PTR _tbl$[ebp]
	mov	DWORD PTR [ecx+32], eax

; 284  : 			tbl->input = c->txt;

	mov	edx, DWORD PTR _tbl$[ebp]
	mov	eax, DWORD PTR _c$70517[ebp]
	mov	ecx, DWORD PTR [eax]
	mov	DWORD PTR [edx+100], ecx

; 285  : 			DYNTAB_FREE(tbl->idobj);

	mov	edx, DWORD PTR _tbl$[ebp]
	add	edx, 184				; 000000b8H
	push	edx
	call	_dyntab_free
	add	esp, 4

; 286  : 			if(ctrl_relation_searchlist(cntxt, i_ctrl)) STACK_ERROR;

	mov	eax, DWORD PTR _i_ctrl$[ebp]
	push	eax
	mov	ecx, DWORD PTR _cntxt$[ebp]
	push	ecx
	call	_ctrl_relation_searchlist
	add	esp, 8
	test	eax, eax
	je	SHORT $L70529
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 286		; 0000011eH
	jmp	$eva_err$70530
$L70529:

; 287  : 
; 288  : 			/* Store results if applicable */
; 289  : 			if(tbl->idobj.nbrows == 1)

	mov	eax, DWORD PTR _tbl$[ebp]
	cmp	DWORD PTR [eax+184], 1
	jne	$L70531

; 291  : 				if(!c->Line || c->Line == tbl->ctrlline) status &= ~(TblCtrl_opensearch | TblCtrl_opensel);

	mov	ecx, DWORD PTR _c$70517[ebp]
	cmp	DWORD PTR [ecx+40], 0
	je	SHORT $L70533
	mov	edx, DWORD PTR _c$70517[ebp]
	mov	eax, DWORD PTR _tbl$[ebp]
	mov	ecx, DWORD PTR [edx+40]
	cmp	ecx, DWORD PTR [eax+56]
	jne	SHORT $L70532
$L70533:
	mov	edx, DWORD PTR _status$70528[ebp]
	and	edx, -545				; fffffddfH
	mov	DWORD PTR _status$70528[ebp], edx
$L70532:

; 292  : 				for(j = 0; j < tbl->idobj.nbrows; j++)

	mov	DWORD PTR _j$[ebp], 0
	jmp	SHORT $L70534
$L70535:
	mov	eax, DWORD PTR _j$[ebp]
	add	eax, 1
	mov	DWORD PTR _j$[ebp], eax
$L70534:
	mov	ecx, DWORD PTR _tbl$[ebp]
	mov	edx, DWORD PTR _j$[ebp]
	cmp	edx, DWORD PTR [ecx+184]
	jae	SHORT $L70536

; 293  : 					if(ctrl_add_value(cntxt, i_ctrl, DYNTAB_VAL_SZ(&tbl->idobj, j, 0), 1, c->Line, 1)) STACK_ERROR;

	push	1
	mov	eax, DWORD PTR _c$70517[ebp]
	mov	ecx, DWORD PTR [eax+40]
	push	ecx
	push	1
	push	0
	mov	edx, DWORD PTR _j$[ebp]
	push	edx
	mov	eax, DWORD PTR _tbl$[ebp]
	add	eax, 184				; 000000b8H
	push	eax
	call	_dyntab_sz
	add	esp, 12					; 0000000cH
	push	eax
	push	0
	mov	ecx, DWORD PTR _j$[ebp]
	push	ecx
	mov	edx, DWORD PTR _tbl$[ebp]
	add	edx, 184				; 000000b8H
	push	edx
	call	_dyntab_val
	add	esp, 12					; 0000000cH
	push	eax
	mov	eax, DWORD PTR _i_ctrl$[ebp]
	push	eax
	mov	ecx, DWORD PTR _cntxt$[ebp]
	push	ecx
	call	_ctrl_add_value
	add	esp, 28					; 0000001cH
	test	eax, eax
	je	SHORT $L70537
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 293		; 00000125H
	jmp	$eva_err$70530
$L70537:
	jmp	SHORT $L70535
$L70536:

; 294  : 				cgi_value_setkeep(cntxt, &tbl->cgiinput, i, 2);

	push	2
	mov	eax, DWORD PTR _i$[ebp]
	push	eax
	mov	ecx, DWORD PTR _tbl$[ebp]
	add	ecx, 80					; 00000050H
	push	ecx
	mov	edx, DWORD PTR _cntxt$[ebp]
	push	edx
	call	_cgi_value_setkeep
	add	esp, 16					; 00000010H

; 295  : 				DYNTAB_SET(&tbl->cgiinput, i, 0, "");

	push	0
	push	OFFSET FLAT:$SG70539
	push	0
	mov	eax, DWORD PTR _i$[ebp]
	push	eax
	mov	ecx, DWORD PTR _tbl$[ebp]
	add	ecx, 80					; 00000050H
	push	ecx
	call	_dyntab_set_txt
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L70538
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29872], OFFSET FLAT:$SG70541
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 295		; 00000127H
	jmp	SHORT $eva_err$70530
$L70538:

; 297  : 			else if(form->i_ctrl_clic != i_ctrl || tbl->ctrlline == c->Line)

	jmp	SHORT $L70543
$L70531:
	mov	ecx, DWORD PTR _form$[ebp]
	mov	edx, DWORD PTR [ecx+124]
	cmp	edx, DWORD PTR _i_ctrl$[ebp]
	jne	SHORT $L70544
	mov	eax, DWORD PTR _tbl$[ebp]
	mov	ecx, DWORD PTR _c$70517[ebp]
	mov	edx, DWORD PTR [eax+56]
	cmp	edx, DWORD PTR [ecx+40]
	jne	SHORT $L70543
$L70544:

; 299  : 				/* Open search else */
; 300  : 				tbl->ctrlline = c->Line;

	mov	eax, DWORD PTR _tbl$[ebp]
	mov	ecx, DWORD PTR _c$70517[ebp]
	mov	edx, DWORD PTR [ecx+40]
	mov	DWORD PTR [eax+56], edx

; 301  : 				status |= TblCtrl_opensearch | TblCtrl_opensel;

	mov	eax, DWORD PTR _status$70528[ebp]
	or	eax, 544				; 00000220H
	mov	DWORD PTR _status$70528[ebp], eax
$L70543:

; 303  : 			tbl->input = "";

	mov	ecx, DWORD PTR _tbl$[ebp]
	mov	DWORD PTR [ecx+100], OFFSET FLAT:$SG70545

; 304  : 			tbl->status = status;

	mov	edx, DWORD PTR _tbl$[ebp]
	mov	eax, DWORD PTR _status$70528[ebp]
	mov	DWORD PTR [edx+32], eax
$L70526:

; 307  : 
; 308  : 	RETURN_OK_CLEANUP;

	jmp	$L70514
$eva_noerr$70546:
	push	0
	push	OFFSET FLAT:$SG70547
	push	OFFSET FLAT:$SG70548
	mov	ecx, DWORD PTR _cntxt$[ebp]
	push	ecx
	call	_err_clear
	add	esp, 16					; 00000010H
$eva_err$70530:
	mov	edx, DWORD PTR _cntxt$[ebp]
	cmp	DWORD PTR [edx+29872], 0
	je	SHORT $L70549
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	ecx, DWORD PTR [eax+29900]
	push	ecx
	push	OFFSET FLAT:$SG70550
	push	OFFSET FLAT:$SG70551
	mov	edx, DWORD PTR _cntxt$[ebp]
	push	edx
	call	_err_add_context
	add	esp, 16					; 00000010H
$L70549:
	mov	eax, DWORD PTR _cntxt$[ebp]
	xor	ecx, ecx
	cmp	DWORD PTR [eax+29872], 0
	setne	cl
	mov	eax, ecx

; 309  : }

	mov	esp, ebp
	pop	ebp
	ret	0
_handle_auto_selection ENDP
_TEXT	ENDS
PUBLIC	_ctrl_add_relation_auto
EXTRN	_table_process_controls:NEAR
EXTRN	_put_html_list:NEAR
EXTRN	_table_put_closesearch_btn:NEAR
EXTRN	_table_put_opensearch_btn:NEAR
EXTRN	_table_put_addnew_btn:NEAR
EXTRN	_table_put_functions_btn:NEAR
EXTRN	_table_put_clear_btn:NEAR
EXTRN	_table_put_search_input:NEAR
EXTRN	_table_put_filter_list:NEAR
EXTRN	_ctrl_cgi_name:NEAR
EXTRN	_ctrl_put_hidden:NEAR
EXTRN	_dyntab_field_cell:NEAR
_BSS	SEGMENT
	ALIGN	4

$SG70660 DB	01H DUP (?)
	ALIGN	4

$SG70598 DB	01H DUP (?)
_BSS	ENDS
_DATA	SEGMENT
	ORG $+2
$SG70578 DB	'_EVA_SEARCHCOL', 00H
	ORG $+1
$SG70588 DB	' cellpadding=0 cellspacing=0><tr>', 00H
	ORG $+2
$SG70589 DB	'<table border=', 00H
	ORG $+1
$SG70591 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70601 DB	'D:\Travail\ABI\EVA\V4.0\CGI\Brunix-2016\ctrl_input_rel.c'
	DB	00H
	ORG $+3
$SG70602 DB	'ctrl_add_relation_auto', 00H
	ORG $+1
$SG70605 DB	'<td align=center rowspan=3>', 00H
$SG70607 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70610 DB	'<br>', 00H
	ORG $+3
$SG70613 DB	'<br><br>', 00H
	ORG $+3
$SG70615 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70619 DB	'</td><td><table border=0 cellpadding=0 cellspacing=0><tr'
	DB	'>', 00H
	ORG $+2
$SG70621 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70626 DB	'</tr><tr>', 00H
	ORG $+2
$SG70628 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70633 DB	'</tr><tr>', 00H
	ORG $+2
$SG70635 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70638 DB	'<td align=right valign=top>R', 0e9H, 'sultat<br><br><fon'
	DB	't size=-1><b>', 00H
	ORG $+3
$SG70640 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70648 DB	'Aucune fiche', 00H
	ORG $+3
$SG70650 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70654 DB	'1 fiche', 00H
$SG70656 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70659 DB	' fiches', 00H
$SG70662 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70665 DB	'</b></font>', 00H
$SG70667 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70671 DB	'</td><td>', 00H
	ORG $+2
$SG70673 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70676 DB	'SEL', 00H
$SG70686 DB	'''', 00H
	ORG $+2
$SG70687 DB	'<input type=hidden name=''', 00H
	ORG $+2
$SG70689 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70692 DB	'>', 00H
	ORG $+2
$SG70693 DB	' value=', 00H
$SG70695 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70699 DB	0aH, 00H
	ORG $+2
$SG70701 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70704 DB	' items (fiches les plus r', 0e9H, 'centes)</font></td>', 00H
	ORG $+2
$SG70705 DB	'</tr><tr><td colspan=2 align=center><font size=-2 color='
	DB	'#EE4444>Attention : liste partielle - pr', 0e9H, 'cisez votre'
	DB	' recherche<br>Cette liste est limit', 0e9H, 'e ', 0e0H, ' ', 00H
	ORG $+3
$SG70707 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70710 DB	'</font></td>', 00H
	ORG $+3
$SG70711 DB	'</tr><tr><td colspan=2 align=center><font size=-2>', 00H
	ORG $+1
$SG70714 DB	'</tr></table></td>', 00H
	ORG $+1
$SG70716 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70721 DB	'<td>', 00H
	ORG $+3
$SG70723 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70729 DB	'</td>', 00H
	ORG $+2
$SG70731 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70735 DB	'<td>', 00H
	ORG $+3
$SG70737 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70742 DB	'</td><td>', 00H
	ORG $+2
$SG70744 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70748 DB	'</td><td>', 00H
	ORG $+2
$SG70750 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70754 DB	'</td>', 00H
	ORG $+2
$SG70756 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70764 DB	'</tr></table>', 00H
	ORG $+2
$SG70766 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70770 DB	'D:\Travail\ABI\EVA\V4.0\CGI\Brunix-2016\ctrl_input_rel.c'
	DB	00H
	ORG $+3
$SG70771 DB	'ctrl_add_relation_auto', 00H
	ORG $+1
$SG70773 DB	'D:\Travail\ABI\EVA\V4.0\CGI\Brunix-2016\ctrl_input_rel.c'
	DB	00H
	ORG $+3
$SG70774 DB	'ctrl_add_relation_auto', 00H
_DATA	ENDS
_TEXT	SEGMENT
_cntxt$ = 8
_i_ctrl$ = 12
_form$ = -4
_ctrl$ = -68
_tbl$ = -12
_optlist$ = -64
_objdata$ = -36
_name$ = -44
_i$ = -16
_html$ = -8
_b_label$ = -40
_ctrl_add_relation_auto PROC NEAR

; 324  : ){

	push	ebp
	mov	ebp, esp
	sub	esp, 92					; 0000005cH

; 325  : 	EVA_form *form = cntxt->form;

	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	ecx, DWORD PTR [eax+80]
	mov	DWORD PTR _form$[ebp], ecx

; 326  : 	EVA_ctrl *ctrl = form->ctrl + i_ctrl;

	mov	edx, DWORD PTR _i_ctrl$[ebp]
	imul	edx, 480				; 000001e0H
	mov	eax, DWORD PTR _form$[ebp]
	mov	ecx, DWORD PTR [eax]
	add	ecx, edx
	mov	DWORD PTR _ctrl$[ebp], ecx

; 327  : 	ObjTableFormat *tbl = ctrl->objtbl;

	mov	edx, DWORD PTR _ctrl$[ebp]
	mov	eax, DWORD PTR [edx+232]
	mov	DWORD PTR _tbl$[ebp], eax

; 328  : 	DynTable optlist = { 0 };

	mov	DWORD PTR _optlist$[ebp], 0
	xor	ecx, ecx
	mov	DWORD PTR _optlist$[ebp+4], ecx
	mov	DWORD PTR _optlist$[ebp+8], ecx
	mov	DWORD PTR _optlist$[ebp+12], ecx
	mov	DWORD PTR _optlist$[ebp+16], ecx

; 329  : 	DynTable objdata = { 0 };

	mov	DWORD PTR _objdata$[ebp], 0
	xor	edx, edx
	mov	DWORD PTR _objdata$[ebp+4], edx
	mov	DWORD PTR _objdata$[ebp+8], edx
	mov	DWORD PTR _objdata$[ebp+12], edx
	mov	DWORD PTR _objdata$[ebp+16], edx

; 330  : 	DynBuffer *name = NULL;

	mov	DWORD PTR _name$[ebp], 0

; 331  : 	unsigned long i;
; 332  : 	DynBuffer **html = cntxt->form->html;

	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	ecx, DWORD PTR [eax+80]
	mov	edx, DWORD PTR [ecx+232]
	mov	DWORD PTR _html$[ebp], edx

; 333  : 	int b_label = 0;

	mov	DWORD PTR _b_label$[ebp], 0

; 334  : 
; 335  : 	switch(form->step)
; 336  : 	{

	mov	eax, DWORD PTR _form$[ebp]
	mov	ecx, DWORD PTR [eax+176]
	mov	DWORD PTR -72+[ebp], ecx
	cmp	DWORD PTR -72+[ebp], 0
	je	SHORT $L70575
	cmp	DWORD PTR -72+[ebp], 4
	je	$L70586
	jmp	$L70767
$L70575:

; 337  : 	case CtrlRead:
; 338  : 		/* Read control status */
; 339  : 		tbl = ctrl->objtbl;

	mov	edx, DWORD PTR _ctrl$[ebp]
	mov	eax, DWORD PTR [edx+232]
	mov	DWORD PTR _tbl$[ebp], eax

; 340  : 		if(tbl->b_first)

	mov	ecx, DWORD PTR _tbl$[ebp]
	cmp	DWORD PTR [ecx+132], 0
	je	SHORT $L70581

; 342  : 			tbl->status &= ~(TblCtrl_opensearch | TblCtrl_opensel);

	mov	edx, DWORD PTR _tbl$[ebp]
	mov	eax, DWORD PTR [edx+32]
	and	eax, -545				; fffffddfH
	mov	ecx, DWORD PTR _tbl$[ebp]
	mov	DWORD PTR [ecx+32], eax

; 343  : 			if(!DYNTAB_FIELD_CELL(tbl->attr, SEARCHCOL))

	push	0
	push	-1
	push	OFFSET FLAT:$SG70578
	mov	edx, DWORD PTR _tbl$[ebp]
	mov	eax, DWORD PTR [edx]
	push	eax
	call	_dyntab_field_cell
	add	esp, 16					; 00000010H
	test	eax, eax
	jne	SHORT $L70581

; 344  : 				for(i = 0; i < tbl->field.nbrows; i++) tbl->srchcol |= 1 << i;

	mov	DWORD PTR _i$[ebp], 0
	jmp	SHORT $L70579
$L70580:
	mov	ecx, DWORD PTR _i$[ebp]
	add	ecx, 1
	mov	DWORD PTR _i$[ebp], ecx
$L70579:
	mov	edx, DWORD PTR _tbl$[ebp]
	mov	eax, DWORD PTR _i$[ebp]
	cmp	eax, DWORD PTR [edx+380]
	jae	SHORT $L70581
	mov	edx, 1
	mov	ecx, DWORD PTR _i$[ebp]
	shl	edx, cl
	mov	eax, DWORD PTR _tbl$[ebp]
	mov	ecx, DWORD PTR [eax+124]
	or	ecx, edx
	mov	edx, DWORD PTR _tbl$[ebp]
	mov	DWORD PTR [edx+124], ecx
	jmp	SHORT $L70580
$L70581:

; 346  : 		if(table_process_controls(cntxt, i_ctrl)) STACK_ERROR;

	mov	eax, DWORD PTR _i_ctrl$[ebp]
	push	eax
	mov	ecx, DWORD PTR _cntxt$[ebp]
	push	ecx
	call	_table_process_controls
	add	esp, 8
	test	eax, eax
	je	SHORT $L70582
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 346		; 0000015aH
	jmp	$eva_err$70583
$L70582:

; 347  : 
; 348  : 		/* Handle select function */
; 349  : 		if(handle_searchlist_selection(cntxt, i_ctrl)) STACK_ERROR;

	mov	eax, DWORD PTR _i_ctrl$[ebp]
	push	eax
	mov	ecx, DWORD PTR _cntxt$[ebp]
	push	ecx
	call	_handle_searchlist_selection
	add	esp, 8
	test	eax, eax
	je	SHORT $L70584
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 349		; 0000015dH
	jmp	$eva_err$70583
$L70584:

; 350  : 		if(handle_auto_selection(cntxt, i_ctrl)) STACK_ERROR;

	mov	eax, DWORD PTR _i_ctrl$[ebp]
	push	eax
	mov	ecx, DWORD PTR _cntxt$[ebp]
	push	ecx
	call	_handle_auto_selection
	add	esp, 8
	test	eax, eax
	je	SHORT $L70585
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 350		; 0000015eH
	jmp	$eva_err$70583
$L70585:

; 351  : 		break;

	jmp	$eva_noerr$70769
$L70586:

; 352  : 
; 353  : 	case HtmlEdit:
; 354  : 		/* Enclose control in table */
; 355  : 		DYNBUF_ADD3_INT(html, "<table border=", tbl->status & TblCtrl_opensearch && !tbl->b_no_status ? 1 : 0, " cellpadding=0 cellspacing=0><tr>");

	mov	eax, DWORD PTR _tbl$[ebp]
	mov	ecx, DWORD PTR [eax+32]
	and	ecx, 32					; 00000020H
	test	ecx, ecx
	je	SHORT $L70953
	mov	edx, DWORD PTR _tbl$[ebp]
	cmp	DWORD PTR [edx+36], 0
	jne	SHORT $L70953
	mov	DWORD PTR -76+[ebp], 1
	jmp	SHORT $L70954
$L70953:
	mov	DWORD PTR -76+[ebp], 0
$L70954:
	push	33					; 00000021H
	push	OFFSET FLAT:$SG70588
	mov	eax, DWORD PTR -76+[ebp]
	push	eax
	push	14					; 0000000eH
	push	OFFSET FLAT:$SG70589
	mov	ecx, DWORD PTR _html$[ebp]
	push	ecx
	call	_dynbuf_add3_int
	add	esp, 24					; 00000018H
	test	eax, eax
	je	SHORT $L70587
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29872], OFFSET FLAT:$SG70591
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 355		; 00000163H
	jmp	$eva_err$70583
$L70587:

; 356  : 
; 357  : 		/* Find search input */
; 358  : 		tbl->input = NULL;

	mov	ecx, DWORD PTR _tbl$[ebp]
	mov	DWORD PTR [ecx+100], 0

; 359  : 		for(i = 0; i < tbl->cgiinput.nbrows && !tbl->input; i++)

	mov	DWORD PTR _i$[ebp], 0
	jmp	SHORT $L70593
$L70594:
	mov	edx, DWORD PTR _i$[ebp]
	add	edx, 1
	mov	DWORD PTR _i$[ebp], edx
$L70593:
	mov	eax, DWORD PTR _tbl$[ebp]
	mov	ecx, DWORD PTR _i$[ebp]
	cmp	ecx, DWORD PTR [eax+80]
	jae	SHORT $L70595
	mov	edx, DWORD PTR _tbl$[ebp]
	cmp	DWORD PTR [edx+100], 0
	jne	SHORT $L70595

; 360  : 			if(dyntab_cell(&tbl->cgiinput, i, 0)->Line == form->Line)

	push	0
	mov	eax, DWORD PTR _i$[ebp]
	push	eax
	mov	ecx, DWORD PTR _tbl$[ebp]
	add	ecx, 80					; 00000050H
	push	ecx
	call	_dyntab_cell
	add	esp, 12					; 0000000cH
	mov	edx, DWORD PTR _form$[ebp]
	mov	eax, DWORD PTR [eax+40]
	cmp	eax, DWORD PTR [edx+240]
	jne	SHORT $L70596

; 361  : 				tbl->input = dyntab_val(&tbl->cgiinput, i, 0);

	push	0
	mov	ecx, DWORD PTR _i$[ebp]
	push	ecx
	mov	edx, DWORD PTR _tbl$[ebp]
	add	edx, 80					; 00000050H
	push	edx
	call	_dyntab_val
	add	esp, 12					; 0000000cH
	mov	ecx, DWORD PTR _tbl$[ebp]
	mov	DWORD PTR [ecx+100], eax
$L70596:

; 362  : 		if(!tbl->input) tbl->input = "";

	jmp	SHORT $L70594
$L70595:
	mov	edx, DWORD PTR _tbl$[ebp]
	cmp	DWORD PTR [edx+100], 0
	jne	SHORT $L70597
	mov	eax, DWORD PTR _tbl$[ebp]
	mov	DWORD PTR [eax+100], OFFSET FLAT:$SG70598
$L70597:

; 363  : 
; 364  : 		/* If search mode on selected line */
; 365  : 		if(tbl->status & TblCtrl_opensearch && !tbl->b_no_status)

	mov	ecx, DWORD PTR _tbl$[ebp]
	mov	edx, DWORD PTR [ecx+32]
	and	edx, 32					; 00000020H
	test	edx, edx
	je	$L70599
	mov	eax, DWORD PTR _tbl$[ebp]
	cmp	DWORD PTR [eax+36], 0
	jne	$L70599

; 367  : 			/* Read search results */
; 368  : 			if(ctrl_relation_searchlist(cntxt, i_ctrl)) CLEAR_ERROR;

	mov	ecx, DWORD PTR _i_ctrl$[ebp]
	push	ecx
	mov	edx, DWORD PTR _cntxt$[ebp]
	push	edx
	call	_ctrl_relation_searchlist
	add	esp, 8
	test	eax, eax
	je	SHORT $L70600
	push	368					; 00000170H
	push	OFFSET FLAT:$SG70601
	push	OFFSET FLAT:$SG70602
	mov	eax, DWORD PTR _cntxt$[ebp]
	push	eax
	call	_err_clear
	add	esp, 16					; 00000010H
$L70600:

; 369  : 
; 370  : 			/* Add buttons */
; 371  : 			DYNBUF_ADD_STR(html, "<td align=center rowspan=3>");

	push	0
	push	0
	push	27					; 0000001bH
	push	OFFSET FLAT:$SG70605
	mov	ecx, DWORD PTR _html$[ebp]
	push	ecx
	call	_dynbuf_add
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L70604
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29872], OFFSET FLAT:$SG70607
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 371		; 00000173H
	jmp	$eva_err$70583
$L70604:

; 372  : 			if(table_put_closesearch_btn(cntxt, i_ctrl)) STACK_ERROR;

	mov	ecx, DWORD PTR _i_ctrl$[ebp]
	push	ecx
	mov	edx, DWORD PTR _cntxt$[ebp]
	push	edx
	call	_table_put_closesearch_btn
	add	esp, 8
	test	eax, eax
	je	SHORT $L70608
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 372		; 00000174H
	jmp	$eva_err$70583
$L70608:

; 373  : 			if(table_put_functions_btn(cntxt, i_ctrl, add_sz_str("<br>"))) STACK_ERROR;

	push	4
	push	OFFSET FLAT:$SG70610
	mov	ecx, DWORD PTR _i_ctrl$[ebp]
	push	ecx
	mov	edx, DWORD PTR _cntxt$[ebp]
	push	edx
	call	_table_put_functions_btn
	add	esp, 16					; 00000010H
	test	eax, eax
	je	SHORT $L70609
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 373		; 00000175H
	jmp	$eva_err$70583
$L70609:

; 374  : 			DYNBUF_ADD_STR(html, "<br><br>")

	push	0
	push	0
	push	8
	push	OFFSET FLAT:$SG70613
	mov	ecx, DWORD PTR _html$[ebp]
	push	ecx
	call	_dynbuf_add
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L70612
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29872], OFFSET FLAT:$SG70615
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 374		; 00000176H
	jmp	$eva_err$70583
$L70612:

; 375  : 			if(table_put_clear_btn(cntxt, i_ctrl)) STACK_ERROR;

	mov	ecx, DWORD PTR _i_ctrl$[ebp]
	push	ecx
	mov	edx, DWORD PTR _cntxt$[ebp]
	push	edx
	call	_table_put_clear_btn
	add	esp, 8
	test	eax, eax
	je	SHORT $L70616
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 375		; 00000177H
	jmp	$eva_err$70583
$L70616:

; 376  :  			DYNBUF_ADD_STR(html, "</td><td><table border=0 cellpadding=0 cellspacing=0><tr>");

	push	0
	push	0
	push	57					; 00000039H
	push	OFFSET FLAT:$SG70619
	mov	ecx, DWORD PTR _html$[ebp]
	push	ecx
	call	_dynbuf_add
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L70618
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29872], OFFSET FLAT:$SG70621
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 376		; 00000178H
	jmp	$eva_err$70583
$L70618:

; 377  : 
; 378  : 			/* Add filters list input */
; 379  : 			b_label = 1;

	mov	DWORD PTR _b_label$[ebp], 1

; 380  : 			if(table_put_filter_list(cntxt, i_ctrl, &b_label)) STACK_ERROR;

	lea	ecx, DWORD PTR _b_label$[ebp]
	push	ecx
	mov	edx, DWORD PTR _i_ctrl$[ebp]
	push	edx
	mov	eax, DWORD PTR _cntxt$[ebp]
	push	eax
	call	_table_put_filter_list
	add	esp, 12					; 0000000cH
	test	eax, eax
	je	SHORT $L70622
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 380		; 0000017cH
	jmp	$eva_err$70583
$L70622:

; 381  : 			if(b_label) DYNBUF_ADD_STR(html, "</tr><tr>");

	cmp	DWORD PTR _b_label$[ebp], 0
	je	SHORT $L70625
	push	0
	push	0
	push	9
	push	OFFSET FLAT:$SG70626
	mov	edx, DWORD PTR _html$[ebp]
	push	edx
	call	_dynbuf_add
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L70625
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29872], OFFSET FLAT:$SG70628
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 381		; 0000017dH
	jmp	$eva_err$70583
$L70625:

; 382  : 
; 383  : 			/* Add search input */
; 384  : 			b_label = 1;

	mov	DWORD PTR _b_label$[ebp], 1

; 385  : 			if(table_put_search_input(cntxt, i_ctrl, &b_label)) STACK_ERROR;

	lea	edx, DWORD PTR _b_label$[ebp]
	push	edx
	mov	eax, DWORD PTR _i_ctrl$[ebp]
	push	eax
	mov	ecx, DWORD PTR _cntxt$[ebp]
	push	ecx
	call	_table_put_search_input
	add	esp, 12					; 0000000cH
	test	eax, eax
	je	SHORT $L70629
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 385		; 00000181H
	jmp	$eva_err$70583
$L70629:

; 386  : 			if(b_label) DYNBUF_ADD_STR(html, "</tr><tr>");

	cmp	DWORD PTR _b_label$[ebp], 0
	je	SHORT $L70632
	push	0
	push	0
	push	9
	push	OFFSET FLAT:$SG70633
	mov	eax, DWORD PTR _html$[ebp]
	push	eax
	call	_dynbuf_add
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L70632
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29872], OFFSET FLAT:$SG70635
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 386		; 00000182H
	jmp	$eva_err$70583
$L70632:

; 387  : 
; 388  : 			/* Output # of matched objects */
; 389  : 			DYNBUF_ADD_STR(html, "<td align=right valign=top>Résultat<br><br><font size=-1><b>");

	push	0
	push	0
	push	60					; 0000003cH
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
	mov	DWORD PTR [edx+29900], 389		; 00000185H
	jmp	$eva_err$70583
$L70637:

; 390  : 			switch(tbl->totlines)
; 391  : 			{

	mov	eax, DWORD PTR _tbl$[ebp]
	mov	ecx, DWORD PTR [eax+52]
	mov	DWORD PTR -80+[ebp], ecx
	cmp	DWORD PTR -80+[ebp], 0
	je	SHORT $L70645
	cmp	DWORD PTR -80+[ebp], 1
	je	SHORT $L70651
	jmp	SHORT $L70657
$L70645:

; 392  : 			case 0:
; 393  : 				DYNBUF_ADD_STR(html, "Aucune fiche");

	push	0
	push	0
	push	12					; 0000000cH
	push	OFFSET FLAT:$SG70648
	mov	edx, DWORD PTR _html$[ebp]
	push	edx
	call	_dynbuf_add
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L70647
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29872], OFFSET FLAT:$SG70650
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 393		; 00000189H
	jmp	$eva_err$70583
$L70647:

; 394  : 				break;

	jmp	$L70642
$L70651:

; 395  : 
; 396  : 			case 1:
; 397  : 				DYNBUF_ADD_STR(html, "1 fiche")

	push	0
	push	0
	push	7
	push	OFFSET FLAT:$SG70654
	mov	edx, DWORD PTR _html$[ebp]
	push	edx
	call	_dynbuf_add
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L70653
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29872], OFFSET FLAT:$SG70656
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 397		; 0000018dH
	jmp	$eva_err$70583
$L70653:

; 398  : 				break;

	jmp	SHORT $L70642
$L70657:

; 399  : 
; 400  : 			default:
; 401  : 				DYNBUF_ADD3_INT(html, "", tbl->totlines, " fiches");

	push	7
	push	OFFSET FLAT:$SG70659
	mov	edx, DWORD PTR _tbl$[ebp]
	mov	eax, DWORD PTR [edx+52]
	push	eax
	push	0
	push	OFFSET FLAT:$SG70660
	mov	ecx, DWORD PTR _html$[ebp]
	push	ecx
	call	_dynbuf_add3_int
	add	esp, 24					; 00000018H
	test	eax, eax
	je	SHORT $L70658
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29872], OFFSET FLAT:$SG70662
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 401		; 00000191H
	jmp	$eva_err$70583
$L70658:
$L70642:

; 403  : 			DYNBUF_ADD_STR(html, "</b></font>");

	push	0
	push	0
	push	11					; 0000000bH
	push	OFFSET FLAT:$SG70665
	mov	ecx, DWORD PTR _html$[ebp]
	push	ecx
	call	_dynbuf_add
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L70664
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29872], OFFSET FLAT:$SG70667
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 403		; 00000193H
	jmp	$eva_err$70583
$L70664:

; 404  : 
; 405  : 			/* Limit rows in list if applicable */
; 406  : 			if(tbl->idobj.nbrows > 200) tbl->idobj.nbrows = 200;

	mov	ecx, DWORD PTR _tbl$[ebp]
	cmp	DWORD PTR [ecx+184], 200		; 000000c8H
	jbe	SHORT $L70668
	mov	edx, DWORD PTR _tbl$[ebp]
	mov	DWORD PTR [edx+184], 200		; 000000c8H
$L70668:

; 407  : 
; 408  : 			/* Output results / selection list input */
; 409  : 			DYNBUF_ADD_STR(html, "</td><td>");

	push	0
	push	0
	push	9
	push	OFFSET FLAT:$SG70671
	mov	eax, DWORD PTR _html$[ebp]
	push	eax
	call	_dynbuf_add
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L70670
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29872], OFFSET FLAT:$SG70673
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 409		; 00000199H
	jmp	$eva_err$70583
$L70670:

; 410  : 			CTRL_CGINAMESUBFIELD(&name, NULL, "SEL");

	push	3
	push	OFFSET FLAT:$SG70676
	push	68					; 00000044H
	lea	eax, DWORD PTR _name$[ebp]
	push	eax
	push	1
	push	0
	mov	ecx, DWORD PTR _ctrl$[ebp]
	push	ecx
	mov	edx, DWORD PTR _cntxt$[ebp]
	push	edx
	call	_ctrl_cgi_name
	add	esp, 32					; 00000020H
	test	eax, eax
	je	SHORT $L70675
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 410		; 0000019aH
	jmp	$eva_err$70583
$L70675:

; 411  : 			if(ctrl_relation_optionslist(cntxt, i_ctrl, &optlist) ||
; 412  : 				put_html_list(cntxt, name, &optlist, &ctrl->val, ctrl->LINES ? ctrl->LINES + 1 : 5, 60, 0, 1, 1, ctrl->LABEL_NOSEL))

	lea	ecx, DWORD PTR _optlist$[ebp]
	push	ecx
	mov	edx, DWORD PTR _i_ctrl$[ebp]
	push	edx
	mov	eax, DWORD PTR _cntxt$[ebp]
	push	eax
	call	_ctrl_relation_optionslist
	add	esp, 12					; 0000000cH
	test	eax, eax
	jne	SHORT $L70678
	mov	ecx, DWORD PTR _ctrl$[ebp]
	cmp	DWORD PTR [ecx+376], 0
	je	SHORT $L70955
	mov	edx, DWORD PTR _ctrl$[ebp]
	mov	eax, DWORD PTR [edx+376]
	add	eax, 1
	mov	DWORD PTR -84+[ebp], eax
	jmp	SHORT $L70956
$L70955:
	mov	DWORD PTR -84+[ebp], 5
$L70956:
	mov	ecx, DWORD PTR _ctrl$[ebp]
	mov	edx, DWORD PTR [ecx+348]
	push	edx
	push	1
	push	1
	push	0
	push	60					; 0000003cH
	mov	eax, DWORD PTR -84+[ebp]
	push	eax
	mov	ecx, DWORD PTR _ctrl$[ebp]
	add	ecx, 64					; 00000040H
	push	ecx
	lea	edx, DWORD PTR _optlist$[ebp]
	push	edx
	mov	eax, DWORD PTR _name$[ebp]
	push	eax
	mov	ecx, DWORD PTR _cntxt$[ebp]
	push	ecx
	call	_put_html_list
	add	esp, 40					; 00000028H
	test	eax, eax
	je	SHORT $L70677
$L70678:

; 413  : 				STACK_ERROR;

	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 413		; 0000019dH
	jmp	$eva_err$70583
$L70677:

; 414  : 
; 415  : 			/* Output current selection hidden input */
; 416  : 			name->data[0] = 'M';

	mov	eax, DWORD PTR _name$[ebp]
	mov	BYTE PTR [eax+8], 77			; 0000004dH

; 417  : 			for(i = 0; i < optlist.nbrows; i++) if(dyntab_cell(&optlist, i, 0)->col)

	mov	DWORD PTR _i$[ebp], 0
	jmp	SHORT $L70679
$L70680:
	mov	ecx, DWORD PTR _i$[ebp]
	add	ecx, 1
	mov	DWORD PTR _i$[ebp], ecx
$L70679:
	mov	edx, DWORD PTR _i$[ebp]
	cmp	edx, DWORD PTR _optlist$[ebp]
	jae	$L70681
	push	0
	mov	eax, DWORD PTR _i$[ebp]
	push	eax
	lea	ecx, DWORD PTR _optlist$[ebp]
	push	ecx
	call	_dyntab_cell
	add	esp, 12					; 0000000cH
	cmp	DWORD PTR [eax+56], 0
	je	$L70698

; 419  : 				DYNBUF_ADD3_BUF(html, "<input type=hidden name='", name, NO_CONV, "'");

	cmp	DWORD PTR _name$[ebp], 0
	je	SHORT $L70957
	mov	edx, DWORD PTR _name$[ebp]
	mov	eax, DWORD PTR [edx+4]
	mov	DWORD PTR -88+[ebp], eax
	jmp	SHORT $L70958
$L70957:
	mov	DWORD PTR -88+[ebp], 0
$L70958:
	cmp	DWORD PTR _name$[ebp], 0
	je	SHORT $L70959
	mov	ecx, DWORD PTR _name$[ebp]
	add	ecx, 8
	mov	DWORD PTR -92+[ebp], ecx
	jmp	SHORT $L70960
$L70959:
	mov	DWORD PTR -92+[ebp], 0
$L70960:
	push	1
	push	OFFSET FLAT:$SG70686
	push	0
	push	0
	mov	edx, DWORD PTR -88+[ebp]
	push	edx
	mov	eax, DWORD PTR -92+[ebp]
	push	eax
	push	25					; 00000019H
	push	OFFSET FLAT:$SG70687
	mov	ecx, DWORD PTR _html$[ebp]
	push	ecx
	call	_dynbuf_add3
	add	esp, 36					; 00000024H
	test	eax, eax
	je	SHORT $L70685
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29872], OFFSET FLAT:$SG70689
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 419		; 000001a3H
	jmp	$eva_err$70583
$L70685:

; 420  : 				DYNBUF_ADD3_CELL(html, " value=", &optlist, i, 0, NO_CONV, ">");

	push	1
	push	OFFSET FLAT:$SG70692
	push	0
	push	0
	push	0
	mov	ecx, DWORD PTR _i$[ebp]
	push	ecx
	lea	edx, DWORD PTR _optlist$[ebp]
	push	edx
	call	_dyntab_sz
	add	esp, 12					; 0000000cH
	push	eax
	push	0
	mov	eax, DWORD PTR _i$[ebp]
	push	eax
	lea	ecx, DWORD PTR _optlist$[ebp]
	push	ecx
	call	_dyntab_val
	add	esp, 12					; 0000000cH
	push	eax
	push	7
	push	OFFSET FLAT:$SG70693
	mov	edx, DWORD PTR _html$[ebp]
	push	edx
	call	_dynbuf_add3
	add	esp, 36					; 00000024H
	test	eax, eax
	je	SHORT $L70691
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29872], OFFSET FLAT:$SG70695
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 420		; 000001a4H
	jmp	$eva_err$70583
$L70691:

; 421  : 				if(cntxt->debug & DEBUG_HTML) DYNBUF_ADD_STR(cntxt->form->html, "\n");

	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	eax, DWORD PTR [edx+29860]
	and	eax, 128				; 00000080H
	test	eax, eax
	je	SHORT $L70698
	push	0
	push	0
	push	1
	push	OFFSET FLAT:$SG70699
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	edx, DWORD PTR [ecx+80]
	mov	eax, DWORD PTR [edx+232]
	push	eax
	call	_dynbuf_add
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L70698
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29872], OFFSET FLAT:$SG70701
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 421		; 000001a5H
	jmp	$eva_err$70583
$L70698:

; 423  : 
; 424  : 			/* Output warning if partial list */
; 425  : 			if(tbl->idobj.nbrows < tbl->totlines)

	jmp	$L70680
$L70681:
	mov	eax, DWORD PTR _tbl$[ebp]
	mov	ecx, DWORD PTR _tbl$[ebp]
	mov	edx, DWORD PTR [eax+184]
	cmp	edx, DWORD PTR [ecx+52]
	jae	SHORT $L70702

; 428  : 				"</tr><tr><td colspan=2 align=center><font size=-2 color=#EE4444>"
; 429  : 				"Attention : liste partielle - précisez votre recherche<br>"
; 430  : 				"Cette liste est limitée à ", tbl->idobj.nbrows, " items (fiches les plus récentes)</font></td>");

	push	45					; 0000002dH
	push	OFFSET FLAT:$SG70704
	mov	eax, DWORD PTR _tbl$[ebp]
	mov	ecx, DWORD PTR [eax+184]
	push	ecx
	push	148					; 00000094H
	push	OFFSET FLAT:$SG70705
	mov	edx, DWORD PTR _html$[ebp]
	push	edx
	call	_dynbuf_add3_int
	add	esp, 24					; 00000018H
	test	eax, eax
	je	SHORT $L70703
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29872], OFFSET FLAT:$SG70707
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 430		; 000001aeH
	jmp	$eva_err$70583
$L70703:

; 432  : 
; 433  : 			/* Output creation button if no objects found & applicable */
; 434  : 			else if(!tbl->idobj.nbrows && table_put_addnew_btn(cntxt, i_ctrl,

	jmp	SHORT $L70709
$L70702:

; 435  : 						add_sz_str("</tr><tr><td colspan=2 align=center><font size=-2>"),
; 436  : 						add_sz_str("</font></td>"),
; 437  : 						12))

	mov	edx, DWORD PTR _tbl$[ebp]
	cmp	DWORD PTR [edx+184], 0
	jne	SHORT $L70709
	push	12					; 0000000cH
	push	12					; 0000000cH
	push	OFFSET FLAT:$SG70710
	push	50					; 00000032H
	push	OFFSET FLAT:$SG70711
	mov	eax, DWORD PTR _i_ctrl$[ebp]
	push	eax
	mov	ecx, DWORD PTR _cntxt$[ebp]
	push	ecx
	call	_table_put_addnew_btn
	add	esp, 28					; 0000001cH
	test	eax, eax
	je	SHORT $L70709

; 438  : 					STACK_ERROR;

	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 438		; 000001b6H
	jmp	$eva_err$70583
$L70709:

; 439  : 
; 440  : 			DYNBUF_ADD_STR(html, "</tr></table></td>");

	push	0
	push	0
	push	18					; 00000012H
	push	OFFSET FLAT:$SG70714
	mov	eax, DWORD PTR _html$[ebp]
	push	eax
	call	_dynbuf_add
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L70713
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29872], OFFSET FLAT:$SG70716
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 440		; 000001b8H
	jmp	$eva_err$70583
$L70713:

; 442  : 		else if(!ctrl->val.nbrows)

	jmp	$L70753
$L70599:
	mov	eax, DWORD PTR _ctrl$[ebp]
	cmp	DWORD PTR [eax+64], 0
	jne	$L70718

; 444  : 			DYNBUF_ADD_STR(html, "<td>");

	push	0
	push	0
	push	4
	push	OFFSET FLAT:$SG70721
	mov	ecx, DWORD PTR _html$[ebp]
	push	ecx
	call	_dynbuf_add
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L70720
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29872], OFFSET FLAT:$SG70723
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 444		; 000001bcH
	jmp	$eva_err$70583
$L70720:

; 445  : 			if(table_put_opensearch_btn(cntxt, i_ctrl, NULL)) STACK_ERROR;

	push	0
	mov	ecx, DWORD PTR _i_ctrl$[ebp]
	push	ecx
	mov	edx, DWORD PTR _cntxt$[ebp]
	push	edx
	call	_table_put_opensearch_btn
	add	esp, 12					; 0000000cH
	test	eax, eax
	je	SHORT $L70725
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 445		; 000001bdH
	jmp	$eva_err$70583
$L70725:

; 446  : 			if(table_put_search_input(cntxt, i_ctrl, &b_label)) STACK_ERROR;

	lea	ecx, DWORD PTR _b_label$[ebp]
	push	ecx
	mov	edx, DWORD PTR _i_ctrl$[ebp]
	push	edx
	mov	eax, DWORD PTR _cntxt$[ebp]
	push	eax
	call	_table_put_search_input
	add	esp, 12					; 0000000cH
	test	eax, eax
	je	SHORT $L70726
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 446		; 000001beH
	jmp	$eva_err$70583
$L70726:

; 447  : 			DYNBUF_ADD_STR(html, "</td>");

	push	0
	push	0
	push	5
	push	OFFSET FLAT:$SG70729
	mov	edx, DWORD PTR _html$[ebp]
	push	edx
	call	_dynbuf_add
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L70728
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29872], OFFSET FLAT:$SG70731
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 447		; 000001bfH
	jmp	$eva_err$70583
$L70728:

; 449  : 		else

	jmp	$L70753
$L70718:

; 451  : 			/* Output buttons & list for values */
; 452  : 			DYNBUF_ADD_STR(html, "<td>");

	push	0
	push	0
	push	4
	push	OFFSET FLAT:$SG70735
	mov	edx, DWORD PTR _html$[ebp]
	push	edx
	call	_dynbuf_add
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L70734
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29872], OFFSET FLAT:$SG70737
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 452		; 000001c4H
	jmp	$eva_err$70583
$L70734:

; 453  : 			if(table_put_opensearch_btn(cntxt, i_ctrl, NULL)) STACK_ERROR;

	push	0
	mov	edx, DWORD PTR _i_ctrl$[ebp]
	push	edx
	mov	eax, DWORD PTR _cntxt$[ebp]
	push	eax
	call	_table_put_opensearch_btn
	add	esp, 12					; 0000000cH
	test	eax, eax
	je	SHORT $L70739
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 453		; 000001c5H
	jmp	$eva_err$70583
$L70739:

; 454  : 			DYNBUF_ADD_STR(html, "</td><td>");

	push	0
	push	0
	push	9
	push	OFFSET FLAT:$SG70742
	mov	edx, DWORD PTR _html$[ebp]
	push	edx
	call	_dynbuf_add
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L70741
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29872], OFFSET FLAT:$SG70744
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 454		; 000001c6H
	jmp	$eva_err$70583
$L70741:

; 455  : 			if(ctrl_relation_put_values(cntxt, i_ctrl)) STACK_ERROR;

	mov	edx, DWORD PTR _i_ctrl$[ebp]
	push	edx
	mov	eax, DWORD PTR _cntxt$[ebp]
	push	eax
	call	_ctrl_relation_put_values
	add	esp, 8
	test	eax, eax
	je	SHORT $L70745
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 455		; 000001c7H
	jmp	$eva_err$70583
$L70745:

; 456  : 			DYNBUF_ADD_STR(html, "</td><td>");

	push	0
	push	0
	push	9
	push	OFFSET FLAT:$SG70748
	mov	edx, DWORD PTR _html$[ebp]
	push	edx
	call	_dynbuf_add
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L70747
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29872], OFFSET FLAT:$SG70750
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 456		; 000001c8H
	jmp	$eva_err$70583
$L70747:

; 457  : 			if(table_put_clear_btn(cntxt, i_ctrl)) STACK_ERROR;

	mov	edx, DWORD PTR _i_ctrl$[ebp]
	push	edx
	mov	eax, DWORD PTR _cntxt$[ebp]
	push	eax
	call	_table_put_clear_btn
	add	esp, 8
	test	eax, eax
	je	SHORT $L70751
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 457		; 000001c9H
	jmp	$eva_err$70583
$L70751:

; 458  : 			DYNBUF_ADD_STR(html, "</td>");

	push	0
	push	0
	push	5
	push	OFFSET FLAT:$SG70754
	mov	edx, DWORD PTR _html$[ebp]
	push	edx
	call	_dynbuf_add
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L70753
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29872], OFFSET FLAT:$SG70756
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 458		; 000001caH
	jmp	$eva_err$70583
$L70753:

; 460  : 
; 461  : 		/* Output hidden input for control */
; 462  : 		for(i = 0; !i || i < ctrl->val.nbrows; i++) if(ctrl_put_hidden(cntxt, ctrl, i)) STACK_ERROR;

	mov	DWORD PTR _i$[ebp], 0
	jmp	SHORT $L70757
$L70758:
	mov	edx, DWORD PTR _i$[ebp]
	add	edx, 1
	mov	DWORD PTR _i$[ebp], edx
$L70757:
	cmp	DWORD PTR _i$[ebp], 0
	je	SHORT $L70760
	mov	eax, DWORD PTR _ctrl$[ebp]
	mov	ecx, DWORD PTR _i$[ebp]
	cmp	ecx, DWORD PTR [eax+64]
	jae	SHORT $L70759
$L70760:
	mov	edx, DWORD PTR _i$[ebp]
	push	edx
	mov	eax, DWORD PTR _ctrl$[ebp]
	push	eax
	mov	ecx, DWORD PTR _cntxt$[ebp]
	push	ecx
	call	_ctrl_put_hidden
	add	esp, 12					; 0000000cH
	test	eax, eax
	je	SHORT $L70761
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 462		; 000001ceH
	jmp	SHORT $eva_err$70583
$L70761:
	jmp	SHORT $L70758
$L70759:

; 463  : 
; 464  : 		/* Output table footer */
; 465  : 		DYNBUF_ADD_STR(html, "</tr></table>");

	push	0
	push	0
	push	13					; 0000000dH
	push	OFFSET FLAT:$SG70764
	mov	eax, DWORD PTR _html$[ebp]
	push	eax
	call	_dynbuf_add
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L70763
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29872], OFFSET FLAT:$SG70766
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 465		; 000001d1H
	jmp	SHORT $eva_err$70583
$L70763:

; 466  : 		if(table_put_status(cntxt, i_ctrl)) STACK_ERROR;

	mov	eax, DWORD PTR _i_ctrl$[ebp]
	push	eax
	mov	ecx, DWORD PTR _cntxt$[ebp]
	push	ecx
	call	_table_put_status
	add	esp, 8
	test	eax, eax
	je	SHORT $L70767
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 466		; 000001d2H
	jmp	SHORT $eva_err$70583
$L70767:
$eva_noerr$70769:

; 470  : 
; 471  : 	RETURN_OK_CLEANUP;

	push	0
	push	OFFSET FLAT:$SG70770
	push	OFFSET FLAT:$SG70771
	mov	eax, DWORD PTR _cntxt$[ebp]
	push	eax
	call	_err_clear
	add	esp, 16					; 00000010H
$eva_err$70583:
	mov	ecx, DWORD PTR _cntxt$[ebp]
	cmp	DWORD PTR [ecx+29872], 0
	je	SHORT $L70772
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	eax, DWORD PTR [edx+29900]
	push	eax
	push	OFFSET FLAT:$SG70773
	push	OFFSET FLAT:$SG70774
	mov	ecx, DWORD PTR _cntxt$[ebp]
	push	ecx
	call	_err_add_context
	add	esp, 16					; 00000010H
$L70772:
	lea	edx, DWORD PTR _optlist$[ebp]
	push	edx
	call	_dyntab_free
	add	esp, 4
	lea	eax, DWORD PTR _objdata$[ebp]
	push	eax
	call	_dyntab_free
	add	esp, 4
	mov	ecx, DWORD PTR _name$[ebp]
	push	ecx
	call	_mem_free
	add	esp, 4
	mov	DWORD PTR _name$[ebp], 0
	mov	edx, DWORD PTR _cntxt$[ebp]
	xor	eax, eax
	cmp	DWORD PTR [edx+29872], 0
	setne	al

; 472  : }

	mov	esp, ebp
	pop	ebp
	ret	0
_ctrl_add_relation_auto ENDP
_TEXT	ENDS
PUBLIC	_ctrl_relation_put_table
_DATA	SEGMENT
	ORG $+1
$SG70799 DB	'D:\Travail\ABI\EVA\V4.0\CGI\Brunix-2016\ctrl_input_rel.c'
	DB	00H
	ORG $+3
$SG70800 DB	'ctrl_relation_put_table', 00H
$SG70802 DB	'D:\Travail\ABI\EVA\V4.0\CGI\Brunix-2016\ctrl_input_rel.c'
	DB	00H
	ORG $+3
$SG70803 DB	'ctrl_relation_put_table', 00H
_DATA	ENDS
_TEXT	SEGMENT
_cntxt$ = 8
_i_ctrl$ = 12
_cb$ = 16
_form$ = -4
_ctrl$ = -12
_tbl$ = -8
_b_linesel$70793 = -16
_status$70794 = -20
_ctrl_relation_put_table PROC NEAR

; 486  : ){

	push	ebp
	mov	ebp, esp
	sub	esp, 24					; 00000018H

; 487  : 	EVA_form *form = cntxt->form;

	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	ecx, DWORD PTR [eax+80]
	mov	DWORD PTR _form$[ebp], ecx

; 488  : 	EVA_ctrl *ctrl = form->ctrl + i_ctrl;

	mov	edx, DWORD PTR _i_ctrl$[ebp]
	imul	edx, 480				; 000001e0H
	mov	eax, DWORD PTR _form$[ebp]
	mov	ecx, DWORD PTR [eax]
	add	ecx, edx
	mov	DWORD PTR _ctrl$[ebp], ecx

; 489  : 	ObjTableFormat *tbl = ctrl->objtbl;

	mov	edx, DWORD PTR _ctrl$[ebp]
	mov	eax, DWORD PTR [edx+232]
	mov	DWORD PTR _tbl$[ebp], eax

; 490  : 	if(tbl)

	cmp	DWORD PTR _tbl$[ebp], 0
	je	$eva_noerr$70798

; 492  : 		int b_linesel = !form->Line || (!tbl->ctrlline && form->Line == 1) || tbl->ctrlline == form->Line;

	mov	ecx, DWORD PTR _form$[ebp]
	cmp	DWORD PTR [ecx+240], 0
	je	SHORT $L70963
	mov	edx, DWORD PTR _tbl$[ebp]
	cmp	DWORD PTR [edx+56], 0
	jne	SHORT $L70962
	mov	eax, DWORD PTR _form$[ebp]
	cmp	DWORD PTR [eax+240], 1
	je	SHORT $L70963
$L70962:
	mov	ecx, DWORD PTR _tbl$[ebp]
	mov	edx, DWORD PTR _form$[ebp]
	mov	eax, DWORD PTR [ecx+56]
	cmp	eax, DWORD PTR [edx+240]
	je	SHORT $L70963
	mov	DWORD PTR -24+[ebp], 0
	jmp	SHORT $L70964
$L70963:
	mov	DWORD PTR -24+[ebp], 1
$L70964:
	mov	ecx, DWORD PTR -24+[ebp]
	mov	DWORD PTR _b_linesel$70793[ebp], ecx

; 493  : 		int status = tbl->status;

	mov	edx, DWORD PTR _tbl$[ebp]
	mov	eax, DWORD PTR [edx+32]
	mov	DWORD PTR _status$70794[ebp], eax

; 494  : 		if(!b_linesel)

	cmp	DWORD PTR _b_linesel$70793[ebp], 0
	jne	SHORT $L70795

; 496  : 			tbl->b_no_status = 1;

	mov	ecx, DWORD PTR _tbl$[ebp]
	mov	DWORD PTR [ecx+36], 1

; 497  : 			tbl->status &= ~(TblCtrl_opensearch | TblCtrl_opensel | TblCtrl_openaddnew);

	mov	edx, DWORD PTR _tbl$[ebp]
	mov	eax, DWORD PTR [edx+32]
	and	eax, -673				; fffffd5fH
	mov	ecx, DWORD PTR _tbl$[ebp]
	mov	DWORD PTR [ecx+32], eax
$L70795:

; 499  : 		if(cb(cntxt, i_ctrl)) STACK_ERROR;

	mov	edx, DWORD PTR _i_ctrl$[ebp]
	push	edx
	mov	eax, DWORD PTR _cntxt$[ebp]
	push	eax
	call	DWORD PTR _cb$[ebp]
	add	esp, 8
	test	eax, eax
	je	SHORT $L70796
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 499		; 000001f3H
	jmp	SHORT $eva_err$70797
$L70796:

; 500  : 		tbl->b_no_status = 0;

	mov	edx, DWORD PTR _tbl$[ebp]
	mov	DWORD PTR [edx+36], 0

; 501  : 		tbl->status = status;

	mov	eax, DWORD PTR _tbl$[ebp]
	mov	ecx, DWORD PTR _status$70794[ebp]
	mov	DWORD PTR [eax+32], ecx
$eva_noerr$70798:

; 503  : 
; 504  : 	RETURN_OK_CLEANUP;

	push	0
	push	OFFSET FLAT:$SG70799
	push	OFFSET FLAT:$SG70800
	mov	edx, DWORD PTR _cntxt$[ebp]
	push	edx
	call	_err_clear
	add	esp, 16					; 00000010H
$eva_err$70797:
	mov	eax, DWORD PTR _cntxt$[ebp]
	cmp	DWORD PTR [eax+29872], 0
	je	SHORT $L70801
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	edx, DWORD PTR [ecx+29900]
	push	edx
	push	OFFSET FLAT:$SG70802
	push	OFFSET FLAT:$SG70803
	mov	eax, DWORD PTR _cntxt$[ebp]
	push	eax
	call	_err_add_context
	add	esp, 16					; 00000010H
$L70801:
	mov	ecx, DWORD PTR _cntxt$[ebp]
	xor	eax, eax
	cmp	DWORD PTR [ecx+29872], 0
	setne	al

; 505  : }

	mov	esp, ebp
	pop	ebp
	ret	0
_ctrl_relation_put_table ENDP
_TEXT	ENDS
PUBLIC	_ctrl_add_relation
EXTRN	_table_read_controls:NEAR
EXTRN	_ctrl_put_html_input_list:NEAR
EXTRN	_table_put_html_obj_list:NEAR
EXTRN	_sql_drop_table:NEAR
EXTRN	_ctrl_format_pos:NEAR
EXTRN	_strncmp:NEAR
_BSS	SEGMENT
	ALIGN	4

$SG70820 DB	01H DUP (?)
	ALIGN	4

$SG70862 DB	01H DUP (?)
	ALIGN	4

$SG70864 DB	01H DUP (?)
_BSS	ENDS
_DATA	SEGMENT
$SG70818 DB	'_EVA_INPUTMODE', 00H
	ORG $+1
$SG70833 DB	'_EVA_TABLE', 00H
	ORG $+1
$SG70837 DB	'_EVA_LIST', 00H
	ORG $+2
$SG70844 DB	'DROP TABLE IF EXISTS IdList,IdListMatch,ValList', 00H
$SG70851 DB	' -->', 0aH, 00H
	ORG $+2
$SG70852 DB	0aH, '<!--- Start Relation ', 00H
	ORG $+1
$SG70854 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70857 DB	'_EVA_TABLE', 00H
	ORG $+1
$SG70860 DB	'No', 00H
	ORG $+1
$SG70866 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70875 DB	'_EVA_LIST', 00H
	ORG $+2
$SG70877 DB	'D:\Travail\ABI\EVA\V4.0\CGI\Brunix-2016\ctrl_input_rel.c'
	DB	00H
	ORG $+3
$SG70878 DB	'ctrl_add_relation', 00H
	ORG $+2
$SG70884 DB	'IdList,IdListMatch,ValList', 00H
	ORG $+1
$SG70888 DB	' -->', 0aH, 00H
	ORG $+2
$SG70889 DB	0aH, '<!--- End   Relation ', 00H
	ORG $+1
$SG70891 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70897 DB	' -->', 0aH, 00H
	ORG $+2
$SG70898 DB	0aH, '<!--- Start Relation ', 00H
	ORG $+1
$SG70900 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70904 DB	'_EVA_TABLE', 00H
	ORG $+1
$SG70905 DB	'_FMT', 00H
	ORG $+3
$SG70911 DB	'IdList,IdListMatch,ValList', 00H
	ORG $+1
$SG70915 DB	' -->', 0aH, 00H
	ORG $+2
$SG70916 DB	0aH, '<!--- End   Relation ', 00H
	ORG $+1
$SG70918 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70921 DB	'D:\Travail\ABI\EVA\V4.0\CGI\Brunix-2016\ctrl_input_rel.c'
	DB	00H
	ORG $+3
$SG70922 DB	'ctrl_add_relation', 00H
	ORG $+2
$SG70924 DB	'D:\Travail\ABI\EVA\V4.0\CGI\Brunix-2016\ctrl_input_rel.c'
	DB	00H
	ORG $+3
$SG70925 DB	'ctrl_add_relation', 00H
_DATA	ENDS
_TEXT	SEGMENT
_cntxt$ = 8
_i_ctrl$ = 12
_form$ = -8
_ctrl$ = -48
_tbl$ = -12
_optlist$ = -44
_cinputmode$ = -24
_inputmode$ = -16
_szinputmode$ = -4
_i$ = -20
_ctrl_add_relation PROC NEAR

; 518  : ){

	push	ebp
	mov	ebp, esp
	sub	esp, 64					; 00000040H

; 519  : 	EVA_form *form = cntxt->form;

	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	ecx, DWORD PTR [eax+80]
	mov	DWORD PTR _form$[ebp], ecx

; 520  : 	EVA_ctrl *ctrl = form->ctrl + i_ctrl;

	mov	edx, DWORD PTR _i_ctrl$[ebp]
	imul	edx, 480				; 000001e0H
	mov	eax, DWORD PTR _form$[ebp]
	mov	ecx, DWORD PTR [eax]
	add	ecx, edx
	mov	DWORD PTR _ctrl$[ebp], ecx

; 521  : 	ObjTableFormat *tbl = ctrl->objtbl;

	mov	edx, DWORD PTR _ctrl$[ebp]
	mov	eax, DWORD PTR [edx+232]
	mov	DWORD PTR _tbl$[ebp], eax

; 522  : 	DynTable optlist = { 0 };

	mov	DWORD PTR _optlist$[ebp], 0
	xor	ecx, ecx
	mov	DWORD PTR _optlist$[ebp+4], ecx
	mov	DWORD PTR _optlist$[ebp+8], ecx
	mov	DWORD PTR _optlist$[ebp+12], ecx
	mov	DWORD PTR _optlist$[ebp+16], ecx

; 523  : 	DynTableCell *cinputmode = CTRL_ATTR_CELL(INPUTMODE);

	cmp	DWORD PTR _ctrl$[ebp], 0
	je	SHORT $L70966
	push	0
	push	-1
	push	OFFSET FLAT:$SG70818
	mov	edx, DWORD PTR _ctrl$[ebp]
	add	edx, 44					; 0000002cH
	push	edx
	call	_dyntab_field_cell
	add	esp, 16					; 00000010H
	mov	DWORD PTR -52+[ebp], eax
	jmp	SHORT $L70967
$L70966:
	mov	DWORD PTR -52+[ebp], 0
$L70967:
	mov	eax, DWORD PTR -52+[ebp]
	mov	DWORD PTR _cinputmode$[ebp], eax

; 524  : 	char *inputmode = (cinputmode && cinputmode->len) ? cinputmode->txt : "";

	cmp	DWORD PTR _cinputmode$[ebp], 0
	je	SHORT $L70968
	mov	ecx, DWORD PTR _cinputmode$[ebp]
	cmp	DWORD PTR [ecx+4], 0
	je	SHORT $L70968
	mov	edx, DWORD PTR _cinputmode$[ebp]
	mov	eax, DWORD PTR [edx]
	mov	DWORD PTR -56+[ebp], eax
	jmp	SHORT $L70969
$L70968:
	mov	DWORD PTR -56+[ebp], OFFSET FLAT:$SG70820
$L70969:
	mov	ecx, DWORD PTR -56+[ebp]
	mov	DWORD PTR _inputmode$[ebp], ecx

; 525  : 	size_t szinputmode = cinputmode ? cinputmode->len : 0;

	cmp	DWORD PTR _cinputmode$[ebp], 0
	je	SHORT $L70970
	mov	edx, DWORD PTR _cinputmode$[ebp]
	mov	eax, DWORD PTR [edx+4]
	mov	DWORD PTR -60+[ebp], eax
	jmp	SHORT $L70971
$L70970:
	mov	DWORD PTR -60+[ebp], 0
$L70971:
	mov	ecx, DWORD PTR -60+[ebp]
	mov	DWORD PTR _szinputmode$[ebp], ecx

; 526  : 	unsigned long i;
; 527  : 
; 528  : 	switch(form->step)
; 529  : 	{

	mov	edx, DWORD PTR _form$[ebp]
	mov	eax, DWORD PTR [edx+176]
	mov	DWORD PTR -64+[ebp], eax
	cmp	DWORD PTR -64+[ebp], 7
	ja	$L70919
	mov	ecx, DWORD PTR -64+[ebp]
	jmp	DWORD PTR $L70972[ecx*4]
$L70827:

; 530  : 	case CtrlRead:
; 531  : 		/* Control value is stored in IdRelObj field */
; 532  : 		if(ctrl->storage) ctrl->storage = 3;

	mov	edx, DWORD PTR _ctrl$[ebp]
	cmp	DWORD PTR [edx+36], 0
	je	SHORT $L70828
	mov	eax, DWORD PTR _ctrl$[ebp]
	mov	DWORD PTR [eax+36], 3
$L70828:

; 533  : 
; 534  : 		/* Read table / list parameters */
; 535  : 		if(table_read_controls(cntxt, i_ctrl, NULL)) STACK_ERROR;

	push	0
	mov	ecx, DWORD PTR _i_ctrl$[ebp]
	push	ecx
	mov	edx, DWORD PTR _cntxt$[ebp]
	push	edx
	call	_table_read_controls
	add	esp, 12					; 0000000cH
	test	eax, eax
	je	SHORT $L70830
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 535		; 00000217H
	jmp	$eva_err$70831
$L70830:

; 536  : 		tbl = ctrl->objtbl;

	mov	ecx, DWORD PTR _ctrl$[ebp]
	mov	edx, DWORD PTR [ecx+232]
	mov	DWORD PTR _tbl$[ebp], edx

; 537  : 		tbl->input = dyntab_val(&tbl->cgiinput, 0, 0);

	push	0
	push	0
	mov	eax, DWORD PTR _tbl$[ebp]
	add	eax, 80					; 00000050H
	push	eax
	call	_dyntab_val
	add	esp, 12					; 0000000cH
	mov	ecx, DWORD PTR _tbl$[ebp]
	mov	DWORD PTR [ecx+100], eax

; 538  : 
; 539  : 		/* Handle display mode */
; 540  : 		if(!strcmp("_EVA_TABLE", inputmode))

	mov	edx, DWORD PTR _inputmode$[ebp]
	push	edx
	push	OFFSET FLAT:$SG70833
	call	_strcmp
	add	esp, 8
	test	eax, eax
	jne	SHORT $L70832

; 542  : 			if(table_process_controls(cntxt, i_ctrl)) STACK_ERROR;

	mov	eax, DWORD PTR _i_ctrl$[ebp]
	push	eax
	mov	ecx, DWORD PTR _cntxt$[ebp]
	push	ecx
	call	_table_process_controls
	add	esp, 8
	test	eax, eax
	je	SHORT $L70834
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 542		; 0000021eH
	jmp	$eva_err$70831
$L70834:

; 544  : 		else if(!strncmp(inputmode, add_sz_str("_EVA_LIST")))

	jmp	SHORT $L70840
$L70832:
	push	9
	push	OFFSET FLAT:$SG70837
	mov	eax, DWORD PTR _inputmode$[ebp]
	push	eax
	call	_strncmp
	add	esp, 12					; 0000000cH
	test	eax, eax
	jne	SHORT $L70836

; 546  : 			if(table_process_controls(cntxt, i_ctrl)) STACK_ERROR;

	mov	ecx, DWORD PTR _i_ctrl$[ebp]
	push	ecx
	mov	edx, DWORD PTR _cntxt$[ebp]
	push	edx
	call	_table_process_controls
	add	esp, 8
	test	eax, eax
	je	SHORT $L70838
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 546		; 00000222H
	jmp	$eva_err$70831
$L70838:

; 548  : 		else

	jmp	SHORT $L70840
$L70836:

; 550  : 			if(ctrl_add_relation_auto(cntxt, i_ctrl)) STACK_ERROR;

	mov	ecx, DWORD PTR _i_ctrl$[ebp]
	push	ecx
	mov	edx, DWORD PTR _cntxt$[ebp]
	push	edx
	call	_ctrl_add_relation_auto
	add	esp, 8
	test	eax, eax
	je	SHORT $L70840
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 550		; 00000226H
	jmp	$eva_err$70831
$L70840:

; 552  : 
; 553  : 		/* Set relation bit on values & drop temp tables */
; 554  : 		for(i = 0; i < ctrl->val.nbrows; i++) dyntab_cell(&ctrl->val, i, 0)->b_relation = 1;

	mov	DWORD PTR _i$[ebp], 0
	jmp	SHORT $L70841
$L70842:
	mov	ecx, DWORD PTR _i$[ebp]
	add	ecx, 1
	mov	DWORD PTR _i$[ebp], ecx
$L70841:
	mov	edx, DWORD PTR _ctrl$[ebp]
	mov	eax, DWORD PTR _i$[ebp]
	cmp	eax, DWORD PTR [edx+64]
	jae	SHORT $L70843
	push	0
	mov	ecx, DWORD PTR _i$[ebp]
	push	ecx
	mov	edx, DWORD PTR _ctrl$[ebp]
	add	edx, 64					; 00000040H
	push	edx
	call	_dyntab_cell
	add	esp, 12					; 0000000cH
	mov	BYTE PTR [eax+12], 1
	jmp	SHORT $L70842
$L70843:

; 555  : 		sql_exec_query(cntxt, "DROP TABLE IF EXISTS IdList,IdListMatch,ValList");

	push	OFFSET FLAT:$SG70844
	mov	eax, DWORD PTR _cntxt$[ebp]
	push	eax
	call	_sql_exec_query
	add	esp, 8

; 556  : 		break;

	jmp	$eva_noerr$70920
$L70845:

; 557  : 
; 558  : 	case HtmlEdit:
; 559  : 		/* Output hidden empty value if control modified, empty & not output */
; 560  : 		if(!ctrl->allval.nbrows && !ctrl->val.nbrows && ctrl->b_modified &&
; 561  : 			ctrl_put_hidden(cntxt, ctrl, 0)) STACK_ERROR;

	mov	ecx, DWORD PTR _ctrl$[ebp]
	cmp	DWORD PTR [ecx+124], 0
	jne	SHORT $L70846
	mov	edx, DWORD PTR _ctrl$[ebp]
	cmp	DWORD PTR [edx+64], 0
	jne	SHORT $L70846
	mov	eax, DWORD PTR _ctrl$[ebp]
	cmp	DWORD PTR [eax+200], 0
	je	SHORT $L70846
	push	0
	mov	ecx, DWORD PTR _ctrl$[ebp]
	push	ecx
	mov	edx, DWORD PTR _cntxt$[ebp]
	push	edx
	call	_ctrl_put_hidden
	add	esp, 12					; 0000000cH
	test	eax, eax
	je	SHORT $L70846
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 561		; 00000231H
	jmp	$eva_err$70831
$L70846:

; 562  : 		if(!form->html) break;

	mov	ecx, DWORD PTR _form$[ebp]
	cmp	DWORD PTR [ecx+232], 0
	jne	SHORT $L70847
	jmp	$eva_noerr$70920
$L70847:

; 563  : 		if(cntxt->debug & DEBUG_HTML) DYNBUF_ADD3(form->html, "\n<!--- Start Relation ", ctrl->LABEL, 0, NO_CONV, " -->\n");

	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	eax, DWORD PTR [edx+29860]
	and	eax, 128				; 00000080H
	test	eax, eax
	je	SHORT $L70850
	push	5
	push	OFFSET FLAT:$SG70851
	push	0
	push	0
	push	0
	mov	ecx, DWORD PTR _ctrl$[ebp]
	mov	edx, DWORD PTR [ecx+284]
	push	edx
	push	22					; 00000016H
	push	OFFSET FLAT:$SG70852
	mov	eax, DWORD PTR _form$[ebp]
	mov	ecx, DWORD PTR [eax+232]
	push	ecx
	call	_dynbuf_add3
	add	esp, 36					; 00000024H
	test	eax, eax
	je	SHORT $L70850
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29872], OFFSET FLAT:$SG70854
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 563		; 00000233H
	jmp	$eva_err$70831
$L70850:

; 564  : 
; 565  : 		/* Output control position & format */
; 566  : 		if(ctrl_format_pos(cntxt, ctrl, 1)) STACK_ERROR;

	push	1
	mov	ecx, DWORD PTR _ctrl$[ebp]
	push	ecx
	mov	edx, DWORD PTR _cntxt$[ebp]
	push	edx
	call	_ctrl_format_pos
	add	esp, 12					; 0000000cH
	test	eax, eax
	je	SHORT $L70855
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 566		; 00000236H
	jmp	$eva_err$70831
$L70855:

; 567  : 
; 568  : 		/* Handle display mode */
; 569  : 		tbl->attr = &ctrl->attr;

	mov	ecx, DWORD PTR _ctrl$[ebp]
	add	ecx, 44					; 0000002cH
	mov	edx, DWORD PTR _tbl$[ebp]
	mov	DWORD PTR [edx], ecx

; 570  : 		if(!strcmp("_EVA_TABLE", inputmode))

	mov	eax, DWORD PTR _inputmode$[ebp]
	push	eax
	push	OFFSET FLAT:$SG70857
	call	_strcmp
	add	esp, 8
	test	eax, eax
	jne	$L70856

; 572  : 			/* Handle search mode when min search len specified within table */
; 573  : 			if(tbl->minsearchlen && form->Line && (!ctrl->MULTIPLE || !*ctrl->MULTIPLE || !strcmp("No", ctrl->MULTIPLE)))

	mov	ecx, DWORD PTR _tbl$[ebp]
	cmp	DWORD PTR [ecx+76], 0
	je	$L70871
	mov	edx, DWORD PTR _form$[ebp]
	cmp	DWORD PTR [edx+240], 0
	je	$L70871
	mov	eax, DWORD PTR _ctrl$[ebp]
	cmp	DWORD PTR [eax+344], 0
	je	SHORT $L70859
	mov	ecx, DWORD PTR _ctrl$[ebp]
	mov	edx, DWORD PTR [ecx+344]
	movsx	eax, BYTE PTR [edx]
	test	eax, eax
	je	SHORT $L70859
	mov	ecx, DWORD PTR _ctrl$[ebp]
	mov	edx, DWORD PTR [ecx+344]
	push	edx
	push	OFFSET FLAT:$SG70860
	call	_strcmp
	add	esp, 8
	test	eax, eax
	jne	$L70871
$L70859:

; 575  : 				if(form->i_ctrl_clic != i_ctrl && form->Line == tbl->ctrlline && tbl->status & TblCtrl_opensel && ctrl->val.nbrows)

	mov	eax, DWORD PTR _form$[ebp]
	mov	ecx, DWORD PTR [eax+124]
	cmp	ecx, DWORD PTR _i_ctrl$[ebp]
	je	$L70861
	mov	edx, DWORD PTR _form$[ebp]
	mov	eax, DWORD PTR _tbl$[ebp]
	mov	ecx, DWORD PTR [edx+240]
	cmp	ecx, DWORD PTR [eax+56]
	jne	$L70861
	mov	edx, DWORD PTR _tbl$[ebp]
	mov	eax, DWORD PTR [edx+32]
	and	eax, 512				; 00000200H
	test	eax, eax
	je	$L70861
	mov	ecx, DWORD PTR _ctrl$[ebp]
	cmp	DWORD PTR [ecx+64], 0
	je	SHORT $L70861

; 577  : 					tbl->status &= ~(TblCtrl_opensel | TblCtrl_opensearch);

	mov	edx, DWORD PTR _tbl$[ebp]
	mov	eax, DWORD PTR [edx+32]
	and	eax, -545				; fffffddfH
	mov	ecx, DWORD PTR _tbl$[ebp]
	mov	DWORD PTR [ecx+32], eax

; 578  : 					tbl->ctrlline = 0;

	mov	edx, DWORD PTR _tbl$[ebp]
	mov	DWORD PTR [edx+56], 0

; 579  : 					tbl->input = "";

	mov	eax, DWORD PTR _tbl$[ebp]
	mov	DWORD PTR [eax+100], OFFSET FLAT:$SG70862

; 580  : 					cgi_value_setkeep(cntxt, &tbl->cgiinput, 0, 2);

	push	2
	push	0
	mov	ecx, DWORD PTR _tbl$[ebp]
	add	ecx, 80					; 00000050H
	push	ecx
	mov	edx, DWORD PTR _cntxt$[ebp]
	push	edx
	call	_cgi_value_setkeep
	add	esp, 16					; 00000010H

; 581  : 					DYNTAB_SET(&tbl->cgiinput, 0, 0, "");

	push	0
	push	OFFSET FLAT:$SG70864
	push	0
	push	0
	mov	eax, DWORD PTR _tbl$[ebp]
	add	eax, 80					; 00000050H
	push	eax
	call	_dyntab_set_txt
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L70863
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29872], OFFSET FLAT:$SG70866
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 581		; 00000245H
	jmp	$eva_err$70831
$L70863:

; 583  : 				else if(!ctrl->val.nbrows && (!tbl->ctrlline || form->Line == tbl->ctrlline))

	jmp	SHORT $L70871
$L70861:
	mov	eax, DWORD PTR _ctrl$[ebp]
	cmp	DWORD PTR [eax+64], 0
	jne	SHORT $L70868
	mov	ecx, DWORD PTR _tbl$[ebp]
	cmp	DWORD PTR [ecx+56], 0
	je	SHORT $L70869
	mov	edx, DWORD PTR _form$[ebp]
	mov	eax, DWORD PTR _tbl$[ebp]
	mov	ecx, DWORD PTR [edx+240]
	cmp	ecx, DWORD PTR [eax+56]
	jne	SHORT $L70868
$L70869:

; 585  : 					tbl->status |= TblCtrl_opensel | TblCtrl_opensearch;

	mov	edx, DWORD PTR _tbl$[ebp]
	mov	eax, DWORD PTR [edx+32]
	or	eax, 544				; 00000220H
	mov	ecx, DWORD PTR _tbl$[ebp]
	mov	DWORD PTR [ecx+32], eax

; 586  : 					tbl->ctrlline = form->Line;

	mov	edx, DWORD PTR _tbl$[ebp]
	mov	eax, DWORD PTR _form$[ebp]
	mov	ecx, DWORD PTR [eax+240]
	mov	DWORD PTR [edx+56], ecx

; 588  : 				else if(form->Line == tbl->ctrlline && !(tbl->status & TblCtrl_opensel))

	jmp	SHORT $L70871
$L70868:
	mov	edx, DWORD PTR _form$[ebp]
	mov	eax, DWORD PTR _tbl$[ebp]
	mov	ecx, DWORD PTR [edx+240]
	cmp	ecx, DWORD PTR [eax+56]
	jne	SHORT $L70871
	mov	edx, DWORD PTR _tbl$[ebp]
	mov	eax, DWORD PTR [edx+32]
	and	eax, 512				; 00000200H
	test	eax, eax
	jne	SHORT $L70871

; 590  : 					tbl->ctrlline = 0;

	mov	ecx, DWORD PTR _tbl$[ebp]
	mov	DWORD PTR [ecx+56], 0
$L70871:

; 593  : 
; 594  : 			if(ctrl_relation_put_table(cntxt, i_ctrl, table_put_html_obj_list)) STACK_ERROR;

	push	OFFSET FLAT:_table_put_html_obj_list
	mov	edx, DWORD PTR _i_ctrl$[ebp]
	push	edx
	mov	eax, DWORD PTR _cntxt$[ebp]
	push	eax
	call	_ctrl_relation_put_table
	add	esp, 12					; 0000000cH
	test	eax, eax
	je	SHORT $L70872
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 594		; 00000252H
	jmp	$eva_err$70831
$L70872:

; 596  : 		else if(!strncmp(inputmode, add_sz_str("_EVA_LIST")))

	jmp	$L70882
$L70856:
	push	9
	push	OFFSET FLAT:$SG70875
	mov	edx, DWORD PTR _inputmode$[ebp]
	push	edx
	call	_strncmp
	add	esp, 12					; 0000000cH
	test	eax, eax
	jne	$L70874

; 598  : 			/* Build options list - add warning if stripped */
; 599  : 			if(ctrl_relation_searchlist(cntxt, i_ctrl)) CLEAR_ERROR;

	mov	eax, DWORD PTR _i_ctrl$[ebp]
	push	eax
	mov	ecx, DWORD PTR _cntxt$[ebp]
	push	ecx
	call	_ctrl_relation_searchlist
	add	esp, 8
	test	eax, eax
	je	SHORT $L70876
	push	599					; 00000257H
	push	OFFSET FLAT:$SG70877
	push	OFFSET FLAT:$SG70878
	mov	edx, DWORD PTR _cntxt$[ebp]
	push	edx
	call	_err_clear
	add	esp, 16					; 00000010H
$L70876:

; 600  : 			if(ctrl_relation_optionslist(cntxt, i_ctrl, &optlist)) STACK_ERROR;

	lea	eax, DWORD PTR _optlist$[ebp]
	push	eax
	mov	ecx, DWORD PTR _i_ctrl$[ebp]
	push	ecx
	mov	edx, DWORD PTR _cntxt$[ebp]
	push	edx
	call	_ctrl_relation_optionslist
	add	esp, 12					; 0000000cH
	test	eax, eax
	je	SHORT $L70879
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 600		; 00000258H
	jmp	$eva_err$70831
$L70879:

; 601  : 
; 602  : 			/* Output HTML input list */
; 603  : 			if(ctrl_put_html_input_list(cntxt, i_ctrl, &optlist, 0)) STACK_ERROR;

	push	0
	lea	ecx, DWORD PTR _optlist$[ebp]
	push	ecx
	mov	edx, DWORD PTR _i_ctrl$[ebp]
	push	edx
	mov	eax, DWORD PTR _cntxt$[ebp]
	push	eax
	call	_ctrl_put_html_input_list
	add	esp, 16					; 00000010H
	test	eax, eax
	je	SHORT $L70880
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 603		; 0000025bH
	jmp	$eva_err$70831
$L70880:

; 605  : 		else

	jmp	SHORT $L70882
$L70874:

; 607  : 			if(ctrl_relation_put_table(cntxt, i_ctrl, ctrl_add_relation_auto)) STACK_ERROR;

	push	OFFSET FLAT:_ctrl_add_relation_auto
	mov	edx, DWORD PTR _i_ctrl$[ebp]
	push	edx
	mov	eax, DWORD PTR _cntxt$[ebp]
	push	eax
	call	_ctrl_relation_put_table
	add	esp, 12					; 0000000cH
	test	eax, eax
	je	SHORT $L70882
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 607		; 0000025fH
	jmp	$eva_err$70831
$L70882:

; 609  : 
; 610  : 		/* Terminate control position & format */
; 611  : 		if(ctrl_format_pos(cntxt, ctrl, 0)) STACK_ERROR;

	push	0
	mov	edx, DWORD PTR _ctrl$[ebp]
	push	edx
	mov	eax, DWORD PTR _cntxt$[ebp]
	push	eax
	call	_ctrl_format_pos
	add	esp, 12					; 0000000cH
	test	eax, eax
	je	SHORT $L70883
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 611		; 00000263H
	jmp	$eva_err$70831
$L70883:

; 612  : 
; 613  : 		/* End control */
; 614  : 		sql_drop_table(cntxt, "IdList,IdListMatch,ValList");

	push	OFFSET FLAT:$SG70884
	mov	edx, DWORD PTR _cntxt$[ebp]
	push	edx
	call	_sql_drop_table
	add	esp, 8

; 615  : 		if(cntxt->debug & DEBUG_HTML) DYNBUF_ADD3(form->html, "\n<!--- End   Relation ", ctrl->LABEL, 0, NO_CONV, " -->\n");

	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	ecx, DWORD PTR [eax+29860]
	and	ecx, 128				; 00000080H
	test	ecx, ecx
	je	SHORT $L70887
	push	5
	push	OFFSET FLAT:$SG70888
	push	0
	push	0
	push	0
	mov	edx, DWORD PTR _ctrl$[ebp]
	mov	eax, DWORD PTR [edx+284]
	push	eax
	push	22					; 00000016H
	push	OFFSET FLAT:$SG70889
	mov	ecx, DWORD PTR _form$[ebp]
	mov	edx, DWORD PTR [ecx+232]
	push	edx
	call	_dynbuf_add3
	add	esp, 36					; 00000024H
	test	eax, eax
	je	SHORT $L70887
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29872], OFFSET FLAT:$SG70891
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 615		; 00000267H
	jmp	$eva_err$70831
$L70887:

; 616  : 		break;

	jmp	$eva_noerr$70920
$L70892:

; 617  : 
; 618  : 	case HtmlPrint:
; 619  : 	case HtmlView:
; 620  : 		if(!form->html) break;

	mov	edx, DWORD PTR _form$[ebp]
	cmp	DWORD PTR [edx+232], 0
	jne	SHORT $L70893
	jmp	$eva_noerr$70920
$L70893:

; 621  : 		tbl->attr = &ctrl->attr;

	mov	eax, DWORD PTR _ctrl$[ebp]
	add	eax, 44					; 0000002cH
	mov	ecx, DWORD PTR _tbl$[ebp]
	mov	DWORD PTR [ecx], eax

; 622  : 		if(cntxt->debug & DEBUG_HTML) DYNBUF_ADD3(form->html, "\n<!--- Start Relation ", ctrl->LABEL, 0, NO_CONV, " -->\n");

	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	eax, DWORD PTR [edx+29860]
	and	eax, 128				; 00000080H
	test	eax, eax
	je	SHORT $L70896
	push	5
	push	OFFSET FLAT:$SG70897
	push	0
	push	0
	push	0
	mov	ecx, DWORD PTR _ctrl$[ebp]
	mov	edx, DWORD PTR [ecx+284]
	push	edx
	push	22					; 00000016H
	push	OFFSET FLAT:$SG70898
	mov	eax, DWORD PTR _form$[ebp]
	mov	ecx, DWORD PTR [eax+232]
	push	ecx
	call	_dynbuf_add3
	add	esp, 36					; 00000024H
	test	eax, eax
	je	SHORT $L70896
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29872], OFFSET FLAT:$SG70900
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 622		; 0000026eH
	jmp	$eva_err$70831
$L70896:

; 623  : 
; 624  : 		/* Output control position & format */
; 625  : 		if(ctrl_format_pos(cntxt, ctrl, 1)) STACK_ERROR;

	push	1
	mov	ecx, DWORD PTR _ctrl$[ebp]
	push	ecx
	mov	edx, DWORD PTR _cntxt$[ebp]
	push	edx
	call	_ctrl_format_pos
	add	esp, 12					; 0000000cH
	test	eax, eax
	je	SHORT $L70901
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 625		; 00000271H
	jmp	$eva_err$70831
$L70901:

; 626  : 
; 627  : 		/* Handle display mode */
; 628  : 		if(!strcmp("_EVA_TABLE", inputmode) ||
; 629  : 			(szinputmode > 6 && !strncmp(inputmode + szinputmode - 4, "_FMT", 4)))

	mov	ecx, DWORD PTR _inputmode$[ebp]
	push	ecx
	push	OFFSET FLAT:$SG70904
	call	_strcmp
	add	esp, 8
	test	eax, eax
	je	SHORT $L70903
	cmp	DWORD PTR _szinputmode$[ebp], 6
	jbe	SHORT $L70902
	push	4
	push	OFFSET FLAT:$SG70905
	mov	edx, DWORD PTR _szinputmode$[ebp]
	mov	eax, DWORD PTR _inputmode$[ebp]
	lea	ecx, DWORD PTR [eax+edx-4]
	push	ecx
	call	_strncmp
	add	esp, 12					; 0000000cH
	test	eax, eax
	jne	SHORT $L70902
$L70903:

; 631  : 			if(table_put_html_obj_list(cntxt, i_ctrl)) STACK_ERROR;

	mov	edx, DWORD PTR _i_ctrl$[ebp]
	push	edx
	mov	eax, DWORD PTR _cntxt$[ebp]
	push	eax
	call	_table_put_html_obj_list
	add	esp, 8
	test	eax, eax
	je	SHORT $L70906
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 631		; 00000277H
	jmp	$eva_err$70831
$L70906:

; 633  : 		else

	jmp	SHORT $L70908
$L70902:

; 635  : 			/* Display values list */
; 636  : 			if(ctrl_relation_put_values(cntxt, i_ctrl)) STACK_ERROR;

	mov	edx, DWORD PTR _i_ctrl$[ebp]
	push	edx
	mov	eax, DWORD PTR _cntxt$[ebp]
	push	eax
	call	_ctrl_relation_put_values
	add	esp, 8
	test	eax, eax
	je	SHORT $L70908
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 636		; 0000027cH
	jmp	$eva_err$70831
$L70908:

; 638  : 
; 639  : 		/* Terminate control position & format */
; 640  : 		if(ctrl_format_pos(cntxt, ctrl, 0)) STACK_ERROR;

	push	0
	mov	edx, DWORD PTR _ctrl$[ebp]
	push	edx
	mov	eax, DWORD PTR _cntxt$[ebp]
	push	eax
	call	_ctrl_format_pos
	add	esp, 12					; 0000000cH
	test	eax, eax
	je	SHORT $L70909
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 640		; 00000280H
	jmp	$eva_err$70831
$L70909:

; 641  : 
; 642  : 		/* Output status */
; 643  : 		if(table_put_status(cntxt, i_ctrl)) STACK_ERROR;

	mov	edx, DWORD PTR _i_ctrl$[ebp]
	push	edx
	mov	eax, DWORD PTR _cntxt$[ebp]
	push	eax
	call	_table_put_status
	add	esp, 8
	test	eax, eax
	je	SHORT $L70910
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 643		; 00000283H
	jmp	$eva_err$70831
$L70910:

; 644  : 		sql_drop_table(cntxt, "IdList,IdListMatch,ValList");

	push	OFFSET FLAT:$SG70911
	mov	edx, DWORD PTR _cntxt$[ebp]
	push	edx
	call	_sql_drop_table
	add	esp, 8

; 645  : 		if(cntxt->debug & DEBUG_HTML) DYNBUF_ADD3(form->html, "\n<!--- End   Relation ", ctrl->LABEL, 0, NO_CONV, " -->\n");

	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	ecx, DWORD PTR [eax+29860]
	and	ecx, 128				; 00000080H
	test	ecx, ecx
	je	SHORT $L70914
	push	5
	push	OFFSET FLAT:$SG70915
	push	0
	push	0
	push	0
	mov	edx, DWORD PTR _ctrl$[ebp]
	mov	eax, DWORD PTR [edx+284]
	push	eax
	push	22					; 00000016H
	push	OFFSET FLAT:$SG70916
	mov	ecx, DWORD PTR _form$[ebp]
	mov	edx, DWORD PTR [ecx+232]
	push	edx
	call	_dynbuf_add3
	add	esp, 36					; 00000024H
	test	eax, eax
	je	SHORT $L70914
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29872], OFFSET FLAT:$SG70918
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 645		; 00000285H
	jmp	SHORT $eva_err$70831
$L70914:
$L70919:
$eva_noerr$70920:

; 650  : 
; 651  : 	RETURN_OK_CLEANUP;

	push	0
	push	OFFSET FLAT:$SG70921
	push	OFFSET FLAT:$SG70922
	mov	edx, DWORD PTR _cntxt$[ebp]
	push	edx
	call	_err_clear
	add	esp, 16					; 00000010H
$eva_err$70831:
	mov	eax, DWORD PTR _cntxt$[ebp]
	cmp	DWORD PTR [eax+29872], 0
	je	SHORT $L70923
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	edx, DWORD PTR [ecx+29900]
	push	edx
	push	OFFSET FLAT:$SG70924
	push	OFFSET FLAT:$SG70925
	mov	eax, DWORD PTR _cntxt$[ebp]
	push	eax
	call	_err_add_context
	add	esp, 16					; 00000010H
$L70923:
	lea	ecx, DWORD PTR _optlist$[ebp]
	push	ecx
	call	_dyntab_free
	add	esp, 4
	mov	edx, DWORD PTR _cntxt$[ebp]
	xor	eax, eax
	cmp	DWORD PTR [edx+29872], 0
	setne	al

; 652  : }

	mov	esp, ebp
	pop	ebp
	ret	0
$L70972:
	DD	$L70827
	DD	$L70919
	DD	$L70919
	DD	$L70919
	DD	$L70845
	DD	$L70919
	DD	$L70892
	DD	$L70892
_ctrl_add_relation ENDP
_TEXT	ENDS
END
