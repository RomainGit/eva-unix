	TITLE	D:\Travail\ABI\EVA\V4.0\CGI\Brunix-2016\dynbuf.c
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
PUBLIC	_dynbuf_init
EXTRN	_mem_alloc:NEAR
EXTRN	_memset:NEAR
_TEXT	SEGMENT
_sz$ = 8
_buf$ = -4
_dynbuf_init PROC NEAR

; 23   : ){

	push	ebp
	mov	ebp, esp
	push	ecx

; 24   : 	DynBuffer *buf = mem_alloc(sizeof(DynBuffer) + sz);

	mov	eax, DWORD PTR _sz$[ebp]
	add	eax, 12					; 0000000cH
	push	eax
	call	_mem_alloc
	add	esp, 4
	mov	DWORD PTR _buf$[ebp], eax

; 25   : 	if(!buf) return NULL;

	cmp	DWORD PTR _buf$[ebp], 0
	jne	SHORT $L70206
	xor	eax, eax
	jmp	SHORT $L70203
$L70206:

; 26   : 	memset(buf, 0, sizeof(DynBuffer) + sz);

	mov	ecx, DWORD PTR _sz$[ebp]
	add	ecx, 12					; 0000000cH
	push	ecx
	push	0
	mov	edx, DWORD PTR _buf$[ebp]
	push	edx
	call	_memset
	add	esp, 12					; 0000000cH

; 27   : 	buf->sz = sz;

	mov	eax, DWORD PTR _buf$[ebp]
	mov	ecx, DWORD PTR _sz$[ebp]
	mov	DWORD PTR [eax], ecx

; 28   : 	buf->data[0] = 0;       /* Initialisation of the buffer data's*/

	mov	edx, DWORD PTR _buf$[ebp]
	mov	BYTE PTR [edx+8], 0

; 29   : 	buf->cnt = 0;           /* Place of cursor */

	mov	eax, DWORD PTR _buf$[ebp]
	mov	DWORD PTR [eax+4], 0

; 30   : 	return buf;

	mov	eax, DWORD PTR _buf$[ebp]
$L70203:

; 31   : }

	mov	esp, ebp
	pop	ebp
	ret	0
_dynbuf_init ENDP
_TEXT	ENDS
PUBLIC	_dynbuf_resize
EXTRN	_mem_realloc:NEAR
_TEXT	SEGMENT
__buf$ = 8
_sz$ = 12
_buf$ = -8
_newsz$ = -12
_oldsz$ = -4
_dynbuf_resize PROC NEAR

; 49   : ){

	push	ebp
	mov	ebp, esp
	sub	esp, 16					; 00000010H

; 50   : 	DynBuffer *buf;
; 51   : 	size_t newsz, oldsz;
; 52   : 
; 53   : 	/* Check params */
; 54   : 	if(!_buf || !*_buf) return 1;

	cmp	DWORD PTR __buf$[ebp], 0
	je	SHORT $L70221
	mov	eax, DWORD PTR __buf$[ebp]
	cmp	DWORD PTR [eax], 0
	jne	SHORT $L70220
$L70221:
	mov	eax, 1
	jmp	SHORT $L70216
$L70220:

; 55   : 	buf = *_buf;

	mov	ecx, DWORD PTR __buf$[ebp]
	mov	edx, DWORD PTR [ecx]
	mov	DWORD PTR _buf$[ebp], edx

; 56   : 	oldsz = buf ? buf->sz + sizeof(DynBuffer) + 1 : 0;

	cmp	DWORD PTR _buf$[ebp], 0
	je	SHORT $L70345
	mov	eax, DWORD PTR _buf$[ebp]
	mov	ecx, DWORD PTR [eax]
	add	ecx, 13					; 0000000dH
	mov	DWORD PTR -16+[ebp], ecx
	jmp	SHORT $L70346
$L70345:
	mov	DWORD PTR -16+[ebp], 0
$L70346:
	mov	edx, DWORD PTR -16+[ebp]
	mov	DWORD PTR _oldsz$[ebp], edx

; 57   : 	newsz = (buf->sz + sz +sizeof(DynBuffer)) * 3 / 2;

	mov	eax, DWORD PTR _buf$[ebp]
	mov	ecx, DWORD PTR [eax]
	mov	edx, DWORD PTR _sz$[ebp]
	lea	eax, DWORD PTR [ecx+edx+12]
	imul	eax, 3
	shr	eax, 1
	mov	DWORD PTR _newsz$[ebp], eax

; 58   : 	buf = mem_realloc(buf, oldsz, newsz - oldsz);

	mov	ecx, DWORD PTR _newsz$[ebp]
	sub	ecx, DWORD PTR _oldsz$[ebp]
	push	ecx
	mov	edx, DWORD PTR _oldsz$[ebp]
	push	edx
	mov	eax, DWORD PTR _buf$[ebp]
	push	eax
	call	_mem_realloc
	add	esp, 12					; 0000000cH
	mov	DWORD PTR _buf$[ebp], eax

; 59   : 	if(!buf) return 1;

	cmp	DWORD PTR _buf$[ebp], 0
	jne	SHORT $L70224
	mov	eax, 1
	jmp	SHORT $L70216
$L70224:

; 60   : 	*_buf = buf;

	mov	ecx, DWORD PTR __buf$[ebp]
	mov	edx, DWORD PTR _buf$[ebp]
	mov	DWORD PTR [ecx], edx

; 61   : 	buf->sz = newsz - sizeof(DynBuffer) - 1;

	mov	eax, DWORD PTR _newsz$[ebp]
	sub	eax, 13					; 0000000dH
	mov	ecx, DWORD PTR _buf$[ebp]
	mov	DWORD PTR [ecx], eax

; 62   : 	return 0;

	xor	eax, eax
$L70216:

; 63   : }

	mov	esp, ebp
	pop	ebp
	ret	0
_dynbuf_resize ENDP
_TEXT	ENDS
PUBLIC	_dynbuf_add
PUBLIC	_dynbuf_strip
_DATA	SEGMENT
$SG70240 DB	'...', 00H
_DATA	ENDS
_TEXT	SEGMENT
_buf$ = 8
_cnt0$ = 12
_maxsize$ = 16
_counter$ = 20
_bstripped$ = -4
_dynbuf_strip PROC NEAR

; 74   : ){

	push	ebp
	mov	ebp, esp
	push	ecx

; 75   : 	int bstripped = 0;

	mov	DWORD PTR _bstripped$[ebp], 0

; 76   : 	if(!buf || !*buf) return 0;

	cmp	DWORD PTR _buf$[ebp], 0
	je	SHORT $L70237
	mov	eax, DWORD PTR _buf$[ebp]
	cmp	DWORD PTR [eax], 0
	jne	SHORT $L70236
$L70237:
	xor	eax, eax
	jmp	SHORT $L70234
$L70236:

; 77   : 	if(maxsize && *buf && (*buf)->cnt - cnt0 > maxsize - *counter)

	cmp	DWORD PTR _maxsize$[ebp], 0
	je	SHORT $L70238
	mov	ecx, DWORD PTR _buf$[ebp]
	cmp	DWORD PTR [ecx], 0
	je	SHORT $L70238
	mov	edx, DWORD PTR _buf$[ebp]
	mov	eax, DWORD PTR [edx]
	mov	ecx, DWORD PTR [eax+4]
	sub	ecx, DWORD PTR _cnt0$[ebp]
	mov	edx, DWORD PTR _counter$[ebp]
	mov	eax, DWORD PTR _maxsize$[ebp]
	sub	eax, DWORD PTR [edx]
	cmp	ecx, eax
	jbe	SHORT $L70238

; 79   : 		(*buf)->cnt = cnt0 + (*counter ? 0 : maxsize);

	mov	ecx, DWORD PTR _counter$[ebp]
	mov	edx, DWORD PTR [ecx]
	neg	edx
	sbb	edx, edx
	not	edx
	and	edx, DWORD PTR _maxsize$[ebp]
	mov	eax, DWORD PTR _cnt0$[ebp]
	add	eax, edx
	mov	ecx, DWORD PTR _buf$[ebp]
	mov	edx, DWORD PTR [ecx]
	mov	DWORD PTR [edx+4], eax

; 80   : 		dynbuf_add(buf, add_sz_str("..."), NO_CONV);

	push	0
	push	0
	push	3
	push	OFFSET FLAT:$SG70240
	mov	eax, DWORD PTR _buf$[ebp]
	push	eax
	call	_dynbuf_add
	add	esp, 20					; 00000014H

; 81   : 		bstripped = 1;

	mov	DWORD PTR _bstripped$[ebp], 1
$L70238:

; 83   : 	*counter += (*buf)->cnt - cnt0;

	mov	ecx, DWORD PTR _buf$[ebp]
	mov	edx, DWORD PTR [ecx]
	mov	eax, DWORD PTR [edx+4]
	sub	eax, DWORD PTR _cnt0$[ebp]
	mov	ecx, DWORD PTR _counter$[ebp]
	mov	edx, DWORD PTR [ecx]
	add	edx, eax
	mov	eax, DWORD PTR _counter$[ebp]
	mov	DWORD PTR [eax], edx

; 84   : 	return bstripped;

	mov	eax, DWORD PTR _bstripped$[ebp]
$L70234:

; 85   : }

	mov	esp, ebp
	pop	ebp
	ret	0
_dynbuf_strip ENDP
_TEXT	ENDS
EXTRN	_memcpy:NEAR
EXTRN	_memcmp:NEAR
EXTRN	_strlen:NEAR
_TEXT	SEGMENT
_buf$ = 8
_txt$ = 12
_sz$ = 16
_sr$ = 20
_sz_sr$ = 24
_i$70260 = -4
_k$70261 = -12
_j$70262 = -8
_i$70278 = -16
_k$70279 = -24
_j$70280 = -20
_dynbuf_add PROC NEAR

; 99   : ){

	push	ebp
	mov	ebp, esp
	sub	esp, 28					; 0000001cH

; 100  : 	/* Check params */
; 101  : 	if(!buf || !txt) return 0;

	cmp	DWORD PTR _buf$[ebp], 0
	je	SHORT $L70253
	cmp	DWORD PTR _txt$[ebp], 0
	jne	SHORT $L70252
$L70253:
	xor	eax, eax
	jmp	$L70251
$L70252:

; 102  : 	if(!sz || sz == ~0UL) sz = strlen(txt);

	cmp	DWORD PTR _sz$[ebp], 0
	je	SHORT $L70255
	cmp	DWORD PTR _sz$[ebp], -1
	jne	SHORT $L70254
$L70255:
	mov	eax, DWORD PTR _txt$[ebp]
	push	eax
	call	_strlen
	add	esp, 4
	mov	DWORD PTR _sz$[ebp], eax
$L70254:

; 103  : 
; 104  : 	/* Initialize if structure not alloc-ed - return on error */
; 105  : 	if(!*buf) *buf = dynbuf_init(MAX(sz+2, 256));

	mov	ecx, DWORD PTR _buf$[ebp]
	cmp	DWORD PTR [ecx], 0
	jne	SHORT $L70256
	mov	edx, DWORD PTR _sz$[ebp]
	add	edx, 2
	cmp	edx, 256				; 00000100H
	jbe	SHORT $L70349
	mov	eax, DWORD PTR _sz$[ebp]
	add	eax, 2
	mov	DWORD PTR -28+[ebp], eax
	jmp	SHORT $L70350
$L70349:
	mov	DWORD PTR -28+[ebp], 256		; 00000100H
$L70350:
	mov	ecx, DWORD PTR -28+[ebp]
	push	ecx
	call	_dynbuf_init
	add	esp, 4
	mov	edx, DWORD PTR _buf$[ebp]
	mov	DWORD PTR [edx], eax
$L70256:

; 106  : 	if(!*buf) return 1;

	mov	eax, DWORD PTR _buf$[ebp]
	cmp	DWORD PTR [eax], 0
	jne	SHORT $L70257
	mov	eax, 1
	jmp	$L70251
$L70257:

; 107  : 
; 108  : /* This macro allows to permute search & replace members of the ReplaceTable struct */
; 109  : #define SR_LOOP(search, replace) { \
; 110  : 		size_t i, k; \
; 111  : 		int j; \
; 112  : 		/* Search, replace & add loop */ \
; 113  : 		for(i = 0, k = (*buf)->cnt; i < sz; i++, k++) \
; 114  : 		{ \
; 115  : 			for(j = 0; sr[j].search; j++) \
; 116  : 				if(!memcmp(txt + i, sr[j].search, sr[j].sz_##search)) break; \
; 117  : 			if(sr[j].search) \
; 118  : 			{ \
; 119  : 				if(k + sr[j].sz_##replace >= (*buf)->sz) if(dynbuf_resize(buf, sz)) return 1; \
; 120  : 				memcpy((*buf)->data + k, sr[j].replace, sr[j].sz_##replace); \
; 121  : 				i += sr[j].sz_##search - 1; \
; 122  : 				k += sr[j].sz_##replace - 1; \
; 123  : 			} \
; 124  : 			else \
; 125  : 			{ \
; 126  : 				if(k + 1 >= (*buf)->sz) if(dynbuf_resize(buf, sz)) return 1; \
; 127  : 				(*buf)->data[k] = txt[i]; \
; 128  : 			} \
; 129  : 		} \
; 130  : 		(*buf)->cnt = k; \
; 131  : 	}
; 132  : 
; 133  : 	/* If table search & replace given */
; 134  : 	if(sr && sz_sr > 0)

	cmp	DWORD PTR _sr$[ebp], 0
	je	$L70259
	cmp	DWORD PTR _sz_sr$[ebp], 0
	jle	$L70259

; 135  : 		SR_LOOP(search, replace)

	mov	DWORD PTR _i$70260[ebp], 0
	mov	ecx, DWORD PTR _buf$[ebp]
	mov	edx, DWORD PTR [ecx]
	mov	eax, DWORD PTR [edx+4]
	mov	DWORD PTR _k$70261[ebp], eax
	jmp	SHORT $L70263
$L70264:
	mov	ecx, DWORD PTR _i$70260[ebp]
	add	ecx, 1
	mov	DWORD PTR _i$70260[ebp], ecx
	mov	edx, DWORD PTR _k$70261[ebp]
	add	edx, 1
	mov	DWORD PTR _k$70261[ebp], edx
$L70263:
	mov	eax, DWORD PTR _i$70260[ebp]
	cmp	eax, DWORD PTR _sz$[ebp]
	jae	$L70265
	mov	DWORD PTR _j$70262[ebp], 0
	jmp	SHORT $L70266
$L70267:
	mov	ecx, DWORD PTR _j$70262[ebp]
	add	ecx, 1
	mov	DWORD PTR _j$70262[ebp], ecx
$L70266:
	mov	edx, DWORD PTR _j$70262[ebp]
	shl	edx, 4
	mov	eax, DWORD PTR _sr$[ebp]
	cmp	DWORD PTR [eax+edx], 0
	je	SHORT $L70268
	mov	ecx, DWORD PTR _j$70262[ebp]
	shl	ecx, 4
	mov	edx, DWORD PTR _sr$[ebp]
	mov	eax, DWORD PTR [edx+ecx+4]
	push	eax
	mov	ecx, DWORD PTR _j$70262[ebp]
	shl	ecx, 4
	mov	edx, DWORD PTR _sr$[ebp]
	mov	eax, DWORD PTR [edx+ecx]
	push	eax
	mov	ecx, DWORD PTR _txt$[ebp]
	add	ecx, DWORD PTR _i$70260[ebp]
	push	ecx
	call	_memcmp
	add	esp, 12					; 0000000cH
	test	eax, eax
	jne	SHORT $L70269
	jmp	SHORT $L70268
$L70269:
	jmp	SHORT $L70267
$L70268:
	mov	edx, DWORD PTR _j$70262[ebp]
	shl	edx, 4
	mov	eax, DWORD PTR _sr$[ebp]
	cmp	DWORD PTR [eax+edx], 0
	je	$L70270
	mov	ecx, DWORD PTR _j$70262[ebp]
	shl	ecx, 4
	mov	edx, DWORD PTR _sr$[ebp]
	mov	eax, DWORD PTR _k$70261[ebp]
	add	eax, DWORD PTR [edx+ecx+12]
	mov	ecx, DWORD PTR _buf$[ebp]
	mov	edx, DWORD PTR [ecx]
	cmp	eax, DWORD PTR [edx]
	jb	SHORT $L70272
	mov	eax, DWORD PTR _sz$[ebp]
	push	eax
	mov	ecx, DWORD PTR _buf$[ebp]
	push	ecx
	call	_dynbuf_resize
	add	esp, 8
	test	eax, eax
	je	SHORT $L70272
	mov	eax, 1
	jmp	$L70251
$L70272:
	mov	edx, DWORD PTR _j$70262[ebp]
	shl	edx, 4
	mov	eax, DWORD PTR _sr$[ebp]
	mov	ecx, DWORD PTR [eax+edx+12]
	push	ecx
	mov	edx, DWORD PTR _j$70262[ebp]
	shl	edx, 4
	mov	eax, DWORD PTR _sr$[ebp]
	mov	ecx, DWORD PTR [eax+edx+8]
	push	ecx
	mov	edx, DWORD PTR _buf$[ebp]
	mov	eax, DWORD PTR [edx]
	mov	ecx, DWORD PTR _k$70261[ebp]
	lea	edx, DWORD PTR [eax+ecx+8]
	push	edx
	call	_memcpy
	add	esp, 12					; 0000000cH
	mov	eax, DWORD PTR _j$70262[ebp]
	shl	eax, 4
	mov	ecx, DWORD PTR _sr$[ebp]
	mov	edx, DWORD PTR [ecx+eax+4]
	mov	eax, DWORD PTR _i$70260[ebp]
	lea	ecx, DWORD PTR [eax+edx-1]
	mov	DWORD PTR _i$70260[ebp], ecx
	mov	edx, DWORD PTR _j$70262[ebp]
	shl	edx, 4
	mov	eax, DWORD PTR _sr$[ebp]
	mov	ecx, DWORD PTR [eax+edx+12]
	mov	edx, DWORD PTR _k$70261[ebp]
	lea	eax, DWORD PTR [edx+ecx-1]
	mov	DWORD PTR _k$70261[ebp], eax
	jmp	SHORT $L70273
$L70270:
	mov	ecx, DWORD PTR _k$70261[ebp]
	add	ecx, 1
	mov	edx, DWORD PTR _buf$[ebp]
	mov	eax, DWORD PTR [edx]
	cmp	ecx, DWORD PTR [eax]
	jb	SHORT $L70275
	mov	ecx, DWORD PTR _sz$[ebp]
	push	ecx
	mov	edx, DWORD PTR _buf$[ebp]
	push	edx
	call	_dynbuf_resize
	add	esp, 8
	test	eax, eax
	je	SHORT $L70275
	mov	eax, 1
	jmp	$L70251
$L70275:
	mov	eax, DWORD PTR _buf$[ebp]
	mov	ecx, DWORD PTR [eax]
	mov	edx, DWORD PTR _txt$[ebp]
	add	edx, DWORD PTR _i$70260[ebp]
	mov	eax, DWORD PTR _k$70261[ebp]
	mov	dl, BYTE PTR [edx]
	mov	BYTE PTR [ecx+eax+8], dl
$L70273:
	jmp	$L70264
$L70265:
	mov	eax, DWORD PTR _buf$[ebp]
	mov	ecx, DWORD PTR [eax]
	mov	edx, DWORD PTR _k$70261[ebp]
	mov	DWORD PTR [ecx+4], edx

; 136  : 	else if(sr && sz_sr < 0)

	jmp	$L70294
$L70259:
	cmp	DWORD PTR _sr$[ebp], 0
	je	$L70277
	cmp	DWORD PTR _sz_sr$[ebp], 0
	jge	$L70277

; 137  : 		SR_LOOP(replace, search)

	mov	DWORD PTR _i$70278[ebp], 0
	mov	eax, DWORD PTR _buf$[ebp]
	mov	ecx, DWORD PTR [eax]
	mov	edx, DWORD PTR [ecx+4]
	mov	DWORD PTR _k$70279[ebp], edx
	jmp	SHORT $L70281
$L70282:
	mov	eax, DWORD PTR _i$70278[ebp]
	add	eax, 1
	mov	DWORD PTR _i$70278[ebp], eax
	mov	ecx, DWORD PTR _k$70279[ebp]
	add	ecx, 1
	mov	DWORD PTR _k$70279[ebp], ecx
$L70281:
	mov	edx, DWORD PTR _i$70278[ebp]
	cmp	edx, DWORD PTR _sz$[ebp]
	jae	$L70283
	mov	DWORD PTR _j$70280[ebp], 0
	jmp	SHORT $L70284
$L70285:
	mov	eax, DWORD PTR _j$70280[ebp]
	add	eax, 1
	mov	DWORD PTR _j$70280[ebp], eax
$L70284:
	mov	ecx, DWORD PTR _j$70280[ebp]
	shl	ecx, 4
	mov	edx, DWORD PTR _sr$[ebp]
	cmp	DWORD PTR [edx+ecx+8], 0
	je	SHORT $L70286
	mov	eax, DWORD PTR _j$70280[ebp]
	shl	eax, 4
	mov	ecx, DWORD PTR _sr$[ebp]
	mov	edx, DWORD PTR [ecx+eax+12]
	push	edx
	mov	eax, DWORD PTR _j$70280[ebp]
	shl	eax, 4
	mov	ecx, DWORD PTR _sr$[ebp]
	mov	edx, DWORD PTR [ecx+eax+8]
	push	edx
	mov	eax, DWORD PTR _txt$[ebp]
	add	eax, DWORD PTR _i$70278[ebp]
	push	eax
	call	_memcmp
	add	esp, 12					; 0000000cH
	test	eax, eax
	jne	SHORT $L70287
	jmp	SHORT $L70286
$L70287:
	jmp	SHORT $L70285
$L70286:
	mov	ecx, DWORD PTR _j$70280[ebp]
	shl	ecx, 4
	mov	edx, DWORD PTR _sr$[ebp]
	cmp	DWORD PTR [edx+ecx+8], 0
	je	$L70288
	mov	eax, DWORD PTR _j$70280[ebp]
	shl	eax, 4
	mov	ecx, DWORD PTR _sr$[ebp]
	mov	edx, DWORD PTR _k$70279[ebp]
	add	edx, DWORD PTR [ecx+eax+4]
	mov	eax, DWORD PTR _buf$[ebp]
	mov	ecx, DWORD PTR [eax]
	cmp	edx, DWORD PTR [ecx]
	jb	SHORT $L70290
	mov	edx, DWORD PTR _sz$[ebp]
	push	edx
	mov	eax, DWORD PTR _buf$[ebp]
	push	eax
	call	_dynbuf_resize
	add	esp, 8
	test	eax, eax
	je	SHORT $L70290
	mov	eax, 1
	jmp	$L70251
$L70290:
	mov	ecx, DWORD PTR _j$70280[ebp]
	shl	ecx, 4
	mov	edx, DWORD PTR _sr$[ebp]
	mov	eax, DWORD PTR [edx+ecx+4]
	push	eax
	mov	ecx, DWORD PTR _j$70280[ebp]
	shl	ecx, 4
	mov	edx, DWORD PTR _sr$[ebp]
	mov	eax, DWORD PTR [edx+ecx]
	push	eax
	mov	ecx, DWORD PTR _buf$[ebp]
	mov	edx, DWORD PTR [ecx]
	mov	eax, DWORD PTR _k$70279[ebp]
	lea	ecx, DWORD PTR [edx+eax+8]
	push	ecx
	call	_memcpy
	add	esp, 12					; 0000000cH
	mov	edx, DWORD PTR _j$70280[ebp]
	shl	edx, 4
	mov	eax, DWORD PTR _sr$[ebp]
	mov	ecx, DWORD PTR [eax+edx+12]
	mov	edx, DWORD PTR _i$70278[ebp]
	lea	eax, DWORD PTR [edx+ecx-1]
	mov	DWORD PTR _i$70278[ebp], eax
	mov	ecx, DWORD PTR _j$70280[ebp]
	shl	ecx, 4
	mov	edx, DWORD PTR _sr$[ebp]
	mov	eax, DWORD PTR [edx+ecx+4]
	mov	ecx, DWORD PTR _k$70279[ebp]
	lea	edx, DWORD PTR [ecx+eax-1]
	mov	DWORD PTR _k$70279[ebp], edx
	jmp	SHORT $L70291
$L70288:
	mov	eax, DWORD PTR _k$70279[ebp]
	add	eax, 1
	mov	ecx, DWORD PTR _buf$[ebp]
	mov	edx, DWORD PTR [ecx]
	cmp	eax, DWORD PTR [edx]
	jb	SHORT $L70293
	mov	eax, DWORD PTR _sz$[ebp]
	push	eax
	mov	ecx, DWORD PTR _buf$[ebp]
	push	ecx
	call	_dynbuf_resize
	add	esp, 8
	test	eax, eax
	je	SHORT $L70293
	mov	eax, 1
	jmp	$L70251
$L70293:
	mov	edx, DWORD PTR _buf$[ebp]
	mov	eax, DWORD PTR [edx]
	mov	ecx, DWORD PTR _txt$[ebp]
	add	ecx, DWORD PTR _i$70278[ebp]
	mov	edx, DWORD PTR _k$70279[ebp]
	mov	cl, BYTE PTR [ecx]
	mov	BYTE PTR [eax+edx+8], cl
$L70291:
	jmp	$L70282
$L70283:
	mov	edx, DWORD PTR _buf$[ebp]
	mov	eax, DWORD PTR [edx]
	mov	ecx, DWORD PTR _k$70279[ebp]
	mov	DWORD PTR [eax+4], ecx

; 138  : 	else

	jmp	SHORT $L70294
$L70277:

; 140  : 		/* Resize buffer if needed - return on error */
; 141  : 		if(sz + 1 >= (*buf)->sz - (*buf)->cnt) if(dynbuf_resize(buf, sz)) return 1;

	mov	edx, DWORD PTR _sz$[ebp]
	add	edx, 1
	mov	eax, DWORD PTR _buf$[ebp]
	mov	ecx, DWORD PTR [eax]
	mov	eax, DWORD PTR _buf$[ebp]
	mov	eax, DWORD PTR [eax]
	mov	ecx, DWORD PTR [ecx]
	sub	ecx, DWORD PTR [eax+4]
	cmp	edx, ecx
	jb	SHORT $L70296
	mov	edx, DWORD PTR _sz$[ebp]
	push	edx
	mov	eax, DWORD PTR _buf$[ebp]
	push	eax
	call	_dynbuf_resize
	add	esp, 8
	test	eax, eax
	je	SHORT $L70296
	mov	eax, 1
	jmp	SHORT $L70251
$L70296:

; 142  : 
; 143  : 		/* Add text to buffer */
; 144  : 		memcpy((*buf)->data + (*buf)->cnt, txt, sz);

	mov	ecx, DWORD PTR _sz$[ebp]
	push	ecx
	mov	edx, DWORD PTR _txt$[ebp]
	push	edx
	mov	eax, DWORD PTR _buf$[ebp]
	mov	ecx, DWORD PTR [eax]
	mov	edx, DWORD PTR _buf$[ebp]
	mov	eax, DWORD PTR [edx]
	mov	edx, DWORD PTR [eax+4]
	lea	eax, DWORD PTR [ecx+edx+8]
	push	eax
	call	_memcpy
	add	esp, 12					; 0000000cH

; 145  : 		(*buf)->cnt += sz;

	mov	ecx, DWORD PTR _buf$[ebp]
	mov	edx, DWORD PTR [ecx]
	mov	eax, DWORD PTR [edx+4]
	add	eax, DWORD PTR _sz$[ebp]
	mov	ecx, DWORD PTR _buf$[ebp]
	mov	edx, DWORD PTR [ecx]
	mov	DWORD PTR [edx+4], eax
$L70294:

; 147  : #undef SR_LOOP
; 148  : 
; 149  : 	(*buf)->data[(*buf)->cnt] = 0;

	mov	eax, DWORD PTR _buf$[ebp]
	mov	ecx, DWORD PTR [eax]
	mov	edx, DWORD PTR _buf$[ebp]
	mov	eax, DWORD PTR [edx]
	mov	edx, DWORD PTR [eax+4]
	mov	BYTE PTR [ecx+edx+8], 0

; 150  : 	return 0;

	xor	eax, eax
$L70251:

; 151  : }

	mov	esp, ebp
	pop	ebp
	ret	0
_dynbuf_add ENDP
_TEXT	ENDS
PUBLIC	_dynbuf_add_int
EXTRN	_sprintf:NEAR
_DATA	SEGMENT
$SG70304 DB	'%ld', 00H
_DATA	ENDS
_TEXT	SEGMENT
_buf$ = 8
_nb$ = 12
_tmp$ = -32
_dynbuf_add_int PROC NEAR

; 161  : ){

	push	ebp
	mov	ebp, esp
	sub	esp, 32					; 00000020H

; 162  : 	char tmp[32];
; 163  : 	return dynbuf_add(buf, tmp, sprintf(tmp, "%ld", nb), NULL, 0);

	push	0
	push	0
	mov	eax, DWORD PTR _nb$[ebp]
	push	eax
	push	OFFSET FLAT:$SG70304
	lea	ecx, DWORD PTR _tmp$[ebp]
	push	ecx
	call	_sprintf
	add	esp, 12					; 0000000cH
	push	eax
	lea	edx, DWORD PTR _tmp$[ebp]
	push	edx
	mov	eax, DWORD PTR _buf$[ebp]
	push	eax
	call	_dynbuf_add
	add	esp, 20					; 00000014H

; 164  : }

	mov	esp, ebp
	pop	ebp
	ret	0
_dynbuf_add_int ENDP
_TEXT	ENDS
PUBLIC	_dynbuf_add3
_TEXT	SEGMENT
_buf$ = 8
_txt0$ = 12
_sz0$ = 16
_txt$ = 20
_sz$ = 24
_sr$ = 28
_sz_sr$ = 32
_txt1$ = 36
_sz1$ = 40
_dynbuf_add3 PROC NEAR

; 181  : ){

	push	ebp
	mov	ebp, esp
	push	ecx

; 182  : 	return
; 183  : 		dynbuf_add(buf, txt0, sz0, NULL, 0)	||
; 184  : 		dynbuf_add(buf, txt, sz, sr, sz_sr) ||
; 185  : 		dynbuf_add(buf, txt1, sz1, NULL, 0);

	push	0
	push	0
	mov	eax, DWORD PTR _sz0$[ebp]
	push	eax
	mov	ecx, DWORD PTR _txt0$[ebp]
	push	ecx
	mov	edx, DWORD PTR _buf$[ebp]
	push	edx
	call	_dynbuf_add
	add	esp, 20					; 00000014H
	test	eax, eax
	jne	SHORT $L70353
	mov	eax, DWORD PTR _sz_sr$[ebp]
	push	eax
	mov	ecx, DWORD PTR _sr$[ebp]
	push	ecx
	mov	edx, DWORD PTR _sz$[ebp]
	push	edx
	mov	eax, DWORD PTR _txt$[ebp]
	push	eax
	mov	ecx, DWORD PTR _buf$[ebp]
	push	ecx
	call	_dynbuf_add
	add	esp, 20					; 00000014H
	test	eax, eax
	jne	SHORT $L70353
	push	0
	push	0
	mov	edx, DWORD PTR _sz1$[ebp]
	push	edx
	mov	eax, DWORD PTR _txt1$[ebp]
	push	eax
	mov	ecx, DWORD PTR _buf$[ebp]
	push	ecx
	call	_dynbuf_add
	add	esp, 20					; 00000014H
	test	eax, eax
	jne	SHORT $L70353
	mov	DWORD PTR -4+[ebp], 0
	jmp	SHORT $L70354
$L70353:
	mov	DWORD PTR -4+[ebp], 1
$L70354:
	mov	eax, DWORD PTR -4+[ebp]

; 186  : }

	mov	esp, ebp
	pop	ebp
	ret	0
_dynbuf_add3 ENDP
_TEXT	ENDS
PUBLIC	_dynbuf_add3_int
_TEXT	SEGMENT
_buf$ = 8
_txt0$ = 12
_sz0$ = 16
_nb$ = 20
_txt1$ = 24
_sz1$ = 28
_dynbuf_add3_int PROC NEAR

; 200  : ){

	push	ebp
	mov	ebp, esp
	push	ecx

; 201  : 	return
; 202  : 		dynbuf_add(buf, txt0, sz0, NO_CONV)	||
; 203  : 		dynbuf_add_int(buf, nb) ||
; 204  : 		dynbuf_add(buf, txt1, sz1, NO_CONV);

	push	0
	push	0
	mov	eax, DWORD PTR _sz0$[ebp]
	push	eax
	mov	ecx, DWORD PTR _txt0$[ebp]
	push	ecx
	mov	edx, DWORD PTR _buf$[ebp]
	push	edx
	call	_dynbuf_add
	add	esp, 20					; 00000014H
	test	eax, eax
	jne	SHORT $L70356
	mov	eax, DWORD PTR _nb$[ebp]
	push	eax
	mov	ecx, DWORD PTR _buf$[ebp]
	push	ecx
	call	_dynbuf_add_int
	add	esp, 8
	test	eax, eax
	jne	SHORT $L70356
	push	0
	push	0
	mov	edx, DWORD PTR _sz1$[ebp]
	push	edx
	mov	eax, DWORD PTR _txt1$[ebp]
	push	eax
	mov	ecx, DWORD PTR _buf$[ebp]
	push	ecx
	call	_dynbuf_add
	add	esp, 20					; 00000014H
	test	eax, eax
	jne	SHORT $L70356
	mov	DWORD PTR -4+[ebp], 0
	jmp	SHORT $L70357
$L70356:
	mov	DWORD PTR -4+[ebp], 1
$L70357:
	mov	eax, DWORD PTR -4+[ebp]

; 205  : }

	mov	esp, ebp
	pop	ebp
	ret	0
_dynbuf_add3_int ENDP
_TEXT	ENDS
END
