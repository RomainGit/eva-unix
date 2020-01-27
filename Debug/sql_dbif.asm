	TITLE	D:\Travail\ABI\EVA\V4.0\CGI\Brunix-2016\sql_dbif.c
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
PUBLIC	_dll_call
EXTRN	__snprintf:NEAR
EXTRN	__imp__LoadLibraryA@4:NEAR
EXTRN	__imp__FreeLibrary@4:NEAR
EXTRN	__imp__GetProcAddress@8:NEAR
EXTRN	_err_add_context:NEAR
EXTRN	_err_clear:NEAR
_DATA	SEGMENT
$SG70217 DB	'%s\%s', 00H
	ORG $+2
$SG70220 DB	'Cannot load DLL', 00H
$SG70224 DB	'DLL function not found', 00H
	ORG $+1
$SG70227 DB	'D:\Travail\ABI\EVA\V4.0\CGI\Brunix-2016\sql_dbif.c', 00H
	ORG $+1
$SG70228 DB	'dll_call', 00H
	ORG $+3
$SG70230 DB	'D:\Travail\ABI\EVA\V4.0\CGI\Brunix-2016\sql_dbif.c', 00H
	ORG $+1
$SG70231 DB	'dll_call', 00H
_DATA	ENDS
_TEXT	SEGMENT
_cntxt$ = 8
_i_ctrl$ = 12
_lib$ = 16
_fnct$ = 20
_dllpath$ = -1024
_h$ = -1032
_f$ = -1028
_dll_call PROC NEAR

; 31   :     ){

	push	ebp
	mov	ebp, esp
	sub	esp, 1032				; 00000408H

; 32   :         char dllpath[1024];
; 33   :         HINSTANCE h;
; 34   :         FARPROC f;
; 35   : 
; 36   :         /* Load DLL - return on error */
; 37   :         snprintf(add_sz_str(dllpath), "%s" DD "%s", cntxt->path, lib);

	mov	eax, DWORD PTR _lib$[ebp]
	push	eax
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	edx, DWORD PTR [ecx+29728]
	push	edx
	push	OFFSET FLAT:$SG70217
	push	1023					; 000003ffH
	lea	eax, DWORD PTR _dllpath$[ebp]
	push	eax
	call	__snprintf
	add	esp, 20					; 00000014H

; 38   :         h = LoadLibrary(dllpath);

	lea	ecx, DWORD PTR _dllpath$[ebp]
	push	ecx
	call	DWORD PTR __imp__LoadLibraryA@4
	mov	DWORD PTR _h$[ebp], eax

; 39   :         if(!h) RETURN_ERROR("Cannot load DLL", NOP);

	cmp	DWORD PTR _h$[ebp], 0
	jne	SHORT $L70218
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29872], OFFSET FLAT:$SG70220
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 39		; 00000027H
	jmp	SHORT $eva_err$70221
$L70218:

; 40   : 
; 41   :         /* Get function adress - return on error */
; 42   :         f = GetProcAddress(h, fnct);

	mov	ecx, DWORD PTR _fnct$[ebp]
	push	ecx
	mov	edx, DWORD PTR _h$[ebp]
	push	edx
	call	DWORD PTR __imp__GetProcAddress@8
	mov	DWORD PTR _f$[ebp], eax

; 43   :         if(!f) RETURN_ERROR("DLL function not found", NOP);

	cmp	DWORD PTR _f$[ebp], 0
	jne	SHORT $L70222
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29872], OFFSET FLAT:$SG70224
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 43		; 0000002bH
	jmp	SHORT $eva_err$70221
$L70222:

; 44   : 
; 45   :         /* Call function - return on error */
; 46   :         if(f(cntxt, i_ctrl)) STACK_ERROR;

	mov	edx, DWORD PTR _i_ctrl$[ebp]
	push	edx
	mov	eax, DWORD PTR _cntxt$[ebp]
	push	eax
	call	DWORD PTR _f$[ebp]
	test	eax, eax
	je	SHORT $eva_noerr$70226
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 46		; 0000002eH
	jmp	SHORT $eva_err$70221
$eva_noerr$70226:

; 47   : 
; 48   :         RETURN_OK_CLEANUP;

	push	0
	push	OFFSET FLAT:$SG70227
	push	OFFSET FLAT:$SG70228
	mov	edx, DWORD PTR _cntxt$[ebp]
	push	edx
	call	_err_clear
	add	esp, 16					; 00000010H
$eva_err$70221:
	mov	eax, DWORD PTR _cntxt$[ebp]
	cmp	DWORD PTR [eax+29872], 0
	je	SHORT $L70229
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	edx, DWORD PTR [ecx+29900]
	push	edx
	push	OFFSET FLAT:$SG70230
	push	OFFSET FLAT:$SG70231
	mov	eax, DWORD PTR _cntxt$[ebp]
	push	eax
	call	_err_add_context
	add	esp, 16					; 00000010H
$L70229:
	cmp	DWORD PTR _h$[ebp], 0
	je	SHORT $L70232
	mov	ecx, DWORD PTR _h$[ebp]
	push	ecx
	call	DWORD PTR __imp__FreeLibrary@4
$L70232:
	mov	edx, DWORD PTR _cntxt$[ebp]
	xor	eax, eax
	cmp	DWORD PTR [edx+29872], 0
	setne	al

; 49   :     }

	mov	esp, ebp
	pop	ebp
	ret	0
_dll_call ENDP
_TEXT	ENDS
PUBLIC	_sql_use_db
EXTRN	_file_read_config:NEAR
EXTRN	_mysql_real_connect@32:NEAR
_DATA	SEGMENT
	ORG $+3
$SG70245 DB	'root', 00H
	ORG $+3
$SG70247 DB	'Pas de connexion au serveur SQL', 00H
$SG70249 DB	'D:\Travail\ABI\EVA\V4.0\CGI\Brunix-2016\sql_dbif.c', 00H
	ORG $+1
$SG70250 DB	'sql_use_db', 00H
	ORG $+1
$SG70252 DB	'D:\Travail\ABI\EVA\V4.0\CGI\Brunix-2016\sql_dbif.c', 00H
	ORG $+1
$SG70253 DB	'sql_use_db', 00H
_DATA	ENDS
_TEXT	SEGMENT
_cntxt$ = 8
_dbname$ = 12
_sql_use_db PROC NEAR

; 65   : ){

	push	ebp
	mov	ebp, esp

; 66   : 	/* Connect to MySql server - return on error */
; 67   : 	if(!cntxt->dbpwd && file_read_config(cntxt)) STACK_ERROR;

	mov	eax, DWORD PTR _cntxt$[ebp]
	cmp	DWORD PTR [eax+29808], 0
	jne	SHORT $L70241
	mov	ecx, DWORD PTR _cntxt$[ebp]
	push	ecx
	call	_file_read_config
	add	esp, 4
	test	eax, eax
	je	SHORT $L70241
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 67		; 00000043H
	jmp	SHORT $eva_err$70242
$L70241:

; 68   : 	if(!mysql_real_connect(cntxt->sql_session, cntxt->srvaddr, "root", cntxt->dbpwd, dbname, MYSQL_PORT, NULL, 0))

	push	0
	push	0
	push	3306					; 00000ceaH
	mov	eax, DWORD PTR _dbname$[ebp]
	push	eax
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	edx, DWORD PTR [ecx+29808]
	push	edx
	push	OFFSET FLAT:$SG70245
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	ecx, DWORD PTR [eax+29812]
	push	ecx
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	eax, DWORD PTR [edx+29816]
	push	eax
	call	_mysql_real_connect@32
	test	eax, eax
	jne	SHORT $eva_noerr$70248

; 70   : 		RETURN_ERROR("Pas de connexion au serveur SQL", NOP);

	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29872], OFFSET FLAT:$SG70247
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 70		; 00000046H
	jmp	SHORT $eva_err$70242
$eva_noerr$70248:

; 72   : 	RETURN_OK_CLEANUP;

	push	0
	push	OFFSET FLAT:$SG70249
	push	OFFSET FLAT:$SG70250
	mov	eax, DWORD PTR _cntxt$[ebp]
	push	eax
	call	_err_clear
	add	esp, 16					; 00000010H
$eva_err$70242:
	mov	ecx, DWORD PTR _cntxt$[ebp]
	cmp	DWORD PTR [ecx+29872], 0
	je	SHORT $L70251
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	eax, DWORD PTR [edx+29900]
	push	eax
	push	OFFSET FLAT:$SG70252
	push	OFFSET FLAT:$SG70253
	mov	ecx, DWORD PTR _cntxt$[ebp]
	push	ecx
	call	_err_add_context
	add	esp, 16					; 00000010H
$L70251:
	mov	edx, DWORD PTR _cntxt$[ebp]
	xor	eax, eax
	cmp	DWORD PTR [edx+29872], 0
	setne	al

; 73   : }

	pop	ebp
	ret	0
_sql_use_db ENDP
_TEXT	ENDS
PUBLIC	_sql_control
PUBLIC	_sql_open_session
EXTRN	_clock:NEAR
EXTRN	_mysql_init@4:NEAR
_DATA	SEGMENT
	ORG $+1
$SG70266 DB	'Probl', 0c3H, 0a8H, 'me d''initialisation du serveur SQL'
	DB	00H
	ORG $+2
$SG70270 DB	'root', 00H
	ORG $+3
$SG70272 DB	'Pas de connexion au serveur SQL', 00H
$SG70273 DB	'D:\Travail\ABI\EVA\V4.0\CGI\Brunix-2016\sql_dbif.c', 00H
	ORG $+1
$SG70274 DB	'sql_open_session', 00H
	ORG $+3
$SG70276 DB	'D:\Travail\ABI\EVA\V4.0\CGI\Brunix-2016\sql_dbif.c', 00H
	ORG $+1
$SG70277 DB	'sql_open_session', 00H
_DATA	ENDS
_TEXT	SEGMENT
_cntxt$ = 8
_t0$ = -4
_sql_open_session PROC NEAR

; 86   : ){

	push	ebp
	mov	ebp, esp
	push	ecx

; 87   : 	/* Initialize MySql - return on error */
; 88   : 	clock_t t0 = clock();

	call	_clock
	mov	DWORD PTR _t0$[ebp], eax

; 89   : 
; 90   : 	if(cntxt->sql_session) RETURN_OK;

	mov	eax, DWORD PTR _cntxt$[ebp]
	cmp	DWORD PTR [eax+29816], 0
	je	SHORT $L70261
	jmp	$eva_noerr$70262
$L70261:

; 91   : 	cntxt->sql_session = mysql_init(NULL);

	push	0
	call	_mysql_init@4
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29816], eax

; 92   : 	if(!cntxt->sql_session)

	mov	edx, DWORD PTR _cntxt$[ebp]
	cmp	DWORD PTR [edx+29816], 0
	jne	SHORT $L70264

; 94   : 		RETURN_ERROR("Problème d'initialisation du serveur SQL", NOP);

	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29872], OFFSET FLAT:$SG70266
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 94		; 0000005eH
	jmp	$eva_err$70267
$L70264:

; 96   : 
; 97   : 	/* Connect to MySql server - return on error */
; 98   : 	if(!mysql_real_connect(cntxt->sql_session, cntxt->srvaddr, "root", cntxt->dbpwd, cntxt->dbname, MYSQL_PORT, NULL, 0))

	push	0
	push	0
	push	3306					; 00000ceaH
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	eax, DWORD PTR [edx+29804]
	push	eax
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	edx, DWORD PTR [ecx+29808]
	push	edx
	push	OFFSET FLAT:$SG70270
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	ecx, DWORD PTR [eax+29812]
	push	ecx
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	eax, DWORD PTR [edx+29816]
	push	eax
	call	_mysql_real_connect@32
	test	eax, eax
	jne	SHORT $L70269

; 100  : 		sql_control(cntxt, 0);

	push	0
	mov	ecx, DWORD PTR _cntxt$[ebp]
	push	ecx
	call	_sql_control
	add	esp, 8

; 101  : 		RETURN_ERROR("Pas de connexion au serveur SQL", NOP);

	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29872], OFFSET FLAT:$SG70272
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 101		; 00000065H
	jmp	SHORT $eva_err$70267
$L70269:

; 103  : 	cntxt->sqltime += clock() - t0;

	call	_clock
	sub	eax, DWORD PTR _t0$[ebp]
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	edx, DWORD PTR [ecx+32020]
	add	edx, eax
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+32020], edx
$eva_noerr$70262:

; 104  : 	RETURN_OK_CLEANUP;

	push	0
	push	OFFSET FLAT:$SG70273
	push	OFFSET FLAT:$SG70274
	mov	ecx, DWORD PTR _cntxt$[ebp]
	push	ecx
	call	_err_clear
	add	esp, 16					; 00000010H
$eva_err$70267:
	mov	edx, DWORD PTR _cntxt$[ebp]
	cmp	DWORD PTR [edx+29872], 0
	je	SHORT $L70275
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	ecx, DWORD PTR [eax+29900]
	push	ecx
	push	OFFSET FLAT:$SG70276
	push	OFFSET FLAT:$SG70277
	mov	edx, DWORD PTR _cntxt$[ebp]
	push	edx
	call	_err_add_context
	add	esp, 16					; 00000010H
$L70275:
	mov	eax, DWORD PTR _cntxt$[ebp]
	xor	ecx, ecx
	cmp	DWORD PTR [eax+29872], 0
	setne	cl
	mov	eax, ecx

; 105  : }

	mov	esp, ebp
	pop	ebp
	ret	0
_sql_open_session ENDP
_TEXT	ENDS
PUBLIC	_find_files
EXTRN	_time_to_datetxt:NEAR
EXTRN	_datetxt_to_format:NEAR
EXTRN	_human_filesize:NEAR
EXTRN	_sprintf:NEAR
EXTRN	__findfirst:NEAR
EXTRN	__findnext:NEAR
EXTRN	__findclose:NEAR
EXTRN	_dyntab_free:NEAR
EXTRN	_dyntab_add:NEAR
EXTRN	_chdir:NEAR
EXTRN	_getcwd:NEAR
_DATA	SEGMENT
	ORG $+3
$SG70307 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70316 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70317 DB	'%s (%s - %s)', 00H
	ORG $+3
$SG70321 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70325 DB	'D', 00H
	ORG $+2
$SG70327 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70329 DB	'%lu', 00H
$SG70333 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70337 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70340 DB	'D:\Travail\ABI\EVA\V4.0\CGI\Brunix-2016\sql_dbif.c', 00H
	ORG $+1
$SG70341 DB	'find_files', 00H
	ORG $+1
$SG70342 DB	'..', 00H
	ORG $+1
$SG70343 DB	'D:\Travail\ABI\EVA\V4.0\CGI\Brunix-2016\sql_dbif.c', 00H
	ORG $+1
$SG70344 DB	'find_files', 00H
	ORG $+1
$SG70346 DB	'D:\Travail\ABI\EVA\V4.0\CGI\Brunix-2016\sql_dbif.c', 00H
	ORG $+1
$SG70347 DB	'find_files', 00H
_DATA	ENDS
_TEXT	SEGMENT
_cntxt$ = 8
_files$ = 12
_path$ = 16
_mode$ = 20
_handle$ = -280
_cwd$ = -276
_filedata$ = -560
_date$ = -16
_row$70301 = -564
_buf$70310 = -1084
_date1$70311 = -1116
__tmp$70328 = -1148
_find_files PROC NEAR

; 126  : ){

	push	ebp
	mov	ebp, esp
	sub	esp, 1148				; 0000047cH
	push	edi

; 127  : 	long handle = 0;

	mov	DWORD PTR _handle$[ebp], 0

; 128  : 	char cwd[_MAX_PATH];
; 129  : 	struct _finddata_t filedata = {0};

	mov	DWORD PTR _filedata$[ebp], 0
	mov	ecx, 69					; 00000045H
	xor	eax, eax
	lea	edi, DWORD PTR _filedata$[ebp+4]
	rep stosd

; 130  : 	char date[16] = {0};

	mov	BYTE PTR _date$[ebp], 0
	xor	eax, eax
	mov	DWORD PTR _date$[ebp+1], eax
	mov	DWORD PTR _date$[ebp+5], eax
	mov	DWORD PTR _date$[ebp+9], eax
	mov	WORD PTR _date$[ebp+13], ax
	mov	BYTE PTR _date$[ebp+15], al

; 131  : 
; 132  : 	if(!files) return 0;

	cmp	DWORD PTR _files$[ebp], 0
	jne	SHORT $L70294
	xor	eax, eax
	jmp	$L70289
$L70294:

; 133  : 	if(mode & FreeFiles) dyntab_free(files);

	mov	ecx, DWORD PTR _mode$[ebp]
	and	ecx, 4
	test	ecx, ecx
	je	SHORT $L70295
	mov	edx, DWORD PTR _files$[ebp]
	push	edx
	call	_dyntab_free
	add	esp, 4
$L70295:

; 134  : 
; 135  : 	/* Find first file in path */
; 136  : 	handle = _findfirst(path, &filedata);

	lea	eax, DWORD PTR _filedata$[ebp]
	push	eax
	mov	ecx, DWORD PTR _path$[ebp]
	push	ecx
	call	__findfirst
	add	esp, 8
	mov	DWORD PTR _handle$[ebp], eax

; 137  : 	if(handle == -1L) RETURN_OK;

	cmp	DWORD PTR _handle$[ebp], -1
	jne	SHORT $L70296
	jmp	$eva_noerr$70297
$L70296:

; 138  : 	getcwd(add_sz_str(cwd));

	push	259					; 00000103H
	lea	edx, DWORD PTR _cwd$[ebp]
	push	edx
	call	_getcwd
	add	esp, 8
$L70298:

; 143  : 		unsigned long row = files->nbrows;

	mov	eax, DWORD PTR _files$[ebp]
	mov	ecx, DWORD PTR [eax]
	mov	DWORD PTR _row$70301[ebp], ecx

; 144  : 
; 145  : 		/* If entry must be listed */
; 146  : 		if(!(filedata.attrib & _A_SUBDIR) || mode & ListSubdirs)

	mov	edx, DWORD PTR _filedata$[ebp]
	and	edx, 16					; 00000010H
	test	edx, edx
	je	SHORT $L70303
	mov	eax, DWORD PTR _mode$[ebp]
	and	eax, 1
	test	eax, eax
	je	$L70335
$L70303:

; 148  : 			/* Add file name & infos */
; 149  : 			DYNTAB_ADD(files, row, 0, filedata.name, 0, NO_CONV);

	push	0
	push	0
	push	0
	lea	ecx, DWORD PTR _filedata$[ebp+20]
	push	ecx
	push	0
	mov	edx, DWORD PTR _row$70301[ebp]
	push	edx
	mov	eax, DWORD PTR _files$[ebp]
	push	eax
	call	_dyntab_add
	add	esp, 28					; 0000001cH
	test	eax, eax
	je	SHORT $L70305
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29872], OFFSET FLAT:$SG70307
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 149		; 00000095H
	jmp	$eva_err$70308
$L70305:

; 150  : 			if(mode & IncludeInfos)

	mov	eax, DWORD PTR _mode$[ebp]
	and	eax, 8
	test	eax, eax
	je	$L70335

; 152  : 				char buf[_MAX_PATH*2] = {0};

	mov	BYTE PTR _buf$70310[ebp], 0
	mov	ecx, 129				; 00000081H
	xor	eax, eax
	lea	edi, DWORD PTR _buf$70310[ebp+1]
	rep stosd
	stosw
	stosb

; 153  : 				char date1[32] = {0};

	mov	BYTE PTR _date1$70311[ebp], 0
	mov	ecx, 7
	xor	eax, eax
	lea	edi, DWORD PTR _date1$70311[ebp+1]
	rep stosd
	stosw
	stosb

; 154  : 				time_to_datetxt(filedata.time_write, date);

	lea	ecx, DWORD PTR _date$[ebp]
	push	ecx
	mov	edx, DWORD PTR _filedata$[ebp+12]
	push	edx
	call	_time_to_datetxt
	add	esp, 8

; 155  : 				datetxt_to_format(cntxt, date1, date, NULL);

	push	0
	lea	eax, DWORD PTR _date$[ebp]
	push	eax
	lea	ecx, DWORD PTR _date1$70311[ebp]
	push	ecx
	mov	edx, DWORD PTR _cntxt$[ebp]
	push	edx
	call	_datetxt_to_format
	add	esp, 16					; 00000010H

; 156  : 				DYNTAB_ADD(files, row, 5, date, 0, NO_CONV);

	push	0
	push	0
	push	0
	lea	eax, DWORD PTR _date$[ebp]
	push	eax
	push	5
	mov	ecx, DWORD PTR _row$70301[ebp]
	push	ecx
	mov	edx, DWORD PTR _files$[ebp]
	push	edx
	call	_dyntab_add
	add	esp, 28					; 0000001cH
	test	eax, eax
	je	SHORT $L70314
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29872], OFFSET FLAT:$SG70316
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 156		; 0000009cH
	jmp	$eva_err$70308
$L70314:

; 157  : 				snprintf(add_sz_str(buf), "%s (%s - %s)", filedata.name, date1, human_filesize(filedata.size));

	mov	edx, DWORD PTR _filedata$[ebp+16]
	push	edx
	call	_human_filesize
	add	esp, 4
	push	eax
	lea	eax, DWORD PTR _date1$70311[ebp]
	push	eax
	lea	ecx, DWORD PTR _filedata$[ebp+20]
	push	ecx
	push	OFFSET FLAT:$SG70317
	push	519					; 00000207H
	lea	edx, DWORD PTR _buf$70310[ebp]
	push	edx
	call	__snprintf
	add	esp, 24					; 00000018H

; 158  : 				DYNTAB_ADD(files, row, 1, buf, 0, NO_CONV);

	push	0
	push	0
	push	0
	lea	eax, DWORD PTR _buf$70310[ebp]
	push	eax
	push	1
	mov	ecx, DWORD PTR _row$70301[ebp]
	push	ecx
	mov	edx, DWORD PTR _files$[ebp]
	push	edx
	call	_dyntab_add
	add	esp, 28					; 0000001cH
	test	eax, eax
	je	SHORT $L70319
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29872], OFFSET FLAT:$SG70321
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 158		; 0000009eH
	jmp	$eva_err$70308
$L70319:

; 159  : 				DYNTAB_ADD(files, row, 2, filedata.attrib & _A_SUBDIR ? "D" : NULL, 0, NO_CONV);

	push	0
	push	0
	push	0
	mov	edx, DWORD PTR _filedata$[ebp]
	and	edx, 16					; 00000010H
	neg	edx
	sbb	edx, edx
	and	edx, OFFSET FLAT:$SG70325
	push	edx
	push	2
	mov	eax, DWORD PTR _row$70301[ebp]
	push	eax
	mov	ecx, DWORD PTR _files$[ebp]
	push	ecx
	call	_dyntab_add
	add	esp, 28					; 0000001cH
	test	eax, eax
	je	SHORT $L70324
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29872], OFFSET FLAT:$SG70327
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 159		; 0000009fH
	jmp	$eva_err$70308
$L70324:

; 160  : 				DYNTAB_ADD_INT(files, row, 3, filedata.size);

	mov	BYTE PTR __tmp$70328[ebp], 0
	mov	ecx, 7
	xor	eax, eax
	lea	edi, DWORD PTR __tmp$70328[ebp+1]
	rep stosd
	stosw
	stosb
	mov	ecx, DWORD PTR _filedata$[ebp+16]
	push	ecx
	push	OFFSET FLAT:$SG70329
	lea	edx, DWORD PTR __tmp$70328[ebp]
	push	edx
	call	_sprintf
	add	esp, 12					; 0000000cH
	push	0
	push	0
	push	0
	lea	eax, DWORD PTR __tmp$70328[ebp]
	push	eax
	push	3
	mov	ecx, DWORD PTR _row$70301[ebp]
	push	ecx
	mov	edx, DWORD PTR _files$[ebp]
	push	edx
	call	_dyntab_add
	add	esp, 28					; 0000001cH
	test	eax, eax
	je	SHORT $L70331
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29872], OFFSET FLAT:$SG70333
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 160		; 000000a0H
	jmp	$eva_err$70308
$L70331:

; 161  : 				DYNTAB_ADD(files, row, 4, cwd, 0, NO_CONV);

	push	0
	push	0
	push	0
	lea	edx, DWORD PTR _cwd$[ebp]
	push	edx
	push	4
	mov	eax, DWORD PTR _row$70301[ebp]
	push	eax
	mov	ecx, DWORD PTR _files$[ebp]
	push	ecx
	call	_dyntab_add
	add	esp, 28					; 0000001cH
	test	eax, eax
	je	SHORT $L70335
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29872], OFFSET FLAT:$SG70337
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 161		; 000000a1H
	jmp	$eva_err$70308
$L70335:

; 164  : 
; 165  : 		/* Recurse subdir if applicable */
; 166  : 		if(filedata.attrib & _A_SUBDIR && mode & RecurseSubdirs && !chdir(filedata.name))

	mov	ecx, DWORD PTR _filedata$[ebp]
	and	ecx, 16					; 00000010H
	test	ecx, ecx
	je	SHORT $L70338
	mov	edx, DWORD PTR _mode$[ebp]
	and	edx, 2
	test	edx, edx
	je	SHORT $L70338
	lea	eax, DWORD PTR _filedata$[ebp+20]
	push	eax
	call	_chdir
	add	esp, 4
	test	eax, eax
	jne	SHORT $L70338

; 168  : 			if(find_files(cntxt, files, path, mode)) CLEAR_ERROR;

	mov	ecx, DWORD PTR _mode$[ebp]
	push	ecx
	mov	edx, DWORD PTR _path$[ebp]
	push	edx
	mov	eax, DWORD PTR _files$[ebp]
	push	eax
	mov	ecx, DWORD PTR _cntxt$[ebp]
	push	ecx
	call	_find_files
	add	esp, 16					; 00000010H
	test	eax, eax
	je	SHORT $L70339
	push	168					; 000000a8H
	push	OFFSET FLAT:$SG70340
	push	OFFSET FLAT:$SG70341
	mov	edx, DWORD PTR _cntxt$[ebp]
	push	edx
	call	_err_clear
	add	esp, 16					; 00000010H
$L70339:

; 169  : 			chdir("..");

	push	OFFSET FLAT:$SG70342
	call	_chdir
	add	esp, 4
$L70338:

; 171  : 
; 172  : 	} while (!_findnext(handle, &filedata));

	lea	eax, DWORD PTR _filedata$[ebp]
	push	eax
	mov	ecx, DWORD PTR _handle$[ebp]
	push	ecx
	call	__findnext
	add	esp, 8
	test	eax, eax
	je	$L70298
$eva_noerr$70297:

; 173  : 
; 174  : 	RETURN_OK_CLEANUP;

	push	0
	push	OFFSET FLAT:$SG70343
	push	OFFSET FLAT:$SG70344
	mov	edx, DWORD PTR _cntxt$[ebp]
	push	edx
	call	_err_clear
	add	esp, 16					; 00000010H
$eva_err$70308:
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
	mov	ecx, DWORD PTR _handle$[ebp]
	push	ecx
	call	__findclose
	add	esp, 4
	mov	edx, DWORD PTR _cntxt$[ebp]
	xor	eax, eax
	cmp	DWORD PTR [edx+29872], 0
	setne	al
$L70289:

; 175  : }

	pop	edi
	mov	esp, ebp
	pop	ebp
	ret	0
_find_files ENDP
_TEXT	ENDS
EXTRN	__imp__DebugBreak@0:NEAR
EXTRN	_mysql_server_init@12:NEAR
EXTRN	__imp__Sleep@4:NEAR
EXTRN	_mysql_close@4:NEAR
EXTRN	_rand:NEAR
EXTRN	_mysql_shutdown@4:NEAR
_DATA	SEGMENT
	ORG $+1
$SG70375 DB	'CR_COMMANDS_OUT_OF_SYNC', 00H
$SG70377 DB	'CR_SERVER_GONE_ERROR', 00H
	ORG $+3
$SG70379 DB	'CR_SERVER_LOST', 00H
	ORG $+1
$SG70381 DB	'CR_UNKNOWN_ERROR', 00H
	ORG $+3
$SG70382 DB	'Impossible d''arr', 0c3H, 0a9H, 'ter le serveur SQL', 00H
	ORG $+3
$SG70388 DB	'SQL server initialisation failure', 00H
_DATA	ENDS
_TEXT	SEGMENT
_cntxt$ = 8
_mode$ = 12
_t0$ = -4
_i$70394 = -8
_sql_control PROC NEAR

; 184  :     {

	push	ebp
	mov	ebp, esp
	sub	esp, 16					; 00000010H

; 185  :         clock_t t0 = clock();

	call	_clock
	mov	DWORD PTR _t0$[ebp], eax

; 186  :         switch(mode)
; 187  :         {

	mov	eax, DWORD PTR _mode$[ebp]
	mov	DWORD PTR -12+[ebp], eax
	cmp	DWORD PTR -12+[ebp], 10			; 0000000aH
	ja	$L70392
	mov	ecx, DWORD PTR -12+[ebp]
	jmp	DWORD PTR $L70620[ecx*4]
$L70359:

; 188  :         case 0:	/* Close session */
; 189  :             if(!cntxt->sql_session) return NULL;

	mov	edx, DWORD PTR _cntxt$[ebp]
	cmp	DWORD PTR [edx+29816], 0
	jne	SHORT $L70360
	xor	eax, eax
	jmp	$L70353
$L70360:

; 190  :             mysql_close(cntxt->sql_session);

	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	ecx, DWORD PTR [eax+29816]
	push	ecx
	call	_mysql_close@4

; 191  :             cntxt->sql_session = NULL;

	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29816], 0

; 192  :             return NULL;

	xor	eax, eax
	jmp	$L70353
$L70364:

; 193  : 
; 194  :         case 1: /* MySQL shutdown */
; 195  :             if(!cntxt->sql_session) return NULL;

	mov	eax, DWORD PTR _cntxt$[ebp]
	cmp	DWORD PTR [eax+29816], 0
	jne	SHORT $L70365
	xor	eax, eax
	jmp	$L70353
$L70365:

; 196  :             switch(mysql_shutdown(cntxt->sql_session))
; 197  :             {

	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	edx, DWORD PTR [ecx+29816]
	push	edx
	call	_mysql_shutdown@4
	mov	DWORD PTR -16+[ebp], eax
	cmp	DWORD PTR -16+[ebp], 2006		; 000007d6H
	jg	SHORT $L70619
	cmp	DWORD PTR -16+[ebp], 2006		; 000007d6H
	je	SHORT $L70376
	cmp	DWORD PTR -16+[ebp], 0
	je	SHORT $L70371
	cmp	DWORD PTR -16+[ebp], 2000		; 000007d0H
	je	SHORT $L70380
	jmp	SHORT $L70368
$L70619:
	cmp	DWORD PTR -16+[ebp], 2013		; 000007ddH
	je	SHORT $L70378
	cmp	DWORD PTR -16+[ebp], 2014		; 000007deH
	je	SHORT $L70374
	jmp	SHORT $L70368
$L70371:

; 198  :             case 0:
; 199  :                 cntxt->sql_session = NULL;

	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29816], 0

; 200  :                 cntxt->sqltime += clock() - t0;

	call	_clock
	sub	eax, DWORD PTR _t0$[ebp]
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	edx, DWORD PTR [ecx+32020]
	add	edx, eax
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+32020], edx

; 201  :                 return NULL;

	xor	eax, eax
	jmp	$L70353
$L70374:

; 202  :             case CR_COMMANDS_OUT_OF_SYNC: return "CR_COMMANDS_OUT_OF_SYNC";

	mov	eax, OFFSET FLAT:$SG70375
	jmp	$L70353
$L70376:

; 203  :             case CR_SERVER_GONE_ERROR: return "CR_SERVER_GONE_ERROR";

	mov	eax, OFFSET FLAT:$SG70377
	jmp	$L70353
$L70378:

; 204  :             case CR_SERVER_LOST: return "CR_SERVER_LOST";

	mov	eax, OFFSET FLAT:$SG70379
	jmp	$L70353
$L70380:

; 205  :             case CR_UNKNOWN_ERROR: return "CR_UNKNOWN_ERROR";

	mov	eax, OFFSET FLAT:$SG70381
	jmp	$L70353
$L70368:

; 207  :             cntxt->sqltime += clock() - t0;

	call	_clock
	sub	eax, DWORD PTR _t0$[ebp]
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	edx, DWORD PTR [ecx+32020]
	add	edx, eax
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+32020], edx

; 208  :             return "Impossible d'arréter le serveur SQL";

	mov	eax, OFFSET FLAT:$SG70382
	jmp	SHORT $L70353
$L70383:

; 209  : 
; 210  :         case 2: /* Server soft reboot */
; 211  :         case 3: /* Server hard reboot */
; 212  :            /* {
; 213  :                 HANDLE hToken;
; 214  :                 TOKEN_PRIVILEGES tkp;
; 215  : 
; 216  :                 if (!OpenProcessToken(GetCurrentProcess(), TOKEN_ADJUST_PRIVILEGES | TOKEN_QUERY, &hToken)) ;
; 217  :                 LookupPrivilegeValue(NULL, SE_SHUTDOWN_NAME, &tkp.Privileges[0].Luid);
; 218  :                 tkp.PrivilegeCount = 1;
; 219  :                 tkp.Privileges[0].Attributes = SE_PRIVILEGE_ENABLED;
; 220  :                 AdjustTokenPrivileges(hToken, FALSE, &tkp, 0, (PTOKEN_PRIVILEGES)NULL, 0);
; 221  :             }
; 222  :             if(!ExitWindowsEx(EWX_REBOOT | (mode == 2 ? EWX_SHUTDOWN : EWX_FORCE), 0))
; 223  :                 return "Redémarrage refusé par Windows";
; 224  :             Sleep(20000);
; 225  :             return "Le serveur n'a toujours pas redémarré";*/
; 226  : 
; 227  :         case 4:	/* Debug break */
; 228  :              BUILTINTRAP;

	call	DWORD PTR __imp__DebugBreak@0

; 229  :             break;

	jmp	SHORT $L70356
$L70384:

; 230  : 
; 231  :         case 5:	/* Server initialisation */
; 232  :             if(mysql_server_init(0, NULL, NULL))

	push	0
	push	0
	push	0
	call	_mysql_server_init@12
	test	eax, eax
	je	SHORT $L70387

; 233  :                 return "SQL server initialisation failure";

	mov	eax, OFFSET FLAT:$SG70388
	jmp	SHORT $L70353
$L70387:

; 234  :             break;

	jmp	SHORT $L70356
$L70389:

; 235  : 
; 236  :         case 6:	/* Server usage end */
; 237  :             /*mysql_library_end();*/
; 238  :             break;

	jmp	SHORT $L70356
$L70390:

; 239  : 
; 240  :         case 10:	/* Server random wait (for deadlock resolution during new obj Id creation) */
; 241  :             SLEEP(50 * (unsigned long)(rand() % 100));

	call	_rand
	cdq
	mov	ecx, 100				; 00000064H
	idiv	ecx
	imul	edx, 50					; 00000032H
	push	edx
	call	DWORD PTR __imp__Sleep@4

; 242  :             break;

	jmp	SHORT $L70356
$L70392:

; 243  : 
; 244  :         default:	/* Server charge balancing for lengthy processes */
; 245  :             if(mode < 0)

	cmp	DWORD PTR _mode$[ebp], 0
	jge	SHORT $L70397

; 247  :                 int i = mode;

	mov	edx, DWORD PTR _mode$[ebp]
	mov	DWORD PTR _i$70394[ebp], edx
$L70396:

; 248  :                 while(i)

	cmp	DWORD PTR _i$70394[ebp], 0
	je	SHORT $L70397

; 250  :                     SLEEP(0);	/* Give control to other processes */

	push	0
	call	DWORD PTR __imp__Sleep@4

; 251  :                     i++;

	mov	eax, DWORD PTR _i$70394[ebp]
	add	eax, 1
	mov	DWORD PTR _i$70394[ebp], eax

; 252  :                 }

	jmp	SHORT $L70396
$L70397:
$L70356:

; 255  :         return NULL;

	xor	eax, eax
$L70353:

; 256  :     }

	mov	esp, ebp
	pop	ebp
	ret	0
$L70620:
	DD	$L70359
	DD	$L70364
	DD	$L70383
	DD	$L70383
	DD	$L70383
	DD	$L70384
	DD	$L70389
	DD	$L70392
	DD	$L70392
	DD	$L70392
	DD	$L70390
_sql_control ENDP
_TEXT	ENDS
PUBLIC	_sql_insert_id
EXTRN	_mysql_insert_id@4:NEAR
_TEXT	SEGMENT
_cntxt$ = 8
_sql_insert_id PROC NEAR

; 263  : {

	push	ebp
	mov	ebp, esp

; 264  : 	return (unsigned long)mysql_insert_id(cntxt->sql_session);

	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	ecx, DWORD PTR [eax+29816]
	push	ecx
	call	_mysql_insert_id@4

; 265  : }

	pop	ebp
	ret	0
_sql_insert_id ENDP
_TEXT	ENDS
PUBLIC	_sql_free_result
EXTRN	_mysql_free_result@4:NEAR
_TEXT	SEGMENT
_cntxt$ = 8
_sql_free_result PROC NEAR

; 272  : {

	push	ebp
	mov	ebp, esp

; 273  : 	if(!cntxt->sql_result) return;

	mov	eax, DWORD PTR _cntxt$[ebp]
	cmp	DWORD PTR [eax+29832], 0
	jne	SHORT $L70406
	jmp	SHORT $L70405
$L70406:

; 274  : 	mysql_free_result(cntxt->sql_result);

	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	edx, DWORD PTR [ecx+29832]
	push	edx
	call	_mysql_free_result@4

; 275  : 	cntxt->sql_result = NULL;

	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29832], 0
$L70405:

; 276  : }

	pop	ebp
	ret	0
_sql_free_result ENDP
_TEXT	ENDS
PUBLIC	_sql_free_row
EXTRN	_mem_free:NEAR
EXTRN	_memset:NEAR
_TEXT	SEGMENT
_row$ = 8
_sql_free_row PROC NEAR

; 283  : {

	push	ebp
	mov	ebp, esp

; 284  : 	if(!row) return;

	cmp	DWORD PTR _row$[ebp], 0
	jne	SHORT $L70411
	jmp	SHORT $L70410
$L70411:

; 285  : 	M_FREE(row->name);

	mov	eax, DWORD PTR _row$[ebp]
	mov	ecx, DWORD PTR [eax+4]
	push	ecx
	call	_mem_free
	add	esp, 4
	mov	edx, DWORD PTR _row$[ebp]
	mov	DWORD PTR [edx+4], 0

; 286  : 	memset(row, 0, sizeof(row[0]));

	push	16					; 00000010H
	push	0
	mov	eax, DWORD PTR _row$[ebp]
	push	eax
	call	_memset
	add	esp, 12					; 0000000cH
$L70410:

; 287  : }

	pop	ebp
	ret	0
_sql_free_row ENDP
_TEXT	ENDS
PUBLIC	_sql_get_unsigned_status_var
EXTRN	_mysql_query@8:NEAR
EXTRN	_strtoul:NEAR
EXTRN	_mysql_store_result@4:NEAR
EXTRN	_mysql_fetch_row@4:NEAR
_DATA	SEGMENT
	ORG $+2
$SG70421 DB	'SHOW STATUS LIKE ''%s''', 00H
_DATA	ENDS
_TEXT	SEGMENT
_cntxt$ = 8
_varname$ = 12
_qry$ = -512
_res$ = -520
_row$ = -516
_sql_get_unsigned_status_var PROC NEAR

; 296  : ){

	push	ebp
	mov	ebp, esp
	sub	esp, 520				; 00000208H

; 297  : 	char qry[512];
; 298  : 	MYSQL_RES *res;
; 299  : 	MYSQL_ROW row;
; 300  : 
; 301  : 	snprintf(add_sz_str(qry), "SHOW STATUS LIKE '%s'", varname);

	mov	eax, DWORD PTR _varname$[ebp]
	push	eax
	push	OFFSET FLAT:$SG70421
	push	511					; 000001ffH
	lea	ecx, DWORD PTR _qry$[ebp]
	push	ecx
	call	__snprintf
	add	esp, 16					; 00000010H

; 302  : 	if(mysql_query(cntxt->sql_session, qry)) return ~0UL;

	lea	edx, DWORD PTR _qry$[ebp]
	push	edx
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	ecx, DWORD PTR [eax+29816]
	push	ecx
	call	_mysql_query@8
	test	eax, eax
	je	SHORT $L70422
	or	eax, -1
	jmp	SHORT $L70417
$L70422:

; 303  : 	res = mysql_store_result(cntxt->sql_session);

	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	eax, DWORD PTR [edx+29816]
	push	eax
	call	_mysql_store_result@4
	mov	DWORD PTR _res$[ebp], eax

; 304  : 	if(!res) return ~0UL;

	cmp	DWORD PTR _res$[ebp], 0
	jne	SHORT $L70423
	or	eax, -1
	jmp	SHORT $L70417
$L70423:

; 305  : 	row = mysql_fetch_row(res);

	mov	ecx, DWORD PTR _res$[ebp]
	push	ecx
	call	_mysql_fetch_row@4
	mov	DWORD PTR _row$[ebp], eax

; 306  : 	if(!row || !row[1]) return ~0UL;

	cmp	DWORD PTR _row$[ebp], 0
	je	SHORT $L70425
	mov	edx, DWORD PTR _row$[ebp]
	cmp	DWORD PTR [edx+4], 0
	jne	SHORT $L70424
$L70425:
	or	eax, -1
	jmp	SHORT $L70417
$L70424:

; 307  : 	return strtoul(row[1], NULL, 10);

	push	10					; 0000000aH
	push	0
	mov	eax, DWORD PTR _row$[ebp]
	mov	ecx, DWORD PTR [eax+4]
	push	ecx
	call	_strtoul
	add	esp, 12					; 0000000cH
$L70417:

; 308  : }

	mov	esp, ebp
	pop	ebp
	ret	0
_sql_get_unsigned_status_var ENDP
_TEXT	ENDS
PUBLIC	_sql_exec_query
PUBLIC	__real@8@4008fa00000000000000
PUBLIC	__real@8@3ffbccccccccccccd000
EXTRN	_mysql_field_count@4:NEAR
EXTRN	_mysql_affected_rows@4:NEAR
EXTRN	_mysql_error@4:NEAR
EXTRN	_no_tab_cr:BYTE
EXTRN	_dynbuf_add:NEAR
EXTRN	_dynbuf_add3:NEAR
EXTRN	_dynbuf_add3_int:NEAR
EXTRN	_strlen:NEAR
EXTRN	_dyntab_field_val:NEAR
EXTRN	__fltused:NEAR
_BSS	SEGMENT
$SG70537 DB	01H DUP (?)
	ALIGN	4

$SG70570 DB	01H DUP (?)
_BSS	ENDS
_DATA	SEGMENT
	ORG $+2
$SG70442 DB	'_EVA_SQL_INDEX', 00H
	ORG $+1
$SG70450 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70453 DB	'*** Error : ', 00H
	ORG $+3
$SG70457 DB	0aH, '*** Query : ', 00H
	ORG $+2
$SG70463 DB	0aH, 00H
	ORG $+2
$SG70464 DB	0aH, '*** Error : ', 00H
	ORG $+2
$SG70466 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70468 DB	'Erreur dans une requ', 0c3H, 0aaH, 'te SQL', 00H
	ORG $+3
$SG70471 DB	'Impossible de lire le r', 0c3H, 0a9H, 'sultat d''une req'
	DB	'u', 0c3H, 0aaH, 'te ', 0c3H, 0a0H, ' la base de donn', 0c3H, 0a9H
	DB	'es', 00H
	ORG $+2
$SG70478 DB	0aH, '%4ld : ', 00H
	ORG $+3
$SG70480 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70485 DB	'%1.3f s ', 00H
	ORG $+3
$SG70487 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70492 DB	')', 00H
	ORG $+2
$SG70493 DB	'(', 00H
	ORG $+2
$SG70495 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70498 DB	0aH, 00H
	ORG $+2
$SG70499 DB	0aH, 00H
	ORG $+2
$SG70501 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70507 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70511 DB	')', 00H
	ORG $+2
$SG70512 DB	'(', 00H
	ORG $+2
$SG70514 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70518 DB	' rows', 00H
	ORG $+2
$SG70519 DB	' *** Result : ', 00H
	ORG $+1
$SG70521 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70524 DB	' rows', 00H
	ORG $+2
$SG70525 DB	' *** Affected : ', 00H
	ORG $+3
$SG70527 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70531 DB	0aH, 00H
	ORG $+2
$SG70533 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70538 DB	0aH, '=========> Slow query #', 00H
	ORG $+3
$SG70540 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70545 DB	' - time = %1.3f s', 00H
	ORG $+2
$SG70547 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70549 DB	' rows', 0aH, 00H
	ORG $+1
$SG70550 DB	' - ', 00H
$SG70552 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70556 DB	0aH, 00H
	ORG $+2
$SG70557 DB	'Form : ', 00H
$SG70559 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70563 DB	0aH, 00H
	ORG $+2
$SG70564 DB	'Ctrl : ', 00H
$SG70566 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70569 DB	0aH, 00H
	ORG $+2
$SG70572 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70574 DB	'D:\Travail\ABI\EVA\V4.0\CGI\Brunix-2016\sql_dbif.c', 00H
	ORG $+1
$SG70575 DB	'sql_exec_query', 00H
	ORG $+1
$SG70577 DB	'D:\Travail\ABI\EVA\V4.0\CGI\Brunix-2016\sql_dbif.c', 00H
	ORG $+1
$SG70578 DB	'sql_exec_query', 00H
_DATA	ENDS
;	COMDAT __real@8@4008fa00000000000000
; File D:\Travail\ABI\EVA\V4.0\CGI\Brunix-2016\sql_dbif.c
CONST	SEGMENT
__real@8@4008fa00000000000000 DQ 0408f400000000000r ; 1000
CONST	ENDS
;	COMDAT __real@8@3ffbccccccccccccd000
CONST	SEGMENT
__real@8@3ffbccccccccccccd000 DQ 03fb999999999999ar ; 0.1
CONST	ENDS
_TEXT	SEGMENT
_cntxt$ = 8
_query$ = 12
_t1$ = -8
_t2$ = -12
_sql_trace$ = -4
_query_sz$ = -16
_i$70440 = -20
_buf$70475 = -88
_buf$70481 = -156
_sz$70504 = -160
_buf$70541 = -292
_sql_exec_query PROC NEAR

; 324  : ){

	push	ebp
	mov	ebp, esp
	sub	esp, 308				; 00000134H
	push	edi

; 325  : 	clock_t t1, t2;
; 326  : 	int sql_trace = cntxt->sql_trace;

	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	ecx, DWORD PTR [eax+29852]
	mov	DWORD PTR _sql_trace$[ebp], ecx

; 327  : 	size_t query_sz = query ? strlen(query) : 0;

	cmp	DWORD PTR _query$[ebp], 0
	je	SHORT $L70626
	mov	edx, DWORD PTR _query$[ebp]
	push	edx
	call	_strlen
	add	esp, 4
	mov	DWORD PTR -296+[ebp], eax
	jmp	SHORT $L70627
$L70626:
	mov	DWORD PTR -296+[ebp], 0
$L70627:
	mov	eax, DWORD PTR -296+[ebp]
	mov	DWORD PTR _query_sz$[ebp], eax

; 328  : 
; 329  : 	cntxt->sql_cnt++;

	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	edx, DWORD PTR [ecx+29856]
	add	edx, 1
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29856], edx

; 330  : 	cntxt->sql_nbrows = 0;

	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29848], 0

; 331  : 
; 332  : 	if(!sql_trace)

	cmp	DWORD PTR _sql_trace$[ebp], 0
	jne	$L70443

; 334  : 		cntxt->sql_trace = cntxt->debug & (DEBUG_SQL | DEBUG_SQL_RES);

	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	eax, DWORD PTR [edx+29860]
	and	eax, 3
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29852], eax

; 335  : 		if(cntxt->sql_trace & DEBUG_SQL_RES && !(cntxt->sql_trace & DEBUG_FILTER))

	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	eax, DWORD PTR [edx+29852]
	and	eax, 2
	test	eax, eax
	je	SHORT $L70443
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	edx, DWORD PTR [ecx+29852]
	and	edx, 512				; 00000200H
	test	edx, edx
	jne	SHORT $L70443

; 337  : 			unsigned long i = strtoul(DYNTAB_FIELD_VAL(&cntxt->user_data, SQL_INDEX), NULL, 10);

	push	10					; 0000000aH
	push	0
	push	0
	push	-1
	push	OFFSET FLAT:$SG70442
	mov	eax, DWORD PTR _cntxt$[ebp]
	add	eax, 29428				; 000072f4H
	push	eax
	call	_dyntab_field_val
	add	esp, 16					; 00000010H
	push	eax
	call	_strtoul
	add	esp, 12					; 0000000cH
	mov	DWORD PTR _i$70440[ebp], eax

; 338  : 			if(i != cntxt->sql_cnt) cntxt->sql_trace ^= DEBUG_SQL_RES;

	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	edx, DWORD PTR _i$70440[ebp]
	cmp	edx, DWORD PTR [ecx+29856]
	je	SHORT $L70443
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	ecx, DWORD PTR [eax+29852]
	xor	ecx, 2
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29852], ecx
$L70443:

; 341  : 
; 342  : 	/* Open MySql session if needed */
; 343  : 	if(!cntxt->sql_session && sql_open_session(cntxt)) STACK_ERROR;

	mov	eax, DWORD PTR _cntxt$[ebp]
	cmp	DWORD PTR [eax+29816], 0
	jne	SHORT $L70444
	mov	ecx, DWORD PTR _cntxt$[ebp]
	push	ecx
	call	_sql_open_session
	add	esp, 4
	test	eax, eax
	je	SHORT $L70444
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 343		; 00000157H
	jmp	$eva_err$70445
$L70444:

; 344  : 
; 345  : 	/* Store query for further reference */
; 346  : 	if(cntxt->sql_qry) cntxt->sql_qry->cnt = 0;

	mov	eax, DWORD PTR _cntxt$[ebp]
	cmp	DWORD PTR [eax+29820], 0
	je	SHORT $L70446
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	edx, DWORD PTR [ecx+29820]
	mov	DWORD PTR [edx+4], 0
$L70446:

; 347  : 	DYNBUF_ADD(&cntxt->sql_qry, query, query_sz, NO_CONV);

	push	0
	push	0
	mov	eax, DWORD PTR _query_sz$[ebp]
	push	eax
	mov	ecx, DWORD PTR _query$[ebp]
	push	ecx
	mov	edx, DWORD PTR _cntxt$[ebp]
	add	edx, 29820				; 0000747cH
	push	edx
	call	_dynbuf_add
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L70448
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29872], OFFSET FLAT:$SG70450
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 347		; 0000015bH
	jmp	$eva_err$70445
$L70448:

; 348  : 
; 349  : 	/* Exec query on MySql server - return on error */
; 350  : 	t1 = clock();

	call	_clock
	mov	DWORD PTR _t1$[ebp], eax

; 351  : 	sql_free_result(cntxt);

	mov	edx, DWORD PTR _cntxt$[ebp]
	push	edx
	call	_sql_free_result
	add	esp, 4

; 352  : 	if(mysql_query(cntxt->sql_session, query))

	mov	eax, DWORD PTR _query$[ebp]
	push	eax
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	edx, DWORD PTR [ecx+29816]
	push	edx
	call	_mysql_query@8
	test	eax, eax
	je	$L70451

; 354  : 		cntxt->sqltime += clock() - t1;

	call	_clock
	sub	eax, DWORD PTR _t1$[ebp]
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	edx, DWORD PTR [ecx+32020]
	add	edx, eax
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+32020], edx

; 355  : 		ERR_PUT_TXT("*** Error : ", (char*)mysql_error(cntxt->sql_session), 0);

	push	0
	push	0
	push	12					; 0000000cH
	push	OFFSET FLAT:$SG70453
	mov	ecx, DWORD PTR _cntxt$[ebp]
	add	ecx, 29876				; 000074b4H
	push	ecx
	call	_dynbuf_add
	add	esp, 20					; 00000014H
	push	0
	push	0
	push	0
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	eax, DWORD PTR [edx+29816]
	push	eax
	call	_mysql_error@4
	push	eax
	mov	ecx, DWORD PTR _cntxt$[ebp]
	add	ecx, 29876				; 000074b4H
	push	ecx
	call	_dynbuf_add
	add	esp, 20					; 00000014H

; 356  : 		ERR_PUT_TXT("\n*** Query : ", query, query_sz);

	push	0
	push	0
	push	13					; 0000000dH
	push	OFFSET FLAT:$SG70457
	mov	edx, DWORD PTR _cntxt$[ebp]
	add	edx, 29876				; 000074b4H
	push	edx
	call	_dynbuf_add
	add	esp, 20					; 00000014H
	push	0
	push	0
	mov	eax, DWORD PTR _query_sz$[ebp]
	push	eax
	mov	ecx, DWORD PTR _query$[ebp]
	push	ecx
	mov	edx, DWORD PTR _cntxt$[ebp]
	add	edx, 29876				; 000074b4H
	push	edx
	call	_dynbuf_add
	add	esp, 20					; 00000014H

; 357  : 		if(cntxt->sql_trace)

	mov	eax, DWORD PTR _cntxt$[ebp]
	cmp	DWORD PTR [eax+29852], 0
	je	SHORT $L70462

; 358  : 			DYNBUF_ADD3(&cntxt->debug_msg, "\n*** Error : ", (char*)mysql_error(cntxt->sql_session), 0, NO_CONV, "\n");

	push	1
	push	OFFSET FLAT:$SG70463
	push	0
	push	0
	push	0
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	edx, DWORD PTR [ecx+29816]
	push	edx
	call	_mysql_error@4
	push	eax
	push	13					; 0000000dH
	push	OFFSET FLAT:$SG70464
	mov	eax, DWORD PTR _cntxt$[ebp]
	add	eax, 29864				; 000074a8H
	push	eax
	call	_dynbuf_add3
	add	esp, 36					; 00000024H
	test	eax, eax
	je	SHORT $L70462
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29872], OFFSET FLAT:$SG70466
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 358		; 00000166H
	jmp	$eva_err$70445
$L70462:

; 359  : 		RETURN_ERROR("Erreur dans une requête SQL", NOP);

	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29872], OFFSET FLAT:$SG70468
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 359		; 00000167H
	jmp	$eva_err$70445
$L70451:

; 361  : 
; 362  : 	/* Ask for results - return on error */
; 363  :     cntxt->sql_result = mysql_store_result(cntxt->sql_session) ;

	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	eax, DWORD PTR [edx+29816]
	push	eax
	call	_mysql_store_result@4
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29832], eax

; 364  : 	if(!cntxt->sql_result && mysql_field_count(cntxt->sql_session))

	mov	edx, DWORD PTR _cntxt$[ebp]
	cmp	DWORD PTR [edx+29832], 0
	jne	SHORT $L70469
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	ecx, DWORD PTR [eax+29816]
	push	ecx
	call	_mysql_field_count@4
	test	eax, eax
	je	SHORT $L70469

; 365  : 		RETURN_ERROR("Impossible de lire le résultat d'une requête à la base de données", NOP);

	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29872], OFFSET FLAT:$SG70471
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 365		; 0000016dH
	jmp	$eva_err$70445
$L70469:

; 366  : 	cntxt->sql_nbrows = (unsigned long)mysql_affected_rows(cntxt->sql_session);

	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	edx, DWORD PTR [ecx+29816]
	push	edx
	call	_mysql_affected_rows@4
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29848], eax

; 367  :  	t2 = clock();

	call	_clock
	mov	DWORD PTR _t2$[ebp], eax

; 368  : 	cntxt->sqltime += t2 - t1;

	mov	edx, DWORD PTR _t2$[ebp]
	sub	edx, DWORD PTR _t1$[ebp]
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	ecx, DWORD PTR [eax+32020]
	add	ecx, edx
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+32020], ecx

; 369  : 	cntxt->sql_restime = (double)(t2-t1)/CLOCKS_PER_SEC;

	mov	eax, DWORD PTR _t2$[ebp]
	sub	eax, DWORD PTR _t1$[ebp]
	mov	DWORD PTR -300+[ebp], eax
	fild	DWORD PTR -300+[ebp]
	fdiv	QWORD PTR __real@8@4008fa00000000000000
	mov	ecx, DWORD PTR _cntxt$[ebp]
	fstp	QWORD PTR [ecx+29840]

; 370  : 
; 371  : 	/* Output debug info */
; 372  : 	if(cntxt->sql_trace)

	mov	edx, DWORD PTR _cntxt$[ebp]
	cmp	DWORD PTR [edx+29852], 0
	je	$L70484

; 374  : 		DYNBUF_PRINTF(&cntxt->debug_msg, 64, "\n%4ld : ", cntxt->sql_cnt, NO_CONV);

	mov	BYTE PTR _buf$70475[ebp], 0
	mov	ecx, 16					; 00000010H
	xor	eax, eax
	lea	edi, DWORD PTR _buf$70475[ebp+1]
	rep stosd
	push	0
	push	0
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	ecx, DWORD PTR [eax+29856]
	push	ecx
	push	OFFSET FLAT:$SG70478
	push	64					; 00000040H
	lea	edx, DWORD PTR _buf$70475[ebp]
	push	edx
	call	__snprintf
	add	esp, 16					; 00000010H
	push	eax
	lea	eax, DWORD PTR _buf$70475[ebp]
	push	eax
	mov	ecx, DWORD PTR _cntxt$[ebp]
	add	ecx, 29864				; 000074a8H
	push	ecx
	call	_dynbuf_add
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L70477
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29872], OFFSET FLAT:$SG70480
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 374		; 00000176H
	jmp	$eva_err$70445
$L70477:

; 375  : 		DYNBUF_PRINTF(&cntxt->debug_msg, 64, "%1.3f s ", (double)(t2-t1)/CLOCKS_PER_SEC, NO_CONV);

	mov	BYTE PTR _buf$70481[ebp], 0
	mov	ecx, 16					; 00000010H
	xor	eax, eax
	lea	edi, DWORD PTR _buf$70481[ebp+1]
	rep stosd
	push	0
	push	0
	mov	ecx, DWORD PTR _t2$[ebp]
	sub	ecx, DWORD PTR _t1$[ebp]
	mov	DWORD PTR -304+[ebp], ecx
	fild	DWORD PTR -304+[ebp]
	fdiv	QWORD PTR __real@8@4008fa00000000000000
	sub	esp, 8
	fstp	QWORD PTR [esp]
	push	OFFSET FLAT:$SG70485
	push	64					; 00000040H
	lea	edx, DWORD PTR _buf$70481[ebp]
	push	edx
	call	__snprintf
	add	esp, 20					; 00000014H
	push	eax
	lea	eax, DWORD PTR _buf$70481[ebp]
	push	eax
	mov	ecx, DWORD PTR _cntxt$[ebp]
	add	ecx, 29864				; 000074a8H
	push	ecx
	call	_dynbuf_add
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L70484
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29872], OFFSET FLAT:$SG70487
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 375		; 00000177H
	jmp	$eva_err$70445
$L70484:

; 377  : 	if(cntxt->sql_trace & DEBUG_SQL_RES)

	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	edx, DWORD PTR [ecx+29852]
	and	edx, 2
	test	edx, edx
	je	$L70488

; 379  : 		if(cntxt->form && cntxt->form->ctrl && cntxt->form->i_ctrl < cntxt->form->nb_ctrl)

	mov	eax, DWORD PTR _cntxt$[ebp]
	cmp	DWORD PTR [eax+80], 0
	je	$L70491
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	edx, DWORD PTR [ecx+80]
	cmp	DWORD PTR [edx], 0
	je	SHORT $L70491
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	ecx, DWORD PTR [eax+80]
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	eax, DWORD PTR [edx+80]
	mov	ecx, DWORD PTR [ecx+8]
	cmp	ecx, DWORD PTR [eax+4]
	jae	SHORT $L70491

; 380  : 			DYNBUF_ADD3(&cntxt->debug_msg, "(", cntxt->form->ctrl[cntxt->form->i_ctrl].LABEL, 0, NO_CONV, ")");

	push	1
	push	OFFSET FLAT:$SG70492
	push	0
	push	0
	push	0
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	eax, DWORD PTR [edx+80]
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	edx, DWORD PTR [ecx+80]
	mov	ecx, DWORD PTR [edx+8]
	imul	ecx, 480				; 000001e0H
	mov	edx, DWORD PTR [eax]
	mov	eax, DWORD PTR [edx+ecx+284]
	push	eax
	push	1
	push	OFFSET FLAT:$SG70493
	mov	ecx, DWORD PTR _cntxt$[ebp]
	add	ecx, 29864				; 000074a8H
	push	ecx
	call	_dynbuf_add3
	add	esp, 36					; 00000024H
	test	eax, eax
	je	SHORT $L70491
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29872], OFFSET FLAT:$SG70495
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 380		; 0000017cH
	jmp	$eva_err$70445
$L70491:

; 381  : 		DYNBUF_ADD3(&cntxt->debug_msg, "\n", query, query_sz, NO_CONV, "\n");

	push	1
	push	OFFSET FLAT:$SG70498
	push	0
	push	0
	mov	ecx, DWORD PTR _query_sz$[ebp]
	push	ecx
	mov	edx, DWORD PTR _query$[ebp]
	push	edx
	push	1
	push	OFFSET FLAT:$SG70499
	mov	eax, DWORD PTR _cntxt$[ebp]
	add	eax, 29864				; 000074a8H
	push	eax
	call	_dynbuf_add3
	add	esp, 36					; 00000024H
	test	eax, eax
	je	SHORT $L70497
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29872], OFFSET FLAT:$SG70501
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 381		; 0000017dH
	jmp	$eva_err$70445
$L70497:

; 383  : 	else if(cntxt->sql_trace & DEBUG_SQL)

	jmp	$L70510
$L70488:
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	ecx, DWORD PTR [eax+29852]
	and	ecx, 1
	test	ecx, ecx
	je	$L70510

; 385  : 		size_t sz = strlen(query);

	mov	edx, DWORD PTR _query$[ebp]
	push	edx
	call	_strlen
	add	esp, 4
	mov	DWORD PTR _sz$70504[ebp], eax

; 386  : 		DYNBUF_ADD(&cntxt->debug_msg, query, sz, NO_TABCR);

	push	1
	push	OFFSET FLAT:_no_tab_cr
	mov	eax, DWORD PTR _sz$70504[ebp]
	push	eax
	mov	ecx, DWORD PTR _query$[ebp]
	push	ecx
	mov	edx, DWORD PTR _cntxt$[ebp]
	add	edx, 29864				; 000074a8H
	push	edx
	call	_dynbuf_add
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L70505
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29872], OFFSET FLAT:$SG70507
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 386		; 00000182H
	jmp	$eva_err$70445
$L70505:

; 387  : 		if(cntxt->form && cntxt->form->ctrl && cntxt->form->i_ctrl < cntxt->form->nb_ctrl)

	mov	edx, DWORD PTR _cntxt$[ebp]
	cmp	DWORD PTR [edx+80], 0
	je	$L70510
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	ecx, DWORD PTR [eax+80]
	cmp	DWORD PTR [ecx], 0
	je	SHORT $L70510
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	eax, DWORD PTR [edx+80]
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	edx, DWORD PTR [ecx+80]
	mov	eax, DWORD PTR [eax+8]
	cmp	eax, DWORD PTR [edx+4]
	jae	SHORT $L70510

; 388  : 			DYNBUF_ADD3(&cntxt->debug_msg, "(", cntxt->form->ctrl[cntxt->form->i_ctrl].LABEL, 0, NO_CONV, ")");

	push	1
	push	OFFSET FLAT:$SG70511
	push	0
	push	0
	push	0
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	edx, DWORD PTR [ecx+80]
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	ecx, DWORD PTR [eax+80]
	mov	eax, DWORD PTR [ecx+8]
	imul	eax, 480				; 000001e0H
	mov	ecx, DWORD PTR [edx]
	mov	edx, DWORD PTR [ecx+eax+284]
	push	edx
	push	1
	push	OFFSET FLAT:$SG70512
	mov	eax, DWORD PTR _cntxt$[ebp]
	add	eax, 29864				; 000074a8H
	push	eax
	call	_dynbuf_add3
	add	esp, 36					; 00000024H
	test	eax, eax
	je	SHORT $L70510
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29872], OFFSET FLAT:$SG70514
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 388		; 00000184H
	jmp	$eva_err$70445
$L70510:

; 390  : 	if(cntxt->sql_trace & (DEBUG_SQL | DEBUG_SQL_RES))

	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	ecx, DWORD PTR [eax+29852]
	and	ecx, 3
	test	ecx, ecx
	je	$L70515

; 392  : 		if(cntxt->sql_result) DYNBUF_ADD3_INT(&cntxt->debug_msg, " *** Result : ", cntxt->sql_nbrows, " rows")

	mov	edx, DWORD PTR _cntxt$[ebp]
	cmp	DWORD PTR [edx+29832], 0
	je	SHORT $L70516
	push	5
	push	OFFSET FLAT:$SG70518
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	ecx, DWORD PTR [eax+29848]
	push	ecx
	push	14					; 0000000eH
	push	OFFSET FLAT:$SG70519
	mov	edx, DWORD PTR _cntxt$[ebp]
	add	edx, 29864				; 000074a8H
	push	edx
	call	_dynbuf_add3_int
	add	esp, 24					; 00000018H
	test	eax, eax
	je	SHORT $L70517
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29872], OFFSET FLAT:$SG70521
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 392		; 00000188H
	jmp	$eva_err$70445
$L70517:

; 393  : 		else DYNBUF_ADD3_INT(&cntxt->debug_msg, " *** Affected : ", cntxt->sql_nbrows, " rows");

	jmp	SHORT $L70523
$L70516:
	push	5
	push	OFFSET FLAT:$SG70524
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	eax, DWORD PTR [edx+29848]
	push	eax
	push	16					; 00000010H
	push	OFFSET FLAT:$SG70525
	mov	ecx, DWORD PTR _cntxt$[ebp]
	add	ecx, 29864				; 000074a8H
	push	ecx
	call	_dynbuf_add3_int
	add	esp, 24					; 00000018H
	test	eax, eax
	je	SHORT $L70523
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29872], OFFSET FLAT:$SG70527
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 393		; 00000189H
	jmp	$eva_err$70445
$L70523:

; 394  : 		if(cntxt->sql_trace & DEBUG_SQL_RES) DYNBUF_ADD_STR(&cntxt->debug_msg, "\n");

	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	edx, DWORD PTR [ecx+29852]
	and	edx, 2
	test	edx, edx
	je	SHORT $L70530
	push	0
	push	0
	push	1
	push	OFFSET FLAT:$SG70531
	mov	eax, DWORD PTR _cntxt$[ebp]
	add	eax, 29864				; 000074a8H
	push	eax
	call	_dynbuf_add
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L70530
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29872], OFFSET FLAT:$SG70533
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 394		; 0000018aH
	jmp	$eva_err$70445
$L70530:

; 396  : 	else if(cntxt->debug & DEBUG_SQL_SLOW && cntxt->sql_restime > DEBUG_SQL_SLOW_TH)

	jmp	$L70568
$L70515:
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	ecx, DWORD PTR [eax+29860]
	and	ecx, 64					; 00000040H
	test	ecx, ecx
	je	$L70568
	mov	edx, DWORD PTR _cntxt$[ebp]
	fld	QWORD PTR [edx+29840]
	fcomp	QWORD PTR __real@8@3ffbccccccccccccd000
	fnstsw	ax
	test	ah, 65					; 00000041H
	jne	$L70568

; 398  : 		DYNBUF_ADD3_INT(&cntxt->debug_msg, "\n=========> Slow query #", cntxt->sql_cnt, "");

	push	0
	push	OFFSET FLAT:$SG70537
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	ecx, DWORD PTR [eax+29856]
	push	ecx
	push	24					; 00000018H
	push	OFFSET FLAT:$SG70538
	mov	edx, DWORD PTR _cntxt$[ebp]
	add	edx, 29864				; 000074a8H
	push	edx
	call	_dynbuf_add3_int
	add	esp, 24					; 00000018H
	test	eax, eax
	je	SHORT $L70536
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29872], OFFSET FLAT:$SG70540
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 398		; 0000018eH
	jmp	$eva_err$70445
$L70536:

; 399  : 		DYNBUF_PRINTF(&cntxt->debug_msg, 128, " - time = %1.3f s", (double)(t2-t1)/CLOCKS_PER_SEC, NO_CONV);

	mov	BYTE PTR _buf$70541[ebp], 0
	mov	ecx, 32					; 00000020H
	xor	eax, eax
	lea	edi, DWORD PTR _buf$70541[ebp+1]
	rep stosd
	push	0
	push	0
	mov	edx, DWORD PTR _t2$[ebp]
	sub	edx, DWORD PTR _t1$[ebp]
	mov	DWORD PTR -308+[ebp], edx
	fild	DWORD PTR -308+[ebp]
	fdiv	QWORD PTR __real@8@4008fa00000000000000
	sub	esp, 8
	fstp	QWORD PTR [esp]
	push	OFFSET FLAT:$SG70545
	push	128					; 00000080H
	lea	eax, DWORD PTR _buf$70541[ebp]
	push	eax
	call	__snprintf
	add	esp, 20					; 00000014H
	push	eax
	lea	ecx, DWORD PTR _buf$70541[ebp]
	push	ecx
	mov	edx, DWORD PTR _cntxt$[ebp]
	add	edx, 29864				; 000074a8H
	push	edx
	call	_dynbuf_add
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L70544
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29872], OFFSET FLAT:$SG70547
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 399		; 0000018fH
	jmp	$eva_err$70445
$L70544:

; 400  : 		DYNBUF_ADD3_INT(&cntxt->debug_msg, " - ", cntxt->sql_nbrows, " rows\n");

	push	6
	push	OFFSET FLAT:$SG70549
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	eax, DWORD PTR [edx+29848]
	push	eax
	push	3
	push	OFFSET FLAT:$SG70550
	mov	ecx, DWORD PTR _cntxt$[ebp]
	add	ecx, 29864				; 000074a8H
	push	ecx
	call	_dynbuf_add3_int
	add	esp, 24					; 00000018H
	test	eax, eax
	je	SHORT $L70548
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29872], OFFSET FLAT:$SG70552
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 400		; 00000190H
	jmp	$eva_err$70445
$L70548:

; 401  : 		if(cntxt->form && cntxt->form->ctrl)

	mov	ecx, DWORD PTR _cntxt$[ebp]
	cmp	DWORD PTR [ecx+80], 0
	je	$L70562
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	eax, DWORD PTR [edx+80]
	cmp	DWORD PTR [eax], 0
	je	$L70562

; 403  : 			DYNBUF_ADD3(&cntxt->debug_msg, "Form : ", cntxt->form->ctrl->LABEL, 0, NO_CONV, "\n")

	push	1
	push	OFFSET FLAT:$SG70556
	push	0
	push	0
	push	0
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	edx, DWORD PTR [ecx+80]
	mov	eax, DWORD PTR [edx]
	mov	ecx, DWORD PTR [eax+284]
	push	ecx
	push	7
	push	OFFSET FLAT:$SG70557
	mov	edx, DWORD PTR _cntxt$[ebp]
	add	edx, 29864				; 000074a8H
	push	edx
	call	_dynbuf_add3
	add	esp, 36					; 00000024H
	test	eax, eax
	je	SHORT $L70555
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29872], OFFSET FLAT:$SG70559
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 403		; 00000193H
	jmp	$eva_err$70445
$L70555:

; 404  : 			if(cntxt->form->ctrl && cntxt->form->i_ctrl < cntxt->form->nb_ctrl)

	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	eax, DWORD PTR [edx+80]
	cmp	DWORD PTR [eax], 0
	je	SHORT $L70562
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	edx, DWORD PTR [ecx+80]
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	ecx, DWORD PTR [eax+80]
	mov	edx, DWORD PTR [edx+8]
	cmp	edx, DWORD PTR [ecx+4]
	jae	SHORT $L70562

; 405  : 				DYNBUF_ADD3(&cntxt->debug_msg, "Ctrl : ", cntxt->form->ctrl[cntxt->form->i_ctrl].LABEL, 0, NO_CONV, "\n")

	push	1
	push	OFFSET FLAT:$SG70563
	push	0
	push	0
	push	0
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	ecx, DWORD PTR [eax+80]
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	eax, DWORD PTR [edx+80]
	mov	edx, DWORD PTR [eax+8]
	imul	edx, 480				; 000001e0H
	mov	eax, DWORD PTR [ecx]
	mov	ecx, DWORD PTR [eax+edx+284]
	push	ecx
	push	7
	push	OFFSET FLAT:$SG70564
	mov	edx, DWORD PTR _cntxt$[ebp]
	add	edx, 29864				; 000074a8H
	push	edx
	call	_dynbuf_add3
	add	esp, 36					; 00000024H
	test	eax, eax
	je	SHORT $L70562
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29872], OFFSET FLAT:$SG70566
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 405		; 00000195H
	jmp	SHORT $eva_err$70445
$L70562:

; 407  : 		DYNBUF_ADD3(&cntxt->debug_msg, "", query, query_sz, NO_CONV, "\n")

	push	1
	push	OFFSET FLAT:$SG70569
	push	0
	push	0
	mov	edx, DWORD PTR _query_sz$[ebp]
	push	edx
	mov	eax, DWORD PTR _query$[ebp]
	push	eax
	push	0
	push	OFFSET FLAT:$SG70570
	mov	ecx, DWORD PTR _cntxt$[ebp]
	add	ecx, 29864				; 000074a8H
	push	ecx
	call	_dynbuf_add3
	add	esp, 36					; 00000024H
	test	eax, eax
	je	SHORT $L70568
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29872], OFFSET FLAT:$SG70572
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 407		; 00000197H
	jmp	SHORT $eva_err$70445
$L70568:
$eva_noerr$70573:

; 409  : 
; 410  : 	RETURN_OK_CLEANUP;

	push	0
	push	OFFSET FLAT:$SG70574
	push	OFFSET FLAT:$SG70575
	mov	ecx, DWORD PTR _cntxt$[ebp]
	push	ecx
	call	_err_clear
	add	esp, 16					; 00000010H
$eva_err$70445:
	mov	edx, DWORD PTR _cntxt$[ebp]
	cmp	DWORD PTR [edx+29872], 0
	je	SHORT $L70576
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	ecx, DWORD PTR [eax+29900]
	push	ecx
	push	OFFSET FLAT:$SG70577
	push	OFFSET FLAT:$SG70578
	mov	edx, DWORD PTR _cntxt$[ebp]
	push	edx
	call	_err_add_context
	add	esp, 16					; 00000010H
$L70576:
	mov	eax, DWORD PTR _cntxt$[ebp]
	cmp	DWORD PTR [eax+29832], 0
	je	SHORT $L70579
	mov	ecx, DWORD PTR _cntxt$[ebp]
	cmp	DWORD PTR [ecx+29872], 0
	je	SHORT $L70579
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	eax, DWORD PTR [edx+29832]
	push	eax
	call	_mysql_free_result@4
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29832], 0
$L70579:
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	eax, DWORD PTR _sql_trace$[ebp]
	mov	DWORD PTR [edx+29852], eax
	mov	ecx, DWORD PTR _cntxt$[ebp]
	xor	eax, eax
	cmp	DWORD PTR [ecx+29872], 0
	setne	al

; 411  : }

	pop	edi
	mov	esp, ebp
	pop	ebp
	ret	0
_sql_exec_query ENDP
_TEXT	ENDS
PUBLIC	_sql_result_next_row
EXTRN	_mysql_num_fields@4:NEAR
EXTRN	_mysql_fetch_fields@4:NEAR
EXTRN	_mem_alloc:NEAR
EXTRN	_mysql_fetch_lengths@4:NEAR
_DATA	SEGMENT
	ORG $+1
$SG70594 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70601 DB	'D:\Travail\ABI\EVA\V4.0\CGI\Brunix-2016\sql_dbif.c', 00H
	ORG $+1
$SG70602 DB	'sql_result_next_row', 00H
$SG70604 DB	'D:\Travail\ABI\EVA\V4.0\CGI\Brunix-2016\sql_dbif.c', 00H
	ORG $+1
$SG70605 DB	'sql_result_next_row', 00H
_DATA	ENDS
_TEXT	SEGMENT
_cntxt$ = 8
_row$ = 12
_fields$ = -4
_i$ = -8
_sql_result_next_row PROC NEAR

; 425  : ){

	push	ebp
	mov	ebp, esp
	sub	esp, 8
	push	esi

; 426  : 	MYSQL_FIELD *fields;
; 427  : 	unsigned long i;
; 428  : 
; 429  : 	if(!row->nbcols)

	mov	eax, DWORD PTR _row$[ebp]
	cmp	DWORD PTR [eax], 0
	jne	$L70598

; 431  : 		row->nbcols = mysql_num_fields(cntxt->sql_result);

	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	edx, DWORD PTR [ecx+29832]
	push	edx
	call	_mysql_num_fields@4
	mov	ecx, DWORD PTR _row$[ebp]
	mov	DWORD PTR [ecx], eax

; 432  : 		M_FREE(row->name);

	mov	edx, DWORD PTR _row$[ebp]
	mov	eax, DWORD PTR [edx+4]
	push	eax
	call	_mem_free
	add	esp, 4
	mov	ecx, DWORD PTR _row$[ebp]
	mov	DWORD PTR [ecx+4], 0

; 433  : 		row->name = mem_alloc(sizeof(row->name[0]) * row->nbcols);

	mov	edx, DWORD PTR _row$[ebp]
	mov	eax, DWORD PTR [edx]
	shl	eax, 2
	push	eax
	call	_mem_alloc
	add	esp, 4
	mov	ecx, DWORD PTR _row$[ebp]
	mov	DWORD PTR [ecx+4], eax

; 434  : 		if(!row->name) RETURN_ERR_MEMORY;

	mov	edx, DWORD PTR _row$[ebp]
	cmp	DWORD PTR [edx+4], 0
	jne	SHORT $L70592
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29872], OFFSET FLAT:$SG70594
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 434		; 000001b2H
	jmp	$eva_err$70595
$L70592:

; 435  : 		fields = mysql_fetch_fields(cntxt->sql_result);

	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	eax, DWORD PTR [edx+29832]
	push	eax
	call	_mysql_fetch_fields@4
	mov	DWORD PTR _fields$[ebp], eax

; 436  : 		for(i = 0; i < row->nbcols; i++) row->name[i] = fields[i].name;

	mov	DWORD PTR _i$[ebp], 0
	jmp	SHORT $L70596
$L70597:
	mov	ecx, DWORD PTR _i$[ebp]
	add	ecx, 1
	mov	DWORD PTR _i$[ebp], ecx
$L70596:
	mov	edx, DWORD PTR _row$[ebp]
	mov	eax, DWORD PTR _i$[ebp]
	cmp	eax, DWORD PTR [edx]
	jae	SHORT $L70598
	mov	ecx, DWORD PTR _i$[ebp]
	imul	ecx, 40					; 00000028H
	mov	edx, DWORD PTR _row$[ebp]
	mov	eax, DWORD PTR [edx+4]
	mov	edx, DWORD PTR _i$[ebp]
	mov	esi, DWORD PTR _fields$[ebp]
	mov	ecx, DWORD PTR [esi+ecx]
	mov	DWORD PTR [eax+edx*4], ecx
	jmp	SHORT $L70597
$L70598:

; 438  : 
; 439  : 	row->value = mysql_fetch_row(cntxt->sql_result);

	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	eax, DWORD PTR [edx+29832]
	push	eax
	call	_mysql_fetch_row@4
	mov	ecx, DWORD PTR _row$[ebp]
	mov	DWORD PTR [ecx+8], eax

; 440  : 	row->sz = (size_t *)(mysql_fetch_lengths(cntxt->sql_result));

	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	eax, DWORD PTR [edx+29832]
	push	eax
	call	_mysql_fetch_lengths@4
	mov	ecx, DWORD PTR _row$[ebp]
	mov	DWORD PTR [ecx+12], eax
$eva_noerr$70600:

; 441  : 
; 442  : 	RETURN_OK_CLEANUP;

	push	0
	push	OFFSET FLAT:$SG70601
	push	OFFSET FLAT:$SG70602
	mov	edx, DWORD PTR _cntxt$[ebp]
	push	edx
	call	_err_clear
	add	esp, 16					; 00000010H
$eva_err$70595:
	mov	eax, DWORD PTR _cntxt$[ebp]
	cmp	DWORD PTR [eax+29872], 0
	je	SHORT $L70603
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	edx, DWORD PTR [ecx+29900]
	push	edx
	push	OFFSET FLAT:$SG70604
	push	OFFSET FLAT:$SG70605
	mov	eax, DWORD PTR _cntxt$[ebp]
	push	eax
	call	_err_add_context
	add	esp, 16					; 00000010H
$L70603:
	mov	ecx, DWORD PTR _cntxt$[ebp]
	xor	eax, eax
	cmp	DWORD PTR [ecx+29872], 0
	setne	al

; 443  : }

	pop	esi
	mov	esp, ebp
	pop	ebp
	ret	0
_sql_result_next_row ENDP
_TEXT	ENDS
END
