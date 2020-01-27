	TITLE	D:\Travail\ABI\EVA\V4.0\CGI\Brunix-2016\ctrl_butn.c
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
PUBLIC	_put_html_button_sz
EXTRN	_get_image_file:NEAR
EXTRN	_mem_free:NEAR
EXTRN	_plain_to_html:BYTE
EXTRN	_html_tooltip:BYTE
EXTRN	_no_quote:BYTE
EXTRN	_javascript_string:BYTE
EXTRN	_dynbuf_add:NEAR
EXTRN	_dynbuf_add3:NEAR
EXTRN	_dynbuf_add3_int:NEAR
EXTRN	_dyntab_sz:NEAR
EXTRN	_dyntab_val:NEAR
EXTRN	_strcmp:NEAR
EXTRN	_put_showhelp:NEAR
EXTRN	_err_add_context:NEAR
EXTRN	_err_clear:NEAR
_BSS	SEGMENT
$SG70289 DB	01H DUP (?)
	ALIGN	4

$SG70294 DB	01H DUP (?)
	ALIGN	4

$SG70299 DB	01H DUP (?)
	ALIGN	4

$SG70358 DB	01H DUP (?)
	ALIGN	4

$SG70364 DB	01H DUP (?)
	ALIGN	4

$SG70370 DB	01H DUP (?)
	ALIGN	4

$SG70432 DB	01H DUP (?)
	ALIGN	4

$SG70438 DB	01H DUP (?)
	ALIGN	4

$SG70444 DB	01H DUP (?)
_BSS	ENDS
_DATA	SEGMENT
$SG70243 DB	0aH, '<!--- Button Start -->', 0aH, 00H
	ORG $+3
$SG70245 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70253 DB	'</script>', 00H
	ORG $+2
$SG70257 DB	'<script>', 00H
	ORG $+3
$SG70259 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70262 DB	'"', 00H
	ORG $+2
$SG70263 DB	'ob("', 00H
	ORG $+3
$SG70265 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70268 DB	'"', 00H
	ORG $+2
$SG70269 DB	',"', 00H
	ORG $+1
$SG70271 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70274 DB	'"', 00H
	ORG $+2
$SG70275 DB	',"', 00H
	ORG $+1
$SG70277 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70279 DB	'"', 00H
	ORG $+2
$SG70280 DB	',"', 00H
	ORG $+1
$SG70282 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70284 DB	'"', 00H
	ORG $+2
$SG70285 DB	',"', 00H
	ORG $+1
$SG70287 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70290 DB	',', 00H
	ORG $+2
$SG70292 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70295 DB	',', 00H
	ORG $+2
$SG70297 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70300 DB	',', 00H
	ORG $+2
$SG70302 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70304 DB	',''', 00H
	ORG $+1
$SG70305 DB	',', 00H
	ORG $+2
$SG70307 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70311 DB	'/', 00H
	ORG $+2
$SG70312 DB	'I', 00H
	ORG $+2
$SG70314 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70318 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70321 DB	'#', 00H
	ORG $+2
$SG70322 DB	'$', 00H
	ORG $+2
$SG70324 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70327 DB	'.'');</script>', 00H
	ORG $+2
$SG70329 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70333 DB	''' target=_blank', 00H
$SG70334 DB	'<a href=''', 00H
	ORG $+2
$SG70336 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70339 DB	'''', 00H
	ORG $+2
$SG70340 DB	' title=''', 00H
	ORG $+3
$SG70342 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70345 DB	'''', 00H
	ORG $+2
$SG70346 DB	' class=''', 00H
	ORG $+3
$SG70348 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70353 DB	'>', 00H
	ORG $+2
$SG70355 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70359 DB	'<img border=', 00H
	ORG $+3
$SG70361 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70365 DB	' width=', 00H
$SG70367 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70371 DB	' height=', 00H
	ORG $+3
$SG70373 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70377 DB	' align=absmiddle', 00H
	ORG $+3
$SG70379 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70381 DB	'''', 00H
	ORG $+2
$SG70382 DB	' src=''', 00H
	ORG $+1
$SG70384 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70387 DB	'''', 00H
	ORG $+2
$SG70388 DB	' img=''', 00H
	ORG $+1
$SG70390 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70392 DB	'''', 00H
	ORG $+2
$SG70393 DB	' img1=''', 00H
$SG70395 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70398 DB	'>', 00H
	ORG $+2
$SG70400 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70404 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70407 DB	'</a>', 00H
	ORG $+3
$SG70409 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70413 DB	'EVABtn', 00H
	ORG $+1
$SG70417 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70422 DB	'<img', 00H
	ORG $+3
$SG70424 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70428 DB	'<input type=image', 00H
	ORG $+2
$SG70430 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70433 DB	' border=', 00H
	ORG $+3
$SG70435 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70439 DB	' width=', 00H
$SG70441 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70445 DB	' height=', 00H
	ORG $+3
$SG70447 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70450 DB	'''', 00H
	ORG $+2
$SG70451 DB	' src=''', 00H
	ORG $+1
$SG70453 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70456 DB	'''', 00H
	ORG $+2
$SG70457 DB	' img=''', 00H
	ORG $+1
$SG70459 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70461 DB	'''', 00H
	ORG $+2
$SG70462 DB	' img1=''', 00H
$SG70464 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70468 DB	'<input type=submit', 00H
	ORG $+1
$SG70470 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70474 DB	' align=absmiddle', 00H
	ORG $+3
$SG70476 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70479 DB	'''', 00H
	ORG $+2
$SG70480 DB	' title=''', 00H
	ORG $+3
$SG70482 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70485 DB	'''', 00H
	ORG $+2
$SG70486 DB	' class=''', 00H
	ORG $+3
$SG70488 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70493 DB	'''', 00H
	ORG $+2
$SG70494 DB	' name=''', 00H
$SG70496 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70500 DB	'''', 00H
	ORG $+2
$SG70501 DB	' alt=''', 00H
	ORG $+1
$SG70503 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70506 DB	'''', 00H
	ORG $+2
$SG70507 DB	' value=''', 00H
	ORG $+3
$SG70509 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70513 DB	' disabled', 00H
	ORG $+2
$SG70515 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70518 DB	'>', 00H
	ORG $+2
$SG70520 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70524 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70528 DB	0aH, '<!--- Button End -->', 0aH, 00H
	ORG $+1
$SG70530 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70532 DB	'D:\Travail\ABI\EVA\V4.0\CGI\Brunix-2016\ctrl_butn.c', 00H
$SG70533 DB	'put_html_button_sz', 00H
	ORG $+1
$SG70535 DB	'D:\Travail\ABI\EVA\V4.0\CGI\Brunix-2016\ctrl_butn.c', 00H
$SG70536 DB	'put_html_button_sz', 00H
_DATA	ENDS
_TEXT	SEGMENT
_cntxt$ = 8
_name$ = 12
_label$ = 16
_im$ = 20
_im1$ = 24
_title$ = 28
_style$ = 32
_width$ = 36
_height$ = 40
_border$ = 44
_mode$ = 48
_img$ = -8
_img1$ = -12
_html$ = -4
_form$70250 = -16
_htm$70251 = -20
_put_html_button_sz PROC NEAR

; 43   : ){

	push	ebp
	mov	ebp, esp
	sub	esp, 36					; 00000024H

; 44   : 	char *img = NULL;

	mov	DWORD PTR _img$[ebp], 0

; 45   : 	char *img1 = NULL;

	mov	DWORD PTR _img1$[ebp], 0

; 46   : 	CHECK_HTML_STATUS;

	cmp	DWORD PTR _cntxt$[ebp], 0
	je	SHORT $L70756
	mov	eax, DWORD PTR _cntxt$[ebp]
	cmp	DWORD PTR [eax+80], 0
	je	SHORT $L70754
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	edx, DWORD PTR [ecx+80]
	mov	eax, DWORD PTR [edx+232]
	mov	DWORD PTR -24+[ebp], eax
	jmp	SHORT $L70755
$L70754:
	mov	DWORD PTR -24+[ebp], 0
$L70755:
	mov	ecx, DWORD PTR -24+[ebp]
	mov	DWORD PTR -28+[ebp], ecx
	jmp	SHORT $L70757
$L70756:
	mov	DWORD PTR -28+[ebp], 0
$L70757:
	mov	edx, DWORD PTR -28+[ebp]
	mov	DWORD PTR _html$[ebp], edx
	cmp	DWORD PTR _html$[ebp], 0
	jne	SHORT $L70234
	xor	eax, eax
	jmp	$L70226
$L70234:

; 47   : 	if(im1 && *im1 && (!im || !*im)) { im = im1; im1 = NULL; }

	cmp	DWORD PTR _im1$[ebp], 0
	je	SHORT $L70235
	mov	eax, DWORD PTR _im1$[ebp]
	movsx	ecx, BYTE PTR [eax]
	test	ecx, ecx
	je	SHORT $L70235
	cmp	DWORD PTR _im$[ebp], 0
	je	SHORT $L70236
	mov	edx, DWORD PTR _im$[ebp]
	movsx	eax, BYTE PTR [edx]
	test	eax, eax
	jne	SHORT $L70235
$L70236:
	mov	ecx, DWORD PTR _im1$[ebp]
	mov	DWORD PTR _im$[ebp], ecx
	mov	DWORD PTR _im1$[ebp], 0
$L70235:

; 48   : 	img = (mode & 32) ? NULL : get_image_file(cntxt, im, &width, &height);

	mov	edx, DWORD PTR _mode$[ebp]
	and	edx, 32					; 00000020H
	test	edx, edx
	je	SHORT $L70758
	mov	DWORD PTR -32+[ebp], 0
	jmp	SHORT $L70759
$L70758:
	lea	eax, DWORD PTR _height$[ebp]
	push	eax
	lea	ecx, DWORD PTR _width$[ebp]
	push	ecx
	mov	edx, DWORD PTR _im$[ebp]
	push	edx
	mov	eax, DWORD PTR _cntxt$[ebp]
	push	eax
	call	_get_image_file
	add	esp, 16					; 00000010H
	mov	DWORD PTR -32+[ebp], eax
$L70759:
	mov	ecx, DWORD PTR -32+[ebp]
	mov	DWORD PTR _img$[ebp], ecx

; 49   : 	img1 = img ? get_image_file(cntxt, im1, 0, 0) : NULL;

	cmp	DWORD PTR _img$[ebp], 0
	je	SHORT $L70760
	push	0
	push	0
	mov	edx, DWORD PTR _im1$[ebp]
	push	edx
	mov	eax, DWORD PTR _cntxt$[ebp]
	push	eax
	call	_get_image_file
	add	esp, 16					; 00000010H
	mov	DWORD PTR -36+[ebp], eax
	jmp	SHORT $L70761
$L70760:
	mov	DWORD PTR -36+[ebp], 0
$L70761:
	mov	ecx, DWORD PTR -36+[ebp]
	mov	DWORD PTR _img1$[ebp], ecx

; 50   : 
; 51   : 	if(cntxt->debug & DEBUG_HTML) DYNBUF_ADD_STR(html, "\n<!--- Button Start -->\n");

	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	eax, DWORD PTR [edx+29860]
	and	eax, 128				; 00000080H
	test	eax, eax
	je	SHORT $L70242
	push	0
	push	0
	push	24					; 00000018H
	push	OFFSET FLAT:$SG70243
	mov	ecx, DWORD PTR _html$[ebp]
	push	ecx
	call	_dynbuf_add
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L70242
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29872], OFFSET FLAT:$SG70245
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 51		; 00000033H
	jmp	$eva_err$70246
$L70242:

; 52   : 
; 53   : 	/* Handle button output mode */
; 54   : 	if(cntxt->jsenabled && !(mode & 3) && ((im && *im && im1 && *im1) || mode & 32))

	mov	ecx, DWORD PTR _cntxt$[ebp]
	cmp	DWORD PTR [ecx+29676], 0
	je	$L70247
	mov	edx, DWORD PTR _mode$[ebp]
	and	edx, 3
	test	edx, edx
	jne	$L70247
	cmp	DWORD PTR _im$[ebp], 0
	je	SHORT $L70249
	mov	eax, DWORD PTR _im$[ebp]
	movsx	ecx, BYTE PTR [eax]
	test	ecx, ecx
	je	SHORT $L70249
	cmp	DWORD PTR _im1$[ebp], 0
	je	SHORT $L70249
	mov	edx, DWORD PTR _im1$[ebp]
	movsx	eax, BYTE PTR [edx]
	test	eax, eax
	jne	SHORT $L70248
$L70249:
	mov	ecx, DWORD PTR _mode$[ebp]
	and	ecx, 32					; 00000020H
	test	ecx, ecx
	je	$L70247
$L70248:

; 56   : 		/* Output javascript for button */
; 57   : 		EVA_form *form = cntxt->form;

	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	eax, DWORD PTR [edx+80]
	mov	DWORD PTR _form$70250[ebp], eax

; 58   : 		DynBuffer *htm = *html;

	mov	ecx, DWORD PTR _html$[ebp]
	mov	edx, DWORD PTR [ecx]
	mov	DWORD PTR _htm$70251[ebp], edx

; 59   : 
; 60   : 		/* Optimize if previous command is javascript */
; 61   : 		if(htm && htm->cnt > 9 && !strcmp(htm->data + htm->cnt - 9, "</script>"))

	cmp	DWORD PTR _htm$70251[ebp], 0
	je	SHORT $L70252
	mov	eax, DWORD PTR _htm$70251[ebp]
	cmp	DWORD PTR [eax+4], 9
	jbe	SHORT $L70252
	push	OFFSET FLAT:$SG70253
	mov	ecx, DWORD PTR _htm$70251[ebp]
	mov	edx, DWORD PTR [ecx+4]
	mov	eax, DWORD PTR _htm$70251[ebp]
	lea	ecx, DWORD PTR [eax+edx-1]
	push	ecx
	call	_strcmp
	add	esp, 8
	test	eax, eax
	jne	SHORT $L70252

; 62   : 			htm->cnt -= 9;

	mov	edx, DWORD PTR _htm$70251[ebp]
	mov	eax, DWORD PTR [edx+4]
	sub	eax, 9
	mov	ecx, DWORD PTR _htm$70251[ebp]
	mov	DWORD PTR [ecx+4], eax

; 63   : 		else

	jmp	SHORT $L70256
$L70252:

; 64   : 			DYNBUF_ADD_STR(html, "<script>");

	push	0
	push	0
	push	8
	push	OFFSET FLAT:$SG70257
	mov	edx, DWORD PTR _html$[ebp]
	push	edx
	call	_dynbuf_add
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L70256
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29872], OFFSET FLAT:$SG70259
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 64		; 00000040H
	jmp	$eva_err$70246
$L70256:

; 65   : 
; 66   : 		/* Use javascript ob function */
; 67   : 		DYNBUF_ADD3(html, "ob(\"", name, 0, NO_CONV, "\"");

	push	1
	push	OFFSET FLAT:$SG70262
	push	0
	push	0
	push	0
	mov	edx, DWORD PTR _name$[ebp]
	push	edx
	push	4
	push	OFFSET FLAT:$SG70263
	mov	eax, DWORD PTR _html$[ebp]
	push	eax
	call	_dynbuf_add3
	add	esp, 36					; 00000024H
	test	eax, eax
	je	SHORT $L70261
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29872], OFFSET FLAT:$SG70265
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 67		; 00000043H
	jmp	$eva_err$70246
$L70261:

; 68   : 		DYNBUF_ADD3(html, ",\"", img, 0, NO_CONV, "\"");

	push	1
	push	OFFSET FLAT:$SG70268
	push	0
	push	0
	push	0
	mov	eax, DWORD PTR _img$[ebp]
	push	eax
	push	2
	push	OFFSET FLAT:$SG70269
	mov	ecx, DWORD PTR _html$[ebp]
	push	ecx
	call	_dynbuf_add3
	add	esp, 36					; 00000024H
	test	eax, eax
	je	SHORT $L70267
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29872], OFFSET FLAT:$SG70271
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 68		; 00000044H
	jmp	$eva_err$70246
$L70267:

; 69   : 		DYNBUF_ADD3(html, ",\"", img1, 0, NO_CONV, "\"");

	push	1
	push	OFFSET FLAT:$SG70274
	push	0
	push	0
	push	0
	mov	ecx, DWORD PTR _img1$[ebp]
	push	ecx
	push	2
	push	OFFSET FLAT:$SG70275
	mov	edx, DWORD PTR _html$[ebp]
	push	edx
	call	_dynbuf_add3
	add	esp, 36					; 00000024H
	test	eax, eax
	je	SHORT $L70273
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29872], OFFSET FLAT:$SG70277
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 69		; 00000045H
	jmp	$eva_err$70246
$L70273:

; 70   : 		DYNBUF_ADD3(html, ",\"", label, 0, TO_JS_STRING, "\"");

	push	1
	push	OFFSET FLAT:$SG70279
	push	1
	push	OFFSET FLAT:_javascript_string
	push	0
	mov	edx, DWORD PTR _label$[ebp]
	push	edx
	push	2
	push	OFFSET FLAT:$SG70280
	mov	eax, DWORD PTR _html$[ebp]
	push	eax
	call	_dynbuf_add3
	add	esp, 36					; 00000024H
	test	eax, eax
	je	SHORT $L70278
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29872], OFFSET FLAT:$SG70282
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 70		; 00000046H
	jmp	$eva_err$70246
$L70278:

; 71   : 		DYNBUF_ADD3(html, ",\"", title, 0, TO_JS_STRING, "\"");

	push	1
	push	OFFSET FLAT:$SG70284
	push	1
	push	OFFSET FLAT:_javascript_string
	push	0
	mov	eax, DWORD PTR _title$[ebp]
	push	eax
	push	2
	push	OFFSET FLAT:$SG70285
	mov	ecx, DWORD PTR _html$[ebp]
	push	ecx
	call	_dynbuf_add3
	add	esp, 36					; 00000024H
	test	eax, eax
	je	SHORT $L70283
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29872], OFFSET FLAT:$SG70287
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 71		; 00000047H
	jmp	$eva_err$70246
$L70283:

; 72   : 		DYNBUF_ADD3_INT(html, ",", border, "");

	push	0
	push	OFFSET FLAT:$SG70289
	mov	ecx, DWORD PTR _border$[ebp]
	push	ecx
	push	1
	push	OFFSET FLAT:$SG70290
	mov	edx, DWORD PTR _html$[ebp]
	push	edx
	call	_dynbuf_add3_int
	add	esp, 24					; 00000018H
	test	eax, eax
	je	SHORT $L70288
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29872], OFFSET FLAT:$SG70292
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 72		; 00000048H
	jmp	$eva_err$70246
$L70288:

; 73   : 		DYNBUF_ADD3_INT(html, ",", mode, "");

	push	0
	push	OFFSET FLAT:$SG70294
	mov	edx, DWORD PTR _mode$[ebp]
	push	edx
	push	1
	push	OFFSET FLAT:$SG70295
	mov	eax, DWORD PTR _html$[ebp]
	push	eax
	call	_dynbuf_add3_int
	add	esp, 24					; 00000018H
	test	eax, eax
	je	SHORT $L70293
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29872], OFFSET FLAT:$SG70297
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 73		; 00000049H
	jmp	$eva_err$70246
$L70293:

; 74   : 		DYNBUF_ADD3_INT(html, ",", width, "");

	push	0
	push	OFFSET FLAT:$SG70299
	mov	eax, DWORD PTR _width$[ebp]
	push	eax
	push	1
	push	OFFSET FLAT:$SG70300
	mov	ecx, DWORD PTR _html$[ebp]
	push	ecx
	call	_dynbuf_add3_int
	add	esp, 24					; 00000018H
	test	eax, eax
	je	SHORT $L70298
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29872], OFFSET FLAT:$SG70302
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 74		; 0000004aH
	jmp	$eva_err$70246
$L70298:

; 75   : 		DYNBUF_ADD3_INT(html, ",", height, ",'");

	push	2
	push	OFFSET FLAT:$SG70304
	mov	ecx, DWORD PTR _height$[ebp]
	push	ecx
	push	1
	push	OFFSET FLAT:$SG70305
	mov	edx, DWORD PTR _html$[ebp]
	push	edx
	call	_dynbuf_add3_int
	add	esp, 24					; 00000018H
	test	eax, eax
	je	SHORT $L70303
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29872], OFFSET FLAT:$SG70307
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 75		; 0000004bH
	jmp	$eva_err$70246
$L70303:

; 76   : 		if(form->nb_ctrl && cntxt->opt_btn_mode > OptBtn_Help)

	mov	edx, DWORD PTR _form$70250[ebp]
	cmp	DWORD PTR [edx+4], 0
	je	$L70320
	mov	eax, DWORD PTR _cntxt$[ebp]
	cmp	DWORD PTR [eax+29588], 1
	jle	$L70320

; 78   : 			DYNBUF_ADD3_CELL(html, "I", &(form->ctrl[form->i_ctrl].id), 0, 0, NO_CONV, "/");

	push	1
	push	OFFSET FLAT:$SG70311
	push	0
	push	0
	push	0
	push	0
	mov	ecx, DWORD PTR _form$70250[ebp]
	mov	edx, DWORD PTR [ecx+8]
	imul	edx, 480				; 000001e0H
	mov	eax, DWORD PTR _form$70250[ebp]
	mov	ecx, DWORD PTR [eax]
	add	ecx, edx
	push	ecx
	call	_dyntab_sz
	add	esp, 12					; 0000000cH
	push	eax
	push	0
	push	0
	mov	edx, DWORD PTR _form$70250[ebp]
	mov	eax, DWORD PTR [edx+8]
	imul	eax, 480				; 000001e0H
	mov	ecx, DWORD PTR _form$70250[ebp]
	mov	edx, DWORD PTR [ecx]
	add	edx, eax
	push	edx
	call	_dyntab_val
	add	esp, 12					; 0000000cH
	push	eax
	push	1
	push	OFFSET FLAT:$SG70312
	mov	eax, DWORD PTR _html$[ebp]
	push	eax
	call	_dynbuf_add3
	add	esp, 36					; 00000024H
	test	eax, eax
	je	SHORT $L70310
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29872], OFFSET FLAT:$SG70314
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 78		; 0000004eH
	jmp	$eva_err$70246
$L70310:

; 79   : 			DYNBUF_ADD_CELL(html, &form->id_form, 0, 0, NO_CONV);

	push	0
	push	0
	push	0
	push	0
	mov	eax, DWORD PTR _form$70250[ebp]
	add	eax, 12					; 0000000cH
	push	eax
	call	_dyntab_sz
	add	esp, 12					; 0000000cH
	push	eax
	push	0
	push	0
	mov	ecx, DWORD PTR _form$70250[ebp]
	add	ecx, 12					; 0000000cH
	push	ecx
	call	_dyntab_val
	add	esp, 12					; 0000000cH
	push	eax
	mov	edx, DWORD PTR _html$[ebp]
	push	edx
	call	_dynbuf_add
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L70316
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29872], OFFSET FLAT:$SG70318
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 79		; 0000004fH
	jmp	$eva_err$70246
$L70316:

; 80   : 			DYNBUF_ADD3_CELL(html, "$", &form->id_obj, 0, 0, NO_CONV, "#");

	push	1
	push	OFFSET FLAT:$SG70321
	push	0
	push	0
	push	0
	push	0
	mov	edx, DWORD PTR _form$70250[ebp]
	add	edx, 32					; 00000020H
	push	edx
	call	_dyntab_sz
	add	esp, 12					; 0000000cH
	push	eax
	push	0
	push	0
	mov	eax, DWORD PTR _form$70250[ebp]
	add	eax, 32					; 00000020H
	push	eax
	call	_dyntab_val
	add	esp, 12					; 0000000cH
	push	eax
	push	1
	push	OFFSET FLAT:$SG70322
	mov	ecx, DWORD PTR _html$[ebp]
	push	ecx
	call	_dynbuf_add3
	add	esp, 36					; 00000024H
	test	eax, eax
	je	SHORT $L70320
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29872], OFFSET FLAT:$SG70324
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 80		; 00000050H
	jmp	$eva_err$70246
$L70320:

; 82   : 		DYNBUF_ADD_STR(html, ".');</script>");

	push	0
	push	0
	push	13					; 0000000dH
	push	OFFSET FLAT:$SG70327
	mov	ecx, DWORD PTR _html$[ebp]
	push	ecx
	call	_dynbuf_add
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L70326
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29872], OFFSET FLAT:$SG70329
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 82		; 00000052H
	jmp	$eva_err$70246
$L70326:

; 84   : 	else if(mode & 64)

	jmp	$L70522
$L70247:
	mov	ecx, DWORD PTR _mode$[ebp]
	and	ecx, 64					; 00000040H
	test	ecx, ecx
	je	$L70331

; 86   : 		/* Output HTML code for button anchor */
; 87   : 		DYNBUF_ADD3(html, "<a href='", name, 0, HTML_NO_QUOTE, "' target=_blank");

	push	15					; 0000000fH
	push	OFFSET FLAT:$SG70333
	push	1
	push	OFFSET FLAT:_no_quote
	push	0
	mov	edx, DWORD PTR _name$[ebp]
	push	edx
	push	9
	push	OFFSET FLAT:$SG70334
	mov	eax, DWORD PTR _html$[ebp]
	push	eax
	call	_dynbuf_add3
	add	esp, 36					; 00000024H
	test	eax, eax
	je	SHORT $L70332
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29872], OFFSET FLAT:$SG70336
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 87		; 00000057H
	jmp	$eva_err$70246
$L70332:

; 88   : 		if(title && *title) DYNBUF_ADD3(html, " title='", title, 0, HTML_TOOLTIP, "'");

	cmp	DWORD PTR _title$[ebp], 0
	je	SHORT $L70338
	mov	eax, DWORD PTR _title$[ebp]
	movsx	ecx, BYTE PTR [eax]
	test	ecx, ecx
	je	SHORT $L70338
	push	1
	push	OFFSET FLAT:$SG70339
	push	1
	push	OFFSET FLAT:_html_tooltip
	push	0
	mov	edx, DWORD PTR _title$[ebp]
	push	edx
	push	8
	push	OFFSET FLAT:$SG70340
	mov	eax, DWORD PTR _html$[ebp]
	push	eax
	call	_dynbuf_add3
	add	esp, 36					; 00000024H
	test	eax, eax
	je	SHORT $L70338
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29872], OFFSET FLAT:$SG70342
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 88		; 00000058H
	jmp	$eva_err$70246
$L70338:

; 89   : 		if(style && *style) DYNBUF_ADD3(html, " class='", style, 0, HTML_NO_QUOTE, "'");

	cmp	DWORD PTR _style$[ebp], 0
	je	SHORT $L70344
	mov	eax, DWORD PTR _style$[ebp]
	movsx	ecx, BYTE PTR [eax]
	test	ecx, ecx
	je	SHORT $L70344
	push	1
	push	OFFSET FLAT:$SG70345
	push	1
	push	OFFSET FLAT:_no_quote
	push	0
	mov	edx, DWORD PTR _style$[ebp]
	push	edx
	push	8
	push	OFFSET FLAT:$SG70346
	mov	eax, DWORD PTR _html$[ebp]
	push	eax
	call	_dynbuf_add3
	add	esp, 36					; 00000024H
	test	eax, eax
	je	SHORT $L70344
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29872], OFFSET FLAT:$SG70348
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 89		; 00000059H
	jmp	$eva_err$70246
$L70344:

; 90   : 		if(!(mode & 1)) if(put_showhelp(cntxt, html)) STACK_ERROR;

	mov	eax, DWORD PTR _mode$[ebp]
	and	eax, 1
	test	eax, eax
	jne	SHORT $L70350
	mov	ecx, DWORD PTR _html$[ebp]
	push	ecx
	mov	edx, DWORD PTR _cntxt$[ebp]
	push	edx
	call	_put_showhelp
	add	esp, 8
	test	eax, eax
	je	SHORT $L70350
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 90		; 0000005aH
	jmp	$eva_err$70246
$L70350:

; 91   : 		DYNBUF_ADD_STR(html, ">");

	push	0
	push	0
	push	1
	push	OFFSET FLAT:$SG70353
	mov	ecx, DWORD PTR _html$[ebp]
	push	ecx
	call	_dynbuf_add
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L70352
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29872], OFFSET FLAT:$SG70355
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 91		; 0000005bH
	jmp	$eva_err$70246
$L70352:

; 92   : 		if(img)

	cmp	DWORD PTR _img$[ebp], 0
	je	$L70356

; 94   : 			DYNBUF_ADD3_INT(html, "<img border=", border, "");

	push	0
	push	OFFSET FLAT:$SG70358
	mov	ecx, DWORD PTR _border$[ebp]
	push	ecx
	push	12					; 0000000cH
	push	OFFSET FLAT:$SG70359
	mov	edx, DWORD PTR _html$[ebp]
	push	edx
	call	_dynbuf_add3_int
	add	esp, 24					; 00000018H
	test	eax, eax
	je	SHORT $L70357
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29872], OFFSET FLAT:$SG70361
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 94		; 0000005eH
	jmp	$eva_err$70246
$L70357:

; 95   : 			if(width) DYNBUF_ADD3_INT(html, " width=", width, "");

	cmp	DWORD PTR _width$[ebp], 0
	je	SHORT $L70363
	push	0
	push	OFFSET FLAT:$SG70364
	mov	edx, DWORD PTR _width$[ebp]
	push	edx
	push	7
	push	OFFSET FLAT:$SG70365
	mov	eax, DWORD PTR _html$[ebp]
	push	eax
	call	_dynbuf_add3_int
	add	esp, 24					; 00000018H
	test	eax, eax
	je	SHORT $L70363
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29872], OFFSET FLAT:$SG70367
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 95		; 0000005fH
	jmp	$eva_err$70246
$L70363:

; 96   : 			if(height) DYNBUF_ADD3_INT(html, " height=", height, "");

	cmp	DWORD PTR _height$[ebp], 0
	je	SHORT $L70369
	push	0
	push	OFFSET FLAT:$SG70370
	mov	eax, DWORD PTR _height$[ebp]
	push	eax
	push	8
	push	OFFSET FLAT:$SG70371
	mov	ecx, DWORD PTR _html$[ebp]
	push	ecx
	call	_dynbuf_add3_int
	add	esp, 24					; 00000018H
	test	eax, eax
	je	SHORT $L70369
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29872], OFFSET FLAT:$SG70373
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 96		; 00000060H
	jmp	$eva_err$70246
$L70369:

; 97   : 			if(mode & 4) DYNBUF_ADD_STR(html, " align=absmiddle");

	mov	ecx, DWORD PTR _mode$[ebp]
	and	ecx, 4
	test	ecx, ecx
	je	SHORT $L70376
	push	0
	push	0
	push	16					; 00000010H
	push	OFFSET FLAT:$SG70377
	mov	edx, DWORD PTR _html$[ebp]
	push	edx
	call	_dynbuf_add
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L70376
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29872], OFFSET FLAT:$SG70379
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 97		; 00000061H
	jmp	$eva_err$70246
$L70376:

; 98   : 			DYNBUF_ADD3(html, " src='", img, 0, HTML_NO_QUOTE, "'");

	push	1
	push	OFFSET FLAT:$SG70381
	push	1
	push	OFFSET FLAT:_no_quote
	push	0
	mov	edx, DWORD PTR _img$[ebp]
	push	edx
	push	6
	push	OFFSET FLAT:$SG70382
	mov	eax, DWORD PTR _html$[ebp]
	push	eax
	call	_dynbuf_add3
	add	esp, 36					; 00000024H
	test	eax, eax
	je	SHORT $L70380
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29872], OFFSET FLAT:$SG70384
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 98		; 00000062H
	jmp	$eva_err$70246
$L70380:

; 99   : 			if(img1)

	cmp	DWORD PTR _img1$[ebp], 0
	je	$L70391

; 101  : 				DYNBUF_ADD3(html, " img='", img1, 0, HTML_NO_QUOTE, "'");

	push	1
	push	OFFSET FLAT:$SG70387
	push	1
	push	OFFSET FLAT:_no_quote
	push	0
	mov	eax, DWORD PTR _img1$[ebp]
	push	eax
	push	6
	push	OFFSET FLAT:$SG70388
	mov	ecx, DWORD PTR _html$[ebp]
	push	ecx
	call	_dynbuf_add3
	add	esp, 36					; 00000024H
	test	eax, eax
	je	SHORT $L70386
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29872], OFFSET FLAT:$SG70390
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 101		; 00000065H
	jmp	$eva_err$70246
$L70386:

; 102  : 				DYNBUF_ADD3(html, " img1='", img1, 0, HTML_NO_QUOTE, "'");

	push	1
	push	OFFSET FLAT:$SG70392
	push	1
	push	OFFSET FLAT:_no_quote
	push	0
	mov	ecx, DWORD PTR _img1$[ebp]
	push	ecx
	push	7
	push	OFFSET FLAT:$SG70393
	mov	edx, DWORD PTR _html$[ebp]
	push	edx
	call	_dynbuf_add3
	add	esp, 36					; 00000024H
	test	eax, eax
	je	SHORT $L70391
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29872], OFFSET FLAT:$SG70395
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 102		; 00000066H
	jmp	$eva_err$70246
$L70391:

; 104  : 			DYNBUF_ADD_STR(html, ">");

	push	0
	push	0
	push	1
	push	OFFSET FLAT:$SG70398
	mov	edx, DWORD PTR _html$[ebp]
	push	edx
	call	_dynbuf_add
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L70397
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29872], OFFSET FLAT:$SG70400
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 104		; 00000068H
	jmp	$eva_err$70246
$L70397:

; 106  : 		else

	jmp	SHORT $L70402
$L70356:

; 107  : 			DYNBUF_ADD(html, label, 0, TO_HTML);

	push	1
	push	OFFSET FLAT:_plain_to_html
	push	0
	mov	edx, DWORD PTR _label$[ebp]
	push	edx
	mov	eax, DWORD PTR _html$[ebp]
	push	eax
	call	_dynbuf_add
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L70402
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29872], OFFSET FLAT:$SG70404
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 107		; 0000006bH
	jmp	$eva_err$70246
$L70402:

; 108  : 		DYNBUF_ADD_STR(html, "</a>");

	push	0
	push	0
	push	4
	push	OFFSET FLAT:$SG70407
	mov	eax, DWORD PTR _html$[ebp]
	push	eax
	call	_dynbuf_add
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L70406
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29872], OFFSET FLAT:$SG70409
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 108		; 0000006cH
	jmp	$eva_err$70246
$L70406:

; 110  : 	else

	jmp	$L70522
$L70331:

; 112  : 		/* Output HTML code for button input */
; 113  : 		if(mode & 32 && (!style || !*style)) style = "EVABtn";

	mov	eax, DWORD PTR _mode$[ebp]
	and	eax, 32					; 00000020H
	test	eax, eax
	je	SHORT $L70411
	cmp	DWORD PTR _style$[ebp], 0
	je	SHORT $L70412
	mov	ecx, DWORD PTR _style$[ebp]
	movsx	edx, BYTE PTR [ecx]
	test	edx, edx
	jne	SHORT $L70411
$L70412:
	mov	DWORD PTR _style$[ebp], OFFSET FLAT:$SG70413
$L70411:

; 114  : 		if(img && mode & 8 && mode & 16) DYNBUF_ADD(html, label, 0, TO_HTML);

	cmp	DWORD PTR _img$[ebp], 0
	je	SHORT $L70415
	mov	eax, DWORD PTR _mode$[ebp]
	and	eax, 8
	test	eax, eax
	je	SHORT $L70415
	mov	ecx, DWORD PTR _mode$[ebp]
	and	ecx, 16					; 00000010H
	test	ecx, ecx
	je	SHORT $L70415
	push	1
	push	OFFSET FLAT:_plain_to_html
	push	0
	mov	edx, DWORD PTR _label$[ebp]
	push	edx
	mov	eax, DWORD PTR _html$[ebp]
	push	eax
	call	_dynbuf_add
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L70415
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29872], OFFSET FLAT:$SG70417
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 114		; 00000072H
	jmp	$eva_err$70246
$L70415:

; 115  : 		if(img)

	cmp	DWORD PTR _img$[ebp], 0
	je	$L70418

; 117  : 			if(mode & 1) DYNBUF_ADD_STR(html, "<img")

	mov	eax, DWORD PTR _mode$[ebp]
	and	eax, 1
	test	eax, eax
	je	SHORT $L70419
	push	0
	push	0
	push	4
	push	OFFSET FLAT:$SG70422
	mov	ecx, DWORD PTR _html$[ebp]
	push	ecx
	call	_dynbuf_add
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L70421
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29872], OFFSET FLAT:$SG70424
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 117		; 00000075H
	jmp	$eva_err$70246
$L70421:

; 118  : 			else DYNBUF_ADD_STR(html, "<input type=image");

	jmp	SHORT $L70427
$L70419:
	push	0
	push	0
	push	17					; 00000011H
	push	OFFSET FLAT:$SG70428
	mov	ecx, DWORD PTR _html$[ebp]
	push	ecx
	call	_dynbuf_add
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L70427
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29872], OFFSET FLAT:$SG70430
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 118		; 00000076H
	jmp	$eva_err$70246
$L70427:

; 119  : 			DYNBUF_ADD3_INT(html, " border=", border, "");

	push	0
	push	OFFSET FLAT:$SG70432
	mov	ecx, DWORD PTR _border$[ebp]
	push	ecx
	push	8
	push	OFFSET FLAT:$SG70433
	mov	edx, DWORD PTR _html$[ebp]
	push	edx
	call	_dynbuf_add3_int
	add	esp, 24					; 00000018H
	test	eax, eax
	je	SHORT $L70431
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29872], OFFSET FLAT:$SG70435
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 119		; 00000077H
	jmp	$eva_err$70246
$L70431:

; 120  : 			if(width) DYNBUF_ADD3_INT(html, " width=", width, "");

	cmp	DWORD PTR _width$[ebp], 0
	je	SHORT $L70437
	push	0
	push	OFFSET FLAT:$SG70438
	mov	edx, DWORD PTR _width$[ebp]
	push	edx
	push	7
	push	OFFSET FLAT:$SG70439
	mov	eax, DWORD PTR _html$[ebp]
	push	eax
	call	_dynbuf_add3_int
	add	esp, 24					; 00000018H
	test	eax, eax
	je	SHORT $L70437
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29872], OFFSET FLAT:$SG70441
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 120		; 00000078H
	jmp	$eva_err$70246
$L70437:

; 121  : 			if(height) DYNBUF_ADD3_INT(html, " height=", height, "");

	cmp	DWORD PTR _height$[ebp], 0
	je	SHORT $L70443
	push	0
	push	OFFSET FLAT:$SG70444
	mov	eax, DWORD PTR _height$[ebp]
	push	eax
	push	8
	push	OFFSET FLAT:$SG70445
	mov	ecx, DWORD PTR _html$[ebp]
	push	ecx
	call	_dynbuf_add3_int
	add	esp, 24					; 00000018H
	test	eax, eax
	je	SHORT $L70443
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29872], OFFSET FLAT:$SG70447
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 121		; 00000079H
	jmp	$eva_err$70246
$L70443:

; 122  : 			DYNBUF_ADD3(html, " src='", img, 0, NO_CONV, "'");

	push	1
	push	OFFSET FLAT:$SG70450
	push	0
	push	0
	push	0
	mov	ecx, DWORD PTR _img$[ebp]
	push	ecx
	push	6
	push	OFFSET FLAT:$SG70451
	mov	edx, DWORD PTR _html$[ebp]
	push	edx
	call	_dynbuf_add3
	add	esp, 36					; 00000024H
	test	eax, eax
	je	SHORT $L70449
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29872], OFFSET FLAT:$SG70453
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 122		; 0000007aH
	jmp	$eva_err$70246
$L70449:

; 123  : 			if(img1)

	cmp	DWORD PTR _img1$[ebp], 0
	je	$L70460

; 125  : 				DYNBUF_ADD3(html, " img='", img1, 0, HTML_NO_QUOTE, "'");

	push	1
	push	OFFSET FLAT:$SG70456
	push	1
	push	OFFSET FLAT:_no_quote
	push	0
	mov	edx, DWORD PTR _img1$[ebp]
	push	edx
	push	6
	push	OFFSET FLAT:$SG70457
	mov	eax, DWORD PTR _html$[ebp]
	push	eax
	call	_dynbuf_add3
	add	esp, 36					; 00000024H
	test	eax, eax
	je	SHORT $L70455
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29872], OFFSET FLAT:$SG70459
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 125		; 0000007dH
	jmp	$eva_err$70246
$L70455:

; 126  : 				DYNBUF_ADD3(html, " img1='", img1, 0, HTML_NO_QUOTE, "'");

	push	1
	push	OFFSET FLAT:$SG70461
	push	1
	push	OFFSET FLAT:_no_quote
	push	0
	mov	eax, DWORD PTR _img1$[ebp]
	push	eax
	push	7
	push	OFFSET FLAT:$SG70462
	mov	ecx, DWORD PTR _html$[ebp]
	push	ecx
	call	_dynbuf_add3
	add	esp, 36					; 00000024H
	test	eax, eax
	je	SHORT $L70460
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29872], OFFSET FLAT:$SG70464
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 126		; 0000007eH
	jmp	$eva_err$70246
$L70460:

; 129  : 		else DYNBUF_ADD_STR(html, "<input type=submit");

	jmp	SHORT $L70467
$L70418:
	push	0
	push	0
	push	18					; 00000012H
	push	OFFSET FLAT:$SG70468
	mov	ecx, DWORD PTR _html$[ebp]
	push	ecx
	call	_dynbuf_add
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L70467
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29872], OFFSET FLAT:$SG70470
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 129		; 00000081H
	jmp	$eva_err$70246
$L70467:

; 130  : 		if(mode & 4) DYNBUF_ADD_STR(html, " align=absmiddle");

	mov	ecx, DWORD PTR _mode$[ebp]
	and	ecx, 4
	test	ecx, ecx
	je	SHORT $L70473
	push	0
	push	0
	push	16					; 00000010H
	push	OFFSET FLAT:$SG70474
	mov	edx, DWORD PTR _html$[ebp]
	push	edx
	call	_dynbuf_add
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L70473
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29872], OFFSET FLAT:$SG70476
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 130		; 00000082H
	jmp	$eva_err$70246
$L70473:

; 131  : 		if(title && *title) DYNBUF_ADD3(html, " title='", title, 0, HTML_TOOLTIP, "'");

	cmp	DWORD PTR _title$[ebp], 0
	je	SHORT $L70478
	mov	edx, DWORD PTR _title$[ebp]
	movsx	eax, BYTE PTR [edx]
	test	eax, eax
	je	SHORT $L70478
	push	1
	push	OFFSET FLAT:$SG70479
	push	1
	push	OFFSET FLAT:_html_tooltip
	push	0
	mov	ecx, DWORD PTR _title$[ebp]
	push	ecx
	push	8
	push	OFFSET FLAT:$SG70480
	mov	edx, DWORD PTR _html$[ebp]
	push	edx
	call	_dynbuf_add3
	add	esp, 36					; 00000024H
	test	eax, eax
	je	SHORT $L70478
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29872], OFFSET FLAT:$SG70482
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 131		; 00000083H
	jmp	$eva_err$70246
$L70478:

; 132  : 		if(style && *style) DYNBUF_ADD3(html, " class='", style, 0, HTML_NO_QUOTE, "'");

	cmp	DWORD PTR _style$[ebp], 0
	je	SHORT $L70484
	mov	edx, DWORD PTR _style$[ebp]
	movsx	eax, BYTE PTR [edx]
	test	eax, eax
	je	SHORT $L70484
	push	1
	push	OFFSET FLAT:$SG70485
	push	1
	push	OFFSET FLAT:_no_quote
	push	0
	mov	ecx, DWORD PTR _style$[ebp]
	push	ecx
	push	8
	push	OFFSET FLAT:$SG70486
	mov	edx, DWORD PTR _html$[ebp]
	push	edx
	call	_dynbuf_add3
	add	esp, 36					; 00000024H
	test	eax, eax
	je	SHORT $L70484
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29872], OFFSET FLAT:$SG70488
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 132		; 00000084H
	jmp	$eva_err$70246
$L70484:

; 133  : 		if(!(mode & 1)) if(put_showhelp(cntxt, html)) STACK_ERROR;

	mov	edx, DWORD PTR _mode$[ebp]
	and	edx, 1
	test	edx, edx
	jne	SHORT $L70490
	mov	eax, DWORD PTR _html$[ebp]
	push	eax
	mov	ecx, DWORD PTR _cntxt$[ebp]
	push	ecx
	call	_put_showhelp
	add	esp, 8
	test	eax, eax
	je	SHORT $L70490
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 133		; 00000085H
	jmp	$eva_err$70246
$L70490:

; 134  : 		DYNBUF_ADD3(html, " name='", name, 0, NO_CONV, "'");

	push	1
	push	OFFSET FLAT:$SG70493
	push	0
	push	0
	push	0
	mov	eax, DWORD PTR _name$[ebp]
	push	eax
	push	7
	push	OFFSET FLAT:$SG70494
	mov	ecx, DWORD PTR _html$[ebp]
	push	ecx
	call	_dynbuf_add3
	add	esp, 36					; 00000024H
	test	eax, eax
	je	SHORT $L70492
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29872], OFFSET FLAT:$SG70496
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 134		; 00000086H
	jmp	$eva_err$70246
$L70492:

; 135  : 		if(label && *label)

	cmp	DWORD PTR _label$[ebp], 0
	je	$L70505
	mov	ecx, DWORD PTR _label$[ebp]
	movsx	edx, BYTE PTR [ecx]
	test	edx, edx
	je	$L70505

; 137  : 			if(img && *img)

	cmp	DWORD PTR _img$[ebp], 0
	je	SHORT $L70498
	mov	eax, DWORD PTR _img$[ebp]
	movsx	ecx, BYTE PTR [eax]
	test	ecx, ecx
	je	SHORT $L70498

; 138  : 				DYNBUF_ADD3(html, " alt='", label, 0, HTML_NO_QUOTE, "'")

	push	1
	push	OFFSET FLAT:$SG70500
	push	1
	push	OFFSET FLAT:_no_quote
	push	0
	mov	edx, DWORD PTR _label$[ebp]
	push	edx
	push	6
	push	OFFSET FLAT:$SG70501
	mov	eax, DWORD PTR _html$[ebp]
	push	eax
	call	_dynbuf_add3
	add	esp, 36					; 00000024H
	test	eax, eax
	je	SHORT $L70499
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29872], OFFSET FLAT:$SG70503
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 138		; 0000008aH
	jmp	$eva_err$70246
$L70499:

; 139  : 			else

	jmp	SHORT $L70505
$L70498:

; 140  : 				DYNBUF_ADD3(html, " value='", label, 0, HTML_NO_QUOTE, "'");

	push	1
	push	OFFSET FLAT:$SG70506
	push	1
	push	OFFSET FLAT:_no_quote
	push	0
	mov	eax, DWORD PTR _label$[ebp]
	push	eax
	push	8
	push	OFFSET FLAT:$SG70507
	mov	ecx, DWORD PTR _html$[ebp]
	push	ecx
	call	_dynbuf_add3
	add	esp, 36					; 00000024H
	test	eax, eax
	je	SHORT $L70505
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29872], OFFSET FLAT:$SG70509
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 140		; 0000008cH
	jmp	$eva_err$70246
$L70505:

; 142  : 		if(mode & 1 && !img) DYNBUF_ADD_STR(html, " disabled");

	mov	ecx, DWORD PTR _mode$[ebp]
	and	ecx, 1
	test	ecx, ecx
	je	SHORT $L70512
	cmp	DWORD PTR _img$[ebp], 0
	jne	SHORT $L70512
	push	0
	push	0
	push	9
	push	OFFSET FLAT:$SG70513
	mov	edx, DWORD PTR _html$[ebp]
	push	edx
	call	_dynbuf_add
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L70512
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29872], OFFSET FLAT:$SG70515
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 142		; 0000008eH
	jmp	$eva_err$70246
$L70512:

; 143  : 		DYNBUF_ADD_STR(html, ">");

	push	0
	push	0
	push	1
	push	OFFSET FLAT:$SG70518
	mov	edx, DWORD PTR _html$[ebp]
	push	edx
	call	_dynbuf_add
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L70517
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29872], OFFSET FLAT:$SG70520
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 143		; 0000008fH
	jmp	$eva_err$70246
$L70517:

; 144  : 		if(img && mode & 8 && !(mode & 16)) DYNBUF_ADD(html, label, 0, TO_HTML);

	cmp	DWORD PTR _img$[ebp], 0
	je	SHORT $L70522
	mov	edx, DWORD PTR _mode$[ebp]
	and	edx, 8
	test	edx, edx
	je	SHORT $L70522
	mov	eax, DWORD PTR _mode$[ebp]
	and	eax, 16					; 00000010H
	test	eax, eax
	jne	SHORT $L70522
	push	1
	push	OFFSET FLAT:_plain_to_html
	push	0
	mov	ecx, DWORD PTR _label$[ebp]
	push	ecx
	mov	edx, DWORD PTR _html$[ebp]
	push	edx
	call	_dynbuf_add
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L70522
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29872], OFFSET FLAT:$SG70524
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 144		; 00000090H
	jmp	SHORT $eva_err$70246
$L70522:

; 146  : 
; 147  : 	if(cntxt->debug & DEBUG_HTML) DYNBUF_ADD_STR(cntxt->form->html, "\n<!--- Button End -->\n");

	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	eax, DWORD PTR [edx+29860]
	and	eax, 128				; 00000080H
	test	eax, eax
	je	SHORT $L70527
	push	0
	push	0
	push	22					; 00000016H
	push	OFFSET FLAT:$SG70528
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	edx, DWORD PTR [ecx+80]
	mov	eax, DWORD PTR [edx+232]
	push	eax
	call	_dynbuf_add
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L70527
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29872], OFFSET FLAT:$SG70530
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 147		; 00000093H
	jmp	SHORT $eva_err$70246
$L70527:
$eva_noerr$70531:

; 148  : 
; 149  : 	RETURN_OK_CLEANUP;

	push	0
	push	OFFSET FLAT:$SG70532
	push	OFFSET FLAT:$SG70533
	mov	eax, DWORD PTR _cntxt$[ebp]
	push	eax
	call	_err_clear
	add	esp, 16					; 00000010H
$eva_err$70246:
	mov	ecx, DWORD PTR _cntxt$[ebp]
	cmp	DWORD PTR [ecx+29872], 0
	je	SHORT $L70534
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	eax, DWORD PTR [edx+29900]
	push	eax
	push	OFFSET FLAT:$SG70535
	push	OFFSET FLAT:$SG70536
	mov	ecx, DWORD PTR _cntxt$[ebp]
	push	ecx
	call	_err_add_context
	add	esp, 16					; 00000010H
$L70534:
	mov	edx, DWORD PTR _img$[ebp]
	push	edx
	call	_mem_free
	add	esp, 4
	mov	DWORD PTR _img$[ebp], 0
	mov	eax, DWORD PTR _img1$[ebp]
	push	eax
	call	_mem_free
	add	esp, 4
	mov	DWORD PTR _img1$[ebp], 0
	mov	ecx, DWORD PTR _cntxt$[ebp]
	xor	eax, eax
	cmp	DWORD PTR [ecx+29872], 0
	setne	al
$L70226:

; 150  : }

	mov	esp, ebp
	pop	ebp
	ret	0
_put_html_button_sz ENDP
_TEXT	ENDS
PUBLIC	_ctrl_put_button
EXTRN	_ctrl_eval_fieldexpr:NEAR
EXTRN	_dyntab_free:NEAR
EXTRN	_dyntab_cell:NEAR
EXTRN	_ctrl_format_pos:NEAR
EXTRN	_dyntab_filter_field:NEAR
EXTRN	_dyntab_field_val:NEAR
EXTRN	_dyntab_field_cell:NEAR
EXTRN	_dyntab_order_lines:NEAR
_BSS	SEGMENT
	ALIGN	4

$SG70710 DB	01H DUP (?)
	ALIGN	4

$SG70718 DB	01H DUP (?)
	ALIGN	4

$SG70561 DB	01H DUP (?)
	ALIGN	4

$SG70564 DB	01H DUP (?)
	ALIGN	4

$SG70567 DB	01H DUP (?)
	ALIGN	4

$SG70570 DB	01H DUP (?)
	ALIGN	4

$SG70579 DB	01H DUP (?)
_BSS	ENDS
_DATA	SEGMENT
	ORG $+1
$SG70560 DB	'_EVA_ACTION', 00H
$SG70563 DB	'_EVA_SHOWMODE', 00H
	ORG $+2
$SG70566 DB	'_EVA_UPDATE', 00H
$SG70569 DB	'_EVA_ACCES_EDIT', 00H
$SG70573 DB	'_EVA_CURRENTOBJ', 00H
$SG70574 DB	'_EVA_UPDATE_OBJFIELD', 00H
	ORG $+3
$SG70576 DB	'_EVA_HTTPLINK', 00H
	ORG $+2
$SG70578 DB	'_EVA_URL', 00H
	ORG $+3
$SG70583 DB	'_EVA_LISTMODE', 00H
	ORG $+2
$SG70586 DB	'_EVA_SEARCHMODE', 00H
$SG70589 DB	'_EVA_STATSMODE', 00H
	ORG $+1
$SG70592 DB	'_EVA_VALUESMODE', 00H
$SG70595 DB	'_EVA_EDITMODE', 00H
	ORG $+2
$SG70598 DB	'_EVA_VIEWMODE', 00H
	ORG $+2
$SG70601 DB	'_EVA_PRINTMODE', 00H
	ORG $+1
$SG70606 DB	'_EVA_PRINTMODE', 00H
	ORG $+1
$SG70608 DB	'_EVA_EDITMODE', 00H
	ORG $+2
$SG70609 DB	'_EVA_SAVE', 00H
	ORG $+2
$SG70610 DB	'_EVA_SAVECLOSE', 00H
	ORG $+1
$SG70612 DB	'_EVA_SAVE', 00H
	ORG $+2
$SG70613 DB	'_EVA_SAVECLOSE', 00H
	ORG $+1
$SG70615 DB	'_EVA_UPDATE', 00H
$SG70617 DB	'_EVA_OPENFORM', 00H
	ORG $+2
$SG70618 DB	'_EVA_NEWOBJ_FIELD', 00H
	ORG $+2
$SG70619 DB	'_EVA_ALWAYS', 00H
$SG70621 DB	'_EVA_NEWOBJ', 00H
$SG70622 DB	'_EVA_COPYOBJ', 00H
	ORG $+3
$SG70624 DB	'_EVA_HIDESELECTED', 00H
	ORG $+2
$SG70625 DB	'_EVA_CLOSE', 00H
	ORG $+1
$SG70628 DB	'_EVA_NewColumn', 00H
	ORG $+1
$SG70630 DB	'_EVA_NONE', 00H
	ORG $+2
$SG70632 DB	'_EVA_NONE', 00H
	ORG $+2
$SG70634 DB	'_EVA_SHOWSELECTED', 00H
	ORG $+2
$SG70637 DB	'_EVA_IMAGESEL', 00H
	ORG $+2
$SG70639 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70643 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70646 DB	'_EVA_IMAGE', 00H
	ORG $+1
$SG70648 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70651 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70655 DB	'_EVA_IMAGE', 00H
	ORG $+1
$SG70657 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70660 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70663 DB	'_EVA_IMAGESEL', 00H
	ORG $+2
$SG70665 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70668 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70671 DB	'_EVA_IMAGE_FILTER', 00H
	ORG $+2
$SG70673 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70676 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70679 DB	'_EVA_IMAGE_LABEL', 00H
	ORG $+3
$SG70681 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70684 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70693 DB	'D:\Travail\ABI\EVA\V4.0\CGI\Brunix-2016\ctrl_butn.c', 00H
$SG70694 DB	'ctrl_put_button', 00H
$SG70698 DB	'0', 00H
	ORG $+2
$SG70702 DB	'_EVA_LABEL', 00H
	ORG $+1
$SG70706 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70711 DB	0aH, 0aH, 00H
	ORG $+1
$SG70713 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70717 DB	'_EVA_CTRL_STYLE', 00H
$SG70720 DB	'D:\Travail\ABI\EVA\V4.0\CGI\Brunix-2016\ctrl_butn.c', 00H
$SG70721 DB	'ctrl_put_button', 00H
$SG70723 DB	'D:\Travail\ABI\EVA\V4.0\CGI\Brunix-2016\ctrl_butn.c', 00H
$SG70724 DB	'ctrl_put_button', 00H
_DATA	ENDS
_TEXT	SEGMENT
_c$70688 = -160
_b_match$70689 = -164
_k$70691 = -168
__c$70700 = -172
_cntxt$ = 8
_i_ctrl$ = 12
_form$ = -32
_ctrl$ = -156
_img$ = -76
_imgsel$ = -28
_cond$ = -100
_condlbl$ = -140
_data$ = -52
_tooltip$ = -144
_jslink$ = -148
_b_formbtn$ = -116
_b_formbtnsel$ = -8
_action$ = -104
_showmode$ = -4
_update$ = -80
_access_edit$ = -112
_b_updatecurobj$ = -56
_b_link$ = -152
_link$ = -108
_i$ = -120
_ctrl_put_button PROC NEAR

; 169  : ){

	push	ebp
	mov	ebp, esp
	sub	esp, 232				; 000000e8H

; 170  : 	EVA_form *form = cntxt->form;

	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	ecx, DWORD PTR [eax+80]
	mov	DWORD PTR _form$[ebp], ecx

; 171  : 	EVA_ctrl *ctrl = form->ctrl + i_ctrl;

	mov	edx, DWORD PTR _i_ctrl$[ebp]
	imul	edx, 480				; 000001e0H
	mov	eax, DWORD PTR _form$[ebp]
	mov	ecx, DWORD PTR [eax]
	add	ecx, edx
	mov	DWORD PTR _ctrl$[ebp], ecx

; 172  : 	DynTable img = {0};

	mov	DWORD PTR _img$[ebp], 0
	xor	edx, edx
	mov	DWORD PTR _img$[ebp+4], edx
	mov	DWORD PTR _img$[ebp+8], edx
	mov	DWORD PTR _img$[ebp+12], edx
	mov	DWORD PTR _img$[ebp+16], edx

; 173  : 	DynTable imgsel = {0};

	mov	DWORD PTR _imgsel$[ebp], 0
	xor	eax, eax
	mov	DWORD PTR _imgsel$[ebp+4], eax
	mov	DWORD PTR _imgsel$[ebp+8], eax
	mov	DWORD PTR _imgsel$[ebp+12], eax
	mov	DWORD PTR _imgsel$[ebp+16], eax

; 174  : 	DynTable cond = {0};

	mov	DWORD PTR _cond$[ebp], 0
	xor	ecx, ecx
	mov	DWORD PTR _cond$[ebp+4], ecx
	mov	DWORD PTR _cond$[ebp+8], ecx
	mov	DWORD PTR _cond$[ebp+12], ecx
	mov	DWORD PTR _cond$[ebp+16], ecx

; 175  : 	DynTable condlbl = {0};

	mov	DWORD PTR _condlbl$[ebp], 0
	xor	edx, edx
	mov	DWORD PTR _condlbl$[ebp+4], edx
	mov	DWORD PTR _condlbl$[ebp+8], edx
	mov	DWORD PTR _condlbl$[ebp+12], edx
	mov	DWORD PTR _condlbl$[ebp+16], edx

; 176  : 	DynTable data = {0};

	mov	DWORD PTR _data$[ebp], 0
	xor	eax, eax
	mov	DWORD PTR _data$[ebp+4], eax
	mov	DWORD PTR _data$[ebp+8], eax
	mov	DWORD PTR _data$[ebp+12], eax
	mov	DWORD PTR _data$[ebp+16], eax

; 177  : 	DynBuffer *tooltip = NULL;

	mov	DWORD PTR _tooltip$[ebp], 0

; 178  : 	DynBuffer *jslink = NULL;

	mov	DWORD PTR _jslink$[ebp], 0

; 179  : 	int b_formbtn = 0;

	mov	DWORD PTR _b_formbtn$[ebp], 0

; 180  : 	int b_formbtnsel = 0;

	mov	DWORD PTR _b_formbtnsel$[ebp], 0

; 181  : 	char *action = CTRL_ATTR_VAL(ACTION);

	cmp	DWORD PTR _ctrl$[ebp], 0
	je	SHORT $L70763
	push	0
	push	-1
	push	OFFSET FLAT:$SG70560
	mov	ecx, DWORD PTR _ctrl$[ebp]
	add	ecx, 44					; 0000002cH
	push	ecx
	call	_dyntab_field_val
	add	esp, 16					; 00000010H
	mov	DWORD PTR -176+[ebp], eax
	jmp	SHORT $L70764
$L70763:
	mov	DWORD PTR -176+[ebp], OFFSET FLAT:$SG70561
$L70764:
	mov	edx, DWORD PTR -176+[ebp]
	mov	DWORD PTR _action$[ebp], edx

; 182  : 	char *showmode = CTRL_ATTR_VAL(SHOWMODE);

	cmp	DWORD PTR _ctrl$[ebp], 0
	je	SHORT $L70765
	push	0
	push	-1
	push	OFFSET FLAT:$SG70563
	mov	eax, DWORD PTR _ctrl$[ebp]
	add	eax, 44					; 0000002cH
	push	eax
	call	_dyntab_field_val
	add	esp, 16					; 00000010H
	mov	DWORD PTR -180+[ebp], eax
	jmp	SHORT $L70766
$L70765:
	mov	DWORD PTR -180+[ebp], OFFSET FLAT:$SG70564
$L70766:
	mov	ecx, DWORD PTR -180+[ebp]
	mov	DWORD PTR _showmode$[ebp], ecx

; 183  : 	char *update = CTRL_ATTR_VAL(UPDATE);

	cmp	DWORD PTR _ctrl$[ebp], 0
	je	SHORT $L70767
	push	0
	push	-1
	push	OFFSET FLAT:$SG70566
	mov	edx, DWORD PTR _ctrl$[ebp]
	add	edx, 44					; 0000002cH
	push	edx
	call	_dyntab_field_val
	add	esp, 16					; 00000010H
	mov	DWORD PTR -184+[ebp], eax
	jmp	SHORT $L70768
$L70767:
	mov	DWORD PTR -184+[ebp], OFFSET FLAT:$SG70567
$L70768:
	mov	eax, DWORD PTR -184+[ebp]
	mov	DWORD PTR _update$[ebp], eax

; 184  : 	char *access_edit = CTRL_ATTR_VAL(ACCES_EDIT);

	cmp	DWORD PTR _ctrl$[ebp], 0
	je	SHORT $L70769
	push	0
	push	-1
	push	OFFSET FLAT:$SG70569
	mov	ecx, DWORD PTR _ctrl$[ebp]
	add	ecx, 44					; 0000002cH
	push	ecx
	call	_dyntab_field_val
	add	esp, 16					; 00000010H
	mov	DWORD PTR -188+[ebp], eax
	jmp	SHORT $L70770
$L70769:
	mov	DWORD PTR -188+[ebp], OFFSET FLAT:$SG70570
$L70770:
	mov	edx, DWORD PTR -188+[ebp]
	mov	DWORD PTR _access_edit$[ebp], edx

; 185  : 	int b_updatecurobj = (!*update || !strcmp(update, "_EVA_CURRENTOBJ")) && !CTRL_ATTR_CELL(UPDATE_OBJFIELD);

	mov	eax, DWORD PTR _update$[ebp]
	movsx	ecx, BYTE PTR [eax]
	test	ecx, ecx
	je	SHORT $L70771
	push	OFFSET FLAT:$SG70573
	mov	edx, DWORD PTR _update$[ebp]
	push	edx
	call	_strcmp
	add	esp, 8
	test	eax, eax
	jne	SHORT $L70774
$L70771:
	cmp	DWORD PTR _ctrl$[ebp], 0
	je	SHORT $L70772
	push	0
	push	-1
	push	OFFSET FLAT:$SG70574
	mov	eax, DWORD PTR _ctrl$[ebp]
	add	eax, 44					; 0000002cH
	push	eax
	call	_dyntab_field_cell
	add	esp, 16					; 00000010H
	mov	DWORD PTR -192+[ebp], eax
	jmp	SHORT $L70773
$L70772:
	mov	DWORD PTR -192+[ebp], 0
$L70773:
	cmp	DWORD PTR -192+[ebp], 0
	jne	SHORT $L70774
	mov	DWORD PTR -196+[ebp], 1
	jmp	SHORT $L70775
$L70774:
	mov	DWORD PTR -196+[ebp], 0
$L70775:
	mov	ecx, DWORD PTR -196+[ebp]
	mov	DWORD PTR _b_updatecurobj$[ebp], ecx

; 186  : 	int b_link = !strcmp(action, "_EVA_HTTPLINK");

	push	OFFSET FLAT:$SG70576
	mov	edx, DWORD PTR _action$[ebp]
	push	edx
	call	_strcmp
	add	esp, 8
	neg	eax
	sbb	eax, eax
	inc	eax
	mov	DWORD PTR _b_link$[ebp], eax

; 187  : 	char *link = CTRL_ATTR_VAL(URL);

	cmp	DWORD PTR _ctrl$[ebp], 0
	je	SHORT $L70776
	push	0
	push	-1
	push	OFFSET FLAT:$SG70578
	mov	eax, DWORD PTR _ctrl$[ebp]
	add	eax, 44					; 0000002cH
	push	eax
	call	_dyntab_field_val
	add	esp, 16					; 00000010H
	mov	DWORD PTR -200+[ebp], eax
	jmp	SHORT $L70777
$L70776:
	mov	DWORD PTR -200+[ebp], OFFSET FLAT:$SG70579
$L70777:
	mov	ecx, DWORD PTR -200+[ebp]
	mov	DWORD PTR _link$[ebp], ecx

; 188  : 	unsigned long i;
; 189  : 
; 190  : 	/* Handle specific buttons for selected mode */
; 191  : #define CHECK_FOR(mode, tag) if(!strcmp(action, "_EVA_"#tag)) { \
; 192  : 								b_formbtn = 1; \
; 193  : 								b_formbtnsel = form->step == mode; }
; 194  : 	CHECK_FOR(FormList, LISTMODE)

	push	OFFSET FLAT:$SG70583
	mov	edx, DWORD PTR _action$[ebp]
	push	edx
	call	_strcmp
	add	esp, 8
	test	eax, eax
	jne	SHORT $L70582
	mov	DWORD PTR _b_formbtn$[ebp], 1
	mov	eax, DWORD PTR _form$[ebp]
	xor	ecx, ecx
	cmp	DWORD PTR [eax+176], 8
	sete	cl
	mov	DWORD PTR _b_formbtnsel$[ebp], ecx

; 195  : 	else CHECK_FOR(FormSearch, SEARCHMODE)

	jmp	$L70600
$L70582:
	push	OFFSET FLAT:$SG70586
	mov	edx, DWORD PTR _action$[ebp]
	push	edx
	call	_strcmp
	add	esp, 8
	test	eax, eax
	jne	SHORT $L70585
	mov	DWORD PTR _b_formbtn$[ebp], 1
	mov	eax, DWORD PTR _form$[ebp]
	xor	ecx, ecx
	cmp	DWORD PTR [eax+176], 9
	sete	cl
	mov	DWORD PTR _b_formbtnsel$[ebp], ecx

; 196  : 	else CHECK_FOR(FormStats, STATSMODE)

	jmp	$L70600
$L70585:
	push	OFFSET FLAT:$SG70589
	mov	edx, DWORD PTR _action$[ebp]
	push	edx
	call	_strcmp
	add	esp, 8
	test	eax, eax
	jne	SHORT $L70588
	mov	DWORD PTR _b_formbtn$[ebp], 1
	mov	eax, DWORD PTR _form$[ebp]
	xor	ecx, ecx
	cmp	DWORD PTR [eax+176], 10			; 0000000aH
	sete	cl
	mov	DWORD PTR _b_formbtnsel$[ebp], ecx

; 197  : 	else CHECK_FOR(FormValues, VALUESMODE)

	jmp	$L70600
$L70588:
	push	OFFSET FLAT:$SG70592
	mov	edx, DWORD PTR _action$[ebp]
	push	edx
	call	_strcmp
	add	esp, 8
	test	eax, eax
	jne	SHORT $L70591
	mov	DWORD PTR _b_formbtn$[ebp], 1
	mov	eax, DWORD PTR _form$[ebp]
	xor	ecx, ecx
	cmp	DWORD PTR [eax+176], 11			; 0000000bH
	sete	cl
	mov	DWORD PTR _b_formbtnsel$[ebp], ecx

; 198  : 	else CHECK_FOR(HtmlEdit, EDITMODE)

	jmp	$L70600
$L70591:
	push	OFFSET FLAT:$SG70595
	mov	edx, DWORD PTR _action$[ebp]
	push	edx
	call	_strcmp
	add	esp, 8
	test	eax, eax
	jne	SHORT $L70594
	mov	DWORD PTR _b_formbtn$[ebp], 1
	mov	eax, DWORD PTR _form$[ebp]
	xor	ecx, ecx
	cmp	DWORD PTR [eax+176], 4
	sete	cl
	mov	DWORD PTR _b_formbtnsel$[ebp], ecx

; 199  : 	else CHECK_FOR(HtmlView, VIEWMODE)

	jmp	SHORT $L70600
$L70594:
	push	OFFSET FLAT:$SG70598
	mov	edx, DWORD PTR _action$[ebp]
	push	edx
	call	_strcmp
	add	esp, 8
	test	eax, eax
	jne	SHORT $L70597
	mov	DWORD PTR _b_formbtn$[ebp], 1
	mov	eax, DWORD PTR _form$[ebp]
	xor	ecx, ecx
	cmp	DWORD PTR [eax+176], 6
	sete	cl
	mov	DWORD PTR _b_formbtnsel$[ebp], ecx

; 200  : 	else CHECK_FOR(HtmlPrint, PRINTMODE)

	jmp	SHORT $L70600
$L70597:
	push	OFFSET FLAT:$SG70601
	mov	edx, DWORD PTR _action$[ebp]
	push	edx
	call	_strcmp
	add	esp, 8
	test	eax, eax
	jne	SHORT $L70600
	mov	DWORD PTR _b_formbtn$[ebp], 1
	mov	eax, DWORD PTR _form$[ebp]
	xor	ecx, ecx
	cmp	DWORD PTR [eax+176], 7
	sete	cl
	mov	DWORD PTR _b_formbtnsel$[ebp], ecx
$L70600:

; 201  : #undef CHECK_FOR
; 202  : 
; 203  : 	/* Do not output buttons depending on mode & status */
; 204  : #define ACTION_IS(tag) (!strcmp(action, "_EVA_"#tag))
; 205  : 	if( /* Only print button in print mode */
; 206  : 		form->step == (HtmlPrint && !ACTION_IS(PRINTMODE)) ||
; 207  : 		/* No edit / save / saveclose button if no edit access for form */
; 208  : 		(!(form->ctrl->access & (form->b_newobj ? AccessCreate : AccessEdit)) &&
; 209  : 			(ACTION_IS(EDITMODE) || ACTION_IS(SAVE) || ACTION_IS(SAVECLOSE))) ||
; 210  : 		/* No save or ungranted update buttons if not editing */
; 211  : 		(form->step != HtmlEdit && (ACTION_IS(SAVE) || ACTION_IS(SAVECLOSE) ||
; 212  : 			(ACTION_IS(UPDATE) && b_updatecurobj && !*access_edit) ||
; 213  : 			(ACTION_IS(OPENFORM) && CTRL_ATTR_CELL(NEWOBJ_FIELD) &&
; 214  : 				!(form->ctrl->access & (form->b_newobj ? AccessCreate : AccessEdit)) &&
; 215  : 				strcmp(access_edit, "_EVA_ALWAYS")))) ||
; 216  : 		/* No new & copy buttons if new object */
; 217  : 		(!form->id_obj.nbrows && (ACTION_IS(NEWOBJ) || ACTION_IS(COPYOBJ))) ||
; 218  : 		/* Hide selected mode button if HIDESELECTED */
; 219  : 		(b_formbtnsel && !strcmp(showmode, "_EVA_HIDESELECTED")) ||
; 220  : 		/* No buttons other than form buttons if mode other than view or edit */
; 221  : 		(!b_formbtn && !ACTION_IS(CLOSE) && form->step != HtmlEdit && form->step != HtmlView)
; 222  : 		)

	mov	edx, 7
	test	edx, edx
	je	SHORT $L70778
	push	OFFSET FLAT:$SG70606
	mov	eax, DWORD PTR _action$[ebp]
	push	eax
	call	_strcmp
	add	esp, 8
	test	eax, eax
	je	SHORT $L70778
	mov	DWORD PTR -204+[ebp], 1
	jmp	SHORT $L70779
$L70778:
	mov	DWORD PTR -204+[ebp], 0
$L70779:
	mov	ecx, DWORD PTR _form$[ebp]
	mov	edx, DWORD PTR [ecx+176]
	cmp	edx, DWORD PTR -204+[ebp]
	je	$L70605
	mov	eax, DWORD PTR _form$[ebp]
	mov	ecx, DWORD PTR [eax]
	mov	edx, DWORD PTR _form$[ebp]
	mov	eax, DWORD PTR [edx+72]
	neg	eax
	sbb	eax, eax
	and	eax, 2
	add	eax, 2
	mov	ecx, DWORD PTR [ecx+184]
	and	ecx, eax
	test	ecx, ecx
	jne	SHORT $L70607
	push	OFFSET FLAT:$SG70608
	mov	edx, DWORD PTR _action$[ebp]
	push	edx
	call	_strcmp
	add	esp, 8
	test	eax, eax
	je	$L70605
	push	OFFSET FLAT:$SG70609
	mov	eax, DWORD PTR _action$[ebp]
	push	eax
	call	_strcmp
	add	esp, 8
	test	eax, eax
	je	$L70605
	push	OFFSET FLAT:$SG70610
	mov	ecx, DWORD PTR _action$[ebp]
	push	ecx
	call	_strcmp
	add	esp, 8
	test	eax, eax
	je	$L70605
$L70607:
	mov	edx, DWORD PTR _form$[ebp]
	cmp	DWORD PTR [edx+176], 4
	je	$L70616
	push	OFFSET FLAT:$SG70612
	mov	eax, DWORD PTR _action$[ebp]
	push	eax
	call	_strcmp
	add	esp, 8
	test	eax, eax
	je	$L70605
	push	OFFSET FLAT:$SG70613
	mov	ecx, DWORD PTR _action$[ebp]
	push	ecx
	call	_strcmp
	add	esp, 8
	test	eax, eax
	je	$L70605
	push	OFFSET FLAT:$SG70615
	mov	edx, DWORD PTR _action$[ebp]
	push	edx
	call	_strcmp
	add	esp, 8
	test	eax, eax
	jne	SHORT $L70614
	cmp	DWORD PTR _b_updatecurobj$[ebp], 0
	je	SHORT $L70614
	mov	eax, DWORD PTR _access_edit$[ebp]
	movsx	ecx, BYTE PTR [eax]
	test	ecx, ecx
	je	$L70605
$L70614:
	push	OFFSET FLAT:$SG70617
	mov	edx, DWORD PTR _action$[ebp]
	push	edx
	call	_strcmp
	add	esp, 8
	test	eax, eax
	jne	SHORT $L70616
	cmp	DWORD PTR _ctrl$[ebp], 0
	je	SHORT $L70780
	push	0
	push	-1
	push	OFFSET FLAT:$SG70618
	mov	eax, DWORD PTR _ctrl$[ebp]
	add	eax, 44					; 0000002cH
	push	eax
	call	_dyntab_field_cell
	add	esp, 16					; 00000010H
	mov	DWORD PTR -208+[ebp], eax
	jmp	SHORT $L70781
$L70780:
	mov	DWORD PTR -208+[ebp], 0
$L70781:
	cmp	DWORD PTR -208+[ebp], 0
	je	SHORT $L70616
	mov	ecx, DWORD PTR _form$[ebp]
	mov	edx, DWORD PTR [ecx]
	mov	eax, DWORD PTR _form$[ebp]
	mov	ecx, DWORD PTR [eax+72]
	neg	ecx
	sbb	ecx, ecx
	and	ecx, 2
	add	ecx, 2
	mov	edx, DWORD PTR [edx+184]
	and	edx, ecx
	test	edx, edx
	jne	SHORT $L70616
	push	OFFSET FLAT:$SG70619
	mov	eax, DWORD PTR _access_edit$[ebp]
	push	eax
	call	_strcmp
	add	esp, 8
	test	eax, eax
	jne	$L70605
$L70616:
	mov	ecx, DWORD PTR _form$[ebp]
	cmp	DWORD PTR [ecx+32], 0
	jne	SHORT $L70620
	push	OFFSET FLAT:$SG70621
	mov	edx, DWORD PTR _action$[ebp]
	push	edx
	call	_strcmp
	add	esp, 8
	test	eax, eax
	je	SHORT $L70605
	push	OFFSET FLAT:$SG70622
	mov	eax, DWORD PTR _action$[ebp]
	push	eax
	call	_strcmp
	add	esp, 8
	test	eax, eax
	je	SHORT $L70605
$L70620:
	cmp	DWORD PTR _b_formbtnsel$[ebp], 0
	je	SHORT $L70623
	push	OFFSET FLAT:$SG70624
	mov	ecx, DWORD PTR _showmode$[ebp]
	push	ecx
	call	_strcmp
	add	esp, 8
	test	eax, eax
	je	SHORT $L70605
$L70623:
	cmp	DWORD PTR _b_formbtn$[ebp], 0
	jne	SHORT $L70604
	push	OFFSET FLAT:$SG70625
	mov	edx, DWORD PTR _action$[ebp]
	push	edx
	call	_strcmp
	add	esp, 8
	test	eax, eax
	je	SHORT $L70604
	mov	eax, DWORD PTR _form$[ebp]
	cmp	DWORD PTR [eax+176], 4
	je	SHORT $L70604
	mov	ecx, DWORD PTR _form$[ebp]
	cmp	DWORD PTR [ecx+176], 6
	je	SHORT $L70604
$L70605:

; 223  : 		RETURN_OK;

	jmp	$eva_noerr$70626
$L70604:

; 224  : #undef ACTION_IS
; 225  : 
; 226  : 	/* Set button default attributes values */
; 227  : 	if(!ctrl->POSITION[0]) ctrl->POSITION = "_EVA_NewColumn";

	mov	edx, DWORD PTR _ctrl$[ebp]
	mov	eax, DWORD PTR [edx+296]
	movsx	ecx, BYTE PTR [eax]
	test	ecx, ecx
	jne	SHORT $L70627
	mov	edx, DWORD PTR _ctrl$[ebp]
	mov	DWORD PTR [edx+296], OFFSET FLAT:$SG70628
$L70627:

; 228  : 	if(!ctrl->LABELPOS[0]) ctrl->LABELPOS = "_EVA_NONE";

	mov	eax, DWORD PTR _ctrl$[ebp]
	mov	ecx, DWORD PTR [eax+292]
	movsx	edx, BYTE PTR [ecx]
	test	edx, edx
	jne	SHORT $L70629
	mov	eax, DWORD PTR _ctrl$[ebp]
	mov	DWORD PTR [eax+292], OFFSET FLAT:$SG70630
$L70629:

; 229  : 	if(!ctrl->OPTIONBUTTON[0]) ctrl->OPTIONBUTTON = "_EVA_NONE";

	mov	ecx, DWORD PTR _ctrl$[ebp]
	mov	edx, DWORD PTR [ecx+336]
	movsx	eax, BYTE PTR [edx]
	test	eax, eax
	jne	SHORT $L70631
	mov	ecx, DWORD PTR _ctrl$[ebp]
	mov	DWORD PTR [ecx+336], OFFSET FLAT:$SG70632
$L70631:

; 230  : 
; 231  : 	/* Switch images if mode selected and display mode is SHOWSELECT */
; 232  : 	if(imgsel.nbrows && img.nbrows && b_formbtnsel && !strcmp(showmode, "_EVA_SHOWSELECTED"))

	cmp	DWORD PTR _imgsel$[ebp], 0
	je	$L70633
	cmp	DWORD PTR _img$[ebp], 0
	je	$L70633
	cmp	DWORD PTR _b_formbtnsel$[ebp], 0
	je	$L70633
	push	OFFSET FLAT:$SG70634
	mov	edx, DWORD PTR _showmode$[ebp]
	push	edx
	call	_strcmp
	add	esp, 8
	test	eax, eax
	jne	$L70633

; 234  : 		CTRL_ATTR_TAB(img, IMAGESEL);

	lea	eax, DWORD PTR _img$[ebp]
	push	eax
	call	_dyntab_free
	add	esp, 4
	push	0
	push	-1
	push	OFFSET FLAT:$SG70637
	mov	ecx, DWORD PTR _ctrl$[ebp]
	add	ecx, 44					; 0000002cH
	push	ecx
	push	0
	lea	edx, DWORD PTR _img$[ebp]
	push	edx
	call	_dyntab_filter_field
	add	esp, 24					; 00000018H
	test	eax, eax
	je	SHORT $L70636
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29872], OFFSET FLAT:$SG70639
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 234		; 000000eaH
	jmp	$eva_err$70640
$L70636:
	lea	edx, DWORD PTR _img$[ebp]
	push	edx
	call	_dyntab_order_lines
	add	esp, 4
	test	eax, eax
	je	SHORT $L70641
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29872], OFFSET FLAT:$SG70643
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 234		; 000000eaH
	jmp	$eva_err$70640
$L70641:

; 235  : 		CTRL_ATTR_TAB(imgsel, IMAGE);

	lea	edx, DWORD PTR _imgsel$[ebp]
	push	edx
	call	_dyntab_free
	add	esp, 4
	push	0
	push	-1
	push	OFFSET FLAT:$SG70646
	mov	eax, DWORD PTR _ctrl$[ebp]
	add	eax, 44					; 0000002cH
	push	eax
	push	0
	lea	ecx, DWORD PTR _imgsel$[ebp]
	push	ecx
	call	_dyntab_filter_field
	add	esp, 24					; 00000018H
	test	eax, eax
	je	SHORT $L70645
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29872], OFFSET FLAT:$SG70648
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 235		; 000000ebH
	jmp	$eva_err$70640
$L70645:
	lea	ecx, DWORD PTR _imgsel$[ebp]
	push	ecx
	call	_dyntab_order_lines
	add	esp, 4
	test	eax, eax
	je	SHORT $L70649
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29872], OFFSET FLAT:$SG70651
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 235		; 000000ebH
	jmp	$eva_err$70640
$L70649:

; 237  : 	else

	jmp	$L70666
$L70633:

; 239  : 		CTRL_ATTR_TAB(img, IMAGE);

	lea	ecx, DWORD PTR _img$[ebp]
	push	ecx
	call	_dyntab_free
	add	esp, 4
	push	0
	push	-1
	push	OFFSET FLAT:$SG70655
	mov	edx, DWORD PTR _ctrl$[ebp]
	add	edx, 44					; 0000002cH
	push	edx
	push	0
	lea	eax, DWORD PTR _img$[ebp]
	push	eax
	call	_dyntab_filter_field
	add	esp, 24					; 00000018H
	test	eax, eax
	je	SHORT $L70654
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29872], OFFSET FLAT:$SG70657
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 239		; 000000efH
	jmp	$eva_err$70640
$L70654:
	lea	eax, DWORD PTR _img$[ebp]
	push	eax
	call	_dyntab_order_lines
	add	esp, 4
	test	eax, eax
	je	SHORT $L70658
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29872], OFFSET FLAT:$SG70660
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 239		; 000000efH
	jmp	$eva_err$70640
$L70658:

; 240  : 		CTRL_ATTR_TAB(imgsel, IMAGESEL);

	lea	eax, DWORD PTR _imgsel$[ebp]
	push	eax
	call	_dyntab_free
	add	esp, 4
	push	0
	push	-1
	push	OFFSET FLAT:$SG70663
	mov	ecx, DWORD PTR _ctrl$[ebp]
	add	ecx, 44					; 0000002cH
	push	ecx
	push	0
	lea	edx, DWORD PTR _imgsel$[ebp]
	push	edx
	call	_dyntab_filter_field
	add	esp, 24					; 00000018H
	test	eax, eax
	je	SHORT $L70662
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29872], OFFSET FLAT:$SG70665
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 240		; 000000f0H
	jmp	$eva_err$70640
$L70662:
	lea	edx, DWORD PTR _imgsel$[ebp]
	push	edx
	call	_dyntab_order_lines
	add	esp, 4
	test	eax, eax
	je	SHORT $L70666
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29872], OFFSET FLAT:$SG70668
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 240		; 000000f0H
	jmp	$eva_err$70640
$L70666:

; 242  : 
; 243  : 	/* Get conditional images */
; 244  : 	CTRL_ATTR_TAB(cond, IMAGE_FILTER);

	lea	edx, DWORD PTR _cond$[ebp]
	push	edx
	call	_dyntab_free
	add	esp, 4
	push	0
	push	-1
	push	OFFSET FLAT:$SG70671
	mov	eax, DWORD PTR _ctrl$[ebp]
	add	eax, 44					; 0000002cH
	push	eax
	push	0
	lea	ecx, DWORD PTR _cond$[ebp]
	push	ecx
	call	_dyntab_filter_field
	add	esp, 24					; 00000018H
	test	eax, eax
	je	SHORT $L70670
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29872], OFFSET FLAT:$SG70673
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 244		; 000000f4H
	jmp	$eva_err$70640
$L70670:
	lea	ecx, DWORD PTR _cond$[ebp]
	push	ecx
	call	_dyntab_order_lines
	add	esp, 4
	test	eax, eax
	je	SHORT $L70674
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29872], OFFSET FLAT:$SG70676
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 244		; 000000f4H
	jmp	$eva_err$70640
$L70674:

; 245  : 	CTRL_ATTR_TAB(condlbl, IMAGE_LABEL);

	lea	ecx, DWORD PTR _condlbl$[ebp]
	push	ecx
	call	_dyntab_free
	add	esp, 4
	push	0
	push	-1
	push	OFFSET FLAT:$SG70679
	mov	edx, DWORD PTR _ctrl$[ebp]
	add	edx, 44					; 0000002cH
	push	edx
	push	0
	lea	eax, DWORD PTR _condlbl$[ebp]
	push	eax
	call	_dyntab_filter_field
	add	esp, 24					; 00000018H
	test	eax, eax
	je	SHORT $L70678
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29872], OFFSET FLAT:$SG70681
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 245		; 000000f5H
	jmp	$eva_err$70640
$L70678:
	lea	eax, DWORD PTR _condlbl$[ebp]
	push	eax
	call	_dyntab_order_lines
	add	esp, 4
	test	eax, eax
	je	SHORT $L70682
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29872], OFFSET FLAT:$SG70684
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 245		; 000000f5H
	jmp	$eva_err$70640
$L70682:

; 246  : 	for(i = 0; i < img.nbrows; i++)

	mov	DWORD PTR _i$[ebp], 0
	jmp	SHORT $L70685
$L70686:
	mov	eax, DWORD PTR _i$[ebp]
	add	eax, 1
	mov	DWORD PTR _i$[ebp], eax
$L70685:
	mov	ecx, DWORD PTR _i$[ebp]
	cmp	ecx, DWORD PTR _img$[ebp]
	jae	$L70687

; 248  : 		char *c = dyntab_val(&cond, i, 0);

	push	0
	mov	edx, DWORD PTR _i$[ebp]
	push	edx
	lea	eax, DWORD PTR _cond$[ebp]
	push	eax
	call	_dyntab_val
	add	esp, 12					; 0000000cH
	mov	DWORD PTR _c$70688[ebp], eax

; 249  : 		int b_match = !*c;

	mov	ecx, DWORD PTR _c$70688[ebp]
	movsx	edx, BYTE PTR [ecx]
	neg	edx
	sbb	edx, edx
	inc	edx
	mov	DWORD PTR _b_match$70689[ebp], edx

; 250  : 		if(!b_match)

	cmp	DWORD PTR _b_match$70689[ebp], 0
	jne	$L70697

; 252  : 			unsigned long k;
; 253  : 			if(ctrl_eval_fieldexpr(cntxt, ctrl, &data, c)) CLEAR_ERROR;

	mov	eax, DWORD PTR _c$70688[ebp]
	push	eax
	lea	ecx, DWORD PTR _data$[ebp]
	push	ecx
	mov	edx, DWORD PTR _ctrl$[ebp]
	push	edx
	mov	eax, DWORD PTR _cntxt$[ebp]
	push	eax
	call	_ctrl_eval_fieldexpr
	add	esp, 16					; 00000010H
	test	eax, eax
	je	SHORT $L70692
	push	253					; 000000fdH
	push	OFFSET FLAT:$SG70693
	push	OFFSET FLAT:$SG70694
	mov	ecx, DWORD PTR _cntxt$[ebp]
	push	ecx
	call	_err_clear
	add	esp, 16					; 00000010H
$L70692:

; 254  : 			for(k = 0; k < data.nbrows && !b_match; k++)

	mov	DWORD PTR _k$70691[ebp], 0
	jmp	SHORT $L70695
$L70696:
	mov	edx, DWORD PTR _k$70691[ebp]
	add	edx, 1
	mov	DWORD PTR _k$70691[ebp], edx
$L70695:
	mov	eax, DWORD PTR _k$70691[ebp]
	cmp	eax, DWORD PTR _data$[ebp]
	jae	SHORT $L70697
	cmp	DWORD PTR _b_match$70689[ebp], 0
	jne	SHORT $L70697

; 255  : 				b_match = dyntab_sz(&data, k, 0) && strcmp("0", dyntab_val(&data, k, 0));

	push	0
	mov	ecx, DWORD PTR _k$70691[ebp]
	push	ecx
	lea	edx, DWORD PTR _data$[ebp]
	push	edx
	call	_dyntab_sz
	add	esp, 12					; 0000000cH
	test	eax, eax
	je	SHORT $L70782
	push	0
	mov	eax, DWORD PTR _k$70691[ebp]
	push	eax
	lea	ecx, DWORD PTR _data$[ebp]
	push	ecx
	call	_dyntab_val
	add	esp, 12					; 0000000cH
	push	eax
	push	OFFSET FLAT:$SG70698
	call	_strcmp
	add	esp, 8
	test	eax, eax
	je	SHORT $L70782
	mov	DWORD PTR -212+[ebp], 1
	jmp	SHORT $L70783
$L70782:
	mov	DWORD PTR -212+[ebp], 0
$L70783:
	mov	edx, DWORD PTR -212+[ebp]
	mov	DWORD PTR _b_match$70689[ebp], edx
	jmp	$L70696
$L70697:

; 257  : 		if(b_match) break;

	cmp	DWORD PTR _b_match$70689[ebp], 0
	je	SHORT $L70699
	jmp	SHORT $L70687
$L70699:

; 258  : 	}

	jmp	$L70686
$L70687:

; 259  : 
; 260  : 	/* Build button tooltip */
; 261  : 	DYNBUF_ADD_CELLP(&tooltip, dyntab_sz(&condlbl, i, 0) ? dyntab_cell(&condlbl, i, 0) : CTRL_ATTR_CELL(LABEL), NO_CONV);

	push	0
	mov	eax, DWORD PTR _i$[ebp]
	push	eax
	lea	ecx, DWORD PTR _condlbl$[ebp]
	push	ecx
	call	_dyntab_sz
	add	esp, 12					; 0000000cH
	test	eax, eax
	je	SHORT $L70786
	push	0
	mov	edx, DWORD PTR _i$[ebp]
	push	edx
	lea	eax, DWORD PTR _condlbl$[ebp]
	push	eax
	call	_dyntab_cell
	add	esp, 12					; 0000000cH
	mov	DWORD PTR -216+[ebp], eax
	jmp	SHORT $L70787
$L70786:
	cmp	DWORD PTR _ctrl$[ebp], 0
	je	SHORT $L70784
	push	0
	push	-1
	push	OFFSET FLAT:$SG70702
	mov	ecx, DWORD PTR _ctrl$[ebp]
	add	ecx, 44					; 0000002cH
	push	ecx
	call	_dyntab_field_cell
	add	esp, 16					; 00000010H
	mov	DWORD PTR -220+[ebp], eax
	jmp	SHORT $L70785
$L70784:
	mov	DWORD PTR -220+[ebp], 0
$L70785:
	mov	edx, DWORD PTR -220+[ebp]
	mov	DWORD PTR -216+[ebp], edx
$L70787:
	mov	eax, DWORD PTR -216+[ebp]
	mov	DWORD PTR __c$70700[ebp], eax
	cmp	DWORD PTR __c$70700[ebp], 0
	je	SHORT $L70704
	push	0
	push	0
	mov	ecx, DWORD PTR __c$70700[ebp]
	mov	edx, DWORD PTR [ecx+4]
	push	edx
	mov	eax, DWORD PTR __c$70700[ebp]
	mov	ecx, DWORD PTR [eax]
	push	ecx
	lea	edx, DWORD PTR _tooltip$[ebp]
	push	edx
	call	_dynbuf_add
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L70704
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29872], OFFSET FLAT:$SG70706
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 261		; 00000105H
	jmp	$eva_err$70640
$L70704:

; 262  : 	if(ctrl->NOTES && *ctrl->NOTES) DYNBUF_ADD3(&tooltip, "\n\n", ctrl->NOTES, 0, NO_CONV, "");

	mov	edx, DWORD PTR _ctrl$[ebp]
	cmp	DWORD PTR [edx+288], 0
	je	SHORT $L70709
	mov	eax, DWORD PTR _ctrl$[ebp]
	mov	ecx, DWORD PTR [eax+288]
	movsx	edx, BYTE PTR [ecx]
	test	edx, edx
	je	SHORT $L70709
	push	0
	push	OFFSET FLAT:$SG70710
	push	0
	push	0
	push	0
	mov	eax, DWORD PTR _ctrl$[ebp]
	mov	ecx, DWORD PTR [eax+288]
	push	ecx
	push	2
	push	OFFSET FLAT:$SG70711
	lea	edx, DWORD PTR _tooltip$[ebp]
	push	edx
	call	_dynbuf_add3
	add	esp, 36					; 00000024H
	test	eax, eax
	je	SHORT $L70709
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29872], OFFSET FLAT:$SG70713
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 262		; 00000106H
	jmp	$eva_err$70640
$L70709:

; 263  : 
; 264  : 	if(ctrl_format_pos(cntxt, ctrl, 1)) STACK_ERROR;

	push	1
	mov	edx, DWORD PTR _ctrl$[ebp]
	push	edx
	mov	eax, DWORD PTR _cntxt$[ebp]
	push	eax
	call	_ctrl_format_pos
	add	esp, 12					; 0000000cH
	test	eax, eax
	je	SHORT $L70714
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 264		; 00000108H
	jmp	$eva_err$70640
$L70714:

; 265  : 
; 266  : 	/* Output button */
; 267  : 	if(put_html_button_sz(cntxt,
; 268  : 		b_link ? link : ctrl->cginame->data,
; 269  : 		ctrl->LABEL,
; 270  : 		dyntab_val(&img, i, 0),
; 271  : 		dyntab_val(&imgsel, i, 0),
; 272  : 		tooltip ? tooltip->data : NULL, CTRL_ATTR_VAL(CTRL_STYLE), 0, 0,
; 273  : 		0,
; 274  : 		/* Button mode : handle link */
; 275  : 		(b_link ? 64 : 0))) STACK_ERROR;

	cmp	DWORD PTR _ctrl$[ebp], 0
	je	SHORT $L70788
	push	0
	push	-1
	push	OFFSET FLAT:$SG70717
	mov	edx, DWORD PTR _ctrl$[ebp]
	add	edx, 44					; 0000002cH
	push	edx
	call	_dyntab_field_val
	add	esp, 16					; 00000010H
	mov	DWORD PTR -224+[ebp], eax
	jmp	SHORT $L70789
$L70788:
	mov	DWORD PTR -224+[ebp], OFFSET FLAT:$SG70718
$L70789:
	cmp	DWORD PTR _tooltip$[ebp], 0
	je	SHORT $L70790
	mov	eax, DWORD PTR _tooltip$[ebp]
	add	eax, 8
	mov	DWORD PTR -228+[ebp], eax
	jmp	SHORT $L70791
$L70790:
	mov	DWORD PTR -228+[ebp], 0
$L70791:
	cmp	DWORD PTR _b_link$[ebp], 0
	je	SHORT $L70792
	mov	ecx, DWORD PTR _link$[ebp]
	mov	DWORD PTR -232+[ebp], ecx
	jmp	SHORT $L70793
$L70792:
	mov	edx, DWORD PTR _ctrl$[ebp]
	mov	eax, DWORD PTR [edx+40]
	add	eax, 8
	mov	DWORD PTR -232+[ebp], eax
$L70793:
	mov	ecx, DWORD PTR _b_link$[ebp]
	neg	ecx
	sbb	ecx, ecx
	and	ecx, 64					; 00000040H
	push	ecx
	push	0
	push	0
	push	0
	mov	edx, DWORD PTR -224+[ebp]
	push	edx
	mov	eax, DWORD PTR -228+[ebp]
	push	eax
	push	0
	mov	ecx, DWORD PTR _i$[ebp]
	push	ecx
	lea	edx, DWORD PTR _imgsel$[ebp]
	push	edx
	call	_dyntab_val
	add	esp, 12					; 0000000cH
	push	eax
	push	0
	mov	eax, DWORD PTR _i$[ebp]
	push	eax
	lea	ecx, DWORD PTR _img$[ebp]
	push	ecx
	call	_dyntab_val
	add	esp, 12					; 0000000cH
	push	eax
	mov	edx, DWORD PTR _ctrl$[ebp]
	mov	eax, DWORD PTR [edx+284]
	push	eax
	mov	ecx, DWORD PTR -232+[ebp]
	push	ecx
	mov	edx, DWORD PTR _cntxt$[ebp]
	push	edx
	call	_put_html_button_sz
	add	esp, 44					; 0000002cH
	test	eax, eax
	je	SHORT $L70716
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 275		; 00000113H
	jmp	SHORT $eva_err$70640
$L70716:

; 276  : 
; 277  : 	if(ctrl_format_pos(cntxt, ctrl, 0)) STACK_ERROR;

	push	0
	mov	ecx, DWORD PTR _ctrl$[ebp]
	push	ecx
	mov	edx, DWORD PTR _cntxt$[ebp]
	push	edx
	call	_ctrl_format_pos
	add	esp, 12					; 0000000cH
	test	eax, eax
	je	SHORT $eva_noerr$70626
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 277		; 00000115H
	jmp	SHORT $eva_err$70640
$eva_noerr$70626:

; 278  : 
; 279  : 	RETURN_OK_CLEANUP;

	push	0
	push	OFFSET FLAT:$SG70720
	push	OFFSET FLAT:$SG70721
	mov	ecx, DWORD PTR _cntxt$[ebp]
	push	ecx
	call	_err_clear
	add	esp, 16					; 00000010H
$eva_err$70640:
	mov	edx, DWORD PTR _cntxt$[ebp]
	cmp	DWORD PTR [edx+29872], 0
	je	SHORT $L70722
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	ecx, DWORD PTR [eax+29900]
	push	ecx
	push	OFFSET FLAT:$SG70723
	push	OFFSET FLAT:$SG70724
	mov	edx, DWORD PTR _cntxt$[ebp]
	push	edx
	call	_err_add_context
	add	esp, 16					; 00000010H
$L70722:
	lea	eax, DWORD PTR _img$[ebp]
	push	eax
	call	_dyntab_free
	add	esp, 4
	lea	ecx, DWORD PTR _imgsel$[ebp]
	push	ecx
	call	_dyntab_free
	add	esp, 4
	lea	edx, DWORD PTR _cond$[ebp]
	push	edx
	call	_dyntab_free
	add	esp, 4
	lea	eax, DWORD PTR _data$[ebp]
	push	eax
	call	_dyntab_free
	add	esp, 4
	lea	ecx, DWORD PTR _condlbl$[ebp]
	push	ecx
	call	_dyntab_free
	add	esp, 4
	mov	edx, DWORD PTR _tooltip$[ebp]
	push	edx
	call	_mem_free
	add	esp, 4
	mov	DWORD PTR _tooltip$[ebp], 0
	mov	eax, DWORD PTR _jslink$[ebp]
	push	eax
	call	_mem_free
	add	esp, 4
	mov	DWORD PTR _jslink$[ebp], 0
	mov	ecx, DWORD PTR _cntxt$[ebp]
	xor	eax, eax
	cmp	DWORD PTR [ecx+29872], 0
	setne	al

; 280  : }

	mov	esp, ebp
	pop	ebp
	ret	0
_ctrl_put_button ENDP
_TEXT	ENDS
PUBLIC	_ctrl_add_button
_DATA	SEGMENT
$SG70745 DB	'D:\Travail\ABI\EVA\V4.0\CGI\Brunix-2016\ctrl_butn.c', 00H
$SG70746 DB	'ctrl_add_button', 00H
$SG70748 DB	'D:\Travail\ABI\EVA\V4.0\CGI\Brunix-2016\ctrl_butn.c', 00H
$SG70749 DB	'ctrl_add_button', 00H
_DATA	ENDS
_TEXT	SEGMENT
_cntxt$ = 8
_i_ctrl$ = 12
_form$ = -4
_ctrl$ = -8
_ctrl_add_button PROC NEAR

; 293  : ){

	push	ebp
	mov	ebp, esp
	sub	esp, 12					; 0000000cH

; 294  : 	EVA_form *form = cntxt->form;

	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	ecx, DWORD PTR [eax+80]
	mov	DWORD PTR _form$[ebp], ecx

; 295  : 	EVA_ctrl *ctrl = form->ctrl + i_ctrl;

	mov	edx, DWORD PTR _i_ctrl$[ebp]
	imul	edx, 480				; 000001e0H
	mov	eax, DWORD PTR _form$[ebp]
	mov	ecx, DWORD PTR [eax]
	add	ecx, edx
	mov	DWORD PTR _ctrl$[ebp], ecx

; 296  : 
; 297  : 	switch(form->step)
; 298  : 	{

	mov	edx, DWORD PTR _form$[ebp]
	mov	eax, DWORD PTR [edx+176]
	mov	DWORD PTR -12+[ebp], eax
	cmp	DWORD PTR -12+[ebp], 11			; 0000000bH
	ja	SHORT $L70742
	mov	edx, DWORD PTR -12+[ebp]
	xor	ecx, ecx
	mov	cl, BYTE PTR $L70795[edx]
	jmp	DWORD PTR $L70796[ecx*4]
$L70739:

; 299  : 	case CtrlRead:
; 300  : 		/* Set CGI name type */
; 301  : 		ctrl->cginame->data[0] = 'B';

	mov	eax, DWORD PTR _ctrl$[ebp]
	mov	ecx, DWORD PTR [eax+40]
	mov	BYTE PTR [ecx+8], 66			; 00000042H

; 302  : 		RETURN_OK;

	jmp	SHORT $eva_noerr$70740
$L70741:

; 303  : 	case HtmlEdit:
; 304  : 	case HtmlView:
; 305  : 	case HtmlPrint:
; 306  : 	case FormList:
; 307  : 	case FormSearch:
; 308  : 	case FormStats:
; 309  : 	case FormValues:
; 310  : 		if(ctrl_put_button(cntxt, i_ctrl)) STACK_ERROR;

	mov	edx, DWORD PTR _i_ctrl$[ebp]
	push	edx
	mov	eax, DWORD PTR _cntxt$[ebp]
	push	eax
	call	_ctrl_put_button
	add	esp, 8
	test	eax, eax
	je	SHORT $L70742
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 310		; 00000136H
	jmp	SHORT $eva_err$70743
$L70742:
$eva_noerr$70740:

; 314  : 
; 315  : 
; 316  : 	RETURN_OK_CLEANUP;

	push	0
	push	OFFSET FLAT:$SG70745
	push	OFFSET FLAT:$SG70746
	mov	edx, DWORD PTR _cntxt$[ebp]
	push	edx
	call	_err_clear
	add	esp, 16					; 00000010H
$eva_err$70743:
	mov	eax, DWORD PTR _cntxt$[ebp]
	cmp	DWORD PTR [eax+29872], 0
	je	SHORT $L70747
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	edx, DWORD PTR [ecx+29900]
	push	edx
	push	OFFSET FLAT:$SG70748
	push	OFFSET FLAT:$SG70749
	mov	eax, DWORD PTR _cntxt$[ebp]
	push	eax
	call	_err_add_context
	add	esp, 16					; 00000010H
$L70747:
	mov	ecx, DWORD PTR _cntxt$[ebp]
	xor	eax, eax
	cmp	DWORD PTR [ecx+29872], 0
	setne	al

; 317  : }

	mov	esp, ebp
	pop	ebp
	ret	0
$L70796:
	DD	$L70739
	DD	$L70741
	DD	$L70742
$L70795:
	DB	0
	DB	2
	DB	2
	DB	2
	DB	1
	DB	2
	DB	1
	DB	1
	DB	1
	DB	1
	DB	1
	DB	1
_ctrl_add_button ENDP
_TEXT	ENDS
END
