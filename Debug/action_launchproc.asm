	TITLE	D:\Travail\ABI\EVA\V4.0\CGI\Brunix-2016\action_launchproc.c
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
PUBLIC	_office_launchproc
EXTRN	_fopen:NEAR
EXTRN	_fread:NEAR
EXTRN	_remove:NEAR
EXTRN	__snprintf:NEAR
EXTRN	_stat:NEAR
EXTRN	__chkstk:NEAR
EXTRN	_system:NEAR
EXTRN	_dynbuf_add:NEAR
EXTRN	_dyntab_val:NEAR
EXTRN	_strcmp:NEAR
EXTRN	_err_add_context:NEAR
EXTRN	_err_clear:NEAR
_DATA	SEGMENT
$SG70235 DB	'_EVA_EXCEL', 00H
	ORG $+1
$SG70236 DB	'EXCEL', 00H
	ORG $+2
$SG70237 DB	'_EVA_WORD', 00H
	ORG $+2
$SG70238 DB	'WINWORD', 00H
$SG70239 DB	'MSACCESS', 00H
	ORG $+3
$SG70240 DB	'%s\Office\%s.EXE', 00H
	ORG $+3
$SG70241 DB	'%stemplates\%s', 00H
	ORG $+1
$SG70244 DB	0aH, 'Fichier programme non trouv', 0e9H, ' : ', 00H
	ORG $+3
$SG70246 DB	'Impossible de lancer le traitement', 00H
	ORG $+1
$SG70250 DB	0aH, 'Fichier mod', 0e8H, 'le non trouv', 0e9H, ' : ', 00H
	ORG $+2
$SG70252 DB	'(null)', 00H
	ORG $+1
$SG70253 DB	'Impossible de lancer le traitement', 00H
	ORG $+1
$SG70254 DB	'COPY %s . >exe.txt 2>exeerr.txt', 00H
$SG70258 DB	'Erreur la pr', 0e9H, 'paration du traitement (copie proc'
	DB	0e9H, 'dure)', 00H
	ORG $+2
$SG70259 DB	'call "%s" "%s" >exe.txt 2>exeerr.txt', 00H
	ORG $+3
$SG70262 DB	'exe.txt', 00H
$SG70263 DB	'exeerr.txt', 00H
	ORG $+1
$SG70265 DB	'r', 00H
	ORG $+2
$SG70266 DB	'exe.txt', 00H
$SG70270 DB	0aH, 'exe : ', 00H
$SG70276 DB	'r', 00H
	ORG $+2
$SG70277 DB	'exeerr.txt', 00H
	ORG $+1
$SG70281 DB	0aH, 'exeerr : ', 00H
	ORG $+1
$SG70286 DB	'Erreur lors de l''appel du traitement', 00H
	ORG $+3
$SG70287 DB	'exe.txt', 00H
$SG70288 DB	'exeerr.txt', 00H
	ORG $+1
$SG70290 DB	'D:\Travail\ABI\EVA\V4.0\CGI\Brunix-2016\action_launchpro'
	DB	'c.c', 00H
$SG70291 DB	'office_launchproc', 00H
	ORG $+2
$SG70293 DB	'D:\Travail\ABI\EVA\V4.0\CGI\Brunix-2016\action_launchpro'
	DB	'c.c', 00H
$SG70294 DB	'office_launchproc', 00H
_DATA	ENDS
_TEXT	SEGMENT
_cntxt$ = 8
_proctyp$ = 12
_procname$ = 16
_fs$ = -36
_exepath$ = -1060
_filename$ = -1316
_cmd$ = -3364
_f$70264 = -4392
_buf$70267 = -4388
_sz$70268 = -4396
_f$70275 = -5424
_buf$70278 = -5420
_sz$70279 = -5428
_office_launchproc PROC NEAR

; 32   : ){

	push	ebp
	mov	ebp, esp
	mov	eax, 5448				; 00001548H
	call	__chkstk
	push	edi

; 33   : 	struct stat fs = {0};

	mov	DWORD PTR _fs$[ebp], 0
	mov	ecx, 8
	xor	eax, eax
	lea	edi, DWORD PTR _fs$[ebp+4]
	rep stosd

; 34   : 	char exepath[1024] = {0};

	mov	BYTE PTR _exepath$[ebp], 0
	mov	ecx, 255				; 000000ffH
	xor	eax, eax
	lea	edi, DWORD PTR _exepath$[ebp+1]
	rep stosd
	stosw
	stosb

; 35   : 	char filename[256] = {0};

	mov	BYTE PTR _filename$[ebp], 0
	mov	ecx, 63					; 0000003fH
	xor	eax, eax
	lea	edi, DWORD PTR _filename$[ebp+1]
	rep stosd
	stosw
	stosb

; 36   : 	char cmd[2048] = {0};

	mov	BYTE PTR _cmd$[ebp], 0
	mov	ecx, 511				; 000001ffH
	xor	eax, eax
	lea	edi, DWORD PTR _cmd$[ebp+1]
	rep stosd
	stosw
	stosb

; 37   : 
; 38   : 	/* Prepare executable & file path */
; 39   : 	snprintf(add_sz_str(exepath),  "%s\\Office\\%s.EXE", dyntab_val(&cntxt->cnf_server, 0, 0),
; 40   : 												!strcmp(proctyp, "_EVA_EXCEL") ? "EXCEL" :
; 41   : 												!strcmp(proctyp, "_EVA_WORD") ? "WINWORD" : "MSACCESS");

	push	OFFSET FLAT:$SG70235
	mov	eax, DWORD PTR _proctyp$[ebp]
	push	eax
	call	_strcmp
	add	esp, 8
	test	eax, eax
	jne	SHORT $L71175
	mov	DWORD PTR -5432+[ebp], OFFSET FLAT:$SG70236
	jmp	SHORT $L71176
$L71175:
	push	OFFSET FLAT:$SG70237
	mov	ecx, DWORD PTR _proctyp$[ebp]
	push	ecx
	call	_strcmp
	add	esp, 8
	test	eax, eax
	jne	SHORT $L71173
	mov	DWORD PTR -5436+[ebp], OFFSET FLAT:$SG70238
	jmp	SHORT $L71174
$L71173:
	mov	DWORD PTR -5436+[ebp], OFFSET FLAT:$SG70239
$L71174:
	mov	edx, DWORD PTR -5436+[ebp]
	mov	DWORD PTR -5432+[ebp], edx
$L71176:
	mov	eax, DWORD PTR -5432+[ebp]
	push	eax
	push	0
	push	0
	mov	ecx, DWORD PTR _cntxt$[ebp]
	add	ecx, 29380				; 000072c4H
	push	ecx
	call	_dyntab_val
	add	esp, 12					; 0000000cH
	push	eax
	push	OFFSET FLAT:$SG70240
	push	1023					; 000003ffH
	lea	edx, DWORD PTR _exepath$[ebp]
	push	edx
	call	__snprintf
	add	esp, 20					; 00000014H

; 42   : 	snprintf(add_sz_str(filename), "%stemplates\\%s", cntxt->rootdir, procname);

	mov	eax, DWORD PTR _procname$[ebp]
	push	eax
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	edx, DWORD PTR [ecx+29724]
	push	edx
	push	OFFSET FLAT:$SG70241
	push	255					; 000000ffH
	lea	eax, DWORD PTR _filename$[ebp]
	push	eax
	call	__snprintf
	add	esp, 20					; 00000014H

; 43   : 	if(stat(exepath, &fs)) RETURN_ERROR("Impossible de lancer le traitement", ERR_PUT_TXT("\nFichier programme non trouvé : ", exepath, 0));

	lea	ecx, DWORD PTR _fs$[ebp]
	push	ecx
	lea	edx, DWORD PTR _exepath$[ebp]
	push	edx
	call	_stat
	add	esp, 8
	test	eax, eax
	je	SHORT $L70242
	push	0
	push	0
	push	32					; 00000020H
	push	OFFSET FLAT:$SG70244
	mov	eax, DWORD PTR _cntxt$[ebp]
	add	eax, 29876				; 000074b4H
	push	eax
	call	_dynbuf_add
	add	esp, 20					; 00000014H
	push	0
	push	0
	push	0
	lea	ecx, DWORD PTR _exepath$[ebp]
	push	ecx
	mov	edx, DWORD PTR _cntxt$[ebp]
	add	edx, 29876				; 000074b4H
	push	edx
	call	_dynbuf_add
	add	esp, 20					; 00000014H
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29872], OFFSET FLAT:$SG70246
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 43		; 0000002bH
	jmp	$eva_err$70247
$L70242:

; 44   : 	if(stat(filename, &fs)) RETURN_ERROR("Impossible de lancer le traitement", ERR_PUT_TXT("\nFichier modèle non trouvé : ", procname ? procname : "(null)", 0));

	lea	edx, DWORD PTR _fs$[ebp]
	push	edx
	lea	eax, DWORD PTR _filename$[ebp]
	push	eax
	call	_stat
	add	esp, 8
	test	eax, eax
	je	SHORT $L70248
	push	0
	push	0
	push	29					; 0000001dH
	push	OFFSET FLAT:$SG70250
	mov	ecx, DWORD PTR _cntxt$[ebp]
	add	ecx, 29876				; 000074b4H
	push	ecx
	call	_dynbuf_add
	add	esp, 20					; 00000014H
	cmp	DWORD PTR _procname$[ebp], 0
	je	SHORT $L71177
	mov	edx, DWORD PTR _procname$[ebp]
	mov	DWORD PTR -5440+[ebp], edx
	jmp	SHORT $L71178
$L71177:
	mov	DWORD PTR -5440+[ebp], OFFSET FLAT:$SG70252
$L71178:
	push	0
	push	0
	push	0
	mov	eax, DWORD PTR -5440+[ebp]
	push	eax
	mov	ecx, DWORD PTR _cntxt$[ebp]
	add	ecx, 29876				; 000074b4H
	push	ecx
	call	_dynbuf_add
	add	esp, 20					; 00000014H
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29872], OFFSET FLAT:$SG70253
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 44		; 0000002cH
	jmp	$eva_err$70247
$L70248:

; 45   : 
; 46   : 	/* Copy template & launch office program */
; 47   : 	snprintf(add_sz_str(cmd), "COPY %s . >exe.txt 2>exeerr.txt", filename);

	lea	ecx, DWORD PTR _filename$[ebp]
	push	ecx
	push	OFFSET FLAT:$SG70254
	push	2047					; 000007ffH
	lea	edx, DWORD PTR _cmd$[ebp]
	push	edx
	call	__snprintf
	add	esp, 16					; 00000010H

; 48   : 	if(system(cmd) == -1 || stat(filename, &fs))

	lea	eax, DWORD PTR _cmd$[ebp]
	push	eax
	call	_system
	add	esp, 4
	cmp	eax, -1
	je	SHORT $L70256
	lea	ecx, DWORD PTR _fs$[ebp]
	push	ecx
	lea	edx, DWORD PTR _filename$[ebp]
	push	edx
	call	_stat
	add	esp, 8
	test	eax, eax
	je	SHORT $L70255
$L70256:

; 49   : 		RETURN_ERROR("Erreur la préparation du traitement (copie procédure)", NOP);

	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29872], OFFSET FLAT:$SG70258
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 49		; 00000031H
	jmp	$eva_err$70247
$L70255:

; 50   : 	snprintf(cmd, sizeof(cmd)-1, "call \"%s\" \"%s\" >exe.txt 2>exeerr.txt", exepath, procname);

	mov	edx, DWORD PTR _procname$[ebp]
	push	edx
	lea	eax, DWORD PTR _exepath$[ebp]
	push	eax
	push	OFFSET FLAT:$SG70259
	push	2047					; 000007ffH
	lea	ecx, DWORD PTR _cmd$[ebp]
	push	ecx
	call	__snprintf
	add	esp, 20					; 00000014H

; 51   : 	if(system(cmd) == -1 || stat("exe.txt", &fs) || stat("exeerr.txt", &fs) || fs.st_size > 0)

	lea	edx, DWORD PTR _cmd$[ebp]
	push	edx
	call	_system
	add	esp, 4
	cmp	eax, -1
	je	SHORT $L70261
	lea	eax, DWORD PTR _fs$[ebp]
	push	eax
	push	OFFSET FLAT:$SG70262
	call	_stat
	add	esp, 8
	test	eax, eax
	jne	SHORT $L70261
	lea	ecx, DWORD PTR _fs$[ebp]
	push	ecx
	push	OFFSET FLAT:$SG70263
	call	_stat
	add	esp, 8
	test	eax, eax
	jne	SHORT $L70261
	cmp	DWORD PTR _fs$[ebp+20], 0
	jle	$L70260
$L70261:

; 52   : 		RETURN_ERROR("Erreur lors de l'appel du traitement", { ERR_PUT_FILE("\nexe : ", "exe.txt"); ERR_PUT_FILE("\nexeerr : ", "exeerr.txt"); });

	push	OFFSET FLAT:$SG70265
	push	OFFSET FLAT:$SG70266
	call	_fopen
	add	esp, 8
	mov	DWORD PTR _f$70264[ebp], eax
	cmp	DWORD PTR _f$70264[ebp], 0
	je	SHORT $L71179
	mov	edx, DWORD PTR _f$70264[ebp]
	push	edx
	push	1024					; 00000400H
	push	1
	lea	eax, DWORD PTR _buf$70267[ebp]
	push	eax
	call	_fread
	add	esp, 16					; 00000010H
	mov	DWORD PTR -5444+[ebp], eax
	jmp	SHORT $L71180
$L71179:
	mov	DWORD PTR -5444+[ebp], 0
$L71180:
	mov	ecx, DWORD PTR -5444+[ebp]
	mov	DWORD PTR _sz$70268[ebp], ecx
	push	0
	push	0
	push	7
	push	OFFSET FLAT:$SG70270
	mov	edx, DWORD PTR _cntxt$[ebp]
	add	edx, 29876				; 000074b4H
	push	edx
	call	_dynbuf_add
	add	esp, 20					; 00000014H
$L70272:
	cmp	DWORD PTR _sz$70268[ebp], 0
	je	SHORT $L70273
	push	0
	push	0
	mov	eax, DWORD PTR _sz$70268[ebp]
	push	eax
	lea	ecx, DWORD PTR _buf$70267[ebp]
	push	ecx
	mov	edx, DWORD PTR _cntxt$[ebp]
	add	edx, 29876				; 000074b4H
	push	edx
	call	_dynbuf_add
	add	esp, 20					; 00000014H
	mov	eax, DWORD PTR _f$70264[ebp]
	push	eax
	push	1024					; 00000400H
	push	1
	lea	ecx, DWORD PTR _buf$70267[ebp]
	push	ecx
	call	_fread
	add	esp, 16					; 00000010H
	mov	DWORD PTR _sz$70268[ebp], eax
	jmp	SHORT $L70272
$L70273:
	push	OFFSET FLAT:$SG70276
	push	OFFSET FLAT:$SG70277
	call	_fopen
	add	esp, 8
	mov	DWORD PTR _f$70275[ebp], eax
	cmp	DWORD PTR _f$70275[ebp], 0
	je	SHORT $L71181
	mov	edx, DWORD PTR _f$70275[ebp]
	push	edx
	push	1024					; 00000400H
	push	1
	lea	eax, DWORD PTR _buf$70278[ebp]
	push	eax
	call	_fread
	add	esp, 16					; 00000010H
	mov	DWORD PTR -5448+[ebp], eax
	jmp	SHORT $L71182
$L71181:
	mov	DWORD PTR -5448+[ebp], 0
$L71182:
	mov	ecx, DWORD PTR -5448+[ebp]
	mov	DWORD PTR _sz$70279[ebp], ecx
	push	0
	push	0
	push	10					; 0000000aH
	push	OFFSET FLAT:$SG70281
	mov	edx, DWORD PTR _cntxt$[ebp]
	add	edx, 29876				; 000074b4H
	push	edx
	call	_dynbuf_add
	add	esp, 20					; 00000014H
$L70283:
	cmp	DWORD PTR _sz$70279[ebp], 0
	je	SHORT $L70284
	push	0
	push	0
	mov	eax, DWORD PTR _sz$70279[ebp]
	push	eax
	lea	ecx, DWORD PTR _buf$70278[ebp]
	push	ecx
	mov	edx, DWORD PTR _cntxt$[ebp]
	add	edx, 29876				; 000074b4H
	push	edx
	call	_dynbuf_add
	add	esp, 20					; 00000014H
	mov	eax, DWORD PTR _f$70275[ebp]
	push	eax
	push	1024					; 00000400H
	push	1
	lea	ecx, DWORD PTR _buf$70278[ebp]
	push	ecx
	call	_fread
	add	esp, 16					; 00000010H
	mov	DWORD PTR _sz$70279[ebp], eax
	jmp	SHORT $L70283
$L70284:
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29872], OFFSET FLAT:$SG70286
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 52		; 00000034H
	jmp	SHORT $eva_err$70247
$L70260:

; 53   : 	remove("exe.txt");

	push	OFFSET FLAT:$SG70287
	call	_remove
	add	esp, 4

; 54   : 	remove("exeerr.txt");

	push	OFFSET FLAT:$SG70288
	call	_remove
	add	esp, 4
$eva_noerr$70289:

; 55   : 
; 56   : 	RETURN_OK_CLEANUP;

	push	0
	push	OFFSET FLAT:$SG70290
	push	OFFSET FLAT:$SG70291
	mov	ecx, DWORD PTR _cntxt$[ebp]
	push	ecx
	call	_err_clear
	add	esp, 16					; 00000010H
$eva_err$70247:
	mov	edx, DWORD PTR _cntxt$[ebp]
	cmp	DWORD PTR [edx+29872], 0
	je	SHORT $L70292
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	ecx, DWORD PTR [eax+29900]
	push	ecx
	push	OFFSET FLAT:$SG70293
	push	OFFSET FLAT:$SG70294
	mov	edx, DWORD PTR _cntxt$[ebp]
	push	edx
	call	_err_add_context
	add	esp, 16					; 00000010H
$L70292:
	mov	eax, DWORD PTR _cntxt$[ebp]
	xor	ecx, ecx
	cmp	DWORD PTR [eax+29872], 0
	setne	cl
	mov	eax, ecx

; 57   : }

	pop	edi
	mov	esp, ebp
	pop	ebp
	ret	0
_office_launchproc ENDP
_TEXT	ENDS
PUBLIC	_proc_output_params
EXTRN	_ctrl_eval_valtyp:NEAR
EXTRN	_datetxt_to_format:NEAR
EXTRN	_table_read_controls:NEAR
EXTRN	_number_to_format:NEAR
EXTRN	_fprintf:NEAR
EXTRN	_table_init_obj_list:NEAR
EXTRN	_table_sort_obj_list:NEAR
EXTRN	_table_read_obj_list:NEAR
EXTRN	_table_prepare_rows:NEAR
EXTRN	_file_write_tabrc:NEAR
EXTRN	_form_free_ctrl:NEAR
EXTRN	_mem_free:NEAR
EXTRN	_strtoul:NEAR
EXTRN	_qry_obj_idfield:NEAR
EXTRN	_export_tabrc:BYTE
EXTRN	_qry_obj_field:NEAR
EXTRN	_ctrl_output_exprval:NEAR
EXTRN	_ctrl_read_baseobj:NEAR
EXTRN	_dyntab_free:NEAR
EXTRN	_ctrl_set_common_attr:NEAR
EXTRN	_dyntab_sz:NEAR
EXTRN	_dyntab_cell:NEAR
EXTRN	_qry_cache_idobj_field:NEAR
EXTRN	_dyntab_copy:NEAR
EXTRN	_qry_build_free:NEAR
EXTRN	_dyntab_txt_cmp:NEAR
EXTRN	_qry_add_filter_forms:NEAR
EXTRN	_dyntab_filter_field:NEAR
EXTRN	_qry_filter_objects:NEAR
EXTRN	_dyntab_order_lines:NEAR
EXTRN	_dyntab_group:NEAR
_BSS	SEGMENT
$SG70502 DB	01H DUP (?)
	ALIGN	4

$SG70508 DB	01H DUP (?)
	ALIGN	4

$SG70514 DB	01H DUP (?)
	ALIGN	4

$SG70518 DB	01H DUP (?)
	ALIGN	4

$SG70534 DB	01H DUP (?)
	ALIGN	4

$SG70554 DB	01H DUP (?)
	ALIGN	4

$SG70584 DB	01H DUP (?)
_BSS	ENDS
_DATA	SEGMENT
	ORG $+2
$SG70331 DB	'_EVA_SYMBOL', 00H
$SG70333 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70337 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70340 DB	'_EVA_VAR_TYPE', 00H
	ORG $+2
$SG70342 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70345 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70348 DB	'_EVA_VAR_VALUE', 00H
	ORG $+1
$SG70350 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70353 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70356 DB	'_EVA_VAR_OBJTYPE', 00H
	ORG $+3
$SG70358 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70361 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70364 DB	'_EVA_VALOBJ', 00H
$SG70366 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70369 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70372 DB	'_EVA_VAR_FIELDEXPR', 00H
	ORG $+1
$SG70374 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70377 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70380 DB	'_EVA_INPUTOBJ', 00H
	ORG $+2
$SG70382 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70385 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70388 DB	'_EVA_CALCOBJ', 00H
	ORG $+3
$SG70390 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70393 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70396 DB	'_EVA_DATAOBJ', 00H
	ORG $+3
$SG70398 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70401 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70404 DB	'_EVA_FILTEROBJ', 00H
	ORG $+1
$SG70406 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70409 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70412 DB	'_EVA_TABLEOBJ', 00H
	ORG $+2
$SG70414 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70417 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70420 DB	'_EVA_USE_MULTIPLE', 00H
	ORG $+2
$SG70422 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70425 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70426 DB	0aH, 00H
	ORG $+2
$SG70431 DB	'%s', 09H, '%s', 09H, 00H
	ORG $+1
$SG70433 DB	'_EVA_VALUE', 00H
	ORG $+1
$SG70437 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70439 DB	'%s', 00H
	ORG $+1
$SG70443 DB	'_EVA_FIELDVAL', 00H
	ORG $+2
$SG70444 DB	'_EVA_SQLEXPR', 00H
	ORG $+3
$SG70450 DB	'_EVA_CURRENTOBJ', 00H
$SG70453 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70455 DB	'_EVA_FIELDVAL', 00H
	ORG $+2
$SG70460 DB	'_EVA_FORMAT', 00H
$SG70463 DB	'_EVA_DATE', 00H
	ORG $+2
$SG70466 DB	'_EVA_NUMBER', 00H
$SG70470 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70474 DB	'LINES', 00H
	ORG $+2
$SG70475 DB	'COMMA', 00H
	ORG $+2
$SG70476 DB	'SPACE', 00H
	ORG $+2
$SG70487 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70493 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70498 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70500 DB	'LINES', 00H
	ORG $+2
$SG70501 DB	'<RC>', 00H
	ORG $+3
$SG70503 DB	'%s%s', 00H
	ORG $+3
$SG70506 DB	'COMMA', 00H
	ORG $+2
$SG70507 DB	', ', 00H
	ORG $+1
$SG70509 DB	'%s''%s''', 00H
	ORG $+1
$SG70512 DB	'SPACE', 00H
	ORG $+2
$SG70513 DB	' ', 00H
	ORG $+2
$SG70515 DB	'%s''%s''', 00H
	ORG $+1
$SG70517 DB	0aH, 09H, 09H, 00H
$SG70519 DB	'%s%s', 09H, '%lu', 09H, '%lu', 00H
	ORG $+3
$SG70522 DB	'_EVA_CALC', 00H
	ORG $+2
$SG70533 DB	0aH, 09H, 09H, 00H
$SG70535 DB	'%s%s', 09H, '%lu', 09H, '%lu', 00H
	ORG $+3
$SG70538 DB	'_EVA_LISTOBJ', 00H
	ORG $+3
$SG70544 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70553 DB	0aH, 09H, 09H, 00H
$SG70555 DB	'%s%s', 09H, '%lu', 09H, '%lu', 00H
	ORG $+3
$SG70558 DB	'_EVA_DATATABLE', 00H
	ORG $+1
$SG70579 DB	'%lu.txt', 00H
$SG70586 DB	'%s', 00H
	ORG $+1
$SG70588 DB	0aH, 00H
	ORG $+2
$SG70590 DB	'D:\Travail\ABI\EVA\V4.0\CGI\Brunix-2016\action_launchpro'
	DB	'c.c', 00H
$SG70591 DB	'proc_output_params', 00H
	ORG $+1
$SG70593 DB	'D:\Travail\ABI\EVA\V4.0\CGI\Brunix-2016\action_launchpro'
	DB	'c.c', 00H
$SG70594 DB	'proc_output_params', 00H
_DATA	ENDS
_TEXT	SEGMENT
_cntxt$ = 8
_i_ctrl$ = 12
_f$ = 16
_form$ = -44
_ctrl$ = -4776
_symbol$ = -128
_vartype$ = -148
_varval$ = -4772
_objtype$ = -4712
_listobj$ = -20
_fieldexpr$ = -4752
_inputobj$ = -216
_calcobj$ = -4732
_dataobj$ = -4796
_tableobj$ = -188
_filterobj$ = -108
_valmult$ = -40
_field$ = -88
_format$ = -168
_obj$ = -4692
_data$ = -68
_buf$ = -48
_flt$ = -4672
_i$ = -192
_j$ = -196
_typ$70430 = -4800
_b_date$70445 = -4816
_b_num$70446 = -4804
_vmult$70447 = -4808
_objtyp$70448 = -4812
_idobj$70456 = -4820
_c$70480 = -4824
_date$70483 = -4888
__c$70495 = -4892
_ctl$70523 = -4896
_c$70532 = -4900
_c$70551 = -4904
_lstctrl$70559 = -4988
_tbl$70561 = -4976
_ictrl$70563 = -4980
_idctrl$70564 = -4972
_b_selobj$70566 = -4984
_fname$70567 = -4968
_proc_output_params PROC NEAR

; 88   : ){

	push	ebp
	mov	ebp, esp
	mov	eax, 5012				; 00001394H
	call	__chkstk
	push	edi

; 89   : 	EVA_form *form = cntxt->form;

	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	ecx, DWORD PTR [eax+80]
	mov	DWORD PTR _form$[ebp], ecx

; 90   : 	EVA_ctrl *ctrl = form->ctrl + i_ctrl;

	mov	edx, DWORD PTR _i_ctrl$[ebp]
	imul	edx, 480				; 000001e0H
	mov	eax, DWORD PTR _form$[ebp]
	mov	ecx, DWORD PTR [eax]
	add	ecx, edx
	mov	DWORD PTR _ctrl$[ebp], ecx

; 91   : 	DynTable symbol = { 0 };

	mov	DWORD PTR _symbol$[ebp], 0
	xor	edx, edx
	mov	DWORD PTR _symbol$[ebp+4], edx
	mov	DWORD PTR _symbol$[ebp+8], edx
	mov	DWORD PTR _symbol$[ebp+12], edx
	mov	DWORD PTR _symbol$[ebp+16], edx

; 92   : 	DynTable vartype = { 0 };

	mov	DWORD PTR _vartype$[ebp], 0
	xor	eax, eax
	mov	DWORD PTR _vartype$[ebp+4], eax
	mov	DWORD PTR _vartype$[ebp+8], eax
	mov	DWORD PTR _vartype$[ebp+12], eax
	mov	DWORD PTR _vartype$[ebp+16], eax

; 93   : 	DynTable varval = { 0 };

	mov	DWORD PTR _varval$[ebp], 0
	xor	ecx, ecx
	mov	DWORD PTR _varval$[ebp+4], ecx
	mov	DWORD PTR _varval$[ebp+8], ecx
	mov	DWORD PTR _varval$[ebp+12], ecx
	mov	DWORD PTR _varval$[ebp+16], ecx

; 94   : 	DynTable objtype = { 0 };

	mov	DWORD PTR _objtype$[ebp], 0
	xor	edx, edx
	mov	DWORD PTR _objtype$[ebp+4], edx
	mov	DWORD PTR _objtype$[ebp+8], edx
	mov	DWORD PTR _objtype$[ebp+12], edx
	mov	DWORD PTR _objtype$[ebp+16], edx

; 95   : 	DynTable listobj = { 0 };

	mov	DWORD PTR _listobj$[ebp], 0
	xor	eax, eax
	mov	DWORD PTR _listobj$[ebp+4], eax
	mov	DWORD PTR _listobj$[ebp+8], eax
	mov	DWORD PTR _listobj$[ebp+12], eax
	mov	DWORD PTR _listobj$[ebp+16], eax

; 96   : 	DynTable fieldexpr = { 0 };

	mov	DWORD PTR _fieldexpr$[ebp], 0
	xor	ecx, ecx
	mov	DWORD PTR _fieldexpr$[ebp+4], ecx
	mov	DWORD PTR _fieldexpr$[ebp+8], ecx
	mov	DWORD PTR _fieldexpr$[ebp+12], ecx
	mov	DWORD PTR _fieldexpr$[ebp+16], ecx

; 97   : 	DynTable inputobj = { 0 };

	mov	DWORD PTR _inputobj$[ebp], 0
	xor	edx, edx
	mov	DWORD PTR _inputobj$[ebp+4], edx
	mov	DWORD PTR _inputobj$[ebp+8], edx
	mov	DWORD PTR _inputobj$[ebp+12], edx
	mov	DWORD PTR _inputobj$[ebp+16], edx

; 98   : 	DynTable calcobj = { 0 };

	mov	DWORD PTR _calcobj$[ebp], 0
	xor	eax, eax
	mov	DWORD PTR _calcobj$[ebp+4], eax
	mov	DWORD PTR _calcobj$[ebp+8], eax
	mov	DWORD PTR _calcobj$[ebp+12], eax
	mov	DWORD PTR _calcobj$[ebp+16], eax

; 99   : 	DynTable dataobj = { 0 };

	mov	DWORD PTR _dataobj$[ebp], 0
	xor	ecx, ecx
	mov	DWORD PTR _dataobj$[ebp+4], ecx
	mov	DWORD PTR _dataobj$[ebp+8], ecx
	mov	DWORD PTR _dataobj$[ebp+12], ecx
	mov	DWORD PTR _dataobj$[ebp+16], ecx

; 100  : 	DynTable tableobj = { 0 };

	mov	DWORD PTR _tableobj$[ebp], 0
	xor	edx, edx
	mov	DWORD PTR _tableobj$[ebp+4], edx
	mov	DWORD PTR _tableobj$[ebp+8], edx
	mov	DWORD PTR _tableobj$[ebp+12], edx
	mov	DWORD PTR _tableobj$[ebp+16], edx

; 101  : 	DynTable filterobj = { 0 };

	mov	DWORD PTR _filterobj$[ebp], 0
	xor	eax, eax
	mov	DWORD PTR _filterobj$[ebp+4], eax
	mov	DWORD PTR _filterobj$[ebp+8], eax
	mov	DWORD PTR _filterobj$[ebp+12], eax
	mov	DWORD PTR _filterobj$[ebp+16], eax

; 102  : 	DynTable valmult = { 0 };

	mov	DWORD PTR _valmult$[ebp], 0
	xor	ecx, ecx
	mov	DWORD PTR _valmult$[ebp+4], ecx
	mov	DWORD PTR _valmult$[ebp+8], ecx
	mov	DWORD PTR _valmult$[ebp+12], ecx
	mov	DWORD PTR _valmult$[ebp+16], ecx

; 103  : 	DynTable field = { 0 };

	mov	DWORD PTR _field$[ebp], 0
	xor	edx, edx
	mov	DWORD PTR _field$[ebp+4], edx
	mov	DWORD PTR _field$[ebp+8], edx
	mov	DWORD PTR _field$[ebp+12], edx
	mov	DWORD PTR _field$[ebp+16], edx

; 104  : 	DynTable format = { 0 };

	mov	DWORD PTR _format$[ebp], 0
	xor	eax, eax
	mov	DWORD PTR _format$[ebp+4], eax
	mov	DWORD PTR _format$[ebp+8], eax
	mov	DWORD PTR _format$[ebp+12], eax
	mov	DWORD PTR _format$[ebp+16], eax

; 105  : 	DynTable obj = { 0 };

	mov	DWORD PTR _obj$[ebp], 0
	xor	ecx, ecx
	mov	DWORD PTR _obj$[ebp+4], ecx
	mov	DWORD PTR _obj$[ebp+8], ecx
	mov	DWORD PTR _obj$[ebp+12], ecx
	mov	DWORD PTR _obj$[ebp+16], ecx

; 106  : 	DynTable data = { 0 };

	mov	DWORD PTR _data$[ebp], 0
	xor	edx, edx
	mov	DWORD PTR _data$[ebp+4], edx
	mov	DWORD PTR _data$[ebp+8], edx
	mov	DWORD PTR _data$[ebp+12], edx
	mov	DWORD PTR _data$[ebp+16], edx

; 107  : 	DynBuffer *buf = NULL;

	mov	DWORD PTR _buf$[ebp], 0

; 108  : 	QryBuild flt = {{0}};

	mov	DWORD PTR _flt$[ebp], 0
	xor	eax, eax
	mov	DWORD PTR _flt$[ebp+4], eax
	mov	DWORD PTR _flt$[ebp+8], eax
	mov	DWORD PTR _flt$[ebp+12], eax
	mov	DWORD PTR _flt$[ebp+16], eax
	mov	ecx, 1109				; 00000455H
	xor	eax, eax
	lea	edi, DWORD PTR _flt$[ebp+20]
	rep stosd

; 109  : 	unsigned long i, j;
; 110  : 
; 111  : 	/* Read params definition */
; 112  : 	CTRL_ATTR_TAB(symbol, SYMBOL);

	lea	ecx, DWORD PTR _symbol$[ebp]
	push	ecx
	call	_dyntab_free
	add	esp, 4
	push	0
	push	-1
	push	OFFSET FLAT:$SG70331
	mov	edx, DWORD PTR _ctrl$[ebp]
	add	edx, 44					; 0000002cH
	push	edx
	push	0
	lea	eax, DWORD PTR _symbol$[ebp]
	push	eax
	call	_dyntab_filter_field
	add	esp, 24					; 00000018H
	test	eax, eax
	je	SHORT $L70330
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29872], OFFSET FLAT:$SG70333
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 112		; 00000070H
	jmp	$eva_err$70334
$L70330:
	lea	eax, DWORD PTR _symbol$[ebp]
	push	eax
	call	_dyntab_order_lines
	add	esp, 4
	test	eax, eax
	je	SHORT $L70335
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29872], OFFSET FLAT:$SG70337
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 112		; 00000070H
	jmp	$eva_err$70334
$L70335:

; 113  : 	CTRL_ATTR_TAB(vartype, VAR_TYPE);

	lea	eax, DWORD PTR _vartype$[ebp]
	push	eax
	call	_dyntab_free
	add	esp, 4
	push	0
	push	-1
	push	OFFSET FLAT:$SG70340
	mov	ecx, DWORD PTR _ctrl$[ebp]
	add	ecx, 44					; 0000002cH
	push	ecx
	push	0
	lea	edx, DWORD PTR _vartype$[ebp]
	push	edx
	call	_dyntab_filter_field
	add	esp, 24					; 00000018H
	test	eax, eax
	je	SHORT $L70339
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29872], OFFSET FLAT:$SG70342
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 113		; 00000071H
	jmp	$eva_err$70334
$L70339:
	lea	edx, DWORD PTR _vartype$[ebp]
	push	edx
	call	_dyntab_order_lines
	add	esp, 4
	test	eax, eax
	je	SHORT $L70343
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29872], OFFSET FLAT:$SG70345
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 113		; 00000071H
	jmp	$eva_err$70334
$L70343:

; 114  : 	CTRL_ATTR_TAB(varval, VAR_VALUE);

	lea	edx, DWORD PTR _varval$[ebp]
	push	edx
	call	_dyntab_free
	add	esp, 4
	push	0
	push	-1
	push	OFFSET FLAT:$SG70348
	mov	eax, DWORD PTR _ctrl$[ebp]
	add	eax, 44					; 0000002cH
	push	eax
	push	0
	lea	ecx, DWORD PTR _varval$[ebp]
	push	ecx
	call	_dyntab_filter_field
	add	esp, 24					; 00000018H
	test	eax, eax
	je	SHORT $L70347
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29872], OFFSET FLAT:$SG70350
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 114		; 00000072H
	jmp	$eva_err$70334
$L70347:
	lea	ecx, DWORD PTR _varval$[ebp]
	push	ecx
	call	_dyntab_order_lines
	add	esp, 4
	test	eax, eax
	je	SHORT $L70351
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29872], OFFSET FLAT:$SG70353
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 114		; 00000072H
	jmp	$eva_err$70334
$L70351:

; 115  : 	CTRL_ATTR_TAB(objtype, VAR_OBJTYPE);

	lea	ecx, DWORD PTR _objtype$[ebp]
	push	ecx
	call	_dyntab_free
	add	esp, 4
	push	0
	push	-1
	push	OFFSET FLAT:$SG70356
	mov	edx, DWORD PTR _ctrl$[ebp]
	add	edx, 44					; 0000002cH
	push	edx
	push	0
	lea	eax, DWORD PTR _objtype$[ebp]
	push	eax
	call	_dyntab_filter_field
	add	esp, 24					; 00000018H
	test	eax, eax
	je	SHORT $L70355
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29872], OFFSET FLAT:$SG70358
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 115		; 00000073H
	jmp	$eva_err$70334
$L70355:
	lea	eax, DWORD PTR _objtype$[ebp]
	push	eax
	call	_dyntab_order_lines
	add	esp, 4
	test	eax, eax
	je	SHORT $L70359
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29872], OFFSET FLAT:$SG70361
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 115		; 00000073H
	jmp	$eva_err$70334
$L70359:

; 116  : 	CTRL_ATTR_TAB(listobj, VALOBJ);

	lea	eax, DWORD PTR _listobj$[ebp]
	push	eax
	call	_dyntab_free
	add	esp, 4
	push	0
	push	-1
	push	OFFSET FLAT:$SG70364
	mov	ecx, DWORD PTR _ctrl$[ebp]
	add	ecx, 44					; 0000002cH
	push	ecx
	push	0
	lea	edx, DWORD PTR _listobj$[ebp]
	push	edx
	call	_dyntab_filter_field
	add	esp, 24					; 00000018H
	test	eax, eax
	je	SHORT $L70363
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29872], OFFSET FLAT:$SG70366
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 116		; 00000074H
	jmp	$eva_err$70334
$L70363:
	lea	edx, DWORD PTR _listobj$[ebp]
	push	edx
	call	_dyntab_order_lines
	add	esp, 4
	test	eax, eax
	je	SHORT $L70367
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29872], OFFSET FLAT:$SG70369
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 116		; 00000074H
	jmp	$eva_err$70334
$L70367:

; 117  : 	CTRL_ATTR_TAB(fieldexpr, VAR_FIELDEXPR);

	lea	edx, DWORD PTR _fieldexpr$[ebp]
	push	edx
	call	_dyntab_free
	add	esp, 4
	push	0
	push	-1
	push	OFFSET FLAT:$SG70372
	mov	eax, DWORD PTR _ctrl$[ebp]
	add	eax, 44					; 0000002cH
	push	eax
	push	0
	lea	ecx, DWORD PTR _fieldexpr$[ebp]
	push	ecx
	call	_dyntab_filter_field
	add	esp, 24					; 00000018H
	test	eax, eax
	je	SHORT $L70371
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29872], OFFSET FLAT:$SG70374
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 117		; 00000075H
	jmp	$eva_err$70334
$L70371:
	lea	ecx, DWORD PTR _fieldexpr$[ebp]
	push	ecx
	call	_dyntab_order_lines
	add	esp, 4
	test	eax, eax
	je	SHORT $L70375
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29872], OFFSET FLAT:$SG70377
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 117		; 00000075H
	jmp	$eva_err$70334
$L70375:

; 118  : 	CTRL_ATTR_TAB(inputobj, INPUTOBJ);

	lea	ecx, DWORD PTR _inputobj$[ebp]
	push	ecx
	call	_dyntab_free
	add	esp, 4
	push	0
	push	-1
	push	OFFSET FLAT:$SG70380
	mov	edx, DWORD PTR _ctrl$[ebp]
	add	edx, 44					; 0000002cH
	push	edx
	push	0
	lea	eax, DWORD PTR _inputobj$[ebp]
	push	eax
	call	_dyntab_filter_field
	add	esp, 24					; 00000018H
	test	eax, eax
	je	SHORT $L70379
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29872], OFFSET FLAT:$SG70382
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 118		; 00000076H
	jmp	$eva_err$70334
$L70379:
	lea	eax, DWORD PTR _inputobj$[ebp]
	push	eax
	call	_dyntab_order_lines
	add	esp, 4
	test	eax, eax
	je	SHORT $L70383
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29872], OFFSET FLAT:$SG70385
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 118		; 00000076H
	jmp	$eva_err$70334
$L70383:

; 119  : 	CTRL_ATTR_TAB(calcobj, CALCOBJ);

	lea	eax, DWORD PTR _calcobj$[ebp]
	push	eax
	call	_dyntab_free
	add	esp, 4
	push	0
	push	-1
	push	OFFSET FLAT:$SG70388
	mov	ecx, DWORD PTR _ctrl$[ebp]
	add	ecx, 44					; 0000002cH
	push	ecx
	push	0
	lea	edx, DWORD PTR _calcobj$[ebp]
	push	edx
	call	_dyntab_filter_field
	add	esp, 24					; 00000018H
	test	eax, eax
	je	SHORT $L70387
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29872], OFFSET FLAT:$SG70390
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 119		; 00000077H
	jmp	$eva_err$70334
$L70387:
	lea	edx, DWORD PTR _calcobj$[ebp]
	push	edx
	call	_dyntab_order_lines
	add	esp, 4
	test	eax, eax
	je	SHORT $L70391
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29872], OFFSET FLAT:$SG70393
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 119		; 00000077H
	jmp	$eva_err$70334
$L70391:

; 120  : 	CTRL_ATTR_TAB(dataobj, DATAOBJ);

	lea	edx, DWORD PTR _dataobj$[ebp]
	push	edx
	call	_dyntab_free
	add	esp, 4
	push	0
	push	-1
	push	OFFSET FLAT:$SG70396
	mov	eax, DWORD PTR _ctrl$[ebp]
	add	eax, 44					; 0000002cH
	push	eax
	push	0
	lea	ecx, DWORD PTR _dataobj$[ebp]
	push	ecx
	call	_dyntab_filter_field
	add	esp, 24					; 00000018H
	test	eax, eax
	je	SHORT $L70395
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29872], OFFSET FLAT:$SG70398
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 120		; 00000078H
	jmp	$eva_err$70334
$L70395:
	lea	ecx, DWORD PTR _dataobj$[ebp]
	push	ecx
	call	_dyntab_order_lines
	add	esp, 4
	test	eax, eax
	je	SHORT $L70399
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29872], OFFSET FLAT:$SG70401
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 120		; 00000078H
	jmp	$eva_err$70334
$L70399:

; 121  : 	CTRL_ATTR_TAB(filterobj, FILTEROBJ);

	lea	ecx, DWORD PTR _filterobj$[ebp]
	push	ecx
	call	_dyntab_free
	add	esp, 4
	push	0
	push	-1
	push	OFFSET FLAT:$SG70404
	mov	edx, DWORD PTR _ctrl$[ebp]
	add	edx, 44					; 0000002cH
	push	edx
	push	0
	lea	eax, DWORD PTR _filterobj$[ebp]
	push	eax
	call	_dyntab_filter_field
	add	esp, 24					; 00000018H
	test	eax, eax
	je	SHORT $L70403
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29872], OFFSET FLAT:$SG70406
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 121		; 00000079H
	jmp	$eva_err$70334
$L70403:
	lea	eax, DWORD PTR _filterobj$[ebp]
	push	eax
	call	_dyntab_order_lines
	add	esp, 4
	test	eax, eax
	je	SHORT $L70407
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29872], OFFSET FLAT:$SG70409
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 121		; 00000079H
	jmp	$eva_err$70334
$L70407:

; 122  : 	CTRL_ATTR_TAB(tableobj, TABLEOBJ);

	lea	eax, DWORD PTR _tableobj$[ebp]
	push	eax
	call	_dyntab_free
	add	esp, 4
	push	0
	push	-1
	push	OFFSET FLAT:$SG70412
	mov	ecx, DWORD PTR _ctrl$[ebp]
	add	ecx, 44					; 0000002cH
	push	ecx
	push	0
	lea	edx, DWORD PTR _tableobj$[ebp]
	push	edx
	call	_dyntab_filter_field
	add	esp, 24					; 00000018H
	test	eax, eax
	je	SHORT $L70411
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29872], OFFSET FLAT:$SG70414
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 122		; 0000007aH
	jmp	$eva_err$70334
$L70411:
	lea	edx, DWORD PTR _tableobj$[ebp]
	push	edx
	call	_dyntab_order_lines
	add	esp, 4
	test	eax, eax
	je	SHORT $L70415
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29872], OFFSET FLAT:$SG70417
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 122		; 0000007aH
	jmp	$eva_err$70334
$L70415:

; 123  : 	CTRL_ATTR_TAB(valmult, USE_MULTIPLE);

	lea	edx, DWORD PTR _valmult$[ebp]
	push	edx
	call	_dyntab_free
	add	esp, 4
	push	0
	push	-1
	push	OFFSET FLAT:$SG70420
	mov	eax, DWORD PTR _ctrl$[ebp]
	add	eax, 44					; 0000002cH
	push	eax
	push	0
	lea	ecx, DWORD PTR _valmult$[ebp]
	push	ecx
	call	_dyntab_filter_field
	add	esp, 24					; 00000018H
	test	eax, eax
	je	SHORT $L70419
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29872], OFFSET FLAT:$SG70422
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 123		; 0000007bH
	jmp	$eva_err$70334
$L70419:
	lea	ecx, DWORD PTR _valmult$[ebp]
	push	ecx
	call	_dyntab_order_lines
	add	esp, 4
	test	eax, eax
	je	SHORT $L70423
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29872], OFFSET FLAT:$SG70425
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 123		; 0000007bH
	jmp	$eva_err$70334
$L70423:

; 124  : 
; 125  : 	/* Output parameters in a separate table */
; 126  : 	fprintf(f, "\n");

	push	OFFSET FLAT:$SG70426
	mov	ecx, DWORD PTR _f$[ebp]
	push	ecx
	call	_fprintf
	add	esp, 8

; 127  : 	for(i = 0; i < vartype.nbrows; i++)

	mov	DWORD PTR _i$[ebp], 0
	jmp	SHORT $L70427
$L70428:
	mov	edx, DWORD PTR _i$[ebp]
	add	edx, 1
	mov	DWORD PTR _i$[ebp], edx
$L70427:
	mov	eax, DWORD PTR _i$[ebp]
	cmp	eax, DWORD PTR _vartype$[ebp]
	jae	$eva_noerr$70589

; 129  : 		/* Handle parameter type */
; 130  : 		char *typ = dyntab_val(&vartype, i, 0);

	push	0
	mov	ecx, DWORD PTR _i$[ebp]
	push	ecx
	lea	edx, DWORD PTR _vartype$[ebp]
	push	edx
	call	_dyntab_val
	add	esp, 12					; 0000000cH
	mov	DWORD PTR _typ$70430[ebp], eax

; 131  : 		fprintf(f, "%s\t%s\t", dyntab_val(&symbol, i, 0), typ + 5);

	mov	eax, DWORD PTR _typ$70430[ebp]
	add	eax, 5
	push	eax
	push	0
	mov	ecx, DWORD PTR _i$[ebp]
	push	ecx
	lea	edx, DWORD PTR _symbol$[ebp]
	push	edx
	call	_dyntab_val
	add	esp, 12					; 0000000cH
	push	eax
	push	OFFSET FLAT:$SG70431
	mov	eax, DWORD PTR _f$[ebp]
	push	eax
	call	_fprintf
	add	esp, 16					; 00000010H

; 132  : 
; 133  : 		/* Constant value : output value */
; 134  : 		if(!strcmp(typ, "_EVA_VALUE"))

	push	OFFSET FLAT:$SG70433
	mov	ecx, DWORD PTR _typ$70430[ebp]
	push	ecx
	call	_strcmp
	add	esp, 8
	test	eax, eax
	jne	$L70432

; 136  : 			if(buf) buf->cnt = 0;

	cmp	DWORD PTR _buf$[ebp], 0
	je	SHORT $L70434
	mov	edx, DWORD PTR _buf$[ebp]
	mov	DWORD PTR [edx+4], 0
$L70434:

; 137  : 			DYNBUF_ADD_CELL(&buf, &varval, i, 0, EXPORT_TABRC);

	push	1
	push	OFFSET FLAT:_export_tabrc
	push	0
	mov	eax, DWORD PTR _i$[ebp]
	push	eax
	lea	ecx, DWORD PTR _varval$[ebp]
	push	ecx
	call	_dyntab_sz
	add	esp, 12					; 0000000cH
	push	eax
	push	0
	mov	edx, DWORD PTR _i$[ebp]
	push	edx
	lea	eax, DWORD PTR _varval$[ebp]
	push	eax
	call	_dyntab_val
	add	esp, 12					; 0000000cH
	push	eax
	lea	ecx, DWORD PTR _buf$[ebp]
	push	ecx
	call	_dynbuf_add
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L70435
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29872], OFFSET FLAT:$SG70437
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 137		; 00000089H
	jmp	$eva_err$70334
$L70435:

; 138  : 			if(buf) fprintf(f, "%s", buf->data);

	cmp	DWORD PTR _buf$[ebp], 0
	je	SHORT $L70438
	mov	ecx, DWORD PTR _buf$[ebp]
	add	ecx, 8
	push	ecx
	push	OFFSET FLAT:$SG70439
	mov	edx, DWORD PTR _f$[ebp]
	push	edx
	call	_fprintf
	add	esp, 12					; 0000000cH
$L70438:

; 140  : 
; 141  : 		/* Field value or SQL expression : read & handle multiple values */
; 142  : 		else if(!strcmp(typ, "_EVA_FIELDVAL") || !strcmp(typ, "_EVA_SQLEXPR"))

	jmp	$L70587
$L70432:
	push	OFFSET FLAT:$SG70443
	mov	eax, DWORD PTR _typ$70430[ebp]
	push	eax
	call	_strcmp
	add	esp, 8
	test	eax, eax
	je	SHORT $L70442
	push	OFFSET FLAT:$SG70444
	mov	ecx, DWORD PTR _typ$70430[ebp]
	push	ecx
	call	_strcmp
	add	esp, 8
	test	eax, eax
	jne	$L70441
$L70442:

; 144  : 			int b_date = 0, b_num = 0;

	mov	DWORD PTR _b_date$70445[ebp], 0
	mov	DWORD PTR _b_num$70446[ebp], 0

; 145  : 			char *vmult = dyntab_val(&valmult, i, 0);

	push	0
	mov	edx, DWORD PTR _i$[ebp]
	push	edx
	lea	eax, DWORD PTR _valmult$[ebp]
	push	eax
	call	_dyntab_val
	add	esp, 12					; 0000000cH
	mov	DWORD PTR _vmult$70447[ebp], eax

; 146  : 			char *objtyp = dyntab_val(&objtype, i, 0);

	push	0
	mov	ecx, DWORD PTR _i$[ebp]
	push	ecx
	lea	edx, DWORD PTR _objtype$[ebp]
	push	edx
	call	_dyntab_val
	add	esp, 12					; 0000000cH
	mov	DWORD PTR _objtyp$70448[ebp], eax

; 147  : 			if(!*objtyp) objtyp = "_EVA_CURRENTOBJ";

	mov	eax, DWORD PTR _objtyp$70448[ebp]
	movsx	ecx, BYTE PTR [eax]
	test	ecx, ecx
	jne	SHORT $L70449
	mov	DWORD PTR _objtyp$70448[ebp], OFFSET FLAT:$SG70450
$L70449:

; 148  : 
; 149  : 			/* Read source object, storage field & field values */
; 150  : 			DYNTAB_SET_CELL(&obj, 0, 0, &listobj, i, 0);

	push	0
	push	0
	mov	edx, DWORD PTR _i$[ebp]
	push	edx
	lea	eax, DWORD PTR _listobj$[ebp]
	push	eax
	call	_dyntab_cell
	add	esp, 12					; 0000000cH
	push	eax
	push	0
	push	0
	lea	ecx, DWORD PTR _obj$[ebp]
	push	ecx
	call	_dyntab_copy
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L70451
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29872], OFFSET FLAT:$SG70453
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 150		; 00000096H
	jmp	$eva_err$70334
$L70451:

; 151  : 			DYNTAB_FREE(field);

	lea	ecx, DWORD PTR _field$[ebp]
	push	ecx
	call	_dyntab_free
	add	esp, 4

; 152  : 			DYNTAB_FREE(format);

	lea	edx, DWORD PTR _format$[ebp]
	push	edx
	call	_dyntab_free
	add	esp, 4

; 153  : 			if(!strcmp(typ, "_EVA_FIELDVAL"))

	push	OFFSET FLAT:$SG70455
	mov	eax, DWORD PTR _typ$70430[ebp]
	push	eax
	call	_strcmp
	add	esp, 8
	test	eax, eax
	jne	$L70454

; 155  : 				unsigned long idobj = DYNTAB_TOULRC(&inputobj, i, 0);

	push	10					; 0000000aH
	push	0
	push	0
	mov	ecx, DWORD PTR _i$[ebp]
	push	ecx
	lea	edx, DWORD PTR _inputobj$[ebp]
	push	edx
	call	_dyntab_val
	add	esp, 12					; 0000000cH
	push	eax
	call	_strtoul
	add	esp, 12					; 0000000cH
	mov	DWORD PTR _idobj$70456[ebp], eax

; 156  : 				if(qry_obj_idfield(cntxt, &field, idobj, cntxt->val_FIELD)) STACK_ERROR;

	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	ecx, DWORD PTR [eax+269644]
	push	ecx
	mov	edx, DWORD PTR _idobj$70456[ebp]
	push	edx
	lea	eax, DWORD PTR _field$[ebp]
	push	eax
	mov	ecx, DWORD PTR _cntxt$[ebp]
	push	ecx
	call	_qry_obj_idfield
	add	esp, 16					; 00000010H
	test	eax, eax
	je	SHORT $L70458
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 156		; 0000009cH
	jmp	$eva_err$70334
$L70458:

; 157  : 				if(qry_obj_field(cntxt, &format, idobj, "_EVA_FORMAT")) STACK_ERROR;

	push	OFFSET FLAT:$SG70460
	mov	eax, DWORD PTR _idobj$70456[ebp]
	push	eax
	lea	ecx, DWORD PTR _format$[ebp]
	push	ecx
	mov	edx, DWORD PTR _cntxt$[ebp]
	push	edx
	call	_qry_obj_field
	add	esp, 16					; 00000010H
	test	eax, eax
	je	SHORT $L70459
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 157		; 0000009dH
	jmp	$eva_err$70334
$L70459:

; 158  : 				if(qry_obj_idfield(cntxt, &data, idobj, cntxt->val_TYPE)) STACK_ERROR;

	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	edx, DWORD PTR [ecx+269640]
	push	edx
	mov	eax, DWORD PTR _idobj$70456[ebp]
	push	eax
	lea	ecx, DWORD PTR _data$[ebp]
	push	ecx
	mov	edx, DWORD PTR _cntxt$[ebp]
	push	edx
	call	_qry_obj_idfield
	add	esp, 16					; 00000010H
	test	eax, eax
	je	SHORT $L70461
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 158		; 0000009eH
	jmp	$eva_err$70334
$L70461:

; 159  : 				if(!dyntab_txt_cmp(add_sz_str("_EVA_DATE"), &data, 0, 0)) b_date = 1;

	push	0
	push	0
	lea	ecx, DWORD PTR _data$[ebp]
	push	ecx
	push	9
	push	OFFSET FLAT:$SG70463
	call	_dyntab_txt_cmp
	add	esp, 20					; 00000014H
	test	eax, eax
	jne	SHORT $L70462
	mov	DWORD PTR _b_date$70445[ebp], 1

; 160  : 				else if(!dyntab_txt_cmp(add_sz_str("_EVA_NUMBER"), &data, 0, 0)) b_num = 1;

	jmp	SHORT $L70465
$L70462:
	push	0
	push	0
	lea	edx, DWORD PTR _data$[ebp]
	push	edx
	push	11					; 0000000bH
	push	OFFSET FLAT:$SG70466
	call	_dyntab_txt_cmp
	add	esp, 20					; 00000014H
	test	eax, eax
	jne	SHORT $L70465
	mov	DWORD PTR _b_num$70446[ebp], 1
$L70465:

; 162  : 			else

	jmp	SHORT $L70468
$L70454:

; 163  : 				DYNTAB_SET_CELL(&field, 0, 0, &fieldexpr, i, 0);

	push	0
	push	0
	mov	eax, DWORD PTR _i$[ebp]
	push	eax
	lea	ecx, DWORD PTR _fieldexpr$[ebp]
	push	ecx
	call	_dyntab_cell
	add	esp, 12					; 0000000cH
	push	eax
	push	0
	push	0
	lea	edx, DWORD PTR _field$[ebp]
	push	edx
	call	_dyntab_copy
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L70468
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29872], OFFSET FLAT:$SG70470
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 163		; 000000a3H
	jmp	$eva_err$70334
$L70468:

; 164  : 			if(ctrl_eval_valtyp(cntxt, ctrl, &data, objtyp, &obj, &field)) STACK_ERROR;

	lea	edx, DWORD PTR _field$[ebp]
	push	edx
	lea	eax, DWORD PTR _obj$[ebp]
	push	eax
	mov	ecx, DWORD PTR _objtyp$70448[ebp]
	push	ecx
	lea	edx, DWORD PTR _data$[ebp]
	push	edx
	mov	eax, DWORD PTR _ctrl$[ebp]
	push	eax
	mov	ecx, DWORD PTR _cntxt$[ebp]
	push	ecx
	call	_ctrl_eval_valtyp
	add	esp, 24					; 00000018H
	test	eax, eax
	je	SHORT $L70471
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 164		; 000000a4H
	jmp	$eva_err$70334
$L70471:

; 165  : 
; 166  : 			/* Handle multiple values */
; 167  : 			if(*vmult) vmult += 5;

	mov	eax, DWORD PTR _vmult$70447[ebp]
	movsx	ecx, BYTE PTR [eax]
	test	ecx, ecx
	je	SHORT $L70472
	mov	edx, DWORD PTR _vmult$70447[ebp]
	add	edx, 5
	mov	DWORD PTR _vmult$70447[ebp], edx
$L70472:

; 168  : 			if(strcmp(vmult, "LINES") && strcmp(vmult, "COMMA") && strcmp(vmult, "SPACE"))

	push	OFFSET FLAT:$SG70474
	mov	eax, DWORD PTR _vmult$70447[ebp]
	push	eax
	call	_strcmp
	add	esp, 8
	test	eax, eax
	je	SHORT $L70473
	push	OFFSET FLAT:$SG70475
	mov	ecx, DWORD PTR _vmult$70447[ebp]
	push	ecx
	call	_strcmp
	add	esp, 8
	test	eax, eax
	je	SHORT $L70473
	push	OFFSET FLAT:$SG70476
	mov	edx, DWORD PTR _vmult$70447[ebp]
	push	edx
	call	_strcmp
	add	esp, 8
	test	eax, eax
	je	SHORT $L70473

; 169  : 				dyntab_group(&data, vmult);

	mov	eax, DWORD PTR _vmult$70447[ebp]
	push	eax
	lea	ecx, DWORD PTR _data$[ebp]
	push	ecx
	call	_dyntab_group
	add	esp, 8
$L70473:

; 170  : 			for(j = 0; j < data.nbrows; j++)

	mov	DWORD PTR _j$[ebp], 0
	jmp	SHORT $L70477
$L70478:
	mov	edx, DWORD PTR _j$[ebp]
	add	edx, 1
	mov	DWORD PTR _j$[ebp], edx
$L70477:
	mov	eax, DWORD PTR _j$[ebp]
	cmp	eax, DWORD PTR _data$[ebp]
	jae	$L70479

; 172  : 				DynTableCell *c = dyntab_cell(&data, j, 0);

	push	0
	mov	ecx, DWORD PTR _j$[ebp]
	push	ecx
	lea	edx, DWORD PTR _data$[ebp]
	push	edx
	call	_dyntab_cell
	add	esp, 12					; 0000000cH
	mov	DWORD PTR _c$70480[ebp], eax

; 173  : 				if(buf) buf->cnt = 0;

	cmp	DWORD PTR _buf$[ebp], 0
	je	SHORT $L70481
	mov	eax, DWORD PTR _buf$[ebp]
	mov	DWORD PTR [eax+4], 0
$L70481:

; 174  : 				if(b_date)

	cmp	DWORD PTR _b_date$70445[ebp], 0
	je	SHORT $L70482

; 176  : 					char date[64];
; 177  : 					datetxt_to_format(cntxt, date, c->txt, dyntab_val(&format, 0, 0));

	push	0
	push	0
	lea	ecx, DWORD PTR _format$[ebp]
	push	ecx
	call	_dyntab_val
	add	esp, 12					; 0000000cH
	push	eax
	mov	edx, DWORD PTR _c$70480[ebp]
	mov	eax, DWORD PTR [edx]
	push	eax
	lea	ecx, DWORD PTR _date$70483[ebp]
	push	ecx
	mov	edx, DWORD PTR _cntxt$[ebp]
	push	edx
	call	_datetxt_to_format
	add	esp, 16					; 00000010H

; 178  : 					DYNBUF_ADD(&buf, date, 0, NO_CONV);

	push	0
	push	0
	push	0
	lea	eax, DWORD PTR _date$70483[ebp]
	push	eax
	lea	ecx, DWORD PTR _buf$[ebp]
	push	ecx
	call	_dynbuf_add
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L70485
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29872], OFFSET FLAT:$SG70487
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 178		; 000000b2H
	jmp	$eva_err$70334
$L70485:

; 180  : 				else if(b_num)

	jmp	$L70496
$L70482:
	cmp	DWORD PTR _b_num$70446[ebp], 0
	je	SHORT $L70489

; 182  : 					DYNBUF_ADD(&buf, number_to_format(c->txt, dyntab_val(&format, 0, 0)), 0, NO_CONV);

	push	0
	push	0
	push	0
	push	0
	push	0
	lea	ecx, DWORD PTR _format$[ebp]
	push	ecx
	call	_dyntab_val
	add	esp, 12					; 0000000cH
	push	eax
	mov	edx, DWORD PTR _c$70480[ebp]
	mov	eax, DWORD PTR [edx]
	push	eax
	call	_number_to_format
	add	esp, 8
	push	eax
	lea	ecx, DWORD PTR _buf$[ebp]
	push	ecx
	call	_dynbuf_add
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L70491
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29872], OFFSET FLAT:$SG70493
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 182		; 000000b6H
	jmp	$eva_err$70334
$L70491:

; 184  : 				else

	jmp	SHORT $L70496
$L70489:

; 185  : 					DYNBUF_ADD_CELLP(&buf, c, EXPORT_TABRC);

	mov	ecx, DWORD PTR _c$70480[ebp]
	mov	DWORD PTR __c$70495[ebp], ecx
	cmp	DWORD PTR __c$70495[ebp], 0
	je	SHORT $L70496
	push	1
	push	OFFSET FLAT:_export_tabrc
	mov	edx, DWORD PTR __c$70495[ebp]
	mov	eax, DWORD PTR [edx+4]
	push	eax
	mov	ecx, DWORD PTR __c$70495[ebp]
	mov	edx, DWORD PTR [ecx]
	push	edx
	lea	eax, DWORD PTR _buf$[ebp]
	push	eax
	call	_dynbuf_add
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L70496
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29872], OFFSET FLAT:$SG70498
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 185		; 000000b9H
	jmp	$eva_err$70334
$L70496:

; 186  : 				if(!strcmp(vmult, "LINES"))

	push	OFFSET FLAT:$SG70500
	mov	eax, DWORD PTR _vmult$70447[ebp]
	push	eax
	call	_strcmp
	add	esp, 8
	test	eax, eax
	jne	SHORT $L70499

; 187  : 					fprintf(f, "%s%s", j ? "<RC>" : "", buf->data);

	cmp	DWORD PTR _j$[ebp], 0
	je	SHORT $L71185
	mov	DWORD PTR -4992+[ebp], OFFSET FLAT:$SG70501
	jmp	SHORT $L71186
$L71185:
	mov	DWORD PTR -4992+[ebp], OFFSET FLAT:$SG70502
$L71186:
	mov	ecx, DWORD PTR _buf$[ebp]
	add	ecx, 8
	push	ecx
	mov	edx, DWORD PTR -4992+[ebp]
	push	edx
	push	OFFSET FLAT:$SG70503
	mov	eax, DWORD PTR _f$[ebp]
	push	eax
	call	_fprintf
	add	esp, 16					; 00000010H

; 188  : 				else if(!strcmp(vmult, "COMMA"))

	jmp	$L70516
$L70499:
	push	OFFSET FLAT:$SG70506
	mov	ecx, DWORD PTR _vmult$70447[ebp]
	push	ecx
	call	_strcmp
	add	esp, 8
	test	eax, eax
	jne	SHORT $L70505

; 189  : 					fprintf(f, "%s'%s'", j ? ", " : "", buf->data);

	cmp	DWORD PTR _j$[ebp], 0
	je	SHORT $L71187
	mov	DWORD PTR -4996+[ebp], OFFSET FLAT:$SG70507
	jmp	SHORT $L71188
$L71187:
	mov	DWORD PTR -4996+[ebp], OFFSET FLAT:$SG70508
$L71188:
	mov	edx, DWORD PTR _buf$[ebp]
	add	edx, 8
	push	edx
	mov	eax, DWORD PTR -4996+[ebp]
	push	eax
	push	OFFSET FLAT:$SG70509
	mov	ecx, DWORD PTR _f$[ebp]
	push	ecx
	call	_fprintf
	add	esp, 16					; 00000010H

; 190  : 				else if(!strcmp(vmult, "SPACE"))

	jmp	$L70516
$L70505:
	push	OFFSET FLAT:$SG70512
	mov	edx, DWORD PTR _vmult$70447[ebp]
	push	edx
	call	_strcmp
	add	esp, 8
	test	eax, eax
	jne	SHORT $L70511

; 191  : 					fprintf(f, "%s'%s'", j ? " " : "", buf->data);

	cmp	DWORD PTR _j$[ebp], 0
	je	SHORT $L71189
	mov	DWORD PTR -5000+[ebp], OFFSET FLAT:$SG70513
	jmp	SHORT $L71190
$L71189:
	mov	DWORD PTR -5000+[ebp], OFFSET FLAT:$SG70514
$L71190:
	mov	eax, DWORD PTR _buf$[ebp]
	add	eax, 8
	push	eax
	mov	ecx, DWORD PTR -5000+[ebp]
	push	ecx
	push	OFFSET FLAT:$SG70515
	mov	edx, DWORD PTR _f$[ebp]
	push	edx
	call	_fprintf
	add	esp, 16					; 00000010H

; 192  : 				else

	jmp	SHORT $L70516
$L70511:

; 193  : 					fprintf(f, "%s%s\t%lu\t%lu", j ? "\n\t\t" : "", buf->data, c->Num, c->Line);

	cmp	DWORD PTR _j$[ebp], 0
	je	SHORT $L71191
	mov	DWORD PTR -5004+[ebp], OFFSET FLAT:$SG70517
	jmp	SHORT $L71192
$L71191:
	mov	DWORD PTR -5004+[ebp], OFFSET FLAT:$SG70518
$L71192:
	mov	eax, DWORD PTR _c$70480[ebp]
	mov	ecx, DWORD PTR [eax+40]
	push	ecx
	mov	edx, DWORD PTR _c$70480[ebp]
	mov	eax, DWORD PTR [edx+36]
	push	eax
	mov	ecx, DWORD PTR _buf$[ebp]
	add	ecx, 8
	push	ecx
	mov	edx, DWORD PTR -5004+[ebp]
	push	edx
	push	OFFSET FLAT:$SG70519
	mov	eax, DWORD PTR _f$[ebp]
	push	eax
	call	_fprintf
	add	esp, 24					; 00000018H
$L70516:

; 194  : 			}

	jmp	$L70478
$L70479:

; 196  : 
; 197  : 		/* Calc-ed value : read control, evaluate & output values */
; 198  : 		else if(!strcmp(typ, "_EVA_CALC"))

	jmp	$L70587
$L70441:
	push	OFFSET FLAT:$SG70522
	mov	ecx, DWORD PTR _typ$70430[ebp]
	push	ecx
	call	_strcmp
	add	esp, 8
	test	eax, eax
	jne	$L70521

; 200  : 			EVA_ctrl *ctl = form->ctrl + form->nb_ctrl;

	mov	edx, DWORD PTR _form$[ebp]
	mov	eax, DWORD PTR [edx+4]
	imul	eax, 480				; 000001e0H
	mov	ecx, DWORD PTR _form$[ebp]
	mov	edx, DWORD PTR [ecx]
	add	edx, eax
	mov	DWORD PTR _ctl$70523[ebp], edx

; 201  : 			if(qry_cache_idobj(&ctl->attr, DYNTAB_TOULRC(&calcobj, i, 0)) ||
; 202  : 				ctrl_read_baseobj(cntxt, &ctl[0].attr) ||
; 203  : 				ctrl_set_common_attr(cntxt, ctl)) STACK_ERROR;

	push	3
	push	0
	push	10					; 0000000aH
	push	0
	push	0
	mov	eax, DWORD PTR _i$[ebp]
	push	eax
	lea	ecx, DWORD PTR _calcobj$[ebp]
	push	ecx
	call	_dyntab_val
	add	esp, 12					; 0000000cH
	push	eax
	call	_strtoul
	add	esp, 12					; 0000000cH
	push	eax
	mov	edx, DWORD PTR _ctl$70523[ebp]
	add	edx, 44					; 0000002cH
	push	edx
	mov	eax, DWORD PTR _cntxt$[ebp]
	push	eax
	call	_qry_cache_idobj_field
	add	esp, 20					; 00000014H
	test	eax, eax
	jne	SHORT $L70527
	mov	ecx, DWORD PTR _ctl$70523[ebp]
	add	ecx, 44					; 0000002cH
	push	ecx
	mov	edx, DWORD PTR _cntxt$[ebp]
	push	edx
	call	_ctrl_read_baseobj
	add	esp, 8
	test	eax, eax
	jne	SHORT $L70527
	mov	eax, DWORD PTR _ctl$70523[ebp]
	push	eax
	mov	ecx, DWORD PTR _cntxt$[ebp]
	push	ecx
	call	_ctrl_set_common_attr
	add	esp, 8
	test	eax, eax
	je	SHORT $L70526
$L70527:
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 203		; 000000cbH
	jmp	$eva_err$70334
$L70526:

; 204  : 			if(ctrl_output_exprval(cntxt, ctl, 2)) STACK_ERROR;

	push	2
	mov	eax, DWORD PTR _ctl$70523[ebp]
	push	eax
	mov	ecx, DWORD PTR _cntxt$[ebp]
	push	ecx
	call	_ctrl_output_exprval
	add	esp, 12					; 0000000cH
	test	eax, eax
	je	SHORT $L70528
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 204		; 000000ccH
	jmp	$eva_err$70334
$L70528:

; 205  : 			for(j = 0; j < ctl->val.nbrows; j++)

	mov	DWORD PTR _j$[ebp], 0
	jmp	SHORT $L70529
$L70530:
	mov	eax, DWORD PTR _j$[ebp]
	add	eax, 1
	mov	DWORD PTR _j$[ebp], eax
$L70529:
	mov	ecx, DWORD PTR _ctl$70523[ebp]
	mov	edx, DWORD PTR _j$[ebp]
	cmp	edx, DWORD PTR [ecx+64]
	jae	SHORT $L70531

; 207  : 				DynTableCell *c = dyntab_cell(&ctl->val, j, 0);

	push	0
	mov	eax, DWORD PTR _j$[ebp]
	push	eax
	mov	ecx, DWORD PTR _ctl$70523[ebp]
	add	ecx, 64					; 00000040H
	push	ecx
	call	_dyntab_cell
	add	esp, 12					; 0000000cH
	mov	DWORD PTR _c$70532[ebp], eax

; 208  : 				fprintf(f, "%s%s\t%lu\t%lu", j ? "\n\t\t" : "", (c + 1)->txt, c->Num, c->Line);

	cmp	DWORD PTR _j$[ebp], 0
	je	SHORT $L71193
	mov	DWORD PTR -5008+[ebp], OFFSET FLAT:$SG70533
	jmp	SHORT $L71194
$L71193:
	mov	DWORD PTR -5008+[ebp], OFFSET FLAT:$SG70534
$L71194:
	mov	edx, DWORD PTR _c$70532[ebp]
	mov	eax, DWORD PTR [edx+40]
	push	eax
	mov	ecx, DWORD PTR _c$70532[ebp]
	mov	edx, DWORD PTR [ecx+36]
	push	edx
	mov	eax, DWORD PTR _c$70532[ebp]
	mov	ecx, DWORD PTR [eax+64]
	push	ecx
	mov	edx, DWORD PTR -5008+[ebp]
	push	edx
	push	OFFSET FLAT:$SG70535
	mov	eax, DWORD PTR _f$[ebp]
	push	eax
	call	_fprintf
	add	esp, 24					; 00000018H

; 209  : 			}

	jmp	$L70530
$L70531:

; 210  : 			form_free_ctrl(cntxt, form->nb_ctrl);

	mov	ecx, DWORD PTR _form$[ebp]
	mov	edx, DWORD PTR [ecx+4]
	push	edx
	mov	eax, DWORD PTR _cntxt$[ebp]
	push	eax
	call	_form_free_ctrl
	add	esp, 8

; 212  : 
; 213  : 		/* List of values : exec filters */
; 214  : 		else if(!strcmp(typ, "_EVA_LISTOBJ"))

	jmp	$L70587
$L70521:
	push	OFFSET FLAT:$SG70538
	mov	ecx, DWORD PTR _typ$70430[ebp]
	push	ecx
	call	_strcmp
	add	esp, 8
	test	eax, eax
	jne	$L70537

; 216  : 			DYNTAB_FREE(field);

	lea	edx, DWORD PTR _field$[ebp]
	push	edx
	call	_dyntab_free
	add	esp, 4

; 217  : 			qry_build_free(&flt);

	lea	eax, DWORD PTR _flt$[ebp]
	push	eax
	call	_qry_build_free
	add	esp, 4

; 218  : 			for(j = 0; j < filterobj.nbcols; j++) DYNTAB_SET_CELL(&field, j, 0, &filterobj, i, j);

	mov	DWORD PTR _j$[ebp], 0
	jmp	SHORT $L70539
$L70540:
	mov	ecx, DWORD PTR _j$[ebp]
	add	ecx, 1
	mov	DWORD PTR _j$[ebp], ecx
$L70539:
	mov	edx, DWORD PTR _j$[ebp]
	cmp	edx, DWORD PTR _filterobj$[ebp+8]
	jae	SHORT $L70541
	push	0
	mov	eax, DWORD PTR _j$[ebp]
	push	eax
	mov	ecx, DWORD PTR _i$[ebp]
	push	ecx
	lea	edx, DWORD PTR _filterobj$[ebp]
	push	edx
	call	_dyntab_cell
	add	esp, 12					; 0000000cH
	push	eax
	push	0
	mov	eax, DWORD PTR _j$[ebp]
	push	eax
	lea	ecx, DWORD PTR _field$[ebp]
	push	ecx
	call	_dyntab_copy
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L70542
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29872], OFFSET FLAT:$SG70544
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 218		; 000000daH
	jmp	$eva_err$70334
$L70542:
	jmp	SHORT $L70540
$L70541:

; 219  : 			if(qry_add_filter_forms(cntxt, &flt, NULL, &field) ||
; 220  : 				qry_filter_objects(cntxt, &data, &flt)) STACK_ERROR;

	lea	ecx, DWORD PTR _field$[ebp]
	push	ecx
	push	0
	lea	edx, DWORD PTR _flt$[ebp]
	push	edx
	mov	eax, DWORD PTR _cntxt$[ebp]
	push	eax
	call	_qry_add_filter_forms
	add	esp, 16					; 00000010H
	test	eax, eax
	jne	SHORT $L70547
	lea	ecx, DWORD PTR _flt$[ebp]
	push	ecx
	lea	edx, DWORD PTR _data$[ebp]
	push	edx
	mov	eax, DWORD PTR _cntxt$[ebp]
	push	eax
	call	_qry_filter_objects
	add	esp, 12					; 0000000cH
	test	eax, eax
	je	SHORT $L70546
$L70547:
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 220		; 000000dcH
	jmp	$eva_err$70334
$L70546:

; 221  : 
; 222  : 			for(j = 0; j < data.nbrows; j++)

	mov	DWORD PTR _j$[ebp], 0
	jmp	SHORT $L70548
$L70549:
	mov	edx, DWORD PTR _j$[ebp]
	add	edx, 1
	mov	DWORD PTR _j$[ebp], edx
$L70548:
	mov	eax, DWORD PTR _j$[ebp]
	cmp	eax, DWORD PTR _data$[ebp]
	jae	$L70550

; 224  : 				DynTableCell *c = dyntab_cell(&data, j, 0);

	push	0
	mov	ecx, DWORD PTR _j$[ebp]
	push	ecx
	lea	edx, DWORD PTR _data$[ebp]
	push	edx
	call	_dyntab_cell
	add	esp, 12					; 0000000cH
	mov	DWORD PTR _c$70551[ebp], eax

; 225  : 				if(!c->txt) continue;

	mov	eax, DWORD PTR _c$70551[ebp]
	cmp	DWORD PTR [eax], 0
	jne	SHORT $L70552
	jmp	SHORT $L70549
$L70552:

; 226  : 				fprintf(f, "%s%s\t%lu\t%lu", j ? "\n\t\t" : "", c->txt, c->Num, c->Line);

	cmp	DWORD PTR _j$[ebp], 0
	je	SHORT $L71195
	mov	DWORD PTR -5012+[ebp], OFFSET FLAT:$SG70553
	jmp	SHORT $L71196
$L71195:
	mov	DWORD PTR -5012+[ebp], OFFSET FLAT:$SG70554
$L71196:
	mov	ecx, DWORD PTR _c$70551[ebp]
	mov	edx, DWORD PTR [ecx+40]
	push	edx
	mov	eax, DWORD PTR _c$70551[ebp]
	mov	ecx, DWORD PTR [eax+36]
	push	ecx
	mov	edx, DWORD PTR _c$70551[ebp]
	mov	eax, DWORD PTR [edx]
	push	eax
	mov	ecx, DWORD PTR -5012+[ebp]
	push	ecx
	push	OFFSET FLAT:$SG70555
	mov	edx, DWORD PTR _f$[ebp]
	push	edx
	call	_fprintf
	add	esp, 24					; 00000018H

; 227  : 			}

	jmp	$L70549
$L70550:

; 229  : 
; 230  : 		/* Table data : output data in file */
; 231  : 		else if(!strcmp(typ, "_EVA_DATATABLE"))

	jmp	$L70587
$L70537:
	push	OFFSET FLAT:$SG70558
	mov	eax, DWORD PTR _typ$70430[ebp]
	push	eax
	call	_strcmp
	add	esp, 8
	test	eax, eax
	jne	$L70587

; 233  : 			EVA_ctrl *lstctrl = NULL;

	mov	DWORD PTR _lstctrl$70559[ebp], 0

; 234  : 			ObjTableFormat *tbl = NULL;

	mov	DWORD PTR _tbl$70561[ebp], 0

; 235  : 			unsigned long ictrl = 0, idctrl = DYNTAB_TOULRC(&dataobj, i, 0);

	mov	DWORD PTR _ictrl$70563[ebp], 0
	push	10					; 0000000aH
	push	0
	push	0
	mov	ecx, DWORD PTR _i$[ebp]
	push	ecx
	lea	edx, DWORD PTR _dataobj$[ebp]
	push	edx
	call	_dyntab_val
	add	esp, 12					; 0000000cH
	push	eax
	call	_strtoul
	add	esp, 12					; 0000000cH
	mov	DWORD PTR _idctrl$70564[ebp], eax

; 236  : 			int b_selobj = 0;

	mov	DWORD PTR _b_selobj$70566[ebp], 0

; 237  : 			char fname[64];
; 238  : 
; 239  : 			/* Search for table in current form */
; 240  : 			for(j = 1; j < form->nb_ctrl && !ictrl; j++)

	mov	DWORD PTR _j$[ebp], 1
	jmp	SHORT $L70568
$L70569:
	mov	eax, DWORD PTR _j$[ebp]
	add	eax, 1
	mov	DWORD PTR _j$[ebp], eax
$L70568:
	mov	ecx, DWORD PTR _form$[ebp]
	mov	edx, DWORD PTR _j$[ebp]
	cmp	edx, DWORD PTR [ecx+4]
	jae	SHORT $L70570
	cmp	DWORD PTR _ictrl$70563[ebp], 0
	jne	SHORT $L70570

; 241  : 				if(DYNTAB_TOUL(&form->ctrl[j].id) == idctrl) ictrl = j;

	push	10					; 0000000aH
	push	0
	push	0
	push	0
	mov	eax, DWORD PTR _j$[ebp]
	imul	eax, 480				; 000001e0H
	mov	ecx, DWORD PTR _form$[ebp]
	mov	edx, DWORD PTR [ecx]
	add	edx, eax
	push	edx
	call	_dyntab_val
	add	esp, 12					; 0000000cH
	push	eax
	call	_strtoul
	add	esp, 12					; 0000000cH
	cmp	eax, DWORD PTR _idctrl$70564[ebp]
	jne	SHORT $L70572
	mov	eax, DWORD PTR _j$[ebp]
	mov	DWORD PTR _ictrl$70563[ebp], eax
$L70572:

; 242  : 
; 243  : 			/* If table is in form : use loaded control */
; 244  : 			if(ictrl)

	jmp	SHORT $L70569
$L70570:
	cmp	DWORD PTR _ictrl$70563[ebp], 0
	je	SHORT $L70573

; 245  : 				lstctrl = form->ctrl + ictrl;

	mov	ecx, DWORD PTR _ictrl$70563[ebp]
	imul	ecx, 480				; 000001e0H
	mov	edx, DWORD PTR _form$[ebp]
	mov	eax, DWORD PTR [edx]
	add	eax, ecx
	mov	DWORD PTR _lstctrl$70559[ebp], eax

; 246  : 			else

	jmp	$L70577
$L70573:

; 248  : 				/* If table is not in form : load in last control */
; 249  : 				ictrl = form->nb_ctrl;

	mov	ecx, DWORD PTR _form$[ebp]
	mov	edx, DWORD PTR [ecx+4]
	mov	DWORD PTR _ictrl$70563[ebp], edx

; 250  : 				lstctrl = form->ctrl + ictrl;

	mov	eax, DWORD PTR _ictrl$70563[ebp]
	imul	eax, 480				; 000001e0H
	mov	ecx, DWORD PTR _form$[ebp]
	mov	edx, DWORD PTR [ecx]
	add	edx, eax
	mov	DWORD PTR _lstctrl$70559[ebp], edx

; 251  : 				if(qry_obj_field(cntxt, &lstctrl->attr, idctrl, NULL) ||
; 252  : 					ctrl_read_baseobj(cntxt, &lstctrl->attr) ||
; 253  : 					ctrl_set_common_attr(cntxt, lstctrl) ||
; 254  : 					table_read_controls(cntxt, ictrl, NULL)) STACK_ERROR;

	push	0
	mov	eax, DWORD PTR _idctrl$70564[ebp]
	push	eax
	mov	ecx, DWORD PTR _lstctrl$70559[ebp]
	add	ecx, 44					; 0000002cH
	push	ecx
	mov	edx, DWORD PTR _cntxt$[ebp]
	push	edx
	call	_qry_obj_field
	add	esp, 16					; 00000010H
	test	eax, eax
	jne	SHORT $L70578
	mov	eax, DWORD PTR _lstctrl$70559[ebp]
	add	eax, 44					; 0000002cH
	push	eax
	mov	ecx, DWORD PTR _cntxt$[ebp]
	push	ecx
	call	_ctrl_read_baseobj
	add	esp, 8
	test	eax, eax
	jne	SHORT $L70578
	mov	edx, DWORD PTR _lstctrl$70559[ebp]
	push	edx
	mov	eax, DWORD PTR _cntxt$[ebp]
	push	eax
	call	_ctrl_set_common_attr
	add	esp, 8
	test	eax, eax
	jne	SHORT $L70578
	push	0
	mov	ecx, DWORD PTR _ictrl$70563[ebp]
	push	ecx
	mov	edx, DWORD PTR _cntxt$[ebp]
	push	edx
	call	_table_read_controls
	add	esp, 12					; 0000000cH
	test	eax, eax
	je	SHORT $L70577
$L70578:
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 254		; 000000feH
	jmp	$eva_err$70334
$L70577:

; 256  : 			tbl = lstctrl->objtbl;

	mov	ecx, DWORD PTR _lstctrl$70559[ebp]
	mov	edx, DWORD PTR [ecx+232]
	mov	DWORD PTR _tbl$70561[ebp], edx

; 257  : 
; 258  : 			/* Output text file with table data */
; 259  : 			snprintf(add_sz_str(fname), "%lu.txt", idctrl);

	mov	eax, DWORD PTR _idctrl$70564[ebp]
	push	eax
	push	OFFSET FLAT:$SG70579
	push	63					; 0000003fH
	lea	ecx, DWORD PTR _fname$70567[ebp]
	push	ecx
	call	__snprintf
	add	esp, 16					; 00000010H

; 260  : 			if(table_init_obj_list(cntxt, ictrl, &b_selobj)) STACK_ERROR;

	lea	edx, DWORD PTR _b_selobj$70566[ebp]
	push	edx
	mov	eax, DWORD PTR _ictrl$70563[ebp]
	push	eax
	mov	ecx, DWORD PTR _cntxt$[ebp]
	push	ecx
	call	_table_init_obj_list
	add	esp, 12					; 0000000cH
	test	eax, eax
	je	SHORT $L70580
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 260		; 00000104H
	jmp	$eva_err$70334
$L70580:

; 261  : 			tbl->line = 0;

	mov	eax, DWORD PTR _tbl$70561[ebp]
	mov	DWORD PTR [eax+40], 0

; 262  : 			tbl->lines = tbl->totlines;

	mov	ecx, DWORD PTR _tbl$70561[ebp]
	mov	edx, DWORD PTR _tbl$70561[ebp]
	mov	eax, DWORD PTR [edx+52]
	mov	DWORD PTR [ecx+44], eax

; 263  : 			if(table_sort_obj_list(cntxt, ictrl, b_selobj)) STACK_ERROR;

	mov	ecx, DWORD PTR _b_selobj$70566[ebp]
	push	ecx
	mov	edx, DWORD PTR _ictrl$70563[ebp]
	push	edx
	mov	eax, DWORD PTR _cntxt$[ebp]
	push	eax
	call	_table_sort_obj_list
	add	esp, 12					; 0000000cH
	test	eax, eax
	je	SHORT $L70581
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 263		; 00000107H
	jmp	$eva_err$70334
$L70581:

; 264  : 			if(table_read_obj_list(cntxt, ictrl, b_selobj)) STACK_ERROR;

	mov	edx, DWORD PTR _b_selobj$70566[ebp]
	push	edx
	mov	eax, DWORD PTR _ictrl$70563[ebp]
	push	eax
	mov	ecx, DWORD PTR _cntxt$[ebp]
	push	ecx
	call	_table_read_obj_list
	add	esp, 12					; 0000000cH
	test	eax, eax
	je	SHORT $L70582
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 264		; 00000108H
	jmp	$eva_err$70334
$L70582:

; 265  : 			if(table_prepare_rows(cntxt, ictrl, "")) STACK_ERROR;

	push	OFFSET FLAT:$SG70584
	mov	eax, DWORD PTR _ictrl$70563[ebp]
	push	eax
	mov	ecx, DWORD PTR _cntxt$[ebp]
	push	ecx
	call	_table_prepare_rows
	add	esp, 12					; 0000000cH
	test	eax, eax
	je	SHORT $L70583
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 265		; 00000109H
	jmp	$eva_err$70334
$L70583:

; 266  : 			if(file_write_tabrc(cntxt, &tbl->cellval, fname)) STACK_ERROR;

	lea	eax, DWORD PTR _fname$70567[ebp]
	push	eax
	mov	ecx, DWORD PTR _tbl$70561[ebp]
	add	ecx, 240				; 000000f0H
	push	ecx
	mov	edx, DWORD PTR _cntxt$[ebp]
	push	edx
	call	_file_write_tabrc
	add	esp, 12					; 0000000cH
	test	eax, eax
	je	SHORT $L70585
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 266		; 0000010aH
	jmp	SHORT $eva_err$70334
$L70585:

; 267  : 			fprintf(f, "%s", fname);

	lea	ecx, DWORD PTR _fname$70567[ebp]
	push	ecx
	push	OFFSET FLAT:$SG70586
	mov	edx, DWORD PTR _f$[ebp]
	push	edx
	call	_fprintf
	add	esp, 12					; 0000000cH

; 268  : 			if(ictrl == form->nb_ctrl) form_free_ctrl(cntxt, ictrl);

	mov	eax, DWORD PTR _form$[ebp]
	mov	ecx, DWORD PTR _ictrl$70563[ebp]
	cmp	ecx, DWORD PTR [eax+4]
	jne	SHORT $L70587
	mov	edx, DWORD PTR _ictrl$70563[ebp]
	push	edx
	mov	eax, DWORD PTR _cntxt$[ebp]
	push	eax
	call	_form_free_ctrl
	add	esp, 8
$L70587:

; 270  : 		fprintf(f, "\n");

	push	OFFSET FLAT:$SG70588
	mov	ecx, DWORD PTR _f$[ebp]
	push	ecx
	call	_fprintf
	add	esp, 8

; 271  : 	}

	jmp	$L70428
$eva_noerr$70589:

; 272  : 
; 273  : 	RETURN_OK_CLEANUP;

	push	0
	push	OFFSET FLAT:$SG70590
	push	OFFSET FLAT:$SG70591
	mov	edx, DWORD PTR _cntxt$[ebp]
	push	edx
	call	_err_clear
	add	esp, 16					; 00000010H
$eva_err$70334:
	mov	eax, DWORD PTR _cntxt$[ebp]
	cmp	DWORD PTR [eax+29872], 0
	je	SHORT $L70592
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	edx, DWORD PTR [ecx+29900]
	push	edx
	push	OFFSET FLAT:$SG70593
	push	OFFSET FLAT:$SG70594
	mov	eax, DWORD PTR _cntxt$[ebp]
	push	eax
	call	_err_add_context
	add	esp, 16					; 00000010H
$L70592:
	lea	ecx, DWORD PTR _symbol$[ebp]
	push	ecx
	call	_dyntab_free
	add	esp, 4
	lea	edx, DWORD PTR _vartype$[ebp]
	push	edx
	call	_dyntab_free
	add	esp, 4
	lea	eax, DWORD PTR _varval$[ebp]
	push	eax
	call	_dyntab_free
	add	esp, 4
	lea	ecx, DWORD PTR _objtype$[ebp]
	push	ecx
	call	_dyntab_free
	add	esp, 4
	lea	edx, DWORD PTR _listobj$[ebp]
	push	edx
	call	_dyntab_free
	add	esp, 4
	lea	eax, DWORD PTR _fieldexpr$[ebp]
	push	eax
	call	_dyntab_free
	add	esp, 4
	lea	ecx, DWORD PTR _inputobj$[ebp]
	push	ecx
	call	_dyntab_free
	add	esp, 4
	lea	edx, DWORD PTR _calcobj$[ebp]
	push	edx
	call	_dyntab_free
	add	esp, 4
	lea	eax, DWORD PTR _dataobj$[ebp]
	push	eax
	call	_dyntab_free
	add	esp, 4
	lea	ecx, DWORD PTR _tableobj$[ebp]
	push	ecx
	call	_dyntab_free
	add	esp, 4
	lea	edx, DWORD PTR _filterobj$[ebp]
	push	edx
	call	_dyntab_free
	add	esp, 4
	lea	eax, DWORD PTR _valmult$[ebp]
	push	eax
	call	_dyntab_free
	add	esp, 4
	lea	ecx, DWORD PTR _field$[ebp]
	push	ecx
	call	_dyntab_free
	add	esp, 4
	lea	edx, DWORD PTR _format$[ebp]
	push	edx
	call	_dyntab_free
	add	esp, 4
	lea	eax, DWORD PTR _obj$[ebp]
	push	eax
	call	_dyntab_free
	add	esp, 4
	lea	ecx, DWORD PTR _data$[ebp]
	push	ecx
	call	_dyntab_free
	add	esp, 4
	mov	edx, DWORD PTR _buf$[ebp]
	push	edx
	call	_mem_free
	add	esp, 4
	mov	DWORD PTR _buf$[ebp], 0
	lea	eax, DWORD PTR _flt$[ebp]
	push	eax
	call	_qry_build_free
	add	esp, 4
	mov	ecx, DWORD PTR _cntxt$[ebp]
	xor	eax, eax
	cmp	DWORD PTR [ecx+29872], 0
	setne	al

; 274  : }

	pop	edi
	mov	esp, ebp
	pop	ebp
	ret	0
_proc_output_params ENDP
_TEXT	ENDS
PUBLIC	_result_data
EXTRN	_cgi_set_field_values:NEAR
EXTRN	_mem_alloc:NEAR
EXTRN	_mem_realloc:NEAR
EXTRN	_qry_add_new_idobj:NEAR
EXTRN	_qry_add_val:NEAR
EXTRN	_strncmp:NEAR
_BSS	SEGMENT
	ALIGN	4

$SG70677 DB	01H DUP (?)
_BSS	ENDS
_DATA	SEGMENT
	ORG $+1
$SG70619 DB	'IdObj', 00H
	ORG $+2
$SG70623 DB	'IdForm', 00H
	ORG $+1
$SG70627 DB	'NewObj', 00H
	ORG $+1
$SG70635 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70645 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70654 DB	'Rel', 00H
$SG70666 DB	'Obj', 00H
$SG70669 DB	'Set', 00H
$SG70673 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70675 DB	'Set', 00H
$SG70676 DB	'_EVA_REPLACE', 00H
	ORG $+3
$SG70679 DB	'D:\Travail\ABI\EVA\V4.0\CGI\Brunix-2016\action_launchpro'
	DB	'c.c', 00H
$SG70680 DB	'result_data', 00H
$SG70682 DB	'D:\Travail\ABI\EVA\V4.0\CGI\Brunix-2016\action_launchpro'
	DB	'c.c', 00H
$SG70683 DB	'result_data', 00H
_DATA	ENDS
_TEXT	SEGMENT
_end$70656 = -140
_newobj$70658 = -136
_numobj$70659 = -144
_cntxt$ = 8
_res$ = 12
_form$ = -4
_data$ = -32
_i$ = -36
_idobj$ = -8
_idform$ = -40
_obj$ = -44
_sz_obj$ = -12
_mode$70617 = -48
_numobj$70628 = -52
_size1$70632 = -56
_incr$70640 = -60
_newobj$70641 = -64
_v$70649 = -132
_c$70650 = -128
_result_data PROC NEAR

; 288  : ){

	push	ebp
	mov	ebp, esp
	sub	esp, 152				; 00000098H
	push	edi

; 289  : 	EVA_form *form = cntxt->form;

	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	ecx, DWORD PTR [eax+80]
	mov	DWORD PTR _form$[ebp], ecx

; 290  : 	DynTable data = { 0 };

	mov	DWORD PTR _data$[ebp], 0
	xor	edx, edx
	mov	DWORD PTR _data$[ebp+4], edx
	mov	DWORD PTR _data$[ebp+8], edx
	mov	DWORD PTR _data$[ebp+12], edx
	mov	DWORD PTR _data$[ebp+16], edx

; 291  : 	unsigned long i;
; 292  : 	unsigned long idobj = DYNTAB_TOUL(&form->id_obj);

	push	10					; 0000000aH
	push	0
	push	0
	push	0
	mov	eax, DWORD PTR _form$[ebp]
	add	eax, 32					; 00000020H
	push	eax
	call	_dyntab_val
	add	esp, 12					; 0000000cH
	push	eax
	call	_strtoul
	add	esp, 12					; 0000000cH
	mov	DWORD PTR _idobj$[ebp], eax

; 293  : 	unsigned long idform = DYNTAB_TOUL(&form->id_form);

	push	10					; 0000000aH
	push	0
	push	0
	push	0
	mov	ecx, DWORD PTR _form$[ebp]
	add	ecx, 12					; 0000000cH
	push	ecx
	call	_dyntab_val
	add	esp, 12					; 0000000cH
	push	eax
	call	_strtoul
	add	esp, 12					; 0000000cH
	mov	DWORD PTR _idform$[ebp], eax

; 294  : 	unsigned long *obj = NULL, sz_obj = 0;

	mov	DWORD PTR _obj$[ebp], 0
	mov	DWORD PTR _sz_obj$[ebp], 0

; 295  : 
; 296  : 	/* For each result line */
; 297  : 	for(i = 1; i < res->nbrows; i++)

	mov	DWORD PTR _i$[ebp], 1
	jmp	SHORT $L70614
$L70615:
	mov	edx, DWORD PTR _i$[ebp]
	add	edx, 1
	mov	DWORD PTR _i$[ebp], edx
$L70614:
	mov	eax, DWORD PTR _res$[ebp]
	mov	ecx, DWORD PTR _i$[ebp]
	cmp	ecx, DWORD PTR [eax]
	jae	$eva_noerr$70678

; 299  : 		/* Handle operation mode */
; 300  : 		char *mode = dyntab_val(res, i, 0);

	push	0
	mov	edx, DWORD PTR _i$[ebp]
	push	edx
	mov	eax, DWORD PTR _res$[ebp]
	push	eax
	call	_dyntab_val
	add	esp, 12					; 0000000cH
	mov	DWORD PTR _mode$70617[ebp], eax

; 301  : 		if(!strcmp(mode, "IdObj"))

	push	OFFSET FLAT:$SG70619
	mov	ecx, DWORD PTR _mode$70617[ebp]
	push	ecx
	call	_strcmp
	add	esp, 8
	test	eax, eax
	jne	SHORT $L70618

; 302  : 			/* Set updated object */
; 303  : 			idobj = DYNTAB_TOULRC(res, i, 1);

	push	10					; 0000000aH
	push	0
	push	1
	mov	edx, DWORD PTR _i$[ebp]
	push	edx
	mov	eax, DWORD PTR _res$[ebp]
	push	eax
	call	_dyntab_val
	add	esp, 12					; 0000000cH
	push	eax
	call	_strtoul
	add	esp, 12					; 0000000cH
	mov	DWORD PTR _idobj$[ebp], eax

; 304  : 		else if(!strcmp(mode, "IdForm"))

	jmp	$L70674
$L70618:
	push	OFFSET FLAT:$SG70623
	mov	ecx, DWORD PTR _mode$70617[ebp]
	push	ecx
	call	_strcmp
	add	esp, 8
	test	eax, eax
	jne	SHORT $L70622

; 305  : 			/* Set updated CGI form */
; 306  : 			idform = DYNTAB_TOULRC(res, i, 1);

	push	10					; 0000000aH
	push	0
	push	1
	mov	edx, DWORD PTR _i$[ebp]
	push	edx
	mov	eax, DWORD PTR _res$[ebp]
	push	eax
	call	_dyntab_val
	add	esp, 12					; 0000000cH
	push	eax
	call	_strtoul
	add	esp, 12					; 0000000cH
	mov	DWORD PTR _idform$[ebp], eax

; 307  : 		else if(!strcmp(mode, "NewObj"))

	jmp	$L70674
$L70622:
	push	OFFSET FLAT:$SG70627
	mov	ecx, DWORD PTR _mode$70617[ebp]
	push	ecx
	call	_strcmp
	add	esp, 8
	test	eax, eax
	jne	$L70626

; 309  : 			/* Create new object */
; 310  : 			unsigned long numobj = DYNTAB_TOULRC(res, i, 1);

	push	10					; 0000000aH
	push	0
	push	1
	mov	edx, DWORD PTR _i$[ebp]
	push	edx
	mov	eax, DWORD PTR _res$[ebp]
	push	eax
	call	_dyntab_val
	add	esp, 12					; 0000000cH
	push	eax
	call	_strtoul
	add	esp, 12					; 0000000cH
	mov	DWORD PTR _numobj$70628[ebp], eax

; 311  : 			idform = DYNTAB_TOULRC(res, i, 2);

	push	10					; 0000000aH
	push	0
	push	2
	mov	ecx, DWORD PTR _i$[ebp]
	push	ecx
	mov	edx, DWORD PTR _res$[ebp]
	push	edx
	call	_dyntab_val
	add	esp, 12					; 0000000cH
	push	eax
	call	_strtoul
	add	esp, 12					; 0000000cH
	mov	DWORD PTR _idform$[ebp], eax

; 312  : 			if(!sz_obj)

	cmp	DWORD PTR _sz_obj$[ebp], 0
	jne	SHORT $L70631

; 314  : 				sz_obj = (numobj > 100 ? numobj : 100);

	cmp	DWORD PTR _numobj$70628[ebp], 100	; 00000064H
	jbe	SHORT $L71198
	mov	eax, DWORD PTR _numobj$70628[ebp]
	mov	DWORD PTR -148+[ebp], eax
	jmp	SHORT $L71199
$L71198:
	mov	DWORD PTR -148+[ebp], 100		; 00000064H
$L71199:
	mov	ecx, DWORD PTR -148+[ebp]
	mov	DWORD PTR _sz_obj$[ebp], ecx

; 315  : 				M_ALLOC(obj, sz_obj * sizeof(*obj));

	mov	edx, DWORD PTR _sz_obj$[ebp]
	shl	edx, 2
	mov	DWORD PTR _size1$70632[ebp], edx
	mov	eax, DWORD PTR _size1$70632[ebp]
	push	eax
	call	_mem_alloc
	add	esp, 4
	mov	DWORD PTR _obj$[ebp], eax
	cmp	DWORD PTR _size1$70632[ebp], 0
	je	SHORT $L70633
	cmp	DWORD PTR _obj$[ebp], 0
	jne	SHORT $L70633
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29872], OFFSET FLAT:$SG70635
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 315		; 0000013bH
	jmp	$eva_err$70636
$L70633:

; 317  : 			else if(sz_obj <= numobj)

	jmp	SHORT $L70639
$L70631:
	mov	eax, DWORD PTR _sz_obj$[ebp]
	cmp	eax, DWORD PTR _numobj$70628[ebp]
	ja	SHORT $L70639

; 319  : 				unsigned long incr = numobj - sz_obj, *newobj;

	mov	ecx, DWORD PTR _numobj$70628[ebp]
	sub	ecx, DWORD PTR _sz_obj$[ebp]
	mov	DWORD PTR _incr$70640[ebp], ecx

; 320  : 				if(incr < 100) incr = 100;

	cmp	DWORD PTR _incr$70640[ebp], 100		; 00000064H
	jae	SHORT $L70642
	mov	DWORD PTR _incr$70640[ebp], 100		; 00000064H
$L70642:

; 321  : 				newobj = mem_realloc(obj, sz_obj * sizeof(*obj), incr * sizeof(*obj));

	mov	edx, DWORD PTR _incr$70640[ebp]
	shl	edx, 2
	push	edx
	mov	eax, DWORD PTR _sz_obj$[ebp]
	shl	eax, 2
	push	eax
	mov	ecx, DWORD PTR _obj$[ebp]
	push	ecx
	call	_mem_realloc
	add	esp, 12					; 0000000cH
	mov	DWORD PTR _newobj$70641[ebp], eax

; 322  : 				if(!newobj) RETURN_ERR_MEMORY(NOP);

	cmp	DWORD PTR _newobj$70641[ebp], 0
	jne	SHORT $L70643
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29872], OFFSET FLAT:$SG70645
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 322		; 00000142H
	jmp	$eva_err$70636
$L70643:

; 323  : 				obj = newobj;

	mov	ecx, DWORD PTR _newobj$70641[ebp]
	mov	DWORD PTR _obj$[ebp], ecx

; 324  : 				sz_obj += incr;

	mov	edx, DWORD PTR _sz_obj$[ebp]
	add	edx, DWORD PTR _incr$70640[ebp]
	mov	DWORD PTR _sz_obj$[ebp], edx
$L70639:

; 326  : 			if(qry_add_new_idobj(cntxt, &idobj, idform)) STACK_ERROR;

	mov	eax, DWORD PTR _idform$[ebp]
	push	eax
	lea	ecx, DWORD PTR _idobj$[ebp]
	push	ecx
	mov	edx, DWORD PTR _cntxt$[ebp]
	push	edx
	call	_qry_add_new_idobj
	add	esp, 12					; 0000000cH
	test	eax, eax
	je	SHORT $L70647
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 326		; 00000146H
	jmp	$eva_err$70636
$L70647:

; 327  : 			obj[numobj] = idobj;

	mov	ecx, DWORD PTR _numobj$70628[ebp]
	mov	edx, DWORD PTR _obj$[ebp]
	mov	eax, DWORD PTR _idobj$[ebp]
	mov	DWORD PTR [edx+ecx*4], eax

; 329  : 		else

	jmp	$L70674
$L70626:

; 331  : 			DynTableCell *v = dyntab_cell(res, i, 2), c = { 0 };

	push	2
	mov	ecx, DWORD PTR _i$[ebp]
	push	ecx
	mov	edx, DWORD PTR _res$[ebp]
	push	edx
	call	_dyntab_cell
	add	esp, 12					; 0000000cH
	mov	DWORD PTR _v$70649[ebp], eax
	mov	DWORD PTR _c$70650[ebp], 0
	mov	ecx, 15					; 0000000fH
	xor	eax, eax
	lea	edi, DWORD PTR _c$70650[ebp+4]
	rep stosd

; 332  : 			c.txt = v->txt;

	mov	eax, DWORD PTR _v$70649[ebp]
	mov	ecx, DWORD PTR [eax]
	mov	DWORD PTR _c$70650[ebp], ecx

; 333  : 			c.len = v->len;

	mov	edx, DWORD PTR _v$70649[ebp]
	mov	eax, DWORD PTR [edx+4]
	mov	DWORD PTR _c$70650[ebp+4], eax

; 334  : 			c.field = dyntab_val(res, i, 1);

	push	1
	mov	ecx, DWORD PTR _i$[ebp]
	push	ecx
	mov	edx, DWORD PTR _res$[ebp]
	push	edx
	call	_dyntab_val
	add	esp, 12					; 0000000cH
	mov	DWORD PTR _c$70650[ebp+8], eax

; 335  : 			c.Num = DYNTAB_TOULRC(res, i, 3);

	push	10					; 0000000aH
	push	0
	push	3
	mov	eax, DWORD PTR _i$[ebp]
	push	eax
	mov	ecx, DWORD PTR _res$[ebp]
	push	ecx
	call	_dyntab_val
	add	esp, 12					; 0000000cH
	push	eax
	call	_strtoul
	add	esp, 12					; 0000000cH
	mov	DWORD PTR _c$70650[ebp+36], eax

; 336  : 			c.Line = DYNTAB_TOULRC(res, i, 4);

	push	10					; 0000000aH
	push	0
	push	4
	mov	edx, DWORD PTR _i$[ebp]
	push	edx
	mov	eax, DWORD PTR _res$[ebp]
	push	eax
	call	_dyntab_val
	add	esp, 12					; 0000000cH
	push	eax
	call	_strtoul
	add	esp, 12					; 0000000cH
	mov	DWORD PTR _c$70650[ebp+40], eax

; 337  : 			c.IdObj = idobj;

	mov	ecx, DWORD PTR _idobj$[ebp]
	mov	DWORD PTR _c$70650[ebp+20], ecx

; 338  : 			c.b_relation = (char) !strncmp(mode + 6, add_sz_str("Rel"));

	push	3
	push	OFFSET FLAT:$SG70654
	mov	edx, DWORD PTR _mode$70617[ebp]
	add	edx, 6
	push	edx
	call	_strncmp
	add	esp, 12					; 0000000cH
	neg	eax
	sbb	eax, eax
	inc	eax
	mov	BYTE PTR _c$70650[ebp+12], al

; 339  : 			/* Handle reference to new object */
; 340  : 			if(c.b_relation && c.txt[0] == '#')

	movsx	eax, BYTE PTR _c$70650[ebp+12]
	test	eax, eax
	je	$L70655
	mov	ecx, DWORD PTR _c$70650[ebp]
	movsx	edx, BYTE PTR [ecx]
	cmp	edx, 35					; 00000023H
	jne	$L70655

; 342  : 				char *end = NULL;

	mov	DWORD PTR _end$70656[ebp], 0

; 343  : 				unsigned long newobj = 0, numobj = strtoul(c.txt + 1, &end, 10);

	mov	DWORD PTR _newobj$70658[ebp], 0
	push	10					; 0000000aH
	lea	eax, DWORD PTR _end$70656[ebp]
	push	eax
	mov	ecx, DWORD PTR _c$70650[ebp]
	add	ecx, 1
	push	ecx
	call	_strtoul
	add	esp, 12					; 0000000cH
	mov	DWORD PTR _numobj$70659[ebp], eax

; 344  : 				if(!end || *end || !c.txt[1]) continue;

	cmp	DWORD PTR _end$70656[ebp], 0
	je	SHORT $L70661
	mov	edx, DWORD PTR _end$70656[ebp]
	movsx	eax, BYTE PTR [edx]
	test	eax, eax
	jne	SHORT $L70661
	mov	ecx, DWORD PTR _c$70650[ebp]
	movsx	edx, BYTE PTR [ecx+1]
	test	edx, edx
	jne	SHORT $L70660
$L70661:
	jmp	$L70615
$L70660:

; 345  : 				if(numobj < sz_obj) newobj = obj[numobj];

	mov	eax, DWORD PTR _numobj$70659[ebp]
	cmp	eax, DWORD PTR _sz_obj$[ebp]
	jae	SHORT $L70662
	mov	ecx, DWORD PTR _numobj$70659[ebp]
	mov	edx, DWORD PTR _obj$[ebp]
	mov	eax, DWORD PTR [edx+ecx*4]
	mov	DWORD PTR _newobj$70658[ebp], eax
$L70662:

; 346  : 				if(!newobj) continue;

	cmp	DWORD PTR _newobj$70658[ebp], 0
	jne	SHORT $L70663
	jmp	$L70615
$L70663:

; 347  : 				c.IdValue = newobj;

	mov	ecx, DWORD PTR _newobj$70658[ebp]
	mov	DWORD PTR _c$70650[ebp+32], ecx

; 348  : 				c.len = 0;

	mov	DWORD PTR _c$70650[ebp+4], 0

; 349  : 				c.txt = NULL;

	mov	DWORD PTR _c$70650[ebp], 0
$L70655:

; 351  : 			if(!strncmp(mode + 3, add_sz_str("Obj")))

	push	3
	push	OFFSET FLAT:$SG70666
	mov	edx, DWORD PTR _mode$70617[ebp]
	add	edx, 3
	push	edx
	call	_strncmp
	add	esp, 12					; 0000000cH
	test	eax, eax
	jne	SHORT $L70665

; 353  : 				if(qry_add_val(cntxt, &c, strncmp(mode, add_sz_str("Set")) ? 2 : 3, NULL)) STACK_ERROR;

	push	0
	push	3
	push	OFFSET FLAT:$SG70669
	mov	eax, DWORD PTR _mode$70617[ebp]
	push	eax
	call	_strncmp
	add	esp, 12					; 0000000cH
	neg	eax
	sbb	eax, eax
	add	eax, 3
	push	eax
	lea	ecx, DWORD PTR _c$70650[ebp]
	push	ecx
	mov	edx, DWORD PTR _cntxt$[ebp]
	push	edx
	call	_qry_add_val
	add	esp, 16					; 00000010H
	test	eax, eax
	je	SHORT $L70668
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 353		; 00000161H
	jmp	$eva_err$70636
$L70668:

; 355  : 			else

	jmp	$L70674
$L70665:

; 357  : 				DYNTAB_SET_CELLP(&data, 0, 0, &c);

	push	0
	lea	ecx, DWORD PTR _c$70650[ebp]
	push	ecx
	push	0
	push	0
	lea	edx, DWORD PTR _data$[ebp]
	push	edx
	call	_dyntab_copy
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L70671
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29872], OFFSET FLAT:$SG70673
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 357		; 00000165H
	jmp	$eva_err$70636
$L70671:

; 358  : 				if(cgi_set_field_values(cntxt, idform, idobj,
; 359  : 					DYNTAB_VAL_SZ(res, i, 1), &data,
; 360  : 					!strncmp(mode, add_sz_str("Set")) ? "_EVA_REPLACE" : "", 0)) STACK_ERROR;

	push	3
	push	OFFSET FLAT:$SG70675
	mov	edx, DWORD PTR _mode$70617[ebp]
	push	edx
	call	_strncmp
	add	esp, 12					; 0000000cH
	test	eax, eax
	jne	SHORT $L71200
	mov	DWORD PTR -152+[ebp], OFFSET FLAT:$SG70676
	jmp	SHORT $L71201
$L71200:
	mov	DWORD PTR -152+[ebp], OFFSET FLAT:$SG70677
$L71201:
	push	0
	mov	eax, DWORD PTR -152+[ebp]
	push	eax
	lea	ecx, DWORD PTR _data$[ebp]
	push	ecx
	push	1
	mov	edx, DWORD PTR _i$[ebp]
	push	edx
	mov	eax, DWORD PTR _res$[ebp]
	push	eax
	call	_dyntab_sz
	add	esp, 12					; 0000000cH
	push	eax
	push	1
	mov	ecx, DWORD PTR _i$[ebp]
	push	ecx
	mov	edx, DWORD PTR _res$[ebp]
	push	edx
	call	_dyntab_val
	add	esp, 12					; 0000000cH
	push	eax
	mov	eax, DWORD PTR _idobj$[ebp]
	push	eax
	mov	ecx, DWORD PTR _idform$[ebp]
	push	ecx
	mov	edx, DWORD PTR _cntxt$[ebp]
	push	edx
	call	_cgi_set_field_values
	add	esp, 32					; 00000020H
	test	eax, eax
	je	SHORT $L70674
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 360		; 00000168H
	jmp	SHORT $eva_err$70636
$L70674:

; 363  : 	}

	jmp	$L70615
$eva_noerr$70678:

; 364  : 
; 365  : 	RETURN_OK_CLEANUP;

	push	0
	push	OFFSET FLAT:$SG70679
	push	OFFSET FLAT:$SG70680
	mov	ecx, DWORD PTR _cntxt$[ebp]
	push	ecx
	call	_err_clear
	add	esp, 16					; 00000010H
$eva_err$70636:
	mov	edx, DWORD PTR _cntxt$[ebp]
	cmp	DWORD PTR [edx+29872], 0
	je	SHORT $L70681
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	ecx, DWORD PTR [eax+29900]
	push	ecx
	push	OFFSET FLAT:$SG70682
	push	OFFSET FLAT:$SG70683
	mov	edx, DWORD PTR _cntxt$[ebp]
	push	edx
	call	_err_add_context
	add	esp, 16					; 00000010H
$L70681:
	lea	eax, DWORD PTR _data$[ebp]
	push	eax
	call	_dyntab_free
	add	esp, 4
	mov	ecx, DWORD PTR _obj$[ebp]
	push	ecx
	call	_mem_free
	add	esp, 4
	mov	DWORD PTR _obj$[ebp], 0
	mov	edx, DWORD PTR _cntxt$[ebp]
	xor	eax, eax
	cmp	DWORD PTR [edx+29872], 0
	setne	al

; 366  : }

	pop	edi
	mov	esp, ebp
	pop	ebp
	ret	0
_result_data ENDP
_TEXT	ENDS
PUBLIC	_result_file
PUBLIC	__real@4@4008fa00000000000000
EXTRN	_getpid:NEAR
EXTRN	_basename:NEAR
EXTRN	_rename:NEAR
EXTRN	_sprintf:NEAR
EXTRN	_file_compatible_name:NEAR
EXTRN	_clock:NEAR
EXTRN	_file_output_link:NEAR
EXTRN	_time:NEAR
EXTRN	_get_id_value:NEAR
EXTRN	_plain_to_html:BYTE
EXTRN	__fltused:NEAR
EXTRN	_dynbuf_add3:NEAR
EXTRN	_qry_update_idobj_idfield:NEAR
EXTRN	_qry_add_obj_data:NEAR
EXTRN	_dyntab_add:NEAR
EXTRN	_strlen:NEAR
EXTRN	_dyntab_set_txt:NEAR
EXTRN	_strrchr:NEAR
EXTRN	_dyntab_field_val:NEAR
EXTRN	_dyntab_field_cell:NEAR
_BSS	SEGMENT
	ALIGN	4

$SG70713 DB	01H DUP (?)
	ALIGN	4

$SG70838 DB	01H DUP (?)
	ALIGN	4

$SG70892 DB	01H DUP (?)
	ALIGN	4

$SG70914 DB	01H DUP (?)
	ALIGN	4

$SG70921 DB	01H DUP (?)
	ALIGN	4

$SG70927 DB	01H DUP (?)
_BSS	ENDS
_DATA	SEGMENT
$SG70707 DB	'_EVA_FORM_FILEPROC', 00H
	ORG $+1
$SG70714 DB	'%.*s-%uX%X%s', 00H
	ORG $+3
$SG70716 DB	'_EVA_FILE_SERVER_NAME', 00H
	ORG $+2
$SG70718 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70723 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70725 DB	'V', 00H
	ORG $+2
$SG70727 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70729 DB	'1', 00H
	ORG $+2
$SG70731 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70733 DB	'_EVA_FILE_CLIENT_PATH', 00H
	ORG $+2
$SG70735 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70738 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70740 DB	'V', 00H
	ORG $+2
$SG70742 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70744 DB	'1', 00H
	ORG $+2
$SG70746 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70748 DB	'_EVA_FILE_SIZE', 00H
	ORG $+1
$SG70750 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70754 DB	'%lu', 00H
$SG70758 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70760 DB	'V', 00H
	ORG $+2
$SG70762 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70764 DB	'1', 00H
	ORG $+2
$SG70766 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70768 DB	'_EVA_PROC_DURATION', 00H
	ORG $+1
$SG70770 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70774 DB	'%1.2f', 00H
	ORG $+2
$SG70778 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70780 DB	'V', 00H
	ORG $+2
$SG70782 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70784 DB	'1', 00H
	ORG $+2
$SG70786 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70788 DB	'_EVA_OBJ', 00H
	ORG $+3
$SG70790 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70793 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70795 DB	'R', 00H
	ORG $+2
$SG70797 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70799 DB	'1', 00H
	ORG $+2
$SG70801 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70803 DB	'_EVA_CTRL', 00H
	ORG $+2
$SG70805 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70808 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70810 DB	'R', 00H
	ORG $+2
$SG70812 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70814 DB	'1', 00H
	ORG $+2
$SG70816 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70818 DB	'_EVA_FORM', 00H
	ORG $+2
$SG70820 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70823 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70825 DB	'R', 00H
	ORG $+2
$SG70827 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70829 DB	'1', 00H
	ORG $+2
$SG70831 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70834 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70837 DB	'_EVA_SAVE', 00H
	ORG $+2
$SG70841 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70844 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70846 DB	'R', 00H
	ORG $+2
$SG70848 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70850 DB	'1', 00H
	ORG $+2
$SG70852 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70857 DB	'_EVA_REPLACE', 00H
	ORG $+3
$SG70858 DB	'%sdocs\%s\%s', 00H
	ORG $+3
$SG70861 DB	'%s', 00H
	ORG $+1
$SG70862 DB	'%sdocs\%s\%s\%s', 00H
$SG70865 DB	'Error during rename', 0aH, 'src:', 00H
	ORG $+3
$SG70868 DB	0aH, 'dest:', 00H
	ORG $+1
$SG70870 DB	'Droits d''acc', 0e8H, 's incorrects sur un dossier', 00H
	ORG $+3
$SG70880 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70885 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70889 DB	'_EVA_REPLACE', 00H
	ORG $+3
$SG70891 DB	'_EVA_SAVE', 00H
	ORG $+2
$SG70898 DB	' - ', 00H
$SG70899 DB	'<font face=Arial><center><font size=+1><hr><b>', 00H
	ORG $+1
$SG70901 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70904 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70907 DB	'</font><br><br>Traitement termin', 0e9H, ' avec succ', 0e8H
	DB	's</b></center><hr>', 00H
	ORG $+1
$SG70909 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70913 DB	'<hr>', 00H
	ORG $+3
$SG70916 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70920 DB	'<hr>', 00H
	ORG $+3
$SG70923 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70926 DB	'_EVA_SAVE', 00H
	ORG $+2
$SG70928 DB	'#docs', 00H
	ORG $+2
$SG70929 DB	'#user', 00H
	ORG $+2
$SG70930 DB	'Fichier r', 0e9H, 'sultat : ', 00H
$SG70933 DB	'<br><br>', 00H
	ORG $+3
$SG70935 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70937 DB	'D:\Travail\ABI\EVA\V4.0\CGI\Brunix-2016\action_launchpro'
	DB	'c.c', 00H
$SG70938 DB	'result_file', 00H
$SG70940 DB	'D:\Travail\ABI\EVA\V4.0\CGI\Brunix-2016\action_launchpro'
	DB	'c.c', 00H
$SG70941 DB	'result_file', 00H
_DATA	ENDS
;	COMDAT __real@4@4008fa00000000000000
; File D:\Travail\ABI\EVA\V4.0\CGI\Brunix-2016\action_launchproc.c
CONST	SEGMENT
__real@4@4008fa00000000000000 DD 0447a0000r	; 1000
CONST	ENDS
_TEXT	SEGMENT
_cntxt$ = 8
_i_ctrl$ = 12
_res$ = 16
_form$ = -24
_ctrl$ = -2384
_id_obj$ = -2368
_id_form$ = -20
_data$ = -2348
_filename$ = -2328
_fpath$ = -2072
_sz$ = -2380
_i$ = -2372
_j$ = -2376
_fileproc$70706 = -2396
_bname$70708 = -2388
_ext$70709 = -2392
_fs$70751 = -2496
_size$70752 = -2460
_t$70771 = -2500
_dur$70772 = -2564
_result_file PROC NEAR

; 382  : ){

	push	ebp
	mov	ebp, esp
	sub	esp, 2592				; 00000a20H
	push	edi

; 383  : 	EVA_form *form = cntxt->form;

	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	ecx, DWORD PTR [eax+80]
	mov	DWORD PTR _form$[ebp], ecx

; 384  : 	EVA_ctrl *ctrl = form->ctrl + i_ctrl;

	mov	edx, DWORD PTR _i_ctrl$[ebp]
	imul	edx, 480				; 000001e0H
	mov	eax, DWORD PTR _form$[ebp]
	mov	ecx, DWORD PTR [eax]
	add	ecx, edx
	mov	DWORD PTR _ctrl$[ebp], ecx

; 385  : 	DynTable id_obj = { 0 };

	mov	DWORD PTR _id_obj$[ebp], 0
	xor	edx, edx
	mov	DWORD PTR _id_obj$[ebp+4], edx
	mov	DWORD PTR _id_obj$[ebp+8], edx
	mov	DWORD PTR _id_obj$[ebp+12], edx
	mov	DWORD PTR _id_obj$[ebp+16], edx

; 386  : 	DynTable id_form = { 0 };

	mov	DWORD PTR _id_form$[ebp], 0
	xor	eax, eax
	mov	DWORD PTR _id_form$[ebp+4], eax
	mov	DWORD PTR _id_form$[ebp+8], eax
	mov	DWORD PTR _id_form$[ebp+12], eax
	mov	DWORD PTR _id_form$[ebp+16], eax

; 387  : 	DynTable data = { 0 };

	mov	DWORD PTR _data$[ebp], 0
	xor	ecx, ecx
	mov	DWORD PTR _data$[ebp+4], ecx
	mov	DWORD PTR _data$[ebp+8], ecx
	mov	DWORD PTR _data$[ebp+12], ecx
	mov	DWORD PTR _data$[ebp+16], ecx

; 388  : 	char filename[256] = {0};

	mov	BYTE PTR _filename$[ebp], 0
	mov	ecx, 63					; 0000003fH
	xor	eax, eax
	lea	edi, DWORD PTR _filename$[ebp+1]
	rep stosd
	stosw
	stosb

; 389  : 	char fpath[2048] = {0};

	mov	BYTE PTR _fpath$[ebp], 0
	mov	ecx, 511				; 000001ffH
	xor	eax, eax
	lea	edi, DWORD PTR _fpath$[ebp+1]
	rep stosd
	stosw
	stosb

; 390  : 	size_t sz = 0;

	mov	DWORD PTR _sz$[ebp], 0

; 391  : 	unsigned long i, j;
; 392  : 
; 393  : 	/* If result field given */
; 394  : 	if(dyntab_sz(res, 1,0))

	push	0
	push	1
	mov	edx, DWORD PTR _res$[ebp]
	push	edx
	call	_dyntab_sz
	add	esp, 12					; 0000000cH
	test	eax, eax
	je	$L70705

; 396  : 		/* Build unique file name based on original file name*/
; 397  : 		DynTableCell *fileproc = DYNTAB_FIELD_CELL(&cntxt->cnf_data, FORM_FILEPROC);

	push	0
	push	-1
	push	OFFSET FLAT:$SG70707
	mov	eax, DWORD PTR _cntxt$[ebp]
	add	eax, 29360				; 000072b0H
	push	eax
	call	_dyntab_field_cell
	add	esp, 16					; 00000010H
	mov	DWORD PTR _fileproc$70706[ebp], eax

; 398  : 		char *bname = basename(DYNTAB_VAL_SZ(res, 1, 2));

	push	2
	push	1
	mov	ecx, DWORD PTR _res$[ebp]
	push	ecx
	call	_dyntab_sz
	add	esp, 12					; 0000000cH
	push	eax
	push	2
	push	1
	mov	edx, DWORD PTR _res$[ebp]
	push	edx
	call	_dyntab_val
	add	esp, 12					; 0000000cH
	push	eax
	call	_basename
	add	esp, 8
	mov	DWORD PTR _bname$70708[ebp], eax

; 399  : 		char *ext = strrchr(bname, '.');

	push	46					; 0000002eH
	mov	eax, DWORD PTR _bname$70708[ebp]
	push	eax
	call	_strrchr
	add	esp, 8
	mov	DWORD PTR _ext$70709[ebp], eax

; 400  : 		sz = strlen(bname) - (ext ? strlen(ext) : 0);

	cmp	DWORD PTR _ext$70709[ebp], 0
	je	SHORT $L71203
	mov	ecx, DWORD PTR _ext$70709[ebp]
	push	ecx
	call	_strlen
	add	esp, 4
	mov	DWORD PTR -2568+[ebp], eax
	jmp	SHORT $L71204
$L71203:
	mov	DWORD PTR -2568+[ebp], 0
$L71204:
	mov	edx, DWORD PTR _bname$70708[ebp]
	push	edx
	call	_strlen
	add	esp, 4
	sub	eax, DWORD PTR -2568+[ebp]
	mov	DWORD PTR _sz$[ebp], eax

; 401  : 		snprintf(add_sz_str(filename), "%.*s-%uX%X%s", (int)sz, bname, (unsigned int)time(NULL), getpid(), ext ? ext : "");

	cmp	DWORD PTR _ext$70709[ebp], 0
	je	SHORT $L71205
	mov	eax, DWORD PTR _ext$70709[ebp]
	mov	DWORD PTR -2572+[ebp], eax
	jmp	SHORT $L71206
$L71205:
	mov	DWORD PTR -2572+[ebp], OFFSET FLAT:$SG70713
$L71206:
	mov	ecx, DWORD PTR -2572+[ebp]
	push	ecx
	call	_getpid
	push	eax
	push	0
	call	_time
	add	esp, 4
	push	eax
	mov	edx, DWORD PTR _bname$70708[ebp]
	push	edx
	mov	eax, DWORD PTR _sz$[ebp]
	push	eax
	push	OFFSET FLAT:$SG70714
	push	255					; 000000ffH
	lea	ecx, DWORD PTR _filename$[ebp]
	push	ecx
	call	__snprintf
	add	esp, 32					; 00000020H

; 402  : 		sz = file_compatible_name(filename);

	lea	edx, DWORD PTR _filename$[ebp]
	push	edx
	call	_file_compatible_name
	add	esp, 4
	mov	DWORD PTR _sz$[ebp], eax

; 403  : 
; 404  : 		/* Create object data for result */
; 405  : 		DYNTAB_SET(&data, 0, 0, "_EVA_FILE_SERVER_NAME");

	push	21					; 00000015H
	push	OFFSET FLAT:$SG70716
	push	0
	push	0
	lea	eax, DWORD PTR _data$[ebp]
	push	eax
	call	_dyntab_set_txt
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L70715
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29872], OFFSET FLAT:$SG70718
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 405		; 00000195H
	jmp	$eva_err$70719
$L70715:

; 406  : 		DYNTAB_ADD(&data, 0, 1, filename, sz, NO_CONV);

	push	0
	push	0
	mov	eax, DWORD PTR _sz$[ebp]
	push	eax
	lea	ecx, DWORD PTR _filename$[ebp]
	push	ecx
	push	1
	push	0
	lea	edx, DWORD PTR _data$[ebp]
	push	edx
	call	_dyntab_add
	add	esp, 28					; 0000001cH
	test	eax, eax
	je	SHORT $L70721
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29872], OFFSET FLAT:$SG70723
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 406		; 00000196H
	jmp	$eva_err$70719
$L70721:

; 407  : 		DYNTAB_SET(&data, 0, 2, "V");

	push	1
	push	OFFSET FLAT:$SG70725
	push	2
	push	0
	lea	edx, DWORD PTR _data$[ebp]
	push	edx
	call	_dyntab_set_txt
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L70724
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29872], OFFSET FLAT:$SG70727
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 407		; 00000197H
	jmp	$eva_err$70719
$L70724:

; 408  : 		DYNTAB_SET(&data, 0, 3, "1");

	push	1
	push	OFFSET FLAT:$SG70729
	push	3
	push	0
	lea	edx, DWORD PTR _data$[ebp]
	push	edx
	call	_dyntab_set_txt
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L70728
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29872], OFFSET FLAT:$SG70731
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 408		; 00000198H
	jmp	$eva_err$70719
$L70728:

; 409  : 		DYNTAB_SET(&data, data.nbrows, 0, "_EVA_FILE_CLIENT_PATH");

	push	21					; 00000015H
	push	OFFSET FLAT:$SG70733
	push	0
	mov	edx, DWORD PTR _data$[ebp]
	push	edx
	lea	eax, DWORD PTR _data$[ebp]
	push	eax
	call	_dyntab_set_txt
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L70732
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29872], OFFSET FLAT:$SG70735
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 409		; 00000199H
	jmp	$eva_err$70719
$L70732:

; 410  : 		DYNTAB_ADD_CELL(&data, data.nbrows-1, 1, res, 1, 2);

	push	1
	push	2
	push	1
	mov	eax, DWORD PTR _res$[ebp]
	push	eax
	call	_dyntab_cell
	add	esp, 12					; 0000000cH
	push	eax
	push	1
	mov	ecx, DWORD PTR _data$[ebp]
	sub	ecx, 1
	push	ecx
	lea	edx, DWORD PTR _data$[ebp]
	push	edx
	call	_dyntab_copy
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L70736
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29872], OFFSET FLAT:$SG70738
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 410		; 0000019aH
	jmp	$eva_err$70719
$L70736:

; 411  : 		DYNTAB_SET(&data, data.nbrows-1, 2, "V");

	push	1
	push	OFFSET FLAT:$SG70740
	push	2
	mov	edx, DWORD PTR _data$[ebp]
	sub	edx, 1
	push	edx
	lea	eax, DWORD PTR _data$[ebp]
	push	eax
	call	_dyntab_set_txt
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L70739
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29872], OFFSET FLAT:$SG70742
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 411		; 0000019bH
	jmp	$eva_err$70719
$L70739:

; 412  : 		DYNTAB_SET(&data, data.nbrows-1, 3, "1");

	push	1
	push	OFFSET FLAT:$SG70744
	push	3
	mov	eax, DWORD PTR _data$[ebp]
	sub	eax, 1
	push	eax
	lea	ecx, DWORD PTR _data$[ebp]
	push	ecx
	call	_dyntab_set_txt
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L70743
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29872], OFFSET FLAT:$SG70746
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 412		; 0000019cH
	jmp	$eva_err$70719
$L70743:

; 413  : 		DYNTAB_SET(&data, data.nbrows, 0, "_EVA_FILE_SIZE");

	push	14					; 0000000eH
	push	OFFSET FLAT:$SG70748
	push	0
	mov	ecx, DWORD PTR _data$[ebp]
	push	ecx
	lea	edx, DWORD PTR _data$[ebp]
	push	edx
	call	_dyntab_set_txt
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L70747
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29872], OFFSET FLAT:$SG70750
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 413		; 0000019dH
	jmp	$eva_err$70719
$L70747:

; 415  : 			struct stat fs;
; 416  : 			char size[64];
; 417  : 			stat(dyntab_val(res, 1, 1), &fs);

	lea	edx, DWORD PTR _fs$70751[ebp]
	push	edx
	push	1
	push	1
	mov	eax, DWORD PTR _res$[ebp]
	push	eax
	call	_dyntab_val
	add	esp, 12					; 0000000cH
	push	eax
	call	_stat
	add	esp, 8

; 418  : 			sprintf(size, "%lu", (unsigned long)fs.st_size);

	mov	ecx, DWORD PTR _fs$70751[ebp+20]
	push	ecx
	push	OFFSET FLAT:$SG70754
	lea	edx, DWORD PTR _size$70752[ebp]
	push	edx
	call	_sprintf
	add	esp, 12					; 0000000cH

; 419  : 			DYNTAB_ADD(&data, data.nbrows-1, 1, size, 0, NO_CONV);

	push	0
	push	0
	push	0
	lea	eax, DWORD PTR _size$70752[ebp]
	push	eax
	push	1
	mov	ecx, DWORD PTR _data$[ebp]
	sub	ecx, 1
	push	ecx
	lea	edx, DWORD PTR _data$[ebp]
	push	edx
	call	_dyntab_add
	add	esp, 28					; 0000001cH
	test	eax, eax
	je	SHORT $L70756
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29872], OFFSET FLAT:$SG70758
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 419		; 000001a3H
	jmp	$eva_err$70719
$L70756:

; 421  : 		DYNTAB_SET(&data, data.nbrows-1, 2, "V");

	push	1
	push	OFFSET FLAT:$SG70760
	push	2
	mov	edx, DWORD PTR _data$[ebp]
	sub	edx, 1
	push	edx
	lea	eax, DWORD PTR _data$[ebp]
	push	eax
	call	_dyntab_set_txt
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L70759
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29872], OFFSET FLAT:$SG70762
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 421		; 000001a5H
	jmp	$eva_err$70719
$L70759:

; 422  : 		DYNTAB_SET(&data, data.nbrows-1, 3, "1");

	push	1
	push	OFFSET FLAT:$SG70764
	push	3
	mov	eax, DWORD PTR _data$[ebp]
	sub	eax, 1
	push	eax
	lea	ecx, DWORD PTR _data$[ebp]
	push	ecx
	call	_dyntab_set_txt
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L70763
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29872], OFFSET FLAT:$SG70766
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 422		; 000001a6H
	jmp	$eva_err$70719
$L70763:

; 423  : 		DYNTAB_SET(&data, data.nbrows, 0, "_EVA_PROC_DURATION");

	push	18					; 00000012H
	push	OFFSET FLAT:$SG70768
	push	0
	mov	ecx, DWORD PTR _data$[ebp]
	push	ecx
	lea	edx, DWORD PTR _data$[ebp]
	push	edx
	call	_dyntab_set_txt
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L70767
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29872], OFFSET FLAT:$SG70770
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 423		; 000001a7H
	jmp	$eva_err$70719
$L70767:

; 425  : 			clock_t t = clock();

	call	_clock
	mov	DWORD PTR _t$70771[ebp], eax

; 426  : 			char dur[64];
; 427  : 			sprintf(dur, "%1.2f", (float)t/CLOCKS_PER_SEC);

	fild	DWORD PTR _t$70771[ebp]
	fdiv	DWORD PTR __real@4@4008fa00000000000000
	sub	esp, 8
	fstp	QWORD PTR [esp]
	push	OFFSET FLAT:$SG70774
	lea	edx, DWORD PTR _dur$70772[ebp]
	push	edx
	call	_sprintf
	add	esp, 16					; 00000010H

; 428  : 			DYNTAB_ADD(&data, data.nbrows-1, 1, dur, 0, NO_CONV);

	push	0
	push	0
	push	0
	lea	eax, DWORD PTR _dur$70772[ebp]
	push	eax
	push	1
	mov	ecx, DWORD PTR _data$[ebp]
	sub	ecx, 1
	push	ecx
	lea	edx, DWORD PTR _data$[ebp]
	push	edx
	call	_dyntab_add
	add	esp, 28					; 0000001cH
	test	eax, eax
	je	SHORT $L70776
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29872], OFFSET FLAT:$SG70778
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 428		; 000001acH
	jmp	$eva_err$70719
$L70776:

; 430  : 		DYNTAB_SET(&data, data.nbrows-1, 2, "V");

	push	1
	push	OFFSET FLAT:$SG70780
	push	2
	mov	edx, DWORD PTR _data$[ebp]
	sub	edx, 1
	push	edx
	lea	eax, DWORD PTR _data$[ebp]
	push	eax
	call	_dyntab_set_txt
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L70779
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29872], OFFSET FLAT:$SG70782
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 430		; 000001aeH
	jmp	$eva_err$70719
$L70779:

; 431  : 		DYNTAB_SET(&data, data.nbrows-1, 3, "1");

	push	1
	push	OFFSET FLAT:$SG70784
	push	3
	mov	eax, DWORD PTR _data$[ebp]
	sub	eax, 1
	push	eax
	lea	ecx, DWORD PTR _data$[ebp]
	push	ecx
	call	_dyntab_set_txt
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L70783
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29872], OFFSET FLAT:$SG70786
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 431		; 000001afH
	jmp	$eva_err$70719
$L70783:

; 432  : 		DYNTAB_SET(&data, data.nbrows, 0, "_EVA_OBJ");

	push	8
	push	OFFSET FLAT:$SG70788
	push	0
	mov	ecx, DWORD PTR _data$[ebp]
	push	ecx
	lea	edx, DWORD PTR _data$[ebp]
	push	edx
	call	_dyntab_set_txt
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L70787
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29872], OFFSET FLAT:$SG70790
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 432		; 000001b0H
	jmp	$eva_err$70719
$L70787:

; 433  : 		DYNTAB_ADD_CELL(&data, data.nbrows-1, 1, &form->id_obj, 0, 0);

	push	1
	push	0
	push	0
	mov	edx, DWORD PTR _form$[ebp]
	add	edx, 32					; 00000020H
	push	edx
	call	_dyntab_cell
	add	esp, 12					; 0000000cH
	push	eax
	push	1
	mov	eax, DWORD PTR _data$[ebp]
	sub	eax, 1
	push	eax
	lea	ecx, DWORD PTR _data$[ebp]
	push	ecx
	call	_dyntab_copy
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L70791
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29872], OFFSET FLAT:$SG70793
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 433		; 000001b1H
	jmp	$eva_err$70719
$L70791:

; 434  : 		DYNTAB_SET(&data, data.nbrows-1, 2, "R");

	push	1
	push	OFFSET FLAT:$SG70795
	push	2
	mov	ecx, DWORD PTR _data$[ebp]
	sub	ecx, 1
	push	ecx
	lea	edx, DWORD PTR _data$[ebp]
	push	edx
	call	_dyntab_set_txt
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L70794
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29872], OFFSET FLAT:$SG70797
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 434		; 000001b2H
	jmp	$eva_err$70719
$L70794:

; 435  : 		DYNTAB_SET(&data, data.nbrows-1, 3, "1");

	push	1
	push	OFFSET FLAT:$SG70799
	push	3
	mov	edx, DWORD PTR _data$[ebp]
	sub	edx, 1
	push	edx
	lea	eax, DWORD PTR _data$[ebp]
	push	eax
	call	_dyntab_set_txt
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L70798
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29872], OFFSET FLAT:$SG70801
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 435		; 000001b3H
	jmp	$eva_err$70719
$L70798:

; 436  : 		DYNTAB_SET(&data, data.nbrows, 0, "_EVA_CTRL");

	push	9
	push	OFFSET FLAT:$SG70803
	push	0
	mov	eax, DWORD PTR _data$[ebp]
	push	eax
	lea	ecx, DWORD PTR _data$[ebp]
	push	ecx
	call	_dyntab_set_txt
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L70802
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29872], OFFSET FLAT:$SG70805
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 436		; 000001b4H
	jmp	$eva_err$70719
$L70802:

; 437  : 		DYNTAB_ADD_CELL(&data, data.nbrows-1, 1, &ctrl->id, 0, 0);

	push	1
	push	0
	push	0
	mov	ecx, DWORD PTR _ctrl$[ebp]
	push	ecx
	call	_dyntab_cell
	add	esp, 12					; 0000000cH
	push	eax
	push	1
	mov	edx, DWORD PTR _data$[ebp]
	sub	edx, 1
	push	edx
	lea	eax, DWORD PTR _data$[ebp]
	push	eax
	call	_dyntab_copy
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L70806
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29872], OFFSET FLAT:$SG70808
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 437		; 000001b5H
	jmp	$eva_err$70719
$L70806:

; 438  : 		DYNTAB_SET(&data, data.nbrows-1, 2, "R");

	push	1
	push	OFFSET FLAT:$SG70810
	push	2
	mov	eax, DWORD PTR _data$[ebp]
	sub	eax, 1
	push	eax
	lea	ecx, DWORD PTR _data$[ebp]
	push	ecx
	call	_dyntab_set_txt
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L70809
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29872], OFFSET FLAT:$SG70812
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 438		; 000001b6H
	jmp	$eva_err$70719
$L70809:

; 439  : 		DYNTAB_SET(&data, data.nbrows-1, 3, "1");

	push	1
	push	OFFSET FLAT:$SG70814
	push	3
	mov	ecx, DWORD PTR _data$[ebp]
	sub	ecx, 1
	push	ecx
	lea	edx, DWORD PTR _data$[ebp]
	push	edx
	call	_dyntab_set_txt
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L70813
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29872], OFFSET FLAT:$SG70816
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 439		; 000001b7H
	jmp	$eva_err$70719
$L70813:

; 440  : 		DYNTAB_SET(&data, data.nbrows, 0, "_EVA_FORM");

	push	9
	push	OFFSET FLAT:$SG70818
	push	0
	mov	edx, DWORD PTR _data$[ebp]
	push	edx
	lea	eax, DWORD PTR _data$[ebp]
	push	eax
	call	_dyntab_set_txt
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L70817
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29872], OFFSET FLAT:$SG70820
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 440		; 000001b8H
	jmp	$eva_err$70719
$L70817:

; 441  : 		DYNTAB_ADD_CELL(&data, data.nbrows-1, 1, &form->ctrl->id, 0, 0);

	push	1
	push	0
	push	0
	mov	eax, DWORD PTR _form$[ebp]
	mov	ecx, DWORD PTR [eax]
	push	ecx
	call	_dyntab_cell
	add	esp, 12					; 0000000cH
	push	eax
	push	1
	mov	edx, DWORD PTR _data$[ebp]
	sub	edx, 1
	push	edx
	lea	eax, DWORD PTR _data$[ebp]
	push	eax
	call	_dyntab_copy
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L70821
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29872], OFFSET FLAT:$SG70823
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 441		; 000001b9H
	jmp	$eva_err$70719
$L70821:

; 442  : 		DYNTAB_SET(&data, data.nbrows-1, 2, "R");

	push	1
	push	OFFSET FLAT:$SG70825
	push	2
	mov	eax, DWORD PTR _data$[ebp]
	sub	eax, 1
	push	eax
	lea	ecx, DWORD PTR _data$[ebp]
	push	ecx
	call	_dyntab_set_txt
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L70824
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29872], OFFSET FLAT:$SG70827
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 442		; 000001baH
	jmp	$eva_err$70719
$L70824:

; 443  : 		DYNTAB_SET(&data, data.nbrows-1, 3, "1");

	push	1
	push	OFFSET FLAT:$SG70829
	push	3
	mov	ecx, DWORD PTR _data$[ebp]
	sub	ecx, 1
	push	ecx
	lea	edx, DWORD PTR _data$[ebp]
	push	edx
	call	_dyntab_set_txt
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L70828
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29872], OFFSET FLAT:$SG70831
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 443		; 000001bbH
	jmp	$eva_err$70719
$L70828:

; 444  : 
; 445  : 		/* Create new object with file description */
; 446  : 		DYNTAB_SET_CELLP(&id_form, 0, 0, fileproc);

	push	0
	mov	edx, DWORD PTR _fileproc$70706[ebp]
	push	edx
	push	0
	push	0
	lea	eax, DWORD PTR _id_form$[ebp]
	push	eax
	call	_dyntab_copy
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L70832
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29872], OFFSET FLAT:$SG70834
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 446		; 000001beH
	jmp	$eva_err$70719
$L70832:

; 447  : 		if(qry_add_obj_data(cntxt, &id_obj, &data, &id_form, 0))

	push	0
	lea	eax, DWORD PTR _id_form$[ebp]
	push	eax
	lea	ecx, DWORD PTR _data$[ebp]
	push	ecx
	lea	edx, DWORD PTR _id_obj$[ebp]
	push	edx
	mov	eax, DWORD PTR _cntxt$[ebp]
	push	eax
	call	_qry_add_obj_data
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L70835

; 448  : 			STACK_ERROR;

	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 448		; 000001c0H
	jmp	$eva_err$70719
$L70835:

; 449  : 
; 450  : 		/* If object was saved : add add reference to file object in DB */
; 451  : 		if(*CTRL_ATTR_VAL(SAVE))

	cmp	DWORD PTR _ctrl$[ebp], 0
	je	SHORT $L71207
	push	0
	push	-1
	push	OFFSET FLAT:$SG70837
	mov	edx, DWORD PTR _ctrl$[ebp]
	add	edx, 44					; 0000002cH
	push	edx
	call	_dyntab_field_val
	add	esp, 16					; 00000010H
	mov	DWORD PTR -2576+[ebp], eax
	jmp	SHORT $L71208
$L71207:
	mov	DWORD PTR -2576+[ebp], OFFSET FLAT:$SG70838
$L71208:
	mov	eax, DWORD PTR -2576+[ebp]
	movsx	ecx, BYTE PTR [eax]
	test	ecx, ecx
	je	$L70853

; 453  : 			dyntab_free(&data);

	lea	edx, DWORD PTR _data$[ebp]
	push	edx
	call	_dyntab_free
	add	esp, 4

; 454  : 			DYNTAB_ADD_CELL(&data, 0, 0, res, 1, 0);

	push	1
	push	0
	push	1
	mov	eax, DWORD PTR _res$[ebp]
	push	eax
	call	_dyntab_cell
	add	esp, 12					; 0000000cH
	push	eax
	push	0
	push	0
	lea	ecx, DWORD PTR _data$[ebp]
	push	ecx
	call	_dyntab_copy
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L70839
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29872], OFFSET FLAT:$SG70841
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 454		; 000001c6H
	jmp	$eva_err$70719
$L70839:

; 455  : 			DYNTAB_ADD_CELL(&data, 0, 1, &id_obj, 0, 0);

	push	1
	push	0
	push	0
	lea	ecx, DWORD PTR _id_obj$[ebp]
	push	ecx
	call	_dyntab_cell
	add	esp, 12					; 0000000cH
	push	eax
	push	1
	push	0
	lea	edx, DWORD PTR _data$[ebp]
	push	edx
	call	_dyntab_copy
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L70842
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29872], OFFSET FLAT:$SG70844
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 455		; 000001c7H
	jmp	$eva_err$70719
$L70842:

; 456  : 			DYNTAB_SET(&data, 0, 2, "R");

	push	1
	push	OFFSET FLAT:$SG70846
	push	2
	push	0
	lea	edx, DWORD PTR _data$[ebp]
	push	edx
	call	_dyntab_set_txt
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L70845
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29872], OFFSET FLAT:$SG70848
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 456		; 000001c8H
	jmp	$eva_err$70719
$L70845:

; 457  : 			DYNTAB_SET(&data, 0, 3, "1");

	push	1
	push	OFFSET FLAT:$SG70850
	push	3
	push	0
	lea	edx, DWORD PTR _data$[ebp]
	push	edx
	call	_dyntab_set_txt
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L70849
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29872], OFFSET FLAT:$SG70852
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 457		; 000001c9H
	jmp	$eva_err$70719
$L70849:

; 458  : 			if(qry_add_obj_data(cntxt, &form->id_obj, &data, &id_form, 1))

	push	1
	lea	edx, DWORD PTR _id_form$[ebp]
	push	edx
	lea	eax, DWORD PTR _data$[ebp]
	push	eax
	mov	ecx, DWORD PTR _form$[ebp]
	add	ecx, 32					; 00000020H
	push	ecx
	mov	edx, DWORD PTR _cntxt$[ebp]
	push	edx
	call	_qry_add_obj_data
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L70853

; 459  : 				STACK_ERROR;

	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 459		; 000001cbH
	jmp	$eva_err$70719
$L70853:

; 461  : 
; 462  : 		/* Add relation to file object in given field */
; 463  : 		if(cgi_set_field_values(cntxt, DYNTAB_TOUL(&form->id_form), DYNTAB_TOUL(&form->id_obj),
; 464  : 								DYNTAB_VAL_SZ(res, 1, 0), &id_obj, "_EVA_REPLACE", 0)) STACK_ERROR;

	push	0
	push	OFFSET FLAT:$SG70857
	lea	ecx, DWORD PTR _id_obj$[ebp]
	push	ecx
	push	0
	push	1
	mov	edx, DWORD PTR _res$[ebp]
	push	edx
	call	_dyntab_sz
	add	esp, 12					; 0000000cH
	push	eax
	push	0
	push	1
	mov	eax, DWORD PTR _res$[ebp]
	push	eax
	call	_dyntab_val
	add	esp, 12					; 0000000cH
	push	eax
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
	push	eax
	push	10					; 0000000aH
	push	0
	push	0
	push	0
	mov	edx, DWORD PTR _form$[ebp]
	add	edx, 12					; 0000000cH
	push	edx
	call	_dyntab_val
	add	esp, 12					; 0000000cH
	push	eax
	call	_strtoul
	add	esp, 12					; 0000000cH
	push	eax
	mov	eax, DWORD PTR _cntxt$[ebp]
	push	eax
	call	_cgi_set_field_values
	add	esp, 32					; 00000020H
	test	eax, eax
	je	SHORT $L70856
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 464		; 000001d0H
	jmp	$eva_err$70719
$L70856:

; 465  : 
; 466  : 		/* Set result file in docs directory */
; 467  : 		snprintf(fpath, sizeof(fpath)-1, "%s" DIRECTORY_DOCS "\\%s\\%s",
; 468  : 				cntxt->rootdir, cntxt->dbname, filename);

	lea	edx, DWORD PTR _filename$[ebp]
	push	edx
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	ecx, DWORD PTR [eax+29804]
	push	ecx
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	eax, DWORD PTR [edx+29724]
	push	eax
	push	OFFSET FLAT:$SG70858
	push	2047					; 000007ffH
	lea	ecx, DWORD PTR _fpath$[ebp]
	push	ecx
	call	__snprintf
	add	esp, 24					; 00000018H

; 470  : 	else if(dyntab_sz(res, 1, 1))

	jmp	$L70860
$L70705:
	push	1
	push	1
	mov	edx, DWORD PTR _res$[ebp]
	push	edx
	call	_dyntab_sz
	add	esp, 12					; 0000000cH
	test	eax, eax
	je	$L70860

; 472  : 		/* No result field : set result file to user directory */
; 473  : 		snprintf(add_sz_str(filename), "%s", dyntab_val(res, 1, 2));

	push	2
	push	1
	mov	eax, DWORD PTR _res$[ebp]
	push	eax
	call	_dyntab_val
	add	esp, 12					; 0000000cH
	push	eax
	push	OFFSET FLAT:$SG70861
	push	255					; 000000ffH
	lea	ecx, DWORD PTR _filename$[ebp]
	push	ecx
	call	__snprintf
	add	esp, 16					; 00000010H

; 474  : 		sz = file_compatible_name(filename);

	lea	edx, DWORD PTR _filename$[ebp]
	push	edx
	call	_file_compatible_name
	add	esp, 4
	mov	DWORD PTR _sz$[ebp], eax

; 475  : 		snprintf(add_sz_str(fpath), "%s" DIRECTORY_DOCS "\\%s\\%s\\%s",
; 476  : 				cntxt->rootdir, cntxt->dbname, dyntab_val(&cntxt->id_user, 0, 0), filename);

	lea	eax, DWORD PTR _filename$[ebp]
	push	eax
	push	0
	push	0
	mov	ecx, DWORD PTR _cntxt$[ebp]
	add	ecx, 29408				; 000072e0H
	push	ecx
	call	_dyntab_val
	add	esp, 12					; 0000000cH
	push	eax
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	eax, DWORD PTR [edx+29804]
	push	eax
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	edx, DWORD PTR [ecx+29724]
	push	edx
	push	OFFSET FLAT:$SG70862
	push	2047					; 000007ffH
	lea	eax, DWORD PTR _fpath$[ebp]
	push	eax
	call	__snprintf
	add	esp, 28					; 0000001cH

; 477  : 		remove(fpath);

	lea	ecx, DWORD PTR _fpath$[ebp]
	push	ecx
	call	_remove
	add	esp, 4
$L70860:

; 479  : 
; 480  : 	/* Move result file to destination directory */
; 481  : 	if(dyntab_sz(res, 1, 1) &&
; 482  : 		rename(dyntab_val(res, 1, 1), fpath))

	push	1
	push	1
	mov	edx, DWORD PTR _res$[ebp]
	push	edx
	call	_dyntab_sz
	add	esp, 12					; 0000000cH
	test	eax, eax
	je	$L70863
	lea	eax, DWORD PTR _fpath$[ebp]
	push	eax
	push	1
	push	1
	mov	ecx, DWORD PTR _res$[ebp]
	push	ecx
	call	_dyntab_val
	add	esp, 12					; 0000000cH
	push	eax
	call	_rename
	add	esp, 8
	test	eax, eax
	je	$L70863

; 483  : 		RETURN_ERR_DIRECTORY({ERR_PUT_CELL("Error during rename\nsrc:", res, 1, 1); ERR_PUT_TXT("\ndest:", fpath, 0)});

	push	0
	push	0
	push	24					; 00000018H
	push	OFFSET FLAT:$SG70865
	mov	edx, DWORD PTR _cntxt$[ebp]
	add	edx, 29876				; 000074b4H
	push	edx
	call	_dynbuf_add
	add	esp, 20					; 00000014H
	push	0
	push	0
	push	1
	push	1
	mov	eax, DWORD PTR _res$[ebp]
	push	eax
	call	_dyntab_sz
	add	esp, 12					; 0000000cH
	push	eax
	push	1
	push	1
	mov	ecx, DWORD PTR _res$[ebp]
	push	ecx
	call	_dyntab_val
	add	esp, 12					; 0000000cH
	push	eax
	mov	edx, DWORD PTR _cntxt$[ebp]
	add	edx, 29876				; 000074b4H
	push	edx
	call	_dynbuf_add
	add	esp, 20					; 00000014H
	push	0
	push	0
	push	6
	push	OFFSET FLAT:$SG70868
	mov	eax, DWORD PTR _cntxt$[ebp]
	add	eax, 29876				; 000074b4H
	push	eax
	call	_dynbuf_add
	add	esp, 20					; 00000014H
	push	0
	push	0
	push	0
	lea	ecx, DWORD PTR _fpath$[ebp]
	push	ecx
	mov	edx, DWORD PTR _cntxt$[ebp]
	add	edx, 29876				; 000074b4H
	push	edx
	call	_dynbuf_add
	add	esp, 20					; 00000014H
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29872], OFFSET FLAT:$SG70870
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 483		; 000001e3H
	jmp	$eva_err$70719
$L70863:

; 484  : 
; 485  : 	/* Following lines are field values : process each field */
; 486  : 	for(i = 2; i < res->nbrows; i++)

	mov	DWORD PTR _i$[ebp], 2
	jmp	SHORT $L70871
$L70872:
	mov	edx, DWORD PTR _i$[ebp]
	add	edx, 1
	mov	DWORD PTR _i$[ebp], edx
$L70871:
	mov	eax, DWORD PTR _res$[ebp]
	mov	ecx, DWORD PTR _i$[ebp]
	cmp	ecx, DWORD PTR [eax]
	jae	$L70873

; 488  : 		DYNTAB_FREE(data);

	lea	edx, DWORD PTR _data$[ebp]
	push	edx
	call	_dyntab_free
	add	esp, 4

; 489  : 		for(j = 1; j < res->nbcols; j++) if(dyntab_sz(res, i, j)) DYNTAB_SET_CELL(&data, data.nbrows, 0, res, i, j);

	mov	DWORD PTR _j$[ebp], 1
	jmp	SHORT $L70874
$L70875:
	mov	eax, DWORD PTR _j$[ebp]
	add	eax, 1
	mov	DWORD PTR _j$[ebp], eax
$L70874:
	mov	ecx, DWORD PTR _res$[ebp]
	mov	edx, DWORD PTR _j$[ebp]
	cmp	edx, DWORD PTR [ecx+8]
	jae	SHORT $L70876
	mov	eax, DWORD PTR _j$[ebp]
	push	eax
	mov	ecx, DWORD PTR _i$[ebp]
	push	ecx
	mov	edx, DWORD PTR _res$[ebp]
	push	edx
	call	_dyntab_sz
	add	esp, 12					; 0000000cH
	test	eax, eax
	je	SHORT $L70878
	push	0
	mov	eax, DWORD PTR _j$[ebp]
	push	eax
	mov	ecx, DWORD PTR _i$[ebp]
	push	ecx
	mov	edx, DWORD PTR _res$[ebp]
	push	edx
	call	_dyntab_cell
	add	esp, 12					; 0000000cH
	push	eax
	push	0
	mov	eax, DWORD PTR _data$[ebp]
	push	eax
	lea	ecx, DWORD PTR _data$[ebp]
	push	ecx
	call	_dyntab_copy
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L70878
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29872], OFFSET FLAT:$SG70880
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 489		; 000001e9H
	jmp	$eva_err$70719
$L70878:
	jmp	$L70875
$L70876:

; 490  : 		if(!data.nbrows) DYNTAB_ADD_CELLP(&data, 0, 0, NULL);

	cmp	DWORD PTR _data$[ebp], 0
	jne	SHORT $L70883
	push	1
	push	0
	push	0
	push	0
	lea	ecx, DWORD PTR _data$[ebp]
	push	ecx
	call	_dyntab_copy
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L70883
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29872], OFFSET FLAT:$SG70885
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 490		; 000001eaH
	jmp	$eva_err$70719
$L70883:

; 491  : 		if(cgi_set_field_values(cntxt, DYNTAB_TOUL(&form->id_form), DYNTAB_TOUL(&form->id_obj),
; 492  : 								DYNTAB_VAL_SZ(res, i, 0), &data, "_EVA_REPLACE", 0)) STACK_ERROR;

	push	0
	push	OFFSET FLAT:$SG70889
	lea	ecx, DWORD PTR _data$[ebp]
	push	ecx
	push	0
	mov	edx, DWORD PTR _i$[ebp]
	push	edx
	mov	eax, DWORD PTR _res$[ebp]
	push	eax
	call	_dyntab_sz
	add	esp, 12					; 0000000cH
	push	eax
	push	0
	mov	ecx, DWORD PTR _i$[ebp]
	push	ecx
	mov	edx, DWORD PTR _res$[ebp]
	push	edx
	call	_dyntab_val
	add	esp, 12					; 0000000cH
	push	eax
	push	10					; 0000000aH
	push	0
	push	0
	push	0
	mov	eax, DWORD PTR _form$[ebp]
	add	eax, 32					; 00000020H
	push	eax
	call	_dyntab_val
	add	esp, 12					; 0000000cH
	push	eax
	call	_strtoul
	add	esp, 12					; 0000000cH
	push	eax
	push	10					; 0000000aH
	push	0
	push	0
	push	0
	mov	ecx, DWORD PTR _form$[ebp]
	add	ecx, 12					; 0000000cH
	push	ecx
	call	_dyntab_val
	add	esp, 12					; 0000000cH
	push	eax
	call	_strtoul
	add	esp, 12					; 0000000cH
	push	eax
	mov	edx, DWORD PTR _cntxt$[ebp]
	push	edx
	call	_cgi_set_field_values
	add	esp, 32					; 00000020H
	test	eax, eax
	je	SHORT $L70888
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 492		; 000001ecH
	jmp	$eva_err$70719
$L70888:

; 493  : 
; 494  : 		/* If object was saved : write in DB */
; 495  : 		if(*CTRL_ATTR_VAL(SAVE))

	cmp	DWORD PTR _ctrl$[ebp], 0
	je	SHORT $L71209
	push	0
	push	-1
	push	OFFSET FLAT:$SG70891
	mov	ecx, DWORD PTR _ctrl$[ebp]
	add	ecx, 44					; 0000002cH
	push	ecx
	call	_dyntab_field_val
	add	esp, 16					; 00000010H
	mov	DWORD PTR -2580+[ebp], eax
	jmp	SHORT $L71210
$L71209:
	mov	DWORD PTR -2580+[ebp], OFFSET FLAT:$SG70892
$L71210:
	mov	edx, DWORD PTR -2580+[ebp]
	movsx	eax, BYTE PTR [edx]
	test	eax, eax
	je	$L70894

; 497  : 			if(qry_update_idobj_idfield(cntxt, DYNTAB_TOUL(&form->id_obj),
; 498  : 					get_id_value(cntxt, DYNTAB_VAL_SZ(res, i, 0)), &data, 3)) STACK_ERROR;

	push	3
	lea	ecx, DWORD PTR _data$[ebp]
	push	ecx
	push	0
	mov	edx, DWORD PTR _i$[ebp]
	push	edx
	mov	eax, DWORD PTR _res$[ebp]
	push	eax
	call	_dyntab_sz
	add	esp, 12					; 0000000cH
	push	eax
	push	0
	mov	ecx, DWORD PTR _i$[ebp]
	push	ecx
	mov	edx, DWORD PTR _res$[ebp]
	push	edx
	call	_dyntab_val
	add	esp, 12					; 0000000cH
	push	eax
	mov	eax, DWORD PTR _cntxt$[ebp]
	push	eax
	call	_get_id_value
	add	esp, 12					; 0000000cH
	push	eax
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
	push	eax
	mov	edx, DWORD PTR _cntxt$[ebp]
	push	edx
	call	_qry_update_idobj_idfield
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L70894
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 498		; 000001f2H
	jmp	$eva_err$70719
$L70894:

; 500  : 	}

	jmp	$L70872
$L70873:

; 501  : 
; 502  : 	/* Display link to file if message or no output field given */
; 503  : 	if(dyntab_sz(res, 1, 1) && (!dyntab_sz(res, 1, 0) || dyntab_sz(res, 0, 1) || dyntab_sz(res, 0, 2)))

	push	1
	push	1
	mov	ecx, DWORD PTR _res$[ebp]
	push	ecx
	call	_dyntab_sz
	add	esp, 12					; 0000000cH
	test	eax, eax
	je	$L70932
	push	0
	push	1
	mov	edx, DWORD PTR _res$[ebp]
	push	edx
	call	_dyntab_sz
	add	esp, 12					; 0000000cH
	test	eax, eax
	je	SHORT $L70896
	push	1
	push	0
	mov	eax, DWORD PTR _res$[ebp]
	push	eax
	call	_dyntab_sz
	add	esp, 12					; 0000000cH
	test	eax, eax
	jne	SHORT $L70896
	push	2
	push	0
	mov	ecx, DWORD PTR _res$[ebp]
	push	ecx
	call	_dyntab_sz
	add	esp, 12					; 0000000cH
	test	eax, eax
	je	$L70932
$L70896:

; 506  : 				"<font face=Arial><center><font size=+1>"
; 507  : 				"<hr><b>", form->ctrl->LABEL, 0, TO_HTML, " - ");

	push	3
	push	OFFSET FLAT:$SG70898
	push	1
	push	OFFSET FLAT:_plain_to_html
	push	0
	mov	edx, DWORD PTR _form$[ebp]
	mov	eax, DWORD PTR [edx]
	mov	ecx, DWORD PTR [eax+284]
	push	ecx
	push	46					; 0000002eH
	push	OFFSET FLAT:$SG70899
	mov	edx, DWORD PTR _cntxt$[ebp]
	add	edx, 29784				; 00007458H
	push	edx
	call	_dynbuf_add3
	add	esp, 36					; 00000024H
	test	eax, eax
	je	SHORT $L70897
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29872], OFFSET FLAT:$SG70901
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 507		; 000001fbH
	jmp	$eva_err$70719
$L70897:

; 508  : 		DYNBUF_ADD(&cntxt->html, ctrl->LABEL, 0, TO_HTML);

	push	1
	push	OFFSET FLAT:_plain_to_html
	push	0
	mov	edx, DWORD PTR _ctrl$[ebp]
	mov	eax, DWORD PTR [edx+284]
	push	eax
	mov	ecx, DWORD PTR _cntxt$[ebp]
	add	ecx, 29784				; 00007458H
	push	ecx
	call	_dynbuf_add
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L70902
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29872], OFFSET FLAT:$SG70904
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 508		; 000001fcH
	jmp	$eva_err$70719
$L70902:

; 509  : 		DYNBUF_ADD_STR(&cntxt->html, "</font><br><br>Traitement terminé avec succès</b></center><hr>");

	push	0
	push	0
	push	62					; 0000003eH
	push	OFFSET FLAT:$SG70907
	mov	ecx, DWORD PTR _cntxt$[ebp]
	add	ecx, 29784				; 00007458H
	push	ecx
	call	_dynbuf_add
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L70906
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29872], OFFSET FLAT:$SG70909
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 509		; 000001fdH
	jmp	$eva_err$70719
$L70906:

; 510  : 		if(*dyntab_val(res, 0, 1) == '<')

	push	1
	push	0
	mov	ecx, DWORD PTR _res$[ebp]
	push	ecx
	call	_dyntab_val
	add	esp, 12					; 0000000cH
	movsx	edx, BYTE PTR [eax]
	cmp	edx, 60					; 0000003cH
	jne	SHORT $L70910

; 511  : 			DYNBUF_ADD3_CELL(&cntxt->html, "", res, 0, 1, NO_CONV, "<hr>")

	push	4
	push	OFFSET FLAT:$SG70913
	push	0
	push	0
	push	1
	push	0
	mov	eax, DWORD PTR _res$[ebp]
	push	eax
	call	_dyntab_sz
	add	esp, 12					; 0000000cH
	push	eax
	push	1
	push	0
	mov	ecx, DWORD PTR _res$[ebp]
	push	ecx
	call	_dyntab_val
	add	esp, 12					; 0000000cH
	push	eax
	push	0
	push	OFFSET FLAT:$SG70914
	mov	edx, DWORD PTR _cntxt$[ebp]
	add	edx, 29784				; 00007458H
	push	edx
	call	_dynbuf_add3
	add	esp, 36					; 00000024H
	test	eax, eax
	je	SHORT $L70912
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29872], OFFSET FLAT:$SG70916
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 511		; 000001ffH
	jmp	$eva_err$70719
$L70912:

; 512  : 		else if(dyntab_sz(res, 0, 1))

	jmp	$L70919
$L70910:
	push	1
	push	0
	mov	edx, DWORD PTR _res$[ebp]
	push	edx
	call	_dyntab_sz
	add	esp, 12					; 0000000cH
	test	eax, eax
	je	SHORT $L70919

; 513  : 			DYNBUF_ADD3_CELL(&cntxt->html, "", res, 0, 1, TO_HTML, "<hr>");

	push	4
	push	OFFSET FLAT:$SG70920
	push	1
	push	OFFSET FLAT:_plain_to_html
	push	1
	push	0
	mov	eax, DWORD PTR _res$[ebp]
	push	eax
	call	_dyntab_sz
	add	esp, 12					; 0000000cH
	push	eax
	push	1
	push	0
	mov	ecx, DWORD PTR _res$[ebp]
	push	ecx
	call	_dyntab_val
	add	esp, 12					; 0000000cH
	push	eax
	push	0
	push	OFFSET FLAT:$SG70921
	mov	edx, DWORD PTR _cntxt$[ebp]
	add	edx, 29784				; 00007458H
	push	edx
	call	_dynbuf_add3
	add	esp, 36					; 00000024H
	test	eax, eax
	je	SHORT $L70919
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29872], OFFSET FLAT:$SG70923
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 513		; 00000201H
	jmp	$eva_err$70719
$L70919:

; 514  : 		cntxt->b_terminate = 15;

	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29776], 15		; 0000000fH

; 515  : 		if(file_output_link(cntxt, &cntxt->html,
; 516  : 								add_sz_str("Fichier résultat : "),
; 517  : 								DYNTAB_VAL_SZ(res, 1, 2), filename, sz, dyntab_sz(res, 1, 0) ? "#docs" : "#user",
; 518  : 								NULL, 0, DYNTAB_VAL_SZ(res, 0, 2),
; 519  : 								6  | ((dyntab_sz(res, 0, 1) || dyntab_sz(res, 0, 2)) ? 0 : 1)
; 520  : 									| (*CTRL_ATTR_VAL(SAVE) ? 8 : 0))) STACK_ERROR;

	push	1
	push	0
	mov	eax, DWORD PTR _res$[ebp]
	push	eax
	call	_dyntab_sz
	add	esp, 12					; 0000000cH
	test	eax, eax
	jne	SHORT $L71211
	push	2
	push	0
	mov	ecx, DWORD PTR _res$[ebp]
	push	ecx
	call	_dyntab_sz
	add	esp, 12					; 0000000cH
	test	eax, eax
	jne	SHORT $L71211
	mov	DWORD PTR -2584+[ebp], 1
	jmp	SHORT $L71212
$L71211:
	mov	DWORD PTR -2584+[ebp], 0
$L71212:
	cmp	DWORD PTR _ctrl$[ebp], 0
	je	SHORT $L71213
	push	0
	push	-1
	push	OFFSET FLAT:$SG70926
	mov	edx, DWORD PTR _ctrl$[ebp]
	add	edx, 44					; 0000002cH
	push	edx
	call	_dyntab_field_val
	add	esp, 16					; 00000010H
	mov	DWORD PTR -2588+[ebp], eax
	jmp	SHORT $L71214
$L71213:
	mov	DWORD PTR -2588+[ebp], OFFSET FLAT:$SG70927
$L71214:
	push	0
	push	1
	mov	eax, DWORD PTR _res$[ebp]
	push	eax
	call	_dyntab_sz
	add	esp, 12					; 0000000cH
	test	eax, eax
	je	SHORT $L71215
	mov	DWORD PTR -2592+[ebp], OFFSET FLAT:$SG70928
	jmp	SHORT $L71216
$L71215:
	mov	DWORD PTR -2592+[ebp], OFFSET FLAT:$SG70929
$L71216:
	mov	ecx, DWORD PTR -2584+[ebp]
	or	ecx, 6
	mov	edx, DWORD PTR -2588+[ebp]
	movsx	eax, BYTE PTR [edx]
	neg	eax
	sbb	eax, eax
	and	eax, 8
	or	ecx, eax
	push	ecx
	push	2
	push	0
	mov	ecx, DWORD PTR _res$[ebp]
	push	ecx
	call	_dyntab_sz
	add	esp, 12					; 0000000cH
	push	eax
	push	2
	push	0
	mov	edx, DWORD PTR _res$[ebp]
	push	edx
	call	_dyntab_val
	add	esp, 12					; 0000000cH
	push	eax
	push	0
	push	0
	mov	eax, DWORD PTR -2592+[ebp]
	push	eax
	mov	ecx, DWORD PTR _sz$[ebp]
	push	ecx
	lea	edx, DWORD PTR _filename$[ebp]
	push	edx
	push	2
	push	1
	mov	eax, DWORD PTR _res$[ebp]
	push	eax
	call	_dyntab_sz
	add	esp, 12					; 0000000cH
	push	eax
	push	2
	push	1
	mov	ecx, DWORD PTR _res$[ebp]
	push	ecx
	call	_dyntab_val
	add	esp, 12					; 0000000cH
	push	eax
	push	19					; 00000013H
	push	OFFSET FLAT:$SG70930
	mov	edx, DWORD PTR _cntxt$[ebp]
	add	edx, 29784				; 00007458H
	push	edx
	mov	eax, DWORD PTR _cntxt$[ebp]
	push	eax
	call	_file_output_link
	add	esp, 56					; 00000038H
	test	eax, eax
	je	SHORT $L70925
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 520		; 00000208H
	jmp	SHORT $eva_err$70719
$L70925:

; 521  : 		DYNBUF_ADD_STR(&cntxt->html, "<br><br>");

	push	0
	push	0
	push	8
	push	OFFSET FLAT:$SG70933
	mov	edx, DWORD PTR _cntxt$[ebp]
	add	edx, 29784				; 00007458H
	push	edx
	call	_dynbuf_add
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L70932
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29872], OFFSET FLAT:$SG70935
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 521		; 00000209H
	jmp	SHORT $eva_err$70719
$L70932:
$eva_noerr$70936:

; 523  : 
; 524  : 	RETURN_OK_CLEANUP;

	push	0
	push	OFFSET FLAT:$SG70937
	push	OFFSET FLAT:$SG70938
	mov	edx, DWORD PTR _cntxt$[ebp]
	push	edx
	call	_err_clear
	add	esp, 16					; 00000010H
$eva_err$70719:
	mov	eax, DWORD PTR _cntxt$[ebp]
	cmp	DWORD PTR [eax+29872], 0
	je	SHORT $L70939
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	edx, DWORD PTR [ecx+29900]
	push	edx
	push	OFFSET FLAT:$SG70940
	push	OFFSET FLAT:$SG70941
	mov	eax, DWORD PTR _cntxt$[ebp]
	push	eax
	call	_err_add_context
	add	esp, 16					; 00000010H
$L70939:
	lea	ecx, DWORD PTR _data$[ebp]
	push	ecx
	call	_dyntab_free
	add	esp, 4
	lea	edx, DWORD PTR _id_obj$[ebp]
	push	edx
	call	_dyntab_free
	add	esp, 4
	lea	eax, DWORD PTR _id_form$[ebp]
	push	eax
	call	_dyntab_free
	add	esp, 4
	mov	ecx, DWORD PTR _cntxt$[ebp]
	xor	eax, eax
	cmp	DWORD PTR [ecx+29872], 0
	setne	al

; 525  : }

	pop	edi
	mov	esp, ebp
	pop	ebp
	ret	0
_result_file ENDP
_TEXT	ENDS
PUBLIC	_action_launchproc
EXTRN	_put_html_page_header:NEAR
EXTRN	_fclose:NEAR
EXTRN	_printf:NEAR
EXTRN	_file_to_dynbuf:NEAR
EXTRN	_file_read_tabrc:NEAR
EXTRN	_chdir_user_doc:NEAR
EXTRN	_dll_call:NEAR
EXTRN	_FactureAEMO:NEAR
EXTRN	_EcheancierAEMO:NEAR
EXTRN	_FactureTPS:NEAR
EXTRN	_EcheancierTPS:NEAR
EXTRN	_chdir:NEAR
EXTRN	_mkdir:NEAR
EXTRN	_rmdir:NEAR
EXTRN	_dyntab_to_dynbuf:NEAR
EXTRN	_form_btn_do_save:NEAR
_BSS	SEGMENT
	ALIGN	4

$SG70965 DB	01H DUP (?)
	ALIGN	4

$SG70976 DB	01H DUP (?)
	ALIGN	4

$SG70990 DB	01H DUP (?)
_BSS	ENDS
_DATA	SEGMENT
$SG70964 DB	'_EVA_PROCTYPE', 00H
	ORG $+2
$SG70968 DB	'_EVA_EXCEL', 00H
	ORG $+1
$SG70969 DB	'EXCEL', 00H
	ORG $+2
$SG70970 DB	'_EVA_WORD', 00H
	ORG $+2
$SG70971 DB	'WINWORD', 00H
$SG70972 DB	'_EVA_ACCESS', 00H
$SG70973 DB	'MSACCESS', 00H
	ORG $+3
$SG70975 DB	'_EVA_PROCNAME', 00H
	ORG $+2
$SG70987 DB	'_EVA_DLL', 00H
	ORG $+3
$SG70989 DB	'_EVA_DLLFILE', 00H
	ORG $+3
$SG70992 DB	'FactureAEMO', 00H
$SG70996 DB	'EcheancierAEMO', 00H
	ORG $+1
$SG71000 DB	'FactureTPS', 00H
	ORG $+1
$SG71004 DB	'EcheancierTPS', 00H
	ORG $+2
$SG71011 DB	'%X-%X', 00H
	ORG $+2
$SG71014 DB	'Droits d''acc', 0e8H, 's incorrects sur un dossier', 00H
	ORG $+3
$SG71015 DB	'proc', 00H
	ORG $+3
$SG71017 DB	'proc', 00H
	ORG $+3
$SG71019 DB	'Droits d''acc', 0e8H, 's incorrects sur un dossier', 00H
	ORG $+3
$SG71022 DB	'Droits d''acc', 0e8H, 's incorrects sur un dossier', 00H
	ORG $+3
$SG71023 DB	'wc', 00H
	ORG $+1
$SG71024 DB	'call.txt', 00H
	ORG $+3
$SG71027 DB	'Droits d''acc', 0e8H, 's incorrects sur un dossier', 00H
	ORG $+3
$SG71028 DB	'127.0.0.1', 0aH, 00H
	ORG $+1
$SG71029 DB	'%s', 0aH, 00H
$SG71030 DB	'%s', 0aH, 00H
$SG71031 DB	'%s', 0aH, 00H
$SG71032 DB	'%s', 0aH, 00H
$SG71033 DB	'%s', 0aH, 00H
$SG71034 DB	0aH, 00H
	ORG $+2
$SG71041 DB	'_EVA_INPUT', 00H
	ORG $+1
$SG71046 DB	'_EVA_INPUT', 00H
	ORG $+1
$SG71055 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG71056 DB	'%s', 09H, '%s', 09H, '%lu', 09H, '%lu', 0aH, 00H
	ORG $+1
$SG71059 DB	'%s\Office\%s.EXE', 00H
	ORG $+3
$SG71062 DB	0aH, 'Fichier programme non trouv', 0e9H, ' : ', 00H
	ORG $+3
$SG71064 DB	'Impossible de lancer le traitement', 00H
	ORG $+1
$SG71066 DB	'..\..\..\templates\%s\%s', 00H
	ORG $+3
$SG71068 DB	'..\..\..\templates\%s', 00H
	ORG $+2
$SG71071 DB	0aH, 'Fichier mod', 0e8H, 'le non trouv', 0e9H, ' : ', 00H
	ORG $+2
$SG71073 DB	'Impossible de lancer le traitement', 00H
	ORG $+1
$SG71074 DB	'COPY %s . >exe.txt 2>exeerr.txt', 00H
$SG71078 DB	'Erreur la pr', 0e9H, 'paration du traitement (copie proc'
	DB	0e9H, 'dure)', 00H
	ORG $+2
$SG71080 DB	'call "%s" "%s" >exe.txt 2>exeerr.txt', 00H
	ORG $+3
$SG71082 DB	'call "%s" >exe.txt 2>exeerr.txt', 00H
$SG71085 DB	'exeerr.txt', 00H
	ORG $+1
$SG71087 DB	'r', 00H
	ORG $+2
$SG71088 DB	'exeerr.txt', 00H
	ORG $+1
$SG71092 DB	0aH, 'exeerr : ', 00H
	ORG $+1
$SG71097 DB	'Erreur lors de l''appel du traitement', 00H
	ORG $+3
$SG71101 DB	'proc', 00H
	ORG $+3
$SG71103 DB	'Droits d''acc', 0e8H, 's incorrects sur un dossier', 00H
	ORG $+3
$SG71106 DB	'res.txt', 00H
$SG71108 DB	'_EVA_EXE', 00H
	ORG $+3
$SG71109 DB	'exe.txt', 00H
$SG71111 DB	'D:\Travail\ABI\EVA\V4.0\CGI\Brunix-2016\action_launchpro'
	DB	'c.c', 00H
$SG71112 DB	'action_launchproc', 00H
	ORG $+2
$SG71114 DB	'exe.txt', 00H
$SG71117 DB	'Le traitement n''a pas donn', 0e9H, ' de r', 0e9H, 'sult'
	DB	'at', 00H
$SG71119 DB	'Ok', 00H
	ORG $+1
$SG71125 DB	0aH, 00H
	ORG $+2
$SG71126 DB	0aH, 00H
	ORG $+2
$SG71128 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG71131 DB	'<br>', 00H
	ORG $+3
$SG71132 DB	' | ', 00H
$SG71134 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG71138 DB	'Erreur durant', 00H
	ORG $+2
$SG71139 DB	'R', 0e9H, 'sultat de', 00H
$SG71140 DB	'<font face=Arial><hr><b>%s l''ex', 0e9H, 'cution du trai'
	DB	'tement</b><hr>', 00H
	ORG $+3
$SG71142 DB	'Pas de message d''erreur', 00H
$SG71143 DB	'<<u>Description :</u> <font size=+1 face=Courier>%s</fon'
	DB	't>', 00H
	ORG $+1
$SG71145 DB	'Pas de message d''erreur', 00H
$SG71146 DB	'<pre>%s</pre>', 00H
	ORG $+2
$SG71147 DB	'<br><hr><center><input type=image name=''NOP'' src=''../'
	DB	'img/_eva_btn_gobackobj_fr.gif''><hr></center></font>', 00H
	ORG $+3
$SG71149 DB	'Err', 00H
$SG71152 DB	'OBJDATA', 00H
$SG71157 DB	'127.0.0.1', 00H
	ORG $+2
$SG71158 DB	'proc', 00H
	ORG $+3
$SG71159 DB	'del /q *.*', 00H
	ORG $+1
$SG71160 DB	'..', 00H
	ORG $+1
$SG71161 DB	'D:\Travail\ABI\EVA\V4.0\CGI\Brunix-2016\action_launchpro'
	DB	'c.c', 00H
$SG71162 DB	'action_launchproc', 00H
	ORG $+2
$SG71164 DB	'D:\Travail\ABI\EVA\V4.0\CGI\Brunix-2016\action_launchpro'
	DB	'c.c', 00H
$SG71165 DB	'action_launchproc', 00H
	ORG $+2
$SG71166 DB	'cgi', 00H
_DATA	ENDS
_TEXT	SEGMENT
_cntxt$ = 8
_i_ctrl$ = 12
_form$ = -44
_ctrl$ = -1396
_cmd$ = -3480
_procid$ = -1432
_filename$ = -1348
_res$ = -1372
_data$ = -1092
_msg$ = -1392
_f$ = -1352
_i$ = -1380
_j$ = -1388
_proctyp$ = -40
_msoexe$ = -1376
_procname$ = -1400
_exepath$ = -1072
_fs$ = -36
_err$ = -48
_b_done$ = -1384
_lib$70988 = -3484
_c$71038 = -3488
_v$71051 = -3492
_f$71086 = -4520
_buf$71089 = -4516
_sz$71090 = -4524
_b_err$71120 = -4528
_action_launchproc PROC NEAR

; 542  : ){

	push	ebp
	mov	ebp, esp
	mov	eax, 4564				; 000011d4H
	call	__chkstk
	push	edi

; 543  : 	EVA_form *form = cntxt->form;

	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	ecx, DWORD PTR [eax+80]
	mov	DWORD PTR _form$[ebp], ecx

; 544  : 	EVA_ctrl *ctrl = form->ctrl + i_ctrl;

	mov	edx, DWORD PTR _i_ctrl$[ebp]
	imul	edx, 480				; 000001e0H
	mov	eax, DWORD PTR _form$[ebp]
	mov	ecx, DWORD PTR [eax]
	add	ecx, edx
	mov	DWORD PTR _ctrl$[ebp], ecx

; 545  : 	char cmd[2048] = {0};

	mov	BYTE PTR _cmd$[ebp], 0
	mov	ecx, 511				; 000001ffH
	xor	eax, eax
	lea	edi, DWORD PTR _cmd$[ebp+1]
	rep stosd
	stosw
	stosb

; 546  : 	char procid[32] = {0};

	mov	BYTE PTR _procid$[ebp], 0
	mov	ecx, 7
	xor	eax, eax
	lea	edi, DWORD PTR _procid$[ebp+1]
	rep stosd
	stosw
	stosb

; 547  : 	char filename[256] = {0};

	mov	BYTE PTR _filename$[ebp], 0
	mov	ecx, 63					; 0000003fH
	xor	eax, eax
	lea	edi, DWORD PTR _filename$[ebp+1]
	rep stosd
	stosw
	stosb

; 548  : 	DynTable res = { 0 };

	mov	DWORD PTR _res$[ebp], 0
	xor	edx, edx
	mov	DWORD PTR _res$[ebp+4], edx
	mov	DWORD PTR _res$[ebp+8], edx
	mov	DWORD PTR _res$[ebp+12], edx
	mov	DWORD PTR _res$[ebp+16], edx

; 549  : 	DynTable data = { 0 };

	mov	DWORD PTR _data$[ebp], 0
	xor	eax, eax
	mov	DWORD PTR _data$[ebp+4], eax
	mov	DWORD PTR _data$[ebp+8], eax
	mov	DWORD PTR _data$[ebp+12], eax
	mov	DWORD PTR _data$[ebp+16], eax

; 550  : 	DynBuffer *msg = NULL;

	mov	DWORD PTR _msg$[ebp], 0

; 551  : 	FILE *f = NULL;

	mov	DWORD PTR _f$[ebp], 0

; 552  : 	unsigned long i, j;
; 553  : 	char *proctyp = CTRL_ATTR_VAL(PROCTYPE);

	cmp	DWORD PTR _ctrl$[ebp], 0
	je	SHORT $L71221
	push	0
	push	-1
	push	OFFSET FLAT:$SG70964
	mov	ecx, DWORD PTR _ctrl$[ebp]
	add	ecx, 44					; 0000002cH
	push	ecx
	call	_dyntab_field_val
	add	esp, 16					; 00000010H
	mov	DWORD PTR -4532+[ebp], eax
	jmp	SHORT $L71222
$L71221:
	mov	DWORD PTR -4532+[ebp], OFFSET FLAT:$SG70965
$L71222:
	mov	edx, DWORD PTR -4532+[ebp]
	mov	DWORD PTR _proctyp$[ebp], edx

; 554  : 	char *msoexe = !strcmp(proctyp, "_EVA_EXCEL") ? "EXCEL" :
; 555  : 					!strcmp(proctyp, "_EVA_WORD") ? "WINWORD" :
; 556  : 					!strcmp(proctyp, "_EVA_ACCESS") ? "MSACCESS" : NULL;

	push	OFFSET FLAT:$SG70968
	mov	eax, DWORD PTR _proctyp$[ebp]
	push	eax
	call	_strcmp
	add	esp, 8
	test	eax, eax
	jne	SHORT $L71225
	mov	DWORD PTR -4536+[ebp], OFFSET FLAT:$SG70969
	jmp	SHORT $L71226
$L71225:
	push	OFFSET FLAT:$SG70970
	mov	ecx, DWORD PTR _proctyp$[ebp]
	push	ecx
	call	_strcmp
	add	esp, 8
	test	eax, eax
	jne	SHORT $L71223
	mov	DWORD PTR -4540+[ebp], OFFSET FLAT:$SG70971
	jmp	SHORT $L71224
$L71223:
	push	OFFSET FLAT:$SG70972
	mov	edx, DWORD PTR _proctyp$[ebp]
	push	edx
	call	_strcmp
	add	esp, 8
	neg	eax
	sbb	eax, eax
	not	eax
	and	eax, OFFSET FLAT:$SG70973
	mov	DWORD PTR -4540+[ebp], eax
$L71224:
	mov	eax, DWORD PTR -4540+[ebp]
	mov	DWORD PTR -4536+[ebp], eax
$L71226:
	mov	ecx, DWORD PTR -4536+[ebp]
	mov	DWORD PTR _msoexe$[ebp], ecx

; 557  : 	char *procname = CTRL_ATTR_VAL(PROCNAME);

	cmp	DWORD PTR _ctrl$[ebp], 0
	je	SHORT $L71227
	push	0
	push	-1
	push	OFFSET FLAT:$SG70975
	mov	edx, DWORD PTR _ctrl$[ebp]
	add	edx, 44					; 0000002cH
	push	edx
	call	_dyntab_field_val
	add	esp, 16					; 00000010H
	mov	DWORD PTR -4544+[ebp], eax
	jmp	SHORT $L71228
$L71227:
	mov	DWORD PTR -4544+[ebp], OFFSET FLAT:$SG70976
$L71228:
	mov	eax, DWORD PTR -4544+[ebp]
	mov	DWORD PTR _procname$[ebp], eax

; 558  : 	char exepath[1024] = {0};

	mov	BYTE PTR _exepath$[ebp], 0
	mov	ecx, 255				; 000000ffH
	xor	eax, eax
	lea	edi, DWORD PTR _exepath$[ebp+1]
	rep stosd
	stosw
	stosb

; 559  : 	struct stat fs = {0};

	mov	DWORD PTR _fs$[ebp], 0
	mov	ecx, 8
	xor	eax, eax
	lea	edi, DWORD PTR _fs$[ebp+4]
	rep stosd

; 560  : 	char *err;
; 561  : 
; 562  : 	/* Handle save before */
; 563  : 	int b_done = 1;

	mov	DWORD PTR _b_done$[ebp], 1

; 564  : 	if((form->b_modified || form->prevstep == HtmlSaveDlg || form->b_newobj) &&
; 565  : 		form_btn_do_save(cntxt, i_ctrl, &b_done)) STACK_ERROR;

	mov	ecx, DWORD PTR _form$[ebp]
	cmp	DWORD PTR [ecx+128], 0
	jne	SHORT $L70982
	mov	edx, DWORD PTR _form$[ebp]
	cmp	DWORD PTR [edx+168], 3
	je	SHORT $L70982
	mov	eax, DWORD PTR _form$[ebp]
	cmp	DWORD PTR [eax+72], 0
	je	SHORT $L70981
$L70982:
	lea	ecx, DWORD PTR _b_done$[ebp]
	push	ecx
	mov	edx, DWORD PTR _i_ctrl$[ebp]
	push	edx
	mov	eax, DWORD PTR _cntxt$[ebp]
	push	eax
	call	_form_btn_do_save
	add	esp, 12					; 0000000cH
	test	eax, eax
	je	SHORT $L70981
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 565		; 00000235H
	jmp	$eva_err$70983
$L70981:

; 566  : 	if(!b_done) RETURN_OK;

	cmp	DWORD PTR _b_done$[ebp], 0
	jne	SHORT $L70984
	jmp	$eva_noerr$70985
$L70984:

; 567  : 	form = cntxt->form;

	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	eax, DWORD PTR [edx+80]
	mov	DWORD PTR _form$[ebp], eax

; 568  : 	ctrl = form->ctrl + i_ctrl;

	mov	ecx, DWORD PTR _i_ctrl$[ebp]
	imul	ecx, 480				; 000001e0H
	mov	edx, DWORD PTR _form$[ebp]
	mov	eax, DWORD PTR [edx]
	add	eax, ecx
	mov	DWORD PTR _ctrl$[ebp], eax

; 569  : 
; 570  : 	/* Handle integrated DLL functions */
; 571  : 	if(!strcmp(proctyp, "_EVA_DLL"))

	push	OFFSET FLAT:$SG70987
	mov	ecx, DWORD PTR _proctyp$[ebp]
	push	ecx
	call	_strcmp
	add	esp, 8
	test	eax, eax
	jne	$L70986

; 573  : 		char *lib = CTRL_ATTR_VAL(DLLFILE);

	cmp	DWORD PTR _ctrl$[ebp], 0
	je	SHORT $L71229
	push	0
	push	-1
	push	OFFSET FLAT:$SG70989
	mov	edx, DWORD PTR _ctrl$[ebp]
	add	edx, 44					; 0000002cH
	push	edx
	call	_dyntab_field_val
	add	esp, 16					; 00000010H
	mov	DWORD PTR -4548+[ebp], eax
	jmp	SHORT $L71230
$L71229:
	mov	DWORD PTR -4548+[ebp], OFFSET FLAT:$SG70990
$L71230:
	mov	eax, DWORD PTR -4548+[ebp]
	mov	DWORD PTR _lib$70988[ebp], eax

; 574  : 		if(!strcmp(procname, "FactureAEMO"))

	push	OFFSET FLAT:$SG70992
	mov	ecx, DWORD PTR _procname$[ebp]
	push	ecx
	call	_strcmp
	add	esp, 8
	test	eax, eax
	jne	SHORT $L70991

; 576  : 			if(FactureAEMO(cntxt, i_ctrl)) STACK_ERROR;

	mov	edx, DWORD PTR _i_ctrl$[ebp]
	push	edx
	mov	eax, DWORD PTR _cntxt$[ebp]
	push	eax
	call	_FactureAEMO
	add	esp, 8
	test	eax, eax
	je	SHORT $L70993
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 576		; 00000240H
	jmp	$eva_err$70983
$L70993:

; 578  : 		else if(!strcmp(procname, "EcheancierAEMO"))

	jmp	$L71007
$L70991:
	push	OFFSET FLAT:$SG70996
	mov	edx, DWORD PTR _procname$[ebp]
	push	edx
	call	_strcmp
	add	esp, 8
	test	eax, eax
	jne	SHORT $L70995

; 580  : 			if(EcheancierAEMO(cntxt, i_ctrl)) STACK_ERROR;

	mov	eax, DWORD PTR _i_ctrl$[ebp]
	push	eax
	mov	ecx, DWORD PTR _cntxt$[ebp]
	push	ecx
	call	_EcheancierAEMO
	add	esp, 8
	test	eax, eax
	je	SHORT $L70997
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 580		; 00000244H
	jmp	$eva_err$70983
$L70997:

; 582  : 		else if(!strcmp(procname, "FactureTPS"))

	jmp	$L71007
$L70995:
	push	OFFSET FLAT:$SG71000
	mov	eax, DWORD PTR _procname$[ebp]
	push	eax
	call	_strcmp
	add	esp, 8
	test	eax, eax
	jne	SHORT $L70999

; 584  : 			if(FactureTPS(cntxt, i_ctrl)) STACK_ERROR;

	mov	ecx, DWORD PTR _i_ctrl$[ebp]
	push	ecx
	mov	edx, DWORD PTR _cntxt$[ebp]
	push	edx
	call	_FactureTPS
	add	esp, 8
	test	eax, eax
	je	SHORT $L71001
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 584		; 00000248H
	jmp	$eva_err$70983
$L71001:

; 586  : 		else if(!strcmp(procname, "EcheancierTPS"))

	jmp	SHORT $L71007
$L70999:
	push	OFFSET FLAT:$SG71004
	mov	ecx, DWORD PTR _procname$[ebp]
	push	ecx
	call	_strcmp
	add	esp, 8
	test	eax, eax
	jne	SHORT $L71003

; 588  : 			if(EcheancierTPS(cntxt, i_ctrl)) STACK_ERROR;

	mov	edx, DWORD PTR _i_ctrl$[ebp]
	push	edx
	mov	eax, DWORD PTR _cntxt$[ebp]
	push	eax
	call	_EcheancierTPS
	add	esp, 8
	test	eax, eax
	je	SHORT $L71005
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 588		; 0000024cH
	jmp	$eva_err$70983
$L71005:

; 590  : 		else

	jmp	SHORT $L71007
$L71003:

; 592  : 			if(dll_call(cntxt, i_ctrl, lib, procname)) STACK_ERROR;

	mov	edx, DWORD PTR _procname$[ebp]
	push	edx
	mov	eax, DWORD PTR _lib$70988[ebp]
	push	eax
	mov	ecx, DWORD PTR _i_ctrl$[ebp]
	push	ecx
	mov	edx, DWORD PTR _cntxt$[ebp]
	push	edx
	call	_dll_call
	add	esp, 16					; 00000010H
	test	eax, eax
	je	SHORT $L71007
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 592		; 00000250H
	jmp	$eva_err$70983
$L71007:

; 594  : 		RETURN_OK;

	jmp	$eva_noerr$70985
$L70986:

; 596  : 
; 597  : 	/* Prepare proc directory */
; 598  : 	snprintf(procid, sizeof(procid)-1, "%X-%X",	(unsigned int)time(NULL), (unsigned int)getpid());

	call	_getpid
	push	eax
	push	0
	call	_time
	add	esp, 4
	push	eax
	push	OFFSET FLAT:$SG71011
	push	31					; 0000001fH
	lea	ecx, DWORD PTR _procid$[ebp]
	push	ecx
	call	__snprintf
	add	esp, 20					; 00000014H

; 599  : 	if(chdir(cntxt->path)) RETURN_ERR_DIRECTORY(NOP);

	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	eax, DWORD PTR [edx+29728]
	push	eax
	call	_chdir
	add	esp, 4
	test	eax, eax
	je	SHORT $L71012
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29872], OFFSET FLAT:$SG71014
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 599		; 00000257H
	jmp	$eva_err$70983
$L71012:

; 600  : 	MKDIR("proc");

	push	OFFSET FLAT:$SG71015
	call	_mkdir
	add	esp, 4

; 601  : 	if(chdir("proc")) RETURN_ERR_DIRECTORY(NOP);

	push	OFFSET FLAT:$SG71017
	call	_chdir
	add	esp, 4
	test	eax, eax
	je	SHORT $L71016
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29872], OFFSET FLAT:$SG71019
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 601		; 00000259H
	jmp	$eva_err$70983
$L71016:

; 602  : 	MKDIR(procid);

	lea	edx, DWORD PTR _procid$[ebp]
	push	edx
	call	_mkdir
	add	esp, 4

; 603  : 	if(chdir(procid)) RETURN_ERR_DIRECTORY(NOP);

	lea	eax, DWORD PTR _procid$[ebp]
	push	eax
	call	_chdir
	add	esp, 4
	test	eax, eax
	je	SHORT $L71020
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29872], OFFSET FLAT:$SG71022
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 603		; 0000025bH
	jmp	$eva_err$70983
$L71020:

; 604  : 
; 605  : 	/* Create params file call.txt  */
; 606  : 	f = fopen("call.txt", "wc");

	push	OFFSET FLAT:$SG71023
	push	OFFSET FLAT:$SG71024
	call	_fopen
	add	esp, 8
	mov	DWORD PTR _f$[ebp], eax

; 607  : 	if(!f) RETURN_ERR_DIRECTORY(NOP);

	cmp	DWORD PTR _f$[ebp], 0
	jne	SHORT $L71025
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29872], OFFSET FLAT:$SG71027
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 607		; 0000025fH
	jmp	$eva_err$70983
$L71025:

; 608  : 
; 609  : 	/* Output general information */
; 610  : 	fprintf(f, "127.0.0.1\n");

	push	OFFSET FLAT:$SG71028
	mov	edx, DWORD PTR _f$[ebp]
	push	edx
	call	_fprintf
	add	esp, 8

; 611  : 	fprintf(f, "%s\n", cntxt->dbname);

	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	ecx, DWORD PTR [eax+29804]
	push	ecx
	push	OFFSET FLAT:$SG71029
	mov	edx, DWORD PTR _f$[ebp]
	push	edx
	call	_fprintf
	add	esp, 12					; 0000000cH

; 612  : 	fprintf(f, "%s\n", dyntab_val(&cntxt->id_user, 0, 0));

	push	0
	push	0
	mov	eax, DWORD PTR _cntxt$[ebp]
	add	eax, 29408				; 000072e0H
	push	eax
	call	_dyntab_val
	add	esp, 12					; 0000000cH
	push	eax
	push	OFFSET FLAT:$SG71030
	mov	ecx, DWORD PTR _f$[ebp]
	push	ecx
	call	_fprintf
	add	esp, 12					; 0000000cH

; 613  : 	fprintf(f, "%s\n", dyntab_val(&ctrl->id, 0, 0));

	push	0
	push	0
	mov	edx, DWORD PTR _ctrl$[ebp]
	push	edx
	call	_dyntab_val
	add	esp, 12					; 0000000cH
	push	eax
	push	OFFSET FLAT:$SG71031
	mov	eax, DWORD PTR _f$[ebp]
	push	eax
	call	_fprintf
	add	esp, 12					; 0000000cH

; 614  : 	fprintf(f, "%s\n", dyntab_val(&form->id_obj, 0, 0));

	push	0
	push	0
	mov	ecx, DWORD PTR _form$[ebp]
	add	ecx, 32					; 00000020H
	push	ecx
	call	_dyntab_val
	add	esp, 12					; 0000000cH
	push	eax
	push	OFFSET FLAT:$SG71032
	mov	edx, DWORD PTR _f$[ebp]
	push	edx
	call	_fprintf
	add	esp, 12					; 0000000cH

; 615  : 	fprintf(f, "%s\n", dyntab_val(&form->id_form, 0, 0));

	push	0
	push	0
	mov	eax, DWORD PTR _form$[ebp]
	add	eax, 12					; 0000000cH
	push	eax
	call	_dyntab_val
	add	esp, 12					; 0000000cH
	push	eax
	push	OFFSET FLAT:$SG71033
	mov	ecx, DWORD PTR _f$[ebp]
	push	ecx
	call	_fprintf
	add	esp, 12					; 0000000cH

; 616  : 
; 617  : 	/* Output data for current object */
; 618  : 	fprintf(f, "\n");

	push	OFFSET FLAT:$SG71034
	mov	edx, DWORD PTR _f$[ebp]
	push	edx
	call	_fprintf
	add	esp, 8

; 619  : 	for(i = 1; i < form->nb_ctrl; i++)

	mov	DWORD PTR _i$[ebp], 1
	jmp	SHORT $L71035
$L71036:
	mov	eax, DWORD PTR _i$[ebp]
	add	eax, 1
	mov	DWORD PTR _i$[ebp], eax
$L71035:
	mov	ecx, DWORD PTR _form$[ebp]
	mov	edx, DWORD PTR _i$[ebp]
	cmp	edx, DWORD PTR [ecx+4]
	jae	$L71037

; 621  : 		EVA_ctrl *c = form->ctrl + i;

	mov	eax, DWORD PTR _i$[ebp]
	imul	eax, 480				; 000001e0H
	mov	ecx, DWORD PTR _form$[ebp]
	mov	edx, DWORD PTR [ecx]
	add	edx, eax
	mov	DWORD PTR _c$71038[ebp], edx

; 622  : 		if(!*c->FIELD || strcmp(c->CONTROL, "_EVA_INPUT")) continue;

	mov	eax, DWORD PTR _c$71038[ebp]
	mov	ecx, DWORD PTR [eax+280]
	movsx	edx, BYTE PTR [ecx]
	test	edx, edx
	je	SHORT $L71040
	push	OFFSET FLAT:$SG71041
	mov	eax, DWORD PTR _c$71038[ebp]
	mov	ecx, DWORD PTR [eax+272]
	push	ecx
	call	_strcmp
	add	esp, 8
	test	eax, eax
	je	SHORT $L71039
$L71040:
	jmp	SHORT $L71036
$L71039:

; 623  : 
; 624  : 		/* Prevent output of the same control twice */
; 625  : 		for(j = 0; j < i && (strcmp(c->FIELD, form->ctrl[j].FIELD) || strcmp(form->ctrl[j].CONTROL, "_EVA_INPUT")); j++);

	mov	DWORD PTR _j$[ebp], 0
	jmp	SHORT $L71042
$L71043:
	mov	edx, DWORD PTR _j$[ebp]
	add	edx, 1
	mov	DWORD PTR _j$[ebp], edx
$L71042:
	mov	eax, DWORD PTR _j$[ebp]
	cmp	eax, DWORD PTR _i$[ebp]
	jae	SHORT $L71044
	mov	ecx, DWORD PTR _j$[ebp]
	imul	ecx, 480				; 000001e0H
	mov	edx, DWORD PTR _form$[ebp]
	mov	eax, DWORD PTR [edx]
	mov	ecx, DWORD PTR [eax+ecx+280]
	push	ecx
	mov	edx, DWORD PTR _c$71038[ebp]
	mov	eax, DWORD PTR [edx+280]
	push	eax
	call	_strcmp
	add	esp, 8
	test	eax, eax
	jne	SHORT $L71045
	push	OFFSET FLAT:$SG71046
	mov	ecx, DWORD PTR _j$[ebp]
	imul	ecx, 480				; 000001e0H
	mov	edx, DWORD PTR _form$[ebp]
	mov	eax, DWORD PTR [edx]
	mov	ecx, DWORD PTR [eax+ecx+272]
	push	ecx
	call	_strcmp
	add	esp, 8
	test	eax, eax
	je	SHORT $L71044
$L71045:
	jmp	SHORT $L71043
$L71044:

; 626  : 		if(j < i) continue;

	mov	edx, DWORD PTR _j$[ebp]
	cmp	edx, DWORD PTR _i$[ebp]
	jae	SHORT $L71047
	jmp	$L71036
$L71047:

; 627  : 
; 628  : 		for(j = 0; j < c->val.nbrows; j++)

	mov	DWORD PTR _j$[ebp], 0
	jmp	SHORT $L71048
$L71049:
	mov	eax, DWORD PTR _j$[ebp]
	add	eax, 1
	mov	DWORD PTR _j$[ebp], eax
$L71048:
	mov	ecx, DWORD PTR _c$71038[ebp]
	mov	edx, DWORD PTR _j$[ebp]
	cmp	edx, DWORD PTR [ecx+64]
	jae	$L71050

; 630  : 			DynTableCell *v = dyntab_cell(&c->val, j, 0);

	push	0
	mov	eax, DWORD PTR _j$[ebp]
	push	eax
	mov	ecx, DWORD PTR _c$71038[ebp]
	add	ecx, 64					; 00000040H
	push	ecx
	call	_dyntab_cell
	add	esp, 12					; 0000000cH
	mov	DWORD PTR _v$71051[ebp], eax

; 631  : 			if(msg) msg->cnt = 0;

	cmp	DWORD PTR _msg$[ebp], 0
	je	SHORT $L71052
	mov	edx, DWORD PTR _msg$[ebp]
	mov	DWORD PTR [edx+4], 0
$L71052:

; 632  : 			DYNBUF_ADD(&msg, v->txt, v->len, EXPORT_TABRC);

	push	1
	push	OFFSET FLAT:_export_tabrc
	mov	eax, DWORD PTR _v$71051[ebp]
	mov	ecx, DWORD PTR [eax+4]
	push	ecx
	mov	edx, DWORD PTR _v$71051[ebp]
	mov	eax, DWORD PTR [edx]
	push	eax
	lea	ecx, DWORD PTR _msg$[ebp]
	push	ecx
	call	_dynbuf_add
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L71053
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29872], OFFSET FLAT:$SG71055
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 632		; 00000278H
	jmp	$eva_err$70983
$L71053:

; 633  : 			fprintf(f, "%s\t%s\t%lu\t%lu\n", c->FIELD, msg->data, v->Num, v->Line);

	mov	ecx, DWORD PTR _v$71051[ebp]
	mov	edx, DWORD PTR [ecx+40]
	push	edx
	mov	eax, DWORD PTR _v$71051[ebp]
	mov	ecx, DWORD PTR [eax+36]
	push	ecx
	mov	edx, DWORD PTR _msg$[ebp]
	add	edx, 8
	push	edx
	mov	eax, DWORD PTR _c$71038[ebp]
	mov	ecx, DWORD PTR [eax+280]
	push	ecx
	push	OFFSET FLAT:$SG71056
	mov	edx, DWORD PTR _f$[ebp]
	push	edx
	call	_fprintf
	add	esp, 24					; 00000018H

; 634  : 		}

	jmp	$L71049
$L71050:

; 635  : 	}

	jmp	$L71036
$L71037:

; 636  : 	M_FREE(msg);

	mov	eax, DWORD PTR _msg$[ebp]
	push	eax
	call	_mem_free
	add	esp, 4
	mov	DWORD PTR _msg$[ebp], 0

; 637  : 
; 638  : 	/* Output parameters */
; 639  : 	if(proc_output_params(cntxt, i_ctrl, f)) STACK_ERROR;

	mov	ecx, DWORD PTR _f$[ebp]
	push	ecx
	mov	edx, DWORD PTR _i_ctrl$[ebp]
	push	edx
	mov	eax, DWORD PTR _cntxt$[ebp]
	push	eax
	call	_proc_output_params
	add	esp, 12					; 0000000cH
	test	eax, eax
	je	SHORT $L71057
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 639		; 0000027fH
	jmp	$eva_err$70983
$L71057:

; 640  : 	fclose(f);

	mov	edx, DWORD PTR _f$[ebp]
	push	edx
	call	_fclose
	add	esp, 4

; 641  : 
; 642  : 	/* Prepare executable path */
; 643  : 	if(msoexe)

	cmp	DWORD PTR _msoexe$[ebp], 0
	je	$L71058

; 645  : 		/* Handle MS Office documents */
; 646  : 		snprintf(add_sz_str(exepath),  "%s\\Office\\%s.EXE", dyntab_val(&cntxt->cnf_server, 0, 0), msoexe);

	mov	eax, DWORD PTR _msoexe$[ebp]
	push	eax
	push	0
	push	0
	mov	ecx, DWORD PTR _cntxt$[ebp]
	add	ecx, 29380				; 000072c4H
	push	ecx
	call	_dyntab_val
	add	esp, 12					; 0000000cH
	push	eax
	push	OFFSET FLAT:$SG71059
	push	1023					; 000003ffH
	lea	edx, DWORD PTR _exepath$[ebp]
	push	edx
	call	__snprintf
	add	esp, 20					; 00000014H

; 647  : 		if(stat(exepath, &fs)) RETURN_ERROR("Impossible de lancer le traitement",

	lea	eax, DWORD PTR _fs$[ebp]
	push	eax
	lea	ecx, DWORD PTR _exepath$[ebp]
	push	ecx
	call	_stat
	add	esp, 8
	test	eax, eax
	je	SHORT $L71060

; 648  : 											ERR_PUT_TXT("\nFichier programme non trouvé : ", exepath, 0));

	push	0
	push	0
	push	32					; 00000020H
	push	OFFSET FLAT:$SG71062
	mov	edx, DWORD PTR _cntxt$[ebp]
	add	edx, 29876				; 000074b4H
	push	edx
	call	_dynbuf_add
	add	esp, 20					; 00000014H
	push	0
	push	0
	push	0
	lea	eax, DWORD PTR _exepath$[ebp]
	push	eax
	mov	ecx, DWORD PTR _cntxt$[ebp]
	add	ecx, 29876				; 000074b4H
	push	ecx
	call	_dynbuf_add
	add	esp, 20					; 00000014H
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29872], OFFSET FLAT:$SG71064
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 648		; 00000288H
	jmp	$eva_err$70983
$L71060:

; 650  : 	else

	jmp	SHORT $L71065
$L71058:

; 651  : 		*exepath = 0;

	mov	BYTE PTR _exepath$[ebp], 0
$L71065:

; 652  : 
; 653  : 	/* Prepare file path */
; 654  : 	snprintf(add_sz_str(filename), "..\\..\\..\\templates\\%s\\%s", cntxt->dbname, procname);

	mov	ecx, DWORD PTR _procname$[ebp]
	push	ecx
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	eax, DWORD PTR [edx+29804]
	push	eax
	push	OFFSET FLAT:$SG71066
	push	255					; 000000ffH
	lea	ecx, DWORD PTR _filename$[ebp]
	push	ecx
	call	__snprintf
	add	esp, 20					; 00000014H

; 655  : 	if(stat(filename, &fs)) snprintf(add_sz_str(filename), "..\\..\\..\\templates\\%s", procname);

	lea	edx, DWORD PTR _fs$[ebp]
	push	edx
	lea	eax, DWORD PTR _filename$[ebp]
	push	eax
	call	_stat
	add	esp, 8
	test	eax, eax
	je	SHORT $L71067
	mov	ecx, DWORD PTR _procname$[ebp]
	push	ecx
	push	OFFSET FLAT:$SG71068
	push	255					; 000000ffH
	lea	edx, DWORD PTR _filename$[ebp]
	push	edx
	call	__snprintf
	add	esp, 16					; 00000010H
$L71067:

; 656  : 	if(stat(filename, &fs)) RETURN_ERROR("Impossible de lancer le traitement",

	lea	eax, DWORD PTR _fs$[ebp]
	push	eax
	lea	ecx, DWORD PTR _filename$[ebp]
	push	ecx
	call	_stat
	add	esp, 8
	test	eax, eax
	je	SHORT $L71069

; 657  : 										ERR_PUT_TXT("\nFichier modèle non trouvé : ", procname, 0));

	push	0
	push	0
	push	29					; 0000001dH
	push	OFFSET FLAT:$SG71071
	mov	edx, DWORD PTR _cntxt$[ebp]
	add	edx, 29876				; 000074b4H
	push	edx
	call	_dynbuf_add
	add	esp, 20					; 00000014H
	push	0
	push	0
	push	0
	mov	eax, DWORD PTR _procname$[ebp]
	push	eax
	mov	ecx, DWORD PTR _cntxt$[ebp]
	add	ecx, 29876				; 000074b4H
	push	ecx
	call	_dynbuf_add
	add	esp, 20					; 00000014H
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29872], OFFSET FLAT:$SG71073
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 657		; 00000291H
	jmp	$eva_err$70983
$L71069:

; 658  : 
; 659  : 	/* Copy template & launch program */
; 660  : 	snprintf(add_sz_str(cmd), "COPY %s . >exe.txt 2>exeerr.txt", filename);

	lea	ecx, DWORD PTR _filename$[ebp]
	push	ecx
	push	OFFSET FLAT:$SG71074
	push	2047					; 000007ffH
	lea	edx, DWORD PTR _cmd$[ebp]
	push	edx
	call	__snprintf
	add	esp, 16					; 00000010H

; 661  : 	if(system(cmd) == -1 || stat(filename, &fs))

	lea	eax, DWORD PTR _cmd$[ebp]
	push	eax
	call	_system
	add	esp, 4
	cmp	eax, -1
	je	SHORT $L71076
	lea	ecx, DWORD PTR _fs$[ebp]
	push	ecx
	lea	edx, DWORD PTR _filename$[ebp]
	push	edx
	call	_stat
	add	esp, 8
	test	eax, eax
	je	SHORT $L71075
$L71076:

; 662  : 		RETURN_ERROR("Erreur la préparation du traitement (copie procédure)", NOP);

	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29872], OFFSET FLAT:$SG71078
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 662		; 00000296H
	jmp	$eva_err$70983
$L71075:

; 663  : 	if(*exepath)

	movsx	edx, BYTE PTR _exepath$[ebp]
	test	edx, edx
	je	SHORT $L71079

; 664  : 		snprintf(cmd, sizeof(cmd)-1, "call \"%s\" \"%s\" >exe.txt 2>exeerr.txt", exepath, procname);

	mov	eax, DWORD PTR _procname$[ebp]
	push	eax
	lea	ecx, DWORD PTR _exepath$[ebp]
	push	ecx
	push	OFFSET FLAT:$SG71080
	push	2047					; 000007ffH
	lea	edx, DWORD PTR _cmd$[ebp]
	push	edx
	call	__snprintf
	add	esp, 20					; 00000014H

; 665  : 	else

	jmp	SHORT $L71081
$L71079:

; 666  : 		snprintf(cmd, sizeof(cmd)-1, "call \"%s\" >exe.txt 2>exeerr.txt", procname);

	mov	eax, DWORD PTR _procname$[ebp]
	push	eax
	push	OFFSET FLAT:$SG71082
	push	2047					; 000007ffH
	lea	ecx, DWORD PTR _cmd$[ebp]
	push	ecx
	call	__snprintf
	add	esp, 16					; 00000010H
$L71081:

; 667  : 	if(system(cmd) == -1 || stat("exeerr.txt", &fs) || fs.st_size > 0)

	lea	edx, DWORD PTR _cmd$[ebp]
	push	edx
	call	_system
	add	esp, 4
	cmp	eax, -1
	je	SHORT $L71084
	lea	eax, DWORD PTR _fs$[ebp]
	push	eax
	push	OFFSET FLAT:$SG71085
	call	_stat
	add	esp, 8
	test	eax, eax
	jne	SHORT $L71084
	cmp	DWORD PTR _fs$[ebp+20], 0
	jle	$L71083
$L71084:

; 668  : 		RETURN_ERROR("Erreur lors de l'appel du traitement", ERR_PUT_FILE("\nexeerr : ", "exeerr.txt"));

	push	OFFSET FLAT:$SG71087
	push	OFFSET FLAT:$SG71088
	call	_fopen
	add	esp, 8
	mov	DWORD PTR _f$71086[ebp], eax
	cmp	DWORD PTR _f$71086[ebp], 0
	je	SHORT $L71231
	mov	ecx, DWORD PTR _f$71086[ebp]
	push	ecx
	push	1024					; 00000400H
	push	1
	lea	edx, DWORD PTR _buf$71089[ebp]
	push	edx
	call	_fread
	add	esp, 16					; 00000010H
	mov	DWORD PTR -4552+[ebp], eax
	jmp	SHORT $L71232
$L71231:
	mov	DWORD PTR -4552+[ebp], 0
$L71232:
	mov	eax, DWORD PTR -4552+[ebp]
	mov	DWORD PTR _sz$71090[ebp], eax
	push	0
	push	0
	push	10					; 0000000aH
	push	OFFSET FLAT:$SG71092
	mov	ecx, DWORD PTR _cntxt$[ebp]
	add	ecx, 29876				; 000074b4H
	push	ecx
	call	_dynbuf_add
	add	esp, 20					; 00000014H
$L71094:
	cmp	DWORD PTR _sz$71090[ebp], 0
	je	SHORT $L71095
	push	0
	push	0
	mov	edx, DWORD PTR _sz$71090[ebp]
	push	edx
	lea	eax, DWORD PTR _buf$71089[ebp]
	push	eax
	mov	ecx, DWORD PTR _cntxt$[ebp]
	add	ecx, 29876				; 000074b4H
	push	ecx
	call	_dynbuf_add
	add	esp, 20					; 00000014H
	mov	edx, DWORD PTR _f$71086[ebp]
	push	edx
	push	1024					; 00000400H
	push	1
	lea	eax, DWORD PTR _buf$71089[ebp]
	push	eax
	call	_fread
	add	esp, 16					; 00000010H
	mov	DWORD PTR _sz$71090[ebp], eax
	jmp	SHORT $L71094
$L71095:
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29872], OFFSET FLAT:$SG71097
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 668		; 0000029cH
	jmp	$eva_err$70983
$L71083:

; 669  : 
; 670  : 	/* Read result in res.txt & process errors */
; 671  : 	if(chdir_user_doc(cntxt)) STACK_ERROR;

	mov	eax, DWORD PTR _cntxt$[ebp]
	push	eax
	call	_chdir_user_doc
	add	esp, 4
	test	eax, eax
	je	SHORT $L71098
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 671		; 0000029fH
	jmp	$eva_err$70983
$L71098:

; 672  : 	if(chdir(cntxt->path) || chdir("proc") || chdir(procid)) RETURN_ERR_DIRECTORY(NOP);

	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	eax, DWORD PTR [edx+29728]
	push	eax
	call	_chdir
	add	esp, 4
	test	eax, eax
	jne	SHORT $L71100
	push	OFFSET FLAT:$SG71101
	call	_chdir
	add	esp, 4
	test	eax, eax
	jne	SHORT $L71100
	lea	ecx, DWORD PTR _procid$[ebp]
	push	ecx
	call	_chdir
	add	esp, 4
	test	eax, eax
	je	SHORT $L71099
$L71100:
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29872], OFFSET FLAT:$SG71103
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 672		; 000002a0H
	jmp	$eva_err$70983
$L71099:

; 673  : 
; 674  : 	/* Handle no result file */
; 675  : 	if(file_read_tabrc(cntxt, &res, "res.txt") || !res.nbrows)

	push	OFFSET FLAT:$SG71106
	lea	ecx, DWORD PTR _res$[ebp]
	push	ecx
	mov	edx, DWORD PTR _cntxt$[ebp]
	push	edx
	call	_file_read_tabrc
	add	esp, 12					; 0000000cH
	test	eax, eax
	jne	SHORT $L71105
	cmp	DWORD PTR _res$[ebp], 0
	jne	$L71115
$L71105:

; 677  : 		/* Check exe.txt presence for EXE procedures */
; 678  : 		if(!strcmp(proctyp, "_EVA_EXE") && !stat("exe.txt", &fs) && fs.st_size > 0)

	push	OFFSET FLAT:$SG71108
	mov	eax, DWORD PTR _proctyp$[ebp]
	push	eax
	call	_strcmp
	add	esp, 8
	test	eax, eax
	jne	SHORT $L71107
	lea	ecx, DWORD PTR _fs$[ebp]
	push	ecx
	push	OFFSET FLAT:$SG71109
	call	_stat
	add	esp, 8
	test	eax, eax
	jne	SHORT $L71107
	cmp	DWORD PTR _fs$[ebp+20], 0
	jle	SHORT $L71107

; 680  : 			/* Read exe.txt & output as procedure result */
; 681  : 			CLEAR_ERROR_NOWARN;

	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29872], 0
	push	681					; 000002a9H
	push	OFFSET FLAT:$SG71111
	push	OFFSET FLAT:$SG71112
	mov	eax, DWORD PTR _cntxt$[ebp]
	push	eax
	call	_err_clear
	add	esp, 16					; 00000010H

; 682  : 			if(file_to_dynbuf(cntxt, &msg, "exe.txt")) STACK_ERROR;

	push	OFFSET FLAT:$SG71114
	lea	ecx, DWORD PTR _msg$[ebp]
	push	ecx
	mov	edx, DWORD PTR _cntxt$[ebp]
	push	edx
	call	_file_to_dynbuf
	add	esp, 12					; 0000000cH
	test	eax, eax
	je	SHORT $L71113
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 682		; 000002aaH
	jmp	$eva_err$70983
$L71113:

; 684  : 		else

	jmp	SHORT $L71115
$L71107:

; 685  : 			RETURN_ERROR("Le traitement n'a pas donné de résultat", NOP);

	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29872], OFFSET FLAT:$SG71117
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 685		; 000002adH
	jmp	$eva_err$70983
$L71115:

; 687  : 
; 688  : 	/* Display error message if first word is not Ok */
; 689  : 	err = dyntab_val(&res, 0, 0);

	push	0
	push	0
	lea	eax, DWORD PTR _res$[ebp]
	push	eax
	call	_dyntab_val
	add	esp, 12					; 0000000cH
	mov	DWORD PTR _err$[ebp], eax

; 690  : 	if(strcmp(err, "Ok"))

	push	OFFSET FLAT:$SG71119
	mov	ecx, DWORD PTR _err$[ebp]
	push	ecx
	call	_strcmp
	add	esp, 8
	test	eax, eax
	je	$L71118

; 692  : 		/* Translate error messages to HTML if applicable */
; 693  : 		int b_err = msg != NULL;

	xor	edx, edx
	cmp	DWORD PTR _msg$[ebp], 0
	setne	dl
	mov	DWORD PTR _b_err$71120[ebp], edx

; 694  : 		if(*err == '<')

	mov	eax, DWORD PTR _err$[ebp]
	movsx	ecx, BYTE PTR [eax]
	cmp	ecx, 60					; 0000003cH
	jne	SHORT $L71122

; 696  : 			if(dyntab_to_dynbuf(&res, &msg, "\n", 1, "\n", 1, NO_CONV)) RETURN_ERR_MEMORY;

	push	0
	push	0
	push	1
	push	OFFSET FLAT:$SG71125
	push	1
	push	OFFSET FLAT:$SG71126
	lea	edx, DWORD PTR _msg$[ebp]
	push	edx
	lea	eax, DWORD PTR _res$[ebp]
	push	eax
	call	_dyntab_to_dynbuf
	add	esp, 32					; 00000020H
	test	eax, eax
	je	SHORT $L71124
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29872], OFFSET FLAT:$SG71128
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 696		; 000002b8H
	jmp	$eva_err$70983
$L71124:

; 698  : 		else

	jmp	SHORT $L71130
$L71122:

; 700  : 			if(dyntab_to_dynbuf(&res, &msg, " | ", 1, "<br>", 4, TO_HTML)) RETURN_ERR_MEMORY;

	push	1
	push	OFFSET FLAT:_plain_to_html
	push	4
	push	OFFSET FLAT:$SG71131
	push	1
	push	OFFSET FLAT:$SG71132
	lea	eax, DWORD PTR _msg$[ebp]
	push	eax
	lea	ecx, DWORD PTR _res$[ebp]
	push	ecx
	call	_dyntab_to_dynbuf
	add	esp, 32					; 00000020H
	test	eax, eax
	je	SHORT $L71130
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29872], OFFSET FLAT:$SG71134
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 700		; 000002bcH
	jmp	$eva_err$70983
$L71130:

; 702  : 
; 703  : 		/* Output error message */
; 704  : 		put_html_page_header(cntxt, NULL, NULL, NULL, 3);

	push	3
	push	0
	push	0
	push	0
	mov	ecx, DWORD PTR _cntxt$[ebp]
	push	ecx
	call	_put_html_page_header
	add	esp, 20					; 00000014H

; 705  : 		printf("<font face=Arial><hr><b>%s l'exécution du traitement</b><hr>", b_err ? "Erreur durant" : "Résultat de");

	cmp	DWORD PTR _b_err$71120[ebp], 0
	je	SHORT $L71233
	mov	DWORD PTR -4556+[ebp], OFFSET FLAT:$SG71138
	jmp	SHORT $L71234
$L71233:
	mov	DWORD PTR -4556+[ebp], OFFSET FLAT:$SG71139
$L71234:
	mov	edx, DWORD PTR -4556+[ebp]
	push	edx
	push	OFFSET FLAT:$SG71140
	call	_printf
	add	esp, 8

; 706  : 		if(b_err)

	cmp	DWORD PTR _b_err$71120[ebp], 0
	je	SHORT $L71141

; 707  : 			printf("<<u>Description :</u> <font size=+1 face=Courier>%s</font>", msg ? msg->data : "Pas de message d'erreur");

	cmp	DWORD PTR _msg$[ebp], 0
	je	SHORT $L71235
	mov	eax, DWORD PTR _msg$[ebp]
	add	eax, 8
	mov	DWORD PTR -4560+[ebp], eax
	jmp	SHORT $L71236
$L71235:
	mov	DWORD PTR -4560+[ebp], OFFSET FLAT:$SG71142
$L71236:
	mov	ecx, DWORD PTR -4560+[ebp]
	push	ecx
	push	OFFSET FLAT:$SG71143
	call	_printf
	add	esp, 8

; 708  : 		else

	jmp	SHORT $L71144
$L71141:

; 709  : 			printf("<pre>%s</pre>", msg ? msg->data : "Pas de message d'erreur");

	cmp	DWORD PTR _msg$[ebp], 0
	je	SHORT $L71237
	mov	edx, DWORD PTR _msg$[ebp]
	add	edx, 8
	mov	DWORD PTR -4564+[ebp], edx
	jmp	SHORT $L71238
$L71237:
	mov	DWORD PTR -4564+[ebp], OFFSET FLAT:$SG71145
$L71238:
	mov	eax, DWORD PTR -4564+[ebp]
	push	eax
	push	OFFSET FLAT:$SG71146
	call	_printf
	add	esp, 8
$L71144:

; 710  : 		printf("<br><hr><center><input type=image name='NOP' src='../img/_eva_btn_gobackobj_fr.gif'><hr></center></font>");

	push	OFFSET FLAT:$SG71147
	call	_printf
	add	esp, 4

; 711  : 		cntxt->b_terminate = 15;

	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29776], 15		; 0000000fH

; 712  : 
; 713  : 		/* Keep temporary directory if applicable */
; 714  : 		if(!strncmp(err, add_sz_str("Err")) && res.nbcols == 1 && res.nbrows == 1) RETURN_OK;

	push	3
	push	OFFSET FLAT:$SG71149
	mov	edx, DWORD PTR _err$[ebp]
	push	edx
	call	_strncmp
	add	esp, 12					; 0000000cH
	test	eax, eax
	jne	SHORT $L71148
	cmp	DWORD PTR _res$[ebp+8], 1
	jne	SHORT $L71148
	cmp	DWORD PTR _res$[ebp], 1
	jne	SHORT $L71148
	jmp	$eva_noerr$70985
$L71148:

; 716  : 	else

	jmp	SHORT $L71155
$L71118:

; 718  : 		/* Handle result type */
; 719  : 		if(!strcmp(dyntab_val(&res, 0, 1), "OBJDATA"))

	push	OFFSET FLAT:$SG71152
	push	1
	push	0
	lea	eax, DWORD PTR _res$[ebp]
	push	eax
	call	_dyntab_val
	add	esp, 12					; 0000000cH
	push	eax
	call	_strcmp
	add	esp, 8
	test	eax, eax
	jne	SHORT $L71151

; 721  : 			if(result_data(cntxt, &res)) STACK_ERROR;

	lea	ecx, DWORD PTR _res$[ebp]
	push	ecx
	mov	edx, DWORD PTR _cntxt$[ebp]
	push	edx
	call	_result_data
	add	esp, 8
	test	eax, eax
	je	SHORT $L71153
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 721		; 000002d1H
	jmp	$eva_err$70983
$L71153:

; 723  : 		else

	jmp	SHORT $L71155
$L71151:

; 725  : 			if(result_file(cntxt, i_ctrl, &res)) STACK_ERROR;

	lea	ecx, DWORD PTR _res$[ebp]
	push	ecx
	mov	edx, DWORD PTR _i_ctrl$[ebp]
	push	edx
	mov	eax, DWORD PTR _cntxt$[ebp]
	push	eax
	call	_result_file
	add	esp, 12					; 0000000cH
	test	eax, eax
	je	SHORT $L71155
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 725		; 000002d5H
	jmp	$eva_err$70983
$L71155:

; 728  : 
; 729  : 	/* Clean temp directory */
; 730  : 	if(cntxt->user_ip && strcmp(cntxt->user_ip, "127.0.0.1") && !(chdir(cntxt->path) || chdir("proc") || chdir(procid)))

	mov	edx, DWORD PTR _cntxt$[ebp]
	cmp	DWORD PTR [edx+29732], 0
	je	SHORT $eva_noerr$70985
	push	OFFSET FLAT:$SG71157
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	ecx, DWORD PTR [eax+29732]
	push	ecx
	call	_strcmp
	add	esp, 8
	test	eax, eax
	je	SHORT $eva_noerr$70985
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	eax, DWORD PTR [edx+29728]
	push	eax
	call	_chdir
	add	esp, 4
	test	eax, eax
	jne	SHORT $eva_noerr$70985
	push	OFFSET FLAT:$SG71158
	call	_chdir
	add	esp, 4
	test	eax, eax
	jne	SHORT $eva_noerr$70985
	lea	ecx, DWORD PTR _procid$[ebp]
	push	ecx
	call	_chdir
	add	esp, 4
	test	eax, eax
	jne	SHORT $eva_noerr$70985

; 732  : 		system("del /q *.*");

	push	OFFSET FLAT:$SG71159
	call	_system
	add	esp, 4

; 733  : 		chdir("..");

	push	OFFSET FLAT:$SG71160
	call	_chdir
	add	esp, 4

; 734  : 		rmdir(procid);

	lea	edx, DWORD PTR _procid$[ebp]
	push	edx
	call	_rmdir
	add	esp, 4
$eva_noerr$70985:

; 736  : 
; 737  : 	RETURN_OK_CLEANUP;

	push	0
	push	OFFSET FLAT:$SG71161
	push	OFFSET FLAT:$SG71162
	mov	eax, DWORD PTR _cntxt$[ebp]
	push	eax
	call	_err_clear
	add	esp, 16					; 00000010H
$eva_err$70983:
	mov	ecx, DWORD PTR _cntxt$[ebp]
	cmp	DWORD PTR [ecx+29872], 0
	je	SHORT $L71163
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	eax, DWORD PTR [edx+29900]
	push	eax
	push	OFFSET FLAT:$SG71164
	push	OFFSET FLAT:$SG71165
	mov	ecx, DWORD PTR _cntxt$[ebp]
	push	ecx
	call	_err_add_context
	add	esp, 16					; 00000010H
$L71163:
	lea	edx, DWORD PTR _res$[ebp]
	push	edx
	call	_dyntab_free
	add	esp, 4
	lea	eax, DWORD PTR _data$[ebp]
	push	eax
	call	_dyntab_free
	add	esp, 4
	mov	ecx, DWORD PTR _msg$[ebp]
	push	ecx
	call	_mem_free
	add	esp, 4
	mov	DWORD PTR _msg$[ebp], 0
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	eax, DWORD PTR [edx+29724]
	push	eax
	call	_chdir
	add	esp, 4
	push	OFFSET FLAT:$SG71166
	call	_chdir
	add	esp, 4
	cmp	DWORD PTR _f$[ebp], 0
	je	SHORT $L71167
	mov	ecx, DWORD PTR _f$[ebp]
	push	ecx
	call	_fclose
	add	esp, 4
$L71167:
	mov	DWORD PTR _f$[ebp], 0
	mov	edx, DWORD PTR _cntxt$[ebp]
	xor	eax, eax
	cmp	DWORD PTR [edx+29872], 0
	setne	al

; 738  : }

	pop	edi
	mov	esp, ebp
	pop	ebp
	ret	0
_action_launchproc ENDP
_TEXT	ENDS
END
