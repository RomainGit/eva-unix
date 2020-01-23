	TITLE	D:\Travail\ABI\EVA\V4.0\CGI\Brunix-2016\obj_utils.c
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
PUBLIC	_obj_put_html_btn_label
EXTRN	_dynbuf_add:NEAR
EXTRN	_qry_obj_data:NEAR
EXTRN	_dyntab_free:NEAR
EXTRN	_err_add_context:NEAR
EXTRN	_err_clear:NEAR
EXTRN	_ctrl_add_symbol_btn:NEAR
_BSS	SEGMENT
$SG70225 DB	01H DUP (?)
_BSS	ENDS
_DATA	SEGMENT
$SG70215 DB	'<table cellspacing=0 cellpadding=0 border=0 rules=none><'
	DB	'tr>', 00H
$SG70217 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70224 DB	'SYMBOL+LABEL+OBJNOTES', 00H
	ORG $+2
$SG70228 DB	'</tr></table>', 00H
	ORG $+2
$SG70230 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70232 DB	'D:\Travail\ABI\EVA\V4.0\CGI\Brunix-2016\obj_utils.c', 00H
$SG70233 DB	'obj_put_html_btn_label', 00H
	ORG $+1
$SG70235 DB	'D:\Travail\ABI\EVA\V4.0\CGI\Brunix-2016\obj_utils.c', 00H
$SG70236 DB	'obj_put_html_btn_label', 00H
_DATA	ENDS
_TEXT	SEGMENT
_cntxt$ = 8
_id_obj$ = 12
_objdata$ = -24
_html$ = -4
_obj_put_html_btn_label PROC NEAR

; 27   : ){

	push	ebp
	mov	ebp, esp
	sub	esp, 32					; 00000020H

; 28   : 	DynTable objdata = { 0 };

	mov	DWORD PTR _objdata$[ebp], 0
	xor	eax, eax
	mov	DWORD PTR _objdata$[ebp+4], eax
	mov	DWORD PTR _objdata$[ebp+8], eax
	mov	DWORD PTR _objdata$[ebp+12], eax
	mov	DWORD PTR _objdata$[ebp+16], eax

; 29   : 	CHECK_HTML_STATUS;

	cmp	DWORD PTR _cntxt$[ebp], 0
	je	SHORT $L70243
	mov	ecx, DWORD PTR _cntxt$[ebp]
	cmp	DWORD PTR [ecx+80], 0
	je	SHORT $L70241
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	eax, DWORD PTR [edx+80]
	mov	ecx, DWORD PTR [eax+232]
	mov	DWORD PTR -28+[ebp], ecx
	jmp	SHORT $L70242
$L70241:
	mov	DWORD PTR -28+[ebp], 0
$L70242:
	mov	edx, DWORD PTR -28+[ebp]
	mov	DWORD PTR -32+[ebp], edx
	jmp	SHORT $L70244
$L70243:
	mov	DWORD PTR -32+[ebp], 0
$L70244:
	mov	eax, DWORD PTR -32+[ebp]
	mov	DWORD PTR _html$[ebp], eax
	cmp	DWORD PTR _html$[ebp], 0
	jne	SHORT $L70212
	xor	eax, eax
	jmp	$L70207
$L70212:

; 32   : 		"<table cellspacing=0 cellpadding=0 border=0 rules=none><tr>");

	push	0
	push	0
	push	59					; 0000003bH
	push	OFFSET FLAT:$SG70215
	mov	ecx, DWORD PTR _html$[ebp]
	push	ecx
	call	_dynbuf_add
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L70214
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29872], OFFSET FLAT:$SG70217
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 32		; 00000020H
	jmp	$eva_err$70218
$L70214:

; 33   : 	if(qry_obj_data(cntxt, &objdata, id_obj, NULL) ||
; 34   : 		ctrl_add_symbol_btn(cntxt, NULL, NULL, &objdata, 0, "", "SYMBOL+LABEL+OBJNOTES"))

	push	0
	mov	ecx, DWORD PTR _id_obj$[ebp]
	push	ecx
	lea	edx, DWORD PTR _objdata$[ebp]
	push	edx
	mov	eax, DWORD PTR _cntxt$[ebp]
	push	eax
	call	_qry_obj_data
	add	esp, 16					; 00000010H
	test	eax, eax
	jne	SHORT $L70223
	push	OFFSET FLAT:$SG70224
	push	OFFSET FLAT:$SG70225
	push	0
	lea	ecx, DWORD PTR _objdata$[ebp]
	push	ecx
	push	0
	push	0
	mov	edx, DWORD PTR _cntxt$[ebp]
	push	edx
	call	_ctrl_add_symbol_btn
	add	esp, 28					; 0000001cH
	test	eax, eax
	je	SHORT $L70222
$L70223:

; 35   : 		STACK_ERROR;

	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 35		; 00000023H
	jmp	SHORT $eva_err$70218
$L70222:

; 37   : 		"</tr></table>");

	push	0
	push	0
	push	13					; 0000000dH
	push	OFFSET FLAT:$SG70228
	mov	ecx, DWORD PTR _html$[ebp]
	push	ecx
	call	_dynbuf_add
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L70227
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29872], OFFSET FLAT:$SG70230
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 37		; 00000025H
	jmp	SHORT $eva_err$70218
$L70227:
$eva_noerr$70231:

; 38   : 
; 39   : 	RETURN_OK_CLEANUP;

	push	0
	push	OFFSET FLAT:$SG70232
	push	OFFSET FLAT:$SG70233
	mov	ecx, DWORD PTR _cntxt$[ebp]
	push	ecx
	call	_err_clear
	add	esp, 16					; 00000010H
$eva_err$70218:
	mov	edx, DWORD PTR _cntxt$[ebp]
	cmp	DWORD PTR [edx+29872], 0
	je	SHORT $L70234
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	ecx, DWORD PTR [eax+29900]
	push	ecx
	push	OFFSET FLAT:$SG70235
	push	OFFSET FLAT:$SG70236
	mov	edx, DWORD PTR _cntxt$[ebp]
	push	edx
	call	_err_add_context
	add	esp, 16					; 00000010H
$L70234:
	lea	eax, DWORD PTR _objdata$[ebp]
	push	eax
	call	_dyntab_free
	add	esp, 4
	mov	ecx, DWORD PTR _cntxt$[ebp]
	xor	eax, eax
	cmp	DWORD PTR [ecx+29872], 0
	setne	al
$L70207:

; 40   : }

	mov	esp, ebp
	pop	ebp
	ret	0
_obj_put_html_btn_label ENDP
_TEXT	ENDS
END
