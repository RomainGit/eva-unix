	TITLE	D:\Travail\ABI\EVA\V4.0\CGI\Brunix-2016\ctrl_input_image.c
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
PUBLIC	_spc_to_star
_DATA	SEGMENT
_spc_to_star DD	FLAT:$SG70202
	DD	01H
	DD	FLAT:$SG70203
	DD	01H
	DD	00H
	ORG $+12
$SG70202 DB	' ', 00H
	ORG $+2
$SG70203 DB	'*', 00H
_DATA	ENDS
PUBLIC	_ctrl_image_search
EXTRN	_ctrl_autofocus:NEAR
EXTRN	__snprintf:NEAR
EXTRN	_find_files:NEAR
EXTRN	_put_html_image_dir:NEAR
EXTRN	_mem_free:NEAR
EXTRN	_plain_to_html:BYTE
EXTRN	_strtoul:NEAR
EXTRN	_dynbuf_add:NEAR
EXTRN	_dynbuf_add_int:NEAR
EXTRN	_ctrl_cgi_name:NEAR
EXTRN	_dynbuf_add3:NEAR
EXTRN	_cgi_get_subfield:NEAR
EXTRN	_dyntab_free:NEAR
EXTRN	_dyntab_sz:NEAR
EXTRN	_dyntab_val:NEAR
EXTRN	_err_add_context:NEAR
EXTRN	_err_clear:NEAR
_BSS	SEGMENT
$SG70295 DB	01H DUP (?)
_BSS	ENDS
_DATA	SEGMENT
	ORG $+2
$SG70227 DB	'</td>', 00H
	ORG $+2
$SG70228 DB	'<table border=1 rules=none width=100%><tr><td align=righ'
	DB	't>Chercher une image pour <b>', 00H
	ORG $+2
$SG70230 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70233 DB	'FNAME', 00H
	ORG $+2
$SG70236 DB	'FNAME', 00H
	ORG $+2
$SG70240 DB	' size=8 value="', 00H
$SG70241 DB	'<td><input type=text name=', 00H
	ORG $+1
$SG70243 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70247 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70250 DB	'"><input type=submit value=Ok></td>', 00H
$SG70252 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70256 DB	'*', 00H
	ORG $+2
$SG70257 DB	'../img/', 00H
$SG70259 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70261 DB	'SZICO', 00H
	ORG $+2
$SG70264 DB	'SZICO', 00H
	ORG $+2
$SG70267 DB	'%lu', 00H
$SG70271 DB	' size=2 value=', 00H
	ORG $+1
$SG70272 DB	'<td align=right>Taille ic', 0f4H, 'nes<td><input type=te'
	DB	'xt name=', 00H
$SG70274 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70277 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70280 DB	'> px</td></tr></table>', 00H
	ORG $+1
$SG70282 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70287 DB	'<table border=1 rules=none width=100%><tr><td>', 00H
	ORG $+1
$SG70289 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70296 DB	'SEL', 00H
$SG70298 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70307 DB	' ', 00H
	ORG $+2
$SG70309 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70312 DB	'</tr></table>', 00H
	ORG $+2
$SG70314 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70318 DB	'Entrer le texte ', 0e0H, ' chercher', 00H
	ORG $+1
$SG70320 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70322 DB	'D:\Travail\ABI\EVA\V4.0\CGI\Brunix-2016\ctrl_input_image'
	DB	'.c', 00H
	ORG $+1
$SG70323 DB	'ctrl_image_search', 00H
	ORG $+2
$SG70325 DB	'D:\Travail\ABI\EVA\V4.0\CGI\Brunix-2016\ctrl_input_image'
	DB	'.c', 00H
	ORG $+1
$SG70326 DB	'ctrl_image_search', 00H
_DATA	ENDS
_TEXT	SEGMENT
_cntxt$ = 8
_i_ctrl$ = 12
_form$ = -4
_ctrl$ = -72
_cgival$ = -56
_files$ = -32
_name$ = -68
_srch$ = -64
_i$ = -36
_szico$ = -60
_szstr$ = -12
_ctrl_image_search PROC NEAR

; 36   : ){

	push	ebp
	mov	ebp, esp
	sub	esp, 96					; 00000060H

; 37   : 	EVA_form *form = cntxt->form;

	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	ecx, DWORD PTR [eax+80]
	mov	DWORD PTR _form$[ebp], ecx

; 38   : 	EVA_ctrl *ctrl = form->ctrl + i_ctrl;

	mov	edx, DWORD PTR _i_ctrl$[ebp]
	imul	edx, 480				; 000001e0H
	mov	eax, DWORD PTR _form$[ebp]
	mov	ecx, DWORD PTR [eax]
	add	ecx, edx
	mov	DWORD PTR _ctrl$[ebp], ecx

; 39   : 	DynTable cgival = {0};

	mov	DWORD PTR _cgival$[ebp], 0
	xor	edx, edx
	mov	DWORD PTR _cgival$[ebp+4], edx
	mov	DWORD PTR _cgival$[ebp+8], edx
	mov	DWORD PTR _cgival$[ebp+12], edx
	mov	DWORD PTR _cgival$[ebp+16], edx

; 40   : 	DynTable files = {0};

	mov	DWORD PTR _files$[ebp], 0
	xor	eax, eax
	mov	DWORD PTR _files$[ebp+4], eax
	mov	DWORD PTR _files$[ebp+8], eax
	mov	DWORD PTR _files$[ebp+12], eax
	mov	DWORD PTR _files$[ebp+16], eax

; 41   : 	DynBuffer *name = NULL;

	mov	DWORD PTR _name$[ebp], 0

; 42   : 	DynBuffer *srch = NULL;

	mov	DWORD PTR _srch$[ebp], 0

; 43   : 	unsigned long i, szico;
; 44   : 	char szstr[8] = {0};

	mov	BYTE PTR _szstr$[ebp], 0
	xor	ecx, ecx
	mov	DWORD PTR _szstr$[ebp+1], ecx
	mov	WORD PTR _szstr$[ebp+5], cx
	mov	BYTE PTR _szstr$[ebp+7], cl

; 48   : 							ctrl->LABEL, 0, TO_HTML, "</td>");

	push	5
	push	OFFSET FLAT:$SG70227
	push	1
	push	OFFSET FLAT:_plain_to_html
	push	0
	mov	edx, DWORD PTR _ctrl$[ebp]
	mov	eax, DWORD PTR [edx+284]
	push	eax
	push	85					; 00000055H
	push	OFFSET FLAT:$SG70228
	mov	ecx, DWORD PTR _form$[ebp]
	mov	edx, DWORD PTR [ecx+232]
	push	edx
	call	_dynbuf_add3
	add	esp, 36					; 00000024H
	test	eax, eax
	je	SHORT $L70226
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29872], OFFSET FLAT:$SG70230
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 48		; 00000030H
	jmp	$eva_err$70231
$L70226:

; 49   : 
; 50   : 	/* Output file name search input & Ok button (preserve previous value) */
; 51   : 	CTRL_GET_CGI_SUBFIELD("FNAME");

	push	0
	push	0
	push	0
	push	OFFSET FLAT:$SG70233
	mov	edx, DWORD PTR _ctrl$[ebp]
	push	edx
	lea	eax, DWORD PTR _cgival$[ebp]
	push	eax
	mov	ecx, DWORD PTR _cntxt$[ebp]
	push	ecx
	call	_cgi_get_subfield
	add	esp, 28					; 0000001cH
	test	eax, eax
	je	SHORT $L70232
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 51		; 00000033H
	jmp	$eva_err$70231
$L70232:

; 52   : 	CTRL_CGINAMESUBFIELD(&name, NULL, "FNAME");

	push	5
	push	OFFSET FLAT:$SG70236
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
	je	SHORT $L70235
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 52		; 00000034H
	jmp	$eva_err$70231
$L70235:

; 53   : 	DYNBUF_ADD3_BUF(form->html, "<td><input type=text name=", name, NO_CONV, " size=8 value=\"");

	cmp	DWORD PTR _name$[ebp], 0
	je	SHORT $L70440
	mov	ecx, DWORD PTR _name$[ebp]
	mov	edx, DWORD PTR [ecx+4]
	mov	DWORD PTR -76+[ebp], edx
	jmp	SHORT $L70441
$L70440:
	mov	DWORD PTR -76+[ebp], 0
$L70441:
	cmp	DWORD PTR _name$[ebp], 0
	je	SHORT $L70442
	mov	eax, DWORD PTR _name$[ebp]
	add	eax, 8
	mov	DWORD PTR -80+[ebp], eax
	jmp	SHORT $L70443
$L70442:
	mov	DWORD PTR -80+[ebp], 0
$L70443:
	push	15					; 0000000fH
	push	OFFSET FLAT:$SG70240
	push	0
	push	0
	mov	ecx, DWORD PTR -76+[ebp]
	push	ecx
	mov	edx, DWORD PTR -80+[ebp]
	push	edx
	push	26					; 0000001aH
	push	OFFSET FLAT:$SG70241
	mov	eax, DWORD PTR _form$[ebp]
	mov	ecx, DWORD PTR [eax+232]
	push	ecx
	call	_dynbuf_add3
	add	esp, 36					; 00000024H
	test	eax, eax
	je	SHORT $L70239
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29872], OFFSET FLAT:$SG70243
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 53		; 00000035H
	jmp	$eva_err$70231
$L70239:

; 54   : 	DYNBUF_ADD_CELL(form->html, &cgival, 0, 0, NO_CONV);

	push	0
	push	0
	push	0
	push	0
	lea	ecx, DWORD PTR _cgival$[ebp]
	push	ecx
	call	_dyntab_sz
	add	esp, 12					; 0000000cH
	push	eax
	push	0
	push	0
	lea	edx, DWORD PTR _cgival$[ebp]
	push	edx
	call	_dyntab_val
	add	esp, 12					; 0000000cH
	push	eax
	mov	eax, DWORD PTR _form$[ebp]
	mov	ecx, DWORD PTR [eax+232]
	push	ecx
	call	_dynbuf_add
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L70245
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29872], OFFSET FLAT:$SG70247
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 54		; 00000036H
	jmp	$eva_err$70231
$L70245:

; 55   : 	DYNBUF_ADD_STR(form->html, "\"><input type=submit value=Ok></td>");

	push	0
	push	0
	push	35					; 00000023H
	push	OFFSET FLAT:$SG70250
	mov	ecx, DWORD PTR _form$[ebp]
	mov	edx, DWORD PTR [ecx+232]
	push	edx
	call	_dynbuf_add
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L70249
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29872], OFFSET FLAT:$SG70252
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 55		; 00000037H
	jmp	$eva_err$70231
$L70249:

; 56   : 	if(ctrl_autofocus(cntxt, DYNBUF_VAL_SZ(name), 1)) STACK_ERROR;

	cmp	DWORD PTR _name$[ebp], 0
	je	SHORT $L70444
	mov	edx, DWORD PTR _name$[ebp]
	mov	eax, DWORD PTR [edx+4]
	mov	DWORD PTR -84+[ebp], eax
	jmp	SHORT $L70445
$L70444:
	mov	DWORD PTR -84+[ebp], 0
$L70445:
	cmp	DWORD PTR _name$[ebp], 0
	je	SHORT $L70446
	mov	ecx, DWORD PTR _name$[ebp]
	add	ecx, 8
	mov	DWORD PTR -88+[ebp], ecx
	jmp	SHORT $L70447
$L70446:
	mov	DWORD PTR -88+[ebp], 0
$L70447:
	push	1
	mov	edx, DWORD PTR -84+[ebp]
	push	edx
	mov	eax, DWORD PTR -88+[ebp]
	push	eax
	mov	ecx, DWORD PTR _cntxt$[ebp]
	push	ecx
	call	_ctrl_autofocus
	add	esp, 16					; 00000010H
	test	eax, eax
	je	SHORT $L70254
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 56		; 00000038H
	jmp	$eva_err$70231
$L70254:

; 57   : 
; 58   : 	/* Set search path */
; 59   : 	DYNBUF_ADD3_CELL(&srch, "../img/", &cgival, 0, 0, SPC_TO_STAR, "*");

	push	1
	push	OFFSET FLAT:$SG70256
	push	1
	push	OFFSET FLAT:_spc_to_star
	push	0
	push	0
	lea	eax, DWORD PTR _cgival$[ebp]
	push	eax
	call	_dyntab_sz
	add	esp, 12					; 0000000cH
	push	eax
	push	0
	push	0
	lea	ecx, DWORD PTR _cgival$[ebp]
	push	ecx
	call	_dyntab_val
	add	esp, 12					; 0000000cH
	push	eax
	push	7
	push	OFFSET FLAT:$SG70257
	lea	edx, DWORD PTR _srch$[ebp]
	push	edx
	call	_dynbuf_add3
	add	esp, 36					; 00000024H
	test	eax, eax
	je	SHORT $L70255
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29872], OFFSET FLAT:$SG70259
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 59		; 0000003bH
	jmp	$eva_err$70231
$L70255:

; 60   : 
; 61   : 	/* Output icons size input (preserve previous value - default 50) */
; 62   : 	CTRL_GET_CGI_SUBFIELD("SZICO");

	push	0
	push	0
	push	0
	push	OFFSET FLAT:$SG70261
	mov	edx, DWORD PTR _ctrl$[ebp]
	push	edx
	lea	eax, DWORD PTR _cgival$[ebp]
	push	eax
	mov	ecx, DWORD PTR _cntxt$[ebp]
	push	ecx
	call	_cgi_get_subfield
	add	esp, 28					; 0000001cH
	test	eax, eax
	je	SHORT $L70260
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 62		; 0000003eH
	jmp	$eva_err$70231
$L70260:

; 63   : 	CTRL_CGINAMESUBFIELD(&name, NULL, "SZICO");

	push	5
	push	OFFSET FLAT:$SG70264
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
	je	SHORT $L70263
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 63		; 0000003fH
	jmp	$eva_err$70231
$L70263:

; 64   : 	szico = DYNTAB_TOUL(&cgival);

	push	10					; 0000000aH
	push	0
	push	0
	push	0
	lea	ecx, DWORD PTR _cgival$[ebp]
	push	ecx
	call	_dyntab_val
	add	esp, 12					; 0000000cH
	push	eax
	call	_strtoul
	add	esp, 12					; 0000000cH
	mov	DWORD PTR _szico$[ebp], eax

; 65   : 	if(!szico) szico = 50;

	cmp	DWORD PTR _szico$[ebp], 0
	jne	SHORT $L70266
	mov	DWORD PTR _szico$[ebp], 50		; 00000032H
$L70266:

; 66   : 	snprintf(add_sz_str(szstr), "%lu", szico);

	mov	edx, DWORD PTR _szico$[ebp]
	push	edx
	push	OFFSET FLAT:$SG70267
	push	7
	lea	eax, DWORD PTR _szstr$[ebp]
	push	eax
	call	__snprintf
	add	esp, 16					; 00000010H

; 67   : 	DYNBUF_ADD3_BUF(form->html, "<td align=right>Taille icônes<td><input type=text name=", name, NO_CONV, " size=2 value=");

	cmp	DWORD PTR _name$[ebp], 0
	je	SHORT $L70448
	mov	ecx, DWORD PTR _name$[ebp]
	mov	edx, DWORD PTR [ecx+4]
	mov	DWORD PTR -92+[ebp], edx
	jmp	SHORT $L70449
$L70448:
	mov	DWORD PTR -92+[ebp], 0
$L70449:
	cmp	DWORD PTR _name$[ebp], 0
	je	SHORT $L70450
	mov	eax, DWORD PTR _name$[ebp]
	add	eax, 8
	mov	DWORD PTR -96+[ebp], eax
	jmp	SHORT $L70451
$L70450:
	mov	DWORD PTR -96+[ebp], 0
$L70451:
	push	14					; 0000000eH
	push	OFFSET FLAT:$SG70271
	push	0
	push	0
	mov	ecx, DWORD PTR -92+[ebp]
	push	ecx
	mov	edx, DWORD PTR -96+[ebp]
	push	edx
	push	55					; 00000037H
	push	OFFSET FLAT:$SG70272
	mov	eax, DWORD PTR _form$[ebp]
	mov	ecx, DWORD PTR [eax+232]
	push	ecx
	call	_dynbuf_add3
	add	esp, 36					; 00000024H
	test	eax, eax
	je	SHORT $L70270
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29872], OFFSET FLAT:$SG70274
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 67		; 00000043H
	jmp	$eva_err$70231
$L70270:

; 68   : 	DYNBUF_ADD_INT(form->html, szico);

	mov	ecx, DWORD PTR _szico$[ebp]
	push	ecx
	mov	edx, DWORD PTR _form$[ebp]
	mov	eax, DWORD PTR [edx+232]
	push	eax
	call	_dynbuf_add_int
	add	esp, 8
	test	eax, eax
	je	SHORT $L70275
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29872], OFFSET FLAT:$SG70277
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 68		; 00000044H
	jmp	$eva_err$70231
$L70275:

; 69   : 	DYNBUF_ADD_STR(form->html, "> px</td></tr></table>");

	push	0
	push	0
	push	22					; 00000016H
	push	OFFSET FLAT:$SG70280
	mov	eax, DWORD PTR _form$[ebp]
	mov	ecx, DWORD PTR [eax+232]
	push	ecx
	call	_dynbuf_add
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L70279
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29872], OFFSET FLAT:$SG70282
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 69		; 00000045H
	jmp	$eva_err$70231
$L70279:

; 70   : 
; 71   : 	/* Handle input for seach string */
; 72   : 	if(srch && srch->cnt)

	cmp	DWORD PTR _srch$[ebp], 0
	je	$L70283
	mov	ecx, DWORD PTR _srch$[ebp]
	cmp	DWORD PTR [ecx+4], 0
	je	$L70283

; 74   : 		/* Read matching files */
; 75   : 		if(find_files(cntxt, &files, srch->data, 0)) STACK_ERROR;

	push	0
	mov	edx, DWORD PTR _srch$[ebp]
	add	edx, 8
	push	edx
	lea	eax, DWORD PTR _files$[ebp]
	push	eax
	mov	ecx, DWORD PTR _cntxt$[ebp]
	push	ecx
	call	_find_files
	add	esp, 16					; 00000010H
	test	eax, eax
	je	SHORT $L70284
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 75		; 0000004bH
	jmp	$eva_err$70231
$L70284:

; 76   : 
; 77   : 		/* Output images */
; 78   : 		DYNBUF_ADD_STR(form->html, "<table border=1 rules=none width=100%><tr><td>");

	push	0
	push	0
	push	46					; 0000002eH
	push	OFFSET FLAT:$SG70287
	mov	eax, DWORD PTR _form$[ebp]
	mov	ecx, DWORD PTR [eax+232]
	push	ecx
	call	_dynbuf_add
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L70286
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29872], OFFSET FLAT:$SG70289
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 78		; 0000004eH
	jmp	$eva_err$70231
$L70286:

; 79   : 		for(i = 0; i < files.nbrows; i++)

	mov	DWORD PTR _i$[ebp], 0
	jmp	SHORT $L70290
$L70291:
	mov	ecx, DWORD PTR _i$[ebp]
	add	ecx, 1
	mov	DWORD PTR _i$[ebp], ecx
$L70290:
	mov	edx, DWORD PTR _i$[ebp]
	cmp	edx, DWORD PTR _files$[ebp]
	jae	$L70292

; 81   : 			/* Build subfield with file name */
; 82   : 			srch->cnt = 0;

	mov	eax, DWORD PTR _srch$[ebp]
	mov	DWORD PTR [eax+4], 0

; 83   : 			DYNBUF_ADD3_CELL(&srch, "SEL", &files, i, 0, NO_CONV, "");

	push	0
	push	OFFSET FLAT:$SG70295
	push	0
	push	0
	push	0
	mov	ecx, DWORD PTR _i$[ebp]
	push	ecx
	lea	edx, DWORD PTR _files$[ebp]
	push	edx
	call	_dyntab_sz
	add	esp, 12					; 0000000cH
	push	eax
	push	0
	mov	eax, DWORD PTR _i$[ebp]
	push	eax
	lea	ecx, DWORD PTR _files$[ebp]
	push	ecx
	call	_dyntab_val
	add	esp, 12					; 0000000cH
	push	eax
	push	3
	push	OFFSET FLAT:$SG70296
	lea	edx, DWORD PTR _srch$[ebp]
	push	edx
	call	_dynbuf_add3
	add	esp, 36					; 00000024H
	test	eax, eax
	je	SHORT $L70294
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29872], OFFSET FLAT:$SG70298
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 83		; 00000053H
	jmp	$eva_err$70231
$L70294:

; 84   : 			CTRL_CGINAMEBTN1(&name, NULL, srch->data, srch->cnt);

	mov	edx, DWORD PTR _srch$[ebp]
	mov	eax, DWORD PTR [edx+4]
	push	eax
	mov	ecx, DWORD PTR _srch$[ebp]
	add	ecx, 8
	push	ecx
	push	66					; 00000042H
	lea	edx, DWORD PTR _name$[ebp]
	push	edx
	push	1
	push	0
	mov	eax, DWORD PTR _ctrl$[ebp]
	push	eax
	mov	ecx, DWORD PTR _cntxt$[ebp]
	push	ecx
	call	_ctrl_cgi_name
	add	esp, 32					; 00000020H
	test	eax, eax
	je	SHORT $L70300
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 84		; 00000054H
	jmp	$eva_err$70231
$L70300:

; 85   : 
; 86   : 			/* Build subfield with file name */
; 87   : 			if(put_html_image_dir(cntxt, name->data, NULL,
; 88   : 									dyntab_val(&files, i, 0),
; 89   : 									dyntab_val(&files, i, 0),
; 90   : 									szstr, szstr, 0, 0, NULL, NULL)) STACK_ERROR;

	push	0
	push	0
	push	0
	push	0
	lea	eax, DWORD PTR _szstr$[ebp]
	push	eax
	lea	ecx, DWORD PTR _szstr$[ebp]
	push	ecx
	push	0
	mov	edx, DWORD PTR _i$[ebp]
	push	edx
	lea	eax, DWORD PTR _files$[ebp]
	push	eax
	call	_dyntab_val
	add	esp, 12					; 0000000cH
	push	eax
	push	0
	mov	ecx, DWORD PTR _i$[ebp]
	push	ecx
	lea	edx, DWORD PTR _files$[ebp]
	push	edx
	call	_dyntab_val
	add	esp, 12					; 0000000cH
	push	eax
	push	0
	mov	eax, DWORD PTR _name$[ebp]
	add	eax, 8
	push	eax
	mov	ecx, DWORD PTR _cntxt$[ebp]
	push	ecx
	call	_put_html_image_dir
	add	esp, 44					; 0000002cH
	test	eax, eax
	je	SHORT $L70304
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 90		; 0000005aH
	jmp	$eva_err$70231
$L70304:

; 91   : 			DYNBUF_ADD_STR(form->html, " ");

	push	0
	push	0
	push	1
	push	OFFSET FLAT:$SG70307
	mov	eax, DWORD PTR _form$[ebp]
	mov	ecx, DWORD PTR [eax+232]
	push	ecx
	call	_dynbuf_add
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L70306
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29872], OFFSET FLAT:$SG70309
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 91		; 0000005bH
	jmp	$eva_err$70231
$L70306:

; 92   : 		}

	jmp	$L70291
$L70292:

; 93   : 		DYNBUF_ADD_STR(form->html, "</tr></table>");

	push	0
	push	0
	push	13					; 0000000dH
	push	OFFSET FLAT:$SG70312
	mov	ecx, DWORD PTR _form$[ebp]
	mov	edx, DWORD PTR [ecx+232]
	push	edx
	call	_dynbuf_add
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L70311
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29872], OFFSET FLAT:$SG70314
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 93		; 0000005dH
	jmp	SHORT $eva_err$70231
$L70311:

; 95   : 	else

	jmp	SHORT $L70317
$L70283:

; 96   : 		DYNBUF_ADD_STR(form->html, "Entrer le texte à chercher");

	push	0
	push	0
	push	26					; 0000001aH
	push	OFFSET FLAT:$SG70318
	mov	edx, DWORD PTR _form$[ebp]
	mov	eax, DWORD PTR [edx+232]
	push	eax
	call	_dynbuf_add
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L70317
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29872], OFFSET FLAT:$SG70320
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 96		; 00000060H
	jmp	SHORT $eva_err$70231
$L70317:
$eva_noerr$70321:

; 97   : 
; 98   : 	RETURN_OK_CLEANUP;

	push	0
	push	OFFSET FLAT:$SG70322
	push	OFFSET FLAT:$SG70323
	mov	eax, DWORD PTR _cntxt$[ebp]
	push	eax
	call	_err_clear
	add	esp, 16					; 00000010H
$eva_err$70231:
	mov	ecx, DWORD PTR _cntxt$[ebp]
	cmp	DWORD PTR [ecx+29872], 0
	je	SHORT $L70324
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	eax, DWORD PTR [edx+29900]
	push	eax
	push	OFFSET FLAT:$SG70325
	push	OFFSET FLAT:$SG70326
	mov	ecx, DWORD PTR _cntxt$[ebp]
	push	ecx
	call	_err_add_context
	add	esp, 16					; 00000010H
$L70324:
	lea	edx, DWORD PTR _cgival$[ebp]
	push	edx
	call	_dyntab_free
	add	esp, 4
	lea	eax, DWORD PTR _files$[ebp]
	push	eax
	call	_dyntab_free
	add	esp, 4
	mov	ecx, DWORD PTR _name$[ebp]
	push	ecx
	call	_mem_free
	add	esp, 4
	mov	DWORD PTR _name$[ebp], 0
	mov	edx, DWORD PTR _srch$[ebp]
	push	edx
	call	_mem_free
	add	esp, 4
	mov	DWORD PTR _srch$[ebp], 0
	mov	eax, DWORD PTR _cntxt$[ebp]
	xor	ecx, ecx
	cmp	DWORD PTR [eax+29872], 0
	setne	cl
	mov	eax, ecx

; 99   : }

	mov	esp, ebp
	pop	ebp
	ret	0
_ctrl_image_search ENDP
_TEXT	ENDS
PUBLIC	_ctrl_add_input_image
EXTRN	_put_html_text_input:NEAR
EXTRN	_dyntab_cell:NEAR
EXTRN	_ctrl_format_pos:NEAR
EXTRN	_dyntab_add:NEAR
EXTRN	_strcmp:NEAR
EXTRN	_ctrl_put_hidden_old:NEAR
EXTRN	_strncmp:NEAR
EXTRN	_dyntab_txt_cmp:NEAR
EXTRN	_dyntab_field_val:NEAR
_BSS	SEGMENT
	ALIGN	4

$SG70345 DB	01H DUP (?)
	ALIGN	4

$SG70348 DB	01H DUP (?)
	ALIGN	4

$SG70351 DB	01H DUP (?)
	ALIGN	4

$SG70354 DB	01H DUP (?)
_BSS	ENDS
_DATA	SEGMENT
	ORG $+2
$SG70342 DB	'No', 00H
	ORG $+1
$SG70344 DB	'_EVA_IMAGE_DIR', 00H
	ORG $+1
$SG70347 DB	'_EVA_IMAGE_DEFAULT', 00H
	ORG $+1
$SG70350 DB	'_EVA_IMG_WIDTH', 00H
	ORG $+1
$SG70353 DB	'_EVA_IMG_HEIGHT', 00H
$SG70364 DB	'IMGSRCH', 00H
$SG70369 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70376 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70379 DB	'SEL', 00H
$SG70383 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70396 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70405 DB	'<br>', 00H
	ORG $+3
$SG70407 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70421 DB	' ', 00H
	ORG $+2
$SG70423 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70431 DB	'D:\Travail\ABI\EVA\V4.0\CGI\Brunix-2016\ctrl_input_image'
	DB	'.c', 00H
	ORG $+1
$SG70432 DB	'ctrl_add_input_image', 00H
	ORG $+3
$SG70434 DB	'D:\Travail\ABI\EVA\V4.0\CGI\Brunix-2016\ctrl_input_image'
	DB	'.c', 00H
	ORG $+1
$SG70435 DB	'ctrl_add_input_image', 00H
_DATA	ENDS
_TEXT	SEGMENT
_cntxt$ = 8
_i_ctrl$ = 12
_form$ = -4
_ctrl$ = -40
_name$ = -36
_i$ = -20
_k$ = -28
_b_multiple$ = -24
_dir$ = -32
_imgdef$ = -12
_w$ = -8
_h$ = -16
_cgi$70361 = -48
_btn$70362 = -44
_img$70415 = -52
_ctrl_add_input_image PROC NEAR

; 112  : ){

	push	ebp
	mov	ebp, esp
	sub	esp, 96					; 00000060H

; 113  : 	EVA_form *form = cntxt->form;

	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	ecx, DWORD PTR [eax+80]
	mov	DWORD PTR _form$[ebp], ecx

; 114  : 	EVA_ctrl *ctrl = form->ctrl + i_ctrl;

	mov	edx, DWORD PTR _i_ctrl$[ebp]
	imul	edx, 480				; 000001e0H
	mov	eax, DWORD PTR _form$[ebp]
	mov	ecx, DWORD PTR [eax]
	add	ecx, edx
	mov	DWORD PTR _ctrl$[ebp], ecx

; 115  : 	DynBuffer *name = NULL;

	mov	DWORD PTR _name$[ebp], 0

; 116  : 	unsigned long i, k;
; 117  : 	int b_multiple = ctrl->MULTIPLE[0] != 0 && strcmp("No", ctrl->MULTIPLE);

	mov	edx, DWORD PTR _ctrl$[ebp]
	mov	eax, DWORD PTR [edx+344]
	movsx	ecx, BYTE PTR [eax]
	test	ecx, ecx
	je	SHORT $L70453
	mov	edx, DWORD PTR _ctrl$[ebp]
	mov	eax, DWORD PTR [edx+344]
	push	eax
	push	OFFSET FLAT:$SG70342
	call	_strcmp
	add	esp, 8
	test	eax, eax
	je	SHORT $L70453
	mov	DWORD PTR -56+[ebp], 1
	jmp	SHORT $L70454
$L70453:
	mov	DWORD PTR -56+[ebp], 0
$L70454:
	mov	ecx, DWORD PTR -56+[ebp]
	mov	DWORD PTR _b_multiple$[ebp], ecx

; 118  : 	char *dir = CTRL_ATTR_VAL(IMAGE_DIR);

	cmp	DWORD PTR _ctrl$[ebp], 0
	je	SHORT $L70455
	push	0
	push	-1
	push	OFFSET FLAT:$SG70344
	mov	edx, DWORD PTR _ctrl$[ebp]
	add	edx, 44					; 0000002cH
	push	edx
	call	_dyntab_field_val
	add	esp, 16					; 00000010H
	mov	DWORD PTR -60+[ebp], eax
	jmp	SHORT $L70456
$L70455:
	mov	DWORD PTR -60+[ebp], OFFSET FLAT:$SG70345
$L70456:
	mov	eax, DWORD PTR -60+[ebp]
	mov	DWORD PTR _dir$[ebp], eax

; 119  : 	char *imgdef = CTRL_ATTR_VAL(IMAGE_DEFAULT);

	cmp	DWORD PTR _ctrl$[ebp], 0
	je	SHORT $L70457
	push	0
	push	-1
	push	OFFSET FLAT:$SG70347
	mov	ecx, DWORD PTR _ctrl$[ebp]
	add	ecx, 44					; 0000002cH
	push	ecx
	call	_dyntab_field_val
	add	esp, 16					; 00000010H
	mov	DWORD PTR -64+[ebp], eax
	jmp	SHORT $L70458
$L70457:
	mov	DWORD PTR -64+[ebp], OFFSET FLAT:$SG70348
$L70458:
	mov	edx, DWORD PTR -64+[ebp]
	mov	DWORD PTR _imgdef$[ebp], edx

; 120  : 	char *w = CTRL_ATTR_VAL(IMG_WIDTH), *h = CTRL_ATTR_VAL(IMG_HEIGHT);

	cmp	DWORD PTR _ctrl$[ebp], 0
	je	SHORT $L70459
	push	0
	push	-1
	push	OFFSET FLAT:$SG70350
	mov	eax, DWORD PTR _ctrl$[ebp]
	add	eax, 44					; 0000002cH
	push	eax
	call	_dyntab_field_val
	add	esp, 16					; 00000010H
	mov	DWORD PTR -68+[ebp], eax
	jmp	SHORT $L70460
$L70459:
	mov	DWORD PTR -68+[ebp], OFFSET FLAT:$SG70351
$L70460:
	mov	ecx, DWORD PTR -68+[ebp]
	mov	DWORD PTR _w$[ebp], ecx
	cmp	DWORD PTR _ctrl$[ebp], 0
	je	SHORT $L70461
	push	0
	push	-1
	push	OFFSET FLAT:$SG70353
	mov	edx, DWORD PTR _ctrl$[ebp]
	add	edx, 44					; 0000002cH
	push	edx
	call	_dyntab_field_val
	add	esp, 16					; 00000010H
	mov	DWORD PTR -72+[ebp], eax
	jmp	SHORT $L70462
$L70461:
	mov	DWORD PTR -72+[ebp], OFFSET FLAT:$SG70354
$L70462:
	mov	eax, DWORD PTR -72+[ebp]
	mov	DWORD PTR _h$[ebp], eax

; 121  : 
; 122  : 	switch(form->step)
; 123  : 	{

	mov	ecx, DWORD PTR _form$[ebp]
	mov	edx, DWORD PTR [ecx+176]
	mov	DWORD PTR -76+[ebp], edx
	cmp	DWORD PTR -76+[ebp], 7
	ja	$L70430
	mov	eax, DWORD PTR -76+[ebp]
	jmp	DWORD PTR $L70473[eax*4]
$L70359:

; 124  : 	case CtrlRead:
; 125  : 		/* Handle image search button click */
; 126  : 		if(form->i_ctrl_clic == i_ctrl)

	mov	ecx, DWORD PTR _form$[ebp]
	mov	edx, DWORD PTR [ecx+124]
	cmp	edx, DWORD PTR _i_ctrl$[ebp]
	jne	$L70384

; 128  : 			CGIData *cgi = cntxt->cgi + cntxt->cgibtn;

	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	ecx, DWORD PTR [eax+29656]
	imul	ecx, 56					; 00000038H
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	eax, DWORD PTR [edx+29648]
	add	eax, ecx
	mov	DWORD PTR _cgi$70361[ebp], eax

; 129  : 			char *btn = cgi->subfield;

	mov	ecx, DWORD PTR _cgi$70361[ebp]
	mov	edx, DWORD PTR [ecx+32]
	mov	DWORD PTR _btn$70362[ebp], edx

; 130  : 			if(!strcmp(btn, "IMGSRCH"))

	push	OFFSET FLAT:$SG70364
	mov	eax, DWORD PTR _btn$70362[ebp]
	push	eax
	call	_strcmp
	add	esp, 8
	test	eax, eax
	jne	$L70363

; 132  : 				/* Search button clicked : initiate search dialog */
; 133  : 				DYNTAB_ADD_BUF(&form->dlg_ctrl, 0, 0, ctrl->cginame);

	mov	ecx, DWORD PTR _ctrl$[ebp]
	cmp	DWORD PTR [ecx+40], 0
	je	SHORT $L70365
	mov	edx, DWORD PTR _ctrl$[ebp]
	mov	eax, DWORD PTR [edx+40]
	cmp	DWORD PTR [eax+4], 0
	je	SHORT $L70365
	push	0
	push	0
	mov	ecx, DWORD PTR _ctrl$[ebp]
	mov	edx, DWORD PTR [ecx+40]
	mov	eax, DWORD PTR [edx+4]
	push	eax
	mov	ecx, DWORD PTR _ctrl$[ebp]
	mov	edx, DWORD PTR [ecx+40]
	add	edx, 8
	push	edx
	push	0
	push	0
	mov	eax, DWORD PTR _form$[ebp]
	add	eax, 180				; 000000b4H
	push	eax
	call	_dyntab_add
	add	esp, 28					; 0000001cH
	test	eax, eax
	je	SHORT $L70367
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29872], OFFSET FLAT:$SG70369
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 133		; 00000085H
	jmp	$eva_err$70370
$L70367:
	jmp	SHORT $L70374
$L70365:
	push	0
	push	0
	push	0
	push	0
	push	0
	push	0
	mov	eax, DWORD PTR _form$[ebp]
	add	eax, 180				; 000000b4H
	push	eax
	call	_dyntab_add
	add	esp, 28					; 0000001cH
	test	eax, eax
	je	SHORT $L70374
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29872], OFFSET FLAT:$SG70376
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 133		; 00000085H
	jmp	$eva_err$70370
$L70374:

; 135  : 			else if(!strncmp(btn, add_sz_str("SEL")))

	jmp	SHORT $L70384
$L70363:
	push	3
	push	OFFSET FLAT:$SG70379
	mov	eax, DWORD PTR _btn$70362[ebp]
	push	eax
	call	_strncmp
	add	esp, 12					; 0000000cH
	test	eax, eax
	jne	SHORT $L70378

; 137  : 				/* Image selected : set input & terminate search dialog */
; 138  : 				DYNTAB_ADD(&ctrl->val, 0, 0, btn + 3, 0, NO_CONV);

	push	0
	push	0
	push	0
	mov	ecx, DWORD PTR _btn$70362[ebp]
	add	ecx, 3
	push	ecx
	push	0
	push	0
	mov	edx, DWORD PTR _ctrl$[ebp]
	add	edx, 64					; 00000040H
	push	edx
	call	_dyntab_add
	add	esp, 28					; 0000001cH
	test	eax, eax
	je	SHORT $L70381
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29872], OFFSET FLAT:$SG70383
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 138		; 0000008aH
	jmp	$eva_err$70370
$L70381:

; 139  : 				DYNTAB_FREE(form->dlg_ctrl);

	mov	edx, DWORD PTR _form$[ebp]
	add	edx, 180				; 000000b4H
	push	edx
	call	_dyntab_free
	add	esp, 4

; 141  : 			else

	jmp	SHORT $L70384
$L70378:

; 142  : 				DYNTAB_FREE(form->dlg_ctrl);

	mov	eax, DWORD PTR _form$[ebp]
	add	eax, 180				; 000000b4H
	push	eax
	call	_dyntab_free
	add	esp, 4
$L70384:

; 144  : 		break;

	jmp	$eva_noerr$70390
$L70385:

; 145  : 
; 146  : 	case HtmlPrint:
; 147  : 	case HtmlView:
; 148  : 
; 149  : 	case HtmlEdit:
; 150  : 		/* Handle image search dialog */
; 151  : 		if(!dyntab_txt_cmp(DYNBUF_VAL_SZ(ctrl->cginame), &form->dlg_ctrl, 0, 0))

	mov	ecx, DWORD PTR _ctrl$[ebp]
	cmp	DWORD PTR [ecx+40], 0
	je	SHORT $L70463
	mov	edx, DWORD PTR _ctrl$[ebp]
	mov	eax, DWORD PTR [edx+40]
	mov	ecx, DWORD PTR [eax+4]
	mov	DWORD PTR -80+[ebp], ecx
	jmp	SHORT $L70464
$L70463:
	mov	DWORD PTR -80+[ebp], 0
$L70464:
	mov	edx, DWORD PTR _ctrl$[ebp]
	cmp	DWORD PTR [edx+40], 0
	je	SHORT $L70465
	mov	eax, DWORD PTR _ctrl$[ebp]
	mov	ecx, DWORD PTR [eax+40]
	add	ecx, 8
	mov	DWORD PTR -84+[ebp], ecx
	jmp	SHORT $L70466
$L70465:
	mov	DWORD PTR -84+[ebp], 0
$L70466:
	push	0
	push	0
	mov	edx, DWORD PTR _form$[ebp]
	add	edx, 180				; 000000b4H
	push	edx
	mov	eax, DWORD PTR -80+[ebp]
	push	eax
	mov	ecx, DWORD PTR -84+[ebp]
	push	ecx
	call	_dyntab_txt_cmp
	add	esp, 20					; 00000014H
	test	eax, eax
	jne	SHORT $L70387

; 153  : 			if(ctrl_image_search(cntxt, i_ctrl)) STACK_ERROR;

	mov	edx, DWORD PTR _i_ctrl$[ebp]
	push	edx
	mov	eax, DWORD PTR _cntxt$[ebp]
	push	eax
	call	_ctrl_image_search
	add	esp, 8
	test	eax, eax
	je	SHORT $L70388
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 153		; 00000099H
	jmp	$eva_err$70370
$L70388:

; 154  : 			break;

	jmp	$eva_noerr$70390
$L70387:

; 156  : 
; 157  : 		if(!form->html) RETURN_OK;

	mov	edx, DWORD PTR _form$[ebp]
	cmp	DWORD PTR [edx+232], 0
	jne	SHORT $L70389
	jmp	$eva_noerr$70390
$L70389:

; 158  : 
; 159  : 		/* Handle default image size */
; 160  : 		if(!*w && !*h)

	mov	eax, DWORD PTR _w$[ebp]
	movsx	ecx, BYTE PTR [eax]
	test	ecx, ecx
	jne	SHORT $L70391
	mov	edx, DWORD PTR _h$[ebp]
	movsx	eax, BYTE PTR [edx]
	test	eax, eax
	jne	SHORT $L70391

; 162  : 			w = ctrl->WIDTH;

	mov	ecx, DWORD PTR _ctrl$[ebp]
	mov	edx, DWORD PTR [ecx+308]
	mov	DWORD PTR _w$[ebp], edx

; 163  : 			h = ctrl->HEIGHT;

	mov	eax, DWORD PTR _ctrl$[ebp]
	mov	ecx, DWORD PTR [eax+312]
	mov	DWORD PTR _h$[ebp], ecx
$L70391:

; 165  : 		/* Output control header */
; 166  : 		if(ctrl_format_pos(cntxt, ctrl, 1)) STACK_ERROR;

	push	1
	mov	edx, DWORD PTR _ctrl$[ebp]
	push	edx
	mov	eax, DWORD PTR _cntxt$[ebp]
	push	eax
	call	_ctrl_format_pos
	add	esp, 12					; 0000000cH
	test	eax, eax
	je	SHORT $L70392
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 166		; 000000a6H
	jmp	$eva_err$70370
$L70392:

; 167  : 
; 168  : 		/* Handle empty value in view mode */
; 169  : 		if(form->step != HtmlEdit && !ctrl->val.nbrows && ctrl->LABEL_NOSEL) DYNBUF_ADD(form->html, ctrl->LABEL_NOSEL, 0, TO_HTML);

	mov	edx, DWORD PTR _form$[ebp]
	cmp	DWORD PTR [edx+176], 4
	je	SHORT $L70394
	mov	eax, DWORD PTR _ctrl$[ebp]
	cmp	DWORD PTR [eax+64], 0
	jne	SHORT $L70394
	mov	ecx, DWORD PTR _ctrl$[ebp]
	cmp	DWORD PTR [ecx+348], 0
	je	SHORT $L70394
	push	1
	push	OFFSET FLAT:_plain_to_html
	push	0
	mov	edx, DWORD PTR _ctrl$[ebp]
	mov	eax, DWORD PTR [edx+348]
	push	eax
	mov	ecx, DWORD PTR _form$[ebp]
	mov	edx, DWORD PTR [ecx+232]
	push	edx
	call	_dynbuf_add
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L70394
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29872], OFFSET FLAT:$SG70396
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 169		; 000000a9H
	jmp	$eva_err$70370
$L70394:

; 170  : 
; 171  : 		/* Add HTML code for each value */
; 172  : 		k = ctrl->val.nbrows + ((form->step == HtmlEdit && b_multiple) ? 1 : 0);

	mov	edx, DWORD PTR _form$[ebp]
	cmp	DWORD PTR [edx+176], 4
	jne	SHORT $L70467
	cmp	DWORD PTR _b_multiple$[ebp], 0
	je	SHORT $L70467
	mov	DWORD PTR -88+[ebp], 1
	jmp	SHORT $L70468
$L70467:
	mov	DWORD PTR -88+[ebp], 0
$L70468:
	mov	eax, DWORD PTR _ctrl$[ebp]
	mov	ecx, DWORD PTR [eax+64]
	add	ecx, DWORD PTR -88+[ebp]
	mov	DWORD PTR _k$[ebp], ecx

; 173  : 		for(i = 0; !i || i < k; i++)

	mov	DWORD PTR _i$[ebp], 0
	jmp	SHORT $L70397
$L70398:
	mov	edx, DWORD PTR _i$[ebp]
	add	edx, 1
	mov	DWORD PTR _i$[ebp], edx
$L70397:
	cmp	DWORD PTR _i$[ebp], 0
	je	SHORT $L70400
	mov	eax, DWORD PTR _i$[ebp]
	cmp	eax, DWORD PTR _k$[ebp]
	jae	$L70399
$L70400:

; 174  : 			if(form->step == HtmlEdit)

	mov	ecx, DWORD PTR _form$[ebp]
	cmp	DWORD PTR [ecx+176], 4
	jne	$L70401

; 176  : 				/* Edit mode : add image search button
; 177  : 				CTRL_CGINAMEBTN(&name, dyntab_cell(&ctrl->val, i, 0), add_sz_str("IMGSRCH"));
; 178  : 				if(put_html_button(cntxt, name->data, "Chercher", "_eva_search.gif", "_eva_search_s.gif",
; 179  : 					"Cliquez pour chercher des images", 0, 0)) STACK_ERROR; */
; 180  : 
; 181  : 				/* Separate multiple values with a line break */
; 182  : 				if(i) DYNBUF_ADD_STR(form->html, "<br>");

	cmp	DWORD PTR _i$[ebp], 0
	je	SHORT $L70404
	push	0
	push	0
	push	4
	push	OFFSET FLAT:$SG70405
	mov	edx, DWORD PTR _form$[ebp]
	mov	eax, DWORD PTR [edx+232]
	push	eax
	call	_dynbuf_add
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L70404
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29872], OFFSET FLAT:$SG70407
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 182		; 000000b6H
	jmp	$eva_err$70370
$L70404:

; 183  : 
; 184  : 				/* Output text input */
; 185  : 				CTRL_CGINAMEVAL(&name, i);

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
	je	SHORT $L70409
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 185		; 000000b9H
	jmp	$eva_err$70370
$L70409:
	mov	eax, DWORD PTR _ctrl$[ebp]
	mov	DWORD PTR [eax+196], 1

; 186  : 				if(put_html_text_input(cntxt, DYNBUF_VAL_SZ(name), DYNTAB_VAL_SZ(&ctrl->val, i,0), 0, 0, 1, ctrl->COLUMNS, 0) ||
; 187  : 					ctrl_put_hidden_old(cntxt, ctrl, i, name, NULL, 0))

	cmp	DWORD PTR _name$[ebp], 0
	je	SHORT $L70469
	mov	ecx, DWORD PTR _name$[ebp]
	mov	edx, DWORD PTR [ecx+4]
	mov	DWORD PTR -92+[ebp], edx
	jmp	SHORT $L70470
$L70469:
	mov	DWORD PTR -92+[ebp], 0
$L70470:
	cmp	DWORD PTR _name$[ebp], 0
	je	SHORT $L70471
	mov	eax, DWORD PTR _name$[ebp]
	add	eax, 8
	mov	DWORD PTR -96+[ebp], eax
	jmp	SHORT $L70472
$L70471:
	mov	DWORD PTR -96+[ebp], 0
$L70472:
	push	0
	mov	ecx, DWORD PTR _ctrl$[ebp]
	mov	edx, DWORD PTR [ecx+380]
	push	edx
	push	1
	push	0
	push	0
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
	mov	ecx, DWORD PTR -92+[ebp]
	push	ecx
	mov	edx, DWORD PTR -96+[ebp]
	push	edx
	mov	eax, DWORD PTR _cntxt$[ebp]
	push	eax
	call	_put_html_text_input
	add	esp, 40					; 00000028H
	test	eax, eax
	jne	SHORT $L70413
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
	je	SHORT $L70412
$L70413:

; 188  : 				STACK_ERROR;

	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 188		; 000000bcH
	jmp	$eva_err$70370
$L70412:

; 190  : 			else

	jmp	$L70428
$L70401:

; 192  : 				/* View mode : select defaut image if none */
; 193  : 				char *img = dyntab_val(&ctrl->val, i, 0);

	push	0
	mov	eax, DWORD PTR _i$[ebp]
	push	eax
	mov	ecx, DWORD PTR _ctrl$[ebp]
	add	ecx, 64					; 00000040H
	push	ecx
	call	_dyntab_val
	add	esp, 12					; 0000000cH
	mov	DWORD PTR _img$70415[ebp], eax

; 194  : 				if(!*img) img = imgdef;

	mov	edx, DWORD PTR _img$70415[ebp]
	movsx	eax, BYTE PTR [edx]
	test	eax, eax
	jne	SHORT $L70416
	mov	ecx, DWORD PTR _imgdef$[ebp]
	mov	DWORD PTR _img$70415[ebp], ecx
$L70416:

; 195  : 				if(!*img) continue;

	mov	edx, DWORD PTR _img$70415[ebp]
	movsx	eax, BYTE PTR [edx]
	test	eax, eax
	jne	SHORT $L70417
	jmp	$L70398
$L70417:

; 196  : 
; 197  : 				/* Separate multiple values with a space */
; 198  : 				if(i) DYNBUF_ADD_STR(form->html, " ");

	cmp	DWORD PTR _i$[ebp], 0
	je	SHORT $L70420
	push	0
	push	0
	push	1
	push	OFFSET FLAT:$SG70421
	mov	ecx, DWORD PTR _form$[ebp]
	mov	edx, DWORD PTR [ecx+232]
	push	edx
	call	_dynbuf_add
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L70420
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29872], OFFSET FLAT:$SG70423
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 198		; 000000c6H
	jmp	$eva_err$70370
$L70420:

; 199  : 
; 200  : 				/* Add image */
; 201  : 				if(put_html_image_dir(cntxt, NULL, img == imgdef ? NULL : dir, img, ctrl->NOTES, w, h, 0, 0, NULL, NULL)) STACK_ERROR;

	push	0
	push	0
	push	0
	push	0
	mov	edx, DWORD PTR _h$[ebp]
	push	edx
	mov	eax, DWORD PTR _w$[ebp]
	push	eax
	mov	ecx, DWORD PTR _ctrl$[ebp]
	mov	edx, DWORD PTR [ecx+288]
	push	edx
	mov	eax, DWORD PTR _img$70415[ebp]
	push	eax
	mov	ecx, DWORD PTR _img$70415[ebp]
	sub	ecx, DWORD PTR _imgdef$[ebp]
	neg	ecx
	sbb	ecx, ecx
	and	ecx, DWORD PTR _dir$[ebp]
	push	ecx
	push	0
	mov	edx, DWORD PTR _cntxt$[ebp]
	push	edx
	call	_put_html_image_dir
	add	esp, 44					; 0000002cH
	test	eax, eax
	je	SHORT $L70428
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 201		; 000000c9H
	jmp	SHORT $eva_err$70370
$L70428:

; 202  : 			}

	jmp	$L70398
$L70399:

; 203  : 
; 204  : 		/* Output control footer */
; 205  : 		if(ctrl_format_pos(cntxt, ctrl, 0)) STACK_ERROR;

	push	0
	mov	ecx, DWORD PTR _ctrl$[ebp]
	push	ecx
	mov	edx, DWORD PTR _cntxt$[ebp]
	push	edx
	call	_ctrl_format_pos
	add	esp, 12					; 0000000cH
	test	eax, eax
	je	SHORT $L70430
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 205		; 000000cdH
	jmp	SHORT $eva_err$70370
$L70430:
$eva_noerr$70390:

; 210  : 
; 211  : 	RETURN_OK_CLEANUP;

	push	0
	push	OFFSET FLAT:$SG70431
	push	OFFSET FLAT:$SG70432
	mov	ecx, DWORD PTR _cntxt$[ebp]
	push	ecx
	call	_err_clear
	add	esp, 16					; 00000010H
$eva_err$70370:
	mov	edx, DWORD PTR _cntxt$[ebp]
	cmp	DWORD PTR [edx+29872], 0
	je	SHORT $L70433
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	ecx, DWORD PTR [eax+29900]
	push	ecx
	push	OFFSET FLAT:$SG70434
	push	OFFSET FLAT:$SG70435
	mov	edx, DWORD PTR _cntxt$[ebp]
	push	edx
	call	_err_add_context
	add	esp, 16					; 00000010H
$L70433:
	mov	eax, DWORD PTR _name$[ebp]
	push	eax
	call	_mem_free
	add	esp, 4
	mov	DWORD PTR _name$[ebp], 0
	mov	ecx, DWORD PTR _cntxt$[ebp]
	xor	eax, eax
	cmp	DWORD PTR [ecx+29872], 0
	setne	al

; 212  : }

	mov	esp, ebp
	pop	ebp
	ret	0
$L70473:
	DD	$L70359
	DD	$L70430
	DD	$L70430
	DD	$L70430
	DD	$L70385
	DD	$L70430
	DD	$L70385
	DD	$L70385
_ctrl_add_input_image ENDP
_TEXT	ENDS
END
