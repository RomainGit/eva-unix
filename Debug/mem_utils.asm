	TITLE	D:\Travail\ABI\EVA\V4.0\CGI\Brunix-2016\mem_utils.c
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
PUBLIC	_mem_trace
EXTRN	_fclose:NEAR
EXTRN	_fopen:NEAR
EXTRN	_fprintf:NEAR
EXTRN	__msize:NEAR
EXTRN	_clock:NEAR
_BSS	SEGMENT
_?t0@?1??mem_trace@@9@9 DD 01H DUP (?)
_BSS	ENDS
_DATA	SEGMENT
$SG70210 DB	'D:\Travail\ABI\ApacheWeb\cgi\memtrace.txt', 00H
	ORG $+2
$SG70213 DB	'wc', 00H
	ORG $+1
$SG70214 DB	'Clock', 09H, 'Type', 09H, 'Adress', 09H, 'Size', 0aH, 00H
$SG70216 DB	'a', 00H
	ORG $+2
$SG70218 DB	'%lu', 09H, '%s', 09H, '0x%p', 09H, '0x%d', 0aH, 00H
_DATA	ENDS
_TEXT	SEGMENT
_type$ = 8
_mem$ = 12
_f$ = -8
_path$ = -4
_mem_trace PROC NEAR

; 29   : ){

	push	ebp
	mov	ebp, esp
	sub	esp, 8

; 30   : 	FILE *f;
; 31   : 	static clock_t t0;
; 32   : 	char *path = "D:\\Travail\\ABI\\ApacheWeb\\cgi\\memtrace.txt";

	mov	DWORD PTR _path$[ebp], OFFSET FLAT:$SG70210

; 33   : 
; 34   : 
; 35   : 	if(type && !mem) return;

	cmp	DWORD PTR _type$[ebp], 0
	je	SHORT $L70211
	cmp	DWORD PTR _mem$[ebp], 0
	jne	SHORT $L70211
	jmp	$L70205
$L70211:

; 36   : 	if(!type)

	cmp	DWORD PTR _type$[ebp], 0
	jne	SHORT $L70212

; 38   : 		t0 = clock();

	call	_clock
	mov	DWORD PTR _?t0@?1??mem_trace@@9@9, eax

; 39   : 		f = fopen(path, "wc");

	push	OFFSET FLAT:$SG70213
	mov	eax, DWORD PTR _path$[ebp]
	push	eax
	call	_fopen
	add	esp, 8
	mov	DWORD PTR _f$[ebp], eax

; 40   : 		fprintf(f, "Clock\tType\tAdress\tSize\n");

	push	OFFSET FLAT:$SG70214
	mov	ecx, DWORD PTR _f$[ebp]
	push	ecx
	call	_fprintf
	add	esp, 8

; 42   : 	else

	jmp	SHORT $L70215
$L70212:

; 44   : 		f = fopen(path,"a");

	push	OFFSET FLAT:$SG70216
	mov	edx, DWORD PTR _path$[ebp]
	push	edx
	call	_fopen
	add	esp, 8
	mov	DWORD PTR _f$[ebp], eax

; 45   : 		fprintf(f, "%lu\t%s\t0x%p\t0x%d\n", clock() - t0, type, mem, (int)MSIZE(mem));

	mov	eax, DWORD PTR _mem$[ebp]
	push	eax
	call	__msize
	add	esp, 4
	push	eax
	mov	ecx, DWORD PTR _mem$[ebp]
	push	ecx
	mov	edx, DWORD PTR _type$[ebp]
	push	edx
	call	_clock
	sub	eax, DWORD PTR _?t0@?1??mem_trace@@9@9
	push	eax
	push	OFFSET FLAT:$SG70218
	mov	eax, DWORD PTR _f$[ebp]
	push	eax
	call	_fprintf
	add	esp, 24					; 00000018H
$L70215:

; 47   : 	fclose(f);

	mov	ecx, DWORD PTR _f$[ebp]
	push	ecx
	call	_fclose
	add	esp, 4
$L70205:

; 48   : }

	mov	esp, ebp
	pop	ebp
	ret	0
_mem_trace ENDP
_TEXT	ENDS
PUBLIC	_mem_alloc
EXTRN	_memset:NEAR
EXTRN	_malloc:NEAR
_TEXT	SEGMENT
_sz$ = 8
_res$ = -4
_mem_alloc PROC NEAR

; 56   : ){

	push	ebp
	mov	ebp, esp
	push	ecx

; 57   : 	void *res;
; 58   : 	res = malloc(sz);

	mov	eax, DWORD PTR _sz$[ebp]
	push	eax
	call	_malloc
	add	esp, 4
	mov	DWORD PTR _res$[ebp], eax

; 59   : 	if(res) memset(res, 0, sz);

	cmp	DWORD PTR _res$[ebp], 0
	je	SHORT $L70223
	mov	ecx, DWORD PTR _sz$[ebp]
	push	ecx
	push	0
	mov	edx, DWORD PTR _res$[ebp]
	push	edx
	call	_memset
	add	esp, 12					; 0000000cH
$L70223:

; 60   : 	MEM_TRACE("alloc", res);
; 61   : 	return res;

	mov	eax, DWORD PTR _res$[ebp]

; 62   : }

	mov	esp, ebp
	pop	ebp
	ret	0
_mem_alloc ENDP
_TEXT	ENDS
PUBLIC	_mem_strdup
EXTRN	_memcpy:NEAR
EXTRN	_strlen:NEAR
_TEXT	SEGMENT
_src$ = 8
_sz$ = -8
_res$ = -4
_mem_strdup PROC NEAR

; 70   : ){

	push	ebp
	mov	ebp, esp
	sub	esp, 16					; 00000010H

; 71   : 	size_t sz = src ? strlen(src) + 1 : 0;

	cmp	DWORD PTR _src$[ebp], 0
	je	SHORT $L70249
	mov	eax, DWORD PTR _src$[ebp]
	push	eax
	call	_strlen
	add	esp, 4
	add	eax, 1
	mov	DWORD PTR -12+[ebp], eax
	jmp	SHORT $L70250
$L70249:
	mov	DWORD PTR -12+[ebp], 0
$L70250:
	mov	ecx, DWORD PTR -12+[ebp]
	mov	DWORD PTR _sz$[ebp], ecx

; 72   : 	void *res = sz ? mem_alloc(sz) : NULL;

	cmp	DWORD PTR _sz$[ebp], 0
	je	SHORT $L70251
	mov	edx, DWORD PTR _sz$[ebp]
	push	edx
	call	_mem_alloc
	add	esp, 4
	mov	DWORD PTR -16+[ebp], eax
	jmp	SHORT $L70252
$L70251:
	mov	DWORD PTR -16+[ebp], 0
$L70252:
	mov	eax, DWORD PTR -16+[ebp]
	mov	DWORD PTR _res$[ebp], eax

; 73   : 	if(res) memcpy(res, src, sz);

	cmp	DWORD PTR _res$[ebp], 0
	je	SHORT $L70230
	mov	ecx, DWORD PTR _sz$[ebp]
	push	ecx
	mov	edx, DWORD PTR _src$[ebp]
	push	edx
	mov	eax, DWORD PTR _res$[ebp]
	push	eax
	call	_memcpy
	add	esp, 12					; 0000000cH
$L70230:

; 74   : 	return res;

	mov	eax, DWORD PTR _res$[ebp]

; 75   : }

	mov	esp, ebp
	pop	ebp
	ret	0
_mem_strdup ENDP
_TEXT	ENDS
PUBLIC	_mem_free
EXTRN	_free:NEAR
_TEXT	SEGMENT
_src$ = 8
_mem_free PROC NEAR

; 83   : ){

	push	ebp
	mov	ebp, esp

; 84   : 	MEM_TRACE("free", src);
; 85   : 	free(src);

	mov	eax, DWORD PTR _src$[ebp]
	push	eax
	call	_free
	add	esp, 4

; 86   : }

	pop	ebp
	ret	0
_mem_free ENDP
_TEXT	ENDS
PUBLIC	_mem_realloc
EXTRN	_realloc:NEAR
_TEXT	SEGMENT
_src$ = 8
_old_sz$ = 12
_incr$ = 16
_res$ = -4
_mem_realloc PROC NEAR

; 96   : ){

	push	ebp
	mov	ebp, esp
	push	ecx

; 97   : 	void *res;
; 98   : 	MEM_TRACE("free", src);
; 99   : 	res = realloc(src, old_sz + incr);

	mov	eax, DWORD PTR _old_sz$[ebp]
	add	eax, DWORD PTR _incr$[ebp]
	push	eax
	mov	ecx, DWORD PTR _src$[ebp]
	push	ecx
	call	_realloc
	add	esp, 8
	mov	DWORD PTR _res$[ebp], eax

; 100  : 	MEM_TRACE("alloc", res);
; 101  : 	if(incr > 0) memset((char *)res + old_sz, 0, incr);

	cmp	DWORD PTR _incr$[ebp], 0
	jbe	SHORT $L70242
	mov	edx, DWORD PTR _incr$[ebp]
	push	edx
	push	0
	mov	eax, DWORD PTR _res$[ebp]
	add	eax, DWORD PTR _old_sz$[ebp]
	push	eax
	call	_memset
	add	esp, 12					; 0000000cH
$L70242:

; 102  : 	return res;

	mov	eax, DWORD PTR _res$[ebp]

; 103  : }

	mov	esp, ebp
	pop	ebp
	ret	0
_mem_realloc ENDP
_TEXT	ENDS
END
