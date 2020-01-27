	TITLE	D:\Travail\ABI\EVA\V4.0\CGI\Brunix-2016\value_format.c
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
PUBLIC	_put_value_fmt
EXTRN	_datetxt_to_age:NEAR
EXTRN	_datetxt_invalid:NEAR
EXTRN	_datetxt_to_format:NEAR
EXTRN	_number_to_format:NEAR
EXTRN	_sprintf:NEAR
EXTRN	_dynbuf_add:NEAR
EXTRN	_dynbuf_add_int:NEAR
EXTRN	_strcmp:NEAR
EXTRN	_strchr:NEAR
EXTRN	_err_add_context:NEAR
EXTRN	_err_clear:NEAR
EXTRN	_strncmp:NEAR
EXTRN	_stricmp:NEAR
_BSS	SEGMENT
$SG70219 DB	01H DUP (?)
	ALIGN	4

$SG70224 DB	01H DUP (?)
_BSS	ENDS
_DATA	SEGMENT
$SG70221 DB	'_EVA_AGE', 00H
	ORG $+3
$SG70229 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70236 DB	' an', 00H
$SG70238 DB	' mois', 00H
	ORG $+2
$SG70240 DB	' jour', 00H
	ORG $+2
$SG70242 DB	' heure', 00H
	ORG $+1
$SG70244 DB	' min', 00H
	ORG $+3
$SG70246 DB	' sec', 00H
	ORG $+3
$SG70248 DB	'?', 00H
	ORG $+2
$SG70252 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70256 DB	's', 00H
	ORG $+2
$SG70258 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70261 DB	'_EVA_HOUR', 00H
	ORG $+2
$SG70267 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70270 DB	':', 00H
	ORG $+2
$SG70272 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70276 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70281 DB	':', 00H
	ORG $+2
$SG70283 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70287 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70290 DB	'_EVA_FILESIZE', 00H
	ORG $+2
$SG70293 DB	'_EVA_FILESIZE', 00H
	ORG $+2
$SG70295 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70298 DB	'_EVA_MONEY', 00H
	ORG $+1
$SG70301 DB	'_EVA_Money', 00H
	ORG $+1
$SG70303 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70306 DB	'_EVA_NUMBER', 00H
$SG70310 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70313 DB	'_EVA_TELEPHONE', 00H
	ORG $+1
$SG70317 DB	'%.2s %.2s %.2s %.2s %.2s', 00H
	ORG $+3
$SG70321 DB	'%.3s', 00H
	ORG $+3
$SG70326 DB	' %.3s', 00H
	ORG $+2
$SG70330 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70333 DB	'_EVA_', 00H
	ORG $+2
$SG70338 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70343 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70344 DB	'D:\Travail\ABI\EVA\V4.0\CGI\Brunix-2016\value_format.c', 00H
	ORG $+1
$SG70345 DB	'put_value_fmt', 00H
	ORG $+2
$SG70347 DB	'D:\Travail\ABI\EVA\V4.0\CGI\Brunix-2016\value_format.c', 00H
	ORG $+1
$SG70348 DB	'put_value_fmt', 00H
_DATA	ENDS
_TEXT	SEGMENT
_cntxt$ = 8
_buf$ = 12
_txt$ = 16
_len$ = 20
_fmt$ = 24
_ageunit$70222 = -12
_agelbl$70223 = -4
_age$70225 = -8
_z$70263 = -16
_tel$70314 = -48
_l$70320 = -56
_cnt$70322 = -52
_date$70334 = -88
_put_value_fmt PROC NEAR

; 28   : ){

	push	ebp
	mov	ebp, esp
	sub	esp, 92					; 0000005cH

; 29   : 	/* Check params */
; 30   : 	if(!txt || !*txt || !len || !buf) RETURN_OK;

	cmp	DWORD PTR _txt$[ebp], 0
	je	SHORT $L70216
	mov	eax, DWORD PTR _txt$[ebp]
	movsx	ecx, BYTE PTR [eax]
	test	ecx, ecx
	je	SHORT $L70216
	cmp	DWORD PTR _len$[ebp], 0
	je	SHORT $L70216
	cmp	DWORD PTR _buf$[ebp], 0
	jne	SHORT $L70215
$L70216:
	jmp	$eva_noerr$70217
$L70215:

; 31   : 	if(!fmt) fmt = "";

	cmp	DWORD PTR _fmt$[ebp], 0
	jne	SHORT $L70218
	mov	DWORD PTR _fmt$[ebp], OFFSET FLAT:$SG70219
$L70218:

; 32   : 
; 33   : 	/* Handle value format */
; 34   : 	if(!strcmp(fmt, "_EVA_AGE"))

	push	OFFSET FLAT:$SG70221
	mov	edx, DWORD PTR _fmt$[ebp]
	push	edx
	call	_strcmp
	add	esp, 8
	test	eax, eax
	jne	$L70220

; 36   : 		/* Age formats */
; 37   : 		char ageunit = 0;

	mov	BYTE PTR _ageunit$70222[ebp], 0

; 38   : 		char *agelbl = "";

	mov	DWORD PTR _agelbl$70223[ebp], OFFSET FLAT:$SG70224

; 39   : 		int age = datetxt_to_age(txt, NULL, &ageunit);

	lea	eax, DWORD PTR _ageunit$70222[ebp]
	push	eax
	push	0
	mov	ecx, DWORD PTR _txt$[ebp]
	push	ecx
	call	_datetxt_to_age
	add	esp, 12					; 0000000cH
	mov	DWORD PTR _age$70225[ebp], eax

; 40   : 		DYNBUF_ADD_INT(buf, age);

	mov	edx, DWORD PTR _age$70225[ebp]
	push	edx
	mov	eax, DWORD PTR _buf$[ebp]
	push	eax
	call	_dynbuf_add_int
	add	esp, 8
	test	eax, eax
	je	SHORT $L70227
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29872], OFFSET FLAT:$SG70229
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 40		; 00000028H
	jmp	$eva_err$70230
$L70227:

; 41   : 		switch(ageunit)
; 42   : 		{

	movsx	eax, BYTE PTR _ageunit$70222[ebp]
	mov	DWORD PTR -92+[ebp], eax
	mov	ecx, DWORD PTR -92+[ebp]
	sub	ecx, 68					; 00000044H
	mov	DWORD PTR -92+[ebp], ecx
	cmp	DWORD PTR -92+[ebp], 47			; 0000002fH
	ja	SHORT $L70247
	mov	eax, DWORD PTR -92+[ebp]
	xor	edx, edx
	mov	dl, BYTE PTR $L70353[eax]
	jmp	DWORD PTR $L70354[edx*4]
$L70235:

; 43   : 		case 'Y': agelbl = " an"; break;

	mov	DWORD PTR _agelbl$70223[ebp], OFFSET FLAT:$SG70236
	jmp	SHORT $L70232
$L70237:

; 44   : 		case 'M': agelbl = " mois"; age = 0; break;

	mov	DWORD PTR _agelbl$70223[ebp], OFFSET FLAT:$SG70238
	mov	DWORD PTR _age$70225[ebp], 0
	jmp	SHORT $L70232
$L70239:

; 45   : 		case 'D': agelbl = " jour"; break;

	mov	DWORD PTR _agelbl$70223[ebp], OFFSET FLAT:$SG70240
	jmp	SHORT $L70232
$L70241:

; 46   : 		case 'h': agelbl = " heure"; break;

	mov	DWORD PTR _agelbl$70223[ebp], OFFSET FLAT:$SG70242
	jmp	SHORT $L70232
$L70243:

; 47   : 		case 'm': agelbl = " min"; break;

	mov	DWORD PTR _agelbl$70223[ebp], OFFSET FLAT:$SG70244
	jmp	SHORT $L70232
$L70245:

; 48   : 		case 's': agelbl = " sec"; break;

	mov	DWORD PTR _agelbl$70223[ebp], OFFSET FLAT:$SG70246
	jmp	SHORT $L70232
$L70247:

; 49   : 		default: agelbl = "?"; age = 0;

	mov	DWORD PTR _agelbl$70223[ebp], OFFSET FLAT:$SG70248
	mov	DWORD PTR _age$70225[ebp], 0
$L70232:

; 51   : 		DYNBUF_ADD(buf, agelbl, 0, NO_CONV);

	push	0
	push	0
	push	0
	mov	ecx, DWORD PTR _agelbl$70223[ebp]
	push	ecx
	mov	edx, DWORD PTR _buf$[ebp]
	push	edx
	call	_dynbuf_add
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L70250
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29872], OFFSET FLAT:$SG70252
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 51		; 00000033H
	jmp	$eva_err$70230
$L70250:

; 52   : 		if(age > 1) DYNBUF_ADD_STR(buf, "s");

	cmp	DWORD PTR _age$70225[ebp], 1
	jle	SHORT $L70255
	push	0
	push	0
	push	1
	push	OFFSET FLAT:$SG70256
	mov	edx, DWORD PTR _buf$[ebp]
	push	edx
	call	_dynbuf_add
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L70255
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29872], OFFSET FLAT:$SG70258
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 52		; 00000034H
	jmp	$eva_err$70230
$L70255:

; 54   : 	else if(!strcmp(fmt, "_EVA_HOUR") && (len == 4 || len == 6 || len == 12 || len == 14))

	jmp	$L70341
$L70220:
	push	OFFSET FLAT:$SG70261
	mov	edx, DWORD PTR _fmt$[ebp]
	push	edx
	call	_strcmp
	add	esp, 8
	test	eax, eax
	jne	$L70260
	cmp	DWORD PTR _len$[ebp], 4
	je	SHORT $L70262
	cmp	DWORD PTR _len$[ebp], 6
	je	SHORT $L70262
	cmp	DWORD PTR _len$[ebp], 12		; 0000000cH
	je	SHORT $L70262
	cmp	DWORD PTR _len$[ebp], 14		; 0000000eH
	jne	$L70260
$L70262:

; 56   : 		/* Hour */
; 57   : 		unsigned long z = len >= 12 ? 8 : 0;

	cmp	DWORD PTR _len$[ebp], 12		; 0000000cH
	sbb	eax, eax
	and	al, -8					; fffffff8H
	add	eax, 8
	mov	DWORD PTR _z$70263[ebp], eax

; 58   : 		DYNBUF_ADD(buf, txt + z, 2, NO_CONV);

	push	0
	push	0
	push	2
	mov	ecx, DWORD PTR _txt$[ebp]
	add	ecx, DWORD PTR _z$70263[ebp]
	push	ecx
	mov	edx, DWORD PTR _buf$[ebp]
	push	edx
	call	_dynbuf_add
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L70265
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29872], OFFSET FLAT:$SG70267
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 58		; 0000003aH
	jmp	$eva_err$70230
$L70265:

; 59   : 		DYNBUF_ADD_STR(buf, ":");

	push	0
	push	0
	push	1
	push	OFFSET FLAT:$SG70270
	mov	edx, DWORD PTR _buf$[ebp]
	push	edx
	call	_dynbuf_add
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L70269
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29872], OFFSET FLAT:$SG70272
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 59		; 0000003bH
	jmp	$eva_err$70230
$L70269:

; 60   : 		DYNBUF_ADD(buf, txt + z + 2, 2, NO_CONV);

	push	0
	push	0
	push	2
	mov	edx, DWORD PTR _z$70263[ebp]
	mov	eax, DWORD PTR _txt$[ebp]
	lea	ecx, DWORD PTR [eax+edx+2]
	push	ecx
	mov	edx, DWORD PTR _buf$[ebp]
	push	edx
	call	_dynbuf_add
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L70274
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29872], OFFSET FLAT:$SG70276
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 60		; 0000003cH
	jmp	$eva_err$70230
$L70274:

; 61   : 		if(len == 6 || len == 14)

	cmp	DWORD PTR _len$[ebp], 6
	je	SHORT $L70278
	cmp	DWORD PTR _len$[ebp], 14		; 0000000eH
	jne	SHORT $L70285
$L70278:

; 63   : 			DYNBUF_ADD_STR(buf, ":");

	push	0
	push	0
	push	1
	push	OFFSET FLAT:$SG70281
	mov	edx, DWORD PTR _buf$[ebp]
	push	edx
	call	_dynbuf_add
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L70280
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29872], OFFSET FLAT:$SG70283
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 63		; 0000003fH
	jmp	$eva_err$70230
$L70280:

; 64   : 			DYNBUF_ADD(buf, txt + z + 4, 2, NO_CONV);

	push	0
	push	0
	push	2
	mov	edx, DWORD PTR _z$70263[ebp]
	mov	eax, DWORD PTR _txt$[ebp]
	lea	ecx, DWORD PTR [eax+edx+4]
	push	ecx
	mov	edx, DWORD PTR _buf$[ebp]
	push	edx
	call	_dynbuf_add
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L70285
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29872], OFFSET FLAT:$SG70287
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 64		; 00000040H
	jmp	$eva_err$70230
$L70285:

; 67   : 	else if(!strcmp(fmt, "_EVA_FILESIZE"))

	jmp	$L70341
$L70260:
	push	OFFSET FLAT:$SG70290
	mov	edx, DWORD PTR _fmt$[ebp]
	push	edx
	call	_strcmp
	add	esp, 8
	test	eax, eax
	jne	SHORT $L70289

; 69   : 		/* Human file size */
; 70   : 		DYNBUF_ADD(buf, number_to_format(txt, "_EVA_FILESIZE"), 0, NO_CONV);

	push	0
	push	0
	push	0
	push	OFFSET FLAT:$SG70293
	mov	eax, DWORD PTR _txt$[ebp]
	push	eax
	call	_number_to_format
	add	esp, 8
	push	eax
	mov	ecx, DWORD PTR _buf$[ebp]
	push	ecx
	call	_dynbuf_add
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L70292
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29872], OFFSET FLAT:$SG70295
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 70		; 00000046H
	jmp	$eva_err$70230
$L70292:

; 72   : 	else if(!STRCMPCASE(fmt, "_EVA_MONEY"))

	jmp	$L70341
$L70289:
	push	OFFSET FLAT:$SG70298
	mov	ecx, DWORD PTR _fmt$[ebp]
	push	ecx
	call	_stricmp
	add	esp, 8
	test	eax, eax
	jne	SHORT $L70297

; 74   : 		/* Money */
; 75   : 		DYNBUF_ADD(buf, number_to_format(txt, "_EVA_Money"), 0, NO_CONV);

	push	0
	push	0
	push	0
	push	OFFSET FLAT:$SG70301
	mov	edx, DWORD PTR _txt$[ebp]
	push	edx
	call	_number_to_format
	add	esp, 8
	push	eax
	mov	eax, DWORD PTR _buf$[ebp]
	push	eax
	call	_dynbuf_add
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L70300
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29872], OFFSET FLAT:$SG70303
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 75		; 0000004bH
	jmp	$eva_err$70230
$L70300:

; 77   : 	else if(!STRCMPCASE(fmt, "_EVA_NUMBER"))

	jmp	$L70341
$L70297:
	push	OFFSET FLAT:$SG70306
	mov	eax, DWORD PTR _fmt$[ebp]
	push	eax
	call	_stricmp
	add	esp, 8
	test	eax, eax
	jne	SHORT $L70305

; 79   : 		DYNBUF_ADD(buf, txt, len, NO_CONV);

	push	0
	push	0
	mov	ecx, DWORD PTR _len$[ebp]
	push	ecx
	mov	edx, DWORD PTR _txt$[ebp]
	push	edx
	mov	eax, DWORD PTR _buf$[ebp]
	push	eax
	call	_dynbuf_add
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L70308
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29872], OFFSET FLAT:$SG70310
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 79		; 0000004fH
	jmp	$eva_err$70230
$L70308:

; 81   : 	else if(!strcmp(fmt, "_EVA_TELEPHONE"))

	jmp	$L70341
$L70305:
	push	OFFSET FLAT:$SG70313
	mov	eax, DWORD PTR _fmt$[ebp]
	push	eax
	call	_strcmp
	add	esp, 8
	test	eax, eax
	jne	$L70312

; 83   : 		/* Telephone number */
; 84   : 		char tel[32];
; 85   : 		if(!strchr(txt, ' '))

	push	32					; 00000020H
	mov	ecx, DWORD PTR _txt$[ebp]
	push	ecx
	call	_strchr
	add	esp, 8
	test	eax, eax
	jne	$L70319

; 87   : 			if(*txt == '0' && len == 10)

	mov	edx, DWORD PTR _txt$[ebp]
	movsx	eax, BYTE PTR [edx]
	cmp	eax, 48					; 00000030H
	jne	SHORT $L70316
	cmp	DWORD PTR _len$[ebp], 10		; 0000000aH
	jne	SHORT $L70316

; 89   : 				/* French numbers format */
; 90   : 				len = sprintf(tel, "%.2s %.2s %.2s %.2s %.2s", txt, txt + 2, txt + 4, txt + 6, txt + 8);

	mov	ecx, DWORD PTR _txt$[ebp]
	add	ecx, 8
	push	ecx
	mov	edx, DWORD PTR _txt$[ebp]
	add	edx, 6
	push	edx
	mov	eax, DWORD PTR _txt$[ebp]
	add	eax, 4
	push	eax
	mov	ecx, DWORD PTR _txt$[ebp]
	add	ecx, 2
	push	ecx
	mov	edx, DWORD PTR _txt$[ebp]
	push	edx
	push	OFFSET FLAT:$SG70317
	lea	eax, DWORD PTR _tel$70314[ebp]
	push	eax
	call	_sprintf
	add	esp, 28					; 0000001cH
	mov	DWORD PTR _len$[ebp], eax

; 91   : 				txt = tel;

	lea	ecx, DWORD PTR _tel$70314[ebp]
	mov	DWORD PTR _txt$[ebp], ecx

; 93   : 			else if(*txt == '+' && len < 15 && len > 5)

	jmp	SHORT $L70319
$L70316:
	mov	edx, DWORD PTR _txt$[ebp]
	movsx	eax, BYTE PTR [edx]
	cmp	eax, 43					; 0000002bH
	jne	SHORT $L70319
	cmp	DWORD PTR _len$[ebp], 15		; 0000000fH
	jae	SHORT $L70319
	cmp	DWORD PTR _len$[ebp], 5
	jbe	SHORT $L70319

; 95   : 				/* International numbers format */
; 96   : 				size_t l = sprintf(tel, "%.3s", txt);

	mov	ecx, DWORD PTR _txt$[ebp]
	push	ecx
	push	OFFSET FLAT:$SG70321
	lea	edx, DWORD PTR _tel$70314[ebp]
	push	edx
	call	_sprintf
	add	esp, 12					; 0000000cH
	mov	DWORD PTR _l$70320[ebp], eax

; 97   : 				size_t cnt = 3;

	mov	DWORD PTR _cnt$70322[ebp], 3
$L70324:

; 98   : 				while(cnt < len)

	mov	eax, DWORD PTR _cnt$70322[ebp]
	cmp	eax, DWORD PTR _len$[ebp]
	jae	SHORT $L70325

; 100  : 					l += sprintf(tel + l, " %.3s", txt + cnt);

	mov	ecx, DWORD PTR _txt$[ebp]
	add	ecx, DWORD PTR _cnt$70322[ebp]
	push	ecx
	push	OFFSET FLAT:$SG70326
	mov	edx, DWORD PTR _l$70320[ebp]
	lea	eax, DWORD PTR _tel$70314[ebp+edx]
	push	eax
	call	_sprintf
	add	esp, 12					; 0000000cH
	mov	ecx, DWORD PTR _l$70320[ebp]
	add	ecx, eax
	mov	DWORD PTR _l$70320[ebp], ecx

; 101  : 					cnt += 3;

	mov	edx, DWORD PTR _cnt$70322[ebp]
	add	edx, 3
	mov	DWORD PTR _cnt$70322[ebp], edx

; 102  : 				}

	jmp	SHORT $L70324
$L70325:

; 103  : 				len = l;

	mov	eax, DWORD PTR _l$70320[ebp]
	mov	DWORD PTR _len$[ebp], eax

; 104  : 				txt = tel;

	lea	ecx, DWORD PTR _tel$70314[ebp]
	mov	DWORD PTR _txt$[ebp], ecx
$L70319:

; 107  : 		DYNBUF_ADD(buf, txt, len, NO_CONV);

	push	0
	push	0
	mov	edx, DWORD PTR _len$[ebp]
	push	edx
	mov	eax, DWORD PTR _txt$[ebp]
	push	eax
	mov	ecx, DWORD PTR _buf$[ebp]
	push	ecx
	call	_dynbuf_add
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L70328
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29872], OFFSET FLAT:$SG70330
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 107		; 0000006bH
	jmp	$eva_err$70230
$L70328:

; 109  : 	else if(!strncmp(fmt, add_sz_str("_EVA_")) && !datetxt_invalid(txt))

	jmp	$L70341
$L70312:
	push	5
	push	OFFSET FLAT:$SG70333
	mov	ecx, DWORD PTR _fmt$[ebp]
	push	ecx
	call	_strncmp
	add	esp, 12					; 0000000cH
	test	eax, eax
	jne	SHORT $L70332
	mov	edx, DWORD PTR _txt$[ebp]
	push	edx
	call	_datetxt_invalid
	add	esp, 4
	test	eax, eax
	jne	SHORT $L70332

; 111  : 		/* Date formats */
; 112  : 		char date[32];
; 113  : 		datetxt_to_format(cntxt, date, txt, fmt);

	mov	eax, DWORD PTR _fmt$[ebp]
	push	eax
	mov	ecx, DWORD PTR _txt$[ebp]
	push	ecx
	lea	edx, DWORD PTR _date$70334[ebp]
	push	edx
	mov	eax, DWORD PTR _cntxt$[ebp]
	push	eax
	call	_datetxt_to_format
	add	esp, 16					; 00000010H

; 114  : 		DYNBUF_ADD(buf, date, 0, NO_CONV);

	push	0
	push	0
	push	0
	lea	ecx, DWORD PTR _date$70334[ebp]
	push	ecx
	mov	edx, DWORD PTR _buf$[ebp]
	push	edx
	call	_dynbuf_add
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L70336
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29872], OFFSET FLAT:$SG70338
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 114		; 00000072H
	jmp	SHORT $eva_err$70230
$L70336:

; 116  : 	else

	jmp	SHORT $L70341
$L70332:

; 118  : 		DYNBUF_ADD(buf, txt, len, NO_CONV);

	push	0
	push	0
	mov	edx, DWORD PTR _len$[ebp]
	push	edx
	mov	eax, DWORD PTR _txt$[ebp]
	push	eax
	mov	ecx, DWORD PTR _buf$[ebp]
	push	ecx
	call	_dynbuf_add
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L70341
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29872], OFFSET FLAT:$SG70343
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 118		; 00000076H
	jmp	SHORT $eva_err$70230
$L70341:
$eva_noerr$70217:

; 120  : 
; 121  : 	RETURN_OK_CLEANUP;

	push	0
	push	OFFSET FLAT:$SG70344
	push	OFFSET FLAT:$SG70345
	mov	ecx, DWORD PTR _cntxt$[ebp]
	push	ecx
	call	_err_clear
	add	esp, 16					; 00000010H
$eva_err$70230:
	mov	edx, DWORD PTR _cntxt$[ebp]
	cmp	DWORD PTR [edx+29872], 0
	je	SHORT $L70346
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	ecx, DWORD PTR [eax+29900]
	push	ecx
	push	OFFSET FLAT:$SG70347
	push	OFFSET FLAT:$SG70348
	mov	edx, DWORD PTR _cntxt$[ebp]
	push	edx
	call	_err_add_context
	add	esp, 16					; 00000010H
$L70346:
	mov	eax, DWORD PTR _cntxt$[ebp]
	xor	ecx, ecx
	cmp	DWORD PTR [eax+29872], 0
	setne	cl
	mov	eax, ecx

; 122  : }

	mov	esp, ebp
	pop	ebp
	ret	0
$L70354:
	DD	$L70239
	DD	$L70237
	DD	$L70235
	DD	$L70241
	DD	$L70243
	DD	$L70245
	DD	$L70247
$L70353:
	DB	0
	DB	6
	DB	6
	DB	6
	DB	6
	DB	6
	DB	6
	DB	6
	DB	6
	DB	1
	DB	6
	DB	6
	DB	6
	DB	6
	DB	6
	DB	6
	DB	6
	DB	6
	DB	6
	DB	6
	DB	6
	DB	2
	DB	6
	DB	6
	DB	6
	DB	6
	DB	6
	DB	6
	DB	6
	DB	6
	DB	6
	DB	6
	DB	6
	DB	6
	DB	6
	DB	6
	DB	3
	DB	6
	DB	6
	DB	6
	DB	6
	DB	4
	DB	6
	DB	6
	DB	6
	DB	6
	DB	6
	DB	5
_put_value_fmt ENDP
_TEXT	ENDS
END
