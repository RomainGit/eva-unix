	TITLE	D:\Travail\ABI\EVA\V4.0\CGI\Brunix-2016\ctrl_input_list.c
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
PUBLIC	_put_html_list
EXTRN	_plain_to_html:BYTE
EXTRN	_no_quote:BYTE
EXTRN	_dynbuf_add:NEAR
EXTRN	_dynbuf_add_int:NEAR
EXTRN	_dynbuf_add3:NEAR
EXTRN	_dyntab_sz:NEAR
EXTRN	_dyntab_val:NEAR
EXTRN	_dyntab_cell:NEAR
EXTRN	_err_add_context:NEAR
EXTRN	_err_clear:NEAR
EXTRN	_dyntab_cmp:NEAR
_DATA	SEGMENT
$SG70235 DB	'<select size=', 00H
	ORG $+2
$SG70237 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70241 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70246 DB	'''', 00H
	ORG $+2
$SG70247 DB	' name=''', 00H
$SG70249 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70253 DB	' multiple', 00H
	ORG $+2
$SG70255 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70260 DB	'");''', 00H
	ORG $+3
$SG70261 DB	' onChange=''cb("', 00H
$SG70263 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70266 DB	'>', 0aH, 00H
	ORG $+1
$SG70268 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70275 DB	'<option value=''''></option>', 0aH, 00H
$SG70277 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70281 DB	'<option value=''''', 00H
	ORG $+3
$SG70283 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70288 DB	' selected', 00H
	ORG $+2
$SG70290 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70292 DB	'</option>', 0aH, 00H
	ORG $+1
$SG70293 DB	'>', 00H
	ORG $+2
$SG70295 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70302 DB	'''', 00H
	ORG $+2
$SG70303 DB	'<option value=''', 00H
$SG70305 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70313 DB	' selected', 00H
	ORG $+2
$SG70315 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70318 DB	'</option>', 0aH, 00H
	ORG $+1
$SG70319 DB	'>', 00H
	ORG $+2
$SG70321 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70331 DB	'''', 00H
	ORG $+2
$SG70332 DB	'<option value=''', 00H
$SG70334 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70338 DB	'</option>', 0aH, 00H
	ORG $+1
$SG70339 DB	' selected>', 00H
	ORG $+1
$SG70341 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70345 DB	'<option value=''''>', 00H
	ORG $+2
$SG70347 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70353 DB	'&nbsp;', 00H
	ORG $+1
$SG70355 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70358 DB	'</option>', 00H
	ORG $+2
$SG70360 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70363 DB	'</select>', 00H
	ORG $+2
$SG70365 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70367 DB	'D:\Travail\ABI\EVA\V4.0\CGI\Brunix-2016\ctrl_input_list.'
	DB	'c', 00H
	ORG $+2
$SG70368 DB	'put_html_list', 00H
	ORG $+2
$SG70370 DB	'D:\Travail\ABI\EVA\V4.0\CGI\Brunix-2016\ctrl_input_list.'
	DB	'c', 00H
	ORG $+2
$SG70371 DB	'put_html_list', 00H
_DATA	ENDS
_TEXT	SEGMENT
_cntxt$ = 8
_name$ = 12
_options$ = 16
_values$ = 20
_lines$ = 24
_columns$ = 28
_b_multiple$ = 32
_b_submitonchange$ = 36
_b_ignoreunlisted$ = 40
_emptyval$ = 44
_i$ = -8
_k$ = -12
_html$ = -4
_j$70297 = -16
_val$70310 = -20
_val$70326 = -24
__c$70328 = -28
__c$70335 = -32
_put_html_list PROC NEAR

; 32   : ){

	push	ebp
	mov	ebp, esp
	sub	esp, 80					; 00000050H

; 33   : 	unsigned long i, k;
; 34   : 	CHECK_HTML_STATUS;

	cmp	DWORD PTR _cntxt$[ebp], 0
	je	SHORT $L70957
	mov	eax, DWORD PTR _cntxt$[ebp]
	cmp	DWORD PTR [eax+80], 0
	je	SHORT $L70955
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	edx, DWORD PTR [ecx+80]
	mov	eax, DWORD PTR [edx+232]
	mov	DWORD PTR -36+[ebp], eax
	jmp	SHORT $L70956
$L70955:
	mov	DWORD PTR -36+[ebp], 0
$L70956:
	mov	ecx, DWORD PTR -36+[ebp]
	mov	DWORD PTR -40+[ebp], ecx
	jmp	SHORT $L70958
$L70957:
	mov	DWORD PTR -40+[ebp], 0
$L70958:
	mov	edx, DWORD PTR -40+[ebp]
	mov	DWORD PTR _html$[ebp], edx
	cmp	DWORD PTR _html$[ebp], 0
	jne	SHORT $L70230
	xor	eax, eax
	jmp	$L70224
$L70230:

; 35   : 
; 36   : 	/* Force multiple if more than one value */
; 37   : 	if(values && values->nbrows > 1) b_multiple = 1;

	cmp	DWORD PTR _values$[ebp], 0
	je	SHORT $L70231
	mov	eax, DWORD PTR _values$[ebp]
	cmp	DWORD PTR [eax], 1
	jbe	SHORT $L70231
	mov	DWORD PTR _b_multiple$[ebp], 1
$L70231:

; 38   : 	if(b_multiple && lines < 2) lines = 2;

	cmp	DWORD PTR _b_multiple$[ebp], 0
	je	SHORT $L70232
	cmp	DWORD PTR _lines$[ebp], 2
	jge	SHORT $L70232
	mov	DWORD PTR _lines$[ebp], 2
$L70232:

; 39   : 
; 40   : 	/* HTML code for input */
; 41   : 	DYNBUF_ADD_STR(html, "<select size=");

	push	0
	push	0
	push	13					; 0000000dH
	push	OFFSET FLAT:$SG70235
	mov	ecx, DWORD PTR _html$[ebp]
	push	ecx
	call	_dynbuf_add
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L70234
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29872], OFFSET FLAT:$SG70237
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 41		; 00000029H
	jmp	$eva_err$70238
$L70234:

; 42   : 	DYNBUF_ADD_INT(html, lines);

	mov	ecx, DWORD PTR _lines$[ebp]
	push	ecx
	mov	edx, DWORD PTR _html$[ebp]
	push	edx
	call	_dynbuf_add_int
	add	esp, 8
	test	eax, eax
	je	SHORT $L70239
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29872], OFFSET FLAT:$SG70241
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 42		; 0000002aH
	jmp	$eva_err$70238
$L70239:

; 43   : 	if(name) DYNBUF_ADD3_BUF(html, " name='", name, NO_CONV, "'");

	cmp	DWORD PTR _name$[ebp], 0
	je	SHORT $L70245
	cmp	DWORD PTR _name$[ebp], 0
	je	SHORT $L70959
	mov	edx, DWORD PTR _name$[ebp]
	mov	eax, DWORD PTR [edx+4]
	mov	DWORD PTR -44+[ebp], eax
	jmp	SHORT $L70960
$L70959:
	mov	DWORD PTR -44+[ebp], 0
$L70960:
	cmp	DWORD PTR _name$[ebp], 0
	je	SHORT $L70961
	mov	ecx, DWORD PTR _name$[ebp]
	add	ecx, 8
	mov	DWORD PTR -48+[ebp], ecx
	jmp	SHORT $L70962
$L70961:
	mov	DWORD PTR -48+[ebp], 0
$L70962:
	push	1
	push	OFFSET FLAT:$SG70246
	push	0
	push	0
	mov	edx, DWORD PTR -44+[ebp]
	push	edx
	mov	eax, DWORD PTR -48+[ebp]
	push	eax
	push	7
	push	OFFSET FLAT:$SG70247
	mov	ecx, DWORD PTR _html$[ebp]
	push	ecx
	call	_dynbuf_add3
	add	esp, 36					; 00000024H
	test	eax, eax
	je	SHORT $L70245
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29872], OFFSET FLAT:$SG70249
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 43		; 0000002bH
	jmp	$eva_err$70238
$L70245:

; 44   : 	if(b_multiple) DYNBUF_ADD_STR(html, " multiple");

	cmp	DWORD PTR _b_multiple$[ebp], 0
	je	SHORT $L70252
	push	0
	push	0
	push	9
	push	OFFSET FLAT:$SG70253
	mov	ecx, DWORD PTR _html$[ebp]
	push	ecx
	call	_dynbuf_add
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L70252
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29872], OFFSET FLAT:$SG70255
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 44		; 0000002cH
	jmp	$eva_err$70238
$L70252:

; 45   : 	if(b_submitonchange) DYNBUF_ADD3_BUF(html, " onChange='cb(\"", name, NO_CONV, "\");'");

	cmp	DWORD PTR _b_submitonchange$[ebp], 0
	je	SHORT $L70259
	cmp	DWORD PTR _name$[ebp], 0
	je	SHORT $L70963
	mov	ecx, DWORD PTR _name$[ebp]
	mov	edx, DWORD PTR [ecx+4]
	mov	DWORD PTR -52+[ebp], edx
	jmp	SHORT $L70964
$L70963:
	mov	DWORD PTR -52+[ebp], 0
$L70964:
	cmp	DWORD PTR _name$[ebp], 0
	je	SHORT $L70965
	mov	eax, DWORD PTR _name$[ebp]
	add	eax, 8
	mov	DWORD PTR -56+[ebp], eax
	jmp	SHORT $L70966
$L70965:
	mov	DWORD PTR -56+[ebp], 0
$L70966:
	push	4
	push	OFFSET FLAT:$SG70260
	push	0
	push	0
	mov	ecx, DWORD PTR -52+[ebp]
	push	ecx
	mov	edx, DWORD PTR -56+[ebp]
	push	edx
	push	15					; 0000000fH
	push	OFFSET FLAT:$SG70261
	mov	eax, DWORD PTR _html$[ebp]
	push	eax
	call	_dynbuf_add3
	add	esp, 36					; 00000024H
	test	eax, eax
	je	SHORT $L70259
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29872], OFFSET FLAT:$SG70263
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 45		; 0000002dH
	jmp	$eva_err$70238
$L70259:

; 46   : 	DYNBUF_ADD_STR(html, ">\n");

	push	0
	push	0
	push	2
	push	OFFSET FLAT:$SG70266
	mov	eax, DWORD PTR _html$[ebp]
	push	eax
	call	_dynbuf_add
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L70265
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29872], OFFSET FLAT:$SG70268
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 46		; 0000002eH
	jmp	$eva_err$70238
$L70265:

; 47   : 
; 48   : 	/* Init col member of values : used to return the index of the selected option */
; 49   : 	if(values) for(i = 0; i < values->nbrows; i++) dyntab_cell(values, i, 0)->col = 0;

	cmp	DWORD PTR _values$[ebp], 0
	je	SHORT $L70272
	mov	DWORD PTR _i$[ebp], 0
	jmp	SHORT $L70270
$L70271:
	mov	eax, DWORD PTR _i$[ebp]
	add	eax, 1
	mov	DWORD PTR _i$[ebp], eax
$L70270:
	mov	ecx, DWORD PTR _values$[ebp]
	mov	edx, DWORD PTR _i$[ebp]
	cmp	edx, DWORD PTR [ecx]
	jae	SHORT $L70272
	push	0
	mov	eax, DWORD PTR _i$[ebp]
	push	eax
	mov	ecx, DWORD PTR _values$[ebp]
	push	ecx
	call	_dyntab_cell
	add	esp, 12					; 0000000cH
	mov	DWORD PTR [eax+56], 0
	jmp	SHORT $L70271
$L70272:

; 50   : 
; 51   : 	/* Add empty value at beginning of list if specified */
; 52   : 	DYNBUF_ADD_STR(html, "<option value=''></option>\n");

	push	0
	push	0
	push	27					; 0000001bH
	push	OFFSET FLAT:$SG70275
	mov	edx, DWORD PTR _html$[ebp]
	push	edx
	call	_dynbuf_add
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L70274
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29872], OFFSET FLAT:$SG70277
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 52		; 00000034H
	jmp	$eva_err$70238
$L70274:

; 53   : 	if(emptyval && *emptyval)

	cmp	DWORD PTR _emptyval$[ebp], 0
	je	$L70291
	mov	edx, DWORD PTR _emptyval$[ebp]
	movsx	eax, BYTE PTR [edx]
	test	eax, eax
	je	$L70291

; 55   : 		DYNBUF_ADD_STR(html, "<option value=''");

	push	0
	push	0
	push	16					; 00000010H
	push	OFFSET FLAT:$SG70281
	mov	ecx, DWORD PTR _html$[ebp]
	push	ecx
	call	_dynbuf_add
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L70280
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29872], OFFSET FLAT:$SG70283
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 55		; 00000037H
	jmp	$eva_err$70238
$L70280:

; 56   : 		if(values && (!values->nbrows || !values->cell->txt || !*values->cell->txt)) DYNBUF_ADD_STR(html, " selected");

	cmp	DWORD PTR _values$[ebp], 0
	je	SHORT $L70287
	mov	ecx, DWORD PTR _values$[ebp]
	cmp	DWORD PTR [ecx], 0
	je	SHORT $L70285
	mov	edx, DWORD PTR _values$[ebp]
	mov	eax, DWORD PTR [edx+16]
	cmp	DWORD PTR [eax], 0
	je	SHORT $L70285
	mov	ecx, DWORD PTR _values$[ebp]
	mov	edx, DWORD PTR [ecx+16]
	mov	eax, DWORD PTR [edx]
	movsx	ecx, BYTE PTR [eax]
	test	ecx, ecx
	jne	SHORT $L70287
$L70285:
	push	0
	push	0
	push	9
	push	OFFSET FLAT:$SG70288
	mov	edx, DWORD PTR _html$[ebp]
	push	edx
	call	_dynbuf_add
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L70287
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29872], OFFSET FLAT:$SG70290
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 56		; 00000038H
	jmp	$eva_err$70238
$L70287:

; 57   : 		DYNBUF_ADD3(html, ">", emptyval, 0, TO_HTML, "</option>\n");

	push	10					; 0000000aH
	push	OFFSET FLAT:$SG70292
	push	1
	push	OFFSET FLAT:_plain_to_html
	push	0
	mov	edx, DWORD PTR _emptyval$[ebp]
	push	edx
	push	1
	push	OFFSET FLAT:$SG70293
	mov	eax, DWORD PTR _html$[ebp]
	push	eax
	call	_dynbuf_add3
	add	esp, 36					; 00000024H
	test	eax, eax
	je	SHORT $L70291
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29872], OFFSET FLAT:$SG70295
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 57		; 00000039H
	jmp	$eva_err$70238
$L70291:

; 59   : 
; 60   : 	/* HTML code for list options */
; 61   : 	if(options)

	cmp	DWORD PTR _options$[ebp], 0
	je	$L70300

; 63   : 		int j = (options && options->nbcols > 1) ? 1 : 0;

	cmp	DWORD PTR _options$[ebp], 0
	je	SHORT $L70967
	mov	eax, DWORD PTR _options$[ebp]
	cmp	DWORD PTR [eax+8], 1
	jbe	SHORT $L70967
	mov	DWORD PTR -60+[ebp], 1
	jmp	SHORT $L70968
$L70967:
	mov	DWORD PTR -60+[ebp], 0
$L70968:
	mov	ecx, DWORD PTR -60+[ebp]
	mov	DWORD PTR _j$70297[ebp], ecx

; 64   : 		for(i = 0; i < options->nbrows; i++)

	mov	DWORD PTR _i$[ebp], 0
	jmp	SHORT $L70298
$L70299:
	mov	edx, DWORD PTR _i$[ebp]
	add	edx, 1
	mov	DWORD PTR _i$[ebp], edx
$L70298:
	mov	eax, DWORD PTR _options$[ebp]
	mov	ecx, DWORD PTR _i$[ebp]
	cmp	ecx, DWORD PTR [eax]
	jae	$L70300

; 66   : 			DYNBUF_ADD3_CELL(html, "<option value='", options, i, 0, HTML_NO_QUOTE, "'");

	push	1
	push	OFFSET FLAT:$SG70302
	push	1
	push	OFFSET FLAT:_no_quote
	push	0
	mov	edx, DWORD PTR _i$[ebp]
	push	edx
	mov	eax, DWORD PTR _options$[ebp]
	push	eax
	call	_dyntab_sz
	add	esp, 12					; 0000000cH
	push	eax
	push	0
	mov	ecx, DWORD PTR _i$[ebp]
	push	ecx
	mov	edx, DWORD PTR _options$[ebp]
	push	edx
	call	_dyntab_val
	add	esp, 12					; 0000000cH
	push	eax
	push	15					; 0000000fH
	push	OFFSET FLAT:$SG70303
	mov	eax, DWORD PTR _html$[ebp]
	push	eax
	call	_dynbuf_add3
	add	esp, 36					; 00000024H
	test	eax, eax
	je	SHORT $L70301
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29872], OFFSET FLAT:$SG70305
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 66		; 00000042H
	jmp	$eva_err$70238
$L70301:

; 67   : 
; 68   : 			/* Search option in values */
; 69   : 			for(k = 0; k < (values ? values->nbrows : 1); k++)

	mov	DWORD PTR _k$[ebp], 0
	jmp	SHORT $L70306
$L70307:
	mov	eax, DWORD PTR _k$[ebp]
	add	eax, 1
	mov	DWORD PTR _k$[ebp], eax
$L70306:
	cmp	DWORD PTR _values$[ebp], 0
	je	SHORT $L70969
	mov	ecx, DWORD PTR _values$[ebp]
	mov	edx, DWORD PTR [ecx]
	mov	DWORD PTR -64+[ebp], edx
	jmp	SHORT $L70970
$L70969:
	mov	DWORD PTR -64+[ebp], 1
$L70970:
	mov	eax, DWORD PTR _k$[ebp]
	cmp	eax, DWORD PTR -64+[ebp]
	jae	$L70308

; 71   : 				if(!dyntab_cmp(options, i, 0, values, k, 0))

	push	0
	mov	ecx, DWORD PTR _k$[ebp]
	push	ecx
	mov	edx, DWORD PTR _values$[ebp]
	push	edx
	push	0
	mov	eax, DWORD PTR _i$[ebp]
	push	eax
	mov	ecx, DWORD PTR _options$[ebp]
	push	ecx
	call	_dyntab_cmp
	add	esp, 24					; 00000018H
	test	eax, eax
	jne	SHORT $L70309

; 73   : 					/* Add 'selected' attribute & mark value if found */
; 74   : 					DynTableCell *val = dyntab_cell(values, k, 0);

	push	0
	mov	edx, DWORD PTR _k$[ebp]
	push	edx
	mov	eax, DWORD PTR _values$[ebp]
	push	eax
	call	_dyntab_cell
	add	esp, 12					; 0000000cH
	mov	DWORD PTR _val$70310[ebp], eax

; 75   : 					DYNBUF_ADD_STR(html, " selected");

	push	0
	push	0
	push	9
	push	OFFSET FLAT:$SG70313
	mov	ecx, DWORD PTR _html$[ebp]
	push	ecx
	call	_dynbuf_add
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L70312
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29872], OFFSET FLAT:$SG70315
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 75		; 0000004bH
	jmp	$eva_err$70238
$L70312:

; 76   : 					dyntab_cell(options, i, 0)->col = 1;

	push	0
	mov	ecx, DWORD PTR _i$[ebp]
	push	ecx
	mov	edx, DWORD PTR _options$[ebp]
	push	edx
	call	_dyntab_cell
	add	esp, 12					; 0000000cH
	mov	DWORD PTR [eax+56], 1

; 77   : 					if(val) val->col = i + 1;

	cmp	DWORD PTR _val$70310[ebp], 0
	je	SHORT $L70316
	mov	eax, DWORD PTR _i$[ebp]
	add	eax, 1
	mov	ecx, DWORD PTR _val$70310[ebp]
	mov	DWORD PTR [ecx+56], eax
$L70316:

; 78   : 					break;

	jmp	SHORT $L70308
$L70309:

; 80   : 			}

	jmp	$L70307
$L70308:

; 81   : 			DYNBUF_ADD3_CELL(html, ">", options, i, j, TO_HTML, "</option>\n");

	push	10					; 0000000aH
	push	OFFSET FLAT:$SG70318
	push	1
	push	OFFSET FLAT:_plain_to_html
	mov	edx, DWORD PTR _j$70297[ebp]
	push	edx
	mov	eax, DWORD PTR _i$[ebp]
	push	eax
	mov	ecx, DWORD PTR _options$[ebp]
	push	ecx
	call	_dyntab_sz
	add	esp, 12					; 0000000cH
	push	eax
	mov	edx, DWORD PTR _j$70297[ebp]
	push	edx
	mov	eax, DWORD PTR _i$[ebp]
	push	eax
	mov	ecx, DWORD PTR _options$[ebp]
	push	ecx
	call	_dyntab_val
	add	esp, 12					; 0000000cH
	push	eax
	push	1
	push	OFFSET FLAT:$SG70319
	mov	edx, DWORD PTR _html$[ebp]
	push	edx
	call	_dynbuf_add3
	add	esp, 36					; 00000024H
	test	eax, eax
	je	SHORT $L70317
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29872], OFFSET FLAT:$SG70321
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 81		; 00000051H
	jmp	$eva_err$70238
$L70317:

; 82   : 		}

	jmp	$L70299
$L70300:

; 84   : 
; 85   : 	/* Add HTML code for unlisted values */
; 86   : 	if(values && !b_ignoreunlisted) for(i = 0; i < values->nbrows; i++)

	cmp	DWORD PTR _values$[ebp], 0
	je	$L70325
	cmp	DWORD PTR _b_ignoreunlisted$[ebp], 0
	jne	$L70325
	mov	DWORD PTR _i$[ebp], 0
	jmp	SHORT $L70323
$L70324:
	mov	edx, DWORD PTR _i$[ebp]
	add	edx, 1
	mov	DWORD PTR _i$[ebp], edx
$L70323:
	mov	eax, DWORD PTR _values$[ebp]
	mov	ecx, DWORD PTR _i$[ebp]
	cmp	ecx, DWORD PTR [eax]
	jae	$L70325

; 88   : 		DynTableCell *val = dyntab_cell(values, i, 0);

	push	0
	mov	edx, DWORD PTR _i$[ebp]
	push	edx
	mov	eax, DWORD PTR _values$[ebp]
	push	eax
	call	_dyntab_cell
	add	esp, 12					; 0000000cH
	mov	DWORD PTR _val$70326[ebp], eax

; 89   : 		if(!val->col && val->len && val->txt && val->txt[0])

	mov	ecx, DWORD PTR _val$70326[ebp]
	cmp	DWORD PTR [ecx+56], 0
	jne	$L70337
	mov	edx, DWORD PTR _val$70326[ebp]
	cmp	DWORD PTR [edx+4], 0
	je	$L70337
	mov	eax, DWORD PTR _val$70326[ebp]
	cmp	DWORD PTR [eax], 0
	je	$L70337
	mov	ecx, DWORD PTR _val$70326[ebp]
	mov	edx, DWORD PTR [ecx]
	movsx	eax, BYTE PTR [edx]
	test	eax, eax
	je	$L70337

; 91   : 			DYNBUF_ADD3_CELLP(html, "<option value='", val, HTML_NO_QUOTE, "'");

	mov	ecx, DWORD PTR _val$70326[ebp]
	mov	DWORD PTR __c$70328[ebp], ecx
	cmp	DWORD PTR __c$70328[ebp], 0
	je	SHORT $L70971
	mov	edx, DWORD PTR __c$70328[ebp]
	mov	eax, DWORD PTR [edx+4]
	mov	DWORD PTR -68+[ebp], eax
	jmp	SHORT $L70972
$L70971:
	mov	DWORD PTR -68+[ebp], 0
$L70972:
	cmp	DWORD PTR __c$70328[ebp], 0
	je	SHORT $L70973
	mov	ecx, DWORD PTR __c$70328[ebp]
	mov	edx, DWORD PTR [ecx]
	mov	DWORD PTR -72+[ebp], edx
	jmp	SHORT $L70974
$L70973:
	mov	DWORD PTR -72+[ebp], 0
$L70974:
	push	1
	push	OFFSET FLAT:$SG70331
	push	1
	push	OFFSET FLAT:_no_quote
	mov	eax, DWORD PTR -68+[ebp]
	push	eax
	mov	ecx, DWORD PTR -72+[ebp]
	push	ecx
	push	15					; 0000000fH
	push	OFFSET FLAT:$SG70332
	mov	edx, DWORD PTR _html$[ebp]
	push	edx
	call	_dynbuf_add3
	add	esp, 36					; 00000024H
	test	eax, eax
	je	SHORT $L70330
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29872], OFFSET FLAT:$SG70334
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 91		; 0000005bH
	jmp	$eva_err$70238
$L70330:

; 92   : 			DYNBUF_ADD3_CELLP(html, " selected>", val, TO_HTML, "</option>\n");

	mov	edx, DWORD PTR _val$70326[ebp]
	mov	DWORD PTR __c$70335[ebp], edx
	cmp	DWORD PTR __c$70335[ebp], 0
	je	SHORT $L70975
	mov	eax, DWORD PTR __c$70335[ebp]
	mov	ecx, DWORD PTR [eax+4]
	mov	DWORD PTR -76+[ebp], ecx
	jmp	SHORT $L70976
$L70975:
	mov	DWORD PTR -76+[ebp], 0
$L70976:
	cmp	DWORD PTR __c$70335[ebp], 0
	je	SHORT $L70977
	mov	edx, DWORD PTR __c$70335[ebp]
	mov	eax, DWORD PTR [edx]
	mov	DWORD PTR -80+[ebp], eax
	jmp	SHORT $L70978
$L70977:
	mov	DWORD PTR -80+[ebp], 0
$L70978:
	push	10					; 0000000aH
	push	OFFSET FLAT:$SG70338
	push	1
	push	OFFSET FLAT:_plain_to_html
	mov	ecx, DWORD PTR -76+[ebp]
	push	ecx
	mov	edx, DWORD PTR -80+[ebp]
	push	edx
	push	10					; 0000000aH
	push	OFFSET FLAT:$SG70339
	mov	eax, DWORD PTR _html$[ebp]
	push	eax
	call	_dynbuf_add3
	add	esp, 36					; 00000024H
	test	eax, eax
	je	SHORT $L70337
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29872], OFFSET FLAT:$SG70341
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 92		; 0000005cH
	jmp	$eva_err$70238
$L70337:

; 94   : 	}

	jmp	$L70324
$L70325:

; 95   : 
; 96   : 	/* Add empty value at end of list to set list width */
; 97   : 	if(columns)

	cmp	DWORD PTR _columns$[ebp], 0
	je	$L70357

; 99   : 		DYNBUF_ADD_STR(html, "<option value=''>");

	push	0
	push	0
	push	17					; 00000011H
	push	OFFSET FLAT:$SG70345
	mov	eax, DWORD PTR _html$[ebp]
	push	eax
	call	_dynbuf_add
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L70344
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29872], OFFSET FLAT:$SG70347
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 99		; 00000063H
	jmp	$eva_err$70238
$L70344:

; 100  : 		while(--columns > 0) DYNBUF_ADD_STR(html, "&nbsp;");

	mov	eax, DWORD PTR _columns$[ebp]
	sub	eax, 1
	mov	DWORD PTR _columns$[ebp], eax
	cmp	DWORD PTR _columns$[ebp], 0
	jle	SHORT $L70350
	push	0
	push	0
	push	6
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
	mov	DWORD PTR [eax+29900], 100		; 00000064H
	jmp	$eva_err$70238
$L70352:
	jmp	SHORT $L70344
$L70350:

; 101  : 		DYNBUF_ADD_STR(html, "</option>");

	push	0
	push	0
	push	9
	push	OFFSET FLAT:$SG70358
	mov	ecx, DWORD PTR _html$[ebp]
	push	ecx
	call	_dynbuf_add
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L70357
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29872], OFFSET FLAT:$SG70360
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 101		; 00000065H
	jmp	SHORT $eva_err$70238
$L70357:

; 103  : 
; 104  : 	DYNBUF_ADD_STR(html, "</select>");

	push	0
	push	0
	push	9
	push	OFFSET FLAT:$SG70363
	mov	ecx, DWORD PTR _html$[ebp]
	push	ecx
	call	_dynbuf_add
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L70362
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29872], OFFSET FLAT:$SG70365
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 104		; 00000068H
	jmp	SHORT $eva_err$70238
$L70362:
$eva_noerr$70366:

; 105  : 
; 106  : 	RETURN_OK_CLEANUP;

	push	0
	push	OFFSET FLAT:$SG70367
	push	OFFSET FLAT:$SG70368
	mov	ecx, DWORD PTR _cntxt$[ebp]
	push	ecx
	call	_err_clear
	add	esp, 16					; 00000010H
$eva_err$70238:
	mov	edx, DWORD PTR _cntxt$[ebp]
	cmp	DWORD PTR [edx+29872], 0
	je	SHORT $L70369
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	ecx, DWORD PTR [eax+29900]
	push	ecx
	push	OFFSET FLAT:$SG70370
	push	OFFSET FLAT:$SG70371
	mov	edx, DWORD PTR _cntxt$[ebp]
	push	edx
	call	_err_add_context
	add	esp, 16					; 00000010H
$L70369:
	mov	eax, DWORD PTR _cntxt$[ebp]
	xor	ecx, ecx
	cmp	DWORD PTR [eax+29872], 0
	setne	cl
	mov	eax, ecx
$L70224:

; 107  : }

	mov	esp, ebp
	pop	ebp
	ret	0
_put_html_list ENDP
_TEXT	ENDS
PUBLIC	_ctrl_add_selected_options
EXTRN	_ctrl_from_id:NEAR
EXTRN	_strcmp:NEAR
EXTRN	_ctrl_primary_handler:NEAR
EXTRN	_dyntab_field_cell:NEAR
_BSS	SEGMENT
$SG70410 DB	01H DUP (?)
	ALIGN	4

$SG70411 DB	01H DUP (?)
_BSS	ENDS
_DATA	SEGMENT
	ORG $+2
$SG70403 DB	'_EVA_LABEL', 00H
	ORG $+1
$SG70406 DB	'_EVA_VALUE', 00H
	ORG $+1
$SG70415 DB	'D:\Travail\ABI\EVA\V4.0\CGI\Brunix-2016\ctrl_input_list.'
	DB	'c', 00H
	ORG $+2
$SG70416 DB	'ctrl_add_selected_options', 00H
	ORG $+2
$SG70418 DB	'D:\Travail\ABI\EVA\V4.0\CGI\Brunix-2016\ctrl_input_list.'
	DB	'c', 00H
	ORG $+2
$SG70419 DB	'ctrl_add_selected_options', 00H
_DATA	ENDS
_TEXT	SEGMENT
_cntxt$ = 8
_i_ctrl$ = 12
_options$ = 16
_form$ = -4
_ctrl$ = -20
_i$ = -8
_j$ = -12
_i_opt$ = -16
_val$70399 = -24
_label$70401 = -32
_value$70404 = -28
_optval$70407 = -36
_ctrl_add_selected_options PROC NEAR

; 121  : ){

	push	ebp
	mov	ebp, esp
	sub	esp, 56					; 00000038H

; 122  : 	EVA_form *form = cntxt->form;

	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	ecx, DWORD PTR [eax+80]
	mov	DWORD PTR _form$[ebp], ecx

; 123  : 	EVA_ctrl *ctrl = form->ctrl + i_ctrl;

	mov	edx, DWORD PTR _i_ctrl$[ebp]
	imul	edx, 480				; 000001e0H
	mov	eax, DWORD PTR _form$[ebp]
	mov	ecx, DWORD PTR [eax]
	add	ecx, edx
	mov	DWORD PTR _ctrl$[ebp], ecx

; 124  : 	unsigned long i, j, i_opt;
; 125  : 
; 126  : 	/* Process empty option if applicable */
; 127  : 	if(ctrl->b_use_val && ctrl->i_empty && (!ctrl->val.nbrows ||
; 128  : 		(form->step == CtrlRead && ctrl->cgival.nbrows > ctrl->val.nbrows)))

	mov	edx, DWORD PTR _ctrl$[ebp]
	cmp	DWORD PTR [edx+208], 0
	je	$L70388
	mov	eax, DWORD PTR _ctrl$[ebp]
	cmp	DWORD PTR [eax+228], 0
	je	$L70388
	mov	ecx, DWORD PTR _ctrl$[ebp]
	cmp	DWORD PTR [ecx+64], 0
	je	SHORT $L70389
	mov	edx, DWORD PTR _form$[ebp]
	cmp	DWORD PTR [edx+176], 0
	jne	SHORT $L70388
	mov	eax, DWORD PTR _ctrl$[ebp]
	mov	ecx, DWORD PTR _ctrl$[ebp]
	mov	edx, DWORD PTR [eax+104]
	cmp	edx, DWORD PTR [ecx+64]
	jbe	SHORT $L70388
$L70389:

; 130  : 		form->ctrl[ctrl->i_empty].b_selected = 1;

	mov	eax, DWORD PTR _ctrl$[ebp]
	mov	ecx, DWORD PTR [eax+228]
	imul	ecx, 480				; 000001e0H
	mov	edx, DWORD PTR _form$[ebp]
	mov	eax, DWORD PTR [edx]
	mov	DWORD PTR [eax+ecx+196], 1

; 131  : 		CTRL_PRI_HDLR(ctrl->i_empty)

	mov	ecx, DWORD PTR _ctrl$[ebp]
	cmp	DWORD PTR [ecx+228], 0
	je	SHORT $L70391
	mov	edx, DWORD PTR _ctrl$[ebp]
	mov	eax, DWORD PTR [edx+228]
	push	eax
	mov	ecx, DWORD PTR _cntxt$[ebp]
	push	ecx
	call	_ctrl_primary_handler
	add	esp, 8
	test	eax, eax
	je	SHORT $L70391
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 131		; 00000083H
	jmp	$eva_err$70392
$L70391:

; 132  : 		ctrl = form->ctrl + i_ctrl;

	mov	eax, DWORD PTR _i_ctrl$[ebp]
	imul	eax, 480				; 000001e0H
	mov	ecx, DWORD PTR _form$[ebp]
	mov	edx, DWORD PTR [ecx]
	add	edx, eax
	mov	DWORD PTR _ctrl$[ebp], edx
$L70388:

; 134  : 
; 135  : 	/* For each control value */
; 136  : 	for(j = 0; j < ctrl->val.nbrows; j++)

	mov	DWORD PTR _j$[ebp], 0
	jmp	SHORT $L70393
$L70394:
	mov	eax, DWORD PTR _j$[ebp]
	add	eax, 1
	mov	DWORD PTR _j$[ebp], eax
$L70393:
	mov	ecx, DWORD PTR _ctrl$[ebp]
	mov	edx, DWORD PTR _j$[ebp]
	cmp	edx, DWORD PTR [ecx+64]
	jae	$eva_noerr$70414

; 138  : 
; 139  : 		/* Search for corresponding options */
; 140  : 		for(i = 0; i < options->nbrows; i++)

	mov	DWORD PTR _i$[ebp], 0
	jmp	SHORT $L70396
$L70397:
	mov	eax, DWORD PTR _i$[ebp]
	add	eax, 1
	mov	DWORD PTR _i$[ebp], eax
$L70396:
	mov	ecx, DWORD PTR _options$[ebp]
	mov	edx, DWORD PTR _i$[ebp]
	cmp	edx, DWORD PTR [ecx]
	jae	$L70398

; 142  : 			DynTableCell *val = dyntab_cell(&ctrl->val, j, 0);

	push	0
	mov	eax, DWORD PTR _j$[ebp]
	push	eax
	mov	ecx, DWORD PTR _ctrl$[ebp]
	add	ecx, 64					; 00000040H
	push	ecx
	call	_dyntab_cell
	add	esp, 12					; 0000000cH
	mov	DWORD PTR _val$70399[ebp], eax

; 143  : 			i_opt = ctrl_from_id(cntxt, i_ctrl, DYNTAB_VAL_SZ(options, i, 0));

	push	0
	mov	edx, DWORD PTR _i$[ebp]
	push	edx
	mov	eax, DWORD PTR _options$[ebp]
	push	eax
	call	_dyntab_sz
	add	esp, 12					; 0000000cH
	push	eax
	push	0
	mov	ecx, DWORD PTR _i$[ebp]
	push	ecx
	mov	edx, DWORD PTR _options$[ebp]
	push	edx
	call	_dyntab_val
	add	esp, 12					; 0000000cH
	push	eax
	mov	eax, DWORD PTR _i_ctrl$[ebp]
	push	eax
	mov	ecx, DWORD PTR _cntxt$[ebp]
	push	ecx
	call	_ctrl_from_id
	add	esp, 16					; 00000010H
	mov	DWORD PTR _i_opt$[ebp], eax

; 144  : 			if(i_opt)

	cmp	DWORD PTR _i_opt$[ebp], 0
	je	$L70408

; 146  : 				/* Read option label & value */
; 147  : 				DynTableCell *label = ATTR_CELL(form->ctrl + i_opt, LABEL);

	mov	edx, DWORD PTR _i_opt$[ebp]
	imul	edx, 480				; 000001e0H
	mov	eax, DWORD PTR _form$[ebp]
	mov	ecx, DWORD PTR [eax]
	add	ecx, edx
	test	ecx, ecx
	je	SHORT $L70980
	push	0
	push	-1
	push	OFFSET FLAT:$SG70403
	mov	edx, DWORD PTR _i_opt$[ebp]
	imul	edx, 480				; 000001e0H
	mov	eax, DWORD PTR _form$[ebp]
	mov	ecx, DWORD PTR [eax]
	lea	edx, DWORD PTR [ecx+edx+44]
	push	edx
	call	_dyntab_field_cell
	add	esp, 16					; 00000010H
	mov	DWORD PTR -40+[ebp], eax
	jmp	SHORT $L70981
$L70980:
	mov	DWORD PTR -40+[ebp], 0
$L70981:
	mov	eax, DWORD PTR -40+[ebp]
	mov	DWORD PTR _label$70401[ebp], eax

; 148  : 				DynTableCell *value = ATTR_CELL(form->ctrl + i_opt, VALUE);

	mov	ecx, DWORD PTR _i_opt$[ebp]
	imul	ecx, 480				; 000001e0H
	mov	edx, DWORD PTR _form$[ebp]
	mov	eax, DWORD PTR [edx]
	add	eax, ecx
	test	eax, eax
	je	SHORT $L70982
	push	0
	push	-1
	push	OFFSET FLAT:$SG70406
	mov	ecx, DWORD PTR _i_opt$[ebp]
	imul	ecx, 480				; 000001e0H
	mov	edx, DWORD PTR _form$[ebp]
	mov	eax, DWORD PTR [edx]
	lea	ecx, DWORD PTR [eax+ecx+44]
	push	ecx
	call	_dyntab_field_cell
	add	esp, 16					; 00000010H
	mov	DWORD PTR -44+[ebp], eax
	jmp	SHORT $L70983
$L70982:
	mov	DWORD PTR -44+[ebp], 0
$L70983:
	mov	edx, DWORD PTR -44+[ebp]
	mov	DWORD PTR _value$70404[ebp], edx

; 149  : 				DynTableCell *optval = ctrl->b_use_val ? value : label;

	mov	eax, DWORD PTR _ctrl$[ebp]
	cmp	DWORD PTR [eax+208], 0
	je	SHORT $L70984
	mov	ecx, DWORD PTR _value$70404[ebp]
	mov	DWORD PTR -48+[ebp], ecx
	jmp	SHORT $L70985
$L70984:
	mov	edx, DWORD PTR _label$70401[ebp]
	mov	DWORD PTR -48+[ebp], edx
$L70985:
	mov	eax, DWORD PTR -48+[ebp]
	mov	DWORD PTR _optval$70407[ebp], eax

; 150  : 
; 151  : 				/* If not already selected in CtrlRead mode (avoid multiple reads) */
; 152  : 				if((form->step != CtrlRead || !form->ctrl[i_opt].b_selected) &&
; 153  : 					!strcmp(optval ? optval->txt : "", (val && val->txt) ? val->txt : ""))

	mov	ecx, DWORD PTR _form$[ebp]
	cmp	DWORD PTR [ecx+176], 0
	jne	SHORT $L70409
	mov	edx, DWORD PTR _i_opt$[ebp]
	imul	edx, 480				; 000001e0H
	mov	eax, DWORD PTR _form$[ebp]
	mov	ecx, DWORD PTR [eax]
	cmp	DWORD PTR [ecx+edx+196], 0
	jne	$L70408
$L70409:
	cmp	DWORD PTR _val$70399[ebp], 0
	je	SHORT $L70986
	mov	edx, DWORD PTR _val$70399[ebp]
	cmp	DWORD PTR [edx], 0
	je	SHORT $L70986
	mov	eax, DWORD PTR _val$70399[ebp]
	mov	ecx, DWORD PTR [eax]
	mov	DWORD PTR -52+[ebp], ecx
	jmp	SHORT $L70987
$L70986:
	mov	DWORD PTR -52+[ebp], OFFSET FLAT:$SG70410
$L70987:
	cmp	DWORD PTR _optval$70407[ebp], 0
	je	SHORT $L70988
	mov	edx, DWORD PTR _optval$70407[ebp]
	mov	eax, DWORD PTR [edx]
	mov	DWORD PTR -56+[ebp], eax
	jmp	SHORT $L70989
$L70988:
	mov	DWORD PTR -56+[ebp], OFFSET FLAT:$SG70411
$L70989:
	mov	ecx, DWORD PTR -52+[ebp]
	push	ecx
	mov	edx, DWORD PTR -56+[ebp]
	push	edx
	call	_strcmp
	add	esp, 8
	test	eax, eax
	jne	SHORT $L70408

; 155  : 					/* Option value is same as control value : process option */
; 156  : 					form->ctrl[i_opt].b_selected = 1;

	mov	eax, DWORD PTR _i_opt$[ebp]
	imul	eax, 480				; 000001e0H
	mov	ecx, DWORD PTR _form$[ebp]
	mov	edx, DWORD PTR [ecx]
	mov	DWORD PTR [edx+eax+196], 1

; 157  : 					CTRL_PRI_HDLR(i_opt)

	cmp	DWORD PTR _i_opt$[ebp], 0
	je	SHORT $L70413
	mov	eax, DWORD PTR _i_opt$[ebp]
	push	eax
	mov	ecx, DWORD PTR _cntxt$[ebp]
	push	ecx
	call	_ctrl_primary_handler
	add	esp, 8
	test	eax, eax
	je	SHORT $L70413
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 157		; 0000009dH
	jmp	SHORT $eva_err$70392
$L70413:

; 158  : 					ctrl = form->ctrl + i_ctrl;

	mov	eax, DWORD PTR _i_ctrl$[ebp]
	imul	eax, 480				; 000001e0H
	mov	ecx, DWORD PTR _form$[ebp]
	mov	edx, DWORD PTR [ecx]
	add	edx, eax
	mov	DWORD PTR _ctrl$[ebp], edx

; 159  : 					break;

	jmp	SHORT $L70398
$L70408:

; 162  : 		}

	jmp	$L70397
$L70398:

; 163  : 	}

	jmp	$L70394
$eva_noerr$70414:

; 164  : 
; 165  : 	RETURN_OK_CLEANUP;

	push	0
	push	OFFSET FLAT:$SG70415
	push	OFFSET FLAT:$SG70416
	mov	eax, DWORD PTR _cntxt$[ebp]
	push	eax
	call	_err_clear
	add	esp, 16					; 00000010H
$eva_err$70392:
	mov	ecx, DWORD PTR _cntxt$[ebp]
	cmp	DWORD PTR [ecx+29872], 0
	je	SHORT $L70417
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	eax, DWORD PTR [edx+29900]
	push	eax
	push	OFFSET FLAT:$SG70418
	push	OFFSET FLAT:$SG70419
	mov	ecx, DWORD PTR _cntxt$[ebp]
	push	ecx
	call	_err_add_context
	add	esp, 16					; 00000010H
$L70417:
	mov	edx, DWORD PTR _cntxt$[ebp]
	xor	eax, eax
	cmp	DWORD PTR [edx+29872], 0
	setne	al

; 166  : }

	mov	esp, ebp
	pop	ebp
	ret	0
_ctrl_add_selected_options ENDP
_TEXT	ENDS
PUBLIC	_ctrl_put_html_input_list
EXTRN	_qry_obj_label:NEAR
EXTRN	_put_html_button_sz:NEAR
EXTRN	__snprintf:NEAR
EXTRN	_mem_free:NEAR
EXTRN	_strtoul:NEAR
EXTRN	_qry_obj_idfield:NEAR
EXTRN	_qry_obj_field:NEAR
EXTRN	_ctrl_cgi_name:NEAR
EXTRN	_dyntab_free:NEAR
EXTRN	_dyntab_copy:NEAR
EXTRN	_ctrl_put_hidden_old:NEAR
EXTRN	_dyntab_field_val:NEAR
_BSS	SEGMENT
	ALIGN	4

$SG70444 DB	01H DUP (?)
	ALIGN	4

$SG70449 DB	01H DUP (?)
	ALIGN	4

$SG70453 DB	01H DUP (?)
	ALIGN	4

$SG70456 DB	01H DUP (?)
_BSS	ENDS
_DATA	SEGMENT
	ORG $+2
$SG70440 DB	'No', 00H
	ORG $+1
$SG70443 DB	'_EVA_ONCHANGE', 00H
	ORG $+2
$SG70447 DB	'No', 00H
	ORG $+1
$SG70448 DB	'_EVA_NOEMPTYOPTION', 00H
	ORG $+1
$SG70451 DB	'_EVA_NONE', 00H
	ORG $+2
$SG70452 DB	'_EVA_OPENBUTTON', 00H
$SG70455 DB	'_EVA_HELPTEXT', 00H
	ORG $+2
$SG70460 DB	'_EVA_NONE', 00H
	ORG $+2
$SG70462 DB	'_EVA_UPDATE', 00H
$SG70484 DB	'<br>', 00H
	ORG $+3
$SG70486 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70491 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70498 DB	'B%s$%s#.OPENOBJ=%lu', 00H
$SG70508 DB	'_eva_open_small_s.gif', 00H
	ORG $+2
$SG70509 DB	'_eva_open_small.gif', 00H
$SG70512 DB	'_EVA_ALWAYS', 00H
$SG70513 DB	'_EVA_EDIT', 00H
	ORG $+2
$SG70515 DB	'_EVA_NOTES', 00H
	ORG $+1
$SG70518 DB	'</div>', 00H
	ORG $+1
$SG70519 DB	'<div class=EVAOptionNotes>', 00H
	ORG $+1
$SG70521 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70528 DB	'''>', 00H
	ORG $+1
$SG70529 DB	'<input type=hidden name=''', 00H
	ORG $+2
$SG70531 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70535 DB	0aH, 00H
	ORG $+2
$SG70537 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70541 DB	'D:\Travail\ABI\EVA\V4.0\CGI\Brunix-2016\ctrl_input_list.'
	DB	'c', 00H
	ORG $+2
$SG70542 DB	'ctrl_put_html_input_list', 00H
	ORG $+3
$SG70544 DB	'D:\Travail\ABI\EVA\V4.0\CGI\Brunix-2016\ctrl_input_list.'
	DB	'c', 00H
	ORG $+2
$SG70545 DB	'ctrl_put_html_input_list', 00H
_DATA	ENDS
_TEXT	SEGMENT
_cntxt$ = 8
_i_ctrl$ = 12
_optlist$ = 16
_mode$ = 20
_form$ = -28
_ctrl$ = -72
_ctrlval$ = -24
_name$ = -64
_i$ = -40
_k$ = -48
_b_multiple$ = -44
_lines$ = -36
_onchange$ = -32
_b_submit$ = -68
_b_empty$ = -52
_b_openbtn$ = -60
_helptext$ = -4
_emptylabel$ = -56
_idobj$70478 = -76
_i_opt$70480 = -80
_buf$70497 = -208
_ctrl_put_html_input_list PROC NEAR

; 184  : ){

	push	ebp
	mov	ebp, esp
	sub	esp, 268				; 0000010cH
	push	edi

; 185  : 	EVA_form *form = cntxt->form;

	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	ecx, DWORD PTR [eax+80]
	mov	DWORD PTR _form$[ebp], ecx

; 186  : 	EVA_ctrl *ctrl = form->ctrl + i_ctrl;

	mov	edx, DWORD PTR _i_ctrl$[ebp]
	imul	edx, 480				; 000001e0H
	mov	eax, DWORD PTR _form$[ebp]
	mov	ecx, DWORD PTR [eax]
	add	ecx, edx
	mov	DWORD PTR _ctrl$[ebp], ecx

; 187  : 	DynTable ctrlval = { 0 };

	mov	DWORD PTR _ctrlval$[ebp], 0
	xor	edx, edx
	mov	DWORD PTR _ctrlval$[ebp+4], edx
	mov	DWORD PTR _ctrlval$[ebp+8], edx
	mov	DWORD PTR _ctrlval$[ebp+12], edx
	mov	DWORD PTR _ctrlval$[ebp+16], edx

; 188  : 	DynBuffer *name = NULL;

	mov	DWORD PTR _name$[ebp], 0

; 189  : 	unsigned long i, k;
; 190  : 	int b_multiple = ctrl->MULTIPLE[0] != 0 && strcmp("No", ctrl->MULTIPLE);

	mov	eax, DWORD PTR _ctrl$[ebp]
	mov	ecx, DWORD PTR [eax+344]
	movsx	edx, BYTE PTR [ecx]
	test	edx, edx
	je	SHORT $L70991
	mov	eax, DWORD PTR _ctrl$[ebp]
	mov	ecx, DWORD PTR [eax+344]
	push	ecx
	push	OFFSET FLAT:$SG70440
	call	_strcmp
	add	esp, 8
	test	eax, eax
	je	SHORT $L70991
	mov	DWORD PTR -212+[ebp], 1
	jmp	SHORT $L70992
$L70991:
	mov	DWORD PTR -212+[ebp], 0
$L70992:
	mov	edx, DWORD PTR -212+[ebp]
	mov	DWORD PTR _b_multiple$[ebp], edx

; 191  : 	unsigned long lines = ctrl->LINES;

	mov	eax, DWORD PTR _ctrl$[ebp]
	mov	ecx, DWORD PTR [eax+376]
	mov	DWORD PTR _lines$[ebp], ecx

; 192  : 	char *onchange = CTRL_ATTR_VAL(ONCHANGE);

	cmp	DWORD PTR _ctrl$[ebp], 0
	je	SHORT $L70993
	push	0
	push	-1
	push	OFFSET FLAT:$SG70443
	mov	edx, DWORD PTR _ctrl$[ebp]
	add	edx, 44					; 0000002cH
	push	edx
	call	_dyntab_field_val
	add	esp, 16					; 00000010H
	mov	DWORD PTR -216+[ebp], eax
	jmp	SHORT $L70994
$L70993:
	mov	DWORD PTR -216+[ebp], OFFSET FLAT:$SG70444
$L70994:
	mov	eax, DWORD PTR -216+[ebp]
	mov	DWORD PTR _onchange$[ebp], eax

; 193  : 	int b_submit = mode & 1;

	mov	ecx, DWORD PTR _mode$[ebp]
	and	ecx, 1
	mov	DWORD PTR _b_submit$[ebp], ecx

; 194  : 	int b_empty = (strcmp("No", ctrl->ALLOWEMPTY) || !*CTRL_ATTR_VAL(NOEMPTYOPTION)) ? 1 : 0;

	mov	edx, DWORD PTR _ctrl$[ebp]
	mov	eax, DWORD PTR [edx+340]
	push	eax
	push	OFFSET FLAT:$SG70447
	call	_strcmp
	add	esp, 8
	test	eax, eax
	jne	SHORT $L70997
	cmp	DWORD PTR _ctrl$[ebp], 0
	je	SHORT $L70995
	push	0
	push	-1
	push	OFFSET FLAT:$SG70448
	mov	ecx, DWORD PTR _ctrl$[ebp]
	add	ecx, 44					; 0000002cH
	push	ecx
	call	_dyntab_field_val
	add	esp, 16					; 00000010H
	mov	DWORD PTR -220+[ebp], eax
	jmp	SHORT $L70996
$L70995:
	mov	DWORD PTR -220+[ebp], OFFSET FLAT:$SG70449
$L70996:
	mov	edx, DWORD PTR -220+[ebp]
	movsx	eax, BYTE PTR [edx]
	test	eax, eax
	je	SHORT $L70997
	mov	DWORD PTR -224+[ebp], 0
	jmp	SHORT $L70998
$L70997:
	mov	DWORD PTR -224+[ebp], 1
$L70998:
	mov	ecx, DWORD PTR -224+[ebp]
	mov	DWORD PTR _b_empty$[ebp], ecx

; 195  : 	int b_openbtn = mode & 2 && strcmp(CTRL_ATTR_VAL(OPENBUTTON), "_EVA_NONE");

	mov	edx, DWORD PTR _mode$[ebp]
	and	edx, 2
	test	edx, edx
	je	SHORT $L71001
	cmp	DWORD PTR _ctrl$[ebp], 0
	je	SHORT $L70999
	push	0
	push	-1
	push	OFFSET FLAT:$SG70452
	mov	eax, DWORD PTR _ctrl$[ebp]
	add	eax, 44					; 0000002cH
	push	eax
	call	_dyntab_field_val
	add	esp, 16					; 00000010H
	mov	DWORD PTR -228+[ebp], eax
	jmp	SHORT $L71000
$L70999:
	mov	DWORD PTR -228+[ebp], OFFSET FLAT:$SG70453
$L71000:
	push	OFFSET FLAT:$SG70451
	mov	ecx, DWORD PTR -228+[ebp]
	push	ecx
	call	_strcmp
	add	esp, 8
	test	eax, eax
	je	SHORT $L71001
	mov	DWORD PTR -232+[ebp], 1
	jmp	SHORT $L71002
$L71001:
	mov	DWORD PTR -232+[ebp], 0
$L71002:
	mov	edx, DWORD PTR -232+[ebp]
	mov	DWORD PTR _b_openbtn$[ebp], edx

; 196  : 	char *helptext  = CTRL_ATTR_VAL(HELPTEXT);

	cmp	DWORD PTR _ctrl$[ebp], 0
	je	SHORT $L71003
	push	0
	push	-1
	push	OFFSET FLAT:$SG70455
	mov	eax, DWORD PTR _ctrl$[ebp]
	add	eax, 44					; 0000002cH
	push	eax
	call	_dyntab_field_val
	add	esp, 16					; 00000010H
	mov	DWORD PTR -236+[ebp], eax
	jmp	SHORT $L71004
$L71003:
	mov	DWORD PTR -236+[ebp], OFFSET FLAT:$SG70456
$L71004:
	mov	ecx, DWORD PTR -236+[ebp]
	mov	DWORD PTR _helptext$[ebp], ecx

; 197  : 	char *emptylabel = ctrl->i_empty ? NULL : ctrl->LABEL_NOSEL;

	mov	edx, DWORD PTR _ctrl$[ebp]
	cmp	DWORD PTR [edx+228], 0
	je	SHORT $L71005
	mov	DWORD PTR -240+[ebp], 0
	jmp	SHORT $L71006
$L71005:
	mov	eax, DWORD PTR _ctrl$[ebp]
	mov	ecx, DWORD PTR [eax+348]
	mov	DWORD PTR -240+[ebp], ecx
$L71006:
	mov	edx, DWORD PTR -240+[ebp]
	mov	DWORD PTR _emptylabel$[ebp], edx

; 198  : 
; 199  : 	/* Handle ONCHANGE attribute */
; 200  : 	if(*onchange && strcmp(onchange, "_EVA_NONE")) b_submit = 1;

	mov	eax, DWORD PTR _onchange$[ebp]
	movsx	ecx, BYTE PTR [eax]
	test	ecx, ecx
	je	SHORT $L70459
	push	OFFSET FLAT:$SG70460
	mov	edx, DWORD PTR _onchange$[ebp]
	push	edx
	call	_strcmp
	add	esp, 8
	test	eax, eax
	je	SHORT $L70459
	mov	DWORD PTR _b_submit$[ebp], 1
$L70459:

; 201  : 	if(!strcmp(onchange, "_EVA_UPDATE"))

	push	OFFSET FLAT:$SG70462
	mov	eax, DWORD PTR _onchange$[ebp]
	push	eax
	call	_strcmp
	add	esp, 8

; 205  : 
; 206  : 	/* Handle special case for HTML list input with multiple selection */
; 207  : 	if(lines > 1)

	cmp	DWORD PTR _lines$[ebp], 1
	jbe	$L70463

; 209  : 		/* Put HTML list input */
; 210  : 		CTRL_CGINAMEVAL(&name, 0);

	push	0
	push	0
	push	0
	lea	ecx, DWORD PTR _name$[ebp]
	push	ecx
	push	1
	push	0
	push	0
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
	je	SHORT $L70465
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 210		; 000000d2H
	jmp	$eva_err$70466
$L70465:
	mov	eax, DWORD PTR _ctrl$[ebp]
	mov	DWORD PTR [eax+196], 1

; 211  : 		if(put_html_list(cntxt,
; 212  : 						name,
; 213  : 						optlist, &ctrl->val,
; 214  : 						lines,
; 215  : 						ctrl->COLUMNS ? ctrl->COLUMNS : b_empty,
; 216  : 						b_multiple,
; 217  : 						b_submit, 0, emptylabel))

	mov	ecx, DWORD PTR _ctrl$[ebp]
	cmp	DWORD PTR [ecx+380], 0
	je	SHORT $L71007
	mov	edx, DWORD PTR _ctrl$[ebp]
	mov	eax, DWORD PTR [edx+380]
	mov	DWORD PTR -244+[ebp], eax
	jmp	SHORT $L71008
$L71007:
	mov	ecx, DWORD PTR _b_empty$[ebp]
	mov	DWORD PTR -244+[ebp], ecx
$L71008:
	mov	edx, DWORD PTR _emptylabel$[ebp]
	push	edx
	push	0
	mov	eax, DWORD PTR _b_submit$[ebp]
	push	eax
	mov	ecx, DWORD PTR _b_multiple$[ebp]
	push	ecx
	mov	edx, DWORD PTR -244+[ebp]
	push	edx
	mov	eax, DWORD PTR _lines$[ebp]
	push	eax
	mov	ecx, DWORD PTR _ctrl$[ebp]
	add	ecx, 64					; 00000040H
	push	ecx
	mov	edx, DWORD PTR _optlist$[ebp]
	push	edx
	mov	eax, DWORD PTR _name$[ebp]
	push	eax
	mov	ecx, DWORD PTR _cntxt$[ebp]
	push	ecx
	call	_put_html_list
	add	esp, 40					; 00000028H
	test	eax, eax
	je	SHORT $L70467

; 218  : 			STACK_ERROR;

	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 218		; 000000daH
	jmp	$eva_err$70466
$L70467:

; 219  : 
; 220  : 		/* Add hidden inputs for unchanged values */
; 221  : 		for(i = 0; i < (ctrl->val.nbrows ? ctrl->val.nbrows : 1); i++)

	mov	DWORD PTR _i$[ebp], 0
	jmp	SHORT $L70468
$L70469:
	mov	eax, DWORD PTR _i$[ebp]
	add	eax, 1
	mov	DWORD PTR _i$[ebp], eax
$L70468:
	mov	ecx, DWORD PTR _ctrl$[ebp]
	cmp	DWORD PTR [ecx+64], 0
	je	SHORT $L71009
	mov	edx, DWORD PTR _ctrl$[ebp]
	mov	eax, DWORD PTR [edx+64]
	mov	DWORD PTR -248+[ebp], eax
	jmp	SHORT $L71010
$L71009:
	mov	DWORD PTR -248+[ebp], 1
$L71010:
	mov	ecx, DWORD PTR _i$[ebp]
	cmp	ecx, DWORD PTR -248+[ebp]
	jae	SHORT $L70470

; 222  : 			if(ctrl_put_hidden_old(cntxt, ctrl, i, name, NULL, 0)) STACK_ERROR;

	push	0
	push	0
	mov	edx, DWORD PTR _name$[ebp]
	push	edx
	mov	eax, DWORD PTR _i$[ebp]
	push	eax
	mov	ecx, DWORD PTR _ctrl$[ebp]
	push	ecx
	mov	edx, DWORD PTR _cntxt$[ebp]
	push	edx
	call	_ctrl_put_hidden_old
	add	esp, 24					; 00000018H
	test	eax, eax
	je	SHORT $L70472
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 222		; 000000deH
	jmp	$eva_err$70466
$L70472:
	jmp	SHORT $L70469
$L70470:

; 224  : 	else

	jmp	$L70476
$L70463:

; 226  : 		/* Add HTML list input for each value */
; 227  : 		k = ctrl->val.nbrows + (b_multiple ? 1 : 0);

	xor	ecx, ecx
	cmp	DWORD PTR _b_multiple$[ebp], 0
	setne	cl
	mov	edx, DWORD PTR _ctrl$[ebp]
	mov	eax, DWORD PTR [edx+64]
	add	eax, ecx
	mov	DWORD PTR _k$[ebp], eax

; 228  : 		for(i = 0; !i || i < k; i++)

	mov	DWORD PTR _i$[ebp], 0
	jmp	SHORT $L70474
$L70475:
	mov	ecx, DWORD PTR _i$[ebp]
	add	ecx, 1
	mov	DWORD PTR _i$[ebp], ecx
$L70474:
	cmp	DWORD PTR _i$[ebp], 0
	je	SHORT $L70477
	mov	edx, DWORD PTR _i$[ebp]
	cmp	edx, DWORD PTR _k$[ebp]
	jae	$L70476
$L70477:

; 230  : 			unsigned long idobj = DYNTAB_TOULRC(&ctrl->val, i, 0);

	push	10					; 0000000aH
	push	0
	push	0
	mov	eax, DWORD PTR _i$[ebp]
	push	eax
	mov	ecx, DWORD PTR _ctrl$[ebp]
	add	ecx, 64					; 00000040H
	push	ecx
	call	_dyntab_val
	add	esp, 12					; 0000000cH
	push	eax
	call	_strtoul
	add	esp, 12					; 0000000cH
	mov	DWORD PTR _idobj$70478[ebp], eax

; 231  : 			unsigned long i_opt;
; 232  : 
; 233  : 			/* Separate multiple values with a line break */
; 234  : 			if(i) DYNBUF_ADD_STR(form->html, "<br>");

	cmp	DWORD PTR _i$[ebp], 0
	je	SHORT $L70483
	push	0
	push	0
	push	4
	push	OFFSET FLAT:$SG70484
	mov	edx, DWORD PTR _form$[ebp]
	mov	eax, DWORD PTR [edx+232]
	push	eax
	call	_dynbuf_add
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L70483
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29872], OFFSET FLAT:$SG70486
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 234		; 000000eaH
	jmp	$eva_err$70466
$L70483:

; 235  : 
; 236  : 			/* Put HTML list input */
; 237  : 			CTRL_CGINAMEVAL(&name, i);

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
	je	SHORT $L70488
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 237		; 000000edH
	jmp	$eva_err$70466
$L70488:
	mov	eax, DWORD PTR _ctrl$[ebp]
	mov	DWORD PTR [eax+196], 1

; 238  : 			DYNTAB_SET_CELL(&ctrlval, 0, 0, &ctrl->val, i, 0);

	push	0
	push	0
	mov	ecx, DWORD PTR _i$[ebp]
	push	ecx
	mov	edx, DWORD PTR _ctrl$[ebp]
	add	edx, 64					; 00000040H
	push	edx
	call	_dyntab_cell
	add	esp, 12					; 0000000cH
	push	eax
	push	0
	push	0
	lea	eax, DWORD PTR _ctrlval$[ebp]
	push	eax
	call	_dyntab_copy
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L70489
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29872], OFFSET FLAT:$SG70491
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 238		; 000000eeH
	jmp	$eva_err$70466
$L70489:

; 239  : 			if(put_html_list(cntxt,
; 240  : 							name,
; 241  : 							optlist, (i && i == ctrl->val.nbrows) ? NULL : &ctrlval,
; 242  : 							lines,
; 243  : 							ctrl->COLUMNS ? ctrl->COLUMNS : b_empty,
; 244  : 							0,
; 245  : 							b_submit || b_multiple, 0, emptylabel) ||
; 246  : 				ctrl_put_hidden_old(cntxt, ctrl, i, name, NULL, 0))

	cmp	DWORD PTR _b_submit$[ebp], 0
	jne	SHORT $L71011
	cmp	DWORD PTR _b_multiple$[ebp], 0
	jne	SHORT $L71011
	mov	DWORD PTR -252+[ebp], 0
	jmp	SHORT $L71012
$L71011:
	mov	DWORD PTR -252+[ebp], 1
$L71012:
	mov	eax, DWORD PTR _ctrl$[ebp]
	cmp	DWORD PTR [eax+380], 0
	je	SHORT $L71013
	mov	ecx, DWORD PTR _ctrl$[ebp]
	mov	edx, DWORD PTR [ecx+380]
	mov	DWORD PTR -256+[ebp], edx
	jmp	SHORT $L71014
$L71013:
	mov	eax, DWORD PTR _b_empty$[ebp]
	mov	DWORD PTR -256+[ebp], eax
$L71014:
	cmp	DWORD PTR _i$[ebp], 0
	je	SHORT $L71015
	mov	ecx, DWORD PTR _ctrl$[ebp]
	mov	edx, DWORD PTR _i$[ebp]
	cmp	edx, DWORD PTR [ecx+64]
	jne	SHORT $L71015
	mov	DWORD PTR -260+[ebp], 0
	jmp	SHORT $L71016
$L71015:
	lea	eax, DWORD PTR _ctrlval$[ebp]
	mov	DWORD PTR -260+[ebp], eax
$L71016:
	mov	ecx, DWORD PTR _emptylabel$[ebp]
	push	ecx
	push	0
	mov	edx, DWORD PTR -252+[ebp]
	push	edx
	push	0
	mov	eax, DWORD PTR -256+[ebp]
	push	eax
	mov	ecx, DWORD PTR _lines$[ebp]
	push	ecx
	mov	edx, DWORD PTR -260+[ebp]
	push	edx
	mov	eax, DWORD PTR _optlist$[ebp]
	push	eax
	mov	ecx, DWORD PTR _name$[ebp]
	push	ecx
	mov	edx, DWORD PTR _cntxt$[ebp]
	push	edx
	call	_put_html_list
	add	esp, 40					; 00000028H
	test	eax, eax
	jne	SHORT $L70495
	push	0
	push	0
	mov	eax, DWORD PTR _name$[ebp]
	push	eax
	mov	ecx, DWORD PTR _i$[ebp]
	push	ecx
	mov	edx, DWORD PTR _ctrl$[ebp]
	push	edx
	mov	eax, DWORD PTR _cntxt$[ebp]
	push	eax
	call	_ctrl_put_hidden_old
	add	esp, 24					; 00000018H
	test	eax, eax
	je	SHORT $L70494
$L70495:

; 247  : 				STACK_ERROR;

	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 247		; 000000f7H
	jmp	$eva_err$70466
$L70494:

; 248  : 			i_opt = ctrlval.cell->col;

	mov	edx, DWORD PTR _ctrlval$[ebp+16]
	mov	eax, DWORD PTR [edx+56]
	mov	DWORD PTR _i_opt$70480[ebp], eax

; 249  : 
; 250  : 			/* Output open button if applicable */
; 251  : 			if(b_openbtn && idobj)

	cmp	DWORD PTR _b_openbtn$[ebp], 0
	je	$L70496
	cmp	DWORD PTR _idobj$70478[ebp], 0
	je	$L70496

; 253  : 				char buf[128] = {0};

	mov	BYTE PTR _buf$70497[ebp], 0
	mov	ecx, 31					; 0000001fH
	xor	eax, eax
	lea	edi, DWORD PTR _buf$70497[ebp+1]
	rep stosd
	stosw
	stosb

; 254  : 				snprintf(add_sz_str(buf), "B%s$%s#.OPENOBJ=%lu",
; 255  : 								dyntab_val(&form->id_form, 0, 0),
; 256  : 								dyntab_val(&form->id_obj, 0, 0),
; 257  : 								idobj);

	mov	ecx, DWORD PTR _idobj$70478[ebp]
	push	ecx
	push	0
	push	0
	mov	edx, DWORD PTR _form$[ebp]
	add	edx, 32					; 00000020H
	push	edx
	call	_dyntab_val
	add	esp, 12					; 0000000cH
	push	eax
	push	0
	push	0
	mov	eax, DWORD PTR _form$[ebp]
	add	eax, 12					; 0000000cH
	push	eax
	call	_dyntab_val
	add	esp, 12					; 0000000cH
	push	eax
	push	OFFSET FLAT:$SG70498
	push	127					; 0000007fH
	lea	ecx, DWORD PTR _buf$70497[ebp]
	push	ecx
	call	__snprintf
	add	esp, 24					; 00000018H

; 258  : 				M_FREE(name);

	mov	edx, DWORD PTR _name$[ebp]
	push	edx
	call	_mem_free
	add	esp, 4
	mov	DWORD PTR _name$[ebp], 0

; 259  : 				if(qry_obj_idfield(cntxt, &ctrlval, idobj, 0) ||
; 260  : 					qry_obj_label(cntxt, &name, NULL, &name, NULL, &name, NULL, NULL, NULL, 0, &ctrlval, 0) ||
; 261  : 					put_html_button(cntxt, buf, NULL, "_eva_open_small.gif", "_eva_open_small_s.gif", name->data, 0, 0))

	push	0
	mov	eax, DWORD PTR _idobj$70478[ebp]
	push	eax
	lea	ecx, DWORD PTR _ctrlval$[ebp]
	push	ecx
	mov	edx, DWORD PTR _cntxt$[ebp]
	push	edx
	call	_qry_obj_idfield
	add	esp, 16					; 00000010H
	test	eax, eax
	jne	SHORT $L70507
	push	0
	lea	eax, DWORD PTR _ctrlval$[ebp]
	push	eax
	push	0
	push	0
	push	0
	push	0
	lea	ecx, DWORD PTR _name$[ebp]
	push	ecx
	push	0
	lea	edx, DWORD PTR _name$[ebp]
	push	edx
	push	0
	lea	eax, DWORD PTR _name$[ebp]
	push	eax
	mov	ecx, DWORD PTR _cntxt$[ebp]
	push	ecx
	call	_qry_obj_label
	add	esp, 48					; 00000030H
	test	eax, eax
	jne	SHORT $L70507
	push	0
	push	0
	push	0
	push	0
	push	0
	mov	edx, DWORD PTR _name$[ebp]
	add	edx, 8
	push	edx
	push	OFFSET FLAT:$SG70508
	push	OFFSET FLAT:$SG70509
	push	0
	lea	eax, DWORD PTR _buf$70497[ebp]
	push	eax
	mov	ecx, DWORD PTR _cntxt$[ebp]
	push	ecx
	call	_put_html_button_sz
	add	esp, 44					; 0000002cH
	test	eax, eax
	je	SHORT $L70506
$L70507:

; 262  : 					STACK_ERROR;

	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 262		; 00000106H
	jmp	$eva_err$70466
$L70506:

; 263  : 				DYNTAB_FREE(ctrlval);

	lea	eax, DWORD PTR _ctrlval$[ebp]
	push	eax
	call	_dyntab_free
	add	esp, 4
$L70496:

; 265  : 
; 266  : 			/* Output option help text if applicable */
; 267  : 			if(!strcmp(helptext, "_EVA_ALWAYS") || (!strcmp(helptext, "_EVA_EDIT") && cntxt->form->step == HtmlEdit && i_opt))

	push	OFFSET FLAT:$SG70512
	mov	ecx, DWORD PTR _helptext$[ebp]
	push	ecx
	call	_strcmp
	add	esp, 8
	test	eax, eax
	je	SHORT $L70511
	push	OFFSET FLAT:$SG70513
	mov	edx, DWORD PTR _helptext$[ebp]
	push	edx
	call	_strcmp
	add	esp, 8
	test	eax, eax
	jne	$L70510
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	ecx, DWORD PTR [eax+80]
	cmp	DWORD PTR [ecx+176], 4
	jne	$L70510
	cmp	DWORD PTR _i_opt$70480[ebp], 0
	je	$L70510
$L70511:

; 269  : 				if(qry_obj_field(cntxt, &ctrlval, dyntab_cell(optlist, i_opt - 1, 0)->IdObj, "_EVA_NOTES")) STACK_ERROR;

	push	OFFSET FLAT:$SG70515
	push	0
	mov	edx, DWORD PTR _i_opt$70480[ebp]
	sub	edx, 1
	push	edx
	mov	eax, DWORD PTR _optlist$[ebp]
	push	eax
	call	_dyntab_cell
	add	esp, 12					; 0000000cH
	mov	ecx, DWORD PTR [eax+20]
	push	ecx
	lea	edx, DWORD PTR _ctrlval$[ebp]
	push	edx
	mov	eax, DWORD PTR _cntxt$[ebp]
	push	eax
	call	_qry_obj_field
	add	esp, 16					; 00000010H
	test	eax, eax
	je	SHORT $L70514
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 269		; 0000010dH
	jmp	$eva_err$70466
$L70514:

; 270  : 				if(ctrlval.nbrows)

	cmp	DWORD PTR _ctrlval$[ebp], 0
	je	SHORT $L70517

; 271  : 					DYNBUF_ADD3_CELL(cntxt->form->html, "<div class=EVAOptionNotes>", &ctrlval, 0, 0, TO_HTML, "</div>");

	push	6
	push	OFFSET FLAT:$SG70518
	push	1
	push	OFFSET FLAT:_plain_to_html
	push	0
	push	0
	lea	edx, DWORD PTR _ctrlval$[ebp]
	push	edx
	call	_dyntab_sz
	add	esp, 12					; 0000000cH
	push	eax
	push	0
	push	0
	lea	eax, DWORD PTR _ctrlval$[ebp]
	push	eax
	call	_dyntab_val
	add	esp, 12					; 0000000cH
	push	eax
	push	26					; 0000001aH
	push	OFFSET FLAT:$SG70519
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	edx, DWORD PTR [ecx+80]
	mov	eax, DWORD PTR [edx+232]
	push	eax
	call	_dynbuf_add3
	add	esp, 36					; 00000024H
	test	eax, eax
	je	SHORT $L70517
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29872], OFFSET FLAT:$SG70521
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 271		; 0000010fH
	jmp	$eva_err$70466
$L70517:

; 272  : 				DYNTAB_FREE(ctrlval);

	lea	eax, DWORD PTR _ctrlval$[ebp]
	push	eax
	call	_dyntab_free
	add	esp, 4
$L70510:

; 274  : 		}

	jmp	$L70475
$L70476:

; 276  : 
; 277  : 	if(!ctrl->val.nbrows)

	mov	ecx, DWORD PTR _ctrl$[ebp]
	cmp	DWORD PTR [ecx+64], 0
	jne	$L70539

; 279  : 		CTRL_CGINAMEVAL(&name, 0);

	push	0
	push	0
	push	0
	lea	edx, DWORD PTR _name$[ebp]
	push	edx
	push	1
	push	0
	push	0
	mov	eax, DWORD PTR _ctrl$[ebp]
	add	eax, 64					; 00000040H
	push	eax
	call	_dyntab_cell
	add	esp, 12					; 0000000cH
	push	eax
	mov	ecx, DWORD PTR _ctrl$[ebp]
	push	ecx
	mov	edx, DWORD PTR _cntxt$[ebp]
	push	edx
	call	_ctrl_cgi_name
	add	esp, 32					; 00000020H
	test	eax, eax
	je	SHORT $L70524
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 279		; 00000117H
	jmp	$eva_err$70466
$L70524:
	mov	ecx, DWORD PTR _ctrl$[ebp]
	mov	DWORD PTR [ecx+196], 1

; 280  : 		DYNBUF_ADD3_BUF(cntxt->form->html, "<input type=hidden name='", name, NO_CONV, "'>");

	cmp	DWORD PTR _name$[ebp], 0
	je	SHORT $L71017
	mov	edx, DWORD PTR _name$[ebp]
	mov	eax, DWORD PTR [edx+4]
	mov	DWORD PTR -264+[ebp], eax
	jmp	SHORT $L71018
$L71017:
	mov	DWORD PTR -264+[ebp], 0
$L71018:
	cmp	DWORD PTR _name$[ebp], 0
	je	SHORT $L71019
	mov	ecx, DWORD PTR _name$[ebp]
	add	ecx, 8
	mov	DWORD PTR -268+[ebp], ecx
	jmp	SHORT $L71020
$L71019:
	mov	DWORD PTR -268+[ebp], 0
$L71020:
	push	2
	push	OFFSET FLAT:$SG70528
	push	0
	push	0
	mov	edx, DWORD PTR -264+[ebp]
	push	edx
	mov	eax, DWORD PTR -268+[ebp]
	push	eax
	push	25					; 00000019H
	push	OFFSET FLAT:$SG70529
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	edx, DWORD PTR [ecx+80]
	mov	eax, DWORD PTR [edx+232]
	push	eax
	call	_dynbuf_add3
	add	esp, 36					; 00000024H
	test	eax, eax
	je	SHORT $L70527
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29872], OFFSET FLAT:$SG70531
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 280		; 00000118H
	jmp	$eva_err$70466
$L70527:

; 281  : 		if(cntxt->debug & DEBUG_HTML) DYNBUF_ADD_STR(cntxt->form->html, "\n");

	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	ecx, DWORD PTR [eax+29860]
	and	ecx, 128				; 00000080H
	test	ecx, ecx
	je	SHORT $L70534
	push	0
	push	0
	push	1
	push	OFFSET FLAT:$SG70535
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	eax, DWORD PTR [edx+80]
	mov	ecx, DWORD PTR [eax+232]
	push	ecx
	call	_dynbuf_add
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L70534
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29872], OFFSET FLAT:$SG70537
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 281		; 00000119H
	jmp	SHORT $eva_err$70466
$L70534:

; 282  : 		if(ctrl_put_hidden_old(cntxt, ctrl, 0, name, NULL, 0)) STACK_ERROR;

	push	0
	push	0
	mov	ecx, DWORD PTR _name$[ebp]
	push	ecx
	push	0
	mov	edx, DWORD PTR _ctrl$[ebp]
	push	edx
	mov	eax, DWORD PTR _cntxt$[ebp]
	push	eax
	call	_ctrl_put_hidden_old
	add	esp, 24					; 00000018H
	test	eax, eax
	je	SHORT $L70539
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 282		; 0000011aH
	jmp	SHORT $eva_err$70466
$L70539:
$eva_noerr$70540:

; 284  : 
; 285  : 	RETURN_OK_CLEANUP;

	push	0
	push	OFFSET FLAT:$SG70541
	push	OFFSET FLAT:$SG70542
	mov	edx, DWORD PTR _cntxt$[ebp]
	push	edx
	call	_err_clear
	add	esp, 16					; 00000010H
$eva_err$70466:
	mov	eax, DWORD PTR _cntxt$[ebp]
	cmp	DWORD PTR [eax+29872], 0
	je	SHORT $L70543
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	edx, DWORD PTR [ecx+29900]
	push	edx
	push	OFFSET FLAT:$SG70544
	push	OFFSET FLAT:$SG70545
	mov	eax, DWORD PTR _cntxt$[ebp]
	push	eax
	call	_err_add_context
	add	esp, 16					; 00000010H
$L70543:
	lea	ecx, DWORD PTR _ctrlval$[ebp]
	push	ecx
	call	_dyntab_free
	add	esp, 4
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

; 286  : }

	pop	edi
	mov	esp, ebp
	pop	ebp
	ret	0
_ctrl_put_html_input_list ENDP
_TEXT	ENDS
PUBLIC	_ctrl_add_input_list_view
EXTRN	_ctrl_format_pos:NEAR
EXTRN	_ctrl_check_access:NEAR
_BSS	SEGMENT
	ALIGN	4

$SG70585 DB	01H DUP (?)
	ALIGN	4

$SG70592 DB	01H DUP (?)
_BSS	ENDS
_DATA	SEGMENT
	ORG $+3
$SG70572 DB	'_EVA_LABEL', 00H
	ORG $+1
$SG70575 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70579 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70591 DB	'_EVA_VALUE', 00H
	ORG $+1
$SG70597 DB	'<br>', 00H
	ORG $+3
$SG70599 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70602 DB	'_EVA_LABEL', 00H
	ORG $+1
$SG70605 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70608 DB	'D:\Travail\ABI\EVA\V4.0\CGI\Brunix-2016\ctrl_input_list.'
	DB	'c', 00H
	ORG $+2
$SG70609 DB	'ctrl_add_input_list_view', 00H
	ORG $+3
$SG70611 DB	'D:\Travail\ABI\EVA\V4.0\CGI\Brunix-2016\ctrl_input_list.'
	DB	'c', 00H
	ORG $+2
$SG70612 DB	'ctrl_add_input_list_view', 00H
_DATA	ENDS
_TEXT	SEGMENT
_cntxt$ = 8
_i_ctrl$ = 12
_options$ = 16
_form$ = -4
_ctrl$ = -20
_i$ = -8
_j$ = -12
_i_opt$ = -16
_b_done$70565 = -24
_ctl$70567 = -28
__c$70570 = -32
_val$70583 = -36
_v$70584 = -40
__c$70600 = -44
_ctrl_add_input_list_view PROC NEAR

; 300  : ){

	push	ebp
	mov	ebp, esp
	sub	esp, 60					; 0000003cH

; 301  : 	EVA_form *form = cntxt->form;

	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	ecx, DWORD PTR [eax+80]
	mov	DWORD PTR _form$[ebp], ecx

; 302  : 	EVA_ctrl *ctrl = form->ctrl + i_ctrl;

	mov	edx, DWORD PTR _i_ctrl$[ebp]
	imul	edx, 480				; 000001e0H
	mov	eax, DWORD PTR _form$[ebp]
	mov	ecx, DWORD PTR [eax]
	add	ecx, edx
	mov	DWORD PTR _ctrl$[ebp], ecx

; 303  : 	unsigned long i, j, i_opt;
; 304  : 
; 305  : 	/* Add HTML code for control label & position */
; 306  : 	if(ctrl_format_pos(cntxt, ctrl, 1)) STACK_ERROR;

	push	1
	mov	edx, DWORD PTR _ctrl$[ebp]
	push	edx
	mov	eax, DWORD PTR _cntxt$[ebp]
	push	eax
	call	_ctrl_format_pos
	add	esp, 12					; 0000000cH
	test	eax, eax
	je	SHORT $L70562
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 306		; 00000132H
	jmp	$eva_err$70563
$L70562:

; 307  : 
; 308  : 	/* If no value : output empty value label if any */
; 309  : 	if(!ctrl->val.nbrows)

	mov	edx, DWORD PTR _ctrl$[ebp]
	cmp	DWORD PTR [edx+64], 0
	jne	$L70577

; 311  : 		int b_done = 0;

	mov	DWORD PTR _b_done$70565[ebp], 0

; 312  : 		if(ctrl->b_use_val && ctrl->i_empty)

	mov	eax, DWORD PTR _ctrl$[ebp]
	cmp	DWORD PTR [eax+208], 0
	je	$L70573
	mov	ecx, DWORD PTR _ctrl$[ebp]
	cmp	DWORD PTR [ecx+228], 0
	je	$L70573

; 314  : 			EVA_ctrl *ctl = form->ctrl + ctrl->i_empty;

	mov	edx, DWORD PTR _ctrl$[ebp]
	mov	eax, DWORD PTR [edx+228]
	imul	eax, 480				; 000001e0H
	mov	ecx, DWORD PTR _form$[ebp]
	mov	edx, DWORD PTR [ecx]
	add	edx, eax
	mov	DWORD PTR _ctl$70567[ebp], edx

; 315  : 			if(ctrl_check_access(cntxt, ctl)) STACK_ERROR;

	mov	eax, DWORD PTR _ctl$70567[ebp]
	push	eax
	mov	ecx, DWORD PTR _cntxt$[ebp]
	push	ecx
	call	_ctrl_check_access
	add	esp, 8
	test	eax, eax
	je	SHORT $L70568
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 315		; 0000013bH
	jmp	$eva_err$70563
$L70568:

; 316  : 			if(ctl->access != AccessNone)

	mov	eax, DWORD PTR _ctl$70567[ebp]
	cmp	DWORD PTR [eax+184], 0
	je	$L70573

; 318  : 				b_done = 1;

	mov	DWORD PTR _b_done$70565[ebp], 1

; 319  : 				DYNBUF_ADD_CELLP(form->html, ATTR_CELL(ctl, LABEL), TO_HTML);

	cmp	DWORD PTR _ctl$70567[ebp], 0
	je	SHORT $L71022
	push	0
	push	-1
	push	OFFSET FLAT:$SG70572
	mov	ecx, DWORD PTR _ctl$70567[ebp]
	add	ecx, 44					; 0000002cH
	push	ecx
	call	_dyntab_field_cell
	add	esp, 16					; 00000010H
	mov	DWORD PTR -48+[ebp], eax
	jmp	SHORT $L71023
$L71022:
	mov	DWORD PTR -48+[ebp], 0
$L71023:
	mov	edx, DWORD PTR -48+[ebp]
	mov	DWORD PTR __c$70570[ebp], edx
	cmp	DWORD PTR __c$70570[ebp], 0
	je	SHORT $L70573
	push	1
	push	OFFSET FLAT:_plain_to_html
	mov	eax, DWORD PTR __c$70570[ebp]
	mov	ecx, DWORD PTR [eax+4]
	push	ecx
	mov	edx, DWORD PTR __c$70570[ebp]
	mov	eax, DWORD PTR [edx]
	push	eax
	mov	ecx, DWORD PTR _form$[ebp]
	mov	edx, DWORD PTR [ecx+232]
	push	edx
	call	_dynbuf_add
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L70573
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29872], OFFSET FLAT:$SG70575
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 319		; 0000013fH
	jmp	$eva_err$70563
$L70573:

; 322  : 		if(!b_done && *ctrl->LABEL_NOSEL) DYNBUF_ADD(form->html, ctrl->LABEL_NOSEL, 0, TO_HTML);

	cmp	DWORD PTR _b_done$70565[ebp], 0
	jne	SHORT $L70577
	mov	edx, DWORD PTR _ctrl$[ebp]
	mov	eax, DWORD PTR [edx+348]
	movsx	ecx, BYTE PTR [eax]
	test	ecx, ecx
	je	SHORT $L70577
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
	je	SHORT $L70577
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29872], OFFSET FLAT:$SG70579
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 322		; 00000142H
	jmp	$eva_err$70563
$L70577:

; 324  : 
; 325  : 	/* For each value */
; 326  : 	for(i = 0; i < ctrl->val.nbrows; i++)

	mov	DWORD PTR _i$[ebp], 0
	jmp	SHORT $L70580
$L70581:
	mov	edx, DWORD PTR _i$[ebp]
	add	edx, 1
	mov	DWORD PTR _i$[ebp], edx
$L70580:
	mov	eax, DWORD PTR _ctrl$[ebp]
	mov	ecx, DWORD PTR _i$[ebp]
	cmp	ecx, DWORD PTR [eax+64]
	jae	$L70582

; 328  : 		DynTableCell *val = dyntab_cell(&ctrl->val, i, 0);

	push	0
	mov	edx, DWORD PTR _i$[ebp]
	push	edx
	mov	eax, DWORD PTR _ctrl$[ebp]
	add	eax, 64					; 00000040H
	push	eax
	call	_dyntab_cell
	add	esp, 12					; 0000000cH
	mov	DWORD PTR _val$70583[ebp], eax

; 329  : 		char *v = "";

	mov	DWORD PTR _v$70584[ebp], OFFSET FLAT:$SG70585

; 330  : 
; 331  : 		/* Search value in options values */
; 332  : 		j = options->nbrows;	i_opt = 0;

	mov	ecx, DWORD PTR _options$[ebp]
	mov	edx, DWORD PTR [ecx]
	mov	DWORD PTR _j$[ebp], edx
	mov	DWORD PTR _i_opt$[ebp], 0

; 333  : 		if(ctrl->b_use_val) for(j = 0; j < options->nbrows; j++)

	mov	eax, DWORD PTR _ctrl$[ebp]
	cmp	DWORD PTR [eax+208], 0
	je	$L70589
	mov	DWORD PTR _j$[ebp], 0
	jmp	SHORT $L70587
$L70588:
	mov	ecx, DWORD PTR _j$[ebp]
	add	ecx, 1
	mov	DWORD PTR _j$[ebp], ecx
$L70587:
	mov	edx, DWORD PTR _options$[ebp]
	mov	eax, DWORD PTR _j$[ebp]
	cmp	eax, DWORD PTR [edx]
	jae	$L70589

; 335  : 			i_opt = ctrl_from_id(cntxt, i_ctrl, DYNTAB_VAL_SZ(options, j, 0));

	push	0
	mov	ecx, DWORD PTR _j$[ebp]
	push	ecx
	mov	edx, DWORD PTR _options$[ebp]
	push	edx
	call	_dyntab_sz
	add	esp, 12					; 0000000cH
	push	eax
	push	0
	mov	eax, DWORD PTR _j$[ebp]
	push	eax
	mov	ecx, DWORD PTR _options$[ebp]
	push	ecx
	call	_dyntab_val
	add	esp, 12					; 0000000cH
	push	eax
	mov	edx, DWORD PTR _i_ctrl$[ebp]
	push	edx
	mov	eax, DWORD PTR _cntxt$[ebp]
	push	eax
	call	_ctrl_from_id
	add	esp, 16					; 00000010H
	mov	DWORD PTR _i_opt$[ebp], eax

; 336  : 			if(!i_opt) continue;

	cmp	DWORD PTR _i_opt$[ebp], 0
	jne	SHORT $L70590
	jmp	SHORT $L70588
$L70590:

; 337  : 			v = ATTR_VAL(form->ctrl + i_opt, VALUE);

	mov	ecx, DWORD PTR _i_opt$[ebp]
	imul	ecx, 480				; 000001e0H
	mov	edx, DWORD PTR _form$[ebp]
	mov	eax, DWORD PTR [edx]
	add	eax, ecx
	test	eax, eax
	je	SHORT $L71024
	push	0
	push	-1
	push	OFFSET FLAT:$SG70591
	mov	ecx, DWORD PTR _i_opt$[ebp]
	imul	ecx, 480				; 000001e0H
	mov	edx, DWORD PTR _form$[ebp]
	mov	eax, DWORD PTR [edx]
	lea	ecx, DWORD PTR [eax+ecx+44]
	push	ecx
	call	_dyntab_field_val
	add	esp, 16					; 00000010H
	mov	DWORD PTR -52+[ebp], eax
	jmp	SHORT $L71025
$L71024:
	mov	DWORD PTR -52+[ebp], OFFSET FLAT:$SG70592
$L71025:
	mov	edx, DWORD PTR -52+[ebp]
	mov	DWORD PTR _v$70584[ebp], edx

; 338  : 			if(*v && !strcmp(v, val->txt)) break;

	mov	eax, DWORD PTR _v$70584[ebp]
	movsx	ecx, BYTE PTR [eax]
	test	ecx, ecx
	je	SHORT $L70593
	mov	edx, DWORD PTR _val$70583[ebp]
	mov	eax, DWORD PTR [edx]
	push	eax
	mov	ecx, DWORD PTR _v$70584[ebp]
	push	ecx
	call	_strcmp
	add	esp, 8
	test	eax, eax
	jne	SHORT $L70593
	jmp	SHORT $L70589
$L70593:

; 339  : 		}

	jmp	$L70588
$L70589:

; 340  : 
; 341  : 		/* Add value */
; 342  : 		if(i) DYNBUF_ADD_STR(form->html, "<br>");

	cmp	DWORD PTR _i$[ebp], 0
	je	SHORT $L70596
	push	0
	push	0
	push	4
	push	OFFSET FLAT:$SG70597
	mov	edx, DWORD PTR _form$[ebp]
	mov	eax, DWORD PTR [edx+232]
	push	eax
	call	_dynbuf_add
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L70596
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29872], OFFSET FLAT:$SG70599
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 342		; 00000156H
	jmp	$eva_err$70563
$L70596:

; 344  : 						(j < options->nbrows ?
; 345  : 							ATTR_CELL(form->ctrl + i_opt, LABEL) :
; 346  : 							dyntab_cell(&ctrl->val, i, 0)),
; 347  : 						TO_HTML);

	mov	eax, DWORD PTR _options$[ebp]
	mov	ecx, DWORD PTR _j$[ebp]
	cmp	ecx, DWORD PTR [eax]
	jae	SHORT $L71028
	mov	edx, DWORD PTR _i_opt$[ebp]
	imul	edx, 480				; 000001e0H
	mov	eax, DWORD PTR _form$[ebp]
	mov	ecx, DWORD PTR [eax]
	add	ecx, edx
	test	ecx, ecx
	je	SHORT $L71026
	push	0
	push	-1
	push	OFFSET FLAT:$SG70602
	mov	edx, DWORD PTR _i_opt$[ebp]
	imul	edx, 480				; 000001e0H
	mov	eax, DWORD PTR _form$[ebp]
	mov	ecx, DWORD PTR [eax]
	lea	edx, DWORD PTR [ecx+edx+44]
	push	edx
	call	_dyntab_field_cell
	add	esp, 16					; 00000010H
	mov	DWORD PTR -56+[ebp], eax
	jmp	SHORT $L71027
$L71026:
	mov	DWORD PTR -56+[ebp], 0
$L71027:
	mov	eax, DWORD PTR -56+[ebp]
	mov	DWORD PTR -60+[ebp], eax
	jmp	SHORT $L71029
$L71028:
	push	0
	mov	ecx, DWORD PTR _i$[ebp]
	push	ecx
	mov	edx, DWORD PTR _ctrl$[ebp]
	add	edx, 64					; 00000040H
	push	edx
	call	_dyntab_cell
	add	esp, 12					; 0000000cH
	mov	DWORD PTR -60+[ebp], eax
$L71029:
	mov	eax, DWORD PTR -60+[ebp]
	mov	DWORD PTR __c$70600[ebp], eax
	cmp	DWORD PTR __c$70600[ebp], 0
	je	SHORT $L70603
	push	1
	push	OFFSET FLAT:_plain_to_html
	mov	ecx, DWORD PTR __c$70600[ebp]
	mov	edx, DWORD PTR [ecx+4]
	push	edx
	mov	eax, DWORD PTR __c$70600[ebp]
	mov	ecx, DWORD PTR [eax]
	push	ecx
	mov	edx, DWORD PTR _form$[ebp]
	mov	eax, DWORD PTR [edx+232]
	push	eax
	call	_dynbuf_add
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L70603
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29872], OFFSET FLAT:$SG70605
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 347		; 0000015bH
	jmp	SHORT $eva_err$70563
$L70603:

; 348  : 	}

	jmp	$L70581
$L70582:

; 349  : 
; 350  : 	/* Add HTML code for control footer */
; 351  : 	if(ctrl_format_pos(cntxt, ctrl, 0)) STACK_ERROR;

	push	0
	mov	eax, DWORD PTR _ctrl$[ebp]
	push	eax
	mov	ecx, DWORD PTR _cntxt$[ebp]
	push	ecx
	call	_ctrl_format_pos
	add	esp, 12					; 0000000cH
	test	eax, eax
	je	SHORT $eva_noerr$70607
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 351		; 0000015fH
	jmp	SHORT $eva_err$70563
$eva_noerr$70607:

; 352  : 
; 353  : 	RETURN_OK_CLEANUP;

	push	0
	push	OFFSET FLAT:$SG70608
	push	OFFSET FLAT:$SG70609
	mov	eax, DWORD PTR _cntxt$[ebp]
	push	eax
	call	_err_clear
	add	esp, 16					; 00000010H
$eva_err$70563:
	mov	ecx, DWORD PTR _cntxt$[ebp]
	cmp	DWORD PTR [ecx+29872], 0
	je	SHORT $L70610
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	eax, DWORD PTR [edx+29900]
	push	eax
	push	OFFSET FLAT:$SG70611
	push	OFFSET FLAT:$SG70612
	mov	ecx, DWORD PTR _cntxt$[ebp]
	push	ecx
	call	_err_add_context
	add	esp, 16					; 00000010H
$L70610:
	mov	edx, DWORD PTR _cntxt$[ebp]
	xor	eax, eax
	cmp	DWORD PTR [edx+29872], 0
	setne	al

; 354  : }

	mov	esp, ebp
	pop	ebp
	ret	0
_ctrl_add_input_list_view ENDP
_TEXT	ENDS
PUBLIC	_ctrl_add_input_list
EXTRN	_qsort_col0:NEAR
EXTRN	_ctrl_eval_fieldexpr:NEAR
EXTRN	_put_html_text_input:NEAR
EXTRN	_put_html_chkbox:NEAR
EXTRN	_atoi:NEAR
EXTRN	_ctrl_output_exprval:NEAR
EXTRN	_ctrl_put_hidden:NEAR
EXTRN	_dynbuf_add3_int:NEAR
EXTRN	_ctrl_add_child:NEAR
EXTRN	_ctrl_add_opt_btn:NEAR
EXTRN	_dyntab_add:NEAR
EXTRN	_dyntab_filter_field:NEAR
EXTRN	_dyntab_sort:NEAR
_BSS	SEGMENT
	ALIGN	4

$SG70734 DB	01H DUP (?)
	ALIGN	4

$SG70736 DB	01H DUP (?)
	ALIGN	4

$SG70745 DB	01H DUP (?)
	ALIGN	4

$SG70768 DB	01H DUP (?)
	ALIGN	4

$SG70779 DB	01H DUP (?)
	ALIGN	4

$SG70938 DB	01H DUP (?)
_BSS	ENDS
_DATA	SEGMENT
	ORG $+3
$SG70633 DB	'No', 00H
	ORG $+1
$SG70640 DB	'_EVA_CTRLTREE', 00H
	ORG $+2
$SG70642 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70655 DB	'_EVA_VALUE', 00H
	ORG $+1
$SG70656 DB	'_EVA_CALC', 00H
	ORG $+2
$SG70663 DB	'_EVA_NOEDIT', 00H
$SG70664 DB	'_EVA_NO_ACCESS_INHERIT', 00H
	ORG $+1
$SG70674 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70680 DB	'_EVA_CALC', 00H
	ORG $+2
$SG70692 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70696 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70701 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70705 DB	'_EVA_LABEL', 00H
	ORG $+1
$SG70708 DB	'_EVA_VALUE', 00H
	ORG $+1
$SG70712 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70715 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70719 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70721 DB	'_EVA_CALCOPTIONS', 00H
	ORG $+3
$SG70731 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70733 DB	'_EVA_ALLOW_OTHER', 00H
	ORG $+3
$SG70735 DB	'_EVA_INPUTMODE', 00H
	ORG $+1
$SG70739 DB	'_EVA_OPTIONS', 00H
	ORG $+3
$SG70740 DB	'_EVA_LIST_OPTIONS', 00H
	ORG $+2
$SG70744 DB	'_EVA_ONCHANGE', 00H
	ORG $+2
$SG70750 DB	'_EVA_NONE', 00H
	ORG $+2
$SG70756 DB	'_EVA_CTRLTREE', 00H
	ORG $+2
$SG70759 DB	'<font size=-1></b>', 00H
	ORG $+1
$SG70761 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70771 DB	'<span style="cursor:pointer" onClick="ChkLblClick(''', 00H
$SG70773 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70777 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70780 DB	''',0,', 00H
	ORG $+3
$SG70782 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70784 DB	')"><nobr>', 00H
	ORG $+2
$SG70785 DB	',', 00H
	ORG $+2
$SG70787 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70791 DB	'<b>', 00H
$SG70793 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70796 DB	'(non renseign', 0e9H, ')</b></span>', 00H
	ORG $+1
$SG70798 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70805 DB	'_EVA_CTRLTREE', 00H
	ORG $+2
$SG70817 DB	'<br>', 00H
	ORG $+3
$SG70819 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70823 DB	' ', 00H
	ORG $+2
$SG70825 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70828 DB	'<nobr>', 00H
	ORG $+1
$SG70830 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70837 DB	'<span style="cursor:pointer" onClick="ChkLblClick(''', 00H
$SG70839 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70843 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70845 DB	',', 00H
	ORG $+2
$SG70846 DB	''',', 00H
	ORG $+1
$SG70848 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70851 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70853 DB	')">', 00H
$SG70854 DB	',', 00H
	ORG $+2
$SG70856 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70860 DB	'<b>', 00H
$SG70862 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70865 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70868 DB	'</span>', 00H
$SG70870 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70874 DB	'</b>', 00H
	ORG $+3
$SG70876 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70880 DB	'</nobr>', 00H
$SG70882 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70890 DB	'<br>', 00H
	ORG $+3
$SG70892 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70899 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70902 DB	'<br>', 00H
	ORG $+3
$SG70904 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70910 DB	'</font>', 00H
$SG70912 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70918 DB	'_EVA_CTRLTREE', 00H
	ORG $+2
$SG70926 DB	'.0', 00H
	ORG $+1
$SG70928 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70931 DB	'<br>', 00H
	ORG $+3
$SG70933 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70937 DB	'_EVA_MAXLENGTH', 00H
	ORG $+1
$SG70946 DB	'D:\Travail\ABI\EVA\V4.0\CGI\Brunix-2016\ctrl_input_list.'
	DB	'c', 00H
	ORG $+2
$SG70947 DB	'ctrl_add_input_list', 00H
$SG70949 DB	'D:\Travail\ABI\EVA\V4.0\CGI\Brunix-2016\ctrl_input_list.'
	DB	'c', 00H
	ORG $+2
$SG70950 DB	'ctrl_add_input_list', 00H
_DATA	ENDS
_TEXT	SEGMENT
_b_calc$70679 = -112
_l$70703 = -120
_v$70706 = -116
_b_empty$70741 = -132
_val$70742 = -124
_onchange$70743 = -128
_k$70802 = -140
_optctrl$70803 = -136
_b_optsubmit$70804 = -148
_b_checked$70806 = -144
_val$70886 = -152
_cntxt$ = 8
_i_ctrl$ = 12
_form$ = -28
_ctrl$ = -108
_optlist$ = -104
_data$ = -56
_options$ = -24
_name$ = -80
_i$ = -64
_j$ = -68
_i_opt$ = -76
_b_submit$ = -84
_b_multiple$ = -72
_inputmode$ = -60
_allow_other$ = -36
_expr$ = -32
_empty_val$ = -4
_ctrl_add_input_list PROC NEAR

; 370  : ){

	push	ebp
	mov	ebp, esp
	sub	esp, 268				; 0000010cH

; 371  : 	EVA_form *form = cntxt->form;

	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	ecx, DWORD PTR [eax+80]
	mov	DWORD PTR _form$[ebp], ecx

; 372  : 	EVA_ctrl *ctrl = form->ctrl + i_ctrl;

	mov	edx, DWORD PTR _i_ctrl$[ebp]
	imul	edx, 480				; 000001e0H
	mov	eax, DWORD PTR _form$[ebp]
	mov	ecx, DWORD PTR [eax]
	add	ecx, edx
	mov	DWORD PTR _ctrl$[ebp], ecx

; 373  : 	DynTable optlist = { 0 };

	mov	DWORD PTR _optlist$[ebp], 0
	xor	edx, edx
	mov	DWORD PTR _optlist$[ebp+4], edx
	mov	DWORD PTR _optlist$[ebp+8], edx
	mov	DWORD PTR _optlist$[ebp+12], edx
	mov	DWORD PTR _optlist$[ebp+16], edx

; 374  : 	DynTable data = { 0 };

	mov	DWORD PTR _data$[ebp], 0
	xor	eax, eax
	mov	DWORD PTR _data$[ebp+4], eax
	mov	DWORD PTR _data$[ebp+8], eax
	mov	DWORD PTR _data$[ebp+12], eax
	mov	DWORD PTR _data$[ebp+16], eax

; 375  : 	DynTable options = { 0 };

	mov	DWORD PTR _options$[ebp], 0
	xor	ecx, ecx
	mov	DWORD PTR _options$[ebp+4], ecx
	mov	DWORD PTR _options$[ebp+8], ecx
	mov	DWORD PTR _options$[ebp+12], ecx
	mov	DWORD PTR _options$[ebp+16], ecx

; 376  : 	DynBuffer *name = NULL;

	mov	DWORD PTR _name$[ebp], 0

; 377  : 	unsigned long i, j, i_opt;
; 378  : 	int b_submit = 0;

	mov	DWORD PTR _b_submit$[ebp], 0

; 379  : 	int b_multiple = ctrl->MULTIPLE[0] != 0 && strcmp("No", ctrl->MULTIPLE);

	mov	edx, DWORD PTR _ctrl$[ebp]
	mov	eax, DWORD PTR [edx+344]
	movsx	ecx, BYTE PTR [eax]
	test	ecx, ecx
	je	SHORT $L71031
	mov	edx, DWORD PTR _ctrl$[ebp]
	mov	eax, DWORD PTR [edx+344]
	push	eax
	push	OFFSET FLAT:$SG70633
	call	_strcmp
	add	esp, 8
	test	eax, eax
	je	SHORT $L71031
	mov	DWORD PTR -156+[ebp], 1
	jmp	SHORT $L71032
$L71031:
	mov	DWORD PTR -156+[ebp], 0
$L71032:
	mov	ecx, DWORD PTR -156+[ebp]
	mov	DWORD PTR _b_multiple$[ebp], ecx

; 380  : 	char *inputmode, *allow_other;
; 381  : 	DynTableCell *expr;
; 382  : 	int empty_val = 0;

	mov	DWORD PTR _empty_val$[ebp], 0

; 383  : 
; 384  : 	/* Read control attributes */
; 385  : 	CTRL_ATTR(options, CTRLTREE);

	lea	edx, DWORD PTR _options$[ebp]
	push	edx
	call	_dyntab_free
	add	esp, 4
	push	0
	push	-1
	push	OFFSET FLAT:$SG70640
	mov	eax, DWORD PTR _ctrl$[ebp]
	add	eax, 44					; 0000002cH
	push	eax
	push	0
	lea	ecx, DWORD PTR _options$[ebp]
	push	ecx
	call	_dyntab_filter_field
	add	esp, 24					; 00000018H
	test	eax, eax
	je	SHORT $L70639
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29872], OFFSET FLAT:$SG70642
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 385		; 00000181H
	jmp	$eva_err$70643
$L70639:

; 386  : 
; 387  : 	switch(form->step)
; 388  : 	{

	mov	ecx, DWORD PTR _form$[ebp]
	mov	edx, DWORD PTR [ecx+176]
	mov	DWORD PTR -160+[ebp], edx
	cmp	DWORD PTR -160+[ebp], 7
	ja	$L70943
	mov	eax, DWORD PTR -160+[ebp]
	jmp	DWORD PTR $L71091[eax*4]
$L70648:

; 389  : 	case CtrlRead:
; 390  : 		/* Add list options */
; 391  : 		CTRL_ADD_CHILD(i_ctrl, &options);

	lea	ecx, DWORD PTR _options$[ebp]
	push	ecx
	mov	edx, DWORD PTR _i_ctrl$[ebp]
	push	edx
	mov	eax, DWORD PTR _cntxt$[ebp]
	push	eax
	call	_ctrl_add_child
	add	esp, 12					; 0000000cH
	test	eax, eax
	je	SHORT $L70649
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 391		; 00000187H
	jmp	$eva_err$70643
$L70649:
	mov	edx, DWORD PTR _i_ctrl$[ebp]
	imul	edx, 480				; 000001e0H
	mov	eax, DWORD PTR _form$[ebp]
	mov	ecx, DWORD PTR [eax]
	add	ecx, edx
	mov	DWORD PTR _ctrl$[ebp], ecx

; 392  : 		ctrl = form->ctrl + i_ctrl;

	mov	edx, DWORD PTR _i_ctrl$[ebp]
	imul	edx, 480				; 000001e0H
	mov	eax, DWORD PTR _form$[ebp]
	mov	ecx, DWORD PTR [eax]
	add	ecx, edx
	mov	DWORD PTR _ctrl$[ebp], ecx

; 393  : 
; 394  : 		/* Count empty values (used to decide the strategy for values usage) */
; 395  : 		for(i = 0; i < options.nbrows; i++)

	mov	DWORD PTR _i$[ebp], 0
	jmp	SHORT $L70650
$L70651:
	mov	edx, DWORD PTR _i$[ebp]
	add	edx, 1
	mov	DWORD PTR _i$[ebp], edx
$L70650:
	mov	eax, DWORD PTR _i$[ebp]
	cmp	eax, DWORD PTR _options$[ebp]
	jae	$L70652

; 397  : 			i_opt = ctrl_from_id(cntxt, i_ctrl, DYNTAB_VAL_SZ(&options, i, 0));

	push	0
	mov	ecx, DWORD PTR _i$[ebp]
	push	ecx
	lea	edx, DWORD PTR _options$[ebp]
	push	edx
	call	_dyntab_sz
	add	esp, 12					; 0000000cH
	push	eax
	push	0
	mov	eax, DWORD PTR _i$[ebp]
	push	eax
	lea	ecx, DWORD PTR _options$[ebp]
	push	ecx
	call	_dyntab_val
	add	esp, 12					; 0000000cH
	push	eax
	mov	edx, DWORD PTR _i_ctrl$[ebp]
	push	edx
	mov	eax, DWORD PTR _cntxt$[ebp]
	push	eax
	call	_ctrl_from_id
	add	esp, 16					; 00000010H
	mov	DWORD PTR _i_opt$[ebp], eax

; 398  : 			if(i_opt && !ATTR_CELL(form->ctrl + i_opt, VALUE) && strcmp(form->ctrl[i_opt].CONTROL, "_EVA_CALC"))

	cmp	DWORD PTR _i_opt$[ebp], 0
	je	$L70654
	mov	ecx, DWORD PTR _i_opt$[ebp]
	imul	ecx, 480				; 000001e0H
	mov	edx, DWORD PTR _form$[ebp]
	mov	eax, DWORD PTR [edx]
	add	eax, ecx
	test	eax, eax
	je	SHORT $L71033
	push	0
	push	-1
	push	OFFSET FLAT:$SG70655
	mov	ecx, DWORD PTR _i_opt$[ebp]
	imul	ecx, 480				; 000001e0H
	mov	edx, DWORD PTR _form$[ebp]
	mov	eax, DWORD PTR [edx]
	lea	ecx, DWORD PTR [eax+ecx+44]
	push	ecx
	call	_dyntab_field_cell
	add	esp, 16					; 00000010H
	mov	DWORD PTR -164+[ebp], eax
	jmp	SHORT $L71034
$L71033:
	mov	DWORD PTR -164+[ebp], 0
$L71034:
	cmp	DWORD PTR -164+[ebp], 0
	jne	SHORT $L70654
	push	OFFSET FLAT:$SG70656
	mov	edx, DWORD PTR _i_opt$[ebp]
	imul	edx, 480				; 000001e0H
	mov	eax, DWORD PTR _form$[ebp]
	mov	ecx, DWORD PTR [eax]
	mov	edx, DWORD PTR [ecx+edx+272]
	push	edx
	call	_strcmp
	add	esp, 8
	test	eax, eax
	je	SHORT $L70654

; 400  : 				ctrl->i_empty = empty_val ? 0 : i_opt;

	mov	eax, DWORD PTR _empty_val$[ebp]
	neg	eax
	sbb	eax, eax
	not	eax
	and	eax, DWORD PTR _i_opt$[ebp]
	mov	ecx, DWORD PTR _ctrl$[ebp]
	mov	DWORD PTR [ecx+228], eax

; 401  : 				empty_val++;

	mov	edx, DWORD PTR _empty_val$[ebp]
	add	edx, 1
	mov	DWORD PTR _empty_val$[ebp], edx
$L70654:

; 403  : 		}

	jmp	$L70651
$L70652:

; 404  : 		ctrl->b_use_val = !empty_val || (empty_val == 1 &&  options.nbrows > 1);

	cmp	DWORD PTR _empty_val$[ebp], 0
	je	SHORT $L71036
	cmp	DWORD PTR _empty_val$[ebp], 1
	jne	SHORT $L71035
	cmp	DWORD PTR _options$[ebp], 1
	ja	SHORT $L71036
$L71035:
	mov	DWORD PTR -168+[ebp], 0
	jmp	SHORT $L71037
$L71036:
	mov	DWORD PTR -168+[ebp], 1
$L71037:
	mov	eax, DWORD PTR _ctrl$[ebp]
	mov	ecx, DWORD PTR -168+[ebp]
	mov	DWORD PTR [eax+208], ecx

; 405  : 		break;

	jmp	$L70645
$L70657:

; 406  : 
; 407  : 	case HtmlEdit:
; 408  : 		if(!form->html) break;

	mov	edx, DWORD PTR _form$[ebp]
	cmp	DWORD PTR [edx+232], 0
	jne	SHORT $L70658
	jmp	$L70645
$L70658:

; 409  : 
; 410  : 		/* Handle no edit mode */
; 411  : 		if(CTRL_ATTR_CELL(NOEDIT) || (CTRL_ATTR_CELL(NO_ACCESS_INHERIT) && !(ctrl->access & AccessEdit)))

	cmp	DWORD PTR _ctrl$[ebp], 0
	je	SHORT $L71038
	push	0
	push	-1
	push	OFFSET FLAT:$SG70663
	mov	eax, DWORD PTR _ctrl$[ebp]
	add	eax, 44					; 0000002cH
	push	eax
	call	_dyntab_field_cell
	add	esp, 16					; 00000010H
	mov	DWORD PTR -172+[ebp], eax
	jmp	SHORT $L71039
$L71038:
	mov	DWORD PTR -172+[ebp], 0
$L71039:
	cmp	DWORD PTR -172+[ebp], 0
	jne	SHORT $L70662
	cmp	DWORD PTR _ctrl$[ebp], 0
	je	SHORT $L71040
	push	0
	push	-1
	push	OFFSET FLAT:$SG70664
	mov	ecx, DWORD PTR _ctrl$[ebp]
	add	ecx, 44					; 0000002cH
	push	ecx
	call	_dyntab_field_cell
	add	esp, 16					; 00000010H
	mov	DWORD PTR -176+[ebp], eax
	jmp	SHORT $L71041
$L71040:
	mov	DWORD PTR -176+[ebp], 0
$L71041:
	cmp	DWORD PTR -176+[ebp], 0
	je	$L70661
	mov	edx, DWORD PTR _ctrl$[ebp]
	mov	eax, DWORD PTR [edx+184]
	and	eax, 2
	test	eax, eax
	jne	SHORT $L70661
$L70662:

; 413  : 			if(ctrl_add_input_list_view(cntxt, i_ctrl, &options)) STACK_ERROR;

	lea	ecx, DWORD PTR _options$[ebp]
	push	ecx
	mov	edx, DWORD PTR _i_ctrl$[ebp]
	push	edx
	mov	eax, DWORD PTR _cntxt$[ebp]
	push	eax
	call	_ctrl_add_input_list_view
	add	esp, 12					; 0000000cH
	test	eax, eax
	je	SHORT $L70665
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 413		; 0000019dH
	jmp	$eva_err$70643
$L70665:

; 414  : 			for(i = 0; i < ctrl->val.nbrows; i++)

	mov	DWORD PTR _i$[ebp], 0
	jmp	SHORT $L70666
$L70667:
	mov	edx, DWORD PTR _i$[ebp]
	add	edx, 1
	mov	DWORD PTR _i$[ebp], edx
$L70666:
	mov	eax, DWORD PTR _ctrl$[ebp]
	mov	ecx, DWORD PTR _i$[ebp]
	cmp	ecx, DWORD PTR [eax+64]
	jae	SHORT $L70668

; 415  : 				if(ctrl_put_hidden(cntxt, ctrl, i)) STACK_ERROR;

	mov	edx, DWORD PTR _i$[ebp]
	push	edx
	mov	eax, DWORD PTR _ctrl$[ebp]
	push	eax
	mov	ecx, DWORD PTR _cntxt$[ebp]
	push	ecx
	call	_ctrl_put_hidden
	add	esp, 12					; 0000000cH
	test	eax, eax
	je	SHORT $L70669
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 415		; 0000019fH
	jmp	$eva_err$70643
$L70669:
	jmp	SHORT $L70667
$L70668:

; 416  : 			break;

	jmp	$L70645
$L70661:

; 418  : 
; 419  : 		/* Handle empty value if applicable */
; 420  : 		if(!ctrl->i_empty && *ctrl->LABEL_NOSEL)

	mov	eax, DWORD PTR _ctrl$[ebp]
	cmp	DWORD PTR [eax+228], 0
	jne	SHORT $L70670
	mov	ecx, DWORD PTR _ctrl$[ebp]
	mov	edx, DWORD PTR [ecx+348]
	movsx	eax, BYTE PTR [edx]
	test	eax, eax
	je	SHORT $L70670

; 422  : 			DYNTAB_ADD(&optlist, 0, 1, ctrl->LABEL_NOSEL, 0, NO_CONV);

	push	0
	push	0
	push	0
	mov	ecx, DWORD PTR _ctrl$[ebp]
	mov	edx, DWORD PTR [ecx+348]
	push	edx
	push	1
	push	0
	lea	eax, DWORD PTR _optlist$[ebp]
	push	eax
	call	_dyntab_add
	add	esp, 28					; 0000001cH
	test	eax, eax
	je	SHORT $L70672
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29872], OFFSET FLAT:$SG70674
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 422		; 000001a6H
	jmp	$eva_err$70643
$L70672:

; 423  : 			ctrl->b_use_val = 1;

	mov	eax, DWORD PTR _ctrl$[ebp]
	mov	DWORD PTR [eax+208], 1
$L70670:

; 425  : 
; 426  : 		/* Build list of options values & label */
; 427  : 		for(i = 0; i < options.nbrows; i++)

	mov	DWORD PTR _i$[ebp], 0
	jmp	SHORT $L70675
$L70676:
	mov	ecx, DWORD PTR _i$[ebp]
	add	ecx, 1
	mov	DWORD PTR _i$[ebp], ecx
$L70675:
	mov	edx, DWORD PTR _i$[ebp]
	cmp	edx, DWORD PTR _options$[ebp]
	jae	$L70677

; 429  : 			i_opt = ctrl_from_id(cntxt, i_ctrl, DYNTAB_VAL_SZ(&options, i, 0));

	push	0
	mov	eax, DWORD PTR _i$[ebp]
	push	eax
	lea	ecx, DWORD PTR _options$[ebp]
	push	ecx
	call	_dyntab_sz
	add	esp, 12					; 0000000cH
	push	eax
	push	0
	mov	edx, DWORD PTR _i$[ebp]
	push	edx
	lea	eax, DWORD PTR _options$[ebp]
	push	eax
	call	_dyntab_val
	add	esp, 12					; 0000000cH
	push	eax
	mov	ecx, DWORD PTR _i_ctrl$[ebp]
	push	ecx
	mov	edx, DWORD PTR _cntxt$[ebp]
	push	edx
	call	_ctrl_from_id
	add	esp, 16					; 00000010H
	mov	DWORD PTR _i_opt$[ebp], eax

; 430  : 			if(i_opt)

	cmp	DWORD PTR _i_opt$[ebp], 0
	je	$L70702

; 432  : 				/* Check access to option */
; 433  : 				int b_calc = !strcmp(form->ctrl[i_opt].CONTROL, "_EVA_CALC");

	push	OFFSET FLAT:$SG70680
	mov	eax, DWORD PTR _i_opt$[ebp]
	imul	eax, 480				; 000001e0H
	mov	ecx, DWORD PTR _form$[ebp]
	mov	edx, DWORD PTR [ecx]
	mov	eax, DWORD PTR [edx+eax+272]
	push	eax
	call	_strcmp
	add	esp, 8
	neg	eax
	sbb	eax, eax
	inc	eax
	mov	DWORD PTR _b_calc$70679[ebp], eax

; 434  : 				if(ctrl_check_access(cntxt, form->ctrl + i_opt)) STACK_ERROR;

	mov	ecx, DWORD PTR _i_opt$[ebp]
	imul	ecx, 480				; 000001e0H
	mov	edx, DWORD PTR _form$[ebp]
	mov	eax, DWORD PTR [edx]
	add	eax, ecx
	push	eax
	mov	ecx, DWORD PTR _cntxt$[ebp]
	push	ecx
	call	_ctrl_check_access
	add	esp, 8
	test	eax, eax
	je	SHORT $L70681
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 434		; 000001b2H
	jmp	$eva_err$70643
$L70681:

; 435  : 				if(( (form->ctrl[i_opt].access & AccessView) && (form->ctrl[i_opt].b_selected || b_calc) ) ||
; 436  : 					(form->ctrl[i_opt].access & AccessEdit))

	mov	eax, DWORD PTR _i_opt$[ebp]
	imul	eax, 480				; 000001e0H
	mov	ecx, DWORD PTR _form$[ebp]
	mov	edx, DWORD PTR [ecx]
	mov	eax, DWORD PTR [edx+eax+184]
	and	eax, 1
	test	eax, eax
	je	SHORT $L70684
	mov	ecx, DWORD PTR _i_opt$[ebp]
	imul	ecx, 480				; 000001e0H
	mov	edx, DWORD PTR _form$[ebp]
	mov	eax, DWORD PTR [edx]
	cmp	DWORD PTR [eax+ecx+196], 0
	jne	SHORT $L70683
	cmp	DWORD PTR _b_calc$70679[ebp], 0
	jne	SHORT $L70683
$L70684:
	mov	ecx, DWORD PTR _i_opt$[ebp]
	imul	ecx, 480				; 000001e0H
	mov	edx, DWORD PTR _form$[ebp]
	mov	eax, DWORD PTR [edx]
	mov	ecx, DWORD PTR [eax+ecx+184]
	and	ecx, 2
	test	ecx, ecx
	je	$L70702
$L70683:

; 438  : 					j = optlist.nbrows;

	mov	edx, DWORD PTR _optlist$[ebp]
	mov	DWORD PTR _j$[ebp], edx

; 439  : 					/* Handle calc-ed options from calc control */
; 440  : 					if(b_calc)

	cmp	DWORD PTR _b_calc$70679[ebp], 0
	je	$L70685

; 442  : 						if(ctrl_output_exprval(cntxt, form->ctrl + i_opt, 3)) STACK_ERROR;

	push	3
	mov	eax, DWORD PTR _i_opt$[ebp]
	imul	eax, 480				; 000001e0H
	mov	ecx, DWORD PTR _form$[ebp]
	mov	edx, DWORD PTR [ecx]
	add	edx, eax
	push	edx
	mov	eax, DWORD PTR _cntxt$[ebp]
	push	eax
	call	_ctrl_output_exprval
	add	esp, 12					; 0000000cH
	test	eax, eax
	je	SHORT $L70686
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 442		; 000001baH
	jmp	$eva_err$70643
$L70686:

; 443  : 						ctrl->b_use_val |= form->ctrl[i_opt].val.nbcols > 1 || (optlist.nbrows == 2 && !dyntab_sz(&optlist,0, 1));

	mov	edx, DWORD PTR _i_opt$[ebp]
	imul	edx, 480				; 000001e0H
	mov	eax, DWORD PTR _form$[ebp]
	mov	ecx, DWORD PTR [eax]
	cmp	DWORD PTR [ecx+edx+72], 1
	ja	SHORT $L71043
	cmp	DWORD PTR _optlist$[ebp], 2
	jne	SHORT $L71042
	push	1
	push	0
	lea	edx, DWORD PTR _optlist$[ebp]
	push	edx
	call	_dyntab_sz
	add	esp, 12					; 0000000cH
	test	eax, eax
	je	SHORT $L71043
$L71042:
	mov	DWORD PTR -180+[ebp], 0
	jmp	SHORT $L71044
$L71043:
	mov	DWORD PTR -180+[ebp], 1
$L71044:
	mov	eax, DWORD PTR _ctrl$[ebp]
	mov	ecx, DWORD PTR [eax+208]
	or	ecx, DWORD PTR -180+[ebp]
	mov	edx, DWORD PTR _ctrl$[ebp]
	mov	DWORD PTR [edx+208], ecx

; 444  : 						for(j = 0; j < form->ctrl[i_opt].val.nbrows; j++)

	mov	DWORD PTR _j$[ebp], 0
	jmp	SHORT $L70687
$L70688:
	mov	eax, DWORD PTR _j$[ebp]
	add	eax, 1
	mov	DWORD PTR _j$[ebp], eax
$L70687:
	mov	ecx, DWORD PTR _i_opt$[ebp]
	imul	ecx, 480				; 000001e0H
	mov	edx, DWORD PTR _form$[ebp]
	mov	eax, DWORD PTR [edx]
	mov	edx, DWORD PTR _j$[ebp]
	cmp	edx, DWORD PTR [eax+ecx+64]
	jae	$L70689

; 446  : 							DYNTAB_SET_CELL(&optlist, optlist.nbrows, 0, &form->ctrl[i_opt].val, j, 0);

	push	0
	push	0
	mov	eax, DWORD PTR _j$[ebp]
	push	eax
	mov	ecx, DWORD PTR _i_opt$[ebp]
	imul	ecx, 480				; 000001e0H
	mov	edx, DWORD PTR _form$[ebp]
	mov	eax, DWORD PTR [edx]
	lea	ecx, DWORD PTR [eax+ecx+64]
	push	ecx
	call	_dyntab_cell
	add	esp, 12					; 0000000cH
	push	eax
	push	0
	mov	edx, DWORD PTR _optlist$[ebp]
	push	edx
	lea	eax, DWORD PTR _optlist$[ebp]
	push	eax
	call	_dyntab_copy
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L70690
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29872], OFFSET FLAT:$SG70692
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 446		; 000001beH
	jmp	$eva_err$70643
$L70690:

; 447  : 							if(ctrl->b_use_val && form->ctrl[i_opt].val.nbcols > 1)

	mov	eax, DWORD PTR _ctrl$[ebp]
	cmp	DWORD PTR [eax+208], 0
	je	SHORT $L70693
	mov	ecx, DWORD PTR _i_opt$[ebp]
	imul	ecx, 480				; 000001e0H
	mov	edx, DWORD PTR _form$[ebp]
	mov	eax, DWORD PTR [edx]
	cmp	DWORD PTR [eax+ecx+72], 1
	jbe	SHORT $L70693

; 448  : 								DYNTAB_SET_CELL(&optlist, optlist.nbrows - 1, 1, &form->ctrl[i_opt].val, j, 1)

	push	0
	push	1
	mov	ecx, DWORD PTR _j$[ebp]
	push	ecx
	mov	edx, DWORD PTR _i_opt$[ebp]
	imul	edx, 480				; 000001e0H
	mov	eax, DWORD PTR _form$[ebp]
	mov	ecx, DWORD PTR [eax]
	lea	edx, DWORD PTR [ecx+edx+64]
	push	edx
	call	_dyntab_cell
	add	esp, 12					; 0000000cH
	push	eax
	push	1
	mov	eax, DWORD PTR _optlist$[ebp]
	sub	eax, 1
	push	eax
	lea	ecx, DWORD PTR _optlist$[ebp]
	push	ecx
	call	_dyntab_copy
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L70694
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29872], OFFSET FLAT:$SG70696
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 448		; 000001c0H
	jmp	$eva_err$70643
$L70694:

; 449  : 							else if(ctrl->b_use_val)

	jmp	SHORT $L70699
$L70693:
	mov	ecx, DWORD PTR _ctrl$[ebp]
	cmp	DWORD PTR [ecx+208], 0
	je	SHORT $L70699

; 450  : 								DYNTAB_SET_CELL(&optlist, optlist.nbrows - 1, 1, &form->ctrl[i_opt].val, j, 0);

	push	0
	push	0
	mov	edx, DWORD PTR _j$[ebp]
	push	edx
	mov	eax, DWORD PTR _i_opt$[ebp]
	imul	eax, 480				; 000001e0H
	mov	ecx, DWORD PTR _form$[ebp]
	mov	edx, DWORD PTR [ecx]
	lea	eax, DWORD PTR [edx+eax+64]
	push	eax
	call	_dyntab_cell
	add	esp, 12					; 0000000cH
	push	eax
	push	1
	mov	ecx, DWORD PTR _optlist$[ebp]
	sub	ecx, 1
	push	ecx
	lea	edx, DWORD PTR _optlist$[ebp]
	push	edx
	call	_dyntab_copy
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L70699
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29872], OFFSET FLAT:$SG70701
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 450		; 000001c2H
	jmp	$eva_err$70643
$L70699:

; 451  : 						}

	jmp	$L70688
$L70689:

; 453  : 					else

	jmp	$L70702
$L70685:

; 455  : 						DynTableCell *l = ATTR_CELL(form->ctrl + i_opt, LABEL), *v = ATTR_CELL(form->ctrl + i_opt, VALUE);

	mov	edx, DWORD PTR _i_opt$[ebp]
	imul	edx, 480				; 000001e0H
	mov	eax, DWORD PTR _form$[ebp]
	mov	ecx, DWORD PTR [eax]
	add	ecx, edx
	test	ecx, ecx
	je	SHORT $L71045
	push	0
	push	-1
	push	OFFSET FLAT:$SG70705
	mov	edx, DWORD PTR _i_opt$[ebp]
	imul	edx, 480				; 000001e0H
	mov	eax, DWORD PTR _form$[ebp]
	mov	ecx, DWORD PTR [eax]
	lea	edx, DWORD PTR [ecx+edx+44]
	push	edx
	call	_dyntab_field_cell
	add	esp, 16					; 00000010H
	mov	DWORD PTR -184+[ebp], eax
	jmp	SHORT $L71046
$L71045:
	mov	DWORD PTR -184+[ebp], 0
$L71046:
	mov	eax, DWORD PTR -184+[ebp]
	mov	DWORD PTR _l$70703[ebp], eax
	mov	ecx, DWORD PTR _i_opt$[ebp]
	imul	ecx, 480				; 000001e0H
	mov	edx, DWORD PTR _form$[ebp]
	mov	eax, DWORD PTR [edx]
	add	eax, ecx
	test	eax, eax
	je	SHORT $L71047
	push	0
	push	-1
	push	OFFSET FLAT:$SG70708
	mov	ecx, DWORD PTR _i_opt$[ebp]
	imul	ecx, 480				; 000001e0H
	mov	edx, DWORD PTR _form$[ebp]
	mov	eax, DWORD PTR [edx]
	lea	ecx, DWORD PTR [eax+ecx+44]
	push	ecx
	call	_dyntab_field_cell
	add	esp, 16					; 00000010H
	mov	DWORD PTR -188+[ebp], eax
	jmp	SHORT $L71048
$L71047:
	mov	DWORD PTR -188+[ebp], 0
$L71048:
	mov	edx, DWORD PTR -188+[ebp]
	mov	DWORD PTR _v$70706[ebp], edx

; 456  : 						if(ctrl->b_use_val)

	mov	eax, DWORD PTR _ctrl$[ebp]
	cmp	DWORD PTR [eax+208], 0
	je	$L70709

; 458  : 							DYNTAB_SET_CELLP(&optlist, j, 1, l);

	push	0
	mov	ecx, DWORD PTR _l$70703[ebp]
	push	ecx
	push	1
	mov	edx, DWORD PTR _j$[ebp]
	push	edx
	lea	eax, DWORD PTR _optlist$[ebp]
	push	eax
	call	_dyntab_copy
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L70710
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29872], OFFSET FLAT:$SG70712
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 458		; 000001caH
	jmp	$eva_err$70643
$L70710:

; 459  : 							DYNTAB_SET_CELLP(&optlist, j, 0, (v || i_opt == ctrl->i_empty ? v : l));

	cmp	DWORD PTR _v$70706[ebp], 0
	jne	SHORT $L71049
	mov	eax, DWORD PTR _ctrl$[ebp]
	mov	ecx, DWORD PTR _i_opt$[ebp]
	cmp	ecx, DWORD PTR [eax+228]
	je	SHORT $L71049
	mov	edx, DWORD PTR _l$70703[ebp]
	mov	DWORD PTR -192+[ebp], edx
	jmp	SHORT $L71050
$L71049:
	mov	eax, DWORD PTR _v$70706[ebp]
	mov	DWORD PTR -192+[ebp], eax
$L71050:
	push	0
	mov	ecx, DWORD PTR -192+[ebp]
	push	ecx
	push	0
	mov	edx, DWORD PTR _j$[ebp]
	push	edx
	lea	eax, DWORD PTR _optlist$[ebp]
	push	eax
	call	_dyntab_copy
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L70713
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29872], OFFSET FLAT:$SG70715
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 459		; 000001cbH
	jmp	$eva_err$70643
$L70713:

; 461  : 						else

	jmp	SHORT $L70717
$L70709:

; 462  : 							DYNTAB_SET_CELLP(&optlist, j, 0, l);

	push	0
	mov	eax, DWORD PTR _l$70703[ebp]
	push	eax
	push	0
	mov	ecx, DWORD PTR _j$[ebp]
	push	ecx
	lea	edx, DWORD PTR _optlist$[ebp]
	push	edx
	call	_dyntab_copy
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L70717
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29872], OFFSET FLAT:$SG70719
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 462		; 000001ceH
	jmp	$eva_err$70643
$L70717:

; 463  : 						dyntab_cell(&optlist, j, 0)->row = i_opt;

	push	0
	mov	edx, DWORD PTR _j$[ebp]
	push	edx
	lea	eax, DWORD PTR _optlist$[ebp]
	push	eax
	call	_dyntab_cell
	add	esp, 12					; 0000000cH
	mov	ecx, DWORD PTR _i_opt$[ebp]
	mov	DWORD PTR [eax+60], ecx
$L70702:

; 467  : 		}

	jmp	$L70676
$L70677:

; 468  : 
; 469  : 		/* Add calc-ed options */
; 470  : 		expr = CTRL_ATTR_CELL(CALCOPTIONS);

	cmp	DWORD PTR _ctrl$[ebp], 0
	je	SHORT $L71051
	push	0
	push	-1
	push	OFFSET FLAT:$SG70721
	mov	edx, DWORD PTR _ctrl$[ebp]
	add	edx, 44					; 0000002cH
	push	edx
	call	_dyntab_field_cell
	add	esp, 16					; 00000010H
	mov	DWORD PTR -196+[ebp], eax
	jmp	SHORT $L71052
$L71051:
	mov	DWORD PTR -196+[ebp], 0
$L71052:
	mov	eax, DWORD PTR -196+[ebp]
	mov	DWORD PTR _expr$[ebp], eax

; 471  : 		if(expr)

	cmp	DWORD PTR _expr$[ebp], 0
	je	$L70726

; 473  : 			if(ctrl_eval_fieldexpr(cntxt, ctrl, &data, expr->txt)) STACK_ERROR;

	mov	ecx, DWORD PTR _expr$[ebp]
	mov	edx, DWORD PTR [ecx]
	push	edx
	lea	eax, DWORD PTR _data$[ebp]
	push	eax
	mov	ecx, DWORD PTR _ctrl$[ebp]
	push	ecx
	mov	edx, DWORD PTR _cntxt$[ebp]
	push	edx
	call	_ctrl_eval_fieldexpr
	add	esp, 16					; 00000010H
	test	eax, eax
	je	SHORT $L70723
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 473		; 000001d9H
	jmp	$eva_err$70643
$L70723:

; 474  : 			dyntab_sort(&data, qsort_col0);

	push	OFFSET FLAT:_qsort_col0
	lea	ecx, DWORD PTR _data$[ebp]
	push	ecx
	call	_dyntab_sort
	add	esp, 8

; 475  : 			for(i = 0; i < data.nbrows; i++)

	mov	DWORD PTR _i$[ebp], 0
	jmp	SHORT $L70724
$L70725:
	mov	edx, DWORD PTR _i$[ebp]
	add	edx, 1
	mov	DWORD PTR _i$[ebp], edx
$L70724:
	mov	eax, DWORD PTR _i$[ebp]
	cmp	eax, DWORD PTR _data$[ebp]
	jae	SHORT $L70726

; 476  : 				if(!i || dyntab_cmp(&data, i - 1, 0, &data, i, 0))

	cmp	DWORD PTR _i$[ebp], 0
	je	SHORT $L70728
	push	0
	mov	ecx, DWORD PTR _i$[ebp]
	push	ecx
	lea	edx, DWORD PTR _data$[ebp]
	push	edx
	push	0
	mov	eax, DWORD PTR _i$[ebp]
	sub	eax, 1
	push	eax
	lea	ecx, DWORD PTR _data$[ebp]
	push	ecx
	call	_dyntab_cmp
	add	esp, 24					; 00000018H
	test	eax, eax
	je	SHORT $L70729
$L70728:

; 477  : 					DYNTAB_ADD_CELL(&optlist, optlist.nbrows, 0, &data, i, 0);

	push	1
	push	0
	mov	edx, DWORD PTR _i$[ebp]
	push	edx
	lea	eax, DWORD PTR _data$[ebp]
	push	eax
	call	_dyntab_cell
	add	esp, 12					; 0000000cH
	push	eax
	push	0
	mov	ecx, DWORD PTR _optlist$[ebp]
	push	ecx
	lea	edx, DWORD PTR _optlist$[ebp]
	push	edx
	call	_dyntab_copy
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L70729
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29872], OFFSET FLAT:$SG70731
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 477		; 000001ddH
	jmp	$eva_err$70643
$L70729:
	jmp	$L70725
$L70726:

; 479  : 
; 480  : 		/* Add control header */
; 481  : 		if(ctrl_format_pos(cntxt, ctrl, 1)) STACK_ERROR;

	push	1
	mov	edx, DWORD PTR _ctrl$[ebp]
	push	edx
	mov	eax, DWORD PTR _cntxt$[ebp]
	push	eax
	call	_ctrl_format_pos
	add	esp, 12					; 0000000cH
	test	eax, eax
	je	SHORT $L70732
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 481		; 000001e1H
	jmp	$eva_err$70643
$L70732:

; 482  : 
; 483  : 		/* Handle input mode */
; 484  : 		allow_other = CTRL_ATTR_VAL(ALLOW_OTHER);

	cmp	DWORD PTR _ctrl$[ebp], 0
	je	SHORT $L71053
	push	0
	push	-1
	push	OFFSET FLAT:$SG70733
	mov	edx, DWORD PTR _ctrl$[ebp]
	add	edx, 44					; 0000002cH
	push	edx
	call	_dyntab_field_val
	add	esp, 16					; 00000010H
	mov	DWORD PTR -200+[ebp], eax
	jmp	SHORT $L71054
$L71053:
	mov	DWORD PTR -200+[ebp], OFFSET FLAT:$SG70734
$L71054:
	mov	eax, DWORD PTR -200+[ebp]
	mov	DWORD PTR _allow_other$[ebp], eax

; 485  : 		inputmode = CTRL_ATTR_VAL(INPUTMODE);

	cmp	DWORD PTR _ctrl$[ebp], 0
	je	SHORT $L71055
	push	0
	push	-1
	push	OFFSET FLAT:$SG70735
	mov	ecx, DWORD PTR _ctrl$[ebp]
	add	ecx, 44					; 0000002cH
	push	ecx
	call	_dyntab_field_val
	add	esp, 16					; 00000010H
	mov	DWORD PTR -204+[ebp], eax
	jmp	SHORT $L71056
$L71055:
	mov	DWORD PTR -204+[ebp], OFFSET FLAT:$SG70736
$L71056:
	mov	edx, DWORD PTR -204+[ebp]
	mov	DWORD PTR _inputmode$[ebp], edx

; 486  : 		if(!strcmp(inputmode, "_EVA_OPTIONS") || !strcmp(inputmode, "_EVA_LIST_OPTIONS"))

	push	OFFSET FLAT:$SG70739
	mov	eax, DWORD PTR _inputmode$[ebp]
	push	eax
	call	_strcmp
	add	esp, 8
	test	eax, eax
	je	SHORT $L70738
	push	OFFSET FLAT:$SG70740
	mov	ecx, DWORD PTR _inputmode$[ebp]
	push	ecx
	call	_strcmp
	add	esp, 8
	test	eax, eax
	jne	$L70737
$L70738:

; 488  : 			/* Options list : build CGI name for options */
; 489  : 			int b_empty = 0;

	mov	DWORD PTR _b_empty$70741[ebp], 0

; 490  : 			DynTableCell *val;
; 491  : 			char *onchange = CTRL_ATTR_VAL(ONCHANGE);

	cmp	DWORD PTR _ctrl$[ebp], 0
	je	SHORT $L71057
	push	0
	push	-1
	push	OFFSET FLAT:$SG70744
	mov	edx, DWORD PTR _ctrl$[ebp]
	add	edx, 44					; 0000002cH
	push	edx
	call	_dyntab_field_val
	add	esp, 16					; 00000010H
	mov	DWORD PTR -208+[ebp], eax
	jmp	SHORT $L71058
$L71057:
	mov	DWORD PTR -208+[ebp], OFFSET FLAT:$SG70745
$L71058:
	mov	eax, DWORD PTR -208+[ebp]
	mov	DWORD PTR _onchange$70743[ebp], eax

; 492  : 			if(ctrl_cgi_name(cntxt, ctrl, NULL, 0, &name, 0, NULL, 0)) STACK_ERROR;

	push	0
	push	0
	push	0
	lea	ecx, DWORD PTR _name$[ebp]
	push	ecx
	push	0
	push	0
	mov	edx, DWORD PTR _ctrl$[ebp]
	push	edx
	mov	eax, DWORD PTR _cntxt$[ebp]
	push	eax
	call	_ctrl_cgi_name
	add	esp, 32					; 00000020H
	test	eax, eax
	je	SHORT $L70748
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 492		; 000001ecH
	jmp	$eva_err$70643
$L70748:

; 493  : 			ctrl->b_selected = 1;

	mov	edx, DWORD PTR _ctrl$[ebp]
	mov	DWORD PTR [edx+196], 1

; 494  : 			if(ctrl->val.nbrows > 1) b_multiple = 1;

	mov	eax, DWORD PTR _ctrl$[ebp]
	cmp	DWORD PTR [eax+64], 1
	jbe	SHORT $L70749
	mov	DWORD PTR _b_multiple$[ebp], 1
$L70749:

; 495  : 
; 496  : 			/* Handle submit on change  */
; 497  : 			b_submit = *onchange && strcmp(onchange, "_EVA_NONE");

	mov	ecx, DWORD PTR _onchange$70743[ebp]
	movsx	edx, BYTE PTR [ecx]
	test	edx, edx
	je	SHORT $L71059
	push	OFFSET FLAT:$SG70750
	mov	eax, DWORD PTR _onchange$70743[ebp]
	push	eax
	call	_strcmp
	add	esp, 8
	test	eax, eax
	je	SHORT $L71059
	mov	DWORD PTR -212+[ebp], 1
	jmp	SHORT $L71060
$L71059:
	mov	DWORD PTR -212+[ebp], 0
$L71060:
	mov	ecx, DWORD PTR -212+[ebp]
	mov	DWORD PTR _b_submit$[ebp], ecx

; 498  : 			if(!b_multiple) for(i = ctrl->i_child; !b_submit && i; i = form->ctrl[i].i_brother)

	cmp	DWORD PTR _b_multiple$[ebp], 0
	jne	$L70754
	mov	edx, DWORD PTR _ctrl$[ebp]
	mov	eax, DWORD PTR [edx+24]
	mov	DWORD PTR _i$[ebp], eax
	jmp	SHORT $L70752
$L70753:
	mov	ecx, DWORD PTR _i$[ebp]
	imul	ecx, 480				; 000001e0H
	mov	edx, DWORD PTR _form$[ebp]
	mov	eax, DWORD PTR [edx]
	mov	ecx, DWORD PTR [eax+ecx+28]
	mov	DWORD PTR _i$[ebp], ecx
$L70752:
	cmp	DWORD PTR _b_submit$[ebp], 0
	jne	SHORT $L70754
	cmp	DWORD PTR _i$[ebp], 0
	je	SHORT $L70754

; 499  : 				b_submit |= ATTR_CELL(form->ctrl + i, CTRLTREE) != 0;

	mov	edx, DWORD PTR _i$[ebp]
	imul	edx, 480				; 000001e0H
	mov	eax, DWORD PTR _form$[ebp]
	mov	ecx, DWORD PTR [eax]
	add	ecx, edx
	test	ecx, ecx
	je	SHORT $L71061
	push	0
	push	-1
	push	OFFSET FLAT:$SG70756
	mov	edx, DWORD PTR _i$[ebp]
	imul	edx, 480				; 000001e0H
	mov	eax, DWORD PTR _form$[ebp]
	mov	ecx, DWORD PTR [eax]
	lea	edx, DWORD PTR [ecx+edx+44]
	push	edx
	call	_dyntab_field_cell
	add	esp, 16					; 00000010H
	mov	DWORD PTR -216+[ebp], eax
	jmp	SHORT $L71062
$L71061:
	mov	DWORD PTR -216+[ebp], 0
$L71062:
	xor	eax, eax
	cmp	DWORD PTR -216+[ebp], 0
	setne	al
	mov	ecx, DWORD PTR _b_submit$[ebp]
	or	ecx, eax
	mov	DWORD PTR _b_submit$[ebp], ecx
	jmp	$L70753
$L70754:

; 500  : 
; 501  : 			/* Output empty option if applicable */
; 502  : 			DYNBUF_ADD_STR(form->html, "<font size=-1></b>");

	push	0
	push	0
	push	18					; 00000012H
	push	OFFSET FLAT:$SG70759
	mov	edx, DWORD PTR _form$[ebp]
	mov	eax, DWORD PTR [edx+232]
	push	eax
	call	_dynbuf_add
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L70758
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29872], OFFSET FLAT:$SG70761
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 502		; 000001f6H
	jmp	$eva_err$70643
$L70758:

; 503  : 			for(i = 0; i < optlist.nbrows && dyntab_sz(&optlist, i, 0); i++);

	mov	DWORD PTR _i$[ebp], 0
	jmp	SHORT $L70762
$L70763:
	mov	eax, DWORD PTR _i$[ebp]
	add	eax, 1
	mov	DWORD PTR _i$[ebp], eax
$L70762:
	mov	ecx, DWORD PTR _i$[ebp]
	cmp	ecx, DWORD PTR _optlist$[ebp]
	jae	SHORT $L70764
	push	0
	mov	edx, DWORD PTR _i$[ebp]
	push	edx
	lea	eax, DWORD PTR _optlist$[ebp]
	push	eax
	call	_dyntab_sz
	add	esp, 12					; 0000000cH
	test	eax, eax
	je	SHORT $L70764
	jmp	SHORT $L70763
$L70764:

; 504  : 			if(!ctrl->b_use_val && i == optlist.nbrows && !b_multiple && !*ctrl->ALLOWEMPTY)

	mov	ecx, DWORD PTR _ctrl$[ebp]
	cmp	DWORD PTR [ecx+208], 0
	jne	$L70795
	mov	edx, DWORD PTR _i$[ebp]
	cmp	edx, DWORD PTR _optlist$[ebp]
	jne	$L70795
	cmp	DWORD PTR _b_multiple$[ebp], 0
	jne	$L70795
	mov	eax, DWORD PTR _ctrl$[ebp]
	mov	ecx, DWORD PTR [eax+340]
	movsx	edx, BYTE PTR [ecx]
	test	edx, edx
	jne	$L70795

; 506  : 				b_empty = 1;

	mov	DWORD PTR _b_empty$70741[ebp], 1

; 507  : 				if(put_html_chkbox(cntxt, DYNBUF_VAL_SZ(name), "", 0,
; 508  : 					(ctrl->val.nbrows ? 0 : 1) + (b_multiple ? 0 : 2), b_submit)) STACK_ERROR;

	cmp	DWORD PTR _name$[ebp], 0
	je	SHORT $L71063
	mov	eax, DWORD PTR _name$[ebp]
	mov	ecx, DWORD PTR [eax+4]
	mov	DWORD PTR -220+[ebp], ecx
	jmp	SHORT $L71064
$L71063:
	mov	DWORD PTR -220+[ebp], 0
$L71064:
	cmp	DWORD PTR _name$[ebp], 0
	je	SHORT $L71065
	mov	edx, DWORD PTR _name$[ebp]
	add	edx, 8
	mov	DWORD PTR -224+[ebp], edx
	jmp	SHORT $L71066
$L71065:
	mov	DWORD PTR -224+[ebp], 0
$L71066:
	mov	eax, DWORD PTR _b_submit$[ebp]
	push	eax
	mov	ecx, DWORD PTR _ctrl$[ebp]
	xor	edx, edx
	cmp	DWORD PTR [ecx+64], 0
	sete	dl
	mov	eax, DWORD PTR _b_multiple$[ebp]
	neg	eax
	sbb	eax, eax
	and	al, -2					; fffffffeH
	add	eax, 2
	add	edx, eax
	push	edx
	push	0
	push	OFFSET FLAT:$SG70768
	mov	ecx, DWORD PTR -220+[ebp]
	push	ecx
	mov	edx, DWORD PTR -224+[ebp]
	push	edx
	mov	eax, DWORD PTR _cntxt$[ebp]
	push	eax
	call	_put_html_chkbox
	add	esp, 28					; 0000001cH
	test	eax, eax
	je	SHORT $L70767
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 508		; 000001fcH
	jmp	$eva_err$70643
$L70767:

; 509  : 				DYNBUF_ADD_STR(form->html, "<span style=\"cursor:pointer\" onClick=\"ChkLblClick('");

	push	0
	push	0
	push	51					; 00000033H
	push	OFFSET FLAT:$SG70771
	mov	edx, DWORD PTR _form$[ebp]
	mov	eax, DWORD PTR [edx+232]
	push	eax
	call	_dynbuf_add
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L70770
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29872], OFFSET FLAT:$SG70773
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 509		; 000001fdH
	jmp	$eva_err$70643
$L70770:

; 510  : 				DYNBUF_ADD_BUF(form->html, name, NO_CONV);

	cmp	DWORD PTR _name$[ebp], 0
	je	SHORT $L70775
	push	0
	push	0
	mov	eax, DWORD PTR _name$[ebp]
	mov	ecx, DWORD PTR [eax+4]
	push	ecx
	mov	edx, DWORD PTR _name$[ebp]
	add	edx, 8
	push	edx
	mov	eax, DWORD PTR _form$[ebp]
	mov	ecx, DWORD PTR [eax+232]
	push	ecx
	call	_dynbuf_add
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L70775
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29872], OFFSET FLAT:$SG70777
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 510		; 000001feH
	jmp	$eva_err$70643
$L70775:

; 511  : 				DYNBUF_ADD3_INT(form->html, "',0,", b_submit || b_multiple, "");

	cmp	DWORD PTR _b_submit$[ebp], 0
	jne	SHORT $L71067
	cmp	DWORD PTR _b_multiple$[ebp], 0
	jne	SHORT $L71067
	mov	DWORD PTR -228+[ebp], 0
	jmp	SHORT $L71068
$L71067:
	mov	DWORD PTR -228+[ebp], 1
$L71068:
	push	0
	push	OFFSET FLAT:$SG70779
	mov	ecx, DWORD PTR -228+[ebp]
	push	ecx
	push	4
	push	OFFSET FLAT:$SG70780
	mov	edx, DWORD PTR _form$[ebp]
	mov	eax, DWORD PTR [edx+232]
	push	eax
	call	_dynbuf_add3_int
	add	esp, 24					; 00000018H
	test	eax, eax
	je	SHORT $L70778
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29872], OFFSET FLAT:$SG70782
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 511		; 000001ffH
	jmp	$eva_err$70643
$L70778:

; 512  : 				DYNBUF_ADD3_INT(form->html, ",", b_multiple, ")\"><nobr>");

	push	9
	push	OFFSET FLAT:$SG70784
	mov	eax, DWORD PTR _b_multiple$[ebp]
	push	eax
	push	1
	push	OFFSET FLAT:$SG70785
	mov	ecx, DWORD PTR _form$[ebp]
	mov	edx, DWORD PTR [ecx+232]
	push	edx
	call	_dynbuf_add3_int
	add	esp, 24					; 00000018H
	test	eax, eax
	je	SHORT $L70783
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29872], OFFSET FLAT:$SG70787
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 512		; 00000200H
	jmp	$eva_err$70643
$L70783:

; 513  : 				if(!ctrl->val.nbrows) DYNBUF_ADD_STR(form->html, "<b>");

	mov	edx, DWORD PTR _ctrl$[ebp]
	cmp	DWORD PTR [edx+64], 0
	jne	SHORT $L70790
	push	0
	push	0
	push	3
	push	OFFSET FLAT:$SG70791
	mov	eax, DWORD PTR _form$[ebp]
	mov	ecx, DWORD PTR [eax+232]
	push	ecx
	call	_dynbuf_add
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L70790
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29872], OFFSET FLAT:$SG70793
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 513		; 00000201H
	jmp	$eva_err$70643
$L70790:

; 514  : 				DYNBUF_ADD_STR(form->html, "(non renseigné)</b></span>");

	push	0
	push	0
	push	26					; 0000001aH
	push	OFFSET FLAT:$SG70796
	mov	ecx, DWORD PTR _form$[ebp]
	mov	edx, DWORD PTR [ecx+232]
	push	edx
	call	_dynbuf_add
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L70795
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29872], OFFSET FLAT:$SG70798
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 514		; 00000202H
	jmp	$eva_err$70643
$L70795:

; 516  : 
; 517  : 			/* Output each option */
; 518  : 			for(i = 0; i < optlist.nbrows; i++)

	mov	DWORD PTR _i$[ebp], 0
	jmp	SHORT $L70799
$L70800:
	mov	edx, DWORD PTR _i$[ebp]
	add	edx, 1
	mov	DWORD PTR _i$[ebp], edx
$L70799:
	mov	eax, DWORD PTR _i$[ebp]
	cmp	eax, DWORD PTR _optlist$[ebp]
	jae	$L70801

; 520  : 				unsigned long k = dyntab_cell(&optlist, i, 0)->row;

	push	0
	mov	ecx, DWORD PTR _i$[ebp]
	push	ecx
	lea	edx, DWORD PTR _optlist$[ebp]
	push	edx
	call	_dyntab_cell
	add	esp, 12					; 0000000cH
	mov	eax, DWORD PTR [eax+60]
	mov	DWORD PTR _k$70802[ebp], eax

; 521  : 				EVA_ctrl *optctrl = form->ctrl + k;

	mov	ecx, DWORD PTR _k$70802[ebp]
	imul	ecx, 480				; 000001e0H
	mov	edx, DWORD PTR _form$[ebp]
	mov	eax, DWORD PTR [edx]
	add	eax, ecx
	mov	DWORD PTR _optctrl$70803[ebp], eax

; 522  : 				int b_optsubmit = b_submit || (b_multiple && DYNTAB_FIELD_CELL(&optctrl->attr, CTRLTREE));

	cmp	DWORD PTR _b_submit$[ebp], 0
	jne	SHORT $L71070
	cmp	DWORD PTR _b_multiple$[ebp], 0
	je	SHORT $L71069
	push	0
	push	-1
	push	OFFSET FLAT:$SG70805
	mov	ecx, DWORD PTR _optctrl$70803[ebp]
	add	ecx, 44					; 0000002cH
	push	ecx
	call	_dyntab_field_cell
	add	esp, 16					; 00000010H
	test	eax, eax
	jne	SHORT $L71070
$L71069:
	mov	DWORD PTR -232+[ebp], 0
	jmp	SHORT $L71071
$L71070:
	mov	DWORD PTR -232+[ebp], 1
$L71071:
	mov	edx, DWORD PTR -232+[ebp]
	mov	DWORD PTR _b_optsubmit$70804[ebp], edx

; 523  : 				int b_checked;
; 524  : 
; 525  : 				/* Search option in values to determine selected status */
; 526  : 				for(j = 0; j < ctrl->val.nbrows && dyntab_cmp(&optlist, i, 0, &ctrl->val, j, 0); j++);

	mov	DWORD PTR _j$[ebp], 0
	jmp	SHORT $L70807
$L70808:
	mov	eax, DWORD PTR _j$[ebp]
	add	eax, 1
	mov	DWORD PTR _j$[ebp], eax
$L70807:
	mov	ecx, DWORD PTR _ctrl$[ebp]
	mov	edx, DWORD PTR _j$[ebp]
	cmp	edx, DWORD PTR [ecx+64]
	jae	SHORT $L70809
	push	0
	mov	eax, DWORD PTR _j$[ebp]
	push	eax
	mov	ecx, DWORD PTR _ctrl$[ebp]
	add	ecx, 64					; 00000040H
	push	ecx
	push	0
	mov	edx, DWORD PTR _i$[ebp]
	push	edx
	lea	eax, DWORD PTR _optlist$[ebp]
	push	eax
	call	_dyntab_cmp
	add	esp, 24					; 00000018H
	test	eax, eax
	je	SHORT $L70809
	jmp	SHORT $L70808
$L70809:

; 527  :  				val = dyntab_cell(&ctrl->val, j, 0);

	push	0
	mov	ecx, DWORD PTR _j$[ebp]
	push	ecx
	mov	edx, DWORD PTR _ctrl$[ebp]
	add	edx, 64					; 00000040H
	push	edx
	call	_dyntab_cell
	add	esp, 12					; 0000000cH
	mov	DWORD PTR _val$70742[ebp], eax

; 528  : 				if(val) val->col  = 1;

	cmp	DWORD PTR _val$70742[ebp], 0
	je	SHORT $L70810
	mov	eax, DWORD PTR _val$70742[ebp]
	mov	DWORD PTR [eax+56], 1
$L70810:

; 529  : 				b_checked = (val || (!ctrl->val.nbrows && ctrl->b_use_val && !dyntab_sz(&optlist, i, 0))) ? 1 : 0;

	cmp	DWORD PTR _val$70742[ebp], 0
	jne	SHORT $L71073
	mov	ecx, DWORD PTR _ctrl$[ebp]
	cmp	DWORD PTR [ecx+64], 0
	jne	SHORT $L71072
	mov	edx, DWORD PTR _ctrl$[ebp]
	cmp	DWORD PTR [edx+208], 0
	je	SHORT $L71072
	push	0
	mov	eax, DWORD PTR _i$[ebp]
	push	eax
	lea	ecx, DWORD PTR _optlist$[ebp]
	push	ecx
	call	_dyntab_sz
	add	esp, 12					; 0000000cH
	test	eax, eax
	je	SHORT $L71073
$L71072:
	mov	DWORD PTR -236+[ebp], 0
	jmp	SHORT $L71074
$L71073:
	mov	DWORD PTR -236+[ebp], 1
$L71074:
	mov	edx, DWORD PTR -236+[ebp]
	mov	DWORD PTR _b_checked$70806[ebp], edx

; 530  : 
; 531  : 				/* Options separator : spacer or line break */
; 532  : 				if(i || b_empty)

	cmp	DWORD PTR _i$[ebp], 0
	jne	SHORT $L70812
	cmp	DWORD PTR _b_empty$70741[ebp], 0
	je	$L70822
$L70812:

; 534  : 					if(!ctrl->COLUMNS || !((i + (b_empty ? 1 : 0)) % ctrl->COLUMNS))

	mov	eax, DWORD PTR _ctrl$[ebp]
	cmp	DWORD PTR [eax+380], 0
	je	SHORT $L70814
	xor	ecx, ecx
	cmp	DWORD PTR _b_empty$70741[ebp], 0
	setne	cl
	mov	eax, DWORD PTR _i$[ebp]
	add	eax, ecx
	mov	ecx, DWORD PTR _ctrl$[ebp]
	xor	edx, edx
	div	DWORD PTR [ecx+380]
	test	edx, edx
	jne	SHORT $L70813
$L70814:

; 535  : 						DYNBUF_ADD_STR(form->html, "<br>")

	push	0
	push	0
	push	4
	push	OFFSET FLAT:$SG70817
	mov	edx, DWORD PTR _form$[ebp]
	mov	eax, DWORD PTR [edx+232]
	push	eax
	call	_dynbuf_add
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L70816
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29872], OFFSET FLAT:$SG70819
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 535		; 00000217H
	jmp	$eva_err$70643
$L70816:

; 536  : 					else

	jmp	SHORT $L70822
$L70813:

; 537  : 						DYNBUF_ADD_STR(form->html, " ");

	push	0
	push	0
	push	1
	push	OFFSET FLAT:$SG70823
	mov	eax, DWORD PTR _form$[ebp]
	mov	ecx, DWORD PTR [eax+232]
	push	ecx
	call	_dynbuf_add
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L70822
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29872], OFFSET FLAT:$SG70825
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 537		; 00000219H
	jmp	$eva_err$70643
$L70822:

; 539  : 
; 540  : 				/* Output option : radio or chexkbox depending on b_multiple setting */
; 541  : 				DYNBUF_ADD_STR(form->html, "<nobr>");

	push	0
	push	0
	push	6
	push	OFFSET FLAT:$SG70828
	mov	ecx, DWORD PTR _form$[ebp]
	mov	edx, DWORD PTR [ecx+232]
	push	edx
	call	_dynbuf_add
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L70827
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29872], OFFSET FLAT:$SG70830
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 541		; 0000021dH
	jmp	$eva_err$70643
$L70827:

; 542  : 				if(put_html_chkbox(cntxt, DYNBUF_VAL_SZ(name), DYNTAB_VAL_SZ(&optlist, i, 0),
; 543  : 					b_checked | (b_multiple ? 0 : 2), b_optsubmit)) STACK_ERROR;

	cmp	DWORD PTR _name$[ebp], 0
	je	SHORT $L71075
	mov	edx, DWORD PTR _name$[ebp]
	mov	eax, DWORD PTR [edx+4]
	mov	DWORD PTR -240+[ebp], eax
	jmp	SHORT $L71076
$L71075:
	mov	DWORD PTR -240+[ebp], 0
$L71076:
	cmp	DWORD PTR _name$[ebp], 0
	je	SHORT $L71077
	mov	ecx, DWORD PTR _name$[ebp]
	add	ecx, 8
	mov	DWORD PTR -244+[ebp], ecx
	jmp	SHORT $L71078
$L71077:
	mov	DWORD PTR -244+[ebp], 0
$L71078:
	mov	edx, DWORD PTR _b_optsubmit$70804[ebp]
	push	edx
	mov	eax, DWORD PTR _b_multiple$[ebp]
	neg	eax
	sbb	eax, eax
	and	al, -2					; fffffffeH
	add	eax, 2
	mov	ecx, DWORD PTR _b_checked$70806[ebp]
	or	ecx, eax
	push	ecx
	push	0
	mov	edx, DWORD PTR _i$[ebp]
	push	edx
	lea	eax, DWORD PTR _optlist$[ebp]
	push	eax
	call	_dyntab_sz
	add	esp, 12					; 0000000cH
	push	eax
	push	0
	mov	ecx, DWORD PTR _i$[ebp]
	push	ecx
	lea	edx, DWORD PTR _optlist$[ebp]
	push	edx
	call	_dyntab_val
	add	esp, 12					; 0000000cH
	push	eax
	mov	eax, DWORD PTR -240+[ebp]
	push	eax
	mov	ecx, DWORD PTR -244+[ebp]
	push	ecx
	mov	edx, DWORD PTR _cntxt$[ebp]
	push	edx
	call	_put_html_chkbox
	add	esp, 28					; 0000001cH
	test	eax, eax
	je	SHORT $L70832
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 543		; 0000021fH
	jmp	$eva_err$70643
$L70832:

; 544  : 				if(val && ctrl_put_hidden_old(cntxt, ctrl, j, name, NULL, 0)) STACK_ERROR;

	cmp	DWORD PTR _val$70742[ebp], 0
	je	SHORT $L70834
	push	0
	push	0
	mov	ecx, DWORD PTR _name$[ebp]
	push	ecx
	mov	edx, DWORD PTR _j$[ebp]
	push	edx
	mov	eax, DWORD PTR _ctrl$[ebp]
	push	eax
	mov	ecx, DWORD PTR _cntxt$[ebp]
	push	ecx
	call	_ctrl_put_hidden_old
	add	esp, 24					; 00000018H
	test	eax, eax
	je	SHORT $L70834
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 544		; 00000220H
	jmp	$eva_err$70643
$L70834:

; 545  : 
; 546  : 				/* Output option label & help button */
; 547  : 				DYNBUF_ADD_STR(form->html, "<span style=\"cursor:pointer\" onClick=\"ChkLblClick('");

	push	0
	push	0
	push	51					; 00000033H
	push	OFFSET FLAT:$SG70837
	mov	eax, DWORD PTR _form$[ebp]
	mov	ecx, DWORD PTR [eax+232]
	push	ecx
	call	_dynbuf_add
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L70836
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29872], OFFSET FLAT:$SG70839
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 547		; 00000223H
	jmp	$eva_err$70643
$L70836:

; 548  : 				DYNBUF_ADD_BUF(form->html, name, NO_CONV);

	cmp	DWORD PTR _name$[ebp], 0
	je	SHORT $L70841
	push	0
	push	0
	mov	ecx, DWORD PTR _name$[ebp]
	mov	edx, DWORD PTR [ecx+4]
	push	edx
	mov	eax, DWORD PTR _name$[ebp]
	add	eax, 8
	push	eax
	mov	ecx, DWORD PTR _form$[ebp]
	mov	edx, DWORD PTR [ecx+232]
	push	edx
	call	_dynbuf_add
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L70841
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29872], OFFSET FLAT:$SG70843
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 548		; 00000224H
	jmp	$eva_err$70643
$L70841:

; 549  : 				DYNBUF_ADD3_INT(form->html, "',", (i + b_empty), ",");

	push	1
	push	OFFSET FLAT:$SG70845
	mov	edx, DWORD PTR _i$[ebp]
	add	edx, DWORD PTR _b_empty$70741[ebp]
	push	edx
	push	2
	push	OFFSET FLAT:$SG70846
	mov	eax, DWORD PTR _form$[ebp]
	mov	ecx, DWORD PTR [eax+232]
	push	ecx
	call	_dynbuf_add3_int
	add	esp, 24					; 00000018H
	test	eax, eax
	je	SHORT $L70844
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29872], OFFSET FLAT:$SG70848
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 549		; 00000225H
	jmp	$eva_err$70643
$L70844:

; 550  : 				DYNBUF_ADD_INT(form->html, b_optsubmit);

	mov	ecx, DWORD PTR _b_optsubmit$70804[ebp]
	push	ecx
	mov	edx, DWORD PTR _form$[ebp]
	mov	eax, DWORD PTR [edx+232]
	push	eax
	call	_dynbuf_add_int
	add	esp, 8
	test	eax, eax
	je	SHORT $L70849
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29872], OFFSET FLAT:$SG70851
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 550		; 00000226H
	jmp	$eva_err$70643
$L70849:

; 551  : 				DYNBUF_ADD3_INT(form->html, ",", b_multiple, ")\">");

	push	3
	push	OFFSET FLAT:$SG70853
	mov	eax, DWORD PTR _b_multiple$[ebp]
	push	eax
	push	1
	push	OFFSET FLAT:$SG70854
	mov	ecx, DWORD PTR _form$[ebp]
	mov	edx, DWORD PTR [ecx+232]
	push	edx
	call	_dynbuf_add3_int
	add	esp, 24					; 00000018H
	test	eax, eax
	je	SHORT $L70852
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29872], OFFSET FLAT:$SG70856
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 551		; 00000227H
	jmp	$eva_err$70643
$L70852:

; 552  : 				if(b_checked) DYNBUF_ADD_STR(form->html, "<b>");

	cmp	DWORD PTR _b_checked$70806[ebp], 0
	je	SHORT $L70859
	push	0
	push	0
	push	3
	push	OFFSET FLAT:$SG70860
	mov	edx, DWORD PTR _form$[ebp]
	mov	eax, DWORD PTR [edx+232]
	push	eax
	call	_dynbuf_add
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L70859
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29872], OFFSET FLAT:$SG70862
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 552		; 00000228H
	jmp	$eva_err$70643
$L70859:

; 553  : 				DYNBUF_ADD_CELL(form->html, &optlist, i, ctrl->b_use_val ? 1 : 0, TO_HTML);

	push	1
	push	OFFSET FLAT:_plain_to_html
	mov	eax, DWORD PTR _ctrl$[ebp]
	xor	ecx, ecx
	cmp	DWORD PTR [eax+208], 0
	setne	cl
	push	ecx
	mov	edx, DWORD PTR _i$[ebp]
	push	edx
	lea	eax, DWORD PTR _optlist$[ebp]
	push	eax
	call	_dyntab_sz
	add	esp, 12					; 0000000cH
	push	eax
	mov	ecx, DWORD PTR _ctrl$[ebp]
	xor	edx, edx
	cmp	DWORD PTR [ecx+208], 0
	setne	dl
	push	edx
	mov	eax, DWORD PTR _i$[ebp]
	push	eax
	lea	ecx, DWORD PTR _optlist$[ebp]
	push	ecx
	call	_dyntab_val
	add	esp, 12					; 0000000cH
	push	eax
	mov	edx, DWORD PTR _form$[ebp]
	mov	eax, DWORD PTR [edx+232]
	push	eax
	call	_dynbuf_add
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L70863
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29872], OFFSET FLAT:$SG70865
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 553		; 00000229H
	jmp	$eva_err$70643
$L70863:

; 554  : 				DYNBUF_ADD_STR(form->html, "</span>");

	push	0
	push	0
	push	7
	push	OFFSET FLAT:$SG70868
	mov	eax, DWORD PTR _form$[ebp]
	mov	ecx, DWORD PTR [eax+232]
	push	ecx
	call	_dynbuf_add
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L70867
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29872], OFFSET FLAT:$SG70870
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 554		; 0000022aH
	jmp	$eva_err$70643
$L70867:

; 555  : 				if(b_checked) DYNBUF_ADD_STR(form->html, "</b>");

	cmp	DWORD PTR _b_checked$70806[ebp], 0
	je	SHORT $L70873
	push	0
	push	0
	push	4
	push	OFFSET FLAT:$SG70874
	mov	ecx, DWORD PTR _form$[ebp]
	mov	edx, DWORD PTR [ecx+232]
	push	edx
	call	_dynbuf_add
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L70873
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29872], OFFSET FLAT:$SG70876
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 555		; 0000022bH
	jmp	$eva_err$70643
$L70873:

; 556  : 				if(k && optctrl->NOTES && optctrl->NOTES[0] && ctrl_add_opt_btn(cntxt, optctrl)) STACK_ERROR;

	cmp	DWORD PTR _k$70802[ebp], 0
	je	SHORT $L70877
	mov	edx, DWORD PTR _optctrl$70803[ebp]
	cmp	DWORD PTR [edx+288], 0
	je	SHORT $L70877
	mov	eax, DWORD PTR _optctrl$70803[ebp]
	mov	ecx, DWORD PTR [eax+288]
	movsx	edx, BYTE PTR [ecx]
	test	edx, edx
	je	SHORT $L70877
	mov	eax, DWORD PTR _optctrl$70803[ebp]
	push	eax
	mov	ecx, DWORD PTR _cntxt$[ebp]
	push	ecx
	call	_ctrl_add_opt_btn
	add	esp, 8
	test	eax, eax
	je	SHORT $L70877
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 556		; 0000022cH
	jmp	$eva_err$70643
$L70877:

; 557  : 				DYNBUF_ADD_STR(form->html, "</nobr>");

	push	0
	push	0
	push	7
	push	OFFSET FLAT:$SG70880
	mov	eax, DWORD PTR _form$[ebp]
	mov	ecx, DWORD PTR [eax+232]
	push	ecx
	call	_dynbuf_add
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L70879
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29872], OFFSET FLAT:$SG70882
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 557		; 0000022dH
	jmp	$eva_err$70643
$L70879:

; 558  : 			}

	jmp	$L70800
$L70801:

; 559  : 
; 560  : 			/* Add HTML code for unlisted values */
; 561  : 			for(i = 0; i < ctrl->val.nbrows; i++)

	mov	DWORD PTR _i$[ebp], 0
	jmp	SHORT $L70883
$L70884:
	mov	ecx, DWORD PTR _i$[ebp]
	add	ecx, 1
	mov	DWORD PTR _i$[ebp], ecx
$L70883:
	mov	edx, DWORD PTR _ctrl$[ebp]
	mov	eax, DWORD PTR _i$[ebp]
	cmp	eax, DWORD PTR [edx+64]
	jae	$L70885

; 563  : 				DynTableCell *val = dyntab_cell(&ctrl->val, i, 0);

	push	0
	mov	ecx, DWORD PTR _i$[ebp]
	push	ecx
	mov	edx, DWORD PTR _ctrl$[ebp]
	add	edx, 64					; 00000040H
	push	edx
	call	_dyntab_cell
	add	esp, 12					; 0000000cH
	mov	DWORD PTR _val$70886[ebp], eax

; 564  : 				if(!val->col && val->len && val->txt && val->txt[0])

	mov	eax, DWORD PTR _val$70886[ebp]
	cmp	DWORD PTR [eax+56], 0
	jne	$L70901
	mov	ecx, DWORD PTR _val$70886[ebp]
	cmp	DWORD PTR [ecx+4], 0
	je	$L70901
	mov	edx, DWORD PTR _val$70886[ebp]
	cmp	DWORD PTR [edx], 0
	je	$L70901
	mov	eax, DWORD PTR _val$70886[ebp]
	mov	ecx, DWORD PTR [eax]
	movsx	edx, BYTE PTR [ecx]
	test	edx, edx
	je	$L70901

; 566  : 					/* Output checkbox & option label */
; 567  : 					DYNBUF_ADD_STR(form->html, "<br>");

	push	0
	push	0
	push	4
	push	OFFSET FLAT:$SG70890
	mov	eax, DWORD PTR _form$[ebp]
	mov	ecx, DWORD PTR [eax+232]
	push	ecx
	call	_dynbuf_add
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L70889
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29872], OFFSET FLAT:$SG70892
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 567		; 00000237H
	jmp	$eva_err$70643
$L70889:

; 568  : 					if(put_html_chkbox(cntxt, DYNBUF_VAL_SZ(name), DYNTAB_VAL_SZ(&ctrl->val, i, 0), b_multiple ? 1 : 3, b_submit)) STACK_ERROR;

	cmp	DWORD PTR _name$[ebp], 0
	je	SHORT $L71079
	mov	ecx, DWORD PTR _name$[ebp]
	mov	edx, DWORD PTR [ecx+4]
	mov	DWORD PTR -248+[ebp], edx
	jmp	SHORT $L71080
$L71079:
	mov	DWORD PTR -248+[ebp], 0
$L71080:
	cmp	DWORD PTR _name$[ebp], 0
	je	SHORT $L71081
	mov	eax, DWORD PTR _name$[ebp]
	add	eax, 8
	mov	DWORD PTR -252+[ebp], eax
	jmp	SHORT $L71082
$L71081:
	mov	DWORD PTR -252+[ebp], 0
$L71082:
	mov	ecx, DWORD PTR _b_submit$[ebp]
	push	ecx
	mov	edx, DWORD PTR _b_multiple$[ebp]
	neg	edx
	sbb	edx, edx
	and	edx, -2					; fffffffeH
	add	edx, 3
	push	edx
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
	mov	ecx, DWORD PTR -248+[ebp]
	push	ecx
	mov	edx, DWORD PTR -252+[ebp]
	push	edx
	mov	eax, DWORD PTR _cntxt$[ebp]
	push	eax
	call	_put_html_chkbox
	add	esp, 28					; 0000001cH
	test	eax, eax
	je	SHORT $L70894
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 568		; 00000238H
	jmp	$eva_err$70643
$L70894:

; 569  : 					if(ctrl_put_hidden_old(cntxt, ctrl, i, name, NULL, 0)) STACK_ERROR;

	push	0
	push	0
	mov	edx, DWORD PTR _name$[ebp]
	push	edx
	mov	eax, DWORD PTR _i$[ebp]
	push	eax
	mov	ecx, DWORD PTR _ctrl$[ebp]
	push	ecx
	mov	edx, DWORD PTR _cntxt$[ebp]
	push	edx
	call	_ctrl_put_hidden_old
	add	esp, 24					; 00000018H
	test	eax, eax
	je	SHORT $L70896
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 569		; 00000239H
	jmp	$eva_err$70643
$L70896:

; 570  : 					DYNBUF_ADD_CELL(form->html, &ctrl->val, i, 0, TO_HTML);

	push	1
	push	OFFSET FLAT:_plain_to_html
	push	0
	mov	ecx, DWORD PTR _i$[ebp]
	push	ecx
	mov	edx, DWORD PTR _ctrl$[ebp]
	add	edx, 64					; 00000040H
	push	edx
	call	_dyntab_sz
	add	esp, 12					; 0000000cH
	push	eax
	push	0
	mov	eax, DWORD PTR _i$[ebp]
	push	eax
	mov	ecx, DWORD PTR _ctrl$[ebp]
	add	ecx, 64					; 00000040H
	push	ecx
	call	_dyntab_val
	add	esp, 12					; 0000000cH
	push	eax
	mov	edx, DWORD PTR _form$[ebp]
	mov	eax, DWORD PTR [edx+232]
	push	eax
	call	_dynbuf_add
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L70897
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29872], OFFSET FLAT:$SG70899
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 570		; 0000023aH
	jmp	$eva_err$70643
$L70897:

; 571  : 					DYNBUF_ADD_STR(form->html, "<br>");

	push	0
	push	0
	push	4
	push	OFFSET FLAT:$SG70902
	mov	eax, DWORD PTR _form$[ebp]
	mov	ecx, DWORD PTR [eax+232]
	push	ecx
	call	_dynbuf_add
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L70901
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29872], OFFSET FLAT:$SG70904
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 571		; 0000023bH
	jmp	$eva_err$70643
$L70901:

; 573  : 			}

	jmp	$L70884
$L70885:

; 574  : 
; 575  : 			/* Add hidden input for empty value */
; 576  : 			if(!ctrl->val.nbrows)

	mov	ecx, DWORD PTR _ctrl$[ebp]
	cmp	DWORD PTR [ecx+64], 0
	jne	SHORT $L70907

; 578  : 				if(ctrl_put_hidden_old(cntxt, ctrl, i, name, NULL, 0)) STACK_ERROR;

	push	0
	push	0
	mov	edx, DWORD PTR _name$[ebp]
	push	edx
	mov	eax, DWORD PTR _i$[ebp]
	push	eax
	mov	ecx, DWORD PTR _ctrl$[ebp]
	push	ecx
	mov	edx, DWORD PTR _cntxt$[ebp]
	push	edx
	call	_ctrl_put_hidden_old
	add	esp, 24					; 00000018H
	test	eax, eax
	je	SHORT $L70907
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 578		; 00000242H
	jmp	$eva_err$70643
$L70907:

; 580  : 			DYNBUF_ADD_STR(form->html, "</font>");

	push	0
	push	0
	push	7
	push	OFFSET FLAT:$SG70910
	mov	ecx, DWORD PTR _form$[ebp]
	mov	edx, DWORD PTR [ecx+232]
	push	edx
	call	_dynbuf_add
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L70909
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29872], OFFSET FLAT:$SG70912
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 580		; 00000244H
	jmp	$eva_err$70643
$L70909:

; 582  : 		else

	jmp	$L70919
$L70737:

; 584  : 			/* Standard list input */
; 585  : 			b_submit = b_multiple;

	mov	edx, DWORD PTR _b_multiple$[ebp]
	mov	DWORD PTR _b_submit$[ebp], edx

; 586  : 			for(i = ctrl->i_child; !b_submit && i; i = form->ctrl[i].i_brother)

	mov	eax, DWORD PTR _ctrl$[ebp]
	mov	ecx, DWORD PTR [eax+24]
	mov	DWORD PTR _i$[ebp], ecx
	jmp	SHORT $L70914
$L70915:
	mov	edx, DWORD PTR _i$[ebp]
	imul	edx, 480				; 000001e0H
	mov	eax, DWORD PTR _form$[ebp]
	mov	ecx, DWORD PTR [eax]
	mov	edx, DWORD PTR [ecx+edx+28]
	mov	DWORD PTR _i$[ebp], edx
$L70914:
	cmp	DWORD PTR _b_submit$[ebp], 0
	jne	SHORT $L70916
	cmp	DWORD PTR _i$[ebp], 0
	je	SHORT $L70916

; 587  : 				b_submit = ATTR_CELL(form->ctrl + i, CTRLTREE) != 0;

	mov	eax, DWORD PTR _i$[ebp]
	imul	eax, 480				; 000001e0H
	mov	ecx, DWORD PTR _form$[ebp]
	mov	edx, DWORD PTR [ecx]
	add	edx, eax
	test	edx, edx
	je	SHORT $L71083
	push	0
	push	-1
	push	OFFSET FLAT:$SG70918
	mov	eax, DWORD PTR _i$[ebp]
	imul	eax, 480				; 000001e0H
	mov	ecx, DWORD PTR _form$[ebp]
	mov	edx, DWORD PTR [ecx]
	lea	eax, DWORD PTR [edx+eax+44]
	push	eax
	call	_dyntab_field_cell
	add	esp, 16					; 00000010H
	mov	DWORD PTR -256+[ebp], eax
	jmp	SHORT $L71084
$L71083:
	mov	DWORD PTR -256+[ebp], 0
$L71084:
	xor	ecx, ecx
	cmp	DWORD PTR -256+[ebp], 0
	setne	cl
	mov	DWORD PTR _b_submit$[ebp], ecx
	jmp	SHORT $L70915
$L70916:

; 588  : 			if(ctrl_put_html_input_list(cntxt, i_ctrl, &optlist, b_submit)) STACK_ERROR;

	mov	edx, DWORD PTR _b_submit$[ebp]
	push	edx
	lea	eax, DWORD PTR _optlist$[ebp]
	push	eax
	mov	ecx, DWORD PTR _i_ctrl$[ebp]
	push	ecx
	mov	edx, DWORD PTR _cntxt$[ebp]
	push	edx
	call	_ctrl_put_html_input_list
	add	esp, 16					; 00000010H
	test	eax, eax
	je	SHORT $L70919
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 588		; 0000024cH
	jmp	$eva_err$70643
$L70919:

; 590  : 
; 591  : 		/* Handle free user input if allowed */
; 592  : 		if(*allow_other && (b_multiple || !ctrl->val.nbrows))

	mov	ecx, DWORD PTR _allow_other$[ebp]
	movsx	edx, BYTE PTR [ecx]
	test	edx, edx
	je	$L70936
	cmp	DWORD PTR _b_multiple$[ebp], 0
	jne	SHORT $L70921
	mov	eax, DWORD PTR _ctrl$[ebp]
	cmp	DWORD PTR [eax+64], 0
	jne	$L70936
$L70921:

; 594  : 			CTRL_CGINAMEVAL(&name, ctrl->val.nbrows);

	push	0
	push	0
	push	0
	lea	ecx, DWORD PTR _name$[ebp]
	push	ecx
	push	1
	push	0
	mov	edx, DWORD PTR _ctrl$[ebp]
	mov	eax, DWORD PTR [edx+64]
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
	je	SHORT $L70923
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 594		; 00000252H
	jmp	$eva_err$70643
$L70923:
	mov	edx, DWORD PTR _ctrl$[ebp]
	mov	DWORD PTR [edx+196], 1

; 595  : 			DYNBUF_ADD_STR(&name, ".0");

	push	0
	push	0
	push	2
	push	OFFSET FLAT:$SG70926
	lea	eax, DWORD PTR _name$[ebp]
	push	eax
	call	_dynbuf_add
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L70925
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29872], OFFSET FLAT:$SG70928
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 595		; 00000253H
	jmp	$eva_err$70643
$L70925:

; 596  : 			DYNBUF_ADD_STR(form->html, "<br>");

	push	0
	push	0
	push	4
	push	OFFSET FLAT:$SG70931
	mov	eax, DWORD PTR _form$[ebp]
	mov	ecx, DWORD PTR [eax+232]
	push	ecx
	call	_dynbuf_add
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L70930
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29872], OFFSET FLAT:$SG70933
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 596		; 00000254H
	jmp	$eva_err$70643
$L70930:

; 597  : 			if(put_html_text_input(cntxt,
; 598  : 								DYNBUF_VAL_SZ(name),
; 599  : 								NULL, 0, 0, 0, 1, ctrl->COLUMNS * 2 / 3,
; 600  : 								atoi(CTRL_ATTR_VAL(MAXLENGTH)))) STACK_ERROR;

	cmp	DWORD PTR _ctrl$[ebp], 0
	je	SHORT $L71085
	push	0
	push	-1
	push	OFFSET FLAT:$SG70937
	mov	ecx, DWORD PTR _ctrl$[ebp]
	add	ecx, 44					; 0000002cH
	push	ecx
	call	_dyntab_field_val
	add	esp, 16					; 00000010H
	mov	DWORD PTR -260+[ebp], eax
	jmp	SHORT $L71086
$L71085:
	mov	DWORD PTR -260+[ebp], OFFSET FLAT:$SG70938
$L71086:
	cmp	DWORD PTR _name$[ebp], 0
	je	SHORT $L71087
	mov	edx, DWORD PTR _name$[ebp]
	mov	eax, DWORD PTR [edx+4]
	mov	DWORD PTR -264+[ebp], eax
	jmp	SHORT $L71088
$L71087:
	mov	DWORD PTR -264+[ebp], 0
$L71088:
	cmp	DWORD PTR _name$[ebp], 0
	je	SHORT $L71089
	mov	ecx, DWORD PTR _name$[ebp]
	add	ecx, 8
	mov	DWORD PTR -268+[ebp], ecx
	jmp	SHORT $L71090
$L71089:
	mov	DWORD PTR -268+[ebp], 0
$L71090:
	mov	edx, DWORD PTR -260+[ebp]
	push	edx
	call	_atoi
	add	esp, 4
	push	eax
	mov	eax, DWORD PTR _ctrl$[ebp]
	mov	eax, DWORD PTR [eax+380]
	shl	eax, 1
	xor	edx, edx
	mov	ecx, 3
	div	ecx
	push	eax
	push	1
	push	0
	push	0
	push	0
	push	0
	mov	edx, DWORD PTR -264+[ebp]
	push	edx
	mov	eax, DWORD PTR -268+[ebp]
	push	eax
	mov	ecx, DWORD PTR _cntxt$[ebp]
	push	ecx
	call	_put_html_text_input
	add	esp, 40					; 00000028H
	test	eax, eax
	je	SHORT $L70936
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 600		; 00000258H
	jmp	$eva_err$70643
$L70936:

; 603  : 
; 604  : 		/* Add control footer */
; 605  : 		if(ctrl_format_pos(cntxt, ctrl, 0)) STACK_ERROR;

	push	0
	mov	eax, DWORD PTR _ctrl$[ebp]
	push	eax
	mov	ecx, DWORD PTR _cntxt$[ebp]
	push	ecx
	call	_ctrl_format_pos
	add	esp, 12					; 0000000cH
	test	eax, eax
	je	SHORT $L70939
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 605		; 0000025dH
	jmp	SHORT $eva_err$70643
$L70939:

; 606  : 		break;

	jmp	SHORT $L70645
$L70940:

; 607  : 
; 608  : 	case HtmlPrint:
; 609  : 	case HtmlView:
; 610  : 		if(!form->html) break;

	mov	eax, DWORD PTR _form$[ebp]
	cmp	DWORD PTR [eax+232], 0
	jne	SHORT $L70941
	jmp	SHORT $L70645
$L70941:

; 611  : 		if(ctrl_add_input_list_view(cntxt, i_ctrl, &options)) STACK_ERROR;

	lea	ecx, DWORD PTR _options$[ebp]
	push	ecx
	mov	edx, DWORD PTR _i_ctrl$[ebp]
	push	edx
	mov	eax, DWORD PTR _cntxt$[ebp]
	push	eax
	call	_ctrl_add_input_list_view
	add	esp, 12					; 0000000cH
	test	eax, eax
	je	SHORT $L70943
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 611		; 00000263H
	jmp	SHORT $eva_err$70643
$L70943:
$L70645:

; 616  : 
; 617  : 	/* Handle controls under selected options */
; 618  : 	if(ctrl_add_selected_options(cntxt, i_ctrl, &options)) STACK_ERROR;

	lea	edx, DWORD PTR _options$[ebp]
	push	edx
	mov	eax, DWORD PTR _i_ctrl$[ebp]
	push	eax
	mov	ecx, DWORD PTR _cntxt$[ebp]
	push	ecx
	call	_ctrl_add_selected_options
	add	esp, 12					; 0000000cH
	test	eax, eax
	je	SHORT $eva_noerr$70945
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 618		; 0000026aH
	jmp	SHORT $eva_err$70643
$eva_noerr$70945:

; 619  : 
; 620  : 	RETURN_OK_CLEANUP;

	push	0
	push	OFFSET FLAT:$SG70946
	push	OFFSET FLAT:$SG70947
	mov	eax, DWORD PTR _cntxt$[ebp]
	push	eax
	call	_err_clear
	add	esp, 16					; 00000010H
$eva_err$70643:
	mov	ecx, DWORD PTR _cntxt$[ebp]
	cmp	DWORD PTR [ecx+29872], 0
	je	SHORT $L70948
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	eax, DWORD PTR [edx+29900]
	push	eax
	push	OFFSET FLAT:$SG70949
	push	OFFSET FLAT:$SG70950
	mov	ecx, DWORD PTR _cntxt$[ebp]
	push	ecx
	call	_err_add_context
	add	esp, 16					; 00000010H
$L70948:
	lea	edx, DWORD PTR _optlist$[ebp]
	push	edx
	call	_dyntab_free
	add	esp, 4
	lea	eax, DWORD PTR _data$[ebp]
	push	eax
	call	_dyntab_free
	add	esp, 4
	lea	ecx, DWORD PTR _options$[ebp]
	push	ecx
	call	_dyntab_free
	add	esp, 4
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

; 621  : }

	mov	esp, ebp
	pop	ebp
	ret	0
$L71091:
	DD	$L70648
	DD	$L70943
	DD	$L70943
	DD	$L70943
	DD	$L70657
	DD	$L70943
	DD	$L70940
	DD	$L70940
_ctrl_add_input_list ENDP
_TEXT	ENDS
END
