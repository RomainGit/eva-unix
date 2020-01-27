	TITLE	D:\Travail\ABI\EVA\V4.0\CGI\Brunix-2016\ctrl_image.c
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
PUBLIC	_put_html_image_dir
PUBLIC	_put_html_img
EXTRN	__snprintf:NEAR
EXTRN	_get_image_size:NEAR
EXTRN	_get_image_thumb:NEAR
EXTRN	_stat:NEAR
EXTRN	_mem_free:NEAR
EXTRN	_strtoul:NEAR
EXTRN	_qry_obj_field:NEAR
EXTRN	_dynbuf_add:NEAR
EXTRN	_dynbuf_add3:NEAR
EXTRN	_dyntab_free:NEAR
EXTRN	_dyntab_val:NEAR
EXTRN	_strlen:NEAR
EXTRN	_strchr:NEAR
EXTRN	_err_add_context:NEAR
EXTRN	_err_clear:NEAR
EXTRN	_build_open_btn_name:NEAR
EXTRN	__chkstk:NEAR
_BSS	SEGMENT
$SG70244 DB	01H DUP (?)
_BSS	ENDS
_DATA	SEGMENT
$SG70253 DB	'_EVA_FILE_SERVER_NAME', 00H
	ORG $+2
$SG70257 DB	'./', 00H
	ORG $+1
$SG70258 DB	'%s/%s', 00H
	ORG $+2
$SG70260 DB	'../docs/%s/%s/%s', 00H
	ORG $+3
$SG70261 DB	'../docs/%s/%s/big/%s', 00H
	ORG $+3
$SG70264 DB	'../docs/%s/%s', 00H
	ORG $+2
$SG70266 DB	'../img/%s', 00H
	ORG $+2
$SG70269 DB	'%s', 00H
	ORG $+1
$SG70270 DB	'%s', 00H
	ORG $+1
$SG70272 DB	'%lu', 00H
$SG70274 DB	'%lu', 00H
$SG70290 DB	''')>', 00H
$SG70291 DB	'<a href=javascript:cb(''', 00H
$SG70293 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70298 DB	''' target=_blank>', 00H
	ORG $+3
$SG70299 DB	'<a href=''', 00H
	ORG $+2
$SG70301 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70303 DB	'Ouvrir la fiche contenant l''image', 00H
	ORG $+2
$SG70304 DB	'Afficher l''image en haute r', 0e9H, 'solution', 00H
	ORG $+3
$SG70310 DB	'</a>', 00H
	ORG $+3
$SG70312 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70314 DB	'D:\Travail\ABI\EVA\V4.0\CGI\Brunix-2016\ctrl_image.c', 00H
	ORG $+3
$SG70315 DB	'put_html_image_dir', 00H
	ORG $+1
$SG70317 DB	'D:\Travail\ABI\EVA\V4.0\CGI\Brunix-2016\ctrl_image.c', 00H
	ORG $+3
$SG70318 DB	'put_html_image_dir', 00H
_DATA	ENDS
_TEXT	SEGMENT
_cntxt$ = 8
_name$ = 12
_dir$ = 16
_img$ = 20
_alt$ = 24
_width$ = 28
_height$ = 32
_border$ = 36
_idobj$ = 40
_ow$ = 44
_oh$ = 48
_data$ = -8256
_path$ = -8236
_bigpath$ = -4140
_sz$ = -8316
_fs$ = -44
_b_anchor$ = -8
_b_doc$ = -8300
_b_thumb$ = -4
_dw$ = -8312
_dh$ = -8320
_w$ = -8296
_h$ = -8304
_thumb$ = -8324
_wstr$ = -8292
_hstr$ = -8276
_end$ = -8260
_idimg$ = -8308
_opname$70284 = -8388
_opname_sz$70285 = -8392
_put_html_image_dir PROC NEAR

; 37   : ){

	push	ebp
	mov	ebp, esp
	mov	eax, 8408				; 000020d8H
	call	__chkstk
	push	edi

; 38   : 	DynTable data = {0};

	mov	DWORD PTR _data$[ebp], 0
	xor	eax, eax
	mov	DWORD PTR _data$[ebp+4], eax
	mov	DWORD PTR _data$[ebp+8], eax
	mov	DWORD PTR _data$[ebp+12], eax
	mov	DWORD PTR _data$[ebp+16], eax

; 39   : 	char path[4096] = {0};

	mov	BYTE PTR _path$[ebp], 0
	mov	ecx, 1023				; 000003ffH
	xor	eax, eax
	lea	edi, DWORD PTR _path$[ebp+1]
	rep stosd
	stosw
	stosb

; 40   : 	char bigpath[4096] = {0};

	mov	BYTE PTR _bigpath$[ebp], 0
	mov	ecx, 1023				; 000003ffH
	xor	eax, eax
	lea	edi, DWORD PTR _bigpath$[ebp+1]
	rep stosd
	stosw
	stosb

; 41   : 	size_t sz = 0;

	mov	DWORD PTR _sz$[ebp], 0

; 42   : 	struct stat fs = {0};

	mov	DWORD PTR _fs$[ebp], 0
	mov	ecx, 8
	xor	eax, eax
	lea	edi, DWORD PTR _fs$[ebp+4]
	rep stosd

; 43   : 	int b_anchor = 0, b_doc = 0, b_thumb = 0;

	mov	DWORD PTR _b_anchor$[ebp], 0
	mov	DWORD PTR _b_doc$[ebp], 0
	mov	DWORD PTR _b_thumb$[ebp], 0

; 44   : 	unsigned long dw = 0, dh = 0, w = 0, h = 0;

	mov	DWORD PTR _dw$[ebp], 0
	mov	DWORD PTR _dh$[ebp], 0
	mov	DWORD PTR _w$[ebp], 0
	mov	DWORD PTR _h$[ebp], 0

; 45   : 	char *thumb = NULL, wstr[16], hstr[16], *end = "";

	mov	DWORD PTR _thumb$[ebp], 0
	mov	DWORD PTR _end$[ebp], OFFSET FLAT:$SG70244

; 46   : 	unsigned long idimg;
; 47   : 
; 48   : 	/* Handle thumbnails - check integer for desired size */
; 49   : 	if(width) dw = strtoul(width, &end, 10);

	cmp	DWORD PTR _width$[ebp], 0
	je	SHORT $L70246
	push	10					; 0000000aH
	lea	ecx, DWORD PTR _end$[ebp]
	push	ecx
	mov	edx, DWORD PTR _width$[ebp]
	push	edx
	call	_strtoul
	add	esp, 12					; 0000000cH
	mov	DWORD PTR _dw$[ebp], eax
$L70246:

; 50   : 	if(*end) dw = 0;

	mov	eax, DWORD PTR _end$[ebp]
	movsx	ecx, BYTE PTR [eax]
	test	ecx, ecx
	je	SHORT $L70247
	mov	DWORD PTR _dw$[ebp], 0
$L70247:

; 51   : 	if(height) dh = strtoul(height, &end, 10);

	cmp	DWORD PTR _height$[ebp], 0
	je	SHORT $L70248
	push	10					; 0000000aH
	lea	edx, DWORD PTR _end$[ebp]
	push	edx
	mov	eax, DWORD PTR _height$[ebp]
	push	eax
	call	_strtoul
	add	esp, 12					; 0000000cH
	mov	DWORD PTR _dh$[ebp], eax
$L70248:

; 52   : 	if(*end) dh = 0;

	mov	ecx, DWORD PTR _end$[ebp]
	movsx	edx, BYTE PTR [ecx]
	test	edx, edx
	je	SHORT $L70249
	mov	DWORD PTR _dh$[ebp], 0
$L70249:

; 53   : 	b_thumb = dw || dh;

	cmp	DWORD PTR _dw$[ebp], 0
	jne	SHORT $L70494
	cmp	DWORD PTR _dh$[ebp], 0
	jne	SHORT $L70494
	mov	DWORD PTR -8396+[ebp], 0
	jmp	SHORT $L70495
$L70494:
	mov	DWORD PTR -8396+[ebp], 1
$L70495:
	mov	eax, DWORD PTR -8396+[ebp]
	mov	DWORD PTR _b_thumb$[ebp], eax

; 54   : 
; 55   : 	/* Get image file name for a relation */
; 56   : 	idimg = img ? strtoul(img, &end, 10) : 0;

	cmp	DWORD PTR _img$[ebp], 0
	je	SHORT $L70496
	push	10					; 0000000aH
	lea	ecx, DWORD PTR _end$[ebp]
	push	ecx
	mov	edx, DWORD PTR _img$[ebp]
	push	edx
	call	_strtoul
	add	esp, 12					; 0000000cH
	mov	DWORD PTR -8400+[ebp], eax
	jmp	SHORT $L70497
$L70496:
	mov	DWORD PTR -8400+[ebp], 0
$L70497:
	mov	eax, DWORD PTR -8400+[ebp]
	mov	DWORD PTR _idimg$[ebp], eax

; 57   : 	if(idimg && *end) idimg = 0;

	cmp	DWORD PTR _idimg$[ebp], 0
	je	SHORT $L70250
	mov	ecx, DWORD PTR _end$[ebp]
	movsx	edx, BYTE PTR [ecx]
	test	edx, edx
	je	SHORT $L70250
	mov	DWORD PTR _idimg$[ebp], 0
$L70250:

; 58   : 	if(idimg)

	cmp	DWORD PTR _idimg$[ebp], 0
	je	SHORT $L70251

; 60   : 		if(qry_obj_field(cntxt, &data, idimg, "_EVA_FILE_SERVER_NAME")) STACK_ERROR;

	push	OFFSET FLAT:$SG70253
	mov	eax, DWORD PTR _idimg$[ebp]
	push	eax
	lea	ecx, DWORD PTR _data$[ebp]
	push	ecx
	mov	edx, DWORD PTR _cntxt$[ebp]
	push	edx
	call	_qry_obj_field
	add	esp, 16					; 00000010H
	test	eax, eax
	je	SHORT $L70252
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 60		; 0000003cH
	jmp	$eva_err$70254
$L70252:

; 61   : 		img = dyntab_val(&data, 0, 0);

	push	0
	push	0
	lea	ecx, DWORD PTR _data$[ebp]
	push	ecx
	call	_dyntab_val
	add	esp, 12					; 0000000cH
	mov	DWORD PTR _img$[ebp], eax

; 62   : 		b_doc = 1;

	mov	DWORD PTR _b_doc$[ebp], 1
$L70251:

; 64   : 
; 65   : 	/* Build full path with given dir */
; 66   : 	if(dir && *dir)

	cmp	DWORD PTR _dir$[ebp], 0
	je	$L70255
	mov	edx, DWORD PTR _dir$[ebp]
	movsx	eax, BYTE PTR [edx]
	test	eax, eax
	je	$L70255

; 68   : 		if(strchr("./", *dir))

	mov	ecx, DWORD PTR _dir$[ebp]
	movsx	edx, BYTE PTR [ecx]
	push	edx
	push	OFFSET FLAT:$SG70257
	call	_strchr
	add	esp, 8
	test	eax, eax
	je	SHORT $L70256

; 69   : 			sz = snprintf(add_sz_str(path), "%s/%s", dir, img);

	mov	eax, DWORD PTR _img$[ebp]
	push	eax
	mov	ecx, DWORD PTR _dir$[ebp]
	push	ecx
	push	OFFSET FLAT:$SG70258
	push	4095					; 00000fffH
	lea	edx, DWORD PTR _path$[ebp]
	push	edx
	call	__snprintf
	add	esp, 20					; 00000014H
	mov	DWORD PTR _sz$[ebp], eax

; 70   : 		else

	jmp	SHORT $L70259
$L70256:

; 72   : 			snprintf(add_sz_str(path), "../docs/%s/%s/%s", cntxt->dbname, dir, img);

	mov	eax, DWORD PTR _img$[ebp]
	push	eax
	mov	ecx, DWORD PTR _dir$[ebp]
	push	ecx
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	eax, DWORD PTR [edx+29804]
	push	eax
	push	OFFSET FLAT:$SG70260
	push	4095					; 00000fffH
	lea	ecx, DWORD PTR _path$[ebp]
	push	ecx
	call	__snprintf
	add	esp, 24					; 00000018H

; 73   : 			sz = snprintf(add_sz_str(bigpath), "../docs/%s/%s/big/%s", cntxt->dbname, dir, img);

	mov	edx, DWORD PTR _img$[ebp]
	push	edx
	mov	eax, DWORD PTR _dir$[ebp]
	push	eax
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	edx, DWORD PTR [ecx+29804]
	push	edx
	push	OFFSET FLAT:$SG70261
	push	4095					; 00000fffH
	lea	eax, DWORD PTR _bigpath$[ebp]
	push	eax
	call	__snprintf
	add	esp, 24					; 00000018H
	mov	DWORD PTR _sz$[ebp], eax

; 74   : 			b_thumb = 0;

	mov	DWORD PTR _b_thumb$[ebp], 0
$L70259:

; 77   : 	else if(b_doc)

	jmp	SHORT $L70265
$L70255:
	cmp	DWORD PTR _b_doc$[ebp], 0
	je	SHORT $L70263

; 78   : 		sz = snprintf(add_sz_str(path), "../docs/%s/%s", cntxt->dbname, img);

	mov	ecx, DWORD PTR _img$[ebp]
	push	ecx
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	eax, DWORD PTR [edx+29804]
	push	eax
	push	OFFSET FLAT:$SG70264
	push	4095					; 00000fffH
	lea	ecx, DWORD PTR _path$[ebp]
	push	ecx
	call	__snprintf
	add	esp, 20					; 00000014H
	mov	DWORD PTR _sz$[ebp], eax

; 79   : 	else

	jmp	SHORT $L70265
$L70263:

; 80   : 		sz = snprintf(add_sz_str(path), "../img/%s", img);

	mov	edx, DWORD PTR _img$[ebp]
	push	edx
	push	OFFSET FLAT:$SG70266
	push	4095					; 00000fffH
	lea	eax, DWORD PTR _path$[ebp]
	push	eax
	call	__snprintf
	add	esp, 16					; 00000010H
	mov	DWORD PTR _sz$[ebp], eax
$L70265:

; 81   : 
; 82   : 	/* Handle thumbnails - create if needed */
; 83   : 	if(b_thumb)

	cmp	DWORD PTR _b_thumb$[ebp], 0
	je	$L70267

; 85   : 		/* Create thumbnail in cache */
; 86   : 		thumb = get_image_thumb(cntxt, path, strlen(path), dw, dh, &w, &h);

	lea	ecx, DWORD PTR _h$[ebp]
	push	ecx
	lea	edx, DWORD PTR _w$[ebp]
	push	edx
	mov	eax, DWORD PTR _dh$[ebp]
	push	eax
	mov	ecx, DWORD PTR _dw$[ebp]
	push	ecx
	lea	edx, DWORD PTR _path$[ebp]
	push	edx
	call	_strlen
	add	esp, 4
	push	eax
	lea	eax, DWORD PTR _path$[ebp]
	push	eax
	mov	ecx, DWORD PTR _cntxt$[ebp]
	push	ecx
	call	_get_image_thumb
	add	esp, 28					; 0000001cH
	mov	DWORD PTR _thumb$[ebp], eax

; 87   : 		if(thumb)

	cmp	DWORD PTR _thumb$[ebp], 0
	je	SHORT $L70268

; 89   : 			/* Use thumbnail for image tag if created */
; 90   : 			sz = snprintf(add_sz_str(bigpath), "%s", path);

	lea	edx, DWORD PTR _path$[ebp]
	push	edx
	push	OFFSET FLAT:$SG70269
	push	4095					; 00000fffH
	lea	eax, DWORD PTR _bigpath$[ebp]
	push	eax
	call	__snprintf
	add	esp, 16					; 00000010H
	mov	DWORD PTR _sz$[ebp], eax

; 91   : 			snprintf(add_sz_str(path), "%s", thumb);

	mov	ecx, DWORD PTR _thumb$[ebp]
	push	ecx
	push	OFFSET FLAT:$SG70270
	push	4095					; 00000fffH
	lea	edx, DWORD PTR _path$[ebp]
	push	edx
	call	__snprintf
	add	esp, 16					; 00000010H
$L70268:

; 93   : 
; 94   : 		/* Set actual image dimensions */
; 95   : 		if(w)

	cmp	DWORD PTR _w$[ebp], 0
	je	SHORT $L70271

; 97   : 			snprintf(add_sz_str(wstr), "%lu", w);

	mov	eax, DWORD PTR _w$[ebp]
	push	eax
	push	OFFSET FLAT:$SG70272
	push	15					; 0000000fH
	lea	ecx, DWORD PTR _wstr$[ebp]
	push	ecx
	call	__snprintf
	add	esp, 16					; 00000010H

; 98   : 			width = wstr;

	lea	edx, DWORD PTR _wstr$[ebp]
	mov	DWORD PTR _width$[ebp], edx
$L70271:

; 100  : 		if(h)

	cmp	DWORD PTR _h$[ebp], 0
	je	SHORT $L70273

; 102  : 			snprintf(add_sz_str(hstr), "%lu", h);

	mov	eax, DWORD PTR _h$[ebp]
	push	eax
	push	OFFSET FLAT:$SG70274
	push	15					; 0000000fH
	lea	ecx, DWORD PTR _hstr$[ebp]
	push	ecx
	call	__snprintf
	add	esp, 16					; 00000010H

; 103  : 			height = hstr;

	lea	edx, DWORD PTR _hstr$[ebp]
	mov	DWORD PTR _height$[ebp], edx
$L70273:

; 106  : 	else if(ow || oh)

	jmp	SHORT $L70276
$L70267:
	cmp	DWORD PTR _ow$[ebp], 0
	jne	SHORT $L70277
	cmp	DWORD PTR _oh$[ebp], 0
	je	SHORT $L70276
$L70277:

; 107  : 		get_image_size(path, &w, &h);

	lea	eax, DWORD PTR _h$[ebp]
	push	eax
	lea	ecx, DWORD PTR _w$[ebp]
	push	ecx
	lea	edx, DWORD PTR _path$[ebp]
	push	edx
	call	_get_image_size
	add	esp, 12					; 0000000cH
$L70276:

; 108  : 
; 109  : 	/* Handle return dimensions if applicable */
; 110  : 	if(ow) *ow = w;

	cmp	DWORD PTR _ow$[ebp], 0
	je	SHORT $L70278
	mov	eax, DWORD PTR _ow$[ebp]
	mov	ecx, DWORD PTR _w$[ebp]
	mov	DWORD PTR [eax], ecx
$L70278:

; 111  : 	if(oh) *oh = h;

	cmp	DWORD PTR _oh$[ebp], 0
	je	SHORT $L70279
	mov	edx, DWORD PTR _oh$[ebp]
	mov	eax, DWORD PTR _h$[ebp]
	mov	DWORD PTR [edx], eax
$L70279:

; 112  : 
; 113  : 	/* Add link to image or object where applicable */
; 114  : 	if((name && *name) || (idobj && idobj != DYNTAB_TOUL(&cntxt->form->id_obj)))

	cmp	DWORD PTR _name$[ebp], 0
	je	SHORT $L70283
	mov	ecx, DWORD PTR _name$[ebp]
	movsx	edx, BYTE PTR [ecx]
	test	edx, edx
	jne	SHORT $L70282
$L70283:
	cmp	DWORD PTR _idobj$[ebp], 0
	je	$L70281
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
	cmp	DWORD PTR _idobj$[ebp], eax
	je	$L70281
$L70282:

; 116  : 		/* Output link to object */
; 117  : 		char opname[64];
; 118  : 		size_t opname_sz = (name && *name) ? strlen(name) : build_open_btn_name(cntxt, opname, 0, idobj, 0, 0);

	cmp	DWORD PTR _name$[ebp], 0
	je	SHORT $L70498
	mov	edx, DWORD PTR _name$[ebp]
	movsx	eax, BYTE PTR [edx]
	test	eax, eax
	je	SHORT $L70498
	mov	ecx, DWORD PTR _name$[ebp]
	push	ecx
	call	_strlen
	add	esp, 4
	mov	DWORD PTR -8404+[ebp], eax
	jmp	SHORT $L70499
$L70498:
	push	0
	push	0
	mov	edx, DWORD PTR _idobj$[ebp]
	push	edx
	push	0
	lea	eax, DWORD PTR _opname$70284[ebp]
	push	eax
	mov	ecx, DWORD PTR _cntxt$[ebp]
	push	ecx
	call	_build_open_btn_name
	add	esp, 24					; 00000018H
	mov	DWORD PTR -8404+[ebp], eax
$L70499:
	mov	edx, DWORD PTR -8404+[ebp]
	mov	DWORD PTR _opname_sz$70285[ebp], edx

; 119  : 		if(!name || !*name) name = opname;

	cmp	DWORD PTR _name$[ebp], 0
	je	SHORT $L70287
	mov	eax, DWORD PTR _name$[ebp]
	movsx	ecx, BYTE PTR [eax]
	test	ecx, ecx
	jne	SHORT $L70286
$L70287:
	lea	edx, DWORD PTR _opname$70284[ebp]
	mov	DWORD PTR _name$[ebp], edx
$L70286:

; 120  : 		DYNBUF_ADD3(cntxt->form->html, "<a href=javascript:cb('", name, opname_sz, NO_CONV, "')>");

	push	3
	push	OFFSET FLAT:$SG70290
	push	0
	push	0
	mov	eax, DWORD PTR _opname_sz$70285[ebp]
	push	eax
	mov	ecx, DWORD PTR _name$[ebp]
	push	ecx
	push	23					; 00000017H
	push	OFFSET FLAT:$SG70291
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	eax, DWORD PTR [edx+80]
	mov	ecx, DWORD PTR [eax+232]
	push	ecx
	call	_dynbuf_add3
	add	esp, 36					; 00000024H
	test	eax, eax
	je	SHORT $L70289
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29872], OFFSET FLAT:$SG70293
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 120		; 00000078H
	jmp	$eva_err$70254
$L70289:

; 121  : 		b_anchor = 1;

	mov	DWORD PTR _b_anchor$[ebp], 1

; 123  : 	else if(*bigpath && !stat(bigpath, &fs) != 0)

	jmp	$L70295
$L70281:
	movsx	ecx, BYTE PTR _bigpath$[ebp]
	test	ecx, ecx
	je	SHORT $L70295
	lea	edx, DWORD PTR _fs$[ebp]
	push	edx
	lea	eax, DWORD PTR _bigpath$[ebp]
	push	eax
	call	_stat
	add	esp, 8
	neg	eax
	sbb	eax, eax
	inc	eax
	test	eax, eax
	je	SHORT $L70295

; 125  : 		/* Output link to big image */
; 126  : 		DYNBUF_ADD3(cntxt->form->html, "<a href='", bigpath, sz, NO_CONV, "' target=_blank>");

	push	16					; 00000010H
	push	OFFSET FLAT:$SG70298
	push	0
	push	0
	mov	ecx, DWORD PTR _sz$[ebp]
	push	ecx
	lea	edx, DWORD PTR _bigpath$[ebp]
	push	edx
	push	9
	push	OFFSET FLAT:$SG70299
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	ecx, DWORD PTR [eax+80]
	mov	edx, DWORD PTR [ecx+232]
	push	edx
	call	_dynbuf_add3
	add	esp, 36					; 00000024H
	test	eax, eax
	je	SHORT $L70297
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29872], OFFSET FLAT:$SG70301
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 126		; 0000007eH
	jmp	$eva_err$70254
$L70297:

; 127  : 		b_anchor = 1;

	mov	DWORD PTR _b_anchor$[ebp], 1
$L70295:

; 129  : 
; 130  : 	/* Default tooltip if no set */
; 131  : 	if(!alt && b_anchor) alt = ((name && *name) || idobj) ? "Ouvrir la fiche contenant l'image" : "Afficher l'image en haute résolution";

	cmp	DWORD PTR _alt$[ebp], 0
	jne	SHORT $L70302
	cmp	DWORD PTR _b_anchor$[ebp], 0
	je	SHORT $L70302
	cmp	DWORD PTR _name$[ebp], 0
	je	SHORT $L70500
	mov	edx, DWORD PTR _name$[ebp]
	movsx	eax, BYTE PTR [edx]
	test	eax, eax
	jne	SHORT $L70501
$L70500:
	cmp	DWORD PTR _idobj$[ebp], 0
	jne	SHORT $L70501
	mov	DWORD PTR -8408+[ebp], OFFSET FLAT:$SG70304
	jmp	SHORT $L70502
$L70501:
	mov	DWORD PTR -8408+[ebp], OFFSET FLAT:$SG70303
$L70502:
	mov	ecx, DWORD PTR -8408+[ebp]
	mov	DWORD PTR _alt$[ebp], ecx
$L70302:

; 132  : 
; 133  : 	/* Add image */
; 134  : 	if(put_html_image(cntxt, name, path, alt, width, height, border)) STACK_ERROR;

	push	0
	mov	edx, DWORD PTR _border$[ebp]
	push	edx
	mov	eax, DWORD PTR _height$[ebp]
	push	eax
	mov	ecx, DWORD PTR _width$[ebp]
	push	ecx
	mov	edx, DWORD PTR _alt$[ebp]
	push	edx
	lea	eax, DWORD PTR _path$[ebp]
	push	eax
	mov	ecx, DWORD PTR _name$[ebp]
	push	ecx
	mov	edx, DWORD PTR _cntxt$[ebp]
	push	edx
	call	_put_html_img
	add	esp, 32					; 00000020H
	test	eax, eax
	je	SHORT $L70306
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 134		; 00000086H
	jmp	SHORT $eva_err$70254
$L70306:

; 135  : 	if(b_anchor) DYNBUF_ADD_STR(cntxt->form->html, "</a>");

	cmp	DWORD PTR _b_anchor$[ebp], 0
	je	SHORT $L70309
	push	0
	push	0
	push	4
	push	OFFSET FLAT:$SG70310
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	edx, DWORD PTR [ecx+80]
	mov	eax, DWORD PTR [edx+232]
	push	eax
	call	_dynbuf_add
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L70309
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29872], OFFSET FLAT:$SG70312
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 135		; 00000087H
	jmp	SHORT $eva_err$70254
$L70309:
$eva_noerr$70313:

; 136  : 	RETURN_OK_CLEANUP;

	push	0
	push	OFFSET FLAT:$SG70314
	push	OFFSET FLAT:$SG70315
	mov	eax, DWORD PTR _cntxt$[ebp]
	push	eax
	call	_err_clear
	add	esp, 16					; 00000010H
$eva_err$70254:
	mov	ecx, DWORD PTR _cntxt$[ebp]
	cmp	DWORD PTR [ecx+29872], 0
	je	SHORT $L70316
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	eax, DWORD PTR [edx+29900]
	push	eax
	push	OFFSET FLAT:$SG70317
	push	OFFSET FLAT:$SG70318
	mov	ecx, DWORD PTR _cntxt$[ebp]
	push	ecx
	call	_err_add_context
	add	esp, 16					; 00000010H
$L70316:
	lea	edx, DWORD PTR _data$[ebp]
	push	edx
	call	_dyntab_free
	add	esp, 4
	mov	eax, DWORD PTR _thumb$[ebp]
	push	eax
	call	_mem_free
	add	esp, 4
	mov	DWORD PTR _thumb$[ebp], 0
	mov	ecx, DWORD PTR _cntxt$[ebp]
	xor	eax, eax
	cmp	DWORD PTR [ecx+29872], 0
	setne	al

; 137  : }

	pop	edi
	mov	esp, ebp
	pop	ebp
	ret	0
_put_html_image_dir ENDP
_TEXT	ENDS
EXTRN	_get_image_file:NEAR
EXTRN	_html_tooltip:BYTE
EXTRN	_dynbuf_add3_int:NEAR
EXTRN	_put_showhelp:NEAR
_BSS	SEGMENT
	ALIGN	4

$SG70389 DB	01H DUP (?)
	ALIGN	4

$SG70395 DB	01H DUP (?)
	ALIGN	4

$SG70400 DB	01H DUP (?)
	ALIGN	4

$SG70413 DB	01H DUP (?)
_BSS	ENDS
_DATA	SEGMENT
	ORG $+1
$SG70352 DB	'<img', 00H
	ORG $+3
$SG70354 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70359 DB	'''', 00H
	ORG $+2
$SG70360 DB	' name=''', 00H
$SG70362 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70365 DB	'''', 00H
	ORG $+2
$SG70366 DB	' title=''', 00H
	ORG $+3
$SG70368 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70373 DB	'''', 00H
	ORG $+2
$SG70374 DB	' width=''', 00H
	ORG $+3
$SG70376 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70380 DB	'''', 00H
	ORG $+2
$SG70381 DB	' height=''', 00H
	ORG $+2
$SG70383 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70390 DB	' width=', 00H
$SG70392 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70396 DB	' height=', 00H
	ORG $+3
$SG70398 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70401 DB	' border=', 00H
	ORG $+3
$SG70403 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70406 DB	'''', 00H
	ORG $+2
$SG70407 DB	' src=''', 00H
	ORG $+1
$SG70409 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70414 DB	' ', 00H
	ORG $+2
$SG70416 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70419 DB	' align=absmiddle>', 00H
	ORG $+2
$SG70421 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70422 DB	'D:\Travail\ABI\EVA\V4.0\CGI\Brunix-2016\ctrl_image.c', 00H
	ORG $+3
$SG70423 DB	'put_html_img', 00H
	ORG $+3
$SG70425 DB	'D:\Travail\ABI\EVA\V4.0\CGI\Brunix-2016\ctrl_image.c', 00H
	ORG $+3
$SG70426 DB	'put_html_img', 00H
_DATA	ENDS
_TEXT	SEGMENT
_cntxt$ = 8
_name$ = 12
_im$ = 16
_alt$ = 20
_width$ = 24
_height$ = 28
_border$ = 32
_extra$ = 36
_img$ = -8
_w$ = -12
_h$ = -16
_html$ = -4
_put_html_img PROC NEAR

; 156  : ){

	push	ebp
	mov	ebp, esp
	sub	esp, 32					; 00000020H

; 157  : 	char *img;
; 158  : 	unsigned long w = width ? strtoul(width, NULL, 10) : 0;

	cmp	DWORD PTR _width$[ebp], 0
	je	SHORT $L70505
	push	10					; 0000000aH
	push	0
	mov	eax, DWORD PTR _width$[ebp]
	push	eax
	call	_strtoul
	add	esp, 12					; 0000000cH
	mov	DWORD PTR -20+[ebp], eax
	jmp	SHORT $L70506
$L70505:
	mov	DWORD PTR -20+[ebp], 0
$L70506:
	mov	ecx, DWORD PTR -20+[ebp]
	mov	DWORD PTR _w$[ebp], ecx

; 159  : 	unsigned long h = height ? strtoul(height, NULL, 10) : 0;

	cmp	DWORD PTR _height$[ebp], 0
	je	SHORT $L70507
	push	10					; 0000000aH
	push	0
	mov	edx, DWORD PTR _height$[ebp]
	push	edx
	call	_strtoul
	add	esp, 12					; 0000000cH
	mov	DWORD PTR -24+[ebp], eax
	jmp	SHORT $L70508
$L70507:
	mov	DWORD PTR -24+[ebp], 0
$L70508:
	mov	eax, DWORD PTR -24+[ebp]
	mov	DWORD PTR _h$[ebp], eax

; 160  : 	CHECK_HTML_STATUS;

	cmp	DWORD PTR _cntxt$[ebp], 0
	je	SHORT $L70511
	mov	ecx, DWORD PTR _cntxt$[ebp]
	cmp	DWORD PTR [ecx+80], 0
	je	SHORT $L70509
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	eax, DWORD PTR [edx+80]
	mov	ecx, DWORD PTR [eax+232]
	mov	DWORD PTR -28+[ebp], ecx
	jmp	SHORT $L70510
$L70509:
	mov	DWORD PTR -28+[ebp], 0
$L70510:
	mov	edx, DWORD PTR -28+[ebp]
	mov	DWORD PTR -32+[ebp], edx
	jmp	SHORT $L70512
$L70511:
	mov	DWORD PTR -32+[ebp], 0
$L70512:
	mov	eax, DWORD PTR -32+[ebp]
	mov	DWORD PTR _html$[ebp], eax
	cmp	DWORD PTR _html$[ebp], 0
	jne	SHORT $L70347
	xor	eax, eax
	jmp	$L70338
$L70347:

; 161  : 
; 162  : 	img = get_image_file(cntxt, im, &w, &h);

	lea	ecx, DWORD PTR _h$[ebp]
	push	ecx
	lea	edx, DWORD PTR _w$[ebp]
	push	edx
	mov	eax, DWORD PTR _im$[ebp]
	push	eax
	mov	ecx, DWORD PTR _cntxt$[ebp]
	push	ecx
	call	_get_image_file
	add	esp, 16					; 00000010H
	mov	DWORD PTR _img$[ebp], eax

; 163  : 	if(!img) RETURN_OK;

	cmp	DWORD PTR _img$[ebp], 0
	jne	SHORT $L70348
	jmp	$eva_noerr$70349
$L70348:

; 164  : 
; 165  : 	DYNBUF_ADD_STR(html, "<img");

	push	0
	push	0
	push	4
	push	OFFSET FLAT:$SG70352
	mov	edx, DWORD PTR _html$[ebp]
	push	edx
	call	_dynbuf_add
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L70351
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29872], OFFSET FLAT:$SG70354
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 165		; 000000a5H
	jmp	$eva_err$70355
$L70351:

; 166  : 	if(name && *name) DYNBUF_ADD3(html, " name='", name, 0, NO_CONV, "'");

	cmp	DWORD PTR _name$[ebp], 0
	je	SHORT $L70358
	mov	edx, DWORD PTR _name$[ebp]
	movsx	eax, BYTE PTR [edx]
	test	eax, eax
	je	SHORT $L70358
	push	1
	push	OFFSET FLAT:$SG70359
	push	0
	push	0
	push	0
	mov	ecx, DWORD PTR _name$[ebp]
	push	ecx
	push	7
	push	OFFSET FLAT:$SG70360
	mov	edx, DWORD PTR _html$[ebp]
	push	edx
	call	_dynbuf_add3
	add	esp, 36					; 00000024H
	test	eax, eax
	je	SHORT $L70358
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29872], OFFSET FLAT:$SG70362
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 166		; 000000a6H
	jmp	$eva_err$70355
$L70358:

; 167  : 	if(alt && *alt)

	cmp	DWORD PTR _alt$[ebp], 0
	je	SHORT $L70369
	mov	edx, DWORD PTR _alt$[ebp]
	movsx	eax, BYTE PTR [edx]
	test	eax, eax
	je	SHORT $L70369

; 169  : 		DYNBUF_ADD3(html, " title='", alt, 0, HTML_TOOLTIP, "'");

	push	1
	push	OFFSET FLAT:$SG70365
	push	1
	push	OFFSET FLAT:_html_tooltip
	push	0
	mov	ecx, DWORD PTR _alt$[ebp]
	push	ecx
	push	8
	push	OFFSET FLAT:$SG70366
	mov	edx, DWORD PTR _html$[ebp]
	push	edx
	call	_dynbuf_add3
	add	esp, 36					; 00000024H
	test	eax, eax
	je	SHORT $L70364
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29872], OFFSET FLAT:$SG70368
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 169		; 000000a9H
	jmp	$eva_err$70355
$L70364:

; 170  : 		if(put_showhelp(cntxt, html)) STACK_ERROR;

	mov	edx, DWORD PTR _html$[ebp]
	push	edx
	mov	eax, DWORD PTR _cntxt$[ebp]
	push	eax
	call	_put_showhelp
	add	esp, 8
	test	eax, eax
	je	SHORT $L70369
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 170		; 000000aaH
	jmp	$eva_err$70355
$L70369:

; 172  : 	if(width && *width) DYNBUF_ADD3(html, " width='", width, 0, NO_CONV, "'")

	cmp	DWORD PTR _width$[ebp], 0
	je	SHORT $L70372
	mov	edx, DWORD PTR _width$[ebp]
	movsx	eax, BYTE PTR [edx]
	test	eax, eax
	je	SHORT $L70372
	push	1
	push	OFFSET FLAT:$SG70373
	push	0
	push	0
	push	0
	mov	ecx, DWORD PTR _width$[ebp]
	push	ecx
	push	8
	push	OFFSET FLAT:$SG70374
	mov	edx, DWORD PTR _html$[ebp]
	push	edx
	call	_dynbuf_add3
	add	esp, 36					; 00000024H
	test	eax, eax
	je	SHORT $L70372
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29872], OFFSET FLAT:$SG70376
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 172		; 000000acH
	jmp	$eva_err$70355
$L70372:

; 173  : 	if(height && *height) DYNBUF_ADD3(html, " height='", height, 0, NO_CONV, "'")

	cmp	DWORD PTR _height$[ebp], 0
	je	SHORT $L70379
	mov	edx, DWORD PTR _height$[ebp]
	movsx	eax, BYTE PTR [edx]
	test	eax, eax
	je	SHORT $L70379
	push	1
	push	OFFSET FLAT:$SG70380
	push	0
	push	0
	push	0
	mov	ecx, DWORD PTR _height$[ebp]
	push	ecx
	push	9
	push	OFFSET FLAT:$SG70381
	mov	edx, DWORD PTR _html$[ebp]
	push	edx
	call	_dynbuf_add3
	add	esp, 36					; 00000024H
	test	eax, eax
	je	SHORT $L70379
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29872], OFFSET FLAT:$SG70383
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 173		; 000000adH
	jmp	$eva_err$70355
$L70379:

; 174  : 	if(!((width && *width) || (height && *height)))

	cmp	DWORD PTR _width$[ebp], 0
	je	SHORT $L70385
	mov	edx, DWORD PTR _width$[ebp]
	movsx	eax, BYTE PTR [edx]
	test	eax, eax
	jne	$L70394
$L70385:
	cmp	DWORD PTR _height$[ebp], 0
	je	SHORT $L70386
	mov	ecx, DWORD PTR _height$[ebp]
	movsx	edx, BYTE PTR [ecx]
	test	edx, edx
	jne	$L70394
$L70386:

; 176  : 		if(w) DYNBUF_ADD3_INT(html, " width=", w, "");

	cmp	DWORD PTR _w$[ebp], 0
	je	SHORT $L70388
	push	0
	push	OFFSET FLAT:$SG70389
	mov	eax, DWORD PTR _w$[ebp]
	push	eax
	push	7
	push	OFFSET FLAT:$SG70390
	mov	ecx, DWORD PTR _html$[ebp]
	push	ecx
	call	_dynbuf_add3_int
	add	esp, 24					; 00000018H
	test	eax, eax
	je	SHORT $L70388
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29872], OFFSET FLAT:$SG70392
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 176		; 000000b0H
	jmp	$eva_err$70355
$L70388:

; 177  : 		if(h) DYNBUF_ADD3_INT(html, " height=", h, "");

	cmp	DWORD PTR _h$[ebp], 0
	je	SHORT $L70394
	push	0
	push	OFFSET FLAT:$SG70395
	mov	ecx, DWORD PTR _h$[ebp]
	push	ecx
	push	8
	push	OFFSET FLAT:$SG70396
	mov	edx, DWORD PTR _html$[ebp]
	push	edx
	call	_dynbuf_add3_int
	add	esp, 24					; 00000018H
	test	eax, eax
	je	SHORT $L70394
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29872], OFFSET FLAT:$SG70398
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 177		; 000000b1H
	jmp	$eva_err$70355
$L70394:

; 179  : 	DYNBUF_ADD3_INT(html, " border=", border, "")

	push	0
	push	OFFSET FLAT:$SG70400
	mov	edx, DWORD PTR _border$[ebp]
	push	edx
	push	8
	push	OFFSET FLAT:$SG70401
	mov	eax, DWORD PTR _html$[ebp]
	push	eax
	call	_dynbuf_add3_int
	add	esp, 24					; 00000018H
	test	eax, eax
	je	SHORT $L70399
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29872], OFFSET FLAT:$SG70403
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 179		; 000000b3H
	jmp	$eva_err$70355
$L70399:

; 180  : 	DYNBUF_ADD3(html, " src='", img, 0, NO_CONV, "'");

	push	1
	push	OFFSET FLAT:$SG70406
	push	0
	push	0
	push	0
	mov	eax, DWORD PTR _img$[ebp]
	push	eax
	push	6
	push	OFFSET FLAT:$SG70407
	mov	ecx, DWORD PTR _html$[ebp]
	push	ecx
	call	_dynbuf_add3
	add	esp, 36					; 00000024H
	test	eax, eax
	je	SHORT $L70405
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29872], OFFSET FLAT:$SG70409
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 180		; 000000b4H
	jmp	$eva_err$70355
$L70405:

; 181  : 	if(extra && *extra) DYNBUF_ADD3(html, " ", extra, 0, NO_CONV, "");

	cmp	DWORD PTR _extra$[ebp], 0
	je	SHORT $L70412
	mov	ecx, DWORD PTR _extra$[ebp]
	movsx	edx, BYTE PTR [ecx]
	test	edx, edx
	je	SHORT $L70412
	push	0
	push	OFFSET FLAT:$SG70413
	push	0
	push	0
	push	0
	mov	eax, DWORD PTR _extra$[ebp]
	push	eax
	push	1
	push	OFFSET FLAT:$SG70414
	mov	ecx, DWORD PTR _html$[ebp]
	push	ecx
	call	_dynbuf_add3
	add	esp, 36					; 00000024H
	test	eax, eax
	je	SHORT $L70412
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29872], OFFSET FLAT:$SG70416
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 181		; 000000b5H
	jmp	SHORT $eva_err$70355
$L70412:

; 182  : 	DYNBUF_ADD_STR(html, " align=absmiddle>");

	push	0
	push	0
	push	17					; 00000011H
	push	OFFSET FLAT:$SG70419
	mov	ecx, DWORD PTR _html$[ebp]
	push	ecx
	call	_dynbuf_add
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L70418
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29872], OFFSET FLAT:$SG70421
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 182		; 000000b6H
	jmp	SHORT $eva_err$70355
$L70418:
$eva_noerr$70349:

; 183  : 	RETURN_OK_CLEANUP;

	push	0
	push	OFFSET FLAT:$SG70422
	push	OFFSET FLAT:$SG70423
	mov	ecx, DWORD PTR _cntxt$[ebp]
	push	ecx
	call	_err_clear
	add	esp, 16					; 00000010H
$eva_err$70355:
	mov	edx, DWORD PTR _cntxt$[ebp]
	cmp	DWORD PTR [edx+29872], 0
	je	SHORT $L70424
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	ecx, DWORD PTR [eax+29900]
	push	ecx
	push	OFFSET FLAT:$SG70425
	push	OFFSET FLAT:$SG70426
	mov	edx, DWORD PTR _cntxt$[ebp]
	push	edx
	call	_err_add_context
	add	esp, 16					; 00000010H
$L70424:
	mov	eax, DWORD PTR _img$[ebp]
	push	eax
	call	_mem_free
	add	esp, 4
	mov	DWORD PTR _img$[ebp], 0
	mov	ecx, DWORD PTR _cntxt$[ebp]
	xor	eax, eax
	cmp	DWORD PTR [ecx+29872], 0
	setne	al
$L70338:

; 184  : }

	mov	esp, ebp
	pop	ebp
	ret	0
_put_html_img ENDP
_TEXT	ENDS
PUBLIC	_ctrl_add_image
EXTRN	_atoi:NEAR
EXTRN	_ctrl_format_pos:NEAR
EXTRN	_dyntab_field_val:NEAR
_BSS	SEGMENT
	ALIGN	4

$SG70451 DB	01H DUP (?)
	ALIGN	4

$SG70454 DB	01H DUP (?)
	ALIGN	4

$SG70478 DB	01H DUP (?)
	ALIGN	4

$SG70480 DB	01H DUP (?)
	ALIGN	4

$SG70482 DB	01H DUP (?)
_BSS	ENDS
_DATA	SEGMENT
	ORG $+3
$SG70447 DB	'_EVA_NONE', 00H
	ORG $+2
$SG70449 DB	'_EVA_NONE', 00H
	ORG $+2
$SG70450 DB	'_EVA_IMAGE', 00H
	ORG $+1
$SG70453 DB	'_EVA_IMAGE_PAGELOAD', 00H
$SG70456 DB	'../img/_eva_nop.gif', 00H
$SG70460 DB	'"].src=''', 00H
	ORG $+3
$SG70461 DB	'document.mainform["', 00H
$SG70463 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70468 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70471 DB	''';', 00H
	ORG $+1
$SG70473 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70477 DB	'_EVA_IMGBORDER', 00H
	ORG $+1
$SG70479 DB	'_EVA_IMGHEIGHT', 00H
	ORG $+1
$SG70481 DB	'_EVA_IMGWIDTH', 00H
	ORG $+2
$SG70485 DB	'D:\Travail\ABI\EVA\V4.0\CGI\Brunix-2016\ctrl_image.c', 00H
	ORG $+3
$SG70486 DB	'ctrl_add_image', 00H
	ORG $+1
$SG70488 DB	'D:\Travail\ABI\EVA\V4.0\CGI\Brunix-2016\ctrl_image.c', 00H
	ORG $+3
$SG70489 DB	'ctrl_add_image', 00H
_DATA	ENDS
_TEXT	SEGMENT
_cntxt$ = 8
_i_ctrl$ = 12
_form$ = -4
_ctrl$ = -20
_animation$ = -12
_image$ = -16
_img$ = -8
_ctrl_add_image PROC NEAR

; 197  : ){

	push	ebp
	mov	ebp, esp
	sub	esp, 56					; 00000038H

; 198  : 	EVA_form *form = cntxt->form;

	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	ecx, DWORD PTR [eax+80]
	mov	DWORD PTR _form$[ebp], ecx

; 199  : 	EVA_ctrl *ctrl = form->ctrl + i_ctrl;

	mov	edx, DWORD PTR _i_ctrl$[ebp]
	imul	edx, 480				; 000001e0H
	mov	eax, DWORD PTR _form$[ebp]
	mov	ecx, DWORD PTR [eax]
	add	ecx, edx
	mov	DWORD PTR _ctrl$[ebp], ecx

; 200  : 	char *animation;
; 201  : 	char *image, *img = NULL;

	mov	DWORD PTR _img$[ebp], 0

; 202  : 
; 203  : 	switch(form->step)
; 204  : 	{

	mov	edx, DWORD PTR _form$[ebp]
	mov	eax, DWORD PTR [edx+176]
	mov	DWORD PTR -24+[ebp], eax
	cmp	DWORD PTR -24+[ebp], 4
	je	SHORT $L70445
	cmp	DWORD PTR -24+[ebp], 5
	jle	$L70475
	cmp	DWORD PTR -24+[ebp], 7
	jle	SHORT $L70445
	jmp	$L70475
$L70445:

; 205  : 	case HtmlPrint:
; 206  : 	case HtmlView:
; 207  : 	case HtmlEdit:
; 208  : 		/* Set IMAGE default attributes values */
; 209  : 		if(!ctrl->LABELPOS[0]) ctrl->LABELPOS = "_EVA_NONE";

	mov	ecx, DWORD PTR _ctrl$[ebp]
	mov	edx, DWORD PTR [ecx+292]
	movsx	eax, BYTE PTR [edx]
	test	eax, eax
	jne	SHORT $L70446
	mov	ecx, DWORD PTR _ctrl$[ebp]
	mov	DWORD PTR [ecx+292], OFFSET FLAT:$SG70447
$L70446:

; 210  : 		if(!ctrl->OPTIONBUTTON[0]) ctrl->OPTIONBUTTON = "_EVA_NONE";

	mov	edx, DWORD PTR _ctrl$[ebp]
	mov	eax, DWORD PTR [edx+336]
	movsx	ecx, BYTE PTR [eax]
	test	ecx, ecx
	jne	SHORT $L70448
	mov	edx, DWORD PTR _ctrl$[ebp]
	mov	DWORD PTR [edx+336], OFFSET FLAT:$SG70449
$L70448:

; 211  : 		image = CTRL_ATTR_VAL(IMAGE);

	cmp	DWORD PTR _ctrl$[ebp], 0
	je	SHORT $L70514
	push	0
	push	-1
	push	OFFSET FLAT:$SG70450
	mov	eax, DWORD PTR _ctrl$[ebp]
	add	eax, 44					; 0000002cH
	push	eax
	call	_dyntab_field_val
	add	esp, 16					; 00000010H
	mov	DWORD PTR -28+[ebp], eax
	jmp	SHORT $L70515
$L70514:
	mov	DWORD PTR -28+[ebp], OFFSET FLAT:$SG70451
$L70515:
	mov	ecx, DWORD PTR -28+[ebp]
	mov	DWORD PTR _image$[ebp], ecx

; 212  : 
; 213  : 		/* Handle JavaScript animation during page load */
; 214  : 		if(cntxt->jsenabled)

	mov	edx, DWORD PTR _cntxt$[ebp]
	cmp	DWORD PTR [edx+29676], 0
	je	$L70455

; 216  : 			animation = CTRL_ATTR_VAL(IMAGE_PAGELOAD);

	cmp	DWORD PTR _ctrl$[ebp], 0
	je	SHORT $L70516
	push	0
	push	-1
	push	OFFSET FLAT:$SG70453
	mov	eax, DWORD PTR _ctrl$[ebp]
	add	eax, 44					; 0000002cH
	push	eax
	call	_dyntab_field_val
	add	esp, 16					; 00000010H
	mov	DWORD PTR -32+[ebp], eax
	jmp	SHORT $L70517
$L70516:
	mov	DWORD PTR -32+[ebp], OFFSET FLAT:$SG70454
$L70517:
	mov	ecx, DWORD PTR -32+[ebp]
	mov	DWORD PTR _animation$[ebp], ecx

; 217  : 			if(*animation)

	mov	edx, DWORD PTR _animation$[ebp]
	movsx	eax, BYTE PTR [edx]
	test	eax, eax
	je	$L70455

; 219  : 				img = get_image_file(cntxt, image, 0, 0);

	push	0
	push	0
	mov	ecx, DWORD PTR _image$[ebp]
	push	ecx
	mov	edx, DWORD PTR _cntxt$[ebp]
	push	edx
	call	_get_image_file
	add	esp, 16					; 00000010H
	mov	DWORD PTR _img$[ebp], eax

; 220  : 				image = img ? img : "../img/_eva_nop.gif";

	cmp	DWORD PTR _img$[ebp], 0
	je	SHORT $L70518
	mov	eax, DWORD PTR _img$[ebp]
	mov	DWORD PTR -36+[ebp], eax
	jmp	SHORT $L70519
$L70518:
	mov	DWORD PTR -36+[ebp], OFFSET FLAT:$SG70456
$L70519:
	mov	ecx, DWORD PTR -36+[ebp]
	mov	DWORD PTR _image$[ebp], ecx

; 221  : 				DYNBUF_ADD3_BUF(&cntxt->endjs, "document.mainform[\"", ctrl->cginame, NO_CONV, "\"].src='");

	mov	edx, DWORD PTR _ctrl$[ebp]
	cmp	DWORD PTR [edx+40], 0
	je	SHORT $L70520
	mov	eax, DWORD PTR _ctrl$[ebp]
	mov	ecx, DWORD PTR [eax+40]
	mov	edx, DWORD PTR [ecx+4]
	mov	DWORD PTR -40+[ebp], edx
	jmp	SHORT $L70521
$L70520:
	mov	DWORD PTR -40+[ebp], 0
$L70521:
	mov	eax, DWORD PTR _ctrl$[ebp]
	cmp	DWORD PTR [eax+40], 0
	je	SHORT $L70522
	mov	ecx, DWORD PTR _ctrl$[ebp]
	mov	edx, DWORD PTR [ecx+40]
	add	edx, 8
	mov	DWORD PTR -44+[ebp], edx
	jmp	SHORT $L70523
$L70522:
	mov	DWORD PTR -44+[ebp], 0
$L70523:
	push	8
	push	OFFSET FLAT:$SG70460
	push	0
	push	0
	mov	eax, DWORD PTR -40+[ebp]
	push	eax
	mov	ecx, DWORD PTR -44+[ebp]
	push	ecx
	push	19					; 00000013H
	push	OFFSET FLAT:$SG70461
	mov	edx, DWORD PTR _cntxt$[ebp]
	add	edx, 29800				; 00007468H
	push	edx
	call	_dynbuf_add3
	add	esp, 36					; 00000024H
	test	eax, eax
	je	SHORT $L70459
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29872], OFFSET FLAT:$SG70463
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 221		; 000000ddH
	jmp	$eva_err$70464
$L70459:

; 222  : 				DYNBUF_ADD(&cntxt->endjs, image, 0, NO_CONV);

	push	0
	push	0
	push	0
	mov	edx, DWORD PTR _image$[ebp]
	push	edx
	mov	eax, DWORD PTR _cntxt$[ebp]
	add	eax, 29800				; 00007468H
	push	eax
	call	_dynbuf_add
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L70466
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29872], OFFSET FLAT:$SG70468
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 222		; 000000deH
	jmp	$eva_err$70464
$L70466:

; 223  : 				DYNBUF_ADD_STR(&cntxt->endjs, "';");

	push	0
	push	0
	push	2
	push	OFFSET FLAT:$SG70471
	mov	eax, DWORD PTR _cntxt$[ebp]
	add	eax, 29800				; 00007468H
	push	eax
	call	_dynbuf_add
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L70470
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29872], OFFSET FLAT:$SG70473
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 223		; 000000dfH
	jmp	$eva_err$70464
$L70470:

; 224  : 				image = animation;

	mov	eax, DWORD PTR _animation$[ebp]
	mov	DWORD PTR _image$[ebp], eax
$L70455:

; 227  : 
; 228  : 		/* Output image */
; 229  : 		if(ctrl_format_pos(cntxt, ctrl, 1) ||
; 230  : 			put_html_image(cntxt, ctrl->cginame->data,
; 231  : 							image,
; 232  : 							ctrl->LABEL,
; 233  : 							CTRL_ATTR_VAL(IMGWIDTH),
; 234  : 							CTRL_ATTR_VAL(IMGHEIGHT),
; 235  : 							atoi(CTRL_ATTR_VAL(IMGBORDER))) ||
; 236  : 			ctrl_format_pos(cntxt, ctrl, 0))

	push	1
	mov	ecx, DWORD PTR _ctrl$[ebp]
	push	ecx
	mov	edx, DWORD PTR _cntxt$[ebp]
	push	edx
	call	_ctrl_format_pos
	add	esp, 12					; 0000000cH
	test	eax, eax
	jne	$L70476
	cmp	DWORD PTR _ctrl$[ebp], 0
	je	SHORT $L70524
	push	0
	push	-1
	push	OFFSET FLAT:$SG70477
	mov	eax, DWORD PTR _ctrl$[ebp]
	add	eax, 44					; 0000002cH
	push	eax
	call	_dyntab_field_val
	add	esp, 16					; 00000010H
	mov	DWORD PTR -48+[ebp], eax
	jmp	SHORT $L70525
$L70524:
	mov	DWORD PTR -48+[ebp], OFFSET FLAT:$SG70478
$L70525:
	cmp	DWORD PTR _ctrl$[ebp], 0
	je	SHORT $L70526
	push	0
	push	-1
	push	OFFSET FLAT:$SG70479
	mov	ecx, DWORD PTR _ctrl$[ebp]
	add	ecx, 44					; 0000002cH
	push	ecx
	call	_dyntab_field_val
	add	esp, 16					; 00000010H
	mov	DWORD PTR -52+[ebp], eax
	jmp	SHORT $L70527
$L70526:
	mov	DWORD PTR -52+[ebp], OFFSET FLAT:$SG70480
$L70527:
	cmp	DWORD PTR _ctrl$[ebp], 0
	je	SHORT $L70528
	push	0
	push	-1
	push	OFFSET FLAT:$SG70481
	mov	edx, DWORD PTR _ctrl$[ebp]
	add	edx, 44					; 0000002cH
	push	edx
	call	_dyntab_field_val
	add	esp, 16					; 00000010H
	mov	DWORD PTR -56+[ebp], eax
	jmp	SHORT $L70529
$L70528:
	mov	DWORD PTR -56+[ebp], OFFSET FLAT:$SG70482
$L70529:
	push	0
	mov	eax, DWORD PTR -48+[ebp]
	push	eax
	call	_atoi
	add	esp, 4
	push	eax
	mov	ecx, DWORD PTR -52+[ebp]
	push	ecx
	mov	edx, DWORD PTR -56+[ebp]
	push	edx
	mov	eax, DWORD PTR _ctrl$[ebp]
	mov	ecx, DWORD PTR [eax+284]
	push	ecx
	mov	edx, DWORD PTR _image$[ebp]
	push	edx
	mov	eax, DWORD PTR _ctrl$[ebp]
	mov	ecx, DWORD PTR [eax+40]
	add	ecx, 8
	push	ecx
	mov	edx, DWORD PTR _cntxt$[ebp]
	push	edx
	call	_put_html_img
	add	esp, 32					; 00000020H
	test	eax, eax
	jne	SHORT $L70476
	push	0
	mov	eax, DWORD PTR _ctrl$[ebp]
	push	eax
	mov	ecx, DWORD PTR _cntxt$[ebp]
	push	ecx
	call	_ctrl_format_pos
	add	esp, 12					; 0000000cH
	test	eax, eax
	je	SHORT $L70475
$L70476:

; 237  : 			STACK_ERROR;

	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 237		; 000000edH
	jmp	SHORT $eva_err$70464
$L70475:
$eva_noerr$70484:

; 241  : 
; 242  : 	RETURN_OK_CLEANUP;

	push	0
	push	OFFSET FLAT:$SG70485
	push	OFFSET FLAT:$SG70486
	mov	eax, DWORD PTR _cntxt$[ebp]
	push	eax
	call	_err_clear
	add	esp, 16					; 00000010H
$eva_err$70464:
	mov	ecx, DWORD PTR _cntxt$[ebp]
	cmp	DWORD PTR [ecx+29872], 0
	je	SHORT $L70487
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	eax, DWORD PTR [edx+29900]
	push	eax
	push	OFFSET FLAT:$SG70488
	push	OFFSET FLAT:$SG70489
	mov	ecx, DWORD PTR _cntxt$[ebp]
	push	ecx
	call	_err_add_context
	add	esp, 16					; 00000010H
$L70487:
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

; 243  : }

	mov	esp, ebp
	pop	ebp
	ret	0
_ctrl_add_image ENDP
_TEXT	ENDS
END
