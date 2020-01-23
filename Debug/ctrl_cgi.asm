	TITLE	D:\Travail\ABI\EVA\V4.0\CGI\Brunix-2016\ctrl_cgi.c
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
PUBLIC	_ctrl_cgi_name
EXTRN	_cgi_build_finalname:NEAR
EXTRN	_dynbuf_add:NEAR
EXTRN	_dyntab_cell:NEAR
EXTRN	_err_add_context:NEAR
EXTRN	_err_clear:NEAR
_DATA	SEGMENT
$SG70228 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70241 DB	'D:\Travail\ABI\EVA\V4.0\CGI\Brunix-2016\ctrl_cgi.c', 00H
	ORG $+1
$SG70242 DB	'ctrl_cgi_name', 00H
	ORG $+2
$SG70244 DB	'D:\Travail\ABI\EVA\V4.0\CGI\Brunix-2016\ctrl_cgi.c', 00H
	ORG $+1
$SG70245 DB	'ctrl_cgi_name', 00H
_DATA	ENDS
_TEXT	SEGMENT
_cntxt$ = 8
_ctrl$ = 12
_val$ = 16
_b_renumber$ = 20
_name$ = 24
_type$ = 28
_subfield$ = 32
_subfield_sz$ = 36
_form$ = -4
_i$ = -8
_num$ = -12
_val$70237 = -16
_ctrl_cgi_name PROC NEAR

; 38   : ){

	push	ebp
	mov	ebp, esp
	sub	esp, 28					; 0000001cH

; 39   : 	EVA_form *form = cntxt->form;

	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	ecx, DWORD PTR [eax+80]
	mov	DWORD PTR _form$[ebp], ecx

; 40   : 	unsigned long i, num = 0;

	mov	DWORD PTR _num$[ebp], 0

; 41   : 
; 42   : 	/* Reset given buffer if not NULL & add control CGI base name */
; 43   : 	if(*name) (*name)->cnt = 0;

	mov	edx, DWORD PTR _name$[ebp]
	cmp	DWORD PTR [edx], 0
	je	SHORT $L70224
	mov	eax, DWORD PTR _name$[ebp]
	mov	ecx, DWORD PTR [eax]
	mov	DWORD PTR [ecx+4], 0
$L70224:

; 44   : 	DYNBUF_ADD_BUF(name, ctrl->cginame, NO_CONV);

	mov	edx, DWORD PTR _ctrl$[ebp]
	cmp	DWORD PTR [edx+40], 0
	je	SHORT $L70226
	push	0
	push	0
	mov	eax, DWORD PTR _ctrl$[ebp]
	mov	ecx, DWORD PTR [eax+40]
	mov	edx, DWORD PTR [ecx+4]
	push	edx
	mov	eax, DWORD PTR _ctrl$[ebp]
	mov	ecx, DWORD PTR [eax+40]
	add	ecx, 8
	push	ecx
	mov	edx, DWORD PTR _name$[ebp]
	push	edx
	call	_dynbuf_add
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L70226
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29872], OFFSET FLAT:$SG70228
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 44		; 0000002cH
	jmp	$eva_err$70229
$L70226:

; 45   : 
; 46   : 	/* Handle value number if applicable */
; 47   : 	if(form->Num && !val)

	mov	edx, DWORD PTR _form$[ebp]
	cmp	DWORD PTR [edx+236], 0
	je	SHORT $L70230
	cmp	DWORD PTR _val$[ebp], 0
	jne	SHORT $L70230

; 48   : 		num = form->Num;

	mov	eax, DWORD PTR _form$[ebp]
	mov	ecx, DWORD PTR [eax+236]
	mov	DWORD PTR _num$[ebp], ecx

; 49   : 	else if(b_renumber && !(val && val->Num))

	jmp	SHORT $L70236
$L70230:
	cmp	DWORD PTR _b_renumber$[ebp], 0
	je	SHORT $L70236
	cmp	DWORD PTR _val$[ebp], 0
	je	SHORT $L70233
	mov	edx, DWORD PTR _val$[ebp]
	cmp	DWORD PTR [edx+36], 0
	jne	SHORT $L70236
$L70233:

; 51   : 		num = 1;

	mov	DWORD PTR _num$[ebp], 1

; 52   : 		for(i = 0; i < ctrl->val.nbrows; i++)

	mov	DWORD PTR _i$[ebp], 0
	jmp	SHORT $L70234
$L70235:
	mov	eax, DWORD PTR _i$[ebp]
	add	eax, 1
	mov	DWORD PTR _i$[ebp], eax
$L70234:
	mov	ecx, DWORD PTR _ctrl$[ebp]
	mov	edx, DWORD PTR _i$[ebp]
	cmp	edx, DWORD PTR [ecx+64]
	jae	SHORT $L70236

; 54   : 			DynTableCell *val = dyntab_cell(&ctrl->val, i, 0);

	push	0
	mov	eax, DWORD PTR _i$[ebp]
	push	eax
	mov	ecx, DWORD PTR _ctrl$[ebp]
	add	ecx, 64					; 00000040H
	push	ecx
	call	_dyntab_cell
	add	esp, 12					; 0000000cH
	mov	DWORD PTR _val$70237[ebp], eax

; 55   : 			if(val->Num >= num) num = val->Num + 1;

	mov	edx, DWORD PTR _val$70237[ebp]
	mov	eax, DWORD PTR [edx+36]
	cmp	eax, DWORD PTR _num$[ebp]
	jb	SHORT $L70238
	mov	ecx, DWORD PTR _val$70237[ebp]
	mov	edx, DWORD PTR [ecx+36]
	add	edx, 1
	mov	DWORD PTR _num$[ebp], edx
$L70238:

; 56   : 		}

	jmp	SHORT $L70235
$L70236:

; 58   : 
; 59   : 	/* Build final name */
; 60   : 	if(cgi_build_finalname(cntxt, name, type, subfield, subfield_sz, 
; 61   : 		(val && val->Num) ? val->Num : num, 
; 62   : 		(val && val->Line) ? val->Line : form->Line, 
; 63   : 		val ? val->Lang : 0)) 

	cmp	DWORD PTR _val$[ebp], 0
	je	SHORT $L70295
	mov	eax, DWORD PTR _val$[ebp]
	mov	ecx, DWORD PTR [eax+44]
	mov	DWORD PTR -20+[ebp], ecx
	jmp	SHORT $L70296
$L70295:
	mov	DWORD PTR -20+[ebp], 0
$L70296:
	cmp	DWORD PTR _val$[ebp], 0
	je	SHORT $L70297
	mov	edx, DWORD PTR _val$[ebp]
	cmp	DWORD PTR [edx+40], 0
	je	SHORT $L70297
	mov	eax, DWORD PTR _val$[ebp]
	mov	ecx, DWORD PTR [eax+40]
	mov	DWORD PTR -24+[ebp], ecx
	jmp	SHORT $L70298
$L70297:
	mov	edx, DWORD PTR _form$[ebp]
	mov	eax, DWORD PTR [edx+240]
	mov	DWORD PTR -24+[ebp], eax
$L70298:
	cmp	DWORD PTR _val$[ebp], 0
	je	SHORT $L70299
	mov	ecx, DWORD PTR _val$[ebp]
	cmp	DWORD PTR [ecx+36], 0
	je	SHORT $L70299
	mov	edx, DWORD PTR _val$[ebp]
	mov	eax, DWORD PTR [edx+36]
	mov	DWORD PTR -28+[ebp], eax
	jmp	SHORT $L70300
$L70299:
	mov	ecx, DWORD PTR _num$[ebp]
	mov	DWORD PTR -28+[ebp], ecx
$L70300:
	mov	edx, DWORD PTR -20+[ebp]
	push	edx
	mov	eax, DWORD PTR -24+[ebp]
	push	eax
	mov	ecx, DWORD PTR -28+[ebp]
	push	ecx
	mov	edx, DWORD PTR _subfield_sz$[ebp]
	push	edx
	mov	eax, DWORD PTR _subfield$[ebp]
	push	eax
	mov	cl, BYTE PTR _type$[ebp]
	push	ecx
	mov	edx, DWORD PTR _name$[ebp]
	push	edx
	mov	eax, DWORD PTR _cntxt$[ebp]
	push	eax
	call	_cgi_build_finalname
	add	esp, 32					; 00000020H
	test	eax, eax
	je	SHORT $eva_noerr$70240

; 64   : 			STACK_ERROR;

	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 64		; 00000040H
	jmp	SHORT $eva_err$70229
$eva_noerr$70240:

; 65   : 
; 66   : 	RETURN_OK_CLEANUP;

	push	0
	push	OFFSET FLAT:$SG70241
	push	OFFSET FLAT:$SG70242
	mov	edx, DWORD PTR _cntxt$[ebp]
	push	edx
	call	_err_clear
	add	esp, 16					; 00000010H
$eva_err$70229:
	mov	eax, DWORD PTR _cntxt$[ebp]
	cmp	DWORD PTR [eax+29872], 0
	je	SHORT $L70243
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	edx, DWORD PTR [ecx+29900]
	push	edx
	push	OFFSET FLAT:$SG70244
	push	OFFSET FLAT:$SG70245
	mov	eax, DWORD PTR _cntxt$[ebp]
	push	eax
	call	_err_add_context
	add	esp, 16					; 00000010H
$L70243:
	mov	ecx, DWORD PTR _cntxt$[ebp]
	xor	eax, eax
	cmp	DWORD PTR [ecx+29872], 0
	setne	al

; 67   : }

	mov	esp, ebp
	pop	ebp
	ret	0
_ctrl_cgi_name ENDP
_TEXT	ENDS
PUBLIC	_ctrl_put_hidden
EXTRN	_mem_free:NEAR
EXTRN	_no_quote:BYTE
EXTRN	_dynbuf_add3:NEAR
EXTRN	_dyntab_sz:NEAR
EXTRN	_dyntab_val:NEAR
EXTRN	_ctrl_put_hidden_old:NEAR
_DATA	SEGMENT
	ORG $+2
$SG70268 DB	'''', 00H
	ORG $+2
$SG70269 DB	'<input type=hidden name=''', 00H
	ORG $+2
$SG70271 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70273 DB	'''>', 00H
	ORG $+1
$SG70274 DB	' value=''', 00H
	ORG $+3
$SG70276 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70280 DB	0aH, 00H
	ORG $+2
$SG70282 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70286 DB	'D:\Travail\ABI\EVA\V4.0\CGI\Brunix-2016\ctrl_cgi.c', 00H
	ORG $+1
$SG70287 DB	'ctrl_put_hidden', 00H
$SG70289 DB	'D:\Travail\ABI\EVA\V4.0\CGI\Brunix-2016\ctrl_cgi.c', 00H
	ORG $+1
$SG70290 DB	'ctrl_put_hidden', 00H
_DATA	ENDS
_TEXT	SEGMENT
_cntxt$ = 8
_ctrl$ = 12
_i$ = 16
_name$ = -8
_html$ = -4
_ctrl_put_hidden PROC NEAR

; 82   : {

	push	ebp
	mov	ebp, esp
	sub	esp, 24					; 00000018H

; 83   : 	DynBuffer *name = NULL;

	mov	DWORD PTR _name$[ebp], 0

; 84   : 	CHECK_HTML_STATUS;

	cmp	DWORD PTR _cntxt$[ebp], 0
	je	SHORT $L70304
	mov	eax, DWORD PTR _cntxt$[ebp]
	cmp	DWORD PTR [eax+80], 0
	je	SHORT $L70302
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	edx, DWORD PTR [ecx+80]
	mov	eax, DWORD PTR [edx+232]
	mov	DWORD PTR -12+[ebp], eax
	jmp	SHORT $L70303
$L70302:
	mov	DWORD PTR -12+[ebp], 0
$L70303:
	mov	ecx, DWORD PTR -12+[ebp]
	mov	DWORD PTR -16+[ebp], ecx
	jmp	SHORT $L70305
$L70304:
	mov	DWORD PTR -16+[ebp], 0
$L70305:
	mov	edx, DWORD PTR -16+[ebp]
	mov	DWORD PTR _html$[ebp], edx
	cmp	DWORD PTR _html$[ebp], 0
	jne	SHORT $L70261
	xor	eax, eax
	jmp	$L70255
$L70261:

; 85   : 
; 86   : 	CTRL_CGINAMEVAL(&name, i);

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
	je	SHORT $L70263
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 86		; 00000056H
	jmp	$eva_err$70264
$L70263:
	mov	eax, DWORD PTR _ctrl$[ebp]
	mov	DWORD PTR [eax+196], 1

; 87   : 	DYNBUF_ADD3_BUF(html, "<input type=hidden name='", name, NO_CONV, "'");

	cmp	DWORD PTR _name$[ebp], 0
	je	SHORT $L70306
	mov	ecx, DWORD PTR _name$[ebp]
	mov	edx, DWORD PTR [ecx+4]
	mov	DWORD PTR -20+[ebp], edx
	jmp	SHORT $L70307
$L70306:
	mov	DWORD PTR -20+[ebp], 0
$L70307:
	cmp	DWORD PTR _name$[ebp], 0
	je	SHORT $L70308
	mov	eax, DWORD PTR _name$[ebp]
	add	eax, 8
	mov	DWORD PTR -24+[ebp], eax
	jmp	SHORT $L70309
$L70308:
	mov	DWORD PTR -24+[ebp], 0
$L70309:
	push	1
	push	OFFSET FLAT:$SG70268
	push	0
	push	0
	mov	ecx, DWORD PTR -20+[ebp]
	push	ecx
	mov	edx, DWORD PTR -24+[ebp]
	push	edx
	push	25					; 00000019H
	push	OFFSET FLAT:$SG70269
	mov	eax, DWORD PTR _html$[ebp]
	push	eax
	call	_dynbuf_add3
	add	esp, 36					; 00000024H
	test	eax, eax
	je	SHORT $L70267
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29872], OFFSET FLAT:$SG70271
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 87		; 00000057H
	jmp	$eva_err$70264
$L70267:

; 88   : 	DYNBUF_ADD3_CELL(html, " value='", &ctrl->val, i, 0, HTML_NO_QUOTE, "'>");

	push	2
	push	OFFSET FLAT:$SG70273
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
	push	8
	push	OFFSET FLAT:$SG70274
	mov	ecx, DWORD PTR _html$[ebp]
	push	ecx
	call	_dynbuf_add3
	add	esp, 36					; 00000024H
	test	eax, eax
	je	SHORT $L70272
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29872], OFFSET FLAT:$SG70276
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 88		; 00000058H
	jmp	$eva_err$70264
$L70272:

; 89   : 	if(cntxt->debug & DEBUG_HTML) DYNBUF_ADD_STR(cntxt->form->html, "\n");

	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	edx, DWORD PTR [ecx+29860]
	and	edx, 128				; 00000080H
	test	edx, edx
	je	SHORT $L70279
	push	0
	push	0
	push	1
	push	OFFSET FLAT:$SG70280
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	ecx, DWORD PTR [eax+80]
	mov	edx, DWORD PTR [ecx+232]
	push	edx
	call	_dynbuf_add
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L70279
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29872], OFFSET FLAT:$SG70282
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 89		; 00000059H
	jmp	SHORT $eva_err$70264
$L70279:

; 90   : 	if(cntxt->form->b_newobj && ctrl_put_hidden_old(cntxt, ctrl, i, name, NULL, 0)) STACK_ERROR;

	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	eax, DWORD PTR [edx+80]
	cmp	DWORD PTR [eax+72], 0
	je	SHORT $eva_noerr$70285
	push	0
	push	0
	mov	ecx, DWORD PTR _name$[ebp]
	push	ecx
	mov	edx, DWORD PTR _i$[ebp]
	push	edx
	mov	eax, DWORD PTR _ctrl$[ebp]
	push	eax
	mov	ecx, DWORD PTR _cntxt$[ebp]
	push	ecx
	call	_ctrl_put_hidden_old
	add	esp, 24					; 00000018H
	test	eax, eax
	je	SHORT $eva_noerr$70285
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 90		; 0000005aH
	jmp	SHORT $eva_err$70264
$eva_noerr$70285:

; 91   : 
; 92   : 	RETURN_OK_CLEANUP;

	push	0
	push	OFFSET FLAT:$SG70286
	push	OFFSET FLAT:$SG70287
	mov	eax, DWORD PTR _cntxt$[ebp]
	push	eax
	call	_err_clear
	add	esp, 16					; 00000010H
$eva_err$70264:
	mov	ecx, DWORD PTR _cntxt$[ebp]
	cmp	DWORD PTR [ecx+29872], 0
	je	SHORT $L70288
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	eax, DWORD PTR [edx+29900]
	push	eax
	push	OFFSET FLAT:$SG70289
	push	OFFSET FLAT:$SG70290
	mov	ecx, DWORD PTR _cntxt$[ebp]
	push	ecx
	call	_err_add_context
	add	esp, 16					; 00000010H
$L70288:
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
$L70255:

; 93   : }

	mov	esp, ebp
	pop	ebp
	ret	0
_ctrl_put_hidden ENDP
_TEXT	ENDS
END
