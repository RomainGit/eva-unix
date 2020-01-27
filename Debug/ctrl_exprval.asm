	TITLE	D:\Travail\ABI\EVA\V4.0\CGI\Brunix-2016\ctrl_exprval.c
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
PUBLIC	_html_put_value_fmt
EXTRN	__pctype:DWORD
EXTRN	__isctype:NEAR
EXTRN	_put_html_bold_substring:NEAR
EXTRN	_basename:NEAR
EXTRN	__snprintf:NEAR
EXTRN	_sprintf:NEAR
EXTRN	___mb_cur_max:DWORD
EXTRN	_atoi:NEAR
EXTRN	_put_html_image_dir:NEAR
EXTRN	_mem_free:NEAR
EXTRN	_plain_to_html:BYTE
EXTRN	_put_value_fmt:NEAR
EXTRN	_no_quote:BYTE
EXTRN	_strtoul:NEAR
EXTRN	_dynbuf_add:NEAR
EXTRN	_qry_obj_data:NEAR
EXTRN	_dynbuf_add3:NEAR
EXTRN	_dynbuf_strip:NEAR
EXTRN	_dyntab_free:NEAR
EXTRN	_dyntab_sz:NEAR
EXTRN	_dyntab_val:NEAR
EXTRN	_dyntab_cell:NEAR
EXTRN	_qry_cache_idobj_field:NEAR
EXTRN	_dyntab_copy:NEAR
EXTRN	_strcmp:NEAR
EXTRN	_strlen:NEAR
EXTRN	_strchr:NEAR
EXTRN	_err_add_context:NEAR
EXTRN	_err_clear:NEAR
EXTRN	_strncmp:NEAR
EXTRN	_strstr:NEAR
EXTRN	_ctrl_add_symbol_btn:NEAR
EXTRN	_stricmp:NEAR
EXTRN	_dyntab_field_val:NEAR
EXTRN	_dyntab_field_cell:NEAR
_BSS	SEGMENT
$SG70230 DB	01H DUP (?)
	ALIGN	4

$SG70280 DB	01H DUP (?)
	ALIGN	4

$SG70284 DB	01H DUP (?)
	ALIGN	4

$SG70288 DB	01H DUP (?)
	ALIGN	4

$SG70293 DB	01H DUP (?)
	ALIGN	4

$SG70305 DB	01H DUP (?)
	ALIGN	4

$SG70387 DB	01H DUP (?)
	ALIGN	4

$SG70434 DB	01H DUP (?)
	ALIGN	4

$SG70437 DB	01H DUP (?)
	ALIGN	4

$SG70455 DB	01H DUP (?)
_BSS	ENDS
_DATA	SEGMENT
$SG70229 DB	'_EVA_TOOLTIP_MODE', 00H
	ORG $+2
$SG70242 DB	'_EVA_RELATION', 00H
	ORG $+2
$SG70246 DB	'http://', 00H
$SG70247 DB	'ftp://', 00H
	ORG $+1
$SG70248 DB	'www.', 00H
	ORG $+3
$SG70249 DB	'_EVA_HTTPLINK', 00H
	ORG $+2
$SG70252 DB	'_EVA_RELATION', 00H
	ORG $+2
$SG70253 DB	'_EVA_TXTLINK', 00H
	ORG $+3
$SG70259 DB	'BTN', 00H
$SG70262 DB	'FORM', 00H
	ORG $+3
$SG70264 DB	'_EVA_RELATION_BTN0', 00H
	ORG $+1
$SG70267 DB	'_EVA_TXTLINK', 00H
	ORG $+3
$SG70273 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70279 DB	'+', 00H
	ORG $+2
$SG70281 DB	'%sSYMBOL', 00H
	ORG $+3
$SG70283 DB	'+', 00H
	ORG $+2
$SG70285 DB	'%sNAME', 00H
	ORG $+1
$SG70287 DB	'+', 00H
	ORG $+2
$SG70289 DB	'%sLABEL', 00H
$SG70292 DB	'+', 00H
	ORG $+2
$SG70294 DB	'%sOBJNOTES', 00H
	ORG $+1
$SG70298 DB	'<table noborder cellpadding=0 cellspacing=0><tr>', 00H
	ORG $+3
$SG70300 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70309 DB	'</tr></table>', 00H
	ORG $+2
$SG70311 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70314 DB	'_EVA_EMAIL', 00H
	ORG $+1
$SG70316 DB	'''>', 00H
	ORG $+1
$SG70317 DB	'<a href=''mailto:', 00H
	ORG $+3
$SG70319 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70326 DB	'</a>', 00H
	ORG $+3
$SG70328 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70331 DB	'_EVA_HTTPLINK', 00H
	ORG $+2
$SG70335 DB	'://', 00H
$SG70340 DB	'<a href=''', 00H
	ORG $+2
$SG70342 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70346 DB	'http://', 00H
$SG70348 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70351 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70354 DB	''' target=_blank>', 00H
	ORG $+3
$SG70356 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70364 DB	'...', 00H
$SG70366 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70369 DB	'</a>', 00H
	ORG $+3
$SG70371 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70374 DB	'_EVA_DOCUMENT', 00H
	ORG $+2
$SG70380 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70383 DB	'_EVA_FILE_SERVER_NAME', 00H
	ORG $+2
$SG70388 DB	'<a href=''../docs/', 00H
	ORG $+2
$SG70390 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70394 DB	'''', 00H
	ORG $+2
$SG70395 DB	'/', 00H
	ORG $+2
$SG70397 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70401 DB	'''>', 00H
	ORG $+1
$SG70402 DB	' target=''W', 00H
	ORG $+1
$SG70404 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70405 DB	'_EVA_FILE_CLIENT_PATH', 00H
	ORG $+2
$SG70406 DB	'???', 00H
$SG70414 DB	'</a>', 00H
	ORG $+3
$SG70416 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70419 DB	'_EVA_HTML', 00H
	ORG $+2
$SG70423 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70426 DB	'_EVA_IMAGE', 00H
	ORG $+1
$SG70433 DB	'_EVA_IMG_WIDTH', 00H
	ORG $+1
$SG70436 DB	'_EVA_IMG_HEIGHT', 00H
$SG70445 DB	'50', 00H
	ORG $+1
$SG70446 DB	'%d', 00H
	ORG $+1
$SG70454 DB	'_EVA_IMAGE_DIR', 00H
	ORG $+1
$SG70459 DB	'_EVA_AGE', 00H
	ORG $+3
$SG70460 DB	'_EVA_FILESIZE', 00H
	ORG $+2
$SG70461 DB	'_EVA_NUMBER', 00H
$SG70462 DB	'_EVA_MONEY', 00H
	ORG $+1
$SG70463 DB	'_EVA_TELEPHONE', 00H
	ORG $+1
$SG70472 DB	'_EVA_', 00H
	ORG $+2
$SG70484 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70493 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70494 DB	'D:\Travail\ABI\EVA\V4.0\CGI\Brunix-2016\ctrl_exprval.c', 00H
	ORG $+1
$SG70495 DB	'html_put_value_fmt', 00H
	ORG $+1
$SG70497 DB	'D:\Travail\ABI\EVA\V4.0\CGI\Brunix-2016\ctrl_exprval.c', 00H
	ORG $+1
$SG70498 DB	'html_put_value_fmt', 00H
_DATA	ENDS
_TEXT	SEGMENT
_cntxt$ = 8
_ctrl$ = 12
_table$ = 16
_row$ = 20
_fmt$ = 24
_strip$ = 28
_tot_char$ = 32
_b_stripped$ = 36
_form$ = -12
_tbl$ = -20
_id_obj$ = -40
_objdata$ = -64
_val$ = -8
_stripval$ = -4
_tooltip_mode$ = -44
_html$ = -16
_idend$70254 = -72
_idrelobj$70256 = -76
_b_button$70257 = -68
_b_formlb$70260 = -84
_b_label$70263 = -80
_symtyp$70276 = -152
_symlen$70277 = -88
__cnt0$70321 = -156
_sz$70332 = -172
_url$70333 = -160
_adr$70334 = -164
_urlstrip$70336 = -168
__cnt0$70358 = -176
_filename$70375 = -184
_name$70376 = -188
_path$70377 = -180
__c$70391 = -192
__c$70398 = -196
__cnt0$70408 = -200
_c$70427 = -208
_obj$70428 = -236
_idobj$70430 = -204
_htxt$70431 = -232
_w$70432 = -212
_h$70435 = -216
_fmt$70440 = -240
_hnum$70441 = -244
_dh$70442 = -248
__cnt0$70465 = -252
__cnt0$70474 = -256
__cnt0$70480 = -260
__cnt0$70490 = -264
_html_put_value_fmt PROC NEAR

; 33   : ){

	push	ebp
	mov	ebp, esp
	sub	esp, 436				; 000001b4H
	push	edi

; 34   : 	EVA_form *form = cntxt->form;

	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	ecx, DWORD PTR [eax+80]
	mov	DWORD PTR _form$[ebp], ecx

; 35   : 	ObjTableFormat *tbl = ctrl->objtbl;

	mov	edx, DWORD PTR _ctrl$[ebp]
	mov	eax, DWORD PTR [edx+232]
	mov	DWORD PTR _tbl$[ebp], eax

; 36   : 	DynTable id_obj = { 0 };

	mov	DWORD PTR _id_obj$[ebp], 0
	xor	ecx, ecx
	mov	DWORD PTR _id_obj$[ebp+4], ecx
	mov	DWORD PTR _id_obj$[ebp+8], ecx
	mov	DWORD PTR _id_obj$[ebp+12], ecx
	mov	DWORD PTR _id_obj$[ebp+16], ecx

; 37   : 	DynTable objdata = { 0 };

	mov	DWORD PTR _objdata$[ebp], 0
	xor	edx, edx
	mov	DWORD PTR _objdata$[ebp+4], edx
	mov	DWORD PTR _objdata$[ebp+8], edx
	mov	DWORD PTR _objdata$[ebp+12], edx
	mov	DWORD PTR _objdata$[ebp+16], edx

; 38   : 	DynTableCell *val = dyntab_cell(table, row, 0);

	push	0
	mov	eax, DWORD PTR _row$[ebp]
	push	eax
	mov	ecx, DWORD PTR _table$[ebp]
	push	ecx
	call	_dyntab_cell
	add	esp, 12					; 0000000cH
	mov	DWORD PTR _val$[ebp], eax

; 39   : 	DynBuffer *stripval = NULL;

	mov	DWORD PTR _stripval$[ebp], 0

; 40   : 	int tooltip_mode = atoi(CTRL_ATTR_VAL(TOOLTIP_MODE));

	cmp	DWORD PTR _ctrl$[ebp], 0
	je	SHORT $L71212
	push	0
	push	-1
	push	OFFSET FLAT:$SG70229
	mov	edx, DWORD PTR _ctrl$[ebp]
	add	edx, 44					; 0000002cH
	push	edx
	call	_dyntab_field_val
	add	esp, 16					; 00000010H
	mov	DWORD PTR -268+[ebp], eax
	jmp	SHORT $L71213
$L71212:
	mov	DWORD PTR -268+[ebp], OFFSET FLAT:$SG70230
$L71213:
	mov	eax, DWORD PTR -268+[ebp]
	push	eax
	call	_atoi
	add	esp, 4
	mov	DWORD PTR _tooltip_mode$[ebp], eax

; 41   : 	CHECK_HTML_STATUS;

	cmp	DWORD PTR _cntxt$[ebp], 0
	je	SHORT $L71216
	mov	ecx, DWORD PTR _cntxt$[ebp]
	cmp	DWORD PTR [ecx+80], 0
	je	SHORT $L71214
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	eax, DWORD PTR [edx+80]
	mov	ecx, DWORD PTR [eax+232]
	mov	DWORD PTR -272+[ebp], ecx
	jmp	SHORT $L71215
$L71214:
	mov	DWORD PTR -272+[ebp], 0
$L71215:
	mov	edx, DWORD PTR -272+[ebp]
	mov	DWORD PTR -276+[ebp], edx
	jmp	SHORT $L71217
$L71216:
	mov	DWORD PTR -276+[ebp], 0
$L71217:
	mov	eax, DWORD PTR -276+[ebp]
	mov	DWORD PTR _html$[ebp], eax
	cmp	DWORD PTR _html$[ebp], 0
	jne	SHORT $L70234
	xor	eax, eax
	jmp	$L70220
$L70234:

; 42   : #define HANDLE_STRIP(code) DYNBUF_HANDLE_STRIP(html, strip, *tot_char, *b_stripped, code)
; 43   : 
; 44   : 	/* Return if no value */
; 45   : 	if(!val || !val->txt || !val->len) RETURN_OK;

	cmp	DWORD PTR _val$[ebp], 0
	je	SHORT $L70237
	mov	ecx, DWORD PTR _val$[ebp]
	cmp	DWORD PTR [ecx], 0
	je	SHORT $L70237
	mov	edx, DWORD PTR _val$[ebp]
	cmp	DWORD PTR [edx+4], 0
	jne	SHORT $L70236
$L70237:
	jmp	$eva_noerr$70238
$L70236:

; 46   : 
; 47   : 	/* Init stripping */
; 48   : 	*b_stripped = 0;

	mov	eax, DWORD PTR _b_stripped$[ebp]
	mov	DWORD PTR [eax], 0

; 49   : 
; 50   : 	/* Compute best format if none given and value not empty */
; 51   : 	if((!fmt || !*fmt) && val->txt && val->len)

	cmp	DWORD PTR _fmt$[ebp], 0
	je	SHORT $L70240
	mov	ecx, DWORD PTR _fmt$[ebp]
	movsx	edx, BYTE PTR [ecx]
	test	edx, edx
	jne	SHORT $L70244
$L70240:
	mov	eax, DWORD PTR _val$[ebp]
	cmp	DWORD PTR [eax], 0
	je	SHORT $L70244
	mov	ecx, DWORD PTR _val$[ebp]
	cmp	DWORD PTR [ecx+4], 0
	je	SHORT $L70244

; 53   : 		if(val->b_relation)

	mov	edx, DWORD PTR _val$[ebp]
	movsx	eax, BYTE PTR [edx+12]
	test	eax, eax
	je	SHORT $L70241

; 54   : 			fmt = "_EVA_RELATION";

	mov	DWORD PTR _fmt$[ebp], OFFSET FLAT:$SG70242

; 55   : 		else if(!strncmp(val->txt, add_sz_str("http://")) ||

	jmp	SHORT $L70244
$L70241:

; 56   : 				!strncmp(val->txt, add_sz_str("ftp://")) ||
; 57   : 				!strncmp(val->txt, add_sz_str("www.")))

	push	7
	push	OFFSET FLAT:$SG70246
	mov	ecx, DWORD PTR _val$[ebp]
	mov	edx, DWORD PTR [ecx]
	push	edx
	call	_strncmp
	add	esp, 12					; 0000000cH
	test	eax, eax
	je	SHORT $L70245
	push	6
	push	OFFSET FLAT:$SG70247
	mov	eax, DWORD PTR _val$[ebp]
	mov	ecx, DWORD PTR [eax]
	push	ecx
	call	_strncmp
	add	esp, 12					; 0000000cH
	test	eax, eax
	je	SHORT $L70245
	push	4
	push	OFFSET FLAT:$SG70248
	mov	edx, DWORD PTR _val$[ebp]
	mov	eax, DWORD PTR [edx]
	push	eax
	call	_strncmp
	add	esp, 12					; 0000000cH
	test	eax, eax
	jne	SHORT $L70244
$L70245:

; 58   : 			fmt = "_EVA_HTTPLINK";

	mov	DWORD PTR _fmt$[ebp], OFFSET FLAT:$SG70249
$L70244:

; 60   : 
; 61   : 	/* Handle value format */
; 62   : 	if(!strncmp(fmt, add_sz_str("_EVA_RELATION")) || (!strcmp(fmt, "_EVA_TXTLINK") && form->step != HtmlPrint))

	push	13					; 0000000dH
	push	OFFSET FLAT:$SG70252
	mov	ecx, DWORD PTR _fmt$[ebp]
	push	ecx
	call	_strncmp
	add	esp, 12					; 0000000cH
	test	eax, eax
	je	SHORT $L70251
	push	OFFSET FLAT:$SG70253
	mov	edx, DWORD PTR _fmt$[ebp]
	push	edx
	call	_strcmp
	add	esp, 8
	test	eax, eax
	jne	$L70250
	mov	eax, DWORD PTR _form$[ebp]
	cmp	DWORD PTR [eax+176], 7
	je	$L70250
$L70251:

; 64   : 		/* Relation to other object : check if given value is a relation */
; 65   : 		char *idend = NULL;

	mov	DWORD PTR _idend$70254[ebp], 0

; 66   : 		unsigned long idrelobj = val->txt ? strtoul(val->txt, &idend, 10) : 0;

	mov	ecx, DWORD PTR _val$[ebp]
	cmp	DWORD PTR [ecx], 0
	je	SHORT $L71218
	push	10					; 0000000aH
	lea	edx, DWORD PTR _idend$70254[ebp]
	push	edx
	mov	eax, DWORD PTR _val$[ebp]
	mov	ecx, DWORD PTR [eax]
	push	ecx
	call	_strtoul
	add	esp, 12					; 0000000cH
	mov	DWORD PTR -280+[ebp], eax
	jmp	SHORT $L71219
$L71218:
	mov	DWORD PTR -280+[ebp], 0
$L71219:
	mov	edx, DWORD PTR -280+[ebp]
	mov	DWORD PTR _idrelobj$70256[ebp], edx

; 67   : 		int b_button = strstr(fmt, "BTN") != NULL;

	push	OFFSET FLAT:$SG70259
	mov	eax, DWORD PTR _fmt$[ebp]
	push	eax
	call	_strstr
	add	esp, 8
	neg	eax
	sbb	eax, eax
	neg	eax
	mov	DWORD PTR _b_button$70257[ebp], eax

; 68   : 		int b_formlb = strstr(fmt, "FORM") != NULL;

	push	OFFSET FLAT:$SG70262
	mov	ecx, DWORD PTR _fmt$[ebp]
	push	ecx
	call	_strstr
	add	esp, 8
	neg	eax
	sbb	eax, eax
	neg	eax
	mov	DWORD PTR _b_formlb$70260[ebp], eax

; 69   : 		int b_label = strcmp(fmt, "_EVA_RELATION_BTN0");

	push	OFFSET FLAT:$SG70264
	mov	edx, DWORD PTR _fmt$[ebp]
	push	edx
	call	_strcmp
	add	esp, 8
	mov	DWORD PTR _b_label$70263[ebp], eax

; 70   : 		if(idend && *idend) idrelobj = 0;

	cmp	DWORD PTR _idend$70254[ebp], 0
	je	SHORT $L70265
	mov	eax, DWORD PTR _idend$70254[ebp]
	movsx	ecx, BYTE PTR [eax]
	test	ecx, ecx
	je	SHORT $L70265
	mov	DWORD PTR _idrelobj$70256[ebp], 0
$L70265:

; 71   : 
; 72   : 		/* Set value object if value is not a relation */
; 73   : 		if(!strcmp(fmt, "_EVA_TXTLINK"))

	push	OFFSET FLAT:$SG70267
	mov	edx, DWORD PTR _fmt$[ebp]
	push	edx
	call	_strcmp
	add	esp, 8
	test	eax, eax
	jne	SHORT $L70266

; 75   : 			idrelobj = val->IdValObj ? val->IdValObj : val->IdObj;

	mov	eax, DWORD PTR _val$[ebp]
	cmp	DWORD PTR [eax+24], 0
	je	SHORT $L71220
	mov	ecx, DWORD PTR _val$[ebp]
	mov	edx, DWORD PTR [ecx+24]
	mov	DWORD PTR -284+[ebp], edx
	jmp	SHORT $L71221
$L71220:
	mov	eax, DWORD PTR _val$[ebp]
	mov	ecx, DWORD PTR [eax+20]
	mov	DWORD PTR -284+[ebp], ecx
$L71221:
	mov	edx, DWORD PTR -284+[ebp]
	mov	DWORD PTR _idrelobj$70256[ebp], edx

; 76   : 			val->b_relation = 0;

	mov	eax, DWORD PTR _val$[ebp]
	mov	BYTE PTR [eax+12], 0

; 78   : 		else if(!val->IdValObj) val->IdValObj = idrelobj;

	jmp	SHORT $L70269
$L70266:
	mov	ecx, DWORD PTR _val$[ebp]
	cmp	DWORD PTR [ecx+24], 0
	jne	SHORT $L70269
	mov	edx, DWORD PTR _val$[ebp]
	mov	eax, DWORD PTR _idrelobj$70256[ebp]
	mov	DWORD PTR [edx+24], eax
$L70269:

; 79   : 
; 80   : 		if(!idrelobj)

	cmp	DWORD PTR _idrelobj$70256[ebp], 0
	jne	SHORT $L70270

; 82   : 			DYNBUF_ADD_CELL(html, table, row, 0, TO_HTML);

	push	1
	push	OFFSET FLAT:_plain_to_html
	push	0
	mov	ecx, DWORD PTR _row$[ebp]
	push	ecx
	mov	edx, DWORD PTR _table$[ebp]
	push	edx
	call	_dyntab_sz
	add	esp, 12					; 0000000cH
	push	eax
	push	0
	mov	eax, DWORD PTR _row$[ebp]
	push	eax
	mov	ecx, DWORD PTR _table$[ebp]
	push	ecx
	call	_dyntab_val
	add	esp, 12					; 0000000cH
	push	eax
	mov	edx, DWORD PTR _html$[ebp]
	push	edx
	call	_dynbuf_add
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L70271
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29872], OFFSET FLAT:$SG70273
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 82		; 00000052H
	jmp	$eva_err$70274
$L70271:

; 84   : 		else

	jmp	$L70308
$L70270:

; 86   : 			/* Output open button */
; 87   : 			char symtyp[64] = {0};

	mov	BYTE PTR _symtyp$70276[ebp], 0
	mov	ecx, 15					; 0000000fH
	xor	eax, eax
	lea	edi, DWORD PTR _symtyp$70276[ebp+1]
	rep stosd
	stosw
	stosb

; 88   : 			unsigned long symlen = 0;

	mov	DWORD PTR _symlen$70277[ebp], 0

; 89   : 			if(b_button) symlen += snprintf(symtyp + symlen, sizeof(symtyp) - symlen, "%sSYMBOL", *symtyp ? "+" : "");

	cmp	DWORD PTR _b_button$70257[ebp], 0
	je	SHORT $L70278
	movsx	edx, BYTE PTR _symtyp$70276[ebp]
	test	edx, edx
	je	SHORT $L71222
	mov	DWORD PTR -288+[ebp], OFFSET FLAT:$SG70279
	jmp	SHORT $L71223
$L71222:
	mov	DWORD PTR -288+[ebp], OFFSET FLAT:$SG70280
$L71223:
	mov	eax, DWORD PTR -288+[ebp]
	push	eax
	push	OFFSET FLAT:$SG70281
	mov	ecx, 64					; 00000040H
	sub	ecx, DWORD PTR _symlen$70277[ebp]
	push	ecx
	mov	edx, DWORD PTR _symlen$70277[ebp]
	lea	eax, DWORD PTR _symtyp$70276[ebp+edx]
	push	eax
	call	__snprintf
	add	esp, 16					; 00000010H
	mov	ecx, DWORD PTR _symlen$70277[ebp]
	add	ecx, eax
	mov	DWORD PTR _symlen$70277[ebp], ecx
$L70278:

; 90   : 			if(b_formlb) symlen += snprintf(symtyp + symlen, sizeof(symtyp) - symlen, "%sNAME", *symtyp ? "+" : "");

	cmp	DWORD PTR _b_formlb$70260[ebp], 0
	je	SHORT $L70282
	movsx	edx, BYTE PTR _symtyp$70276[ebp]
	test	edx, edx
	je	SHORT $L71224
	mov	DWORD PTR -292+[ebp], OFFSET FLAT:$SG70283
	jmp	SHORT $L71225
$L71224:
	mov	DWORD PTR -292+[ebp], OFFSET FLAT:$SG70284
$L71225:
	mov	eax, DWORD PTR -292+[ebp]
	push	eax
	push	OFFSET FLAT:$SG70285
	mov	ecx, 64					; 00000040H
	sub	ecx, DWORD PTR _symlen$70277[ebp]
	push	ecx
	mov	edx, DWORD PTR _symlen$70277[ebp]
	lea	eax, DWORD PTR _symtyp$70276[ebp+edx]
	push	eax
	call	__snprintf
	add	esp, 16					; 00000010H
	mov	ecx, DWORD PTR _symlen$70277[ebp]
	add	ecx, eax
	mov	DWORD PTR _symlen$70277[ebp], ecx
$L70282:

; 91   : 			if(b_label) symlen += snprintf(symtyp + symlen, sizeof(symtyp) - symlen, "%sLABEL", *symtyp ? "+" : "");

	cmp	DWORD PTR _b_label$70263[ebp], 0
	je	SHORT $L70286
	movsx	edx, BYTE PTR _symtyp$70276[ebp]
	test	edx, edx
	je	SHORT $L71226
	mov	DWORD PTR -296+[ebp], OFFSET FLAT:$SG70287
	jmp	SHORT $L71227
$L71226:
	mov	DWORD PTR -296+[ebp], OFFSET FLAT:$SG70288
$L71227:
	mov	eax, DWORD PTR -296+[ebp]
	push	eax
	push	OFFSET FLAT:$SG70289
	mov	ecx, 64					; 00000040H
	sub	ecx, DWORD PTR _symlen$70277[ebp]
	push	ecx
	mov	edx, DWORD PTR _symlen$70277[ebp]
	lea	eax, DWORD PTR _symtyp$70276[ebp+edx]
	push	eax
	call	__snprintf
	add	esp, 16					; 00000010H
	mov	ecx, DWORD PTR _symlen$70277[ebp]
	add	ecx, eax
	mov	DWORD PTR _symlen$70277[ebp], ecx
$L70286:

; 92   : 			if(!tbl || (tooltip_mode & 1)) symlen += snprintf(symtyp + symlen, sizeof(symtyp) - symlen, "%sOBJNOTES", *symtyp ? "+" : "");

	cmp	DWORD PTR _tbl$[ebp], 0
	je	SHORT $L70291
	mov	edx, DWORD PTR _tooltip_mode$[ebp]
	and	edx, 1
	test	edx, edx
	je	SHORT $L70290
$L70291:
	movsx	eax, BYTE PTR _symtyp$70276[ebp]
	test	eax, eax
	je	SHORT $L71228
	mov	DWORD PTR -300+[ebp], OFFSET FLAT:$SG70292
	jmp	SHORT $L71229
$L71228:
	mov	DWORD PTR -300+[ebp], OFFSET FLAT:$SG70293
$L71229:
	mov	ecx, DWORD PTR -300+[ebp]
	push	ecx
	push	OFFSET FLAT:$SG70294
	mov	edx, 64					; 00000040H
	sub	edx, DWORD PTR _symlen$70277[ebp]
	push	edx
	mov	eax, DWORD PTR _symlen$70277[ebp]
	lea	ecx, DWORD PTR _symtyp$70276[ebp+eax]
	push	ecx
	call	__snprintf
	add	esp, 16					; 00000010H
	mov	edx, DWORD PTR _symlen$70277[ebp]
	add	edx, eax
	mov	DWORD PTR _symlen$70277[ebp], edx
$L70290:

; 93   : 			if(b_button) DYNBUF_ADD_STR(html, "<table noborder cellpadding=0 cellspacing=0><tr>");

	cmp	DWORD PTR _b_button$70257[ebp], 0
	je	SHORT $L70297
	push	0
	push	0
	push	48					; 00000030H
	push	OFFSET FLAT:$SG70298
	mov	eax, DWORD PTR _html$[ebp]
	push	eax
	call	_dynbuf_add
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L70297
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29872], OFFSET FLAT:$SG70300
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 93		; 0000005dH
	jmp	$eva_err$70274
$L70297:

; 94   : 			if(qry_cache_idobj(&objdata, idrelobj) ||
; 95   : 				ctrl_add_symbol_btn(cntxt, ctrl, val, &objdata, 0, b_button ? "" : NULL, symtyp))

	push	3
	push	0
	mov	eax, DWORD PTR _idrelobj$70256[ebp]
	push	eax
	lea	ecx, DWORD PTR _objdata$[ebp]
	push	ecx
	mov	edx, DWORD PTR _cntxt$[ebp]
	push	edx
	call	_qry_cache_idobj_field
	add	esp, 20					; 00000014H
	test	eax, eax
	jne	SHORT $L70304
	lea	eax, DWORD PTR _symtyp$70276[ebp]
	push	eax
	mov	ecx, DWORD PTR _b_button$70257[ebp]
	neg	ecx
	sbb	ecx, ecx
	and	ecx, OFFSET FLAT:$SG70305
	push	ecx
	push	0
	lea	edx, DWORD PTR _objdata$[ebp]
	push	edx
	mov	eax, DWORD PTR _val$[ebp]
	push	eax
	mov	ecx, DWORD PTR _ctrl$[ebp]
	push	ecx
	mov	edx, DWORD PTR _cntxt$[ebp]
	push	edx
	call	_ctrl_add_symbol_btn
	add	esp, 28					; 0000001cH
	test	eax, eax
	je	SHORT $L70303
$L70304:

; 96   : 				STACK_ERROR;

	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 96		; 00000060H
	jmp	$eva_err$70274
$L70303:

; 97   : 			if(b_button) DYNBUF_ADD_STR(html, "</tr></table>");

	cmp	DWORD PTR _b_button$70257[ebp], 0
	je	SHORT $L70308
	push	0
	push	0
	push	13					; 0000000dH
	push	OFFSET FLAT:$SG70309
	mov	ecx, DWORD PTR _html$[ebp]
	push	ecx
	call	_dynbuf_add
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L70308
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29872], OFFSET FLAT:$SG70311
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 97		; 00000061H
	jmp	$eva_err$70274
$L70308:

; 99   : 
; 100  : 		/* Handle striping */
; 101  : 		(*tot_char) ++;

	mov	ecx, DWORD PTR _tot_char$[ebp]
	mov	edx, DWORD PTR [ecx]
	add	edx, 1
	mov	eax, DWORD PTR _tot_char$[ebp]
	mov	DWORD PTR [eax], edx

; 103  : 	else if(!strcmp(fmt, "_EVA_EMAIL"))

	jmp	$L70489
$L70250:
	push	OFFSET FLAT:$SG70314
	mov	ecx, DWORD PTR _fmt$[ebp]
	push	ecx
	call	_strcmp
	add	esp, 8
	test	eax, eax
	jne	$L70313

; 105  : 		/* Email adress */
; 106  : 		DYNBUF_ADD3_CELL(html, "<a href='mailto:", table, row, 0, HTML_NO_QUOTE, "'>");

	push	2
	push	OFFSET FLAT:$SG70316
	push	1
	push	OFFSET FLAT:_no_quote
	push	0
	mov	edx, DWORD PTR _row$[ebp]
	push	edx
	mov	eax, DWORD PTR _table$[ebp]
	push	eax
	call	_dyntab_sz
	add	esp, 12					; 0000000cH
	push	eax
	push	0
	mov	ecx, DWORD PTR _row$[ebp]
	push	ecx
	mov	edx, DWORD PTR _table$[ebp]
	push	edx
	call	_dyntab_val
	add	esp, 12					; 0000000cH
	push	eax
	push	16					; 00000010H
	push	OFFSET FLAT:$SG70317
	mov	eax, DWORD PTR _html$[ebp]
	push	eax
	call	_dynbuf_add3
	add	esp, 36					; 00000024H
	test	eax, eax
	je	SHORT $L70315
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29872], OFFSET FLAT:$SG70319
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 106		; 0000006aH
	jmp	$eva_err$70274
$L70315:

; 107  : 		HANDLE_STRIP({
; 108  : 			if(put_html_bold_substring(cntxt, html, DYNTAB_VAL_SZ(table, row, 0), tbl ? &tbl->srchwords : NULL))
; 109  : 				STACK_ERROR;
; 110  : 		})

	cmp	DWORD PTR _html$[ebp], 0
	je	$L70320
	mov	eax, DWORD PTR _html$[ebp]
	cmp	DWORD PTR [eax], 0
	je	SHORT $L71230
	mov	ecx, DWORD PTR _html$[ebp]
	mov	edx, DWORD PTR [ecx]
	mov	eax, DWORD PTR [edx+4]
	mov	DWORD PTR -304+[ebp], eax
	jmp	SHORT $L71231
$L71230:
	mov	DWORD PTR -304+[ebp], 0
$L71231:
	mov	ecx, DWORD PTR -304+[ebp]
	mov	DWORD PTR __cnt0$70321[ebp], ecx
	cmp	DWORD PTR _tbl$[ebp], 0
	je	SHORT $L71232
	mov	edx, DWORD PTR _tbl$[ebp]
	add	edx, 104				; 00000068H
	mov	DWORD PTR -308+[ebp], edx
	jmp	SHORT $L71233
$L71232:
	mov	DWORD PTR -308+[ebp], 0
$L71233:
	mov	eax, DWORD PTR -308+[ebp]
	push	eax
	push	0
	mov	ecx, DWORD PTR _row$[ebp]
	push	ecx
	mov	edx, DWORD PTR _table$[ebp]
	push	edx
	call	_dyntab_sz
	add	esp, 12					; 0000000cH
	push	eax
	push	0
	mov	eax, DWORD PTR _row$[ebp]
	push	eax
	mov	ecx, DWORD PTR _table$[ebp]
	push	ecx
	call	_dyntab_val
	add	esp, 12					; 0000000cH
	push	eax
	mov	edx, DWORD PTR _html$[ebp]
	push	edx
	mov	eax, DWORD PTR _cntxt$[ebp]
	push	eax
	call	_put_html_bold_substring
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L70323
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 110		; 0000006eH
	jmp	$eva_err$70274
$L70323:
	mov	edx, DWORD PTR _tot_char$[ebp]
	push	edx
	mov	eax, DWORD PTR _strip$[ebp]
	push	eax
	mov	ecx, DWORD PTR __cnt0$70321[ebp]
	push	ecx
	mov	edx, DWORD PTR _html$[ebp]
	push	edx
	call	_dynbuf_strip
	add	esp, 16					; 00000010H
	mov	ecx, DWORD PTR _b_stripped$[ebp]
	mov	DWORD PTR [ecx], eax
$L70320:

; 111  : 		DYNBUF_ADD_STR(html, "</a>");

	push	0
	push	0
	push	4
	push	OFFSET FLAT:$SG70326
	mov	edx, DWORD PTR _html$[ebp]
	push	edx
	call	_dynbuf_add
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L70325
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29872], OFFSET FLAT:$SG70328
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 111		; 0000006fH
	jmp	$eva_err$70274
$L70325:

; 113  : 	else if(!strcmp(fmt, "_EVA_HTTPLINK"))

	jmp	$L70489
$L70313:
	push	OFFSET FLAT:$SG70331
	mov	edx, DWORD PTR _fmt$[ebp]
	push	edx
	call	_strcmp
	add	esp, 8
	test	eax, eax
	jne	$L70330

; 115  : 		/* HTTP link */
; 116  : 		size_t sz = dyntab_sz(table, row, 0);

	push	0
	mov	eax, DWORD PTR _row$[ebp]
	push	eax
	mov	ecx, DWORD PTR _table$[ebp]
	push	ecx
	call	_dyntab_sz
	add	esp, 12					; 0000000cH
	mov	DWORD PTR _sz$70332[ebp], eax

; 117  : 		char *url = dyntab_val(table, row, 0);

	push	0
	mov	edx, DWORD PTR _row$[ebp]
	push	edx
	mov	eax, DWORD PTR _table$[ebp]
	push	eax
	call	_dyntab_val
	add	esp, 12					; 0000000cH
	mov	DWORD PTR _url$70333[ebp], eax

; 118  : 		char *adr = strstr(url, "://");

	push	OFFSET FLAT:$SG70335
	mov	ecx, DWORD PTR _url$70333[ebp]
	push	ecx
	call	_strstr
	add	esp, 8
	mov	DWORD PTR _adr$70334[ebp], eax

; 119  : 		char *urlstrip = sz < 200 ? NULL : strchr(url + 30, '/');

	cmp	DWORD PTR _sz$70332[ebp], 200		; 000000c8H
	jae	SHORT $L71234
	mov	DWORD PTR -312+[ebp], 0
	jmp	SHORT $L71235
$L71234:
	push	47					; 0000002fH
	mov	edx, DWORD PTR _url$70333[ebp]
	add	edx, 30					; 0000001eH
	push	edx
	call	_strchr
	add	esp, 8
	mov	DWORD PTR -312+[ebp], eax
$L71235:
	mov	eax, DWORD PTR -312+[ebp]
	mov	DWORD PTR _urlstrip$70336[ebp], eax

; 120  : 		DYNBUF_ADD_STR(html, "<a href='");

	push	0
	push	0
	push	9
	push	OFFSET FLAT:$SG70340
	mov	ecx, DWORD PTR _html$[ebp]
	push	ecx
	call	_dynbuf_add
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L70339
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29872], OFFSET FLAT:$SG70342
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 120		; 00000078H
	jmp	$eva_err$70274
$L70339:

; 121  : 		if(!adr && *url != '.') DYNBUF_ADD_STR(html, "http://");

	cmp	DWORD PTR _adr$70334[ebp], 0
	jne	SHORT $L70345
	mov	ecx, DWORD PTR _url$70333[ebp]
	movsx	edx, BYTE PTR [ecx]
	cmp	edx, 46					; 0000002eH
	je	SHORT $L70345
	push	0
	push	0
	push	7
	push	OFFSET FLAT:$SG70346
	mov	eax, DWORD PTR _html$[ebp]
	push	eax
	call	_dynbuf_add
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L70345
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29872], OFFSET FLAT:$SG70348
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 121		; 00000079H
	jmp	$eva_err$70274
$L70345:

; 122  : 		DYNBUF_ADD(html, url, sz, HTML_NO_QUOTE);

	push	1
	push	OFFSET FLAT:_no_quote
	mov	eax, DWORD PTR _sz$70332[ebp]
	push	eax
	mov	ecx, DWORD PTR _url$70333[ebp]
	push	ecx
	mov	edx, DWORD PTR _html$[ebp]
	push	edx
	call	_dynbuf_add
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L70349
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29872], OFFSET FLAT:$SG70351
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 122		; 0000007aH
	jmp	$eva_err$70274
$L70349:

; 123  : 		DYNBUF_ADD_STR(html, "' target=_blank>");

	push	0
	push	0
	push	16					; 00000010H
	push	OFFSET FLAT:$SG70354
	mov	edx, DWORD PTR _html$[ebp]
	push	edx
	call	_dynbuf_add
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L70353
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29872], OFFSET FLAT:$SG70356
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 123		; 0000007bH
	jmp	$eva_err$70274
$L70353:

; 124  : 		adr = adr ? adr + 3 : url;

	cmp	DWORD PTR _adr$70334[ebp], 0
	je	SHORT $L71236
	mov	edx, DWORD PTR _adr$70334[ebp]
	add	edx, 3
	mov	DWORD PTR -316+[ebp], edx
	jmp	SHORT $L71237
$L71236:
	mov	eax, DWORD PTR _url$70333[ebp]
	mov	DWORD PTR -316+[ebp], eax
$L71237:
	mov	ecx, DWORD PTR -316+[ebp]
	mov	DWORD PTR _adr$70334[ebp], ecx

; 125  : 		sz = urlstrip ? urlstrip - adr + 1 : strlen(adr);

	cmp	DWORD PTR _urlstrip$70336[ebp], 0
	je	SHORT $L71238
	mov	edx, DWORD PTR _urlstrip$70336[ebp]
	sub	edx, DWORD PTR _adr$70334[ebp]
	add	edx, 1
	mov	DWORD PTR -320+[ebp], edx
	jmp	SHORT $L71239
$L71238:
	mov	eax, DWORD PTR _adr$70334[ebp]
	push	eax
	call	_strlen
	add	esp, 4
	mov	DWORD PTR -320+[ebp], eax
$L71239:
	mov	ecx, DWORD PTR -320+[ebp]
	mov	DWORD PTR _sz$70332[ebp], ecx

; 126  : 		HANDLE_STRIP({
; 127  : 			if(put_html_bold_substring(cntxt, html, adr, sz, tbl ? &tbl->srchwords : NULL))
; 128  : 				STACK_ERROR;
; 129  : 			if(urlstrip) DYNBUF_ADD_STR(html, "...");
; 130  : 		})

	cmp	DWORD PTR _html$[ebp], 0
	je	$L70357
	mov	edx, DWORD PTR _html$[ebp]
	cmp	DWORD PTR [edx], 0
	je	SHORT $L71240
	mov	eax, DWORD PTR _html$[ebp]
	mov	ecx, DWORD PTR [eax]
	mov	edx, DWORD PTR [ecx+4]
	mov	DWORD PTR -324+[ebp], edx
	jmp	SHORT $L71241
$L71240:
	mov	DWORD PTR -324+[ebp], 0
$L71241:
	mov	eax, DWORD PTR -324+[ebp]
	mov	DWORD PTR __cnt0$70358[ebp], eax
	cmp	DWORD PTR _tbl$[ebp], 0
	je	SHORT $L71242
	mov	ecx, DWORD PTR _tbl$[ebp]
	add	ecx, 104				; 00000068H
	mov	DWORD PTR -328+[ebp], ecx
	jmp	SHORT $L71243
$L71242:
	mov	DWORD PTR -328+[ebp], 0
$L71243:
	mov	edx, DWORD PTR -328+[ebp]
	push	edx
	mov	eax, DWORD PTR _sz$70332[ebp]
	push	eax
	mov	ecx, DWORD PTR _adr$70334[ebp]
	push	ecx
	mov	edx, DWORD PTR _html$[ebp]
	push	edx
	mov	eax, DWORD PTR _cntxt$[ebp]
	push	eax
	call	_put_html_bold_substring
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L70360
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 130		; 00000082H
	jmp	$eva_err$70274
$L70360:
	cmp	DWORD PTR _urlstrip$70336[ebp], 0
	je	SHORT $L70363
	push	0
	push	0
	push	3
	push	OFFSET FLAT:$SG70364
	mov	edx, DWORD PTR _html$[ebp]
	push	edx
	call	_dynbuf_add
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L70363
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29872], OFFSET FLAT:$SG70366
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 130		; 00000082H
	jmp	$eva_err$70274
$L70363:
	mov	edx, DWORD PTR _tot_char$[ebp]
	push	edx
	mov	eax, DWORD PTR _strip$[ebp]
	push	eax
	mov	ecx, DWORD PTR __cnt0$70358[ebp]
	push	ecx
	mov	edx, DWORD PTR _html$[ebp]
	push	edx
	call	_dynbuf_strip
	add	esp, 16					; 00000010H
	mov	ecx, DWORD PTR _b_stripped$[ebp]
	mov	DWORD PTR [ecx], eax
$L70357:

; 131  : 		DYNBUF_ADD_STR(html, "</a>");

	push	0
	push	0
	push	4
	push	OFFSET FLAT:$SG70369
	mov	edx, DWORD PTR _html$[ebp]
	push	edx
	call	_dynbuf_add
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L70368
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29872], OFFSET FLAT:$SG70371
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 131		; 00000083H
	jmp	$eva_err$70274
$L70368:

; 133  : 	else if(!strcmp(fmt, "_EVA_DOCUMENT"))

	jmp	$L70489
$L70330:
	push	OFFSET FLAT:$SG70374
	mov	edx, DWORD PTR _fmt$[ebp]
	push	edx
	call	_strcmp
	add	esp, 8
	test	eax, eax
	jne	$L70373

; 135  : 		/* Link to document */
; 136  : 		char *filename;
; 137  : 		DynTableCell *name, *path;
; 138  : 
; 139  : 		/* Read linked object */
; 140  : 		DYNTAB_SET_CELL(&id_obj, 0, 0, table, row, 0);

	push	0
	push	0
	mov	eax, DWORD PTR _row$[ebp]
	push	eax
	mov	ecx, DWORD PTR _table$[ebp]
	push	ecx
	call	_dyntab_cell
	add	esp, 12					; 0000000cH
	push	eax
	push	0
	push	0
	lea	edx, DWORD PTR _id_obj$[ebp]
	push	edx
	call	_dyntab_copy
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L70378
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29872], OFFSET FLAT:$SG70380
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 140		; 0000008cH
	jmp	$eva_err$70274
$L70378:

; 141  : 		if(qry_obj_data(cntxt, &objdata, &id_obj, NULL)) STACK_ERROR;

	push	0
	lea	edx, DWORD PTR _id_obj$[ebp]
	push	edx
	lea	eax, DWORD PTR _objdata$[ebp]
	push	eax
	mov	ecx, DWORD PTR _cntxt$[ebp]
	push	ecx
	call	_qry_obj_data
	add	esp, 16					; 00000010H
	test	eax, eax
	je	SHORT $L70382
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 141		; 0000008dH
	jmp	$eva_err$70274
$L70382:

; 142  : 
; 143  : 		/* Add link to file */
; 144  : 		path = DYNTAB_FIELD_CELL(&objdata, FILE_SERVER_NAME);

	push	0
	push	-1
	push	OFFSET FLAT:$SG70383
	lea	eax, DWORD PTR _objdata$[ebp]
	push	eax
	call	_dyntab_field_cell
	add	esp, 16					; 00000010H
	mov	DWORD PTR _path$70377[ebp], eax

; 145  : 		if(path)

	cmp	DWORD PTR _path$70377[ebp], 0
	je	$L70400

; 147  : 			DYNBUF_ADD3(html, "<a href='../" DIRECTORY_DOCS "/", cntxt->dbname, 0, NO_CONV, "");

	push	0
	push	OFFSET FLAT:$SG70387
	push	0
	push	0
	push	0
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	edx, DWORD PTR [ecx+29804]
	push	edx
	push	17					; 00000011H
	push	OFFSET FLAT:$SG70388
	mov	eax, DWORD PTR _html$[ebp]
	push	eax
	call	_dynbuf_add3
	add	esp, 36					; 00000024H
	test	eax, eax
	je	SHORT $L70386
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29872], OFFSET FLAT:$SG70390
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 147		; 00000093H
	jmp	$eva_err$70274
$L70386:

; 148  : 			DYNBUF_ADD3_CELLP(html, "/", path, HTML_NO_QUOTE, "'");

	mov	eax, DWORD PTR _path$70377[ebp]
	mov	DWORD PTR __c$70391[ebp], eax
	cmp	DWORD PTR __c$70391[ebp], 0
	je	SHORT $L71244
	mov	ecx, DWORD PTR __c$70391[ebp]
	mov	edx, DWORD PTR [ecx+4]
	mov	DWORD PTR -332+[ebp], edx
	jmp	SHORT $L71245
$L71244:
	mov	DWORD PTR -332+[ebp], 0
$L71245:
	cmp	DWORD PTR __c$70391[ebp], 0
	je	SHORT $L71246
	mov	eax, DWORD PTR __c$70391[ebp]
	mov	ecx, DWORD PTR [eax]
	mov	DWORD PTR -336+[ebp], ecx
	jmp	SHORT $L71247
$L71246:
	mov	DWORD PTR -336+[ebp], 0
$L71247:
	push	1
	push	OFFSET FLAT:$SG70394
	push	1
	push	OFFSET FLAT:_no_quote
	mov	edx, DWORD PTR -332+[ebp]
	push	edx
	mov	eax, DWORD PTR -336+[ebp]
	push	eax
	push	1
	push	OFFSET FLAT:$SG70395
	mov	ecx, DWORD PTR _html$[ebp]
	push	ecx
	call	_dynbuf_add3
	add	esp, 36					; 00000024H
	test	eax, eax
	je	SHORT $L70393
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29872], OFFSET FLAT:$SG70397
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 148		; 00000094H
	jmp	$eva_err$70274
$L70393:

; 149  : 			DYNBUF_ADD3_CELLP(html, " target='W", path, HTML_NO_QUOTE, "'>");

	mov	ecx, DWORD PTR _path$70377[ebp]
	mov	DWORD PTR __c$70398[ebp], ecx
	cmp	DWORD PTR __c$70398[ebp], 0
	je	SHORT $L71248
	mov	edx, DWORD PTR __c$70398[ebp]
	mov	eax, DWORD PTR [edx+4]
	mov	DWORD PTR -340+[ebp], eax
	jmp	SHORT $L71249
$L71248:
	mov	DWORD PTR -340+[ebp], 0
$L71249:
	cmp	DWORD PTR __c$70398[ebp], 0
	je	SHORT $L71250
	mov	ecx, DWORD PTR __c$70398[ebp]
	mov	edx, DWORD PTR [ecx]
	mov	DWORD PTR -344+[ebp], edx
	jmp	SHORT $L71251
$L71250:
	mov	DWORD PTR -344+[ebp], 0
$L71251:
	push	2
	push	OFFSET FLAT:$SG70401
	push	1
	push	OFFSET FLAT:_no_quote
	mov	eax, DWORD PTR -340+[ebp]
	push	eax
	mov	ecx, DWORD PTR -344+[ebp]
	push	ecx
	push	10					; 0000000aH
	push	OFFSET FLAT:$SG70402
	mov	edx, DWORD PTR _html$[ebp]
	push	edx
	call	_dynbuf_add3
	add	esp, 36					; 00000024H
	test	eax, eax
	je	SHORT $L70400
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29872], OFFSET FLAT:$SG70404
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 149		; 00000095H
	jmp	$eva_err$70274
$L70400:

; 151  : 		name = DYNTAB_FIELD_CELL(&objdata, FILE_CLIENT_PATH);

	push	0
	push	-1
	push	OFFSET FLAT:$SG70405
	lea	edx, DWORD PTR _objdata$[ebp]
	push	edx
	call	_dyntab_field_cell
	add	esp, 16					; 00000010H
	mov	DWORD PTR _name$70376[ebp], eax

; 152  : 		filename = (name && name->len) ? basename(name->txt, name->len) : "???";

	cmp	DWORD PTR _name$70376[ebp], 0
	je	SHORT $L71252
	mov	eax, DWORD PTR _name$70376[ebp]
	cmp	DWORD PTR [eax+4], 0
	je	SHORT $L71252
	mov	ecx, DWORD PTR _name$70376[ebp]
	mov	edx, DWORD PTR [ecx+4]
	push	edx
	mov	eax, DWORD PTR _name$70376[ebp]
	mov	ecx, DWORD PTR [eax]
	push	ecx
	call	_basename
	add	esp, 8
	mov	DWORD PTR -348+[ebp], eax
	jmp	SHORT $L71253
$L71252:
	mov	DWORD PTR -348+[ebp], OFFSET FLAT:$SG70406
$L71253:
	mov	edx, DWORD PTR -348+[ebp]
	mov	DWORD PTR _filename$70375[ebp], edx

; 153  : 		HANDLE_STRIP({
; 154  : 			if(put_html_bold_substring(cntxt, html, filename, 0, tbl ? &tbl->srchwords : NULL))
; 155  : 				STACK_ERROR;
; 156  : 		})

	cmp	DWORD PTR _html$[ebp], 0
	je	$L70407
	mov	eax, DWORD PTR _html$[ebp]
	cmp	DWORD PTR [eax], 0
	je	SHORT $L71254
	mov	ecx, DWORD PTR _html$[ebp]
	mov	edx, DWORD PTR [ecx]
	mov	eax, DWORD PTR [edx+4]
	mov	DWORD PTR -352+[ebp], eax
	jmp	SHORT $L71255
$L71254:
	mov	DWORD PTR -352+[ebp], 0
$L71255:
	mov	ecx, DWORD PTR -352+[ebp]
	mov	DWORD PTR __cnt0$70408[ebp], ecx
	cmp	DWORD PTR _tbl$[ebp], 0
	je	SHORT $L71256
	mov	edx, DWORD PTR _tbl$[ebp]
	add	edx, 104				; 00000068H
	mov	DWORD PTR -356+[ebp], edx
	jmp	SHORT $L71257
$L71256:
	mov	DWORD PTR -356+[ebp], 0
$L71257:
	mov	eax, DWORD PTR -356+[ebp]
	push	eax
	push	0
	mov	ecx, DWORD PTR _filename$70375[ebp]
	push	ecx
	mov	edx, DWORD PTR _html$[ebp]
	push	edx
	mov	eax, DWORD PTR _cntxt$[ebp]
	push	eax
	call	_put_html_bold_substring
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L70410
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 156		; 0000009cH
	jmp	$eva_err$70274
$L70410:
	mov	edx, DWORD PTR _tot_char$[ebp]
	push	edx
	mov	eax, DWORD PTR _strip$[ebp]
	push	eax
	mov	ecx, DWORD PTR __cnt0$70408[ebp]
	push	ecx
	mov	edx, DWORD PTR _html$[ebp]
	push	edx
	call	_dynbuf_strip
	add	esp, 16					; 00000010H
	mov	ecx, DWORD PTR _b_stripped$[ebp]
	mov	DWORD PTR [ecx], eax
$L70407:

; 157  : 		if(path) DYNBUF_ADD_STR(html, "</a>");

	cmp	DWORD PTR _path$70377[ebp], 0
	je	SHORT $L70413
	push	0
	push	0
	push	4
	push	OFFSET FLAT:$SG70414
	mov	edx, DWORD PTR _html$[ebp]
	push	edx
	call	_dynbuf_add
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L70413
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29872], OFFSET FLAT:$SG70416
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 157		; 0000009dH
	jmp	$eva_err$70274
$L70413:

; 159  : 	else if(!strcmp(fmt, "_EVA_HTML"))

	jmp	$L70489
$L70373:
	push	OFFSET FLAT:$SG70419
	mov	edx, DWORD PTR _fmt$[ebp]
	push	edx
	call	_strcmp
	add	esp, 8
	test	eax, eax
	jne	SHORT $L70418

; 161  : 		/* HTML : output raw value */
; 162  : 		DYNBUF_ADD_CELL(html, table, row, 0, NO_CONV);

	push	0
	push	0
	push	0
	mov	eax, DWORD PTR _row$[ebp]
	push	eax
	mov	ecx, DWORD PTR _table$[ebp]
	push	ecx
	call	_dyntab_sz
	add	esp, 12					; 0000000cH
	push	eax
	push	0
	mov	edx, DWORD PTR _row$[ebp]
	push	edx
	mov	eax, DWORD PTR _table$[ebp]
	push	eax
	call	_dyntab_val
	add	esp, 12					; 0000000cH
	push	eax
	mov	ecx, DWORD PTR _html$[ebp]
	push	ecx
	call	_dynbuf_add
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L70421
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29872], OFFSET FLAT:$SG70423
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 162		; 000000a2H
	jmp	$eva_err$70274
$L70421:

; 164  : 	else if(!strcmp(fmt, "_EVA_IMAGE"))

	jmp	$L70489
$L70418:
	push	OFFSET FLAT:$SG70426
	mov	ecx, DWORD PTR _fmt$[ebp]
	push	ecx
	call	_strcmp
	add	esp, 8
	test	eax, eax
	jne	$L70425

; 166  : 		/* Image : output <img> tag of appropriate size */
; 167  : 		DynTableCell *c = dyntab_cell(table, row, 0);

	push	0
	mov	edx, DWORD PTR _row$[ebp]
	push	edx
	mov	eax, DWORD PTR _table$[ebp]
	push	eax
	call	_dyntab_cell
	add	esp, 12					; 0000000cH
	mov	DWORD PTR _c$70427[ebp], eax

; 168  : 		unsigned long obj = DYNTAB_TOUL(&form->id_obj);

	push	10					; 0000000aH
	push	0
	push	0
	push	0
	mov	ecx, DWORD PTR _form$[ebp]
	add	ecx, 32					; 00000020H
	push	ecx
	call	_dyntab_val
	add	esp, 12					; 0000000cH
	push	eax
	call	_strtoul
	add	esp, 12					; 0000000cH
	mov	DWORD PTR _obj$70428[ebp], eax

; 169  : 		unsigned long idobj = (c->IdObj != obj) ? c->IdObj : (c->IdValObj != obj) ? c->IdValObj : 0;

	mov	edx, DWORD PTR _c$70427[ebp]
	mov	eax, DWORD PTR [edx+20]
	cmp	eax, DWORD PTR _obj$70428[ebp]
	je	SHORT $L71260
	mov	ecx, DWORD PTR _c$70427[ebp]
	mov	edx, DWORD PTR [ecx+20]
	mov	DWORD PTR -360+[ebp], edx
	jmp	SHORT $L71261
$L71260:
	mov	eax, DWORD PTR _c$70427[ebp]
	mov	ecx, DWORD PTR [eax+24]
	cmp	ecx, DWORD PTR _obj$70428[ebp]
	je	SHORT $L71258
	mov	edx, DWORD PTR _c$70427[ebp]
	mov	eax, DWORD PTR [edx+24]
	mov	DWORD PTR -364+[ebp], eax
	jmp	SHORT $L71259
$L71258:
	mov	DWORD PTR -364+[ebp], 0
$L71259:
	mov	ecx, DWORD PTR -364+[ebp]
	mov	DWORD PTR -360+[ebp], ecx
$L71261:
	mov	edx, DWORD PTR -360+[ebp]
	mov	DWORD PTR _idobj$70430[ebp], edx

; 170  : 		char htxt[16], *w = CTRL_ATTR_VAL(IMG_WIDTH), *h = CTRL_ATTR_VAL(IMG_HEIGHT);

	cmp	DWORD PTR _ctrl$[ebp], 0
	je	SHORT $L71262
	push	0
	push	-1
	push	OFFSET FLAT:$SG70433
	mov	eax, DWORD PTR _ctrl$[ebp]
	add	eax, 44					; 0000002cH
	push	eax
	call	_dyntab_field_val
	add	esp, 16					; 00000010H
	mov	DWORD PTR -368+[ebp], eax
	jmp	SHORT $L71263
$L71262:
	mov	DWORD PTR -368+[ebp], OFFSET FLAT:$SG70434
$L71263:
	mov	ecx, DWORD PTR -368+[ebp]
	mov	DWORD PTR _w$70432[ebp], ecx
	cmp	DWORD PTR _ctrl$[ebp], 0
	je	SHORT $L71264
	push	0
	push	-1
	push	OFFSET FLAT:$SG70436
	mov	edx, DWORD PTR _ctrl$[ebp]
	add	edx, 44					; 0000002cH
	push	edx
	call	_dyntab_field_val
	add	esp, 16					; 00000010H
	mov	DWORD PTR -372+[ebp], eax
	jmp	SHORT $L71265
$L71264:
	mov	DWORD PTR -372+[ebp], OFFSET FLAT:$SG70437
$L71265:
	mov	eax, DWORD PTR -372+[ebp]
	mov	DWORD PTR _h$70435[ebp], eax

; 171  : 
; 172  : 		/* Handle default image size */
; 173  : 		if(!*w && !*h)

	mov	ecx, DWORD PTR _w$70432[ebp]
	movsx	edx, BYTE PTR [ecx]
	test	edx, edx
	jne	SHORT $L70438
	mov	eax, DWORD PTR _h$70435[ebp]
	movsx	ecx, BYTE PTR [eax]
	test	ecx, ecx
	jne	SHORT $L70438

; 175  : 			w = ctrl->WIDTH;

	mov	edx, DWORD PTR _ctrl$[ebp]
	mov	eax, DWORD PTR [edx+308]
	mov	DWORD PTR _w$70432[ebp], eax

; 176  : 			h = ctrl->HEIGHT;

	mov	ecx, DWORD PTR _ctrl$[ebp]
	mov	edx, DWORD PTR [ecx+312]
	mov	DWORD PTR _h$70435[ebp], edx
$L70438:

; 178  : 
; 179  : 		/* Handle image in list field */
; 180  : 		if(tbl)

	cmp	DWORD PTR _tbl$[ebp], 0
	je	$L70447

; 182  : 			DynTableCell *fmt = dyntab_cell(&tbl->fontsize, c->col, 0);

	push	0
	mov	eax, DWORD PTR _c$70427[ebp]
	mov	ecx, DWORD PTR [eax+56]
	push	ecx
	mov	edx, DWORD PTR _tbl$[ebp]
	add	edx, 420				; 000001a4H
	push	edx
	call	_dyntab_cell
	add	esp, 12					; 0000000cH
	mov	DWORD PTR _fmt$70440[ebp], eax

; 183  : 			int hnum = (fmt && fmt->txt) ? 100 + 40 * atoi(fmt->txt) : 0;

	cmp	DWORD PTR _fmt$70440[ebp], 0
	je	SHORT $L71266
	mov	eax, DWORD PTR _fmt$70440[ebp]
	cmp	DWORD PTR [eax], 0
	je	SHORT $L71266
	mov	ecx, DWORD PTR _fmt$70440[ebp]
	mov	edx, DWORD PTR [ecx]
	push	edx
	call	_atoi
	add	esp, 4
	imul	eax, 40					; 00000028H
	add	eax, 100				; 00000064H
	mov	DWORD PTR -376+[ebp], eax
	jmp	SHORT $L71267
$L71266:
	mov	DWORD PTR -376+[ebp], 0
$L71267:
	mov	eax, DWORD PTR -376+[ebp]
	mov	DWORD PTR _hnum$70441[ebp], eax

; 184  : 			char *dh = (!fmt || !fmt->txt) ? "50" :
; 185  :                                 *fmt->txt == '0' ? NULL :
; 186  :                                     isdigit(*fmt->txt) ? fmt->txt :
; 187  :                                         (sprintf(htxt,"%d",hnum) > 0) ? htxt :
; 188  :                                             NULL;

	cmp	DWORD PTR _fmt$70440[ebp], 0
	je	$L71268
	mov	ecx, DWORD PTR _fmt$70440[ebp]
	cmp	DWORD PTR [ecx], 0
	je	$L71268
	mov	edx, DWORD PTR _fmt$70440[ebp]
	mov	eax, DWORD PTR [edx]
	movsx	ecx, BYTE PTR [eax]
	cmp	ecx, 48					; 00000030H
	jne	SHORT $L71273
	mov	DWORD PTR -380+[ebp], 0
	jmp	$L71274
$L71273:
	cmp	DWORD PTR ___mb_cur_max, 1
	jle	SHORT $L71269
	push	4
	mov	edx, DWORD PTR _fmt$70440[ebp]
	mov	eax, DWORD PTR [edx]
	movsx	ecx, BYTE PTR [eax]
	push	ecx
	call	__isctype
	add	esp, 8
	mov	DWORD PTR -384+[ebp], eax
	jmp	SHORT $L71270
$L71269:
	mov	edx, DWORD PTR _fmt$70440[ebp]
	mov	eax, DWORD PTR [edx]
	movsx	ecx, BYTE PTR [eax]
	mov	edx, DWORD PTR __pctype
	xor	eax, eax
	mov	ax, WORD PTR [edx+ecx*2]
	and	eax, 4
	mov	DWORD PTR -384+[ebp], eax
$L71270:
	cmp	DWORD PTR -384+[ebp], 0
	je	SHORT $L71271
	mov	ecx, DWORD PTR _fmt$70440[ebp]
	mov	edx, DWORD PTR [ecx]
	mov	DWORD PTR -388+[ebp], edx
	jmp	SHORT $L71272
$L71271:
	mov	eax, DWORD PTR _hnum$70441[ebp]
	push	eax
	push	OFFSET FLAT:$SG70446
	lea	ecx, DWORD PTR _htxt$70431[ebp]
	push	ecx
	call	_sprintf
	add	esp, 12					; 0000000cH
	xor	edx, edx
	test	eax, eax
	setle	dl
	dec	edx
	lea	eax, DWORD PTR _htxt$70431[ebp]
	and	edx, eax
	mov	DWORD PTR -388+[ebp], edx
$L71272:
	mov	ecx, DWORD PTR -388+[ebp]
	mov	DWORD PTR -380+[ebp], ecx
$L71274:
	mov	edx, DWORD PTR -380+[ebp]
	mov	DWORD PTR -392+[ebp], edx
	jmp	SHORT $L71275
$L71268:
	mov	DWORD PTR -392+[ebp], OFFSET FLAT:$SG70445
$L71275:
	mov	eax, DWORD PTR -392+[ebp]
	mov	DWORD PTR _dh$70442[ebp], eax

; 189  : 			if(dh && *dh != '0')

	cmp	DWORD PTR _dh$70442[ebp], 0
	je	SHORT $L70447
	mov	ecx, DWORD PTR _dh$70442[ebp]
	movsx	edx, BYTE PTR [ecx]
	cmp	edx, 48					; 00000030H
	je	SHORT $L70447

; 191  : 				h = dh;

	mov	eax, DWORD PTR _dh$70442[ebp]
	mov	DWORD PTR _h$70435[ebp], eax

; 192  : 				w = NULL;

	mov	DWORD PTR _w$70432[ebp], 0
$L70447:

; 195  : 
; 196  : 		/* Output image or thumbnail */
; 197  : 		if(put_html_image_dir(cntxt, NULL, CTRL_ATTR_VAL(IMAGE_DIR), c->txt, NULL, w, h, 0, idobj, NULL, NULL)) STACK_ERROR;

	cmp	DWORD PTR _ctrl$[ebp], 0
	je	SHORT $L71276
	push	0
	push	-1
	push	OFFSET FLAT:$SG70454
	mov	ecx, DWORD PTR _ctrl$[ebp]
	add	ecx, 44					; 0000002cH
	push	ecx
	call	_dyntab_field_val
	add	esp, 16					; 00000010H
	mov	DWORD PTR -396+[ebp], eax
	jmp	SHORT $L71277
$L71276:
	mov	DWORD PTR -396+[ebp], OFFSET FLAT:$SG70455
$L71277:
	push	0
	push	0
	mov	edx, DWORD PTR _idobj$70430[ebp]
	push	edx
	push	0
	mov	eax, DWORD PTR _h$70435[ebp]
	push	eax
	mov	ecx, DWORD PTR _w$70432[ebp]
	push	ecx
	push	0
	mov	edx, DWORD PTR _c$70427[ebp]
	mov	eax, DWORD PTR [edx]
	push	eax
	mov	ecx, DWORD PTR -396+[ebp]
	push	ecx
	push	0
	mov	edx, DWORD PTR _cntxt$[ebp]
	push	edx
	call	_put_html_image_dir
	add	esp, 44					; 0000002cH
	test	eax, eax
	je	SHORT $L70453
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 197		; 000000c5H
	jmp	$eva_err$70274
$L70453:

; 199  : 	else if(!strcmp(fmt, "_EVA_AGE") ||

	jmp	$L70489
$L70425:

; 200  : 			!strcmp(fmt, "_EVA_FILESIZE") ||
; 201  : 			!strcmp(fmt, "_EVA_NUMBER") ||
; 202  : 			!STRCMPCASE(fmt, "_EVA_MONEY") ||
; 203  : 			!strcmp(fmt, "_EVA_TELEPHONE"))

	push	OFFSET FLAT:$SG70459
	mov	ecx, DWORD PTR _fmt$[ebp]
	push	ecx
	call	_strcmp
	add	esp, 8
	test	eax, eax
	je	SHORT $L70458
	push	OFFSET FLAT:$SG70460
	mov	edx, DWORD PTR _fmt$[ebp]
	push	edx
	call	_strcmp
	add	esp, 8
	test	eax, eax
	je	SHORT $L70458
	push	OFFSET FLAT:$SG70461
	mov	eax, DWORD PTR _fmt$[ebp]
	push	eax
	call	_strcmp
	add	esp, 8
	test	eax, eax
	je	SHORT $L70458
	push	OFFSET FLAT:$SG70462
	mov	ecx, DWORD PTR _fmt$[ebp]
	push	ecx
	call	_stricmp
	add	esp, 8
	test	eax, eax
	je	SHORT $L70458
	push	OFFSET FLAT:$SG70463
	mov	edx, DWORD PTR _fmt$[ebp]
	push	edx
	call	_strcmp
	add	esp, 8
	test	eax, eax
	jne	$L70457
$L70458:

; 205  : 		/* Age, file size, number, money */
; 206  : 		HANDLE_STRIP({
; 207  : 			if(put_value_fmt(cntxt, &stripval, DYNTAB_VAL_SZ(table, row, 0), fmt) ||
; 208  : 				put_html_bold_substring(cntxt, html, DYNBUF_VAL_SZ(stripval), tbl ? &tbl->srchwords : NULL)) STACK_ERROR;
; 209  : 		});

	cmp	DWORD PTR _html$[ebp], 0
	je	$L70464
	mov	eax, DWORD PTR _html$[ebp]
	cmp	DWORD PTR [eax], 0
	je	SHORT $L71278
	mov	ecx, DWORD PTR _html$[ebp]
	mov	edx, DWORD PTR [ecx]
	mov	eax, DWORD PTR [edx+4]
	mov	DWORD PTR -400+[ebp], eax
	jmp	SHORT $L71279
$L71278:
	mov	DWORD PTR -400+[ebp], 0
$L71279:
	mov	ecx, DWORD PTR -400+[ebp]
	mov	DWORD PTR __cnt0$70465[ebp], ecx
	mov	edx, DWORD PTR _fmt$[ebp]
	push	edx
	push	0
	mov	eax, DWORD PTR _row$[ebp]
	push	eax
	mov	ecx, DWORD PTR _table$[ebp]
	push	ecx
	call	_dyntab_sz
	add	esp, 12					; 0000000cH
	push	eax
	push	0
	mov	edx, DWORD PTR _row$[ebp]
	push	edx
	mov	eax, DWORD PTR _table$[ebp]
	push	eax
	call	_dyntab_val
	add	esp, 12					; 0000000cH
	push	eax
	lea	ecx, DWORD PTR _stripval$[ebp]
	push	ecx
	mov	edx, DWORD PTR _cntxt$[ebp]
	push	edx
	call	_put_value_fmt
	add	esp, 20					; 00000014H
	test	eax, eax
	jne	$L70469
	cmp	DWORD PTR _tbl$[ebp], 0
	je	SHORT $L71280
	mov	eax, DWORD PTR _tbl$[ebp]
	add	eax, 104				; 00000068H
	mov	DWORD PTR -404+[ebp], eax
	jmp	SHORT $L71281
$L71280:
	mov	DWORD PTR -404+[ebp], 0
$L71281:
	cmp	DWORD PTR _stripval$[ebp], 0
	je	SHORT $L71282
	mov	ecx, DWORD PTR _stripval$[ebp]
	mov	edx, DWORD PTR [ecx+4]
	mov	DWORD PTR -408+[ebp], edx
	jmp	SHORT $L71283
$L71282:
	mov	DWORD PTR -408+[ebp], 0
$L71283:
	cmp	DWORD PTR _stripval$[ebp], 0
	je	SHORT $L71284
	mov	eax, DWORD PTR _stripval$[ebp]
	add	eax, 8
	mov	DWORD PTR -412+[ebp], eax
	jmp	SHORT $L71285
$L71284:
	mov	DWORD PTR -412+[ebp], 0
$L71285:
	mov	ecx, DWORD PTR -404+[ebp]
	push	ecx
	mov	edx, DWORD PTR -408+[ebp]
	push	edx
	mov	eax, DWORD PTR -412+[ebp]
	push	eax
	mov	ecx, DWORD PTR _html$[ebp]
	push	ecx
	mov	edx, DWORD PTR _cntxt$[ebp]
	push	edx
	call	_put_html_bold_substring
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L70468
$L70469:
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 209		; 000000d1H
	jmp	$eva_err$70274
$L70468:
	mov	ecx, DWORD PTR _tot_char$[ebp]
	push	ecx
	mov	edx, DWORD PTR _strip$[ebp]
	push	edx
	mov	eax, DWORD PTR __cnt0$70465[ebp]
	push	eax
	mov	ecx, DWORD PTR _html$[ebp]
	push	ecx
	call	_dynbuf_strip
	add	esp, 16					; 00000010H
	mov	edx, DWORD PTR _b_stripped$[ebp]
	mov	DWORD PTR [edx], eax
$L70464:

; 211  : 	else if(!strncmp(fmt, add_sz_str("_EVA_")))

	jmp	$L70489
$L70457:
	push	5
	push	OFFSET FLAT:$SG70472
	mov	eax, DWORD PTR _fmt$[ebp]
	push	eax
	call	_strncmp
	add	esp, 12					; 0000000cH
	test	eax, eax
	jne	$L70471

; 213  : 		/* Date : use put_value_fmt */
; 214  : 		HANDLE_STRIP(
; 215  : 			{ if(put_value_fmt(cntxt, html, DYNTAB_VAL_SZ(table, row, 0), fmt)) STACK_ERROR; });

	cmp	DWORD PTR _html$[ebp], 0
	je	$L70473
	mov	ecx, DWORD PTR _html$[ebp]
	cmp	DWORD PTR [ecx], 0
	je	SHORT $L71286
	mov	edx, DWORD PTR _html$[ebp]
	mov	eax, DWORD PTR [edx]
	mov	ecx, DWORD PTR [eax+4]
	mov	DWORD PTR -416+[ebp], ecx
	jmp	SHORT $L71287
$L71286:
	mov	DWORD PTR -416+[ebp], 0
$L71287:
	mov	edx, DWORD PTR -416+[ebp]
	mov	DWORD PTR __cnt0$70474[ebp], edx
	mov	eax, DWORD PTR _fmt$[ebp]
	push	eax
	push	0
	mov	ecx, DWORD PTR _row$[ebp]
	push	ecx
	mov	edx, DWORD PTR _table$[ebp]
	push	edx
	call	_dyntab_sz
	add	esp, 12					; 0000000cH
	push	eax
	push	0
	mov	eax, DWORD PTR _row$[ebp]
	push	eax
	mov	ecx, DWORD PTR _table$[ebp]
	push	ecx
	call	_dyntab_val
	add	esp, 12					; 0000000cH
	push	eax
	mov	edx, DWORD PTR _html$[ebp]
	push	edx
	mov	eax, DWORD PTR _cntxt$[ebp]
	push	eax
	call	_put_value_fmt
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L70475
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 215		; 000000d7H
	jmp	$eva_err$70274
$L70475:
	mov	edx, DWORD PTR _tot_char$[ebp]
	push	edx
	mov	eax, DWORD PTR _strip$[ebp]
	push	eax
	mov	ecx, DWORD PTR __cnt0$70474[ebp]
	push	ecx
	mov	edx, DWORD PTR _html$[ebp]
	push	edx
	call	_dynbuf_strip
	add	esp, 16					; 00000010H
	mov	ecx, DWORD PTR _b_stripped$[ebp]
	mov	DWORD PTR [ecx], eax
$L70473:

; 217  : 	else

	jmp	$L70489
$L70471:

; 219  : 		/* Output data with bolded search string if applicable */
; 220  : 		if(tbl && tbl->input && tbl->input[0] && (tbl->srchcol >= tbl->field.nbrows ||
; 221  : 				tbl->srchcol & (1 << val->col)) && (tbl->status & TblCtrl_opensearch))

	cmp	DWORD PTR _tbl$[ebp], 0
	je	$L70477
	mov	edx, DWORD PTR _tbl$[ebp]
	cmp	DWORD PTR [edx+100], 0
	je	$L70477
	mov	eax, DWORD PTR _tbl$[ebp]
	mov	ecx, DWORD PTR [eax+100]
	movsx	edx, BYTE PTR [ecx]
	test	edx, edx
	je	$L70477
	mov	eax, DWORD PTR _tbl$[ebp]
	mov	ecx, DWORD PTR _tbl$[ebp]
	mov	edx, DWORD PTR [eax+124]
	cmp	edx, DWORD PTR [ecx+380]
	jae	SHORT $L70478
	mov	eax, DWORD PTR _val$[ebp]
	mov	edx, 1
	mov	ecx, DWORD PTR [eax+56]
	shl	edx, cl
	mov	eax, DWORD PTR _tbl$[ebp]
	mov	ecx, DWORD PTR [eax+124]
	and	ecx, edx
	test	ecx, ecx
	je	$L70477
$L70478:
	mov	edx, DWORD PTR _tbl$[ebp]
	mov	eax, DWORD PTR [edx+32]
	and	eax, 32					; 00000020H
	test	eax, eax
	je	$L70477

; 223  : 			HANDLE_STRIP(
; 224  : 			{
; 225  : 				DYNBUF_ADD_CELL(&stripval, table, row, 0, NO_CONV);
; 226  : 				if(put_html_bold_substring(cntxt, html, DYNBUF_VAL_SZ(stripval), tbl ? &tbl->srchwords : NULL))
; 227  : 					STACK_ERROR;
; 228  : 			})

	cmp	DWORD PTR _html$[ebp], 0
	je	$L70479
	mov	ecx, DWORD PTR _html$[ebp]
	cmp	DWORD PTR [ecx], 0
	je	SHORT $L71288
	mov	edx, DWORD PTR _html$[ebp]
	mov	eax, DWORD PTR [edx]
	mov	ecx, DWORD PTR [eax+4]
	mov	DWORD PTR -420+[ebp], ecx
	jmp	SHORT $L71289
$L71288:
	mov	DWORD PTR -420+[ebp], 0
$L71289:
	mov	edx, DWORD PTR -420+[ebp]
	mov	DWORD PTR __cnt0$70480[ebp], edx
	push	0
	push	0
	push	0
	mov	eax, DWORD PTR _row$[ebp]
	push	eax
	mov	ecx, DWORD PTR _table$[ebp]
	push	ecx
	call	_dyntab_sz
	add	esp, 12					; 0000000cH
	push	eax
	push	0
	mov	edx, DWORD PTR _row$[ebp]
	push	edx
	mov	eax, DWORD PTR _table$[ebp]
	push	eax
	call	_dyntab_val
	add	esp, 12					; 0000000cH
	push	eax
	lea	ecx, DWORD PTR _stripval$[ebp]
	push	ecx
	call	_dynbuf_add
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L70482
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29872], OFFSET FLAT:$SG70484
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 228		; 000000e4H
	jmp	$eva_err$70274
$L70482:
	cmp	DWORD PTR _tbl$[ebp], 0
	je	SHORT $L71290
	mov	ecx, DWORD PTR _tbl$[ebp]
	add	ecx, 104				; 00000068H
	mov	DWORD PTR -424+[ebp], ecx
	jmp	SHORT $L71291
$L71290:
	mov	DWORD PTR -424+[ebp], 0
$L71291:
	cmp	DWORD PTR _stripval$[ebp], 0
	je	SHORT $L71292
	mov	edx, DWORD PTR _stripval$[ebp]
	mov	eax, DWORD PTR [edx+4]
	mov	DWORD PTR -428+[ebp], eax
	jmp	SHORT $L71293
$L71292:
	mov	DWORD PTR -428+[ebp], 0
$L71293:
	cmp	DWORD PTR _stripval$[ebp], 0
	je	SHORT $L71294
	mov	ecx, DWORD PTR _stripval$[ebp]
	add	ecx, 8
	mov	DWORD PTR -432+[ebp], ecx
	jmp	SHORT $L71295
$L71294:
	mov	DWORD PTR -432+[ebp], 0
$L71295:
	mov	edx, DWORD PTR -424+[ebp]
	push	edx
	mov	eax, DWORD PTR -428+[ebp]
	push	eax
	mov	ecx, DWORD PTR -432+[ebp]
	push	ecx
	mov	edx, DWORD PTR _html$[ebp]
	push	edx
	mov	eax, DWORD PTR _cntxt$[ebp]
	push	eax
	call	_put_html_bold_substring
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L70487
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 228		; 000000e4H
	jmp	$eva_err$70274
$L70487:
	mov	edx, DWORD PTR _tot_char$[ebp]
	push	edx
	mov	eax, DWORD PTR _strip$[ebp]
	push	eax
	mov	ecx, DWORD PTR __cnt0$70480[ebp]
	push	ecx
	mov	edx, DWORD PTR _html$[ebp]
	push	edx
	call	_dynbuf_strip
	add	esp, 16					; 00000010H
	mov	ecx, DWORD PTR _b_stripped$[ebp]
	mov	DWORD PTR [ecx], eax
$L70479:

; 230  : 		else

	jmp	$L70489
$L70477:

; 231  : 			HANDLE_STRIP(
; 232  : 				DYNBUF_ADD_CELL(html, table, row, 0, TO_HTML));

	cmp	DWORD PTR _html$[ebp], 0
	je	$L70489
	mov	edx, DWORD PTR _html$[ebp]
	cmp	DWORD PTR [edx], 0
	je	SHORT $L71296
	mov	eax, DWORD PTR _html$[ebp]
	mov	ecx, DWORD PTR [eax]
	mov	edx, DWORD PTR [ecx+4]
	mov	DWORD PTR -436+[ebp], edx
	jmp	SHORT $L71297
$L71296:
	mov	DWORD PTR -436+[ebp], 0
$L71297:
	mov	eax, DWORD PTR -436+[ebp]
	mov	DWORD PTR __cnt0$70490[ebp], eax
	push	1
	push	OFFSET FLAT:_plain_to_html
	push	0
	mov	ecx, DWORD PTR _row$[ebp]
	push	ecx
	mov	edx, DWORD PTR _table$[ebp]
	push	edx
	call	_dyntab_sz
	add	esp, 12					; 0000000cH
	push	eax
	push	0
	mov	eax, DWORD PTR _row$[ebp]
	push	eax
	mov	ecx, DWORD PTR _table$[ebp]
	push	ecx
	call	_dyntab_val
	add	esp, 12					; 0000000cH
	push	eax
	mov	edx, DWORD PTR _html$[ebp]
	push	edx
	call	_dynbuf_add
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L70491
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29872], OFFSET FLAT:$SG70493
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 232		; 000000e8H
	jmp	SHORT $eva_err$70274
$L70491:
	mov	edx, DWORD PTR _tot_char$[ebp]
	push	edx
	mov	eax, DWORD PTR _strip$[ebp]
	push	eax
	mov	ecx, DWORD PTR __cnt0$70490[ebp]
	push	ecx
	mov	edx, DWORD PTR _html$[ebp]
	push	edx
	call	_dynbuf_strip
	add	esp, 16					; 00000010H
	mov	ecx, DWORD PTR _b_stripped$[ebp]
	mov	DWORD PTR [ecx], eax
$L70489:
$eva_noerr$70238:

; 234  : 
; 235  : 	RETURN_OK_CLEANUP;

	push	0
	push	OFFSET FLAT:$SG70494
	push	OFFSET FLAT:$SG70495
	mov	edx, DWORD PTR _cntxt$[ebp]
	push	edx
	call	_err_clear
	add	esp, 16					; 00000010H
$eva_err$70274:
	mov	eax, DWORD PTR _cntxt$[ebp]
	cmp	DWORD PTR [eax+29872], 0
	je	SHORT $L70496
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	edx, DWORD PTR [ecx+29900]
	push	edx
	push	OFFSET FLAT:$SG70497
	push	OFFSET FLAT:$SG70498
	mov	eax, DWORD PTR _cntxt$[ebp]
	push	eax
	call	_err_add_context
	add	esp, 16					; 00000010H
$L70496:
	lea	ecx, DWORD PTR _id_obj$[ebp]
	push	ecx
	call	_dyntab_free
	add	esp, 4
	lea	edx, DWORD PTR _objdata$[ebp]
	push	edx
	call	_dyntab_free
	add	esp, 4
	mov	eax, DWORD PTR _stripval$[ebp]
	push	eax
	call	_mem_free
	add	esp, 4
	mov	DWORD PTR _stripval$[ebp], 0
	mov	ecx, DWORD PTR _cntxt$[ebp]
	xor	eax, eax
	cmp	DWORD PTR [ecx+29872], 0
	setne	al
$L70220:

; 236  : }

	pop	edi
	mov	esp, ebp
	pop	ebp
	ret	0
_html_put_value_fmt ENDP
_TEXT	ENDS
PUBLIC	_qry_build_joins
EXTRN	_qry_values_list:NEAR
EXTRN	_qry_listobj_field:NEAR
EXTRN	_qry_eval_sqlexpr_var:NEAR
EXTRN	_dyntab_from_tab:NEAR
EXTRN	_dyntab_filter_field:NEAR
EXTRN	_dyntab_order_lines:NEAR
_BSS	SEGMENT
	ALIGN	4

$SG70681 DB	01H DUP (?)
	ALIGN	4

$SG70692 DB	01H DUP (?)
	ALIGN	4

$SG70716 DB	01H DUP (?)
_BSS	ENDS
_DATA	SEGMENT
	ORG $+1
$SG70543 DB	'_EVA_JOIN_TYPE', 00H
	ORG $+1
$SG70545 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70551 DB	'_EVA_JOIN_FIELD', 00H
$SG70553 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70558 DB	'_EVA_JOIN_SRC', 00H
	ORG $+2
$SG70560 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70565 DB	'_EVA_JOIN_DATEDEL', 00H
	ORG $+2
$SG70567 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70572 DB	'_EVA_JOIN_LEFT', 00H
	ORG $+1
$SG70574 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70578 DB	'SELECT ', 00H
$SG70580 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70585 DB	0aH, 'FROM ', 00H
	ORG $+1
$SG70587 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70595 DB	')', 00H
	ORG $+2
$SG70597 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70601 DB	0aH, 00H
	ORG $+2
$SG70603 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70621 DB	'TVal%lu.', 00H
	ORG $+3
$SG70622 DB	'TField%lu.', 00H
	ORG $+1
$SG70625 DB	'TLink%lu', 00H
	ORG $+3
$SG70629 DB	'TLink AS %s ', 00H
	ORG $+3
$SG70632 DB	'LEFT', 00H
	ORG $+3
$SG70633 DB	'INNER', 00H
	ORG $+2
$SG70634 DB	0aH, '%s JOIN TLink AS TLink%lu ON TLink%lu.', 00H
$SG70636 DB	'_EVA_DIRECT', 00H
$SG70638 DB	'IdObj=%s.IdRelObj', 00H
	ORG $+2
$SG70641 DB	'_EVA_REVERSE', 00H
	ORG $+3
$SG70643 DB	'IdRelObj=%s.IdObj', 00H
	ORG $+2
$SG70646 DB	'_EVA_DUAL', 00H
	ORG $+2
$SG70648 DB	'IdRelObj=%s.IdRelObj', 00H
	ORG $+3
$SG70651 DB	'_EVA_LINE', 00H
	ORG $+2
$SG70653 DB	'IdObj=%s.IdObj AND TLink%lu.Line=%s.Line', 00H
	ORG $+3
$SG70659 DB	'%.*s%s.%s', 00H
	ORG $+2
$SG70662 DB	'IdObj=%s.IdObj', 00H
	ORG $+1
$SG70665 DB	'LEFT', 00H
	ORG $+3
$SG70666 DB	'INNER', 00H
	ORG $+2
$SG70667 DB	0aH, '%s JOIN TVal AS TVal%lu ON TVal%lu.IdValue=TLink%lu'
	DB	'.IdValue', 00H
	ORG $+3
$SG70670 DB	'LEFT', 00H
	ORG $+3
$SG70671 DB	'INNER', 00H
	ORG $+2
$SG70672 DB	0aH, '%s JOIN TVal AS TField%lu ON TField%lu.IdValue=TLin'
	DB	'k%lu.IdField', 00H
	ORG $+3
$SG70676 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70678 DB	'_EVA_FIELD', 00H
	ORG $+1
$SG70680 DB	0aH, 'AND ', 00H
	ORG $+2
$SG70682 DB	'%sTLink%lu.IdField IN(', 00H
	ORG $+1
$SG70686 DB	')', 00H
	ORG $+2
$SG70688 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70691 DB	' AND ', 00H
	ORG $+2
$SG70693 DB	'%sTLink%lu.DateDel IS NULL', 00H
	ORG $+1
$SG70698 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70702 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70708 DB	0aH, 'WHERE (', 00H
	ORG $+3
$SG70710 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70715 DB	')', 00H
	ORG $+2
$SG70718 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70722 DB	0aH, 'AND (', 00H
	ORG $+1
$SG70724 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70729 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70730 DB	'D:\Travail\ABI\EVA\V4.0\CGI\Brunix-2016\ctrl_exprval.c', 00H
	ORG $+1
$SG70731 DB	'qry_build_joins', 00H
$SG70733 DB	'D:\Travail\ABI\EVA\V4.0\CGI\Brunix-2016\ctrl_exprval.c', 00H
	ORG $+1
$SG70734 DB	'qry_build_joins', 00H
_DATA	ENDS
_TEXT	SEGMENT
_e$70656 = -376
_cntxt$ = 8
_sql$ = 12
_select$ = 16
_from$ = 20
_joins$ = 24
_where$ = 28
_other$ = 32
_typ$ = -76
_field$ = -48
_src$ = -104
_left$ = -164
_datedel$ = -144
_fld$ = -124
_data$ = -28
_bef$ = -4
_aft$ = -8
_join$ = -56
_cond$ = -52
_i$ = -80
_k$ = -84
_t$70609 = -312
_dtdel$70610 = -172
_b_left$70611 = -320
_tsrc$70612 = -316
_srctbl$70613 = -336
_end$70614 = -308
_n$70615 = -372
_printbuf$70616 = -300
_tval$70617 = -352
_tfield$70618 = -368
_b_val$70619 = -168
_b_field$70620 = -304
_qry_build_joins PROC NEAR

; 264  : ){

	push	ebp
	mov	ebp, esp
	sub	esp, 428				; 000001acH

; 265  : 	DynTable typ = {0};

	mov	DWORD PTR _typ$[ebp], 0
	xor	eax, eax
	mov	DWORD PTR _typ$[ebp+4], eax
	mov	DWORD PTR _typ$[ebp+8], eax
	mov	DWORD PTR _typ$[ebp+12], eax
	mov	DWORD PTR _typ$[ebp+16], eax

; 266  : 	DynTable field = {0};

	mov	DWORD PTR _field$[ebp], 0
	xor	ecx, ecx
	mov	DWORD PTR _field$[ebp+4], ecx
	mov	DWORD PTR _field$[ebp+8], ecx
	mov	DWORD PTR _field$[ebp+12], ecx
	mov	DWORD PTR _field$[ebp+16], ecx

; 267  : 	DynTable src = {0};

	mov	DWORD PTR _src$[ebp], 0
	xor	edx, edx
	mov	DWORD PTR _src$[ebp+4], edx
	mov	DWORD PTR _src$[ebp+8], edx
	mov	DWORD PTR _src$[ebp+12], edx
	mov	DWORD PTR _src$[ebp+16], edx

; 268  : 	DynTable left = {0};

	mov	DWORD PTR _left$[ebp], 0
	xor	eax, eax
	mov	DWORD PTR _left$[ebp+4], eax
	mov	DWORD PTR _left$[ebp+8], eax
	mov	DWORD PTR _left$[ebp+12], eax
	mov	DWORD PTR _left$[ebp+16], eax

; 269  : 	DynTable datedel = {0};

	mov	DWORD PTR _datedel$[ebp], 0
	xor	ecx, ecx
	mov	DWORD PTR _datedel$[ebp+4], ecx
	mov	DWORD PTR _datedel$[ebp+8], ecx
	mov	DWORD PTR _datedel$[ebp+12], ecx
	mov	DWORD PTR _datedel$[ebp+16], ecx

; 270  : 	DynTable fld = {0};

	mov	DWORD PTR _fld$[ebp], 0
	xor	edx, edx
	mov	DWORD PTR _fld$[ebp+4], edx
	mov	DWORD PTR _fld$[ebp+8], edx
	mov	DWORD PTR _fld$[ebp+12], edx
	mov	DWORD PTR _fld$[ebp+16], edx

; 271  : 	DynTable data = {0};

	mov	DWORD PTR _data$[ebp], 0
	xor	eax, eax
	mov	DWORD PTR _data$[ebp+4], eax
	mov	DWORD PTR _data$[ebp+8], eax
	mov	DWORD PTR _data$[ebp+12], eax
	mov	DWORD PTR _data$[ebp+16], eax

; 272  : 	DynBuffer *bef = sql ? *sql : NULL;

	cmp	DWORD PTR _sql$[ebp], 0
	je	SHORT $L71299
	mov	ecx, DWORD PTR _sql$[ebp]
	mov	edx, DWORD PTR [ecx]
	mov	DWORD PTR -380+[ebp], edx
	jmp	SHORT $L71300
$L71299:
	mov	DWORD PTR -380+[ebp], 0
$L71300:
	mov	eax, DWORD PTR -380+[ebp]
	mov	DWORD PTR _bef$[ebp], eax

; 273  : 	DynBuffer *aft = NULL;

	mov	DWORD PTR _aft$[ebp], 0

; 274  : 	DynBuffer *join = NULL;

	mov	DWORD PTR _join$[ebp], 0

; 275  : 	DynBuffer *cond = NULL;

	mov	DWORD PTR _cond$[ebp], 0

; 276  : 	unsigned long i, k = 0;

	mov	DWORD PTR _k$[ebp], 0

; 277  : 
; 278  : 	/* Return if no select */
; 279  : 	if(!sql) RETURN_OK;

	cmp	DWORD PTR _sql$[ebp], 0
	jne	SHORT $L70535
	jmp	$eva_noerr$70536
$L70535:

; 280  : 	*sql = NULL;

	mov	ecx, DWORD PTR _sql$[ebp]
	mov	DWORD PTR [ecx], 0

; 281  : 	if(!(select && *select)) RETURN_OK;

	cmp	DWORD PTR _select$[ebp], 0
	je	SHORT $L70539
	mov	edx, DWORD PTR _select$[ebp]
	movsx	eax, BYTE PTR [edx]
	test	eax, eax
	jne	SHORT $L70538
$L70539:
	jmp	$eva_noerr$70536
$L70538:

; 282  : 
; 283  : 	/* Read joins params */
; 284  : 	DYNTAB_FIELD_TABK(&typ, joins, JOIN_TYPE);

	lea	ecx, DWORD PTR _typ$[ebp]
	push	ecx
	call	_dyntab_free
	add	esp, 4
	push	0
	push	-1
	push	OFFSET FLAT:$SG70543
	mov	edx, DWORD PTR _joins$[ebp]
	push	edx
	push	0
	lea	eax, DWORD PTR _typ$[ebp]
	push	eax
	call	_dyntab_filter_field
	add	esp, 24					; 00000018H
	test	eax, eax
	jne	SHORT $L70542
	lea	ecx, DWORD PTR _typ$[ebp]
	push	ecx
	call	_dyntab_order_lines
	add	esp, 4
	test	eax, eax
	je	SHORT $L70541
$L70542:
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29872], OFFSET FLAT:$SG70545
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 284		; 0000011cH
	jmp	$eva_err$70546
$L70541:
	mov	ecx, DWORD PTR _k$[ebp]
	cmp	ecx, DWORD PTR _typ$[ebp]
	jae	SHORT $L70547
	mov	edx, DWORD PTR _typ$[ebp]
	mov	DWORD PTR _k$[ebp], edx
$L70547:

; 285  : 	DYNTAB_FIELD_TABK(&field, joins, JOIN_FIELD);

	lea	eax, DWORD PTR _field$[ebp]
	push	eax
	call	_dyntab_free
	add	esp, 4
	push	0
	push	-1
	push	OFFSET FLAT:$SG70551
	mov	ecx, DWORD PTR _joins$[ebp]
	push	ecx
	push	0
	lea	edx, DWORD PTR _field$[ebp]
	push	edx
	call	_dyntab_filter_field
	add	esp, 24					; 00000018H
	test	eax, eax
	jne	SHORT $L70550
	lea	eax, DWORD PTR _field$[ebp]
	push	eax
	call	_dyntab_order_lines
	add	esp, 4
	test	eax, eax
	je	SHORT $L70549
$L70550:
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29872], OFFSET FLAT:$SG70553
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 285		; 0000011dH
	jmp	$eva_err$70546
$L70549:
	mov	eax, DWORD PTR _k$[ebp]
	cmp	eax, DWORD PTR _field$[ebp]
	jae	SHORT $L70554
	mov	ecx, DWORD PTR _field$[ebp]
	mov	DWORD PTR _k$[ebp], ecx
$L70554:

; 286  : 	DYNTAB_FIELD_TABK(&src, joins, JOIN_SRC);

	lea	edx, DWORD PTR _src$[ebp]
	push	edx
	call	_dyntab_free
	add	esp, 4
	push	0
	push	-1
	push	OFFSET FLAT:$SG70558
	mov	eax, DWORD PTR _joins$[ebp]
	push	eax
	push	0
	lea	ecx, DWORD PTR _src$[ebp]
	push	ecx
	call	_dyntab_filter_field
	add	esp, 24					; 00000018H
	test	eax, eax
	jne	SHORT $L70557
	lea	edx, DWORD PTR _src$[ebp]
	push	edx
	call	_dyntab_order_lines
	add	esp, 4
	test	eax, eax
	je	SHORT $L70556
$L70557:
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29872], OFFSET FLAT:$SG70560
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 286		; 0000011eH
	jmp	$eva_err$70546
$L70556:
	mov	edx, DWORD PTR _k$[ebp]
	cmp	edx, DWORD PTR _src$[ebp]
	jae	SHORT $L70561
	mov	eax, DWORD PTR _src$[ebp]
	mov	DWORD PTR _k$[ebp], eax
$L70561:

; 287  : 	DYNTAB_FIELD_TABK(&datedel, joins, JOIN_DATEDEL);

	lea	ecx, DWORD PTR _datedel$[ebp]
	push	ecx
	call	_dyntab_free
	add	esp, 4
	push	0
	push	-1
	push	OFFSET FLAT:$SG70565
	mov	edx, DWORD PTR _joins$[ebp]
	push	edx
	push	0
	lea	eax, DWORD PTR _datedel$[ebp]
	push	eax
	call	_dyntab_filter_field
	add	esp, 24					; 00000018H
	test	eax, eax
	jne	SHORT $L70564
	lea	ecx, DWORD PTR _datedel$[ebp]
	push	ecx
	call	_dyntab_order_lines
	add	esp, 4
	test	eax, eax
	je	SHORT $L70563
$L70564:
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29872], OFFSET FLAT:$SG70567
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 287		; 0000011fH
	jmp	$eva_err$70546
$L70563:
	mov	ecx, DWORD PTR _k$[ebp]
	cmp	ecx, DWORD PTR _datedel$[ebp]
	jae	SHORT $L70568
	mov	edx, DWORD PTR _datedel$[ebp]
	mov	DWORD PTR _k$[ebp], edx
$L70568:

; 288  : 	DYNTAB_FIELD_TABK(&left, joins, JOIN_LEFT);

	lea	eax, DWORD PTR _left$[ebp]
	push	eax
	call	_dyntab_free
	add	esp, 4
	push	0
	push	-1
	push	OFFSET FLAT:$SG70572
	mov	ecx, DWORD PTR _joins$[ebp]
	push	ecx
	push	0
	lea	edx, DWORD PTR _left$[ebp]
	push	edx
	call	_dyntab_filter_field
	add	esp, 24					; 00000018H
	test	eax, eax
	jne	SHORT $L70571
	lea	eax, DWORD PTR _left$[ebp]
	push	eax
	call	_dyntab_order_lines
	add	esp, 4
	test	eax, eax
	je	SHORT $L70570
$L70571:
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29872], OFFSET FLAT:$SG70574
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 288		; 00000120H
	jmp	$eva_err$70546
$L70570:
	mov	eax, DWORD PTR _k$[ebp]
	cmp	eax, DWORD PTR _left$[ebp]
	jae	SHORT $L70575
	mov	ecx, DWORD PTR _left$[ebp]
	mov	DWORD PTR _k$[ebp], ecx
$L70575:

; 289  : 
; 290  : 	/* Handle parameters in SELECT & FROM clauses */
; 291  : 	DYNBUF_ADD_STR(&bef, "SELECT ");

	push	0
	push	0
	push	7
	push	OFFSET FLAT:$SG70578
	lea	edx, DWORD PTR _bef$[ebp]
	push	edx
	call	_dynbuf_add
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L70577
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29872], OFFSET FLAT:$SG70580
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 291		; 00000123H
	jmp	$eva_err$70546
$L70577:

; 292  : 	if(qry_eval_sqlexpr_var(cntxt, &bef, select, joins, NULL)) STACK_ERROR;

	push	0
	mov	edx, DWORD PTR _joins$[ebp]
	push	edx
	mov	eax, DWORD PTR _select$[ebp]
	push	eax
	lea	ecx, DWORD PTR _bef$[ebp]
	push	ecx
	mov	edx, DWORD PTR _cntxt$[ebp]
	push	edx
	call	_qry_eval_sqlexpr_var
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L70582
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 292		; 00000124H
	jmp	$eva_err$70546
$L70582:

; 293  : 	DYNBUF_ADD_STR(&bef, "\nFROM ");

	push	0
	push	0
	push	6
	push	OFFSET FLAT:$SG70585
	lea	ecx, DWORD PTR _bef$[ebp]
	push	ecx
	call	_dynbuf_add
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L70584
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29872], OFFSET FLAT:$SG70587
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 293		; 00000125H
	jmp	$eva_err$70546
$L70584:

; 294  : 	if(qry_eval_sqlexpr_var(cntxt, &bef, from, joins, NULL)) STACK_ERROR;

	push	0
	mov	ecx, DWORD PTR _joins$[ebp]
	push	ecx
	mov	edx, DWORD PTR _from$[ebp]
	push	edx
	lea	eax, DWORD PTR _bef$[ebp]
	push	eax
	mov	ecx, DWORD PTR _cntxt$[ebp]
	push	ecx
	call	_qry_eval_sqlexpr_var
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L70589
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 294		; 00000126H
	jmp	$eva_err$70546
$L70589:

; 295  : 
; 296  : 	/* Handle parameters in other clauses */
; 297  : 	if(where && *where)

	cmp	DWORD PTR _where$[ebp], 0
	je	SHORT $L70594
	mov	eax, DWORD PTR _where$[ebp]
	movsx	ecx, BYTE PTR [eax]
	test	ecx, ecx
	je	SHORT $L70594

; 299  : 		if(qry_eval_sqlexpr_var(cntxt, &aft, where, joins, NULL)) STACK_ERROR;

	push	0
	mov	edx, DWORD PTR _joins$[ebp]
	push	edx
	mov	eax, DWORD PTR _where$[ebp]
	push	eax
	lea	ecx, DWORD PTR _aft$[ebp]
	push	ecx
	mov	edx, DWORD PTR _cntxt$[ebp]
	push	edx
	call	_qry_eval_sqlexpr_var
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L70592
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 299		; 0000012bH
	jmp	$eva_err$70546
$L70592:

; 300  : 		DYNBUF_ADD_STR(&aft, ")");

	push	0
	push	0
	push	1
	push	OFFSET FLAT:$SG70595
	lea	ecx, DWORD PTR _aft$[ebp]
	push	ecx
	call	_dynbuf_add
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L70594
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29872], OFFSET FLAT:$SG70597
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 300		; 0000012cH
	jmp	$eva_err$70546
$L70594:

; 302  : 	if(other && *other)

	cmp	DWORD PTR _other$[ebp], 0
	je	SHORT $L70605
	mov	ecx, DWORD PTR _other$[ebp]
	movsx	edx, BYTE PTR [ecx]
	test	edx, edx
	je	SHORT $L70605

; 304  : 		DYNBUF_ADD_STR(&aft, "\n");

	push	0
	push	0
	push	1
	push	OFFSET FLAT:$SG70601
	lea	eax, DWORD PTR _aft$[ebp]
	push	eax
	call	_dynbuf_add
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L70600
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29872], OFFSET FLAT:$SG70603
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 304		; 00000130H
	jmp	$eva_err$70546
$L70600:

; 305  : 		if(qry_eval_sqlexpr_var(cntxt, &aft, other, joins, NULL)) STACK_ERROR;

	push	0
	mov	eax, DWORD PTR _joins$[ebp]
	push	eax
	mov	ecx, DWORD PTR _other$[ebp]
	push	ecx
	lea	edx, DWORD PTR _aft$[ebp]
	push	edx
	mov	eax, DWORD PTR _cntxt$[ebp]
	push	eax
	call	_qry_eval_sqlexpr_var
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L70605
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 305		; 00000131H
	jmp	$eva_err$70546
$L70605:

; 307  : 
; 308  : 	/* Loop on joins */
; 309  : 	for(i = 0; i < k; i++)

	mov	DWORD PTR _i$[ebp], 0
	jmp	SHORT $L70606
$L70607:
	mov	edx, DWORD PTR _i$[ebp]
	add	edx, 1
	mov	DWORD PTR _i$[ebp], edx
$L70606:
	mov	eax, DWORD PTR _i$[ebp]
	cmp	eax, DWORD PTR _k$[ebp]
	jae	$L70608

; 311  : 		char *t = dyntab_val(&typ, i, 0);

	push	0
	mov	ecx, DWORD PTR _i$[ebp]
	push	ecx
	lea	edx, DWORD PTR _typ$[ebp]
	push	edx
	call	_dyntab_val
	add	esp, 12					; 0000000cH
	mov	DWORD PTR _t$70609[ebp], eax

; 312  : 		char *dtdel = dyntab_val(&datedel, i, 0);

	push	0
	mov	eax, DWORD PTR _i$[ebp]
	push	eax
	lea	ecx, DWORD PTR _datedel$[ebp]
	push	ecx
	call	_dyntab_val
	add	esp, 12					; 0000000cH
	mov	DWORD PTR _dtdel$70610[ebp], eax

; 313  : 		int b_left = dyntab_sz(&left, i, 0);

	push	0
	mov	edx, DWORD PTR _i$[ebp]
	push	edx
	lea	eax, DWORD PTR _left$[ebp]
	push	eax
	call	_dyntab_sz
	add	esp, 12					; 0000000cH
	mov	DWORD PTR _b_left$70611[ebp], eax

; 314  : 		char *tsrc = dyntab_val(&src, i, 0);

	push	0
	mov	ecx, DWORD PTR _i$[ebp]
	push	ecx
	lea	edx, DWORD PTR _src$[ebp]
	push	edx
	call	_dyntab_val
	add	esp, 12					; 0000000cH
	mov	DWORD PTR _tsrc$70612[ebp], eax

; 315  : 		char srctbl[16], *end;
; 316  : 		unsigned long n = strtoul(tsrc, &end, 10);

	push	10					; 0000000aH
	lea	eax, DWORD PTR _end$70614[ebp]
	push	eax
	mov	ecx, DWORD PTR _tsrc$70612[ebp]
	push	ecx
	call	_strtoul
	add	esp, 12					; 0000000cH
	mov	DWORD PTR _n$70615[ebp], eax

; 317  : 		char printbuf[128];
; 318  : 
; 319  : 		/* Detect references to TVal or TField */
; 320  : 		char tval[16], tfield[16];
; 321  : 		int b_val = 0, b_field = 0;

	mov	DWORD PTR _b_val$70619[ebp], 0
	mov	DWORD PTR _b_field$70620[ebp], 0

; 322  : 		sprintf(tval, "TVal%lu.", i + 1);

	mov	edx, DWORD PTR _i$[ebp]
	add	edx, 1
	push	edx
	push	OFFSET FLAT:$SG70621
	lea	eax, DWORD PTR _tval$70617[ebp]
	push	eax
	call	_sprintf
	add	esp, 12					; 0000000cH

; 323  : 		sprintf(tfield, "TField%lu.", i + 1);

	mov	ecx, DWORD PTR _i$[ebp]
	add	ecx, 1
	push	ecx
	push	OFFSET FLAT:$SG70622
	lea	edx, DWORD PTR _tfield$70618[ebp]
	push	edx
	call	_sprintf
	add	esp, 12					; 0000000cH

; 324  : 		b_val = (bef && strstr(bef->data, tval)) || (aft && strstr(aft->data, tval));

	cmp	DWORD PTR _bef$[ebp], 0
	je	SHORT $L71301
	lea	eax, DWORD PTR _tval$70617[ebp]
	push	eax
	mov	ecx, DWORD PTR _bef$[ebp]
	add	ecx, 8
	push	ecx
	call	_strstr
	add	esp, 8
	test	eax, eax
	jne	SHORT $L71303
$L71301:
	cmp	DWORD PTR _aft$[ebp], 0
	je	SHORT $L71302
	lea	edx, DWORD PTR _tval$70617[ebp]
	push	edx
	mov	eax, DWORD PTR _aft$[ebp]
	add	eax, 8
	push	eax
	call	_strstr
	add	esp, 8
	test	eax, eax
	jne	SHORT $L71303
$L71302:
	mov	DWORD PTR -384+[ebp], 0
	jmp	SHORT $L71304
$L71303:
	mov	DWORD PTR -384+[ebp], 1
$L71304:
	mov	ecx, DWORD PTR -384+[ebp]
	mov	DWORD PTR _b_val$70619[ebp], ecx

; 325  : 		b_field = (bef && strstr(bef->data, tfield)) || (aft && strstr(aft->data, tfield));

	cmp	DWORD PTR _bef$[ebp], 0
	je	SHORT $L71305
	lea	edx, DWORD PTR _tfield$70618[ebp]
	push	edx
	mov	eax, DWORD PTR _bef$[ebp]
	add	eax, 8
	push	eax
	call	_strstr
	add	esp, 8
	test	eax, eax
	jne	SHORT $L71307
$L71305:
	cmp	DWORD PTR _aft$[ebp], 0
	je	SHORT $L71306
	lea	ecx, DWORD PTR _tfield$70618[ebp]
	push	ecx
	mov	edx, DWORD PTR _aft$[ebp]
	add	edx, 8
	push	edx
	call	_strstr
	add	esp, 8
	test	eax, eax
	jne	SHORT $L71307
$L71306:
	mov	DWORD PTR -388+[ebp], 0
	jmp	SHORT $L71308
$L71307:
	mov	DWORD PTR -388+[ebp], 1
$L71308:
	mov	eax, DWORD PTR -388+[ebp]
	mov	DWORD PTR _b_field$70620[ebp], eax

; 326  : 
; 327  : 		/* Build source table name */
; 328  : 		if(!*tsrc || end > tsrc)

	mov	ecx, DWORD PTR _tsrc$70612[ebp]
	movsx	edx, BYTE PTR [ecx]
	test	edx, edx
	je	SHORT $L70624
	mov	eax, DWORD PTR _end$70614[ebp]
	cmp	eax, DWORD PTR _tsrc$70612[ebp]
	jbe	$L70623
$L70624:

; 330  : 			sprintf(srctbl, "TLink%lu", end > tsrc ? n : i ? i : (from && *from) ? 0 : 1);

	mov	ecx, DWORD PTR _end$70614[ebp]
	cmp	ecx, DWORD PTR _tsrc$70612[ebp]
	jbe	SHORT $L71313
	mov	edx, DWORD PTR _n$70615[ebp]
	mov	DWORD PTR -392+[ebp], edx
	jmp	SHORT $L71314
$L71313:
	cmp	DWORD PTR _i$[ebp], 0
	je	SHORT $L71311
	mov	eax, DWORD PTR _i$[ebp]
	mov	DWORD PTR -396+[ebp], eax
	jmp	SHORT $L71312
$L71311:
	cmp	DWORD PTR _from$[ebp], 0
	je	SHORT $L71309
	mov	ecx, DWORD PTR _from$[ebp]
	movsx	edx, BYTE PTR [ecx]
	test	edx, edx
	je	SHORT $L71309
	mov	DWORD PTR -400+[ebp], 0
	jmp	SHORT $L71310
$L71309:
	mov	DWORD PTR -400+[ebp], 1
$L71310:
	mov	eax, DWORD PTR -400+[ebp]
	mov	DWORD PTR -396+[ebp], eax
$L71312:
	mov	ecx, DWORD PTR -396+[ebp]
	mov	DWORD PTR -392+[ebp], ecx
$L71314:
	mov	edx, DWORD PTR -392+[ebp]
	push	edx
	push	OFFSET FLAT:$SG70625
	lea	eax, DWORD PTR _srctbl$70613[ebp]
	push	eax
	call	_sprintf
	add	esp, 12					; 0000000cH

; 331  : 			tsrc = srctbl;

	lea	ecx, DWORD PTR _srctbl$70613[ebp]
	mov	DWORD PTR _tsrc$70612[ebp], ecx
$L70623:

; 333  : 
; 334  : 		/* Handle TLink join */
; 335  : 		if(!i && !(from && *from) && tsrc == srctbl)

	cmp	DWORD PTR _i$[ebp], 0
	jne	SHORT $L70626
	cmp	DWORD PTR _from$[ebp], 0
	je	SHORT $L70627
	mov	edx, DWORD PTR _from$[ebp]
	movsx	eax, BYTE PTR [edx]
	test	eax, eax
	jne	SHORT $L70626
$L70627:
	mov	ecx, DWORD PTR _tsrc$70612[ebp]
	lea	edx, DWORD PTR _srctbl$70613[ebp]
	cmp	ecx, edx
	jne	SHORT $L70626

; 337  : 			dynbuf_print(&join, "TLink AS %s ", srctbl);

	push	0
	push	0
	lea	eax, DWORD PTR _srctbl$70613[ebp]
	push	eax
	push	OFFSET FLAT:$SG70629
	push	127					; 0000007fH
	lea	ecx, DWORD PTR _printbuf$70616[ebp]
	push	ecx
	call	__snprintf
	add	esp, 16					; 00000010H
	push	eax
	lea	edx, DWORD PTR _printbuf$70616[ebp]
	push	edx
	lea	eax, DWORD PTR _join$[ebp]
	push	eax
	call	_dynbuf_add
	add	esp, 20					; 00000014H

; 339  : 		else

	jmp	$L70660
$L70626:

; 341  : 			dynbuf_print3(&join, "\n%s JOIN TLink AS TLink%lu ON TLink%lu.", b_left ? "LEFT" : "INNER", i + 1, i + 1);

	cmp	DWORD PTR _b_left$70611[ebp], 0
	je	SHORT $L71315
	mov	DWORD PTR -404+[ebp], OFFSET FLAT:$SG70632
	jmp	SHORT $L71316
$L71315:
	mov	DWORD PTR -404+[ebp], OFFSET FLAT:$SG70633
$L71316:
	push	0
	push	0
	mov	ecx, DWORD PTR _i$[ebp]
	add	ecx, 1
	push	ecx
	mov	edx, DWORD PTR _i$[ebp]
	add	edx, 1
	push	edx
	mov	eax, DWORD PTR -404+[ebp]
	push	eax
	push	OFFSET FLAT:$SG70634
	push	127					; 0000007fH
	lea	ecx, DWORD PTR _printbuf$70616[ebp]
	push	ecx
	call	__snprintf
	add	esp, 24					; 00000018H
	push	eax
	lea	edx, DWORD PTR _printbuf$70616[ebp]
	push	edx
	lea	eax, DWORD PTR _join$[ebp]
	push	eax
	call	_dynbuf_add
	add	esp, 20					; 00000014H

; 342  : 			if(!strcmp(t, "_EVA_DIRECT"))

	push	OFFSET FLAT:$SG70636
	mov	ecx, DWORD PTR _t$70609[ebp]
	push	ecx
	call	_strcmp
	add	esp, 8
	test	eax, eax
	jne	SHORT $L70635

; 344  : 				dynbuf_print(&join, "IdObj=%s.IdRelObj", tsrc);

	push	0
	push	0
	mov	edx, DWORD PTR _tsrc$70612[ebp]
	push	edx
	push	OFFSET FLAT:$SG70638
	push	127					; 0000007fH
	lea	eax, DWORD PTR _printbuf$70616[ebp]
	push	eax
	call	__snprintf
	add	esp, 16					; 00000010H
	push	eax
	lea	ecx, DWORD PTR _printbuf$70616[ebp]
	push	ecx
	lea	edx, DWORD PTR _join$[ebp]
	push	edx
	call	_dynbuf_add
	add	esp, 20					; 00000014H

; 346  : 			else if(!strcmp(t, "_EVA_REVERSE"))

	jmp	$L70660
$L70635:
	push	OFFSET FLAT:$SG70641
	mov	eax, DWORD PTR _t$70609[ebp]
	push	eax
	call	_strcmp
	add	esp, 8
	test	eax, eax
	jne	SHORT $L70640

; 348  : 				dynbuf_print(&join, "IdRelObj=%s.IdObj", tsrc);

	push	0
	push	0
	mov	ecx, DWORD PTR _tsrc$70612[ebp]
	push	ecx
	push	OFFSET FLAT:$SG70643
	push	127					; 0000007fH
	lea	edx, DWORD PTR _printbuf$70616[ebp]
	push	edx
	call	__snprintf
	add	esp, 16					; 00000010H
	push	eax
	lea	eax, DWORD PTR _printbuf$70616[ebp]
	push	eax
	lea	ecx, DWORD PTR _join$[ebp]
	push	ecx
	call	_dynbuf_add
	add	esp, 20					; 00000014H

; 350  : 			else if(!strcmp(t, "_EVA_DUAL"))

	jmp	$L70660
$L70640:
	push	OFFSET FLAT:$SG70646
	mov	edx, DWORD PTR _t$70609[ebp]
	push	edx
	call	_strcmp
	add	esp, 8
	test	eax, eax
	jne	SHORT $L70645

; 352  : 				dynbuf_print(&join, "IdRelObj=%s.IdRelObj", tsrc);

	push	0
	push	0
	mov	eax, DWORD PTR _tsrc$70612[ebp]
	push	eax
	push	OFFSET FLAT:$SG70648
	push	127					; 0000007fH
	lea	ecx, DWORD PTR _printbuf$70616[ebp]
	push	ecx
	call	__snprintf
	add	esp, 16					; 00000010H
	push	eax
	lea	edx, DWORD PTR _printbuf$70616[ebp]
	push	edx
	lea	eax, DWORD PTR _join$[ebp]
	push	eax
	call	_dynbuf_add
	add	esp, 20					; 00000014H

; 354  : 			else if(!strcmp(t, "_EVA_LINE"))

	jmp	$L70660
$L70645:
	push	OFFSET FLAT:$SG70651
	mov	ecx, DWORD PTR _t$70609[ebp]
	push	ecx
	call	_strcmp
	add	esp, 8
	test	eax, eax
	jne	SHORT $L70650

; 356  : 				dynbuf_print3(&join, "IdObj=%s.IdObj AND TLink%lu.Line=%s.Line", tsrc, i + 1, tsrc);

	push	0
	push	0
	mov	edx, DWORD PTR _tsrc$70612[ebp]
	push	edx
	mov	eax, DWORD PTR _i$[ebp]
	add	eax, 1
	push	eax
	mov	ecx, DWORD PTR _tsrc$70612[ebp]
	push	ecx
	push	OFFSET FLAT:$SG70653
	push	127					; 0000007fH
	lea	edx, DWORD PTR _printbuf$70616[ebp]
	push	edx
	call	__snprintf
	add	esp, 24					; 00000018H
	push	eax
	lea	eax, DWORD PTR _printbuf$70616[ebp]
	push	eax
	lea	ecx, DWORD PTR _join$[ebp]
	push	ecx
	call	_dynbuf_add
	add	esp, 20					; 00000014H

; 358  : 			else if(strchr(t, '='))

	jmp	$L70660
$L70650:
	push	61					; 0000003dH
	mov	edx, DWORD PTR _t$70609[ebp]
	push	edx
	call	_strchr
	add	esp, 8
	test	eax, eax
	je	SHORT $L70655

; 360  : 				char *e = strchr(t, '=');

	push	61					; 0000003dH
	mov	eax, DWORD PTR _t$70609[ebp]
	push	eax
	call	_strchr
	add	esp, 8
	mov	DWORD PTR _e$70656[ebp], eax

; 361  : 				dynbuf_print4(&join, "%.*s%s.%s", (int)(e - t + 1), t, tsrc, e + 1);

	push	0
	push	0
	mov	ecx, DWORD PTR _e$70656[ebp]
	add	ecx, 1
	push	ecx
	mov	edx, DWORD PTR _tsrc$70612[ebp]
	push	edx
	mov	eax, DWORD PTR _t$70609[ebp]
	push	eax
	mov	ecx, DWORD PTR _e$70656[ebp]
	sub	ecx, DWORD PTR _t$70609[ebp]
	add	ecx, 1
	push	ecx
	push	OFFSET FLAT:$SG70659
	push	127					; 0000007fH
	lea	edx, DWORD PTR _printbuf$70616[ebp]
	push	edx
	call	__snprintf
	add	esp, 28					; 0000001cH
	push	eax
	lea	eax, DWORD PTR _printbuf$70616[ebp]
	push	eax
	lea	ecx, DWORD PTR _join$[ebp]
	push	ecx
	call	_dynbuf_add
	add	esp, 20					; 00000014H

; 363  : 			else

	jmp	SHORT $L70660
$L70655:

; 365  : 				dynbuf_print(&join, "IdObj=%s.IdObj", tsrc);

	push	0
	push	0
	mov	edx, DWORD PTR _tsrc$70612[ebp]
	push	edx
	push	OFFSET FLAT:$SG70662
	push	127					; 0000007fH
	lea	eax, DWORD PTR _printbuf$70616[ebp]
	push	eax
	call	__snprintf
	add	esp, 16					; 00000010H
	push	eax
	lea	ecx, DWORD PTR _printbuf$70616[ebp]
	push	ecx
	lea	edx, DWORD PTR _join$[ebp]
	push	edx
	call	_dynbuf_add
	add	esp, 20					; 00000014H
$L70660:

; 368  : 
; 369  : 		/* Handle TVal & TField joins */
; 370  : 		if(b_val && *tsrc)

	cmp	DWORD PTR _b_val$70619[ebp], 0
	je	SHORT $L70663
	mov	eax, DWORD PTR _tsrc$70612[ebp]
	movsx	ecx, BYTE PTR [eax]
	test	ecx, ecx
	je	SHORT $L70663

; 371  : 			dynbuf_print4(&join, "\n%s JOIN TVal AS TVal%lu ON TVal%lu.IdValue=TLink%lu.IdValue", b_left ? "LEFT" : "INNER", i + 1, i + 1, i + 1);

	cmp	DWORD PTR _b_left$70611[ebp], 0
	je	SHORT $L71317
	mov	DWORD PTR -408+[ebp], OFFSET FLAT:$SG70665
	jmp	SHORT $L71318
$L71317:
	mov	DWORD PTR -408+[ebp], OFFSET FLAT:$SG70666
$L71318:
	push	0
	push	0
	mov	edx, DWORD PTR _i$[ebp]
	add	edx, 1
	push	edx
	mov	eax, DWORD PTR _i$[ebp]
	add	eax, 1
	push	eax
	mov	ecx, DWORD PTR _i$[ebp]
	add	ecx, 1
	push	ecx
	mov	edx, DWORD PTR -408+[ebp]
	push	edx
	push	OFFSET FLAT:$SG70667
	push	127					; 0000007fH
	lea	eax, DWORD PTR _printbuf$70616[ebp]
	push	eax
	call	__snprintf
	add	esp, 28					; 0000001cH
	push	eax
	lea	ecx, DWORD PTR _printbuf$70616[ebp]
	push	ecx
	lea	edx, DWORD PTR _join$[ebp]
	push	edx
	call	_dynbuf_add
	add	esp, 20					; 00000014H
$L70663:

; 372  : 		if(b_field && *tsrc)

	cmp	DWORD PTR _b_field$70620[ebp], 0
	je	SHORT $L70668
	mov	eax, DWORD PTR _tsrc$70612[ebp]
	movsx	ecx, BYTE PTR [eax]
	test	ecx, ecx
	je	SHORT $L70668

; 373  : 			dynbuf_print4(&join, "\n%s JOIN TVal AS TField%lu ON TField%lu.IdValue=TLink%lu.IdField", b_left ? "LEFT" : "INNER", i + 1, i + 1, i + 1);

	cmp	DWORD PTR _b_left$70611[ebp], 0
	je	SHORT $L71319
	mov	DWORD PTR -412+[ebp], OFFSET FLAT:$SG70670
	jmp	SHORT $L71320
$L71319:
	mov	DWORD PTR -412+[ebp], OFFSET FLAT:$SG70671
$L71320:
	push	0
	push	0
	mov	edx, DWORD PTR _i$[ebp]
	add	edx, 1
	push	edx
	mov	eax, DWORD PTR _i$[ebp]
	add	eax, 1
	push	eax
	mov	ecx, DWORD PTR _i$[ebp]
	add	ecx, 1
	push	ecx
	mov	edx, DWORD PTR -412+[ebp]
	push	edx
	push	OFFSET FLAT:$SG70672
	push	127					; 0000007fH
	lea	eax, DWORD PTR _printbuf$70616[ebp]
	push	eax
	call	__snprintf
	add	esp, 28					; 0000001cH
	push	eax
	lea	ecx, DWORD PTR _printbuf$70616[ebp]
	push	ecx
	lea	edx, DWORD PTR _join$[ebp]
	push	edx
	call	_dynbuf_add
	add	esp, 20					; 00000014H
$L70668:

; 374  : 
; 375  : 		/* Handle field & date condition */
; 376  : 		if(dyntab_sz(&field, i, 0))

	push	0
	mov	eax, DWORD PTR _i$[ebp]
	push	eax
	lea	ecx, DWORD PTR _field$[ebp]
	push	ecx
	call	_dyntab_sz
	add	esp, 12					; 0000000cH
	test	eax, eax
	je	$L70685

; 378  : 			if(dyntab_from_tab(&fld, 0, 0, &field, i, 0, i + 1, field.nbcols, 17)) RETURN_ERR_MEMORY;

	push	17					; 00000011H
	mov	edx, DWORD PTR _field$[ebp+8]
	push	edx
	mov	eax, DWORD PTR _i$[ebp]
	add	eax, 1
	push	eax
	push	0
	mov	ecx, DWORD PTR _i$[ebp]
	push	ecx
	lea	edx, DWORD PTR _field$[ebp]
	push	edx
	push	0
	push	0
	lea	eax, DWORD PTR _fld$[ebp]
	push	eax
	call	_dyntab_from_tab
	add	esp, 36					; 00000024H
	test	eax, eax
	je	SHORT $L70674
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29872], OFFSET FLAT:$SG70676
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 378		; 0000017aH
	jmp	$eva_err$70546
$L70674:

; 379  : 			if(qry_listobj_field(cntxt, &data, &fld, "_EVA_FIELD")) STACK_ERROR;

	push	OFFSET FLAT:$SG70678
	lea	eax, DWORD PTR _fld$[ebp]
	push	eax
	lea	ecx, DWORD PTR _data$[ebp]
	push	ecx
	mov	edx, DWORD PTR _cntxt$[ebp]
	push	edx
	call	_qry_listobj_field
	add	esp, 16					; 00000010H
	test	eax, eax
	je	SHORT $L70677
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 379		; 0000017bH
	jmp	$eva_err$70546
$L70677:

; 380  : 			dynbuf_print2(&cond, "%sTLink%lu.IdField IN(", cond ? "\nAND " : "", i + 1);

	cmp	DWORD PTR _cond$[ebp], 0
	je	SHORT $L71321
	mov	DWORD PTR -416+[ebp], OFFSET FLAT:$SG70680
	jmp	SHORT $L71322
$L71321:
	mov	DWORD PTR -416+[ebp], OFFSET FLAT:$SG70681
$L71322:
	push	0
	push	0
	mov	ecx, DWORD PTR _i$[ebp]
	add	ecx, 1
	push	ecx
	mov	edx, DWORD PTR -416+[ebp]
	push	edx
	push	OFFSET FLAT:$SG70682
	push	127					; 0000007fH
	lea	eax, DWORD PTR _printbuf$70616[ebp]
	push	eax
	call	__snprintf
	add	esp, 20					; 00000014H
	push	eax
	lea	ecx, DWORD PTR _printbuf$70616[ebp]
	push	ecx
	lea	edx, DWORD PTR _cond$[ebp]
	push	edx
	call	_dynbuf_add
	add	esp, 20					; 00000014H

; 381  : 			if(qry_values_list(cntxt, &data, 3, &cond)) STACK_ERROR;

	lea	eax, DWORD PTR _cond$[ebp]
	push	eax
	push	3
	lea	ecx, DWORD PTR _data$[ebp]
	push	ecx
	mov	edx, DWORD PTR _cntxt$[ebp]
	push	edx
	call	_qry_values_list
	add	esp, 16					; 00000010H
	test	eax, eax
	je	SHORT $L70683
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 381		; 0000017dH
	jmp	$eva_err$70546
$L70683:

; 382  : 			DYNBUF_ADD_STR(&cond, ")");

	push	0
	push	0
	push	1
	push	OFFSET FLAT:$SG70686
	lea	ecx, DWORD PTR _cond$[ebp]
	push	ecx
	call	_dynbuf_add
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L70685
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29872], OFFSET FLAT:$SG70688
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 382		; 0000017eH
	jmp	$eva_err$70546
$L70685:

; 384  : 		if(!*dtdel)

	mov	ecx, DWORD PTR _dtdel$70610[ebp]
	movsx	edx, BYTE PTR [ecx]
	test	edx, edx
	jne	SHORT $L70689

; 385  : 			dynbuf_print2(&cond, "%sTLink%lu.DateDel IS NULL", cond ? " AND " : "", i + 1);

	cmp	DWORD PTR _cond$[ebp], 0
	je	SHORT $L71323
	mov	DWORD PTR -420+[ebp], OFFSET FLAT:$SG70691
	jmp	SHORT $L71324
$L71323:
	mov	DWORD PTR -420+[ebp], OFFSET FLAT:$SG70692
$L71324:
	push	0
	push	0
	mov	eax, DWORD PTR _i$[ebp]
	add	eax, 1
	push	eax
	mov	ecx, DWORD PTR -420+[ebp]
	push	ecx
	push	OFFSET FLAT:$SG70693
	push	127					; 0000007fH
	lea	edx, DWORD PTR _printbuf$70616[ebp]
	push	edx
	call	__snprintf
	add	esp, 20					; 00000014H
	push	eax
	lea	eax, DWORD PTR _printbuf$70616[ebp]
	push	eax
	lea	ecx, DWORD PTR _cond$[ebp]
	push	ecx
	call	_dynbuf_add
	add	esp, 20					; 00000014H
$L70689:

; 386  : 	}

	jmp	$L70607
$L70608:

; 387  : 
; 388  : 	/* Build SQL expression */
; 389  : 	if(!join) RETURN_OK;

	cmp	DWORD PTR _join$[ebp], 0
	jne	SHORT $L70694
	jmp	$eva_noerr$70536
$L70694:

; 390  : 	DYNBUF_ADD_BUF(sql, bef, NO_CONV);

	cmp	DWORD PTR _bef$[ebp], 0
	je	SHORT $L70696
	push	0
	push	0
	mov	edx, DWORD PTR _bef$[ebp]
	mov	eax, DWORD PTR [edx+4]
	push	eax
	mov	ecx, DWORD PTR _bef$[ebp]
	add	ecx, 8
	push	ecx
	mov	edx, DWORD PTR _sql$[ebp]
	push	edx
	call	_dynbuf_add
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L70696
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29872], OFFSET FLAT:$SG70698
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 390		; 00000186H
	jmp	$eva_err$70546
$L70696:

; 391  : 	DYNBUF_ADD_BUF(sql, join, NO_CONV);

	cmp	DWORD PTR _join$[ebp], 0
	je	SHORT $L70700
	push	0
	push	0
	mov	edx, DWORD PTR _join$[ebp]
	mov	eax, DWORD PTR [edx+4]
	push	eax
	mov	ecx, DWORD PTR _join$[ebp]
	add	ecx, 8
	push	ecx
	mov	edx, DWORD PTR _sql$[ebp]
	push	edx
	call	_dynbuf_add
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L70700
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29872], OFFSET FLAT:$SG70702
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 391		; 00000187H
	jmp	$eva_err$70546
$L70700:

; 392  : 	if((where && *where) || cond) DYNBUF_ADD_STR(sql, "\nWHERE (");

	cmp	DWORD PTR _where$[ebp], 0
	je	SHORT $L70705
	mov	edx, DWORD PTR _where$[ebp]
	movsx	eax, BYTE PTR [edx]
	test	eax, eax
	jne	SHORT $L70704
$L70705:
	cmp	DWORD PTR _cond$[ebp], 0
	je	SHORT $L70707
$L70704:
	push	0
	push	0
	push	8
	push	OFFSET FLAT:$SG70708
	mov	ecx, DWORD PTR _sql$[ebp]
	push	ecx
	call	_dynbuf_add
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L70707
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29872], OFFSET FLAT:$SG70710
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 392		; 00000188H
	jmp	$eva_err$70546
$L70707:

; 393  : 	if(cond) DYNBUF_ADD3_BUF(sql, "", cond, NO_CONV, ")");

	cmp	DWORD PTR _cond$[ebp], 0
	je	$L70714
	cmp	DWORD PTR _cond$[ebp], 0
	je	SHORT $L71325
	mov	ecx, DWORD PTR _cond$[ebp]
	mov	edx, DWORD PTR [ecx+4]
	mov	DWORD PTR -424+[ebp], edx
	jmp	SHORT $L71326
$L71325:
	mov	DWORD PTR -424+[ebp], 0
$L71326:
	cmp	DWORD PTR _cond$[ebp], 0
	je	SHORT $L71327
	mov	eax, DWORD PTR _cond$[ebp]
	add	eax, 8
	mov	DWORD PTR -428+[ebp], eax
	jmp	SHORT $L71328
$L71327:
	mov	DWORD PTR -428+[ebp], 0
$L71328:
	push	1
	push	OFFSET FLAT:$SG70715
	push	0
	push	0
	mov	ecx, DWORD PTR -424+[ebp]
	push	ecx
	mov	edx, DWORD PTR -428+[ebp]
	push	edx
	push	0
	push	OFFSET FLAT:$SG70716
	mov	eax, DWORD PTR _sql$[ebp]
	push	eax
	call	_dynbuf_add3
	add	esp, 36					; 00000024H
	test	eax, eax
	je	SHORT $L70714
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29872], OFFSET FLAT:$SG70718
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 393		; 00000189H
	jmp	$eva_err$70546
$L70714:

; 394  : 	if(where && *where && cond) DYNBUF_ADD_STR(sql, "\nAND (");

	cmp	DWORD PTR _where$[ebp], 0
	je	SHORT $L70721
	mov	eax, DWORD PTR _where$[ebp]
	movsx	ecx, BYTE PTR [eax]
	test	ecx, ecx
	je	SHORT $L70721
	cmp	DWORD PTR _cond$[ebp], 0
	je	SHORT $L70721
	push	0
	push	0
	push	6
	push	OFFSET FLAT:$SG70722
	mov	edx, DWORD PTR _sql$[ebp]
	push	edx
	call	_dynbuf_add
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L70721
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29872], OFFSET FLAT:$SG70724
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 394		; 0000018aH
	jmp	SHORT $eva_err$70546
$L70721:

; 395  : 	if(aft) DYNBUF_ADD_BUF(sql, aft, NO_CONV);

	cmp	DWORD PTR _aft$[ebp], 0
	je	SHORT $L70727
	cmp	DWORD PTR _aft$[ebp], 0
	je	SHORT $L70727
	push	0
	push	0
	mov	edx, DWORD PTR _aft$[ebp]
	mov	eax, DWORD PTR [edx+4]
	push	eax
	mov	ecx, DWORD PTR _aft$[ebp]
	add	ecx, 8
	push	ecx
	mov	edx, DWORD PTR _sql$[ebp]
	push	edx
	call	_dynbuf_add
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L70727
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29872], OFFSET FLAT:$SG70729
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 395		; 0000018bH
	jmp	SHORT $eva_err$70546
$L70727:
$eva_noerr$70536:

; 396  : 
; 397  : 	RETURN_OK_CLEANUP;

	push	0
	push	OFFSET FLAT:$SG70730
	push	OFFSET FLAT:$SG70731
	mov	edx, DWORD PTR _cntxt$[ebp]
	push	edx
	call	_err_clear
	add	esp, 16					; 00000010H
$eva_err$70546:
	mov	eax, DWORD PTR _cntxt$[ebp]
	cmp	DWORD PTR [eax+29872], 0
	je	SHORT $L70732
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	edx, DWORD PTR [ecx+29900]
	push	edx
	push	OFFSET FLAT:$SG70733
	push	OFFSET FLAT:$SG70734
	mov	eax, DWORD PTR _cntxt$[ebp]
	push	eax
	call	_err_add_context
	add	esp, 16					; 00000010H
$L70732:
	lea	ecx, DWORD PTR _typ$[ebp]
	push	ecx
	call	_dyntab_free
	add	esp, 4
	lea	edx, DWORD PTR _field$[ebp]
	push	edx
	call	_dyntab_free
	add	esp, 4
	lea	eax, DWORD PTR _src$[ebp]
	push	eax
	call	_dyntab_free
	add	esp, 4
	lea	ecx, DWORD PTR _left$[ebp]
	push	ecx
	call	_dyntab_free
	add	esp, 4
	lea	edx, DWORD PTR _datedel$[ebp]
	push	edx
	call	_dyntab_free
	add	esp, 4
	lea	eax, DWORD PTR _fld$[ebp]
	push	eax
	call	_dyntab_free
	add	esp, 4
	lea	ecx, DWORD PTR _data$[ebp]
	push	ecx
	call	_dyntab_free
	add	esp, 4
	mov	edx, DWORD PTR _bef$[ebp]
	push	edx
	call	_mem_free
	add	esp, 4
	mov	DWORD PTR _bef$[ebp], 0
	mov	eax, DWORD PTR _aft$[ebp]
	push	eax
	call	_mem_free
	add	esp, 4
	mov	DWORD PTR _aft$[ebp], 0
	mov	ecx, DWORD PTR _cond$[ebp]
	push	ecx
	call	_mem_free
	add	esp, 4
	mov	DWORD PTR _cond$[ebp], 0
	mov	edx, DWORD PTR _join$[ebp]
	push	edx
	call	_mem_free
	add	esp, 4
	mov	DWORD PTR _join$[ebp], 0
	mov	eax, DWORD PTR _cntxt$[ebp]
	xor	ecx, ecx
	cmp	DWORD PTR [eax+29872], 0
	setne	cl
	mov	eax, ecx

; 398  : }

	mov	esp, ebp
	pop	ebp
	ret	0
_qry_build_joins ENDP
_TEXT	ENDS
PUBLIC	_subform_output
EXTRN	_cgi_build_basename:NEAR
EXTRN	_form_free:NEAR
EXTRN	_mem_alloc:NEAR
EXTRN	_mem_realloc:NEAR
EXTRN	_ctrl_set_common_attr:NEAR
EXTRN	_ctrl_add_new:NEAR
EXTRN	_ctrl_put_table_header:NEAR
EXTRN	_ctrl_put_table_footer:NEAR
EXTRN	_ctrl_primary_handler:NEAR
_BSS	SEGMENT
	ALIGN	4

$SG70759 DB	01H DUP (?)
	ALIGN	4

$SG70808 DB	01H DUP (?)
	ALIGN	4

$SG70809 DB	01H DUP (?)
	ALIGN	4

$SG70810 DB	01H DUP (?)
	ALIGN	4

$SG70811 DB	01H DUP (?)
	ALIGN	4

$SG70812 DB	01H DUP (?)
	ALIGN	4

$SG70813 DB	01H DUP (?)
_BSS	ENDS
_DATA	SEGMENT
$SG70758 DB	'_EVA_LAYOUT_MODE', 00H
	ORG $+3
$SG70764 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70769 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70775 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70779 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70787 DB	'_EVA_NONE', 00H
	ORG $+2
$SG70789 DB	'_EVA_NewLine', 00H
	ORG $+3
$SG70796 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70819 DB	'D:\Travail\ABI\EVA\V4.0\CGI\Brunix-2016\ctrl_exprval.c', 00H
	ORG $+1
$SG70820 DB	'subform_output', 00H
	ORG $+1
$SG70822 DB	'D:\Travail\ABI\EVA\V4.0\CGI\Brunix-2016\ctrl_exprval.c', 00H
	ORG $+1
$SG70823 DB	'subform_output', 00H
_DATA	ENDS
_TEXT	SEGMENT
_cntxt$ = 8
_ctrl$ = 12
_srcobj$ = 16
_srcfield$ = 20
_mode$ = 24
_form$ = -4
_form0$ = -12
_i$ = -16
_j$ = -20
_buf$ = -8
_layout$ = -24
_size1$70760 = -28
_newdest$70770 = -32
_cnt$70802 = -36
_c$70807 = -40
_subform_output PROC NEAR

; 418  : ){

	push	ebp
	mov	ebp, esp
	sub	esp, 48					; 00000030H

; 419  : 	EVA_form *form = NULL, *form0 = cntxt->form;

	mov	DWORD PTR _form$[ebp], 0
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	ecx, DWORD PTR [eax+80]
	mov	DWORD PTR _form0$[ebp], ecx

; 420  : 	unsigned long i, j;
; 421  : 	DynBuffer *buf = NULL;

	mov	DWORD PTR _buf$[ebp], 0

; 422  : 	char *layout = CTRL_ATTR_VAL(LAYOUT_MODE);

	cmp	DWORD PTR _ctrl$[ebp], 0
	je	SHORT $L71330
	push	0
	push	-1
	push	OFFSET FLAT:$SG70758
	mov	edx, DWORD PTR _ctrl$[ebp]
	add	edx, 44					; 0000002cH
	push	edx
	call	_dyntab_field_val
	add	esp, 16					; 00000010H
	mov	DWORD PTR -44+[ebp], eax
	jmp	SHORT $L71331
$L71330:
	mov	DWORD PTR -44+[ebp], OFFSET FLAT:$SG70759
$L71331:
	mov	eax, DWORD PTR -44+[ebp]
	mov	DWORD PTR _layout$[ebp], eax

; 423  : 
; 424  : 	/* Load new form based on current form */
; 425  : 	M_ALLOC(cntxt->form, sizeof(EVA_form));

	mov	DWORD PTR _size1$70760[ebp], 244	; 000000f4H
	mov	ecx, DWORD PTR _size1$70760[ebp]
	push	ecx
	call	_mem_alloc
	add	esp, 4
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+80], eax
	cmp	DWORD PTR _size1$70760[ebp], 0
	je	SHORT $L70762
	mov	eax, DWORD PTR _cntxt$[ebp]
	cmp	DWORD PTR [eax+80], 0
	jne	SHORT $L70762
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29872], OFFSET FLAT:$SG70764
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 425		; 000001a9H
	jmp	$eva_err$70765
$L70762:

; 426  : 	form = cntxt->form;

	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	ecx, DWORD PTR [eax+80]
	mov	DWORD PTR _form$[ebp], ecx

; 427  : 	DYNTAB_ADD_CELL(&form->id_form, 0, 0, &form0->id_form, 0, 0);

	push	1
	push	0
	push	0
	mov	edx, DWORD PTR _form0$[ebp]
	add	edx, 12					; 0000000cH
	push	edx
	call	_dyntab_cell
	add	esp, 12					; 0000000cH
	push	eax
	push	0
	push	0
	mov	eax, DWORD PTR _form$[ebp]
	add	eax, 12					; 0000000cH
	push	eax
	call	_dyntab_copy
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L70767
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29872], OFFSET FLAT:$SG70769
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 427		; 000001abH
	jmp	$eva_err$70765
$L70767:

; 428  : 	M_REALLOC(EVA_ctrl, form->ctrl, form->nb_ctrl);

	push	960					; 000003c0H
	mov	eax, DWORD PTR _form$[ebp]
	mov	ecx, DWORD PTR [eax+4]
	imul	ecx, 480				; 000001e0H
	push	ecx
	mov	edx, DWORD PTR _form$[ebp]
	mov	eax, DWORD PTR [edx]
	push	eax
	call	_mem_realloc
	add	esp, 12					; 0000000cH
	mov	DWORD PTR _newdest$70770[ebp], eax
	cmp	DWORD PTR _newdest$70770[ebp], 0
	jne	SHORT $L70773
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29872], OFFSET FLAT:$SG70775
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 428		; 000001acH
	jmp	$eva_err$70765
$L70773:
	mov	eax, DWORD PTR _form$[ebp]
	mov	ecx, DWORD PTR _newdest$70770[ebp]
	mov	DWORD PTR [eax], ecx
	mov	edx, DWORD PTR _form$[ebp]
	mov	eax, DWORD PTR [edx+4]
	add	eax, 1
	mov	ecx, DWORD PTR _form$[ebp]
	mov	DWORD PTR [ecx+4], eax

; 429  : 	if(dyntab_from_tab(&form->ctrl->attr, 0, 0, &form0->ctrl->attr, 0, 0, form0->ctrl->attr.nbrows, 1, 7)) RETURN_ERR_MEMORY;

	push	7
	push	1
	mov	edx, DWORD PTR _form0$[ebp]
	mov	eax, DWORD PTR [edx]
	mov	ecx, DWORD PTR [eax+44]
	push	ecx
	push	0
	push	0
	mov	edx, DWORD PTR _form0$[ebp]
	mov	eax, DWORD PTR [edx]
	add	eax, 44					; 0000002cH
	push	eax
	push	0
	push	0
	mov	ecx, DWORD PTR _form$[ebp]
	mov	edx, DWORD PTR [ecx]
	add	edx, 44					; 0000002cH
	push	edx
	call	_dyntab_from_tab
	add	esp, 36					; 00000024H
	test	eax, eax
	je	SHORT $L70777
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29872], OFFSET FLAT:$SG70779
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 429		; 000001adH
	jmp	$eva_err$70765
$L70777:

; 430  : 	if(ctrl_set_common_attr(cntxt, form->ctrl)) STACK_ERROR;

	mov	edx, DWORD PTR _form$[ebp]
	mov	eax, DWORD PTR [edx]
	push	eax
	mov	ecx, DWORD PTR _cntxt$[ebp]
	push	ecx
	call	_ctrl_set_common_attr
	add	esp, 8
	test	eax, eax
	je	SHORT $L70780
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 430		; 000001aeH
	jmp	$eva_err$70765
$L70780:

; 431  : 
; 432  : 	/* Load selected controls in form */
; 433  : 	for(i = 0; i < srcfield->nbrows; i++)

	mov	DWORD PTR _i$[ebp], 0
	jmp	SHORT $L70781
$L70782:
	mov	eax, DWORD PTR _i$[ebp]
	add	eax, 1
	mov	DWORD PTR _i$[ebp], eax
$L70781:
	mov	ecx, DWORD PTR _srcfield$[ebp]
	mov	edx, DWORD PTR _i$[ebp]
	cmp	edx, DWORD PTR [ecx]
	jae	$L70783

; 435  : 		if(ctrl_add_new(cntxt, DYNTAB_TOULRC(srcfield, i, 0), &j)) STACK_ERROR;

	lea	eax, DWORD PTR _j$[ebp]
	push	eax
	push	10					; 0000000aH
	push	0
	push	0
	mov	ecx, DWORD PTR _i$[ebp]
	push	ecx
	mov	edx, DWORD PTR _srcfield$[ebp]
	push	edx
	call	_dyntab_val
	add	esp, 12					; 0000000cH
	push	eax
	call	_strtoul
	add	esp, 12					; 0000000cH
	push	eax
	mov	eax, DWORD PTR _cntxt$[ebp]
	push	eax
	call	_ctrl_add_new
	add	esp, 12					; 0000000cH
	test	eax, eax
	je	SHORT $L70785
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 435		; 000001b3H
	jmp	$eva_err$70765
$L70785:

; 436  : 		if(mode & 1) form->ctrl[j].LABELPOS = "_EVA_NONE";

	mov	edx, DWORD PTR _mode$[ebp]
	and	edx, 1
	test	edx, edx
	je	SHORT $L70786
	mov	eax, DWORD PTR _j$[ebp]
	imul	eax, 480				; 000001e0H
	mov	ecx, DWORD PTR _form$[ebp]
	mov	edx, DWORD PTR [ecx]
	mov	DWORD PTR [edx+eax+292], OFFSET FLAT:$SG70787
$L70786:

; 437  : 		if(mode & 2) form->ctrl[j].POSITION = "_EVA_NewLine";

	mov	eax, DWORD PTR _mode$[ebp]
	and	eax, 2
	test	eax, eax
	je	SHORT $L70788
	mov	ecx, DWORD PTR _j$[ebp]
	imul	ecx, 480				; 000001e0H
	mov	edx, DWORD PTR _form$[ebp]
	mov	eax, DWORD PTR [edx]
	mov	DWORD PTR [eax+ecx+296], OFFSET FLAT:$SG70789
$L70788:

; 438  : 	}

	jmp	$L70782
$L70783:

; 439  : 
; 440  : 	/* Read & output each object */
; 441  : 	form->b_noctrltree = 1;

	mov	ecx, DWORD PTR _form$[ebp]
	mov	DWORD PTR [ecx+200], 1

; 442  : 	form->html = form0->html;

	mov	edx, DWORD PTR _form$[ebp]
	mov	eax, DWORD PTR _form0$[ebp]
	mov	ecx, DWORD PTR [eax+232]
	mov	DWORD PTR [edx+232], ecx

; 443  : 	if(ctrl_put_table_header(cntxt, ctrl)) STACK_ERROR;

	mov	edx, DWORD PTR _ctrl$[ebp]
	push	edx
	mov	eax, DWORD PTR _cntxt$[ebp]
	push	eax
	call	_ctrl_put_table_header
	add	esp, 8
	test	eax, eax
	je	SHORT $L70790
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 443		; 000001bbH
	jmp	$eva_err$70765
$L70790:

; 444  : 	for(i = 0; i < srcobj->nbrows; i++)

	mov	DWORD PTR _i$[ebp], 0
	jmp	SHORT $L70791
$L70792:
	mov	edx, DWORD PTR _i$[ebp]
	add	edx, 1
	mov	DWORD PTR _i$[ebp], edx
$L70791:
	mov	eax, DWORD PTR _srcobj$[ebp]
	mov	ecx, DWORD PTR _i$[ebp]
	cmp	ecx, DWORD PTR [eax]
	jae	$L70793

; 446  : 		DYNTAB_SET_CELL(&form->id_obj, 0, 0, srcobj, i, 0);

	push	0
	push	0
	mov	edx, DWORD PTR _i$[ebp]
	push	edx
	mov	eax, DWORD PTR _srcobj$[ebp]
	push	eax
	call	_dyntab_cell
	add	esp, 12					; 0000000cH
	push	eax
	push	0
	push	0
	mov	ecx, DWORD PTR _form$[ebp]
	add	ecx, 32					; 00000020H
	push	ecx
	call	_dyntab_copy
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L70794
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29872], OFFSET FLAT:$SG70796
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 446		; 000001beH
	jmp	$eva_err$70765
$L70794:

; 447  : 		if(qry_obj_data(cntxt, &form->objdata, &form->id_obj, NULL)) STACK_ERROR;

	push	0
	mov	ecx, DWORD PTR _form$[ebp]
	add	ecx, 32					; 00000020H
	push	ecx
	mov	edx, DWORD PTR _form$[ebp]
	add	edx, 52					; 00000034H
	push	edx
	mov	eax, DWORD PTR _cntxt$[ebp]
	push	eax
	call	_qry_obj_data
	add	esp, 16					; 00000010H
	test	eax, eax
	je	SHORT $L70798
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 447		; 000001bfH
	jmp	$eva_err$70765
$L70798:

; 448  : 		for(j = 1; j <= srcfield->nbrows; j++)

	mov	DWORD PTR _j$[ebp], 1
	jmp	SHORT $L70799
$L70800:
	mov	edx, DWORD PTR _j$[ebp]
	add	edx, 1
	mov	DWORD PTR _j$[ebp], edx
$L70799:
	mov	eax, DWORD PTR _srcfield$[ebp]
	mov	ecx, DWORD PTR _j$[ebp]
	cmp	ecx, DWORD PTR [eax]
	ja	$L70801

; 450  : 			unsigned long cnt = (*form->html) ? (*form->html)->cnt : 0;

	mov	edx, DWORD PTR _form$[ebp]
	mov	eax, DWORD PTR [edx+232]
	cmp	DWORD PTR [eax], 0
	je	SHORT $L71332
	mov	ecx, DWORD PTR _form$[ebp]
	mov	edx, DWORD PTR [ecx+232]
	mov	eax, DWORD PTR [edx]
	mov	ecx, DWORD PTR [eax+4]
	mov	DWORD PTR -48+[ebp], ecx
	jmp	SHORT $L71333
$L71332:
	mov	DWORD PTR -48+[ebp], 0
$L71333:
	mov	edx, DWORD PTR -48+[ebp]
	mov	DWORD PTR _cnt$70802[ebp], edx

; 451  : 			if(cgi_build_basename(cntxt, &form->ctrl[j].cginame, j, 'C')) STACK_ERROR;

	push	67					; 00000043H
	mov	eax, DWORD PTR _j$[ebp]
	push	eax
	mov	ecx, DWORD PTR _j$[ebp]
	imul	ecx, 480				; 000001e0H
	mov	edx, DWORD PTR _form$[ebp]
	mov	eax, DWORD PTR [edx]
	lea	ecx, DWORD PTR [eax+ecx+40]
	push	ecx
	mov	edx, DWORD PTR _cntxt$[ebp]
	push	edx
	call	_cgi_build_basename
	add	esp, 16					; 00000010H
	test	eax, eax
	je	SHORT $L70803
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 451		; 000001c3H
	jmp	$eva_err$70765
$L70803:

; 452  : 			form->step = CtrlRead;

	mov	ecx, DWORD PTR _form$[ebp]
	mov	DWORD PTR [ecx+176], 0

; 453  : 			CTRL_PRI_HDLR(j);

	cmp	DWORD PTR _j$[ebp], 0
	je	SHORT $L70805
	mov	edx, DWORD PTR _j$[ebp]
	push	edx
	mov	eax, DWORD PTR _cntxt$[ebp]
	push	eax
	call	_ctrl_primary_handler
	add	esp, 8
	test	eax, eax
	je	SHORT $L70805
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 453		; 000001c5H
	jmp	$eva_err$70765
$L70805:

; 454  : 			if(*layout)

	mov	edx, DWORD PTR _layout$[ebp]
	movsx	eax, BYTE PTR [edx]
	test	eax, eax
	je	SHORT $L70806

; 456  : 				EVA_ctrl *c = form->ctrl + j;

	mov	ecx, DWORD PTR _j$[ebp]
	imul	ecx, 480				; 000001e0H
	mov	edx, DWORD PTR _form$[ebp]
	mov	eax, DWORD PTR [edx]
	add	eax, ecx
	mov	DWORD PTR _c$70807[ebp], eax

; 457  : 				c->POSITION = "";

	mov	ecx, DWORD PTR _c$70807[ebp]
	mov	DWORD PTR [ecx+296], OFFSET FLAT:$SG70808

; 458  : 				c->ALIGN = "";

	mov	edx, DWORD PTR _c$70807[ebp]
	mov	DWORD PTR [edx+300], OFFSET FLAT:$SG70809

; 459  : 				c->VALIGN = "";

	mov	eax, DWORD PTR _c$70807[ebp]
	mov	DWORD PTR [eax+304], OFFSET FLAT:$SG70810

; 460  : 				c->LABELPOS= "";

	mov	ecx, DWORD PTR _c$70807[ebp]
	mov	DWORD PTR [ecx+292], OFFSET FLAT:$SG70811

; 461  : 				c->LABELALIGN = "";

	mov	edx, DWORD PTR _c$70807[ebp]
	mov	DWORD PTR [edx+384], OFFSET FLAT:$SG70812

; 462  : 				c->LABELVALIGN = "";

	mov	eax, DWORD PTR _c$70807[ebp]
	mov	DWORD PTR [eax+388], OFFSET FLAT:$SG70813
$L70806:

; 464  : 			form->step = HtmlView;

	mov	ecx, DWORD PTR _form$[ebp]
	mov	DWORD PTR [ecx+176], 6

; 465  : 			CTRL_PRI_HDLR(j);

	cmp	DWORD PTR _j$[ebp], 0
	je	SHORT $L70815
	mov	edx, DWORD PTR _j$[ebp]
	push	edx
	mov	eax, DWORD PTR _cntxt$[ebp]
	push	eax
	call	_ctrl_primary_handler
	add	esp, 8
	test	eax, eax
	je	SHORT $L70815
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 465		; 000001d1H
	jmp	$eva_err$70765
$L70815:

; 466  : 			if(!form->ctrl[j].val.nbrows)

	mov	edx, DWORD PTR _j$[ebp]
	imul	edx, 480				; 000001e0H
	mov	eax, DWORD PTR _form$[ebp]
	mov	ecx, DWORD PTR [eax]
	cmp	DWORD PTR [ecx+edx+64], 0
	jne	SHORT $L70816

; 467  : 				(*form->html)->cnt = cnt;

	mov	edx, DWORD PTR _form$[ebp]
	mov	eax, DWORD PTR [edx+232]
	mov	ecx, DWORD PTR [eax]
	mov	edx, DWORD PTR _cnt$70802[ebp]
	mov	DWORD PTR [ecx+4], edx
$L70816:

; 468  : 			DYNTAB_FREE(form->ctrl[j].val);

	mov	eax, DWORD PTR _j$[ebp]
	imul	eax, 480				; 000001e0H
	mov	ecx, DWORD PTR _form$[ebp]
	mov	edx, DWORD PTR [ecx]
	lea	eax, DWORD PTR [edx+eax+64]
	push	eax
	call	_dyntab_free
	add	esp, 4

; 469  : 		}

	jmp	$L70800
$L70801:

; 470  : 	}

	jmp	$L70792
$L70793:

; 471  : 	if(ctrl_put_table_footer(cntxt, ctrl)) STACK_ERROR;

	mov	ecx, DWORD PTR _ctrl$[ebp]
	push	ecx
	mov	edx, DWORD PTR _cntxt$[ebp]
	push	edx
	call	_ctrl_put_table_footer
	add	esp, 8
	test	eax, eax
	je	SHORT $eva_noerr$70818
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 471		; 000001d7H
	jmp	SHORT $eva_err$70765
$eva_noerr$70818:

; 472  : 
; 473  : 	RETURN_OK_CLEANUP;

	push	0
	push	OFFSET FLAT:$SG70819
	push	OFFSET FLAT:$SG70820
	mov	ecx, DWORD PTR _cntxt$[ebp]
	push	ecx
	call	_err_clear
	add	esp, 16					; 00000010H
$eva_err$70765:
	mov	edx, DWORD PTR _cntxt$[ebp]
	cmp	DWORD PTR [edx+29872], 0
	je	SHORT $L70821
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	ecx, DWORD PTR [eax+29900]
	push	ecx
	push	OFFSET FLAT:$SG70822
	push	OFFSET FLAT:$SG70823
	mov	edx, DWORD PTR _cntxt$[ebp]
	push	edx
	call	_err_add_context
	add	esp, 16					; 00000010H
$L70821:
	mov	eax, DWORD PTR _buf$[ebp]
	push	eax
	call	_mem_free
	add	esp, 4
	mov	DWORD PTR _buf$[ebp], 0
	mov	ecx, DWORD PTR _cntxt$[ebp]
	push	ecx
	call	_form_free
	add	esp, 4
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	eax, DWORD PTR _form0$[ebp]
	mov	DWORD PTR [edx+80], eax
	mov	ecx, DWORD PTR _cntxt$[ebp]
	xor	eax, eax
	cmp	DWORD PTR [ecx+29872], 0
	setne	al

; 474  : }

	mov	esp, ebp
	pop	ebp
	ret	0
_subform_output ENDP
_TEXT	ENDS
PUBLIC	_ctrl_output_exprval
EXTRN	_qry_obj_label:NEAR
EXTRN	_form_eval_valtype:NEAR
EXTRN	_ctrl_eval_valtyp:NEAR
EXTRN	_datetxt_to_format:NEAR
EXTRN	_put_html_button_sz:NEAR
EXTRN	_sql_exec_query:NEAR
EXTRN	_syscmd_string:BYTE
EXTRN	_ctrl_read_baseobj:NEAR
EXTRN	__chkstk:NEAR
EXTRN	_sql_get_table:NEAR
EXTRN	_sql_drop_table:NEAR
EXTRN	_dyntab_add:NEAR
EXTRN	_qry_eval_fieldexpr:NEAR
EXTRN	_qry_eval_sql_fieldexpr:NEAR
EXTRN	_qry_build_free:NEAR
EXTRN	_build_open_btn_name:NEAR
EXTRN	_qry_add_filter_forms:NEAR
EXTRN	_dyntab_group:NEAR
EXTRN	_qry_filter_table:NEAR
EXTRN	_form_get_field_values:NEAR
_BSS	SEGMENT
	ALIGN	4

$SG70841 DB	01H DUP (?)
	ALIGN	4

$SG70846 DB	01H DUP (?)
	ALIGN	4

$SG70879 DB	01H DUP (?)
	ALIGN	4

$SG70924 DB	01H DUP (?)
	ALIGN	4

$SG70960 DB	01H DUP (?)
	ALIGN	4

$SG70963 DB	01H DUP (?)
	ALIGN	4

$SG70976 DB	01H DUP (?)
	ALIGN	4

$SG71002 DB	01H DUP (?)
	ALIGN	4

$SG71004 DB	01H DUP (?)
	ALIGN	4

$SG71006 DB	01H DUP (?)
	ALIGN	4

$SG71008 DB	01H DUP (?)
	ALIGN	4

$SG71040 DB	01H DUP (?)
	ALIGN	4

$SG71043 DB	01H DUP (?)
	ALIGN	4

$SG71046 DB	01H DUP (?)
	ALIGN	4

$SG71084 DB	01H DUP (?)
	ALIGN	4

$SG71089 DB	01H DUP (?)
	ALIGN	4

$SG71158 DB	01H DUP (?)
_BSS	ENDS
_DATA	SEGMENT
	ORG $+1
$SG70840 DB	'_EVA_TYPE', 00H
	ORG $+2
$SG70845 DB	'_EVA_DEBUG_SQL_EXPR', 00H
$SG70848 DB	'_EVA_USERNAME', 00H
	ORG $+2
$SG70854 DB	'_EVA_FORMSTAMP', 00H
	ORG $+1
$SG70856 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70859 DB	'NMIN', 00H
	ORG $+3
$SG70861 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70869 DB	'D:\Travail\ABI\EVA\V4.0\CGI\Brunix-2016\ctrl_exprval.c', 00H
	ORG $+1
$SG70870 DB	'ctrl_output_exprval', 00H
$SG70875 DB	'_EVA_USERNAME', 00H
	ORG $+2
$SG70878 DB	'_EVA_NOT_IDENTIFIED', 00H
$SG70881 DB	'Utilisateur non identifi', 0e9H, 00H
	ORG $+2
$SG70885 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70891 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70897 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70900 DB	'_EVA_SYSTEMTIME', 00H
$SG70906 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70912 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70918 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70921 DB	'_EVA_CTRLVAL', 00H
	ORG $+3
$SG70923 DB	'_EVA_SRC_TYPE', 00H
	ORG $+2
$SG70926 DB	'_EVA_SRC_CTRL', 00H
	ORG $+2
$SG70929 DB	'_EVA_SRC_CTRL', 00H
	ORG $+2
$SG70931 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70933 DB	'_EVA_FILTER', 00H
$SG70936 DB	'_EVA_FILTERS', 00H
	ORG $+3
$SG70938 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70941 DB	'_EVA_FILTER', 00H
$SG70944 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70950 DB	'_EVA_CTRLTREE', 00H
	ORG $+2
$SG70952 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70959 DB	'_EVA_DISPLAYFORMAT', 00H
	ORG $+1
$SG70962 DB	'_EVA_MULTIPLE_HANDLER', 00H
	ORG $+2
$SG70966 DB	'_EVA_LABELUNIT', 00H
	ORG $+1
$SG70968 DB	', ', 00H
	ORG $+1
$SG70970 DB	'_EVA_SQL_QUERY', 00H
	ORG $+1
$SG70975 DB	'_EVA_SQL_SCRIPT', 00H
$SG70982 DB	';', 0aH, 00H
	ORG $+1
$SG70986 DB	'D:\Travail\ABI\EVA\V4.0\CGI\Brunix-2016\ctrl_exprval.c', 00H
	ORG $+1
$SG70987 DB	'ctrl_output_exprval', 00H
$SG70990 DB	'D:\Travail\ABI\EVA\V4.0\CGI\Brunix-2016\ctrl_exprval.c', 00H
	ORG $+1
$SG70991 DB	'ctrl_output_exprval', 00H
$SG70994 DB	'_EVA_SQLEXPR', 00H
	ORG $+3
$SG70996 DB	']', 0aH, 00H
	ORG $+1
$SG70997 DB	'-- SQL value [', 00H
	ORG $+1
$SG70999 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG71001 DB	'_EVA_OTHER_CLAUSE', 00H
	ORG $+2
$SG71003 DB	'_EVA_WHERE_CLAUSE', 00H
	ORG $+2
$SG71005 DB	'_EVA_FROM_CLAUSE', 00H
	ORG $+3
$SG71007 DB	'_EVA_SELECT_CLAUSE', 00H
	ORG $+1
$SG71009 DB	'D:\Travail\ABI\EVA\V4.0\CGI\Brunix-2016\ctrl_exprval.c', 00H
	ORG $+1
$SG71010 DB	'ctrl_output_exprval', 00H
$SG71013 DB	'D:\Travail\ABI\EVA\V4.0\CGI\Brunix-2016\ctrl_exprval.c', 00H
	ORG $+1
$SG71014 DB	'ctrl_output_exprval', 00H
$SG71017 DB	'_EVA_CTRL_VAL', 00H
	ORG $+2
$SG71021 DB	'_EVA_CTRLTREE', 00H
	ORG $+2
$SG71023 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG71032 DB	'_EVA_FIELD', 00H
	ORG $+1
$SG71036 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG71039 DB	'_EVA_SRC_OBJ', 00H
	ORG $+3
$SG71042 DB	'_EVA_EVAL_METHOD', 00H
	ORG $+3
$SG71045 DB	'_EVA_', 00H
	ORG $+2
$SG71048 DB	'_EVA_CURRENTOBJ', 00H
$SG71051 DB	'_EVA_LISTOBJ', 00H
	ORG $+3
$SG71053 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG71056 DB	'_EVA_SRCFIELD', 00H
	ORG $+2
$SG71058 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG71060 DB	'_EVA_DB', 00H
$SG71061 DB	'_EVA_FILTER', 00H
$SG71063 DB	'0', 00H
	ORG $+2
$SG71064 DB	'EV%s', 00H
	ORG $+3
$SG71070 DB	'MIN', 00H
$SG71071 DB	'MAX', 00H
$SG71072 DB	'SUM', 00H
$SG71073 DB	'AVG', 00H
$SG71078 DB	'SELECT %s(Val) FROM EVRes', 00H
	ORG $+2
$SG71082 DB	'EVRes', 00H
	ORG $+2
$SG71083 DB	'EVRes', 00H
	ORG $+2
$SG71087 DB	'D:\Travail\ABI\EVA\V4.0\CGI\Brunix-2016\ctrl_exprval.c', 00H
	ORG $+1
$SG71088 DB	'ctrl_output_exprval', 00H
$SG71091 DB	'_EVA_LINE', 00H
	ORG $+2
$SG71092 DB	'Yes', 00H
$SG71093 DB	'<br>', 00H
	ORG $+3
$SG71096 DB	'_EVA_COMMA', 00H
	ORG $+1
$SG71097 DB	'Yes', 00H
$SG71100 DB	'_EVA_SPACE', 00H
	ORG $+1
$SG71102 DB	'DISTINCT', 00H
	ORG $+3
$SG71104 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG71105 DB	'Yes', 00H
$SG71106 DB	' ', 00H
	ORG $+2
$SG71109 DB	'_EVA_', 00H
	ORG $+2
$SG71112 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG71114 DB	'Unique', 00H
	ORG $+1
$SG71115 DB	'<br>', 00H
	ORG $+3
$SG71122 DB	'D:\Travail\ABI\EVA\V4.0\CGI\Brunix-2016\ctrl_exprval.c', 00H
	ORG $+1
$SG71123 DB	'ctrl_output_exprval', 00H
$SG71127 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG71131 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG71137 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG71143 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG71146 DB	'</table>', 00H
	ORG $+3
$SG71150 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG71152 DB	'D:\Travail\ABI\EVA\V4.0\CGI\Brunix-2016\ctrl_exprval.c', 00H
	ORG $+1
$SG71153 DB	'ctrl_output_exprval', 00H
$SG71159 DB	' ', 00H
	ORG $+2
$SG71161 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG71165 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG71166 DB	'D:\Travail\ABI\EVA\V4.0\CGI\Brunix-2016\ctrl_exprval.c', 00H
	ORG $+1
$SG71167 DB	'ctrl_output_exprval', 00H
$SG71169 DB	'D:\Travail\ABI\EVA\V4.0\CGI\Brunix-2016\ctrl_exprval.c', 00H
	ORG $+1
$SG71170 DB	'ctrl_output_exprval', 00H
_DATA	ENDS
_TEXT	SEGMENT
_cntxt$ = 8
_ctrl$ = 12
_options$ = 16
_srcobj$ = -36
_srcfield$ = -56
_flt$ = -4512
_expr$ = -12
_type$ = -16
_html$ = -8
_sql_trace$ = -4
_opname$70850 = -4576
_idform$70851 = -4580
_uname$70877 = -4584
_txt$70901 = -4616
_srctyp$70922 = -4620
_i$70955 = -4644
_tot_char$70956 = -4628
_b_stripped$70957 = -4640
_fmt$70958 = -4624
_vmult$70961 = -4636
_lblunit$70964 = -4632
_separ$70967 = -4648
_qry$70971 = -4652
_b_end$70972 = -4656
_end$70981 = -4660
_i$71018 = -4664
_field$71027 = -4668
_valtyp$71038 = -4672
_meth$71041 = -4680
_m$71044 = -4676
_objtbl$71062 = -4696
_qry$71077 = -4760
__c$71155 = -4764
_ctrl_output_exprval PROC NEAR

; 496  : ){

	push	ebp
	mov	ebp, esp
	mov	eax, 4844				; 000012ecH
	call	__chkstk
	push	edi

; 497  : 	DynTable srcobj = {0};

	mov	DWORD PTR _srcobj$[ebp], 0
	xor	eax, eax
	mov	DWORD PTR _srcobj$[ebp+4], eax
	mov	DWORD PTR _srcobj$[ebp+8], eax
	mov	DWORD PTR _srcobj$[ebp+12], eax
	mov	DWORD PTR _srcobj$[ebp+16], eax

; 498  : 	DynTable srcfield = {0};

	mov	DWORD PTR _srcfield$[ebp], 0
	xor	ecx, ecx
	mov	DWORD PTR _srcfield$[ebp+4], ecx
	mov	DWORD PTR _srcfield$[ebp+8], ecx
	mov	DWORD PTR _srcfield$[ebp+12], ecx
	mov	DWORD PTR _srcfield$[ebp+16], ecx

; 499  : 	QryBuild flt =  {{0}};

	mov	DWORD PTR _flt$[ebp], 0
	xor	edx, edx
	mov	DWORD PTR _flt$[ebp+4], edx
	mov	DWORD PTR _flt$[ebp+8], edx
	mov	DWORD PTR _flt$[ebp+12], edx
	mov	DWORD PTR _flt$[ebp+16], edx
	mov	ecx, 1109				; 00000455H
	xor	eax, eax
	lea	edi, DWORD PTR _flt$[ebp+20]
	rep stosd

; 500  : 	DynBuffer *expr = NULL;

	mov	DWORD PTR _expr$[ebp], 0

; 501  : 	char *type = CTRL_ATTR_VAL(TYPE);

	cmp	DWORD PTR _ctrl$[ebp], 0
	je	SHORT $L71335
	push	0
	push	-1
	push	OFFSET FLAT:$SG70840
	mov	eax, DWORD PTR _ctrl$[ebp]
	add	eax, 44					; 0000002cH
	push	eax
	call	_dyntab_field_val
	add	esp, 16					; 00000010H
	mov	DWORD PTR -4768+[ebp], eax
	jmp	SHORT $L71336
$L71335:
	mov	DWORD PTR -4768+[ebp], OFFSET FLAT:$SG70841
$L71336:
	mov	ecx, DWORD PTR -4768+[ebp]
	mov	DWORD PTR _type$[ebp], ecx

; 502  : 	DynBuffer **html = cntxt->form->html;

	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	eax, DWORD PTR [edx+80]
	mov	ecx, DWORD PTR [eax+232]
	mov	DWORD PTR _html$[ebp], ecx

; 503  : 	int sql_trace = cntxt->sql_trace;

	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	eax, DWORD PTR [edx+29852]
	mov	DWORD PTR _sql_trace$[ebp], eax

; 504  : 
; 505  : 	/* Handle debug mode */
; 506  : 	if(*CTRL_ATTR_VAL(DEBUG_SQL_EXPR) == '1') cntxt->sql_trace = DEBUG_SQL_RES;

	cmp	DWORD PTR _ctrl$[ebp], 0
	je	SHORT $L71337
	push	0
	push	-1
	push	OFFSET FLAT:$SG70845
	mov	ecx, DWORD PTR _ctrl$[ebp]
	add	ecx, 44					; 0000002cH
	push	ecx
	call	_dyntab_field_val
	add	esp, 16					; 00000010H
	mov	DWORD PTR -4772+[ebp], eax
	jmp	SHORT $L71338
$L71337:
	mov	DWORD PTR -4772+[ebp], OFFSET FLAT:$SG70846
$L71338:
	mov	edx, DWORD PTR -4772+[ebp]
	movsx	eax, BYTE PTR [edx]
	cmp	eax, 49					; 00000031H
	jne	SHORT $L70844
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29852], 2
$L70844:

; 507  : 
; 508  : 	/* Add control value depending on value type */
; 509  : 	if(!strcmp("_EVA_USERNAME", type))

	mov	edx, DWORD PTR _type$[ebp]
	push	edx
	push	OFFSET FLAT:$SG70848
	call	_strcmp
	add	esp, 8
	test	eax, eax
	jne	$L70847

; 511  : 		if(cntxt->b_identified)

	mov	eax, DWORD PTR _cntxt$[ebp]
	cmp	DWORD PTR [eax+29400], 0
	je	$L70849

; 513  : 			char opname[64];
; 514  : 			unsigned long idform;
; 515  : 			DYNTAB_FIELD(&srcobj, &cntxt->user_data, FORMSTAMP);

	lea	ecx, DWORD PTR _srcobj$[ebp]
	push	ecx
	call	_dyntab_free
	add	esp, 4
	push	0
	push	-1
	push	OFFSET FLAT:$SG70854
	mov	edx, DWORD PTR _cntxt$[ebp]
	add	edx, 29428				; 000072f4H
	push	edx
	push	0
	lea	eax, DWORD PTR _srcobj$[ebp]
	push	eax
	call	_dyntab_filter_field
	add	esp, 24					; 00000018H
	test	eax, eax
	je	SHORT $L70853
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29872], OFFSET FLAT:$SG70856
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 515		; 00000203H
	jmp	$eva_err$70857
$L70853:

; 516  : 			if(dyntab_group(&srcobj, "NMIN")) RETURN_ERR_MEMORY;

	push	OFFSET FLAT:$SG70859
	lea	eax, DWORD PTR _srcobj$[ebp]
	push	eax
	call	_dyntab_group
	add	esp, 8
	test	eax, eax
	je	SHORT $L70858
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29872], OFFSET FLAT:$SG70861
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 516		; 00000204H
	jmp	$eva_err$70857
$L70858:

; 517  : 			idform = DYNTAB_TOUL(&srcobj);

	push	10					; 0000000aH
	push	0
	push	0
	push	0
	lea	eax, DWORD PTR _srcobj$[ebp]
	push	eax
	call	_dyntab_val
	add	esp, 12					; 0000000cH
	push	eax
	call	_strtoul
	add	esp, 12					; 0000000cH
	mov	DWORD PTR _idform$70851[ebp], eax

; 518  : 			if(qry_obj_label(cntxt, &expr, NULL, NULL, &expr, &expr, NULL, NULL, NULL, idform, &cntxt->user_data, 0)) CLEAR_ERROR;

	push	0
	mov	ecx, DWORD PTR _cntxt$[ebp]
	add	ecx, 29428				; 000072f4H
	push	ecx
	mov	edx, DWORD PTR _idform$70851[ebp]
	push	edx
	push	0
	push	0
	push	0
	lea	eax, DWORD PTR _expr$[ebp]
	push	eax
	lea	ecx, DWORD PTR _expr$[ebp]
	push	ecx
	push	0
	push	0
	lea	edx, DWORD PTR _expr$[ebp]
	push	edx
	mov	eax, DWORD PTR _cntxt$[ebp]
	push	eax
	call	_qry_obj_label
	add	esp, 48					; 00000030H
	test	eax, eax
	je	SHORT $L70868
	push	518					; 00000206H
	push	OFFSET FLAT:$SG70869
	push	OFFSET FLAT:$SG70870
	mov	ecx, DWORD PTR _cntxt$[ebp]
	push	ecx
	call	_err_clear
	add	esp, 16					; 00000010H
$L70868:

; 519  : 			build_open_btn_name(cntxt, opname, idform, cntxt->user_data.cell->IdObj, 0, 0);

	push	0
	push	0
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	eax, DWORD PTR [edx+29444]
	mov	ecx, DWORD PTR [eax+20]
	push	ecx
	mov	edx, DWORD PTR _idform$70851[ebp]
	push	edx
	lea	eax, DWORD PTR _opname$70850[ebp]
	push	eax
	mov	ecx, DWORD PTR _cntxt$[ebp]
	push	ecx
	call	_build_open_btn_name
	add	esp, 24					; 00000018H

; 520  : 			if(put_html_button_sz(cntxt, opname, DYNTAB_FIELD_VAL(&cntxt->user_data, USERNAME),
; 521  : 									NULL, NULL, expr->data, NULL, 0, 0, 0, 32)) STACK_ERROR;

	push	32					; 00000020H
	push	0
	push	0
	push	0
	push	0
	mov	edx, DWORD PTR _expr$[ebp]
	add	edx, 8
	push	edx
	push	0
	push	0
	push	0
	push	-1
	push	OFFSET FLAT:$SG70875
	mov	eax, DWORD PTR _cntxt$[ebp]
	add	eax, 29428				; 000072f4H
	push	eax
	call	_dyntab_field_val
	add	esp, 16					; 00000010H
	push	eax
	lea	ecx, DWORD PTR _opname$70850[ebp]
	push	ecx
	mov	edx, DWORD PTR _cntxt$[ebp]
	push	edx
	call	_put_html_button_sz
	add	esp, 44					; 0000002cH
	test	eax, eax
	je	SHORT $L70874
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 521		; 00000209H
	jmp	$eva_err$70857
$L70874:

; 523  : 		else

	jmp	$L70883
$L70849:

; 525  : 			char *uname = CTRL_ATTR_VAL(NOT_IDENTIFIED);

	cmp	DWORD PTR _ctrl$[ebp], 0
	je	SHORT $L71339
	push	0
	push	-1
	push	OFFSET FLAT:$SG70878
	mov	ecx, DWORD PTR _ctrl$[ebp]
	add	ecx, 44					; 0000002cH
	push	ecx
	call	_dyntab_field_val
	add	esp, 16					; 00000010H
	mov	DWORD PTR -4776+[ebp], eax
	jmp	SHORT $L71340
$L71339:
	mov	DWORD PTR -4776+[ebp], OFFSET FLAT:$SG70879
$L71340:
	mov	edx, DWORD PTR -4776+[ebp]
	mov	DWORD PTR _uname$70877[ebp], edx

; 526  : 			if(!*uname) uname = "Utilisateur non identifié";

	mov	eax, DWORD PTR _uname$70877[ebp]
	movsx	ecx, BYTE PTR [eax]
	test	ecx, ecx
	jne	SHORT $L70880
	mov	DWORD PTR _uname$70877[ebp], OFFSET FLAT:$SG70881
$L70880:

; 527  : 			DYNBUF_ADD(html, uname, 0, NO_CONV);

	push	0
	push	0
	push	0
	mov	edx, DWORD PTR _uname$70877[ebp]
	push	edx
	mov	eax, DWORD PTR _html$[ebp]
	push	eax
	call	_dynbuf_add
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L70883
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29872], OFFSET FLAT:$SG70885
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 527		; 0000020fH
	jmp	$eva_err$70857
$L70883:

; 529  : 		if(options == 2) DYNTAB_ADD_BUF(&ctrl->val, 0, 1, expr);

	cmp	DWORD PTR _options$[ebp], 2
	jne	$L70895
	cmp	DWORD PTR _expr$[ebp], 0
	je	SHORT $L70887
	mov	eax, DWORD PTR _expr$[ebp]
	cmp	DWORD PTR [eax+4], 0
	je	SHORT $L70887
	push	0
	push	0
	mov	ecx, DWORD PTR _expr$[ebp]
	mov	edx, DWORD PTR [ecx+4]
	push	edx
	mov	eax, DWORD PTR _expr$[ebp]
	add	eax, 8
	push	eax
	push	1
	push	0
	mov	ecx, DWORD PTR _ctrl$[ebp]
	add	ecx, 64					; 00000040H
	push	ecx
	call	_dyntab_add
	add	esp, 28					; 0000001cH
	test	eax, eax
	je	SHORT $L70889
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29872], OFFSET FLAT:$SG70891
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 529		; 00000211H
	jmp	$eva_err$70857
$L70889:
	jmp	SHORT $L70895
$L70887:
	push	0
	push	0
	push	0
	push	0
	push	1
	push	0
	mov	ecx, DWORD PTR _ctrl$[ebp]
	add	ecx, 64					; 00000040H
	push	ecx
	call	_dyntab_add
	add	esp, 28					; 0000001cH
	test	eax, eax
	je	SHORT $L70895
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29872], OFFSET FLAT:$SG70897
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 529		; 00000211H
	jmp	$eva_err$70857
$L70895:

; 531  : 	else if(!strcmp("_EVA_SYSTEMTIME", type))

	jmp	$L71119
$L70847:
	mov	ecx, DWORD PTR _type$[ebp]
	push	ecx
	push	OFFSET FLAT:$SG70900
	call	_strcmp
	add	esp, 8
	test	eax, eax
	jne	$L70899

; 533  : 		char txt[32];
; 534  : 		datetxt_to_format(cntxt, txt, cntxt->timestamp, NULL);

	push	0
	mov	edx, DWORD PTR _cntxt$[ebp]
	add	edx, 29704				; 00007408H
	push	edx
	lea	eax, DWORD PTR _txt$70901[ebp]
	push	eax
	mov	ecx, DWORD PTR _cntxt$[ebp]
	push	ecx
	call	_datetxt_to_format
	add	esp, 16					; 00000010H

; 535  : 		DYNBUF_ADD(html, txt, 0, NO_CONV);

	push	0
	push	0
	push	0
	lea	edx, DWORD PTR _txt$70901[ebp]
	push	edx
	mov	eax, DWORD PTR _html$[ebp]
	push	eax
	call	_dynbuf_add
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L70904
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29872], OFFSET FLAT:$SG70906
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 535		; 00000217H
	jmp	$eva_err$70857
$L70904:

; 536  : 		if(options == 2) DYNTAB_ADD_BUF(&ctrl->val, 0, 1, expr);

	cmp	DWORD PTR _options$[ebp], 2
	jne	$L70916
	cmp	DWORD PTR _expr$[ebp], 0
	je	SHORT $L70908
	mov	eax, DWORD PTR _expr$[ebp]
	cmp	DWORD PTR [eax+4], 0
	je	SHORT $L70908
	push	0
	push	0
	mov	ecx, DWORD PTR _expr$[ebp]
	mov	edx, DWORD PTR [ecx+4]
	push	edx
	mov	eax, DWORD PTR _expr$[ebp]
	add	eax, 8
	push	eax
	push	1
	push	0
	mov	ecx, DWORD PTR _ctrl$[ebp]
	add	ecx, 64					; 00000040H
	push	ecx
	call	_dyntab_add
	add	esp, 28					; 0000001cH
	test	eax, eax
	je	SHORT $L70910
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29872], OFFSET FLAT:$SG70912
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 536		; 00000218H
	jmp	$eva_err$70857
$L70910:
	jmp	SHORT $L70916
$L70908:
	push	0
	push	0
	push	0
	push	0
	push	1
	push	0
	mov	ecx, DWORD PTR _ctrl$[ebp]
	add	ecx, 64					; 00000040H
	push	ecx
	call	_dyntab_add
	add	esp, 28					; 0000001cH
	test	eax, eax
	je	SHORT $L70916
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29872], OFFSET FLAT:$SG70918
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 536		; 00000218H
	jmp	$eva_err$70857
$L70916:

; 538  : 	else if(!strcmp("_EVA_CTRLVAL", type))

	jmp	$L71119
$L70899:
	mov	ecx, DWORD PTR _type$[ebp]
	push	ecx
	push	OFFSET FLAT:$SG70921
	call	_strcmp
	add	esp, 8
	test	eax, eax
	jne	$L70920

; 540  : 		/* List of controls : get source objects */
; 541  : 		char *srctyp = CTRL_ATTR_VAL(SRC_TYPE);

	cmp	DWORD PTR _ctrl$[ebp], 0
	je	SHORT $L71341
	push	0
	push	-1
	push	OFFSET FLAT:$SG70923
	mov	edx, DWORD PTR _ctrl$[ebp]
	add	edx, 44					; 0000002cH
	push	edx
	call	_dyntab_field_val
	add	esp, 16					; 00000010H
	mov	DWORD PTR -4780+[ebp], eax
	jmp	SHORT $L71342
$L71341:
	mov	DWORD PTR -4780+[ebp], OFFSET FLAT:$SG70924
$L71342:
	mov	eax, DWORD PTR -4780+[ebp]
	mov	DWORD PTR _srctyp$70922[ebp], eax

; 542  : 		if(!strcmp(srctyp, "_EVA_SRC_CTRL")) CTRL_ATTR(srcfield, SRC_CTRL)

	push	OFFSET FLAT:$SG70926
	mov	ecx, DWORD PTR _srctyp$70922[ebp]
	push	ecx
	call	_strcmp
	add	esp, 8
	test	eax, eax
	jne	SHORT $L70925
	lea	edx, DWORD PTR _srcfield$[ebp]
	push	edx
	call	_dyntab_free
	add	esp, 4
	push	0
	push	-1
	push	OFFSET FLAT:$SG70929
	mov	eax, DWORD PTR _ctrl$[ebp]
	add	eax, 44					; 0000002cH
	push	eax
	push	0
	lea	ecx, DWORD PTR _srcfield$[ebp]
	push	ecx
	call	_dyntab_filter_field
	add	esp, 24					; 00000018H
	test	eax, eax
	je	SHORT $L70928
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29872], OFFSET FLAT:$SG70931
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 542		; 0000021eH
	jmp	$eva_err$70857
$L70928:

; 543  : 		else

	jmp	SHORT $L70935
$L70925:

; 545  : 			srctyp = "_EVA_FILTER";

	mov	DWORD PTR _srctyp$70922[ebp], OFFSET FLAT:$SG70933

; 546  : 			CTRL_ATTR(srcfield, FILTERS);

	lea	ecx, DWORD PTR _srcfield$[ebp]
	push	ecx
	call	_dyntab_free
	add	esp, 4
	push	0
	push	-1
	push	OFFSET FLAT:$SG70936
	mov	edx, DWORD PTR _ctrl$[ebp]
	add	edx, 44					; 0000002cH
	push	edx
	push	0
	lea	eax, DWORD PTR _srcfield$[ebp]
	push	eax
	call	_dyntab_filter_field
	add	esp, 24					; 00000018H
	test	eax, eax
	je	SHORT $L70935
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29872], OFFSET FLAT:$SG70938
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 546		; 00000222H
	jmp	$eva_err$70857
$L70935:

; 548  : 		if(!*srctyp || (!strcmp(srctyp, "_EVA_FILTER") && !srcfield.nbrows))

	mov	eax, DWORD PTR _srctyp$70922[ebp]
	movsx	ecx, BYTE PTR [eax]
	test	ecx, ecx
	je	SHORT $L70940
	push	OFFSET FLAT:$SG70941
	mov	edx, DWORD PTR _srctyp$70922[ebp]
	push	edx
	call	_strcmp
	add	esp, 8
	test	eax, eax
	jne	SHORT $L70939
	cmp	DWORD PTR _srcfield$[ebp], 0
	jne	SHORT $L70939
$L70940:

; 549  : 			DYNTAB_ADD_CELL(&srcobj, 0, 0, &cntxt->form->id_obj, 0, 0)

	push	1
	push	0
	push	0
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	ecx, DWORD PTR [eax+80]
	add	ecx, 32					; 00000020H
	push	ecx
	call	_dyntab_cell
	add	esp, 12					; 0000000cH
	push	eax
	push	0
	push	0
	lea	edx, DWORD PTR _srcobj$[ebp]
	push	edx
	call	_dyntab_copy
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L70942
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29872], OFFSET FLAT:$SG70944
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 549		; 00000225H
	jmp	$eva_err$70857
$L70942:

; 550  : 		else

	jmp	SHORT $L70947
$L70939:

; 551  : 			if(form_eval_valtype(cntxt, &srcobj, srctyp, &srcfield, NULL)) STACK_ERROR;

	push	0
	lea	edx, DWORD PTR _srcfield$[ebp]
	push	edx
	mov	eax, DWORD PTR _srctyp$70922[ebp]
	push	eax
	lea	ecx, DWORD PTR _srcobj$[ebp]
	push	ecx
	mov	edx, DWORD PTR _cntxt$[ebp]
	push	edx
	call	_form_eval_valtype
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L70947
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 551		; 00000227H
	jmp	$eva_err$70857
$L70947:

; 552  : 
; 553  : 		/* Read list of controls & output each matched object */
; 554  : 		CTRL_ATTR(srcfield, CTRLTREE);

	lea	ecx, DWORD PTR _srcfield$[ebp]
	push	ecx
	call	_dyntab_free
	add	esp, 4
	push	0
	push	-1
	push	OFFSET FLAT:$SG70950
	mov	edx, DWORD PTR _ctrl$[ebp]
	add	edx, 44					; 0000002cH
	push	edx
	push	0
	lea	eax, DWORD PTR _srcfield$[ebp]
	push	eax
	call	_dyntab_filter_field
	add	esp, 24					; 00000018H
	test	eax, eax
	je	SHORT $L70949
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29872], OFFSET FLAT:$SG70952
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 554		; 0000022aH
	jmp	$eva_err$70857
$L70949:

; 555  : 		if(subform_output(cntxt, ctrl, &srcobj, &srcfield, 0)) STACK_ERROR;

	push	0
	lea	eax, DWORD PTR _srcfield$[ebp]
	push	eax
	lea	ecx, DWORD PTR _srcobj$[ebp]
	push	ecx
	mov	edx, DWORD PTR _ctrl$[ebp]
	push	edx
	mov	eax, DWORD PTR _cntxt$[ebp]
	push	eax
	call	_subform_output
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L70953
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 555		; 0000022bH
	jmp	$eva_err$70857
$L70953:

; 557  : 	else

	jmp	$L71119
$L70920:

; 559  : 		/* Field / expression value : output result values */
; 560  : 		unsigned long i;
; 561  : 		size_t tot_char = 0;

	mov	DWORD PTR _tot_char$70956[ebp], 0

; 562  : 		int b_stripped;
; 563  : 		char *fmt = CTRL_ATTR_VAL(DISPLAYFORMAT);

	cmp	DWORD PTR _ctrl$[ebp], 0
	je	SHORT $L71343
	push	0
	push	-1
	push	OFFSET FLAT:$SG70959
	mov	edx, DWORD PTR _ctrl$[ebp]
	add	edx, 44					; 0000002cH
	push	edx
	call	_dyntab_field_val
	add	esp, 16					; 00000010H
	mov	DWORD PTR -4784+[ebp], eax
	jmp	SHORT $L71344
$L71343:
	mov	DWORD PTR -4784+[ebp], OFFSET FLAT:$SG70960
$L71344:
	mov	eax, DWORD PTR -4784+[ebp]
	mov	DWORD PTR _fmt$70958[ebp], eax

; 564  : 		char *vmult = CTRL_ATTR_VAL(MULTIPLE_HANDLER);

	cmp	DWORD PTR _ctrl$[ebp], 0
	je	SHORT $L71345
	push	0
	push	-1
	push	OFFSET FLAT:$SG70962
	mov	ecx, DWORD PTR _ctrl$[ebp]
	add	ecx, 44					; 0000002cH
	push	ecx
	call	_dyntab_field_val
	add	esp, 16					; 00000010H
	mov	DWORD PTR -4788+[ebp], eax
	jmp	SHORT $L71346
$L71345:
	mov	DWORD PTR -4788+[ebp], OFFSET FLAT:$SG70963
$L71346:
	mov	edx, DWORD PTR -4788+[ebp]
	mov	DWORD PTR _vmult$70961[ebp], edx

; 565  : 		DynTableCell *lblunit = CTRL_ATTR_CELL(LABELUNIT);

	cmp	DWORD PTR _ctrl$[ebp], 0
	je	SHORT $L71347
	push	0
	push	-1
	push	OFFSET FLAT:$SG70966
	mov	eax, DWORD PTR _ctrl$[ebp]
	add	eax, 44					; 0000002cH
	push	eax
	call	_dyntab_field_cell
	add	esp, 16					; 00000010H
	mov	DWORD PTR -4792+[ebp], eax
	jmp	SHORT $L71348
$L71347:
	mov	DWORD PTR -4792+[ebp], 0
$L71348:
	mov	ecx, DWORD PTR -4792+[ebp]
	mov	DWORD PTR _lblunit$70964[ebp], ecx

; 566  : 		char *separ = ", ";

	mov	DWORD PTR _separ$70967[ebp], OFFSET FLAT:$SG70968

; 567  : 
; 568  : 		/* Handle SQL query */
; 569  : 		if(!strcmp("_EVA_SQL_QUERY", type))

	mov	edx, DWORD PTR _type$[ebp]
	push	edx
	push	OFFSET FLAT:$SG70970
	call	_strcmp
	add	esp, 8
	test	eax, eax
	jne	$L70969

; 571  : 			char *qry = 0;

	mov	DWORD PTR _qry$70971[ebp], 0

; 572  : 			int b_end = 1;

	mov	DWORD PTR _b_end$70972[ebp], 1

; 573  : 
; 574  : 			/* Evaluate variables in SQL expression */
; 575  : 			if(qry_eval_sqlexpr_var(cntxt, &expr, CTRL_ATTR_VAL(SQL_SCRIPT), &ctrl->attr, NULL)) STACK_ERROR;

	cmp	DWORD PTR _ctrl$[ebp], 0
	je	SHORT $L71349
	push	0
	push	-1
	push	OFFSET FLAT:$SG70975
	mov	eax, DWORD PTR _ctrl$[ebp]
	add	eax, 44					; 0000002cH
	push	eax
	call	_dyntab_field_val
	add	esp, 16					; 00000010H
	mov	DWORD PTR -4796+[ebp], eax
	jmp	SHORT $L71350
$L71349:
	mov	DWORD PTR -4796+[ebp], OFFSET FLAT:$SG70976
$L71350:
	push	0
	mov	ecx, DWORD PTR _ctrl$[ebp]
	add	ecx, 44					; 0000002cH
	push	ecx
	mov	edx, DWORD PTR -4796+[ebp]
	push	edx
	lea	eax, DWORD PTR _expr$[ebp]
	push	eax
	mov	ecx, DWORD PTR _cntxt$[ebp]
	push	ecx
	call	_qry_eval_sqlexpr_var
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L70974
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 575		; 0000023fH
	jmp	$eva_err$70857
$L70974:

; 576  : 			if(expr)

	cmp	DWORD PTR _expr$[ebp], 0
	je	SHORT $L70977

; 578  : 				b_end = 0;

	mov	DWORD PTR _b_end$70972[ebp], 0

; 579  : 				qry = expr->data;

	mov	eax, DWORD PTR _expr$[ebp]
	add	eax, 8
	mov	DWORD PTR _qry$70971[ebp], eax
$L70977:

; 581  : 
; 582  : 			/* Process queries separated with ";\n" */
; 583  : 			while(!b_end)

	cmp	DWORD PTR _b_end$70972[ebp], 0
	jne	$L70980

; 585  : 				char *end = strstr(qry, ";\n");

	push	OFFSET FLAT:$SG70982
	mov	ecx, DWORD PTR _qry$70971[ebp]
	push	ecx
	call	_strstr
	add	esp, 8
	mov	DWORD PTR _end$70981[ebp], eax

; 586  : 				if(!end) { end = expr->data + expr->cnt - 1; b_end = 1; }

	cmp	DWORD PTR _end$70981[ebp], 0
	jne	SHORT $L70983
	mov	edx, DWORD PTR _expr$[ebp]
	mov	eax, DWORD PTR [edx+4]
	mov	ecx, DWORD PTR _expr$[ebp]
	lea	edx, DWORD PTR [ecx+eax+7]
	mov	DWORD PTR _end$70981[ebp], edx
	mov	DWORD PTR _b_end$70972[ebp], 1
$L70983:

; 587  : 				if(!b_end) *end = 0;

	cmp	DWORD PTR _b_end$70972[ebp], 0
	jne	SHORT $L70984
	mov	eax, DWORD PTR _end$70981[ebp]
	mov	BYTE PTR [eax], 0
$L70984:

; 588  : 				if(sql_exec_query(cntxt, qry)) CLEAR_ERROR_RETURN;

	mov	ecx, DWORD PTR _qry$70971[ebp]
	push	ecx
	mov	edx, DWORD PTR _cntxt$[ebp]
	push	edx
	call	_sql_exec_query
	add	esp, 8
	test	eax, eax
	je	SHORT $L70985
	push	588					; 0000024cH
	push	OFFSET FLAT:$SG70986
	push	OFFSET FLAT:$SG70987
	mov	eax, DWORD PTR _cntxt$[ebp]
	push	eax
	call	_err_clear
	add	esp, 16					; 00000010H
	jmp	$eva_noerr$70988
$L70985:

; 589  : 				qry = end + 2;

	mov	ecx, DWORD PTR _end$70981[ebp]
	add	ecx, 2
	mov	DWORD PTR _qry$70971[ebp], ecx

; 590  : 			}

	jmp	$L70977
$L70980:

; 591  : 			if(sql_get_table(cntxt, &ctrl->val, 4)) CLEAR_ERROR;

	push	4
	mov	edx, DWORD PTR _ctrl$[ebp]
	add	edx, 64					; 00000040H
	push	edx
	mov	eax, DWORD PTR _cntxt$[ebp]
	push	eax
	call	_sql_get_table
	add	esp, 12					; 0000000cH
	test	eax, eax
	je	SHORT $L70989
	push	591					; 0000024fH
	push	OFFSET FLAT:$SG70990
	push	OFFSET FLAT:$SG70991
	mov	ecx, DWORD PTR _cntxt$[ebp]
	push	ecx
	call	_err_clear
	add	esp, 16					; 00000010H
$L70989:

; 593  : 		/* Handle advanced SQL expression */
; 594  : 		else if(!strcmp("_EVA_SQLEXPR", type))

	jmp	$L71086
$L70969:
	mov	edx, DWORD PTR _type$[ebp]
	push	edx
	push	OFFSET FLAT:$SG70994
	call	_strcmp
	add	esp, 8
	test	eax, eax
	jne	$L70993

; 596  : 			DYNBUF_ADD3(&expr, "-- SQL value [", ctrl->LABEL, 0, TO_SYSCMD, "]\n");

	push	2
	push	OFFSET FLAT:$SG70996
	push	1
	push	OFFSET FLAT:_syscmd_string
	push	0
	mov	eax, DWORD PTR _ctrl$[ebp]
	mov	ecx, DWORD PTR [eax+284]
	push	ecx
	push	14					; 0000000eH
	push	OFFSET FLAT:$SG70997
	lea	edx, DWORD PTR _expr$[ebp]
	push	edx
	call	_dynbuf_add3
	add	esp, 36					; 00000024H
	test	eax, eax
	je	SHORT $L70995
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29872], OFFSET FLAT:$SG70999
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 596		; 00000254H
	jmp	$eva_err$70857
$L70995:

; 597  : 			if(qry_build_joins(cntxt, &expr,
; 598  : 								CTRL_ATTR_VAL(SELECT_CLAUSE),
; 599  : 								CTRL_ATTR_VAL(FROM_CLAUSE),
; 600  : 								&ctrl->attr,
; 601  : 								CTRL_ATTR_VAL(WHERE_CLAUSE),
; 602  : 								CTRL_ATTR_VAL(OTHER_CLAUSE))) CLEAR_ERROR;

	cmp	DWORD PTR _ctrl$[ebp], 0
	je	SHORT $L71351
	push	0
	push	-1
	push	OFFSET FLAT:$SG71001
	mov	edx, DWORD PTR _ctrl$[ebp]
	add	edx, 44					; 0000002cH
	push	edx
	call	_dyntab_field_val
	add	esp, 16					; 00000010H
	mov	DWORD PTR -4800+[ebp], eax
	jmp	SHORT $L71352
$L71351:
	mov	DWORD PTR -4800+[ebp], OFFSET FLAT:$SG71002
$L71352:
	cmp	DWORD PTR _ctrl$[ebp], 0
	je	SHORT $L71353
	push	0
	push	-1
	push	OFFSET FLAT:$SG71003
	mov	eax, DWORD PTR _ctrl$[ebp]
	add	eax, 44					; 0000002cH
	push	eax
	call	_dyntab_field_val
	add	esp, 16					; 00000010H
	mov	DWORD PTR -4804+[ebp], eax
	jmp	SHORT $L71354
$L71353:
	mov	DWORD PTR -4804+[ebp], OFFSET FLAT:$SG71004
$L71354:
	cmp	DWORD PTR _ctrl$[ebp], 0
	je	SHORT $L71355
	push	0
	push	-1
	push	OFFSET FLAT:$SG71005
	mov	ecx, DWORD PTR _ctrl$[ebp]
	add	ecx, 44					; 0000002cH
	push	ecx
	call	_dyntab_field_val
	add	esp, 16					; 00000010H
	mov	DWORD PTR -4808+[ebp], eax
	jmp	SHORT $L71356
$L71355:
	mov	DWORD PTR -4808+[ebp], OFFSET FLAT:$SG71006
$L71356:
	cmp	DWORD PTR _ctrl$[ebp], 0
	je	SHORT $L71357
	push	0
	push	-1
	push	OFFSET FLAT:$SG71007
	mov	edx, DWORD PTR _ctrl$[ebp]
	add	edx, 44					; 0000002cH
	push	edx
	call	_dyntab_field_val
	add	esp, 16					; 00000010H
	mov	DWORD PTR -4812+[ebp], eax
	jmp	SHORT $L71358
$L71357:
	mov	DWORD PTR -4812+[ebp], OFFSET FLAT:$SG71008
$L71358:
	mov	eax, DWORD PTR -4800+[ebp]
	push	eax
	mov	ecx, DWORD PTR -4804+[ebp]
	push	ecx
	mov	edx, DWORD PTR _ctrl$[ebp]
	add	edx, 44					; 0000002cH
	push	edx
	mov	eax, DWORD PTR -4808+[ebp]
	push	eax
	mov	ecx, DWORD PTR -4812+[ebp]
	push	ecx
	lea	edx, DWORD PTR _expr$[ebp]
	push	edx
	mov	eax, DWORD PTR _cntxt$[ebp]
	push	eax
	call	_qry_build_joins
	add	esp, 28					; 0000001cH
	test	eax, eax
	je	SHORT $L71000
	push	602					; 0000025aH
	push	OFFSET FLAT:$SG71009
	push	OFFSET FLAT:$SG71010
	mov	ecx, DWORD PTR _cntxt$[ebp]
	push	ecx
	call	_err_clear
	add	esp, 16					; 00000010H
$L71000:

; 603  : 			if(expr && (
; 604  : 				sql_exec_query(cntxt, expr->data) || sql_get_table(cntxt, &ctrl->val, 4))) CLEAR_ERROR;

	cmp	DWORD PTR _expr$[ebp], 0
	je	SHORT $L71011
	mov	edx, DWORD PTR _expr$[ebp]
	add	edx, 8
	push	edx
	mov	eax, DWORD PTR _cntxt$[ebp]
	push	eax
	call	_sql_exec_query
	add	esp, 8
	test	eax, eax
	jne	SHORT $L71012
	push	4
	mov	ecx, DWORD PTR _ctrl$[ebp]
	add	ecx, 64					; 00000040H
	push	ecx
	mov	edx, DWORD PTR _cntxt$[ebp]
	push	edx
	call	_sql_get_table
	add	esp, 12					; 0000000cH
	test	eax, eax
	je	SHORT $L71011
$L71012:
	push	604					; 0000025cH
	push	OFFSET FLAT:$SG71013
	push	OFFSET FLAT:$SG71014
	mov	eax, DWORD PTR _cntxt$[ebp]
	push	eax
	call	_err_clear
	add	esp, 16					; 00000010H
$L71011:

; 606  : 		/* Handle control values */
; 607  : 		else if(!strcmp("_EVA_CTRL_VAL", type))

	jmp	$L71086
$L70993:
	mov	ecx, DWORD PTR _type$[ebp]
	push	ecx
	push	OFFSET FLAT:$SG71017
	call	_strcmp
	add	esp, 8
	test	eax, eax
	jne	$L71016

; 609  : 			unsigned long i;
; 610  : 			CTRL_ATTR(srcobj, CTRLTREE);

	lea	edx, DWORD PTR _srcobj$[ebp]
	push	edx
	call	_dyntab_free
	add	esp, 4
	push	0
	push	-1
	push	OFFSET FLAT:$SG71021
	mov	eax, DWORD PTR _ctrl$[ebp]
	add	eax, 44					; 0000002cH
	push	eax
	push	0
	lea	ecx, DWORD PTR _srcobj$[ebp]
	push	ecx
	call	_dyntab_filter_field
	add	esp, 24					; 00000018H
	test	eax, eax
	je	SHORT $L71020
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29872], OFFSET FLAT:$SG71023
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 610		; 00000262H
	jmp	$eva_err$70857
$L71020:

; 611  : 			for(i = 0; i < srcobj.nbrows; i++)

	mov	DWORD PTR _i$71018[ebp], 0
	jmp	SHORT $L71024
$L71025:
	mov	ecx, DWORD PTR _i$71018[ebp]
	add	ecx, 1
	mov	DWORD PTR _i$71018[ebp], ecx
$L71024:
	mov	edx, DWORD PTR _i$71018[ebp]
	cmp	edx, DWORD PTR _srcobj$[ebp]
	jae	$L71026

; 613  : 				char *field;
; 614  : 				if(qry_cache_idobj_field(cntxt, &srcfield, DYNTAB_TOULRC(&srcobj, i, 0), NULL, 2) ||
; 615  : 					ctrl_read_baseobj(cntxt, &srcfield)) STACK_ERROR;

	push	2
	push	0
	push	10					; 0000000aH
	push	0
	push	0
	mov	eax, DWORD PTR _i$71018[ebp]
	push	eax
	lea	ecx, DWORD PTR _srcobj$[ebp]
	push	ecx
	call	_dyntab_val
	add	esp, 12					; 0000000cH
	push	eax
	call	_strtoul
	add	esp, 12					; 0000000cH
	push	eax
	lea	edx, DWORD PTR _srcfield$[ebp]
	push	edx
	mov	eax, DWORD PTR _cntxt$[ebp]
	push	eax
	call	_qry_cache_idobj_field
	add	esp, 20					; 00000014H
	test	eax, eax
	jne	SHORT $L71031
	lea	ecx, DWORD PTR _srcfield$[ebp]
	push	ecx
	mov	edx, DWORD PTR _cntxt$[ebp]
	push	edx
	call	_ctrl_read_baseobj
	add	esp, 8
	test	eax, eax
	je	SHORT $L71030
$L71031:
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 615		; 00000267H
	jmp	$eva_err$70857
$L71030:

; 616  : 				field = dyntab_field_val(&srcfield, "_EVA_FIELD", ~0UL, 0);

	push	0
	push	-1
	push	OFFSET FLAT:$SG71032
	lea	ecx, DWORD PTR _srcfield$[ebp]
	push	ecx
	call	_dyntab_field_val
	add	esp, 16					; 00000010H
	mov	DWORD PTR _field$71027[ebp], eax

; 617  : 				dyntab_free(&srcfield);

	lea	edx, DWORD PTR _srcfield$[ebp]
	push	edx
	call	_dyntab_free
	add	esp, 4

; 618  : 				if(*field && form_get_field_values(cntxt, &srcfield, field, 0, 0)) STACK_ERROR;

	mov	eax, DWORD PTR _field$71027[ebp]
	movsx	ecx, BYTE PTR [eax]
	test	ecx, ecx
	je	SHORT $L71033
	push	0
	push	0
	mov	edx, DWORD PTR _field$71027[ebp]
	push	edx
	lea	eax, DWORD PTR _srcfield$[ebp]
	push	eax
	mov	ecx, DWORD PTR _cntxt$[ebp]
	push	ecx
	call	_form_get_field_values
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L71033
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 618		; 0000026aH
	jmp	$eva_err$70857
$L71033:

; 619  : 				if(dyntab_from_tab(&ctrl->val, ctrl->val.nbrows, 0, &srcfield, 0, 0, srcfield.nbrows, 1, 33)) RETURN_ERR_MEMORY;

	push	33					; 00000021H
	push	1
	mov	eax, DWORD PTR _srcfield$[ebp]
	push	eax
	push	0
	push	0
	lea	ecx, DWORD PTR _srcfield$[ebp]
	push	ecx
	push	0
	mov	edx, DWORD PTR _ctrl$[ebp]
	mov	eax, DWORD PTR [edx+64]
	push	eax
	mov	ecx, DWORD PTR _ctrl$[ebp]
	add	ecx, 64					; 00000040H
	push	ecx
	call	_dyntab_from_tab
	add	esp, 36					; 00000024H
	test	eax, eax
	je	SHORT $L71034
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29872], OFFSET FLAT:$SG71036
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 619		; 0000026bH
	jmp	$eva_err$70857
$L71034:

; 620  : 			}

	jmp	$L71025
$L71026:

; 622  : 		/* Handle SQL/relational expression */
; 623  : 		else

	jmp	$L71086
$L71016:

; 625  : 			char *valtyp = CTRL_ATTR_VAL(SRC_OBJ);

	cmp	DWORD PTR _ctrl$[ebp], 0
	je	SHORT $L71359
	push	0
	push	-1
	push	OFFSET FLAT:$SG71039
	mov	ecx, DWORD PTR _ctrl$[ebp]
	add	ecx, 44					; 0000002cH
	push	ecx
	call	_dyntab_field_val
	add	esp, 16					; 00000010H
	mov	DWORD PTR -4816+[ebp], eax
	jmp	SHORT $L71360
$L71359:
	mov	DWORD PTR -4816+[ebp], OFFSET FLAT:$SG71040
$L71360:
	mov	edx, DWORD PTR -4816+[ebp]
	mov	DWORD PTR _valtyp$71038[ebp], edx

; 626  : 			char *meth = CTRL_ATTR_VAL(EVAL_METHOD);

	cmp	DWORD PTR _ctrl$[ebp], 0
	je	SHORT $L71361
	push	0
	push	-1
	push	OFFSET FLAT:$SG71042
	mov	eax, DWORD PTR _ctrl$[ebp]
	add	eax, 44					; 0000002cH
	push	eax
	call	_dyntab_field_val
	add	esp, 16					; 00000010H
	mov	DWORD PTR -4820+[ebp], eax
	jmp	SHORT $L71362
$L71361:
	mov	DWORD PTR -4820+[ebp], OFFSET FLAT:$SG71043
$L71362:
	mov	ecx, DWORD PTR -4820+[ebp]
	mov	DWORD PTR _meth$71041[ebp], ecx

; 627  : 			char *m = !strncmp("_EVA_", vmult, 5) ? vmult + 5 : "";

	push	5
	mov	edx, DWORD PTR _vmult$70961[ebp]
	push	edx
	push	OFFSET FLAT:$SG71045
	call	_strncmp
	add	esp, 12					; 0000000cH
	test	eax, eax
	jne	SHORT $L71363
	mov	eax, DWORD PTR _vmult$70961[ebp]
	add	eax, 5
	mov	DWORD PTR -4824+[ebp], eax
	jmp	SHORT $L71364
$L71363:
	mov	DWORD PTR -4824+[ebp], OFFSET FLAT:$SG71046
$L71364:
	mov	ecx, DWORD PTR -4824+[ebp]
	mov	DWORD PTR _m$71044[ebp], ecx

; 628  : 			if(!*valtyp) valtyp = "_EVA_CURRENTOBJ";

	mov	edx, DWORD PTR _valtyp$71038[ebp]
	movsx	eax, BYTE PTR [edx]
	test	eax, eax
	jne	SHORT $L71047
	mov	DWORD PTR _valtyp$71038[ebp], OFFSET FLAT:$SG71048
$L71047:

; 629  : 			CTRL_ATTR(srcobj, LISTOBJ);

	lea	ecx, DWORD PTR _srcobj$[ebp]
	push	ecx
	call	_dyntab_free
	add	esp, 4
	push	0
	push	-1
	push	OFFSET FLAT:$SG71051
	mov	edx, DWORD PTR _ctrl$[ebp]
	add	edx, 44					; 0000002cH
	push	edx
	push	0
	lea	eax, DWORD PTR _srcobj$[ebp]
	push	eax
	call	_dyntab_filter_field
	add	esp, 24					; 00000018H
	test	eax, eax
	je	SHORT $L71050
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29872], OFFSET FLAT:$SG71053
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 629		; 00000275H
	jmp	$eva_err$70857
$L71050:

; 630  : 			CTRL_ATTR(srcfield, SRCFIELD);

	lea	eax, DWORD PTR _srcfield$[ebp]
	push	eax
	call	_dyntab_free
	add	esp, 4
	push	0
	push	-1
	push	OFFSET FLAT:$SG71056
	mov	ecx, DWORD PTR _ctrl$[ebp]
	add	ecx, 44					; 0000002cH
	push	ecx
	push	0
	lea	edx, DWORD PTR _srcfield$[ebp]
	push	edx
	call	_dyntab_filter_field
	add	esp, 24					; 00000018H
	test	eax, eax
	je	SHORT $L71055
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29872], OFFSET FLAT:$SG71058
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 630		; 00000276H
	jmp	$eva_err$70857
$L71055:

; 631  : 			if(!strcmp(meth, "_EVA_DB") && !strcmp(valtyp, "_EVA_FILTER") && srcfield.nbrows)

	push	OFFSET FLAT:$SG71060
	mov	edx, DWORD PTR _meth$71041[ebp]
	push	edx
	call	_strcmp
	add	esp, 8
	test	eax, eax
	jne	$L71059
	push	OFFSET FLAT:$SG71061
	mov	eax, DWORD PTR _valtyp$71038[ebp]
	push	eax
	call	_strcmp
	add	esp, 8
	test	eax, eax
	jne	$L71059
	cmp	DWORD PTR _srcfield$[ebp], 0
	je	$L71059

; 633  : 				char objtbl[16];
; 634  : 				snprintf(objtbl, sizeof(objtbl), "EV%s", (ctrl->id.cell && ctrl->id.cell->txt) ? ctrl->id.cell->txt : "0");

	mov	ecx, DWORD PTR _ctrl$[ebp]
	cmp	DWORD PTR [ecx+16], 0
	je	SHORT $L71365
	mov	edx, DWORD PTR _ctrl$[ebp]
	mov	eax, DWORD PTR [edx+16]
	cmp	DWORD PTR [eax], 0
	je	SHORT $L71365
	mov	ecx, DWORD PTR _ctrl$[ebp]
	mov	edx, DWORD PTR [ecx+16]
	mov	eax, DWORD PTR [edx]
	mov	DWORD PTR -4828+[ebp], eax
	jmp	SHORT $L71366
$L71365:
	mov	DWORD PTR -4828+[ebp], OFFSET FLAT:$SG71063
$L71366:
	mov	ecx, DWORD PTR -4828+[ebp]
	push	ecx
	push	OFFSET FLAT:$SG71064
	push	16					; 00000010H
	lea	edx, DWORD PTR _objtbl$71062[ebp]
	push	edx
	call	__snprintf
	add	esp, 16					; 00000010H

; 635  : 				if(qry_add_filter_forms(cntxt, &flt, NULL, &srcobj) || qry_filter_table(cntxt, objtbl, &flt, 0)) STACK_ERROR;

	lea	eax, DWORD PTR _srcobj$[ebp]
	push	eax
	push	0
	lea	ecx, DWORD PTR _flt$[ebp]
	push	ecx
	mov	edx, DWORD PTR _cntxt$[ebp]
	push	edx
	call	_qry_add_filter_forms
	add	esp, 16					; 00000010H
	test	eax, eax
	jne	SHORT $L71067
	push	0
	lea	eax, DWORD PTR _flt$[ebp]
	push	eax
	lea	ecx, DWORD PTR _objtbl$71062[ebp]
	push	ecx
	mov	edx, DWORD PTR _cntxt$[ebp]
	push	edx
	call	_qry_filter_table
	add	esp, 16					; 00000010H
	test	eax, eax
	je	SHORT $L71066
$L71067:
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 635		; 0000027bH
	jmp	$eva_err$70857
$L71066:

; 636  : 				if(qry_eval_sqlexpr_var(cntxt, &expr, srcfield.cell->txt, &ctrl->attr, objtbl)) STACK_ERROR;

	lea	ecx, DWORD PTR _objtbl$71062[ebp]
	push	ecx
	mov	edx, DWORD PTR _ctrl$[ebp]
	add	edx, 44					; 0000002cH
	push	edx
	mov	eax, DWORD PTR _srcfield$[ebp+16]
	mov	ecx, DWORD PTR [eax]
	push	ecx
	lea	edx, DWORD PTR _expr$[ebp]
	push	edx
	mov	eax, DWORD PTR _cntxt$[ebp]
	push	eax
	call	_qry_eval_sqlexpr_var
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L71068
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 636		; 0000027cH
	jmp	$eva_err$70857
$L71068:

; 637  : 				if(strcmp(m, "MIN") && strcmp(m, "MAX") && strcmp(m, "SUM") && strcmp(m, "AVG"))

	push	OFFSET FLAT:$SG71070
	mov	edx, DWORD PTR _m$71044[ebp]
	push	edx
	call	_strcmp
	add	esp, 8
	test	eax, eax
	je	$L71069
	push	OFFSET FLAT:$SG71071
	mov	eax, DWORD PTR _m$71044[ebp]
	push	eax
	call	_strcmp
	add	esp, 8
	test	eax, eax
	je	$L71069
	push	OFFSET FLAT:$SG71072
	mov	ecx, DWORD PTR _m$71044[ebp]
	push	ecx
	call	_strcmp
	add	esp, 8
	test	eax, eax
	je	SHORT $L71069
	push	OFFSET FLAT:$SG71073
	mov	edx, DWORD PTR _m$71044[ebp]
	push	edx
	call	_strcmp
	add	esp, 8
	test	eax, eax
	je	SHORT $L71069

; 639  : 					if(qry_eval_fieldexpr(cntxt, &ctrl->val, expr ? expr->data : NULL, objtbl, &ctrl->attr)) STACK_ERROR;

	cmp	DWORD PTR _expr$[ebp], 0
	je	SHORT $L71367
	mov	eax, DWORD PTR _expr$[ebp]
	add	eax, 8
	mov	DWORD PTR -4832+[ebp], eax
	jmp	SHORT $L71368
$L71367:
	mov	DWORD PTR -4832+[ebp], 0
$L71368:
	mov	ecx, DWORD PTR _ctrl$[ebp]
	add	ecx, 44					; 0000002cH
	push	ecx
	lea	edx, DWORD PTR _objtbl$71062[ebp]
	push	edx
	mov	eax, DWORD PTR -4832+[ebp]
	push	eax
	mov	ecx, DWORD PTR _ctrl$[ebp]
	add	ecx, 64					; 00000040H
	push	ecx
	mov	edx, DWORD PTR _cntxt$[ebp]
	push	edx
	call	_qry_eval_fieldexpr
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L71075
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 639		; 0000027fH
	jmp	$eva_err$70857
$L71075:

; 641  : 				else

	jmp	$L71076
$L71069:

; 643  : 					char qry[64];
; 644  : 					snprintf(qry, sizeof(qry), "SELECT %s(Val) FROM EVRes", m);

	mov	ecx, DWORD PTR _m$71044[ebp]
	push	ecx
	push	OFFSET FLAT:$SG71078
	push	64					; 00000040H
	lea	edx, DWORD PTR _qry$71077[ebp]
	push	edx
	call	__snprintf
	add	esp, 16					; 00000010H

; 645  : 					if(qry_eval_sql_fieldexpr(cntxt, "EVRes", expr ? expr->data : NULL, objtbl, &ctrl->attr) ||
; 646  : 						sql_exec_query(cntxt, qry) || sql_get_table(cntxt, &ctrl->val, 0)) STACK_ERROR;

	cmp	DWORD PTR _expr$[ebp], 0
	je	SHORT $L71369
	mov	eax, DWORD PTR _expr$[ebp]
	add	eax, 8
	mov	DWORD PTR -4836+[ebp], eax
	jmp	SHORT $L71370
$L71369:
	mov	DWORD PTR -4836+[ebp], 0
$L71370:
	mov	ecx, DWORD PTR _ctrl$[ebp]
	add	ecx, 44					; 0000002cH
	push	ecx
	lea	edx, DWORD PTR _objtbl$71062[ebp]
	push	edx
	mov	eax, DWORD PTR -4836+[ebp]
	push	eax
	push	OFFSET FLAT:$SG71082
	mov	ecx, DWORD PTR _cntxt$[ebp]
	push	ecx
	call	_qry_eval_sql_fieldexpr
	add	esp, 20					; 00000014H
	test	eax, eax
	jne	SHORT $L71081
	lea	edx, DWORD PTR _qry$71077[ebp]
	push	edx
	mov	eax, DWORD PTR _cntxt$[ebp]
	push	eax
	call	_sql_exec_query
	add	esp, 8
	test	eax, eax
	jne	SHORT $L71081
	push	0
	mov	ecx, DWORD PTR _ctrl$[ebp]
	add	ecx, 64					; 00000040H
	push	ecx
	mov	edx, DWORD PTR _cntxt$[ebp]
	push	edx
	call	_sql_get_table
	add	esp, 12					; 0000000cH
	test	eax, eax
	je	SHORT $L71080
$L71081:
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 646		; 00000286H
	jmp	$eva_err$70857
$L71080:

; 647  : 					sql_drop_table(cntxt, "EVRes");

	push	OFFSET FLAT:$SG71083
	mov	ecx, DWORD PTR _cntxt$[ebp]
	push	ecx
	call	_sql_drop_table
	add	esp, 8

; 648  : 					vmult = "";

	mov	DWORD PTR _vmult$70961[ebp], OFFSET FLAT:$SG71084
$L71076:

; 651  : 				sql_drop_table(cntxt, objtbl);

	lea	edx, DWORD PTR _objtbl$71062[ebp]
	push	edx
	mov	eax, DWORD PTR _cntxt$[ebp]
	push	eax
	call	_sql_drop_table
	add	esp, 8

; 653  : 			else

	jmp	SHORT $L71086
$L71059:

; 655  : 				if(ctrl_eval_valtyp(cntxt, ctrl, &ctrl->val, valtyp, &srcobj, &srcfield)) CLEAR_ERROR;

	lea	ecx, DWORD PTR _srcfield$[ebp]
	push	ecx
	lea	edx, DWORD PTR _srcobj$[ebp]
	push	edx
	mov	eax, DWORD PTR _valtyp$71038[ebp]
	push	eax
	mov	ecx, DWORD PTR _ctrl$[ebp]
	add	ecx, 64					; 00000040H
	push	ecx
	mov	edx, DWORD PTR _ctrl$[ebp]
	push	edx
	mov	eax, DWORD PTR _cntxt$[ebp]
	push	eax
	call	_ctrl_eval_valtyp
	add	esp, 24					; 00000018H
	test	eax, eax
	je	SHORT $L71086
	push	655					; 0000028fH
	push	OFFSET FLAT:$SG71087
	push	OFFSET FLAT:$SG71088
	mov	ecx, DWORD PTR _cntxt$[ebp]
	push	ecx
	call	_err_clear
	add	esp, 16					; 00000010H
$L71086:

; 658  : 
; 659  : 		/* Handle multiple values */
; 660  : 		ctrl->MULTIPLE = "";

	mov	edx, DWORD PTR _ctrl$[ebp]
	mov	DWORD PTR [edx+344], OFFSET FLAT:$SG71089

; 661  : 		if(!strcmp(vmult, "_EVA_LINE"))

	push	OFFSET FLAT:$SG71091
	mov	eax, DWORD PTR _vmult$70961[ebp]
	push	eax
	call	_strcmp
	add	esp, 8
	test	eax, eax
	jne	SHORT $L71090

; 663  : 			ctrl->MULTIPLE = "Yes";

	mov	ecx, DWORD PTR _ctrl$[ebp]
	mov	DWORD PTR [ecx+344], OFFSET FLAT:$SG71092

; 664  : 			separ = "<br>";

	mov	DWORD PTR _separ$70967[ebp], OFFSET FLAT:$SG71093

; 666  : 		else if(!strcmp(vmult, "_EVA_COMMA"))

	jmp	$L71113
$L71090:
	push	OFFSET FLAT:$SG71096
	mov	edx, DWORD PTR _vmult$70961[ebp]
	push	edx
	call	_strcmp
	add	esp, 8
	test	eax, eax
	jne	SHORT $L71095

; 668  : 			ctrl->MULTIPLE = "Yes";

	mov	eax, DWORD PTR _ctrl$[ebp]
	mov	DWORD PTR [eax+344], OFFSET FLAT:$SG71097

; 670  : 		else if(!strcmp(vmult, "_EVA_SPACE"))

	jmp	$L71113
$L71095:
	push	OFFSET FLAT:$SG71100
	mov	ecx, DWORD PTR _vmult$70961[ebp]
	push	ecx
	call	_strcmp
	add	esp, 8
	test	eax, eax
	jne	SHORT $L71099

; 672  : 			if(dyntab_group(&ctrl->val, "DISTINCT")) RETURN_ERR_MEMORY;

	push	OFFSET FLAT:$SG71102
	mov	edx, DWORD PTR _ctrl$[ebp]
	add	edx, 64					; 00000040H
	push	edx
	call	_dyntab_group
	add	esp, 8
	test	eax, eax
	je	SHORT $L71101
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29872], OFFSET FLAT:$SG71104
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 672		; 000002a0H
	jmp	$eva_err$70857
$L71101:

; 673  : 			ctrl->MULTIPLE = "Yes";

	mov	edx, DWORD PTR _ctrl$[ebp]
	mov	DWORD PTR [edx+344], OFFSET FLAT:$SG71105

; 674  : 			separ = " ";

	mov	DWORD PTR _separ$70967[ebp], OFFSET FLAT:$SG71106

; 676  : 		else if(!strncmp(vmult, add_sz_str("_EVA_")))

	jmp	SHORT $L71113
$L71099:
	push	5
	push	OFFSET FLAT:$SG71109
	mov	eax, DWORD PTR _vmult$70961[ebp]
	push	eax
	call	_strncmp
	add	esp, 12					; 0000000cH
	test	eax, eax
	jne	SHORT $L71108

; 678  : 			if(dyntab_group(&ctrl->val, vmult + 5)) RETURN_ERR_MEMORY;

	mov	ecx, DWORD PTR _vmult$70961[ebp]
	add	ecx, 5
	push	ecx
	mov	edx, DWORD PTR _ctrl$[ebp]
	add	edx, 64					; 00000040H
	push	edx
	call	_dyntab_group
	add	esp, 8
	test	eax, eax
	je	SHORT $L71110
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29872], OFFSET FLAT:$SG71112
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 678		; 000002a6H
	jmp	$eva_err$70857
$L71110:

; 680  : 		else

	jmp	SHORT $L71113
$L71108:

; 682  : 			ctrl->MULTIPLE = "Unique";

	mov	edx, DWORD PTR _ctrl$[ebp]
	mov	DWORD PTR [edx+344], OFFSET FLAT:$SG71114

; 683  : 			separ = "<br>";

	mov	DWORD PTR _separ$70967[ebp], OFFSET FLAT:$SG71115
$L71113:

; 685  : 
; 686  : 		/* Output values */
; 687  : 		if(options < 3) for(i = 0; i < ctrl->val.nbrows; i++)

	cmp	DWORD PTR _options$[ebp], 3
	jae	$L71119
	mov	DWORD PTR _i$70955[ebp], 0
	jmp	SHORT $L71117
$L71118:
	mov	eax, DWORD PTR _i$70955[ebp]
	add	eax, 1
	mov	DWORD PTR _i$70955[ebp], eax
$L71117:
	mov	ecx, DWORD PTR _ctrl$[ebp]
	mov	edx, DWORD PTR _i$70955[ebp]
	cmp	edx, DWORD PTR [ecx+64]
	jae	$L71119

; 689  : 			/* Output formated value */
; 690  : 			if(options)

	cmp	DWORD PTR _options$[ebp], 0
	je	$L71120

; 692  : 				M_FREE(expr);

	mov	eax, DWORD PTR _expr$[ebp]
	push	eax
	call	_mem_free
	add	esp, 4
	mov	DWORD PTR _expr$[ebp], 0

; 693  : 				if(put_value_fmt(cntxt, &expr, DYNTAB_VAL_SZ(&ctrl->val, i, 0), fmt)) CLEAR_ERROR;

	mov	ecx, DWORD PTR _fmt$70958[ebp]
	push	ecx
	push	0
	mov	edx, DWORD PTR _i$70955[ebp]
	push	edx
	mov	eax, DWORD PTR _ctrl$[ebp]
	add	eax, 64					; 00000040H
	push	eax
	call	_dyntab_sz
	add	esp, 12					; 0000000cH
	push	eax
	push	0
	mov	ecx, DWORD PTR _i$70955[ebp]
	push	ecx
	mov	edx, DWORD PTR _ctrl$[ebp]
	add	edx, 64					; 00000040H
	push	edx
	call	_dyntab_val
	add	esp, 12					; 0000000cH
	push	eax
	lea	eax, DWORD PTR _expr$[ebp]
	push	eax
	mov	ecx, DWORD PTR _cntxt$[ebp]
	push	ecx
	call	_put_value_fmt
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L71121
	push	693					; 000002b5H
	push	OFFSET FLAT:$SG71122
	push	OFFSET FLAT:$SG71123
	mov	edx, DWORD PTR _cntxt$[ebp]
	push	edx
	call	_err_clear
	add	esp, 16					; 00000010H
$L71121:

; 694  : 				if(options < 2)

	cmp	DWORD PTR _options$[ebp], 2
	jae	$L71124

; 696  : 					DYNBUF_ADD_BUF(html, expr, TO_HTML);

	cmp	DWORD PTR _expr$[ebp], 0
	je	SHORT $L71125
	push	1
	push	OFFSET FLAT:_plain_to_html
	mov	eax, DWORD PTR _expr$[ebp]
	mov	ecx, DWORD PTR [eax+4]
	push	ecx
	mov	edx, DWORD PTR _expr$[ebp]
	add	edx, 8
	push	edx
	mov	eax, DWORD PTR _html$[ebp]
	push	eax
	call	_dynbuf_add
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L71125
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29872], OFFSET FLAT:$SG71127
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 696		; 000002b8H
	jmp	$eva_err$70857
$L71125:

; 697  : 					DYNBUF_ADD(html, separ, 0, NO_CONV);

	push	0
	push	0
	push	0
	mov	eax, DWORD PTR _separ$70967[ebp]
	push	eax
	mov	ecx, DWORD PTR _html$[ebp]
	push	ecx
	call	_dynbuf_add
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L71129
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29872], OFFSET FLAT:$SG71131
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 697		; 000002b9H
	jmp	$eva_err$70857
$L71129:

; 699  : 				else

	jmp	$L71141
$L71124:

; 700  : 					DYNTAB_ADD_BUF(&ctrl->val, i, 1, expr);

	cmp	DWORD PTR _expr$[ebp], 0
	je	SHORT $L71133
	mov	ecx, DWORD PTR _expr$[ebp]
	cmp	DWORD PTR [ecx+4], 0
	je	SHORT $L71133
	push	0
	push	0
	mov	edx, DWORD PTR _expr$[ebp]
	mov	eax, DWORD PTR [edx+4]
	push	eax
	mov	ecx, DWORD PTR _expr$[ebp]
	add	ecx, 8
	push	ecx
	push	1
	mov	edx, DWORD PTR _i$70955[ebp]
	push	edx
	mov	eax, DWORD PTR _ctrl$[ebp]
	add	eax, 64					; 00000040H
	push	eax
	call	_dyntab_add
	add	esp, 28					; 0000001cH
	test	eax, eax
	je	SHORT $L71135
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29872], OFFSET FLAT:$SG71137
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 700		; 000002bcH
	jmp	$eva_err$70857
$L71135:
	jmp	SHORT $L71141
$L71133:
	push	0
	push	0
	push	0
	push	0
	push	1
	mov	eax, DWORD PTR _i$70955[ebp]
	push	eax
	mov	ecx, DWORD PTR _ctrl$[ebp]
	add	ecx, 64					; 00000040H
	push	ecx
	call	_dyntab_add
	add	esp, 28					; 0000001cH
	test	eax, eax
	je	SHORT $L71141
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29872], OFFSET FLAT:$SG71143
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 700		; 000002bcH
	jmp	$eva_err$70857
$L71141:

; 702  : 			else

	jmp	$L71151
$L71120:

; 704  : 				if(i && html && *html && (*html)->cnt > 8 && strcmp("</table>", (*html)->data + (*html)->cnt - 8))

	cmp	DWORD PTR _i$70955[ebp], 0
	je	SHORT $L71148
	cmp	DWORD PTR _html$[ebp], 0
	je	SHORT $L71148
	mov	ecx, DWORD PTR _html$[ebp]
	cmp	DWORD PTR [ecx], 0
	je	SHORT $L71148
	mov	edx, DWORD PTR _html$[ebp]
	mov	eax, DWORD PTR [edx]
	cmp	DWORD PTR [eax+4], 8
	jbe	SHORT $L71148
	mov	ecx, DWORD PTR _html$[ebp]
	mov	edx, DWORD PTR [ecx]
	mov	eax, DWORD PTR _html$[ebp]
	mov	ecx, DWORD PTR [eax]
	add	edx, DWORD PTR [ecx+4]
	push	edx
	push	OFFSET FLAT:$SG71146
	call	_strcmp
	add	esp, 8
	test	eax, eax
	je	SHORT $L71148

; 705  : 					DYNBUF_ADD(html, separ, 0, NO_CONV);

	push	0
	push	0
	push	0
	mov	edx, DWORD PTR _separ$70967[ebp]
	push	edx
	mov	eax, DWORD PTR _html$[ebp]
	push	eax
	call	_dynbuf_add
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L71148
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29872], OFFSET FLAT:$SG71150
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 705		; 000002c1H
	jmp	$eva_err$70857
$L71148:

; 706  : 				if(html_put_value_fmt(cntxt, ctrl, &ctrl->val, i, fmt, 0, &tot_char, &b_stripped))

	lea	eax, DWORD PTR _b_stripped$70957[ebp]
	push	eax
	lea	ecx, DWORD PTR _tot_char$70956[ebp]
	push	ecx
	push	0
	mov	edx, DWORD PTR _fmt$70958[ebp]
	push	edx
	mov	eax, DWORD PTR _i$70955[ebp]
	push	eax
	mov	ecx, DWORD PTR _ctrl$[ebp]
	add	ecx, 64					; 00000040H
	push	ecx
	mov	edx, DWORD PTR _ctrl$[ebp]
	push	edx
	mov	eax, DWORD PTR _cntxt$[ebp]
	push	eax
	call	_html_put_value_fmt
	add	esp, 32					; 00000020H
	test	eax, eax
	je	SHORT $L71151

; 707  : 					CLEAR_ERROR;

	push	707					; 000002c3H
	push	OFFSET FLAT:$SG71152
	push	OFFSET FLAT:$SG71153
	mov	ecx, DWORD PTR _cntxt$[ebp]
	push	ecx
	call	_err_clear
	add	esp, 16					; 00000010H
$L71151:

; 709  : 			if(lblunit) DYNBUF_ADD3_CELLP(html, " ", lblunit, TO_HTML, "");

	cmp	DWORD PTR _lblunit$70964[ebp], 0
	je	$L71157
	mov	edx, DWORD PTR _lblunit$70964[ebp]
	mov	DWORD PTR __c$71155[ebp], edx
	cmp	DWORD PTR __c$71155[ebp], 0
	je	SHORT $L71371
	mov	eax, DWORD PTR __c$71155[ebp]
	mov	ecx, DWORD PTR [eax+4]
	mov	DWORD PTR -4840+[ebp], ecx
	jmp	SHORT $L71372
$L71371:
	mov	DWORD PTR -4840+[ebp], 0
$L71372:
	cmp	DWORD PTR __c$71155[ebp], 0
	je	SHORT $L71373
	mov	edx, DWORD PTR __c$71155[ebp]
	mov	eax, DWORD PTR [edx]
	mov	DWORD PTR -4844+[ebp], eax
	jmp	SHORT $L71374
$L71373:
	mov	DWORD PTR -4844+[ebp], 0
$L71374:
	push	0
	push	OFFSET FLAT:$SG71158
	push	1
	push	OFFSET FLAT:_plain_to_html
	mov	ecx, DWORD PTR -4840+[ebp]
	push	ecx
	mov	edx, DWORD PTR -4844+[ebp]
	push	edx
	push	1
	push	OFFSET FLAT:$SG71159
	mov	eax, DWORD PTR _html$[ebp]
	push	eax
	call	_dynbuf_add3
	add	esp, 36					; 00000024H
	test	eax, eax
	je	SHORT $L71157
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29872], OFFSET FLAT:$SG71161
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 709		; 000002c5H
	jmp	SHORT $eva_err$70857
$L71157:

; 710  : 
; 711  : 			/* Add value to list of values if in a table */
; 712  : 			if(cntxt->form->Line) DYNTAB_ADD_CELL(&ctrl->allval, ctrl->allval.nbrows, 0, &ctrl->val, i, 0);

	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	ecx, DWORD PTR [eax+80]
	cmp	DWORD PTR [ecx+240], 0
	je	SHORT $L71163
	push	1
	push	0
	mov	edx, DWORD PTR _i$70955[ebp]
	push	edx
	mov	eax, DWORD PTR _ctrl$[ebp]
	add	eax, 64					; 00000040H
	push	eax
	call	_dyntab_cell
	add	esp, 12					; 0000000cH
	push	eax
	push	0
	mov	ecx, DWORD PTR _ctrl$[ebp]
	mov	edx, DWORD PTR [ecx+124]
	push	edx
	mov	eax, DWORD PTR _ctrl$[ebp]
	add	eax, 124				; 0000007cH
	push	eax
	call	_dyntab_copy
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L71163
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29872], OFFSET FLAT:$SG71165
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 712		; 000002c8H
	jmp	SHORT $eva_err$70857
$L71163:

; 713  : 		}

	jmp	$L71118
$L71119:
$eva_noerr$70988:

; 715  : 
; 716  : 	RETURN_OK_CLEANUP;

	push	0
	push	OFFSET FLAT:$SG71166
	push	OFFSET FLAT:$SG71167
	mov	eax, DWORD PTR _cntxt$[ebp]
	push	eax
	call	_err_clear
	add	esp, 16					; 00000010H
$eva_err$70857:
	mov	ecx, DWORD PTR _cntxt$[ebp]
	cmp	DWORD PTR [ecx+29872], 0
	je	SHORT $L71168
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	eax, DWORD PTR [edx+29900]
	push	eax
	push	OFFSET FLAT:$SG71169
	push	OFFSET FLAT:$SG71170
	mov	ecx, DWORD PTR _cntxt$[ebp]
	push	ecx
	call	_err_add_context
	add	esp, 16					; 00000010H
$L71168:
	lea	edx, DWORD PTR _srcobj$[ebp]
	push	edx
	call	_dyntab_free
	add	esp, 4
	lea	eax, DWORD PTR _srcfield$[ebp]
	push	eax
	call	_dyntab_free
	add	esp, 4
	lea	ecx, DWORD PTR _flt$[ebp]
	push	ecx
	call	_qry_build_free
	add	esp, 4
	mov	edx, DWORD PTR _expr$[ebp]
	push	edx
	call	_mem_free
	add	esp, 4
	mov	DWORD PTR _expr$[ebp], 0
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	ecx, DWORD PTR _sql_trace$[ebp]
	mov	DWORD PTR [eax+29852], ecx
	mov	edx, DWORD PTR _cntxt$[ebp]
	xor	eax, eax
	cmp	DWORD PTR [edx+29872], 0
	setne	al

; 717  : }

	pop	edi
	mov	esp, ebp
	pop	ebp
	ret	0
_ctrl_output_exprval ENDP
_TEXT	ENDS
PUBLIC	_ctrl_add_exprval
EXTRN	_ctrl_format_pos:NEAR
_BSS	SEGMENT
	ALIGN	4

$SG71189 DB	01H DUP (?)
_BSS	ENDS
_DATA	SEGMENT
$SG71188 DB	'_EVA_DISPLAYFORMAT', 00H
	ORG $+1
$SG71193 DB	'_EVA_FILESIZE', 00H
	ORG $+2
$SG71194 DB	'_EVA_NUMBER', 00H
$SG71195 DB	'_EVA_MONEY', 00H
	ORG $+1
$SG71196 DB	'_EVA_TELEPHONE', 00H
	ORG $+1
$SG71197 DB	'1', 00H
	ORG $+2
$SG71203 DB	'D:\Travail\ABI\EVA\V4.0\CGI\Brunix-2016\ctrl_exprval.c', 00H
	ORG $+1
$SG71204 DB	'ctrl_add_exprval', 00H
	ORG $+3
$SG71206 DB	'D:\Travail\ABI\EVA\V4.0\CGI\Brunix-2016\ctrl_exprval.c', 00H
	ORG $+1
$SG71207 DB	'ctrl_add_exprval', 00H
_DATA	ENDS
_TEXT	SEGMENT
_cntxt$ = 8
_i_ctrl$ = 12
_form$ = -4
_ctrl$ = -12
_html$ = -8
_fmt$71187 = -16
_ctrl_add_exprval PROC NEAR

; 730  : ){

	push	ebp
	mov	ebp, esp
	sub	esp, 28					; 0000001cH

; 731  : 	EVA_form *form = cntxt->form;

	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	ecx, DWORD PTR [eax+80]
	mov	DWORD PTR _form$[ebp], ecx

; 732  : 	EVA_ctrl *ctrl = form->ctrl + i_ctrl;

	mov	edx, DWORD PTR _i_ctrl$[ebp]
	imul	edx, 480				; 000001e0H
	mov	eax, DWORD PTR _form$[ebp]
	mov	ecx, DWORD PTR [eax]
	add	ecx, edx
	mov	DWORD PTR _ctrl$[ebp], ecx

; 733  : 	CHECK_HTML_STATUS;

	cmp	DWORD PTR _cntxt$[ebp], 0
	je	SHORT $L71379
	mov	edx, DWORD PTR _cntxt$[ebp]
	cmp	DWORD PTR [edx+80], 0
	je	SHORT $L71377
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	ecx, DWORD PTR [eax+80]
	mov	edx, DWORD PTR [ecx+232]
	mov	DWORD PTR -20+[ebp], edx
	jmp	SHORT $L71378
$L71377:
	mov	DWORD PTR -20+[ebp], 0
$L71378:
	mov	eax, DWORD PTR -20+[ebp]
	mov	DWORD PTR -24+[ebp], eax
	jmp	SHORT $L71380
$L71379:
	mov	DWORD PTR -24+[ebp], 0
$L71380:
	mov	ecx, DWORD PTR -24+[ebp]
	mov	DWORD PTR _html$[ebp], ecx
	cmp	DWORD PTR _html$[ebp], 0
	jne	SHORT $L71184
	xor	eax, eax
	jmp	$L71178
$L71184:

; 734  : 
; 735  : 	if(form->step == HtmlView || form->step == HtmlPrint || form->step == HtmlEdit)

	mov	edx, DWORD PTR _form$[ebp]
	cmp	DWORD PTR [edx+176], 6
	je	SHORT $L71186
	mov	eax, DWORD PTR _form$[ebp]
	cmp	DWORD PTR [eax+176], 7
	je	SHORT $L71186
	mov	ecx, DWORD PTR _form$[ebp]
	cmp	DWORD PTR [ecx+176], 4
	jne	$L71201
$L71186:

; 737  : 		/* Handle auto nobr for specific formats */
; 738  : 		char *fmt = CTRL_ATTR_VAL(DISPLAYFORMAT);

	cmp	DWORD PTR _ctrl$[ebp], 0
	je	SHORT $L71381
	push	0
	push	-1
	push	OFFSET FLAT:$SG71188
	mov	edx, DWORD PTR _ctrl$[ebp]
	add	edx, 44					; 0000002cH
	push	edx
	call	_dyntab_field_val
	add	esp, 16					; 00000010H
	mov	DWORD PTR -28+[ebp], eax
	jmp	SHORT $L71382
$L71381:
	mov	DWORD PTR -28+[ebp], OFFSET FLAT:$SG71189
$L71382:
	mov	eax, DWORD PTR -28+[ebp]
	mov	DWORD PTR _fmt$71187[ebp], eax

; 739  : 		if(!(ctrl->NOBR && *ctrl->NOBR) && (
; 740  : 				!strcmp(fmt, "_EVA_FILESIZE") ||
; 741  : 				!strcmp(fmt, "_EVA_NUMBER") ||
; 742  : 				!STRCMPCASE(fmt, "_EVA_MONEY") ||
; 743  : 				!strcmp(fmt, "_EVA_TELEPHONE")))

	mov	ecx, DWORD PTR _ctrl$[ebp]
	cmp	DWORD PTR [ecx+316], 0
	je	SHORT $L71191
	mov	edx, DWORD PTR _ctrl$[ebp]
	mov	eax, DWORD PTR [edx+316]
	movsx	ecx, BYTE PTR [eax]
	test	ecx, ecx
	jne	SHORT $L71190
$L71191:
	push	OFFSET FLAT:$SG71193
	mov	edx, DWORD PTR _fmt$71187[ebp]
	push	edx
	call	_strcmp
	add	esp, 8
	test	eax, eax
	je	SHORT $L71192
	push	OFFSET FLAT:$SG71194
	mov	eax, DWORD PTR _fmt$71187[ebp]
	push	eax
	call	_strcmp
	add	esp, 8
	test	eax, eax
	je	SHORT $L71192
	push	OFFSET FLAT:$SG71195
	mov	ecx, DWORD PTR _fmt$71187[ebp]
	push	ecx
	call	_stricmp
	add	esp, 8
	test	eax, eax
	je	SHORT $L71192
	push	OFFSET FLAT:$SG71196
	mov	edx, DWORD PTR _fmt$71187[ebp]
	push	edx
	call	_strcmp
	add	esp, 8
	test	eax, eax
	jne	SHORT $L71190
$L71192:

; 744  : 			ctrl->NOBR  = "1";

	mov	eax, DWORD PTR _ctrl$[ebp]
	mov	DWORD PTR [eax+316], OFFSET FLAT:$SG71197
$L71190:

; 745  : 
; 746  : 		/* Add HTML code for the text control label & position */
; 747  : 		if(ctrl_format_pos(cntxt, ctrl, 1)) STACK_ERROR;

	push	1
	mov	ecx, DWORD PTR _ctrl$[ebp]
	push	ecx
	mov	edx, DWORD PTR _cntxt$[ebp]
	push	edx
	call	_ctrl_format_pos
	add	esp, 12					; 0000000cH
	test	eax, eax
	je	SHORT $L71198
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 747		; 000002ebH
	jmp	SHORT $eva_err$71199
$L71198:

; 748  : 
; 749  : 		/* Add control value depending on value type */
; 750  : 		if(ctrl_output_exprval(cntxt, ctrl, 0)) STACK_ERROR;

	push	0
	mov	ecx, DWORD PTR _ctrl$[ebp]
	push	ecx
	mov	edx, DWORD PTR _cntxt$[ebp]
	push	edx
	call	_ctrl_output_exprval
	add	esp, 12					; 0000000cH
	test	eax, eax
	je	SHORT $L71200
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 750		; 000002eeH
	jmp	SHORT $eva_err$71199
$L71200:

; 751  : 
; 752  : 		/* Add HTML code for the control footer */
; 753  : 		if(ctrl_format_pos(cntxt, ctrl, 0)) STACK_ERROR;

	push	0
	mov	ecx, DWORD PTR _ctrl$[ebp]
	push	ecx
	mov	edx, DWORD PTR _cntxt$[ebp]
	push	edx
	call	_ctrl_format_pos
	add	esp, 12					; 0000000cH
	test	eax, eax
	je	SHORT $L71201
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 753		; 000002f1H
	jmp	SHORT $eva_err$71199
$L71201:
$eva_noerr$71202:

; 755  : 
; 756  : 	RETURN_OK_CLEANUP;

	push	0
	push	OFFSET FLAT:$SG71203
	push	OFFSET FLAT:$SG71204
	mov	ecx, DWORD PTR _cntxt$[ebp]
	push	ecx
	call	_err_clear
	add	esp, 16					; 00000010H
$eva_err$71199:
	mov	edx, DWORD PTR _cntxt$[ebp]
	cmp	DWORD PTR [edx+29872], 0
	je	SHORT $L71205
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	ecx, DWORD PTR [eax+29900]
	push	ecx
	push	OFFSET FLAT:$SG71206
	push	OFFSET FLAT:$SG71207
	mov	edx, DWORD PTR _cntxt$[ebp]
	push	edx
	call	_err_add_context
	add	esp, 16					; 00000010H
$L71205:
	mov	eax, DWORD PTR _cntxt$[ebp]
	xor	ecx, ecx
	cmp	DWORD PTR [eax+29872], 0
	setne	cl
	mov	eax, ecx
$L71178:

; 757  : }

	mov	esp, ebp
	pop	ebp
	ret	0
_ctrl_add_exprval ENDP
_TEXT	ENDS
END
