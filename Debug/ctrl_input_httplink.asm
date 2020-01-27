	TITLE	D:\Travail\ABI\EVA\V4.0\CGI\Brunix-2016\ctrl_input_httplink.c
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
PUBLIC	_ctrl_add_httplink
EXTRN	__pctype:DWORD
EXTRN	__isctype:NEAR
EXTRN	_ctrl_add_text:NEAR
EXTRN	___mb_cur_max:DWORD
EXTRN	_plain_to_html:BYTE
EXTRN	_no_quote:BYTE
EXTRN	_dynbuf_add:NEAR
EXTRN	_dynbuf_add_int:NEAR
EXTRN	_dynbuf_add3:NEAR
EXTRN	_dyntab_sz:NEAR
EXTRN	_dyntab_val:NEAR
EXTRN	_dyntab_cell:NEAR
EXTRN	_ctrl_format_pos:NEAR
EXTRN	_err_add_context:NEAR
EXTRN	_err_clear:NEAR
EXTRN	_strstr:NEAR
_BSS	SEGMENT
$SG70247 DB	01H DUP (?)
_BSS	ENDS
_DATA	SEGMENT
$SG70222 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70230 DB	'<br>', 00H
	ORG $+3
$SG70232 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70235 DB	'<a href=''', 00H
	ORG $+2
$SG70237 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70239 DB	'://', 00H
$SG70242 DB	'http://', 00H
$SG70244 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70246 DB	''' target=W', 00H
	ORG $+1
$SG70249 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70252 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70256 DB	'</a>', 00H
	ORG $+3
$SG70257 DB	'>', 00H
	ORG $+2
$SG70259 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70264 DB	'D:\Travail\ABI\EVA\V4.0\CGI\Brunix-2016\ctrl_input_httpl'
	DB	'ink.c', 00H
	ORG $+2
$SG70265 DB	'ctrl_add_httplink', 00H
	ORG $+2
$SG70267 DB	'D:\Travail\ABI\EVA\V4.0\CGI\Brunix-2016\ctrl_input_httpl'
	DB	'ink.c', 00H
	ORG $+2
$SG70268 DB	'ctrl_add_httplink', 00H
_DATA	ENDS
_TEXT	SEGMENT
_cntxt$ = 8
_i_ctrl$ = 12
_form$ = -4
_ctrl$ = -12
_i$ = -8
_c$70226 = -16
__c$70253 = -20
_ctrl_add_httplink PROC NEAR

; 25   : ){

	push	ebp
	mov	ebp, esp
	sub	esp, 36					; 00000024H

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

; 28   : 	unsigned long i;
; 29   : 
; 30   : 	switch(form->step)
; 31   : 	{

	mov	edx, DWORD PTR _form$[ebp]
	mov	eax, DWORD PTR [edx+176]
	mov	DWORD PTR -24+[ebp], eax
	cmp	DWORD PTR -24+[ebp], 6
	je	SHORT $L70216
	jmp	$L70261
$L70216:

; 32   : 	case HtmlView:
; 33   : 		/* Output HTTP link */
; 34   : 		if(ctrl_format_pos(cntxt, ctrl, 1)) STACK_ERROR;

	push	1
	mov	ecx, DWORD PTR _ctrl$[ebp]
	push	ecx
	mov	edx, DWORD PTR _cntxt$[ebp]
	push	edx
	call	_ctrl_format_pos
	add	esp, 12					; 0000000cH
	test	eax, eax
	je	SHORT $L70217
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 34		; 00000022H
	jmp	$eva_err$70218
$L70217:

; 35   : 
; 36   : 		/* Handle empty value in view mode */
; 37   : 		if(!ctrl->val.nbrows && ctrl->LABEL_NOSEL) DYNBUF_ADD(form->html, ctrl->LABEL_NOSEL, 0, TO_HTML);

	mov	ecx, DWORD PTR _ctrl$[ebp]
	cmp	DWORD PTR [ecx+64], 0
	jne	SHORT $L70220
	mov	edx, DWORD PTR _ctrl$[ebp]
	cmp	DWORD PTR [edx+348], 0
	je	SHORT $L70220
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
	je	SHORT $L70220
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29872], OFFSET FLAT:$SG70222
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 37		; 00000025H
	jmp	$eva_err$70218
$L70220:

; 38   : 
; 39   : 		/* Add HTML code for each value */
; 40   : 		for(i = 0; i < ctrl->val.nbrows; i++)

	mov	DWORD PTR _i$[ebp], 0
	jmp	SHORT $L70223
$L70224:
	mov	eax, DWORD PTR _i$[ebp]
	add	eax, 1
	mov	DWORD PTR _i$[ebp], eax
$L70223:
	mov	ecx, DWORD PTR _ctrl$[ebp]
	mov	edx, DWORD PTR _i$[ebp]
	cmp	edx, DWORD PTR [ecx+64]
	jae	$L70225

; 42   : 			DynTableCell *c = dyntab_cell(&ctrl->val, i, 0);

	push	0
	mov	eax, DWORD PTR _i$[ebp]
	push	eax
	mov	ecx, DWORD PTR _ctrl$[ebp]
	add	ecx, 64					; 00000040H
	push	ecx
	call	_dyntab_cell
	add	esp, 12					; 0000000cH
	mov	DWORD PTR _c$70226[ebp], eax

; 43   : 
; 44   : 			/* Separate multiple values with a line break */
; 45   : 			if(i) DYNBUF_ADD_STR(form->html, "<br>");

	cmp	DWORD PTR _i$[ebp], 0
	je	SHORT $L70229
	push	0
	push	0
	push	4
	push	OFFSET FLAT:$SG70230
	mov	edx, DWORD PTR _form$[ebp]
	mov	eax, DWORD PTR [edx+232]
	push	eax
	call	_dynbuf_add
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L70229
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29872], OFFSET FLAT:$SG70232
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 45		; 0000002dH
	jmp	$eva_err$70218
$L70229:

; 46   : 
; 47   : 			DYNBUF_ADD_STR(form->html, "<a href='");

	push	0
	push	0
	push	9
	push	OFFSET FLAT:$SG70235
	mov	eax, DWORD PTR _form$[ebp]
	mov	ecx, DWORD PTR [eax+232]
	push	ecx
	call	_dynbuf_add
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L70234
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29872], OFFSET FLAT:$SG70237
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 47		; 0000002fH
	jmp	$eva_err$70218
$L70234:

; 48   : 			if(!strstr(c->txt, "://") && isalpha(c->txt[0])) DYNBUF_ADD_STR(form->html, "http://");

	push	OFFSET FLAT:$SG70239
	mov	ecx, DWORD PTR _c$70226[ebp]
	mov	edx, DWORD PTR [ecx]
	push	edx
	call	_strstr
	add	esp, 8
	test	eax, eax
	jne	$L70241
	cmp	DWORD PTR ___mb_cur_max, 1
	jle	SHORT $L70273
	push	259					; 00000103H
	mov	eax, DWORD PTR _c$70226[ebp]
	mov	ecx, DWORD PTR [eax]
	movsx	edx, BYTE PTR [ecx]
	push	edx
	call	__isctype
	add	esp, 8
	mov	DWORD PTR -28+[ebp], eax
	jmp	SHORT $L70274
$L70273:
	mov	eax, DWORD PTR _c$70226[ebp]
	mov	ecx, DWORD PTR [eax]
	movsx	edx, BYTE PTR [ecx]
	mov	eax, DWORD PTR __pctype
	xor	ecx, ecx
	mov	cx, WORD PTR [eax+edx*2]
	and	ecx, 259				; 00000103H
	mov	DWORD PTR -28+[ebp], ecx
$L70274:
	cmp	DWORD PTR -28+[ebp], 0
	je	SHORT $L70241
	push	0
	push	0
	push	7
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
	mov	DWORD PTR [edx+29900], 48		; 00000030H
	jmp	$eva_err$70218
$L70241:

; 49   : 			DYNBUF_ADD3_CELL(form->html, "", &ctrl->val, i, 0, HTML_NO_QUOTE, "' target=W");

	push	10					; 0000000aH
	push	OFFSET FLAT:$SG70246
	push	1
	push	OFFSET FLAT:_no_quote
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
	push	0
	push	OFFSET FLAT:$SG70247
	mov	ecx, DWORD PTR _form$[ebp]
	mov	edx, DWORD PTR [ecx+232]
	push	edx
	call	_dynbuf_add3
	add	esp, 36					; 00000024H
	test	eax, eax
	je	SHORT $L70245
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29872], OFFSET FLAT:$SG70249
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 49		; 00000031H
	jmp	$eva_err$70218
$L70245:

; 50   : 			DYNBUF_ADD_INT(form->html, c->Pkey);

	mov	edx, DWORD PTR _c$70226[ebp]
	mov	eax, DWORD PTR [edx+16]
	push	eax
	mov	ecx, DWORD PTR _form$[ebp]
	mov	edx, DWORD PTR [ecx+232]
	push	edx
	call	_dynbuf_add_int
	add	esp, 8
	test	eax, eax
	je	SHORT $L70250
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29872], OFFSET FLAT:$SG70252
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 50		; 00000032H
	jmp	$eva_err$70218
$L70250:

; 51   : 			DYNBUF_ADD3_CELLP(form->html, ">", c, TO_HTML, "</a>");

	mov	edx, DWORD PTR _c$70226[ebp]
	mov	DWORD PTR __c$70253[ebp], edx
	cmp	DWORD PTR __c$70253[ebp], 0
	je	SHORT $L70275
	mov	eax, DWORD PTR __c$70253[ebp]
	mov	ecx, DWORD PTR [eax+4]
	mov	DWORD PTR -32+[ebp], ecx
	jmp	SHORT $L70276
$L70275:
	mov	DWORD PTR -32+[ebp], 0
$L70276:
	cmp	DWORD PTR __c$70253[ebp], 0
	je	SHORT $L70277
	mov	edx, DWORD PTR __c$70253[ebp]
	mov	eax, DWORD PTR [edx]
	mov	DWORD PTR -36+[ebp], eax
	jmp	SHORT $L70278
$L70277:
	mov	DWORD PTR -36+[ebp], 0
$L70278:
	push	4
	push	OFFSET FLAT:$SG70256
	push	1
	push	OFFSET FLAT:_plain_to_html
	mov	ecx, DWORD PTR -32+[ebp]
	push	ecx
	mov	edx, DWORD PTR -36+[ebp]
	push	edx
	push	1
	push	OFFSET FLAT:$SG70257
	mov	eax, DWORD PTR _form$[ebp]
	mov	ecx, DWORD PTR [eax+232]
	push	ecx
	call	_dynbuf_add3
	add	esp, 36					; 00000024H
	test	eax, eax
	je	SHORT $L70255
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29872], OFFSET FLAT:$SG70259
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 51		; 00000033H
	jmp	SHORT $eva_err$70218
$L70255:

; 52   : 		}

	jmp	$L70224
$L70225:

; 53   : 		if(ctrl_format_pos(cntxt, ctrl, 0)) STACK_ERROR;

	push	0
	mov	ecx, DWORD PTR _ctrl$[ebp]
	push	ecx
	mov	edx, DWORD PTR _cntxt$[ebp]
	push	edx
	call	_ctrl_format_pos
	add	esp, 12					; 0000000cH
	test	eax, eax
	je	SHORT $L70260
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 53		; 00000035H
	jmp	SHORT $eva_err$70218
$L70260:

; 54   : 		break;

	jmp	SHORT $eva_noerr$70263
$L70261:

; 55   : 
; 56   : 	default:
; 57   : 		/* Handle as text control */
; 58   : 		if(ctrl_add_text(cntxt, i_ctrl)) STACK_ERROR;

	mov	ecx, DWORD PTR _i_ctrl$[ebp]
	push	ecx
	mov	edx, DWORD PTR _cntxt$[ebp]
	push	edx
	call	_ctrl_add_text
	add	esp, 8
	test	eax, eax
	je	SHORT $L70262
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 58		; 0000003aH
	jmp	SHORT $eva_err$70218
$L70262:
$eva_noerr$70263:

; 60   : 	RETURN_OK_CLEANUP;

	push	0
	push	OFFSET FLAT:$SG70264
	push	OFFSET FLAT:$SG70265
	mov	ecx, DWORD PTR _cntxt$[ebp]
	push	ecx
	call	_err_clear
	add	esp, 16					; 00000010H
$eva_err$70218:
	mov	edx, DWORD PTR _cntxt$[ebp]
	cmp	DWORD PTR [edx+29872], 0
	je	SHORT $L70266
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	ecx, DWORD PTR [eax+29900]
	push	ecx
	push	OFFSET FLAT:$SG70267
	push	OFFSET FLAT:$SG70268
	mov	edx, DWORD PTR _cntxt$[ebp]
	push	edx
	call	_err_add_context
	add	esp, 16					; 00000010H
$L70266:
	mov	eax, DWORD PTR _cntxt$[ebp]
	xor	ecx, ecx
	cmp	DWORD PTR [eax+29872], 0
	setne	cl
	mov	eax, ecx

; 61   : }

	mov	esp, ebp
	pop	ebp
	ret	0
_ctrl_add_httplink ENDP
_TEXT	ENDS
END
