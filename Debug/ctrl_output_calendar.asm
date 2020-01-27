	TITLE	D:\Travail\ABI\EVA\V4.0\CGI\Brunix-2016\ctrl_output_calendar.c
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
PUBLIC	_ctrl_add_calendar_input
EXTRN	_datetxt_to_format:NEAR
EXTRN	_put_html_button_sz:NEAR
EXTRN	_put_html_list:NEAR
EXTRN	_cginame_setkeep:NEAR
EXTRN	_mem_free:NEAR
EXTRN	_dynbuf_add:NEAR
EXTRN	_dynbuf_add_int:NEAR
EXTRN	_ctrl_cgi_name:NEAR
EXTRN	_dynbuf_add3:NEAR
EXTRN	_cgi_get_subfield:NEAR
EXTRN	_dynbuf_add3_int:NEAR
EXTRN	_dyntab_free:NEAR
EXTRN	_dyntab_add:NEAR
EXTRN	_strcmp:NEAR
EXTRN	_strlen:NEAR
EXTRN	_dyntab_set_txt:NEAR
EXTRN	_err_add_context:NEAR
EXTRN	_err_clear:NEAR
_BSS	SEGMENT
$SG70394 DB	01H DUP (?)
_BSS	ENDS
_DATA	SEGMENT
$SG70268 DB	'MAXLABELS', 00H
	ORG $+2
$SG70273 DB	''' size=2 value=', 00H
$SG70274 DB	'<input type=text name=''', 00H
$SG70276 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70280 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70283 DB	'>', 00H
	ORG $+2
$SG70285 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70287 DB	'0', 00H
	ORG $+2
$SG70290 DB	'_EVA_YEAR', 00H
	ORG $+2
$SG70293 DB	'DATEUNIT', 00H
	ORG $+3
$SG70295 DB	'Ann', 0e9H, 'e', 00H
	ORG $+2
$SG70297 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70299 DB	'_EVA_YEAR', 00H
	ORG $+2
$SG70301 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70303 DB	'Mois', 00H
	ORG $+3
$SG70305 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70307 DB	'_EVA_MONTH', 00H
	ORG $+1
$SG70309 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70311 DB	'Sem.', 00H
	ORG $+3
$SG70313 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70315 DB	'_EVA_WEEK', 00H
	ORG $+2
$SG70317 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70319 DB	'Jour', 00H
	ORG $+3
$SG70321 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70323 DB	'_EVA_DAY', 00H
	ORG $+3
$SG70325 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70327 DB	'Heure', 00H
	ORG $+2
$SG70329 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70331 DB	'_EVA_HOUR', 00H
	ORG $+2
$SG70333 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70337 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70341 DB	'0', 00H
	ORG $+2
$SG70345 DB	'P', 00H
	ORG $+2
$SG70348 DB	' ', 00H
	ORG $+2
$SG70350 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70354 DB	'Page pr', 0e9H, 'c', 0e9H, 'dente', 00H
$SG70355 DB	'_eva_btn_arrowl1_small_s.gif', 00H
	ORG $+3
$SG70356 DB	'_eva_btn_arrowl1_small.gif', 00H
	ORG $+1
$SG70359 DB	' ', 00H
	ORG $+2
$SG70361 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70364 DB	'P1', 00H
	ORG $+1
$SG70367 DB	' ', 00H
	ORG $+2
$SG70369 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70373 DB	'P', 0e9H, 'riode pr', 0e9H, 'c', 0e9H, 'dente', 00H
	ORG $+1
$SG70374 DB	'_eva_btn_arrowl_small_s.gif', 00H
$SG70375 DB	'_eva_btn_arrowl_small.gif', 00H
	ORG $+2
$SG70378 DB	'STARTDATE', 00H
	ORG $+2
$SG70383 DB	'''', 00H
	ORG $+2
$SG70384 DB	' <input type=text name=''', 00H
	ORG $+3
$SG70386 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70389 DB	'''', 00H
	ORG $+2
$SG70390 DB	' value=''', 00H
	ORG $+3
$SG70392 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70395 DB	' size=', 00H
	ORG $+1
$SG70397 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70401 DB	' onClick=scwShowSubmit(this,this)', 00H
	ORG $+2
$SG70403 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70406 DB	'> ', 00H
	ORG $+1
$SG70408 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70411 DB	'F1', 00H
	ORG $+1
$SG70415 DB	'P', 0e9H, 'riode suivante', 00H
	ORG $+3
$SG70416 DB	'_eva_btn_arrowr_small_s.gif', 00H
$SG70417 DB	'_eva_btn_arrowr_small.gif', 00H
	ORG $+2
$SG70421 DB	' ', 00H
	ORG $+2
$SG70423 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70426 DB	'F', 00H
	ORG $+2
$SG70430 DB	'Page suivante', 00H
	ORG $+2
$SG70431 DB	'_eva_btn_arrowr1_small_s.gif', 00H
	ORG $+3
$SG70432 DB	'_eva_btn_arrowr1_small.gif', 00H
	ORG $+1
$SG70435 DB	'</nobr></font>', 00H
	ORG $+1
$SG70437 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70439 DB	'DATEUNIT', 00H
	ORG $+3
$SG70441 DB	'MAXLABELS', 00H
	ORG $+2
$SG70443 DB	'STARTDATE', 00H
	ORG $+2
$SG70445 DB	'D:\Travail\ABI\EVA\V4.0\CGI\Brunix-2016\ctrl_output_cale'
	DB	'ndar.c', 00H
	ORG $+1
$SG70446 DB	'ctrl_add_calendar_input', 00H
$SG70448 DB	'D:\Travail\ABI\EVA\V4.0\CGI\Brunix-2016\ctrl_output_cale'
	DB	'ndar.c', 00H
	ORG $+1
$SG70449 DB	'ctrl_add_calendar_input', 00H
_DATA	ENDS
_TEXT	SEGMENT
_cntxt$ = 8
_i_ctrl$ = 12
_datebeg$ = 16
_unit$ = 20
_periods$ = 24
_form$ = -24
_ctrl$ = -140
_options$ = -20
_values$ = -132
_cgival$ = -112
_name$ = -136
_datefmt$ = -92
_html$ = -28
_ctrl_add_calendar_input PROC NEAR

; 77   : ){

	push	ebp
	mov	ebp, esp
	sub	esp, 164				; 000000a4H
	push	edi

; 78   : 	EVA_form *form = cntxt->form;

	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	ecx, DWORD PTR [eax+80]
	mov	DWORD PTR _form$[ebp], ecx

; 79   : 	EVA_ctrl *ctrl = form->ctrl + i_ctrl;

	mov	edx, DWORD PTR _i_ctrl$[ebp]
	imul	edx, 480				; 000001e0H
	mov	eax, DWORD PTR _form$[ebp]
	mov	ecx, DWORD PTR [eax]
	add	ecx, edx
	mov	DWORD PTR _ctrl$[ebp], ecx

; 80   : 	DynTable options = {0};

	mov	DWORD PTR _options$[ebp], 0
	xor	edx, edx
	mov	DWORD PTR _options$[ebp+4], edx
	mov	DWORD PTR _options$[ebp+8], edx
	mov	DWORD PTR _options$[ebp+12], edx
	mov	DWORD PTR _options$[ebp+16], edx

; 81   : 	DynTable values = {0};

	mov	DWORD PTR _values$[ebp], 0
	xor	eax, eax
	mov	DWORD PTR _values$[ebp+4], eax
	mov	DWORD PTR _values$[ebp+8], eax
	mov	DWORD PTR _values$[ebp+12], eax
	mov	DWORD PTR _values$[ebp+16], eax

; 82   : 	DynTable cgival = {0};

	mov	DWORD PTR _cgival$[ebp], 0
	xor	ecx, ecx
	mov	DWORD PTR _cgival$[ebp+4], ecx
	mov	DWORD PTR _cgival$[ebp+8], ecx
	mov	DWORD PTR _cgival$[ebp+12], ecx
	mov	DWORD PTR _cgival$[ebp+16], ecx

; 83   : 	DynBuffer *name = NULL;

	mov	DWORD PTR _name$[ebp], 0

; 84   : 	char datefmt[64] = {0};

	mov	BYTE PTR _datefmt$[ebp], 0
	mov	ecx, 15					; 0000000fH
	xor	eax, eax
	lea	edi, DWORD PTR _datefmt$[ebp+1]
	rep stosd
	stosw
	stosb

; 85   : 	CHECK_HTML_STATUS;

	cmp	DWORD PTR _cntxt$[ebp], 0
	je	SHORT $L71881
	mov	edx, DWORD PTR _cntxt$[ebp]
	cmp	DWORD PTR [edx+80], 0
	je	SHORT $L71879
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	ecx, DWORD PTR [eax+80]
	mov	edx, DWORD PTR [ecx+232]
	mov	DWORD PTR -144+[ebp], edx
	jmp	SHORT $L71880
$L71879:
	mov	DWORD PTR -144+[ebp], 0
$L71880:
	mov	eax, DWORD PTR -144+[ebp]
	mov	DWORD PTR -148+[ebp], eax
	jmp	SHORT $L71882
$L71881:
	mov	DWORD PTR -148+[ebp], 0
$L71882:
	mov	ecx, DWORD PTR -148+[ebp]
	mov	DWORD PTR _html$[ebp], ecx
	cmp	DWORD PTR _html$[ebp], 0
	jne	SHORT $L70264
	xor	eax, eax
	jmp	$L70252
$L70264:

; 86   : 
; 87   : 	/* Output # of periods input */
; 88   : 	if(periods)

	cmp	DWORD PTR _periods$[ebp], 0
	je	$L70282

; 90   : 		CTRL_CGINAMESUBFIELD(&name, NULL, "MAXLABELS");

	push	9
	push	OFFSET FLAT:$SG70268
	push	68					; 00000044H
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
	je	SHORT $L70267
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 90		; 0000005aH
	jmp	$eva_err$70269
$L70267:

; 91   : 		cginame_setkeep(cntxt, name->data, 1);

	push	1
	mov	eax, DWORD PTR _name$[ebp]
	add	eax, 8
	push	eax
	mov	ecx, DWORD PTR _cntxt$[ebp]
	push	ecx
	call	_cginame_setkeep
	add	esp, 12					; 0000000cH

; 92   : 		DYNBUF_ADD3_BUF(html, "<input type=text name='", name, NO_CONV, "' size=2 value=");

	cmp	DWORD PTR _name$[ebp], 0
	je	SHORT $L71883
	mov	edx, DWORD PTR _name$[ebp]
	mov	eax, DWORD PTR [edx+4]
	mov	DWORD PTR -152+[ebp], eax
	jmp	SHORT $L71884
$L71883:
	mov	DWORD PTR -152+[ebp], 0
$L71884:
	cmp	DWORD PTR _name$[ebp], 0
	je	SHORT $L71885
	mov	ecx, DWORD PTR _name$[ebp]
	add	ecx, 8
	mov	DWORD PTR -156+[ebp], ecx
	jmp	SHORT $L71886
$L71885:
	mov	DWORD PTR -156+[ebp], 0
$L71886:
	push	15					; 0000000fH
	push	OFFSET FLAT:$SG70273
	push	0
	push	0
	mov	edx, DWORD PTR -152+[ebp]
	push	edx
	mov	eax, DWORD PTR -156+[ebp]
	push	eax
	push	23					; 00000017H
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
	mov	DWORD PTR [eax+29900], 92		; 0000005cH
	jmp	$eva_err$70269
$L70272:

; 93   : 		if(periods) DYNBUF_ADD_INT(html, periods);

	cmp	DWORD PTR _periods$[ebp], 0
	je	SHORT $L70278
	mov	ecx, DWORD PTR _periods$[ebp]
	push	ecx
	mov	edx, DWORD PTR _html$[ebp]
	push	edx
	call	_dynbuf_add_int
	add	esp, 8
	test	eax, eax
	je	SHORT $L70278
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29872], OFFSET FLAT:$SG70280
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 93		; 0000005dH
	jmp	$eva_err$70269
$L70278:

; 94   : 		DYNBUF_ADD_STR(html, ">");

	push	0
	push	0
	push	1
	push	OFFSET FLAT:$SG70283
	mov	edx, DWORD PTR _html$[ebp]
	push	edx
	call	_dynbuf_add
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L70282
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29872], OFFSET FLAT:$SG70285
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 94		; 0000005eH
	jmp	$eva_err$70269
$L70282:

; 96   : 
; 97   : 	/* Output period unit list input */
; 98   : 	if(strcmp(unit, "0"))

	push	OFFSET FLAT:$SG70287
	mov	edx, DWORD PTR _unit$[ebp]
	push	edx
	call	_strcmp
	add	esp, 8
	test	eax, eax
	je	$L70339

; 100  : 		if(!unit || !*unit) unit = "_EVA_YEAR";

	cmp	DWORD PTR _unit$[ebp], 0
	je	SHORT $L70289
	mov	eax, DWORD PTR _unit$[ebp]
	movsx	ecx, BYTE PTR [eax]
	test	ecx, ecx
	jne	SHORT $L70288
$L70289:
	mov	DWORD PTR _unit$[ebp], OFFSET FLAT:$SG70290
$L70288:

; 101  : 		CTRL_CGINAMESUBFIELD(&name, NULL, "DATEUNIT");

	push	8
	push	OFFSET FLAT:$SG70293
	push	68					; 00000044H
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
	je	SHORT $L70292
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 101		; 00000065H
	jmp	$eva_err$70269
$L70292:

; 102  : 		cginame_setkeep(cntxt, name->data, 1);

	push	1
	mov	eax, DWORD PTR _name$[ebp]
	add	eax, 8
	push	eax
	mov	ecx, DWORD PTR _cntxt$[ebp]
	push	ecx
	call	_cginame_setkeep
	add	esp, 12					; 0000000cH

; 103  : 		DYNTAB_ADD_STR(&options, 0, 1, "Année");

	push	5
	push	OFFSET FLAT:$SG70295
	push	1
	push	0
	lea	edx, DWORD PTR _options$[ebp]
	push	edx
	call	_dyntab_set_txt
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L70294
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29872], OFFSET FLAT:$SG70297
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 103		; 00000067H
	jmp	$eva_err$70269
$L70294:

; 104  : 		DYNTAB_ADD_STR(&options, 0, 0, "_EVA_YEAR");

	push	9
	push	OFFSET FLAT:$SG70299
	push	0
	push	0
	lea	edx, DWORD PTR _options$[ebp]
	push	edx
	call	_dyntab_set_txt
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L70298
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29872], OFFSET FLAT:$SG70301
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 104		; 00000068H
	jmp	$eva_err$70269
$L70298:

; 105  : 		DYNTAB_ADD_STR(&options, 1, 1, "Mois");

	push	4
	push	OFFSET FLAT:$SG70303
	push	1
	push	1
	lea	edx, DWORD PTR _options$[ebp]
	push	edx
	call	_dyntab_set_txt
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L70302
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29872], OFFSET FLAT:$SG70305
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 105		; 00000069H
	jmp	$eva_err$70269
$L70302:

; 106  : 		DYNTAB_ADD_STR(&options, 1, 0, "_EVA_MONTH");

	push	10					; 0000000aH
	push	OFFSET FLAT:$SG70307
	push	0
	push	1
	lea	edx, DWORD PTR _options$[ebp]
	push	edx
	call	_dyntab_set_txt
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L70306
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29872], OFFSET FLAT:$SG70309
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 106		; 0000006aH
	jmp	$eva_err$70269
$L70306:

; 107  : 		DYNTAB_ADD_STR(&options, 2, 1, "Sem.");

	push	4
	push	OFFSET FLAT:$SG70311
	push	1
	push	2
	lea	edx, DWORD PTR _options$[ebp]
	push	edx
	call	_dyntab_set_txt
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L70310
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29872], OFFSET FLAT:$SG70313
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 107		; 0000006bH
	jmp	$eva_err$70269
$L70310:

; 108  : 		DYNTAB_ADD_STR(&options, 2, 0, "_EVA_WEEK");

	push	9
	push	OFFSET FLAT:$SG70315
	push	0
	push	2
	lea	edx, DWORD PTR _options$[ebp]
	push	edx
	call	_dyntab_set_txt
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L70314
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29872], OFFSET FLAT:$SG70317
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 108		; 0000006cH
	jmp	$eva_err$70269
$L70314:

; 109  : 		DYNTAB_ADD_STR(&options, 3, 1, "Jour");

	push	4
	push	OFFSET FLAT:$SG70319
	push	1
	push	3
	lea	edx, DWORD PTR _options$[ebp]
	push	edx
	call	_dyntab_set_txt
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L70318
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29872], OFFSET FLAT:$SG70321
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 109		; 0000006dH
	jmp	$eva_err$70269
$L70318:

; 110  : 		DYNTAB_ADD_STR(&options, 3, 0, "_EVA_DAY");

	push	8
	push	OFFSET FLAT:$SG70323
	push	0
	push	3
	lea	edx, DWORD PTR _options$[ebp]
	push	edx
	call	_dyntab_set_txt
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L70322
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29872], OFFSET FLAT:$SG70325
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 110		; 0000006eH
	jmp	$eva_err$70269
$L70322:

; 111  : 		DYNTAB_ADD_STR(&options, 4, 1, "Heure");

	push	5
	push	OFFSET FLAT:$SG70327
	push	1
	push	4
	lea	edx, DWORD PTR _options$[ebp]
	push	edx
	call	_dyntab_set_txt
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L70326
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29872], OFFSET FLAT:$SG70329
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 111		; 0000006fH
	jmp	$eva_err$70269
$L70326:

; 112  : 		DYNTAB_ADD_STR(&options, 4, 0, "_EVA_HOUR");

	push	9
	push	OFFSET FLAT:$SG70331
	push	0
	push	4
	lea	edx, DWORD PTR _options$[ebp]
	push	edx
	call	_dyntab_set_txt
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L70330
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29872], OFFSET FLAT:$SG70333
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 112		; 00000070H
	jmp	$eva_err$70269
$L70330:

; 113  : 		DYNTAB_ADD(&values, 0, 0, unit, 0, NO_CONV);

	push	0
	push	0
	push	0
	mov	edx, DWORD PTR _unit$[ebp]
	push	edx
	push	0
	push	0
	lea	eax, DWORD PTR _values$[ebp]
	push	eax
	call	_dyntab_add
	add	esp, 28					; 0000001cH
	test	eax, eax
	je	SHORT $L70335
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29872], OFFSET FLAT:$SG70337
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 113		; 00000071H
	jmp	$eva_err$70269
$L70335:

; 114  : 		if(put_html_list(cntxt, name, &options, &values, 1, 0, 0, 1, 1, NULL)) STACK_ERROR;

	push	0
	push	1
	push	1
	push	0
	push	0
	push	1
	lea	eax, DWORD PTR _values$[ebp]
	push	eax
	lea	ecx, DWORD PTR _options$[ebp]
	push	ecx
	mov	edx, DWORD PTR _name$[ebp]
	push	edx
	mov	eax, DWORD PTR _cntxt$[ebp]
	push	eax
	call	_put_html_list
	add	esp, 40					; 00000028H
	test	eax, eax
	je	SHORT $L70339
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 114		; 00000072H
	jmp	$eva_err$70269
$L70339:

; 116  : 
; 117  : 	/* If start date given */
; 118  : 	if(strcmp(datebeg, "0"))

	push	OFFSET FLAT:$SG70341
	mov	edx, DWORD PTR _datebeg$[ebp]
	push	edx
	call	_strcmp
	add	esp, 8
	test	eax, eax
	je	$L70434

; 120  : 		/* Output period left shift buttons */
; 121  : 		if(periods)

	cmp	DWORD PTR _periods$[ebp], 0
	je	$L70358

; 123  : 			CTRL_CGINAMEBTN(&name, NULL, add_sz_str("P"));

	push	1
	push	OFFSET FLAT:$SG70345
	push	66					; 00000042H
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
	je	SHORT $L70344
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 123		; 0000007bH
	jmp	$eva_err$70269
$L70344:

; 124  : 			DYNBUF_ADD_STR(html, " ");

	push	0
	push	0
	push	1
	push	OFFSET FLAT:$SG70348
	mov	ecx, DWORD PTR _html$[ebp]
	push	ecx
	call	_dynbuf_add
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L70347
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29872], OFFSET FLAT:$SG70350
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 124		; 0000007cH
	jmp	$eva_err$70269
$L70347:

; 125  : 			if(put_html_button(cntxt, name->data, NULL, "_eva_btn_arrowl1_small.gif", "_eva_btn_arrowl1_small_s.gif",
; 126  : 												"Page précédente", 0, 0)) STACK_ERROR;

	push	0
	push	0
	push	0
	push	0
	push	0
	push	OFFSET FLAT:$SG70354
	push	OFFSET FLAT:$SG70355
	push	OFFSET FLAT:$SG70356
	push	0
	mov	ecx, DWORD PTR _name$[ebp]
	add	ecx, 8
	push	ecx
	mov	edx, DWORD PTR _cntxt$[ebp]
	push	edx
	call	_put_html_button_sz
	add	esp, 44					; 0000002cH
	test	eax, eax
	je	SHORT $L70353
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 126		; 0000007eH
	jmp	$eva_err$70269
$L70353:

; 127  : 			DYNBUF_ADD_STR(html, " ");

	push	0
	push	0
	push	1
	push	OFFSET FLAT:$SG70359
	mov	ecx, DWORD PTR _html$[ebp]
	push	ecx
	call	_dynbuf_add
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L70358
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29872], OFFSET FLAT:$SG70361
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 127		; 0000007fH
	jmp	$eva_err$70269
$L70358:

; 129  : 		CTRL_CGINAMEBTN(&name, NULL, add_sz_str("P1"));

	push	2
	push	OFFSET FLAT:$SG70364
	push	66					; 00000042H
	lea	ecx, DWORD PTR _name$[ebp]
	push	ecx
	push	1
	push	0
	mov	edx, DWORD PTR _ctrl$[ebp]
	push	edx
	mov	eax, DWORD PTR _cntxt$[ebp]
	push	eax
	call	_ctrl_cgi_name
	add	esp, 32					; 00000020H
	test	eax, eax
	je	SHORT $L70363
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 129		; 00000081H
	jmp	$eva_err$70269
$L70363:

; 130  : 		DYNBUF_ADD_STR(html, " ");

	push	0
	push	0
	push	1
	push	OFFSET FLAT:$SG70367
	mov	edx, DWORD PTR _html$[ebp]
	push	edx
	call	_dynbuf_add
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L70366
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29872], OFFSET FLAT:$SG70369
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 130		; 00000082H
	jmp	$eva_err$70269
$L70366:

; 131  : 		if(put_html_button(cntxt, name->data, NULL, "_eva_btn_arrowl_small.gif", "_eva_btn_arrowl_small_s.gif",
; 132  : 											"Période précédente", 0, 0)) STACK_ERROR;

	push	0
	push	0
	push	0
	push	0
	push	0
	push	OFFSET FLAT:$SG70373
	push	OFFSET FLAT:$SG70374
	push	OFFSET FLAT:$SG70375
	push	0
	mov	edx, DWORD PTR _name$[ebp]
	add	edx, 8
	push	edx
	mov	eax, DWORD PTR _cntxt$[ebp]
	push	eax
	call	_put_html_button_sz
	add	esp, 44					; 0000002cH
	test	eax, eax
	je	SHORT $L70372
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 132		; 00000084H
	jmp	$eva_err$70269
$L70372:

; 133  : 
; 134  : 		/* Output start date input */
; 135  : 		CTRL_CGINAMESUBFIELD(&name, NULL, "STARTDATE");

	push	9
	push	OFFSET FLAT:$SG70378
	push	68					; 00000044H
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
	je	SHORT $L70377
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 135		; 00000087H
	jmp	$eva_err$70269
$L70377:

; 136  : 		cginame_setkeep(cntxt, name->data, 1);

	push	1
	mov	eax, DWORD PTR _name$[ebp]
	add	eax, 8
	push	eax
	mov	ecx, DWORD PTR _cntxt$[ebp]
	push	ecx
	call	_cginame_setkeep
	add	esp, 12					; 0000000cH

; 137  : 		datetxt_to_format(cntxt, datefmt, datebeg, NULL);

	push	0
	mov	edx, DWORD PTR _datebeg$[ebp]
	push	edx
	lea	eax, DWORD PTR _datefmt$[ebp]
	push	eax
	mov	ecx, DWORD PTR _cntxt$[ebp]
	push	ecx
	call	_datetxt_to_format
	add	esp, 16					; 00000010H

; 138  : 		DYNBUF_ADD3_BUF(html, " <input type=text name='", name, NO_CONV, "'");

	cmp	DWORD PTR _name$[ebp], 0
	je	SHORT $L71887
	mov	edx, DWORD PTR _name$[ebp]
	mov	eax, DWORD PTR [edx+4]
	mov	DWORD PTR -160+[ebp], eax
	jmp	SHORT $L71888
$L71887:
	mov	DWORD PTR -160+[ebp], 0
$L71888:
	cmp	DWORD PTR _name$[ebp], 0
	je	SHORT $L71889
	mov	ecx, DWORD PTR _name$[ebp]
	add	ecx, 8
	mov	DWORD PTR -164+[ebp], ecx
	jmp	SHORT $L71890
$L71889:
	mov	DWORD PTR -164+[ebp], 0
$L71890:
	push	1
	push	OFFSET FLAT:$SG70383
	push	0
	push	0
	mov	edx, DWORD PTR -160+[ebp]
	push	edx
	mov	eax, DWORD PTR -164+[ebp]
	push	eax
	push	24					; 00000018H
	push	OFFSET FLAT:$SG70384
	mov	ecx, DWORD PTR _html$[ebp]
	push	ecx
	call	_dynbuf_add3
	add	esp, 36					; 00000024H
	test	eax, eax
	je	SHORT $L70382
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29872], OFFSET FLAT:$SG70386
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 138		; 0000008aH
	jmp	$eva_err$70269
$L70382:

; 139  : 		DYNBUF_ADD3(html, " value='", datefmt, 0, NO_CONV, "'");

	push	1
	push	OFFSET FLAT:$SG70389
	push	0
	push	0
	push	0
	lea	ecx, DWORD PTR _datefmt$[ebp]
	push	ecx
	push	8
	push	OFFSET FLAT:$SG70390
	mov	edx, DWORD PTR _html$[ebp]
	push	edx
	call	_dynbuf_add3
	add	esp, 36					; 00000024H
	test	eax, eax
	je	SHORT $L70388
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29872], OFFSET FLAT:$SG70392
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 139		; 0000008bH
	jmp	$eva_err$70269
$L70388:

; 140  : 		DYNBUF_ADD3_INT(html, " size=", strlen(datefmt) + 1, "");

	push	0
	push	OFFSET FLAT:$SG70394
	lea	edx, DWORD PTR _datefmt$[ebp]
	push	edx
	call	_strlen
	add	esp, 4
	add	eax, 1
	push	eax
	push	6
	push	OFFSET FLAT:$SG70395
	mov	eax, DWORD PTR _html$[ebp]
	push	eax
	call	_dynbuf_add3_int
	add	esp, 24					; 00000018H
	test	eax, eax
	je	SHORT $L70393
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29872], OFFSET FLAT:$SG70397
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 140		; 0000008cH
	jmp	$eva_err$70269
$L70393:

; 141  : 		if(cntxt->jsenabled && unit[5]!='Y' && unit[5]!='M')

	mov	eax, DWORD PTR _cntxt$[ebp]
	cmp	DWORD PTR [eax+29676], 0
	je	SHORT $L70400
	mov	ecx, DWORD PTR _unit$[ebp]
	movsx	edx, BYTE PTR [ecx+5]
	cmp	edx, 89					; 00000059H
	je	SHORT $L70400
	mov	eax, DWORD PTR _unit$[ebp]
	movsx	ecx, BYTE PTR [eax+5]
	cmp	ecx, 77					; 0000004dH
	je	SHORT $L70400

; 143  : 			cntxt->jsCalendarInput = 1;

	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29684], 1

; 144  : 			DYNBUF_ADD_STR(html, " onClick=scwShowSubmit(this,this)");

	push	0
	push	0
	push	33					; 00000021H
	push	OFFSET FLAT:$SG70401
	mov	eax, DWORD PTR _html$[ebp]
	push	eax
	call	_dynbuf_add
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L70400
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29872], OFFSET FLAT:$SG70403
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 144		; 00000090H
	jmp	$eva_err$70269
$L70400:

; 146  : 		DYNBUF_ADD_STR(html, "> ");

	push	0
	push	0
	push	2
	push	OFFSET FLAT:$SG70406
	mov	eax, DWORD PTR _html$[ebp]
	push	eax
	call	_dynbuf_add
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L70405
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29872], OFFSET FLAT:$SG70408
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 146		; 00000092H
	jmp	$eva_err$70269
$L70405:

; 147  : 
; 148  : 		/* Output period right shift buttons */
; 149  : 		CTRL_CGINAMEBTN(&name, NULL, add_sz_str("F1"));

	push	2
	push	OFFSET FLAT:$SG70411
	push	66					; 00000042H
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
	je	SHORT $L70410
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 149		; 00000095H
	jmp	$eva_err$70269
$L70410:

; 150  : 		if(put_html_button(cntxt, name->data, NULL, "_eva_btn_arrowr_small.gif", "_eva_btn_arrowr_small_s.gif",
; 151  : 											"Période suivante", 0, 0)) STACK_ERROR;

	push	0
	push	0
	push	0
	push	0
	push	0
	push	OFFSET FLAT:$SG70415
	push	OFFSET FLAT:$SG70416
	push	OFFSET FLAT:$SG70417
	push	0
	mov	ecx, DWORD PTR _name$[ebp]
	add	ecx, 8
	push	ecx
	mov	edx, DWORD PTR _cntxt$[ebp]
	push	edx
	call	_put_html_button_sz
	add	esp, 44					; 0000002cH
	test	eax, eax
	je	SHORT $L70414
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 151		; 00000097H
	jmp	$eva_err$70269
$L70414:

; 152  : 		if(periods)

	cmp	DWORD PTR _periods$[ebp], 0
	je	$L70429

; 154  : 			DYNBUF_ADD_STR(html, " ");

	push	0
	push	0
	push	1
	push	OFFSET FLAT:$SG70421
	mov	ecx, DWORD PTR _html$[ebp]
	push	ecx
	call	_dynbuf_add
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L70420
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29872], OFFSET FLAT:$SG70423
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 154		; 0000009aH
	jmp	$eva_err$70269
$L70420:

; 155  : 			CTRL_CGINAMEBTN(&name, NULL, add_sz_str("F"));

	push	1
	push	OFFSET FLAT:$SG70426
	push	66					; 00000042H
	lea	ecx, DWORD PTR _name$[ebp]
	push	ecx
	push	1
	push	0
	mov	edx, DWORD PTR _ctrl$[ebp]
	push	edx
	mov	eax, DWORD PTR _cntxt$[ebp]
	push	eax
	call	_ctrl_cgi_name
	add	esp, 32					; 00000020H
	test	eax, eax
	je	SHORT $L70425
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 155		; 0000009bH
	jmp	$eva_err$70269
$L70425:

; 156  : 			if(put_html_button(cntxt, name->data, NULL, "_eva_btn_arrowr1_small.gif", "_eva_btn_arrowr1_small_s.gif",
; 157  : 												"Page suivante", 0, 0)) STACK_ERROR;

	push	0
	push	0
	push	0
	push	0
	push	0
	push	OFFSET FLAT:$SG70430
	push	OFFSET FLAT:$SG70431
	push	OFFSET FLAT:$SG70432
	push	0
	mov	edx, DWORD PTR _name$[ebp]
	add	edx, 8
	push	edx
	mov	eax, DWORD PTR _cntxt$[ebp]
	push	eax
	call	_put_html_button_sz
	add	esp, 44					; 0000002cH
	test	eax, eax
	je	SHORT $L70429
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 157		; 0000009dH
	jmp	$eva_err$70269
$L70429:

; 159  : 		DYNBUF_ADD_STR(html, "</nobr></font>");

	push	0
	push	0
	push	14					; 0000000eH
	push	OFFSET FLAT:$SG70435
	mov	edx, DWORD PTR _html$[ebp]
	push	edx
	call	_dynbuf_add
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L70434
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29872], OFFSET FLAT:$SG70437
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 159		; 0000009fH
	jmp	$eva_err$70269
$L70434:

; 161  : 
; 162  : 	/* Cleanup CGI subfields */
; 163  : 	CTRL_GET_CGI_SUBFIELD("DATEUNIT");

	push	0
	push	0
	push	0
	push	OFFSET FLAT:$SG70439
	mov	edx, DWORD PTR _ctrl$[ebp]
	push	edx
	lea	eax, DWORD PTR _cgival$[ebp]
	push	eax
	mov	ecx, DWORD PTR _cntxt$[ebp]
	push	ecx
	call	_cgi_get_subfield
	add	esp, 28					; 0000001cH
	test	eax, eax
	je	SHORT $L70438
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 163		; 000000a3H
	jmp	$eva_err$70269
$L70438:

; 164  : 	CTRL_GET_CGI_SUBFIELD("MAXLABELS");

	push	0
	push	0
	push	0
	push	OFFSET FLAT:$SG70441
	mov	eax, DWORD PTR _ctrl$[ebp]
	push	eax
	lea	ecx, DWORD PTR _cgival$[ebp]
	push	ecx
	mov	edx, DWORD PTR _cntxt$[ebp]
	push	edx
	call	_cgi_get_subfield
	add	esp, 28					; 0000001cH
	test	eax, eax
	je	SHORT $L70440
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 164		; 000000a4H
	jmp	SHORT $eva_err$70269
$L70440:

; 165  : 	CTRL_GET_CGI_SUBFIELD("STARTDATE");

	push	0
	push	0
	push	0
	push	OFFSET FLAT:$SG70443
	mov	ecx, DWORD PTR _ctrl$[ebp]
	push	ecx
	lea	edx, DWORD PTR _cgival$[ebp]
	push	edx
	mov	eax, DWORD PTR _cntxt$[ebp]
	push	eax
	call	_cgi_get_subfield
	add	esp, 28					; 0000001cH
	test	eax, eax
	je	SHORT $L70442
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 165		; 000000a5H
	jmp	SHORT $eva_err$70269
$L70442:
$eva_noerr$70444:

; 166  : 
; 167  : 	RETURN_OK_CLEANUP;

	push	0
	push	OFFSET FLAT:$SG70445
	push	OFFSET FLAT:$SG70446
	mov	edx, DWORD PTR _cntxt$[ebp]
	push	edx
	call	_err_clear
	add	esp, 16					; 00000010H
$eva_err$70269:
	mov	eax, DWORD PTR _cntxt$[ebp]
	cmp	DWORD PTR [eax+29872], 0
	je	SHORT $L70447
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	edx, DWORD PTR [ecx+29900]
	push	edx
	push	OFFSET FLAT:$SG70448
	push	OFFSET FLAT:$SG70449
	mov	eax, DWORD PTR _cntxt$[ebp]
	push	eax
	call	_err_add_context
	add	esp, 16					; 00000010H
$L70447:
	lea	ecx, DWORD PTR _options$[ebp]
	push	ecx
	call	_dyntab_free
	add	esp, 4
	lea	edx, DWORD PTR _values$[ebp]
	push	edx
	call	_dyntab_free
	add	esp, 4
	lea	eax, DWORD PTR _cgival$[ebp]
	push	eax
	call	_dyntab_free
	add	esp, 4
	mov	ecx, DWORD PTR _name$[ebp]
	push	ecx
	call	_mem_free
	add	esp, 4
	mov	DWORD PTR _name$[ebp], 0
	mov	edx, DWORD PTR _cntxt$[ebp]
	xor	eax, eax
	cmp	DWORD PTR [edx+29872], 0
	setne	al
$L70252:

; 168  : }

	pop	edi
	mov	esp, ebp
	pop	ebp
	ret	0
_ctrl_add_calendar_input ENDP
_TEXT	ENDS
PUBLIC	_ctrl_get_calendar_input
EXTRN	_input_to_datetxt:NEAR
EXTRN	_delay_to_datetxt:NEAR
EXTRN	_strtoul:NEAR
EXTRN	_dyntab_sz:NEAR
EXTRN	_dyntab_val:NEAR
EXTRN	_strcpy:NEAR
EXTRN	_strchr:NEAR
EXTRN	_strncmp:NEAR
_BSS	SEGMENT
	ALIGN	4

$SG70470 DB	01H DUP (?)
	ALIGN	4

$SG70471 DB	01H DUP (?)
_BSS	ENDS
_DATA	SEGMENT
$SG70475 DB	'MAXLABELS', 00H
	ORG $+2
$SG70481 DB	'DATEUNIT', 00H
	ORG $+3
$SG70485 DB	'STARTDATE', 00H
	ORG $+2
$SG70488 DB	'FP', 00H
	ORG $+1
$SG70495 DB	'GOYEAR', 00H
	ORG $+1
$SG70496 DB	'_EVA_YEAR', 00H
	ORG $+2
$SG70499 DB	'GOMONTH', 00H
$SG70500 DB	'_EVA_MONTH', 00H
	ORG $+1
$SG70503 DB	'GOWEEK', 00H
	ORG $+1
$SG70504 DB	'_EVA_WEEK', 00H
	ORG $+2
$SG70507 DB	'GODAY', 00H
	ORG $+2
$SG70508 DB	'_EVA_DAY', 00H
	ORG $+3
$SG70510 DB	'D:\Travail\ABI\EVA\V4.0\CGI\Brunix-2016\ctrl_output_cale'
	DB	'ndar.c', 00H
	ORG $+1
$SG70511 DB	'ctrl_get_calendar_input', 00H
$SG70513 DB	'D:\Travail\ABI\EVA\V4.0\CGI\Brunix-2016\ctrl_output_cale'
	DB	'ndar.c', 00H
	ORG $+1
$SG70514 DB	'ctrl_get_calendar_input', 00H
_DATA	ENDS
_TEXT	SEGMENT
_cntxt$ = 8
_i_ctrl$ = 12
_ctldate$ = 16
_datebeg$ = 20
_unit$ = 24
_periods$ = 28
_form$ = -4
_ctrl$ = -36
_cgival$ = -32
_btn$ = -12
_period$ = -8
_date$70489 = -60
_fmt$70490 = -40
_tr$70491 = -64
_offset$70492 = -44
_ctrl_get_calendar_input PROC NEAR

; 185  : ){

	push	ebp
	mov	ebp, esp
	sub	esp, 80					; 00000050H

; 186  : 	EVA_form *form = cntxt->form;

	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	ecx, DWORD PTR [eax+80]
	mov	DWORD PTR _form$[ebp], ecx

; 187  : 	EVA_ctrl *ctrl = form->ctrl + i_ctrl;

	mov	edx, DWORD PTR _i_ctrl$[ebp]
	imul	edx, 480				; 000001e0H
	mov	eax, DWORD PTR _form$[ebp]
	mov	ecx, DWORD PTR [eax]
	add	ecx, edx
	mov	DWORD PTR _ctrl$[ebp], ecx

; 188  : 	DynTable cgival = {0};

	mov	DWORD PTR _cgival$[ebp], 0
	xor	edx, edx
	mov	DWORD PTR _cgival$[ebp+4], edx
	mov	DWORD PTR _cgival$[ebp+8], edx
	mov	DWORD PTR _cgival$[ebp+12], edx
	mov	DWORD PTR _cgival$[ebp+16], edx

; 189  : 	char *btn = i_ctrl == form->i_ctrl_clic ? CGI_CLICK_BTN_SUBFIELD : "";

	mov	eax, DWORD PTR _form$[ebp]
	mov	ecx, DWORD PTR _i_ctrl$[ebp]
	cmp	ecx, DWORD PTR [eax+124]
	jne	SHORT $L71894
	mov	edx, DWORD PTR _cntxt$[ebp]
	cmp	DWORD PTR [edx+29648], 0
	je	SHORT $L71892
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	ecx, DWORD PTR [eax+29656]
	imul	ecx, 56					; 00000038H
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	eax, DWORD PTR [edx+29648]
	mov	ecx, DWORD PTR [eax+ecx]
	movsx	edx, BYTE PTR [ecx]
	cmp	edx, 66					; 00000042H
	jne	SHORT $L71892
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	ecx, DWORD PTR [eax+29656]
	imul	ecx, 56					; 00000038H
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	eax, DWORD PTR [edx+29648]
	cmp	DWORD PTR [eax+ecx+32], 0
	je	SHORT $L71892
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	edx, DWORD PTR [ecx+29656]
	imul	edx, 56					; 00000038H
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	ecx, DWORD PTR [eax+29648]
	mov	edx, DWORD PTR [ecx+edx+32]
	mov	DWORD PTR -68+[ebp], edx
	jmp	SHORT $L71893
$L71892:
	mov	DWORD PTR -68+[ebp], OFFSET FLAT:$SG70470
$L71893:
	mov	eax, DWORD PTR -68+[ebp]
	mov	DWORD PTR -72+[ebp], eax
	jmp	SHORT $L71895
$L71894:
	mov	DWORD PTR -72+[ebp], OFFSET FLAT:$SG70471
$L71895:
	mov	ecx, DWORD PTR -72+[ebp]
	mov	DWORD PTR _btn$[ebp], ecx

; 190  : 	unsigned long period = 1;

	mov	DWORD PTR _period$[ebp], 1

; 191  : 
; 192  : 	/* Read # of periods */
; 193  : 	if(periods && ctldate & CtlMaxLabels)

	cmp	DWORD PTR _periods$[ebp], 0
	je	SHORT $L70473
	mov	edx, DWORD PTR _ctldate$[ebp]
	and	edx, 128				; 00000080H
	test	edx, edx
	je	SHORT $L70473

; 195  : 		CTRL_GET_CGI_SUBFIELD1("MAXLABELS");

	push	0
	push	0
	push	1
	push	OFFSET FLAT:$SG70475
	mov	eax, DWORD PTR _ctrl$[ebp]
	push	eax
	lea	ecx, DWORD PTR _cgival$[ebp]
	push	ecx
	mov	edx, DWORD PTR _cntxt$[ebp]
	push	edx
	call	_cgi_get_subfield
	add	esp, 28					; 0000001cH
	test	eax, eax
	je	SHORT $L70474
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 195		; 000000c3H
	jmp	$eva_err$70476
$L70474:

; 196  : 		if(dyntab_sz(&cgival, 0, 0)) *periods = strtoul(dyntab_val(&cgival, 0, 0), NULL, 10);

	push	0
	push	0
	lea	ecx, DWORD PTR _cgival$[ebp]
	push	ecx
	call	_dyntab_sz
	add	esp, 12					; 0000000cH
	test	eax, eax
	je	SHORT $L70477
	push	10					; 0000000aH
	push	0
	push	0
	push	0
	lea	edx, DWORD PTR _cgival$[ebp]
	push	edx
	call	_dyntab_val
	add	esp, 12					; 0000000cH
	push	eax
	call	_strtoul
	add	esp, 12					; 0000000cH
	mov	ecx, DWORD PTR _periods$[ebp]
	mov	DWORD PTR [ecx], eax
$L70477:

; 198  : 	else periods = &period;

	jmp	SHORT $L70479
$L70473:
	lea	edx, DWORD PTR _period$[ebp]
	mov	DWORD PTR _periods$[ebp], edx
$L70479:

; 199  : 
; 200  : 	/* Read period unit */
; 201  : 	CTRL_GET_CGI_SUBFIELD1("DATEUNIT");

	push	0
	push	0
	push	1
	push	OFFSET FLAT:$SG70481
	mov	eax, DWORD PTR _ctrl$[ebp]
	push	eax
	lea	ecx, DWORD PTR _cgival$[ebp]
	push	ecx
	mov	edx, DWORD PTR _cntxt$[ebp]
	push	edx
	call	_cgi_get_subfield
	add	esp, 28					; 0000001cH
	test	eax, eax
	je	SHORT $L70480
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 201		; 000000c9H
	jmp	$eva_err$70476
$L70480:

; 202  : 	if(dyntab_sz(&cgival, 0, 0)) *unit = dyntab_val(&cgival, 0, 0);

	push	0
	push	0
	lea	ecx, DWORD PTR _cgival$[ebp]
	push	ecx
	call	_dyntab_sz
	add	esp, 12					; 0000000cH
	test	eax, eax
	je	SHORT $L70482
	push	0
	push	0
	lea	edx, DWORD PTR _cgival$[ebp]
	push	edx
	call	_dyntab_val
	add	esp, 12					; 0000000cH
	mov	ecx, DWORD PTR _unit$[ebp]
	mov	DWORD PTR [ecx], eax
$L70482:

; 203  : 
; 204  : 	/* Read start date */
; 205  : 	if(ctldate & CtlDateInput)

	mov	edx, DWORD PTR _ctldate$[ebp]
	and	edx, 1
	test	edx, edx
	je	SHORT $L70486

; 207  : 		CTRL_GET_CGI_SUBFIELD1("STARTDATE");

	push	0
	push	0
	push	1
	push	OFFSET FLAT:$SG70485
	mov	eax, DWORD PTR _ctrl$[ebp]
	push	eax
	lea	ecx, DWORD PTR _cgival$[ebp]
	push	ecx
	mov	edx, DWORD PTR _cntxt$[ebp]
	push	edx
	call	_cgi_get_subfield
	add	esp, 28					; 0000001cH
	test	eax, eax
	je	SHORT $L70484
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 207		; 000000cfH
	jmp	$eva_err$70476
$L70484:

; 208  : 		if(dyntab_sz(&cgival, 0, 0))

	push	0
	push	0
	lea	ecx, DWORD PTR _cgival$[ebp]
	push	ecx
	call	_dyntab_sz
	add	esp, 12					; 0000000cH
	test	eax, eax
	je	SHORT $L70486

; 209  : 			input_to_datetxt(dyntab_val(&cgival, 0, 0), datebeg);

	mov	edx, DWORD PTR _datebeg$[ebp]
	push	edx
	push	0
	push	0
	lea	eax, DWORD PTR _cgival$[ebp]
	push	eax
	call	_dyntab_val
	add	esp, 12					; 0000000cH
	push	eax
	call	_input_to_datetxt
	add	esp, 8
$L70486:

; 211  : 
; 212  : 	/* Handle buttons clicks : shift datebeg */
; 213  : 	if((ctldate & CtlUpDownArrows) && *btn && strlen(btn) < 3 && strchr("FP", *btn) && unit && *unit && strlen(*unit) > 7)

	mov	ecx, DWORD PTR _ctldate$[ebp]
	and	ecx, 4
	test	ecx, ecx
	je	$L70487
	mov	edx, DWORD PTR _btn$[ebp]
	movsx	eax, BYTE PTR [edx]
	test	eax, eax
	je	$L70487
	mov	ecx, DWORD PTR _btn$[ebp]
	push	ecx
	call	_strlen
	add	esp, 4
	cmp	eax, 3
	jae	$L70487
	mov	edx, DWORD PTR _btn$[ebp]
	movsx	eax, BYTE PTR [edx]
	push	eax
	push	OFFSET FLAT:$SG70488
	call	_strchr
	add	esp, 8
	test	eax, eax
	je	$L70487
	cmp	DWORD PTR _unit$[ebp], 0
	je	$L70487
	mov	ecx, DWORD PTR _unit$[ebp]
	cmp	DWORD PTR [ecx], 0
	je	$L70487
	mov	edx, DWORD PTR _unit$[ebp]
	mov	eax, DWORD PTR [edx]
	push	eax
	call	_strlen
	add	esp, 4
	cmp	eax, 7
	jbe	$L70487

; 215  : 		char date[16];
; 216  : 		char fmt = (*unit)[5];

	mov	ecx, DWORD PTR _unit$[ebp]
	mov	edx, DWORD PTR [ecx]
	mov	al, BYTE PTR [edx+5]
	mov	BYTE PTR _fmt$70490[ebp], al

; 217  : 		size_t tr = fmt == 'Y' ? 4 : fmt == 'M' ? 6 : 8;

	movsx	ecx, BYTE PTR _fmt$70490[ebp]
	cmp	ecx, 89					; 00000059H
	jne	SHORT $L71896
	mov	DWORD PTR -76+[ebp], 4
	jmp	SHORT $L71897
$L71896:
	movsx	edx, BYTE PTR _fmt$70490[ebp]
	sub	edx, 77					; 0000004dH
	neg	edx
	sbb	edx, edx
	and	edx, 2
	add	edx, 6
	mov	DWORD PTR -76+[ebp], edx
$L71897:
	mov	eax, DWORD PTR -76+[ebp]
	mov	DWORD PTR _tr$70491[ebp], eax

; 218  : 		int offset = (*btn == 'P' ? -1 : 1) * (btn[1] ? 1 : *periods) * (fmt == 'W' ? 7 : 1);

	mov	ecx, DWORD PTR _btn$[ebp]
	movsx	edx, BYTE PTR [ecx+1]
	test	edx, edx
	je	SHORT $L71898
	mov	DWORD PTR -80+[ebp], 1
	jmp	SHORT $L71899
$L71898:
	mov	eax, DWORD PTR _periods$[ebp]
	mov	ecx, DWORD PTR [eax]
	mov	DWORD PTR -80+[ebp], ecx
$L71899:
	mov	edx, DWORD PTR _btn$[ebp]
	movsx	eax, BYTE PTR [edx]
	sub	eax, 80					; 00000050H
	neg	eax
	sbb	eax, eax
	and	eax, 2
	add	eax, -1
	imul	eax, DWORD PTR -80+[ebp]
	movsx	ecx, BYTE PTR _fmt$70490[ebp]
	sub	ecx, 87					; 00000057H
	neg	ecx
	sbb	ecx, ecx
	and	ecx, -6					; fffffffaH
	add	ecx, 7
	imul	eax, ecx
	mov	DWORD PTR _offset$70492[ebp], eax

; 219  : 		if(fmt == 'W') fmt = 'D';

	movsx	edx, BYTE PTR _fmt$70490[ebp]
	cmp	edx, 87					; 00000057H
	jne	SHORT $L70493
	mov	BYTE PTR _fmt$70490[ebp], 68		; 00000044H
$L70493:

; 220  : 		delay_to_datetxt(date, datebeg, offset, fmt);

	mov	al, BYTE PTR _fmt$70490[ebp]
	push	eax
	mov	ecx, DWORD PTR _offset$70492[ebp]
	push	ecx
	mov	edx, DWORD PTR _datebeg$[ebp]
	push	edx
	lea	eax, DWORD PTR _date$70489[ebp]
	push	eax
	call	_delay_to_datetxt
	add	esp, 16					; 00000010H

; 221  : 
; 222  : 		/* Trick to handle DST changes */
; 223  : 		delay_to_datetxt(datebeg, date, 2, 'h');

	push	104					; 00000068H
	push	2
	lea	ecx, DWORD PTR _date$70489[ebp]
	push	ecx
	mov	edx, DWORD PTR _datebeg$[ebp]
	push	edx
	call	_delay_to_datetxt
	add	esp, 16					; 00000010H

; 224  : 		datebeg[tr] = 0;

	mov	eax, DWORD PTR _datebeg$[ebp]
	add	eax, DWORD PTR _tr$70491[ebp]
	mov	BYTE PTR [eax], 0
$L70487:

; 226  : 
; 227  : 	/* Handle date links : goto clicked date */
; 228  : 	if(!strncmp(btn, add_sz_str("GOYEAR")))

	push	6
	push	OFFSET FLAT:$SG70495
	mov	ecx, DWORD PTR _btn$[ebp]
	push	ecx
	call	_strncmp
	add	esp, 12					; 0000000cH
	test	eax, eax
	jne	SHORT $L70494

; 230  : 		*unit = "_EVA_YEAR";

	mov	edx, DWORD PTR _unit$[ebp]
	mov	DWORD PTR [edx], OFFSET FLAT:$SG70496

; 231  : 		strcpy(datebeg, btn + 6);

	mov	eax, DWORD PTR _btn$[ebp]
	add	eax, 6
	push	eax
	mov	ecx, DWORD PTR _datebeg$[ebp]
	push	ecx
	call	_strcpy
	add	esp, 8

; 233  : 	else if(!strncmp(btn, add_sz_str("GOMONTH")))

	jmp	$eva_noerr$70509
$L70494:
	push	7
	push	OFFSET FLAT:$SG70499
	mov	edx, DWORD PTR _btn$[ebp]
	push	edx
	call	_strncmp
	add	esp, 12					; 0000000cH
	test	eax, eax
	jne	SHORT $L70498

; 235  : 		*unit = "_EVA_MONTH";

	mov	eax, DWORD PTR _unit$[ebp]
	mov	DWORD PTR [eax], OFFSET FLAT:$SG70500

; 236  : 		strcpy(datebeg, btn + 7);

	mov	ecx, DWORD PTR _btn$[ebp]
	add	ecx, 7
	push	ecx
	mov	edx, DWORD PTR _datebeg$[ebp]
	push	edx
	call	_strcpy
	add	esp, 8

; 238  : 	else if(!strncmp(btn, add_sz_str("GOWEEK")))

	jmp	SHORT $eva_noerr$70509
$L70498:
	push	6
	push	OFFSET FLAT:$SG70503
	mov	eax, DWORD PTR _btn$[ebp]
	push	eax
	call	_strncmp
	add	esp, 12					; 0000000cH
	test	eax, eax
	jne	SHORT $L70502

; 240  : 		*unit = "_EVA_WEEK";

	mov	ecx, DWORD PTR _unit$[ebp]
	mov	DWORD PTR [ecx], OFFSET FLAT:$SG70504

; 241  : 		strcpy(datebeg, btn + 6);

	mov	edx, DWORD PTR _btn$[ebp]
	add	edx, 6
	push	edx
	mov	eax, DWORD PTR _datebeg$[ebp]
	push	eax
	call	_strcpy
	add	esp, 8

; 243  : 	else if(!strncmp(btn, add_sz_str("GODAY")))

	jmp	SHORT $eva_noerr$70509
$L70502:
	push	5
	push	OFFSET FLAT:$SG70507
	mov	ecx, DWORD PTR _btn$[ebp]
	push	ecx
	call	_strncmp
	add	esp, 12					; 0000000cH
	test	eax, eax
	jne	SHORT $eva_noerr$70509

; 245  : 		*unit = "_EVA_DAY";

	mov	edx, DWORD PTR _unit$[ebp]
	mov	DWORD PTR [edx], OFFSET FLAT:$SG70508

; 246  : 		strcpy(datebeg, btn + 5);

	mov	eax, DWORD PTR _btn$[ebp]
	add	eax, 5
	push	eax
	mov	ecx, DWORD PTR _datebeg$[ebp]
	push	ecx
	call	_strcpy
	add	esp, 8
$eva_noerr$70509:

; 248  : 
; 249  : 	RETURN_OK_CLEANUP;

	push	0
	push	OFFSET FLAT:$SG70510
	push	OFFSET FLAT:$SG70511
	mov	edx, DWORD PTR _cntxt$[ebp]
	push	edx
	call	_err_clear
	add	esp, 16					; 00000010H
$eva_err$70476:
	mov	eax, DWORD PTR _cntxt$[ebp]
	cmp	DWORD PTR [eax+29872], 0
	je	SHORT $L70512
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	edx, DWORD PTR [ecx+29900]
	push	edx
	push	OFFSET FLAT:$SG70513
	push	OFFSET FLAT:$SG70514
	mov	eax, DWORD PTR _cntxt$[ebp]
	push	eax
	call	_err_add_context
	add	esp, 16					; 00000010H
$L70512:
	lea	ecx, DWORD PTR _cgival$[ebp]
	push	ecx
	call	_dyntab_free
	add	esp, 4
	mov	edx, DWORD PTR _cntxt$[ebp]
	xor	eax, eax
	cmp	DWORD PTR [edx+29872], 0
	setne	al

; 250  : }

	mov	esp, ebp
	pop	ebp
	ret	0
_ctrl_get_calendar_input ENDP
_TEXT	ENDS
PUBLIC	_ctrl_output_calendar_datesel
EXTRN	__snprintf:NEAR
_DATA	SEGMENT
$SG70538 DB	'CLOSESETVAL=%s=%s', 00H
	ORG $+2
$SG70543 DB	'S', 0e9H, 'lectionner ce jour', 00H
	ORG $+3
$SG70544 DB	'_eva_ctrl_rel_s.gif', 00H
$SG70545 DB	'_eva_ctrl_rel.gif', 00H
	ORG $+2
$SG70546 DB	'D:\Travail\ABI\EVA\V4.0\CGI\Brunix-2016\ctrl_output_cale'
	DB	'ndar.c', 00H
	ORG $+1
$SG70547 DB	'ctrl_output_calendar_datesel', 00H
	ORG $+3
$SG70549 DB	'D:\Travail\ABI\EVA\V4.0\CGI\Brunix-2016\ctrl_output_cale'
	DB	'ndar.c', 00H
	ORG $+1
$SG70550 DB	'ctrl_output_calendar_datesel', 00H
_DATA	ENDS
_TEXT	SEGMENT
_cntxt$ = 8
_cl$ = 12
_dstdate$ = 16
_ctrl$ = -140
_name$ = -136
_btname$ = -128
_html$ = -132
_ctrl_output_calendar_datesel PROC NEAR

; 264  : ){

	push	ebp
	mov	ebp, esp
	sub	esp, 148				; 00000094H

; 265  : 	EVA_ctrl *ctrl = cntxt->form->ctrl + cl->i_ctrl;

	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	ecx, DWORD PTR [eax+80]
	mov	edx, DWORD PTR _cl$[ebp]
	mov	eax, DWORD PTR [edx+240]
	imul	eax, 480				; 000001e0H
	mov	ecx, DWORD PTR [ecx]
	add	ecx, eax
	mov	DWORD PTR _ctrl$[ebp], ecx

; 266  : 	DynBuffer *name = NULL;

	mov	DWORD PTR _name$[ebp], 0

; 267  : 	char btname[128];
; 268  : 	CHECK_HTML_STATUS;

	cmp	DWORD PTR _cntxt$[ebp], 0
	je	SHORT $L71903
	mov	edx, DWORD PTR _cntxt$[ebp]
	cmp	DWORD PTR [edx+80], 0
	je	SHORT $L71901
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	ecx, DWORD PTR [eax+80]
	mov	edx, DWORD PTR [ecx+232]
	mov	DWORD PTR -144+[ebp], edx
	jmp	SHORT $L71902
$L71901:
	mov	DWORD PTR -144+[ebp], 0
$L71902:
	mov	eax, DWORD PTR -144+[ebp]
	mov	DWORD PTR -148+[ebp], eax
	jmp	SHORT $L71904
$L71903:
	mov	DWORD PTR -148+[ebp], 0
$L71904:
	mov	ecx, DWORD PTR -148+[ebp]
	mov	DWORD PTR _html$[ebp], ecx
	cmp	DWORD PTR _html$[ebp], 0
	jne	SHORT $L70533
	xor	eax, eax
	jmp	$L70525
$L70533:

; 269  : 	if(!*cl->resfield) RETURN_OK;

	mov	edx, DWORD PTR _cl$[ebp]
	mov	eax, DWORD PTR [edx+264]
	movsx	ecx, BYTE PTR [eax]
	test	ecx, ecx
	jne	SHORT $L70534
	jmp	$eva_noerr$70535
$L70534:

; 270  : 
; 271  : 	CTRL_CGINAMEBTN1(&name, NULL, btname, snprintf(add_sz_str(btname), "CLOSESETVAL=%s=%s", cl->resfield, dstdate));

	mov	edx, DWORD PTR _dstdate$[ebp]
	push	edx
	mov	eax, DWORD PTR _cl$[ebp]
	mov	ecx, DWORD PTR [eax+264]
	push	ecx
	push	OFFSET FLAT:$SG70538
	push	127					; 0000007fH
	lea	edx, DWORD PTR _btname$[ebp]
	push	edx
	call	__snprintf
	add	esp, 20					; 00000014H
	push	eax
	lea	eax, DWORD PTR _btname$[ebp]
	push	eax
	push	66					; 00000042H
	lea	ecx, DWORD PTR _name$[ebp]
	push	ecx
	push	1
	push	0
	mov	edx, DWORD PTR _ctrl$[ebp]
	push	edx
	mov	eax, DWORD PTR _cntxt$[ebp]
	push	eax
	call	_ctrl_cgi_name
	add	esp, 32					; 00000020H
	test	eax, eax
	je	SHORT $L70537
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 271		; 0000010fH
	jmp	SHORT $eva_err$70539
$L70537:

; 272  : 	if(put_html_button(cntxt, name->data, NULL, "_eva_ctrl_rel.gif", "_eva_ctrl_rel_s.gif",
; 273  : 									"Sélectionner ce jour", 0, 0)) STACK_ERROR;

	push	0
	push	0
	push	0
	push	0
	push	0
	push	OFFSET FLAT:$SG70543
	push	OFFSET FLAT:$SG70544
	push	OFFSET FLAT:$SG70545
	push	0
	mov	edx, DWORD PTR _name$[ebp]
	add	edx, 8
	push	edx
	mov	eax, DWORD PTR _cntxt$[ebp]
	push	eax
	call	_put_html_button_sz
	add	esp, 44					; 0000002cH
	test	eax, eax
	je	SHORT $eva_noerr$70535
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 273		; 00000111H
	jmp	SHORT $eva_err$70539
$eva_noerr$70535:

; 274  : 
; 275  : 	RETURN_OK_CLEANUP;

	push	0
	push	OFFSET FLAT:$SG70546
	push	OFFSET FLAT:$SG70547
	mov	edx, DWORD PTR _cntxt$[ebp]
	push	edx
	call	_err_clear
	add	esp, 16					; 00000010H
$eva_err$70539:
	mov	eax, DWORD PTR _cntxt$[ebp]
	cmp	DWORD PTR [eax+29872], 0
	je	SHORT $L70548
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	edx, DWORD PTR [ecx+29900]
	push	edx
	push	OFFSET FLAT:$SG70549
	push	OFFSET FLAT:$SG70550
	mov	eax, DWORD PTR _cntxt$[ebp]
	push	eax
	call	_err_add_context
	add	esp, 16					; 00000010H
$L70548:
	mov	ecx, DWORD PTR _name$[ebp]
	push	ecx
	call	_mem_free
	add	esp, 4
	mov	DWORD PTR _name$[ebp], 0
	mov	edx, DWORD PTR _cntxt$[ebp]
	xor	eax, eax
	cmp	DWORD PTR [edx+29872], 0
	setne	al
$L70525:

; 276  : }

	mov	esp, ebp
	pop	ebp
	ret	0
_ctrl_output_calendar_datesel ENDP
_TEXT	ENDS
PUBLIC	_ctrl_output_calendar_datelink
EXTRN	_sprintf:NEAR
EXTRN	_html_tooltip:BYTE
EXTRN	_strncpy:NEAR
_DATA	SEGMENT
	ORG $+3
$SG70579 DB	'GO%s%s', 00H
	ORG $+1
$SG70584 DB	'");''', 00H
	ORG $+3
$SG70585 DB	'<a href=''javascript:cb("', 00H
	ORG $+3
$SG70587 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70588 DB	'_EVA_FullVarDay', 00H
$SG70590 DB	'''>', 00H
	ORG $+1
$SG70591 DB	' title=''Cliquez pour afficher ', 00H
	ORG $+1
$SG70593 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70596 DB	'</b></a>', 00H
	ORG $+3
$SG70597 DB	'<b>', 00H
$SG70599 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70602 DB	'D:\Travail\ABI\EVA\V4.0\CGI\Brunix-2016\ctrl_output_cale'
	DB	'ndar.c', 00H
	ORG $+1
$SG70603 DB	'ctrl_output_calendar_datelink', 00H
	ORG $+2
$SG70605 DB	'D:\Travail\ABI\EVA\V4.0\CGI\Brunix-2016\ctrl_output_cale'
	DB	'ndar.c', 00H
	ORG $+1
$SG70606 DB	'ctrl_output_calendar_datelink', 00H
_DATA	ENDS
_TEXT	SEGMENT
_cntxt$ = 8
_cl$ = 12
_link$ = 16
_dstdate$ = 20
_unit$ = 24
_ctrl$ = -128
_name$ = -124
_destdate$ = -120
_date$ = -100
_btname$ = -32
_tr$ = -104
_html$ = -36
_ctrl_output_calendar_datelink PROC NEAR

; 292  : ){

	push	ebp
	mov	ebp, esp
	sub	esp, 148				; 00000094H

; 293  : 	EVA_ctrl *ctrl = cntxt->form->ctrl + cl->i_ctrl;

	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	ecx, DWORD PTR [eax+80]
	mov	edx, DWORD PTR _cl$[ebp]
	mov	eax, DWORD PTR [edx+240]
	imul	eax, 480				; 000001e0H
	mov	ecx, DWORD PTR [ecx]
	add	ecx, eax
	mov	DWORD PTR _ctrl$[ebp], ecx

; 294  : 	DynBuffer *name = NULL;

	mov	DWORD PTR _name$[ebp], 0

; 295  : 	char destdate[16] = {0}, date[64], btname[32];

	mov	BYTE PTR _destdate$[ebp], 0
	xor	edx, edx
	mov	DWORD PTR _destdate$[ebp+1], edx
	mov	DWORD PTR _destdate$[ebp+5], edx
	mov	DWORD PTR _destdate$[ebp+9], edx
	mov	WORD PTR _destdate$[ebp+13], dx
	mov	BYTE PTR _destdate$[ebp+15], dl

; 296  : 	size_t tr = *unit == 'Y' ? 4 : *unit == 'M' ? 6 : 8;

	mov	eax, DWORD PTR _unit$[ebp]
	movsx	ecx, BYTE PTR [eax]
	cmp	ecx, 89					; 00000059H
	jne	SHORT $L71906
	mov	DWORD PTR -132+[ebp], 4
	jmp	SHORT $L71907
$L71906:
	mov	edx, DWORD PTR _unit$[ebp]
	movsx	eax, BYTE PTR [edx]
	sub	eax, 77					; 0000004dH
	neg	eax
	sbb	eax, eax
	and	eax, 2
	add	eax, 6
	mov	DWORD PTR -132+[ebp], eax
$L71907:
	mov	ecx, DWORD PTR -132+[ebp]
	mov	DWORD PTR _tr$[ebp], ecx

; 297  : 	CHECK_HTML_STATUS;

	cmp	DWORD PTR _cntxt$[ebp], 0
	je	SHORT $L71910
	mov	edx, DWORD PTR _cntxt$[ebp]
	cmp	DWORD PTR [edx+80], 0
	je	SHORT $L71908
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	ecx, DWORD PTR [eax+80]
	mov	edx, DWORD PTR [ecx+232]
	mov	DWORD PTR -136+[ebp], edx
	jmp	SHORT $L71909
$L71908:
	mov	DWORD PTR -136+[ebp], 0
$L71909:
	mov	eax, DWORD PTR -136+[ebp]
	mov	DWORD PTR -140+[ebp], eax
	jmp	SHORT $L71911
$L71910:
	mov	DWORD PTR -140+[ebp], 0
$L71911:
	mov	ecx, DWORD PTR -140+[ebp]
	mov	DWORD PTR _html$[ebp], ecx
	cmp	DWORD PTR _html$[ebp], 0
	jne	SHORT $L70576
	xor	eax, eax
	jmp	$L70565
$L70576:

; 298  : 
; 299  : 	strncpy(destdate, dstdate, tr);

	mov	edx, DWORD PTR _tr$[ebp]
	push	edx
	mov	eax, DWORD PTR _dstdate$[ebp]
	push	eax
	lea	ecx, DWORD PTR _destdate$[ebp]
	push	ecx
	call	_strncpy
	add	esp, 12					; 0000000cH

; 300  : 	CTRL_CGINAMEBTN1(&name, NULL, btname, sprintf(btname, "GO%s%s", unit, destdate));

	lea	edx, DWORD PTR _destdate$[ebp]
	push	edx
	mov	eax, DWORD PTR _unit$[ebp]
	push	eax
	push	OFFSET FLAT:$SG70579
	lea	ecx, DWORD PTR _btname$[ebp]
	push	ecx
	call	_sprintf
	add	esp, 16					; 00000010H
	push	eax
	lea	edx, DWORD PTR _btname$[ebp]
	push	edx
	push	66					; 00000042H
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
	je	SHORT $L70578
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 300		; 0000012cH
	jmp	$eva_err$70580
$L70578:

; 301  : 	DYNBUF_ADD3_BUF(html, "<a href='javascript:cb(\"", name, NO_CONV, "\");'");

	cmp	DWORD PTR _name$[ebp], 0
	je	SHORT $L71912
	mov	ecx, DWORD PTR _name$[ebp]
	mov	edx, DWORD PTR [ecx+4]
	mov	DWORD PTR -144+[ebp], edx
	jmp	SHORT $L71913
$L71912:
	mov	DWORD PTR -144+[ebp], 0
$L71913:
	cmp	DWORD PTR _name$[ebp], 0
	je	SHORT $L71914
	mov	eax, DWORD PTR _name$[ebp]
	add	eax, 8
	mov	DWORD PTR -148+[ebp], eax
	jmp	SHORT $L71915
$L71914:
	mov	DWORD PTR -148+[ebp], 0
$L71915:
	push	4
	push	OFFSET FLAT:$SG70584
	push	0
	push	0
	mov	ecx, DWORD PTR -144+[ebp]
	push	ecx
	mov	edx, DWORD PTR -148+[ebp]
	push	edx
	push	24					; 00000018H
	push	OFFSET FLAT:$SG70585
	mov	eax, DWORD PTR _html$[ebp]
	push	eax
	call	_dynbuf_add3
	add	esp, 36					; 00000024H
	test	eax, eax
	je	SHORT $L70583
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29872], OFFSET FLAT:$SG70587
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 301		; 0000012dH
	jmp	$eva_err$70580
$L70583:

; 302  : 	datetxt_to_format(cntxt, date, destdate, "_EVA_FullVarDay");

	push	OFFSET FLAT:$SG70588
	lea	eax, DWORD PTR _destdate$[ebp]
	push	eax
	lea	ecx, DWORD PTR _date$[ebp]
	push	ecx
	mov	edx, DWORD PTR _cntxt$[ebp]
	push	edx
	call	_datetxt_to_format
	add	esp, 16					; 00000010H

; 303  : 	DYNBUF_ADD3(html, " title='Cliquez pour afficher ", date, 0, HTML_TOOLTIP, "'>");

	push	2
	push	OFFSET FLAT:$SG70590
	push	1
	push	OFFSET FLAT:_html_tooltip
	push	0
	lea	eax, DWORD PTR _date$[ebp]
	push	eax
	push	30					; 0000001eH
	push	OFFSET FLAT:$SG70591
	mov	ecx, DWORD PTR _html$[ebp]
	push	ecx
	call	_dynbuf_add3
	add	esp, 36					; 00000024H
	test	eax, eax
	je	SHORT $L70589
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29872], OFFSET FLAT:$SG70593
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 303		; 0000012fH
	jmp	$eva_err$70580
$L70589:

; 304  : 	DYNBUF_ADD3(html, "<b>", link, 0, NO_CONV, "</b></a>");

	push	8
	push	OFFSET FLAT:$SG70596
	push	0
	push	0
	push	0
	mov	ecx, DWORD PTR _link$[ebp]
	push	ecx
	push	3
	push	OFFSET FLAT:$SG70597
	mov	edx, DWORD PTR _html$[ebp]
	push	edx
	call	_dynbuf_add3
	add	esp, 36					; 00000024H
	test	eax, eax
	je	SHORT $L70595
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29872], OFFSET FLAT:$SG70599
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 304		; 00000130H
	jmp	SHORT $eva_err$70580
$L70595:

; 305  : 	if(ctrl_output_calendar_datesel(cntxt, cl, dstdate)) STACK_ERROR;

	mov	edx, DWORD PTR _dstdate$[ebp]
	push	edx
	mov	eax, DWORD PTR _cl$[ebp]
	push	eax
	mov	ecx, DWORD PTR _cntxt$[ebp]
	push	ecx
	call	_ctrl_output_calendar_datesel
	add	esp, 12					; 0000000cH
	test	eax, eax
	je	SHORT $eva_noerr$70601
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 305		; 00000131H
	jmp	SHORT $eva_err$70580
$eva_noerr$70601:

; 306  : 
; 307  : 	RETURN_OK_CLEANUP;

	push	0
	push	OFFSET FLAT:$SG70602
	push	OFFSET FLAT:$SG70603
	mov	eax, DWORD PTR _cntxt$[ebp]
	push	eax
	call	_err_clear
	add	esp, 16					; 00000010H
$eva_err$70580:
	mov	ecx, DWORD PTR _cntxt$[ebp]
	cmp	DWORD PTR [ecx+29872], 0
	je	SHORT $L70604
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	eax, DWORD PTR [edx+29900]
	push	eax
	push	OFFSET FLAT:$SG70605
	push	OFFSET FLAT:$SG70606
	mov	ecx, DWORD PTR _cntxt$[ebp]
	push	ecx
	call	_err_add_context
	add	esp, 16					; 00000010H
$L70604:
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
$L70565:

; 308  : }

	mov	esp, ebp
	pop	ebp
	ret	0
_ctrl_output_calendar_datelink ENDP
_TEXT	ENDS
PUBLIC	_ctrl_output_calendar_title
EXTRN	_datetxt_to_time:NEAR
EXTRN	_plain_to_html:BYTE
EXTRN	_dyntab_cell:NEAR
_BSS	SEGMENT
	ALIGN	4

$SG70662 DB	01H DUP (?)
	ALIGN	4

$SG70668 DB	01H DUP (?)
	ALIGN	4

$SG70709 DB	01H DUP (?)
_BSS	ENDS
_DATA	SEGMENT
	ORG $+2
$SG70628 DB	'DDDDDD', 00H
	ORG $+1
$SG70629 DB	'<td bgcolor=#%s colspan=%lu><table noborder width=100%%>'
	DB	'<tr><td><font size=+1><b><nobr>', 00H
$SG70631 DB	'_EVA_YEAR', 00H
	ORG $+2
$SG70633 DB	'_EVA_MONTH', 00H
	ORG $+1
$SG70634 DB	'_EVA_DayFull', 00H
	ORG $+3
$SG70637 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70641 DB	' ', 00H
	ORG $+2
$SG70643 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70645 DB	'MONTH', 00H
	ORG $+2
$SG70649 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70652 DB	' ', 00H
	ORG $+2
$SG70654 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70655 DB	'_EVA_Year', 00H
	ORG $+2
$SG70657 DB	'YEAR', 00H
	ORG $+3
$SG70659 DB	'_EVA_WEEK', 00H
	ORG $+2
$SG70663 DB	'Ann', 0e9H, 'e ', 00H
	ORG $+1
$SG70665 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70669 DB	' - ', 00H
$SG70671 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70674 DB	'</b></font><img src=''../img/_eva_nop.gif'' width=20></n'
	DB	'obr> <nobr>', 00H
	ORG $+2
$SG70676 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70680 DB	'Format ', 00H
$SG70682 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70684 DB	'0', 00H
	ORG $+2
$SG70685 DB	'0', 00H
	ORG $+2
$SG70698 DB	'</td><td>', 00H
	ORG $+2
$SG70700 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70703 DB	'<table noborder', 00H
$SG70705 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70710 DB	' bgcolor=#', 00H
	ORG $+1
$SG70712 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70715 DB	' cellspacing=0 cellpadding=0 width=100%><tr><td><font si'
	DB	'ze=-2>', 00H
	ORG $+1
$SG70717 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70718 DB	'_eva_smallcheckbox_no.gif', 00H
	ORG $+2
$SG70719 DB	'_eva_smallcheckbox_yes.gif', 00H
	ORG $+1
$SG70724 DB	'XOREVENT%lu', 00H
$SG70725 DB	'masquer', 00H
$SG70726 DB	'afficher', 00H
	ORG $+3
$SG70727 DB	'visibles', 00H
	ORG $+3
$SG70728 DB	'masqu', 0e9H, 'es', 00H
	ORG $+3
$SG70729 DB	'Les fiches [%s] sont %s', 0aH, 0aH, 'Cliquez pour les %s'
	DB	00H
	ORG $+3
$SG70732 DB	'_eva_btn_1.gif', 00H
	ORG $+1
$SG70733 DB	'_eva_btn_1_s.gif', 00H
	ORG $+3
$SG70738 DB	'SELEVENT%lu', 00H
$SG70739 DB	'Seules les fiches [%s] sont visibles', 0aH, 0aH, 'Clique'
	DB	'z pour voir toutes les fiches', 00H
	ORG $+2
$SG70740 DB	'Voir uniquement les fiches [%s]', 00H
$SG70746 DB	'</td></tr></table>', 00H
	ORG $+1
$SG70748 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70752 DB	'EVENTS', 00H
	ORG $+1
$SG70756 DB	'''', 00H
	ORG $+2
$SG70757 DB	'<input type=hidden name=''', 00H
	ORG $+2
$SG70759 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70762 DB	'>', 00H
	ORG $+2
$SG70763 DB	' value=', 00H
$SG70765 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70768 DB	'</td></tr></table></td></tr><tr>', 00H
	ORG $+3
$SG70770 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70772 DB	'D:\Travail\ABI\EVA\V4.0\CGI\Brunix-2016\ctrl_output_cale'
	DB	'ndar.c', 00H
	ORG $+1
$SG70773 DB	'ctrl_output_calendar_title', 00H
	ORG $+1
$SG70775 DB	'D:\Travail\ABI\EVA\V4.0\CGI\Brunix-2016\ctrl_output_cale'
	DB	'ndar.c', 00H
	ORG $+1
$SG70776 DB	'ctrl_output_calendar_title', 00H
_DATA	ENDS
_TEXT	SEGMENT
_i$70687 = -1144
_status$70688 = -1176
_c$70692 = -1180
_im$70693 = -1184
_im1$70694 = -1188
_t$70721 = -1192
_t$70735 = -1196
_cntxt$ = 8
_cl$ = 12
_ctrl$ = -1140
_printbuf$ = -1024
_date$ = -1096
_t$ = -1032
_dt$ = -1132
_name$ = -1136
_html$ = -1028
_ctrl_output_calendar_title PROC NEAR

; 321  : ){

	push	ebp
	mov	ebp, esp
	sub	esp, 1236				; 000004d4H
	push	edi

; 322  : 	EVA_ctrl *ctrl = cntxt->form->ctrl + cl->i_ctrl;

	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	ecx, DWORD PTR [eax+80]
	mov	edx, DWORD PTR _cl$[ebp]
	mov	eax, DWORD PTR [edx+240]
	imul	eax, 480				; 000001e0H
	mov	ecx, DWORD PTR [ecx]
	add	ecx, eax
	mov	DWORD PTR _ctrl$[ebp], ecx

; 323  : 	char printbuf[1024], date[64];
; 324  : 	time_t t = 0;

	mov	DWORD PTR _t$[ebp], 0

; 325  : 	struct tm dt;
; 326  : 	DynBuffer *name = NULL;

	mov	DWORD PTR _name$[ebp], 0

; 327  : 	CHECK_HTML_STATUS;

	cmp	DWORD PTR _cntxt$[ebp], 0
	je	SHORT $L71919
	mov	edx, DWORD PTR _cntxt$[ebp]
	cmp	DWORD PTR [edx+80], 0
	je	SHORT $L71917
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	ecx, DWORD PTR [eax+80]
	mov	edx, DWORD PTR [ecx+232]
	mov	DWORD PTR -1200+[ebp], edx
	jmp	SHORT $L71918
$L71917:
	mov	DWORD PTR -1200+[ebp], 0
$L71918:
	mov	eax, DWORD PTR -1200+[ebp]
	mov	DWORD PTR -1204+[ebp], eax
	jmp	SHORT $L71920
$L71919:
	mov	DWORD PTR -1204+[ebp], 0
$L71920:
	mov	ecx, DWORD PTR -1204+[ebp]
	mov	DWORD PTR _html$[ebp], ecx
	cmp	DWORD PTR _html$[ebp], 0
	jne	SHORT $L70626
	xor	eax, eax
	jmp	$L70615
$L70626:

; 328  : 
; 329  : 	/* Output date parts as button links */
; 330  : 	dynbuf_print2(html, "<td bgcolor=#%s colspan=%lu><table noborder width=100%%><tr><td><font size=+1><b><nobr>",
; 331  : 					cl->headerbgcolor[0] ? cl->headerbgcolor : "DDDDDD", cl->cols);

	mov	edx, DWORD PTR _cl$[ebp]
	mov	eax, DWORD PTR [edx+284]
	movsx	ecx, BYTE PTR [eax]
	test	ecx, ecx
	je	SHORT $L71921
	mov	edx, DWORD PTR _cl$[ebp]
	mov	eax, DWORD PTR [edx+284]
	mov	DWORD PTR -1208+[ebp], eax
	jmp	SHORT $L71922
$L71921:
	mov	DWORD PTR -1208+[ebp], OFFSET FLAT:$SG70628
$L71922:
	push	0
	push	0
	mov	ecx, DWORD PTR _cl$[ebp]
	mov	edx, DWORD PTR [ecx+228]
	push	edx
	mov	eax, DWORD PTR -1208+[ebp]
	push	eax
	push	OFFSET FLAT:$SG70629
	push	1023					; 000003ffH
	lea	ecx, DWORD PTR _printbuf$[ebp]
	push	ecx
	call	__snprintf
	add	esp, 20					; 00000014H
	push	eax
	lea	edx, DWORD PTR _printbuf$[ebp]
	push	edx
	mov	eax, DWORD PTR _html$[ebp]
	push	eax
	call	_dynbuf_add
	add	esp, 20					; 00000014H

; 332  : 	datetxt_to_time(cl->date0, &t, &dt);

	lea	ecx, DWORD PTR _dt$[ebp]
	push	ecx
	lea	edx, DWORD PTR _t$[ebp]
	push	edx
	mov	eax, DWORD PTR _cl$[ebp]
	add	eax, 180				; 000000b4H
	push	eax
	call	_datetxt_to_time
	add	esp, 12					; 0000000cH

; 333  : 	if(strncmp(cl->unit, add_sz_str("_EVA_YEAR")))

	push	9
	push	OFFSET FLAT:$SG70631
	mov	ecx, DWORD PTR _cl$[ebp]
	mov	edx, DWORD PTR [ecx+256]
	push	edx
	call	_strncmp
	add	esp, 12					; 0000000cH
	test	eax, eax
	je	$L70630

; 335  : 		if(strcmp(cl->unit, "_EVA_MONTH"))

	push	OFFSET FLAT:$SG70633
	mov	eax, DWORD PTR _cl$[ebp]
	mov	ecx, DWORD PTR [eax+256]
	push	ecx
	call	_strcmp
	add	esp, 8
	test	eax, eax
	je	$L70632

; 337  : 			datetxt_to_format(cntxt, date, cl->date0, "_EVA_DayFull");

	push	OFFSET FLAT:$SG70634
	mov	edx, DWORD PTR _cl$[ebp]
	add	edx, 180				; 000000b4H
	push	edx
	lea	eax, DWORD PTR _date$[ebp]
	push	eax
	mov	ecx, DWORD PTR _cntxt$[ebp]
	push	ecx
	call	_datetxt_to_format
	add	esp, 16					; 00000010H

; 338  : 			DYNBUF_ADD(html, date, 0, TO_HTML);

	push	1
	push	OFFSET FLAT:_plain_to_html
	push	0
	lea	edx, DWORD PTR _date$[ebp]
	push	edx
	mov	eax, DWORD PTR _html$[ebp]
	push	eax
	call	_dynbuf_add
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L70635
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29872], OFFSET FLAT:$SG70637
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 338		; 00000152H
	jmp	$eva_err$70638
$L70635:

; 339  : 			DYNBUF_ADD_STR(html, " ");

	push	0
	push	0
	push	1
	push	OFFSET FLAT:$SG70641
	mov	eax, DWORD PTR _html$[ebp]
	push	eax
	call	_dynbuf_add
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L70640
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29872], OFFSET FLAT:$SG70643
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 339		; 00000153H
	jmp	$eva_err$70638
$L70640:

; 340  : 			if(ctrl_output_calendar_datelink(cntxt, cl, dyntab_val(&cntxt->monthlong, dt.tm_mon, 0), cl->date0, "MONTH")) STACK_ERROR;

	push	OFFSET FLAT:$SG70645
	mov	eax, DWORD PTR _cl$[ebp]
	add	eax, 180				; 000000b4H
	push	eax
	push	0
	mov	ecx, DWORD PTR _dt$[ebp+16]
	push	ecx
	mov	edx, DWORD PTR _cntxt$[ebp]
	add	edx, 269708				; 00041d8cH
	push	edx
	call	_dyntab_val
	add	esp, 12					; 0000000cH
	push	eax
	mov	eax, DWORD PTR _cl$[ebp]
	push	eax
	mov	ecx, DWORD PTR _cntxt$[ebp]
	push	ecx
	call	_ctrl_output_calendar_datelink
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L70644
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 340		; 00000154H
	jmp	$eva_err$70638
$L70644:

; 342  : 		else

	jmp	SHORT $L70647
$L70632:

; 343  : 			DYNBUF_ADD_CELL(html, &cntxt->monthlong, dt.tm_mon, 0, TO_HTML);

	push	1
	push	OFFSET FLAT:_plain_to_html
	push	0
	mov	eax, DWORD PTR _dt$[ebp+16]
	push	eax
	mov	ecx, DWORD PTR _cntxt$[ebp]
	add	ecx, 269708				; 00041d8cH
	push	ecx
	call	_dyntab_sz
	add	esp, 12					; 0000000cH
	push	eax
	push	0
	mov	edx, DWORD PTR _dt$[ebp+16]
	push	edx
	mov	eax, DWORD PTR _cntxt$[ebp]
	add	eax, 269708				; 00041d8cH
	push	eax
	call	_dyntab_val
	add	esp, 12					; 0000000cH
	push	eax
	mov	ecx, DWORD PTR _html$[ebp]
	push	ecx
	call	_dynbuf_add
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L70647
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29872], OFFSET FLAT:$SG70649
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 343		; 00000157H
	jmp	$eva_err$70638
$L70647:

; 344  : 		DYNBUF_ADD_STR(html, " ");

	push	0
	push	0
	push	1
	push	OFFSET FLAT:$SG70652
	mov	ecx, DWORD PTR _html$[ebp]
	push	ecx
	call	_dynbuf_add
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L70651
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29872], OFFSET FLAT:$SG70654
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 344		; 00000158H
	jmp	$eva_err$70638
$L70651:

; 345  : 		datetxt_to_format(cntxt, date, cl->date0, "_EVA_Year");

	push	OFFSET FLAT:$SG70655
	mov	ecx, DWORD PTR _cl$[ebp]
	add	ecx, 180				; 000000b4H
	push	ecx
	lea	edx, DWORD PTR _date$[ebp]
	push	edx
	mov	eax, DWORD PTR _cntxt$[ebp]
	push	eax
	call	_datetxt_to_format
	add	esp, 16					; 00000010H

; 346  : 		if(ctrl_output_calendar_datelink(cntxt, cl, date, cl->date0, "YEAR")) STACK_ERROR;

	push	OFFSET FLAT:$SG70657
	mov	ecx, DWORD PTR _cl$[ebp]
	add	ecx, 180				; 000000b4H
	push	ecx
	lea	edx, DWORD PTR _date$[ebp]
	push	edx
	mov	eax, DWORD PTR _cl$[ebp]
	push	eax
	mov	ecx, DWORD PTR _cntxt$[ebp]
	push	ecx
	call	_ctrl_output_calendar_datelink
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L70656
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 346		; 0000015aH
	jmp	$eva_err$70638
$L70656:

; 347  : 		if(!strcmp(cl->unit, "_EVA_WEEK"))

	push	OFFSET FLAT:$SG70659
	mov	eax, DWORD PTR _cl$[ebp]
	mov	ecx, DWORD PTR [eax+256]
	push	ecx
	call	_strcmp
	add	esp, 8

; 351  : 	else

	jmp	$L70667
$L70630:

; 353  : 		DYNBUF_ADD3(html, "Année ", cl->date0, 4, TO_HTML, "");

	push	0
	push	OFFSET FLAT:$SG70662
	push	1
	push	OFFSET FLAT:_plain_to_html
	push	4
	mov	edx, DWORD PTR _cl$[ebp]
	add	edx, 180				; 000000b4H
	push	edx
	push	6
	push	OFFSET FLAT:$SG70663
	mov	eax, DWORD PTR _html$[ebp]
	push	eax
	call	_dynbuf_add3
	add	esp, 36					; 00000024H
	test	eax, eax
	je	SHORT $L70661
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29872], OFFSET FLAT:$SG70665
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 353		; 00000161H
	jmp	$eva_err$70638
$L70661:

; 354  : 		if(cl->date0[5])

	mov	eax, DWORD PTR _cl$[ebp]
	movsx	ecx, BYTE PTR [eax+185]
	test	ecx, ecx
	je	SHORT $L70667

; 355  : 			DYNBUF_ADD3_INT(html, " - ", dt.tm_year + 1901, "");

	push	0
	push	OFFSET FLAT:$SG70668
	mov	edx, DWORD PTR _dt$[ebp+20]
	add	edx, 1901				; 0000076dH
	push	edx
	push	3
	push	OFFSET FLAT:$SG70669
	mov	eax, DWORD PTR _html$[ebp]
	push	eax
	call	_dynbuf_add3_int
	add	esp, 24					; 00000018H
	test	eax, eax
	je	SHORT $L70667
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29872], OFFSET FLAT:$SG70671
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 355		; 00000163H
	jmp	$eva_err$70638
$L70667:

; 357  : 
; 358  : 	/* Output period selector */
; 359  : 	DYNBUF_ADD_STR(html, "</b></font><img src='../img/_eva_nop.gif' width=20></nobr> <nobr>");

	push	0
	push	0
	push	65					; 00000041H
	push	OFFSET FLAT:$SG70674
	mov	eax, DWORD PTR _html$[ebp]
	push	eax
	call	_dynbuf_add
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L70673
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29872], OFFSET FLAT:$SG70676
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 359		; 00000167H
	jmp	$eva_err$70638
$L70673:

; 360  : 	if(cl->ctldate & CtlUnitInput) DYNBUF_ADD_STR(html, "Format ");

	mov	eax, DWORD PTR _cl$[ebp]
	mov	ecx, DWORD PTR [eax+244]
	and	ecx, 2
	test	ecx, ecx
	je	SHORT $L70679
	push	0
	push	0
	push	7
	push	OFFSET FLAT:$SG70680
	mov	edx, DWORD PTR _html$[ebp]
	push	edx
	call	_dynbuf_add
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L70679
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29872], OFFSET FLAT:$SG70682
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 360		; 00000168H
	jmp	$eva_err$70638
$L70679:

; 361  : 	if(ctrl_add_calendar_input(cntxt, cl->i_ctrl,
; 362  : 								(cl->ctldate & CtlDateInput) ? cl->datecal : "0",
; 363  : 								(cl->ctldate & CtlUnitInput) ? cl->unit : "0", cl->periods)) STACK_ERROR;

	mov	edx, DWORD PTR _cl$[ebp]
	mov	eax, DWORD PTR [edx+244]
	and	eax, 2
	test	eax, eax
	je	SHORT $L71923
	mov	ecx, DWORD PTR _cl$[ebp]
	mov	edx, DWORD PTR [ecx+256]
	mov	DWORD PTR -1212+[ebp], edx
	jmp	SHORT $L71924
$L71923:
	mov	DWORD PTR -1212+[ebp], OFFSET FLAT:$SG70684
$L71924:
	mov	eax, DWORD PTR _cl$[ebp]
	mov	ecx, DWORD PTR [eax+244]
	and	ecx, 1
	test	ecx, ecx
	je	SHORT $L71925
	mov	edx, DWORD PTR _cl$[ebp]
	add	edx, 164				; 000000a4H
	mov	DWORD PTR -1216+[ebp], edx
	jmp	SHORT $L71926
$L71925:
	mov	DWORD PTR -1216+[ebp], OFFSET FLAT:$SG70685
$L71926:
	mov	eax, DWORD PTR _cl$[ebp]
	mov	ecx, DWORD PTR [eax+232]
	push	ecx
	mov	edx, DWORD PTR -1212+[ebp]
	push	edx
	mov	eax, DWORD PTR -1216+[ebp]
	push	eax
	mov	ecx, DWORD PTR _cl$[ebp]
	mov	edx, DWORD PTR [ecx+240]
	push	edx
	mov	eax, DWORD PTR _cntxt$[ebp]
	push	eax
	call	_ctrl_add_calendar_input
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L70683
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 363		; 0000016bH
	jmp	$eva_err$70638
$L70683:

; 364  : 
; 365  : 	/* Output events selector */
; 366  : 	if(cl->filter.nbrows > 1 && cl->ctldate & CtlEvtSelect)

	mov	edx, DWORD PTR _cl$[ebp]
	cmp	DWORD PTR [edx], 1
	jbe	$L70761
	mov	eax, DWORD PTR _cl$[ebp]
	mov	ecx, DWORD PTR [eax+244]
	and	ecx, 8
	test	ecx, ecx
	je	$L70761

; 368  : 		unsigned long i;
; 369  : 		char status[32] = {0};

	mov	BYTE PTR _status$70688[ebp], 0
	mov	ecx, 7
	xor	eax, eax
	lea	edi, DWORD PTR _status$70688[ebp+1]
	rep stosd
	stosw
	stosb

; 370  : 		for(i = 0; i < cl->filter.nbrows && i < sizeof(status)-2; i++)

	mov	DWORD PTR _i$70687[ebp], 0
	jmp	SHORT $L70689
$L70690:
	mov	edx, DWORD PTR _i$70687[ebp]
	add	edx, 1
	mov	DWORD PTR _i$70687[ebp], edx
$L70689:
	mov	eax, DWORD PTR _cl$[ebp]
	mov	ecx, DWORD PTR _i$70687[ebp]
	cmp	ecx, DWORD PTR [eax]
	jae	$L70691
	cmp	DWORD PTR _i$70687[ebp], 30		; 0000001eH
	jae	$L70691

; 372  : 			/* Output table header */
; 373  : 			DynTableCell *c = dyntab_cell(&cl->filter, i, 0);

	push	0
	mov	edx, DWORD PTR _i$70687[ebp]
	push	edx
	mov	eax, DWORD PTR _cl$[ebp]
	push	eax
	call	_dyntab_cell
	add	esp, 12					; 0000000cH
	mov	DWORD PTR _c$70692[ebp], eax

; 374  : 			char *im, *im1;
; 375  : 			if(i % 2 == 0) DYNBUF_ADD_STR(html, "</td><td>")

	mov	eax, DWORD PTR _i$70687[ebp]
	xor	edx, edx
	mov	ecx, 2
	div	ecx
	test	edx, edx
	jne	SHORT $L70697
	push	0
	push	0
	push	9
	push	OFFSET FLAT:$SG70698
	mov	edx, DWORD PTR _html$[ebp]
	push	edx
	call	_dynbuf_add
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L70697
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29872], OFFSET FLAT:$SG70700
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 375		; 00000177H
	jmp	$eva_err$70638
$L70697:

; 376  : 			DYNBUF_ADD_STR(html, "<table noborder");

	push	0
	push	0
	push	15					; 0000000fH
	push	OFFSET FLAT:$SG70703
	mov	edx, DWORD PTR _html$[ebp]
	push	edx
	call	_dynbuf_add
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L70702
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29872], OFFSET FLAT:$SG70705
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 376		; 00000178H
	jmp	$eva_err$70638
$L70702:

; 377  : 			if(dyntab_sz(&cl->eventbgcolor, i, 0))

	push	0
	mov	edx, DWORD PTR _i$70687[ebp]
	push	edx
	mov	eax, DWORD PTR _cl$[ebp]
	add	eax, 84					; 00000054H
	push	eax
	call	_dyntab_sz
	add	esp, 12					; 0000000cH
	test	eax, eax
	je	SHORT $L70708

; 378  : 				DYNBUF_ADD3_CELL(html, " bgcolor=#", &cl->eventbgcolor, i, 0, NO_CONV, "");

	push	0
	push	OFFSET FLAT:$SG70709
	push	0
	push	0
	push	0
	mov	ecx, DWORD PTR _i$70687[ebp]
	push	ecx
	mov	edx, DWORD PTR _cl$[ebp]
	add	edx, 84					; 00000054H
	push	edx
	call	_dyntab_sz
	add	esp, 12					; 0000000cH
	push	eax
	push	0
	mov	eax, DWORD PTR _i$70687[ebp]
	push	eax
	mov	ecx, DWORD PTR _cl$[ebp]
	add	ecx, 84					; 00000054H
	push	ecx
	call	_dyntab_val
	add	esp, 12					; 0000000cH
	push	eax
	push	10					; 0000000aH
	push	OFFSET FLAT:$SG70710
	mov	edx, DWORD PTR _html$[ebp]
	push	edx
	call	_dynbuf_add3
	add	esp, 36					; 00000024H
	test	eax, eax
	je	SHORT $L70708
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29872], OFFSET FLAT:$SG70712
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 378		; 0000017aH
	jmp	$eva_err$70638
$L70708:

; 379  : 			DYNBUF_ADD_STR(html, " cellspacing=0 cellpadding=0 width=100%><tr><td><font size=-2>");

	push	0
	push	0
	push	62					; 0000003eH
	push	OFFSET FLAT:$SG70715
	mov	edx, DWORD PTR _html$[ebp]
	push	edx
	call	_dynbuf_add
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L70714
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29872], OFFSET FLAT:$SG70717
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 379		; 0000017bH
	jmp	$eva_err$70638
$L70714:

; 380  : 
; 381  : 			/* Output checkbox & label for event type */
; 382  : 			im = "_eva_smallcheckbox_no.gif";

	mov	DWORD PTR _im$70693[ebp], OFFSET FLAT:$SG70718

; 383  : 			im1 = "_eva_smallcheckbox_yes.gif";

	mov	DWORD PTR _im1$70694[ebp], OFFSET FLAT:$SG70719

; 384  : 			if(c->col) { char *t = im; im = im1; im1 = t; }

	mov	edx, DWORD PTR _c$70692[ebp]
	cmp	DWORD PTR [edx+56], 0
	je	SHORT $L70720
	mov	eax, DWORD PTR _im$70693[ebp]
	mov	DWORD PTR _t$70721[ebp], eax
	mov	ecx, DWORD PTR _im1$70694[ebp]
	mov	DWORD PTR _im$70693[ebp], ecx
	mov	edx, DWORD PTR _t$70721[ebp]
	mov	DWORD PTR _im1$70694[ebp], edx
$L70720:

; 385  : 			CTRL_CGINAMEBTN1(&name, NULL, printbuf, sprintf(printbuf, "XOREVENT%lu", i));

	mov	eax, DWORD PTR _i$70687[ebp]
	push	eax
	push	OFFSET FLAT:$SG70724
	lea	ecx, DWORD PTR _printbuf$[ebp]
	push	ecx
	call	_sprintf
	add	esp, 12					; 0000000cH
	push	eax
	lea	edx, DWORD PTR _printbuf$[ebp]
	push	edx
	push	66					; 00000042H
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
	je	SHORT $L70723
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 385		; 00000181H
	jmp	$eva_err$70638
$L70723:

; 386  : 			snprintf(add_sz_str(printbuf), "Les fiches [%s] sont %s\n\nCliquez pour les %s", dyntab_val(&cl->filter, i, 1),
; 387  : 												c->col ? "visibles" : "masquées", c->col ? "masquer" : "afficher");

	mov	ecx, DWORD PTR _c$70692[ebp]
	cmp	DWORD PTR [ecx+56], 0
	je	SHORT $L71927
	mov	DWORD PTR -1220+[ebp], OFFSET FLAT:$SG70725
	jmp	SHORT $L71928
$L71927:
	mov	DWORD PTR -1220+[ebp], OFFSET FLAT:$SG70726
$L71928:
	mov	edx, DWORD PTR _c$70692[ebp]
	cmp	DWORD PTR [edx+56], 0
	je	SHORT $L71929
	mov	DWORD PTR -1224+[ebp], OFFSET FLAT:$SG70727
	jmp	SHORT $L71930
$L71929:
	mov	DWORD PTR -1224+[ebp], OFFSET FLAT:$SG70728
$L71930:
	mov	eax, DWORD PTR -1220+[ebp]
	push	eax
	mov	ecx, DWORD PTR -1224+[ebp]
	push	ecx
	push	1
	mov	edx, DWORD PTR _i$70687[ebp]
	push	edx
	mov	eax, DWORD PTR _cl$[ebp]
	push	eax
	call	_dyntab_val
	add	esp, 12					; 0000000cH
	push	eax
	push	OFFSET FLAT:$SG70729
	push	1023					; 000003ffH
	lea	ecx, DWORD PTR _printbuf$[ebp]
	push	ecx
	call	__snprintf
	add	esp, 24					; 00000018H

; 388  : 			if(put_html_button(cntxt, name->data, dyntab_val(&cl->filter, i, 1), im, im1, printbuf, 0, 12)) STACK_ERROR;

	push	12					; 0000000cH
	push	0
	push	0
	push	0
	push	0
	lea	edx, DWORD PTR _printbuf$[ebp]
	push	edx
	mov	eax, DWORD PTR _im1$70694[ebp]
	push	eax
	mov	ecx, DWORD PTR _im$70693[ebp]
	push	ecx
	push	1
	mov	edx, DWORD PTR _i$70687[ebp]
	push	edx
	mov	eax, DWORD PTR _cl$[ebp]
	push	eax
	call	_dyntab_val
	add	esp, 12					; 0000000cH
	push	eax
	mov	ecx, DWORD PTR _name$[ebp]
	add	ecx, 8
	push	ecx
	mov	edx, DWORD PTR _cntxt$[ebp]
	push	edx
	call	_put_html_button_sz
	add	esp, 44					; 0000002cH
	test	eax, eax
	je	SHORT $L70731
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 388		; 00000184H
	jmp	$eva_err$70638
$L70731:

; 389  : 
; 390  : 			/* Output single event type button */
; 391  : 			im = "_eva_btn_1.gif";

	mov	DWORD PTR _im$70693[ebp], OFFSET FLAT:$SG70732

; 392  : 			im1 = "_eva_btn_1_s.gif";

	mov	DWORD PTR _im1$70694[ebp], OFFSET FLAT:$SG70733

; 393  : 			if(cl->nbevntstyp == 1 && c->col) { char *t = im; im = im1; im1 = t; }

	mov	ecx, DWORD PTR _cl$[ebp]
	cmp	DWORD PTR [ecx+296], 1
	jne	SHORT $L70734
	mov	edx, DWORD PTR _c$70692[ebp]
	cmp	DWORD PTR [edx+56], 0
	je	SHORT $L70734
	mov	eax, DWORD PTR _im$70693[ebp]
	mov	DWORD PTR _t$70735[ebp], eax
	mov	ecx, DWORD PTR _im1$70694[ebp]
	mov	DWORD PTR _im$70693[ebp], ecx
	mov	edx, DWORD PTR _t$70735[ebp]
	mov	DWORD PTR _im1$70694[ebp], edx
$L70734:

; 394  : 			CTRL_CGINAMEBTN1(&name, NULL, printbuf, sprintf(printbuf, "SELEVENT%lu", i));

	mov	eax, DWORD PTR _i$70687[ebp]
	push	eax
	push	OFFSET FLAT:$SG70738
	lea	ecx, DWORD PTR _printbuf$[ebp]
	push	ecx
	call	_sprintf
	add	esp, 12					; 0000000cH
	push	eax
	lea	edx, DWORD PTR _printbuf$[ebp]
	push	edx
	push	66					; 00000042H
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
	je	SHORT $L70737
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 394		; 0000018aH
	jmp	$eva_err$70638
$L70737:

; 395  : 			snprintf(add_sz_str(printbuf), cl->nbevntstyp == 1 && c->col ? "Seules les fiches [%s] sont visibles\n\nCliquez pour voir toutes les fiches" :
; 396  : 										"Voir uniquement les fiches [%s]", dyntab_val(&cl->filter, i, 1));

	mov	ecx, DWORD PTR _cl$[ebp]
	cmp	DWORD PTR [ecx+296], 1
	jne	SHORT $L71931
	mov	edx, DWORD PTR _c$70692[ebp]
	cmp	DWORD PTR [edx+56], 0
	je	SHORT $L71931
	mov	DWORD PTR -1228+[ebp], OFFSET FLAT:$SG70739
	jmp	SHORT $L71932
$L71931:
	mov	DWORD PTR -1228+[ebp], OFFSET FLAT:$SG70740
$L71932:
	push	1
	mov	eax, DWORD PTR _i$70687[ebp]
	push	eax
	mov	ecx, DWORD PTR _cl$[ebp]
	push	ecx
	call	_dyntab_val
	add	esp, 12					; 0000000cH
	push	eax
	mov	edx, DWORD PTR -1228+[ebp]
	push	edx
	push	1023					; 000003ffH
	lea	eax, DWORD PTR _printbuf$[ebp]
	push	eax
	call	__snprintf
	add	esp, 16					; 00000010H

; 397  : 			if(put_html_button(cntxt, name->data, NULL, im, im1, printbuf, 0, 4)) STACK_ERROR;

	push	4
	push	0
	push	0
	push	0
	push	0
	lea	ecx, DWORD PTR _printbuf$[ebp]
	push	ecx
	mov	edx, DWORD PTR _im1$70694[ebp]
	push	edx
	mov	eax, DWORD PTR _im$70693[ebp]
	push	eax
	push	0
	mov	ecx, DWORD PTR _name$[ebp]
	add	ecx, 8
	push	ecx
	mov	edx, DWORD PTR _cntxt$[ebp]
	push	edx
	call	_put_html_button_sz
	add	esp, 44					; 0000002cH
	test	eax, eax
	je	SHORT $L70743
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 397		; 0000018dH
	jmp	$eva_err$70638
$L70743:

; 398  : 
; 399  : 			/* Output table footer & handle status */
; 400  : 			DYNBUF_ADD_STR(html, "</td></tr></table>")

	push	0
	push	0
	push	18					; 00000012H
	push	OFFSET FLAT:$SG70746
	mov	ecx, DWORD PTR _html$[ebp]
	push	ecx
	call	_dynbuf_add
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L70745
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29872], OFFSET FLAT:$SG70748
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 400		; 00000190H
	jmp	$eva_err$70638
$L70745:

; 401  : 			status[i] = (char)(c->col ? '1' : '0');

	mov	ecx, DWORD PTR _c$70692[ebp]
	xor	edx, edx
	cmp	DWORD PTR [ecx+56], 0
	setne	dl
	add	edx, 48					; 00000030H
	mov	eax, DWORD PTR _i$70687[ebp]
	mov	BYTE PTR _status$70688[ebp+eax], dl

; 402  : 		}

	jmp	$L70690
$L70691:

; 403  : 
; 404  : 		/* Output hidden input for status */
; 405  : 		CTRL_CGINAMESUBFIELD(&name, NULL, "EVENTS");

	push	6
	push	OFFSET FLAT:$SG70752
	push	68					; 00000044H
	lea	ecx, DWORD PTR _name$[ebp]
	push	ecx
	push	1
	push	0
	mov	edx, DWORD PTR _ctrl$[ebp]
	push	edx
	mov	eax, DWORD PTR _cntxt$[ebp]
	push	eax
	call	_ctrl_cgi_name
	add	esp, 32					; 00000020H
	test	eax, eax
	je	SHORT $L70751
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 405		; 00000195H
	jmp	$eva_err$70638
$L70751:

; 406  : 		DYNBUF_ADD3_BUF(html, "<input type=hidden name='", name, NO_CONV, "'");

	cmp	DWORD PTR _name$[ebp], 0
	je	SHORT $L71933
	mov	edx, DWORD PTR _name$[ebp]
	mov	eax, DWORD PTR [edx+4]
	mov	DWORD PTR -1232+[ebp], eax
	jmp	SHORT $L71934
$L71933:
	mov	DWORD PTR -1232+[ebp], 0
$L71934:
	cmp	DWORD PTR _name$[ebp], 0
	je	SHORT $L71935
	mov	ecx, DWORD PTR _name$[ebp]
	add	ecx, 8
	mov	DWORD PTR -1236+[ebp], ecx
	jmp	SHORT $L71936
$L71935:
	mov	DWORD PTR -1236+[ebp], 0
$L71936:
	push	1
	push	OFFSET FLAT:$SG70756
	push	0
	push	0
	mov	edx, DWORD PTR -1232+[ebp]
	push	edx
	mov	eax, DWORD PTR -1236+[ebp]
	push	eax
	push	25					; 00000019H
	push	OFFSET FLAT:$SG70757
	mov	ecx, DWORD PTR _html$[ebp]
	push	ecx
	call	_dynbuf_add3
	add	esp, 36					; 00000024H
	test	eax, eax
	je	SHORT $L70755
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29872], OFFSET FLAT:$SG70759
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 406		; 00000196H
	jmp	$eva_err$70638
$L70755:

; 407  : 		DYNBUF_ADD3(html, " value=", status, 0, NO_CONV, ">");

	push	1
	push	OFFSET FLAT:$SG70762
	push	0
	push	0
	push	0
	lea	ecx, DWORD PTR _status$70688[ebp]
	push	ecx
	push	7
	push	OFFSET FLAT:$SG70763
	mov	edx, DWORD PTR _html$[ebp]
	push	edx
	call	_dynbuf_add3
	add	esp, 36					; 00000024H
	test	eax, eax
	je	SHORT $L70761
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29872], OFFSET FLAT:$SG70765
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 407		; 00000197H
	jmp	SHORT $eva_err$70638
$L70761:

; 409  : 	DYNBUF_ADD_STR(html, "</td></tr></table></td></tr><tr>");

	push	0
	push	0
	push	32					; 00000020H
	push	OFFSET FLAT:$SG70768
	mov	edx, DWORD PTR _html$[ebp]
	push	edx
	call	_dynbuf_add
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L70767
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29872], OFFSET FLAT:$SG70770
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 409		; 00000199H
	jmp	SHORT $eva_err$70638
$L70767:
$eva_noerr$70771:

; 410  : 
; 411  : 	RETURN_OK_CLEANUP;

	push	0
	push	OFFSET FLAT:$SG70772
	push	OFFSET FLAT:$SG70773
	mov	edx, DWORD PTR _cntxt$[ebp]
	push	edx
	call	_err_clear
	add	esp, 16					; 00000010H
$eva_err$70638:
	mov	eax, DWORD PTR _cntxt$[ebp]
	cmp	DWORD PTR [eax+29872], 0
	je	SHORT $L70774
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	edx, DWORD PTR [ecx+29900]
	push	edx
	push	OFFSET FLAT:$SG70775
	push	OFFSET FLAT:$SG70776
	mov	eax, DWORD PTR _cntxt$[ebp]
	push	eax
	call	_err_add_context
	add	esp, 16					; 00000010H
$L70774:
	mov	ecx, DWORD PTR _name$[ebp]
	push	ecx
	call	_mem_free
	add	esp, 4
	mov	DWORD PTR _name$[ebp], 0
	mov	edx, DWORD PTR _cntxt$[ebp]
	xor	eax, eax
	cmp	DWORD PTR [edx+29872], 0
	setne	al
$L70615:

; 412  : }

	pop	edi
	mov	esp, ebp
	pop	ebp
	ret	0
_ctrl_output_calendar_title ENDP
_TEXT	ENDS
PUBLIC	_ctrl_output_calendar_cell
EXTRN	_form_eval_fieldexpr:NEAR
EXTRN	_table_row_bgcolor:NEAR
EXTRN	_no_quote:BYTE
EXTRN	_qry_obj_field:NEAR
EXTRN	_put_showhelp:NEAR
EXTRN	_ctrl_add_symbol_btn:NEAR
_BSS	SEGMENT
	ALIGN	4

$SG70855 DB	01H DUP (?)
	ALIGN	4

$SG70928 DB	01H DUP (?)
_BSS	ENDS
_DATA	SEGMENT
	ORG $+1
$SG70818 DB	'_EVA_DAY', 00H
	ORG $+3
$SG70828 DB	'FFFFFF', 00H
	ORG $+1
$SG70836 DB	'<tr>', 00H
	ORG $+3
$SG70838 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70844 DB	'_EVA_DAY', 00H
	ORG $+3
$SG70847 DB	'<td', 00H
$SG70849 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70856 DB	' width=3 bgcolor=#', 00H
	ORG $+1
$SG70858 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70861 DB	'>', 00H
	ORG $+2
$SG70863 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70867 DB	'&nbsp;', 00H
	ORG $+1
$SG70869 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70872 DB	'</td>', 00H
	ORG $+2
$SG70874 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70877 DB	'SYMBOL+OBJNOTES', 00H
$SG70880 DB	'D:\Travail\ABI\EVA\V4.0\CGI\Brunix-2016\ctrl_output_cale'
	DB	'ndar.c', 00H
	ORG $+1
$SG70881 DB	'ctrl_output_calendar_cell', 00H
	ORG $+2
$SG70884 DB	'D:\Travail\ABI\EVA\V4.0\CGI\Brunix-2016\ctrl_output_cale'
	DB	'ndar.c', 00H
	ORG $+1
$SG70885 DB	'ctrl_output_calendar_cell', 00H
	ORG $+2
$SG70889 DB	'%s', 00H
	ORG $+1
$SG70892 DB	'<td bgcolor=#%s><font size=%s>', 00H
	ORG $+1
$SG70895 DB	'<b>%s</b> ', 00H
	ORG $+1
$SG70899 DB	'<a href=''javascript:ol(%lu,%lu,%lu,%lu);''', 00H
	ORG $+2
$SG70904 DB	' ', 00H
	ORG $+2
$SG70905 DB	' title=''', 00H
	ORG $+3
$SG70907 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70908 DB	'_EVA_FullVarDay', 00H
$SG70911 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70913 DB	'''', 00H
	ORG $+2
$SG70914 DB	0aH, 0aH, 00H
	ORG $+1
$SG70916 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70920 DB	'>', 00H
	ORG $+2
$SG70922 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70927 DB	'</a></font></td></tr>', 00H
	ORG $+2
$SG70930 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70933 DB	')</font></td></tr>', 00H
	ORG $+1
$SG70934 DB	'<tr><td colspan=2><font size=-2>(<b>...</b>+', 00H
	ORG $+3
$SG70936 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70938 DB	'D:\Travail\ABI\EVA\V4.0\CGI\Brunix-2016\ctrl_output_cale'
	DB	'ndar.c', 00H
	ORG $+1
$SG70939 DB	'ctrl_output_calendar_cell', 00H
	ORG $+2
$SG70941 DB	'D:\Travail\ABI\EVA\V4.0\CGI\Brunix-2016\ctrl_output_cale'
	DB	'ndar.c', 00H
	ORG $+1
$SG70942 DB	'ctrl_output_calendar_cell', 00H
_DATA	ENDS
_TEXT	SEGMENT
_cntxt$ = 8
_cl$ = 12
_i0$ = 16
_dateend$ = 20
_form$ = -4
_ctrl$ = -1152
_data$ = -1052
_title$ = -1172
_detail$ = -1140
_i$ = -1144
_j$ = -1148
_curobj$ = -1056
_printbuf$ = -1028
_date$ = -1120
_html$ = -1032
_c$70808 = -1192
_line$70809 = -1184
_titlefield$70811 = -1208
_detailfield$70812 = -1180
_eventbgcolor$70813 = -1196
_openform$70814 = -1212
_b_button$70816 = -1176
_bgcolor$70819 = -1200
_objtype$70821 = -1204
_idobj$70822 = -1188
_line$70831 = -1216
_k$70833 = -1220
__c$70851 = -1224
_ctrl_output_calendar_cell PROC NEAR

; 429  : ){

	push	ebp
	mov	ebp, esp
	sub	esp, 1256				; 000004e8H

; 430  : 	EVA_form *form = cntxt->form;

	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	ecx, DWORD PTR [eax+80]
	mov	DWORD PTR _form$[ebp], ecx

; 431  : 	EVA_ctrl *ctrl = form->ctrl + cl->i_ctrl;

	mov	edx, DWORD PTR _cl$[ebp]
	mov	eax, DWORD PTR [edx+240]
	imul	eax, 480				; 000001e0H
	mov	ecx, DWORD PTR _form$[ebp]
	mov	edx, DWORD PTR [ecx]
	add	edx, eax
	mov	DWORD PTR _ctrl$[ebp], edx

; 432  : 	DynTable data = {0};

	mov	DWORD PTR _data$[ebp], 0
	xor	eax, eax
	mov	DWORD PTR _data$[ebp+4], eax
	mov	DWORD PTR _data$[ebp+8], eax
	mov	DWORD PTR _data$[ebp+12], eax
	mov	DWORD PTR _data$[ebp+16], eax

; 433  : 	DynTable title = {0};

	mov	DWORD PTR _title$[ebp], 0
	xor	ecx, ecx
	mov	DWORD PTR _title$[ebp+4], ecx
	mov	DWORD PTR _title$[ebp+8], ecx
	mov	DWORD PTR _title$[ebp+12], ecx
	mov	DWORD PTR _title$[ebp+16], ecx

; 434  : 	DynTable detail = {0};

	mov	DWORD PTR _detail$[ebp], 0
	xor	edx, edx
	mov	DWORD PTR _detail$[ebp+4], edx
	mov	DWORD PTR _detail$[ebp+8], edx
	mov	DWORD PTR _detail$[ebp+12], edx
	mov	DWORD PTR _detail$[ebp+16], edx

; 435  : 	unsigned long i, j, curobj = DYNTAB_TOUL(&form->id_obj);

	push	10					; 0000000aH
	push	0
	push	0
	push	0
	mov	eax, DWORD PTR _form$[ebp]
	add	eax, 32					; 00000020H
	push	eax
	call	_dyntab_val
	add	esp, 12					; 0000000cH
	push	eax
	call	_strtoul
	add	esp, 12					; 0000000cH
	mov	DWORD PTR _curobj$[ebp], eax

; 436  : 	char printbuf[1024], date[64];
; 437  : 	CHECK_HTML_STATUS;

	cmp	DWORD PTR _cntxt$[ebp], 0
	je	SHORT $L71940
	mov	ecx, DWORD PTR _cntxt$[ebp]
	cmp	DWORD PTR [ecx+80], 0
	je	SHORT $L71938
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	eax, DWORD PTR [edx+80]
	mov	ecx, DWORD PTR [eax+232]
	mov	DWORD PTR -1228+[ebp], ecx
	jmp	SHORT $L71939
$L71938:
	mov	DWORD PTR -1228+[ebp], 0
$L71939:
	mov	edx, DWORD PTR -1228+[ebp]
	mov	DWORD PTR -1232+[ebp], edx
	jmp	SHORT $L71941
$L71940:
	mov	DWORD PTR -1232+[ebp], 0
$L71941:
	mov	eax, DWORD PTR -1232+[ebp]
	mov	DWORD PTR _html$[ebp], eax
	cmp	DWORD PTR _html$[ebp], 0
	jne	SHORT $L70804
	xor	eax, eax
	jmp	$L70789
$L70804:

; 438  : 
; 439  : 	for(i = *i0, j = 0; i < cl->objlist.nbrows; i++, j++)

	mov	ecx, DWORD PTR _i0$[ebp]
	mov	edx, DWORD PTR [ecx]
	mov	DWORD PTR _i$[ebp], edx
	mov	DWORD PTR _j$[ebp], 0
	jmp	SHORT $L70805
$L70806:
	mov	eax, DWORD PTR _i$[ebp]
	add	eax, 1
	mov	DWORD PTR _i$[ebp], eax
	mov	ecx, DWORD PTR _j$[ebp]
	add	ecx, 1
	mov	DWORD PTR _j$[ebp], ecx
$L70805:
	mov	edx, DWORD PTR _cl$[ebp]
	mov	eax, DWORD PTR _i$[ebp]
	cmp	eax, DWORD PTR [edx+144]
	jae	$L70807

; 441  : 		/* Output row header */
; 442  : 		DynTableCell *c = dyntab_cell(&cl->objlist, i, 1);

	push	1
	mov	ecx, DWORD PTR _i$[ebp]
	push	ecx
	mov	edx, DWORD PTR _cl$[ebp]
	add	edx, 144				; 00000090H
	push	edx
	call	_dyntab_cell
	add	esp, 12					; 0000000cH
	mov	DWORD PTR _c$70808[ebp], eax

; 443  : 		unsigned long line = DYNTAB_TOULRC(&cl->objlist, i, 2);

	push	10					; 0000000aH
	push	0
	push	2
	mov	eax, DWORD PTR _i$[ebp]
	push	eax
	mov	ecx, DWORD PTR _cl$[ebp]
	add	ecx, 144				; 00000090H
	push	ecx
	call	_dyntab_val
	add	esp, 12					; 0000000cH
	push	eax
	call	_strtoul
	add	esp, 12					; 0000000cH
	mov	DWORD PTR _line$70809[ebp], eax

; 444  : 		DynTableCell *titlefield = dyntab_cell(&cl->titlefield, line, 0);

	push	0
	mov	edx, DWORD PTR _line$70809[ebp]
	push	edx
	mov	eax, DWORD PTR _cl$[ebp]
	add	eax, 44					; 0000002cH
	push	eax
	call	_dyntab_cell
	add	esp, 12					; 0000000cH
	mov	DWORD PTR _titlefield$70811[ebp], eax

; 445  : 		DynTableCell *detailfield = dyntab_cell(&cl->detailfield, line, 0);

	push	0
	mov	ecx, DWORD PTR _line$70809[ebp]
	push	ecx
	mov	edx, DWORD PTR _cl$[ebp]
	add	edx, 64					; 00000040H
	push	edx
	call	_dyntab_cell
	add	esp, 12					; 0000000cH
	mov	DWORD PTR _detailfield$70812[ebp], eax

; 446  : 		DynTableCell *eventbgcolor = dyntab_cell(&cl->eventbgcolor, line, 0);

	push	0
	mov	eax, DWORD PTR _line$70809[ebp]
	push	eax
	mov	ecx, DWORD PTR _cl$[ebp]
	add	ecx, 84					; 00000054H
	push	ecx
	call	_dyntab_cell
	add	esp, 12					; 0000000cH
	mov	DWORD PTR _eventbgcolor$70813[ebp], eax

; 447  : 		unsigned long openform = DYNTAB_TOULRC(&cl->openform, line, 0);

	push	10					; 0000000aH
	push	0
	push	0
	mov	edx, DWORD PTR _line$70809[ebp]
	push	edx
	mov	eax, DWORD PTR _cl$[ebp]
	add	eax, 104				; 00000068H
	push	eax
	call	_dyntab_val
	add	esp, 12					; 0000000cH
	push	eax
	call	_strtoul
	add	esp, 12					; 0000000cH
	mov	DWORD PTR _openform$70814[ebp], eax

; 448  : 		int b_button = !strcmp(cl->unit, "_EVA_DAY") || eventbgcolor == NULL;

	push	OFFSET FLAT:$SG70818
	mov	ecx, DWORD PTR _cl$[ebp]
	mov	edx, DWORD PTR [ecx+256]
	push	edx
	call	_strcmp
	add	esp, 8
	test	eax, eax
	je	SHORT $L71942
	cmp	DWORD PTR _eventbgcolor$70813[ebp], 0
	je	SHORT $L71942
	mov	DWORD PTR -1236+[ebp], 0
	jmp	SHORT $L71943
$L71942:
	mov	DWORD PTR -1236+[ebp], 1
$L71943:
	mov	eax, DWORD PTR -1236+[ebp]
	mov	DWORD PTR _b_button$70816[ebp], eax

; 449  : 		char *bgcolor = table_row_bgcolor(cntxt, ctrl->objtbl, i, NULL);

	push	0
	mov	ecx, DWORD PTR _i$[ebp]
	push	ecx
	mov	edx, DWORD PTR _ctrl$[ebp]
	mov	eax, DWORD PTR [edx+232]
	push	eax
	mov	ecx, DWORD PTR _cntxt$[ebp]
	push	ecx
	call	_table_row_bgcolor
	add	esp, 16					; 00000010H
	mov	DWORD PTR _bgcolor$70819[ebp], eax

; 450  : 		char *objtype = dyntab_val(&cl->filter, line, 1);

	push	1
	mov	edx, DWORD PTR _line$70809[ebp]
	push	edx
	mov	eax, DWORD PTR _cl$[ebp]
	push	eax
	call	_dyntab_val
	add	esp, 12					; 0000000cH
	mov	DWORD PTR _objtype$70821[ebp], eax

; 451  : 		unsigned long idobj = DYNTAB_TOULRC(&cl->objlist, i, 0);

	push	10					; 0000000aH
	push	0
	push	0
	mov	ecx, DWORD PTR _i$[ebp]
	push	ecx
	mov	edx, DWORD PTR _cl$[ebp]
	add	edx, 144				; 00000090H
	push	edx
	call	_dyntab_val
	add	esp, 12					; 0000000cH
	push	eax
	call	_strtoul
	add	esp, 12					; 0000000cH
	mov	DWORD PTR _idobj$70822[ebp], eax

; 452  : 		if(!c || !c->txt || strcmp(c->txt, dateend) >= 0) break;

	cmp	DWORD PTR _c$70808[ebp], 0
	je	SHORT $L70825
	mov	eax, DWORD PTR _c$70808[ebp]
	cmp	DWORD PTR [eax], 0
	je	SHORT $L70825
	mov	ecx, DWORD PTR _dateend$[ebp]
	push	ecx
	mov	edx, DWORD PTR _c$70808[ebp]
	mov	eax, DWORD PTR [edx]
	push	eax
	call	_strcmp
	add	esp, 8
	test	eax, eax
	jl	SHORT $L70824
$L70825:
	jmp	$L70807
$L70824:

; 453  : 		if(!bgcolor || !*bgcolor) bgcolor = "FFFFFF";

	cmp	DWORD PTR _bgcolor$70819[ebp], 0
	je	SHORT $L70827
	mov	ecx, DWORD PTR _bgcolor$70819[ebp]
	movsx	edx, BYTE PTR [ecx]
	test	edx, edx
	jne	SHORT $L70826
$L70827:
	mov	DWORD PTR _bgcolor$70819[ebp], OFFSET FLAT:$SG70828
$L70826:

; 454  : 
; 455  : 		/* Strip to max # of objects per cell */
; 456  : 		if(!cl->maxlines || j < cl->maxlines)

	mov	eax, DWORD PTR _cl$[ebp]
	cmp	DWORD PTR [eax+236], 0
	je	SHORT $L70830
	mov	ecx, DWORD PTR _cl$[ebp]
	mov	edx, DWORD PTR _j$[ebp]
	cmp	edx, DWORD PTR [ecx+236]
	jae	$L70926
$L70830:

; 458  : 			/* Output open button */
; 459  : 			unsigned long line = DYNTAB_TOULRC(&cl->objlist, i, 3);

	push	10					; 0000000aH
	push	0
	push	3
	mov	eax, DWORD PTR _i$[ebp]
	push	eax
	mov	ecx, DWORD PTR _cl$[ebp]
	add	ecx, 144				; 00000090H
	push	ecx
	call	_dyntab_val
	add	esp, 12					; 0000000cH
	push	eax
	call	_strtoul
	add	esp, 12					; 0000000cH
	mov	DWORD PTR _line$70831[ebp], eax

; 460  : 			unsigned long k;
; 461  : 			DYNBUF_ADD_STR(html, "<tr>");

	push	0
	push	0
	push	4
	push	OFFSET FLAT:$SG70836
	mov	edx, DWORD PTR _html$[ebp]
	push	edx
	call	_dynbuf_add
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L70835
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29872], OFFSET FLAT:$SG70838
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 461		; 000001cdH
	jmp	$eva_err$70839
$L70835:

; 462  : 			if(idobj != curobj && qry_obj_field(cntxt, &data, idobj, NULL)) STACK_ERROR;

	mov	edx, DWORD PTR _idobj$70822[ebp]
	cmp	edx, DWORD PTR _curobj$[ebp]
	je	SHORT $L70841
	push	0
	mov	eax, DWORD PTR _idobj$70822[ebp]
	push	eax
	lea	ecx, DWORD PTR _data$[ebp]
	push	ecx
	mov	edx, DWORD PTR _cntxt$[ebp]
	push	edx
	call	_qry_obj_field
	add	esp, 16					; 00000010H
	test	eax, eax
	je	SHORT $L70841
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 462		; 000001ceH
	jmp	$eva_err$70839
$L70841:

; 463  : 			if(!b_button || !strcmp(cl->unit, "_EVA_DAY"))

	cmp	DWORD PTR _b_button$70816[ebp], 0
	je	SHORT $L70843
	push	OFFSET FLAT:$SG70844
	mov	ecx, DWORD PTR _cl$[ebp]
	mov	edx, DWORD PTR [ecx+256]
	push	edx
	call	_strcmp
	add	esp, 8
	test	eax, eax
	jne	$L70871
$L70843:

; 465  : 				DYNBUF_ADD_STR(html, "<td");

	push	0
	push	0
	push	3
	push	OFFSET FLAT:$SG70847
	mov	eax, DWORD PTR _html$[ebp]
	push	eax
	call	_dynbuf_add
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L70846
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29872], OFFSET FLAT:$SG70849
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 465		; 000001d1H
	jmp	$eva_err$70839
$L70846:

; 466  : 				if(eventbgcolor) DYNBUF_ADD3_CELLP(html, " width=3 bgcolor=#", eventbgcolor, NO_CONV, "");

	cmp	DWORD PTR _eventbgcolor$70813[ebp], 0
	je	$L70854
	mov	eax, DWORD PTR _eventbgcolor$70813[ebp]
	mov	DWORD PTR __c$70851[ebp], eax
	cmp	DWORD PTR __c$70851[ebp], 0
	je	SHORT $L71944
	mov	ecx, DWORD PTR __c$70851[ebp]
	mov	edx, DWORD PTR [ecx+4]
	mov	DWORD PTR -1240+[ebp], edx
	jmp	SHORT $L71945
$L71944:
	mov	DWORD PTR -1240+[ebp], 0
$L71945:
	cmp	DWORD PTR __c$70851[ebp], 0
	je	SHORT $L71946
	mov	eax, DWORD PTR __c$70851[ebp]
	mov	ecx, DWORD PTR [eax]
	mov	DWORD PTR -1244+[ebp], ecx
	jmp	SHORT $L71947
$L71946:
	mov	DWORD PTR -1244+[ebp], 0
$L71947:
	push	0
	push	OFFSET FLAT:$SG70855
	push	0
	push	0
	mov	edx, DWORD PTR -1240+[ebp]
	push	edx
	mov	eax, DWORD PTR -1244+[ebp]
	push	eax
	push	18					; 00000012H
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
	mov	DWORD PTR [eax+29900], 466		; 000001d2H
	jmp	$eva_err$70839
$L70854:

; 467  : 				DYNBUF_ADD_STR(html, ">");

	push	0
	push	0
	push	1
	push	OFFSET FLAT:$SG70861
	mov	ecx, DWORD PTR _html$[ebp]
	push	ecx
	call	_dynbuf_add
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L70860
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29872], OFFSET FLAT:$SG70863
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 467		; 000001d3H
	jmp	$eva_err$70839
$L70860:

; 468  : 				if(eventbgcolor) DYNBUF_ADD_STR(html, "&nbsp;");

	cmp	DWORD PTR _eventbgcolor$70813[ebp], 0
	je	SHORT $L70866
	push	0
	push	0
	push	6
	push	OFFSET FLAT:$SG70867
	mov	ecx, DWORD PTR _html$[ebp]
	push	ecx
	call	_dynbuf_add
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L70866
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29872], OFFSET FLAT:$SG70869
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 468		; 000001d4H
	jmp	$eva_err$70839
$L70866:

; 469  : 				DYNBUF_ADD_STR(html, "</td>");

	push	0
	push	0
	push	5
	push	OFFSET FLAT:$SG70872
	mov	ecx, DWORD PTR _html$[ebp]
	push	ecx
	call	_dynbuf_add
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L70871
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29872], OFFSET FLAT:$SG70874
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 469		; 000001d5H
	jmp	$eva_err$70839
$L70871:

; 471  : 			if(b_button &&
; 472  : 				ctrl_add_symbol_btn(cntxt, ctrl, NULL, idobj == curobj ? & form->objdata : &data, 0, bgcolor, "SYMBOL+OBJNOTES"))

	cmp	DWORD PTR _b_button$70816[ebp], 0
	je	SHORT $L70876
	mov	ecx, DWORD PTR _idobj$70822[ebp]
	cmp	ecx, DWORD PTR _curobj$[ebp]
	jne	SHORT $L71948
	mov	edx, DWORD PTR _form$[ebp]
	add	edx, 52					; 00000034H
	mov	DWORD PTR -1248+[ebp], edx
	jmp	SHORT $L71949
$L71948:
	lea	eax, DWORD PTR _data$[ebp]
	mov	DWORD PTR -1248+[ebp], eax
$L71949:
	push	OFFSET FLAT:$SG70877
	mov	ecx, DWORD PTR _bgcolor$70819[ebp]
	push	ecx
	push	0
	mov	edx, DWORD PTR -1248+[ebp]
	push	edx
	push	0
	mov	eax, DWORD PTR _ctrl$[ebp]
	push	eax
	mov	ecx, DWORD PTR _cntxt$[ebp]
	push	ecx
	call	_ctrl_add_symbol_btn
	add	esp, 28					; 0000001cH
	test	eax, eax
	je	SHORT $L70876

; 473  : 					STACK_ERROR;

	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 473		; 000001d9H
	jmp	$eva_err$70839
$L70876:

; 474  : 
; 475  : 			/* Output object title */
; 476  : 			if(titlefield && titlefield->txt &&
; 477  : 				form_eval_fieldexpr(cntxt, &title, 0, idobj, titlefield->txt, titlefield->len, idobj == curobj ? NULL : &data, 0))

	cmp	DWORD PTR _titlefield$70811[ebp], 0
	je	SHORT $L70879
	mov	eax, DWORD PTR _titlefield$70811[ebp]
	cmp	DWORD PTR [eax], 0
	je	SHORT $L70879
	push	0
	mov	ecx, DWORD PTR _idobj$70822[ebp]
	sub	ecx, DWORD PTR _curobj$[ebp]
	neg	ecx
	sbb	ecx, ecx
	lea	edx, DWORD PTR _data$[ebp]
	and	ecx, edx
	push	ecx
	mov	eax, DWORD PTR _titlefield$70811[ebp]
	mov	ecx, DWORD PTR [eax+4]
	push	ecx
	mov	edx, DWORD PTR _titlefield$70811[ebp]
	mov	eax, DWORD PTR [edx]
	push	eax
	mov	ecx, DWORD PTR _idobj$70822[ebp]
	push	ecx
	push	0
	lea	edx, DWORD PTR _title$[ebp]
	push	edx
	mov	eax, DWORD PTR _cntxt$[ebp]
	push	eax
	call	_form_eval_fieldexpr
	add	esp, 32					; 00000020H
	test	eax, eax
	je	SHORT $L70879

; 478  : 					CLEAR_ERROR;

	push	478					; 000001deH
	push	OFFSET FLAT:$SG70880
	push	OFFSET FLAT:$SG70881
	mov	ecx, DWORD PTR _cntxt$[ebp]
	push	ecx
	call	_err_clear
	add	esp, 16					; 00000010H
$L70879:

; 479  : 			if(detailfield && detailfield->txt &&
; 480  : 				form_eval_fieldexpr(cntxt, &detail, 0, idobj, detailfield->txt, detailfield->len, idobj == curobj ? NULL : &data, 0))

	cmp	DWORD PTR _detailfield$70812[ebp], 0
	je	SHORT $L70883
	mov	edx, DWORD PTR _detailfield$70812[ebp]
	cmp	DWORD PTR [edx], 0
	je	SHORT $L70883
	push	0
	mov	eax, DWORD PTR _idobj$70822[ebp]
	sub	eax, DWORD PTR _curobj$[ebp]
	neg	eax
	sbb	eax, eax
	lea	ecx, DWORD PTR _data$[ebp]
	and	eax, ecx
	push	eax
	mov	edx, DWORD PTR _detailfield$70812[ebp]
	mov	eax, DWORD PTR [edx+4]
	push	eax
	mov	ecx, DWORD PTR _detailfield$70812[ebp]
	mov	edx, DWORD PTR [ecx]
	push	edx
	mov	eax, DWORD PTR _idobj$70822[ebp]
	push	eax
	push	0
	lea	ecx, DWORD PTR _detail$[ebp]
	push	ecx
	mov	edx, DWORD PTR _cntxt$[ebp]
	push	edx
	call	_form_eval_fieldexpr
	add	esp, 32					; 00000020H
	test	eax, eax
	je	SHORT $L70883

; 481  : 					CLEAR_ERROR;

	push	481					; 000001e1H
	push	OFFSET FLAT:$SG70884
	push	OFFSET FLAT:$SG70885
	mov	eax, DWORD PTR _cntxt$[ebp]
	push	eax
	call	_err_clear
	add	esp, 16					; 00000010H
$L70883:

; 482  : 			if(cl->datefmt && c && c->len >= cl->datefmt_minsz)

	mov	ecx, DWORD PTR _cl$[ebp]
	cmp	DWORD PTR [ecx+248], 0
	je	SHORT $L70886
	cmp	DWORD PTR _c$70808[ebp], 0
	je	SHORT $L70886
	mov	edx, DWORD PTR _c$70808[ebp]
	mov	eax, DWORD PTR _cl$[ebp]
	mov	ecx, DWORD PTR [edx+4]
	cmp	ecx, DWORD PTR [eax+252]
	jb	SHORT $L70886

; 483  : 				datetxt_to_format(cntxt, date, c->txt, cl->datefmt);

	mov	edx, DWORD PTR _cl$[ebp]
	mov	eax, DWORD PTR [edx+248]
	push	eax
	mov	ecx, DWORD PTR _c$70808[ebp]
	mov	edx, DWORD PTR [ecx]
	push	edx
	lea	eax, DWORD PTR _date$[ebp]
	push	eax
	mov	ecx, DWORD PTR _cntxt$[ebp]
	push	ecx
	call	_datetxt_to_format
	add	esp, 16					; 00000010H

; 484  : 			else if(!eventbgcolor && !b_button) snprintf(add_sz_str(date), "%s",	objtype);

	jmp	SHORT $L70890
$L70886:
	cmp	DWORD PTR _eventbgcolor$70813[ebp], 0
	jne	SHORT $L70888
	cmp	DWORD PTR _b_button$70816[ebp], 0
	jne	SHORT $L70888
	mov	edx, DWORD PTR _objtype$70821[ebp]
	push	edx
	push	OFFSET FLAT:$SG70889
	push	63					; 0000003fH
	lea	eax, DWORD PTR _date$[ebp]
	push	eax
	call	__snprintf
	add	esp, 16					; 00000010H

; 485  : 			else *date = 0;

	jmp	SHORT $L70890
$L70888:
	mov	BYTE PTR _date$[ebp], 0
$L70890:

; 486  : 			dynbuf_print2(html, "<td bgcolor=#%s><font size=%s>", bgcolor, cl->fontsize);

	push	0
	push	0
	mov	ecx, DWORD PTR _cl$[ebp]
	mov	edx, DWORD PTR [ecx+268]
	push	edx
	mov	eax, DWORD PTR _bgcolor$70819[ebp]
	push	eax
	push	OFFSET FLAT:$SG70892
	push	1023					; 000003ffH
	lea	ecx, DWORD PTR _printbuf$[ebp]
	push	ecx
	call	__snprintf
	add	esp, 20					; 00000014H
	push	eax
	lea	edx, DWORD PTR _printbuf$[ebp]
	push	edx
	mov	eax, DWORD PTR _html$[ebp]
	push	eax
	call	_dynbuf_add
	add	esp, 20					; 00000014H

; 487  : 			if(*date) dynbuf_print(html, "<b>%s</b> ", date);

	movsx	ecx, BYTE PTR _date$[ebp]
	test	ecx, ecx
	je	SHORT $L70893
	push	0
	push	0
	lea	edx, DWORD PTR _date$[ebp]
	push	edx
	push	OFFSET FLAT:$SG70895
	push	1023					; 000003ffH
	lea	eax, DWORD PTR _printbuf$[ebp]
	push	eax
	call	__snprintf
	add	esp, 16					; 00000010H
	push	eax
	lea	ecx, DWORD PTR _printbuf$[ebp]
	push	ecx
	mov	edx, DWORD PTR _html$[ebp]
	push	edx
	call	_dynbuf_add
	add	esp, 20					; 00000014H
$L70893:

; 488  : 			dynbuf_print4(html, "<a href='javascript:ol(%lu,%lu,%lu,%lu);'", idobj, openform,
; 489  : 							DYNTAB_TOUL(&cntxt->form->id_form),
; 490  : 							DYNTAB_TOUL(&cntxt->form->id_obj));

	push	0
	push	0
	push	10					; 0000000aH
	push	0
	push	0
	push	0
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	ecx, DWORD PTR [eax+80]
	add	ecx, 32					; 00000020H
	push	ecx
	call	_dyntab_val
	add	esp, 12					; 0000000cH
	push	eax
	call	_strtoul
	add	esp, 12					; 0000000cH
	push	eax
	push	10					; 0000000aH
	push	0
	push	0
	push	0
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	eax, DWORD PTR [edx+80]
	add	eax, 12					; 0000000cH
	push	eax
	call	_dyntab_val
	add	esp, 12					; 0000000cH
	push	eax
	call	_strtoul
	add	esp, 12					; 0000000cH
	push	eax
	mov	ecx, DWORD PTR _openform$70814[ebp]
	push	ecx
	mov	edx, DWORD PTR _idobj$70822[ebp]
	push	edx
	push	OFFSET FLAT:$SG70899
	push	1023					; 000003ffH
	lea	eax, DWORD PTR _printbuf$[ebp]
	push	eax
	call	__snprintf
	add	esp, 28					; 0000001cH
	push	eax
	lea	ecx, DWORD PTR _printbuf$[ebp]
	push	ecx
	mov	edx, DWORD PTR _html$[ebp]
	push	edx
	call	_dynbuf_add
	add	esp, 20					; 00000014H

; 491  : 			k = detail.nbrows ? detail.nbrows - 1 : 0; while(k && dyntab_cell(&detail, k, 0)->Line != line) k--;

	cmp	DWORD PTR _detail$[ebp], 0
	je	SHORT $L71950
	mov	eax, DWORD PTR _detail$[ebp]
	sub	eax, 1
	mov	DWORD PTR -1252+[ebp], eax
	jmp	SHORT $L71951
$L71950:
	mov	DWORD PTR -1252+[ebp], 0
$L71951:
	mov	ecx, DWORD PTR -1252+[ebp]
	mov	DWORD PTR _k$70833[ebp], ecx
$L70901:
	cmp	DWORD PTR _k$70833[ebp], 0
	je	SHORT $L70902
	push	0
	mov	edx, DWORD PTR _k$70833[ebp]
	push	edx
	lea	eax, DWORD PTR _detail$[ebp]
	push	eax
	call	_dyntab_cell
	add	esp, 12					; 0000000cH
	mov	ecx, DWORD PTR [eax+40]
	cmp	ecx, DWORD PTR _line$70831[ebp]
	je	SHORT $L70902
	mov	edx, DWORD PTR _k$70833[ebp]
	sub	edx, 1
	mov	DWORD PTR _k$70833[ebp], edx
	jmp	SHORT $L70901
$L70902:

; 492  : 			DYNBUF_ADD3(html, " title='", objtype, 0, HTML_TOOLTIP, " ");

	push	1
	push	OFFSET FLAT:$SG70904
	push	1
	push	OFFSET FLAT:_html_tooltip
	push	0
	mov	eax, DWORD PTR _objtype$70821[ebp]
	push	eax
	push	8
	push	OFFSET FLAT:$SG70905
	mov	ecx, DWORD PTR _html$[ebp]
	push	ecx
	call	_dynbuf_add3
	add	esp, 36					; 00000024H
	test	eax, eax
	je	SHORT $L70903
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29872], OFFSET FLAT:$SG70907
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 492		; 000001ecH
	jmp	$eva_err$70839
$L70903:

; 493  : 			datetxt_to_format(cntxt, date, c->txt, "_EVA_FullVarDay");

	push	OFFSET FLAT:$SG70908
	mov	ecx, DWORD PTR _c$70808[ebp]
	mov	edx, DWORD PTR [ecx]
	push	edx
	lea	eax, DWORD PTR _date$[ebp]
	push	eax
	mov	ecx, DWORD PTR _cntxt$[ebp]
	push	ecx
	call	_datetxt_to_format
	add	esp, 16					; 00000010H

; 494  : 			DYNBUF_ADD(html, date, 0, HTML_NO_QUOTE);

	push	1
	push	OFFSET FLAT:_no_quote
	push	0
	lea	edx, DWORD PTR _date$[ebp]
	push	edx
	mov	eax, DWORD PTR _html$[ebp]
	push	eax
	call	_dynbuf_add
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L70909
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29872], OFFSET FLAT:$SG70911
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 494		; 000001eeH
	jmp	$eva_err$70839
$L70909:

; 495  : 			DYNBUF_ADD3_CELL(html, "\n\n", &detail, k, 0, HTML_TOOLTIP, "'");

	push	1
	push	OFFSET FLAT:$SG70913
	push	1
	push	OFFSET FLAT:_html_tooltip
	push	0
	mov	eax, DWORD PTR _k$70833[ebp]
	push	eax
	lea	ecx, DWORD PTR _detail$[ebp]
	push	ecx
	call	_dyntab_sz
	add	esp, 12					; 0000000cH
	push	eax
	push	0
	mov	edx, DWORD PTR _k$70833[ebp]
	push	edx
	lea	eax, DWORD PTR _detail$[ebp]
	push	eax
	call	_dyntab_val
	add	esp, 12					; 0000000cH
	push	eax
	push	2
	push	OFFSET FLAT:$SG70914
	mov	ecx, DWORD PTR _html$[ebp]
	push	ecx
	call	_dynbuf_add3
	add	esp, 36					; 00000024H
	test	eax, eax
	je	SHORT $L70912
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29872], OFFSET FLAT:$SG70916
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 495		; 000001efH
	jmp	$eva_err$70839
$L70912:

; 496  : 			if(put_showhelp(cntxt, html)) STACK_ERROR;

	mov	ecx, DWORD PTR _html$[ebp]
	push	ecx
	mov	edx, DWORD PTR _cntxt$[ebp]
	push	edx
	call	_put_showhelp
	add	esp, 8
	test	eax, eax
	je	SHORT $L70917
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 496		; 000001f0H
	jmp	$eva_err$70839
$L70917:

; 497  : 			DYNBUF_ADD_STR(html, ">");

	push	0
	push	0
	push	1
	push	OFFSET FLAT:$SG70920
	mov	ecx, DWORD PTR _html$[ebp]
	push	ecx
	call	_dynbuf_add
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L70919
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29872], OFFSET FLAT:$SG70922
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 497		; 000001f1H
	jmp	$eva_err$70839
$L70919:

; 498  : 			k = title.nbrows ? title.nbrows - 1 : 0; while(k && dyntab_cell(&title, k, 0)->Line != line) k--;

	cmp	DWORD PTR _title$[ebp], 0
	je	SHORT $L71952
	mov	ecx, DWORD PTR _title$[ebp]
	sub	ecx, 1
	mov	DWORD PTR -1256+[ebp], ecx
	jmp	SHORT $L71953
$L71952:
	mov	DWORD PTR -1256+[ebp], 0
$L71953:
	mov	edx, DWORD PTR -1256+[ebp]
	mov	DWORD PTR _k$70833[ebp], edx
$L70924:
	cmp	DWORD PTR _k$70833[ebp], 0
	je	SHORT $L70925
	push	0
	mov	eax, DWORD PTR _k$70833[ebp]
	push	eax
	lea	ecx, DWORD PTR _title$[ebp]
	push	ecx
	call	_dyntab_cell
	add	esp, 12					; 0000000cH
	mov	edx, DWORD PTR [eax+40]
	cmp	edx, DWORD PTR _line$70831[ebp]
	je	SHORT $L70925
	mov	eax, DWORD PTR _k$70833[ebp]
	sub	eax, 1
	mov	DWORD PTR _k$70833[ebp], eax
	jmp	SHORT $L70924
$L70925:

; 499  : 			DYNBUF_ADD3_CELL(html, "", &title, k, 0, TO_HTML, "</a></font></td></tr>");

	push	21					; 00000015H
	push	OFFSET FLAT:$SG70927
	push	1
	push	OFFSET FLAT:_plain_to_html
	push	0
	mov	ecx, DWORD PTR _k$70833[ebp]
	push	ecx
	lea	edx, DWORD PTR _title$[ebp]
	push	edx
	call	_dyntab_sz
	add	esp, 12					; 0000000cH
	push	eax
	push	0
	mov	eax, DWORD PTR _k$70833[ebp]
	push	eax
	lea	ecx, DWORD PTR _title$[ebp]
	push	ecx
	call	_dyntab_val
	add	esp, 12					; 0000000cH
	push	eax
	push	0
	push	OFFSET FLAT:$SG70928
	mov	edx, DWORD PTR _html$[ebp]
	push	edx
	call	_dynbuf_add3
	add	esp, 36					; 00000024H
	test	eax, eax
	je	SHORT $L70926
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29872], OFFSET FLAT:$SG70930
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 499		; 000001f3H
	jmp	$eva_err$70839
$L70926:

; 501  : 	}

	jmp	$L70806
$L70807:

; 502  : 	if(cl->maxlines && j > cl->maxlines)

	mov	edx, DWORD PTR _cl$[ebp]
	cmp	DWORD PTR [edx+236], 0
	je	SHORT $L70932
	mov	eax, DWORD PTR _cl$[ebp]
	mov	ecx, DWORD PTR _j$[ebp]
	cmp	ecx, DWORD PTR [eax+236]
	jbe	SHORT $L70932

; 503  : 		DYNBUF_ADD3_INT(html, "<tr><td colspan=2><font size=-2>(<b>...</b>+", j - cl->maxlines, ")</font></td></tr>");

	push	18					; 00000012H
	push	OFFSET FLAT:$SG70933
	mov	edx, DWORD PTR _cl$[ebp]
	mov	eax, DWORD PTR _j$[ebp]
	sub	eax, DWORD PTR [edx+236]
	push	eax
	push	44					; 0000002cH
	push	OFFSET FLAT:$SG70934
	mov	ecx, DWORD PTR _html$[ebp]
	push	ecx
	call	_dynbuf_add3_int
	add	esp, 24					; 00000018H
	test	eax, eax
	je	SHORT $L70932
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29872], OFFSET FLAT:$SG70936
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 503		; 000001f7H
	jmp	SHORT $eva_err$70839
$L70932:

; 504  : 	*i0 = i;

	mov	ecx, DWORD PTR _i0$[ebp]
	mov	edx, DWORD PTR _i$[ebp]
	mov	DWORD PTR [ecx], edx
$eva_noerr$70937:

; 505  : 
; 506  : 	RETURN_OK_CLEANUP;

	push	0
	push	OFFSET FLAT:$SG70938
	push	OFFSET FLAT:$SG70939
	mov	eax, DWORD PTR _cntxt$[ebp]
	push	eax
	call	_err_clear
	add	esp, 16					; 00000010H
$eva_err$70839:
	mov	ecx, DWORD PTR _cntxt$[ebp]
	cmp	DWORD PTR [ecx+29872], 0
	je	SHORT $L70940
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	eax, DWORD PTR [edx+29900]
	push	eax
	push	OFFSET FLAT:$SG70941
	push	OFFSET FLAT:$SG70942
	mov	ecx, DWORD PTR _cntxt$[ebp]
	push	ecx
	call	_err_add_context
	add	esp, 16					; 00000010H
$L70940:
	lea	edx, DWORD PTR _data$[ebp]
	push	edx
	call	_dyntab_free
	add	esp, 4
	lea	eax, DWORD PTR _title$[ebp]
	push	eax
	call	_dyntab_free
	add	esp, 4
	lea	ecx, DWORD PTR _detail$[ebp]
	push	ecx
	call	_dyntab_free
	add	esp, 4
	mov	edx, DWORD PTR _cntxt$[ebp]
	xor	eax, eax
	cmp	DWORD PTR [edx+29872], 0
	setne	al
$L70789:

; 507  : }

	mov	esp, ebp
	pop	ebp
	ret	0
_ctrl_output_calendar_cell ENDP
_TEXT	ENDS
PUBLIC	_date_minimize
_DATA	SEGMENT
	ORG $+2
$SG70951 DB	'00', 00H
	ORG $+1
$SG70953 DB	'00', 00H
	ORG $+1
$SG70955 DB	'00', 00H
	ORG $+1
$SG70957 DB	'01', 00H
	ORG $+1
$SG70959 DB	'01', 00H
_DATA	ENDS
_TEXT	SEGMENT
_d$ = 8
_sz$ = -4
_date_minimize PROC NEAR

; 517  : ){

	push	ebp
	mov	ebp, esp
	sub	esp, 8

; 518  : 	size_t sz = d ? strlen(d) : 0;

	cmp	DWORD PTR _d$[ebp], 0
	je	SHORT $L71955
	mov	eax, DWORD PTR _d$[ebp]
	push	eax
	call	_strlen
	add	esp, 4
	mov	DWORD PTR -8+[ebp], eax
	jmp	SHORT $L71956
$L71955:
	mov	DWORD PTR -8+[ebp], 0
$L71956:
	mov	ecx, DWORD PTR -8+[ebp]
	mov	DWORD PTR _sz$[ebp], ecx

; 519  : 	if(sz < 5) return;

	cmp	DWORD PTR _sz$[ebp], 5
	jae	SHORT $L70949
	jmp	$L70958
$L70949:

; 520  : 	if(sz > 12 && !strcmp(d + 12, "00")) d[12] = 0;

	cmp	DWORD PTR _sz$[ebp], 12			; 0000000cH
	jbe	SHORT $L70950
	push	OFFSET FLAT:$SG70951
	mov	edx, DWORD PTR _d$[ebp]
	add	edx, 12					; 0000000cH
	push	edx
	call	_strcmp
	add	esp, 8
	test	eax, eax
	jne	SHORT $L70950
	mov	eax, DWORD PTR _d$[ebp]
	mov	BYTE PTR [eax+12], 0
$L70950:

; 521  : 	if(sz > 10 && !strcmp(d + 10, "00")) d[10] = 0;

	cmp	DWORD PTR _sz$[ebp], 10			; 0000000aH
	jbe	SHORT $L70952
	push	OFFSET FLAT:$SG70953
	mov	ecx, DWORD PTR _d$[ebp]
	add	ecx, 10					; 0000000aH
	push	ecx
	call	_strcmp
	add	esp, 8
	test	eax, eax
	jne	SHORT $L70952
	mov	edx, DWORD PTR _d$[ebp]
	mov	BYTE PTR [edx+10], 0
$L70952:

; 522  : 	if(sz > 8 && !strcmp(d + 8, "00")) d[8] = 0;

	cmp	DWORD PTR _sz$[ebp], 8
	jbe	SHORT $L70954
	push	OFFSET FLAT:$SG70955
	mov	eax, DWORD PTR _d$[ebp]
	add	eax, 8
	push	eax
	call	_strcmp
	add	esp, 8
	test	eax, eax
	jne	SHORT $L70954
	mov	ecx, DWORD PTR _d$[ebp]
	mov	BYTE PTR [ecx+8], 0
$L70954:

; 523  : 	if(sz > 6 && !strcmp(d + 6, "01")) d[6] = 0;

	cmp	DWORD PTR _sz$[ebp], 6
	jbe	SHORT $L70956
	push	OFFSET FLAT:$SG70957
	mov	edx, DWORD PTR _d$[ebp]
	add	edx, 6
	push	edx
	call	_strcmp
	add	esp, 8
	test	eax, eax
	jne	SHORT $L70956
	mov	eax, DWORD PTR _d$[ebp]
	mov	BYTE PTR [eax+6], 0
$L70956:

; 524  : 	if(!strcmp(d + 4, "01")) d[4] = 0;

	push	OFFSET FLAT:$SG70959
	mov	ecx, DWORD PTR _d$[ebp]
	add	ecx, 4
	push	ecx
	call	_strcmp
	add	esp, 8
	test	eax, eax
	jne	SHORT $L70958
	mov	edx, DWORD PTR _d$[ebp]
	mov	BYTE PTR [edx+4], 0
$L70958:

; 525  : }

	mov	esp, ebp
	pop	ebp
	ret	0
_date_minimize ENDP
_TEXT	ENDS
PUBLIC	_ctrl_output_calendar_dayhours
_DATA	SEGMENT
	ORG $+1
$SG70987 DB	'0101', 00H
	ORG $+3
$SG70990 DB	'01', 00H
	ORG $+1
$SG70991 DB	'%s%s', 00H
	ORG $+3
$SG70992 DB	'%s%s', 00H
	ORG $+3
$SG71003 DB	'</tr><tr>', 00H
	ORG $+2
$SG71005 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG71008 DB	'D:\Travail\ABI\EVA\V4.0\CGI\Brunix-2016\ctrl_output_cale'
	DB	'ndar.c', 00H
	ORG $+1
$SG71009 DB	'ctrl_output_calendar_dayhours', 00H
	ORG $+2
$SG71011 DB	'D:\Travail\ABI\EVA\V4.0\CGI\Brunix-2016\ctrl_output_cale'
	DB	'ndar.c', 00H
	ORG $+1
$SG71012 DB	'ctrl_output_calendar_dayhours', 00H
	ORG $+2
$SG71015 DB	'<td>&nbsp;</td>', 00H
_DATA	ENDS
_TEXT	SEGMENT
_cntxt$ = 8
_cl$ = 12
_i0$ = 16
_h0$ = 20
_h1$ = 24
_dateday$ = 28
_cnt$ = -28
_date0$ = -44
_date1$ = -60
_d$ = -24
_sz$ = -64
_szini$ = -4
_html$ = -8
_datenext$70996 = -68
_ctrl_output_calendar_dayhours PROC NEAR

; 540  : ){

	push	ebp
	mov	ebp, esp
	sub	esp, 76					; 0000004cH

; 541  : 	unsigned long cnt = *i0;

	mov	eax, DWORD PTR _i0$[ebp]
	mov	ecx, DWORD PTR [eax]
	mov	DWORD PTR _cnt$[ebp], ecx

; 542  : 	char date0[16], date1[16], d[16];
; 543  : 	size_t sz = strlen(dateday);

	mov	edx, DWORD PTR _dateday$[ebp]
	push	edx
	call	_strlen
	add	esp, 4
	mov	DWORD PTR _sz$[ebp], eax

; 544  : 	size_t szini;
; 545  : 	CHECK_HTML_STATUS;

	cmp	DWORD PTR _cntxt$[ebp], 0
	je	SHORT $L71960
	mov	eax, DWORD PTR _cntxt$[ebp]
	cmp	DWORD PTR [eax+80], 0
	je	SHORT $L71958
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	edx, DWORD PTR [ecx+80]
	mov	eax, DWORD PTR [edx+232]
	mov	DWORD PTR -72+[ebp], eax
	jmp	SHORT $L71959
$L71958:
	mov	DWORD PTR -72+[ebp], 0
$L71959:
	mov	ecx, DWORD PTR -72+[ebp]
	mov	DWORD PTR -76+[ebp], ecx
	jmp	SHORT $L71961
$L71960:
	mov	DWORD PTR -76+[ebp], 0
$L71961:
	mov	edx, DWORD PTR -76+[ebp]
	mov	DWORD PTR _html$[ebp], edx
	cmp	DWORD PTR _html$[ebp], 0
	jne	SHORT $L70985
	xor	eax, eax
	jmp	$L70975
$L70985:

; 546  : 	szini = (*html)->cnt;

	mov	eax, DWORD PTR _html$[ebp]
	mov	ecx, DWORD PTR [eax]
	mov	edx, DWORD PTR [ecx+4]
	mov	DWORD PTR _szini$[ebp], edx

; 547  : 
; 548  : 	/* Normalize dateday */
; 549  : 	strcpy(d, dateday);

	mov	eax, DWORD PTR _dateday$[ebp]
	push	eax
	lea	ecx, DWORD PTR _d$[ebp]
	push	ecx
	call	_strcpy
	add	esp, 8

; 550  : 	if(sz < 6) strcpy(d + 4, "0101");

	cmp	DWORD PTR _sz$[ebp], 6
	jae	SHORT $L70986
	push	OFFSET FLAT:$SG70987
	lea	edx, DWORD PTR _d$[ebp+4]
	push	edx
	call	_strcpy
	add	esp, 8

; 551  : 	else if(sz < 8)	strcpy(d + 6, "01");

	jmp	SHORT $L70989
$L70986:
	cmp	DWORD PTR _sz$[ebp], 8
	jae	SHORT $L70989
	push	OFFSET FLAT:$SG70990
	lea	eax, DWORD PTR _d$[ebp+6]
	push	eax
	call	_strcpy
	add	esp, 8
$L70989:

; 552  : 
; 553  : 	/* Set date range */
; 554  : 	snprintf(add_sz_str(date0), "%s%s", d, h0);

	mov	ecx, DWORD PTR _h0$[ebp]
	push	ecx
	lea	edx, DWORD PTR _d$[ebp]
	push	edx
	push	OFFSET FLAT:$SG70991
	push	15					; 0000000fH
	lea	eax, DWORD PTR _date0$[ebp]
	push	eax
	call	__snprintf
	add	esp, 20					; 00000014H

; 555  : 	date_minimize(date0);

	lea	ecx, DWORD PTR _date0$[ebp]
	push	ecx
	call	_date_minimize
	add	esp, 4

; 556  : 	snprintf(add_sz_str(date1), "%s%s", d, h1);

	mov	edx, DWORD PTR _h1$[ebp]
	push	edx
	lea	eax, DWORD PTR _d$[ebp]
	push	eax
	push	OFFSET FLAT:$SG70992
	push	15					; 0000000fH
	lea	ecx, DWORD PTR _date1$[ebp]
	push	ecx
	call	__snprintf
	add	esp, 20					; 00000014H

; 557  : 	date_minimize(date1);

	lea	edx, DWORD PTR _date1$[ebp]
	push	edx
	call	_date_minimize
	add	esp, 4
$L70994:

; 558  : 
; 559  : 	/* Reach first event in range */
; 560  : 	while(*i0 < cl->objlist.nbrows)

	mov	eax, DWORD PTR _i0$[ebp]
	mov	ecx, DWORD PTR _cl$[ebp]
	mov	edx, DWORD PTR [eax]
	cmp	edx, DWORD PTR [ecx+144]
	jae	SHORT $L70995

; 562  : 		char *datenext = dyntab_val(&cl->objlist, *i0, 1);

	push	1
	mov	eax, DWORD PTR _i0$[ebp]
	mov	ecx, DWORD PTR [eax]
	push	ecx
	mov	edx, DWORD PTR _cl$[ebp]
	add	edx, 144				; 00000090H
	push	edx
	call	_dyntab_val
	add	esp, 12					; 0000000cH
	mov	DWORD PTR _datenext$70996[ebp], eax

; 563  : 		if(strcmp(datenext, date1) >= 0) RETURN_OK;

	lea	eax, DWORD PTR _date1$[ebp]
	push	eax
	mov	ecx, DWORD PTR _datenext$70996[ebp]
	push	ecx
	call	_strcmp
	add	esp, 8
	test	eax, eax
	jl	SHORT $L70997
	jmp	$eva_noerr$70998
$L70997:

; 564  : 		if(strcmp(datenext, date0) >= 0) break;

	lea	edx, DWORD PTR _date0$[ebp]
	push	edx
	mov	eax, DWORD PTR _datenext$70996[ebp]
	push	eax
	call	_strcmp
	add	esp, 8
	test	eax, eax
	jl	SHORT $L70999
	jmp	SHORT $L70995
$L70999:

; 565  : 		(*i0)++;

	mov	ecx, DWORD PTR _i0$[ebp]
	mov	edx, DWORD PTR [ecx]
	add	edx, 1
	mov	eax, DWORD PTR _i0$[ebp]
	mov	DWORD PTR [eax], edx

; 566  : 	}

	jmp	SHORT $L70994
$L70995:

; 567  : 
; 568  : 	/* Output calendar cell */
; 569  : 	if(cnt < *i0) DYNBUF_ADD_STR(html, "</tr><tr>");

	mov	ecx, DWORD PTR _i0$[ebp]
	mov	edx, DWORD PTR _cnt$[ebp]
	cmp	edx, DWORD PTR [ecx]
	jae	SHORT $L71002
	push	0
	push	0
	push	9
	push	OFFSET FLAT:$SG71003
	mov	eax, DWORD PTR _html$[ebp]
	push	eax
	call	_dynbuf_add
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L71002
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29872], OFFSET FLAT:$SG71005
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 569		; 00000239H
	jmp	SHORT $eva_err$71006
$L71002:

; 570  : 	if(ctrl_output_calendar_cell(cntxt, cl, i0, date1)) STACK_ERROR;

	lea	eax, DWORD PTR _date1$[ebp]
	push	eax
	mov	ecx, DWORD PTR _i0$[ebp]
	push	ecx
	mov	edx, DWORD PTR _cl$[ebp]
	push	edx
	mov	eax, DWORD PTR _cntxt$[ebp]
	push	eax
	call	_ctrl_output_calendar_cell
	add	esp, 16					; 00000010H
	test	eax, eax
	je	SHORT $eva_noerr$70998
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 570		; 0000023aH
	jmp	SHORT $eva_err$71006
$eva_noerr$70998:

; 571  : 
; 572  : 	RETURN_OK_CLEANUP;

	push	0
	push	OFFSET FLAT:$SG71008
	push	OFFSET FLAT:$SG71009
	mov	edx, DWORD PTR _cntxt$[ebp]
	push	edx
	call	_err_clear
	add	esp, 16					; 00000010H
$eva_err$71006:
	mov	eax, DWORD PTR _cntxt$[ebp]
	cmp	DWORD PTR [eax+29872], 0
	je	SHORT $L71010
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	edx, DWORD PTR [ecx+29900]
	push	edx
	push	OFFSET FLAT:$SG71011
	push	OFFSET FLAT:$SG71012
	mov	eax, DWORD PTR _cntxt$[ebp]
	push	eax
	call	_err_add_context
	add	esp, 16					; 00000010H
$L71010:
	mov	ecx, DWORD PTR _html$[ebp]
	mov	edx, DWORD PTR [ecx]
	mov	eax, DWORD PTR _szini$[ebp]
	cmp	eax, DWORD PTR [edx+4]
	jne	SHORT $L71013
	push	0
	push	0
	push	15					; 0000000fH
	push	OFFSET FLAT:$SG71015
	mov	ecx, DWORD PTR _html$[ebp]
	push	ecx
	call	_dynbuf_add
	add	esp, 20					; 00000014H
$L71013:
	mov	edx, DWORD PTR _cntxt$[ebp]
	xor	eax, eax
	cmp	DWORD PTR [edx+29872], 0
	setne	al
$L70975:

; 573  : }

	mov	esp, ebp
	pop	ebp
	ret	0
_ctrl_output_calendar_dayhours ENDP
_TEXT	ENDS
PUBLIC	_ctrl_output_calendar_year
EXTRN	_sscanf:NEAR
_DATA	SEGMENT
$SG71040 DB	'-2', 00H
	ORG $+1
$SG71044 DB	'%4u%2u', 00H
	ORG $+1
$SG71047 DB	'<tr>', 00H
	ORG $+3
$SG71049 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG71056 DB	'</tr><tr>', 00H
	ORG $+2
$SG71058 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG71060 DB	'%04i%02d', 00H
	ORG $+3
$SG71062 DB	'%04i', 00H
	ORG $+3
$SG71065 DB	'<td valign=top width=16% height=100><table border=1 rule'
	DB	's=rows width=100% cellspacing=0 cellpadding=0><tr>', 00H
	ORG $+1
$SG71067 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG71069 DB	'>', 00H
	ORG $+2
$SG71070 DB	'DDDDDD', 00H
	ORG $+1
$SG71071 DB	'<td colspan=2 bgcolor=#', 00H
$SG71073 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG71075 DB	'MONTH', 00H
	ORG $+2
$SG71078 DB	'</b>', 00H
	ORG $+3
$SG71079 DB	'&nbsp;<b>', 00H
	ORG $+2
$SG71081 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG71084 DB	'</td>', 00H
	ORG $+2
$SG71086 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG71091 DB	'%04i%02d%02lu', 00H
	ORG $+2
$SG71093 DB	'%04i%02d%02lu', 00H
	ORG $+2
$SG71097 DB	'>', 00H
	ORG $+2
$SG71098 DB	'DDDDDD', 00H
	ORG $+1
$SG71099 DB	'</tr><tr><td align=center bgcolor=#', 00H
$SG71101 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG71102 DB	'<font size=-2>%s</font><br><font size=-1>%d', 00H
$SG71104 DB	'DAY', 00H
$SG71107 DB	'</td><td><table noborder width=100% cellspacing=0><tr>', 00H
	ORG $+1
$SG71109 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG71111 DB	'9', 00H
	ORG $+2
$SG71112 DB	'00', 00H
	ORG $+1
$SG71115 DB	'</tr></table></td>', 00H
	ORG $+1
$SG71117 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG71120 DB	'</tr></table></td>', 00H
	ORG $+1
$SG71122 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG71125 DB	'D:\Travail\ABI\EVA\V4.0\CGI\Brunix-2016\ctrl_output_cale'
	DB	'ndar.c', 00H
	ORG $+1
$SG71126 DB	'ctrl_output_calendar_year', 00H
	ORG $+2
$SG71128 DB	'D:\Travail\ABI\EVA\V4.0\CGI\Brunix-2016\ctrl_output_cale'
	DB	'ndar.c', 00H
	ORG $+1
$SG71129 DB	'ctrl_output_calendar_year', 00H
_DATA	ENDS
_TEXT	SEGMENT
_cntxt$ = 8
_cl$ = 12
_cnt$ = -16
_date0$ = -36
_date1$ = -180
_date$ = -164
_i$ = -184
_j$ = -224
_t$ = -12
_dt$ = -220
_year$ = -20
_month$ = -4
_html$ = -8
_ctrl_output_calendar_year PROC NEAR

; 586  : ){

	push	ebp
	mov	ebp, esp
	sub	esp, 240				; 000000f0H

; 587  : 	unsigned long cnt = 0;

	mov	DWORD PTR _cnt$[ebp], 0

; 588  : 	char date0[16], date1[16], date[128];
; 589  : 	unsigned long i, j;
; 590  : 	time_t t = 0;

	mov	DWORD PTR _t$[ebp], 0

; 591  : 	struct tm dt;
; 592  : 	int year, month;
; 593  : 	CHECK_HTML_STATUS;

	cmp	DWORD PTR _cntxt$[ebp], 0
	je	SHORT $L71965
	mov	eax, DWORD PTR _cntxt$[ebp]
	cmp	DWORD PTR [eax+80], 0
	je	SHORT $L71963
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	edx, DWORD PTR [ecx+80]
	mov	eax, DWORD PTR [edx+232]
	mov	DWORD PTR -228+[ebp], eax
	jmp	SHORT $L71964
$L71963:
	mov	DWORD PTR -228+[ebp], 0
$L71964:
	mov	ecx, DWORD PTR -228+[ebp]
	mov	DWORD PTR -232+[ebp], ecx
	jmp	SHORT $L71966
$L71965:
	mov	DWORD PTR -232+[ebp], 0
$L71966:
	mov	edx, DWORD PTR -232+[ebp]
	mov	DWORD PTR _html$[ebp], edx
	cmp	DWORD PTR _html$[ebp], 0
	jne	SHORT $L71038
	xor	eax, eax
	jmp	$L71024
$L71038:

; 594  : 
; 595  : 	/* Set default parameters */
; 596  : 	cl->cols = 12;

	mov	eax, DWORD PTR _cl$[ebp]
	mov	DWORD PTR [eax+228], 12			; 0000000cH

; 597  : 	if(!*cl->fontsize) cl->fontsize = "-2";

	mov	ecx, DWORD PTR _cl$[ebp]
	mov	edx, DWORD PTR [ecx+268]
	movsx	eax, BYTE PTR [edx]
	test	eax, eax
	jne	SHORT $L71039
	mov	ecx, DWORD PTR _cl$[ebp]
	mov	DWORD PTR [ecx+268], OFFSET FLAT:$SG71040
$L71039:

; 598  : 
; 599  : 	/* Output title */
; 600  : 	if(ctrl_output_calendar_title(cntxt, cl)) STACK_ERROR;

	mov	edx, DWORD PTR _cl$[ebp]
	push	edx
	mov	eax, DWORD PTR _cntxt$[ebp]
	push	eax
	call	_ctrl_output_calendar_title
	add	esp, 8
	test	eax, eax
	je	SHORT $L71041
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 600		; 00000258H
	jmp	$eva_err$71042
$L71041:

; 601  : 
; 602  : 	/* Output each month in year */
; 603  : 	if(sscanf(cl->datebeg, "%4u%2u", &year, &month) < 2) month = 1;

	lea	edx, DWORD PTR _month$[ebp]
	push	edx
	lea	eax, DWORD PTR _year$[ebp]
	push	eax
	push	OFFSET FLAT:$SG71044
	mov	ecx, DWORD PTR _cl$[ebp]
	add	ecx, 196				; 000000c4H
	push	ecx
	call	_sscanf
	add	esp, 16					; 00000010H
	cmp	eax, 2
	jge	SHORT $L71043
	mov	DWORD PTR _month$[ebp], 1
$L71043:

; 604  : 	DYNBUF_ADD_STR(html, "<tr>");

	push	0
	push	0
	push	4
	push	OFFSET FLAT:$SG71047
	mov	edx, DWORD PTR _html$[ebp]
	push	edx
	call	_dynbuf_add
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L71046
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29872], OFFSET FLAT:$SG71049
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 604		; 0000025cH
	jmp	$eva_err$71042
$L71046:

; 605  : 	for(i = 0; i < 12; i++)

	mov	DWORD PTR _i$[ebp], 0
	jmp	SHORT $L71050
$L71051:
	mov	edx, DWORD PTR _i$[ebp]
	add	edx, 1
	mov	DWORD PTR _i$[ebp], edx
$L71050:
	cmp	DWORD PTR _i$[ebp], 12			; 0000000cH
	jae	$eva_noerr$71124

; 607  : 		/* Output calendar cell */
; 608  : 		if(i && i % 6 == 0) DYNBUF_ADD_STR(html, "</tr><tr>");

	cmp	DWORD PTR _i$[ebp], 0
	je	SHORT $L71055
	mov	eax, DWORD PTR _i$[ebp]
	xor	edx, edx
	mov	ecx, 6
	div	ecx
	test	edx, edx
	jne	SHORT $L71055
	push	0
	push	0
	push	9
	push	OFFSET FLAT:$SG71056
	mov	edx, DWORD PTR _html$[ebp]
	push	edx
	call	_dynbuf_add
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L71055
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29872], OFFSET FLAT:$SG71058
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 608		; 00000260H
	jmp	$eva_err$71042
$L71055:

; 609  : 		if(month != 1) sprintf(date0, "%04i%02d", year, month);

	cmp	DWORD PTR _month$[ebp], 1
	je	SHORT $L71059
	mov	edx, DWORD PTR _month$[ebp]
	push	edx
	mov	eax, DWORD PTR _year$[ebp]
	push	eax
	push	OFFSET FLAT:$SG71060
	lea	ecx, DWORD PTR _date0$[ebp]
	push	ecx
	call	_sprintf
	add	esp, 16					; 00000010H

; 610  : 		else sprintf(date0, "%04i", year);

	jmp	SHORT $L71061
$L71059:
	mov	edx, DWORD PTR _year$[ebp]
	push	edx
	push	OFFSET FLAT:$SG71062
	lea	eax, DWORD PTR _date0$[ebp]
	push	eax
	call	_sprintf
	add	esp, 12					; 0000000cH
$L71061:

; 612  : 							 "<table border=1 rules=rows width=100% cellspacing=0 cellpadding=0><tr>");

	push	0
	push	0
	push	106					; 0000006aH
	push	OFFSET FLAT:$SG71065
	mov	ecx, DWORD PTR _html$[ebp]
	push	ecx
	call	_dynbuf_add
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L71064
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29872], OFFSET FLAT:$SG71067
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 612		; 00000264H
	jmp	$eva_err$71042
$L71064:

; 613  : 		DYNBUF_ADD3(html, "<td colspan=2 bgcolor=#", cl->datelblbgcolor[0] ? cl->datelblbgcolor : "DDDDDD", 0, TO_HTML, ">");

	mov	ecx, DWORD PTR _cl$[ebp]
	mov	edx, DWORD PTR [ecx+280]
	movsx	eax, BYTE PTR [edx]
	test	eax, eax
	je	SHORT $L71967
	mov	ecx, DWORD PTR _cl$[ebp]
	mov	edx, DWORD PTR [ecx+280]
	mov	DWORD PTR -236+[ebp], edx
	jmp	SHORT $L71968
$L71967:
	mov	DWORD PTR -236+[ebp], OFFSET FLAT:$SG71070
$L71968:
	push	1
	push	OFFSET FLAT:$SG71069
	push	1
	push	OFFSET FLAT:_plain_to_html
	push	0
	mov	eax, DWORD PTR -236+[ebp]
	push	eax
	push	23					; 00000017H
	push	OFFSET FLAT:$SG71071
	mov	ecx, DWORD PTR _html$[ebp]
	push	ecx
	call	_dynbuf_add3
	add	esp, 36					; 00000024H
	test	eax, eax
	je	SHORT $L71068
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29872], OFFSET FLAT:$SG71073
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 613		; 00000265H
	jmp	$eva_err$71042
$L71068:

; 614  : 		if(ctrl_output_calendar_datelink(cntxt, cl, dyntab_val(&cntxt->monthlong, month - 1, 0), date0, "MONTH")) STACK_ERROR;

	push	OFFSET FLAT:$SG71075
	lea	ecx, DWORD PTR _date0$[ebp]
	push	ecx
	push	0
	mov	edx, DWORD PTR _month$[ebp]
	sub	edx, 1
	push	edx
	mov	eax, DWORD PTR _cntxt$[ebp]
	add	eax, 269708				; 00041d8cH
	push	eax
	call	_dyntab_val
	add	esp, 12					; 0000000cH
	push	eax
	mov	ecx, DWORD PTR _cl$[ebp]
	push	ecx
	mov	edx, DWORD PTR _cntxt$[ebp]
	push	edx
	call	_ctrl_output_calendar_datelink
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L71074
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 614		; 00000266H
	jmp	$eva_err$71042
$L71074:

; 615  : 		if(month == 1 && cl->date0[5]) DYNBUF_ADD3_INT(html, "&nbsp;<b>", year, "</b>");

	cmp	DWORD PTR _month$[ebp], 1
	jne	SHORT $L71077
	mov	ecx, DWORD PTR _cl$[ebp]
	movsx	edx, BYTE PTR [ecx+185]
	test	edx, edx
	je	SHORT $L71077
	push	4
	push	OFFSET FLAT:$SG71078
	mov	eax, DWORD PTR _year$[ebp]
	push	eax
	push	9
	push	OFFSET FLAT:$SG71079
	mov	ecx, DWORD PTR _html$[ebp]
	push	ecx
	call	_dynbuf_add3_int
	add	esp, 24					; 00000018H
	test	eax, eax
	je	SHORT $L71077
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29872], OFFSET FLAT:$SG71081
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 615		; 00000267H
	jmp	$eva_err$71042
$L71077:

; 616  : 		DYNBUF_ADD_STR(html, "</td>");

	push	0
	push	0
	push	5
	push	OFFSET FLAT:$SG71084
	mov	ecx, DWORD PTR _html$[ebp]
	push	ecx
	call	_dynbuf_add
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L71083
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29872], OFFSET FLAT:$SG71086
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 616		; 00000268H
	jmp	$eva_err$71042
$L71083:

; 617  : 
; 618  : 		/* Output each day in month */
; 619  : 		for(j = 0; j < 31; j++)

	mov	DWORD PTR _j$[ebp], 0
	jmp	SHORT $L71087
$L71088:
	mov	ecx, DWORD PTR _j$[ebp]
	add	ecx, 1
	mov	DWORD PTR _j$[ebp], ecx
$L71087:
	cmp	DWORD PTR _j$[ebp], 31			; 0000001fH
	jae	$L71089

; 621  : 			if(j) sprintf(date0, "%04i%02d%02lu", year, month, j + 1);

	cmp	DWORD PTR _j$[ebp], 0
	je	SHORT $L71090
	mov	edx, DWORD PTR _j$[ebp]
	add	edx, 1
	push	edx
	mov	eax, DWORD PTR _month$[ebp]
	push	eax
	mov	ecx, DWORD PTR _year$[ebp]
	push	ecx
	push	OFFSET FLAT:$SG71091
	lea	edx, DWORD PTR _date0$[ebp]
	push	edx
	call	_sprintf
	add	esp, 20					; 00000014H
$L71090:

; 622  : 			datetxt_to_time(date0, &t, &dt);

	lea	eax, DWORD PTR _dt$[ebp]
	push	eax
	lea	ecx, DWORD PTR _t$[ebp]
	push	ecx
	lea	edx, DWORD PTR _date0$[ebp]
	push	edx
	call	_datetxt_to_time
	add	esp, 12					; 0000000cH

; 623  : 			if(dt.tm_mon != month - 1) break;

	mov	eax, DWORD PTR _month$[ebp]
	sub	eax, 1
	cmp	DWORD PTR _dt$[ebp+16], eax
	je	SHORT $L71092
	jmp	$L71089
$L71092:

; 624  : 			sprintf(date1, "%04i%02d%02lu", year, month, j + 2);

	mov	ecx, DWORD PTR _j$[ebp]
	add	ecx, 2
	push	ecx
	mov	edx, DWORD PTR _month$[ebp]
	push	edx
	mov	eax, DWORD PTR _year$[ebp]
	push	eax
	push	OFFSET FLAT:$SG71093
	lea	ecx, DWORD PTR _date1$[ebp]
	push	ecx
	call	_sprintf
	add	esp, 20					; 00000014H

; 625  : 			if(cl->objlist.nbrows <= cnt || strcmp(date1, dyntab_val(&cl->objlist, cnt, 1)) <= 0) continue;

	mov	edx, DWORD PTR _cl$[ebp]
	mov	eax, DWORD PTR [edx+144]
	cmp	eax, DWORD PTR _cnt$[ebp]
	jbe	SHORT $L71095
	push	1
	mov	ecx, DWORD PTR _cnt$[ebp]
	push	ecx
	mov	edx, DWORD PTR _cl$[ebp]
	add	edx, 144				; 00000090H
	push	edx
	call	_dyntab_val
	add	esp, 12					; 0000000cH
	push	eax
	lea	eax, DWORD PTR _date1$[ebp]
	push	eax
	call	_strcmp
	add	esp, 8
	test	eax, eax
	jg	SHORT $L71094
$L71095:
	jmp	$L71088
$L71094:

; 626  : 			DYNBUF_ADD3(html, "</tr><tr><td align=center bgcolor=#", cl->datelblbgcolor[0] ? cl->datelblbgcolor : "DDDDDD", 0, TO_HTML, ">");

	mov	ecx, DWORD PTR _cl$[ebp]
	mov	edx, DWORD PTR [ecx+280]
	movsx	eax, BYTE PTR [edx]
	test	eax, eax
	je	SHORT $L71969
	mov	ecx, DWORD PTR _cl$[ebp]
	mov	edx, DWORD PTR [ecx+280]
	mov	DWORD PTR -240+[ebp], edx
	jmp	SHORT $L71970
$L71969:
	mov	DWORD PTR -240+[ebp], OFFSET FLAT:$SG71098
$L71970:
	push	1
	push	OFFSET FLAT:$SG71097
	push	1
	push	OFFSET FLAT:_plain_to_html
	push	0
	mov	eax, DWORD PTR -240+[ebp]
	push	eax
	push	35					; 00000023H
	push	OFFSET FLAT:$SG71099
	mov	ecx, DWORD PTR _html$[ebp]
	push	ecx
	call	_dynbuf_add3
	add	esp, 36					; 00000024H
	test	eax, eax
	je	SHORT $L71096
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29872], OFFSET FLAT:$SG71101
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 626		; 00000272H
	jmp	$eva_err$71042
$L71096:

; 627  : 			snprintf(add_sz_str(date), "<font size=-2>%s</font><br><font size=-1>%d",
; 628  : 										dyntab_val(&cntxt->dayshort, dt.tm_wday, 0),
; 629  : 										dt.tm_mday);

	mov	ecx, DWORD PTR _dt$[ebp+12]
	push	ecx
	push	0
	mov	edx, DWORD PTR _dt$[ebp+24]
	push	edx
	mov	eax, DWORD PTR _cntxt$[ebp]
	add	eax, 269688				; 00041d78H
	push	eax
	call	_dyntab_val
	add	esp, 12					; 0000000cH
	push	eax
	push	OFFSET FLAT:$SG71102
	push	127					; 0000007fH
	lea	ecx, DWORD PTR _date$[ebp]
	push	ecx
	call	__snprintf
	add	esp, 20					; 00000014H

; 630  : 			if(ctrl_output_calendar_datelink(cntxt, cl, date, date0, "DAY")) STACK_ERROR;

	push	OFFSET FLAT:$SG71104
	lea	edx, DWORD PTR _date0$[ebp]
	push	edx
	lea	eax, DWORD PTR _date$[ebp]
	push	eax
	mov	ecx, DWORD PTR _cl$[ebp]
	push	ecx
	mov	edx, DWORD PTR _cntxt$[ebp]
	push	edx
	call	_ctrl_output_calendar_datelink
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L71103
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 630		; 00000276H
	jmp	$eva_err$71042
$L71103:

; 631  : 			DYNBUF_ADD_STR(html, "</td><td><table noborder width=100% cellspacing=0><tr>");

	push	0
	push	0
	push	54					; 00000036H
	push	OFFSET FLAT:$SG71107
	mov	ecx, DWORD PTR _html$[ebp]
	push	ecx
	call	_dynbuf_add
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L71106
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29872], OFFSET FLAT:$SG71109
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 631		; 00000277H
	jmp	$eva_err$71042
$L71106:

; 632  : 				if(ctrl_output_calendar_dayhours(cntxt, cl, &cnt, "00", "9", date0)) STACK_ERROR;

	lea	ecx, DWORD PTR _date0$[ebp]
	push	ecx
	push	OFFSET FLAT:$SG71111
	push	OFFSET FLAT:$SG71112
	lea	edx, DWORD PTR _cnt$[ebp]
	push	edx
	mov	eax, DWORD PTR _cl$[ebp]
	push	eax
	mov	ecx, DWORD PTR _cntxt$[ebp]
	push	ecx
	call	_ctrl_output_calendar_dayhours
	add	esp, 24					; 00000018H
	test	eax, eax
	je	SHORT $L71110
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 632		; 00000278H
	jmp	$eva_err$71042
$L71110:

; 633  : 			DYNBUF_ADD_STR(html, "</tr></table></td>");

	push	0
	push	0
	push	18					; 00000012H
	push	OFFSET FLAT:$SG71115
	mov	eax, DWORD PTR _html$[ebp]
	push	eax
	call	_dynbuf_add
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L71114
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29872], OFFSET FLAT:$SG71117
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 633		; 00000279H
	jmp	SHORT $eva_err$71042
$L71114:

; 634  : 		}

	jmp	$L71088
$L71089:

; 635  : 		DYNBUF_ADD_STR(html, "</tr></table></td>");

	push	0
	push	0
	push	18					; 00000012H
	push	OFFSET FLAT:$SG71120
	mov	eax, DWORD PTR _html$[ebp]
	push	eax
	call	_dynbuf_add
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L71119
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29872], OFFSET FLAT:$SG71122
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 635		; 0000027bH
	jmp	SHORT $eva_err$71042
$L71119:

; 636  : 
; 637  : 		/* Handle year change */
; 638  : 		month += 1;

	mov	eax, DWORD PTR _month$[ebp]
	add	eax, 1
	mov	DWORD PTR _month$[ebp], eax

; 639  : 		if(month > 12)

	cmp	DWORD PTR _month$[ebp], 12		; 0000000cH
	jle	SHORT $L71123

; 641  : 			month = 1;

	mov	DWORD PTR _month$[ebp], 1

; 642  : 			year += 1;

	mov	ecx, DWORD PTR _year$[ebp]
	add	ecx, 1
	mov	DWORD PTR _year$[ebp], ecx
$L71123:

; 644  : 	}

	jmp	$L71051
$eva_noerr$71124:

; 645  : 	RETURN_OK_CLEANUP;

	push	0
	push	OFFSET FLAT:$SG71125
	push	OFFSET FLAT:$SG71126
	mov	edx, DWORD PTR _cntxt$[ebp]
	push	edx
	call	_err_clear
	add	esp, 16					; 00000010H
$eva_err$71042:
	mov	eax, DWORD PTR _cntxt$[ebp]
	cmp	DWORD PTR [eax+29872], 0
	je	SHORT $L71127
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	edx, DWORD PTR [ecx+29900]
	push	edx
	push	OFFSET FLAT:$SG71128
	push	OFFSET FLAT:$SG71129
	mov	eax, DWORD PTR _cntxt$[ebp]
	push	eax
	call	_err_add_context
	add	esp, 16					; 00000010H
$L71127:
	mov	ecx, DWORD PTR _cntxt$[ebp]
	xor	eax, eax
	cmp	DWORD PTR [ecx+29872], 0
	setne	al
$L71024:

; 646  : }

	mov	esp, ebp
	pop	ebp
	ret	0
_ctrl_output_calendar_year ENDP
_TEXT	ENDS
PUBLIC	_ctrl_output_calendar_month
_BSS	SEGMENT
	ALIGN	4

$SG71218 DB	01H DUP (?)
_BSS	ENDS
_DATA	SEGMENT
	ORG $+2
$SG71154 DB	'-2', 00H
	ORG $+1
$SG71159 DB	'<tr>', 00H
	ORG $+3
$SG71161 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG71167 DB	'>', 00H
	ORG $+2
$SG71168 DB	'<td align=center width=14% bgcolor=#', 00H
	ORG $+3
$SG71170 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG71172 DB	'&nbsp;</b></td>', 00H
$SG71173 DB	'<b>&nbsp;', 00H
	ORG $+2
$SG71175 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG71178 DB	'><font size=-1><b>samedi - dimanche</b></font></td>', 00H
$SG71179 DB	'<td align=center width=14% bgcolor=#', 00H
	ORG $+3
$SG71181 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG71184 DB	'</tr><tr>', 00H
	ORG $+2
$SG71186 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG71198 DB	'</tr><tr>', 00H
	ORG $+2
$SG71200 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG71201 DB	'0101', 00H
	ORG $+3
$SG71202 DB	'01', 00H
	ORG $+1
$SG71205 DB	'<td valign=top height=60', 00H
	ORG $+3
$SG71207 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG71211 DB	'_EVA_NONE', 00H
	ORG $+2
$SG71214 DB	'_EVA_SUNDAY', 00H
$SG71219 DB	' bgcolor=#', 00H
	ORG $+1
$SG71221 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG71224 DB	'>', 00H
	ORG $+2
$SG71226 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG71229 DB	'<table noborder width=100% cellspacing=0><tr>', 00H
	ORG $+2
$SG71231 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG71233 DB	'>', 00H
	ORG $+2
$SG71234 DB	'<td colspan=2 bgcolor=#', 00H
$SG71236 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG71242 DB	'_EVA_DayFull', 00H
	ORG $+3
$SG71243 DB	'_EVA_Day', 00H
	ORG $+3
$SG71246 DB	'>', 00H
	ORG $+2
$SG71247 DB	'+1', 00H
	ORG $+1
$SG71248 DB	'-1', 00H
	ORG $+1
$SG71249 DB	'+0', 00H
	ORG $+1
$SG71250 DB	'<font size=', 00H
$SG71252 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG71254 DB	'DAY', 00H
$SG71257 DB	'</font>', 00H
$SG71259 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG71263 DB	'</font>', 00H
$SG71264 DB	'<font size=-2> ', 00H
$SG71266 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG71272 DB	' - ', 00H
$SG71274 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG71277 DB	'</td></tr><tr>', 00H
	ORG $+1
$SG71279 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG71280 DB	'_EVA_DayTime', 00H
	ORG $+3
$SG71281 DB	'_EVA_Time', 00H
	ORG $+2
$SG71283 DB	'9', 00H
	ORG $+2
$SG71284 DB	'00', 00H
	ORG $+1
$SG71287 DB	'9', 00H
	ORG $+2
$SG71288 DB	'00', 00H
	ORG $+1
$SG71291 DB	'</tr></table></td>', 00H
	ORG $+1
$SG71293 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG71295 DB	'D:\Travail\ABI\EVA\V4.0\CGI\Brunix-2016\ctrl_output_cale'
	DB	'ndar.c', 00H
	ORG $+1
$SG71296 DB	'ctrl_output_calendar_month', 00H
	ORG $+1
$SG71298 DB	'D:\Travail\ABI\EVA\V4.0\CGI\Brunix-2016\ctrl_output_cale'
	DB	'ndar.c', 00H
	ORG $+1
$SG71299 DB	'ctrl_output_calendar_month', 00H
_DATA	ENDS
_TEXT	SEGMENT
_cntxt$ = 8
_cl$ = 12
_cnt$ = -20
_date0$ = -36
_date1$ = -116
_date$ = -100
_i$ = -120
_j$ = -160
_t$ = -16
_dt$ = -156
_b_wegroup$ = -12
_month$ = -4
_html$ = -8
_t1$71190 = -164
_dt1$71191 = -204
_bgcolor$71192 = -168
_b_today$71194 = -208
_d$71240 = -212
_cdt$71241 = -216
_ctrl_output_calendar_month PROC NEAR

; 659  : ){

	push	ebp
	mov	ebp, esp
	sub	esp, 268				; 0000010cH

; 660  : 	unsigned long cnt = 0;

	mov	DWORD PTR _cnt$[ebp], 0

; 661  : 	char date0[16], date1[16], date[64];
; 662  : 	unsigned long i, j;
; 663  : 	time_t t = 0;

	mov	DWORD PTR _t$[ebp], 0

; 664  : 	struct tm dt;
; 665  : 	int b_wegroup = !*cl->wemode;

	mov	eax, DWORD PTR _cl$[ebp]
	mov	ecx, DWORD PTR [eax+272]
	movsx	edx, BYTE PTR [ecx]
	neg	edx
	sbb	edx, edx
	inc	edx
	mov	DWORD PTR _b_wegroup$[ebp], edx

; 666  : 	int month;
; 667  : 	CHECK_HTML_STATUS;

	cmp	DWORD PTR _cntxt$[ebp], 0
	je	SHORT $L71974
	mov	eax, DWORD PTR _cntxt$[ebp]
	cmp	DWORD PTR [eax+80], 0
	je	SHORT $L71972
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	edx, DWORD PTR [ecx+80]
	mov	eax, DWORD PTR [edx+232]
	mov	DWORD PTR -220+[ebp], eax
	jmp	SHORT $L71973
$L71972:
	mov	DWORD PTR -220+[ebp], 0
$L71973:
	mov	ecx, DWORD PTR -220+[ebp]
	mov	DWORD PTR -224+[ebp], ecx
	jmp	SHORT $L71975
$L71974:
	mov	DWORD PTR -224+[ebp], 0
$L71975:
	mov	edx, DWORD PTR -224+[ebp]
	mov	DWORD PTR _html$[ebp], edx
	cmp	DWORD PTR _html$[ebp], 0
	jne	SHORT $L71152
	xor	eax, eax
	jmp	$L71138
$L71152:

; 668  : 
; 669  : 	/* Output title && day labels */
; 670  : 	cl->cols = (b_wegroup ? 6 : 7);

	mov	eax, DWORD PTR _b_wegroup$[ebp]
	neg	eax
	sbb	eax, eax
	add	eax, 7
	mov	ecx, DWORD PTR _cl$[ebp]
	mov	DWORD PTR [ecx+228], eax

; 671  : 	if(!*cl->fontsize) cl->fontsize = "-2";

	mov	edx, DWORD PTR _cl$[ebp]
	mov	eax, DWORD PTR [edx+268]
	movsx	ecx, BYTE PTR [eax]
	test	ecx, ecx
	jne	SHORT $L71153
	mov	edx, DWORD PTR _cl$[ebp]
	mov	DWORD PTR [edx+268], OFFSET FLAT:$SG71154
$L71153:

; 672  : 	cl->datefmt_minsz = 10;

	mov	eax, DWORD PTR _cl$[ebp]
	mov	DWORD PTR [eax+252], 10			; 0000000aH

; 673  : 	if(ctrl_output_calendar_title(cntxt, cl)) STACK_ERROR;

	mov	ecx, DWORD PTR _cl$[ebp]
	push	ecx
	mov	edx, DWORD PTR _cntxt$[ebp]
	push	edx
	call	_ctrl_output_calendar_title
	add	esp, 8
	test	eax, eax
	je	SHORT $L71155
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 673		; 000002a1H
	jmp	$eva_err$71156
$L71155:

; 674  : 	DYNBUF_ADD_STR(html, "<tr>");

	push	0
	push	0
	push	4
	push	OFFSET FLAT:$SG71159
	mov	ecx, DWORD PTR _html$[ebp]
	push	ecx
	call	_dynbuf_add
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L71158
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29872], OFFSET FLAT:$SG71161
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 674		; 000002a2H
	jmp	$eva_err$71156
$L71158:

; 675  : 	for(i = 0; i < (unsigned long)(b_wegroup ? 5 : 7); i++)

	mov	DWORD PTR _i$[ebp], 0
	jmp	SHORT $L71163
$L71164:
	mov	ecx, DWORD PTR _i$[ebp]
	add	ecx, 1
	mov	DWORD PTR _i$[ebp], ecx
$L71163:
	mov	edx, DWORD PTR _b_wegroup$[ebp]
	neg	edx
	sbb	edx, edx
	and	edx, -2					; fffffffeH
	add	edx, 7
	cmp	DWORD PTR _i$[ebp], edx
	jae	$L71165

; 677  : 		DYNBUF_ADD3(html, "<td align=center width=14% bgcolor=#", cl->datelblbgcolor, 0, TO_HTML, ">");

	push	1
	push	OFFSET FLAT:$SG71167
	push	1
	push	OFFSET FLAT:_plain_to_html
	push	0
	mov	eax, DWORD PTR _cl$[ebp]
	mov	ecx, DWORD PTR [eax+280]
	push	ecx
	push	36					; 00000024H
	push	OFFSET FLAT:$SG71168
	mov	edx, DWORD PTR _html$[ebp]
	push	edx
	call	_dynbuf_add3
	add	esp, 36					; 00000024H
	test	eax, eax
	je	SHORT $L71166
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29872], OFFSET FLAT:$SG71170
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 677		; 000002a5H
	jmp	$eva_err$71156
$L71166:

; 678  : 		DYNBUF_ADD3_CELL(html, "<b>&nbsp;", &cntxt->daylong, i < 6 ? i + 1 : 0, 0, TO_HTML, "&nbsp;</b></td>");

	cmp	DWORD PTR _i$[ebp], 6
	jae	SHORT $L71976
	mov	edx, DWORD PTR _i$[ebp]
	add	edx, 1
	mov	DWORD PTR -228+[ebp], edx
	jmp	SHORT $L71977
$L71976:
	mov	DWORD PTR -228+[ebp], 0
$L71977:
	cmp	DWORD PTR _i$[ebp], 6
	jae	SHORT $L71978
	mov	eax, DWORD PTR _i$[ebp]
	add	eax, 1
	mov	DWORD PTR -232+[ebp], eax
	jmp	SHORT $L71979
$L71978:
	mov	DWORD PTR -232+[ebp], 0
$L71979:
	push	15					; 0000000fH
	push	OFFSET FLAT:$SG71172
	push	1
	push	OFFSET FLAT:_plain_to_html
	push	0
	mov	ecx, DWORD PTR -228+[ebp]
	push	ecx
	mov	edx, DWORD PTR _cntxt$[ebp]
	add	edx, 269668				; 00041d64H
	push	edx
	call	_dyntab_sz
	add	esp, 12					; 0000000cH
	push	eax
	push	0
	mov	eax, DWORD PTR -232+[ebp]
	push	eax
	mov	ecx, DWORD PTR _cntxt$[ebp]
	add	ecx, 269668				; 00041d64H
	push	ecx
	call	_dyntab_val
	add	esp, 12					; 0000000cH
	push	eax
	push	9
	push	OFFSET FLAT:$SG71173
	mov	edx, DWORD PTR _html$[ebp]
	push	edx
	call	_dynbuf_add3
	add	esp, 36					; 00000024H
	test	eax, eax
	je	SHORT $L71171
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29872], OFFSET FLAT:$SG71175
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 678		; 000002a6H
	jmp	$eva_err$71156
$L71171:

; 679  : 	}

	jmp	$L71164
$L71165:

; 680  : 	if(b_wegroup) DYNBUF_ADD3(html, "<td align=center width=14% bgcolor=#", cl->datelblbgcolor, 0, TO_HTML, ">"

	cmp	DWORD PTR _b_wegroup$[ebp], 0
	je	SHORT $L71177

; 681  : 									"<font size=-1><b>samedi - dimanche</b></font></td>");

	push	51					; 00000033H
	push	OFFSET FLAT:$SG71178
	push	1
	push	OFFSET FLAT:_plain_to_html
	push	0
	mov	edx, DWORD PTR _cl$[ebp]
	mov	eax, DWORD PTR [edx+280]
	push	eax
	push	36					; 00000024H
	push	OFFSET FLAT:$SG71179
	mov	ecx, DWORD PTR _html$[ebp]
	push	ecx
	call	_dynbuf_add3
	add	esp, 36					; 00000024H
	test	eax, eax
	je	SHORT $L71177
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29872], OFFSET FLAT:$SG71181
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 681		; 000002a9H
	jmp	$eva_err$71156
$L71177:

; 682  : 	DYNBUF_ADD_STR(html, "</tr><tr>");

	push	0
	push	0
	push	9
	push	OFFSET FLAT:$SG71184
	mov	ecx, DWORD PTR _html$[ebp]
	push	ecx
	call	_dynbuf_add
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L71183
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29872], OFFSET FLAT:$SG71186
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 682		; 000002aaH
	jmp	$eva_err$71156
$L71183:

; 683  : 
; 684  : 	/* Output each day in month */
; 685  : 	strcpy(date0, cl->datebeg);

	mov	ecx, DWORD PTR _cl$[ebp]
	add	ecx, 196				; 000000c4H
	push	ecx
	lea	edx, DWORD PTR _date0$[ebp]
	push	edx
	call	_strcpy
	add	esp, 8

; 686  : 	datetxt_to_time(cl->date0, &t, &dt);

	lea	eax, DWORD PTR _dt$[ebp]
	push	eax
	lea	ecx, DWORD PTR _t$[ebp]
	push	ecx
	mov	edx, DWORD PTR _cl$[ebp]
	add	edx, 180				; 000000b4H
	push	edx
	call	_datetxt_to_time
	add	esp, 12					; 0000000cH

; 687  : 	month = dt.tm_mon;

	mov	eax, DWORD PTR _dt$[ebp+16]
	mov	DWORD PTR _month$[ebp], eax

; 688  : 	for(i = 0; strcmp(date0, cl->dateend) <= 0; i++)

	mov	DWORD PTR _i$[ebp], 0
	jmp	SHORT $L71187
$L71188:
	mov	ecx, DWORD PTR _i$[ebp]
	add	ecx, 1
	mov	DWORD PTR _i$[ebp], ecx
$L71187:
	mov	edx, DWORD PTR _cl$[ebp]
	add	edx, 212				; 000000d4H
	push	edx
	lea	eax, DWORD PTR _date0$[ebp]
	push	eax
	call	_strcmp
	add	esp, 8
	test	eax, eax
	jg	$eva_noerr$71294

; 690  : 		time_t t1 = 0;

	mov	DWORD PTR _t1$71190[ebp], 0

; 691  : 		struct tm dt1;
; 692  : 		char *bgcolor = NULL;

	mov	DWORD PTR _bgcolor$71192[ebp], 0

; 693  : 		int b_today;
; 694  : 
; 695  : 		/* Output row change if applicable : 1 line per week */
; 696  : 		datetxt_to_time(date0, &t, &dt);

	lea	ecx, DWORD PTR _dt$[ebp]
	push	ecx
	lea	edx, DWORD PTR _t$[ebp]
	push	edx
	lea	eax, DWORD PTR _date0$[ebp]
	push	eax
	call	_datetxt_to_time
	add	esp, 12					; 0000000cH

; 697  : 		if(strcmp(date0, cl->datebeg) && dt.tm_wday == 1)

	mov	ecx, DWORD PTR _cl$[ebp]
	add	ecx, 196				; 000000c4H
	push	ecx
	lea	edx, DWORD PTR _date0$[ebp]
	push	edx
	call	_strcmp
	add	esp, 8
	test	eax, eax
	je	SHORT $L71197
	cmp	DWORD PTR _dt$[ebp+24], 1
	jne	SHORT $L71197

; 698  : 			DYNBUF_ADD_STR(html, "</tr><tr>");

	push	0
	push	0
	push	9
	push	OFFSET FLAT:$SG71198
	mov	eax, DWORD PTR _html$[ebp]
	push	eax
	call	_dynbuf_add
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L71197
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29872], OFFSET FLAT:$SG71200
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 698		; 000002baH
	jmp	$eva_err$71156
$L71197:

; 699  : 
; 700  : 		/* Build end date for cell */
; 701  : 		delay_to_datetxt(date1, cl->datebeg, i + 1, 'D');

	push	68					; 00000044H
	mov	eax, DWORD PTR _i$[ebp]
	add	eax, 1
	push	eax
	mov	ecx, DWORD PTR _cl$[ebp]
	add	ecx, 196				; 000000c4H
	push	ecx
	lea	edx, DWORD PTR _date1$[ebp]
	push	edx
	call	_delay_to_datetxt
	add	esp, 16					; 00000010H

; 702  : 		datetxt_to_time(date1, &t1, &dt1);

	lea	eax, DWORD PTR _dt1$71191[ebp]
	push	eax
	lea	ecx, DWORD PTR _t1$71190[ebp]
	push	ecx
	lea	edx, DWORD PTR _date1$[ebp]
	push	edx
	call	_datetxt_to_time
	add	esp, 12					; 0000000cH

; 703  : 		date1[8] = 0;

	mov	BYTE PTR _date1$[ebp+8], 0

; 704  : 		b_today = !strncmp(date0, cntxt->timestamp, 8) ||
; 705  : 					(!date0[4] && !strncmp(date0, cntxt->timestamp, 4) && !strncmp("0101", cntxt->timestamp + 4, 4)) ||
; 706  : 					(!date0[6] && !strncmp(date0, cntxt->timestamp, 6) && !strncmp("01", cntxt->timestamp + 6, 2)) ||
; 707  : 					(b_wegroup && dt.tm_wday == 6 && !strncmp(date1, cntxt->timestamp, 8));

	push	8
	mov	eax, DWORD PTR _cntxt$[ebp]
	add	eax, 29704				; 00007408H
	push	eax
	lea	ecx, DWORD PTR _date0$[ebp]
	push	ecx
	call	_strncmp
	add	esp, 12					; 0000000cH
	test	eax, eax
	je	$L71981
	movsx	edx, BYTE PTR _date0$[ebp+4]
	test	edx, edx
	jne	SHORT $L71980
	push	4
	mov	eax, DWORD PTR _cntxt$[ebp]
	add	eax, 29704				; 00007408H
	push	eax
	lea	ecx, DWORD PTR _date0$[ebp]
	push	ecx
	call	_strncmp
	add	esp, 12					; 0000000cH
	test	eax, eax
	jne	SHORT $L71980
	push	4
	mov	edx, DWORD PTR _cntxt$[ebp]
	add	edx, 29708				; 0000740cH
	push	edx
	push	OFFSET FLAT:$SG71201
	call	_strncmp
	add	esp, 12					; 0000000cH
	test	eax, eax
	je	SHORT $L71981
$L71980:
	movsx	eax, BYTE PTR _date0$[ebp+6]
	test	eax, eax
	jne	SHORT $L71982
	push	6
	mov	ecx, DWORD PTR _cntxt$[ebp]
	add	ecx, 29704				; 00007408H
	push	ecx
	lea	edx, DWORD PTR _date0$[ebp]
	push	edx
	call	_strncmp
	add	esp, 12					; 0000000cH
	test	eax, eax
	jne	SHORT $L71982
	push	2
	mov	eax, DWORD PTR _cntxt$[ebp]
	add	eax, 29710				; 0000740eH
	push	eax
	push	OFFSET FLAT:$SG71202
	call	_strncmp
	add	esp, 12					; 0000000cH
	test	eax, eax
	je	SHORT $L71981
$L71982:
	cmp	DWORD PTR _b_wegroup$[ebp], 0
	je	SHORT $L71983
	cmp	DWORD PTR _dt$[ebp+24], 6
	jne	SHORT $L71983
	push	8
	mov	ecx, DWORD PTR _cntxt$[ebp]
	add	ecx, 29704				; 00007408H
	push	ecx
	lea	edx, DWORD PTR _date1$[ebp]
	push	edx
	call	_strncmp
	add	esp, 12					; 0000000cH
	test	eax, eax
	je	SHORT $L71981
$L71983:
	mov	DWORD PTR -236+[ebp], 0
	jmp	SHORT $L71984
$L71981:
	mov	DWORD PTR -236+[ebp], 1
$L71984:
	mov	eax, DWORD PTR -236+[ebp]
	mov	DWORD PTR _b_today$71194[ebp], eax

; 708  : 
; 709  : 		/* Output calendar cell header */
; 710  : 		DYNBUF_ADD_STR(html, "<td valign=top height=60");

	push	0
	push	0
	push	24					; 00000018H
	push	OFFSET FLAT:$SG71205
	mov	ecx, DWORD PTR _html$[ebp]
	push	ecx
	call	_dynbuf_add
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L71204
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29872], OFFSET FLAT:$SG71207
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 710		; 000002c6H
	jmp	$eva_err$71156
$L71204:

; 711  : 		if(cl->todaybgcolor[0] && b_today)

	mov	ecx, DWORD PTR _cl$[ebp]
	mov	edx, DWORD PTR [ecx+288]
	movsx	eax, BYTE PTR [edx]
	test	eax, eax
	je	SHORT $L71208
	cmp	DWORD PTR _b_today$71194[ebp], 0
	je	SHORT $L71208

; 712  : 			/* Handle cell background : today */
; 713  : 			bgcolor = cl->todaybgcolor;

	mov	ecx, DWORD PTR _cl$[ebp]
	mov	edx, DWORD PTR [ecx+288]
	mov	DWORD PTR _bgcolor$71192[ebp], edx

; 714  : 		else if(cl->webgcolor[0] && strcmp(cl->wemode, "_EVA_NONE") && ( (

	jmp	SHORT $L71210
$L71208:

; 715  : 					dt.tm_wday == 6 && strcmp(cl->wemode, "_EVA_SUNDAY") ) ||
; 716  : 					dt.tm_wday == 0))

	mov	eax, DWORD PTR _cl$[ebp]
	mov	ecx, DWORD PTR [eax+276]
	movsx	edx, BYTE PTR [ecx]
	test	edx, edx
	je	SHORT $L71210
	push	OFFSET FLAT:$SG71211
	mov	eax, DWORD PTR _cl$[ebp]
	mov	ecx, DWORD PTR [eax+272]
	push	ecx
	call	_strcmp
	add	esp, 8
	test	eax, eax
	je	SHORT $L71210
	cmp	DWORD PTR _dt$[ebp+24], 6
	jne	SHORT $L71213
	push	OFFSET FLAT:$SG71214
	mov	edx, DWORD PTR _cl$[ebp]
	mov	eax, DWORD PTR [edx+272]
	push	eax
	call	_strcmp
	add	esp, 8
	test	eax, eax
	jne	SHORT $L71212
$L71213:
	cmp	DWORD PTR _dt$[ebp+24], 0
	jne	SHORT $L71210
$L71212:

; 717  : 			/* Handle cell background : week end */
; 718  : 			bgcolor = cl->webgcolor;

	mov	ecx, DWORD PTR _cl$[ebp]
	mov	edx, DWORD PTR [ecx+276]
	mov	DWORD PTR _bgcolor$71192[ebp], edx
$L71210:

; 719  : 		if(bgcolor) DYNBUF_ADD3(html, " bgcolor=#", bgcolor, 0, NO_CONV, "");

	cmp	DWORD PTR _bgcolor$71192[ebp], 0
	je	SHORT $L71217
	push	0
	push	OFFSET FLAT:$SG71218
	push	0
	push	0
	push	0
	mov	eax, DWORD PTR _bgcolor$71192[ebp]
	push	eax
	push	10					; 0000000aH
	push	OFFSET FLAT:$SG71219
	mov	ecx, DWORD PTR _html$[ebp]
	push	ecx
	call	_dynbuf_add3
	add	esp, 36					; 00000024H
	test	eax, eax
	je	SHORT $L71217
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29872], OFFSET FLAT:$SG71221
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 719		; 000002cfH
	jmp	$eva_err$71156
$L71217:

; 720  : 		DYNBUF_ADD_STR(html, ">");

	push	0
	push	0
	push	1
	push	OFFSET FLAT:$SG71224
	mov	ecx, DWORD PTR _html$[ebp]
	push	ecx
	call	_dynbuf_add
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L71223
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29872], OFFSET FLAT:$SG71226
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 720		; 000002d0H
	jmp	$eva_err$71156
$L71223:

; 721  : 
; 722  : 		/* Output header for table of events & cell label : date for the day & next day if we group */
; 723  : 		DYNBUF_ADD_STR(html, "<table noborder width=100% cellspacing=0><tr>");

	push	0
	push	0
	push	45					; 0000002dH
	push	OFFSET FLAT:$SG71229
	mov	ecx, DWORD PTR _html$[ebp]
	push	ecx
	call	_dynbuf_add
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L71228
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29872], OFFSET FLAT:$SG71231
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 723		; 000002d3H
	jmp	$eva_err$71156
$L71228:

; 724  : 		DYNBUF_ADD3(html, "<td colspan=2 bgcolor=#", b_today ? cl->todaylblbgcolor : cl->datelblbgcolor, 0, TO_HTML, ">");

	cmp	DWORD PTR _b_today$71194[ebp], 0
	je	SHORT $L71985
	mov	ecx, DWORD PTR _cl$[ebp]
	mov	edx, DWORD PTR [ecx+292]
	mov	DWORD PTR -240+[ebp], edx
	jmp	SHORT $L71986
$L71985:
	mov	eax, DWORD PTR _cl$[ebp]
	mov	ecx, DWORD PTR [eax+280]
	mov	DWORD PTR -240+[ebp], ecx
$L71986:
	push	1
	push	OFFSET FLAT:$SG71233
	push	1
	push	OFFSET FLAT:_plain_to_html
	push	0
	mov	edx, DWORD PTR -240+[ebp]
	push	edx
	push	23					; 00000017H
	push	OFFSET FLAT:$SG71234
	mov	eax, DWORD PTR _html$[ebp]
	push	eax
	call	_dynbuf_add3
	add	esp, 36					; 00000024H
	test	eax, eax
	je	SHORT $L71232
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29872], OFFSET FLAT:$SG71236
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 724		; 000002d4H
	jmp	$eva_err$71156
$L71232:

; 725  : 		for(j = 0; j < 2; j++)

	mov	DWORD PTR _j$[ebp], 0
	jmp	SHORT $L71237
$L71238:
	mov	eax, DWORD PTR _j$[ebp]
	add	eax, 1
	mov	DWORD PTR _j$[ebp], eax
$L71237:
	cmp	DWORD PTR _j$[ebp], 2
	jae	$L71239

; 727  : 			char *d = j ? date1 : date0;

	cmp	DWORD PTR _j$[ebp], 0
	je	SHORT $L71987
	lea	ecx, DWORD PTR _date1$[ebp]
	mov	DWORD PTR -244+[ebp], ecx
	jmp	SHORT $L71988
$L71987:
	lea	edx, DWORD PTR _date0$[ebp]
	mov	DWORD PTR -244+[ebp], edx
$L71988:
	mov	eax, DWORD PTR -244+[ebp]
	mov	DWORD PTR _d$71240[ebp], eax

; 728  : 			struct tm *cdt = j ? &dt1 : &dt;

	cmp	DWORD PTR _j$[ebp], 0
	je	SHORT $L71989
	lea	ecx, DWORD PTR _dt1$71191[ebp]
	mov	DWORD PTR -248+[ebp], ecx
	jmp	SHORT $L71990
$L71989:
	lea	edx, DWORD PTR _dt$[ebp]
	mov	DWORD PTR -248+[ebp], edx
$L71990:
	mov	eax, DWORD PTR -248+[ebp]
	mov	DWORD PTR _cdt$71241[ebp], eax

; 729  : 			b_today = !strncmp(d, cntxt->timestamp, 8) ||
; 730  : 							(b_wegroup && dt.tm_wday == 6 && !strncmp(date1, cntxt->timestamp, 8) );

	push	8
	mov	ecx, DWORD PTR _cntxt$[ebp]
	add	ecx, 29704				; 00007408H
	push	ecx
	mov	edx, DWORD PTR _d$71240[ebp]
	push	edx
	call	_strncmp
	add	esp, 12					; 0000000cH
	test	eax, eax
	je	SHORT $L71992
	cmp	DWORD PTR _b_wegroup$[ebp], 0
	je	SHORT $L71991
	cmp	DWORD PTR _dt$[ebp+24], 6
	jne	SHORT $L71991
	push	8
	mov	eax, DWORD PTR _cntxt$[ebp]
	add	eax, 29704				; 00007408H
	push	eax
	lea	ecx, DWORD PTR _date1$[ebp]
	push	ecx
	call	_strncmp
	add	esp, 12					; 0000000cH
	test	eax, eax
	je	SHORT $L71992
$L71991:
	mov	DWORD PTR -252+[ebp], 0
	jmp	SHORT $L71993
$L71992:
	mov	DWORD PTR -252+[ebp], 1
$L71993:
	mov	edx, DWORD PTR -252+[ebp]
	mov	DWORD PTR _b_today$71194[ebp], edx

; 731  : 			datetxt_to_format(cntxt, date, d, b_today ? "_EVA_DayFull" : "_EVA_Day");

	cmp	DWORD PTR _b_today$71194[ebp], 0
	je	SHORT $L71994
	mov	DWORD PTR -256+[ebp], OFFSET FLAT:$SG71242
	jmp	SHORT $L71995
$L71994:
	mov	DWORD PTR -256+[ebp], OFFSET FLAT:$SG71243
$L71995:
	mov	eax, DWORD PTR -256+[ebp]
	push	eax
	mov	ecx, DWORD PTR _d$71240[ebp]
	push	ecx
	lea	edx, DWORD PTR _date$[ebp]
	push	edx
	mov	eax, DWORD PTR _cntxt$[ebp]
	push	eax
	call	_datetxt_to_format
	add	esp, 16					; 00000010H

; 732  : 			DYNBUF_ADD3(html, "<font size=", !strncmp(d, cntxt->timestamp, 8) ? "+1" : (b_wegroup && dt.tm_wday == 6) ? "-1" : "+0", 0, NO_CONV, ">");

	push	8
	mov	ecx, DWORD PTR _cntxt$[ebp]
	add	ecx, 29704				; 00007408H
	push	ecx
	mov	edx, DWORD PTR _d$71240[ebp]
	push	edx
	call	_strncmp
	add	esp, 12					; 0000000cH
	test	eax, eax
	jne	SHORT $L71998
	mov	DWORD PTR -260+[ebp], OFFSET FLAT:$SG71247
	jmp	SHORT $L71999
$L71998:
	cmp	DWORD PTR _b_wegroup$[ebp], 0
	je	SHORT $L71996
	cmp	DWORD PTR _dt$[ebp+24], 6
	jne	SHORT $L71996
	mov	DWORD PTR -264+[ebp], OFFSET FLAT:$SG71248
	jmp	SHORT $L71997
$L71996:
	mov	DWORD PTR -264+[ebp], OFFSET FLAT:$SG71249
$L71997:
	mov	eax, DWORD PTR -264+[ebp]
	mov	DWORD PTR -260+[ebp], eax
$L71999:
	push	1
	push	OFFSET FLAT:$SG71246
	push	0
	push	0
	push	0
	mov	ecx, DWORD PTR -260+[ebp]
	push	ecx
	push	11					; 0000000bH
	push	OFFSET FLAT:$SG71250
	mov	edx, DWORD PTR _html$[ebp]
	push	edx
	call	_dynbuf_add3
	add	esp, 36					; 00000024H
	test	eax, eax
	je	SHORT $L71245
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29872], OFFSET FLAT:$SG71252
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 732		; 000002dcH
	jmp	$eva_err$71156
$L71245:

; 733  : 			if(ctrl_output_calendar_datelink(cntxt, cl, date, d, "DAY")) STACK_ERROR;

	push	OFFSET FLAT:$SG71254
	mov	edx, DWORD PTR _d$71240[ebp]
	push	edx
	lea	eax, DWORD PTR _date$[ebp]
	push	eax
	mov	ecx, DWORD PTR _cl$[ebp]
	push	ecx
	mov	edx, DWORD PTR _cntxt$[ebp]
	push	edx
	call	_ctrl_output_calendar_datelink
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L71253
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 733		; 000002ddH
	jmp	$eva_err$71156
$L71253:

; 734  : 			DYNBUF_ADD_STR(html, "</font>");

	push	0
	push	0
	push	7
	push	OFFSET FLAT:$SG71257
	mov	ecx, DWORD PTR _html$[ebp]
	push	ecx
	call	_dynbuf_add
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L71256
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29872], OFFSET FLAT:$SG71259
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 734		; 000002deH
	jmp	$eva_err$71156
$L71256:

; 735  : 			if(month != cdt->tm_mon)

	mov	ecx, DWORD PTR _cdt$71241[ebp]
	mov	edx, DWORD PTR _month$[ebp]
	cmp	edx, DWORD PTR [ecx+16]
	je	SHORT $L71262

; 736  : 				DYNBUF_ADD3_CELL(html, "<font size=-2> ", &cntxt->monthshort, cdt->tm_mon, 0, NO_CONV, "</font>");

	push	7
	push	OFFSET FLAT:$SG71263
	push	0
	push	0
	push	0
	mov	eax, DWORD PTR _cdt$71241[ebp]
	mov	ecx, DWORD PTR [eax+16]
	push	ecx
	mov	edx, DWORD PTR _cntxt$[ebp]
	add	edx, 269728				; 00041da0H
	push	edx
	call	_dyntab_sz
	add	esp, 12					; 0000000cH
	push	eax
	push	0
	mov	eax, DWORD PTR _cdt$71241[ebp]
	mov	ecx, DWORD PTR [eax+16]
	push	ecx
	mov	edx, DWORD PTR _cntxt$[ebp]
	add	edx, 269728				; 00041da0H
	push	edx
	call	_dyntab_val
	add	esp, 12					; 0000000cH
	push	eax
	push	15					; 0000000fH
	push	OFFSET FLAT:$SG71264
	mov	eax, DWORD PTR _html$[ebp]
	push	eax
	call	_dynbuf_add3
	add	esp, 36					; 00000024H
	test	eax, eax
	je	SHORT $L71262
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29872], OFFSET FLAT:$SG71266
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 736		; 000002e0H
	jmp	$eva_err$71156
$L71262:

; 737  : 			if(j) break;

	cmp	DWORD PTR _j$[ebp], 0
	je	SHORT $L71267
	jmp	SHORT $L71239
$L71267:

; 738  : 			if(!b_wegroup || dt.tm_wday != 6 || strcmp(date1, cl->dateend) > 0) break;

	cmp	DWORD PTR _b_wegroup$[ebp], 0
	je	SHORT $L71269
	cmp	DWORD PTR _dt$[ebp+24], 6
	jne	SHORT $L71269
	mov	eax, DWORD PTR _cl$[ebp]
	add	eax, 212				; 000000d4H
	push	eax
	lea	ecx, DWORD PTR _date1$[ebp]
	push	ecx
	call	_strcmp
	add	esp, 8
	test	eax, eax
	jle	SHORT $L71268
$L71269:
	jmp	SHORT $L71239
$L71268:

; 739  : 			i++;

	mov	edx, DWORD PTR _i$[ebp]
	add	edx, 1
	mov	DWORD PTR _i$[ebp], edx

; 740  : 			DYNBUF_ADD_STR(html, " - ");

	push	0
	push	0
	push	3
	push	OFFSET FLAT:$SG71272
	mov	eax, DWORD PTR _html$[ebp]
	push	eax
	call	_dynbuf_add
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L71271
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29872], OFFSET FLAT:$SG71274
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 740		; 000002e4H
	jmp	$eva_err$71156
$L71271:

; 741  : 		}

	jmp	$L71238
$L71239:

; 742  : 		DYNBUF_ADD_STR(html, "</td></tr><tr>");

	push	0
	push	0
	push	14					; 0000000eH
	push	OFFSET FLAT:$SG71277
	mov	eax, DWORD PTR _html$[ebp]
	push	eax
	call	_dynbuf_add
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L71276
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29872], OFFSET FLAT:$SG71279
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 742		; 000002e6H
	jmp	$eva_err$71156
$L71276:

; 743  : 
; 744  : 		/* Output calendar cell contents for the day & next day if we group */
; 745  : 		cl->datefmt = (b_wegroup && dt.tm_wday == 6) ? "_EVA_DayTime" : "_EVA_Time";

	cmp	DWORD PTR _b_wegroup$[ebp], 0
	je	SHORT $L72000
	cmp	DWORD PTR _dt$[ebp+24], 6
	jne	SHORT $L72000
	mov	DWORD PTR -268+[ebp], OFFSET FLAT:$SG71280
	jmp	SHORT $L72001
$L72000:
	mov	DWORD PTR -268+[ebp], OFFSET FLAT:$SG71281
$L72001:
	mov	eax, DWORD PTR _cl$[ebp]
	mov	ecx, DWORD PTR -268+[ebp]
	mov	DWORD PTR [eax+248], ecx

; 746  : 		if(ctrl_output_calendar_dayhours(cntxt, cl, &cnt, "00", "9", date0)) STACK_ERROR;

	lea	edx, DWORD PTR _date0$[ebp]
	push	edx
	push	OFFSET FLAT:$SG71283
	push	OFFSET FLAT:$SG71284
	lea	eax, DWORD PTR _cnt$[ebp]
	push	eax
	mov	ecx, DWORD PTR _cl$[ebp]
	push	ecx
	mov	edx, DWORD PTR _cntxt$[ebp]
	push	edx
	call	_ctrl_output_calendar_dayhours
	add	esp, 24					; 00000018H
	test	eax, eax
	je	SHORT $L71282
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 746		; 000002eaH
	jmp	$eva_err$71156
$L71282:

; 747  : 		if(b_wegroup && dt.tm_wday == 6)

	cmp	DWORD PTR _b_wegroup$[ebp], 0
	je	SHORT $L71285
	cmp	DWORD PTR _dt$[ebp+24], 6
	jne	SHORT $L71285

; 749  : 			if(ctrl_output_calendar_dayhours(cntxt, cl, &cnt, "00", "9", date1)) STACK_ERROR;

	lea	ecx, DWORD PTR _date1$[ebp]
	push	ecx
	push	OFFSET FLAT:$SG71287
	push	OFFSET FLAT:$SG71288
	lea	edx, DWORD PTR _cnt$[ebp]
	push	edx
	mov	eax, DWORD PTR _cl$[ebp]
	push	eax
	mov	ecx, DWORD PTR _cntxt$[ebp]
	push	ecx
	call	_ctrl_output_calendar_dayhours
	add	esp, 24					; 00000018H
	test	eax, eax
	je	SHORT $L71286
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 749		; 000002edH
	jmp	$eva_err$71156
$L71286:

; 750  : 			delay_to_datetxt(date1, cl->datebeg, i + 1, 'D');

	push	68					; 00000044H
	mov	eax, DWORD PTR _i$[ebp]
	add	eax, 1
	push	eax
	mov	ecx, DWORD PTR _cl$[ebp]
	add	ecx, 196				; 000000c4H
	push	ecx
	lea	edx, DWORD PTR _date1$[ebp]
	push	edx
	call	_delay_to_datetxt
	add	esp, 16					; 00000010H
$L71285:

; 752  : 		DYNBUF_ADD_STR(html, "</tr></table></td>");

	push	0
	push	0
	push	18					; 00000012H
	push	OFFSET FLAT:$SG71291
	mov	eax, DWORD PTR _html$[ebp]
	push	eax
	call	_dynbuf_add
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L71290
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29872], OFFSET FLAT:$SG71293
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 752		; 000002f0H
	jmp	SHORT $eva_err$71156
$L71290:

; 753  : 
; 754  : 		strcpy(date0, date1);

	lea	eax, DWORD PTR _date1$[ebp]
	push	eax
	lea	ecx, DWORD PTR _date0$[ebp]
	push	ecx
	call	_strcpy
	add	esp, 8

; 755  : 	}

	jmp	$L71188
$eva_noerr$71294:

; 756  : 	RETURN_OK_CLEANUP;

	push	0
	push	OFFSET FLAT:$SG71295
	push	OFFSET FLAT:$SG71296
	mov	edx, DWORD PTR _cntxt$[ebp]
	push	edx
	call	_err_clear
	add	esp, 16					; 00000010H
$eva_err$71156:
	mov	eax, DWORD PTR _cntxt$[ebp]
	cmp	DWORD PTR [eax+29872], 0
	je	SHORT $L71297
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	edx, DWORD PTR [ecx+29900]
	push	edx
	push	OFFSET FLAT:$SG71298
	push	OFFSET FLAT:$SG71299
	mov	eax, DWORD PTR _cntxt$[ebp]
	push	eax
	call	_err_add_context
	add	esp, 16					; 00000010H
$L71297:
	mov	ecx, DWORD PTR _cntxt$[ebp]
	xor	eax, eax
	cmp	DWORD PTR [ecx+29872], 0
	setne	al
$L71138:

; 757  : }

	mov	esp, ebp
	pop	ebp
	ret	0
_ctrl_output_calendar_month ENDP
_TEXT	ENDS
PUBLIC	_ctrl_read_calendar_times
EXTRN	_dyntab_field_val:NEAR
_BSS	SEGMENT
	ALIGN	4

$SG71312 DB	01H DUP (?)
	ALIGN	4

$SG71316 DB	01H DUP (?)
	ALIGN	4

$SG71320 DB	01H DUP (?)
_BSS	ENDS
_DATA	SEGMENT
	ORG $+1
$SG71310 DB	'00', 00H
	ORG $+1
$SG71311 DB	'_EVA_TIME_MIDDAY', 00H
	ORG $+3
$SG71314 DB	'12', 00H
	ORG $+1
$SG71315 DB	'_EVA_TIME_AFTERNOON', 00H
$SG71318 DB	'14', 00H
	ORG $+1
$SG71319 DB	'_EVA_TIME_EVENING', 00H
	ORG $+2
$SG71322 DB	'19', 00H
	ORG $+1
$SG71323 DB	'9', 00H
_DATA	ENDS
_TEXT	SEGMENT
_cntxt$ = 8
_cl$ = 12
_h$ = 16
_ctrl$ = -4
_ctrl_read_calendar_times PROC NEAR

; 769  : ){

	push	ebp
	mov	ebp, esp
	sub	esp, 16					; 00000010H

; 770  : 	EVA_ctrl *ctrl = cntxt->form->ctrl + cl->i_ctrl;

	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	ecx, DWORD PTR [eax+80]
	mov	edx, DWORD PTR _cl$[ebp]
	mov	eax, DWORD PTR [edx+240]
	imul	eax, 480				; 000001e0H
	mov	ecx, DWORD PTR [ecx]
	add	ecx, eax
	mov	DWORD PTR _ctrl$[ebp], ecx

; 771  : 	h[0] = "00";

	mov	edx, DWORD PTR _h$[ebp]
	mov	DWORD PTR [edx], OFFSET FLAT:$SG71310

; 772  : 	h[1] = CTRL_ATTR_VAL(TIME_MIDDAY);

	cmp	DWORD PTR _ctrl$[ebp], 0
	je	SHORT $L72003
	push	0
	push	-1
	push	OFFSET FLAT:$SG71311
	mov	eax, DWORD PTR _ctrl$[ebp]
	add	eax, 44					; 0000002cH
	push	eax
	call	_dyntab_field_val
	add	esp, 16					; 00000010H
	mov	DWORD PTR -8+[ebp], eax
	jmp	SHORT $L72004
$L72003:
	mov	DWORD PTR -8+[ebp], OFFSET FLAT:$SG71312
$L72004:
	mov	ecx, DWORD PTR _h$[ebp]
	mov	edx, DWORD PTR -8+[ebp]
	mov	DWORD PTR [ecx+4], edx

; 773  : 	if(!h[1][0]) h[1] = "12";

	mov	eax, DWORD PTR _h$[ebp]
	mov	ecx, DWORD PTR [eax+4]
	movsx	edx, BYTE PTR [ecx]
	test	edx, edx
	jne	SHORT $L71313
	mov	eax, DWORD PTR _h$[ebp]
	mov	DWORD PTR [eax+4], OFFSET FLAT:$SG71314
$L71313:

; 774  : 	h[2] = CTRL_ATTR_VAL(TIME_AFTERNOON);

	cmp	DWORD PTR _ctrl$[ebp], 0
	je	SHORT $L72005
	push	0
	push	-1
	push	OFFSET FLAT:$SG71315
	mov	ecx, DWORD PTR _ctrl$[ebp]
	add	ecx, 44					; 0000002cH
	push	ecx
	call	_dyntab_field_val
	add	esp, 16					; 00000010H
	mov	DWORD PTR -12+[ebp], eax
	jmp	SHORT $L72006
$L72005:
	mov	DWORD PTR -12+[ebp], OFFSET FLAT:$SG71316
$L72006:
	mov	edx, DWORD PTR _h$[ebp]
	mov	eax, DWORD PTR -12+[ebp]
	mov	DWORD PTR [edx+8], eax

; 775  : 	if(!h[2][0]) h[2] = "14";

	mov	ecx, DWORD PTR _h$[ebp]
	mov	edx, DWORD PTR [ecx+8]
	movsx	eax, BYTE PTR [edx]
	test	eax, eax
	jne	SHORT $L71317
	mov	ecx, DWORD PTR _h$[ebp]
	mov	DWORD PTR [ecx+8], OFFSET FLAT:$SG71318
$L71317:

; 776  : 	h[3] = CTRL_ATTR_VAL(TIME_EVENING);

	cmp	DWORD PTR _ctrl$[ebp], 0
	je	SHORT $L72007
	push	0
	push	-1
	push	OFFSET FLAT:$SG71319
	mov	edx, DWORD PTR _ctrl$[ebp]
	add	edx, 44					; 0000002cH
	push	edx
	call	_dyntab_field_val
	add	esp, 16					; 00000010H
	mov	DWORD PTR -16+[ebp], eax
	jmp	SHORT $L72008
$L72007:
	mov	DWORD PTR -16+[ebp], OFFSET FLAT:$SG71320
$L72008:
	mov	eax, DWORD PTR _h$[ebp]
	mov	ecx, DWORD PTR -16+[ebp]
	mov	DWORD PTR [eax+12], ecx

; 777  : 	if(!h[3][0]) h[3] = "19";

	mov	edx, DWORD PTR _h$[ebp]
	mov	eax, DWORD PTR [edx+12]
	movsx	ecx, BYTE PTR [eax]
	test	ecx, ecx
	jne	SHORT $L71321
	mov	edx, DWORD PTR _h$[ebp]
	mov	DWORD PTR [edx+12], OFFSET FLAT:$SG71322
$L71321:

; 778  : 	h[4] = "9";

	mov	eax, DWORD PTR _h$[ebp]
	mov	DWORD PTR [eax+16], OFFSET FLAT:$SG71323

; 779  : }

	mov	esp, ebp
	pop	ebp
	ret	0
_ctrl_read_calendar_times ENDP
_TEXT	ENDS
PUBLIC	_ctrl_output_calendar_week
_BSS	SEGMENT
	ALIGN	4

$SG71372 DB	01H DUP (?)
	ALIGN	4

$SG71418 DB	01H DUP (?)
_BSS	ENDS
_DATA	SEGMENT
	ORG $+2
$SG71339 DB	'M<br>a<br>t<br>i<br>n', 00H
	ORG $+2
$SG71340 DB	'M<br>a<br>t<br>i<br>n', 00H
	ORG $+2
$SG71341 DB	'M<br>i<br>d', 00H
$SG71342 DB	'M<br>i<br>d', 00H
$SG71343 DB	'A<br>.<br>M<br>.', 00H
	ORG $+3
$SG71344 DB	'A<br>.<br>M<br>.', 00H
	ORG $+3
$SG71345 DB	'S<br>o<br>i<br>r', 00H
	ORG $+3
$SG71346 DB	'S<br>o<br>i<br>r', 00H
	ORG $+3
$SG71356 DB	'-2', 00H
	ORG $+1
$SG71357 DB	'_EVA_Time', 00H
	ORG $+2
$SG71362 DB	'<td></td>', 00H
	ORG $+2
$SG71364 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG71371 DB	'<font size=-1>', 00H
	ORG $+1
$SG71373 DB	'<td width=%d%% bgcolor=#%s>%s<nobr>', 00H
$SG71374 DB	'_EVA_DayLong', 00H
	ORG $+3
$SG71375 DB	'_EVA_DayFull', 00H
	ORG $+3
$SG71377 DB	'DAY', 00H
$SG71382 DB	'</td>', 00H
	ORG $+2
$SG71384 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG71388 DB	'</nobr> <nobr>', 00H
	ORG $+1
$SG71390 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG71395 DB	'</tr><tr><td bgcolor=#%s height=%d align=center><font si'
	DB	'ze=-1><b>%s</b></td>', 00H
	ORG $+3
$SG71405 DB	'<td valign=top', 00H
	ORG $+1
$SG71407 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG71411 DB	'_EVA_NONE', 00H
	ORG $+2
$SG71414 DB	'_EVA_SUNDAY', 00H
$SG71419 DB	' bgcolor=#', 00H
	ORG $+1
$SG71421 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG71424 DB	'>', 00H
	ORG $+2
$SG71426 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG71429 DB	'<table border=0 width=100% cellspacing=0><tr>', 00H
	ORG $+2
$SG71431 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG71435 DB	'</tr></table>', 00H
	ORG $+2
$SG71437 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG71442 DB	'</td>', 00H
	ORG $+2
$SG71444 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG71446 DB	'D:\Travail\ABI\EVA\V4.0\CGI\Brunix-2016\ctrl_output_cale'
	DB	'ndar.c', 00H
	ORG $+1
$SG71447 DB	'ctrl_output_calendar_week', 00H
	ORG $+2
$SG71449 DB	'D:\Travail\ABI\EVA\V4.0\CGI\Brunix-2016\ctrl_output_cale'
	DB	'ndar.c', 00H
	ORG $+1
$SG71450 DB	'ctrl_output_calendar_week', 00H
_DATA	ENDS
_TEXT	SEGMENT
_cntxt$ = 8
_cl$ = 12
_date0$ = -1080
_date1$ = -1160
_date$ = -1144
_printbuf$ = -1024
_i$ = -1184
_j$ = -1188
_labels$ = -1044
_h$ = -1180
_cnt$ = -1064
_b_wegroup$ = -1048
_b_today$ = -1192
_html$ = -1028
_bgcolor$71399 = -1196
_ctrl_output_calendar_week PROC NEAR

; 790  : ){

	push	ebp
	mov	ebp, esp
	sub	esp, 1224				; 000004c8H

; 791  : 	char date0[16], date1[16], date[64], printbuf[1024];
; 792  : 	unsigned long i, j;
; 793  : 	char *labels[] = { "M<br>a<br>t<br>i<br>n", "M<br>i<br>d", "A<br>.<br>M<br>.", "S<br>o<br>i<br>r" };

	mov	DWORD PTR _labels$[ebp], OFFSET FLAT:$SG71340
	mov	DWORD PTR _labels$[ebp+4], OFFSET FLAT:$SG71342
	mov	DWORD PTR _labels$[ebp+8], OFFSET FLAT:$SG71344
	mov	DWORD PTR _labels$[ebp+12], OFFSET FLAT:$SG71346

; 794  : 	char *h[5];
; 795  : 	unsigned long cnt[] = { 0, 0, 0, 0 };

	mov	DWORD PTR _cnt$[ebp], 0
	mov	DWORD PTR _cnt$[ebp+4], 0
	mov	DWORD PTR _cnt$[ebp+8], 0
	mov	DWORD PTR _cnt$[ebp+12], 0

; 796  : 	int b_wegroup = !*cl->wemode;

	mov	eax, DWORD PTR _cl$[ebp]
	mov	ecx, DWORD PTR [eax+272]
	movsx	edx, BYTE PTR [ecx]
	neg	edx
	sbb	edx, edx
	inc	edx
	mov	DWORD PTR _b_wegroup$[ebp], edx

; 797  : 	int b_today;
; 798  : 	CHECK_HTML_STATUS;

	cmp	DWORD PTR _cntxt$[ebp], 0
	je	SHORT $L72012
	mov	eax, DWORD PTR _cntxt$[ebp]
	cmp	DWORD PTR [eax+80], 0
	je	SHORT $L72010
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	edx, DWORD PTR [ecx+80]
	mov	eax, DWORD PTR [edx+232]
	mov	DWORD PTR -1200+[ebp], eax
	jmp	SHORT $L72011
$L72010:
	mov	DWORD PTR -1200+[ebp], 0
$L72011:
	mov	ecx, DWORD PTR -1200+[ebp]
	mov	DWORD PTR -1204+[ebp], ecx
	jmp	SHORT $L72013
$L72012:
	mov	DWORD PTR -1204+[ebp], 0
$L72013:
	mov	edx, DWORD PTR -1204+[ebp]
	mov	DWORD PTR _html$[ebp], edx
	cmp	DWORD PTR _html$[ebp], 0
	jne	SHORT $L71354
	xor	eax, eax
	jmp	$L71331
$L71354:

; 799  : 
; 800  : 	/* Read calendar times */
; 801  : 	ctrl_read_calendar_times(cntxt, cl, h);

	lea	eax, DWORD PTR _h$[ebp]
	push	eax
	mov	ecx, DWORD PTR _cl$[ebp]
	push	ecx
	mov	edx, DWORD PTR _cntxt$[ebp]
	push	edx
	call	_ctrl_read_calendar_times
	add	esp, 12					; 0000000cH

; 802  : 
; 803  : 	/* Output title & day labels */
; 804  : 	cl->cols = 8;

	mov	eax, DWORD PTR _cl$[ebp]
	mov	DWORD PTR [eax+228], 8

; 805  : 	if(!*cl->fontsize) cl->fontsize = "-2";

	mov	ecx, DWORD PTR _cl$[ebp]
	mov	edx, DWORD PTR [ecx+268]
	movsx	eax, BYTE PTR [edx]
	test	eax, eax
	jne	SHORT $L71355
	mov	ecx, DWORD PTR _cl$[ebp]
	mov	DWORD PTR [ecx+268], OFFSET FLAT:$SG71356
$L71355:

; 806  : 	cl->datefmt = "_EVA_Time";

	mov	edx, DWORD PTR _cl$[ebp]
	mov	DWORD PTR [edx+248], OFFSET FLAT:$SG71357

; 807  : 	cl->datefmt_minsz = 10;

	mov	eax, DWORD PTR _cl$[ebp]
	mov	DWORD PTR [eax+252], 10			; 0000000aH

; 808  : 	if(ctrl_output_calendar_title(cntxt, cl)) STACK_ERROR;

	mov	ecx, DWORD PTR _cl$[ebp]
	push	ecx
	mov	edx, DWORD PTR _cntxt$[ebp]
	push	edx
	call	_ctrl_output_calendar_title
	add	esp, 8
	test	eax, eax
	je	SHORT $L71358
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 808		; 00000328H
	jmp	$eva_err$71359
$L71358:

; 809  : 	DYNBUF_ADD_STR(html, "<td></td>");

	push	0
	push	0
	push	9
	push	OFFSET FLAT:$SG71362
	mov	ecx, DWORD PTR _html$[ebp]
	push	ecx
	call	_dynbuf_add
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L71361
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29872], OFFSET FLAT:$SG71364
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 809		; 00000329H
	jmp	$eva_err$71359
$L71361:

; 810  : 	for(j = 0; j < 7; j++)

	mov	DWORD PTR _j$[ebp], 0
	jmp	SHORT $L71365
$L71366:
	mov	ecx, DWORD PTR _j$[ebp]
	add	ecx, 1
	mov	DWORD PTR _j$[ebp], ecx
$L71365:
	cmp	DWORD PTR _j$[ebp], 7
	jae	$L71367

; 812  : 		delay_to_datetxt(date0, cl->datebeg, j, 'D');

	push	68					; 00000044H
	mov	edx, DWORD PTR _j$[ebp]
	push	edx
	mov	eax, DWORD PTR _cl$[ebp]
	add	eax, 196				; 000000c4H
	push	eax
	lea	ecx, DWORD PTR _date0$[ebp]
	push	ecx
	call	_delay_to_datetxt
	add	esp, 16					; 00000010H

; 813  : 		delay_to_datetxt(date1, cl->datebeg, j + 1, 'D');

	push	68					; 00000044H
	mov	edx, DWORD PTR _j$[ebp]
	add	edx, 1
	push	edx
	mov	eax, DWORD PTR _cl$[ebp]
	add	eax, 196				; 000000c4H
	push	eax
	lea	ecx, DWORD PTR _date1$[ebp]
	push	ecx
	call	_delay_to_datetxt
	add	esp, 16					; 00000010H

; 814  : 		b_today = !strncmp(date0, cntxt->timestamp, 8) ||
; 815  : 						(b_wegroup && j == 6 && !strncmp(date1, cntxt->timestamp, 8));

	push	8
	mov	edx, DWORD PTR _cntxt$[ebp]
	add	edx, 29704				; 00007408H
	push	edx
	lea	eax, DWORD PTR _date0$[ebp]
	push	eax
	call	_strncmp
	add	esp, 12					; 0000000cH
	test	eax, eax
	je	SHORT $L72015
	cmp	DWORD PTR _b_wegroup$[ebp], 0
	je	SHORT $L72014
	cmp	DWORD PTR _j$[ebp], 6
	jne	SHORT $L72014
	push	8
	mov	ecx, DWORD PTR _cntxt$[ebp]
	add	ecx, 29704				; 00007408H
	push	ecx
	lea	edx, DWORD PTR _date1$[ebp]
	push	edx
	call	_strncmp
	add	esp, 12					; 0000000cH
	test	eax, eax
	je	SHORT $L72015
$L72014:
	mov	DWORD PTR -1208+[ebp], 0
	jmp	SHORT $L72016
$L72015:
	mov	DWORD PTR -1208+[ebp], 1
$L72016:
	mov	eax, DWORD PTR -1208+[ebp]
	mov	DWORD PTR _b_today$[ebp], eax

; 816  : 		if(j < 6 || ! b_wegroup)

	cmp	DWORD PTR _j$[ebp], 6
	jb	SHORT $L71369
	cmp	DWORD PTR _b_wegroup$[ebp], 0
	jne	$L71368
$L71369:

; 817  : 			dynbuf_print3(html, "<td width=%d%% bgcolor=#%s>%s<nobr>",
; 818  : 								(100 / (b_wegroup ? 6 : 7)) + 1,
; 819  : 								b_today ? cl->todaylblbgcolor : cl->datelblbgcolor,
; 820  : 								(j == 5 && b_wegroup) ? "<font size=-1>" : "");

	cmp	DWORD PTR _j$[ebp], 5
	jne	SHORT $L72017
	cmp	DWORD PTR _b_wegroup$[ebp], 0
	je	SHORT $L72017
	mov	DWORD PTR -1212+[ebp], OFFSET FLAT:$SG71371
	jmp	SHORT $L72018
$L72017:
	mov	DWORD PTR -1212+[ebp], OFFSET FLAT:$SG71372
$L72018:
	cmp	DWORD PTR _b_today$[ebp], 0
	je	SHORT $L72019
	mov	ecx, DWORD PTR _cl$[ebp]
	mov	edx, DWORD PTR [ecx+292]
	mov	DWORD PTR -1216+[ebp], edx
	jmp	SHORT $L72020
$L72019:
	mov	eax, DWORD PTR _cl$[ebp]
	mov	ecx, DWORD PTR [eax+280]
	mov	DWORD PTR -1216+[ebp], ecx
$L72020:
	push	0
	push	0
	mov	edx, DWORD PTR -1212+[ebp]
	push	edx
	mov	eax, DWORD PTR -1216+[ebp]
	push	eax
	mov	ecx, DWORD PTR _b_wegroup$[ebp]
	neg	ecx
	sbb	ecx, ecx
	add	ecx, 7
	mov	eax, 100				; 00000064H
	cdq
	idiv	ecx
	add	eax, 1
	push	eax
	push	OFFSET FLAT:$SG71373
	push	1023					; 000003ffH
	lea	edx, DWORD PTR _printbuf$[ebp]
	push	edx
	call	__snprintf
	add	esp, 24					; 00000018H
	push	eax
	lea	eax, DWORD PTR _printbuf$[ebp]
	push	eax
	mov	ecx, DWORD PTR _html$[ebp]
	push	ecx
	call	_dynbuf_add
	add	esp, 20					; 00000014H
$L71368:

; 821  : 		datetxt_to_format(cntxt, date, date0, (j >= 5 && b_wegroup && strncmp(date0, cntxt->timestamp, 8)) ? "_EVA_DayLong" : "_EVA_DayFull");

	cmp	DWORD PTR _j$[ebp], 5
	jb	SHORT $L72021
	cmp	DWORD PTR _b_wegroup$[ebp], 0
	je	SHORT $L72021
	push	8
	mov	edx, DWORD PTR _cntxt$[ebp]
	add	edx, 29704				; 00007408H
	push	edx
	lea	eax, DWORD PTR _date0$[ebp]
	push	eax
	call	_strncmp
	add	esp, 12					; 0000000cH
	test	eax, eax
	je	SHORT $L72021
	mov	DWORD PTR -1220+[ebp], OFFSET FLAT:$SG71374
	jmp	SHORT $L72022
$L72021:
	mov	DWORD PTR -1220+[ebp], OFFSET FLAT:$SG71375
$L72022:
	mov	ecx, DWORD PTR -1220+[ebp]
	push	ecx
	lea	edx, DWORD PTR _date0$[ebp]
	push	edx
	lea	eax, DWORD PTR _date$[ebp]
	push	eax
	mov	ecx, DWORD PTR _cntxt$[ebp]
	push	ecx
	call	_datetxt_to_format
	add	esp, 16					; 00000010H

; 822  : 		if(ctrl_output_calendar_datelink(cntxt, cl, date, date0, "DAY")) STACK_ERROR;

	push	OFFSET FLAT:$SG71377
	lea	edx, DWORD PTR _date0$[ebp]
	push	edx
	lea	eax, DWORD PTR _date$[ebp]
	push	eax
	mov	ecx, DWORD PTR _cl$[ebp]
	push	ecx
	mov	edx, DWORD PTR _cntxt$[ebp]
	push	edx
	call	_ctrl_output_calendar_datelink
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L71376
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 822		; 00000336H
	jmp	$eva_err$71359
$L71376:

; 823  : 		if(j != 5 || ! b_wegroup)

	cmp	DWORD PTR _j$[ebp], 5
	jne	SHORT $L71379
	cmp	DWORD PTR _b_wegroup$[ebp], 0
	jne	SHORT $L71378
$L71379:

; 824  : 			DYNBUF_ADD_STR(html, "</td>")

	push	0
	push	0
	push	5
	push	OFFSET FLAT:$SG71382
	mov	ecx, DWORD PTR _html$[ebp]
	push	ecx
	call	_dynbuf_add
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L71381
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29872], OFFSET FLAT:$SG71384
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 824		; 00000338H
	jmp	$eva_err$71359
$L71381:

; 825  : 		else

	jmp	SHORT $L71387
$L71378:

; 826  : 			DYNBUF_ADD_STR(html, "</nobr> <nobr>");

	push	0
	push	0
	push	14					; 0000000eH
	push	OFFSET FLAT:$SG71388
	mov	ecx, DWORD PTR _html$[ebp]
	push	ecx
	call	_dynbuf_add
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L71387
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29872], OFFSET FLAT:$SG71390
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 826		; 0000033aH
	jmp	$eva_err$71359
$L71387:

; 827  : 	}

	jmp	$L71366
$L71367:

; 828  : 
; 829  : 	/* Output days parts by rows */
; 830  : 	for(i = 0; i < sizeof(labels)/sizeof(labels[0]); i++)

	mov	DWORD PTR _i$[ebp], 0
	jmp	SHORT $L71391
$L71392:
	mov	ecx, DWORD PTR _i$[ebp]
	add	ecx, 1
	mov	DWORD PTR _i$[ebp], ecx
$L71391:
	cmp	DWORD PTR _i$[ebp], 4
	jae	$eva_noerr$71445

; 832  : 		/* Output part header */
; 833  : 		dynbuf_print3(html, "</tr><tr><td bgcolor=#%s height=%d align=center><font size=-1><b>%s</b></td>",
; 834  : 							cl->datelblbgcolor,
; 835  : 							i & 1 ? 100 : 50,
; 836  : 							labels[i]);

	push	0
	push	0
	mov	edx, DWORD PTR _i$[ebp]
	mov	eax, DWORD PTR _labels$[ebp+edx*4]
	push	eax
	mov	ecx, DWORD PTR _i$[ebp]
	and	ecx, 1
	neg	ecx
	sbb	ecx, ecx
	and	ecx, 50					; 00000032H
	add	ecx, 50					; 00000032H
	push	ecx
	mov	edx, DWORD PTR _cl$[ebp]
	mov	eax, DWORD PTR [edx+280]
	push	eax
	push	OFFSET FLAT:$SG71395
	push	1023					; 000003ffH
	lea	ecx, DWORD PTR _printbuf$[ebp]
	push	ecx
	call	__snprintf
	add	esp, 24					; 00000018H
	push	eax
	lea	edx, DWORD PTR _printbuf$[ebp]
	push	edx
	mov	eax, DWORD PTR _html$[ebp]
	push	eax
	call	_dynbuf_add
	add	esp, 20					; 00000014H

; 837  : 
; 838  : 		/* Output each day in week */
; 839  : 		for(j = 0; j < 7; j++)

	mov	DWORD PTR _j$[ebp], 0
	jmp	SHORT $L71396
$L71397:
	mov	ecx, DWORD PTR _j$[ebp]
	add	ecx, 1
	mov	DWORD PTR _j$[ebp], ecx
$L71396:
	cmp	DWORD PTR _j$[ebp], 7
	jae	$L71398

; 841  : 			char *bgcolor = NULL;

	mov	DWORD PTR _bgcolor$71399[ebp], 0

; 842  : 
; 843  : 			/* Define period */
; 844  : 			delay_to_datetxt(date0, cl->datebeg, j, 'D');

	push	68					; 00000044H
	mov	edx, DWORD PTR _j$[ebp]
	push	edx
	mov	eax, DWORD PTR _cl$[ebp]
	add	eax, 196				; 000000c4H
	push	eax
	lea	ecx, DWORD PTR _date0$[ebp]
	push	ecx
	call	_delay_to_datetxt
	add	esp, 16					; 00000010H

; 845  : 			date0[8] = 0;

	mov	BYTE PTR _date0$[ebp+8], 0

; 846  :  			delay_to_datetxt(date1, cl->datebeg, j + 1, 'D');

	push	68					; 00000044H
	mov	edx, DWORD PTR _j$[ebp]
	add	edx, 1
	push	edx
	mov	eax, DWORD PTR _cl$[ebp]
	add	eax, 196				; 000000c4H
	push	eax
	lea	ecx, DWORD PTR _date1$[ebp]
	push	ecx
	call	_delay_to_datetxt
	add	esp, 16					; 00000010H

; 847  : 			b_today = !strncmp(date0, cntxt->timestamp, 8) ||
; 848  : 							(b_wegroup && j == 6 && !strncmp(date1, cntxt->timestamp, 8));

	push	8
	mov	edx, DWORD PTR _cntxt$[ebp]
	add	edx, 29704				; 00007408H
	push	edx
	lea	eax, DWORD PTR _date0$[ebp]
	push	eax
	call	_strncmp
	add	esp, 12					; 0000000cH
	test	eax, eax
	je	SHORT $L72024
	cmp	DWORD PTR _b_wegroup$[ebp], 0
	je	SHORT $L72023
	cmp	DWORD PTR _j$[ebp], 6
	jne	SHORT $L72023
	push	8
	mov	ecx, DWORD PTR _cntxt$[ebp]
	add	ecx, 29704				; 00007408H
	push	ecx
	lea	edx, DWORD PTR _date1$[ebp]
	push	edx
	call	_strncmp
	add	esp, 12					; 0000000cH
	test	eax, eax
	je	SHORT $L72024
$L72023:
	mov	DWORD PTR -1224+[ebp], 0
	jmp	SHORT $L72025
$L72024:
	mov	DWORD PTR -1224+[ebp], 1
$L72025:
	mov	eax, DWORD PTR -1224+[ebp]
	mov	DWORD PTR _b_today$[ebp], eax

; 849  : 
; 850  : 			/* Output calendar cell */
; 851  : 			if(j < 6 || ! b_wegroup)

	cmp	DWORD PTR _j$[ebp], 6
	jb	SHORT $L71402
	cmp	DWORD PTR _b_wegroup$[ebp], 0
	jne	$L71423
$L71402:

; 853  : 				DYNBUF_ADD_STR(html, "<td valign=top");

	push	0
	push	0
	push	14					; 0000000eH
	push	OFFSET FLAT:$SG71405
	mov	ecx, DWORD PTR _html$[ebp]
	push	ecx
	call	_dynbuf_add
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L71404
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29872], OFFSET FLAT:$SG71407
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 853		; 00000355H
	jmp	$eva_err$71359
$L71404:

; 854  : 				if(b_today && cl->todaybgcolor[0])

	cmp	DWORD PTR _b_today$[ebp], 0
	je	SHORT $L71408
	mov	ecx, DWORD PTR _cl$[ebp]
	mov	edx, DWORD PTR [ecx+288]
	movsx	eax, BYTE PTR [edx]
	test	eax, eax
	je	SHORT $L71408

; 855  : 					/* Handle cell background : today */
; 856  : 					bgcolor = cl->todaybgcolor;

	mov	ecx, DWORD PTR _cl$[ebp]
	mov	edx, DWORD PTR [ecx+288]
	mov	DWORD PTR _bgcolor$71399[ebp], edx

; 857  : 				else if(cl->webgcolor[0] && strcmp(cl->wemode, "_EVA_NONE") && (

	jmp	SHORT $L71410
$L71408:

; 858  : 							(j == 5 && strcmp(cl->wemode, "_EVA_SUNDAY")) ||
; 859  : 							j == 6))

	mov	eax, DWORD PTR _cl$[ebp]
	mov	ecx, DWORD PTR [eax+276]
	movsx	edx, BYTE PTR [ecx]
	test	edx, edx
	je	SHORT $L71410
	push	OFFSET FLAT:$SG71411
	mov	eax, DWORD PTR _cl$[ebp]
	mov	ecx, DWORD PTR [eax+272]
	push	ecx
	call	_strcmp
	add	esp, 8
	test	eax, eax
	je	SHORT $L71410
	cmp	DWORD PTR _j$[ebp], 5
	jne	SHORT $L71413
	push	OFFSET FLAT:$SG71414
	mov	edx, DWORD PTR _cl$[ebp]
	mov	eax, DWORD PTR [edx+272]
	push	eax
	call	_strcmp
	add	esp, 8
	test	eax, eax
	jne	SHORT $L71412
$L71413:
	cmp	DWORD PTR _j$[ebp], 6
	jne	SHORT $L71410
$L71412:

; 860  : 					/* Handle cell background : week end */
; 861  : 					bgcolor = cl->webgcolor;

	mov	ecx, DWORD PTR _cl$[ebp]
	mov	edx, DWORD PTR [ecx+276]
	mov	DWORD PTR _bgcolor$71399[ebp], edx
$L71410:

; 862  : 				if(bgcolor) DYNBUF_ADD3(html, " bgcolor=#", bgcolor, 0, NO_CONV, "");

	cmp	DWORD PTR _bgcolor$71399[ebp], 0
	je	SHORT $L71417
	push	0
	push	OFFSET FLAT:$SG71418
	push	0
	push	0
	push	0
	mov	eax, DWORD PTR _bgcolor$71399[ebp]
	push	eax
	push	10					; 0000000aH
	push	OFFSET FLAT:$SG71419
	mov	ecx, DWORD PTR _html$[ebp]
	push	ecx
	call	_dynbuf_add3
	add	esp, 36					; 00000024H
	test	eax, eax
	je	SHORT $L71417
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29872], OFFSET FLAT:$SG71421
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 862		; 0000035eH
	jmp	$eva_err$71359
$L71417:

; 863  : 				DYNBUF_ADD_STR(html, ">");

	push	0
	push	0
	push	1
	push	OFFSET FLAT:$SG71424
	mov	ecx, DWORD PTR _html$[ebp]
	push	ecx
	call	_dynbuf_add
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L71423
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29872], OFFSET FLAT:$SG71426
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 863		; 0000035fH
	jmp	$eva_err$71359
$L71423:

; 865  : 			DYNBUF_ADD_STR(html, "<table border=0 width=100% cellspacing=0><tr>");

	push	0
	push	0
	push	45					; 0000002dH
	push	OFFSET FLAT:$SG71429
	mov	ecx, DWORD PTR _html$[ebp]
	push	ecx
	call	_dynbuf_add
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L71428
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29872], OFFSET FLAT:$SG71431
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 865		; 00000361H
	jmp	$eva_err$71359
$L71428:

; 866  : 			if(ctrl_output_calendar_dayhours(cntxt, cl, &cnt[i], h[i], h[i + 1], date0)) STACK_ERROR;

	lea	ecx, DWORD PTR _date0$[ebp]
	push	ecx
	mov	edx, DWORD PTR _i$[ebp]
	mov	eax, DWORD PTR _h$[ebp+edx*4+4]
	push	eax
	mov	ecx, DWORD PTR _i$[ebp]
	mov	edx, DWORD PTR _h$[ebp+ecx*4]
	push	edx
	mov	eax, DWORD PTR _i$[ebp]
	lea	ecx, DWORD PTR _cnt$[ebp+eax*4]
	push	ecx
	mov	edx, DWORD PTR _cl$[ebp]
	push	edx
	mov	eax, DWORD PTR _cntxt$[ebp]
	push	eax
	call	_ctrl_output_calendar_dayhours
	add	esp, 24					; 00000018H
	test	eax, eax
	je	SHORT $L71432
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 866		; 00000362H
	jmp	$eva_err$71359
$L71432:

; 867  : 			DYNBUF_ADD_STR(html, "</tr></table>");

	push	0
	push	0
	push	13					; 0000000dH
	push	OFFSET FLAT:$SG71435
	mov	edx, DWORD PTR _html$[ebp]
	push	edx
	call	_dynbuf_add
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L71434
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29872], OFFSET FLAT:$SG71437
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 867		; 00000363H
	jmp	SHORT $eva_err$71359
$L71434:

; 868  : 			if(j != 5 || !b_wegroup)

	cmp	DWORD PTR _j$[ebp], 5
	jne	SHORT $L71439
	cmp	DWORD PTR _b_wegroup$[ebp], 0
	jne	SHORT $L71441
$L71439:

; 869  : 				DYNBUF_ADD_STR(html, "</td>");

	push	0
	push	0
	push	5
	push	OFFSET FLAT:$SG71442
	mov	edx, DWORD PTR _html$[ebp]
	push	edx
	call	_dynbuf_add
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L71441
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29872], OFFSET FLAT:$SG71444
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 869		; 00000365H
	jmp	SHORT $eva_err$71359
$L71441:

; 870  : 		}

	jmp	$L71397
$L71398:

; 871  : 	}

	jmp	$L71392
$eva_noerr$71445:

; 872  : 
; 873  : 	RETURN_OK_CLEANUP;

	push	0
	push	OFFSET FLAT:$SG71446
	push	OFFSET FLAT:$SG71447
	mov	edx, DWORD PTR _cntxt$[ebp]
	push	edx
	call	_err_clear
	add	esp, 16					; 00000010H
$eva_err$71359:
	mov	eax, DWORD PTR _cntxt$[ebp]
	cmp	DWORD PTR [eax+29872], 0
	je	SHORT $L71448
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	edx, DWORD PTR [ecx+29900]
	push	edx
	push	OFFSET FLAT:$SG71449
	push	OFFSET FLAT:$SG71450
	mov	eax, DWORD PTR _cntxt$[ebp]
	push	eax
	call	_err_add_context
	add	esp, 16					; 00000010H
$L71448:
	mov	ecx, DWORD PTR _cntxt$[ebp]
	xor	eax, eax
	cmp	DWORD PTR [ecx+29872], 0
	setne	al
$L71331:

; 874  : }

	mov	esp, ebp
	pop	ebp
	ret	0
_ctrl_output_calendar_week ENDP
_TEXT	ENDS
PUBLIC	_ctrl_output_calendar_day
_DATA	SEGMENT
	ORG $+2
$SG71463 DB	'Matin', 00H
	ORG $+2
$SG71464 DB	'Matin', 00H
	ORG $+2
$SG71465 DB	'Midi', 00H
	ORG $+3
$SG71466 DB	'Midi', 00H
	ORG $+3
$SG71467 DB	'Apr', 0e8H, 's midi', 00H
	ORG $+1
$SG71468 DB	'Apr', 0e8H, 's midi', 00H
	ORG $+1
$SG71469 DB	'Soir', 00H
	ORG $+3
$SG71470 DB	'Soir', 00H
	ORG $+3
$SG71477 DB	'-1', 00H
	ORG $+1
$SG71478 DB	'_EVA_Time', 00H
	ORG $+2
$SG71485 DB	'%>', 00H
	ORG $+1
$SG71486 DB	'<td valign=top height=80 width=', 00H
$SG71488 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG71490 DB	'>', 00H
	ORG $+2
$SG71491 DB	'<table border=0 width=100% cellspacing=0><tr><td colspan'
	DB	'=3 bgcolor=#', 00H
	ORG $+3
$SG71493 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG71495 DB	'</b></td></tr><tr>', 00H
	ORG $+1
$SG71496 DB	'<b>', 00H
$SG71498 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG71502 DB	'</tr></table></td>', 00H
	ORG $+1
$SG71504 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG71506 DB	'D:\Travail\ABI\EVA\V4.0\CGI\Brunix-2016\ctrl_output_cale'
	DB	'ndar.c', 00H
	ORG $+1
$SG71507 DB	'ctrl_output_calendar_day', 00H
	ORG $+3
$SG71509 DB	'D:\Travail\ABI\EVA\V4.0\CGI\Brunix-2016\ctrl_output_cale'
	DB	'ndar.c', 00H
	ORG $+1
$SG71510 DB	'ctrl_output_calendar_day', 00H
_DATA	ENDS
_TEXT	SEGMENT
_cntxt$ = 8
_cl$ = 12
_cnt$ = -24
_i$ = -48
_labels$ = -20
_h$ = -44
_html$ = -4
_ctrl_output_calendar_day PROC NEAR

; 887  : ){

	push	ebp
	mov	ebp, esp
	sub	esp, 56					; 00000038H

; 888  : 	unsigned long cnt = 0, i;

	mov	DWORD PTR _cnt$[ebp], 0

; 889  : 	char *labels[] = { "Matin", "Midi", "Après midi", "Soir" };

	mov	DWORD PTR _labels$[ebp], OFFSET FLAT:$SG71464
	mov	DWORD PTR _labels$[ebp+4], OFFSET FLAT:$SG71466
	mov	DWORD PTR _labels$[ebp+8], OFFSET FLAT:$SG71468
	mov	DWORD PTR _labels$[ebp+12], OFFSET FLAT:$SG71470

; 890  : 	char *h[5];
; 891  : 	CHECK_HTML_STATUS;

	cmp	DWORD PTR _cntxt$[ebp], 0
	je	SHORT $L72029
	mov	eax, DWORD PTR _cntxt$[ebp]
	cmp	DWORD PTR [eax+80], 0
	je	SHORT $L72027
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	edx, DWORD PTR [ecx+80]
	mov	eax, DWORD PTR [edx+232]
	mov	DWORD PTR -52+[ebp], eax
	jmp	SHORT $L72028
$L72027:
	mov	DWORD PTR -52+[ebp], 0
$L72028:
	mov	ecx, DWORD PTR -52+[ebp]
	mov	DWORD PTR -56+[ebp], ecx
	jmp	SHORT $L72030
$L72029:
	mov	DWORD PTR -56+[ebp], 0
$L72030:
	mov	edx, DWORD PTR -56+[ebp]
	mov	DWORD PTR _html$[ebp], edx
	cmp	DWORD PTR _html$[ebp], 0
	jne	SHORT $L71475
	xor	eax, eax
	jmp	$L71459
$L71475:

; 892  : 
; 893  : 	/* Read calendar times */
; 894  : 	ctrl_read_calendar_times(cntxt, cl, h);

	lea	eax, DWORD PTR _h$[ebp]
	push	eax
	mov	ecx, DWORD PTR _cl$[ebp]
	push	ecx
	mov	edx, DWORD PTR _cntxt$[ebp]
	push	edx
	call	_ctrl_read_calendar_times
	add	esp, 12					; 0000000cH

; 895  : 
; 896  : 	/* Output title && day labels */
; 897  : 	cl->cols = sizeof(labels)/sizeof(labels[0]);

	mov	eax, DWORD PTR _cl$[ebp]
	mov	DWORD PTR [eax+228], 4

; 898  : 	cl->maxlines = 0;

	mov	ecx, DWORD PTR _cl$[ebp]
	mov	DWORD PTR [ecx+236], 0

; 899  : 	if(!*cl->fontsize) cl->fontsize = "-1";

	mov	edx, DWORD PTR _cl$[ebp]
	mov	eax, DWORD PTR [edx+268]
	movsx	ecx, BYTE PTR [eax]
	test	ecx, ecx
	jne	SHORT $L71476
	mov	edx, DWORD PTR _cl$[ebp]
	mov	DWORD PTR [edx+268], OFFSET FLAT:$SG71477
$L71476:

; 900  : 	cl->datefmt = "_EVA_Time";

	mov	eax, DWORD PTR _cl$[ebp]
	mov	DWORD PTR [eax+248], OFFSET FLAT:$SG71478

; 901  : 	cl->datefmt_minsz = 10;

	mov	ecx, DWORD PTR _cl$[ebp]
	mov	DWORD PTR [ecx+252], 10			; 0000000aH

; 902  : 	if(ctrl_output_calendar_title(cntxt, cl)) STACK_ERROR;

	mov	edx, DWORD PTR _cl$[ebp]
	push	edx
	mov	eax, DWORD PTR _cntxt$[ebp]
	push	eax
	call	_ctrl_output_calendar_title
	add	esp, 8
	test	eax, eax
	je	SHORT $L71479
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 902		; 00000386H
	jmp	$eva_err$71480
$L71479:

; 903  : 	for(i = 0; i < cl->cols; i++)

	mov	DWORD PTR _i$[ebp], 0
	jmp	SHORT $L71481
$L71482:
	mov	edx, DWORD PTR _i$[ebp]
	add	edx, 1
	mov	DWORD PTR _i$[ebp], edx
$L71481:
	mov	eax, DWORD PTR _cl$[ebp]
	mov	ecx, DWORD PTR _i$[ebp]
	cmp	ecx, DWORD PTR [eax+228]
	jae	$eva_noerr$71505

; 905  : 		DYNBUF_ADD3_INT(html, "<td valign=top height=80 width=", i & 1 ? 20 : 16, "%>");

	push	2
	push	OFFSET FLAT:$SG71485
	mov	edx, DWORD PTR _i$[ebp]
	and	edx, 1
	neg	edx
	sbb	edx, edx
	and	edx, 4
	add	edx, 16					; 00000010H
	push	edx
	push	31					; 0000001fH
	push	OFFSET FLAT:$SG71486
	mov	eax, DWORD PTR _html$[ebp]
	push	eax
	call	_dynbuf_add3_int
	add	esp, 24					; 00000018H
	test	eax, eax
	je	SHORT $L71484
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29872], OFFSET FLAT:$SG71488
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 905		; 00000389H
	jmp	$eva_err$71480
$L71484:

; 907  : 						"<td colspan=3 bgcolor=#", cl->datelblbgcolor, 0, TO_HTML, ">");

	push	1
	push	OFFSET FLAT:$SG71490
	push	1
	push	OFFSET FLAT:_plain_to_html
	push	0
	mov	eax, DWORD PTR _cl$[ebp]
	mov	ecx, DWORD PTR [eax+280]
	push	ecx
	push	68					; 00000044H
	push	OFFSET FLAT:$SG71491
	mov	edx, DWORD PTR _html$[ebp]
	push	edx
	call	_dynbuf_add3
	add	esp, 36					; 00000024H
	test	eax, eax
	je	SHORT $L71489
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29872], OFFSET FLAT:$SG71493
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 907		; 0000038bH
	jmp	$eva_err$71480
$L71489:

; 908  : 		DYNBUF_ADD3(html, "<b>", labels[i], 0, TO_HTML, "</b></td></tr><tr>");

	push	18					; 00000012H
	push	OFFSET FLAT:$SG71495
	push	1
	push	OFFSET FLAT:_plain_to_html
	push	0
	mov	edx, DWORD PTR _i$[ebp]
	mov	eax, DWORD PTR _labels$[ebp+edx*4]
	push	eax
	push	3
	push	OFFSET FLAT:$SG71496
	mov	ecx, DWORD PTR _html$[ebp]
	push	ecx
	call	_dynbuf_add3
	add	esp, 36					; 00000024H
	test	eax, eax
	je	SHORT $L71494
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29872], OFFSET FLAT:$SG71498
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 908		; 0000038cH
	jmp	$eva_err$71480
$L71494:

; 909  : 		if(ctrl_output_calendar_dayhours(cntxt, cl, &cnt, h[i], h[i + 1], cl->datebeg)) STACK_ERROR;

	mov	ecx, DWORD PTR _cl$[ebp]
	add	ecx, 196				; 000000c4H
	push	ecx
	mov	edx, DWORD PTR _i$[ebp]
	mov	eax, DWORD PTR _h$[ebp+edx*4+4]
	push	eax
	mov	ecx, DWORD PTR _i$[ebp]
	mov	edx, DWORD PTR _h$[ebp+ecx*4]
	push	edx
	lea	eax, DWORD PTR _cnt$[ebp]
	push	eax
	mov	ecx, DWORD PTR _cl$[ebp]
	push	ecx
	mov	edx, DWORD PTR _cntxt$[ebp]
	push	edx
	call	_ctrl_output_calendar_dayhours
	add	esp, 24					; 00000018H
	test	eax, eax
	je	SHORT $L71499
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 909		; 0000038dH
	jmp	SHORT $eva_err$71480
$L71499:

; 910  : 		DYNBUF_ADD_STR(html, "</tr></table></td>");

	push	0
	push	0
	push	18					; 00000012H
	push	OFFSET FLAT:$SG71502
	mov	ecx, DWORD PTR _html$[ebp]
	push	ecx
	call	_dynbuf_add
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L71501
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29872], OFFSET FLAT:$SG71504
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 910		; 0000038eH
	jmp	SHORT $eva_err$71480
$L71501:

; 911  : 	}

	jmp	$L71482
$eva_noerr$71505:

; 912  : 
; 913  : 	RETURN_OK_CLEANUP;

	push	0
	push	OFFSET FLAT:$SG71506
	push	OFFSET FLAT:$SG71507
	mov	ecx, DWORD PTR _cntxt$[ebp]
	push	ecx
	call	_err_clear
	add	esp, 16					; 00000010H
$eva_err$71480:
	mov	edx, DWORD PTR _cntxt$[ebp]
	cmp	DWORD PTR [edx+29872], 0
	je	SHORT $L71508
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	ecx, DWORD PTR [eax+29900]
	push	ecx
	push	OFFSET FLAT:$SG71509
	push	OFFSET FLAT:$SG71510
	mov	edx, DWORD PTR _cntxt$[ebp]
	push	edx
	call	_err_add_context
	add	esp, 16					; 00000010H
$L71508:
	mov	eax, DWORD PTR _cntxt$[ebp]
	xor	ecx, ecx
	cmp	DWORD PTR [eax+29872], 0
	setne	cl
	mov	eax, ecx
$L71459:

; 914  : }

	mov	esp, ebp
	pop	ebp
	ret	0
_ctrl_output_calendar_day ENDP
_TEXT	ENDS
PUBLIC	_ctrl_output_calendar_read
EXTRN	__chkstk:NEAR
EXTRN	_sql_exec_query:NEAR
EXTRN	_qry_exec_filter:NEAR
EXTRN	_atoi:NEAR
EXTRN	_sql_get_table:NEAR
EXTRN	_qry_build_flt_select:NEAR
EXTRN	_dyntab_copy:NEAR
EXTRN	_qry_eval_var_expr_table:NEAR
EXTRN	_dyntab_from_list:NEAR
EXTRN	_qry_build_free:NEAR
EXTRN	_qry_parse_field_modifier:NEAR
EXTRN	_strrchr:NEAR
EXTRN	_qry_build_clauses:NEAR
EXTRN	_qry_parse_filter_nodes:NEAR
EXTRN	_dyntab_filter_field:NEAR
EXTRN	_dyntab_field_cell:NEAR
EXTRN	_dyntab_order_lines:NEAR
_BSS	SEGMENT
	ALIGN	4

$SG71532 DB	01H DUP (?)
	ALIGN	4

$SG71533 DB	01H DUP (?)
	ALIGN	4

$SG71608 DB	01H DUP (?)
	ALIGN	4

$SG71661 DB	01H DUP (?)
_BSS	ENDS
_DATA	SEGMENT
	ORG $+3
$SG71536 DB	'_EVA_FILTER', 00H
$SG71538 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG71542 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG71545 DB	'_EVA_DATE_FIELD', 00H
$SG71547 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG71550 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG71559 DB	'_EVA_TITLE_FIELD', 00H
	ORG $+3
$SG71561 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG71564 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG71567 DB	'_EVA_DETAIL_FIELD', 00H
	ORG $+2
$SG71569 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG71572 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG71577 DB	'_EVA_EVENT_BGCOLOR', 00H
	ORG $+1
$SG71579 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG71582 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG71585 DB	'_EVA_OPEN_FORM', 00H
	ORG $+1
$SG71587 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG71590 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG71593 DB	'_EVA_HIDDEN', 00H
$SG71595 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG71598 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG71600 DB	'EVENTS', 00H
	ORG $+1
$SG71603 DB	'SELEVENT', 00H
	ORG $+3
$SG71604 DB	'XOREVENT', 00H
	ORG $+3
$SG71630 DB	'01', 00H
	ORG $+1
$SG71632 DB	'01', 00H
	ORG $+1
$SG71634 DB	'_EVA_DAY', 00H
	ORG $+3
$SG71636 DB	'01', 00H
	ORG $+1
$SG71638 DB	'01', 00H
	ORG $+1
$SG71641 DB	'_EVA_WEEK', 00H
	ORG $+2
$SG71644 DB	'01', 00H
	ORG $+1
$SG71646 DB	'01', 00H
	ORG $+1
$SG71649 DB	'_EVA_MONTH', 00H
	ORG $+1
$SG71651 DB	'01', 00H
	ORG $+1
$SG71660 DB	'_EVA_START_MONTH', 00H
	ORG $+3
$SG71663 DB	'%4u%2u', 00H
	ORG $+1
$SG71664 DB	'%04i%02i', 00H
	ORG $+3
$SG71666 DB	'DROP TABLE IF EXISTS CalendarObjList', 00H
	ORG $+3
$SG71668 DB	'CREATE TEMPORARY TABLE CalendarObjList (IdObj INT, DateV'
	DB	'al CHAR(14), Num INT, Line INT) TYPE=HEAP', 00H
	ORG $+2
$SG71678 DB	'_EVA_LABEL', 00H
	ORG $+1
$SG71680 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG71684 DB	',', 00H
	ORG $+2
$SG71686 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG71690 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG71694 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG71697 DB	'INSERT INTO CalendarObjList (IdObj,DateVal,Num,Line) ', 0aH
	DB	00H
	ORG $+1
$SG71699 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG71703 DB	'.', 00H
	ORG $+2
$SG71704 DB	'TLink', 00H
	ORG $+2
$SG71706 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG71709 DB	'DateDel', 00H
$SG71710 DB	'DateCr', 00H
	ORG $+1
$SG71712 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG71715 DB	' AS DateVal', 00H
$SG71717 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG71720 DB	'.TxtValue AS DateVal', 00H
	ORG $+3
$SG71721 DB	'TVal', 00H
	ORG $+3
$SG71723 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG71725 DB	' AS Num', 00H
$SG71726 DB	',', 00H
	ORG $+2
$SG71728 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG71730 DB	'.Line AS Line', 00H
	ORG $+2
$SG71731 DB	',TLink', 00H
	ORG $+1
$SG71733 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG71738 DB	'SELECT DISTINCT IdObj,DateVal,Num,Line FROM CalendarObjL'
	DB	'ist ORDER BY DateVal,Num,IdObj', 00H
	ORG $+1
$SG71740 DB	'D:\Travail\ABI\EVA\V4.0\CGI\Brunix-2016\ctrl_output_cale'
	DB	'ndar.c', 00H
	ORG $+1
$SG71741 DB	'ctrl_output_calendar_read', 00H
	ORG $+2
$SG71743 DB	'D:\Travail\ABI\EVA\V4.0\CGI\Brunix-2016\ctrl_output_cale'
	DB	'ndar.c', 00H
	ORG $+1
$SG71744 DB	'ctrl_output_calendar_read', 00H
_DATA	ENDS
_TEXT	SEGMENT
_cntxt$ = 8
_cl$ = 12
_form$ = -8
_ctrl$ = -4576
_empty$ = -116
_data$ = -28
_cgival$ = -60
_sql$ = -4
_flt$ = -4572
_t$ = -32
_dt$ = -96
_i$ = -40
_btn$ = -36
_v$71554 = -4580
_modif$71555 = -4584
_status$71601 = -4600
_b_sel$71602 = -4604
_i_sel$71605 = -4596
_cnt$71607 = -4592
_nb$71609 = -4588
_c$71618 = -4608
_tmp$71650 = -4624
_year$71657 = -4632
_month$71658 = -4628
_m_start$71659 = -4636
_node$71672 = -4640
_df$71673 = -4644
_ctrl_output_calendar_read PROC NEAR

; 931  : ){

	push	ebp
	mov	ebp, esp
	mov	eax, 4700				; 0000125cH
	call	__chkstk
	push	edi

; 932  : 	EVA_form *form = cntxt->form;

	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	ecx, DWORD PTR [eax+80]
	mov	DWORD PTR _form$[ebp], ecx

; 933  : 	EVA_ctrl *ctrl = form->ctrl + cl->i_ctrl;

	mov	edx, DWORD PTR _cl$[ebp]
	mov	eax, DWORD PTR [edx+240]
	imul	eax, 480				; 000001e0H
	mov	ecx, DWORD PTR _form$[ebp]
	mov	edx, DWORD PTR [ecx]
	add	edx, eax
	mov	DWORD PTR _ctrl$[ebp], edx

; 934  : 	DynTable empty = {0};

	mov	DWORD PTR _empty$[ebp], 0
	xor	eax, eax
	mov	DWORD PTR _empty$[ebp+4], eax
	mov	DWORD PTR _empty$[ebp+8], eax
	mov	DWORD PTR _empty$[ebp+12], eax
	mov	DWORD PTR _empty$[ebp+16], eax

; 935  : 	DynTable data = {0};

	mov	DWORD PTR _data$[ebp], 0
	xor	ecx, ecx
	mov	DWORD PTR _data$[ebp+4], ecx
	mov	DWORD PTR _data$[ebp+8], ecx
	mov	DWORD PTR _data$[ebp+12], ecx
	mov	DWORD PTR _data$[ebp+16], ecx

; 936  : 	DynTable cgival = {0};

	mov	DWORD PTR _cgival$[ebp], 0
	xor	edx, edx
	mov	DWORD PTR _cgival$[ebp+4], edx
	mov	DWORD PTR _cgival$[ebp+8], edx
	mov	DWORD PTR _cgival$[ebp+12], edx
	mov	DWORD PTR _cgival$[ebp+16], edx

; 937  : 	DynBuffer *sql = NULL;

	mov	DWORD PTR _sql$[ebp], 0

; 938  : 	QryBuild flt = {{0}};

	mov	DWORD PTR _flt$[ebp], 0
	xor	eax, eax
	mov	DWORD PTR _flt$[ebp+4], eax
	mov	DWORD PTR _flt$[ebp+8], eax
	mov	DWORD PTR _flt$[ebp+12], eax
	mov	DWORD PTR _flt$[ebp+16], eax
	mov	ecx, 1109				; 00000455H
	xor	eax, eax
	lea	edi, DWORD PTR _flt$[ebp+20]
	rep stosd

; 939  : 	time_t t = 0;

	mov	DWORD PTR _t$[ebp], 0

; 940  : 	struct tm dt;
; 941  : 	unsigned long i;
; 942  : 	char *btn = cl->i_ctrl == form->i_ctrl_clic ? CGI_CLICK_BTN_SUBFIELD : "";

	mov	ecx, DWORD PTR _cl$[ebp]
	mov	edx, DWORD PTR _form$[ebp]
	mov	eax, DWORD PTR [ecx+240]
	cmp	eax, DWORD PTR [edx+124]
	jne	$L72034
	mov	ecx, DWORD PTR _cntxt$[ebp]
	cmp	DWORD PTR [ecx+29648], 0
	je	SHORT $L72032
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	eax, DWORD PTR [edx+29656]
	imul	eax, 56					; 00000038H
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	edx, DWORD PTR [ecx+29648]
	mov	eax, DWORD PTR [edx+eax]
	movsx	ecx, BYTE PTR [eax]
	cmp	ecx, 66					; 00000042H
	jne	SHORT $L72032
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	eax, DWORD PTR [edx+29656]
	imul	eax, 56					; 00000038H
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	edx, DWORD PTR [ecx+29648]
	cmp	DWORD PTR [edx+eax+32], 0
	je	SHORT $L72032
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	ecx, DWORD PTR [eax+29656]
	imul	ecx, 56					; 00000038H
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	eax, DWORD PTR [edx+29648]
	mov	ecx, DWORD PTR [eax+ecx+32]
	mov	DWORD PTR -4648+[ebp], ecx
	jmp	SHORT $L72033
$L72032:
	mov	DWORD PTR -4648+[ebp], OFFSET FLAT:$SG71532
$L72033:
	mov	edx, DWORD PTR -4648+[ebp]
	mov	DWORD PTR -4652+[ebp], edx
	jmp	SHORT $L72035
$L72034:
	mov	DWORD PTR -4652+[ebp], OFFSET FLAT:$SG71533
$L72035:
	mov	eax, DWORD PTR -4652+[ebp]
	mov	DWORD PTR _btn$[ebp], eax

; 943  : 
; 944  : 	/* Read calendar parameters */
; 945  : 	CTRL_ATTR_TAB(cl->filter, FILTER);

	mov	ecx, DWORD PTR _cl$[ebp]
	push	ecx
	call	_dyntab_free
	add	esp, 4
	push	0
	push	-1
	push	OFFSET FLAT:$SG71536
	mov	edx, DWORD PTR _ctrl$[ebp]
	add	edx, 44					; 0000002cH
	push	edx
	push	0
	mov	eax, DWORD PTR _cl$[ebp]
	push	eax
	call	_dyntab_filter_field
	add	esp, 24					; 00000018H
	test	eax, eax
	je	SHORT $L71535
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29872], OFFSET FLAT:$SG71538
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 945		; 000003b1H
	jmp	$eva_err$71539
$L71535:
	mov	eax, DWORD PTR _cl$[ebp]
	push	eax
	call	_dyntab_order_lines
	add	esp, 4
	test	eax, eax
	je	SHORT $L71540
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29872], OFFSET FLAT:$SG71542
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 945		; 000003b1H
	jmp	$eva_err$71539
$L71540:

; 946  : 	CTRL_ATTR_TAB(cl->datefield, DATE_FIELD);

	mov	eax, DWORD PTR _cl$[ebp]
	add	eax, 20					; 00000014H
	push	eax
	call	_dyntab_free
	add	esp, 4
	push	0
	push	-1
	push	OFFSET FLAT:$SG71545
	mov	ecx, DWORD PTR _ctrl$[ebp]
	add	ecx, 44					; 0000002cH
	push	ecx
	push	0
	mov	edx, DWORD PTR _cl$[ebp]
	add	edx, 20					; 00000014H
	push	edx
	call	_dyntab_filter_field
	add	esp, 24					; 00000018H
	test	eax, eax
	je	SHORT $L71544
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29872], OFFSET FLAT:$SG71547
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 946		; 000003b2H
	jmp	$eva_err$71539
$L71544:
	mov	edx, DWORD PTR _cl$[ebp]
	add	edx, 20					; 00000014H
	push	edx
	call	_dyntab_order_lines
	add	esp, 4
	test	eax, eax
	je	SHORT $L71548
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29872], OFFSET FLAT:$SG71550
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 946		; 000003b2H
	jmp	$eva_err$71539
$L71548:

; 947  : 	for(i = 0; i < cl->datefield.nbrows; i++)

	mov	DWORD PTR _i$[ebp], 0
	jmp	SHORT $L71551
$L71552:
	mov	edx, DWORD PTR _i$[ebp]
	add	edx, 1
	mov	DWORD PTR _i$[ebp], edx
$L71551:
	mov	eax, DWORD PTR _cl$[ebp]
	mov	ecx, DWORD PTR _i$[ebp]
	cmp	ecx, DWORD PTR [eax+20]
	jae	SHORT $L71553

; 949  : 		DynTableCell *v = dyntab_cell(&cl->datefield, i, 0);

	push	0
	mov	edx, DWORD PTR _i$[ebp]
	push	edx
	mov	eax, DWORD PTR _cl$[ebp]
	add	eax, 20					; 00000014H
	push	eax
	call	_dyntab_cell
	add	esp, 12					; 0000000cH
	mov	DWORD PTR _v$71554[ebp], eax

; 950  : 		char *modif = strrchr(v->txt, '.');

	push	46					; 0000002eH
	mov	ecx, DWORD PTR _v$71554[ebp]
	mov	edx, DWORD PTR [ecx]
	push	edx
	call	_strrchr
	add	esp, 8
	mov	DWORD PTR _modif$71555[ebp], eax

; 951  : 		if(!modif) continue;

	cmp	DWORD PTR _modif$71555[ebp], 0
	jne	SHORT $L71556
	jmp	SHORT $L71552
$L71556:

; 952  : 		*modif = 0;

	mov	eax, DWORD PTR _modif$71555[ebp]
	mov	BYTE PTR [eax], 0

; 953  : 		v->len = modif - v->txt;

	mov	ecx, DWORD PTR _v$71554[ebp]
	mov	edx, DWORD PTR _modif$71555[ebp]
	sub	edx, DWORD PTR [ecx]
	mov	eax, DWORD PTR _v$71554[ebp]
	mov	DWORD PTR [eax+4], edx

; 954  : 		v->col = qry_parse_field_modifier(modif + 1);

	mov	ecx, DWORD PTR _modif$71555[ebp]
	add	ecx, 1
	push	ecx
	call	_qry_parse_field_modifier
	add	esp, 4
	mov	edx, DWORD PTR _v$71554[ebp]
	mov	DWORD PTR [edx+56], eax

; 955  : 	}

	jmp	$L71552
$L71553:

; 956  : 	CTRL_ATTR_TAB(cl->titlefield, TITLE_FIELD);

	mov	eax, DWORD PTR _cl$[ebp]
	add	eax, 44					; 0000002cH
	push	eax
	call	_dyntab_free
	add	esp, 4
	push	0
	push	-1
	push	OFFSET FLAT:$SG71559
	mov	ecx, DWORD PTR _ctrl$[ebp]
	add	ecx, 44					; 0000002cH
	push	ecx
	push	0
	mov	edx, DWORD PTR _cl$[ebp]
	add	edx, 44					; 0000002cH
	push	edx
	call	_dyntab_filter_field
	add	esp, 24					; 00000018H
	test	eax, eax
	je	SHORT $L71558
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29872], OFFSET FLAT:$SG71561
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 956		; 000003bcH
	jmp	$eva_err$71539
$L71558:
	mov	edx, DWORD PTR _cl$[ebp]
	add	edx, 44					; 0000002cH
	push	edx
	call	_dyntab_order_lines
	add	esp, 4
	test	eax, eax
	je	SHORT $L71562
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29872], OFFSET FLAT:$SG71564
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 956		; 000003bcH
	jmp	$eva_err$71539
$L71562:

; 957  : 	CTRL_ATTR_TAB(cl->detailfield, DETAIL_FIELD);

	mov	edx, DWORD PTR _cl$[ebp]
	add	edx, 64					; 00000040H
	push	edx
	call	_dyntab_free
	add	esp, 4
	push	0
	push	-1
	push	OFFSET FLAT:$SG71567
	mov	eax, DWORD PTR _ctrl$[ebp]
	add	eax, 44					; 0000002cH
	push	eax
	push	0
	mov	ecx, DWORD PTR _cl$[ebp]
	add	ecx, 64					; 00000040H
	push	ecx
	call	_dyntab_filter_field
	add	esp, 24					; 00000018H
	test	eax, eax
	je	SHORT $L71566
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29872], OFFSET FLAT:$SG71569
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 957		; 000003bdH
	jmp	$eva_err$71539
$L71566:
	mov	ecx, DWORD PTR _cl$[ebp]
	add	ecx, 64					; 00000040H
	push	ecx
	call	_dyntab_order_lines
	add	esp, 4
	test	eax, eax
	je	SHORT $L71570
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29872], OFFSET FLAT:$SG71572
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 957		; 000003bdH
	jmp	$eva_err$71539
$L71570:

; 958  : 	if(qry_eval_var_expr_table(cntxt, &cl->titlefield, &ctrl->attr) ||
; 959  : 		qry_eval_var_expr_table(cntxt, &cl->detailfield, &ctrl->attr)) STACK_ERROR;

	mov	ecx, DWORD PTR _ctrl$[ebp]
	add	ecx, 44					; 0000002cH
	push	ecx
	mov	edx, DWORD PTR _cl$[ebp]
	add	edx, 44					; 0000002cH
	push	edx
	mov	eax, DWORD PTR _cntxt$[ebp]
	push	eax
	call	_qry_eval_var_expr_table
	add	esp, 12					; 0000000cH
	test	eax, eax
	jne	SHORT $L71574
	mov	ecx, DWORD PTR _ctrl$[ebp]
	add	ecx, 44					; 0000002cH
	push	ecx
	mov	edx, DWORD PTR _cl$[ebp]
	add	edx, 64					; 00000040H
	push	edx
	mov	eax, DWORD PTR _cntxt$[ebp]
	push	eax
	call	_qry_eval_var_expr_table
	add	esp, 12					; 0000000cH
	test	eax, eax
	je	SHORT $L71573
$L71574:
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 959		; 000003bfH
	jmp	$eva_err$71539
$L71573:

; 960  : 	CTRL_ATTR_TAB(cl->eventbgcolor, EVENT_BGCOLOR);

	mov	edx, DWORD PTR _cl$[ebp]
	add	edx, 84					; 00000054H
	push	edx
	call	_dyntab_free
	add	esp, 4
	push	0
	push	-1
	push	OFFSET FLAT:$SG71577
	mov	eax, DWORD PTR _ctrl$[ebp]
	add	eax, 44					; 0000002cH
	push	eax
	push	0
	mov	ecx, DWORD PTR _cl$[ebp]
	add	ecx, 84					; 00000054H
	push	ecx
	call	_dyntab_filter_field
	add	esp, 24					; 00000018H
	test	eax, eax
	je	SHORT $L71576
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29872], OFFSET FLAT:$SG71579
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 960		; 000003c0H
	jmp	$eva_err$71539
$L71576:
	mov	ecx, DWORD PTR _cl$[ebp]
	add	ecx, 84					; 00000054H
	push	ecx
	call	_dyntab_order_lines
	add	esp, 4
	test	eax, eax
	je	SHORT $L71580
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29872], OFFSET FLAT:$SG71582
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 960		; 000003c0H
	jmp	$eva_err$71539
$L71580:

; 961  : 	CTRL_ATTR_TAB(cl->openform, OPEN_FORM);

	mov	ecx, DWORD PTR _cl$[ebp]
	add	ecx, 104				; 00000068H
	push	ecx
	call	_dyntab_free
	add	esp, 4
	push	0
	push	-1
	push	OFFSET FLAT:$SG71585
	mov	edx, DWORD PTR _ctrl$[ebp]
	add	edx, 44					; 0000002cH
	push	edx
	push	0
	mov	eax, DWORD PTR _cl$[ebp]
	add	eax, 104				; 00000068H
	push	eax
	call	_dyntab_filter_field
	add	esp, 24					; 00000018H
	test	eax, eax
	je	SHORT $L71584
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29872], OFFSET FLAT:$SG71587
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 961		; 000003c1H
	jmp	$eva_err$71539
$L71584:
	mov	eax, DWORD PTR _cl$[ebp]
	add	eax, 104				; 00000068H
	push	eax
	call	_dyntab_order_lines
	add	esp, 4
	test	eax, eax
	je	SHORT $L71588
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29872], OFFSET FLAT:$SG71590
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 961		; 000003c1H
	jmp	$eva_err$71539
$L71588:

; 962  : 	CTRL_ATTR_TAB(cl->hidden, HIDDEN);

	mov	eax, DWORD PTR _cl$[ebp]
	add	eax, 124				; 0000007cH
	push	eax
	call	_dyntab_free
	add	esp, 4
	push	0
	push	-1
	push	OFFSET FLAT:$SG71593
	mov	ecx, DWORD PTR _ctrl$[ebp]
	add	ecx, 44					; 0000002cH
	push	ecx
	push	0
	mov	edx, DWORD PTR _cl$[ebp]
	add	edx, 124				; 0000007cH
	push	edx
	call	_dyntab_filter_field
	add	esp, 24					; 00000018H
	test	eax, eax
	je	SHORT $L71592
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29872], OFFSET FLAT:$SG71595
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 962		; 000003c2H
	jmp	$eva_err$71539
$L71592:
	mov	edx, DWORD PTR _cl$[ebp]
	add	edx, 124				; 0000007cH
	push	edx
	call	_dyntab_order_lines
	add	esp, 4
	test	eax, eax
	je	SHORT $L71596
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29872], OFFSET FLAT:$SG71598
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 962		; 000003c2H
	jmp	$eva_err$71539
$L71596:

; 963  : 
; 964  : 	/* Read selected filters */
; 965  : 	CTRL_GET_CGI_SUBFIELD("EVENTS");

	push	0
	push	0
	push	0
	push	OFFSET FLAT:$SG71600
	mov	edx, DWORD PTR _ctrl$[ebp]
	push	edx
	lea	eax, DWORD PTR _cgival$[ebp]
	push	eax
	mov	ecx, DWORD PTR _cntxt$[ebp]
	push	ecx
	call	_cgi_get_subfield
	add	esp, 28					; 0000001cH
	test	eax, eax
	je	SHORT $L71599
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 965		; 000003c5H
	jmp	$eva_err$71539
$L71599:

; 967  : 		DynTableCell *status = dyntab_cell(&cgival, 0, 0);

	push	0
	push	0
	lea	eax, DWORD PTR _cgival$[ebp]
	push	eax
	call	_dyntab_cell
	add	esp, 12					; 0000000cH
	mov	DWORD PTR _status$71601[ebp], eax

; 968  : 		int b_sel = !strncmp(btn, add_sz_str("SELEVENT")) ? 1 : !strncmp(btn, add_sz_str("XOREVENT")) ? 2 : 0;

	push	8
	push	OFFSET FLAT:$SG71603
	mov	ecx, DWORD PTR _btn$[ebp]
	push	ecx
	call	_strncmp
	add	esp, 12					; 0000000cH
	test	eax, eax
	jne	SHORT $L72036
	mov	DWORD PTR -4656+[ebp], 1
	jmp	SHORT $L72037
$L72036:
	push	8
	push	OFFSET FLAT:$SG71604
	mov	edx, DWORD PTR _btn$[ebp]
	push	edx
	call	_strncmp
	add	esp, 12					; 0000000cH
	neg	eax
	sbb	eax, eax
	and	al, -2					; fffffffeH
	add	eax, 2
	mov	DWORD PTR -4656+[ebp], eax
$L72037:
	mov	eax, DWORD PTR -4656+[ebp]
	mov	DWORD PTR _b_sel$71602[ebp], eax

; 969  : 		unsigned long i_sel = b_sel ? strtoul(btn + 8, NULL, 10) : 0;

	cmp	DWORD PTR _b_sel$71602[ebp], 0
	je	SHORT $L72038
	push	10					; 0000000aH
	push	0
	mov	ecx, DWORD PTR _btn$[ebp]
	add	ecx, 8
	push	ecx
	call	_strtoul
	add	esp, 12					; 0000000cH
	mov	DWORD PTR -4660+[ebp], eax
	jmp	SHORT $L72039
$L72038:
	mov	DWORD PTR -4660+[ebp], 0
$L72039:
	mov	edx, DWORD PTR -4660+[ebp]
	mov	DWORD PTR _i_sel$71605[ebp], edx

; 970  : 		char *cnt = status && status->txt ? status->txt : "";

	cmp	DWORD PTR _status$71601[ebp], 0
	je	SHORT $L72040
	mov	eax, DWORD PTR _status$71601[ebp]
	cmp	DWORD PTR [eax], 0
	je	SHORT $L72040
	mov	ecx, DWORD PTR _status$71601[ebp]
	mov	edx, DWORD PTR [ecx]
	mov	DWORD PTR -4664+[ebp], edx
	jmp	SHORT $L72041
$L72040:
	mov	DWORD PTR -4664+[ebp], OFFSET FLAT:$SG71608
$L72041:
	mov	eax, DWORD PTR -4664+[ebp]
	mov	DWORD PTR _cnt$71607[ebp], eax

; 971  : 		unsigned long nb = 0;

	mov	DWORD PTR _nb$71609[ebp], 0
$L71611:

; 972  : 		while(*cnt) { if(*cnt == '1') nb++; cnt++; }

	mov	ecx, DWORD PTR _cnt$71607[ebp]
	movsx	edx, BYTE PTR [ecx]
	test	edx, edx
	je	SHORT $L71612
	mov	eax, DWORD PTR _cnt$71607[ebp]
	movsx	ecx, BYTE PTR [eax]
	cmp	ecx, 49					; 00000031H
	jne	SHORT $L71613
	mov	edx, DWORD PTR _nb$71609[ebp]
	add	edx, 1
	mov	DWORD PTR _nb$71609[ebp], edx
$L71613:
	mov	eax, DWORD PTR _cnt$71607[ebp]
	add	eax, 1
	mov	DWORD PTR _cnt$71607[ebp], eax
	jmp	SHORT $L71611
$L71612:

; 973  : 		if(b_sel && nb == 1 && status->txt[i_sel] == '1') b_sel = 3;

	cmp	DWORD PTR _b_sel$71602[ebp], 0
	je	SHORT $L71614
	cmp	DWORD PTR _nb$71609[ebp], 1
	jne	SHORT $L71614
	mov	ecx, DWORD PTR _status$71601[ebp]
	mov	edx, DWORD PTR [ecx]
	mov	eax, DWORD PTR _i_sel$71605[ebp]
	movsx	ecx, BYTE PTR [edx+eax]
	cmp	ecx, 49					; 00000031H
	jne	SHORT $L71614
	mov	DWORD PTR _b_sel$71602[ebp], 3
$L71614:

; 974  : 		for(i = 0; i < cl->filter.nbrows; i++)

	mov	DWORD PTR _i$[ebp], 0
	jmp	SHORT $L71615
$L71616:
	mov	edx, DWORD PTR _i$[ebp]
	add	edx, 1
	mov	DWORD PTR _i$[ebp], edx
$L71615:
	mov	eax, DWORD PTR _cl$[ebp]
	mov	ecx, DWORD PTR _i$[ebp]
	cmp	ecx, DWORD PTR [eax]
	jae	$L71617

; 976  : 			DynTableCell *c = dyntab_cell(&cl->filter, i, 0);

	push	0
	mov	edx, DWORD PTR _i$[ebp]
	push	edx
	mov	eax, DWORD PTR _cl$[ebp]
	push	eax
	call	_dyntab_cell
	add	esp, 12					; 0000000cH
	mov	DWORD PTR _c$71618[ebp], eax

; 977  : 			c->col = !status ? !dyntab_sz(&cl->hidden, i, 0) : (status->txt && status->len > i && status->txt[i] == '0') ? 0 : 1;

	cmp	DWORD PTR _status$71601[ebp], 0
	jne	SHORT $L72044
	push	0
	mov	ecx, DWORD PTR _i$[ebp]
	push	ecx
	mov	edx, DWORD PTR _cl$[ebp]
	add	edx, 124				; 0000007cH
	push	edx
	call	_dyntab_sz
	add	esp, 12					; 0000000cH
	neg	eax
	sbb	eax, eax
	inc	eax
	mov	DWORD PTR -4668+[ebp], eax
	jmp	SHORT $L72045
$L72044:
	mov	eax, DWORD PTR _status$71601[ebp]
	cmp	DWORD PTR [eax], 0
	je	SHORT $L72042
	mov	ecx, DWORD PTR _status$71601[ebp]
	mov	edx, DWORD PTR [ecx+4]
	cmp	edx, DWORD PTR _i$[ebp]
	jbe	SHORT $L72042
	mov	eax, DWORD PTR _status$71601[ebp]
	mov	ecx, DWORD PTR [eax]
	mov	edx, DWORD PTR _i$[ebp]
	movsx	eax, BYTE PTR [ecx+edx]
	cmp	eax, 48					; 00000030H
	jne	SHORT $L72042
	mov	DWORD PTR -4672+[ebp], 0
	jmp	SHORT $L72043
$L72042:
	mov	DWORD PTR -4672+[ebp], 1
$L72043:
	mov	ecx, DWORD PTR -4672+[ebp]
	mov	DWORD PTR -4668+[ebp], ecx
$L72045:
	mov	edx, DWORD PTR _c$71618[ebp]
	mov	eax, DWORD PTR -4668+[ebp]
	mov	DWORD PTR [edx+56], eax

; 978  : 			if(b_sel) switch(b_sel)

	cmp	DWORD PTR _b_sel$71602[ebp], 0
	je	SHORT $L71621

; 979  : 			{

	mov	ecx, DWORD PTR _b_sel$71602[ebp]
	mov	DWORD PTR -4676+[ebp], ecx
	cmp	DWORD PTR -4676+[ebp], 1
	je	SHORT $L71624
	cmp	DWORD PTR -4676+[ebp], 2
	je	SHORT $L71625
	jmp	SHORT $L71627
$L71624:

; 980  : 			case 1:	c->col = i == i_sel; break;

	mov	edx, DWORD PTR _i$[ebp]
	xor	eax, eax
	cmp	edx, DWORD PTR _i_sel$71605[ebp]
	sete	al
	mov	ecx, DWORD PTR _c$71618[ebp]
	mov	DWORD PTR [ecx+56], eax
	jmp	SHORT $L71621
$L71625:

; 981  : 			case 2:	if(i == i_sel) c->col = !c->col; break;

	mov	edx, DWORD PTR _i$[ebp]
	cmp	edx, DWORD PTR _i_sel$71605[ebp]
	jne	SHORT $L71626
	mov	eax, DWORD PTR _c$71618[ebp]
	xor	ecx, ecx
	cmp	DWORD PTR [eax+56], 0
	sete	cl
	mov	edx, DWORD PTR _c$71618[ebp]
	mov	DWORD PTR [edx+56], ecx
$L71626:
	jmp	SHORT $L71621
$L71627:

; 982  : 			default: c->col = 1;

	mov	eax, DWORD PTR _c$71618[ebp]
	mov	DWORD PTR [eax+56], 1
$L71621:

; 984  : 			if(c->col) cl->nbevntstyp++;

	mov	ecx, DWORD PTR _c$71618[ebp]
	cmp	DWORD PTR [ecx+56], 0
	je	SHORT $L71628
	mov	edx, DWORD PTR _cl$[ebp]
	mov	eax, DWORD PTR [edx+296]
	add	eax, 1
	mov	ecx, DWORD PTR _cl$[ebp]
	mov	DWORD PTR [ecx+296], eax
$L71628:

; 985  : 		}

	jmp	$L71616
$L71617:

; 987  : 
; 988  : 	/* Set beginning & end dates depending on format */
; 989  : 	if(strlen(cl->datebeg) < 6) strcpy(cl->datebeg + 4, "01");

	mov	edx, DWORD PTR _cl$[ebp]
	add	edx, 196				; 000000c4H
	push	edx
	call	_strlen
	add	esp, 4
	cmp	eax, 6
	jae	SHORT $L71629
	push	OFFSET FLAT:$SG71630
	mov	eax, DWORD PTR _cl$[ebp]
	add	eax, 200				; 000000c8H
	push	eax
	call	_strcpy
	add	esp, 8
$L71629:

; 990  : 	if(strlen(cl->datebeg) < 8) strcpy(cl->datebeg + 6, "01");

	mov	ecx, DWORD PTR _cl$[ebp]
	add	ecx, 196				; 000000c4H
	push	ecx
	call	_strlen
	add	esp, 4
	cmp	eax, 8
	jae	SHORT $L71631
	push	OFFSET FLAT:$SG71632
	mov	edx, DWORD PTR _cl$[ebp]
	add	edx, 202				; 000000caH
	push	edx
	call	_strcpy
	add	esp, 8
$L71631:

; 991  : 	if(!strcmp(cl->unit, "_EVA_DAY"))

	push	OFFSET FLAT:$SG71634
	mov	eax, DWORD PTR _cl$[ebp]
	mov	ecx, DWORD PTR [eax+256]
	push	ecx
	call	_strcmp
	add	esp, 8
	test	eax, eax
	jne	$L71633

; 993  : 		cl->datebeg[8] = 0;

	mov	edx, DWORD PTR _cl$[ebp]
	mov	BYTE PTR [edx+204], 0

; 994  : 		delay_to_datetxt(cl->dateend, cl->datebeg, 1, 'D');

	push	68					; 00000044H
	push	1
	mov	eax, DWORD PTR _cl$[ebp]
	add	eax, 196				; 000000c4H
	push	eax
	mov	ecx, DWORD PTR _cl$[ebp]
	add	ecx, 212				; 000000d4H
	push	ecx
	call	_delay_to_datetxt
	add	esp, 16					; 00000010H

; 995  : 		cl->dateend[8] = 0;

	mov	edx, DWORD PTR _cl$[ebp]
	mov	BYTE PTR [edx+220], 0

; 996  : 		if(!strcmp(cl->datebeg + 6, "01")) cl->datebeg[6] = 0;

	push	OFFSET FLAT:$SG71636
	mov	eax, DWORD PTR _cl$[ebp]
	add	eax, 202				; 000000caH
	push	eax
	call	_strcmp
	add	esp, 8
	test	eax, eax
	jne	SHORT $L71635
	mov	ecx, DWORD PTR _cl$[ebp]
	mov	BYTE PTR [ecx+202], 0
$L71635:

; 997  : 		if(!strcmp(cl->datebeg + 4, "01")) cl->datebeg[4] = 0;

	push	OFFSET FLAT:$SG71638
	mov	edx, DWORD PTR _cl$[ebp]
	add	edx, 200				; 000000c8H
	push	edx
	call	_strcmp
	add	esp, 8
	test	eax, eax
	jne	SHORT $L71637
	mov	eax, DWORD PTR _cl$[ebp]
	mov	BYTE PTR [eax+200], 0
$L71637:

; 999  : 	else if(!strcmp(cl->unit, "_EVA_WEEK"))

	jmp	$L71656
$L71633:
	push	OFFSET FLAT:$SG71641
	mov	ecx, DWORD PTR _cl$[ebp]
	mov	edx, DWORD PTR [ecx+256]
	push	edx
	call	_strcmp
	add	esp, 8
	test	eax, eax
	jne	$L71640

; 1001 : 		cl->datebeg[8] = 0;

	mov	eax, DWORD PTR _cl$[ebp]
	mov	BYTE PTR [eax+204], 0

; 1002 : 		datetxt_to_time(cl->datebeg, &t, &dt);

	lea	ecx, DWORD PTR _dt$[ebp]
	push	ecx
	lea	edx, DWORD PTR _t$[ebp]
	push	edx
	mov	eax, DWORD PTR _cl$[ebp]
	add	eax, 196				; 000000c4H
	push	eax
	call	_datetxt_to_time
	add	esp, 12					; 0000000cH

; 1003 : 		if(dt.tm_wday != 1)

	cmp	DWORD PTR _dt$[ebp+24], 1
	je	$L71642

; 1005 : 			delay_to_datetxt(cl->dateend, cl->datebeg, dt.tm_wday ? 1 - dt.tm_wday : -6, 'D');

	cmp	DWORD PTR _dt$[ebp+24], 0
	je	SHORT $L72046
	mov	ecx, 1
	sub	ecx, DWORD PTR _dt$[ebp+24]
	mov	DWORD PTR -4680+[ebp], ecx
	jmp	SHORT $L72047
$L72046:
	mov	DWORD PTR -4680+[ebp], -6		; fffffffaH
$L72047:
	push	68					; 00000044H
	mov	edx, DWORD PTR -4680+[ebp]
	push	edx
	mov	eax, DWORD PTR _cl$[ebp]
	add	eax, 196				; 000000c4H
	push	eax
	mov	ecx, DWORD PTR _cl$[ebp]
	add	ecx, 212				; 000000d4H
	push	ecx
	call	_delay_to_datetxt
	add	esp, 16					; 00000010H

; 1006 : 			strcpy(cl->datebeg, cl->dateend);

	mov	edx, DWORD PTR _cl$[ebp]
	add	edx, 212				; 000000d4H
	push	edx
	mov	eax, DWORD PTR _cl$[ebp]
	add	eax, 196				; 000000c4H
	push	eax
	call	_strcpy
	add	esp, 8

; 1007 : 			cl->datebeg[8] = 0;

	mov	ecx, DWORD PTR _cl$[ebp]
	mov	BYTE PTR [ecx+204], 0

; 1008 : 			strcpy(cl->date0, cl->datebeg);

	mov	edx, DWORD PTR _cl$[ebp]
	add	edx, 196				; 000000c4H
	push	edx
	mov	eax, DWORD PTR _cl$[ebp]
	add	eax, 180				; 000000b4H
	push	eax
	call	_strcpy
	add	esp, 8
$L71642:

; 1010 : 		delay_to_datetxt(cl->dateend, cl->datebeg, 7, 'D');

	push	68					; 00000044H
	push	7
	mov	ecx, DWORD PTR _cl$[ebp]
	add	ecx, 196				; 000000c4H
	push	ecx
	mov	edx, DWORD PTR _cl$[ebp]
	add	edx, 212				; 000000d4H
	push	edx
	call	_delay_to_datetxt
	add	esp, 16					; 00000010H

; 1011 : 		cl->dateend[8] = 0;

	mov	eax, DWORD PTR _cl$[ebp]
	mov	BYTE PTR [eax+220], 0

; 1012 : 		if(!strcmp(cl->datebeg + 6, "01")) cl->datebeg[6] = 0;

	push	OFFSET FLAT:$SG71644
	mov	ecx, DWORD PTR _cl$[ebp]
	add	ecx, 202				; 000000caH
	push	ecx
	call	_strcmp
	add	esp, 8
	test	eax, eax
	jne	SHORT $L71643
	mov	edx, DWORD PTR _cl$[ebp]
	mov	BYTE PTR [edx+202], 0
$L71643:

; 1013 : 		if(!strcmp(cl->datebeg + 4, "01")) cl->datebeg[4] = 0;

	push	OFFSET FLAT:$SG71646
	mov	eax, DWORD PTR _cl$[ebp]
	add	eax, 200				; 000000c8H
	push	eax
	call	_strcmp
	add	esp, 8
	test	eax, eax
	jne	SHORT $L71645
	mov	ecx, DWORD PTR _cl$[ebp]
	mov	BYTE PTR [ecx+200], 0
$L71645:

; 1015 : 	else if(!strcmp(cl->unit, "_EVA_MONTH"))

	jmp	$L71656
$L71640:
	push	OFFSET FLAT:$SG71649
	mov	edx, DWORD PTR _cl$[ebp]
	mov	eax, DWORD PTR [edx+256]
	push	eax
	call	_strcmp
	add	esp, 8
	test	eax, eax
	jne	$L71648

; 1017 : 		char tmp[16];
; 1018 : 		cl->datebeg[8] = 0;

	mov	ecx, DWORD PTR _cl$[ebp]
	mov	BYTE PTR [ecx+204], 0

; 1019 : 		sprintf(cl->datebeg + 6, "01");

	push	OFFSET FLAT:$SG71651
	mov	edx, DWORD PTR _cl$[ebp]
	add	edx, 202				; 000000caH
	push	edx
	call	_sprintf
	add	esp, 8

; 1020 : 		datetxt_to_time(cl->datebeg, &t, &dt);

	lea	eax, DWORD PTR _dt$[ebp]
	push	eax
	lea	ecx, DWORD PTR _t$[ebp]
	push	ecx
	mov	edx, DWORD PTR _cl$[ebp]
	add	edx, 196				; 000000c4H
	push	edx
	call	_datetxt_to_time
	add	esp, 12					; 0000000cH

; 1021 : 		delay_to_datetxt(cl->dateend, cl->datebeg, 1, 'M');

	push	77					; 0000004dH
	push	1
	mov	eax, DWORD PTR _cl$[ebp]
	add	eax, 196				; 000000c4H
	push	eax
	mov	ecx, DWORD PTR _cl$[ebp]
	add	ecx, 212				; 000000d4H
	push	ecx
	call	_delay_to_datetxt
	add	esp, 16					; 00000010H

; 1022 : 
; 1023 : 		/* Start on monday */
; 1024 : 		if(dt.tm_wday != 1)

	cmp	DWORD PTR _dt$[ebp+24], 1
	je	$L71652

; 1026 : 			strcpy(cl->date0, cl->datebeg);

	mov	edx, DWORD PTR _cl$[ebp]
	add	edx, 196				; 000000c4H
	push	edx
	mov	eax, DWORD PTR _cl$[ebp]
	add	eax, 180				; 000000b4H
	push	eax
	call	_strcpy
	add	esp, 8

; 1027 : 			delay_to_datetxt(tmp, cl->datebeg, dt.tm_wday ? 1 - dt.tm_wday : -6, 'D');

	cmp	DWORD PTR _dt$[ebp+24], 0
	je	SHORT $L72048
	mov	ecx, 1
	sub	ecx, DWORD PTR _dt$[ebp+24]
	mov	DWORD PTR -4684+[ebp], ecx
	jmp	SHORT $L72049
$L72048:
	mov	DWORD PTR -4684+[ebp], -6		; fffffffaH
$L72049:
	push	68					; 00000044H
	mov	edx, DWORD PTR -4684+[ebp]
	push	edx
	mov	eax, DWORD PTR _cl$[ebp]
	add	eax, 196				; 000000c4H
	push	eax
	lea	ecx, DWORD PTR _tmp$71650[ebp]
	push	ecx
	call	_delay_to_datetxt
	add	esp, 16					; 00000010H

; 1028 : 			strcpy(cl->datebeg, tmp);

	lea	edx, DWORD PTR _tmp$71650[ebp]
	push	edx
	mov	eax, DWORD PTR _cl$[ebp]
	add	eax, 196				; 000000c4H
	push	eax
	call	_strcpy
	add	esp, 8

; 1029 : 			cl->datebeg[8] = 0;

	mov	ecx, DWORD PTR _cl$[ebp]
	mov	BYTE PTR [ecx+204], 0

; 1031 : 		else

	jmp	SHORT $L71653
$L71652:

; 1032 : 			cl->datebeg[6] = 0;

	mov	edx, DWORD PTR _cl$[ebp]
	mov	BYTE PTR [edx+202], 0
$L71653:

; 1033 : 
; 1034 : 		/* End on sunday */
; 1035 : 		datetxt_to_time(cl->dateend, &t, &dt);

	lea	eax, DWORD PTR _dt$[ebp]
	push	eax
	lea	ecx, DWORD PTR _t$[ebp]
	push	ecx
	mov	edx, DWORD PTR _cl$[ebp]
	add	edx, 212				; 000000d4H
	push	edx
	call	_datetxt_to_time
	add	esp, 12					; 0000000cH

; 1036 : 		if(dt.tm_wday != 1)

	cmp	DWORD PTR _dt$[ebp+24], 1
	je	SHORT $L71654

; 1038 : 			delay_to_datetxt(tmp, cl->dateend, dt.tm_wday ? 7 - dt.tm_wday : 1, 'D');

	cmp	DWORD PTR _dt$[ebp+24], 0
	je	SHORT $L72050
	mov	eax, 7
	sub	eax, DWORD PTR _dt$[ebp+24]
	mov	DWORD PTR -4688+[ebp], eax
	jmp	SHORT $L72051
$L72050:
	mov	DWORD PTR -4688+[ebp], 1
$L72051:
	push	68					; 00000044H
	mov	ecx, DWORD PTR -4688+[ebp]
	push	ecx
	mov	edx, DWORD PTR _cl$[ebp]
	add	edx, 212				; 000000d4H
	push	edx
	lea	eax, DWORD PTR _tmp$71650[ebp]
	push	eax
	call	_delay_to_datetxt
	add	esp, 16					; 00000010H

; 1039 : 			strcpy(cl->dateend, tmp);

	lea	ecx, DWORD PTR _tmp$71650[ebp]
	push	ecx
	mov	edx, DWORD PTR _cl$[ebp]
	add	edx, 212				; 000000d4H
	push	edx
	call	_strcpy
	add	esp, 8

; 1040 : 			cl->dateend[8] = 0;

	mov	eax, DWORD PTR _cl$[ebp]
	mov	BYTE PTR [eax+220], 0

; 1042 : 		else

	jmp	SHORT $L71655
$L71654:

; 1043 : 			cl->dateend[6] = 0;

	mov	ecx, DWORD PTR _cl$[ebp]
	mov	BYTE PTR [ecx+218], 0
$L71655:

; 1045 : 	else

	jmp	$L71656
$L71648:

; 1047 : 		int year, month, m_start = atoi(CTRL_ATTR_VAL(START_MONTH));

	cmp	DWORD PTR _ctrl$[ebp], 0
	je	SHORT $L72052
	push	0
	push	-1
	push	OFFSET FLAT:$SG71660
	mov	edx, DWORD PTR _ctrl$[ebp]
	add	edx, 44					; 0000002cH
	push	edx
	call	_dyntab_field_val
	add	esp, 16					; 00000010H
	mov	DWORD PTR -4692+[ebp], eax
	jmp	SHORT $L72053
$L72052:
	mov	DWORD PTR -4692+[ebp], OFFSET FLAT:$SG71661
$L72053:
	mov	eax, DWORD PTR -4692+[ebp]
	push	eax
	call	_atoi
	add	esp, 4
	mov	DWORD PTR _m_start$71659[ebp], eax

; 1048 : 		if(sscanf(cl->datebeg, "%4u%2u", &year, &month) < 2) month = 1;

	lea	ecx, DWORD PTR _month$71658[ebp]
	push	ecx
	lea	edx, DWORD PTR _year$71657[ebp]
	push	edx
	push	OFFSET FLAT:$SG71663
	mov	eax, DWORD PTR _cl$[ebp]
	add	eax, 196				; 000000c4H
	push	eax
	call	_sscanf
	add	esp, 16					; 00000010H
	cmp	eax, 2
	jge	SHORT $L71662
	mov	DWORD PTR _month$71658[ebp], 1
$L71662:

; 1049 : 		sprintf(cl->date0, "%04i%02i", year - (m_start > month ? 1 : 0), m_start ? m_start : 1);

	cmp	DWORD PTR _m_start$71659[ebp], 0
	je	SHORT $L72054
	mov	ecx, DWORD PTR _m_start$71659[ebp]
	mov	DWORD PTR -4696+[ebp], ecx
	jmp	SHORT $L72055
$L72054:
	mov	DWORD PTR -4696+[ebp], 1
$L72055:
	mov	edx, DWORD PTR -4696+[ebp]
	push	edx
	mov	eax, DWORD PTR _m_start$71659[ebp]
	xor	ecx, ecx
	cmp	eax, DWORD PTR _month$71658[ebp]
	setg	cl
	mov	edx, DWORD PTR _year$71657[ebp]
	sub	edx, ecx
	push	edx
	push	OFFSET FLAT:$SG71664
	mov	eax, DWORD PTR _cl$[ebp]
	add	eax, 180				; 000000b4H
	push	eax
	call	_sprintf
	add	esp, 16					; 00000010H

; 1050 : 		strcpy(cl->datebeg, cl->date0);

	mov	ecx, DWORD PTR _cl$[ebp]
	add	ecx, 180				; 000000b4H
	push	ecx
	mov	edx, DWORD PTR _cl$[ebp]
	add	edx, 196				; 000000c4H
	push	edx
	call	_strcpy
	add	esp, 8

; 1051 : 		delay_to_datetxt(cl->dateend, cl->datebeg, 1, 'Y');

	push	89					; 00000059H
	push	1
	mov	eax, DWORD PTR _cl$[ebp]
	add	eax, 196				; 000000c4H
	push	eax
	mov	ecx, DWORD PTR _cl$[ebp]
	add	ecx, 212				; 000000d4H
	push	ecx
	call	_delay_to_datetxt
	add	esp, 16					; 00000010H

; 1052 : 		cl->date0[m_start > 1 ? 6 : 4] = 0;

	xor	edx, edx
	cmp	DWORD PTR _m_start$71659[ebp], 1
	setle	dl
	dec	edx
	and	edx, 2
	add	edx, 4
	mov	eax, DWORD PTR _cl$[ebp]
	mov	BYTE PTR [eax+edx+180], 0

; 1053 : 		cl->dateend[m_start > 1 ? 6 : 4] = 0;

	xor	ecx, ecx
	cmp	DWORD PTR _m_start$71659[ebp], 1
	setle	cl
	dec	ecx
	and	ecx, 2
	add	ecx, 4
	mov	edx, DWORD PTR _cl$[ebp]
	mov	BYTE PTR [edx+ecx+212], 0
$L71656:

; 1055 : 
; 1056 : 	/* Create list of objects matching filters & date */
; 1057 : 	if(sql_exec_query(cntxt, "DROP TABLE IF EXISTS CalendarObjList")) STACK_ERROR;

	push	OFFSET FLAT:$SG71666
	mov	eax, DWORD PTR _cntxt$[ebp]
	push	eax
	call	_sql_exec_query
	add	esp, 8
	test	eax, eax
	je	SHORT $L71665
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 1057		; 00000421H
	jmp	$eva_err$71539
$L71665:

; 1058 : 	if(sql_exec_query(cntxt, "CREATE TEMPORARY TABLE CalendarObjList (IdObj INT, DateVal CHAR(14), Num INT, Line INT) TYPE=HEAP")) STACK_ERROR;

	push	OFFSET FLAT:$SG71668
	mov	edx, DWORD PTR _cntxt$[ebp]
	push	edx
	call	_sql_exec_query
	add	esp, 8
	test	eax, eax
	je	SHORT $L71667
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 1058		; 00000422H
	jmp	$eva_err$71539
$L71667:

; 1059 : 	for(i = 0; i < cl->filter.nbrows; i++)

	mov	DWORD PTR _i$[ebp], 0
	jmp	SHORT $L71669
$L71670:
	mov	ecx, DWORD PTR _i$[ebp]
	add	ecx, 1
	mov	DWORD PTR _i$[ebp], ecx
$L71669:
	mov	edx, DWORD PTR _cl$[ebp]
	mov	eax, DWORD PTR _i$[ebp]
	cmp	eax, DWORD PTR [edx]
	jae	$L71671

; 1061 : 		/* Read filter definition - continue if not active */
; 1062 : 		QryBuilNode *node;
; 1063 : 		DynTableCell *df = dyntab_cell(&cl->datefield, i, 0);

	push	0
	mov	ecx, DWORD PTR _i$[ebp]
	push	ecx
	mov	edx, DWORD PTR _cl$[ebp]
	add	edx, 20					; 00000014H
	push	edx
	call	_dyntab_cell
	add	esp, 12					; 0000000cH
	mov	DWORD PTR _df$71673[ebp], eax

; 1064 : 		if(qry_obj_field(cntxt, &data, DYNTAB_TOULRC(&cl->filter, i, 0), NULL)) STACK_ERROR;

	push	0
	push	10					; 0000000aH
	push	0
	push	0
	mov	eax, DWORD PTR _i$[ebp]
	push	eax
	mov	ecx, DWORD PTR _cl$[ebp]
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
	call	_qry_obj_field
	add	esp, 16					; 00000010H
	test	eax, eax
	je	SHORT $L71676
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 1064		; 00000428H
	jmp	$eva_err$71539
$L71676:

; 1065 : 		DYNTAB_ADD_CELLP(&cl->filter, i, 1, DYNTAB_FIELD_CELL(&data, LABEL));

	push	1
	push	0
	push	-1
	push	OFFSET FLAT:$SG71678
	lea	edx, DWORD PTR _data$[ebp]
	push	edx
	call	_dyntab_field_cell
	add	esp, 16					; 00000010H
	push	eax
	push	1
	mov	eax, DWORD PTR _i$[ebp]
	push	eax
	mov	ecx, DWORD PTR _cl$[ebp]
	push	ecx
	call	_dyntab_copy
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L71677
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29872], OFFSET FLAT:$SG71680
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 1065		; 00000429H
	jmp	$eva_err$71539
$L71677:

; 1066 : 		if(!dyntab_cell(&cl->filter, i, 0)->col) continue;

	push	0
	mov	ecx, DWORD PTR _i$[ebp]
	push	ecx
	mov	edx, DWORD PTR _cl$[ebp]
	push	edx
	call	_dyntab_cell
	add	esp, 12					; 0000000cH
	cmp	DWORD PTR [eax+56], 0
	jne	SHORT $L71681
	jmp	$L71670
$L71681:

; 1067 : 
; 1068 : 		/* Parse base filter & date condition */
; 1069 : 		qry_build_free(&flt);

	lea	eax, DWORD PTR _flt$[ebp]
	push	eax
	call	_qry_build_free
	add	esp, 4

; 1070 : 		if(qry_parse_filter_nodes(cntxt, &flt, &data)) STACK_ERROR;

	lea	ecx, DWORD PTR _data$[ebp]
	push	ecx
	lea	edx, DWORD PTR _flt$[ebp]
	push	edx
	mov	eax, DWORD PTR _cntxt$[ebp]
	push	eax
	call	_qry_parse_filter_nodes
	add	esp, 12					; 0000000cH
	test	eax, eax
	je	SHORT $L71682
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 1070		; 0000042eH
	jmp	$eva_err$71539
$L71682:

; 1071 : 
; 1072 : 		/* Add date condition */
; 1073 : 		node = flt.node + flt.nbnode++;

	mov	edx, DWORD PTR _flt$[ebp+4424]
	imul	edx, 136				; 00000088H
	lea	eax, DWORD PTR _flt$[ebp+edx+72]
	mov	DWORD PTR _node$71672[ebp], eax
	mov	ecx, DWORD PTR _flt$[ebp+4424]
	add	ecx, 1
	mov	DWORD PTR _flt$[ebp+4424], ecx

; 1074 : 		if(dyntab_from_list(&node->field, df->txt, df->len, ",", 0, 1)) RETURN_ERR_MEMORY;

	push	1
	push	0
	push	OFFSET FLAT:$SG71684
	mov	edx, DWORD PTR _df$71673[ebp]
	mov	eax, DWORD PTR [edx+4]
	push	eax
	mov	ecx, DWORD PTR _df$71673[ebp]
	mov	edx, DWORD PTR [ecx]
	push	edx
	mov	eax, DWORD PTR _node$71672[ebp]
	push	eax
	call	_dyntab_from_list
	add	esp, 24					; 00000018H
	test	eax, eax
	je	SHORT $L71683
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29872], OFFSET FLAT:$SG71686
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 1074		; 00000432H
	jmp	$eva_err$71539
$L71683:

; 1075 : 		DYNTAB_ADD(&node->value, 0, 0, cl->datebeg, 0, NO_CONV);

	push	0
	push	0
	push	0
	mov	eax, DWORD PTR _cl$[ebp]
	add	eax, 196				; 000000c4H
	push	eax
	push	0
	push	0
	mov	ecx, DWORD PTR _node$71672[ebp]
	add	ecx, 32					; 00000020H
	push	ecx
	call	_dyntab_add
	add	esp, 28					; 0000001cH
	test	eax, eax
	je	SHORT $L71688
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29872], OFFSET FLAT:$SG71690
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 1075		; 00000433H
	jmp	$eva_err$71539
$L71688:

; 1076 : 		DYNTAB_ADD(&node->value, 1, 0, cl->dateend, 0, NO_CONV);

	push	0
	push	0
	push	0
	mov	ecx, DWORD PTR _cl$[ebp]
	add	ecx, 212				; 000000d4H
	push	ecx
	push	0
	push	1
	mov	edx, DWORD PTR _node$71672[ebp]
	add	edx, 32					; 00000020H
	push	edx
	call	_dyntab_add
	add	esp, 28					; 0000001cH
	test	eax, eax
	je	SHORT $L71692
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29872], OFFSET FLAT:$SG71694
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 1076		; 00000434H
	jmp	$eva_err$71539
$L71692:

; 1077 : 		node->modif = df->col;

	mov	edx, DWORD PTR _node$71672[ebp]
	mov	eax, DWORD PTR _df$71673[ebp]
	mov	ecx, DWORD PTR [eax+56]
	mov	DWORD PTR [edx+20], ecx

; 1078 : 		node->match = InBound;

	mov	edx, DWORD PTR _node$71672[ebp]
	mov	DWORD PTR [edx+24], 19			; 00000013H

; 1079 : 		node->srcjoin = 0;

	mov	eax, DWORD PTR _node$71672[ebp]
	mov	DWORD PTR [eax+56], 0

; 1080 : 
; 1081 : 		/* Add matching objects to objects list */
; 1082 : 		M_FREE(sql);

	mov	ecx, DWORD PTR _sql$[ebp]
	push	ecx
	call	_mem_free
	add	esp, 4
	mov	DWORD PTR _sql$[ebp], 0

; 1083 : 		DYNBUF_ADD_STR(&sql, "INSERT INTO CalendarObjList (IdObj,DateVal,Num,Line) \n");

	push	0
	push	0
	push	54					; 00000036H
	push	OFFSET FLAT:$SG71697
	lea	edx, DWORD PTR _sql$[ebp]
	push	edx
	call	_dynbuf_add
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L71696
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29872], OFFSET FLAT:$SG71699
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 1083		; 0000043bH
	jmp	$eva_err$71539
$L71696:

; 1084 : 		if(qry_build_clauses(cntxt, &flt, 1)) STACK_ERROR;

	push	1
	lea	edx, DWORD PTR _flt$[ebp]
	push	edx
	mov	eax, DWORD PTR _cntxt$[ebp]
	push	eax
	call	_qry_build_clauses
	add	esp, 12					; 0000000cH
	test	eax, eax
	je	SHORT $L71700
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 1084		; 0000043cH
	jmp	$eva_err$71539
$L71700:

; 1085 : 		if(node->modif)

	mov	edx, DWORD PTR _node$71672[ebp]
	cmp	DWORD PTR [edx+20], 0
	je	$L71701

; 1087 : 			DYNBUF_ADD3_INT(&flt.optselect, "TLink", node->curjoin, ".");

	push	1
	push	OFFSET FLAT:$SG71703
	mov	eax, DWORD PTR _node$71672[ebp]
	mov	ecx, DWORD PTR [eax+60]
	push	ecx
	push	5
	push	OFFSET FLAT:$SG71704
	lea	edx, DWORD PTR _flt$[ebp+32]
	push	edx
	call	_dynbuf_add3_int
	add	esp, 24					; 00000018H
	test	eax, eax
	je	SHORT $L71702
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29872], OFFSET FLAT:$SG71706
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 1087		; 0000043fH
	jmp	$eva_err$71539
$L71702:

; 1088 : 			DYNBUF_ADD(&flt.optselect, node->modif == F_DateDel ? "DateDel" : "DateCr", 0, NO_CONV);

	mov	edx, DWORD PTR _node$71672[ebp]
	cmp	DWORD PTR [edx+20], 12			; 0000000cH
	jne	SHORT $L72056
	mov	DWORD PTR -4700+[ebp], OFFSET FLAT:$SG71709
	jmp	SHORT $L72057
$L72056:
	mov	DWORD PTR -4700+[ebp], OFFSET FLAT:$SG71710
$L72057:
	push	0
	push	0
	push	0
	mov	eax, DWORD PTR -4700+[ebp]
	push	eax
	lea	ecx, DWORD PTR _flt$[ebp+32]
	push	ecx
	call	_dynbuf_add
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L71708
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29872], OFFSET FLAT:$SG71712
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 1088		; 00000440H
	jmp	$eva_err$71539
$L71708:

; 1089 : 			DYNBUF_ADD_STR(&flt.optselect, " AS DateVal");

	push	0
	push	0
	push	11					; 0000000bH
	push	OFFSET FLAT:$SG71715
	lea	ecx, DWORD PTR _flt$[ebp+32]
	push	ecx
	call	_dynbuf_add
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L71714
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29872], OFFSET FLAT:$SG71717
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 1089		; 00000441H
	jmp	$eva_err$71539
$L71714:

; 1091 : 		else

	jmp	SHORT $L71719
$L71701:

; 1092 : 			DYNBUF_ADD3_INT(&flt.optselect, "TVal", node->curjoin, ".TxtValue AS DateVal");

	push	20					; 00000014H
	push	OFFSET FLAT:$SG71720
	mov	ecx, DWORD PTR _node$71672[ebp]
	mov	edx, DWORD PTR [ecx+60]
	push	edx
	push	4
	push	OFFSET FLAT:$SG71721
	lea	eax, DWORD PTR _flt$[ebp+32]
	push	eax
	call	_dynbuf_add3_int
	add	esp, 24					; 00000018H
	test	eax, eax
	je	SHORT $L71719
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29872], OFFSET FLAT:$SG71723
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 1092		; 00000444H
	jmp	$eva_err$71539
$L71719:

; 1093 : 		DYNBUF_ADD3_INT(&flt.optselect, ",", i, " AS Num");

	push	7
	push	OFFSET FLAT:$SG71725
	mov	eax, DWORD PTR _i$[ebp]
	push	eax
	push	1
	push	OFFSET FLAT:$SG71726
	lea	ecx, DWORD PTR _flt$[ebp+32]
	push	ecx
	call	_dynbuf_add3_int
	add	esp, 24					; 00000018H
	test	eax, eax
	je	SHORT $L71724
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29872], OFFSET FLAT:$SG71728
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 1093		; 00000445H
	jmp	$eva_err$71539
$L71724:

; 1094 : 		DYNBUF_ADD3_INT(&flt.optselect, ",TLink", node->curjoin, ".Line AS Line");

	push	13					; 0000000dH
	push	OFFSET FLAT:$SG71730
	mov	ecx, DWORD PTR _node$71672[ebp]
	mov	edx, DWORD PTR [ecx+60]
	push	edx
	push	6
	push	OFFSET FLAT:$SG71731
	lea	eax, DWORD PTR _flt$[ebp+32]
	push	eax
	call	_dynbuf_add3_int
	add	esp, 24					; 00000018H
	test	eax, eax
	je	SHORT $L71729
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29872], OFFSET FLAT:$SG71733
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 1094		; 00000446H
	jmp	$eva_err$71539
$L71729:

; 1095 : 		if(qry_build_flt_select(cntxt, &sql, &empty, &flt, 0, 0)) STACK_ERROR;

	push	0
	push	0
	lea	eax, DWORD PTR _flt$[ebp]
	push	eax
	lea	ecx, DWORD PTR _empty$[ebp]
	push	ecx
	lea	edx, DWORD PTR _sql$[ebp]
	push	edx
	mov	eax, DWORD PTR _cntxt$[ebp]
	push	eax
	call	_qry_build_flt_select
	add	esp, 24					; 00000018H
	test	eax, eax
	je	SHORT $L71734
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 1095		; 00000447H
	jmp	$eva_err$71539
$L71734:

; 1096 : 		if(qry_exec_filter(cntxt, &flt, sql->data)) STACK_ERROR;

	mov	edx, DWORD PTR _sql$[ebp]
	add	edx, 8
	push	edx
	lea	eax, DWORD PTR _flt$[ebp]
	push	eax
	mov	ecx, DWORD PTR _cntxt$[ebp]
	push	ecx
	call	_qry_exec_filter
	add	esp, 12					; 0000000cH
	test	eax, eax
	je	SHORT $L71735
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 1096		; 00000448H
	jmp	SHORT $eva_err$71539
$L71735:

; 1097 : 	}

	jmp	$L71670
$L71671:

; 1098 : 
; 1099 : 	/* Read object / date table */
; 1100 : 	if(sql_exec_query(cntxt, "SELECT DISTINCT IdObj,DateVal,Num,Line FROM CalendarObjList ORDER BY DateVal,Num,IdObj") ||
; 1101 : 		sql_get_table(cntxt, &cl->objlist, 2)) STACK_ERROR;

	push	OFFSET FLAT:$SG71738
	mov	eax, DWORD PTR _cntxt$[ebp]
	push	eax
	call	_sql_exec_query
	add	esp, 8
	test	eax, eax
	jne	SHORT $L71737
	push	2
	mov	ecx, DWORD PTR _cl$[ebp]
	add	ecx, 144				; 00000090H
	push	ecx
	mov	edx, DWORD PTR _cntxt$[ebp]
	push	edx
	call	_sql_get_table
	add	esp, 12					; 0000000cH
	test	eax, eax
	je	SHORT $eva_noerr$71739
$L71737:
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 1101		; 0000044dH
	jmp	SHORT $eva_err$71539
$eva_noerr$71739:

; 1102 : 
; 1103 : 	RETURN_OK_CLEANUP;

	push	0
	push	OFFSET FLAT:$SG71740
	push	OFFSET FLAT:$SG71741
	mov	ecx, DWORD PTR _cntxt$[ebp]
	push	ecx
	call	_err_clear
	add	esp, 16					; 00000010H
$eva_err$71539:
	mov	edx, DWORD PTR _cntxt$[ebp]
	cmp	DWORD PTR [edx+29872], 0
	je	SHORT $L71742
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	ecx, DWORD PTR [eax+29900]
	push	ecx
	push	OFFSET FLAT:$SG71743
	push	OFFSET FLAT:$SG71744
	mov	edx, DWORD PTR _cntxt$[ebp]
	push	edx
	call	_err_add_context
	add	esp, 16					; 00000010H
$L71742:
	lea	eax, DWORD PTR _empty$[ebp]
	push	eax
	call	_dyntab_free
	add	esp, 4
	lea	ecx, DWORD PTR _data$[ebp]
	push	ecx
	call	_dyntab_free
	add	esp, 4
	lea	edx, DWORD PTR _cgival$[ebp]
	push	edx
	call	_dyntab_free
	add	esp, 4
	mov	eax, DWORD PTR _sql$[ebp]
	push	eax
	call	_mem_free
	add	esp, 4
	mov	DWORD PTR _sql$[ebp], 0
	lea	ecx, DWORD PTR _flt$[ebp]
	push	ecx
	call	_qry_build_free
	add	esp, 4
	mov	edx, DWORD PTR _cntxt$[ebp]
	xor	eax, eax
	cmp	DWORD PTR [edx+29872], 0
	setne	al

; 1104 : }

	pop	edi
	mov	esp, ebp
	pop	ebp
	ret	0
_ctrl_output_calendar_read ENDP
_TEXT	ENDS
PUBLIC	_ctrl_output_calendar
EXTRN	_ctrl_put_table_header:NEAR
_BSS	SEGMENT
	ALIGN	4

$SG71781 DB	01H DUP (?)
	ALIGN	4

$SG71791 DB	01H DUP (?)
	ALIGN	4

$SG71793 DB	01H DUP (?)
	ALIGN	4

$SG71795 DB	01H DUP (?)
	ALIGN	4

$SG71799 DB	01H DUP (?)
	ALIGN	4

$SG71801 DB	01H DUP (?)
	ALIGN	4

$SG71804 DB	01H DUP (?)
	ALIGN	4

$SG71808 DB	01H DUP (?)
	ALIGN	4

$SG71810 DB	01H DUP (?)
	ALIGN	4

$SG71812 DB	01H DUP (?)
_BSS	ENDS
_DATA	SEGMENT
	ORG $+2
$SG71758 DB	'_EVA_DATECTL_CALENDAR', 00H
	ORG $+2
$SG71761 DB	'_EVA_DATE_INIT', 00H
	ORG $+1
$SG71770 DB	'D:\Travail\ABI\EVA\V4.0\CGI\Brunix-2016\ctrl_output_cale'
	DB	'ndar.c', 00H
	ORG $+1
$SG71771 DB	'ctrl_output_calendar', 00H
	ORG $+3
$SG71776 DB	'D:\Travail\ABI\EVA\V4.0\CGI\Brunix-2016\ctrl_output_cale'
	DB	'ndar.c', 00H
	ORG $+1
$SG71777 DB	'ctrl_output_calendar', 00H
	ORG $+3
$SG71780 DB	'_EVA_DATE_UNIT', 00H
	ORG $+1
$SG71783 DB	'_EVA_MONTH', 00H
	ORG $+1
$SG71786 DB	'%.8s', 00H
	ORG $+3
$SG71788 DB	'_EVA_YEAR', 00H
	ORG $+2
$SG71790 DB	'_EVA_WEEKEND', 00H
	ORG $+3
$SG71792 DB	'_EVA_WEEKEND_BGCOLOR', 00H
	ORG $+3
$SG71794 DB	'_EVA_DATELABEL_BGCOLOR', 00H
	ORG $+1
$SG71797 DB	'CCCCCC', 00H
	ORG $+1
$SG71798 DB	'_EVA_HEADER_BGCOLOR', 00H
$SG71800 DB	'_EVA_TODAY_BGCOLOR', 00H
	ORG $+1
$SG71803 DB	'_EVA_TODAYLABEL_BGCOLOR', 00H
$SG71807 DB	'_EVA_HOURCELL_MAXLINES', 00H
	ORG $+1
$SG71809 DB	'_EVA_RETURN_DATE', 00H
	ORG $+3
$SG71811 DB	'_EVA_FONTSIZE', 00H
	ORG $+2
$SG71815 DB	'_EVA_DAY', 00H
	ORG $+3
$SG71816 DB	'_EVA_WEEK', 00H
	ORG $+2
$SG71817 DB	'_EVA_MONTH', 00H
	ORG $+1
$SG71819 DB	'D:\Travail\ABI\EVA\V4.0\CGI\Brunix-2016\ctrl_output_cale'
	DB	'ndar.c', 00H
	ORG $+1
$SG71820 DB	'ctrl_output_calendar', 00H
	ORG $+3
$SG71822 DB	'D:\Travail\ABI\EVA\V4.0\CGI\Brunix-2016\ctrl_output_cale'
	DB	'ndar.c', 00H
	ORG $+1
$SG71823 DB	'ctrl_output_calendar', 00H
_DATA	ENDS
_TEXT	SEGMENT
_cntxt$ = 8
_cl$ = 12
_form$ = -4
_ctrl$ = -20
_ctldate$ = -16
_dateinit$ = -8
_html$ = -12
_ctrl_output_calendar PROC NEAR

; 1117 : ){

	push	ebp
	mov	ebp, esp
	sub	esp, 92					; 0000005cH

; 1118 : 	EVA_form *form = cntxt->form;

	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	ecx, DWORD PTR [eax+80]
	mov	DWORD PTR _form$[ebp], ecx

; 1119 : 	EVA_ctrl *ctrl = form->ctrl + cl->i_ctrl;

	mov	edx, DWORD PTR _cl$[ebp]
	mov	eax, DWORD PTR [edx+240]
	imul	eax, 480				; 000001e0H
	mov	ecx, DWORD PTR _form$[ebp]
	mov	edx, DWORD PTR [ecx]
	add	edx, eax
	mov	DWORD PTR _ctrl$[ebp], edx

; 1120 : 	DynTableCell *ctldate = CTRL_ATTR_CELL(DATECTL_CALENDAR);

	cmp	DWORD PTR _ctrl$[ebp], 0
	je	SHORT $L72060
	push	0
	push	-1
	push	OFFSET FLAT:$SG71758
	mov	eax, DWORD PTR _ctrl$[ebp]
	add	eax, 44					; 0000002cH
	push	eax
	call	_dyntab_field_cell
	add	esp, 16					; 00000010H
	mov	DWORD PTR -24+[ebp], eax
	jmp	SHORT $L72061
$L72060:
	mov	DWORD PTR -24+[ebp], 0
$L72061:
	mov	ecx, DWORD PTR -24+[ebp]
	mov	DWORD PTR _ctldate$[ebp], ecx

; 1121 : 	DynTableCell *dateinit = CTRL_ATTR_CELL(DATE_INIT);

	cmp	DWORD PTR _ctrl$[ebp], 0
	je	SHORT $L72062
	push	0
	push	-1
	push	OFFSET FLAT:$SG71761
	mov	edx, DWORD PTR _ctrl$[ebp]
	add	edx, 44					; 0000002cH
	push	edx
	call	_dyntab_field_cell
	add	esp, 16					; 00000010H
	mov	DWORD PTR -28+[ebp], eax
	jmp	SHORT $L72063
$L72062:
	mov	DWORD PTR -28+[ebp], 0
$L72063:
	mov	eax, DWORD PTR -28+[ebp]
	mov	DWORD PTR _dateinit$[ebp], eax

; 1122 : 	CHECK_HTML_STATUS;

	cmp	DWORD PTR _cntxt$[ebp], 0
	je	SHORT $L72066
	mov	ecx, DWORD PTR _cntxt$[ebp]
	cmp	DWORD PTR [ecx+80], 0
	je	SHORT $L72064
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	eax, DWORD PTR [edx+80]
	mov	ecx, DWORD PTR [eax+232]
	mov	DWORD PTR -32+[ebp], ecx
	jmp	SHORT $L72065
$L72064:
	mov	DWORD PTR -32+[ebp], 0
$L72065:
	mov	edx, DWORD PTR -32+[ebp]
	mov	DWORD PTR -36+[ebp], edx
	jmp	SHORT $L72067
$L72066:
	mov	DWORD PTR -36+[ebp], 0
$L72067:
	mov	eax, DWORD PTR -36+[ebp]
	mov	DWORD PTR _html$[ebp], eax
	cmp	DWORD PTR _html$[ebp], 0
	jne	SHORT $L71765
	xor	eax, eax
	jmp	$L71753
$L71765:

; 1123 : 
; 1124 : 	/* Set calendar initial date */
; 1125 : 	cl->ctldate = ctldate ? strtoul(ctldate->txt, NULL, 10) : CtlDateAll;

	cmp	DWORD PTR _ctldate$[ebp], 0
	je	SHORT $L72068
	push	10					; 0000000aH
	push	0
	mov	ecx, DWORD PTR _ctldate$[ebp]
	mov	edx, DWORD PTR [ecx]
	push	edx
	call	_strtoul
	add	esp, 12					; 0000000cH
	mov	DWORD PTR -40+[ebp], eax
	jmp	SHORT $L72069
$L72068:
	mov	DWORD PTR -40+[ebp], 255		; 000000ffH
$L72069:
	mov	eax, DWORD PTR _cl$[ebp]
	mov	ecx, DWORD PTR -40+[ebp]
	mov	DWORD PTR [eax+244], ecx

; 1126 : 	if(ctrl->FIELD && ctrl->FIELD[0] && !(cl->ctldate & CtlDateInput))

	mov	edx, DWORD PTR _ctrl$[ebp]
	cmp	DWORD PTR [edx+280], 0
	je	$L71767
	mov	eax, DWORD PTR _ctrl$[ebp]
	mov	ecx, DWORD PTR [eax+280]
	movsx	edx, BYTE PTR [ecx]
	test	edx, edx
	je	$L71767
	mov	eax, DWORD PTR _cl$[ebp]
	mov	ecx, DWORD PTR [eax+244]
	and	ecx, 1
	test	ecx, ecx
	jne	SHORT $L71767

; 1128 : 		if(form_eval_fieldexpr(cntxt, &ctrl->val, 0, 0, ctrl->FIELD, strlen(ctrl->FIELD), NULL, 0)) CLEAR_ERROR;

	push	0
	push	0
	mov	edx, DWORD PTR _ctrl$[ebp]
	mov	eax, DWORD PTR [edx+280]
	push	eax
	call	_strlen
	add	esp, 4
	push	eax
	mov	ecx, DWORD PTR _ctrl$[ebp]
	mov	edx, DWORD PTR [ecx+280]
	push	edx
	push	0
	push	0
	mov	eax, DWORD PTR _ctrl$[ebp]
	add	eax, 64					; 00000040H
	push	eax
	mov	ecx, DWORD PTR _cntxt$[ebp]
	push	ecx
	call	_form_eval_fieldexpr
	add	esp, 32					; 00000020H
	test	eax, eax
	je	SHORT $L71769
	push	1128					; 00000468H
	push	OFFSET FLAT:$SG71770
	push	OFFSET FLAT:$SG71771
	mov	edx, DWORD PTR _cntxt$[ebp]
	push	edx
	call	_err_clear
	add	esp, 16					; 00000010H
$L71769:

; 1129 : 		cl->dateinit = dyntab_val(&ctrl->val, 0, 0);

	push	0
	push	0
	mov	eax, DWORD PTR _ctrl$[ebp]
	add	eax, 64					; 00000040H
	push	eax
	call	_dyntab_val
	add	esp, 12					; 0000000cH
	mov	ecx, DWORD PTR _cl$[ebp]
	mov	DWORD PTR [ecx+260], eax

; 1131 : 	else if(dateinit)

	jmp	SHORT $L71773
$L71767:
	cmp	DWORD PTR _dateinit$[ebp], 0
	je	SHORT $L71773

; 1133 : 		if(form_eval_fieldexpr(cntxt, &ctrl->val, 0, 0, dateinit->txt, dateinit->len, NULL, 0)) CLEAR_ERROR;

	push	0
	push	0
	mov	edx, DWORD PTR _dateinit$[ebp]
	mov	eax, DWORD PTR [edx+4]
	push	eax
	mov	ecx, DWORD PTR _dateinit$[ebp]
	mov	edx, DWORD PTR [ecx]
	push	edx
	push	0
	push	0
	mov	eax, DWORD PTR _ctrl$[ebp]
	add	eax, 64					; 00000040H
	push	eax
	mov	ecx, DWORD PTR _cntxt$[ebp]
	push	ecx
	call	_form_eval_fieldexpr
	add	esp, 32					; 00000020H
	test	eax, eax
	je	SHORT $L71775
	push	1133					; 0000046dH
	push	OFFSET FLAT:$SG71776
	push	OFFSET FLAT:$SG71777
	mov	edx, DWORD PTR _cntxt$[ebp]
	push	edx
	call	_err_clear
	add	esp, 16					; 00000010H
$L71775:

; 1134 : 		cl->dateinit = dyntab_val(&ctrl->val, 0, 0);

	push	0
	push	0
	mov	eax, DWORD PTR _ctrl$[ebp]
	add	eax, 64					; 00000040H
	push	eax
	call	_dyntab_val
	add	esp, 12					; 0000000cH
	mov	ecx, DWORD PTR _cl$[ebp]
	mov	DWORD PTR [ecx+260], eax
$L71773:

; 1136 : 	if(!cl->dateinit || strlen(cl->dateinit) < 4) cl->dateinit = cntxt->timestamp;

	mov	edx, DWORD PTR _cl$[ebp]
	cmp	DWORD PTR [edx+260], 0
	je	SHORT $L71779
	mov	eax, DWORD PTR _cl$[ebp]
	mov	ecx, DWORD PTR [eax+260]
	push	ecx
	call	_strlen
	add	esp, 4
	cmp	eax, 4
	jae	SHORT $L71778
$L71779:
	mov	edx, DWORD PTR _cntxt$[ebp]
	add	edx, 29704				; 00007408H
	mov	eax, DWORD PTR _cl$[ebp]
	mov	DWORD PTR [eax+260], edx
$L71778:

; 1137 : 	strncpy(cl->datebeg, cl->dateinit, 14);

	push	14					; 0000000eH
	mov	ecx, DWORD PTR _cl$[ebp]
	mov	edx, DWORD PTR [ecx+260]
	push	edx
	mov	eax, DWORD PTR _cl$[ebp]
	add	eax, 196				; 000000c4H
	push	eax
	call	_strncpy
	add	esp, 12					; 0000000cH

; 1138 : 
; 1139 : 	/* Set other calendar parameters & read data */
; 1140 : 	cl->unit = CTRL_ATTR_VAL(DATE_UNIT);

	cmp	DWORD PTR _ctrl$[ebp], 0
	je	SHORT $L72070
	push	0
	push	-1
	push	OFFSET FLAT:$SG71780
	mov	ecx, DWORD PTR _ctrl$[ebp]
	add	ecx, 44					; 0000002cH
	push	ecx
	call	_dyntab_field_val
	add	esp, 16					; 00000010H
	mov	DWORD PTR -44+[ebp], eax
	jmp	SHORT $L72071
$L72070:
	mov	DWORD PTR -44+[ebp], OFFSET FLAT:$SG71781
$L72071:
	mov	edx, DWORD PTR _cl$[ebp]
	mov	eax, DWORD PTR -44+[ebp]
	mov	DWORD PTR [edx+256], eax

; 1141 : 	if(strlen(cl->unit) < 8) cl->unit = "_EVA_MONTH";

	mov	ecx, DWORD PTR _cl$[ebp]
	mov	edx, DWORD PTR [ecx+256]
	push	edx
	call	_strlen
	add	esp, 4
	cmp	eax, 8
	jae	SHORT $L71782
	mov	eax, DWORD PTR _cl$[ebp]
	mov	DWORD PTR [eax+256], OFFSET FLAT:$SG71783
$L71782:

; 1142 : 	if(ctrl_get_calendar_input(cntxt, cl->i_ctrl, cl->ctldate, cl->datebeg, &cl->unit, &cl->periods)) STACK_ERROR;

	mov	ecx, DWORD PTR _cl$[ebp]
	add	ecx, 232				; 000000e8H
	push	ecx
	mov	edx, DWORD PTR _cl$[ebp]
	add	edx, 256				; 00000100H
	push	edx
	mov	eax, DWORD PTR _cl$[ebp]
	add	eax, 196				; 000000c4H
	push	eax
	mov	ecx, DWORD PTR _cl$[ebp]
	mov	edx, DWORD PTR [ecx+244]
	push	edx
	mov	eax, DWORD PTR _cl$[ebp]
	mov	ecx, DWORD PTR [eax+240]
	push	ecx
	mov	edx, DWORD PTR _cntxt$[ebp]
	push	edx
	call	_ctrl_get_calendar_input
	add	esp, 24					; 00000018H
	test	eax, eax
	je	SHORT $L71784
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 1142		; 00000476H
	jmp	$eva_err$71785
$L71784:

; 1143 : 	sprintf(cl->datecal, "%.8s", cl->datebeg);

	mov	ecx, DWORD PTR _cl$[ebp]
	add	ecx, 196				; 000000c4H
	push	ecx
	push	OFFSET FLAT:$SG71786
	mov	edx, DWORD PTR _cl$[ebp]
	add	edx, 164				; 000000a4H
	push	edx
	call	_sprintf
	add	esp, 12					; 0000000cH

; 1144 : 	strcpy(cl->date0, cl->datecal);

	mov	eax, DWORD PTR _cl$[ebp]
	add	eax, 164				; 000000a4H
	push	eax
	mov	ecx, DWORD PTR _cl$[ebp]
	add	ecx, 180				; 000000b4H
	push	ecx
	call	_strcpy
	add	esp, 8

; 1145 : 	if(!strncmp(cl->unit, add_sz_str("_EVA_YEAR"))) ctrl->BORDER = 0;

	push	9
	push	OFFSET FLAT:$SG71788
	mov	edx, DWORD PTR _cl$[ebp]
	mov	eax, DWORD PTR [edx+256]
	push	eax
	call	_strncmp
	add	esp, 12					; 0000000cH
	test	eax, eax
	jne	SHORT $L71787
	mov	ecx, DWORD PTR _ctrl$[ebp]
	mov	DWORD PTR [ecx+460], 0
$L71787:

; 1146 : 	if(ctrl_output_calendar_read(cntxt, cl)) STACK_ERROR;

	mov	edx, DWORD PTR _cl$[ebp]
	push	edx
	mov	eax, DWORD PTR _cntxt$[ebp]
	push	eax
	call	_ctrl_output_calendar_read
	add	esp, 8
	test	eax, eax
	je	SHORT $L71789
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 1146		; 0000047aH
	jmp	$eva_err$71785
$L71789:

; 1147 : 	cl->wemode = CTRL_ATTR_VAL(WEEKEND);

	cmp	DWORD PTR _ctrl$[ebp], 0
	je	SHORT $L72072
	push	0
	push	-1
	push	OFFSET FLAT:$SG71790
	mov	edx, DWORD PTR _ctrl$[ebp]
	add	edx, 44					; 0000002cH
	push	edx
	call	_dyntab_field_val
	add	esp, 16					; 00000010H
	mov	DWORD PTR -48+[ebp], eax
	jmp	SHORT $L72073
$L72072:
	mov	DWORD PTR -48+[ebp], OFFSET FLAT:$SG71791
$L72073:
	mov	eax, DWORD PTR _cl$[ebp]
	mov	ecx, DWORD PTR -48+[ebp]
	mov	DWORD PTR [eax+272], ecx

; 1148 : 	cl->webgcolor = CTRL_ATTR_VAL(WEEKEND_BGCOLOR);

	cmp	DWORD PTR _ctrl$[ebp], 0
	je	SHORT $L72074
	push	0
	push	-1
	push	OFFSET FLAT:$SG71792
	mov	edx, DWORD PTR _ctrl$[ebp]
	add	edx, 44					; 0000002cH
	push	edx
	call	_dyntab_field_val
	add	esp, 16					; 00000010H
	mov	DWORD PTR -52+[ebp], eax
	jmp	SHORT $L72075
$L72074:
	mov	DWORD PTR -52+[ebp], OFFSET FLAT:$SG71793
$L72075:
	mov	eax, DWORD PTR _cl$[ebp]
	mov	ecx, DWORD PTR -52+[ebp]
	mov	DWORD PTR [eax+276], ecx

; 1149 : 	cl->datelblbgcolor = CTRL_ATTR_VAL(DATELABEL_BGCOLOR);

	cmp	DWORD PTR _ctrl$[ebp], 0
	je	SHORT $L72076
	push	0
	push	-1
	push	OFFSET FLAT:$SG71794
	mov	edx, DWORD PTR _ctrl$[ebp]
	add	edx, 44					; 0000002cH
	push	edx
	call	_dyntab_field_val
	add	esp, 16					; 00000010H
	mov	DWORD PTR -56+[ebp], eax
	jmp	SHORT $L72077
$L72076:
	mov	DWORD PTR -56+[ebp], OFFSET FLAT:$SG71795
$L72077:
	mov	eax, DWORD PTR _cl$[ebp]
	mov	ecx, DWORD PTR -56+[ebp]
	mov	DWORD PTR [eax+280], ecx

; 1150 : 	if(!cl->datelblbgcolor[0]) cl->datelblbgcolor = "CCCCCC";

	mov	edx, DWORD PTR _cl$[ebp]
	mov	eax, DWORD PTR [edx+280]
	movsx	ecx, BYTE PTR [eax]
	test	ecx, ecx
	jne	SHORT $L71796
	mov	edx, DWORD PTR _cl$[ebp]
	mov	DWORD PTR [edx+280], OFFSET FLAT:$SG71797
$L71796:

; 1151 : 	cl->headerbgcolor = CTRL_ATTR_VAL(HEADER_BGCOLOR);

	cmp	DWORD PTR _ctrl$[ebp], 0
	je	SHORT $L72078
	push	0
	push	-1
	push	OFFSET FLAT:$SG71798
	mov	eax, DWORD PTR _ctrl$[ebp]
	add	eax, 44					; 0000002cH
	push	eax
	call	_dyntab_field_val
	add	esp, 16					; 00000010H
	mov	DWORD PTR -60+[ebp], eax
	jmp	SHORT $L72079
$L72078:
	mov	DWORD PTR -60+[ebp], OFFSET FLAT:$SG71799
$L72079:
	mov	ecx, DWORD PTR _cl$[ebp]
	mov	edx, DWORD PTR -60+[ebp]
	mov	DWORD PTR [ecx+284], edx

; 1152 : 	cl->todaybgcolor = CTRL_ATTR_VAL(TODAY_BGCOLOR);

	cmp	DWORD PTR _ctrl$[ebp], 0
	je	SHORT $L72080
	push	0
	push	-1
	push	OFFSET FLAT:$SG71800
	mov	eax, DWORD PTR _ctrl$[ebp]
	add	eax, 44					; 0000002cH
	push	eax
	call	_dyntab_field_val
	add	esp, 16					; 00000010H
	mov	DWORD PTR -64+[ebp], eax
	jmp	SHORT $L72081
$L72080:
	mov	DWORD PTR -64+[ebp], OFFSET FLAT:$SG71801
$L72081:
	mov	ecx, DWORD PTR _cl$[ebp]
	mov	edx, DWORD PTR -64+[ebp]
	mov	DWORD PTR [ecx+288], edx

; 1153 : 	if(!cl->todaybgcolor[0]) cl->todaybgcolor = cl->datelblbgcolor;

	mov	eax, DWORD PTR _cl$[ebp]
	mov	ecx, DWORD PTR [eax+288]
	movsx	edx, BYTE PTR [ecx]
	test	edx, edx
	jne	SHORT $L71802
	mov	eax, DWORD PTR _cl$[ebp]
	mov	ecx, DWORD PTR _cl$[ebp]
	mov	edx, DWORD PTR [ecx+280]
	mov	DWORD PTR [eax+288], edx
$L71802:

; 1154 : 	cl->todaylblbgcolor = CTRL_ATTR_VAL(TODAYLABEL_BGCOLOR);

	cmp	DWORD PTR _ctrl$[ebp], 0
	je	SHORT $L72082
	push	0
	push	-1
	push	OFFSET FLAT:$SG71803
	mov	eax, DWORD PTR _ctrl$[ebp]
	add	eax, 44					; 0000002cH
	push	eax
	call	_dyntab_field_val
	add	esp, 16					; 00000010H
	mov	DWORD PTR -68+[ebp], eax
	jmp	SHORT $L72083
$L72082:
	mov	DWORD PTR -68+[ebp], OFFSET FLAT:$SG71804
$L72083:
	mov	ecx, DWORD PTR _cl$[ebp]
	mov	edx, DWORD PTR -68+[ebp]
	mov	DWORD PTR [ecx+292], edx

; 1155 : 	if(!cl->todaylblbgcolor[0]) cl->todaylblbgcolor = cl->todaybgcolor;

	mov	eax, DWORD PTR _cl$[ebp]
	mov	ecx, DWORD PTR [eax+292]
	movsx	edx, BYTE PTR [ecx]
	test	edx, edx
	jne	SHORT $L71805
	mov	eax, DWORD PTR _cl$[ebp]
	mov	ecx, DWORD PTR _cl$[ebp]
	mov	edx, DWORD PTR [ecx+288]
	mov	DWORD PTR [eax+292], edx
$L71805:

; 1156 : 	cl->maxlines = strtoul(CTRL_ATTR_VAL(HOURCELL_MAXLINES), NULL, 10);

	cmp	DWORD PTR _ctrl$[ebp], 0
	je	SHORT $L72084
	push	0
	push	-1
	push	OFFSET FLAT:$SG71807
	mov	eax, DWORD PTR _ctrl$[ebp]
	add	eax, 44					; 0000002cH
	push	eax
	call	_dyntab_field_val
	add	esp, 16					; 00000010H
	mov	DWORD PTR -72+[ebp], eax
	jmp	SHORT $L72085
$L72084:
	mov	DWORD PTR -72+[ebp], OFFSET FLAT:$SG71808
$L72085:
	push	10					; 0000000aH
	push	0
	mov	ecx, DWORD PTR -72+[ebp]
	push	ecx
	call	_strtoul
	add	esp, 12					; 0000000cH
	mov	edx, DWORD PTR _cl$[ebp]
	mov	DWORD PTR [edx+236], eax

; 1157 : 	cl->resfield = CTRL_ATTR_VAL(RETURN_DATE);

	cmp	DWORD PTR _ctrl$[ebp], 0
	je	SHORT $L72086
	push	0
	push	-1
	push	OFFSET FLAT:$SG71809
	mov	eax, DWORD PTR _ctrl$[ebp]
	add	eax, 44					; 0000002cH
	push	eax
	call	_dyntab_field_val
	add	esp, 16					; 00000010H
	mov	DWORD PTR -76+[ebp], eax
	jmp	SHORT $L72087
$L72086:
	mov	DWORD PTR -76+[ebp], OFFSET FLAT:$SG71810
$L72087:
	mov	ecx, DWORD PTR _cl$[ebp]
	mov	edx, DWORD PTR -76+[ebp]
	mov	DWORD PTR [ecx+264], edx

; 1158 : 	cl->fontsize = CTRL_ATTR_VAL(FONTSIZE);

	cmp	DWORD PTR _ctrl$[ebp], 0
	je	SHORT $L72088
	push	0
	push	-1
	push	OFFSET FLAT:$SG71811
	mov	eax, DWORD PTR _ctrl$[ebp]
	add	eax, 44					; 0000002cH
	push	eax
	call	_dyntab_field_val
	add	esp, 16					; 00000010H
	mov	DWORD PTR -80+[ebp], eax
	jmp	SHORT $L72089
$L72088:
	mov	DWORD PTR -80+[ebp], OFFSET FLAT:$SG71812
$L72089:
	mov	ecx, DWORD PTR _cl$[ebp]
	mov	edx, DWORD PTR -80+[ebp]
	mov	DWORD PTR [ecx+268], edx

; 1159 : 
; 1160 : 	/* Use appropriate display mode */
; 1161 : 	if(ctrl_put_table_header(cntxt, ctrl)) STACK_ERROR;

	mov	eax, DWORD PTR _ctrl$[ebp]
	push	eax
	mov	ecx, DWORD PTR _cntxt$[ebp]
	push	ecx
	call	_ctrl_put_table_header
	add	esp, 8
	test	eax, eax
	je	SHORT $L71813
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 1161		; 00000489H
	jmp	$eva_err$71785
$L71813:

; 1162 : 	if((!strcmp(cl->unit, "_EVA_DAY") ? ctrl_output_calendar_day :
; 1163 : 		!strcmp(cl->unit, "_EVA_WEEK") ? ctrl_output_calendar_week :
; 1164 : 		!strcmp(cl->unit, "_EVA_MONTH") ? ctrl_output_calendar_month :
; 1165 : 									ctrl_output_calendar_year)(cntxt, cl)) STACK_ERROR;

	push	OFFSET FLAT:$SG71815
	mov	eax, DWORD PTR _cl$[ebp]
	mov	ecx, DWORD PTR [eax+256]
	push	ecx
	call	_strcmp
	add	esp, 8
	test	eax, eax
	jne	SHORT $L72094
	mov	DWORD PTR -84+[ebp], OFFSET FLAT:_ctrl_output_calendar_day
	jmp	SHORT $L72095
$L72094:
	push	OFFSET FLAT:$SG71816
	mov	edx, DWORD PTR _cl$[ebp]
	mov	eax, DWORD PTR [edx+256]
	push	eax
	call	_strcmp
	add	esp, 8
	test	eax, eax
	jne	SHORT $L72092
	mov	DWORD PTR -88+[ebp], OFFSET FLAT:_ctrl_output_calendar_week
	jmp	SHORT $L72093
$L72092:
	push	OFFSET FLAT:$SG71817
	mov	ecx, DWORD PTR _cl$[ebp]
	mov	edx, DWORD PTR [ecx+256]
	push	edx
	call	_strcmp
	add	esp, 8
	test	eax, eax
	jne	SHORT $L72090
	mov	DWORD PTR -92+[ebp], OFFSET FLAT:_ctrl_output_calendar_month
	jmp	SHORT $L72091
$L72090:
	mov	DWORD PTR -92+[ebp], OFFSET FLAT:_ctrl_output_calendar_year
$L72091:
	mov	eax, DWORD PTR -92+[ebp]
	mov	DWORD PTR -88+[ebp], eax
$L72093:
	mov	ecx, DWORD PTR -88+[ebp]
	mov	DWORD PTR -84+[ebp], ecx
$L72095:
	mov	edx, DWORD PTR _cl$[ebp]
	push	edx
	mov	eax, DWORD PTR _cntxt$[ebp]
	push	eax
	call	DWORD PTR -84+[ebp]
	add	esp, 8
	test	eax, eax
	je	SHORT $eva_noerr$71818
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 1165		; 0000048dH
	jmp	SHORT $eva_err$71785
$eva_noerr$71818:

; 1166 : 
; 1167 : 	RETURN_OK_CLEANUP;

	push	0
	push	OFFSET FLAT:$SG71819
	push	OFFSET FLAT:$SG71820
	mov	edx, DWORD PTR _cntxt$[ebp]
	push	edx
	call	_err_clear
	add	esp, 16					; 00000010H
$eva_err$71785:
	mov	eax, DWORD PTR _cntxt$[ebp]
	cmp	DWORD PTR [eax+29872], 0
	je	SHORT $L71821
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	edx, DWORD PTR [ecx+29900]
	push	edx
	push	OFFSET FLAT:$SG71822
	push	OFFSET FLAT:$SG71823
	mov	eax, DWORD PTR _cntxt$[ebp]
	push	eax
	call	_err_add_context
	add	esp, 16					; 00000010H
$L71821:
	mov	ecx, DWORD PTR _cntxt$[ebp]
	xor	eax, eax
	cmp	DWORD PTR [ecx+29872], 0
	setne	al
$L71753:

; 1168 : }

	mov	esp, ebp
	pop	ebp
	ret	0
_ctrl_output_calendar ENDP
_TEXT	ENDS
PUBLIC	_ctrl_add_output_calendar
EXTRN	_table_read_controls:NEAR
EXTRN	_cgi_value_setkeep:NEAR
EXTRN	_ctrl_read_values:NEAR
EXTRN	_ctrl_put_hidden:NEAR
EXTRN	_ctrl_format_pos:NEAR
_DATA	SEGMENT
	ORG $+3
$SG71846 DB	'_EVA_BORDER', 00H
$SG71853 DB	'</tr></table>', 00H
	ORG $+2
$SG71855 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG71866 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG71870 DB	'D:\Travail\ABI\EVA\V4.0\CGI\Brunix-2016\ctrl_output_cale'
	DB	'ndar.c', 00H
	ORG $+1
$SG71871 DB	'ctrl_add_output_calendar', 00H
	ORG $+3
$SG71873 DB	'D:\Travail\ABI\EVA\V4.0\CGI\Brunix-2016\ctrl_output_cale'
	DB	'ndar.c', 00H
	ORG $+1
$SG71874 DB	'ctrl_add_output_calendar', 00H
_DATA	ENDS
_TEXT	SEGMENT
_cntxt$ = 8
_i_ctrl$ = 12
_form$ = -4
_ctrl$ = -308
_cl$ = -304
__i$71858 = -312
_ctrl_add_output_calendar PROC NEAR

; 1181 : ){

	push	ebp
	mov	ebp, esp
	sub	esp, 320				; 00000140H
	push	edi

; 1182 : 	EVA_form *form = cntxt->form;

	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	ecx, DWORD PTR [eax+80]
	mov	DWORD PTR _form$[ebp], ecx

; 1183 : 	EVA_ctrl *ctrl = form->ctrl + i_ctrl;

	mov	edx, DWORD PTR _i_ctrl$[ebp]
	imul	edx, 480				; 000001e0H
	mov	eax, DWORD PTR _form$[ebp]
	mov	ecx, DWORD PTR [eax]
	add	ecx, edx
	mov	DWORD PTR _ctrl$[ebp], ecx

; 1184 : 	EVA_calendar cl = {{0}};

	mov	DWORD PTR _cl$[ebp], 0
	xor	edx, edx
	mov	DWORD PTR _cl$[ebp+4], edx
	mov	DWORD PTR _cl$[ebp+8], edx
	mov	DWORD PTR _cl$[ebp+12], edx
	mov	DWORD PTR _cl$[ebp+16], edx
	mov	ecx, 70					; 00000046H
	xor	eax, eax
	lea	edi, DWORD PTR _cl$[ebp+20]
	rep stosd

; 1185 : 
; 1186 : 	switch(form->step)
; 1187 : 	{

	mov	eax, DWORD PTR _form$[ebp]
	mov	ecx, DWORD PTR [eax+176]
	mov	DWORD PTR -316+[ebp], ecx
	cmp	DWORD PTR -316+[ebp], 7
	ja	$L71868
	mov	edx, DWORD PTR -316+[ebp]
	jmp	DWORD PTR $L72099[edx*4]
$L71839:

; 1188 : 	case CtrlRead:
; 1189 : 		if(ctrl->FIELD && ctrl->FIELD[0])

	mov	eax, DWORD PTR _ctrl$[ebp]
	cmp	DWORD PTR [eax+280], 0
	je	SHORT $L71841
	mov	ecx, DWORD PTR _ctrl$[ebp]
	mov	edx, DWORD PTR [ecx+280]
	movsx	eax, BYTE PTR [edx]
	test	eax, eax
	je	SHORT $L71841

; 1191 : 			/* Read control values */
; 1192 : 			ctrl->cginame->data[0] = 'D';

	mov	ecx, DWORD PTR _ctrl$[ebp]
	mov	edx, DWORD PTR [ecx+40]
	mov	BYTE PTR [edx+8], 68			; 00000044H

; 1193 : 			if(ctrl_read_values(cntxt, i_ctrl)) STACK_ERROR;

	mov	eax, DWORD PTR _i_ctrl$[ebp]
	push	eax
	mov	ecx, DWORD PTR _cntxt$[ebp]
	push	ecx
	call	_ctrl_read_values
	add	esp, 8
	test	eax, eax
	je	SHORT $L71841
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 1193		; 000004a9H
	jmp	$eva_err$71842
$L71841:

; 1195 : 		break;

	jmp	$eva_noerr$71869
$L71843:

; 1196 : 	case HtmlEdit:
; 1197 : 	case HtmlPrint:
; 1198 : 	case HtmlView:
; 1199 : 		/* Set default parameters */
; 1200 : 		if(!CTRL_ATTR_CELL(BORDER)) ctrl->BORDER = 1;

	cmp	DWORD PTR _ctrl$[ebp], 0
	je	SHORT $L72097
	push	0
	push	-1
	push	OFFSET FLAT:$SG71846
	mov	eax, DWORD PTR _ctrl$[ebp]
	add	eax, 44					; 0000002cH
	push	eax
	call	_dyntab_field_cell
	add	esp, 16					; 00000010H
	mov	DWORD PTR -320+[ebp], eax
	jmp	SHORT $L72098
$L72097:
	mov	DWORD PTR -320+[ebp], 0
$L72098:
	cmp	DWORD PTR -320+[ebp], 0
	jne	SHORT $L71845
	mov	ecx, DWORD PTR _ctrl$[ebp]
	mov	DWORD PTR [ecx+460], 1
$L71845:

; 1201 : 		cl.i_ctrl = i_ctrl;

	mov	edx, DWORD PTR _i_ctrl$[ebp]
	mov	DWORD PTR _cl$[ebp+240], edx

; 1202 : 
; 1203 : 		/* Output headers & calendar */
; 1204 : 		if(table_read_controls(cntxt, i_ctrl, NULL)) STACK_ERROR;

	push	0
	mov	eax, DWORD PTR _i_ctrl$[ebp]
	push	eax
	mov	ecx, DWORD PTR _cntxt$[ebp]
	push	ecx
	call	_table_read_controls
	add	esp, 12					; 0000000cH
	test	eax, eax
	je	SHORT $L71848
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 1204		; 000004b4H
	jmp	$eva_err$71842
$L71848:

; 1205 : 		if(ctrl_format_pos(cntxt, ctrl, 1)) STACK_ERROR;

	push	1
	mov	eax, DWORD PTR _ctrl$[ebp]
	push	eax
	mov	ecx, DWORD PTR _cntxt$[ebp]
	push	ecx
	call	_ctrl_format_pos
	add	esp, 12					; 0000000cH
	test	eax, eax
	je	SHORT $L71849
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 1205		; 000004b5H
	jmp	$eva_err$71842
$L71849:

; 1206 : 		if(ctrl_output_calendar(cntxt, &cl)) STACK_ERROR;

	lea	eax, DWORD PTR _cl$[ebp]
	push	eax
	mov	ecx, DWORD PTR _cntxt$[ebp]
	push	ecx
	call	_ctrl_output_calendar
	add	esp, 8
	test	eax, eax
	je	SHORT $L71850
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 1206		; 000004b6H
	jmp	$eva_err$71842
$L71850:

; 1207 : 		DYNBUF_ADD_STR(form->html, "</tr></table>");

	push	0
	push	0
	push	13					; 0000000dH
	push	OFFSET FLAT:$SG71853
	mov	eax, DWORD PTR _form$[ebp]
	mov	ecx, DWORD PTR [eax+232]
	push	ecx
	call	_dynbuf_add
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L71852
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29872], OFFSET FLAT:$SG71855
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 1207		; 000004b7H
	jmp	$eva_err$71842
$L71852:

; 1208 : 		if(ctrl_format_pos(cntxt, ctrl, 0)) STACK_ERROR;

	push	0
	mov	ecx, DWORD PTR _ctrl$[ebp]
	push	ecx
	mov	edx, DWORD PTR _cntxt$[ebp]
	push	edx
	call	_ctrl_format_pos
	add	esp, 12					; 0000000cH
	test	eax, eax
	je	SHORT $L71856
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 1208		; 000004b8H
	jmp	$eva_err$71842
$L71856:

; 1209 : 		if(ctrl->FIELD && ctrl->FIELD[0])

	mov	ecx, DWORD PTR _ctrl$[ebp]
	cmp	DWORD PTR [ecx+280], 0
	je	$L71867
	mov	edx, DWORD PTR _ctrl$[ebp]
	mov	eax, DWORD PTR [edx+280]
	movsx	ecx, BYTE PTR [eax]
	test	ecx, ecx
	je	$L71867

; 1211 : 			CGI_VALUES_DONTKEEP(&ctrl->cgival);

	mov	DWORD PTR __i$71858[ebp], 0
	jmp	SHORT $L71859
$L71860:
	mov	edx, DWORD PTR __i$71858[ebp]
	add	edx, 1
	mov	DWORD PTR __i$71858[ebp], edx
$L71859:
	mov	eax, DWORD PTR _ctrl$[ebp]
	mov	ecx, DWORD PTR __i$71858[ebp]
	cmp	ecx, DWORD PTR [eax+104]
	jae	SHORT $L71861
	push	1
	mov	edx, DWORD PTR __i$71858[ebp]
	push	edx
	mov	eax, DWORD PTR _ctrl$[ebp]
	add	eax, 104				; 00000068H
	push	eax
	mov	ecx, DWORD PTR _cntxt$[ebp]
	push	ecx
	call	_cgi_value_setkeep
	add	esp, 16					; 00000010H
	jmp	SHORT $L71860
$L71861:

; 1212 : 			if(cl.ctldate & CtlDateInput)

	mov	edx, DWORD PTR _cl$[ebp+244]
	and	edx, 1
	test	edx, edx
	je	SHORT $L71867

; 1214 : 				DYNTAB_ADD(&ctrl->val, 0, 0, cl.datecal, 0, NO_CONV);

	push	0
	push	0
	push	0
	lea	eax, DWORD PTR _cl$[ebp+164]
	push	eax
	push	0
	push	0
	mov	ecx, DWORD PTR _ctrl$[ebp]
	add	ecx, 64					; 00000040H
	push	ecx
	call	_dyntab_add
	add	esp, 28					; 0000001cH
	test	eax, eax
	je	SHORT $L71864
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29872], OFFSET FLAT:$SG71866
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 1214		; 000004beH
	jmp	SHORT $eva_err$71842
$L71864:

; 1215 : 				if(ctrl_put_hidden(cntxt, ctrl, 0)) STACK_ERROR;

	push	0
	mov	ecx, DWORD PTR _ctrl$[ebp]
	push	ecx
	mov	edx, DWORD PTR _cntxt$[ebp]
	push	edx
	call	_ctrl_put_hidden
	add	esp, 12					; 0000000cH
	test	eax, eax
	je	SHORT $L71867
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 1215		; 000004bfH
	jmp	SHORT $eva_err$71842
$L71867:
$L71868:
$eva_noerr$71869:

; 1222 : 
; 1223 : 	RETURN_OK_CLEANUP;

	push	0
	push	OFFSET FLAT:$SG71870
	push	OFFSET FLAT:$SG71871
	mov	ecx, DWORD PTR _cntxt$[ebp]
	push	ecx
	call	_err_clear
	add	esp, 16					; 00000010H
$eva_err$71842:
	mov	edx, DWORD PTR _cntxt$[ebp]
	cmp	DWORD PTR [edx+29872], 0
	je	SHORT $L71872
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	ecx, DWORD PTR [eax+29900]
	push	ecx
	push	OFFSET FLAT:$SG71873
	push	OFFSET FLAT:$SG71874
	mov	edx, DWORD PTR _cntxt$[ebp]
	push	edx
	call	_err_add_context
	add	esp, 16					; 00000010H
$L71872:
	mov	eax, DWORD PTR _cntxt$[ebp]
	xor	ecx, ecx
	cmp	DWORD PTR [eax+29872], 0
	setne	cl
	mov	eax, ecx

; 1224 : }

	pop	edi
	mov	esp, ebp
	pop	ebp
	ret	0
$L72099:
	DD	$L71839
	DD	$L71868
	DD	$L71868
	DD	$L71868
	DD	$L71843
	DD	$L71868
	DD	$L71843
	DD	$L71843
_ctrl_add_output_calendar ENDP
_TEXT	ENDS
END
