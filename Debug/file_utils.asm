	TITLE	D:\Travail\ABI\EVA\V4.0\CGI\Brunix-2016\file_utils.c
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
PUBLIC	_dyntab_add_strip
EXTRN	_export_tabrc:BYTE
EXTRN	_dyntab_add:NEAR
EXTRN	_strchr:NEAR
EXTRN	_err_add_context:NEAR
EXTRN	_err_clear:NEAR
_DATA	SEGMENT
$SG70222 DB	' ', 0aH, 09H, 0dH, 00H
	ORG $+3
$SG70226 DB	' ', 0aH, 09H, 0dH, 00H
	ORG $+3
$SG70230 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70233 DB	'D:\Travail\ABI\EVA\V4.0\CGI\Brunix-2016\file_utils.c', 00H
	ORG $+3
$SG70234 DB	'dyntab_add_strip', 00H
	ORG $+3
$SG70236 DB	'D:\Travail\ABI\EVA\V4.0\CGI\Brunix-2016\file_utils.c', 00H
	ORG $+3
$SG70237 DB	'dyntab_add_strip', 00H
_DATA	ENDS
_TEXT	SEGMENT
_cntxt$ = 8
_res$ = 12
_row$ = 16
_col$ = 20
_v$ = 24
_s$ = 28
_dyntab_add_strip PROC NEAR

; 29   : ){

	push	ebp
	mov	ebp, esp

; 30   : 	STRIP_SPACES_AROUND(v, s);

	cmp	DWORD PTR _v$[ebp], 0
	je	SHORT $L70225
$L70220:
	cmp	DWORD PTR _s$[ebp], 0
	je	SHORT $L70221
	mov	eax, DWORD PTR _v$[ebp]
	movsx	ecx, BYTE PTR [eax]
	push	ecx
	push	OFFSET FLAT:$SG70222
	call	_strchr
	add	esp, 8
	test	eax, eax
	je	SHORT $L70221
	mov	edx, DWORD PTR _v$[ebp]
	add	edx, 1
	mov	DWORD PTR _v$[ebp], edx
	mov	eax, DWORD PTR _s$[ebp]
	sub	eax, 1
	mov	DWORD PTR _s$[ebp], eax
	jmp	SHORT $L70220
$L70221:
	cmp	DWORD PTR _s$[ebp], 0
	je	SHORT $L70225
	mov	ecx, DWORD PTR _v$[ebp]
	add	ecx, DWORD PTR _s$[ebp]
	movsx	edx, BYTE PTR [ecx-1]
	push	edx
	push	OFFSET FLAT:$SG70226
	call	_strchr
	add	esp, 8
	test	eax, eax
	je	SHORT $L70225
	mov	eax, DWORD PTR _s$[ebp]
	sub	eax, 1
	mov	DWORD PTR _s$[ebp], eax
	jmp	SHORT $L70221
$L70225:

; 31   : 	if(s) DYNTAB_ADD(res, row, col, v, s, IMPORT_TABRC);

	cmp	DWORD PTR _s$[ebp], 0
	je	SHORT $L70228
	push	-1
	push	OFFSET FLAT:_export_tabrc
	mov	ecx, DWORD PTR _s$[ebp]
	push	ecx
	mov	edx, DWORD PTR _v$[ebp]
	push	edx
	mov	eax, DWORD PTR _col$[ebp]
	push	eax
	mov	ecx, DWORD PTR _row$[ebp]
	push	ecx
	mov	edx, DWORD PTR _res$[ebp]
	push	edx
	call	_dyntab_add
	add	esp, 28					; 0000001cH
	test	eax, eax
	je	SHORT $L70228
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29872], OFFSET FLAT:$SG70230
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 31		; 0000001fH
	jmp	SHORT $eva_err$70231
$L70228:
$eva_noerr$70232:

; 32   : 	RETURN_OK_CLEANUP;

	push	0
	push	OFFSET FLAT:$SG70233
	push	OFFSET FLAT:$SG70234
	mov	edx, DWORD PTR _cntxt$[ebp]
	push	edx
	call	_err_clear
	add	esp, 16					; 00000010H
$eva_err$70231:
	mov	eax, DWORD PTR _cntxt$[ebp]
	cmp	DWORD PTR [eax+29872], 0
	je	SHORT $L70235
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	edx, DWORD PTR [ecx+29900]
	push	edx
	push	OFFSET FLAT:$SG70236
	push	OFFSET FLAT:$SG70237
	mov	eax, DWORD PTR _cntxt$[ebp]
	push	eax
	call	_err_add_context
	add	esp, 16					; 00000010H
$L70235:
	mov	ecx, DWORD PTR _cntxt$[ebp]
	xor	eax, eax
	cmp	DWORD PTR [ecx+29872], 0
	setne	al

; 33   : }

	pop	ebp
	ret	0
_dyntab_add_strip ENDP
_TEXT	ENDS
PUBLIC	_file_tabrc_to_dyntab
EXTRN	_dyntab_free:NEAR
_DATA	SEGMENT
	ORG $+3
$SG70269 DB	'D:\Travail\ABI\EVA\V4.0\CGI\Brunix-2016\file_utils.c', 00H
	ORG $+3
$SG70270 DB	'file_tabrc_to_dyntab', 00H
	ORG $+3
$SG70272 DB	'D:\Travail\ABI\EVA\V4.0\CGI\Brunix-2016\file_utils.c', 00H
	ORG $+3
$SG70273 DB	'file_tabrc_to_dyntab', 00H
_DATA	ENDS
_TEXT	SEGMENT
_cntxt$ = 8
_res$ = 12
_data$ = 16
_sz$ = 20
_row$ = -8
_col$ = -4
_i$ = -12
_i0$ = -16
_file_tabrc_to_dyntab PROC NEAR

; 48   : ){

	push	ebp
	mov	ebp, esp
	sub	esp, 20					; 00000014H

; 49   : 	unsigned long row = 0, col = 0, i, i0;

	mov	DWORD PTR _row$[ebp], 0
	mov	DWORD PTR _col$[ebp], 0

; 50   : 
; 51   : 	/* Read records in DynTable */
; 52   : 	dyntab_free(res);

	mov	eax, DWORD PTR _res$[ebp]
	push	eax
	call	_dyntab_free
	add	esp, 4

; 53   : 	for(i = 0, i0 = 0; i < sz; i++)

	mov	DWORD PTR _i$[ebp], 0
	mov	DWORD PTR _i0$[ebp], 0
	jmp	SHORT $L70255
$L70256:
	mov	ecx, DWORD PTR _i$[ebp]
	add	ecx, 1
	mov	DWORD PTR _i$[ebp], ecx
$L70255:
	mov	edx, DWORD PTR _i$[ebp]
	cmp	edx, DWORD PTR _sz$[ebp]
	jae	$L70257

; 55   : 		switch(data[i])
; 56   : 		{

	mov	eax, DWORD PTR _data$[ebp]
	add	eax, DWORD PTR _i$[ebp]
	mov	cl, BYTE PTR [eax]
	mov	BYTE PTR -20+[ebp], cl
	cmp	BYTE PTR -20+[ebp], 9
	je	SHORT $L70262
	cmp	BYTE PTR -20+[ebp], 10			; 0000000aH
	je	SHORT $L70265
	jmp	$L70259
$L70262:

; 57   : 		case '\t':
; 58   : 			if(i > i0 && dyntab_add_strip(cntxt, res, row, col, data + i0, i - i0)) STACK_ERROR;

	mov	edx, DWORD PTR _i$[ebp]
	cmp	edx, DWORD PTR _i0$[ebp]
	jbe	SHORT $L70263
	mov	eax, DWORD PTR _i$[ebp]
	sub	eax, DWORD PTR _i0$[ebp]
	push	eax
	mov	ecx, DWORD PTR _data$[ebp]
	add	ecx, DWORD PTR _i0$[ebp]
	push	ecx
	mov	edx, DWORD PTR _col$[ebp]
	push	edx
	mov	eax, DWORD PTR _row$[ebp]
	push	eax
	mov	ecx, DWORD PTR _res$[ebp]
	push	ecx
	mov	edx, DWORD PTR _cntxt$[ebp]
	push	edx
	call	_dyntab_add_strip
	add	esp, 24					; 00000018H
	test	eax, eax
	je	SHORT $L70263
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 58		; 0000003aH
	jmp	$eva_err$70264
$L70263:

; 59   : 			col++;

	mov	ecx, DWORD PTR _col$[ebp]
	add	ecx, 1
	mov	DWORD PTR _col$[ebp], ecx

; 60   : 			i0 = i+1;

	mov	edx, DWORD PTR _i$[ebp]
	add	edx, 1
	mov	DWORD PTR _i0$[ebp], edx

; 61   : 			break;

	jmp	SHORT $L70259
$L70265:

; 62   : 		case '\n':
; 63   : 			if(i > i0 && dyntab_add_strip(cntxt, res, row, col, data + i0, i - i0)) STACK_ERROR;

	mov	eax, DWORD PTR _i$[ebp]
	cmp	eax, DWORD PTR _i0$[ebp]
	jbe	SHORT $L70266
	mov	ecx, DWORD PTR _i$[ebp]
	sub	ecx, DWORD PTR _i0$[ebp]
	push	ecx
	mov	edx, DWORD PTR _data$[ebp]
	add	edx, DWORD PTR _i0$[ebp]
	push	edx
	mov	eax, DWORD PTR _col$[ebp]
	push	eax
	mov	ecx, DWORD PTR _row$[ebp]
	push	ecx
	mov	edx, DWORD PTR _res$[ebp]
	push	edx
	mov	eax, DWORD PTR _cntxt$[ebp]
	push	eax
	call	_dyntab_add_strip
	add	esp, 24					; 00000018H
	test	eax, eax
	je	SHORT $L70266
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 63		; 0000003fH
	jmp	SHORT $eva_err$70264
$L70266:

; 64   : 			col = 0;

	mov	DWORD PTR _col$[ebp], 0

; 65   : 			row++;

	mov	edx, DWORD PTR _row$[ebp]
	add	edx, 1
	mov	DWORD PTR _row$[ebp], edx

; 66   : 			i0 = i+1;

	mov	eax, DWORD PTR _i$[ebp]
	add	eax, 1
	mov	DWORD PTR _i0$[ebp], eax
$L70259:

; 69   : 	}

	jmp	$L70256
$L70257:

; 70   : 	if(i > i0 && dyntab_add_strip(cntxt, res, row, col, data + i0, i - i0)) STACK_ERROR;

	mov	ecx, DWORD PTR _i$[ebp]
	cmp	ecx, DWORD PTR _i0$[ebp]
	jbe	SHORT $eva_noerr$70268
	mov	edx, DWORD PTR _i$[ebp]
	sub	edx, DWORD PTR _i0$[ebp]
	push	edx
	mov	eax, DWORD PTR _data$[ebp]
	add	eax, DWORD PTR _i0$[ebp]
	push	eax
	mov	ecx, DWORD PTR _col$[ebp]
	push	ecx
	mov	edx, DWORD PTR _row$[ebp]
	push	edx
	mov	eax, DWORD PTR _res$[ebp]
	push	eax
	mov	ecx, DWORD PTR _cntxt$[ebp]
	push	ecx
	call	_dyntab_add_strip
	add	esp, 24					; 00000018H
	test	eax, eax
	je	SHORT $eva_noerr$70268
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 70		; 00000046H
	jmp	SHORT $eva_err$70264
$eva_noerr$70268:

; 71   : 
; 72   : 	RETURN_OK_CLEANUP;

	push	0
	push	OFFSET FLAT:$SG70269
	push	OFFSET FLAT:$SG70270
	mov	eax, DWORD PTR _cntxt$[ebp]
	push	eax
	call	_err_clear
	add	esp, 16					; 00000010H
$eva_err$70264:
	mov	ecx, DWORD PTR _cntxt$[ebp]
	cmp	DWORD PTR [ecx+29872], 0
	je	SHORT $L70271
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	eax, DWORD PTR [edx+29900]
	push	eax
	push	OFFSET FLAT:$SG70272
	push	OFFSET FLAT:$SG70273
	mov	ecx, DWORD PTR _cntxt$[ebp]
	push	ecx
	call	_err_add_context
	add	esp, 16					; 00000010H
$L70271:
	mov	edx, DWORD PTR _cntxt$[ebp]
	xor	eax, eax
	cmp	DWORD PTR [edx+29872], 0
	setne	al

; 73   : }

	mov	esp, ebp
	pop	ebp
	ret	0
_file_tabrc_to_dyntab ENDP
_TEXT	ENDS
PUBLIC	_file_to_dynbuf
EXTRN	_fclose:NEAR
EXTRN	_fopen:NEAR
EXTRN	_fread:NEAR
EXTRN	_stat:NEAR
EXTRN	_dynbuf_init:NEAR
_DATA	SEGMENT
	ORG $+3
$SG70291 DB	'Fichier non trouv', 0e9H, 00H
	ORG $+1
$SG70293 DB	'r', 00H
	ORG $+2
$SG70296 DB	'Impossible d''ouvrir le fichier', 00H
	ORG $+1
$SG70297 DB	'D:\Travail\ABI\EVA\V4.0\CGI\Brunix-2016\file_utils.c', 00H
	ORG $+3
$SG70298 DB	'file_to_dynbuf', 00H
	ORG $+1
$SG70300 DB	'D:\Travail\ABI\EVA\V4.0\CGI\Brunix-2016\file_utils.c', 00H
	ORG $+3
$SG70301 DB	'file_to_dynbuf', 00H
_DATA	ENDS
_TEXT	SEGMENT
_cntxt$ = 8
_res$ = 12
_file$ = 16
_sts$ = -36
_f$ = -40
_file_to_dynbuf PROC NEAR

; 87   : ){

	push	ebp
	mov	ebp, esp
	sub	esp, 40					; 00000028H

; 88   : 	struct stat sts;			/* for stat() */
; 89   : 	FILE *f = 0;				/* stdio file pointer */

	mov	DWORD PTR _f$[ebp], 0

; 90   : 
; 91   : 	/* Read file status & alloc memory for file data */
; 92   : 	if(!res || !file || !*file) RETURN_OK;

	cmp	DWORD PTR _res$[ebp], 0
	je	SHORT $L70287
	cmp	DWORD PTR _file$[ebp], 0
	je	SHORT $L70287
	mov	eax, DWORD PTR _file$[ebp]
	movsx	ecx, BYTE PTR [eax]
	test	ecx, ecx
	jne	SHORT $L70286
$L70287:
	jmp	$eva_noerr$70288
$L70286:

; 93   : 	if(stat(file, &sts)) RETURN_ERROR("Fichier non trouvé", NOP);

	lea	edx, DWORD PTR _sts$[ebp]
	push	edx
	mov	eax, DWORD PTR _file$[ebp]
	push	eax
	call	_stat
	add	esp, 8
	test	eax, eax
	je	SHORT $L70289
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29872], OFFSET FLAT:$SG70291
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 93		; 0000005dH
	jmp	$eva_err$70292
$L70289:

; 94   : 	*res = dynbuf_init(sts.st_size+16);

	mov	eax, DWORD PTR _sts$[ebp+20]
	add	eax, 16					; 00000010H
	push	eax
	call	_dynbuf_init
	add	esp, 4
	mov	ecx, DWORD PTR _res$[ebp]
	mov	DWORD PTR [ecx], eax

; 95   : 
; 96   : 	/* Open file & read data */
; 97   : 	f = fopen(file, "r");

	push	OFFSET FLAT:$SG70293
	mov	edx, DWORD PTR _file$[ebp]
	push	edx
	call	_fopen
	add	esp, 8
	mov	DWORD PTR _f$[ebp], eax

; 98   : 	if(!f)  RETURN_ERROR("Impossible d'ouvrir le fichier", NOP);

	cmp	DWORD PTR _f$[ebp], 0
	jne	SHORT $L70294
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29872], OFFSET FLAT:$SG70296
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 98		; 00000062H
	jmp	SHORT $eva_err$70292
$L70294:

; 99   : 	(*res)->cnt = fread((*res)->data, 1, sts.st_size+2, f);

	mov	edx, DWORD PTR _f$[ebp]
	push	edx
	mov	eax, DWORD PTR _sts$[ebp+20]
	add	eax, 2
	push	eax
	push	1
	mov	ecx, DWORD PTR _res$[ebp]
	mov	edx, DWORD PTR [ecx]
	add	edx, 8
	push	edx
	call	_fread
	add	esp, 16					; 00000010H
	mov	ecx, DWORD PTR _res$[ebp]
	mov	edx, DWORD PTR [ecx]
	mov	DWORD PTR [edx+4], eax

; 100  : 	fclose(f);

	mov	eax, DWORD PTR _f$[ebp]
	push	eax
	call	_fclose
	add	esp, 4
$eva_noerr$70288:

; 101  : 
; 102  : 	RETURN_OK_CLEANUP;

	push	0
	push	OFFSET FLAT:$SG70297
	push	OFFSET FLAT:$SG70298
	mov	ecx, DWORD PTR _cntxt$[ebp]
	push	ecx
	call	_err_clear
	add	esp, 16					; 00000010H
$eva_err$70292:
	mov	edx, DWORD PTR _cntxt$[ebp]
	cmp	DWORD PTR [edx+29872], 0
	je	SHORT $L70299
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	ecx, DWORD PTR [eax+29900]
	push	ecx
	push	OFFSET FLAT:$SG70300
	push	OFFSET FLAT:$SG70301
	mov	edx, DWORD PTR _cntxt$[ebp]
	push	edx
	call	_err_add_context
	add	esp, 16					; 00000010H
$L70299:
	mov	eax, DWORD PTR _cntxt$[ebp]
	xor	ecx, ecx
	cmp	DWORD PTR [eax+29872], 0
	setne	cl
	mov	eax, ecx

; 103  : }

	mov	esp, ebp
	pop	ebp
	ret	0
_file_to_dynbuf ENDP
_TEXT	ENDS
PUBLIC	_file_read_tabrc
EXTRN	__snprintf:NEAR
EXTRN	_mem_alloc:NEAR
EXTRN	_mem_free:NEAR
EXTRN	_strtoul:NEAR
EXTRN	_qry_obj_field:NEAR
EXTRN	_dyntab_val:NEAR
_DATA	SEGMENT
	ORG $+1
$SG70325 DB	'_EVA_FILE_SERVER_NAME', 00H
	ORG $+2
$SG70327 DB	'../docs/%s/%s', 00H
	ORG $+2
$SG70331 DB	'Fichier non trouv', 0e9H, 00H
	ORG $+1
$SG70335 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70337 DB	'r', 00H
	ORG $+2
$SG70340 DB	'Impossible d''ouvrir le fichier', 00H
	ORG $+1
$SG70343 DB	'D:\Travail\ABI\EVA\V4.0\CGI\Brunix-2016\file_utils.c', 00H
	ORG $+3
$SG70344 DB	'file_read_tabrc', 00H
$SG70346 DB	'D:\Travail\ABI\EVA\V4.0\CGI\Brunix-2016\file_utils.c', 00H
	ORG $+3
$SG70347 DB	'file_read_tabrc', 00H
_DATA	ENDS
_TEXT	SEGMENT
_cntxt$ = 8
_res$ = 12
_file$ = 16
_sts$ = -2108
_f$ = -2116
_sz$ = -2120
_fpath$ = -2068
_fdata$ = -2072
_id$ = -2124
_end$ = -2112
_fname$ = -20
_size1$70332 = -2128
_file_read_tabrc PROC NEAR

; 117  : ){

	push	ebp
	mov	ebp, esp
	sub	esp, 2128				; 00000850H

; 118  : 	struct stat sts;			/* for stat() */
; 119  : 	FILE *f = 0;				/* stdio file pointer */

	mov	DWORD PTR _f$[ebp], 0

; 120  : 	size_t sz;					/* char counter */
; 121  : 	char fpath[2048];			/* file path if uploaded */
; 122  : 	char *fdata = NULL;			/* alloc-ed file data */

	mov	DWORD PTR _fdata$[ebp], 0

; 123  : 	unsigned long id;			/* uploaded file IdObj */
; 124  : 	char *end = NULL;			/* for strtoul */

	mov	DWORD PTR _end$[ebp], 0

; 125  : 	DynTable fname = {0};		/* uploaded file name */

	mov	DWORD PTR _fname$[ebp], 0
	xor	eax, eax
	mov	DWORD PTR _fname$[ebp+4], eax
	mov	DWORD PTR _fname$[ebp+8], eax
	mov	DWORD PTR _fname$[ebp+12], eax
	mov	DWORD PTR _fname$[ebp+16], eax

; 126  : 
; 127  : 	/* Check if file is IdObj */
; 128  : 	id = strtoul(file, &end, 10);

	push	10					; 0000000aH
	lea	ecx, DWORD PTR _end$[ebp]
	push	ecx
	mov	edx, DWORD PTR _file$[ebp]
	push	edx
	call	_strtoul
	add	esp, 12					; 0000000cH
	mov	DWORD PTR _id$[ebp], eax

; 129  : 	if(id && (!end || !*end))

	cmp	DWORD PTR _id$[ebp], 0
	je	$L70322
	cmp	DWORD PTR _end$[ebp], 0
	je	SHORT $L70323
	mov	eax, DWORD PTR _end$[ebp]
	movsx	ecx, BYTE PTR [eax]
	test	ecx, ecx
	jne	SHORT $L70322
$L70323:

; 131  : 		/* file is an uploaded object : get uploaded file path */
; 132  : 		if(qry_obj_field(cntxt, &fname, id, "_EVA_FILE_SERVER_NAME")) STACK_ERROR;

	push	OFFSET FLAT:$SG70325
	mov	edx, DWORD PTR _id$[ebp]
	push	edx
	lea	eax, DWORD PTR _fname$[ebp]
	push	eax
	mov	ecx, DWORD PTR _cntxt$[ebp]
	push	ecx
	call	_qry_obj_field
	add	esp, 16					; 00000010H
	test	eax, eax
	je	SHORT $L70324
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 132		; 00000084H
	jmp	$eva_err$70326
$L70324:

; 133  : 		snprintf(add_sz_str(fpath), "../docs/%s/%s", cntxt->dbname, dyntab_val(&fname, 0, 0));

	push	0
	push	0
	lea	eax, DWORD PTR _fname$[ebp]
	push	eax
	call	_dyntab_val
	add	esp, 12					; 0000000cH
	push	eax
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	edx, DWORD PTR [ecx+29804]
	push	edx
	push	OFFSET FLAT:$SG70327
	push	2047					; 000007ffH
	lea	eax, DWORD PTR _fpath$[ebp]
	push	eax
	call	__snprintf
	add	esp, 20					; 00000014H

; 134  : 		file = fpath;

	lea	ecx, DWORD PTR _fpath$[ebp]
	mov	DWORD PTR _file$[ebp], ecx
$L70322:

; 136  : 
; 137  : 	/* Read file status & alloc memory for file data */
; 138  : 	if(!file || stat(file, &sts)) RETURN_ERROR("Fichier non trouvé", NOP);

	cmp	DWORD PTR _file$[ebp], 0
	je	SHORT $L70329
	lea	edx, DWORD PTR _sts$[ebp]
	push	edx
	mov	eax, DWORD PTR _file$[ebp]
	push	eax
	call	_stat
	add	esp, 8
	test	eax, eax
	je	SHORT $L70328
$L70329:
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29872], OFFSET FLAT:$SG70331
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 138		; 0000008aH
	jmp	$eva_err$70326
$L70328:

; 139  : 	M_ALLOC(fdata, sts.st_size+16);

	mov	eax, DWORD PTR _sts$[ebp+20]
	add	eax, 16					; 00000010H
	mov	DWORD PTR _size1$70332[ebp], eax
	mov	ecx, DWORD PTR _size1$70332[ebp]
	push	ecx
	call	_mem_alloc
	add	esp, 4
	mov	DWORD PTR _fdata$[ebp], eax
	cmp	DWORD PTR _size1$70332[ebp], 0
	je	SHORT $L70333
	cmp	DWORD PTR _fdata$[ebp], 0
	jne	SHORT $L70333
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29872], OFFSET FLAT:$SG70335
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 139		; 0000008bH
	jmp	$eva_err$70326
$L70333:

; 140  : 
; 141  : 	/* Open file & read data */
; 142  : 	f = fopen(file, "r");

	push	OFFSET FLAT:$SG70337
	mov	ecx, DWORD PTR _file$[ebp]
	push	ecx
	call	_fopen
	add	esp, 8
	mov	DWORD PTR _f$[ebp], eax

; 143  : 	if(!f)  RETURN_ERROR("Impossible d'ouvrir le fichier", NOP);

	cmp	DWORD PTR _f$[ebp], 0
	jne	SHORT $L70338
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29872], OFFSET FLAT:$SG70340
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 143		; 0000008fH
	jmp	$eva_err$70326
$L70338:

; 144  : 	sz = fread(fdata, 1, sts.st_size+2, f);

	mov	ecx, DWORD PTR _f$[ebp]
	push	ecx
	mov	edx, DWORD PTR _sts$[ebp+20]
	add	edx, 2
	push	edx
	push	1
	mov	eax, DWORD PTR _fdata$[ebp]
	push	eax
	call	_fread
	add	esp, 16					; 00000010H
	mov	DWORD PTR _sz$[ebp], eax

; 145  : 	fdata[sz] = 0;

	mov	ecx, DWORD PTR _fdata$[ebp]
	add	ecx, DWORD PTR _sz$[ebp]
	mov	BYTE PTR [ecx], 0

; 146  : 	fclose(f);

	mov	edx, DWORD PTR _f$[ebp]
	push	edx
	call	_fclose
	add	esp, 4

; 147  : 
; 148  : 	/* Read records in DynTable */
; 149  : 	if(file_tabrc_to_dyntab(cntxt, res, fdata, sz)) STACK_ERROR;

	mov	eax, DWORD PTR _sz$[ebp]
	push	eax
	mov	ecx, DWORD PTR _fdata$[ebp]
	push	ecx
	mov	edx, DWORD PTR _res$[ebp]
	push	edx
	mov	eax, DWORD PTR _cntxt$[ebp]
	push	eax
	call	_file_tabrc_to_dyntab
	add	esp, 16					; 00000010H
	test	eax, eax
	je	SHORT $eva_noerr$70342
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 149		; 00000095H
	jmp	SHORT $eva_err$70326
$eva_noerr$70342:

; 150  : 
; 151  : 	RETURN_OK_CLEANUP;

	push	0
	push	OFFSET FLAT:$SG70343
	push	OFFSET FLAT:$SG70344
	mov	edx, DWORD PTR _cntxt$[ebp]
	push	edx
	call	_err_clear
	add	esp, 16					; 00000010H
$eva_err$70326:
	mov	eax, DWORD PTR _cntxt$[ebp]
	cmp	DWORD PTR [eax+29872], 0
	je	SHORT $L70345
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	edx, DWORD PTR [ecx+29900]
	push	edx
	push	OFFSET FLAT:$SG70346
	push	OFFSET FLAT:$SG70347
	mov	eax, DWORD PTR _cntxt$[ebp]
	push	eax
	call	_err_add_context
	add	esp, 16					; 00000010H
$L70345:
	mov	ecx, DWORD PTR _fdata$[ebp]
	push	ecx
	call	_mem_free
	add	esp, 4
	mov	DWORD PTR _fdata$[ebp], 0
	mov	edx, DWORD PTR _cntxt$[ebp]
	xor	eax, eax
	cmp	DWORD PTR [edx+29872], 0
	setne	al

; 152  : }

	mov	esp, ebp
	pop	ebp
	ret	0
_file_read_tabrc ENDP
_TEXT	ENDS
PUBLIC	_file_read_config
EXTRN	_chdir:NEAR
EXTRN	_dyntab_set_txt:NEAR
_BSS	SEGMENT
$SG70361 DB	01H DUP (?)
_BSS	ENDS
_DATA	SEGMENT
$SG70355 DB	'serverconfig.conf', 00H
	ORG $+2
$SG70357 DB	'C:\Program Files\MSOfficeEVA', 00H
	ORG $+3
$SG70359 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70363 DB	'D:\Travail\ABI\EVA\V4.0\CGI\Brunix-2016\file_utils.c', 00H
	ORG $+3
$SG70364 DB	'file_read_config', 00H
	ORG $+3
$SG70367 DB	'D:\Travail\ABI\EVA\V4.0\CGI\Brunix-2016\file_utils.c', 00H
	ORG $+3
$SG70368 DB	'file_read_config', 00H
	ORG $+3
$SG70370 DB	'D:\Travail\ABI\EVA\V4.0\CGI\Brunix-2016\file_utils.c', 00H
	ORG $+3
$SG70371 DB	'file_read_config', 00H
_DATA	ENDS
_TEXT	SEGMENT
_cntxt$ = 8
_file_read_config PROC NEAR

; 164  : ){

	push	ebp
	mov	ebp, esp

; 165  : 	chdir(cntxt->path);

	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	ecx, DWORD PTR [eax+29728]
	push	ecx
	call	_chdir
	add	esp, 4

; 166  : 	if(file_read_tabrc(cntxt, &cntxt->cnf_server, "serverconfig.conf"))

	push	OFFSET FLAT:$SG70355
	mov	edx, DWORD PTR _cntxt$[ebp]
	add	edx, 29380				; 000072c4H
	push	edx
	mov	eax, DWORD PTR _cntxt$[ebp]
	push	eax
	call	_file_read_tabrc
	add	esp, 12					; 0000000cH
	test	eax, eax
	je	SHORT $L70354

; 168  : 		DYNTAB_SET(&cntxt->cnf_server, 0, 0, "C:\\Program Files\\MSOfficeEVA");

	push	28					; 0000001cH
	push	OFFSET FLAT:$SG70357
	push	0
	push	0
	mov	ecx, DWORD PTR _cntxt$[ebp]
	add	ecx, 29380				; 000072c4H
	push	ecx
	call	_dyntab_set_txt
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L70356
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29872], OFFSET FLAT:$SG70359
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 168		; 000000a8H
	jmp	SHORT $eva_err$70360
$L70356:

; 169  : 		cntxt->dbpwd = "";

	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29808], OFFSET FLAT:$SG70361

; 170  : 		CLEAR_ERROR_NOWARN;

	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29872], 0
	push	170					; 000000aaH
	push	OFFSET FLAT:$SG70363
	push	OFFSET FLAT:$SG70364
	mov	eax, DWORD PTR _cntxt$[ebp]
	push	eax
	call	_err_clear
	add	esp, 16					; 00000010H

; 172  : 	else

	jmp	SHORT $eva_noerr$70366
$L70354:

; 174  : 		cntxt->dbpwd = dyntab_val(&cntxt->cnf_server, 1, 0);

	push	0
	push	1
	mov	ecx, DWORD PTR _cntxt$[ebp]
	add	ecx, 29380				; 000072c4H
	push	ecx
	call	_dyntab_val
	add	esp, 12					; 0000000cH
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29808], eax
$eva_noerr$70366:

; 176  : 
; 177  : 	RETURN_OK_CLEANUP;

	push	0
	push	OFFSET FLAT:$SG70367
	push	OFFSET FLAT:$SG70368
	mov	eax, DWORD PTR _cntxt$[ebp]
	push	eax
	call	_err_clear
	add	esp, 16					; 00000010H
$eva_err$70360:
	mov	ecx, DWORD PTR _cntxt$[ebp]
	cmp	DWORD PTR [ecx+29872], 0
	je	SHORT $L70369
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	eax, DWORD PTR [edx+29900]
	push	eax
	push	OFFSET FLAT:$SG70370
	push	OFFSET FLAT:$SG70371
	mov	ecx, DWORD PTR _cntxt$[ebp]
	push	ecx
	call	_err_add_context
	add	esp, 16					; 00000010H
$L70369:
	mov	edx, DWORD PTR _cntxt$[ebp]
	xor	eax, eax
	cmp	DWORD PTR [edx+29872], 0
	setne	al

; 178  : }

	pop	ebp
	ret	0
_file_read_config ENDP
_TEXT	ENDS
PUBLIC	_file_from_idobj
_DATA	SEGMENT
	ORG $+3
$SG70387 DB	'_EVA_FILE_SERVER_NAME', 00H
	ORG $+2
$SG70391 DB	'D:\Travail\ABI\EVA\V4.0\CGI\Brunix-2016\file_utils.c', 00H
	ORG $+3
$SG70392 DB	'file_from_idobj', 00H
$SG70394 DB	'D:\Travail\ABI\EVA\V4.0\CGI\Brunix-2016\file_utils.c', 00H
	ORG $+3
$SG70395 DB	'file_from_idobj', 00H
_DATA	ENDS
_TEXT	SEGMENT
_cntxt$ = 8
_file$ = 12
_data$ = 16
_idobj$ = -4
_file_from_idobj PROC NEAR

; 193  : ){

	push	ebp
	mov	ebp, esp
	sub	esp, 8

; 194  : 	unsigned long idobj = (file && *file) ? strtoul(*file, NULL, 10) : 0;

	cmp	DWORD PTR _file$[ebp], 0
	je	SHORT $L70656
	mov	eax, DWORD PTR _file$[ebp]
	cmp	DWORD PTR [eax], 0
	je	SHORT $L70656
	push	10					; 0000000aH
	push	0
	mov	ecx, DWORD PTR _file$[ebp]
	mov	edx, DWORD PTR [ecx]
	push	edx
	call	_strtoul
	add	esp, 12					; 0000000cH
	mov	DWORD PTR -8+[ebp], eax
	jmp	SHORT $L70657
$L70656:
	mov	DWORD PTR -8+[ebp], 0
$L70657:
	mov	eax, DWORD PTR -8+[ebp]
	mov	DWORD PTR _idobj$[ebp], eax

; 195  : 	if(idobj)

	cmp	DWORD PTR _idobj$[ebp], 0
	je	SHORT $L70389

; 197  : 		if(qry_obj_field(cntxt, data, idobj, "_EVA_FILE_SERVER_NAME")) STACK_ERROR;

	push	OFFSET FLAT:$SG70387
	mov	ecx, DWORD PTR _idobj$[ebp]
	push	ecx
	mov	edx, DWORD PTR _data$[ebp]
	push	edx
	mov	eax, DWORD PTR _cntxt$[ebp]
	push	eax
	call	_qry_obj_field
	add	esp, 16					; 00000010H
	test	eax, eax
	je	SHORT $L70386
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 197		; 000000c5H
	jmp	SHORT $eva_err$70388
$L70386:

; 198  : 		if(data->nbrows) *file = data->cell->txt;

	mov	edx, DWORD PTR _data$[ebp]
	cmp	DWORD PTR [edx], 0
	je	SHORT $L70389
	mov	eax, DWORD PTR _data$[ebp]
	mov	ecx, DWORD PTR [eax+16]
	mov	edx, DWORD PTR _file$[ebp]
	mov	eax, DWORD PTR [ecx]
	mov	DWORD PTR [edx], eax
$L70389:
$eva_noerr$70390:

; 200  : 
; 201  : 	RETURN_OK_CLEANUP;

	push	0
	push	OFFSET FLAT:$SG70391
	push	OFFSET FLAT:$SG70392
	mov	ecx, DWORD PTR _cntxt$[ebp]
	push	ecx
	call	_err_clear
	add	esp, 16					; 00000010H
$eva_err$70388:
	mov	edx, DWORD PTR _cntxt$[ebp]
	cmp	DWORD PTR [edx+29872], 0
	je	SHORT $L70393
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	ecx, DWORD PTR [eax+29900]
	push	ecx
	push	OFFSET FLAT:$SG70394
	push	OFFSET FLAT:$SG70395
	mov	edx, DWORD PTR _cntxt$[ebp]
	push	edx
	call	_err_add_context
	add	esp, 16					; 00000010H
$L70393:
	mov	eax, DWORD PTR _cntxt$[ebp]
	xor	ecx, ecx
	cmp	DWORD PTR [eax+29872], 0
	setne	cl
	mov	eax, ecx

; 202  : }

	mov	esp, ebp
	pop	ebp
	ret	0
_file_from_idobj ENDP
_TEXT	ENDS
PUBLIC	_file_read_import_data
EXTRN	_strncmp:NEAR
EXTRN	_strstr:NEAR
_DATA	SEGMENT
$SG70418 DB	'Import file is NULL', 00H
$SG70424 DB	'Import file not found', 00H
	ORG $+2
$SG70428 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70430 DB	'r', 00H
	ORG $+2
$SG70433 DB	'Cannot open import file', 00H
$SG70436 DB	'Cannot read import file', 00H
$SG70438 DB	0aH, 0aH, 00H
	ORG $+1
$SG70441 DB	'IdObj', 09H, 'Label', 0aH, 00H
	ORG $+3
$SG70442 DB	'IdObj', 09H, 'Field', 09H, 'Value', 09H, 'Type', 09H, 'N'
	DB	'um', 09H, 'Line', 0aH, 00H
	ORG $+3
$SG70444 DB	'Invalid format for import file', 00H
	ORG $+1
$SG70448 DB	'D:\Travail\ABI\EVA\V4.0\CGI\Brunix-2016\file_utils.c', 00H
	ORG $+3
$SG70449 DB	'file_read_import_data', 00H
	ORG $+2
$SG70451 DB	'D:\Travail\ABI\EVA\V4.0\CGI\Brunix-2016\file_utils.c', 00H
	ORG $+3
$SG70452 DB	'file_read_import_data', 00H
_DATA	ENDS
_TEXT	SEGMENT
_cntxt$ = 8
_forms$ = 12
_objdata$ = 16
_file$ = 20
_data$ = -60
_sts$ = -40
_f$ = -64
_sz$ = -72
_fdata$ = -4
_p1$ = -68
_size1$70425 = -76
_file_read_import_data PROC NEAR

; 219  : ){

	push	ebp
	mov	ebp, esp
	sub	esp, 76					; 0000004cH

; 220  : 	DynTable data = { 0 };

	mov	DWORD PTR _data$[ebp], 0
	xor	eax, eax
	mov	DWORD PTR _data$[ebp+4], eax
	mov	DWORD PTR _data$[ebp+8], eax
	mov	DWORD PTR _data$[ebp+12], eax
	mov	DWORD PTR _data$[ebp+16], eax

; 221  : 	struct stat sts;			/* for stat() */
; 222  : 	FILE *f = 0;				/* stdio file pointer */

	mov	DWORD PTR _f$[ebp], 0

; 223  : 	size_t sz;					/* char counter */
; 224  : 	char *fdata = NULL;			/* alloc-ed file data */

	mov	DWORD PTR _fdata$[ebp], 0

; 225  : 	char *p1;
; 226  : 
; 227  : 	/* Handle file object */
; 228  : 	if(!file || !*file) RETURN_ERROR("Import file is NULL", NOP);

	cmp	DWORD PTR _file$[ebp], 0
	je	SHORT $L70416
	mov	ecx, DWORD PTR _file$[ebp]
	movsx	edx, BYTE PTR [ecx]
	test	edx, edx
	jne	SHORT $L70415
$L70416:
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29872], OFFSET FLAT:$SG70418
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 228		; 000000e4H
	jmp	$eva_err$70419
$L70415:

; 229  : 	if(file_from_idobj(cntxt, &file, &data)) STACK_ERROR;

	lea	edx, DWORD PTR _data$[ebp]
	push	edx
	lea	eax, DWORD PTR _file$[ebp]
	push	eax
	mov	ecx, DWORD PTR _cntxt$[ebp]
	push	ecx
	call	_file_from_idobj
	add	esp, 12					; 0000000cH
	test	eax, eax
	je	SHORT $L70420
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 229		; 000000e5H
	jmp	$eva_err$70419
$L70420:

; 230  : 
; 231  : 	/* Read file status & alloc memory for file data */
; 232  : 	if(!file || stat(file, &sts)) RETURN_ERROR("Import file not found", NOP);

	cmp	DWORD PTR _file$[ebp], 0
	je	SHORT $L70422
	lea	eax, DWORD PTR _sts$[ebp]
	push	eax
	mov	ecx, DWORD PTR _file$[ebp]
	push	ecx
	call	_stat
	add	esp, 8
	test	eax, eax
	je	SHORT $L70421
$L70422:
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29872], OFFSET FLAT:$SG70424
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 232		; 000000e8H
	jmp	$eva_err$70419
$L70421:

; 233  : 	M_ALLOC(fdata, sts.st_size+2);

	mov	ecx, DWORD PTR _sts$[ebp+20]
	add	ecx, 2
	mov	DWORD PTR _size1$70425[ebp], ecx
	mov	edx, DWORD PTR _size1$70425[ebp]
	push	edx
	call	_mem_alloc
	add	esp, 4
	mov	DWORD PTR _fdata$[ebp], eax
	cmp	DWORD PTR _size1$70425[ebp], 0
	je	SHORT $L70426
	cmp	DWORD PTR _fdata$[ebp], 0
	jne	SHORT $L70426
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29872], OFFSET FLAT:$SG70428
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 233		; 000000e9H
	jmp	$eva_err$70419
$L70426:

; 234  : 
; 235  : 	/* Open file & read data */
; 236  : 	f = fopen(file, "r");

	push	OFFSET FLAT:$SG70430
	mov	edx, DWORD PTR _file$[ebp]
	push	edx
	call	_fopen
	add	esp, 8
	mov	DWORD PTR _f$[ebp], eax

; 237  : 	if(!f)  RETURN_ERROR("Cannot open import file", NOP);

	cmp	DWORD PTR _f$[ebp], 0
	jne	SHORT $L70431
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29872], OFFSET FLAT:$SG70433
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 237		; 000000edH
	jmp	$eva_err$70419
$L70431:

; 238  : 	sz = fread(fdata, 1, sts.st_size + 2, f);

	mov	edx, DWORD PTR _f$[ebp]
	push	edx
	mov	eax, DWORD PTR _sts$[ebp+20]
	add	eax, 2
	push	eax
	push	1
	mov	ecx, DWORD PTR _fdata$[ebp]
	push	ecx
	call	_fread
	add	esp, 16					; 00000010H
	mov	DWORD PTR _sz$[ebp], eax

; 239  : 	if(!sz)  RETURN_ERROR("Cannot read import file", NOP);

	cmp	DWORD PTR _sz$[ebp], 0
	jne	SHORT $L70434
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29872], OFFSET FLAT:$SG70436
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 239		; 000000efH
	jmp	$eva_err$70419
$L70434:

; 240  : 	fdata[sz] = 0;

	mov	ecx, DWORD PTR _fdata$[ebp]
	add	ecx, DWORD PTR _sz$[ebp]
	mov	BYTE PTR [ecx], 0

; 241  : 	fclose(f); f = NULL;

	mov	edx, DWORD PTR _f$[ebp]
	push	edx
	call	_fclose
	add	esp, 4
	mov	DWORD PTR _f$[ebp], 0

; 242  : 
; 243  : 	/* Find end of forms marker : two consecutive \n */
; 244  : 	p1 = strstr(fdata, "\n\n");

	push	OFFSET FLAT:$SG70438
	mov	eax, DWORD PTR _fdata$[ebp]
	push	eax
	call	_strstr
	add	esp, 8
	mov	DWORD PTR _p1$[ebp], eax

; 245  : 	if(strncmp(fdata, add_sz_str("IdObj	Label\n")) ||
; 246  : 		!p1 || strncmp(p1 + 2, add_sz_str("IdObj	Field	Value	Type	Num	Line\n")))

	push	12					; 0000000cH
	push	OFFSET FLAT:$SG70441
	mov	ecx, DWORD PTR _fdata$[ebp]
	push	ecx
	call	_strncmp
	add	esp, 12					; 0000000cH
	test	eax, eax
	jne	SHORT $L70440
	cmp	DWORD PTR _p1$[ebp], 0
	je	SHORT $L70440
	push	32					; 00000020H
	push	OFFSET FLAT:$SG70442
	mov	edx, DWORD PTR _p1$[ebp]
	add	edx, 2
	push	edx
	call	_strncmp
	add	esp, 12					; 0000000cH
	test	eax, eax
	je	SHORT $L70439
$L70440:

; 247  : 		RETURN_ERROR("Invalid format for import file", NOP);

	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29872], OFFSET FLAT:$SG70444
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 247		; 000000f7H
	jmp	$eva_err$70419
$L70439:

; 248  : 	*p1 = 0;

	mov	edx, DWORD PTR _p1$[ebp]
	mov	BYTE PTR [edx], 0

; 249  : 
; 250  : 	/* Read forms & objdata in DynTable */
; 251  : 	if(file_tabrc_to_dyntab(cntxt, forms, fdata, p1 - fdata)) STACK_ERROR;

	mov	eax, DWORD PTR _p1$[ebp]
	sub	eax, DWORD PTR _fdata$[ebp]
	push	eax
	mov	ecx, DWORD PTR _fdata$[ebp]
	push	ecx
	mov	edx, DWORD PTR _forms$[ebp]
	push	edx
	mov	eax, DWORD PTR _cntxt$[ebp]
	push	eax
	call	_file_tabrc_to_dyntab
	add	esp, 16					; 00000010H
	test	eax, eax
	je	SHORT $L70445
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 251		; 000000fbH
	jmp	SHORT $eva_err$70419
$L70445:

; 252  : 	if(file_tabrc_to_dyntab(cntxt, objdata, p1 + 2, sz - (p1 - fdata) - 2)) STACK_ERROR;

	mov	edx, DWORD PTR _p1$[ebp]
	sub	edx, DWORD PTR _fdata$[ebp]
	mov	eax, DWORD PTR _sz$[ebp]
	sub	eax, edx
	sub	eax, 2
	push	eax
	mov	ecx, DWORD PTR _p1$[ebp]
	add	ecx, 2
	push	ecx
	mov	edx, DWORD PTR _objdata$[ebp]
	push	edx
	mov	eax, DWORD PTR _cntxt$[ebp]
	push	eax
	call	_file_tabrc_to_dyntab
	add	esp, 16					; 00000010H
	test	eax, eax
	je	SHORT $eva_noerr$70447
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 252		; 000000fcH
	jmp	SHORT $eva_err$70419
$eva_noerr$70447:

; 253  : 
; 254  : 	RETURN_OK_CLEANUP;

	push	0
	push	OFFSET FLAT:$SG70448
	push	OFFSET FLAT:$SG70449
	mov	edx, DWORD PTR _cntxt$[ebp]
	push	edx
	call	_err_clear
	add	esp, 16					; 00000010H
$eva_err$70419:
	mov	eax, DWORD PTR _cntxt$[ebp]
	cmp	DWORD PTR [eax+29872], 0
	je	SHORT $L70450
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	edx, DWORD PTR [ecx+29900]
	push	edx
	push	OFFSET FLAT:$SG70451
	push	OFFSET FLAT:$SG70452
	mov	eax, DWORD PTR _cntxt$[ebp]
	push	eax
	call	_err_add_context
	add	esp, 16					; 00000010H
$L70450:
	cmp	DWORD PTR _f$[ebp], 0
	je	SHORT $L70453
	mov	ecx, DWORD PTR _f$[ebp]
	push	ecx
	call	_fclose
	add	esp, 4
$L70453:
	mov	edx, DWORD PTR _fdata$[ebp]
	push	edx
	call	_mem_free
	add	esp, 4
	mov	DWORD PTR _fdata$[ebp], 0
	lea	eax, DWORD PTR _data$[ebp]
	push	eax
	call	_dyntab_free
	add	esp, 4
	mov	ecx, DWORD PTR _cntxt$[ebp]
	xor	eax, eax
	cmp	DWORD PTR [ecx+29872], 0
	setne	al

; 255  : }

	mov	esp, ebp
	pop	ebp
	ret	0
_file_read_import_data ENDP
_TEXT	ENDS
PUBLIC	_chdir_user_doc
PUBLIC	_chdir_db_doc
EXTRN	_mkdir:NEAR
_DATA	SEGMENT
	ORG $+2
$SG70464 DB	'Droits d''acc', 0e8H, 's incorrects sur un dossier', 00H
	ORG $+3
$SG70466 DB	'D:\Travail\ABI\EVA\V4.0\CGI\Brunix-2016\file_utils.c', 00H
	ORG $+3
$SG70467 DB	'chdir_user_doc', 00H
	ORG $+1
$SG70469 DB	'D:\Travail\ABI\EVA\V4.0\CGI\Brunix-2016\file_utils.c', 00H
	ORG $+3
$SG70470 DB	'chdir_user_doc', 00H
_DATA	ENDS
_TEXT	SEGMENT
_cntxt$ = 8
_chdir_user_doc PROC NEAR

; 267  : ){

	push	ebp
	mov	ebp, esp

; 268  : 	if(chdir_db_doc(cntxt)) STACK_ERROR;

	mov	eax, DWORD PTR _cntxt$[ebp]
	push	eax
	call	_chdir_db_doc
	add	esp, 4
	test	eax, eax
	je	SHORT $L70460
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 268		; 0000010cH
	jmp	SHORT $eva_err$70461
$L70460:

; 269  : 	MKDIR(dyntab_val(&cntxt->id_user, 0, 0));

	push	0
	push	0
	mov	edx, DWORD PTR _cntxt$[ebp]
	add	edx, 29408				; 000072e0H
	push	edx
	call	_dyntab_val
	add	esp, 12					; 0000000cH
	push	eax
	call	_mkdir
	add	esp, 4

; 270  : 	if(chdir(dyntab_val(&cntxt->id_user, 0, 0))) RETURN_ERR_DIRECTORY(NOP);

	push	0
	push	0
	mov	eax, DWORD PTR _cntxt$[ebp]
	add	eax, 29408				; 000072e0H
	push	eax
	call	_dyntab_val
	add	esp, 12					; 0000000cH
	push	eax
	call	_chdir
	add	esp, 4
	test	eax, eax
	je	SHORT $eva_noerr$70465
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29872], OFFSET FLAT:$SG70464
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 270		; 0000010eH
	jmp	SHORT $eva_err$70461
$eva_noerr$70465:

; 271  : 	RETURN_OK_CLEANUP;

	push	0
	push	OFFSET FLAT:$SG70466
	push	OFFSET FLAT:$SG70467
	mov	eax, DWORD PTR _cntxt$[ebp]
	push	eax
	call	_err_clear
	add	esp, 16					; 00000010H
$eva_err$70461:
	mov	ecx, DWORD PTR _cntxt$[ebp]
	cmp	DWORD PTR [ecx+29872], 0
	je	SHORT $L70468
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	eax, DWORD PTR [edx+29900]
	push	eax
	push	OFFSET FLAT:$SG70469
	push	OFFSET FLAT:$SG70470
	mov	ecx, DWORD PTR _cntxt$[ebp]
	push	ecx
	call	_err_add_context
	add	esp, 16					; 00000010H
$L70468:
	mov	edx, DWORD PTR _cntxt$[ebp]
	xor	eax, eax
	cmp	DWORD PTR [edx+29872], 0
	setne	al

; 272  : }

	pop	ebp
	ret	0
_chdir_user_doc ENDP
_TEXT	ENDS
_DATA	SEGMENT
	ORG $+1
$SG70479 DB	'Droits d''acc', 0e8H, 's incorrects sur un dossier', 00H
	ORG $+3
$SG70481 DB	'docs', 00H
	ORG $+3
$SG70483 DB	'docs', 00H
	ORG $+3
$SG70485 DB	'Droits d''acc', 0e8H, 's incorrects sur un dossier', 00H
	ORG $+3
$SG70488 DB	'Droits d''acc', 0e8H, 's incorrects sur un dossier', 00H
	ORG $+3
$SG70490 DB	'D:\Travail\ABI\EVA\V4.0\CGI\Brunix-2016\file_utils.c', 00H
	ORG $+3
$SG70491 DB	'chdir_db_doc', 00H
	ORG $+3
$SG70493 DB	'D:\Travail\ABI\EVA\V4.0\CGI\Brunix-2016\file_utils.c', 00H
	ORG $+3
$SG70494 DB	'chdir_db_doc', 00H
_DATA	ENDS
_TEXT	SEGMENT
_cntxt$ = 8
_chdir_db_doc PROC NEAR

; 284  : ){

	push	ebp
	mov	ebp, esp

; 285  : 	if(chdir(cntxt->rootdir)) RETURN_ERR_DIRECTORY(NOP);

	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	ecx, DWORD PTR [eax+29724]
	push	ecx
	call	_chdir
	add	esp, 4
	test	eax, eax
	je	SHORT $L70477
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29872], OFFSET FLAT:$SG70479
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 285		; 0000011dH
	jmp	$eva_err$70480
$L70477:

; 286  : 	MKDIR(DIRECTORY_DOCS);

	push	OFFSET FLAT:$SG70481
	call	_mkdir
	add	esp, 4

; 287  : 	if(chdir(DIRECTORY_DOCS)) RETURN_ERR_DIRECTORY(NOP);

	push	OFFSET FLAT:$SG70483
	call	_chdir
	add	esp, 4
	test	eax, eax
	je	SHORT $L70482
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29872], OFFSET FLAT:$SG70485
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 287		; 0000011fH
	jmp	SHORT $eva_err$70480
$L70482:

; 288  : 	MKDIR(cntxt->dbname);

	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	ecx, DWORD PTR [eax+29804]
	push	ecx
	call	_mkdir
	add	esp, 4

; 289  : 	if(chdir(cntxt->dbname)) RETURN_ERR_DIRECTORY(NOP);

	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	eax, DWORD PTR [edx+29804]
	push	eax
	call	_chdir
	add	esp, 4
	test	eax, eax
	je	SHORT $eva_noerr$70489
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29872], OFFSET FLAT:$SG70488
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 289		; 00000121H
	jmp	SHORT $eva_err$70480
$eva_noerr$70489:

; 290  : 	RETURN_OK_CLEANUP;

	push	0
	push	OFFSET FLAT:$SG70490
	push	OFFSET FLAT:$SG70491
	mov	eax, DWORD PTR _cntxt$[ebp]
	push	eax
	call	_err_clear
	add	esp, 16					; 00000010H
$eva_err$70480:
	mov	ecx, DWORD PTR _cntxt$[ebp]
	cmp	DWORD PTR [ecx+29872], 0
	je	SHORT $L70492
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	eax, DWORD PTR [edx+29900]
	push	eax
	push	OFFSET FLAT:$SG70493
	push	OFFSET FLAT:$SG70494
	mov	ecx, DWORD PTR _cntxt$[ebp]
	push	ecx
	call	_err_add_context
	add	esp, 16					; 00000010H
$L70492:
	mov	edx, DWORD PTR _cntxt$[ebp]
	xor	eax, eax
	cmp	DWORD PTR [edx+29872], 0
	setne	al

; 291  : }

	pop	ebp
	ret	0
_chdir_db_doc ENDP
_TEXT	ENDS
PUBLIC	_FILE_write_tabrc
EXTRN	_fprintf:NEAR
EXTRN	_dynbuf_add:NEAR
EXTRN	_dyntab_sz:NEAR
_DATA	SEGMENT
	ORG $+3
$SG70520 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70522 DB	09H, 00H
	ORG $+2
$SG70523 DB	0aH, 00H
	ORG $+2
$SG70524 DB	'%s%s', 00H
	ORG $+3
$SG70525 DB	'D:\Travail\ABI\EVA\V4.0\CGI\Brunix-2016\file_utils.c', 00H
	ORG $+3
$SG70526 DB	'FILE_write_tabrc', 00H
	ORG $+3
$SG70528 DB	'D:\Travail\ABI\EVA\V4.0\CGI\Brunix-2016\file_utils.c', 00H
	ORG $+3
$SG70529 DB	'FILE_write_tabrc', 00H
_DATA	ENDS
_TEXT	SEGMENT
_cntxt$ = 8
_data$ = 12
_f$ = 16
_buf$ = -4
_i$ = -8
_j$ = -12
_FILE_write_tabrc PROC NEAR

; 305  : ){

	push	ebp
	mov	ebp, esp
	sub	esp, 16					; 00000010H

; 306  : 	DynBuffer *buf = NULL;

	mov	DWORD PTR _buf$[ebp], 0

; 307  : 	unsigned long i, j;
; 308  : 
; 309  : 	if(!data || !f) RETURN_OK;

	cmp	DWORD PTR _data$[ebp], 0
	je	SHORT $L70510
	cmp	DWORD PTR _f$[ebp], 0
	jne	SHORT $L70509
$L70510:
	jmp	$eva_noerr$70511
$L70509:

; 310  : 
; 311  : 	/* Output objects data */
; 312  : 	for(i = 0; i < data->nbrows; i++)

	mov	DWORD PTR _i$[ebp], 0
	jmp	SHORT $L70512
$L70513:
	mov	eax, DWORD PTR _i$[ebp]
	add	eax, 1
	mov	DWORD PTR _i$[ebp], eax
$L70512:
	mov	ecx, DWORD PTR _data$[ebp]
	mov	edx, DWORD PTR _i$[ebp]
	cmp	edx, DWORD PTR [ecx]
	jae	$eva_noerr$70511

; 313  : 		for(j = 0; j < data->nbcols; j++)

	mov	DWORD PTR _j$[ebp], 0
	jmp	SHORT $L70515
$L70516:
	mov	eax, DWORD PTR _j$[ebp]
	add	eax, 1
	mov	DWORD PTR _j$[ebp], eax
$L70515:
	mov	ecx, DWORD PTR _data$[ebp]
	mov	edx, DWORD PTR _j$[ebp]
	cmp	edx, DWORD PTR [ecx+8]
	jae	$L70517

; 315  : 			DYNBUF_ADD_CELL(&buf, data, i, j, EXPORT_TABRC);

	push	1
	push	OFFSET FLAT:_export_tabrc
	mov	eax, DWORD PTR _j$[ebp]
	push	eax
	mov	ecx, DWORD PTR _i$[ebp]
	push	ecx
	mov	edx, DWORD PTR _data$[ebp]
	push	edx
	call	_dyntab_sz
	add	esp, 12					; 0000000cH
	push	eax
	mov	eax, DWORD PTR _j$[ebp]
	push	eax
	mov	ecx, DWORD PTR _i$[ebp]
	push	ecx
	mov	edx, DWORD PTR _data$[ebp]
	push	edx
	call	_dyntab_val
	add	esp, 12					; 0000000cH
	push	eax
	lea	eax, DWORD PTR _buf$[ebp]
	push	eax
	call	_dynbuf_add
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L70518
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29872], OFFSET FLAT:$SG70520
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 315		; 0000013bH
	jmp	SHORT $eva_err$70521
$L70518:

; 316  : 			fprintf(f, "%s%s", buf->data, j < data->nbcols-1 ?  "\t" : "\n");

	mov	eax, DWORD PTR _data$[ebp]
	mov	ecx, DWORD PTR [eax+8]
	sub	ecx, 1
	cmp	DWORD PTR _j$[ebp], ecx
	jae	SHORT $L70662
	mov	DWORD PTR -16+[ebp], OFFSET FLAT:$SG70522
	jmp	SHORT $L70663
$L70662:
	mov	DWORD PTR -16+[ebp], OFFSET FLAT:$SG70523
$L70663:
	mov	edx, DWORD PTR -16+[ebp]
	push	edx
	mov	eax, DWORD PTR _buf$[ebp]
	add	eax, 8
	push	eax
	push	OFFSET FLAT:$SG70524
	mov	ecx, DWORD PTR _f$[ebp]
	push	ecx
	call	_fprintf
	add	esp, 16					; 00000010H

; 317  : 			M_FREE(buf);

	mov	edx, DWORD PTR _buf$[ebp]
	push	edx
	call	_mem_free
	add	esp, 4
	mov	DWORD PTR _buf$[ebp], 0

; 318  : 		}

	jmp	$L70516
$L70517:
	jmp	$L70513
$eva_noerr$70511:

; 319  : 
; 320  : 	RETURN_OK_CLEANUP;

	push	0
	push	OFFSET FLAT:$SG70525
	push	OFFSET FLAT:$SG70526
	mov	eax, DWORD PTR _cntxt$[ebp]
	push	eax
	call	_err_clear
	add	esp, 16					; 00000010H
$eva_err$70521:
	mov	ecx, DWORD PTR _cntxt$[ebp]
	cmp	DWORD PTR [ecx+29872], 0
	je	SHORT $L70527
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	eax, DWORD PTR [edx+29900]
	push	eax
	push	OFFSET FLAT:$SG70528
	push	OFFSET FLAT:$SG70529
	mov	ecx, DWORD PTR _cntxt$[ebp]
	push	ecx
	call	_err_add_context
	add	esp, 16					; 00000010H
$L70527:
	mov	edx, DWORD PTR _buf$[ebp]
	push	edx
	call	_mem_free
	add	esp, 4
	mov	DWORD PTR _buf$[ebp], 0
	mov	eax, DWORD PTR _cntxt$[ebp]
	xor	ecx, ecx
	cmp	DWORD PTR [eax+29872], 0
	setne	cl
	mov	eax, ecx

; 321  : }

	mov	esp, ebp
	pop	ebp
	ret	0
_FILE_write_tabrc ENDP
_TEXT	ENDS
PUBLIC	_file_write_tabrc
_DATA	SEGMENT
	ORG $+3
$SG70546 DB	'w', 00H
	ORG $+2
$SG70549 DB	'Impossible d''', 0e9H, 'crire dans le fichier', 00H
$SG70552 DB	'D:\Travail\ABI\EVA\V4.0\CGI\Brunix-2016\file_utils.c', 00H
	ORG $+3
$SG70553 DB	'file_write_tabrc', 00H
	ORG $+3
$SG70555 DB	'D:\Travail\ABI\EVA\V4.0\CGI\Brunix-2016\file_utils.c', 00H
	ORG $+3
$SG70556 DB	'file_write_tabrc', 00H
_DATA	ENDS
_TEXT	SEGMENT
_cntxt$ = 8
_data$ = 12
_file$ = 16
_buf$ = -4
_f$ = -8
_file_write_tabrc PROC NEAR

; 336  : ){

	push	ebp
	mov	ebp, esp
	sub	esp, 8

; 337  : 	DynBuffer *buf = NULL;

	mov	DWORD PTR _buf$[ebp], 0

; 338  : 	FILE *f = NULL;

	mov	DWORD PTR _f$[ebp], 0

; 339  : 
; 340  : 	if(!data) RETURN_OK;

	cmp	DWORD PTR _data$[ebp], 0
	jne	SHORT $L70544
	jmp	SHORT $eva_noerr$70545
$L70544:

; 341  : 
; 342  : 	/* Open export file */
; 343  : 	f = fopen(file, "w");

	push	OFFSET FLAT:$SG70546
	mov	eax, DWORD PTR _file$[ebp]
	push	eax
	call	_fopen
	add	esp, 8
	mov	DWORD PTR _f$[ebp], eax

; 344  : 	if(!f) RETURN_ERROR("Impossible d'écrire dans le fichier", NOP);

	cmp	DWORD PTR _f$[ebp], 0
	jne	SHORT $L70547
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29872], OFFSET FLAT:$SG70549
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 344		; 00000158H
	jmp	SHORT $eva_err$70550
$L70547:

; 345  : 
; 346  : 	if(!FILE_write_tabrc(cntxt, data, f)) STACK_ERROR;

	mov	eax, DWORD PTR _f$[ebp]
	push	eax
	mov	ecx, DWORD PTR _data$[ebp]
	push	ecx
	mov	edx, DWORD PTR _cntxt$[ebp]
	push	edx
	call	_FILE_write_tabrc
	add	esp, 12					; 0000000cH
	test	eax, eax
	jne	SHORT $eva_noerr$70545
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 346		; 0000015aH
	jmp	SHORT $eva_err$70550
$eva_noerr$70545:

; 347  : 
; 348  : 	RETURN_OK_CLEANUP;

	push	0
	push	OFFSET FLAT:$SG70552
	push	OFFSET FLAT:$SG70553
	mov	ecx, DWORD PTR _cntxt$[ebp]
	push	ecx
	call	_err_clear
	add	esp, 16					; 00000010H
$eva_err$70550:
	mov	edx, DWORD PTR _cntxt$[ebp]
	cmp	DWORD PTR [edx+29872], 0
	je	SHORT $L70554
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	ecx, DWORD PTR [eax+29900]
	push	ecx
	push	OFFSET FLAT:$SG70555
	push	OFFSET FLAT:$SG70556
	mov	edx, DWORD PTR _cntxt$[ebp]
	push	edx
	call	_err_add_context
	add	esp, 16					; 00000010H
$L70554:
	cmp	DWORD PTR _f$[ebp], 0
	je	SHORT $L70557
	mov	eax, DWORD PTR _f$[ebp]
	push	eax
	call	_fclose
	add	esp, 4
$L70557:
	mov	ecx, DWORD PTR _buf$[ebp]
	push	ecx
	call	_mem_free
	add	esp, 4
	mov	DWORD PTR _buf$[ebp], 0
	mov	edx, DWORD PTR _cntxt$[ebp]
	xor	eax, eax
	cmp	DWORD PTR [edx+29872], 0
	setne	al

; 349  : }

	mov	esp, ebp
	pop	ebp
	ret	0
_file_write_tabrc ENDP
_TEXT	ENDS
PUBLIC	_file_compatible_name
_DATA	SEGMENT
	ORG $+3
$SG70565 DB	0c3H, 0a0H, 0c3H, 0a1H, 0c3H, 0a2H, 0c3H, 0a3H, 0c3H, 0a4H
	DB	0c3H, 0a5H, 0c3H, 0a6H, 0c3H, 0a7H, 0c3H, 0a9H, 0c3H, 0a8H, 0c3H
	DB	0aaH, 0c3H, 0abH, 0c3H, 0acH, 0c3H, 0adH, 0c3H, 0aeH, 0c3H, 0afH
	DB	0c3H, 0b2H, 0c3H, 0b3H, 0c3H, 0b4H, 0c3H, 0b5H, 0c3H, 0b6H, 0c3H
	DB	0b9H, 0c3H, 0baH, 0c3H, 0bbH, 0c3H, 0bcH, 0c3H, 080H, 0c3H, 081H
	DB	0c3H, 082H, 0c3H, 083H, 0c3H, 084H, 0c3H, 085H, 0c3H, 086H, 0c3H
	DB	087H, 0c3H, 089H, 0c3H, 088H, 0c3H, 08aH, 0c3H, 08bH, 0c3H, 08cH
	DB	0c3H, 08dH, 0c3H, 08eH, 0c3H, 08fH, 0c3H, 092H, 0c3H, 093H, 0c3H
	DB	094H, 0c3H, 095H, 0c3H, 096H, 0c3H, 099H, 0c3H, 09aH, 0c3H, 09bH
	DB	0c3H, 09cH, 00H
	ORG $+3
$SG70567 DB	'aaaaaaeceeeeiiiiooooouuuuAAAAAAECEEEEIIIIOOOOOUUUU', 00H
_DATA	ENDS
_TEXT	SEGMENT
_name$ = 8
_i$ = -8
_j$ = -12
_a$ = -4
_n$ = -16
_u$70571 = -20
_c$70575 = -24
_file_compatible_name PROC NEAR

; 359  : ){

	push	ebp
	mov	ebp, esp
	sub	esp, 24					; 00000018H

; 360  : 	unsigned long i, j;
; 361  : 	char *a = LOCASE_ACCENT UPCASE_ACCENT;

	mov	DWORD PTR _a$[ebp], OFFSET FLAT:$SG70565

; 362  : 	char *n = LOCASE_NO_ACC UPCASE_NO_ACC;

	mov	DWORD PTR _n$[ebp], OFFSET FLAT:$SG70567

; 363  : 
; 364  : 	/* For each char in string */
; 365  : 	for(i = 0, j = 0; name[j]; j++)

	mov	DWORD PTR _i$[ebp], 0
	mov	DWORD PTR _j$[ebp], 0
	jmp	SHORT $L70568
$L70569:
	mov	eax, DWORD PTR _j$[ebp]
	add	eax, 1
	mov	DWORD PTR _j$[ebp], eax
$L70568:
	mov	ecx, DWORD PTR _name$[ebp]
	add	ecx, DWORD PTR _j$[ebp]
	movsx	edx, BYTE PTR [ecx]
	test	edx, edx
	je	$L70570

; 367  : 		char u = name[j];

	mov	eax, DWORD PTR _name$[ebp]
	add	eax, DWORD PTR _j$[ebp]
	mov	cl, BYTE PTR [eax]
	mov	BYTE PTR _u$70571[ebp], cl

; 368  : 		/* Check if char is alphanumeric */
; 369  : 		if((!(u >= 'a' && u <= 'z') || (u >= 'A' && u <= 'Z') || (u >= '0' && u <= '9') ))

	movsx	edx, BYTE PTR _u$70571[ebp]
	cmp	edx, 97					; 00000061H
	jl	SHORT $L70573
	movsx	eax, BYTE PTR _u$70571[ebp]
	cmp	eax, 122				; 0000007aH
	jg	SHORT $L70573
	movsx	ecx, BYTE PTR _u$70571[ebp]
	cmp	ecx, 65					; 00000041H
	jl	SHORT $L70574
	movsx	edx, BYTE PTR _u$70571[ebp]
	cmp	edx, 90					; 0000005aH
	jle	SHORT $L70573
$L70574:
	movsx	eax, BYTE PTR _u$70571[ebp]
	cmp	eax, 48					; 00000030H
	jl	SHORT $L70577
	movsx	ecx, BYTE PTR _u$70571[ebp]
	cmp	ecx, 57					; 00000039H
	jg	SHORT $L70577
$L70573:

; 371  : 			/* Search for accentuated char & replace whith non accentuated */
; 372  : 			char *c = strchr(a, u);

	movsx	edx, BYTE PTR _u$70571[ebp]
	push	edx
	mov	eax, DWORD PTR _a$[ebp]
	push	eax
	call	_strchr
	add	esp, 8
	mov	DWORD PTR _c$70575[ebp], eax

; 373  : 			if(c) u = n[c - a];

	cmp	DWORD PTR _c$70575[ebp], 0
	je	SHORT $L70576
	mov	ecx, DWORD PTR _c$70575[ebp]
	sub	ecx, DWORD PTR _a$[ebp]
	mov	edx, DWORD PTR _n$[ebp]
	mov	al, BYTE PTR [edx+ecx]
	mov	BYTE PTR _u$70571[ebp], al

; 374  : 			/* Replace non aplanumeric chars with dot */
; 375  : 			else u = '.';

	jmp	SHORT $L70577
$L70576:
	mov	BYTE PTR _u$70571[ebp], 46		; 0000002eH
$L70577:

; 377  : 		/* Ignore multiple dots or dot as first char */
; 378  : 		if(u == '.' && (!i || name[i - 1] == '.')) continue;

	movsx	ecx, BYTE PTR _u$70571[ebp]
	cmp	ecx, 46					; 0000002eH
	jne	SHORT $L70578
	cmp	DWORD PTR _i$[ebp], 0
	je	SHORT $L70579
	mov	edx, DWORD PTR _name$[ebp]
	add	edx, DWORD PTR _i$[ebp]
	movsx	eax, BYTE PTR [edx-1]
	cmp	eax, 46					; 0000002eH
	jne	SHORT $L70578
$L70579:
	jmp	$L70569
$L70578:

; 379  : 		name[i] = u;

	mov	ecx, DWORD PTR _name$[ebp]
	add	ecx, DWORD PTR _i$[ebp]
	mov	dl, BYTE PTR _u$70571[ebp]
	mov	BYTE PTR [ecx], dl

; 380  : 		i++;

	mov	eax, DWORD PTR _i$[ebp]
	add	eax, 1
	mov	DWORD PTR _i$[ebp], eax

; 381  : 	}

	jmp	$L70569
$L70570:

; 382  : 	name[i] = 0;

	mov	ecx, DWORD PTR _name$[ebp]
	add	ecx, DWORD PTR _i$[ebp]
	mov	BYTE PTR [ecx], 0

; 383  : 
; 384  : 	return i;

	mov	eax, DWORD PTR _i$[ebp]

; 385  : }

	mov	esp, ebp
	pop	ebp
	ret	0
_file_compatible_name ENDP
_TEXT	ENDS
PUBLIC	_setcase
EXTRN	_tolower:NEAR
EXTRN	_toupper:NEAR
_DATA	SEGMENT
	ORG $+1
$SG70589 DB	0c3H, 0a0H, 0c3H, 0a1H, 0c3H, 0a2H, 0c3H, 0a3H, 0c3H, 0a4H
	DB	0c3H, 0a5H, 0c3H, 0a6H, 0c3H, 0a7H, 0c3H, 0a9H, 0c3H, 0a8H, 0c3H
	DB	0aaH, 0c3H, 0abH, 0c3H, 0acH, 0c3H, 0adH, 0c3H, 0aeH, 0c3H, 0afH
	DB	0c3H, 0b2H, 0c3H, 0b3H, 0c3H, 0b4H, 0c3H, 0b5H, 0c3H, 0b6H, 0c3H
	DB	0b9H, 0c3H, 0baH, 0c3H, 0bbH, 0c3H, 0bcH, 0c3H, 080H, 0c3H, 081H
	DB	0c3H, 082H, 0c3H, 083H, 0c3H, 084H, 0c3H, 085H, 0c3H, 086H, 0c3H
	DB	087H, 0c3H, 089H, 0c3H, 088H, 0c3H, 08aH, 0c3H, 08bH, 0c3H, 08cH
	DB	0c3H, 08dH, 0c3H, 08eH, 0c3H, 08fH, 0c3H, 092H, 0c3H, 093H, 0c3H
	DB	094H, 0c3H, 095H, 0c3H, 096H, 0c3H, 099H, 0c3H, 09aH, 0c3H, 09bH
	DB	0c3H, 09cH, 00H
	ORG $+3
$SG70590 DB	0c3H, 0a0H, 0c3H, 0a1H, 0c3H, 0a2H, 0c3H, 0a3H, 0c3H, 0a4H
	DB	0c3H, 0a5H, 0c3H, 0a6H, 0c3H, 0a7H, 0c3H, 0a9H, 0c3H, 0a8H, 0c3H
	DB	0aaH, 0c3H, 0abH, 0c3H, 0acH, 0c3H, 0adH, 0c3H, 0aeH, 0c3H, 0afH
	DB	0c3H, 0b2H, 0c3H, 0b3H, 0c3H, 0b4H, 0c3H, 0b5H, 0c3H, 0b6H, 0c3H
	DB	0b9H, 0c3H, 0baH, 0c3H, 0bbH, 0c3H, 0bcH, 00H
	ORG $+1
$SG70591 DB	0c3H, 080H, 0c3H, 081H, 0c3H, 082H, 0c3H, 083H, 0c3H, 084H
	DB	0c3H, 085H, 0c3H, 086H, 0c3H, 087H, 0c3H, 089H, 0c3H, 088H, 0c3H
	DB	08aH, 0c3H, 08bH, 0c3H, 08cH, 0c3H, 08dH, 0c3H, 08eH, 0c3H, 08fH
	DB	0c3H, 092H, 0c3H, 093H, 0c3H, 094H, 0c3H, 095H, 0c3H, 096H, 0c3H
	DB	099H, 0c3H, 09aH, 0c3H, 09bH, 0c3H, 09cH, 00H
	ORG $+1
$SG70593 DB	'aaaaaaeceeeeiiiiooooouuuuAAAAAAECEEEEIIIIOOOOOUUUU', 00H
	ORG $+1
$SG70594 DB	'AAAAAAECEEEEIIIIOOOOOUUUU', 00H
	ORG $+2
$SG70595 DB	0c3H, 080H, 0c3H, 081H, 0c3H, 082H, 0c3H, 083H, 0c3H, 084H
	DB	0c3H, 085H, 0c3H, 086H, 0c3H, 087H, 0c3H, 089H, 0c3H, 088H, 0c3H
	DB	08aH, 0c3H, 08bH, 0c3H, 08cH, 0c3H, 08dH, 0c3H, 08eH, 0c3H, 08fH
	DB	0c3H, 092H, 0c3H, 093H, 0c3H, 094H, 0c3H, 095H, 0c3H, 096H, 0c3H
	DB	099H, 0c3H, 09aH, 0c3H, 09bH, 0c3H, 09cH, 00H
	ORG $+1
$SG70596 DB	'aaaaaaeceeeeiiiiooooouuuu', 00H
	ORG $+2
$SG70597 DB	0c3H, 0a0H, 0c3H, 0a1H, 0c3H, 0a2H, 0c3H, 0a3H, 0c3H, 0a4H
	DB	0c3H, 0a5H, 0c3H, 0a6H, 0c3H, 0a7H, 0c3H, 0a9H, 0c3H, 0a8H, 0c3H
	DB	0aaH, 0c3H, 0abH, 0c3H, 0acH, 0c3H, 0adH, 0c3H, 0aeH, 0c3H, 0afH
	DB	0c3H, 0b2H, 0c3H, 0b3H, 0c3H, 0b4H, 0c3H, 0b5H, 0c3H, 0b6H, 0c3H
	DB	0b9H, 0c3H, 0baH, 0c3H, 0bbH, 0c3H, 0bcH, 00H
_DATA	ENDS
_TEXT	SEGMENT
_mode$ = 8
_txt$ = 12
_len$ = 16
_i$ = -8
_src$ = -12
_dst$ = -4
_t$70604 = -20
_c$70605 = -16
_setcase PROC NEAR

; 398  : ){

	push	ebp
	mov	ebp, esp
	sub	esp, 48					; 00000030H

; 399  : 	unsigned long i;
; 400  : 	char *src = mode & 4 ? LOCASE_ACCENT UPCASE_ACCENT :
; 401  : 				mode & 1 ? LOCASE_ACCENT : UPCASE_ACCENT;

	mov	eax, DWORD PTR _mode$[ebp]
	and	eax, 4
	test	eax, eax
	je	SHORT $L70669
	mov	DWORD PTR -24+[ebp], OFFSET FLAT:$SG70589
	jmp	SHORT $L70670
$L70669:
	mov	ecx, DWORD PTR _mode$[ebp]
	and	ecx, 1
	test	ecx, ecx
	je	SHORT $L70667
	mov	DWORD PTR -28+[ebp], OFFSET FLAT:$SG70590
	jmp	SHORT $L70668
$L70667:
	mov	DWORD PTR -28+[ebp], OFFSET FLAT:$SG70591
$L70668:
	mov	edx, DWORD PTR -28+[ebp]
	mov	DWORD PTR -24+[ebp], edx
$L70670:
	mov	eax, DWORD PTR -24+[ebp]
	mov	DWORD PTR _src$[ebp], eax

; 402  : 	char *dst = mode & 4 ? LOCASE_NO_ACC UPCASE_NO_ACC :
; 403  : 				mode & 1 ?
; 404  : 				(mode & 2 ? UPCASE_NO_ACC : UPCASE_ACCENT) :
; 405  : 				(mode & 2 ? LOCASE_NO_ACC : LOCASE_ACCENT);

	mov	ecx, DWORD PTR _mode$[ebp]
	and	ecx, 4
	test	ecx, ecx
	je	SHORT $L70677
	mov	DWORD PTR -32+[ebp], OFFSET FLAT:$SG70593
	jmp	SHORT $L70678
$L70677:
	mov	edx, DWORD PTR _mode$[ebp]
	and	edx, 1
	test	edx, edx
	je	SHORT $L70675
	mov	eax, DWORD PTR _mode$[ebp]
	and	eax, 2
	test	eax, eax
	je	SHORT $L70671
	mov	DWORD PTR -36+[ebp], OFFSET FLAT:$SG70594
	jmp	SHORT $L70672
$L70671:
	mov	DWORD PTR -36+[ebp], OFFSET FLAT:$SG70595
$L70672:
	mov	ecx, DWORD PTR -36+[ebp]
	mov	DWORD PTR -40+[ebp], ecx
	jmp	SHORT $L70676
$L70675:
	mov	edx, DWORD PTR _mode$[ebp]
	and	edx, 2
	test	edx, edx
	je	SHORT $L70673
	mov	DWORD PTR -44+[ebp], OFFSET FLAT:$SG70596
	jmp	SHORT $L70674
$L70673:
	mov	DWORD PTR -44+[ebp], OFFSET FLAT:$SG70597
$L70674:
	mov	eax, DWORD PTR -44+[ebp]
	mov	DWORD PTR -40+[ebp], eax
$L70676:
	mov	ecx, DWORD PTR -40+[ebp]
	mov	DWORD PTR -32+[ebp], ecx
$L70678:
	mov	edx, DWORD PTR -32+[ebp]
	mov	DWORD PTR _dst$[ebp], edx

; 406  : 
; 407  : 	/* Check params */
; 408  : 	if(!txt || !*txt) return txt;

	cmp	DWORD PTR _txt$[ebp], 0
	je	SHORT $L70599
	mov	eax, DWORD PTR _txt$[ebp]
	movsx	ecx, BYTE PTR [eax]
	test	ecx, ecx
	jne	SHORT $L70598
$L70599:
	mov	eax, DWORD PTR _txt$[ebp]
	jmp	$L70586
$L70598:

; 409  : 
; 410  : 	/* No size limit if len is 0 */
; 411  : 	if(!len) len = ~0UL;

	cmp	DWORD PTR _len$[ebp], 0
	jne	SHORT $L70600
	mov	DWORD PTR _len$[ebp], -1
$L70600:

; 412  : 
; 413  : 	/* Convert each char */
; 414  : 	for(i = 0; txt[i] && i < len; i++)

	mov	DWORD PTR _i$[ebp], 0
	jmp	SHORT $L70601
$L70602:
	mov	edx, DWORD PTR _i$[ebp]
	add	edx, 1
	mov	DWORD PTR _i$[ebp], edx
$L70601:
	mov	eax, DWORD PTR _txt$[ebp]
	add	eax, DWORD PTR _i$[ebp]
	movsx	ecx, BYTE PTR [eax]
	test	ecx, ecx
	je	$L70603
	mov	edx, DWORD PTR _i$[ebp]
	cmp	edx, DWORD PTR _len$[ebp]
	jae	$L70603

; 416  : 		char *t = txt + i;

	mov	eax, DWORD PTR _txt$[ebp]
	add	eax, DWORD PTR _i$[ebp]
	mov	DWORD PTR _t$70604[ebp], eax

; 417  : 		char *c = strchr(src, *t);

	mov	ecx, DWORD PTR _t$70604[ebp]
	movsx	edx, BYTE PTR [ecx]
	push	edx
	mov	eax, DWORD PTR _src$[ebp]
	push	eax
	call	_strchr
	add	esp, 8
	mov	DWORD PTR _c$70605[ebp], eax

; 418  : 		if(c)

	cmp	DWORD PTR _c$70605[ebp], 0
	je	SHORT $L70606

; 419  : 			*t = dst[c - src];

	mov	ecx, DWORD PTR _c$70605[ebp]
	sub	ecx, DWORD PTR _src$[ebp]
	mov	edx, DWORD PTR _t$70604[ebp]
	mov	eax, DWORD PTR _dst$[ebp]
	mov	cl, BYTE PTR [eax+ecx]
	mov	BYTE PTR [edx], cl

; 420  : 		else if(!(mode & 4) && *t >= 'A' && *t <= 'z')

	jmp	SHORT $L70608
$L70606:
	mov	edx, DWORD PTR _mode$[ebp]
	and	edx, 4
	test	edx, edx
	jne	SHORT $L70608
	mov	eax, DWORD PTR _t$70604[ebp]
	movsx	ecx, BYTE PTR [eax]
	cmp	ecx, 65					; 00000041H
	jl	SHORT $L70608
	mov	edx, DWORD PTR _t$70604[ebp]
	movsx	eax, BYTE PTR [edx]
	cmp	eax, 122				; 0000007aH
	jg	SHORT $L70608

; 421  : 			*t = (char)((mode & 1) ? toupper(*t) : tolower(*t));

	mov	ecx, DWORD PTR _mode$[ebp]
	and	ecx, 1
	test	ecx, ecx
	je	SHORT $L70679
	mov	edx, DWORD PTR _t$70604[ebp]
	movsx	eax, BYTE PTR [edx]
	push	eax
	call	_toupper
	add	esp, 4
	mov	DWORD PTR -48+[ebp], eax
	jmp	SHORT $L70680
$L70679:
	mov	ecx, DWORD PTR _t$70604[ebp]
	movsx	edx, BYTE PTR [ecx]
	push	edx
	call	_tolower
	add	esp, 4
	mov	DWORD PTR -48+[ebp], eax
$L70680:
	mov	eax, DWORD PTR _t$70604[ebp]
	mov	cl, BYTE PTR -48+[ebp]
	mov	BYTE PTR [eax], cl
$L70608:

; 422  : 	}

	jmp	$L70602
$L70603:

; 423  : 
; 424  : 	return txt;

	mov	eax, DWORD PTR _txt$[ebp]
$L70586:

; 425  : }

	mov	esp, ebp
	pop	ebp
	ret	0
_setcase ENDP
_TEXT	ENDS
PUBLIC	_get_image_file
EXTRN	_mystrdup:NEAR
EXTRN	_sprintf:NEAR
EXTRN	_get_image_size:NEAR
EXTRN	_dyntab_cell:NEAR
EXTRN	_strlen:NEAR
EXTRN	_strpbrk:NEAR
_DATA	SEGMENT
	ORG $+1
$SG70627 DB	'''"', 00H
	ORG $+1
$SG70630 DB	'/.', 00H
	ORG $+1
$SG70644 DB	'../img/%s/%s', 00H
	ORG $+3
$SG70646 DB	'../img/%s', 00H
_DATA	ENDS
_TEXT	SEGMENT
_cntxt$ = 8
_img$ = 12
_width$ = 16
_height$ = 20
_fs$ = -36
_sz$ = -52
_sz1$ = -48
_i$ = -44
_path$ = -40
_b_found$ = -56
_len$70637 = -60
_get_image_file PROC NEAR

; 436  : ){

	push	ebp
	mov	ebp, esp
	sub	esp, 64					; 00000040H
	push	edi

; 437  : 	struct stat fs = {0};

	mov	DWORD PTR _fs$[ebp], 0
	mov	ecx, 8
	xor	eax, eax
	lea	edi, DWORD PTR _fs$[ebp+4]
	rep stosd

; 438  : 	size_t sz = (img && *img) ? strlen(img) : 0, sz1 = 0;

	cmp	DWORD PTR _img$[ebp], 0
	je	SHORT $L70682
	mov	eax, DWORD PTR _img$[ebp]
	movsx	ecx, BYTE PTR [eax]
	test	ecx, ecx
	je	SHORT $L70682
	mov	edx, DWORD PTR _img$[ebp]
	push	edx
	call	_strlen
	add	esp, 4
	mov	DWORD PTR -64+[ebp], eax
	jmp	SHORT $L70683
$L70682:
	mov	DWORD PTR -64+[ebp], 0
$L70683:
	mov	eax, DWORD PTR -64+[ebp]
	mov	DWORD PTR _sz$[ebp], eax
	mov	DWORD PTR _sz1$[ebp], 0

; 439  : 	unsigned long i;
; 440  : 	char *path;
; 441  : 	int b_found = 0;

	mov	DWORD PTR _b_found$[ebp], 0

; 442  : 
; 443  : 	/* Initialize size & check params (no quotes in filenames) */
; 444  : 	if(!sz || strpbrk(img, "'\"")) return NULL;

	cmp	DWORD PTR _sz$[ebp], 0
	je	SHORT $L70626
	push	OFFSET FLAT:$SG70627
	mov	ecx, DWORD PTR _img$[ebp]
	push	ecx
	call	_strpbrk
	add	esp, 8
	test	eax, eax
	je	SHORT $L70625
$L70626:
	xor	eax, eax
	jmp	$L70618
$L70625:

; 445  : 	chdir(cntxt->path);

	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	eax, DWORD PTR [edx+29728]
	push	eax
	call	_chdir
	add	esp, 4

; 446  : 
; 447  : 	/* If path is given */
; 448  : 	if(strchr("/.", *img))

	mov	ecx, DWORD PTR _img$[ebp]
	movsx	edx, BYTE PTR [ecx]
	push	edx
	push	OFFSET FLAT:$SG70630
	call	_strchr
	add	esp, 8
	test	eax, eax
	je	SHORT $L70629

; 450  : 		/* Copy path & check existence */
; 451  : 		path = mystrdup(img, strlen(img));

	mov	eax, DWORD PTR _img$[ebp]
	push	eax
	call	_strlen
	add	esp, 4
	push	eax
	mov	ecx, DWORD PTR _img$[ebp]
	push	ecx
	call	_mystrdup
	add	esp, 8
	mov	DWORD PTR _path$[ebp], eax

; 452  : 		if(!path) return NULL;

	cmp	DWORD PTR _path$[ebp], 0
	jne	SHORT $L70631
	xor	eax, eax
	jmp	$L70618
$L70631:

; 453  : 		b_found = !stat(path, &fs);

	lea	edx, DWORD PTR _fs$[ebp]
	push	edx
	mov	eax, DWORD PTR _path$[ebp]
	push	eax
	call	_stat
	add	esp, 8
	neg	eax
	sbb	eax, eax
	inc	eax
	mov	DWORD PTR _b_found$[ebp], eax

; 455  : 	else

	jmp	$L70645
$L70629:

; 457  : 		/* Path not given : search in prefered img subfolders */
; 458  : 		for(i = 0; i < cntxt->imgpath.nbrows; i++)

	mov	DWORD PTR _i$[ebp], 0
	jmp	SHORT $L70634
$L70635:
	mov	ecx, DWORD PTR _i$[ebp]
	add	ecx, 1
	mov	DWORD PTR _i$[ebp], ecx
$L70634:
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	eax, DWORD PTR _i$[ebp]
	cmp	eax, DWORD PTR [edx+29568]
	jae	SHORT $L70636

; 460  : 			size_t len = dyntab_cell(&cntxt->imgpath, i, 0)->len;

	push	0
	mov	ecx, DWORD PTR _i$[ebp]
	push	ecx
	mov	edx, DWORD PTR _cntxt$[ebp]
	add	edx, 29568				; 00007380H
	push	edx
	call	_dyntab_cell
	add	esp, 12					; 0000000cH
	mov	eax, DWORD PTR [eax+4]
	mov	DWORD PTR _len$70637[ebp], eax

; 461  : 			if(len > sz1) sz1 = len;

	mov	ecx, DWORD PTR _len$70637[ebp]
	cmp	ecx, DWORD PTR _sz1$[ebp]
	jbe	SHORT $L70638
	mov	edx, DWORD PTR _len$70637[ebp]
	mov	DWORD PTR _sz1$[ebp], edx
$L70638:

; 462  : 		}

	jmp	SHORT $L70635
$L70636:

; 463  : 		path = mem_alloc(sz1 + sz + 32);

	mov	eax, DWORD PTR _sz$[ebp]
	mov	ecx, DWORD PTR _sz1$[ebp]
	lea	edx, DWORD PTR [ecx+eax+32]
	push	edx
	call	_mem_alloc
	add	esp, 4
	mov	DWORD PTR _path$[ebp], eax

; 464  : 		if(!path) return NULL;

	cmp	DWORD PTR _path$[ebp], 0
	jne	SHORT $L70639
	xor	eax, eax
	jmp	$L70618
$L70639:

; 465  : 
; 466  : 		/* Look for image file in cntxt->imgpath folders */
; 467  : 		for(i = 0; i < cntxt->imgpath.nbrows && !b_found; i++)

	mov	DWORD PTR _i$[ebp], 0
	jmp	SHORT $L70641
$L70642:
	mov	eax, DWORD PTR _i$[ebp]
	add	eax, 1
	mov	DWORD PTR _i$[ebp], eax
$L70641:
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	edx, DWORD PTR _i$[ebp]
	cmp	edx, DWORD PTR [ecx+29568]
	jae	SHORT $L70643
	cmp	DWORD PTR _b_found$[ebp], 0
	jne	SHORT $L70643

; 469  : 			sprintf(path, "../img/%s/%s", dyntab_val(&cntxt->imgpath, i, 0), img);

	mov	eax, DWORD PTR _img$[ebp]
	push	eax
	push	0
	mov	ecx, DWORD PTR _i$[ebp]
	push	ecx
	mov	edx, DWORD PTR _cntxt$[ebp]
	add	edx, 29568				; 00007380H
	push	edx
	call	_dyntab_val
	add	esp, 12					; 0000000cH
	push	eax
	push	OFFSET FLAT:$SG70644
	mov	eax, DWORD PTR _path$[ebp]
	push	eax
	call	_sprintf
	add	esp, 16					; 00000010H

; 470  : 			b_found = !stat(path, &fs);

	lea	ecx, DWORD PTR _fs$[ebp]
	push	ecx
	mov	edx, DWORD PTR _path$[ebp]
	push	edx
	call	_stat
	add	esp, 8
	neg	eax
	sbb	eax, eax
	inc	eax
	mov	DWORD PTR _b_found$[ebp], eax

; 471  : 		}

	jmp	SHORT $L70642
$L70643:

; 472  : 		if(!b_found)

	cmp	DWORD PTR _b_found$[ebp], 0
	jne	SHORT $L70645

; 474  : 			/* Look for image file in root path */
; 475  : 			sprintf(path, "../img/%s", img);

	mov	eax, DWORD PTR _img$[ebp]
	push	eax
	push	OFFSET FLAT:$SG70646
	mov	ecx, DWORD PTR _path$[ebp]
	push	ecx
	call	_sprintf
	add	esp, 12					; 0000000cH

; 476  : 			b_found = !stat(path, &fs);

	lea	edx, DWORD PTR _fs$[ebp]
	push	edx
	mov	eax, DWORD PTR _path$[ebp]
	push	eax
	call	_stat
	add	esp, 8
	neg	eax
	sbb	eax, eax
	inc	eax
	mov	DWORD PTR _b_found$[ebp], eax
$L70645:

; 479  : 
; 480  : 	/* Get image size */
; 481  : 	if(b_found && width && height) get_image_size(path, width, height);

	cmp	DWORD PTR _b_found$[ebp], 0
	je	SHORT $L70647
	cmp	DWORD PTR _width$[ebp], 0
	je	SHORT $L70647
	cmp	DWORD PTR _height$[ebp], 0
	je	SHORT $L70647
	mov	ecx, DWORD PTR _height$[ebp]
	push	ecx
	mov	edx, DWORD PTR _width$[ebp]
	push	edx
	mov	eax, DWORD PTR _path$[ebp]
	push	eax
	call	_get_image_size
	add	esp, 12					; 0000000cH
$L70647:

; 482  : 	return path;

	mov	eax, DWORD PTR _path$[ebp]
$L70618:

; 483  : }

	pop	edi
	mov	esp, ebp
	pop	ebp
	ret	0
_get_image_file ENDP
_TEXT	ENDS
END
