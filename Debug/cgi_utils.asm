	TITLE	D:\Travail\ABI\EVA\V4.0\CGI\Brunix-2016\cgi_utils.c
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
PUBLIC	_cgi_free_files
EXTRN	_mem_free:NEAR
EXTRN	_dyntab_free:NEAR
_TEXT	SEGMENT
_cntxt$ = 8
_i$70206 = -4
_cgi_free_files PROC NEAR

; 21   : {

	push	ebp
	mov	ebp, esp
	push	ecx

; 22   : 	if(cntxt && cntxt->cgi_file)

	cmp	DWORD PTR _cntxt$[ebp], 0
	je	SHORT $L70205
	mov	eax, DWORD PTR _cntxt$[ebp]
	cmp	DWORD PTR [eax+29660], 0
	je	SHORT $L70205

; 24   : 		unsigned long i;
; 25   : 		for(i = 0; i < cntxt->cgi_file_nb; i++)

	mov	DWORD PTR _i$70206[ebp], 0
	jmp	SHORT $L70207
$L70208:
	mov	ecx, DWORD PTR _i$70206[ebp]
	add	ecx, 1
	mov	DWORD PTR _i$70206[ebp], ecx
$L70207:
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	eax, DWORD PTR _i$70206[ebp]
	cmp	eax, DWORD PTR [edx+29664]
	jae	SHORT $L70209

; 26   : 			dyntab_free(&cntxt->cgi_file[i].descr);

	mov	ecx, DWORD PTR _i$70206[ebp]
	shl	ecx, 5
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	eax, DWORD PTR [edx+29660]
	lea	ecx, DWORD PTR [eax+ecx+8]
	push	ecx
	call	_dyntab_free
	add	esp, 4
	jmp	SHORT $L70208
$L70209:

; 27   : 		M_FREE(cntxt->cgi_file);

	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	eax, DWORD PTR [edx+29660]
	push	eax
	call	_mem_free
	add	esp, 4
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29660], 0
$L70205:

; 29   : }

	mov	esp, ebp
	pop	ebp
	ret	0
_cgi_free_files ENDP
_TEXT	ENDS
PUBLIC	_cgi_init_call
PUBLIC	_cgi_read_data
EXTRN	_getpid:NEAR
EXTRN	_time_to_datetxt:NEAR
EXTRN	_fclose:NEAR
EXTRN	_datetxt_to_format:NEAR
EXTRN	_fopen:NEAR
EXTRN	_fprintf:NEAR
EXTRN	__snprintf:NEAR
EXTRN	_sprintf:NEAR
EXTRN	_file_read_config:NEAR
EXTRN	_clock:NEAR
EXTRN	_time:NEAR
EXTRN	_sql_exec_query:NEAR
EXTRN	_sql_id_value:NEAR
EXTRN	_atoi:NEAR
EXTRN	_get_id_value:NEAR
EXTRN	_stat:NEAR
EXTRN	_strtoul:NEAR
EXTRN	_system:NEAR
EXTRN	_qry_obj_data:NEAR
EXTRN	_sql_get_table:NEAR
EXTRN	_dyntab_cell:NEAR
EXTRN	_strcmp:NEAR
EXTRN	_strlen:NEAR
EXTRN	_chdir:NEAR
EXTRN	_mkdir:NEAR
EXTRN	_dyntab_from_list:NEAR
EXTRN	_err_add_context:NEAR
EXTRN	_err_clear:NEAR
EXTRN	_strstr:NEAR
EXTRN	_dyntab_filter_field:NEAR
EXTRN	_dyntab_field_val:NEAR
EXTRN	_dyntab_order_lines:NEAR
_DATA	SEGMENT
$SG70223 DB	'127.0.0.1', 00H
	ORG $+2
$SG70225 DB	'_EVA_DATE_SORT', 00H
	ORG $+1
$SG70226 DB	'.txt', 00H
	ORG $+3
$SG70228 DB	'logs', 00H
	ORG $+3
$SG70229 DB	'logs', 00H
	ORG $+3
$SG70230 DB	'logs', 00H
	ORG $+3
$SG70232 DB	'w', 00H
	ORG $+2
$SG70233 DB	'time', 09H, 'pid', 09H, 'clock', 09H, 'cgi', 09H, 'Click'
	DB	'Btn', 09H, 'ClickForm', 09H, 'ClickSubField', 09H, 'Session', 09H
	DB	'MainForm', 09H, 'MainObj', 09H, 'AltForm', 09H, 'AltObj', 09H
	DB	'SrchTxt', 0aH, 00H
	ORG $+3
$SG70234 DB	'%s\BLAT.EXE - -body "http://%s%s" -s "Notification EVA C'
	DB	'GI %s" -noh2 -to eva@abing.fr', 00H
	ORG $+2
$SG70236 DB	'a', 00H
	ORG $+2
$SG70238 DB	'%lu', 09H, '%u', 09H, '%lu', 09H, '%s', 0aH, 00H
	ORG $+1
$SG70239 DB	'_EVA_ADMINISTRATOR', 00H
	ORG $+1
$SG70240 DB	'SELECT DISTINCT IdObj FROM TLink WHERE IdField=%lu AND D'
	DB	'ateDel IS NULL', 00H
	ORG $+1
$SG70249 DB	'Configuration du serveur incorrecte', 00H
$SG70251 DB	',', 00H
	ORG $+2
$SG70252 DB	'dimanche,lundi,mardi,mercredi,jeudi,vendredi,samedi', 00H
$SG70253 DB	',', 00H
	ORG $+2
$SG70254 DB	'dim,lun,mar,mer,jeu,ven,sam', 00H
$SG70255 DB	',', 00H
	ORG $+2
$SG70256 DB	'Janvier,F', 0e9H, 'vrier,Mars,Avril,Mai,Juin,Juillet,Ao', 0fbH
	DB	't,Septembre,Octobre,Novembre,D', 0e9H, 'cembre', 00H
	ORG $+3
$SG70257 DB	',', 00H
	ORG $+2
$SG70258 DB	'Jan,Fev,Mar,Avr,Mai,Jun,Jul,Aou,Sep,Oct,Nov,Dec', 00H
$SG70260 DB	'_EVA_UNKNOWNUSER', 00H
	ORG $+3
$SG70262 DB	'_EVA_FORMSTAMP', 00H
	ORG $+1
$SG70264 DB	'_EVA_TYPE', 00H
	ORG $+2
$SG70266 DB	'_EVA_FIELD', 00H
	ORG $+1
$SG70270 DB	'_EVA_URL_SWITCH', 00H
$SG70272 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70283 DB	'_EVA_URL_PAGE_CONFIG', 00H
	ORG $+3
$SG70285 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70289 DB	'_EVA_MENUBAR', 00H
	ORG $+3
$SG70291 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70294 DB	'_EVA_HOMEPAGE', 00H
	ORG $+2
$SG70296 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70299 DB	'_EVA_PAGE_TITLE', 00H
$SG70301 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70304 DB	'_EVA_PAGE_BOTTOM', 00H
	ORG $+3
$SG70306 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70309 DB	'_EVA_PAGE_FOOTER', 00H
	ORG $+3
$SG70311 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70315 DB	'_EVA_MENUBAR', 00H
	ORG $+3
$SG70317 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70320 DB	'_EVA_HOMEPAGE', 00H
	ORG $+2
$SG70322 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70325 DB	'_EVA_PAGE_TITLE', 00H
$SG70327 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70330 DB	'_EVA_PAGE_BOTTOM', 00H
	ORG $+3
$SG70332 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70335 DB	'_EVA_PAGE_FOOTER', 00H
	ORG $+3
$SG70337 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70341 DB	' MSIE ', 00H
	ORG $+1
$SG70343 DB	' IEMobile ', 00H
	ORG $+1
$SG70350 DB	'D:\Travail\ABI\EVA\V4.0\CGI\Brunix-2016\cgi_utils.c', 00H
$SG70351 DB	'cgi_init_call', 00H
	ORG $+2
$SG70353 DB	'D:\Travail\ABI\EVA\V4.0\CGI\Brunix-2016\cgi_utils.c', 00H
$SG70354 DB	'cgi_init_call', 00H
_DATA	ENDS
_TEXT	SEGMENT
_cntxt$ = 8
_tmp$ = -2048
_st$ = -2088
_f$ = -2052
_urlswitch$ = -2112
_pgconfig$ = -2132
_i$ = -2092
_val$70274 = -2136
_msie$70339 = -2140
_vers$70342 = -2144
_cgi_init_call PROC NEAR

; 40   : ){

	push	ebp
	mov	ebp, esp
	sub	esp, 2156				; 0000086cH

; 41   : 	char tmp[2048];
; 42   : 	struct stat st;
; 43   : 	FILE *f = NULL;

	mov	DWORD PTR _f$[ebp], 0

; 44   : 	DynTable urlswitch = { 0 };

	mov	DWORD PTR _urlswitch$[ebp], 0
	xor	eax, eax
	mov	DWORD PTR _urlswitch$[ebp+4], eax
	mov	DWORD PTR _urlswitch$[ebp+8], eax
	mov	DWORD PTR _urlswitch$[ebp+12], eax
	mov	DWORD PTR _urlswitch$[ebp+16], eax

; 45   : 	DynTable pgconfig = { 0 };

	mov	DWORD PTR _pgconfig$[ebp], 0
	xor	ecx, ecx
	mov	DWORD PTR _pgconfig$[ebp+4], ecx
	mov	DWORD PTR _pgconfig$[ebp+8], ecx
	mov	DWORD PTR _pgconfig$[ebp+12], ecx
	mov	DWORD PTR _pgconfig$[ebp+16], ecx

; 46   : 	unsigned long i = 0;

	mov	DWORD PTR _i$[ebp], 0

; 47   : 
; 48   : 	if(cntxt->user_ip && !strcmp(cntxt->user_ip, "127.0.0.1")) cntxt->debug |= DEBUG_CGI_RAW;

	mov	edx, DWORD PTR _cntxt$[ebp]
	cmp	DWORD PTR [edx+29732], 0
	je	SHORT $L70222
	push	OFFSET FLAT:$SG70223
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	ecx, DWORD PTR [eax+29732]
	push	ecx
	call	_strcmp
	add	esp, 8
	test	eax, eax
	jne	SHORT $L70222
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	eax, DWORD PTR [edx+29860]
	or	al, 8
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29860], eax
$L70222:

; 49   : 
; 50   : 	/* Initialize memory trace file */
; 51   : 	MEM_TRACE(NULL, NULL);
; 52   : 
; 53   : 	/* Output log start */
; 54   : 	if(!cntxt->b_task)

	mov	edx, DWORD PTR _cntxt$[ebp]
	cmp	DWORD PTR [edx+29756], 0
	jne	$L70224

; 56   : 		time_to_datetxt(cntxt->tm0, tmp);

	lea	eax, DWORD PTR _tmp$[ebp]
	push	eax
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	edx, DWORD PTR [ecx+32040]
	push	edx
	call	_time_to_datetxt
	add	esp, 8

; 57   : 		datetxt_to_format(cntxt, cntxt->logfile, tmp, "_EVA_DATE_SORT");

	push	OFFSET FLAT:$SG70225
	lea	eax, DWORD PTR _tmp$[ebp]
	push	eax
	mov	ecx, DWORD PTR _cntxt$[ebp]
	add	ecx, 31952				; 00007cd0H
	push	ecx
	mov	edx, DWORD PTR _cntxt$[ebp]
	push	edx
	call	_datetxt_to_format
	add	esp, 16					; 00000010H

; 58   : 		sprintf(cntxt->logfile + strlen(cntxt->logfile), ".txt");

	push	OFFSET FLAT:$SG70226
	mov	eax, DWORD PTR _cntxt$[ebp]
	add	eax, 31952				; 00007cd0H
	push	eax
	call	_strlen
	add	esp, 4
	mov	ecx, DWORD PTR _cntxt$[ebp]
	lea	edx, DWORD PTR [ecx+eax+31952]
	push	edx
	call	_sprintf
	add	esp, 8

; 59   : 		chdir(cntxt->rootdir);

	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	ecx, DWORD PTR [eax+29724]
	push	ecx
	call	_chdir
	add	esp, 4

; 60   : 		if(chdir("logs")) { MKDIR("logs"); chdir("logs"); }

	push	OFFSET FLAT:$SG70228
	call	_chdir
	add	esp, 4
	test	eax, eax
	je	SHORT $L70227
	push	OFFSET FLAT:$SG70229
	call	_mkdir
	add	esp, 4
	push	OFFSET FLAT:$SG70230
	call	_chdir
	add	esp, 4
$L70227:

; 61   : 		if(stat(cntxt->logfile, &st))

	lea	edx, DWORD PTR _st$[ebp]
	push	edx
	mov	eax, DWORD PTR _cntxt$[ebp]
	add	eax, 31952				; 00007cd0H
	push	eax
	call	_stat
	add	esp, 8
	test	eax, eax
	je	$L70231

; 63   : 			/* Create new log file every day */
; 64   : 			f = fopen(cntxt->logfile, "w");

	push	OFFSET FLAT:$SG70232
	mov	ecx, DWORD PTR _cntxt$[ebp]
	add	ecx, 31952				; 00007cd0H
	push	ecx
	call	_fopen
	add	esp, 8
	mov	DWORD PTR _f$[ebp], eax

; 65   : 			fprintf(f, "time\tpid\tclock\tcgi\tClickBtn\tClickForm\tClickSubField\tSession\tMainForm\tMainObj\tAltForm\tAltObj\tSrchTxt\n");

	push	OFFSET FLAT:$SG70233
	mov	edx, DWORD PTR _f$[ebp]
	push	edx
	call	_fprintf
	add	esp, 8

; 66   : 
; 67   : 			/* Send mail report */
; 68   : 			snprintf(tmp, sizeof(tmp), "%s" DD "BLAT.EXE - -body \"http://%s%s\" -s \"Notification EVA CGI %s\" -noh2 -to eva@abing.fr",
; 69   : 							cntxt->path, cntxt->srvname, cntxt->requri, cntxt->srvname);

	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	ecx, DWORD PTR [eax+29744]
	push	ecx
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	eax, DWORD PTR [edx+29740]
	push	eax
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	edx, DWORD PTR [ecx+29744]
	push	edx
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	ecx, DWORD PTR [eax+29728]
	push	ecx
	push	OFFSET FLAT:$SG70234
	push	2048					; 00000800H
	lea	edx, DWORD PTR _tmp$[ebp]
	push	edx
	call	__snprintf
	add	esp, 28					; 0000001cH

; 70   : 			system(tmp);

	lea	eax, DWORD PTR _tmp$[ebp]
	push	eax
	call	_system
	add	esp, 4

; 72   : 		else

	jmp	SHORT $L70235
$L70231:

; 73   : 			f = fopen(cntxt->logfile, "a");

	push	OFFSET FLAT:$SG70236
	mov	ecx, DWORD PTR _cntxt$[ebp]
	add	ecx, 31952				; 00007cd0H
	push	ecx
	call	_fopen
	add	esp, 8
	mov	DWORD PTR _f$[ebp], eax
$L70235:

; 74   : 		fprintf(f, "%lu\t%u\t%lu\t%s\n", time(NULL), getpid(), clock(), cntxt->dbname);

	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	eax, DWORD PTR [edx+29804]
	push	eax
	call	_clock
	push	eax
	call	_getpid
	push	eax
	push	0
	call	_time
	add	esp, 4
	push	eax
	push	OFFSET FLAT:$SG70238
	mov	ecx, DWORD PTR _f$[ebp]
	push	ecx
	call	_fprintf
	add	esp, 24					; 00000018H

; 75   : 		fclose(f);

	mov	edx, DWORD PTR _f$[ebp]
	push	edx
	call	_fclose
	add	esp, 4
$L70224:

; 77   : 
; 78   : 	/* Read DB config */
; 79   : 	snprintf(add_sz_str(tmp), "SELECT DISTINCT IdObj FROM TLink WHERE IdField=%lu AND DateDel IS NULL", IDVAL("_EVA_ADMINISTRATOR"));

	push	18					; 00000012H
	push	OFFSET FLAT:$SG70239
	mov	eax, DWORD PTR _cntxt$[ebp]
	push	eax
	call	_get_id_value
	add	esp, 12					; 0000000cH
	push	eax
	push	OFFSET FLAT:$SG70240
	push	2047					; 000007ffH
	lea	ecx, DWORD PTR _tmp$[ebp]
	push	ecx
	call	__snprintf
	add	esp, 16					; 00000010H

; 80   : 	if(sql_exec_query(cntxt, tmp) || sql_get_table(cntxt, &cntxt->id_cnf, 0)) STACK_ERROR;

	lea	edx, DWORD PTR _tmp$[ebp]
	push	edx
	mov	eax, DWORD PTR _cntxt$[ebp]
	push	eax
	call	_sql_exec_query
	add	esp, 8
	test	eax, eax
	jne	SHORT $L70242
	push	0
	mov	ecx, DWORD PTR _cntxt$[ebp]
	add	ecx, 29340				; 0000729cH
	push	ecx
	mov	edx, DWORD PTR _cntxt$[ebp]
	push	edx
	call	_sql_get_table
	add	esp, 12					; 0000000cH
	test	eax, eax
	je	SHORT $L70241
$L70242:
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 80		; 00000050H
	jmp	$eva_err$70243
$L70241:

; 81   : 	if(qry_obj_data(cntxt, &cntxt->cnf_data, &cntxt->id_cnf, NULL)) STACK_ERROR;

	push	0
	mov	ecx, DWORD PTR _cntxt$[ebp]
	add	ecx, 29340				; 0000729cH
	push	ecx
	mov	edx, DWORD PTR _cntxt$[ebp]
	add	edx, 29360				; 000072b0H
	push	edx
	mov	eax, DWORD PTR _cntxt$[ebp]
	push	eax
	call	_qry_obj_data
	add	esp, 16					; 00000010H
	test	eax, eax
	je	SHORT $L70245
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 81		; 00000051H
	jmp	$eva_err$70243
$L70245:

; 82   : 	if(cntxt->id_cnf.nbrows != 1 || !cntxt->cnf_data.nbrows) RETURN_ERROR("Configuration du serveur incorrecte", NOP);

	mov	edx, DWORD PTR _cntxt$[ebp]
	cmp	DWORD PTR [edx+29340], 1
	jne	SHORT $L70247
	mov	eax, DWORD PTR _cntxt$[ebp]
	cmp	DWORD PTR [eax+29360], 0
	jne	SHORT $L70246
$L70247:
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29872], OFFSET FLAT:$SG70249
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 82		; 00000052H
	jmp	$eva_err$70243
$L70246:

; 83   : 
; 84   : 	/* Read server config file */
; 85   : 	if(file_read_config(cntxt)) STACK_ERROR;

	mov	eax, DWORD PTR _cntxt$[ebp]
	push	eax
	call	_file_read_config
	add	esp, 4
	test	eax, eax
	je	SHORT $L70250
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 85		; 00000055H
	jmp	$eva_err$70243
$L70250:

; 86   : 
; 87   : 	/* Read date labels */
; 88   : 	dyntab_from_list(&cntxt->daylong, add_sz_str("dimanche,lundi,mardi,mercredi,jeudi,vendredi,samedi"), ",", 0, 0);

	push	0
	push	0
	push	OFFSET FLAT:$SG70251
	push	51					; 00000033H
	push	OFFSET FLAT:$SG70252
	mov	edx, DWORD PTR _cntxt$[ebp]
	add	edx, 269668				; 00041d64H
	push	edx
	call	_dyntab_from_list
	add	esp, 24					; 00000018H

; 89   : 	dyntab_from_list(&cntxt->dayshort, add_sz_str("dim,lun,mar,mer,jeu,ven,sam"), ",", 0, 0);

	push	0
	push	0
	push	OFFSET FLAT:$SG70253
	push	27					; 0000001bH
	push	OFFSET FLAT:$SG70254
	mov	eax, DWORD PTR _cntxt$[ebp]
	add	eax, 269688				; 00041d78H
	push	eax
	call	_dyntab_from_list
	add	esp, 24					; 00000018H

; 90   : 	dyntab_from_list(&cntxt->monthlong, add_sz_str("Janvier,Février,Mars,Avril,Mai,Juin,Juillet,Août,Septembre,Octobre,Novembre,Décembre"), ",", 0, 0);

	push	0
	push	0
	push	OFFSET FLAT:$SG70255
	push	84					; 00000054H
	push	OFFSET FLAT:$SG70256
	mov	ecx, DWORD PTR _cntxt$[ebp]
	add	ecx, 269708				; 00041d8cH
	push	ecx
	call	_dyntab_from_list
	add	esp, 24					; 00000018H

; 91   : 	dyntab_from_list(&cntxt->monthshort, add_sz_str("Jan,Fev,Mar,Avr,Mai,Jun,Jul,Aou,Sep,Oct,Nov,Dec"), ",", 0, 0);

	push	0
	push	0
	push	OFFSET FLAT:$SG70257
	push	47					; 0000002fH
	push	OFFSET FLAT:$SG70258
	mov	edx, DWORD PTR _cntxt$[ebp]
	add	edx, 269728				; 00041da0H
	push	edx
	call	_dyntab_from_list
	add	esp, 24					; 00000018H

; 92   : 
; 93   : 	/* Read public user account */
; 94   : 	cntxt->id_public = strtoul(DYNTAB_FIELD_VAL(&cntxt->cnf_data, UNKNOWNUSER), NULL, 10);

	push	10					; 0000000aH
	push	0
	push	0
	push	-1
	push	OFFSET FLAT:$SG70260
	mov	eax, DWORD PTR _cntxt$[ebp]
	add	eax, 29360				; 000072b0H
	push	eax
	call	_dyntab_field_val
	add	esp, 16					; 00000010H
	push	eax
	call	_strtoul
	add	esp, 12					; 0000000cH
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29640], eax

; 95   : 
; 96   : 	/* Read value constants */
; 97   : 	if(sql_id_value(cntxt, add_sz_str("_EVA_FORMSTAMP"), &cntxt->val_FORMSTAMP)) STACK_ERROR;

	mov	edx, DWORD PTR _cntxt$[ebp]
	add	edx, 269636				; 00041d44H
	push	edx
	push	14					; 0000000eH
	push	OFFSET FLAT:$SG70262
	mov	eax, DWORD PTR _cntxt$[ebp]
	push	eax
	call	_sql_id_value
	add	esp, 16					; 00000010H
	test	eax, eax
	je	SHORT $L70261
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 97		; 00000061H
	jmp	$eva_err$70243
$L70261:

; 98   : 	if(sql_id_value(cntxt, add_sz_str("_EVA_TYPE"), &cntxt->val_TYPE)) STACK_ERROR;

	mov	edx, DWORD PTR _cntxt$[ebp]
	add	edx, 269640				; 00041d48H
	push	edx
	push	9
	push	OFFSET FLAT:$SG70264
	mov	eax, DWORD PTR _cntxt$[ebp]
	push	eax
	call	_sql_id_value
	add	esp, 16					; 00000010H
	test	eax, eax
	je	SHORT $L70263
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 98		; 00000062H
	jmp	$eva_err$70243
$L70263:

; 99   : 	if(sql_id_value(cntxt, add_sz_str("_EVA_FIELD"), &cntxt->val_FIELD)) STACK_ERROR;

	mov	edx, DWORD PTR _cntxt$[ebp]
	add	edx, 269644				; 00041d4cH
	push	edx
	push	10					; 0000000aH
	push	OFFSET FLAT:$SG70266
	mov	eax, DWORD PTR _cntxt$[ebp]
	push	eax
	call	_sql_id_value
	add	esp, 16					; 00000010H
	test	eax, eax
	je	SHORT $L70265
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 99		; 00000063H
	jmp	$eva_err$70243
$L70265:

; 100  : 
; 101  : 	/* Handle URL dependent settings : menubar, homepage, page title */
; 102  : 	DYNTAB_FIELD_TAB(&urlswitch, &cntxt->cnf_data, URL_SWITCH);

	lea	edx, DWORD PTR _urlswitch$[ebp]
	push	edx
	call	_dyntab_free
	add	esp, 4
	push	0
	push	-1
	push	OFFSET FLAT:$SG70270
	mov	eax, DWORD PTR _cntxt$[ebp]
	add	eax, 29360				; 000072b0H
	push	eax
	push	0
	lea	ecx, DWORD PTR _urlswitch$[ebp]
	push	ecx
	call	_dyntab_filter_field
	add	esp, 24					; 00000018H
	test	eax, eax
	jne	SHORT $L70269
	lea	edx, DWORD PTR _urlswitch$[ebp]
	push	edx
	call	_dyntab_order_lines
	add	esp, 4
	test	eax, eax
	je	SHORT $L70268
$L70269:
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29872], OFFSET FLAT:$SG70272
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 102		; 00000066H
	jmp	$eva_err$70243
$L70268:

; 103  : 	if(cntxt->srvname)

	mov	edx, DWORD PTR _cntxt$[ebp]
	cmp	DWORD PTR [edx+29744], 0
	je	$L70278

; 105  : 		DynTableCell *val = NULL;

	mov	DWORD PTR _val$70274[ebp], 0

; 106  : 		for(i = 0; i < urlswitch.nbrows; i++)

	mov	DWORD PTR _i$[ebp], 0
	jmp	SHORT $L70276
$L70277:
	mov	eax, DWORD PTR _i$[ebp]
	add	eax, 1
	mov	DWORD PTR _i$[ebp], eax
$L70276:
	mov	ecx, DWORD PTR _i$[ebp]
	cmp	ecx, DWORD PTR _urlswitch$[ebp]
	jae	$L70278

; 108  : 			val = dyntab_cell(&urlswitch, i, 0);

	push	0
	mov	edx, DWORD PTR _i$[ebp]
	push	edx
	lea	eax, DWORD PTR _urlswitch$[ebp]
	push	eax
	call	_dyntab_cell
	add	esp, 12					; 0000000cH
	mov	DWORD PTR _val$70274[ebp], eax

; 109  : 			if(!(val && val->txt && *val->txt) || strstr(cntxt->srvname, val->txt))

	cmp	DWORD PTR _val$70274[ebp], 0
	je	SHORT $L70280
	mov	ecx, DWORD PTR _val$70274[ebp]
	cmp	DWORD PTR [ecx], 0
	je	SHORT $L70280
	mov	edx, DWORD PTR _val$70274[ebp]
	mov	eax, DWORD PTR [edx]
	movsx	ecx, BYTE PTR [eax]
	test	ecx, ecx
	je	SHORT $L70280
	mov	edx, DWORD PTR _val$70274[ebp]
	mov	eax, DWORD PTR [edx]
	push	eax
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	edx, DWORD PTR [ecx+29744]
	push	edx
	call	_strstr
	add	esp, 8
	test	eax, eax
	je	SHORT $L70279
$L70280:

; 111  : 				DYNTAB_FIELDLINE(&pgconfig, &cntxt->cnf_data, URL_PAGE_CONFIG, i);

	lea	eax, DWORD PTR _pgconfig$[ebp]
	push	eax
	call	_dyntab_free
	add	esp, 4
	push	0
	mov	ecx, DWORD PTR _i$[ebp]
	push	ecx
	push	OFFSET FLAT:$SG70283
	mov	edx, DWORD PTR _cntxt$[ebp]
	add	edx, 29360				; 000072b0H
	push	edx
	push	0
	lea	eax, DWORD PTR _pgconfig$[ebp]
	push	eax
	call	_dyntab_filter_field
	add	esp, 24					; 00000018H
	test	eax, eax
	je	SHORT $L70282
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29872], OFFSET FLAT:$SG70285
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 111		; 0000006fH
	jmp	$eva_err$70243
$L70282:

; 112  : 				break;

	jmp	SHORT $L70278
$L70279:

; 114  : 		}

	jmp	$L70277
$L70278:

; 116  : 	if(urlswitch.nbrows && cntxt->srvname)

	cmp	DWORD PTR _urlswitch$[ebp], 0
	je	$L70286
	mov	eax, DWORD PTR _cntxt$[ebp]
	cmp	DWORD PTR [eax+29744], 0
	je	$L70286

; 118  : 		i++;

	mov	ecx, DWORD PTR _i$[ebp]
	add	ecx, 1
	mov	DWORD PTR _i$[ebp], ecx

; 119  : 		DYNTAB_FIELDLINE(&cntxt->menubar, &cntxt->cnf_data, MENUBAR, i);

	mov	edx, DWORD PTR _cntxt$[ebp]
	add	edx, 29528				; 00007358H
	push	edx
	call	_dyntab_free
	add	esp, 4
	push	0
	mov	eax, DWORD PTR _i$[ebp]
	push	eax
	push	OFFSET FLAT:$SG70289
	mov	ecx, DWORD PTR _cntxt$[ebp]
	add	ecx, 29360				; 000072b0H
	push	ecx
	push	0
	mov	edx, DWORD PTR _cntxt$[ebp]
	add	edx, 29528				; 00007358H
	push	edx
	call	_dyntab_filter_field
	add	esp, 24					; 00000018H
	test	eax, eax
	je	SHORT $L70288
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29872], OFFSET FLAT:$SG70291
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 119		; 00000077H
	jmp	$eva_err$70243
$L70288:

; 120  : 		DYNTAB_FIELDLINE(&cntxt->homepage, &cntxt->cnf_data, HOMEPAGE, i);

	mov	edx, DWORD PTR _cntxt$[ebp]
	add	edx, 29548				; 0000736cH
	push	edx
	call	_dyntab_free
	add	esp, 4
	push	0
	mov	eax, DWORD PTR _i$[ebp]
	push	eax
	push	OFFSET FLAT:$SG70294
	mov	ecx, DWORD PTR _cntxt$[ebp]
	add	ecx, 29360				; 000072b0H
	push	ecx
	push	0
	mov	edx, DWORD PTR _cntxt$[ebp]
	add	edx, 29548				; 0000736cH
	push	edx
	call	_dyntab_filter_field
	add	esp, 24					; 00000018H
	test	eax, eax
	je	SHORT $L70293
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29872], OFFSET FLAT:$SG70296
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 120		; 00000078H
	jmp	$eva_err$70243
$L70293:

; 121  : 		DYNTAB_FIELDLINE(&cntxt->pagetitle, &cntxt->cnf_data, PAGE_TITLE, i);

	mov	edx, DWORD PTR _cntxt$[ebp]
	add	edx, 29468				; 0000731cH
	push	edx
	call	_dyntab_free
	add	esp, 4
	push	0
	mov	eax, DWORD PTR _i$[ebp]
	push	eax
	push	OFFSET FLAT:$SG70299
	mov	ecx, DWORD PTR _cntxt$[ebp]
	add	ecx, 29360				; 000072b0H
	push	ecx
	push	0
	mov	edx, DWORD PTR _cntxt$[ebp]
	add	edx, 29468				; 0000731cH
	push	edx
	call	_dyntab_filter_field
	add	esp, 24					; 00000018H
	test	eax, eax
	je	SHORT $L70298
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29872], OFFSET FLAT:$SG70301
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 121		; 00000079H
	jmp	$eva_err$70243
$L70298:

; 122  : 		DYNTAB_FIELDLINE(&cntxt->pagebottom, &cntxt->cnf_data, PAGE_BOTTOM, i);

	mov	edx, DWORD PTR _cntxt$[ebp]
	add	edx, 29488				; 00007330H
	push	edx
	call	_dyntab_free
	add	esp, 4
	push	0
	mov	eax, DWORD PTR _i$[ebp]
	push	eax
	push	OFFSET FLAT:$SG70304
	mov	ecx, DWORD PTR _cntxt$[ebp]
	add	ecx, 29360				; 000072b0H
	push	ecx
	push	0
	mov	edx, DWORD PTR _cntxt$[ebp]
	add	edx, 29488				; 00007330H
	push	edx
	call	_dyntab_filter_field
	add	esp, 24					; 00000018H
	test	eax, eax
	je	SHORT $L70303
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29872], OFFSET FLAT:$SG70306
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 122		; 0000007aH
	jmp	$eva_err$70243
$L70303:

; 123  : 		DYNTAB_FIELDLINE(&cntxt->pagebtctrl, &cntxt->cnf_data, PAGE_FOOTER, i);

	mov	edx, DWORD PTR _cntxt$[ebp]
	add	edx, 29508				; 00007344H
	push	edx
	call	_dyntab_free
	add	esp, 4
	push	0
	mov	eax, DWORD PTR _i$[ebp]
	push	eax
	push	OFFSET FLAT:$SG70309
	mov	ecx, DWORD PTR _cntxt$[ebp]
	add	ecx, 29360				; 000072b0H
	push	ecx
	push	0
	mov	edx, DWORD PTR _cntxt$[ebp]
	add	edx, 29508				; 00007344H
	push	edx
	call	_dyntab_filter_field
	add	esp, 24					; 00000018H
	test	eax, eax
	je	SHORT $L70308
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29872], OFFSET FLAT:$SG70311
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 123		; 0000007bH
	jmp	$eva_err$70243
$L70308:

; 125  : 	else

	jmp	$L70334
$L70286:

; 127  : 		DYNTAB_FIELD(&cntxt->menubar, &cntxt->cnf_data, MENUBAR);

	mov	edx, DWORD PTR _cntxt$[ebp]
	add	edx, 29528				; 00007358H
	push	edx
	call	_dyntab_free
	add	esp, 4
	push	0
	push	-1
	push	OFFSET FLAT:$SG70315
	mov	eax, DWORD PTR _cntxt$[ebp]
	add	eax, 29360				; 000072b0H
	push	eax
	push	0
	mov	ecx, DWORD PTR _cntxt$[ebp]
	add	ecx, 29528				; 00007358H
	push	ecx
	call	_dyntab_filter_field
	add	esp, 24					; 00000018H
	test	eax, eax
	je	SHORT $L70314
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29872], OFFSET FLAT:$SG70317
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 127		; 0000007fH
	jmp	$eva_err$70243
$L70314:

; 128  : 		DYNTAB_FIELD(&cntxt->homepage, &cntxt->cnf_data, HOMEPAGE);

	mov	ecx, DWORD PTR _cntxt$[ebp]
	add	ecx, 29548				; 0000736cH
	push	ecx
	call	_dyntab_free
	add	esp, 4
	push	0
	push	-1
	push	OFFSET FLAT:$SG70320
	mov	edx, DWORD PTR _cntxt$[ebp]
	add	edx, 29360				; 000072b0H
	push	edx
	push	0
	mov	eax, DWORD PTR _cntxt$[ebp]
	add	eax, 29548				; 0000736cH
	push	eax
	call	_dyntab_filter_field
	add	esp, 24					; 00000018H
	test	eax, eax
	je	SHORT $L70319
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29872], OFFSET FLAT:$SG70322
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 128		; 00000080H
	jmp	$eva_err$70243
$L70319:

; 129  : 		DYNTAB_FIELD(&cntxt->pagetitle, &cntxt->cnf_data, PAGE_TITLE);

	mov	eax, DWORD PTR _cntxt$[ebp]
	add	eax, 29468				; 0000731cH
	push	eax
	call	_dyntab_free
	add	esp, 4
	push	0
	push	-1
	push	OFFSET FLAT:$SG70325
	mov	ecx, DWORD PTR _cntxt$[ebp]
	add	ecx, 29360				; 000072b0H
	push	ecx
	push	0
	mov	edx, DWORD PTR _cntxt$[ebp]
	add	edx, 29468				; 0000731cH
	push	edx
	call	_dyntab_filter_field
	add	esp, 24					; 00000018H
	test	eax, eax
	je	SHORT $L70324
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29872], OFFSET FLAT:$SG70327
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 129		; 00000081H
	jmp	$eva_err$70243
$L70324:

; 130  : 		DYNTAB_FIELD(&cntxt->pagebottom, &cntxt->cnf_data, PAGE_BOTTOM);

	mov	edx, DWORD PTR _cntxt$[ebp]
	add	edx, 29488				; 00007330H
	push	edx
	call	_dyntab_free
	add	esp, 4
	push	0
	push	-1
	push	OFFSET FLAT:$SG70330
	mov	eax, DWORD PTR _cntxt$[ebp]
	add	eax, 29360				; 000072b0H
	push	eax
	push	0
	mov	ecx, DWORD PTR _cntxt$[ebp]
	add	ecx, 29488				; 00007330H
	push	ecx
	call	_dyntab_filter_field
	add	esp, 24					; 00000018H
	test	eax, eax
	je	SHORT $L70329
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29872], OFFSET FLAT:$SG70332
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 130		; 00000082H
	jmp	$eva_err$70243
$L70329:

; 131  : 		DYNTAB_FIELD(&cntxt->pagebtctrl, &cntxt->cnf_data, PAGE_FOOTER);

	mov	ecx, DWORD PTR _cntxt$[ebp]
	add	ecx, 29508				; 00007344H
	push	ecx
	call	_dyntab_free
	add	esp, 4
	push	0
	push	-1
	push	OFFSET FLAT:$SG70335
	mov	edx, DWORD PTR _cntxt$[ebp]
	add	edx, 29360				; 000072b0H
	push	edx
	push	0
	mov	eax, DWORD PTR _cntxt$[ebp]
	add	eax, 29508				; 00007344H
	push	eax
	call	_dyntab_filter_field
	add	esp, 24					; 00000018H
	test	eax, eax
	je	SHORT $L70334
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29872], OFFSET FLAT:$SG70337
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 131		; 00000083H
	jmp	$eva_err$70243
$L70334:

; 133  : 
; 134  : 	/* Read	CGI input data */
; 135  : 	if(cgi_read_data(cntxt)) STACK_ERROR;

	mov	eax, DWORD PTR _cntxt$[ebp]
	push	eax
	call	_cgi_read_data
	add	esp, 4
	test	eax, eax
	je	SHORT $L70338
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 135		; 00000087H
	jmp	$eva_err$70243
$L70338:

; 139  : 		char *msie = cntxt->user_agent ? strstr(cntxt->user_agent, " MSIE ") : NULL;

	mov	edx, DWORD PTR _cntxt$[ebp]
	cmp	DWORD PTR [edx+29748], 0
	je	SHORT $L71797
	push	OFFSET FLAT:$SG70341
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	ecx, DWORD PTR [eax+29748]
	push	ecx
	call	_strstr
	add	esp, 8
	mov	DWORD PTR -2148+[ebp], eax
	jmp	SHORT $L71798
$L71797:
	mov	DWORD PTR -2148+[ebp], 0
$L71798:
	mov	edx, DWORD PTR -2148+[ebp]
	mov	DWORD PTR _msie$70339[ebp], edx

; 140  : 		int vers = msie ? atoi(msie + 6) : -1;

	cmp	DWORD PTR _msie$70339[ebp], 0
	je	SHORT $L71799
	mov	eax, DWORD PTR _msie$70339[ebp]
	add	eax, 6
	push	eax
	call	_atoi
	add	esp, 4
	mov	DWORD PTR -2152+[ebp], eax
	jmp	SHORT $L71800
$L71799:
	mov	DWORD PTR -2152+[ebp], -1
$L71800:
	mov	ecx, DWORD PTR -2152+[ebp]
	mov	DWORD PTR _vers$70342[ebp], ecx

; 141  : 		cntxt->b_pda = cntxt->user_agent && strstr(cntxt->user_agent, " IEMobile ") != 0;

	mov	edx, DWORD PTR _cntxt$[ebp]
	cmp	DWORD PTR [edx+29748], 0
	je	SHORT $L71801
	push	OFFSET FLAT:$SG70343
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	ecx, DWORD PTR [eax+29748]
	push	ecx
	call	_strstr
	add	esp, 8
	test	eax, eax
	je	SHORT $L71801
	mov	DWORD PTR -2156+[ebp], 1
	jmp	SHORT $L71802
$L71801:
	mov	DWORD PTR -2156+[ebp], 0
$L71802:
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	eax, DWORD PTR -2156+[ebp]
	mov	DWORD PTR [edx+29752], eax

; 142  : 		if((vers > 0 && vers < 5) || cntxt->b_pda)

	cmp	DWORD PTR _vers$70342[ebp], 0
	jle	SHORT $L70346
	cmp	DWORD PTR _vers$70342[ebp], 5
	jl	SHORT $L70345
$L70346:
	mov	ecx, DWORD PTR _cntxt$[ebp]
	cmp	DWORD PTR [ecx+29752], 0
	je	SHORT $L70344
$L70345:

; 144  : 			cntxt->jsenabled = 0;

	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29676], 0

; 145  : 			cntxt->imgwait = 0;

	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29672], 0

; 147  : 		else if(!cntxt->cgi) cntxt->jsenabled = 1;

	jmp	SHORT $L70348
$L70344:
	mov	ecx, DWORD PTR _cntxt$[ebp]
	cmp	DWORD PTR [ecx+29648], 0
	jne	SHORT $L70348
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29676], 1
$L70348:
$eva_noerr$70349:

; 149  : 
; 150  : 	RETURN_OK_CLEANUP;

	push	0
	push	OFFSET FLAT:$SG70350
	push	OFFSET FLAT:$SG70351
	mov	eax, DWORD PTR _cntxt$[ebp]
	push	eax
	call	_err_clear
	add	esp, 16					; 00000010H
$eva_err$70243:
	mov	ecx, DWORD PTR _cntxt$[ebp]
	cmp	DWORD PTR [ecx+29872], 0
	je	SHORT $L70352
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	eax, DWORD PTR [edx+29900]
	push	eax
	push	OFFSET FLAT:$SG70353
	push	OFFSET FLAT:$SG70354
	mov	ecx, DWORD PTR _cntxt$[ebp]
	push	ecx
	call	_err_add_context
	add	esp, 16					; 00000010H
$L70352:
	lea	edx, DWORD PTR _urlswitch$[ebp]
	push	edx
	call	_dyntab_free
	add	esp, 4
	lea	eax, DWORD PTR _pgconfig$[ebp]
	push	eax
	call	_dyntab_free
	add	esp, 4
	mov	ecx, DWORD PTR _cntxt$[ebp]
	xor	eax, eax
	cmp	DWORD PTR [ecx+29872], 0
	setne	al

; 151  : }

	mov	esp, ebp
	pop	ebp
	ret	0
_cgi_init_call ENDP
_TEXT	ENDS
PUBLIC	_output_log_end
EXTRN	_dyntab_val:NEAR
_BSS	SEGMENT
$SG70363 DB	01H DUP (?)
	ALIGN	4

$SG70364 DB	01H DUP (?)
_BSS	ENDS
_DATA	SEGMENT
	ORG $+2
$SG70360 DB	'logs', 00H
	ORG $+3
$SG70361 DB	'a', 00H
	ORG $+2
$SG70365 DB	'%lu', 09H, '%u', 09H, '%lu', 09H, '%s', 09H, '%lu', 09H, '%'
	DB	'lu', 09H, '%s', 09H, '%s', 09H, '%s', 09H, '%s', 09H, '%s', 09H
	DB	'%s', 09H, '%s', 0aH, 00H
_DATA	ENDS
_TEXT	SEGMENT
_cntxt$ = 8
_f$ = -4
_output_log_end PROC NEAR

; 160  : {

	push	ebp
	mov	ebp, esp
	sub	esp, 12					; 0000000cH

; 161  : 	FILE *f;
; 162  : 
; 163  : 	chdir(cntxt->rootdir);

	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	ecx, DWORD PTR [eax+29724]
	push	ecx
	call	_chdir
	add	esp, 4

; 164  : 	chdir("logs");

	push	OFFSET FLAT:$SG70360
	call	_chdir
	add	esp, 4

; 165  : 	f = fopen(cntxt->logfile, "a");

	push	OFFSET FLAT:$SG70361
	mov	edx, DWORD PTR _cntxt$[ebp]
	add	edx, 31952				; 00007cd0H
	push	edx
	call	_fopen
	add	esp, 8
	mov	DWORD PTR _f$[ebp], eax

; 166  : 	fprintf(f, "%lu\t%u\t%lu\t%s\t%lu\t%lu\t%s\t%s\t%s\t%s\t%s\t%s\t%s\n",
; 167  : 					time(NULL), getpid(), clock(), cntxt->dbname,
; 168  : 					cntxt->log_clkbtn,										/* clicked button id */
; 169  : 					cntxt->log_clkform,										/* clicked button form id */
; 170  : 					(cntxt->cgi && cntxt->cgi[cntxt->cgibtn].subfield) ?
; 171  : 						cntxt->cgi[cntxt->cgibtn].subfield : ""				/* clicked button subfield */
; 172  : 					,dyntab_val(&cntxt->session, 0, 0)						/* session id */
; 173  : 					,dyntab_val(&cntxt->id_form, 0, 0)						/* current form id */
; 174  : 					,dyntab_val(&cntxt->id_obj, 0, 0)						/* current object id */
; 175  : 					,dyntab_val(&cntxt->alt_form, 0, 0)						/* alternate form id */
; 176  : 					,dyntab_val(&cntxt->alt_obj, 0, 0)						/* current object id in alternate form */
; 177  : 					,cntxt->log_srchtxt ? cntxt->log_srchtxt->data : ""		/* search string */
; 178  : 					);

	mov	eax, DWORD PTR _cntxt$[ebp]
	cmp	DWORD PTR [eax+32056], 0
	je	SHORT $L71804
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	edx, DWORD PTR [ecx+32056]
	add	edx, 8
	mov	DWORD PTR -8+[ebp], edx
	jmp	SHORT $L71805
$L71804:
	mov	DWORD PTR -8+[ebp], OFFSET FLAT:$SG70363
$L71805:
	mov	eax, DWORD PTR _cntxt$[ebp]
	cmp	DWORD PTR [eax+29648], 0
	je	SHORT $L71806
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	edx, DWORD PTR [ecx+29656]
	imul	edx, 56					; 00000038H
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	ecx, DWORD PTR [eax+29648]
	cmp	DWORD PTR [ecx+edx+32], 0
	je	SHORT $L71806
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	eax, DWORD PTR [edx+29656]
	imul	eax, 56					; 00000038H
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	edx, DWORD PTR [ecx+29648]
	mov	eax, DWORD PTR [edx+eax+32]
	mov	DWORD PTR -12+[ebp], eax
	jmp	SHORT $L71807
$L71806:
	mov	DWORD PTR -12+[ebp], OFFSET FLAT:$SG70364
$L71807:
	mov	ecx, DWORD PTR -8+[ebp]
	push	ecx
	push	0
	push	0
	mov	edx, DWORD PTR _cntxt$[ebp]
	add	edx, 60					; 0000003cH
	push	edx
	call	_dyntab_val
	add	esp, 12					; 0000000cH
	push	eax
	push	0
	push	0
	mov	eax, DWORD PTR _cntxt$[ebp]
	add	eax, 40					; 00000028H
	push	eax
	call	_dyntab_val
	add	esp, 12					; 0000000cH
	push	eax
	push	0
	push	0
	mov	ecx, DWORD PTR _cntxt$[ebp]
	add	ecx, 20					; 00000014H
	push	ecx
	call	_dyntab_val
	add	esp, 12					; 0000000cH
	push	eax
	push	0
	push	0
	mov	edx, DWORD PTR _cntxt$[ebp]
	push	edx
	call	_dyntab_val
	add	esp, 12					; 0000000cH
	push	eax
	push	0
	push	0
	mov	eax, DWORD PTR _cntxt$[ebp]
	add	eax, 29300				; 00007274H
	push	eax
	call	_dyntab_val
	add	esp, 12					; 0000000cH
	push	eax
	mov	ecx, DWORD PTR -12+[ebp]
	push	ecx
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	eax, DWORD PTR [edx+32052]
	push	eax
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	edx, DWORD PTR [ecx+32048]
	push	edx
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	ecx, DWORD PTR [eax+29804]
	push	ecx
	call	_clock
	push	eax
	call	_getpid
	push	eax
	push	0
	call	_time
	add	esp, 4
	push	eax
	push	OFFSET FLAT:$SG70365
	mov	edx, DWORD PTR _f$[ebp]
	push	edx
	call	_fprintf
	add	esp, 60					; 0000003cH

; 179  : 	fclose(f);

	mov	eax, DWORD PTR _f$[ebp]
	push	eax
	call	_fclose
	add	esp, 4

; 180  : }

	mov	esp, ebp
	pop	ebp
	ret	0
_output_log_end ENDP
_TEXT	ENDS
PUBLIC	_basename
EXTRN	_strchr:NEAR
_BSS	SEGMENT
	ALIGN	4

$SG70375 DB	01H DUP (?)
_BSS	ENDS
_DATA	SEGMENT
$SG70380 DB	'\/:', 00H
$SG70382 DB	'\/:', 00H
_DATA	ENDS
_TEXT	SEGMENT
_path$ = 8
_path_len$ = 12
_name$ = -4
_basename PROC NEAR

; 187  : {

	push	ebp
	mov	ebp, esp
	push	ecx

; 188  : #define DIR_DELIM "\\/:"
; 189  : 	char *name;
; 190  : 	if(!path || !*path) return "";

	cmp	DWORD PTR _path$[ebp], 0
	je	SHORT $L70374
	mov	eax, DWORD PTR _path$[ebp]
	movsx	ecx, BYTE PTR [eax]
	test	ecx, ecx
	jne	SHORT $L70373
$L70374:
	mov	eax, OFFSET FLAT:$SG70375
	jmp	SHORT $L70370
$L70373:

; 191  : 	if(!path_len) path_len = strlen(path);

	cmp	DWORD PTR _path_len$[ebp], 0
	jne	SHORT $L70376
	mov	edx, DWORD PTR _path$[ebp]
	push	edx
	call	_strlen
	add	esp, 4
	mov	DWORD PTR _path_len$[ebp], eax
$L70376:

; 192  : 	name = path + path_len - 1;

	mov	eax, DWORD PTR _path_len$[ebp]
	mov	ecx, DWORD PTR _path$[ebp]
	lea	edx, DWORD PTR [ecx+eax-1]
	mov	DWORD PTR _name$[ebp], edx
$L70378:

; 193  : 	while(!strchr(DIR_DELIM, *name) && name > path) name--;

	mov	eax, DWORD PTR _name$[ebp]
	movsx	ecx, BYTE PTR [eax]
	push	ecx
	push	OFFSET FLAT:$SG70380
	call	_strchr
	add	esp, 8
	test	eax, eax
	jne	SHORT $L70379
	mov	edx, DWORD PTR _name$[ebp]
	cmp	edx, DWORD PTR _path$[ebp]
	jbe	SHORT $L70379
	mov	eax, DWORD PTR _name$[ebp]
	sub	eax, 1
	mov	DWORD PTR _name$[ebp], eax
	jmp	SHORT $L70378
$L70379:

; 194  : 	if(strchr(DIR_DELIM, *name)) name++;

	mov	ecx, DWORD PTR _name$[ebp]
	movsx	edx, BYTE PTR [ecx]
	push	edx
	push	OFFSET FLAT:$SG70382
	call	_strchr
	add	esp, 8
	test	eax, eax
	je	SHORT $L70381
	mov	eax, DWORD PTR _name$[ebp]
	add	eax, 1
	mov	DWORD PTR _name$[ebp], eax
$L70381:

; 195  : 	return name;

	mov	eax, DWORD PTR _name$[ebp]
$L70370:

; 196  : }

	mov	esp, ebp
	pop	ebp
	ret	0
_basename ENDP
_TEXT	ENDS
PUBLIC	_cgi_free
_TEXT	SEGMENT
_cntxt$ = 8
_i$ = -4
_cgi$70390 = -8
_cgi_free PROC NEAR

; 204  : {

	push	ebp
	mov	ebp, esp
	sub	esp, 8

; 205  : 	unsigned long i;
; 206  : 	for(i = 0; i < cntxt->nb_cgi; i++)

	mov	DWORD PTR _i$[ebp], 0
	jmp	SHORT $L70387
$L70388:
	mov	eax, DWORD PTR _i$[ebp]
	add	eax, 1
	mov	DWORD PTR _i$[ebp], eax
$L70387:
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	edx, DWORD PTR _i$[ebp]
	cmp	edx, DWORD PTR [ecx+29652]
	jae	SHORT $L70389

; 208  : 		CGIData *cgi = cntxt->cgi + i;

	mov	eax, DWORD PTR _i$[ebp]
	imul	eax, 56					; 00000038H
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	edx, DWORD PTR [ecx+29648]
	add	edx, eax
	mov	DWORD PTR _cgi$70390[ebp], edx

; 209  : 		M_FREE(cgi->name);

	mov	eax, DWORD PTR _cgi$70390[ebp]
	mov	ecx, DWORD PTR [eax]
	push	ecx
	call	_mem_free
	add	esp, 4
	mov	edx, DWORD PTR _cgi$70390[ebp]
	mov	DWORD PTR [edx], 0

; 210  : 		M_FREE(cgi->value);

	mov	eax, DWORD PTR _cgi$70390[ebp]
	mov	ecx, DWORD PTR [eax+8]
	push	ecx
	call	_mem_free
	add	esp, 4
	mov	edx, DWORD PTR _cgi$70390[ebp]
	mov	DWORD PTR [edx+8], 0

; 211  : 		M_FREE(cgi->field);

	mov	eax, DWORD PTR _cgi$70390[ebp]
	mov	ecx, DWORD PTR [eax+28]
	push	ecx
	call	_mem_free
	add	esp, 4
	mov	edx, DWORD PTR _cgi$70390[ebp]
	mov	DWORD PTR [edx+28], 0

; 212  : 		M_FREE(cgi->subfield);

	mov	eax, DWORD PTR _cgi$70390[ebp]
	mov	ecx, DWORD PTR [eax+32]
	push	ecx
	call	_mem_free
	add	esp, 4
	mov	edx, DWORD PTR _cgi$70390[ebp]
	mov	DWORD PTR [edx+32], 0

; 213  : 	}

	jmp	$L70388
$L70389:

; 214  : 	M_FREE(cntxt->cgi);

	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	ecx, DWORD PTR [eax+29648]
	push	ecx
	call	_mem_free
	add	esp, 4
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29648], 0

; 215  : 	cntxt->nb_cgi = 0;

	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29652], 0

; 216  : }

	mov	esp, ebp
	pop	ebp
	ret	0
_cgi_free ENDP
_TEXT	ENDS
PUBLIC	_cgi_extract
EXTRN	_dyntab_add:NEAR
_DATA	SEGMENT
$SG70417 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70427 DB	'D:\Travail\ABI\EVA\V4.0\CGI\Brunix-2016\cgi_utils.c', 00H
$SG70428 DB	'cgi_extract', 00H
$SG70430 DB	'D:\Travail\ABI\EVA\V4.0\CGI\Brunix-2016\cgi_utils.c', 00H
$SG70431 DB	'cgi_extract', 00H
_DATA	ENDS
_TEXT	SEGMENT
_cntxt$ = 8
_val$ = 12
_sep$ = 16
_res$ = 20
_t$ = -8
_nextval$ = -12
_sz$ = -16
_p$ = -4
_cgi_extract PROC NEAR

; 230  : ){

	push	ebp
	mov	ebp, esp
	sub	esp, 20					; 00000014H

; 231  : 	DynTable *t = res;

	mov	eax, DWORD PTR _res$[ebp]
	mov	DWORD PTR _t$[ebp], eax

; 232  : 	char *nextval = val;

	mov	ecx, DWORD PTR _val$[ebp]
	mov	DWORD PTR _nextval$[ebp], ecx

; 233  : 	size_t sz;
; 234  : 	va_list	p;
; 235  : 
; 236  : 	/* Args loop */
; 237  : 	va_start(p, res);

	lea	edx, DWORD PTR _res$[ebp+4]
	mov	DWORD PTR _p$[ebp], edx
$L70411:

; 238  : //	t = va_arg(p, DynTable*);
; 239  : 	while(t && nextval)

	cmp	DWORD PTR _t$[ebp], 0
	je	$eva_noerr$70426
	cmp	DWORD PTR _nextval$[ebp], 0
	je	$eva_noerr$70426

; 241  : 		nextval = strchr(val, sep);

	movsx	eax, BYTE PTR _sep$[ebp]
	push	eax
	mov	ecx, DWORD PTR _val$[ebp]
	push	ecx
	call	_strchr
	add	esp, 8
	mov	DWORD PTR _nextval$[ebp], eax

; 242  : 		sz = nextval ? nextval - val : strlen(val);

	cmp	DWORD PTR _nextval$[ebp], 0
	je	SHORT $L71811
	mov	edx, DWORD PTR _nextval$[ebp]
	sub	edx, DWORD PTR _val$[ebp]
	mov	DWORD PTR -20+[ebp], edx
	jmp	SHORT $L71812
$L71811:
	mov	eax, DWORD PTR _val$[ebp]
	push	eax
	call	_strlen
	add	esp, 4
	mov	DWORD PTR -20+[ebp], eax
$L71812:
	mov	ecx, DWORD PTR -20+[ebp]
	mov	DWORD PTR _sz$[ebp], ecx

; 243  : 		dyntab_free(t);

	mov	edx, DWORD PTR _t$[ebp]
	push	edx
	call	_dyntab_free
	add	esp, 4

; 244  : 		if(sz) DYNTAB_ADD(t, 0, 0, val, sz, NO_CONV);

	cmp	DWORD PTR _sz$[ebp], 0
	je	SHORT $L70415
	push	0
	push	0
	mov	eax, DWORD PTR _sz$[ebp]
	push	eax
	mov	ecx, DWORD PTR _val$[ebp]
	push	ecx
	push	0
	push	0
	mov	edx, DWORD PTR _t$[ebp]
	push	edx
	call	_dyntab_add
	add	esp, 28					; 0000001cH
	test	eax, eax
	je	SHORT $L70415
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29872], OFFSET FLAT:$SG70417
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 244		; 000000f4H
	jmp	SHORT $eva_err$70418
$L70415:

; 245  : 		val = nextval+1;

	mov	edx, DWORD PTR _nextval$[ebp]
	add	edx, 1
	mov	DWORD PTR _val$[ebp], edx

; 246  : 		t = va_arg(p, DynTable*);

	mov	eax, DWORD PTR _p$[ebp]
	add	eax, 4
	mov	DWORD PTR _p$[ebp], eax
	mov	ecx, DWORD PTR _p$[ebp]
	mov	edx, DWORD PTR [ecx-4]
	mov	DWORD PTR _t$[ebp], edx

; 247  : 	}

	jmp	$L70411
$eva_noerr$70426:

; 248  : 	RETURN_OK_CLEANUP;

	push	0
	push	OFFSET FLAT:$SG70427
	push	OFFSET FLAT:$SG70428
	mov	eax, DWORD PTR _cntxt$[ebp]
	push	eax
	call	_err_clear
	add	esp, 16					; 00000010H
$eva_err$70418:
	mov	ecx, DWORD PTR _cntxt$[ebp]
	cmp	DWORD PTR [ecx+29872], 0
	je	SHORT $L70429
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	eax, DWORD PTR [edx+29900]
	push	eax
	push	OFFSET FLAT:$SG70430
	push	OFFSET FLAT:$SG70431
	mov	ecx, DWORD PTR _cntxt$[ebp]
	push	ecx
	call	_err_add_context
	add	esp, 16					; 00000010H
$L70429:
	mov	edx, DWORD PTR _cntxt$[ebp]
	xor	eax, eax
	cmp	DWORD PTR [edx+29872], 0
	setne	al

; 249  : }

	mov	esp, ebp
	pop	ebp
	ret	0
_cgi_extract ENDP
_TEXT	ENDS
PUBLIC	_cgi_build_name
PUBLIC	_cgi_build_finalname
EXTRN	_dynbuf_add:NEAR
EXTRN	_dynbuf_add_int:NEAR
EXTRN	_dynbuf_add3_int:NEAR
EXTRN	_memset:NEAR
_BSS	SEGMENT
	ALIGN	4

$SG70475 DB	01H DUP (?)
_BSS	ENDS
_DATA	SEGMENT
$SG70465 DB	'Erreur du programme', 00H
$SG70471 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70474 DB	'/', 00H
	ORG $+2
$SG70477 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70480 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70483 DB	'$', 00H
	ORG $+2
$SG70485 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70489 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70492 DB	'#', 00H
	ORG $+2
$SG70494 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70498 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70501 DB	'D:\Travail\ABI\EVA\V4.0\CGI\Brunix-2016\cgi_utils.c', 00H
$SG70502 DB	'cgi_build_name', 00H
	ORG $+1
$SG70504 DB	'D:\Travail\ABI\EVA\V4.0\CGI\Brunix-2016\cgi_utils.c', 00H
$SG70505 DB	'cgi_build_name', 00H
_DATA	ENDS
_TEXT	SEGMENT
_cntxt$ = 8
_name$ = 12
_type$ = 16
_id_ctrl$ = 20
_id_form$ = 24
_id_obj$ = 28
_field$ = 32
_field_sz$ = 36
_subfield$ = 40
_subfield_sz$ = 44
_num$ = 48
_row$ = 52
_lvl$ = 56
_cgi_build_name PROC NEAR

; 293  : ){

	push	ebp
	mov	ebp, esp

; 294  : 	/* Check params */
; 295  : 	if(!name || !id_form) RETURN_ERROR("Erreur du programme", NOP);

	cmp	DWORD PTR _name$[ebp], 0
	je	SHORT $L70463
	cmp	DWORD PTR _id_form$[ebp], 0
	jne	SHORT $L70462
$L70463:
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29872], OFFSET FLAT:$SG70465
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 295		; 00000127H
	jmp	$eva_err$70466
$L70462:

; 296  : 	if(*name) { (*name)->cnt = 0; memset((*name)->data, 0, (*name)->sz); }

	mov	edx, DWORD PTR _name$[ebp]
	cmp	DWORD PTR [edx], 0
	je	SHORT $L70467
	mov	eax, DWORD PTR _name$[ebp]
	mov	ecx, DWORD PTR [eax]
	mov	DWORD PTR [ecx+4], 0
	mov	edx, DWORD PTR _name$[ebp]
	mov	eax, DWORD PTR [edx]
	mov	ecx, DWORD PTR [eax]
	push	ecx
	push	0
	mov	edx, DWORD PTR _name$[ebp]
	mov	eax, DWORD PTR [edx]
	add	eax, 8
	push	eax
	call	_memset
	add	esp, 12					; 0000000cH
$L70467:

; 297  : 
; 298  : 	/* Add input type */
; 299  : 	DYNBUF_ADD(name, &type, 1, NO_CONV);

	push	0
	push	0
	push	1
	lea	ecx, DWORD PTR _type$[ebp]
	push	ecx
	mov	edx, DWORD PTR _name$[ebp]
	push	edx
	call	_dynbuf_add
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L70469
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29872], OFFSET FLAT:$SG70471
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 299		; 0000012bH
	jmp	$eva_err$70466
$L70469:

; 300  : 
; 301  : 	/* Add control id / form id */
; 302  : 	if(id_ctrl) DYNBUF_ADD3_INT(name, "", id_ctrl, "/");

	cmp	DWORD PTR _id_ctrl$[ebp], 0
	je	SHORT $L70473
	push	1
	push	OFFSET FLAT:$SG70474
	mov	edx, DWORD PTR _id_ctrl$[ebp]
	push	edx
	push	0
	push	OFFSET FLAT:$SG70475
	mov	eax, DWORD PTR _name$[ebp]
	push	eax
	call	_dynbuf_add3_int
	add	esp, 24					; 00000018H
	test	eax, eax
	je	SHORT $L70473
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29872], OFFSET FLAT:$SG70477
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 302		; 0000012eH
	jmp	$eva_err$70466
$L70473:

; 303  : 	DYNBUF_ADD_INT(name, id_form);

	mov	eax, DWORD PTR _id_form$[ebp]
	push	eax
	mov	ecx, DWORD PTR _name$[ebp]
	push	ecx
	call	_dynbuf_add_int
	add	esp, 8
	test	eax, eax
	je	SHORT $L70478
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29872], OFFSET FLAT:$SG70480
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 303		; 0000012fH
	jmp	$eva_err$70466
$L70478:

; 304  : 
; 305  : 	/* Add "$" & id_obj */
; 306  : 	DYNBUF_ADD_STR(name, "$");

	push	0
	push	0
	push	1
	push	OFFSET FLAT:$SG70483
	mov	ecx, DWORD PTR _name$[ebp]
	push	ecx
	call	_dynbuf_add
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L70482
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29872], OFFSET FLAT:$SG70485
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 306		; 00000132H
	jmp	$eva_err$70466
$L70482:

; 307  : 	if(id_obj) DYNBUF_ADD_INT(name, id_obj);

	cmp	DWORD PTR _id_obj$[ebp], 0
	je	SHORT $L70487
	mov	ecx, DWORD PTR _id_obj$[ebp]
	push	ecx
	mov	edx, DWORD PTR _name$[ebp]
	push	edx
	call	_dynbuf_add_int
	add	esp, 8
	test	eax, eax
	je	SHORT $L70487
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29872], OFFSET FLAT:$SG70489
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 307		; 00000133H
	jmp	$eva_err$70466
$L70487:

; 308  : 
; 309  : 	/* Add "#" & field */
; 310  : 	DYNBUF_ADD_STR(name, "#");

	push	0
	push	0
	push	1
	push	OFFSET FLAT:$SG70492
	mov	edx, DWORD PTR _name$[ebp]
	push	edx
	call	_dynbuf_add
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L70491
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29872], OFFSET FLAT:$SG70494
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 310		; 00000136H
	jmp	$eva_err$70466
$L70491:

; 311  : 	DYNBUF_ADD(name, field, field_sz, NO_CONV);

	push	0
	push	0
	mov	edx, DWORD PTR _field_sz$[ebp]
	push	edx
	mov	eax, DWORD PTR _field$[ebp]
	push	eax
	mov	ecx, DWORD PTR _name$[ebp]
	push	ecx
	call	_dynbuf_add
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L70496
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29872], OFFSET FLAT:$SG70498
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 311		; 00000137H
	jmp	SHORT $eva_err$70466
$L70496:

; 312  : 
; 313  : 	/* Build final name */
; 314  : 	if(cgi_build_finalname(cntxt, name, 0, subfield, subfield_sz, num, row, lvl)) STACK_ERROR;

	mov	ecx, DWORD PTR _lvl$[ebp]
	push	ecx
	mov	edx, DWORD PTR _row$[ebp]
	push	edx
	mov	eax, DWORD PTR _num$[ebp]
	push	eax
	mov	ecx, DWORD PTR _subfield_sz$[ebp]
	push	ecx
	mov	edx, DWORD PTR _subfield$[ebp]
	push	edx
	push	0
	mov	eax, DWORD PTR _name$[ebp]
	push	eax
	mov	ecx, DWORD PTR _cntxt$[ebp]
	push	ecx
	call	_cgi_build_finalname
	add	esp, 32					; 00000020H
	test	eax, eax
	je	SHORT $eva_noerr$70500
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 314		; 0000013aH
	jmp	SHORT $eva_err$70466
$eva_noerr$70500:

; 315  : 
; 316  : 	RETURN_OK_CLEANUP;

	push	0
	push	OFFSET FLAT:$SG70501
	push	OFFSET FLAT:$SG70502
	mov	eax, DWORD PTR _cntxt$[ebp]
	push	eax
	call	_err_clear
	add	esp, 16					; 00000010H
$eva_err$70466:
	mov	ecx, DWORD PTR _cntxt$[ebp]
	cmp	DWORD PTR [ecx+29872], 0
	je	SHORT $L70503
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	eax, DWORD PTR [edx+29900]
	push	eax
	push	OFFSET FLAT:$SG70504
	push	OFFSET FLAT:$SG70505
	mov	ecx, DWORD PTR _cntxt$[ebp]
	push	ecx
	call	_err_add_context
	add	esp, 16					; 00000010H
$L70503:
	mov	edx, DWORD PTR _cntxt$[ebp]
	xor	eax, eax
	cmp	DWORD PTR [edx+29872], 0
	setne	al

; 317  : }

	pop	ebp
	ret	0
_cgi_build_name ENDP
_TEXT	ENDS
PUBLIC	_cgi_build_basename
EXTRN	_dynbuf_add3:NEAR
EXTRN	_dyntab_sz:NEAR
_BSS	SEGMENT
	ALIGN	4

$SG70533 DB	01H DUP (?)
	ALIGN	4

$SG70542 DB	01H DUP (?)
_BSS	ENDS
_DATA	SEGMENT
	ORG $+1
$SG70522 DB	'Erreur du programme', 00H
$SG70528 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70532 DB	'/', 00H
	ORG $+2
$SG70535 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70539 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70543 DB	'$', 00H
	ORG $+2
$SG70545 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70548 DB	'#', 00H
	ORG $+2
$SG70550 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70554 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70556 DB	'D:\Travail\ABI\EVA\V4.0\CGI\Brunix-2016\cgi_utils.c', 00H
$SG70557 DB	'cgi_build_basename', 00H
	ORG $+1
$SG70559 DB	'D:\Travail\ABI\EVA\V4.0\CGI\Brunix-2016\cgi_utils.c', 00H
$SG70560 DB	'cgi_build_basename', 00H
_DATA	ENDS
_TEXT	SEGMENT
_cntxt$ = 8
_name$ = 12
_i_ctrl$ = 16
_type$ = 20
_form$ = -4
_ctrl$ = -8
_cgi_build_basename PROC NEAR

; 332  : ){

	push	ebp
	mov	ebp, esp
	sub	esp, 8

; 333  : 	EVA_form *form = cntxt->form;

	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	ecx, DWORD PTR [eax+80]
	mov	DWORD PTR _form$[ebp], ecx

; 334  : 	EVA_ctrl *ctrl = form->ctrl + i_ctrl;

	mov	edx, DWORD PTR _i_ctrl$[ebp]
	imul	edx, 480				; 000001e0H
	mov	eax, DWORD PTR _form$[ebp]
	mov	ecx, DWORD PTR [eax]
	add	ecx, edx
	mov	DWORD PTR _ctrl$[ebp], ecx

; 335  : 
; 336  : 	/* Check params */
; 337  : 	if(!name) RETURN_ERROR("Erreur du programme", NOP);

	cmp	DWORD PTR _name$[ebp], 0
	jne	SHORT $L70520
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29872], OFFSET FLAT:$SG70522
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 337		; 00000151H
	jmp	$eva_err$70523
$L70520:

; 338  : 	if(*name) { (*name)->cnt = 0; memset((*name)->data, 0, (*name)->sz); }

	mov	ecx, DWORD PTR _name$[ebp]
	cmp	DWORD PTR [ecx], 0
	je	SHORT $L70524
	mov	edx, DWORD PTR _name$[ebp]
	mov	eax, DWORD PTR [edx]
	mov	DWORD PTR [eax+4], 0
	mov	ecx, DWORD PTR _name$[ebp]
	mov	edx, DWORD PTR [ecx]
	mov	eax, DWORD PTR [edx]
	push	eax
	push	0
	mov	ecx, DWORD PTR _name$[ebp]
	mov	edx, DWORD PTR [ecx]
	add	edx, 8
	push	edx
	call	_memset
	add	esp, 12					; 0000000cH
$L70524:

; 339  : 
; 340  : 	/* Add input type */
; 341  : 	DYNBUF_ADD(name, &type, 1, NO_CONV);

	push	0
	push	0
	push	1
	lea	eax, DWORD PTR _type$[ebp]
	push	eax
	mov	ecx, DWORD PTR _name$[ebp]
	push	ecx
	call	_dynbuf_add
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L70526
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29872], OFFSET FLAT:$SG70528
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 341		; 00000155H
	jmp	$eva_err$70523
$L70526:

; 342  : 
; 343  : 	/* Add control id / form id */
; 344  : 	if(i_ctrl && form->ctrl) DYNBUF_ADD3_CELL(name, "", &ctrl->id, 0, 0, NO_CONV, "/");

	cmp	DWORD PTR _i_ctrl$[ebp], 0
	je	SHORT $L70531
	mov	ecx, DWORD PTR _form$[ebp]
	cmp	DWORD PTR [ecx], 0
	je	SHORT $L70531
	push	1
	push	OFFSET FLAT:$SG70532
	push	0
	push	0
	push	0
	push	0
	mov	edx, DWORD PTR _ctrl$[ebp]
	push	edx
	call	_dyntab_sz
	add	esp, 12					; 0000000cH
	push	eax
	push	0
	push	0
	mov	eax, DWORD PTR _ctrl$[ebp]
	push	eax
	call	_dyntab_val
	add	esp, 12					; 0000000cH
	push	eax
	push	0
	push	OFFSET FLAT:$SG70533
	mov	ecx, DWORD PTR _name$[ebp]
	push	ecx
	call	_dynbuf_add3
	add	esp, 36					; 00000024H
	test	eax, eax
	je	SHORT $L70531
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29872], OFFSET FLAT:$SG70535
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 344		; 00000158H
	jmp	$eva_err$70523
$L70531:

; 345  : 	DYNBUF_ADD_CELL(name, &form->id_form, 0, 0, NO_CONV);

	push	0
	push	0
	push	0
	push	0
	mov	ecx, DWORD PTR _form$[ebp]
	add	ecx, 12					; 0000000cH
	push	ecx
	call	_dyntab_sz
	add	esp, 12					; 0000000cH
	push	eax
	push	0
	push	0
	mov	edx, DWORD PTR _form$[ebp]
	add	edx, 12					; 0000000cH
	push	edx
	call	_dyntab_val
	add	esp, 12					; 0000000cH
	push	eax
	mov	eax, DWORD PTR _name$[ebp]
	push	eax
	call	_dynbuf_add
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L70537
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29872], OFFSET FLAT:$SG70539
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 345		; 00000159H
	jmp	$eva_err$70523
$L70537:

; 346  : 
; 347  : 	/* Add "$" & id_obj */
; 348  : 	DYNBUF_ADD3_CELL(name, "$", &form->id_obj, 0, 0, NO_CONV, "");

	push	0
	push	OFFSET FLAT:$SG70542
	push	0
	push	0
	push	0
	push	0
	mov	eax, DWORD PTR _form$[ebp]
	add	eax, 32					; 00000020H
	push	eax
	call	_dyntab_sz
	add	esp, 12					; 0000000cH
	push	eax
	push	0
	push	0
	mov	ecx, DWORD PTR _form$[ebp]
	add	ecx, 32					; 00000020H
	push	ecx
	call	_dyntab_val
	add	esp, 12					; 0000000cH
	push	eax
	push	1
	push	OFFSET FLAT:$SG70543
	mov	edx, DWORD PTR _name$[ebp]
	push	edx
	call	_dynbuf_add3
	add	esp, 36					; 00000024H
	test	eax, eax
	je	SHORT $L70541
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29872], OFFSET FLAT:$SG70545
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 348		; 0000015cH
	jmp	$eva_err$70523
$L70541:

; 349  : 
; 350  : 	/* Add "#" & field */
; 351  : 	DYNBUF_ADD_STR(name, "#");

	push	0
	push	0
	push	1
	push	OFFSET FLAT:$SG70548
	mov	edx, DWORD PTR _name$[ebp]
	push	edx
	call	_dynbuf_add
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L70547
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29872], OFFSET FLAT:$SG70550
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 351		; 0000015fH
	jmp	SHORT $eva_err$70523
$L70547:

; 352  : 	DYNBUF_ADD(name, ctrl->FIELD, strlen(ctrl->FIELD), NO_CONV)

	push	0
	push	0
	mov	edx, DWORD PTR _ctrl$[ebp]
	mov	eax, DWORD PTR [edx+280]
	push	eax
	call	_strlen
	add	esp, 4
	push	eax
	mov	ecx, DWORD PTR _ctrl$[ebp]
	mov	edx, DWORD PTR [ecx+280]
	push	edx
	mov	eax, DWORD PTR _name$[ebp]
	push	eax
	call	_dynbuf_add
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L70552
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29872], OFFSET FLAT:$SG70554
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 352		; 00000160H
	jmp	SHORT $eva_err$70523
$L70552:
$eva_noerr$70555:

; 353  : 
; 354  : 	RETURN_OK_CLEANUP;

	push	0
	push	OFFSET FLAT:$SG70556
	push	OFFSET FLAT:$SG70557
	mov	eax, DWORD PTR _cntxt$[ebp]
	push	eax
	call	_err_clear
	add	esp, 16					; 00000010H
$eva_err$70523:
	mov	ecx, DWORD PTR _cntxt$[ebp]
	cmp	DWORD PTR [ecx+29872], 0
	je	SHORT $L70558
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	eax, DWORD PTR [edx+29900]
	push	eax
	push	OFFSET FLAT:$SG70559
	push	OFFSET FLAT:$SG70560
	mov	ecx, DWORD PTR _cntxt$[ebp]
	push	ecx
	call	_err_add_context
	add	esp, 16					; 00000010H
$L70558:
	mov	edx, DWORD PTR _cntxt$[ebp]
	xor	eax, eax
	cmp	DWORD PTR [edx+29872], 0
	setne	al

; 355  : }

	mov	esp, ebp
	pop	ebp
	ret	0
_cgi_build_basename ENDP
_TEXT	ENDS
_BSS	SEGMENT
	ALIGN	4

$SG70588 DB	01H DUP (?)
	ALIGN	4

$SG70606 DB	01H DUP (?)
	ALIGN	4

$SG70612 DB	01H DUP (?)
_BSS	ENDS
_DATA	SEGMENT
	ORG $+1
$SG70589 DB	'.', 00H
	ORG $+2
$SG70591 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70595 DB	'$', 00H
	ORG $+2
$SG70597 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70602 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70607 DB	'.', 00H
	ORG $+2
$SG70609 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70613 DB	'.', 00H
	ORG $+2
$SG70615 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70616 DB	'D:\Travail\ABI\EVA\V4.0\CGI\Brunix-2016\cgi_utils.c', 00H
$SG70617 DB	'cgi_build_finalname', 00H
$SG70619 DB	'D:\Travail\ABI\EVA\V4.0\CGI\Brunix-2016\cgi_utils.c', 00H
$SG70620 DB	'cgi_build_finalname', 00H
_DATA	ENDS
_TEXT	SEGMENT
_cntxt$ = 8
_name$ = 12
_type$ = 16
_subfield$ = 20
_subfield_sz$ = 24
_num$ = 28
_row$ = 32
_lang$ = 36
_cgi_build_finalname PROC NEAR

; 376  : ){

	push	ebp
	mov	ebp, esp
	push	ecx

; 377  : 	if(!name || !*name) RETURN_OK;

	cmp	DWORD PTR _name$[ebp], 0
	je	SHORT $L70582
	mov	eax, DWORD PTR _name$[ebp]
	cmp	DWORD PTR [eax], 0
	jne	SHORT $L70581
$L70582:
	jmp	$eva_noerr$70583
$L70581:

; 378  : 
; 379  : 	/* Copy control base name & set type */
; 380  : 	if(type) (*name)->data[0] = type;

	movsx	ecx, BYTE PTR _type$[ebp]
	test	ecx, ecx
	je	SHORT $L70584
	mov	edx, DWORD PTR _name$[ebp]
	mov	eax, DWORD PTR [edx]
	mov	cl, BYTE PTR _type$[ebp]
	mov	BYTE PTR [eax+8], cl
$L70584:

; 381  : 
; 382  : 	/* Add .subfield if needed */
; 383  : 	if(subfield && *subfield)

	cmp	DWORD PTR _subfield$[ebp], 0
	je	SHORT $L70587
	mov	edx, DWORD PTR _subfield$[ebp]
	movsx	eax, BYTE PTR [edx]
	test	eax, eax
	je	SHORT $L70587

; 384  : 		DYNBUF_ADD3(name, ".", subfield, subfield_sz, NO_CONV, "");

	push	0
	push	OFFSET FLAT:$SG70588
	push	0
	push	0
	mov	ecx, DWORD PTR _subfield_sz$[ebp]
	push	ecx
	mov	edx, DWORD PTR _subfield$[ebp]
	push	edx
	push	1
	push	OFFSET FLAT:$SG70589
	mov	eax, DWORD PTR _name$[ebp]
	push	eax
	call	_dynbuf_add3
	add	esp, 36					; 00000024H
	test	eax, eax
	je	SHORT $L70587
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29872], OFFSET FLAT:$SG70591
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 384		; 00000180H
	jmp	$eva_err$70592
$L70587:

; 385  : 
; 386  : 	/* Add "$" and value indexes */
; 387  : 	DYNBUF_ADD_STR(name, "$");

	push	0
	push	0
	push	1
	push	OFFSET FLAT:$SG70595
	mov	eax, DWORD PTR _name$[ebp]
	push	eax
	call	_dynbuf_add
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L70594
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29872], OFFSET FLAT:$SG70597
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 387		; 00000183H
	jmp	$eva_err$70592
$L70594:

; 388  : 	if(num || row || lang) DYNBUF_ADD_INT(name, num ? num : 1);

	cmp	DWORD PTR _num$[ebp], 0
	jne	SHORT $L70599
	cmp	DWORD PTR _row$[ebp], 0
	jne	SHORT $L70599
	cmp	DWORD PTR _lang$[ebp], 0
	je	SHORT $L70600
$L70599:
	cmp	DWORD PTR _num$[ebp], 0
	je	SHORT $L71816
	mov	eax, DWORD PTR _num$[ebp]
	mov	DWORD PTR -4+[ebp], eax
	jmp	SHORT $L71817
$L71816:
	mov	DWORD PTR -4+[ebp], 1
$L71817:
	mov	ecx, DWORD PTR -4+[ebp]
	push	ecx
	mov	edx, DWORD PTR _name$[ebp]
	push	edx
	call	_dynbuf_add_int
	add	esp, 8
	test	eax, eax
	je	SHORT $L70600
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29872], OFFSET FLAT:$SG70602
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 388		; 00000184H
	jmp	$eva_err$70592
$L70600:

; 389  : 	if(row || lang) DYNBUF_ADD3_INT(name, ".", row, "");

	cmp	DWORD PTR _row$[ebp], 0
	jne	SHORT $L70604
	cmp	DWORD PTR _lang$[ebp], 0
	je	SHORT $L70605
$L70604:
	push	0
	push	OFFSET FLAT:$SG70606
	mov	edx, DWORD PTR _row$[ebp]
	push	edx
	push	1
	push	OFFSET FLAT:$SG70607
	mov	eax, DWORD PTR _name$[ebp]
	push	eax
	call	_dynbuf_add3_int
	add	esp, 24					; 00000018H
	test	eax, eax
	je	SHORT $L70605
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29872], OFFSET FLAT:$SG70609
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 389		; 00000185H
	jmp	SHORT $eva_err$70592
$L70605:

; 390  : 	if(lang) DYNBUF_ADD3_INT(name, ".", lang, "");

	cmp	DWORD PTR _lang$[ebp], 0
	je	SHORT $L70611
	push	0
	push	OFFSET FLAT:$SG70612
	mov	eax, DWORD PTR _lang$[ebp]
	push	eax
	push	1
	push	OFFSET FLAT:$SG70613
	mov	ecx, DWORD PTR _name$[ebp]
	push	ecx
	call	_dynbuf_add3_int
	add	esp, 24					; 00000018H
	test	eax, eax
	je	SHORT $L70611
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29872], OFFSET FLAT:$SG70615
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 390		; 00000186H
	jmp	SHORT $eva_err$70592
$L70611:

; 391  : 	(*name)->data[(*name)->cnt] = 0;

	mov	ecx, DWORD PTR _name$[ebp]
	mov	edx, DWORD PTR [ecx]
	mov	eax, DWORD PTR _name$[ebp]
	mov	ecx, DWORD PTR [eax]
	mov	eax, DWORD PTR [ecx+4]
	mov	BYTE PTR [edx+eax+8], 0
$eva_noerr$70583:

; 392  : 
; 393  : 	RETURN_OK_CLEANUP;

	push	0
	push	OFFSET FLAT:$SG70616
	push	OFFSET FLAT:$SG70617
	mov	ecx, DWORD PTR _cntxt$[ebp]
	push	ecx
	call	_err_clear
	add	esp, 16					; 00000010H
$eva_err$70592:
	mov	edx, DWORD PTR _cntxt$[ebp]
	cmp	DWORD PTR [edx+29872], 0
	je	SHORT $L70618
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	ecx, DWORD PTR [eax+29900]
	push	ecx
	push	OFFSET FLAT:$SG70619
	push	OFFSET FLAT:$SG70620
	mov	edx, DWORD PTR _cntxt$[ebp]
	push	edx
	call	_err_add_context
	add	esp, 16					; 00000010H
$L70618:
	mov	eax, DWORD PTR _cntxt$[ebp]
	xor	ecx, ecx
	cmp	DWORD PTR [eax+29872], 0
	setne	cl
	mov	eax, ecx

; 394  : }

	mov	esp, ebp
	pop	ebp
	ret	0
_cgi_build_finalname ENDP
_TEXT	ENDS
PUBLIC	_cgi_parse_name
PUBLIC	_cgi_add_input
EXTRN	__pctype:DWORD
EXTRN	__isctype:NEAR
EXTRN	___mb_cur_max:DWORD
EXTRN	_mem_alloc:NEAR
EXTRN	_memcpy:NEAR
_BSS	SEGMENT
	ALIGN	4

$SG70713 DB	01H DUP (?)
	ALIGN	4

$SG70714 DB	01H DUP (?)
	ALIGN	4

$SG70750 DB	01H DUP (?)
	ALIGN	4

$SG70751 DB	01H DUP (?)
_BSS	ENDS
_DATA	SEGMENT
$SG70642 DB	'IBT', 00H
$SG70644 DB	'.x', 00H
	ORG $+1
$SG70645 DB	'.y', 00H
	ORG $+1
$SG70651 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70679 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70687 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70696 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70711 DB	'TRANSMIT_FILE', 00H
	ORG $+2
$SG70712 DB	'TRANSMIT_FILE', 00H
	ORG $+2
$SG70716 DB	'JSINPUT', 00H
$SG70718 DB	'IBT', 00H
$SG70744 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70752 DB	'D:\Travail\ABI\EVA\V4.0\CGI\Brunix-2016\cgi_utils.c', 00H
$SG70753 DB	'cgi_parse_name', 00H
	ORG $+1
$SG70755 DB	'D:\Travail\ABI\EVA\V4.0\CGI\Brunix-2016\cgi_utils.c', 00H
$SG70756 DB	'cgi_parse_name', 00H
_DATA	ENDS
_TEXT	SEGMENT
_t1$70665 = -44
_size$70674 = -48
_src$70675 = -52
_size1$70676 = -56
_size$70682 = -60
_src$70683 = -64
_size1$70684 = -68
_size$70691 = -72
_src$70692 = -76
_size1$70693 = -80
_i$70708 = -84
_j$70709 = -88
_size$70739 = -92
_src$70740 = -96
_size1$70741 = -100
_cntxt$ = 8
_cgi$ = 12
_name$ = -28
_name1$ = -16
_idobj$ = -4
_field$ = -8
_index$ = -24
_t$ = -12
_len$ = -20
_size$70646 = -32
_src$70647 = -36
_size1$70648 = -40
_cgi_parse_name PROC NEAR

; 407  : ){

	push	ebp
	mov	ebp, esp
	sub	esp, 128				; 00000080H

; 408  : 	char *name = NULL, *name1 = NULL;

	mov	DWORD PTR _name$[ebp], 0
	mov	DWORD PTR _name1$[ebp], 0

; 409  : 	char *idobj, *field, *index, *t;
; 410  : 	size_t len;
; 411  : 
; 412  : 	if(!cgi->name || !cgi->name_sz) RETURN_OK;

	mov	eax, DWORD PTR _cgi$[ebp]
	cmp	DWORD PTR [eax], 0
	je	SHORT $L70639
	mov	ecx, DWORD PTR _cgi$[ebp]
	cmp	DWORD PTR [ecx+4], 0
	jne	SHORT $L70638
$L70639:
	jmp	$eva_noerr$70640
$L70638:

; 413  : 
; 414  : 	/* Remove .x & .y extensions from image clicks */
; 415  : 	if(strchr("IBT", cgi->name[0]) && cgi->name_sz > 2 &&
; 416  : 		(!strcmp(cgi->name + cgi->name_sz - 2, ".x") ||
; 417  : 		 !strcmp(cgi->name + cgi->name_sz - 2, ".y")))

	mov	edx, DWORD PTR _cgi$[ebp]
	mov	eax, DWORD PTR [edx]
	movsx	ecx, BYTE PTR [eax]
	push	ecx
	push	OFFSET FLAT:$SG70642
	call	_strchr
	add	esp, 8
	test	eax, eax
	je	SHORT $L70641
	mov	edx, DWORD PTR _cgi$[ebp]
	cmp	DWORD PTR [edx+4], 2
	jbe	SHORT $L70641
	push	OFFSET FLAT:$SG70644
	mov	eax, DWORD PTR _cgi$[ebp]
	mov	ecx, DWORD PTR [eax]
	mov	edx, DWORD PTR _cgi$[ebp]
	mov	eax, DWORD PTR [edx+4]
	lea	ecx, DWORD PTR [ecx+eax-2]
	push	ecx
	call	_strcmp
	add	esp, 8
	test	eax, eax
	je	SHORT $L70643
	push	OFFSET FLAT:$SG70645
	mov	edx, DWORD PTR _cgi$[ebp]
	mov	eax, DWORD PTR [edx]
	mov	ecx, DWORD PTR _cgi$[ebp]
	mov	edx, DWORD PTR [ecx+4]
	lea	eax, DWORD PTR [eax+edx-2]
	push	eax
	call	_strcmp
	add	esp, 8
	test	eax, eax
	jne	SHORT $L70641
$L70643:

; 419  : 		cgi->name_sz -= 2;

	mov	ecx, DWORD PTR _cgi$[ebp]
	mov	edx, DWORD PTR [ecx+4]
	sub	edx, 2
	mov	eax, DWORD PTR _cgi$[ebp]
	mov	DWORD PTR [eax+4], edx

; 420  : 		cgi->name[cgi->name_sz] = 0;

	mov	ecx, DWORD PTR _cgi$[ebp]
	mov	edx, DWORD PTR [ecx]
	mov	eax, DWORD PTR _cgi$[ebp]
	mov	ecx, DWORD PTR [eax+4]
	mov	BYTE PTR [edx+ecx], 0
$L70641:

; 422  : 
; 423  : 	/* Split name parts */
; 424  : 	M_STRDUP(name, cgi->name, cgi->name_sz);

	mov	edx, DWORD PTR _cgi$[ebp]
	mov	eax, DWORD PTR [edx+4]
	mov	DWORD PTR _size$70646[ebp], eax
	mov	ecx, DWORD PTR _cgi$[ebp]
	mov	edx, DWORD PTR [ecx]
	mov	DWORD PTR _src$70647[ebp], edx
	mov	eax, DWORD PTR _size$70646[ebp]
	add	eax, 1
	mov	DWORD PTR _size1$70648[ebp], eax
	mov	ecx, DWORD PTR _size1$70648[ebp]
	push	ecx
	call	_mem_alloc
	add	esp, 4
	mov	DWORD PTR _name$[ebp], eax
	cmp	DWORD PTR _size1$70648[ebp], 0
	je	SHORT $L70649
	cmp	DWORD PTR _name$[ebp], 0
	jne	SHORT $L70649
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29872], OFFSET FLAT:$SG70651
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 424		; 000001a8H
	jmp	$eva_err$70652
$L70649:
	cmp	DWORD PTR _src$70647[ebp], 0
	je	SHORT $L70654
	cmp	DWORD PTR _size$70646[ebp], 0
	je	SHORT $L70654
	mov	ecx, DWORD PTR _size$70646[ebp]
	push	ecx
	mov	edx, DWORD PTR _src$70647[ebp]
	push	edx
	mov	eax, DWORD PTR _name$[ebp]
	push	eax
	call	_memcpy
	add	esp, 12					; 0000000cH
$L70654:

; 425  : 	idobj = name + 1; while(*idobj && *idobj != '$') idobj++;

	mov	ecx, DWORD PTR _name$[ebp]
	add	ecx, 1
	mov	DWORD PTR _idobj$[ebp], ecx
$L70656:
	mov	edx, DWORD PTR _idobj$[ebp]
	movsx	eax, BYTE PTR [edx]
	test	eax, eax
	je	SHORT $L70657
	mov	ecx, DWORD PTR _idobj$[ebp]
	movsx	edx, BYTE PTR [ecx]
	cmp	edx, 36					; 00000024H
	je	SHORT $L70657
	mov	eax, DWORD PTR _idobj$[ebp]
	add	eax, 1
	mov	DWORD PTR _idobj$[ebp], eax
	jmp	SHORT $L70656
$L70657:

; 426  : 	if(*idobj)

	mov	ecx, DWORD PTR _idobj$[ebp]
	movsx	edx, BYTE PTR [ecx]
	test	edx, edx
	je	$L70699

; 428  : 		*idobj = 0;

	mov	eax, DWORD PTR _idobj$[ebp]
	mov	BYTE PTR [eax], 0

; 429  : 		field = ++idobj;

	mov	ecx, DWORD PTR _idobj$[ebp]
	add	ecx, 1
	mov	DWORD PTR _idobj$[ebp], ecx
	mov	edx, DWORD PTR _idobj$[ebp]
	mov	DWORD PTR _field$[ebp], edx

; 430  : 		index = field;

	mov	eax, DWORD PTR _field$[ebp]
	mov	DWORD PTR _index$[ebp], eax
$L70660:

; 431  : 		while(*index && *index != '$') index++;

	mov	ecx, DWORD PTR _index$[ebp]
	movsx	edx, BYTE PTR [ecx]
	test	edx, edx
	je	SHORT $L70661
	mov	eax, DWORD PTR _index$[ebp]
	movsx	ecx, BYTE PTR [eax]
	cmp	ecx, 36					; 00000024H
	je	SHORT $L70661
	mov	edx, DWORD PTR _index$[ebp]
	add	edx, 1
	mov	DWORD PTR _index$[ebp], edx
	jmp	SHORT $L70660
$L70661:

; 432  : 		if(*index)

	mov	eax, DWORD PTR _index$[ebp]
	movsx	ecx, BYTE PTR [eax]
	test	ecx, ecx
	je	$L70667

; 434  : 			*index = 0;

	mov	edx, DWORD PTR _index$[ebp]
	mov	BYTE PTR [edx], 0

; 435  : 			index++;

	mov	eax, DWORD PTR _index$[ebp]
	add	eax, 1
	mov	DWORD PTR _index$[ebp], eax

; 436  : 
; 437  : 			/* Store indexes */
; 438  : 			cgi->Num = strtoul(index, NULL, 10);

	push	10					; 0000000aH
	push	0
	mov	ecx, DWORD PTR _index$[ebp]
	push	ecx
	call	_strtoul
	add	esp, 12					; 0000000cH
	mov	edx, DWORD PTR _cgi$[ebp]
	mov	DWORD PTR [edx+36], eax

; 439  : 			t = strchr(index, '.');

	push	46					; 0000002eH
	mov	eax, DWORD PTR _index$[ebp]
	push	eax
	call	_strchr
	add	esp, 8
	mov	DWORD PTR _t$[ebp], eax

; 440  : 			if(t)

	cmp	DWORD PTR _t$[ebp], 0
	je	SHORT $L70667

; 442  : 				char *t1 = strchr(t + 1, '.');

	push	46					; 0000002eH
	mov	ecx, DWORD PTR _t$[ebp]
	add	ecx, 1
	push	ecx
	call	_strchr
	add	esp, 8
	mov	DWORD PTR _t1$70665[ebp], eax

; 443  : 				cgi->Line = strtoul(t + 1, NULL, 10);

	push	10					; 0000000aH
	push	0
	mov	edx, DWORD PTR _t$[ebp]
	add	edx, 1
	push	edx
	call	_strtoul
	add	esp, 12					; 0000000cH
	mov	ecx, DWORD PTR _cgi$[ebp]
	mov	DWORD PTR [ecx+40], eax

; 444  : 				if(t1) cgi->Lang = strtoul(t1 + 1, NULL, 10);

	cmp	DWORD PTR _t1$70665[ebp], 0
	je	SHORT $L70667
	push	10					; 0000000aH
	push	0
	mov	edx, DWORD PTR _t1$70665[ebp]
	add	edx, 1
	push	edx
	call	_strtoul
	add	esp, 12					; 0000000cH
	mov	ecx, DWORD PTR _cgi$[ebp]
	mov	DWORD PTR [ecx+44], eax
$L70667:

; 447  : 		while(*field && *field != '#') field++;

	mov	edx, DWORD PTR _field$[ebp]
	movsx	eax, BYTE PTR [edx]
	test	eax, eax
	je	SHORT $L70671
	mov	ecx, DWORD PTR _field$[ebp]
	movsx	edx, BYTE PTR [ecx]
	cmp	edx, 35					; 00000023H
	je	SHORT $L70671
	mov	eax, DWORD PTR _field$[ebp]
	add	eax, 1
	mov	DWORD PTR _field$[ebp], eax
	jmp	SHORT $L70667
$L70671:

; 448  : 		if(*field)

	mov	ecx, DWORD PTR _field$[ebp]
	movsx	edx, BYTE PTR [ecx]
	test	edx, edx
	je	$L70698

; 450  : 			*field = 0;

	mov	eax, DWORD PTR _field$[ebp]
	mov	BYTE PTR [eax], 0

; 451  : 			++field;

	mov	ecx, DWORD PTR _field$[ebp]
	add	ecx, 1
	mov	DWORD PTR _field$[ebp], ecx

; 452  : 
; 453  : 			/* Store field & subfield */
; 454  : 			t = strchr(field, '.');

	push	46					; 0000002eH
	mov	edx, DWORD PTR _field$[ebp]
	push	edx
	call	_strchr
	add	esp, 8
	mov	DWORD PTR _t$[ebp], eax

; 455  : 			if(t)

	cmp	DWORD PTR _t$[ebp], 0
	je	$L70673

; 457  : 				M_STRDUP(cgi->subfield, t + 1, strlen(t));

	mov	eax, DWORD PTR _t$[ebp]
	push	eax
	call	_strlen
	add	esp, 4
	mov	DWORD PTR _size$70674[ebp], eax
	mov	ecx, DWORD PTR _t$[ebp]
	add	ecx, 1
	mov	DWORD PTR _src$70675[ebp], ecx
	mov	edx, DWORD PTR _size$70674[ebp]
	add	edx, 1
	mov	DWORD PTR _size1$70676[ebp], edx
	mov	eax, DWORD PTR _size1$70676[ebp]
	push	eax
	call	_mem_alloc
	add	esp, 4
	mov	ecx, DWORD PTR _cgi$[ebp]
	mov	DWORD PTR [ecx+32], eax
	cmp	DWORD PTR _size1$70676[ebp], 0
	je	SHORT $L70677
	mov	edx, DWORD PTR _cgi$[ebp]
	cmp	DWORD PTR [edx+32], 0
	jne	SHORT $L70677
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29872], OFFSET FLAT:$SG70679
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 457		; 000001c9H
	jmp	$eva_err$70652
$L70677:
	cmp	DWORD PTR _src$70675[ebp], 0
	je	SHORT $L70681
	cmp	DWORD PTR _size$70674[ebp], 0
	je	SHORT $L70681
	mov	edx, DWORD PTR _size$70674[ebp]
	push	edx
	mov	eax, DWORD PTR _src$70675[ebp]
	push	eax
	mov	ecx, DWORD PTR _cgi$[ebp]
	mov	edx, DWORD PTR [ecx+32]
	push	edx
	call	_memcpy
	add	esp, 12					; 0000000cH
$L70681:

; 458  : 				M_STRDUP(cgi->field, field, t - field);

	mov	eax, DWORD PTR _t$[ebp]
	sub	eax, DWORD PTR _field$[ebp]
	mov	DWORD PTR _size$70682[ebp], eax
	mov	ecx, DWORD PTR _field$[ebp]
	mov	DWORD PTR _src$70683[ebp], ecx
	mov	edx, DWORD PTR _size$70682[ebp]
	add	edx, 1
	mov	DWORD PTR _size1$70684[ebp], edx
	mov	eax, DWORD PTR _size1$70684[ebp]
	push	eax
	call	_mem_alloc
	add	esp, 4
	mov	ecx, DWORD PTR _cgi$[ebp]
	mov	DWORD PTR [ecx+28], eax
	cmp	DWORD PTR _size1$70684[ebp], 0
	je	SHORT $L70685
	mov	edx, DWORD PTR _cgi$[ebp]
	cmp	DWORD PTR [edx+28], 0
	jne	SHORT $L70685
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29872], OFFSET FLAT:$SG70687
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 458		; 000001caH
	jmp	$eva_err$70652
$L70685:
	cmp	DWORD PTR _src$70683[ebp], 0
	je	SHORT $L70689
	cmp	DWORD PTR _size$70682[ebp], 0
	je	SHORT $L70689
	mov	edx, DWORD PTR _size$70682[ebp]
	push	edx
	mov	eax, DWORD PTR _src$70683[ebp]
	push	eax
	mov	ecx, DWORD PTR _cgi$[ebp]
	mov	edx, DWORD PTR [ecx+28]
	push	edx
	call	_memcpy
	add	esp, 12					; 0000000cH
$L70689:

; 460  : 			else

	jmp	$L70698
$L70673:

; 461  : 				M_STRDUP(cgi->field, field, strlen(field));

	mov	eax, DWORD PTR _field$[ebp]
	push	eax
	call	_strlen
	add	esp, 4
	mov	DWORD PTR _size$70691[ebp], eax
	mov	ecx, DWORD PTR _field$[ebp]
	mov	DWORD PTR _src$70692[ebp], ecx
	mov	edx, DWORD PTR _size$70691[ebp]
	add	edx, 1
	mov	DWORD PTR _size1$70693[ebp], edx
	mov	eax, DWORD PTR _size1$70693[ebp]
	push	eax
	call	_mem_alloc
	add	esp, 4
	mov	ecx, DWORD PTR _cgi$[ebp]
	mov	DWORD PTR [ecx+28], eax
	cmp	DWORD PTR _size1$70693[ebp], 0
	je	SHORT $L70694
	mov	edx, DWORD PTR _cgi$[ebp]
	cmp	DWORD PTR [edx+28], 0
	jne	SHORT $L70694
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29872], OFFSET FLAT:$SG70696
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 461		; 000001cdH
	jmp	$eva_err$70652
$L70694:
	cmp	DWORD PTR _src$70692[ebp], 0
	je	SHORT $L70698
	cmp	DWORD PTR _size$70691[ebp], 0
	je	SHORT $L70698
	mov	edx, DWORD PTR _size$70691[ebp]
	push	edx
	mov	eax, DWORD PTR _src$70692[ebp]
	push	eax
	mov	ecx, DWORD PTR _cgi$[ebp]
	mov	edx, DWORD PTR [ecx+28]
	push	edx
	call	_memcpy
	add	esp, 12					; 0000000cH
$L70698:

; 463  : 		/* Store object id */
; 464  : 		if(*idobj) cgi->IdObj = strtoul(idobj, NULL, 10);

	mov	eax, DWORD PTR _idobj$[ebp]
	movsx	ecx, BYTE PTR [eax]
	test	ecx, ecx
	je	SHORT $L70699
	push	10					; 0000000aH
	push	0
	mov	edx, DWORD PTR _idobj$[ebp]
	push	edx
	call	_strtoul
	add	esp, 12					; 0000000cH
	mov	ecx, DWORD PTR _cgi$[ebp]
	mov	DWORD PTR [ecx+24], eax
$L70699:

; 466  : 
; 467  : 	/* Store form id  & control id & path */
; 468  : 	len = strlen(name);

	mov	edx, DWORD PTR _name$[ebp]
	push	edx
	call	_strlen
	add	esp, 4
	mov	DWORD PTR _len$[ebp], eax

; 469  : 	t = name + len;

	mov	eax, DWORD PTR _name$[ebp]
	add	eax, DWORD PTR _len$[ebp]
	mov	DWORD PTR _t$[ebp], eax
$L70702:

; 470  : 	while(t > name && isdigit(*(t-1))) t--;

	mov	ecx, DWORD PTR _t$[ebp]
	cmp	ecx, DWORD PTR _name$[ebp]
	jbe	SHORT $L70703
	cmp	DWORD PTR ___mb_cur_max, 1
	jle	SHORT $L71819
	push	4
	mov	edx, DWORD PTR _t$[ebp]
	movsx	eax, BYTE PTR [edx-1]
	push	eax
	call	__isctype
	add	esp, 8
	mov	DWORD PTR -104+[ebp], eax
	jmp	SHORT $L71820
$L71819:
	mov	ecx, DWORD PTR _t$[ebp]
	movsx	edx, BYTE PTR [ecx-1]
	mov	eax, DWORD PTR __pctype
	xor	ecx, ecx
	mov	cx, WORD PTR [eax+edx*2]
	and	ecx, 4
	mov	DWORD PTR -104+[ebp], ecx
$L71820:
	cmp	DWORD PTR -104+[ebp], 0
	je	SHORT $L70703
	mov	edx, DWORD PTR _t$[ebp]
	sub	edx, 1
	mov	DWORD PTR _t$[ebp], edx
	jmp	SHORT $L70702
$L70703:

; 471  : 	if(t > name) cgi->IdForm = strtoul(t, NULL, 10);

	mov	eax, DWORD PTR _t$[ebp]
	cmp	eax, DWORD PTR _name$[ebp]
	jbe	SHORT $L70704
	push	10					; 0000000aH
	push	0
	mov	ecx, DWORD PTR _t$[ebp]
	push	ecx
	call	_strtoul
	add	esp, 12					; 0000000cH
	mov	edx, DWORD PTR _cgi$[ebp]
	mov	DWORD PTR [edx+20], eax
$L70704:

; 472  : 	cgi->IdCtrl = strtoul(name + 1, NULL, 10);

	push	10					; 0000000aH
	push	0
	mov	eax, DWORD PTR _name$[ebp]
	add	eax, 1
	push	eax
	call	_strtoul
	add	esp, 12					; 0000000cH
	mov	ecx, DWORD PTR _cgi$[ebp]
	mov	DWORD PTR [ecx+16], eax

; 473  : 
; 474  : 	/* Parse CGI input belonging to cntxt->cgi
; 475  : 		Parsing retrieves various data necessary in first steps of processing,
; 476  : 		such as session information, encoding type for next form, clicked button ... */
; 477  : 	if(cgi >= cntxt->cgi && cgi <= cntxt->cgi + cntxt->nb_cgi - 1)

	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	eax, DWORD PTR _cgi$[ebp]
	cmp	eax, DWORD PTR [edx+29648]
	jb	$L70722
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	edx, DWORD PTR [ecx+29652]
	imul	edx, 56					; 00000038H
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	ecx, DWORD PTR [eax+29648]
	lea	edx, DWORD PTR [ecx+edx-56]
	cmp	DWORD PTR _cgi$[ebp], edx
	ja	$L70722

; 479  : 		unsigned long i = cgi - cntxt->cgi, j;

	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	ecx, DWORD PTR _cgi$[ebp]
	sub	ecx, DWORD PTR [eax+29648]
	mov	eax, ecx
	cdq
	mov	ecx, 56					; 00000038H
	idiv	ecx
	mov	DWORD PTR _i$70708[ebp], eax

; 480  : 
; 481  : 		/* Handle encoding type : multipart if previous form sent an input with TRANSMIT_FILE subfield */
; 482  : 		if(!STRCMPNUL(cgi->subfield, "TRANSMIT_FILE"))

	mov	edx, OFFSET FLAT:$SG70711
	test	edx, edx
	je	SHORT $L71821
	mov	DWORD PTR -108+[ebp], OFFSET FLAT:$SG70712
	jmp	SHORT $L71822
$L71821:
	mov	DWORD PTR -108+[ebp], OFFSET FLAT:$SG70713
$L71822:
	mov	eax, DWORD PTR _cgi$[ebp]
	cmp	DWORD PTR [eax+32], 0
	je	SHORT $L71823
	mov	ecx, DWORD PTR _cgi$[ebp]
	mov	edx, DWORD PTR [ecx+32]
	mov	DWORD PTR -112+[ebp], edx
	jmp	SHORT $L71824
$L71823:
	mov	DWORD PTR -112+[ebp], OFFSET FLAT:$SG70714
$L71824:
	mov	eax, DWORD PTR -108+[ebp]
	push	eax
	mov	ecx, DWORD PTR -112+[ebp]
	push	ecx
	call	_strcmp
	add	esp, 8
	test	eax, eax
	jne	SHORT $L70710

; 483  : 			cntxt->cgiencodemultipart = 1;

	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29668], 1
$L70710:

; 484  : 
; 485  : 		/* Handle JavaScript : detect if enabled */
; 486  : 		if(!strcmp(cgi->name, "JSINPUT"))

	push	OFFSET FLAT:$SG70716
	mov	eax, DWORD PTR _cgi$[ebp]
	mov	ecx, DWORD PTR [eax]
	push	ecx
	call	_strcmp
	add	esp, 8
	test	eax, eax
	jne	$L70715

; 488  : 			cntxt->jsenabled = 1;

	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29676], 1

; 489  : 			cntxt->imgwait = 1;

	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29672], 1

; 490  : 
; 491  : 			/* If input holds a button click : set name as button name */
; 492  : 			if(cgi->value && strchr("IBT", cgi->value[0]))

	mov	ecx, DWORD PTR _cgi$[ebp]
	cmp	DWORD PTR [ecx+8], 0
	je	$L70720
	mov	edx, DWORD PTR _cgi$[ebp]
	mov	eax, DWORD PTR [edx+8]
	movsx	ecx, BYTE PTR [eax]
	push	ecx
	push	OFFSET FLAT:$SG70718
	call	_strchr
	add	esp, 8
	test	eax, eax
	je	SHORT $L70720

; 494  : 				M_FREE(cgi->name);

	mov	edx, DWORD PTR _cgi$[ebp]
	mov	eax, DWORD PTR [edx]
	push	eax
	call	_mem_free
	add	esp, 4
	mov	ecx, DWORD PTR _cgi$[ebp]
	mov	DWORD PTR [ecx], 0

; 495  : 				cgi->name = cgi->value;

	mov	edx, DWORD PTR _cgi$[ebp]
	mov	eax, DWORD PTR _cgi$[ebp]
	mov	ecx, DWORD PTR [eax+8]
	mov	DWORD PTR [edx], ecx

; 496  : 				cgi->name_sz = cgi->value_sz;

	mov	edx, DWORD PTR _cgi$[ebp]
	mov	eax, DWORD PTR _cgi$[ebp]
	mov	ecx, DWORD PTR [eax+12]
	mov	DWORD PTR [edx+4], ecx

; 497  : 				cgi->value = NULL;

	mov	edx, DWORD PTR _cgi$[ebp]
	mov	DWORD PTR [edx+8], 0

; 498  : 				cgi->value_sz = 0;

	mov	eax, DWORD PTR _cgi$[ebp]
	mov	DWORD PTR [eax+12], 0

; 499  : 				if(cgi_parse_name(cntxt, cgi)) STACK_ERROR;

	mov	ecx, DWORD PTR _cgi$[ebp]
	push	ecx
	mov	edx, DWORD PTR _cntxt$[ebp]
	push	edx
	call	_cgi_parse_name
	add	esp, 8
	test	eax, eax
	je	SHORT $L70720
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 499		; 000001f3H
	jmp	$eva_err$70652
$L70720:

; 501  : 			RETURN_OK;

	jmp	$eva_noerr$70640
$L70715:

; 503  : 
; 504  : 		switch(cgi->name[0])
; 505  : 		{

	mov	ecx, DWORD PTR _cgi$[ebp]
	mov	edx, DWORD PTR [ecx]
	movsx	eax, BYTE PTR [edx]
	mov	DWORD PTR -116+[ebp], eax
	mov	ecx, DWORD PTR -116+[ebp]
	sub	ecx, 66					; 00000042H
	mov	DWORD PTR -116+[ebp], ecx
	cmp	DWORD PTR -116+[ebp], 18		; 00000012H
	ja	$L70722
	mov	eax, DWORD PTR -116+[ebp]
	xor	edx, edx
	mov	dl, BYTE PTR $L71831[eax]
	jmp	DWORD PTR $L71832[edx*4]
$L70725:

; 506  : 		case 'T':	/* TAB button click */
; 507  : 		case 'B':	/* BUTTON control click */
; 508  : 		case 'I':	/* control info button click */
; 509  : 			cntxt->cgibtn = i;

	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	edx, DWORD PTR _i$70708[ebp]
	mov	DWORD PTR [ecx+29656], edx

; 510  : 			break;

	jmp	$L70722
$L70726:

; 511  : 
; 512  : 		case 'S':	/* Session data */
; 513  : 			if(cgi_extract(cntxt, cgi->value, '$',
; 514  : 							&cntxt->session,
; 515  : 							&cntxt->id_form, &cntxt->id_obj,
; 516  : 							&cntxt->alt_form, &cntxt->alt_obj, NULL)) STACK_ERROR;

	push	0
	mov	eax, DWORD PTR _cntxt$[ebp]
	add	eax, 60					; 0000003cH
	push	eax
	mov	ecx, DWORD PTR _cntxt$[ebp]
	add	ecx, 40					; 00000028H
	push	ecx
	mov	edx, DWORD PTR _cntxt$[ebp]
	add	edx, 20					; 00000014H
	push	edx
	mov	eax, DWORD PTR _cntxt$[ebp]
	push	eax
	mov	ecx, DWORD PTR _cntxt$[ebp]
	add	ecx, 29300				; 00007274H
	push	ecx
	push	36					; 00000024H
	mov	edx, DWORD PTR _cgi$[ebp]
	mov	eax, DWORD PTR [edx+8]
	push	eax
	mov	ecx, DWORD PTR _cntxt$[ebp]
	push	ecx
	call	_cgi_extract
	add	esp, 36					; 00000024H
	test	eax, eax
	je	SHORT $L70728
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 516		; 00000204H
	jmp	$eva_err$70652
$L70728:

; 517  : 			break;

	jmp	$L70722
$L70729:

; 518  : 		case 'O':	/* Original input (to check for user changes) */
; 519  : 			/* Look for corresponding data input & add empty input if not found */
; 520  : 			j = i > 1 ? i - 1 : 0;

	cmp	DWORD PTR _i$70708[ebp], 1
	jbe	SHORT $L71825
	mov	eax, DWORD PTR _i$70708[ebp]
	sub	eax, 1
	mov	DWORD PTR -120+[ebp], eax
	jmp	SHORT $L71826
$L71825:
	mov	DWORD PTR -120+[ebp], 0
$L71826:
	mov	ecx, DWORD PTR -120+[ebp]
	mov	DWORD PTR _j$70709[ebp], ecx

; 521  : #define ISNOTCURVAL (cntxt->cgi[j].name[0] != 'D' || strcmp(cgi->name + 1, cntxt->cgi[j].name + 1))
; 522  : 			if(ISNOTCURVAL) for(j = 0; j < cntxt->nb_cgi && (j == i || ISNOTCURVAL); j++);

	mov	edx, DWORD PTR _j$70709[ebp]
	imul	edx, 56					; 00000038H
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	ecx, DWORD PTR [eax+29648]
	mov	edx, DWORD PTR [ecx+edx]
	movsx	eax, BYTE PTR [edx]
	cmp	eax, 68					; 00000044H
	jne	SHORT $L70732
	mov	ecx, DWORD PTR _j$70709[ebp]
	imul	ecx, 56					; 00000038H
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	eax, DWORD PTR [edx+29648]
	mov	ecx, DWORD PTR [eax+ecx]
	add	ecx, 1
	push	ecx
	mov	edx, DWORD PTR _cgi$[ebp]
	mov	eax, DWORD PTR [edx]
	add	eax, 1
	push	eax
	call	_strcmp
	add	esp, 8
	test	eax, eax
	je	SHORT $L70735
$L70732:
	mov	DWORD PTR _j$70709[ebp], 0
	jmp	SHORT $L70733
$L70734:
	mov	ecx, DWORD PTR _j$70709[ebp]
	add	ecx, 1
	mov	DWORD PTR _j$70709[ebp], ecx
$L70733:
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	eax, DWORD PTR _j$70709[ebp]
	cmp	eax, DWORD PTR [edx+29652]
	jae	SHORT $L70735
	mov	ecx, DWORD PTR _j$70709[ebp]
	cmp	ecx, DWORD PTR _i$70708[ebp]
	je	SHORT $L70737
	mov	edx, DWORD PTR _j$70709[ebp]
	imul	edx, 56					; 00000038H
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	ecx, DWORD PTR [eax+29648]
	mov	edx, DWORD PTR [ecx+edx]
	movsx	eax, BYTE PTR [edx]
	cmp	eax, 68					; 00000044H
	jne	SHORT $L70737
	mov	ecx, DWORD PTR _j$70709[ebp]
	imul	ecx, 56					; 00000038H
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	eax, DWORD PTR [edx+29648]
	mov	ecx, DWORD PTR [eax+ecx]
	add	ecx, 1
	push	ecx
	mov	edx, DWORD PTR _cgi$[ebp]
	mov	eax, DWORD PTR [edx]
	add	eax, 1
	push	eax
	call	_strcmp
	add	esp, 8
	test	eax, eax
	je	SHORT $L70735
$L70737:
	jmp	SHORT $L70734
$L70735:

; 523  : #undef ISNOTCURVAL
; 524  : 			if(j == cntxt->nb_cgi)

	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	edx, DWORD PTR _j$70709[ebp]
	cmp	edx, DWORD PTR [ecx+29652]
	jne	$L70738

; 526  : 				/* Add empty input in cntxt->cgi */
; 527  : 				M_STRDUP(name1, cgi->name, cgi->name_sz);

	mov	eax, DWORD PTR _cgi$[ebp]
	mov	ecx, DWORD PTR [eax+4]
	mov	DWORD PTR _size$70739[ebp], ecx
	mov	edx, DWORD PTR _cgi$[ebp]
	mov	eax, DWORD PTR [edx]
	mov	DWORD PTR _src$70740[ebp], eax
	mov	ecx, DWORD PTR _size$70739[ebp]
	add	ecx, 1
	mov	DWORD PTR _size1$70741[ebp], ecx
	mov	edx, DWORD PTR _size1$70741[ebp]
	push	edx
	call	_mem_alloc
	add	esp, 4
	mov	DWORD PTR _name1$[ebp], eax
	cmp	DWORD PTR _size1$70741[ebp], 0
	je	SHORT $L70742
	cmp	DWORD PTR _name1$[ebp], 0
	jne	SHORT $L70742
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29872], OFFSET FLAT:$SG70744
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 527		; 0000020fH
	jmp	$eva_err$70652
$L70742:
	cmp	DWORD PTR _src$70740[ebp], 0
	je	SHORT $L70746
	cmp	DWORD PTR _size$70739[ebp], 0
	je	SHORT $L70746
	mov	edx, DWORD PTR _size$70739[ebp]
	push	edx
	mov	eax, DWORD PTR _src$70740[ebp]
	push	eax
	mov	ecx, DWORD PTR _name1$[ebp]
	push	ecx
	call	_memcpy
	add	esp, 12					; 0000000cH
$L70746:

; 528  : 				name1[0] = 'D';

	mov	edx, DWORD PTR _name1$[ebp]
	mov	BYTE PTR [edx], 68			; 00000044H

; 529  : 				if(cgi_add_input(cntxt, &j, name1, cgi->name_sz, NULL, 0)) STACK_ERROR;

	push	0
	push	0
	mov	eax, DWORD PTR _cgi$[ebp]
	mov	ecx, DWORD PTR [eax+4]
	push	ecx
	mov	edx, DWORD PTR _name1$[ebp]
	push	edx
	lea	eax, DWORD PTR _j$70709[ebp]
	push	eax
	mov	ecx, DWORD PTR _cntxt$[ebp]
	push	ecx
	call	_cgi_add_input
	add	esp, 24					; 00000018H
	test	eax, eax
	je	SHORT $L70748
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 529		; 00000211H
	jmp	$eva_err$70652
$L70748:

; 530  : 				cgi = cntxt->cgi + i;

	mov	eax, DWORD PTR _i$70708[ebp]
	imul	eax, 56					; 00000038H
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	edx, DWORD PTR [ecx+29648]
	add	edx, eax
	mov	DWORD PTR _cgi$[ebp], edx
$L70738:

; 532  : 			cntxt->cgi[j].i_old = i;

	mov	eax, DWORD PTR _j$70709[ebp]
	imul	eax, 56					; 00000038H
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	edx, DWORD PTR [ecx+29648]
	mov	ecx, DWORD PTR _i$70708[ebp]
	mov	DWORD PTR [edx+eax+48], ecx

; 533  : 
; 534  : 			/* If value changed  */
; 535  : 			if(STRCMPNUL(cgi->value, cntxt->cgi[j].value))

	mov	edx, DWORD PTR _j$70709[ebp]
	imul	edx, 56					; 00000038H
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	ecx, DWORD PTR [eax+29648]
	cmp	DWORD PTR [ecx+edx+8], 0
	je	SHORT $L71827
	mov	edx, DWORD PTR _j$70709[ebp]
	imul	edx, 56					; 00000038H
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	ecx, DWORD PTR [eax+29648]
	mov	edx, DWORD PTR [ecx+edx+8]
	mov	DWORD PTR -124+[ebp], edx
	jmp	SHORT $L71828
$L71827:
	mov	DWORD PTR -124+[ebp], OFFSET FLAT:$SG70750
$L71828:
	mov	eax, DWORD PTR _cgi$[ebp]
	cmp	DWORD PTR [eax+8], 0
	je	SHORT $L71829
	mov	ecx, DWORD PTR _cgi$[ebp]
	mov	edx, DWORD PTR [ecx+8]
	mov	DWORD PTR -128+[ebp], edx
	jmp	SHORT $L71830
$L71829:
	mov	DWORD PTR -128+[ebp], OFFSET FLAT:$SG70751
$L71830:
	mov	eax, DWORD PTR -124+[ebp]
	push	eax
	mov	ecx, DWORD PTR -128+[ebp]
	push	ecx
	call	_strcmp
	add	esp, 8
	test	eax, eax
	je	SHORT $L70749

; 536  : 				/* Mark old value for no reoutput */
; 537  : 				cntxt->cgi[i].b_dontkeep = 1;

	mov	edx, DWORD PTR _i$70708[ebp]
	imul	edx, 56					; 00000038H
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	ecx, DWORD PTR [eax+29648]
	mov	DWORD PTR [ecx+edx+52], 1
$L70749:
$L70722:
$eva_noerr$70640:

; 540  : 
; 541  : 	RETURN_OK_CLEANUP;

	push	0
	push	OFFSET FLAT:$SG70752
	push	OFFSET FLAT:$SG70753
	mov	edx, DWORD PTR _cntxt$[ebp]
	push	edx
	call	_err_clear
	add	esp, 16					; 00000010H
$eva_err$70652:
	mov	eax, DWORD PTR _cntxt$[ebp]
	cmp	DWORD PTR [eax+29872], 0
	je	SHORT $L70754
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	edx, DWORD PTR [ecx+29900]
	push	edx
	push	OFFSET FLAT:$SG70755
	push	OFFSET FLAT:$SG70756
	mov	eax, DWORD PTR _cntxt$[ebp]
	push	eax
	call	_err_add_context
	add	esp, 16					; 00000010H
$L70754:
	mov	ecx, DWORD PTR _name$[ebp]
	push	ecx
	call	_mem_free
	add	esp, 4
	mov	DWORD PTR _name$[ebp], 0
	mov	edx, DWORD PTR _name1$[ebp]
	push	edx
	call	_mem_free
	add	esp, 4
	mov	DWORD PTR _name1$[ebp], 0
	mov	eax, DWORD PTR _cntxt$[ebp]
	xor	ecx, ecx
	cmp	DWORD PTR [eax+29872], 0
	setne	cl
	mov	eax, ecx

; 542  : }

	mov	esp, ebp
	pop	ebp
	ret	0
$L71832:
	DD	$L70725
	DD	$L70729
	DD	$L70726
	DD	$L70722
$L71831:
	DB	0
	DB	3
	DB	3
	DB	3
	DB	3
	DB	3
	DB	3
	DB	0
	DB	3
	DB	3
	DB	3
	DB	3
	DB	3
	DB	1
	DB	3
	DB	3
	DB	3
	DB	2
	DB	0
_cgi_parse_name ENDP
_TEXT	ENDS
PUBLIC	_cgi_to_cell
_BSS	SEGMENT
	ALIGN	4

_?cell@?1??cgi_to_cell@@9@9 DB 040H DUP (?)
_BSS	ENDS
_TEXT	SEGMENT
_cgi$ = 8
_i$ = 12
_cgi_to_cell PROC NEAR

; 553  : ){

	push	ebp
	mov	ebp, esp

; 554  : 	static DynTableCell cell;
; 555  : 	memset(&cell, 0, sizeof(cell));

	push	64					; 00000040H
	push	0
	push	OFFSET FLAT:_?cell@?1??cgi_to_cell@@9@9
	call	_memset
	add	esp, 12					; 0000000cH

; 556  : 	cell.txt = cgi->value;

	mov	eax, DWORD PTR _cgi$[ebp]
	mov	ecx, DWORD PTR [eax+8]
	mov	DWORD PTR _?cell@?1??cgi_to_cell@@9@9, ecx

; 557  : 	cell.len = cgi->value_sz;

	mov	edx, DWORD PTR _cgi$[ebp]
	mov	eax, DWORD PTR [edx+12]
	mov	DWORD PTR _?cell@?1??cgi_to_cell@@9@9+4, eax

; 558  : 	cell.b_dontfreetxt = 1;

	mov	BYTE PTR _?cell@?1??cgi_to_cell@@9@9+14, 1

; 559  : 	cell.field = cgi->field;

	mov	ecx, DWORD PTR _cgi$[ebp]
	mov	edx, DWORD PTR [ecx+28]
	mov	DWORD PTR _?cell@?1??cgi_to_cell@@9@9+8, edx

; 560  : 	cell.b_dontfreefield = 1;

	mov	BYTE PTR _?cell@?1??cgi_to_cell@@9@9+15, 1

; 561  : 	cell.IdObj = cgi->IdObj;

	mov	eax, DWORD PTR _cgi$[ebp]
	mov	ecx, DWORD PTR [eax+24]
	mov	DWORD PTR _?cell@?1??cgi_to_cell@@9@9+20, ecx

; 562  : 	cell.Num = cgi->Num;

	mov	edx, DWORD PTR _cgi$[ebp]
	mov	eax, DWORD PTR [edx+36]
	mov	DWORD PTR _?cell@?1??cgi_to_cell@@9@9+36, eax

; 563  : 	cell.Line = cgi->Line;

	mov	ecx, DWORD PTR _cgi$[ebp]
	mov	edx, DWORD PTR [ecx+40]
	mov	DWORD PTR _?cell@?1??cgi_to_cell@@9@9+40, edx

; 564  : 	cell.Lang = cgi->Lang;

	mov	eax, DWORD PTR _cgi$[ebp]
	mov	ecx, DWORD PTR [eax+44]
	mov	DWORD PTR _?cell@?1??cgi_to_cell@@9@9+44, ecx

; 565  : 	cell.i_cgi = i;

	mov	edx, DWORD PTR _i$[ebp]
	mov	DWORD PTR _?cell@?1??cgi_to_cell@@9@9+48, edx

; 566  : 	return &cell;

	mov	eax, OFFSET FLAT:_?cell@?1??cgi_to_cell@@9@9

; 567  : }

	pop	ebp
	ret	0
_cgi_to_cell ENDP
_TEXT	ENDS
PUBLIC	_cgi_get_values
PUBLIC	_cgi_filter_values
EXTRN	_dyntab_set:NEAR
_DATA	SEGMENT
	ORG $+1
$SG70788 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70794 DB	'D:\Travail\ABI\EVA\V4.0\CGI\Brunix-2016\cgi_utils.c', 00H
$SG70795 DB	'cgi_get_values', 00H
	ORG $+1
$SG70797 DB	'D:\Travail\ABI\EVA\V4.0\CGI\Brunix-2016\cgi_utils.c', 00H
$SG70798 DB	'cgi_get_values', 00H
_DATA	ENDS
_TEXT	SEGMENT
_cntxt$ = 8
_ret$ = 12
_name$ = 16
_mode$ = 20
_cgi$ = -56
_i$70782 = -60
_cgi_get_values PROC NEAR

; 586  : {

	push	ebp
	mov	ebp, esp
	sub	esp, 76					; 0000004cH
	push	edi

; 587  : 	CGIData cgi = {0};

	mov	DWORD PTR _cgi$[ebp], 0
	mov	ecx, 13					; 0000000dH
	xor	eax, eax
	lea	edi, DWORD PTR _cgi$[ebp+4]
	rep stosd

; 588  : 
; 589  : 	/* Initialize search */
; 590  : 	if(!cntxt->nb_cgi || !ret || !name || !*name) RETURN_OK;

	mov	eax, DWORD PTR _cntxt$[ebp]
	cmp	DWORD PTR [eax+29652], 0
	je	SHORT $L70779
	cmp	DWORD PTR _ret$[ebp], 0
	je	SHORT $L70779
	cmp	DWORD PTR _name$[ebp], 0
	je	SHORT $L70779
	mov	ecx, DWORD PTR _name$[ebp]
	movsx	edx, BYTE PTR [ecx]
	test	edx, edx
	jne	SHORT $L70778
$L70779:
	jmp	$eva_noerr$70780
$L70778:

; 591  : 
; 592  : 	/* If exact match mode : loop on cgi data */
; 593  : 	if(mode == 0)

	cmp	DWORD PTR _mode$[ebp], 0
	jne	$L70785

; 595  : 		unsigned long i;
; 596  : 		dyntab_free(ret);

	mov	eax, DWORD PTR _ret$[ebp]
	push	eax
	call	_dyntab_free
	add	esp, 4

; 597  : 		for(i = 0; i < cntxt->nb_cgi; i++)

	mov	DWORD PTR _i$70782[ebp], 0
	jmp	SHORT $L70783
$L70784:
	mov	ecx, DWORD PTR _i$70782[ebp]
	add	ecx, 1
	mov	DWORD PTR _i$70782[ebp], ecx
$L70783:
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	eax, DWORD PTR _i$70782[ebp]
	cmp	eax, DWORD PTR [edx+29652]
	jae	SHORT $L70785

; 598  : 			if(!strcmp(cntxt->cgi[i].name, name) &&
; 599  : 				dyntab_set(ret, ret->nbrows, 0, cgi_to_cell(cntxt->cgi + i, i)))

	mov	ecx, DWORD PTR _name$[ebp]
	push	ecx
	mov	edx, DWORD PTR _i$70782[ebp]
	imul	edx, 56					; 00000038H
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	ecx, DWORD PTR [eax+29648]
	mov	edx, DWORD PTR [ecx+edx]
	push	edx
	call	_strcmp
	add	esp, 8
	test	eax, eax
	jne	SHORT $L70786
	mov	eax, DWORD PTR _i$70782[ebp]
	push	eax
	mov	ecx, DWORD PTR _i$70782[ebp]
	imul	ecx, 56					; 00000038H
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	eax, DWORD PTR [edx+29648]
	add	eax, ecx
	push	eax
	call	_cgi_to_cell
	add	esp, 8
	push	eax
	push	0
	mov	ecx, DWORD PTR _ret$[ebp]
	mov	edx, DWORD PTR [ecx]
	push	edx
	mov	eax, DWORD PTR _ret$[ebp]
	push	eax
	call	_dyntab_set
	add	esp, 16					; 00000010H
	test	eax, eax
	je	SHORT $L70786

; 600  : 				RETURN_ERR_MEMORY;

	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29872], OFFSET FLAT:$SG70788
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 600		; 00000258H
	jmp	$eva_err$70789
$L70786:
	jmp	$L70784
$L70785:

; 602  : 
; 603  : 	/* Parse given CGI name & search depending on mode */
; 604  : 	cgi.name = name;

	mov	eax, DWORD PTR _name$[ebp]
	mov	DWORD PTR _cgi$[ebp], eax

; 605  : 	cgi.name_sz = strlen(name);

	mov	ecx, DWORD PTR _name$[ebp]
	push	ecx
	call	_strlen
	add	esp, 4
	mov	DWORD PTR _cgi$[ebp+4], eax

; 606  : 	if(cgi_parse_name(cntxt, &cgi) ||
; 607  : 		mode == 4 ? cgi_filter_values(cntxt, ret, cgi.name[0], cgi.IdCtrl, cgi.IdForm, cgi.IdObj, cgi.field, cgi.subfield, 0, 0) :
; 608  : 		mode == 1 ? cgi_filter_values(cntxt, ret, cgi.name[0], ~0UL, cgi.IdForm, cgi.IdObj, cgi.field, NULL, 0, 0) :
; 609  : 		mode == 2 ? cgi_filter_values(cntxt, ret, cgi.name[0], ~0UL, ~0UL, cgi.IdObj, cgi.field, NULL, 0, 0) :
; 610  : 		mode == 3 ? cgi_filter_values(cntxt, ret, cgi.name[0], ~0UL, ~0UL, ~0UL, cgi.field, NULL, 0, 0) : 0
; 611  : 		) STACK_ERROR;

	lea	edx, DWORD PTR _cgi$[ebp]
	push	edx
	mov	eax, DWORD PTR _cntxt$[ebp]
	push	eax
	call	_cgi_parse_name
	add	esp, 8
	test	eax, eax
	jne	$L71835
	cmp	DWORD PTR _mode$[ebp], 4
	je	$L71835
	cmp	DWORD PTR _mode$[ebp], 1
	jne	SHORT $L71840
	push	0
	push	0
	push	0
	mov	ecx, DWORD PTR _cgi$[ebp+28]
	push	ecx
	mov	edx, DWORD PTR _cgi$[ebp+24]
	push	edx
	mov	eax, DWORD PTR _cgi$[ebp+20]
	push	eax
	push	-1
	mov	ecx, DWORD PTR _cgi$[ebp]
	mov	dl, BYTE PTR [ecx]
	push	edx
	mov	eax, DWORD PTR _ret$[ebp]
	push	eax
	mov	ecx, DWORD PTR _cntxt$[ebp]
	push	ecx
	call	_cgi_filter_values
	add	esp, 40					; 00000028H
	mov	DWORD PTR -64+[ebp], eax
	jmp	SHORT $L71841
$L71840:
	cmp	DWORD PTR _mode$[ebp], 2
	jne	SHORT $L71838
	push	0
	push	0
	push	0
	mov	edx, DWORD PTR _cgi$[ebp+28]
	push	edx
	mov	eax, DWORD PTR _cgi$[ebp+24]
	push	eax
	push	-1
	push	-1
	mov	ecx, DWORD PTR _cgi$[ebp]
	mov	dl, BYTE PTR [ecx]
	push	edx
	mov	eax, DWORD PTR _ret$[ebp]
	push	eax
	mov	ecx, DWORD PTR _cntxt$[ebp]
	push	ecx
	call	_cgi_filter_values
	add	esp, 40					; 00000028H
	mov	DWORD PTR -68+[ebp], eax
	jmp	SHORT $L71839
$L71838:
	cmp	DWORD PTR _mode$[ebp], 3
	jne	SHORT $L71836
	push	0
	push	0
	push	0
	mov	edx, DWORD PTR _cgi$[ebp+28]
	push	edx
	push	-1
	push	-1
	push	-1
	mov	eax, DWORD PTR _cgi$[ebp]
	mov	cl, BYTE PTR [eax]
	push	ecx
	mov	edx, DWORD PTR _ret$[ebp]
	push	edx
	mov	eax, DWORD PTR _cntxt$[ebp]
	push	eax
	call	_cgi_filter_values
	add	esp, 40					; 00000028H
	mov	DWORD PTR -72+[ebp], eax
	jmp	SHORT $L71837
$L71836:
	mov	DWORD PTR -72+[ebp], 0
$L71837:
	mov	ecx, DWORD PTR -72+[ebp]
	mov	DWORD PTR -68+[ebp], ecx
$L71839:
	mov	edx, DWORD PTR -68+[ebp]
	mov	DWORD PTR -64+[ebp], edx
$L71841:
	mov	eax, DWORD PTR -64+[ebp]
	mov	DWORD PTR -76+[ebp], eax
	jmp	SHORT $L71842
$L71835:
	push	0
	push	0
	mov	ecx, DWORD PTR _cgi$[ebp+32]
	push	ecx
	mov	edx, DWORD PTR _cgi$[ebp+28]
	push	edx
	mov	eax, DWORD PTR _cgi$[ebp+24]
	push	eax
	mov	ecx, DWORD PTR _cgi$[ebp+20]
	push	ecx
	mov	edx, DWORD PTR _cgi$[ebp+16]
	push	edx
	mov	eax, DWORD PTR _cgi$[ebp]
	mov	cl, BYTE PTR [eax]
	push	ecx
	mov	edx, DWORD PTR _ret$[ebp]
	push	edx
	mov	eax, DWORD PTR _cntxt$[ebp]
	push	eax
	call	_cgi_filter_values
	add	esp, 40					; 00000028H
	mov	DWORD PTR -76+[ebp], eax
$L71842:
	cmp	DWORD PTR -76+[ebp], 0
	je	SHORT $eva_noerr$70780
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 611		; 00000263H
	jmp	SHORT $eva_err$70789
$eva_noerr$70780:

; 612  : 
; 613  : 	RETURN_OK_CLEANUP;

	push	0
	push	OFFSET FLAT:$SG70794
	push	OFFSET FLAT:$SG70795
	mov	edx, DWORD PTR _cntxt$[ebp]
	push	edx
	call	_err_clear
	add	esp, 16					; 00000010H
$eva_err$70789:
	mov	eax, DWORD PTR _cntxt$[ebp]
	cmp	DWORD PTR [eax+29872], 0
	je	SHORT $L70796
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	edx, DWORD PTR [ecx+29900]
	push	edx
	push	OFFSET FLAT:$SG70797
	push	OFFSET FLAT:$SG70798
	mov	eax, DWORD PTR _cntxt$[ebp]
	push	eax
	call	_err_add_context
	add	esp, 16					; 00000010H
$L70796:
	mov	ecx, DWORD PTR _cntxt$[ebp]
	xor	eax, eax
	cmp	DWORD PTR [ecx+29872], 0
	setne	al

; 614  : }

	pop	edi
	mov	esp, ebp
	pop	ebp
	ret	0
_cgi_get_values ENDP
_TEXT	ENDS
_BSS	SEGMENT
$SG70836 DB	01H DUP (?)
	ALIGN	4

$SG70837 DB	01H DUP (?)
	ALIGN	4

$SG70839 DB	01H DUP (?)
	ALIGN	4

$SG70840 DB	01H DUP (?)
_BSS	ENDS
_DATA	SEGMENT
	ORG $+1
$SG70845 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70847 DB	'D:\Travail\ABI\EVA\V4.0\CGI\Brunix-2016\cgi_utils.c', 00H
$SG70848 DB	'cgi_filter_values', 00H
	ORG $+2
$SG70850 DB	'D:\Travail\ABI\EVA\V4.0\CGI\Brunix-2016\cgi_utils.c', 00H
$SG70851 DB	'cgi_filter_values', 00H
_DATA	ENDS
_TEXT	SEGMENT
_cntxt$ = 8
_ret$ = 12
_type$ = 16
_IdCtrl$ = 20
_IdForm$ = 24
_IdObj$ = 28
_field$ = 32
_subfield$ = 36
_Num$ = 40
_Line$ = 44
_i$ = -4
_cgi$70829 = -8
_cgi_filter_values PROC NEAR

; 635  : ){

	push	ebp
	mov	ebp, esp
	sub	esp, 24					; 00000018H

; 636  : 	unsigned long i;
; 637  : 
; 638  : 	/* Initialize search */
; 639  : 	if(!ret) RETURN_OK;

	cmp	DWORD PTR _ret$[ebp], 0
	jne	SHORT $L70824
	jmp	$eva_noerr$70825
$L70824:

; 640  : 	dyntab_free(ret);

	mov	eax, DWORD PTR _ret$[ebp]
	push	eax
	call	_dyntab_free
	add	esp, 4

; 641  : 
; 642  : 	/* Search in cgi values */
; 643  : 	for(i = 0; i < cntxt->nb_cgi; i++)

	mov	DWORD PTR _i$[ebp], 0
	jmp	SHORT $L70826
$L70827:
	mov	ecx, DWORD PTR _i$[ebp]
	add	ecx, 1
	mov	DWORD PTR _i$[ebp], ecx
$L70826:
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	eax, DWORD PTR _i$[ebp]
	cmp	eax, DWORD PTR [edx+29652]
	jae	$eva_noerr$70825

; 645  : 		CGIData *cgi = cntxt->cgi + i;

	mov	ecx, DWORD PTR _i$[ebp]
	imul	ecx, 56					; 00000038H
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	eax, DWORD PTR [edx+29648]
	add	eax, ecx
	mov	DWORD PTR _cgi$70829[ebp], eax

; 646  : 		if(	cgi->name[0] &&
; 647  : 			(!type || type == cgi->name[0]) &&
; 648  : 			(IdCtrl == ~0UL || IdCtrl == cgi->IdCtrl) &&
; 649  : 			(IdForm == ~0UL || IdForm == cgi->IdForm) &&
; 650  : 			(IdObj == ~0UL || IdObj == cgi->IdObj) &&
; 651  : 			(!field || !STRCMPNUL(field, cgi->field)) &&
; 652  : 			(!subfield || !STRCMPNUL(subfield, cgi->subfield)) &&
; 653  : 			(!Num || Num == cgi->Num) &&
; 654  : 			(!Line || Line == cgi->Line)
; 655  : 			)

	mov	ecx, DWORD PTR _cgi$70829[ebp]
	mov	edx, DWORD PTR [ecx]
	movsx	eax, BYTE PTR [edx]
	test	eax, eax
	je	$L70843
	movsx	ecx, BYTE PTR _type$[ebp]
	test	ecx, ecx
	je	SHORT $L70831
	movsx	edx, BYTE PTR _type$[ebp]
	mov	eax, DWORD PTR _cgi$70829[ebp]
	mov	ecx, DWORD PTR [eax]
	movsx	eax, BYTE PTR [ecx]
	cmp	edx, eax
	jne	$L70843
$L70831:
	cmp	DWORD PTR _IdCtrl$[ebp], -1
	je	SHORT $L70832
	mov	ecx, DWORD PTR _cgi$70829[ebp]
	mov	edx, DWORD PTR _IdCtrl$[ebp]
	cmp	edx, DWORD PTR [ecx+16]
	jne	$L70843
$L70832:
	cmp	DWORD PTR _IdForm$[ebp], -1
	je	SHORT $L70833
	mov	eax, DWORD PTR _cgi$70829[ebp]
	mov	ecx, DWORD PTR _IdForm$[ebp]
	cmp	ecx, DWORD PTR [eax+20]
	jne	$L70843
$L70833:
	cmp	DWORD PTR _IdObj$[ebp], -1
	je	SHORT $L70834
	mov	edx, DWORD PTR _cgi$70829[ebp]
	mov	eax, DWORD PTR _IdObj$[ebp]
	cmp	eax, DWORD PTR [edx+24]
	jne	$L70843
$L70834:
	cmp	DWORD PTR _field$[ebp], 0
	je	SHORT $L70835
	mov	ecx, DWORD PTR _cgi$70829[ebp]
	cmp	DWORD PTR [ecx+28], 0
	je	SHORT $L71844
	mov	edx, DWORD PTR _cgi$70829[ebp]
	mov	eax, DWORD PTR [edx+28]
	mov	DWORD PTR -12+[ebp], eax
	jmp	SHORT $L71845
$L71844:
	mov	DWORD PTR -12+[ebp], OFFSET FLAT:$SG70836
$L71845:
	cmp	DWORD PTR _field$[ebp], 0
	je	SHORT $L71846
	mov	ecx, DWORD PTR _field$[ebp]
	mov	DWORD PTR -16+[ebp], ecx
	jmp	SHORT $L71847
$L71846:
	mov	DWORD PTR -16+[ebp], OFFSET FLAT:$SG70837
$L71847:
	mov	edx, DWORD PTR -12+[ebp]
	push	edx
	mov	eax, DWORD PTR -16+[ebp]
	push	eax
	call	_strcmp
	add	esp, 8
	test	eax, eax
	jne	$L70843
$L70835:
	cmp	DWORD PTR _subfield$[ebp], 0
	je	SHORT $L70838
	mov	ecx, DWORD PTR _cgi$70829[ebp]
	cmp	DWORD PTR [ecx+32], 0
	je	SHORT $L71848
	mov	edx, DWORD PTR _cgi$70829[ebp]
	mov	eax, DWORD PTR [edx+32]
	mov	DWORD PTR -20+[ebp], eax
	jmp	SHORT $L71849
$L71848:
	mov	DWORD PTR -20+[ebp], OFFSET FLAT:$SG70839
$L71849:
	cmp	DWORD PTR _subfield$[ebp], 0
	je	SHORT $L71850
	mov	ecx, DWORD PTR _subfield$[ebp]
	mov	DWORD PTR -24+[ebp], ecx
	jmp	SHORT $L71851
$L71850:
	mov	DWORD PTR -24+[ebp], OFFSET FLAT:$SG70840
$L71851:
	mov	edx, DWORD PTR -20+[ebp]
	push	edx
	mov	eax, DWORD PTR -24+[ebp]
	push	eax
	call	_strcmp
	add	esp, 8
	test	eax, eax
	jne	SHORT $L70843
$L70838:
	cmp	DWORD PTR _Num$[ebp], 0
	je	SHORT $L70841
	mov	ecx, DWORD PTR _cgi$70829[ebp]
	mov	edx, DWORD PTR _Num$[ebp]
	cmp	edx, DWORD PTR [ecx+36]
	jne	SHORT $L70843
$L70841:
	cmp	DWORD PTR _Line$[ebp], 0
	je	SHORT $L70842
	mov	eax, DWORD PTR _cgi$70829[ebp]
	mov	ecx, DWORD PTR _Line$[ebp]
	cmp	ecx, DWORD PTR [eax+40]
	jne	SHORT $L70843
$L70842:

; 657  : 			/* Store value, value number, object id, form id, CGI index */
; 658  : 			if(dyntab_set(ret, ret->nbrows, 0, cgi_to_cell(cgi, i))) RETURN_ERR_MEMORY;

	mov	edx, DWORD PTR _i$[ebp]
	push	edx
	mov	eax, DWORD PTR _cgi$70829[ebp]
	push	eax
	call	_cgi_to_cell
	add	esp, 8
	push	eax
	push	0
	mov	ecx, DWORD PTR _ret$[ebp]
	mov	edx, DWORD PTR [ecx]
	push	edx
	mov	eax, DWORD PTR _ret$[ebp]
	push	eax
	call	_dyntab_set
	add	esp, 16					; 00000010H
	test	eax, eax
	je	SHORT $L70843
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29872], OFFSET FLAT:$SG70845
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 658		; 00000292H
	jmp	SHORT $eva_err$70846
$L70843:

; 660  : 	}

	jmp	$L70827
$eva_noerr$70825:

; 661  : 
; 662  : 	RETURN_OK_CLEANUP;

	push	0
	push	OFFSET FLAT:$SG70847
	push	OFFSET FLAT:$SG70848
	mov	eax, DWORD PTR _cntxt$[ebp]
	push	eax
	call	_err_clear
	add	esp, 16					; 00000010H
$eva_err$70846:
	mov	ecx, DWORD PTR _cntxt$[ebp]
	cmp	DWORD PTR [ecx+29872], 0
	je	SHORT $L70849
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	eax, DWORD PTR [edx+29900]
	push	eax
	push	OFFSET FLAT:$SG70850
	push	OFFSET FLAT:$SG70851
	mov	ecx, DWORD PTR _cntxt$[ebp]
	push	ecx
	call	_err_add_context
	add	esp, 16					; 00000010H
$L70849:
	mov	edx, DWORD PTR _cntxt$[ebp]
	xor	eax, eax
	cmp	DWORD PTR [edx+29872], 0
	setne	al

; 663  : }

	mov	esp, ebp
	pop	ebp
	ret	0
_cgi_filter_values ENDP
_TEXT	ENDS
PUBLIC	_cgi_check_form_change
_TEXT	SEGMENT
_cntxt$ = 8
_idform$ = 12
_idobj$ = 16
_i$ = -4
_cgi$70868 = -8
_cgi_check_form_change PROC NEAR

; 677  : ){

	push	ebp
	mov	ebp, esp
	sub	esp, 8

; 678  : 	unsigned long i;
; 679  : 
; 680  : 	if(idform == DYNTAB_TOUL(&cntxt->menubar) || idform == DYNTAB_TOUL(&cntxt->homepage))

	push	10					; 0000000aH
	push	0
	push	0
	push	0
	mov	eax, DWORD PTR _cntxt$[ebp]
	add	eax, 29528				; 00007358H
	push	eax
	call	_dyntab_val
	add	esp, 12					; 0000000cH
	push	eax
	call	_strtoul
	add	esp, 12					; 0000000cH
	cmp	DWORD PTR _idform$[ebp], eax
	je	SHORT $L70864
	push	10					; 0000000aH
	push	0
	push	0
	push	0
	mov	ecx, DWORD PTR _cntxt$[ebp]
	add	ecx, 29548				; 0000736cH
	push	ecx
	call	_dyntab_val
	add	esp, 12					; 0000000cH
	push	eax
	call	_strtoul
	add	esp, 12					; 0000000cH
	cmp	DWORD PTR _idform$[ebp], eax
	jne	SHORT $L70863
$L70864:

; 681  : 		return 2;

	mov	eax, 2
	jmp	SHORT $L70859
$L70863:

; 682  : 
; 683  : 	/* Search form & return its modified status */
; 684  : 	for(i = 0; i < cntxt->nb_cgi; i++)

	mov	DWORD PTR _i$[ebp], 0
	jmp	SHORT $L70865
$L70866:
	mov	edx, DWORD PTR _i$[ebp]
	add	edx, 1
	mov	DWORD PTR _i$[ebp], edx
$L70865:
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	ecx, DWORD PTR _i$[ebp]
	cmp	ecx, DWORD PTR [eax+29652]
	jae	SHORT $L70867

; 686  : 		CGIData *cgi = cntxt->cgi + i;

	mov	edx, DWORD PTR _i$[ebp]
	imul	edx, 56					; 00000038H
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	ecx, DWORD PTR [eax+29648]
	add	ecx, edx
	mov	DWORD PTR _cgi$70868[ebp], ecx

; 687  : 		if(cgi->name[0] == 'F' && idobj == cgi->IdObj && idform == cgi->IdForm)

	mov	edx, DWORD PTR _cgi$70868[ebp]
	mov	eax, DWORD PTR [edx]
	movsx	ecx, BYTE PTR [eax]
	cmp	ecx, 70					; 00000046H
	jne	SHORT $L70869
	mov	edx, DWORD PTR _cgi$70868[ebp]
	mov	eax, DWORD PTR _idobj$[ebp]
	cmp	eax, DWORD PTR [edx+24]
	jne	SHORT $L70869
	mov	ecx, DWORD PTR _cgi$70868[ebp]
	mov	edx, DWORD PTR _idform$[ebp]
	cmp	edx, DWORD PTR [ecx+20]
	jne	SHORT $L70869

; 688  : 			return cgi->value[cgi->value_sz - 1] == '1';

	mov	eax, DWORD PTR _cgi$70868[ebp]
	mov	ecx, DWORD PTR [eax+12]
	mov	edx, DWORD PTR _cgi$70868[ebp]
	mov	eax, DWORD PTR [edx+8]
	movsx	ecx, BYTE PTR [eax+ecx-1]
	xor	eax, eax
	cmp	ecx, 49					; 00000031H
	sete	al
	jmp	SHORT $L70859
$L70869:

; 689  : 	}

	jmp	SHORT $L70866
$L70867:

; 690  : 
; 691  : 	return 0;

	xor	eax, eax
$L70859:

; 692  : }

	mov	esp, ebp
	pop	ebp
	ret	0
_cgi_check_form_change ENDP
_TEXT	ENDS
PUBLIC	_cgi_clear_form_inputs
_DATA	SEGMENT
	ORG $+2
$SG70887 DB	'DO', 00H
	ORG $+1
$SG70888 DB	'_EVA_SELTAB', 00H
_DATA	ENDS
_TEXT	SEGMENT
_cntxt$ = 8
_idform$ = 12
_idobj$ = 16
_b_keepstatus$ = 20
_i$ = -4
_cgi$70883 = -8
_cgi_clear_form_inputs PROC NEAR

; 704  : {

	push	ebp
	mov	ebp, esp
	sub	esp, 8

; 705  : 	unsigned long i;
; 706  : 
; 707  : 	/* Search in cgi values */
; 708  : 	for(i = 0; i < cntxt->nb_cgi; i++)

	mov	DWORD PTR _i$[ebp], 0
	jmp	SHORT $L70880
$L70881:
	mov	eax, DWORD PTR _i$[ebp]
	add	eax, 1
	mov	DWORD PTR _i$[ebp], eax
$L70880:
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	edx, DWORD PTR _i$[ebp]
	cmp	edx, DWORD PTR [ecx+29652]
	jae	$L70882

; 710  : 		CGIData *cgi = cntxt->cgi + i;

	mov	eax, DWORD PTR _i$[ebp]
	imul	eax, 56					; 00000038H
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	edx, DWORD PTR [ecx+29648]
	add	edx, eax
	mov	DWORD PTR _cgi$70883[ebp], edx

; 711  : 		if(idobj == cgi->IdObj && idform  == cgi->IdForm)

	mov	eax, DWORD PTR _cgi$70883[ebp]
	mov	ecx, DWORD PTR _idobj$[ebp]
	cmp	ecx, DWORD PTR [eax+24]
	jne	SHORT $L70884
	mov	edx, DWORD PTR _cgi$70883[ebp]
	mov	eax, DWORD PTR _idform$[ebp]
	cmp	eax, DWORD PTR [edx+20]
	jne	SHORT $L70884

; 713  : 			if(!b_keepstatus || (strchr("DO", cgi->name[0]) && !cgi->subfield && strcmp(cgi->field, "_EVA_SELTAB")))

	cmp	DWORD PTR _b_keepstatus$[ebp], 0
	je	SHORT $L70886
	mov	ecx, DWORD PTR _cgi$70883[ebp]
	mov	edx, DWORD PTR [ecx]
	movsx	eax, BYTE PTR [edx]
	push	eax
	push	OFFSET FLAT:$SG70887
	call	_strchr
	add	esp, 8
	test	eax, eax
	je	SHORT $L70885
	mov	ecx, DWORD PTR _cgi$70883[ebp]
	cmp	DWORD PTR [ecx+32], 0
	jne	SHORT $L70885
	push	OFFSET FLAT:$SG70888
	mov	edx, DWORD PTR _cgi$70883[ebp]
	mov	eax, DWORD PTR [edx+28]
	push	eax
	call	_strcmp
	add	esp, 8
	test	eax, eax
	je	SHORT $L70885
$L70886:

; 715  : 				cgi->name[0] = 0;

	mov	ecx, DWORD PTR _cgi$70883[ebp]
	mov	edx, DWORD PTR [ecx]
	mov	BYTE PTR [edx], 0

; 716  : 				cgi->name_sz = 0;

	mov	eax, DWORD PTR _cgi$70883[ebp]
	mov	DWORD PTR [eax+4], 0
$L70885:

; 718  : 			cgi->b_dontkeep = 1;

	mov	ecx, DWORD PTR _cgi$70883[ebp]
	mov	DWORD PTR [ecx+52], 1
$L70884:

; 720  : 	}

	jmp	$L70881
$L70882:

; 721  : }

	mov	esp, ebp
	pop	ebp
	ret	0
_cgi_clear_form_inputs ENDP
_TEXT	ENDS
PUBLIC	_cginame_setkeep
PUBLIC	_cgi_setkeep
_TEXT	SEGMENT
_cntxt$ = 8
_name$ = 12
_b_dontkeep$ = 16
_i$ = -4
_cginame_setkeep PROC NEAR

; 734  : ){

	push	ebp
	mov	ebp, esp
	push	ecx

; 735  : 	unsigned long i;
; 736  : 	if(!name || !*name) return;

	cmp	DWORD PTR _name$[ebp], 0
	je	SHORT $L70898
	mov	eax, DWORD PTR _name$[ebp]
	movsx	ecx, BYTE PTR [eax]
	test	ecx, ecx
	jne	SHORT $L70897
$L70898:
	jmp	SHORT $L70901
$L70897:

; 737  : 	for(i = 0; i < cntxt->nb_cgi; i++)

	mov	DWORD PTR _i$[ebp], 0
	jmp	SHORT $L70899
$L70900:
	mov	edx, DWORD PTR _i$[ebp]
	add	edx, 1
	mov	DWORD PTR _i$[ebp], edx
$L70899:
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	ecx, DWORD PTR _i$[ebp]
	cmp	ecx, DWORD PTR [eax+29652]
	jae	SHORT $L70901

; 738  : 		if(!strcmp(cntxt->cgi[i].name, name))

	mov	edx, DWORD PTR _name$[ebp]
	push	edx
	mov	eax, DWORD PTR _i$[ebp]
	imul	eax, 56					; 00000038H
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	edx, DWORD PTR [ecx+29648]
	mov	eax, DWORD PTR [edx+eax]
	push	eax
	call	_strcmp
	add	esp, 8
	test	eax, eax
	jne	SHORT $L70902

; 739  : 			cgi_setkeep(cntxt, i, b_dontkeep);

	mov	ecx, DWORD PTR _b_dontkeep$[ebp]
	push	ecx
	mov	edx, DWORD PTR _i$[ebp]
	push	edx
	mov	eax, DWORD PTR _cntxt$[ebp]
	push	eax
	call	_cgi_setkeep
	add	esp, 12					; 0000000cH
$L70902:

; 740  : }

	jmp	SHORT $L70900
$L70901:
	mov	esp, ebp
	pop	ebp
	ret	0
_cginame_setkeep ENDP
_cntxt$ = 8
_i$ = 12
_b_dontkeep$ = 16
_cgi$ = -4
_cgi_setkeep PROC NEAR

; 753  : ){

	push	ebp
	mov	ebp, esp
	push	ecx

; 754  : 	CGIData *cgi = cntxt->cgi + i;

	mov	eax, DWORD PTR _i$[ebp]
	imul	eax, 56					; 00000038H
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	edx, DWORD PTR [ecx+29648]
	add	edx, eax
	mov	DWORD PTR _cgi$[ebp], edx

; 755  : 	if(b_dontkeep < 2) cgi->b_dontkeep = b_dontkeep;

	cmp	DWORD PTR _b_dontkeep$[ebp], 2
	jge	SHORT $L70911
	mov	eax, DWORD PTR _cgi$[ebp]
	mov	ecx, DWORD PTR _b_dontkeep$[ebp]
	mov	DWORD PTR [eax+52], ecx

; 756  : 	else

	jmp	SHORT $L70912
$L70911:

; 758  : 		cgi->name[0] = 0;

	mov	edx, DWORD PTR _cgi$[ebp]
	mov	eax, DWORD PTR [edx]
	mov	BYTE PTR [eax], 0

; 759  : 		cgi->name_sz = 0;

	mov	ecx, DWORD PTR _cgi$[ebp]
	mov	DWORD PTR [ecx+4], 0
$L70912:

; 762  : 	if(b_dontkeep && cgi->i_old)

	cmp	DWORD PTR _b_dontkeep$[ebp], 0
	je	SHORT $L70915
	mov	edx, DWORD PTR _cgi$[ebp]
	cmp	DWORD PTR [edx+48], 0
	je	SHORT $L70915

; 764  : 		if(b_dontkeep < 2) cntxt->cgi[cgi->i_old].b_dontkeep = b_dontkeep;

	cmp	DWORD PTR _b_dontkeep$[ebp], 2
	jge	SHORT $L70914
	mov	eax, DWORD PTR _cgi$[ebp]
	mov	ecx, DWORD PTR [eax+48]
	imul	ecx, 56					; 00000038H
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	eax, DWORD PTR [edx+29648]
	mov	edx, DWORD PTR _b_dontkeep$[ebp]
	mov	DWORD PTR [eax+ecx+52], edx

; 765  : 		else

	jmp	SHORT $L70915
$L70914:

; 767  : 			cntxt->cgi[cgi->i_old].name[0] = 0;

	mov	eax, DWORD PTR _cgi$[ebp]
	mov	ecx, DWORD PTR [eax+48]
	imul	ecx, 56					; 00000038H
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	eax, DWORD PTR [edx+29648]
	mov	ecx, DWORD PTR [eax+ecx]
	mov	BYTE PTR [ecx], 0

; 768  : 			cntxt->cgi[cgi->i_old].name_sz = 0;

	mov	edx, DWORD PTR _cgi$[ebp]
	mov	eax, DWORD PTR [edx+48]
	imul	eax, 56					; 00000038H
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	edx, DWORD PTR [ecx+29648]
	mov	DWORD PTR [edx+eax+4], 0
$L70915:

; 771  : }

	mov	esp, ebp
	pop	ebp
	ret	0
_cgi_setkeep ENDP
_TEXT	ENDS
PUBLIC	_cgi_value_setkeep
_TEXT	SEGMENT
_cntxt$ = 8
_cgival$ = 12
_i$ = 16
_b_dontkeep$ = 20
_j$ = -4
_val$70929 = -8
_cgi_value_setkeep PROC NEAR

; 785  : ){

	push	ebp
	mov	ebp, esp
	sub	esp, 8

; 786  : 	unsigned long j;
; 787  : 	for(j = 0; j < cgival->nbcols; j++)

	mov	DWORD PTR _j$[ebp], 0
	jmp	SHORT $L70926
$L70927:
	mov	eax, DWORD PTR _j$[ebp]
	add	eax, 1
	mov	DWORD PTR _j$[ebp], eax
$L70926:
	mov	ecx, DWORD PTR _cgival$[ebp]
	mov	edx, DWORD PTR _j$[ebp]
	cmp	edx, DWORD PTR [ecx+8]
	jae	SHORT $L70928

; 789  : 		DynTableCell *val = dyntab_cell(cgival, i, j);

	mov	eax, DWORD PTR _j$[ebp]
	push	eax
	mov	ecx, DWORD PTR _i$[ebp]
	push	ecx
	mov	edx, DWORD PTR _cgival$[ebp]
	push	edx
	call	_dyntab_cell
	add	esp, 12					; 0000000cH
	mov	DWORD PTR _val$70929[ebp], eax

; 790  : 		if(val && val->i_cgi && val->i_cgi < cntxt->nb_cgi)

	cmp	DWORD PTR _val$70929[ebp], 0
	je	SHORT $L70930
	mov	eax, DWORD PTR _val$70929[ebp]
	cmp	DWORD PTR [eax+48], 0
	je	SHORT $L70930
	mov	ecx, DWORD PTR _val$70929[ebp]
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	eax, DWORD PTR [ecx+48]
	cmp	eax, DWORD PTR [edx+29652]
	jae	SHORT $L70930

; 791  : 			cgi_setkeep(cntxt, val->i_cgi, b_dontkeep);

	mov	ecx, DWORD PTR _b_dontkeep$[ebp]
	push	ecx
	mov	edx, DWORD PTR _val$70929[ebp]
	mov	eax, DWORD PTR [edx+48]
	push	eax
	mov	ecx, DWORD PTR _cntxt$[ebp]
	push	ecx
	call	_cgi_setkeep
	add	esp, 12					; 0000000cH
$L70930:

; 792  : 	}

	jmp	SHORT $L70927
$L70928:

; 793  : }

	mov	esp, ebp
	pop	ebp
	ret	0
_cgi_value_setkeep ENDP
_TEXT	ENDS
PUBLIC	_cgi_put_hiddenold
EXTRN	_no_quote:BYTE
_DATA	SEGMENT
$SG70944 DB	''' ', 00H
	ORG $+1
$SG70945 DB	'<input type=hidden name=''O', 00H
	ORG $+1
$SG70947 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70950 DB	'''>', 00H
	ORG $+1
$SG70951 DB	'value=''', 00H
$SG70953 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70957 DB	0aH, 00H
	ORG $+2
$SG70959 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70961 DB	'D:\Travail\ABI\EVA\V4.0\CGI\Brunix-2016\cgi_utils.c', 00H
$SG70962 DB	'cgi_put_hiddenold', 00H
	ORG $+2
$SG70964 DB	'D:\Travail\ABI\EVA\V4.0\CGI\Brunix-2016\cgi_utils.c', 00H
$SG70965 DB	'cgi_put_hiddenold', 00H
_DATA	ENDS
_TEXT	SEGMENT
_cntxt$ = 8
_name$ = 12
_txt$ = 16
_len$ = 20
_cgi_put_hiddenold PROC NEAR

; 805  : ){

	push	ebp
	mov	ebp, esp

; 806  : 	DYNBUF_ADD3(cntxt->form->html, "<input type=hidden name='O", name->data + 1, name->cnt - 1, NO_CONV, "' ");

	push	2
	push	OFFSET FLAT:$SG70944
	push	0
	push	0
	mov	eax, DWORD PTR _name$[ebp]
	mov	ecx, DWORD PTR [eax+4]
	sub	ecx, 1
	push	ecx
	mov	edx, DWORD PTR _name$[ebp]
	add	edx, 9
	push	edx
	push	26					; 0000001aH
	push	OFFSET FLAT:$SG70945
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	ecx, DWORD PTR [eax+80]
	mov	edx, DWORD PTR [ecx+232]
	push	edx
	call	_dynbuf_add3
	add	esp, 36					; 00000024H
	test	eax, eax
	je	SHORT $L70943
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29872], OFFSET FLAT:$SG70947
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 806		; 00000326H
	jmp	$eva_err$70948
$L70943:

; 807  : 	DYNBUF_ADD3(cntxt->form->html, "value='", txt, len, HTML_NO_QUOTE, "'>");

	push	2
	push	OFFSET FLAT:$SG70950
	push	1
	push	OFFSET FLAT:_no_quote
	mov	edx, DWORD PTR _len$[ebp]
	push	edx
	mov	eax, DWORD PTR _txt$[ebp]
	push	eax
	push	7
	push	OFFSET FLAT:$SG70951
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	edx, DWORD PTR [ecx+80]
	mov	eax, DWORD PTR [edx+232]
	push	eax
	call	_dynbuf_add3
	add	esp, 36					; 00000024H
	test	eax, eax
	je	SHORT $L70949
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29872], OFFSET FLAT:$SG70953
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 807		; 00000327H
	jmp	SHORT $eva_err$70948
$L70949:

; 808  : 	if(cntxt->debug & DEBUG_HTML) DYNBUF_ADD_STR(cntxt->form->html, "\n");

	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	ecx, DWORD PTR [eax+29860]
	and	ecx, 128				; 00000080H
	test	ecx, ecx
	je	SHORT $L70956
	push	0
	push	0
	push	1
	push	OFFSET FLAT:$SG70957
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	eax, DWORD PTR [edx+80]
	mov	ecx, DWORD PTR [eax+232]
	push	ecx
	call	_dynbuf_add
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L70956
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29872], OFFSET FLAT:$SG70959
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 808		; 00000328H
	jmp	SHORT $eva_err$70948
$L70956:
$eva_noerr$70960:

; 809  : 	RETURN_OK_CLEANUP;

	push	0
	push	OFFSET FLAT:$SG70961
	push	OFFSET FLAT:$SG70962
	mov	ecx, DWORD PTR _cntxt$[ebp]
	push	ecx
	call	_err_clear
	add	esp, 16					; 00000010H
$eva_err$70948:
	mov	edx, DWORD PTR _cntxt$[ebp]
	cmp	DWORD PTR [edx+29872], 0
	je	SHORT $L70963
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	ecx, DWORD PTR [eax+29900]
	push	ecx
	push	OFFSET FLAT:$SG70964
	push	OFFSET FLAT:$SG70965
	mov	edx, DWORD PTR _cntxt$[ebp]
	push	edx
	call	_err_add_context
	add	esp, 16					; 00000010H
$L70963:
	mov	eax, DWORD PTR _cntxt$[ebp]
	xor	ecx, ecx
	cmp	DWORD PTR [eax+29872], 0
	setne	cl
	mov	eax, ecx

; 810  : }

	pop	ebp
	ret	0
_cgi_put_hiddenold ENDP
_TEXT	ENDS
PUBLIC	_cgi_put_hidden
_DATA	SEGMENT
	ORG $+2
$SG70978 DB	'DFO', 00H
$SG70981 DB	'''', 00H
	ORG $+2
$SG70982 DB	'<input type=hidden name=''', 00H
	ORG $+2
$SG70984 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70987 DB	'''>', 00H
	ORG $+1
$SG70988 DB	' value=''', 00H
	ORG $+3
$SG70990 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70994 DB	0aH, 00H
	ORG $+2
$SG70996 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70998 DB	'D:\Travail\ABI\EVA\V4.0\CGI\Brunix-2016\cgi_utils.c', 00H
$SG70999 DB	'cgi_put_hidden', 00H
	ORG $+1
$SG71001 DB	'D:\Travail\ABI\EVA\V4.0\CGI\Brunix-2016\cgi_utils.c', 00H
$SG71002 DB	'cgi_put_hidden', 00H
_DATA	ENDS
_TEXT	SEGMENT
_cntxt$ = 8
_i$ = -4
_cgi$70976 = -8
_cgi_put_hidden PROC NEAR

; 822  : ){

	push	ebp
	mov	ebp, esp
	sub	esp, 8

; 823  : 	unsigned long i;
; 824  : 
; 825  : 	/* For each CGI input */
; 826  : 	for(i = 0; i < cntxt->nb_cgi; i++)

	mov	DWORD PTR _i$[ebp], 0
	jmp	SHORT $L70973
$L70974:
	mov	eax, DWORD PTR _i$[ebp]
	add	eax, 1
	mov	DWORD PTR _i$[ebp], eax
$L70973:
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	edx, DWORD PTR _i$[ebp]
	cmp	edx, DWORD PTR [ecx+29652]
	jae	$eva_noerr$70997

; 828  : 		CGIData *cgi = cntxt->cgi + i;

	mov	eax, DWORD PTR _i$[ebp]
	imul	eax, 56					; 00000038H
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	edx, DWORD PTR [ecx+29648]
	add	edx, eax
	mov	DWORD PTR _cgi$70976[ebp], edx

; 829  : 
; 830  : 		/* Reouput CGI input if applicable */
; 831  : 		if(!cgi->b_dontkeep && cgi->name[0] && strchr("DFO", cgi->name[0]))

	mov	eax, DWORD PTR _cgi$70976[ebp]
	cmp	DWORD PTR [eax+52], 0
	jne	$L70993
	mov	ecx, DWORD PTR _cgi$70976[ebp]
	mov	edx, DWORD PTR [ecx]
	movsx	eax, BYTE PTR [edx]
	test	eax, eax
	je	$L70993
	mov	ecx, DWORD PTR _cgi$70976[ebp]
	mov	edx, DWORD PTR [ecx]
	movsx	eax, BYTE PTR [edx]
	push	eax
	push	OFFSET FLAT:$SG70978
	call	_strchr
	add	esp, 8
	test	eax, eax
	je	$L70993

; 833  : 			DYNBUF_ADD3_CGI(&cntxt->htmlhidden, "<input type=hidden name='", i, name, NO_CONV, "'");

	push	1
	push	OFFSET FLAT:$SG70981
	push	0
	push	0
	mov	ecx, DWORD PTR _i$[ebp]
	imul	ecx, 56					; 00000038H
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	eax, DWORD PTR [edx+29648]
	mov	ecx, DWORD PTR [eax+ecx+4]
	push	ecx
	mov	edx, DWORD PTR _i$[ebp]
	imul	edx, 56					; 00000038H
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	ecx, DWORD PTR [eax+29648]
	mov	edx, DWORD PTR [ecx+edx]
	push	edx
	push	25					; 00000019H
	push	OFFSET FLAT:$SG70982
	mov	eax, DWORD PTR _cntxt$[ebp]
	add	eax, 29796				; 00007464H
	push	eax
	call	_dynbuf_add3
	add	esp, 36					; 00000024H
	test	eax, eax
	je	SHORT $L70980
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29872], OFFSET FLAT:$SG70984
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 833		; 00000341H
	jmp	$eva_err$70985
$L70980:

; 834  : 			DYNBUF_ADD3_CGI(&cntxt->htmlhidden, " value='", i, value, HTML_NO_QUOTE, "'>");

	push	2
	push	OFFSET FLAT:$SG70987
	push	1
	push	OFFSET FLAT:_no_quote
	mov	eax, DWORD PTR _i$[ebp]
	imul	eax, 56					; 00000038H
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	edx, DWORD PTR [ecx+29648]
	mov	eax, DWORD PTR [edx+eax+12]
	push	eax
	mov	ecx, DWORD PTR _i$[ebp]
	imul	ecx, 56					; 00000038H
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	eax, DWORD PTR [edx+29648]
	mov	ecx, DWORD PTR [eax+ecx+8]
	push	ecx
	push	8
	push	OFFSET FLAT:$SG70988
	mov	edx, DWORD PTR _cntxt$[ebp]
	add	edx, 29796				; 00007464H
	push	edx
	call	_dynbuf_add3
	add	esp, 36					; 00000024H
	test	eax, eax
	je	SHORT $L70986
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29872], OFFSET FLAT:$SG70990
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 834		; 00000342H
	jmp	SHORT $eva_err$70985
$L70986:

; 835  : 			if(cntxt->debug & DEBUG_HTML) DYNBUF_ADD_STR(&cntxt->htmlhidden, "\n");

	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	eax, DWORD PTR [edx+29860]
	and	eax, 128				; 00000080H
	test	eax, eax
	je	SHORT $L70993
	push	0
	push	0
	push	1
	push	OFFSET FLAT:$SG70994
	mov	ecx, DWORD PTR _cntxt$[ebp]
	add	ecx, 29796				; 00007464H
	push	ecx
	call	_dynbuf_add
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L70993
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29872], OFFSET FLAT:$SG70996
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 835		; 00000343H
	jmp	SHORT $eva_err$70985
$L70993:

; 837  : 	}

	jmp	$L70974
$eva_noerr$70997:

; 838  : 
; 839  : 	RETURN_OK_CLEANUP;

	push	0
	push	OFFSET FLAT:$SG70998
	push	OFFSET FLAT:$SG70999
	mov	ecx, DWORD PTR _cntxt$[ebp]
	push	ecx
	call	_err_clear
	add	esp, 16					; 00000010H
$eva_err$70985:
	mov	edx, DWORD PTR _cntxt$[ebp]
	cmp	DWORD PTR [edx+29872], 0
	je	SHORT $L71000
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	ecx, DWORD PTR [eax+29900]
	push	ecx
	push	OFFSET FLAT:$SG71001
	push	OFFSET FLAT:$SG71002
	mov	edx, DWORD PTR _cntxt$[ebp]
	push	edx
	call	_err_add_context
	add	esp, 16					; 00000010H
$L71000:
	mov	eax, DWORD PTR _cntxt$[ebp]
	xor	ecx, ecx
	cmp	DWORD PTR [eax+29872], 0
	setne	cl
	mov	eax, ecx

; 840  : }

	mov	esp, ebp
	pop	ebp
	ret	0
_cgi_put_hidden ENDP
_TEXT	ENDS
PUBLIC	_cgi_add_inputold
_DATA	SEGMENT
	ORG $+1
$SG71026 DB	'D:\Travail\ABI\EVA\V4.0\CGI\Brunix-2016\cgi_utils.c', 00H
$SG71027 DB	'cgi_add_inputold', 00H
	ORG $+3
$SG71029 DB	'D:\Travail\ABI\EVA\V4.0\CGI\Brunix-2016\cgi_utils.c', 00H
$SG71030 DB	'cgi_add_inputold', 00H
_DATA	ENDS
_TEXT	SEGMENT
_cntxt$ = 8
_i_cgi$ = 12
_name$ = 16
_name_sz$ = 20
_value$ = 24
_value_sz$ = 28
_c$71022 = -4
_i$71023 = -8
_cgi_add_inputold PROC NEAR

; 855  : ){

	push	ebp
	mov	ebp, esp
	sub	esp, 8

; 856  : 	if(cgi_add_input(cntxt, i_cgi, name, name_sz, value, value_sz)) STACK_ERROR;

	mov	eax, DWORD PTR _value_sz$[ebp]
	push	eax
	mov	ecx, DWORD PTR _value$[ebp]
	push	ecx
	mov	edx, DWORD PTR _name_sz$[ebp]
	push	edx
	mov	eax, DWORD PTR _name$[ebp]
	push	eax
	mov	ecx, DWORD PTR _i_cgi$[ebp]
	push	ecx
	mov	edx, DWORD PTR _cntxt$[ebp]
	push	edx
	call	_cgi_add_input
	add	esp, 24					; 00000018H
	test	eax, eax
	je	SHORT $L71019
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 856		; 00000358H
	jmp	SHORT $eva_err$71020
$L71019:

; 857  : 	if(*name == 'D')

	mov	ecx, DWORD PTR _name$[ebp]
	movsx	edx, BYTE PTR [ecx]
	cmp	edx, 68					; 00000044H
	jne	SHORT $eva_noerr$71025

; 859  : 		char c = *name;

	mov	eax, DWORD PTR _name$[ebp]
	mov	cl, BYTE PTR [eax]
	mov	BYTE PTR _c$71022[ebp], cl

; 860  : 		unsigned long i;
; 861  : 		*name = 'O';

	mov	edx, DWORD PTR _name$[ebp]
	mov	BYTE PTR [edx], 79			; 0000004fH

; 862  : 		if(cgi_add_input(cntxt, &i, name, name_sz, value, value_sz)) STACK_ERROR;

	mov	eax, DWORD PTR _value_sz$[ebp]
	push	eax
	mov	ecx, DWORD PTR _value$[ebp]
	push	ecx
	mov	edx, DWORD PTR _name_sz$[ebp]
	push	edx
	mov	eax, DWORD PTR _name$[ebp]
	push	eax
	lea	ecx, DWORD PTR _i$71023[ebp]
	push	ecx
	mov	edx, DWORD PTR _cntxt$[ebp]
	push	edx
	call	_cgi_add_input
	add	esp, 24					; 00000018H
	test	eax, eax
	je	SHORT $L71024
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 862		; 0000035eH
	jmp	SHORT $eva_err$71020
$L71024:

; 863  : 		*name = c;

	mov	ecx, DWORD PTR _name$[ebp]
	mov	dl, BYTE PTR _c$71022[ebp]
	mov	BYTE PTR [ecx], dl
$eva_noerr$71025:

; 865  : 	RETURN_OK_CLEANUP;

	push	0
	push	OFFSET FLAT:$SG71026
	push	OFFSET FLAT:$SG71027
	mov	eax, DWORD PTR _cntxt$[ebp]
	push	eax
	call	_err_clear
	add	esp, 16					; 00000010H
$eva_err$71020:
	mov	ecx, DWORD PTR _cntxt$[ebp]
	cmp	DWORD PTR [ecx+29872], 0
	je	SHORT $L71028
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	eax, DWORD PTR [edx+29900]
	push	eax
	push	OFFSET FLAT:$SG71029
	push	OFFSET FLAT:$SG71030
	mov	ecx, DWORD PTR _cntxt$[ebp]
	push	ecx
	call	_err_add_context
	add	esp, 16					; 00000010H
$L71028:
	mov	edx, DWORD PTR _cntxt$[ebp]
	xor	eax, eax
	cmp	DWORD PTR [edx+29872], 0
	setne	al

; 866  : }

	mov	esp, ebp
	pop	ebp
	ret	0
_cgi_add_inputold ENDP
_TEXT	ENDS
EXTRN	_mem_realloc:NEAR
EXTRN	_crlf_to_lf:BYTE
EXTRN	_strncmp:NEAR
_BSS	SEGMENT
	ALIGN	4

$SG71057 DB	01H DUP (?)
	ALIGN	4

$SG71058 DB	01H DUP (?)
_BSS	ENDS
_DATA	SEGMENT
	ORG $+3
$SG71066 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG71074 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG71080 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG71086 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG71091 DB	'D:\Travail\ABI\EVA\V4.0\CGI\Brunix-2016\cgi_utils.c', 00H
$SG71092 DB	'cgi_add_input', 00H
	ORG $+2
$SG71094 DB	'D:\Travail\ABI\EVA\V4.0\CGI\Brunix-2016\cgi_utils.c', 00H
$SG71095 DB	'cgi_add_input', 00H
_DATA	ENDS
_TEXT	SEGMENT
_cntxt$ = 8
_i_cgi$ = 12
_name$ = 16
_name_sz$ = 20
_value$ = 24
_value_sz$ = 28
_i$ = -8
_cgi$ = -12
_buf$ = -4
_cgi$71054 = -16
_newdest$71061 = -20
_size$71069 = -24
_src$71070 = -28
_size1$71071 = -32
_size$71081 = -36
_src$71082 = -40
_size1$71083 = -44
_cgi_add_input PROC NEAR

; 881  : ){

	push	ebp
	mov	ebp, esp
	sub	esp, 52					; 00000034H

; 882  : 	unsigned long i;
; 883  : 	CGIData *cgi;
; 884  : 	DynBuffer *buf = NULL;

	mov	DWORD PTR _buf$[ebp], 0

; 885  : 
; 886  : 	/* Search same name & value in CGI input list */
; 887  : 	for(i = 0; i < cntxt->nb_cgi; i++)

	mov	DWORD PTR _i$[ebp], 0
	jmp	SHORT $L71051
$L71052:
	mov	eax, DWORD PTR _i$[ebp]
	add	eax, 1
	mov	DWORD PTR _i$[ebp], eax
$L71051:
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	edx, DWORD PTR _i$[ebp]
	cmp	edx, DWORD PTR [ecx+29652]
	jae	$L71053

; 889  : 		CGIData *cgi = cntxt->cgi + i;

	mov	eax, DWORD PTR _i$[ebp]
	imul	eax, 56					; 00000038H
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	edx, DWORD PTR [ecx+29648]
	add	edx, eax
	mov	DWORD PTR _cgi$71054[ebp], edx

; 890  : 
; 891  : 		if(	name_sz == cgi->name_sz &&
; 892  : 			value_sz == cgi->value_sz &&
; 893  : 			!strncmp(name, cgi->name, name_sz) &&
; 894  : 			(!value_sz || !strncmp(value ? value : "", cgi->value ? cgi->value : "", value_sz)))

	mov	eax, DWORD PTR _cgi$71054[ebp]
	mov	ecx, DWORD PTR _name_sz$[ebp]
	cmp	ecx, DWORD PTR [eax+4]
	jne	$L71055
	mov	edx, DWORD PTR _cgi$71054[ebp]
	mov	eax, DWORD PTR _value_sz$[ebp]
	cmp	eax, DWORD PTR [edx+12]
	jne	$L71055
	mov	ecx, DWORD PTR _name_sz$[ebp]
	push	ecx
	mov	edx, DWORD PTR _cgi$71054[ebp]
	mov	eax, DWORD PTR [edx]
	push	eax
	mov	ecx, DWORD PTR _name$[ebp]
	push	ecx
	call	_strncmp
	add	esp, 12					; 0000000cH
	test	eax, eax
	jne	SHORT $L71055
	cmp	DWORD PTR _value_sz$[ebp], 0
	je	SHORT $L71056
	mov	edx, DWORD PTR _cgi$71054[ebp]
	cmp	DWORD PTR [edx+8], 0
	je	SHORT $L71861
	mov	eax, DWORD PTR _cgi$71054[ebp]
	mov	ecx, DWORD PTR [eax+8]
	mov	DWORD PTR -48+[ebp], ecx
	jmp	SHORT $L71862
$L71861:
	mov	DWORD PTR -48+[ebp], OFFSET FLAT:$SG71057
$L71862:
	cmp	DWORD PTR _value$[ebp], 0
	je	SHORT $L71863
	mov	edx, DWORD PTR _value$[ebp]
	mov	DWORD PTR -52+[ebp], edx
	jmp	SHORT $L71864
$L71863:
	mov	DWORD PTR -52+[ebp], OFFSET FLAT:$SG71058
$L71864:
	mov	eax, DWORD PTR _value_sz$[ebp]
	push	eax
	mov	ecx, DWORD PTR -48+[ebp]
	push	ecx
	mov	edx, DWORD PTR -52+[ebp]
	push	edx
	call	_strncmp
	add	esp, 12					; 0000000cH
	test	eax, eax
	jne	SHORT $L71055
$L71056:

; 896  : 			/* If same name & value found : do not add */
; 897  : 			if(i_cgi) *i_cgi = i;

	cmp	DWORD PTR _i_cgi$[ebp], 0
	je	SHORT $L71059
	mov	eax, DWORD PTR _i_cgi$[ebp]
	mov	ecx, DWORD PTR _i$[ebp]
	mov	DWORD PTR [eax], ecx
$L71059:

; 898  : 			cgi->b_dontkeep = 0;

	mov	edx, DWORD PTR _cgi$71054[ebp]
	mov	DWORD PTR [edx+52], 0

; 899  : 			RETURN_OK;

	jmp	$eva_noerr$71060
$L71055:

; 901  : 	}

	jmp	$L71052
$L71053:

; 902  : 
; 903  : 	/* Add cgi input in cntxt->cgi */
; 904  : 	M_REALLOC(CGIData, cntxt->cgi, cntxt->nb_cgi);

	push	112					; 00000070H
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	ecx, DWORD PTR [eax+29652]
	imul	ecx, 56					; 00000038H
	push	ecx
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	eax, DWORD PTR [edx+29648]
	push	eax
	call	_mem_realloc
	add	esp, 12					; 0000000cH
	mov	DWORD PTR _newdest$71061[ebp], eax
	cmp	DWORD PTR _newdest$71061[ebp], 0
	jne	SHORT $L71064
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29872], OFFSET FLAT:$SG71066
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 904		; 00000388H
	jmp	$eva_err$71067
$L71064:
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	ecx, DWORD PTR _newdest$71061[ebp]
	mov	DWORD PTR [eax+29648], ecx
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	eax, DWORD PTR [edx+29652]
	add	eax, 1
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29652], eax

; 905  : 	cgi = cntxt->cgi + (cntxt->nb_cgi - 1);

	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	eax, DWORD PTR [edx+29652]
	sub	eax, 1
	imul	eax, 56					; 00000038H
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	edx, DWORD PTR [ecx+29648]
	add	edx, eax
	mov	DWORD PTR _cgi$[ebp], edx

; 906  : 
; 907  : 	/* Copy name */
; 908  : 	M_STRDUP(cgi->name, name, name_sz);

	mov	eax, DWORD PTR _name_sz$[ebp]
	mov	DWORD PTR _size$71069[ebp], eax
	mov	ecx, DWORD PTR _name$[ebp]
	mov	DWORD PTR _src$71070[ebp], ecx
	mov	edx, DWORD PTR _size$71069[ebp]
	add	edx, 1
	mov	DWORD PTR _size1$71071[ebp], edx
	mov	eax, DWORD PTR _size1$71071[ebp]
	push	eax
	call	_mem_alloc
	add	esp, 4
	mov	ecx, DWORD PTR _cgi$[ebp]
	mov	DWORD PTR [ecx], eax
	cmp	DWORD PTR _size1$71071[ebp], 0
	je	SHORT $L71072
	mov	edx, DWORD PTR _cgi$[ebp]
	cmp	DWORD PTR [edx], 0
	jne	SHORT $L71072
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29872], OFFSET FLAT:$SG71074
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 908		; 0000038cH
	jmp	$eva_err$71067
$L71072:
	cmp	DWORD PTR _src$71070[ebp], 0
	je	SHORT $L71076
	cmp	DWORD PTR _size$71069[ebp], 0
	je	SHORT $L71076
	mov	edx, DWORD PTR _size$71069[ebp]
	push	edx
	mov	eax, DWORD PTR _src$71070[ebp]
	push	eax
	mov	ecx, DWORD PTR _cgi$[ebp]
	mov	edx, DWORD PTR [ecx]
	push	edx
	call	_memcpy
	add	esp, 12					; 0000000cH
$L71076:

; 909  : 	cgi->name_sz = name_sz;

	mov	eax, DWORD PTR _cgi$[ebp]
	mov	ecx, DWORD PTR _name_sz$[ebp]
	mov	DWORD PTR [eax+4], ecx

; 910  : 
; 911  : 	/* Copy value */
; 912  : 	if(value_sz && value && *value)

	cmp	DWORD PTR _value_sz$[ebp], 0
	je	$L71077
	cmp	DWORD PTR _value$[ebp], 0
	je	$L71077
	mov	edx, DWORD PTR _value$[ebp]
	movsx	eax, BYTE PTR [edx]
	test	eax, eax
	je	$L71077

; 914  : 		DYNBUF_ADD(&buf, value, value_sz, CRLF_TO_LF);

	push	1
	push	OFFSET FLAT:_crlf_to_lf
	mov	ecx, DWORD PTR _value_sz$[ebp]
	push	ecx
	mov	edx, DWORD PTR _value$[ebp]
	push	edx
	lea	eax, DWORD PTR _buf$[ebp]
	push	eax
	call	_dynbuf_add
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L71078
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29872], OFFSET FLAT:$SG71080
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 914		; 00000392H
	jmp	$eva_err$71067
$L71078:

; 915  : 		M_STRDUP(cgi->value, buf->data, buf->cnt);

	mov	eax, DWORD PTR _buf$[ebp]
	mov	ecx, DWORD PTR [eax+4]
	mov	DWORD PTR _size$71081[ebp], ecx
	mov	edx, DWORD PTR _buf$[ebp]
	add	edx, 8
	mov	DWORD PTR _src$71082[ebp], edx
	mov	eax, DWORD PTR _size$71081[ebp]
	add	eax, 1
	mov	DWORD PTR _size1$71083[ebp], eax
	mov	ecx, DWORD PTR _size1$71083[ebp]
	push	ecx
	call	_mem_alloc
	add	esp, 4
	mov	edx, DWORD PTR _cgi$[ebp]
	mov	DWORD PTR [edx+8], eax
	cmp	DWORD PTR _size1$71083[ebp], 0
	je	SHORT $L71084
	mov	eax, DWORD PTR _cgi$[ebp]
	cmp	DWORD PTR [eax+8], 0
	jne	SHORT $L71084
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29872], OFFSET FLAT:$SG71086
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 915		; 00000393H
	jmp	SHORT $eva_err$71067
$L71084:
	cmp	DWORD PTR _src$71082[ebp], 0
	je	SHORT $L71088
	cmp	DWORD PTR _size$71081[ebp], 0
	je	SHORT $L71088
	mov	eax, DWORD PTR _size$71081[ebp]
	push	eax
	mov	ecx, DWORD PTR _src$71082[ebp]
	push	ecx
	mov	edx, DWORD PTR _cgi$[ebp]
	mov	eax, DWORD PTR [edx+8]
	push	eax
	call	_memcpy
	add	esp, 12					; 0000000cH
$L71088:

; 916  : 		cgi->value_sz = buf->cnt;

	mov	ecx, DWORD PTR _cgi$[ebp]
	mov	edx, DWORD PTR _buf$[ebp]
	mov	eax, DWORD PTR [edx+4]
	mov	DWORD PTR [ecx+12], eax
$L71077:

; 918  : 
; 919  : 	/* Parse name */
; 920  : 	if(cgi_parse_name(cntxt, cgi)) STACK_ERROR;

	mov	ecx, DWORD PTR _cgi$[ebp]
	push	ecx
	mov	edx, DWORD PTR _cntxt$[ebp]
	push	edx
	call	_cgi_parse_name
	add	esp, 8
	test	eax, eax
	je	SHORT $L71089
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 920		; 00000398H
	jmp	SHORT $eva_err$71067
$L71089:

; 921  : 	if(i_cgi) *i_cgi = i;

	cmp	DWORD PTR _i_cgi$[ebp], 0
	je	SHORT $eva_noerr$71060
	mov	ecx, DWORD PTR _i_cgi$[ebp]
	mov	edx, DWORD PTR _i$[ebp]
	mov	DWORD PTR [ecx], edx
$eva_noerr$71060:

; 922  : 	RETURN_OK_CLEANUP;

	push	0
	push	OFFSET FLAT:$SG71091
	push	OFFSET FLAT:$SG71092
	mov	eax, DWORD PTR _cntxt$[ebp]
	push	eax
	call	_err_clear
	add	esp, 16					; 00000010H
$eva_err$71067:
	mov	ecx, DWORD PTR _cntxt$[ebp]
	cmp	DWORD PTR [ecx+29872], 0
	je	SHORT $L71093
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	eax, DWORD PTR [edx+29900]
	push	eax
	push	OFFSET FLAT:$SG71094
	push	OFFSET FLAT:$SG71095
	mov	ecx, DWORD PTR _cntxt$[ebp]
	push	ecx
	call	_err_add_context
	add	esp, 16					; 00000010H
$L71093:
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

; 923  : }

	mov	esp, ebp
	pop	ebp
	ret	0
_cgi_add_input ENDP
_TEXT	ENDS
PUBLIC	_cgi_read_urlencoded
EXTRN	_memcmp:NEAR
_BSS	SEGMENT
	ALIGN	4

$SG71105 DB	01H DUP (?)
_BSS	ENDS
_DATA	SEGMENT
	ORG $+2
$SG71124 DB	'%0D%0A', 00H
	ORG $+1
$SG71132 DB	'Syntax error in CGI data - server is probably misconfigu'
	DB	'red', 00H
$SG71137 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG71145 DB	'Null name in CGI data', 00H
	ORG $+2
$SG71152 DB	' ', 0aH, 09H, 0dH, 00H
	ORG $+3
$SG71156 DB	' ', 0aH, 09H, 0dH, 00H
	ORG $+3
$SG71160 DB	'D:\Travail\ABI\EVA\V4.0\CGI\Brunix-2016\cgi_utils.c', 00H
$SG71161 DB	'cgi_read_urlencoded', 00H
$SG71163 DB	'D:\Travail\ABI\EVA\V4.0\CGI\Brunix-2016\cgi_utils.c', 00H
$SG71164 DB	'cgi_read_urlencoded', 00H
_DATA	ENDS
_TEXT	SEGMENT
_cntxt$ = 8
_c$ = -8
_prevdelim$ = -36
_name$ = -28
_bname$ = -4
_i$ = -12
_len$ = -16
_sz$ = -24
_name_sz$ = -20
_parsed$ = -32
_val$71147 = -40
_cgi_read_urlencoded PROC NEAR

; 938  : ){

	push	ebp
	mov	ebp, esp
	sub	esp, 68					; 00000044H

; 939  : 	char c[2], prevdelim = '&';

	mov	BYTE PTR _prevdelim$[ebp], 38		; 00000026H

; 940  : 	char *name = "";

	mov	DWORD PTR _name$[ebp], OFFSET FLAT:$SG71105

; 941  : 	int bname;
; 942  : 	size_t i, len, sz, name_sz = 0;

	mov	DWORD PTR _name_sz$[ebp], 0

; 943  : 	DynBuffer *parsed = NULL;

	mov	DWORD PTR _parsed$[ebp], 0

; 944  : 
; 945  : 	/* Loop to copy & delimit (null terminate) names & values changing %XX entities */
; 946  : 	c[1] = 0;

	mov	BYTE PTR _c$[ebp+1], 0

; 947  : 	if(cntxt->input) for(i = 0; i <= cntxt->input->cnt; i++)

	mov	eax, DWORD PTR _cntxt$[ebp]
	cmp	DWORD PTR [eax+29644], 0
	je	$L71116
	mov	DWORD PTR _i$[ebp], 0
	jmp	SHORT $L71114
$L71115:
	mov	ecx, DWORD PTR _i$[ebp]
	add	ecx, 1
	mov	DWORD PTR _i$[ebp], ecx
$L71114:
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	eax, DWORD PTR [edx+29644]
	mov	ecx, DWORD PTR _i$[ebp]
	cmp	ecx, DWORD PTR [eax+4]
	ja	$L71116

; 949  : 		*c = cntxt->input->data[i];

	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	eax, DWORD PTR [edx+29644]
	mov	ecx, DWORD PTR _i$[ebp]
	mov	dl, BYTE PTR [eax+ecx+8]
	mov	BYTE PTR _c$[ebp], dl

; 950  : 		switch(*c) {

	movsx	eax, BYTE PTR _c$[ebp]
	mov	DWORD PTR -44+[ebp], eax
	mov	ecx, DWORD PTR -44+[ebp]
	sub	ecx, 37					; 00000025H
	mov	DWORD PTR -44+[ebp], ecx
	cmp	DWORD PTR -44+[ebp], 24			; 00000018H
	ja	$L71118
	mov	eax, DWORD PTR -44+[ebp]
	xor	edx, edx
	mov	dl, BYTE PTR $L71878[eax]
	jmp	DWORD PTR $L71879[edx*4]
$L71121:

; 951  : 
; 952  : 		/* + stands for space in CGI */
; 953  : 		case '+':
; 954  : 			*c = ' ';

	mov	BYTE PTR _c$[ebp], 32			; 00000020H

; 955  : 			break;

	jmp	$L71118
$L71122:

; 956  : 
; 957  : 		/* CGI character codes (%XX) conversion */
; 958  : 		case '%':
; 959  : 			if(memcmp("%0D%0A", cntxt->input->data + i, 6))

	push	6
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	edx, DWORD PTR [ecx+29644]
	mov	eax, DWORD PTR _i$[ebp]
	lea	ecx, DWORD PTR [edx+eax+8]
	push	ecx
	push	OFFSET FLAT:$SG71124
	call	_memcmp
	add	esp, 12					; 0000000cH
	test	eax, eax
	je	$L71123

; 961  : 				/* Convert %XX to ascii value */
; 962  : 				*c = (char)(TO_HEX(cntxt->input->data[i+1])*16 + TO_HEX(cntxt->input->data[i+2]));

	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	eax, DWORD PTR [edx+29644]
	mov	ecx, DWORD PTR _i$[ebp]
	movsx	edx, BYTE PTR [eax+ecx+9]
	cmp	edx, 48					; 00000030H
	jl	SHORT $L71866
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	ecx, DWORD PTR [eax+29644]
	mov	edx, DWORD PTR _i$[ebp]
	movsx	eax, BYTE PTR [ecx+edx+9]
	cmp	eax, 57					; 00000039H
	jg	SHORT $L71866
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	edx, DWORD PTR [ecx+29644]
	mov	eax, DWORD PTR _i$[ebp]
	movsx	ecx, BYTE PTR [edx+eax+9]
	sub	ecx, 48					; 00000030H
	mov	DWORD PTR -48+[ebp], ecx
	jmp	$L71871
$L71866:
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	eax, DWORD PTR [edx+29644]
	mov	ecx, DWORD PTR _i$[ebp]
	movsx	edx, BYTE PTR [eax+ecx+9]
	cmp	edx, 97					; 00000061H
	jl	SHORT $L71867
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	ecx, DWORD PTR [eax+29644]
	mov	edx, DWORD PTR _i$[ebp]
	movsx	eax, BYTE PTR [ecx+edx+9]
	cmp	eax, 102				; 00000066H
	jg	SHORT $L71867
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	edx, DWORD PTR [ecx+29644]
	mov	eax, DWORD PTR _i$[ebp]
	movsx	ecx, BYTE PTR [edx+eax+9]
	sub	ecx, 87					; 00000057H
	mov	DWORD PTR -52+[ebp], ecx
	jmp	SHORT $L71870
$L71867:
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	eax, DWORD PTR [edx+29644]
	mov	ecx, DWORD PTR _i$[ebp]
	movsx	edx, BYTE PTR [eax+ecx+9]
	cmp	edx, 65					; 00000041H
	jl	SHORT $L71868
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	ecx, DWORD PTR [eax+29644]
	mov	edx, DWORD PTR _i$[ebp]
	movsx	eax, BYTE PTR [ecx+edx+9]
	cmp	eax, 70					; 00000046H
	jg	SHORT $L71868
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	edx, DWORD PTR [ecx+29644]
	mov	eax, DWORD PTR _i$[ebp]
	movsx	ecx, BYTE PTR [edx+eax+9]
	sub	ecx, 55					; 00000037H
	mov	DWORD PTR -56+[ebp], ecx
	jmp	SHORT $L71869
$L71868:
	mov	DWORD PTR -56+[ebp], 0
$L71869:
	mov	edx, DWORD PTR -56+[ebp]
	mov	DWORD PTR -52+[ebp], edx
$L71870:
	mov	eax, DWORD PTR -52+[ebp]
	mov	DWORD PTR -48+[ebp], eax
$L71871:
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	edx, DWORD PTR [ecx+29644]
	mov	eax, DWORD PTR _i$[ebp]
	movsx	ecx, BYTE PTR [edx+eax+10]
	cmp	ecx, 48					; 00000030H
	jl	SHORT $L71872
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	eax, DWORD PTR [edx+29644]
	mov	ecx, DWORD PTR _i$[ebp]
	movsx	edx, BYTE PTR [eax+ecx+10]
	cmp	edx, 57					; 00000039H
	jg	SHORT $L71872
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	ecx, DWORD PTR [eax+29644]
	mov	edx, DWORD PTR _i$[ebp]
	movsx	eax, BYTE PTR [ecx+edx+10]
	sub	eax, 48					; 00000030H
	mov	DWORD PTR -60+[ebp], eax
	jmp	$L71877
$L71872:
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	edx, DWORD PTR [ecx+29644]
	mov	eax, DWORD PTR _i$[ebp]
	movsx	ecx, BYTE PTR [edx+eax+10]
	cmp	ecx, 97					; 00000061H
	jl	SHORT $L71873
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	eax, DWORD PTR [edx+29644]
	mov	ecx, DWORD PTR _i$[ebp]
	movsx	edx, BYTE PTR [eax+ecx+10]
	cmp	edx, 102				; 00000066H
	jg	SHORT $L71873
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	ecx, DWORD PTR [eax+29644]
	mov	edx, DWORD PTR _i$[ebp]
	movsx	eax, BYTE PTR [ecx+edx+10]
	sub	eax, 87					; 00000057H
	mov	DWORD PTR -64+[ebp], eax
	jmp	SHORT $L71876
$L71873:
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	edx, DWORD PTR [ecx+29644]
	mov	eax, DWORD PTR _i$[ebp]
	movsx	ecx, BYTE PTR [edx+eax+10]
	cmp	ecx, 65					; 00000041H
	jl	SHORT $L71874
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	eax, DWORD PTR [edx+29644]
	mov	ecx, DWORD PTR _i$[ebp]
	movsx	edx, BYTE PTR [eax+ecx+10]
	cmp	edx, 70					; 00000046H
	jg	SHORT $L71874
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	ecx, DWORD PTR [eax+29644]
	mov	edx, DWORD PTR _i$[ebp]
	movsx	eax, BYTE PTR [ecx+edx+10]
	sub	eax, 55					; 00000037H
	mov	DWORD PTR -68+[ebp], eax
	jmp	SHORT $L71875
$L71874:
	mov	DWORD PTR -68+[ebp], 0
$L71875:
	mov	ecx, DWORD PTR -68+[ebp]
	mov	DWORD PTR -64+[ebp], ecx
$L71876:
	mov	edx, DWORD PTR -64+[ebp]
	mov	DWORD PTR -60+[ebp], edx
$L71877:
	mov	eax, DWORD PTR -48+[ebp]
	shl	eax, 4
	add	eax, DWORD PTR -60+[ebp]
	mov	BYTE PTR _c$[ebp], al

; 963  : 				i += 2;

	mov	ecx, DWORD PTR _i$[ebp]
	add	ecx, 2
	mov	DWORD PTR _i$[ebp], ecx

; 965  : 			else

	jmp	SHORT $L71126
$L71123:

; 967  : 				/* Change \r\n to \n */
; 968  : 				*c = '\n';

	mov	BYTE PTR _c$[ebp], 10			; 0000000aH

; 969  : 				i += 5;

	mov	edx, DWORD PTR _i$[ebp]
	add	edx, 5
	mov	DWORD PTR _i$[ebp], edx
$L71126:

; 971  : 			break;

	jmp	SHORT $L71118
$L71127:

; 972  : 
; 973  : 		/* CGI delimiters : check for correct alternance */
; 974  : 		case '=':
; 975  : 		case '&':
; 976  : 			if(!((prevdelim == '&' && *c == '=') || (prevdelim == '=' && *c == '&')))

	movsx	eax, BYTE PTR _prevdelim$[ebp]
	cmp	eax, 38					; 00000026H
	jne	SHORT $L71129
	movsx	ecx, BYTE PTR _c$[ebp]
	cmp	ecx, 61					; 0000003dH
	je	SHORT $L71128
$L71129:
	movsx	edx, BYTE PTR _prevdelim$[ebp]
	cmp	edx, 61					; 0000003dH
	jne	SHORT $L71130
	movsx	eax, BYTE PTR _c$[ebp]
	cmp	eax, 38					; 00000026H
	je	SHORT $L71128
$L71130:

; 977  : 				RETURN_ERROR("Syntax error in CGI data - server is probably misconfigured", NOP);

	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29872], OFFSET FLAT:$SG71132
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 977		; 000003d1H
	jmp	$eva_err$71133
$L71128:

; 978  : 			prevdelim = *c;

	mov	al, BYTE PTR _c$[ebp]
	mov	BYTE PTR _prevdelim$[ebp], al

; 979  : 			*c = 0;

	mov	BYTE PTR _c$[ebp], 0
$L71118:

; 982  : 		DYNBUF_ADD(&parsed, c, 1, NO_CONV);

	push	0
	push	0
	push	1
	lea	ecx, DWORD PTR _c$[ebp]
	push	ecx
	lea	edx, DWORD PTR _parsed$[ebp]
	push	edx
	call	_dynbuf_add
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L71135
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29872], OFFSET FLAT:$SG71137
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 982		; 000003d6H
	jmp	$eva_err$71133
$L71135:

; 983  : 	}

	jmp	$L71115
$L71116:

; 984  : 
; 985  : 	/* Add tags value and name to cntxt->cgi table */
; 986  : 	if(parsed) for(i = 0, bname = 1; i < parsed->cnt; i += len + 1, bname = !bname)

	cmp	DWORD PTR _parsed$[ebp], 0
	je	$eva_noerr$71159
	mov	DWORD PTR _i$[ebp], 0
	mov	DWORD PTR _bname$[ebp], 1
	jmp	SHORT $L71139
$L71140:
	mov	edx, DWORD PTR _len$[ebp]
	mov	eax, DWORD PTR _i$[ebp]
	lea	ecx, DWORD PTR [eax+edx+1]
	mov	DWORD PTR _i$[ebp], ecx
	xor	edx, edx
	cmp	DWORD PTR _bname$[ebp], 0
	sete	dl
	mov	DWORD PTR _bname$[ebp], edx
$L71139:
	mov	eax, DWORD PTR _parsed$[ebp]
	mov	ecx, DWORD PTR _i$[ebp]
	cmp	ecx, DWORD PTR [eax+4]
	jae	$eva_noerr$71159

; 988  : 		/* Calc value length - return error on null name */
; 989  : 		len = strlen(parsed->data + i);

	mov	edx, DWORD PTR _i$[ebp]
	mov	eax, DWORD PTR _parsed$[ebp]
	lea	ecx, DWORD PTR [eax+edx+8]
	push	ecx
	call	_strlen
	add	esp, 4
	mov	DWORD PTR _len$[ebp], eax

; 990  : 		if(bname)

	cmp	DWORD PTR _bname$[ebp], 0
	je	SHORT $L71142

; 992  : 			if(!len) RETURN_ERROR("Null name in CGI data", NOP);

	cmp	DWORD PTR _len$[ebp], 0
	jne	SHORT $L71143
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29872], OFFSET FLAT:$SG71145
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 992		; 000003e0H
	jmp	$eva_err$71133
$L71143:

; 993  : 			name = parsed->data + i;

	mov	ecx, DWORD PTR _i$[ebp]
	mov	edx, DWORD PTR _parsed$[ebp]
	lea	eax, DWORD PTR [edx+ecx+8]
	mov	DWORD PTR _name$[ebp], eax

; 994  : 			name_sz = len;

	mov	ecx, DWORD PTR _len$[ebp]
	mov	DWORD PTR _name_sz$[ebp], ecx

; 996  : 		else

	jmp	$L71158
$L71142:

; 998  : 			/* Strip spaces around the value */
; 999  : 			char *val = parsed->data + i;

	mov	edx, DWORD PTR _i$[ebp]
	mov	eax, DWORD PTR _parsed$[ebp]
	lea	ecx, DWORD PTR [eax+edx+8]
	mov	DWORD PTR _val$71147[ebp], ecx

; 1000 : 			sz = len;

	mov	edx, DWORD PTR _len$[ebp]
	mov	DWORD PTR _sz$[ebp], edx

; 1001 : 			STRIP_SPACES_AROUND(val, sz);

	cmp	DWORD PTR _val$71147[ebp], 0
	je	SHORT $L71155
$L71150:
	cmp	DWORD PTR _sz$[ebp], 0
	je	SHORT $L71151
	mov	eax, DWORD PTR _val$71147[ebp]
	movsx	ecx, BYTE PTR [eax]
	push	ecx
	push	OFFSET FLAT:$SG71152
	call	_strchr
	add	esp, 8
	test	eax, eax
	je	SHORT $L71151
	mov	edx, DWORD PTR _val$71147[ebp]
	add	edx, 1
	mov	DWORD PTR _val$71147[ebp], edx
	mov	eax, DWORD PTR _sz$[ebp]
	sub	eax, 1
	mov	DWORD PTR _sz$[ebp], eax
	jmp	SHORT $L71150
$L71151:
	cmp	DWORD PTR _sz$[ebp], 0
	je	SHORT $L71155
	mov	ecx, DWORD PTR _val$71147[ebp]
	add	ecx, DWORD PTR _sz$[ebp]
	movsx	edx, BYTE PTR [ecx-1]
	push	edx
	push	OFFSET FLAT:$SG71156
	call	_strchr
	add	esp, 8
	test	eax, eax
	je	SHORT $L71155
	mov	eax, DWORD PTR _sz$[ebp]
	sub	eax, 1
	mov	DWORD PTR _sz$[ebp], eax
	jmp	SHORT $L71151
$L71155:

; 1002 : 
; 1003 : 			/* Add input in cntxt->cgi */
; 1004 : 			if(cgi_add_input(cntxt, NULL, name, name_sz, val, sz)) STACK_ERROR;

	mov	ecx, DWORD PTR _sz$[ebp]
	push	ecx
	mov	edx, DWORD PTR _val$71147[ebp]
	push	edx
	mov	eax, DWORD PTR _name_sz$[ebp]
	push	eax
	mov	ecx, DWORD PTR _name$[ebp]
	push	ecx
	push	0
	mov	edx, DWORD PTR _cntxt$[ebp]
	push	edx
	call	_cgi_add_input
	add	esp, 24					; 00000018H
	test	eax, eax
	je	SHORT $L71158
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 1004		; 000003ecH
	jmp	SHORT $eva_err$71133
$L71158:

; 1006 : 	}

	jmp	$L71140
$eva_noerr$71159:

; 1007 : 
; 1008 : 	RETURN_OK_CLEANUP;

	push	0
	push	OFFSET FLAT:$SG71160
	push	OFFSET FLAT:$SG71161
	mov	ecx, DWORD PTR _cntxt$[ebp]
	push	ecx
	call	_err_clear
	add	esp, 16					; 00000010H
$eva_err$71133:
	mov	edx, DWORD PTR _cntxt$[ebp]
	cmp	DWORD PTR [edx+29872], 0
	je	SHORT $L71162
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	ecx, DWORD PTR [eax+29900]
	push	ecx
	push	OFFSET FLAT:$SG71163
	push	OFFSET FLAT:$SG71164
	mov	edx, DWORD PTR _cntxt$[ebp]
	push	edx
	call	_err_add_context
	add	esp, 16					; 00000010H
$L71162:
	mov	eax, DWORD PTR _parsed$[ebp]
	push	eax
	call	_mem_free
	add	esp, 4
	mov	DWORD PTR _parsed$[ebp], 0
	mov	ecx, DWORD PTR _cntxt$[ebp]
	xor	eax, eax
	cmp	DWORD PTR [ecx+29872], 0
	setne	al

; 1009 : }

	mov	esp, ebp
	pop	ebp
	ret	0
$L71879:
	DD	$L71122
	DD	$L71127
	DD	$L71121
	DD	$L71118
$L71878:
	DB	0
	DB	1
	DB	3
	DB	3
	DB	3
	DB	3
	DB	2
	DB	3
	DB	3
	DB	3
	DB	3
	DB	3
	DB	3
	DB	3
	DB	3
	DB	3
	DB	3
	DB	3
	DB	3
	DB	3
	DB	3
	DB	3
	DB	3
	DB	3
	DB	1
_cgi_read_urlencoded ENDP
_TEXT	ENDS
PUBLIC	_cgi_read_file
EXTRN	_dyntab_set_txt:NEAR
_DATA	SEGMENT
$SG71188 DB	'Bad filename format in CGI data', 00H
$SG71195 DB	'Bad value format in CGI data', 00H
	ORG $+3
$SG71203 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG71206 DB	'1', 00H
	ORG $+2
$SG71208 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG71210 DB	'_EVA_FILE_CLIENT_PATH', 00H
	ORG $+2
$SG71212 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG71216 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG71218 DB	'V', 00H
	ORG $+2
$SG71220 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG71221 DB	0dH, 0aH, 0dH, 0aH, 00H
	ORG $+3
$SG71224 DB	'_EVA_FILE_MIME_INFO', 00H
$SG71226 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG71229 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG71231 DB	'V', 00H
	ORG $+2
$SG71233 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG71235 DB	'1', 00H
	ORG $+2
$SG71237 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG71241 DB	'_EVA_FILE_USER_AGENT', 00H
	ORG $+3
$SG71243 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG71247 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG71249 DB	'V', 00H
	ORG $+2
$SG71251 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG71253 DB	'1', 00H
	ORG $+2
$SG71255 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG71258 DB	'_EVA_FILE_REMOTE_ADDR', 00H
	ORG $+2
$SG71260 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG71264 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG71266 DB	'V', 00H
	ORG $+2
$SG71268 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG71270 DB	'1', 00H
	ORG $+2
$SG71272 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG71273 DB	'D:\Travail\ABI\EVA\V4.0\CGI\Brunix-2016\cgi_utils.c', 00H
$SG71274 DB	'cgi_read_file', 00H
	ORG $+2
$SG71276 DB	'D:\Travail\ABI\EVA\V4.0\CGI\Brunix-2016\cgi_utils.c', 00H
$SG71277 DB	'cgi_read_file', 00H
_DATA	ENDS
_TEXT	SEGMENT
_cntxt$ = 8
_input$ = 12
_i_cgi$ = 16
_separator$ = 20
_sz_sep$ = 24
_k$ = -16
_cgi_file$ = -20
_v0$ = -24
_v1$ = -4
_v2$ = -8
_v3$ = -12
_newdest$71198 = -28
_cgi_read_file PROC NEAR

; 1026 : ){

	push	ebp
	mov	ebp, esp
	sub	esp, 28					; 0000001cH

; 1027 : 	int k = 0;

	mov	DWORD PTR _k$[ebp], 0

; 1028 : 	EVA_cgi_file *cgi_file;
; 1029 : 
; 1030 : 	/* Read file name */
; 1031 : 	char *v0 = *input;

	mov	eax, DWORD PTR _input$[ebp]
	mov	ecx, DWORD PTR [eax]
	mov	DWORD PTR _v0$[ebp], ecx

; 1032 : 	char *v1 = strchr(v0, '"');

	push	34					; 00000022H
	mov	edx, DWORD PTR _v0$[ebp]
	push	edx
	call	_strchr
	add	esp, 8
	mov	DWORD PTR _v1$[ebp], eax

; 1033 : 	char *v2, *v3;
; 1034 : 	if(!v1) RETURN_ERROR("Bad filename format in CGI data", NOP);

	cmp	DWORD PTR _v1$[ebp], 0
	jne	SHORT $L71186
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29872], OFFSET FLAT:$SG71188
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 1034		; 0000040aH
	jmp	$eva_err$71189
$L71186:

; 1035 : 
; 1036 : 	/* Find next value separator */
; 1037 : 	v2 = *input;

	mov	edx, DWORD PTR _input$[ebp]
	mov	eax, DWORD PTR [edx]
	mov	DWORD PTR _v2$[ebp], eax

; 1038 : 	v3 = cntxt->input->data + cntxt->input->cnt;

	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	edx, DWORD PTR [ecx+29644]
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	ecx, DWORD PTR [eax+29644]
	mov	eax, DWORD PTR [ecx+4]
	lea	ecx, DWORD PTR [edx+eax+8]
	mov	DWORD PTR _v3$[ebp], ecx
$L71191:

; 1039 : 	while(strncmp(v2, separator, sz_sep) && v2 < v3) v2++;

	mov	edx, DWORD PTR _sz_sep$[ebp]
	push	edx
	mov	eax, DWORD PTR _separator$[ebp]
	push	eax
	mov	ecx, DWORD PTR _v2$[ebp]
	push	ecx
	call	_strncmp
	add	esp, 12					; 0000000cH
	test	eax, eax
	je	SHORT $L71192
	mov	edx, DWORD PTR _v2$[ebp]
	cmp	edx, DWORD PTR _v3$[ebp]
	jae	SHORT $L71192
	mov	eax, DWORD PTR _v2$[ebp]
	add	eax, 1
	mov	DWORD PTR _v2$[ebp], eax
	jmp	SHORT $L71191
$L71192:

; 1040 : 	*input = v2;

	mov	ecx, DWORD PTR _input$[ebp]
	mov	edx, DWORD PTR _v2$[ebp]
	mov	DWORD PTR [ecx], edx

; 1041 : 	if(v2 == v3) RETURN_ERROR("Bad value format in CGI data", NOP);

	mov	eax, DWORD PTR _v2$[ebp]
	cmp	eax, DWORD PTR _v3$[ebp]
	jne	SHORT $L71193
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29872], OFFSET FLAT:$SG71195
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 1041		; 00000411H
	jmp	$eva_err$71189
$L71193:

; 1042 : 
; 1043 : 	/* Empty file name : skip value */
; 1044 : 	if(v0 == v1) RETURN_OK;

	mov	eax, DWORD PTR _v0$[ebp]
	cmp	eax, DWORD PTR _v1$[ebp]
	jne	SHORT $L71196
	jmp	$eva_noerr$71197
$L71196:

; 1045 : 
; 1046 : 	/* Add file data to cntxt->cgi_file */
; 1047 : 	M_REALLOC(EVA_cgi_file, cntxt->cgi_file, cntxt->cgi_file_nb);

	push	64					; 00000040H
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	edx, DWORD PTR [ecx+29664]
	shl	edx, 5
	push	edx
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	ecx, DWORD PTR [eax+29660]
	push	ecx
	call	_mem_realloc
	add	esp, 12					; 0000000cH
	mov	DWORD PTR _newdest$71198[ebp], eax
	cmp	DWORD PTR _newdest$71198[ebp], 0
	jne	SHORT $L71201
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29872], OFFSET FLAT:$SG71203
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 1047		; 00000417H
	jmp	$eva_err$71189
$L71201:
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	edx, DWORD PTR _newdest$71198[ebp]
	mov	DWORD PTR [ecx+29660], edx
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	ecx, DWORD PTR [eax+29664]
	add	ecx, 1
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29664], ecx

; 1048 : 	cgi_file = cntxt->cgi_file + (cntxt->cgi_file_nb - 1);

	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	ecx, DWORD PTR [eax+29664]
	sub	ecx, 1
	shl	ecx, 5
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	eax, DWORD PTR [edx+29660]
	add	eax, ecx
	mov	DWORD PTR _cgi_file$[ebp], eax

; 1049 : 	cgi_file->i_cgi = i_cgi;

	mov	ecx, DWORD PTR _cgi_file$[ebp]
	mov	edx, DWORD PTR _i_cgi$[ebp]
	mov	DWORD PTR [ecx+28], edx

; 1050 : 
; 1051 : 	/* Add path to object data */
; 1052 : 	DYNTAB_SET(&cgi_file->descr, k, 3, "1");

	push	1
	push	OFFSET FLAT:$SG71206
	push	3
	mov	eax, DWORD PTR _k$[ebp]
	push	eax
	mov	ecx, DWORD PTR _cgi_file$[ebp]
	add	ecx, 8
	push	ecx
	call	_dyntab_set_txt
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L71205
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29872], OFFSET FLAT:$SG71208
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 1052		; 0000041cH
	jmp	$eva_err$71189
$L71205:

; 1053 : 	DYNTAB_SET(&cgi_file->descr, k, 0, "_EVA_FILE_CLIENT_PATH");

	push	21					; 00000015H
	push	OFFSET FLAT:$SG71210
	push	0
	mov	ecx, DWORD PTR _k$[ebp]
	push	ecx
	mov	edx, DWORD PTR _cgi_file$[ebp]
	add	edx, 8
	push	edx
	call	_dyntab_set_txt
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L71209
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29872], OFFSET FLAT:$SG71212
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 1053		; 0000041dH
	jmp	$eva_err$71189
$L71209:

; 1054 : 	DYNTAB_ADD(&cgi_file->descr, k, 1, v0, v1 - v0, NO_CONV);

	push	0
	push	0
	mov	edx, DWORD PTR _v1$[ebp]
	sub	edx, DWORD PTR _v0$[ebp]
	push	edx
	mov	eax, DWORD PTR _v0$[ebp]
	push	eax
	push	1
	mov	ecx, DWORD PTR _k$[ebp]
	push	ecx
	mov	edx, DWORD PTR _cgi_file$[ebp]
	add	edx, 8
	push	edx
	call	_dyntab_add
	add	esp, 28					; 0000001cH
	test	eax, eax
	je	SHORT $L71214
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29872], OFFSET FLAT:$SG71216
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 1054		; 0000041eH
	jmp	$eva_err$71189
$L71214:

; 1055 : 	DYNTAB_SET(&cgi_file->descr, k, 2, "V");

	push	1
	push	OFFSET FLAT:$SG71218
	push	2
	mov	edx, DWORD PTR _k$[ebp]
	push	edx
	mov	eax, DWORD PTR _cgi_file$[ebp]
	add	eax, 8
	push	eax
	call	_dyntab_set_txt
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L71217
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29872], OFFSET FLAT:$SG71220
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 1055		; 0000041fH
	jmp	$eva_err$71189
$L71217:

; 1056 : 	k++;

	mov	eax, DWORD PTR _k$[ebp]
	add	eax, 1
	mov	DWORD PTR _k$[ebp], eax

; 1057 : 
; 1058 : 	/* Find file MIME cgi_file->descr & add to object cgi_file->descr */
; 1059 : 	v2 = strstr(v1, "\r\n\r\n");

	push	OFFSET FLAT:$SG71221
	mov	ecx, DWORD PTR _v1$[ebp]
	push	ecx
	call	_strstr
	add	esp, 8
	mov	DWORD PTR _v2$[ebp], eax

; 1060 : 	if(v2 > v1 + 8)

	mov	edx, DWORD PTR _v1$[ebp]
	add	edx, 8
	cmp	DWORD PTR _v2$[ebp], edx
	jbe	$L71222

; 1062 : 		DYNTAB_SET(&cgi_file->descr, k, 0, "_EVA_FILE_MIME_INFO");

	push	19					; 00000013H
	push	OFFSET FLAT:$SG71224
	push	0
	mov	eax, DWORD PTR _k$[ebp]
	push	eax
	mov	ecx, DWORD PTR _cgi_file$[ebp]
	add	ecx, 8
	push	ecx
	call	_dyntab_set_txt
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L71223
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29872], OFFSET FLAT:$SG71226
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 1062		; 00000426H
	jmp	$eva_err$71189
$L71223:

; 1063 : 		DYNTAB_ADD(&cgi_file->descr, k, 1, v1+3, v2 - v1 - 3, CRLF_TO_LF);

	push	1
	push	OFFSET FLAT:_crlf_to_lf
	mov	ecx, DWORD PTR _v2$[ebp]
	sub	ecx, DWORD PTR _v1$[ebp]
	sub	ecx, 3
	push	ecx
	mov	edx, DWORD PTR _v1$[ebp]
	add	edx, 3
	push	edx
	push	1
	mov	eax, DWORD PTR _k$[ebp]
	push	eax
	mov	ecx, DWORD PTR _cgi_file$[ebp]
	add	ecx, 8
	push	ecx
	call	_dyntab_add
	add	esp, 28					; 0000001cH
	test	eax, eax
	je	SHORT $L71227
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29872], OFFSET FLAT:$SG71229
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 1063		; 00000427H
	jmp	$eva_err$71189
$L71227:

; 1064 : 		DYNTAB_SET(&cgi_file->descr, k, 2, "V");

	push	1
	push	OFFSET FLAT:$SG71231
	push	2
	mov	ecx, DWORD PTR _k$[ebp]
	push	ecx
	mov	edx, DWORD PTR _cgi_file$[ebp]
	add	edx, 8
	push	edx
	call	_dyntab_set_txt
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L71230
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29872], OFFSET FLAT:$SG71233
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 1064		; 00000428H
	jmp	$eva_err$71189
$L71230:

; 1065 : 		DYNTAB_SET(&cgi_file->descr, k, 3, "1");

	push	1
	push	OFFSET FLAT:$SG71235
	push	3
	mov	edx, DWORD PTR _k$[ebp]
	push	edx
	mov	eax, DWORD PTR _cgi_file$[ebp]
	add	eax, 8
	push	eax
	call	_dyntab_set_txt
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L71234
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29872], OFFSET FLAT:$SG71237
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 1065		; 00000429H
	jmp	$eva_err$71189
$L71234:

; 1066 : 		k++;

	mov	eax, DWORD PTR _k$[ebp]
	add	eax, 1
	mov	DWORD PTR _k$[ebp], eax
$L71222:

; 1068 : 
; 1069 : 	/* Store file data location */
; 1070 : 	if((*input - v2) > 6) cgi_file->len = *input - v2 - 6;

	mov	ecx, DWORD PTR _input$[ebp]
	mov	edx, DWORD PTR [ecx]
	sub	edx, DWORD PTR _v2$[ebp]
	cmp	edx, 6
	jle	SHORT $L71238
	mov	eax, DWORD PTR _input$[ebp]
	mov	ecx, DWORD PTR [eax]
	sub	ecx, DWORD PTR _v2$[ebp]
	sub	ecx, 6
	mov	edx, DWORD PTR _cgi_file$[ebp]
	mov	DWORD PTR [edx+4], ecx
$L71238:

; 1071 : 	cgi_file->data = v2 + 4;

	mov	eax, DWORD PTR _v2$[ebp]
	add	eax, 4
	mov	ecx, DWORD PTR _cgi_file$[ebp]
	mov	DWORD PTR [ecx], eax

; 1072 : 
; 1073 : 	/* Get HTTP_USER_AGENT env var & add to object cgi_file->descr */
; 1074 : 	v3 = cntxt->user_agent;

	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	eax, DWORD PTR [edx+29748]
	mov	DWORD PTR _v3$[ebp], eax

; 1075 : 	if(v3 && *v3)

	cmp	DWORD PTR _v3$[ebp], 0
	je	$L71239
	mov	ecx, DWORD PTR _v3$[ebp]
	movsx	edx, BYTE PTR [ecx]
	test	edx, edx
	je	$L71239

; 1077 : 		DYNTAB_SET(&cgi_file->descr, k, 0, "_EVA_FILE_USER_AGENT");

	push	20					; 00000014H
	push	OFFSET FLAT:$SG71241
	push	0
	mov	eax, DWORD PTR _k$[ebp]
	push	eax
	mov	ecx, DWORD PTR _cgi_file$[ebp]
	add	ecx, 8
	push	ecx
	call	_dyntab_set_txt
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L71240
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29872], OFFSET FLAT:$SG71243
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 1077		; 00000435H
	jmp	$eva_err$71189
$L71240:

; 1078 : 		DYNTAB_ADD(&cgi_file->descr, k, 1, v3, strlen(v3), NO_CONV);

	push	0
	push	0
	mov	ecx, DWORD PTR _v3$[ebp]
	push	ecx
	call	_strlen
	add	esp, 4
	push	eax
	mov	edx, DWORD PTR _v3$[ebp]
	push	edx
	push	1
	mov	eax, DWORD PTR _k$[ebp]
	push	eax
	mov	ecx, DWORD PTR _cgi_file$[ebp]
	add	ecx, 8
	push	ecx
	call	_dyntab_add
	add	esp, 28					; 0000001cH
	test	eax, eax
	je	SHORT $L71245
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29872], OFFSET FLAT:$SG71247
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 1078		; 00000436H
	jmp	$eva_err$71189
$L71245:

; 1079 : 		DYNTAB_SET(&cgi_file->descr, k, 2, "V");

	push	1
	push	OFFSET FLAT:$SG71249
	push	2
	mov	ecx, DWORD PTR _k$[ebp]
	push	ecx
	mov	edx, DWORD PTR _cgi_file$[ebp]
	add	edx, 8
	push	edx
	call	_dyntab_set_txt
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L71248
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29872], OFFSET FLAT:$SG71251
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 1079		; 00000437H
	jmp	$eva_err$71189
$L71248:

; 1080 : 		DYNTAB_SET(&cgi_file->descr, k, 3, "1");

	push	1
	push	OFFSET FLAT:$SG71253
	push	3
	mov	edx, DWORD PTR _k$[ebp]
	push	edx
	mov	eax, DWORD PTR _cgi_file$[ebp]
	add	eax, 8
	push	eax
	call	_dyntab_set_txt
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L71252
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29872], OFFSET FLAT:$SG71255
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 1080		; 00000438H
	jmp	$eva_err$71189
$L71252:

; 1081 : 		k++;

	mov	eax, DWORD PTR _k$[ebp]
	add	eax, 1
	mov	DWORD PTR _k$[ebp], eax
$L71239:

; 1083 : 
; 1084 : 	/* Get REMOTE_ADDR en var & add to object cgi_file->descr */
; 1085 : 	v3 = cntxt->user_ip;

	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	edx, DWORD PTR [ecx+29732]
	mov	DWORD PTR _v3$[ebp], edx

; 1086 : 	if(v3 && *v3)

	cmp	DWORD PTR _v3$[ebp], 0
	je	$eva_noerr$71197
	mov	eax, DWORD PTR _v3$[ebp]
	movsx	ecx, BYTE PTR [eax]
	test	ecx, ecx
	je	$eva_noerr$71197

; 1088 : 		DYNTAB_SET(&cgi_file->descr, k, 0, "_EVA_FILE_REMOTE_ADDR");

	push	21					; 00000015H
	push	OFFSET FLAT:$SG71258
	push	0
	mov	edx, DWORD PTR _k$[ebp]
	push	edx
	mov	eax, DWORD PTR _cgi_file$[ebp]
	add	eax, 8
	push	eax
	call	_dyntab_set_txt
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L71257
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29872], OFFSET FLAT:$SG71260
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 1088		; 00000440H
	jmp	$eva_err$71189
$L71257:

; 1089 : 		DYNTAB_ADD(&cgi_file->descr, k, 1, v3, strlen(v3), NO_CONV);

	push	0
	push	0
	mov	eax, DWORD PTR _v3$[ebp]
	push	eax
	call	_strlen
	add	esp, 4
	push	eax
	mov	ecx, DWORD PTR _v3$[ebp]
	push	ecx
	push	1
	mov	edx, DWORD PTR _k$[ebp]
	push	edx
	mov	eax, DWORD PTR _cgi_file$[ebp]
	add	eax, 8
	push	eax
	call	_dyntab_add
	add	esp, 28					; 0000001cH
	test	eax, eax
	je	SHORT $L71262
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29872], OFFSET FLAT:$SG71264
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 1089		; 00000441H
	jmp	$eva_err$71189
$L71262:

; 1090 : 		DYNTAB_SET(&cgi_file->descr, k, 2, "V");

	push	1
	push	OFFSET FLAT:$SG71266
	push	2
	mov	eax, DWORD PTR _k$[ebp]
	push	eax
	mov	ecx, DWORD PTR _cgi_file$[ebp]
	add	ecx, 8
	push	ecx
	call	_dyntab_set_txt
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L71265
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29872], OFFSET FLAT:$SG71268
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 1090		; 00000442H
	jmp	SHORT $eva_err$71189
$L71265:

; 1091 : 		DYNTAB_SET(&cgi_file->descr, k, 3, "1");

	push	1
	push	OFFSET FLAT:$SG71270
	push	3
	mov	ecx, DWORD PTR _k$[ebp]
	push	ecx
	mov	edx, DWORD PTR _cgi_file$[ebp]
	add	edx, 8
	push	edx
	call	_dyntab_set_txt
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L71269
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29872], OFFSET FLAT:$SG71272
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 1091		; 00000443H
	jmp	SHORT $eva_err$71189
$L71269:

; 1092 : 		k++;

	mov	edx, DWORD PTR _k$[ebp]
	add	edx, 1
	mov	DWORD PTR _k$[ebp], edx
$eva_noerr$71197:

; 1094 : 
; 1095 : 	RETURN_OK_CLEANUP;

	push	0
	push	OFFSET FLAT:$SG71273
	push	OFFSET FLAT:$SG71274
	mov	eax, DWORD PTR _cntxt$[ebp]
	push	eax
	call	_err_clear
	add	esp, 16					; 00000010H
$eva_err$71189:
	mov	ecx, DWORD PTR _cntxt$[ebp]
	cmp	DWORD PTR [ecx+29872], 0
	je	SHORT $L71275
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	eax, DWORD PTR [edx+29900]
	push	eax
	push	OFFSET FLAT:$SG71276
	push	OFFSET FLAT:$SG71277
	mov	ecx, DWORD PTR _cntxt$[ebp]
	push	ecx
	call	_err_add_context
	add	esp, 16					; 00000010H
$L71275:
	mov	edx, DWORD PTR _cntxt$[ebp]
	xor	eax, eax
	cmp	DWORD PTR [edx+29872], 0
	setne	al

; 1096 : }

	mov	esp, ebp
	pop	ebp
	ret	0
_cgi_read_file ENDP
_TEXT	ENDS
PUBLIC	_file_find_duplicate
EXTRN	_fread:NEAR
EXTRN	_qry_listobj_field:NEAR
_DATA	SEGMENT
	ORG $+2
$SG71300 DB	'%lu', 00H
$SG71306 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG71309 DB	'_EVA_FILE_SIZE', 00H
	ORG $+1
$SG71310 DB	'-- file_find_duplicate', 0aH, 'SELECT DISTINCT IdObj FRO'
	DB	'M TLink WHERE IdValue=%lu AND IdField=%lu AND DateDel IS NULL'
	DB	00H
	ORG $+2
$SG71314 DB	'_EVA_FILE_SERVER_NAME', 00H
	ORG $+2
$SG71324 DB	'rb', 00H
	ORG $+1
$SG71330 DB	'%lu', 00H
$SG71334 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG71336 DB	'Server file : ', 00H
	ORG $+1
$SG71339 DB	'Le fichier est d', 0e9H, 'j', 0e0H, ' sur le serveur', 00H
	ORG $+1
$SG71340 DB	'D:\Travail\ABI\EVA\V4.0\CGI\Brunix-2016\cgi_utils.c', 00H
$SG71341 DB	'file_find_duplicate', 00H
$SG71343 DB	'D:\Travail\ABI\EVA\V4.0\CGI\Brunix-2016\cgi_utils.c', 00H
$SG71344 DB	'file_find_duplicate', 00H
_DATA	ENDS
_TEXT	SEGMENT
_cntxt$ = 8
_idobj$ = 12
_txt$ = 16
_sz$ = 20
_data$ = -1052
_sql$ = -1024
_sztxt$ = -1072
_i$ = -1076
_f$ = -1056
_buf$ = -1032
_idval$ = -1028
_size1$71303 = -1080
_c$71318 = -1120
_fs$71319 = -1116
_sz1$71320 = -1124
__tmp$71329 = -1156
_file_find_duplicate PROC NEAR

; 1111 : ){

	push	ebp
	mov	ebp, esp
	sub	esp, 1156				; 00000484H
	push	edi

; 1112 : 	DynTable data = { 0 };

	mov	DWORD PTR _data$[ebp], 0
	xor	eax, eax
	mov	DWORD PTR _data$[ebp+4], eax
	mov	DWORD PTR _data$[ebp+8], eax
	mov	DWORD PTR _data$[ebp+12], eax
	mov	DWORD PTR _data$[ebp+16], eax

; 1113 : 	char sql[1024];
; 1114 : 	char sztxt[16];
; 1115 : 	unsigned long i;
; 1116 : 	FILE *f = NULL;

	mov	DWORD PTR _f$[ebp], 0

; 1117 : 	char *buf = NULL;

	mov	DWORD PTR _buf$[ebp], 0

; 1118 : 
; 1119 : 	/* Get IdValue of file size - return if not found */
; 1120 : 	unsigned long idval = get_id_value(cntxt, sztxt, snprintf(add_sz_str(sztxt), "%lu", sz));

	mov	ecx, DWORD PTR _sz$[ebp]
	push	ecx
	push	OFFSET FLAT:$SG71300
	push	15					; 0000000fH
	lea	edx, DWORD PTR _sztxt$[ebp]
	push	edx
	call	__snprintf
	add	esp, 16					; 00000010H
	push	eax
	lea	eax, DWORD PTR _sztxt$[ebp]
	push	eax
	mov	ecx, DWORD PTR _cntxt$[ebp]
	push	ecx
	call	_get_id_value
	add	esp, 12					; 0000000cH
	mov	DWORD PTR _idval$[ebp], eax

; 1121 : 	dyntab_free(idobj);

	mov	edx, DWORD PTR _idobj$[ebp]
	push	edx
	call	_dyntab_free
	add	esp, 4

; 1122 : 	if(!idval) RETURN_OK;

	cmp	DWORD PTR _idval$[ebp], 0
	jne	SHORT $L71301
	jmp	$eva_noerr$71302
$L71301:

; 1123 : 	M_ALLOC(buf, sz);

	mov	eax, DWORD PTR _sz$[ebp]
	mov	DWORD PTR _size1$71303[ebp], eax
	mov	ecx, DWORD PTR _size1$71303[ebp]
	push	ecx
	call	_mem_alloc
	add	esp, 4
	mov	DWORD PTR _buf$[ebp], eax
	cmp	DWORD PTR _size1$71303[ebp], 0
	je	SHORT $L71304
	cmp	DWORD PTR _buf$[ebp], 0
	jne	SHORT $L71304
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29872], OFFSET FLAT:$SG71306
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 1123		; 00000463H
	jmp	$eva_err$71307
$L71304:

; 1124 : 
; 1125 : 	/* Build & exec query for files with this size */
; 1126 : 	snprintf(add_sz_str(sql),
; 1127 : 		"-- file_find_duplicate\n"
; 1128 : 		"SELECT DISTINCT IdObj FROM TLink WHERE "
; 1129 : 		"IdValue=%lu AND IdField=%lu AND DateDel IS NULL",
; 1130 : 		idval, IDVAL("_EVA_FILE_SIZE"));

	push	14					; 0000000eH
	push	OFFSET FLAT:$SG71309
	mov	ecx, DWORD PTR _cntxt$[ebp]
	push	ecx
	call	_get_id_value
	add	esp, 12					; 0000000cH
	push	eax
	mov	edx, DWORD PTR _idval$[ebp]
	push	edx
	push	OFFSET FLAT:$SG71310
	push	1023					; 000003ffH
	lea	eax, DWORD PTR _sql$[ebp]
	push	eax
	call	__snprintf
	add	esp, 20					; 00000014H

; 1131 : 	if(sql_exec_query(cntxt, sql) || sql_get_table(cntxt, idobj, 0)) STACK_ERROR;

	lea	ecx, DWORD PTR _sql$[ebp]
	push	ecx
	mov	edx, DWORD PTR _cntxt$[ebp]
	push	edx
	call	_sql_exec_query
	add	esp, 8
	test	eax, eax
	jne	SHORT $L71312
	push	0
	mov	eax, DWORD PTR _idobj$[ebp]
	push	eax
	mov	ecx, DWORD PTR _cntxt$[ebp]
	push	ecx
	call	_sql_get_table
	add	esp, 12					; 0000000cH
	test	eax, eax
	je	SHORT $L71311
$L71312:
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 1131		; 0000046bH
	jmp	$eva_err$71307
$L71311:

; 1132 : 	if(idobj->nbrows &&
; 1133 : 		qry_listobj_field(cntxt, &data, idobj, "_EVA_FILE_SERVER_NAME")) STACK_ERROR;

	mov	eax, DWORD PTR _idobj$[ebp]
	cmp	DWORD PTR [eax], 0
	je	SHORT $L71313
	push	OFFSET FLAT:$SG71314
	mov	ecx, DWORD PTR _idobj$[ebp]
	push	ecx
	lea	edx, DWORD PTR _data$[ebp]
	push	edx
	mov	eax, DWORD PTR _cntxt$[ebp]
	push	eax
	call	_qry_listobj_field
	add	esp, 16					; 00000010H
	test	eax, eax
	je	SHORT $L71313
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 1133		; 0000046dH
	jmp	$eva_err$71307
$L71313:

; 1134 : 	dyntab_free(idobj);

	mov	edx, DWORD PTR _idobj$[ebp]
	push	edx
	call	_dyntab_free
	add	esp, 4

; 1135 : 
; 1136 : 	/* For each found file */
; 1137 : 	for(i = 0; i < data.nbrows && !idobj->nbrows; i++)

	mov	DWORD PTR _i$[ebp], 0
	jmp	SHORT $L71315
$L71316:
	mov	eax, DWORD PTR _i$[ebp]
	add	eax, 1
	mov	DWORD PTR _i$[ebp], eax
$L71315:
	mov	ecx, DWORD PTR _i$[ebp]
	cmp	ecx, DWORD PTR _data$[ebp]
	jae	$eva_noerr$71302
	mov	edx, DWORD PTR _idobj$[ebp]
	cmp	DWORD PTR [edx], 0
	jne	$eva_noerr$71302

; 1139 : 		/* Check actual size - ignore if different or not found */
; 1140 : 		DynTableCell *c = dyntab_cell(&data, i, 0);

	push	0
	mov	eax, DWORD PTR _i$[ebp]
	push	eax
	lea	ecx, DWORD PTR _data$[ebp]
	push	ecx
	call	_dyntab_cell
	add	esp, 12					; 0000000cH
	mov	DWORD PTR _c$71318[ebp], eax

; 1141 : 		struct stat fs;
; 1142 : 		size_t sz1 = 0;

	mov	DWORD PTR _sz1$71320[ebp], 0

; 1143 : 		if(stat(c->txt, &fs) || (size_t)fs.st_size != sz) continue;

	lea	edx, DWORD PTR _fs$71319[ebp]
	push	edx
	mov	eax, DWORD PTR _c$71318[ebp]
	mov	ecx, DWORD PTR [eax]
	push	ecx
	call	_stat
	add	esp, 8
	test	eax, eax
	jne	SHORT $L71323
	mov	edx, DWORD PTR _fs$71319[ebp+20]
	cmp	edx, DWORD PTR _sz$[ebp]
	je	SHORT $L71322
$L71323:
	jmp	SHORT $L71316
$L71322:

; 1144 : 
; 1145 : 		/* Same size : read file contents & close - ignore file on error */
; 1146 : 		f = fopen(c->txt, "rb");

	push	OFFSET FLAT:$SG71324
	mov	eax, DWORD PTR _c$71318[ebp]
	mov	ecx, DWORD PTR [eax]
	push	ecx
	call	_fopen
	add	esp, 8
	mov	DWORD PTR _f$[ebp], eax

; 1147 : 		if(!f) continue;

	cmp	DWORD PTR _f$[ebp], 0
	jne	SHORT $L71325
	jmp	$L71316
$L71325:

; 1148 : 		*buf = (char)(*txt + 1);

	mov	edx, DWORD PTR _txt$[ebp]
	movsx	eax, BYTE PTR [edx]
	add	eax, 1
	mov	ecx, DWORD PTR _buf$[ebp]
	mov	BYTE PTR [ecx], al

; 1149 : 		sz1 = fread(buf, sz, 1, f);

	mov	edx, DWORD PTR _f$[ebp]
	push	edx
	push	1
	mov	eax, DWORD PTR _sz$[ebp]
	push	eax
	mov	ecx, DWORD PTR _buf$[ebp]
	push	ecx
	call	_fread
	add	esp, 16					; 00000010H
	mov	DWORD PTR _sz1$71320[ebp], eax

; 1150 : 		fclose(f);

	mov	edx, DWORD PTR _f$[ebp]
	push	edx
	call	_fclose
	add	esp, 4

; 1151 : 
; 1152 : 		/* Ignore if files differ */
; 1153 : 		if(sz1 != 1 || memcmp(buf, txt, sz)) continue;

	cmp	DWORD PTR _sz1$71320[ebp], 1
	jne	SHORT $L71328
	mov	eax, DWORD PTR _sz$[ebp]
	push	eax
	mov	ecx, DWORD PTR _txt$[ebp]
	push	ecx
	mov	edx, DWORD PTR _buf$[ebp]
	push	edx
	call	_memcmp
	add	esp, 12					; 0000000cH
	test	eax, eax
	je	SHORT $L71327
$L71328:
	jmp	$L71316
$L71327:

; 1154 : 
; 1155 : 		/* Duplicate found : set result */
; 1156 : 		DYNTAB_ADD_INT(idobj, idobj->nbrows, 0, c->IdObj);

	mov	BYTE PTR __tmp$71329[ebp], 0
	mov	ecx, 7
	xor	eax, eax
	lea	edi, DWORD PTR __tmp$71329[ebp+1]
	rep stosd
	stosw
	stosb
	mov	eax, DWORD PTR _c$71318[ebp]
	mov	ecx, DWORD PTR [eax+20]
	push	ecx
	push	OFFSET FLAT:$SG71330
	lea	edx, DWORD PTR __tmp$71329[ebp]
	push	edx
	call	_sprintf
	add	esp, 12					; 0000000cH
	push	0
	push	0
	push	0
	lea	eax, DWORD PTR __tmp$71329[ebp]
	push	eax
	push	0
	mov	ecx, DWORD PTR _idobj$[ebp]
	mov	edx, DWORD PTR [ecx]
	push	edx
	mov	eax, DWORD PTR _idobj$[ebp]
	push	eax
	call	_dyntab_add
	add	esp, 28					; 0000001cH
	test	eax, eax
	je	SHORT $L71332
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29872], OFFSET FLAT:$SG71334
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 1156		; 00000484H
	jmp	SHORT $eva_err$71307
$L71332:

; 1157 : 		ERR_PUT_TXT("Server file : ", c->txt, c->len);

	push	0
	push	0
	push	14					; 0000000eH
	push	OFFSET FLAT:$SG71336
	mov	eax, DWORD PTR _cntxt$[ebp]
	add	eax, 29876				; 000074b4H
	push	eax
	call	_dynbuf_add
	add	esp, 20					; 00000014H
	push	0
	push	0
	mov	ecx, DWORD PTR _c$71318[ebp]
	mov	edx, DWORD PTR [ecx+4]
	push	edx
	mov	eax, DWORD PTR _c$71318[ebp]
	mov	ecx, DWORD PTR [eax]
	push	ecx
	mov	edx, DWORD PTR _cntxt$[ebp]
	add	edx, 29876				; 000074b4H
	push	edx
	call	_dynbuf_add
	add	esp, 20					; 00000014H

; 1158 : 		RETURN_ERROR("Le fichier est déjà sur le serveur", NOP)

	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29872], OFFSET FLAT:$SG71339
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 1158		; 00000486H
	jmp	SHORT $eva_err$71307
$eva_noerr$71302:

; 1160 : 
; 1161 : 	RETURN_OK_CLEANUP;

	push	0
	push	OFFSET FLAT:$SG71340
	push	OFFSET FLAT:$SG71341
	mov	edx, DWORD PTR _cntxt$[ebp]
	push	edx
	call	_err_clear
	add	esp, 16					; 00000010H
$eva_err$71307:
	mov	eax, DWORD PTR _cntxt$[ebp]
	cmp	DWORD PTR [eax+29872], 0
	je	SHORT $L71342
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	edx, DWORD PTR [ecx+29900]
	push	edx
	push	OFFSET FLAT:$SG71343
	push	OFFSET FLAT:$SG71344
	mov	eax, DWORD PTR _cntxt$[ebp]
	push	eax
	call	_err_add_context
	add	esp, 16					; 00000010H
$L71342:
	lea	ecx, DWORD PTR _data$[ebp]
	push	ecx
	call	_dyntab_free
	add	esp, 4
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

; 1162 : }

	pop	edi
	mov	esp, ebp
	pop	ebp
	ret	0
_file_find_duplicate ENDP
_TEXT	ENDS
PUBLIC	_cgi_save_files
EXTRN	_fwrite:NEAR
EXTRN	_chdir_db_doc:NEAR
EXTRN	_file_compatible_name:NEAR
EXTRN	_qry_add_obj_data:NEAR
EXTRN	_dyntab_copy:NEAR
EXTRN	_strrchr:NEAR
_BSS	SEGMENT
	ALIGN	4

$SG71414 DB	01H DUP (?)
_BSS	ENDS
_DATA	SEGMENT
$SG71361 DB	'_EVA_FORM_FILEUPLOAD', 00H
	ORG $+3
$SG71363 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG71383 DB	'SAVETO=', 00H
$SG71386 DB	'%s', 00H
	ORG $+1
$SG71387 DB	'wb', 00H
	ORG $+1
$SG71390 DB	'Cannot create file in subdirectory', 00H
	ORG $+1
$SG71393 DB	'Cannot write downloaded file', 00H
	ORG $+3
$SG71400 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG71405 DB	'D:\Travail\ABI\EVA\V4.0\CGI\Brunix-2016\cgi_utils.c', 00H
$SG71406 DB	'cgi_save_files', 00H
	ORG $+1
$SG71415 DB	'%.*s%s%s', 00H
	ORG $+3
$SG71416 DB	'#%lu', 00H
	ORG $+3
$SG71417 DB	'wb', 00H
	ORG $+1
$SG71420 DB	'Cannot create file in docs directory', 00H
	ORG $+3
$SG71423 DB	'Cannot write downloaded file', 00H
	ORG $+3
$SG71426 DB	'_EVA_FILE_SIZE', 00H
	ORG $+1
$SG71428 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG71431 DB	'%lu', 00H
$SG71435 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG71437 DB	'V', 00H
	ORG $+2
$SG71439 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG71441 DB	'1', 00H
	ORG $+2
$SG71443 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG71445 DB	'_EVA_FILE_SERVER_NAME', 00H
	ORG $+2
$SG71447 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG71451 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG71453 DB	'V', 00H
	ORG $+2
$SG71455 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG71457 DB	'1', 00H
	ORG $+2
$SG71459 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG71463 DB	'_EVA_OBJ', 00H
	ORG $+3
$SG71465 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG71467 DB	'%lu', 00H
$SG71471 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG71473 DB	'R', 00H
	ORG $+2
$SG71475 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG71477 DB	'1', 00H
	ORG $+2
$SG71479 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG71482 DB	'_EVA_CTRL', 00H
	ORG $+2
$SG71484 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG71486 DB	'%lu', 00H
$SG71490 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG71492 DB	'R', 00H
	ORG $+2
$SG71494 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG71496 DB	'1', 00H
	ORG $+2
$SG71498 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG71501 DB	'_EVA_FORM', 00H
	ORG $+2
$SG71503 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG71505 DB	'%lu', 00H
$SG71509 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG71511 DB	'R', 00H
	ORG $+2
$SG71513 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG71515 DB	'1', 00H
	ORG $+2
$SG71517 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG71519 DB	'FILE_DESCRIPTION', 00H
	ORG $+3
$SG71522 DB	'_EVA_NOTES', 00H
	ORG $+1
$SG71524 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG71527 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG71529 DB	'V', 00H
	ORG $+2
$SG71531 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG71533 DB	'1', 00H
	ORG $+2
$SG71535 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG71542 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG71546 DB	'D:\Travail\ABI\EVA\V4.0\CGI\Brunix-2016\cgi_utils.c', 00H
$SG71547 DB	'cgi_save_files', 00H
	ORG $+1
$SG71549 DB	'D:\Travail\ABI\EVA\V4.0\CGI\Brunix-2016\cgi_utils.c', 00H
$SG71550 DB	'cgi_save_files', 00H
_DATA	ENDS
_TEXT	SEGMENT
_cntxt$ = 8
_id_obj$ = -64
_id_form$ = -20
_data$ = -40
_name$ = -1096
_f$ = -44
_i$ = -68
_k$ = -72
_cgi_file$71371 = -1140
_cgi$71372 = -1132
_bname$71374 = -1100
_ext$71375 = -1136
_sz_ext$71376 = -1128
_sz0$71377 = -1124
_serial$71378 = -1116
_sz_max$71379 = -1120
_size$71395 = -1144
_src$71396 = -1148
_size1$71397 = -1152
_iserial$71408 = -1192
_fs$71409 = -1188
__tmp$71429 = -1224
__tmp$71466 = -1256
__tmp$71485 = -1288
__tmp$71504 = -1320
_size$71537 = -1324
_src$71538 = -1328
_size1$71539 = -1332
_cgi_save_files PROC NEAR

; 1177 : ){

	push	ebp
	mov	ebp, esp
	sub	esp, 1348				; 00000544H
	push	edi

; 1178 : 	DynTable id_obj = { 0 };

	mov	DWORD PTR _id_obj$[ebp], 0
	xor	eax, eax
	mov	DWORD PTR _id_obj$[ebp+4], eax
	mov	DWORD PTR _id_obj$[ebp+8], eax
	mov	DWORD PTR _id_obj$[ebp+12], eax
	mov	DWORD PTR _id_obj$[ebp+16], eax

; 1179 : 	DynTable id_form = { 0 };

	mov	DWORD PTR _id_form$[ebp], 0
	xor	ecx, ecx
	mov	DWORD PTR _id_form$[ebp+4], ecx
	mov	DWORD PTR _id_form$[ebp+8], ecx
	mov	DWORD PTR _id_form$[ebp+12], ecx
	mov	DWORD PTR _id_form$[ebp+16], ecx

; 1180 : 	DynTable data = { 0 };

	mov	DWORD PTR _data$[ebp], 0
	xor	edx, edx
	mov	DWORD PTR _data$[ebp+4], edx
	mov	DWORD PTR _data$[ebp+8], edx
	mov	DWORD PTR _data$[ebp+12], edx
	mov	DWORD PTR _data$[ebp+16], edx

; 1181 : 	char name[1024];
; 1182 : 	FILE *f = NULL;

	mov	DWORD PTR _f$[ebp], 0

; 1183 : 	unsigned long i, k;
; 1184 : 
; 1185 : 	/* Get uploaded files form id form conf data - return if none */
; 1186 : 	DYNTAB_FIELD(&id_form, &cntxt->cnf_data, FORM_FILEUPLOAD)

	lea	eax, DWORD PTR _id_form$[ebp]
	push	eax
	call	_dyntab_free
	add	esp, 4
	push	0
	push	-1
	push	OFFSET FLAT:$SG71361
	mov	ecx, DWORD PTR _cntxt$[ebp]
	add	ecx, 29360				; 000072b0H
	push	ecx
	push	0
	lea	edx, DWORD PTR _id_form$[ebp]
	push	edx
	call	_dyntab_filter_field
	add	esp, 24					; 00000018H
	test	eax, eax
	je	SHORT $L71360
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29872], OFFSET FLAT:$SG71363
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 1186		; 000004a2H
	jmp	$eva_err$71364
$L71360:

; 1187 : 	if(!cntxt->cgi_file || !cntxt->cgi_file_nb || !id_form.nbrows) RETURN_OK;

	mov	edx, DWORD PTR _cntxt$[ebp]
	cmp	DWORD PTR [edx+29660], 0
	je	SHORT $L71366
	mov	eax, DWORD PTR _cntxt$[ebp]
	cmp	DWORD PTR [eax+29664], 0
	je	SHORT $L71366
	cmp	DWORD PTR _id_form$[ebp], 0
	jne	SHORT $L71365
$L71366:
	jmp	$eva_noerr$71367
$L71365:

; 1188 : 
; 1189 : 	/* For each uploaded file */
; 1190 : 	for(i = 0; i < cntxt->cgi_file_nb; i++)

	mov	DWORD PTR _i$[ebp], 0
	jmp	SHORT $L71368
$L71369:
	mov	ecx, DWORD PTR _i$[ebp]
	add	ecx, 1
	mov	DWORD PTR _i$[ebp], ecx
$L71368:
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	eax, DWORD PTR _i$[ebp]
	cmp	eax, DWORD PTR [edx+29664]
	jae	$L71370

; 1192 : 		EVA_cgi_file *cgi_file = cntxt->cgi_file + i;

	mov	ecx, DWORD PTR _i$[ebp]
	shl	ecx, 5
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	eax, DWORD PTR [edx+29660]
	add	eax, ecx
	mov	DWORD PTR _cgi_file$71371[ebp], eax

; 1193 : 		CGIData *cgi = cntxt->cgi ? cntxt->cgi + cgi_file->i_cgi : NULL;

	mov	ecx, DWORD PTR _cntxt$[ebp]
	cmp	DWORD PTR [ecx+29648], 0
	je	SHORT $L71883
	mov	edx, DWORD PTR _cgi_file$71371[ebp]
	mov	eax, DWORD PTR [edx+28]
	imul	eax, 56					; 00000038H
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	edx, DWORD PTR [ecx+29648]
	add	edx, eax
	mov	DWORD PTR -1336+[ebp], edx
	jmp	SHORT $L71884
$L71883:
	mov	DWORD PTR -1336+[ebp], 0
$L71884:
	mov	eax, DWORD PTR -1336+[ebp]
	mov	DWORD PTR _cgi$71372[ebp], eax

; 1194 : 		char *bname = basename(DYNTAB_VAL_SZ(&cgi_file->descr, 0, 1));

	push	1
	push	0
	mov	ecx, DWORD PTR _cgi_file$71371[ebp]
	add	ecx, 8
	push	ecx
	call	_dyntab_sz
	add	esp, 12					; 0000000cH
	push	eax
	push	1
	push	0
	mov	edx, DWORD PTR _cgi_file$71371[ebp]
	add	edx, 8
	push	edx
	call	_dyntab_val
	add	esp, 12					; 0000000cH
	push	eax
	call	_basename
	add	esp, 8
	mov	DWORD PTR _bname$71374[ebp], eax

; 1195 : 		char *ext = strrchr(bname, '.');

	push	46					; 0000002eH
	mov	eax, DWORD PTR _bname$71374[ebp]
	push	eax
	call	_strrchr
	add	esp, 8
	mov	DWORD PTR _ext$71375[ebp], eax

; 1196 : 		size_t sz_ext = ext ? strlen(ext) : 0;

	cmp	DWORD PTR _ext$71375[ebp], 0
	je	SHORT $L71885
	mov	ecx, DWORD PTR _ext$71375[ebp]
	push	ecx
	call	_strlen
	add	esp, 4
	mov	DWORD PTR -1340+[ebp], eax
	jmp	SHORT $L71886
$L71885:
	mov	DWORD PTR -1340+[ebp], 0
$L71886:
	mov	edx, DWORD PTR -1340+[ebp]
	mov	DWORD PTR _sz_ext$71376[ebp], edx

; 1197 : 		size_t sz0 = strlen(bname) - sz_ext;

	mov	eax, DWORD PTR _bname$71374[ebp]
	push	eax
	call	_strlen
	add	esp, 4
	sub	eax, DWORD PTR _sz_ext$71376[ebp]
	mov	DWORD PTR _sz0$71377[ebp], eax

; 1198 : 		char serial[16] = {0};

	mov	BYTE PTR _serial$71378[ebp], 0
	xor	ecx, ecx
	mov	DWORD PTR _serial$71378[ebp+1], ecx
	mov	DWORD PTR _serial$71378[ebp+5], ecx
	mov	DWORD PTR _serial$71378[ebp+9], ecx
	mov	WORD PTR _serial$71378[ebp+13], cx
	mov	BYTE PTR _serial$71378[ebp+15], cl

; 1199 : 		size_t sz_max = sizeof(name) - sz_ext - sizeof(serial);

	mov	edx, 1024				; 00000400H
	sub	edx, DWORD PTR _sz_ext$71376[ebp]
	sub	edx, 16					; 00000010H
	mov	DWORD PTR _sz_max$71379[ebp], edx

; 1200 : 		if(sz0 > sz_max) sz0 = sz_max;

	mov	eax, DWORD PTR _sz0$71377[ebp]
	cmp	eax, DWORD PTR _sz_max$71379[ebp]
	jbe	SHORT $L71380
	mov	ecx, DWORD PTR _sz_max$71379[ebp]
	mov	DWORD PTR _sz0$71377[ebp], ecx
$L71380:

; 1201 : 
; 1202 : 		/* Continue if empty file */
; 1203 : 		if(!cgi_file->len) continue;

	mov	edx, DWORD PTR _cgi_file$71371[ebp]
	cmp	DWORD PTR [edx+4], 0
	jne	SHORT $L71381
	jmp	$L71369
$L71381:

; 1204 : 
; 1205 : 		/* If location specified in subfield - save to location */
; 1206 : 		if(cgi && cgi->subfield && !strncmp(cgi->subfield, add_sz_str("SAVETO=")))

	cmp	DWORD PTR _cgi$71372[ebp], 0
	je	$L71382
	mov	eax, DWORD PTR _cgi$71372[ebp]
	cmp	DWORD PTR [eax+32], 0
	je	$L71382
	push	7
	push	OFFSET FLAT:$SG71383
	mov	ecx, DWORD PTR _cgi$71372[ebp]
	mov	edx, DWORD PTR [ecx+32]
	push	edx
	call	_strncmp
	add	esp, 12					; 0000000cH
	test	eax, eax
	jne	$L71382

; 1208 : 			if(chdir(cntxt->rootdir) || chdir(cgi->subfield + 7)) continue;

	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	ecx, DWORD PTR [eax+29724]
	push	ecx
	call	_chdir
	add	esp, 4
	test	eax, eax
	jne	SHORT $L71385
	mov	edx, DWORD PTR _cgi$71372[ebp]
	mov	eax, DWORD PTR [edx+32]
	add	eax, 7
	push	eax
	call	_chdir
	add	esp, 4
	test	eax, eax
	je	SHORT $L71384
$L71385:
	jmp	$L71369
$L71384:

; 1209 : 			snprintf(add_sz_str(name), "%s", bname);

	mov	ecx, DWORD PTR _bname$71374[ebp]
	push	ecx
	push	OFFSET FLAT:$SG71386
	push	1023					; 000003ffH
	lea	edx, DWORD PTR _name$[ebp]
	push	edx
	call	__snprintf
	add	esp, 16					; 00000010H

; 1210 : 			file_compatible_name(name);

	lea	eax, DWORD PTR _name$[ebp]
	push	eax
	call	_file_compatible_name
	add	esp, 4

; 1211 : 			f = fopen(name, "wb");

	push	OFFSET FLAT:$SG71387
	lea	ecx, DWORD PTR _name$[ebp]
	push	ecx
	call	_fopen
	add	esp, 8
	mov	DWORD PTR _f$[ebp], eax

; 1212 : 			if(!f) RETURN_ERROR("Cannot create file in subdirectory", NOP);

	cmp	DWORD PTR _f$[ebp], 0
	jne	SHORT $L71388
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29872], OFFSET FLAT:$SG71390
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 1212		; 000004bcH
	jmp	$eva_err$71364
$L71388:

; 1213 : 			if(fwrite(cgi_file->data, cgi_file->len, 1, f) != 1) RETURN_ERROR("Cannot write downloaded file", NOP);

	mov	ecx, DWORD PTR _f$[ebp]
	push	ecx
	push	1
	mov	edx, DWORD PTR _cgi_file$71371[ebp]
	mov	eax, DWORD PTR [edx+4]
	push	eax
	mov	ecx, DWORD PTR _cgi_file$71371[ebp]
	mov	edx, DWORD PTR [ecx]
	push	edx
	call	_fwrite
	add	esp, 16					; 00000010H
	cmp	eax, 1
	je	SHORT $L71391
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29872], OFFSET FLAT:$SG71393
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 1213		; 000004bdH
	jmp	$eva_err$71364
$L71391:

; 1214 : 			fclose(f);

	mov	edx, DWORD PTR _f$[ebp]
	push	edx
	call	_fclose
	add	esp, 4

; 1215 : 			f = NULL;

	mov	DWORD PTR _f$[ebp], 0

; 1216 : 
; 1217 : 			/* Add file name as value in corresponding CGI input */
; 1218 : 			cgi->value_sz = strlen(name);

	lea	eax, DWORD PTR _name$[ebp]
	push	eax
	call	_strlen
	add	esp, 4
	mov	ecx, DWORD PTR _cgi$71372[ebp]
	mov	DWORD PTR [ecx+12], eax

; 1219 : 			M_STRDUP(cntxt->cgi[cgi_file->i_cgi].value, name, cgi->value_sz);

	mov	edx, DWORD PTR _cgi$71372[ebp]
	mov	eax, DWORD PTR [edx+12]
	mov	DWORD PTR _size$71395[ebp], eax
	lea	ecx, DWORD PTR _name$[ebp]
	mov	DWORD PTR _src$71396[ebp], ecx
	mov	edx, DWORD PTR _size$71395[ebp]
	add	edx, 1
	mov	DWORD PTR _size1$71397[ebp], edx
	mov	eax, DWORD PTR _size1$71397[ebp]
	push	eax
	call	_mem_alloc
	add	esp, 4
	mov	ecx, DWORD PTR _cgi_file$71371[ebp]
	mov	edx, DWORD PTR [ecx+28]
	imul	edx, 56					; 00000038H
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	ecx, DWORD PTR [ecx+29648]
	mov	DWORD PTR [ecx+edx+8], eax
	cmp	DWORD PTR _size1$71397[ebp], 0
	je	SHORT $L71398
	mov	edx, DWORD PTR _cgi_file$71371[ebp]
	mov	eax, DWORD PTR [edx+28]
	imul	eax, 56					; 00000038H
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	edx, DWORD PTR [ecx+29648]
	cmp	DWORD PTR [edx+eax+8], 0
	jne	SHORT $L71398
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29872], OFFSET FLAT:$SG71400
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 1219		; 000004c3H
	jmp	$eva_err$71364
$L71398:
	cmp	DWORD PTR _src$71396[ebp], 0
	je	SHORT $L71402
	cmp	DWORD PTR _size$71395[ebp], 0
	je	SHORT $L71402
	mov	edx, DWORD PTR _size$71395[ebp]
	push	edx
	mov	eax, DWORD PTR _src$71396[ebp]
	push	eax
	mov	ecx, DWORD PTR _cgi_file$71371[ebp]
	mov	edx, DWORD PTR [ecx+28]
	imul	edx, 56					; 00000038H
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	ecx, DWORD PTR [eax+29648]
	mov	edx, DWORD PTR [ecx+edx+8]
	push	edx
	call	_memcpy
	add	esp, 12					; 0000000cH
$L71402:

; 1220 : 			continue;

	jmp	$L71369
$L71382:

; 1222 : 
; 1223 : 		/* Switch to docs directory */
; 1224 : 		if(chdir_db_doc(cntxt)) STACK_ERROR;

	mov	eax, DWORD PTR _cntxt$[ebp]
	push	eax
	call	_chdir_db_doc
	add	esp, 4
	test	eax, eax
	je	SHORT $L71403
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 1224		; 000004c8H
	jmp	$eva_err$71364
$L71403:

; 1225 : 
; 1226 : 		/* Search for duplicate file */
; 1227 : 		if(file_find_duplicate(cntxt, &id_obj, cgi_file->data, cgi_file->len)) CLEAR_ERROR;

	mov	edx, DWORD PTR _cgi_file$71371[ebp]
	mov	eax, DWORD PTR [edx+4]
	push	eax
	mov	ecx, DWORD PTR _cgi_file$71371[ebp]
	mov	edx, DWORD PTR [ecx]
	push	edx
	lea	eax, DWORD PTR _id_obj$[ebp]
	push	eax
	mov	ecx, DWORD PTR _cntxt$[ebp]
	push	ecx
	call	_file_find_duplicate
	add	esp, 16					; 00000010H
	test	eax, eax
	je	SHORT $L71404
	push	1227					; 000004cbH
	push	OFFSET FLAT:$SG71405
	push	OFFSET FLAT:$SG71406
	mov	edx, DWORD PTR _cntxt$[ebp]
	push	edx
	call	_err_clear
	add	esp, 16					; 00000010H
$L71404:

; 1228 : 		if(!id_obj.nbrows)

	cmp	DWORD PTR _id_obj$[ebp], 0
	jne	$L71536

; 1230 : 			/* Duplicate not found : save file & create object */
; 1231 : 			unsigned long iserial = 0;

	mov	DWORD PTR _iserial$71408[ebp], 0
$L71410:

; 1237 : 				snprintf(add_sz_str(name), "%.*s%s%s", (int)sz0, bname, serial, ext ? ext : "");

	cmp	DWORD PTR _ext$71375[ebp], 0
	je	SHORT $L71887
	mov	eax, DWORD PTR _ext$71375[ebp]
	mov	DWORD PTR -1344+[ebp], eax
	jmp	SHORT $L71888
$L71887:
	mov	DWORD PTR -1344+[ebp], OFFSET FLAT:$SG71414
$L71888:
	mov	ecx, DWORD PTR -1344+[ebp]
	push	ecx
	lea	edx, DWORD PTR _serial$71378[ebp]
	push	edx
	mov	eax, DWORD PTR _bname$71374[ebp]
	push	eax
	mov	ecx, DWORD PTR _sz0$71377[ebp]
	push	ecx
	push	OFFSET FLAT:$SG71415
	push	1023					; 000003ffH
	lea	edx, DWORD PTR _name$[ebp]
	push	edx
	call	__snprintf
	add	esp, 28					; 0000001cH

; 1238 : 				file_compatible_name(name);

	lea	eax, DWORD PTR _name$[ebp]
	push	eax
	call	_file_compatible_name
	add	esp, 4

; 1239 : 				snprintf(add_sz_str(serial), "#%lu", ++iserial);

	mov	ecx, DWORD PTR _iserial$71408[ebp]
	add	ecx, 1
	mov	DWORD PTR _iserial$71408[ebp], ecx
	mov	edx, DWORD PTR _iserial$71408[ebp]
	push	edx
	push	OFFSET FLAT:$SG71416
	push	15					; 0000000fH
	lea	eax, DWORD PTR _serial$71378[ebp]
	push	eax
	call	__snprintf
	add	esp, 16					; 00000010H

; 1241 : 			while(!stat(name, &fs));

	lea	ecx, DWORD PTR _fs$71409[ebp]
	push	ecx
	lea	edx, DWORD PTR _name$[ebp]
	push	edx
	call	_stat
	add	esp, 8
	test	eax, eax
	je	$L71410

; 1242 : 
; 1243 : 			/* Create new file & write file data */
; 1244 : 			f = fopen(name, "wb");

	push	OFFSET FLAT:$SG71417
	lea	eax, DWORD PTR _name$[ebp]
	push	eax
	call	_fopen
	add	esp, 8
	mov	DWORD PTR _f$[ebp], eax

; 1245 : 			if(!f) RETURN_ERROR("Cannot create file in docs directory", NOP);

	cmp	DWORD PTR _f$[ebp], 0
	jne	SHORT $L71418
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29872], OFFSET FLAT:$SG71420
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 1245		; 000004ddH
	jmp	$eva_err$71364
$L71418:

; 1246 : 			if(fwrite(cgi_file->data, cgi_file->len, 1, f) != 1) RETURN_ERROR("Cannot write downloaded file", NOP);

	mov	eax, DWORD PTR _f$[ebp]
	push	eax
	push	1
	mov	ecx, DWORD PTR _cgi_file$71371[ebp]
	mov	edx, DWORD PTR [ecx+4]
	push	edx
	mov	eax, DWORD PTR _cgi_file$71371[ebp]
	mov	ecx, DWORD PTR [eax]
	push	ecx
	call	_fwrite
	add	esp, 16					; 00000010H
	cmp	eax, 1
	je	SHORT $L71421
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29872], OFFSET FLAT:$SG71423
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 1246		; 000004deH
	jmp	$eva_err$71364
$L71421:

; 1247 : 			fclose(f);

	mov	ecx, DWORD PTR _f$[ebp]
	push	ecx
	call	_fclose
	add	esp, 4

; 1248 : 			f = NULL;

	mov	DWORD PTR _f$[ebp], 0

; 1249 : 
; 1250 : 			/* Add file length to object data */
; 1251 : 			k = cgi_file->descr.nbrows;

	mov	edx, DWORD PTR _cgi_file$71371[ebp]
	mov	eax, DWORD PTR [edx+8]
	mov	DWORD PTR _k$[ebp], eax

; 1252 : 			DYNTAB_SET(&cgi_file->descr, k, 0, "_EVA_FILE_SIZE");

	push	14					; 0000000eH
	push	OFFSET FLAT:$SG71426
	push	0
	mov	ecx, DWORD PTR _k$[ebp]
	push	ecx
	mov	edx, DWORD PTR _cgi_file$71371[ebp]
	add	edx, 8
	push	edx
	call	_dyntab_set_txt
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L71425
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29872], OFFSET FLAT:$SG71428
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 1252		; 000004e4H
	jmp	$eva_err$71364
$L71425:

; 1253 : 			DYNTAB_ADD_INT(&cgi_file->descr, k, 1, (unsigned long int)cgi_file->len);

	mov	BYTE PTR __tmp$71429[ebp], 0
	mov	ecx, 7
	xor	eax, eax
	lea	edi, DWORD PTR __tmp$71429[ebp+1]
	rep stosd
	stosw
	stosb
	mov	edx, DWORD PTR _cgi_file$71371[ebp]
	mov	eax, DWORD PTR [edx+4]
	push	eax
	push	OFFSET FLAT:$SG71431
	lea	ecx, DWORD PTR __tmp$71429[ebp]
	push	ecx
	call	_sprintf
	add	esp, 12					; 0000000cH
	push	0
	push	0
	push	0
	lea	edx, DWORD PTR __tmp$71429[ebp]
	push	edx
	push	1
	mov	eax, DWORD PTR _k$[ebp]
	push	eax
	mov	ecx, DWORD PTR _cgi_file$71371[ebp]
	add	ecx, 8
	push	ecx
	call	_dyntab_add
	add	esp, 28					; 0000001cH
	test	eax, eax
	je	SHORT $L71433
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29872], OFFSET FLAT:$SG71435
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 1253		; 000004e5H
	jmp	$eva_err$71364
$L71433:

; 1254 : 			DYNTAB_SET(&cgi_file->descr, k, 2, "V");

	push	1
	push	OFFSET FLAT:$SG71437
	push	2
	mov	ecx, DWORD PTR _k$[ebp]
	push	ecx
	mov	edx, DWORD PTR _cgi_file$71371[ebp]
	add	edx, 8
	push	edx
	call	_dyntab_set_txt
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L71436
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29872], OFFSET FLAT:$SG71439
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 1254		; 000004e6H
	jmp	$eva_err$71364
$L71436:

; 1255 : 			DYNTAB_SET(&cgi_file->descr, k, 3, "1");

	push	1
	push	OFFSET FLAT:$SG71441
	push	3
	mov	edx, DWORD PTR _k$[ebp]
	push	edx
	mov	eax, DWORD PTR _cgi_file$71371[ebp]
	add	eax, 8
	push	eax
	call	_dyntab_set_txt
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L71440
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29872], OFFSET FLAT:$SG71443
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 1255		; 000004e7H
	jmp	$eva_err$71364
$L71440:

; 1256 : 			k++;

	mov	eax, DWORD PTR _k$[ebp]
	add	eax, 1
	mov	DWORD PTR _k$[ebp], eax

; 1257 : 
; 1258 : 			/* Add file name to object data */
; 1259 : 			DYNTAB_SET(&cgi_file->descr, k, 0, "_EVA_FILE_SERVER_NAME");

	push	21					; 00000015H
	push	OFFSET FLAT:$SG71445
	push	0
	mov	ecx, DWORD PTR _k$[ebp]
	push	ecx
	mov	edx, DWORD PTR _cgi_file$71371[ebp]
	add	edx, 8
	push	edx
	call	_dyntab_set_txt
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L71444
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29872], OFFSET FLAT:$SG71447
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 1259		; 000004ebH
	jmp	$eva_err$71364
$L71444:

; 1260 : 			DYNTAB_ADD(&cgi_file->descr, k, 1, name, 0, NO_CONV);

	push	0
	push	0
	push	0
	lea	edx, DWORD PTR _name$[ebp]
	push	edx
	push	1
	mov	eax, DWORD PTR _k$[ebp]
	push	eax
	mov	ecx, DWORD PTR _cgi_file$71371[ebp]
	add	ecx, 8
	push	ecx
	call	_dyntab_add
	add	esp, 28					; 0000001cH
	test	eax, eax
	je	SHORT $L71449
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29872], OFFSET FLAT:$SG71451
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 1260		; 000004ecH
	jmp	$eva_err$71364
$L71449:

; 1261 : 			DYNTAB_SET(&cgi_file->descr, k, 2, "V");

	push	1
	push	OFFSET FLAT:$SG71453
	push	2
	mov	ecx, DWORD PTR _k$[ebp]
	push	ecx
	mov	edx, DWORD PTR _cgi_file$71371[ebp]
	add	edx, 8
	push	edx
	call	_dyntab_set_txt
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L71452
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29872], OFFSET FLAT:$SG71455
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 1261		; 000004edH
	jmp	$eva_err$71364
$L71452:

; 1262 : 			DYNTAB_SET(&cgi_file->descr, k, 3, "1");

	push	1
	push	OFFSET FLAT:$SG71457
	push	3
	mov	edx, DWORD PTR _k$[ebp]
	push	edx
	mov	eax, DWORD PTR _cgi_file$71371[ebp]
	add	eax, 8
	push	eax
	call	_dyntab_set_txt
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L71456
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29872], OFFSET FLAT:$SG71459
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 1262		; 000004eeH
	jmp	$eva_err$71364
$L71456:

; 1263 : 			k++;

	mov	eax, DWORD PTR _k$[ebp]
	add	eax, 1
	mov	DWORD PTR _k$[ebp], eax

; 1264 : 
; 1265 : 			/* Add form/obj/ctrl info */
; 1266 : 			if(cgi)

	cmp	DWORD PTR _cgi$71372[ebp], 0
	je	$L71499

; 1268 : 				if(cgi->IdObj)

	mov	ecx, DWORD PTR _cgi$71372[ebp]
	cmp	DWORD PTR [ecx+24], 0
	je	$L71461

; 1270 : 					DYNTAB_SET(&cgi_file->descr, k, 0, "_EVA_OBJ");

	push	8
	push	OFFSET FLAT:$SG71463
	push	0
	mov	edx, DWORD PTR _k$[ebp]
	push	edx
	mov	eax, DWORD PTR _cgi_file$71371[ebp]
	add	eax, 8
	push	eax
	call	_dyntab_set_txt
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L71462
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29872], OFFSET FLAT:$SG71465
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 1270		; 000004f6H
	jmp	$eva_err$71364
$L71462:

; 1271 : 					DYNTAB_ADD_INT(&cgi_file->descr, k, 1, cgi->IdObj);

	mov	BYTE PTR __tmp$71466[ebp], 0
	mov	ecx, 7
	xor	eax, eax
	lea	edi, DWORD PTR __tmp$71466[ebp+1]
	rep stosd
	stosw
	stosb
	mov	eax, DWORD PTR _cgi$71372[ebp]
	mov	ecx, DWORD PTR [eax+24]
	push	ecx
	push	OFFSET FLAT:$SG71467
	lea	edx, DWORD PTR __tmp$71466[ebp]
	push	edx
	call	_sprintf
	add	esp, 12					; 0000000cH
	push	0
	push	0
	push	0
	lea	eax, DWORD PTR __tmp$71466[ebp]
	push	eax
	push	1
	mov	ecx, DWORD PTR _k$[ebp]
	push	ecx
	mov	edx, DWORD PTR _cgi_file$71371[ebp]
	add	edx, 8
	push	edx
	call	_dyntab_add
	add	esp, 28					; 0000001cH
	test	eax, eax
	je	SHORT $L71469
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29872], OFFSET FLAT:$SG71471
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 1271		; 000004f7H
	jmp	$eva_err$71364
$L71469:

; 1272 : 					DYNTAB_SET(&cgi_file->descr, k, 2, "R");

	push	1
	push	OFFSET FLAT:$SG71473
	push	2
	mov	edx, DWORD PTR _k$[ebp]
	push	edx
	mov	eax, DWORD PTR _cgi_file$71371[ebp]
	add	eax, 8
	push	eax
	call	_dyntab_set_txt
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L71472
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29872], OFFSET FLAT:$SG71475
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 1272		; 000004f8H
	jmp	$eva_err$71364
$L71472:

; 1273 : 					DYNTAB_SET(&cgi_file->descr, k, 3, "1");

	push	1
	push	OFFSET FLAT:$SG71477
	push	3
	mov	eax, DWORD PTR _k$[ebp]
	push	eax
	mov	ecx, DWORD PTR _cgi_file$71371[ebp]
	add	ecx, 8
	push	ecx
	call	_dyntab_set_txt
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L71476
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29872], OFFSET FLAT:$SG71479
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 1273		; 000004f9H
	jmp	$eva_err$71364
$L71476:

; 1274 : 					k++;

	mov	ecx, DWORD PTR _k$[ebp]
	add	ecx, 1
	mov	DWORD PTR _k$[ebp], ecx
$L71461:

; 1276 : 				if(cgi->IdCtrl)

	mov	edx, DWORD PTR _cgi$71372[ebp]
	cmp	DWORD PTR [edx+16], 0
	je	$L71480

; 1278 : 					DYNTAB_SET(&cgi_file->descr, k, 0, "_EVA_CTRL");

	push	9
	push	OFFSET FLAT:$SG71482
	push	0
	mov	eax, DWORD PTR _k$[ebp]
	push	eax
	mov	ecx, DWORD PTR _cgi_file$71371[ebp]
	add	ecx, 8
	push	ecx
	call	_dyntab_set_txt
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L71481
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29872], OFFSET FLAT:$SG71484
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 1278		; 000004feH
	jmp	$eva_err$71364
$L71481:

; 1279 : 					DYNTAB_ADD_INT(&cgi_file->descr, k, 1, cgi->IdCtrl);

	mov	BYTE PTR __tmp$71485[ebp], 0
	mov	ecx, 7
	xor	eax, eax
	lea	edi, DWORD PTR __tmp$71485[ebp+1]
	rep stosd
	stosw
	stosb
	mov	ecx, DWORD PTR _cgi$71372[ebp]
	mov	edx, DWORD PTR [ecx+16]
	push	edx
	push	OFFSET FLAT:$SG71486
	lea	eax, DWORD PTR __tmp$71485[ebp]
	push	eax
	call	_sprintf
	add	esp, 12					; 0000000cH
	push	0
	push	0
	push	0
	lea	ecx, DWORD PTR __tmp$71485[ebp]
	push	ecx
	push	1
	mov	edx, DWORD PTR _k$[ebp]
	push	edx
	mov	eax, DWORD PTR _cgi_file$71371[ebp]
	add	eax, 8
	push	eax
	call	_dyntab_add
	add	esp, 28					; 0000001cH
	test	eax, eax
	je	SHORT $L71488
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29872], OFFSET FLAT:$SG71490
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 1279		; 000004ffH
	jmp	$eva_err$71364
$L71488:

; 1280 : 					DYNTAB_SET(&cgi_file->descr, k, 2, "R");

	push	1
	push	OFFSET FLAT:$SG71492
	push	2
	mov	eax, DWORD PTR _k$[ebp]
	push	eax
	mov	ecx, DWORD PTR _cgi_file$71371[ebp]
	add	ecx, 8
	push	ecx
	call	_dyntab_set_txt
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L71491
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29872], OFFSET FLAT:$SG71494
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 1280		; 00000500H
	jmp	$eva_err$71364
$L71491:

; 1281 : 					DYNTAB_SET(&cgi_file->descr, k, 3, "1");

	push	1
	push	OFFSET FLAT:$SG71496
	push	3
	mov	ecx, DWORD PTR _k$[ebp]
	push	ecx
	mov	edx, DWORD PTR _cgi_file$71371[ebp]
	add	edx, 8
	push	edx
	call	_dyntab_set_txt
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L71495
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29872], OFFSET FLAT:$SG71498
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 1281		; 00000501H
	jmp	$eva_err$71364
$L71495:

; 1282 : 					k++;

	mov	edx, DWORD PTR _k$[ebp]
	add	edx, 1
	mov	DWORD PTR _k$[ebp], edx
$L71480:

; 1284 : 				if(cgi->IdForm)

	mov	eax, DWORD PTR _cgi$71372[ebp]
	cmp	DWORD PTR [eax+20], 0
	je	$L71499

; 1286 : 					DYNTAB_SET(&cgi_file->descr, k, 0, "_EVA_FORM");

	push	9
	push	OFFSET FLAT:$SG71501
	push	0
	mov	ecx, DWORD PTR _k$[ebp]
	push	ecx
	mov	edx, DWORD PTR _cgi_file$71371[ebp]
	add	edx, 8
	push	edx
	call	_dyntab_set_txt
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L71500
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29872], OFFSET FLAT:$SG71503
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 1286		; 00000506H
	jmp	$eva_err$71364
$L71500:

; 1287 : 					DYNTAB_ADD_INT(&cgi_file->descr, k, 1, cgi->IdForm);

	mov	BYTE PTR __tmp$71504[ebp], 0
	mov	ecx, 7
	xor	eax, eax
	lea	edi, DWORD PTR __tmp$71504[ebp+1]
	rep stosd
	stosw
	stosb
	mov	edx, DWORD PTR _cgi$71372[ebp]
	mov	eax, DWORD PTR [edx+20]
	push	eax
	push	OFFSET FLAT:$SG71505
	lea	ecx, DWORD PTR __tmp$71504[ebp]
	push	ecx
	call	_sprintf
	add	esp, 12					; 0000000cH
	push	0
	push	0
	push	0
	lea	edx, DWORD PTR __tmp$71504[ebp]
	push	edx
	push	1
	mov	eax, DWORD PTR _k$[ebp]
	push	eax
	mov	ecx, DWORD PTR _cgi_file$71371[ebp]
	add	ecx, 8
	push	ecx
	call	_dyntab_add
	add	esp, 28					; 0000001cH
	test	eax, eax
	je	SHORT $L71507
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29872], OFFSET FLAT:$SG71509
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 1287		; 00000507H
	jmp	$eva_err$71364
$L71507:

; 1288 : 					DYNTAB_SET(&cgi_file->descr, k, 2, "R");

	push	1
	push	OFFSET FLAT:$SG71511
	push	2
	mov	ecx, DWORD PTR _k$[ebp]
	push	ecx
	mov	edx, DWORD PTR _cgi_file$71371[ebp]
	add	edx, 8
	push	edx
	call	_dyntab_set_txt
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L71510
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29872], OFFSET FLAT:$SG71513
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 1288		; 00000508H
	jmp	$eva_err$71364
$L71510:

; 1289 : 					DYNTAB_SET(&cgi_file->descr, k, 3, "1");

	push	1
	push	OFFSET FLAT:$SG71515
	push	3
	mov	edx, DWORD PTR _k$[ebp]
	push	edx
	mov	eax, DWORD PTR _cgi_file$71371[ebp]
	add	eax, 8
	push	eax
	call	_dyntab_set_txt
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L71514
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29872], OFFSET FLAT:$SG71517
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 1289		; 00000509H
	jmp	$eva_err$71364
$L71514:

; 1290 : 					k++;

	mov	eax, DWORD PTR _k$[ebp]
	add	eax, 1
	mov	DWORD PTR _k$[ebp], eax
$L71499:

; 1293 : 
; 1294 : 			/* Get file description from CGI user input */
; 1295 : 			if(cgi && cgi_filter_values(cntxt, &data, 'D', cgi->IdCtrl, cgi->IdForm, cgi->IdObj ? cgi->IdObj : ~0UL, cgi->field, "FILE_DESCRIPTION", 0, 0))

	cmp	DWORD PTR _cgi$71372[ebp], 0
	je	SHORT $L71518
	mov	ecx, DWORD PTR _cgi$71372[ebp]
	cmp	DWORD PTR [ecx+24], 0
	je	SHORT $L71889
	mov	edx, DWORD PTR _cgi$71372[ebp]
	mov	eax, DWORD PTR [edx+24]
	mov	DWORD PTR -1348+[ebp], eax
	jmp	SHORT $L71890
$L71889:
	mov	DWORD PTR -1348+[ebp], -1
$L71890:
	push	0
	push	0
	push	OFFSET FLAT:$SG71519
	mov	ecx, DWORD PTR _cgi$71372[ebp]
	mov	edx, DWORD PTR [ecx+28]
	push	edx
	mov	eax, DWORD PTR -1348+[ebp]
	push	eax
	mov	ecx, DWORD PTR _cgi$71372[ebp]
	mov	edx, DWORD PTR [ecx+20]
	push	edx
	mov	eax, DWORD PTR _cgi$71372[ebp]
	mov	ecx, DWORD PTR [eax+16]
	push	ecx
	push	68					; 00000044H
	lea	edx, DWORD PTR _data$[ebp]
	push	edx
	mov	eax, DWORD PTR _cntxt$[ebp]
	push	eax
	call	_cgi_filter_values
	add	esp, 40					; 00000028H
	test	eax, eax
	je	SHORT $L71518

; 1296 : 				STACK_ERROR;

	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 1296		; 00000510H
	jmp	$eva_err$71364
$L71518:

; 1297 : 			if(dyntab_sz(&data, 0, 0))

	push	0
	push	0
	lea	edx, DWORD PTR _data$[ebp]
	push	edx
	call	_dyntab_sz
	add	esp, 12					; 0000000cH
	test	eax, eax
	je	$L71520

; 1299 : 				DYNTAB_SET(&cgi_file->descr, k, 0, "_EVA_NOTES");

	push	10					; 0000000aH
	push	OFFSET FLAT:$SG71522
	push	0
	mov	eax, DWORD PTR _k$[ebp]
	push	eax
	mov	ecx, DWORD PTR _cgi_file$71371[ebp]
	add	ecx, 8
	push	ecx
	call	_dyntab_set_txt
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L71521
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29872], OFFSET FLAT:$SG71524
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 1299		; 00000513H
	jmp	$eva_err$71364
$L71521:

; 1300 : 				DYNTAB_ADD_CELL(&cgi_file->descr, k, 1, &data, 0, 0);

	push	1
	push	0
	push	0
	lea	ecx, DWORD PTR _data$[ebp]
	push	ecx
	call	_dyntab_cell
	add	esp, 12					; 0000000cH
	push	eax
	push	1
	mov	edx, DWORD PTR _k$[ebp]
	push	edx
	mov	eax, DWORD PTR _cgi_file$71371[ebp]
	add	eax, 8
	push	eax
	call	_dyntab_copy
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L71525
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29872], OFFSET FLAT:$SG71527
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 1300		; 00000514H
	jmp	$eva_err$71364
$L71525:

; 1301 : 				DYNTAB_SET(&cgi_file->descr, k, 2, "V");

	push	1
	push	OFFSET FLAT:$SG71529
	push	2
	mov	eax, DWORD PTR _k$[ebp]
	push	eax
	mov	ecx, DWORD PTR _cgi_file$71371[ebp]
	add	ecx, 8
	push	ecx
	call	_dyntab_set_txt
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L71528
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29872], OFFSET FLAT:$SG71531
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 1301		; 00000515H
	jmp	$eva_err$71364
$L71528:

; 1302 : 				DYNTAB_SET(&cgi_file->descr, k, 3, "1");

	push	1
	push	OFFSET FLAT:$SG71533
	push	3
	mov	ecx, DWORD PTR _k$[ebp]
	push	ecx
	mov	edx, DWORD PTR _cgi_file$71371[ebp]
	add	edx, 8
	push	edx
	call	_dyntab_set_txt
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L71532
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29872], OFFSET FLAT:$SG71535
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 1302		; 00000516H
	jmp	$eva_err$71364
$L71532:

; 1303 : 				k++;

	mov	edx, DWORD PTR _k$[ebp]
	add	edx, 1
	mov	DWORD PTR _k$[ebp], edx
$L71520:

; 1305 : 
; 1306 : 			/* Create new object with file description */
; 1307 : 			if(qry_add_obj_data(cntxt, &id_obj, &cgi_file->descr, &id_form, 0))

	push	0
	lea	eax, DWORD PTR _id_form$[ebp]
	push	eax
	mov	ecx, DWORD PTR _cgi_file$71371[ebp]
	add	ecx, 8
	push	ecx
	lea	edx, DWORD PTR _id_obj$[ebp]
	push	edx
	mov	eax, DWORD PTR _cntxt$[ebp]
	push	eax
	call	_qry_add_obj_data
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L71536

; 1308 : 				STACK_ERROR;

	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 1308		; 0000051cH
	jmp	$eva_err$71364
$L71536:

; 1310 : 		DYNTAB_FREE(cgi_file->descr);

	mov	edx, DWORD PTR _cgi_file$71371[ebp]
	add	edx, 8
	push	edx
	call	_dyntab_free
	add	esp, 4

; 1311 : 
; 1312 : 		/* Add object id as value in corresponding CGI input */
; 1313 : 		cgi->value_sz = dyntab_sz(&id_obj, 0, 0);

	push	0
	push	0
	lea	eax, DWORD PTR _id_obj$[ebp]
	push	eax
	call	_dyntab_sz
	add	esp, 12					; 0000000cH
	mov	ecx, DWORD PTR _cgi$71372[ebp]
	mov	DWORD PTR [ecx+12], eax

; 1315 : 													dyntab_sz(&id_obj, 0, 0));

	push	0
	push	0
	lea	edx, DWORD PTR _id_obj$[ebp]
	push	edx
	call	_dyntab_sz
	add	esp, 12					; 0000000cH
	mov	DWORD PTR _size$71537[ebp], eax
	push	0
	push	0
	lea	eax, DWORD PTR _id_obj$[ebp]
	push	eax
	call	_dyntab_val
	add	esp, 12					; 0000000cH
	mov	DWORD PTR _src$71538[ebp], eax
	mov	ecx, DWORD PTR _size$71537[ebp]
	add	ecx, 1
	mov	DWORD PTR _size1$71539[ebp], ecx
	mov	edx, DWORD PTR _size1$71539[ebp]
	push	edx
	call	_mem_alloc
	add	esp, 4
	mov	ecx, DWORD PTR _cgi_file$71371[ebp]
	mov	edx, DWORD PTR [ecx+28]
	imul	edx, 56					; 00000038H
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	ecx, DWORD PTR [ecx+29648]
	mov	DWORD PTR [ecx+edx+8], eax
	cmp	DWORD PTR _size1$71539[ebp], 0
	je	SHORT $L71540
	mov	edx, DWORD PTR _cgi_file$71371[ebp]
	mov	eax, DWORD PTR [edx+28]
	imul	eax, 56					; 00000038H
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	edx, DWORD PTR [ecx+29648]
	cmp	DWORD PTR [edx+eax+8], 0
	jne	SHORT $L71540
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29872], OFFSET FLAT:$SG71542
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 1315		; 00000523H
	jmp	$eva_err$71364
$L71540:
	cmp	DWORD PTR _src$71538[ebp], 0
	je	SHORT $L71544
	cmp	DWORD PTR _size$71537[ebp], 0
	je	SHORT $L71544
	mov	edx, DWORD PTR _size$71537[ebp]
	push	edx
	mov	eax, DWORD PTR _src$71538[ebp]
	push	eax
	mov	ecx, DWORD PTR _cgi_file$71371[ebp]
	mov	edx, DWORD PTR [ecx+28]
	imul	edx, 56					; 00000038H
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	ecx, DWORD PTR [eax+29648]
	mov	edx, DWORD PTR [ecx+edx+8]
	push	edx
	call	_memcpy
	add	esp, 12					; 0000000cH
$L71544:

; 1316 : 		DYNTAB_FREE(id_obj);

	lea	eax, DWORD PTR _id_obj$[ebp]
	push	eax
	call	_dyntab_free
	add	esp, 4

; 1317 : 	}

	jmp	$L71369
$L71370:

; 1318 : 	cgi_free_files(cntxt);

	mov	ecx, DWORD PTR _cntxt$[ebp]
	push	ecx
	call	_cgi_free_files
	add	esp, 4

; 1319 : 	cntxt->cgi_file = NULL;

	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29660], 0

; 1320 : 	cntxt->cgi_file_nb = 0;

	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29664], 0
$eva_noerr$71367:

; 1321 : 
; 1322 : 	RETURN_OK_CLEANUP;

	push	0
	push	OFFSET FLAT:$SG71546
	push	OFFSET FLAT:$SG71547
	mov	ecx, DWORD PTR _cntxt$[ebp]
	push	ecx
	call	_err_clear
	add	esp, 16					; 00000010H
$eva_err$71364:
	mov	edx, DWORD PTR _cntxt$[ebp]
	cmp	DWORD PTR [edx+29872], 0
	je	SHORT $L71548
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	ecx, DWORD PTR [eax+29900]
	push	ecx
	push	OFFSET FLAT:$SG71549
	push	OFFSET FLAT:$SG71550
	mov	edx, DWORD PTR _cntxt$[ebp]
	push	edx
	call	_err_add_context
	add	esp, 16					; 00000010H
$L71548:
	lea	eax, DWORD PTR _id_obj$[ebp]
	push	eax
	call	_dyntab_free
	add	esp, 4
	lea	ecx, DWORD PTR _id_form$[ebp]
	push	ecx
	call	_dyntab_free
	add	esp, 4
	lea	edx, DWORD PTR _data$[ebp]
	push	edx
	call	_dyntab_free
	add	esp, 4
	cmp	DWORD PTR _f$[ebp], 0
	je	SHORT $L71551
	mov	eax, DWORD PTR _f$[ebp]
	push	eax
	call	_fclose
	add	esp, 4
$L71551:
	mov	ecx, DWORD PTR _cntxt$[ebp]
	xor	eax, eax
	cmp	DWORD PTR [ecx+29872], 0
	setne	al

; 1323 : }

	pop	edi
	mov	esp, ebp
	pop	ebp
	ret	0
_cgi_save_files ENDP
_TEXT	ENDS
PUBLIC	_cgi_read_multipart
_DATA	SEGMENT
	ORG $+1
$SG71567 DB	'Content-Disposition: ', 00H
	ORG $+2
$SG71573 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG71580 DB	'name="', 00H
	ORG $+1
$SG71585 DB	'name="', 00H
	ORG $+1
$SG71588 DB	'Bad name format in CGI data', 00H
$SG71590 DB	'; filename="', 00H
	ORG $+3
$SG71594 DB	'; filename="', 00H
	ORG $+3
$SG71597 DB	0dH, 0aH, 0dH, 0aH, 00H
	ORG $+3
$SG71600 DB	'Bad value format in CGI data', 00H
	ORG $+3
$SG71603 DB	'Bad value format in CGI data', 00H
	ORG $+3
$SG71608 DB	' ', 0aH, 09H, 0dH, 00H
	ORG $+3
$SG71612 DB	' ', 0aH, 09H, 0dH, 00H
	ORG $+3
$SG71615 DB	'D:\Travail\ABI\EVA\V4.0\CGI\Brunix-2016\cgi_utils.c', 00H
$SG71616 DB	'cgi_read_multipart', 00H
	ORG $+1
$SG71618 DB	'D:\Travail\ABI\EVA\V4.0\CGI\Brunix-2016\cgi_utils.c', 00H
$SG71619 DB	'cgi_read_multipart', 00H
_DATA	ENDS
_TEXT	SEGMENT
_cntxt$ = 8
_txt$ = -12
_end$ = -8
_len$ = -20
_sz_sep$ = -16
_separator$ = -4
_size1$71570 = -24
_name$71579 = -40
_val$71581 = -28
_endval$71582 = -32
_name_sz$71583 = -36
_i_cgi$71591 = -44
_cgi_read_multipart PROC NEAR

; 1338 : ){

	push	ebp
	mov	ebp, esp
	sub	esp, 44					; 0000002cH

; 1339 : 	char *txt = cntxt->input->data;

	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	ecx, DWORD PTR [eax+29644]
	add	ecx, 8
	mov	DWORD PTR _txt$[ebp], ecx

; 1340 : 	char *end = txt + cntxt->input->cnt;

	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	eax, DWORD PTR [edx+29644]
	mov	ecx, DWORD PTR _txt$[ebp]
	add	ecx, DWORD PTR [eax+4]
	mov	DWORD PTR _end$[ebp], ecx

; 1341 : 	size_t len, sz_sep;
; 1342 : 	char *separator;
; 1343 : #define CGI_DELIM_DESCR "Content-Disposition: "
; 1344 : #define CGI_DELIM_NAME "name=\""
; 1345 : #define CGI_DELIM_FILE "; filename=\""
; 1346 : 
; 1347 : 	/* Find record separator */
; 1348 : 	separator = strstr(txt, CGI_DELIM_DESCR);

	push	OFFSET FLAT:$SG71567
	mov	edx, DWORD PTR _txt$[ebp]
	push	edx
	call	_strstr
	add	esp, 8
	mov	DWORD PTR _separator$[ebp], eax

; 1349 : 	if(!separator) RETURN_OK;

	cmp	DWORD PTR _separator$[ebp], 0
	jne	SHORT $L71568
	jmp	$eva_noerr$71569
$L71568:

; 1350 : 	sz_sep = separator - txt - 2;

	mov	eax, DWORD PTR _separator$[ebp]
	sub	eax, DWORD PTR _txt$[ebp]
	sub	eax, 2
	mov	DWORD PTR _sz_sep$[ebp], eax

; 1351 : 	M_ALLOC(separator, sz_sep+4);

	mov	ecx, DWORD PTR _sz_sep$[ebp]
	add	ecx, 4
	mov	DWORD PTR _size1$71570[ebp], ecx
	mov	edx, DWORD PTR _size1$71570[ebp]
	push	edx
	call	_mem_alloc
	add	esp, 4
	mov	DWORD PTR _separator$[ebp], eax
	cmp	DWORD PTR _size1$71570[ebp], 0
	je	SHORT $L71571
	cmp	DWORD PTR _separator$[ebp], 0
	jne	SHORT $L71571
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29872], OFFSET FLAT:$SG71573
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 1351		; 00000547H
	jmp	$eva_err$71574
$L71571:

; 1352 : 	memcpy(separator, txt, sz_sep);

	mov	edx, DWORD PTR _sz_sep$[ebp]
	push	edx
	mov	eax, DWORD PTR _txt$[ebp]
	push	eax
	mov	ecx, DWORD PTR _separator$[ebp]
	push	ecx
	call	_memcpy
	add	esp, 12					; 0000000cH

; 1353 : 	separator[sz_sep] = 0;

	mov	edx, DWORD PTR _separator$[ebp]
	add	edx, DWORD PTR _sz_sep$[ebp]
	mov	BYTE PTR [edx], 0
$L71577:

; 1354 : 
; 1355 : 	while(txt && txt < end)

	cmp	DWORD PTR _txt$[ebp], 0
	je	$eva_noerr$71569
	mov	eax, DWORD PTR _txt$[ebp]
	cmp	eax, DWORD PTR _end$[ebp]
	jae	$eva_noerr$71569

; 1357 : 		char *name = strstr(txt, CGI_DELIM_NAME);

	push	OFFSET FLAT:$SG71580
	mov	ecx, DWORD PTR _txt$[ebp]
	push	ecx
	call	_strstr
	add	esp, 8
	mov	DWORD PTR _name$71579[ebp], eax

; 1358 : 		char *val, *endval;
; 1359 : 		size_t name_sz;
; 1360 : 		if(!name) break;

	cmp	DWORD PTR _name$71579[ebp], 0
	jne	SHORT $L71584
	jmp	$eva_noerr$71569
$L71584:

; 1361 : 		name += strlen(CGI_DELIM_NAME);

	push	OFFSET FLAT:$SG71585
	call	_strlen
	add	esp, 4
	mov	edx, DWORD PTR _name$71579[ebp]
	add	edx, eax
	mov	DWORD PTR _name$71579[ebp], edx

; 1362 : 		val = strchr(name, '"');

	push	34					; 00000022H
	mov	eax, DWORD PTR _name$71579[ebp]
	push	eax
	call	_strchr
	add	esp, 8
	mov	DWORD PTR _val$71581[ebp], eax

; 1363 : 		if(!val) RETURN_ERROR("Bad name format in CGI data", NOP);

	cmp	DWORD PTR _val$71581[ebp], 0
	jne	SHORT $L71586
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29872], OFFSET FLAT:$SG71588
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 1363		; 00000553H
	jmp	$eva_err$71574
$L71586:

; 1364 : 		name_sz = val - name;

	mov	eax, DWORD PTR _val$71581[ebp]
	sub	eax, DWORD PTR _name$71579[ebp]
	mov	DWORD PTR _name_sz$71583[ebp], eax

; 1365 : 
; 1366 : 		/* Check for file name */
; 1367 : 		if(!strncmp(val+1, add_sz_str(CGI_DELIM_FILE)))

	push	12					; 0000000cH
	push	OFFSET FLAT:$SG71590
	mov	ecx, DWORD PTR _val$71581[ebp]
	add	ecx, 1
	push	ecx
	call	_strncmp
	add	esp, 12					; 0000000cH
	test	eax, eax
	jne	$L71589

; 1369 : 			/* File input : add input in cntxt->cgi */
; 1370 : 			unsigned long i_cgi;
; 1371 : 			if(cgi_add_input(cntxt, &i_cgi, name, name_sz, NULL, 0)) STACK_ERROR;

	push	0
	push	0
	mov	edx, DWORD PTR _name_sz$71583[ebp]
	push	edx
	mov	eax, DWORD PTR _name$71579[ebp]
	push	eax
	lea	ecx, DWORD PTR _i_cgi$71591[ebp]
	push	ecx
	mov	edx, DWORD PTR _cntxt$[ebp]
	push	edx
	call	_cgi_add_input
	add	esp, 24					; 00000018H
	test	eax, eax
	je	SHORT $L71593
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 1371		; 0000055bH
	jmp	$eva_err$71574
$L71593:

; 1372 : 
; 1373 : 			/* Read file data */
; 1374 : 			name = val + 1 + strlen(CGI_DELIM_FILE);

	push	OFFSET FLAT:$SG71594
	call	_strlen
	add	esp, 4
	mov	ecx, DWORD PTR _val$71581[ebp]
	lea	edx, DWORD PTR [ecx+eax+1]
	mov	DWORD PTR _name$71579[ebp], edx

; 1375 : 			if(cgi_read_file(cntxt, &name, i_cgi, separator, sz_sep)) STACK_ERROR;

	mov	eax, DWORD PTR _sz_sep$[ebp]
	push	eax
	mov	ecx, DWORD PTR _separator$[ebp]
	push	ecx
	mov	edx, DWORD PTR _i_cgi$71591[ebp]
	push	edx
	lea	eax, DWORD PTR _name$71579[ebp]
	push	eax
	mov	ecx, DWORD PTR _cntxt$[ebp]
	push	ecx
	call	_cgi_read_file
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L71595
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 1375		; 0000055fH
	jmp	$eva_err$71574
$L71595:

; 1376 : 			endval = name;

	mov	eax, DWORD PTR _name$71579[ebp]
	mov	DWORD PTR _endval$71582[ebp], eax

; 1378 : 		else

	jmp	$L71614
$L71589:

; 1380 : 			/* ASCII value input : find value start */
; 1381 : 			val = strstr(val, "\r\n\r\n");

	push	OFFSET FLAT:$SG71597
	mov	ecx, DWORD PTR _val$71581[ebp]
	push	ecx
	call	_strstr
	add	esp, 8
	mov	DWORD PTR _val$71581[ebp], eax

; 1382 : 			if(!val) RETURN_ERROR("Bad value format in CGI data", NOP);

	cmp	DWORD PTR _val$71581[ebp], 0
	jne	SHORT $L71598
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29872], OFFSET FLAT:$SG71600
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 1382		; 00000566H
	jmp	$eva_err$71574
$L71598:

; 1383 : 			val += 4;

	mov	ecx, DWORD PTR _val$71581[ebp]
	add	ecx, 4
	mov	DWORD PTR _val$71581[ebp], ecx

; 1384 : 
; 1385 : 			/* Find value end */
; 1386 : 			endval = strstr(val, separator);

	mov	edx, DWORD PTR _separator$[ebp]
	push	edx
	mov	eax, DWORD PTR _val$71581[ebp]
	push	eax
	call	_strstr
	add	esp, 8
	mov	DWORD PTR _endval$71582[ebp], eax

; 1387 : 			if(!endval) RETURN_ERROR("Bad value format in CGI data", NOP);

	cmp	DWORD PTR _endval$71582[ebp], 0
	jne	SHORT $L71601
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29872], OFFSET FLAT:$SG71603
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 1387		; 0000056bH
	jmp	$eva_err$71574
$L71601:

; 1388 : 			len = endval - val;

	mov	eax, DWORD PTR _endval$71582[ebp]
	sub	eax, DWORD PTR _val$71581[ebp]
	mov	DWORD PTR _len$[ebp], eax

; 1389 : 
; 1390 : 			/* Strip spaces around the value */
; 1391 : 			STRIP_SPACES_AROUND(val, len);

	cmp	DWORD PTR _val$71581[ebp], 0
	je	SHORT $L71611
$L71606:
	cmp	DWORD PTR _len$[ebp], 0
	je	SHORT $L71607
	mov	ecx, DWORD PTR _val$71581[ebp]
	movsx	edx, BYTE PTR [ecx]
	push	edx
	push	OFFSET FLAT:$SG71608
	call	_strchr
	add	esp, 8
	test	eax, eax
	je	SHORT $L71607
	mov	eax, DWORD PTR _val$71581[ebp]
	add	eax, 1
	mov	DWORD PTR _val$71581[ebp], eax
	mov	ecx, DWORD PTR _len$[ebp]
	sub	ecx, 1
	mov	DWORD PTR _len$[ebp], ecx
	jmp	SHORT $L71606
$L71607:
	cmp	DWORD PTR _len$[ebp], 0
	je	SHORT $L71611
	mov	edx, DWORD PTR _val$71581[ebp]
	add	edx, DWORD PTR _len$[ebp]
	movsx	eax, BYTE PTR [edx-1]
	push	eax
	push	OFFSET FLAT:$SG71612
	call	_strchr
	add	esp, 8
	test	eax, eax
	je	SHORT $L71611
	mov	ecx, DWORD PTR _len$[ebp]
	sub	ecx, 1
	mov	DWORD PTR _len$[ebp], ecx
	jmp	SHORT $L71607
$L71611:

; 1392 : 
; 1393 : 			/* Add input in cntxt->cgi */
; 1394 : 			if(cgi_add_input(cntxt, NULL, name, name_sz, val, len)) STACK_ERROR;

	mov	edx, DWORD PTR _len$[ebp]
	push	edx
	mov	eax, DWORD PTR _val$71581[ebp]
	push	eax
	mov	ecx, DWORD PTR _name_sz$71583[ebp]
	push	ecx
	mov	edx, DWORD PTR _name$71579[ebp]
	push	edx
	push	0
	mov	eax, DWORD PTR _cntxt$[ebp]
	push	eax
	call	_cgi_add_input
	add	esp, 24					; 00000018H
	test	eax, eax
	je	SHORT $L71614
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 1394		; 00000572H
	jmp	SHORT $eva_err$71574
$L71614:

; 1396 : 
; 1397 : 		/* Switch to next part */
; 1398 : 		txt = endval;

	mov	edx, DWORD PTR _endval$71582[ebp]
	mov	DWORD PTR _txt$[ebp], edx

; 1399 : 	}

	jmp	$L71577
$eva_noerr$71569:

; 1400 : 
; 1401 : #undef CGI_DELIM_DESCR
; 1402 : #undef CGI_DELIM_NAME
; 1403 : #undef CGI_DELIM_FILE
; 1404 : 
; 1405 : 	RETURN_OK_CLEANUP;

	push	0
	push	OFFSET FLAT:$SG71615
	push	OFFSET FLAT:$SG71616
	mov	eax, DWORD PTR _cntxt$[ebp]
	push	eax
	call	_err_clear
	add	esp, 16					; 00000010H
$eva_err$71574:
	mov	ecx, DWORD PTR _cntxt$[ebp]
	cmp	DWORD PTR [ecx+29872], 0
	je	SHORT $L71617
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	eax, DWORD PTR [edx+29900]
	push	eax
	push	OFFSET FLAT:$SG71618
	push	OFFSET FLAT:$SG71619
	mov	ecx, DWORD PTR _cntxt$[ebp]
	push	ecx
	call	_err_add_context
	add	esp, 16					; 00000010H
$L71617:
	mov	edx, DWORD PTR _separator$[ebp]
	push	edx
	call	_mem_free
	add	esp, 4
	mov	DWORD PTR _separator$[ebp], 0
	mov	eax, DWORD PTR _cntxt$[ebp]
	xor	ecx, ecx
	cmp	DWORD PTR [eax+29872], 0
	setne	cl
	mov	eax, ecx

; 1406 : }

	mov	esp, ebp
	pop	ebp
	ret	0
_cgi_read_multipart ENDP
_TEXT	ENDS
PUBLIC	_cgi_trace_input
_DATA	SEGMENT
	ORG $+1
$SG71626 DB	'wb', 00H
	ORG $+1
$SG71627 DB	'cgi.txt', 00H
_DATA	ENDS
_TEXT	SEGMENT
_cntxt$ = 8
_f$ = -4
_cgi_trace_input PROC NEAR

; 1415 : {

	push	ebp
	mov	ebp, esp
	push	ecx

; 1416 : 	FILE *f = NULL;

	mov	DWORD PTR _f$[ebp], 0

; 1417 : 	chdir(cntxt->path);

	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	ecx, DWORD PTR [eax+29728]
	push	ecx
	call	_chdir
	add	esp, 4

; 1418 : 	f = fopen("cgi.txt", "wb");

	push	OFFSET FLAT:$SG71626
	push	OFFSET FLAT:$SG71627
	call	_fopen
	add	esp, 8
	mov	DWORD PTR _f$[ebp], eax

; 1419 : 	if(f)

	cmp	DWORD PTR _f$[ebp], 0
	je	SHORT $L71628

; 1421 : 		fwrite(cntxt->input->data, cntxt->input->cnt, 1, f);

	mov	edx, DWORD PTR _f$[ebp]
	push	edx
	push	1
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	ecx, DWORD PTR [eax+29644]
	mov	edx, DWORD PTR [ecx+4]
	push	edx
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	ecx, DWORD PTR [eax+29644]
	add	ecx, 8
	push	ecx
	call	_fwrite
	add	esp, 16					; 00000010H

; 1422 : 		fclose(f);

	mov	edx, DWORD PTR _f$[ebp]
	push	edx
	call	_fclose
	add	esp, 4
$L71628:

; 1424 : }

	mov	esp, ebp
	pop	ebp
	ret	0
_cgi_trace_input ENDP
_TEXT	ENDS
EXTRN	_put_html_page_header:NEAR
EXTRN	__iob:BYTE
EXTRN	_fflush:NEAR
EXTRN	_printf:NEAR
EXTRN	_fileno:NEAR
EXTRN	_getenv:NEAR
EXTRN	_dynbuf_init:NEAR
EXTRN	_filelength:NEAR
EXTRN	_setmode:NEAR
_DATA	SEGMENT
$SG71635 DB	'CONTENT_TYPE', 00H
	ORG $+3
$SG71637 DB	'CONTENT_LENGTH', 00H
	ORG $+1
$SG71641 DB	'CGITrace', 00H
	ORG $+3
$SG71642 DB	'rb', 00H
	ORG $+1
$SG71643 DB	'cgi.txt', 00H
$SG71648 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG71652 DB	'CGI read error from file', 00H
	ORG $+3
$SG71658 DB	'application/x-www-form-urlencoded', 00H
	ORG $+2
$SG71661 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG71668 DB	'T', 0e9H, 'l', 0e9H, 'chargement de fichier', 00H
	ORG $+2
$SG71669 DB	'T', 0e9H, 'l', 0e9H, 'chargement : ', 00H
	ORG $+2
$SG71677 DB	'%d', 00H
	ORG $+1
$SG71679 DB	0aH, 09H, 'expected size = ', 00H
	ORG $+1
$SG71681 DB	'CGI read error from stdin', 00H
	ORG $+2
$SG71685 DB	'*', 00H
	ORG $+2
$SG71690 DB	'%d', 00H
	ORG $+1
$SG71692 DB	0aH, 09H, 'expected size = ', 00H
	ORG $+1
$SG71694 DB	'CGI read error from stdin', 00H
	ORG $+2
$SG71699 DB	'%d', 00H
	ORG $+1
$SG71701 DB	0aH, 09H, 'input size = ', 00H
$SG71703 DB	'CGI read incomplete :', 00H
	ORG $+2
$SG71704 DB	'application/x-www-form-urlencoded', 00H
	ORG $+2
$SG71707 DB	'D:\Travail\ABI\EVA\V4.0\CGI\Brunix-2016\cgi_utils.c', 00H
$SG71708 DB	'cgi_read_data', 00H
	ORG $+2
$SG71710 DB	'D:\Travail\ABI\EVA\V4.0\CGI\Brunix-2016\cgi_utils.c', 00H
$SG71711 DB	'cgi_read_data', 00H
_DATA	ENDS
_TEXT	SEGMENT
_txt$71688 = -100
_txt$71697 = -132
_cntxt$ = 8
_enctype$ = -12
_length$ = -8
_f$ = -4
_len$71645 = -16
_len$71656 = -24
_t0$71657 = -20
_sz$71663 = -36
_blk$71664 = -28
_cnt$71665 = -32
_txt$71675 = -68
_cgi_read_data PROC NEAR

; 1445 : ){

	push	ebp
	mov	ebp, esp
	sub	esp, 148				; 00000094H

; 1446 : 	char *enctype = getenv("CONTENT_TYPE");

	push	OFFSET FLAT:$SG71635
	call	_getenv
	add	esp, 4
	mov	DWORD PTR _enctype$[ebp], eax

; 1447 : 	char *length = getenv("CONTENT_LENGTH");

	push	OFFSET FLAT:$SG71637
	call	_getenv
	add	esp, 4
	mov	DWORD PTR _length$[ebp], eax

; 1448 : 	FILE *f = NULL;

	mov	DWORD PTR _f$[ebp], 0

; 1449 : 
; 1450 : 	/* If trace mode */
; 1451 : 	if(cntxt->argc > 1 && !strcmp(cntxt->argv[cntxt->argc - 1], "CGITrace"))

	mov	eax, DWORD PTR _cntxt$[ebp]
	cmp	DWORD PTR [eax+29692], 1
	jle	$L71640
	push	OFFSET FLAT:$SG71641
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	edx, DWORD PTR [ecx+29692]
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	ecx, DWORD PTR [eax+29696]
	mov	edx, DWORD PTR [ecx+edx*4-4]
	push	edx
	call	_strcmp
	add	esp, 8
	test	eax, eax
	jne	$L71640

; 1453 : 		/* Read input from text file */
; 1454 : 		chdir(cntxt->path);

	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	ecx, DWORD PTR [eax+29728]
	push	ecx
	call	_chdir
	add	esp, 4

; 1455 : 		f = fopen("cgi.txt", "rb");

	push	OFFSET FLAT:$SG71642
	push	OFFSET FLAT:$SG71643
	call	_fopen
	add	esp, 8
	mov	DWORD PTR _f$[ebp], eax

; 1456 : 		if(f)

	cmp	DWORD PTR _f$[ebp], 0
	je	$L71644

; 1458 : 			size_t len = FILELENGTH(f);

	mov	edx, DWORD PTR _f$[ebp]
	push	edx
	call	_fileno
	add	esp, 4
	push	eax
	call	_filelength
	add	esp, 4
	mov	DWORD PTR _len$71645[ebp], eax

; 1459 : 			cntxt->input = dynbuf_init(len+4);

	mov	eax, DWORD PTR _len$71645[ebp]
	add	eax, 4
	push	eax
	call	_dynbuf_init
	add	esp, 4
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29644], eax

; 1460 : 			if(!cntxt->input) RETURN_ERR_MEMORY;

	mov	edx, DWORD PTR _cntxt$[ebp]
	cmp	DWORD PTR [edx+29644], 0
	jne	SHORT $L71646
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29872], OFFSET FLAT:$SG71648
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 1460		; 000005b4H
	jmp	$eva_err$71649
$L71646:

; 1461 : 			if(fread(cntxt->input->data, len, 1, f) != 1) RETURN_ERROR("CGI read error from file", NOP);

	mov	edx, DWORD PTR _f$[ebp]
	push	edx
	push	1
	mov	eax, DWORD PTR _len$71645[ebp]
	push	eax
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	edx, DWORD PTR [ecx+29644]
	add	edx, 8
	push	edx
	call	_fread
	add	esp, 16					; 00000010H
	cmp	eax, 1
	je	SHORT $L71650
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29872], OFFSET FLAT:$SG71652
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 1461		; 000005b5H
	jmp	$eva_err$71649
$L71650:

; 1462 : 			cntxt->input->cnt = len;

	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	eax, DWORD PTR [edx+29644]
	mov	ecx, DWORD PTR _len$71645[ebp]
	mov	DWORD PTR [eax+4], ecx

; 1463 : 			fclose(f);

	mov	edx, DWORD PTR _f$[ebp]
	push	edx
	call	_fclose
	add	esp, 4

; 1464 : 			f = NULL;

	mov	DWORD PTR _f$[ebp], 0

; 1465 : 			cntxt->urlencoded = *cntxt->input->data != '-';

	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	ecx, DWORD PTR [eax+29644]
	movsx	edx, BYTE PTR [ecx+8]
	xor	eax, eax
	cmp	edx, 45					; 0000002dH
	setne	al
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+32044], eax
$L71644:

; 1467 : 		cntxt->argc = 1;

	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29692], 1

; 1469 : 
; 1470 : 	/* Else : read from stdin */
; 1471 : 	else if(length)

	jmp	$L71696
$L71640:
	cmp	DWORD PTR _length$[ebp], 0
	je	$L71696

; 1473 : 		size_t len = atoi(length);

	mov	eax, DWORD PTR _length$[ebp]
	push	eax
	call	_atoi
	add	esp, 4
	mov	DWORD PTR _len$71656[ebp], eax

; 1474 : 		clock_t t0 = clock();

	call	_clock
	mov	DWORD PTR _t0$71657[ebp], eax

; 1475 : 
; 1476 : 		cntxt->urlencoded = !enctype || !strcmp(enctype, "application/x-www-form-urlencoded");

	cmp	DWORD PTR _enctype$[ebp], 0
	je	SHORT $L71894
	push	OFFSET FLAT:$SG71658
	mov	ecx, DWORD PTR _enctype$[ebp]
	push	ecx
	call	_strcmp
	add	esp, 8
	test	eax, eax
	je	SHORT $L71894
	mov	DWORD PTR -136+[ebp], 0
	jmp	SHORT $L71895
$L71894:
	mov	DWORD PTR -136+[ebp], 1
$L71895:
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	eax, DWORD PTR -136+[ebp]
	mov	DWORD PTR [edx+32044], eax

; 1477 : 		cntxt->rxsize = len;

	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	edx, DWORD PTR _len$71656[ebp]
	mov	DWORD PTR [ecx+32032], edx

; 1478 : 		cntxt->input = dynbuf_init(len+4);

	mov	eax, DWORD PTR _len$71656[ebp]
	add	eax, 4
	push	eax
	call	_dynbuf_init
	add	esp, 4
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29644], eax

; 1479 : 		if(!cntxt->input) RETURN_ERR_MEMORY;

	mov	edx, DWORD PTR _cntxt$[ebp]
	cmp	DWORD PTR [edx+29644], 0
	jne	SHORT $L71659
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29872], OFFSET FLAT:$SG71661
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 1479		; 000005c7H
	jmp	$eva_err$71649
$L71659:

; 1480 : 		SETMODE(fileno(stdin), _O_BINARY);

	push	32768					; 00008000H
	push	OFFSET FLAT:__iob
	call	_fileno
	add	esp, 4
	push	eax
	call	_setmode
	add	esp, 8

; 1481 : 
; 1482 : 		/* If not urlencoded and size over 50k */
; 1483 : 		if(!cntxt->urlencoded && len > 500000000L)

	mov	edx, DWORD PTR _cntxt$[ebp]
	cmp	DWORD PTR [edx+32044], 0
	jne	$L71662
	cmp	DWORD PTR _len$71656[ebp], 500000000	; 1dcd6500H
	jbe	$L71662

; 1485 : 			/* TODO - deactivated - doesnt work : displayed after file was transmitted */
; 1486 : 			/* Display progress bar & use multiple blocks read */
; 1487 : 			size_t sz = 0, blk = 1024;

	mov	DWORD PTR _sz$71663[ebp], 0
	mov	DWORD PTR _blk$71664[ebp], 1024		; 00000400H

; 1488 : 			unsigned long cnt = 0;

	mov	DWORD PTR _cnt$71665[ebp], 0

; 1489 : 			cntxt->imgwait = 1;

	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29672], 1

; 1490 : #ifndef _EVA_DLL
; 1491 : 			put_html_page_header(cntxt, NULL, "Téléchargement de fichier", NULL, 2);

	push	2
	push	0
	push	OFFSET FLAT:$SG71668
	push	0
	mov	ecx, DWORD PTR _cntxt$[ebp]
	push	ecx
	call	_put_html_page_header
	add	esp, 20					; 00000014H

; 1492 : #endif
; 1493 : 			printf("Téléchargement : ");

	push	OFFSET FLAT:$SG71669
	call	_printf
	add	esp, 4
$L71671:

; 1494 : 			while(sz < len)

	mov	edx, DWORD PTR _sz$71663[ebp]
	cmp	edx, DWORD PTR _len$71656[ebp]
	jae	$L71672

; 1496 : 				if(blk > len - sz) blk = len - sz;

	mov	eax, DWORD PTR _len$71656[ebp]
	sub	eax, DWORD PTR _sz$71663[ebp]
	cmp	DWORD PTR _blk$71664[ebp], eax
	jbe	SHORT $L71673
	mov	ecx, DWORD PTR _len$71656[ebp]
	sub	ecx, DWORD PTR _sz$71663[ebp]
	mov	DWORD PTR _blk$71664[ebp], ecx
$L71673:

; 1497 : 				if(fread(cntxt->input->data + sz, blk, 1, stdin) != 1)

	push	OFFSET FLAT:__iob
	push	1
	mov	edx, DWORD PTR _blk$71664[ebp]
	push	edx
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	ecx, DWORD PTR [eax+29644]
	mov	edx, DWORD PTR _sz$71663[ebp]
	lea	eax, DWORD PTR [ecx+edx+8]
	push	eax
	call	_fread
	add	esp, 16					; 00000010H
	cmp	eax, 1
	je	SHORT $L71674

; 1498 : 					RETURN_ERROR("CGI read error from stdin", ERR_PUT_INT("\n\texpected size = ", (int)len));

	mov	ecx, DWORD PTR _len$71656[ebp]
	push	ecx
	push	OFFSET FLAT:$SG71677
	push	32					; 00000020H
	lea	edx, DWORD PTR _txt$71675[ebp]
	push	edx
	call	__snprintf
	add	esp, 16					; 00000010H
	push	0
	push	0
	push	18					; 00000012H
	push	OFFSET FLAT:$SG71679
	mov	eax, DWORD PTR _cntxt$[ebp]
	add	eax, 29876				; 000074b4H
	push	eax
	call	_dynbuf_add
	add	esp, 20					; 00000014H
	push	0
	push	0
	push	0
	lea	ecx, DWORD PTR _txt$71675[ebp]
	push	ecx
	mov	edx, DWORD PTR _cntxt$[ebp]
	add	edx, 29876				; 000074b4H
	push	edx
	call	_dynbuf_add
	add	esp, 20					; 00000014H
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29872], OFFSET FLAT:$SG71681
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 1498		; 000005daH
	jmp	$eva_err$71649
$L71674:

; 1499 : 				sz += blk;

	mov	edx, DWORD PTR _sz$71663[ebp]
	add	edx, DWORD PTR _blk$71664[ebp]
	mov	DWORD PTR _sz$71663[ebp], edx
$L71683:

; 1500 : 				while(cnt < 50 * sz / len) { printf("*"); fflush(stdout); cnt++; }

	mov	eax, DWORD PTR _sz$71663[ebp]
	imul	eax, 50					; 00000032H
	xor	edx, edx
	div	DWORD PTR _len$71656[ebp]
	cmp	DWORD PTR _cnt$71665[ebp], eax
	jae	SHORT $L71684
	push	OFFSET FLAT:$SG71685
	call	_printf
	add	esp, 4
	push	OFFSET FLAT:__iob+32
	call	_fflush
	add	esp, 4
	mov	eax, DWORD PTR _cnt$71665[ebp]
	add	eax, 1
	mov	DWORD PTR _cnt$71665[ebp], eax
	jmp	SHORT $L71683
$L71684:

; 1501 : 			}

	jmp	$L71671
$L71672:

; 1503 : 		else

	jmp	$L71687
$L71662:

; 1504 : 			/* Else use single block read */
; 1505 : 			if(fread(cntxt->input->data, len, 1, stdin) != 1) RETURN_ERROR("CGI read error from stdin", ERR_PUT_INT("\n\texpected size = ", (int)len));

	push	OFFSET FLAT:__iob
	push	1
	mov	ecx, DWORD PTR _len$71656[ebp]
	push	ecx
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	eax, DWORD PTR [edx+29644]
	add	eax, 8
	push	eax
	call	_fread
	add	esp, 16					; 00000010H
	cmp	eax, 1
	je	SHORT $L71687
	mov	ecx, DWORD PTR _len$71656[ebp]
	push	ecx
	push	OFFSET FLAT:$SG71690
	push	32					; 00000020H
	lea	edx, DWORD PTR _txt$71688[ebp]
	push	edx
	call	__snprintf
	add	esp, 16					; 00000010H
	push	0
	push	0
	push	18					; 00000012H
	push	OFFSET FLAT:$SG71692
	mov	eax, DWORD PTR _cntxt$[ebp]
	add	eax, 29876				; 000074b4H
	push	eax
	call	_dynbuf_add
	add	esp, 20					; 00000014H
	push	0
	push	0
	push	0
	lea	ecx, DWORD PTR _txt$71688[ebp]
	push	ecx
	mov	edx, DWORD PTR _cntxt$[ebp]
	add	edx, 29876				; 000074b4H
	push	edx
	call	_dynbuf_add
	add	esp, 20					; 00000014H
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29872], OFFSET FLAT:$SG71694
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 1505		; 000005e1H
	jmp	$eva_err$71649
$L71687:

; 1506 : 		cntxt->input->cnt = len;

	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	eax, DWORD PTR [edx+29644]
	mov	ecx, DWORD PTR _len$71656[ebp]
	mov	DWORD PTR [eax+4], ecx

; 1507 : 		cntxt->rxtime = clock() - t0;

	call	_clock
	sub	eax, DWORD PTR _t0$71657[ebp]
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+32024], eax

; 1508 : 
; 1509 : 		/* Trace CGI data if applicable */
; 1510 : 		if(cntxt->debug & DEBUG_CGI_RAW) cgi_trace_input(cntxt);

	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	ecx, DWORD PTR [eax+29860]
	and	ecx, 8
	test	ecx, ecx
	je	SHORT $L71695
	mov	edx, DWORD PTR _cntxt$[ebp]
	push	edx
	call	_cgi_trace_input
	add	esp, 4
$L71695:

; 1511 : 		if(len > cntxt->input->cnt) RETURN_ERROR("CGI read incomplete :", ERR_PUT_INT("\n\tinput size = ", (int)cntxt->input->cnt))

	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	ecx, DWORD PTR [eax+29644]
	mov	edx, DWORD PTR _len$71656[ebp]
	cmp	edx, DWORD PTR [ecx+4]
	jbe	SHORT $L71696
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	ecx, DWORD PTR [eax+29644]
	mov	edx, DWORD PTR [ecx+4]
	push	edx
	push	OFFSET FLAT:$SG71699
	push	32					; 00000020H
	lea	eax, DWORD PTR _txt$71697[ebp]
	push	eax
	call	__snprintf
	add	esp, 16					; 00000010H
	push	0
	push	0
	push	15					; 0000000fH
	push	OFFSET FLAT:$SG71701
	mov	ecx, DWORD PTR _cntxt$[ebp]
	add	ecx, 29876				; 000074b4H
	push	ecx
	call	_dynbuf_add
	add	esp, 20					; 00000014H
	push	0
	push	0
	push	0
	lea	edx, DWORD PTR _txt$71697[ebp]
	push	edx
	mov	eax, DWORD PTR _cntxt$[ebp]
	add	eax, 29876				; 000074b4H
	push	eax
	call	_dynbuf_add
	add	esp, 20					; 00000014H
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29872], OFFSET FLAT:$SG71703
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 1511		; 000005e7H
	jmp	$eva_err$71649
$L71696:

; 1513 : 
; 1514 : 	/* Call CGI read function depending on encoding type */
; 1515 : 	cntxt->urlencoded = enctype ? !strcmp(enctype, "application/x-www-form-urlencoded") :
; 1516 : 									cntxt->input && *cntxt->input->data != '-';

	cmp	DWORD PTR _enctype$[ebp], 0
	je	SHORT $L71898
	push	OFFSET FLAT:$SG71704
	mov	eax, DWORD PTR _enctype$[ebp]
	push	eax
	call	_strcmp
	add	esp, 8
	neg	eax
	sbb	eax, eax
	inc	eax
	mov	DWORD PTR -140+[ebp], eax
	jmp	SHORT $L71899
$L71898:
	mov	ecx, DWORD PTR _cntxt$[ebp]
	cmp	DWORD PTR [ecx+29644], 0
	je	SHORT $L71896
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	eax, DWORD PTR [edx+29644]
	movsx	ecx, BYTE PTR [eax+8]
	cmp	ecx, 45					; 0000002dH
	je	SHORT $L71896
	mov	DWORD PTR -144+[ebp], 1
	jmp	SHORT $L71897
$L71896:
	mov	DWORD PTR -144+[ebp], 0
$L71897:
	mov	edx, DWORD PTR -144+[ebp]
	mov	DWORD PTR -140+[ebp], edx
$L71899:
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	ecx, DWORD PTR -140+[ebp]
	mov	DWORD PTR [eax+32044], ecx

; 1517 : 	if(cntxt->input && (cntxt->urlencoded ? cgi_read_urlencoded : cgi_read_multipart)(cntxt))

	mov	edx, DWORD PTR _cntxt$[ebp]
	cmp	DWORD PTR [edx+29644], 0
	je	SHORT $eva_noerr$71706
	mov	eax, DWORD PTR _cntxt$[ebp]
	cmp	DWORD PTR [eax+32044], 0
	je	SHORT $L71900
	mov	DWORD PTR -148+[ebp], OFFSET FLAT:_cgi_read_urlencoded
	jmp	SHORT $L71901
$L71900:
	mov	DWORD PTR -148+[ebp], OFFSET FLAT:_cgi_read_multipart
$L71901:
	mov	ecx, DWORD PTR _cntxt$[ebp]
	push	ecx
	call	DWORD PTR -148+[ebp]
	add	esp, 4
	test	eax, eax
	je	SHORT $eva_noerr$71706

; 1518 : 		STACK_ERROR;

	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 1518		; 000005eeH
	jmp	SHORT $eva_err$71649
$eva_noerr$71706:

; 1519 : 
; 1520 : 	RETURN_OK_CLEANUP;

	push	0
	push	OFFSET FLAT:$SG71707
	push	OFFSET FLAT:$SG71708
	mov	eax, DWORD PTR _cntxt$[ebp]
	push	eax
	call	_err_clear
	add	esp, 16					; 00000010H
$eva_err$71649:
	mov	ecx, DWORD PTR _cntxt$[ebp]
	cmp	DWORD PTR [ecx+29872], 0
	je	SHORT $L71709
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	eax, DWORD PTR [edx+29900]
	push	eax
	push	OFFSET FLAT:$SG71710
	push	OFFSET FLAT:$SG71711
	mov	ecx, DWORD PTR _cntxt$[ebp]
	push	ecx
	call	_err_add_context
	add	esp, 16					; 00000010H
$L71709:
	cmp	DWORD PTR _f$[ebp], 0
	je	SHORT $L71712
	mov	edx, DWORD PTR _f$[ebp]
	push	edx
	call	_fclose
	add	esp, 4
$L71712:
	mov	eax, DWORD PTR _cntxt$[ebp]
	xor	ecx, ecx
	cmp	DWORD PTR [eax+29872], 0
	setne	cl
	mov	eax, ecx

; 1521 : }

	mov	esp, ebp
	pop	ebp
	ret	0
_cgi_read_data ENDP
_TEXT	ENDS
PUBLIC	_cgi_get_subfield
_DATA	SEGMENT
	ORG $+2
$SG71742 DB	'D:\Travail\ABI\EVA\V4.0\CGI\Brunix-2016\cgi_utils.c', 00H
$SG71743 DB	'cgi_get_subfield', 00H
	ORG $+3
$SG71745 DB	'D:\Travail\ABI\EVA\V4.0\CGI\Brunix-2016\cgi_utils.c', 00H
$SG71746 DB	'cgi_get_subfield', 00H
_DATA	ENDS
_TEXT	SEGMENT
_cntxt$ = 8
_cgival$ = 12
_ctrl$ = 16
_subfield$ = 20
_b_keep$ = 24
_num$ = 28
_line$ = 32
__i$71737 = -4
_cgi_get_subfield PROC NEAR

; 1540 : {

	push	ebp
	mov	ebp, esp
	push	ecx

; 1541 : 	dyntab_free(cgival);

	mov	eax, DWORD PTR _cgival$[ebp]
	push	eax
	call	_dyntab_free
	add	esp, 4

; 1542 : 	if(cgi_filter_values(cntxt, cgival, 'D', DYNTAB_TOUL(&ctrl->id),
; 1543 : 										DYNTAB_TOUL(&cntxt->form->id_form),
; 1544 : 										DYNTAB_TOUL(&cntxt->form->id_obj),
; 1545 : 										ctrl->FIELD,
; 1546 : 										subfield, num, line))

	mov	ecx, DWORD PTR _line$[ebp]
	push	ecx
	mov	edx, DWORD PTR _num$[ebp]
	push	edx
	mov	eax, DWORD PTR _subfield$[ebp]
	push	eax
	mov	ecx, DWORD PTR _ctrl$[ebp]
	mov	edx, DWORD PTR [ecx+280]
	push	edx
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
	push	eax
	push	10					; 0000000aH
	push	0
	push	0
	push	0
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	eax, DWORD PTR [edx+80]
	add	eax, 12					; 0000000cH
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
	mov	ecx, DWORD PTR _ctrl$[ebp]
	push	ecx
	call	_dyntab_val
	add	esp, 12					; 0000000cH
	push	eax
	call	_strtoul
	add	esp, 12					; 0000000cH
	push	eax
	push	68					; 00000044H
	mov	edx, DWORD PTR _cgival$[ebp]
	push	edx
	mov	eax, DWORD PTR _cntxt$[ebp]
	push	eax
	call	_cgi_filter_values
	add	esp, 40					; 00000028H
	test	eax, eax
	je	SHORT $L71734

; 1547 : 		STACK_ERROR;

	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 1547		; 0000060bH
	jmp	SHORT $eva_err$71735
$L71734:

; 1548 : 	if(!b_keep) CGI_VALUES_DONTKEEP(cgival);

	cmp	DWORD PTR _b_keep$[ebp], 0
	jne	SHORT $L71740
	mov	DWORD PTR __i$71737[ebp], 0
	jmp	SHORT $L71738
$L71739:
	mov	edx, DWORD PTR __i$71737[ebp]
	add	edx, 1
	mov	DWORD PTR __i$71737[ebp], edx
$L71738:
	mov	eax, DWORD PTR _cgival$[ebp]
	mov	ecx, DWORD PTR __i$71737[ebp]
	cmp	ecx, DWORD PTR [eax]
	jae	SHORT $L71740
	push	1
	mov	edx, DWORD PTR __i$71737[ebp]
	push	edx
	mov	eax, DWORD PTR _cgival$[ebp]
	push	eax
	mov	ecx, DWORD PTR _cntxt$[ebp]
	push	ecx
	call	_cgi_value_setkeep
	add	esp, 16					; 00000010H
	jmp	SHORT $L71739
$L71740:
$eva_noerr$71741:

; 1549 : 
; 1550 : 	RETURN_OK_CLEANUP;

	push	0
	push	OFFSET FLAT:$SG71742
	push	OFFSET FLAT:$SG71743
	mov	edx, DWORD PTR _cntxt$[ebp]
	push	edx
	call	_err_clear
	add	esp, 16					; 00000010H
$eva_err$71735:
	mov	eax, DWORD PTR _cntxt$[ebp]
	cmp	DWORD PTR [eax+29872], 0
	je	SHORT $L71744
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	edx, DWORD PTR [ecx+29900]
	push	edx
	push	OFFSET FLAT:$SG71745
	push	OFFSET FLAT:$SG71746
	mov	eax, DWORD PTR _cntxt$[ebp]
	push	eax
	call	_err_add_context
	add	esp, 16					; 00000010H
$L71744:
	mov	ecx, DWORD PTR _cntxt$[ebp]
	xor	eax, eax
	cmp	DWORD PTR [ecx+29872], 0
	setne	al

; 1551 : }

	mov	esp, ebp
	pop	ebp
	ret	0
_cgi_get_subfield ENDP
_TEXT	ENDS
PUBLIC	_cgi_put_subfield
_DATA	SEGMENT
	ORG $+3
$SG71771 DB	'''', 00H
	ORG $+2
$SG71772 DB	'<input type=hidden name=''', 00H
	ORG $+2
$SG71774 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG71776 DB	'''>', 00H
	ORG $+1
$SG71777 DB	' value=''', 00H
	ORG $+3
$SG71779 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG71783 DB	0aH, 00H
	ORG $+2
$SG71785 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG71787 DB	'D:\Travail\ABI\EVA\V4.0\CGI\Brunix-2016\cgi_utils.c', 00H
$SG71788 DB	'cgi_put_subfield', 00H
	ORG $+3
$SG71790 DB	'D:\Travail\ABI\EVA\V4.0\CGI\Brunix-2016\cgi_utils.c', 00H
$SG71791 DB	'cgi_put_subfield', 00H
_DATA	ENDS
_TEXT	SEGMENT
_cntxt$ = 8
_ctrl$ = 12
_subfield$ = 16
_val$ = 20
_val_sz$ = 24
_name$ = -4
_cgi_put_subfield PROC NEAR

; 1567 : {

	push	ebp
	mov	ebp, esp
	sub	esp, 12					; 0000000cH

; 1568 : 	DynBuffer *name = NULL;

	mov	DWORD PTR _name$[ebp], 0

; 1569 : 	if(cgi_build_name(cntxt, &name, 'D',
; 1570 : 		DYNTAB_TOUL(&ctrl->id),
; 1571 : 		DYNTAB_TOUL(&cntxt->form->id_form),
; 1572 : 		DYNTAB_TOUL(&cntxt->form->id_obj),
; 1573 : 		ctrl->FIELD, strlen(ctrl->FIELD), subfield, strlen(subfield), 0, 0, 0))

	push	0
	push	0
	push	0
	mov	eax, DWORD PTR _subfield$[ebp]
	push	eax
	call	_strlen
	add	esp, 4
	push	eax
	mov	ecx, DWORD PTR _subfield$[ebp]
	push	ecx
	mov	edx, DWORD PTR _ctrl$[ebp]
	mov	eax, DWORD PTR [edx+280]
	push	eax
	call	_strlen
	add	esp, 4
	push	eax
	mov	ecx, DWORD PTR _ctrl$[ebp]
	mov	edx, DWORD PTR [ecx+280]
	push	edx
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
	push	eax
	push	10					; 0000000aH
	push	0
	push	0
	push	0
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	eax, DWORD PTR [edx+80]
	add	eax, 12					; 0000000cH
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
	mov	ecx, DWORD PTR _ctrl$[ebp]
	push	ecx
	call	_dyntab_val
	add	esp, 12					; 0000000cH
	push	eax
	call	_strtoul
	add	esp, 12					; 0000000cH
	push	eax
	push	68					; 00000044H
	lea	edx, DWORD PTR _name$[ebp]
	push	edx
	mov	eax, DWORD PTR _cntxt$[ebp]
	push	eax
	call	_cgi_build_name
	add	esp, 52					; 00000034H
	test	eax, eax
	je	SHORT $L71766

; 1574 : 		STACK_ERROR;

	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 1574		; 00000626H
	jmp	$eva_err$71767
$L71766:

; 1575 : 	DYNBUF_ADD3_BUF(cntxt->form->html, "<input type=hidden name='", name, NO_CONV, "'");

	cmp	DWORD PTR _name$[ebp], 0
	je	SHORT $L71904
	mov	edx, DWORD PTR _name$[ebp]
	mov	eax, DWORD PTR [edx+4]
	mov	DWORD PTR -8+[ebp], eax
	jmp	SHORT $L71905
$L71904:
	mov	DWORD PTR -8+[ebp], 0
$L71905:
	cmp	DWORD PTR _name$[ebp], 0
	je	SHORT $L71906
	mov	ecx, DWORD PTR _name$[ebp]
	add	ecx, 8
	mov	DWORD PTR -12+[ebp], ecx
	jmp	SHORT $L71907
$L71906:
	mov	DWORD PTR -12+[ebp], 0
$L71907:
	push	1
	push	OFFSET FLAT:$SG71771
	push	0
	push	0
	mov	edx, DWORD PTR -8+[ebp]
	push	edx
	mov	eax, DWORD PTR -12+[ebp]
	push	eax
	push	25					; 00000019H
	push	OFFSET FLAT:$SG71772
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	edx, DWORD PTR [ecx+80]
	mov	eax, DWORD PTR [edx+232]
	push	eax
	call	_dynbuf_add3
	add	esp, 36					; 00000024H
	test	eax, eax
	je	SHORT $L71770
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29872], OFFSET FLAT:$SG71774
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 1575		; 00000627H
	jmp	$eva_err$71767
$L71770:

; 1576 : 	DYNBUF_ADD3(cntxt->form->html, " value='", val, val_sz, HTML_NO_QUOTE, "'>");

	push	2
	push	OFFSET FLAT:$SG71776
	push	1
	push	OFFSET FLAT:_no_quote
	mov	eax, DWORD PTR _val_sz$[ebp]
	push	eax
	mov	ecx, DWORD PTR _val$[ebp]
	push	ecx
	push	8
	push	OFFSET FLAT:$SG71777
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	eax, DWORD PTR [edx+80]
	mov	ecx, DWORD PTR [eax+232]
	push	ecx
	call	_dynbuf_add3
	add	esp, 36					; 00000024H
	test	eax, eax
	je	SHORT $L71775
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29872], OFFSET FLAT:$SG71779
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 1576		; 00000628H
	jmp	SHORT $eva_err$71767
$L71775:

; 1577 : 	if(cntxt->debug & DEBUG_HTML) DYNBUF_ADD_STR(cntxt->form->html, "\n");

	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	edx, DWORD PTR [ecx+29860]
	and	edx, 128				; 00000080H
	test	edx, edx
	je	SHORT $L71782
	push	0
	push	0
	push	1
	push	OFFSET FLAT:$SG71783
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	ecx, DWORD PTR [eax+80]
	mov	edx, DWORD PTR [ecx+232]
	push	edx
	call	_dynbuf_add
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L71782
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29872], OFFSET FLAT:$SG71785
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 1577		; 00000629H
	jmp	SHORT $eva_err$71767
$L71782:
$eva_noerr$71786:

; 1578 : 
; 1579 : 	RETURN_OK_CLEANUP;

	push	0
	push	OFFSET FLAT:$SG71787
	push	OFFSET FLAT:$SG71788
	mov	edx, DWORD PTR _cntxt$[ebp]
	push	edx
	call	_err_clear
	add	esp, 16					; 00000010H
$eva_err$71767:
	mov	eax, DWORD PTR _cntxt$[ebp]
	cmp	DWORD PTR [eax+29872], 0
	je	SHORT $L71789
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	edx, DWORD PTR [ecx+29900]
	push	edx
	push	OFFSET FLAT:$SG71790
	push	OFFSET FLAT:$SG71791
	mov	eax, DWORD PTR _cntxt$[ebp]
	push	eax
	call	_err_add_context
	add	esp, 16					; 00000010H
$L71789:
	mov	ecx, DWORD PTR _name$[ebp]
	push	ecx
	call	_mem_free
	add	esp, 4
	mov	DWORD PTR _name$[ebp], 0
	mov	edx, DWORD PTR _cntxt$[ebp]
	xor	eax, eax
	cmp	DWORD PTR [edx+29872], 0
	setne	al

; 1580 : }

	mov	esp, ebp
	pop	ebp
	ret	0
_cgi_put_subfield ENDP
_TEXT	ENDS
END
