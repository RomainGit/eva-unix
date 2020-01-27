	TITLE	D:\Travail\ABI\EVA\V4.0\CGI\Brunix-2016\date_utils.c
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
_BSS	SEGMENT PARA USE32 PUBLIC 'BSS'
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
PUBLIC	_time_to_datetxt
EXTRN	_sprintf:NEAR
EXTRN	_localtime:NEAR
_DATA	SEGMENT
$SG70211 DB	'%04d%02d%02d%02d%02d%02d', 00H
_DATA	ENDS
_TEXT	SEGMENT
_t$ = 8
_valdate$ = 12
_dt$ = -4
_time_to_datetxt PROC NEAR

; 32   : {

	push	ebp
	mov	ebp, esp
	push	ecx

; 33   : 	struct tm *dt;
; 34   : 
; 35   : 	/* Make date value */
; 36   : 	if(!valdate) return 1;

	cmp	DWORD PTR _valdate$[ebp], 0
	jne	SHORT $L70209
	mov	eax, 1
	jmp	SHORT $L70207
$L70209:

; 37   : 	*valdate =  0;

	mov	eax, DWORD PTR _valdate$[ebp]
	mov	BYTE PTR [eax], 0

; 38   : 	dt = localtime(&t);

	lea	ecx, DWORD PTR _t$[ebp]
	push	ecx
	call	_localtime
	add	esp, 4
	mov	DWORD PTR _dt$[ebp], eax

; 39   : 	if(!dt) return 1;

	cmp	DWORD PTR _dt$[ebp], 0
	jne	SHORT $L70210
	mov	eax, 1
	jmp	SHORT $L70207
$L70210:

; 40   : 	sprintf(valdate, "%04d%02d%02d%02d%02d%02d",
; 41   : 			1900 + dt->tm_year, dt->tm_mon+1, dt->tm_mday,
; 42   : 			dt->tm_hour, dt->tm_min, dt->tm_sec);

	mov	edx, DWORD PTR _dt$[ebp]
	mov	eax, DWORD PTR [edx]
	push	eax
	mov	ecx, DWORD PTR _dt$[ebp]
	mov	edx, DWORD PTR [ecx+4]
	push	edx
	mov	eax, DWORD PTR _dt$[ebp]
	mov	ecx, DWORD PTR [eax+8]
	push	ecx
	mov	edx, DWORD PTR _dt$[ebp]
	mov	eax, DWORD PTR [edx+12]
	push	eax
	mov	ecx, DWORD PTR _dt$[ebp]
	mov	edx, DWORD PTR [ecx+16]
	add	edx, 1
	push	edx
	mov	eax, DWORD PTR _dt$[ebp]
	mov	ecx, DWORD PTR [eax+20]
	add	ecx, 1900				; 0000076cH
	push	ecx
	push	OFFSET FLAT:$SG70211
	mov	edx, DWORD PTR _valdate$[ebp]
	push	edx
	call	_sprintf
	add	esp, 32					; 00000020H

; 43   : 
; 44   : 	return 0;

	xor	eax, eax
$L70207:

; 45   : }

	mov	esp, ebp
	pop	ebp
	ret	0
_time_to_datetxt ENDP
_TEXT	ENDS
PUBLIC	_full_datetxt
EXTRN	_strlen:NEAR
_DATA	SEGMENT
	ORG $+3
$SG70217 DB	'0101000000', 00H
	ORG $+1
$SG70218 DB	'%s', 00H
_DATA	ENDS
_TEXT	SEGMENT
_date$ = 8
_sz$ = -4
_full_datetxt PROC NEAR

; 53   : ){

	push	ebp
	mov	ebp, esp
	sub	esp, 8

; 54   : 	size_t sz = date ? strlen(date) : 0;

	cmp	DWORD PTR _date$[ebp], 0
	je	SHORT $L70933
	mov	eax, DWORD PTR _date$[ebp]
	push	eax
	call	_strlen
	add	esp, 4
	mov	DWORD PTR -8+[ebp], eax
	jmp	SHORT $L70934
$L70933:
	mov	DWORD PTR -8+[ebp], 0
$L70934:
	mov	ecx, DWORD PTR -8+[ebp]
	mov	DWORD PTR _sz$[ebp], ecx

; 55   : 	if(sz != 4 && sz != 6 && sz != 8 && sz != 10 && sz != 12) return;

	cmp	DWORD PTR _sz$[ebp], 4
	je	SHORT $L70216
	cmp	DWORD PTR _sz$[ebp], 6
	je	SHORT $L70216
	cmp	DWORD PTR _sz$[ebp], 8
	je	SHORT $L70216
	cmp	DWORD PTR _sz$[ebp], 10			; 0000000aH
	je	SHORT $L70216
	cmp	DWORD PTR _sz$[ebp], 12			; 0000000cH
	je	SHORT $L70216
	jmp	SHORT $L70214
$L70216:

; 56   : 	sprintf(date + sz, "%s", "0101000000" + sz - 4);

	mov	edx, DWORD PTR _sz$[ebp]
	lea	eax, DWORD PTR $SG70217[edx-4]
	push	eax
	push	OFFSET FLAT:$SG70218
	mov	ecx, DWORD PTR _date$[ebp]
	add	ecx, DWORD PTR _sz$[ebp]
	push	ecx
	call	_sprintf
	add	esp, 12					; 0000000cH
$L70214:

; 57   : }

	mov	esp, ebp
	pop	ebp
	ret	0
_full_datetxt ENDP
_TEXT	ENDS
PUBLIC	_datetxt_now
EXTRN	_time:NEAR
_BSS	SEGMENT
_?date@?1??datetxt_now@@9@9 DB 010H DUP (?)
_BSS	ENDS
_TEXT	SEGMENT
_t$ = -4
_datetxt_now PROC NEAR

; 64   : {

	push	ebp
	mov	ebp, esp
	push	ecx

; 65   : 	static char date[16];
; 66   : 	time_t t = time(NULL);

	push	0
	call	_time
	add	esp, 4
	mov	DWORD PTR _t$[ebp], eax

; 67   : 
; 68   : 	time_to_datetxt(t, date);

	push	OFFSET FLAT:_?date@?1??datetxt_now@@9@9
	mov	eax, DWORD PTR _t$[ebp]
	push	eax
	call	_time_to_datetxt
	add	esp, 8

; 69   : 
; 70   : 	return date;

	mov	eax, OFFSET FLAT:_?date@?1??datetxt_now@@9@9

; 71   : }

	mov	esp, ebp
	pop	ebp
	ret	0
_datetxt_now ENDP
_TEXT	ENDS
PUBLIC	_date_difference
EXTRN	_mktime:NEAR
EXTRN	_memset:NEAR
_TEXT	SEGMENT
_Y0$ = 8
_M0$ = 12
_D0$ = 16
_h0$ = 20
_m0$ = 24
_s0$ = 28
_Y1$ = 32
_M1$ = 36
_D1$ = 40
_h1$ = 44
_m1$ = 48
_s1$ = 52
_fmt$ = 56
_b_unix$ = -48
_dt$ = -44
_t0$ = -4
_t1$ = -8
_date_difference PROC NEAR

; 81   : ){

	push	ebp
	mov	ebp, esp
	sub	esp, 60					; 0000003cH
	push	ebx
	push	esi

; 82   : 	/* Try unix time translation */
; 83   : 	int b_unix;
; 84   : 	struct tm dt;
; 85   : 	time_t t0, t1;
; 86   : 	memset(&dt, 0, sizeof(dt));

	push	36					; 00000024H
	push	0
	lea	eax, DWORD PTR _dt$[ebp]
	push	eax
	call	_memset
	add	esp, 12					; 0000000cH

; 87   : 	dt.tm_isdst = -1;

	mov	DWORD PTR _dt$[ebp+32], -1

; 88   : 	dt.tm_year = Y0 - 1900; dt.tm_mon = M0 - 1; dt.tm_mday = D0;

	mov	ecx, DWORD PTR _Y0$[ebp]
	sub	ecx, 1900				; 0000076cH
	mov	DWORD PTR _dt$[ebp+20], ecx
	mov	edx, DWORD PTR _M0$[ebp]
	sub	edx, 1
	mov	DWORD PTR _dt$[ebp+16], edx
	mov	eax, DWORD PTR _D0$[ebp]
	mov	DWORD PTR _dt$[ebp+12], eax

; 89   : 	dt.tm_hour = h0; dt.tm_min = m0; dt.tm_sec = s0;

	mov	ecx, DWORD PTR _h0$[ebp]
	mov	DWORD PTR _dt$[ebp+8], ecx
	mov	edx, DWORD PTR _m0$[ebp]
	mov	DWORD PTR _dt$[ebp+4], edx
	mov	eax, DWORD PTR _s0$[ebp]
	mov	DWORD PTR _dt$[ebp], eax

; 90   : 	t0 = mktime(&dt);

	lea	ecx, DWORD PTR _dt$[ebp]
	push	ecx
	call	_mktime
	add	esp, 4
	mov	DWORD PTR _t0$[ebp], eax

; 91   : 	dt.tm_year = Y1 - 1900; dt.tm_mon = M1 - 1; dt.tm_mday = D1;

	mov	edx, DWORD PTR _Y1$[ebp]
	sub	edx, 1900				; 0000076cH
	mov	DWORD PTR _dt$[ebp+20], edx
	mov	eax, DWORD PTR _M1$[ebp]
	sub	eax, 1
	mov	DWORD PTR _dt$[ebp+16], eax
	mov	ecx, DWORD PTR _D1$[ebp]
	mov	DWORD PTR _dt$[ebp+12], ecx

; 92   : 	dt.tm_hour = h1; dt.tm_min = m1; dt.tm_sec = s1;

	mov	edx, DWORD PTR _h1$[ebp]
	mov	DWORD PTR _dt$[ebp+8], edx
	mov	eax, DWORD PTR _m1$[ebp]
	mov	DWORD PTR _dt$[ebp+4], eax
	mov	ecx, DWORD PTR _s1$[ebp]
	mov	DWORD PTR _dt$[ebp], ecx

; 93   : 	t1 = mktime(&dt);

	lea	edx, DWORD PTR _dt$[ebp]
	push	edx
	call	_mktime
	add	esp, 4
	mov	DWORD PTR _t1$[ebp], eax

; 94   : 	b_unix = t0 != (time_t)-1 && t1 != (time_t)-1;

	cmp	DWORD PTR _t0$[ebp], -1
	je	SHORT $L70937
	cmp	DWORD PTR _t1$[ebp], -1
	je	SHORT $L70937
	mov	DWORD PTR -52+[ebp], 1
	jmp	SHORT $L70938
$L70937:
	mov	DWORD PTR -52+[ebp], 0
$L70938:
	mov	eax, DWORD PTR -52+[ebp]
	mov	DWORD PTR _b_unix$[ebp], eax

; 95   : 
; 96   : 	switch(*fmt)
; 97   : 	{

	mov	ecx, DWORD PTR _fmt$[ebp]
	movsx	edx, BYTE PTR [ecx]
	mov	DWORD PTR -56+[ebp], edx
	mov	eax, DWORD PTR -56+[ebp]
	sub	eax, 68					; 00000044H
	mov	DWORD PTR -56+[ebp], eax
	cmp	DWORD PTR -56+[ebp], 47			; 0000002fH
	ja	$L70259
	mov	edx, DWORD PTR -56+[ebp]
	xor	ecx, ecx
	mov	cl, BYTE PTR $L70942[edx]
	jmp	DWORD PTR $L70943[ecx*4]
$L70262:

; 98   : 	case 's':
; 99   : 		/* Unix time implementation */
; 100  : 		if(b_unix) return t1 - t0;

	cmp	DWORD PTR _b_unix$[ebp], 0
	je	SHORT $L70263
	mov	eax, DWORD PTR _t1$[ebp]
	sub	eax, DWORD PTR _t0$[ebp]
	jmp	$L70251
$L70263:

; 101  : 
; 102  : 		/* Simple implementation for days in same month */
; 103  : 		if(Y0 == Y1 && M0 == M1)

	mov	eax, DWORD PTR _Y0$[ebp]
	cmp	eax, DWORD PTR _Y1$[ebp]
	jne	SHORT $L70264
	mov	ecx, DWORD PTR _M0$[ebp]
	cmp	ecx, DWORD PTR _M1$[ebp]
	jne	SHORT $L70264

; 104  : 			return (D1 - D0 + (h1 >= h0 ? 0 : 1))*86400 + (h1 - h0 + (m1 >= m0 ? 0 : 1))*3600 + (m1 - m0 + (s1 >= s0 ? 0 : 1))*60 + s1 - s0;

	mov	edx, DWORD PTR _D1$[ebp]
	sub	edx, DWORD PTR _D0$[ebp]
	mov	eax, DWORD PTR _h1$[ebp]
	xor	ecx, ecx
	cmp	eax, DWORD PTR _h0$[ebp]
	setl	cl
	add	edx, ecx
	imul	edx, 86400				; 00015180H
	mov	eax, DWORD PTR _h1$[ebp]
	sub	eax, DWORD PTR _h0$[ebp]
	mov	ecx, DWORD PTR _m1$[ebp]
	xor	ebx, ebx
	cmp	ecx, DWORD PTR _m0$[ebp]
	setl	bl
	add	eax, ebx
	imul	eax, 3600				; 00000e10H
	add	eax, DWORD PTR _s1$[ebp]
	mov	ecx, DWORD PTR _m1$[ebp]
	sub	ecx, DWORD PTR _m0$[ebp]
	mov	esi, DWORD PTR _s1$[ebp]
	xor	ebx, ebx
	cmp	esi, DWORD PTR _s0$[ebp]
	setl	bl
	add	ecx, ebx
	imul	ecx, 60					; 0000003cH
	add	eax, edx
	add	ecx, eax
	sub	ecx, DWORD PTR _s0$[ebp]
	mov	eax, ecx
	jmp	$L70251
$L70264:

; 105  : 
; 106  : 		/* TODO : exact implementation for old dates */
; 107  : 		*fmt = 'm';

	mov	edx, DWORD PTR _fmt$[ebp]
	mov	BYTE PTR [edx], 109			; 0000006dH
$L70265:

; 108  : 	case 'm':
; 109  : 		/* Unix time implementation */
; 110  : 		if(b_unix) return t1/60 - t0/60;

	cmp	DWORD PTR _b_unix$[ebp], 0
	je	SHORT $L70266
	mov	eax, DWORD PTR _t1$[ebp]
	cdq
	mov	ecx, 60					; 0000003cH
	idiv	ecx
	mov	ecx, eax
	mov	eax, DWORD PTR _t0$[ebp]
	cdq
	mov	esi, 60					; 0000003cH
	idiv	esi
	sub	ecx, eax
	mov	eax, ecx
	jmp	$L70251
$L70266:

; 111  : 
; 112  : 		/* Simple implementation for days in same month */
; 113  : 		if(Y0 == Y1 && M0 == M1)

	mov	edx, DWORD PTR _Y0$[ebp]
	cmp	edx, DWORD PTR _Y1$[ebp]
	jne	SHORT $L70267
	mov	eax, DWORD PTR _M0$[ebp]
	cmp	eax, DWORD PTR _M1$[ebp]
	jne	SHORT $L70267

; 114  : 			return (D1 - D0 + (h1 >= h0 ? 0 : 1))*1440 + (h1 - h0 + (m1 >= m0 ? 0 : 1))*60 + m1 - m0;

	mov	ecx, DWORD PTR _D1$[ebp]
	sub	ecx, DWORD PTR _D0$[ebp]
	mov	edx, DWORD PTR _h1$[ebp]
	xor	eax, eax
	cmp	edx, DWORD PTR _h0$[ebp]
	setl	al
	add	ecx, eax
	imul	ecx, 1440				; 000005a0H
	mov	eax, DWORD PTR _h1$[ebp]
	sub	eax, DWORD PTR _h0$[ebp]
	mov	edx, DWORD PTR _m1$[ebp]
	xor	ebx, ebx
	cmp	edx, DWORD PTR _m0$[ebp]
	setl	bl
	add	eax, ebx
	imul	eax, 60					; 0000003cH
	mov	edx, DWORD PTR _m1$[ebp]
	add	edx, ecx
	add	eax, edx
	sub	eax, DWORD PTR _m0$[ebp]
	jmp	$L70251
$L70267:

; 115  : 
; 116  : 		/* TODO : exact implementation for old dates */
; 117  : 		*fmt = 'h';

	mov	eax, DWORD PTR _fmt$[ebp]
	mov	BYTE PTR [eax], 104			; 00000068H
$L70268:

; 118  : 	case 'h':
; 119  : 		/* Unix time implementation */
; 120  : 		if(b_unix) return (t1 - t0)/3600;

	cmp	DWORD PTR _b_unix$[ebp], 0
	je	SHORT $L70269
	mov	eax, DWORD PTR _t1$[ebp]
	sub	eax, DWORD PTR _t0$[ebp]
	cdq
	mov	ecx, 3600				; 00000e10H
	idiv	ecx
	jmp	$L70251
$L70269:

; 121  : 
; 122  : 		/* Simple implementation for days in same month */
; 123  : 		if(Y0 == Y1 && M0 == M1)

	mov	edx, DWORD PTR _Y0$[ebp]
	cmp	edx, DWORD PTR _Y1$[ebp]
	jne	SHORT $L70270
	mov	eax, DWORD PTR _M0$[ebp]
	cmp	eax, DWORD PTR _M1$[ebp]
	jne	SHORT $L70270

; 124  : 			return (D1 - D0 + (h1 >= h0 ? 0 : 1))*24 + h1 - h0;

	mov	eax, DWORD PTR _D1$[ebp]
	sub	eax, DWORD PTR _D0$[ebp]
	mov	ecx, DWORD PTR _h1$[ebp]
	xor	edx, edx
	cmp	ecx, DWORD PTR _h0$[ebp]
	setl	dl
	add	eax, edx
	imul	eax, 24					; 00000018H
	add	eax, DWORD PTR _h1$[ebp]
	sub	eax, DWORD PTR _h0$[ebp]
	jmp	$L70251
$L70270:

; 125  : 
; 126  : 		/* TODO : exact implementation for old dates */
; 127  : 		*fmt = 'D';

	mov	eax, DWORD PTR _fmt$[ebp]
	mov	BYTE PTR [eax], 68			; 00000044H
$L70271:

; 128  : 	case 'D':
; 129  : 		/* Unix time implementation */
; 130  : 		if(b_unix) return (t1 - t0)/86400;

	cmp	DWORD PTR _b_unix$[ebp], 0
	je	SHORT $L70272
	mov	eax, DWORD PTR _t1$[ebp]
	sub	eax, DWORD PTR _t0$[ebp]
	cdq
	mov	ecx, 86400				; 00015180H
	idiv	ecx
	jmp	SHORT $L70251
$L70272:

; 131  : 
; 132  : 		/* Simple implementation for days in same month */
; 133  : 		if(Y0 == Y1 && M0 == M1) return (D1 - D0);

	mov	edx, DWORD PTR _Y0$[ebp]
	cmp	edx, DWORD PTR _Y1$[ebp]
	jne	SHORT $L70273
	mov	eax, DWORD PTR _M0$[ebp]
	cmp	eax, DWORD PTR _M1$[ebp]
	jne	SHORT $L70273
	mov	eax, DWORD PTR _D1$[ebp]
	sub	eax, DWORD PTR _D0$[ebp]
	jmp	SHORT $L70251
$L70273:

; 134  : 
; 135  : 		*fmt = 'M';

	mov	ecx, DWORD PTR _fmt$[ebp]
	mov	BYTE PTR [ecx], 77			; 0000004dH
$L70274:

; 136  : 	case 'M':
; 137  : 		return M1 - M0 + (Y1 - Y0) * 12 - (D1 >= D0 ? 0 : 1);

	mov	eax, DWORD PTR _M1$[ebp]
	sub	eax, DWORD PTR _M0$[ebp]
	mov	edx, DWORD PTR _Y1$[ebp]
	sub	edx, DWORD PTR _Y0$[ebp]
	imul	edx, 12					; 0000000cH
	add	eax, edx
	mov	ecx, DWORD PTR _D1$[ebp]
	xor	edx, edx
	cmp	ecx, DWORD PTR _D0$[ebp]
	setl	dl
	sub	eax, edx
	jmp	SHORT $L70251
$L70259:

; 139  : 	*fmt = 'Y';

	mov	eax, DWORD PTR _fmt$[ebp]
	mov	BYTE PTR [eax], 89			; 00000059H

; 140  : 	return Y1 - Y0 - ((M1 > M0 || (M1 == M0 && D1 >= D0) ) ? 0 : 1);

	mov	ecx, DWORD PTR _M1$[ebp]
	cmp	ecx, DWORD PTR _M0$[ebp]
	jg	SHORT $L70940
	mov	edx, DWORD PTR _M1$[ebp]
	cmp	edx, DWORD PTR _M0$[ebp]
	jne	SHORT $L70939
	mov	eax, DWORD PTR _D1$[ebp]
	cmp	eax, DWORD PTR _D0$[ebp]
	jge	SHORT $L70940
$L70939:
	mov	DWORD PTR -60+[ebp], 1
	jmp	SHORT $L70941
$L70940:
	mov	DWORD PTR -60+[ebp], 0
$L70941:
	mov	eax, DWORD PTR _Y1$[ebp]
	sub	eax, DWORD PTR _Y0$[ebp]
	sub	eax, DWORD PTR -60+[ebp]
$L70251:

; 141  : }

	pop	esi
	pop	ebx
	mov	esp, ebp
	pop	ebp
	ret	0
$L70943:
	DD	$L70271
	DD	$L70274
	DD	$L70268
	DD	$L70265
	DD	$L70262
	DD	$L70259
$L70942:
	DB	0
	DB	5
	DB	5
	DB	5
	DB	5
	DB	5
	DB	5
	DB	5
	DB	5
	DB	1
	DB	5
	DB	5
	DB	5
	DB	5
	DB	5
	DB	5
	DB	5
	DB	5
	DB	5
	DB	5
	DB	5
	DB	5
	DB	5
	DB	5
	DB	5
	DB	5
	DB	5
	DB	5
	DB	5
	DB	5
	DB	5
	DB	5
	DB	5
	DB	5
	DB	5
	DB	5
	DB	2
	DB	5
	DB	5
	DB	5
	DB	5
	DB	3
	DB	5
	DB	5
	DB	5
	DB	5
	DB	5
	DB	4
_date_difference ENDP
_TEXT	ENDS
PUBLIC	_datetxt_to_age
EXTRN	_sscanf:NEAR
EXTRN	_abs:NEAR
_DATA	SEGMENT
	ORG $+1
$SG70302 DB	'%4d%2d%2d%2d%2d%2d', 00H
	ORG $+1
$SG70303 DB	'%4d%2d%2d%2d%2d%2d', 00H
_DATA	ENDS
_TEXT	SEGMENT
_date$ = 8
_now$ = 12
_format$ = 16
_Y0$ = -44
_M0$ = -36
_D0$ = -16
_h0$ = -24
_m0$ = -56
_s0$ = -8
_Y1$ = -52
_M1$ = -40
_D1$ = -20
_h1$ = -28
_m1$ = -60
_s1$ = -12
_fmt$ = -4
_base$ = -64
_age$ = -32
_b_done$ = -48
_outfmt$70314 = -68
_datetxt_to_age PROC NEAR

; 161  : ){

	push	ebp
	mov	ebp, esp
	sub	esp, 84					; 00000054H

; 162  : 	int Y0 = 0, M0 = 0, D0 = 0, h0 = 0, m0 = 0, s0 = 0;

	mov	DWORD PTR _Y0$[ebp], 0
	mov	DWORD PTR _M0$[ebp], 0
	mov	DWORD PTR _D0$[ebp], 0
	mov	DWORD PTR _h0$[ebp], 0
	mov	DWORD PTR _m0$[ebp], 0
	mov	DWORD PTR _s0$[ebp], 0

; 163  : 	int Y1 = 0, M1 = 0, D1 = 0, h1 = 0, m1 = 0, s1 = 0;

	mov	DWORD PTR _Y1$[ebp], 0
	mov	DWORD PTR _M1$[ebp], 0
	mov	DWORD PTR _D1$[ebp], 0
	mov	DWORD PTR _h1$[ebp], 0
	mov	DWORD PTR _m1$[ebp], 0
	mov	DWORD PTR _s1$[ebp], 0

; 164  : 	char fmt = (char)(format ? *format : 0);

	cmp	DWORD PTR _format$[ebp], 0
	je	SHORT $L70945
	mov	eax, DWORD PTR _format$[ebp]
	movsx	ecx, BYTE PTR [eax]
	mov	DWORD PTR -72+[ebp], ecx
	jmp	SHORT $L70946
$L70945:
	mov	DWORD PTR -72+[ebp], 0
$L70946:
	mov	dl, BYTE PTR -72+[ebp]
	mov	BYTE PTR _fmt$[ebp], dl

; 165  : 	char *base = now ? now : datetxt_now();

	cmp	DWORD PTR _now$[ebp], 0
	je	SHORT $L70947
	mov	eax, DWORD PTR _now$[ebp]
	mov	DWORD PTR -76+[ebp], eax
	jmp	SHORT $L70948
$L70947:
	call	_datetxt_now
	mov	DWORD PTR -76+[ebp], eax
$L70948:
	mov	ecx, DWORD PTR -76+[ebp]
	mov	DWORD PTR _base$[ebp], ecx

; 166  : 	int age = 0;

	mov	DWORD PTR _age$[ebp], 0

; 167  : 	int b_done = 0;

	mov	DWORD PTR _b_done$[ebp], 0

; 168  : 
; 169  : 	/* Check params - return 0 on error */
; 170  : 	if(format) *format = 'E';

	cmp	DWORD PTR _format$[ebp], 0
	je	SHORT $L70299
	mov	edx, DWORD PTR _format$[ebp]
	mov	BYTE PTR [edx], 69			; 00000045H
$L70299:

; 171  : 	if(!date || strlen(date) < 4) return 0;

	cmp	DWORD PTR _date$[ebp], 0
	je	SHORT $L70301
	mov	eax, DWORD PTR _date$[ebp]
	push	eax
	call	_strlen
	add	esp, 4
	cmp	eax, 4
	jae	SHORT $L70300
$L70301:
	xor	eax, eax
	jmp	$L70281
$L70300:

; 172  : 	sscanf(date, "%4d%2d%2d%2d%2d%2d", &Y0, &M0, &D0, &h0, &m0, &s0);

	lea	ecx, DWORD PTR _s0$[ebp]
	push	ecx
	lea	edx, DWORD PTR _m0$[ebp]
	push	edx
	lea	eax, DWORD PTR _h0$[ebp]
	push	eax
	lea	ecx, DWORD PTR _D0$[ebp]
	push	ecx
	lea	edx, DWORD PTR _M0$[ebp]
	push	edx
	lea	eax, DWORD PTR _Y0$[ebp]
	push	eax
	push	OFFSET FLAT:$SG70302
	mov	ecx, DWORD PTR _date$[ebp]
	push	ecx
	call	_sscanf
	add	esp, 32					; 00000020H

; 173  : 	sscanf(base, "%4d%2d%2d%2d%2d%2d", &Y1, &M1, &D1, &h1, &m1, &s1);

	lea	edx, DWORD PTR _s1$[ebp]
	push	edx
	lea	eax, DWORD PTR _m1$[ebp]
	push	eax
	lea	ecx, DWORD PTR _h1$[ebp]
	push	ecx
	lea	edx, DWORD PTR _D1$[ebp]
	push	edx
	lea	eax, DWORD PTR _M1$[ebp]
	push	eax
	lea	ecx, DWORD PTR _Y1$[ebp]
	push	ecx
	push	OFFSET FLAT:$SG70303
	mov	edx, DWORD PTR _base$[ebp]
	push	edx
	call	_sscanf
	add	esp, 32					; 00000020H

; 174  : 	if(Y0 < 1000 || Y1 < 1000) return 0;

	cmp	DWORD PTR _Y0$[ebp], 1000		; 000003e8H
	jl	SHORT $L70305
	cmp	DWORD PTR _Y1$[ebp], 1000		; 000003e8H
	jge	SHORT $L70304
$L70305:
	xor	eax, eax
	jmp	$L70281
$L70304:

; 175  : 	if(!M0) M0 = 1;

	cmp	DWORD PTR _M0$[ebp], 0
	jne	SHORT $L70306
	mov	DWORD PTR _M0$[ebp], 1
$L70306:

; 176  : 	if(!D0) D0 = 1;

	cmp	DWORD PTR _D0$[ebp], 0
	jne	SHORT $L70307
	mov	DWORD PTR _D0$[ebp], 1
$L70307:

; 177  : 	if(!M1) M1 = 1;

	cmp	DWORD PTR _M1$[ebp], 0
	jne	SHORT $L70308
	mov	DWORD PTR _M1$[ebp], 1
$L70308:

; 178  : 	if(!D1) D1 = 1;

	cmp	DWORD PTR _D1$[ebp], 0
	jne	SHORT $L70309
	mov	DWORD PTR _D1$[ebp], 1
$L70309:

; 179  : 
; 180  : 	/* Select best fit if required */
; 181  : 	if(!fmt)

	movsx	eax, BYTE PTR _fmt$[ebp]
	test	eax, eax
	jne	$L70313
$L70312:

; 183  : 		while(!b_done)

	cmp	DWORD PTR _b_done$[ebp], 0
	jne	$L70313

; 185  : 			char outfmt;
; 186  : 			switch(fmt)
; 187  : 			{

	movsx	ecx, BYTE PTR _fmt$[ebp]
	mov	DWORD PTR -80+[ebp], ecx
	cmp	DWORD PTR -80+[ebp], 104		; 00000068H
	ja	SHORT $L70324
	mov	eax, DWORD PTR -80+[ebp]
	xor	edx, edx
	mov	dl, BYTE PTR $L70951[eax]
	jmp	DWORD PTR $L70952[edx*4]
$L70319:

; 188  : 				case 0: fmt = 'Y'; break;

	mov	BYTE PTR _fmt$[ebp], 89			; 00000059H
	jmp	SHORT $L70316
$L70320:

; 189  : 				case 'Y': fmt = 'M'; break;

	mov	BYTE PTR _fmt$[ebp], 77			; 0000004dH
	jmp	SHORT $L70316
$L70321:

; 190  : 				case 'M': fmt = 'D'; break;

	mov	BYTE PTR _fmt$[ebp], 68			; 00000044H
	jmp	SHORT $L70316
$L70322:

; 191  : 				case 'D': fmt = 'h'; break;

	mov	BYTE PTR _fmt$[ebp], 104		; 00000068H
	jmp	SHORT $L70316
$L70323:

; 192  : 				case 'h': fmt = 'm'; break;

	mov	BYTE PTR _fmt$[ebp], 109		; 0000006dH
	jmp	SHORT $L70316
$L70324:

; 193  : 				default: fmt = 's';	b_done = 1;

	mov	BYTE PTR _fmt$[ebp], 115		; 00000073H
	mov	DWORD PTR _b_done$[ebp], 1
$L70316:

; 195  : 			outfmt = fmt;

	mov	cl, BYTE PTR _fmt$[ebp]
	mov	BYTE PTR _outfmt$70314[ebp], cl

; 196  : 			age = date_difference(Y0, M0, D0, h0, m0, s0, Y1, M1, D1, h1, m1, s1, &outfmt);

	lea	edx, DWORD PTR _outfmt$70314[ebp]
	push	edx
	mov	eax, DWORD PTR _s1$[ebp]
	push	eax
	mov	ecx, DWORD PTR _m1$[ebp]
	push	ecx
	mov	edx, DWORD PTR _h1$[ebp]
	push	edx
	mov	eax, DWORD PTR _D1$[ebp]
	push	eax
	mov	ecx, DWORD PTR _M1$[ebp]
	push	ecx
	mov	edx, DWORD PTR _Y1$[ebp]
	push	edx
	mov	eax, DWORD PTR _s0$[ebp]
	push	eax
	mov	ecx, DWORD PTR _m0$[ebp]
	push	ecx
	mov	edx, DWORD PTR _h0$[ebp]
	push	edx
	mov	eax, DWORD PTR _D0$[ebp]
	push	eax
	mov	ecx, DWORD PTR _M0$[ebp]
	push	ecx
	mov	edx, DWORD PTR _Y0$[ebp]
	push	edx
	call	_date_difference
	add	esp, 52					; 00000034H
	mov	DWORD PTR _age$[ebp], eax

; 197  : 			b_done |= abs(age) > 1 || outfmt != fmt;

	mov	eax, DWORD PTR _age$[ebp]
	push	eax
	call	_abs
	add	esp, 4
	cmp	eax, 1
	jg	SHORT $L70949
	movsx	ecx, BYTE PTR _outfmt$70314[ebp]
	movsx	edx, BYTE PTR _fmt$[ebp]
	cmp	ecx, edx
	jne	SHORT $L70949
	mov	DWORD PTR -84+[ebp], 0
	jmp	SHORT $L70950
$L70949:
	mov	DWORD PTR -84+[ebp], 1
$L70950:
	mov	eax, DWORD PTR _b_done$[ebp]
	or	eax, DWORD PTR -84+[ebp]
	mov	DWORD PTR _b_done$[ebp], eax

; 198  : 			fmt = outfmt;

	mov	cl, BYTE PTR _outfmt$70314[ebp]
	mov	BYTE PTR _fmt$[ebp], cl

; 199  : 		}

	jmp	$L70312
$L70313:

; 201  : 
; 202  : 	/* Compute date difference & assign used format */
; 203  : 	age = date_difference(Y0, M0, D0, h0, m0, s0, Y1, M1, D1, h1, m1, s1, &fmt);

	lea	edx, DWORD PTR _fmt$[ebp]
	push	edx
	mov	eax, DWORD PTR _s1$[ebp]
	push	eax
	mov	ecx, DWORD PTR _m1$[ebp]
	push	ecx
	mov	edx, DWORD PTR _h1$[ebp]
	push	edx
	mov	eax, DWORD PTR _D1$[ebp]
	push	eax
	mov	ecx, DWORD PTR _M1$[ebp]
	push	ecx
	mov	edx, DWORD PTR _Y1$[ebp]
	push	edx
	mov	eax, DWORD PTR _s0$[ebp]
	push	eax
	mov	ecx, DWORD PTR _m0$[ebp]
	push	ecx
	mov	edx, DWORD PTR _h0$[ebp]
	push	edx
	mov	eax, DWORD PTR _D0$[ebp]
	push	eax
	mov	ecx, DWORD PTR _M0$[ebp]
	push	ecx
	mov	edx, DWORD PTR _Y0$[ebp]
	push	edx
	call	_date_difference
	add	esp, 52					; 00000034H
	mov	DWORD PTR _age$[ebp], eax

; 204  : 	if(format) *format = fmt;

	cmp	DWORD PTR _format$[ebp], 0
	je	SHORT $L70325
	mov	eax, DWORD PTR _format$[ebp]
	mov	cl, BYTE PTR _fmt$[ebp]
	mov	BYTE PTR [eax], cl
$L70325:

; 205  : 	return age;

	mov	eax, DWORD PTR _age$[ebp]
$L70281:

; 206  : }

	mov	esp, ebp
	pop	ebp
	ret	0
$L70952:
	DD	$L70319
	DD	$L70322
	DD	$L70321
	DD	$L70320
	DD	$L70323
	DD	$L70324
$L70951:
	DB	0
	DB	5
	DB	5
	DB	5
	DB	5
	DB	5
	DB	5
	DB	5
	DB	5
	DB	5
	DB	5
	DB	5
	DB	5
	DB	5
	DB	5
	DB	5
	DB	5
	DB	5
	DB	5
	DB	5
	DB	5
	DB	5
	DB	5
	DB	5
	DB	5
	DB	5
	DB	5
	DB	5
	DB	5
	DB	5
	DB	5
	DB	5
	DB	5
	DB	5
	DB	5
	DB	5
	DB	5
	DB	5
	DB	5
	DB	5
	DB	5
	DB	5
	DB	5
	DB	5
	DB	5
	DB	5
	DB	5
	DB	5
	DB	5
	DB	5
	DB	5
	DB	5
	DB	5
	DB	5
	DB	5
	DB	5
	DB	5
	DB	5
	DB	5
	DB	5
	DB	5
	DB	5
	DB	5
	DB	5
	DB	5
	DB	5
	DB	5
	DB	5
	DB	1
	DB	5
	DB	5
	DB	5
	DB	5
	DB	5
	DB	5
	DB	5
	DB	5
	DB	2
	DB	5
	DB	5
	DB	5
	DB	5
	DB	5
	DB	5
	DB	5
	DB	5
	DB	5
	DB	5
	DB	5
	DB	3
	DB	5
	DB	5
	DB	5
	DB	5
	DB	5
	DB	5
	DB	5
	DB	5
	DB	5
	DB	5
	DB	5
	DB	5
	DB	5
	DB	5
	DB	4
_datetxt_to_age ENDP
_TEXT	ENDS
PUBLIC	_datetxt_invalid
_DATA	SEGMENT
	ORG $+1
$SG70347 DB	'%4u%2u%2u%2u%2u%2u', 00H
_DATA	ENDS
_TEXT	SEGMENT
_valdate$ = 8
_year$ = -24
_month$ = -8
_day$ = -16
_hour$ = -28
_min$ = -32
_sec$ = -20
_nb$ = -4
_c$ = -12
_sz$ = -36
_datetxt_invalid PROC NEAR

; 214  : ){

	push	ebp
	mov	ebp, esp
	sub	esp, 44					; 0000002cH

; 215  : 	int year = 0, month = 1, day = 1, hour = 0, min = 0, sec = 0, nb;

	mov	DWORD PTR _year$[ebp], 0
	mov	DWORD PTR _month$[ebp], 1
	mov	DWORD PTR _day$[ebp], 1
	mov	DWORD PTR _hour$[ebp], 0
	mov	DWORD PTR _min$[ebp], 0
	mov	DWORD PTR _sec$[ebp], 0

; 216  : 	char *c = valdate;

	mov	eax, DWORD PTR _valdate$[ebp]
	mov	DWORD PTR _c$[ebp], eax

; 217  : 	size_t sz;
; 218  : 
; 219  : 	/* Empty date is invalid */
; 220  : 	if(!valdate || !*valdate) return 1;

	cmp	DWORD PTR _valdate$[ebp], 0
	je	SHORT $L70339
	mov	ecx, DWORD PTR _valdate$[ebp]
	movsx	edx, BYTE PTR [ecx]
	test	edx, edx
	jne	SHORT $L70338
$L70339:
	mov	eax, 1
	jmp	$L70328
$L70338:

; 221  : 
; 222  : 	/* Only digits allowed */
; 223  : 	while(*c) if(*c < '0' || *c > '9') return 1; else c++;

	mov	eax, DWORD PTR _c$[ebp]
	movsx	ecx, BYTE PTR [eax]
	test	ecx, ecx
	je	SHORT $L70342
	mov	edx, DWORD PTR _c$[ebp]
	movsx	eax, BYTE PTR [edx]
	cmp	eax, 48					; 00000030H
	jl	SHORT $L70344
	mov	ecx, DWORD PTR _c$[ebp]
	movsx	edx, BYTE PTR [ecx]
	cmp	edx, 57					; 00000039H
	jle	SHORT $L70343
$L70344:
	mov	eax, 1
	jmp	$L70328
$L70343:
	mov	eax, DWORD PTR _c$[ebp]
	add	eax, 1
	mov	DWORD PTR _c$[ebp], eax
	jmp	SHORT $L70338
$L70342:

; 224  : 
; 225  : 	/* Check length */
; 226  : 	sz = c - valdate;

	mov	ecx, DWORD PTR _c$[ebp]
	sub	ecx, DWORD PTR _valdate$[ebp]
	mov	DWORD PTR _sz$[ebp], ecx

; 227  : 	if(sz != 4 && sz != 6 && sz != 8 && sz != 10 && sz != 12 && sz != 14) return 1;

	cmp	DWORD PTR _sz$[ebp], 4
	je	SHORT $L70346
	cmp	DWORD PTR _sz$[ebp], 6
	je	SHORT $L70346
	cmp	DWORD PTR _sz$[ebp], 8
	je	SHORT $L70346
	cmp	DWORD PTR _sz$[ebp], 10			; 0000000aH
	je	SHORT $L70346
	cmp	DWORD PTR _sz$[ebp], 12			; 0000000cH
	je	SHORT $L70346
	cmp	DWORD PTR _sz$[ebp], 14			; 0000000eH
	je	SHORT $L70346
	mov	eax, 1
	jmp	$L70328
$L70346:

; 228  : 
; 229  : 	/* Check year / month / day */
; 230  : 	nb = sscanf(valdate, "%4u%2u%2u%2u%2u%2u", &year, &month, &day, &hour, &min, &sec);

	lea	edx, DWORD PTR _sec$[ebp]
	push	edx
	lea	eax, DWORD PTR _min$[ebp]
	push	eax
	lea	ecx, DWORD PTR _hour$[ebp]
	push	ecx
	lea	edx, DWORD PTR _day$[ebp]
	push	edx
	lea	eax, DWORD PTR _month$[ebp]
	push	eax
	lea	ecx, DWORD PTR _year$[ebp]
	push	ecx
	push	OFFSET FLAT:$SG70347
	mov	edx, DWORD PTR _valdate$[ebp]
	push	edx
	call	_sscanf
	add	esp, 32					; 00000020H
	mov	DWORD PTR _nb$[ebp], eax

; 231  : 	return !nb || year < 100 || !month || month > 12 || !day ||
; 232  : 			day > ((month == 1 || month == 3 || month == 5 || month == 7 ||
; 233  : 					month == 8 || month == 10 || month == 12) ? 31 : month == 2 ? 29 : 30);

	cmp	DWORD PTR _nb$[ebp], 0
	je	SHORT $L70954
	cmp	DWORD PTR _year$[ebp], 100		; 00000064H
	jl	SHORT $L70954
	cmp	DWORD PTR _month$[ebp], 0
	je	SHORT $L70954
	cmp	DWORD PTR _month$[ebp], 12		; 0000000cH
	jg	SHORT $L70954
	cmp	DWORD PTR _day$[ebp], 0
	je	SHORT $L70954
	cmp	DWORD PTR _month$[ebp], 1
	je	SHORT $L70955
	cmp	DWORD PTR _month$[ebp], 3
	je	SHORT $L70955
	cmp	DWORD PTR _month$[ebp], 5
	je	SHORT $L70955
	cmp	DWORD PTR _month$[ebp], 7
	je	SHORT $L70955
	cmp	DWORD PTR _month$[ebp], 8
	je	SHORT $L70955
	cmp	DWORD PTR _month$[ebp], 10		; 0000000aH
	je	SHORT $L70955
	cmp	DWORD PTR _month$[ebp], 12		; 0000000cH
	je	SHORT $L70955
	xor	eax, eax
	cmp	DWORD PTR _month$[ebp], 2
	setne	al
	add	eax, 29					; 0000001dH
	mov	DWORD PTR -40+[ebp], eax
	jmp	SHORT $L70956
$L70955:
	mov	DWORD PTR -40+[ebp], 31			; 0000001fH
$L70956:
	mov	ecx, DWORD PTR _day$[ebp]
	cmp	ecx, DWORD PTR -40+[ebp]
	jg	SHORT $L70954
	mov	DWORD PTR -44+[ebp], 0
	jmp	SHORT $L70957
$L70954:
	mov	DWORD PTR -44+[ebp], 1
$L70957:
	mov	eax, DWORD PTR -44+[ebp]
$L70328:

; 234  : }

	mov	esp, ebp
	pop	ebp
	ret	0
_datetxt_invalid ENDP
_TEXT	ENDS
PUBLIC	_input_to_datetxt
EXTRN	_div:NEAR
EXTRN	_strncpy:NEAR
_DATA	SEGMENT
	ORG $+1
$SG70370 DB	'%d%n', 00H
	ORG $+3
$SG70376 DB	'%02d', 00H
	ORG $+3
$SG70378 DB	'%02d', 00H
	ORG $+3
$SG70381 DB	'%04d', 00H
	ORG $+3
$SG70389 DB	'%02d%02d', 00H
	ORG $+3
$SG70392 DB	'%04d%02d', 00H
	ORG $+3
$SG70396 DB	'%04d', 00H
	ORG $+3
$SG70398 DB	'%04d%02d%02d', 00H
	ORG $+3
$SG70401 DB	'%04d%02d%02d', 00H
	ORG $+3
$SG70404 DB	'%02d%02d', 00H
	ORG $+3
$SG70406 DB	'%02d', 00H
_DATA	ENDS
_TEXT	SEGMENT
_valdate$ = 8
_date$ = 12
_num$ = -40
_nb$ = -4
_i$ = -16
_i_hour$ = -8
_txt$ = -12
_sz$70364 = -44
_c$70395 = -52
_input_to_datetxt PROC NEAR

; 244  : {

	push	ebp
	mov	ebp, esp
	sub	esp, 60					; 0000003cH

; 245  : 	int num[6], nb, i, i_hour = -1;

	mov	DWORD PTR _i_hour$[ebp], -1

; 246  : 	char *txt = valdate;

	mov	eax, DWORD PTR _valdate$[ebp]
	mov	DWORD PTR _txt$[ebp], eax

; 247  : 
; 248  : 	if(!date) return 1;

	cmp	DWORD PTR _date$[ebp], 0
	jne	SHORT $L70358
	mov	eax, 1
	jmp	$L70352
$L70358:

; 249  : 	*date = 0;

	mov	ecx, DWORD PTR _date$[ebp]
	mov	BYTE PTR [ecx], 0

; 250  : 	if(!valdate || !*valdate) return 0;

	cmp	DWORD PTR _valdate$[ebp], 0
	je	SHORT $L70360
	mov	edx, DWORD PTR _valdate$[ebp]
	movsx	eax, BYTE PTR [edx]
	test	eax, eax
	jne	SHORT $L70359
$L70360:
	xor	eax, eax
	jmp	$L70352
$L70359:

; 251  : 	memset(num, 0, sizeof(num));

	push	24					; 00000018H
	push	0
	lea	ecx, DWORD PTR _num$[ebp]
	push	ecx
	call	_memset
	add	esp, 12					; 0000000cH

; 252  : 
; 253  : 
; 254  : 	/* Search for up to 6 numbers */
; 255  : 	for(i = 0; i < 6 && *txt; i++)

	mov	DWORD PTR _i$[ebp], 0
	jmp	SHORT $L70361
$L70362:
	mov	edx, DWORD PTR _i$[ebp]
	add	edx, 1
	mov	DWORD PTR _i$[ebp], edx
$L70361:
	cmp	DWORD PTR _i$[ebp], 6
	jge	$L70363
	mov	eax, DWORD PTR _txt$[ebp]
	movsx	ecx, BYTE PTR [eax]
	test	ecx, ecx
	je	$L70363
$L70366:

; 257  : 		int sz;
; 258  : 		while( (*txt && *txt < '0') || *txt > '9') txt++;

	mov	edx, DWORD PTR _txt$[ebp]
	movsx	eax, BYTE PTR [edx]
	test	eax, eax
	je	SHORT $L70369
	mov	ecx, DWORD PTR _txt$[ebp]
	movsx	edx, BYTE PTR [ecx]
	cmp	edx, 48					; 00000030H
	jl	SHORT $L70368
$L70369:
	mov	eax, DWORD PTR _txt$[ebp]
	movsx	ecx, BYTE PTR [eax]
	cmp	ecx, 57					; 00000039H
	jle	SHORT $L70367
$L70368:
	mov	edx, DWORD PTR _txt$[ebp]
	add	edx, 1
	mov	DWORD PTR _txt$[ebp], edx
	jmp	SHORT $L70366
$L70367:

; 259  : 		nb = sscanf(txt, "%d%n", &(num[i]), &sz);

	lea	eax, DWORD PTR _sz$70364[ebp]
	push	eax
	mov	ecx, DWORD PTR _i$[ebp]
	lea	edx, DWORD PTR _num$[ebp+ecx*4]
	push	edx
	push	OFFSET FLAT:$SG70370
	mov	eax, DWORD PTR _txt$[ebp]
	push	eax
	call	_sscanf
	add	esp, 16					; 00000010H
	mov	DWORD PTR _nb$[ebp], eax

; 260  : 		if(*txt) txt += nb ? sz : 1;

	mov	ecx, DWORD PTR _txt$[ebp]
	movsx	edx, BYTE PTR [ecx]
	test	edx, edx
	je	SHORT $L70371
	cmp	DWORD PTR _nb$[ebp], 0
	je	SHORT $L70959
	mov	eax, DWORD PTR _sz$70364[ebp]
	mov	DWORD PTR -56+[ebp], eax
	jmp	SHORT $L70960
$L70959:
	mov	DWORD PTR -56+[ebp], 1
$L70960:
	mov	ecx, DWORD PTR _txt$[ebp]
	add	ecx, DWORD PTR -56+[ebp]
	mov	DWORD PTR _txt$[ebp], ecx
$L70371:

; 261  : 		if(i_hour < 0 && *txt ==':') i_hour= i;

	cmp	DWORD PTR _i_hour$[ebp], 0
	jge	SHORT $L70372
	mov	edx, DWORD PTR _txt$[ebp]
	movsx	eax, BYTE PTR [edx]
	cmp	eax, 58					; 0000003aH
	jne	SHORT $L70372
	mov	ecx, DWORD PTR _i$[ebp]
	mov	DWORD PTR _i_hour$[ebp], ecx
$L70372:

; 262  : 	}

	jmp	$L70362
$L70363:

; 263  : 	nb = i;

	mov	edx, DWORD PTR _i$[ebp]
	mov	DWORD PTR _nb$[ebp], edx

; 264  : 
; 265  : 	/* Handle early hour separator */
; 266  : 	if(i_hour == 0 || i_hour == 1)

	cmp	DWORD PTR _i_hour$[ebp], 0
	je	SHORT $L70374
	cmp	DWORD PTR _i_hour$[ebp], 1
	jne	SHORT $L70375
$L70374:

; 268  : 		nb = 1;

	mov	DWORD PTR _nb$[ebp], 1

; 269  : 		num[3] = num[i_hour];

	mov	eax, DWORD PTR _i_hour$[ebp]
	mov	ecx, DWORD PTR _num$[ebp+eax*4]
	mov	DWORD PTR _num$[ebp+12], ecx

; 270  : 		num[4] = num[i_hour+1];

	mov	edx, DWORD PTR _i_hour$[ebp]
	mov	eax, DWORD PTR _num$[ebp+edx*4+4]
	mov	DWORD PTR _num$[ebp+16], eax

; 271  : 		num[5] = num[i_hour+1];

	mov	ecx, DWORD PTR _i_hour$[ebp]
	mov	edx, DWORD PTR _num$[ebp+ecx*4+4]
	mov	DWORD PTR _num$[ebp+20], edx

; 272  : 		if(i_hour == 0) sscanf(datetxt_now()+6, "%02d", &num[0]);

	cmp	DWORD PTR _i_hour$[ebp], 0
	jne	SHORT $L70375
	lea	eax, DWORD PTR _num$[ebp]
	push	eax
	push	OFFSET FLAT:$SG70376
	call	_datetxt_now
	add	eax, 6
	push	eax
	call	_sscanf
	add	esp, 12					; 0000000cH
$L70375:

; 274  : 
; 275  : 	/* Switch on # of numbers input */
; 276  : 	if(nb == 1 && num[0] >= 1 && num[0] <= 31)

	cmp	DWORD PTR _nb$[ebp], 1
	jne	SHORT $L70377
	cmp	DWORD PTR _num$[ebp], 1
	jl	SHORT $L70377
	cmp	DWORD PTR _num$[ebp], 31		; 0000001fH
	jg	SHORT $L70377

; 278  : 		/* One number in range 1-31 : treat as day of month */
; 279  : 		strncpy(date, datetxt_now(), 6);

	push	6
	call	_datetxt_now
	push	eax
	mov	ecx, DWORD PTR _date$[ebp]
	push	ecx
	call	_strncpy
	add	esp, 12					; 0000000cH

; 280  : 		sprintf(date+6, "%02d", num[0]);

	mov	edx, DWORD PTR _num$[ebp]
	push	edx
	push	OFFSET FLAT:$SG70378
	mov	eax, DWORD PTR _date$[ebp]
	add	eax, 6
	push	eax
	call	_sprintf
	add	esp, 12					; 0000000cH

; 282  : 	else if(nb == 1 && num[0] >= 100 && num[0] <= 9999)

	jmp	$L70400
$L70377:
	cmp	DWORD PTR _nb$[ebp], 1
	jne	SHORT $L70380
	cmp	DWORD PTR _num$[ebp], 100		; 00000064H
	jl	SHORT $L70380
	cmp	DWORD PTR _num$[ebp], 9999		; 0000270fH
	jg	SHORT $L70380

; 284  : 		/* One number in range 100-9999 : treat as year */
; 285  : 		sprintf(date, "%04d", num[0]);

	mov	ecx, DWORD PTR _num$[ebp]
	push	ecx
	push	OFFSET FLAT:$SG70381
	mov	edx, DWORD PTR _date$[ebp]
	push	edx
	call	_sprintf
	add	esp, 12					; 0000000cH

; 287  : 	else if(nb == 1 && num[0] >= 1000)

	jmp	$L70400
$L70380:
	cmp	DWORD PTR _nb$[ebp], 1
	jne	SHORT $L70383
	cmp	DWORD PTR _num$[ebp], 1000		; 000003e8H
	jl	SHORT $L70383

; 289  : 		/* One number over 999 : treat as literal datetxt */
; 290  : 		for(i = 0; valdate[i] && valdate[i] >= '0' && valdate[i] <= '9' && i < 14; i++) date[i] = valdate[i];

	mov	DWORD PTR _i$[ebp], 0
	jmp	SHORT $L70384
$L70385:
	mov	eax, DWORD PTR _i$[ebp]
	add	eax, 1
	mov	DWORD PTR _i$[ebp], eax
$L70384:
	mov	ecx, DWORD PTR _valdate$[ebp]
	add	ecx, DWORD PTR _i$[ebp]
	movsx	edx, BYTE PTR [ecx]
	test	edx, edx
	je	SHORT $L70386
	mov	eax, DWORD PTR _valdate$[ebp]
	add	eax, DWORD PTR _i$[ebp]
	movsx	ecx, BYTE PTR [eax]
	cmp	ecx, 48					; 00000030H
	jl	SHORT $L70386
	mov	edx, DWORD PTR _valdate$[ebp]
	add	edx, DWORD PTR _i$[ebp]
	movsx	eax, BYTE PTR [edx]
	cmp	eax, 57					; 00000039H
	jg	SHORT $L70386
	cmp	DWORD PTR _i$[ebp], 14			; 0000000eH
	jge	SHORT $L70386
	mov	ecx, DWORD PTR _date$[ebp]
	add	ecx, DWORD PTR _i$[ebp]
	mov	edx, DWORD PTR _valdate$[ebp]
	add	edx, DWORD PTR _i$[ebp]
	mov	al, BYTE PTR [edx]
	mov	BYTE PTR [ecx], al
	jmp	SHORT $L70385
$L70386:

; 291  : 		date[i] = 0;

	mov	ecx, DWORD PTR _date$[ebp]
	add	ecx, DWORD PTR _i$[ebp]
	mov	BYTE PTR [ecx], 0

; 293  : 	else if(nb == 2 && num[0] >= 1 && num[0] <= 31 && num[1] >= 1 && num[1] <= 12)

	jmp	$L70400
$L70383:
	cmp	DWORD PTR _nb$[ebp], 2
	jne	SHORT $L70388
	cmp	DWORD PTR _num$[ebp], 1
	jl	SHORT $L70388
	cmp	DWORD PTR _num$[ebp], 31		; 0000001fH
	jg	SHORT $L70388
	cmp	DWORD PTR _num$[ebp+4], 1
	jl	SHORT $L70388
	cmp	DWORD PTR _num$[ebp+4], 12		; 0000000cH
	jg	SHORT $L70388

; 295  : 		/* Two numbers in range 1-31 / 1-12 : treat as day / month */
; 296  : 		strncpy(date, datetxt_now(), 4);

	push	4
	call	_datetxt_now
	push	eax
	mov	edx, DWORD PTR _date$[ebp]
	push	edx
	call	_strncpy
	add	esp, 12					; 0000000cH

; 297  : 		sprintf(date+4, "%02d%02d", num[1], num[0]);

	mov	eax, DWORD PTR _num$[ebp]
	push	eax
	mov	ecx, DWORD PTR _num$[ebp+4]
	push	ecx
	push	OFFSET FLAT:$SG70389
	mov	edx, DWORD PTR _date$[ebp]
	add	edx, 4
	push	edx
	call	_sprintf
	add	esp, 16					; 00000010H

; 299  : 	else if(nb == 2 && num[0] >= 1 && num[0] <= 12 && num[1] >= 1000 && num[1] <= 9999)

	jmp	$L70400
$L70388:
	cmp	DWORD PTR _nb$[ebp], 2
	jne	SHORT $L70391
	cmp	DWORD PTR _num$[ebp], 1
	jl	SHORT $L70391
	cmp	DWORD PTR _num$[ebp], 12		; 0000000cH
	jg	SHORT $L70391
	cmp	DWORD PTR _num$[ebp+4], 1000		; 000003e8H
	jl	SHORT $L70391
	cmp	DWORD PTR _num$[ebp+4], 9999		; 0000270fH
	jg	SHORT $L70391

; 301  : 		/* Two numbers in range 1-12 / 1000-9999 : treat as month / year */
; 302  : 		sprintf(date, "%04d%02d", num[1], num[0]);

	mov	eax, DWORD PTR _num$[ebp]
	push	eax
	mov	ecx, DWORD PTR _num$[ebp+4]
	push	ecx
	push	OFFSET FLAT:$SG70392
	mov	edx, DWORD PTR _date$[ebp]
	push	edx
	call	_sprintf
	add	esp, 16					; 00000010H

; 304  : 	else if(nb >= 3 && num[0] >= 1 && num[0] <= 31 && num[1] >= 1 && num[1] <= 12)

	jmp	$L70400
$L70391:
	cmp	DWORD PTR _nb$[ebp], 3
	jl	$L70394
	cmp	DWORD PTR _num$[ebp], 1
	jl	$L70394
	cmp	DWORD PTR _num$[ebp], 31		; 0000001fH
	jg	$L70394
	cmp	DWORD PTR _num$[ebp+4], 1
	jl	$L70394
	cmp	DWORD PTR _num$[ebp+4], 12		; 0000000cH
	jg	$L70394

; 306  : 		/* Three or more numbers with first two in range 1-31 / 1-12 : treat as day / month / year */
; 307  : 		div_t c;
; 308  : 		sscanf(datetxt_now(), "%04d", &i);

	lea	eax, DWORD PTR _i$[ebp]
	push	eax
	push	OFFSET FLAT:$SG70396
	call	_datetxt_now
	push	eax
	call	_sscanf
	add	esp, 12					; 0000000cH

; 309  : 		c = div(i, 100);

	push	100					; 00000064H
	mov	ecx, DWORD PTR _i$[ebp]
	push	ecx
	call	_div
	add	esp, 8
	mov	DWORD PTR _c$70395[ebp], eax
	mov	DWORD PTR _c$70395[ebp+4], edx

; 310  : 
; 311  : 		/* Translate year under 100 to closest century */
; 312  : 		if(num[2] < 100) num[2] += 100 * (c.quot + (c.rem <= 50 ?

	cmp	DWORD PTR _num$[ebp+8], 100		; 00000064H
	jge	SHORT $L70397

; 313  : 													num[2] > c.rem + 50 ? -1 : 0 :
; 314  : 													num[2] < c.rem - 50 ? 1 : 0));

	cmp	DWORD PTR _c$70395[ebp+4], 50		; 00000032H
	jg	SHORT $L70961
	mov	edx, DWORD PTR _c$70395[ebp+4]
	add	edx, 50					; 00000032H
	xor	eax, eax
	cmp	DWORD PTR _num$[ebp+8], edx
	setle	al
	dec	eax
	mov	DWORD PTR -60+[ebp], eax
	jmp	SHORT $L70962
$L70961:
	mov	ecx, DWORD PTR _c$70395[ebp+4]
	sub	ecx, 50					; 00000032H
	xor	edx, edx
	cmp	DWORD PTR _num$[ebp+8], ecx
	setl	dl
	mov	DWORD PTR -60+[ebp], edx
$L70962:
	mov	eax, DWORD PTR _c$70395[ebp]
	add	eax, DWORD PTR -60+[ebp]
	imul	eax, 100				; 00000064H
	mov	ecx, DWORD PTR _num$[ebp+8]
	add	ecx, eax
	mov	DWORD PTR _num$[ebp+8], ecx
$L70397:

; 315  : 		sprintf(date, "%04d%02d%02d", num[2], num[1], num[0]);

	mov	edx, DWORD PTR _num$[ebp]
	push	edx
	mov	eax, DWORD PTR _num$[ebp+4]
	push	eax
	mov	ecx, DWORD PTR _num$[ebp+8]
	push	ecx
	push	OFFSET FLAT:$SG70398
	mov	edx, DWORD PTR _date$[ebp]
	push	edx
	call	_sprintf
	add	esp, 20					; 00000014H

; 317  : 	else if(nb >= 3 && num[0] >= 100 && num[0] <= 9999 && num[1] >= 1 && num[1] <= 12 && num[2] >= 1 && num[2] <= 31)

	jmp	SHORT $L70400
$L70394:
	cmp	DWORD PTR _nb$[ebp], 3
	jl	SHORT $L70400
	cmp	DWORD PTR _num$[ebp], 100		; 00000064H
	jl	SHORT $L70400
	cmp	DWORD PTR _num$[ebp], 9999		; 0000270fH
	jg	SHORT $L70400
	cmp	DWORD PTR _num$[ebp+4], 1
	jl	SHORT $L70400
	cmp	DWORD PTR _num$[ebp+4], 12		; 0000000cH
	jg	SHORT $L70400
	cmp	DWORD PTR _num$[ebp+8], 1
	jl	SHORT $L70400
	cmp	DWORD PTR _num$[ebp+8], 31		; 0000001fH
	jg	SHORT $L70400

; 319  : 		/* Three or more numbers in range 100-9999 / 1-12 / 1-31 : treat as year / month / day */
; 320  : 		sprintf(date, "%04d%02d%02d", num[0], num[1], num[2]);

	mov	eax, DWORD PTR _num$[ebp+8]
	push	eax
	mov	ecx, DWORD PTR _num$[ebp+4]
	push	ecx
	mov	edx, DWORD PTR _num$[ebp]
	push	edx
	push	OFFSET FLAT:$SG70401
	mov	eax, DWORD PTR _date$[ebp]
	push	eax
	call	_sprintf
	add	esp, 20					; 00000014H
$L70400:

; 322  : 
; 323  : 	/* Add time if given */
; 324  : 	if((nb > 3 || i_hour >= 0) && *date && num[3] < 24 && num[4] < 60 && num[5] < 60)

	cmp	DWORD PTR _nb$[ebp], 3
	jg	SHORT $L70403
	cmp	DWORD PTR _i_hour$[ebp], 0
	jl	SHORT $L70405
$L70403:
	mov	ecx, DWORD PTR _date$[ebp]
	movsx	edx, BYTE PTR [ecx]
	test	edx, edx
	je	SHORT $L70405
	cmp	DWORD PTR _num$[ebp+12], 24		; 00000018H
	jge	SHORT $L70405
	cmp	DWORD PTR _num$[ebp+16], 60		; 0000003cH
	jge	SHORT $L70405
	cmp	DWORD PTR _num$[ebp+20], 60		; 0000003cH
	jge	SHORT $L70405

; 326  : 		sprintf(date + 8, "%02d%02d", num[3], num[4]);

	mov	eax, DWORD PTR _num$[ebp+16]
	push	eax
	mov	ecx, DWORD PTR _num$[ebp+12]
	push	ecx
	push	OFFSET FLAT:$SG70404
	mov	edx, DWORD PTR _date$[ebp]
	add	edx, 8
	push	edx
	call	_sprintf
	add	esp, 16					; 00000010H

; 327  : 		if(num[5]) sprintf(date + 12, "%02d", num[5]);

	cmp	DWORD PTR _num$[ebp+20], 0
	je	SHORT $L70405
	mov	eax, DWORD PTR _num$[ebp+20]
	push	eax
	push	OFFSET FLAT:$SG70406
	mov	ecx, DWORD PTR _date$[ebp]
	add	ecx, 12					; 0000000cH
	push	ecx
	call	_sprintf
	add	esp, 12					; 0000000cH
$L70405:

; 329  : 
; 330  : 	/* Set return value */
; 331  : 	if(!*date) strncpy(date, valdate, 16);

	mov	edx, DWORD PTR _date$[ebp]
	movsx	eax, BYTE PTR [edx]
	test	eax, eax
	jne	SHORT $L70407
	push	16					; 00000010H
	mov	ecx, DWORD PTR _valdate$[ebp]
	push	ecx
	mov	edx, DWORD PTR _date$[ebp]
	push	edx
	call	_strncpy
	add	esp, 12					; 0000000cH
$L70407:

; 332  : 
; 333  : 	return datetxt_invalid(date);

	mov	eax, DWORD PTR _date$[ebp]
	push	eax
	call	_datetxt_invalid
	add	esp, 4
$L70352:

; 334  : }

	mov	esp, ebp
	pop	ebp
	ret	0
_input_to_datetxt ENDP
_TEXT	ENDS
PUBLIC	_datetxt_to_time
_BSS	SEGMENT
_?_dt@?1??datetxt_to_time@@9@9 DB 024H DUP (?)
_BSS	ENDS
_DATA	SEGMENT
	ORG $+3
$SG70424 DB	'%4u%2u%2u%2u%2u%2u', 00H
_DATA	ENDS
_TEXT	SEGMENT
_valdate$ = 8
_t$ = 12
_tmout$ = 16
_dt$ = -4
_len$ = -8
_datetxt_to_time PROC NEAR

; 344  : ){

	push	ebp
	mov	ebp, esp
	sub	esp, 12					; 0000000cH

; 345  : 	static struct tm _dt;
; 346  : 	struct tm *dt = tmout ? tmout : &_dt;

	cmp	DWORD PTR _tmout$[ebp], 0
	je	SHORT $L70964
	mov	eax, DWORD PTR _tmout$[ebp]
	mov	DWORD PTR -12+[ebp], eax
	jmp	SHORT $L70965
$L70964:
	mov	DWORD PTR -12+[ebp], OFFSET FLAT:_?_dt@?1??datetxt_to_time@@9@9
$L70965:
	mov	ecx, DWORD PTR -12+[ebp]
	mov	DWORD PTR _dt$[ebp], ecx

; 347  : 	size_t len;
; 348  : 
; 349  : 	/* Check parameters */
; 350  : 	if(!t) return 1;

	cmp	DWORD PTR _t$[ebp], 0
	jne	SHORT $L70419
	mov	eax, 1
	jmp	$L70414
$L70419:

; 351  : 	*t = (time_t)-1;

	mov	edx, DWORD PTR _t$[ebp]
	mov	DWORD PTR [edx], -1

; 352  : 	memset(dt, 0, sizeof(*dt));

	push	36					; 00000024H
	push	0
	mov	eax, DWORD PTR _dt$[ebp]
	push	eax
	call	_memset
	add	esp, 12					; 0000000cH

; 353  : 	if(!valdate || !*valdate) return 1;

	cmp	DWORD PTR _valdate$[ebp], 0
	je	SHORT $L70422
	mov	ecx, DWORD PTR _valdate$[ebp]
	movsx	edx, BYTE PTR [ecx]
	test	edx, edx
	jne	SHORT $L70421
$L70422:
	mov	eax, 1
	jmp	$L70414
$L70421:

; 354  : 	len = strlen(valdate);

	mov	eax, DWORD PTR _valdate$[ebp]
	push	eax
	call	_strlen
	add	esp, 4
	mov	DWORD PTR _len$[ebp], eax

; 355  : 	if(len < 4) return 1;

	cmp	DWORD PTR _len$[ebp], 4
	jae	SHORT $L70423
	mov	eax, 1
	jmp	$L70414
$L70423:

; 356  : 
; 357  : 	/* Convert date to Unix time */
; 358  : 	dt->tm_isdst = -1;

	mov	ecx, DWORD PTR _dt$[ebp]
	mov	DWORD PTR [ecx+32], -1

; 359  : 	dt->tm_mday = 1;

	mov	edx, DWORD PTR _dt$[ebp]
	mov	DWORD PTR [edx+12], 1

; 360  : 	sscanf(valdate, "%4u%2u%2u%2u%2u%2u",
; 361  : 					&dt->tm_year, &dt->tm_mon, &dt->tm_mday,
; 362  : 					&dt->tm_hour, &dt->tm_min, &dt->tm_sec);

	mov	eax, DWORD PTR _dt$[ebp]
	push	eax
	mov	ecx, DWORD PTR _dt$[ebp]
	add	ecx, 4
	push	ecx
	mov	edx, DWORD PTR _dt$[ebp]
	add	edx, 8
	push	edx
	mov	eax, DWORD PTR _dt$[ebp]
	add	eax, 12					; 0000000cH
	push	eax
	mov	ecx, DWORD PTR _dt$[ebp]
	add	ecx, 16					; 00000010H
	push	ecx
	mov	edx, DWORD PTR _dt$[ebp]
	add	edx, 20					; 00000014H
	push	edx
	push	OFFSET FLAT:$SG70424
	mov	eax, DWORD PTR _valdate$[ebp]
	push	eax
	call	_sscanf
	add	esp, 32					; 00000020H

; 363  : 	dt->tm_year -= 1900;

	mov	ecx, DWORD PTR _dt$[ebp]
	mov	edx, DWORD PTR [ecx+20]
	sub	edx, 1900				; 0000076cH
	mov	eax, DWORD PTR _dt$[ebp]
	mov	DWORD PTR [eax+20], edx

; 364  : 	if(dt->tm_mon) dt->tm_mon--;

	mov	ecx, DWORD PTR _dt$[ebp]
	cmp	DWORD PTR [ecx+16], 0
	je	SHORT $L70425
	mov	edx, DWORD PTR _dt$[ebp]
	mov	eax, DWORD PTR [edx+16]
	sub	eax, 1
	mov	ecx, DWORD PTR _dt$[ebp]
	mov	DWORD PTR [ecx+16], eax
$L70425:

; 365  : 	*t = mktime(dt);

	mov	edx, DWORD PTR _dt$[ebp]
	push	edx
	call	_mktime
	add	esp, 4
	mov	ecx, DWORD PTR _t$[ebp]
	mov	DWORD PTR [ecx], eax

; 366  : 
; 367  : 	return (*t == (time_t)-1);

	mov	edx, DWORD PTR _t$[ebp]
	xor	eax, eax
	cmp	DWORD PTR [edx], -1
	sete	al
$L70414:

; 368  : }

	mov	esp, ebp
	pop	ebp
	ret	0
_datetxt_to_time ENDP
_TEXT	ENDS
PUBLIC	_delay_to_datetxt
_DATA	SEGMENT
	ORG $+1
$SG70454 DB	'%4d%2d%2d%2d%2d%2d', 00H
	ORG $+1
$SG70463 DB	'%04d%02d%02d%02d%02d%02d', 00H
	ORG $+3
$SG70465 DB	'%04d%02d%02d%02d%02d', 00H
	ORG $+3
$SG70477 DB	'%04d%02d%02d', 00H
	ORG $+3
$SG70480 DB	'%02d%02d%02d', 00H
	ORG $+3
$SG70501 DB	'%04d%02d%02d', 00H
	ORG $+3
$SG70504 DB	'%02d%02d%02d', 00H
	ORG $+3
$SG70510 DB	'%04d%02d%02d', 00H
	ORG $+3
$SG70513 DB	'%02d%02d%02d', 00H
	ORG $+3
$SG70515 DB	'%04d%02d%02d', 00H
	ORG $+3
$SG70518 DB	'%02d%02d%02d', 00H
_DATA	ENDS
_TEXT	SEGMENT
_date$ = 8
_date_ref$ = 12
_delay$ = 16
_fmt$ = 20
_Y0$ = -44
_M0$ = -36
_D0$ = -16
_h0$ = -24
_m0$ = -88
_s0$ = -4
_Y1$ = -84
_M1$ = -40
_D1$ = -20
_h1$ = -32
_m1$ = -92
_s1$ = -12
_t$ = -8
_dt$ = -80
_b_errtime$ = -28
_t1$70467 = -96
_t1$70483 = -104
_b_notime$70484 = -100
_dy$70489 = -120
_dm$70490 = -112
_dy$70506 = -128
_delay_to_datetxt PROC NEAR

; 379  : ){

	push	ebp
	mov	ebp, esp
	sub	esp, 140				; 0000008cH

; 380  : 
; 381  : 	int Y0=0, M0=0, D0=0, h0=0, m0=0, s0=0, Y1=0, M1=0, D1=0, h1=0, m1=0, s1=0;

	mov	DWORD PTR _Y0$[ebp], 0
	mov	DWORD PTR _M0$[ebp], 0
	mov	DWORD PTR _D0$[ebp], 0
	mov	DWORD PTR _h0$[ebp], 0
	mov	DWORD PTR _m0$[ebp], 0
	mov	DWORD PTR _s0$[ebp], 0
	mov	DWORD PTR _Y1$[ebp], 0
	mov	DWORD PTR _M1$[ebp], 0
	mov	DWORD PTR _D1$[ebp], 0
	mov	DWORD PTR _h1$[ebp], 0
	mov	DWORD PTR _m1$[ebp], 0
	mov	DWORD PTR _s1$[ebp], 0

; 382  : 	time_t t = 0;

	mov	DWORD PTR _t$[ebp], 0

; 383  : 	struct tm dt;
; 384  : 	int b_errtime;
; 385  : 
; 386  : 	/* Check & initialize params */
; 387  : 	if(!date) return 1;

	cmp	DWORD PTR _date$[ebp], 0
	jne	SHORT $L70451
	mov	eax, 1
	jmp	$L70435
$L70451:

; 388  : 	if(!date_ref || !*date_ref) date_ref = datetxt_now();

	cmp	DWORD PTR _date_ref$[ebp], 0
	je	SHORT $L70453
	mov	eax, DWORD PTR _date_ref$[ebp]
	movsx	ecx, BYTE PTR [eax]
	test	ecx, ecx
	jne	SHORT $L70452
$L70453:
	call	_datetxt_now
	mov	DWORD PTR _date_ref$[ebp], eax
$L70452:

; 389  : 
; 390  : 	/* Parse reference date */
; 391  : 	sscanf(date_ref, "%4d%2d%2d%2d%2d%2d", &Y1, &M1, &D1, &h1, &m1, &s1);

	lea	edx, DWORD PTR _s1$[ebp]
	push	edx
	lea	eax, DWORD PTR _m1$[ebp]
	push	eax
	lea	ecx, DWORD PTR _h1$[ebp]
	push	ecx
	lea	edx, DWORD PTR _D1$[ebp]
	push	edx
	lea	eax, DWORD PTR _M1$[ebp]
	push	eax
	lea	ecx, DWORD PTR _Y1$[ebp]
	push	ecx
	push	OFFSET FLAT:$SG70454
	mov	edx, DWORD PTR _date_ref$[ebp]
	push	edx
	call	_sscanf
	add	esp, 32					; 00000020H

; 392  : 	b_errtime = datetxt_to_time(date_ref, &t, &dt);

	lea	eax, DWORD PTR _dt$[ebp]
	push	eax
	lea	ecx, DWORD PTR _t$[ebp]
	push	ecx
	mov	edx, DWORD PTR _date_ref$[ebp]
	push	edx
	call	_datetxt_to_time
	add	esp, 12					; 0000000cH
	mov	DWORD PTR _b_errtime$[ebp], eax

; 393  : 	*date = 0;

	mov	eax, DWORD PTR _date$[ebp]
	mov	BYTE PTR [eax], 0

; 394  : 	if(Y1 < 100) return 1;

	cmp	DWORD PTR _Y1$[ebp], 100		; 00000064H
	jge	SHORT $L70455
	mov	eax, 1
	jmp	$L70435
$L70455:

; 395  : 	if(!M1) M1 = 1;

	cmp	DWORD PTR _M1$[ebp], 0
	jne	SHORT $L70456
	mov	DWORD PTR _M1$[ebp], 1
$L70456:

; 396  : 	if(!D1) D1 = 1;

	cmp	DWORD PTR _D1$[ebp], 0
	jne	SHORT $L70457
	mov	DWORD PTR _D1$[ebp], 1
$L70457:

; 397  : 
; 398  : 	/* Start from date_ref */
; 399  : 	D0 = D1;

	mov	ecx, DWORD PTR _D1$[ebp]
	mov	DWORD PTR _D0$[ebp], ecx

; 400  : 	M0 = M1;

	mov	edx, DWORD PTR _M1$[ebp]
	mov	DWORD PTR _M0$[ebp], edx

; 401  : 	Y0 = Y1;

	mov	eax, DWORD PTR _Y1$[ebp]
	mov	DWORD PTR _Y0$[ebp], eax

; 402  : 	h0 = h1;

	mov	ecx, DWORD PTR _h1$[ebp]
	mov	DWORD PTR _h0$[ebp], ecx

; 403  : 	m0 = m1;

	mov	edx, DWORD PTR _m1$[ebp]
	mov	DWORD PTR _m0$[ebp], edx

; 404  : 	s0 = s1;

	mov	eax, DWORD PTR _s1$[ebp]
	mov	DWORD PTR _s0$[ebp], eax

; 405  : 
; 406  : 	/* Compute date depending on delay unit */
; 407  : 	switch(fmt)
; 408  : 	{

	movsx	ecx, BYTE PTR _fmt$[ebp]
	mov	DWORD PTR -132+[ebp], ecx
	mov	edx, DWORD PTR -132+[ebp]
	sub	edx, 68					; 00000044H
	mov	DWORD PTR -132+[ebp], edx
	cmp	DWORD PTR -132+[ebp], 47		; 0000002fH
	ja	$L70514
	mov	ecx, DWORD PTR -132+[ebp]
	xor	eax, eax
	mov	al, BYTE PTR $L70971[ecx]
	jmp	DWORD PTR $L70972[eax*4]
$L70462:

; 409  : 	case 's':
; 410  : 		sprintf(date, "%04d%02d%02d%02d%02d%02d", Y0, M0, D0, h0, m0, s0);

	mov	edx, DWORD PTR _s0$[ebp]
	push	edx
	mov	eax, DWORD PTR _m0$[ebp]
	push	eax
	mov	ecx, DWORD PTR _h0$[ebp]
	push	ecx
	mov	edx, DWORD PTR _D0$[ebp]
	push	edx
	mov	eax, DWORD PTR _M0$[ebp]
	push	eax
	mov	ecx, DWORD PTR _Y0$[ebp]
	push	ecx
	push	OFFSET FLAT:$SG70463
	mov	edx, DWORD PTR _date$[ebp]
	push	edx
	call	_sprintf
	add	esp, 32					; 00000020H

; 411  : 		break;

	jmp	$L70459
$L70464:

; 412  : 
; 413  : 
; 414  : 	case 'm':
; 415  : 		sprintf(date, "%04d%02d%02d%02d%02d", Y0, M0, D0, h0, m0);

	mov	eax, DWORD PTR _m0$[ebp]
	push	eax
	mov	ecx, DWORD PTR _h0$[ebp]
	push	ecx
	mov	edx, DWORD PTR _D0$[ebp]
	push	edx
	mov	eax, DWORD PTR _M0$[ebp]
	push	eax
	mov	ecx, DWORD PTR _Y0$[ebp]
	push	ecx
	push	OFFSET FLAT:$SG70465
	mov	edx, DWORD PTR _date$[ebp]
	push	edx
	call	_sprintf
	add	esp, 28					; 0000001cH

; 416  : 		break;

	jmp	$L70459
$L70466:

; 420  : 			/* Try computation with unix time */
; 421  : 			time_t t1 = (time_t)-1;

	mov	DWORD PTR _t1$70467[ebp], -1

; 422  : 			dt.tm_hour += delay;

	mov	eax, DWORD PTR _dt$[ebp+8]
	add	eax, DWORD PTR _delay$[ebp]
	mov	DWORD PTR _dt$[ebp+8], eax

; 423  : 
; 424  : 			if(!b_errtime) t1 = mktime(&dt);

	cmp	DWORD PTR _b_errtime$[ebp], 0
	jne	SHORT $L70469
	lea	ecx, DWORD PTR _dt$[ebp]
	push	ecx
	call	_mktime
	add	esp, 4
	mov	DWORD PTR _t1$70467[ebp], eax
$L70469:

; 425  : 			if(b_errtime || t1 == (time_t)-1 || time_to_datetxt(t1, date))

	cmp	DWORD PTR _b_errtime$[ebp], 0
	jne	SHORT $L70472
	cmp	DWORD PTR _t1$70467[ebp], -1
	je	SHORT $L70472
	mov	edx, DWORD PTR _date$[ebp]
	push	edx
	mov	eax, DWORD PTR _t1$70467[ebp]
	push	eax
	call	_time_to_datetxt
	add	esp, 8
	test	eax, eax
	je	$L70478
$L70472:

; 427  : 				/* Use approximate computation */
; 428  : 
; 429  : 				/* Ensure valid date */
; 430  : 				ENSURE_VALID_DATE;

	cmp	DWORD PTR _M0$[ebp], 2
	jne	SHORT $L70473
	cmp	DWORD PTR _D0$[ebp], 28			; 0000001cH
	jle	SHORT $L70473
	mov	ecx, DWORD PTR _M0$[ebp]
	add	ecx, 1
	mov	DWORD PTR _M0$[ebp], ecx
	mov	edx, DWORD PTR _D0$[ebp]
	sub	edx, 28					; 0000001cH
	mov	DWORD PTR _D0$[ebp], edx
	jmp	SHORT $L70475
$L70473:
	cmp	DWORD PTR _M0$[ebp], 4
	je	SHORT $L70476
	cmp	DWORD PTR _M0$[ebp], 6
	je	SHORT $L70476
	cmp	DWORD PTR _M0$[ebp], 9
	je	SHORT $L70476
	cmp	DWORD PTR _M0$[ebp], 11			; 0000000bH
	jne	SHORT $L70475
$L70476:
	cmp	DWORD PTR _D0$[ebp], 30			; 0000001eH
	jle	SHORT $L70475
	mov	eax, DWORD PTR _M0$[ebp]
	add	eax, 1
	mov	DWORD PTR _M0$[ebp], eax
	mov	DWORD PTR _D0$[ebp], 1
$L70475:

; 431  : 				sprintf(date, "%04d%02d%02d", Y0, M0, D0);

	mov	ecx, DWORD PTR _D0$[ebp]
	push	ecx
	mov	edx, DWORD PTR _M0$[ebp]
	push	edx
	mov	eax, DWORD PTR _Y0$[ebp]
	push	eax
	push	OFFSET FLAT:$SG70477
	mov	ecx, DWORD PTR _date$[ebp]
	push	ecx
	call	_sprintf
	add	esp, 20					; 00000014H

; 432  : 				if(h0 || m0 || s0) sprintf(date+8, "%02d%02d%02d", h0, m0, s0);

	cmp	DWORD PTR _h0$[ebp], 0
	jne	SHORT $L70479
	cmp	DWORD PTR _m0$[ebp], 0
	jne	SHORT $L70479
	cmp	DWORD PTR _s0$[ebp], 0
	je	SHORT $L70478
$L70479:
	mov	edx, DWORD PTR _s0$[ebp]
	push	edx
	mov	eax, DWORD PTR _m0$[ebp]
	push	eax
	mov	ecx, DWORD PTR _h0$[ebp]
	push	ecx
	push	OFFSET FLAT:$SG70480
	mov	edx, DWORD PTR _date$[ebp]
	add	edx, 8
	push	edx
	call	_sprintf
	add	esp, 20					; 00000014H
$L70478:

; 435  : 		break;

	jmp	$L70459
$L70481:

; 439  : 			/* Try computation with unix time */
; 440  : 			if(!b_errtime)

	cmp	DWORD PTR _b_errtime$[ebp], 0
	jne	$L70487

; 442  : 				time_t t1;
; 443  : 				int b_notime = !dt.tm_hour && !dt.tm_min && !dt.tm_sec;

	cmp	DWORD PTR _dt$[ebp+8], 0
	jne	SHORT $L70967
	cmp	DWORD PTR _dt$[ebp+4], 0
	jne	SHORT $L70967
	cmp	DWORD PTR _dt$[ebp], 0
	jne	SHORT $L70967
	mov	DWORD PTR -136+[ebp], 1
	jmp	SHORT $L70968
$L70967:
	mov	DWORD PTR -136+[ebp], 0
$L70968:
	mov	eax, DWORD PTR -136+[ebp]
	mov	DWORD PTR _b_notime$70484[ebp], eax

; 444  : 				dt.tm_mday += delay;

	mov	ecx, DWORD PTR _dt$[ebp+12]
	add	ecx, DWORD PTR _delay$[ebp]
	mov	DWORD PTR _dt$[ebp+12], ecx

; 445  : 				if(b_notime) dt.tm_hour = 1;

	cmp	DWORD PTR _b_notime$70484[ebp], 0
	je	SHORT $L70485
	mov	DWORD PTR _dt$[ebp+8], 1
$L70485:

; 446  : 				t1 = mktime(&dt);

	lea	edx, DWORD PTR _dt$[ebp]
	push	edx
	call	_mktime
	add	esp, 4
	mov	DWORD PTR _t1$70483[ebp], eax

; 447  : 				b_errtime = t1 == (time_t)-1 || time_to_datetxt(t1, date);

	cmp	DWORD PTR _t1$70483[ebp], -1
	je	SHORT $L70969
	mov	eax, DWORD PTR _date$[ebp]
	push	eax
	mov	ecx, DWORD PTR _t1$70483[ebp]
	push	ecx
	call	_time_to_datetxt
	add	esp, 8
	test	eax, eax
	jne	SHORT $L70969
	mov	DWORD PTR -140+[ebp], 0
	jmp	SHORT $L70970
$L70969:
	mov	DWORD PTR -140+[ebp], 1
$L70970:
	mov	edx, DWORD PTR -140+[ebp]
	mov	DWORD PTR _b_errtime$[ebp], edx

; 448  : 				if(b_notime) date[8] = 0;

	cmp	DWORD PTR _b_notime$70484[ebp], 0
	je	SHORT $L70487
	mov	eax, DWORD PTR _date$[ebp]
	mov	BYTE PTR [eax+8], 0
$L70487:

; 450  : 			if(b_errtime)

	cmp	DWORD PTR _b_errtime$[ebp], 0
	je	$L70502

; 452  : 				/* Use approximate computation (365 days / year) */
; 453  : 				div_t dy = div(delay, 365);

	push	365					; 0000016dH
	mov	ecx, DWORD PTR _delay$[ebp]
	push	ecx
	call	_div
	add	esp, 8
	mov	DWORD PTR _dy$70489[ebp], eax
	mov	DWORD PTR _dy$70489[ebp+4], edx

; 454  : 				div_t dm = div(dy.rem, 12);

	push	12					; 0000000cH
	mov	edx, DWORD PTR _dy$70489[ebp+4]
	push	edx
	call	_div
	add	esp, 8
	mov	DWORD PTR _dm$70490[ebp], eax
	mov	DWORD PTR _dm$70490[ebp+4], edx

; 455  : 				D0 += dm.rem;

	mov	eax, DWORD PTR _D0$[ebp]
	add	eax, DWORD PTR _dm$70490[ebp+4]
	mov	DWORD PTR _D0$[ebp], eax

; 456  : 				if(D0 < 1) { D0 += 30; M0--; }

	cmp	DWORD PTR _D0$[ebp], 1
	jge	SHORT $L70491
	mov	ecx, DWORD PTR _D0$[ebp]
	add	ecx, 30					; 0000001eH
	mov	DWORD PTR _D0$[ebp], ecx
	mov	edx, DWORD PTR _M0$[ebp]
	sub	edx, 1
	mov	DWORD PTR _M0$[ebp], edx

; 457  : 				else if(D0 > 30) { D0 -= 30; M0++; }

	jmp	SHORT $L70493
$L70491:
	cmp	DWORD PTR _D0$[ebp], 30			; 0000001eH
	jle	SHORT $L70493
	mov	eax, DWORD PTR _D0$[ebp]
	sub	eax, 30					; 0000001eH
	mov	DWORD PTR _D0$[ebp], eax
	mov	ecx, DWORD PTR _M0$[ebp]
	add	ecx, 1
	mov	DWORD PTR _M0$[ebp], ecx
$L70493:

; 458  : 				M0 += dm.quot;

	mov	edx, DWORD PTR _M0$[ebp]
	add	edx, DWORD PTR _dm$70490[ebp]
	mov	DWORD PTR _M0$[ebp], edx

; 459  : 				if(M0 < 1) { M0 += 12; Y0--; }

	cmp	DWORD PTR _M0$[ebp], 1
	jge	SHORT $L70494
	mov	eax, DWORD PTR _M0$[ebp]
	add	eax, 12					; 0000000cH
	mov	DWORD PTR _M0$[ebp], eax
	mov	ecx, DWORD PTR _Y0$[ebp]
	sub	ecx, 1
	mov	DWORD PTR _Y0$[ebp], ecx

; 460  : 				else if(M0 > 12) { M0 -= 12; Y0++; }

	jmp	SHORT $L70496
$L70494:
	cmp	DWORD PTR _M0$[ebp], 12			; 0000000cH
	jle	SHORT $L70496
	mov	edx, DWORD PTR _M0$[ebp]
	sub	edx, 12					; 0000000cH
	mov	DWORD PTR _M0$[ebp], edx
	mov	eax, DWORD PTR _Y0$[ebp]
	add	eax, 1
	mov	DWORD PTR _Y0$[ebp], eax
$L70496:

; 461  : 				Y0 += dy.quot;

	mov	ecx, DWORD PTR _Y0$[ebp]
	add	ecx, DWORD PTR _dy$70489[ebp]
	mov	DWORD PTR _Y0$[ebp], ecx

; 462  : 
; 463  : 				/* Ensure valid date */
; 464  : 				ENSURE_VALID_DATE;

	cmp	DWORD PTR _M0$[ebp], 2
	jne	SHORT $L70497
	cmp	DWORD PTR _D0$[ebp], 28			; 0000001cH
	jle	SHORT $L70497
	mov	edx, DWORD PTR _M0$[ebp]
	add	edx, 1
	mov	DWORD PTR _M0$[ebp], edx
	mov	eax, DWORD PTR _D0$[ebp]
	sub	eax, 28					; 0000001cH
	mov	DWORD PTR _D0$[ebp], eax
	jmp	SHORT $L70499
$L70497:
	cmp	DWORD PTR _M0$[ebp], 4
	je	SHORT $L70500
	cmp	DWORD PTR _M0$[ebp], 6
	je	SHORT $L70500
	cmp	DWORD PTR _M0$[ebp], 9
	je	SHORT $L70500
	cmp	DWORD PTR _M0$[ebp], 11			; 0000000bH
	jne	SHORT $L70499
$L70500:
	cmp	DWORD PTR _D0$[ebp], 30			; 0000001eH
	jle	SHORT $L70499
	mov	ecx, DWORD PTR _M0$[ebp]
	add	ecx, 1
	mov	DWORD PTR _M0$[ebp], ecx
	mov	DWORD PTR _D0$[ebp], 1
$L70499:

; 465  : 				sprintf(date, "%04d%02d%02d", Y0, M0, D0);

	mov	edx, DWORD PTR _D0$[ebp]
	push	edx
	mov	eax, DWORD PTR _M0$[ebp]
	push	eax
	mov	ecx, DWORD PTR _Y0$[ebp]
	push	ecx
	push	OFFSET FLAT:$SG70501
	mov	edx, DWORD PTR _date$[ebp]
	push	edx
	call	_sprintf
	add	esp, 20					; 00000014H

; 466  : 				if(h0 || m0 || s0) sprintf(date+8, "%02d%02d%02d", h0, m0, s0);

	cmp	DWORD PTR _h0$[ebp], 0
	jne	SHORT $L70503
	cmp	DWORD PTR _m0$[ebp], 0
	jne	SHORT $L70503
	cmp	DWORD PTR _s0$[ebp], 0
	je	SHORT $L70502
$L70503:
	mov	eax, DWORD PTR _s0$[ebp]
	push	eax
	mov	ecx, DWORD PTR _m0$[ebp]
	push	ecx
	mov	edx, DWORD PTR _h0$[ebp]
	push	edx
	push	OFFSET FLAT:$SG70504
	mov	eax, DWORD PTR _date$[ebp]
	add	eax, 8
	push	eax
	call	_sprintf
	add	esp, 20					; 00000014H
$L70502:

; 469  : 		break;

	jmp	$L70459
$L70505:

; 474  : 			div_t dy = div(delay, 12);

	push	12					; 0000000cH
	mov	ecx, DWORD PTR _delay$[ebp]
	push	ecx
	call	_div
	add	esp, 8
	mov	DWORD PTR _dy$70506[ebp], eax
	mov	DWORD PTR _dy$70506[ebp+4], edx

; 475  : 			M0 += dy.rem;

	mov	edx, DWORD PTR _M0$[ebp]
	add	edx, DWORD PTR _dy$70506[ebp+4]
	mov	DWORD PTR _M0$[ebp], edx

; 476  : 			if(M0 < 1) { M0 += 12; Y0--; }

	cmp	DWORD PTR _M0$[ebp], 1
	jge	SHORT $L70507
	mov	eax, DWORD PTR _M0$[ebp]
	add	eax, 12					; 0000000cH
	mov	DWORD PTR _M0$[ebp], eax
	mov	ecx, DWORD PTR _Y0$[ebp]
	sub	ecx, 1
	mov	DWORD PTR _Y0$[ebp], ecx

; 477  : 			else if(M0 > 12) { M0 -= 12; Y0++; }

	jmp	SHORT $L70509
$L70507:
	cmp	DWORD PTR _M0$[ebp], 12			; 0000000cH
	jle	SHORT $L70509
	mov	edx, DWORD PTR _M0$[ebp]
	sub	edx, 12					; 0000000cH
	mov	DWORD PTR _M0$[ebp], edx
	mov	eax, DWORD PTR _Y0$[ebp]
	add	eax, 1
	mov	DWORD PTR _Y0$[ebp], eax
$L70509:

; 478  : 			Y0 += dy.quot;

	mov	ecx, DWORD PTR _Y0$[ebp]
	add	ecx, DWORD PTR _dy$70506[ebp]
	mov	DWORD PTR _Y0$[ebp], ecx

; 479  : 			sprintf(date, "%04d%02d%02d", Y0, M0, D0);

	mov	edx, DWORD PTR _D0$[ebp]
	push	edx
	mov	eax, DWORD PTR _M0$[ebp]
	push	eax
	mov	ecx, DWORD PTR _Y0$[ebp]
	push	ecx
	push	OFFSET FLAT:$SG70510
	mov	edx, DWORD PTR _date$[ebp]
	push	edx
	call	_sprintf
	add	esp, 20					; 00000014H

; 480  : 			if(h0 || m0 || s0) sprintf(date+8, "%02d%02d%02d", h0, m0, s0);

	cmp	DWORD PTR _h0$[ebp], 0
	jne	SHORT $L70512
	cmp	DWORD PTR _m0$[ebp], 0
	jne	SHORT $L70512
	cmp	DWORD PTR _s0$[ebp], 0
	je	SHORT $L70511
$L70512:
	mov	eax, DWORD PTR _s0$[ebp]
	push	eax
	mov	ecx, DWORD PTR _m0$[ebp]
	push	ecx
	mov	edx, DWORD PTR _h0$[ebp]
	push	edx
	push	OFFSET FLAT:$SG70513
	mov	eax, DWORD PTR _date$[ebp]
	add	eax, 8
	push	eax
	call	_sprintf
	add	esp, 20					; 00000014H
$L70511:

; 481  : 			break;

	jmp	SHORT $L70459
$L70514:

; 483  : 
; 484  : 	default:
; 485  : 		Y0 += delay;

	mov	ecx, DWORD PTR _Y0$[ebp]
	add	ecx, DWORD PTR _delay$[ebp]
	mov	DWORD PTR _Y0$[ebp], ecx

; 486  : 		sprintf(date, "%04d%02d%02d", Y0, M0, D0);

	mov	edx, DWORD PTR _D0$[ebp]
	push	edx
	mov	eax, DWORD PTR _M0$[ebp]
	push	eax
	mov	ecx, DWORD PTR _Y0$[ebp]
	push	ecx
	push	OFFSET FLAT:$SG70515
	mov	edx, DWORD PTR _date$[ebp]
	push	edx
	call	_sprintf
	add	esp, 20					; 00000014H

; 487  : 		if(h0 || m0 || s0) sprintf(date+8, "%02d%02d%02d", h0, m0, s0);

	cmp	DWORD PTR _h0$[ebp], 0
	jne	SHORT $L70517
	cmp	DWORD PTR _m0$[ebp], 0
	jne	SHORT $L70517
	cmp	DWORD PTR _s0$[ebp], 0
	je	SHORT $L70516
$L70517:
	mov	eax, DWORD PTR _s0$[ebp]
	push	eax
	mov	ecx, DWORD PTR _m0$[ebp]
	push	ecx
	mov	edx, DWORD PTR _h0$[ebp]
	push	edx
	push	OFFSET FLAT:$SG70518
	mov	eax, DWORD PTR _date$[ebp]
	add	eax, 8
	push	eax
	call	_sprintf
	add	esp, 20					; 00000014H
$L70516:
$L70459:

; 489  : 
; 490  : 	return 0;

	xor	eax, eax
$L70435:

; 491  : }

	mov	esp, ebp
	pop	ebp
	ret	0
$L70972:
	DD	$L70481
	DD	$L70505
	DD	$L70466
	DD	$L70464
	DD	$L70462
	DD	$L70514
$L70971:
	DB	0
	DB	5
	DB	5
	DB	5
	DB	5
	DB	5
	DB	5
	DB	5
	DB	5
	DB	1
	DB	5
	DB	5
	DB	5
	DB	5
	DB	5
	DB	5
	DB	5
	DB	5
	DB	5
	DB	5
	DB	5
	DB	5
	DB	5
	DB	5
	DB	5
	DB	5
	DB	5
	DB	5
	DB	5
	DB	5
	DB	5
	DB	5
	DB	5
	DB	5
	DB	5
	DB	5
	DB	2
	DB	5
	DB	5
	DB	5
	DB	5
	DB	3
	DB	5
	DB	5
	DB	5
	DB	5
	DB	5
	DB	4
_delay_to_datetxt ENDP
_TEXT	ENDS
PUBLIC	_datetxt_time
_DATA	SEGMENT
	ORG $+3
$SG70532 DB	'00', 00H
	ORG $+1
$SG70533 DB	'00', 00H
	ORG $+1
$SG70534 DB	' %.2s:%.2s', 00H
	ORG $+1
$SG70536 DB	'00', 00H
	ORG $+1
$SG70537 DB	':%.2s', 00H
_DATA	ENDS
_TEXT	SEGMENT
_date_out$ = 8
_date$ = 12
_len$ = 16
_outlen$ = 20
_sz$ = -4
_datetxt_time PROC NEAR

; 502  : ){

	push	ebp
	mov	ebp, esp
	sub	esp, 16					; 00000010H

; 503  : 	size_t sz = 0;

	mov	DWORD PTR _sz$[ebp], 0

; 504  : 	if(!outlen) outlen = len;

	cmp	DWORD PTR _outlen$[ebp], 0
	jne	SHORT $L70530
	mov	eax, DWORD PTR _len$[ebp]
	mov	DWORD PTR _outlen$[ebp], eax
$L70530:

; 505  : 	if(outlen > 8) sz += sprintf(date_out, " %.2s:%.2s", len > 8 ? date+8 : "00", len > 10 ? date+10 : "00");

	cmp	DWORD PTR _outlen$[ebp], 8
	jbe	SHORT $L70531
	cmp	DWORD PTR _len$[ebp], 10		; 0000000aH
	jbe	SHORT $L70974
	mov	ecx, DWORD PTR _date$[ebp]
	add	ecx, 10					; 0000000aH
	mov	DWORD PTR -8+[ebp], ecx
	jmp	SHORT $L70975
$L70974:
	mov	DWORD PTR -8+[ebp], OFFSET FLAT:$SG70532
$L70975:
	cmp	DWORD PTR _len$[ebp], 8
	jbe	SHORT $L70976
	mov	edx, DWORD PTR _date$[ebp]
	add	edx, 8
	mov	DWORD PTR -12+[ebp], edx
	jmp	SHORT $L70977
$L70976:
	mov	DWORD PTR -12+[ebp], OFFSET FLAT:$SG70533
$L70977:
	mov	eax, DWORD PTR -8+[ebp]
	push	eax
	mov	ecx, DWORD PTR -12+[ebp]
	push	ecx
	push	OFFSET FLAT:$SG70534
	mov	edx, DWORD PTR _date_out$[ebp]
	push	edx
	call	_sprintf
	add	esp, 16					; 00000010H
	mov	ecx, DWORD PTR _sz$[ebp]
	add	ecx, eax
	mov	DWORD PTR _sz$[ebp], ecx
$L70531:

; 506  : 	if(outlen > 12) sz += sprintf(date_out + sz, ":%.2s", len > 12 ? date+12 : "00");

	cmp	DWORD PTR _outlen$[ebp], 12		; 0000000cH
	jbe	SHORT $L70535
	cmp	DWORD PTR _len$[ebp], 12		; 0000000cH
	jbe	SHORT $L70978
	mov	edx, DWORD PTR _date$[ebp]
	add	edx, 12					; 0000000cH
	mov	DWORD PTR -16+[ebp], edx
	jmp	SHORT $L70979
$L70978:
	mov	DWORD PTR -16+[ebp], OFFSET FLAT:$SG70536
$L70979:
	mov	eax, DWORD PTR -16+[ebp]
	push	eax
	push	OFFSET FLAT:$SG70537
	mov	ecx, DWORD PTR _date_out$[ebp]
	add	ecx, DWORD PTR _sz$[ebp]
	push	ecx
	call	_sprintf
	add	esp, 12					; 0000000cH
	mov	edx, DWORD PTR _sz$[ebp]
	add	edx, eax
	mov	DWORD PTR _sz$[ebp], edx
$L70535:

; 507  : 	return sz;

	mov	eax, DWORD PTR _sz$[ebp]

; 508  : }

	mov	esp, ebp
	pop	ebp
	ret	0
_datetxt_time ENDP
_TEXT	ENDS
PUBLIC	_datetxt_to_numbers
_DATA	SEGMENT
	ORG $+2
$SG70552 DB	'%.4s', 00H
	ORG $+3
$SG70555 DB	'01', 00H
	ORG $+1
$SG70556 DB	'%.2s/%.4s', 00H
	ORG $+2
$SG70559 DB	'01', 00H
	ORG $+1
$SG70560 DB	'01', 00H
	ORG $+1
$SG70561 DB	'%.2s/%.2s/%.2s', 00H
	ORG $+1
$SG70562 DB	'%.2s/%.2s/%.4s', 00H
_DATA	ENDS
_TEXT	SEGMENT
_date_out$ = 8
_date$ = 12
_len$ = 16
_b_year2$ = 20
_outlen$ = 24
_sz$70558 = -4
_datetxt_to_numbers PROC NEAR

; 520  : ){

	push	ebp
	mov	ebp, esp
	sub	esp, 24					; 00000018H

; 521  : 	if(!outlen) outlen = len;

	cmp	DWORD PTR _outlen$[ebp], 0
	jne	SHORT $L70550
	mov	eax, DWORD PTR _len$[ebp]
	mov	DWORD PTR _outlen$[ebp], eax
$L70550:

; 522  : 
; 523  : 	/* Handle short date formats */
; 524  : 	if(outlen <= 4)

	cmp	DWORD PTR _outlen$[ebp], 4
	ja	SHORT $L70551

; 526  : 		sprintf(date_out, "%.4s", date);

	mov	ecx, DWORD PTR _date$[ebp]
	push	ecx
	push	OFFSET FLAT:$SG70552
	mov	edx, DWORD PTR _date_out$[ebp]
	push	edx
	call	_sprintf
	add	esp, 12					; 0000000cH

; 528  : 	else if(outlen <= 6)

	jmp	$L70557
$L70551:
	cmp	DWORD PTR _outlen$[ebp], 6
	ja	SHORT $L70554

; 530  : 		sprintf(date_out, "%.2s/%.4s", len > 4 ? date+4 : "01", date);

	cmp	DWORD PTR _len$[ebp], 4
	jbe	SHORT $L70981
	mov	eax, DWORD PTR _date$[ebp]
	add	eax, 4
	mov	DWORD PTR -8+[ebp], eax
	jmp	SHORT $L70982
$L70981:
	mov	DWORD PTR -8+[ebp], OFFSET FLAT:$SG70555
$L70982:
	mov	ecx, DWORD PTR _date$[ebp]
	push	ecx
	mov	edx, DWORD PTR -8+[ebp]
	push	edx
	push	OFFSET FLAT:$SG70556
	mov	eax, DWORD PTR _date_out$[ebp]
	push	eax
	call	_sprintf
	add	esp, 16					; 00000010H

; 532  : 	else

	jmp	$L70557
$L70554:

; 534  : 		/* Convert date part */
; 535  : 		size_t sz = sprintf(date_out, b_year2 ? "%.2s/%.2s/%.2s" : "%.2s/%.2s/%.4s",
; 536  : 									len > 6 ? date+6 : "01", len > 4 ? date+4 : "01",
; 537  : 									(b_year2 && len > 2) ? date+2 : date);

	cmp	DWORD PTR _b_year2$[ebp], 0
	je	SHORT $L70983
	cmp	DWORD PTR _len$[ebp], 2
	jbe	SHORT $L70983
	mov	ecx, DWORD PTR _date$[ebp]
	add	ecx, 2
	mov	DWORD PTR -12+[ebp], ecx
	jmp	SHORT $L70984
$L70983:
	mov	edx, DWORD PTR _date$[ebp]
	mov	DWORD PTR -12+[ebp], edx
$L70984:
	cmp	DWORD PTR _len$[ebp], 4
	jbe	SHORT $L70985
	mov	eax, DWORD PTR _date$[ebp]
	add	eax, 4
	mov	DWORD PTR -16+[ebp], eax
	jmp	SHORT $L70986
$L70985:
	mov	DWORD PTR -16+[ebp], OFFSET FLAT:$SG70559
$L70986:
	cmp	DWORD PTR _len$[ebp], 6
	jbe	SHORT $L70987
	mov	ecx, DWORD PTR _date$[ebp]
	add	ecx, 6
	mov	DWORD PTR -20+[ebp], ecx
	jmp	SHORT $L70988
$L70987:
	mov	DWORD PTR -20+[ebp], OFFSET FLAT:$SG70560
$L70988:
	cmp	DWORD PTR _b_year2$[ebp], 0
	je	SHORT $L70989
	mov	DWORD PTR -24+[ebp], OFFSET FLAT:$SG70561
	jmp	SHORT $L70990
$L70989:
	mov	DWORD PTR -24+[ebp], OFFSET FLAT:$SG70562
$L70990:
	mov	edx, DWORD PTR -12+[ebp]
	push	edx
	mov	eax, DWORD PTR -16+[ebp]
	push	eax
	mov	ecx, DWORD PTR -20+[ebp]
	push	ecx
	mov	edx, DWORD PTR -24+[ebp]
	push	edx
	mov	eax, DWORD PTR _date_out$[ebp]
	push	eax
	call	_sprintf
	add	esp, 20					; 00000014H
	mov	DWORD PTR _sz$70558[ebp], eax

; 538  : 
; 539  : 		/* Convert time part */
; 540  : 		datetxt_time(date_out + sz, date, len, outlen);

	mov	ecx, DWORD PTR _outlen$[ebp]
	push	ecx
	mov	edx, DWORD PTR _len$[ebp]
	push	edx
	mov	eax, DWORD PTR _date$[ebp]
	push	eax
	mov	ecx, DWORD PTR _date_out$[ebp]
	add	ecx, DWORD PTR _sz$70558[ebp]
	push	ecx
	call	_datetxt_time
	add	esp, 16					; 00000010H
$L70557:

; 542  : }

	mov	esp, ebp
	pop	ebp
	ret	0
_datetxt_to_numbers ENDP
_TEXT	ENDS
PUBLIC	_datetxt_day
EXTRN	_dyntab_val:NEAR
EXTRN	_strcmp:NEAR
_DATA	SEGMENT
	ORG $+1
$SG70582 DB	'%2d', 00H
$SG70587 DB	'0229', 00H
	ORG $+3
$SG70588 DB	'%s ', 00H
$SG70590 DB	'%u', 00H
	ORG $+1
$SG70593 DB	'er', 00H
_DATA	ENDS
_TEXT	SEGMENT
_cntxt$ = 8
_date_out$ = 12
_date$ = 16
_len$ = 20
_b_day$ = 24
_b_long$ = 28
_t$ = -8
_dt$ = -44
_sz$ = -48
_monthday$ = -4
_b_wd$70584 = -52
_b_feb29$70586 = -56
_datetxt_day PROC NEAR

; 555  : ){

	push	ebp
	mov	ebp, esp
	sub	esp, 64					; 00000040H
	push	esi

; 556  : 	time_t t;
; 557  : 	struct tm dt;
; 558  : 	size_t sz = 0;

	mov	DWORD PTR _sz$[ebp], 0

; 559  : 	unsigned monthday = 1;

	mov	DWORD PTR _monthday$[ebp], 1

; 560  : 	if(len > 7) sscanf(date + 6, "%2d", &monthday);

	cmp	DWORD PTR _len$[ebp], 7
	jbe	SHORT $L70581
	lea	eax, DWORD PTR _monthday$[ebp]
	push	eax
	push	OFFSET FLAT:$SG70582
	mov	ecx, DWORD PTR _date$[ebp]
	add	ecx, 6
	push	ecx
	call	_sscanf
	add	esp, 12					; 0000000cH
$L70581:

; 561  : 
; 562  : 	/* Add weekday if applicable */
; 563  : 	if(b_day && len > 7)

	cmp	DWORD PTR _b_day$[ebp], 0
	je	$L70583
	cmp	DWORD PTR _len$[ebp], 7
	jbe	$L70583

; 565  : 		int b_wd =  !datetxt_to_time(date, &t, &dt);

	lea	edx, DWORD PTR _dt$[ebp]
	push	edx
	lea	eax, DWORD PTR _t$[ebp]
	push	eax
	mov	ecx, DWORD PTR _date$[ebp]
	push	ecx
	call	_datetxt_to_time
	add	esp, 12					; 0000000cH
	neg	eax
	sbb	eax, eax
	inc	eax
	mov	DWORD PTR _b_wd$70584[ebp], eax

; 566  : 		if(!b_wd)

	cmp	DWORD PTR _b_wd$70584[ebp], 0
	jne	$L70585

; 568  : 			int b_feb29 = !(dt.tm_year % 4) && strcmp(date + 4, "0229") < 0;

	mov	edx, DWORD PTR _dt$[ebp+20]
	and	edx, -2147483645			; 80000003H
	jns	SHORT $L70996
	dec	edx
	or	edx, -4					; fffffffcH
	inc	edx
$L70996:
	test	edx, edx
	jne	SHORT $L70992
	push	OFFSET FLAT:$SG70587
	mov	eax, DWORD PTR _date$[ebp]
	add	eax, 4
	push	eax
	call	_strcmp
	add	esp, 8
	test	eax, eax
	jge	SHORT $L70992
	mov	DWORD PTR -60+[ebp], 1
	jmp	SHORT $L70993
$L70992:
	mov	DWORD PTR -60+[ebp], 0
$L70993:
	mov	ecx, DWORD PTR -60+[ebp]
	mov	DWORD PTR _b_feb29$70586[ebp], ecx

; 569  : 			dt.tm_wday = (4 - 365 * (1970 - dt.tm_year) - (1967 - dt.tm_year)/4 - (1999 - dt.tm_year)/100 - (b_feb29 ? 0 : 1)) % 7;

	mov	edx, 1970				; 000007b2H
	sub	edx, DWORD PTR _dt$[ebp+20]
	imul	edx, 365				; 0000016dH
	mov	ecx, 4
	sub	ecx, edx
	mov	eax, 1967				; 000007afH
	sub	eax, DWORD PTR _dt$[ebp+20]
	cdq
	and	edx, 3
	add	eax, edx
	sar	eax, 2
	sub	ecx, eax
	mov	eax, 1999				; 000007cfH
	sub	eax, DWORD PTR _dt$[ebp+20]
	cdq
	mov	esi, 100				; 00000064H
	idiv	esi
	sub	ecx, eax
	xor	edx, edx
	cmp	DWORD PTR _b_feb29$70586[ebp], 0
	sete	dl
	sub	ecx, edx
	mov	eax, ecx
	cdq
	mov	ecx, 7
	idiv	ecx
	mov	DWORD PTR _dt$[ebp+24], edx
$L70585:

; 571  : 		sz += sprintf(date_out, "%s ", dyntab_val((b_long ? &cntxt->daylong : &cntxt->dayshort), dt.tm_wday, 0));

	cmp	DWORD PTR _b_long$[ebp], 0
	je	SHORT $L70994
	mov	edx, DWORD PTR _cntxt$[ebp]
	add	edx, 269668				; 00041d64H
	mov	DWORD PTR -64+[ebp], edx
	jmp	SHORT $L70995
$L70994:
	mov	eax, DWORD PTR _cntxt$[ebp]
	add	eax, 269688				; 00041d78H
	mov	DWORD PTR -64+[ebp], eax
$L70995:
	push	0
	mov	ecx, DWORD PTR _dt$[ebp+24]
	push	ecx
	mov	edx, DWORD PTR -64+[ebp]
	push	edx
	call	_dyntab_val
	add	esp, 12					; 0000000cH
	push	eax
	push	OFFSET FLAT:$SG70588
	mov	eax, DWORD PTR _date_out$[ebp]
	push	eax
	call	_sprintf
	add	esp, 12					; 0000000cH
	mov	ecx, DWORD PTR _sz$[ebp]
	add	ecx, eax
	mov	DWORD PTR _sz$[ebp], ecx
$L70583:

; 573  : 	if(b_day == 2) return sz;

	cmp	DWORD PTR _b_day$[ebp], 2
	jne	SHORT $L70589
	mov	eax, DWORD PTR _sz$[ebp]
	jmp	SHORT $L70576
$L70589:

; 574  : 
; 575  : 	/* Add day */
; 576  : 	sz += sprintf(date_out + sz, "%u", monthday);

	mov	edx, DWORD PTR _monthday$[ebp]
	push	edx
	push	OFFSET FLAT:$SG70590
	mov	eax, DWORD PTR _date_out$[ebp]
	add	eax, DWORD PTR _sz$[ebp]
	push	eax
	call	_sprintf
	add	esp, 12					; 0000000cH
	mov	ecx, DWORD PTR _sz$[ebp]
	add	ecx, eax
	mov	DWORD PTR _sz$[ebp], ecx

; 577  : 	if((b_day || b_long) && monthday == 1) sz += sprintf(date_out + sz, "er");

	cmp	DWORD PTR _b_day$[ebp], 0
	jne	SHORT $L70592
	cmp	DWORD PTR _b_long$[ebp], 0
	je	SHORT $L70591
$L70592:
	cmp	DWORD PTR _monthday$[ebp], 1
	jne	SHORT $L70591
	push	OFFSET FLAT:$SG70593
	mov	edx, DWORD PTR _date_out$[ebp]
	add	edx, DWORD PTR _sz$[ebp]
	push	edx
	call	_sprintf
	add	esp, 8
	mov	ecx, DWORD PTR _sz$[ebp]
	add	ecx, eax
	mov	DWORD PTR _sz$[ebp], ecx
$L70591:

; 578  : 	return sz;

	mov	eax, DWORD PTR _sz$[ebp]
$L70576:

; 579  : }

	pop	esi
	mov	esp, ebp
	pop	ebp
	ret	0
_datetxt_day ENDP
_TEXT	ENDS
PUBLIC	_datetxt_to_text
_DATA	SEGMENT
	ORG $+1
$SG70614 DB	'%2d', 00H
$SG70618 DB	'Ann', 0e9H, 'e %.4s', 00H
	ORG $+1
$SG70621 DB	'%s %.4s', 00H
$SG70624 DB	' %s', 00H
$SG70626 DB	' %.4s', 00H
_DATA	ENDS
_TEXT	SEGMENT
_cntxt$ = 8
_date_out$ = 12
_date$ = 16
_len$ = 20
_b_mask$ = 24
_b_long$ = 28
_outlen$ = 32
_b_day$ = -8
_b_year$ = -12
_month$ = -4
_sz$70623 = -16
_datetxt_to_text PROC NEAR

; 595  : ){

	push	ebp
	mov	ebp, esp
	sub	esp, 24					; 00000018H

; 596  : 	/* Get month index */
; 597  : 	int b_day = b_mask & 1;

	mov	eax, DWORD PTR _b_mask$[ebp]
	and	eax, 1
	mov	DWORD PTR _b_day$[ebp], eax

; 598  : 	int b_year = !(b_mask & 2);

	mov	ecx, DWORD PTR _b_mask$[ebp]
	and	ecx, 2
	neg	ecx
	sbb	ecx, ecx
	inc	ecx
	mov	DWORD PTR _b_year$[ebp], ecx

; 599  : 	unsigned month = 1;

	mov	DWORD PTR _month$[ebp], 1

; 600  : 	if(len > 5) sscanf(date + 4, "%2d", &month);

	cmp	DWORD PTR _len$[ebp], 5
	jbe	SHORT $L70613
	lea	edx, DWORD PTR _month$[ebp]
	push	edx
	push	OFFSET FLAT:$SG70614
	mov	eax, DWORD PTR _date$[ebp]
	add	eax, 4
	push	eax
	call	_sscanf
	add	esp, 12					; 0000000cH
$L70613:

; 601  : 	if(--month > 11) month = 11;

	mov	ecx, DWORD PTR _month$[ebp]
	sub	ecx, 1
	mov	DWORD PTR _month$[ebp], ecx
	cmp	DWORD PTR _month$[ebp], 11		; 0000000bH
	jbe	SHORT $L70615
	mov	DWORD PTR _month$[ebp], 11		; 0000000bH
$L70615:

; 602  : 	if(!outlen) outlen = len;

	cmp	DWORD PTR _outlen$[ebp], 0
	jne	SHORT $L70616
	mov	edx, DWORD PTR _len$[ebp]
	mov	DWORD PTR _outlen$[ebp], edx
$L70616:

; 603  : 
; 604  : 	/* Handle short date formats */
; 605  : 	if(outlen <= 4)

	cmp	DWORD PTR _outlen$[ebp], 4
	ja	SHORT $L70617

; 607  : 		sprintf(date_out, "Année %.4s", date);

	mov	eax, DWORD PTR _date$[ebp]
	push	eax
	push	OFFSET FLAT:$SG70618
	mov	ecx, DWORD PTR _date_out$[ebp]
	push	ecx
	call	_sprintf
	add	esp, 12					; 0000000cH

; 609  : 	else if(outlen <= 6)

	jmp	$L70622
$L70617:
	cmp	DWORD PTR _outlen$[ebp], 6
	ja	SHORT $L70620

; 611  : 		sprintf(date_out, "%s %.4s", dyntab_val((b_long ? &cntxt->monthlong : &cntxt->monthshort), month, 0), date);

	cmp	DWORD PTR _b_long$[ebp], 0
	je	SHORT $L70998
	mov	edx, DWORD PTR _cntxt$[ebp]
	add	edx, 269708				; 00041d8cH
	mov	DWORD PTR -20+[ebp], edx
	jmp	SHORT $L70999
$L70998:
	mov	eax, DWORD PTR _cntxt$[ebp]
	add	eax, 269728				; 00041da0H
	mov	DWORD PTR -20+[ebp], eax
$L70999:
	mov	ecx, DWORD PTR _date$[ebp]
	push	ecx
	push	0
	mov	edx, DWORD PTR _month$[ebp]
	push	edx
	mov	eax, DWORD PTR -20+[ebp]
	push	eax
	call	_dyntab_val
	add	esp, 12					; 0000000cH
	push	eax
	push	OFFSET FLAT:$SG70621
	mov	ecx, DWORD PTR _date_out$[ebp]
	push	ecx
	call	_sprintf
	add	esp, 16					; 00000010H

; 613  : 	else

	jmp	$L70622
$L70620:

; 615  : 		/* Convert date part */
; 616  : 		size_t sz = datetxt_day(cntxt, date_out, date, len, b_day, b_long);

	mov	edx, DWORD PTR _b_long$[ebp]
	push	edx
	mov	eax, DWORD PTR _b_day$[ebp]
	push	eax
	mov	ecx, DWORD PTR _len$[ebp]
	push	ecx
	mov	edx, DWORD PTR _date$[ebp]
	push	edx
	mov	eax, DWORD PTR _date_out$[ebp]
	push	eax
	mov	ecx, DWORD PTR _cntxt$[ebp]
	push	ecx
	call	_datetxt_day
	add	esp, 24					; 00000018H
	mov	DWORD PTR _sz$70623[ebp], eax

; 617  : 		sz += sprintf(date_out + sz, " %s", dyntab_val((b_long ? &cntxt->monthlong : &cntxt->monthshort), month, 0));

	cmp	DWORD PTR _b_long$[ebp], 0
	je	SHORT $L71000
	mov	edx, DWORD PTR _cntxt$[ebp]
	add	edx, 269708				; 00041d8cH
	mov	DWORD PTR -24+[ebp], edx
	jmp	SHORT $L71001
$L71000:
	mov	eax, DWORD PTR _cntxt$[ebp]
	add	eax, 269728				; 00041da0H
	mov	DWORD PTR -24+[ebp], eax
$L71001:
	push	0
	mov	ecx, DWORD PTR _month$[ebp]
	push	ecx
	mov	edx, DWORD PTR -24+[ebp]
	push	edx
	call	_dyntab_val
	add	esp, 12					; 0000000cH
	push	eax
	push	OFFSET FLAT:$SG70624
	mov	eax, DWORD PTR _date_out$[ebp]
	add	eax, DWORD PTR _sz$70623[ebp]
	push	eax
	call	_sprintf
	add	esp, 12					; 0000000cH
	mov	ecx, DWORD PTR _sz$70623[ebp]
	add	ecx, eax
	mov	DWORD PTR _sz$70623[ebp], ecx

; 618  : 		if(b_year) sz += sprintf(date_out + sz, " %.4s", date);

	cmp	DWORD PTR _b_year$[ebp], 0
	je	SHORT $L70625
	mov	edx, DWORD PTR _date$[ebp]
	push	edx
	push	OFFSET FLAT:$SG70626
	mov	eax, DWORD PTR _date_out$[ebp]
	add	eax, DWORD PTR _sz$70623[ebp]
	push	eax
	call	_sprintf
	add	esp, 12					; 0000000cH
	mov	ecx, DWORD PTR _sz$70623[ebp]
	add	ecx, eax
	mov	DWORD PTR _sz$70623[ebp], ecx
$L70625:

; 619  : 
; 620  : 		/* Convert time part */
; 621  : 		datetxt_time(date_out + sz, date, len, outlen);

	mov	edx, DWORD PTR _outlen$[ebp]
	push	edx
	mov	eax, DWORD PTR _len$[ebp]
	push	eax
	mov	ecx, DWORD PTR _date$[ebp]
	push	ecx
	mov	edx, DWORD PTR _date_out$[ebp]
	add	edx, DWORD PTR _sz$70623[ebp]
	push	edx
	call	_datetxt_time
	add	esp, 16					; 00000010H
$L70622:

; 623  : }

	mov	esp, ebp
	pop	ebp
	ret	0
_datetxt_to_text ENDP
_TEXT	ENDS
PUBLIC	_datetxt_to_format
_BSS	SEGMENT
$SG70754 DB	01H DUP (?)
	ALIGN	4

$SG70643 DB	01H DUP (?)
_BSS	ENDS
_DATA	SEGMENT
	ORG $+2
$SG70641 DB	'%.30s', 00H
	ORG $+2
$SG70645 DB	'_EVA_DATE', 00H
	ORG $+2
$SG70648 DB	'_EVA_DATETIME', 00H
	ORG $+2
$SG70651 DB	'_EVA_Short', 00H
	ORG $+1
$SG70654 DB	'_EVA_ShortTime', 00H
	ORG $+1
$SG70657 DB	'_EVA_Std', 00H
	ORG $+3
$SG70660 DB	'_EVA_StdTime', 00H
	ORG $+3
$SG70663 DB	'_EVA_StdTimeSec', 00H
$SG70666 DB	'_EVA_StdMonth', 00H
	ORG $+2
$SG70669 DB	'_EVA_Year', 00H
	ORG $+2
$SG70672 DB	'_EVA_Long', 00H
	ORG $+2
$SG70675 DB	'_EVA_LongVar', 00H
	ORG $+3
$SG70678 DB	'_EVA_LongTime', 00H
	ORG $+2
$SG70681 DB	'_EVA_LongDay', 00H
	ORG $+3
$SG70684 DB	'_EVA_LongVarDay', 00H
$SG70687 DB	'_EVA_LongTimeDay', 00H
	ORG $+3
$SG70690 DB	'_EVA_Full', 00H
	ORG $+2
$SG70693 DB	'_EVA_FullVar', 00H
	ORG $+3
$SG70696 DB	'_EVA_FullVarDay', 00H
$SG70699 DB	'_EVA_FullTime', 00H
	ORG $+2
$SG70702 DB	'_EVA_FullDay', 00H
	ORG $+3
$SG70705 DB	'_EVA_FullTimeDay', 00H
	ORG $+3
$SG70708 DB	'_EVA_MonthYear', 00H
	ORG $+1
$SG70711 DB	'_EVA_MonthYearShort', 00H
$SG70714 DB	'_EVA_DayMonth', 00H
	ORG $+2
$SG70717 DB	'_EVA_DayMonthFull', 00H
	ORG $+2
$SG70720 DB	'_EVA_Day', 00H
	ORG $+3
$SG70723 DB	'_EVA_DayShort', 00H
	ORG $+2
$SG70726 DB	'_EVA_DayLong', 00H
	ORG $+3
$SG70729 DB	'_EVA_DayFull', 00H
	ORG $+3
$SG70732 DB	'_EVA_Time', 00H
	ORG $+2
$SG70736 DB	'_EVA_DayTime', 00H
	ORG $+3
$SG70737 DB	'_EVA_DayFullTime', 00H
	ORG $+3
$SG70739 DB	'_EVA_DayTime', 00H
	ORG $+3
$SG70740 DB	' ', 00H
	ORG $+2
$SG70743 DB	'_EVA_Adaptative', 00H
$SG70749 DB	'aujourd''hui', 00H
$SG70750 DB	'hier', 00H
	ORG $+3
$SG70751 DB	'avant hier', 00H
	ORG $+1
$SG70752 DB	'demain', 00H
	ORG $+1
$SG70753 DB	'apr', 0e8H, 's demain', 00H
	ORG $+3
$SG70759 DB	'_EVA_DATE_SORT', 00H
	ORG $+1
$SG70760 DB	'01', 00H
	ORG $+1
$SG70761 DB	'01', 00H
	ORG $+1
$SG70762 DB	'%.4s-%.2s-%.2s', 00H
_DATA	ENDS
_TEXT	SEGMENT
_sz$70738 = -8
_f$70744 = -12
_age$70745 = -16
_sz$70748 = -20
_cntxt$ = 8
_date_out$ = 12
_date$ = 16
_format$ = 20
_len$ = -4
_datetxt_to_format PROC NEAR

; 634  : ){

	push	ebp
	mov	ebp, esp
	sub	esp, 52					; 00000034H

; 635  : 	size_t len;
; 636  : 
; 637  : 	/* Check parameters */
; 638  : 	if(!date_out) return -1;

	cmp	DWORD PTR _date_out$[ebp], 0
	jne	SHORT $L70637
	or	eax, -1
	jmp	$L70635
$L70637:

; 639  : 	*date_out = 0;

	mov	eax, DWORD PTR _date_out$[ebp]
	mov	BYTE PTR [eax], 0

; 640  : 	if(!date || !*date) return 0;

	cmp	DWORD PTR _date$[ebp], 0
	je	SHORT $L70639
	mov	ecx, DWORD PTR _date$[ebp]
	movsx	edx, BYTE PTR [ecx]
	test	edx, edx
	jne	SHORT $L70638
$L70639:
	xor	eax, eax
	jmp	$L70635
$L70638:

; 641  : 	len = strlen(date);

	mov	eax, DWORD PTR _date$[ebp]
	push	eax
	call	_strlen
	add	esp, 4
	mov	DWORD PTR _len$[ebp], eax

; 642  : 	if(datetxt_invalid(date))

	mov	ecx, DWORD PTR _date$[ebp]
	push	ecx
	call	_datetxt_invalid
	add	esp, 4
	test	eax, eax
	je	SHORT $L70640

; 644  : 		sprintf(date_out, "%.30s", date);

	mov	edx, DWORD PTR _date$[ebp]
	push	edx
	push	OFFSET FLAT:$SG70641
	mov	eax, DWORD PTR _date_out$[ebp]
	push	eax
	call	_sprintf
	add	esp, 12					; 0000000cH

; 645  : 		return 1;

	mov	eax, 1
	jmp	$L70635
$L70640:

; 647  : 
; 648  : 	/* Parse format specification */
; 649  : 	if(!format) format = "";

	cmp	DWORD PTR _format$[ebp], 0
	jne	SHORT $L70642
	mov	DWORD PTR _format$[ebp], OFFSET FLAT:$SG70643
$L70642:

; 650  : 	if(!strcmp(format, "_EVA_DATE"))  datetxt_to_numbers(date_out, date, len, 0, len < 8 ? 0 : 8);

	push	OFFSET FLAT:$SG70645
	mov	ecx, DWORD PTR _format$[ebp]
	push	ecx
	call	_strcmp
	add	esp, 8
	test	eax, eax
	jne	SHORT $L70644
	cmp	DWORD PTR _len$[ebp], 8
	sbb	edx, edx
	and	edx, -8					; fffffff8H
	add	edx, 8
	push	edx
	push	0
	mov	eax, DWORD PTR _len$[ebp]
	push	eax
	mov	ecx, DWORD PTR _date$[ebp]
	push	ecx
	mov	edx, DWORD PTR _date_out$[ebp]
	push	edx
	call	_datetxt_to_numbers
	add	esp, 20					; 00000014H

; 651  : 	else if(!strcmp(format, "_EVA_DATETIME")) datetxt_to_numbers(date_out, date, len, 0, len < 14 ? 0 : 14);

	jmp	$L70763
$L70644:
	push	OFFSET FLAT:$SG70648
	mov	eax, DWORD PTR _format$[ebp]
	push	eax
	call	_strcmp
	add	esp, 8
	test	eax, eax
	jne	SHORT $L70647
	cmp	DWORD PTR _len$[ebp], 14		; 0000000eH
	sbb	ecx, ecx
	and	ecx, -14				; fffffff2H
	add	ecx, 14					; 0000000eH
	push	ecx
	push	0
	mov	edx, DWORD PTR _len$[ebp]
	push	edx
	mov	eax, DWORD PTR _date$[ebp]
	push	eax
	mov	ecx, DWORD PTR _date_out$[ebp]
	push	ecx
	call	_datetxt_to_numbers
	add	esp, 20					; 00000014H

; 652  : 	else if(!strcmp(format, "_EVA_Short")) datetxt_to_numbers(date_out, date, len, 1, 8);

	jmp	$L70763
$L70647:
	push	OFFSET FLAT:$SG70651
	mov	edx, DWORD PTR _format$[ebp]
	push	edx
	call	_strcmp
	add	esp, 8
	test	eax, eax
	jne	SHORT $L70650
	push	8
	push	1
	mov	eax, DWORD PTR _len$[ebp]
	push	eax
	mov	ecx, DWORD PTR _date$[ebp]
	push	ecx
	mov	edx, DWORD PTR _date_out$[ebp]
	push	edx
	call	_datetxt_to_numbers
	add	esp, 20					; 00000014H

; 653  : 	else if(!strcmp(format, "_EVA_ShortTime")) datetxt_to_numbers(date_out, date, len, 1, 12);

	jmp	$L70763
$L70650:
	push	OFFSET FLAT:$SG70654
	mov	eax, DWORD PTR _format$[ebp]
	push	eax
	call	_strcmp
	add	esp, 8
	test	eax, eax
	jne	SHORT $L70653
	push	12					; 0000000cH
	push	1
	mov	ecx, DWORD PTR _len$[ebp]
	push	ecx
	mov	edx, DWORD PTR _date$[ebp]
	push	edx
	mov	eax, DWORD PTR _date_out$[ebp]
	push	eax
	call	_datetxt_to_numbers
	add	esp, 20					; 00000014H

; 654  : 	else if(!strcmp(format, "_EVA_Std")) datetxt_to_numbers(date_out, date, len, 0, 8);

	jmp	$L70763
$L70653:
	push	OFFSET FLAT:$SG70657
	mov	ecx, DWORD PTR _format$[ebp]
	push	ecx
	call	_strcmp
	add	esp, 8
	test	eax, eax
	jne	SHORT $L70656
	push	8
	push	0
	mov	edx, DWORD PTR _len$[ebp]
	push	edx
	mov	eax, DWORD PTR _date$[ebp]
	push	eax
	mov	ecx, DWORD PTR _date_out$[ebp]
	push	ecx
	call	_datetxt_to_numbers
	add	esp, 20					; 00000014H

; 655  : 	else if(!strcmp(format, "_EVA_StdTime")) datetxt_to_numbers(date_out, date, len, 0, 12);

	jmp	$L70763
$L70656:
	push	OFFSET FLAT:$SG70660
	mov	edx, DWORD PTR _format$[ebp]
	push	edx
	call	_strcmp
	add	esp, 8
	test	eax, eax
	jne	SHORT $L70659
	push	12					; 0000000cH
	push	0
	mov	eax, DWORD PTR _len$[ebp]
	push	eax
	mov	ecx, DWORD PTR _date$[ebp]
	push	ecx
	mov	edx, DWORD PTR _date_out$[ebp]
	push	edx
	call	_datetxt_to_numbers
	add	esp, 20					; 00000014H

; 656  : 	else if(!strcmp(format, "_EVA_StdTimeSec")) datetxt_to_numbers(date_out, date, len, 0, 14);

	jmp	$L70763
$L70659:
	push	OFFSET FLAT:$SG70663
	mov	eax, DWORD PTR _format$[ebp]
	push	eax
	call	_strcmp
	add	esp, 8
	test	eax, eax
	jne	SHORT $L70662
	push	14					; 0000000eH
	push	0
	mov	ecx, DWORD PTR _len$[ebp]
	push	ecx
	mov	edx, DWORD PTR _date$[ebp]
	push	edx
	mov	eax, DWORD PTR _date_out$[ebp]
	push	eax
	call	_datetxt_to_numbers
	add	esp, 20					; 00000014H

; 657  : 	else if(!strcmp(format, "_EVA_StdMonth")) datetxt_to_numbers(date_out, date, len, 0, 6);

	jmp	$L70763
$L70662:
	push	OFFSET FLAT:$SG70666
	mov	ecx, DWORD PTR _format$[ebp]
	push	ecx
	call	_strcmp
	add	esp, 8
	test	eax, eax
	jne	SHORT $L70665
	push	6
	push	0
	mov	edx, DWORD PTR _len$[ebp]
	push	edx
	mov	eax, DWORD PTR _date$[ebp]
	push	eax
	mov	ecx, DWORD PTR _date_out$[ebp]
	push	ecx
	call	_datetxt_to_numbers
	add	esp, 20					; 00000014H

; 658  : 	else if(!strcmp(format, "_EVA_Year")) datetxt_to_numbers(date_out, date, len, 0, 4);

	jmp	$L70763
$L70665:
	push	OFFSET FLAT:$SG70669
	mov	edx, DWORD PTR _format$[ebp]
	push	edx
	call	_strcmp
	add	esp, 8
	test	eax, eax
	jne	SHORT $L70668
	push	4
	push	0
	mov	eax, DWORD PTR _len$[ebp]
	push	eax
	mov	ecx, DWORD PTR _date$[ebp]
	push	ecx
	mov	edx, DWORD PTR _date_out$[ebp]
	push	edx
	call	_datetxt_to_numbers
	add	esp, 20					; 00000014H

; 659  : 	else if(!strcmp(format, "_EVA_Long")) datetxt_to_text(cntxt, date_out, date, len, 0, 0, 8);

	jmp	$L70763
$L70668:
	push	OFFSET FLAT:$SG70672
	mov	eax, DWORD PTR _format$[ebp]
	push	eax
	call	_strcmp
	add	esp, 8
	test	eax, eax
	jne	SHORT $L70671
	push	8
	push	0
	push	0
	mov	ecx, DWORD PTR _len$[ebp]
	push	ecx
	mov	edx, DWORD PTR _date$[ebp]
	push	edx
	mov	eax, DWORD PTR _date_out$[ebp]
	push	eax
	mov	ecx, DWORD PTR _cntxt$[ebp]
	push	ecx
	call	_datetxt_to_text
	add	esp, 28					; 0000001cH

; 660  : 	else if(!strcmp(format, "_EVA_LongVar")) datetxt_to_text(cntxt, date_out, date, len, 1, 0, 0);

	jmp	$L70763
$L70671:
	push	OFFSET FLAT:$SG70675
	mov	edx, DWORD PTR _format$[ebp]
	push	edx
	call	_strcmp
	add	esp, 8
	test	eax, eax
	jne	SHORT $L70674
	push	0
	push	0
	push	1
	mov	eax, DWORD PTR _len$[ebp]
	push	eax
	mov	ecx, DWORD PTR _date$[ebp]
	push	ecx
	mov	edx, DWORD PTR _date_out$[ebp]
	push	edx
	mov	eax, DWORD PTR _cntxt$[ebp]
	push	eax
	call	_datetxt_to_text
	add	esp, 28					; 0000001cH

; 661  : 	else if(!strcmp(format, "_EVA_LongTime")) datetxt_to_text(cntxt, date_out, date, len, 0, 0, 12);

	jmp	$L70763
$L70674:
	push	OFFSET FLAT:$SG70678
	mov	ecx, DWORD PTR _format$[ebp]
	push	ecx
	call	_strcmp
	add	esp, 8
	test	eax, eax
	jne	SHORT $L70677
	push	12					; 0000000cH
	push	0
	push	0
	mov	edx, DWORD PTR _len$[ebp]
	push	edx
	mov	eax, DWORD PTR _date$[ebp]
	push	eax
	mov	ecx, DWORD PTR _date_out$[ebp]
	push	ecx
	mov	edx, DWORD PTR _cntxt$[ebp]
	push	edx
	call	_datetxt_to_text
	add	esp, 28					; 0000001cH

; 662  : 	else if(!strcmp(format, "_EVA_LongDay")) datetxt_to_text(cntxt, date_out, date, len, 1, 0, 8);

	jmp	$L70763
$L70677:
	push	OFFSET FLAT:$SG70681
	mov	eax, DWORD PTR _format$[ebp]
	push	eax
	call	_strcmp
	add	esp, 8
	test	eax, eax
	jne	SHORT $L70680
	push	8
	push	0
	push	1
	mov	ecx, DWORD PTR _len$[ebp]
	push	ecx
	mov	edx, DWORD PTR _date$[ebp]
	push	edx
	mov	eax, DWORD PTR _date_out$[ebp]
	push	eax
	mov	ecx, DWORD PTR _cntxt$[ebp]
	push	ecx
	call	_datetxt_to_text
	add	esp, 28					; 0000001cH

; 663  : 	else if(!strcmp(format, "_EVA_LongVarDay")) datetxt_to_text(cntxt, date_out, date, len, 1, 0, 0);

	jmp	$L70763
$L70680:
	push	OFFSET FLAT:$SG70684
	mov	edx, DWORD PTR _format$[ebp]
	push	edx
	call	_strcmp
	add	esp, 8
	test	eax, eax
	jne	SHORT $L70683
	push	0
	push	0
	push	1
	mov	eax, DWORD PTR _len$[ebp]
	push	eax
	mov	ecx, DWORD PTR _date$[ebp]
	push	ecx
	mov	edx, DWORD PTR _date_out$[ebp]
	push	edx
	mov	eax, DWORD PTR _cntxt$[ebp]
	push	eax
	call	_datetxt_to_text
	add	esp, 28					; 0000001cH

; 664  : 	else if(!strcmp(format, "_EVA_LongTimeDay")) datetxt_to_text(cntxt, date_out, date, len, 1, 0, 12);

	jmp	$L70763
$L70683:
	push	OFFSET FLAT:$SG70687
	mov	ecx, DWORD PTR _format$[ebp]
	push	ecx
	call	_strcmp
	add	esp, 8
	test	eax, eax
	jne	SHORT $L70686
	push	12					; 0000000cH
	push	0
	push	1
	mov	edx, DWORD PTR _len$[ebp]
	push	edx
	mov	eax, DWORD PTR _date$[ebp]
	push	eax
	mov	ecx, DWORD PTR _date_out$[ebp]
	push	ecx
	mov	edx, DWORD PTR _cntxt$[ebp]
	push	edx
	call	_datetxt_to_text
	add	esp, 28					; 0000001cH

; 665  : 	else if(!strcmp(format, "_EVA_Full")) datetxt_to_text(cntxt, date_out, date, len, 0, 1, 8);

	jmp	$L70763
$L70686:
	push	OFFSET FLAT:$SG70690
	mov	eax, DWORD PTR _format$[ebp]
	push	eax
	call	_strcmp
	add	esp, 8
	test	eax, eax
	jne	SHORT $L70689
	push	8
	push	1
	push	0
	mov	ecx, DWORD PTR _len$[ebp]
	push	ecx
	mov	edx, DWORD PTR _date$[ebp]
	push	edx
	mov	eax, DWORD PTR _date_out$[ebp]
	push	eax
	mov	ecx, DWORD PTR _cntxt$[ebp]
	push	ecx
	call	_datetxt_to_text
	add	esp, 28					; 0000001cH

; 666  : 	else if(!strcmp(format, "_EVA_FullVar")) datetxt_to_text(cntxt, date_out, date, len, 0, 1, 0);

	jmp	$L70763
$L70689:
	push	OFFSET FLAT:$SG70693
	mov	edx, DWORD PTR _format$[ebp]
	push	edx
	call	_strcmp
	add	esp, 8
	test	eax, eax
	jne	SHORT $L70692
	push	0
	push	1
	push	0
	mov	eax, DWORD PTR _len$[ebp]
	push	eax
	mov	ecx, DWORD PTR _date$[ebp]
	push	ecx
	mov	edx, DWORD PTR _date_out$[ebp]
	push	edx
	mov	eax, DWORD PTR _cntxt$[ebp]
	push	eax
	call	_datetxt_to_text
	add	esp, 28					; 0000001cH

; 667  : 	else if(!strcmp(format, "_EVA_FullVarDay")) datetxt_to_text(cntxt, date_out, date, len, 1, 1, 0);

	jmp	$L70763
$L70692:
	push	OFFSET FLAT:$SG70696
	mov	ecx, DWORD PTR _format$[ebp]
	push	ecx
	call	_strcmp
	add	esp, 8
	test	eax, eax
	jne	SHORT $L70695
	push	0
	push	1
	push	1
	mov	edx, DWORD PTR _len$[ebp]
	push	edx
	mov	eax, DWORD PTR _date$[ebp]
	push	eax
	mov	ecx, DWORD PTR _date_out$[ebp]
	push	ecx
	mov	edx, DWORD PTR _cntxt$[ebp]
	push	edx
	call	_datetxt_to_text
	add	esp, 28					; 0000001cH

; 668  : 	else if(!strcmp(format, "_EVA_FullTime")) datetxt_to_text(cntxt, date_out, date, len, 0, 1, 12);

	jmp	$L70763
$L70695:
	push	OFFSET FLAT:$SG70699
	mov	eax, DWORD PTR _format$[ebp]
	push	eax
	call	_strcmp
	add	esp, 8
	test	eax, eax
	jne	SHORT $L70698
	push	12					; 0000000cH
	push	1
	push	0
	mov	ecx, DWORD PTR _len$[ebp]
	push	ecx
	mov	edx, DWORD PTR _date$[ebp]
	push	edx
	mov	eax, DWORD PTR _date_out$[ebp]
	push	eax
	mov	ecx, DWORD PTR _cntxt$[ebp]
	push	ecx
	call	_datetxt_to_text
	add	esp, 28					; 0000001cH

; 669  : 	else if(!strcmp(format, "_EVA_FullDay")) datetxt_to_text(cntxt, date_out, date, len, 1, 1, 8);

	jmp	$L70763
$L70698:
	push	OFFSET FLAT:$SG70702
	mov	edx, DWORD PTR _format$[ebp]
	push	edx
	call	_strcmp
	add	esp, 8
	test	eax, eax
	jne	SHORT $L70701
	push	8
	push	1
	push	1
	mov	eax, DWORD PTR _len$[ebp]
	push	eax
	mov	ecx, DWORD PTR _date$[ebp]
	push	ecx
	mov	edx, DWORD PTR _date_out$[ebp]
	push	edx
	mov	eax, DWORD PTR _cntxt$[ebp]
	push	eax
	call	_datetxt_to_text
	add	esp, 28					; 0000001cH

; 670  : 	else if(!strcmp(format, "_EVA_FullTimeDay")) datetxt_to_text(cntxt, date_out, date, len, 1, 1, 12);

	jmp	$L70763
$L70701:
	push	OFFSET FLAT:$SG70705
	mov	ecx, DWORD PTR _format$[ebp]
	push	ecx
	call	_strcmp
	add	esp, 8
	test	eax, eax
	jne	SHORT $L70704
	push	12					; 0000000cH
	push	1
	push	1
	mov	edx, DWORD PTR _len$[ebp]
	push	edx
	mov	eax, DWORD PTR _date$[ebp]
	push	eax
	mov	ecx, DWORD PTR _date_out$[ebp]
	push	ecx
	mov	edx, DWORD PTR _cntxt$[ebp]
	push	edx
	call	_datetxt_to_text
	add	esp, 28					; 0000001cH

; 671  : 	else if(!strcmp(format, "_EVA_MonthYear")) datetxt_to_text(cntxt, date_out, date, len, 0, 1, 6);

	jmp	$L70763
$L70704:
	push	OFFSET FLAT:$SG70708
	mov	eax, DWORD PTR _format$[ebp]
	push	eax
	call	_strcmp
	add	esp, 8
	test	eax, eax
	jne	SHORT $L70707
	push	6
	push	1
	push	0
	mov	ecx, DWORD PTR _len$[ebp]
	push	ecx
	mov	edx, DWORD PTR _date$[ebp]
	push	edx
	mov	eax, DWORD PTR _date_out$[ebp]
	push	eax
	mov	ecx, DWORD PTR _cntxt$[ebp]
	push	ecx
	call	_datetxt_to_text
	add	esp, 28					; 0000001cH

; 672  : 	else if(!strcmp(format, "_EVA_MonthYearShort")) datetxt_to_text(cntxt, date_out, date, len, 0, 0, 6);

	jmp	$L70763
$L70707:
	push	OFFSET FLAT:$SG70711
	mov	edx, DWORD PTR _format$[ebp]
	push	edx
	call	_strcmp
	add	esp, 8
	test	eax, eax
	jne	SHORT $L70710
	push	6
	push	0
	push	0
	mov	eax, DWORD PTR _len$[ebp]
	push	eax
	mov	ecx, DWORD PTR _date$[ebp]
	push	ecx
	mov	edx, DWORD PTR _date_out$[ebp]
	push	edx
	mov	eax, DWORD PTR _cntxt$[ebp]
	push	eax
	call	_datetxt_to_text
	add	esp, 28					; 0000001cH

; 673  : 	else if(!strcmp(format, "_EVA_DayMonth")) datetxt_to_text(cntxt, date_out, date, len, 3, 0, 8);

	jmp	$L70763
$L70710:
	push	OFFSET FLAT:$SG70714
	mov	ecx, DWORD PTR _format$[ebp]
	push	ecx
	call	_strcmp
	add	esp, 8
	test	eax, eax
	jne	SHORT $L70713
	push	8
	push	0
	push	3
	mov	edx, DWORD PTR _len$[ebp]
	push	edx
	mov	eax, DWORD PTR _date$[ebp]
	push	eax
	mov	ecx, DWORD PTR _date_out$[ebp]
	push	ecx
	mov	edx, DWORD PTR _cntxt$[ebp]
	push	edx
	call	_datetxt_to_text
	add	esp, 28					; 0000001cH

; 674  : 	else if(!strcmp(format, "_EVA_DayMonthFull")) datetxt_to_text(cntxt, date_out, date, len, 3, 1, 8);

	jmp	$L70763
$L70713:
	push	OFFSET FLAT:$SG70717
	mov	eax, DWORD PTR _format$[ebp]
	push	eax
	call	_strcmp
	add	esp, 8
	test	eax, eax
	jne	SHORT $L70716
	push	8
	push	1
	push	3
	mov	ecx, DWORD PTR _len$[ebp]
	push	ecx
	mov	edx, DWORD PTR _date$[ebp]
	push	edx
	mov	eax, DWORD PTR _date_out$[ebp]
	push	eax
	mov	ecx, DWORD PTR _cntxt$[ebp]
	push	ecx
	call	_datetxt_to_text
	add	esp, 28					; 0000001cH

; 675  : 	else if(!strcmp(format, "_EVA_Day")) datetxt_day(cntxt, date_out, date, len, 0, 1);

	jmp	$L70763
$L70716:
	push	OFFSET FLAT:$SG70720
	mov	edx, DWORD PTR _format$[ebp]
	push	edx
	call	_strcmp
	add	esp, 8
	test	eax, eax
	jne	SHORT $L70719
	push	1
	push	0
	mov	eax, DWORD PTR _len$[ebp]
	push	eax
	mov	ecx, DWORD PTR _date$[ebp]
	push	ecx
	mov	edx, DWORD PTR _date_out$[ebp]
	push	edx
	mov	eax, DWORD PTR _cntxt$[ebp]
	push	eax
	call	_datetxt_day
	add	esp, 24					; 00000018H

; 676  : 	else if(!strcmp(format, "_EVA_DayShort")) datetxt_day(cntxt, date_out, date, len, 0, 0);

	jmp	$L70763
$L70719:
	push	OFFSET FLAT:$SG70723
	mov	ecx, DWORD PTR _format$[ebp]
	push	ecx
	call	_strcmp
	add	esp, 8
	test	eax, eax
	jne	SHORT $L70722
	push	0
	push	0
	mov	edx, DWORD PTR _len$[ebp]
	push	edx
	mov	eax, DWORD PTR _date$[ebp]
	push	eax
	mov	ecx, DWORD PTR _date_out$[ebp]
	push	ecx
	mov	edx, DWORD PTR _cntxt$[ebp]
	push	edx
	call	_datetxt_day
	add	esp, 24					; 00000018H

; 677  : 	else if(!strcmp(format, "_EVA_DayLong")) datetxt_day(cntxt, date_out, date, len, 1, 0);

	jmp	$L70763
$L70722:
	push	OFFSET FLAT:$SG70726
	mov	eax, DWORD PTR _format$[ebp]
	push	eax
	call	_strcmp
	add	esp, 8
	test	eax, eax
	jne	SHORT $L70725
	push	0
	push	1
	mov	ecx, DWORD PTR _len$[ebp]
	push	ecx
	mov	edx, DWORD PTR _date$[ebp]
	push	edx
	mov	eax, DWORD PTR _date_out$[ebp]
	push	eax
	mov	ecx, DWORD PTR _cntxt$[ebp]
	push	ecx
	call	_datetxt_day
	add	esp, 24					; 00000018H

; 678  : 	else if(!strcmp(format, "_EVA_DayFull")) datetxt_day(cntxt, date_out, date, len, 1, 1);

	jmp	$L70763
$L70725:
	push	OFFSET FLAT:$SG70729
	mov	edx, DWORD PTR _format$[ebp]
	push	edx
	call	_strcmp
	add	esp, 8
	test	eax, eax
	jne	SHORT $L70728
	push	1
	push	1
	mov	eax, DWORD PTR _len$[ebp]
	push	eax
	mov	ecx, DWORD PTR _date$[ebp]
	push	ecx
	mov	edx, DWORD PTR _date_out$[ebp]
	push	edx
	mov	eax, DWORD PTR _cntxt$[ebp]
	push	eax
	call	_datetxt_day
	add	esp, 24					; 00000018H

; 679  : 	else if(!strcmp(format, "_EVA_Time")) datetxt_time(date_out, date, len, 12);

	jmp	$L70763
$L70728:
	push	OFFSET FLAT:$SG70732
	mov	ecx, DWORD PTR _format$[ebp]
	push	ecx
	call	_strcmp
	add	esp, 8
	test	eax, eax
	jne	SHORT $L70731
	push	12					; 0000000cH
	mov	edx, DWORD PTR _len$[ebp]
	push	edx
	mov	eax, DWORD PTR _date$[ebp]
	push	eax
	mov	ecx, DWORD PTR _date_out$[ebp]
	push	ecx
	call	_datetxt_time
	add	esp, 16					; 00000010H

; 680  : 	else if(!strcmp(format, "_EVA_DayTime") ||

	jmp	$L70763
$L70731:

; 681  : 			!strcmp(format, "_EVA_DayFullTime"))

	push	OFFSET FLAT:$SG70736
	mov	edx, DWORD PTR _format$[ebp]
	push	edx
	call	_strcmp
	add	esp, 8
	test	eax, eax
	je	SHORT $L70735
	push	OFFSET FLAT:$SG70737
	mov	eax, DWORD PTR _format$[ebp]
	push	eax
	call	_strcmp
	add	esp, 8
	test	eax, eax
	jne	SHORT $L70734
$L70735:

; 683  : 		size_t sz = datetxt_day(cntxt, date_out, date, len, 2, !strcmp(format, "_EVA_DayTime") ? 0 : 1);

	push	OFFSET FLAT:$SG70739
	mov	ecx, DWORD PTR _format$[ebp]
	push	ecx
	call	_strcmp
	add	esp, 8
	neg	eax
	sbb	eax, eax
	neg	eax
	push	eax
	push	2
	mov	edx, DWORD PTR _len$[ebp]
	push	edx
	mov	eax, DWORD PTR _date$[ebp]
	push	eax
	mov	ecx, DWORD PTR _date_out$[ebp]
	push	ecx
	mov	edx, DWORD PTR _cntxt$[ebp]
	push	edx
	call	_datetxt_day
	add	esp, 24					; 00000018H
	mov	DWORD PTR _sz$70738[ebp], eax

; 684  : 		sz += sprintf(date_out + sz, " ");

	push	OFFSET FLAT:$SG70740
	mov	eax, DWORD PTR _date_out$[ebp]
	add	eax, DWORD PTR _sz$70738[ebp]
	push	eax
	call	_sprintf
	add	esp, 8
	mov	ecx, DWORD PTR _sz$70738[ebp]
	add	ecx, eax
	mov	DWORD PTR _sz$70738[ebp], ecx

; 685  : 		datetxt_time(date_out + sz, date, len, 12);

	push	12					; 0000000cH
	mov	edx, DWORD PTR _len$[ebp]
	push	edx
	mov	eax, DWORD PTR _date$[ebp]
	push	eax
	mov	ecx, DWORD PTR _date_out$[ebp]
	add	ecx, DWORD PTR _sz$70738[ebp]
	push	ecx
	call	_datetxt_time
	add	esp, 16					; 00000010H

; 687  : 	else if(!strcmp(format, "_EVA_Adaptative"))

	jmp	$L70763
$L70734:
	push	OFFSET FLAT:$SG70743
	mov	edx, DWORD PTR _format$[ebp]
	push	edx
	call	_strcmp
	add	esp, 8
	test	eax, eax
	jne	$L70742

; 689  : 		char f = 'D';

	mov	BYTE PTR _f$70744[ebp], 68		; 00000044H

; 690  : 		int age = datetxt_to_age(date, NULL, &f);

	lea	eax, DWORD PTR _f$70744[ebp]
	push	eax
	push	0
	mov	ecx, DWORD PTR _date$[ebp]
	push	ecx
	call	_datetxt_to_age
	add	esp, 12					; 0000000cH
	mov	DWORD PTR _age$70745[ebp], eax

; 691  : 		if(f == 'D' && abs(age) < 7)

	movsx	edx, BYTE PTR _f$70744[ebp]
	cmp	edx, 68					; 00000044H
	jne	$L70747
	mov	eax, DWORD PTR _age$70745[ebp]
	push	eax
	call	_abs
	add	esp, 4
	cmp	eax, 7
	jge	$L70747

; 693  : 			size_t sz = abs(age) < 2 ?
; 694  : 				sprintf(date_out,
; 695  : 						age == 0 ? "aujourd'hui" :
; 696  : 						age == 1 ? "hier" :
; 697  : 						age == 2 ? "avant hier" :
; 698  : 						age == -1 ? "demain" :
; 699  : 						age == -2 ? "après demain" : "") :
; 700  : 				datetxt_day(cntxt, date_out, date, len, 1, 1);

	mov	ecx, DWORD PTR _age$70745[ebp]
	push	ecx
	call	_abs
	add	esp, 4
	cmp	eax, 2
	jge	SHORT $L71013
	cmp	DWORD PTR _age$70745[ebp], 0
	jne	SHORT $L71011
	mov	DWORD PTR -24+[ebp], OFFSET FLAT:$SG70749
	jmp	SHORT $L71012
$L71011:
	cmp	DWORD PTR _age$70745[ebp], 1
	jne	SHORT $L71009
	mov	DWORD PTR -28+[ebp], OFFSET FLAT:$SG70750
	jmp	SHORT $L71010
$L71009:
	cmp	DWORD PTR _age$70745[ebp], 2
	jne	SHORT $L71007
	mov	DWORD PTR -32+[ebp], OFFSET FLAT:$SG70751
	jmp	SHORT $L71008
$L71007:
	cmp	DWORD PTR _age$70745[ebp], -1
	jne	SHORT $L71005
	mov	DWORD PTR -36+[ebp], OFFSET FLAT:$SG70752
	jmp	SHORT $L71006
$L71005:
	cmp	DWORD PTR _age$70745[ebp], -2		; fffffffeH
	jne	SHORT $L71003
	mov	DWORD PTR -40+[ebp], OFFSET FLAT:$SG70753
	jmp	SHORT $L71004
$L71003:
	mov	DWORD PTR -40+[ebp], OFFSET FLAT:$SG70754
$L71004:
	mov	edx, DWORD PTR -40+[ebp]
	mov	DWORD PTR -36+[ebp], edx
$L71006:
	mov	eax, DWORD PTR -36+[ebp]
	mov	DWORD PTR -32+[ebp], eax
$L71008:
	mov	ecx, DWORD PTR -32+[ebp]
	mov	DWORD PTR -28+[ebp], ecx
$L71010:
	mov	edx, DWORD PTR -28+[ebp]
	mov	DWORD PTR -24+[ebp], edx
$L71012:
	mov	eax, DWORD PTR -24+[ebp]
	push	eax
	mov	ecx, DWORD PTR _date_out$[ebp]
	push	ecx
	call	_sprintf
	add	esp, 8
	mov	DWORD PTR -44+[ebp], eax
	jmp	SHORT $L71014
$L71013:
	push	1
	push	1
	mov	edx, DWORD PTR _len$[ebp]
	push	edx
	mov	eax, DWORD PTR _date$[ebp]
	push	eax
	mov	ecx, DWORD PTR _date_out$[ebp]
	push	ecx
	mov	edx, DWORD PTR _cntxt$[ebp]
	push	edx
	call	_datetxt_day
	add	esp, 24					; 00000018H
	mov	DWORD PTR -44+[ebp], eax
$L71014:
	mov	eax, DWORD PTR -44+[ebp]
	mov	DWORD PTR _sz$70748[ebp], eax

; 701  : 			if(len > 8) datetxt_time(date_out + sz, date, len, 12);

	cmp	DWORD PTR _len$[ebp], 8
	jbe	SHORT $L70755
	push	12					; 0000000cH
	mov	ecx, DWORD PTR _len$[ebp]
	push	ecx
	mov	edx, DWORD PTR _date$[ebp]
	push	edx
	mov	eax, DWORD PTR _date_out$[ebp]
	add	eax, DWORD PTR _sz$70748[ebp]
	push	eax
	call	_datetxt_time
	add	esp, 16					; 00000010H
$L70755:

; 703  : 		else

	jmp	SHORT $L70756
$L70747:

; 704  : 			datetxt_to_numbers(date_out, date, len, 0, 0);

	push	0
	push	0
	mov	ecx, DWORD PTR _len$[ebp]
	push	ecx
	mov	edx, DWORD PTR _date$[ebp]
	push	edx
	mov	eax, DWORD PTR _date_out$[ebp]
	push	eax
	call	_datetxt_to_numbers
	add	esp, 20					; 00000014H
$L70756:

; 706  : 	else if(!strcmp(format, "_EVA_DATE_SORT"))

	jmp	SHORT $L70763
$L70742:
	push	OFFSET FLAT:$SG70759
	mov	ecx, DWORD PTR _format$[ebp]
	push	ecx
	call	_strcmp
	add	esp, 8
	test	eax, eax
	jne	SHORT $L70758

; 708  : 		sprintf(date_out, "%.4s-%.2s-%.2s",
; 709  : 			date, len > 4 ? date+4 : "01", len > 6 ? date+6 : "01");

	cmp	DWORD PTR _len$[ebp], 6
	jbe	SHORT $L71015
	mov	edx, DWORD PTR _date$[ebp]
	add	edx, 6
	mov	DWORD PTR -48+[ebp], edx
	jmp	SHORT $L71016
$L71015:
	mov	DWORD PTR -48+[ebp], OFFSET FLAT:$SG70760
$L71016:
	cmp	DWORD PTR _len$[ebp], 4
	jbe	SHORT $L71017
	mov	eax, DWORD PTR _date$[ebp]
	add	eax, 4
	mov	DWORD PTR -52+[ebp], eax
	jmp	SHORT $L71018
$L71017:
	mov	DWORD PTR -52+[ebp], OFFSET FLAT:$SG70761
$L71018:
	mov	ecx, DWORD PTR -48+[ebp]
	push	ecx
	mov	edx, DWORD PTR -52+[ebp]
	push	edx
	mov	eax, DWORD PTR _date$[ebp]
	push	eax
	push	OFFSET FLAT:$SG70762
	mov	ecx, DWORD PTR _date_out$[ebp]
	push	ecx
	call	_sprintf
	add	esp, 20					; 00000014H

; 711  : 	else

	jmp	SHORT $L70763
$L70758:

; 712  : 		datetxt_to_numbers(date_out, date, len, 0, 0);

	push	0
	push	0
	mov	edx, DWORD PTR _len$[ebp]
	push	edx
	mov	eax, DWORD PTR _date$[ebp]
	push	eax
	mov	ecx, DWORD PTR _date_out$[ebp]
	push	ecx
	call	_datetxt_to_numbers
	add	esp, 20					; 00000014H
$L70763:

; 713  : 
; 714  : 	return 0;

	xor	eax, eax
$L70635:

; 715  : }

	mov	esp, ebp
	pop	ebp
	ret	0
_datetxt_to_format ENDP
_TEXT	ENDS
PUBLIC	_number_space_thousands
EXTRN	_memcpy:NEAR
EXTRN	_strchr:NEAR
_BSS	SEGMENT
	ALIGN	4

_?num@?1??number_space_thousands@@9@9 DB 040H DUP (?)
_BSS	ENDS
_DATA	SEGMENT
	ORG $+1
$SG70786 DB	'0123456789.', 00H
_DATA	ENDS
_TEXT	SEGMENT
_stdnum$ = 8
_decimals$ = 12
_len$ = -24
_spc$ = -12
_end$ = -16
_in$ = -20
_out$ = -8
_chk$ = -4
_i$70796 = -28
_i$70804 = -32
_number_space_thousands PROC NEAR

; 724  : ){

	push	ebp
	mov	ebp, esp
	sub	esp, 36					; 00000024H

; 725  : 	static char num[64];
; 726  : 	size_t len = strlen(stdnum), spc;

	mov	eax, DWORD PTR _stdnum$[ebp]
	push	eax
	call	_strlen
	add	esp, 4
	mov	DWORD PTR _len$[ebp], eax

; 727  : 	char *end = strchr(stdnum, '.');

	push	46					; 0000002eH
	mov	ecx, DWORD PTR _stdnum$[ebp]
	push	ecx
	call	_strchr
	add	esp, 8
	mov	DWORD PTR _end$[ebp], eax

; 728  : 	char *in = stdnum, *out = num, *chk;

	mov	edx, DWORD PTR _stdnum$[ebp]
	mov	DWORD PTR _in$[ebp], edx
	mov	DWORD PTR _out$[ebp], OFFSET FLAT:_?num@?1??number_space_thousands@@9@9

; 729  : 	if(!stdnum) return stdnum;

	cmp	DWORD PTR _stdnum$[ebp], 0
	jne	SHORT $L70777
	mov	eax, DWORD PTR _stdnum$[ebp]
	jmp	$L70768
$L70777:

; 730  : 	if(!end) end = stdnum + len;

	cmp	DWORD PTR _end$[ebp], 0
	jne	SHORT $L70778
	mov	eax, DWORD PTR _stdnum$[ebp]
	add	eax, DWORD PTR _len$[ebp]
	mov	DWORD PTR _end$[ebp], eax
$L70778:

; 731  : 	memset(num, 0, sizeof(num));

	push	64					; 00000040H
	push	0
	push	OFFSET FLAT:_?num@?1??number_space_thousands@@9@9
	call	_memset
	add	esp, 12					; 0000000cH

; 732  : 
; 733  : 	/* Check number */
; 734  : 	if(!len || len > 32) return stdnum;

	cmp	DWORD PTR _len$[ebp], 0
	je	SHORT $L70780
	cmp	DWORD PTR _len$[ebp], 32		; 00000020H
	jbe	SHORT $L70779
$L70780:
	mov	eax, DWORD PTR _stdnum$[ebp]
	jmp	$L70768
$L70779:

; 735  : 	if(*in == '-') { *out = *in; in++; out++; }

	mov	ecx, DWORD PTR _in$[ebp]
	movsx	edx, BYTE PTR [ecx]
	cmp	edx, 45					; 0000002dH
	jne	SHORT $L70781
	mov	eax, DWORD PTR _out$[ebp]
	mov	ecx, DWORD PTR _in$[ebp]
	mov	dl, BYTE PTR [ecx]
	mov	BYTE PTR [eax], dl
	mov	eax, DWORD PTR _in$[ebp]
	add	eax, 1
	mov	DWORD PTR _in$[ebp], eax
	mov	ecx, DWORD PTR _out$[ebp]
	add	ecx, 1
	mov	DWORD PTR _out$[ebp], ecx
$L70781:

; 736  : 	chk = in;

	mov	edx, DWORD PTR _in$[ebp]
	mov	DWORD PTR _chk$[ebp], edx
$L70783:

; 737  : 	while(*chk)

	mov	eax, DWORD PTR _chk$[ebp]
	movsx	ecx, BYTE PTR [eax]
	test	ecx, ecx
	je	SHORT $L70784

; 738  : 		if(strchr("0123456789.", *chk)) chk++;

	mov	edx, DWORD PTR _chk$[ebp]
	movsx	eax, BYTE PTR [edx]
	push	eax
	push	OFFSET FLAT:$SG70786
	call	_strchr
	add	esp, 8
	test	eax, eax
	je	SHORT $L70785
	mov	ecx, DWORD PTR _chk$[ebp]
	add	ecx, 1
	mov	DWORD PTR _chk$[ebp], ecx

; 739  : 		else return stdnum;

	jmp	SHORT $L70787
$L70785:
	mov	eax, DWORD PTR _stdnum$[ebp]
	jmp	$L70768
$L70787:
	jmp	SHORT $L70783
$L70784:

; 740  : 
; 741  : 	/* Copy blocks of 3 chars */
; 742  : 	if(decimals > 10) decimals = 10;

	cmp	DWORD PTR _decimals$[ebp], 10		; 0000000aH
	jle	SHORT $L70788
	mov	DWORD PTR _decimals$[ebp], 10		; 0000000aH

; 743  : 	else if(decimals < -10) decimals = -10;

	jmp	SHORT $L70790
$L70788:
	cmp	DWORD PTR _decimals$[ebp], -10		; fffffff6H
	jge	SHORT $L70790
	mov	DWORD PTR _decimals$[ebp], -10		; fffffff6H
$L70790:

; 744  : 	spc = end - in;

	mov	edx, DWORD PTR _end$[ebp]
	sub	edx, DWORD PTR _in$[ebp]
	mov	DWORD PTR _spc$[ebp], edx

; 745  : 	spc %= 3;

	mov	eax, DWORD PTR _spc$[ebp]
	xor	edx, edx
	mov	ecx, 3
	div	ecx
	mov	DWORD PTR _spc$[ebp], edx
$L70792:

; 746  : 	while(*in && *in != '.' && in < end)

	mov	edx, DWORD PTR _in$[ebp]
	movsx	eax, BYTE PTR [edx]
	test	eax, eax
	je	SHORT $L70793
	mov	ecx, DWORD PTR _in$[ebp]
	movsx	edx, BYTE PTR [ecx]
	cmp	edx, 46					; 0000002eH
	je	SHORT $L70793
	mov	eax, DWORD PTR _in$[ebp]
	cmp	eax, DWORD PTR _end$[ebp]
	jae	SHORT $L70793

; 748  : 		if(*num) *out++ = ' ';

	movsx	ecx, BYTE PTR _?num@?1??number_space_thousands@@9@9
	test	ecx, ecx
	je	SHORT $L70794
	mov	edx, DWORD PTR _out$[ebp]
	mov	BYTE PTR [edx], 32			; 00000020H
	mov	eax, DWORD PTR _out$[ebp]
	add	eax, 1
	mov	DWORD PTR _out$[ebp], eax
$L70794:

; 749  : 		memcpy(out, in, spc);

	mov	ecx, DWORD PTR _spc$[ebp]
	push	ecx
	mov	edx, DWORD PTR _in$[ebp]
	push	edx
	mov	eax, DWORD PTR _out$[ebp]
	push	eax
	call	_memcpy
	add	esp, 12					; 0000000cH

; 750  : 		out += spc;

	mov	ecx, DWORD PTR _out$[ebp]
	add	ecx, DWORD PTR _spc$[ebp]
	mov	DWORD PTR _out$[ebp], ecx

; 751  : 		in += spc;

	mov	edx, DWORD PTR _in$[ebp]
	add	edx, DWORD PTR _spc$[ebp]
	mov	DWORD PTR _in$[ebp], edx

; 752  : 		spc = 3;

	mov	DWORD PTR _spc$[ebp], 3

; 753  : 	}

	jmp	SHORT $L70792
$L70793:

; 754  : 
; 755  : 	/* Handle decimals */
; 756  : 	if(decimals > 0)

	cmp	DWORD PTR _decimals$[ebp], 0
	jle	SHORT $L70795

; 758  : 		/* Add decimals if positive */
; 759  : 		int i;
; 760  : 		if(*in == '.') in++;

	mov	eax, DWORD PTR _in$[ebp]
	movsx	ecx, BYTE PTR [eax]
	cmp	ecx, 46					; 0000002eH
	jne	SHORT $L70797
	mov	edx, DWORD PTR _in$[ebp]
	add	edx, 1
	mov	DWORD PTR _in$[ebp], edx
$L70797:

; 761  : 		*out++ = '.';

	mov	eax, DWORD PTR _out$[ebp]
	mov	BYTE PTR [eax], 46			; 0000002eH
	mov	ecx, DWORD PTR _out$[ebp]
	add	ecx, 1
	mov	DWORD PTR _out$[ebp], ecx

; 762  : 		for(i = 0; i < decimals; i++)	*out++ = (char)(*in ? *in++ : '0');

	mov	DWORD PTR _i$70796[ebp], 0
	jmp	SHORT $L70798
$L70799:
	mov	edx, DWORD PTR _i$70796[ebp]
	add	edx, 1
	mov	DWORD PTR _i$70796[ebp], edx
$L70798:
	mov	eax, DWORD PTR _i$70796[ebp]
	cmp	eax, DWORD PTR _decimals$[ebp]
	jge	SHORT $L70800
	mov	ecx, DWORD PTR _in$[ebp]
	movsx	edx, BYTE PTR [ecx]
	test	edx, edx
	je	SHORT $L71020
	mov	eax, DWORD PTR _in$[ebp]
	movsx	ecx, BYTE PTR [eax]
	mov	DWORD PTR -36+[ebp], ecx
	mov	edx, DWORD PTR _in$[ebp]
	add	edx, 1
	mov	DWORD PTR _in$[ebp], edx
	jmp	SHORT $L71021
$L71020:
	mov	DWORD PTR -36+[ebp], 48			; 00000030H
$L71021:
	mov	eax, DWORD PTR _out$[ebp]
	mov	cl, BYTE PTR -36+[ebp]
	mov	BYTE PTR [eax], cl
	mov	edx, DWORD PTR _out$[ebp]
	add	edx, 1
	mov	DWORD PTR _out$[ebp], edx
	jmp	SHORT $L70799
$L70800:

; 764  : 	else if(decimals < 0)

	jmp	SHORT $L70807
$L70795:
	cmp	DWORD PTR _decimals$[ebp], 0
	jge	SHORT $L70807

; 766  : 		/* Round integer part */
; 767  : 		int i;
; 768  : 		for(i = 0; i < -decimals && out > num; i++)

	mov	DWORD PTR _i$70804[ebp], 0
	jmp	SHORT $L70805
$L70806:
	mov	eax, DWORD PTR _i$70804[ebp]
	add	eax, 1
	mov	DWORD PTR _i$70804[ebp], eax
$L70805:
	mov	ecx, DWORD PTR _decimals$[ebp]
	neg	ecx
	cmp	DWORD PTR _i$70804[ebp], ecx
	jge	SHORT $L70807
	cmp	DWORD PTR _out$[ebp], OFFSET FLAT:_?num@?1??number_space_thousands@@9@9
	jbe	SHORT $L70807

; 770  : 			if(*out != ' ') { out--; decimals--; } else *out-- = '0';

	mov	edx, DWORD PTR _out$[ebp]
	movsx	eax, BYTE PTR [edx]
	cmp	eax, 32					; 00000020H
	je	SHORT $L70808
	mov	ecx, DWORD PTR _out$[ebp]
	sub	ecx, 1
	mov	DWORD PTR _out$[ebp], ecx
	mov	edx, DWORD PTR _decimals$[ebp]
	sub	edx, 1
	mov	DWORD PTR _decimals$[ebp], edx
	jmp	SHORT $L70809
$L70808:
	mov	eax, DWORD PTR _out$[ebp]
	mov	BYTE PTR [eax], 48			; 00000030H
	mov	ecx, DWORD PTR _out$[ebp]
	sub	ecx, 1
	mov	DWORD PTR _out$[ebp], ecx
$L70809:

; 771  : 		}

	jmp	SHORT $L70806
$L70807:

; 773  : 
; 774  : 	return num;

	mov	eax, OFFSET FLAT:_?num@?1??number_space_thousands@@9@9
$L70768:

; 775  : }

	mov	esp, ebp
	pop	ebp
	ret	0
_number_space_thousands ENDP
_TEXT	ENDS
PUBLIC	_input_to_number
_BSS	SEGMENT
_?num@?1??input_to_number@@9@9 DB 020H DUP (?)
_BSS	ENDS
_DATA	SEGMENT
$SG70827 DB	'.,', 00H
	ORG $+1
$SG70836 DB	'-', 00H
	ORG $+2
$SG70837 DB	'0', 00H
_DATA	ENDS
_TEXT	SEGMENT
_in$ = 8
_input$ = -4
_n$ = -12
_b_sep$ = -8
_input_to_number PROC NEAR

; 782  : {

	push	ebp
	mov	ebp, esp
	sub	esp, 12					; 0000000cH

; 783  : 	static char num[32];
; 784  : 	char *input = in;

	mov	eax, DWORD PTR _in$[ebp]
	mov	DWORD PTR _input$[ebp], eax

; 785  : 	char *n = num;

	mov	DWORD PTR _n$[ebp], OFFSET FLAT:_?num@?1??input_to_number@@9@9

; 786  : 	int b_sep = 0;

	mov	DWORD PTR _b_sep$[ebp], 0

; 787  : 	if(*input == '-') *n++ = *input++;

	mov	ecx, DWORD PTR _input$[ebp]
	movsx	edx, BYTE PTR [ecx]
	cmp	edx, 45					; 0000002dH
	jne	SHORT $L70818
	mov	eax, DWORD PTR _n$[ebp]
	mov	ecx, DWORD PTR _input$[ebp]
	mov	dl, BYTE PTR [ecx]
	mov	BYTE PTR [eax], dl
	mov	eax, DWORD PTR _n$[ebp]
	add	eax, 1
	mov	DWORD PTR _n$[ebp], eax
	mov	ecx, DWORD PTR _input$[ebp]
	add	ecx, 1
	mov	DWORD PTR _input$[ebp], ecx
$L70818:

; 788  : 	while(*input && n - num < sizeof(num) - 1)

	mov	edx, DWORD PTR _input$[ebp]
	movsx	eax, BYTE PTR [edx]
	test	eax, eax
	je	$L70821
	mov	ecx, DWORD PTR _n$[ebp]
	sub	ecx, OFFSET FLAT:_?num@?1??input_to_number@@9@9
	cmp	ecx, 31					; 0000001fH
	jae	$L70821

; 790  : 		/* Keep digits without leading zero */
; 791  : 		if((*input > '0' && *input <= '9') || (*input == '0' && n > num) )

	mov	edx, DWORD PTR _input$[ebp]
	movsx	eax, BYTE PTR [edx]
	cmp	eax, 48					; 00000030H
	jle	SHORT $L70824
	mov	ecx, DWORD PTR _input$[ebp]
	movsx	edx, BYTE PTR [ecx]
	cmp	edx, 57					; 00000039H
	jle	SHORT $L70823
$L70824:
	mov	eax, DWORD PTR _input$[ebp]
	movsx	ecx, BYTE PTR [eax]
	cmp	ecx, 48					; 00000030H
	jne	SHORT $L70822
	cmp	DWORD PTR _n$[ebp], OFFSET FLAT:_?num@?1??input_to_number@@9@9
	jbe	SHORT $L70822
$L70823:

; 792  : 			*n++ = *input;

	mov	edx, DWORD PTR _n$[ebp]
	mov	eax, DWORD PTR _input$[ebp]
	mov	cl, BYTE PTR [eax]
	mov	BYTE PTR [edx], cl
	mov	edx, DWORD PTR _n$[ebp]
	add	edx, 1
	mov	DWORD PTR _n$[ebp], edx

; 793  : 
; 794  : 		/* Keep first decimal separator */
; 795  : 		else if(strchr(".,", *input) && !b_sep)

	jmp	SHORT $L70826
$L70822:
	mov	eax, DWORD PTR _input$[ebp]
	movsx	ecx, BYTE PTR [eax]
	push	ecx
	push	OFFSET FLAT:$SG70827
	call	_strchr
	add	esp, 8
	test	eax, eax
	je	SHORT $L70826
	cmp	DWORD PTR _b_sep$[ebp], 0
	jne	SHORT $L70826

; 797  : 			b_sep = 1;

	mov	DWORD PTR _b_sep$[ebp], 1

; 798  : 
; 799  : 			/* Insert leading zero before decimal separator */
; 800  : 			if(n == num) *n++ = '0';

	cmp	DWORD PTR _n$[ebp], OFFSET FLAT:_?num@?1??input_to_number@@9@9
	jne	SHORT $L70828
	mov	edx, DWORD PTR _n$[ebp]
	mov	BYTE PTR [edx], 48			; 00000030H
	mov	eax, DWORD PTR _n$[ebp]
	add	eax, 1
	mov	DWORD PTR _n$[ebp], eax
$L70828:

; 801  : 			*n++ = '.';

	mov	ecx, DWORD PTR _n$[ebp]
	mov	BYTE PTR [ecx], 46			; 0000002eH
	mov	edx, DWORD PTR _n$[ebp]
	add	edx, 1
	mov	DWORD PTR _n$[ebp], edx
$L70826:

; 803  : 		input++;

	mov	eax, DWORD PTR _input$[ebp]
	add	eax, 1
	mov	DWORD PTR _input$[ebp], eax

; 804  : 	}

	jmp	$L70818
$L70821:

; 805  : 
; 806  : 	/* Remove trailing zeros after decimal separator */
; 807  : 	if(b_sep)

	cmp	DWORD PTR _b_sep$[ebp], 0
	je	SHORT $L70833
$L70831:

; 809  : 		while(n > num && *(n - 1) == '0') n--;

	cmp	DWORD PTR _n$[ebp], OFFSET FLAT:_?num@?1??input_to_number@@9@9
	jbe	SHORT $L70832
	mov	ecx, DWORD PTR _n$[ebp]
	movsx	edx, BYTE PTR [ecx-1]
	cmp	edx, 48					; 00000030H
	jne	SHORT $L70832
	mov	eax, DWORD PTR _n$[ebp]
	sub	eax, 1
	mov	DWORD PTR _n$[ebp], eax
	jmp	SHORT $L70831
$L70832:

; 810  : 		/* Remove trailing decimal separator */
; 811  : 		if(*(n - 1) == '.') n--;

	mov	ecx, DWORD PTR _n$[ebp]
	movsx	edx, BYTE PTR [ecx-1]
	cmp	edx, 46					; 0000002eH
	jne	SHORT $L70833
	mov	eax, DWORD PTR _n$[ebp]
	sub	eax, 1
	mov	DWORD PTR _n$[ebp], eax
$L70833:

; 813  : 	*n = 0;

	mov	ecx, DWORD PTR _n$[ebp]
	mov	BYTE PTR [ecx], 0

; 814  : 	if(in && *in && (n == num || !strcmp(num, "-"))) sprintf(num, "0");

	cmp	DWORD PTR _in$[ebp], 0
	je	SHORT $L70834
	mov	edx, DWORD PTR _in$[ebp]
	movsx	eax, BYTE PTR [edx]
	test	eax, eax
	je	SHORT $L70834
	cmp	DWORD PTR _n$[ebp], OFFSET FLAT:_?num@?1??input_to_number@@9@9
	je	SHORT $L70835
	push	OFFSET FLAT:$SG70836
	push	OFFSET FLAT:_?num@?1??input_to_number@@9@9
	call	_strcmp
	add	esp, 8
	test	eax, eax
	jne	SHORT $L70834
$L70835:
	push	OFFSET FLAT:$SG70837
	push	OFFSET FLAT:_?num@?1??input_to_number@@9@9
	call	_sprintf
	add	esp, 8
$L70834:

; 815  : 	return num;

	mov	eax, OFFSET FLAT:_?num@?1??input_to_number@@9@9

; 816  : }

	mov	esp, ebp
	pop	ebp
	ret	0
_input_to_number ENDP
_TEXT	ENDS
PUBLIC	_human_filesize
PUBLIC	__real@8@4008fa00000000000000
PUBLIC	__real@8@4002a000000000000000
PUBLIC	__real@8@4005c800000000000000
EXTRN	__ftol:NEAR
EXTRN	__fltused:NEAR
_BSS	SEGMENT
_?num@?1??human_filesize@@9@9 DB 020H DUP (?)
_BSS	ENDS
_DATA	SEGMENT
	ORG $+2
$SG70846 DB	'octets', 00H
	ORG $+1
$SG70848 DB	'ko', 00H
	ORG $+1
$SG70850 DB	'Mo', 00H
	ORG $+1
$SG70852 DB	'Go', 00H
	ORG $+1
$SG70854 DB	'To', 00H
	ORG $+1
$SG70856 DB	'Po', 00H
	ORG $+1
$SG70858 DB	'%1.2lf %s', 00H
	ORG $+2
$SG70861 DB	'%1.1lf %s', 00H
	ORG $+2
$SG70864 DB	'%d %s', 00H
	ORG $+2
$SG70867 DB	'%du', 00H
_DATA	ENDS
;	COMDAT __real@8@4008fa00000000000000
; File D:\Travail\ABI\EVA\V4.0\CGI\Brunix-2016\date_utils.c
CONST	SEGMENT
__real@8@4008fa00000000000000 DQ 0408f400000000000r ; 1000
CONST	ENDS
;	COMDAT __real@8@4002a000000000000000
CONST	SEGMENT
__real@8@4002a000000000000000 DQ 04024000000000000r ; 10
CONST	ENDS
;	COMDAT __real@8@4005c800000000000000
CONST	SEGMENT
__real@8@4005c800000000000000 DQ 04059000000000000r ; 100
CONST	ENDS
_TEXT	SEGMENT
_size$ = 8
_numf$ = -12
_unit$ = -4
_human_filesize PROC NEAR

; 823  : {

	push	ebp
	mov	ebp, esp
	sub	esp, 20					; 00000014H

; 824  : 	static char num[32];
; 825  : 	double numf = (double) size;

	mov	eax, DWORD PTR _size$[ebp]
	mov	DWORD PTR -20+[ebp], eax
	mov	DWORD PTR -20+[ebp+4], 0
	fild	QWORD PTR -20+[ebp]
	fstp	QWORD PTR _numf$[ebp]

; 826  : 	char *unit = "octets";

	mov	DWORD PTR _unit$[ebp], OFFSET FLAT:$SG70846

; 827  : 	*num = 0;

	mov	BYTE PTR _?num@?1??human_filesize@@9@9, 0

; 828  : 	if(numf >= 1000.)

	fld	QWORD PTR _numf$[ebp]
	fcomp	QWORD PTR __real@8@4008fa00000000000000
	fnstsw	ax
	test	ah, 1
	jne	$L70847

; 830  : 		numf /= 1000.;

	fld	QWORD PTR _numf$[ebp]
	fdiv	QWORD PTR __real@8@4008fa00000000000000
	fstp	QWORD PTR _numf$[ebp]

; 831  : 		unit = "ko";

	mov	DWORD PTR _unit$[ebp], OFFSET FLAT:$SG70848

; 832  : 		if(numf >= 1000.)

	fld	QWORD PTR _numf$[ebp]
	fcomp	QWORD PTR __real@8@4008fa00000000000000
	fnstsw	ax
	test	ah, 1
	jne	SHORT $L70855

; 834  : 			numf /= 1000.;

	fld	QWORD PTR _numf$[ebp]
	fdiv	QWORD PTR __real@8@4008fa00000000000000
	fstp	QWORD PTR _numf$[ebp]

; 835  : 			unit = "Mo";

	mov	DWORD PTR _unit$[ebp], OFFSET FLAT:$SG70850

; 836  : 			if(numf >= 1000.)

	fld	QWORD PTR _numf$[ebp]
	fcomp	QWORD PTR __real@8@4008fa00000000000000
	fnstsw	ax
	test	ah, 1
	jne	SHORT $L70855

; 838  : 				numf /= 1000.;

	fld	QWORD PTR _numf$[ebp]
	fdiv	QWORD PTR __real@8@4008fa00000000000000
	fstp	QWORD PTR _numf$[ebp]

; 839  : 				unit = "Go";

	mov	DWORD PTR _unit$[ebp], OFFSET FLAT:$SG70852

; 840  : 				if(numf >= 1000.)

	fld	QWORD PTR _numf$[ebp]
	fcomp	QWORD PTR __real@8@4008fa00000000000000
	fnstsw	ax
	test	ah, 1
	jne	SHORT $L70855

; 842  : 					numf /= 1000.;

	fld	QWORD PTR _numf$[ebp]
	fdiv	QWORD PTR __real@8@4008fa00000000000000
	fstp	QWORD PTR _numf$[ebp]

; 843  : 					unit = "To";

	mov	DWORD PTR _unit$[ebp], OFFSET FLAT:$SG70854

; 844  : 					if(numf >= 1000.)

	fld	QWORD PTR _numf$[ebp]
	fcomp	QWORD PTR __real@8@4008fa00000000000000
	fnstsw	ax
	test	ah, 1
	jne	SHORT $L70855

; 846  : 						numf /= 1000.;

	fld	QWORD PTR _numf$[ebp]
	fdiv	QWORD PTR __real@8@4008fa00000000000000
	fstp	QWORD PTR _numf$[ebp]

; 847  : 						unit = "Po";

	mov	DWORD PTR _unit$[ebp], OFFSET FLAT:$SG70856
$L70855:

; 852  : 		if(numf < 10) sprintf(num, "%1.2lf %s", numf, unit);

	fld	QWORD PTR _numf$[ebp]
	fcomp	QWORD PTR __real@8@4002a000000000000000
	fnstsw	ax
	test	ah, 1
	je	SHORT $L70857
	mov	ecx, DWORD PTR _unit$[ebp]
	push	ecx
	mov	edx, DWORD PTR _numf$[ebp+4]
	push	edx
	mov	eax, DWORD PTR _numf$[ebp]
	push	eax
	push	OFFSET FLAT:$SG70858
	push	OFFSET FLAT:_?num@?1??human_filesize@@9@9
	call	_sprintf
	add	esp, 20					; 00000014H

; 853  : 		else if(numf < 100) sprintf(num, "%1.1lf %s", numf, unit);

	jmp	SHORT $L70862
$L70857:
	fld	QWORD PTR _numf$[ebp]
	fcomp	QWORD PTR __real@8@4005c800000000000000
	fnstsw	ax
	test	ah, 1
	je	SHORT $L70860
	mov	ecx, DWORD PTR _unit$[ebp]
	push	ecx
	mov	edx, DWORD PTR _numf$[ebp+4]
	push	edx
	mov	eax, DWORD PTR _numf$[ebp]
	push	eax
	push	OFFSET FLAT:$SG70861
	push	OFFSET FLAT:_?num@?1??human_filesize@@9@9
	call	_sprintf
	add	esp, 20					; 00000014H

; 854  : 		else sprintf(num, "%d %s", (int)numf, unit);

	jmp	SHORT $L70862
$L70860:
	mov	ecx, DWORD PTR _unit$[ebp]
	push	ecx
	fld	QWORD PTR _numf$[ebp]
	call	__ftol
	push	eax
	push	OFFSET FLAT:$SG70864
	push	OFFSET FLAT:_?num@?1??human_filesize@@9@9
	call	_sprintf
	add	esp, 16					; 00000010H
$L70862:

; 856  : 	else

	jmp	SHORT $L70865
$L70847:

; 857  : 		sprintf(num, "%du", (int)size);

	mov	edx, DWORD PTR _size$[ebp]
	push	edx
	push	OFFSET FLAT:$SG70867
	push	OFFSET FLAT:_?num@?1??human_filesize@@9@9
	call	_sprintf
	add	esp, 12					; 0000000cH
$L70865:

; 858  : 
; 859  : 	return num;

	mov	eax, OFFSET FLAT:_?num@?1??human_filesize@@9@9

; 860  : }

	mov	esp, ebp
	pop	ebp
	ret	0
_human_filesize ENDP
_TEXT	ENDS
PUBLIC	_number_to_format
EXTRN	_atof:NEAR
EXTRN	_strtol:NEAR
EXTRN	_stricmp:NEAR
_BSS	SEGMENT
_?num@?1??number_to_format@@9@9 DB 020H DUP (?)
$SG70880 DB	01H DUP (?)
_BSS	ENDS
_DATA	SEGMENT
$SG70882 DB	'_EVA_Std', 00H
	ORG $+3
$SG70883 DB	'%ld', 00H
$SG70886 DB	'_EVA_StdDec', 00H
$SG70887 DB	'%lf', 00H
$SG70890 DB	'_EVA_FILESIZE', 00H
	ORG $+2
$SG70893 DB	'_EVA_Money', 00H
	ORG $+1
$SG70894 DB	'%1.2lf', 00H
_DATA	ENDS
_TEXT	SEGMENT
_in$ = 8
_format$ = 12
_numl$ = -4
_numf$ = -12
_number_to_format PROC NEAR

; 867  : {

	push	ebp
	mov	ebp, esp
	sub	esp, 24					; 00000018H

; 868  : 	static char num[32];
; 869  : 	long numl = in ? strtol(in, NULL, 10) : 0;

	cmp	DWORD PTR _in$[ebp], 0
	je	SHORT $L71033
	push	10					; 0000000aH
	push	0
	mov	eax, DWORD PTR _in$[ebp]
	push	eax
	call	_strtol
	add	esp, 12					; 0000000cH
	mov	DWORD PTR -16+[ebp], eax
	jmp	SHORT $L71034
$L71033:
	mov	DWORD PTR -16+[ebp], 0
$L71034:
	mov	ecx, DWORD PTR -16+[ebp]
	mov	DWORD PTR _numl$[ebp], ecx

; 870  : 	double numf = in ? atof(in) : 0.0;

	cmp	DWORD PTR _in$[ebp], 0
	je	SHORT $L71035
	mov	edx, DWORD PTR _in$[ebp]
	push	edx
	call	_atof
	add	esp, 4
	fstp	QWORD PTR -24+[ebp]
	jmp	SHORT $L71036
$L71035:
	mov	DWORD PTR -24+[ebp], 0
	mov	DWORD PTR -24+[ebp+4], 0
$L71036:
	mov	eax, DWORD PTR -24+[ebp]
	mov	DWORD PTR _numf$[ebp], eax
	mov	ecx, DWORD PTR -24+[ebp+4]
	mov	DWORD PTR _numf$[ebp+4], ecx

; 871  : 	*num = 0;

	mov	BYTE PTR _?num@?1??number_to_format@@9@9, 0

; 872  : 	if(!in || !*in) return "";

	cmp	DWORD PTR _in$[ebp], 0
	je	SHORT $L70879
	mov	edx, DWORD PTR _in$[ebp]
	movsx	eax, BYTE PTR [edx]
	test	eax, eax
	jne	SHORT $L70878
$L70879:
	mov	eax, OFFSET FLAT:$SG70880
	jmp	$L70872
$L70878:

; 873  : 	if(!strcmp(format, "_EVA_Std")) sprintf(num, "%ld", numl);

	push	OFFSET FLAT:$SG70882
	mov	ecx, DWORD PTR _format$[ebp]
	push	ecx
	call	_strcmp
	add	esp, 8
	test	eax, eax
	jne	SHORT $L70881
	mov	edx, DWORD PTR _numl$[ebp]
	push	edx
	push	OFFSET FLAT:$SG70883
	push	OFFSET FLAT:_?num@?1??number_to_format@@9@9
	call	_sprintf
	add	esp, 12					; 0000000cH

; 874  : 	else if(!strcmp(format, "_EVA_StdDec")) sprintf(num, "%lf", numf);

	jmp	$L70895
$L70881:
	push	OFFSET FLAT:$SG70886
	mov	eax, DWORD PTR _format$[ebp]
	push	eax
	call	_strcmp
	add	esp, 8
	test	eax, eax
	jne	SHORT $L70885
	mov	ecx, DWORD PTR _numf$[ebp+4]
	push	ecx
	mov	edx, DWORD PTR _numf$[ebp]
	push	edx
	push	OFFSET FLAT:$SG70887
	push	OFFSET FLAT:_?num@?1??number_to_format@@9@9
	call	_sprintf
	add	esp, 16					; 00000010H

; 875  : 	else if(!strcmp(format, "_EVA_FILESIZE")) return human_filesize(numl);

	jmp	SHORT $L70895
$L70885:
	push	OFFSET FLAT:$SG70890
	mov	eax, DWORD PTR _format$[ebp]
	push	eax
	call	_strcmp
	add	esp, 8
	test	eax, eax
	jne	SHORT $L70889
	mov	ecx, DWORD PTR _numl$[ebp]
	push	ecx
	call	_human_filesize
	add	esp, 4
	jmp	SHORT $L70872
$L70889:

; 876  : 	else if(!STRCMPCASE(format, "_EVA_Money"))

	push	OFFSET FLAT:$SG70893
	mov	edx, DWORD PTR _format$[ebp]
	push	edx
	call	_stricmp
	add	esp, 8
	test	eax, eax
	jne	SHORT $L70892

; 878  : 		sprintf(num, "%1.2lf", numf);

	mov	eax, DWORD PTR _numf$[ebp+4]
	push	eax
	mov	ecx, DWORD PTR _numf$[ebp]
	push	ecx
	push	OFFSET FLAT:$SG70894
	push	OFFSET FLAT:_?num@?1??number_to_format@@9@9
	call	_sprintf
	add	esp, 16					; 00000010H

; 879  : 		return number_space_thousands(num, 2);

	push	2
	push	OFFSET FLAT:_?num@?1??number_to_format@@9@9
	call	_number_space_thousands
	add	esp, 8
	jmp	SHORT $L70872
$L70892:

; 881  : 	else
; 882  : 		return input_to_number(in);

	mov	edx, DWORD PTR _in$[ebp]
	push	edx
	call	_input_to_number
	add	esp, 4
	jmp	SHORT $L70872
$L70895:

; 883  : 
; 884  : 	return num;

	mov	eax, OFFSET FLAT:_?num@?1??number_to_format@@9@9
$L70872:

; 885  : }

	mov	esp, ebp
	pop	ebp
	ret	0
_number_to_format ENDP
_TEXT	ENDS
PUBLIC	_unique_bit_index
_TEXT	SEGMENT
_word$ = 8
_i$ = -4
_j$ = -8
_unique_bit_index PROC NEAR

; 893  : {

	push	ebp
	mov	ebp, esp
	sub	esp, 8

; 894  : 	int i, j;
; 895  : 	for(i = 1, j = 0; word; i++, word >>= 1)

	mov	DWORD PTR _i$[ebp], 1
	mov	DWORD PTR _j$[ebp], 0
	jmp	SHORT $L70901
$L70902:
	mov	eax, DWORD PTR _i$[ebp]
	add	eax, 1
	mov	DWORD PTR _i$[ebp], eax
	mov	ecx, DWORD PTR _word$[ebp]
	shr	ecx, 1
	mov	DWORD PTR _word$[ebp], ecx
$L70901:
	cmp	DWORD PTR _word$[ebp], 0
	je	SHORT $L70903

; 896  : 		if(word & 1)

	mov	edx, DWORD PTR _word$[ebp]
	and	edx, 1
	test	edx, edx
	je	SHORT $L70904

; 898  : 			if(j) return 0;

	cmp	DWORD PTR _j$[ebp], 0
	je	SHORT $L70905
	xor	eax, eax
	jmp	SHORT $L70898
$L70905:

; 899  : 			j = i;

	mov	eax, DWORD PTR _i$[ebp]
	mov	DWORD PTR _j$[ebp], eax
$L70904:

; 901  : 
; 902  : 	return j;

	jmp	SHORT $L70902
$L70903:
	mov	eax, DWORD PTR _j$[ebp]
$L70898:

; 903  : }

	mov	esp, ebp
	pop	ebp
	ret	0
_unique_bit_index ENDP
_TEXT	ENDS
PUBLIC	_dbl_str
_DATA	SEGMENT
	ORG $+1
$SG70914 DB	'%lf', 00H
_DATA	ENDS
_TEXT	SEGMENT
_txt$ = 8
_d$ = 12
_fmt$ = 20
_sz$ = -8
_dot$ = -4
_dbl_str PROC NEAR

; 913  : ){

	push	ebp
	mov	ebp, esp
	sub	esp, 12					; 0000000cH

; 914  : 	size_t sz = sprintf(txt, fmt ? fmt : "%lf", d);

	cmp	DWORD PTR _fmt$[ebp], 0
	je	SHORT $L71039
	mov	eax, DWORD PTR _fmt$[ebp]
	mov	DWORD PTR -12+[ebp], eax
	jmp	SHORT $L71040
$L71039:
	mov	DWORD PTR -12+[ebp], OFFSET FLAT:$SG70914
$L71040:
	mov	ecx, DWORD PTR _d$[ebp+4]
	push	ecx
	mov	edx, DWORD PTR _d$[ebp]
	push	edx
	mov	eax, DWORD PTR -12+[ebp]
	push	eax
	mov	ecx, DWORD PTR _txt$[ebp]
	push	ecx
	call	_sprintf
	add	esp, 16					; 00000010H
	mov	DWORD PTR _sz$[ebp], eax

; 915  : 	char *dot = strchr(txt, '.');

	push	46					; 0000002eH
	mov	edx, DWORD PTR _txt$[ebp]
	push	edx
	call	_strchr
	add	esp, 8
	mov	DWORD PTR _dot$[ebp], eax

; 916  : 	if(dot)

	cmp	DWORD PTR _dot$[ebp], 0
	je	SHORT $L70920
$L70918:

; 918  : 		while(sz && txt[sz - 1] == '0') txt[--sz] = 0;

	cmp	DWORD PTR _sz$[ebp], 0
	je	SHORT $L70919
	mov	eax, DWORD PTR _txt$[ebp]
	add	eax, DWORD PTR _sz$[ebp]
	movsx	ecx, BYTE PTR [eax-1]
	cmp	ecx, 48					; 00000030H
	jne	SHORT $L70919
	mov	edx, DWORD PTR _sz$[ebp]
	sub	edx, 1
	mov	DWORD PTR _sz$[ebp], edx
	mov	eax, DWORD PTR _txt$[ebp]
	add	eax, DWORD PTR _sz$[ebp]
	mov	BYTE PTR [eax], 0
	jmp	SHORT $L70918
$L70919:

; 919  : 		if(txt + sz == dot + 1)

	mov	ecx, DWORD PTR _txt$[ebp]
	add	ecx, DWORD PTR _sz$[ebp]
	mov	edx, DWORD PTR _dot$[ebp]
	add	edx, 1
	cmp	ecx, edx
	jne	SHORT $L70920

; 921  : 			*dot = 0;

	mov	eax, DWORD PTR _dot$[ebp]
	mov	BYTE PTR [eax], 0

; 922  : 			sz--;

	mov	ecx, DWORD PTR _sz$[ebp]
	sub	ecx, 1
	mov	DWORD PTR _sz$[ebp], ecx
$L70920:

; 925  : 	return sz;

	mov	eax, DWORD PTR _sz$[ebp]

; 926  : }

	mov	esp, ebp
	pop	ebp
	ret	0
_dbl_str ENDP
_TEXT	ENDS
PUBLIC	_mystrdup
EXTRN	_malloc:NEAR
_TEXT	SEGMENT
_src$ = 8
_sz$ = 12
_r$ = -4
_mystrdup PROC NEAR

; 933  : {

	push	ebp
	mov	ebp, esp
	push	ecx

; 934  : 	char *r = malloc(sz + 2);

	mov	eax, DWORD PTR _sz$[ebp]
	add	eax, 2
	push	eax
	call	_malloc
	add	esp, 4
	mov	DWORD PTR _r$[ebp], eax

; 935  : 	if(r)

	cmp	DWORD PTR _r$[ebp], 0
	je	SHORT $L70928

; 937  : 		memset(r, 0, sz + 1);

	mov	ecx, DWORD PTR _sz$[ebp]
	add	ecx, 1
	push	ecx
	push	0
	mov	edx, DWORD PTR _r$[ebp]
	push	edx
	call	_memset
	add	esp, 12					; 0000000cH

; 938  : 		if(src) memcpy(r, src, sz);

	cmp	DWORD PTR _src$[ebp], 0
	je	SHORT $L70928
	mov	eax, DWORD PTR _sz$[ebp]
	push	eax
	mov	ecx, DWORD PTR _src$[ebp]
	push	ecx
	mov	edx, DWORD PTR _r$[ebp]
	push	edx
	call	_memcpy
	add	esp, 12					; 0000000cH
$L70928:

; 940  : 	return r;

	mov	eax, DWORD PTR _r$[ebp]

; 941  : }

	mov	esp, ebp
	pop	ebp
	ret	0
_mystrdup ENDP
_TEXT	ENDS
END
