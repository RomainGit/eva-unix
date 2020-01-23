	TITLE	D:\Travail\ABI\EVA\V4.0\CGI\Brunix-2016\file_image_utils.c
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
PUBLIC	_get_image_size_head
EXTRN	_memchr:NEAR
EXTRN	_strncmp:NEAR
_DATA	SEGMENT
$SG71539 DB	'GIF', 00H
$SG71545 DB	'PNG', 00H
$SG71551 DB	'BMP', 00H
_DATA	ENDS
_TEXT	SEGMENT
_header$ = 8
_sz$ = 12
_width$ = 16
_height$ = 20
_imgtyp$ = 24
_sz1$71556 = -8
_mark$71557 = -4
_get_image_size_head PROC NEAR

; 33   : ){

	push	ebp
	mov	ebp, esp
	sub	esp, 16					; 00000010H

; 34   : 	/* Check / init params - return 0 on error */
; 35   : 	if(imgtyp) *imgtyp = imgUnkonwn;

	cmp	DWORD PTR _imgtyp$[ebp], 0
	je	SHORT $L71534
	mov	eax, DWORD PTR _imgtyp$[ebp]
	mov	DWORD PTR [eax], 0
$L71534:

; 36   : 	if(!header || !sz) return 0;

	cmp	DWORD PTR _header$[ebp], 0
	je	SHORT $L71536
	cmp	DWORD PTR _sz$[ebp], 0
	jne	SHORT $L71535
$L71536:
	xor	eax, eax
	jmp	$L71533
$L71535:

; 37   : 
; 38   : #define BYTES_TO_WORD(c, l, m) ((c[l] & 0xFF) | (c[m] & 0xFF) << 8)
; 39   : 
; 40   : 	/* Check image type */
; 41   : 	if(!strncmp(header, add_sz_str("GIF")))

	push	3
	push	OFFSET FLAT:$SG71539
	mov	ecx, DWORD PTR _header$[ebp]
	push	ecx
	call	_strncmp
	add	esp, 12					; 0000000cH
	test	eax, eax
	jne	SHORT $L71538

; 43   : 		/* Read GIF image size */
; 44   : 		if(imgtyp) *imgtyp = imgGIF;

	cmp	DWORD PTR _imgtyp$[ebp], 0
	je	SHORT $L71540
	mov	edx, DWORD PTR _imgtyp$[ebp]
	mov	DWORD PTR [edx], 1
$L71540:

; 45   : 		if(width) *width = BYTES_TO_WORD(header, 6, 7);

	cmp	DWORD PTR _width$[ebp], 0
	je	SHORT $L71541
	mov	eax, DWORD PTR _header$[ebp]
	movsx	ecx, BYTE PTR [eax+6]
	and	ecx, 255				; 000000ffH
	mov	edx, DWORD PTR _header$[ebp]
	movsx	eax, BYTE PTR [edx+7]
	and	eax, 255				; 000000ffH
	shl	eax, 8
	or	ecx, eax
	mov	edx, DWORD PTR _width$[ebp]
	mov	DWORD PTR [edx], ecx
$L71541:

; 46   : 		if(height) *height = BYTES_TO_WORD(header, 8, 9);

	cmp	DWORD PTR _height$[ebp], 0
	je	SHORT $L71542
	mov	eax, DWORD PTR _header$[ebp]
	movsx	ecx, BYTE PTR [eax+8]
	and	ecx, 255				; 000000ffH
	mov	edx, DWORD PTR _header$[ebp]
	movsx	eax, BYTE PTR [edx+9]
	and	eax, 255				; 000000ffH
	shl	eax, 8
	or	ecx, eax
	mov	edx, DWORD PTR _height$[ebp]
	mov	DWORD PTR [edx], ecx
$L71542:

; 48   : 	else if(*header == 137 && !strncmp(header+1, add_sz_str("PNG")))

	jmp	$L71569
$L71538:
	mov	eax, DWORD PTR _header$[ebp]
	movsx	ecx, BYTE PTR [eax]
	cmp	ecx, 137				; 00000089H
	jne	$L71544
	push	3
	push	OFFSET FLAT:$SG71545
	mov	edx, DWORD PTR _header$[ebp]
	add	edx, 1
	push	edx
	call	_strncmp
	add	esp, 12					; 0000000cH
	test	eax, eax
	jne	SHORT $L71544

; 50   : 		/* Read PNG image size */
; 51   : 		if(imgtyp) *imgtyp = imgPNG;

	cmp	DWORD PTR _imgtyp$[ebp], 0
	je	SHORT $L71546
	mov	eax, DWORD PTR _imgtyp$[ebp]
	mov	DWORD PTR [eax], 2
$L71546:

; 52   : 		if(width) *width = BYTES_TO_WORD(header, 18, 19);

	cmp	DWORD PTR _width$[ebp], 0
	je	SHORT $L71547
	mov	ecx, DWORD PTR _header$[ebp]
	movsx	edx, BYTE PTR [ecx+18]
	and	edx, 255				; 000000ffH
	mov	eax, DWORD PTR _header$[ebp]
	movsx	ecx, BYTE PTR [eax+19]
	and	ecx, 255				; 000000ffH
	shl	ecx, 8
	or	edx, ecx
	mov	eax, DWORD PTR _width$[ebp]
	mov	DWORD PTR [eax], edx
$L71547:

; 53   : 		if(height) *height = BYTES_TO_WORD(header, 22, 23);

	cmp	DWORD PTR _height$[ebp], 0
	je	SHORT $L71548
	mov	ecx, DWORD PTR _header$[ebp]
	movsx	edx, BYTE PTR [ecx+22]
	and	edx, 255				; 000000ffH
	mov	eax, DWORD PTR _header$[ebp]
	movsx	ecx, BYTE PTR [eax+23]
	and	ecx, 255				; 000000ffH
	shl	ecx, 8
	or	edx, ecx
	mov	eax, DWORD PTR _height$[ebp]
	mov	DWORD PTR [eax], edx
$L71548:

; 55   : 	else if(!strncmp(header+1, add_sz_str("BMP")))

	jmp	$L71569
$L71544:
	push	3
	push	OFFSET FLAT:$SG71551
	mov	ecx, DWORD PTR _header$[ebp]
	add	ecx, 1
	push	ecx
	call	_strncmp
	add	esp, 12					; 0000000cH
	test	eax, eax
	jne	SHORT $L71550

; 57   : 		/* Read BMP image size */
; 58   : 		if(imgtyp) *imgtyp = imgBMP;

	cmp	DWORD PTR _imgtyp$[ebp], 0
	je	SHORT $L71552
	mov	edx, DWORD PTR _imgtyp$[ebp]
	mov	DWORD PTR [edx], 3
$L71552:

; 59   : 		if(width) *width = BYTES_TO_WORD(header, 19, 18);

	cmp	DWORD PTR _width$[ebp], 0
	je	SHORT $L71553
	mov	eax, DWORD PTR _header$[ebp]
	movsx	ecx, BYTE PTR [eax+19]
	and	ecx, 255				; 000000ffH
	mov	edx, DWORD PTR _header$[ebp]
	movsx	eax, BYTE PTR [edx+18]
	and	eax, 255				; 000000ffH
	shl	eax, 8
	or	ecx, eax
	mov	edx, DWORD PTR _width$[ebp]
	mov	DWORD PTR [edx], ecx
$L71553:

; 60   : 		if(height) *height = BYTES_TO_WORD(header, 23, 22);

	cmp	DWORD PTR _height$[ebp], 0
	je	SHORT $L71554
	mov	eax, DWORD PTR _header$[ebp]
	movsx	ecx, BYTE PTR [eax+23]
	and	ecx, 255				; 000000ffH
	mov	edx, DWORD PTR _header$[ebp]
	movsx	eax, BYTE PTR [edx+22]
	and	eax, 255				; 000000ffH
	shl	eax, 8
	or	ecx, eax
	mov	edx, DWORD PTR _height$[ebp]
	mov	DWORD PTR [edx], ecx
$L71554:

; 62   : 	else

	jmp	$L71569
$L71550:

; 64   : 		/* Check for JPEG image markers FF/D8/FF*/
; 65   : 		size_t sz1;
; 66   : 		char *mark = header - 1;

	mov	eax, DWORD PTR _header$[ebp]
	sub	eax, 1
	mov	DWORD PTR _mark$71557[ebp], eax

; 67   : 		if(sz > 10) sz -= 10;

	cmp	DWORD PTR _sz$[ebp], 10			; 0000000aH
	jbe	SHORT $L71558
	mov	ecx, DWORD PTR _sz$[ebp]
	sub	ecx, 10					; 0000000aH
	mov	DWORD PTR _sz$[ebp], ecx
$L71558:

; 68   : 		do mark = memchr(mark + 1, 0xFF, sz - (size_t)(mark - header));

	mov	edx, DWORD PTR _mark$71557[ebp]
	sub	edx, DWORD PTR _header$[ebp]
	mov	eax, DWORD PTR _sz$[ebp]
	sub	eax, edx
	push	eax
	push	255					; 000000ffH
	mov	ecx, DWORD PTR _mark$71557[ebp]
	add	ecx, 1
	push	ecx
	call	_memchr
	add	esp, 12					; 0000000cH
	mov	DWORD PTR _mark$71557[ebp], eax

; 69   : 		while(mark && (size_t)(mark - header) < sz && !(mark[1] == '\xD8' && mark[2] == '\xFF'));

	cmp	DWORD PTR _mark$71557[ebp], 0
	je	SHORT $L71564
	mov	edx, DWORD PTR _mark$71557[ebp]
	sub	edx, DWORD PTR _header$[ebp]
	cmp	edx, DWORD PTR _sz$[ebp]
	jae	SHORT $L71564
	mov	eax, DWORD PTR _mark$71557[ebp]
	movsx	ecx, BYTE PTR [eax+1]
	cmp	ecx, -40				; ffffffd8H
	jne	SHORT $L71558
	mov	edx, DWORD PTR _mark$71557[ebp]
	movsx	eax, BYTE PTR [edx+2]
	cmp	eax, -1
	jne	SHORT $L71558
$L71564:

; 70   : 		if(mark) mark += 2;

	cmp	DWORD PTR _mark$71557[ebp], 0
	je	SHORT $L71565
	mov	ecx, DWORD PTR _mark$71557[ebp]
	add	ecx, 2
	mov	DWORD PTR _mark$71557[ebp], ecx
$L71565:

; 71   : 
; 72   : 		/* JPEG marker found : search for image marker FF/C0 & others */
; 73   : 		while(mark && (size_t)(mark - header) < sz)

	cmp	DWORD PTR _mark$71557[ebp], 0
	je	$L71569
	mov	edx, DWORD PTR _mark$71557[ebp]
	sub	edx, DWORD PTR _header$[ebp]
	cmp	edx, DWORD PTR _sz$[ebp]
	jae	$L71569
$L71572:

; 75   : 			while(*mark != '\xFF' && (size_t)(mark - header) < sz) mark++;

	mov	eax, DWORD PTR _mark$71557[ebp]
	movsx	ecx, BYTE PTR [eax]
	cmp	ecx, -1
	je	SHORT $L71573
	mov	edx, DWORD PTR _mark$71557[ebp]
	sub	edx, DWORD PTR _header$[ebp]
	cmp	edx, DWORD PTR _sz$[ebp]
	jae	SHORT $L71573
	mov	eax, DWORD PTR _mark$71557[ebp]
	add	eax, 1
	mov	DWORD PTR _mark$71557[ebp], eax
	jmp	SHORT $L71572
$L71573:

; 76   : 			if(*mark != '\xFF') break;

	mov	ecx, DWORD PTR _mark$71557[ebp]
	movsx	edx, BYTE PTR [ecx]
	cmp	edx, -1
	je	SHORT $L71574
	jmp	$L71569
$L71574:

; 77   : 			mark++;

	mov	eax, DWORD PTR _mark$71557[ebp]
	add	eax, 1
	mov	DWORD PTR _mark$71557[ebp], eax

; 78   : 			if(*mark >= '\xC0' && *mark <= '\xCF' && *mark != '\xC4' && *mark != '\xC8' && *mark != '\xCC')

	mov	ecx, DWORD PTR _mark$71557[ebp]
	movsx	edx, BYTE PTR [ecx]
	cmp	edx, -64				; ffffffc0H
	jl	$L71575
	mov	eax, DWORD PTR _mark$71557[ebp]
	movsx	ecx, BYTE PTR [eax]
	cmp	ecx, -49				; ffffffcfH
	jg	$L71575
	mov	edx, DWORD PTR _mark$71557[ebp]
	movsx	eax, BYTE PTR [edx]
	cmp	eax, -60				; ffffffc4H
	je	SHORT $L71575
	mov	ecx, DWORD PTR _mark$71557[ebp]
	movsx	edx, BYTE PTR [ecx]
	cmp	edx, -56				; ffffffc8H
	je	SHORT $L71575
	mov	eax, DWORD PTR _mark$71557[ebp]
	movsx	ecx, BYTE PTR [eax]
	cmp	ecx, -52				; ffffffccH
	je	SHORT $L71575

; 80   : 				/* Read JPG image size */
; 81   : 				if(imgtyp) *imgtyp = imgJPG;

	cmp	DWORD PTR _imgtyp$[ebp], 0
	je	SHORT $L71576
	mov	edx, DWORD PTR _imgtyp$[ebp]
	mov	DWORD PTR [edx], 4
$L71576:

; 82   : 				if(width) *width = BYTES_TO_WORD(mark, 7, 6);

	cmp	DWORD PTR _width$[ebp], 0
	je	SHORT $L71577
	mov	eax, DWORD PTR _mark$71557[ebp]
	movsx	ecx, BYTE PTR [eax+7]
	and	ecx, 255				; 000000ffH
	mov	edx, DWORD PTR _mark$71557[ebp]
	movsx	eax, BYTE PTR [edx+6]
	and	eax, 255				; 000000ffH
	shl	eax, 8
	or	ecx, eax
	mov	edx, DWORD PTR _width$[ebp]
	mov	DWORD PTR [edx], ecx
$L71577:

; 83   : 				if(height) *height = BYTES_TO_WORD(mark, 5, 4);

	cmp	DWORD PTR _height$[ebp], 0
	je	SHORT $L71578
	mov	eax, DWORD PTR _mark$71557[ebp]
	movsx	ecx, BYTE PTR [eax+5]
	and	ecx, 255				; 000000ffH
	mov	edx, DWORD PTR _mark$71557[ebp]
	movsx	eax, BYTE PTR [edx+4]
	and	eax, 255				; 000000ffH
	shl	eax, 8
	or	ecx, eax
	mov	edx, DWORD PTR _height$[ebp]
	mov	DWORD PTR [edx], ecx
$L71578:

; 84   : 				break;

	jmp	SHORT $L71569
$L71575:

; 86   : 			sz1 = BYTES_TO_WORD(mark, 2, 1);

	mov	eax, DWORD PTR _mark$71557[ebp]
	movsx	ecx, BYTE PTR [eax+2]
	and	ecx, 255				; 000000ffH
	mov	edx, DWORD PTR _mark$71557[ebp]
	movsx	eax, BYTE PTR [edx+1]
	and	eax, 255				; 000000ffH
	shl	eax, 8
	or	ecx, eax
	mov	DWORD PTR _sz1$71556[ebp], ecx

; 87   : 			mark = (mark - header + sz1 >= sz) ? NULL : mark + sz1 + 1;

	mov	ecx, DWORD PTR _mark$71557[ebp]
	sub	ecx, DWORD PTR _header$[ebp]
	add	ecx, DWORD PTR _sz1$71556[ebp]
	cmp	ecx, DWORD PTR _sz$[ebp]
	jb	SHORT $L71752
	mov	DWORD PTR -12+[ebp], 0
	jmp	SHORT $L71753
$L71752:
	mov	edx, DWORD PTR _sz1$71556[ebp]
	mov	eax, DWORD PTR _mark$71557[ebp]
	lea	ecx, DWORD PTR [eax+edx+1]
	mov	DWORD PTR -12+[ebp], ecx
$L71753:
	mov	edx, DWORD PTR -12+[ebp]
	mov	DWORD PTR _mark$71557[ebp], edx

; 88   : 		}

	jmp	$L71565
$L71569:

; 90   : 	return (!width || *width) && (!height || *height);

	cmp	DWORD PTR _width$[ebp], 0
	je	SHORT $L71754
	mov	eax, DWORD PTR _width$[ebp]
	cmp	DWORD PTR [eax], 0
	je	SHORT $L71756
$L71754:
	cmp	DWORD PTR _height$[ebp], 0
	je	SHORT $L71755
	mov	ecx, DWORD PTR _height$[ebp]
	cmp	DWORD PTR [ecx], 0
	je	SHORT $L71756
$L71755:
	mov	DWORD PTR -16+[ebp], 1
	jmp	SHORT $L71757
$L71756:
	mov	DWORD PTR -16+[ebp], 0
$L71757:
	mov	eax, DWORD PTR -16+[ebp]
$L71533:

; 91   : }

	mov	esp, ebp
	pop	ebp
	ret	0
_get_image_size_head ENDP
_TEXT	ENDS
PUBLIC	_get_image_size_fast
EXTRN	_fclose:NEAR
EXTRN	_fopen:NEAR
EXTRN	_fread:NEAR
_DATA	SEGMENT
$SG71593 DB	'rb', 00H
_DATA	ENDS
_TEXT	SEGMENT
_imgpath$ = 8
_width$ = 12
_height$ = 16
_imgtyp$ = 20
_header$ = -64
_f$ = -68
_sz$ = -72
_get_image_size_fast PROC NEAR

; 102  : ){

	push	ebp
	mov	ebp, esp
	sub	esp, 72					; 00000048H

; 103  : 	char header[0x40];
; 104  : 	FILE *f;
; 105  : 	size_t sz;
; 106  : 
; 107  : 	/* Open file & read header - return 0 on error */
; 108  : 	f = fopen (imgpath, "rb");

	push	OFFSET FLAT:$SG71593
	mov	eax, DWORD PTR _imgpath$[ebp]
	push	eax
	call	_fopen
	add	esp, 8
	mov	DWORD PTR _f$[ebp], eax

; 109  : 	if(!f) return 0;

	cmp	DWORD PTR _f$[ebp], 0
	jne	SHORT $L71594
	xor	eax, eax
	jmp	SHORT $L71589
$L71594:

; 110  : 	sz = fread(header, 1, sizeof(header), f);

	mov	ecx, DWORD PTR _f$[ebp]
	push	ecx
	push	64					; 00000040H
	push	1
	lea	edx, DWORD PTR _header$[ebp]
	push	edx
	call	_fread
	add	esp, 16					; 00000010H
	mov	DWORD PTR _sz$[ebp], eax

; 111  : 	fclose(f);

	mov	eax, DWORD PTR _f$[ebp]
	push	eax
	call	_fclose
	add	esp, 4

; 112  : 
; 113  : 	return get_image_size_head(header, sz, width, height, imgtyp);

	mov	ecx, DWORD PTR _imgtyp$[ebp]
	push	ecx
	mov	edx, DWORD PTR _height$[ebp]
	push	edx
	mov	eax, DWORD PTR _width$[ebp]
	push	eax
	mov	ecx, DWORD PTR _sz$[ebp]
	push	ecx
	lea	edx, DWORD PTR _header$[ebp]
	push	edx
	call	_get_image_size_head
	add	esp, 20					; 00000014H
$L71589:

; 114  : }

	mov	esp, ebp
	pop	ebp
	ret	0
_get_image_size_fast ENDP
_TEXT	ENDS
PUBLIC	_get_image_data
EXTRN	_free:NEAR
EXTRN	_malloc:NEAR
EXTRN	__imp__gdImageCreateFromPngPtr@8:NEAR
EXTRN	__imp__gdImageCreateFromGifPtr@8:NEAR
EXTRN	__imp__gdImageCreateFromWBMPPtr@8:NEAR
EXTRN	__imp__gdImageCreateFromJpegPtr@8:NEAR
_DATA	SEGMENT
	ORG $+1
$SG71610 DB	'rb', 00H
	ORG $+1
$SG71613 DB	'GIF', 00H
$SG71617 DB	'PNG', 00H
$SG71621 DB	'BMP', 00H
_DATA	ENDS
_TEXT	SEGMENT
_imgpath$ = 8
_sz$ = 12
_img$ = 16
_imgtyp$ = 20
_f$ = -8
_data$ = -4
_get_image_data PROC NEAR

; 125  : ){

	push	ebp
	mov	ebp, esp
	sub	esp, 8

; 126  : 	FILE *f;
; 127  : 	char *data;
; 128  : 
; 129  : 	/* Alloc memory for data - return on error */
; 130  : 	if(imgtyp) *imgtyp = imgUnkonwn;

	cmp	DWORD PTR _imgtyp$[ebp], 0
	je	SHORT $L71607
	mov	eax, DWORD PTR _imgtyp$[ebp]
	mov	DWORD PTR [eax], 0
$L71607:

; 131  : 	data = malloc(sz);

	mov	ecx, DWORD PTR _sz$[ebp]
	push	ecx
	call	_malloc
	add	esp, 4
	mov	DWORD PTR _data$[ebp], eax

; 132  : 	if(!data) return NULL;

	cmp	DWORD PTR _data$[ebp], 0
	jne	SHORT $L71608
	xor	eax, eax
	jmp	$L71604
$L71608:

; 133  : 
; 134  : 	/* Open file - skip processing on error */
; 135  : 	f = fopen(imgpath, "rb");

	push	OFFSET FLAT:$SG71610
	mov	edx, DWORD PTR _imgpath$[ebp]
	push	edx
	call	_fopen
	add	esp, 8
	mov	DWORD PTR _f$[ebp], eax

; 136  : 	if(f)

	cmp	DWORD PTR _f$[ebp], 0
	je	$L71611

; 138  : 		/* Read data */
; 139  : 		fread(data, 1, sz, f);

	mov	eax, DWORD PTR _f$[ebp]
	push	eax
	mov	ecx, DWORD PTR _sz$[ebp]
	push	ecx
	push	1
	mov	edx, DWORD PTR _data$[ebp]
	push	edx
	call	_fread
	add	esp, 16					; 00000010H

; 140  : 		fclose(f);

	mov	eax, DWORD PTR _f$[ebp]
	push	eax
	call	_fclose
	add	esp, 4

; 141  : 
; 142  : 		/* Handle image type - call specific GD function */
; 143  : 		if(!strncmp(data, add_sz_str("GIF")))

	push	3
	push	OFFSET FLAT:$SG71613
	mov	ecx, DWORD PTR _data$[ebp]
	push	ecx
	call	_strncmp
	add	esp, 12					; 0000000cH
	test	eax, eax
	jne	SHORT $L71612

; 145  : 			if(imgtyp) *imgtyp = imgGIF;

	cmp	DWORD PTR _imgtyp$[ebp], 0
	je	SHORT $L71614
	mov	edx, DWORD PTR _imgtyp$[ebp]
	mov	DWORD PTR [edx], 1
$L71614:

; 146  : 			*img = gdImageCreateFromGifPtr(sz, data);

	mov	eax, DWORD PTR _data$[ebp]
	push	eax
	mov	ecx, DWORD PTR _sz$[ebp]
	push	ecx
	call	DWORD PTR __imp__gdImageCreateFromGifPtr@8
	mov	edx, DWORD PTR _img$[ebp]
	mov	DWORD PTR [edx], eax

; 148  : 		else if(!strncmp(data+1, add_sz_str("PNG")))

	jmp	$L71623
$L71612:
	push	3
	push	OFFSET FLAT:$SG71617
	mov	eax, DWORD PTR _data$[ebp]
	add	eax, 1
	push	eax
	call	_strncmp
	add	esp, 12					; 0000000cH
	test	eax, eax
	jne	SHORT $L71616

; 150  : 			if(imgtyp) *imgtyp = imgPNG;

	cmp	DWORD PTR _imgtyp$[ebp], 0
	je	SHORT $L71618
	mov	ecx, DWORD PTR _imgtyp$[ebp]
	mov	DWORD PTR [ecx], 2
$L71618:

; 151  : 			*img = gdImageCreateFromPngPtr(sz, data);

	mov	edx, DWORD PTR _data$[ebp]
	push	edx
	mov	eax, DWORD PTR _sz$[ebp]
	push	eax
	call	DWORD PTR __imp__gdImageCreateFromPngPtr@8
	mov	ecx, DWORD PTR _img$[ebp]
	mov	DWORD PTR [ecx], eax

; 153  : 		else if(!strncmp(data+1, add_sz_str("BMP")))

	jmp	SHORT $L71623
$L71616:
	push	3
	push	OFFSET FLAT:$SG71621
	mov	edx, DWORD PTR _data$[ebp]
	add	edx, 1
	push	edx
	call	_strncmp
	add	esp, 12					; 0000000cH
	test	eax, eax
	jne	SHORT $L71620

; 155  : 			if(imgtyp) *imgtyp = imgBMP;

	cmp	DWORD PTR _imgtyp$[ebp], 0
	je	SHORT $L71622
	mov	eax, DWORD PTR _imgtyp$[ebp]
	mov	DWORD PTR [eax], 3
$L71622:

; 156  : 			*img = gdImageCreateFromWBMPPtr(sz, data);

	mov	ecx, DWORD PTR _data$[ebp]
	push	ecx
	mov	edx, DWORD PTR _sz$[ebp]
	push	edx
	call	DWORD PTR __imp__gdImageCreateFromWBMPPtr@8
	mov	ecx, DWORD PTR _img$[ebp]
	mov	DWORD PTR [ecx], eax

; 158  : 		else

	jmp	SHORT $L71623
$L71620:

; 160  : 			if(imgtyp) *imgtyp = imgJPG;

	cmp	DWORD PTR _imgtyp$[ebp], 0
	je	SHORT $L71624
	mov	edx, DWORD PTR _imgtyp$[ebp]
	mov	DWORD PTR [edx], 4
$L71624:

; 161  : 			*img = gdImageCreateFromJpegPtr(sz, data);

	mov	eax, DWORD PTR _data$[ebp]
	push	eax
	mov	ecx, DWORD PTR _sz$[ebp]
	push	ecx
	call	DWORD PTR __imp__gdImageCreateFromJpegPtr@8
	mov	edx, DWORD PTR _img$[ebp]
	mov	DWORD PTR [edx], eax
$L71623:

; 164  : 	else

	jmp	SHORT $L71625
$L71611:

; 166  : 		free(data);

	mov	eax, DWORD PTR _data$[ebp]
	push	eax
	call	_free
	add	esp, 4

; 167  : 		return NULL;

	xor	eax, eax
	jmp	SHORT $L71604
$L71625:

; 169  : 
; 170  : 	return data;

	mov	eax, DWORD PTR _data$[ebp]
$L71604:

; 171  : }

	mov	esp, ebp
	pop	ebp
	ret	0
_get_image_data ENDP
_TEXT	ENDS
PUBLIC	_get_image_size
EXTRN	_stat:NEAR
EXTRN	__imp__gdImageDestroy@4:NEAR
_TEXT	SEGMENT
_imgpath$ = 8
_width$ = 12
_height$ = 16
_fs$ = -36
_data$ = -40
_img$ = -44
_imgtyp$ = -48
_get_image_size PROC NEAR

; 181  : ){

	push	ebp
	mov	ebp, esp
	sub	esp, 52					; 00000034H
	push	edi

; 182  : 	struct stat fs = {0};

	mov	DWORD PTR _fs$[ebp], 0
	mov	ecx, 8
	xor	eax, eax
	lea	edi, DWORD PTR _fs$[ebp+4]
	rep stosd

; 183  : 	char *data = NULL;

	mov	DWORD PTR _data$[ebp], 0

; 184  : 	gdImagePtr img = NULL;

	mov	DWORD PTR _img$[ebp], 0

; 185  : 	imgType imgtyp = imgUnkonwn;

	mov	DWORD PTR _imgtyp$[ebp], 0

; 186  : 
; 187  : 	/* Init params - return on error */
; 188  : 	if(!imgpath || !*imgpath || (!height && !width) ) return 1;

	cmp	DWORD PTR _imgpath$[ebp], 0
	je	SHORT $L71641
	mov	eax, DWORD PTR _imgpath$[ebp]
	movsx	ecx, BYTE PTR [eax]
	test	ecx, ecx
	je	SHORT $L71641
	cmp	DWORD PTR _height$[ebp], 0
	jne	SHORT $L71640
	cmp	DWORD PTR _width$[ebp], 0
	jne	SHORT $L71640
$L71641:
	mov	eax, 1
	jmp	$L71633
$L71640:

; 189  : 	if(width) *width = 0;

	cmp	DWORD PTR _width$[ebp], 0
	je	SHORT $L71642
	mov	edx, DWORD PTR _width$[ebp]
	mov	DWORD PTR [edx], 0
$L71642:

; 190  : 	if(height) *height = 0;

	cmp	DWORD PTR _height$[ebp], 0
	je	SHORT $L71643
	mov	eax, DWORD PTR _height$[ebp]
	mov	DWORD PTR [eax], 0
$L71643:

; 191  : 
; 192  : 	/* Check file status - return error if not found */
; 193  : 	if(stat(imgpath, &fs)) return 1;

	lea	ecx, DWORD PTR _fs$[ebp]
	push	ecx
	mov	edx, DWORD PTR _imgpath$[ebp]
	push	edx
	call	_stat
	add	esp, 8
	test	eax, eax
	je	SHORT $L71644
	mov	eax, 1
	jmp	$L71633
$L71644:

; 194  : 
; 195  : 	/* Try fast mode - return on success */
; 196  : 	if(get_image_size_fast(imgpath, width, height, &imgtyp)) return 0;

	lea	eax, DWORD PTR _imgtyp$[ebp]
	push	eax
	mov	ecx, DWORD PTR _height$[ebp]
	push	ecx
	mov	edx, DWORD PTR _width$[ebp]
	push	edx
	mov	eax, DWORD PTR _imgpath$[ebp]
	push	eax
	call	_get_image_size_fast
	add	esp, 16					; 00000010H
	test	eax, eax
	je	SHORT $L71645
	xor	eax, eax
	jmp	SHORT $L71633
$L71645:

; 197  : 
; 198  : 	/* Open file - skip processing on error */
; 199  : 	data = get_image_data(imgpath, fs.st_size, &img, &imgtyp);

	lea	ecx, DWORD PTR _imgtyp$[ebp]
	push	ecx
	lea	edx, DWORD PTR _img$[ebp]
	push	edx
	mov	eax, DWORD PTR _fs$[ebp+20]
	push	eax
	mov	ecx, DWORD PTR _imgpath$[ebp]
	push	ecx
	call	_get_image_data
	add	esp, 16					; 00000010H
	mov	DWORD PTR _data$[ebp], eax

; 200  : 	if(data)

	cmp	DWORD PTR _data$[ebp], 0
	je	SHORT $L71646

; 202  : 		/* Set dimensions if found */
; 203  : 		if(img)

	cmp	DWORD PTR _img$[ebp], 0
	je	SHORT $L71647

; 205  : 			if(width) *width = img->sx;

	cmp	DWORD PTR _width$[ebp], 0
	je	SHORT $L71648
	mov	edx, DWORD PTR _width$[ebp]
	mov	eax, DWORD PTR _img$[ebp]
	mov	ecx, DWORD PTR [eax+4]
	mov	DWORD PTR [edx], ecx
$L71648:

; 206  : 			if(height) *height = img->sy;

	cmp	DWORD PTR _height$[ebp], 0
	je	SHORT $L71649
	mov	edx, DWORD PTR _height$[ebp]
	mov	eax, DWORD PTR _img$[ebp]
	mov	ecx, DWORD PTR [eax+8]
	mov	DWORD PTR [edx], ecx
$L71649:

; 207  : 			gdImageDestroy(img);

	mov	edx, DWORD PTR _img$[ebp]
	push	edx
	call	DWORD PTR __imp__gdImageDestroy@4
$L71647:

; 209  : 
; 210  : 		/* Free alloc-ed data */
; 211  : 		free(data);

	mov	eax, DWORD PTR _data$[ebp]
	push	eax
	call	_free
	add	esp, 4
$L71646:

; 213  : 
; 214  : 	return !(data && img);

	cmp	DWORD PTR _data$[ebp], 0
	je	SHORT $L71761
	cmp	DWORD PTR _img$[ebp], 0
	je	SHORT $L71761
	mov	DWORD PTR -52+[ebp], 0
	jmp	SHORT $L71762
$L71761:
	mov	DWORD PTR -52+[ebp], 1
$L71762:
	mov	eax, DWORD PTR -52+[ebp]
$L71633:

; 215  : }

	pop	edi
	mov	esp, ebp
	pop	ebp
	ret	0
_get_image_size ENDP
_TEXT	ENDS
PUBLIC	__real@8@3fff8000000000000000
PUBLIC	__real@8@00000000000000000000
PUBLIC	__real@8@3ffe8000000000000000
PUBLIC	_get_image_thumb
EXTRN	__ftol:NEAR
EXTRN	__fltused:NEAR
EXTRN	__imp__gdImageColorAllocate@16:NEAR
EXTRN	_basename:NEAR
EXTRN	_fwrite:NEAR
EXTRN	__snprintf:NEAR
EXTRN	__imp__gdFree@4:NEAR
EXTRN	__imp__gdImageWBMPPtr@12:NEAR
EXTRN	__imp__gdImageJpegPtr@12:NEAR
EXTRN	__imp__gdImageGifPtr@8:NEAR
EXTRN	__imp__gdImagePngPtr@8:NEAR
EXTRN	_mem_free:NEAR
EXTRN	__imp__gdImageCopyResized@40:NEAR
EXTRN	__imp__gdImageCreate@8:NEAR
EXTRN	__imp__gdImageCreateTrueColor@8:NEAR
EXTRN	_memcpy:NEAR
EXTRN	_mkdir:NEAR
_DATA	SEGMENT
$SG71690 DB	'cache', 00H
	ORG $+2
$SG71691 DB	'/T%lux%lu-%s', 00H
	ORG $+3
$SG71717 DB	'wb', 00H
_DATA	ENDS
;	COMDAT __real@8@3fff8000000000000000
; File D:\Travail\ABI\EVA\V4.0\CGI\Brunix-2016\file_image_utils.c
CONST	SEGMENT
__real@8@3fff8000000000000000 DQ 03ff0000000000000r ; 1
CONST	ENDS
;	COMDAT __real@8@00000000000000000000
CONST	SEGMENT
__real@8@00000000000000000000 DQ 00000000000000000r ; 0
CONST	ENDS
;	COMDAT __real@8@3ffe8000000000000000
CONST	SEGMENT
__real@8@3ffe8000000000000000 DQ 03fe0000000000000r ; 0.5
CONST	ENDS
_TEXT	SEGMENT
_imgtyp$ = -72
_thumb$71697 = -112
_thumbdata$71699 = -88
_thumbdatasz$71701 = -108
_rfw$71702 = -96
_rfh$71703 = -104
_rfw$71724 = -120
_rfh$71725 = -128
_cntxt$ = 8
_imgpath$ = 12
_imgpath_sz$ = 16
_dw$ = 20
_dh$ = 24
_ow$ = 28
_oh$ = 32
_f$ = -52
_fs$ = -36
_path$ = -44
_data$ = -40
_img$ = -48
_w$ = -64
_h$ = -68
_imgfname$ = -80
_sz$ = -84
_imgsz$ = -60
_p0$ = -56
_b_noresize$ = -76
_get_image_thumb PROC NEAR

; 229  : ){

	push	ebp
	mov	ebp, esp
	sub	esp, 224				; 000000e0H
	push	edi

; 230  : 	FILE *f;
; 231  : 	struct stat fs = {0};

	mov	DWORD PTR _fs$[ebp], 0
	mov	ecx, 8
	xor	eax, eax
	lea	edi, DWORD PTR _fs$[ebp+4]
	rep stosd

; 232  : 	char *path = NULL;

	mov	DWORD PTR _path$[ebp], 0

; 233  : 	char *data = NULL;

	mov	DWORD PTR _data$[ebp], 0

; 234  : 	gdImagePtr img = NULL;

	mov	DWORD PTR _img$[ebp], 0

; 235  : 	unsigned long w = 0, h = 0;

	mov	DWORD PTR _w$[ebp], 0
	mov	DWORD PTR _h$[ebp], 0

; 236  : 	char *imgfname = basename(imgpath, imgpath_sz);

	mov	eax, DWORD PTR _imgpath_sz$[ebp]
	push	eax
	mov	ecx, DWORD PTR _imgpath$[ebp]
	push	ecx
	call	_basename
	add	esp, 8
	mov	DWORD PTR _imgfname$[ebp], eax

; 237  : 	size_t sz, imgsz, p0 = imgfname - imgpath;

	mov	edx, DWORD PTR _imgfname$[ebp]
	sub	edx, DWORD PTR _imgpath$[ebp]
	mov	DWORD PTR _p0$[ebp], edx

; 238  : 	int b_noresize = 1;

	mov	DWORD PTR _b_noresize$[ebp], 1

; 239  : 	imgType imgtyp = imgUnkonwn;

	mov	DWORD PTR _imgtyp$[ebp], 0

; 240  : 
; 241  : 	/* Init params - return NULL on error */
; 242  : 	if(!imgpath || !*imgpath || (!dw && !dh)) return NULL;

	cmp	DWORD PTR _imgpath$[ebp], 0
	je	SHORT $L71682
	mov	eax, DWORD PTR _imgpath$[ebp]
	movsx	ecx, BYTE PTR [eax]
	test	ecx, ecx
	je	SHORT $L71682
	cmp	DWORD PTR _dw$[ebp], 0
	jne	SHORT $L71681
	cmp	DWORD PTR _dh$[ebp], 0
	jne	SHORT $L71681
$L71682:
	xor	eax, eax
	jmp	$L71664
$L71681:

; 243  : 	if(ow) *ow = 0;

	cmp	DWORD PTR _ow$[ebp], 0
	je	SHORT $L71684
	mov	edx, DWORD PTR _ow$[ebp]
	mov	DWORD PTR [edx], 0
$L71684:

; 244  : 	if(oh) *oh = 0;

	cmp	DWORD PTR _oh$[ebp], 0
	je	SHORT $L71685
	mov	eax, DWORD PTR _oh$[ebp]
	mov	DWORD PTR [eax], 0
$L71685:

; 245  : 
; 246  : 	/* Check original file status - return NULL if not found */
; 247  : 	if(stat(imgpath, &fs)) return NULL;

	lea	ecx, DWORD PTR _fs$[ebp]
	push	ecx
	mov	edx, DWORD PTR _imgpath$[ebp]
	push	edx
	call	_stat
	add	esp, 8
	test	eax, eax
	je	SHORT $L71686
	xor	eax, eax
	jmp	$L71664
$L71686:

; 248  : 	imgsz = fs.st_size;

	mov	eax, DWORD PTR _fs$[ebp+20]
	mov	DWORD PTR _imgsz$[ebp], eax

; 249  : 
; 250  : 	/* Alloc memory for path - return NULL on error */
; 251  : 	sz = imgpath_sz + 64;

	mov	ecx, DWORD PTR _imgpath_sz$[ebp]
	add	ecx, 64					; 00000040H
	mov	DWORD PTR _sz$[ebp], ecx

; 252  : 	path = malloc(sz);

	mov	edx, DWORD PTR _sz$[ebp]
	push	edx
	call	_malloc
	add	esp, 4
	mov	DWORD PTR _path$[ebp], eax

; 253  : 	if(!path) return NULL;

	cmp	DWORD PTR _path$[ebp], 0
	jne	SHORT $L71688
	xor	eax, eax
	jmp	$L71664
$L71688:

; 254  : 
; 255  : 	/* Check if thumbnail exist - return path if so */
; 256  : 	memcpy(path, imgpath, p0);

	mov	eax, DWORD PTR _p0$[ebp]
	push	eax
	mov	ecx, DWORD PTR _imgpath$[ebp]
	push	ecx
	mov	edx, DWORD PTR _path$[ebp]
	push	edx
	call	_memcpy
	add	esp, 12					; 0000000cH

; 257  : 	p0 += snprintf(path + p0, sz - p0, "cache");

	push	OFFSET FLAT:$SG71690
	mov	eax, DWORD PTR _sz$[ebp]
	sub	eax, DWORD PTR _p0$[ebp]
	push	eax
	mov	ecx, DWORD PTR _path$[ebp]
	add	ecx, DWORD PTR _p0$[ebp]
	push	ecx
	call	__snprintf
	add	esp, 12					; 0000000cH
	mov	edx, DWORD PTR _p0$[ebp]
	add	edx, eax
	mov	DWORD PTR _p0$[ebp], edx

; 258  : 	MKDIR(cntxt->path); MKDIR(path);

	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	ecx, DWORD PTR [eax+29728]
	push	ecx
	call	_mkdir
	add	esp, 4
	mov	edx, DWORD PTR _path$[ebp]
	push	edx
	call	_mkdir
	add	esp, 4

; 259  : 	p0 += snprintf(path + p0, sz - p0, "/T%lux%lu-%s", dw, dh, imgfname);

	mov	eax, DWORD PTR _imgfname$[ebp]
	push	eax
	mov	ecx, DWORD PTR _dh$[ebp]
	push	ecx
	mov	edx, DWORD PTR _dw$[ebp]
	push	edx
	push	OFFSET FLAT:$SG71691
	mov	eax, DWORD PTR _sz$[ebp]
	sub	eax, DWORD PTR _p0$[ebp]
	push	eax
	mov	ecx, DWORD PTR _path$[ebp]
	add	ecx, DWORD PTR _p0$[ebp]
	push	ecx
	call	__snprintf
	add	esp, 24					; 00000018H
	mov	edx, DWORD PTR _p0$[ebp]
	add	edx, eax
	mov	DWORD PTR _p0$[ebp], edx

; 260  : 	if(!stat(path, &fs))

	lea	eax, DWORD PTR _fs$[ebp]
	push	eax
	mov	ecx, DWORD PTR _path$[ebp]
	push	ecx
	call	_stat
	add	esp, 8
	test	eax, eax
	jne	SHORT $L71692

; 262  : 		if(ow || oh) get_image_size(path, ow, oh);

	cmp	DWORD PTR _ow$[ebp], 0
	jne	SHORT $L71694
	cmp	DWORD PTR _oh$[ebp], 0
	je	SHORT $L71693
$L71694:
	mov	edx, DWORD PTR _oh$[ebp]
	push	edx
	mov	eax, DWORD PTR _ow$[ebp]
	push	eax
	mov	ecx, DWORD PTR _path$[ebp]
	push	ecx
	call	_get_image_size
	add	esp, 12					; 0000000cH
$L71693:

; 263  : 		return path;

	mov	eax, DWORD PTR _path$[ebp]
	jmp	$L71664
$L71692:

; 265  : 
; 266  : 	/* Read image - skip processing on error */
; 267  : 	data = get_image_data(imgpath, imgsz, &img, &imgtyp);

	lea	edx, DWORD PTR _imgtyp$[ebp]
	push	edx
	lea	eax, DWORD PTR _img$[ebp]
	push	eax
	mov	ecx, DWORD PTR _imgsz$[ebp]
	push	ecx
	mov	edx, DWORD PTR _imgpath$[ebp]
	push	edx
	call	_get_image_data
	add	esp, 16					; 00000010H
	mov	DWORD PTR _data$[ebp], eax

; 268  : 	if(data)

	cmp	DWORD PTR _data$[ebp], 0
	je	$L71695

; 270  : 		/* Handle image if it was read with GD */
; 271  : 		if(img)

	cmp	DWORD PTR _img$[ebp], 0
	je	$L71696

; 273  : 			gdImagePtr thumb = NULL;

	mov	DWORD PTR _thumb$71697[ebp], 0

; 274  : 			char *thumbdata = NULL;

	mov	DWORD PTR _thumbdata$71699[ebp], 0

; 275  : 			int thumbdatasz = 0;

	mov	DWORD PTR _thumbdatasz$71701[ebp], 0

; 276  : 
; 277  : 			/* Compute resize factors & new dimensions */
; 278  : 			double rfw = !dw ? 1. : 1. * img->sx / dw;

	cmp	DWORD PTR _dw$[ebp], 0
	jne	SHORT $L71764
	mov	DWORD PTR -136+[ebp], 0
	mov	DWORD PTR -136+[ebp+4], 1072693248	; 3ff00000H
	jmp	SHORT $L71765
$L71764:
	mov	eax, DWORD PTR _img$[ebp]
	fild	DWORD PTR [eax+4]
	fmul	QWORD PTR __real@8@3fff8000000000000000
	mov	ecx, DWORD PTR _dw$[ebp]
	mov	DWORD PTR -144+[ebp], ecx
	mov	DWORD PTR -144+[ebp+4], 0
	fild	QWORD PTR -144+[ebp]
	fdivp	ST(1), ST(0)
	fstp	QWORD PTR -136+[ebp]
$L71765:
	mov	edx, DWORD PTR -136+[ebp]
	mov	DWORD PTR _rfw$71702[ebp], edx
	mov	eax, DWORD PTR -136+[ebp+4]
	mov	DWORD PTR _rfw$71702[ebp+4], eax

; 279  : 			double rfh = !dh ? 1. : 1. * img->sy / dh;

	cmp	DWORD PTR _dh$[ebp], 0
	jne	SHORT $L71766
	mov	DWORD PTR -152+[ebp], 0
	mov	DWORD PTR -152+[ebp+4], 1072693248	; 3ff00000H
	jmp	SHORT $L71767
$L71766:
	mov	ecx, DWORD PTR _img$[ebp]
	fild	DWORD PTR [ecx+8]
	fmul	QWORD PTR __real@8@3fff8000000000000000
	mov	edx, DWORD PTR _dh$[ebp]
	mov	DWORD PTR -160+[ebp], edx
	mov	DWORD PTR -160+[ebp+4], 0
	fild	QWORD PTR -160+[ebp]
	fdivp	ST(1), ST(0)
	fstp	QWORD PTR -152+[ebp]
$L71767:
	mov	eax, DWORD PTR -152+[ebp]
	mov	DWORD PTR _rfh$71703[ebp], eax
	mov	ecx, DWORD PTR -152+[ebp+4]
	mov	DWORD PTR _rfh$71703[ebp+4], ecx

; 280  : 			if(rfw && rfh && (rfw > 1 || rfh > 1))

	fld	QWORD PTR _rfw$71702[ebp]
	fcomp	QWORD PTR __real@8@00000000000000000000
	fnstsw	ax
	test	ah, 64					; 00000040H
	jne	$L71704
	fld	QWORD PTR _rfh$71703[ebp]
	fcomp	QWORD PTR __real@8@00000000000000000000
	fnstsw	ax
	test	ah, 64					; 00000040H
	jne	$L71704
	fld	QWORD PTR _rfw$71702[ebp]
	fcomp	QWORD PTR __real@8@3fff8000000000000000
	fnstsw	ax
	test	ah, 65					; 00000041H
	je	SHORT $L71705
	fld	QWORD PTR _rfh$71703[ebp]
	fcomp	QWORD PTR __real@8@3fff8000000000000000
	fnstsw	ax
	test	ah, 65					; 00000041H
	jne	$L71704
$L71705:

; 282  : 				/* Handle resize if needed */
; 283  : 				b_noresize = 0;

	mov	DWORD PTR _b_noresize$[ebp], 0

; 284  : 				if(rfw > rfh)

	fld	QWORD PTR _rfw$71702[ebp]
	fcomp	QWORD PTR _rfh$71703[ebp]
	fnstsw	ax
	test	ah, 65					; 00000041H
	jne	SHORT $L71706

; 286  : 					w = dw;

	mov	edx, DWORD PTR _dw$[ebp]
	mov	DWORD PTR _w$[ebp], edx

; 287  : 					h = (unsigned long)(0.5 + img->sy / rfw);

	mov	eax, DWORD PTR _img$[ebp]
	fild	DWORD PTR [eax+8]
	fdiv	QWORD PTR _rfw$71702[ebp]
	fadd	QWORD PTR __real@8@3ffe8000000000000000
	call	__ftol
	mov	DWORD PTR _h$[ebp], eax

; 289  : 				else

	jmp	SHORT $L71708
$L71706:

; 291  : 					w = (unsigned long)(0.5 + img->sx / rfh);

	mov	ecx, DWORD PTR _img$[ebp]
	fild	DWORD PTR [ecx+4]
	fdiv	QWORD PTR _rfh$71703[ebp]
	fadd	QWORD PTR __real@8@3ffe8000000000000000
	call	__ftol
	mov	DWORD PTR _w$[ebp], eax

; 292  : 					h = dh;

	mov	edx, DWORD PTR _dh$[ebp]
	mov	DWORD PTR _h$[ebp], edx
$L71708:

; 294  : 
; 295  : 				/* Handle image type */
; 296  : 				if(imgtyp == imgGIF)

	cmp	DWORD PTR _imgtyp$[ebp], 1
	jne	SHORT $L71710

; 298  : 					/* Resize GIF image */
; 299  : 					thumb = gdImageCreate(w, h);

	mov	eax, DWORD PTR _h$[ebp]
	push	eax
	mov	ecx, DWORD PTR _w$[ebp]
	push	ecx
	call	DWORD PTR __imp__gdImageCreate@8
	mov	DWORD PTR _thumb$71697[ebp], eax

; 300  : 					gdImageCopyResized(thumb, img, 0, 0, 0, 0, w, h, img->sx, img->sy);

	mov	edx, DWORD PTR _img$[ebp]
	mov	eax, DWORD PTR [edx+8]
	push	eax
	mov	ecx, DWORD PTR _img$[ebp]
	mov	edx, DWORD PTR [ecx+4]
	push	edx
	mov	eax, DWORD PTR _h$[ebp]
	push	eax
	mov	ecx, DWORD PTR _w$[ebp]
	push	ecx
	push	0
	push	0
	push	0
	push	0
	mov	edx, DWORD PTR _img$[ebp]
	push	edx
	mov	eax, DWORD PTR _thumb$71697[ebp]
	push	eax
	call	DWORD PTR __imp__gdImageCopyResized@40

; 301  : 					thumbdata = gdImageGifPtr(thumb, &thumbdatasz);

	lea	ecx, DWORD PTR _thumbdatasz$71701[ebp]
	push	ecx
	mov	edx, DWORD PTR _thumb$71697[ebp]
	push	edx
	call	DWORD PTR __imp__gdImageGifPtr@8
	mov	DWORD PTR _thumbdata$71699[ebp], eax

; 303  : 				else if(imgtyp == imgPNG)

	jmp	$L71716
$L71710:
	cmp	DWORD PTR _imgtyp$[ebp], 2
	jne	SHORT $L71712

; 305  : 					/* Resize PNG image */
; 306  : 					thumb = gdImageCreate(w, h);

	mov	eax, DWORD PTR _h$[ebp]
	push	eax
	mov	ecx, DWORD PTR _w$[ebp]
	push	ecx
	call	DWORD PTR __imp__gdImageCreate@8
	mov	DWORD PTR _thumb$71697[ebp], eax

; 307  : 					gdImageCopyResized(thumb, img, 0, 0, 0, 0, w, h, img->sx, img->sy);

	mov	edx, DWORD PTR _img$[ebp]
	mov	eax, DWORD PTR [edx+8]
	push	eax
	mov	ecx, DWORD PTR _img$[ebp]
	mov	edx, DWORD PTR [ecx+4]
	push	edx
	mov	eax, DWORD PTR _h$[ebp]
	push	eax
	mov	ecx, DWORD PTR _w$[ebp]
	push	ecx
	push	0
	push	0
	push	0
	push	0
	mov	edx, DWORD PTR _img$[ebp]
	push	edx
	mov	eax, DWORD PTR _thumb$71697[ebp]
	push	eax
	call	DWORD PTR __imp__gdImageCopyResized@40

; 308  : 					thumbdata = gdImagePngPtr(thumb, &thumbdatasz);

	lea	ecx, DWORD PTR _thumbdatasz$71701[ebp]
	push	ecx
	mov	edx, DWORD PTR _thumb$71697[ebp]
	push	edx
	call	DWORD PTR __imp__gdImagePngPtr@8
	mov	DWORD PTR _thumbdata$71699[ebp], eax

; 310  : 				else if(imgtyp == imgBMP)

	jmp	$L71716
$L71712:
	cmp	DWORD PTR _imgtyp$[ebp], 3
	jne	SHORT $L71714

; 312  : 					/* Resize BMP image */
; 313  : 					thumb = gdImageCreate(w, h);

	mov	eax, DWORD PTR _h$[ebp]
	push	eax
	mov	ecx, DWORD PTR _w$[ebp]
	push	ecx
	call	DWORD PTR __imp__gdImageCreate@8
	mov	DWORD PTR _thumb$71697[ebp], eax

; 314  : 					gdImageCopyResized(thumb, img, 0, 0, 0, 0, w, h, img->sx, img->sy);

	mov	edx, DWORD PTR _img$[ebp]
	mov	eax, DWORD PTR [edx+8]
	push	eax
	mov	ecx, DWORD PTR _img$[ebp]
	mov	edx, DWORD PTR [ecx+4]
	push	edx
	mov	eax, DWORD PTR _h$[ebp]
	push	eax
	mov	ecx, DWORD PTR _w$[ebp]
	push	ecx
	push	0
	push	0
	push	0
	push	0
	mov	edx, DWORD PTR _img$[ebp]
	push	edx
	mov	eax, DWORD PTR _thumb$71697[ebp]
	push	eax
	call	DWORD PTR __imp__gdImageCopyResized@40

; 315  : 					thumbdata = gdImageWBMPPtr(thumb, &thumbdatasz, gdImageColorAllocate(thumb, 0, 0, 0));

	push	0
	push	0
	push	0
	mov	ecx, DWORD PTR _thumb$71697[ebp]
	push	ecx
	call	DWORD PTR __imp__gdImageColorAllocate@16
	push	eax
	lea	edx, DWORD PTR _thumbdatasz$71701[ebp]
	push	edx
	mov	eax, DWORD PTR _thumb$71697[ebp]
	push	eax
	call	DWORD PTR __imp__gdImageWBMPPtr@12
	mov	DWORD PTR _thumbdata$71699[ebp], eax

; 317  : 				else if(imgtyp == imgJPG)

	jmp	SHORT $L71716
$L71714:
	cmp	DWORD PTR _imgtyp$[ebp], 4
	jne	SHORT $L71716

; 319  : 					/* Resize JPEG image */
; 320  : 					thumb = gdImageCreateTrueColor(w, h);

	mov	ecx, DWORD PTR _h$[ebp]
	push	ecx
	mov	edx, DWORD PTR _w$[ebp]
	push	edx
	call	DWORD PTR __imp__gdImageCreateTrueColor@8
	mov	DWORD PTR _thumb$71697[ebp], eax

; 321  : 					gdImageCopyResized(thumb, img, 0, 0, 0, 0, w, h, img->sx, img->sy);

	mov	eax, DWORD PTR _img$[ebp]
	mov	ecx, DWORD PTR [eax+8]
	push	ecx
	mov	edx, DWORD PTR _img$[ebp]
	mov	eax, DWORD PTR [edx+4]
	push	eax
	mov	ecx, DWORD PTR _h$[ebp]
	push	ecx
	mov	edx, DWORD PTR _w$[ebp]
	push	edx
	push	0
	push	0
	push	0
	push	0
	mov	eax, DWORD PTR _img$[ebp]
	push	eax
	mov	ecx, DWORD PTR _thumb$71697[ebp]
	push	ecx
	call	DWORD PTR __imp__gdImageCopyResized@40

; 322  : 					thumbdata = gdImageJpegPtr(thumb, &thumbdatasz, -1);

	push	-1
	lea	edx, DWORD PTR _thumbdatasz$71701[ebp]
	push	edx
	mov	eax, DWORD PTR _thumb$71697[ebp]
	push	eax
	call	DWORD PTR __imp__gdImageJpegPtr@12
	mov	DWORD PTR _thumbdata$71699[ebp], eax
$L71716:

; 324  : 
; 325  : 				/* Output thumb file */
; 326  : 				f = fopen(path, "wb");

	push	OFFSET FLAT:$SG71717
	mov	ecx, DWORD PTR _path$[ebp]
	push	ecx
	call	_fopen
	add	esp, 8
	mov	DWORD PTR _f$[ebp], eax

; 327  : 				if(f)

	cmp	DWORD PTR _f$[ebp], 0
	je	SHORT $L71718

; 329  : 					if(thumbdata) fwrite(thumbdata, 1, thumbdatasz, f);

	cmp	DWORD PTR _thumbdata$71699[ebp], 0
	je	SHORT $L71719
	mov	edx, DWORD PTR _f$[ebp]
	push	edx
	mov	eax, DWORD PTR _thumbdatasz$71701[ebp]
	push	eax
	push	1
	mov	ecx, DWORD PTR _thumbdata$71699[ebp]
	push	ecx
	call	_fwrite
	add	esp, 16					; 00000010H
$L71719:

; 330  : 					fclose(f);

	mov	edx, DWORD PTR _f$[ebp]
	push	edx
	call	_fclose
	add	esp, 4
$L71718:

; 332  : 				gdImageDestroy(img);

	mov	eax, DWORD PTR _img$[ebp]
	push	eax
	call	DWORD PTR __imp__gdImageDestroy@4

; 333  : 				gdFree(thumbdata);

	mov	ecx, DWORD PTR _thumbdata$71699[ebp]
	push	ecx
	call	DWORD PTR __imp__gdFree@4

; 334  : 				gdImageDestroy(thumb);

	mov	edx, DWORD PTR _thumb$71697[ebp]
	push	edx
	call	DWORD PTR __imp__gdImageDestroy@4

; 336  : 			else

	jmp	SHORT $L71720
$L71704:

; 338  : 				w = img->sx;

	mov	eax, DWORD PTR _img$[ebp]
	mov	ecx, DWORD PTR [eax+4]
	mov	DWORD PTR _w$[ebp], ecx

; 339  : 				h = img->sy;

	mov	edx, DWORD PTR _img$[ebp]
	mov	eax, DWORD PTR [edx+8]
	mov	DWORD PTR _h$[ebp], eax
$L71720:

; 342  : 		else

	jmp	$L71730
$L71696:

; 344  : 			/* Image could not be read by GD : check alternate size read method */
; 345  : 			if(get_image_size_head(data, imgsz, &w, &h, NULL))

	push	0
	lea	ecx, DWORD PTR _h$[ebp]
	push	ecx
	lea	edx, DWORD PTR _w$[ebp]
	push	edx
	mov	eax, DWORD PTR _imgsz$[ebp]
	push	eax
	mov	ecx, DWORD PTR _data$[ebp]
	push	ecx
	call	_get_image_size_head
	add	esp, 20					; 00000014H
	test	eax, eax
	je	$L71730

; 347  : 				/* Size available with alternate method : use display resize */
; 348  : 				double rfw = !dw ? 1. : 1. * w / dw;

	cmp	DWORD PTR _dw$[ebp], 0
	jne	SHORT $L71768
	mov	DWORD PTR -168+[ebp], 0
	mov	DWORD PTR -168+[ebp+4], 1072693248	; 3ff00000H
	jmp	SHORT $L71769
$L71768:
	mov	edx, DWORD PTR _w$[ebp]
	mov	DWORD PTR -176+[ebp], edx
	mov	DWORD PTR -176+[ebp+4], 0
	fild	QWORD PTR -176+[ebp]
	fmul	QWORD PTR __real@8@3fff8000000000000000
	mov	eax, DWORD PTR _dw$[ebp]
	mov	DWORD PTR -184+[ebp], eax
	mov	DWORD PTR -184+[ebp+4], 0
	fild	QWORD PTR -184+[ebp]
	fdivp	ST(1), ST(0)
	fstp	QWORD PTR -168+[ebp]
$L71769:
	mov	ecx, DWORD PTR -168+[ebp]
	mov	DWORD PTR _rfw$71724[ebp], ecx
	mov	edx, DWORD PTR -168+[ebp+4]
	mov	DWORD PTR _rfw$71724[ebp+4], edx

; 349  : 				double rfh = !dh ? 1. : 1. * h / dh;

	cmp	DWORD PTR _dh$[ebp], 0
	jne	SHORT $L71770
	mov	DWORD PTR -192+[ebp], 0
	mov	DWORD PTR -192+[ebp+4], 1072693248	; 3ff00000H
	jmp	SHORT $L71771
$L71770:
	mov	eax, DWORD PTR _h$[ebp]
	mov	DWORD PTR -200+[ebp], eax
	mov	DWORD PTR -200+[ebp+4], 0
	fild	QWORD PTR -200+[ebp]
	fmul	QWORD PTR __real@8@3fff8000000000000000
	mov	ecx, DWORD PTR _dh$[ebp]
	mov	DWORD PTR -208+[ebp], ecx
	mov	DWORD PTR -208+[ebp+4], 0
	fild	QWORD PTR -208+[ebp]
	fdivp	ST(1), ST(0)
	fstp	QWORD PTR -192+[ebp]
$L71771:
	mov	edx, DWORD PTR -192+[ebp]
	mov	DWORD PTR _rfh$71725[ebp], edx
	mov	eax, DWORD PTR -192+[ebp+4]
	mov	DWORD PTR _rfh$71725[ebp+4], eax

; 350  : 				if(rfw && rfh && (rfw > 1 || rfh > 1))

	fld	QWORD PTR _rfw$71724[ebp]
	fcomp	QWORD PTR __real@8@00000000000000000000
	fnstsw	ax
	test	ah, 64					; 00000040H
	jne	$L71730
	fld	QWORD PTR _rfh$71725[ebp]
	fcomp	QWORD PTR __real@8@00000000000000000000
	fnstsw	ax
	test	ah, 64					; 00000040H
	jne	$L71730
	fld	QWORD PTR _rfw$71724[ebp]
	fcomp	QWORD PTR __real@8@3fff8000000000000000
	fnstsw	ax
	test	ah, 65					; 00000041H
	je	SHORT $L71727
	fld	QWORD PTR _rfh$71725[ebp]
	fcomp	QWORD PTR __real@8@3fff8000000000000000
	fnstsw	ax
	test	ah, 65					; 00000041H
	jne	SHORT $L71730
$L71727:

; 352  : 					/* Handle display resize if needed */
; 353  : 					if(rfw > rfh)

	fld	QWORD PTR _rfw$71724[ebp]
	fcomp	QWORD PTR _rfh$71725[ebp]
	fnstsw	ax
	test	ah, 65					; 00000041H
	jne	SHORT $L71728

; 355  : 						w = dw;

	mov	ecx, DWORD PTR _dw$[ebp]
	mov	DWORD PTR _w$[ebp], ecx

; 356  : 						h = (unsigned long)(0.5 + h / rfw);

	mov	edx, DWORD PTR _h$[ebp]
	mov	DWORD PTR -216+[ebp], edx
	mov	DWORD PTR -216+[ebp+4], 0
	fild	QWORD PTR -216+[ebp]
	fdiv	QWORD PTR _rfw$71724[ebp]
	fadd	QWORD PTR __real@8@3ffe8000000000000000
	call	__ftol
	mov	DWORD PTR _h$[ebp], eax

; 358  : 					else

	jmp	SHORT $L71730
$L71728:

; 360  : 						w = (unsigned long)(0.5 + w / rfh);

	mov	eax, DWORD PTR _w$[ebp]
	mov	DWORD PTR -224+[ebp], eax
	mov	DWORD PTR -224+[ebp+4], 0
	fild	QWORD PTR -224+[ebp]
	fdiv	QWORD PTR _rfh$71725[ebp]
	fadd	QWORD PTR __real@8@3ffe8000000000000000
	call	__ftol
	mov	DWORD PTR _w$[ebp], eax

; 361  : 						h = dh;

	mov	ecx, DWORD PTR _dh$[ebp]
	mov	DWORD PTR _h$[ebp], ecx
$L71730:

; 366  : 
; 367  : 		/* Set return dimensions where applicable */
; 368  : 		if(ow) *ow = w;

	cmp	DWORD PTR _ow$[ebp], 0
	je	SHORT $L71732
	mov	edx, DWORD PTR _ow$[ebp]
	mov	eax, DWORD PTR _w$[ebp]
	mov	DWORD PTR [edx], eax
$L71732:

; 369  : 		if(oh) *oh = h;

	cmp	DWORD PTR _oh$[ebp], 0
	je	SHORT $L71733
	mov	ecx, DWORD PTR _oh$[ebp]
	mov	edx, DWORD PTR _h$[ebp]
	mov	DWORD PTR [ecx], edx
$L71733:

; 370  : 
; 371  : 		/* Free alloc-ed data */
; 372  : 		free(data);

	mov	eax, DWORD PTR _data$[ebp]
	push	eax
	call	_free
	add	esp, 4
$L71695:

; 374  : 
; 375  : 	/* Handle no resize : free path & return NULL */
; 376  : 	if(b_noresize) M_FREE(path);

	cmp	DWORD PTR _b_noresize$[ebp], 0
	je	SHORT $L71734
	mov	ecx, DWORD PTR _path$[ebp]
	push	ecx
	call	_mem_free
	add	esp, 4
	mov	DWORD PTR _path$[ebp], 0
$L71734:

; 377  : 
; 378  : 	return path;

	mov	eax, DWORD PTR _path$[ebp]
$L71664:

; 379  : }

	pop	edi
	mov	esp, ebp
	pop	ebp
	ret	0
_get_image_thumb ENDP
_TEXT	ENDS
END
