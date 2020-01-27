	TITLE	D:\Travail\ABI\EVA\V4.0\CGI\Brunix-2016\ctrl_input_color.c
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
PUBLIC	_ctrl_add_input_color
EXTRN	_mem_free:NEAR
EXTRN	_plain_to_html:BYTE
EXTRN	_no_quote:BYTE
EXTRN	_dynbuf_add:NEAR
EXTRN	_ctrl_cgi_name:NEAR
EXTRN	_dynbuf_add3:NEAR
EXTRN	_dyntab_sz:NEAR
EXTRN	_dyntab_val:NEAR
EXTRN	_dyntab_cell:NEAR
EXTRN	_ctrl_format_pos:NEAR
EXTRN	_err_add_context:NEAR
EXTRN	_err_clear:NEAR
_BSS	SEGMENT
$SG70248 DB	01H DUP (?)
_BSS	ENDS
_DATA	SEGMENT
$SG70224 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70232 DB	'<br>', 00H
	ORG $+3
$SG70234 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70237 DB	'<table border=1 cellpadding=0 cellspacing=0><tr>', 00H
	ORG $+3
$SG70239 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70242 DB	'<td width=50 height=20', 00H
	ORG $+1
$SG70244 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70249 DB	' bgcolor=#', 00H
	ORG $+1
$SG70251 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70255 DB	' background=/img/bg_rayures_grises.gif', 00H
	ORG $+1
$SG70257 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70265 DB	''')"', 00H
$SG70266 DB	' onClick="showColor(this,''', 00H
	ORG $+1
$SG70268 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70271 DB	'></td><td>', 00H
	ORG $+1
$SG70273 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70276 DB	''' name=''', 00H
	ORG $+3
$SG70277 DB	'<input type=text size=6 value=''', 00H
$SG70279 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70283 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70286 DB	'''>', 00H
	ORG $+1
$SG70288 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70292 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70295 DB	'</td></tr></table>', 00H
	ORG $+1
$SG70297 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70301 DB	'D:\Travail\ABI\EVA\V4.0\CGI\Brunix-2016\ctrl_input_color'
	DB	'.c', 00H
	ORG $+1
$SG70302 DB	'ctrl_add_input_color', 00H
	ORG $+3
$SG70304 DB	'D:\Travail\ABI\EVA\V4.0\CGI\Brunix-2016\ctrl_input_color'
	DB	'.c', 00H
	ORG $+1
$SG70305 DB	'ctrl_add_input_color', 00H
_DATA	ENDS
_TEXT	SEGMENT
_cntxt$ = 8
_i_ctrl$ = 12
_form$ = -4
_ctrl$ = -16
_name$ = -12
_i$ = -8
_ctrl_add_input_color PROC NEAR

; 25   : ){

	push	ebp
	mov	ebp, esp
	sub	esp, 28					; 0000001cH

; 26   : 	EVA_form *form = cntxt->form;

	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	ecx, DWORD PTR [eax+80]
	mov	DWORD PTR _form$[ebp], ecx

; 27   : 	EVA_ctrl *ctrl = form->ctrl + i_ctrl;

	mov	edx, DWORD PTR _i_ctrl$[ebp]
	imul	edx, 480				; 000001e0H
	mov	eax, DWORD PTR _form$[ebp]
	mov	ecx, DWORD PTR [eax]
	add	ecx, edx
	mov	DWORD PTR _ctrl$[ebp], ecx

; 28   : 	DynBuffer *name = NULL;

	mov	DWORD PTR _name$[ebp], 0

; 29   : 	unsigned long i;
; 30   : 
; 31   : 	switch(form->step)
; 32   : 	{

	mov	edx, DWORD PTR _form$[ebp]
	mov	eax, DWORD PTR [edx+176]
	mov	DWORD PTR -20+[ebp], eax
	cmp	DWORD PTR -20+[ebp], 4
	je	SHORT $L70218
	cmp	DWORD PTR -20+[ebp], 5
	jle	$L70299
	cmp	DWORD PTR -20+[ebp], 7
	jle	SHORT $L70218
	jmp	$L70299
$L70218:

; 33   : 	case HtmlPrint:
; 34   : 	case HtmlView:
; 35   : 	case HtmlEdit:
; 36   : 		/* Output control header */
; 37   : 		if(ctrl_format_pos(cntxt, ctrl, 1)) STACK_ERROR;

	push	1
	mov	ecx, DWORD PTR _ctrl$[ebp]
	push	ecx
	mov	edx, DWORD PTR _cntxt$[ebp]
	push	edx
	call	_ctrl_format_pos
	add	esp, 12					; 0000000cH
	test	eax, eax
	je	SHORT $L70219
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 37		; 00000025H
	jmp	$eva_err$70220
$L70219:

; 38   : 
; 39   : 		/* Handle empty value in view mode */
; 40   : 		if(form->step != HtmlEdit && !ctrl->val.nbrows && *ctrl->LABEL_NOSEL) DYNBUF_ADD(form->html, ctrl->LABEL_NOSEL, 0, TO_HTML);

	mov	ecx, DWORD PTR _form$[ebp]
	cmp	DWORD PTR [ecx+176], 4
	je	SHORT $L70222
	mov	edx, DWORD PTR _ctrl$[ebp]
	cmp	DWORD PTR [edx+64], 0
	jne	SHORT $L70222
	mov	eax, DWORD PTR _ctrl$[ebp]
	mov	ecx, DWORD PTR [eax+348]
	movsx	edx, BYTE PTR [ecx]
	test	edx, edx
	je	SHORT $L70222
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
	je	SHORT $L70222
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29872], OFFSET FLAT:$SG70224
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 40		; 00000028H
	jmp	$eva_err$70220
$L70222:

; 41   : 
; 42   : 		/* Output each value */
; 43   : 		for(i = 0; !i || i < ctrl->val.nbrows; i++)

	mov	DWORD PTR _i$[ebp], 0
	jmp	SHORT $L70225
$L70226:
	mov	eax, DWORD PTR _i$[ebp]
	add	eax, 1
	mov	DWORD PTR _i$[ebp], eax
$L70225:
	cmp	DWORD PTR _i$[ebp], 0
	je	SHORT $L70228
	mov	ecx, DWORD PTR _ctrl$[ebp]
	mov	edx, DWORD PTR _i$[ebp]
	cmp	edx, DWORD PTR [ecx+64]
	jae	$L70227
$L70228:

; 45   : 			/* Separate multiple values with a line break */
; 46   : 			if(i) DYNBUF_ADD_STR(form->html, "<br>");

	cmp	DWORD PTR _i$[ebp], 0
	je	SHORT $L70231
	push	0
	push	0
	push	4
	push	OFFSET FLAT:$SG70232
	mov	eax, DWORD PTR _form$[ebp]
	mov	ecx, DWORD PTR [eax+232]
	push	ecx
	call	_dynbuf_add
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L70231
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29872], OFFSET FLAT:$SG70234
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 46		; 0000002eH
	jmp	$eva_err$70220
$L70231:

; 47   : 
; 48   : 			/* Output table for color display */
; 49   : 			DYNBUF_ADD_STR(form->html, "<table border=1 cellpadding=0 cellspacing=0><tr>");

	push	0
	push	0
	push	48					; 00000030H
	push	OFFSET FLAT:$SG70237
	mov	ecx, DWORD PTR _form$[ebp]
	mov	edx, DWORD PTR [ecx+232]
	push	edx
	call	_dynbuf_add
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L70236
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29872], OFFSET FLAT:$SG70239
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 49		; 00000031H
	jmp	$eva_err$70220
$L70236:

; 50   : 
; 51   : 			/* Output color cell */
; 52   : 			DYNBUF_ADD_STR(form->html, "<td width=50 height=20");

	push	0
	push	0
	push	22					; 00000016H
	push	OFFSET FLAT:$SG70242
	mov	edx, DWORD PTR _form$[ebp]
	mov	eax, DWORD PTR [edx+232]
	push	eax
	call	_dynbuf_add
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L70241
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29872], OFFSET FLAT:$SG70244
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 52		; 00000034H
	jmp	$eva_err$70220
$L70241:

; 53   : 			if(dyntab_sz(&ctrl->val, i, 0))

	push	0
	mov	eax, DWORD PTR _i$[ebp]
	push	eax
	mov	ecx, DWORD PTR _ctrl$[ebp]
	add	ecx, 64					; 00000040H
	push	ecx
	call	_dyntab_sz
	add	esp, 12					; 0000000cH
	test	eax, eax
	je	SHORT $L70245

; 54   : 				DYNBUF_ADD3_CELL(form->html, " bgcolor=#", &ctrl->val, i, 0, NO_CONV, "")

	push	0
	push	OFFSET FLAT:$SG70248
	push	0
	push	0
	push	0
	mov	edx, DWORD PTR _i$[ebp]
	push	edx
	mov	eax, DWORD PTR _ctrl$[ebp]
	add	eax, 64					; 00000040H
	push	eax
	call	_dyntab_sz
	add	esp, 12					; 0000000cH
	push	eax
	push	0
	mov	ecx, DWORD PTR _i$[ebp]
	push	ecx
	mov	edx, DWORD PTR _ctrl$[ebp]
	add	edx, 64					; 00000040H
	push	edx
	call	_dyntab_val
	add	esp, 12					; 0000000cH
	push	eax
	push	10					; 0000000aH
	push	OFFSET FLAT:$SG70249
	mov	eax, DWORD PTR _form$[ebp]
	mov	ecx, DWORD PTR [eax+232]
	push	ecx
	call	_dynbuf_add3
	add	esp, 36					; 00000024H
	test	eax, eax
	je	SHORT $L70247
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29872], OFFSET FLAT:$SG70251
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 54		; 00000036H
	jmp	$eva_err$70220
$L70247:

; 55   : 			else

	jmp	SHORT $L70254
$L70245:

; 56   : 				DYNBUF_ADD_STR(form->html, " background=/img/bg_rayures_grises.gif");

	push	0
	push	0
	push	38					; 00000026H
	push	OFFSET FLAT:$SG70255
	mov	ecx, DWORD PTR _form$[ebp]
	mov	edx, DWORD PTR [ecx+232]
	push	edx
	call	_dynbuf_add
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L70254
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29872], OFFSET FLAT:$SG70257
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 56		; 00000038H
	jmp	$eva_err$70220
$L70254:

; 57   : 
; 58   : 			/* Handle edit mode */
; 59   : 			if(form->step == HtmlEdit)

	mov	edx, DWORD PTR _form$[ebp]
	cmp	DWORD PTR [edx+176], 4
	jne	$L70264

; 61   : 				CTRL_CGINAMEVAL(&name, i);

	push	0
	push	0
	push	0
	lea	eax, DWORD PTR _name$[ebp]
	push	eax
	push	1
	push	0
	mov	ecx, DWORD PTR _i$[ebp]
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
	call	_ctrl_cgi_name
	add	esp, 32					; 00000020H
	test	eax, eax
	je	SHORT $L70260
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 61		; 0000003dH
	jmp	$eva_err$70220
$L70260:
	mov	eax, DWORD PTR _ctrl$[ebp]
	mov	DWORD PTR [eax+196], 1

; 62   : 				cntxt->jsColorInput = 1;

	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29688], 1

; 63   : 				if(cntxt->jsenabled)

	mov	edx, DWORD PTR _cntxt$[ebp]
	cmp	DWORD PTR [edx+29676], 0
	je	SHORT $L70264

; 64   : 					DYNBUF_ADD3_BUF(form->html, " onClick=\"showColor(this,'", name, NO_CONV, "')\"");

	cmp	DWORD PTR _name$[ebp], 0
	je	SHORT $L70310
	mov	eax, DWORD PTR _name$[ebp]
	mov	ecx, DWORD PTR [eax+4]
	mov	DWORD PTR -24+[ebp], ecx
	jmp	SHORT $L70311
$L70310:
	mov	DWORD PTR -24+[ebp], 0
$L70311:
	cmp	DWORD PTR _name$[ebp], 0
	je	SHORT $L70312
	mov	edx, DWORD PTR _name$[ebp]
	add	edx, 8
	mov	DWORD PTR -28+[ebp], edx
	jmp	SHORT $L70313
$L70312:
	mov	DWORD PTR -28+[ebp], 0
$L70313:
	push	3
	push	OFFSET FLAT:$SG70265
	push	0
	push	0
	mov	eax, DWORD PTR -24+[ebp]
	push	eax
	mov	ecx, DWORD PTR -28+[ebp]
	push	ecx
	push	26					; 0000001aH
	push	OFFSET FLAT:$SG70266
	mov	edx, DWORD PTR _form$[ebp]
	mov	eax, DWORD PTR [edx+232]
	push	eax
	call	_dynbuf_add3
	add	esp, 36					; 00000024H
	test	eax, eax
	je	SHORT $L70264
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29872], OFFSET FLAT:$SG70268
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 64		; 00000040H
	jmp	$eva_err$70220
$L70264:

; 66   : 			DYNBUF_ADD_STR(form->html, "></td><td>");

	push	0
	push	0
	push	10					; 0000000aH
	push	OFFSET FLAT:$SG70271
	mov	eax, DWORD PTR _form$[ebp]
	mov	ecx, DWORD PTR [eax+232]
	push	ecx
	call	_dynbuf_add
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L70270
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29872], OFFSET FLAT:$SG70273
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 66		; 00000042H
	jmp	$eva_err$70220
$L70270:

; 67   : 
; 68   : 			/* Output value or text input if edit mode */
; 69   : 			if(form->step == HtmlEdit)

	mov	ecx, DWORD PTR _form$[ebp]
	cmp	DWORD PTR [ecx+176], 4
	jne	$L70274

; 71   : 				DYNBUF_ADD3_CELL(form->html, "<input type=text size=6 value='", &ctrl->val, i, 0, HTML_NO_QUOTE, "' name='");

	push	8
	push	OFFSET FLAT:$SG70276
	push	1
	push	OFFSET FLAT:_no_quote
	push	0
	mov	edx, DWORD PTR _i$[ebp]
	push	edx
	mov	eax, DWORD PTR _ctrl$[ebp]
	add	eax, 64					; 00000040H
	push	eax
	call	_dyntab_sz
	add	esp, 12					; 0000000cH
	push	eax
	push	0
	mov	ecx, DWORD PTR _i$[ebp]
	push	ecx
	mov	edx, DWORD PTR _ctrl$[ebp]
	add	edx, 64					; 00000040H
	push	edx
	call	_dyntab_val
	add	esp, 12					; 0000000cH
	push	eax
	push	31					; 0000001fH
	push	OFFSET FLAT:$SG70277
	mov	eax, DWORD PTR _form$[ebp]
	mov	ecx, DWORD PTR [eax+232]
	push	ecx
	call	_dynbuf_add3
	add	esp, 36					; 00000024H
	test	eax, eax
	je	SHORT $L70275
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29872], OFFSET FLAT:$SG70279
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 71		; 00000047H
	jmp	$eva_err$70220
$L70275:

; 72   : 				DYNBUF_ADD_BUF(form->html, name, NO_CONV);

	cmp	DWORD PTR _name$[ebp], 0
	je	SHORT $L70281
	push	0
	push	0
	mov	ecx, DWORD PTR _name$[ebp]
	mov	edx, DWORD PTR [ecx+4]
	push	edx
	mov	eax, DWORD PTR _name$[ebp]
	add	eax, 8
	push	eax
	mov	ecx, DWORD PTR _form$[ebp]
	mov	edx, DWORD PTR [ecx+232]
	push	edx
	call	_dynbuf_add
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L70281
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29872], OFFSET FLAT:$SG70283
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 72		; 00000048H
	jmp	$eva_err$70220
$L70281:

; 73   : 				DYNBUF_ADD_STR(form->html, "'>");

	push	0
	push	0
	push	2
	push	OFFSET FLAT:$SG70286
	mov	edx, DWORD PTR _form$[ebp]
	mov	eax, DWORD PTR [edx+232]
	push	eax
	call	_dynbuf_add
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L70285
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29872], OFFSET FLAT:$SG70288
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 73		; 00000049H
	jmp	$eva_err$70220
$L70285:

; 75   : 			else

	jmp	SHORT $L70290
$L70274:

; 76   : 				DYNBUF_ADD_CELL(form->html, &ctrl->val, i, 0, TO_HTML);

	push	1
	push	OFFSET FLAT:_plain_to_html
	push	0
	mov	eax, DWORD PTR _i$[ebp]
	push	eax
	mov	ecx, DWORD PTR _ctrl$[ebp]
	add	ecx, 64					; 00000040H
	push	ecx
	call	_dyntab_sz
	add	esp, 12					; 0000000cH
	push	eax
	push	0
	mov	edx, DWORD PTR _i$[ebp]
	push	edx
	mov	eax, DWORD PTR _ctrl$[ebp]
	add	eax, 64					; 00000040H
	push	eax
	call	_dyntab_val
	add	esp, 12					; 0000000cH
	push	eax
	mov	ecx, DWORD PTR _form$[ebp]
	mov	edx, DWORD PTR [ecx+232]
	push	edx
	call	_dynbuf_add
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L70290
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29872], OFFSET FLAT:$SG70292
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 76		; 0000004cH
	jmp	SHORT $eva_err$70220
$L70290:

; 77   : 			DYNBUF_ADD_STR(form->html, "</td></tr></table>");

	push	0
	push	0
	push	18					; 00000012H
	push	OFFSET FLAT:$SG70295
	mov	edx, DWORD PTR _form$[ebp]
	mov	eax, DWORD PTR [edx+232]
	push	eax
	call	_dynbuf_add
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L70294
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29872], OFFSET FLAT:$SG70297
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 77		; 0000004dH
	jmp	SHORT $eva_err$70220
$L70294:

; 78   : 		}

	jmp	$L70226
$L70227:

; 79   : 
; 80   : 		/* Output control footer */
; 81   : 		if(ctrl_format_pos(cntxt, ctrl, 0)) STACK_ERROR;

	push	0
	mov	eax, DWORD PTR _ctrl$[ebp]
	push	eax
	mov	ecx, DWORD PTR _cntxt$[ebp]
	push	ecx
	call	_ctrl_format_pos
	add	esp, 12					; 0000000cH
	test	eax, eax
	je	SHORT $L70299
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 81		; 00000051H
	jmp	SHORT $eva_err$70220
$L70299:
$eva_noerr$70300:

; 86   : 	RETURN_OK_CLEANUP;

	push	0
	push	OFFSET FLAT:$SG70301
	push	OFFSET FLAT:$SG70302
	mov	eax, DWORD PTR _cntxt$[ebp]
	push	eax
	call	_err_clear
	add	esp, 16					; 00000010H
$eva_err$70220:
	mov	ecx, DWORD PTR _cntxt$[ebp]
	cmp	DWORD PTR [ecx+29872], 0
	je	SHORT $L70303
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	eax, DWORD PTR [edx+29900]
	push	eax
	push	OFFSET FLAT:$SG70304
	push	OFFSET FLAT:$SG70305
	mov	ecx, DWORD PTR _cntxt$[ebp]
	push	ecx
	call	_err_add_context
	add	esp, 16					; 00000010H
$L70303:
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

; 87   : }

	mov	esp, ebp
	pop	ebp
	ret	0
_ctrl_add_input_color ENDP
_TEXT	ENDS
END
