	TITLE	D:\Travail\ABI\EVA\V4.0\CGI\Brunix-2016\action_export.c
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
PUBLIC	_action_export_triplets
EXTRN	_fprintf:NEAR
EXTRN	__snprintf:NEAR
EXTRN	_FILE_write_tabrc:NEAR
EXTRN	_sql_exec_query:NEAR
EXTRN	_get_id_value:NEAR
EXTRN	_mem_free:NEAR
EXTRN	_qry_values_list:NEAR
EXTRN	_strtoul:NEAR
EXTRN	_dynbuf_add:NEAR
EXTRN	_dynbuf_add3:NEAR
EXTRN	_dynbuf_add3_int:NEAR
EXTRN	_dyntab_free:NEAR
EXTRN	_sql_get_table:NEAR
EXTRN	_dyntab_val:NEAR
EXTRN	_err_add_context:NEAR
EXTRN	_err_clear:NEAR
_DATA	SEGMENT
$SG70221 DB	'SELECT DISTINCT IdObj FROM IdList', 00H
	ORG $+2
$SG70225 DB	'-- action_export : build forms list', 0aH, 'SELECT TLink'
	DB	'.IdObj FROM TLink ', 0aH, 'INNER JOIN TLink AS TLink0 ON TLin'
	DB	'k.IdObj=TLink0.IdObj ', 0aH, 'WHERE TLink.IdObj NOT IN (', 00H
	ORG $+2
$SG70227 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70230 DB	'_EVA_FORM', 00H
	ORG $+2
$SG70231 DB	'_EVA_CONTROL', 00H
	ORG $+3
$SG70232 DB	'_EVA_FORMSTAMP', 00H
	ORG $+1
$SG70233 DB	') AND TLink.DateDel IS NULL AND TLink.IdField=%lu AND TL'
	DB	'ink.IdRelObj=%d ', 0aH, 'AND TLink0.DateDel IS NULL AND TLink'
	DB	'0.IdField=%lu AND TLink0.IdValue=%lu ', 0aH, 'GROUP BY IdObj', 00H
	ORG $+2
$SG70240 DB	0aH, 00H
	ORG $+2
$SG70241 DB	'-- action_export : get child ids - level=', 00H
	ORG $+2
$SG70243 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70245 DB	' AS Lvl ', 0aH, 'FROM TLink ', 0aH, 'INNER JOIN IdList O'
	DB	'N TLink.IdObj=IdList.IdObj ', 0aH, 00H
	ORG $+3
$SG70246 DB	'CREATE TEMPORARY TABLE IdListTmp TYPE=HEAP ', 0aH, 'SELE'
	DB	'CT TLink.IdRelObj, ', 00H
$SG70248 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70250 DB	' AND TLink.DateDel IS NULL AND TLink.IdRelObj IS NOT NUL'
	DB	'L ', 0aH, 00H
$SG70251 DB	'WHERE IdList.Lvl=', 00H
	ORG $+2
$SG70253 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70257 DB	') ', 0aH, 'GROUP BY TLink.IdRelObj', 00H
	ORG $+1
$SG70258 DB	'AND TLink.IdRelObj NOT IN (', 00H
$SG70260 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70263 DB	'INSERT IGNORE IdList SELECT * FROM IdListTmp', 00H
	ORG $+3
$SG70266 DB	'DROP TABLE IdListTmp', 00H
	ORG $+3
$SG70267 DB	'SELECT COUNT(*) FROM IdList', 00H
$SG70272 DB	') ', 0aH, 'GROUP BY TLink0.IdObj,TVal.TxtValue ', 0aH, 'O'
	DB	'RDER BY IdObj', 00H
	ORG $+1
$SG70273 DB	'SELECT TLink0.IdObj AS IdObj,TVal.TxtValue AS Label ', 0aH
	DB	'FROM TLink ', 0aH, 'INNER JOIN IdList ON TLink.IdObj=IdList.I'
	DB	'dObj ', 0aH, 'INNER JOIN TLink AS TLink0 ON TLink.IdRelObj=TL'
	DB	'ink0.IdObj ', 0aH, 'INNER JOIN TVal as TField ON TLink0.IdFie'
	DB	'ld=TField.IdValue ', 0aH, 'INNER JOIN TVal ON TLink0.IdValue='
	DB	'TVal.IdValue ', 0aH, 'WHERE TField.TxtValue=''_EVA_LABEL'' AN'
	DB	'D TLink.DateDel IS NULL AND TLink0.DateDel IS NULL ', 0aH, 'A'
	DB	'ND TLink.IdRelObj IN (', 00H
$SG70275 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70278 DB	0aH, 00H
	ORG $+2
$SG70281 DB	'-- action_export : read objects data', 0aH, 'SELECT DIST'
	DB	'INCT TLink.IdObj AS IdObj,TField.TxtValue AS Field,IF(TVal.Tx'
	DB	'tValue IS NULL,TLink.IdRelObj,TVal.TxtValue) AS Value,IF(TLin'
	DB	'k.IdRelObj IS NULL,''V'',''R'') AS Type,TLink.Num,TLink.Line '
	DB	0aH, 'FROM TLink INNER JOIN IdList ON TLink.IdObj=IdList.IdObj'
	DB	' ', 0aH, 'INNER JOIN TVal as TField ON TLink.IdField=TField.I'
	DB	'dValue ', 0aH, 'LEFT JOIN TVal ON TLink.IdValue=TVal.IdValue '
	DB	0aH, 'WHERE TLink.DateDel IS NULL ', 0aH, 'ORDER BY IdList.Lvl'
	DB	',TLink.IdObj,TLink.IdField,TLink.Line,TLink.Num', 00H
	ORG $+1
$SG70282 DB	'DROP TABLE IdList', 00H
	ORG $+2
$SG70284 DB	'D:\Travail\ABI\EVA\V4.0\CGI\Brunix-2016\action_export.c', 00H
$SG70285 DB	'action_export_triplets', 00H
	ORG $+1
$SG70287 DB	'D:\Travail\ABI\EVA\V4.0\CGI\Brunix-2016\action_export.c', 00H
$SG70288 DB	'action_export_triplets', 00H
_DATA	ENDS
_TEXT	SEGMENT
_cntxt$ = 8
_f$ = 12
_sqlres$ = -2076
_forms$ = -2084
_qry$ = -8
_level$ = -4
_nb_cur$ = -2088
_nb_prev$ = -2080
_printbuf$ = -2056
_action_export_triplets PROC NEAR

; 27   : ){

	push	ebp
	mov	ebp, esp
	sub	esp, 2104				; 00000838H

; 28   : 	DynTable sqlres = {0};

	mov	DWORD PTR _sqlres$[ebp], 0
	xor	eax, eax
	mov	DWORD PTR _sqlres$[ebp+4], eax
	mov	DWORD PTR _sqlres$[ebp+8], eax
	mov	DWORD PTR _sqlres$[ebp+12], eax
	mov	DWORD PTR _sqlres$[ebp+16], eax

; 29   : 	DynBuffer *forms = NULL;

	mov	DWORD PTR _forms$[ebp], 0

; 30   : 	DynBuffer *qry = NULL;

	mov	DWORD PTR _qry$[ebp], 0

; 31   : 	unsigned long level = 0, nb_cur = 1, nb_prev = 0;

	mov	DWORD PTR _level$[ebp], 0
	mov	DWORD PTR _nb_cur$[ebp], 1
	mov	DWORD PTR _nb_prev$[ebp], 0

; 32   : 	char printbuf[2048];
; 33   : 
; 34   : 	/* Build list of forms */
; 35   : 	if(sql_exec_query(cntxt, "SELECT DISTINCT IdObj FROM IdList") || sql_get_table(cntxt, &sqlres, 0)) STACK_ERROR;

	push	OFFSET FLAT:$SG70221
	mov	ecx, DWORD PTR _cntxt$[ebp]
	push	ecx
	call	_sql_exec_query
	add	esp, 8
	test	eax, eax
	jne	SHORT $L70220
	push	0
	lea	edx, DWORD PTR _sqlres$[ebp]
	push	edx
	mov	eax, DWORD PTR _cntxt$[ebp]
	push	eax
	call	_sql_get_table
	add	esp, 12					; 0000000cH
	test	eax, eax
	je	SHORT $L70219
$L70220:
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 35		; 00000023H
	jmp	$eva_err$70222
$L70219:

; 37   : 		"-- action_export : build forms list\n"
; 38   : 		"SELECT TLink.IdObj FROM TLink \n"
; 39   : 		"INNER JOIN TLink AS TLink0 ON TLink.IdObj=TLink0.IdObj \n"
; 40   : 		"WHERE TLink.IdObj NOT IN (");

	push	0
	push	0
	push	149					; 00000095H
	push	OFFSET FLAT:$SG70225
	lea	edx, DWORD PTR _qry$[ebp]
	push	edx
	call	_dynbuf_add
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L70224
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29872], OFFSET FLAT:$SG70227
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 40		; 00000028H
	jmp	$eva_err$70222
$L70224:

; 41   : 	if(qry_values_list(cntxt, &sqlres, 0, &qry)) STACK_ERROR;

	lea	edx, DWORD PTR _qry$[ebp]
	push	edx
	push	0
	lea	eax, DWORD PTR _sqlres$[ebp]
	push	eax
	mov	ecx, DWORD PTR _cntxt$[ebp]
	push	ecx
	call	_qry_values_list
	add	esp, 16					; 00000010H
	test	eax, eax
	je	SHORT $L70228
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 41		; 00000029H
	jmp	$eva_err$70222
$L70228:

; 42   : 	dynbuf_print4(&qry, ") AND TLink.DateDel IS NULL AND TLink.IdField=%lu AND TLink.IdRelObj=%d \n"
; 43   : 		"AND TLink0.DateDel IS NULL AND TLink0.IdField=%lu AND TLink0.IdValue=%lu \n"
; 44   : 		"GROUP BY IdObj",
; 45   : 		IDVALUE(FORMSTAMP), OBJ_FORM_CONTROL, IDVALUE(CONTROL), IDVALUE(FORM));

	push	0
	push	0
	push	9
	push	OFFSET FLAT:$SG70230
	mov	eax, DWORD PTR _cntxt$[ebp]
	push	eax
	call	_get_id_value
	add	esp, 12					; 0000000cH
	push	eax
	push	12					; 0000000cH
	push	OFFSET FLAT:$SG70231
	mov	ecx, DWORD PTR _cntxt$[ebp]
	push	ecx
	call	_get_id_value
	add	esp, 12					; 0000000cH
	push	eax
	push	10					; 0000000aH
	push	14					; 0000000eH
	push	OFFSET FLAT:$SG70232
	mov	edx, DWORD PTR _cntxt$[ebp]
	push	edx
	call	_get_id_value
	add	esp, 12					; 0000000cH
	push	eax
	push	OFFSET FLAT:$SG70233
	push	2047					; 000007ffH
	lea	eax, DWORD PTR _printbuf$[ebp]
	push	eax
	call	__snprintf
	add	esp, 28					; 0000001cH
	push	eax
	lea	ecx, DWORD PTR _printbuf$[ebp]
	push	ecx
	lea	edx, DWORD PTR _qry$[ebp]
	push	edx
	call	_dynbuf_add
	add	esp, 20					; 00000014H

; 46   : 	if(sql_exec_query(cntxt, qry->data) || sql_get_table(cntxt, &sqlres, 2) ||
; 47   : 		qry_values_list(cntxt, &sqlres, 0, &forms)) STACK_ERROR;

	mov	eax, DWORD PTR _qry$[ebp]
	add	eax, 8
	push	eax
	mov	ecx, DWORD PTR _cntxt$[ebp]
	push	ecx
	call	_sql_exec_query
	add	esp, 8
	test	eax, eax
	jne	SHORT $L70235
	push	2
	lea	edx, DWORD PTR _sqlres$[ebp]
	push	edx
	mov	eax, DWORD PTR _cntxt$[ebp]
	push	eax
	call	_sql_get_table
	add	esp, 12					; 0000000cH
	test	eax, eax
	jne	SHORT $L70235
	lea	ecx, DWORD PTR _forms$[ebp]
	push	ecx
	push	0
	lea	edx, DWORD PTR _sqlres$[ebp]
	push	edx
	mov	eax, DWORD PTR _cntxt$[ebp]
	push	eax
	call	_qry_values_list
	add	esp, 16					; 00000010H
	test	eax, eax
	je	SHORT $L70234
$L70235:
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 47		; 0000002fH
	jmp	$eva_err$70222
$L70234:

; 48   : 
; 49   : 
; 50   : 	/* Read objects children */
; 51   : 	while(nb_cur > nb_prev)

	mov	edx, DWORD PTR _nb_cur$[ebp]
	cmp	edx, DWORD PTR _nb_prev$[ebp]
	jbe	$L70238

; 53   : 		level++;

	mov	eax, DWORD PTR _level$[ebp]
	add	eax, 1
	mov	DWORD PTR _level$[ebp], eax

; 54   : 		M_FREE(qry);

	mov	ecx, DWORD PTR _qry$[ebp]
	push	ecx
	call	_mem_free
	add	esp, 4
	mov	DWORD PTR _qry$[ebp], 0

; 56   : 			"-- action_export : get child ids - level=", level, "\n");

	push	1
	push	OFFSET FLAT:$SG70240
	mov	edx, DWORD PTR _level$[ebp]
	push	edx
	push	41					; 00000029H
	push	OFFSET FLAT:$SG70241
	lea	eax, DWORD PTR _qry$[ebp]
	push	eax
	call	_dynbuf_add3_int
	add	esp, 24					; 00000018H
	test	eax, eax
	je	SHORT $L70239
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29872], OFFSET FLAT:$SG70243
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 56		; 00000038H
	jmp	$eva_err$70222
$L70239:

; 58   : 			"CREATE TEMPORARY TABLE IdListTmp TYPE=HEAP \n"
; 59   : 			"SELECT TLink.IdRelObj, ", level, " AS Lvl \n"
; 60   : 			"FROM TLink \n"
; 61   : 			"INNER JOIN IdList ON TLink.IdObj=IdList.IdObj \n");

	push	68					; 00000044H
	push	OFFSET FLAT:$SG70245
	mov	eax, DWORD PTR _level$[ebp]
	push	eax
	push	67					; 00000043H
	push	OFFSET FLAT:$SG70246
	lea	ecx, DWORD PTR _qry$[ebp]
	push	ecx
	call	_dynbuf_add3_int
	add	esp, 24					; 00000018H
	test	eax, eax
	je	SHORT $L70244
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29872], OFFSET FLAT:$SG70248
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 61		; 0000003dH
	jmp	$eva_err$70222
$L70244:

; 63   : 			"WHERE IdList.Lvl=", level - 1, " AND TLink.DateDel IS NULL AND TLink.IdRelObj IS NOT NULL \n");

	push	59					; 0000003bH
	push	OFFSET FLAT:$SG70250
	mov	ecx, DWORD PTR _level$[ebp]
	sub	ecx, 1
	push	ecx
	push	17					; 00000011H
	push	OFFSET FLAT:$SG70251
	lea	edx, DWORD PTR _qry$[ebp]
	push	edx
	call	_dynbuf_add3_int
	add	esp, 24					; 00000018H
	test	eax, eax
	je	SHORT $L70249
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29872], OFFSET FLAT:$SG70253
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 63		; 0000003fH
	jmp	$eva_err$70222
$L70249:

; 65   : 			"AND TLink.IdRelObj NOT IN (", forms, NO_CONV,") \n"
; 66   : 			"GROUP BY TLink.IdRelObj");

	cmp	DWORD PTR _forms$[ebp], 0
	je	SHORT $L70451
	mov	edx, DWORD PTR _forms$[ebp]
	mov	eax, DWORD PTR [edx+4]
	mov	DWORD PTR -2092+[ebp], eax
	jmp	SHORT $L70452
$L70451:
	mov	DWORD PTR -2092+[ebp], 0
$L70452:
	cmp	DWORD PTR _forms$[ebp], 0
	je	SHORT $L70453
	mov	ecx, DWORD PTR _forms$[ebp]
	add	ecx, 8
	mov	DWORD PTR -2096+[ebp], ecx
	jmp	SHORT $L70454
$L70453:
	mov	DWORD PTR -2096+[ebp], 0
$L70454:
	push	26					; 0000001aH
	push	OFFSET FLAT:$SG70257
	push	0
	push	0
	mov	edx, DWORD PTR -2092+[ebp]
	push	edx
	mov	eax, DWORD PTR -2096+[ebp]
	push	eax
	push	27					; 0000001bH
	push	OFFSET FLAT:$SG70258
	lea	ecx, DWORD PTR _qry$[ebp]
	push	ecx
	call	_dynbuf_add3
	add	esp, 36					; 00000024H
	test	eax, eax
	je	SHORT $L70256
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29872], OFFSET FLAT:$SG70260
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 66		; 00000042H
	jmp	$eva_err$70222
$L70256:

; 67   : 		if(sql_exec_query(cntxt, qry->data) ||
; 68   : 			sql_exec_query(cntxt,
; 69   : 				"INSERT IGNORE IdList SELECT * FROM IdListTmp")) STACK_ERROR;

	mov	ecx, DWORD PTR _qry$[ebp]
	add	ecx, 8
	push	ecx
	mov	edx, DWORD PTR _cntxt$[ebp]
	push	edx
	call	_sql_exec_query
	add	esp, 8
	test	eax, eax
	jne	SHORT $L70262
	push	OFFSET FLAT:$SG70263
	mov	eax, DWORD PTR _cntxt$[ebp]
	push	eax
	call	_sql_exec_query
	add	esp, 8
	test	eax, eax
	je	SHORT $L70261
$L70262:
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 69		; 00000045H
	jmp	$eva_err$70222
$L70261:

; 70   : 		if(sql_exec_query(cntxt, "DROP TABLE IdListTmp") ||
; 71   : 			sql_exec_query(cntxt, "SELECT COUNT(*) FROM IdList") ||
; 72   : 			sql_get_table(cntxt, &sqlres, 2)) STACK_ERROR;

	push	OFFSET FLAT:$SG70266
	mov	edx, DWORD PTR _cntxt$[ebp]
	push	edx
	call	_sql_exec_query
	add	esp, 8
	test	eax, eax
	jne	SHORT $L70265
	push	OFFSET FLAT:$SG70267
	mov	eax, DWORD PTR _cntxt$[ebp]
	push	eax
	call	_sql_exec_query
	add	esp, 8
	test	eax, eax
	jne	SHORT $L70265
	push	2
	lea	ecx, DWORD PTR _sqlres$[ebp]
	push	ecx
	mov	edx, DWORD PTR _cntxt$[ebp]
	push	edx
	call	_sql_get_table
	add	esp, 12					; 0000000cH
	test	eax, eax
	je	SHORT $L70264
$L70265:
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 72		; 00000048H
	jmp	$eva_err$70222
$L70264:

; 73   : 		nb_prev = nb_cur;

	mov	ecx, DWORD PTR _nb_cur$[ebp]
	mov	DWORD PTR _nb_prev$[ebp], ecx

; 74   : 		nb_cur = DYNTAB_TOUL(&sqlres);

	push	10					; 0000000aH
	push	0
	push	0
	push	0
	lea	edx, DWORD PTR _sqlres$[ebp]
	push	edx
	call	_dyntab_val
	add	esp, 12					; 0000000cH
	push	eax
	call	_strtoul
	add	esp, 12					; 0000000cH
	mov	DWORD PTR _nb_cur$[ebp], eax

; 75   : 	}

	jmp	$L70234
$L70238:

; 76   : 
; 77   : 	/* Output used forms ids & labels */
; 78   : 	M_FREE(qry);

	mov	eax, DWORD PTR _qry$[ebp]
	push	eax
	call	_mem_free
	add	esp, 4
	mov	DWORD PTR _qry$[ebp], 0

; 80   : 		"SELECT TLink0.IdObj AS IdObj,TVal.TxtValue AS Label \n"
; 81   : 		"FROM TLink \n"
; 82   : 		"INNER JOIN IdList ON TLink.IdObj=IdList.IdObj \n"
; 83   : 		"INNER JOIN TLink AS TLink0 ON TLink.IdRelObj=TLink0.IdObj \n"
; 84   : 		"INNER JOIN TVal as TField ON TLink0.IdField=TField.IdValue \n"
; 85   : 		"INNER JOIN TVal ON TLink0.IdValue=TVal.IdValue \n"
; 86   : 		"WHERE TField.TxtValue='_EVA_LABEL' AND TLink.DateDel IS NULL AND TLink0.DateDel IS NULL \n"
; 87   : 		"AND TLink.IdRelObj IN (", forms, NO_CONV,") \n"
; 88   : 		"GROUP BY TLink0.IdObj,TVal.TxtValue \n"
; 89   : 		"ORDER BY IdObj");

	cmp	DWORD PTR _forms$[ebp], 0
	je	SHORT $L70455
	mov	ecx, DWORD PTR _forms$[ebp]
	mov	edx, DWORD PTR [ecx+4]
	mov	DWORD PTR -2100+[ebp], edx
	jmp	SHORT $L70456
$L70455:
	mov	DWORD PTR -2100+[ebp], 0
$L70456:
	cmp	DWORD PTR _forms$[ebp], 0
	je	SHORT $L70457
	mov	eax, DWORD PTR _forms$[ebp]
	add	eax, 8
	mov	DWORD PTR -2104+[ebp], eax
	jmp	SHORT $L70458
$L70457:
	mov	DWORD PTR -2104+[ebp], 0
$L70458:
	push	54					; 00000036H
	push	OFFSET FLAT:$SG70272
	push	0
	push	0
	mov	ecx, DWORD PTR -2100+[ebp]
	push	ecx
	mov	edx, DWORD PTR -2104+[ebp]
	push	edx
	push	391					; 00000187H
	push	OFFSET FLAT:$SG70273
	lea	eax, DWORD PTR _qry$[ebp]
	push	eax
	call	_dynbuf_add3
	add	esp, 36					; 00000024H
	test	eax, eax
	je	SHORT $L70271
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29872], OFFSET FLAT:$SG70275
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 89		; 00000059H
	jmp	$eva_err$70222
$L70271:

; 90   : 	if(sql_exec_query(cntxt, qry->data) ||
; 91   : 		sql_get_table(cntxt, &sqlres, 3) ||
; 92   : 		FILE_write_tabrc(cntxt, &sqlres, f)) STACK_ERROR;

	mov	eax, DWORD PTR _qry$[ebp]
	add	eax, 8
	push	eax
	mov	ecx, DWORD PTR _cntxt$[ebp]
	push	ecx
	call	_sql_exec_query
	add	esp, 8
	test	eax, eax
	jne	SHORT $L70277
	push	3
	lea	edx, DWORD PTR _sqlres$[ebp]
	push	edx
	mov	eax, DWORD PTR _cntxt$[ebp]
	push	eax
	call	_sql_get_table
	add	esp, 12					; 0000000cH
	test	eax, eax
	jne	SHORT $L70277
	mov	ecx, DWORD PTR _f$[ebp]
	push	ecx
	lea	edx, DWORD PTR _sqlres$[ebp]
	push	edx
	mov	eax, DWORD PTR _cntxt$[ebp]
	push	eax
	call	_FILE_write_tabrc
	add	esp, 12					; 0000000cH
	test	eax, eax
	je	SHORT $L70276
$L70277:
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 92		; 0000005cH
	jmp	$eva_err$70222
$L70276:

; 93   : 	fprintf(f, "\n");

	push	OFFSET FLAT:$SG70278
	mov	edx, DWORD PTR _f$[ebp]
	push	edx
	call	_fprintf
	add	esp, 8

; 94   : 
; 95   : 	/* Read objects data & write to output file */
; 96   : 	if(sql_exec_query(cntxt,
; 97   : 		"-- action_export : read objects data\n"
; 98   : 		"SELECT DISTINCT TLink.IdObj AS IdObj,"
; 99   : 			"TField.TxtValue AS Field,"
; 100  : 			"IF(TVal.TxtValue IS NULL,TLink.IdRelObj,TVal.TxtValue) AS Value,"
; 101  : 			"IF(TLink.IdRelObj IS NULL,'V','R') AS Type,"
; 102  : 			"TLink.Num,TLink.Line \n"
; 103  : 		"FROM TLink INNER JOIN IdList ON TLink.IdObj=IdList.IdObj \n"
; 104  : 		"INNER JOIN TVal as TField ON TLink.IdField=TField.IdValue \n"
; 105  : 		"LEFT JOIN TVal ON TLink.IdValue=TVal.IdValue \n"
; 106  : 		"WHERE TLink.DateDel IS NULL \n"
; 107  : 		"ORDER BY IdList.Lvl,TLink.IdObj,TLink.IdField,TLink.Line,TLink.Num") ||
; 108  : 		sql_get_table(cntxt, &sqlres, 3) ||
; 109  : 		FILE_write_tabrc(cntxt, &sqlres, f) ||
; 110  : 		sql_exec_query(cntxt, "DROP TABLE IdList")) STACK_ERROR;

	push	OFFSET FLAT:$SG70281
	mov	eax, DWORD PTR _cntxt$[ebp]
	push	eax
	call	_sql_exec_query
	add	esp, 8
	test	eax, eax
	jne	SHORT $L70280
	push	3
	lea	ecx, DWORD PTR _sqlres$[ebp]
	push	ecx
	mov	edx, DWORD PTR _cntxt$[ebp]
	push	edx
	call	_sql_get_table
	add	esp, 12					; 0000000cH
	test	eax, eax
	jne	SHORT $L70280
	mov	eax, DWORD PTR _f$[ebp]
	push	eax
	lea	ecx, DWORD PTR _sqlres$[ebp]
	push	ecx
	mov	edx, DWORD PTR _cntxt$[ebp]
	push	edx
	call	_FILE_write_tabrc
	add	esp, 12					; 0000000cH
	test	eax, eax
	jne	SHORT $L70280
	push	OFFSET FLAT:$SG70282
	mov	eax, DWORD PTR _cntxt$[ebp]
	push	eax
	call	_sql_exec_query
	add	esp, 8
	test	eax, eax
	je	SHORT $eva_noerr$70283
$L70280:
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 110		; 0000006eH
	jmp	SHORT $eva_err$70222
$eva_noerr$70283:

; 111  : 
; 112  : 	RETURN_OK_CLEANUP;

	push	0
	push	OFFSET FLAT:$SG70284
	push	OFFSET FLAT:$SG70285
	mov	edx, DWORD PTR _cntxt$[ebp]
	push	edx
	call	_err_clear
	add	esp, 16					; 00000010H
$eva_err$70222:
	mov	eax, DWORD PTR _cntxt$[ebp]
	cmp	DWORD PTR [eax+29872], 0
	je	SHORT $L70286
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	edx, DWORD PTR [ecx+29900]
	push	edx
	push	OFFSET FLAT:$SG70287
	push	OFFSET FLAT:$SG70288
	mov	eax, DWORD PTR _cntxt$[ebp]
	push	eax
	call	_err_add_context
	add	esp, 16					; 00000010H
$L70286:
	lea	ecx, DWORD PTR _sqlres$[ebp]
	push	ecx
	call	_dyntab_free
	add	esp, 4
	mov	edx, DWORD PTR _forms$[ebp]
	push	edx
	call	_mem_free
	add	esp, 4
	mov	DWORD PTR _forms$[ebp], 0
	mov	eax, DWORD PTR _qry$[ebp]
	push	eax
	call	_mem_free
	add	esp, 4
	mov	DWORD PTR _qry$[ebp], 0
	mov	ecx, DWORD PTR _cntxt$[ebp]
	xor	eax, eax
	cmp	DWORD PTR [ecx+29872], 0
	setne	al

; 113  : }

	mov	esp, ebp
	pop	ebp
	ret	0
_action_export_triplets ENDP
_TEXT	ENDS
PUBLIC	_action_export
EXTRN	_qry_obj_label:NEAR
EXTRN	_put_html_page_header:NEAR
EXTRN	_fclose:NEAR
EXTRN	_fopen:NEAR
EXTRN	_put_html_button_sz:NEAR
EXTRN	_sprintf:NEAR
EXTRN	_file_compatible_name:NEAR
EXTRN	_file_output_link:NEAR
EXTRN	_plain_to_html:BYTE
EXTRN	_dyntab_sz:NEAR
EXTRN	_chdir:NEAR
EXTRN	_mkdir:NEAR
EXTRN	_qry_build_free:NEAR
EXTRN	__chkstk:NEAR
EXTRN	_qry_add_filter_forms:NEAR
EXTRN	_dyntab_filter_field:NEAR
EXTRN	_qry_filter_table:NEAR
_DATA	SEGMENT
	ORG $+1
$SG70314 DB	'-- action_export : create objects Ids table', 0aH, 'CREA'
	DB	'TE TEMPORARY TABLE IdList (IdObj INT NOT NULL, Lvl INT, PRIMA'
	DB	'RY KEY (IdObj)) TYPE=HEAP', 00H
	ORG $+1
$SG70318 DB	'_EVA_EXPORT_FILTER', 00H
	ORG $+1
$SG70320 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70324 DB	'0 AS Lvl', 00H
	ORG $+3
$SG70326 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70330 DB	'IdList', 00H
	ORG $+1
$SG70331 DB	'D:\Travail\ABI\EVA\V4.0\CGI\Brunix-2016\action_export.c', 00H
$SG70332 DB	'action_export', 00H
	ORG $+2
$SG70338 DB	'INSERT IGNORE INTO IdList (IdObj,Lvl) VALUES (%lu, 0)', 00H
	ORG $+2
$SG70340 DB	'D:\Travail\ABI\EVA\V4.0\CGI\Brunix-2016\action_export.c', 00H
$SG70341 DB	'action_export', 00H
	ORG $+2
$SG70345 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70353 DB	'D:\Travail\ABI\EVA\V4.0\CGI\Brunix-2016\action_export.c', 00H
$SG70354 DB	'action_export', 00H
	ORG $+2
$SG70358 DB	' ', 00H
	ORG $+2
$SG70359 DB	'-', 00H
	ORG $+2
$SG70361 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70365 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70369 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70372 DB	'.txt', 00H
	ORG $+3
$SG70374 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70377 DB	'Droits d''acc', 0e8H, 's incorrects sur un dossier', 00H
	ORG $+3
$SG70378 DB	'objlib', 00H
	ORG $+1
$SG70380 DB	'objlib', 00H
	ORG $+1
$SG70382 DB	'Droits d''acc', 0e8H, 's incorrects sur un dossier', 00H
	ORG $+3
$SG70383 DB	'w', 00H
	ORG $+2
$SG70386 DB	'Impossible d''', 0e9H, 'crire dans le fichier', 00H
$SG70391 DB	'Exporter des donn', 0e9H, 'es', 00H
	ORG $+3
$SG70394 DB	' - ', 00H
$SG70395 DB	'<font face=Arial><center><font size=+1><b>', 00H
	ORG $+1
$SG70397 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70400 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70403 DB	'</font><br><br>Export de donn', 0e9H, 'es termin', 0e9H, ' '
	DB	'avec succ', 0e8H, 's</b><hr><br><br>', 00H
	ORG $+3
$SG70405 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70410 DB	'Fichier texte au format export EVA4', 00H
$SG70411 DB	'objlib', 00H
	ORG $+1
$SG70412 DB	'Fichier export', 0e9H, ' : ', 00H
	ORG $+1
$SG70415 DB	'<br><br>', 00H
	ORG $+3
$SG70417 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70421 DB	'$1', 00H
	ORG $+1
$SG70422 DB	'B$#.DELOBJLIB=', 00H
	ORG $+1
$SG70424 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70427 DB	'Attendez que le t', 0e9H, 'l', 0e9H, 'chargement soit te'
	DB	'rmin', 0e9H, ' pour supprimer le fichier', 00H
	ORG $+2
$SG70428 DB	'_eva_btn_delfile_fr_s.gif', 00H
	ORG $+2
$SG70429 DB	'_eva_btn_delfile_fr.gif', 00H
$SG70430 DB	'Supprimer le fichier', 00H
	ORG $+3
$SG70433 DB	'<br><br>Si vous n''utilisez pas le bouton ''Supprimer le'
	DB	' fichier'',<br>il sera visible par les utilisateurs pouvant i'
	DB	'mporter des donn', 0e9H, 'es<br><br>', 00H
	ORG $+2
$SG70435 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70438 DB	'</font><br><br>', 00H
$SG70440 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70441 DB	'D:\Travail\ABI\EVA\V4.0\CGI\Brunix-2016\action_export.c', 00H
$SG70442 DB	'action_export', 00H
	ORG $+2
$SG70444 DB	'D:\Travail\ABI\EVA\V4.0\CGI\Brunix-2016\action_export.c', 00H
$SG70445 DB	'action_export', 00H
_DATA	ENDS
_TEXT	SEGMENT
_cntxt$ = 8
_i_ctrl$ = 12
_form$ = -8
_ctrl$ = -4528
_forms$ = -44
_filter$ = -64
_formname$ = -20
_objname$ = -24
_name$ = -4524
_fname$ = -4
_html$ = -12
_flt$ = -4520
_f$ = -16
_sql$70336 = -4656
_action_export PROC NEAR

; 133  : ){

	push	ebp
	mov	ebp, esp
	mov	eax, 4696				; 00001258H
	call	__chkstk
	push	edi

; 134  : 	EVA_form *form = cntxt->form;

	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	ecx, DWORD PTR [eax+80]
	mov	DWORD PTR _form$[ebp], ecx

; 135  : 	EVA_ctrl *ctrl = form->ctrl + i_ctrl;

	mov	edx, DWORD PTR _i_ctrl$[ebp]
	imul	edx, 480				; 000001e0H
	mov	eax, DWORD PTR _form$[ebp]
	mov	ecx, DWORD PTR [eax]
	add	ecx, edx
	mov	DWORD PTR _ctrl$[ebp], ecx

; 136  : 	DynTable forms = {0};

	mov	DWORD PTR _forms$[ebp], 0
	xor	edx, edx
	mov	DWORD PTR _forms$[ebp+4], edx
	mov	DWORD PTR _forms$[ebp+8], edx
	mov	DWORD PTR _forms$[ebp+12], edx
	mov	DWORD PTR _forms$[ebp+16], edx

; 137  : 	DynTable filter = {0};

	mov	DWORD PTR _filter$[ebp], 0
	xor	eax, eax
	mov	DWORD PTR _filter$[ebp+4], eax
	mov	DWORD PTR _filter$[ebp+8], eax
	mov	DWORD PTR _filter$[ebp+12], eax
	mov	DWORD PTR _filter$[ebp+16], eax

; 138  : 	DynBuffer *formname = NULL;

	mov	DWORD PTR _formname$[ebp], 0

; 139  : 	DynBuffer *objname = NULL;

	mov	DWORD PTR _objname$[ebp], 0

; 140  : 	DynBuffer *name = NULL;

	mov	DWORD PTR _name$[ebp], 0

; 141  : 	DynBuffer *fname = NULL;

	mov	DWORD PTR _fname$[ebp], 0

; 142  : 	DynBuffer **html;
; 143  : 	QryBuild flt = {{0}};

	mov	DWORD PTR _flt$[ebp], 0
	xor	ecx, ecx
	mov	DWORD PTR _flt$[ebp+4], ecx
	mov	DWORD PTR _flt$[ebp+8], ecx
	mov	DWORD PTR _flt$[ebp+12], ecx
	mov	DWORD PTR _flt$[ebp+16], ecx
	mov	ecx, 1109				; 00000455H
	xor	eax, eax
	lea	edi, DWORD PTR _flt$[ebp+20]
	rep stosd

; 144  : 	FILE *f = NULL;

	mov	DWORD PTR _f$[ebp], 0

; 145  : 
; 146  : 	/* Create a temporary heap table to hold selected objects */
; 147  : 	if(sql_exec_query(cntxt, "-- action_export : create objects Ids table\n"
; 148  : 		"CREATE TEMPORARY TABLE IdList (IdObj INT NOT NULL, Lvl INT, PRIMARY KEY (IdObj)) TYPE=HEAP")) STACK_ERROR;

	push	OFFSET FLAT:$SG70314
	mov	edx, DWORD PTR _cntxt$[ebp]
	push	edx
	call	_sql_exec_query
	add	esp, 8
	test	eax, eax
	je	SHORT $L70313
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 148		; 00000094H
	jmp	$eva_err$70315
$L70313:

; 149  : 
; 150  : 	/* Handle objects selection */
; 151  : 	CTRL_ATTR(filter, EXPORT_FILTER);

	lea	ecx, DWORD PTR _filter$[ebp]
	push	ecx
	call	_dyntab_free
	add	esp, 4
	push	0
	push	-1
	push	OFFSET FLAT:$SG70318
	mov	edx, DWORD PTR _ctrl$[ebp]
	add	edx, 44					; 0000002cH
	push	edx
	push	0
	lea	eax, DWORD PTR _filter$[ebp]
	push	eax
	call	_dyntab_filter_field
	add	esp, 24					; 00000018H
	test	eax, eax
	je	SHORT $L70317
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29872], OFFSET FLAT:$SG70320
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 151		; 00000097H
	jmp	$eva_err$70315
$L70317:

; 152  : 	if(filter.nbrows)

	cmp	DWORD PTR _filter$[ebp], 0
	je	$L70321

; 154  : 		/* Create table IdList from filters */
; 155  : 		DYNBUF_ADD_STR(&flt.optselect, "0 AS Lvl");

	push	0
	push	0
	push	8
	push	OFFSET FLAT:$SG70324
	lea	eax, DWORD PTR _flt$[ebp+32]
	push	eax
	call	_dynbuf_add
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L70323
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29872], OFFSET FLAT:$SG70326
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 155		; 0000009bH
	jmp	$eva_err$70315
$L70323:

; 156  : 		if(qry_add_filter_forms(cntxt, &flt, NULL, &filter) ||
; 157  : 			qry_filter_table(cntxt, "IdList", &flt, 1)) CLEAR_ERROR_RETURN;

	lea	eax, DWORD PTR _filter$[ebp]
	push	eax
	push	0
	lea	ecx, DWORD PTR _flt$[ebp]
	push	ecx
	mov	edx, DWORD PTR _cntxt$[ebp]
	push	edx
	call	_qry_add_filter_forms
	add	esp, 16					; 00000010H
	test	eax, eax
	jne	SHORT $L70329
	push	1
	lea	eax, DWORD PTR _flt$[ebp]
	push	eax
	push	OFFSET FLAT:$SG70330
	mov	ecx, DWORD PTR _cntxt$[ebp]
	push	ecx
	call	_qry_filter_table
	add	esp, 16					; 00000010H
	test	eax, eax
	je	SHORT $L70328
$L70329:
	push	157					; 0000009dH
	push	OFFSET FLAT:$SG70331
	push	OFFSET FLAT:$SG70332
	mov	edx, DWORD PTR _cntxt$[ebp]
	push	edx
	call	_err_clear
	add	esp, 16					; 00000010H
	jmp	$eva_noerr$70333
$L70328:

; 159  : 	else if(dyntab_sz(&form->id_obj, 0, 0))

	jmp	SHORT $L70339
$L70321:
	push	0
	push	0
	mov	eax, DWORD PTR _form$[ebp]
	add	eax, 32					; 00000020H
	push	eax
	call	_dyntab_sz
	add	esp, 12					; 0000000cH
	test	eax, eax
	je	SHORT $L70339

; 161  : 		/* Insert current object in table */
; 162  : 		char sql[128];
; 163  : 		sprintf(sql,
; 164  : 			"INSERT IGNORE INTO IdList (IdObj,Lvl) VALUES (%lu, 0)", DYNTAB_TOUL(&form->id_obj));

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
	push	OFFSET FLAT:$SG70338
	lea	edx, DWORD PTR _sql$70336[ebp]
	push	edx
	call	_sprintf
	add	esp, 12					; 0000000cH

; 165  : 		if(sql_exec_query(cntxt, sql)) CLEAR_ERROR;

	lea	eax, DWORD PTR _sql$70336[ebp]
	push	eax
	mov	ecx, DWORD PTR _cntxt$[ebp]
	push	ecx
	call	_sql_exec_query
	add	esp, 8
	test	eax, eax
	je	SHORT $L70339
	push	165					; 000000a5H
	push	OFFSET FLAT:$SG70340
	push	OFFSET FLAT:$SG70341
	mov	edx, DWORD PTR _cntxt$[ebp]
	push	edx
	call	_err_clear
	add	esp, 16					; 00000010H
$L70339:

; 168  : 
; 169  : 	/* Handle output file name : DBname + form & object label */
; 170  : 	DYNBUF_ADD(&fname, cntxt->dbname, 0, NO_CONV);

	push	0
	push	0
	push	0
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	ecx, DWORD PTR [eax+29804]
	push	ecx
	lea	edx, DWORD PTR _fname$[ebp]
	push	edx
	call	_dynbuf_add
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L70343
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29872], OFFSET FLAT:$SG70345
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 170		; 000000aaH
	jmp	$eva_err$70315
$L70343:

; 171  : 	if(qry_obj_label(cntxt, &formname, NULL, &objname, NULL, NULL, NULL, NULL, NULL, 0, &form->objdata, 0)) CLEAR_ERROR;

	push	0
	mov	edx, DWORD PTR _form$[ebp]
	add	edx, 52					; 00000034H
	push	edx
	push	0
	push	0
	push	0
	push	0
	push	0
	push	0
	lea	eax, DWORD PTR _objname$[ebp]
	push	eax
	push	0
	lea	ecx, DWORD PTR _formname$[ebp]
	push	ecx
	mov	edx, DWORD PTR _cntxt$[ebp]
	push	edx
	call	_qry_obj_label
	add	esp, 48					; 00000030H
	test	eax, eax
	je	SHORT $L70352
	push	171					; 000000abH
	push	OFFSET FLAT:$SG70353
	push	OFFSET FLAT:$SG70354
	mov	eax, DWORD PTR _cntxt$[ebp]
	push	eax
	call	_err_clear
	add	esp, 16					; 00000010H
$L70352:

; 172  : 	DYNBUF_ADD3_BUF(&fname, "-", formname, NO_CONV, " ");

	cmp	DWORD PTR _formname$[ebp], 0
	je	SHORT $L70460
	mov	ecx, DWORD PTR _formname$[ebp]
	mov	edx, DWORD PTR [ecx+4]
	mov	DWORD PTR -4660+[ebp], edx
	jmp	SHORT $L70461
$L70460:
	mov	DWORD PTR -4660+[ebp], 0
$L70461:
	cmp	DWORD PTR _formname$[ebp], 0
	je	SHORT $L70462
	mov	eax, DWORD PTR _formname$[ebp]
	add	eax, 8
	mov	DWORD PTR -4664+[ebp], eax
	jmp	SHORT $L70463
$L70462:
	mov	DWORD PTR -4664+[ebp], 0
$L70463:
	push	1
	push	OFFSET FLAT:$SG70358
	push	0
	push	0
	mov	ecx, DWORD PTR -4660+[ebp]
	push	ecx
	mov	edx, DWORD PTR -4664+[ebp]
	push	edx
	push	1
	push	OFFSET FLAT:$SG70359
	lea	eax, DWORD PTR _fname$[ebp]
	push	eax
	call	_dynbuf_add3
	add	esp, 36					; 00000024H
	test	eax, eax
	je	SHORT $L70357
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29872], OFFSET FLAT:$SG70361
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 172		; 000000acH
	jmp	$eva_err$70315
$L70357:

; 173  : 	DYNBUF_ADD_BUF(&fname, objname, NO_CONV);

	cmp	DWORD PTR _objname$[ebp], 0
	je	SHORT $L70363
	push	0
	push	0
	mov	eax, DWORD PTR _objname$[ebp]
	mov	ecx, DWORD PTR [eax+4]
	push	ecx
	mov	edx, DWORD PTR _objname$[ebp]
	add	edx, 8
	push	edx
	lea	eax, DWORD PTR _fname$[ebp]
	push	eax
	call	_dynbuf_add
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L70363
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29872], OFFSET FLAT:$SG70365
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 173		; 000000adH
	jmp	$eva_err$70315
$L70363:

; 174  : 
; 175  : 	/* Handle file name & location */
; 176  : 	DYNBUF_ADD_BUF(&name, fname, NO_CONV);

	cmp	DWORD PTR _fname$[ebp], 0
	je	SHORT $L70367
	push	0
	push	0
	mov	eax, DWORD PTR _fname$[ebp]
	mov	ecx, DWORD PTR [eax+4]
	push	ecx
	mov	edx, DWORD PTR _fname$[ebp]
	add	edx, 8
	push	edx
	lea	eax, DWORD PTR _name$[ebp]
	push	eax
	call	_dynbuf_add
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L70367
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29872], OFFSET FLAT:$SG70369
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 176		; 000000b0H
	jmp	$eva_err$70315
$L70367:

; 177  : 	fname->cnt = file_compatible_name(fname->data);

	mov	eax, DWORD PTR _fname$[ebp]
	add	eax, 8
	push	eax
	call	_file_compatible_name
	add	esp, 4
	mov	ecx, DWORD PTR _fname$[ebp]
	mov	DWORD PTR [ecx+4], eax

; 178  : 	DYNBUF_ADD_STR(&fname, ".txt");

	push	0
	push	0
	push	4
	push	OFFSET FLAT:$SG70372
	lea	edx, DWORD PTR _fname$[ebp]
	push	edx
	call	_dynbuf_add
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L70371
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29872], OFFSET FLAT:$SG70374
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 178		; 000000b2H
	jmp	$eva_err$70315
$L70371:

; 179  : 	if(chdir(cntxt->rootdir)) RETURN_ERR_DIRECTORY(NOP);

	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	eax, DWORD PTR [edx+29724]
	push	eax
	call	_chdir
	add	esp, 4
	test	eax, eax
	je	SHORT $L70375
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29872], OFFSET FLAT:$SG70377
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 179		; 000000b3H
	jmp	$eva_err$70315
$L70375:

; 180  : 	MKDIR("objlib");

	push	OFFSET FLAT:$SG70378
	call	_mkdir
	add	esp, 4

; 181  : 	if(chdir("objlib")) RETURN_ERR_DIRECTORY(NOP);

	push	OFFSET FLAT:$SG70380
	call	_chdir
	add	esp, 4
	test	eax, eax
	je	SHORT $L70379
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29872], OFFSET FLAT:$SG70382
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 181		; 000000b5H
	jmp	$eva_err$70315
$L70379:

; 182  : 
; 183  : 	/* Open output file */
; 184  : 	f = fopen(fname->data, "w");

	push	OFFSET FLAT:$SG70383
	mov	edx, DWORD PTR _fname$[ebp]
	add	edx, 8
	push	edx
	call	_fopen
	add	esp, 8
	mov	DWORD PTR _f$[ebp], eax

; 185  : 	if(!f) RETURN_ERROR("Impossible d'écrire dans le fichier", NOP);

	cmp	DWORD PTR _f$[ebp], 0
	jne	SHORT $L70384
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29872], OFFSET FLAT:$SG70386
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 185		; 000000b9H
	jmp	$eva_err$70315
$L70384:

; 186  : 
; 187  : 	/* Export selected objects in triplets format */
; 188  : 	if(action_export_triplets(cntxt, f)) STACK_ERROR;

	mov	edx, DWORD PTR _f$[ebp]
	push	edx
	mov	eax, DWORD PTR _cntxt$[ebp]
	push	eax
	call	_action_export_triplets
	add	esp, 8
	test	eax, eax
	je	SHORT $L70387
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 188		; 000000bcH
	jmp	$eva_err$70315
$L70387:

; 189  : 	fclose(f); f = NULL;

	mov	edx, DWORD PTR _f$[ebp]
	push	edx
	call	_fclose
	add	esp, 4
	mov	DWORD PTR _f$[ebp], 0

; 190  : 
; 191  : 	/* Output link to result file */
; 192  : 	put_html_page_header(cntxt, NULL, "Exporter des données", NULL, 3);

	push	3
	push	0
	push	OFFSET FLAT:$SG70391
	push	0
	mov	eax, DWORD PTR _cntxt$[ebp]
	push	eax
	call	_put_html_page_header
	add	esp, 20					; 00000014H

; 193  : 	cntxt->form->html = &cntxt->html;

	mov	ecx, DWORD PTR _cntxt$[ebp]
	add	ecx, 29784				; 00007458H
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	eax, DWORD PTR [edx+80]
	mov	DWORD PTR [eax+232], ecx

; 194  : 	html = cntxt->form->html;

	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	edx, DWORD PTR [ecx+80]
	mov	eax, DWORD PTR [edx+232]
	mov	DWORD PTR _html$[ebp], eax

; 195  : 	cntxt->b_terminate = 15;

	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29776], 15		; 0000000fH

; 196  : 	DYNBUF_ADD3_BUF(html, "<font face=Arial><center><font size=+1><b>", formname, TO_HTML, " - ");

	cmp	DWORD PTR _formname$[ebp], 0
	je	SHORT $L70464
	mov	edx, DWORD PTR _formname$[ebp]
	mov	eax, DWORD PTR [edx+4]
	mov	DWORD PTR -4668+[ebp], eax
	jmp	SHORT $L70465
$L70464:
	mov	DWORD PTR -4668+[ebp], 0
$L70465:
	cmp	DWORD PTR _formname$[ebp], 0
	je	SHORT $L70466
	mov	ecx, DWORD PTR _formname$[ebp]
	add	ecx, 8
	mov	DWORD PTR -4672+[ebp], ecx
	jmp	SHORT $L70467
$L70466:
	mov	DWORD PTR -4672+[ebp], 0
$L70467:
	push	3
	push	OFFSET FLAT:$SG70394
	push	1
	push	OFFSET FLAT:_plain_to_html
	mov	edx, DWORD PTR -4668+[ebp]
	push	edx
	mov	eax, DWORD PTR -4672+[ebp]
	push	eax
	push	42					; 0000002aH
	push	OFFSET FLAT:$SG70395
	mov	ecx, DWORD PTR _html$[ebp]
	push	ecx
	call	_dynbuf_add3
	add	esp, 36					; 00000024H
	test	eax, eax
	je	SHORT $L70393
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29872], OFFSET FLAT:$SG70397
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 196		; 000000c4H
	jmp	$eva_err$70315
$L70393:

; 197  : 	DYNBUF_ADD_BUF(html, objname, TO_HTML);

	cmp	DWORD PTR _objname$[ebp], 0
	je	SHORT $L70398
	push	1
	push	OFFSET FLAT:_plain_to_html
	mov	ecx, DWORD PTR _objname$[ebp]
	mov	edx, DWORD PTR [ecx+4]
	push	edx
	mov	eax, DWORD PTR _objname$[ebp]
	add	eax, 8
	push	eax
	mov	ecx, DWORD PTR _html$[ebp]
	push	ecx
	call	_dynbuf_add
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L70398
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29872], OFFSET FLAT:$SG70400
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 197		; 000000c5H
	jmp	$eva_err$70315
$L70398:

; 199  : 			"Export de données terminé avec succès</b><hr><br><br>");

	push	0
	push	0
	push	68					; 00000044H
	push	OFFSET FLAT:$SG70403
	mov	ecx, DWORD PTR _html$[ebp]
	push	ecx
	call	_dynbuf_add
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L70402
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29872], OFFSET FLAT:$SG70405
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 199		; 000000c7H
	jmp	$eva_err$70315
$L70402:

; 200  : 	if(file_output_link(cntxt, html,
; 201  : 		add_sz_str("Fichier exporté : "), DYNBUF_VAL_SZ(name), DYNBUF_VAL_SZ(fname), "objlib",
; 202  : 		add_sz_str("Fichier texte au format export EVA4"), NULL, 0, 7 | (form->b_modified ? 0 : 8)))

	cmp	DWORD PTR _fname$[ebp], 0
	je	SHORT $L70468
	mov	ecx, DWORD PTR _fname$[ebp]
	mov	edx, DWORD PTR [ecx+4]
	mov	DWORD PTR -4676+[ebp], edx
	jmp	SHORT $L70469
$L70468:
	mov	DWORD PTR -4676+[ebp], 0
$L70469:
	cmp	DWORD PTR _fname$[ebp], 0
	je	SHORT $L70470
	mov	eax, DWORD PTR _fname$[ebp]
	add	eax, 8
	mov	DWORD PTR -4680+[ebp], eax
	jmp	SHORT $L70471
$L70470:
	mov	DWORD PTR -4680+[ebp], 0
$L70471:
	cmp	DWORD PTR _name$[ebp], 0
	je	SHORT $L70472
	mov	ecx, DWORD PTR _name$[ebp]
	mov	edx, DWORD PTR [ecx+4]
	mov	DWORD PTR -4684+[ebp], edx
	jmp	SHORT $L70473
$L70472:
	mov	DWORD PTR -4684+[ebp], 0
$L70473:
	cmp	DWORD PTR _name$[ebp], 0
	je	SHORT $L70474
	mov	eax, DWORD PTR _name$[ebp]
	add	eax, 8
	mov	DWORD PTR -4688+[ebp], eax
	jmp	SHORT $L70475
$L70474:
	mov	DWORD PTR -4688+[ebp], 0
$L70475:
	mov	ecx, DWORD PTR _form$[ebp]
	mov	edx, DWORD PTR [ecx+128]
	neg	edx
	sbb	edx, edx
	and	edx, -8					; fffffff8H
	add	edx, 8
	or	edx, 7
	push	edx
	push	0
	push	0
	push	35					; 00000023H
	push	OFFSET FLAT:$SG70410
	push	OFFSET FLAT:$SG70411
	mov	eax, DWORD PTR -4676+[ebp]
	push	eax
	mov	ecx, DWORD PTR -4680+[ebp]
	push	ecx
	mov	edx, DWORD PTR -4684+[ebp]
	push	edx
	mov	eax, DWORD PTR -4688+[ebp]
	push	eax
	push	18					; 00000012H
	push	OFFSET FLAT:$SG70412
	mov	ecx, DWORD PTR _html$[ebp]
	push	ecx
	mov	edx, DWORD PTR _cntxt$[ebp]
	push	edx
	call	_file_output_link
	add	esp, 56					; 00000038H
	test	eax, eax
	je	SHORT $L70409

; 203  : 		STACK_ERROR;

	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 203		; 000000cbH
	jmp	$eva_err$70315
$L70409:

; 204  : 	DYNBUF_ADD_STR(html, "<br><br>");

	push	0
	push	0
	push	8
	push	OFFSET FLAT:$SG70415
	mov	ecx, DWORD PTR _html$[ebp]
	push	ecx
	call	_dynbuf_add
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L70414
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29872], OFFSET FLAT:$SG70417
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 204		; 000000ccH
	jmp	$eva_err$70315
$L70414:

; 205  : 	M_FREE(name);

	mov	ecx, DWORD PTR _name$[ebp]
	push	ecx
	call	_mem_free
	add	esp, 4
	mov	DWORD PTR _name$[ebp], 0

; 206  : 	DYNBUF_ADD3_BUF(&name, "B$#.DELOBJLIB=", fname, NO_CONV, "$1");

	cmp	DWORD PTR _fname$[ebp], 0
	je	SHORT $L70476
	mov	edx, DWORD PTR _fname$[ebp]
	mov	eax, DWORD PTR [edx+4]
	mov	DWORD PTR -4692+[ebp], eax
	jmp	SHORT $L70477
$L70476:
	mov	DWORD PTR -4692+[ebp], 0
$L70477:
	cmp	DWORD PTR _fname$[ebp], 0
	je	SHORT $L70478
	mov	ecx, DWORD PTR _fname$[ebp]
	add	ecx, 8
	mov	DWORD PTR -4696+[ebp], ecx
	jmp	SHORT $L70479
$L70478:
	mov	DWORD PTR -4696+[ebp], 0
$L70479:
	push	2
	push	OFFSET FLAT:$SG70421
	push	0
	push	0
	mov	edx, DWORD PTR -4692+[ebp]
	push	edx
	mov	eax, DWORD PTR -4696+[ebp]
	push	eax
	push	14					; 0000000eH
	push	OFFSET FLAT:$SG70422
	lea	ecx, DWORD PTR _name$[ebp]
	push	ecx
	call	_dynbuf_add3
	add	esp, 36					; 00000024H
	test	eax, eax
	je	SHORT $L70420
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29872], OFFSET FLAT:$SG70424
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 206		; 000000ceH
	jmp	$eva_err$70315
$L70420:

; 207  : 	if(put_html_button(cntxt, name->data, "Supprimer le fichier", "_eva_btn_delfile_fr.gif", "_eva_btn_delfile_fr_s.gif",
; 208  : 							"Attendez que le téléchargement soit terminé pour supprimer le fichier", 0, 0)) STACK_ERROR;

	push	0
	push	0
	push	0
	push	0
	push	0
	push	OFFSET FLAT:$SG70427
	push	OFFSET FLAT:$SG70428
	push	OFFSET FLAT:$SG70429
	push	OFFSET FLAT:$SG70430
	mov	ecx, DWORD PTR _name$[ebp]
	add	ecx, 8
	push	ecx
	mov	edx, DWORD PTR _cntxt$[ebp]
	push	edx
	call	_put_html_button_sz
	add	esp, 44					; 0000002cH
	test	eax, eax
	je	SHORT $L70426
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 208		; 000000d0H
	jmp	$eva_err$70315
$L70426:

; 210  : 						"Si vous n'utilisez pas le bouton 'Supprimer le fichier',<br>"
; 211  : 						"il sera visible par les utilisateurs pouvant importer des données<br><br>");

	push	0
	push	0
	push	141					; 0000008dH
	push	OFFSET FLAT:$SG70433
	mov	ecx, DWORD PTR _html$[ebp]
	push	ecx
	call	_dynbuf_add
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L70432
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29872], OFFSET FLAT:$SG70435
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 211		; 000000d3H
	jmp	SHORT $eva_err$70315
$L70432:

; 212  : 	DYNBUF_ADD_STR(html, "</font><br><br>");

	push	0
	push	0
	push	15					; 0000000fH
	push	OFFSET FLAT:$SG70438
	mov	ecx, DWORD PTR _html$[ebp]
	push	ecx
	call	_dynbuf_add
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L70437
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29872], OFFSET FLAT:$SG70440
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 212		; 000000d4H
	jmp	SHORT $eva_err$70315
$L70437:
$eva_noerr$70333:

; 213  : 
; 214  : 	RETURN_OK_CLEANUP;

	push	0
	push	OFFSET FLAT:$SG70441
	push	OFFSET FLAT:$SG70442
	mov	ecx, DWORD PTR _cntxt$[ebp]
	push	ecx
	call	_err_clear
	add	esp, 16					; 00000010H
$eva_err$70315:
	mov	edx, DWORD PTR _cntxt$[ebp]
	cmp	DWORD PTR [edx+29872], 0
	je	SHORT $L70443
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	ecx, DWORD PTR [eax+29900]
	push	ecx
	push	OFFSET FLAT:$SG70444
	push	OFFSET FLAT:$SG70445
	mov	edx, DWORD PTR _cntxt$[ebp]
	push	edx
	call	_err_add_context
	add	esp, 16					; 00000010H
$L70443:
	lea	eax, DWORD PTR _forms$[ebp]
	push	eax
	call	_dyntab_free
	add	esp, 4
	lea	ecx, DWORD PTR _filter$[ebp]
	push	ecx
	call	_dyntab_free
	add	esp, 4
	mov	edx, DWORD PTR _formname$[ebp]
	push	edx
	call	_mem_free
	add	esp, 4
	mov	DWORD PTR _formname$[ebp], 0
	mov	eax, DWORD PTR _objname$[ebp]
	push	eax
	call	_mem_free
	add	esp, 4
	mov	DWORD PTR _objname$[ebp], 0
	mov	ecx, DWORD PTR _name$[ebp]
	push	ecx
	call	_mem_free
	add	esp, 4
	mov	DWORD PTR _name$[ebp], 0
	mov	edx, DWORD PTR _fname$[ebp]
	push	edx
	call	_mem_free
	add	esp, 4
	mov	DWORD PTR _fname$[ebp], 0
	lea	eax, DWORD PTR _flt$[ebp]
	push	eax
	call	_qry_build_free
	add	esp, 4
	cmp	DWORD PTR _f$[ebp], 0
	je	SHORT $L70446
	mov	ecx, DWORD PTR _f$[ebp]
	push	ecx
	call	_fclose
	add	esp, 4
$L70446:
	mov	edx, DWORD PTR _cntxt$[ebp]
	xor	eax, eax
	cmp	DWORD PTR [edx+29872], 0
	setne	al

; 215  : }

	pop	edi
	mov	esp, ebp
	pop	ebp
	ret	0
_action_export ENDP
_TEXT	ENDS
END
