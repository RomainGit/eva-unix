	TITLE	D:\Travail\ABI\EVA\V4.0\CGI\Brunix-2016\ctrl_misc.c
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
PUBLIC	_ctrl_add_statictext
EXTRN	_mailmerge_brackets:NEAR
EXTRN	_mem_free:NEAR
EXTRN	_plain_to_html:BYTE
EXTRN	_dynbuf_add:NEAR
EXTRN	_ctrl_format_pos:NEAR
EXTRN	_err_add_context:NEAR
EXTRN	_err_clear:NEAR
EXTRN	_dyntab_field_cell:NEAR
_DATA	SEGMENT
$SG70215 DB	'_EVA_TEXT', 00H
	ORG $+2
$SG70219 DB	'_EVA_HTML', 00H
	ORG $+2
$SG70232 DB	'_EVA_NONE', 00H
	ORG $+2
$SG70235 DB	'_EVA_EVALSQL', 00H
	ORG $+3
$SG70237 DB	'D:\Travail\ABI\EVA\V4.0\CGI\Brunix-2016\ctrl_misc.c', 00H
$SG70238 DB	'ctrl_add_statictext', 00H
$SG70244 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70250 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70253 DB	'D:\Travail\ABI\EVA\V4.0\CGI\Brunix-2016\ctrl_misc.c', 00H
$SG70254 DB	'ctrl_add_statictext', 00H
$SG70256 DB	'D:\Travail\ABI\EVA\V4.0\CGI\Brunix-2016\ctrl_misc.c', 00H
$SG70257 DB	'ctrl_add_statictext', 00H
_DATA	ENDS
_TEXT	SEGMENT
_cntxt$ = 8
_i_ctrl$ = 12
_form$ = -4
_ctrl$ = -24
_buf$ = -8
_text$ = -20
_b_html$ = -16
_html$ = -12
__c$70240 = -28
_ctrl_add_statictext PROC NEAR

; 25   : ){

	push	ebp
	mov	ebp, esp
	sub	esp, 52					; 00000034H

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

; 28   : 	DynBuffer *buf = NULL;

	mov	DWORD PTR _buf$[ebp], 0

; 29   : 	DynTableCell *text = CTRL_ATTR_CELL(TEXT);

	cmp	DWORD PTR _ctrl$[ebp], 0
	je	SHORT $L70348
	push	0
	push	-1
	push	OFFSET FLAT:$SG70215
	mov	edx, DWORD PTR _ctrl$[ebp]
	add	edx, 44					; 0000002cH
	push	edx
	call	_dyntab_field_cell
	add	esp, 16					; 00000010H
	mov	DWORD PTR -32+[ebp], eax
	jmp	SHORT $L70349
$L70348:
	mov	DWORD PTR -32+[ebp], 0
$L70349:
	mov	eax, DWORD PTR -32+[ebp]
	mov	DWORD PTR _text$[ebp], eax

; 30   : 	int b_html = CTRL_ATTR_CELL(HTML) != NULL;

	cmp	DWORD PTR _ctrl$[ebp], 0
	je	SHORT $L70350
	push	0
	push	-1
	push	OFFSET FLAT:$SG70219
	mov	ecx, DWORD PTR _ctrl$[ebp]
	add	ecx, 44					; 0000002cH
	push	ecx
	call	_dyntab_field_cell
	add	esp, 16					; 00000010H
	mov	DWORD PTR -36+[ebp], eax
	jmp	SHORT $L70351
$L70350:
	mov	DWORD PTR -36+[ebp], 0
$L70351:
	xor	edx, edx
	cmp	DWORD PTR -36+[ebp], 0
	setne	dl
	mov	DWORD PTR _b_html$[ebp], edx

; 31   : 	CHECK_HTML_STATUS;

	cmp	DWORD PTR _cntxt$[ebp], 0
	je	SHORT $L70354
	mov	eax, DWORD PTR _cntxt$[ebp]
	cmp	DWORD PTR [eax+80], 0
	je	SHORT $L70352
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	edx, DWORD PTR [ecx+80]
	mov	eax, DWORD PTR [edx+232]
	mov	DWORD PTR -40+[ebp], eax
	jmp	SHORT $L70353
$L70352:
	mov	DWORD PTR -40+[ebp], 0
$L70353:
	mov	ecx, DWORD PTR -40+[ebp]
	mov	DWORD PTR -44+[ebp], ecx
	jmp	SHORT $L70355
$L70354:
	mov	DWORD PTR -44+[ebp], 0
$L70355:
	mov	edx, DWORD PTR -44+[ebp]
	mov	DWORD PTR _html$[ebp], edx
	cmp	DWORD PTR _html$[ebp], 0
	jne	SHORT $L70223
	xor	eax, eax
	jmp	$L70208
$L70223:

; 32   : 	if(!text) RETURN_OK;

	cmp	DWORD PTR _text$[ebp], 0
	jne	SHORT $L70224
	jmp	$eva_noerr$70225
$L70224:

; 33   : 
; 34   : 	switch(form->step)
; 35   : 	{

	mov	eax, DWORD PTR _form$[ebp]
	mov	ecx, DWORD PTR [eax+176]
	mov	DWORD PTR -48+[ebp], ecx
	cmp	DWORD PTR -48+[ebp], 4
	je	SHORT $L70230
	cmp	DWORD PTR -48+[ebp], 5
	jle	$L70251
	cmp	DWORD PTR -48+[ebp], 7
	jle	SHORT $L70230
	jmp	$L70251
$L70230:

; 36   : 	case HtmlEdit:
; 37   : 	case HtmlPrint:
; 38   : 	case HtmlView:
; 39   : 		/* Set STATICTEXT default attributes values */
; 40   : 		if(!ctrl->LABELPOS[0]) ctrl->LABELPOS = "_EVA_NONE";

	mov	edx, DWORD PTR _ctrl$[ebp]
	mov	eax, DWORD PTR [edx+292]
	movsx	ecx, BYTE PTR [eax]
	test	ecx, ecx
	jne	SHORT $L70231
	mov	edx, DWORD PTR _ctrl$[ebp]
	mov	DWORD PTR [edx+292], OFFSET FLAT:$SG70232
$L70231:

; 41   : 
; 42   : 		/* Handle brackets evaluation */
; 43   : 		if(CTRL_ATTR_CELL(EVALSQL))

	cmp	DWORD PTR _ctrl$[ebp], 0
	je	SHORT $L70356
	push	0
	push	-1
	push	OFFSET FLAT:$SG70235
	mov	eax, DWORD PTR _ctrl$[ebp]
	add	eax, 44					; 0000002cH
	push	eax
	call	_dyntab_field_cell
	add	esp, 16					; 00000010H
	mov	DWORD PTR -52+[ebp], eax
	jmp	SHORT $L70357
$L70356:
	mov	DWORD PTR -52+[ebp], 0
$L70357:
	cmp	DWORD PTR -52+[ebp], 0
	je	SHORT $L70234

; 45   : 			if(mailmerge_brackets(cntxt, &buf, text->txt, text->len, i_ctrl, 0)) CLEAR_ERROR;

	push	0
	mov	ecx, DWORD PTR _i_ctrl$[ebp]
	push	ecx
	mov	edx, DWORD PTR _text$[ebp]
	mov	eax, DWORD PTR [edx+4]
	push	eax
	mov	ecx, DWORD PTR _text$[ebp]
	mov	edx, DWORD PTR [ecx]
	push	edx
	lea	eax, DWORD PTR _buf$[ebp]
	push	eax
	mov	ecx, DWORD PTR _cntxt$[ebp]
	push	ecx
	call	_mailmerge_brackets
	add	esp, 24					; 00000018H
	test	eax, eax
	je	SHORT $L70236
	push	45					; 0000002dH
	push	OFFSET FLAT:$SG70237
	push	OFFSET FLAT:$SG70238
	mov	edx, DWORD PTR _cntxt$[ebp]
	push	edx
	call	_err_clear
	add	esp, 16					; 00000010H
$L70236:

; 47   : 		else

	jmp	SHORT $L70242
$L70234:

; 48   : 			DYNBUF_ADD_CELLP(&buf, text, NO_CONV);

	mov	eax, DWORD PTR _text$[ebp]
	mov	DWORD PTR __c$70240[ebp], eax
	cmp	DWORD PTR __c$70240[ebp], 0
	je	SHORT $L70242
	push	0
	push	0
	mov	ecx, DWORD PTR __c$70240[ebp]
	mov	edx, DWORD PTR [ecx+4]
	push	edx
	mov	eax, DWORD PTR __c$70240[ebp]
	mov	ecx, DWORD PTR [eax]
	push	ecx
	lea	edx, DWORD PTR _buf$[ebp]
	push	edx
	call	_dynbuf_add
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L70242
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29872], OFFSET FLAT:$SG70244
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 48		; 00000030H
	jmp	$eva_err$70245
$L70242:

; 49   : 
; 50   : 		/* Output text */
; 51   : 		if(ctrl_format_pos(cntxt, ctrl, 1)) STACK_ERROR;

	push	1
	mov	edx, DWORD PTR _ctrl$[ebp]
	push	edx
	mov	eax, DWORD PTR _cntxt$[ebp]
	push	eax
	call	_ctrl_format_pos
	add	esp, 12					; 0000000cH
	test	eax, eax
	je	SHORT $L70246
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 51		; 00000033H
	jmp	$eva_err$70245
$L70246:

; 52   : 		if(buf && dynbuf_add(html, buf->data, buf->cnt, b_html ? NULL : plain_to_html, 1)) RETURN_ERR_MEMORY;

	cmp	DWORD PTR _buf$[ebp], 0
	je	SHORT $L70248
	push	1
	mov	edx, DWORD PTR _b_html$[ebp]
	neg	edx
	sbb	edx, edx
	not	edx
	and	edx, OFFSET FLAT:_plain_to_html
	push	edx
	mov	eax, DWORD PTR _buf$[ebp]
	mov	ecx, DWORD PTR [eax+4]
	push	ecx
	mov	edx, DWORD PTR _buf$[ebp]
	add	edx, 8
	push	edx
	mov	eax, DWORD PTR _html$[ebp]
	push	eax
	call	_dynbuf_add
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L70248
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29872], OFFSET FLAT:$SG70250
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 52		; 00000034H
	jmp	SHORT $eva_err$70245
$L70248:

; 53   : 		if(ctrl_format_pos(cntxt, ctrl, 0)) STACK_ERROR;

	push	0
	mov	eax, DWORD PTR _ctrl$[ebp]
	push	eax
	mov	ecx, DWORD PTR _cntxt$[ebp]
	push	ecx
	call	_ctrl_format_pos
	add	esp, 12					; 0000000cH
	test	eax, eax
	je	SHORT $L70251
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 53		; 00000035H
	jmp	SHORT $eva_err$70245
$L70251:
$eva_noerr$70225:

; 57   : 
; 58   : 	RETURN_OK_CLEANUP;

	push	0
	push	OFFSET FLAT:$SG70253
	push	OFFSET FLAT:$SG70254
	mov	eax, DWORD PTR _cntxt$[ebp]
	push	eax
	call	_err_clear
	add	esp, 16					; 00000010H
$eva_err$70245:
	mov	ecx, DWORD PTR _cntxt$[ebp]
	cmp	DWORD PTR [ecx+29872], 0
	je	SHORT $L70255
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	eax, DWORD PTR [edx+29900]
	push	eax
	push	OFFSET FLAT:$SG70256
	push	OFFSET FLAT:$SG70257
	mov	ecx, DWORD PTR _cntxt$[ebp]
	push	ecx
	call	_err_add_context
	add	esp, 16					; 00000010H
$L70255:
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
$L70208:

; 59   : }

	mov	esp, ebp
	pop	ebp
	ret	0
_ctrl_add_statictext ENDP
_TEXT	ENDS
PUBLIC	_ctrl_add_anchor
EXTRN	_html_tooltip:BYTE
EXTRN	_no_quote:BYTE
EXTRN	_dynbuf_add3:NEAR
_DATA	SEGMENT
$SG70274 DB	'_EVA_NONE', 00H
	ORG $+2
$SG70280 DB	'_EVA_URL', 00H
	ORG $+3
$SG70283 DB	''' target=_blank', 00H
$SG70284 DB	'<a href=''', 00H
	ORG $+2
$SG70286 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70290 DB	'_EVA_NOTES', 00H
	ORG $+1
$SG70293 DB	'''', 00H
	ORG $+2
$SG70294 DB	'title=''', 00H
$SG70296 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70299 DB	'_EVA_LABEL', 00H
	ORG $+1
$SG70302 DB	'</a>', 00H
	ORG $+3
$SG70303 DB	'>', 00H
	ORG $+2
$SG70305 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70309 DB	'D:\Travail\ABI\EVA\V4.0\CGI\Brunix-2016\ctrl_misc.c', 00H
$SG70310 DB	'ctrl_add_anchor', 00H
$SG70312 DB	'D:\Travail\ABI\EVA\V4.0\CGI\Brunix-2016\ctrl_misc.c', 00H
$SG70313 DB	'ctrl_add_anchor', 00H
_DATA	ENDS
_TEXT	SEGMENT
_cntxt$ = 8
_i_ctrl$ = 12
_form$ = -4
_ctrl$ = -8
__c$70278 = -12
__c$70288 = -16
__c$70297 = -20
_ctrl_add_anchor PROC NEAR

; 72   : ){

	push	ebp
	mov	ebp, esp
	sub	esp, 60					; 0000003cH

; 73   : 	EVA_form *form = cntxt->form;

	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	ecx, DWORD PTR [eax+80]
	mov	DWORD PTR _form$[ebp], ecx

; 74   : 	EVA_ctrl *ctrl = form->ctrl + i_ctrl;

	mov	edx, DWORD PTR _i_ctrl$[ebp]
	imul	edx, 480				; 000001e0H
	mov	eax, DWORD PTR _form$[ebp]
	mov	ecx, DWORD PTR [eax]
	add	ecx, edx
	mov	DWORD PTR _ctrl$[ebp], ecx

; 75   : 
; 76   : 	switch(form->step)
; 77   : 	{

	mov	edx, DWORD PTR _form$[ebp]
	mov	eax, DWORD PTR [edx+176]
	mov	DWORD PTR -24+[ebp], eax
	cmp	DWORD PTR -24+[ebp], 7
	ja	$L70306
	mov	ecx, DWORD PTR -24+[ebp]
	jmp	DWORD PTR $L70377[ecx*4]
$L70272:

; 78   : 	case CtrlRead:
; 79   : 		if(!*ctrl->LABELPOS) ctrl->LABELPOS = "_EVA_NONE";

	mov	edx, DWORD PTR _ctrl$[ebp]
	mov	eax, DWORD PTR [edx+292]
	movsx	ecx, BYTE PTR [eax]
	test	ecx, ecx
	jne	SHORT $L70273
	mov	edx, DWORD PTR _ctrl$[ebp]
	mov	DWORD PTR [edx+292], OFFSET FLAT:$SG70274
$L70273:

; 80   : 		break;

	jmp	$eva_noerr$70308
$L70275:

; 81   : 	case HtmlEdit:
; 82   : 	case HtmlPrint:
; 83   : 	case HtmlView:
; 84   : 		/* Output text */
; 85   : 		if(ctrl_format_pos(cntxt, ctrl, 1)) STACK_ERROR;

	push	1
	mov	eax, DWORD PTR _ctrl$[ebp]
	push	eax
	mov	ecx, DWORD PTR _cntxt$[ebp]
	push	ecx
	call	_ctrl_format_pos
	add	esp, 12					; 0000000cH
	test	eax, eax
	je	SHORT $L70276
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 85		; 00000055H
	jmp	$eva_err$70277
$L70276:

; 86   : 		DYNBUF_ADD3_CELLP(form->html, "<a href='", CTRL_ATTR_CELL(URL), HTML_NO_QUOTE, "' target=_blank");

	cmp	DWORD PTR _ctrl$[ebp], 0
	je	SHORT $L70359
	push	0
	push	-1
	push	OFFSET FLAT:$SG70280
	mov	eax, DWORD PTR _ctrl$[ebp]
	add	eax, 44					; 0000002cH
	push	eax
	call	_dyntab_field_cell
	add	esp, 16					; 00000010H
	mov	DWORD PTR -28+[ebp], eax
	jmp	SHORT $L70360
$L70359:
	mov	DWORD PTR -28+[ebp], 0
$L70360:
	mov	ecx, DWORD PTR -28+[ebp]
	mov	DWORD PTR __c$70278[ebp], ecx
	cmp	DWORD PTR __c$70278[ebp], 0
	je	SHORT $L70361
	mov	edx, DWORD PTR __c$70278[ebp]
	mov	eax, DWORD PTR [edx+4]
	mov	DWORD PTR -32+[ebp], eax
	jmp	SHORT $L70362
$L70361:
	mov	DWORD PTR -32+[ebp], 0
$L70362:
	cmp	DWORD PTR __c$70278[ebp], 0
	je	SHORT $L70363
	mov	ecx, DWORD PTR __c$70278[ebp]
	mov	edx, DWORD PTR [ecx]
	mov	DWORD PTR -36+[ebp], edx
	jmp	SHORT $L70364
$L70363:
	mov	DWORD PTR -36+[ebp], 0
$L70364:
	push	15					; 0000000fH
	push	OFFSET FLAT:$SG70283
	push	1
	push	OFFSET FLAT:_no_quote
	mov	eax, DWORD PTR -32+[ebp]
	push	eax
	mov	ecx, DWORD PTR -36+[ebp]
	push	ecx
	push	9
	push	OFFSET FLAT:$SG70284
	mov	edx, DWORD PTR _form$[ebp]
	mov	eax, DWORD PTR [edx+232]
	push	eax
	call	_dynbuf_add3
	add	esp, 36					; 00000024H
	test	eax, eax
	je	SHORT $L70282
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29872], OFFSET FLAT:$SG70286
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 86		; 00000056H
	jmp	$eva_err$70277
$L70282:

; 87   : 		if(*ctrl->NOTES)

	mov	eax, DWORD PTR _ctrl$[ebp]
	mov	ecx, DWORD PTR [eax+288]
	movsx	edx, BYTE PTR [ecx]
	test	edx, edx
	je	$L70292

; 88   : 			DYNBUF_ADD3_CELLP(form->html, "title='", CTRL_ATTR_CELL(NOTES), HTML_TOOLTIP, "'");

	cmp	DWORD PTR _ctrl$[ebp], 0
	je	SHORT $L70365
	push	0
	push	-1
	push	OFFSET FLAT:$SG70290
	mov	eax, DWORD PTR _ctrl$[ebp]
	add	eax, 44					; 0000002cH
	push	eax
	call	_dyntab_field_cell
	add	esp, 16					; 00000010H
	mov	DWORD PTR -40+[ebp], eax
	jmp	SHORT $L70366
$L70365:
	mov	DWORD PTR -40+[ebp], 0
$L70366:
	mov	ecx, DWORD PTR -40+[ebp]
	mov	DWORD PTR __c$70288[ebp], ecx
	cmp	DWORD PTR __c$70288[ebp], 0
	je	SHORT $L70367
	mov	edx, DWORD PTR __c$70288[ebp]
	mov	eax, DWORD PTR [edx+4]
	mov	DWORD PTR -44+[ebp], eax
	jmp	SHORT $L70368
$L70367:
	mov	DWORD PTR -44+[ebp], 0
$L70368:
	cmp	DWORD PTR __c$70288[ebp], 0
	je	SHORT $L70369
	mov	ecx, DWORD PTR __c$70288[ebp]
	mov	edx, DWORD PTR [ecx]
	mov	DWORD PTR -48+[ebp], edx
	jmp	SHORT $L70370
$L70369:
	mov	DWORD PTR -48+[ebp], 0
$L70370:
	push	1
	push	OFFSET FLAT:$SG70293
	push	1
	push	OFFSET FLAT:_html_tooltip
	mov	eax, DWORD PTR -44+[ebp]
	push	eax
	mov	ecx, DWORD PTR -48+[ebp]
	push	ecx
	push	7
	push	OFFSET FLAT:$SG70294
	mov	edx, DWORD PTR _form$[ebp]
	mov	eax, DWORD PTR [edx+232]
	push	eax
	call	_dynbuf_add3
	add	esp, 36					; 00000024H
	test	eax, eax
	je	SHORT $L70292
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29872], OFFSET FLAT:$SG70296
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 88		; 00000058H
	jmp	$eva_err$70277
$L70292:

; 89   : 		DYNBUF_ADD3_CELLP(form->html, ">", CTRL_ATTR_CELL(LABEL), TO_HTML, "</a>");

	cmp	DWORD PTR _ctrl$[ebp], 0
	je	SHORT $L70371
	push	0
	push	-1
	push	OFFSET FLAT:$SG70299
	mov	eax, DWORD PTR _ctrl$[ebp]
	add	eax, 44					; 0000002cH
	push	eax
	call	_dyntab_field_cell
	add	esp, 16					; 00000010H
	mov	DWORD PTR -52+[ebp], eax
	jmp	SHORT $L70372
$L70371:
	mov	DWORD PTR -52+[ebp], 0
$L70372:
	mov	ecx, DWORD PTR -52+[ebp]
	mov	DWORD PTR __c$70297[ebp], ecx
	cmp	DWORD PTR __c$70297[ebp], 0
	je	SHORT $L70373
	mov	edx, DWORD PTR __c$70297[ebp]
	mov	eax, DWORD PTR [edx+4]
	mov	DWORD PTR -56+[ebp], eax
	jmp	SHORT $L70374
$L70373:
	mov	DWORD PTR -56+[ebp], 0
$L70374:
	cmp	DWORD PTR __c$70297[ebp], 0
	je	SHORT $L70375
	mov	ecx, DWORD PTR __c$70297[ebp]
	mov	edx, DWORD PTR [ecx]
	mov	DWORD PTR -60+[ebp], edx
	jmp	SHORT $L70376
$L70375:
	mov	DWORD PTR -60+[ebp], 0
$L70376:
	push	4
	push	OFFSET FLAT:$SG70302
	push	1
	push	OFFSET FLAT:_plain_to_html
	mov	eax, DWORD PTR -56+[ebp]
	push	eax
	mov	ecx, DWORD PTR -60+[ebp]
	push	ecx
	push	1
	push	OFFSET FLAT:$SG70303
	mov	edx, DWORD PTR _form$[ebp]
	mov	eax, DWORD PTR [edx+232]
	push	eax
	call	_dynbuf_add3
	add	esp, 36					; 00000024H
	test	eax, eax
	je	SHORT $L70301
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29872], OFFSET FLAT:$SG70305
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 89		; 00000059H
	jmp	SHORT $eva_err$70277
$L70301:

; 90   : 		if(ctrl_format_pos(cntxt, ctrl, 0)) STACK_ERROR;

	push	0
	mov	eax, DWORD PTR _ctrl$[ebp]
	push	eax
	mov	ecx, DWORD PTR _cntxt$[ebp]
	push	ecx
	call	_ctrl_format_pos
	add	esp, 12					; 0000000cH
	test	eax, eax
	je	SHORT $L70306
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 90		; 0000005aH
	jmp	SHORT $eva_err$70277
$L70306:
$eva_noerr$70308:

; 94   : 
; 95   : 	RETURN_OK_CLEANUP;

	push	0
	push	OFFSET FLAT:$SG70309
	push	OFFSET FLAT:$SG70310
	mov	eax, DWORD PTR _cntxt$[ebp]
	push	eax
	call	_err_clear
	add	esp, 16					; 00000010H
$eva_err$70277:
	mov	ecx, DWORD PTR _cntxt$[ebp]
	cmp	DWORD PTR [ecx+29872], 0
	je	SHORT $L70311
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	eax, DWORD PTR [edx+29900]
	push	eax
	push	OFFSET FLAT:$SG70312
	push	OFFSET FLAT:$SG70313
	mov	ecx, DWORD PTR _cntxt$[ebp]
	push	ecx
	call	_err_add_context
	add	esp, 16					; 00000010H
$L70311:
	mov	edx, DWORD PTR _cntxt$[ebp]
	xor	eax, eax
	cmp	DWORD PTR [edx+29872], 0
	setne	al

; 96   : }

	mov	esp, ebp
	pop	ebp
	ret	0
$L70377:
	DD	$L70272
	DD	$L70306
	DD	$L70306
	DD	$L70306
	DD	$L70275
	DD	$L70306
	DD	$L70275
	DD	$L70275
_ctrl_add_anchor ENDP
_TEXT	ENDS
PUBLIC	_ctrl_add_unknown
_DATA	SEGMENT
$SG70333 DB	'???', 00H
$SG70335 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70339 DB	'D:\Travail\ABI\EVA\V4.0\CGI\Brunix-2016\ctrl_misc.c', 00H
$SG70340 DB	'ctrl_add_unknown', 00H
	ORG $+3
$SG70342 DB	'D:\Travail\ABI\EVA\V4.0\CGI\Brunix-2016\ctrl_misc.c', 00H
$SG70343 DB	'ctrl_add_unknown', 00H
_DATA	ENDS
_TEXT	SEGMENT
_cntxt$ = 8
_i_ctrl$ = 12
_form$ = -4
_ctrl$ = -8
_ctrl_add_unknown PROC NEAR

; 109  : ){

	push	ebp
	mov	ebp, esp
	sub	esp, 12					; 0000000cH

; 110  : 	EVA_form *form = cntxt->form;

	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	ecx, DWORD PTR [eax+80]
	mov	DWORD PTR _form$[ebp], ecx

; 111  : 	EVA_ctrl *ctrl = form->ctrl + i_ctrl;

	mov	edx, DWORD PTR _i_ctrl$[ebp]
	imul	edx, 480				; 000001e0H
	mov	eax, DWORD PTR _form$[ebp]
	mov	ecx, DWORD PTR [eax]
	add	ecx, edx
	mov	DWORD PTR _ctrl$[ebp], ecx

; 112  : 
; 113  : 	switch(form->step)
; 114  : 	{

	mov	edx, DWORD PTR _form$[ebp]
	mov	eax, DWORD PTR [edx+176]
	mov	DWORD PTR -12+[ebp], eax
	cmp	DWORD PTR -12+[ebp], 4
	je	SHORT $L70328
	cmp	DWORD PTR -12+[ebp], 5
	jle	$L70336
	cmp	DWORD PTR -12+[ebp], 7
	jle	SHORT $L70328
	jmp	$L70336
$L70328:

; 115  : 	case HtmlEdit:
; 116  : 	case HtmlPrint:
; 117  : 	case HtmlView:
; 118  : 		/* Output text */
; 119  : 		if(ctrl_format_pos(cntxt, ctrl, 1)) STACK_ERROR;

	push	1
	mov	ecx, DWORD PTR _ctrl$[ebp]
	push	ecx
	mov	edx, DWORD PTR _cntxt$[ebp]
	push	edx
	call	_ctrl_format_pos
	add	esp, 12					; 0000000cH
	test	eax, eax
	je	SHORT $L70329
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 119		; 00000077H
	jmp	SHORT $eva_err$70330
$L70329:

; 120  : 		DYNBUF_ADD_STR(form->html, "???");

	push	0
	push	0
	push	3
	push	OFFSET FLAT:$SG70333
	mov	ecx, DWORD PTR _form$[ebp]
	mov	edx, DWORD PTR [ecx+232]
	push	edx
	call	_dynbuf_add
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L70332
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29872], OFFSET FLAT:$SG70335
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 120		; 00000078H
	jmp	SHORT $eva_err$70330
$L70332:

; 121  : 		if(ctrl_format_pos(cntxt, ctrl, 0)) STACK_ERROR;

	push	0
	mov	edx, DWORD PTR _ctrl$[ebp]
	push	edx
	mov	eax, DWORD PTR _cntxt$[ebp]
	push	eax
	call	_ctrl_format_pos
	add	esp, 12					; 0000000cH
	test	eax, eax
	je	SHORT $L70336
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 121		; 00000079H
	jmp	SHORT $eva_err$70330
$L70336:
$eva_noerr$70338:

; 125  : 
; 126  : 	RETURN_OK_CLEANUP;

	push	0
	push	OFFSET FLAT:$SG70339
	push	OFFSET FLAT:$SG70340
	mov	edx, DWORD PTR _cntxt$[ebp]
	push	edx
	call	_err_clear
	add	esp, 16					; 00000010H
$eva_err$70330:
	mov	eax, DWORD PTR _cntxt$[ebp]
	cmp	DWORD PTR [eax+29872], 0
	je	SHORT $L70341
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	edx, DWORD PTR [ecx+29900]
	push	edx
	push	OFFSET FLAT:$SG70342
	push	OFFSET FLAT:$SG70343
	mov	eax, DWORD PTR _cntxt$[ebp]
	push	eax
	call	_err_add_context
	add	esp, 16					; 00000010H
$L70341:
	mov	ecx, DWORD PTR _cntxt$[ebp]
	xor	eax, eax
	cmp	DWORD PTR [ecx+29872], 0
	setne	al

; 127  : }

	mov	esp, ebp
	pop	ebp
	ret	0
_ctrl_add_unknown ENDP
_TEXT	ENDS
END
