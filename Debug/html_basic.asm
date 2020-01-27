	TITLE	D:\Travail\ABI\EVA\V4.0\CGI\Brunix-2016\html_basic.c
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
PUBLIC	_put_html_table_header
EXTRN	_get_image_file:NEAR
EXTRN	_mem_free:NEAR
EXTRN	_dynbuf_add:NEAR
EXTRN	_dynbuf_add3:NEAR
EXTRN	_dynbuf_add3_int:NEAR
EXTRN	_strlen:NEAR
EXTRN	_err_add_context:NEAR
EXTRN	_err_clear:NEAR
_BSS	SEGMENT
$SG70244 DB	01H DUP (?)
	ALIGN	4

$SG70251 DB	01H DUP (?)
	ALIGN	4

$SG70258 DB	01H DUP (?)
	ALIGN	4

$SG70267 DB	01H DUP (?)
	ALIGN	4

$SG70274 DB	01H DUP (?)
	ALIGN	4

$SG70281 DB	01H DUP (?)
	ALIGN	4

$SG70288 DB	01H DUP (?)
	ALIGN	4

$SG70295 DB	01H DUP (?)
	ALIGN	4

$SG70302 DB	01H DUP (?)
	ALIGN	4

$SG70309 DB	01H DUP (?)
_BSS	ENDS
_DATA	SEGMENT
$SG70237 DB	'<table', 00H
	ORG $+1
$SG70239 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70245 DB	' cellspacing=', 00H
	ORG $+2
$SG70247 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70252 DB	' cellpadding=', 00H
	ORG $+2
$SG70254 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70259 DB	' border=', 00H
	ORG $+3
$SG70261 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70263 DB	'none', 00H
	ORG $+3
$SG70268 DB	' align=', 00H
$SG70270 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70275 DB	' width=', 00H
$SG70277 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70282 DB	' height=', 00H
	ORG $+3
$SG70284 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70289 DB	' bgcolor=#', 00H
	ORG $+1
$SG70291 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70296 DB	' rules=', 00H
$SG70298 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70303 DB	' class=', 00H
$SG70305 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70310 DB	' ', 00H
	ORG $+2
$SG70312 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70316 DB	'''', 00H
	ORG $+2
$SG70317 DB	' background=''', 00H
	ORG $+2
$SG70319 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70322 DB	'><tr>', 00H
	ORG $+2
$SG70324 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70326 DB	'D:\Travail\ABI\EVA\V4.0\CGI\Brunix-2016\html_basic.c', 00H
	ORG $+3
$SG70327 DB	'put_html_table_header', 00H
	ORG $+2
$SG70329 DB	'D:\Travail\ABI\EVA\V4.0\CGI\Brunix-2016\html_basic.c', 00H
	ORG $+3
$SG70330 DB	'put_html_table_header', 00H
_DATA	ENDS
_TEXT	SEGMENT
_cntxt$ = 8
_align$ = 12
_width$ = 16
_height$ = 20
_bgcolor$ = 24
_background$ = 28
_cellspacing$ = 32
_cellpadding$ = 36
_border$ = 40
_rules$ = 44
_cls$ = 48
_extra$ = 52
_img$ = -8
_html$ = -4
_put_html_table_header PROC NEAR

; 35   : ){

	push	ebp
	mov	ebp, esp
	sub	esp, 16					; 00000010H

; 36   : 	char *img = NULL;

	mov	DWORD PTR _img$[ebp], 0

; 37   : 	CHECK_HTML_STATUS;

	cmp	DWORD PTR _cntxt$[ebp], 0
	je	SHORT $L70870
	mov	eax, DWORD PTR _cntxt$[ebp]
	cmp	DWORD PTR [eax+80], 0
	je	SHORT $L70868
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	edx, DWORD PTR [ecx+80]
	mov	eax, DWORD PTR [edx+232]
	mov	DWORD PTR -12+[ebp], eax
	jmp	SHORT $L70869
$L70868:
	mov	DWORD PTR -12+[ebp], 0
$L70869:
	mov	ecx, DWORD PTR -12+[ebp]
	mov	DWORD PTR -16+[ebp], ecx
	jmp	SHORT $L70871
$L70870:
	mov	DWORD PTR -16+[ebp], 0
$L70871:
	mov	edx, DWORD PTR -16+[ebp]
	mov	DWORD PTR _html$[ebp], edx
	cmp	DWORD PTR _html$[ebp], 0
	jne	SHORT $L70234
	xor	eax, eax
	jmp	$L70228
$L70234:

; 38   : 
; 39   : 	/* Output HTML table header with modifiers */
; 40   : 	DYNBUF_ADD_STR(html, "<table");

	push	0
	push	0
	push	6
	push	OFFSET FLAT:$SG70237
	mov	eax, DWORD PTR _html$[ebp]
	push	eax
	call	_dynbuf_add
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L70236
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29872], OFFSET FLAT:$SG70239
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 40		; 00000028H
	jmp	$eva_err$70240
$L70236:

; 41   : 	if(cls  && !*cls) cls = NULL;

	cmp	DWORD PTR _cls$[ebp], 0
	je	SHORT $L70241
	mov	eax, DWORD PTR _cls$[ebp]
	movsx	ecx, BYTE PTR [eax]
	test	ecx, ecx
	jne	SHORT $L70241
	mov	DWORD PTR _cls$[ebp], 0
$L70241:

; 42   : 	DYNBUF_ADD3_INT(html," cellspacing=", cellspacing, "");

	push	0
	push	OFFSET FLAT:$SG70244
	mov	edx, DWORD PTR _cellspacing$[ebp]
	push	edx
	push	13					; 0000000dH
	push	OFFSET FLAT:$SG70245
	mov	eax, DWORD PTR _html$[ebp]
	push	eax
	call	_dynbuf_add3_int
	add	esp, 24					; 00000018H
	test	eax, eax
	je	SHORT $L70243
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29872], OFFSET FLAT:$SG70247
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 42		; 0000002aH
	jmp	$eva_err$70240
$L70243:

; 43   : 	if(!cls || cellpadding) DYNBUF_ADD3_INT(html, " cellpadding=", cellpadding, "");

	cmp	DWORD PTR _cls$[ebp], 0
	je	SHORT $L70249
	cmp	DWORD PTR _cellpadding$[ebp], 0
	je	SHORT $L70250
$L70249:
	push	0
	push	OFFSET FLAT:$SG70251
	mov	eax, DWORD PTR _cellpadding$[ebp]
	push	eax
	push	13					; 0000000dH
	push	OFFSET FLAT:$SG70252
	mov	ecx, DWORD PTR _html$[ebp]
	push	ecx
	call	_dynbuf_add3_int
	add	esp, 24					; 00000018H
	test	eax, eax
	je	SHORT $L70250
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29872], OFFSET FLAT:$SG70254
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 43		; 0000002bH
	jmp	$eva_err$70240
$L70250:

; 44   : 	if(!cls || border) DYNBUF_ADD3_INT(html, " border=", border, "");

	cmp	DWORD PTR _cls$[ebp], 0
	je	SHORT $L70256
	cmp	DWORD PTR _border$[ebp], 0
	je	SHORT $L70257
$L70256:
	push	0
	push	OFFSET FLAT:$SG70258
	mov	ecx, DWORD PTR _border$[ebp]
	push	ecx
	push	8
	push	OFFSET FLAT:$SG70259
	mov	edx, DWORD PTR _html$[ebp]
	push	edx
	call	_dynbuf_add3_int
	add	esp, 24					; 00000018H
	test	eax, eax
	je	SHORT $L70257
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29872], OFFSET FLAT:$SG70261
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 44		; 0000002cH
	jmp	$eva_err$70240
$L70257:

; 45   : 	if(!cls && !border && !rules) rules = "none";

	cmp	DWORD PTR _cls$[ebp], 0
	jne	SHORT $L70262
	cmp	DWORD PTR _border$[ebp], 0
	jne	SHORT $L70262
	cmp	DWORD PTR _rules$[ebp], 0
	jne	SHORT $L70262
	mov	DWORD PTR _rules$[ebp], OFFSET FLAT:$SG70263
$L70262:

; 46   : 	if(align && *align) DYNBUF_ADD3(html, " align=", align, 0, NO_CONV, "");

	cmp	DWORD PTR _align$[ebp], 0
	je	SHORT $L70266
	mov	edx, DWORD PTR _align$[ebp]
	movsx	eax, BYTE PTR [edx]
	test	eax, eax
	je	SHORT $L70266
	push	0
	push	OFFSET FLAT:$SG70267
	push	0
	push	0
	push	0
	mov	ecx, DWORD PTR _align$[ebp]
	push	ecx
	push	7
	push	OFFSET FLAT:$SG70268
	mov	edx, DWORD PTR _html$[ebp]
	push	edx
	call	_dynbuf_add3
	add	esp, 36					; 00000024H
	test	eax, eax
	je	SHORT $L70266
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29872], OFFSET FLAT:$SG70270
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 46		; 0000002eH
	jmp	$eva_err$70240
$L70266:

; 47   : 	if(width && *width) DYNBUF_ADD3(html, " width=", width, 0, NO_CONV, "");

	cmp	DWORD PTR _width$[ebp], 0
	je	SHORT $L70273
	mov	edx, DWORD PTR _width$[ebp]
	movsx	eax, BYTE PTR [edx]
	test	eax, eax
	je	SHORT $L70273
	push	0
	push	OFFSET FLAT:$SG70274
	push	0
	push	0
	push	0
	mov	ecx, DWORD PTR _width$[ebp]
	push	ecx
	push	7
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
	mov	DWORD PTR [ecx+29900], 47		; 0000002fH
	jmp	$eva_err$70240
$L70273:

; 48   : 	if(height && *height) DYNBUF_ADD3(html, " height=", height, 0, NO_CONV, "");

	cmp	DWORD PTR _height$[ebp], 0
	je	SHORT $L70280
	mov	edx, DWORD PTR _height$[ebp]
	movsx	eax, BYTE PTR [edx]
	test	eax, eax
	je	SHORT $L70280
	push	0
	push	OFFSET FLAT:$SG70281
	push	0
	push	0
	push	0
	mov	ecx, DWORD PTR _height$[ebp]
	push	ecx
	push	8
	push	OFFSET FLAT:$SG70282
	mov	edx, DWORD PTR _html$[ebp]
	push	edx
	call	_dynbuf_add3
	add	esp, 36					; 00000024H
	test	eax, eax
	je	SHORT $L70280
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29872], OFFSET FLAT:$SG70284
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 48		; 00000030H
	jmp	$eva_err$70240
$L70280:

; 49   : 	if(bgcolor && *bgcolor && strlen(bgcolor) == 6) DYNBUF_ADD3(html, " bgcolor=#", bgcolor, 0, NO_CONV, "");

	cmp	DWORD PTR _bgcolor$[ebp], 0
	je	SHORT $L70287
	mov	edx, DWORD PTR _bgcolor$[ebp]
	movsx	eax, BYTE PTR [edx]
	test	eax, eax
	je	SHORT $L70287
	mov	ecx, DWORD PTR _bgcolor$[ebp]
	push	ecx
	call	_strlen
	add	esp, 4
	cmp	eax, 6
	jne	SHORT $L70287
	push	0
	push	OFFSET FLAT:$SG70288
	push	0
	push	0
	push	0
	mov	edx, DWORD PTR _bgcolor$[ebp]
	push	edx
	push	10					; 0000000aH
	push	OFFSET FLAT:$SG70289
	mov	eax, DWORD PTR _html$[ebp]
	push	eax
	call	_dynbuf_add3
	add	esp, 36					; 00000024H
	test	eax, eax
	je	SHORT $L70287
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29872], OFFSET FLAT:$SG70291
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 49		; 00000031H
	jmp	$eva_err$70240
$L70287:

; 50   : 	if(rules && *rules) DYNBUF_ADD3(html, " rules=", rules, 0, NO_CONV, "");

	cmp	DWORD PTR _rules$[ebp], 0
	je	SHORT $L70294
	mov	eax, DWORD PTR _rules$[ebp]
	movsx	ecx, BYTE PTR [eax]
	test	ecx, ecx
	je	SHORT $L70294
	push	0
	push	OFFSET FLAT:$SG70295
	push	0
	push	0
	push	0
	mov	edx, DWORD PTR _rules$[ebp]
	push	edx
	push	7
	push	OFFSET FLAT:$SG70296
	mov	eax, DWORD PTR _html$[ebp]
	push	eax
	call	_dynbuf_add3
	add	esp, 36					; 00000024H
	test	eax, eax
	je	SHORT $L70294
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29872], OFFSET FLAT:$SG70298
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 50		; 00000032H
	jmp	$eva_err$70240
$L70294:

; 51   : 	if(cls) DYNBUF_ADD3(html, " class=", cls, 0, NO_CONV, "");

	cmp	DWORD PTR _cls$[ebp], 0
	je	SHORT $L70301
	push	0
	push	OFFSET FLAT:$SG70302
	push	0
	push	0
	push	0
	mov	eax, DWORD PTR _cls$[ebp]
	push	eax
	push	7
	push	OFFSET FLAT:$SG70303
	mov	ecx, DWORD PTR _html$[ebp]
	push	ecx
	call	_dynbuf_add3
	add	esp, 36					; 00000024H
	test	eax, eax
	je	SHORT $L70301
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29872], OFFSET FLAT:$SG70305
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 51		; 00000033H
	jmp	$eva_err$70240
$L70301:

; 52   : 	if(extra && *extra) DYNBUF_ADD3(html, " ", extra, 0, NO_CONV, "");

	cmp	DWORD PTR _extra$[ebp], 0
	je	SHORT $L70308
	mov	ecx, DWORD PTR _extra$[ebp]
	movsx	edx, BYTE PTR [ecx]
	test	edx, edx
	je	SHORT $L70308
	push	0
	push	OFFSET FLAT:$SG70309
	push	0
	push	0
	push	0
	mov	eax, DWORD PTR _extra$[ebp]
	push	eax
	push	1
	push	OFFSET FLAT:$SG70310
	mov	ecx, DWORD PTR _html$[ebp]
	push	ecx
	call	_dynbuf_add3
	add	esp, 36					; 00000024H
	test	eax, eax
	je	SHORT $L70308
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29872], OFFSET FLAT:$SG70312
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 52		; 00000034H
	jmp	$eva_err$70240
$L70308:

; 53   : 	img = get_image_file(cntxt, background, 0, 0);

	push	0
	push	0
	mov	ecx, DWORD PTR _background$[ebp]
	push	ecx
	mov	edx, DWORD PTR _cntxt$[ebp]
	push	edx
	call	_get_image_file
	add	esp, 16					; 00000010H
	mov	DWORD PTR _img$[ebp], eax

; 54   : 	if(img) DYNBUF_ADD3(html, " background='", img, 0, NO_CONV, "'");

	cmp	DWORD PTR _img$[ebp], 0
	je	SHORT $L70315
	push	1
	push	OFFSET FLAT:$SG70316
	push	0
	push	0
	push	0
	mov	eax, DWORD PTR _img$[ebp]
	push	eax
	push	13					; 0000000dH
	push	OFFSET FLAT:$SG70317
	mov	ecx, DWORD PTR _html$[ebp]
	push	ecx
	call	_dynbuf_add3
	add	esp, 36					; 00000024H
	test	eax, eax
	je	SHORT $L70315
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29872], OFFSET FLAT:$SG70319
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 54		; 00000036H
	jmp	SHORT $eva_err$70240
$L70315:

; 55   : 	DYNBUF_ADD_STR(html, "><tr>");

	push	0
	push	0
	push	5
	push	OFFSET FLAT:$SG70322
	mov	ecx, DWORD PTR _html$[ebp]
	push	ecx
	call	_dynbuf_add
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L70321
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29872], OFFSET FLAT:$SG70324
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 55		; 00000037H
	jmp	SHORT $eva_err$70240
$L70321:
$eva_noerr$70325:

; 56   : 
; 57   : 	RETURN_OK_CLEANUP;

	push	0
	push	OFFSET FLAT:$SG70326
	push	OFFSET FLAT:$SG70327
	mov	ecx, DWORD PTR _cntxt$[ebp]
	push	ecx
	call	_err_clear
	add	esp, 16					; 00000010H
$eva_err$70240:
	mov	edx, DWORD PTR _cntxt$[ebp]
	cmp	DWORD PTR [edx+29872], 0
	je	SHORT $L70328
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	ecx, DWORD PTR [eax+29900]
	push	ecx
	push	OFFSET FLAT:$SG70329
	push	OFFSET FLAT:$SG70330
	mov	edx, DWORD PTR _cntxt$[ebp]
	push	edx
	call	_err_add_context
	add	esp, 16					; 00000010H
$L70328:
	mov	eax, DWORD PTR _img$[ebp]
	push	eax
	call	_mem_free
	add	esp, 4
	mov	DWORD PTR _img$[ebp], 0
	mov	ecx, DWORD PTR _cntxt$[ebp]
	xor	eax, eax
	cmp	DWORD PTR [ecx+29872], 0
	setne	al
$L70228:

; 58   : }

	mov	esp, ebp
	pop	ebp
	ret	0
_put_html_table_header ENDP
_TEXT	ENDS
PUBLIC	_put_html_format_pos
EXTRN	_no_quote:BYTE
EXTRN	_strcmp:NEAR
EXTRN	_strncmp:NEAR
_BSS	SEGMENT
	ALIGN	4

$SG70383 DB	01H DUP (?)
	ALIGN	4

$SG70418 DB	01H DUP (?)
	ALIGN	4

$SG70431 DB	01H DUP (?)
	ALIGN	4

$SG70438 DB	01H DUP (?)
	ALIGN	4

$SG70445 DB	01H DUP (?)
	ALIGN	4

$SG70452 DB	01H DUP (?)
	ALIGN	4

$SG70459 DB	01H DUP (?)
	ALIGN	4

$SG70472 DB	01H DUP (?)
	ALIGN	4

$SG70478 DB	01H DUP (?)
	ALIGN	4

$SG70517 DB	01H DUP (?)
	ALIGN	4

$SG70524 DB	01H DUP (?)
_BSS	ENDS
_DATA	SEGMENT
	ORG $+2
$SG70385 DB	'_EVA_NewHeader', 00H
	ORG $+1
$SG70386 DB	'th', 00H
	ORG $+1
$SG70389 DB	'_EVA_NewColumn', 00H
	ORG $+1
$SG70390 DB	'td', 00H
	ORG $+1
$SG70393 DB	'_EVA_SameCell', 00H
	ORG $+2
$SG70395 DB	'span', 00H
	ORG $+3
$SG70398 DB	'_EVA_SameColumn', 00H
$SG70399 DB	'div', 00H
$SG70406 DB	'<tr>', 00H
	ORG $+3
$SG70409 DB	'</tr><tr>', 00H
	ORG $+2
$SG70411 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70413 DB	'td', 00H
	ORG $+1
$SG70419 DB	'<', 00H
	ORG $+2
$SG70421 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70424 DB	'''', 00H
	ORG $+2
$SG70425 DB	' class=''', 00H
	ORG $+3
$SG70427 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70432 DB	' align=', 00H
$SG70434 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70439 DB	' valign=', 00H
	ORG $+3
$SG70441 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70446 DB	' width=', 00H
$SG70448 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70453 DB	' height=', 00H
	ORG $+3
$SG70455 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70460 DB	' bgcolor=#', 00H
	ORG $+1
$SG70462 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70466 DB	'''', 00H
	ORG $+2
$SG70467 DB	' background=''', 00H
	ORG $+2
$SG70469 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70473 DB	' colspan=', 00H
	ORG $+2
$SG70475 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70479 DB	' rowspan=', 00H
	ORG $+2
$SG70481 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70484 DB	'>', 00H
	ORG $+2
$SG70486 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70491 DB	'>', 00H
	ORG $+2
$SG70492 DB	'<', 00H
	ORG $+2
$SG70494 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70498 DB	'<nobr>', 00H
	ORG $+1
$SG70500 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70504 DB	'<font', 00H
	ORG $+2
$SG70506 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70510 DB	'''', 00H
	ORG $+2
$SG70511 DB	' face=''', 00H
$SG70513 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70518 DB	' size=', 00H
	ORG $+1
$SG70520 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70525 DB	' color=#', 00H
	ORG $+3
$SG70527 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70530 DB	'>', 00H
	ORG $+2
$SG70532 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70536 DB	'<b>', 00H
$SG70538 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70542 DB	'<i>', 00H
$SG70544 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70548 DB	'<u>', 00H
$SG70550 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70555 DB	'</u>', 00H
	ORG $+3
$SG70557 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70561 DB	'</i>', 00H
	ORG $+3
$SG70563 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70567 DB	'</b>', 00H
	ORG $+3
$SG70569 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70573 DB	'</font>', 00H
$SG70575 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70579 DB	'>', 00H
	ORG $+2
$SG70580 DB	'</', 00H
	ORG $+1
$SG70582 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70587 DB	'>', 00H
	ORG $+2
$SG70588 DB	'</', 00H
	ORG $+1
$SG70590 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70592 DB	'D:\Travail\ABI\EVA\V4.0\CGI\Brunix-2016\html_basic.c', 00H
	ORG $+3
$SG70593 DB	'put_html_format_pos', 00H
$SG70595 DB	'D:\Travail\ABI\EVA\V4.0\CGI\Brunix-2016\html_basic.c', 00H
	ORG $+3
$SG70596 DB	'put_html_format_pos', 00H
_DATA	ENDS
_TEXT	SEGMENT
_cntxt$ = 8
_position$ = 12
_align$ = 16
_valign$ = 20
_width$ = 24
_height$ = 28
_bgcolor$ = 32
_background$ = 36
_colspan$ = 40
_rowspan$ = 44
_fontface$ = 48
_fontsize$ = 52
_fontcolor$ = 56
_style$ = 60
_bold$ = 64
_italic$ = 68
_underline$ = 72
_nobreak$ = 76
_b_head$ = 80
_tag$ = -12
_img$ = -8
_b_font$ = -16
_html$ = -4
_txt$70402 = -20
_len$70404 = -24
_put_html_format_pos PROC NEAR

; 87   : ){

	push	ebp
	mov	ebp, esp
	sub	esp, 44					; 0000002cH

; 88   : 	char *tag = NULL;

	mov	DWORD PTR _tag$[ebp], 0

; 89   : 	char *img = NULL;

	mov	DWORD PTR _img$[ebp], 0

; 90   : 	int b_font = (fontface && *fontface) || (fontsize && *fontsize) || (fontcolor && *fontcolor);

	cmp	DWORD PTR _fontface$[ebp], 0
	je	SHORT $L70873
	mov	eax, DWORD PTR _fontface$[ebp]
	movsx	ecx, BYTE PTR [eax]
	test	ecx, ecx
	jne	SHORT $L70875
$L70873:
	cmp	DWORD PTR _fontsize$[ebp], 0
	je	SHORT $L70874
	mov	edx, DWORD PTR _fontsize$[ebp]
	movsx	eax, BYTE PTR [edx]
	test	eax, eax
	jne	SHORT $L70875
$L70874:
	cmp	DWORD PTR _fontcolor$[ebp], 0
	je	SHORT $L70876
	mov	ecx, DWORD PTR _fontcolor$[ebp]
	movsx	edx, BYTE PTR [ecx]
	test	edx, edx
	jne	SHORT $L70875
$L70876:
	mov	DWORD PTR -28+[ebp], 0
	jmp	SHORT $L70877
$L70875:
	mov	DWORD PTR -28+[ebp], 1
$L70877:
	mov	eax, DWORD PTR -28+[ebp]
	mov	DWORD PTR _b_font$[ebp], eax

; 91   : 	CHECK_HTML_STATUS;

	cmp	DWORD PTR _cntxt$[ebp], 0
	je	SHORT $L70880
	mov	ecx, DWORD PTR _cntxt$[ebp]
	cmp	DWORD PTR [ecx+80], 0
	je	SHORT $L70878
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	eax, DWORD PTR [edx+80]
	mov	ecx, DWORD PTR [eax+232]
	mov	DWORD PTR -32+[ebp], ecx
	jmp	SHORT $L70879
$L70878:
	mov	DWORD PTR -32+[ebp], 0
$L70879:
	mov	edx, DWORD PTR -32+[ebp]
	mov	DWORD PTR -36+[ebp], edx
	jmp	SHORT $L70881
$L70880:
	mov	DWORD PTR -36+[ebp], 0
$L70881:
	mov	eax, DWORD PTR -36+[ebp]
	mov	DWORD PTR _html$[ebp], eax
	cmp	DWORD PTR _html$[ebp], 0
	jne	SHORT $L70381
	xor	eax, eax
	jmp	$L70372
$L70381:

; 92   : 
; 93   : 	/* Check parameters */
; 94   : 	if(!position) position = "";

	cmp	DWORD PTR _position$[ebp], 0
	jne	SHORT $L70382
	mov	DWORD PTR _position$[ebp], OFFSET FLAT:$SG70383
$L70382:

; 95   : 
; 96   : 	/* Handle position in table */
; 97   : 	if(!strcmp("_EVA_NewHeader", position))

	mov	ecx, DWORD PTR _position$[ebp]
	push	ecx
	push	OFFSET FLAT:$SG70385
	call	_strcmp
	add	esp, 8
	test	eax, eax
	jne	SHORT $L70384

; 99   : 		/* NewColumn : new table cell */
; 100  : 		tag = "th";

	mov	DWORD PTR _tag$[ebp], OFFSET FLAT:$SG70386

; 102  : 	else 	if(!strcmp("_EVA_NewColumn", position))

	jmp	$L70400
$L70384:
	mov	edx, DWORD PTR _position$[ebp]
	push	edx
	push	OFFSET FLAT:$SG70389
	call	_strcmp
	add	esp, 8
	test	eax, eax
	jne	SHORT $L70388

; 104  : 		/* NewColumn : new table cell */
; 105  : 		tag = "td";

	mov	DWORD PTR _tag$[ebp], OFFSET FLAT:$SG70390

; 107  : 	else if(!strcmp("_EVA_SameCell", position))

	jmp	$L70400
$L70388:
	mov	eax, DWORD PTR _position$[ebp]
	push	eax
	push	OFFSET FLAT:$SG70393
	call	_strcmp
	add	esp, 8
	test	eax, eax
	jne	SHORT $L70392

; 109  : 		/* SameCell : use <span> if style given */
; 110  : 		if(style && *style)

	cmp	DWORD PTR _style$[ebp], 0
	je	SHORT $L70394
	mov	ecx, DWORD PTR _style$[ebp]
	movsx	edx, BYTE PTR [ecx]
	test	edx, edx
	je	SHORT $L70394

; 112  : 			tag = "span";

	mov	DWORD PTR _tag$[ebp], OFFSET FLAT:$SG70395
$L70394:

; 115  : 	else if(!strcmp("_EVA_SameColumn", position))

	jmp	$L70400
$L70392:
	mov	eax, DWORD PTR _position$[ebp]
	push	eax
	push	OFFSET FLAT:$SG70398
	call	_strcmp
	add	esp, 8
	test	eax, eax
	jne	SHORT $L70397

; 117  : 		/* SameColumn : use <div> */
; 118  : 		tag = "div";

	mov	DWORD PTR _tag$[ebp], OFFSET FLAT:$SG70399

; 120  : 	else

	jmp	$L70400
$L70397:

; 122  : 		/* Default value : new table row */
; 123  : 		if(b_head)

	cmp	DWORD PTR _b_head$[ebp], 0
	je	$L70408

; 125  : 			char *txt = *html ? (*html)->data : NULL;

	mov	ecx, DWORD PTR _html$[ebp]
	cmp	DWORD PTR [ecx], 0
	je	SHORT $L70882
	mov	edx, DWORD PTR _html$[ebp]
	mov	eax, DWORD PTR [edx]
	add	eax, 8
	mov	DWORD PTR -40+[ebp], eax
	jmp	SHORT $L70883
$L70882:
	mov	DWORD PTR -40+[ebp], 0
$L70883:
	mov	ecx, DWORD PTR -40+[ebp]
	mov	DWORD PTR _txt$70402[ebp], ecx

; 126  : 			size_t len = *html ? (*html)->cnt : 0;

	mov	edx, DWORD PTR _html$[ebp]
	cmp	DWORD PTR [edx], 0
	je	SHORT $L70884
	mov	eax, DWORD PTR _html$[ebp]
	mov	ecx, DWORD PTR [eax]
	mov	edx, DWORD PTR [ecx+4]
	mov	DWORD PTR -44+[ebp], edx
	jmp	SHORT $L70885
$L70884:
	mov	DWORD PTR -44+[ebp], 0
$L70885:
	mov	eax, DWORD PTR -44+[ebp]
	mov	DWORD PTR _len$70404[ebp], eax

; 127  : 			if(txt && len > 3 && strncmp(txt + len - 4, "<tr>", 4))

	cmp	DWORD PTR _txt$70402[ebp], 0
	je	SHORT $L70408
	cmp	DWORD PTR _len$70404[ebp], 3
	jbe	SHORT $L70408
	push	4
	push	OFFSET FLAT:$SG70406
	mov	ecx, DWORD PTR _len$70404[ebp]
	mov	edx, DWORD PTR _txt$70402[ebp]
	lea	eax, DWORD PTR [edx+ecx-4]
	push	eax
	call	_strncmp
	add	esp, 12					; 0000000cH
	test	eax, eax
	je	SHORT $L70408

; 128  : 				DYNBUF_ADD_STR(html, "</tr><tr>");

	push	0
	push	0
	push	9
	push	OFFSET FLAT:$SG70409
	mov	ecx, DWORD PTR _html$[ebp]
	push	ecx
	call	_dynbuf_add
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L70408
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29872], OFFSET FLAT:$SG70411
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 128		; 00000080H
	jmp	$eva_err$70412
$L70408:

; 130  : 		tag = "td";

	mov	DWORD PTR _tag$[ebp], OFFSET FLAT:$SG70413
$L70400:

; 132  : 
; 133  : 	/* Output header */
; 134  : 	if(b_head)

	cmp	DWORD PTR _b_head$[ebp], 0
	je	$L70414

; 136  : 		if(tag)

	cmp	DWORD PTR _tag$[ebp], 0
	je	$L70415

; 138  : 			/* Add cell modifiers */
; 139  : 			DYNBUF_ADD3(html, "<", tag, 0, NO_CONV, "");

	push	0
	push	OFFSET FLAT:$SG70418
	push	0
	push	0
	push	0
	mov	ecx, DWORD PTR _tag$[ebp]
	push	ecx
	push	1
	push	OFFSET FLAT:$SG70419
	mov	edx, DWORD PTR _html$[ebp]
	push	edx
	call	_dynbuf_add3
	add	esp, 36					; 00000024H
	test	eax, eax
	je	SHORT $L70417
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29872], OFFSET FLAT:$SG70421
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 139		; 0000008bH
	jmp	$eva_err$70412
$L70417:

; 140  : 			if(style && *style) DYNBUF_ADD3(html, " class='", style, 0, HTML_NO_QUOTE, "'");

	cmp	DWORD PTR _style$[ebp], 0
	je	SHORT $L70423
	mov	edx, DWORD PTR _style$[ebp]
	movsx	eax, BYTE PTR [edx]
	test	eax, eax
	je	SHORT $L70423
	push	1
	push	OFFSET FLAT:$SG70424
	push	1
	push	OFFSET FLAT:_no_quote
	push	0
	mov	ecx, DWORD PTR _style$[ebp]
	push	ecx
	push	8
	push	OFFSET FLAT:$SG70425
	mov	edx, DWORD PTR _html$[ebp]
	push	edx
	call	_dynbuf_add3
	add	esp, 36					; 00000024H
	test	eax, eax
	je	SHORT $L70423
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29872], OFFSET FLAT:$SG70427
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 140		; 0000008cH
	jmp	$eva_err$70412
$L70423:

; 141  : 			if(align && *align) DYNBUF_ADD3(html, " align=", align, 0, NO_CONV, "");

	cmp	DWORD PTR _align$[ebp], 0
	je	SHORT $L70430
	mov	edx, DWORD PTR _align$[ebp]
	movsx	eax, BYTE PTR [edx]
	test	eax, eax
	je	SHORT $L70430
	push	0
	push	OFFSET FLAT:$SG70431
	push	0
	push	0
	push	0
	mov	ecx, DWORD PTR _align$[ebp]
	push	ecx
	push	7
	push	OFFSET FLAT:$SG70432
	mov	edx, DWORD PTR _html$[ebp]
	push	edx
	call	_dynbuf_add3
	add	esp, 36					; 00000024H
	test	eax, eax
	je	SHORT $L70430
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29872], OFFSET FLAT:$SG70434
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 141		; 0000008dH
	jmp	$eva_err$70412
$L70430:

; 142  : 			if(valign && *valign) DYNBUF_ADD3(html, " valign=", valign, 0, NO_CONV, "");

	cmp	DWORD PTR _valign$[ebp], 0
	je	SHORT $L70437
	mov	edx, DWORD PTR _valign$[ebp]
	movsx	eax, BYTE PTR [edx]
	test	eax, eax
	je	SHORT $L70437
	push	0
	push	OFFSET FLAT:$SG70438
	push	0
	push	0
	push	0
	mov	ecx, DWORD PTR _valign$[ebp]
	push	ecx
	push	8
	push	OFFSET FLAT:$SG70439
	mov	edx, DWORD PTR _html$[ebp]
	push	edx
	call	_dynbuf_add3
	add	esp, 36					; 00000024H
	test	eax, eax
	je	SHORT $L70437
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29872], OFFSET FLAT:$SG70441
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 142		; 0000008eH
	jmp	$eva_err$70412
$L70437:

; 143  : 			if(width && *width) DYNBUF_ADD3(html, " width=", width, 0, NO_CONV, "");

	cmp	DWORD PTR _width$[ebp], 0
	je	SHORT $L70444
	mov	edx, DWORD PTR _width$[ebp]
	movsx	eax, BYTE PTR [edx]
	test	eax, eax
	je	SHORT $L70444
	push	0
	push	OFFSET FLAT:$SG70445
	push	0
	push	0
	push	0
	mov	ecx, DWORD PTR _width$[ebp]
	push	ecx
	push	7
	push	OFFSET FLAT:$SG70446
	mov	edx, DWORD PTR _html$[ebp]
	push	edx
	call	_dynbuf_add3
	add	esp, 36					; 00000024H
	test	eax, eax
	je	SHORT $L70444
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29872], OFFSET FLAT:$SG70448
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 143		; 0000008fH
	jmp	$eva_err$70412
$L70444:

; 144  : 			if(height && *height) DYNBUF_ADD3(html, " height=", height, 0, NO_CONV, "");

	cmp	DWORD PTR _height$[ebp], 0
	je	SHORT $L70451
	mov	edx, DWORD PTR _height$[ebp]
	movsx	eax, BYTE PTR [edx]
	test	eax, eax
	je	SHORT $L70451
	push	0
	push	OFFSET FLAT:$SG70452
	push	0
	push	0
	push	0
	mov	ecx, DWORD PTR _height$[ebp]
	push	ecx
	push	8
	push	OFFSET FLAT:$SG70453
	mov	edx, DWORD PTR _html$[ebp]
	push	edx
	call	_dynbuf_add3
	add	esp, 36					; 00000024H
	test	eax, eax
	je	SHORT $L70451
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29872], OFFSET FLAT:$SG70455
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 144		; 00000090H
	jmp	$eva_err$70412
$L70451:

; 145  : 			if(bgcolor && strlen(bgcolor) == 6) DYNBUF_ADD3(html, " bgcolor=#", bgcolor, 0, NO_CONV, "");

	cmp	DWORD PTR _bgcolor$[ebp], 0
	je	SHORT $L70458
	mov	edx, DWORD PTR _bgcolor$[ebp]
	push	edx
	call	_strlen
	add	esp, 4
	cmp	eax, 6
	jne	SHORT $L70458
	push	0
	push	OFFSET FLAT:$SG70459
	push	0
	push	0
	push	0
	mov	eax, DWORD PTR _bgcolor$[ebp]
	push	eax
	push	10					; 0000000aH
	push	OFFSET FLAT:$SG70460
	mov	ecx, DWORD PTR _html$[ebp]
	push	ecx
	call	_dynbuf_add3
	add	esp, 36					; 00000024H
	test	eax, eax
	je	SHORT $L70458
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29872], OFFSET FLAT:$SG70462
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 145		; 00000091H
	jmp	$eva_err$70412
$L70458:

; 146  : 			img = get_image_file(cntxt, background, 0, 0);

	push	0
	push	0
	mov	ecx, DWORD PTR _background$[ebp]
	push	ecx
	mov	edx, DWORD PTR _cntxt$[ebp]
	push	edx
	call	_get_image_file
	add	esp, 16					; 00000010H
	mov	DWORD PTR _img$[ebp], eax

; 147  : 			if(img) DYNBUF_ADD3(html, " background='", img, 0, NO_CONV, "'");

	cmp	DWORD PTR _img$[ebp], 0
	je	SHORT $L70465
	push	1
	push	OFFSET FLAT:$SG70466
	push	0
	push	0
	push	0
	mov	eax, DWORD PTR _img$[ebp]
	push	eax
	push	13					; 0000000dH
	push	OFFSET FLAT:$SG70467
	mov	ecx, DWORD PTR _html$[ebp]
	push	ecx
	call	_dynbuf_add3
	add	esp, 36					; 00000024H
	test	eax, eax
	je	SHORT $L70465
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29872], OFFSET FLAT:$SG70469
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 147		; 00000093H
	jmp	$eva_err$70412
$L70465:

; 148  : 			if(colspan > 1) DYNBUF_ADD3_INT(html, " colspan=", colspan, "");

	cmp	DWORD PTR _colspan$[ebp], 1
	jle	SHORT $L70471
	push	0
	push	OFFSET FLAT:$SG70472
	mov	ecx, DWORD PTR _colspan$[ebp]
	push	ecx
	push	9
	push	OFFSET FLAT:$SG70473
	mov	edx, DWORD PTR _html$[ebp]
	push	edx
	call	_dynbuf_add3_int
	add	esp, 24					; 00000018H
	test	eax, eax
	je	SHORT $L70471
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29872], OFFSET FLAT:$SG70475
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 148		; 00000094H
	jmp	$eva_err$70412
$L70471:

; 149  : 			if(rowspan > 1) DYNBUF_ADD3_INT(html, " rowspan=", rowspan, "");

	cmp	DWORD PTR _rowspan$[ebp], 1
	jle	SHORT $L70477
	push	0
	push	OFFSET FLAT:$SG70478
	mov	edx, DWORD PTR _rowspan$[ebp]
	push	edx
	push	9
	push	OFFSET FLAT:$SG70479
	mov	eax, DWORD PTR _html$[ebp]
	push	eax
	call	_dynbuf_add3_int
	add	esp, 24					; 00000018H
	test	eax, eax
	je	SHORT $L70477
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29872], OFFSET FLAT:$SG70481
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 149		; 00000095H
	jmp	$eva_err$70412
$L70477:

; 150  : 			DYNBUF_ADD_STR(html, ">");

	push	0
	push	0
	push	1
	push	OFFSET FLAT:$SG70484
	mov	eax, DWORD PTR _html$[ebp]
	push	eax
	call	_dynbuf_add
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L70483
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29872], OFFSET FLAT:$SG70486
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 150		; 00000096H
	jmp	$eva_err$70412
$L70483:

; 152  : 		else

	jmp	SHORT $L70490
$L70415:

; 154  : 			/* Add paragraph modifier */
; 155  : 			if(align && *align) DYNBUF_ADD3(html, "<", align, 0, NO_CONV, ">");

	cmp	DWORD PTR _align$[ebp], 0
	je	SHORT $L70490
	mov	eax, DWORD PTR _align$[ebp]
	movsx	ecx, BYTE PTR [eax]
	test	ecx, ecx
	je	SHORT $L70490
	push	1
	push	OFFSET FLAT:$SG70491
	push	0
	push	0
	push	0
	mov	edx, DWORD PTR _align$[ebp]
	push	edx
	push	1
	push	OFFSET FLAT:$SG70492
	mov	eax, DWORD PTR _html$[ebp]
	push	eax
	call	_dynbuf_add3
	add	esp, 36					; 00000024H
	test	eax, eax
	je	SHORT $L70490
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29872], OFFSET FLAT:$SG70494
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 155		; 0000009bH
	jmp	$eva_err$70412
$L70490:

; 157  : 		if(nobreak) DYNBUF_ADD_STR(html, "<nobr>");

	cmp	DWORD PTR _nobreak$[ebp], 0
	je	SHORT $L70497
	push	0
	push	0
	push	6
	push	OFFSET FLAT:$SG70498
	mov	eax, DWORD PTR _html$[ebp]
	push	eax
	call	_dynbuf_add
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L70497
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29872], OFFSET FLAT:$SG70500
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 157		; 0000009dH
	jmp	$eva_err$70412
$L70497:

; 158  : 
; 159  : 		/* Add font modifiers */
; 160  : 		if(b_font)

	cmp	DWORD PTR _b_font$[ebp], 0
	je	$L70529

; 162  : 			DYNBUF_ADD_STR(html, "<font");

	push	0
	push	0
	push	5
	push	OFFSET FLAT:$SG70504
	mov	eax, DWORD PTR _html$[ebp]
	push	eax
	call	_dynbuf_add
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L70503
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29872], OFFSET FLAT:$SG70506
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 162		; 000000a2H
	jmp	$eva_err$70412
$L70503:

; 163  : 			if(fontface && *fontface) DYNBUF_ADD3(html, " face='", fontface, 0, NO_CONV, "'");

	cmp	DWORD PTR _fontface$[ebp], 0
	je	SHORT $L70509
	mov	eax, DWORD PTR _fontface$[ebp]
	movsx	ecx, BYTE PTR [eax]
	test	ecx, ecx
	je	SHORT $L70509
	push	1
	push	OFFSET FLAT:$SG70510
	push	0
	push	0
	push	0
	mov	edx, DWORD PTR _fontface$[ebp]
	push	edx
	push	7
	push	OFFSET FLAT:$SG70511
	mov	eax, DWORD PTR _html$[ebp]
	push	eax
	call	_dynbuf_add3
	add	esp, 36					; 00000024H
	test	eax, eax
	je	SHORT $L70509
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29872], OFFSET FLAT:$SG70513
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 163		; 000000a3H
	jmp	$eva_err$70412
$L70509:

; 164  : 			if(fontsize&& *fontsize) DYNBUF_ADD3(html, " size=", fontsize, 0, NO_CONV, "");

	cmp	DWORD PTR _fontsize$[ebp], 0
	je	SHORT $L70516
	mov	eax, DWORD PTR _fontsize$[ebp]
	movsx	ecx, BYTE PTR [eax]
	test	ecx, ecx
	je	SHORT $L70516
	push	0
	push	OFFSET FLAT:$SG70517
	push	0
	push	0
	push	0
	mov	edx, DWORD PTR _fontsize$[ebp]
	push	edx
	push	6
	push	OFFSET FLAT:$SG70518
	mov	eax, DWORD PTR _html$[ebp]
	push	eax
	call	_dynbuf_add3
	add	esp, 36					; 00000024H
	test	eax, eax
	je	SHORT $L70516
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29872], OFFSET FLAT:$SG70520
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 164		; 000000a4H
	jmp	$eva_err$70412
$L70516:

; 165  : 			if(fontcolor && strlen(fontcolor) == 6) DYNBUF_ADD3(html, " color=#", fontcolor, 0, NO_CONV, "");

	cmp	DWORD PTR _fontcolor$[ebp], 0
	je	SHORT $L70523
	mov	eax, DWORD PTR _fontcolor$[ebp]
	push	eax
	call	_strlen
	add	esp, 4
	cmp	eax, 6
	jne	SHORT $L70523
	push	0
	push	OFFSET FLAT:$SG70524
	push	0
	push	0
	push	0
	mov	ecx, DWORD PTR _fontcolor$[ebp]
	push	ecx
	push	8
	push	OFFSET FLAT:$SG70525
	mov	edx, DWORD PTR _html$[ebp]
	push	edx
	call	_dynbuf_add3
	add	esp, 36					; 00000024H
	test	eax, eax
	je	SHORT $L70523
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29872], OFFSET FLAT:$SG70527
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 165		; 000000a5H
	jmp	$eva_err$70412
$L70523:

; 166  : 			DYNBUF_ADD_STR(html, ">");

	push	0
	push	0
	push	1
	push	OFFSET FLAT:$SG70530
	mov	edx, DWORD PTR _html$[ebp]
	push	edx
	call	_dynbuf_add
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L70529
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29872], OFFSET FLAT:$SG70532
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 166		; 000000a6H
	jmp	$eva_err$70412
$L70529:

; 168  : 		if(bold) DYNBUF_ADD_STR(html, "<b>");

	cmp	DWORD PTR _bold$[ebp], 0
	je	SHORT $L70535
	push	0
	push	0
	push	3
	push	OFFSET FLAT:$SG70536
	mov	edx, DWORD PTR _html$[ebp]
	push	edx
	call	_dynbuf_add
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L70535
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29872], OFFSET FLAT:$SG70538
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 168		; 000000a8H
	jmp	$eva_err$70412
$L70535:

; 169  : 		if(italic) DYNBUF_ADD_STR(html, "<i>");

	cmp	DWORD PTR _italic$[ebp], 0
	je	SHORT $L70541
	push	0
	push	0
	push	3
	push	OFFSET FLAT:$SG70542
	mov	edx, DWORD PTR _html$[ebp]
	push	edx
	call	_dynbuf_add
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L70541
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29872], OFFSET FLAT:$SG70544
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 169		; 000000a9H
	jmp	$eva_err$70412
$L70541:

; 170  : 		if(underline) DYNBUF_ADD_STR(html, "<u>");

	cmp	DWORD PTR _underline$[ebp], 0
	je	SHORT $L70547
	push	0
	push	0
	push	3
	push	OFFSET FLAT:$SG70548
	mov	edx, DWORD PTR _html$[ebp]
	push	edx
	call	_dynbuf_add
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L70547
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29872], OFFSET FLAT:$SG70550
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 170		; 000000aaH
	jmp	$eva_err$70412
$L70547:

; 172  : 	else	/* Control footer */

	jmp	$L70586
$L70414:

; 174  : 		/* Terminate font modifiers */
; 175  : 		if(underline) DYNBUF_ADD_STR(html, "</u>");

	cmp	DWORD PTR _underline$[ebp], 0
	je	SHORT $L70554
	push	0
	push	0
	push	4
	push	OFFSET FLAT:$SG70555
	mov	edx, DWORD PTR _html$[ebp]
	push	edx
	call	_dynbuf_add
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L70554
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29872], OFFSET FLAT:$SG70557
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 175		; 000000afH
	jmp	$eva_err$70412
$L70554:

; 176  : 		if(italic) DYNBUF_ADD_STR(html, "</i>");

	cmp	DWORD PTR _italic$[ebp], 0
	je	SHORT $L70560
	push	0
	push	0
	push	4
	push	OFFSET FLAT:$SG70561
	mov	edx, DWORD PTR _html$[ebp]
	push	edx
	call	_dynbuf_add
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L70560
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29872], OFFSET FLAT:$SG70563
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 176		; 000000b0H
	jmp	$eva_err$70412
$L70560:

; 177  : 		if(bold) DYNBUF_ADD_STR(html, "</b>");

	cmp	DWORD PTR _bold$[ebp], 0
	je	SHORT $L70566
	push	0
	push	0
	push	4
	push	OFFSET FLAT:$SG70567
	mov	edx, DWORD PTR _html$[ebp]
	push	edx
	call	_dynbuf_add
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L70566
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29872], OFFSET FLAT:$SG70569
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 177		; 000000b1H
	jmp	$eva_err$70412
$L70566:

; 178  : 		if(b_font) DYNBUF_ADD_STR(html, "</font>");

	cmp	DWORD PTR _b_font$[ebp], 0
	je	SHORT $L70572
	push	0
	push	0
	push	7
	push	OFFSET FLAT:$SG70573
	mov	edx, DWORD PTR _html$[ebp]
	push	edx
	call	_dynbuf_add
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L70572
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29872], OFFSET FLAT:$SG70575
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 178		; 000000b2H
	jmp	$eva_err$70412
$L70572:

; 179  : 
; 180  : 		/* Terminate cell / paragraph */
; 181  : 		if(tag)

	cmp	DWORD PTR _tag$[ebp], 0
	je	SHORT $L70576

; 183  : 			DYNBUF_ADD3(html, "</", tag, 0, NO_CONV, ">");

	push	1
	push	OFFSET FLAT:$SG70579
	push	0
	push	0
	push	0
	mov	edx, DWORD PTR _tag$[ebp]
	push	edx
	push	2
	push	OFFSET FLAT:$SG70580
	mov	eax, DWORD PTR _html$[ebp]
	push	eax
	call	_dynbuf_add3
	add	esp, 36					; 00000024H
	test	eax, eax
	je	SHORT $L70578
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29872], OFFSET FLAT:$SG70582
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 183		; 000000b7H
	jmp	SHORT $eva_err$70412
$L70578:

; 185  : 		else

	jmp	SHORT $L70586
$L70576:

; 187  : 			if(align && *align) DYNBUF_ADD3(html, "</", align, 0, NO_CONV, ">");

	cmp	DWORD PTR _align$[ebp], 0
	je	SHORT $L70586
	mov	eax, DWORD PTR _align$[ebp]
	movsx	ecx, BYTE PTR [eax]
	test	ecx, ecx
	je	SHORT $L70586
	push	1
	push	OFFSET FLAT:$SG70587
	push	0
	push	0
	push	0
	mov	edx, DWORD PTR _align$[ebp]
	push	edx
	push	2
	push	OFFSET FLAT:$SG70588
	mov	eax, DWORD PTR _html$[ebp]
	push	eax
	call	_dynbuf_add3
	add	esp, 36					; 00000024H
	test	eax, eax
	je	SHORT $L70586
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29872], OFFSET FLAT:$SG70590
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 187		; 000000bbH
	jmp	SHORT $eva_err$70412
$L70586:
$eva_noerr$70591:

; 190  : 	RETURN_OK_CLEANUP;

	push	0
	push	OFFSET FLAT:$SG70592
	push	OFFSET FLAT:$SG70593
	mov	eax, DWORD PTR _cntxt$[ebp]
	push	eax
	call	_err_clear
	add	esp, 16					; 00000010H
$eva_err$70412:
	mov	ecx, DWORD PTR _cntxt$[ebp]
	cmp	DWORD PTR [ecx+29872], 0
	je	SHORT $L70594
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	eax, DWORD PTR [edx+29900]
	push	eax
	push	OFFSET FLAT:$SG70595
	push	OFFSET FLAT:$SG70596
	mov	ecx, DWORD PTR _cntxt$[ebp]
	push	ecx
	call	_err_add_context
	add	esp, 16					; 00000010H
$L70594:
	mov	edx, DWORD PTR _img$[ebp]
	push	edx
	call	_mem_free
	add	esp, 4
	mov	DWORD PTR _img$[ebp], 0
	mov	eax, DWORD PTR _cntxt$[ebp]
	xor	ecx, ecx
	cmp	DWORD PTR [eax+29872], 0
	setne	cl
	mov	eax, ecx
$L70372:

; 191  : }

	mov	esp, ebp
	pop	ebp
	ret	0
_put_html_format_pos ENDP
_TEXT	ENDS
PUBLIC	_put_html_page_header
EXTRN	__iob:BYTE
EXTRN	_datetxt_now:NEAR
EXTRN	_fflush:NEAR
EXTRN	_fprintf:NEAR
EXTRN	_printf:NEAR
EXTRN	__snprintf:NEAR
EXTRN	_stat:NEAR
EXTRN	_getenv:NEAR
EXTRN	_rand:NEAR
EXTRN	_dyntab_val:NEAR
EXTRN	_strchr:NEAR
EXTRN	_dyntab_field_val:NEAR
_BSS	SEGMENT
	ALIGN	4

$SG70667 DB	01H DUP (?)
	ALIGN	4

$SG70690 DB	01H DUP (?)
_BSS	ENDS
_DATA	SEGMENT
$SG70613 DB	'EVA - %s', 00H
	ORG $+3
$SG70616 DB	'HTTP_COOKIE', 00H
$SG70625 DB	'%s-%x', 00H
	ORG $+2
$SG70627 DB	'Set-Cookie: WKS=%s; expires=Monday, 15-Jun-2020 00:00:00'
	DB	' GMT;', 0aH, 00H
	ORG $+1
$SG70628 DB	'Content-Type:text/html;charset=iso-8859-1', 0dH, 0aH, 0aH
	DB	00H
	ORG $+3
$SG70631 DB	'<html><head><title>%s</title>', 00H
	ORG $+2
$SG70632 DB	'<script type=text/javascript src=../js/eva.js></script><'
	DB	'link href=../css/eva.css rel=stylesheet type=text/css>', 00H
	ORG $+1
$SG70635 DB	'_EVA_IMGPATH', 00H
	ORG $+3
$SG70638 DB	'..\css\%s.css', 00H
	ORG $+2
$SG70640 DB	'<link href=../css/%s.css rel=stylesheet type=text/css>', 00H
	ORG $+1
$SG70641 DB	'</head>', 00H
$SG70644 DB	'_EVA_PAGE_BGCOLOR', 00H
	ORG $+2
$SG70646 DB	'_EVA_PAGE_BACKGROUND', 00H
	ORG $+3
$SG70648 DB	'_EVA_PAGE_BGCOLOR', 00H
	ORG $+2
$SG70650 DB	'_EVA_PAGE_BACKGROUND', 00H
	ORG $+3
$SG70651 DB	'<body leftmargin=0 topmargin=0 rightmargin=0 bottommargi'
	DB	'n=0', 00H
$SG70652 DB	'%s', 00H
	ORG $+1
$SG70654 DB	' background=''%s''', 00H
	ORG $+3
$SG70656 DB	' bgcolor=#%s', 00H
	ORG $+3
$SG70657 DB	'>', 00H
	ORG $+2
$SG70659 DB	'<script>document.write("<img src=''../img/_eva_imgwait.g'
	DB	'if''>");</script>', 00H
$SG70660 DB	'%s', 00H
	ORG $+1
$SG70663 DB	0aH, '<script type=text/javascript src=../js/color.js></s'
	DB	'cript>', 00H
	ORG $+1
$SG70665 DB	''',theme_advanced_buttons2 : '''',theme_advanced_buttons'
	DB	'3 : '''',convert_urls : ''false'',theme_advanced_fonts : ''Ar'
	DB	'ial=arial,helvetica,sans-serif;Courier New=courier new,courie'
	DB	'r,monospace;Impact=impact,chicago;Verdana=verdana,geneva'',th'
	DB	'eme_advanced_toolbar_align : ''left'',theme_advanced_toolbar_'
	DB	'location : ''top''});</script>', 00H
	ORG $+2
$SG70666 DB	',code', 00H
	ORG $+2
$SG70668 DB	'bold,italic,underline,separator,justifyleft,justifycente'
	DB	'r,separator,bullist,numlist,separator,removeformat,undo,redo,'
	DB	'separator,hr,charmap', 00H
	ORG $+2
$SG70669 DB	'bold,italic,underline,sup,separator,justifyleft,justifyc'
	DB	'enter,separator,bullist,numlist,indent,outdent,separator,font'
	DB	'sizeselect,forecolor,separator,image,link,unlink,separator,re'
	DB	'moveformat,undo,redo,separator,hr,charmap', 00H
$SG70670 DB	'bold,italic,underline,sub,sup,strikethrough,separator,ju'
	DB	'stifyleft,justifycenter,justifyright,justifyfull,separator,bu'
	DB	'llist,numlist,indent,outdent,separator,image,link,unlink,sepa'
	DB	'rator,fontselect,fontsizeselect,forecolor,backcolor,separator'
	DB	',removeformat,undo,redo,separator,hr,charmap,help', 00H
	ORG $+3
$SG70671 DB	'.css'',entity_encoding : ''raw'',entities : ''38,amp,60,'
	DB	'lt,62,gt'',cleanup_on_startup : true,apply_source_formatting '
	DB	': true,preformatted : false,theme_advanced_buttons1 : ''', 00H
$SG70672 DB	'<script type=text/javascript src=../js/tiny_mce/tiny_mce'
	DB	'.js></script><script type=text/javascript>tinyMCE.init({mode '
	DB	': ''specific_textareas'',language : ''fr'',content_css : ''/c'
	DB	'ss/', 00H
	ORG $+3
$SG70673 DB	'%s%s%s%s%s%s', 00H
	ORG $+3
$SG70675 DB	'<script type=text/javascript src=../js/scw.js></script>', 00H
$SG70677 DB	'<form name=''mainform''', 00H
	ORG $+2
$SG70679 DB	' action=''/eva/%s.cgi', 00H
	ORG $+3
$SG70681 DB	'?%s', 00H
$SG70682 DB	''' method=post', 00H
	ORG $+2
$SG70683 DB	'%s', 00H
	ORG $+1
$SG70685 DB	' enctype=''multipart/form-data''', 00H
	ORG $+1
$SG70686 DB	'%s', 00H
	ORG $+1
$SG70687 DB	'>', 00H
	ORG $+2
$SG70689 DB	'document.getElementsByTagName(''body'')[0].removeChild(d'
	DB	'ocument.images[0]);', 00H
	ORG $+2
$SG70691 DB	'<script>%sdocument.write("<input type=hidden name=JSINPU'
	DB	'T>");</script>', 00H
_DATA	ENDS
_TEXT	SEGMENT
_cntxt$ = 8
_f$ = 12
_title$ = 16
_action$ = 20
_steps$ = 24
_tit$70612 = -64
_cook$70615 = -68
_end$70617 = -72
_id$70624 = -200
_cssname$70633 = -492
_cssfile$70634 = -496
_fs$70636 = -236
_bgcolor$70643 = -504
_background$70645 = -500
_put_html_page_header PROC NEAR

; 209  : ){

	push	ebp
	mov	ebp, esp
	sub	esp, 596				; 00000254H
	push	edi

; 210  : 	if(!cntxt || cntxt->b_task) return;

	cmp	DWORD PTR _cntxt$[ebp], 0
	je	SHORT $L70610
	mov	eax, DWORD PTR _cntxt$[ebp]
	cmp	DWORD PTR [eax+29756], 0
	je	SHORT $L70609
$L70610:
	jmp	$L70608
$L70609:

; 211  : 
; 212  : 	/* Output HTML header if applicable */
; 213  : 	if(!cntxt->b_header)

	mov	ecx, DWORD PTR _cntxt$[ebp]
	cmp	DWORD PTR [ecx+29760], 0
	jne	$L70611

; 215  : 		char tit[64] = {0};

	mov	BYTE PTR _tit$70612[ebp], 0
	mov	ecx, 15					; 0000000fH
	xor	eax, eax
	lea	edi, DWORD PTR _tit$70612[ebp+1]
	rep stosd
	stosw
	stosb

; 216  : 		snprintf(add_sz_str(tit), "EVA - %s", cntxt->dbname);

	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	eax, DWORD PTR [edx+29804]
	push	eax
	push	OFFSET FLAT:$SG70613
	push	63					; 0000003fH
	lea	ecx, DWORD PTR _tit$70612[ebp]
	push	ecx
	call	__snprintf
	add	esp, 16					; 00000010H

; 217  : 		if(!f)

	cmp	DWORD PTR _f$[ebp], 0
	jne	$L70614

; 219  : 			/* Read existing workstation Id in cookies */
; 220  : 			char *cook = getenv("HTTP_COOKIE");

	push	OFFSET FLAT:$SG70616
	call	_getenv
	add	esp, 4
	mov	DWORD PTR _cook$70615[ebp], eax

; 221  : 			char *end = cook ? strchr(cook, ';') : NULL;

	cmp	DWORD PTR _cook$70615[ebp], 0
	je	SHORT $L70887
	push	59					; 0000003bH
	mov	edx, DWORD PTR _cook$70615[ebp]
	push	edx
	call	_strchr
	add	esp, 8
	mov	DWORD PTR -508+[ebp], eax
	jmp	SHORT $L70888
$L70887:
	mov	DWORD PTR -508+[ebp], 0
$L70888:
	mov	eax, DWORD PTR -508+[ebp]
	mov	DWORD PTR _end$70617[ebp], eax

; 222  : 			if(end) *end = 0;

	cmp	DWORD PTR _end$70617[ebp], 0
	je	SHORT $L70619
	mov	ecx, DWORD PTR _end$70617[ebp]
	mov	BYTE PTR [ecx], 0
$L70619:

; 223  : 			if(cook) cook = strchr(cook, '=');

	cmp	DWORD PTR _cook$70615[ebp], 0
	je	SHORT $L70620
	push	61					; 0000003dH
	mov	edx, DWORD PTR _cook$70615[ebp]
	push	edx
	call	_strchr
	add	esp, 8
	mov	DWORD PTR _cook$70615[ebp], eax
$L70620:

; 224  : 			if(cook) dynbuf_add(&cntxt->id_wks, cook + 1, 0, NO_CONV);

	cmp	DWORD PTR _cook$70615[ebp], 0
	je	SHORT $L70621
	push	0
	push	0
	push	0
	mov	eax, DWORD PTR _cook$70615[ebp]
	add	eax, 1
	push	eax
	mov	ecx, DWORD PTR _cntxt$[ebp]
	add	ecx, 29824				; 00007480H
	push	ecx
	call	_dynbuf_add
	add	esp, 20					; 00000014H
$L70621:

; 225  : 
; 226  : 			/* Build new Id & set cookie if none found */
; 227  : 			if(!cntxt->id_wks)

	mov	edx, DWORD PTR _cntxt$[ebp]
	cmp	DWORD PTR [edx+29824], 0
	jne	SHORT $L70626

; 229  : 				char id[128];
; 230  : 				snprintf(add_sz_str(id), "%s-%x", datetxt_now(), rand());

	call	_rand
	push	eax
	call	_datetxt_now
	push	eax
	push	OFFSET FLAT:$SG70625
	push	127					; 0000007fH
	lea	eax, DWORD PTR _id$70624[ebp]
	push	eax
	call	__snprintf
	add	esp, 20					; 00000014H

; 231  : 				if(*id) cntxt->txsize += printf(

	movsx	ecx, BYTE PTR _id$70624[ebp]
	test	ecx, ecx
	je	SHORT $L70626

; 232  : 					"Set-Cookie: WKS=%s; expires=Monday, 15-Jun-2020 00:00:00 GMT;\n", id);

	lea	edx, DWORD PTR _id$70624[ebp]
	push	edx
	push	OFFSET FLAT:$SG70627
	call	_printf
	add	esp, 8
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	edx, DWORD PTR [ecx+32036]
	add	edx, eax
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+32036], edx
$L70626:

; 234  : 
; 235  : 			/* Put HTML Content-Type header */
; 236  : 			cntxt->txsize += printf("Content-Type:text/html;charset=iso-8859-1\r\n\n");

	push	OFFSET FLAT:$SG70628
	call	_printf
	add	esp, 4
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	edx, DWORD PTR [ecx+32036]
	add	edx, eax
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+32036], edx
$L70614:

; 238  : 
; 239  : 		/* Put page title - disable cache */
; 240  : 		if(!title) title = dyntab_val(&cntxt->pagetitle, 0, 0);

	cmp	DWORD PTR _title$[ebp], 0
	jne	SHORT $L70629
	push	0
	push	0
	mov	ecx, DWORD PTR _cntxt$[ebp]
	add	ecx, 29468				; 0000731cH
	push	ecx
	call	_dyntab_val
	add	esp, 12					; 0000000cH
	mov	DWORD PTR _title$[ebp], eax
$L70629:

; 241  : 		if(!*title) title = tit;

	mov	edx, DWORD PTR _title$[ebp]
	movsx	eax, BYTE PTR [edx]
	test	eax, eax
	jne	SHORT $L70630
	lea	ecx, DWORD PTR _tit$70612[ebp]
	mov	DWORD PTR _title$[ebp], ecx
$L70630:

; 242  : 		cntxt->txsize += fprintf(f ? f : stdout,
; 243  : 			"<html><head><title>%s</title>", title);

	cmp	DWORD PTR _f$[ebp], 0
	je	SHORT $L70889
	mov	edx, DWORD PTR _f$[ebp]
	mov	DWORD PTR -512+[ebp], edx
	jmp	SHORT $L70890
$L70889:
	mov	DWORD PTR -512+[ebp], OFFSET FLAT:__iob+32
$L70890:
	mov	eax, DWORD PTR _title$[ebp]
	push	eax
	push	OFFSET FLAT:$SG70631
	mov	ecx, DWORD PTR -512+[ebp]
	push	ecx
	call	_fprintf
	add	esp, 12					; 0000000cH
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	ecx, DWORD PTR [edx+32036]
	add	ecx, eax
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+32036], ecx

; 244  : 		/* Disable cache for non administrator
; 245  : 		if(!cntxt->b_admin || f)
; 246  : 			cntxt->txsize += fprintf(f ? f : stdout,
; 247  : 				"<META HTTP-EQUIV='PRAGMA' CONTENT='NO-CACHE'>\n<META HTTP-EQUIV='CACHE-CONTROL' CONTENT='NO-CACHE'>");
; 248  : */
; 249  : 
; 250  : 		/* Output link to eva javascript && CSS files */
; 251  : 		cntxt->txsize += fprintf(f ? f : stdout,
; 252  : 				"<script type=text/javascript src=../js/eva.js></script>"
; 253  : 				"<link href=../css/eva.css rel=stylesheet type=text/css>");

	cmp	DWORD PTR _f$[ebp], 0
	je	SHORT $L70891
	mov	eax, DWORD PTR _f$[ebp]
	mov	DWORD PTR -516+[ebp], eax
	jmp	SHORT $L70892
$L70891:
	mov	DWORD PTR -516+[ebp], OFFSET FLAT:__iob+32
$L70892:
	push	OFFSET FLAT:$SG70632
	mov	ecx, DWORD PTR -516+[ebp]
	push	ecx
	call	_fprintf
	add	esp, 8
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	ecx, DWORD PTR [edx+32036]
	add	ecx, eax
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+32036], ecx

; 257  : 			char cssname[256], *cssfile = DYNTAB_FIELD_VAL(&cntxt->cnf_data, IMGPATH);

	push	0
	push	-1
	push	OFFSET FLAT:$SG70635
	mov	eax, DWORD PTR _cntxt$[ebp]
	add	eax, 29360				; 000072b0H
	push	eax
	call	_dyntab_field_val
	add	esp, 16					; 00000010H
	mov	DWORD PTR _cssfile$70634[ebp], eax

; 258  : 			struct stat fs;
; 259  : 			if(!*cssfile) cssfile = cntxt->dbname;

	mov	ecx, DWORD PTR _cssfile$70634[ebp]
	movsx	edx, BYTE PTR [ecx]
	test	edx, edx
	jne	SHORT $L70637
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	ecx, DWORD PTR [eax+29804]
	mov	DWORD PTR _cssfile$70634[ebp], ecx
$L70637:

; 260  : 			snprintf(add_sz_str(cssname), ".." DD "css" DD "%s.css", cssfile);

	mov	edx, DWORD PTR _cssfile$70634[ebp]
	push	edx
	push	OFFSET FLAT:$SG70638
	push	255					; 000000ffH
	lea	eax, DWORD PTR _cssname$70633[ebp]
	push	eax
	call	__snprintf
	add	esp, 16					; 00000010H

; 261  : 			if(!stat(cssname, &fs))

	lea	ecx, DWORD PTR _fs$70636[ebp]
	push	ecx
	lea	edx, DWORD PTR _cssname$70633[ebp]
	push	edx
	call	_stat
	add	esp, 8
	test	eax, eax
	jne	SHORT $L70639

; 262  : 				cntxt->txsize += fprintf(f ? f : stdout, "<link href=../css/%s.css rel=stylesheet type=text/css>", cssfile);

	cmp	DWORD PTR _f$[ebp], 0
	je	SHORT $L70893
	mov	eax, DWORD PTR _f$[ebp]
	mov	DWORD PTR -520+[ebp], eax
	jmp	SHORT $L70894
$L70893:
	mov	DWORD PTR -520+[ebp], OFFSET FLAT:__iob+32
$L70894:
	mov	ecx, DWORD PTR _cssfile$70634[ebp]
	push	ecx
	push	OFFSET FLAT:$SG70640
	mov	edx, DWORD PTR -520+[ebp]
	push	edx
	call	_fprintf
	add	esp, 12					; 0000000cH
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	edx, DWORD PTR [ecx+32036]
	add	edx, eax
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+32036], edx
$L70639:

; 264  : 
; 265  : 		cntxt->txsize += fprintf(f ? f : stdout, "</head>");

	cmp	DWORD PTR _f$[ebp], 0
	je	SHORT $L70895
	mov	ecx, DWORD PTR _f$[ebp]
	mov	DWORD PTR -524+[ebp], ecx
	jmp	SHORT $L70896
$L70895:
	mov	DWORD PTR -524+[ebp], OFFSET FLAT:__iob+32
$L70896:
	push	OFFSET FLAT:$SG70641
	mov	edx, DWORD PTR -524+[ebp]
	push	edx
	call	_fprintf
	add	esp, 8
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	edx, DWORD PTR [ecx+32036]
	add	edx, eax
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+32036], edx

; 266  : 		cntxt->b_header = 1;

	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29760], 1
$L70611:

; 268  : 
; 269  : 	/* Output body header if applicable */
; 270  : 	if(steps > 1 && !cntxt->b_bodyheader)

	cmp	DWORD PTR _steps$[ebp], 1
	jle	$L70642
	mov	edx, DWORD PTR _cntxt$[ebp]
	cmp	DWORD PTR [edx+29764], 0
	jne	$L70642

; 272  : 		/* Read applicable page background */
; 273  : 		char *bgcolor = DYNTAB_FIELD_VAL(&cntxt->user_data, PAGE_BGCOLOR);

	push	0
	push	-1
	push	OFFSET FLAT:$SG70644
	mov	eax, DWORD PTR _cntxt$[ebp]
	add	eax, 29428				; 000072f4H
	push	eax
	call	_dyntab_field_val
	add	esp, 16					; 00000010H
	mov	DWORD PTR _bgcolor$70643[ebp], eax

; 274  : 		char *background = DYNTAB_FIELD_VAL(&cntxt->user_data, PAGE_BACKGROUND);

	push	0
	push	-1
	push	OFFSET FLAT:$SG70646
	mov	ecx, DWORD PTR _cntxt$[ebp]
	add	ecx, 29428				; 000072f4H
	push	ecx
	call	_dyntab_field_val
	add	esp, 16					; 00000010H
	mov	DWORD PTR _background$70645[ebp], eax

; 275  : 		if(!*bgcolor) bgcolor = DYNTAB_FIELD_VAL(&cntxt->cnf_data, PAGE_BGCOLOR);

	mov	edx, DWORD PTR _bgcolor$70643[ebp]
	movsx	eax, BYTE PTR [edx]
	test	eax, eax
	jne	SHORT $L70647
	push	0
	push	-1
	push	OFFSET FLAT:$SG70648
	mov	ecx, DWORD PTR _cntxt$[ebp]
	add	ecx, 29360				; 000072b0H
	push	ecx
	call	_dyntab_field_val
	add	esp, 16					; 00000010H
	mov	DWORD PTR _bgcolor$70643[ebp], eax
$L70647:

; 276  : 		if(!*background) background = DYNTAB_FIELD_VAL(&cntxt->cnf_data, PAGE_BACKGROUND);

	mov	edx, DWORD PTR _background$70645[ebp]
	movsx	eax, BYTE PTR [edx]
	test	eax, eax
	jne	SHORT $L70649
	push	0
	push	-1
	push	OFFSET FLAT:$SG70650
	mov	ecx, DWORD PTR _cntxt$[ebp]
	add	ecx, 29360				; 000072b0H
	push	ecx
	call	_dyntab_field_val
	add	esp, 16					; 00000010H
	mov	DWORD PTR _background$70645[ebp], eax
$L70649:

; 277  : 		background = get_image_file(cntxt, background, 0, 0);

	push	0
	push	0
	mov	edx, DWORD PTR _background$70645[ebp]
	push	edx
	mov	eax, DWORD PTR _cntxt$[ebp]
	push	eax
	call	_get_image_file
	add	esp, 16					; 00000010H
	mov	DWORD PTR _background$70645[ebp], eax

; 278  : 
; 279  : 		/* Put body header */
; 280  : 		cntxt->txsize += fprintf(f ? f : stdout, "%s", "<body leftmargin=0 topmargin=0 rightmargin=0 bottommargin=0");

	cmp	DWORD PTR _f$[ebp], 0
	je	SHORT $L70897
	mov	ecx, DWORD PTR _f$[ebp]
	mov	DWORD PTR -528+[ebp], ecx
	jmp	SHORT $L70898
$L70897:
	mov	DWORD PTR -528+[ebp], OFFSET FLAT:__iob+32
$L70898:
	push	OFFSET FLAT:$SG70651
	push	OFFSET FLAT:$SG70652
	mov	edx, DWORD PTR -528+[ebp]
	push	edx
	call	_fprintf
	add	esp, 12					; 0000000cH
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	edx, DWORD PTR [ecx+32036]
	add	edx, eax
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+32036], edx

; 281  : 		if(background) cntxt->txsize += fprintf(f ? f : stdout, " background='%s'", background);

	cmp	DWORD PTR _background$70645[ebp], 0
	je	SHORT $L70653
	cmp	DWORD PTR _f$[ebp], 0
	je	SHORT $L70899
	mov	ecx, DWORD PTR _f$[ebp]
	mov	DWORD PTR -532+[ebp], ecx
	jmp	SHORT $L70900
$L70899:
	mov	DWORD PTR -532+[ebp], OFFSET FLAT:__iob+32
$L70900:
	mov	edx, DWORD PTR _background$70645[ebp]
	push	edx
	push	OFFSET FLAT:$SG70654
	mov	eax, DWORD PTR -532+[ebp]
	push	eax
	call	_fprintf
	add	esp, 12					; 0000000cH
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	edx, DWORD PTR [ecx+32036]
	add	edx, eax
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+32036], edx
$L70653:

; 282  : 		if(*bgcolor) cntxt->txsize += fprintf(f ? f : stdout, " bgcolor=#%s", bgcolor);

	mov	ecx, DWORD PTR _bgcolor$70643[ebp]
	movsx	edx, BYTE PTR [ecx]
	test	edx, edx
	je	SHORT $L70655
	cmp	DWORD PTR _f$[ebp], 0
	je	SHORT $L70901
	mov	eax, DWORD PTR _f$[ebp]
	mov	DWORD PTR -536+[ebp], eax
	jmp	SHORT $L70902
$L70901:
	mov	DWORD PTR -536+[ebp], OFFSET FLAT:__iob+32
$L70902:
	mov	ecx, DWORD PTR _bgcolor$70643[ebp]
	push	ecx
	push	OFFSET FLAT:$SG70656
	mov	edx, DWORD PTR -536+[ebp]
	push	edx
	call	_fprintf
	add	esp, 12					; 0000000cH
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	edx, DWORD PTR [ecx+32036]
	add	edx, eax
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+32036], edx
$L70655:

; 283  : 		cntxt->txsize += fprintf(f ? f : stdout, ">");

	cmp	DWORD PTR _f$[ebp], 0
	je	SHORT $L70903
	mov	ecx, DWORD PTR _f$[ebp]
	mov	DWORD PTR -540+[ebp], ecx
	jmp	SHORT $L70904
$L70903:
	mov	DWORD PTR -540+[ebp], OFFSET FLAT:__iob+32
$L70904:
	push	OFFSET FLAT:$SG70657
	mov	edx, DWORD PTR -540+[ebp]
	push	edx
	call	_fprintf
	add	esp, 8
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	edx, DWORD PTR [ecx+32036]
	add	edx, eax
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+32036], edx

; 284  : 		if(cntxt->imgwait && !f) cntxt->txsize += fprintf(f ? f : stdout,	"%s",

	mov	ecx, DWORD PTR _cntxt$[ebp]
	cmp	DWORD PTR [ecx+29672], 0
	je	SHORT $L70658
	cmp	DWORD PTR _f$[ebp], 0
	jne	SHORT $L70658

; 285  : 			"<script>document.write(\"<img src='../img/_eva_imgwait.gif'>\");</script>");

	cmp	DWORD PTR _f$[ebp], 0
	je	SHORT $L70905
	mov	edx, DWORD PTR _f$[ebp]
	mov	DWORD PTR -544+[ebp], edx
	jmp	SHORT $L70906
$L70905:
	mov	DWORD PTR -544+[ebp], OFFSET FLAT:__iob+32
$L70906:
	push	OFFSET FLAT:$SG70659
	push	OFFSET FLAT:$SG70660
	mov	eax, DWORD PTR -544+[ebp]
	push	eax
	call	_fprintf
	add	esp, 12					; 0000000cH
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	edx, DWORD PTR [ecx+32036]
	add	edx, eax
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+32036], edx
$L70658:

; 286  : 		cntxt->b_bodyheader = 1;

	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29764], 1

; 287  : 		M_FREE(background);

	mov	edx, DWORD PTR _background$70645[ebp]
	push	edx
	call	_mem_free
	add	esp, 4
	mov	DWORD PTR _background$70645[ebp], 0
$L70642:

; 289  : 
; 290  : 	/* Output form header if applicable */
; 291  : 	if(steps > 2 && !cntxt->b_formheader)

	cmp	DWORD PTR _steps$[ebp], 2
	jle	$L70661
	mov	eax, DWORD PTR _cntxt$[ebp]
	cmp	DWORD PTR [eax+29768], 0
	jne	$L70661

; 293  : 
; 294  : 		/* Output links to specific javascript modules */
; 295  : 		if(cntxt->jsColorInput)

	mov	ecx, DWORD PTR _cntxt$[ebp]
	cmp	DWORD PTR [ecx+29688], 0
	je	SHORT $L70662

; 296  : 			cntxt->txsize += fprintf(f ? f : stdout, "\n<script type=text/javascript src=../js/color.js></script>");

	cmp	DWORD PTR _f$[ebp], 0
	je	SHORT $L70907
	mov	edx, DWORD PTR _f$[ebp]
	mov	DWORD PTR -548+[ebp], edx
	jmp	SHORT $L70908
$L70907:
	mov	DWORD PTR -548+[ebp], OFFSET FLAT:__iob+32
$L70908:
	push	OFFSET FLAT:$SG70663
	mov	eax, DWORD PTR -548+[ebp]
	push	eax
	call	_fprintf
	add	esp, 8
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	edx, DWORD PTR [ecx+32036]
	add	edx, eax
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+32036], edx
$L70662:

; 297  : 		if(cntxt->jsenabled && cntxt->jsHTMLEditor)

	mov	ecx, DWORD PTR _cntxt$[ebp]
	cmp	DWORD PTR [ecx+29676], 0
	je	$L70664
	mov	edx, DWORD PTR _cntxt$[ebp]
	cmp	DWORD PTR [edx+29680], 0
	je	$L70664

; 299  : 			/* Insert TinyMCE code & configuration */
; 300  : 			cntxt->txsize += fprintf(f ? f : stdout, "%s%s%s%s%s%s",
; 301  : 					"<script type=text/javascript src=../js/tiny_mce/tiny_mce.js></script>"
; 302  : 					"<script type=text/javascript>"
; 303  : 					"tinyMCE.init({"
; 304  : 						"mode : 'specific_textareas',"
; 305  : 						"language : 'fr',"
; 306  : 						"content_css : '/css/", cntxt->dbname, ".css',"
; 307  : 						"entity_encoding : 'raw',"
; 308  : 						"entities : '38,amp,60,lt,62,gt',"
; 309  : 						"cleanup_on_startup : true,"
; 310  : 						"apply_source_formatting : true,"
; 311  : 						"preformatted : false,"
; 312  : 						"theme_advanced_buttons1 : '",
; 313  : 						(cntxt->jsHTMLEditor == 1) ?
; 314  : 							"bold,italic,underline,separator,justifyleft,justifycenter,separator,bullist,numlist,separator,"
; 315  : 							"removeformat,undo,redo,separator,hr,charmap" :
; 316  : 						(cntxt->jsHTMLEditor == 2) ?
; 317  : 							"bold,italic,underline,sup,separator,justifyleft,justifycenter,separator,bullist,numlist,indent,outdent,separator,"
; 318  : 							"fontsizeselect,forecolor,separator,image,link,unlink,separator,removeformat,undo,redo,separator,hr,charmap" :
; 319  : 							"bold,italic,underline,sub,sup,strikethrough,separator,justifyleft,justifycenter,justifyright,justifyfull,separator,bullist,numlist,indent,outdent,separator,"
; 320  : 							"image,link,unlink,separator,fontselect,fontsizeselect,forecolor,backcolor,separator,removeformat,undo,redo,separator,hr,charmap,help",
; 321  : 						(cntxt->b_admin || cntxt->jsHTMLEditor == 3) ? ",code" : "",
; 322  : 						"',"
; 323  : 						"theme_advanced_buttons2 : '',"
; 324  : 						"theme_advanced_buttons3 : '',"
; 325  : 						"convert_urls : 'false',"
; 326  : 						"theme_advanced_fonts : 'Arial=arial,helvetica,sans-serif;Courier New=courier new,courier,monospace;Impact=impact,chicago;Verdana=verdana,geneva',"
; 327  : 						"theme_advanced_toolbar_align : 'left',"
; 328  : 						"theme_advanced_toolbar_location : 'top'"
; 329  : 					"});</script>");

	mov	eax, DWORD PTR _cntxt$[ebp]
	cmp	DWORD PTR [eax+29612], 0
	jne	SHORT $L70909
	mov	ecx, DWORD PTR _cntxt$[ebp]
	cmp	DWORD PTR [ecx+29680], 3
	je	SHORT $L70909
	mov	DWORD PTR -552+[ebp], OFFSET FLAT:$SG70667
	jmp	SHORT $L70910
$L70909:
	mov	DWORD PTR -552+[ebp], OFFSET FLAT:$SG70666
$L70910:
	mov	edx, DWORD PTR _cntxt$[ebp]
	cmp	DWORD PTR [edx+29680], 1
	jne	SHORT $L70913
	mov	DWORD PTR -556+[ebp], OFFSET FLAT:$SG70668
	jmp	SHORT $L70914
$L70913:
	mov	eax, DWORD PTR _cntxt$[ebp]
	cmp	DWORD PTR [eax+29680], 2
	jne	SHORT $L70911
	mov	DWORD PTR -560+[ebp], OFFSET FLAT:$SG70669
	jmp	SHORT $L70912
$L70911:
	mov	DWORD PTR -560+[ebp], OFFSET FLAT:$SG70670
$L70912:
	mov	ecx, DWORD PTR -560+[ebp]
	mov	DWORD PTR -556+[ebp], ecx
$L70914:
	cmp	DWORD PTR _f$[ebp], 0
	je	SHORT $L70915
	mov	edx, DWORD PTR _f$[ebp]
	mov	DWORD PTR -564+[ebp], edx
	jmp	SHORT $L70916
$L70915:
	mov	DWORD PTR -564+[ebp], OFFSET FLAT:__iob+32
$L70916:
	push	OFFSET FLAT:$SG70665
	mov	eax, DWORD PTR -552+[ebp]
	push	eax
	mov	ecx, DWORD PTR -556+[ebp]
	push	ecx
	push	OFFSET FLAT:$SG70671
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	eax, DWORD PTR [edx+29804]
	push	eax
	push	OFFSET FLAT:$SG70672
	push	OFFSET FLAT:$SG70673
	mov	ecx, DWORD PTR -564+[ebp]
	push	ecx
	call	_fprintf
	add	esp, 32					; 00000020H
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	ecx, DWORD PTR [edx+32036]
	add	ecx, eax
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+32036], ecx
$L70664:

; 331  : 		if(cntxt->jsenabled && cntxt->jsCalendarInput)

	mov	eax, DWORD PTR _cntxt$[ebp]
	cmp	DWORD PTR [eax+29676], 0
	je	SHORT $L70674
	mov	ecx, DWORD PTR _cntxt$[ebp]
	cmp	DWORD PTR [ecx+29684], 0
	je	SHORT $L70674

; 333  : 			/* Insert SCW calendar input code  */
; 334  : 			cntxt->txsize += fprintf(f ? f : stdout,
; 335  : 					"<script type=text/javascript src=../js/scw.js></script>");

	cmp	DWORD PTR _f$[ebp], 0
	je	SHORT $L70917
	mov	edx, DWORD PTR _f$[ebp]
	mov	DWORD PTR -568+[ebp], edx
	jmp	SHORT $L70918
$L70917:
	mov	DWORD PTR -568+[ebp], OFFSET FLAT:__iob+32
$L70918:
	push	OFFSET FLAT:$SG70675
	mov	eax, DWORD PTR -568+[ebp]
	push	eax
	call	_fprintf
	add	esp, 8
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	edx, DWORD PTR [ecx+32036]
	add	edx, eax
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+32036], edx
$L70674:

; 337  : 
; 338  : 
; 339  : 		if(!(cntxt->b_terminate & 64))

	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	edx, DWORD PTR [ecx+29776]
	and	edx, 64					; 00000040H
	test	edx, edx
	jne	$L70676

; 341  : 			cntxt->txsize += fprintf(f ? f : stdout, "<form name='mainform'");

	cmp	DWORD PTR _f$[ebp], 0
	je	SHORT $L70919
	mov	eax, DWORD PTR _f$[ebp]
	mov	DWORD PTR -572+[ebp], eax
	jmp	SHORT $L70920
$L70919:
	mov	DWORD PTR -572+[ebp], OFFSET FLAT:__iob+32
$L70920:
	push	OFFSET FLAT:$SG70677
	mov	ecx, DWORD PTR -572+[ebp]
	push	ecx
	call	_fprintf
	add	esp, 8
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	ecx, DWORD PTR [edx+32036]
	add	ecx, eax
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+32036], ecx

; 342  : 			if(!f)

	cmp	DWORD PTR _f$[ebp], 0
	jne	$L70684

; 344  : 				cntxt->txsize += fprintf(f ? f : stdout, " action='/eva/%s.cgi", cntxt->dbname);

	cmp	DWORD PTR _f$[ebp], 0
	je	SHORT $L70921
	mov	eax, DWORD PTR _f$[ebp]
	mov	DWORD PTR -576+[ebp], eax
	jmp	SHORT $L70922
$L70921:
	mov	DWORD PTR -576+[ebp], OFFSET FLAT:__iob+32
$L70922:
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	edx, DWORD PTR [ecx+29804]
	push	edx
	push	OFFSET FLAT:$SG70679
	mov	eax, DWORD PTR -576+[ebp]
	push	eax
	call	_fprintf
	add	esp, 12					; 0000000cH
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	edx, DWORD PTR [ecx+32036]
	add	edx, eax
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+32036], edx

; 345  : 				if(action) cntxt->txsize += fprintf(f ? f : stdout, "?%s", action);

	cmp	DWORD PTR _action$[ebp], 0
	je	SHORT $L70680
	cmp	DWORD PTR _f$[ebp], 0
	je	SHORT $L70923
	mov	ecx, DWORD PTR _f$[ebp]
	mov	DWORD PTR -580+[ebp], ecx
	jmp	SHORT $L70924
$L70923:
	mov	DWORD PTR -580+[ebp], OFFSET FLAT:__iob+32
$L70924:
	mov	edx, DWORD PTR _action$[ebp]
	push	edx
	push	OFFSET FLAT:$SG70681
	mov	eax, DWORD PTR -580+[ebp]
	push	eax
	call	_fprintf
	add	esp, 12					; 0000000cH
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	edx, DWORD PTR [ecx+32036]
	add	edx, eax
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+32036], edx
$L70680:

; 346  : 				cntxt->txsize += fprintf(f ? f : stdout, "%s", "' method=post");

	cmp	DWORD PTR _f$[ebp], 0
	je	SHORT $L70925
	mov	ecx, DWORD PTR _f$[ebp]
	mov	DWORD PTR -584+[ebp], ecx
	jmp	SHORT $L70926
$L70925:
	mov	DWORD PTR -584+[ebp], OFFSET FLAT:__iob+32
$L70926:
	push	OFFSET FLAT:$SG70682
	push	OFFSET FLAT:$SG70683
	mov	edx, DWORD PTR -584+[ebp]
	push	edx
	call	_fprintf
	add	esp, 12					; 0000000cH
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	edx, DWORD PTR [ecx+32036]
	add	edx, eax
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+32036], edx

; 347  : 				if(cntxt->cgiencodemultipart) cntxt->txsize += fprintf(f ? f : stdout, "%s", " enctype='multipart/form-data'");

	mov	ecx, DWORD PTR _cntxt$[ebp]
	cmp	DWORD PTR [ecx+29668], 0
	je	SHORT $L70684
	cmp	DWORD PTR _f$[ebp], 0
	je	SHORT $L70927
	mov	edx, DWORD PTR _f$[ebp]
	mov	DWORD PTR -588+[ebp], edx
	jmp	SHORT $L70928
$L70927:
	mov	DWORD PTR -588+[ebp], OFFSET FLAT:__iob+32
$L70928:
	push	OFFSET FLAT:$SG70685
	push	OFFSET FLAT:$SG70686
	mov	eax, DWORD PTR -588+[ebp]
	push	eax
	call	_fprintf
	add	esp, 12					; 0000000cH
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	edx, DWORD PTR [ecx+32036]
	add	edx, eax
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+32036], edx
$L70684:

; 349  : 			cntxt->txsize += fprintf(f ? f : stdout, ">");

	cmp	DWORD PTR _f$[ebp], 0
	je	SHORT $L70929
	mov	ecx, DWORD PTR _f$[ebp]
	mov	DWORD PTR -592+[ebp], ecx
	jmp	SHORT $L70930
$L70929:
	mov	DWORD PTR -592+[ebp], OFFSET FLAT:__iob+32
$L70930:
	push	OFFSET FLAT:$SG70687
	mov	edx, DWORD PTR -592+[ebp]
	push	edx
	call	_fprintf
	add	esp, 8
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	edx, DWORD PTR [ecx+32036]
	add	edx, eax
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+32036], edx
$L70676:

; 351  : 		if(!f) cntxt->txsize += fprintf(stdout,

	cmp	DWORD PTR _f$[ebp], 0
	jne	SHORT $L70688

; 352  : 			"<script>%s"
; 353  : 			"document.write(\"<input type=hidden name=JSINPUT>\");"
; 354  : 			"</script>",
; 355  : 			cntxt->imgwait ? "document.getElementsByTagName('body')[0].removeChild(document.images[0]);" : "");

	mov	ecx, DWORD PTR _cntxt$[ebp]
	cmp	DWORD PTR [ecx+29672], 0
	je	SHORT $L70931
	mov	DWORD PTR -596+[ebp], OFFSET FLAT:$SG70689
	jmp	SHORT $L70932
$L70931:
	mov	DWORD PTR -596+[ebp], OFFSET FLAT:$SG70690
$L70932:
	mov	edx, DWORD PTR -596+[ebp]
	push	edx
	push	OFFSET FLAT:$SG70691
	push	OFFSET FLAT:__iob+32
	call	_fprintf
	add	esp, 12					; 0000000cH
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	edx, DWORD PTR [ecx+32036]
	add	edx, eax
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+32036], edx
$L70688:

; 356  : 		cntxt->b_formheader = 1;

	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29768], 1
$L70661:

; 358  : 	fflush(stdout);

	push	OFFSET FLAT:__iob+32
	call	_fflush
	add	esp, 4
$L70608:

; 359  : }

	pop	edi
	mov	esp, ebp
	pop	ebp
	ret	0
_put_html_page_header ENDP
_TEXT	ENDS
PUBLIC	_put_html_page_trailer
PUBLIC	__real@8@4008fa00000000000000
PUBLIC	__real@8@3fff8000000000000000
EXTRN	_human_filesize:NEAR
EXTRN	__ftol:NEAR
EXTRN	__fltused:NEAR
EXTRN	_clock:NEAR
EXTRN	_form_get_html:NEAR
EXTRN	_calloc:NEAR
EXTRN	_free:NEAR
EXTRN	_strtoul:NEAR
EXTRN	_dyntab_sz:NEAR
EXTRN	_memcpy:NEAR
EXTRN	_put_debug_msg:NEAR
_BSS	SEGMENT
	ALIGN	4

$SG70735 DB	01H DUP (?)
	ALIGN	4

$SG70752 DB	01H DUP (?)
	ALIGN	4

$SG70758 DB	01H DUP (?)
	ALIGN	4

$SG70763 DB	01H DUP (?)
	ALIGN	4

$SG70769 DB	01H DUP (?)
_BSS	ENDS
_DATA	SEGMENT
	ORG $+1
$SG70702 DB	'_EVA_PAGE_BOTTOM', 00H
	ORG $+3
$SG70705 DB	'_EVA_NORMAL', 00H
$SG70706 DB	'<script>', 00H
	ORG $+3
$SG70707 DB	'%s', 00H
	ORG $+1
$SG70709 DB	'%s', 00H
	ORG $+1
$SG70711 DB	'document.mainform["%s"].focus();', 00H
	ORG $+3
$SG70712 DB	'</script>', 00H
	ORG $+2
$SG70713 DB	'%s', 00H
	ORG $+1
$SG70717 DB	'<br>Dur', 0e9H, 'e : %1.2lf s', 00H
	ORG $+3
$SG70720 DB	'_EVA_HTML', 00H
	ORG $+2
$SG70725 DB	'_EVA_PAGE_FOOTER', 00H
	ORG $+3
$SG70728 DB	'D:\Travail\ABI\EVA\V4.0\CGI\Brunix-2016\html_basic.c', 00H
	ORG $+3
$SG70729 DB	'put_html_page_trailer', 00H
	ORG $+2
$SG70731 DB	'%s', 00H
	ORG $+1
$SG70734 DB	'_EVA_NONE', 00H
	ORG $+2
$SG70736 DB	'<td align=right><table border=0 cellspacing=1 cellpaddin'
	DB	'g=0><tr><td align=center bgcolor=#BBBBBB><nowrap><font size=-'
	DB	'2>&nbsp;Dur', 0e9H, 'e&nbsp;</font></td><td align=center bgco'
	DB	'lor=#BBBBBB><nowrap><font size=-2>&nbsp;CPU&nbsp;</font></td>'
	DB	'<td align=center bgcolor=#BBBBBB><nowrap><font size=-2>&nbsp;'
	DB	'SQL&nbsp;</font></td><td align=center bgcolor=#BBBBBB><nowrap'
	DB	'><font size=-2>&nbsp;Emission&nbsp;</font></td><td align=cent'
	DB	'er bgcolor=#BBBBBB><nowrap><font size=-2>&nbsp;R', 0e9H, 'cep'
	DB	'tion&nbsp;</font></td></tr><tr>', 00H
	ORG $+3
$SG70737 DB	'><nobr><i><font size=-2>Serveur EVA v4.0.1<br>&copy;<a h'
	DB	'ref=''http://abing.fr'' target=_blank>ABI</a> Jun 29 2016</fo'
	DB	'nt></td>', 00H
$SG70738 DB	'center', 00H
	ORG $+1
$SG70739 DB	'right', 00H
	ORG $+2
$SG70740 DB	'''><img src=''/img/letter_small.gif'' border=0 align=abs'
	DB	'middle>Ecrire au webmaster</a></i></font></td><td align=', 00H
	ORG $+2
$SG70741 DB	'alain.boute@abing.fr', 00H
	ORG $+3
$SG70742 DB	'<font face=Arial><table cellspacing=0 cellpadding=0 widt'
	DB	'h=100% border=0 bgcolor=#E0E0E0 rules=none><tr>', 0aH, '<td>&'
	DB	'nbsp;<font size=-1><a href=''mailto:', 00H
	ORG $+3
$SG70743 DB	'%s%s%s%s%s%s', 00H
	ORG $+3
$SG70773 DB	'<td align=center bgcolor=#FFFFFF><nowrap><font size=-2>&'
	DB	'nbsp;%1.2lf s&nbsp;</font></td>', 00H
$SG70775 DB	'<td align=center bgcolor=#EEEEEE><nowrap><font size=-2>&'
	DB	'nbsp;%1.2lf s&nbsp;</font></td>', 00H
$SG70777 DB	'<td align=center bgcolor=#EEEEEE><nowrap><font size=-2>&'
	DB	'nbsp;%1.2lf s&nbsp;</font></td>', 00H
$SG70779 DB	'<td align=center bgcolor=#DDFFFF><nowrap><font size=-2>&'
	DB	'nbsp;%1.2lf s - %s&nbsp;</font></td>', 00H
	ORG $+3
$SG70781 DB	'<td align=center bgcolor=#DDDDFF><nowrap><font size=-2>&'
	DB	'nbsp;%1.2lf s - %s&nbsp;</font></td>', 00H
	ORG $+3
$SG70782 DB	'</tr></table></td>', 00H
	ORG $+1
$SG70783 DB	'%s', 00H
	ORG $+1
$SG70784 DB	'</tr></table>', 00H
	ORG $+2
$SG70785 DB	'%s', 00H
	ORG $+1
$SG70787 DB	'</form>', 00H
$SG70788 DB	'</body>', 00H
$SG70789 DB	'</html>', 00H
_DATA	ENDS
;	COMDAT __real@8@4008fa00000000000000
; File D:\Travail\ABI\EVA\V4.0\CGI\Brunix-2016\html_basic.c
CONST	SEGMENT
__real@8@4008fa00000000000000 DQ 0408f400000000000r ; 1000
CONST	ENDS
;	COMDAT __real@8@3fff8000000000000000
CONST	SEGMENT
__real@8@3fff8000000000000000 DQ 03ff0000000000000r ; 1
CONST	ENDS
_TEXT	SEGMENT
_cntxt$ = 8
_f$ = 12
_b_stats$ = -12
_focus$ = -4
_t$ = -8
_trailfmt$70701 = -20
_b_usrbot$70703 = -16
_buf$70721 = -24
_idbot$70723 = -28
_rxsize$70745 = -36
_rxrate$70746 = -44
_txsize$70747 = -40
_txrate$70748 = -32
_sz$70750 = -56
_src$70751 = -52
_size$70753 = -48
_sz$70755 = -68
_src$70757 = -64
_size$70759 = -60
_sz$70761 = -80
_src$70762 = -76
_size$70764 = -72
_sz$70766 = -92
_src$70768 = -88
_size$70770 = -84
_put_html_page_trailer PROC NEAR

; 366  : {

	push	ebp
	mov	ebp, esp
	sub	esp, 224				; 000000e0H

; 367  : 	int b_stats = 1;

	mov	DWORD PTR _b_stats$[ebp], 1

; 368  : 	DynBuffer *focus = cntxt->focus1 ? cntxt->focus1 : cntxt->focus2 ? cntxt->focus2 : cntxt->focus3;

	mov	eax, DWORD PTR _cntxt$[ebp]
	cmp	DWORD PTR [eax+84], 0
	je	SHORT $L70936
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	edx, DWORD PTR [ecx+84]
	mov	DWORD PTR -96+[ebp], edx
	jmp	SHORT $L70937
$L70936:
	mov	eax, DWORD PTR _cntxt$[ebp]
	cmp	DWORD PTR [eax+88], 0
	je	SHORT $L70934
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	edx, DWORD PTR [ecx+88]
	mov	DWORD PTR -100+[ebp], edx
	jmp	SHORT $L70935
$L70934:
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	ecx, DWORD PTR [eax+92]
	mov	DWORD PTR -100+[ebp], ecx
$L70935:
	mov	edx, DWORD PTR -100+[ebp]
	mov	DWORD PTR -96+[ebp], edx
$L70937:
	mov	eax, DWORD PTR -96+[ebp]
	mov	DWORD PTR _focus$[ebp], eax

; 369  :  	clock_t t;
; 370  : 
; 371  : 	if(!(cntxt->b_terminate & 64))

	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	edx, DWORD PTR [ecx+29776]
	and	edx, 64					; 00000040H
	test	edx, edx
	jne	$L70700

; 373  : 		/* Get trailer format */
; 374  : 		char *trailfmt = DYNTAB_FIELD_VAL(&cntxt->user_data, PAGE_BOTTOM);

	push	0
	push	-1
	push	OFFSET FLAT:$SG70702
	mov	eax, DWORD PTR _cntxt$[ebp]
	add	eax, 29428				; 000072f4H
	push	eax
	call	_dyntab_field_val
	add	esp, 16					; 00000010H
	mov	DWORD PTR _trailfmt$70701[ebp], eax

; 375  : 		int b_usrbot = *trailfmt;

	mov	ecx, DWORD PTR _trailfmt$70701[ebp]
	movsx	edx, BYTE PTR [ecx]
	mov	DWORD PTR _b_usrbot$70703[ebp], edx

; 376  : 		if(!b_usrbot) trailfmt = dyntab_val(&cntxt->pagebottom, 0, 0);

	cmp	DWORD PTR _b_usrbot$70703[ebp], 0
	jne	SHORT $L70704
	push	0
	push	0
	mov	eax, DWORD PTR _cntxt$[ebp]
	add	eax, 29488				; 00007330H
	push	eax
	call	_dyntab_val
	add	esp, 12					; 0000000cH
	mov	DWORD PTR _trailfmt$70701[ebp], eax
$L70704:

; 377  : 		b_stats = !*trailfmt || !strcmp(trailfmt, "_EVA_NORMAL");

	mov	ecx, DWORD PTR _trailfmt$70701[ebp]
	movsx	edx, BYTE PTR [ecx]
	test	edx, edx
	je	SHORT $L70938
	push	OFFSET FLAT:$SG70705
	mov	eax, DWORD PTR _trailfmt$70701[ebp]
	push	eax
	call	_strcmp
	add	esp, 8
	test	eax, eax
	je	SHORT $L70938
	mov	DWORD PTR -104+[ebp], 0
	jmp	SHORT $L70939
$L70938:
	mov	DWORD PTR -104+[ebp], 1
$L70939:
	mov	ecx, DWORD PTR -104+[ebp]
	mov	DWORD PTR _b_stats$[ebp], ecx

; 378  : 
; 379  : 		t = clock();

	call	_clock
	mov	DWORD PTR _t$[ebp], eax

; 380  : 
; 381  : 		/* Handle JavaScript end script & SetFocus */
; 382  : 		cntxt->txsize += fprintf(f ? f : stdout, "%s", "<script>");

	cmp	DWORD PTR _f$[ebp], 0
	je	SHORT $L70940
	mov	edx, DWORD PTR _f$[ebp]
	mov	DWORD PTR -108+[ebp], edx
	jmp	SHORT $L70941
$L70940:
	mov	DWORD PTR -108+[ebp], OFFSET FLAT:__iob+32
$L70941:
	push	OFFSET FLAT:$SG70706
	push	OFFSET FLAT:$SG70707
	mov	eax, DWORD PTR -108+[ebp]
	push	eax
	call	_fprintf
	add	esp, 12					; 0000000cH
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	edx, DWORD PTR [ecx+32036]
	add	edx, eax
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+32036], edx

; 383  : 		if(cntxt->endjs) cntxt->txsize += fprintf(f ? f : stdout, "%s", cntxt->endjs->data);

	mov	ecx, DWORD PTR _cntxt$[ebp]
	cmp	DWORD PTR [ecx+29800], 0
	je	SHORT $L70708
	cmp	DWORD PTR _f$[ebp], 0
	je	SHORT $L70942
	mov	edx, DWORD PTR _f$[ebp]
	mov	DWORD PTR -112+[ebp], edx
	jmp	SHORT $L70943
$L70942:
	mov	DWORD PTR -112+[ebp], OFFSET FLAT:__iob+32
$L70943:
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	ecx, DWORD PTR [eax+29800]
	add	ecx, 8
	push	ecx
	push	OFFSET FLAT:$SG70709
	mov	edx, DWORD PTR -112+[ebp]
	push	edx
	call	_fprintf
	add	esp, 12					; 0000000cH
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	edx, DWORD PTR [ecx+32036]
	add	edx, eax
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+32036], edx
$L70708:

; 384  : 		if(!f && focus) cntxt->txsize += printf("document.mainform[\"%s\"].focus();", focus->data);

	cmp	DWORD PTR _f$[ebp], 0
	jne	SHORT $L70710
	cmp	DWORD PTR _focus$[ebp], 0
	je	SHORT $L70710
	mov	ecx, DWORD PTR _focus$[ebp]
	add	ecx, 8
	push	ecx
	push	OFFSET FLAT:$SG70711
	call	_printf
	add	esp, 8
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	ecx, DWORD PTR [edx+32036]
	add	ecx, eax
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+32036], ecx
$L70710:

; 385  : 		cntxt->txsize += fprintf(f ? f : stdout, "%s", "</script>");

	cmp	DWORD PTR _f$[ebp], 0
	je	SHORT $L70944
	mov	eax, DWORD PTR _f$[ebp]
	mov	DWORD PTR -116+[ebp], eax
	jmp	SHORT $L70945
$L70944:
	mov	DWORD PTR -116+[ebp], OFFSET FLAT:__iob+32
$L70945:
	push	OFFSET FLAT:$SG70712
	push	OFFSET FLAT:$SG70713
	mov	ecx, DWORD PTR -116+[ebp]
	push	ecx
	call	_fprintf
	add	esp, 12					; 0000000cH
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	ecx, DWORD PTR [edx+32036]
	add	ecx, eax
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+32036], ecx

; 386  : 
; 387  : #define TIME_CELL(txt, bg) "<td align=center bgcolor=#" bg "><nowrap><font size=-2>&nbsp;" txt "&nbsp;</font></td>"
; 388  : 		if(cntxt->b_terminate & 16)

	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	ecx, DWORD PTR [eax+29776]
	and	ecx, 16					; 00000010H
	test	ecx, ecx
	je	SHORT $L70715

; 390  : 			fprintf(f ? f : stdout, "<br>Durée : %1.2lf s", (double)t/CLOCKS_PER_SEC);

	cmp	DWORD PTR _f$[ebp], 0
	je	SHORT $L70946
	mov	edx, DWORD PTR _f$[ebp]
	mov	DWORD PTR -120+[ebp], edx
	jmp	SHORT $L70947
$L70946:
	mov	DWORD PTR -120+[ebp], OFFSET FLAT:__iob+32
$L70947:
	fild	DWORD PTR _t$[ebp]
	fdiv	QWORD PTR __real@8@4008fa00000000000000
	sub	esp, 8
	fstp	QWORD PTR [esp]
	push	OFFSET FLAT:$SG70717
	mov	eax, DWORD PTR -120+[ebp]
	push	eax
	call	_fprintf
	add	esp, 16					; 00000010H

; 392  : 		else if(!strcmp(trailfmt, "_EVA_HTML"))

	jmp	$L70733
$L70715:
	push	OFFSET FLAT:$SG70720
	mov	ecx, DWORD PTR _trailfmt$70701[ebp]
	push	ecx
	call	_strcmp
	add	esp, 8
	test	eax, eax
	jne	$L70719

; 394  : 			DynBuffer *buf = NULL;

	mov	DWORD PTR _buf$70721[ebp], 0

; 395  : 			unsigned long idbot = strtoul(b_usrbot ? DYNTAB_FIELD_VAL( &cntxt->user_data, PAGE_FOOTER) :
; 396  : 													 dyntab_val(&cntxt->pagebtctrl, 0, 0), NULL, 10);

	cmp	DWORD PTR _b_usrbot$70703[ebp], 0
	je	SHORT $L70948
	push	0
	push	-1
	push	OFFSET FLAT:$SG70725
	mov	edx, DWORD PTR _cntxt$[ebp]
	add	edx, 29428				; 000072f4H
	push	edx
	call	_dyntab_field_val
	add	esp, 16					; 00000010H
	mov	DWORD PTR -124+[ebp], eax
	jmp	SHORT $L70949
$L70948:
	push	0
	push	0
	mov	eax, DWORD PTR _cntxt$[ebp]
	add	eax, 29508				; 00007344H
	push	eax
	call	_dyntab_val
	add	esp, 12					; 0000000cH
	mov	DWORD PTR -124+[ebp], eax
$L70949:
	push	10					; 0000000aH
	push	0
	mov	ecx, DWORD PTR -124+[ebp]
	push	ecx
	call	_strtoul
	add	esp, 12					; 0000000cH
	mov	DWORD PTR _idbot$70723[ebp], eax

; 397  : 			if(idbot)

	cmp	DWORD PTR _idbot$70723[ebp], 0
	je	$L70726

; 399  : 				if(form_get_html(cntxt, &buf, idbot, 0)) err_clear(cntxt, "put_html_page_trailer", __FILE__, __LINE__);

	push	0
	mov	edx, DWORD PTR _idbot$70723[ebp]
	push	edx
	lea	eax, DWORD PTR _buf$70721[ebp]
	push	eax
	mov	ecx, DWORD PTR _cntxt$[ebp]
	push	ecx
	call	_form_get_html
	add	esp, 16					; 00000010H
	test	eax, eax
	je	SHORT $L70727
	push	399					; 0000018fH
	push	OFFSET FLAT:$SG70728
	push	OFFSET FLAT:$SG70729
	mov	edx, DWORD PTR _cntxt$[ebp]
	push	edx
	call	_err_clear
	add	esp, 16					; 00000010H
$L70727:

; 400  : 				if(buf) cntxt->txsize += fprintf(f ? f : stdout, "%s", buf->data);

	cmp	DWORD PTR _buf$70721[ebp], 0
	je	SHORT $L70730
	cmp	DWORD PTR _f$[ebp], 0
	je	SHORT $L70950
	mov	eax, DWORD PTR _f$[ebp]
	mov	DWORD PTR -128+[ebp], eax
	jmp	SHORT $L70951
$L70950:
	mov	DWORD PTR -128+[ebp], OFFSET FLAT:__iob+32
$L70951:
	mov	ecx, DWORD PTR _buf$70721[ebp]
	add	ecx, 8
	push	ecx
	push	OFFSET FLAT:$SG70731
	mov	edx, DWORD PTR -128+[ebp]
	push	edx
	call	_fprintf
	add	esp, 12					; 0000000cH
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	edx, DWORD PTR [ecx+32036]
	add	edx, eax
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+32036], edx
$L70730:

; 401  : 				M_FREE(buf);

	mov	ecx, DWORD PTR _buf$70721[ebp]
	push	ecx
	call	_mem_free
	add	esp, 4
	mov	DWORD PTR _buf$70721[ebp], 0
$L70726:

; 404  : 		else if(strcmp(trailfmt, "_EVA_NONE") && !cntxt->b_pda)

	jmp	$L70733
$L70719:
	push	OFFSET FLAT:$SG70734
	mov	edx, DWORD PTR _trailfmt$70701[ebp]
	push	edx
	call	_strcmp
	add	esp, 8
	test	eax, eax
	je	$L70733
	mov	eax, DWORD PTR _cntxt$[ebp]
	cmp	DWORD PTR [eax+29752], 0
	jne	$L70733

; 406  : 			/* Output page end block with webmaster email & process statistics */
; 407  : 			cntxt->txsize += fprintf(f ? f : stdout, "%s%s%s%s%s%s",
; 408  : 					"<font face=Arial>"
; 409  : 					"<table cellspacing=0 cellpadding=0 width=100% border=0 bgcolor=#E0E0E0 rules=none><tr>\n"
; 410  : 					"<td>&nbsp;<font size=-1><a href='mailto:",
; 411  : 					dyntab_sz(&cntxt->mail_admin, 0, 0) ? dyntab_val(&cntxt->mail_admin, 0, 0) : "alain.boute@abing.fr",
; 412  : 					"'><img src='/img/letter_small.gif' border=0 align=absmiddle>Ecrire au webmaster</a></i></font>"
; 413  : 					"</td><td align=", b_stats ? "center" : "right", "><nobr><i>"
; 414  : 					"<font size=-2>Serveur EVA v4.0.1<br>&copy;<a href='http://abing.fr' target=_blank>ABI</a>"
; 415  : 					" " __DATE__ "</font></td>",
; 416  : 					!b_stats ? "" :
; 417  : 					"<td align=right>"
; 418  : 					"<table border=0 cellspacing=1 cellpadding=0><tr>"
; 419  : 					TIME_CELL("Durée", "BBBBBB")
; 420  : 					TIME_CELL("CPU", "BBBBBB")
; 421  : 					TIME_CELL("SQL", "BBBBBB")
; 422  : 					TIME_CELL("Emission", "BBBBBB")
; 423  : 					TIME_CELL("Réception", "BBBBBB")
; 424  : 					"</tr><tr>");

	cmp	DWORD PTR _b_stats$[ebp], 0
	jne	SHORT $L70952
	mov	DWORD PTR -132+[ebp], OFFSET FLAT:$SG70735
	jmp	SHORT $L70953
$L70952:
	mov	DWORD PTR -132+[ebp], OFFSET FLAT:$SG70736
$L70953:
	cmp	DWORD PTR _b_stats$[ebp], 0
	je	SHORT $L70954
	mov	DWORD PTR -136+[ebp], OFFSET FLAT:$SG70738
	jmp	SHORT $L70955
$L70954:
	mov	DWORD PTR -136+[ebp], OFFSET FLAT:$SG70739
$L70955:
	push	0
	push	0
	mov	ecx, DWORD PTR _cntxt$[ebp]
	add	ecx, 29620				; 000073b4H
	push	ecx
	call	_dyntab_sz
	add	esp, 12					; 0000000cH
	test	eax, eax
	je	SHORT $L70956
	push	0
	push	0
	mov	edx, DWORD PTR _cntxt$[ebp]
	add	edx, 29620				; 000073b4H
	push	edx
	call	_dyntab_val
	add	esp, 12					; 0000000cH
	mov	DWORD PTR -140+[ebp], eax
	jmp	SHORT $L70957
$L70956:
	mov	DWORD PTR -140+[ebp], OFFSET FLAT:$SG70741
$L70957:
	cmp	DWORD PTR _f$[ebp], 0
	je	SHORT $L70958
	mov	eax, DWORD PTR _f$[ebp]
	mov	DWORD PTR -144+[ebp], eax
	jmp	SHORT $L70959
$L70958:
	mov	DWORD PTR -144+[ebp], OFFSET FLAT:__iob+32
$L70959:
	mov	ecx, DWORD PTR -132+[ebp]
	push	ecx
	push	OFFSET FLAT:$SG70737
	mov	edx, DWORD PTR -136+[ebp]
	push	edx
	push	OFFSET FLAT:$SG70740
	mov	eax, DWORD PTR -140+[ebp]
	push	eax
	push	OFFSET FLAT:$SG70742
	push	OFFSET FLAT:$SG70743
	mov	ecx, DWORD PTR -144+[ebp]
	push	ecx
	call	_fprintf
	add	esp, 32					; 00000020H
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	ecx, DWORD PTR [edx+32036]
	add	ecx, eax
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+32036], ecx

; 425  : 			if(b_stats)

	cmp	DWORD PTR _b_stats$[ebp], 0
	je	$L70744

; 427  : 				char *rxsize, *rxrate, *txsize, *txrate;
; 428  : #define COPY_HUMANFILESIZE(dest, _sz) { size_t sz = _sz; char *src = sz ? human_filesize(sz) : "";  size_t size = strlen(src); \
; 429  : 											dest = calloc(size + 1, 1); if((src) && size) memcpy(dest, src, size); }
; 430  : 				COPY_HUMANFILESIZE(rxsize, cntxt->rxsize);

	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	ecx, DWORD PTR [eax+32032]
	mov	DWORD PTR _sz$70750[ebp], ecx
	cmp	DWORD PTR _sz$70750[ebp], 0
	je	SHORT $L70960
	mov	edx, DWORD PTR _sz$70750[ebp]
	push	edx
	call	_human_filesize
	add	esp, 4
	mov	DWORD PTR -148+[ebp], eax
	jmp	SHORT $L70961
$L70960:
	mov	DWORD PTR -148+[ebp], OFFSET FLAT:$SG70752
$L70961:
	mov	eax, DWORD PTR -148+[ebp]
	mov	DWORD PTR _src$70751[ebp], eax
	mov	ecx, DWORD PTR _src$70751[ebp]
	push	ecx
	call	_strlen
	add	esp, 4
	mov	DWORD PTR _size$70753[ebp], eax
	push	1
	mov	edx, DWORD PTR _size$70753[ebp]
	add	edx, 1
	push	edx
	call	_calloc
	add	esp, 8
	mov	DWORD PTR _rxsize$70745[ebp], eax
	cmp	DWORD PTR _src$70751[ebp], 0
	je	SHORT $L70754
	cmp	DWORD PTR _size$70753[ebp], 0
	je	SHORT $L70754
	mov	eax, DWORD PTR _size$70753[ebp]
	push	eax
	mov	ecx, DWORD PTR _src$70751[ebp]
	push	ecx
	mov	edx, DWORD PTR _rxsize$70745[ebp]
	push	edx
	call	_memcpy
	add	esp, 12					; 0000000cH
$L70754:

; 431  : 				COPY_HUMANFILESIZE(rxrate, cntxt->rxtime > 200 ? (size_t)(1.0 * cntxt->rxsize / cntxt->rxtime * CLOCKS_PER_SEC) : 0);

	mov	eax, DWORD PTR _cntxt$[ebp]
	cmp	DWORD PTR [eax+32024], 200		; 000000c8H
	jle	SHORT $L70962
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	edx, DWORD PTR [ecx+32032]
	mov	DWORD PTR -156+[ebp], edx
	mov	DWORD PTR -156+[ebp+4], 0
	fild	QWORD PTR -156+[ebp]
	fmul	QWORD PTR __real@8@3fff8000000000000000
	mov	eax, DWORD PTR _cntxt$[ebp]
	fidiv	DWORD PTR [eax+32024]
	fmul	QWORD PTR __real@8@4008fa00000000000000
	call	__ftol
	mov	DWORD PTR -160+[ebp], eax
	jmp	SHORT $L70963
$L70962:
	mov	DWORD PTR -160+[ebp], 0
$L70963:
	mov	ecx, DWORD PTR -160+[ebp]
	mov	DWORD PTR _sz$70755[ebp], ecx
	cmp	DWORD PTR _sz$70755[ebp], 0
	je	SHORT $L70964
	mov	edx, DWORD PTR _sz$70755[ebp]
	push	edx
	call	_human_filesize
	add	esp, 4
	mov	DWORD PTR -164+[ebp], eax
	jmp	SHORT $L70965
$L70964:
	mov	DWORD PTR -164+[ebp], OFFSET FLAT:$SG70758
$L70965:
	mov	eax, DWORD PTR -164+[ebp]
	mov	DWORD PTR _src$70757[ebp], eax
	mov	ecx, DWORD PTR _src$70757[ebp]
	push	ecx
	call	_strlen
	add	esp, 4
	mov	DWORD PTR _size$70759[ebp], eax
	push	1
	mov	edx, DWORD PTR _size$70759[ebp]
	add	edx, 1
	push	edx
	call	_calloc
	add	esp, 8
	mov	DWORD PTR _rxrate$70746[ebp], eax
	cmp	DWORD PTR _src$70757[ebp], 0
	je	SHORT $L70760
	cmp	DWORD PTR _size$70759[ebp], 0
	je	SHORT $L70760
	mov	eax, DWORD PTR _size$70759[ebp]
	push	eax
	mov	ecx, DWORD PTR _src$70757[ebp]
	push	ecx
	mov	edx, DWORD PTR _rxrate$70746[ebp]
	push	edx
	call	_memcpy
	add	esp, 12					; 0000000cH
$L70760:

; 432  : 				COPY_HUMANFILESIZE(txsize, cntxt->txsize);

	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	ecx, DWORD PTR [eax+32036]
	mov	DWORD PTR _sz$70761[ebp], ecx
	cmp	DWORD PTR _sz$70761[ebp], 0
	je	SHORT $L70966
	mov	edx, DWORD PTR _sz$70761[ebp]
	push	edx
	call	_human_filesize
	add	esp, 4
	mov	DWORD PTR -168+[ebp], eax
	jmp	SHORT $L70967
$L70966:
	mov	DWORD PTR -168+[ebp], OFFSET FLAT:$SG70763
$L70967:
	mov	eax, DWORD PTR -168+[ebp]
	mov	DWORD PTR _src$70762[ebp], eax
	mov	ecx, DWORD PTR _src$70762[ebp]
	push	ecx
	call	_strlen
	add	esp, 4
	mov	DWORD PTR _size$70764[ebp], eax
	push	1
	mov	edx, DWORD PTR _size$70764[ebp]
	add	edx, 1
	push	edx
	call	_calloc
	add	esp, 8
	mov	DWORD PTR _txsize$70747[ebp], eax
	cmp	DWORD PTR _src$70762[ebp], 0
	je	SHORT $L70765
	cmp	DWORD PTR _size$70764[ebp], 0
	je	SHORT $L70765
	mov	eax, DWORD PTR _size$70764[ebp]
	push	eax
	mov	ecx, DWORD PTR _src$70762[ebp]
	push	ecx
	mov	edx, DWORD PTR _txsize$70747[ebp]
	push	edx
	call	_memcpy
	add	esp, 12					; 0000000cH
$L70765:

; 433  : 				COPY_HUMANFILESIZE(txrate, cntxt->txtime > 200 ? (size_t)(1.0 * cntxt->txsize / cntxt->txtime * CLOCKS_PER_SEC) : 0);

	mov	eax, DWORD PTR _cntxt$[ebp]
	cmp	DWORD PTR [eax+32028], 200		; 000000c8H
	jle	SHORT $L70968
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	edx, DWORD PTR [ecx+32036]
	mov	DWORD PTR -176+[ebp], edx
	mov	DWORD PTR -176+[ebp+4], 0
	fild	QWORD PTR -176+[ebp]
	fmul	QWORD PTR __real@8@3fff8000000000000000
	mov	eax, DWORD PTR _cntxt$[ebp]
	fidiv	DWORD PTR [eax+32028]
	fmul	QWORD PTR __real@8@4008fa00000000000000
	call	__ftol
	mov	DWORD PTR -180+[ebp], eax
	jmp	SHORT $L70969
$L70968:
	mov	DWORD PTR -180+[ebp], 0
$L70969:
	mov	ecx, DWORD PTR -180+[ebp]
	mov	DWORD PTR _sz$70766[ebp], ecx
	cmp	DWORD PTR _sz$70766[ebp], 0
	je	SHORT $L70970
	mov	edx, DWORD PTR _sz$70766[ebp]
	push	edx
	call	_human_filesize
	add	esp, 4
	mov	DWORD PTR -184+[ebp], eax
	jmp	SHORT $L70971
$L70970:
	mov	DWORD PTR -184+[ebp], OFFSET FLAT:$SG70769
$L70971:
	mov	eax, DWORD PTR -184+[ebp]
	mov	DWORD PTR _src$70768[ebp], eax
	mov	ecx, DWORD PTR _src$70768[ebp]
	push	ecx
	call	_strlen
	add	esp, 4
	mov	DWORD PTR _size$70770[ebp], eax
	push	1
	mov	edx, DWORD PTR _size$70770[ebp]
	add	edx, 1
	push	edx
	call	_calloc
	add	esp, 8
	mov	DWORD PTR _txrate$70748[ebp], eax
	cmp	DWORD PTR _src$70768[ebp], 0
	je	SHORT $L70771
	cmp	DWORD PTR _size$70770[ebp], 0
	je	SHORT $L70771
	mov	eax, DWORD PTR _size$70770[ebp]
	push	eax
	mov	ecx, DWORD PTR _src$70768[ebp]
	push	ecx
	mov	edx, DWORD PTR _txrate$70748[ebp]
	push	edx
	call	_memcpy
	add	esp, 12					; 0000000cH
$L70771:

; 434  : #undef COPY_HUMANFILESIZE
; 435  : 
; 436  : 				fprintf(f ? f : stdout, TIME_CELL("%1.2lf s", "FFFFFF"), (double)t/CLOCKS_PER_SEC);

	cmp	DWORD PTR _f$[ebp], 0
	je	SHORT $L70972
	mov	eax, DWORD PTR _f$[ebp]
	mov	DWORD PTR -188+[ebp], eax
	jmp	SHORT $L70973
$L70972:
	mov	DWORD PTR -188+[ebp], OFFSET FLAT:__iob+32
$L70973:
	fild	DWORD PTR _t$[ebp]
	fdiv	QWORD PTR __real@8@4008fa00000000000000
	sub	esp, 8
	fstp	QWORD PTR [esp]
	push	OFFSET FLAT:$SG70773
	mov	ecx, DWORD PTR -188+[ebp]
	push	ecx
	call	_fprintf
	add	esp, 16					; 00000010H

; 437  : 				fprintf(f ? f : stdout, TIME_CELL("%1.2lf s", "EEEEEE"), (double)(t - cntxt->rxtime - cntxt->txtime - cntxt->sqltime)/CLOCKS_PER_SEC);

	cmp	DWORD PTR _f$[ebp], 0
	je	SHORT $L70974
	mov	edx, DWORD PTR _f$[ebp]
	mov	DWORD PTR -192+[ebp], edx
	jmp	SHORT $L70975
$L70974:
	mov	DWORD PTR -192+[ebp], OFFSET FLAT:__iob+32
$L70975:
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	ecx, DWORD PTR _t$[ebp]
	sub	ecx, DWORD PTR [eax+32024]
	mov	edx, DWORD PTR _cntxt$[ebp]
	sub	ecx, DWORD PTR [edx+32028]
	mov	eax, DWORD PTR _cntxt$[ebp]
	sub	ecx, DWORD PTR [eax+32020]
	mov	DWORD PTR -196+[ebp], ecx
	fild	DWORD PTR -196+[ebp]
	fdiv	QWORD PTR __real@8@4008fa00000000000000
	sub	esp, 8
	fstp	QWORD PTR [esp]
	push	OFFSET FLAT:$SG70775
	mov	ecx, DWORD PTR -192+[ebp]
	push	ecx
	call	_fprintf
	add	esp, 16					; 00000010H

; 438  : 				fprintf(f ? f : stdout, TIME_CELL("%1.2lf s", "EEEEEE"), (double)cntxt->sqltime/CLOCKS_PER_SEC);

	cmp	DWORD PTR _f$[ebp], 0
	je	SHORT $L70976
	mov	edx, DWORD PTR _f$[ebp]
	mov	DWORD PTR -200+[ebp], edx
	jmp	SHORT $L70977
$L70976:
	mov	DWORD PTR -200+[ebp], OFFSET FLAT:__iob+32
$L70977:
	mov	eax, DWORD PTR _cntxt$[ebp]
	fild	DWORD PTR [eax+32020]
	fdiv	QWORD PTR __real@8@4008fa00000000000000
	sub	esp, 8
	fstp	QWORD PTR [esp]
	push	OFFSET FLAT:$SG70777
	mov	ecx, DWORD PTR -200+[ebp]
	push	ecx
	call	_fprintf
	add	esp, 16					; 00000010H

; 439  : 				fprintf(f ? f : stdout, TIME_CELL("%1.2lf s - %s", "DDFFFF"), (double)cntxt->rxtime/CLOCKS_PER_SEC, rxsize);

	cmp	DWORD PTR _f$[ebp], 0
	je	SHORT $L70978
	mov	edx, DWORD PTR _f$[ebp]
	mov	DWORD PTR -204+[ebp], edx
	jmp	SHORT $L70979
$L70978:
	mov	DWORD PTR -204+[ebp], OFFSET FLAT:__iob+32
$L70979:
	mov	eax, DWORD PTR _rxsize$70745[ebp]
	push	eax
	mov	ecx, DWORD PTR _cntxt$[ebp]
	fild	DWORD PTR [ecx+32024]
	fdiv	QWORD PTR __real@8@4008fa00000000000000
	sub	esp, 8
	fstp	QWORD PTR [esp]
	push	OFFSET FLAT:$SG70779
	mov	edx, DWORD PTR -204+[ebp]
	push	edx
	call	_fprintf
	add	esp, 20					; 00000014H

; 440  : 				fprintf(f ? f : stdout, TIME_CELL("%1.2lf s - %s", "DDDDFF"), (double)cntxt->txtime/CLOCKS_PER_SEC, txsize);

	cmp	DWORD PTR _f$[ebp], 0
	je	SHORT $L70980
	mov	eax, DWORD PTR _f$[ebp]
	mov	DWORD PTR -208+[ebp], eax
	jmp	SHORT $L70981
$L70980:
	mov	DWORD PTR -208+[ebp], OFFSET FLAT:__iob+32
$L70981:
	mov	ecx, DWORD PTR _txsize$70747[ebp]
	push	ecx
	mov	edx, DWORD PTR _cntxt$[ebp]
	fild	DWORD PTR [edx+32028]
	fdiv	QWORD PTR __real@8@4008fa00000000000000
	sub	esp, 8
	fstp	QWORD PTR [esp]
	push	OFFSET FLAT:$SG70781
	mov	eax, DWORD PTR -208+[ebp]
	push	eax
	call	_fprintf
	add	esp, 20					; 00000014H

; 441  : #undef TIME_CELL
; 442  : 				fprintf(f ? f : stdout, "%s", "</tr></table></td>");

	cmp	DWORD PTR _f$[ebp], 0
	je	SHORT $L70982
	mov	ecx, DWORD PTR _f$[ebp]
	mov	DWORD PTR -212+[ebp], ecx
	jmp	SHORT $L70983
$L70982:
	mov	DWORD PTR -212+[ebp], OFFSET FLAT:__iob+32
$L70983:
	push	OFFSET FLAT:$SG70782
	push	OFFSET FLAT:$SG70783
	mov	edx, DWORD PTR -212+[ebp]
	push	edx
	call	_fprintf
	add	esp, 12					; 0000000cH

; 443  : 				free(rxsize); free(rxrate); free(txsize); free(txrate);

	mov	eax, DWORD PTR _rxsize$70745[ebp]
	push	eax
	call	_free
	add	esp, 4
	mov	ecx, DWORD PTR _rxrate$70746[ebp]
	push	ecx
	call	_free
	add	esp, 4
	mov	edx, DWORD PTR _txsize$70747[ebp]
	push	edx
	call	_free
	add	esp, 4
	mov	eax, DWORD PTR _txrate$70748[ebp]
	push	eax
	call	_free
	add	esp, 4
$L70744:

; 445  : 			fprintf(f ? f : stdout, "%s", "</tr></table>");

	cmp	DWORD PTR _f$[ebp], 0
	je	SHORT $L70984
	mov	ecx, DWORD PTR _f$[ebp]
	mov	DWORD PTR -216+[ebp], ecx
	jmp	SHORT $L70985
$L70984:
	mov	DWORD PTR -216+[ebp], OFFSET FLAT:__iob+32
$L70985:
	push	OFFSET FLAT:$SG70784
	push	OFFSET FLAT:$SG70785
	mov	edx, DWORD PTR -216+[ebp]
	push	edx
	call	_fprintf
	add	esp, 12					; 0000000cH
$L70733:

; 447  : 
; 448  : 		if(!f && cntxt->b_formheader) printf("</form>");

	cmp	DWORD PTR _f$[ebp], 0
	jne	SHORT $L70786
	mov	eax, DWORD PTR _cntxt$[ebp]
	cmp	DWORD PTR [eax+29768], 0
	je	SHORT $L70786
	push	OFFSET FLAT:$SG70787
	call	_printf
	add	esp, 4
$L70786:

; 449  : 
; 450  : 		put_debug_msg(cntxt, f);

	mov	ecx, DWORD PTR _f$[ebp]
	push	ecx
	mov	edx, DWORD PTR _cntxt$[ebp]
	push	edx
	call	_put_debug_msg
	add	esp, 8
$L70700:

; 452  : 
; 453  : 	fprintf(f ? f : stdout, "</body>");

	cmp	DWORD PTR _f$[ebp], 0
	je	SHORT $L70986
	mov	eax, DWORD PTR _f$[ebp]
	mov	DWORD PTR -220+[ebp], eax
	jmp	SHORT $L70987
$L70986:
	mov	DWORD PTR -220+[ebp], OFFSET FLAT:__iob+32
$L70987:
	push	OFFSET FLAT:$SG70788
	mov	ecx, DWORD PTR -220+[ebp]
	push	ecx
	call	_fprintf
	add	esp, 8

; 454  : 	fprintf(f ? f : stdout, "</html>");

	cmp	DWORD PTR _f$[ebp], 0
	je	SHORT $L70988
	mov	edx, DWORD PTR _f$[ebp]
	mov	DWORD PTR -224+[ebp], edx
	jmp	SHORT $L70989
$L70988:
	mov	DWORD PTR -224+[ebp], OFFSET FLAT:__iob+32
$L70989:
	push	OFFSET FLAT:$SG70789
	mov	eax, DWORD PTR -224+[ebp]
	push	eax
	call	_fprintf
	add	esp, 8

; 455  : }

	mov	esp, ebp
	pop	ebp
	ret	0
_put_html_page_trailer ENDP
_TEXT	ENDS
PUBLIC	_put_html_bold_substring
EXTRN	_setcase:NEAR
EXTRN	_mem_alloc:NEAR
EXTRN	_plain_to_html:BYTE
EXTRN	_dyntab_free:NEAR
EXTRN	_dyntab_cell:NEAR
EXTRN	_dyntab_copy:NEAR
EXTRN	_strstr:NEAR
_DATA	SEGMENT
$SG70821 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70832 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70837 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70852 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70855 DB	'</font></b>', 00H
$SG70856 DB	'<b><font color=#FF4444>', 00H
$SG70858 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70859 DB	'D:\Travail\ABI\EVA\V4.0\CGI\Brunix-2016\html_basic.c', 00H
	ORG $+3
$SG70860 DB	'put_html_bold_substring', 00H
$SG70862 DB	'D:\Travail\ABI\EVA\V4.0\CGI\Brunix-2016\html_basic.c', 00H
	ORG $+3
$SG70863 DB	'put_html_bold_substring', 00H
_DATA	ENDS
_TEXT	SEGMENT
_cntxt$ = 8
_html$ = 12
_txtout$ = 16
_sz$ = 20
_substr$ = 24
_val$ = -4
_txt$ = -8
_txt0$ = -24
_words$ = -44
_i$ = -12
_j$ = -16
_len$ = -20
_size$70816 = -48
_src$70817 = -52
_size1$70818 = -56
_sz$70829 = -60
_txt2$70844 = -68
_txt1$70845 = -64
_put_html_bold_substring PROC NEAR

; 469  : ){

	push	ebp
	mov	ebp, esp
	sub	esp, 80					; 00000050H

; 470  : 	char *val = NULL, *txt, *txt0;

	mov	DWORD PTR _val$[ebp], 0

; 471  : 	DynTable words = {0};

	mov	DWORD PTR _words$[ebp], 0
	xor	eax, eax
	mov	DWORD PTR _words$[ebp+4], eax
	mov	DWORD PTR _words$[ebp+8], eax
	mov	DWORD PTR _words$[ebp+12], eax
	mov	DWORD PTR _words$[ebp+16], eax

; 472  : 	unsigned long i, j;
; 473  : 	size_t len = 0;

	mov	DWORD PTR _len$[ebp], 0

; 474  : 	if(!html) RETURN_OK;

	cmp	DWORD PTR _html$[ebp], 0
	jne	SHORT $L70811
	jmp	$eva_noerr$70812
$L70811:

; 475  : 
; 476  : 	/* Uppercase val & substrings */
; 477  : 	if(!txtout || !*txtout) RETURN_OK;

	cmp	DWORD PTR _txtout$[ebp], 0
	je	SHORT $L70814
	mov	ecx, DWORD PTR _txtout$[ebp]
	movsx	edx, BYTE PTR [ecx]
	test	edx, edx
	jne	SHORT $L70813
$L70814:
	jmp	$eva_noerr$70812
$L70813:

; 478  : 	if(!sz) sz = strlen(txtout);

	cmp	DWORD PTR _sz$[ebp], 0
	jne	SHORT $L70815
	mov	eax, DWORD PTR _txtout$[ebp]
	push	eax
	call	_strlen
	add	esp, 4
	mov	DWORD PTR _sz$[ebp], eax
$L70815:

; 479  : 	M_STRDUP(val, txtout, sz);

	mov	ecx, DWORD PTR _sz$[ebp]
	mov	DWORD PTR _size$70816[ebp], ecx
	mov	edx, DWORD PTR _txtout$[ebp]
	mov	DWORD PTR _src$70817[ebp], edx
	mov	eax, DWORD PTR _size$70816[ebp]
	add	eax, 1
	mov	DWORD PTR _size1$70818[ebp], eax
	mov	ecx, DWORD PTR _size1$70818[ebp]
	push	ecx
	call	_mem_alloc
	add	esp, 4
	mov	DWORD PTR _val$[ebp], eax
	cmp	DWORD PTR _size1$70818[ebp], 0
	je	SHORT $L70819
	cmp	DWORD PTR _val$[ebp], 0
	jne	SHORT $L70819
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29872], OFFSET FLAT:$SG70821
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 479		; 000001dfH
	jmp	$eva_err$70822
$L70819:
	cmp	DWORD PTR _src$70817[ebp], 0
	je	SHORT $L70824
	cmp	DWORD PTR _size$70816[ebp], 0
	je	SHORT $L70824
	mov	ecx, DWORD PTR _size$70816[ebp]
	push	ecx
	mov	edx, DWORD PTR _src$70817[ebp]
	push	edx
	mov	eax, DWORD PTR _val$[ebp]
	push	eax
	call	_memcpy
	add	esp, 12					; 0000000cH
$L70824:

; 480  : 	setcase(3, val, sz);

	mov	ecx, DWORD PTR _sz$[ebp]
	push	ecx
	mov	edx, DWORD PTR _val$[ebp]
	push	edx
	push	3
	call	_setcase
	add	esp, 12					; 0000000cH

; 481  : 	if(substr) for(txt = 0, i = 0; i < substr->nbrows; i++)

	cmp	DWORD PTR _substr$[ebp], 0
	je	$L70828
	mov	DWORD PTR _txt$[ebp], 0
	mov	DWORD PTR _i$[ebp], 0
	jmp	SHORT $L70826
$L70827:
	mov	eax, DWORD PTR _i$[ebp]
	add	eax, 1
	mov	DWORD PTR _i$[ebp], eax
$L70826:
	mov	ecx, DWORD PTR _substr$[ebp]
	mov	edx, DWORD PTR _i$[ebp]
	cmp	edx, DWORD PTR [ecx]
	jae	$L70828

; 483  : 		size_t sz = dyntab_sz(substr, i, 0);

	push	0
	mov	eax, DWORD PTR _i$[ebp]
	push	eax
	mov	ecx, DWORD PTR _substr$[ebp]
	push	ecx
	call	_dyntab_sz
	add	esp, 12					; 0000000cH
	mov	DWORD PTR _sz$70829[ebp], eax

; 484  : 		DYNTAB_ADD_CELL(&words, i, 0, substr, i, 0);

	push	1
	push	0
	mov	edx, DWORD PTR _i$[ebp]
	push	edx
	mov	eax, DWORD PTR _substr$[ebp]
	push	eax
	call	_dyntab_cell
	add	esp, 12					; 0000000cH
	push	eax
	push	0
	mov	ecx, DWORD PTR _i$[ebp]
	push	ecx
	lea	edx, DWORD PTR _words$[ebp]
	push	edx
	call	_dyntab_copy
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L70830
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29872], OFFSET FLAT:$SG70832
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 484		; 000001e4H
	jmp	$eva_err$70822
$L70830:

; 485  : 		setcase(3, DYNTAB_VAL_SZ(&words, i, 0));

	push	0
	mov	edx, DWORD PTR _i$[ebp]
	push	edx
	lea	eax, DWORD PTR _words$[ebp]
	push	eax
	call	_dyntab_sz
	add	esp, 12					; 0000000cH
	push	eax
	push	0
	mov	ecx, DWORD PTR _i$[ebp]
	push	ecx
	lea	edx, DWORD PTR _words$[ebp]
	push	edx
	call	_dyntab_val
	add	esp, 12					; 0000000cH
	push	eax
	push	3
	call	_setcase
	add	esp, 12					; 0000000cH

; 486  : 		if(len < sz) len = sz;

	mov	eax, DWORD PTR _len$[ebp]
	cmp	eax, DWORD PTR _sz$70829[ebp]
	jae	SHORT $L70833
	mov	ecx, DWORD PTR _sz$70829[ebp]
	mov	DWORD PTR _len$[ebp], ecx
$L70833:

; 487  : 	}

	jmp	$L70827
$L70828:

; 488  : 
; 489  : 	/* Output string to buffer & return if no substr */
; 490  : 	if(!len)

	cmp	DWORD PTR _len$[ebp], 0
	jne	SHORT $L70834

; 492  : 		DYNBUF_ADD(html, txtout, sz, TO_HTML);

	push	1
	push	OFFSET FLAT:_plain_to_html
	mov	edx, DWORD PTR _sz$[ebp]
	push	edx
	mov	eax, DWORD PTR _txtout$[ebp]
	push	eax
	mov	ecx, DWORD PTR _html$[ebp]
	push	ecx
	call	_dynbuf_add
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L70835
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29872], OFFSET FLAT:$SG70837
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 492		; 000001ecH
	jmp	$eva_err$70822
$L70835:

; 493  : 		RETURN_OK;

	jmp	$eva_noerr$70812
$L70834:

; 495  : 
; 496  : 	txt0 = val;

	mov	ecx, DWORD PTR _val$[ebp]
	mov	DWORD PTR _txt0$[ebp], ecx
$L70839:

; 497  : 	while(txt0 && *txt0)

	cmp	DWORD PTR _txt0$[ebp], 0
	je	$eva_noerr$70812
	mov	edx, DWORD PTR _txt0$[ebp]
	movsx	eax, BYTE PTR [edx]
	test	eax, eax
	je	$eva_noerr$70812

; 499  : 		/* Search 1st occurence of all substrings */
; 500  : 		for(txt = 0, i = 0, j = 0; i < words.nbrows; i++)

	mov	DWORD PTR _txt$[ebp], 0
	mov	DWORD PTR _i$[ebp], 0
	mov	DWORD PTR _j$[ebp], 0
	jmp	SHORT $L70841
$L70842:
	mov	ecx, DWORD PTR _i$[ebp]
	add	ecx, 1
	mov	DWORD PTR _i$[ebp], ecx
$L70841:
	mov	edx, DWORD PTR _i$[ebp]
	cmp	edx, DWORD PTR _words$[ebp]
	jae	SHORT $L70843

; 502  : 			char *txt2 = dyntab_val(&words, i, 0);

	push	0
	mov	eax, DWORD PTR _i$[ebp]
	push	eax
	lea	ecx, DWORD PTR _words$[ebp]
	push	ecx
	call	_dyntab_val
	add	esp, 12					; 0000000cH
	mov	DWORD PTR _txt2$70844[ebp], eax

; 503  : 			char *txt1 = *txt2 ? strstr(txt0, txt2) : NULL;

	mov	edx, DWORD PTR _txt2$70844[ebp]
	movsx	eax, BYTE PTR [edx]
	test	eax, eax
	je	SHORT $L70997
	mov	ecx, DWORD PTR _txt2$70844[ebp]
	push	ecx
	mov	edx, DWORD PTR _txt0$[ebp]
	push	edx
	call	_strstr
	add	esp, 8
	mov	DWORD PTR -72+[ebp], eax
	jmp	SHORT $L70998
$L70997:
	mov	DWORD PTR -72+[ebp], 0
$L70998:
	mov	eax, DWORD PTR -72+[ebp]
	mov	DWORD PTR _txt1$70845[ebp], eax

; 504  : 			if(!txt || (txt1 && txt1 < txt))

	cmp	DWORD PTR _txt$[ebp], 0
	je	SHORT $L70848
	cmp	DWORD PTR _txt1$70845[ebp], 0
	je	SHORT $L70847
	mov	ecx, DWORD PTR _txt1$70845[ebp]
	cmp	ecx, DWORD PTR _txt$[ebp]
	jae	SHORT $L70847
$L70848:

; 506  : 				txt = txt1;

	mov	edx, DWORD PTR _txt1$70845[ebp]
	mov	DWORD PTR _txt$[ebp], edx

; 507  : 				j = i;

	mov	eax, DWORD PTR _i$[ebp]
	mov	DWORD PTR _j$[ebp], eax
$L70847:

; 509  : 		}

	jmp	SHORT $L70842
$L70843:

; 510  : 
; 511  : 		/* Output text with bold substr */
; 512  : 		len = txt ? txt - txt0 : (sz - (txt0 - val));

	cmp	DWORD PTR _txt$[ebp], 0
	je	SHORT $L70999
	mov	ecx, DWORD PTR _txt$[ebp]
	sub	ecx, DWORD PTR _txt0$[ebp]
	mov	DWORD PTR -76+[ebp], ecx
	jmp	SHORT $L71000
$L70999:
	mov	edx, DWORD PTR _txt0$[ebp]
	sub	edx, DWORD PTR _val$[ebp]
	mov	eax, DWORD PTR _sz$[ebp]
	sub	eax, edx
	mov	DWORD PTR -76+[ebp], eax
$L71000:
	mov	ecx, DWORD PTR -76+[ebp]
	mov	DWORD PTR _len$[ebp], ecx

; 513  : 		if(len) DYNBUF_ADD(html, txtout + (txt0 - val), len, TO_HTML);

	cmp	DWORD PTR _len$[ebp], 0
	je	SHORT $L70850
	push	1
	push	OFFSET FLAT:_plain_to_html
	mov	edx, DWORD PTR _len$[ebp]
	push	edx
	mov	eax, DWORD PTR _txt0$[ebp]
	sub	eax, DWORD PTR _val$[ebp]
	mov	ecx, DWORD PTR _txtout$[ebp]
	add	ecx, eax
	push	ecx
	mov	edx, DWORD PTR _html$[ebp]
	push	edx
	call	_dynbuf_add
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L70850
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29872], OFFSET FLAT:$SG70852
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 513		; 00000201H
	jmp	$eva_err$70822
$L70850:

; 514  : 		len = dyntab_sz(substr, j, 0);

	push	0
	mov	edx, DWORD PTR _j$[ebp]
	push	edx
	mov	eax, DWORD PTR _substr$[ebp]
	push	eax
	call	_dyntab_sz
	add	esp, 12					; 0000000cH
	mov	DWORD PTR _len$[ebp], eax

; 515  : 		if(txt && len)

	cmp	DWORD PTR _txt$[ebp], 0
	je	SHORT $L70854
	cmp	DWORD PTR _len$[ebp], 0
	je	SHORT $L70854

; 516  : 			DYNBUF_ADD3(html, "<b><font color=#FF4444>", txtout + (txt - val), len, TO_HTML, "</font></b>");

	push	11					; 0000000bH
	push	OFFSET FLAT:$SG70855
	push	1
	push	OFFSET FLAT:_plain_to_html
	mov	ecx, DWORD PTR _len$[ebp]
	push	ecx
	mov	edx, DWORD PTR _txt$[ebp]
	sub	edx, DWORD PTR _val$[ebp]
	mov	eax, DWORD PTR _txtout$[ebp]
	add	eax, edx
	push	eax
	push	23					; 00000017H
	push	OFFSET FLAT:$SG70856
	mov	ecx, DWORD PTR _html$[ebp]
	push	ecx
	call	_dynbuf_add3
	add	esp, 36					; 00000024H
	test	eax, eax
	je	SHORT $L70854
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29872], OFFSET FLAT:$SG70858
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 516		; 00000204H
	jmp	SHORT $eva_err$70822
$L70854:

; 517  : 		txt0 = txt ? txt + len : 0;

	cmp	DWORD PTR _txt$[ebp], 0
	je	SHORT $L71001
	mov	ecx, DWORD PTR _txt$[ebp]
	add	ecx, DWORD PTR _len$[ebp]
	mov	DWORD PTR -80+[ebp], ecx
	jmp	SHORT $L71002
$L71001:
	mov	DWORD PTR -80+[ebp], 0
$L71002:
	mov	edx, DWORD PTR -80+[ebp]
	mov	DWORD PTR _txt0$[ebp], edx

; 518  : 	}

	jmp	$L70839
$eva_noerr$70812:

; 519  : 
; 520  :  	RETURN_OK_CLEANUP;

	push	0
	push	OFFSET FLAT:$SG70859
	push	OFFSET FLAT:$SG70860
	mov	eax, DWORD PTR _cntxt$[ebp]
	push	eax
	call	_err_clear
	add	esp, 16					; 00000010H
$eva_err$70822:
	mov	ecx, DWORD PTR _cntxt$[ebp]
	cmp	DWORD PTR [ecx+29872], 0
	je	SHORT $L70861
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	eax, DWORD PTR [edx+29900]
	push	eax
	push	OFFSET FLAT:$SG70862
	push	OFFSET FLAT:$SG70863
	mov	ecx, DWORD PTR _cntxt$[ebp]
	push	ecx
	call	_err_add_context
	add	esp, 16					; 00000010H
$L70861:
	mov	edx, DWORD PTR _val$[ebp]
	push	edx
	call	_mem_free
	add	esp, 4
	mov	DWORD PTR _val$[ebp], 0
	lea	eax, DWORD PTR _words$[ebp]
	push	eax
	call	_dyntab_free
	add	esp, 4
	mov	ecx, DWORD PTR _cntxt$[ebp]
	xor	eax, eax
	cmp	DWORD PTR [ecx+29872], 0
	setne	al

; 521  : }

	mov	esp, ebp
	pop	ebp
	ret	0
_put_html_bold_substring ENDP
_TEXT	ENDS
END
