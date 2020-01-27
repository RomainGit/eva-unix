	TITLE	D:\Travail\ABI\EVA\V4.0\CGI\Brunix-2016\ctrl_input_chkbox.c
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
PUBLIC	_ctrl_add_chkbox
EXTRN	_put_html_button_sz:NEAR
EXTRN	_mem_free:NEAR
EXTRN	_put_html_img:NEAR
EXTRN	_dynbuf_add:NEAR
EXTRN	_ctrl_cgi_name:NEAR
EXTRN	_ctrl_put_hidden:NEAR
EXTRN	_dynbuf_add3:NEAR
EXTRN	_dyntab_free:NEAR
EXTRN	_ctrl_add_child:NEAR
EXTRN	_dyntab_val:NEAR
EXTRN	_dyntab_cell:NEAR
EXTRN	_ctrl_format_pos:NEAR
EXTRN	_strcmp:NEAR
EXTRN	_dyntab_set_txt:NEAR
EXTRN	_err_add_context:NEAR
EXTRN	_err_clear:NEAR
EXTRN	_dyntab_filter_field:NEAR
EXTRN	_dyntab_field_val:NEAR
EXTRN	_dyntab_field_cell:NEAR
_BSS	SEGMENT
$SG70244 DB	01H DUP (?)
	ALIGN	4

$SG70259 DB	01H DUP (?)
	ALIGN	4

$SG70270 DB	01H DUP (?)
	ALIGN	4

$SG70283 DB	01H DUP (?)
	ALIGN	4

$SG70318 DB	01H DUP (?)
_BSS	ENDS
_DATA	SEGMENT
$SG70222 DB	'_EVA_CHECKBOX_3STATE', 00H
	ORG $+3
$SG70246 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70254 DB	'1', 00H
	ORG $+2
$SG70256 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70261 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70265 DB	'0', 00H
	ORG $+2
$SG70267 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70272 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70278 DB	'_EVA_NONE', 00H
	ORG $+2
$SG70282 DB	0aH, 0aH, 00H
	ORG $+1
$SG70285 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70291 DB	'_eva_checkbox_nul.gif', 00H
	ORG $+2
$SG70292 DB	'_eva_checkbox_nul_s.gif', 00H
$SG70295 DB	'Etat : non renseign', 0e9H, 00H
	ORG $+3
$SG70297 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70299 DB	'_eva_checkbox_no.gif', 00H
	ORG $+3
$SG70300 DB	'_eva_checkbox_no_s.gif', 00H
	ORG $+1
$SG70303 DB	'Etat : non coch', 0e9H, 00H
	ORG $+3
$SG70305 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70307 DB	'_eva_checkbox_yes.gif', 00H
	ORG $+2
$SG70308 DB	'_eva_checkbox_yes_s.gif', 00H
$SG70311 DB	'Etat : coch', 0e9H, 00H
	ORG $+3
$SG70313 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70317 DB	'_EVA_ONCHANGE', 00H
	ORG $+2
$SG70328 DB	'_EVA_CTRLTREE', 00H
	ORG $+2
$SG70329 DB	'_EVA_CTRLTREE_ALT', 00H
	ORG $+2
$SG70330 DB	'_EVA_NONE', 00H
	ORG $+2
$SG70343 DB	'_EVA_CTRLTREE', 00H
	ORG $+2
$SG70345 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70351 DB	'_EVA_CTRLTREE_ALT', 00H
	ORG $+2
$SG70353 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70356 DB	'D:\Travail\ABI\EVA\V4.0\CGI\Brunix-2016\ctrl_input_chkbo'
	DB	'x.c', 00H
$SG70357 DB	'ctrl_add_chkbox', 00H
$SG70359 DB	'D:\Travail\ABI\EVA\V4.0\CGI\Brunix-2016\ctrl_input_chkbo'
	DB	'x.c', 00H
$SG70360 DB	'ctrl_add_chkbox', 00H
_DATA	ENDS
_TEXT	SEGMENT
_cntxt$ = 8
_i_ctrl$ = 12
_form$ = -32
_ctrl$ = -56
_ctrltree$ = -28
_name$ = -52
_notes$ = -48
_img$ = -40
_imgsel$ = -8
_i$ = -44
_b_3state$ = -4
_tree$ = -36
_cgi$70236 = -64
_val$70237 = -60
_onchange$70316 = -68
_ctrl_add_chkbox PROC NEAR

; 28   : ){

	push	ebp
	mov	ebp, esp
	sub	esp, 112				; 00000070H

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

; 31   : 	DynTable ctrltree = { 0 };

	mov	DWORD PTR _ctrltree$[ebp], 0
	xor	edx, edx
	mov	DWORD PTR _ctrltree$[ebp+4], edx
	mov	DWORD PTR _ctrltree$[ebp+8], edx
	mov	DWORD PTR _ctrltree$[ebp+12], edx
	mov	DWORD PTR _ctrltree$[ebp+16], edx

; 32   : 	DynBuffer *name = NULL;

	mov	DWORD PTR _name$[ebp], 0

; 33   : 	DynBuffer *notes = NULL;

	mov	DWORD PTR _notes$[ebp], 0

; 34   : 	char *img, *imgsel;
; 35   : 	unsigned long i;
; 36   : 	int b_3state = CTRL_ATTR_CELL(CHECKBOX_3STATE) != NULL;

	cmp	DWORD PTR _ctrl$[ebp], 0
	je	SHORT $L70365
	push	0
	push	-1
	push	OFFSET FLAT:$SG70222
	mov	eax, DWORD PTR _ctrl$[ebp]
	add	eax, 44					; 0000002cH
	push	eax
	call	_dyntab_field_cell
	add	esp, 16					; 00000010H
	mov	DWORD PTR -72+[ebp], eax
	jmp	SHORT $L70366
$L70365:
	mov	DWORD PTR -72+[ebp], 0
$L70366:
	xor	ecx, ecx
	cmp	DWORD PTR -72+[ebp], 0
	setne	cl
	mov	DWORD PTR _b_3state$[ebp], ecx

; 37   : 	int tree = 1;

	mov	DWORD PTR _tree$[ebp], 1

; 38   : 	switch(*dyntab_val(&ctrl->val, 0, 0))
; 39   : 	{

	push	0
	push	0
	mov	edx, DWORD PTR _ctrl$[ebp]
	add	edx, 64					; 00000040H
	push	edx
	call	_dyntab_val
	add	esp, 12					; 0000000cH
	mov	al, BYTE PTR [eax]
	mov	BYTE PTR -76+[ebp], al
	cmp	BYTE PTR -76+[ebp], 0
	je	SHORT $L70228
	cmp	BYTE PTR -76+[ebp], 48			; 00000030H
	je	SHORT $L70229
	jmp	SHORT $L70225
$L70228:

; 40   : 	case 0: tree = b_3state ? 0 : 2; break;

	mov	ecx, DWORD PTR _b_3state$[ebp]
	neg	ecx
	sbb	ecx, ecx
	and	ecx, -2					; fffffffeH
	add	ecx, 2
	mov	DWORD PTR _tree$[ebp], ecx
	jmp	SHORT $L70225
$L70229:

; 41   : 	case '0': tree = 2;

	mov	DWORD PTR _tree$[ebp], 2
$L70225:

; 43   : 
; 44   : 	switch(form->step)
; 45   : 	{

	mov	edx, DWORD PTR _form$[ebp]
	mov	eax, DWORD PTR [edx+176]
	mov	DWORD PTR -80+[ebp], eax
	cmp	DWORD PTR -80+[ebp], 7
	ja	$L70338
	mov	ecx, DWORD PTR -80+[ebp]
	jmp	DWORD PTR $L70380[ecx*4]
$L70234:

; 46   : 	case CtrlRead:
; 47   : 		/* If checkbox clicked */
; 48   : 		if(form->i_ctrl_clic == i_ctrl && cntxt->cgi && cntxt->cgi[cntxt->cgibtn].name[0] == 'B')

	mov	edx, DWORD PTR _form$[ebp]
	mov	eax, DWORD PTR [edx+124]
	cmp	eax, DWORD PTR _i_ctrl$[ebp]
	jne	$L70235
	mov	ecx, DWORD PTR _cntxt$[ebp]
	cmp	DWORD PTR [ecx+29648], 0
	je	$L70235
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	eax, DWORD PTR [edx+29656]
	imul	eax, 56					; 00000038H
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	edx, DWORD PTR [ecx+29648]
	mov	eax, DWORD PTR [edx+eax]
	movsx	ecx, BYTE PTR [eax]
	cmp	ecx, 66					; 00000042H
	jne	$L70235

; 50   : 			/* Search / create corresponding value */
; 51   : 			CGIData *cgi = cntxt->cgi + cntxt->cgibtn;

	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	eax, DWORD PTR [edx+29656]
	imul	eax, 56					; 00000038H
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	edx, DWORD PTR [ecx+29648]
	add	edx, eax
	mov	DWORD PTR _cgi$70236[ebp], edx

; 52   : 			DynTableCell *val;
; 53   : 			for(i = 0; i < ctrl->val.nbrows; i++)

	mov	DWORD PTR _i$[ebp], 0
	jmp	SHORT $L70238
$L70239:
	mov	eax, DWORD PTR _i$[ebp]
	add	eax, 1
	mov	DWORD PTR _i$[ebp], eax
$L70238:
	mov	ecx, DWORD PTR _ctrl$[ebp]
	mov	edx, DWORD PTR _i$[ebp]
	cmp	edx, DWORD PTR [ecx+64]
	jae	SHORT $L70240

; 55   : 				val = dyntab_cell(&ctrl->val, i, 0);

	push	0
	mov	eax, DWORD PTR _i$[ebp]
	push	eax
	mov	ecx, DWORD PTR _ctrl$[ebp]
	add	ecx, 64					; 00000040H
	push	ecx
	call	_dyntab_cell
	add	esp, 12					; 0000000cH
	mov	DWORD PTR _val$70237[ebp], eax

; 56   : 				if(val->Line == cgi->Line && val->Num == cgi->Num) break;

	mov	edx, DWORD PTR _val$70237[ebp]
	mov	eax, DWORD PTR _cgi$70236[ebp]
	mov	ecx, DWORD PTR [edx+40]
	cmp	ecx, DWORD PTR [eax+40]
	jne	SHORT $L70241
	mov	edx, DWORD PTR _val$70237[ebp]
	mov	eax, DWORD PTR _cgi$70236[ebp]
	mov	ecx, DWORD PTR [edx+36]
	cmp	ecx, DWORD PTR [eax+36]
	jne	SHORT $L70241
	jmp	SHORT $L70240
$L70241:

; 57   : 			}

	jmp	SHORT $L70239
$L70240:

; 58   : 			if(i == ctrl->val.nbrows)

	mov	edx, DWORD PTR _ctrl$[ebp]
	mov	eax, DWORD PTR _i$[ebp]
	cmp	eax, DWORD PTR [edx+64]
	jne	SHORT $L70242

; 60   : 				DYNTAB_SET(&ctrl->val, i, 0, "");

	push	0
	push	OFFSET FLAT:$SG70244
	push	0
	mov	ecx, DWORD PTR _i$[ebp]
	push	ecx
	mov	edx, DWORD PTR _ctrl$[ebp]
	add	edx, 64					; 00000040H
	push	edx
	call	_dyntab_set_txt
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L70243
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29872], OFFSET FLAT:$SG70246
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 60		; 0000003cH
	jmp	$eva_err$70247
$L70243:

; 61   : 				val = dyntab_cell(&ctrl->val, i, 0);

	push	0
	mov	edx, DWORD PTR _i$[ebp]
	push	edx
	mov	eax, DWORD PTR _ctrl$[ebp]
	add	eax, 64					; 00000040H
	push	eax
	call	_dyntab_cell
	add	esp, 12					; 0000000cH
	mov	DWORD PTR _val$70237[ebp], eax

; 62   : 				val->Line = cgi->Line;

	mov	ecx, DWORD PTR _val$70237[ebp]
	mov	edx, DWORD PTR _cgi$70236[ebp]
	mov	eax, DWORD PTR [edx+40]
	mov	DWORD PTR [ecx+40], eax

; 63   : 				val->Num = cgi->Num;

	mov	ecx, DWORD PTR _val$70237[ebp]
	mov	edx, DWORD PTR _cgi$70236[ebp]
	mov	eax, DWORD PTR [edx+36]
	mov	DWORD PTR [ecx+36], eax
$L70242:

; 65   : 
; 66   : 			/* Handle value on checkbox click */
; 67   : 			switch(*dyntab_val(&ctrl->val, i, 0))
; 68   : 			{

	push	0
	mov	ecx, DWORD PTR _i$[ebp]
	push	ecx
	mov	edx, DWORD PTR _ctrl$[ebp]
	add	edx, 64					; 00000040H
	push	edx
	call	_dyntab_val
	add	esp, 12					; 0000000cH
	mov	al, BYTE PTR [eax]
	mov	BYTE PTR -84+[ebp], al
	cmp	BYTE PTR -84+[ebp], 0
	je	SHORT $L70252
	cmp	BYTE PTR -84+[ebp], 48			; 00000030H
	je	SHORT $L70257
	jmp	$L70262
$L70252:

; 69   : 			case 0:	/* Null Value : Switch to checked */
; 70   : 				DYNTAB_SET(&ctrl->val, i, 0, "1");

	push	1
	push	OFFSET FLAT:$SG70254
	push	0
	mov	ecx, DWORD PTR _i$[ebp]
	push	ecx
	mov	edx, DWORD PTR _ctrl$[ebp]
	add	edx, 64					; 00000040H
	push	edx
	call	_dyntab_set_txt
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L70253
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29872], OFFSET FLAT:$SG70256
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 70		; 00000046H
	jmp	$eva_err$70247
$L70253:

; 71   : 				break;

	jmp	$L70249
$L70257:

; 72   : 			case '0':	/* Unchecked value : Switch to null */
; 73   : 				DYNTAB_SET(&ctrl->val, i, 0, "");

	push	0
	push	OFFSET FLAT:$SG70259
	push	0
	mov	edx, DWORD PTR _i$[ebp]
	push	edx
	mov	eax, DWORD PTR _ctrl$[ebp]
	add	eax, 64					; 00000040H
	push	eax
	call	_dyntab_set_txt
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L70258
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29872], OFFSET FLAT:$SG70261
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 73		; 00000049H
	jmp	$eva_err$70247
$L70258:

; 74   : 				break;

	jmp	$L70249
$L70262:

; 75   : 			default:	/* Checked value : Switch to unchecked */
; 76   : 				if(b_3state) DYNTAB_SET(&ctrl->val, i, 0, "0")

	cmp	DWORD PTR _b_3state$[ebp], 0
	je	SHORT $L70263
	push	1
	push	OFFSET FLAT:$SG70265
	push	0
	mov	eax, DWORD PTR _i$[ebp]
	push	eax
	mov	ecx, DWORD PTR _ctrl$[ebp]
	add	ecx, 64					; 00000040H
	push	ecx
	call	_dyntab_set_txt
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L70264
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29872], OFFSET FLAT:$SG70267
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 76		; 0000004cH
	jmp	$eva_err$70247
$L70264:

; 77   : 				else DYNTAB_SET(&ctrl->val, i, 0, "");

	jmp	SHORT $L70269
$L70263:
	push	0
	push	OFFSET FLAT:$SG70270
	push	0
	mov	ecx, DWORD PTR _i$[ebp]
	push	ecx
	mov	edx, DWORD PTR _ctrl$[ebp]
	add	edx, 64					; 00000040H
	push	edx
	call	_dyntab_set_txt
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L70269
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29872], OFFSET FLAT:$SG70272
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 77		; 0000004dH
	jmp	$eva_err$70247
$L70269:
$L70249:

; 79   : 			val = dyntab_cell(&ctrl->val, i, 0);

	push	0
	mov	edx, DWORD PTR _i$[ebp]
	push	edx
	mov	eax, DWORD PTR _ctrl$[ebp]
	add	eax, 64					; 00000040H
	push	eax
	call	_dyntab_cell
	add	esp, 12					; 0000000cH
	mov	DWORD PTR _val$70237[ebp], eax

; 80   : 			val->b_modified = 1;

	mov	ecx, DWORD PTR _val$70237[ebp]
	mov	BYTE PTR [ecx+13], 1

; 81   : 			ctrl->b_modified = 1;

	mov	edx, DWORD PTR _ctrl$[ebp]
	mov	DWORD PTR [edx+200], 1
$L70235:

; 83   : 
; 84   : 		/* Read both branches */
; 85   : 		tree = 3;

	mov	DWORD PTR _tree$[ebp], 3

; 86   : 		break;

	jmp	$L70231
$L70273:

; 87   : 
; 88   : 	case InputCheck:
; 89   : 		/* Disable empty value check if not 3 state */
; 90   : 		if(!b_3state) ctrl->error = 0;

	cmp	DWORD PTR _b_3state$[ebp], 0
	jne	SHORT $L70274
	mov	eax, DWORD PTR _ctrl$[ebp]
	mov	DWORD PTR [eax+212], 0
$L70274:

; 91   : 		break;

	jmp	$L70231
$L70275:

; 92   : 
; 93   : 	case HtmlEdit:
; 94   : 	case HtmlPrint:
; 95   : 	case HtmlView:
; 96   : 		/* Break if no output */
; 97   : 		if(!form->html) break;

	mov	ecx, DWORD PTR _form$[ebp]
	cmp	DWORD PTR [ecx+232], 0
	jne	SHORT $L70276
	jmp	$L70231
$L70276:

; 98   : 
; 99   : 		/* Defaut is no option button */
; 100  : 		if(!ctrl->OPTIONBUTTON[0]) ctrl->OPTIONBUTTON = "_EVA_NONE";

	mov	edx, DWORD PTR _ctrl$[ebp]
	mov	eax, DWORD PTR [edx+336]
	movsx	ecx, BYTE PTR [eax]
	test	ecx, ecx
	jne	SHORT $L70277
	mov	edx, DWORD PTR _ctrl$[ebp]
	mov	DWORD PTR [edx+336], OFFSET FLAT:$SG70278
$L70277:

; 101  : 
; 102  : 		/* Handle checkbox tooltip */
; 103  : 		if(ctrl->NOTES && *ctrl->NOTES) DYNBUF_ADD3(&notes, "", ctrl->NOTES, 0, NO_CONV, "\n\n");

	mov	eax, DWORD PTR _ctrl$[ebp]
	cmp	DWORD PTR [eax+288], 0
	je	SHORT $L70281
	mov	ecx, DWORD PTR _ctrl$[ebp]
	mov	edx, DWORD PTR [ecx+288]
	movsx	eax, BYTE PTR [edx]
	test	eax, eax
	je	SHORT $L70281
	push	2
	push	OFFSET FLAT:$SG70282
	push	0
	push	0
	push	0
	mov	ecx, DWORD PTR _ctrl$[ebp]
	mov	edx, DWORD PTR [ecx+288]
	push	edx
	push	0
	push	OFFSET FLAT:$SG70283
	lea	eax, DWORD PTR _notes$[ebp]
	push	eax
	call	_dynbuf_add3
	add	esp, 36					; 00000024H
	test	eax, eax
	je	SHORT $L70281
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29872], OFFSET FLAT:$SG70285
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 103		; 00000067H
	jmp	$eva_err$70247
$L70281:

; 104  : 
; 105  : 		/* Handle 3 states images */
; 106  : 		switch(tree)
; 107  : 		{

	mov	eax, DWORD PTR _tree$[ebp]
	mov	DWORD PTR -88+[ebp], eax
	cmp	DWORD PTR -88+[ebp], 0
	je	SHORT $L70290
	cmp	DWORD PTR -88+[ebp], 2
	je	SHORT $L70298
	jmp	$L70306
$L70290:

; 108  : 		case 0:	/* Null value */
; 109  : 			img = "_eva_checkbox_nul.gif";

	mov	DWORD PTR _img$[ebp], OFFSET FLAT:$SG70291

; 110  : 			imgsel = "_eva_checkbox_nul_s.gif";

	mov	DWORD PTR _imgsel$[ebp], OFFSET FLAT:$SG70292

; 111  : 			DYNBUF_ADD_STR(&notes, "Etat : non renseigné");

	push	0
	push	0
	push	20					; 00000014H
	push	OFFSET FLAT:$SG70295
	lea	ecx, DWORD PTR _notes$[ebp]
	push	ecx
	call	_dynbuf_add
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L70294
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29872], OFFSET FLAT:$SG70297
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 111		; 0000006fH
	jmp	$eva_err$70247
$L70294:

; 112  : 			break;

	jmp	$L70287
$L70298:

; 113  : 		case 2:	/* Unchecked value */
; 114  : 			img = "_eva_checkbox_no.gif";

	mov	DWORD PTR _img$[ebp], OFFSET FLAT:$SG70299

; 115  : 			imgsel = "_eva_checkbox_no_s.gif";

	mov	DWORD PTR _imgsel$[ebp], OFFSET FLAT:$SG70300

; 116  : 			DYNBUF_ADD_STR(&notes, "Etat : non coché");

	push	0
	push	0
	push	16					; 00000010H
	push	OFFSET FLAT:$SG70303
	lea	ecx, DWORD PTR _notes$[ebp]
	push	ecx
	call	_dynbuf_add
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L70302
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29872], OFFSET FLAT:$SG70305
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 116		; 00000074H
	jmp	$eva_err$70247
$L70302:

; 117  : 			break;

	jmp	SHORT $L70287
$L70306:

; 118  : 		default:	/* Checked value */
; 119  : 			img = "_eva_checkbox_yes.gif";

	mov	DWORD PTR _img$[ebp], OFFSET FLAT:$SG70307

; 120  : 			imgsel = "_eva_checkbox_yes_s.gif";

	mov	DWORD PTR _imgsel$[ebp], OFFSET FLAT:$SG70308

; 121  : 			DYNBUF_ADD_STR(&notes, "Etat : coché");

	push	0
	push	0
	push	12					; 0000000cH
	push	OFFSET FLAT:$SG70311
	lea	ecx, DWORD PTR _notes$[ebp]
	push	ecx
	call	_dynbuf_add
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L70310
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29872], OFFSET FLAT:$SG70313
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 121		; 00000079H
	jmp	$eva_err$70247
$L70310:
$L70287:

; 123  : 
; 124  : 		/* Add HTML code for control label & position */
; 125  : 		if(ctrl_format_pos(cntxt, ctrl, 1)) STACK_ERROR;

	push	1
	mov	ecx, DWORD PTR _ctrl$[ebp]
	push	ecx
	mov	edx, DWORD PTR _cntxt$[ebp]
	push	edx
	call	_ctrl_format_pos
	add	esp, 12					; 0000000cH
	test	eax, eax
	je	SHORT $L70314
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 125		; 0000007dH
	jmp	$eva_err$70247
$L70314:

; 126  : 
; 127  : 
; 128  : 		/* If edit mode */
; 129  : 		if(form->step == HtmlEdit)

	mov	ecx, DWORD PTR _form$[ebp]
	cmp	DWORD PTR [ecx+176], 4
	jne	$L70315

; 131  : 			char *onchange = CTRL_ATTR_VAL(ONCHANGE);

	cmp	DWORD PTR _ctrl$[ebp], 0
	je	SHORT $L70367
	push	0
	push	-1
	push	OFFSET FLAT:$SG70317
	mov	edx, DWORD PTR _ctrl$[ebp]
	add	edx, 44					; 0000002cH
	push	edx
	call	_dyntab_field_val
	add	esp, 16					; 00000010H
	mov	DWORD PTR -92+[ebp], eax
	jmp	SHORT $L70368
$L70367:
	mov	DWORD PTR -92+[ebp], OFFSET FLAT:$SG70318
$L70368:
	mov	eax, DWORD PTR -92+[ebp]
	mov	DWORD PTR _onchange$70316[ebp], eax

; 132  : 
; 133  : 			/* Add hidden input to hold checkbox value */
; 134  : 			if(ctrl_put_hidden(cntxt, ctrl, 0)) STACK_ERROR;

	push	0
	mov	ecx, DWORD PTR _ctrl$[ebp]
	push	ecx
	mov	edx, DWORD PTR _cntxt$[ebp]
	push	edx
	call	_ctrl_put_hidden
	add	esp, 12					; 0000000cH
	test	eax, eax
	je	SHORT $L70319
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 134		; 00000086H
	jmp	$eva_err$70247
$L70319:

; 135  : 
; 136  : 			/* Add checkbox as button */
; 137  : 			CTRL_CGINAMEVAL(&name, 0);

	push	0
	push	0
	push	0
	lea	ecx, DWORD PTR _name$[ebp]
	push	ecx
	push	1
	push	0
	push	0
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
	call	_ctrl_cgi_name
	add	esp, 32					; 00000020H
	test	eax, eax
	je	SHORT $L70321
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 137		; 00000089H
	jmp	$eva_err$70247
$L70321:
	mov	eax, DWORD PTR _ctrl$[ebp]
	mov	DWORD PTR [eax+196], 1

; 138  : 			name->data[0] = 'B';

	mov	ecx, DWORD PTR _name$[ebp]
	mov	BYTE PTR [ecx+8], 66			; 00000042H

; 139  : 			if(put_html_button(cntxt, name->data, NULL, img, imgsel, notes ? notes->data : NULL, 0,
; 140  : 				(CTRL_ATTR_CELL(CTRLTREE) || CTRL_ATTR_CELL(CTRLTREE_ALT) || (*onchange && strcmp(onchange, "_EVA_NONE"))) ? 0 : (128 | (b_3state ? 256 : 0))))

	cmp	DWORD PTR _ctrl$[ebp], 0
	je	SHORT $L70369
	push	0
	push	-1
	push	OFFSET FLAT:$SG70328
	mov	edx, DWORD PTR _ctrl$[ebp]
	add	edx, 44					; 0000002cH
	push	edx
	call	_dyntab_field_cell
	add	esp, 16					; 00000010H
	mov	DWORD PTR -96+[ebp], eax
	jmp	SHORT $L70370
$L70369:
	mov	DWORD PTR -96+[ebp], 0
$L70370:
	cmp	DWORD PTR -96+[ebp], 0
	jne	SHORT $L70373
	cmp	DWORD PTR _ctrl$[ebp], 0
	je	SHORT $L70371
	push	0
	push	-1
	push	OFFSET FLAT:$SG70329
	mov	eax, DWORD PTR _ctrl$[ebp]
	add	eax, 44					; 0000002cH
	push	eax
	call	_dyntab_field_cell
	add	esp, 16					; 00000010H
	mov	DWORD PTR -100+[ebp], eax
	jmp	SHORT $L70372
$L70371:
	mov	DWORD PTR -100+[ebp], 0
$L70372:
	cmp	DWORD PTR -100+[ebp], 0
	jne	SHORT $L70373
	mov	ecx, DWORD PTR _onchange$70316[ebp]
	movsx	edx, BYTE PTR [ecx]
	test	edx, edx
	je	SHORT $L70374
	push	OFFSET FLAT:$SG70330
	mov	eax, DWORD PTR _onchange$70316[ebp]
	push	eax
	call	_strcmp
	add	esp, 8
	test	eax, eax
	jne	SHORT $L70373
$L70374:
	mov	ecx, DWORD PTR _b_3state$[ebp]
	neg	ecx
	sbb	ecx, ecx
	and	ecx, 256				; 00000100H
	or	cl, -128				; ffffff80H
	mov	DWORD PTR -104+[ebp], ecx
	jmp	SHORT $L70375
$L70373:
	mov	DWORD PTR -104+[ebp], 0
$L70375:
	cmp	DWORD PTR _notes$[ebp], 0
	je	SHORT $L70376
	mov	edx, DWORD PTR _notes$[ebp]
	add	edx, 8
	mov	DWORD PTR -108+[ebp], edx
	jmp	SHORT $L70377
$L70376:
	mov	DWORD PTR -108+[ebp], 0
$L70377:
	mov	eax, DWORD PTR -104+[ebp]
	push	eax
	push	0
	push	0
	push	0
	push	0
	mov	ecx, DWORD PTR -108+[ebp]
	push	ecx
	mov	edx, DWORD PTR _imgsel$[ebp]
	push	edx
	mov	eax, DWORD PTR _img$[ebp]
	push	eax
	push	0
	mov	ecx, DWORD PTR _name$[ebp]
	add	ecx, 8
	push	ecx
	mov	edx, DWORD PTR _cntxt$[ebp]
	push	edx
	call	_put_html_button_sz
	add	esp, 44					; 0000002cH
	test	eax, eax
	je	SHORT $L70327

; 141  : 				STACK_ERROR;

	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 141		; 0000008dH
	jmp	$eva_err$70247
$L70327:

; 143  : 		else

	jmp	SHORT $L70336
$L70315:

; 145  : 			/* Else : Add checkbox as image */
; 146  : 			if(put_html_image(cntxt, ctrl->cginame->data, img, notes ? notes->data : NULL, NULL, NULL, 0))

	cmp	DWORD PTR _notes$[ebp], 0
	je	SHORT $L70378
	mov	ecx, DWORD PTR _notes$[ebp]
	add	ecx, 8
	mov	DWORD PTR -112+[ebp], ecx
	jmp	SHORT $L70379
$L70378:
	mov	DWORD PTR -112+[ebp], 0
$L70379:
	push	0
	push	0
	push	0
	push	0
	mov	edx, DWORD PTR -112+[ebp]
	push	edx
	mov	eax, DWORD PTR _img$[ebp]
	push	eax
	mov	ecx, DWORD PTR _ctrl$[ebp]
	mov	edx, DWORD PTR [ecx+40]
	add	edx, 8
	push	edx
	mov	eax, DWORD PTR _cntxt$[ebp]
	push	eax
	call	_put_html_img
	add	esp, 32					; 00000020H
	test	eax, eax
	je	SHORT $L70336

; 147  : 				STACK_ERROR;

	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 147		; 00000093H
	jmp	$eva_err$70247
$L70336:

; 149  : 
; 150  : 		/* Add HTML code for the control footer */
; 151  : 		if(ctrl_format_pos(cntxt, ctrl, 0)) STACK_ERROR;

	push	0
	mov	edx, DWORD PTR _ctrl$[ebp]
	push	edx
	mov	eax, DWORD PTR _cntxt$[ebp]
	push	eax
	call	_ctrl_format_pos
	add	esp, 12					; 0000000cH
	test	eax, eax
	je	SHORT $L70338
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 151		; 00000097H
	jmp	$eva_err$70247
$L70338:
$L70231:

; 156  : 
; 157  : 	/* Add lower level controls depending on check status */
; 158  : 	if(tree == 1 || tree == 3)

	cmp	DWORD PTR _tree$[ebp], 1
	je	SHORT $L70340
	cmp	DWORD PTR _tree$[ebp], 3
	jne	$L70339
$L70340:

; 160  : 		/* Controls when selected */
; 161  : 		CTRL_ATTR(ctrltree, CTRLTREE);

	lea	edx, DWORD PTR _ctrltree$[ebp]
	push	edx
	call	_dyntab_free
	add	esp, 4
	push	0
	push	-1
	push	OFFSET FLAT:$SG70343
	mov	eax, DWORD PTR _ctrl$[ebp]
	add	eax, 44					; 0000002cH
	push	eax
	push	0
	lea	ecx, DWORD PTR _ctrltree$[ebp]
	push	ecx
	call	_dyntab_filter_field
	add	esp, 24					; 00000018H
	test	eax, eax
	je	SHORT $L70342
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29872], OFFSET FLAT:$SG70345
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 161		; 000000a1H
	jmp	$eva_err$70247
$L70342:

; 162  : 		CTRL_ADD_CHILD(i_ctrl, &ctrltree);

	lea	ecx, DWORD PTR _ctrltree$[ebp]
	push	ecx
	mov	edx, DWORD PTR _i_ctrl$[ebp]
	push	edx
	mov	eax, DWORD PTR _cntxt$[ebp]
	push	eax
	call	_ctrl_add_child
	add	esp, 12					; 0000000cH
	test	eax, eax
	je	SHORT $L70346
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 162		; 000000a2H
	jmp	$eva_err$70247
$L70346:
	mov	edx, DWORD PTR _i_ctrl$[ebp]
	imul	edx, 480				; 000001e0H
	mov	eax, DWORD PTR _form$[ebp]
	mov	ecx, DWORD PTR [eax]
	add	ecx, edx
	mov	DWORD PTR _ctrl$[ebp], ecx
$L70339:

; 164  : 	if(tree == 2 || tree == 3)

	cmp	DWORD PTR _tree$[ebp], 2
	je	SHORT $L70348
	cmp	DWORD PTR _tree$[ebp], 3
	jne	$eva_noerr$70355
$L70348:

; 166  : 		/* Controls when not selected */
; 167  : 		CTRL_ATTR(ctrltree, CTRLTREE_ALT);

	lea	edx, DWORD PTR _ctrltree$[ebp]
	push	edx
	call	_dyntab_free
	add	esp, 4
	push	0
	push	-1
	push	OFFSET FLAT:$SG70351
	mov	eax, DWORD PTR _ctrl$[ebp]
	add	eax, 44					; 0000002cH
	push	eax
	push	0
	lea	ecx, DWORD PTR _ctrltree$[ebp]
	push	ecx
	call	_dyntab_filter_field
	add	esp, 24					; 00000018H
	test	eax, eax
	je	SHORT $L70350
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29872], OFFSET FLAT:$SG70353
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 167		; 000000a7H
	jmp	SHORT $eva_err$70247
$L70350:

; 168  : 		CTRL_ADD_CHILD(i_ctrl, &ctrltree);

	lea	ecx, DWORD PTR _ctrltree$[ebp]
	push	ecx
	mov	edx, DWORD PTR _i_ctrl$[ebp]
	push	edx
	mov	eax, DWORD PTR _cntxt$[ebp]
	push	eax
	call	_ctrl_add_child
	add	esp, 12					; 0000000cH
	test	eax, eax
	je	SHORT $L70354
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 168		; 000000a8H
	jmp	SHORT $eva_err$70247
$L70354:
	mov	edx, DWORD PTR _i_ctrl$[ebp]
	imul	edx, 480				; 000001e0H
	mov	eax, DWORD PTR _form$[ebp]
	mov	ecx, DWORD PTR [eax]
	add	ecx, edx
	mov	DWORD PTR _ctrl$[ebp], ecx
$eva_noerr$70355:

; 170  : 
; 171  : 	/* Add lower level controls */
; 172  : 	RETURN_OK_CLEANUP;

	push	0
	push	OFFSET FLAT:$SG70356
	push	OFFSET FLAT:$SG70357
	mov	edx, DWORD PTR _cntxt$[ebp]
	push	edx
	call	_err_clear
	add	esp, 16					; 00000010H
$eva_err$70247:
	mov	eax, DWORD PTR _cntxt$[ebp]
	cmp	DWORD PTR [eax+29872], 0
	je	SHORT $L70358
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	edx, DWORD PTR [ecx+29900]
	push	edx
	push	OFFSET FLAT:$SG70359
	push	OFFSET FLAT:$SG70360
	mov	eax, DWORD PTR _cntxt$[ebp]
	push	eax
	call	_err_add_context
	add	esp, 16					; 00000010H
$L70358:
	lea	ecx, DWORD PTR _ctrltree$[ebp]
	push	ecx
	call	_dyntab_free
	add	esp, 4
	mov	edx, DWORD PTR _name$[ebp]
	push	edx
	call	_mem_free
	add	esp, 4
	mov	DWORD PTR _name$[ebp], 0
	mov	eax, DWORD PTR _notes$[ebp]
	push	eax
	call	_mem_free
	add	esp, 4
	mov	DWORD PTR _notes$[ebp], 0
	mov	ecx, DWORD PTR _cntxt$[ebp]
	xor	eax, eax
	cmp	DWORD PTR [ecx+29872], 0
	setne	al

; 173  : }

	mov	esp, ebp
	pop	ebp
	ret	0
$L70380:
	DD	$L70234
	DD	$L70338
	DD	$L70273
	DD	$L70338
	DD	$L70275
	DD	$L70338
	DD	$L70275
	DD	$L70275
_ctrl_add_chkbox ENDP
_TEXT	ENDS
END
