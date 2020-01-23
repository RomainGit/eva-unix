	TITLE	D:\Travail\ABI\EVA\V4.0\CGI\Brunix-2016\ctrl_attr.c
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
PUBLIC	_ctrl_set_format_attr
EXTRN	_strtoul:NEAR
EXTRN	_memcpy:NEAR
EXTRN	_err_add_context:NEAR
EXTRN	_err_clear:NEAR
EXTRN	_dyntab_field_val:NEAR
_BSS	SEGMENT
$SG70213 DB	01H DUP (?)
	ALIGN	4

$SG70215 DB	01H DUP (?)
	ALIGN	4

$SG70218 DB	01H DUP (?)
	ALIGN	4

$SG70221 DB	01H DUP (?)
	ALIGN	4

$SG70224 DB	01H DUP (?)
	ALIGN	4

$SG70227 DB	01H DUP (?)
	ALIGN	4

$SG70229 DB	01H DUP (?)
	ALIGN	4

$SG70231 DB	01H DUP (?)
	ALIGN	4

$SG70233 DB	01H DUP (?)
	ALIGN	4

$SG70235 DB	01H DUP (?)
	ALIGN	4

$SG70237 DB	01H DUP (?)
	ALIGN	4

$SG70239 DB	01H DUP (?)
	ALIGN	4

$SG70243 DB	01H DUP (?)
	ALIGN	4

$SG70247 DB	01H DUP (?)
	ALIGN	4

$SG70251 DB	01H DUP (?)
	ALIGN	4

$SG70255 DB	01H DUP (?)
	ALIGN	4

$SG70259 DB	01H DUP (?)
	ALIGN	4

$SG70263 DB	01H DUP (?)
	ALIGN	4

$SG70267 DB	01H DUP (?)
	ALIGN	4

$SG70271 DB	01H DUP (?)
	ALIGN	4

$SG70273 DB	01H DUP (?)
	ALIGN	4

$SG70277 DB	01H DUP (?)
	ALIGN	4

$SG70281 DB	01H DUP (?)
	ALIGN	4

$SG70283 DB	01H DUP (?)
	ALIGN	4

$SG70285 DB	01H DUP (?)
	ALIGN	4

$SG70287 DB	01H DUP (?)
	ALIGN	4

$SG70289 DB	01H DUP (?)
	ALIGN	4

$SG70291 DB	01H DUP (?)
	ALIGN	4

$SG70294 DB	01H DUP (?)
	ALIGN	4

$SG70297 DB	01H DUP (?)
	ALIGN	4

$SG70299 DB	01H DUP (?)
	ALIGN	4

$SG70303 DB	01H DUP (?)
	ALIGN	4

$SG70307 DB	01H DUP (?)
	ALIGN	4

$SG70311 DB	01H DUP (?)
	ALIGN	4

$SG70315 DB	01H DUP (?)
	ALIGN	4

$SG70319 DB	01H DUP (?)
	ALIGN	4

$SG70323 DB	01H DUP (?)
	ALIGN	4

$SG70327 DB	01H DUP (?)
	ALIGN	4

$SG70331 DB	01H DUP (?)
	ALIGN	4

$SG70333 DB	01H DUP (?)
	ALIGN	4

$SG70335 DB	01H DUP (?)
	ALIGN	4

$SG70337 DB	01H DUP (?)
	ALIGN	4

$SG70339 DB	01H DUP (?)
	ALIGN	4

$SG70342 DB	01H DUP (?)
_BSS	ENDS
_DATA	SEGMENT
$SG70212 DB	'_EVA_LABELPOS', 00H
	ORG $+2
$SG70214 DB	'_EVA_POSITION', 00H
	ORG $+2
$SG70217 DB	'_EVA_COLSPAN', 00H
	ORG $+3
$SG70220 DB	'_EVA_ROWSPAN', 00H
	ORG $+3
$SG70223 DB	'_EVA_LINES', 00H
	ORG $+1
$SG70226 DB	'_EVA_COLUMNS', 00H
	ORG $+3
$SG70228 DB	'_EVA_ALIGN', 00H
	ORG $+1
$SG70230 DB	'_EVA_VALIGN', 00H
$SG70232 DB	'_EVA_WIDTH', 00H
	ORG $+1
$SG70234 DB	'_EVA_HEIGHT', 00H
$SG70236 DB	'_EVA_NOBR', 00H
	ORG $+2
$SG70238 DB	'_EVA_BGCOLOR', 00H
	ORG $+3
$SG70242 DB	'_EVA_BACKGROUND', 00H
$SG70246 DB	'_EVA_FONTFACE', 00H
	ORG $+2
$SG70250 DB	'_EVA_FONTSIZE', 00H
	ORG $+2
$SG70254 DB	'_EVA_FONTCOLOR', 00H
	ORG $+1
$SG70258 DB	'_EVA_BOLD', 00H
	ORG $+2
$SG70262 DB	'_EVA_ITALIC', 00H
$SG70266 DB	'_EVA_UNDERLINE', 00H
	ORG $+1
$SG70270 DB	'_EVA_CTRL_STYLE', 00H
$SG70272 DB	'_EVA_CELL_STYLE', 00H
$SG70276 DB	'_EVA_LABEL_STYLE', 00H
	ORG $+3
$SG70280 DB	'_EVA_TABLE_STYLE', 00H
	ORG $+3
$SG70282 DB	'_EVA_LABEL', 00H
	ORG $+1
$SG70284 DB	'_EVA_LABELALIGN', 00H
$SG70286 DB	'_EVA_LABELVALIGN', 00H
	ORG $+3
$SG70288 DB	'_EVA_LABELWIDTH', 00H
$SG70290 DB	'_EVA_LABELHEIGHT', 00H
	ORG $+3
$SG70293 DB	'_EVA_LABELCOLSPAN', 00H
	ORG $+2
$SG70296 DB	'_EVA_LABELROWSPAN', 00H
	ORG $+2
$SG70298 DB	'_EVA_LABELBGCOLOR', 00H
	ORG $+2
$SG70302 DB	'_EVA_LABELBACKGROUND', 00H
	ORG $+3
$SG70306 DB	'_EVA_LABELFONTFACE', 00H
	ORG $+1
$SG70310 DB	'_EVA_LABELFONTSIZE', 00H
	ORG $+1
$SG70314 DB	'_EVA_LABELFONTCOLOR', 00H
$SG70318 DB	'_EVA_LABELBOLD', 00H
	ORG $+1
$SG70322 DB	'_EVA_LABELITALIC', 00H
	ORG $+3
$SG70326 DB	'_EVA_LABELUNDERLINE', 00H
$SG70330 DB	'_EVA_TABLEWIDTH', 00H
$SG70332 DB	'_EVA_TABLEHEIGHT', 00H
	ORG $+3
$SG70334 DB	'_EVA_TABLERULES', 00H
$SG70336 DB	'_EVA_TABLEBGCOLOR', 00H
	ORG $+2
$SG70338 DB	'_EVA_TABLEBACKGROUND', 00H
	ORG $+3
$SG70341 DB	'_EVA_BORDER', 00H
$SG70344 DB	'D:\Travail\ABI\EVA\V4.0\CGI\Brunix-2016\ctrl_attr.c', 00H
$SG70345 DB	'ctrl_set_format_attr', 00H
	ORG $+3
$SG70347 DB	'D:\Travail\ABI\EVA\V4.0\CGI\Brunix-2016\ctrl_attr.c', 00H
$SG70348 DB	'ctrl_set_format_attr', 00H
_DATA	ENDS
_TEXT	SEGMENT
_cntxt$ = 8
_ctrl$ = 12
_ctrl_set_format_attr PROC NEAR

; 25   : ){

	push	ebp
	mov	ebp, esp
	sub	esp, 176				; 000000b0H

; 26   : 	/* Get server format defaults if applicable */
; 27   : 	if(!cntxt->srvfmt.attr.nbrows && cntxt->cnf_data.nbrows)

	mov	eax, DWORD PTR _cntxt$[ebp]
	cmp	DWORD PTR [eax+269792], 0
	jne	SHORT $L70210
	mov	ecx, DWORD PTR _cntxt$[ebp]
	cmp	DWORD PTR [ecx+29360], 0
	je	SHORT $L70210

; 29   : 		memcpy(&cntxt->srvfmt.attr, &cntxt->cnf_data, sizeof(cntxt->srvfmt.attr));

	push	20					; 00000014H
	mov	edx, DWORD PTR _cntxt$[ebp]
	add	edx, 29360				; 000072b0H
	push	edx
	mov	eax, DWORD PTR _cntxt$[ebp]
	add	eax, 269792				; 00041de0H
	push	eax
	call	_memcpy
	add	esp, 12					; 0000000cH

; 30   : 		if(ctrl_set_format_attr(cntxt, &cntxt->srvfmt)) STACK_ERROR;

	mov	ecx, DWORD PTR _cntxt$[ebp]
	add	ecx, 269748				; 00041db4H
	push	ecx
	mov	edx, DWORD PTR _cntxt$[ebp]
	push	edx
	call	_ctrl_set_format_attr
	add	esp, 8
	test	eax, eax
	je	SHORT $L70210
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 30		; 0000001eH
	jmp	$eva_err$70211
$L70210:

; 32   : 
; 33   : 	/* Get control format */
; 34   : 	CTRL_ATTR_GET(LABELPOS);

	cmp	DWORD PTR _ctrl$[ebp], 0
	je	SHORT $L70417
	push	0
	push	-1
	push	OFFSET FLAT:$SG70212
	mov	ecx, DWORD PTR _ctrl$[ebp]
	add	ecx, 44					; 0000002cH
	push	ecx
	call	_dyntab_field_val
	add	esp, 16					; 00000010H
	mov	DWORD PTR -4+[ebp], eax
	jmp	SHORT $L70418
$L70417:
	mov	DWORD PTR -4+[ebp], OFFSET FLAT:$SG70213
$L70418:
	mov	edx, DWORD PTR _ctrl$[ebp]
	mov	eax, DWORD PTR -4+[ebp]
	mov	DWORD PTR [edx+292], eax

; 35   : 	CTRL_ATTR_GET(POSITION);

	cmp	DWORD PTR _ctrl$[ebp], 0
	je	SHORT $L70419
	push	0
	push	-1
	push	OFFSET FLAT:$SG70214
	mov	ecx, DWORD PTR _ctrl$[ebp]
	add	ecx, 44					; 0000002cH
	push	ecx
	call	_dyntab_field_val
	add	esp, 16					; 00000010H
	mov	DWORD PTR -8+[ebp], eax
	jmp	SHORT $L70420
$L70419:
	mov	DWORD PTR -8+[ebp], OFFSET FLAT:$SG70215
$L70420:
	mov	edx, DWORD PTR _ctrl$[ebp]
	mov	eax, DWORD PTR -8+[ebp]
	mov	DWORD PTR [edx+296], eax

; 36   : 	ctrl->COLSPAN = strtoul(CTRL_ATTR_VAL(COLSPAN), NULL, 10);

	cmp	DWORD PTR _ctrl$[ebp], 0
	je	SHORT $L70421
	push	0
	push	-1
	push	OFFSET FLAT:$SG70217
	mov	ecx, DWORD PTR _ctrl$[ebp]
	add	ecx, 44					; 0000002cH
	push	ecx
	call	_dyntab_field_val
	add	esp, 16					; 00000010H
	mov	DWORD PTR -12+[ebp], eax
	jmp	SHORT $L70422
$L70421:
	mov	DWORD PTR -12+[ebp], OFFSET FLAT:$SG70218
$L70422:
	push	10					; 0000000aH
	push	0
	mov	edx, DWORD PTR -12+[ebp]
	push	edx
	call	_strtoul
	add	esp, 12					; 0000000cH
	mov	ecx, DWORD PTR _ctrl$[ebp]
	mov	DWORD PTR [ecx+328], eax

; 37   : 	ctrl->ROWSPAN = strtoul(CTRL_ATTR_VAL(ROWSPAN), NULL, 10);

	cmp	DWORD PTR _ctrl$[ebp], 0
	je	SHORT $L70423
	push	0
	push	-1
	push	OFFSET FLAT:$SG70220
	mov	edx, DWORD PTR _ctrl$[ebp]
	add	edx, 44					; 0000002cH
	push	edx
	call	_dyntab_field_val
	add	esp, 16					; 00000010H
	mov	DWORD PTR -16+[ebp], eax
	jmp	SHORT $L70424
$L70423:
	mov	DWORD PTR -16+[ebp], OFFSET FLAT:$SG70221
$L70424:
	push	10					; 0000000aH
	push	0
	mov	eax, DWORD PTR -16+[ebp]
	push	eax
	call	_strtoul
	add	esp, 12					; 0000000cH
	mov	ecx, DWORD PTR _ctrl$[ebp]
	mov	DWORD PTR [ecx+332], eax

; 38   : 	ctrl->LINES = strtoul(CTRL_ATTR_VAL(LINES), NULL, 10);

	cmp	DWORD PTR _ctrl$[ebp], 0
	je	SHORT $L70425
	push	0
	push	-1
	push	OFFSET FLAT:$SG70223
	mov	edx, DWORD PTR _ctrl$[ebp]
	add	edx, 44					; 0000002cH
	push	edx
	call	_dyntab_field_val
	add	esp, 16					; 00000010H
	mov	DWORD PTR -20+[ebp], eax
	jmp	SHORT $L70426
$L70425:
	mov	DWORD PTR -20+[ebp], OFFSET FLAT:$SG70224
$L70426:
	push	10					; 0000000aH
	push	0
	mov	eax, DWORD PTR -20+[ebp]
	push	eax
	call	_strtoul
	add	esp, 12					; 0000000cH
	mov	ecx, DWORD PTR _ctrl$[ebp]
	mov	DWORD PTR [ecx+376], eax

; 39   : 	ctrl->COLUMNS = strtoul(CTRL_ATTR_VAL(COLUMNS), NULL, 10);

	cmp	DWORD PTR _ctrl$[ebp], 0
	je	SHORT $L70427
	push	0
	push	-1
	push	OFFSET FLAT:$SG70226
	mov	edx, DWORD PTR _ctrl$[ebp]
	add	edx, 44					; 0000002cH
	push	edx
	call	_dyntab_field_val
	add	esp, 16					; 00000010H
	mov	DWORD PTR -24+[ebp], eax
	jmp	SHORT $L70428
$L70427:
	mov	DWORD PTR -24+[ebp], OFFSET FLAT:$SG70227
$L70428:
	push	10					; 0000000aH
	push	0
	mov	eax, DWORD PTR -24+[ebp]
	push	eax
	call	_strtoul
	add	esp, 12					; 0000000cH
	mov	ecx, DWORD PTR _ctrl$[ebp]
	mov	DWORD PTR [ecx+380], eax

; 40   : 	
; 41   : 	/* Get cell modifiers */
; 42   : 	CTRL_ATTR_GET(ALIGN);

	cmp	DWORD PTR _ctrl$[ebp], 0
	je	SHORT $L70429
	push	0
	push	-1
	push	OFFSET FLAT:$SG70228
	mov	edx, DWORD PTR _ctrl$[ebp]
	add	edx, 44					; 0000002cH
	push	edx
	call	_dyntab_field_val
	add	esp, 16					; 00000010H
	mov	DWORD PTR -28+[ebp], eax
	jmp	SHORT $L70430
$L70429:
	mov	DWORD PTR -28+[ebp], OFFSET FLAT:$SG70229
$L70430:
	mov	eax, DWORD PTR _ctrl$[ebp]
	mov	ecx, DWORD PTR -28+[ebp]
	mov	DWORD PTR [eax+300], ecx

; 43   : 	CTRL_ATTR_GET(VALIGN);

	cmp	DWORD PTR _ctrl$[ebp], 0
	je	SHORT $L70431
	push	0
	push	-1
	push	OFFSET FLAT:$SG70230
	mov	edx, DWORD PTR _ctrl$[ebp]
	add	edx, 44					; 0000002cH
	push	edx
	call	_dyntab_field_val
	add	esp, 16					; 00000010H
	mov	DWORD PTR -32+[ebp], eax
	jmp	SHORT $L70432
$L70431:
	mov	DWORD PTR -32+[ebp], OFFSET FLAT:$SG70231
$L70432:
	mov	eax, DWORD PTR _ctrl$[ebp]
	mov	ecx, DWORD PTR -32+[ebp]
	mov	DWORD PTR [eax+304], ecx

; 44   : 	CTRL_ATTR_GET(WIDTH);

	cmp	DWORD PTR _ctrl$[ebp], 0
	je	SHORT $L70433
	push	0
	push	-1
	push	OFFSET FLAT:$SG70232
	mov	edx, DWORD PTR _ctrl$[ebp]
	add	edx, 44					; 0000002cH
	push	edx
	call	_dyntab_field_val
	add	esp, 16					; 00000010H
	mov	DWORD PTR -36+[ebp], eax
	jmp	SHORT $L70434
$L70433:
	mov	DWORD PTR -36+[ebp], OFFSET FLAT:$SG70233
$L70434:
	mov	eax, DWORD PTR _ctrl$[ebp]
	mov	ecx, DWORD PTR -36+[ebp]
	mov	DWORD PTR [eax+308], ecx

; 45   : 	CTRL_ATTR_GET(HEIGHT);

	cmp	DWORD PTR _ctrl$[ebp], 0
	je	SHORT $L70435
	push	0
	push	-1
	push	OFFSET FLAT:$SG70234
	mov	edx, DWORD PTR _ctrl$[ebp]
	add	edx, 44					; 0000002cH
	push	edx
	call	_dyntab_field_val
	add	esp, 16					; 00000010H
	mov	DWORD PTR -40+[ebp], eax
	jmp	SHORT $L70436
$L70435:
	mov	DWORD PTR -40+[ebp], OFFSET FLAT:$SG70235
$L70436:
	mov	eax, DWORD PTR _ctrl$[ebp]
	mov	ecx, DWORD PTR -40+[ebp]
	mov	DWORD PTR [eax+312], ecx

; 46   : 	CTRL_ATTR_GET(NOBR);

	cmp	DWORD PTR _ctrl$[ebp], 0
	je	SHORT $L70437
	push	0
	push	-1
	push	OFFSET FLAT:$SG70236
	mov	edx, DWORD PTR _ctrl$[ebp]
	add	edx, 44					; 0000002cH
	push	edx
	call	_dyntab_field_val
	add	esp, 16					; 00000010H
	mov	DWORD PTR -44+[ebp], eax
	jmp	SHORT $L70438
$L70437:
	mov	DWORD PTR -44+[ebp], OFFSET FLAT:$SG70237
$L70438:
	mov	eax, DWORD PTR _ctrl$[ebp]
	mov	ecx, DWORD PTR -44+[ebp]
	mov	DWORD PTR [eax+316], ecx

; 47   : 	CTRL_ATTR_GETFORM(BGCOLOR);

	cmp	DWORD PTR _ctrl$[ebp], 0
	je	SHORT $L70439
	push	0
	push	-1
	push	OFFSET FLAT:$SG70238
	mov	edx, DWORD PTR _ctrl$[ebp]
	add	edx, 44					; 0000002cH
	push	edx
	call	_dyntab_field_val
	add	esp, 16					; 00000010H
	mov	DWORD PTR -48+[ebp], eax
	jmp	SHORT $L70440
$L70439:
	mov	DWORD PTR -48+[ebp], OFFSET FLAT:$SG70239
$L70440:
	mov	eax, DWORD PTR _ctrl$[ebp]
	mov	ecx, DWORD PTR -48+[ebp]
	mov	DWORD PTR [eax+320], ecx
	mov	edx, DWORD PTR _ctrl$[ebp]
	mov	eax, DWORD PTR [edx+320]
	movsx	ecx, BYTE PTR [eax]
	test	ecx, ecx
	jne	SHORT $L70240
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	eax, DWORD PTR [edx+80]
	mov	ecx, DWORD PTR [eax]
	cmp	DWORD PTR [ecx+320], 0
	je	SHORT $L70240
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	eax, DWORD PTR [edx+80]
	mov	ecx, DWORD PTR [eax]
	mov	edx, DWORD PTR _ctrl$[ebp]
	mov	eax, DWORD PTR [ecx+320]
	mov	DWORD PTR [edx+320], eax
$L70240:
	mov	ecx, DWORD PTR _ctrl$[ebp]
	mov	edx, DWORD PTR [ecx+320]
	movsx	eax, BYTE PTR [edx]
	test	eax, eax
	jne	SHORT $L70241
	mov	ecx, DWORD PTR _cntxt$[ebp]
	add	ecx, 269748				; 00041db4H
	cmp	DWORD PTR _ctrl$[ebp], ecx
	je	SHORT $L70241
	mov	edx, DWORD PTR _cntxt$[ebp]
	cmp	DWORD PTR [edx+270068], 0
	je	SHORT $L70241
	mov	eax, DWORD PTR _ctrl$[ebp]
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	edx, DWORD PTR [ecx+270068]
	mov	DWORD PTR [eax+320], edx
$L70241:

; 48   : 	CTRL_ATTR_GETFORM(BACKGROUND);

	cmp	DWORD PTR _ctrl$[ebp], 0
	je	SHORT $L70441
	push	0
	push	-1
	push	OFFSET FLAT:$SG70242
	mov	eax, DWORD PTR _ctrl$[ebp]
	add	eax, 44					; 0000002cH
	push	eax
	call	_dyntab_field_val
	add	esp, 16					; 00000010H
	mov	DWORD PTR -52+[ebp], eax
	jmp	SHORT $L70442
$L70441:
	mov	DWORD PTR -52+[ebp], OFFSET FLAT:$SG70243
$L70442:
	mov	ecx, DWORD PTR _ctrl$[ebp]
	mov	edx, DWORD PTR -52+[ebp]
	mov	DWORD PTR [ecx+324], edx
	mov	eax, DWORD PTR _ctrl$[ebp]
	mov	ecx, DWORD PTR [eax+324]
	movsx	edx, BYTE PTR [ecx]
	test	edx, edx
	jne	SHORT $L70244
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	ecx, DWORD PTR [eax+80]
	mov	edx, DWORD PTR [ecx]
	cmp	DWORD PTR [edx+324], 0
	je	SHORT $L70244
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	ecx, DWORD PTR [eax+80]
	mov	edx, DWORD PTR [ecx]
	mov	eax, DWORD PTR _ctrl$[ebp]
	mov	ecx, DWORD PTR [edx+324]
	mov	DWORD PTR [eax+324], ecx
$L70244:
	mov	edx, DWORD PTR _ctrl$[ebp]
	mov	eax, DWORD PTR [edx+324]
	movsx	ecx, BYTE PTR [eax]
	test	ecx, ecx
	jne	SHORT $L70245
	mov	edx, DWORD PTR _cntxt$[ebp]
	add	edx, 269748				; 00041db4H
	cmp	DWORD PTR _ctrl$[ebp], edx
	je	SHORT $L70245
	mov	eax, DWORD PTR _cntxt$[ebp]
	cmp	DWORD PTR [eax+270072], 0
	je	SHORT $L70245
	mov	ecx, DWORD PTR _ctrl$[ebp]
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	eax, DWORD PTR [edx+270072]
	mov	DWORD PTR [ecx+324], eax
$L70245:

; 49   : 
; 50   : 	/* Get font modifiers */
; 51   : 	CTRL_ATTR_GETFORM(FONTFACE);

	cmp	DWORD PTR _ctrl$[ebp], 0
	je	SHORT $L70443
	push	0
	push	-1
	push	OFFSET FLAT:$SG70246
	mov	ecx, DWORD PTR _ctrl$[ebp]
	add	ecx, 44					; 0000002cH
	push	ecx
	call	_dyntab_field_val
	add	esp, 16					; 00000010H
	mov	DWORD PTR -56+[ebp], eax
	jmp	SHORT $L70444
$L70443:
	mov	DWORD PTR -56+[ebp], OFFSET FLAT:$SG70247
$L70444:
	mov	edx, DWORD PTR _ctrl$[ebp]
	mov	eax, DWORD PTR -56+[ebp]
	mov	DWORD PTR [edx+352], eax
	mov	ecx, DWORD PTR _ctrl$[ebp]
	mov	edx, DWORD PTR [ecx+352]
	movsx	eax, BYTE PTR [edx]
	test	eax, eax
	jne	SHORT $L70248
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	edx, DWORD PTR [ecx+80]
	mov	eax, DWORD PTR [edx]
	cmp	DWORD PTR [eax+352], 0
	je	SHORT $L70248
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	edx, DWORD PTR [ecx+80]
	mov	eax, DWORD PTR [edx]
	mov	ecx, DWORD PTR _ctrl$[ebp]
	mov	edx, DWORD PTR [eax+352]
	mov	DWORD PTR [ecx+352], edx
$L70248:
	mov	eax, DWORD PTR _ctrl$[ebp]
	mov	ecx, DWORD PTR [eax+352]
	movsx	edx, BYTE PTR [ecx]
	test	edx, edx
	jne	SHORT $L70249
	mov	eax, DWORD PTR _cntxt$[ebp]
	add	eax, 269748				; 00041db4H
	cmp	DWORD PTR _ctrl$[ebp], eax
	je	SHORT $L70249
	mov	ecx, DWORD PTR _cntxt$[ebp]
	cmp	DWORD PTR [ecx+270100], 0
	je	SHORT $L70249
	mov	edx, DWORD PTR _ctrl$[ebp]
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	ecx, DWORD PTR [eax+270100]
	mov	DWORD PTR [edx+352], ecx
$L70249:

; 52   : 	CTRL_ATTR_GETFORM(FONTSIZE);

	cmp	DWORD PTR _ctrl$[ebp], 0
	je	SHORT $L70445
	push	0
	push	-1
	push	OFFSET FLAT:$SG70250
	mov	edx, DWORD PTR _ctrl$[ebp]
	add	edx, 44					; 0000002cH
	push	edx
	call	_dyntab_field_val
	add	esp, 16					; 00000010H
	mov	DWORD PTR -60+[ebp], eax
	jmp	SHORT $L70446
$L70445:
	mov	DWORD PTR -60+[ebp], OFFSET FLAT:$SG70251
$L70446:
	mov	eax, DWORD PTR _ctrl$[ebp]
	mov	ecx, DWORD PTR -60+[ebp]
	mov	DWORD PTR [eax+356], ecx
	mov	edx, DWORD PTR _ctrl$[ebp]
	mov	eax, DWORD PTR [edx+356]
	movsx	ecx, BYTE PTR [eax]
	test	ecx, ecx
	jne	SHORT $L70252
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	eax, DWORD PTR [edx+80]
	mov	ecx, DWORD PTR [eax]
	cmp	DWORD PTR [ecx+356], 0
	je	SHORT $L70252
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	eax, DWORD PTR [edx+80]
	mov	ecx, DWORD PTR [eax]
	mov	edx, DWORD PTR _ctrl$[ebp]
	mov	eax, DWORD PTR [ecx+356]
	mov	DWORD PTR [edx+356], eax
$L70252:
	mov	ecx, DWORD PTR _ctrl$[ebp]
	mov	edx, DWORD PTR [ecx+356]
	movsx	eax, BYTE PTR [edx]
	test	eax, eax
	jne	SHORT $L70253
	mov	ecx, DWORD PTR _cntxt$[ebp]
	add	ecx, 269748				; 00041db4H
	cmp	DWORD PTR _ctrl$[ebp], ecx
	je	SHORT $L70253
	mov	edx, DWORD PTR _cntxt$[ebp]
	cmp	DWORD PTR [edx+270104], 0
	je	SHORT $L70253
	mov	eax, DWORD PTR _ctrl$[ebp]
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	edx, DWORD PTR [ecx+270104]
	mov	DWORD PTR [eax+356], edx
$L70253:

; 53   : 	CTRL_ATTR_GETFORM(FONTCOLOR);

	cmp	DWORD PTR _ctrl$[ebp], 0
	je	SHORT $L70447
	push	0
	push	-1
	push	OFFSET FLAT:$SG70254
	mov	eax, DWORD PTR _ctrl$[ebp]
	add	eax, 44					; 0000002cH
	push	eax
	call	_dyntab_field_val
	add	esp, 16					; 00000010H
	mov	DWORD PTR -64+[ebp], eax
	jmp	SHORT $L70448
$L70447:
	mov	DWORD PTR -64+[ebp], OFFSET FLAT:$SG70255
$L70448:
	mov	ecx, DWORD PTR _ctrl$[ebp]
	mov	edx, DWORD PTR -64+[ebp]
	mov	DWORD PTR [ecx+360], edx
	mov	eax, DWORD PTR _ctrl$[ebp]
	mov	ecx, DWORD PTR [eax+360]
	movsx	edx, BYTE PTR [ecx]
	test	edx, edx
	jne	SHORT $L70256
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	ecx, DWORD PTR [eax+80]
	mov	edx, DWORD PTR [ecx]
	cmp	DWORD PTR [edx+360], 0
	je	SHORT $L70256
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	ecx, DWORD PTR [eax+80]
	mov	edx, DWORD PTR [ecx]
	mov	eax, DWORD PTR _ctrl$[ebp]
	mov	ecx, DWORD PTR [edx+360]
	mov	DWORD PTR [eax+360], ecx
$L70256:
	mov	edx, DWORD PTR _ctrl$[ebp]
	mov	eax, DWORD PTR [edx+360]
	movsx	ecx, BYTE PTR [eax]
	test	ecx, ecx
	jne	SHORT $L70257
	mov	edx, DWORD PTR _cntxt$[ebp]
	add	edx, 269748				; 00041db4H
	cmp	DWORD PTR _ctrl$[ebp], edx
	je	SHORT $L70257
	mov	eax, DWORD PTR _cntxt$[ebp]
	cmp	DWORD PTR [eax+270108], 0
	je	SHORT $L70257
	mov	ecx, DWORD PTR _ctrl$[ebp]
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	eax, DWORD PTR [edx+270108]
	mov	DWORD PTR [ecx+360], eax
$L70257:

; 54   : 	CTRL_ATTR_GETFORM(BOLD);

	cmp	DWORD PTR _ctrl$[ebp], 0
	je	SHORT $L70449
	push	0
	push	-1
	push	OFFSET FLAT:$SG70258
	mov	ecx, DWORD PTR _ctrl$[ebp]
	add	ecx, 44					; 0000002cH
	push	ecx
	call	_dyntab_field_val
	add	esp, 16					; 00000010H
	mov	DWORD PTR -68+[ebp], eax
	jmp	SHORT $L70450
$L70449:
	mov	DWORD PTR -68+[ebp], OFFSET FLAT:$SG70259
$L70450:
	mov	edx, DWORD PTR _ctrl$[ebp]
	mov	eax, DWORD PTR -68+[ebp]
	mov	DWORD PTR [edx+364], eax
	mov	ecx, DWORD PTR _ctrl$[ebp]
	mov	edx, DWORD PTR [ecx+364]
	movsx	eax, BYTE PTR [edx]
	test	eax, eax
	jne	SHORT $L70260
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	edx, DWORD PTR [ecx+80]
	mov	eax, DWORD PTR [edx]
	cmp	DWORD PTR [eax+364], 0
	je	SHORT $L70260
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	edx, DWORD PTR [ecx+80]
	mov	eax, DWORD PTR [edx]
	mov	ecx, DWORD PTR _ctrl$[ebp]
	mov	edx, DWORD PTR [eax+364]
	mov	DWORD PTR [ecx+364], edx
$L70260:
	mov	eax, DWORD PTR _ctrl$[ebp]
	mov	ecx, DWORD PTR [eax+364]
	movsx	edx, BYTE PTR [ecx]
	test	edx, edx
	jne	SHORT $L70261
	mov	eax, DWORD PTR _cntxt$[ebp]
	add	eax, 269748				; 00041db4H
	cmp	DWORD PTR _ctrl$[ebp], eax
	je	SHORT $L70261
	mov	ecx, DWORD PTR _cntxt$[ebp]
	cmp	DWORD PTR [ecx+270112], 0
	je	SHORT $L70261
	mov	edx, DWORD PTR _ctrl$[ebp]
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	ecx, DWORD PTR [eax+270112]
	mov	DWORD PTR [edx+364], ecx
$L70261:

; 55   : 	CTRL_ATTR_GETFORM(ITALIC);

	cmp	DWORD PTR _ctrl$[ebp], 0
	je	SHORT $L70451
	push	0
	push	-1
	push	OFFSET FLAT:$SG70262
	mov	edx, DWORD PTR _ctrl$[ebp]
	add	edx, 44					; 0000002cH
	push	edx
	call	_dyntab_field_val
	add	esp, 16					; 00000010H
	mov	DWORD PTR -72+[ebp], eax
	jmp	SHORT $L70452
$L70451:
	mov	DWORD PTR -72+[ebp], OFFSET FLAT:$SG70263
$L70452:
	mov	eax, DWORD PTR _ctrl$[ebp]
	mov	ecx, DWORD PTR -72+[ebp]
	mov	DWORD PTR [eax+368], ecx
	mov	edx, DWORD PTR _ctrl$[ebp]
	mov	eax, DWORD PTR [edx+368]
	movsx	ecx, BYTE PTR [eax]
	test	ecx, ecx
	jne	SHORT $L70264
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	eax, DWORD PTR [edx+80]
	mov	ecx, DWORD PTR [eax]
	cmp	DWORD PTR [ecx+368], 0
	je	SHORT $L70264
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	eax, DWORD PTR [edx+80]
	mov	ecx, DWORD PTR [eax]
	mov	edx, DWORD PTR _ctrl$[ebp]
	mov	eax, DWORD PTR [ecx+368]
	mov	DWORD PTR [edx+368], eax
$L70264:
	mov	ecx, DWORD PTR _ctrl$[ebp]
	mov	edx, DWORD PTR [ecx+368]
	movsx	eax, BYTE PTR [edx]
	test	eax, eax
	jne	SHORT $L70265
	mov	ecx, DWORD PTR _cntxt$[ebp]
	add	ecx, 269748				; 00041db4H
	cmp	DWORD PTR _ctrl$[ebp], ecx
	je	SHORT $L70265
	mov	edx, DWORD PTR _cntxt$[ebp]
	cmp	DWORD PTR [edx+270116], 0
	je	SHORT $L70265
	mov	eax, DWORD PTR _ctrl$[ebp]
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	edx, DWORD PTR [ecx+270116]
	mov	DWORD PTR [eax+368], edx
$L70265:

; 56   : 	CTRL_ATTR_GETFORM(UNDERLINE);

	cmp	DWORD PTR _ctrl$[ebp], 0
	je	SHORT $L70453
	push	0
	push	-1
	push	OFFSET FLAT:$SG70266
	mov	eax, DWORD PTR _ctrl$[ebp]
	add	eax, 44					; 0000002cH
	push	eax
	call	_dyntab_field_val
	add	esp, 16					; 00000010H
	mov	DWORD PTR -76+[ebp], eax
	jmp	SHORT $L70454
$L70453:
	mov	DWORD PTR -76+[ebp], OFFSET FLAT:$SG70267
$L70454:
	mov	ecx, DWORD PTR _ctrl$[ebp]
	mov	edx, DWORD PTR -76+[ebp]
	mov	DWORD PTR [ecx+372], edx
	mov	eax, DWORD PTR _ctrl$[ebp]
	mov	ecx, DWORD PTR [eax+372]
	movsx	edx, BYTE PTR [ecx]
	test	edx, edx
	jne	SHORT $L70268
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	ecx, DWORD PTR [eax+80]
	mov	edx, DWORD PTR [ecx]
	cmp	DWORD PTR [edx+372], 0
	je	SHORT $L70268
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	ecx, DWORD PTR [eax+80]
	mov	edx, DWORD PTR [ecx]
	mov	eax, DWORD PTR _ctrl$[ebp]
	mov	ecx, DWORD PTR [edx+372]
	mov	DWORD PTR [eax+372], ecx
$L70268:
	mov	edx, DWORD PTR _ctrl$[ebp]
	mov	eax, DWORD PTR [edx+372]
	movsx	ecx, BYTE PTR [eax]
	test	ecx, ecx
	jne	SHORT $L70269
	mov	edx, DWORD PTR _cntxt$[ebp]
	add	edx, 269748				; 00041db4H
	cmp	DWORD PTR _ctrl$[ebp], edx
	je	SHORT $L70269
	mov	eax, DWORD PTR _cntxt$[ebp]
	cmp	DWORD PTR [eax+270120], 0
	je	SHORT $L70269
	mov	ecx, DWORD PTR _ctrl$[ebp]
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	eax, DWORD PTR [edx+270120]
	mov	DWORD PTR [ecx+372], eax
$L70269:

; 57   : 
; 58   : 	/* Get style attributes */
; 59   : 	CTRL_ATTR_GET(CTRL_STYLE);

	cmp	DWORD PTR _ctrl$[ebp], 0
	je	SHORT $L70455
	push	0
	push	-1
	push	OFFSET FLAT:$SG70270
	mov	ecx, DWORD PTR _ctrl$[ebp]
	add	ecx, 44					; 0000002cH
	push	ecx
	call	_dyntab_field_val
	add	esp, 16					; 00000010H
	mov	DWORD PTR -80+[ebp], eax
	jmp	SHORT $L70456
$L70455:
	mov	DWORD PTR -80+[ebp], OFFSET FLAT:$SG70271
$L70456:
	mov	edx, DWORD PTR _ctrl$[ebp]
	mov	eax, DWORD PTR -80+[ebp]
	mov	DWORD PTR [edx+464], eax

; 60   : 	CTRL_ATTR_GETFORM(CELL_STYLE);

	cmp	DWORD PTR _ctrl$[ebp], 0
	je	SHORT $L70457
	push	0
	push	-1
	push	OFFSET FLAT:$SG70272
	mov	ecx, DWORD PTR _ctrl$[ebp]
	add	ecx, 44					; 0000002cH
	push	ecx
	call	_dyntab_field_val
	add	esp, 16					; 00000010H
	mov	DWORD PTR -84+[ebp], eax
	jmp	SHORT $L70458
$L70457:
	mov	DWORD PTR -84+[ebp], OFFSET FLAT:$SG70273
$L70458:
	mov	edx, DWORD PTR _ctrl$[ebp]
	mov	eax, DWORD PTR -84+[ebp]
	mov	DWORD PTR [edx+468], eax
	mov	ecx, DWORD PTR _ctrl$[ebp]
	mov	edx, DWORD PTR [ecx+468]
	movsx	eax, BYTE PTR [edx]
	test	eax, eax
	jne	SHORT $L70274
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	edx, DWORD PTR [ecx+80]
	mov	eax, DWORD PTR [edx]
	cmp	DWORD PTR [eax+468], 0
	je	SHORT $L70274
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	edx, DWORD PTR [ecx+80]
	mov	eax, DWORD PTR [edx]
	mov	ecx, DWORD PTR _ctrl$[ebp]
	mov	edx, DWORD PTR [eax+468]
	mov	DWORD PTR [ecx+468], edx
$L70274:
	mov	eax, DWORD PTR _ctrl$[ebp]
	mov	ecx, DWORD PTR [eax+468]
	movsx	edx, BYTE PTR [ecx]
	test	edx, edx
	jne	SHORT $L70275
	mov	eax, DWORD PTR _cntxt$[ebp]
	add	eax, 269748				; 00041db4H
	cmp	DWORD PTR _ctrl$[ebp], eax
	je	SHORT $L70275
	mov	ecx, DWORD PTR _cntxt$[ebp]
	cmp	DWORD PTR [ecx+270216], 0
	je	SHORT $L70275
	mov	edx, DWORD PTR _ctrl$[ebp]
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	ecx, DWORD PTR [eax+270216]
	mov	DWORD PTR [edx+468], ecx
$L70275:

; 61   : 	CTRL_ATTR_GETFORM(LABEL_STYLE);

	cmp	DWORD PTR _ctrl$[ebp], 0
	je	SHORT $L70459
	push	0
	push	-1
	push	OFFSET FLAT:$SG70276
	mov	edx, DWORD PTR _ctrl$[ebp]
	add	edx, 44					; 0000002cH
	push	edx
	call	_dyntab_field_val
	add	esp, 16					; 00000010H
	mov	DWORD PTR -88+[ebp], eax
	jmp	SHORT $L70460
$L70459:
	mov	DWORD PTR -88+[ebp], OFFSET FLAT:$SG70277
$L70460:
	mov	eax, DWORD PTR _ctrl$[ebp]
	mov	ecx, DWORD PTR -88+[ebp]
	mov	DWORD PTR [eax+472], ecx
	mov	edx, DWORD PTR _ctrl$[ebp]
	mov	eax, DWORD PTR [edx+472]
	movsx	ecx, BYTE PTR [eax]
	test	ecx, ecx
	jne	SHORT $L70278
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	eax, DWORD PTR [edx+80]
	mov	ecx, DWORD PTR [eax]
	cmp	DWORD PTR [ecx+472], 0
	je	SHORT $L70278
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	eax, DWORD PTR [edx+80]
	mov	ecx, DWORD PTR [eax]
	mov	edx, DWORD PTR _ctrl$[ebp]
	mov	eax, DWORD PTR [ecx+472]
	mov	DWORD PTR [edx+472], eax
$L70278:
	mov	ecx, DWORD PTR _ctrl$[ebp]
	mov	edx, DWORD PTR [ecx+472]
	movsx	eax, BYTE PTR [edx]
	test	eax, eax
	jne	SHORT $L70279
	mov	ecx, DWORD PTR _cntxt$[ebp]
	add	ecx, 269748				; 00041db4H
	cmp	DWORD PTR _ctrl$[ebp], ecx
	je	SHORT $L70279
	mov	edx, DWORD PTR _cntxt$[ebp]
	cmp	DWORD PTR [edx+270220], 0
	je	SHORT $L70279
	mov	eax, DWORD PTR _ctrl$[ebp]
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	edx, DWORD PTR [ecx+270220]
	mov	DWORD PTR [eax+472], edx
$L70279:

; 62   : 	CTRL_ATTR_GET(TABLE_STYLE);

	cmp	DWORD PTR _ctrl$[ebp], 0
	je	SHORT $L70461
	push	0
	push	-1
	push	OFFSET FLAT:$SG70280
	mov	eax, DWORD PTR _ctrl$[ebp]
	add	eax, 44					; 0000002cH
	push	eax
	call	_dyntab_field_val
	add	esp, 16					; 00000010H
	mov	DWORD PTR -92+[ebp], eax
	jmp	SHORT $L70462
$L70461:
	mov	DWORD PTR -92+[ebp], OFFSET FLAT:$SG70281
$L70462:
	mov	ecx, DWORD PTR _ctrl$[ebp]
	mov	edx, DWORD PTR -92+[ebp]
	mov	DWORD PTR [ecx+476], edx

; 63   : 
; 64   : 	/* Get label attributes */
; 65   : 	CTRL_ATTR_GET(LABEL);

	cmp	DWORD PTR _ctrl$[ebp], 0
	je	SHORT $L70463
	push	0
	push	-1
	push	OFFSET FLAT:$SG70282
	mov	eax, DWORD PTR _ctrl$[ebp]
	add	eax, 44					; 0000002cH
	push	eax
	call	_dyntab_field_val
	add	esp, 16					; 00000010H
	mov	DWORD PTR -96+[ebp], eax
	jmp	SHORT $L70464
$L70463:
	mov	DWORD PTR -96+[ebp], OFFSET FLAT:$SG70283
$L70464:
	mov	ecx, DWORD PTR _ctrl$[ebp]
	mov	edx, DWORD PTR -96+[ebp]
	mov	DWORD PTR [ecx+284], edx

; 66   : 	CTRL_ATTR_GET(LABELALIGN);

	cmp	DWORD PTR _ctrl$[ebp], 0
	je	SHORT $L70465
	push	0
	push	-1
	push	OFFSET FLAT:$SG70284
	mov	eax, DWORD PTR _ctrl$[ebp]
	add	eax, 44					; 0000002cH
	push	eax
	call	_dyntab_field_val
	add	esp, 16					; 00000010H
	mov	DWORD PTR -100+[ebp], eax
	jmp	SHORT $L70466
$L70465:
	mov	DWORD PTR -100+[ebp], OFFSET FLAT:$SG70285
$L70466:
	mov	ecx, DWORD PTR _ctrl$[ebp]
	mov	edx, DWORD PTR -100+[ebp]
	mov	DWORD PTR [ecx+384], edx

; 67   : 	CTRL_ATTR_GET(LABELVALIGN);

	cmp	DWORD PTR _ctrl$[ebp], 0
	je	SHORT $L70467
	push	0
	push	-1
	push	OFFSET FLAT:$SG70286
	mov	eax, DWORD PTR _ctrl$[ebp]
	add	eax, 44					; 0000002cH
	push	eax
	call	_dyntab_field_val
	add	esp, 16					; 00000010H
	mov	DWORD PTR -104+[ebp], eax
	jmp	SHORT $L70468
$L70467:
	mov	DWORD PTR -104+[ebp], OFFSET FLAT:$SG70287
$L70468:
	mov	ecx, DWORD PTR _ctrl$[ebp]
	mov	edx, DWORD PTR -104+[ebp]
	mov	DWORD PTR [ecx+388], edx

; 68   : 	CTRL_ATTR_GET(LABELWIDTH);

	cmp	DWORD PTR _ctrl$[ebp], 0
	je	SHORT $L70469
	push	0
	push	-1
	push	OFFSET FLAT:$SG70288
	mov	eax, DWORD PTR _ctrl$[ebp]
	add	eax, 44					; 0000002cH
	push	eax
	call	_dyntab_field_val
	add	esp, 16					; 00000010H
	mov	DWORD PTR -108+[ebp], eax
	jmp	SHORT $L70470
$L70469:
	mov	DWORD PTR -108+[ebp], OFFSET FLAT:$SG70289
$L70470:
	mov	ecx, DWORD PTR _ctrl$[ebp]
	mov	edx, DWORD PTR -108+[ebp]
	mov	DWORD PTR [ecx+392], edx

; 69   : 	CTRL_ATTR_GET(LABELHEIGHT);

	cmp	DWORD PTR _ctrl$[ebp], 0
	je	SHORT $L70471
	push	0
	push	-1
	push	OFFSET FLAT:$SG70290
	mov	eax, DWORD PTR _ctrl$[ebp]
	add	eax, 44					; 0000002cH
	push	eax
	call	_dyntab_field_val
	add	esp, 16					; 00000010H
	mov	DWORD PTR -112+[ebp], eax
	jmp	SHORT $L70472
$L70471:
	mov	DWORD PTR -112+[ebp], OFFSET FLAT:$SG70291
$L70472:
	mov	ecx, DWORD PTR _ctrl$[ebp]
	mov	edx, DWORD PTR -112+[ebp]
	mov	DWORD PTR [ecx+396], edx

; 70   : 	ctrl->LABELCOLSPAN = strtoul(CTRL_ATTR_VAL(LABELCOLSPAN), NULL, 10);

	cmp	DWORD PTR _ctrl$[ebp], 0
	je	SHORT $L70473
	push	0
	push	-1
	push	OFFSET FLAT:$SG70293
	mov	eax, DWORD PTR _ctrl$[ebp]
	add	eax, 44					; 0000002cH
	push	eax
	call	_dyntab_field_val
	add	esp, 16					; 00000010H
	mov	DWORD PTR -116+[ebp], eax
	jmp	SHORT $L70474
$L70473:
	mov	DWORD PTR -116+[ebp], OFFSET FLAT:$SG70294
$L70474:
	push	10					; 0000000aH
	push	0
	mov	ecx, DWORD PTR -116+[ebp]
	push	ecx
	call	_strtoul
	add	esp, 12					; 0000000cH
	mov	edx, DWORD PTR _ctrl$[ebp]
	mov	DWORD PTR [edx+432], eax

; 71   : 	ctrl->LABELROWSPAN = strtoul(CTRL_ATTR_VAL(LABELROWSPAN), NULL, 10);

	cmp	DWORD PTR _ctrl$[ebp], 0
	je	SHORT $L70475
	push	0
	push	-1
	push	OFFSET FLAT:$SG70296
	mov	eax, DWORD PTR _ctrl$[ebp]
	add	eax, 44					; 0000002cH
	push	eax
	call	_dyntab_field_val
	add	esp, 16					; 00000010H
	mov	DWORD PTR -120+[ebp], eax
	jmp	SHORT $L70476
$L70475:
	mov	DWORD PTR -120+[ebp], OFFSET FLAT:$SG70297
$L70476:
	push	10					; 0000000aH
	push	0
	mov	ecx, DWORD PTR -120+[ebp]
	push	ecx
	call	_strtoul
	add	esp, 12					; 0000000cH
	mov	edx, DWORD PTR _ctrl$[ebp]
	mov	DWORD PTR [edx+436], eax

; 72   : 	CTRL_ATTR_GETFORM(LABELBGCOLOR);

	cmp	DWORD PTR _ctrl$[ebp], 0
	je	SHORT $L70477
	push	0
	push	-1
	push	OFFSET FLAT:$SG70298
	mov	eax, DWORD PTR _ctrl$[ebp]
	add	eax, 44					; 0000002cH
	push	eax
	call	_dyntab_field_val
	add	esp, 16					; 00000010H
	mov	DWORD PTR -124+[ebp], eax
	jmp	SHORT $L70478
$L70477:
	mov	DWORD PTR -124+[ebp], OFFSET FLAT:$SG70299
$L70478:
	mov	ecx, DWORD PTR _ctrl$[ebp]
	mov	edx, DWORD PTR -124+[ebp]
	mov	DWORD PTR [ecx+400], edx
	mov	eax, DWORD PTR _ctrl$[ebp]
	mov	ecx, DWORD PTR [eax+400]
	movsx	edx, BYTE PTR [ecx]
	test	edx, edx
	jne	SHORT $L70300
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	ecx, DWORD PTR [eax+80]
	mov	edx, DWORD PTR [ecx]
	cmp	DWORD PTR [edx+400], 0
	je	SHORT $L70300
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	ecx, DWORD PTR [eax+80]
	mov	edx, DWORD PTR [ecx]
	mov	eax, DWORD PTR _ctrl$[ebp]
	mov	ecx, DWORD PTR [edx+400]
	mov	DWORD PTR [eax+400], ecx
$L70300:
	mov	edx, DWORD PTR _ctrl$[ebp]
	mov	eax, DWORD PTR [edx+400]
	movsx	ecx, BYTE PTR [eax]
	test	ecx, ecx
	jne	SHORT $L70301
	mov	edx, DWORD PTR _cntxt$[ebp]
	add	edx, 269748				; 00041db4H
	cmp	DWORD PTR _ctrl$[ebp], edx
	je	SHORT $L70301
	mov	eax, DWORD PTR _cntxt$[ebp]
	cmp	DWORD PTR [eax+270148], 0
	je	SHORT $L70301
	mov	ecx, DWORD PTR _ctrl$[ebp]
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	eax, DWORD PTR [edx+270148]
	mov	DWORD PTR [ecx+400], eax
$L70301:

; 73   : 	CTRL_ATTR_GETFORM(LABELBACKGROUND);

	cmp	DWORD PTR _ctrl$[ebp], 0
	je	SHORT $L70479
	push	0
	push	-1
	push	OFFSET FLAT:$SG70302
	mov	ecx, DWORD PTR _ctrl$[ebp]
	add	ecx, 44					; 0000002cH
	push	ecx
	call	_dyntab_field_val
	add	esp, 16					; 00000010H
	mov	DWORD PTR -128+[ebp], eax
	jmp	SHORT $L70480
$L70479:
	mov	DWORD PTR -128+[ebp], OFFSET FLAT:$SG70303
$L70480:
	mov	edx, DWORD PTR _ctrl$[ebp]
	mov	eax, DWORD PTR -128+[ebp]
	mov	DWORD PTR [edx+404], eax
	mov	ecx, DWORD PTR _ctrl$[ebp]
	mov	edx, DWORD PTR [ecx+404]
	movsx	eax, BYTE PTR [edx]
	test	eax, eax
	jne	SHORT $L70304
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	edx, DWORD PTR [ecx+80]
	mov	eax, DWORD PTR [edx]
	cmp	DWORD PTR [eax+404], 0
	je	SHORT $L70304
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	edx, DWORD PTR [ecx+80]
	mov	eax, DWORD PTR [edx]
	mov	ecx, DWORD PTR _ctrl$[ebp]
	mov	edx, DWORD PTR [eax+404]
	mov	DWORD PTR [ecx+404], edx
$L70304:
	mov	eax, DWORD PTR _ctrl$[ebp]
	mov	ecx, DWORD PTR [eax+404]
	movsx	edx, BYTE PTR [ecx]
	test	edx, edx
	jne	SHORT $L70305
	mov	eax, DWORD PTR _cntxt$[ebp]
	add	eax, 269748				; 00041db4H
	cmp	DWORD PTR _ctrl$[ebp], eax
	je	SHORT $L70305
	mov	ecx, DWORD PTR _cntxt$[ebp]
	cmp	DWORD PTR [ecx+270152], 0
	je	SHORT $L70305
	mov	edx, DWORD PTR _ctrl$[ebp]
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	ecx, DWORD PTR [eax+270152]
	mov	DWORD PTR [edx+404], ecx
$L70305:

; 74   : 
; 75   : 	/* Get label font modifiers */
; 76   : 	CTRL_ATTR_GETFORM(LABELFONTFACE);

	cmp	DWORD PTR _ctrl$[ebp], 0
	je	SHORT $L70481
	push	0
	push	-1
	push	OFFSET FLAT:$SG70306
	mov	edx, DWORD PTR _ctrl$[ebp]
	add	edx, 44					; 0000002cH
	push	edx
	call	_dyntab_field_val
	add	esp, 16					; 00000010H
	mov	DWORD PTR -132+[ebp], eax
	jmp	SHORT $L70482
$L70481:
	mov	DWORD PTR -132+[ebp], OFFSET FLAT:$SG70307
$L70482:
	mov	eax, DWORD PTR _ctrl$[ebp]
	mov	ecx, DWORD PTR -132+[ebp]
	mov	DWORD PTR [eax+408], ecx
	mov	edx, DWORD PTR _ctrl$[ebp]
	mov	eax, DWORD PTR [edx+408]
	movsx	ecx, BYTE PTR [eax]
	test	ecx, ecx
	jne	SHORT $L70308
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	eax, DWORD PTR [edx+80]
	mov	ecx, DWORD PTR [eax]
	cmp	DWORD PTR [ecx+408], 0
	je	SHORT $L70308
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	eax, DWORD PTR [edx+80]
	mov	ecx, DWORD PTR [eax]
	mov	edx, DWORD PTR _ctrl$[ebp]
	mov	eax, DWORD PTR [ecx+408]
	mov	DWORD PTR [edx+408], eax
$L70308:
	mov	ecx, DWORD PTR _ctrl$[ebp]
	mov	edx, DWORD PTR [ecx+408]
	movsx	eax, BYTE PTR [edx]
	test	eax, eax
	jne	SHORT $L70309
	mov	ecx, DWORD PTR _cntxt$[ebp]
	add	ecx, 269748				; 00041db4H
	cmp	DWORD PTR _ctrl$[ebp], ecx
	je	SHORT $L70309
	mov	edx, DWORD PTR _cntxt$[ebp]
	cmp	DWORD PTR [edx+270156], 0
	je	SHORT $L70309
	mov	eax, DWORD PTR _ctrl$[ebp]
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	edx, DWORD PTR [ecx+270156]
	mov	DWORD PTR [eax+408], edx
$L70309:

; 77   : 	CTRL_ATTR_GETFORM(LABELFONTSIZE);

	cmp	DWORD PTR _ctrl$[ebp], 0
	je	SHORT $L70483
	push	0
	push	-1
	push	OFFSET FLAT:$SG70310
	mov	eax, DWORD PTR _ctrl$[ebp]
	add	eax, 44					; 0000002cH
	push	eax
	call	_dyntab_field_val
	add	esp, 16					; 00000010H
	mov	DWORD PTR -136+[ebp], eax
	jmp	SHORT $L70484
$L70483:
	mov	DWORD PTR -136+[ebp], OFFSET FLAT:$SG70311
$L70484:
	mov	ecx, DWORD PTR _ctrl$[ebp]
	mov	edx, DWORD PTR -136+[ebp]
	mov	DWORD PTR [ecx+412], edx
	mov	eax, DWORD PTR _ctrl$[ebp]
	mov	ecx, DWORD PTR [eax+412]
	movsx	edx, BYTE PTR [ecx]
	test	edx, edx
	jne	SHORT $L70312
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	ecx, DWORD PTR [eax+80]
	mov	edx, DWORD PTR [ecx]
	cmp	DWORD PTR [edx+412], 0
	je	SHORT $L70312
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	ecx, DWORD PTR [eax+80]
	mov	edx, DWORD PTR [ecx]
	mov	eax, DWORD PTR _ctrl$[ebp]
	mov	ecx, DWORD PTR [edx+412]
	mov	DWORD PTR [eax+412], ecx
$L70312:
	mov	edx, DWORD PTR _ctrl$[ebp]
	mov	eax, DWORD PTR [edx+412]
	movsx	ecx, BYTE PTR [eax]
	test	ecx, ecx
	jne	SHORT $L70313
	mov	edx, DWORD PTR _cntxt$[ebp]
	add	edx, 269748				; 00041db4H
	cmp	DWORD PTR _ctrl$[ebp], edx
	je	SHORT $L70313
	mov	eax, DWORD PTR _cntxt$[ebp]
	cmp	DWORD PTR [eax+270160], 0
	je	SHORT $L70313
	mov	ecx, DWORD PTR _ctrl$[ebp]
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	eax, DWORD PTR [edx+270160]
	mov	DWORD PTR [ecx+412], eax
$L70313:

; 78   : 	CTRL_ATTR_GETFORM(LABELFONTCOLOR);

	cmp	DWORD PTR _ctrl$[ebp], 0
	je	SHORT $L70485
	push	0
	push	-1
	push	OFFSET FLAT:$SG70314
	mov	ecx, DWORD PTR _ctrl$[ebp]
	add	ecx, 44					; 0000002cH
	push	ecx
	call	_dyntab_field_val
	add	esp, 16					; 00000010H
	mov	DWORD PTR -140+[ebp], eax
	jmp	SHORT $L70486
$L70485:
	mov	DWORD PTR -140+[ebp], OFFSET FLAT:$SG70315
$L70486:
	mov	edx, DWORD PTR _ctrl$[ebp]
	mov	eax, DWORD PTR -140+[ebp]
	mov	DWORD PTR [edx+416], eax
	mov	ecx, DWORD PTR _ctrl$[ebp]
	mov	edx, DWORD PTR [ecx+416]
	movsx	eax, BYTE PTR [edx]
	test	eax, eax
	jne	SHORT $L70316
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	edx, DWORD PTR [ecx+80]
	mov	eax, DWORD PTR [edx]
	cmp	DWORD PTR [eax+416], 0
	je	SHORT $L70316
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	edx, DWORD PTR [ecx+80]
	mov	eax, DWORD PTR [edx]
	mov	ecx, DWORD PTR _ctrl$[ebp]
	mov	edx, DWORD PTR [eax+416]
	mov	DWORD PTR [ecx+416], edx
$L70316:
	mov	eax, DWORD PTR _ctrl$[ebp]
	mov	ecx, DWORD PTR [eax+416]
	movsx	edx, BYTE PTR [ecx]
	test	edx, edx
	jne	SHORT $L70317
	mov	eax, DWORD PTR _cntxt$[ebp]
	add	eax, 269748				; 00041db4H
	cmp	DWORD PTR _ctrl$[ebp], eax
	je	SHORT $L70317
	mov	ecx, DWORD PTR _cntxt$[ebp]
	cmp	DWORD PTR [ecx+270164], 0
	je	SHORT $L70317
	mov	edx, DWORD PTR _ctrl$[ebp]
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	ecx, DWORD PTR [eax+270164]
	mov	DWORD PTR [edx+416], ecx
$L70317:

; 79   : 	CTRL_ATTR_GETFORM(LABELBOLD);

	cmp	DWORD PTR _ctrl$[ebp], 0
	je	SHORT $L70487
	push	0
	push	-1
	push	OFFSET FLAT:$SG70318
	mov	edx, DWORD PTR _ctrl$[ebp]
	add	edx, 44					; 0000002cH
	push	edx
	call	_dyntab_field_val
	add	esp, 16					; 00000010H
	mov	DWORD PTR -144+[ebp], eax
	jmp	SHORT $L70488
$L70487:
	mov	DWORD PTR -144+[ebp], OFFSET FLAT:$SG70319
$L70488:
	mov	eax, DWORD PTR _ctrl$[ebp]
	mov	ecx, DWORD PTR -144+[ebp]
	mov	DWORD PTR [eax+420], ecx
	mov	edx, DWORD PTR _ctrl$[ebp]
	mov	eax, DWORD PTR [edx+420]
	movsx	ecx, BYTE PTR [eax]
	test	ecx, ecx
	jne	SHORT $L70320
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	eax, DWORD PTR [edx+80]
	mov	ecx, DWORD PTR [eax]
	cmp	DWORD PTR [ecx+420], 0
	je	SHORT $L70320
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	eax, DWORD PTR [edx+80]
	mov	ecx, DWORD PTR [eax]
	mov	edx, DWORD PTR _ctrl$[ebp]
	mov	eax, DWORD PTR [ecx+420]
	mov	DWORD PTR [edx+420], eax
$L70320:
	mov	ecx, DWORD PTR _ctrl$[ebp]
	mov	edx, DWORD PTR [ecx+420]
	movsx	eax, BYTE PTR [edx]
	test	eax, eax
	jne	SHORT $L70321
	mov	ecx, DWORD PTR _cntxt$[ebp]
	add	ecx, 269748				; 00041db4H
	cmp	DWORD PTR _ctrl$[ebp], ecx
	je	SHORT $L70321
	mov	edx, DWORD PTR _cntxt$[ebp]
	cmp	DWORD PTR [edx+270168], 0
	je	SHORT $L70321
	mov	eax, DWORD PTR _ctrl$[ebp]
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	edx, DWORD PTR [ecx+270168]
	mov	DWORD PTR [eax+420], edx
$L70321:

; 80   : 	CTRL_ATTR_GETFORM(LABELITALIC);

	cmp	DWORD PTR _ctrl$[ebp], 0
	je	SHORT $L70489
	push	0
	push	-1
	push	OFFSET FLAT:$SG70322
	mov	eax, DWORD PTR _ctrl$[ebp]
	add	eax, 44					; 0000002cH
	push	eax
	call	_dyntab_field_val
	add	esp, 16					; 00000010H
	mov	DWORD PTR -148+[ebp], eax
	jmp	SHORT $L70490
$L70489:
	mov	DWORD PTR -148+[ebp], OFFSET FLAT:$SG70323
$L70490:
	mov	ecx, DWORD PTR _ctrl$[ebp]
	mov	edx, DWORD PTR -148+[ebp]
	mov	DWORD PTR [ecx+424], edx
	mov	eax, DWORD PTR _ctrl$[ebp]
	mov	ecx, DWORD PTR [eax+424]
	movsx	edx, BYTE PTR [ecx]
	test	edx, edx
	jne	SHORT $L70324
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	ecx, DWORD PTR [eax+80]
	mov	edx, DWORD PTR [ecx]
	cmp	DWORD PTR [edx+424], 0
	je	SHORT $L70324
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	ecx, DWORD PTR [eax+80]
	mov	edx, DWORD PTR [ecx]
	mov	eax, DWORD PTR _ctrl$[ebp]
	mov	ecx, DWORD PTR [edx+424]
	mov	DWORD PTR [eax+424], ecx
$L70324:
	mov	edx, DWORD PTR _ctrl$[ebp]
	mov	eax, DWORD PTR [edx+424]
	movsx	ecx, BYTE PTR [eax]
	test	ecx, ecx
	jne	SHORT $L70325
	mov	edx, DWORD PTR _cntxt$[ebp]
	add	edx, 269748				; 00041db4H
	cmp	DWORD PTR _ctrl$[ebp], edx
	je	SHORT $L70325
	mov	eax, DWORD PTR _cntxt$[ebp]
	cmp	DWORD PTR [eax+270172], 0
	je	SHORT $L70325
	mov	ecx, DWORD PTR _ctrl$[ebp]
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	eax, DWORD PTR [edx+270172]
	mov	DWORD PTR [ecx+424], eax
$L70325:

; 81   : 	CTRL_ATTR_GETFORM(LABELUNDERLINE);

	cmp	DWORD PTR _ctrl$[ebp], 0
	je	SHORT $L70491
	push	0
	push	-1
	push	OFFSET FLAT:$SG70326
	mov	ecx, DWORD PTR _ctrl$[ebp]
	add	ecx, 44					; 0000002cH
	push	ecx
	call	_dyntab_field_val
	add	esp, 16					; 00000010H
	mov	DWORD PTR -152+[ebp], eax
	jmp	SHORT $L70492
$L70491:
	mov	DWORD PTR -152+[ebp], OFFSET FLAT:$SG70327
$L70492:
	mov	edx, DWORD PTR _ctrl$[ebp]
	mov	eax, DWORD PTR -152+[ebp]
	mov	DWORD PTR [edx+428], eax
	mov	ecx, DWORD PTR _ctrl$[ebp]
	mov	edx, DWORD PTR [ecx+428]
	movsx	eax, BYTE PTR [edx]
	test	eax, eax
	jne	SHORT $L70328
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	edx, DWORD PTR [ecx+80]
	mov	eax, DWORD PTR [edx]
	cmp	DWORD PTR [eax+428], 0
	je	SHORT $L70328
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	edx, DWORD PTR [ecx+80]
	mov	eax, DWORD PTR [edx]
	mov	ecx, DWORD PTR _ctrl$[ebp]
	mov	edx, DWORD PTR [eax+428]
	mov	DWORD PTR [ecx+428], edx
$L70328:
	mov	eax, DWORD PTR _ctrl$[ebp]
	mov	ecx, DWORD PTR [eax+428]
	movsx	edx, BYTE PTR [ecx]
	test	edx, edx
	jne	SHORT $L70329
	mov	eax, DWORD PTR _cntxt$[ebp]
	add	eax, 269748				; 00041db4H
	cmp	DWORD PTR _ctrl$[ebp], eax
	je	SHORT $L70329
	mov	ecx, DWORD PTR _cntxt$[ebp]
	cmp	DWORD PTR [ecx+270176], 0
	je	SHORT $L70329
	mov	edx, DWORD PTR _ctrl$[ebp]
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	ecx, DWORD PTR [eax+270176]
	mov	DWORD PTR [edx+428], ecx
$L70329:

; 82   : 
; 83   : 	/* Get table attributes */
; 84   : 	CTRL_ATTR_GET(TABLEWIDTH);

	cmp	DWORD PTR _ctrl$[ebp], 0
	je	SHORT $L70493
	push	0
	push	-1
	push	OFFSET FLAT:$SG70330
	mov	edx, DWORD PTR _ctrl$[ebp]
	add	edx, 44					; 0000002cH
	push	edx
	call	_dyntab_field_val
	add	esp, 16					; 00000010H
	mov	DWORD PTR -156+[ebp], eax
	jmp	SHORT $L70494
$L70493:
	mov	DWORD PTR -156+[ebp], OFFSET FLAT:$SG70331
$L70494:
	mov	eax, DWORD PTR _ctrl$[ebp]
	mov	ecx, DWORD PTR -156+[ebp]
	mov	DWORD PTR [eax+440], ecx

; 85   : 	CTRL_ATTR_GET(TABLEHEIGHT);

	cmp	DWORD PTR _ctrl$[ebp], 0
	je	SHORT $L70495
	push	0
	push	-1
	push	OFFSET FLAT:$SG70332
	mov	edx, DWORD PTR _ctrl$[ebp]
	add	edx, 44					; 0000002cH
	push	edx
	call	_dyntab_field_val
	add	esp, 16					; 00000010H
	mov	DWORD PTR -160+[ebp], eax
	jmp	SHORT $L70496
$L70495:
	mov	DWORD PTR -160+[ebp], OFFSET FLAT:$SG70333
$L70496:
	mov	eax, DWORD PTR _ctrl$[ebp]
	mov	ecx, DWORD PTR -160+[ebp]
	mov	DWORD PTR [eax+444], ecx

; 86   : 	CTRL_ATTR_GET(TABLERULES);

	cmp	DWORD PTR _ctrl$[ebp], 0
	je	SHORT $L70497
	push	0
	push	-1
	push	OFFSET FLAT:$SG70334
	mov	edx, DWORD PTR _ctrl$[ebp]
	add	edx, 44					; 0000002cH
	push	edx
	call	_dyntab_field_val
	add	esp, 16					; 00000010H
	mov	DWORD PTR -164+[ebp], eax
	jmp	SHORT $L70498
$L70497:
	mov	DWORD PTR -164+[ebp], OFFSET FLAT:$SG70335
$L70498:
	mov	eax, DWORD PTR _ctrl$[ebp]
	mov	ecx, DWORD PTR -164+[ebp]
	mov	DWORD PTR [eax+448], ecx

; 87   : 	CTRL_ATTR_GET(TABLEBGCOLOR);

	cmp	DWORD PTR _ctrl$[ebp], 0
	je	SHORT $L70499
	push	0
	push	-1
	push	OFFSET FLAT:$SG70336
	mov	edx, DWORD PTR _ctrl$[ebp]
	add	edx, 44					; 0000002cH
	push	edx
	call	_dyntab_field_val
	add	esp, 16					; 00000010H
	mov	DWORD PTR -168+[ebp], eax
	jmp	SHORT $L70500
$L70499:
	mov	DWORD PTR -168+[ebp], OFFSET FLAT:$SG70337
$L70500:
	mov	eax, DWORD PTR _ctrl$[ebp]
	mov	ecx, DWORD PTR -168+[ebp]
	mov	DWORD PTR [eax+452], ecx

; 88   : 	CTRL_ATTR_GET(TABLEBACKGROUND);

	cmp	DWORD PTR _ctrl$[ebp], 0
	je	SHORT $L70501
	push	0
	push	-1
	push	OFFSET FLAT:$SG70338
	mov	edx, DWORD PTR _ctrl$[ebp]
	add	edx, 44					; 0000002cH
	push	edx
	call	_dyntab_field_val
	add	esp, 16					; 00000010H
	mov	DWORD PTR -172+[ebp], eax
	jmp	SHORT $L70502
$L70501:
	mov	DWORD PTR -172+[ebp], OFFSET FLAT:$SG70339
$L70502:
	mov	eax, DWORD PTR _ctrl$[ebp]
	mov	ecx, DWORD PTR -172+[ebp]
	mov	DWORD PTR [eax+456], ecx

; 89   : 	ctrl->BORDER = strtoul(CTRL_ATTR_VAL(BORDER), NULL, 10);

	cmp	DWORD PTR _ctrl$[ebp], 0
	je	SHORT $L70503
	push	0
	push	-1
	push	OFFSET FLAT:$SG70341
	mov	edx, DWORD PTR _ctrl$[ebp]
	add	edx, 44					; 0000002cH
	push	edx
	call	_dyntab_field_val
	add	esp, 16					; 00000010H
	mov	DWORD PTR -176+[ebp], eax
	jmp	SHORT $L70504
$L70503:
	mov	DWORD PTR -176+[ebp], OFFSET FLAT:$SG70342
$L70504:
	push	10					; 0000000aH
	push	0
	mov	eax, DWORD PTR -176+[ebp]
	push	eax
	call	_strtoul
	add	esp, 12					; 0000000cH
	mov	ecx, DWORD PTR _ctrl$[ebp]
	mov	DWORD PTR [ecx+460], eax
$eva_noerr$70343:

; 90   : 
; 91   : 	RETURN_OK_CLEANUP;

	push	0
	push	OFFSET FLAT:$SG70344
	push	OFFSET FLAT:$SG70345
	mov	edx, DWORD PTR _cntxt$[ebp]
	push	edx
	call	_err_clear
	add	esp, 16					; 00000010H
$eva_err$70211:
	mov	eax, DWORD PTR _cntxt$[ebp]
	cmp	DWORD PTR [eax+29872], 0
	je	SHORT $L70346
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	edx, DWORD PTR [ecx+29900]
	push	edx
	push	OFFSET FLAT:$SG70347
	push	OFFSET FLAT:$SG70348
	mov	eax, DWORD PTR _cntxt$[ebp]
	push	eax
	call	_err_add_context
	add	esp, 16					; 00000010H
$L70346:
	mov	ecx, DWORD PTR _cntxt$[ebp]
	xor	eax, eax
	cmp	DWORD PTR [ecx+29872], 0
	setne	al

; 92   : }

	mov	esp, ebp
	pop	ebp
	ret	0
_ctrl_set_format_attr ENDP
_TEXT	ENDS
PUBLIC	_ctrl_set_common_attr
_BSS	SEGMENT
	ALIGN	4

$SG70358 DB	01H DUP (?)
	ALIGN	4

$SG70360 DB	01H DUP (?)
	ALIGN	4

$SG70362 DB	01H DUP (?)
	ALIGN	4

$SG70364 DB	01H DUP (?)
	ALIGN	4

$SG70366 DB	01H DUP (?)
	ALIGN	4

$SG70368 DB	01H DUP (?)
	ALIGN	4

$SG70370 DB	01H DUP (?)
	ALIGN	4

$SG70372 DB	01H DUP (?)
_BSS	ENDS
_DATA	SEGMENT
	ORG $+3
$SG70357 DB	'_EVA_CONTROL', 00H
	ORG $+3
$SG70359 DB	'_EVA_TYPE', 00H
	ORG $+2
$SG70361 DB	'_EVA_FIELD', 00H
	ORG $+1
$SG70363 DB	'_EVA_NOTES', 00H
	ORG $+1
$SG70365 DB	'_EVA_OPTIONBUTTON', 00H
	ORG $+2
$SG70367 DB	'_EVA_ALLOWEMPTY', 00H
$SG70369 DB	'_EVA_MULTIPLE', 00H
	ORG $+2
$SG70371 DB	'_EVA_LABEL_NOSEL', 00H
	ORG $+3
$SG70376 DB	'D:\Travail\ABI\EVA\V4.0\CGI\Brunix-2016\ctrl_attr.c', 00H
$SG70377 DB	'ctrl_set_common_attr', 00H
	ORG $+3
$SG70379 DB	'D:\Travail\ABI\EVA\V4.0\CGI\Brunix-2016\ctrl_attr.c', 00H
$SG70380 DB	'ctrl_set_common_attr', 00H
_DATA	ENDS
_TEXT	SEGMENT
_cntxt$ = 8
_ctrl$ = 12
_ctrl_set_common_attr PROC NEAR

; 105  : ){

	push	ebp
	mov	ebp, esp
	sub	esp, 32					; 00000020H

; 106  : 
; 107  : 	/* Get control attributes */
; 108  : 	CTRL_ATTR_GET(CONTROL);

	cmp	DWORD PTR _ctrl$[ebp], 0
	je	SHORT $L70506
	push	0
	push	-1
	push	OFFSET FLAT:$SG70357
	mov	eax, DWORD PTR _ctrl$[ebp]
	add	eax, 44					; 0000002cH
	push	eax
	call	_dyntab_field_val
	add	esp, 16					; 00000010H
	mov	DWORD PTR -4+[ebp], eax
	jmp	SHORT $L70507
$L70506:
	mov	DWORD PTR -4+[ebp], OFFSET FLAT:$SG70358
$L70507:
	mov	ecx, DWORD PTR _ctrl$[ebp]
	mov	edx, DWORD PTR -4+[ebp]
	mov	DWORD PTR [ecx+272], edx

; 109  : 	CTRL_ATTR_GET(TYPE);

	cmp	DWORD PTR _ctrl$[ebp], 0
	je	SHORT $L70508
	push	0
	push	-1
	push	OFFSET FLAT:$SG70359
	mov	eax, DWORD PTR _ctrl$[ebp]
	add	eax, 44					; 0000002cH
	push	eax
	call	_dyntab_field_val
	add	esp, 16					; 00000010H
	mov	DWORD PTR -8+[ebp], eax
	jmp	SHORT $L70509
$L70508:
	mov	DWORD PTR -8+[ebp], OFFSET FLAT:$SG70360
$L70509:
	mov	ecx, DWORD PTR _ctrl$[ebp]
	mov	edx, DWORD PTR -8+[ebp]
	mov	DWORD PTR [ecx+276], edx

; 110  : 	CTRL_ATTR_GET(FIELD);

	cmp	DWORD PTR _ctrl$[ebp], 0
	je	SHORT $L70510
	push	0
	push	-1
	push	OFFSET FLAT:$SG70361
	mov	eax, DWORD PTR _ctrl$[ebp]
	add	eax, 44					; 0000002cH
	push	eax
	call	_dyntab_field_val
	add	esp, 16					; 00000010H
	mov	DWORD PTR -12+[ebp], eax
	jmp	SHORT $L70511
$L70510:
	mov	DWORD PTR -12+[ebp], OFFSET FLAT:$SG70362
$L70511:
	mov	ecx, DWORD PTR _ctrl$[ebp]
	mov	edx, DWORD PTR -12+[ebp]
	mov	DWORD PTR [ecx+280], edx

; 111  : 	CTRL_ATTR_GET(NOTES);

	cmp	DWORD PTR _ctrl$[ebp], 0
	je	SHORT $L70512
	push	0
	push	-1
	push	OFFSET FLAT:$SG70363
	mov	eax, DWORD PTR _ctrl$[ebp]
	add	eax, 44					; 0000002cH
	push	eax
	call	_dyntab_field_val
	add	esp, 16					; 00000010H
	mov	DWORD PTR -16+[ebp], eax
	jmp	SHORT $L70513
$L70512:
	mov	DWORD PTR -16+[ebp], OFFSET FLAT:$SG70364
$L70513:
	mov	ecx, DWORD PTR _ctrl$[ebp]
	mov	edx, DWORD PTR -16+[ebp]
	mov	DWORD PTR [ecx+288], edx

; 112  : 	CTRL_ATTR_GET(OPTIONBUTTON);

	cmp	DWORD PTR _ctrl$[ebp], 0
	je	SHORT $L70514
	push	0
	push	-1
	push	OFFSET FLAT:$SG70365
	mov	eax, DWORD PTR _ctrl$[ebp]
	add	eax, 44					; 0000002cH
	push	eax
	call	_dyntab_field_val
	add	esp, 16					; 00000010H
	mov	DWORD PTR -20+[ebp], eax
	jmp	SHORT $L70515
$L70514:
	mov	DWORD PTR -20+[ebp], OFFSET FLAT:$SG70366
$L70515:
	mov	ecx, DWORD PTR _ctrl$[ebp]
	mov	edx, DWORD PTR -20+[ebp]
	mov	DWORD PTR [ecx+336], edx

; 113  : 	CTRL_ATTR_GET(ALLOWEMPTY);

	cmp	DWORD PTR _ctrl$[ebp], 0
	je	SHORT $L70516
	push	0
	push	-1
	push	OFFSET FLAT:$SG70367
	mov	eax, DWORD PTR _ctrl$[ebp]
	add	eax, 44					; 0000002cH
	push	eax
	call	_dyntab_field_val
	add	esp, 16					; 00000010H
	mov	DWORD PTR -24+[ebp], eax
	jmp	SHORT $L70517
$L70516:
	mov	DWORD PTR -24+[ebp], OFFSET FLAT:$SG70368
$L70517:
	mov	ecx, DWORD PTR _ctrl$[ebp]
	mov	edx, DWORD PTR -24+[ebp]
	mov	DWORD PTR [ecx+340], edx

; 114  : 	CTRL_ATTR_GET(MULTIPLE);

	cmp	DWORD PTR _ctrl$[ebp], 0
	je	SHORT $L70518
	push	0
	push	-1
	push	OFFSET FLAT:$SG70369
	mov	eax, DWORD PTR _ctrl$[ebp]
	add	eax, 44					; 0000002cH
	push	eax
	call	_dyntab_field_val
	add	esp, 16					; 00000010H
	mov	DWORD PTR -28+[ebp], eax
	jmp	SHORT $L70519
$L70518:
	mov	DWORD PTR -28+[ebp], OFFSET FLAT:$SG70370
$L70519:
	mov	ecx, DWORD PTR _ctrl$[ebp]
	mov	edx, DWORD PTR -28+[ebp]
	mov	DWORD PTR [ecx+344], edx

; 115  : 	CTRL_ATTR_GET(LABEL_NOSEL);

	cmp	DWORD PTR _ctrl$[ebp], 0
	je	SHORT $L70520
	push	0
	push	-1
	push	OFFSET FLAT:$SG70371
	mov	eax, DWORD PTR _ctrl$[ebp]
	add	eax, 44					; 0000002cH
	push	eax
	call	_dyntab_field_val
	add	esp, 16					; 00000010H
	mov	DWORD PTR -32+[ebp], eax
	jmp	SHORT $L70521
$L70520:
	mov	DWORD PTR -32+[ebp], OFFSET FLAT:$SG70372
$L70521:
	mov	ecx, DWORD PTR _ctrl$[ebp]
	mov	edx, DWORD PTR -32+[ebp]
	mov	DWORD PTR [ecx+348], edx

; 116  : 	if(ctrl_set_format_attr(cntxt, ctrl)) STACK_ERROR;

	mov	eax, DWORD PTR _ctrl$[ebp]
	push	eax
	mov	ecx, DWORD PTR _cntxt$[ebp]
	push	ecx
	call	_ctrl_set_format_attr
	add	esp, 8
	test	eax, eax
	je	SHORT $eva_noerr$70375
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 116		; 00000074H
	jmp	SHORT $eva_err$70374
$eva_noerr$70375:

; 117  : 
; 118  : 	RETURN_OK_CLEANUP;

	push	0
	push	OFFSET FLAT:$SG70376
	push	OFFSET FLAT:$SG70377
	mov	eax, DWORD PTR _cntxt$[ebp]
	push	eax
	call	_err_clear
	add	esp, 16					; 00000010H
$eva_err$70374:
	mov	ecx, DWORD PTR _cntxt$[ebp]
	cmp	DWORD PTR [ecx+29872], 0
	je	SHORT $L70378
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	eax, DWORD PTR [edx+29900]
	push	eax
	push	OFFSET FLAT:$SG70379
	push	OFFSET FLAT:$SG70380
	mov	ecx, DWORD PTR _cntxt$[ebp]
	push	ecx
	call	_err_add_context
	add	esp, 16					; 00000010H
$L70378:
	mov	edx, DWORD PTR _cntxt$[ebp]
	xor	eax, eax
	cmp	DWORD PTR [edx+29872], 0
	setne	al

; 119  : }

	mov	esp, ebp
	pop	ebp
	ret	0
_ctrl_set_common_attr ENDP
_TEXT	ENDS
PUBLIC	_ctrl_read_baseobj
EXTRN	_qry_complete_data:NEAR
EXTRN	_dyntab_free:NEAR
EXTRN	_dyntab_val:NEAR
EXTRN	_qry_cache_idobj_field:NEAR
EXTRN	_dyntab_filter_field:NEAR
_DATA	SEGMENT
	ORG $+3
$SG70394 DB	'_EVA_BASE_STYLE', 00H
$SG70396 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70408 DB	'D:\Travail\ABI\EVA\V4.0\CGI\Brunix-2016\ctrl_attr.c', 00H
$SG70409 DB	'ctrl_read_baseobj', 00H
	ORG $+2
$SG70411 DB	'D:\Travail\ABI\EVA\V4.0\CGI\Brunix-2016\ctrl_attr.c', 00H
$SG70412 DB	'ctrl_read_baseobj', 00H
_DATA	ENDS
_TEXT	SEGMENT
_cntxt$ = 8
_ctrldata$ = 12
_baseobj$ = -44
_data$ = -20
_i$ = -24
_ctrl_read_baseobj PROC NEAR

; 134  : ){

	push	ebp
	mov	ebp, esp
	sub	esp, 44					; 0000002cH

; 135  : 	DynTable baseobj = {0};

	mov	DWORD PTR _baseobj$[ebp], 0
	xor	eax, eax
	mov	DWORD PTR _baseobj$[ebp+4], eax
	mov	DWORD PTR _baseobj$[ebp+8], eax
	mov	DWORD PTR _baseobj$[ebp+12], eax
	mov	DWORD PTR _baseobj$[ebp+16], eax

; 136  : 	DynTable data = {0};

	mov	DWORD PTR _data$[ebp], 0
	xor	ecx, ecx
	mov	DWORD PTR _data$[ebp+4], ecx
	mov	DWORD PTR _data$[ebp+8], ecx
	mov	DWORD PTR _data$[ebp+12], ecx
	mov	DWORD PTR _data$[ebp+16], ecx

; 137  : 	unsigned long i;
; 138  : 
; 139  : 	DYNTAB_FIELD(&baseobj, ctrldata, BASE_STYLE);

	lea	edx, DWORD PTR _baseobj$[ebp]
	push	edx
	call	_dyntab_free
	add	esp, 4
	push	0
	push	-1
	push	OFFSET FLAT:$SG70394
	mov	eax, DWORD PTR _ctrldata$[ebp]
	push	eax
	push	0
	lea	ecx, DWORD PTR _baseobj$[ebp]
	push	ecx
	call	_dyntab_filter_field
	add	esp, 24					; 00000018H
	test	eax, eax
	je	SHORT $L70393
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29872], OFFSET FLAT:$SG70396
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 139		; 0000008bH
	jmp	$eva_err$70397
$L70393:

; 140  : 	for(i = 0; i < baseobj.nbrows; i++)

	mov	DWORD PTR _i$[ebp], 0
	jmp	SHORT $L70398
$L70399:
	mov	ecx, DWORD PTR _i$[ebp]
	add	ecx, 1
	mov	DWORD PTR _i$[ebp], ecx
$L70398:
	mov	edx, DWORD PTR _i$[ebp]
	cmp	edx, DWORD PTR _baseobj$[ebp]
	jae	SHORT $eva_noerr$70407

; 142  : 		if(qry_cache_idobj(&data, DYNTAB_TOULRC(&baseobj, i, 0)) ||
; 143  : 			qry_complete_data(cntxt, ctrldata, &data, NULL, NULL)) STACK_ERROR;

	push	3
	push	0
	push	10					; 0000000aH
	push	0
	push	0
	mov	eax, DWORD PTR _i$[ebp]
	push	eax
	lea	ecx, DWORD PTR _baseobj$[ebp]
	push	ecx
	call	_dyntab_val
	add	esp, 12					; 0000000cH
	push	eax
	call	_strtoul
	add	esp, 12					; 0000000cH
	push	eax
	lea	edx, DWORD PTR _data$[ebp]
	push	edx
	mov	eax, DWORD PTR _cntxt$[ebp]
	push	eax
	call	_qry_cache_idobj_field
	add	esp, 20					; 00000014H
	test	eax, eax
	jne	SHORT $L70406
	push	0
	push	0
	lea	ecx, DWORD PTR _data$[ebp]
	push	ecx
	mov	edx, DWORD PTR _ctrldata$[ebp]
	push	edx
	mov	eax, DWORD PTR _cntxt$[ebp]
	push	eax
	call	_qry_complete_data
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L70405
$L70406:
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 143		; 0000008fH
	jmp	SHORT $eva_err$70397
$L70405:

; 144  : 	}

	jmp	SHORT $L70399
$eva_noerr$70407:

; 145  : 
; 146  : 	RETURN_OK_CLEANUP;

	push	0
	push	OFFSET FLAT:$SG70408
	push	OFFSET FLAT:$SG70409
	mov	edx, DWORD PTR _cntxt$[ebp]
	push	edx
	call	_err_clear
	add	esp, 16					; 00000010H
$eva_err$70397:
	mov	eax, DWORD PTR _cntxt$[ebp]
	cmp	DWORD PTR [eax+29872], 0
	je	SHORT $L70410
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	edx, DWORD PTR [ecx+29900]
	push	edx
	push	OFFSET FLAT:$SG70411
	push	OFFSET FLAT:$SG70412
	mov	eax, DWORD PTR _cntxt$[ebp]
	push	eax
	call	_err_add_context
	add	esp, 16					; 00000010H
$L70410:
	lea	ecx, DWORD PTR _baseobj$[ebp]
	push	ecx
	call	_dyntab_free
	add	esp, 4
	lea	edx, DWORD PTR _data$[ebp]
	push	edx
	call	_dyntab_free
	add	esp, 4
	mov	eax, DWORD PTR _cntxt$[ebp]
	xor	ecx, ecx
	cmp	DWORD PTR [eax+29872], 0
	setne	cl
	mov	eax, ecx

; 147  : }

	mov	esp, ebp
	pop	ebp
	ret	0
_ctrl_read_baseobj ENDP
_TEXT	ENDS
END
