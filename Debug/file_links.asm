	TITLE	D:\Travail\ABI\EVA\V4.0\CGI\Brunix-2016\file_links.c
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
PUBLIC	_cgi_output_string
EXTRN	__pctype:DWORD
EXTRN	__isctype:NEAR
EXTRN	_sprintf:NEAR
EXTRN	___mb_cur_max:DWORD
EXTRN	_dynbuf_add:NEAR
EXTRN	_strchr:NEAR
EXTRN	_err_add_context:NEAR
EXTRN	_err_clear:NEAR
_DATA	SEGMENT
$SG70221 DB	'.-_', 0c3H, 0a0H, 0c3H, 0a1H, 0c3H, 0a2H, 0c3H, 0a3H, 0c3H
	DB	0a4H, 0c3H, 0a5H, 0c3H, 0a6H, 0c3H, 0a7H, 0c3H, 0a9H, 0c3H, 0a8H
	DB	0c3H, 0aaH, 0c3H, 0abH, 0c3H, 0acH, 0c3H, 0adH, 0c3H, 0aeH, 0c3H
	DB	0afH, 0c3H, 0b2H, 0c3H, 0b3H, 0c3H, 0b4H, 0c3H, 0b5H, 0c3H, 0b6H
	DB	0c3H, 0b9H, 0c3H, 0baH, 0c3H, 0bbH, 0c3H, 0bcH, 0c3H, 080H, 0c3H
	DB	081H, 0c3H, 082H, 0c3H, 083H, 0c3H, 084H, 0c3H, 085H, 0c3H, 086H
	DB	0c3H, 087H, 0c3H, 089H, 0c3H, 088H, 0c3H, 08aH, 0c3H, 08bH, 0c3H
	DB	08cH, 0c3H, 08dH, 0c3H, 08eH, 0c3H, 08fH, 0c3H, 092H, 0c3H, 093H
	DB	0c3H, 094H, 0c3H, 095H, 0c3H, 096H, 0c3H, 099H, 0c3H, 09aH, 0c3H
	DB	09bH, 0c3H, 09cH, 00H
$SG70223 DB	'%%%02X', 00H
	ORG $+1
$SG70227 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70233 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70234 DB	'D:\Travail\ABI\EVA\V4.0\CGI\Brunix-2016\file_links.c', 00H
	ORG $+3
$SG70235 DB	'cgi_output_string', 00H
	ORG $+2
$SG70237 DB	'D:\Travail\ABI\EVA\V4.0\CGI\Brunix-2016\file_links.c', 00H
	ORG $+3
$SG70238 DB	'cgi_output_string', 00H
_DATA	ENDS
_TEXT	SEGMENT
_cntxt$ = 8
_html$ = 12
_txt$ = 16
_sz$ = 20
_i$ = -4
_tmp$70222 = -12
_cgi_output_string PROC NEAR

; 26   : ){

	push	ebp
	mov	ebp, esp
	sub	esp, 16					; 00000010H

; 27   : 	size_t i;
; 28   : 	if(!html || !txt || !*txt || !sz) RETURN_OK;

	cmp	DWORD PTR _html$[ebp], 0
	je	SHORT $L70215
	cmp	DWORD PTR _txt$[ebp], 0
	je	SHORT $L70215
	mov	eax, DWORD PTR _txt$[ebp]
	movsx	ecx, BYTE PTR [eax]
	test	ecx, ecx
	je	SHORT $L70215
	cmp	DWORD PTR _sz$[ebp], 0
	jne	SHORT $L70214
$L70215:
	jmp	$eva_noerr$70216
$L70214:

; 29   : 
; 30   : 	for(i = 0; i < sz; i++)

	mov	DWORD PTR _i$[ebp], 0
	jmp	SHORT $L70217
$L70218:
	mov	edx, DWORD PTR _i$[ebp]
	add	edx, 1
	mov	DWORD PTR _i$[ebp], edx
$L70217:
	mov	eax, DWORD PTR _i$[ebp]
	cmp	eax, DWORD PTR _sz$[ebp]
	jae	$eva_noerr$70216

; 32   : 		if(!isalnum(txt[i]) && !strchr(".-_" LOCASE_ACCENT UPCASE_ACCENT, txt[i]))

	cmp	DWORD PTR ___mb_cur_max, 1
	jle	SHORT $L70431
	push	263					; 00000107H
	mov	ecx, DWORD PTR _txt$[ebp]
	add	ecx, DWORD PTR _i$[ebp]
	movsx	edx, BYTE PTR [ecx]
	push	edx
	call	__isctype
	add	esp, 8
	mov	DWORD PTR -16+[ebp], eax
	jmp	SHORT $L70432
$L70431:
	mov	eax, DWORD PTR _txt$[ebp]
	add	eax, DWORD PTR _i$[ebp]
	movsx	ecx, BYTE PTR [eax]
	mov	edx, DWORD PTR __pctype
	xor	eax, eax
	mov	ax, WORD PTR [edx+ecx*2]
	and	eax, 263				; 00000107H
	mov	DWORD PTR -16+[ebp], eax
$L70432:
	cmp	DWORD PTR -16+[ebp], 0
	jne	SHORT $L70220
	mov	ecx, DWORD PTR _txt$[ebp]
	add	ecx, DWORD PTR _i$[ebp]
	movsx	edx, BYTE PTR [ecx]
	push	edx
	push	OFFSET FLAT:$SG70221
	call	_strchr
	add	esp, 8
	test	eax, eax
	jne	SHORT $L70220

; 34   : 			char tmp[8];
; 35   : 			sprintf(tmp, "%%%02X", txt[i] & 0xFF);

	mov	eax, DWORD PTR _txt$[ebp]
	add	eax, DWORD PTR _i$[ebp]
	movsx	ecx, BYTE PTR [eax]
	and	ecx, 255				; 000000ffH
	push	ecx
	push	OFFSET FLAT:$SG70223
	lea	edx, DWORD PTR _tmp$70222[ebp]
	push	edx
	call	_sprintf
	add	esp, 12					; 0000000cH

; 36   : 			DYNBUF_ADD(html, tmp, 3, NO_CONV);

	push	0
	push	0
	push	3
	lea	eax, DWORD PTR _tmp$70222[ebp]
	push	eax
	mov	ecx, DWORD PTR _html$[ebp]
	push	ecx
	call	_dynbuf_add
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L70225
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29872], OFFSET FLAT:$SG70227
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 36		; 00000024H
	jmp	SHORT $eva_err$70228
$L70225:

; 38   : 		else

	jmp	SHORT $L70231
$L70220:

; 39   : 			DYNBUF_ADD(html, txt + i, 1, NO_CONV);

	push	0
	push	0
	push	1
	mov	ecx, DWORD PTR _txt$[ebp]
	add	ecx, DWORD PTR _i$[ebp]
	push	ecx
	mov	edx, DWORD PTR _html$[ebp]
	push	edx
	call	_dynbuf_add
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L70231
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29872], OFFSET FLAT:$SG70233
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 39		; 00000027H
	jmp	SHORT $eva_err$70228
$L70231:

; 40   : 	}

	jmp	$L70218
$eva_noerr$70216:

; 41   : 
; 42   : 	RETURN_OK_CLEANUP;

	push	0
	push	OFFSET FLAT:$SG70234
	push	OFFSET FLAT:$SG70235
	mov	edx, DWORD PTR _cntxt$[ebp]
	push	edx
	call	_err_clear
	add	esp, 16					; 00000010H
$eva_err$70228:
	mov	eax, DWORD PTR _cntxt$[ebp]
	cmp	DWORD PTR [eax+29872], 0
	je	SHORT $L70236
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	edx, DWORD PTR [ecx+29900]
	push	edx
	push	OFFSET FLAT:$SG70237
	push	OFFSET FLAT:$SG70238
	mov	eax, DWORD PTR _cntxt$[ebp]
	push	eax
	call	_err_add_context
	add	esp, 16					; 00000010H
$L70236:
	mov	ecx, DWORD PTR _cntxt$[ebp]
	xor	eax, eax
	cmp	DWORD PTR [ecx+29872], 0
	setne	al

; 43   : }

	mov	esp, ebp
	pop	ebp
	ret	0
_cgi_output_string ENDP
_TEXT	ENDS
PUBLIC	_file_output_link
EXTRN	_put_html_button_sz:NEAR
EXTRN	_human_filesize:NEAR
EXTRN	_remove:NEAR
EXTRN	_rename:NEAR
EXTRN	__snprintf:NEAR
EXTRN	_chdir_user_doc:NEAR
EXTRN	_stat:NEAR
EXTRN	_plain_to_html:BYTE
EXTRN	_html_tooltip:BYTE
EXTRN	_no_quote:BYTE
EXTRN	_system:NEAR
EXTRN	_dynbuf_add3:NEAR
EXTRN	_dyntab_val:NEAR
EXTRN	_strcmp:NEAR
EXTRN	__chkstk:NEAR
EXTRN	_chdir:NEAR
EXTRN	_getcwd:NEAR
EXTRN	_put_showhelp:NEAR
_BSS	SEGMENT
$SG70334 DB	01H DUP (?)
_BSS	ENDS
_DATA	SEGMENT
	ORG $+2
$SG70279 DB	'<center>', 00H
	ORG $+3
$SG70281 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70286 DB	'Cliquez sur le lien ci-dessous pour t', 0e9H, 'l', 0e9H, 'c'
	DB	'harger le fichier<br><br><font size=-1>Si vous utilisez Inter'
	DB	'net Explorer, le fichier s''ouvrira dans une nouvelle fen', 0eaH
	DB	'tre<br>Pour enregistrer le fichier sur votre ordinateur, cliq'
	DB	'uez avec le bouton de droite et choisissez Enregistrer la cib'
	DB	'le sous ...</font><br><br>', 00H
$SG70288 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70291 DB	'#user', 00H
	ORG $+2
$SG70292 DB	'/docs/%s/%s/', 00H
	ORG $+3
$SG70295 DB	'#docs', 00H
	ORG $+2
$SG70296 DB	'/docs/%s/', 00H
	ORG $+2
$SG70298 DB	'/%s/', 00H
	ORG $+3
$SG70300 DB	'/', 00H
	ORG $+2
$SG70301 DB	'%s%s', 00H
	ORG $+3
$SG70306 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70309 DB	'</u></font>', 00H
$SG70310 DB	'<font color=#FF0000><b>File not found</b> - <u>', 00H
$SG70312 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70316 DB	'</u></font>', 00H
$SG70317 DB	'<font color=#FF0000><b>Empty file</b> - <u>', 00H
$SG70319 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70322 DB	'<a target=_blank', 00H
	ORG $+3
$SG70324 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70327 DB	'''', 00H
	ORG $+2
$SG70328 DB	' title=''', 00H
	ORG $+3
$SG70330 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70335 DB	' href=''', 00H
$SG70337 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70340 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70342 DB	'</a> - ', 00H
$SG70343 DB	'''>', 00H
	ORG $+1
$SG70345 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70349 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70356 DB	'%s.zip', 00H
	ORG $+1
$SG70357 DB	'copy "%s%s" . > msg.txt 2>err.txt', 00H
	ORG $+2
$SG70358 DB	'%szip.exe -j -9 tmp.zip "%s" > msg.txt 2>err.txt', 00H
	ORG $+3
$SG70359 DB	'tmp.zip', 00H
$SG70360 DB	'tmp.zip', 00H
$SG70361 DB	'err.txt', 00H
$SG70362 DB	'msg.txt', 00H
$SG70366 DB	'Ce fichier est compress', 0e9H, ' pour r', 0e9H, 'duire '
	DB	'le temps de transfert', 00H
$SG70367 DB	'#user', 00H
	ORG $+2
$SG70368 DB	'<br><font size=-1>Ficher zipp', 0e9H, ' : ', 00H
	ORG $+2
$SG70371 DB	'</font>', 00H
$SG70373 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70377 DB	'<hr>', 00H
	ORG $+3
$SG70379 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70383 DB	'<hr><center>', 00H
	ORG $+3
$SG70384 DB	'</center>', 00H
	ORG $+2
$SG70386 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70391 DB	'<br>', 00H
	ORG $+3
$SG70393 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70396 DB	'Retourne au formulaire de saisie', 00H
	ORG $+3
$SG70397 DB	'_eva_btn_gobackobj_fr_s.gif', 00H
$SG70398 DB	'_eva_btn_gobackobj_fr.gif', 00H
	ORG $+2
$SG70399 DB	'Revenir ', 0e0H, ' la fiche', 00H
	ORG $+1
$SG70400 DB	'NOP', 00H
$SG70401 DB	'D:\Travail\ABI\EVA\V4.0\CGI\Brunix-2016\file_links.c', 00H
	ORG $+3
$SG70402 DB	'file_output_link', 00H
	ORG $+3
$SG70406 DB	'<img src=/img/_eva_nop.gif width=100 height=1>', 00H
	ORG $+1
$SG70408 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70411 DB	'Retourne au formulaire pr', 0e9H, 'c', 0e9H, 'dent', 00H
	ORG $+3
$SG70412 DB	'_eva_btn_close_fr_s.gif', 00H
$SG70413 DB	'_eva_btn_close_fr.gif', 00H
	ORG $+2
$SG70414 DB	'Fermer', 00H
	ORG $+1
$SG70415 DB	'B$#.CLOSE', 00H
	ORG $+2
$SG70419 DB	'</center>', 00H
	ORG $+2
$SG70421 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70422 DB	'D:\Travail\ABI\EVA\V4.0\CGI\Brunix-2016\file_links.c', 00H
	ORG $+3
$SG70423 DB	'file_output_link', 00H
	ORG $+3
$SG70425 DB	'D:\Travail\ABI\EVA\V4.0\CGI\Brunix-2016\file_links.c', 00H
	ORG $+3
$SG70426 DB	'file_output_link', 00H
_DATA	ENDS
_TEXT	SEGMENT
_cntxt$ = 8
_html$ = 12
_title$ = 16
_sz_title$ = 20
_name$ = 24
_sz_name$ = 28
_fname$ = 32
_sz_fname$ = 36
_fdir$ = 40
_notes$ = 44
_sz_notes$ = 48
_msg$ = 52
_sz_msg$ = 56
_options$ = 60
_path$ = -4132
_dir$ = -6184
_loc$ = -5156
_sz_loc$ = -5160
_fs$ = -36
_zipcmd$70351 = -10280
_cwd$70352 = -18476
_zipfile$70353 = -14380
_sz_zipfile$70354 = -10284
_h$70388 = -18480
_file_output_link PROC NEAR

; 70   : ){

	push	ebp
	mov	ebp, esp
	mov	eax, 18480				; 00004830H
	call	__chkstk
	push	edi

; 71   : 	char path[4096];
; 72   : 	char dir[1024] = {0};

	mov	BYTE PTR _dir$[ebp], 0
	mov	ecx, 255				; 000000ffH
	xor	eax, eax
	lea	edi, DWORD PTR _dir$[ebp+1]
	rep stosd
	stosw
	stosb

; 73   : 	char loc[1024] = {0}; size_t sz_loc = 0;

	mov	BYTE PTR _loc$[ebp], 0
	mov	ecx, 255				; 000000ffH
	xor	eax, eax
	lea	edi, DWORD PTR _loc$[ebp+1]
	rep stosd
	stosw
	stosb
	mov	DWORD PTR _sz_loc$[ebp], 0

; 74   : 	struct stat fs = {0};

	mov	DWORD PTR _fs$[ebp], 0
	mov	ecx, 8
	xor	eax, eax
	lea	edi, DWORD PTR _fs$[ebp+4]
	rep stosd

; 75   : 
; 76   : 	/* Output help if applicable */
; 77   : 	if(options) DYNBUF_ADD_STR(html, "<center>");

	cmp	DWORD PTR _options$[ebp], 0
	je	SHORT $L70278
	push	0
	push	0
	push	8
	push	OFFSET FLAT:$SG70279
	mov	eax, DWORD PTR _html$[ebp]
	push	eax
	call	_dynbuf_add
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L70278
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29872], OFFSET FLAT:$SG70281
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 77		; 0000004dH
	jmp	$eva_err$70282
$L70278:

; 78   : 	if(options & 1) DYNBUF_ADD_STR(html,

	mov	eax, DWORD PTR _options$[ebp]
	and	eax, 1
	test	eax, eax
	je	SHORT $L70285

; 79   : 		"Cliquez sur le lien ci-dessous pour télécharger le fichier<br><br>"
; 80   : 		"<font size=-1>Si vous utilisez Internet Explorer, le fichier s'ouvrira dans une nouvelle fenêtre<br>"
; 81   : 		"Pour enregistrer le fichier sur votre ordinateur, cliquez avec le bouton de droite et choisissez Enregistrer la cible sous ...</font><br><br>");

	push	0
	push	0
	push	307					; 00000133H
	push	OFFSET FLAT:$SG70286
	mov	ecx, DWORD PTR _html$[ebp]
	push	ecx
	call	_dynbuf_add
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L70285
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29872], OFFSET FLAT:$SG70288
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 81		; 00000051H
	jmp	$eva_err$70282
$L70285:

; 82   : 
; 83   : 	/* Handle directories */
; 84   : 	if(fdir)

	cmp	DWORD PTR _fdir$[ebp], 0
	je	$L70289

; 86   : 		if(!strcmp("#user", fdir))

	mov	ecx, DWORD PTR _fdir$[ebp]
	push	ecx
	push	OFFSET FLAT:$SG70291
	call	_strcmp
	add	esp, 8
	test	eax, eax
	jne	SHORT $L70290

; 88   : 			sz_loc = snprintf(add_sz_str(loc), "/" DIRECTORY_DOCS "/%s/%s/", cntxt->dbname, dyntab_val(&cntxt->id_user, 0, 0));

	push	0
	push	0
	mov	edx, DWORD PTR _cntxt$[ebp]
	add	edx, 29408				; 000072e0H
	push	edx
	call	_dyntab_val
	add	esp, 12					; 0000000cH
	push	eax
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	ecx, DWORD PTR [eax+29804]
	push	ecx
	push	OFFSET FLAT:$SG70292
	push	1023					; 000003ffH
	lea	edx, DWORD PTR _loc$[ebp]
	push	edx
	call	__snprintf
	add	esp, 20					; 00000014H
	mov	DWORD PTR _sz_loc$[ebp], eax

; 90   : 		else if(!strcmp("#docs", fdir))

	jmp	SHORT $L70297
$L70290:
	mov	eax, DWORD PTR _fdir$[ebp]
	push	eax
	push	OFFSET FLAT:$SG70295
	call	_strcmp
	add	esp, 8
	test	eax, eax
	jne	SHORT $L70294

; 92   : 			sz_loc = snprintf(add_sz_str(loc), "/" DIRECTORY_DOCS "/%s/", cntxt->dbname);

	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	edx, DWORD PTR [ecx+29804]
	push	edx
	push	OFFSET FLAT:$SG70296
	push	1023					; 000003ffH
	lea	eax, DWORD PTR _loc$[ebp]
	push	eax
	call	__snprintf
	add	esp, 16					; 00000010H
	mov	DWORD PTR _sz_loc$[ebp], eax

; 94   : 		else

	jmp	SHORT $L70297
$L70294:

; 96   : 			sz_loc = snprintf(add_sz_str(loc), "/%s/", fdir);

	mov	ecx, DWORD PTR _fdir$[ebp]
	push	ecx
	push	OFFSET FLAT:$SG70298
	push	1023					; 000003ffH
	lea	edx, DWORD PTR _loc$[ebp]
	push	edx
	call	__snprintf
	add	esp, 16					; 00000010H
	mov	DWORD PTR _sz_loc$[ebp], eax
$L70297:

; 99   : 	else

	jmp	SHORT $L70299
$L70289:

; 101  : 		sz_loc = snprintf(add_sz_str(loc), "/");

	push	OFFSET FLAT:$SG70300
	push	1023					; 000003ffH
	lea	eax, DWORD PTR _loc$[ebp]
	push	eax
	call	__snprintf
	add	esp, 12					; 0000000cH
	mov	DWORD PTR _sz_loc$[ebp], eax
$L70299:

; 103  : 	snprintf(add_sz_str(path), "%s%s", dir, fname);

	mov	ecx, DWORD PTR _fname$[ebp]
	push	ecx
	lea	edx, DWORD PTR _dir$[ebp]
	push	edx
	push	OFFSET FLAT:$SG70301
	push	4095					; 00000fffH
	lea	eax, DWORD PTR _path$[ebp]
	push	eax
	call	__snprintf
	add	esp, 20					; 00000014H

; 104  : 
; 105  : 	/* Output title if present */
; 106  : 	if(title && *title && sz_title) DYNBUF_ADD(html, title, sz_title, NO_CONV);

	cmp	DWORD PTR _title$[ebp], 0
	je	SHORT $L70304
	mov	ecx, DWORD PTR _title$[ebp]
	movsx	edx, BYTE PTR [ecx]
	test	edx, edx
	je	SHORT $L70304
	cmp	DWORD PTR _sz_title$[ebp], 0
	je	SHORT $L70304
	push	0
	push	0
	mov	eax, DWORD PTR _sz_title$[ebp]
	push	eax
	mov	ecx, DWORD PTR _title$[ebp]
	push	ecx
	mov	edx, DWORD PTR _html$[ebp]
	push	edx
	call	_dynbuf_add
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L70304
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29872], OFFSET FLAT:$SG70306
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 106		; 0000006aH
	jmp	$eva_err$70282
$L70304:

; 107  : 
; 108  : 	/* Check file status */
; 109  : 	if(stat(path, &fs))

	lea	edx, DWORD PTR _fs$[ebp]
	push	edx
	lea	eax, DWORD PTR _path$[ebp]
	push	eax
	call	_stat
	add	esp, 8
	test	eax, eax
	je	SHORT $L70307

; 111  : 		DYNBUF_ADD3(html, "<font color=#FF0000><b>File not found</b> - <u>", name, sz_name, TO_HTML, "</u></font>");

	push	11					; 0000000bH
	push	OFFSET FLAT:$SG70309
	push	1
	push	OFFSET FLAT:_plain_to_html
	mov	ecx, DWORD PTR _sz_name$[ebp]
	push	ecx
	mov	edx, DWORD PTR _name$[ebp]
	push	edx
	push	47					; 0000002fH
	push	OFFSET FLAT:$SG70310
	mov	eax, DWORD PTR _html$[ebp]
	push	eax
	call	_dynbuf_add3
	add	esp, 36					; 00000024H
	test	eax, eax
	je	SHORT $L70308
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29872], OFFSET FLAT:$SG70312
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 111		; 0000006fH
	jmp	$eva_err$70282
$L70308:

; 112  : 		RETURN_OK;

	jmp	$eva_noerr$70313
$L70307:

; 114  : 	if(!fs.st_size)

	cmp	DWORD PTR _fs$[ebp+20], 0
	jne	SHORT $L70314

; 116  : 		DYNBUF_ADD3(html, "<font color=#FF0000><b>Empty file</b> - <u>", name, sz_name, TO_HTML, "</u></font>");

	push	11					; 0000000bH
	push	OFFSET FLAT:$SG70316
	push	1
	push	OFFSET FLAT:_plain_to_html
	mov	eax, DWORD PTR _sz_name$[ebp]
	push	eax
	mov	ecx, DWORD PTR _name$[ebp]
	push	ecx
	push	43					; 0000002bH
	push	OFFSET FLAT:$SG70317
	mov	edx, DWORD PTR _html$[ebp]
	push	edx
	call	_dynbuf_add3
	add	esp, 36					; 00000024H
	test	eax, eax
	je	SHORT $L70315
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29872], OFFSET FLAT:$SG70319
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 116		; 00000074H
	jmp	$eva_err$70282
$L70315:

; 117  : 		RETURN_OK;

	jmp	$eva_noerr$70313
$L70314:

; 119  : 
; 120  : 	/* Output link to file - always use a new window */
; 121  : 	DYNBUF_ADD_STR(html, "<a target=_blank");

	push	0
	push	0
	push	16					; 00000010H
	push	OFFSET FLAT:$SG70322
	mov	edx, DWORD PTR _html$[ebp]
	push	edx
	call	_dynbuf_add
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L70321
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29872], OFFSET FLAT:$SG70324
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 121		; 00000079H
	jmp	$eva_err$70282
$L70321:

; 122  : 
; 123  : 	/* Output notes if present */
; 124  : 	if(notes && *notes && sz_notes)

	cmp	DWORD PTR _notes$[ebp], 0
	je	$L70331
	mov	edx, DWORD PTR _notes$[ebp]
	movsx	eax, BYTE PTR [edx]
	test	eax, eax
	je	SHORT $L70331
	cmp	DWORD PTR _sz_notes$[ebp], 0
	je	SHORT $L70331

; 126  : 		DYNBUF_ADD3(html, " title='", notes, sz_notes, HTML_TOOLTIP, "'");

	push	1
	push	OFFSET FLAT:$SG70327
	push	1
	push	OFFSET FLAT:_html_tooltip
	mov	ecx, DWORD PTR _sz_notes$[ebp]
	push	ecx
	mov	edx, DWORD PTR _notes$[ebp]
	push	edx
	push	8
	push	OFFSET FLAT:$SG70328
	mov	eax, DWORD PTR _html$[ebp]
	push	eax
	call	_dynbuf_add3
	add	esp, 36					; 00000024H
	test	eax, eax
	je	SHORT $L70326
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29872], OFFSET FLAT:$SG70330
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 126		; 0000007eH
	jmp	$eva_err$70282
$L70326:

; 127  : 		if(put_showhelp(cntxt, html)) STACK_ERROR;

	mov	eax, DWORD PTR _html$[ebp]
	push	eax
	mov	ecx, DWORD PTR _cntxt$[ebp]
	push	ecx
	call	_put_showhelp
	add	esp, 8
	test	eax, eax
	je	SHORT $L70331
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 127		; 0000007fH
	jmp	$eva_err$70282
$L70331:

; 129  : 
; 130  : 	/* Output link reference & file name / size */
; 131  : 	DYNBUF_ADD3(html, " href='", loc, sz_loc, NO_CONV, "");

	push	0
	push	OFFSET FLAT:$SG70334
	push	0
	push	0
	mov	eax, DWORD PTR _sz_loc$[ebp]
	push	eax
	lea	ecx, DWORD PTR _loc$[ebp]
	push	ecx
	push	7
	push	OFFSET FLAT:$SG70335
	mov	edx, DWORD PTR _html$[ebp]
	push	edx
	call	_dynbuf_add3
	add	esp, 36					; 00000024H
	test	eax, eax
	je	SHORT $L70333
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29872], OFFSET FLAT:$SG70337
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 131		; 00000083H
	jmp	$eva_err$70282
$L70333:

; 132  : 	DYNBUF_ADD(html, fname, sz_fname, HTML_NO_QUOTE);

	push	1
	push	OFFSET FLAT:_no_quote
	mov	edx, DWORD PTR _sz_fname$[ebp]
	push	edx
	mov	eax, DWORD PTR _fname$[ebp]
	push	eax
	mov	ecx, DWORD PTR _html$[ebp]
	push	ecx
	call	_dynbuf_add
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L70338
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29872], OFFSET FLAT:$SG70340
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 132		; 00000084H
	jmp	$eva_err$70282
$L70338:

; 133  : 	DYNBUF_ADD3(html, "'>", name, sz_name, TO_HTML, "</a> - ");

	push	7
	push	OFFSET FLAT:$SG70342
	push	1
	push	OFFSET FLAT:_plain_to_html
	mov	ecx, DWORD PTR _sz_name$[ebp]
	push	ecx
	mov	edx, DWORD PTR _name$[ebp]
	push	edx
	push	2
	push	OFFSET FLAT:$SG70343
	mov	eax, DWORD PTR _html$[ebp]
	push	eax
	call	_dynbuf_add3
	add	esp, 36					; 00000024H
	test	eax, eax
	je	SHORT $L70341
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29872], OFFSET FLAT:$SG70345
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 133		; 00000085H
	jmp	$eva_err$70282
$L70341:

; 134  : 	DYNBUF_ADD(html, human_filesize(fs.st_size), 0, NO_CONV);

	push	0
	push	0
	push	0
	mov	eax, DWORD PTR _fs$[ebp+20]
	push	eax
	call	_human_filesize
	add	esp, 4
	push	eax
	mov	ecx, DWORD PTR _html$[ebp]
	push	ecx
	call	_dynbuf_add
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L70347
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29872], OFFSET FLAT:$SG70349
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 134		; 00000086H
	jmp	$eva_err$70282
$L70347:

; 135  : 
; 136  : 
; 137  : 	/* Zip result file if larger than 50k & output link to zip */
; 138  : 	if(fs.st_size > 50000L && options & 2)

	cmp	DWORD PTR _fs$[ebp+20], 50000		; 0000c350H
	jle	$L70370
	mov	ecx, DWORD PTR _options$[ebp]
	and	ecx, 2
	test	ecx, ecx
	je	$L70370

; 140  : 		char zipcmd[4096] = {0};

	mov	BYTE PTR _zipcmd$70351[ebp], 0
	mov	ecx, 1023				; 000003ffH
	xor	eax, eax
	lea	edi, DWORD PTR _zipcmd$70351[ebp+1]
	rep stosd
	stosw
	stosb

; 141  : 		char cwd[4096] = {0};

	mov	BYTE PTR _cwd$70352[ebp], 0
	mov	ecx, 1023				; 000003ffH
	xor	eax, eax
	lea	edi, DWORD PTR _cwd$70352[ebp+1]
	rep stosd
	stosw
	stosb

; 142  : 		char zipfile[4096] = {0};

	mov	BYTE PTR _zipfile$70353[ebp], 0
	mov	ecx, 1023				; 000003ffH
	xor	eax, eax
	lea	edi, DWORD PTR _zipfile$70353[ebp+1]
	rep stosd
	stosw
	stosb

; 143  : 		size_t sz_zipfile;
; 144  : 		getcwd(add_sz_str(cwd));

	push	4095					; 00000fffH
	lea	edx, DWORD PTR _cwd$70352[ebp]
	push	edx
	call	_getcwd
	add	esp, 8

; 145  : 		if(chdir_user_doc(cntxt)) STACK_ERROR;

	mov	eax, DWORD PTR _cntxt$[ebp]
	push	eax
	call	_chdir_user_doc
	add	esp, 4
	test	eax, eax
	je	SHORT $L70355
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 145		; 00000091H
	jmp	$eva_err$70282
$L70355:

; 146  : 		sz_zipfile = snprintf(add_sz_str(zipfile), "%s.zip", fname);

	mov	edx, DWORD PTR _fname$[ebp]
	push	edx
	push	OFFSET FLAT:$SG70356
	push	4095					; 00000fffH
	lea	eax, DWORD PTR _zipfile$70353[ebp]
	push	eax
	call	__snprintf
	add	esp, 16					; 00000010H
	mov	DWORD PTR _sz_zipfile$70354[ebp], eax

; 147  : 		snprintf(add_sz_str(zipcmd), "copy \"%s%s\" . > msg.txt 2>err.txt", dir, fname);

	mov	ecx, DWORD PTR _fname$[ebp]
	push	ecx
	lea	edx, DWORD PTR _dir$[ebp]
	push	edx
	push	OFFSET FLAT:$SG70357
	push	4095					; 00000fffH
	lea	eax, DWORD PTR _zipcmd$70351[ebp]
	push	eax
	call	__snprintf
	add	esp, 20					; 00000014H

; 148  : 		system(zipcmd);

	lea	ecx, DWORD PTR _zipcmd$70351[ebp]
	push	ecx
	call	_system
	add	esp, 4

; 149  : 		snprintf(add_sz_str(zipcmd), "%szip.exe -j -9 tmp.zip \"%s\" > msg.txt 2>err.txt", cntxt->path, fname);

	mov	edx, DWORD PTR _fname$[ebp]
	push	edx
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	ecx, DWORD PTR [eax+29728]
	push	ecx
	push	OFFSET FLAT:$SG70358
	push	4095					; 00000fffH
	lea	edx, DWORD PTR _zipcmd$70351[ebp]
	push	edx
	call	__snprintf
	add	esp, 20					; 00000014H

; 150  : 		remove("tmp.zip");

	push	OFFSET FLAT:$SG70359
	call	_remove
	add	esp, 4

; 151  : 		system(zipcmd);

	lea	eax, DWORD PTR _zipcmd$70351[ebp]
	push	eax
	call	_system
	add	esp, 4

; 152  : 		remove(zipfile);

	lea	ecx, DWORD PTR _zipfile$70353[ebp]
	push	ecx
	call	_remove
	add	esp, 4

; 153  : 		rename("tmp.zip", zipfile);

	lea	edx, DWORD PTR _zipfile$70353[ebp]
	push	edx
	push	OFFSET FLAT:$SG70360
	call	_rename
	add	esp, 8

; 154  : 		remove("err.txt");

	push	OFFSET FLAT:$SG70361
	call	_remove
	add	esp, 4

; 155  : 		remove("msg.txt");

	push	OFFSET FLAT:$SG70362
	call	_remove
	add	esp, 4

; 156  : 		if(*cwd) chdir(cwd);

	movsx	eax, BYTE PTR _cwd$70352[ebp]
	test	eax, eax
	je	SHORT $L70363
	lea	ecx, DWORD PTR _cwd$70352[ebp]
	push	ecx
	call	_chdir
	add	esp, 4
$L70363:

; 157  : 		if(file_output_link(cntxt, html,
; 158  : 								add_sz_str("<br><font size=-1>Ficher zippé : "),
; 159  : 								name, sz_name, zipfile, sz_zipfile,
; 160  : 								"#user",
; 161  : 								add_sz_str("Ce fichier est compressé pour réduire le temps de transfert"),
; 162  : 								NULL, 0, 0)) STACK_ERROR;

	push	0
	push	0
	push	0
	push	59					; 0000003bH
	push	OFFSET FLAT:$SG70366
	push	OFFSET FLAT:$SG70367
	mov	edx, DWORD PTR _sz_zipfile$70354[ebp]
	push	edx
	lea	eax, DWORD PTR _zipfile$70353[ebp]
	push	eax
	mov	ecx, DWORD PTR _sz_name$[ebp]
	push	ecx
	mov	edx, DWORD PTR _name$[ebp]
	push	edx
	push	33					; 00000021H
	push	OFFSET FLAT:$SG70368
	mov	eax, DWORD PTR _html$[ebp]
	push	eax
	mov	ecx, DWORD PTR _cntxt$[ebp]
	push	ecx
	call	_file_output_link
	add	esp, 56					; 00000038H
	test	eax, eax
	je	SHORT $L70365
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 162		; 000000a2H
	jmp	$eva_err$70282
$L70365:

; 163  : 		DYNBUF_ADD_STR(html, "</font>");

	push	0
	push	0
	push	7
	push	OFFSET FLAT:$SG70371
	mov	eax, DWORD PTR _html$[ebp]
	push	eax
	call	_dynbuf_add
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L70370
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29872], OFFSET FLAT:$SG70373
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 163		; 000000a3H
	jmp	$eva_err$70282
$L70370:

; 165  : 
; 166  : 	/* Output message */
; 167  : 	if(options) DYNBUF_ADD_STR(html, "<hr>");

	cmp	DWORD PTR _options$[ebp], 0
	je	SHORT $L70376
	push	0
	push	0
	push	4
	push	OFFSET FLAT:$SG70377
	mov	eax, DWORD PTR _html$[ebp]
	push	eax
	call	_dynbuf_add
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L70376
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29872], OFFSET FLAT:$SG70379
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 167		; 000000a7H
	jmp	$eva_err$70282
$L70376:

; 168  : 	if(msg && sz_msg) DYNBUF_ADD3(html, "</center>", msg, sz_msg, NO_CONV, "<hr><center>");

	cmp	DWORD PTR _msg$[ebp], 0
	je	SHORT $L70382
	cmp	DWORD PTR _sz_msg$[ebp], 0
	je	SHORT $L70382
	push	12					; 0000000cH
	push	OFFSET FLAT:$SG70383
	push	0
	push	0
	mov	eax, DWORD PTR _sz_msg$[ebp]
	push	eax
	mov	ecx, DWORD PTR _msg$[ebp]
	push	ecx
	push	9
	push	OFFSET FLAT:$SG70384
	mov	edx, DWORD PTR _html$[ebp]
	push	edx
	call	_dynbuf_add3
	add	esp, 36					; 00000024H
	test	eax, eax
	je	SHORT $L70382
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29872], OFFSET FLAT:$SG70386
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 168		; 000000a8H
	jmp	$eva_err$70282
$L70382:

; 169  : 
; 170  : 	/* Output return & close buttons */
; 171  : 	if(options & 12)

	mov	edx, DWORD PTR _options$[ebp]
	and	edx, 12					; 0000000cH
	test	edx, edx
	je	$L70387

; 173  : 		DynBuffer **h = cntxt->form->html;

	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	ecx, DWORD PTR [eax+80]
	mov	edx, DWORD PTR [ecx+232]
	mov	DWORD PTR _h$70388[ebp], edx

; 174  : 		cntxt->form->html = html;

	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	ecx, DWORD PTR [eax+80]
	mov	edx, DWORD PTR _html$[ebp]
	mov	DWORD PTR [ecx+232], edx

; 175  : 		DYNBUF_ADD_STR(html, "<br>");

	push	0
	push	0
	push	4
	push	OFFSET FLAT:$SG70391
	mov	eax, DWORD PTR _html$[ebp]
	push	eax
	call	_dynbuf_add
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L70390
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29872], OFFSET FLAT:$SG70393
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 175		; 000000afH
	jmp	$eva_err$70282
$L70390:

; 176  : 		if(options & 4 &&
; 177  : 			put_html_button(cntxt, "NOP", "Revenir à la fiche",
; 178  : 									"_eva_btn_gobackobj_fr.gif", "_eva_btn_gobackobj_fr_s.gif",
; 179  : 									"Retourne au formulaire de saisie", 0, 0)) CLEAR_ERROR;

	mov	eax, DWORD PTR _options$[ebp]
	and	eax, 4
	test	eax, eax
	je	SHORT $L70395
	push	0
	push	0
	push	0
	push	0
	push	0
	push	OFFSET FLAT:$SG70396
	push	OFFSET FLAT:$SG70397
	push	OFFSET FLAT:$SG70398
	push	OFFSET FLAT:$SG70399
	push	OFFSET FLAT:$SG70400
	mov	ecx, DWORD PTR _cntxt$[ebp]
	push	ecx
	call	_put_html_button_sz
	add	esp, 44					; 0000002cH
	test	eax, eax
	je	SHORT $L70395
	push	179					; 000000b3H
	push	OFFSET FLAT:$SG70401
	push	OFFSET FLAT:$SG70402
	mov	edx, DWORD PTR _cntxt$[ebp]
	push	edx
	call	_err_clear
	add	esp, 16					; 00000010H
$L70395:

; 180  : 		if((options & 12) == 12) DYNBUF_ADD_STR(html, "<img src=/img/_eva_nop.gif width=100 height=1>");

	mov	eax, DWORD PTR _options$[ebp]
	and	eax, 12					; 0000000cH
	cmp	eax, 12					; 0000000cH
	jne	SHORT $L70405
	push	0
	push	0
	push	46					; 0000002eH
	push	OFFSET FLAT:$SG70406
	mov	ecx, DWORD PTR _html$[ebp]
	push	ecx
	call	_dynbuf_add
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L70405
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29872], OFFSET FLAT:$SG70408
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 180		; 000000b4H
	jmp	$eva_err$70282
$L70405:

; 181  : 		if(options & 8 &&
; 182  : 			put_html_button(cntxt, "B$#.CLOSE", "Fermer", "_eva_btn_close_fr.gif", "_eva_btn_close_fr_s.gif",
; 183  : 							"Retourne au formulaire précédent", 0, 0)) STACK_ERROR;

	mov	ecx, DWORD PTR _options$[ebp]
	and	ecx, 8
	test	ecx, ecx
	je	SHORT $L70410
	push	0
	push	0
	push	0
	push	0
	push	0
	push	OFFSET FLAT:$SG70411
	push	OFFSET FLAT:$SG70412
	push	OFFSET FLAT:$SG70413
	push	OFFSET FLAT:$SG70414
	push	OFFSET FLAT:$SG70415
	mov	edx, DWORD PTR _cntxt$[ebp]
	push	edx
	call	_put_html_button_sz
	add	esp, 44					; 0000002cH
	test	eax, eax
	je	SHORT $L70410
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 183		; 000000b7H
	jmp	SHORT $eva_err$70282
$L70410:

; 184  : 		cntxt->form->html = h;

	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	edx, DWORD PTR [ecx+80]
	mov	eax, DWORD PTR _h$70388[ebp]
	mov	DWORD PTR [edx+232], eax
$L70387:

; 186  : 	if(options) DYNBUF_ADD_STR(html, "</center>");

	cmp	DWORD PTR _options$[ebp], 0
	je	SHORT $L70418
	push	0
	push	0
	push	9
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
	mov	DWORD PTR [eax+29900], 186		; 000000baH
	jmp	SHORT $eva_err$70282
$L70418:
$eva_noerr$70313:

; 187  : 
; 188  : 	RETURN_OK_CLEANUP;

	push	0
	push	OFFSET FLAT:$SG70422
	push	OFFSET FLAT:$SG70423
	mov	ecx, DWORD PTR _cntxt$[ebp]
	push	ecx
	call	_err_clear
	add	esp, 16					; 00000010H
$eva_err$70282:
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
	mov	eax, DWORD PTR _cntxt$[ebp]
	xor	ecx, ecx
	cmp	DWORD PTR [eax+29872], 0
	setne	cl
	mov	eax, ecx

; 189  : }

	pop	edi
	mov	esp, ebp
	pop	ebp
	ret	0
_file_output_link ENDP
_TEXT	ENDS
END
