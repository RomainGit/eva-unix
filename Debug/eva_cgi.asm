	TITLE	D:\Travail\ABI\EVA\V4.0\CGI\Brunix-2016\eva_cgi.c
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
_DATA	SEGMENT
COMM	_Cntxt:DWORD
_DATA	ENDS
PUBLIC	_main
EXTRN	_qry_obj_label:NEAR
EXTRN	_getpid:NEAR
EXTRN	_put_html_page_header:NEAR
EXTRN	_put_html_page_trailer:NEAR
EXTRN	_datetxt_now:NEAR
EXTRN	_datetxt_to_time:NEAR
EXTRN	_fclose:NEAR
EXTRN	_fopen:NEAR
EXTRN	_fprintf:NEAR
EXTRN	_fputs:NEAR
EXTRN	_cgi_init_call:NEAR
EXTRN	_output_log_end:NEAR
EXTRN	_basename:NEAR
EXTRN	_printf:NEAR
EXTRN	_puts:NEAR
EXTRN	_sprintf:NEAR
EXTRN	_sscanf:NEAR
EXTRN	_clock:NEAR
EXTRN	_time:NEAR
EXTRN	_sql_control:NEAR
EXTRN	_set_session_statistics:NEAR
EXTRN	_check_login:NEAR
EXTRN	_sql_id_value:NEAR
EXTRN	_get_id_value:NEAR
EXTRN	_sql_add_value:NEAR
EXTRN	_getenv:NEAR
EXTRN	_process_form:NEAR
EXTRN	_mem_strdup:NEAR
EXTRN	_mem_free:NEAR
EXTRN	_plain_to_html:BYTE
EXTRN	_srand:NEAR
EXTRN	_strtoul:NEAR
EXTRN	_dynbuf_add:NEAR
EXTRN	_qry_check_idobj:NEAR
EXTRN	_qry_add_idobj_field_val:NEAR
EXTRN	_dyntab_free:NEAR
EXTRN	_dyntab_val:NEAR
EXTRN	__chkstk:NEAR
EXTRN	_strcpy:NEAR
EXTRN	_strcmp:NEAR
EXTRN	_strlen:NEAR
EXTRN	_chdir:NEAR
EXTRN	_strchr:NEAR
EXTRN	_strncmp:NEAR
EXTRN	_put_html_error:NEAR
EXTRN	_debug_put_cgi:NEAR
EXTRN	_taskplan_sequence:NEAR
EXTRN	_dyntab_filter_field:NEAR
EXTRN	_action_pay_site:NEAR
_BSS	SEGMENT
$SG70219 DB	01H DUP (?)
	ALIGN	4

$SG70251 DB	01H DUP (?)
_BSS	ENDS
_DATA	SEGMENT
$SG70216 DB	'REMOTE_ADDR', 00H
$SG70217 DB	'QUERY_STRING', 00H
	ORG $+3
$SG70220 DB	'HTTP_USER_AGENT', 00H
$SG70221 DB	'SERVER_NAME', 00H
$SG70222 DB	'REQUEST_URI', 00H
$SG70224 DB	'TwengaBot', 00H
	ORG $+2
$SG70226 DB	'QRY=', 00H
	ORG $+3
$SG70228 DB	'_EVA_FORMSTAMP', 00H
	ORG $+1
$SG70230 DB	'MailRead', 00H
	ORG $+3
$SG70233 DB	'Unknown', 00H
$SG70237 DB	'_EVA_MAIL_READ', 00H
	ORG $+1
$SG70238 DB	'Location: /img/_eva_nop.gif', 0dH, 0aH, 00H
	ORG $+2
$SG70242 DB	'DbRedir', 00H
$SG70248 DB	'Unknown', 00H
$SG70250 DB	'_EVA_DB_REDIR', 00H
	ORG $+2
$SG70252 DB	'Location: /eva/%s.cgi', 0dH, 0aH, 0dH, 0aH, 00H
	ORG $+2
$SG70256 DB	'TPE=', 00H
	ORG $+3
$SG70260 DB	'PaySite', 00H
$SG70265 DB	'DayTask', 00H
$SG70266 DB	'HourTask', 00H
	ORG $+3
$SG70274 DB	'TPE', 00H
$SG70277 DB	'OpenForm=%lu,%lu', 00H
	ORG $+3
$SG70279 DB	' - ', 00H
$SG70298 DB	'<input type=hidden name=S value=%s$%s$%s$%s$%s>', 0aH, 00H
	ORG $+3
$SG70302 DB	'%s', 00H
	ORG $+1
$SG70304 DB	'%s', 00H
	ORG $+1
$SG70306 DB	'%s', 00H
	ORG $+1
$SG70308 DB	'%s', 00H
	ORG $+1
$SG70316 DB	'_EVA_SESSION_TRACE', 00H
	ORG $+1
$SG70322 DB	'_EVA_OBJ', 00H
	ORG $+3
$SG70325 DB	'_EVA_FORM', 00H
	ORG $+2
$SG70326 DB	'_EVA_USER_IP', 00H
	ORG $+3
$SG70329 DB	'_EVA_SESSION_OBJ', 00H
	ORG $+3
$SG70335 DB	'_EVA_SESSION_FORM', 00H
	ORG $+2
$SG70343 DB	'%s-%s.html', 00H
	ORG $+1
$SG70345 DB	'trace', 00H
	ORG $+2
$SG70346 DB	'w', 00H
	ORG $+2
$SG70349 DB	'Trace utilisateur - rafraichissement toutes les 10 secon'
	DB	'des', 00H
$SG70351 DB	'.html''"></td></tr></table>', 00H
	ORG $+1
$SG70352 DB	'-', 00H
	ORG $+2
$SG70353 DB	'<table noborder width=100%><tr><td align=center><b>Navig'
	DB	'ation partag', 0e9H, 'e - copie d''', 0e9H, 'cran </b></td><t'
	DB	'd><input type=submit name=TraceRefresh value=''Afficher la pa'
	DB	'ge suivante'' Onclick="window.location.href=''/trace/', 00H
	ORG $+2
$SG70354 DB	'%s%s%s%lu%s', 00H
$SG70356 DB	'<font face=Arial><b><u>*** Erreur : </u><a href=''../err'
	DB	'log/%s''>%s</a>', 00H
	ORG $+2
$SG70362 DB	'.html"'',10000);document.mainform[''TraceRefresh''].focu'
	DB	's();</script>', 00H
	ORG $+1
$SG70363 DB	'-', 00H
	ORG $+2
$SG70364 DB	'<script type=text/javascript>setTimeout(''window.locatio'
	DB	'n.href="/trace/', 00H
	ORG $+1
$SG70365 DB	'%s%s%s%lu%s', 00H
_DATA	ENDS
_TEXT	SEGMENT
_argc$ = 8
_argv$ = 12
_envp$ = 16
_c$ = -270248
_cntxt$ = -270256
_t0$ = -270252
_idobj$70231 = -270260
_ua$70232 = -270264
_id$70234 = -270268
_obj$70243 = -270276
_idobj$70244 = -270272
_redir$70246 = -270284
_addr$70247 = -270280
_title$70269 = -270296
_idform$70271 = -270292
_idobj$70272 = -270288
_data$70311 = -270320
_b_obj$70312 = -270300
_b_form$70313 = -270324
_i$70314 = -270328
_tr$70320 = -270332
_val_SESSION_OBJ$70328 = -270336
_val_SESSION_FORM$70334 = -270340
_f$70340 = -270472
_fname$70342 = -270468
_main	PROC NEAR

; 23   : {

	push	ebp
	mov	ebp, esp
	mov	eax, 270496				; 000420a0H
	call	__chkstk
	push	esi
	push	edi

; 24   : 	EVA_context c = {{0}}, *cntxt = &c;

	mov	DWORD PTR _c$[ebp], 0
	xor	eax, eax
	mov	DWORD PTR _c$[ebp+4], eax
	mov	DWORD PTR _c$[ebp+8], eax
	mov	DWORD PTR _c$[ebp+12], eax
	mov	DWORD PTR _c$[ebp+16], eax
	mov	ecx, 67557				; 000107e5H
	xor	eax, eax
	lea	edi, DWORD PTR _c$[ebp+20]
	rep stosd
	lea	ecx, DWORD PTR _c$[ebp]
	mov	DWORD PTR _cntxt$[ebp], ecx

; 25   : 	clock_t t0;
; 26   : 
; 27   : 	/* Initialize SQL library */
; 28   : 	sql_control(NULL, 5);

	push	5
	push	0
	call	_sql_control
	add	esp, 8

; 29   : 
; 30   : 	/* Set process time counters */
; 31   : 	cntxt->t0 = clock();

	call	_clock
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+32016], eax

; 32   : 	cntxt->tm0 = time(NULL);

	push	0
	call	_time
	add	esp, 4
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+32040], eax

; 33   : 	strcpy(cntxt->timestamp, datetxt_now());

	call	_datetxt_now
	push	eax
	mov	edx, DWORD PTR _cntxt$[ebp]
	add	edx, 29704				; 00007408H
	push	edx
	call	_strcpy
	add	esp, 8

; 34   : 	datetxt_to_time(cntxt->timestamp, &cntxt->tcur, NULL);

	push	0
	mov	eax, DWORD PTR _cntxt$[ebp]
	add	eax, 29720				; 00007418H
	push	eax
	mov	ecx, DWORD PTR _cntxt$[ebp]
	add	ecx, 29704				; 00007408H
	push	ecx
	call	_datetxt_to_time
	add	esp, 12					; 0000000cH

; 35   : 
; 36   : 	/* Initialize context */
; 37   : 	Cntxt = cntxt;

	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR _Cntxt, edx

; 38   : 	cntxt->argc = argc;

	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	ecx, DWORD PTR _argc$[ebp]
	mov	DWORD PTR [eax+29692], ecx

; 39   : 	cntxt->argv = argv;

	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	eax, DWORD PTR _argv$[ebp]
	mov	DWORD PTR [edx+29696], eax

; 40   : 	cntxt->envp = envp;

	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	edx, DWORD PTR _envp$[ebp]
	mov	DWORD PTR [ecx+29700], edx

; 41   : 
; 42   : 	/* Extract DB name from executable path (basename) */
; 43   : 	cntxt->dbname = basename(argv[0], 0);

	push	0
	mov	eax, DWORD PTR _argv$[ebp]
	mov	ecx, DWORD PTR [eax]
	push	ecx
	call	_basename
	add	esp, 8
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29804], eax

; 44   : 	cntxt->path = mem_strdup(cntxt->argv[0]);

	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	ecx, DWORD PTR [eax+29696]
	mov	edx, DWORD PTR [ecx]
	push	edx
	call	_mem_strdup
	add	esp, 4
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29728], eax

; 45   : 	cntxt->path[cntxt->dbname - cntxt->argv[0]] = 0;

	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	eax, DWORD PTR [edx+29696]
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	edx, DWORD PTR [ecx+29804]
	sub	edx, DWORD PTR [eax]
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	ecx, DWORD PTR [eax+29728]
	mov	BYTE PTR [ecx+edx], 0

; 46   : 	cntxt->rootdir = mem_strdup(cntxt->path);

	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	eax, DWORD PTR [edx+29728]
	push	eax
	call	_mem_strdup
	add	esp, 4
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29724], eax

; 47   : 	cntxt->rootdir[cntxt->dbname - cntxt->argv[0] - 4] = 0;

	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	eax, DWORD PTR [edx+29696]
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	edx, DWORD PTR [ecx+29804]
	sub	edx, DWORD PTR [eax]
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	ecx, DWORD PTR [eax+29724]
	mov	BYTE PTR [ecx+edx-4], 0

; 48   : 	cntxt->dbname = mem_strdup(cntxt->dbname);

	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	eax, DWORD PTR [edx+29804]
	push	eax
	call	_mem_strdup
	add	esp, 4
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29804], eax

; 49   : 	cntxt->dbname[strlen(cntxt->dbname)-4] = 0;

	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	eax, DWORD PTR [edx+29804]
	push	eax
	call	_strlen
	add	esp, 4
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	edx, DWORD PTR [ecx+29804]
	mov	BYTE PTR [edx+eax-4], 0

; 50   : 
; 51   : 	/* Read environments variables */
; 52   : 	cntxt->user_ip = getenv("REMOTE_ADDR");

	push	OFFSET FLAT:$SG70216
	call	_getenv
	add	esp, 4
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29732], eax

; 53   : 	cntxt->qrystr = getenv("QUERY_STRING"); if(!cntxt->qrystr) cntxt->qrystr = "";

	push	OFFSET FLAT:$SG70217
	call	_getenv
	add	esp, 4
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29736], eax
	mov	eax, DWORD PTR _cntxt$[ebp]
	cmp	DWORD PTR [eax+29736], 0
	jne	SHORT $L70218
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29736], OFFSET FLAT:$SG70219
$L70218:

; 54   : 	cntxt->user_agent = getenv("HTTP_USER_AGENT");

	push	OFFSET FLAT:$SG70220
	call	_getenv
	add	esp, 4
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29748], eax

; 55   : 	cntxt->srvname = getenv("SERVER_NAME");

	push	OFFSET FLAT:$SG70221
	call	_getenv
	add	esp, 4
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29744], eax

; 56   : 	cntxt->requri = getenv("REQUEST_URI");

	push	OFFSET FLAT:$SG70222
	call	_getenv
	add	esp, 4
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29740], eax

; 57   : 	if(cntxt->user_agent && !strncmp(cntxt->user_agent, "TwengaBot", 9)) return 0;

	mov	eax, DWORD PTR _cntxt$[ebp]
	cmp	DWORD PTR [eax+29748], 0
	je	SHORT $L70223
	push	9
	push	OFFSET FLAT:$SG70224
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	edx, DWORD PTR [ecx+29748]
	push	edx
	call	_strncmp
	add	esp, 12					; 0000000cH
	test	eax, eax
	jne	SHORT $L70223
	xor	eax, eax
	jmp	$L70209
$L70223:

; 58   : 
; 59   : 	/* Handle debug QUERY_STRING */
; 60   : 	if(argc == 2 && !strncmp(argv[1], add_sz_str("QRY=")))

	cmp	DWORD PTR _argc$[ebp], 2
	jne	SHORT $L70225
	push	4
	push	OFFSET FLAT:$SG70226
	mov	eax, DWORD PTR _argv$[ebp]
	mov	ecx, DWORD PTR [eax+4]
	push	ecx
	call	_strncmp
	add	esp, 12					; 0000000cH
	test	eax, eax
	jne	SHORT $L70225

; 61   : 		cntxt->qrystr = argv[1] + 4;

	mov	edx, DWORD PTR _argv$[ebp]
	mov	eax, DWORD PTR [edx+4]
	add	eax, 4
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29736], eax
$L70225:

; 62   : 
; 63   : 	/* Handle CGI GET calls */
; 64   : 	if(cntxt->qrystr && *cntxt->qrystr)

	mov	edx, DWORD PTR _cntxt$[ebp]
	cmp	DWORD PTR [edx+29736], 0
	je	$L70259
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	ecx, DWORD PTR [eax+29736]
	movsx	edx, BYTE PTR [ecx]
	test	edx, edx
	je	$L70259

; 66   : 		sql_id_value(cntxt, add_sz_str("_EVA_FORMSTAMP"), &cntxt->val_FORMSTAMP);

	mov	eax, DWORD PTR _cntxt$[ebp]
	add	eax, 269636				; 00041d44H
	push	eax
	push	14					; 0000000eH
	push	OFFSET FLAT:$SG70228
	mov	ecx, DWORD PTR _cntxt$[ebp]
	push	ecx
	call	_sql_id_value
	add	esp, 16					; 00000010H

; 67   : 		if(!strncmp(cntxt->qrystr, add_sz_str("MailRead")))

	push	8
	push	OFFSET FLAT:$SG70230
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	eax, DWORD PTR [edx+29736]
	push	eax
	call	_strncmp
	add	esp, 12					; 0000000cH
	test	eax, eax
	jne	$L70229

; 69   : 			/* Mail read : set read field in object */
; 70   : 			char *idobj = strchr(cntxt->qrystr, '=');

	push	61					; 0000003dH
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	edx, DWORD PTR [ecx+29736]
	push	edx
	call	_strchr
	add	esp, 8
	mov	DWORD PTR _idobj$70231[ebp], eax

; 71   : 			char *ua = cntxt->user_agent ? cntxt->user_agent : "Unknown";

	mov	eax, DWORD PTR _cntxt$[ebp]
	cmp	DWORD PTR [eax+29748], 0
	je	SHORT $L70370
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	edx, DWORD PTR [ecx+29748]
	mov	DWORD PTR -270476+[ebp], edx
	jmp	SHORT $L70371
$L70370:
	mov	DWORD PTR -270476+[ebp], OFFSET FLAT:$SG70233
$L70371:
	mov	eax, DWORD PTR -270476+[ebp]
	mov	DWORD PTR _ua$70232[ebp], eax

; 72   : 			unsigned long id = idobj ? strtoul(idobj + 1, NULL, 10) : 0;

	cmp	DWORD PTR _idobj$70231[ebp], 0
	je	SHORT $L70372
	push	10					; 0000000aH
	push	0
	mov	ecx, DWORD PTR _idobj$70231[ebp]
	add	ecx, 1
	push	ecx
	call	_strtoul
	add	esp, 12					; 0000000cH
	mov	DWORD PTR -270480+[ebp], eax
	jmp	SHORT $L70373
$L70372:
	mov	DWORD PTR -270480+[ebp], 0
$L70373:
	mov	edx, DWORD PTR -270480+[ebp]
	mov	DWORD PTR _id$70234[ebp], edx

; 73   : 			if(id && qry_check_idobj(cntxt, id)) qry_add_idobj_field_val(cntxt, id, "_EVA_MAIL_READ", ua, strlen(ua), 1, 0, 0);

	cmp	DWORD PTR _id$70234[ebp], 0
	je	SHORT $L70236
	mov	eax, DWORD PTR _id$70234[ebp]
	push	eax
	mov	ecx, DWORD PTR _cntxt$[ebp]
	push	ecx
	call	_qry_check_idobj
	add	esp, 8
	test	eax, eax
	je	SHORT $L70236
	push	0
	push	0
	push	1
	mov	edx, DWORD PTR _ua$70232[ebp]
	push	edx
	call	_strlen
	add	esp, 4
	push	eax
	mov	eax, DWORD PTR _ua$70232[ebp]
	push	eax
	push	OFFSET FLAT:$SG70237
	mov	ecx, DWORD PTR _id$70234[ebp]
	push	ecx
	mov	edx, DWORD PTR _cntxt$[ebp]
	push	edx
	call	_qry_add_idobj_field_val
	add	esp, 32					; 00000020H
$L70236:

; 74   : 			puts("Location: /img/_eva_nop.gif\r\n");

	push	OFFSET FLAT:$SG70238
	call	_puts
	add	esp, 4

; 75   : 			sql_control(NULL, 6);

	push	6
	push	0
	call	_sql_control
	add	esp, 8

; 76   : 			return 0;

	xor	eax, eax
	jmp	$L70209
$L70229:

; 78   : 		else if(!strncmp(cntxt->qrystr, add_sz_str("DbRedir")))

	push	7
	push	OFFSET FLAT:$SG70242
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	ecx, DWORD PTR [eax+29736]
	push	ecx
	call	_strncmp
	add	esp, 12					; 0000000cH
	test	eax, eax
	jne	$L70241

; 80   : 			/* Redirection to other site : record transfer to current Db & switch to redirected DB */
; 81   : 			char *obj = strchr(cntxt->qrystr, '=');

	push	61					; 0000003dH
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	eax, DWORD PTR [edx+29736]
	push	eax
	call	_strchr
	add	esp, 8
	mov	DWORD PTR _obj$70243[ebp], eax

; 82   : 			unsigned long idobj = obj ? strtoul(obj + 1, NULL, 10) : 0;

	cmp	DWORD PTR _obj$70243[ebp], 0
	je	SHORT $L70374
	push	10					; 0000000aH
	push	0
	mov	ecx, DWORD PTR _obj$70243[ebp]
	add	ecx, 1
	push	ecx
	call	_strtoul
	add	esp, 12					; 0000000cH
	mov	DWORD PTR -270484+[ebp], eax
	jmp	SHORT $L70375
$L70374:
	mov	DWORD PTR -270484+[ebp], 0
$L70375:
	mov	edx, DWORD PTR -270484+[ebp]
	mov	DWORD PTR _idobj$70244[ebp], edx

; 83   : 			char *redir = strchr(cntxt->qrystr, ',');

	push	44					; 0000002cH
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	ecx, DWORD PTR [eax+29736]
	push	ecx
	call	_strchr
	add	esp, 8
	mov	DWORD PTR _redir$70246[ebp], eax

; 84   : 			char *addr = (redir && redir[1]) ? redir + 1 : "Unknown";

	cmp	DWORD PTR _redir$70246[ebp], 0
	je	SHORT $L70376
	mov	edx, DWORD PTR _redir$70246[ebp]
	movsx	eax, BYTE PTR [edx+1]
	test	eax, eax
	je	SHORT $L70376
	mov	ecx, DWORD PTR _redir$70246[ebp]
	add	ecx, 1
	mov	DWORD PTR -270488+[ebp], ecx
	jmp	SHORT $L70377
$L70376:
	mov	DWORD PTR -270488+[ebp], OFFSET FLAT:$SG70248
$L70377:
	mov	edx, DWORD PTR -270488+[ebp]
	mov	DWORD PTR _addr$70247[ebp], edx

; 85   : 			if(idobj && qry_check_idobj(cntxt, idobj)) qry_add_idobj_field_val(cntxt, idobj, "_EVA_DB_REDIR", addr, strlen(addr), 1, 0, 0);

	cmp	DWORD PTR _idobj$70244[ebp], 0
	je	SHORT $L70249
	mov	eax, DWORD PTR _idobj$70244[ebp]
	push	eax
	mov	ecx, DWORD PTR _cntxt$[ebp]
	push	ecx
	call	_qry_check_idobj
	add	esp, 8
	test	eax, eax
	je	SHORT $L70249
	push	0
	push	0
	push	1
	mov	edx, DWORD PTR _addr$70247[ebp]
	push	edx
	call	_strlen
	add	esp, 4
	push	eax
	mov	eax, DWORD PTR _addr$70247[ebp]
	push	eax
	push	OFFSET FLAT:$SG70250
	mov	ecx, DWORD PTR _idobj$70244[ebp]
	push	ecx
	mov	edx, DWORD PTR _cntxt$[ebp]
	push	edx
	call	_qry_add_idobj_field_val
	add	esp, 32					; 00000020H
$L70249:

; 86   : 			printf("Location: /eva/%s.cgi\r\n\r\n", redir ? redir + 1 : "");

	cmp	DWORD PTR _redir$70246[ebp], 0
	je	SHORT $L70378
	mov	eax, DWORD PTR _redir$70246[ebp]
	add	eax, 1
	mov	DWORD PTR -270492+[ebp], eax
	jmp	SHORT $L70379
$L70378:
	mov	DWORD PTR -270492+[ebp], OFFSET FLAT:$SG70251
$L70379:
	mov	ecx, DWORD PTR -270492+[ebp]
	push	ecx
	push	OFFSET FLAT:$SG70252
	call	_printf
	add	esp, 8

; 87   : 			sql_control(NULL, 6);

	push	6
	push	0
	call	_sql_control
	add	esp, 8

; 88   : 			return 0;

	xor	eax, eax
	jmp	$L70209
$L70241:

; 90   : 		else if(!strncmp(cntxt->qrystr, add_sz_str("TPE=")))

	push	4
	push	OFFSET FLAT:$SG70256
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	eax, DWORD PTR [edx+29736]
	push	eax
	call	_strncmp
	add	esp, 12					; 0000000cH
	test	eax, eax
	jne	SHORT $L70255

; 92   : 			/* Payment transaction result : call handler */
; 93   : 		 	action_pay_site(cntxt, 0);

	push	0
	mov	ecx, DWORD PTR _cntxt$[ebp]
	push	ecx
	call	_action_pay_site
	add	esp, 8

; 94   : 			sql_control(NULL, 6);

	push	6
	push	0
	call	_sql_control
	add	esp, 8

; 95   : 			return 0;

	xor	eax, eax
	jmp	$L70209
$L70255:

; 97   : 		else if(!strncmp(cntxt->qrystr, add_sz_str("PaySite")))

	push	7
	push	OFFSET FLAT:$SG70260
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	eax, DWORD PTR [edx+29736]
	push	eax
	call	_strncmp
	add	esp, 12					; 0000000cH
	test	eax, eax
	jne	SHORT $L70259

; 99   : 			/* Payment transaction return : call handler */
; 100  : 		 	action_pay_site(cntxt, 0);

	push	0
	mov	ecx, DWORD PTR _cntxt$[ebp]
	push	ecx
	call	_action_pay_site
	add	esp, 8
$L70259:

; 103  : 
; 104  : 	/* Initialize random generator */
; 105  : 	srand((unsigned int)(getpid() ^ time(NULL)));

	call	_getpid
	mov	esi, eax
	push	0
	call	_time
	add	esp, 4
	xor	esi, eax
	push	esi
	call	_srand
	add	esp, 4

; 106  : 
; 107  : 	/* Handle scheduled actions */
; 108  : 	if(argc == 2 && (!strcmp(argv[1], "DayTask") || !strcmp(argv[1], "HourTask")))

	cmp	DWORD PTR _argc$[ebp], 2
	jne	SHORT $L70263
	push	OFFSET FLAT:$SG70265
	mov	edx, DWORD PTR _argv$[ebp]
	mov	eax, DWORD PTR [edx+4]
	push	eax
	call	_strcmp
	add	esp, 8
	test	eax, eax
	je	SHORT $L70264
	push	OFFSET FLAT:$SG70266
	mov	ecx, DWORD PTR _argv$[ebp]
	mov	edx, DWORD PTR [ecx+4]
	push	edx
	call	_strcmp
	add	esp, 8
	test	eax, eax
	jne	SHORT $L70263
$L70264:

; 110  : 		taskplan_sequence(cntxt, argv[1]);

	mov	eax, DWORD PTR _argv$[ebp]
	mov	ecx, DWORD PTR [eax+4]
	push	ecx
	mov	edx, DWORD PTR _cntxt$[ebp]
	push	edx
	call	_taskplan_sequence
	add	esp, 8

; 111  : 		sql_control(NULL, 6);

	push	6
	push	0
	call	_sql_control
	add	esp, 8

; 112  : 		return 0;

	xor	eax, eax
	jmp	$L70209
$L70263:

; 114  : 
; 115  : 	/* Initialize call data */
; 116  : 	if(!cgi_init_call(cntxt))

	mov	eax, DWORD PTR _cntxt$[ebp]
	push	eax
	call	_cgi_init_call
	add	esp, 4
	test	eax, eax
	jne	$L70290

; 118  : 		DynBuffer *title = NULL;

	mov	DWORD PTR _title$70269[ebp], 0

; 119  : 		unsigned long idform = 0, idobj = 0;

	mov	DWORD PTR _idform$70271[ebp], 0
	mov	DWORD PTR _idobj$70272[ebp], 0

; 120  : 
; 121  : 		/* Handle specific CGI POST calls */
; 122  : 		if(cntxt->cgi && cntxt->cgi->name && !strcmp("TPE", cntxt->cgi->name))

	mov	ecx, DWORD PTR _cntxt$[ebp]
	cmp	DWORD PTR [ecx+29648], 0
	je	$L70273
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	eax, DWORD PTR [edx+29648]
	cmp	DWORD PTR [eax], 0
	je	SHORT $L70273
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	edx, DWORD PTR [ecx+29648]
	mov	eax, DWORD PTR [edx]
	push	eax
	push	OFFSET FLAT:$SG70274
	call	_strcmp
	add	esp, 8
	test	eax, eax
	jne	SHORT $L70273

; 124  : 			/* Payment transaction result : call handler */
; 125  : 		 	action_pay_site(cntxt, 0);

	push	0
	mov	ecx, DWORD PTR _cntxt$[ebp]
	push	ecx
	call	_action_pay_site
	add	esp, 8

; 126  : 			t0 = clock();

	call	_clock
	mov	DWORD PTR _t0$[ebp], eax

; 127  : 			cntxt->txtime = clock() - t0;

	call	_clock
	sub	eax, DWORD PTR _t0$[ebp]
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+32028], eax

; 128  : 			output_log_end(cntxt);

	mov	eax, DWORD PTR _cntxt$[ebp]
	push	eax
	call	_output_log_end
	add	esp, 4

; 129  : 			sql_control(NULL, 6);

	push	6
	push	0
	call	_sql_control
	add	esp, 8

; 130  : 			return 0;

	xor	eax, eax
	jmp	$L70209
$L70273:

; 132  : 
; 133  : 		/* Handle page title on OpenForm call */
; 134  : 		if(sscanf(cntxt->qrystr, "OpenForm=%lu,%lu", &idform, &idobj) == 2 && idform)

	lea	ecx, DWORD PTR _idobj$70272[ebp]
	push	ecx
	lea	edx, DWORD PTR _idform$70271[ebp]
	push	edx
	push	OFFSET FLAT:$SG70277
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	ecx, DWORD PTR [eax+29736]
	push	ecx
	call	_sscanf
	add	esp, 16					; 00000010H
	cmp	eax, 2
	jne	$L70276
	cmp	DWORD PTR _idform$70271[ebp], 0
	je	$L70276

; 136  : 			dynbuf_add(&title, cntxt->dbname, strlen(cntxt->dbname), TO_HTML);

	push	1
	push	OFFSET FLAT:_plain_to_html
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	eax, DWORD PTR [edx+29804]
	push	eax
	call	_strlen
	add	esp, 4
	push	eax
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	edx, DWORD PTR [ecx+29804]
	push	edx
	lea	eax, DWORD PTR _title$70269[ebp]
	push	eax
	call	_dynbuf_add
	add	esp, 20					; 00000014H

; 137  : 			dynbuf_add(&title, add_sz_str(" - "), NO_CONV);

	push	0
	push	0
	push	3
	push	OFFSET FLAT:$SG70279
	lea	ecx, DWORD PTR _title$70269[ebp]
	push	ecx
	call	_dynbuf_add
	add	esp, 20					; 00000014H

; 138  : 			qry_obj_label(cntxt, &title, NULL, NULL, &title, NULL, NULL, NULL, NULL, idform, NULL, idobj);

	mov	edx, DWORD PTR _idobj$70272[ebp]
	push	edx
	push	0
	mov	eax, DWORD PTR _idform$70271[ebp]
	push	eax
	push	0
	push	0
	push	0
	push	0
	lea	ecx, DWORD PTR _title$70269[ebp]
	push	ecx
	push	0
	push	0
	lea	edx, DWORD PTR _title$70269[ebp]
	push	edx
	mov	eax, DWORD PTR _cntxt$[ebp]
	push	eax
	call	_qry_obj_label
	add	esp, 48					; 00000030H
$L70276:

; 140  : 
; 141  : 		/* Output page header (HTML header) */
; 142  : 		put_html_page_header(cntxt, NULL, title ? title->data : NULL, NULL, 1);

	cmp	DWORD PTR _title$70269[ebp], 0
	je	SHORT $L70380
	mov	ecx, DWORD PTR _title$70269[ebp]
	add	ecx, 8
	mov	DWORD PTR -270496+[ebp], ecx
	jmp	SHORT $L70381
$L70380:
	mov	DWORD PTR -270496+[ebp], 0
$L70381:
	push	1
	push	0
	mov	edx, DWORD PTR -270496+[ebp]
	push	edx
	push	0
	mov	eax, DWORD PTR _cntxt$[ebp]
	push	eax
	call	_put_html_page_header
	add	esp, 20					; 00000014H

; 143  : 		M_FREE(title);

	mov	ecx, DWORD PTR _title$70269[ebp]
	push	ecx
	call	_mem_free
	add	esp, 4
	mov	DWORD PTR _title$70269[ebp], 0

; 144  : 
; 145  : 		/* Check login & process form */
; 146  : 		if(!check_login(cntxt))

	mov	edx, DWORD PTR _cntxt$[ebp]
	push	edx
	call	_check_login
	add	esp, 4
	test	eax, eax
	jne	SHORT $L70290

; 148  : 			/* Output page header (background & wait message) */
; 149  : 			put_html_page_header(cntxt, NULL, NULL, NULL, 2);

	push	2
	push	0
	push	0
	push	0
	mov	eax, DWORD PTR _cntxt$[ebp]
	push	eax
	call	_put_html_page_header
	add	esp, 20					; 00000014H

; 150  : 			process_form(cntxt);

	mov	ecx, DWORD PTR _cntxt$[ebp]
	push	ecx
	call	_process_form
	add	esp, 4
$L70290:

; 153  : 
; 154  : 	/* Output page header (form) */
; 155  : 	put_html_page_header(cntxt, NULL, NULL, NULL, 3);

	push	3
	push	0
	push	0
	push	0
	mov	edx, DWORD PTR _cntxt$[ebp]
	push	edx
	call	_put_html_page_header
	add	esp, 20					; 00000014H

; 156  : 
; 157  : 	if(!(cntxt->b_terminate & 64))

	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	ecx, DWORD PTR [eax+29776]
	and	ecx, 64					; 00000040H
	test	ecx, ecx
	jne	$L70307

; 159  : 		/* Output session data as hidden input : , , , ,  */
; 160  : 		cntxt->txsize += printf("<input type=hidden name=S value=%s$%s$%s$%s$%s>\n"
; 161  : 				,dyntab_val(&cntxt->session, 0, 0)	/* session id */
; 162  : 				,dyntab_val(&cntxt->id_form, 0, 0)	/* current form id */
; 163  : 				,dyntab_val(&cntxt->id_obj, 0, 0)	/* current object id */
; 164  : 				,dyntab_val(&cntxt->alt_form, 0, 0)	/* alternate form id */
; 165  : 				,dyntab_val(&cntxt->alt_obj, 0, 0)	/* current object id in alternate form */
; 166  : 				);

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
	push	OFFSET FLAT:$SG70298
	call	_printf
	add	esp, 24					; 00000018H
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	edx, DWORD PTR [ecx+32036]
	add	edx, eax
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+32036], edx

; 167  : 
; 168  : 		/* Output page data */
; 169  : 		if(cntxt->err.text) put_html_error(cntxt);

	mov	ecx, DWORD PTR _cntxt$[ebp]
	cmp	DWORD PTR [ecx+29872], 0
	je	SHORT $L70299
	mov	edx, DWORD PTR _cntxt$[ebp]
	push	edx
	call	_put_html_error
	add	esp, 4

; 170  : 		else

	jmp	$L70307
$L70299:

; 172  : 			debug_put_cgi(cntxt);

	mov	eax, DWORD PTR _cntxt$[ebp]
	push	eax
	call	_debug_put_cgi
	add	esp, 4

; 173  : 			if(cntxt->htmlhidden) cntxt->txsize += printf("%s", cntxt->htmlhidden->data);

	mov	ecx, DWORD PTR _cntxt$[ebp]
	cmp	DWORD PTR [ecx+29796], 0
	je	SHORT $L70301
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	eax, DWORD PTR [edx+29796]
	add	eax, 8
	push	eax
	push	OFFSET FLAT:$SG70302
	call	_printf
	add	esp, 8
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	edx, DWORD PTR [ecx+32036]
	add	edx, eax
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+32036], edx
$L70301:

; 174  : 			if(cntxt->html0) cntxt->txsize += printf("%s", cntxt->html0->data);

	mov	ecx, DWORD PTR _cntxt$[ebp]
	cmp	DWORD PTR [ecx+29792], 0
	je	SHORT $L70303
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	eax, DWORD PTR [edx+29792]
	add	eax, 8
	push	eax
	push	OFFSET FLAT:$SG70304
	call	_printf
	add	esp, 8
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	edx, DWORD PTR [ecx+32036]
	add	edx, eax
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+32036], edx
$L70303:

; 175  : 			if(cntxt->html) cntxt->txsize += printf("%s", cntxt->html->data);

	mov	ecx, DWORD PTR _cntxt$[ebp]
	cmp	DWORD PTR [ecx+29784], 0
	je	SHORT $L70305
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	eax, DWORD PTR [edx+29784]
	add	eax, 8
	push	eax
	push	OFFSET FLAT:$SG70306
	call	_printf
	add	esp, 8
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	edx, DWORD PTR [ecx+32036]
	add	edx, eax
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+32036], edx
$L70305:

; 176  : 			if(cntxt->html1) cntxt->txsize += printf("%s", cntxt->html1->data);

	mov	ecx, DWORD PTR _cntxt$[ebp]
	cmp	DWORD PTR [ecx+29788], 0
	je	SHORT $L70307
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	eax, DWORD PTR [edx+29788]
	add	eax, 8
	push	eax
	push	OFFSET FLAT:$SG70308
	call	_printf
	add	esp, 8
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	edx, DWORD PTR [ecx+32036]
	add	edx, eax
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+32036], edx
$L70307:

; 179  : 
; 180  : 	/* Output page trailer & log end */
; 181  : 	t0 = clock();

	call	_clock
	mov	DWORD PTR _t0$[ebp], eax

; 182  : 	cntxt->txtime = clock() - t0;

	call	_clock
	sub	eax, DWORD PTR _t0$[ebp]
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+32028], eax

; 183  : 	put_html_page_trailer(cntxt, NULL);

	push	0
	mov	edx, DWORD PTR _cntxt$[ebp]
	push	edx
	call	_put_html_page_trailer
	add	esp, 8

; 184  : 	output_log_end(cntxt);

	mov	eax, DWORD PTR _cntxt$[ebp]
	push	eax
	call	_output_log_end
	add	esp, 4

; 185  : 
; 186  : 	/* Update session statistics if session exist */
; 187  : 	if(cntxt->sess_data.nbrows)

	mov	ecx, DWORD PTR _cntxt$[ebp]
	cmp	DWORD PTR [ecx+29320], 0
	je	$L70337

; 189  : 		/* Read session trace params */
; 190  : 		DynTable data = {0};

	mov	DWORD PTR _data$70311[ebp], 0
	xor	edx, edx
	mov	DWORD PTR _data$70311[ebp+4], edx
	mov	DWORD PTR _data$70311[ebp+8], edx
	mov	DWORD PTR _data$70311[ebp+12], edx
	mov	DWORD PTR _data$70311[ebp+16], edx

; 191  : 		int b_obj = 0, b_form = 0;

	mov	DWORD PTR _b_obj$70312[ebp], 0
	mov	DWORD PTR _b_form$70313[ebp], 0

; 192  : 		unsigned long i;
; 193  : 		dyntab_filter_field(&data, 0, &cntxt->user_data, "_EVA_SESSION_TRACE", ~0UL, NULL);

	push	0
	push	-1
	push	OFFSET FLAT:$SG70316
	mov	eax, DWORD PTR _cntxt$[ebp]
	add	eax, 29428				; 000072f4H
	push	eax
	push	0
	lea	ecx, DWORD PTR _data$70311[ebp]
	push	ecx
	call	_dyntab_filter_field
	add	esp, 24					; 00000018H

; 194  : 		for(i = 0; i < data.nbrows; i++)

	mov	DWORD PTR _i$70314[ebp], 0
	jmp	SHORT $L70317
$L70318:
	mov	edx, DWORD PTR _i$70314[ebp]
	add	edx, 1
	mov	DWORD PTR _i$70314[ebp], edx
$L70317:
	mov	eax, DWORD PTR _i$70314[ebp]
	cmp	eax, DWORD PTR _data$70311[ebp]
	jae	SHORT $L70319

; 196  : 			char *tr = dyntab_val(&data, i, 0);

	push	0
	mov	ecx, DWORD PTR _i$70314[ebp]
	push	ecx
	lea	edx, DWORD PTR _data$70311[ebp]
	push	edx
	call	_dyntab_val
	add	esp, 12					; 0000000cH
	mov	DWORD PTR _tr$70320[ebp], eax

; 197  : 			if(!strcmp(tr, "_EVA_OBJ")) b_obj = 1;

	push	OFFSET FLAT:$SG70322
	mov	eax, DWORD PTR _tr$70320[ebp]
	push	eax
	call	_strcmp
	add	esp, 8
	test	eax, eax
	jne	SHORT $L70321
	mov	DWORD PTR _b_obj$70312[ebp], 1

; 198  : 			else if(!strcmp(tr, "_EVA_FORM")) b_form = 1;

	jmp	SHORT $L70324
$L70321:
	push	OFFSET FLAT:$SG70325
	mov	ecx, DWORD PTR _tr$70320[ebp]
	push	ecx
	call	_strcmp
	add	esp, 8
	test	eax, eax
	jne	SHORT $L70324
	mov	DWORD PTR _b_form$70313[ebp], 1
$L70324:

; 199  : 		}

	jmp	$L70318
$L70319:

; 200  : 		dyntab_free(&data);

	lea	edx, DWORD PTR _data$70311[ebp]
	push	edx
	call	_dyntab_free
	add	esp, 4

; 201  : 
; 202  : 		/* Add selected infos */
; 203  : 		set_session_statistics(cntxt, &cntxt->sess_data, ~0UL, IDVAL("_EVA_USER_IP"));

	push	12					; 0000000cH
	push	OFFSET FLAT:$SG70326
	mov	eax, DWORD PTR _cntxt$[ebp]
	push	eax
	call	_get_id_value
	add	esp, 12					; 0000000cH
	push	eax
	push	-1
	mov	ecx, DWORD PTR _cntxt$[ebp]
	add	ecx, 29320				; 00007288H
	push	ecx
	mov	edx, DWORD PTR _cntxt$[ebp]
	push	edx
	call	_set_session_statistics
	add	esp, 16					; 00000010H

; 204  : 		if(b_obj)

	cmp	DWORD PTR _b_obj$70312[ebp], 0
	je	$L70331

; 206  : 			unsigned long val_SESSION_OBJ;
; 207  : 			sql_add_value(cntxt, add_sz_str("_EVA_SESSION_OBJ"), &val_SESSION_OBJ);

	lea	eax, DWORD PTR _val_SESSION_OBJ$70328[ebp]
	push	eax
	push	16					; 00000010H
	push	OFFSET FLAT:$SG70329
	mov	ecx, DWORD PTR _cntxt$[ebp]
	push	ecx
	call	_sql_add_value
	add	esp, 16					; 00000010H

; 208  : 			set_session_statistics(cntxt, &cntxt->sess_data, DYNTAB_TOUL(&cntxt->id_obj), val_SESSION_OBJ);

	mov	edx, DWORD PTR _val_SESSION_OBJ$70328[ebp]
	push	edx
	push	10					; 0000000aH
	push	0
	push	0
	push	0
	mov	eax, DWORD PTR _cntxt$[ebp]
	add	eax, 20					; 00000014H
	push	eax
	call	_dyntab_val
	add	esp, 12					; 0000000cH
	push	eax
	call	_strtoul
	add	esp, 12					; 0000000cH
	push	eax
	mov	ecx, DWORD PTR _cntxt$[ebp]
	add	ecx, 29320				; 00007288H
	push	ecx
	mov	edx, DWORD PTR _cntxt$[ebp]
	push	edx
	call	_set_session_statistics
	add	esp, 16					; 00000010H

; 209  : 			if(cntxt->alt_form.nbrows) set_session_statistics(cntxt, &cntxt->sess_data, DYNTAB_TOUL(&cntxt->alt_obj), val_SESSION_OBJ);

	mov	eax, DWORD PTR _cntxt$[ebp]
	cmp	DWORD PTR [eax+40], 0
	je	SHORT $L70331
	mov	ecx, DWORD PTR _val_SESSION_OBJ$70328[ebp]
	push	ecx
	push	10					; 0000000aH
	push	0
	push	0
	push	0
	mov	edx, DWORD PTR _cntxt$[ebp]
	add	edx, 60					; 0000003cH
	push	edx
	call	_dyntab_val
	add	esp, 12					; 0000000cH
	push	eax
	call	_strtoul
	add	esp, 12					; 0000000cH
	push	eax
	mov	eax, DWORD PTR _cntxt$[ebp]
	add	eax, 29320				; 00007288H
	push	eax
	mov	ecx, DWORD PTR _cntxt$[ebp]
	push	ecx
	call	_set_session_statistics
	add	esp, 16					; 00000010H
$L70331:

; 211  : 		if(b_form)

	cmp	DWORD PTR _b_form$70313[ebp], 0
	je	$L70337

; 213  : 			unsigned long val_SESSION_FORM;
; 214  : 			sql_add_value(cntxt, add_sz_str("_EVA_SESSION_FORM"), &val_SESSION_FORM);

	lea	edx, DWORD PTR _val_SESSION_FORM$70334[ebp]
	push	edx
	push	17					; 00000011H
	push	OFFSET FLAT:$SG70335
	mov	eax, DWORD PTR _cntxt$[ebp]
	push	eax
	call	_sql_add_value
	add	esp, 16					; 00000010H

; 215  : 			set_session_statistics(cntxt, &cntxt->sess_data, DYNTAB_TOUL(&cntxt->id_form), val_SESSION_FORM);

	mov	ecx, DWORD PTR _val_SESSION_FORM$70334[ebp]
	push	ecx
	push	10					; 0000000aH
	push	0
	push	0
	push	0
	mov	edx, DWORD PTR _cntxt$[ebp]
	push	edx
	call	_dyntab_val
	add	esp, 12					; 0000000cH
	push	eax
	call	_strtoul
	add	esp, 12					; 0000000cH
	push	eax
	mov	eax, DWORD PTR _cntxt$[ebp]
	add	eax, 29320				; 00007288H
	push	eax
	mov	ecx, DWORD PTR _cntxt$[ebp]
	push	ecx
	call	_set_session_statistics
	add	esp, 16					; 00000010H

; 216  : 			if(cntxt->alt_form.nbrows) set_session_statistics(cntxt, &cntxt->sess_data, DYNTAB_TOUL(&cntxt->alt_form), val_SESSION_FORM);

	mov	edx, DWORD PTR _cntxt$[ebp]
	cmp	DWORD PTR [edx+40], 0
	je	SHORT $L70337
	mov	eax, DWORD PTR _val_SESSION_FORM$70334[ebp]
	push	eax
	push	10					; 0000000aH
	push	0
	push	0
	push	0
	mov	ecx, DWORD PTR _cntxt$[ebp]
	add	ecx, 40					; 00000028H
	push	ecx
	call	_dyntab_val
	add	esp, 12					; 0000000cH
	push	eax
	call	_strtoul
	add	esp, 12					; 0000000cH
	push	eax
	mov	edx, DWORD PTR _cntxt$[ebp]
	add	edx, 29320				; 00007288H
	push	edx
	mov	eax, DWORD PTR _cntxt$[ebp]
	push	eax
	call	_set_session_statistics
	add	esp, 16					; 00000010H
$L70337:

; 219  : 
; 220  : 	/* Output HTML trace if applicable */
; 221  : 	if(cntxt->debug & DEBUG_HTML_RAW)

	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	edx, DWORD PTR [ecx+29860]
	and	edx, 256				; 00000100H
	test	edx, edx
	je	$L70347

; 223  : 		FILE *f = NULL;

	mov	DWORD PTR _f$70340[ebp], 0

; 224  : 		char fname[128];
; 225  : 		sprintf(fname, "%s-%s.html", cntxt->dbname, dyntab_val(&cntxt->id_user, 0, 0));

	push	0
	push	0
	mov	eax, DWORD PTR _cntxt$[ebp]
	add	eax, 29408				; 000072e0H
	push	eax
	call	_dyntab_val
	add	esp, 12					; 0000000cH
	push	eax
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	edx, DWORD PTR [ecx+29804]
	push	edx
	push	OFFSET FLAT:$SG70343
	lea	eax, DWORD PTR _fname$70342[ebp]
	push	eax
	call	_sprintf
	add	esp, 16					; 00000010H

; 226  : 		chdir(cntxt->rootdir);

	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	edx, DWORD PTR [ecx+29724]
	push	edx
	call	_chdir
	add	esp, 4

; 227  : 		if(!chdir("trace")) f = fopen(fname, "w");

	push	OFFSET FLAT:$SG70345
	call	_chdir
	add	esp, 4
	test	eax, eax
	jne	SHORT $L70344
	push	OFFSET FLAT:$SG70346
	lea	eax, DWORD PTR _fname$70342[ebp]
	push	eax
	call	_fopen
	add	esp, 8
	mov	DWORD PTR _f$70340[ebp], eax
$L70344:

; 228  : 		if(f)

	cmp	DWORD PTR _f$70340[ebp], 0
	je	$L70347

; 230  : 			cntxt->b_header = 0;

	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29760], 0

; 231  : 			cntxt->b_bodyheader = 0;

	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29764], 0

; 232  : 			cntxt->b_formheader = 0;

	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29768], 0

; 233  : 			put_html_page_header(cntxt, f, "Trace utilisateur - rafraichissement toutes les 10 secondes", NULL, 3);

	push	3
	push	0
	push	OFFSET FLAT:$SG70349
	mov	ecx, DWORD PTR _f$70340[ebp]
	push	ecx
	mov	edx, DWORD PTR _cntxt$[ebp]
	push	edx
	call	_put_html_page_header
	add	esp, 20					; 00000014H

; 234  : 			fprintf(f, "%s%s%s%lu%s",
; 235  : 				"<table noborder width=100%><tr><td align=center><b>Navigation partagée - copie d'écran </b></td><td>"
; 236  : 				"<input type=submit name=TraceRefresh value='Afficher la page suivante' "
; 237  : 						"Onclick=\"window.location.href='/trace/", cntxt->dbname, "-", DYNTAB_TOUL(&cntxt->id_user), ".html'\"></td></tr></table>");

	push	OFFSET FLAT:$SG70351
	push	10					; 0000000aH
	push	0
	push	0
	push	0
	mov	eax, DWORD PTR _cntxt$[ebp]
	add	eax, 29408				; 000072e0H
	push	eax
	call	_dyntab_val
	add	esp, 12					; 0000000cH
	push	eax
	call	_strtoul
	add	esp, 12					; 0000000cH
	push	eax
	push	OFFSET FLAT:$SG70352
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	edx, DWORD PTR [ecx+29804]
	push	edx
	push	OFFSET FLAT:$SG70353
	push	OFFSET FLAT:$SG70354
	mov	eax, DWORD PTR _f$70340[ebp]
	push	eax
	call	_fprintf
	add	esp, 28					; 0000001cH

; 238  : 			if(cntxt->err.text)

	mov	ecx, DWORD PTR _cntxt$[ebp]
	cmp	DWORD PTR [ecx+29872], 0
	je	SHORT $L70355

; 239  : 				fprintf(f,
; 240  : 					"<font face=Arial><b><u>*** Erreur : </u><a href='../errlog/%s'>%s</a>", cntxt->err.file, cntxt->err.text);

	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	eax, DWORD PTR [edx+29872]
	push	eax
	mov	ecx, DWORD PTR _cntxt$[ebp]
	add	ecx, 29904				; 000074d0H
	push	ecx
	push	OFFSET FLAT:$SG70356
	mov	edx, DWORD PTR _f$70340[ebp]
	push	edx
	call	_fprintf
	add	esp, 16					; 00000010H

; 241  : 			else

	jmp	$L70360
$L70355:

; 243  : 				if(cntxt->html0) fputs(cntxt->html0->data, f);

	mov	eax, DWORD PTR _cntxt$[ebp]
	cmp	DWORD PTR [eax+29792], 0
	je	SHORT $L70358
	mov	ecx, DWORD PTR _f$70340[ebp]
	push	ecx
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	eax, DWORD PTR [edx+29792]
	add	eax, 8
	push	eax
	call	_fputs
	add	esp, 8
$L70358:

; 244  : 				if(cntxt->html) fputs(cntxt->html->data, f);

	mov	ecx, DWORD PTR _cntxt$[ebp]
	cmp	DWORD PTR [ecx+29784], 0
	je	SHORT $L70359
	mov	edx, DWORD PTR _f$70340[ebp]
	push	edx
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	ecx, DWORD PTR [eax+29784]
	add	ecx, 8
	push	ecx
	call	_fputs
	add	esp, 8
$L70359:

; 245  : 				if(cntxt->html1) fputs(cntxt->html1->data, f);

	mov	edx, DWORD PTR _cntxt$[ebp]
	cmp	DWORD PTR [edx+29788], 0
	je	SHORT $L70360
	mov	eax, DWORD PTR _f$70340[ebp]
	push	eax
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	edx, DWORD PTR [ecx+29788]
	add	edx, 8
	push	edx
	call	_fputs
	add	esp, 8
$L70360:

; 247  : 
; 248  : 			/* Set refresh timeout */
; 249  : 			fprintf(f, "%s%s%s%lu%s",
; 250  : 				"<script type=text/javascript>"
; 251  : 				"setTimeout('window.location.href=\"/trace/", cntxt->dbname, "-", DYNTAB_TOUL(&cntxt->id_user), ".html\"',10000);"
; 252  : 				"document.mainform['TraceRefresh'].focus();</script>");

	push	OFFSET FLAT:$SG70362
	push	10					; 0000000aH
	push	0
	push	0
	push	0
	mov	eax, DWORD PTR _cntxt$[ebp]
	add	eax, 29408				; 000072e0H
	push	eax
	call	_dyntab_val
	add	esp, 12					; 0000000cH
	push	eax
	call	_strtoul
	add	esp, 12					; 0000000cH
	push	eax
	push	OFFSET FLAT:$SG70363
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	edx, DWORD PTR [ecx+29804]
	push	edx
	push	OFFSET FLAT:$SG70364
	push	OFFSET FLAT:$SG70365
	mov	eax, DWORD PTR _f$70340[ebp]
	push	eax
	call	_fprintf
	add	esp, 28					; 0000001cH

; 253  : 			put_html_page_trailer(cntxt, f);

	mov	ecx, DWORD PTR _f$70340[ebp]
	push	ecx
	mov	edx, DWORD PTR _cntxt$[ebp]
	push	edx
	call	_put_html_page_trailer
	add	esp, 8

; 254  : 			fclose(f);

	mov	eax, DWORD PTR _f$70340[ebp]
	push	eax
	call	_fclose
	add	esp, 4
$L70347:

; 257  : 	sql_control(NULL, 6);

	push	6
	push	0
	call	_sql_control
	add	esp, 8

; 258  : 	return 0;

	xor	eax, eax
$L70209:

; 259  : }

	pop	edi
	pop	esi
	mov	esp, ebp
	pop	ebp
	ret	0
_main	ENDP
_TEXT	ENDS
END
