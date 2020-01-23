	TITLE	D:\Travail\ABI\EVA\V4.0\CGI\Brunix-2016\ctrl_input_basic.c
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
PUBLIC	_ctrl_autofocus
EXTRN	_cgi_parse_name:NEAR
EXTRN	_strtoul:NEAR
EXTRN	_dynbuf_add:NEAR
EXTRN	_dyntab_val:NEAR
EXTRN	_strcmp:NEAR
EXTRN	_err_add_context:NEAR
EXTRN	_err_clear:NEAR
EXTRN	_dyntab_field_val:NEAR
_BSS	SEGMENT
$SG70225 DB	01H DUP (?)
	ALIGN	4

$SG70227 DB	01H DUP (?)
	ALIGN	4

$SG70228 DB	01H DUP (?)
_BSS	ENDS
_DATA	SEGMENT
$SG70224 DB	'_EVA_NO_AUTOFOCUS', 00H
	ORG $+2
$SG70233 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70234 DB	'D:\Travail\ABI\EVA\V4.0\CGI\Brunix-2016\ctrl_input_basic'
	DB	'.c', 00H
	ORG $+1
$SG70235 DB	'ctrl_autofocus', 00H
	ORG $+1
$SG70237 DB	'D:\Travail\ABI\EVA\V4.0\CGI\Brunix-2016\ctrl_input_basic'
	DB	'.c', 00H
	ORG $+1
$SG70238 DB	'ctrl_autofocus', 00H
_DATA	ENDS
_TEXT	SEGMENT
_cntxt$ = 8
_name$ = 12
_sz_name$ = 16
_b_empty$ = 20
_focus$ = -4
_cgi$ = -8
_fcgi$ = -64
_ctrl$70220 = -68
_ctrl_autofocus PROC NEAR

; 26   : ){

	push	ebp
	mov	ebp, esp
	sub	esp, 96					; 00000060H
	push	edi

; 27   : 	DynBuffer **focus;
; 28   : 	CGIData *cgi = cntxt->cgi ? cntxt->cgi + cntxt->cgibtn : NULL, fcgi = {0};

	mov	eax, DWORD PTR _cntxt$[ebp]
	cmp	DWORD PTR [eax+29648], 0
	je	SHORT $L70733
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	edx, DWORD PTR [ecx+29656]
	imul	edx, 56					; 00000038H
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	ecx, DWORD PTR [eax+29648]
	add	ecx, edx
	mov	DWORD PTR -72+[ebp], ecx
	jmp	SHORT $L70734
$L70733:
	mov	DWORD PTR -72+[ebp], 0
$L70734:
	mov	edx, DWORD PTR -72+[ebp]
	mov	DWORD PTR _cgi$[ebp], edx
	mov	DWORD PTR _fcgi$[ebp], 0
	mov	ecx, 13					; 0000000dH
	xor	eax, eax
	lea	edi, DWORD PTR _fcgi$[ebp+4]
	rep stosd

; 29   : 
; 30   : 	/* Parse given input name (not very efficient - would be better to pass ctrl as param) */
; 31   : 	fcgi.name = name;

	mov	eax, DWORD PTR _name$[ebp]
	mov	DWORD PTR _fcgi$[ebp], eax

; 32   : 	fcgi.name_sz = sz_name;

	mov	ecx, DWORD PTR _sz_name$[ebp]
	mov	DWORD PTR _fcgi$[ebp+4], ecx

; 33   : 	if(cgi && cgi_parse_name(cntxt, &fcgi)) STACK_ERROR;

	cmp	DWORD PTR _cgi$[ebp], 0
	je	SHORT $L70217
	lea	edx, DWORD PTR _fcgi$[ebp]
	push	edx
	mov	eax, DWORD PTR _cntxt$[ebp]
	push	eax
	call	_cgi_parse_name
	add	esp, 8
	test	eax, eax
	je	SHORT $L70217
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 33		; 00000021H
	jmp	$eva_err$70218
$L70217:

; 34   : 
; 35   : 	/* Return if autofocus disabled for control */
; 36   : 	if(fcgi.IdCtrl)

	cmp	DWORD PTR _fcgi$[ebp+16], 0
	je	$L70223

; 38   : 		EVA_ctrl *ctrl = cntxt->form ? (cntxt->form->ctrl + cntxt->form->i_ctrl) : NULL;

	mov	edx, DWORD PTR _cntxt$[ebp]
	cmp	DWORD PTR [edx+80], 0
	je	SHORT $L70735
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	ecx, DWORD PTR [eax+80]
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	eax, DWORD PTR [edx+80]
	mov	edx, DWORD PTR [eax+8]
	imul	edx, 480				; 000001e0H
	mov	eax, DWORD PTR [ecx]
	add	eax, edx
	mov	DWORD PTR -76+[ebp], eax
	jmp	SHORT $L70736
$L70735:
	mov	DWORD PTR -76+[ebp], 0
$L70736:
	mov	ecx, DWORD PTR -76+[ebp]
	mov	DWORD PTR _ctrl$70220[ebp], ecx

; 39   : 		if(fcgi.IdCtrl == DYNTAB_TOUL(&ctrl->id) && *CTRL_ATTR_VAL(NO_AUTOFOCUS)) RETURN_OK;

	push	10					; 0000000aH
	push	0
	push	0
	push	0
	mov	edx, DWORD PTR _ctrl$70220[ebp]
	push	edx
	call	_dyntab_val
	add	esp, 12					; 0000000cH
	push	eax
	call	_strtoul
	add	esp, 12					; 0000000cH
	cmp	DWORD PTR _fcgi$[ebp+16], eax
	jne	SHORT $L70223
	cmp	DWORD PTR _ctrl$70220[ebp], 0
	je	SHORT $L70737
	push	0
	push	-1
	push	OFFSET FLAT:$SG70224
	mov	eax, DWORD PTR _ctrl$70220[ebp]
	add	eax, 44					; 0000002cH
	push	eax
	call	_dyntab_field_val
	add	esp, 16					; 00000010H
	mov	DWORD PTR -80+[ebp], eax
	jmp	SHORT $L70738
$L70737:
	mov	DWORD PTR -80+[ebp], OFFSET FLAT:$SG70225
$L70738:
	mov	ecx, DWORD PTR -80+[ebp]
	movsx	edx, BYTE PTR [ecx]
	test	edx, edx
	je	SHORT $L70223
	jmp	$eva_noerr$70226
$L70223:

; 41   : 
; 42   : 	/* Handle setfocus */
; 43   : 	focus = (cgi && cgi->IdForm == fcgi.IdForm && cgi->IdObj == fcgi.IdObj && !STRCMPNUL(cgi->field, fcgi.field)) ?
; 44   : 				&cntxt->focus1 : b_empty ? &cntxt->focus2 : &cntxt->focus3;

	cmp	DWORD PTR _cgi$[ebp], 0
	je	SHORT $L70739
	mov	eax, DWORD PTR _cgi$[ebp]
	mov	ecx, DWORD PTR [eax+20]
	cmp	ecx, DWORD PTR _fcgi$[ebp+20]
	jne	SHORT $L70739
	mov	edx, DWORD PTR _cgi$[ebp]
	mov	eax, DWORD PTR [edx+24]
	cmp	eax, DWORD PTR _fcgi$[ebp+24]
	jne	SHORT $L70739
	cmp	DWORD PTR _fcgi$[ebp+28], 0
	je	SHORT $L70740
	mov	ecx, DWORD PTR _fcgi$[ebp+28]
	mov	DWORD PTR -84+[ebp], ecx
	jmp	SHORT $L70741
$L70740:
	mov	DWORD PTR -84+[ebp], OFFSET FLAT:$SG70227
$L70741:
	mov	edx, DWORD PTR _cgi$[ebp]
	cmp	DWORD PTR [edx+28], 0
	je	SHORT $L70742
	mov	eax, DWORD PTR _cgi$[ebp]
	mov	ecx, DWORD PTR [eax+28]
	mov	DWORD PTR -88+[ebp], ecx
	jmp	SHORT $L70743
$L70742:
	mov	DWORD PTR -88+[ebp], OFFSET FLAT:$SG70228
$L70743:
	mov	edx, DWORD PTR -84+[ebp]
	push	edx
	mov	eax, DWORD PTR -88+[ebp]
	push	eax
	call	_strcmp
	add	esp, 8
	test	eax, eax
	jne	SHORT $L70739
	mov	ecx, DWORD PTR _cntxt$[ebp]
	add	ecx, 84					; 00000054H
	mov	DWORD PTR -92+[ebp], ecx
	jmp	SHORT $L70746
$L70739:
	cmp	DWORD PTR _b_empty$[ebp], 0
	je	SHORT $L70744
	mov	edx, DWORD PTR _cntxt$[ebp]
	add	edx, 88					; 00000058H
	mov	DWORD PTR -96+[ebp], edx
	jmp	SHORT $L70745
$L70744:
	mov	eax, DWORD PTR _cntxt$[ebp]
	add	eax, 92					; 0000005cH
	mov	DWORD PTR -96+[ebp], eax
$L70745:
	mov	ecx, DWORD PTR -96+[ebp]
	mov	DWORD PTR -92+[ebp], ecx
$L70746:
	mov	edx, DWORD PTR -92+[ebp]
	mov	DWORD PTR _focus$[ebp], edx

; 45   : 	if(!*focus) DYNBUF_ADD(focus, name, sz_name, NO_CONV);

	mov	eax, DWORD PTR _focus$[ebp]
	cmp	DWORD PTR [eax], 0
	jne	SHORT $L70231
	push	0
	push	0
	mov	ecx, DWORD PTR _sz_name$[ebp]
	push	ecx
	mov	edx, DWORD PTR _name$[ebp]
	push	edx
	mov	eax, DWORD PTR _focus$[ebp]
	push	eax
	call	_dynbuf_add
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L70231
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29872], OFFSET FLAT:$SG70233
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 45		; 0000002dH
	jmp	SHORT $eva_err$70218
$L70231:
$eva_noerr$70226:

; 46   : 
; 47   : 	RETURN_OK_CLEANUP;

	push	0
	push	OFFSET FLAT:$SG70234
	push	OFFSET FLAT:$SG70235
	mov	eax, DWORD PTR _cntxt$[ebp]
	push	eax
	call	_err_clear
	add	esp, 16					; 00000010H
$eva_err$70218:
	mov	ecx, DWORD PTR _cntxt$[ebp]
	cmp	DWORD PTR [ecx+29872], 0
	je	SHORT $L70236
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	eax, DWORD PTR [edx+29900]
	push	eax
	push	OFFSET FLAT:$SG70237
	push	OFFSET FLAT:$SG70238
	mov	ecx, DWORD PTR _cntxt$[ebp]
	push	ecx
	call	_err_add_context
	add	esp, 16					; 00000010H
$L70236:
	mov	edx, DWORD PTR _cntxt$[ebp]
	xor	eax, eax
	cmp	DWORD PTR [edx+29872], 0
	setne	al

; 48   : }

	pop	edi
	mov	esp, ebp
	pop	ebp
	ret	0
_ctrl_autofocus ENDP
_TEXT	ENDS
PUBLIC	_put_html_text_input
EXTRN	_plain_to_xml:BYTE
EXTRN	_no_quote:BYTE
EXTRN	_dynbuf_add3:NEAR
EXTRN	_dynbuf_add3_int:NEAR
_BSS	SEGMENT
	ALIGN	4

$SG70302 DB	01H DUP (?)
	ALIGN	4

$SG70308 DB	01H DUP (?)
	ALIGN	4

$SG70332 DB	01H DUP (?)
	ALIGN	4

$SG70338 DB	01H DUP (?)
_BSS	ENDS
_DATA	SEGMENT
	ORG $+1
$SG70272 DB	'<input type=password', 00H
	ORG $+3
$SG70274 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70279 DB	'<input type=text', 00H
	ORG $+3
$SG70281 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70284 DB	'''', 00H
	ORG $+2
$SG70285 DB	' name=''', 00H
$SG70287 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70291 DB	' onClick=scwShow(this,this)', 00H
$SG70293 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70296 DB	'''', 00H
	ORG $+2
$SG70297 DB	' value=''', 00H
	ORG $+3
$SG70299 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70303 DB	' size=', 00H
	ORG $+1
$SG70305 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70309 DB	' maxlength=', 00H
$SG70311 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70314 DB	'>', 00H
	ORG $+2
$SG70316 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70320 DB	'''', 00H
	ORG $+2
$SG70321 DB	'<textarea name=''', 00H
	ORG $+3
$SG70323 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70327 DB	' mce_editable=true', 00H
	ORG $+1
$SG70329 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70333 DB	' rows=', 00H
	ORG $+1
$SG70335 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70339 DB	' cols=', 00H
	ORG $+1
$SG70341 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70344 DB	'>', 00H
	ORG $+2
$SG70346 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70350 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70353 DB	'</textarea>', 00H
$SG70355 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70358 DB	'D:\Travail\ABI\EVA\V4.0\CGI\Brunix-2016\ctrl_input_basic'
	DB	'.c', 00H
	ORG $+1
$SG70359 DB	'put_html_text_input', 00H
$SG70361 DB	'D:\Travail\ABI\EVA\V4.0\CGI\Brunix-2016\ctrl_input_basic'
	DB	'.c', 00H
	ORG $+1
$SG70362 DB	'put_html_text_input', 00H
_DATA	ENDS
_TEXT	SEGMENT
_cntxt$ = 8
_name$ = 12
_sz_name$ = 16
_val$ = 20
_sz_val$ = 24
_b_passwd$ = 28
_mode$ = 32
_lines$ = 36
_columns$ = 40
_maxlength$ = 44
_html$ = -4
_put_html_text_input PROC NEAR

; 68   : ){

	push	ebp
	mov	ebp, esp
	sub	esp, 16					; 00000010H

; 69   : 	CHECK_HTML_STATUS;

	cmp	DWORD PTR _cntxt$[ebp], 0
	je	SHORT $L70750
	mov	eax, DWORD PTR _cntxt$[ebp]
	cmp	DWORD PTR [eax+80], 0
	je	SHORT $L70748
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	edx, DWORD PTR [ecx+80]
	mov	eax, DWORD PTR [edx+232]
	mov	DWORD PTR -8+[ebp], eax
	jmp	SHORT $L70749
$L70748:
	mov	DWORD PTR -8+[ebp], 0
$L70749:
	mov	ecx, DWORD PTR -8+[ebp]
	mov	DWORD PTR -12+[ebp], ecx
	jmp	SHORT $L70751
$L70750:
	mov	DWORD PTR -12+[ebp], 0
$L70751:
	mov	edx, DWORD PTR -12+[ebp]
	mov	DWORD PTR _html$[ebp], edx
	cmp	DWORD PTR _html$[ebp], 0
	jne	SHORT $L70266
	xor	eax, eax
	jmp	$L70262
$L70266:

; 70   : 
; 71   : 	/* Output HTML code for input */
; 72   : 	if(lines <= 1 || b_passwd)

	cmp	DWORD PTR _lines$[ebp], 1
	jle	SHORT $L70268
	cmp	DWORD PTR _b_passwd$[ebp], 0
	je	$L70267
$L70268:

; 74   : 		if(b_passwd) DYNBUF_ADD_STR(html, "<input type=password")

	cmp	DWORD PTR _b_passwd$[ebp], 0
	je	SHORT $L70269
	push	0
	push	0
	push	20					; 00000014H
	push	OFFSET FLAT:$SG70272
	mov	eax, DWORD PTR _html$[ebp]
	push	eax
	call	_dynbuf_add
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L70271
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29872], OFFSET FLAT:$SG70274
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 74		; 0000004aH
	jmp	$eva_err$70275
$L70271:

; 75   : 		else DYNBUF_ADD_STR(html, "<input type=text");

	jmp	SHORT $L70278
$L70269:
	push	0
	push	0
	push	16					; 00000010H
	push	OFFSET FLAT:$SG70279
	mov	eax, DWORD PTR _html$[ebp]
	push	eax
	call	_dynbuf_add
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L70278
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29872], OFFSET FLAT:$SG70281
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 75		; 0000004bH
	jmp	$eva_err$70275
$L70278:

; 76   : 		DYNBUF_ADD3(html, " name='", name, sz_name, NO_CONV, "'");

	push	1
	push	OFFSET FLAT:$SG70284
	push	0
	push	0
	mov	eax, DWORD PTR _sz_name$[ebp]
	push	eax
	mov	ecx, DWORD PTR _name$[ebp]
	push	ecx
	push	7
	push	OFFSET FLAT:$SG70285
	mov	edx, DWORD PTR _html$[ebp]
	push	edx
	call	_dynbuf_add3
	add	esp, 36					; 00000024H
	test	eax, eax
	je	SHORT $L70283
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29872], OFFSET FLAT:$SG70287
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 76		; 0000004cH
	jmp	$eva_err$70275
$L70283:

; 77   : 		if(mode & 4 && cntxt->jsenabled)

	mov	edx, DWORD PTR _mode$[ebp]
	and	edx, 4
	test	edx, edx
	je	SHORT $L70290
	mov	eax, DWORD PTR _cntxt$[ebp]
	cmp	DWORD PTR [eax+29676], 0
	je	SHORT $L70290

; 79   : 			cntxt->jsCalendarInput = 1;

	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29684], 1

; 80   : 			DYNBUF_ADD_STR(html, " onClick=scwShow(this,this)");

	push	0
	push	0
	push	27					; 0000001bH
	push	OFFSET FLAT:$SG70291
	mov	edx, DWORD PTR _html$[ebp]
	push	edx
	call	_dynbuf_add
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L70290
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29872], OFFSET FLAT:$SG70293
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 80		; 00000050H
	jmp	$eva_err$70275
$L70290:

; 82   : 		if(val && *val) DYNBUF_ADD3(html, " value='", val, sz_val, HTML_NO_QUOTE, "'");

	cmp	DWORD PTR _val$[ebp], 0
	je	SHORT $L70295
	mov	edx, DWORD PTR _val$[ebp]
	movsx	eax, BYTE PTR [edx]
	test	eax, eax
	je	SHORT $L70295
	push	1
	push	OFFSET FLAT:$SG70296
	push	1
	push	OFFSET FLAT:_no_quote
	mov	ecx, DWORD PTR _sz_val$[ebp]
	push	ecx
	mov	edx, DWORD PTR _val$[ebp]
	push	edx
	push	8
	push	OFFSET FLAT:$SG70297
	mov	eax, DWORD PTR _html$[ebp]
	push	eax
	call	_dynbuf_add3
	add	esp, 36					; 00000024H
	test	eax, eax
	je	SHORT $L70295
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29872], OFFSET FLAT:$SG70299
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 82		; 00000052H
	jmp	$eva_err$70275
$L70295:

; 83   : 		if(columns > 0)DYNBUF_ADD3_INT(html, " size=", columns, "");

	cmp	DWORD PTR _columns$[ebp], 0
	jle	SHORT $L70301
	push	0
	push	OFFSET FLAT:$SG70302
	mov	eax, DWORD PTR _columns$[ebp]
	push	eax
	push	6
	push	OFFSET FLAT:$SG70303
	mov	ecx, DWORD PTR _html$[ebp]
	push	ecx
	call	_dynbuf_add3_int
	add	esp, 24					; 00000018H
	test	eax, eax
	je	SHORT $L70301
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29872], OFFSET FLAT:$SG70305
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 83		; 00000053H
	jmp	$eva_err$70275
$L70301:

; 84   : 		if(maxlength > 0) DYNBUF_ADD3_INT(html, " maxlength=", maxlength, "");

	cmp	DWORD PTR _maxlength$[ebp], 0
	jle	SHORT $L70307
	push	0
	push	OFFSET FLAT:$SG70308
	mov	ecx, DWORD PTR _maxlength$[ebp]
	push	ecx
	push	11					; 0000000bH
	push	OFFSET FLAT:$SG70309
	mov	edx, DWORD PTR _html$[ebp]
	push	edx
	call	_dynbuf_add3_int
	add	esp, 24					; 00000018H
	test	eax, eax
	je	SHORT $L70307
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29872], OFFSET FLAT:$SG70311
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 84		; 00000054H
	jmp	$eva_err$70275
$L70307:

; 85   : 		DYNBUF_ADD_STR(html, ">");

	push	0
	push	0
	push	1
	push	OFFSET FLAT:$SG70314
	mov	edx, DWORD PTR _html$[ebp]
	push	edx
	call	_dynbuf_add
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L70313
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29872], OFFSET FLAT:$SG70316
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 85		; 00000055H
	jmp	$eva_err$70275
$L70313:

; 87   : 	else

	jmp	$L70352
$L70267:

; 89   : 		DYNBUF_ADD3(html, "<textarea name='", name, sz_name, NO_CONV, "'");

	push	1
	push	OFFSET FLAT:$SG70320
	push	0
	push	0
	mov	edx, DWORD PTR _sz_name$[ebp]
	push	edx
	mov	eax, DWORD PTR _name$[ebp]
	push	eax
	push	16					; 00000010H
	push	OFFSET FLAT:$SG70321
	mov	ecx, DWORD PTR _html$[ebp]
	push	ecx
	call	_dynbuf_add3
	add	esp, 36					; 00000024H
	test	eax, eax
	je	SHORT $L70319
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29872], OFFSET FLAT:$SG70323
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 89		; 00000059H
	jmp	$eva_err$70275
$L70319:

; 90   : 		if(mode & 3 && cntxt->jsenabled)

	mov	ecx, DWORD PTR _mode$[ebp]
	and	ecx, 3
	test	ecx, ecx
	je	SHORT $L70326
	mov	edx, DWORD PTR _cntxt$[ebp]
	cmp	DWORD PTR [edx+29676], 0
	je	SHORT $L70326

; 92   : 			cntxt->jsHTMLEditor = mode & 3;

	mov	eax, DWORD PTR _mode$[ebp]
	and	eax, 3
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29680], eax

; 93   : 			DYNBUF_ADD_STR(html, " mce_editable=true");

	push	0
	push	0
	push	18					; 00000012H
	push	OFFSET FLAT:$SG70327
	mov	edx, DWORD PTR _html$[ebp]
	push	edx
	call	_dynbuf_add
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L70326
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29872], OFFSET FLAT:$SG70329
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 93		; 0000005dH
	jmp	$eva_err$70275
$L70326:

; 95   : 		if(lines > 0) DYNBUF_ADD3_INT(html, " rows=", lines, "");

	cmp	DWORD PTR _lines$[ebp], 0
	jle	SHORT $L70331
	push	0
	push	OFFSET FLAT:$SG70332
	mov	edx, DWORD PTR _lines$[ebp]
	push	edx
	push	6
	push	OFFSET FLAT:$SG70333
	mov	eax, DWORD PTR _html$[ebp]
	push	eax
	call	_dynbuf_add3_int
	add	esp, 24					; 00000018H
	test	eax, eax
	je	SHORT $L70331
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29872], OFFSET FLAT:$SG70335
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 95		; 0000005fH
	jmp	$eva_err$70275
$L70331:

; 96   : 		if(columns > 0) DYNBUF_ADD3_INT(html, " cols=", columns, "");

	cmp	DWORD PTR _columns$[ebp], 0
	jle	SHORT $L70337
	push	0
	push	OFFSET FLAT:$SG70338
	mov	eax, DWORD PTR _columns$[ebp]
	push	eax
	push	6
	push	OFFSET FLAT:$SG70339
	mov	ecx, DWORD PTR _html$[ebp]
	push	ecx
	call	_dynbuf_add3_int
	add	esp, 24					; 00000018H
	test	eax, eax
	je	SHORT $L70337
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29872], OFFSET FLAT:$SG70341
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 96		; 00000060H
	jmp	$eva_err$70275
$L70337:

; 97   : 		DYNBUF_ADD_STR(html, ">");

	push	0
	push	0
	push	1
	push	OFFSET FLAT:$SG70344
	mov	ecx, DWORD PTR _html$[ebp]
	push	ecx
	call	_dynbuf_add
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L70343
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29872], OFFSET FLAT:$SG70346
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 97		; 00000061H
	jmp	$eva_err$70275
$L70343:

; 98   : 		if(val && *val) DYNBUF_ADD(html, val, sz_val, TO_XML);

	cmp	DWORD PTR _val$[ebp], 0
	je	SHORT $L70348
	mov	ecx, DWORD PTR _val$[ebp]
	movsx	edx, BYTE PTR [ecx]
	test	edx, edx
	je	SHORT $L70348
	push	1
	push	OFFSET FLAT:_plain_to_xml
	mov	eax, DWORD PTR _sz_val$[ebp]
	push	eax
	mov	ecx, DWORD PTR _val$[ebp]
	push	ecx
	mov	edx, DWORD PTR _html$[ebp]
	push	edx
	call	_dynbuf_add
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L70348
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29872], OFFSET FLAT:$SG70350
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 98		; 00000062H
	jmp	$eva_err$70275
$L70348:

; 99   : 		DYNBUF_ADD_STR(html, "</textarea>");

	push	0
	push	0
	push	11					; 0000000bH
	push	OFFSET FLAT:$SG70353
	mov	edx, DWORD PTR _html$[ebp]
	push	edx
	call	_dynbuf_add
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L70352
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29872], OFFSET FLAT:$SG70355
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 99		; 00000063H
	jmp	SHORT $eva_err$70275
$L70352:

; 101  : 
; 102  : 	if(ctrl_autofocus(cntxt, name, sz_name, !val || !*val || !sz_val)) STACK_ERROR;

	cmp	DWORD PTR _val$[ebp], 0
	je	SHORT $L70752
	mov	edx, DWORD PTR _val$[ebp]
	movsx	eax, BYTE PTR [edx]
	test	eax, eax
	je	SHORT $L70752
	cmp	DWORD PTR _sz_val$[ebp], 0
	je	SHORT $L70752
	mov	DWORD PTR -16+[ebp], 0
	jmp	SHORT $L70753
$L70752:
	mov	DWORD PTR -16+[ebp], 1
$L70753:
	mov	ecx, DWORD PTR -16+[ebp]
	push	ecx
	mov	edx, DWORD PTR _sz_name$[ebp]
	push	edx
	mov	eax, DWORD PTR _name$[ebp]
	push	eax
	mov	ecx, DWORD PTR _cntxt$[ebp]
	push	ecx
	call	_ctrl_autofocus
	add	esp, 16					; 00000010H
	test	eax, eax
	je	SHORT $eva_noerr$70357
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 102		; 00000066H
	jmp	SHORT $eva_err$70275
$eva_noerr$70357:

; 103  : 
; 104  : 	RETURN_OK_CLEANUP;

	push	0
	push	OFFSET FLAT:$SG70358
	push	OFFSET FLAT:$SG70359
	mov	eax, DWORD PTR _cntxt$[ebp]
	push	eax
	call	_err_clear
	add	esp, 16					; 00000010H
$eva_err$70275:
	mov	ecx, DWORD PTR _cntxt$[ebp]
	cmp	DWORD PTR [ecx+29872], 0
	je	SHORT $L70360
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	eax, DWORD PTR [edx+29900]
	push	eax
	push	OFFSET FLAT:$SG70361
	push	OFFSET FLAT:$SG70362
	mov	ecx, DWORD PTR _cntxt$[ebp]
	push	ecx
	call	_err_add_context
	add	esp, 16					; 00000010H
$L70360:
	mov	edx, DWORD PTR _cntxt$[ebp]
	xor	eax, eax
	cmp	DWORD PTR [edx+29872], 0
	setne	al
$L70262:

; 105  : }

	mov	esp, ebp
	pop	ebp
	ret	0
_put_html_text_input ENDP
_TEXT	ENDS
PUBLIC	_ctrl_add_text_value
EXTRN	_atoi:NEAR
EXTRN	_mem_free:NEAR
EXTRN	_plain_to_html:BYTE
EXTRN	_ctrl_cgi_name:NEAR
EXTRN	_dyntab_cell:NEAR
EXTRN	_ctrl_put_hidden_old:NEAR
EXTRN	_dyntab_field_cell:NEAR
_BSS	SEGMENT
	ALIGN	4

$SG70388 DB	01H DUP (?)
	ALIGN	4

$SG70399 DB	01H DUP (?)
	ALIGN	4

$SG70403 DB	01H DUP (?)
	ALIGN	4

$SG70407 DB	01H DUP (?)
	ALIGN	4

$SG70428 DB	01H DUP (?)
_BSS	ENDS
_DATA	SEGMENT
$SG70384 DB	'_EVA_LABELUNIT', 00H
	ORG $+1
$SG70387 DB	'_EVA_HTML_EDITOR', 00H
	ORG $+3
$SG70398 DB	'_EVA_MAXLENGTH', 00H
	ORG $+1
$SG70400 DB	'_EVA_SIMPLE', 00H
$SG70401 DB	'_EVA_NORMAL', 00H
$SG70402 DB	'_EVA_PASSWORD', 00H
	ORG $+2
$SG70406 DB	'_EVA_PASSWORD', 00H
	ORG $+2
$SG70410 DB	'******', 00H
	ORG $+1
$SG70412 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70418 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70422 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70429 DB	' ', 00H
	ORG $+2
$SG70431 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70433 DB	'D:\Travail\ABI\EVA\V4.0\CGI\Brunix-2016\ctrl_input_basic'
	DB	'.c', 00H
	ORG $+1
$SG70434 DB	'ctrl_add_text_value', 00H
$SG70436 DB	'D:\Travail\ABI\EVA\V4.0\CGI\Brunix-2016\ctrl_input_basic'
	DB	'.c', 00H
	ORG $+1
$SG70437 DB	'ctrl_add_text_value', 00H
_DATA	ENDS
_TEXT	SEGMENT
_cntxt$ = 8
_ctrl$ = 12
_i_val$ = 16
_txt$ = 20
_len$ = 24
_name1$ = 28
_form$ = -8
_name$ = -20
_lblunit$ = -12
_val$ = -4
_editmode$ = -16
__c$70425 = -24
_ctrl_add_text_value PROC NEAR

; 121  : ){

	push	ebp
	mov	ebp, esp
	sub	esp, 68					; 00000044H

; 122  : 	EVA_form *form = cntxt->form;

	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	ecx, DWORD PTR [eax+80]
	mov	DWORD PTR _form$[ebp], ecx

; 123  : 	DynBuffer *name = name1 ? name1 : NULL;

	mov	edx, DWORD PTR _name1$[ebp]
	neg	edx
	sbb	edx, edx
	and	edx, DWORD PTR _name1$[ebp]
	mov	DWORD PTR _name$[ebp], edx

; 124  : 	DynTableCell *lblunit = CTRL_ATTR_CELL(LABELUNIT);

	cmp	DWORD PTR _ctrl$[ebp], 0
	je	SHORT $L70755
	push	0
	push	-1
	push	OFFSET FLAT:$SG70384
	mov	eax, DWORD PTR _ctrl$[ebp]
	add	eax, 44					; 0000002cH
	push	eax
	call	_dyntab_field_cell
	add	esp, 16					; 00000010H
	mov	DWORD PTR -28+[ebp], eax
	jmp	SHORT $L70756
$L70755:
	mov	DWORD PTR -28+[ebp], 0
$L70756:
	mov	ecx, DWORD PTR -28+[ebp]
	mov	DWORD PTR _lblunit$[ebp], ecx

; 125  : 	DynTableCell *val = dyntab_cell(&ctrl->val, i_val, 0);

	push	0
	mov	edx, DWORD PTR _i_val$[ebp]
	push	edx
	mov	eax, DWORD PTR _ctrl$[ebp]
	add	eax, 64					; 00000040H
	push	eax
	call	_dyntab_cell
	add	esp, 12					; 0000000cH
	mov	DWORD PTR _val$[ebp], eax

; 126  : 	char *editmode = CTRL_ATTR_VAL(HTML_EDITOR);

	cmp	DWORD PTR _ctrl$[ebp], 0
	je	SHORT $L70757
	push	0
	push	-1
	push	OFFSET FLAT:$SG70387
	mov	ecx, DWORD PTR _ctrl$[ebp]
	add	ecx, 44					; 0000002cH
	push	ecx
	call	_dyntab_field_val
	add	esp, 16					; 00000010H
	mov	DWORD PTR -32+[ebp], eax
	jmp	SHORT $L70758
$L70757:
	mov	DWORD PTR -32+[ebp], OFFSET FLAT:$SG70388
$L70758:
	mov	edx, DWORD PTR -32+[ebp]
	mov	DWORD PTR _editmode$[ebp], edx

; 127  : 
; 128  : 	/* Set text if not given */
; 129  : 	if(!txt && val)

	cmp	DWORD PTR _txt$[ebp], 0
	jne	SHORT $L70389
	cmp	DWORD PTR _val$[ebp], 0
	je	SHORT $L70389

; 131  : 		txt = val->txt;

	mov	eax, DWORD PTR _val$[ebp]
	mov	ecx, DWORD PTR [eax]
	mov	DWORD PTR _txt$[ebp], ecx

; 132  : 		len = val->len;

	mov	edx, DWORD PTR _val$[ebp]
	mov	eax, DWORD PTR [edx+4]
	mov	DWORD PTR _len$[ebp], eax
$L70389:

; 134  : 
; 135  : 	/* If edit mode : add HTML text input */
; 136  : 	if(form->step == HtmlEdit)

	mov	ecx, DWORD PTR _form$[ebp]
	cmp	DWORD PTR [ecx+176], 4
	jne	$L70390

; 138  : 		if(!name) CTRL_CGINAMEVAL(&name, i_val);

	cmp	DWORD PTR _name$[ebp], 0
	jne	SHORT $L70391
	push	0
	push	0
	push	0
	lea	edx, DWORD PTR _name$[ebp]
	push	edx
	push	1
	push	0
	mov	eax, DWORD PTR _i_val$[ebp]
	push	eax
	mov	ecx, DWORD PTR _ctrl$[ebp]
	add	ecx, 64					; 00000040H
	push	ecx
	call	_dyntab_cell
	add	esp, 12					; 0000000cH
	push	eax
	mov	edx, DWORD PTR _ctrl$[ebp]
	push	edx
	mov	eax, DWORD PTR _cntxt$[ebp]
	push	eax
	call	_ctrl_cgi_name
	add	esp, 32					; 00000020H
	test	eax, eax
	je	SHORT $L70393
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 138		; 0000008aH
	jmp	$eva_err$70394
$L70393:
	mov	edx, DWORD PTR _ctrl$[ebp]
	mov	DWORD PTR [edx+196], 1
$L70391:

; 139  : 		if(put_html_text_input(cntxt,
; 140  : 				DYNBUF_VAL_SZ(name),
; 141  : 				txt, len,
; 142  : 				CTRL_ATTR_VAL(PASSWORD)[0] == '1',
; 143  : 				!*editmode ? 0 : !strcmp(editmode, "_EVA_SIMPLE") ? 1 : !strcmp(editmode, "_EVA_NORMAL") ? 2 : 3,
; 144  : 				ctrl->LINES,
; 145  : 				ctrl->COLUMNS,
; 146  : 				atoi(CTRL_ATTR_VAL(MAXLENGTH))) ||
; 147  : 			ctrl_put_hidden_old(cntxt, ctrl, i_val, name, txt, len))

	cmp	DWORD PTR _ctrl$[ebp], 0
	je	SHORT $L70759
	push	0
	push	-1
	push	OFFSET FLAT:$SG70398
	mov	eax, DWORD PTR _ctrl$[ebp]
	add	eax, 44					; 0000002cH
	push	eax
	call	_dyntab_field_val
	add	esp, 16					; 00000010H
	mov	DWORD PTR -36+[ebp], eax
	jmp	SHORT $L70760
$L70759:
	mov	DWORD PTR -36+[ebp], OFFSET FLAT:$SG70399
$L70760:
	mov	ecx, DWORD PTR _editmode$[ebp]
	movsx	edx, BYTE PTR [ecx]
	test	edx, edx
	jne	SHORT $L70763
	mov	DWORD PTR -40+[ebp], 0
	jmp	SHORT $L70764
$L70763:
	push	OFFSET FLAT:$SG70400
	mov	eax, DWORD PTR _editmode$[ebp]
	push	eax
	call	_strcmp
	add	esp, 8
	test	eax, eax
	jne	SHORT $L70761
	mov	DWORD PTR -44+[ebp], 1
	jmp	SHORT $L70762
$L70761:
	push	OFFSET FLAT:$SG70401
	mov	ecx, DWORD PTR _editmode$[ebp]
	push	ecx
	call	_strcmp
	add	esp, 8
	neg	eax
	sbb	eax, eax
	neg	eax
	add	eax, 2
	mov	DWORD PTR -44+[ebp], eax
$L70762:
	mov	edx, DWORD PTR -44+[ebp]
	mov	DWORD PTR -40+[ebp], edx
$L70764:
	cmp	DWORD PTR _ctrl$[ebp], 0
	je	SHORT $L70765
	push	0
	push	-1
	push	OFFSET FLAT:$SG70402
	mov	eax, DWORD PTR _ctrl$[ebp]
	add	eax, 44					; 0000002cH
	push	eax
	call	_dyntab_field_val
	add	esp, 16					; 00000010H
	mov	DWORD PTR -48+[ebp], eax
	jmp	SHORT $L70766
$L70765:
	mov	DWORD PTR -48+[ebp], OFFSET FLAT:$SG70403
$L70766:
	cmp	DWORD PTR _name$[ebp], 0
	je	SHORT $L70767
	mov	ecx, DWORD PTR _name$[ebp]
	mov	edx, DWORD PTR [ecx+4]
	mov	DWORD PTR -52+[ebp], edx
	jmp	SHORT $L70768
$L70767:
	mov	DWORD PTR -52+[ebp], 0
$L70768:
	cmp	DWORD PTR _name$[ebp], 0
	je	SHORT $L70769
	mov	eax, DWORD PTR _name$[ebp]
	add	eax, 8
	mov	DWORD PTR -56+[ebp], eax
	jmp	SHORT $L70770
$L70769:
	mov	DWORD PTR -56+[ebp], 0
$L70770:
	mov	ecx, DWORD PTR -36+[ebp]
	push	ecx
	call	_atoi
	add	esp, 4
	push	eax
	mov	edx, DWORD PTR _ctrl$[ebp]
	mov	eax, DWORD PTR [edx+380]
	push	eax
	mov	ecx, DWORD PTR _ctrl$[ebp]
	mov	edx, DWORD PTR [ecx+376]
	push	edx
	mov	eax, DWORD PTR -40+[ebp]
	push	eax
	mov	ecx, DWORD PTR -48+[ebp]
	movsx	edx, BYTE PTR [ecx]
	xor	eax, eax
	cmp	edx, 49					; 00000031H
	sete	al
	push	eax
	mov	ecx, DWORD PTR _len$[ebp]
	push	ecx
	mov	edx, DWORD PTR _txt$[ebp]
	push	edx
	mov	eax, DWORD PTR -52+[ebp]
	push	eax
	mov	ecx, DWORD PTR -56+[ebp]
	push	ecx
	mov	edx, DWORD PTR _cntxt$[ebp]
	push	edx
	call	_put_html_text_input
	add	esp, 40					; 00000028H
	test	eax, eax
	jne	SHORT $L70397
	mov	eax, DWORD PTR _len$[ebp]
	push	eax
	mov	ecx, DWORD PTR _txt$[ebp]
	push	ecx
	mov	edx, DWORD PTR _name$[ebp]
	push	edx
	mov	eax, DWORD PTR _i_val$[ebp]
	push	eax
	mov	ecx, DWORD PTR _ctrl$[ebp]
	push	ecx
	mov	edx, DWORD PTR _cntxt$[ebp]
	push	edx
	call	_ctrl_put_hidden_old
	add	esp, 24					; 00000018H
	test	eax, eax
	je	SHORT $L70396
$L70397:

; 148  : 		STACK_ERROR;

	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 148		; 00000094H
	jmp	$eva_err$70394
$L70396:

; 150  : 	else

	jmp	$L70420
$L70390:

; 152  : 		/* Else : add text value */
; 153  : 		if(CTRL_ATTR_VAL(PASSWORD)[0] == '1') DYNBUF_ADD_STR(form->html, "******")

	cmp	DWORD PTR _ctrl$[ebp], 0
	je	SHORT $L70771
	push	0
	push	-1
	push	OFFSET FLAT:$SG70406
	mov	ecx, DWORD PTR _ctrl$[ebp]
	add	ecx, 44					; 0000002cH
	push	ecx
	call	_dyntab_field_val
	add	esp, 16					; 00000010H
	mov	DWORD PTR -60+[ebp], eax
	jmp	SHORT $L70772
$L70771:
	mov	DWORD PTR -60+[ebp], OFFSET FLAT:$SG70407
$L70772:
	mov	edx, DWORD PTR -60+[ebp]
	movsx	eax, BYTE PTR [edx]
	cmp	eax, 49					; 00000031H
	jne	SHORT $L70405
	push	0
	push	0
	push	6
	push	OFFSET FLAT:$SG70410
	mov	ecx, DWORD PTR _form$[ebp]
	mov	edx, DWORD PTR [ecx+232]
	push	edx
	call	_dynbuf_add
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L70409
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29872], OFFSET FLAT:$SG70412
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 153		; 00000099H
	jmp	$eva_err$70394
$L70409:

; 154  : 		else if(*editmode)

	jmp	$L70420
$L70405:
	mov	edx, DWORD PTR _editmode$[ebp]
	movsx	eax, BYTE PTR [edx]
	test	eax, eax
	je	SHORT $L70414

; 155  : 			DYNBUF_ADD(form->html, txt, len, NO_CONV)

	push	0
	push	0
	mov	ecx, DWORD PTR _len$[ebp]
	push	ecx
	mov	edx, DWORD PTR _txt$[ebp]
	push	edx
	mov	eax, DWORD PTR _form$[ebp]
	mov	ecx, DWORD PTR [eax+232]
	push	ecx
	call	_dynbuf_add
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L70416
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29872], OFFSET FLAT:$SG70418
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 155		; 0000009bH
	jmp	$eva_err$70394
$L70416:

; 156  : 		else

	jmp	SHORT $L70420
$L70414:

; 157  : 			DYNBUF_ADD(form->html, txt, len, TO_HTML)

	push	1
	push	OFFSET FLAT:_plain_to_html
	mov	ecx, DWORD PTR _len$[ebp]
	push	ecx
	mov	edx, DWORD PTR _txt$[ebp]
	push	edx
	mov	eax, DWORD PTR _form$[ebp]
	mov	ecx, DWORD PTR [eax+232]
	push	ecx
	call	_dynbuf_add
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L70420
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29872], OFFSET FLAT:$SG70422
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 157		; 0000009dH
	jmp	$eva_err$70394
$L70420:

; 159  : 	if(lblunit && (*ctrl->LABEL_NOSEL || ctrl->val.nbrows || form->step == HtmlEdit))

	cmp	DWORD PTR _lblunit$[ebp], 0
	je	$L70427
	mov	ecx, DWORD PTR _ctrl$[ebp]
	mov	edx, DWORD PTR [ecx+348]
	movsx	eax, BYTE PTR [edx]
	test	eax, eax
	jne	SHORT $L70424
	mov	ecx, DWORD PTR _ctrl$[ebp]
	cmp	DWORD PTR [ecx+64], 0
	jne	SHORT $L70424
	mov	edx, DWORD PTR _form$[ebp]
	cmp	DWORD PTR [edx+176], 4
	jne	$L70427
$L70424:

; 160  : 		DYNBUF_ADD3_CELLP(form->html, " ", lblunit, TO_HTML, "");

	mov	eax, DWORD PTR _lblunit$[ebp]
	mov	DWORD PTR __c$70425[ebp], eax
	cmp	DWORD PTR __c$70425[ebp], 0
	je	SHORT $L70773
	mov	ecx, DWORD PTR __c$70425[ebp]
	mov	edx, DWORD PTR [ecx+4]
	mov	DWORD PTR -64+[ebp], edx
	jmp	SHORT $L70774
$L70773:
	mov	DWORD PTR -64+[ebp], 0
$L70774:
	cmp	DWORD PTR __c$70425[ebp], 0
	je	SHORT $L70775
	mov	eax, DWORD PTR __c$70425[ebp]
	mov	ecx, DWORD PTR [eax]
	mov	DWORD PTR -68+[ebp], ecx
	jmp	SHORT $L70776
$L70775:
	mov	DWORD PTR -68+[ebp], 0
$L70776:
	push	0
	push	OFFSET FLAT:$SG70428
	push	1
	push	OFFSET FLAT:_plain_to_html
	mov	edx, DWORD PTR -64+[ebp]
	push	edx
	mov	eax, DWORD PTR -68+[ebp]
	push	eax
	push	1
	push	OFFSET FLAT:$SG70429
	mov	ecx, DWORD PTR _form$[ebp]
	mov	edx, DWORD PTR [ecx+232]
	push	edx
	call	_dynbuf_add3
	add	esp, 36					; 00000024H
	test	eax, eax
	je	SHORT $L70427
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29872], OFFSET FLAT:$SG70431
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 160		; 000000a0H
	jmp	SHORT $eva_err$70394
$L70427:
$eva_noerr$70432:

; 161  : 
; 162  : 	RETURN_OK_CLEANUP;

	push	0
	push	OFFSET FLAT:$SG70433
	push	OFFSET FLAT:$SG70434
	mov	edx, DWORD PTR _cntxt$[ebp]
	push	edx
	call	_err_clear
	add	esp, 16					; 00000010H
$eva_err$70394:
	mov	eax, DWORD PTR _cntxt$[ebp]
	cmp	DWORD PTR [eax+29872], 0
	je	SHORT $L70435
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	edx, DWORD PTR [ecx+29900]
	push	edx
	push	OFFSET FLAT:$SG70436
	push	OFFSET FLAT:$SG70437
	mov	eax, DWORD PTR _cntxt$[ebp]
	push	eax
	call	_err_add_context
	add	esp, 16					; 00000010H
$L70435:
	cmp	DWORD PTR _name1$[ebp], 0
	jne	SHORT $L70438
	mov	ecx, DWORD PTR _name$[ebp]
	push	ecx
	call	_mem_free
	add	esp, 4
	mov	DWORD PTR _name$[ebp], 0
$L70438:
	mov	edx, DWORD PTR _cntxt$[ebp]
	xor	eax, eax
	cmp	DWORD PTR [edx+29872], 0
	setne	al

; 163  : }

	mov	esp, ebp
	pop	ebp
	ret	0
_ctrl_add_text_value ENDP
_TEXT	ENDS
PUBLIC	_ctrl_add_text
EXTRN	__pctype:DWORD
EXTRN	__isctype:NEAR
EXTRN	_setcase:NEAR
EXTRN	___mb_cur_max:DWORD
EXTRN	_mem_alloc:NEAR
EXTRN	_memcpy:NEAR
EXTRN	_ctrl_format_pos:NEAR
EXTRN	_strchr:NEAR
_BSS	SEGMENT
	ALIGN	4

$SG70460 DB	01H DUP (?)
_BSS	ENDS
_DATA	SEGMENT
$SG70452 DB	'No', 00H
	ORG $+1
$SG70459 DB	'_EVA_TEXTINPUTMASK', 00H
	ORG $+1
$SG70476 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70481 DB	'UCASE', 00H
	ORG $+2
$SG70484 DB	'NAMECASE', 00H
	ORG $+3
$SG70488 DB	' -', 00H
	ORG $+1
$SG70491 DB	'PHRASE', 00H
	ORG $+1
$SG70494 DB	'PHONE', 00H
	ORG $+2
$SG70515 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70523 DB	'<br>', 00H
	ORG $+3
$SG70525 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70531 DB	'D:\Travail\ABI\EVA\V4.0\CGI\Brunix-2016\ctrl_input_basic'
	DB	'.c', 00H
	ORG $+1
$SG70532 DB	'ctrl_add_text', 00H
	ORG $+2
$SG70534 DB	'D:\Travail\ABI\EVA\V4.0\CGI\Brunix-2016\ctrl_input_basic'
	DB	'.c', 00H
	ORG $+1
$SG70535 DB	'ctrl_add_text', 00H
_DATA	ENDS
_TEXT	SEGMENT
_cntxt$ = 8
_i_ctrl$ = 12
_form$ = -4
_ctrl$ = -20
_i$ = -8
_k$ = -16
_b_multiple$ = -12
__inputmask$70458 = -28
_inputmask$70461 = -24
_c$70466 = -36
_in$70467 = -40
_out$70468 = -32
_old$70469 = -44
_size$70471 = -48
_src$70472 = -52
_size1$70473 = -56
_ctrl_add_text PROC NEAR

; 176  : ){

	push	ebp
	mov	ebp, esp
	sub	esp, 92					; 0000005cH

; 177  : 	EVA_form *form = cntxt->form;

	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	ecx, DWORD PTR [eax+80]
	mov	DWORD PTR _form$[ebp], ecx

; 178  : 	EVA_ctrl *ctrl = form->ctrl + i_ctrl;

	mov	edx, DWORD PTR _i_ctrl$[ebp]
	imul	edx, 480				; 000001e0H
	mov	eax, DWORD PTR _form$[ebp]
	mov	ecx, DWORD PTR [eax]
	add	ecx, edx
	mov	DWORD PTR _ctrl$[ebp], ecx

; 179  : 	unsigned long i, k;
; 180  : 	int b_multiple = ctrl->MULTIPLE[0] != 0 && strcmp("No", ctrl->MULTIPLE);

	mov	edx, DWORD PTR _ctrl$[ebp]
	mov	eax, DWORD PTR [edx+344]
	movsx	ecx, BYTE PTR [eax]
	test	ecx, ecx
	je	SHORT $L70778
	mov	edx, DWORD PTR _ctrl$[ebp]
	mov	eax, DWORD PTR [edx+344]
	push	eax
	push	OFFSET FLAT:$SG70452
	call	_strcmp
	add	esp, 8
	test	eax, eax
	je	SHORT $L70778
	mov	DWORD PTR -60+[ebp], 1
	jmp	SHORT $L70779
$L70778:
	mov	DWORD PTR -60+[ebp], 0
$L70779:
	mov	ecx, DWORD PTR -60+[ebp]
	mov	DWORD PTR _b_multiple$[ebp], ecx

; 181  : 
; 182  : 	switch(form->step)
; 183  : 	{

	mov	edx, DWORD PTR _form$[ebp]
	mov	eax, DWORD PTR [edx+176]
	mov	DWORD PTR -64+[ebp], eax
	mov	ecx, DWORD PTR -64+[ebp]
	sub	ecx, 2
	mov	DWORD PTR -64+[ebp], ecx
	cmp	DWORD PTR -64+[ebp], 5
	ja	$L70530
	mov	edx, DWORD PTR -64+[ebp]
	jmp	DWORD PTR $L70795[edx*4]
$L70457:

; 186  : 			/* Handle input mask */
; 187  : 			char *_inputmask = CTRL_ATTR_VAL(TEXTINPUTMASK), *inputmask = _inputmask + 5;

	cmp	DWORD PTR _ctrl$[ebp], 0
	je	SHORT $L70780
	push	0
	push	-1
	push	OFFSET FLAT:$SG70459
	mov	eax, DWORD PTR _ctrl$[ebp]
	add	eax, 44					; 0000002cH
	push	eax
	call	_dyntab_field_val
	add	esp, 16					; 00000010H
	mov	DWORD PTR -68+[ebp], eax
	jmp	SHORT $L70781
$L70780:
	mov	DWORD PTR -68+[ebp], OFFSET FLAT:$SG70460
$L70781:
	mov	ecx, DWORD PTR -68+[ebp]
	mov	DWORD PTR __inputmask$70458[ebp], ecx
	mov	edx, DWORD PTR __inputmask$70458[ebp]
	add	edx, 5
	mov	DWORD PTR _inputmask$70461[ebp], edx

; 188  : 
; 189  : 			/* Format each value */
; 190  : 			if(*_inputmask) for(i = 0; i < ctrl->val.nbrows; i++)

	mov	eax, DWORD PTR __inputmask$70458[ebp]
	movsx	ecx, BYTE PTR [eax]
	test	ecx, ecx
	je	$L70465
	mov	DWORD PTR _i$[ebp], 0
	jmp	SHORT $L70463
$L70464:
	mov	edx, DWORD PTR _i$[ebp]
	add	edx, 1
	mov	DWORD PTR _i$[ebp], edx
$L70463:
	mov	eax, DWORD PTR _ctrl$[ebp]
	mov	ecx, DWORD PTR _i$[ebp]
	cmp	ecx, DWORD PTR [eax+64]
	jae	$L70465

; 192  : 				DynTableCell *c = dyntab_cell(&ctrl->val, i, 0);

	push	0
	mov	edx, DWORD PTR _i$[ebp]
	push	edx
	mov	eax, DWORD PTR _ctrl$[ebp]
	add	eax, 64					; 00000040H
	push	eax
	call	_dyntab_cell
	add	esp, 12					; 0000000cH
	mov	DWORD PTR _c$70466[ebp], eax

; 193  : 				char *in = c->txt, *out = in, *old;

	mov	ecx, DWORD PTR _c$70466[ebp]
	mov	edx, DWORD PTR [ecx]
	mov	DWORD PTR _in$70467[ebp], edx
	mov	eax, DWORD PTR _in$70467[ebp]
	mov	DWORD PTR _out$70468[ebp], eax

; 194  : 				if(!c->txt && *c->txt) continue;

	mov	ecx, DWORD PTR _c$70466[ebp]
	cmp	DWORD PTR [ecx], 0
	jne	SHORT $L70470
	mov	edx, DWORD PTR _c$70466[ebp]
	mov	eax, DWORD PTR [edx]
	movsx	ecx, BYTE PTR [eax]
	test	ecx, ecx
	je	SHORT $L70470
	jmp	SHORT $L70464
$L70470:

; 195  : 				M_STRDUP(old, c->txt, c->len);

	mov	edx, DWORD PTR _c$70466[ebp]
	mov	eax, DWORD PTR [edx+4]
	mov	DWORD PTR _size$70471[ebp], eax
	mov	ecx, DWORD PTR _c$70466[ebp]
	mov	edx, DWORD PTR [ecx]
	mov	DWORD PTR _src$70472[ebp], edx
	mov	eax, DWORD PTR _size$70471[ebp]
	add	eax, 1
	mov	DWORD PTR _size1$70473[ebp], eax
	mov	ecx, DWORD PTR _size1$70473[ebp]
	push	ecx
	call	_mem_alloc
	add	esp, 4
	mov	DWORD PTR _old$70469[ebp], eax
	cmp	DWORD PTR _size1$70473[ebp], 0
	je	SHORT $L70474
	cmp	DWORD PTR _old$70469[ebp], 0
	jne	SHORT $L70474
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29872], OFFSET FLAT:$SG70476
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 195		; 000000c3H
	jmp	$eva_err$70477
$L70474:
	cmp	DWORD PTR _src$70472[ebp], 0
	je	SHORT $L70479
	cmp	DWORD PTR _size$70471[ebp], 0
	je	SHORT $L70479
	mov	ecx, DWORD PTR _size$70471[ebp]
	push	ecx
	mov	edx, DWORD PTR _src$70472[ebp]
	push	edx
	mov	eax, DWORD PTR _old$70469[ebp]
	push	eax
	call	_memcpy
	add	esp, 12					; 0000000cH
$L70479:

; 196  : 				if(!strcmp(inputmask, "UCASE"))

	push	OFFSET FLAT:$SG70481
	mov	ecx, DWORD PTR _inputmask$70461[ebp]
	push	ecx
	call	_strcmp
	add	esp, 8
	test	eax, eax
	jne	SHORT $L70480

; 197  : 					setcase(1, c->txt, 0);

	push	0
	mov	edx, DWORD PTR _c$70466[ebp]
	mov	eax, DWORD PTR [edx]
	push	eax
	push	1
	call	_setcase
	add	esp, 12					; 0000000cH

; 198  : 				else if(!strcmp(inputmask, "NAMECASE"))

	jmp	$L70497
$L70480:
	push	OFFSET FLAT:$SG70484
	mov	ecx, DWORD PTR _inputmask$70461[ebp]
	push	ecx
	call	_strcmp
	add	esp, 8
	test	eax, eax
	jne	SHORT $L70483
$L70486:

; 200  : 					while(*in)

	mov	edx, DWORD PTR _in$70467[ebp]
	movsx	eax, BYTE PTR [edx]
	test	eax, eax
	je	SHORT $L70487

; 202  : 						setcase((in == c->txt || strchr(" -", *(in - 1))), in, 1);

	mov	ecx, DWORD PTR _c$70466[ebp]
	mov	edx, DWORD PTR _in$70467[ebp]
	cmp	edx, DWORD PTR [ecx]
	je	SHORT $L70782
	mov	eax, DWORD PTR _in$70467[ebp]
	movsx	ecx, BYTE PTR [eax-1]
	push	ecx
	push	OFFSET FLAT:$SG70488
	call	_strchr
	add	esp, 8
	test	eax, eax
	jne	SHORT $L70782
	mov	DWORD PTR -72+[ebp], 0
	jmp	SHORT $L70783
$L70782:
	mov	DWORD PTR -72+[ebp], 1
$L70783:
	push	1
	mov	edx, DWORD PTR _in$70467[ebp]
	push	edx
	mov	eax, DWORD PTR -72+[ebp]
	push	eax
	call	_setcase
	add	esp, 12					; 0000000cH

; 203  : 						in++;

	mov	ecx, DWORD PTR _in$70467[ebp]
	add	ecx, 1
	mov	DWORD PTR _in$70467[ebp], ecx

; 204  : 					}

	jmp	SHORT $L70486
$L70487:

; 206  : 				else if(!strcmp(inputmask, "PHRASE"))

	jmp	$L70497
$L70483:
	push	OFFSET FLAT:$SG70491
	mov	edx, DWORD PTR _inputmask$70461[ebp]
	push	edx
	call	_strcmp
	add	esp, 8
	test	eax, eax
	jne	SHORT $L70490

; 208  : 					setcase(1, c->txt, 1);

	push	1
	mov	eax, DWORD PTR _c$70466[ebp]
	mov	ecx, DWORD PTR [eax]
	push	ecx
	push	1
	call	_setcase
	add	esp, 12					; 0000000cH

; 209  : 					setcase(0, c->txt + 1, 0);

	push	0
	mov	edx, DWORD PTR _c$70466[ebp]
	mov	eax, DWORD PTR [edx]
	add	eax, 1
	push	eax
	push	0
	call	_setcase
	add	esp, 12					; 0000000cH

; 211  : 				else if(!strcmp(inputmask, "PHONE"))

	jmp	$L70497
$L70490:
	push	OFFSET FLAT:$SG70494
	mov	ecx, DWORD PTR _inputmask$70461[ebp]
	push	ecx
	call	_strcmp
	add	esp, 8
	test	eax, eax
	jne	$L70497
$L70496:

; 213  : 					while(*in)

	mov	edx, DWORD PTR _in$70467[ebp]
	movsx	eax, BYTE PTR [edx]
	test	eax, eax
	je	SHORT $L70497

; 215  : 						*in = (char)(((in == c->txt && *in == '+') || isdigit(*in)) ? *in : ' ');

	mov	ecx, DWORD PTR _c$70466[ebp]
	mov	edx, DWORD PTR _in$70467[ebp]
	cmp	edx, DWORD PTR [ecx]
	jne	SHORT $L70784
	mov	eax, DWORD PTR _in$70467[ebp]
	movsx	ecx, BYTE PTR [eax]
	cmp	ecx, 43					; 0000002bH
	je	SHORT $L70787
$L70784:
	cmp	DWORD PTR ___mb_cur_max, 1
	jle	SHORT $L70785
	push	4
	mov	edx, DWORD PTR _in$70467[ebp]
	movsx	eax, BYTE PTR [edx]
	push	eax
	call	__isctype
	add	esp, 8
	mov	DWORD PTR -76+[ebp], eax
	jmp	SHORT $L70786
$L70785:
	mov	ecx, DWORD PTR _in$70467[ebp]
	movsx	edx, BYTE PTR [ecx]
	mov	eax, DWORD PTR __pctype
	xor	ecx, ecx
	mov	cx, WORD PTR [eax+edx*2]
	and	ecx, 4
	mov	DWORD PTR -76+[ebp], ecx
$L70786:
	cmp	DWORD PTR -76+[ebp], 0
	jne	SHORT $L70787
	mov	DWORD PTR -80+[ebp], 32			; 00000020H
	jmp	SHORT $L70788
$L70787:
	mov	edx, DWORD PTR _in$70467[ebp]
	movsx	eax, BYTE PTR [edx]
	mov	DWORD PTR -80+[ebp], eax
$L70788:
	mov	ecx, DWORD PTR _in$70467[ebp]
	mov	dl, BYTE PTR -80+[ebp]
	mov	BYTE PTR [ecx], dl

; 216  : 						in++;

	mov	eax, DWORD PTR _in$70467[ebp]
	add	eax, 1
	mov	DWORD PTR _in$70467[ebp], eax

; 217  : 					}

	jmp	SHORT $L70496
$L70497:

; 219  : 
; 220  : 				/* Remove duplicate spaces */
; 221  : 				in = c->txt, out = in;

	mov	ecx, DWORD PTR _c$70466[ebp]
	mov	edx, DWORD PTR [ecx]
	mov	DWORD PTR _in$70467[ebp], edx
	mov	eax, DWORD PTR _in$70467[ebp]
	mov	DWORD PTR _out$70468[ebp], eax
$L70500:

; 222  : 				while(*in)

	mov	ecx, DWORD PTR _in$70467[ebp]
	movsx	edx, BYTE PTR [ecx]
	test	edx, edx
	je	$L70501

; 224  : 					if(!isspace(*in) || (out > c->txt && !isspace(*(out - 1))))

	cmp	DWORD PTR ___mb_cur_max, 1
	jle	SHORT $L70789
	push	8
	mov	eax, DWORD PTR _in$70467[ebp]
	movsx	ecx, BYTE PTR [eax]
	push	ecx
	call	__isctype
	add	esp, 8
	mov	DWORD PTR -84+[ebp], eax
	jmp	SHORT $L70790
$L70789:
	mov	edx, DWORD PTR _in$70467[ebp]
	movsx	eax, BYTE PTR [edx]
	mov	ecx, DWORD PTR __pctype
	xor	edx, edx
	mov	dx, WORD PTR [ecx+eax*2]
	and	edx, 8
	mov	DWORD PTR -84+[ebp], edx
$L70790:
	cmp	DWORD PTR -84+[ebp], 0
	je	SHORT $L70503
	mov	eax, DWORD PTR _c$70466[ebp]
	mov	ecx, DWORD PTR _out$70468[ebp]
	cmp	ecx, DWORD PTR [eax]
	jbe	SHORT $L70502
	cmp	DWORD PTR ___mb_cur_max, 1
	jle	SHORT $L70791
	push	8
	mov	edx, DWORD PTR _out$70468[ebp]
	movsx	eax, BYTE PTR [edx-1]
	push	eax
	call	__isctype
	add	esp, 8
	mov	DWORD PTR -88+[ebp], eax
	jmp	SHORT $L70792
$L70791:
	mov	ecx, DWORD PTR _out$70468[ebp]
	movsx	edx, BYTE PTR [ecx-1]
	mov	eax, DWORD PTR __pctype
	xor	ecx, ecx
	mov	cx, WORD PTR [eax+edx*2]
	and	ecx, 8
	mov	DWORD PTR -88+[ebp], ecx
$L70792:
	cmp	DWORD PTR -88+[ebp], 0
	jne	SHORT $L70502
$L70503:

; 226  : 						*out = *in;

	mov	edx, DWORD PTR _out$70468[ebp]
	mov	eax, DWORD PTR _in$70467[ebp]
	mov	cl, BYTE PTR [eax]
	mov	BYTE PTR [edx], cl

; 227  : 						out++;

	mov	edx, DWORD PTR _out$70468[ebp]
	add	edx, 1
	mov	DWORD PTR _out$70468[ebp], edx
$L70502:

; 229  : 					in++;

	mov	eax, DWORD PTR _in$70467[ebp]
	add	eax, 1
	mov	DWORD PTR _in$70467[ebp], eax

; 230  : 				}

	jmp	$L70500
$L70501:

; 231  : 				while(out < c->txt + c->len) *out++ = ' ';

	mov	ecx, DWORD PTR _c$70466[ebp]
	mov	edx, DWORD PTR [ecx]
	mov	eax, DWORD PTR _c$70466[ebp]
	add	edx, DWORD PTR [eax+4]
	cmp	DWORD PTR _out$70468[ebp], edx
	jae	SHORT $L70506
	mov	ecx, DWORD PTR _out$70468[ebp]
	mov	BYTE PTR [ecx], 32			; 00000020H
	mov	edx, DWORD PTR _out$70468[ebp]
	add	edx, 1
	mov	DWORD PTR _out$70468[ebp], edx
	jmp	SHORT $L70501
$L70506:

; 232  : 				if(strcmp(old, c->txt))

	mov	eax, DWORD PTR _c$70466[ebp]
	mov	ecx, DWORD PTR [eax]
	push	ecx
	mov	edx, DWORD PTR _old$70469[ebp]
	push	edx
	call	_strcmp
	add	esp, 8
	test	eax, eax
	je	SHORT $L70507

; 234  : 					c->b_modified = 1;

	mov	eax, DWORD PTR _c$70466[ebp]
	mov	BYTE PTR [eax+13], 1

; 235  : 					ctrl->b_modified = 1;

	mov	ecx, DWORD PTR _ctrl$[ebp]
	mov	DWORD PTR [ecx+200], 1
$L70507:

; 237  : 				M_FREE(old);

	mov	edx, DWORD PTR _old$70469[ebp]
	push	edx
	call	_mem_free
	add	esp, 4
	mov	DWORD PTR _old$70469[ebp], 0

; 238  : 			}

	jmp	$L70464
$L70465:

; 240  : 		break;

	jmp	$eva_noerr$70510
$L70508:

; 241  : 
; 242  : 	case HtmlEdit:
; 243  : 	case HtmlPrint:
; 244  : 	case HtmlView:
; 245  : 		/* Add HTML code for control label & position */
; 246  : 		if(!form->html) RETURN_OK;

	mov	eax, DWORD PTR _form$[ebp]
	cmp	DWORD PTR [eax+232], 0
	jne	SHORT $L70509
	jmp	$eva_noerr$70510
$L70509:

; 247  : 		if(ctrl_format_pos(cntxt, ctrl, 1)) STACK_ERROR;

	push	1
	mov	ecx, DWORD PTR _ctrl$[ebp]
	push	ecx
	mov	edx, DWORD PTR _cntxt$[ebp]
	push	edx
	call	_ctrl_format_pos
	add	esp, 12					; 0000000cH
	test	eax, eax
	je	SHORT $L70511
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 247		; 000000f7H
	jmp	$eva_err$70477
$L70511:

; 248  : 
; 249  : 		/* Handle empty value in view mode */
; 250  : 		if(form->step != HtmlEdit && !ctrl->val.nbrows && *ctrl->LABEL_NOSEL) DYNBUF_ADD(form->html, ctrl->LABEL_NOSEL, 0, TO_HTML);

	mov	ecx, DWORD PTR _form$[ebp]
	cmp	DWORD PTR [ecx+176], 4
	je	SHORT $L70513
	mov	edx, DWORD PTR _ctrl$[ebp]
	cmp	DWORD PTR [edx+64], 0
	jne	SHORT $L70513
	mov	eax, DWORD PTR _ctrl$[ebp]
	mov	ecx, DWORD PTR [eax+348]
	movsx	edx, BYTE PTR [ecx]
	test	edx, edx
	je	SHORT $L70513
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
	je	SHORT $L70513
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29872], OFFSET FLAT:$SG70515
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 250		; 000000faH
	jmp	$eva_err$70477
$L70513:

; 251  : 
; 252  : 		/* Add HTML code for each value */
; 253  : 		k = ctrl->val.nbrows + ((form->step == HtmlEdit && b_multiple) ? 1 : 0);

	mov	eax, DWORD PTR _form$[ebp]
	cmp	DWORD PTR [eax+176], 4
	jne	SHORT $L70793
	cmp	DWORD PTR _b_multiple$[ebp], 0
	je	SHORT $L70793
	mov	DWORD PTR -92+[ebp], 1
	jmp	SHORT $L70794
$L70793:
	mov	DWORD PTR -92+[ebp], 0
$L70794:
	mov	ecx, DWORD PTR _ctrl$[ebp]
	mov	edx, DWORD PTR [ecx+64]
	add	edx, DWORD PTR -92+[ebp]
	mov	DWORD PTR _k$[ebp], edx

; 254  : 		for(i = 0; !i || i < k; i++)

	mov	DWORD PTR _i$[ebp], 0
	jmp	SHORT $L70516
$L70517:
	mov	eax, DWORD PTR _i$[ebp]
	add	eax, 1
	mov	DWORD PTR _i$[ebp], eax
$L70516:
	cmp	DWORD PTR _i$[ebp], 0
	je	SHORT $L70519
	mov	ecx, DWORD PTR _i$[ebp]
	cmp	ecx, DWORD PTR _k$[ebp]
	jae	SHORT $L70518
$L70519:

; 256  : 			/* Separate multiple values with a line break */
; 257  : 			if(i) DYNBUF_ADD_STR(form->html, "<br>");

	cmp	DWORD PTR _i$[ebp], 0
	je	SHORT $L70522
	push	0
	push	0
	push	4
	push	OFFSET FLAT:$SG70523
	mov	edx, DWORD PTR _form$[ebp]
	mov	eax, DWORD PTR [edx+232]
	push	eax
	call	_dynbuf_add
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L70522
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29872], OFFSET FLAT:$SG70525
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 257		; 00000101H
	jmp	SHORT $eva_err$70477
$L70522:

; 258  : 
; 259  : 			/* Add text control */
; 260  : 			if(ctrl_add_text_value(cntxt, ctrl, i, NULL, 0, NULL)) STACK_ERROR;

	push	0
	push	0
	push	0
	mov	eax, DWORD PTR _i$[ebp]
	push	eax
	mov	ecx, DWORD PTR _ctrl$[ebp]
	push	ecx
	mov	edx, DWORD PTR _cntxt$[ebp]
	push	edx
	call	_ctrl_add_text_value
	add	esp, 24					; 00000018H
	test	eax, eax
	je	SHORT $L70528
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 260		; 00000104H
	jmp	SHORT $eva_err$70477
$L70528:

; 261  : 		}

	jmp	$L70517
$L70518:

; 262  : 
; 263  : 		/* Add HTML code for the control footer */
; 264  : 		if(ctrl_format_pos(cntxt, ctrl, 0)) STACK_ERROR;

	push	0
	mov	ecx, DWORD PTR _ctrl$[ebp]
	push	ecx
	mov	edx, DWORD PTR _cntxt$[ebp]
	push	edx
	call	_ctrl_format_pos
	add	esp, 12					; 0000000cH
	test	eax, eax
	je	SHORT $L70530
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 264		; 00000108H
	jmp	SHORT $eva_err$70477
$L70530:
$eva_noerr$70510:

; 269  : 
; 270  : 	RETURN_OK_CLEANUP;

	push	0
	push	OFFSET FLAT:$SG70531
	push	OFFSET FLAT:$SG70532
	mov	ecx, DWORD PTR _cntxt$[ebp]
	push	ecx
	call	_err_clear
	add	esp, 16					; 00000010H
$eva_err$70477:
	mov	edx, DWORD PTR _cntxt$[ebp]
	cmp	DWORD PTR [edx+29872], 0
	je	SHORT $L70533
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	ecx, DWORD PTR [eax+29900]
	push	ecx
	push	OFFSET FLAT:$SG70534
	push	OFFSET FLAT:$SG70535
	mov	edx, DWORD PTR _cntxt$[ebp]
	push	edx
	call	_err_add_context
	add	esp, 16					; 00000010H
$L70533:
	mov	eax, DWORD PTR _cntxt$[ebp]
	xor	ecx, ecx
	cmp	DWORD PTR [eax+29872], 0
	setne	cl
	mov	eax, ecx

; 271  : }

	mov	esp, ebp
	pop	ebp
	ret	0
$L70795:
	DD	$L70457
	DD	$L70530
	DD	$L70508
	DD	$L70530
	DD	$L70508
	DD	$L70508
_ctrl_add_text ENDP
_TEXT	ENDS
PUBLIC	_ctrl_add_number
EXTRN	_input_to_number:NEAR
EXTRN	_number_to_format:NEAR
EXTRN	__fltused:NEAR
EXTRN	_atof:NEAR
EXTRN	_dyntab_sz:NEAR
EXTRN	_dyntab_add:NEAR
EXTRN	_strlen:NEAR
_BSS	SEGMENT
	ALIGN	4

$SG70610 DB	01H DUP (?)
	ALIGN	4

$SG70619 DB	01H DUP (?)
	ALIGN	4

$SG70645 DB	01H DUP (?)
_BSS	ENDS
_DATA	SEGMENT
	ORG $+2
$SG70549 DB	'No', 00H
	ORG $+1
$SG70556 DB	'1', 00H
	ORG $+2
$SG70566 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70575 DB	'_EVA_MIN_VALUE', 00H
	ORG $+1
$SG70579 DB	'_EVA_MAX_VALUE', 00H
	ORG $+1
$SG70587 DB	' - ', 00H
$SG70589 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70595 DB	' et ', 00H
	ORG $+3
$SG70596 DB	'Valeur entre ', 00H
	ORG $+2
$SG70598 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70603 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70611 DB	'Valeur sup', 0e9H, 'rieure ', 0e0H, ' ', 00H
	ORG $+3
$SG70613 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70620 DB	'Valeur inf', 0e9H, 'rieure ', 0e0H, ' ', 00H
	ORG $+3
$SG70622 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70628 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70636 DB	'<br>', 00H
	ORG $+3
$SG70638 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70644 DB	'_EVA_FORMAT', 00H
$SG70652 DB	'D:\Travail\ABI\EVA\V4.0\CGI\Brunix-2016\ctrl_input_basic'
	DB	'.c', 00H
	ORG $+1
$SG70653 DB	'ctrl_add_number', 00H
$SG70655 DB	'D:\Travail\ABI\EVA\V4.0\CGI\Brunix-2016\ctrl_input_basic'
	DB	'.c', 00H
	ORG $+1
$SG70656 DB	'ctrl_add_number', 00H
_DATA	ENDS
_TEXT	SEGMENT
_cntxt$ = 8
_i_ctrl$ = 12
_form$ = -4
_ctrl$ = -20
_i$ = -8
_k$ = -16
_b_multiple$ = -12
_val$70560 = -24
_num$70561 = -28
_num$70572 = -48
_cmin$70573 = -32
_vmin$70576 = -56
_cmax$70577 = -60
_vmax$70580 = -40
__c$70591 = -64
__c$70599 = -68
__c$70606 = -72
__c$70615 = -76
_fmtval$70643 = -80
_ctrl_add_number PROC NEAR

; 284  : ){

	push	ebp
	mov	ebp, esp
	sub	esp, 144				; 00000090H

; 285  : 	EVA_form *form = cntxt->form;

	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	ecx, DWORD PTR [eax+80]
	mov	DWORD PTR _form$[ebp], ecx

; 286  : 	EVA_ctrl *ctrl = form->ctrl + i_ctrl;

	mov	edx, DWORD PTR _i_ctrl$[ebp]
	imul	edx, 480				; 000001e0H
	mov	eax, DWORD PTR _form$[ebp]
	mov	ecx, DWORD PTR [eax]
	add	ecx, edx
	mov	DWORD PTR _ctrl$[ebp], ecx

; 287  : 	unsigned long i, k;
; 288  : 	int b_multiple = ctrl->MULTIPLE[0] != 0 && strcmp("No", ctrl->MULTIPLE);

	mov	edx, DWORD PTR _ctrl$[ebp]
	mov	eax, DWORD PTR [edx+344]
	movsx	ecx, BYTE PTR [eax]
	test	ecx, ecx
	je	SHORT $L70797
	mov	edx, DWORD PTR _ctrl$[ebp]
	mov	eax, DWORD PTR [edx+344]
	push	eax
	push	OFFSET FLAT:$SG70549
	call	_strcmp
	add	esp, 8
	test	eax, eax
	je	SHORT $L70797
	mov	DWORD PTR -84+[ebp], 1
	jmp	SHORT $L70798
$L70797:
	mov	DWORD PTR -84+[ebp], 0
$L70798:
	mov	ecx, DWORD PTR -84+[ebp]
	mov	DWORD PTR _b_multiple$[ebp], ecx

; 289  : 
; 290  : 	switch(form->step)
; 291  : 	{

	mov	edx, DWORD PTR _form$[ebp]
	mov	eax, DWORD PTR [edx+176]
	mov	DWORD PTR -88+[ebp], eax
	cmp	DWORD PTR -88+[ebp], 7
	ja	$L70649
	mov	ecx, DWORD PTR -88+[ebp]
	jmp	DWORD PTR $L70823[ecx*4]
$L70554:

; 292  : 	case CtrlRead:
; 293  : 		/* Format each value */
; 294  : 		if(!*ctrl->NOBR) ctrl->NOBR = "1";

	mov	edx, DWORD PTR _ctrl$[ebp]
	mov	eax, DWORD PTR [edx+316]
	movsx	ecx, BYTE PTR [eax]
	test	ecx, ecx
	jne	SHORT $L70555
	mov	edx, DWORD PTR _ctrl$[ebp]
	mov	DWORD PTR [edx+316], OFFSET FLAT:$SG70556
$L70555:

; 295  : 		for(i = 0; i < ctrl->val.nbrows; i++)

	mov	DWORD PTR _i$[ebp], 0
	jmp	SHORT $L70557
$L70558:
	mov	eax, DWORD PTR _i$[ebp]
	add	eax, 1
	mov	DWORD PTR _i$[ebp], eax
$L70557:
	mov	ecx, DWORD PTR _ctrl$[ebp]
	mov	edx, DWORD PTR _i$[ebp]
	cmp	edx, DWORD PTR [ecx+64]
	jae	$L70559

; 297  : 			char *val = dyntab_val(&ctrl->val, i, 0);

	push	0
	mov	eax, DWORD PTR _i$[ebp]
	push	eax
	mov	ecx, DWORD PTR _ctrl$[ebp]
	add	ecx, 64					; 00000040H
	push	ecx
	call	_dyntab_val
	add	esp, 12					; 0000000cH
	mov	DWORD PTR _val$70560[ebp], eax

; 298  : 			char *num = input_to_number(val);

	mov	edx, DWORD PTR _val$70560[ebp]
	push	edx
	call	_input_to_number
	add	esp, 4
	mov	DWORD PTR _num$70561[ebp], eax

; 299  : 			if(strcmp(num, val))

	mov	eax, DWORD PTR _val$70560[ebp]
	push	eax
	mov	ecx, DWORD PTR _num$70561[ebp]
	push	ecx
	call	_strcmp
	add	esp, 8
	test	eax, eax
	je	SHORT $L70562

; 301  : 				DYNTAB_ADD(&ctrl->val, i, 0, num, strlen(num), NO_CONV);

	push	0
	push	0
	mov	edx, DWORD PTR _num$70561[ebp]
	push	edx
	call	_strlen
	add	esp, 4
	push	eax
	mov	eax, DWORD PTR _num$70561[ebp]
	push	eax
	push	0
	mov	ecx, DWORD PTR _i$[ebp]
	push	ecx
	mov	edx, DWORD PTR _ctrl$[ebp]
	add	edx, 64					; 00000040H
	push	edx
	call	_dyntab_add
	add	esp, 28					; 0000001cH
	test	eax, eax
	je	SHORT $L70564
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29872], OFFSET FLAT:$SG70566
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 301		; 0000012dH
	jmp	$eva_err$70567
$L70564:

; 302  : 				dyntab_cell(&ctrl->val, i, 0)->b_modified = 1;

	push	0
	mov	edx, DWORD PTR _i$[ebp]
	push	edx
	mov	eax, DWORD PTR _ctrl$[ebp]
	add	eax, 64					; 00000040H
	push	eax
	call	_dyntab_cell
	add	esp, 12					; 0000000cH
	mov	BYTE PTR [eax+13], 1

; 303  : 				ctrl->b_modified = 1;

	mov	ecx, DWORD PTR _ctrl$[ebp]
	mov	DWORD PTR [ecx+200], 1
$L70562:

; 305  : 		}

	jmp	$L70558
$L70559:

; 306  : 		break;

	jmp	$eva_noerr$70651
$L70568:

; 307  : 
; 308  : 	case InputCheck:
; 309  : 		/* Check each value */
; 310  : 		for(i = 0; i < ctrl->val.nbrows; i++)

	mov	DWORD PTR _i$[ebp], 0
	jmp	SHORT $L70569
$L70570:
	mov	edx, DWORD PTR _i$[ebp]
	add	edx, 1
	mov	DWORD PTR _i$[ebp], edx
$L70569:
	mov	eax, DWORD PTR _ctrl$[ebp]
	mov	ecx, DWORD PTR _i$[ebp]
	cmp	ecx, DWORD PTR [eax+64]
	jae	$L70571

; 312  : 			double num = atof(input_to_number(dyntab_val(&ctrl->val, i, 0)));

	push	0
	mov	edx, DWORD PTR _i$[ebp]
	push	edx
	mov	eax, DWORD PTR _ctrl$[ebp]
	add	eax, 64					; 00000040H
	push	eax
	call	_dyntab_val
	add	esp, 12					; 0000000cH
	push	eax
	call	_input_to_number
	add	esp, 4
	push	eax
	call	_atof
	add	esp, 4
	fstp	QWORD PTR _num$70572[ebp]

; 313  : 			DynTableCell *cmin = CTRL_ATTR_CELL(MIN_VALUE);

	cmp	DWORD PTR _ctrl$[ebp], 0
	je	SHORT $L70799
	push	0
	push	-1
	push	OFFSET FLAT:$SG70575
	mov	ecx, DWORD PTR _ctrl$[ebp]
	add	ecx, 44					; 0000002cH
	push	ecx
	call	_dyntab_field_cell
	add	esp, 16					; 00000010H
	mov	DWORD PTR -92+[ebp], eax
	jmp	SHORT $L70800
$L70799:
	mov	DWORD PTR -92+[ebp], 0
$L70800:
	mov	edx, DWORD PTR -92+[ebp]
	mov	DWORD PTR _cmin$70573[ebp], edx

; 314  : 			double vmin = cmin ? atof(cmin->txt) : 0;

	cmp	DWORD PTR _cmin$70573[ebp], 0
	je	SHORT $L70801
	mov	eax, DWORD PTR _cmin$70573[ebp]
	mov	ecx, DWORD PTR [eax]
	push	ecx
	call	_atof
	add	esp, 4
	fstp	QWORD PTR -100+[ebp]
	jmp	SHORT $L70802
$L70801:
	mov	DWORD PTR -100+[ebp], 0
	mov	DWORD PTR -100+[ebp+4], 0
$L70802:
	mov	edx, DWORD PTR -100+[ebp]
	mov	DWORD PTR _vmin$70576[ebp], edx
	mov	eax, DWORD PTR -100+[ebp+4]
	mov	DWORD PTR _vmin$70576[ebp+4], eax

; 315  : 			DynTableCell *cmax = CTRL_ATTR_CELL(MAX_VALUE);

	cmp	DWORD PTR _ctrl$[ebp], 0
	je	SHORT $L70803
	push	0
	push	-1
	push	OFFSET FLAT:$SG70579
	mov	ecx, DWORD PTR _ctrl$[ebp]
	add	ecx, 44					; 0000002cH
	push	ecx
	call	_dyntab_field_cell
	add	esp, 16					; 00000010H
	mov	DWORD PTR -104+[ebp], eax
	jmp	SHORT $L70804
$L70803:
	mov	DWORD PTR -104+[ebp], 0
$L70804:
	mov	edx, DWORD PTR -104+[ebp]
	mov	DWORD PTR _cmax$70577[ebp], edx

; 316  : 			double vmax = cmax ? atof(cmax->txt) : 0;

	cmp	DWORD PTR _cmax$70577[ebp], 0
	je	SHORT $L70805
	mov	eax, DWORD PTR _cmax$70577[ebp]
	mov	ecx, DWORD PTR [eax]
	push	ecx
	call	_atof
	add	esp, 4
	fstp	QWORD PTR -112+[ebp]
	jmp	SHORT $L70806
$L70805:
	mov	DWORD PTR -112+[ebp], 0
	mov	DWORD PTR -112+[ebp+4], 0
$L70806:
	mov	edx, DWORD PTR -112+[ebp]
	mov	DWORD PTR _vmax$70580[ebp], edx
	mov	eax, DWORD PTR -112+[ebp+4]
	mov	DWORD PTR _vmax$70580[ebp+4], eax

; 317  : 			if((cmin && num < vmin) || (cmax && num > vmax))

	cmp	DWORD PTR _cmin$70573[ebp], 0
	je	SHORT $L70583
	fld	QWORD PTR _num$70572[ebp]
	fcomp	QWORD PTR _vmin$70576[ebp]
	fnstsw	ax
	test	ah, 1
	jne	SHORT $L70582
$L70583:
	cmp	DWORD PTR _cmax$70577[ebp], 0
	je	$L70618
	fld	QWORD PTR _num$70572[ebp]
	fcomp	QWORD PTR _vmax$70580[ebp]
	fnstsw	ax
	test	ah, 65					; 00000041H
	jne	$L70618
$L70582:

; 319  : 				ctrl->error = 2;

	mov	ecx, DWORD PTR _ctrl$[ebp]
	mov	DWORD PTR [ecx+212], 2

; 320  : 				if(ctrl->errmsg) DYNBUF_ADD_STR(&ctrl->errmsg, " - ");

	mov	edx, DWORD PTR _ctrl$[ebp]
	cmp	DWORD PTR [edx+216], 0
	je	SHORT $L70586
	push	0
	push	0
	push	3
	push	OFFSET FLAT:$SG70587
	mov	eax, DWORD PTR _ctrl$[ebp]
	add	eax, 216				; 000000d8H
	push	eax
	call	_dynbuf_add
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L70586
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29872], OFFSET FLAT:$SG70589
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 320		; 00000140H
	jmp	$eva_err$70567
$L70586:

; 321  : 				if(cmin && cmax)

	cmp	DWORD PTR _cmin$70573[ebp], 0
	je	$L70590
	cmp	DWORD PTR _cmax$70577[ebp], 0
	je	$L70590

; 323  : 					DYNBUF_ADD3_CELLP(&ctrl->errmsg, "Valeur entre ", cmin, NO_CONV, " et ");

	mov	eax, DWORD PTR _cmin$70573[ebp]
	mov	DWORD PTR __c$70591[ebp], eax
	cmp	DWORD PTR __c$70591[ebp], 0
	je	SHORT $L70807
	mov	ecx, DWORD PTR __c$70591[ebp]
	mov	edx, DWORD PTR [ecx+4]
	mov	DWORD PTR -116+[ebp], edx
	jmp	SHORT $L70808
$L70807:
	mov	DWORD PTR -116+[ebp], 0
$L70808:
	cmp	DWORD PTR __c$70591[ebp], 0
	je	SHORT $L70809
	mov	eax, DWORD PTR __c$70591[ebp]
	mov	ecx, DWORD PTR [eax]
	mov	DWORD PTR -120+[ebp], ecx
	jmp	SHORT $L70810
$L70809:
	mov	DWORD PTR -120+[ebp], 0
$L70810:
	push	4
	push	OFFSET FLAT:$SG70595
	push	0
	push	0
	mov	edx, DWORD PTR -116+[ebp]
	push	edx
	mov	eax, DWORD PTR -120+[ebp]
	push	eax
	push	13					; 0000000dH
	push	OFFSET FLAT:$SG70596
	mov	ecx, DWORD PTR _ctrl$[ebp]
	add	ecx, 216				; 000000d8H
	push	ecx
	call	_dynbuf_add3
	add	esp, 36					; 00000024H
	test	eax, eax
	je	SHORT $L70594
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29872], OFFSET FLAT:$SG70598
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 323		; 00000143H
	jmp	$eva_err$70567
$L70594:

; 324  : 					DYNBUF_ADD_CELLP(&ctrl->errmsg, cmax, NO_CONV);

	mov	ecx, DWORD PTR _cmax$70577[ebp]
	mov	DWORD PTR __c$70599[ebp], ecx
	cmp	DWORD PTR __c$70599[ebp], 0
	je	SHORT $L70601
	push	0
	push	0
	mov	edx, DWORD PTR __c$70599[ebp]
	mov	eax, DWORD PTR [edx+4]
	push	eax
	mov	ecx, DWORD PTR __c$70599[ebp]
	mov	edx, DWORD PTR [ecx]
	push	edx
	mov	eax, DWORD PTR _ctrl$[ebp]
	add	eax, 216				; 000000d8H
	push	eax
	call	_dynbuf_add
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L70601
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29872], OFFSET FLAT:$SG70603
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 324		; 00000144H
	jmp	$eva_err$70567
$L70601:

; 326  : 				else if(cmin)

	jmp	$L70618
$L70590:
	cmp	DWORD PTR _cmin$70573[ebp], 0
	je	$L70605

; 327  : 					DYNBUF_ADD3_CELLP(&ctrl->errmsg, "Valeur supérieure à ", cmin, NO_CONV, "")

	mov	eax, DWORD PTR _cmin$70573[ebp]
	mov	DWORD PTR __c$70606[ebp], eax
	cmp	DWORD PTR __c$70606[ebp], 0
	je	SHORT $L70811
	mov	ecx, DWORD PTR __c$70606[ebp]
	mov	edx, DWORD PTR [ecx+4]
	mov	DWORD PTR -124+[ebp], edx
	jmp	SHORT $L70812
$L70811:
	mov	DWORD PTR -124+[ebp], 0
$L70812:
	cmp	DWORD PTR __c$70606[ebp], 0
	je	SHORT $L70813
	mov	eax, DWORD PTR __c$70606[ebp]
	mov	ecx, DWORD PTR [eax]
	mov	DWORD PTR -128+[ebp], ecx
	jmp	SHORT $L70814
$L70813:
	mov	DWORD PTR -128+[ebp], 0
$L70814:
	push	0
	push	OFFSET FLAT:$SG70610
	push	0
	push	0
	mov	edx, DWORD PTR -124+[ebp]
	push	edx
	mov	eax, DWORD PTR -128+[ebp]
	push	eax
	push	20					; 00000014H
	push	OFFSET FLAT:$SG70611
	mov	ecx, DWORD PTR _ctrl$[ebp]
	add	ecx, 216				; 000000d8H
	push	ecx
	call	_dynbuf_add3
	add	esp, 36					; 00000024H
	test	eax, eax
	je	SHORT $L70609
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29872], OFFSET FLAT:$SG70613
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 327		; 00000147H
	jmp	$eva_err$70567
$L70609:

; 328  : 				else

	jmp	$L70618
$L70605:

; 329  : 					DYNBUF_ADD3_CELLP(&ctrl->errmsg, "Valeur inférieure à ", cmax, NO_CONV, "")

	mov	ecx, DWORD PTR _cmax$70577[ebp]
	mov	DWORD PTR __c$70615[ebp], ecx
	cmp	DWORD PTR __c$70615[ebp], 0
	je	SHORT $L70815
	mov	edx, DWORD PTR __c$70615[ebp]
	mov	eax, DWORD PTR [edx+4]
	mov	DWORD PTR -132+[ebp], eax
	jmp	SHORT $L70816
$L70815:
	mov	DWORD PTR -132+[ebp], 0
$L70816:
	cmp	DWORD PTR __c$70615[ebp], 0
	je	SHORT $L70817
	mov	ecx, DWORD PTR __c$70615[ebp]
	mov	edx, DWORD PTR [ecx]
	mov	DWORD PTR -136+[ebp], edx
	jmp	SHORT $L70818
$L70817:
	mov	DWORD PTR -136+[ebp], 0
$L70818:
	push	0
	push	OFFSET FLAT:$SG70619
	push	0
	push	0
	mov	eax, DWORD PTR -132+[ebp]
	push	eax
	mov	ecx, DWORD PTR -136+[ebp]
	push	ecx
	push	20					; 00000014H
	push	OFFSET FLAT:$SG70620
	mov	edx, DWORD PTR _ctrl$[ebp]
	add	edx, 216				; 000000d8H
	push	edx
	call	_dynbuf_add3
	add	esp, 36					; 00000024H
	test	eax, eax
	je	SHORT $L70618
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29872], OFFSET FLAT:$SG70622
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 329		; 00000149H
	jmp	$eva_err$70567
$L70618:

; 331  : 		}

	jmp	$L70570
$L70571:

; 332  : 		break;

	jmp	$eva_noerr$70651
$L70623:

; 333  : 
; 334  : 	case HtmlEdit:
; 335  : 	case HtmlPrint:
; 336  : 	case HtmlView:
; 337  : 		/* Add HTML code for control label & position */
; 338  : 		if(ctrl_format_pos(cntxt, ctrl, 1)) STACK_ERROR;

	push	1
	mov	edx, DWORD PTR _ctrl$[ebp]
	push	edx
	mov	eax, DWORD PTR _cntxt$[ebp]
	push	eax
	call	_ctrl_format_pos
	add	esp, 12					; 0000000cH
	test	eax, eax
	je	SHORT $L70624
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 338		; 00000152H
	jmp	$eva_err$70567
$L70624:

; 339  : 
; 340  : 		/* Handle empty value in view mode */
; 341  : 		if(form->step != HtmlEdit && !ctrl->val.nbrows && *ctrl->LABEL_NOSEL) DYNBUF_ADD(form->html, ctrl->LABEL_NOSEL, 0, TO_HTML);

	mov	edx, DWORD PTR _form$[ebp]
	cmp	DWORD PTR [edx+176], 4
	je	SHORT $L70626
	mov	eax, DWORD PTR _ctrl$[ebp]
	cmp	DWORD PTR [eax+64], 0
	jne	SHORT $L70626
	mov	ecx, DWORD PTR _ctrl$[ebp]
	mov	edx, DWORD PTR [ecx+348]
	movsx	eax, BYTE PTR [edx]
	test	eax, eax
	je	SHORT $L70626
	push	1
	push	OFFSET FLAT:_plain_to_html
	push	0
	mov	ecx, DWORD PTR _ctrl$[ebp]
	mov	edx, DWORD PTR [ecx+348]
	push	edx
	mov	eax, DWORD PTR _form$[ebp]
	mov	ecx, DWORD PTR [eax+232]
	push	ecx
	call	_dynbuf_add
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L70626
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29872], OFFSET FLAT:$SG70628
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 341		; 00000155H
	jmp	$eva_err$70567
$L70626:

; 342  : 
; 343  : 		/* Add HTML code for each value */
; 344  : 		k = ctrl->val.nbrows + ((form->step == HtmlEdit && b_multiple) ? 1 : 0);

	mov	ecx, DWORD PTR _form$[ebp]
	cmp	DWORD PTR [ecx+176], 4
	jne	SHORT $L70819
	cmp	DWORD PTR _b_multiple$[ebp], 0
	je	SHORT $L70819
	mov	DWORD PTR -140+[ebp], 1
	jmp	SHORT $L70820
$L70819:
	mov	DWORD PTR -140+[ebp], 0
$L70820:
	mov	edx, DWORD PTR _ctrl$[ebp]
	mov	eax, DWORD PTR [edx+64]
	add	eax, DWORD PTR -140+[ebp]
	mov	DWORD PTR _k$[ebp], eax

; 345  : 		for(i = 0; !i || i < k; i++)

	mov	DWORD PTR _i$[ebp], 0
	jmp	SHORT $L70629
$L70630:
	mov	ecx, DWORD PTR _i$[ebp]
	add	ecx, 1
	mov	DWORD PTR _i$[ebp], ecx
$L70629:
	cmp	DWORD PTR _i$[ebp], 0
	je	SHORT $L70632
	mov	edx, DWORD PTR _i$[ebp]
	cmp	edx, DWORD PTR _k$[ebp]
	jae	$L70631
$L70632:

; 347  : 			/* Separate multiple values with a line break */
; 348  : 			if(i) DYNBUF_ADD_STR(form->html, "<br>");

	cmp	DWORD PTR _i$[ebp], 0
	je	SHORT $L70635
	push	0
	push	0
	push	4
	push	OFFSET FLAT:$SG70636
	mov	eax, DWORD PTR _form$[ebp]
	mov	ecx, DWORD PTR [eax+232]
	push	ecx
	call	_dynbuf_add
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L70635
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29872], OFFSET FLAT:$SG70638
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 348		; 0000015cH
	jmp	$eva_err$70567
$L70635:

; 349  : 
; 350  : 			/* Add text control */
; 351  : 			if(form->step == HtmlEdit)

	mov	ecx, DWORD PTR _form$[ebp]
	cmp	DWORD PTR [ecx+176], 4
	jne	SHORT $L70639

; 353  : 				if(ctrl_add_text_value(cntxt, ctrl, i, DYNTAB_VAL_SZ(&ctrl->val, i, 0), NULL)) STACK_ERROR;

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
	mov	eax, DWORD PTR _i$[ebp]
	push	eax
	mov	ecx, DWORD PTR _ctrl$[ebp]
	push	ecx
	mov	edx, DWORD PTR _cntxt$[ebp]
	push	edx
	call	_ctrl_add_text_value
	add	esp, 24					; 00000018H
	test	eax, eax
	je	SHORT $L70641
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 353		; 00000161H
	jmp	$eva_err$70567
$L70641:

; 355  : 			else

	jmp	$L70647
$L70639:

; 357  : 				/* Calc number value with given format */
; 358  : 				char *fmtval = number_to_format(dyntab_val(&ctrl->val, i, 0), CTRL_ATTR_VAL(FORMAT));

	cmp	DWORD PTR _ctrl$[ebp], 0
	je	SHORT $L70821
	push	0
	push	-1
	push	OFFSET FLAT:$SG70644
	mov	ecx, DWORD PTR _ctrl$[ebp]
	add	ecx, 44					; 0000002cH
	push	ecx
	call	_dyntab_field_val
	add	esp, 16					; 00000010H
	mov	DWORD PTR -144+[ebp], eax
	jmp	SHORT $L70822
$L70821:
	mov	DWORD PTR -144+[ebp], OFFSET FLAT:$SG70645
$L70822:
	mov	edx, DWORD PTR -144+[ebp]
	push	edx
	push	0
	mov	eax, DWORD PTR _i$[ebp]
	push	eax
	mov	ecx, DWORD PTR _ctrl$[ebp]
	add	ecx, 64					; 00000040H
	push	ecx
	call	_dyntab_val
	add	esp, 12					; 0000000cH
	push	eax
	call	_number_to_format
	add	esp, 8
	mov	DWORD PTR _fmtval$70643[ebp], eax

; 359  : 
; 360  : 				if(ctrl_add_text_value(cntxt, ctrl, i, fmtval, strlen(fmtval), NULL)) STACK_ERROR;

	push	0
	mov	edx, DWORD PTR _fmtval$70643[ebp]
	push	edx
	call	_strlen
	add	esp, 4
	push	eax
	mov	eax, DWORD PTR _fmtval$70643[ebp]
	push	eax
	mov	ecx, DWORD PTR _i$[ebp]
	push	ecx
	mov	edx, DWORD PTR _ctrl$[ebp]
	push	edx
	mov	eax, DWORD PTR _cntxt$[ebp]
	push	eax
	call	_ctrl_add_text_value
	add	esp, 24					; 00000018H
	test	eax, eax
	je	SHORT $L70647
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 360		; 00000168H
	jmp	SHORT $eva_err$70567
$L70647:

; 362  : 		}

	jmp	$L70630
$L70631:

; 363  : 
; 364  : 		/* Add HTML code for the control footer */
; 365  : 		if(ctrl_format_pos(cntxt, ctrl, 0)) STACK_ERROR;

	push	0
	mov	edx, DWORD PTR _ctrl$[ebp]
	push	edx
	mov	eax, DWORD PTR _cntxt$[ebp]
	push	eax
	call	_ctrl_format_pos
	add	esp, 12					; 0000000cH
	test	eax, eax
	je	SHORT $L70648
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 365		; 0000016dH
	jmp	SHORT $eva_err$70567
$L70648:

; 366  : 		break;

	jmp	SHORT $eva_noerr$70651
$L70649:

; 367  : 
; 368  : 	default:
; 369  : 		/* Handle as text control */
; 370  : 		if(ctrl_add_text(cntxt, i_ctrl)) STACK_ERROR;

	mov	edx, DWORD PTR _i_ctrl$[ebp]
	push	edx
	mov	eax, DWORD PTR _cntxt$[ebp]
	push	eax
	call	_ctrl_add_text
	add	esp, 8
	test	eax, eax
	je	SHORT $L70650
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 370		; 00000172H
	jmp	SHORT $eva_err$70567
$L70650:
$eva_noerr$70651:

; 372  : 
; 373  : 	RETURN_OK_CLEANUP;

	push	0
	push	OFFSET FLAT:$SG70652
	push	OFFSET FLAT:$SG70653
	mov	edx, DWORD PTR _cntxt$[ebp]
	push	edx
	call	_err_clear
	add	esp, 16					; 00000010H
$eva_err$70567:
	mov	eax, DWORD PTR _cntxt$[ebp]
	cmp	DWORD PTR [eax+29872], 0
	je	SHORT $L70654
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	edx, DWORD PTR [ecx+29900]
	push	edx
	push	OFFSET FLAT:$SG70655
	push	OFFSET FLAT:$SG70656
	mov	eax, DWORD PTR _cntxt$[ebp]
	push	eax
	call	_err_add_context
	add	esp, 16					; 00000010H
$L70654:
	mov	ecx, DWORD PTR _cntxt$[ebp]
	xor	eax, eax
	cmp	DWORD PTR [ecx+29872], 0
	setne	al

; 374  : }

	mov	esp, ebp
	pop	ebp
	ret	0
$L70823:
	DD	$L70554
	DD	$L70649
	DD	$L70568
	DD	$L70649
	DD	$L70623
	DD	$L70649
	DD	$L70623
	DD	$L70623
_ctrl_add_number ENDP
_TEXT	ENDS
PUBLIC	_put_html_chkbox
_DATA	SEGMENT
$SG70682 DB	'<input type=radio', 00H
	ORG $+2
$SG70684 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70689 DB	'<input type=checkbox', 00H
	ORG $+3
$SG70691 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70695 DB	'''', 00H
	ORG $+2
$SG70696 DB	' name=''', 00H
$SG70698 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70701 DB	'''', 00H
	ORG $+2
$SG70702 DB	' value=''', 00H
	ORG $+3
$SG70704 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70708 DB	' checked', 00H
	ORG $+3
$SG70710 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70714 DB	'");''', 00H
	ORG $+3
$SG70715 DB	' onClick=''cb("', 00H
	ORG $+1
$SG70717 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70720 DB	'>', 00H
	ORG $+2
$SG70722 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70724 DB	'D:\Travail\ABI\EVA\V4.0\CGI\Brunix-2016\ctrl_input_basic'
	DB	'.c', 00H
	ORG $+1
$SG70725 DB	'put_html_chkbox', 00H
$SG70727 DB	'D:\Travail\ABI\EVA\V4.0\CGI\Brunix-2016\ctrl_input_basic'
	DB	'.c', 00H
	ORG $+1
$SG70728 DB	'put_html_chkbox', 00H
_DATA	ENDS
_TEXT	SEGMENT
_cntxt$ = 8
_name$ = 12
_sz_name$ = 16
_value$ = 20
_sz_value$ = 24
_b_status$ = 28
_b_submit$ = 32
_html$ = -4
_put_html_chkbox PROC NEAR

; 392  : ){

	push	ebp
	mov	ebp, esp
	sub	esp, 12					; 0000000cH

; 393  : 	CHECK_HTML_STATUS;

	cmp	DWORD PTR _cntxt$[ebp], 0
	je	SHORT $L70828
	mov	eax, DWORD PTR _cntxt$[ebp]
	cmp	DWORD PTR [eax+80], 0
	je	SHORT $L70826
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	edx, DWORD PTR [ecx+80]
	mov	eax, DWORD PTR [edx+232]
	mov	DWORD PTR -8+[ebp], eax
	jmp	SHORT $L70827
$L70826:
	mov	DWORD PTR -8+[ebp], 0
$L70827:
	mov	ecx, DWORD PTR -8+[ebp]
	mov	DWORD PTR -12+[ebp], ecx
	jmp	SHORT $L70829
$L70828:
	mov	DWORD PTR -12+[ebp], 0
$L70829:
	mov	edx, DWORD PTR -12+[ebp]
	mov	DWORD PTR _html$[ebp], edx
	cmp	DWORD PTR _html$[ebp], 0
	jne	SHORT $L70678
	xor	eax, eax
	jmp	$L70674
$L70678:

; 394  : 
; 395  : 	/* Output HTML code for input */
; 396  : 	if(b_status & 2)

	mov	eax, DWORD PTR _b_status$[ebp]
	and	eax, 2
	test	eax, eax
	je	SHORT $L70679

; 397  : 		DYNBUF_ADD_STR(html, "<input type=radio")

	push	0
	push	0
	push	17					; 00000011H
	push	OFFSET FLAT:$SG70682
	mov	ecx, DWORD PTR _html$[ebp]
	push	ecx
	call	_dynbuf_add
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L70681
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29872], OFFSET FLAT:$SG70684
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 397		; 0000018dH
	jmp	$eva_err$70685
$L70681:

; 398  : 	else

	jmp	SHORT $L70688
$L70679:

; 399  : 		DYNBUF_ADD_STR(html, "<input type=checkbox");

	push	0
	push	0
	push	20					; 00000014H
	push	OFFSET FLAT:$SG70689
	mov	ecx, DWORD PTR _html$[ebp]
	push	ecx
	call	_dynbuf_add
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L70688
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29872], OFFSET FLAT:$SG70691
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 399		; 0000018fH
	jmp	$eva_err$70685
$L70688:

; 400  : 	if(name) DYNBUF_ADD3(html, " name='", name, sz_name, NO_CONV, "'");

	cmp	DWORD PTR _name$[ebp], 0
	je	SHORT $L70694
	push	1
	push	OFFSET FLAT:$SG70695
	push	0
	push	0
	mov	ecx, DWORD PTR _sz_name$[ebp]
	push	ecx
	mov	edx, DWORD PTR _name$[ebp]
	push	edx
	push	7
	push	OFFSET FLAT:$SG70696
	mov	eax, DWORD PTR _html$[ebp]
	push	eax
	call	_dynbuf_add3
	add	esp, 36					; 00000024H
	test	eax, eax
	je	SHORT $L70694
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29872], OFFSET FLAT:$SG70698
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 400		; 00000190H
	jmp	$eva_err$70685
$L70694:

; 401  : 	if(value) DYNBUF_ADD3(html, " value='", value, sz_value, HTML_NO_QUOTE, "'");

	cmp	DWORD PTR _value$[ebp], 0
	je	SHORT $L70700
	push	1
	push	OFFSET FLAT:$SG70701
	push	1
	push	OFFSET FLAT:_no_quote
	mov	eax, DWORD PTR _sz_value$[ebp]
	push	eax
	mov	ecx, DWORD PTR _value$[ebp]
	push	ecx
	push	8
	push	OFFSET FLAT:$SG70702
	mov	edx, DWORD PTR _html$[ebp]
	push	edx
	call	_dynbuf_add3
	add	esp, 36					; 00000024H
	test	eax, eax
	je	SHORT $L70700
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29872], OFFSET FLAT:$SG70704
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 401		; 00000191H
	jmp	$eva_err$70685
$L70700:

; 402  : 	if(b_status & 1) DYNBUF_ADD_STR(html, " checked");

	mov	edx, DWORD PTR _b_status$[ebp]
	and	edx, 1
	test	edx, edx
	je	SHORT $L70707
	push	0
	push	0
	push	8
	push	OFFSET FLAT:$SG70708
	mov	eax, DWORD PTR _html$[ebp]
	push	eax
	call	_dynbuf_add
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L70707
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29872], OFFSET FLAT:$SG70710
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 402		; 00000192H
	jmp	$eva_err$70685
$L70707:

; 403  : 	if(b_submit && cntxt->jsenabled) DYNBUF_ADD3(html, " onClick='cb(\"", name, sz_name, NO_CONV, "\");'");

	cmp	DWORD PTR _b_submit$[ebp], 0
	je	SHORT $L70713
	mov	eax, DWORD PTR _cntxt$[ebp]
	cmp	DWORD PTR [eax+29676], 0
	je	SHORT $L70713
	push	4
	push	OFFSET FLAT:$SG70714
	push	0
	push	0
	mov	ecx, DWORD PTR _sz_name$[ebp]
	push	ecx
	mov	edx, DWORD PTR _name$[ebp]
	push	edx
	push	14					; 0000000eH
	push	OFFSET FLAT:$SG70715
	mov	eax, DWORD PTR _html$[ebp]
	push	eax
	call	_dynbuf_add3
	add	esp, 36					; 00000024H
	test	eax, eax
	je	SHORT $L70713
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29872], OFFSET FLAT:$SG70717
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 403		; 00000193H
	jmp	SHORT $eva_err$70685
$L70713:

; 404  : 	DYNBUF_ADD_STR(html, ">");

	push	0
	push	0
	push	1
	push	OFFSET FLAT:$SG70720
	mov	eax, DWORD PTR _html$[ebp]
	push	eax
	call	_dynbuf_add
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L70719
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29872], OFFSET FLAT:$SG70722
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 404		; 00000194H
	jmp	SHORT $eva_err$70685
$L70719:
$eva_noerr$70723:

; 405  : 
; 406  : 	RETURN_OK_CLEANUP;

	push	0
	push	OFFSET FLAT:$SG70724
	push	OFFSET FLAT:$SG70725
	mov	eax, DWORD PTR _cntxt$[ebp]
	push	eax
	call	_err_clear
	add	esp, 16					; 00000010H
$eva_err$70685:
	mov	ecx, DWORD PTR _cntxt$[ebp]
	cmp	DWORD PTR [ecx+29872], 0
	je	SHORT $L70726
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	eax, DWORD PTR [edx+29900]
	push	eax
	push	OFFSET FLAT:$SG70727
	push	OFFSET FLAT:$SG70728
	mov	ecx, DWORD PTR _cntxt$[ebp]
	push	ecx
	call	_err_add_context
	add	esp, 16					; 00000010H
$L70726:
	mov	edx, DWORD PTR _cntxt$[ebp]
	xor	eax, eax
	cmp	DWORD PTR [edx+29872], 0
	setne	al
$L70674:

; 407  : }

	mov	esp, ebp
	pop	ebp
	ret	0
_put_html_chkbox ENDP
_TEXT	ENDS
END
