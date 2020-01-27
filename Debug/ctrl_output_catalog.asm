	TITLE	D:\Travail\ABI\EVA\V4.0\CGI\Brunix-2016\ctrl_output_catalog.c
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
PUBLIC	_output_catalog_sublist
PUBLIC	__real@8@3fff8000000000000000
EXTRN	_qry_obj_label:NEAR
EXTRN	__snprintf:NEAR
EXTRN	_get_image_size:NEAR
EXTRN	_sql_exec_query:NEAR
EXTRN	_put_html_image_dir:NEAR
EXTRN	_mem_free:NEAR
EXTRN	_strtoul:NEAR
EXTRN	_qry_obj_idfield:NEAR
EXTRN	_dynbuf_add:NEAR
EXTRN	_dynbuf_add_int:NEAR
EXTRN	_dynbuf_add3:NEAR
EXTRN	_dynbuf_add3_int:NEAR
EXTRN	_dyntab_free:NEAR
EXTRN	_sql_get_table:NEAR
EXTRN	_dyntab_val:NEAR
EXTRN	_dyntab_cell:NEAR
EXTRN	_err_add_context:NEAR
EXTRN	_err_clear:NEAR
EXTRN	__ftol:NEAR
EXTRN	_dyntab_cmp:NEAR
EXTRN	__chkstk:NEAR
EXTRN	__fltused:NEAR
_BSS	SEGMENT
$SG70335 DB	01H DUP (?)
_BSS	ENDS
_DATA	SEGMENT
$SG70276 DB	'-- output_catalog_sublist : Read file Ids for selected o'
	DB	'bjects', 0aH, 'SELECT DISTINCT IdRelObj AS Val,IdObj,IdRelObj'
	DB	' AS IdValue FROM TLink', 0aH, 00H
	ORG $+3
$SG70278 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70283 DB	'-- output_catalog_sublist : Read value images for select'
	DB	'ed objects', 0aH, 'SELECT DISTINCT TxtValue AS Val,IdObj,TLin'
	DB	'k.IdValue AS IdValue FROM TLink', 0aH, 'INNER JOIN TVal ON TV'
	DB	'al.IdValue=TLink.IdValue', 0aH, 00H
$SG70285 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70288 DB	') AND DateDel IS NULL AND Num=1 AND IdField=', 00H
	ORG $+3
$SG70289 DB	'WHERE IdObj IN (', 00H
	ORG $+3
$SG70291 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70294 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70297 DB	' ORDER BY Val', 00H
	ORG $+2
$SG70299 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70318 DB	0aH, 00H
	ORG $+2
$SG70320 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70324 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70333 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70336 DB	'.IMG$', 00H
	ORG $+2
$SG70338 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70345 DB	'.', 00H
	ORG $+2
$SG70346 DB	'.', 00H
	ORG $+2
$SG70348 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70351 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70356 DB	'../docs/%s/%s/%s', 00H
	ORG $+3
$SG70357 DB	'%lu', 00H
$SG70358 DB	'%lu', 00H
$SG70373 DB	' ', 00H
	ORG $+2
$SG70375 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70387 DB	' <font size=4><b>...', 00H
	ORG $+3
$SG70389 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70391 DB	'D:\Travail\ABI\EVA\V4.0\CGI\Brunix-2016\ctrl_output_cata'
	DB	'log.c', 00H
	ORG $+2
$SG70392 DB	'output_catalog_sublist', 00H
	ORG $+1
$SG70394 DB	'D:\Travail\ABI\EVA\V4.0\CGI\Brunix-2016\ctrl_output_cata'
	DB	'log.c', 00H
	ORG $+2
$SG70395 DB	'output_catalog_sublist', 00H
_DATA	ENDS
;	COMDAT __real@8@3fff8000000000000000
; File D:\Travail\ABI\EVA\V4.0\CGI\Brunix-2016\ctrl_output_catalog.c
CONST	SEGMENT
__real@8@3fff8000000000000000 DQ 03ff0000000000000r ; 1
CONST	ENDS
_TEXT	SEGMENT
_cntxt$ = 8
_cat$ = 12
_idobj$ = 16
_szobj$ = 20
_strip$ = 24
_lvl$ = 28
_isel$ = 32
_form$ = -8
_ctrl$ = -88
_data$ = -36
_obj$ = -72
_sql$ = -4
_lbl$ = -84
_name$ = -80
_i$ = -48
_j$ = -52
_wsum$ = -40
_imgdir$ = -16
_b_strip$ = -76
_b_dyn_size$ = -44
_html$ = -12
_c$70305 = -92
_w$70326 = -96
_h$70327 = -100
_idval$70340 = -108
_idrel$70342 = -104
_path$70353 = -4204
_dh$70354 = -4236
_dw$70355 = -4220
_pos$70377 = -4240
_output_catalog_sublist PROC NEAR

; 72   : ){

	push	ebp
	mov	ebp, esp
	mov	eax, 4296				; 000010c8H
	call	__chkstk

; 73   : 	EVA_form *form = cntxt->form;

	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	ecx, DWORD PTR [eax+80]
	mov	DWORD PTR _form$[ebp], ecx

; 74   : 	EVA_ctrl *ctrl = form->ctrl + cat->i_ctrl;

	mov	edx, DWORD PTR _cat$[ebp]
	mov	eax, DWORD PTR [edx]
	imul	eax, 480				; 000001e0H
	mov	ecx, DWORD PTR _form$[ebp]
	mov	edx, DWORD PTR [ecx]
	add	edx, eax
	mov	DWORD PTR _ctrl$[ebp], edx

; 75   : 	DynTable data = { 0 };

	mov	DWORD PTR _data$[ebp], 0
	xor	eax, eax
	mov	DWORD PTR _data$[ebp+4], eax
	mov	DWORD PTR _data$[ebp+8], eax
	mov	DWORD PTR _data$[ebp+12], eax
	mov	DWORD PTR _data$[ebp+16], eax

; 76   : 	DynTable obj = { 0 };

	mov	DWORD PTR _obj$[ebp], 0
	xor	ecx, ecx
	mov	DWORD PTR _obj$[ebp+4], ecx
	mov	DWORD PTR _obj$[ebp+8], ecx
	mov	DWORD PTR _obj$[ebp+12], ecx
	mov	DWORD PTR _obj$[ebp+16], ecx

; 77   : 	DynBuffer *sql = NULL;

	mov	DWORD PTR _sql$[ebp], 0

; 78   : 	DynBuffer *lbl = NULL;

	mov	DWORD PTR _lbl$[ebp], 0

; 79   : 	DynBuffer *name = NULL;

	mov	DWORD PTR _name$[ebp], 0

; 80   : 	unsigned long i, j = 0, wsum = 0;

	mov	DWORD PTR _j$[ebp], 0
	mov	DWORD PTR _wsum$[ebp], 0

; 81   : 	char *imgdir = dyntab_val(&cat->imgdir, 0, 0);

	push	0
	push	0
	mov	edx, DWORD PTR _cat$[ebp]
	add	edx, 44					; 0000002cH
	push	edx
	call	_dyntab_val
	add	esp, 12					; 0000000cH
	mov	DWORD PTR _imgdir$[ebp], eax

; 82   : 	int b_strip = 0, b_dyn_size = !(*cat->dh1 || *cat->dw1) && *imgdir;

	mov	DWORD PTR _b_strip$[ebp], 0
	mov	eax, DWORD PTR _cat$[ebp]
	movsx	ecx, BYTE PTR [eax+80]
	test	ecx, ecx
	jne	SHORT $L71512
	mov	edx, DWORD PTR _cat$[ebp]
	movsx	eax, BYTE PTR [edx+64]
	test	eax, eax
	jne	SHORT $L71512
	mov	ecx, DWORD PTR _imgdir$[ebp]
	movsx	edx, BYTE PTR [ecx]
	test	edx, edx
	je	SHORT $L71512
	mov	DWORD PTR -4244+[ebp], 1
	jmp	SHORT $L71513
$L71512:
	mov	DWORD PTR -4244+[ebp], 0
$L71513:
	mov	eax, DWORD PTR -4244+[ebp]
	mov	DWORD PTR _b_dyn_size$[ebp], eax

; 83   : 	CHECK_HTML_STATUS;

	cmp	DWORD PTR _cntxt$[ebp], 0
	je	SHORT $L71516
	mov	ecx, DWORD PTR _cntxt$[ebp]
	cmp	DWORD PTR [ecx+80], 0
	je	SHORT $L71514
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	eax, DWORD PTR [edx+80]
	mov	ecx, DWORD PTR [eax+232]
	mov	DWORD PTR -4248+[ebp], ecx
	jmp	SHORT $L71515
$L71514:
	mov	DWORD PTR -4248+[ebp], 0
$L71515:
	mov	edx, DWORD PTR -4248+[ebp]
	mov	DWORD PTR -4252+[ebp], edx
	jmp	SHORT $L71517
$L71516:
	mov	DWORD PTR -4252+[ebp], 0
$L71517:
	mov	eax, DWORD PTR -4252+[ebp]
	mov	DWORD PTR _html$[ebp], eax
	cmp	DWORD PTR _html$[ebp], 0
	jne	SHORT $L70272
	xor	eax, eax
	jmp	$L70252
$L70272:

; 84   : 
; 85   : 	/* Handle image field type */
; 86   : 	if(cat->idimg_r)

	mov	ecx, DWORD PTR _cat$[ebp]
	cmp	DWORD PTR [ecx+152], 0
	je	SHORT $L70273

; 90   : 			"-- output_catalog_sublist : Read file Ids for selected objects\n"
; 91   : 			"SELECT DISTINCT IdRelObj AS Val,IdObj,IdRelObj AS IdValue FROM TLink\n");

	push	0
	push	0
	push	132					; 00000084H
	push	OFFSET FLAT:$SG70276
	lea	edx, DWORD PTR _sql$[ebp]
	push	edx
	call	_dynbuf_add
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L70275
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29872], OFFSET FLAT:$SG70278
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 91		; 0000005bH
	jmp	$eva_err$70279
$L70275:

; 93   : 	else

	jmp	SHORT $L70282
$L70273:

; 97   : 			"-- output_catalog_sublist : Read value images for selected objects\n"
; 98   : 			"SELECT DISTINCT TxtValue AS Val,IdObj,TLink.IdValue AS IdValue FROM TLink\n"
; 99   : 			"INNER JOIN TVal ON TVal.IdValue=TLink.IdValue\n");

	push	0
	push	0
	push	187					; 000000bbH
	push	OFFSET FLAT:$SG70283
	lea	edx, DWORD PTR _sql$[ebp]
	push	edx
	call	_dynbuf_add
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L70282
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29872], OFFSET FLAT:$SG70285
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 99		; 00000063H
	jmp	$eva_err$70279
$L70282:

; 102  : 		"WHERE IdObj IN (", idobj, szobj, NO_CONV, ") AND DateDel IS NULL AND Num=1 AND IdField=");

	push	44					; 0000002cH
	push	OFFSET FLAT:$SG70288
	push	0
	push	0
	mov	edx, DWORD PTR _szobj$[ebp]
	push	edx
	mov	eax, DWORD PTR _idobj$[ebp]
	push	eax
	push	16					; 00000010H
	push	OFFSET FLAT:$SG70289
	lea	ecx, DWORD PTR _sql$[ebp]
	push	ecx
	call	_dynbuf_add3
	add	esp, 36					; 00000024H
	test	eax, eax
	je	SHORT $L70287
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29872], OFFSET FLAT:$SG70291
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 102		; 00000066H
	jmp	$eva_err$70279
$L70287:

; 103  : 	DYNBUF_ADD_INT(&sql, cat->idimg);

	mov	ecx, DWORD PTR _cat$[ebp]
	mov	edx, DWORD PTR [ecx+148]
	push	edx
	lea	eax, DWORD PTR _sql$[ebp]
	push	eax
	call	_dynbuf_add_int
	add	esp, 8
	test	eax, eax
	je	SHORT $L70292
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29872], OFFSET FLAT:$SG70294
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 103		; 00000067H
	jmp	$eva_err$70279
$L70292:

; 104  : 	DYNBUF_ADD_STR(&sql, " ORDER BY Val");

	push	0
	push	0
	push	13					; 0000000dH
	push	OFFSET FLAT:$SG70297
	lea	eax, DWORD PTR _sql$[ebp]
	push	eax
	call	_dynbuf_add
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L70296
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29872], OFFSET FLAT:$SG70299
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 104		; 00000068H
	jmp	$eva_err$70279
$L70296:

; 105  : 	if(sql_exec_query(cntxt, sql->data) || sql_get_table(cntxt, &data, 6)) STACK_ERROR;

	mov	eax, DWORD PTR _sql$[ebp]
	add	eax, 8
	push	eax
	mov	ecx, DWORD PTR _cntxt$[ebp]
	push	ecx
	call	_sql_exec_query
	add	esp, 8
	test	eax, eax
	jne	SHORT $L70301
	push	6
	lea	edx, DWORD PTR _data$[ebp]
	push	edx
	mov	eax, DWORD PTR _cntxt$[ebp]
	push	eax
	call	_sql_get_table
	add	esp, 12					; 0000000cH
	test	eax, eax
	je	SHORT $L70300
$L70301:
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 105		; 00000069H
	jmp	$eva_err$70279
$L70300:

; 106  : 
; 107  : 	/* Output images for objects groups */
; 108  : 	M_FREE(sql);

	mov	edx, DWORD PTR _sql$[ebp]
	push	edx
	call	_mem_free
	add	esp, 4
	mov	DWORD PTR _sql$[ebp], 0

; 109  : 	for(i = 0; i < data.nbrows; i++)

	mov	DWORD PTR _i$[ebp], 0
	jmp	SHORT $L70302
$L70303:
	mov	eax, DWORD PTR _i$[ebp]
	add	eax, 1
	mov	DWORD PTR _i$[ebp], eax
$L70302:
	mov	ecx, DWORD PTR _i$[ebp]
	cmp	ecx, DWORD PTR _data$[ebp]
	jae	$L70304

; 111  : 		/* Read object label */
; 112  : 		DynTableCell *c = dyntab_cell(&data, i, 0);

	push	0
	mov	edx, DWORD PTR _i$[ebp]
	push	edx
	lea	eax, DWORD PTR _data$[ebp]
	push	eax
	call	_dyntab_cell
	add	esp, 12					; 0000000cH
	mov	DWORD PTR _c$70305[ebp], eax

; 113  : 		if(qry_obj_idfield(cntxt, &obj, c->IdObj, 0) ||
; 114  : 			qry_obj_label(cntxt, NULL, NULL, &lbl, NULL, NULL, NULL, NULL, NULL, 0, &obj, 0)) STACK_ERROR;

	push	0
	mov	ecx, DWORD PTR _c$70305[ebp]
	mov	edx, DWORD PTR [ecx+20]
	push	edx
	lea	eax, DWORD PTR _obj$[ebp]
	push	eax
	mov	ecx, DWORD PTR _cntxt$[ebp]
	push	ecx
	call	_qry_obj_idfield
	add	esp, 16					; 00000010H
	test	eax, eax
	jne	SHORT $L70314
	push	0
	lea	edx, DWORD PTR _obj$[ebp]
	push	edx
	push	0
	push	0
	push	0
	push	0
	push	0
	push	0
	lea	eax, DWORD PTR _lbl$[ebp]
	push	eax
	push	0
	push	0
	mov	ecx, DWORD PTR _cntxt$[ebp]
	push	ecx
	call	_qry_obj_label
	add	esp, 48					; 00000030H
	test	eax, eax
	je	SHORT $L70313
$L70314:
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 114		; 00000072H
	jmp	$eva_err$70279
$L70313:

; 115  : 		if(sql) DYNBUF_ADD_STR(&sql, "\n");

	cmp	DWORD PTR _sql$[ebp], 0
	je	SHORT $L70317
	push	0
	push	0
	push	1
	push	OFFSET FLAT:$SG70318
	lea	eax, DWORD PTR _sql$[ebp]
	push	eax
	call	_dynbuf_add
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L70317
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29872], OFFSET FLAT:$SG70320
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 115		; 00000073H
	jmp	$eva_err$70279
$L70317:

; 116  : 		DYNBUF_ADD_BUF(&sql, lbl, NO_CONV);

	cmp	DWORD PTR _lbl$[ebp], 0
	je	SHORT $L70322
	push	0
	push	0
	mov	eax, DWORD PTR _lbl$[ebp]
	mov	ecx, DWORD PTR [eax+4]
	push	ecx
	mov	edx, DWORD PTR _lbl$[ebp]
	add	edx, 8
	push	edx
	lea	eax, DWORD PTR _sql$[ebp]
	push	eax
	call	_dynbuf_add
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L70322
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29872], OFFSET FLAT:$SG70324
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 116		; 00000074H
	jmp	$eva_err$70279
$L70322:

; 117  : 		j++;

	mov	eax, DWORD PTR _j$[ebp]
	add	eax, 1
	mov	DWORD PTR _j$[ebp], eax

; 118  : 
; 119  : 		/* If next image is different */
; 120  : 		if(dyntab_cmp(&data, i, 0, &data, i + 1, 0))

	push	0
	mov	ecx, DWORD PTR _i$[ebp]
	add	ecx, 1
	push	ecx
	lea	edx, DWORD PTR _data$[ebp]
	push	edx
	push	0
	mov	eax, DWORD PTR _i$[ebp]
	push	eax
	lea	ecx, DWORD PTR _data$[ebp]
	push	ecx
	call	_dyntab_cmp
	add	esp, 24					; 00000018H
	test	eax, eax
	je	$L70325

; 122  : 			unsigned long w = 0, h;

	mov	DWORD PTR _w$70326[ebp], 0

; 123  : 
; 124  : 			/* Strip if index list */
; 125  : 			if(strip && wsum > strip)

	cmp	DWORD PTR _strip$[ebp], 0
	je	SHORT $L70328
	mov	edx, DWORD PTR _wsum$[ebp]
	cmp	edx, DWORD PTR _strip$[ebp]
	jbe	SHORT $L70328

; 127  : 				b_strip = 1;

	mov	DWORD PTR _b_strip$[ebp], 1

; 128  : 				break;

	jmp	$L70304
$L70328:

; 130  : 
; 131  : 			/* Build button name for list display if more than one object for image */
; 132  : 			M_FREE(name);

	mov	eax, DWORD PTR _name$[ebp]
	push	eax
	call	_mem_free
	add	esp, 4
	mov	DWORD PTR _name$[ebp], 0

; 133  : 			if(j > 1)

	cmp	DWORD PTR _j$[ebp], 1
	jbe	$L70349

; 135  : 				DYNBUF_ADD_BUF(&name, ctrl->cginame, NO_CONV);

	mov	ecx, DWORD PTR _ctrl$[ebp]
	cmp	DWORD PTR [ecx+40], 0
	je	SHORT $L70331
	push	0
	push	0
	mov	edx, DWORD PTR _ctrl$[ebp]
	mov	eax, DWORD PTR [edx+40]
	mov	ecx, DWORD PTR [eax+4]
	push	ecx
	mov	edx, DWORD PTR _ctrl$[ebp]
	mov	eax, DWORD PTR [edx+40]
	add	eax, 8
	push	eax
	lea	ecx, DWORD PTR _name$[ebp]
	push	ecx
	call	_dynbuf_add
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L70331
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29872], OFFSET FLAT:$SG70333
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 135		; 00000087H
	jmp	$eva_err$70279
$L70331:

; 136  : 				name->data[0] = 'B';

	mov	ecx, DWORD PTR _name$[ebp]
	mov	BYTE PTR [ecx+8], 66			; 00000042H

; 137  : 				DYNBUF_ADD3_INT(&name, ".IMG$", c->IdValue, "");

	push	0
	push	OFFSET FLAT:$SG70335
	mov	edx, DWORD PTR _c$70305[ebp]
	mov	eax, DWORD PTR [edx+32]
	push	eax
	push	5
	push	OFFSET FLAT:$SG70336
	lea	ecx, DWORD PTR _name$[ebp]
	push	ecx
	call	_dynbuf_add3_int
	add	esp, 24					; 00000018H
	test	eax, eax
	je	SHORT $L70334
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29872], OFFSET FLAT:$SG70338
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 137		; 00000089H
	jmp	$eva_err$70279
$L70334:

; 138  : 				if(isel != ~0UL)

	cmp	DWORD PTR _isel$[ebp], -1
	je	$L70349

; 140  : 					unsigned long idval = DYNTAB_TOULRC(&cat->k[lvl].val, isel, col_IdVal);

	push	10					; 0000000aH
	push	0
	push	0
	mov	ecx, DWORD PTR _isel$[ebp]
	push	ecx
	mov	edx, DWORD PTR _lvl$[ebp]
	imul	edx, 36					; 00000024H
	mov	eax, DWORD PTR _cat$[ebp]
	mov	ecx, DWORD PTR [eax+164]
	lea	edx, DWORD PTR [ecx+edx+16]
	push	edx
	call	_dyntab_val
	add	esp, 12					; 0000000cH
	push	eax
	call	_strtoul
	add	esp, 12					; 0000000cH
	mov	DWORD PTR _idval$70340[ebp], eax

; 141  : 					unsigned long idrel = DYNTAB_TOULRC(&cat->k[lvl].val, isel, col_IdRel);

	push	10					; 0000000aH
	push	0
	push	1
	mov	eax, DWORD PTR _isel$[ebp]
	push	eax
	mov	ecx, DWORD PTR _lvl$[ebp]
	imul	ecx, 36					; 00000024H
	mov	edx, DWORD PTR _cat$[ebp]
	mov	eax, DWORD PTR [edx+164]
	lea	ecx, DWORD PTR [eax+ecx+16]
	push	ecx
	call	_dyntab_val
	add	esp, 12					; 0000000cH
	push	eax
	call	_strtoul
	add	esp, 12					; 0000000cH
	mov	DWORD PTR _idrel$70342[ebp], eax

; 142  : 					DYNBUF_ADD3_INT(&name, ".", idval ? idval : idrel, ".");

	cmp	DWORD PTR _idval$70340[ebp], 0
	je	SHORT $L71518
	mov	edx, DWORD PTR _idval$70340[ebp]
	mov	DWORD PTR -4256+[ebp], edx
	jmp	SHORT $L71519
$L71518:
	mov	eax, DWORD PTR _idrel$70342[ebp]
	mov	DWORD PTR -4256+[ebp], eax
$L71519:
	push	1
	push	OFFSET FLAT:$SG70345
	mov	ecx, DWORD PTR -4256+[ebp]
	push	ecx
	push	1
	push	OFFSET FLAT:$SG70346
	lea	edx, DWORD PTR _name$[ebp]
	push	edx
	call	_dynbuf_add3_int
	add	esp, 24					; 00000018H
	test	eax, eax
	je	SHORT $L70344
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29872], OFFSET FLAT:$SG70348
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 142		; 0000008eH
	jmp	$eva_err$70279
$L70344:

; 143  : 					DYNBUF_ADD_INT(&name, idrel ? 1 : 0);

	xor	edx, edx
	cmp	DWORD PTR _idrel$70342[ebp], 0
	setne	dl
	push	edx
	lea	eax, DWORD PTR _name$[ebp]
	push	eax
	call	_dynbuf_add_int
	add	esp, 8
	test	eax, eax
	je	SHORT $L70349
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29872], OFFSET FLAT:$SG70351
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 143		; 0000008fH
	jmp	$eva_err$70279
$L70349:

; 146  : 
; 147  : 			/* Output half size image */
; 148  : 			if(b_dyn_size)

	cmp	DWORD PTR _b_dyn_size$[ebp], 0
	je	$L70352

; 150  : 				/* Traitement cas sans dimensions (pour bricometal) */
; 151  : 				char path[4096], dh[16], dw[16];
; 152  : 				snprintf(add_sz_str(path), "../docs/%s/%s/%s", cntxt->dbname, imgdir, c->txt);

	mov	eax, DWORD PTR _c$70305[ebp]
	mov	ecx, DWORD PTR [eax]
	push	ecx
	mov	edx, DWORD PTR _imgdir$[ebp]
	push	edx
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	ecx, DWORD PTR [eax+29804]
	push	ecx
	push	OFFSET FLAT:$SG70356
	push	4095					; 00000fffH
	lea	edx, DWORD PTR _path$70353[ebp]
	push	edx
	call	__snprintf
	add	esp, 24					; 00000018H

; 153  : 				get_image_size(path, &w, &h);

	lea	eax, DWORD PTR _h$70327[ebp]
	push	eax
	lea	ecx, DWORD PTR _w$70326[ebp]
	push	ecx
	lea	edx, DWORD PTR _path$70353[ebp]
	push	edx
	call	_get_image_size
	add	esp, 12					; 0000000cH

; 154  : 				w /= 2; h /= 2;

	mov	eax, DWORD PTR _w$70326[ebp]
	shr	eax, 1
	mov	DWORD PTR _w$70326[ebp], eax
	mov	ecx, DWORD PTR _h$70327[ebp]
	shr	ecx, 1
	mov	DWORD PTR _h$70327[ebp], ecx

; 155  : 				snprintf(add_sz_str(dw), "%lu", w);

	mov	edx, DWORD PTR _w$70326[ebp]
	push	edx
	push	OFFSET FLAT:$SG70357
	push	15					; 0000000fH
	lea	eax, DWORD PTR _dw$70355[ebp]
	push	eax
	call	__snprintf
	add	esp, 16					; 00000010H

; 156  : 				snprintf(add_sz_str(dh), "%lu", h);

	mov	ecx, DWORD PTR _h$70327[ebp]
	push	ecx
	push	OFFSET FLAT:$SG70358
	push	15					; 0000000fH
	lea	edx, DWORD PTR _dh$70354[ebp]
	push	edx
	call	__snprintf
	add	esp, 16					; 00000010H

; 157  : 				if(put_html_image_dir(cntxt, name ? name->data : NULL, imgdir, c->txt, sql ? sql->data : NULL,
; 158  : 												dw, dh, 0, c->IdObj, NULL, NULL)) STACK_ERROR;

	cmp	DWORD PTR _sql$[ebp], 0
	je	SHORT $L71520
	mov	eax, DWORD PTR _sql$[ebp]
	add	eax, 8
	mov	DWORD PTR -4260+[ebp], eax
	jmp	SHORT $L71521
$L71520:
	mov	DWORD PTR -4260+[ebp], 0
$L71521:
	cmp	DWORD PTR _name$[ebp], 0
	je	SHORT $L71522
	mov	ecx, DWORD PTR _name$[ebp]
	add	ecx, 8
	mov	DWORD PTR -4264+[ebp], ecx
	jmp	SHORT $L71523
$L71522:
	mov	DWORD PTR -4264+[ebp], 0
$L71523:
	push	0
	push	0
	mov	edx, DWORD PTR _c$70305[ebp]
	mov	eax, DWORD PTR [edx+20]
	push	eax
	push	0
	lea	ecx, DWORD PTR _dh$70354[ebp]
	push	ecx
	lea	edx, DWORD PTR _dw$70355[ebp]
	push	edx
	mov	eax, DWORD PTR -4260+[ebp]
	push	eax
	mov	ecx, DWORD PTR _c$70305[ebp]
	mov	edx, DWORD PTR [ecx]
	push	edx
	mov	eax, DWORD PTR _imgdir$[ebp]
	push	eax
	mov	ecx, DWORD PTR -4264+[ebp]
	push	ecx
	mov	edx, DWORD PTR _cntxt$[ebp]
	push	edx
	call	_put_html_image_dir
	add	esp, 44					; 0000002cH
	test	eax, eax
	je	SHORT $L70363
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 158		; 0000009eH
	jmp	$eva_err$70279
$L70363:

; 160  : 			else

	jmp	$L70369
$L70352:

; 162  : 				if(put_html_image_dir(cntxt, name ? name->data : NULL, imgdir, c->txt, sql ? sql->data : NULL,
; 163  : 												cat->dw2, cat->dh2, 0, c->IdObj, strip ? &w : NULL, NULL)) STACK_ERROR;

	cmp	DWORD PTR _sql$[ebp], 0
	je	SHORT $L71524
	mov	ecx, DWORD PTR _sql$[ebp]
	add	ecx, 8
	mov	DWORD PTR -4268+[ebp], ecx
	jmp	SHORT $L71525
$L71524:
	mov	DWORD PTR -4268+[ebp], 0
$L71525:
	cmp	DWORD PTR _name$[ebp], 0
	je	SHORT $L71526
	mov	edx, DWORD PTR _name$[ebp]
	add	edx, 8
	mov	DWORD PTR -4272+[ebp], edx
	jmp	SHORT $L71527
$L71526:
	mov	DWORD PTR -4272+[ebp], 0
$L71527:
	push	0
	mov	eax, DWORD PTR _strip$[ebp]
	neg	eax
	sbb	eax, eax
	lea	ecx, DWORD PTR _w$70326[ebp]
	and	eax, ecx
	push	eax
	mov	edx, DWORD PTR _c$70305[ebp]
	mov	eax, DWORD PTR [edx+20]
	push	eax
	push	0
	mov	ecx, DWORD PTR _cat$[ebp]
	add	ecx, 112				; 00000070H
	push	ecx
	mov	edx, DWORD PTR _cat$[ebp]
	add	edx, 96					; 00000060H
	push	edx
	mov	eax, DWORD PTR -4268+[ebp]
	push	eax
	mov	ecx, DWORD PTR _c$70305[ebp]
	mov	edx, DWORD PTR [ecx]
	push	edx
	mov	eax, DWORD PTR _imgdir$[ebp]
	push	eax
	mov	ecx, DWORD PTR -4272+[ebp]
	push	ecx
	mov	edx, DWORD PTR _cntxt$[ebp]
	push	edx
	call	_put_html_image_dir
	add	esp, 44					; 0000002cH
	test	eax, eax
	je	SHORT $L70369
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 163		; 000000a3H
	jmp	$eva_err$70279
$L70369:

; 165  : 
; 166  : 			if(strip) wsum += w + 5;

	cmp	DWORD PTR _strip$[ebp], 0
	je	SHORT $L70370
	mov	ecx, DWORD PTR _w$70326[ebp]
	mov	edx, DWORD PTR _wsum$[ebp]
	lea	eax, DWORD PTR [edx+ecx+5]
	mov	DWORD PTR _wsum$[ebp], eax
$L70370:

; 167  : 			DYNBUF_ADD_STR(html, " ");

	push	0
	push	0
	push	1
	push	OFFSET FLAT:$SG70373
	mov	ecx, DWORD PTR _html$[ebp]
	push	ecx
	call	_dynbuf_add
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L70372
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29872], OFFSET FLAT:$SG70375
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 167		; 000000a7H
	jmp	$eva_err$70279
$L70372:

; 168  : 
; 169  : 			/* Skip images in order to get a sample of available images (when numerous) */
; 170  : 			if(strip)

	cmp	DWORD PTR _strip$[ebp], 0
	je	$L70379

; 172  : 				/* Calc position equivalent to occupied space */
; 173  : 				unsigned long pos = (unsigned long) (1.0 * data.nbrows / (strip + 10) * wsum);

	mov	ecx, DWORD PTR _data$[ebp]
	mov	DWORD PTR -4280+[ebp], ecx
	mov	DWORD PTR -4280+[ebp+4], 0
	fild	QWORD PTR -4280+[ebp]
	fmul	QWORD PTR __real@8@3fff8000000000000000
	mov	edx, DWORD PTR _strip$[ebp]
	add	edx, 10					; 0000000aH
	mov	DWORD PTR -4288+[ebp], edx
	mov	DWORD PTR -4288+[ebp+4], 0
	fild	QWORD PTR -4288+[ebp]
	fdivp	ST(1), ST(0)
	mov	eax, DWORD PTR _wsum$[ebp]
	mov	DWORD PTR -4296+[ebp], eax
	mov	DWORD PTR -4296+[ebp+4], 0
	fild	QWORD PTR -4296+[ebp]
	fmulp	ST(1), ST(0)
	call	__ftol
	mov	DWORD PTR _pos$70377[ebp], eax

; 174  : 				if(pos > i && dyntab_cmp(&data, i + 1, 0, &data, pos, 0))

	mov	ecx, DWORD PTR _pos$70377[ebp]
	cmp	ecx, DWORD PTR _i$[ebp]
	jbe	$L70379
	push	0
	mov	edx, DWORD PTR _pos$70377[ebp]
	push	edx
	lea	eax, DWORD PTR _data$[ebp]
	push	eax
	push	0
	mov	ecx, DWORD PTR _i$[ebp]
	add	ecx, 1
	push	ecx
	lea	edx, DWORD PTR _data$[ebp]
	push	edx
	call	_dyntab_cmp
	add	esp, 24					; 00000018H
	test	eax, eax
	je	SHORT $L70379

; 176  : 					if(pos >= data.nbrows) pos = data.nbrows - 1;

	mov	eax, DWORD PTR _pos$70377[ebp]
	cmp	eax, DWORD PTR _data$[ebp]
	jb	SHORT $L70380
	mov	ecx, DWORD PTR _data$[ebp]
	sub	ecx, 1
	mov	DWORD PTR _pos$70377[ebp], ecx
$L70380:

; 177  : 					while(!dyntab_cmp(&data, pos - 1, 0, &data, pos, 0)) pos--;

	push	0
	mov	edx, DWORD PTR _pos$70377[ebp]
	push	edx
	lea	eax, DWORD PTR _data$[ebp]
	push	eax
	push	0
	mov	ecx, DWORD PTR _pos$70377[ebp]
	sub	ecx, 1
	push	ecx
	lea	edx, DWORD PTR _data$[ebp]
	push	edx
	call	_dyntab_cmp
	add	esp, 24					; 00000018H
	test	eax, eax
	jne	SHORT $L70383
	mov	eax, DWORD PTR _pos$70377[ebp]
	sub	eax, 1
	mov	DWORD PTR _pos$70377[ebp], eax
	jmp	SHORT $L70380
$L70383:

; 178  : 					i = pos - 1;

	mov	ecx, DWORD PTR _pos$70377[ebp]
	sub	ecx, 1
	mov	DWORD PTR _i$[ebp], ecx

; 179  : 					b_strip = 1;

	mov	DWORD PTR _b_strip$[ebp], 1
$L70379:

; 182  : 			M_FREE(sql); j = 0;

	mov	edx, DWORD PTR _sql$[ebp]
	push	edx
	call	_mem_free
	add	esp, 4
	mov	DWORD PTR _sql$[ebp], 0
	mov	DWORD PTR _j$[ebp], 0
$L70325:

; 184  : 	}

	jmp	$L70303
$L70304:

; 185  : 	if(b_strip) DYNBUF_ADD_STR(html, " <font size=4><b>...");

	cmp	DWORD PTR _b_strip$[ebp], 0
	je	SHORT $L70386
	push	0
	push	0
	push	20					; 00000014H
	push	OFFSET FLAT:$SG70387
	mov	eax, DWORD PTR _html$[ebp]
	push	eax
	call	_dynbuf_add
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L70386
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29872], OFFSET FLAT:$SG70389
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 185		; 000000b9H
	jmp	SHORT $eva_err$70279
$L70386:
$eva_noerr$70390:

; 186  : 
; 187  : 	RETURN_OK_CLEANUP;

	push	0
	push	OFFSET FLAT:$SG70391
	push	OFFSET FLAT:$SG70392
	mov	eax, DWORD PTR _cntxt$[ebp]
	push	eax
	call	_err_clear
	add	esp, 16					; 00000010H
$eva_err$70279:
	mov	ecx, DWORD PTR _cntxt$[ebp]
	cmp	DWORD PTR [ecx+29872], 0
	je	SHORT $L70393
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	eax, DWORD PTR [edx+29900]
	push	eax
	push	OFFSET FLAT:$SG70394
	push	OFFSET FLAT:$SG70395
	mov	ecx, DWORD PTR _cntxt$[ebp]
	push	ecx
	call	_err_add_context
	add	esp, 16					; 00000010H
$L70393:
	lea	edx, DWORD PTR _data$[ebp]
	push	edx
	call	_dyntab_free
	add	esp, 4
	lea	eax, DWORD PTR _obj$[ebp]
	push	eax
	call	_dyntab_free
	add	esp, 4
	mov	ecx, DWORD PTR _sql$[ebp]
	push	ecx
	call	_mem_free
	add	esp, 4
	mov	DWORD PTR _sql$[ebp], 0
	mov	edx, DWORD PTR _lbl$[ebp]
	push	edx
	call	_mem_free
	add	esp, 4
	mov	DWORD PTR _lbl$[ebp], 0
	mov	eax, DWORD PTR _name$[ebp]
	push	eax
	call	_mem_free
	add	esp, 4
	mov	DWORD PTR _name$[ebp], 0
	mov	ecx, DWORD PTR _cntxt$[ebp]
	xor	eax, eax
	cmp	DWORD PTR [ecx+29872], 0
	setne	al
$L70252:

; 188  : }

	mov	esp, ebp
	pop	ebp
	ret	0
_output_catalog_sublist ENDP
_TEXT	ENDS
PUBLIC	_read_lower_idobj
EXTRN	_dyntab_sz:NEAR
EXTRN	_sql_get_buf:NEAR
_DATA	SEGMENT
	ORG $+1
$SG70423 DB	' AND ', 00H
	ORG $+2
$SG70424 DB	'-- read_lower_idobj', 0aH, 'SELECT DISTINCT IdObj FROM T'
	DB	'Link', 0aH, 'WHERE DateDel IS NULL AND IdField=', 00H
$SG70426 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70431 DB	'IdRelObj', 00H
	ORG $+3
$SG70433 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70437 DB	'IdValue', 00H
$SG70439 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70441 DB	0aH, 00H
	ORG $+2
$SG70442 DB	'=', 00H
	ORG $+2
$SG70444 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70448 DB	')', 0aH, 00H
	ORG $+1
$SG70449 DB	'AND IdObj IN (', 00H
	ORG $+1
$SG70451 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70463 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70467 DB	'D:\Travail\ABI\EVA\V4.0\CGI\Brunix-2016\ctrl_output_cata'
	DB	'log.c', 00H
	ORG $+2
$SG70468 DB	'read_lower_idobj', 00H
	ORG $+3
$SG70470 DB	'D:\Travail\ABI\EVA\V4.0\CGI\Brunix-2016\ctrl_output_cata'
	DB	'log.c', 00H
	ORG $+2
$SG70471 DB	'read_lower_idobj', 00H
_DATA	ENDS
_TEXT	SEGMENT
_cntxt$ = 8
_cat$ = 12
_idobj$ = 16
_nbobj$ = 20
_lvl$ = 24
_i$ = 28
_sql$ = -4
_idval$ = -12
_idrel$ = -8
_read_lower_idobj PROC NEAR

; 205  : ){

	push	ebp
	mov	ebp, esp
	sub	esp, 24					; 00000018H

; 206  : 	DynBuffer *sql = NULL;

	mov	DWORD PTR _sql$[ebp], 0

; 207  : 
; 208  : 	/* Get value / relation Id */
; 209  : 	unsigned long idval = DYNTAB_TOULRC(&cat->k[lvl].val, i, col_IdVal);

	push	10					; 0000000aH
	push	0
	push	0
	mov	eax, DWORD PTR _i$[ebp]
	push	eax
	mov	ecx, DWORD PTR _lvl$[ebp]
	imul	ecx, 36					; 00000024H
	mov	edx, DWORD PTR _cat$[ebp]
	mov	eax, DWORD PTR [edx+164]
	lea	ecx, DWORD PTR [eax+ecx+16]
	push	ecx
	call	_dyntab_val
	add	esp, 12					; 0000000cH
	push	eax
	call	_strtoul
	add	esp, 12					; 0000000cH
	mov	DWORD PTR _idval$[ebp], eax

; 210  : 	unsigned long idrel = DYNTAB_TOULRC(&cat->k[lvl].val, i, col_IdRel);

	push	10					; 0000000aH
	push	0
	push	1
	mov	edx, DWORD PTR _i$[ebp]
	push	edx
	mov	eax, DWORD PTR _lvl$[ebp]
	imul	eax, 36					; 00000024H
	mov	ecx, DWORD PTR _cat$[ebp]
	mov	edx, DWORD PTR [ecx+164]
	lea	eax, DWORD PTR [edx+eax+16]
	push	eax
	call	_dyntab_val
	add	esp, 12					; 0000000cH
	push	eax
	call	_strtoul
	add	esp, 12					; 0000000cH
	mov	DWORD PTR _idrel$[ebp], eax

; 211  : 
; 212  : 	if(idval || idrel)

	cmp	DWORD PTR _idval$[ebp], 0
	jne	SHORT $L70420
	cmp	DWORD PTR _idrel$[ebp], 0
	je	$L70419
$L70420:

; 214  : 		if(cat->id)

	mov	ecx, DWORD PTR _cat$[ebp]
	cmp	DWORD PTR [ecx+156], 0
	je	$L70421

; 217  : 				"-- read_lower_idobj\n"
; 218  : 				"SELECT DISTINCT IdObj FROM TLink\n"
; 219  : 				"WHERE DateDel IS NULL AND IdField=", cat->k[lvl].idfld, " AND ");

	push	5
	push	OFFSET FLAT:$SG70423
	mov	edx, DWORD PTR _lvl$[ebp]
	imul	edx, 36					; 00000024H
	mov	eax, DWORD PTR _cat$[ebp]
	mov	ecx, DWORD PTR [eax+164]
	mov	edx, DWORD PTR [ecx+edx]
	push	edx
	push	87					; 00000057H
	push	OFFSET FLAT:$SG70424
	lea	eax, DWORD PTR _sql$[ebp]
	push	eax
	call	_dynbuf_add3_int
	add	esp, 24					; 00000018H
	test	eax, eax
	je	SHORT $L70422
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29872], OFFSET FLAT:$SG70426
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 219		; 000000dbH
	jmp	$eva_err$70427
$L70422:

; 220  : 			if(idrel) DYNBUF_ADD_STR(&sql, "IdRelObj")

	cmp	DWORD PTR _idrel$[ebp], 0
	je	SHORT $L70428
	push	0
	push	0
	push	8
	push	OFFSET FLAT:$SG70431
	lea	eax, DWORD PTR _sql$[ebp]
	push	eax
	call	_dynbuf_add
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L70430
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29872], OFFSET FLAT:$SG70433
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 220		; 000000dcH
	jmp	$eva_err$70427
$L70430:

; 221  : 			else DYNBUF_ADD_STR(&sql, "IdValue");

	jmp	SHORT $L70436
$L70428:
	push	0
	push	0
	push	7
	push	OFFSET FLAT:$SG70437
	lea	eax, DWORD PTR _sql$[ebp]
	push	eax
	call	_dynbuf_add
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L70436
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29872], OFFSET FLAT:$SG70439
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 221		; 000000ddH
	jmp	$eva_err$70427
$L70436:

; 222  : 			DYNBUF_ADD3_INT(&sql, "=", idrel ? idrel : idval, "\n");

	cmp	DWORD PTR _idrel$[ebp], 0
	je	SHORT $L71534
	mov	eax, DWORD PTR _idrel$[ebp]
	mov	DWORD PTR -16+[ebp], eax
	jmp	SHORT $L71535
$L71534:
	mov	ecx, DWORD PTR _idval$[ebp]
	mov	DWORD PTR -16+[ebp], ecx
$L71535:
	push	1
	push	OFFSET FLAT:$SG70441
	mov	edx, DWORD PTR -16+[ebp]
	push	edx
	push	1
	push	OFFSET FLAT:$SG70442
	lea	eax, DWORD PTR _sql$[ebp]
	push	eax
	call	_dynbuf_add3_int
	add	esp, 24					; 00000018H
	test	eax, eax
	je	SHORT $L70440
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29872], OFFSET FLAT:$SG70444
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 222		; 000000deH
	jmp	$eva_err$70427
$L70440:

; 224  : 				"AND IdObj IN (", cat->id, NO_CONV, ")\n");

	mov	eax, DWORD PTR _cat$[ebp]
	cmp	DWORD PTR [eax+156], 0
	je	SHORT $L71536
	mov	ecx, DWORD PTR _cat$[ebp]
	mov	edx, DWORD PTR [ecx+156]
	mov	eax, DWORD PTR [edx+4]
	mov	DWORD PTR -20+[ebp], eax
	jmp	SHORT $L71537
$L71536:
	mov	DWORD PTR -20+[ebp], 0
$L71537:
	mov	ecx, DWORD PTR _cat$[ebp]
	cmp	DWORD PTR [ecx+156], 0
	je	SHORT $L71538
	mov	edx, DWORD PTR _cat$[ebp]
	mov	eax, DWORD PTR [edx+156]
	add	eax, 8
	mov	DWORD PTR -24+[ebp], eax
	jmp	SHORT $L71539
$L71538:
	mov	DWORD PTR -24+[ebp], 0
$L71539:
	push	2
	push	OFFSET FLAT:$SG70448
	push	0
	push	0
	mov	ecx, DWORD PTR -20+[ebp]
	push	ecx
	mov	edx, DWORD PTR -24+[ebp]
	push	edx
	push	14					; 0000000eH
	push	OFFSET FLAT:$SG70449
	lea	eax, DWORD PTR _sql$[ebp]
	push	eax
	call	_dynbuf_add3
	add	esp, 36					; 00000024H
	test	eax, eax
	je	SHORT $L70447
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29872], OFFSET FLAT:$SG70451
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 224		; 000000e0H
	jmp	$eva_err$70427
$L70447:

; 225  : 			if(sql_exec_query(cntxt, sql->data) || sql_get_buf(cntxt, idobj, 2)) STACK_ERROR;

	mov	eax, DWORD PTR _sql$[ebp]
	add	eax, 8
	push	eax
	mov	ecx, DWORD PTR _cntxt$[ebp]
	push	ecx
	call	_sql_exec_query
	add	esp, 8
	test	eax, eax
	jne	SHORT $L70453
	push	2
	mov	edx, DWORD PTR _idobj$[ebp]
	push	edx
	mov	eax, DWORD PTR _cntxt$[ebp]
	push	eax
	call	_sql_get_buf
	add	esp, 12					; 0000000cH
	test	eax, eax
	je	SHORT $L70452
$L70453:
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 225		; 000000e1H
	jmp	$eva_err$70427
$L70452:

; 226  : 			if(nbobj) *nbobj = cntxt->sql_nbrows;

	cmp	DWORD PTR _nbobj$[ebp], 0
	je	SHORT $L70454
	mov	edx, DWORD PTR _nbobj$[ebp]
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	ecx, DWORD PTR [eax+29848]
	mov	DWORD PTR [edx], ecx
$L70454:

; 228  : 		else

	jmp	SHORT $L70457
$L70421:

; 230  : 			if(idobj) M_FREE(*idobj);

	cmp	DWORD PTR _idobj$[ebp], 0
	je	SHORT $L70456
	mov	edx, DWORD PTR _idobj$[ebp]
	mov	eax, DWORD PTR [edx]
	push	eax
	call	_mem_free
	add	esp, 4
	mov	ecx, DWORD PTR _idobj$[ebp]
	mov	DWORD PTR [ecx], 0
$L70456:

; 231  : 			if(nbobj) *nbobj = 0;

	cmp	DWORD PTR _nbobj$[ebp], 0
	je	SHORT $L70457
	mov	edx, DWORD PTR _nbobj$[ebp]
	mov	DWORD PTR [edx], 0
$L70457:

; 234  : 	else if(idobj)

	jmp	$L70464
$L70419:
	cmp	DWORD PTR _idobj$[ebp], 0
	je	$L70464

; 236  : 		/* Handle empty value */
; 237  : 		M_FREE(*idobj);

	mov	eax, DWORD PTR _idobj$[ebp]
	mov	ecx, DWORD PTR [eax]
	push	ecx
	call	_mem_free
	add	esp, 4
	mov	edx, DWORD PTR _idobj$[ebp]
	mov	DWORD PTR [edx], 0

; 238  : 		DYNBUF_ADD_CELL(idobj, &cat->k[lvl].val, i, col_IdObj, NO_CONV);

	push	0
	push	0
	push	3
	mov	eax, DWORD PTR _i$[ebp]
	push	eax
	mov	ecx, DWORD PTR _lvl$[ebp]
	imul	ecx, 36					; 00000024H
	mov	edx, DWORD PTR _cat$[ebp]
	mov	eax, DWORD PTR [edx+164]
	lea	ecx, DWORD PTR [eax+ecx+16]
	push	ecx
	call	_dyntab_sz
	add	esp, 12					; 0000000cH
	push	eax
	push	3
	mov	edx, DWORD PTR _i$[ebp]
	push	edx
	mov	eax, DWORD PTR _lvl$[ebp]
	imul	eax, 36					; 00000024H
	mov	ecx, DWORD PTR _cat$[ebp]
	mov	edx, DWORD PTR [ecx+164]
	lea	eax, DWORD PTR [edx+eax+16]
	push	eax
	call	_dyntab_val
	add	esp, 12					; 0000000cH
	push	eax
	mov	ecx, DWORD PTR _idobj$[ebp]
	push	ecx
	call	_dynbuf_add
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L70461
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29872], OFFSET FLAT:$SG70463
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 238		; 000000eeH
	jmp	SHORT $eva_err$70427
$L70461:

; 239  : 		if(nbobj) *nbobj = DYNTAB_TOULRC(&cat->k[lvl].val, i, col_NbObj);

	cmp	DWORD PTR _nbobj$[ebp], 0
	je	SHORT $L70464
	push	10					; 0000000aH
	push	0
	push	2
	mov	ecx, DWORD PTR _i$[ebp]
	push	ecx
	mov	edx, DWORD PTR _lvl$[ebp]
	imul	edx, 36					; 00000024H
	mov	eax, DWORD PTR _cat$[ebp]
	mov	ecx, DWORD PTR [eax+164]
	lea	edx, DWORD PTR [ecx+edx+16]
	push	edx
	call	_dyntab_val
	add	esp, 12					; 0000000cH
	push	eax
	call	_strtoul
	add	esp, 12					; 0000000cH
	mov	ecx, DWORD PTR _nbobj$[ebp]
	mov	DWORD PTR [ecx], eax
$L70464:
$eva_noerr$70466:

; 241  : 
; 242  : 	RETURN_OK_CLEANUP;

	push	0
	push	OFFSET FLAT:$SG70467
	push	OFFSET FLAT:$SG70468
	mov	edx, DWORD PTR _cntxt$[ebp]
	push	edx
	call	_err_clear
	add	esp, 16					; 00000010H
$eva_err$70427:
	mov	eax, DWORD PTR _cntxt$[ebp]
	cmp	DWORD PTR [eax+29872], 0
	je	SHORT $L70469
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	edx, DWORD PTR [ecx+29900]
	push	edx
	push	OFFSET FLAT:$SG70470
	push	OFFSET FLAT:$SG70471
	mov	eax, DWORD PTR _cntxt$[ebp]
	push	eax
	call	_err_add_context
	add	esp, 16					; 00000010H
$L70469:
	mov	ecx, DWORD PTR _sql$[ebp]
	push	ecx
	call	_mem_free
	add	esp, 4
	mov	DWORD PTR _sql$[ebp], 0
	mov	edx, DWORD PTR _cntxt$[ebp]
	xor	eax, eax
	cmp	DWORD PTR [edx+29872], 0
	setne	al

; 243  : }

	mov	esp, ebp
	pop	ebp
	ret	0
_read_lower_idobj ENDP
_TEXT	ENDS
PUBLIC	_output_value_button
EXTRN	_put_html_button_sz:NEAR
_BSS	SEGMENT
	ALIGN	4

$SG70516 DB	01H DUP (?)
_BSS	ENDS
_DATA	SEGMENT
	ORG $+3
$SG70505 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70508 DB	'.', 00H
	ORG $+2
$SG70509 DB	'.VAL$', 00H
	ORG $+2
$SG70511 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70514 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70517 DB	'.', 00H
	ORG $+2
$SG70519 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70523 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70527 DB	'???', 00H
$SG70528 DB	'D:\Travail\ABI\EVA\V4.0\CGI\Brunix-2016\ctrl_output_cata'
	DB	'log.c', 00H
	ORG $+2
$SG70529 DB	'output_value_button', 00H
$SG70531 DB	'D:\Travail\ABI\EVA\V4.0\CGI\Brunix-2016\ctrl_output_cata'
	DB	'log.c', 00H
	ORG $+2
$SG70532 DB	'output_value_button', 00H
_DATA	ENDS
_TEXT	SEGMENT
_cntxt$ = 8
_cat$ = 12
_lvl$ = 16
_i$ = 20
_img$ = 24
_imgsel$ = 28
_form$ = -8
_ctrl$ = -24
_name$ = -20
_lbl$ = -16
_idval$ = -12
_idrel$ = -4
_output_value_button PROC NEAR

; 261  : ){

	push	ebp
	mov	ebp, esp
	sub	esp, 36					; 00000024H

; 262  : 	EVA_form *form = cntxt->form;

	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	ecx, DWORD PTR [eax+80]
	mov	DWORD PTR _form$[ebp], ecx

; 263  : 	EVA_ctrl *ctrl = form->ctrl + cat->i_ctrl;

	mov	edx, DWORD PTR _cat$[ebp]
	mov	eax, DWORD PTR [edx]
	imul	eax, 480				; 000001e0H
	mov	ecx, DWORD PTR _form$[ebp]
	mov	edx, DWORD PTR [ecx]
	add	edx, eax
	mov	DWORD PTR _ctrl$[ebp], edx

; 264  : 	DynBuffer *name = NULL;

	mov	DWORD PTR _name$[ebp], 0

; 265  : 	DynBuffer *lbl = NULL;

	mov	DWORD PTR _lbl$[ebp], 0

; 266  : 	unsigned long idval = DYNTAB_TOULRC(&cat->k[lvl].val, i, col_IdVal);

	push	10					; 0000000aH
	push	0
	push	0
	mov	eax, DWORD PTR _i$[ebp]
	push	eax
	mov	ecx, DWORD PTR _lvl$[ebp]
	imul	ecx, 36					; 00000024H
	mov	edx, DWORD PTR _cat$[ebp]
	mov	eax, DWORD PTR [edx+164]
	lea	ecx, DWORD PTR [eax+ecx+16]
	push	ecx
	call	_dyntab_val
	add	esp, 12					; 0000000cH
	push	eax
	call	_strtoul
	add	esp, 12					; 0000000cH
	mov	DWORD PTR _idval$[ebp], eax

; 267  : 	unsigned long idrel = DYNTAB_TOULRC(&cat->k[lvl].val, i, col_IdRel);

	push	10					; 0000000aH
	push	0
	push	1
	mov	edx, DWORD PTR _i$[ebp]
	push	edx
	mov	eax, DWORD PTR _lvl$[ebp]
	imul	eax, 36					; 00000024H
	mov	ecx, DWORD PTR _cat$[ebp]
	mov	edx, DWORD PTR [ecx+164]
	lea	eax, DWORD PTR [edx+eax+16]
	push	eax
	call	_dyntab_val
	add	esp, 12					; 0000000cH
	push	eax
	call	_strtoul
	add	esp, 12					; 0000000cH
	mov	DWORD PTR _idrel$[ebp], eax

; 268  : 
; 269  : 	/* Do not output if empty end of tree */
; 270  : 	if(i == ~0UL || (cat->k[lvl].val.nbrows == 1 && !idval && !idrel)) RETURN_OK;

	cmp	DWORD PTR _i$[ebp], -1
	je	SHORT $L70500
	mov	ecx, DWORD PTR _lvl$[ebp]
	imul	ecx, 36					; 00000024H
	mov	edx, DWORD PTR _cat$[ebp]
	mov	eax, DWORD PTR [edx+164]
	cmp	DWORD PTR [eax+ecx+16], 1
	jne	SHORT $L70499
	cmp	DWORD PTR _idval$[ebp], 0
	jne	SHORT $L70499
	cmp	DWORD PTR _idrel$[ebp], 0
	jne	SHORT $L70499
$L70500:
	jmp	$eva_noerr$70501
$L70499:

; 271  : 
; 272  : 	/* Build button name */
; 273  : 	DYNBUF_ADD_BUF(&name, ctrl->cginame, NO_CONV);

	mov	ecx, DWORD PTR _ctrl$[ebp]
	cmp	DWORD PTR [ecx+40], 0
	je	SHORT $L70503
	push	0
	push	0
	mov	edx, DWORD PTR _ctrl$[ebp]
	mov	eax, DWORD PTR [edx+40]
	mov	ecx, DWORD PTR [eax+4]
	push	ecx
	mov	edx, DWORD PTR _ctrl$[ebp]
	mov	eax, DWORD PTR [edx+40]
	add	eax, 8
	push	eax
	lea	ecx, DWORD PTR _name$[ebp]
	push	ecx
	call	_dynbuf_add
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L70503
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29872], OFFSET FLAT:$SG70505
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 273		; 00000111H
	jmp	$eva_err$70506
$L70503:

; 274  : 	name->data[0] = 'B';

	mov	ecx, DWORD PTR _name$[ebp]
	mov	BYTE PTR [ecx+8], 66			; 00000042H

; 275  : 	DYNBUF_ADD3_INT(&name, ".VAL$", lvl, ".");

	push	1
	push	OFFSET FLAT:$SG70508
	mov	edx, DWORD PTR _lvl$[ebp]
	push	edx
	push	5
	push	OFFSET FLAT:$SG70509
	lea	eax, DWORD PTR _name$[ebp]
	push	eax
	call	_dynbuf_add3_int
	add	esp, 24					; 00000018H
	test	eax, eax
	je	SHORT $L70507
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29872], OFFSET FLAT:$SG70511
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 275		; 00000113H
	jmp	$eva_err$70506
$L70507:

; 276  : 	DYNBUF_ADD_INT(&name, idval ? idval : idrel);

	cmp	DWORD PTR _idval$[ebp], 0
	je	SHORT $L71541
	mov	eax, DWORD PTR _idval$[ebp]
	mov	DWORD PTR -28+[ebp], eax
	jmp	SHORT $L71542
$L71541:
	mov	ecx, DWORD PTR _idrel$[ebp]
	mov	DWORD PTR -28+[ebp], ecx
$L71542:
	mov	edx, DWORD PTR -28+[ebp]
	push	edx
	lea	eax, DWORD PTR _name$[ebp]
	push	eax
	call	_dynbuf_add_int
	add	esp, 8
	test	eax, eax
	je	SHORT $L70512
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29872], OFFSET FLAT:$SG70514
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 276		; 00000114H
	jmp	$eva_err$70506
$L70512:

; 277  : 	DYNBUF_ADD3_INT(&name, ".", (!idval && idrel) ? 1 : 0, "");

	cmp	DWORD PTR _idval$[ebp], 0
	jne	SHORT $L71543
	cmp	DWORD PTR _idrel$[ebp], 0
	je	SHORT $L71543
	mov	DWORD PTR -32+[ebp], 1
	jmp	SHORT $L71544
$L71543:
	mov	DWORD PTR -32+[ebp], 0
$L71544:
	push	0
	push	OFFSET FLAT:$SG70516
	mov	eax, DWORD PTR -32+[ebp]
	push	eax
	push	1
	push	OFFSET FLAT:$SG70517
	lea	ecx, DWORD PTR _name$[ebp]
	push	ecx
	call	_dynbuf_add3_int
	add	esp, 24					; 00000018H
	test	eax, eax
	je	SHORT $L70515
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29872], OFFSET FLAT:$SG70519
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 277		; 00000115H
	jmp	$eva_err$70506
$L70515:

; 278  : 
; 279  : 	/* Build button label */
; 280  : 	DYNBUF_ADD_CELL(&lbl, &cat->k[lvl].val, i, col_Label, NO_CONV);

	push	0
	push	0
	push	4
	mov	ecx, DWORD PTR _i$[ebp]
	push	ecx
	mov	edx, DWORD PTR _lvl$[ebp]
	imul	edx, 36					; 00000024H
	mov	eax, DWORD PTR _cat$[ebp]
	mov	ecx, DWORD PTR [eax+164]
	lea	edx, DWORD PTR [ecx+edx+16]
	push	edx
	call	_dyntab_sz
	add	esp, 12					; 0000000cH
	push	eax
	push	4
	mov	eax, DWORD PTR _i$[ebp]
	push	eax
	mov	ecx, DWORD PTR _lvl$[ebp]
	imul	ecx, 36					; 00000024H
	mov	edx, DWORD PTR _cat$[ebp]
	mov	eax, DWORD PTR [edx+164]
	lea	ecx, DWORD PTR [eax+ecx+16]
	push	ecx
	call	_dyntab_val
	add	esp, 12					; 0000000cH
	push	eax
	lea	edx, DWORD PTR _lbl$[ebp]
	push	edx
	call	_dynbuf_add
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L70521
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29872], OFFSET FLAT:$SG70523
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 280		; 00000118H
	jmp	SHORT $eva_err$70506
$L70521:

; 281  : 	if(put_html_button(cntxt, name->data, lbl ? lbl->data : "???",
; 282  : 		img, imgsel, NULL, 0, 12 | (imgsel ? 0 : 1))) STACK_ERROR;

	cmp	DWORD PTR _lbl$[ebp], 0
	je	SHORT $L71545
	mov	edx, DWORD PTR _lbl$[ebp]
	add	edx, 8
	mov	DWORD PTR -36+[ebp], edx
	jmp	SHORT $L71546
$L71545:
	mov	DWORD PTR -36+[ebp], OFFSET FLAT:$SG70527
$L71546:
	xor	eax, eax
	cmp	DWORD PTR _imgsel$[ebp], 0
	sete	al
	or	al, 12					; 0000000cH
	push	eax
	push	0
	push	0
	push	0
	push	0
	push	0
	mov	ecx, DWORD PTR _imgsel$[ebp]
	push	ecx
	mov	edx, DWORD PTR _img$[ebp]
	push	edx
	mov	eax, DWORD PTR -36+[ebp]
	push	eax
	mov	ecx, DWORD PTR _name$[ebp]
	add	ecx, 8
	push	ecx
	mov	edx, DWORD PTR _cntxt$[ebp]
	push	edx
	call	_put_html_button_sz
	add	esp, 44					; 0000002cH
	test	eax, eax
	je	SHORT $eva_noerr$70501
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 282		; 0000011aH
	jmp	SHORT $eva_err$70506
$eva_noerr$70501:

; 283  : 
; 284  : 	RETURN_OK_CLEANUP;

	push	0
	push	OFFSET FLAT:$SG70528
	push	OFFSET FLAT:$SG70529
	mov	ecx, DWORD PTR _cntxt$[ebp]
	push	ecx
	call	_err_clear
	add	esp, 16					; 00000010H
$eva_err$70506:
	mov	edx, DWORD PTR _cntxt$[ebp]
	cmp	DWORD PTR [edx+29872], 0
	je	SHORT $L70530
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	ecx, DWORD PTR [eax+29900]
	push	ecx
	push	OFFSET FLAT:$SG70531
	push	OFFSET FLAT:$SG70532
	mov	edx, DWORD PTR _cntxt$[ebp]
	push	edx
	call	_err_add_context
	add	esp, 16					; 00000010H
$L70530:
	mov	eax, DWORD PTR _name$[ebp]
	push	eax
	call	_mem_free
	add	esp, 4
	mov	DWORD PTR _name$[ebp], 0
	mov	ecx, DWORD PTR _lbl$[ebp]
	push	ecx
	call	_mem_free
	add	esp, 4
	mov	DWORD PTR _lbl$[ebp], 0
	mov	edx, DWORD PTR _cntxt$[ebp]
	xor	eax, eax
	cmp	DWORD PTR [edx+29872], 0
	setne	al

; 285  : }

	mov	esp, ebp
	pop	ebp
	ret	0
_output_value_button ENDP
_TEXT	ENDS
PUBLIC	_output_catalog_title
EXTRN	_ctrl_cgi_name:NEAR
_DATA	SEGMENT
$SG70551 DB	'CLR', 00H
$SG70555 DB	'<font size=-1>', 00H
	ORG $+1
$SG70557 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70561 DB	'_eva_catalog_root_s.gif', 00H
$SG70562 DB	'_eva_catalog_root.gif', 00H
	ORG $+2
$SG70565 DB	'</font>', 00H
$SG70567 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70569 DB	'D:\Travail\ABI\EVA\V4.0\CGI\Brunix-2016\ctrl_output_cata'
	DB	'log.c', 00H
	ORG $+2
$SG70570 DB	'output_catalog_title', 00H
	ORG $+3
$SG70572 DB	'D:\Travail\ABI\EVA\V4.0\CGI\Brunix-2016\ctrl_output_cata'
	DB	'log.c', 00H
	ORG $+2
$SG70573 DB	'output_catalog_title', 00H
_DATA	ENDS
_TEXT	SEGMENT
_cntxt$ = 8
_cat$ = 12
_ctrl$ = -12
_name$ = -8
_html$ = -4
_output_catalog_title PROC NEAR

; 298  : ){

	push	ebp
	mov	ebp, esp
	sub	esp, 20					; 00000014H

; 299  : 	EVA_ctrl *ctrl = cntxt->form->ctrl + cat->i_ctrl;

	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	ecx, DWORD PTR [eax+80]
	mov	edx, DWORD PTR _cat$[ebp]
	mov	eax, DWORD PTR [edx]
	imul	eax, 480				; 000001e0H
	mov	ecx, DWORD PTR [ecx]
	add	ecx, eax
	mov	DWORD PTR _ctrl$[ebp], ecx

; 300  : 	DynBuffer *name = NULL;

	mov	DWORD PTR _name$[ebp], 0

; 301  : 	CHECK_HTML_STATUS;

	cmp	DWORD PTR _cntxt$[ebp], 0
	je	SHORT $L71550
	mov	edx, DWORD PTR _cntxt$[ebp]
	cmp	DWORD PTR [edx+80], 0
	je	SHORT $L71548
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	ecx, DWORD PTR [eax+80]
	mov	edx, DWORD PTR [ecx+232]
	mov	DWORD PTR -16+[ebp], edx
	jmp	SHORT $L71549
$L71548:
	mov	DWORD PTR -16+[ebp], 0
$L71549:
	mov	eax, DWORD PTR -16+[ebp]
	mov	DWORD PTR -20+[ebp], eax
	jmp	SHORT $L71551
$L71550:
	mov	DWORD PTR -20+[ebp], 0
$L71551:
	mov	ecx, DWORD PTR -20+[ebp]
	mov	DWORD PTR _html$[ebp], ecx
	cmp	DWORD PTR _html$[ebp], 0
	jne	SHORT $L70548
	xor	eax, eax
	jmp	$L70541
$L70548:

; 302  : 	CTRL_CGINAMEBTN(&name, NULL, add_sz_str("CLR"));

	push	3
	push	OFFSET FLAT:$SG70551
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
	je	SHORT $L70550
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 302		; 0000012eH
	jmp	$eva_err$70552
$L70550:

; 303  : 	DYNBUF_ADD_STR(html, "<font size=-1>");

	push	0
	push	0
	push	14					; 0000000eH
	push	OFFSET FLAT:$SG70555
	mov	eax, DWORD PTR _html$[ebp]
	push	eax
	call	_dynbuf_add
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L70554
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29872], OFFSET FLAT:$SG70557
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 303		; 0000012fH
	jmp	$eva_err$70552
$L70554:

; 304  : 	if(put_html_button_sz(cntxt, name->data, ctrl->LABEL, "_eva_catalog_root.gif", "_eva_catalog_root_s.gif", NULL, NULL, 0, 0, 0, 12))

	push	12					; 0000000cH
	push	0
	push	0
	push	0
	push	0
	push	0
	push	OFFSET FLAT:$SG70561
	push	OFFSET FLAT:$SG70562
	mov	eax, DWORD PTR _ctrl$[ebp]
	mov	ecx, DWORD PTR [eax+284]
	push	ecx
	mov	edx, DWORD PTR _name$[ebp]
	add	edx, 8
	push	edx
	mov	eax, DWORD PTR _cntxt$[ebp]
	push	eax
	call	_put_html_button_sz
	add	esp, 44					; 0000002cH
	test	eax, eax
	je	SHORT $L70560

; 305  : 		STACK_ERROR;

	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 305		; 00000131H
	jmp	SHORT $eva_err$70552
$L70560:

; 306  : 	DYNBUF_ADD_STR(html, "</font>");

	push	0
	push	0
	push	7
	push	OFFSET FLAT:$SG70565
	mov	edx, DWORD PTR _html$[ebp]
	push	edx
	call	_dynbuf_add
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L70564
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29872], OFFSET FLAT:$SG70567
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 306		; 00000132H
	jmp	SHORT $eva_err$70552
$L70564:
$eva_noerr$70568:

; 307  : 
; 308  : 	RETURN_OK_CLEANUP;

	push	0
	push	OFFSET FLAT:$SG70569
	push	OFFSET FLAT:$SG70570
	mov	edx, DWORD PTR _cntxt$[ebp]
	push	edx
	call	_err_clear
	add	esp, 16					; 00000010H
$eva_err$70552:
	mov	eax, DWORD PTR _cntxt$[ebp]
	cmp	DWORD PTR [eax+29872], 0
	je	SHORT $L70571
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	edx, DWORD PTR [ecx+29900]
	push	edx
	push	OFFSET FLAT:$SG70572
	push	OFFSET FLAT:$SG70573
	mov	eax, DWORD PTR _cntxt$[ebp]
	push	eax
	call	_err_add_context
	add	esp, 16					; 00000010H
$L70571:
	mov	ecx, DWORD PTR _name$[ebp]
	push	ecx
	call	_mem_free
	add	esp, 4
	mov	DWORD PTR _name$[ebp], 0
	mov	edx, DWORD PTR _cntxt$[ebp]
	xor	eax, eax
	cmp	DWORD PTR [edx+29872], 0
	setne	al
$L70541:

; 309  : }

	mov	esp, ebp
	pop	ebp
	ret	0
_output_catalog_title ENDP
_TEXT	ENDS
PUBLIC	_output_catalog_tree
_DATA	SEGMENT
	ORG $+3
$SG70597 DB	'<br>', 00H
	ORG $+3
$SG70599 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70606 DB	' height=1 align=absmiddle>', 00H
	ORG $+1
$SG70607 DB	'<img src=''/img/_eva_nop.gif'' width=', 00H
$SG70609 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70613 DB	'<b>', 00H
$SG70615 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70617 DB	'_eva_item_small.gif', 00H
$SG70618 DB	'_eva_item_small_s.gif', 00H
	ORG $+2
$SG70619 DB	'_eva_item_small_s.gif', 00H
	ORG $+2
$SG70620 DB	'_eva_item_small.gif', 00H
$SG70624 DB	'</b>', 00H
	ORG $+3
$SG70626 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70629 DB	'<br>', 00H
	ORG $+3
$SG70631 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70633 DB	'D:\Travail\ABI\EVA\V4.0\CGI\Brunix-2016\ctrl_output_cata'
	DB	'log.c', 00H
	ORG $+2
$SG70634 DB	'output_catalog_tree', 00H
$SG70636 DB	'D:\Travail\ABI\EVA\V4.0\CGI\Brunix-2016\ctrl_output_cata'
	DB	'log.c', 00H
	ORG $+2
$SG70637 DB	'output_catalog_tree', 00H
_DATA	ENDS
_TEXT	SEGMENT
_cntxt$ = 8
_cat$ = 12
_lvl$ = 16
_i$ = -8
_html$ = -4
_b_sel$70603 = -12
_output_catalog_tree PROC NEAR

; 323  : ){

	push	ebp
	mov	ebp, esp
	sub	esp, 32					; 00000020H

; 324  : 	unsigned long i;
; 325  : 	CHECK_HTML_STATUS;

	cmp	DWORD PTR _cntxt$[ebp], 0
	je	SHORT $L71555
	mov	eax, DWORD PTR _cntxt$[ebp]
	cmp	DWORD PTR [eax+80], 0
	je	SHORT $L71553
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	edx, DWORD PTR [ecx+80]
	mov	eax, DWORD PTR [edx+232]
	mov	DWORD PTR -16+[ebp], eax
	jmp	SHORT $L71554
$L71553:
	mov	DWORD PTR -16+[ebp], 0
$L71554:
	mov	ecx, DWORD PTR -16+[ebp]
	mov	DWORD PTR -20+[ebp], ecx
	jmp	SHORT $L71556
$L71555:
	mov	DWORD PTR -20+[ebp], 0
$L71556:
	mov	edx, DWORD PTR -20+[ebp]
	mov	DWORD PTR _html$[ebp], edx
	cmp	DWORD PTR _html$[ebp], 0
	jne	SHORT $L70589
	xor	eax, eax
	jmp	$L70584
$L70589:

; 326  : 	if(lvl >= cat->key.nbrows) RETURN_OK;

	mov	eax, DWORD PTR _cat$[ebp]
	mov	ecx, DWORD PTR _lvl$[ebp]
	cmp	ecx, DWORD PTR [eax+4]
	jb	SHORT $L70590
	jmp	$eva_noerr$70591
$L70590:

; 327  : 
; 328  : 	/* Output title if level 0 */
; 329  : 	if(!lvl)

	cmp	DWORD PTR _lvl$[ebp], 0
	jne	SHORT $L70596

; 331  : 		if(output_catalog_title(cntxt, cat)) STACK_ERROR;

	mov	edx, DWORD PTR _cat$[ebp]
	push	edx
	mov	eax, DWORD PTR _cntxt$[ebp]
	push	eax
	call	_output_catalog_title
	add	esp, 8
	test	eax, eax
	je	SHORT $L70593
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 331		; 0000014bH
	jmp	$eva_err$70594
$L70593:

; 332  : 		DYNBUF_ADD_STR(html, "<br>");

	push	0
	push	0
	push	4
	push	OFFSET FLAT:$SG70597
	mov	edx, DWORD PTR _html$[ebp]
	push	edx
	call	_dynbuf_add
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L70596
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29872], OFFSET FLAT:$SG70599
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 332		; 0000014cH
	jmp	$eva_err$70594
$L70596:

; 334  : 
; 335  : 	/* Output field values */
; 336  : 	for(i = 0; i < cat->k[lvl].val.nbrows; i++)

	mov	DWORD PTR _i$[ebp], 0
	jmp	SHORT $L70600
$L70601:
	mov	edx, DWORD PTR _i$[ebp]
	add	edx, 1
	mov	DWORD PTR _i$[ebp], edx
$L70600:
	mov	eax, DWORD PTR _lvl$[ebp]
	imul	eax, 36					; 00000024H
	mov	ecx, DWORD PTR _cat$[ebp]
	mov	edx, DWORD PTR [ecx+164]
	mov	ecx, DWORD PTR _i$[ebp]
	cmp	ecx, DWORD PTR [edx+eax+16]
	jae	$eva_noerr$70591

; 338  : 		int b_sel = lvl < cat->lvl && cat->k[lvl].isel == i;

	mov	edx, DWORD PTR _cat$[ebp]
	mov	eax, DWORD PTR _lvl$[ebp]
	cmp	eax, DWORD PTR [edx+168]
	jae	SHORT $L71557
	mov	ecx, DWORD PTR _lvl$[ebp]
	imul	ecx, 36					; 00000024H
	mov	edx, DWORD PTR _cat$[ebp]
	mov	eax, DWORD PTR [edx+164]
	mov	ecx, DWORD PTR [eax+ecx+12]
	cmp	ecx, DWORD PTR _i$[ebp]
	jne	SHORT $L71557
	mov	DWORD PTR -24+[ebp], 1
	jmp	SHORT $L71558
$L71557:
	mov	DWORD PTR -24+[ebp], 0
$L71558:
	mov	edx, DWORD PTR -24+[ebp]
	mov	DWORD PTR _b_sel$70603[ebp], edx

; 339  : 		if(lvl) DYNBUF_ADD3_INT(html, "<img src='/img/_eva_nop.gif' width=", lvl * 20, " height=1 align=absmiddle>");

	cmp	DWORD PTR _lvl$[ebp], 0
	je	SHORT $L70605
	push	26					; 0000001aH
	push	OFFSET FLAT:$SG70606
	mov	eax, DWORD PTR _lvl$[ebp]
	imul	eax, 20					; 00000014H
	push	eax
	push	35					; 00000023H
	push	OFFSET FLAT:$SG70607
	mov	ecx, DWORD PTR _html$[ebp]
	push	ecx
	call	_dynbuf_add3_int
	add	esp, 24					; 00000018H
	test	eax, eax
	je	SHORT $L70605
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29872], OFFSET FLAT:$SG70609
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 339		; 00000153H
	jmp	$eva_err$70594
$L70605:

; 340  : 		if(b_sel) DYNBUF_ADD_STR(html, "<b>");

	cmp	DWORD PTR _b_sel$70603[ebp], 0
	je	SHORT $L70612
	push	0
	push	0
	push	3
	push	OFFSET FLAT:$SG70613
	mov	ecx, DWORD PTR _html$[ebp]
	push	ecx
	call	_dynbuf_add
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L70612
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29872], OFFSET FLAT:$SG70615
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 340		; 00000154H
	jmp	$eva_err$70594
$L70612:

; 341  : 		if(output_value_button(cntxt, cat, lvl,	i,
; 342  : 			b_sel ? "_eva_item_small_s.gif" : "_eva_item_small.gif",
; 343  : 			b_sel ? "_eva_item_small.gif" : "_eva_item_small_s.gif")) STACK_ERROR;

	cmp	DWORD PTR _b_sel$70603[ebp], 0
	je	SHORT $L71559
	mov	DWORD PTR -28+[ebp], OFFSET FLAT:$SG70617
	jmp	SHORT $L71560
$L71559:
	mov	DWORD PTR -28+[ebp], OFFSET FLAT:$SG70618
$L71560:
	cmp	DWORD PTR _b_sel$70603[ebp], 0
	je	SHORT $L71561
	mov	DWORD PTR -32+[ebp], OFFSET FLAT:$SG70619
	jmp	SHORT $L71562
$L71561:
	mov	DWORD PTR -32+[ebp], OFFSET FLAT:$SG70620
$L71562:
	mov	ecx, DWORD PTR -28+[ebp]
	push	ecx
	mov	edx, DWORD PTR -32+[ebp]
	push	edx
	mov	eax, DWORD PTR _i$[ebp]
	push	eax
	mov	ecx, DWORD PTR _lvl$[ebp]
	push	ecx
	mov	edx, DWORD PTR _cat$[ebp]
	push	edx
	mov	eax, DWORD PTR _cntxt$[ebp]
	push	eax
	call	_output_value_button
	add	esp, 24					; 00000018H
	test	eax, eax
	je	SHORT $L70616
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 343		; 00000157H
	jmp	$eva_err$70594
$L70616:

; 344  : 		if(b_sel) DYNBUF_ADD_STR(html, "</b>");

	cmp	DWORD PTR _b_sel$70603[ebp], 0
	je	SHORT $L70623
	push	0
	push	0
	push	4
	push	OFFSET FLAT:$SG70624
	mov	edx, DWORD PTR _html$[ebp]
	push	edx
	call	_dynbuf_add
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L70623
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29872], OFFSET FLAT:$SG70626
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 344		; 00000158H
	jmp	$eva_err$70594
$L70623:

; 345  : 		DYNBUF_ADD_STR(html, "<br>");

	push	0
	push	0
	push	4
	push	OFFSET FLAT:$SG70629
	mov	edx, DWORD PTR _html$[ebp]
	push	edx
	call	_dynbuf_add
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L70628
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29872], OFFSET FLAT:$SG70631
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 345		; 00000159H
	jmp	SHORT $eva_err$70594
$L70628:

; 346  : 
; 347  : 		/* If selected value : output lower level */
; 348  : 		if(b_sel && output_catalog_tree(cntxt, cat, lvl + 1)) STACK_ERROR;

	cmp	DWORD PTR _b_sel$70603[ebp], 0
	je	SHORT $L70632
	mov	edx, DWORD PTR _lvl$[ebp]
	add	edx, 1
	push	edx
	mov	eax, DWORD PTR _cat$[ebp]
	push	eax
	mov	ecx, DWORD PTR _cntxt$[ebp]
	push	ecx
	call	_output_catalog_tree
	add	esp, 12					; 0000000cH
	test	eax, eax
	je	SHORT $L70632
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 348		; 0000015cH
	jmp	SHORT $eva_err$70594
$L70632:

; 349  : 	}

	jmp	$L70601
$eva_noerr$70591:

; 350  : 
; 351  : 	RETURN_OK_CLEANUP;

	push	0
	push	OFFSET FLAT:$SG70633
	push	OFFSET FLAT:$SG70634
	mov	eax, DWORD PTR _cntxt$[ebp]
	push	eax
	call	_err_clear
	add	esp, 16					; 00000010H
$eva_err$70594:
	mov	ecx, DWORD PTR _cntxt$[ebp]
	cmp	DWORD PTR [ecx+29872], 0
	je	SHORT $L70635
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	eax, DWORD PTR [edx+29900]
	push	eax
	push	OFFSET FLAT:$SG70636
	push	OFFSET FLAT:$SG70637
	mov	ecx, DWORD PTR _cntxt$[ebp]
	push	ecx
	call	_err_add_context
	add	esp, 16					; 00000010H
$L70635:
	mov	edx, DWORD PTR _cntxt$[ebp]
	xor	eax, eax
	cmp	DWORD PTR [edx+29872], 0
	setne	al
$L70584:

; 352  : }

	mov	esp, ebp
	pop	ebp
	ret	0
_output_catalog_tree ENDP
_TEXT	ENDS
PUBLIC	_output_catalog_index
EXTRN	_time_to_datetxt:NEAR
EXTRN	_fclose:NEAR
EXTRN	_fopen:NEAR
EXTRN	_fread:NEAR
EXTRN	_fwrite:NEAR
EXTRN	_chdir_db_doc:NEAR
EXTRN	_stat:NEAR
EXTRN	_malloc:NEAR
EXTRN	_strcmp:NEAR
EXTRN	_chdir:NEAR
EXTRN	_mkdir:NEAR
EXTRN	_dyntab_field_cell:NEAR
_DATA	SEGMENT
$SG70671 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70675 DB	'.', 00H
	ORG $+2
$SG70676 DB	'.', 00H
	ORG $+2
$SG70678 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70682 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70687 DB	'.', 00H
	ORG $+2
$SG70688 DB	'-', 00H
	ORG $+2
$SG70690 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70693 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70696 DB	'.htm', 00H
	ORG $+3
$SG70698 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70700 DB	'cache', 00H
	ORG $+2
$SG70701 DB	'cache', 00H
	ORG $+2
$SG70707 DB	')', 00H
	ORG $+2
$SG70708 DB	'SELECT MAX(DateCr) FROM TLink WHERE IdObj IN (', 00H
	ORG $+1
$SG70710 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70717 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70718 DB	'rb', 00H
	ORG $+1
$SG70722 DB	'Cache read error', 00H
	ORG $+3
$SG70726 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70734 DB	'<table width=100% style="border-bottom:3px double gray">'
	DB	'<tr><td><font size=-1>', 00H
	ORG $+1
$SG70736 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70740 DB	'_EVA_NO_TREE', 00H
	ORG $+3
$SG70745 DB	'catalog_dot_s.gif', 00H
	ORG $+2
$SG70746 DB	'catalog_dot.gif', 00H
$SG70749 DB	' ', 00H
	ORG $+2
$SG70751 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70754 DB	'</font> <b>', 00H
$SG70756 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70758 DB	'catalog_dot_s.gif', 00H
	ORG $+2
$SG70759 DB	'catalog_dot.gif', 00H
$SG70762 DB	'</b></td></tr></table>', 00H
	ORG $+1
$SG70764 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70768 DB	'cache', 00H
	ORG $+2
$SG70769 DB	'wbc', 00H
$SG70773 DB	'Cache write error', 00H
	ORG $+2
$SG70774 DB	'D:\Travail\ABI\EVA\V4.0\CGI\Brunix-2016\ctrl_output_cata'
	DB	'log.c', 00H
	ORG $+2
$SG70775 DB	'output_catalog_index', 00H
	ORG $+3
$SG70777 DB	'D:\Travail\ABI\EVA\V4.0\CGI\Brunix-2016\ctrl_output_cata'
	DB	'log.c', 00H
	ORG $+2
$SG70778 DB	'output_catalog_index', 00H
_DATA	ENDS
_TEXT	SEGMENT
_strip$ = -72
_lvl$ = -76
_b_cache$ = -60
_fs$ = -44
_f$ = -56
_html$ = -52
_datecr$70703 = -112
_cdata$70714 = -116
_pos$70728 = -120
_cntxt$ = 8
_cat$ = 12
_ctrl$ = -80
_idobj$ = -48
_fname$ = -8
_sql$ = -4
_i$ = -64
_j$ = -68
_output_catalog_index PROC NEAR

; 368  : ){

	push	ebp
	mov	ebp, esp
	sub	esp, 148				; 00000094H

; 369  : 	EVA_ctrl *ctrl = cntxt->form->ctrl + cat->i_ctrl;

	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	ecx, DWORD PTR [eax+80]
	mov	edx, DWORD PTR _cat$[ebp]
	mov	eax, DWORD PTR [edx]
	imul	eax, 480				; 000001e0H
	mov	ecx, DWORD PTR [ecx]
	add	ecx, eax
	mov	DWORD PTR _ctrl$[ebp], ecx

; 370  : 	DynBuffer *idobj = NULL;

	mov	DWORD PTR _idobj$[ebp], 0

; 371  : 	DynBuffer *fname = NULL;

	mov	DWORD PTR _fname$[ebp], 0

; 372  : 	DynBuffer *sql = NULL;

	mov	DWORD PTR _sql$[ebp], 0

; 373  : 	unsigned long i, j, strip = 600;

	mov	DWORD PTR _strip$[ebp], 600		; 00000258H

; 374  : 	unsigned long lvl = cat->lvl;

	mov	edx, DWORD PTR _cat$[ebp]
	mov	eax, DWORD PTR [edx+168]
	mov	DWORD PTR _lvl$[ebp], eax

; 375  : 	int b_cache;
; 376  : 	struct stat fs;
; 377  : 	FILE *f = NULL;

	mov	DWORD PTR _f$[ebp], 0

; 378  : 	CHECK_HTML_STATUS;

	cmp	DWORD PTR _cntxt$[ebp], 0
	je	SHORT $L71566
	mov	ecx, DWORD PTR _cntxt$[ebp]
	cmp	DWORD PTR [ecx+80], 0
	je	SHORT $L71564
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	eax, DWORD PTR [edx+80]
	mov	ecx, DWORD PTR [eax+232]
	mov	DWORD PTR -124+[ebp], ecx
	jmp	SHORT $L71565
$L71564:
	mov	DWORD PTR -124+[ebp], 0
$L71565:
	mov	edx, DWORD PTR -124+[ebp]
	mov	DWORD PTR -128+[ebp], edx
	jmp	SHORT $L71567
$L71566:
	mov	DWORD PTR -128+[ebp], 0
$L71567:
	mov	eax, DWORD PTR -128+[ebp]
	mov	DWORD PTR _html$[ebp], eax
	cmp	DWORD PTR _html$[ebp], 0
	jne	SHORT $L70665
	xor	eax, eax
	jmp	$L70646
$L70665:

; 379  : 
; 380  : 	/* Build cache file name */
; 381  : 	if(!cat->id) RETURN_OK;

	mov	ecx, DWORD PTR _cat$[ebp]
	cmp	DWORD PTR [ecx+156], 0
	jne	SHORT $L70666
	jmp	$eva_noerr$70667
$L70666:

; 382  : 	DYNBUF_ADD_CELL(&fname, &cntxt->form->id_form, 0, 0, NO_CONV);

	push	0
	push	0
	push	0
	push	0
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	eax, DWORD PTR [edx+80]
	add	eax, 12					; 0000000cH
	push	eax
	call	_dyntab_sz
	add	esp, 12					; 0000000cH
	push	eax
	push	0
	push	0
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	edx, DWORD PTR [ecx+80]
	add	edx, 12					; 0000000cH
	push	edx
	call	_dyntab_val
	add	esp, 12					; 0000000cH
	push	eax
	lea	eax, DWORD PTR _fname$[ebp]
	push	eax
	call	_dynbuf_add
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L70669
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29872], OFFSET FLAT:$SG70671
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 382		; 0000017eH
	jmp	$eva_err$70672
$L70669:

; 383  : 	DYNBUF_ADD3_CELL(&fname, ".", &cntxt->form->id_obj, 0, 0, NO_CONV, ".");

	push	1
	push	OFFSET FLAT:$SG70675
	push	0
	push	0
	push	0
	push	0
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	ecx, DWORD PTR [eax+80]
	add	ecx, 32					; 00000020H
	push	ecx
	call	_dyntab_sz
	add	esp, 12					; 0000000cH
	push	eax
	push	0
	push	0
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	eax, DWORD PTR [edx+80]
	add	eax, 32					; 00000020H
	push	eax
	call	_dyntab_val
	add	esp, 12					; 0000000cH
	push	eax
	push	1
	push	OFFSET FLAT:$SG70676
	lea	ecx, DWORD PTR _fname$[ebp]
	push	ecx
	call	_dynbuf_add3
	add	esp, 36					; 00000024H
	test	eax, eax
	je	SHORT $L70674
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29872], OFFSET FLAT:$SG70678
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 383		; 0000017fH
	jmp	$eva_err$70672
$L70674:

; 384  : 	DYNBUF_ADD_CELL(&fname, &cntxt->form->ctrl[cat->i_ctrl].id, 0, 0, NO_CONV);

	push	0
	push	0
	push	0
	push	0
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	edx, DWORD PTR [ecx+80]
	mov	eax, DWORD PTR _cat$[ebp]
	mov	ecx, DWORD PTR [eax]
	imul	ecx, 480				; 000001e0H
	mov	edx, DWORD PTR [edx]
	add	edx, ecx
	push	edx
	call	_dyntab_sz
	add	esp, 12					; 0000000cH
	push	eax
	push	0
	push	0
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	ecx, DWORD PTR [eax+80]
	mov	edx, DWORD PTR _cat$[ebp]
	mov	eax, DWORD PTR [edx]
	imul	eax, 480				; 000001e0H
	mov	ecx, DWORD PTR [ecx]
	add	ecx, eax
	push	ecx
	call	_dyntab_val
	add	esp, 12					; 0000000cH
	push	eax
	lea	edx, DWORD PTR _fname$[ebp]
	push	edx
	call	_dynbuf_add
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L70680
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29872], OFFSET FLAT:$SG70682
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 384		; 00000180H
	jmp	$eva_err$70672
$L70680:

; 385  : 	for(i = 0; i < lvl; i++)

	mov	DWORD PTR _i$[ebp], 0
	jmp	SHORT $L70683
$L70684:
	mov	edx, DWORD PTR _i$[ebp]
	add	edx, 1
	mov	DWORD PTR _i$[ebp], edx
$L70683:
	mov	eax, DWORD PTR _i$[ebp]
	cmp	eax, DWORD PTR _lvl$[ebp]
	jae	$L70685

; 387  : 		DYNBUF_ADD3_INT(&fname, "-", cat->k[i].idfld, ".");

	push	1
	push	OFFSET FLAT:$SG70687
	mov	ecx, DWORD PTR _i$[ebp]
	imul	ecx, 36					; 00000024H
	mov	edx, DWORD PTR _cat$[ebp]
	mov	eax, DWORD PTR [edx+164]
	mov	ecx, DWORD PTR [eax+ecx]
	push	ecx
	push	1
	push	OFFSET FLAT:$SG70688
	lea	edx, DWORD PTR _fname$[ebp]
	push	edx
	call	_dynbuf_add3_int
	add	esp, 24					; 00000018H
	test	eax, eax
	je	SHORT $L70686
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29872], OFFSET FLAT:$SG70690
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 387		; 00000183H
	jmp	$eva_err$70672
$L70686:

; 388  : 		DYNBUF_ADD_INT(&fname, cat->k[i].idsel);

	mov	edx, DWORD PTR _i$[ebp]
	imul	edx, 36					; 00000024H
	mov	eax, DWORD PTR _cat$[ebp]
	mov	ecx, DWORD PTR [eax+164]
	mov	edx, DWORD PTR [ecx+edx+4]
	push	edx
	lea	eax, DWORD PTR _fname$[ebp]
	push	eax
	call	_dynbuf_add_int
	add	esp, 8
	test	eax, eax
	je	SHORT $L70691
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29872], OFFSET FLAT:$SG70693
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 388		; 00000184H
	jmp	$eva_err$70672
$L70691:

; 389  : 	}

	jmp	$L70684
$L70685:

; 390  : 	DYNBUF_ADD_STR(&fname, ".htm");

	push	0
	push	0
	push	4
	push	OFFSET FLAT:$SG70696
	lea	eax, DWORD PTR _fname$[ebp]
	push	eax
	call	_dynbuf_add
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L70695
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29872], OFFSET FLAT:$SG70698
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 390		; 00000186H
	jmp	$eva_err$70672
$L70695:

; 391  : 
; 392  : 	/* Check if cache file exists */
; 393  : 	if(chdir_db_doc(cntxt)) STACK_ERROR;

	mov	eax, DWORD PTR _cntxt$[ebp]
	push	eax
	call	_chdir_db_doc
	add	esp, 4
	test	eax, eax
	je	SHORT $L70699
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 393		; 00000189H
	jmp	$eva_err$70672
$L70699:

; 394  : 	MKDIR("cache"); chdir("cache");

	push	OFFSET FLAT:$SG70700
	call	_mkdir
	add	esp, 4
	push	OFFSET FLAT:$SG70701
	call	_chdir
	add	esp, 4

; 395  : 	b_cache = !stat(fname->data, &fs);

	lea	edx, DWORD PTR _fs$[ebp]
	push	edx
	mov	eax, DWORD PTR _fname$[ebp]
	add	eax, 8
	push	eax
	call	_stat
	add	esp, 8
	neg	eax
	sbb	eax, eax
	inc	eax
	mov	DWORD PTR _b_cache$[ebp], eax

; 396  : 
; 397  : 	/* Check if page data was modified after cache file creation */
; 398  : 	if(b_cache)

	cmp	DWORD PTR _b_cache$[ebp], 0
	je	$L70702

; 400  : 		char datecr[32];
; 401  : 		DYNBUF_ADD3_BUF(&sql, "SELECT MAX(DateCr) FROM TLink WHERE IdObj IN (", cat->id, NO_CONV, ")");

	mov	ecx, DWORD PTR _cat$[ebp]
	cmp	DWORD PTR [ecx+156], 0
	je	SHORT $L71568
	mov	edx, DWORD PTR _cat$[ebp]
	mov	eax, DWORD PTR [edx+156]
	mov	ecx, DWORD PTR [eax+4]
	mov	DWORD PTR -132+[ebp], ecx
	jmp	SHORT $L71569
$L71568:
	mov	DWORD PTR -132+[ebp], 0
$L71569:
	mov	edx, DWORD PTR _cat$[ebp]
	cmp	DWORD PTR [edx+156], 0
	je	SHORT $L71570
	mov	eax, DWORD PTR _cat$[ebp]
	mov	ecx, DWORD PTR [eax+156]
	add	ecx, 8
	mov	DWORD PTR -136+[ebp], ecx
	jmp	SHORT $L71571
$L71570:
	mov	DWORD PTR -136+[ebp], 0
$L71571:
	push	1
	push	OFFSET FLAT:$SG70707
	push	0
	push	0
	mov	edx, DWORD PTR -132+[ebp]
	push	edx
	mov	eax, DWORD PTR -136+[ebp]
	push	eax
	push	46					; 0000002eH
	push	OFFSET FLAT:$SG70708
	lea	ecx, DWORD PTR _sql$[ebp]
	push	ecx
	call	_dynbuf_add3
	add	esp, 36					; 00000024H
	test	eax, eax
	je	SHORT $L70706
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29872], OFFSET FLAT:$SG70710
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 401		; 00000191H
	jmp	$eva_err$70672
$L70706:

; 402  : 		if(sql_exec_query(cntxt, sql->data) || sql_get_buf(cntxt, &sql, 2)) STACK_ERROR;

	mov	ecx, DWORD PTR _sql$[ebp]
	add	ecx, 8
	push	ecx
	mov	edx, DWORD PTR _cntxt$[ebp]
	push	edx
	call	_sql_exec_query
	add	esp, 8
	test	eax, eax
	jne	SHORT $L70712
	push	2
	lea	eax, DWORD PTR _sql$[ebp]
	push	eax
	mov	ecx, DWORD PTR _cntxt$[ebp]
	push	ecx
	call	_sql_get_buf
	add	esp, 12					; 0000000cH
	test	eax, eax
	je	SHORT $L70711
$L70712:
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 402		; 00000192H
	jmp	$eva_err$70672
$L70711:

; 403  : 		b_cache = !time_to_datetxt(fs.st_mtime, datecr) && strcmp(sql->data, datecr) < 0;

	lea	eax, DWORD PTR _datecr$70703[ebp]
	push	eax
	mov	ecx, DWORD PTR _fs$[ebp+28]
	push	ecx
	call	_time_to_datetxt
	add	esp, 8
	test	eax, eax
	jne	SHORT $L71572
	lea	edx, DWORD PTR _datecr$70703[ebp]
	push	edx
	mov	eax, DWORD PTR _sql$[ebp]
	add	eax, 8
	push	eax
	call	_strcmp
	add	esp, 8
	test	eax, eax
	jge	SHORT $L71572
	mov	DWORD PTR -140+[ebp], 1
	jmp	SHORT $L71573
$L71572:
	mov	DWORD PTR -140+[ebp], 0
$L71573:
	mov	ecx, DWORD PTR -140+[ebp]
	mov	DWORD PTR _b_cache$[ebp], ecx
$L70702:

; 405  : 
; 406  : 	/* If cache valid : read from file */
; 407  : 	if(b_cache)

	cmp	DWORD PTR _b_cache$[ebp], 0
	je	$L70713

; 409  : 		char *cdata = malloc(fs.st_size + 4);

	mov	edx, DWORD PTR _fs$[ebp+20]
	add	edx, 4
	push	edx
	call	_malloc
	add	esp, 4
	mov	DWORD PTR _cdata$70714[ebp], eax

; 410  : 		if(!cdata) RETURN_ERR_MEMORY;

	cmp	DWORD PTR _cdata$70714[ebp], 0
	jne	SHORT $L70715
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29872], OFFSET FLAT:$SG70717
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 410		; 0000019aH
	jmp	$eva_err$70672
$L70715:

; 411  : 		f = fopen(fname->data, "rb");

	push	OFFSET FLAT:$SG70718
	mov	edx, DWORD PTR _fname$[ebp]
	add	edx, 8
	push	edx
	call	_fopen
	add	esp, 8
	mov	DWORD PTR _f$[ebp], eax

; 412  : 		if(!f || fread(cdata, fs.st_size, 1, f) != 1) RETURN_ERROR("Cache read error", NOP);

	cmp	DWORD PTR _f$[ebp], 0
	je	SHORT $L70720
	mov	eax, DWORD PTR _f$[ebp]
	push	eax
	push	1
	mov	ecx, DWORD PTR _fs$[ebp+20]
	push	ecx
	mov	edx, DWORD PTR _cdata$70714[ebp]
	push	edx
	call	_fread
	add	esp, 16					; 00000010H
	cmp	eax, 1
	je	SHORT $L70719
$L70720:
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29872], OFFSET FLAT:$SG70722
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 412		; 0000019cH
	jmp	$eva_err$70672
$L70719:

; 413  : 		DYNBUF_ADD(html, cdata, fs.st_size, NO_CONV);

	push	0
	push	0
	mov	edx, DWORD PTR _fs$[ebp+20]
	push	edx
	mov	eax, DWORD PTR _cdata$70714[ebp]
	push	eax
	mov	ecx, DWORD PTR _html$[ebp]
	push	ecx
	call	_dynbuf_add
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L70724
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29872], OFFSET FLAT:$SG70726
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 413		; 0000019dH
	jmp	$eva_err$70672
$L70724:

; 415  : 	else

	jmp	$L70770
$L70713:

; 418  : 		size_t pos = (html && *html) ? (*html)->cnt : 0;

	cmp	DWORD PTR _html$[ebp], 0
	je	SHORT $L71574
	mov	ecx, DWORD PTR _html$[ebp]
	cmp	DWORD PTR [ecx], 0
	je	SHORT $L71574
	mov	edx, DWORD PTR _html$[ebp]
	mov	eax, DWORD PTR [edx]
	mov	ecx, DWORD PTR [eax+4]
	mov	DWORD PTR -144+[ebp], ecx
	jmp	SHORT $L71575
$L71574:
	mov	DWORD PTR -144+[ebp], 0
$L71575:
	mov	edx, DWORD PTR -144+[ebp]
	mov	DWORD PTR _pos$70728[ebp], edx

; 419  : 
; 420  : 		/* Output catalog list for each lower level value */
; 421  : 		chdir(cntxt->path);

	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	ecx, DWORD PTR [eax+29728]
	push	ecx
	call	_chdir
	add	esp, 4

; 422  : 		for(i = 0; i < cat->k[lvl].val.nbrows; i++)

	mov	DWORD PTR _i$[ebp], 0
	jmp	SHORT $L70729
$L70730:
	mov	edx, DWORD PTR _i$[ebp]
	add	edx, 1
	mov	DWORD PTR _i$[ebp], edx
$L70729:
	mov	eax, DWORD PTR _lvl$[ebp]
	imul	eax, 36					; 00000024H
	mov	ecx, DWORD PTR _cat$[ebp]
	mov	edx, DWORD PTR [ecx+164]
	mov	ecx, DWORD PTR _i$[ebp]
	cmp	ecx, DWORD PTR [edx+eax+16]
	jae	$L70731

; 424  : 			/* Output value button */
; 425  : 			DYNBUF_ADD_STR(html, "<table width=100% style=\"border-bottom:3px double gray\"><tr><td><font size=-1>");

	push	0
	push	0
	push	78					; 0000004eH
	push	OFFSET FLAT:$SG70734
	mov	edx, DWORD PTR _html$[ebp]
	push	edx
	call	_dynbuf_add
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L70733
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29872], OFFSET FLAT:$SG70736
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 425		; 000001a9H
	jmp	$eva_err$70672
$L70733:

; 426  : 			if(lvl)

	cmp	DWORD PTR _lvl$[ebp], 0
	je	$L70748

; 428  : 				if(CTRL_ATTR_CELL(NO_TREE) && output_catalog_title(cntxt, cat)) STACK_ERROR;

	cmp	DWORD PTR _ctrl$[ebp], 0
	je	SHORT $L71576
	push	0
	push	-1
	push	OFFSET FLAT:$SG70740
	mov	edx, DWORD PTR _ctrl$[ebp]
	add	edx, 44					; 0000002cH
	push	edx
	call	_dyntab_field_cell
	add	esp, 16					; 00000010H
	mov	DWORD PTR -148+[ebp], eax
	jmp	SHORT $L71577
$L71576:
	mov	DWORD PTR -148+[ebp], 0
$L71577:
	cmp	DWORD PTR -148+[ebp], 0
	je	SHORT $L70739
	mov	eax, DWORD PTR _cat$[ebp]
	push	eax
	mov	ecx, DWORD PTR _cntxt$[ebp]
	push	ecx
	call	_output_catalog_title
	add	esp, 8
	test	eax, eax
	je	SHORT $L70739
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 428		; 000001acH
	jmp	$eva_err$70672
$L70739:

; 429  : 				for(j = 0; j < lvl; j++)

	mov	DWORD PTR _j$[ebp], 0
	jmp	SHORT $L70741
$L70742:
	mov	eax, DWORD PTR _j$[ebp]
	add	eax, 1
	mov	DWORD PTR _j$[ebp], eax
$L70741:
	mov	ecx, DWORD PTR _j$[ebp]
	cmp	ecx, DWORD PTR _lvl$[ebp]
	jae	SHORT $L70743

; 430  : 					if(output_value_button(cntxt, cat, j, cat->k[j].isel, "catalog_dot.gif", "catalog_dot_s.gif")) STACK_ERROR;

	push	OFFSET FLAT:$SG70745
	push	OFFSET FLAT:$SG70746
	mov	edx, DWORD PTR _j$[ebp]
	imul	edx, 36					; 00000024H
	mov	eax, DWORD PTR _cat$[ebp]
	mov	ecx, DWORD PTR [eax+164]
	mov	edx, DWORD PTR [ecx+edx+12]
	push	edx
	mov	eax, DWORD PTR _j$[ebp]
	push	eax
	mov	ecx, DWORD PTR _cat$[ebp]
	push	ecx
	mov	edx, DWORD PTR _cntxt$[ebp]
	push	edx
	call	_output_value_button
	add	esp, 24					; 00000018H
	test	eax, eax
	je	SHORT $L70744
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 430		; 000001aeH
	jmp	$eva_err$70672
$L70744:
	jmp	SHORT $L70742
$L70743:

; 431  : 				DYNBUF_ADD_STR(html, " ");

	push	0
	push	0
	push	1
	push	OFFSET FLAT:$SG70749
	mov	ecx, DWORD PTR _html$[ebp]
	push	ecx
	call	_dynbuf_add
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L70748
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29872], OFFSET FLAT:$SG70751
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 431		; 000001afH
	jmp	$eva_err$70672
$L70748:

; 433  : 			DYNBUF_ADD_STR(html, "</font> <b>");

	push	0
	push	0
	push	11					; 0000000bH
	push	OFFSET FLAT:$SG70754
	mov	ecx, DWORD PTR _html$[ebp]
	push	ecx
	call	_dynbuf_add
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L70753
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29872], OFFSET FLAT:$SG70756
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 433		; 000001b1H
	jmp	$eva_err$70672
$L70753:

; 434  : 			if(output_value_button(cntxt, cat, lvl, i, "catalog_dot.gif", "catalog_dot_s.gif")) STACK_ERROR;

	push	OFFSET FLAT:$SG70758
	push	OFFSET FLAT:$SG70759
	mov	ecx, DWORD PTR _i$[ebp]
	push	ecx
	mov	edx, DWORD PTR _lvl$[ebp]
	push	edx
	mov	eax, DWORD PTR _cat$[ebp]
	push	eax
	mov	ecx, DWORD PTR _cntxt$[ebp]
	push	ecx
	call	_output_value_button
	add	esp, 24					; 00000018H
	test	eax, eax
	je	SHORT $L70757
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 434		; 000001b2H
	jmp	$eva_err$70672
$L70757:

; 435  : 			DYNBUF_ADD_STR(html, "</b></td></tr></table>");

	push	0
	push	0
	push	22					; 00000016H
	push	OFFSET FLAT:$SG70762
	mov	eax, DWORD PTR _html$[ebp]
	push	eax
	call	_dynbuf_add
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L70761
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29872], OFFSET FLAT:$SG70764
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 435		; 000001b3H
	jmp	$eva_err$70672
$L70761:

; 436  : 
; 437  : 			/* Read objects for the value */
; 438  : 			if(read_lower_idobj(cntxt, cat, &idobj, NULL, lvl, i)) STACK_ERROR;

	mov	eax, DWORD PTR _i$[ebp]
	push	eax
	mov	ecx, DWORD PTR _lvl$[ebp]
	push	ecx
	push	0
	lea	edx, DWORD PTR _idobj$[ebp]
	push	edx
	mov	eax, DWORD PTR _cat$[ebp]
	push	eax
	mov	ecx, DWORD PTR _cntxt$[ebp]
	push	ecx
	call	_read_lower_idobj
	add	esp, 24					; 00000018H
	test	eax, eax
	je	SHORT $L70766
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 438		; 000001b6H
	jmp	$eva_err$70672
$L70766:

; 439  : 
; 440  : 			/* Output list of images */
; 441  : 			if(idobj && output_catalog_sublist(cntxt, cat, idobj->data, idobj->cnt, strip, lvl, i)) STACK_ERROR;

	cmp	DWORD PTR _idobj$[ebp], 0
	je	SHORT $L70767
	mov	eax, DWORD PTR _i$[ebp]
	push	eax
	mov	ecx, DWORD PTR _lvl$[ebp]
	push	ecx
	mov	edx, DWORD PTR _strip$[ebp]
	push	edx
	mov	eax, DWORD PTR _idobj$[ebp]
	mov	ecx, DWORD PTR [eax+4]
	push	ecx
	mov	edx, DWORD PTR _idobj$[ebp]
	add	edx, 8
	push	edx
	mov	eax, DWORD PTR _cat$[ebp]
	push	eax
	mov	ecx, DWORD PTR _cntxt$[ebp]
	push	ecx
	call	_output_catalog_sublist
	add	esp, 28					; 0000001cH
	test	eax, eax
	je	SHORT $L70767
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 441		; 000001b9H
	jmp	$eva_err$70672
$L70767:

; 442  : 		}

	jmp	$L70730
$L70731:

; 443  : 
; 444  : 		/* Save page to cache file */
; 445  : 		chdir_db_doc(cntxt); chdir("cache");

	mov	eax, DWORD PTR _cntxt$[ebp]
	push	eax
	call	_chdir_db_doc
	add	esp, 4
	push	OFFSET FLAT:$SG70768
	call	_chdir
	add	esp, 4

; 446  : 		f = fopen(fname->data, "wbc");

	push	OFFSET FLAT:$SG70769
	mov	ecx, DWORD PTR _fname$[ebp]
	add	ecx, 8
	push	ecx
	call	_fopen
	add	esp, 8
	mov	DWORD PTR _f$[ebp], eax

; 447  : 		if(!f || fwrite((*html)->data + pos, (*html)->cnt - pos, 1, f) != 1) RETURN_ERROR("Cache write error", NOP);

	cmp	DWORD PTR _f$[ebp], 0
	je	SHORT $L70771
	mov	edx, DWORD PTR _f$[ebp]
	push	edx
	push	1
	mov	eax, DWORD PTR _html$[ebp]
	mov	ecx, DWORD PTR [eax]
	mov	edx, DWORD PTR [ecx+4]
	sub	edx, DWORD PTR _pos$70728[ebp]
	push	edx
	mov	eax, DWORD PTR _html$[ebp]
	mov	ecx, DWORD PTR [eax]
	mov	edx, DWORD PTR _pos$70728[ebp]
	lea	eax, DWORD PTR [ecx+edx+8]
	push	eax
	call	_fwrite
	add	esp, 16					; 00000010H
	cmp	eax, 1
	je	SHORT $L70770
$L70771:
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29872], OFFSET FLAT:$SG70773
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 447		; 000001bfH
	jmp	SHORT $eva_err$70672
$L70770:

; 449  : 	chdir(cntxt->path);

	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	ecx, DWORD PTR [eax+29728]
	push	ecx
	call	_chdir
	add	esp, 4
$eva_noerr$70667:

; 450  : 
; 451  : 	RETURN_OK_CLEANUP;

	push	0
	push	OFFSET FLAT:$SG70774
	push	OFFSET FLAT:$SG70775
	mov	edx, DWORD PTR _cntxt$[ebp]
	push	edx
	call	_err_clear
	add	esp, 16					; 00000010H
$eva_err$70672:
	mov	eax, DWORD PTR _cntxt$[ebp]
	cmp	DWORD PTR [eax+29872], 0
	je	SHORT $L70776
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	edx, DWORD PTR [ecx+29900]
	push	edx
	push	OFFSET FLAT:$SG70777
	push	OFFSET FLAT:$SG70778
	mov	eax, DWORD PTR _cntxt$[ebp]
	push	eax
	call	_err_add_context
	add	esp, 16					; 00000010H
$L70776:
	mov	ecx, DWORD PTR _idobj$[ebp]
	push	ecx
	call	_mem_free
	add	esp, 4
	mov	DWORD PTR _idobj$[ebp], 0
	mov	edx, DWORD PTR _fname$[ebp]
	push	edx
	call	_mem_free
	add	esp, 4
	mov	DWORD PTR _fname$[ebp], 0
	mov	eax, DWORD PTR _sql$[ebp]
	push	eax
	call	_mem_free
	add	esp, 4
	mov	DWORD PTR _sql$[ebp], 0
	cmp	DWORD PTR _f$[ebp], 0
	je	SHORT $L70779
	mov	ecx, DWORD PTR _f$[ebp]
	push	ecx
	call	_fclose
	add	esp, 4
$L70779:
	mov	edx, DWORD PTR _cntxt$[ebp]
	xor	eax, eax
	cmp	DWORD PTR [edx+29872], 0
	setne	al
$L70646:

; 452  : }

	mov	esp, ebp
	pop	ebp
	ret	0
_output_catalog_index ENDP
_TEXT	ENDS
PUBLIC	_output_catalog_list
_DATA	SEGMENT
	ORG $+3
$SG70798 DB	'<table width=100% style="border-bottom:3px double gray">'
	DB	'<tr><td><font size=-1>', 00H
	ORG $+1
$SG70800 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70804 DB	'_EVA_NO_TREE', 00H
	ORG $+3
$SG70809 DB	'catalog_dot_s.gif', 00H
	ORG $+2
$SG70810 DB	'catalog_dot.gif', 00H
$SG70813 DB	'</font> <b>', 00H
$SG70815 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70818 DB	'catalog_dot.gif', 00H
$SG70821 DB	'</td></tr></table>', 00H
	ORG $+1
$SG70823 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70826 DB	'D:\Travail\ABI\EVA\V4.0\CGI\Brunix-2016\ctrl_output_cata'
	DB	'log.c', 00H
	ORG $+2
$SG70827 DB	'output_catalog_list', 00H
$SG70829 DB	'D:\Travail\ABI\EVA\V4.0\CGI\Brunix-2016\ctrl_output_cata'
	DB	'log.c', 00H
	ORG $+2
$SG70830 DB	'output_catalog_list', 00H
_DATA	ENDS
_TEXT	SEGMENT
_cntxt$ = 8
_cat$ = 12
_ctrl$ = -16
_j$ = -8
_lvl$ = -12
_html$ = -4
_output_catalog_list PROC NEAR

; 465  : ){

	push	ebp
	mov	ebp, esp
	sub	esp, 28					; 0000001cH

; 466  : 	EVA_ctrl *ctrl = cntxt->form->ctrl + cat->i_ctrl;

	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	ecx, DWORD PTR [eax+80]
	mov	edx, DWORD PTR _cat$[ebp]
	mov	eax, DWORD PTR [edx]
	imul	eax, 480				; 000001e0H
	mov	ecx, DWORD PTR [ecx]
	add	ecx, eax
	mov	DWORD PTR _ctrl$[ebp], ecx

; 467  : 	unsigned long j, lvl = cat->key.nbrows - 1;

	mov	edx, DWORD PTR _cat$[ebp]
	mov	eax, DWORD PTR [edx+4]
	sub	eax, 1
	mov	DWORD PTR _lvl$[ebp], eax

; 468  : 	CHECK_HTML_STATUS;

	cmp	DWORD PTR _cntxt$[ebp], 0
	je	SHORT $L71581
	mov	ecx, DWORD PTR _cntxt$[ebp]
	cmp	DWORD PTR [ecx+80], 0
	je	SHORT $L71579
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	eax, DWORD PTR [edx+80]
	mov	ecx, DWORD PTR [eax+232]
	mov	DWORD PTR -20+[ebp], ecx
	jmp	SHORT $L71580
$L71579:
	mov	DWORD PTR -20+[ebp], 0
$L71580:
	mov	edx, DWORD PTR -20+[ebp]
	mov	DWORD PTR -24+[ebp], edx
	jmp	SHORT $L71582
$L71581:
	mov	DWORD PTR -24+[ebp], 0
$L71582:
	mov	eax, DWORD PTR -24+[ebp]
	mov	DWORD PTR _html$[ebp], eax
	cmp	DWORD PTR _html$[ebp], 0
	jne	SHORT $L70795
	xor	eax, eax
	jmp	$L70788
$L70795:

; 469  : 
; 470  : 	/* Output each selected value */
; 471  : 	DYNBUF_ADD_STR(html, "<table width=100% style=\"border-bottom:3px double gray\"><tr><td><font size=-1>");

	push	0
	push	0
	push	78					; 0000004eH
	push	OFFSET FLAT:$SG70798
	mov	ecx, DWORD PTR _html$[ebp]
	push	ecx
	call	_dynbuf_add
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L70797
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29872], OFFSET FLAT:$SG70800
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 471		; 000001d7H
	jmp	$eva_err$70801
$L70797:

; 472  : 	if(CTRL_ATTR_CELL(NO_TREE) && output_catalog_title(cntxt, cat)) STACK_ERROR;

	cmp	DWORD PTR _ctrl$[ebp], 0
	je	SHORT $L71583
	push	0
	push	-1
	push	OFFSET FLAT:$SG70804
	mov	ecx, DWORD PTR _ctrl$[ebp]
	add	ecx, 44					; 0000002cH
	push	ecx
	call	_dyntab_field_cell
	add	esp, 16					; 00000010H
	mov	DWORD PTR -28+[ebp], eax
	jmp	SHORT $L71584
$L71583:
	mov	DWORD PTR -28+[ebp], 0
$L71584:
	cmp	DWORD PTR -28+[ebp], 0
	je	SHORT $L70803
	mov	edx, DWORD PTR _cat$[ebp]
	push	edx
	mov	eax, DWORD PTR _cntxt$[ebp]
	push	eax
	call	_output_catalog_title
	add	esp, 8
	test	eax, eax
	je	SHORT $L70803
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 472		; 000001d8H
	jmp	$eva_err$70801
$L70803:

; 473  : 	for(j = 0; j < lvl; j++)

	mov	DWORD PTR _j$[ebp], 0
	jmp	SHORT $L70805
$L70806:
	mov	edx, DWORD PTR _j$[ebp]
	add	edx, 1
	mov	DWORD PTR _j$[ebp], edx
$L70805:
	mov	eax, DWORD PTR _j$[ebp]
	cmp	eax, DWORD PTR _lvl$[ebp]
	jae	SHORT $L70807

; 474  : 		if(output_value_button(cntxt, cat, j, cat->k[j].isel, "catalog_dot.gif", "catalog_dot_s.gif")) STACK_ERROR;

	push	OFFSET FLAT:$SG70809
	push	OFFSET FLAT:$SG70810
	mov	ecx, DWORD PTR _j$[ebp]
	imul	ecx, 36					; 00000024H
	mov	edx, DWORD PTR _cat$[ebp]
	mov	eax, DWORD PTR [edx+164]
	mov	ecx, DWORD PTR [eax+ecx+12]
	push	ecx
	mov	edx, DWORD PTR _j$[ebp]
	push	edx
	mov	eax, DWORD PTR _cat$[ebp]
	push	eax
	mov	ecx, DWORD PTR _cntxt$[ebp]
	push	ecx
	call	_output_value_button
	add	esp, 24					; 00000018H
	test	eax, eax
	je	SHORT $L70808
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 474		; 000001daH
	jmp	$eva_err$70801
$L70808:
	jmp	SHORT $L70806
$L70807:

; 475  : 	DYNBUF_ADD_STR(html, "</font> <b>");

	push	0
	push	0
	push	11					; 0000000bH
	push	OFFSET FLAT:$SG70813
	mov	eax, DWORD PTR _html$[ebp]
	push	eax
	call	_dynbuf_add
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L70812
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29872], OFFSET FLAT:$SG70815
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 475		; 000001dbH
	jmp	$eva_err$70801
$L70812:

; 476  : 	if(output_value_button(cntxt, cat, lvl, cat->k[j].isel, "catalog_dot.gif", NULL)) STACK_ERROR;

	push	0
	push	OFFSET FLAT:$SG70818
	mov	eax, DWORD PTR _j$[ebp]
	imul	eax, 36					; 00000024H
	mov	ecx, DWORD PTR _cat$[ebp]
	mov	edx, DWORD PTR [ecx+164]
	mov	eax, DWORD PTR [edx+eax+12]
	push	eax
	mov	ecx, DWORD PTR _lvl$[ebp]
	push	ecx
	mov	edx, DWORD PTR _cat$[ebp]
	push	edx
	mov	eax, DWORD PTR _cntxt$[ebp]
	push	eax
	call	_output_value_button
	add	esp, 24					; 00000018H
	test	eax, eax
	je	SHORT $L70817
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 476		; 000001dcH
	jmp	$eva_err$70801
$L70817:

; 477  : 	DYNBUF_ADD_STR(html, "</td></tr></table>");

	push	0
	push	0
	push	18					; 00000012H
	push	OFFSET FLAT:$SG70821
	mov	edx, DWORD PTR _html$[ebp]
	push	edx
	call	_dynbuf_add
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L70820
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29872], OFFSET FLAT:$SG70823
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 477		; 000001ddH
	jmp	SHORT $eva_err$70801
$L70820:

; 478  : 
; 479  : 	/* Output list of images */
; 480  : 	if(output_catalog_sublist(cntxt, cat, cat->id->data, cat->id->cnt, 0, 0, ~0UL)) STACK_ERROR;

	push	-1
	push	0
	push	0
	mov	edx, DWORD PTR _cat$[ebp]
	mov	eax, DWORD PTR [edx+156]
	mov	ecx, DWORD PTR [eax+4]
	push	ecx
	mov	edx, DWORD PTR _cat$[ebp]
	mov	eax, DWORD PTR [edx+156]
	add	eax, 8
	push	eax
	mov	ecx, DWORD PTR _cat$[ebp]
	push	ecx
	mov	edx, DWORD PTR _cntxt$[ebp]
	push	edx
	call	_output_catalog_sublist
	add	esp, 28					; 0000001cH
	test	eax, eax
	je	SHORT $eva_noerr$70825
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 480		; 000001e0H
	jmp	SHORT $eva_err$70801
$eva_noerr$70825:

; 481  : 	RETURN_OK_CLEANUP;

	push	0
	push	OFFSET FLAT:$SG70826
	push	OFFSET FLAT:$SG70827
	mov	ecx, DWORD PTR _cntxt$[ebp]
	push	ecx
	call	_err_clear
	add	esp, 16					; 00000010H
$eva_err$70801:
	mov	edx, DWORD PTR _cntxt$[ebp]
	cmp	DWORD PTR [edx+29872], 0
	je	SHORT $L70828
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	ecx, DWORD PTR [eax+29900]
	push	ecx
	push	OFFSET FLAT:$SG70829
	push	OFFSET FLAT:$SG70830
	mov	edx, DWORD PTR _cntxt$[ebp]
	push	edx
	call	_err_add_context
	add	esp, 16					; 00000010H
$L70828:
	mov	eax, DWORD PTR _cntxt$[ebp]
	xor	ecx, ecx
	cmp	DWORD PTR [eax+29872], 0
	setne	cl
	mov	eax, ecx
$L70788:

; 482  : }

	mov	esp, ebp
	pop	ebp
	ret	0
_output_catalog_list ENDP
_TEXT	ENDS
PUBLIC	_output_catalog_group
EXTRN	_sprintf:NEAR
EXTRN	_dyntab_add:NEAR
EXTRN	_ctrl_primary_handler:NEAR
EXTRN	_build_open_btn_name:NEAR
_BSS	SEGMENT
	ALIGN	4

$SG70890 DB	01H DUP (?)
_BSS	ENDS
_DATA	SEGMENT
$SG70855 DB	'<table width=100% style="border-bottom:3px double gray">'
	DB	'<tr><td><font size=-1>', 00H
	ORG $+1
$SG70857 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70861 DB	'_EVA_NO_TREE', 00H
	ORG $+3
$SG70866 DB	'catalog_dot_s.gif', 00H
	ORG $+2
$SG70867 DB	'catalog_dot.gif', 00H
$SG70870 DB	'</font> <b>', 00H
$SG70872 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70874 DB	'catalog_dot_s.gif', 00H
	ORG $+2
$SG70875 DB	'catalog_dot.gif', 00H
$SG70878 DB	'</td></tr></table>', 00H
	ORG $+1
$SG70880 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70883 DB	'%lu', 00H
$SG70887 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70891 DB	'SELECT TxtValue FROM TVal WHERE IdValue=', 00H
	ORG $+3
$SG70893 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70898 DB	'<table width=100%><tr><td>', 00H
	ORG $+1
$SG70900 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70909 DB	'CREATE TEMPORARY TABLE IdList', 0aH, 00H
	ORG $+1
$SG70911 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70915 DB	')', 0aH, 00H
	ORG $+1
$SG70916 DB	'SELECT DISTINCT IdObj FROM TLink', 0aH, 'WHERE IdObj IN '
	DB	'(', 00H
	ORG $+2
$SG70918 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70920 DB	' AND ', 00H
	ORG $+2
$SG70921 DB	'AND DateDel IS NULL AND IdField=', 00H
	ORG $+3
$SG70923 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70927 DB	'IdRelObj=', 00H
	ORG $+2
$SG70929 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70933 DB	'IdValue=', 00H
	ORG $+3
$SG70935 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70938 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70943 DB	'SELECT DISTINCT IdRelObj FROM TLink', 00H
$SG70945 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70949 DB	',IdList', 0aH, 'WHERE TLink.IdObj=IdList.IdObj', 0aH, 00H
$SG70951 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70956 DB	')', 0aH, 00H
	ORG $+1
$SG70957 DB	0aH, 'WHERE IdObj IN (', 00H
	ORG $+2
$SG70959 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70962 DB	'AND DateDel IS NULL AND IdField IN(', 00H
$SG70964 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70971 DB	',', 00H
	ORG $+2
$SG70973 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70976 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70979 DB	')', 00H
	ORG $+2
$SG70981 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70986 DB	'</td><td align=right valign=top><div align=left><font si'
	DB	'ze=-1>', 00H
	ORG $+1
$SG70988 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70996 DB	'<br>', 00H
	ORG $+3
$SG70998 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG71011 DB	'item_small_s.gif', 00H
	ORG $+3
$SG71012 DB	'item_small.gif', 00H
	ORG $+1
$SG71015 DB	'</div></td></tr></table>', 00H
	ORG $+3
$SG71017 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG71020 DB	'_EVA_SameCell', 00H
	ORG $+2
$SG71021 DB	'_EVA_NONE', 00H
	ORG $+2
$SG71042 DB	'_eva_item1.gif', 00H
	ORG $+1
$SG71043 DB	'_eva_item.gif', 00H
	ORG $+2
$SG71046 DB	'<br>', 00H
	ORG $+3
$SG71048 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG71050 DB	'D:\Travail\ABI\EVA\V4.0\CGI\Brunix-2016\ctrl_output_cata'
	DB	'log.c', 00H
	ORG $+2
$SG71051 DB	'output_catalog_group', 00H
	ORG $+3
$SG71053 DB	'D:\Travail\ABI\EVA\V4.0\CGI\Brunix-2016\ctrl_output_cata'
	DB	'log.c', 00H
	ORG $+2
$SG71054 DB	'output_catalog_group', 00H
_DATA	ENDS
_TEXT	SEGMENT
_cntxt$ = 8
_cat$ = 12
_ctrl$ = -124
_data$ = -92
_obj$ = -116
_sql$ = -4
_lbl$ = -120
_i$ = -96
_opname$ = -68
_html$ = -72
__tmp$70882 = -156
_idobj$70992 = -160
_list$71019 = -164
_idobj$71028 = -168
_output_catalog_group PROC NEAR

; 498  : ){

	push	ebp
	mov	ebp, esp
	sub	esp, 196				; 000000c4H
	push	edi

; 499  : 	EVA_ctrl *ctrl = cntxt->form->ctrl + cat->i_ctrl;

	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	ecx, DWORD PTR [eax+80]
	mov	edx, DWORD PTR _cat$[ebp]
	mov	eax, DWORD PTR [edx]
	imul	eax, 480				; 000001e0H
	mov	ecx, DWORD PTR [ecx]
	add	ecx, eax
	mov	DWORD PTR _ctrl$[ebp], ecx

; 500  : 	DynTable data = { 0 };

	mov	DWORD PTR _data$[ebp], 0
	xor	edx, edx
	mov	DWORD PTR _data$[ebp+4], edx
	mov	DWORD PTR _data$[ebp+8], edx
	mov	DWORD PTR _data$[ebp+12], edx
	mov	DWORD PTR _data$[ebp+16], edx

; 501  : 	DynTable obj = { 0 };

	mov	DWORD PTR _obj$[ebp], 0
	xor	eax, eax
	mov	DWORD PTR _obj$[ebp+4], eax
	mov	DWORD PTR _obj$[ebp+8], eax
	mov	DWORD PTR _obj$[ebp+12], eax
	mov	DWORD PTR _obj$[ebp+16], eax

; 502  : 	DynBuffer *sql = NULL;

	mov	DWORD PTR _sql$[ebp], 0

; 503  : 	DynBuffer *lbl = NULL;

	mov	DWORD PTR _lbl$[ebp], 0

; 504  : 	unsigned long i = 0;

	mov	DWORD PTR _i$[ebp], 0

; 505  : 	char opname[64];
; 506  : 	CHECK_HTML_STATUS;

	cmp	DWORD PTR _cntxt$[ebp], 0
	je	SHORT $L71588
	mov	ecx, DWORD PTR _cntxt$[ebp]
	cmp	DWORD PTR [ecx+80], 0
	je	SHORT $L71586
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	eax, DWORD PTR [edx+80]
	mov	ecx, DWORD PTR [eax+232]
	mov	DWORD PTR -172+[ebp], ecx
	jmp	SHORT $L71587
$L71586:
	mov	DWORD PTR -172+[ebp], 0
$L71587:
	mov	edx, DWORD PTR -172+[ebp]
	mov	DWORD PTR -176+[ebp], edx
	jmp	SHORT $L71589
$L71588:
	mov	DWORD PTR -176+[ebp], 0
$L71589:
	mov	eax, DWORD PTR -176+[ebp]
	mov	DWORD PTR _html$[ebp], eax
	cmp	DWORD PTR _html$[ebp], 0
	jne	SHORT $L70852
	xor	eax, eax
	jmp	$L70839
$L70852:

; 507  : 
; 508  : 	/* Output each selected value */
; 509  : 	DYNBUF_ADD_STR(html, "<table width=100% style=\"border-bottom:3px double gray\"><tr><td><font size=-1>");

	push	0
	push	0
	push	78					; 0000004eH
	push	OFFSET FLAT:$SG70855
	mov	ecx, DWORD PTR _html$[ebp]
	push	ecx
	call	_dynbuf_add
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L70854
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29872], OFFSET FLAT:$SG70857
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 509		; 000001fdH
	jmp	$eva_err$70858
$L70854:

; 510  : 	if(CTRL_ATTR_CELL(NO_TREE) && output_catalog_title(cntxt, cat)) STACK_ERROR;

	cmp	DWORD PTR _ctrl$[ebp], 0
	je	SHORT $L71590
	push	0
	push	-1
	push	OFFSET FLAT:$SG70861
	mov	ecx, DWORD PTR _ctrl$[ebp]
	add	ecx, 44					; 0000002cH
	push	ecx
	call	_dyntab_field_cell
	add	esp, 16					; 00000010H
	mov	DWORD PTR -180+[ebp], eax
	jmp	SHORT $L71591
$L71590:
	mov	DWORD PTR -180+[ebp], 0
$L71591:
	cmp	DWORD PTR -180+[ebp], 0
	je	SHORT $L70860
	mov	edx, DWORD PTR _cat$[ebp]
	push	edx
	mov	eax, DWORD PTR _cntxt$[ebp]
	push	eax
	call	_output_catalog_title
	add	esp, 8
	test	eax, eax
	je	SHORT $L70860
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 510		; 000001feH
	jmp	$eva_err$70858
$L70860:

; 511  : 	for(i = 0; i < cat->key.nbrows - 1 && cat->k[i + 1].val.nbrows && cat->k[i + 1].isel != ~0UL; i++)

	mov	DWORD PTR _i$[ebp], 0
	jmp	SHORT $L70862
$L70863:
	mov	edx, DWORD PTR _i$[ebp]
	add	edx, 1
	mov	DWORD PTR _i$[ebp], edx
$L70862:
	mov	eax, DWORD PTR _cat$[ebp]
	mov	ecx, DWORD PTR [eax+4]
	sub	ecx, 1
	cmp	DWORD PTR _i$[ebp], ecx
	jae	SHORT $L70864
	mov	edx, DWORD PTR _i$[ebp]
	add	edx, 1
	imul	edx, 36					; 00000024H
	mov	eax, DWORD PTR _cat$[ebp]
	mov	ecx, DWORD PTR [eax+164]
	cmp	DWORD PTR [ecx+edx+16], 0
	je	SHORT $L70864
	mov	edx, DWORD PTR _i$[ebp]
	add	edx, 1
	imul	edx, 36					; 00000024H
	mov	eax, DWORD PTR _cat$[ebp]
	mov	ecx, DWORD PTR [eax+164]
	cmp	DWORD PTR [ecx+edx+12], -1
	je	SHORT $L70864

; 512  : 		if(output_value_button(cntxt, cat, i, cat->k[i].isel, "catalog_dot.gif", "catalog_dot_s.gif")) STACK_ERROR;

	push	OFFSET FLAT:$SG70866
	push	OFFSET FLAT:$SG70867
	mov	edx, DWORD PTR _i$[ebp]
	imul	edx, 36					; 00000024H
	mov	eax, DWORD PTR _cat$[ebp]
	mov	ecx, DWORD PTR [eax+164]
	mov	edx, DWORD PTR [ecx+edx+12]
	push	edx
	mov	eax, DWORD PTR _i$[ebp]
	push	eax
	mov	ecx, DWORD PTR _cat$[ebp]
	push	ecx
	mov	edx, DWORD PTR _cntxt$[ebp]
	push	edx
	call	_output_value_button
	add	esp, 24					; 00000018H
	test	eax, eax
	je	SHORT $L70865
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 512		; 00000200H
	jmp	$eva_err$70858
$L70865:
	jmp	$L70863
$L70864:

; 513  : 	DYNBUF_ADD_STR(html, "</font> <b>");

	push	0
	push	0
	push	11					; 0000000bH
	push	OFFSET FLAT:$SG70870
	mov	ecx, DWORD PTR _html$[ebp]
	push	ecx
	call	_dynbuf_add
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L70869
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29872], OFFSET FLAT:$SG70872
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 513		; 00000201H
	jmp	$eva_err$70858
$L70869:

; 514  : 	if(cat->k[i].val.nbrows &&
; 515  : 		output_value_button(cntxt, cat, i, cat->k[i].isel, "catalog_dot.gif", "catalog_dot_s.gif")) STACK_ERROR;

	mov	ecx, DWORD PTR _i$[ebp]
	imul	ecx, 36					; 00000024H
	mov	edx, DWORD PTR _cat$[ebp]
	mov	eax, DWORD PTR [edx+164]
	cmp	DWORD PTR [eax+ecx+16], 0
	je	SHORT $L70873
	push	OFFSET FLAT:$SG70874
	push	OFFSET FLAT:$SG70875
	mov	ecx, DWORD PTR _i$[ebp]
	imul	ecx, 36					; 00000024H
	mov	edx, DWORD PTR _cat$[ebp]
	mov	eax, DWORD PTR [edx+164]
	mov	ecx, DWORD PTR [eax+ecx+12]
	push	ecx
	mov	edx, DWORD PTR _i$[ebp]
	push	edx
	mov	eax, DWORD PTR _cat$[ebp]
	push	eax
	mov	ecx, DWORD PTR _cntxt$[ebp]
	push	ecx
	call	_output_value_button
	add	esp, 24					; 00000018H
	test	eax, eax
	je	SHORT $L70873
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 515		; 00000203H
	jmp	$eva_err$70858
$L70873:

; 516  : 	DYNBUF_ADD_STR(html, "</td></tr></table>");

	push	0
	push	0
	push	18					; 00000012H
	push	OFFSET FLAT:$SG70878
	mov	eax, DWORD PTR _html$[ebp]
	push	eax
	call	_dynbuf_add
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L70877
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29872], OFFSET FLAT:$SG70880
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 516		; 00000204H
	jmp	$eva_err$70858
$L70877:

; 517  : 
; 518  : 	/* Read image file name */
; 519  : 	if(cat->idimg_r)

	mov	eax, DWORD PTR _cat$[ebp]
	cmp	DWORD PTR [eax+152], 0
	je	SHORT $L70881

; 521  : 		DYNTAB_ADD_INT(&data, 0, 0, cat->idsel);

	mov	BYTE PTR __tmp$70882[ebp], 0
	mov	ecx, 7
	xor	eax, eax
	lea	edi, DWORD PTR __tmp$70882[ebp+1]
	rep stosd
	stosw
	stosb
	mov	ecx, DWORD PTR _cat$[ebp]
	mov	edx, DWORD PTR [ecx+172]
	push	edx
	push	OFFSET FLAT:$SG70883
	lea	eax, DWORD PTR __tmp$70882[ebp]
	push	eax
	call	_sprintf
	add	esp, 12					; 0000000cH
	push	0
	push	0
	push	0
	lea	ecx, DWORD PTR __tmp$70882[ebp]
	push	ecx
	push	0
	push	0
	lea	edx, DWORD PTR _data$[ebp]
	push	edx
	call	_dyntab_add
	add	esp, 28					; 0000001cH
	test	eax, eax
	je	SHORT $L70885
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29872], OFFSET FLAT:$SG70887
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 521		; 00000209H
	jmp	$eva_err$70858
$L70885:

; 523  : 	else

	jmp	$L70894
$L70881:

; 525  : 		DYNBUF_ADD3_INT(&sql, "SELECT TxtValue FROM TVal WHERE IdValue=", cat->idsel, "");

	push	0
	push	OFFSET FLAT:$SG70890
	mov	edx, DWORD PTR _cat$[ebp]
	mov	eax, DWORD PTR [edx+172]
	push	eax
	push	40					; 00000028H
	push	OFFSET FLAT:$SG70891
	lea	ecx, DWORD PTR _sql$[ebp]
	push	ecx
	call	_dynbuf_add3_int
	add	esp, 24					; 00000018H
	test	eax, eax
	je	SHORT $L70889
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29872], OFFSET FLAT:$SG70893
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 525		; 0000020dH
	jmp	$eva_err$70858
$L70889:

; 526  : 		if(sql_exec_query(cntxt, sql->data) || sql_get_table(cntxt, &data, 0)) STACK_ERROR;

	mov	ecx, DWORD PTR _sql$[ebp]
	add	ecx, 8
	push	ecx
	mov	edx, DWORD PTR _cntxt$[ebp]
	push	edx
	call	_sql_exec_query
	add	esp, 8
	test	eax, eax
	jne	SHORT $L70895
	push	0
	lea	eax, DWORD PTR _data$[ebp]
	push	eax
	mov	ecx, DWORD PTR _cntxt$[ebp]
	push	ecx
	call	_sql_get_table
	add	esp, 12					; 0000000cH
	test	eax, eax
	je	SHORT $L70894
$L70895:
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 526		; 0000020eH
	jmp	$eva_err$70858
$L70894:

; 528  : 
; 529  : 	/* Output image */
; 530  : 	DYNBUF_ADD_STR(html, "<table width=100%><tr><td>");

	push	0
	push	0
	push	26					; 0000001aH
	push	OFFSET FLAT:$SG70898
	mov	eax, DWORD PTR _html$[ebp]
	push	eax
	call	_dynbuf_add
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L70897
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29872], OFFSET FLAT:$SG70900
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 530		; 00000212H
	jmp	$eva_err$70858
$L70897:

; 531  : 	if(put_html_image_dir(cntxt, NULL, dyntab_val(&cat->imgdir, 0, 0), dyntab_val(&data, 0, 0), NULL,
; 532  : 								cat->dw1, cat->dh1, 0, 0, NULL, NULL)) STACK_ERROR;

	push	0
	push	0
	push	0
	push	0
	mov	eax, DWORD PTR _cat$[ebp]
	add	eax, 80					; 00000050H
	push	eax
	mov	ecx, DWORD PTR _cat$[ebp]
	add	ecx, 64					; 00000040H
	push	ecx
	push	0
	push	0
	push	0
	lea	edx, DWORD PTR _data$[ebp]
	push	edx
	call	_dyntab_val
	add	esp, 12					; 0000000cH
	push	eax
	push	0
	push	0
	mov	eax, DWORD PTR _cat$[ebp]
	add	eax, 44					; 0000002cH
	push	eax
	call	_dyntab_val
	add	esp, 12					; 0000000cH
	push	eax
	push	0
	mov	ecx, DWORD PTR _cntxt$[ebp]
	push	ecx
	call	_put_html_image_dir
	add	esp, 44					; 0000002cH
	test	eax, eax
	je	SHORT $L70905
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 532		; 00000214H
	jmp	$eva_err$70858
$L70905:

; 533  : 
; 534  : 	/* Read objects with selected image */
; 535  : 	M_FREE(sql);

	mov	eax, DWORD PTR _sql$[ebp]
	push	eax
	call	_mem_free
	add	esp, 4
	mov	DWORD PTR _sql$[ebp], 0

; 536  : 	if(ctrl->i_child) DYNBUF_ADD_STR(&sql, "CREATE TEMPORARY TABLE IdList\n");

	mov	ecx, DWORD PTR _ctrl$[ebp]
	cmp	DWORD PTR [ecx+24], 0
	je	SHORT $L70908
	push	0
	push	0
	push	30					; 0000001eH
	push	OFFSET FLAT:$SG70909
	lea	edx, DWORD PTR _sql$[ebp]
	push	edx
	call	_dynbuf_add
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L70908
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29872], OFFSET FLAT:$SG70911
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 536		; 00000218H
	jmp	$eva_err$70858
$L70908:

; 538  : 		"SELECT DISTINCT IdObj FROM TLink\n"
; 539  : 		"WHERE IdObj IN (", cat->id, NO_CONV, ")\n");

	mov	edx, DWORD PTR _cat$[ebp]
	cmp	DWORD PTR [edx+156], 0
	je	SHORT $L71592
	mov	eax, DWORD PTR _cat$[ebp]
	mov	ecx, DWORD PTR [eax+156]
	mov	edx, DWORD PTR [ecx+4]
	mov	DWORD PTR -184+[ebp], edx
	jmp	SHORT $L71593
$L71592:
	mov	DWORD PTR -184+[ebp], 0
$L71593:
	mov	eax, DWORD PTR _cat$[ebp]
	cmp	DWORD PTR [eax+156], 0
	je	SHORT $L71594
	mov	ecx, DWORD PTR _cat$[ebp]
	mov	edx, DWORD PTR [ecx+156]
	add	edx, 8
	mov	DWORD PTR -188+[ebp], edx
	jmp	SHORT $L71595
$L71594:
	mov	DWORD PTR -188+[ebp], 0
$L71595:
	push	2
	push	OFFSET FLAT:$SG70915
	push	0
	push	0
	mov	eax, DWORD PTR -184+[ebp]
	push	eax
	mov	ecx, DWORD PTR -188+[ebp]
	push	ecx
	push	49					; 00000031H
	push	OFFSET FLAT:$SG70916
	lea	edx, DWORD PTR _sql$[ebp]
	push	edx
	call	_dynbuf_add3
	add	esp, 36					; 00000024H
	test	eax, eax
	je	SHORT $L70914
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29872], OFFSET FLAT:$SG70918
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 539		; 0000021bH
	jmp	$eva_err$70858
$L70914:

; 541  : 		"AND DateDel IS NULL AND IdField=", cat->idimg, " AND ");

	push	5
	push	OFFSET FLAT:$SG70920
	mov	edx, DWORD PTR _cat$[ebp]
	mov	eax, DWORD PTR [edx+148]
	push	eax
	push	32					; 00000020H
	push	OFFSET FLAT:$SG70921
	lea	ecx, DWORD PTR _sql$[ebp]
	push	ecx
	call	_dynbuf_add3_int
	add	esp, 24					; 00000018H
	test	eax, eax
	je	SHORT $L70919
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29872], OFFSET FLAT:$SG70923
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 541		; 0000021dH
	jmp	$eva_err$70858
$L70919:

; 542  : 	if(cat->idimg_r) DYNBUF_ADD_STR(&sql, "IdRelObj=") else DYNBUF_ADD_STR(&sql, "IdValue=");

	mov	ecx, DWORD PTR _cat$[ebp]
	cmp	DWORD PTR [ecx+152], 0
	je	SHORT $L70924
	push	0
	push	0
	push	9
	push	OFFSET FLAT:$SG70927
	lea	edx, DWORD PTR _sql$[ebp]
	push	edx
	call	_dynbuf_add
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L70926
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29872], OFFSET FLAT:$SG70929
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 542		; 0000021eH
	jmp	$eva_err$70858
$L70926:
	jmp	SHORT $L70932
$L70924:
	push	0
	push	0
	push	8
	push	OFFSET FLAT:$SG70933
	lea	edx, DWORD PTR _sql$[ebp]
	push	edx
	call	_dynbuf_add
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L70932
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29872], OFFSET FLAT:$SG70935
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 542		; 0000021eH
	jmp	$eva_err$70858
$L70932:

; 543  : 	DYNBUF_ADD_INT(&sql, cat->idsel);

	mov	edx, DWORD PTR _cat$[ebp]
	mov	eax, DWORD PTR [edx+172]
	push	eax
	lea	ecx, DWORD PTR _sql$[ebp]
	push	ecx
	call	_dynbuf_add_int
	add	esp, 8
	test	eax, eax
	je	SHORT $L70936
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29872], OFFSET FLAT:$SG70938
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 543		; 0000021fH
	jmp	$eva_err$70858
$L70936:

; 544  : 	if(sql_exec_query(cntxt, sql->data) || (!ctrl->i_child && sql_get_table(cntxt, &data, 0)) ) STACK_ERROR;

	mov	ecx, DWORD PTR _sql$[ebp]
	add	ecx, 8
	push	ecx
	mov	edx, DWORD PTR _cntxt$[ebp]
	push	edx
	call	_sql_exec_query
	add	esp, 8
	test	eax, eax
	jne	SHORT $L70940
	mov	eax, DWORD PTR _ctrl$[ebp]
	cmp	DWORD PTR [eax+24], 0
	jne	SHORT $L70939
	push	0
	lea	ecx, DWORD PTR _data$[ebp]
	push	ecx
	mov	edx, DWORD PTR _cntxt$[ebp]
	push	edx
	call	_sql_get_table
	add	esp, 12					; 0000000cH
	test	eax, eax
	je	SHORT $L70939
$L70940:
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 544		; 00000220H
	jmp	$eva_err$70858
$L70939:

; 545  : 
; 546  : 	/* Read & output links */
; 547  : 	M_FREE(sql);

	mov	ecx, DWORD PTR _sql$[ebp]
	push	ecx
	call	_mem_free
	add	esp, 4
	mov	DWORD PTR _sql$[ebp], 0

; 549  : 		"SELECT DISTINCT IdRelObj FROM TLink");

	push	0
	push	0
	push	35					; 00000023H
	push	OFFSET FLAT:$SG70943
	lea	edx, DWORD PTR _sql$[ebp]
	push	edx
	call	_dynbuf_add
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L70942
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29872], OFFSET FLAT:$SG70945
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 549		; 00000225H
	jmp	$eva_err$70858
$L70942:

; 550  : 	if(ctrl->i_child)

	mov	edx, DWORD PTR _ctrl$[ebp]
	cmp	DWORD PTR [edx+24], 0
	je	SHORT $L70946

; 551  : 		DYNBUF_ADD_STR(&sql, ",IdList\nWHERE TLink.IdObj=IdList.IdObj\n")

	push	0
	push	0
	push	39					; 00000027H
	push	OFFSET FLAT:$SG70949
	lea	eax, DWORD PTR _sql$[ebp]
	push	eax
	call	_dynbuf_add
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L70948
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29872], OFFSET FLAT:$SG70951
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 551		; 00000227H
	jmp	$eva_err$70858
$L70948:

; 552  : 	else

	jmp	$L70955
$L70946:

; 553  : 		DYNBUF_ADD3_BUF(&sql, "\nWHERE IdObj IN (", cat->id, NO_CONV, ")\n");

	mov	eax, DWORD PTR _cat$[ebp]
	cmp	DWORD PTR [eax+156], 0
	je	SHORT $L71596
	mov	ecx, DWORD PTR _cat$[ebp]
	mov	edx, DWORD PTR [ecx+156]
	mov	eax, DWORD PTR [edx+4]
	mov	DWORD PTR -192+[ebp], eax
	jmp	SHORT $L71597
$L71596:
	mov	DWORD PTR -192+[ebp], 0
$L71597:
	mov	ecx, DWORD PTR _cat$[ebp]
	cmp	DWORD PTR [ecx+156], 0
	je	SHORT $L71598
	mov	edx, DWORD PTR _cat$[ebp]
	mov	eax, DWORD PTR [edx+156]
	add	eax, 8
	mov	DWORD PTR -196+[ebp], eax
	jmp	SHORT $L71599
$L71598:
	mov	DWORD PTR -196+[ebp], 0
$L71599:
	push	2
	push	OFFSET FLAT:$SG70956
	push	0
	push	0
	mov	ecx, DWORD PTR -192+[ebp]
	push	ecx
	mov	edx, DWORD PTR -196+[ebp]
	push	edx
	push	17					; 00000011H
	push	OFFSET FLAT:$SG70957
	lea	eax, DWORD PTR _sql$[ebp]
	push	eax
	call	_dynbuf_add3
	add	esp, 36					; 00000024H
	test	eax, eax
	je	SHORT $L70955
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29872], OFFSET FLAT:$SG70959
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 553		; 00000229H
	jmp	$eva_err$70858
$L70955:

; 555  : 		"AND DateDel IS NULL AND IdField IN(");

	push	0
	push	0
	push	35					; 00000023H
	push	OFFSET FLAT:$SG70962
	lea	eax, DWORD PTR _sql$[ebp]
	push	eax
	call	_dynbuf_add
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L70961
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29872], OFFSET FLAT:$SG70964
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 555		; 0000022bH
	jmp	$eva_err$70858
$L70961:

; 556  : 	for(i = 0; i < cat->key.nbrows; i++)

	mov	DWORD PTR _i$[ebp], 0
	jmp	SHORT $L70965
$L70966:
	mov	eax, DWORD PTR _i$[ebp]
	add	eax, 1
	mov	DWORD PTR _i$[ebp], eax
$L70965:
	mov	ecx, DWORD PTR _cat$[ebp]
	mov	edx, DWORD PTR _i$[ebp]
	cmp	edx, DWORD PTR [ecx+4]
	jae	$L70967

; 558  : 		if(i) DYNBUF_ADD_STR(&sql, ",");

	cmp	DWORD PTR _i$[ebp], 0
	je	SHORT $L70970
	push	0
	push	0
	push	1
	push	OFFSET FLAT:$SG70971
	lea	eax, DWORD PTR _sql$[ebp]
	push	eax
	call	_dynbuf_add
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L70970
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29872], OFFSET FLAT:$SG70973
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 558		; 0000022eH
	jmp	$eva_err$70858
$L70970:

; 559  : 		DYNBUF_ADD_INT(&sql, cat->k[i].idfld);

	mov	eax, DWORD PTR _i$[ebp]
	imul	eax, 36					; 00000024H
	mov	ecx, DWORD PTR _cat$[ebp]
	mov	edx, DWORD PTR [ecx+164]
	mov	eax, DWORD PTR [edx+eax]
	push	eax
	lea	ecx, DWORD PTR _sql$[ebp]
	push	ecx
	call	_dynbuf_add_int
	add	esp, 8
	test	eax, eax
	je	SHORT $L70974
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29872], OFFSET FLAT:$SG70976
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 559		; 0000022fH
	jmp	$eva_err$70858
$L70974:

; 560  : 	}

	jmp	$L70966
$L70967:

; 561  : 	DYNBUF_ADD_STR(&sql, ")");

	push	0
	push	0
	push	1
	push	OFFSET FLAT:$SG70979
	lea	ecx, DWORD PTR _sql$[ebp]
	push	ecx
	call	_dynbuf_add
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L70978
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29872], OFFSET FLAT:$SG70981
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 561		; 00000231H
	jmp	$eva_err$70858
$L70978:

; 562  : 	if(sql_exec_query(cntxt, sql->data) || sql_get_table(cntxt, &obj, 0)) STACK_ERROR;

	mov	ecx, DWORD PTR _sql$[ebp]
	add	ecx, 8
	push	ecx
	mov	edx, DWORD PTR _cntxt$[ebp]
	push	edx
	call	_sql_exec_query
	add	esp, 8
	test	eax, eax
	jne	SHORT $L70983
	push	0
	lea	eax, DWORD PTR _obj$[ebp]
	push	eax
	mov	ecx, DWORD PTR _cntxt$[ebp]
	push	ecx
	call	_sql_get_table
	add	esp, 12					; 0000000cH
	test	eax, eax
	je	SHORT $L70982
$L70983:
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 562		; 00000232H
	jmp	$eva_err$70858
$L70982:

; 563  : 	DYNBUF_ADD_STR(html, "</td><td align=right valign=top><div align=left><font size=-1>");

	push	0
	push	0
	push	62					; 0000003eH
	push	OFFSET FLAT:$SG70986
	mov	eax, DWORD PTR _html$[ebp]
	push	eax
	call	_dynbuf_add
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L70985
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29872], OFFSET FLAT:$SG70988
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 563		; 00000233H
	jmp	$eva_err$70858
$L70985:

; 564  : 	for(i = 0; i < obj.nbrows; i++)

	mov	DWORD PTR _i$[ebp], 0
	jmp	SHORT $L70989
$L70990:
	mov	eax, DWORD PTR _i$[ebp]
	add	eax, 1
	mov	DWORD PTR _i$[ebp], eax
$L70989:
	mov	ecx, DWORD PTR _i$[ebp]
	cmp	ecx, DWORD PTR _obj$[ebp]
	jae	$L70991

; 566  : 		unsigned long idobj = DYNTAB_TOULRC(&obj, i, 0);

	push	10					; 0000000aH
	push	0
	push	0
	mov	edx, DWORD PTR _i$[ebp]
	push	edx
	lea	eax, DWORD PTR _obj$[ebp]
	push	eax
	call	_dyntab_val
	add	esp, 12					; 0000000cH
	push	eax
	call	_strtoul
	add	esp, 12					; 0000000cH
	mov	DWORD PTR _idobj$70992[ebp], eax

; 567  : 		build_open_btn_name(cntxt, opname, 0, idobj, 0, 0);

	push	0
	push	0
	mov	ecx, DWORD PTR _idobj$70992[ebp]
	push	ecx
	push	0
	lea	edx, DWORD PTR _opname$[ebp]
	push	edx
	mov	eax, DWORD PTR _cntxt$[ebp]
	push	eax
	call	_build_open_btn_name
	add	esp, 24					; 00000018H

; 568  : 		DYNBUF_ADD_STR(html, "<br>");

	push	0
	push	0
	push	4
	push	OFFSET FLAT:$SG70996
	mov	ecx, DWORD PTR _html$[ebp]
	push	ecx
	call	_dynbuf_add
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L70995
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29872], OFFSET FLAT:$SG70998
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 568		; 00000238H
	jmp	$eva_err$70858
$L70995:

; 569  : 		if(qry_obj_label(cntxt, NULL, NULL, &lbl, NULL, NULL, NULL, NULL, NULL, 0, NULL, idobj) ||
; 570  : 			(lbl && put_html_button(cntxt, opname, lbl->data, "item_small.gif", "item_small_s.gif", NULL, 0, 12)) )

	mov	ecx, DWORD PTR _idobj$70992[ebp]
	push	ecx
	push	0
	push	0
	push	0
	push	0
	push	0
	push	0
	push	0
	lea	edx, DWORD PTR _lbl$[ebp]
	push	edx
	push	0
	push	0
	mov	eax, DWORD PTR _cntxt$[ebp]
	push	eax
	call	_qry_obj_label
	add	esp, 48					; 00000030H
	test	eax, eax
	jne	SHORT $L71010
	cmp	DWORD PTR _lbl$[ebp], 0
	je	SHORT $L71009
	push	12					; 0000000cH
	push	0
	push	0
	push	0
	push	0
	push	0
	push	OFFSET FLAT:$SG71011
	push	OFFSET FLAT:$SG71012
	mov	ecx, DWORD PTR _lbl$[ebp]
	add	ecx, 8
	push	ecx
	lea	edx, DWORD PTR _opname$[ebp]
	push	edx
	mov	eax, DWORD PTR _cntxt$[ebp]
	push	eax
	call	_put_html_button_sz
	add	esp, 44					; 0000002cH
	test	eax, eax
	je	SHORT $L71009
$L71010:

; 571  : 			STACK_ERROR;

	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 571		; 0000023bH
	jmp	$eva_err$70858
$L71009:

; 572  : 	}

	jmp	$L70990
$L70991:

; 573  : 	DYNBUF_ADD_STR(html, "</div></td></tr></table>");

	push	0
	push	0
	push	24					; 00000018H
	push	OFFSET FLAT:$SG71015
	mov	edx, DWORD PTR _html$[ebp]
	push	edx
	call	_dynbuf_add
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L71014
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29872], OFFSET FLAT:$SG71017
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 573		; 0000023dH
	jmp	$eva_err$70858
$L71014:

; 574  : 
; 575  : 	/* If display list given */
; 576  : 	if(ctrl->i_child)

	mov	edx, DWORD PTR _ctrl$[ebp]
	cmp	DWORD PTR [edx+24], 0
	je	$L71018

; 578  : 		/* Output list */
; 579  : 		EVA_ctrl *list = cntxt->form->ctrl + ctrl->i_child;

	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	ecx, DWORD PTR [eax+80]
	mov	edx, DWORD PTR _ctrl$[ebp]
	mov	eax, DWORD PTR [edx+24]
	imul	eax, 480				; 000001e0H
	mov	ecx, DWORD PTR [ecx]
	add	ecx, eax
	mov	DWORD PTR _list$71019[ebp], ecx

; 580  : 		list->POSITION = "_EVA_SameCell";

	mov	edx, DWORD PTR _list$71019[ebp]
	mov	DWORD PTR [edx+296], OFFSET FLAT:$SG71020

; 581  : 		list->LABELPOS = "_EVA_NONE";

	mov	eax, DWORD PTR _list$71019[ebp]
	mov	DWORD PTR [eax+292], OFFSET FLAT:$SG71021

; 582  : 		list->objtbl->from_idlist = 1;

	mov	ecx, DWORD PTR _list$71019[ebp]
	mov	edx, DWORD PTR [ecx+232]
	mov	DWORD PTR [edx+28], 1

; 583  : 		CTRL_PRI_HDLR(ctrl->i_child);

	mov	eax, DWORD PTR _ctrl$[ebp]
	cmp	DWORD PTR [eax+24], 0
	je	SHORT $L71023
	mov	ecx, DWORD PTR _ctrl$[ebp]
	mov	edx, DWORD PTR [ecx+24]
	push	edx
	mov	eax, DWORD PTR _cntxt$[ebp]
	push	eax
	call	_ctrl_primary_handler
	add	esp, 8
	test	eax, eax
	je	SHORT $L71023
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 583		; 00000247H
	jmp	$eva_err$70858
$L71023:

; 585  : 	else

	jmp	$eva_noerr$71049
$L71018:

; 586  : 		/* Output object labels */
; 587  : 		for(i = 0; i < data.nbrows; i++)

	mov	DWORD PTR _i$[ebp], 0
	jmp	SHORT $L71025
$L71026:
	mov	edx, DWORD PTR _i$[ebp]
	add	edx, 1
	mov	DWORD PTR _i$[ebp], edx
$L71025:
	mov	eax, DWORD PTR _i$[ebp]
	cmp	eax, DWORD PTR _data$[ebp]
	jae	$eva_noerr$71049

; 589  : 			/* Output object label as open button */
; 590  : 			unsigned long idobj = DYNTAB_TOULRC(&data, i, 0);

	push	10					; 0000000aH
	push	0
	push	0
	mov	ecx, DWORD PTR _i$[ebp]
	push	ecx
	lea	edx, DWORD PTR _data$[ebp]
	push	edx
	call	_dyntab_val
	add	esp, 12					; 0000000cH
	push	eax
	call	_strtoul
	add	esp, 12					; 0000000cH
	mov	DWORD PTR _idobj$71028[ebp], eax

; 591  : 			build_open_btn_name(cntxt, opname, 0, idobj, 0, 0);

	push	0
	push	0
	mov	eax, DWORD PTR _idobj$71028[ebp]
	push	eax
	push	0
	lea	ecx, DWORD PTR _opname$[ebp]
	push	ecx
	mov	edx, DWORD PTR _cntxt$[ebp]
	push	edx
	call	_build_open_btn_name
	add	esp, 24					; 00000018H

; 592  : 			if(qry_obj_label(cntxt, NULL, NULL, &lbl, NULL, NULL, NULL, NULL, NULL, 0, NULL, idobj) ||
; 593  : 				(lbl && put_html_button(cntxt, opname, lbl->data, "_eva_item.gif", "_eva_item1.gif", NULL, 0, 12)) )

	mov	eax, DWORD PTR _idobj$71028[ebp]
	push	eax
	push	0
	push	0
	push	0
	push	0
	push	0
	push	0
	push	0
	lea	ecx, DWORD PTR _lbl$[ebp]
	push	ecx
	push	0
	push	0
	mov	edx, DWORD PTR _cntxt$[ebp]
	push	edx
	call	_qry_obj_label
	add	esp, 48					; 00000030H
	test	eax, eax
	jne	SHORT $L71041
	cmp	DWORD PTR _lbl$[ebp], 0
	je	SHORT $L71040
	push	12					; 0000000cH
	push	0
	push	0
	push	0
	push	0
	push	0
	push	OFFSET FLAT:$SG71042
	push	OFFSET FLAT:$SG71043
	mov	eax, DWORD PTR _lbl$[ebp]
	add	eax, 8
	push	eax
	lea	ecx, DWORD PTR _opname$[ebp]
	push	ecx
	mov	edx, DWORD PTR _cntxt$[ebp]
	push	edx
	call	_put_html_button_sz
	add	esp, 44					; 0000002cH
	test	eax, eax
	je	SHORT $L71040
$L71041:

; 594  : 				STACK_ERROR;

	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 594		; 00000252H
	jmp	SHORT $eva_err$70858
$L71040:

; 595  : 			DYNBUF_ADD_STR(html, "<br>");

	push	0
	push	0
	push	4
	push	OFFSET FLAT:$SG71046
	mov	ecx, DWORD PTR _html$[ebp]
	push	ecx
	call	_dynbuf_add
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L71045
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29872], OFFSET FLAT:$SG71048
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 595		; 00000253H
	jmp	SHORT $eva_err$70858
$L71045:

; 596  : 		}

	jmp	$L71026
$eva_noerr$71049:

; 597  : 
; 598  : 	RETURN_OK_CLEANUP;

	push	0
	push	OFFSET FLAT:$SG71050
	push	OFFSET FLAT:$SG71051
	mov	ecx, DWORD PTR _cntxt$[ebp]
	push	ecx
	call	_err_clear
	add	esp, 16					; 00000010H
$eva_err$70858:
	mov	edx, DWORD PTR _cntxt$[ebp]
	cmp	DWORD PTR [edx+29872], 0
	je	SHORT $L71052
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	ecx, DWORD PTR [eax+29900]
	push	ecx
	push	OFFSET FLAT:$SG71053
	push	OFFSET FLAT:$SG71054
	mov	edx, DWORD PTR _cntxt$[ebp]
	push	edx
	call	_err_add_context
	add	esp, 16					; 00000010H
$L71052:
	lea	eax, DWORD PTR _data$[ebp]
	push	eax
	call	_dyntab_free
	add	esp, 4
	lea	ecx, DWORD PTR _obj$[ebp]
	push	ecx
	call	_dyntab_free
	add	esp, 4
	mov	edx, DWORD PTR _sql$[ebp]
	push	edx
	call	_mem_free
	add	esp, 4
	mov	DWORD PTR _sql$[ebp], 0
	mov	eax, DWORD PTR _lbl$[ebp]
	push	eax
	call	_mem_free
	add	esp, 4
	mov	DWORD PTR _lbl$[ebp], 0
	mov	ecx, DWORD PTR _cntxt$[ebp]
	xor	eax, eax
	cmp	DWORD PTR [ecx+29872], 0
	setne	al
$L70839:

; 599  : }

	pop	edi
	mov	esp, ebp
	pop	ebp
	ret	0
_output_catalog_group ENDP
_TEXT	ENDS
PUBLIC	_listobj_not_in
EXTRN	_qsort_col0:NEAR
EXTRN	_dyntab_from_list:NEAR
EXTRN	_dyntab_sort:NEAR
_DATA	SEGMENT
	ORG $+3
$SG71071 DB	',', 00H
	ORG $+2
$SG71073 DB	',', 00H
	ORG $+2
$SG71082 DB	',', 00H
_DATA	ENDS
_TEXT	SEGMENT
_res$ = 8
_nbres$ = 12
_lst_1$ = 16
_lst_2$ = 20
_t1$ = -20
_t2$ = -40
_i1$ = -44
_i2$ = -48
_cmp$71077 = -52
_c$71079 = -56
_listobj_not_in PROC NEAR

; 612  : ){

	push	ebp
	mov	ebp, esp
	sub	esp, 56					; 00000038H

; 613  : 	DynTable t1 = {0};

	mov	DWORD PTR _t1$[ebp], 0
	xor	eax, eax
	mov	DWORD PTR _t1$[ebp+4], eax
	mov	DWORD PTR _t1$[ebp+8], eax
	mov	DWORD PTR _t1$[ebp+12], eax
	mov	DWORD PTR _t1$[ebp+16], eax

; 614  : 	DynTable t2 = {0};

	mov	DWORD PTR _t2$[ebp], 0
	xor	ecx, ecx
	mov	DWORD PTR _t2$[ebp+4], ecx
	mov	DWORD PTR _t2$[ebp+8], ecx
	mov	DWORD PTR _t2$[ebp+12], ecx
	mov	DWORD PTR _t2$[ebp+16], ecx

; 615  : 	unsigned long i1 = 0, i2 = 0;

	mov	DWORD PTR _i1$[ebp], 0
	mov	DWORD PTR _i2$[ebp], 0

; 616  : 	M_FREE(*res);

	mov	edx, DWORD PTR _res$[ebp]
	mov	eax, DWORD PTR [edx]
	push	eax
	call	_mem_free
	add	esp, 4
	mov	ecx, DWORD PTR _res$[ebp]
	mov	DWORD PTR [ecx], 0

; 617  : 	if(lst_1 && dyntab_from_list(&t1, lst_1->data, lst_1->cnt, ",", 0, 0)) return 1;

	cmp	DWORD PTR _lst_1$[ebp], 0
	je	SHORT $L71070
	push	0
	push	0
	push	OFFSET FLAT:$SG71071
	mov	edx, DWORD PTR _lst_1$[ebp]
	mov	eax, DWORD PTR [edx+4]
	push	eax
	mov	ecx, DWORD PTR _lst_1$[ebp]
	add	ecx, 8
	push	ecx
	lea	edx, DWORD PTR _t1$[ebp]
	push	edx
	call	_dyntab_from_list
	add	esp, 24					; 00000018H
	test	eax, eax
	je	SHORT $L71070
	mov	eax, 1
	jmp	$L71065
$L71070:

; 618  : 	if(lst_2 && dyntab_from_list(&t2, lst_2->data, lst_2->cnt, ",", 0, 0)) return 1;

	cmp	DWORD PTR _lst_2$[ebp], 0
	je	SHORT $L71072
	push	0
	push	0
	push	OFFSET FLAT:$SG71073
	mov	eax, DWORD PTR _lst_2$[ebp]
	mov	ecx, DWORD PTR [eax+4]
	push	ecx
	mov	edx, DWORD PTR _lst_2$[ebp]
	add	edx, 8
	push	edx
	lea	eax, DWORD PTR _t2$[ebp]
	push	eax
	call	_dyntab_from_list
	add	esp, 24					; 00000018H
	test	eax, eax
	je	SHORT $L71072
	mov	eax, 1
	jmp	$L71065
$L71072:

; 619  : 	dyntab_sort(&t1, qsort_col0);

	push	OFFSET FLAT:_qsort_col0
	lea	ecx, DWORD PTR _t1$[ebp]
	push	ecx
	call	_dyntab_sort
	add	esp, 8

; 620  : 	dyntab_sort(&t2, qsort_col0);

	push	OFFSET FLAT:_qsort_col0
	lea	edx, DWORD PTR _t2$[ebp]
	push	edx
	call	_dyntab_sort
	add	esp, 8
$L71075:

; 621  : 	while(i1 < t1.nbrows)

	mov	eax, DWORD PTR _i1$[ebp]
	cmp	eax, DWORD PTR _t1$[ebp]
	jae	$L71076

; 623  : 		int cmp = dyntab_cmp(&t1, i1, 0, &t2, i2, 0);

	push	0
	mov	ecx, DWORD PTR _i2$[ebp]
	push	ecx
	lea	edx, DWORD PTR _t2$[ebp]
	push	edx
	push	0
	mov	eax, DWORD PTR _i1$[ebp]
	push	eax
	lea	ecx, DWORD PTR _t1$[ebp]
	push	ecx
	call	_dyntab_cmp
	add	esp, 24					; 00000018H
	mov	DWORD PTR _cmp$71077[ebp], eax

; 624  : 		if(cmp)

	cmp	DWORD PTR _cmp$71077[ebp], 0
	je	SHORT $L71085

; 626  : 			DynTableCell *c = dyntab_cell(&t1, i1, 0);

	push	0
	mov	edx, DWORD PTR _i1$[ebp]
	push	edx
	lea	eax, DWORD PTR _t1$[ebp]
	push	eax
	call	_dyntab_cell
	add	esp, 12					; 0000000cH
	mov	DWORD PTR _c$71079[ebp], eax

; 627  : 			if(*res && dynbuf_add(res, add_sz_str(","), NO_CONV)) return 1;

	mov	ecx, DWORD PTR _res$[ebp]
	cmp	DWORD PTR [ecx], 0
	je	SHORT $L71081
	push	0
	push	0
	push	1
	push	OFFSET FLAT:$SG71082
	mov	edx, DWORD PTR _res$[ebp]
	push	edx
	call	_dynbuf_add
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L71081
	mov	eax, 1
	jmp	SHORT $L71065
$L71081:

; 628  : 			if(dynbuf_add(res, c->txt, c->len, NO_CONV)) return 1;

	push	0
	push	0
	mov	eax, DWORD PTR _c$71079[ebp]
	mov	ecx, DWORD PTR [eax+4]
	push	ecx
	mov	edx, DWORD PTR _c$71079[ebp]
	mov	eax, DWORD PTR [edx]
	push	eax
	mov	ecx, DWORD PTR _res$[ebp]
	push	ecx
	call	_dynbuf_add
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L71084
	mov	eax, 1
	jmp	SHORT $L71065
$L71084:

; 629  : 			if(nbres) (*nbres)++;

	cmp	DWORD PTR _nbres$[ebp], 0
	je	SHORT $L71085
	mov	edx, DWORD PTR _nbres$[ebp]
	mov	eax, DWORD PTR [edx]
	add	eax, 1
	mov	ecx, DWORD PTR _nbres$[ebp]
	mov	DWORD PTR [ecx], eax
$L71085:

; 631  : 		i1++;

	mov	edx, DWORD PTR _i1$[ebp]
	add	edx, 1
	mov	DWORD PTR _i1$[ebp], edx

; 632  : 		if(cmp >= 0 && i2 < t2.nbrows) i2++;

	cmp	DWORD PTR _cmp$71077[ebp], 0
	jl	SHORT $L71086
	mov	eax, DWORD PTR _i2$[ebp]
	cmp	eax, DWORD PTR _t2$[ebp]
	jae	SHORT $L71086
	mov	ecx, DWORD PTR _i2$[ebp]
	add	ecx, 1
	mov	DWORD PTR _i2$[ebp], ecx
$L71086:

; 633  : 	}

	jmp	$L71075
$L71076:

; 634  : 	return 0;

	xor	eax, eax
$L71065:

; 635  : }

	mov	esp, ebp
	pop	ebp
	ret	0
_listobj_not_in ENDP
_TEXT	ENDS
PUBLIC	_qsort_col4
_BSS	SEGMENT
	ALIGN	4

$SG71097 DB	01H DUP (?)
	ALIGN	4

$SG71098 DB	01H DUP (?)
_BSS	ENDS
_TEXT	SEGMENT
_el1$ = 8
_el2$ = 12
_t1$ = -4
_t2$ = -8
_qsort_col4 PROC NEAR

; 642  : {

	push	ebp
	mov	ebp, esp
	sub	esp, 16					; 00000010H

; 643  : 	char *t1 = ((DynTableCell *)el1 + 4)->txt;

	mov	eax, DWORD PTR _el1$[ebp]
	mov	ecx, DWORD PTR [eax+256]
	mov	DWORD PTR _t1$[ebp], ecx

; 644  : 	char *t2 = ((DynTableCell *)el2 + 4)->txt;

	mov	edx, DWORD PTR _el2$[ebp]
	mov	eax, DWORD PTR [edx+256]
	mov	DWORD PTR _t2$[ebp], eax

; 645  : 	return STRCMPNUL(t1, t2);

	cmp	DWORD PTR _t2$[ebp], 0
	je	SHORT $L71602
	mov	ecx, DWORD PTR _t2$[ebp]
	mov	DWORD PTR -12+[ebp], ecx
	jmp	SHORT $L71603
$L71602:
	mov	DWORD PTR -12+[ebp], OFFSET FLAT:$SG71097
$L71603:
	cmp	DWORD PTR _t1$[ebp], 0
	je	SHORT $L71604
	mov	edx, DWORD PTR _t1$[ebp]
	mov	DWORD PTR -16+[ebp], edx
	jmp	SHORT $L71605
$L71604:
	mov	DWORD PTR -16+[ebp], OFFSET FLAT:$SG71098
$L71605:
	mov	eax, DWORD PTR -12+[ebp]
	push	eax
	mov	ecx, DWORD PTR -16+[ebp]
	push	ecx
	call	_strcmp
	add	esp, 8

; 646  : }

	mov	esp, ebp
	pop	ebp
	ret	0
_qsort_col4 ENDP
_TEXT	ENDS
PUBLIC	_prepare_catalog_values
EXTRN	_qry_obj_field:NEAR
EXTRN	_dyntab_set_txt:NEAR
_BSS	SEGMENT
	ALIGN	4

$SG71177 DB	01H DUP (?)
	ALIGN	4

$SG71257 DB	01H DUP (?)
_BSS	ENDS
_DATA	SEGMENT
	ORG $+2
$SG71125 DB	')', 0aH, 00H
	ORG $+1
$SG71126 DB	'SELECT IdValue,IdRelObj, COUNT(IdObj) FROM TLink', 0aH, 'W'
	DB	'HERE IdObj IN (', 00H
	ORG $+2
$SG71128 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG71130 DB	0aH, 'GROUP BY IdValue,IdRelObj', 0aH, 00H
$SG71131 DB	'AND DateDel IS NULL AND IdField=', 00H
	ORG $+3
$SG71133 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG71145 DB	'SELECT TxtValue FROM TVal WHERE IdValue=%lu', 00H
$SG71162 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG71168 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG71172 DB	')', 0aH, 00H
	ORG $+1
$SG71173 DB	'SELECT DISTINCT IdObj FROM TLink', 0aH, 'WHERE IdObj IN '
	DB	'(', 00H
	ORG $+2
$SG71175 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG71178 DB	'AND DateDel IS NULL AND IdField=', 00H
	ORG $+3
$SG71180 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG71188 DB	'_EVA_LABEL', 00H
	ORG $+1
$SG71191 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG71196 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG71202 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG71204 DB	'%lu', 00H
$SG71208 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG71210 DB	'_', 00H
	ORG $+2
$SG71212 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG71234 DB	'-- output_catalog_list : Read distinct images for select'
	DB	'ed objects', 0aH, 'SELECT DISTINCT ', 00H
$SG71236 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG71240 DB	'IdRelObj', 00H
	ORG $+3
$SG71242 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG71246 DB	'IdValue', 00H
$SG71248 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG71252 DB	')', 0aH, 00H
	ORG $+1
$SG71253 DB	' FROM TLink', 0aH, 'WHERE IdObj IN (', 00H
	ORG $+3
$SG71255 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG71258 DB	'AND DateDel IS NULL AND Num=1 AND IdField=', 00H
	ORG $+1
$SG71260 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG71265 DB	'D:\Travail\ABI\EVA\V4.0\CGI\Brunix-2016\ctrl_output_cata'
	DB	'log.c', 00H
	ORG $+2
$SG71266 DB	'prepare_catalog_values', 00H
	ORG $+1
$SG71268 DB	'D:\Travail\ABI\EVA\V4.0\CGI\Brunix-2016\ctrl_output_cata'
	DB	'log.c', 00H
	ORG $+2
$SG71269 DB	'prepare_catalog_values', 00H
_DATA	ENDS
_TEXT	SEGMENT
_cntxt$ = 8
_cat$ = 12
_data$ = -24
_sql$ = -4
_lbl$ = -40
_i$ = -32
_j$ = -36
_nbobj$ = -28
_idval$71139 = -48
_idrel$71141 = -44
_qry$71144 = -304
_irow$71185 = -308
__tmp$71203 = -340
_idval$71214 = -348
_idrel$71216 = -344
_idval$71222 = -356
_idrel$71224 = -352
_prepare_catalog_values PROC NEAR

; 659  : ){

	push	ebp
	mov	ebp, esp
	sub	esp, 396				; 0000018cH
	push	edi

; 660  : 	DynTable data = { 0 };

	mov	DWORD PTR _data$[ebp], 0
	xor	eax, eax
	mov	DWORD PTR _data$[ebp+4], eax
	mov	DWORD PTR _data$[ebp+8], eax
	mov	DWORD PTR _data$[ebp+12], eax
	mov	DWORD PTR _data$[ebp+16], eax

; 661  : 	DynBuffer *sql = NULL;

	mov	DWORD PTR _sql$[ebp], 0

; 662  : 	DynBuffer *lbl = NULL;

	mov	DWORD PTR _lbl$[ebp], 0

; 663  : 	unsigned long i, j;
; 664  : 	unsigned long nbobj = 0;

	mov	DWORD PTR _nbobj$[ebp], 0

; 665  : 
; 666  : 	/* Get key fields */
; 667  : 	for(i = 0; i <= cat->lvl && cat->id && cat->id->cnt; i++)

	mov	DWORD PTR _i$[ebp], 0
	jmp	SHORT $L71115
$L71116:
	mov	ecx, DWORD PTR _i$[ebp]
	add	ecx, 1
	mov	DWORD PTR _i$[ebp], ecx
$L71115:
	mov	edx, DWORD PTR _cat$[ebp]
	mov	eax, DWORD PTR _i$[ebp]
	cmp	eax, DWORD PTR [edx+168]
	ja	$L71117
	mov	ecx, DWORD PTR _cat$[ebp]
	cmp	DWORD PTR [ecx+156], 0
	je	$L71117
	mov	edx, DWORD PTR _cat$[ebp]
	mov	eax, DWORD PTR [edx+156]
	cmp	DWORD PTR [eax+4], 0
	je	$L71117

; 669  : 		/* Read field name */
; 670  : 		if(qry_obj_idfield(cntxt, &data, DYNTAB_TOULRC(&cat->key, i, 0), cntxt->val_FIELD)) STACK_ERROR;

	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	edx, DWORD PTR [ecx+269644]
	push	edx
	push	10					; 0000000aH
	push	0
	push	0
	mov	eax, DWORD PTR _i$[ebp]
	push	eax
	mov	ecx, DWORD PTR _cat$[ebp]
	add	ecx, 4
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
	call	_qry_obj_idfield
	add	esp, 16					; 00000010H
	test	eax, eax
	je	SHORT $L71119
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 670		; 0000029eH
	jmp	$eva_err$71120
$L71119:

; 671  : 		if(!data.nbrows) break;

	cmp	DWORD PTR _data$[ebp], 0
	jne	SHORT $L71121
	jmp	$L71117
$L71121:

; 672  : 		cat->k[i].idfld = dyntab_cell(&data, 0, 0)->IdValue;

	push	0
	push	0
	lea	edx, DWORD PTR _data$[ebp]
	push	edx
	call	_dyntab_cell
	add	esp, 12					; 0000000cH
	mov	ecx, DWORD PTR _i$[ebp]
	imul	ecx, 36					; 00000024H
	mov	edx, DWORD PTR _cat$[ebp]
	mov	edx, DWORD PTR [edx+164]
	mov	eax, DWORD PTR [eax+32]
	mov	DWORD PTR [edx+ecx], eax

; 673  : 
; 674  : 		/* Read field values */
; 675  : 		M_FREE(sql);

	mov	ecx, DWORD PTR _sql$[ebp]
	push	ecx
	call	_mem_free
	add	esp, 4
	mov	DWORD PTR _sql$[ebp], 0

; 677  : 			"SELECT IdValue,IdRelObj, COUNT(IdObj) FROM TLink\n"
; 678  : 			"WHERE IdObj IN (", cat->id, NO_CONV, ")\n");

	mov	edx, DWORD PTR _cat$[ebp]
	cmp	DWORD PTR [edx+156], 0
	je	SHORT $L71607
	mov	eax, DWORD PTR _cat$[ebp]
	mov	ecx, DWORD PTR [eax+156]
	mov	edx, DWORD PTR [ecx+4]
	mov	DWORD PTR -360+[ebp], edx
	jmp	SHORT $L71608
$L71607:
	mov	DWORD PTR -360+[ebp], 0
$L71608:
	mov	eax, DWORD PTR _cat$[ebp]
	cmp	DWORD PTR [eax+156], 0
	je	SHORT $L71609
	mov	ecx, DWORD PTR _cat$[ebp]
	mov	edx, DWORD PTR [ecx+156]
	add	edx, 8
	mov	DWORD PTR -364+[ebp], edx
	jmp	SHORT $L71610
$L71609:
	mov	DWORD PTR -364+[ebp], 0
$L71610:
	push	2
	push	OFFSET FLAT:$SG71125
	push	0
	push	0
	mov	eax, DWORD PTR -360+[ebp]
	push	eax
	mov	ecx, DWORD PTR -364+[ebp]
	push	ecx
	push	65					; 00000041H
	push	OFFSET FLAT:$SG71126
	lea	edx, DWORD PTR _sql$[ebp]
	push	edx
	call	_dynbuf_add3
	add	esp, 36					; 00000024H
	test	eax, eax
	je	SHORT $L71124
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29872], OFFSET FLAT:$SG71128
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 678		; 000002a6H
	jmp	$eva_err$71120
$L71124:

; 680  : 			"AND DateDel IS NULL AND IdField=", cat->k[i].idfld, "\n"
; 681  : 			"GROUP BY IdValue,IdRelObj\n");

	push	27					; 0000001bH
	push	OFFSET FLAT:$SG71130
	mov	edx, DWORD PTR _i$[ebp]
	imul	edx, 36					; 00000024H
	mov	eax, DWORD PTR _cat$[ebp]
	mov	ecx, DWORD PTR [eax+164]
	mov	edx, DWORD PTR [ecx+edx]
	push	edx
	push	32					; 00000020H
	push	OFFSET FLAT:$SG71131
	lea	eax, DWORD PTR _sql$[ebp]
	push	eax
	call	_dynbuf_add3_int
	add	esp, 24					; 00000018H
	test	eax, eax
	je	SHORT $L71129
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29872], OFFSET FLAT:$SG71133
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 681		; 000002a9H
	jmp	$eva_err$71120
$L71129:

; 682  : 		if(sql_exec_query(cntxt, sql->data) || sql_get_table(cntxt, &cat->k[i].val, 0)) STACK_ERROR;

	mov	eax, DWORD PTR _sql$[ebp]
	add	eax, 8
	push	eax
	mov	ecx, DWORD PTR _cntxt$[ebp]
	push	ecx
	call	_sql_exec_query
	add	esp, 8
	test	eax, eax
	jne	SHORT $L71135
	push	0
	mov	edx, DWORD PTR _i$[ebp]
	imul	edx, 36					; 00000024H
	mov	eax, DWORD PTR _cat$[ebp]
	mov	ecx, DWORD PTR [eax+164]
	lea	edx, DWORD PTR [ecx+edx+16]
	push	edx
	mov	eax, DWORD PTR _cntxt$[ebp]
	push	eax
	call	_sql_get_table
	add	esp, 12					; 0000000cH
	test	eax, eax
	je	SHORT $L71134
$L71135:
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 682		; 000002aaH
	jmp	$eva_err$71120
$L71134:

; 683  : 
; 684  : 		/* Build values labels */
; 685  : 		for(j = 0; j < cat->k[i].val.nbrows; j++)

	mov	DWORD PTR _j$[ebp], 0
	jmp	SHORT $L71136
$L71137:
	mov	edx, DWORD PTR _j$[ebp]
	add	edx, 1
	mov	DWORD PTR _j$[ebp], edx
$L71136:
	mov	eax, DWORD PTR _i$[ebp]
	imul	eax, 36					; 00000024H
	mov	ecx, DWORD PTR _cat$[ebp]
	mov	edx, DWORD PTR [ecx+164]
	mov	ecx, DWORD PTR _j$[ebp]
	cmp	ecx, DWORD PTR [edx+eax+16]
	jae	$L71138

; 687  : 			unsigned long idval = DYNTAB_TOULRC(&cat->k[i].val, j, col_IdVal);

	push	10					; 0000000aH
	push	0
	push	0
	mov	edx, DWORD PTR _j$[ebp]
	push	edx
	mov	eax, DWORD PTR _i$[ebp]
	imul	eax, 36					; 00000024H
	mov	ecx, DWORD PTR _cat$[ebp]
	mov	edx, DWORD PTR [ecx+164]
	lea	eax, DWORD PTR [edx+eax+16]
	push	eax
	call	_dyntab_val
	add	esp, 12					; 0000000cH
	push	eax
	call	_strtoul
	add	esp, 12					; 0000000cH
	mov	DWORD PTR _idval$71139[ebp], eax

; 688  : 			unsigned long idrel = DYNTAB_TOULRC(&cat->k[i].val, j, col_IdRel);

	push	10					; 0000000aH
	push	0
	push	1
	mov	ecx, DWORD PTR _j$[ebp]
	push	ecx
	mov	edx, DWORD PTR _i$[ebp]
	imul	edx, 36					; 00000024H
	mov	eax, DWORD PTR _cat$[ebp]
	mov	ecx, DWORD PTR [eax+164]
	lea	edx, DWORD PTR [ecx+edx+16]
	push	edx
	call	_dyntab_val
	add	esp, 12					; 0000000cH
	push	eax
	call	_strtoul
	add	esp, 12					; 0000000cH
	mov	DWORD PTR _idrel$71141[ebp], eax

; 689  : 
; 690  : 			/* Get displayed value */
; 691  : 			if(idval)

	cmp	DWORD PTR _idval$71139[ebp], 0
	je	SHORT $L71143

; 693  : 				/* Simple value : retrieve value text */
; 694  : 				char qry[256];
; 695  : 				snprintf(add_sz_str(qry), "SELECT TxtValue FROM TVal WHERE IdValue=%lu", idval);

	mov	eax, DWORD PTR _idval$71139[ebp]
	push	eax
	push	OFFSET FLAT:$SG71145
	push	255					; 000000ffH
	lea	ecx, DWORD PTR _qry$71144[ebp]
	push	ecx
	call	__snprintf
	add	esp, 16					; 00000010H

; 696  : 				if(sql_exec_query(cntxt, qry) || sql_get_buf(cntxt, &lbl, 2)) STACK_ERROR;

	lea	edx, DWORD PTR _qry$71144[ebp]
	push	edx
	mov	eax, DWORD PTR _cntxt$[ebp]
	push	eax
	call	_sql_exec_query
	add	esp, 8
	test	eax, eax
	jne	SHORT $L71147
	push	2
	lea	ecx, DWORD PTR _lbl$[ebp]
	push	ecx
	mov	edx, DWORD PTR _cntxt$[ebp]
	push	edx
	call	_sql_get_buf
	add	esp, 12					; 0000000cH
	test	eax, eax
	je	SHORT $L71146
$L71147:
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 696		; 000002b8H
	jmp	$eva_err$71120
$L71146:

; 698  : 			else

	jmp	SHORT $L71157
$L71143:

; 700  : 				/* Relation to other object : get object label */
; 701  : 				if(qry_obj_idfield(cntxt, &data, idrel, 0)) STACK_ERROR;

	push	0
	mov	ecx, DWORD PTR _idrel$71141[ebp]
	push	ecx
	lea	edx, DWORD PTR _data$[ebp]
	push	edx
	mov	eax, DWORD PTR _cntxt$[ebp]
	push	eax
	call	_qry_obj_idfield
	add	esp, 16					; 00000010H
	test	eax, eax
	je	SHORT $L71149
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 701		; 000002bdH
	jmp	$eva_err$71120
$L71149:

; 702  : 				if(qry_obj_label(cntxt, NULL, NULL, &lbl, NULL, NULL, NULL, NULL, NULL, 0, &data, 0)) STACK_ERROR;

	push	0
	lea	edx, DWORD PTR _data$[ebp]
	push	edx
	push	0
	push	0
	push	0
	push	0
	push	0
	push	0
	lea	eax, DWORD PTR _lbl$[ebp]
	push	eax
	push	0
	push	0
	mov	ecx, DWORD PTR _cntxt$[ebp]
	push	ecx
	call	_qry_obj_label
	add	esp, 48					; 00000030H
	test	eax, eax
	je	SHORT $L71157
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 702		; 000002beH
	jmp	$eva_err$71120
$L71157:

; 704  : 			DYNTAB_ADD_BUF(&cat->k[i].val, j, col_Label, lbl);

	cmp	DWORD PTR _lbl$[ebp], 0
	je	SHORT $L71158
	mov	eax, DWORD PTR _lbl$[ebp]
	cmp	DWORD PTR [eax+4], 0
	je	SHORT $L71158
	push	0
	push	0
	mov	ecx, DWORD PTR _lbl$[ebp]
	mov	edx, DWORD PTR [ecx+4]
	push	edx
	mov	eax, DWORD PTR _lbl$[ebp]
	add	eax, 8
	push	eax
	push	4
	mov	ecx, DWORD PTR _j$[ebp]
	push	ecx
	mov	edx, DWORD PTR _i$[ebp]
	imul	edx, 36					; 00000024H
	mov	eax, DWORD PTR _cat$[ebp]
	mov	ecx, DWORD PTR [eax+164]
	lea	edx, DWORD PTR [ecx+edx+16]
	push	edx
	call	_dyntab_add
	add	esp, 28					; 0000001cH
	test	eax, eax
	je	SHORT $L71160
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29872], OFFSET FLAT:$SG71162
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 704		; 000002c0H
	jmp	$eva_err$71120
$L71160:
	jmp	SHORT $L71166
$L71158:
	push	0
	push	0
	push	0
	push	0
	push	4
	mov	edx, DWORD PTR _j$[ebp]
	push	edx
	mov	eax, DWORD PTR _i$[ebp]
	imul	eax, 36					; 00000024H
	mov	ecx, DWORD PTR _cat$[ebp]
	mov	edx, DWORD PTR [ecx+164]
	lea	eax, DWORD PTR [edx+eax+16]
	push	eax
	call	_dyntab_add
	add	esp, 28					; 0000001cH
	test	eax, eax
	je	SHORT $L71166
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29872], OFFSET FLAT:$SG71168
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 704		; 000002c0H
	jmp	$eva_err$71120
$L71166:

; 705  : 		}

	jmp	$L71137
$L71138:

; 706  : 
; 707  : 		/* Check for objects without field values */
; 708  : 		M_FREE(sql);

	mov	eax, DWORD PTR _sql$[ebp]
	push	eax
	call	_mem_free
	add	esp, 4
	mov	DWORD PTR _sql$[ebp], 0

; 710  : 			"SELECT DISTINCT IdObj FROM TLink\n"
; 711  : 			"WHERE IdObj IN (", cat->id, NO_CONV, ")\n");

	mov	ecx, DWORD PTR _cat$[ebp]
	cmp	DWORD PTR [ecx+156], 0
	je	SHORT $L71611
	mov	edx, DWORD PTR _cat$[ebp]
	mov	eax, DWORD PTR [edx+156]
	mov	ecx, DWORD PTR [eax+4]
	mov	DWORD PTR -368+[ebp], ecx
	jmp	SHORT $L71612
$L71611:
	mov	DWORD PTR -368+[ebp], 0
$L71612:
	mov	edx, DWORD PTR _cat$[ebp]
	cmp	DWORD PTR [edx+156], 0
	je	SHORT $L71613
	mov	eax, DWORD PTR _cat$[ebp]
	mov	ecx, DWORD PTR [eax+156]
	add	ecx, 8
	mov	DWORD PTR -372+[ebp], ecx
	jmp	SHORT $L71614
$L71613:
	mov	DWORD PTR -372+[ebp], 0
$L71614:
	push	2
	push	OFFSET FLAT:$SG71172
	push	0
	push	0
	mov	edx, DWORD PTR -368+[ebp]
	push	edx
	mov	eax, DWORD PTR -372+[ebp]
	push	eax
	push	49					; 00000031H
	push	OFFSET FLAT:$SG71173
	lea	ecx, DWORD PTR _sql$[ebp]
	push	ecx
	call	_dynbuf_add3
	add	esp, 36					; 00000024H
	test	eax, eax
	je	SHORT $L71171
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29872], OFFSET FLAT:$SG71175
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 711		; 000002c7H
	jmp	$eva_err$71120
$L71171:

; 713  : 			"AND DateDel IS NULL AND IdField=", cat->k[i].idfld, "");

	push	0
	push	OFFSET FLAT:$SG71177
	mov	ecx, DWORD PTR _i$[ebp]
	imul	ecx, 36					; 00000024H
	mov	edx, DWORD PTR _cat$[ebp]
	mov	eax, DWORD PTR [edx+164]
	mov	ecx, DWORD PTR [eax+ecx]
	push	ecx
	push	32					; 00000020H
	push	OFFSET FLAT:$SG71178
	lea	edx, DWORD PTR _sql$[ebp]
	push	edx
	call	_dynbuf_add3_int
	add	esp, 24					; 00000018H
	test	eax, eax
	je	SHORT $L71176
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29872], OFFSET FLAT:$SG71180
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 713		; 000002c9H
	jmp	$eva_err$71120
$L71176:

; 714  : 		if(sql_exec_query(cntxt, sql->data) || sql_get_buf(cntxt, &lbl, 2)) STACK_ERROR;

	mov	edx, DWORD PTR _sql$[ebp]
	add	edx, 8
	push	edx
	mov	eax, DWORD PTR _cntxt$[ebp]
	push	eax
	call	_sql_exec_query
	add	esp, 8
	test	eax, eax
	jne	SHORT $L71182
	push	2
	lea	ecx, DWORD PTR _lbl$[ebp]
	push	ecx
	mov	edx, DWORD PTR _cntxt$[ebp]
	push	edx
	call	_sql_get_buf
	add	esp, 12					; 0000000cH
	test	eax, eax
	je	SHORT $L71181
$L71182:
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 714		; 000002caH
	jmp	$eva_err$71120
$L71181:

; 715  : 
; 716  : 		/* Add empty value if applicable */
; 717  : 		nbobj = 0;

	mov	DWORD PTR _nbobj$[ebp], 0

; 718  : 		if(!lbl || cntxt->sql_nbrows != cat->nbid)

	cmp	DWORD PTR _lbl$[ebp], 0
	je	SHORT $L71184
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	edx, DWORD PTR _cat$[ebp]
	mov	eax, DWORD PTR [ecx+29848]
	cmp	eax, DWORD PTR [edx+160]
	je	$L71209
$L71184:

; 720  : 			/* Set matching objects list */
; 721  : 			unsigned long irow = cat->k[i].val.nbrows;

	mov	ecx, DWORD PTR _i$[ebp]
	imul	ecx, 36					; 00000024H
	mov	edx, DWORD PTR _cat$[ebp]
	mov	eax, DWORD PTR [edx+164]
	mov	ecx, DWORD PTR [eax+ecx+16]
	mov	DWORD PTR _irow$71185[ebp], ecx

; 722  : 			if(qry_obj_field(cntxt, &data, DYNTAB_TOULRC(&cat->key, i, 0), "_EVA_LABEL")) STACK_ERROR;

	push	OFFSET FLAT:$SG71188
	push	10					; 0000000aH
	push	0
	push	0
	mov	edx, DWORD PTR _i$[ebp]
	push	edx
	mov	eax, DWORD PTR _cat$[ebp]
	add	eax, 4
	push	eax
	call	_dyntab_val
	add	esp, 12					; 0000000cH
	push	eax
	call	_strtoul
	add	esp, 12					; 0000000cH
	push	eax
	lea	ecx, DWORD PTR _data$[ebp]
	push	ecx
	mov	edx, DWORD PTR _cntxt$[ebp]
	push	edx
	call	_qry_obj_field
	add	esp, 16					; 00000010H
	test	eax, eax
	je	SHORT $L71187
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 722		; 000002d2H
	jmp	$eva_err$71120
$L71187:

; 723  : 			if(listobj_not_in(&sql, &nbobj, cat->id, lbl)) RETURN_ERR_MEMORY;

	mov	ecx, DWORD PTR _lbl$[ebp]
	push	ecx
	mov	edx, DWORD PTR _cat$[ebp]
	mov	eax, DWORD PTR [edx+156]
	push	eax
	lea	ecx, DWORD PTR _nbobj$[ebp]
	push	ecx
	lea	edx, DWORD PTR _sql$[ebp]
	push	edx
	call	_listobj_not_in
	add	esp, 16					; 00000010H
	test	eax, eax
	je	SHORT $L71189
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29872], OFFSET FLAT:$SG71191
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 723		; 000002d3H
	jmp	$eva_err$71120
$L71189:

; 724  : 			DYNTAB_ADD_BUF(&cat->k[i].val, irow, col_IdObj, sql);

	cmp	DWORD PTR _sql$[ebp], 0
	je	SHORT $L71192
	mov	edx, DWORD PTR _sql$[ebp]
	cmp	DWORD PTR [edx+4], 0
	je	SHORT $L71192
	push	0
	push	0
	mov	eax, DWORD PTR _sql$[ebp]
	mov	ecx, DWORD PTR [eax+4]
	push	ecx
	mov	edx, DWORD PTR _sql$[ebp]
	add	edx, 8
	push	edx
	push	3
	mov	eax, DWORD PTR _irow$71185[ebp]
	push	eax
	mov	ecx, DWORD PTR _i$[ebp]
	imul	ecx, 36					; 00000024H
	mov	edx, DWORD PTR _cat$[ebp]
	mov	eax, DWORD PTR [edx+164]
	lea	ecx, DWORD PTR [eax+ecx+16]
	push	ecx
	call	_dyntab_add
	add	esp, 28					; 0000001cH
	test	eax, eax
	je	SHORT $L71194
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29872], OFFSET FLAT:$SG71196
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 724		; 000002d4H
	jmp	$eva_err$71120
$L71194:
	jmp	SHORT $L71200
$L71192:
	push	0
	push	0
	push	0
	push	0
	push	3
	mov	ecx, DWORD PTR _irow$71185[ebp]
	push	ecx
	mov	edx, DWORD PTR _i$[ebp]
	imul	edx, 36					; 00000024H
	mov	eax, DWORD PTR _cat$[ebp]
	mov	ecx, DWORD PTR [eax+164]
	lea	edx, DWORD PTR [ecx+edx+16]
	push	edx
	call	_dyntab_add
	add	esp, 28					; 0000001cH
	test	eax, eax
	je	SHORT $L71200
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29872], OFFSET FLAT:$SG71202
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 724		; 000002d4H
	jmp	$eva_err$71120
$L71200:

; 725  : 			DYNTAB_ADD_INT(&cat->k[i].val, irow, col_NbObj, nbobj);

	mov	BYTE PTR __tmp$71203[ebp], 0
	mov	ecx, 7
	xor	eax, eax
	lea	edi, DWORD PTR __tmp$71203[ebp+1]
	rep stosd
	stosw
	stosb
	mov	edx, DWORD PTR _nbobj$[ebp]
	push	edx
	push	OFFSET FLAT:$SG71204
	lea	eax, DWORD PTR __tmp$71203[ebp]
	push	eax
	call	_sprintf
	add	esp, 12					; 0000000cH
	push	0
	push	0
	push	0
	lea	ecx, DWORD PTR __tmp$71203[ebp]
	push	ecx
	push	2
	mov	edx, DWORD PTR _irow$71185[ebp]
	push	edx
	mov	eax, DWORD PTR _i$[ebp]
	imul	eax, 36					; 00000024H
	mov	ecx, DWORD PTR _cat$[ebp]
	mov	edx, DWORD PTR [ecx+164]
	lea	eax, DWORD PTR [edx+eax+16]
	push	eax
	call	_dyntab_add
	add	esp, 28					; 0000001cH
	test	eax, eax
	je	SHORT $L71206
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29872], OFFSET FLAT:$SG71208
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 725		; 000002d5H
	jmp	$eva_err$71120
$L71206:

; 726  : 
; 727  : 			/* Set value label */
; 728  : 			DYNTAB_ADD_STR(&cat->k[i].val, irow, col_Label, "_");

	push	1
	push	OFFSET FLAT:$SG71210
	push	4
	mov	eax, DWORD PTR _irow$71185[ebp]
	push	eax
	mov	ecx, DWORD PTR _i$[ebp]
	imul	ecx, 36					; 00000024H
	mov	edx, DWORD PTR _cat$[ebp]
	mov	eax, DWORD PTR [edx+164]
	lea	ecx, DWORD PTR [eax+ecx+16]
	push	ecx
	call	_dyntab_set_txt
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L71209
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29872], OFFSET FLAT:$SG71212
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 728		; 000002d8H
	jmp	$eva_err$71120
$L71209:

; 730  : 
; 731  : 		/* Sort values */
; 732  : 		dyntab_sort(&cat->k[i].val, qsort_col4);

	push	OFFSET FLAT:_qsort_col4
	mov	ecx, DWORD PTR _i$[ebp]
	imul	ecx, 36					; 00000024H
	mov	edx, DWORD PTR _cat$[ebp]
	mov	eax, DWORD PTR [edx+164]
	lea	ecx, DWORD PTR [eax+ecx+16]
	push	ecx
	call	_dyntab_sort
	add	esp, 8

; 733  : 
; 734  : 		/* One or no value for the field : select */
; 735  : 		if(cat->k[i].val.nbrows < 2 && cat->key.nbrows)

	mov	edx, DWORD PTR _i$[ebp]
	imul	edx, 36					; 00000024H
	mov	eax, DWORD PTR _cat$[ebp]
	mov	ecx, DWORD PTR [eax+164]
	cmp	DWORD PTR [ecx+edx+16], 2
	jae	$L71218
	mov	edx, DWORD PTR _cat$[ebp]
	cmp	DWORD PTR [edx+4], 0
	je	$L71218

; 737  : 			unsigned long idval = DYNTAB_TOULRC(&cat->k[i].val, 0, col_IdVal);

	push	10					; 0000000aH
	push	0
	push	0
	push	0
	mov	eax, DWORD PTR _i$[ebp]
	imul	eax, 36					; 00000024H
	mov	ecx, DWORD PTR _cat$[ebp]
	mov	edx, DWORD PTR [ecx+164]
	lea	eax, DWORD PTR [edx+eax+16]
	push	eax
	call	_dyntab_val
	add	esp, 12					; 0000000cH
	push	eax
	call	_strtoul
	add	esp, 12					; 0000000cH
	mov	DWORD PTR _idval$71214[ebp], eax

; 738  : 			unsigned long idrel = DYNTAB_TOULRC(&cat->k[i].val, 0, col_IdRel);

	push	10					; 0000000aH
	push	0
	push	1
	push	0
	mov	ecx, DWORD PTR _i$[ebp]
	imul	ecx, 36					; 00000024H
	mov	edx, DWORD PTR _cat$[ebp]
	mov	eax, DWORD PTR [edx+164]
	lea	ecx, DWORD PTR [eax+ecx+16]
	push	ecx
	call	_dyntab_val
	add	esp, 12					; 0000000cH
	push	eax
	call	_strtoul
	add	esp, 12					; 0000000cH
	mov	DWORD PTR _idrel$71216[ebp], eax

; 739  : 			cat->k[i].idsel = idval ? idval : idrel;

	cmp	DWORD PTR _idval$71214[ebp], 0
	je	SHORT $L71615
	mov	edx, DWORD PTR _idval$71214[ebp]
	mov	DWORD PTR -376+[ebp], edx
	jmp	SHORT $L71616
$L71615:
	mov	eax, DWORD PTR _idrel$71216[ebp]
	mov	DWORD PTR -376+[ebp], eax
$L71616:
	mov	ecx, DWORD PTR _i$[ebp]
	imul	ecx, 36					; 00000024H
	mov	edx, DWORD PTR _cat$[ebp]
	mov	eax, DWORD PTR [edx+164]
	mov	edx, DWORD PTR -376+[ebp]
	mov	DWORD PTR [eax+ecx+4], edx

; 740  : 			cat->k[i].rel = idrel ? 1 : 0;

	xor	eax, eax
	cmp	DWORD PTR _idrel$71216[ebp], 0
	setne	al
	mov	ecx, DWORD PTR _i$[ebp]
	imul	ecx, 36					; 00000024H
	mov	edx, DWORD PTR _cat$[ebp]
	mov	edx, DWORD PTR [edx+164]
	mov	DWORD PTR [edx+ecx+8], eax

; 741  : 			if(i == cat->lvl) cat->lvl++;

	mov	eax, DWORD PTR _cat$[ebp]
	mov	ecx, DWORD PTR _i$[ebp]
	cmp	ecx, DWORD PTR [eax+168]
	jne	SHORT $L71218
	mov	edx, DWORD PTR _cat$[ebp]
	mov	eax, DWORD PTR [edx+168]
	add	eax, 1
	mov	ecx, DWORD PTR _cat$[ebp]
	mov	DWORD PTR [ecx+168], eax
$L71218:

; 743  : 
; 744  : 		/* Search selected value index in sorted values */
; 745  : 		for(j = 0; j < cat->k[i].val.nbrows;  j++)

	mov	DWORD PTR _j$[ebp], 0
	jmp	SHORT $L71219
$L71220:
	mov	edx, DWORD PTR _j$[ebp]
	add	edx, 1
	mov	DWORD PTR _j$[ebp], edx
$L71219:
	mov	eax, DWORD PTR _i$[ebp]
	imul	eax, 36					; 00000024H
	mov	ecx, DWORD PTR _cat$[ebp]
	mov	edx, DWORD PTR [ecx+164]
	mov	ecx, DWORD PTR _j$[ebp]
	cmp	ecx, DWORD PTR [edx+eax+16]
	jae	$L71221

; 747  : 			unsigned long idval = DYNTAB_TOULRC(&cat->k[i].val, j, col_IdVal);

	push	10					; 0000000aH
	push	0
	push	0
	mov	edx, DWORD PTR _j$[ebp]
	push	edx
	mov	eax, DWORD PTR _i$[ebp]
	imul	eax, 36					; 00000024H
	mov	ecx, DWORD PTR _cat$[ebp]
	mov	edx, DWORD PTR [ecx+164]
	lea	eax, DWORD PTR [edx+eax+16]
	push	eax
	call	_dyntab_val
	add	esp, 12					; 0000000cH
	push	eax
	call	_strtoul
	add	esp, 12					; 0000000cH
	mov	DWORD PTR _idval$71222[ebp], eax

; 748  : 			unsigned long idrel = DYNTAB_TOULRC(&cat->k[i].val, j, col_IdRel);

	push	10					; 0000000aH
	push	0
	push	1
	mov	ecx, DWORD PTR _j$[ebp]
	push	ecx
	mov	edx, DWORD PTR _i$[ebp]
	imul	edx, 36					; 00000024H
	mov	eax, DWORD PTR _cat$[ebp]
	mov	ecx, DWORD PTR [eax+164]
	lea	edx, DWORD PTR [ecx+edx+16]
	push	edx
	call	_dyntab_val
	add	esp, 12					; 0000000cH
	push	eax
	call	_strtoul
	add	esp, 12					; 0000000cH
	mov	DWORD PTR _idrel$71224[ebp], eax

; 749  : 			if(cat->k[i].idsel ? cat->k[i].idsel == (cat->k[i].rel ? idrel : idval) : !idval && !idrel)

	mov	eax, DWORD PTR _i$[ebp]
	imul	eax, 36					; 00000024H
	mov	ecx, DWORD PTR _cat$[ebp]
	mov	edx, DWORD PTR [ecx+164]
	cmp	DWORD PTR [edx+eax+4], 0
	je	SHORT $L71621
	mov	eax, DWORD PTR _i$[ebp]
	imul	eax, 36					; 00000024H
	mov	ecx, DWORD PTR _cat$[ebp]
	mov	edx, DWORD PTR [ecx+164]
	cmp	DWORD PTR [edx+eax+8], 0
	je	SHORT $L71617
	mov	eax, DWORD PTR _idrel$71224[ebp]
	mov	DWORD PTR -380+[ebp], eax
	jmp	SHORT $L71618
$L71617:
	mov	ecx, DWORD PTR _idval$71222[ebp]
	mov	DWORD PTR -380+[ebp], ecx
$L71618:
	mov	edx, DWORD PTR _i$[ebp]
	imul	edx, 36					; 00000024H
	mov	eax, DWORD PTR _cat$[ebp]
	mov	ecx, DWORD PTR [eax+164]
	mov	edx, DWORD PTR [ecx+edx+4]
	xor	eax, eax
	cmp	edx, DWORD PTR -380+[ebp]
	sete	al
	mov	DWORD PTR -384+[ebp], eax
	jmp	SHORT $L71622
$L71621:
	cmp	DWORD PTR _idval$71222[ebp], 0
	jne	SHORT $L71619
	cmp	DWORD PTR _idrel$71224[ebp], 0
	jne	SHORT $L71619
	mov	DWORD PTR -388+[ebp], 1
	jmp	SHORT $L71620
$L71619:
	mov	DWORD PTR -388+[ebp], 0
$L71620:
	mov	ecx, DWORD PTR -388+[ebp]
	mov	DWORD PTR -384+[ebp], ecx
$L71622:
	cmp	DWORD PTR -384+[ebp], 0
	je	SHORT $L71226

; 751  : 				cat->k[i].isel = j;

	mov	edx, DWORD PTR _i$[ebp]
	imul	edx, 36					; 00000024H
	mov	eax, DWORD PTR _cat$[ebp]
	mov	ecx, DWORD PTR [eax+164]
	mov	eax, DWORD PTR _j$[ebp]
	mov	DWORD PTR [ecx+edx+12], eax

; 752  : 				break;

	jmp	SHORT $L71221
$L71226:

; 754  : 		}

	jmp	$L71220
$L71221:

; 755  : 
; 756  : 		/* Handle unmatched selected value */
; 757  : 		if(j >= cat->k[i].val.nbrows)

	mov	ecx, DWORD PTR _i$[ebp]
	imul	ecx, 36					; 00000024H
	mov	edx, DWORD PTR _cat$[ebp]
	mov	eax, DWORD PTR [edx+164]
	mov	edx, DWORD PTR _j$[ebp]
	cmp	edx, DWORD PTR [eax+ecx+16]
	jb	SHORT $L71227

; 759  : 			cat->lvl = i;

	mov	eax, DWORD PTR _cat$[ebp]
	mov	ecx, DWORD PTR _i$[ebp]
	mov	DWORD PTR [eax+168], ecx

; 760  : 			cat->k[i].isel = ~0UL;

	mov	edx, DWORD PTR _i$[ebp]
	imul	edx, 36					; 00000024H
	mov	eax, DWORD PTR _cat$[ebp]
	mov	ecx, DWORD PTR [eax+164]
	mov	DWORD PTR [ecx+edx+12], -1

; 761  : 			break;

	jmp	SHORT $L71117
$L71227:

; 763  : 
; 764  : 		/* Exit loop if selected level is reached */
; 765  : 		if(i >= cat->lvl) break;

	mov	edx, DWORD PTR _cat$[ebp]
	mov	eax, DWORD PTR _i$[ebp]
	cmp	eax, DWORD PTR [edx+168]
	jb	SHORT $L71228
	jmp	SHORT $L71117
$L71228:

; 766  : 
; 767  : 		/* Filter objects on the selected value */
; 768  : 		if(read_lower_idobj(cntxt, cat, &cat->id, &cat->nbid, i, cat->k[i].isel)) STACK_ERROR;

	mov	ecx, DWORD PTR _i$[ebp]
	imul	ecx, 36					; 00000024H
	mov	edx, DWORD PTR _cat$[ebp]
	mov	eax, DWORD PTR [edx+164]
	mov	ecx, DWORD PTR [eax+ecx+12]
	push	ecx
	mov	edx, DWORD PTR _i$[ebp]
	push	edx
	mov	eax, DWORD PTR _cat$[ebp]
	add	eax, 160				; 000000a0H
	push	eax
	mov	ecx, DWORD PTR _cat$[ebp]
	add	ecx, 156				; 0000009cH
	push	ecx
	mov	edx, DWORD PTR _cat$[ebp]
	push	edx
	mov	eax, DWORD PTR _cntxt$[ebp]
	push	eax
	call	_read_lower_idobj
	add	esp, 24					; 00000018H
	test	eax, eax
	je	SHORT $L71229
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 768		; 00000300H
	jmp	$eva_err$71120
$L71229:

; 769  : 	}

	jmp	$L71116
$L71117:

; 770  : 
; 771  : 	/* Read distinct images for selected objects */
; 772  : 	if(!cat->id) RETURN_OK;

	mov	edx, DWORD PTR _cat$[ebp]
	cmp	DWORD PTR [edx+156], 0
	jne	SHORT $L71230
	jmp	$eva_noerr$71231
$L71230:

; 773  : 	M_FREE(sql);

	mov	eax, DWORD PTR _sql$[ebp]
	push	eax
	call	_mem_free
	add	esp, 4
	mov	DWORD PTR _sql$[ebp], 0

; 775  : 		"-- output_catalog_list : Read distinct images for selected objects\n"
; 776  : 		"SELECT DISTINCT ");

	push	0
	push	0
	push	83					; 00000053H
	push	OFFSET FLAT:$SG71234
	lea	ecx, DWORD PTR _sql$[ebp]
	push	ecx
	call	_dynbuf_add
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L71233
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29872], OFFSET FLAT:$SG71236
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 776		; 00000308H
	jmp	$eva_err$71120
$L71233:

; 777  : 	if(cat->idimg_r) DYNBUF_ADD_STR(&sql, "IdRelObj") else DYNBUF_ADD_STR(&sql, "IdValue");

	mov	ecx, DWORD PTR _cat$[ebp]
	cmp	DWORD PTR [ecx+152], 0
	je	SHORT $L71237
	push	0
	push	0
	push	8
	push	OFFSET FLAT:$SG71240
	lea	edx, DWORD PTR _sql$[ebp]
	push	edx
	call	_dynbuf_add
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L71239
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29872], OFFSET FLAT:$SG71242
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 777		; 00000309H
	jmp	$eva_err$71120
$L71239:
	jmp	SHORT $L71245
$L71237:
	push	0
	push	0
	push	7
	push	OFFSET FLAT:$SG71246
	lea	edx, DWORD PTR _sql$[ebp]
	push	edx
	call	_dynbuf_add
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L71245
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29872], OFFSET FLAT:$SG71248
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 777		; 00000309H
	jmp	$eva_err$71120
$L71245:

; 779  : 		" FROM TLink\n"
; 780  : 		"WHERE IdObj IN (", cat->id, NO_CONV, ")\n");

	mov	edx, DWORD PTR _cat$[ebp]
	cmp	DWORD PTR [edx+156], 0
	je	SHORT $L71623
	mov	eax, DWORD PTR _cat$[ebp]
	mov	ecx, DWORD PTR [eax+156]
	mov	edx, DWORD PTR [ecx+4]
	mov	DWORD PTR -392+[ebp], edx
	jmp	SHORT $L71624
$L71623:
	mov	DWORD PTR -392+[ebp], 0
$L71624:
	mov	eax, DWORD PTR _cat$[ebp]
	cmp	DWORD PTR [eax+156], 0
	je	SHORT $L71625
	mov	ecx, DWORD PTR _cat$[ebp]
	mov	edx, DWORD PTR [ecx+156]
	add	edx, 8
	mov	DWORD PTR -396+[ebp], edx
	jmp	SHORT $L71626
$L71625:
	mov	DWORD PTR -396+[ebp], 0
$L71626:
	push	2
	push	OFFSET FLAT:$SG71252
	push	0
	push	0
	mov	eax, DWORD PTR -392+[ebp]
	push	eax
	mov	ecx, DWORD PTR -396+[ebp]
	push	ecx
	push	28					; 0000001cH
	push	OFFSET FLAT:$SG71253
	lea	edx, DWORD PTR _sql$[ebp]
	push	edx
	call	_dynbuf_add3
	add	esp, 36					; 00000024H
	test	eax, eax
	je	SHORT $L71251
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29872], OFFSET FLAT:$SG71255
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 780		; 0000030cH
	jmp	$eva_err$71120
$L71251:

; 782  : 		"AND DateDel IS NULL AND Num=1 AND IdField=", cat->idimg, "");

	push	0
	push	OFFSET FLAT:$SG71257
	mov	edx, DWORD PTR _cat$[ebp]
	mov	eax, DWORD PTR [edx+148]
	push	eax
	push	42					; 0000002aH
	push	OFFSET FLAT:$SG71258
	lea	ecx, DWORD PTR _sql$[ebp]
	push	ecx
	call	_dynbuf_add3_int
	add	esp, 24					; 00000018H
	test	eax, eax
	je	SHORT $L71256
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29872], OFFSET FLAT:$SG71260
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 782		; 0000030eH
	jmp	$eva_err$71120
$L71256:

; 783  : 	if(sql_exec_query(cntxt, sql->data) || sql_get_table(cntxt, &data, 2)) STACK_ERROR;

	mov	ecx, DWORD PTR _sql$[ebp]
	add	ecx, 8
	push	ecx
	mov	edx, DWORD PTR _cntxt$[ebp]
	push	edx
	call	_sql_exec_query
	add	esp, 8
	test	eax, eax
	jne	SHORT $L71262
	push	2
	lea	eax, DWORD PTR _data$[ebp]
	push	eax
	mov	ecx, DWORD PTR _cntxt$[ebp]
	push	ecx
	call	_sql_get_table
	add	esp, 12					; 0000000cH
	test	eax, eax
	je	SHORT $L71261
$L71262:
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 783		; 0000030fH
	jmp	SHORT $eva_err$71120
$L71261:

; 784  : 
; 785  : 	/* Auto select image if only one */
; 786  : 	if(data.nbrows == 1) cat->idsel = DYNTAB_TOUL(&data);

	cmp	DWORD PTR _data$[ebp], 1
	jne	SHORT $eva_noerr$71231
	push	10					; 0000000aH
	push	0
	push	0
	push	0
	lea	eax, DWORD PTR _data$[ebp]
	push	eax
	call	_dyntab_val
	add	esp, 12					; 0000000cH
	push	eax
	call	_strtoul
	add	esp, 12					; 0000000cH
	mov	ecx, DWORD PTR _cat$[ebp]
	mov	DWORD PTR [ecx+172], eax
$eva_noerr$71231:

; 787  : 
; 788  : 	RETURN_OK_CLEANUP;

	push	0
	push	OFFSET FLAT:$SG71265
	push	OFFSET FLAT:$SG71266
	mov	edx, DWORD PTR _cntxt$[ebp]
	push	edx
	call	_err_clear
	add	esp, 16					; 00000010H
$eva_err$71120:
	mov	eax, DWORD PTR _cntxt$[ebp]
	cmp	DWORD PTR [eax+29872], 0
	je	SHORT $L71267
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	edx, DWORD PTR [ecx+29900]
	push	edx
	push	OFFSET FLAT:$SG71268
	push	OFFSET FLAT:$SG71269
	mov	eax, DWORD PTR _cntxt$[ebp]
	push	eax
	call	_err_add_context
	add	esp, 16					; 00000010H
$L71267:
	lea	ecx, DWORD PTR _data$[ebp]
	push	ecx
	call	_dyntab_free
	add	esp, 4
	mov	edx, DWORD PTR _sql$[ebp]
	push	edx
	call	_mem_free
	add	esp, 4
	mov	DWORD PTR _sql$[ebp], 0
	mov	eax, DWORD PTR _lbl$[ebp]
	push	eax
	call	_mem_free
	add	esp, 4
	mov	DWORD PTR _lbl$[ebp], 0
	mov	ecx, DWORD PTR _cntxt$[ebp]
	xor	eax, eax
	cmp	DWORD PTR [ecx+29872], 0
	setne	al

; 789  : }

	pop	edi
	mov	esp, ebp
	pop	ebp
	ret	0
_prepare_catalog_values ENDP
_TEXT	ENDS
PUBLIC	_ctrl_output_catalog
EXTRN	_get_id_value:NEAR
EXTRN	_calloc:NEAR
EXTRN	_plain_to_html:BYTE
EXTRN	_qry_listobj_field:NEAR
EXTRN	_cgi_get_subfield:NEAR
EXTRN	_memset:NEAR
EXTRN	_ctrl_format_pos:NEAR
EXTRN	_ctrl_put_table_header:NEAR
EXTRN	_qry_build_free:NEAR
EXTRN	_dyntab_txt_cmp:NEAR
EXTRN	_qry_add_filter_forms:NEAR
EXTRN	_qry_parse_filter_nodes:NEAR
EXTRN	_dyntab_filter_field:NEAR
EXTRN	_dyntab_field_val:NEAR
EXTRN	_qry_filter_listobj:NEAR
_BSS	SEGMENT
	ALIGN	4

$SG71295 DB	01H DUP (?)
	ALIGN	4

$SG71408 DB	01H DUP (?)
_BSS	ENDS
_DATA	SEGMENT
	ORG $+1
$SG71303 DB	'_EVA_SEARCH_CTRL', 00H
	ORG $+3
$SG71305 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG71309 DB	'_EVA_IMG_CTRL', 00H
	ORG $+2
$SG71311 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG71314 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG71320 DB	'_EVA_IMAGE_DIR', 00H
	ORG $+1
$SG71322 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG71325 DB	'_EVA_TYPE', 00H
	ORG $+2
$SG71327 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG71328 DB	'_EVA_RELATION', 00H
	ORG $+2
$SG71329 DB	'_EVA_FILEUPLOAD', 00H
$SG71332 DB	'_EVA_FIELD', 00H
	ORG $+1
$SG71334 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG71336 DB	'_EVA_FILE_SERVER_NAME', 00H
	ORG $+2
$SG71340 DB	'_EVA_IMGBTN_CTRL', 00H
	ORG $+3
$SG71344 DB	'_EVA_WIDTH', 00H
	ORG $+1
$SG71346 DB	'_EVA_HEIGHT', 00H
$SG71348 DB	'%lu', 00H
$SG71349 DB	'%lu', 00H
$SG71351 DB	'%lu', 00H
$SG71352 DB	'%lu', 00H
$SG71354 DB	'SEL', 00H
$SG71356 DB	',', 00H
	ORG $+2
$SG71358 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG71368 DB	'VAL', 00H
$SG71371 DB	'CLR', 00H
$SG71374 DB	'IMG', 00H
$SG71379 DB	'_EVA_BASE_FORMS', 00H
$SG71381 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG71386 DB	'_EVA_FILTER_TYPE', 00H
	ORG $+3
$SG71393 DB	'<tr><td valign=top><font size=-2><nobr>', 00H
$SG71395 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG71398 DB	'_EVA_NO_TREE', 00H
	ORG $+3
$SG71399 DB	'D:\Travail\ABI\EVA\V4.0\CGI\Brunix-2016\ctrl_output_cata'
	DB	'log.c', 00H
	ORG $+2
$SG71400 DB	'ctrl_output_catalog', 00H
$SG71403 DB	'</td><td valign=top', 00H
$SG71405 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG71409 DB	' bgcolor=#', 00H
	ORG $+1
$SG71411 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG71414 DB	'>', 00H
	ORG $+2
$SG71416 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG71418 DB	'D:\Travail\ABI\EVA\V4.0\CGI\Brunix-2016\ctrl_output_cata'
	DB	'log.c', 00H
	ORG $+2
$SG71419 DB	'ctrl_output_catalog', 00H
$SG71422 DB	'</td></tr></table>', 00H
	ORG $+1
$SG71424 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG71428 DB	'SEL', 00H
$SG71432 DB	''' value=''', 00H
	ORG $+2
$SG71433 DB	'<input type=hidden name=''', 00H
	ORG $+2
$SG71435 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG71438 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG71442 DB	'R', 00H
	ORG $+2
$SG71444 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG71450 DB	',', 00H
	ORG $+2
$SG71452 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG71455 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG71459 DB	'R', 00H
	ORG $+2
$SG71461 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG71464 DB	'''>', 00H
	ORG $+1
$SG71466 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG71468 DB	'D:\Travail\ABI\EVA\V4.0\CGI\Brunix-2016\ctrl_output_cata'
	DB	'log.c', 00H
	ORG $+2
$SG71469 DB	'ctrl_output_catalog', 00H
$SG71471 DB	'D:\Travail\ABI\EVA\V4.0\CGI\Brunix-2016\ctrl_output_cata'
	DB	'log.c', 00H
	ORG $+2
$SG71472 DB	'ctrl_output_catalog', 00H
_DATA	ENDS
_TEXT	SEGMENT
_cntxt$ = 8
_i_ctrl$ = 12
_form$ = -4288
_ctrl$ = -8836
_flt$ = -8800
_data$ = -4312
_imgattr$ = -8832
_cgival$ = -4340
_name$ = -8808
_sql$ = -4284
__cat$ = -4280
_cat$ = -8840
_i$ = -4320
_dw$ = -8804
_dh$ = -8812
_btn$ = -4316
_cgi$ = -4344
_html$ = -4292
_idimgopn$71338 = -8844
_end$71362 = -8852
_idsel$71364 = -8848
_rel$71365 = -8856
_cgi$71375 = -8860
_lvl$71376 = -8864
_ctrl_output_catalog PROC NEAR

; 811  : ){

	push	ebp
	mov	ebp, esp
	mov	eax, 8920				; 000022d8H
	call	__chkstk
	push	edi

; 812  : 	EVA_form *form = cntxt->form;

	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	ecx, DWORD PTR [eax+80]
	mov	DWORD PTR _form$[ebp], ecx

; 813  : 	EVA_ctrl *ctrl = form->ctrl + i_ctrl;

	mov	edx, DWORD PTR _i_ctrl$[ebp]
	imul	edx, 480				; 000001e0H
	mov	eax, DWORD PTR _form$[ebp]
	mov	ecx, DWORD PTR [eax]
	add	ecx, edx
	mov	DWORD PTR _ctrl$[ebp], ecx

; 814  : 	QryBuild flt = {{0}};

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

; 815  : 	DynTable data = { 0 };

	mov	DWORD PTR _data$[ebp], 0
	xor	eax, eax
	mov	DWORD PTR _data$[ebp+4], eax
	mov	DWORD PTR _data$[ebp+8], eax
	mov	DWORD PTR _data$[ebp+12], eax
	mov	DWORD PTR _data$[ebp+16], eax

; 816  : 	DynTable imgattr = { 0 };

	mov	DWORD PTR _imgattr$[ebp], 0
	xor	ecx, ecx
	mov	DWORD PTR _imgattr$[ebp+4], ecx
	mov	DWORD PTR _imgattr$[ebp+8], ecx
	mov	DWORD PTR _imgattr$[ebp+12], ecx
	mov	DWORD PTR _imgattr$[ebp+16], ecx

; 817  : 	DynTable cgival = { 0 };

	mov	DWORD PTR _cgival$[ebp], 0
	xor	edx, edx
	mov	DWORD PTR _cgival$[ebp+4], edx
	mov	DWORD PTR _cgival$[ebp+8], edx
	mov	DWORD PTR _cgival$[ebp+12], edx
	mov	DWORD PTR _cgival$[ebp+16], edx

; 818  : 	DynBuffer *name = NULL;

	mov	DWORD PTR _name$[ebp], 0

; 819  : 	DynBuffer *sql = NULL;

	mov	DWORD PTR _sql$[ebp], 0

; 820  : 	Catalog _cat = {0}, *cat = &_cat;

	mov	DWORD PTR __cat$[ebp], 0
	mov	ecx, 1069				; 0000042dH
	xor	eax, eax
	lea	edi, DWORD PTR __cat$[ebp+4]
	rep stosd
	lea	eax, DWORD PTR __cat$[ebp]
	mov	DWORD PTR _cat$[ebp], eax

; 821  : 	unsigned long i, dw = 0, dh = 0;

	mov	DWORD PTR _dw$[ebp], 0
	mov	DWORD PTR _dh$[ebp], 0

; 822  : 	char *btn = CGI_CLICK_BTN_SUBFIELD;

	mov	ecx, DWORD PTR _cntxt$[ebp]
	cmp	DWORD PTR [ecx+29648], 0
	je	SHORT $L71628
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	eax, DWORD PTR [edx+29656]
	imul	eax, 56					; 00000038H
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	edx, DWORD PTR [ecx+29648]
	mov	eax, DWORD PTR [edx+eax]
	movsx	ecx, BYTE PTR [eax]
	cmp	ecx, 66					; 00000042H
	jne	SHORT $L71628
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	eax, DWORD PTR [edx+29656]
	imul	eax, 56					; 00000038H
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	edx, DWORD PTR [ecx+29648]
	cmp	DWORD PTR [edx+eax+32], 0
	je	SHORT $L71628
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	ecx, DWORD PTR [eax+29656]
	imul	ecx, 56					; 00000038H
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	eax, DWORD PTR [edx+29648]
	mov	ecx, DWORD PTR [eax+ecx+32]
	mov	DWORD PTR -8868+[ebp], ecx
	jmp	SHORT $L71629
$L71628:
	mov	DWORD PTR -8868+[ebp], OFFSET FLAT:$SG71295
$L71629:
	mov	edx, DWORD PTR -8868+[ebp]
	mov	DWORD PTR _btn$[ebp], edx

; 823  : 	CGIData *cgi = cntxt->cgi + cntxt->cgibtn;

	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	ecx, DWORD PTR [eax+29656]
	imul	ecx, 56					; 00000038H
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	eax, DWORD PTR [edx+29648]
	add	eax, ecx
	mov	DWORD PTR _cgi$[ebp], eax

; 824  : 	CHECK_HTML_STATUS;

	cmp	DWORD PTR _cntxt$[ebp], 0
	je	SHORT $L71632
	mov	ecx, DWORD PTR _cntxt$[ebp]
	cmp	DWORD PTR [ecx+80], 0
	je	SHORT $L71630
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	eax, DWORD PTR [edx+80]
	mov	ecx, DWORD PTR [eax+232]
	mov	DWORD PTR -8872+[ebp], ecx
	jmp	SHORT $L71631
$L71630:
	mov	DWORD PTR -8872+[ebp], 0
$L71631:
	mov	edx, DWORD PTR -8872+[ebp]
	mov	DWORD PTR -8876+[ebp], edx
	jmp	SHORT $L71633
$L71632:
	mov	DWORD PTR -8876+[ebp], 0
$L71633:
	mov	eax, DWORD PTR -8876+[ebp]
	mov	DWORD PTR _html$[ebp], eax
	cmp	DWORD PTR _html$[ebp], 0
	jne	SHORT $L71300
	xor	eax, eax
	jmp	$L71278
$L71300:

; 825  : 
; 826  : 	/* Initialize catalog structure */
; 827  : 	cat->i_ctrl = i_ctrl;

	mov	ecx, DWORD PTR _cat$[ebp]
	mov	edx, DWORD PTR _i_ctrl$[ebp]
	mov	DWORD PTR [ecx], edx

; 828  : 	CTRL_ATTR(cat->key, SEARCH_CTRL);

	mov	eax, DWORD PTR _cat$[ebp]
	add	eax, 4
	push	eax
	call	_dyntab_free
	add	esp, 4
	push	0
	push	-1
	push	OFFSET FLAT:$SG71303
	mov	ecx, DWORD PTR _ctrl$[ebp]
	add	ecx, 44					; 0000002cH
	push	ecx
	push	0
	mov	edx, DWORD PTR _cat$[ebp]
	add	edx, 4
	push	edx
	call	_dyntab_filter_field
	add	esp, 24					; 00000018H
	test	eax, eax
	je	SHORT $L71302
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29872], OFFSET FLAT:$SG71305
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 828		; 0000033cH
	jmp	$eva_err$71306
$L71302:

; 829  : 	CTRL_ATTR(cat->img, IMG_CTRL);

	mov	edx, DWORD PTR _cat$[ebp]
	add	edx, 24					; 00000018H
	push	edx
	call	_dyntab_free
	add	esp, 4
	push	0
	push	-1
	push	OFFSET FLAT:$SG71309
	mov	eax, DWORD PTR _ctrl$[ebp]
	add	eax, 44					; 0000002cH
	push	eax
	push	0
	mov	ecx, DWORD PTR _cat$[ebp]
	add	ecx, 24					; 00000018H
	push	ecx
	call	_dyntab_filter_field
	add	esp, 24					; 00000018H
	test	eax, eax
	je	SHORT $L71308
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29872], OFFSET FLAT:$SG71311
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 829		; 0000033dH
	jmp	$eva_err$71306
$L71308:

; 830  : 	C_ALLOC(cat->k, sizeof(cat->k[0]), cat->key.nbrows);

	mov	ecx, DWORD PTR _cat$[ebp]
	mov	edx, DWORD PTR [ecx+4]
	push	edx
	push	36					; 00000024H
	call	_calloc
	add	esp, 8
	mov	ecx, DWORD PTR _cat$[ebp]
	mov	DWORD PTR [ecx+164], eax
	mov	edx, DWORD PTR _cat$[ebp]
	cmp	DWORD PTR [edx+164], 0
	jne	SHORT $L71312
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29872], OFFSET FLAT:$SG71314
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 830		; 0000033eH
	jmp	$eva_err$71306
$L71312:

; 831  : 
; 832  : 	/* Get image path & field from image control */
; 833  : 	if(qry_listobj_field(cntxt, &imgattr, &cat->img, NULL)) STACK_ERROR;

	push	0
	mov	edx, DWORD PTR _cat$[ebp]
	add	edx, 24					; 00000018H
	push	edx
	lea	eax, DWORD PTR _imgattr$[ebp]
	push	eax
	mov	ecx, DWORD PTR _cntxt$[ebp]
	push	ecx
	call	_qry_listobj_field
	add	esp, 16					; 00000010H
	test	eax, eax
	je	SHORT $L71317
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 833		; 00000341H
	jmp	$eva_err$71306
$L71317:

; 834  : 	DYNTAB_FIELD1(&cat->imgdir, &imgattr, IMAGE_DIR);

	mov	eax, DWORD PTR _cat$[ebp]
	add	eax, 44					; 0000002cH
	push	eax
	call	_dyntab_free
	add	esp, 4
	push	0
	push	-1
	push	OFFSET FLAT:$SG71320
	lea	ecx, DWORD PTR _imgattr$[ebp]
	push	ecx
	push	1
	mov	edx, DWORD PTR _cat$[ebp]
	add	edx, 44					; 0000002cH
	push	edx
	call	_dyntab_filter_field
	add	esp, 24					; 00000018H
	test	eax, eax
	je	SHORT $L71319
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29872], OFFSET FLAT:$SG71322
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 834		; 00000342H
	jmp	$eva_err$71306
$L71319:

; 835  : 	DYNTAB_FIELD(&data, &imgattr, TYPE);

	lea	edx, DWORD PTR _data$[ebp]
	push	edx
	call	_dyntab_free
	add	esp, 4
	push	0
	push	-1
	push	OFFSET FLAT:$SG71325
	lea	eax, DWORD PTR _imgattr$[ebp]
	push	eax
	push	0
	lea	ecx, DWORD PTR _data$[ebp]
	push	ecx
	call	_dyntab_filter_field
	add	esp, 24					; 00000018H
	test	eax, eax
	je	SHORT $L71324
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29872], OFFSET FLAT:$SG71327
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 835		; 00000343H
	jmp	$eva_err$71306
$L71324:

; 836  : 	cat->idimg_r = !dyntab_txt_cmp(add_sz_str("_EVA_RELATION"), &data, 0, 0) ||
; 837  : 					!dyntab_txt_cmp(add_sz_str("_EVA_FILEUPLOAD"), &data, 0, 0);

	push	0
	push	0
	lea	ecx, DWORD PTR _data$[ebp]
	push	ecx
	push	13					; 0000000dH
	push	OFFSET FLAT:$SG71328
	call	_dyntab_txt_cmp
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L71634
	push	0
	push	0
	lea	edx, DWORD PTR _data$[ebp]
	push	edx
	push	15					; 0000000fH
	push	OFFSET FLAT:$SG71329
	call	_dyntab_txt_cmp
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L71634
	mov	DWORD PTR -8880+[ebp], 0
	jmp	SHORT $L71635
$L71634:
	mov	DWORD PTR -8880+[ebp], 1
$L71635:
	mov	eax, DWORD PTR _cat$[ebp]
	mov	ecx, DWORD PTR -8880+[ebp]
	mov	DWORD PTR [eax+152], ecx

; 838  : 	DYNTAB_FIELD(&data, &imgattr, FIELD);

	lea	edx, DWORD PTR _data$[ebp]
	push	edx
	call	_dyntab_free
	add	esp, 4
	push	0
	push	-1
	push	OFFSET FLAT:$SG71332
	lea	eax, DWORD PTR _imgattr$[ebp]
	push	eax
	push	0
	lea	ecx, DWORD PTR _data$[ebp]
	push	ecx
	call	_dyntab_filter_field
	add	esp, 24					; 00000018H
	test	eax, eax
	je	SHORT $L71331
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29872], OFFSET FLAT:$SG71334
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 838		; 00000346H
	jmp	$eva_err$71306
$L71331:

; 839  : 	if(data.nbrows) cat->idimg = dyntab_cell(&data, 0, 0)->IdValue;

	cmp	DWORD PTR _data$[ebp], 0
	je	SHORT $L71335
	push	0
	push	0
	lea	ecx, DWORD PTR _data$[ebp]
	push	ecx
	call	_dyntab_cell
	add	esp, 12					; 0000000cH
	mov	edx, DWORD PTR _cat$[ebp]
	mov	eax, DWORD PTR [eax+32]
	mov	DWORD PTR [edx+148], eax
$L71335:

; 840  : 	cat->idName = IDVAL("_EVA_FILE_SERVER_NAME");

	push	21					; 00000015H
	push	OFFSET FLAT:$SG71336
	mov	ecx, DWORD PTR _cntxt$[ebp]
	push	ecx
	call	_get_id_value
	add	esp, 12					; 0000000cH
	mov	edx, DWORD PTR _cat$[ebp]
	mov	DWORD PTR [edx+4276], eax

; 841  : 
; 842  : 	/* Get thumbnails size from image control */
; 843  : 	if(cat->idimg_r)

	mov	eax, DWORD PTR _cat$[ebp]
	cmp	DWORD PTR [eax+152], 0
	je	SHORT $L71342

; 845  : 		/* relation field : use open button image dimensions */
; 846  : 		unsigned long idimgopn = strtoul(DYNTAB_FIELD_VAL(&imgattr, IMGBTN_CTRL), NULL, 10);

	push	10					; 0000000aH
	push	0
	push	0
	push	-1
	push	OFFSET FLAT:$SG71340
	lea	ecx, DWORD PTR _imgattr$[ebp]
	push	ecx
	call	_dyntab_field_val
	add	esp, 16					; 00000010H
	push	eax
	call	_strtoul
	add	esp, 12					; 0000000cH
	mov	DWORD PTR _idimgopn$71338[ebp], eax

; 847  : 		if(qry_obj_field(cntxt, &imgattr, idimgopn, NULL)) STACK_ERROR;

	push	0
	mov	edx, DWORD PTR _idimgopn$71338[ebp]
	push	edx
	lea	eax, DWORD PTR _imgattr$[ebp]
	push	eax
	mov	ecx, DWORD PTR _cntxt$[ebp]
	push	ecx
	call	_qry_obj_field
	add	esp, 16					; 00000010H
	test	eax, eax
	je	SHORT $L71342
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 847		; 0000034fH
	jmp	$eva_err$71306
$L71342:

; 849  : 	dw = strtoul(DYNTAB_FIELD_VAL(&imgattr, WIDTH), NULL, 10);

	push	10					; 0000000aH
	push	0
	push	0
	push	-1
	push	OFFSET FLAT:$SG71344
	lea	eax, DWORD PTR _imgattr$[ebp]
	push	eax
	call	_dyntab_field_val
	add	esp, 16					; 00000010H
	push	eax
	call	_strtoul
	add	esp, 12					; 0000000cH
	mov	DWORD PTR _dw$[ebp], eax

; 850  : 	dh = strtoul(DYNTAB_FIELD_VAL(&imgattr, HEIGHT), NULL, 10);

	push	10					; 0000000aH
	push	0
	push	0
	push	-1
	push	OFFSET FLAT:$SG71346
	lea	ecx, DWORD PTR _imgattr$[ebp]
	push	ecx
	call	_dyntab_field_val
	add	esp, 16					; 00000010H
	push	eax
	call	_strtoul
	add	esp, 12					; 0000000cH
	mov	DWORD PTR _dh$[ebp], eax

; 851  : 	if(dw)

	cmp	DWORD PTR _dw$[ebp], 0
	je	SHORT $L71347

; 853  : 		snprintf(add_sz_str(cat->dw1), "%lu", dw);

	mov	edx, DWORD PTR _dw$[ebp]
	push	edx
	push	OFFSET FLAT:$SG71348
	push	15					; 0000000fH
	mov	eax, DWORD PTR _cat$[ebp]
	add	eax, 64					; 00000040H
	push	eax
	call	__snprintf
	add	esp, 16					; 00000010H

; 854  : 		snprintf(add_sz_str(cat->dw2), "%lu", dw / 2);

	mov	ecx, DWORD PTR _dw$[ebp]
	shr	ecx, 1
	push	ecx
	push	OFFSET FLAT:$SG71349
	push	15					; 0000000fH
	mov	edx, DWORD PTR _cat$[ebp]
	add	edx, 96					; 00000060H
	push	edx
	call	__snprintf
	add	esp, 16					; 00000010H
$L71347:

; 856  : 	if(dh)

	cmp	DWORD PTR _dh$[ebp], 0
	je	SHORT $L71350

; 858  : 		snprintf(add_sz_str(cat->dh1), "%lu", dh);

	mov	eax, DWORD PTR _dh$[ebp]
	push	eax
	push	OFFSET FLAT:$SG71351
	push	15					; 0000000fH
	mov	ecx, DWORD PTR _cat$[ebp]
	add	ecx, 80					; 00000050H
	push	ecx
	call	__snprintf
	add	esp, 16					; 00000010H

; 859  : 		snprintf(add_sz_str(cat->dh2), "%lu", dh / 2);

	mov	edx, DWORD PTR _dh$[ebp]
	shr	edx, 1
	push	edx
	push	OFFSET FLAT:$SG71352
	push	15					; 0000000fH
	mov	eax, DWORD PTR _cat$[ebp]
	add	eax, 112				; 00000070H
	push	eax
	call	__snprintf
	add	esp, 16					; 00000010H
$L71350:

; 861  : 
; 862  : 	/* Read CGI selected values */
; 863  : 	CTRL_GET_CGI_SUBFIELD("SEL");

	push	0
	push	0
	push	0
	push	OFFSET FLAT:$SG71354
	mov	ecx, DWORD PTR _ctrl$[ebp]
	push	ecx
	lea	edx, DWORD PTR _cgival$[ebp]
	push	edx
	mov	eax, DWORD PTR _cntxt$[ebp]
	push	eax
	call	_cgi_get_subfield
	add	esp, 28					; 0000001cH
	test	eax, eax
	je	SHORT $L71353
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 863		; 0000035fH
	jmp	$eva_err$71306
$L71353:

; 864  : 	if(dyntab_from_list(&data, DYNTAB_VAL_SZ(&cgival, 0, 0), ",", 0, 2)) RETURN_ERR_MEMORY;

	push	2
	push	0
	push	OFFSET FLAT:$SG71356
	push	0
	push	0
	lea	edx, DWORD PTR _cgival$[ebp]
	push	edx
	call	_dyntab_sz
	add	esp, 12					; 0000000cH
	push	eax
	push	0
	push	0
	lea	eax, DWORD PTR _cgival$[ebp]
	push	eax
	call	_dyntab_val
	add	esp, 12					; 0000000cH
	push	eax
	lea	ecx, DWORD PTR _data$[ebp]
	push	ecx
	call	_dyntab_from_list
	add	esp, 24					; 00000018H
	test	eax, eax
	je	SHORT $L71355
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29872], OFFSET FLAT:$SG71358
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 864		; 00000360H
	jmp	$eva_err$71306
$L71355:

; 865  : 	for(i = 0; i < data.nbrows; i++)

	mov	DWORD PTR _i$[ebp], 0
	jmp	SHORT $L71359
$L71360:
	mov	ecx, DWORD PTR _i$[ebp]
	add	ecx, 1
	mov	DWORD PTR _i$[ebp], ecx
$L71359:
	mov	edx, DWORD PTR _i$[ebp]
	cmp	edx, DWORD PTR _data$[ebp]
	jae	$L71361

; 867  : 		char *end = NULL;

	mov	DWORD PTR _end$71362[ebp], 0

; 868  : 		unsigned long *idsel = (i ? &cat->k[i - 1].idsel : &cat->idsel);

	cmp	DWORD PTR _i$[ebp], 0
	je	SHORT $L71636
	mov	eax, DWORD PTR _i$[ebp]
	sub	eax, 1
	imul	eax, 36					; 00000024H
	mov	ecx, DWORD PTR _cat$[ebp]
	mov	edx, DWORD PTR [ecx+164]
	lea	eax, DWORD PTR [edx+eax+4]
	mov	DWORD PTR -8884+[ebp], eax
	jmp	SHORT $L71637
$L71636:
	mov	ecx, DWORD PTR _cat$[ebp]
	add	ecx, 172				; 000000acH
	mov	DWORD PTR -8884+[ebp], ecx
$L71637:
	mov	edx, DWORD PTR -8884+[ebp]
	mov	DWORD PTR _idsel$71364[ebp], edx

; 869  : 		int *rel = (i ? &cat->k[i - 1].rel : &cat->rel);

	cmp	DWORD PTR _i$[ebp], 0
	je	SHORT $L71638
	mov	eax, DWORD PTR _i$[ebp]
	sub	eax, 1
	imul	eax, 36					; 00000024H
	mov	ecx, DWORD PTR _cat$[ebp]
	mov	edx, DWORD PTR [ecx+164]
	lea	eax, DWORD PTR [edx+eax+8]
	mov	DWORD PTR -8888+[ebp], eax
	jmp	SHORT $L71639
$L71638:
	mov	ecx, DWORD PTR _cat$[ebp]
	add	ecx, 176				; 000000b0H
	mov	DWORD PTR -8888+[ebp], ecx
$L71639:
	mov	edx, DWORD PTR -8888+[ebp]
	mov	DWORD PTR _rel$71365[ebp], edx

; 870  : 		*idsel = strtoul(dyntab_val(&data, i, 0), &end, 10);

	push	10					; 0000000aH
	lea	eax, DWORD PTR _end$71362[ebp]
	push	eax
	push	0
	mov	ecx, DWORD PTR _i$[ebp]
	push	ecx
	lea	edx, DWORD PTR _data$[ebp]
	push	edx
	call	_dyntab_val
	add	esp, 12					; 0000000cH
	push	eax
	call	_strtoul
	add	esp, 12					; 0000000cH
	mov	ecx, DWORD PTR _idsel$71364[ebp]
	mov	DWORD PTR [ecx], eax

; 871  : 		*rel = end && *end;

	cmp	DWORD PTR _end$71362[ebp], 0
	je	SHORT $L71640
	mov	edx, DWORD PTR _end$71362[ebp]
	movsx	eax, BYTE PTR [edx]
	test	eax, eax
	je	SHORT $L71640
	mov	DWORD PTR -8892+[ebp], 1
	jmp	SHORT $L71641
$L71640:
	mov	DWORD PTR -8892+[ebp], 0
$L71641:
	mov	ecx, DWORD PTR _rel$71365[ebp]
	mov	edx, DWORD PTR -8892+[ebp]
	mov	DWORD PTR [ecx], edx

; 872  : 	}

	jmp	$L71360
$L71361:

; 873  : 	if(data.nbrows) cat->lvl = data.nbrows - 1;

	cmp	DWORD PTR _data$[ebp], 0
	je	SHORT $L71366
	mov	eax, DWORD PTR _data$[ebp]
	sub	eax, 1
	mov	ecx, DWORD PTR _cat$[ebp]
	mov	DWORD PTR [ecx+168], eax
$L71366:

; 874  : 
; 875  : 	/* Handle control clicks */
; 876  : 	if(!strcmp(btn, "VAL"))

	push	OFFSET FLAT:$SG71368
	mov	edx, DWORD PTR _btn$[ebp]
	push	edx
	call	_strcmp
	add	esp, 8
	test	eax, eax
	jne	SHORT $L71367

; 878  : 		/* Item value click : change selection */
; 879  : 		cat->idsel = 0;

	mov	eax, DWORD PTR _cat$[ebp]
	mov	DWORD PTR [eax+172], 0

; 880  : 		cat->k[cgi->Num].idsel = cgi->Line;

	mov	ecx, DWORD PTR _cgi$[ebp]
	mov	edx, DWORD PTR [ecx+36]
	imul	edx, 36					; 00000024H
	mov	eax, DWORD PTR _cat$[ebp]
	mov	ecx, DWORD PTR [eax+164]
	mov	eax, DWORD PTR _cgi$[ebp]
	mov	eax, DWORD PTR [eax+40]
	mov	DWORD PTR [ecx+edx+4], eax

; 881  : 		cat->k[cgi->Num].rel = cgi->Lang;

	mov	ecx, DWORD PTR _cgi$[ebp]
	mov	edx, DWORD PTR [ecx+36]
	imul	edx, 36					; 00000024H
	mov	eax, DWORD PTR _cat$[ebp]
	mov	ecx, DWORD PTR [eax+164]
	mov	eax, DWORD PTR _cgi$[ebp]
	mov	eax, DWORD PTR [eax+44]
	mov	DWORD PTR [ecx+edx+8], eax

; 882  : 		cat->lvl = cgi->Num + 1;

	mov	ecx, DWORD PTR _cgi$[ebp]
	mov	edx, DWORD PTR [ecx+36]
	add	edx, 1
	mov	eax, DWORD PTR _cat$[ebp]
	mov	DWORD PTR [eax+168], edx

; 884  : 	else if(!strcmp(btn, "CLR"))

	jmp	$L71373
$L71367:
	push	OFFSET FLAT:$SG71371
	mov	ecx, DWORD PTR _btn$[ebp]
	push	ecx
	call	_strcmp
	add	esp, 8
	test	eax, eax
	jne	SHORT $L71370

; 886  : 		cat->idsel = 0;

	mov	edx, DWORD PTR _cat$[ebp]
	mov	DWORD PTR [edx+172], 0

; 887  : 		cat->lvl = 0;

	mov	eax, DWORD PTR _cat$[ebp]
	mov	DWORD PTR [eax+168], 0

; 888  : 		memset(cat->k, 0, sizeof(cat->k[0]) * cat->key.nbrows);

	mov	ecx, DWORD PTR _cat$[ebp]
	mov	edx, DWORD PTR [ecx+4]
	imul	edx, 36					; 00000024H
	push	edx
	push	0
	mov	eax, DWORD PTR _cat$[ebp]
	mov	ecx, DWORD PTR [eax+164]
	push	ecx
	call	_memset
	add	esp, 12					; 0000000cH

; 890  : 	else if(!strcmp(btn, "IMG"))

	jmp	$L71373
$L71370:
	push	OFFSET FLAT:$SG71374
	mov	edx, DWORD PTR _btn$[ebp]
	push	edx
	call	_strcmp
	add	esp, 8
	test	eax, eax
	jne	$L71373

; 892  : 		/* List value click : set group selection */
; 893  : 		CGIData *cgi = cntxt->cgi + cntxt->cgibtn;

	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	ecx, DWORD PTR [eax+29656]
	imul	ecx, 56					; 00000038H
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	eax, DWORD PTR [edx+29648]
	add	eax, ecx
	mov	DWORD PTR _cgi$71375[ebp], eax

; 894  : 		unsigned long lvl = (cat->lvl >= cat->key.nbrows) ? cat->key.nbrows - 1 : cat->lvl;

	mov	ecx, DWORD PTR _cat$[ebp]
	mov	edx, DWORD PTR _cat$[ebp]
	mov	eax, DWORD PTR [ecx+168]
	cmp	eax, DWORD PTR [edx+4]
	jb	SHORT $L71642
	mov	ecx, DWORD PTR _cat$[ebp]
	mov	edx, DWORD PTR [ecx+4]
	sub	edx, 1
	mov	DWORD PTR -8896+[ebp], edx
	jmp	SHORT $L71643
$L71642:
	mov	eax, DWORD PTR _cat$[ebp]
	mov	ecx, DWORD PTR [eax+168]
	mov	DWORD PTR -8896+[ebp], ecx
$L71643:
	mov	edx, DWORD PTR -8896+[ebp]
	mov	DWORD PTR _lvl$71376[ebp], edx

; 895  : 		cat->idsel = cgi->Num;

	mov	eax, DWORD PTR _cat$[ebp]
	mov	ecx, DWORD PTR _cgi$71375[ebp]
	mov	edx, DWORD PTR [ecx+36]
	mov	DWORD PTR [eax+172], edx

; 896  : 		cat->k[lvl].idsel = cgi->Line;

	mov	eax, DWORD PTR _lvl$71376[ebp]
	imul	eax, 36					; 00000024H
	mov	ecx, DWORD PTR _cat$[ebp]
	mov	edx, DWORD PTR [ecx+164]
	mov	ecx, DWORD PTR _cgi$71375[ebp]
	mov	ecx, DWORD PTR [ecx+40]
	mov	DWORD PTR [edx+eax+4], ecx

; 897  : 		cat->k[lvl].rel = cgi->Lang;

	mov	edx, DWORD PTR _lvl$71376[ebp]
	imul	edx, 36					; 00000024H
	mov	eax, DWORD PTR _cat$[ebp]
	mov	ecx, DWORD PTR [eax+164]
	mov	eax, DWORD PTR _cgi$71375[ebp]
	mov	eax, DWORD PTR [eax+44]
	mov	DWORD PTR [ecx+edx+8], eax

; 898  : 		cat->lvl = lvl + 1;

	mov	ecx, DWORD PTR _lvl$71376[ebp]
	add	ecx, 1
	mov	edx, DWORD PTR _cat$[ebp]
	mov	DWORD PTR [edx+168], ecx
$L71373:

; 900  : 
; 901  : 	/* Get objects matching filter */
; 902  : 	CTRL_ATTR(data, BASE_FORMS);

	lea	eax, DWORD PTR _data$[ebp]
	push	eax
	call	_dyntab_free
	add	esp, 4
	push	0
	push	-1
	push	OFFSET FLAT:$SG71379
	mov	ecx, DWORD PTR _ctrl$[ebp]
	add	ecx, 44					; 0000002cH
	push	ecx
	push	0
	lea	edx, DWORD PTR _data$[ebp]
	push	edx
	call	_dyntab_filter_field
	add	esp, 24					; 00000018H
	test	eax, eax
	je	SHORT $L71378
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29872], OFFSET FLAT:$SG71381
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 902		; 00000386H
	jmp	$eva_err$71306
$L71378:

; 903  : 	if(data.nbrows && qry_add_filter_forms(cntxt, &flt, &data, NULL)) STACK_ERROR;

	cmp	DWORD PTR _data$[ebp], 0
	je	SHORT $L71383
	push	0
	lea	edx, DWORD PTR _data$[ebp]
	push	edx
	lea	eax, DWORD PTR _flt$[ebp]
	push	eax
	mov	ecx, DWORD PTR _cntxt$[ebp]
	push	ecx
	call	_qry_add_filter_forms
	add	esp, 16					; 00000010H
	test	eax, eax
	je	SHORT $L71383
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 903		; 00000387H
	jmp	$eva_err$71306
$L71383:

; 904  : 	if(CTRL_ATTR_CELL(FILTER_TYPE) && qry_parse_filter_nodes(cntxt, &flt, &ctrl->attr)) STACK_ERROR;

	cmp	DWORD PTR _ctrl$[ebp], 0
	je	SHORT $L71644
	push	0
	push	-1
	push	OFFSET FLAT:$SG71386
	mov	eax, DWORD PTR _ctrl$[ebp]
	add	eax, 44					; 0000002cH
	push	eax
	call	_dyntab_field_cell
	add	esp, 16					; 00000010H
	mov	DWORD PTR -8900+[ebp], eax
	jmp	SHORT $L71645
$L71644:
	mov	DWORD PTR -8900+[ebp], 0
$L71645:
	cmp	DWORD PTR -8900+[ebp], 0
	je	SHORT $L71385
	mov	ecx, DWORD PTR _ctrl$[ebp]
	add	ecx, 44					; 0000002cH
	push	ecx
	lea	edx, DWORD PTR _flt$[ebp]
	push	edx
	mov	eax, DWORD PTR _cntxt$[ebp]
	push	eax
	call	_qry_parse_filter_nodes
	add	esp, 12					; 0000000cH
	test	eax, eax
	je	SHORT $L71385
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 904		; 00000388H
	jmp	$eva_err$71306
$L71385:

; 905  : 	if(qry_filter_listobj(cntxt, &cat->id, &flt)) STACK_ERROR;

	lea	edx, DWORD PTR _flt$[ebp]
	push	edx
	mov	eax, DWORD PTR _cat$[ebp]
	add	eax, 156				; 0000009cH
	push	eax
	mov	ecx, DWORD PTR _cntxt$[ebp]
	push	ecx
	call	_qry_filter_listobj
	add	esp, 12					; 0000000cH
	test	eax, eax
	je	SHORT $L71387
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 905		; 00000389H
	jmp	$eva_err$71306
$L71387:

; 906  : 	cat->nbid = cntxt->sql_nbrows;

	mov	eax, DWORD PTR _cat$[ebp]
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	edx, DWORD PTR [ecx+29848]
	mov	DWORD PTR [eax+160], edx

; 907  : 
; 908  : 	/* Prepare values */
; 909  : 	if(prepare_catalog_values(cntxt, cat)) STACK_ERROR;

	mov	eax, DWORD PTR _cat$[ebp]
	push	eax
	mov	ecx, DWORD PTR _cntxt$[ebp]
	push	ecx
	call	_prepare_catalog_values
	add	esp, 8
	test	eax, eax
	je	SHORT $L71388
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 909		; 0000038dH
	jmp	$eva_err$71306
$L71388:

; 910  : 
; 911  : 	/* Output control header */
; 912  : 	if(ctrl_format_pos(cntxt, ctrl, 1) || ctrl_put_table_header(cntxt, ctrl)) STACK_ERROR;

	push	1
	mov	eax, DWORD PTR _ctrl$[ebp]
	push	eax
	mov	ecx, DWORD PTR _cntxt$[ebp]
	push	ecx
	call	_ctrl_format_pos
	add	esp, 12					; 0000000cH
	test	eax, eax
	jne	SHORT $L71390
	mov	edx, DWORD PTR _ctrl$[ebp]
	push	edx
	mov	eax, DWORD PTR _cntxt$[ebp]
	push	eax
	call	_ctrl_put_table_header
	add	esp, 8
	test	eax, eax
	je	SHORT $L71389
$L71390:
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 912		; 00000390H
	jmp	$eva_err$71306
$L71389:

; 913  : 
; 914  : 	/* Output selection tree */
; 915  : 	DYNBUF_ADD_STR(html, "<tr><td valign=top><font size=-2><nobr>");

	push	0
	push	0
	push	39					; 00000027H
	push	OFFSET FLAT:$SG71393
	mov	edx, DWORD PTR _html$[ebp]
	push	edx
	call	_dynbuf_add
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L71392
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29872], OFFSET FLAT:$SG71395
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 915		; 00000393H
	jmp	$eva_err$71306
$L71392:

; 916  : 	if(!CTRL_ATTR_CELL(NO_TREE) && output_catalog_tree(cntxt, cat, 0)) CLEAR_ERROR;

	cmp	DWORD PTR _ctrl$[ebp], 0
	je	SHORT $L71646
	push	0
	push	-1
	push	OFFSET FLAT:$SG71398
	mov	edx, DWORD PTR _ctrl$[ebp]
	add	edx, 44					; 0000002cH
	push	edx
	call	_dyntab_field_cell
	add	esp, 16					; 00000010H
	mov	DWORD PTR -8904+[ebp], eax
	jmp	SHORT $L71647
$L71646:
	mov	DWORD PTR -8904+[ebp], 0
$L71647:
	cmp	DWORD PTR -8904+[ebp], 0
	jne	SHORT $L71397
	push	0
	mov	eax, DWORD PTR _cat$[ebp]
	push	eax
	mov	ecx, DWORD PTR _cntxt$[ebp]
	push	ecx
	call	_output_catalog_tree
	add	esp, 12					; 0000000cH
	test	eax, eax
	je	SHORT $L71397
	push	916					; 00000394H
	push	OFFSET FLAT:$SG71399
	push	OFFSET FLAT:$SG71400
	mov	edx, DWORD PTR _cntxt$[ebp]
	push	edx
	call	_err_clear
	add	esp, 16					; 00000010H
$L71397:

; 917  : 
; 918  : 	/* Output images for selected items */
; 919  : 	DYNBUF_ADD_STR(html, "</td><td valign=top");

	push	0
	push	0
	push	19					; 00000013H
	push	OFFSET FLAT:$SG71403
	mov	eax, DWORD PTR _html$[ebp]
	push	eax
	call	_dynbuf_add
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L71402
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29872], OFFSET FLAT:$SG71405
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 919		; 00000397H
	jmp	$eva_err$71306
$L71402:

; 920  : 	if(ctrl->TABLEBGCOLOR && ctrl->TABLEBGCOLOR[0]) DYNBUF_ADD3(html, " bgcolor=#", ctrl->TABLEBGCOLOR, 0, TO_HTML, "");

	mov	eax, DWORD PTR _ctrl$[ebp]
	cmp	DWORD PTR [eax+452], 0
	je	SHORT $L71407
	mov	ecx, DWORD PTR _ctrl$[ebp]
	mov	edx, DWORD PTR [ecx+452]
	movsx	eax, BYTE PTR [edx]
	test	eax, eax
	je	SHORT $L71407
	push	0
	push	OFFSET FLAT:$SG71408
	push	1
	push	OFFSET FLAT:_plain_to_html
	push	0
	mov	ecx, DWORD PTR _ctrl$[ebp]
	mov	edx, DWORD PTR [ecx+452]
	push	edx
	push	10					; 0000000aH
	push	OFFSET FLAT:$SG71409
	mov	eax, DWORD PTR _html$[ebp]
	push	eax
	call	_dynbuf_add3
	add	esp, 36					; 00000024H
	test	eax, eax
	je	SHORT $L71407
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29872], OFFSET FLAT:$SG71411
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 920		; 00000398H
	jmp	$eva_err$71306
$L71407:

; 921  : 	DYNBUF_ADD_STR(html, ">");

	push	0
	push	0
	push	1
	push	OFFSET FLAT:$SG71414
	mov	eax, DWORD PTR _html$[ebp]
	push	eax
	call	_dynbuf_add
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L71413
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29872], OFFSET FLAT:$SG71416
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 921		; 00000399H
	jmp	$eva_err$71306
$L71413:

; 922  : 	if((cat->idsel ?
; 923  : 			output_catalog_group :
; 924  : 		((!cat->key.nbrows  || cat->lvl == cat->key.nbrows)) ?
; 925  : 			output_catalog_list :
; 926  : 			output_catalog_index)(cntxt, cat)) CLEAR_ERROR;

	mov	eax, DWORD PTR _cat$[ebp]
	cmp	DWORD PTR [eax+172], 0
	je	SHORT $L71650
	mov	DWORD PTR -8908+[ebp], OFFSET FLAT:_output_catalog_group
	jmp	SHORT $L71651
$L71650:
	mov	ecx, DWORD PTR _cat$[ebp]
	cmp	DWORD PTR [ecx+4], 0
	je	SHORT $L71648
	mov	edx, DWORD PTR _cat$[ebp]
	mov	eax, DWORD PTR _cat$[ebp]
	mov	ecx, DWORD PTR [edx+168]
	cmp	ecx, DWORD PTR [eax+4]
	je	SHORT $L71648
	mov	DWORD PTR -8912+[ebp], OFFSET FLAT:_output_catalog_index
	jmp	SHORT $L71649
$L71648:
	mov	DWORD PTR -8912+[ebp], OFFSET FLAT:_output_catalog_list
$L71649:
	mov	edx, DWORD PTR -8912+[ebp]
	mov	DWORD PTR -8908+[ebp], edx
$L71651:
	mov	eax, DWORD PTR _cat$[ebp]
	push	eax
	mov	ecx, DWORD PTR _cntxt$[ebp]
	push	ecx
	call	DWORD PTR -8908+[ebp]
	add	esp, 8
	test	eax, eax
	je	SHORT $L71417
	push	926					; 0000039eH
	push	OFFSET FLAT:$SG71418
	push	OFFSET FLAT:$SG71419
	mov	edx, DWORD PTR _cntxt$[ebp]
	push	edx
	call	_err_clear
	add	esp, 16					; 00000010H
$L71417:

; 927  : 	DYNBUF_ADD_STR(html, "</td></tr></table>");

	push	0
	push	0
	push	18					; 00000012H
	push	OFFSET FLAT:$SG71422
	mov	eax, DWORD PTR _html$[ebp]
	push	eax
	call	_dynbuf_add
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L71421
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29872], OFFSET FLAT:$SG71424
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 927		; 0000039fH
	jmp	$eva_err$71306
$L71421:

; 928  : 
; 929  : 	/* Output control footer */
; 930  : 	if(ctrl_format_pos(cntxt, ctrl, 0)) STACK_ERROR;

	push	0
	mov	eax, DWORD PTR _ctrl$[ebp]
	push	eax
	mov	ecx, DWORD PTR _cntxt$[ebp]
	push	ecx
	call	_ctrl_format_pos
	add	esp, 12					; 0000000cH
	test	eax, eax
	je	SHORT $L71425
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 930		; 000003a2H
	jmp	$eva_err$71306
$L71425:

; 931  : 
; 932  : 	/* Output hidden input to hold selected values */
; 933  : 	CTRL_CGINAMESUBFIELD(&name, NULL, "SEL");

	push	3
	push	OFFSET FLAT:$SG71428
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
	je	SHORT $L71427
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 933		; 000003a5H
	jmp	$eva_err$71306
$L71427:

; 934  : 	DYNBUF_ADD3_BUF(html, "<input type=hidden name='", name, NO_CONV, "' value='");

	cmp	DWORD PTR _name$[ebp], 0
	je	SHORT $L71652
	mov	ecx, DWORD PTR _name$[ebp]
	mov	edx, DWORD PTR [ecx+4]
	mov	DWORD PTR -8916+[ebp], edx
	jmp	SHORT $L71653
$L71652:
	mov	DWORD PTR -8916+[ebp], 0
$L71653:
	cmp	DWORD PTR _name$[ebp], 0
	je	SHORT $L71654
	mov	eax, DWORD PTR _name$[ebp]
	add	eax, 8
	mov	DWORD PTR -8920+[ebp], eax
	jmp	SHORT $L71655
$L71654:
	mov	DWORD PTR -8920+[ebp], 0
$L71655:
	push	9
	push	OFFSET FLAT:$SG71432
	push	0
	push	0
	mov	ecx, DWORD PTR -8916+[ebp]
	push	ecx
	mov	edx, DWORD PTR -8920+[ebp]
	push	edx
	push	25					; 00000019H
	push	OFFSET FLAT:$SG71433
	mov	eax, DWORD PTR _html$[ebp]
	push	eax
	call	_dynbuf_add3
	add	esp, 36					; 00000024H
	test	eax, eax
	je	SHORT $L71431
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29872], OFFSET FLAT:$SG71435
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 934		; 000003a6H
	jmp	$eva_err$71306
$L71431:

; 935  : 	DYNBUF_ADD_INT(html, cat->idsel);

	mov	eax, DWORD PTR _cat$[ebp]
	mov	ecx, DWORD PTR [eax+172]
	push	ecx
	mov	edx, DWORD PTR _html$[ebp]
	push	edx
	call	_dynbuf_add_int
	add	esp, 8
	test	eax, eax
	je	SHORT $L71436
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29872], OFFSET FLAT:$SG71438
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 935		; 000003a7H
	jmp	$eva_err$71306
$L71436:

; 936  : 	if(cat->rel) DYNBUF_ADD_STR(html, "R");

	mov	edx, DWORD PTR _cat$[ebp]
	cmp	DWORD PTR [edx+176], 0
	je	SHORT $L71441
	push	0
	push	0
	push	1
	push	OFFSET FLAT:$SG71442
	mov	eax, DWORD PTR _html$[ebp]
	push	eax
	call	_dynbuf_add
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L71441
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29872], OFFSET FLAT:$SG71444
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 936		; 000003a8H
	jmp	$eva_err$71306
$L71441:

; 937  : 	for(i = 0; i < cat->lvl; i++)

	mov	DWORD PTR _i$[ebp], 0
	jmp	SHORT $L71445
$L71446:
	mov	eax, DWORD PTR _i$[ebp]
	add	eax, 1
	mov	DWORD PTR _i$[ebp], eax
$L71445:
	mov	ecx, DWORD PTR _cat$[ebp]
	mov	edx, DWORD PTR _i$[ebp]
	cmp	edx, DWORD PTR [ecx+168]
	jae	$L71447

; 939  : 		DYNBUF_ADD_STR(html, ",");

	push	0
	push	0
	push	1
	push	OFFSET FLAT:$SG71450
	mov	eax, DWORD PTR _html$[ebp]
	push	eax
	call	_dynbuf_add
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L71449
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29872], OFFSET FLAT:$SG71452
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 939		; 000003abH
	jmp	$eva_err$71306
$L71449:

; 940  : 		DYNBUF_ADD_INT(html, cat->k[i].idsel);

	mov	eax, DWORD PTR _i$[ebp]
	imul	eax, 36					; 00000024H
	mov	ecx, DWORD PTR _cat$[ebp]
	mov	edx, DWORD PTR [ecx+164]
	mov	eax, DWORD PTR [edx+eax+4]
	push	eax
	mov	ecx, DWORD PTR _html$[ebp]
	push	ecx
	call	_dynbuf_add_int
	add	esp, 8
	test	eax, eax
	je	SHORT $L71453
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29872], OFFSET FLAT:$SG71455
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 940		; 000003acH
	jmp	$eva_err$71306
$L71453:

; 941  : 		if(cat->k[i].rel) DYNBUF_ADD_STR(html, "R");

	mov	ecx, DWORD PTR _i$[ebp]
	imul	ecx, 36					; 00000024H
	mov	edx, DWORD PTR _cat$[ebp]
	mov	eax, DWORD PTR [edx+164]
	cmp	DWORD PTR [eax+ecx+8], 0
	je	SHORT $L71458
	push	0
	push	0
	push	1
	push	OFFSET FLAT:$SG71459
	mov	ecx, DWORD PTR _html$[ebp]
	push	ecx
	call	_dynbuf_add
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L71458
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29872], OFFSET FLAT:$SG71461
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 941		; 000003adH
	jmp	SHORT $eva_err$71306
$L71458:

; 942  : 	}

	jmp	$L71446
$L71447:

; 943  : 	DYNBUF_ADD_STR(html, "'>");

	push	0
	push	0
	push	2
	push	OFFSET FLAT:$SG71464
	mov	ecx, DWORD PTR _html$[ebp]
	push	ecx
	call	_dynbuf_add
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L71463
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29872], OFFSET FLAT:$SG71466
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 943		; 000003afH
	jmp	SHORT $eva_err$71306
$L71463:
$eva_noerr$71467:

; 944  : 
; 945  : 	RETURN_OK_CLEANUP;

	push	0
	push	OFFSET FLAT:$SG71468
	push	OFFSET FLAT:$SG71469
	mov	ecx, DWORD PTR _cntxt$[ebp]
	push	ecx
	call	_err_clear
	add	esp, 16					; 00000010H
$eva_err$71306:
	mov	edx, DWORD PTR _cntxt$[ebp]
	cmp	DWORD PTR [edx+29872], 0
	je	SHORT $L71470
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	ecx, DWORD PTR [eax+29900]
	push	ecx
	push	OFFSET FLAT:$SG71471
	push	OFFSET FLAT:$SG71472
	mov	edx, DWORD PTR _cntxt$[ebp]
	push	edx
	call	_err_add_context
	add	esp, 16					; 00000010H
$L71470:
	lea	eax, DWORD PTR _flt$[ebp]
	push	eax
	call	_qry_build_free
	add	esp, 4
	mov	DWORD PTR _i$[ebp], 0
	jmp	SHORT $L71473
$L71474:
	mov	ecx, DWORD PTR _i$[ebp]
	add	ecx, 1
	mov	DWORD PTR _i$[ebp], ecx
$L71473:
	mov	edx, DWORD PTR _cat$[ebp]
	mov	eax, DWORD PTR _i$[ebp]
	cmp	eax, DWORD PTR [edx+4]
	jae	SHORT $L71475
	mov	ecx, DWORD PTR _i$[ebp]
	imul	ecx, 36					; 00000024H
	mov	edx, DWORD PTR _cat$[ebp]
	mov	eax, DWORD PTR [edx+164]
	lea	ecx, DWORD PTR [eax+ecx+16]
	push	ecx
	call	_dyntab_free
	add	esp, 4
	jmp	SHORT $L71474
$L71475:
	mov	edx, DWORD PTR _cat$[ebp]
	add	edx, 4
	push	edx
	call	_dyntab_free
	add	esp, 4
	mov	eax, DWORD PTR _cat$[ebp]
	add	eax, 24					; 00000018H
	push	eax
	call	_dyntab_free
	add	esp, 4
	mov	ecx, DWORD PTR _cat$[ebp]
	add	ecx, 128				; 00000080H
	push	ecx
	call	_dyntab_free
	add	esp, 4
	mov	edx, DWORD PTR _cat$[ebp]
	mov	eax, DWORD PTR [edx+156]
	push	eax
	call	_mem_free
	add	esp, 4
	mov	ecx, DWORD PTR _cat$[ebp]
	mov	DWORD PTR [ecx+156], 0
	lea	edx, DWORD PTR _data$[ebp]
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
	mov	edx, DWORD PTR _sql$[ebp]
	push	edx
	call	_mem_free
	add	esp, 4
	mov	DWORD PTR _sql$[ebp], 0
	mov	eax, DWORD PTR _cntxt$[ebp]
	xor	ecx, ecx
	cmp	DWORD PTR [eax+29872], 0
	setne	cl
	mov	eax, ecx
$L71278:

; 946  : }

	pop	edi
	mov	esp, ebp
	pop	ebp
	ret	0
_ctrl_output_catalog ENDP
_TEXT	ENDS
PUBLIC	_ctrl_add_output_catalog
EXTRN	_ctrl_add_child:NEAR
_DATA	SEGMENT
$SG71494 DB	'_EVA_DISPLAY_LIST', 00H
	ORG $+2
$SG71496 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG71503 DB	'D:\Travail\ABI\EVA\V4.0\CGI\Brunix-2016\ctrl_output_cata'
	DB	'log.c', 00H
	ORG $+2
$SG71504 DB	'ctrl_add_output_catalog', 00H
$SG71506 DB	'D:\Travail\ABI\EVA\V4.0\CGI\Brunix-2016\ctrl_output_cata'
	DB	'log.c', 00H
	ORG $+2
$SG71507 DB	'ctrl_add_output_catalog', 00H
_DATA	ENDS
_TEXT	SEGMENT
_cntxt$ = 8
_i_ctrl$ = 12
_form$ = -4
_ctrl$ = -28
_displist$ = -24
_ctrl_add_output_catalog PROC NEAR

; 959  : ){

	push	ebp
	mov	ebp, esp
	sub	esp, 32					; 00000020H

; 960  : 	EVA_form *form = cntxt->form;

	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	ecx, DWORD PTR [eax+80]
	mov	DWORD PTR _form$[ebp], ecx

; 961  : 	EVA_ctrl *ctrl = form->ctrl + i_ctrl;

	mov	edx, DWORD PTR _i_ctrl$[ebp]
	imul	edx, 480				; 000001e0H
	mov	eax, DWORD PTR _form$[ebp]
	mov	ecx, DWORD PTR [eax]
	add	ecx, edx
	mov	DWORD PTR _ctrl$[ebp], ecx

; 962  : 	DynTable displist = {0};

	mov	DWORD PTR _displist$[ebp], 0
	xor	edx, edx
	mov	DWORD PTR _displist$[ebp+4], edx
	mov	DWORD PTR _displist$[ebp+8], edx
	mov	DWORD PTR _displist$[ebp+12], edx
	mov	DWORD PTR _displist$[ebp+16], edx

; 963  : 
; 964  : 	switch(form->step)
; 965  : 	{

	mov	eax, DWORD PTR _form$[ebp]
	mov	ecx, DWORD PTR [eax+176]
	mov	DWORD PTR -32+[ebp], ecx
	cmp	DWORD PTR -32+[ebp], 7
	ja	$L71500
	mov	edx, DWORD PTR -32+[ebp]
	jmp	DWORD PTR $L71657[edx*4]
$L71491:

; 966  : 	case CtrlRead:
; 967  : 		CTRL_ATTR(displist, DISPLAY_LIST);

	lea	eax, DWORD PTR _displist$[ebp]
	push	eax
	call	_dyntab_free
	add	esp, 4
	push	0
	push	-1
	push	OFFSET FLAT:$SG71494
	mov	ecx, DWORD PTR _ctrl$[ebp]
	add	ecx, 44					; 0000002cH
	push	ecx
	push	0
	lea	edx, DWORD PTR _displist$[ebp]
	push	edx
	call	_dyntab_filter_field
	add	esp, 24					; 00000018H
	test	eax, eax
	je	SHORT $L71493
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29872], OFFSET FLAT:$SG71496
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 967		; 000003c7H
	jmp	SHORT $eva_err$71497
$L71493:

; 968  : 		if(displist.nbrows && ctrl_add_child(cntxt, i_ctrl, &displist)) STACK_ERROR;

	cmp	DWORD PTR _displist$[ebp], 0
	je	SHORT $L71498
	lea	edx, DWORD PTR _displist$[ebp]
	push	edx
	mov	eax, DWORD PTR _i_ctrl$[ebp]
	push	eax
	mov	ecx, DWORD PTR _cntxt$[ebp]
	push	ecx
	call	_ctrl_add_child
	add	esp, 12					; 0000000cH
	test	eax, eax
	je	SHORT $L71498
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 968		; 000003c8H
	jmp	SHORT $eva_err$71497
$L71498:

; 969  : 		break;

	jmp	SHORT $eva_noerr$71502
$L71499:

; 970  : 	case HtmlView:
; 971  : 	case HtmlPrint:
; 972  : 	case HtmlEdit:
; 973  : 		if(ctrl_output_catalog(cntxt, i_ctrl)) STACK_ERROR;

	mov	eax, DWORD PTR _i_ctrl$[ebp]
	push	eax
	mov	ecx, DWORD PTR _cntxt$[ebp]
	push	ecx
	call	_ctrl_output_catalog
	add	esp, 8
	test	eax, eax
	je	SHORT $L71500
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 973		; 000003cdH
	jmp	SHORT $eva_err$71497
$L71500:
$eva_noerr$71502:

; 977  : 
; 978  : 	RETURN_OK_CLEANUP;

	push	0
	push	OFFSET FLAT:$SG71503
	push	OFFSET FLAT:$SG71504
	mov	eax, DWORD PTR _cntxt$[ebp]
	push	eax
	call	_err_clear
	add	esp, 16					; 00000010H
$eva_err$71497:
	mov	ecx, DWORD PTR _cntxt$[ebp]
	cmp	DWORD PTR [ecx+29872], 0
	je	SHORT $L71505
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	eax, DWORD PTR [edx+29900]
	push	eax
	push	OFFSET FLAT:$SG71506
	push	OFFSET FLAT:$SG71507
	mov	ecx, DWORD PTR _cntxt$[ebp]
	push	ecx
	call	_err_add_context
	add	esp, 16					; 00000010H
$L71505:
	lea	edx, DWORD PTR _displist$[ebp]
	push	edx
	call	_dyntab_free
	add	esp, 4
	mov	eax, DWORD PTR _cntxt$[ebp]
	xor	ecx, ecx
	cmp	DWORD PTR [eax+29872], 0
	setne	cl
	mov	eax, ecx

; 979  : }

	mov	esp, ebp
	pop	ebp
	ret	0
$L71657:
	DD	$L71491
	DD	$L71500
	DD	$L71500
	DD	$L71500
	DD	$L71499
	DD	$L71500
	DD	$L71499
	DD	$L71499
_ctrl_add_output_catalog ENDP
_TEXT	ENDS
END
