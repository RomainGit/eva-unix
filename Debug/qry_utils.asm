	TITLE	D:\Travail\ABI\EVA\V4.0\CGI\Brunix-2016\qry_utils.c
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
_BSS	SEGMENT
_?prevres@?1??qry_add_table_col@@9@9 DD 01H DUP (?)
_BSS	ENDS
PUBLIC	_qry_recursive_relation
PUBLIC	_qry_values_list
PUBLIC	_sql_get_table
EXTRN	_sql_exec_query:NEAR
EXTRN	_atoi:NEAR
EXTRN	_get_id_value:NEAR
EXTRN	_mem_free:NEAR
EXTRN	_dynbuf_add:NEAR
EXTRN	_dynbuf_add3:NEAR
EXTRN	_dynbuf_add3_int:NEAR
EXTRN	_dyntab_free:NEAR
EXTRN	_dyntab_sz:NEAR
EXTRN	_dyntab_val:NEAR
EXTRN	_dyntab_add:NEAR
EXTRN	_err_add_context:NEAR
EXTRN	_err_clear:NEAR
EXTRN	_dyntab_cmp:NEAR
_BSS	SEGMENT
$SG70228 DB	01H DUP (?)
	ALIGN	4

$SG70240 DB	01H DUP (?)
_BSS	ENDS
_DATA	SEGMENT
$SG70229 DB	'_EVA_FORMSTAMP', 00H
	ORG $+1
$SG70230 DB	'-- qry_recursive_relation : build forms list', 0aH, 'SEL'
	DB	'ECT TLink.IdObj FROM TLink ', 0aH, 'INNER JOIN TLink AS TLink'
	DB	'0 ON TLink.IdObj=TLink0.IdObj ', 0aH, 'WHERE TLink.DateDel IS'
	DB	' NULL AND TLink.IdField=', 00H
	ORG $+1
$SG70232 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70235 DB	' ', 0aH, 00H
	ORG $+1
$SG70236 DB	' AND TLink.IdRelObj=', 00H
	ORG $+3
$SG70238 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70241 DB	'_EVA_CONTROL', 00H
	ORG $+3
$SG70242 DB	'AND TLink0.DateDel IS NULL AND TLink0.IdField=', 00H
	ORG $+1
$SG70244 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70246 DB	'  ', 0aH, 'GROUP BY IdObj', 00H
	ORG $+2
$SG70247 DB	'_EVA_FORM', 00H
	ORG $+2
$SG70248 DB	' AND TLink0.IdValue=', 00H
	ORG $+3
$SG70250 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70254 DB	'-- qry_recursive_relation : create objects Ids table', 0aH
	DB	'CREATE TEMPORARY TABLE RecursRel (IdObj INT NOT NULL,Lvl INT,'
	DB	'Ord TEXT, PRIMARY KEY (IdObj))', 00H
	ORG $+3
$SG70257 DB	',0,''0'')', 00H
$SG70258 DB	'INSERT INTO RecursRel (IdObj,Lvl,Ord) VALUES (', 00H
	ORG $+1
$SG70260 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70266 DB	',0,''0'')', 00H
$SG70267 DB	',(', 00H
	ORG $+1
$SG70269 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70276 DB	0aH, 00H
	ORG $+2
$SG70277 DB	'-- qry_recursive_relation : get child ids - level=', 00H
	ORG $+1
$SG70279 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70281 DB	' AND TLink.DateDel IS NULL AND TLink.IdRelObj IS NOT NUL'
	DB	'L ', 0aH, 00H
$SG70282 DB	'CREATE TEMPORARY TABLE RecursRelTmp ', 0aH, 'SELECT DIST'
	DB	'INCT TLink.IdRelObj As IdObj,CONCAT(RecursRel.Ord,RIGHT(CONCA'
	DB	'T(''00'',CONV(IFNULL(TLink.Line,0),10,36)),3),RIGHT(CONCAT('''
	DB	'00'',CONV(TLink.Num,10,36)),3)) AS Ord', 0aH, 'FROM TLink ', 0aH
	DB	'INNER JOIN RecursRel ON TLink.IdObj=RecursRel.IdObj', 0aH, 'W'
	DB	'HERE RecursRel.Lvl=', 00H
	ORG $+2
$SG70284 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70288 DB	') ', 0aH, 00H
$SG70289 DB	'AND TLink.IdField IN (', 00H
	ORG $+1
$SG70291 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70295 DB	') ', 0aH, 'ORDER BY Ord,IdObj', 00H
	ORG $+2
$SG70296 DB	'AND TLink.IdRelObj NOT IN (', 00H
$SG70298 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70301 DB	' AS Lvl,Ord FROM RecursRelTmp', 00H
	ORG $+2
$SG70302 DB	'INSERT IGNORE RecursRel (IdObj,Lvl,Ord) ', 0aH, 'SELECT '
	DB	'IdObj,', 00H
	ORG $+1
$SG70304 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70307 DB	'DROP TABLE RecursRelTmp', 00H
$SG70308 DB	'SELECT COUNT(*) FROM RecursRel', 00H
	ORG $+1
$SG70311 DB	'SELECT IdObj FROM RecursRel ORDER BY Ord', 00H
	ORG $+3
$SG70315 DB	')', 0aH, 00H
	ORG $+1
$SG70316 DB	'-- qry_recursive_relation : build list of inner relation'
	DB	's', 0aH, 'SELECT DISTINCT RecursRel.IdObj,TLink.IdObj FROM Re'
	DB	'cursRel', 0aH, 'LEFT JOIN TLink ON TLink.IdRelObj=RecursRel.I'
	DB	'dObj', 0aH, 'WHERE TLink.DateDel IS NULL', 0aH, 'AND TLink.Id'
	DB	'Field IN(', 00H
	ORG $+3
$SG70318 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70322 DB	')', 0aH, 'ORDER BY RecursRel.Ord,RecursRel.IdObj', 00H
	ORG $+3
$SG70323 DB	'AND TLink.IdObj IN (', 00H
	ORG $+3
$SG70325 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70329 DB	'DROP TABLE RecursRel', 00H
	ORG $+3
$SG70338 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70344 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70351 DB	',', 00H
	ORG $+2
$SG70353 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70357 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70358 DB	'D:\Travail\ABI\EVA\V4.0\CGI\Brunix-2016\qry_utils.c', 00H
$SG70359 DB	'qry_recursive_relation', 00H
	ORG $+1
$SG70361 DB	'D:\Travail\ABI\EVA\V4.0\CGI\Brunix-2016\qry_utils.c', 00H
$SG70362 DB	'qry_recursive_relation', 00H
_DATA	ENDS
_TEXT	SEGMENT
_cntxt$ = 8
_res$ = 12
_srcidobj$ = 16
_relfields$ = 20
_sqlres$ = -32
_forms$ = -40
_fields$ = -12
_qry$ = -8
_i$ = -44
_j$ = -48
_level$ = -4
_nb_cur$ = -52
_nb_prev$ = -36
_qry_recursive_relation PROC NEAR

; 30   : ){

	push	ebp
	mov	ebp, esp
	sub	esp, 88					; 00000058H

; 31   : 	DynTable sqlres = {0};

	mov	DWORD PTR _sqlres$[ebp], 0
	xor	eax, eax
	mov	DWORD PTR _sqlres$[ebp+4], eax
	mov	DWORD PTR _sqlres$[ebp+8], eax
	mov	DWORD PTR _sqlres$[ebp+12], eax
	mov	DWORD PTR _sqlres$[ebp+16], eax

; 32   : 	DynBuffer *forms = NULL;

	mov	DWORD PTR _forms$[ebp], 0

; 33   : 	DynBuffer *fields = NULL;

	mov	DWORD PTR _fields$[ebp], 0

; 34   : 	DynBuffer *qry = NULL;

	mov	DWORD PTR _qry$[ebp], 0

; 35   : 	unsigned long i, j, level = 0, nb_cur = srcidobj ? srcidobj->nbrows : 0, nb_prev = 0;

	mov	DWORD PTR _level$[ebp], 0
	cmp	DWORD PTR _srcidobj$[ebp], 0
	je	SHORT $L72025
	mov	ecx, DWORD PTR _srcidobj$[ebp]
	mov	edx, DWORD PTR [ecx]
	mov	DWORD PTR -56+[ebp], edx
	jmp	SHORT $L72026
$L72025:
	mov	DWORD PTR -56+[ebp], 0
$L72026:
	mov	eax, DWORD PTR -56+[ebp]
	mov	DWORD PTR _nb_cur$[ebp], eax
	mov	DWORD PTR _nb_prev$[ebp], 0

; 36   : 	if(!nb_cur) RETURN_OK;

	cmp	DWORD PTR _nb_cur$[ebp], 0
	jne	SHORT $L70225
	jmp	$eva_noerr$70226
$L70225:

; 40   : 		"-- qry_recursive_relation : build forms list\n"
; 41   : 		"SELECT TLink.IdObj FROM TLink \n"
; 42   : 		"INNER JOIN TLink AS TLink0 ON TLink.IdObj=TLink0.IdObj \n"
; 43   : 		"WHERE TLink.DateDel IS NULL AND TLink.IdField=", IDVAL("_EVA_FORMSTAMP"), "");

	push	0
	push	OFFSET FLAT:$SG70228
	push	14					; 0000000eH
	push	OFFSET FLAT:$SG70229
	mov	ecx, DWORD PTR _cntxt$[ebp]
	push	ecx
	call	_get_id_value
	add	esp, 12					; 0000000cH
	push	eax
	push	178					; 000000b2H
	push	OFFSET FLAT:$SG70230
	lea	edx, DWORD PTR _qry$[ebp]
	push	edx
	call	_dynbuf_add3_int
	add	esp, 24					; 00000018H
	test	eax, eax
	je	SHORT $L70227
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29872], OFFSET FLAT:$SG70232
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 43		; 0000002bH
	jmp	$eva_err$70233
$L70227:

; 44   : 	DYNBUF_ADD3_INT(&qry, " AND TLink.IdRelObj=", OBJ_FORM_CONTROL, " \n");

	push	2
	push	OFFSET FLAT:$SG70235
	push	10					; 0000000aH
	push	20					; 00000014H
	push	OFFSET FLAT:$SG70236
	lea	edx, DWORD PTR _qry$[ebp]
	push	edx
	call	_dynbuf_add3_int
	add	esp, 24					; 00000018H
	test	eax, eax
	je	SHORT $L70234
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29872], OFFSET FLAT:$SG70238
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 44		; 0000002cH
	jmp	$eva_err$70233
$L70234:

; 46   : 		"AND TLink0.DateDel IS NULL AND TLink0.IdField=", IDVAL("_EVA_CONTROL"), "");

	push	0
	push	OFFSET FLAT:$SG70240
	push	12					; 0000000cH
	push	OFFSET FLAT:$SG70241
	mov	edx, DWORD PTR _cntxt$[ebp]
	push	edx
	call	_get_id_value
	add	esp, 12					; 0000000cH
	push	eax
	push	46					; 0000002eH
	push	OFFSET FLAT:$SG70242
	lea	eax, DWORD PTR _qry$[ebp]
	push	eax
	call	_dynbuf_add3_int
	add	esp, 24					; 00000018H
	test	eax, eax
	je	SHORT $L70239
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29872], OFFSET FLAT:$SG70244
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 46		; 0000002eH
	jmp	$eva_err$70233
$L70239:

; 48   : 		"GROUP BY IdObj");

	push	17					; 00000011H
	push	OFFSET FLAT:$SG70246
	push	9
	push	OFFSET FLAT:$SG70247
	mov	eax, DWORD PTR _cntxt$[ebp]
	push	eax
	call	_get_id_value
	add	esp, 12					; 0000000cH
	push	eax
	push	20					; 00000014H
	push	OFFSET FLAT:$SG70248
	lea	ecx, DWORD PTR _qry$[ebp]
	push	ecx
	call	_dynbuf_add3_int
	add	esp, 24					; 00000018H
	test	eax, eax
	je	SHORT $L70245
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29872], OFFSET FLAT:$SG70250
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 48		; 00000030H
	jmp	$eva_err$70233
$L70245:

; 49   : 	if(sql_exec_query(cntxt, qry->data) || sql_get_table(cntxt, &sqlres, 2) ||
; 50   : 		qry_values_list(cntxt, &sqlres, 0, &forms)) STACK_ERROR;

	mov	ecx, DWORD PTR _qry$[ebp]
	add	ecx, 8
	push	ecx
	mov	edx, DWORD PTR _cntxt$[ebp]
	push	edx
	call	_sql_exec_query
	add	esp, 8
	test	eax, eax
	jne	SHORT $L70252
	push	2
	lea	eax, DWORD PTR _sqlres$[ebp]
	push	eax
	mov	ecx, DWORD PTR _cntxt$[ebp]
	push	ecx
	call	_sql_get_table
	add	esp, 12					; 0000000cH
	test	eax, eax
	jne	SHORT $L70252
	lea	edx, DWORD PTR _forms$[ebp]
	push	edx
	push	0
	lea	eax, DWORD PTR _sqlres$[ebp]
	push	eax
	mov	ecx, DWORD PTR _cntxt$[ebp]
	push	ecx
	call	_qry_values_list
	add	esp, 16					; 00000010H
	test	eax, eax
	je	SHORT $L70251
$L70252:
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 50		; 00000032H
	jmp	$eva_err$70233
$L70251:

; 51   : 	M_FREE(qry);

	mov	eax, DWORD PTR _qry$[ebp]
	push	eax
	call	_mem_free
	add	esp, 4
	mov	DWORD PTR _qry$[ebp], 0

; 52   : 
; 53   : 	/* Create a temporary table & insert base objects */
; 54   : 	if(sql_exec_query(cntxt, "-- qry_recursive_relation : create objects Ids table\n"
; 55   : 		"CREATE TEMPORARY TABLE RecursRel (IdObj INT NOT NULL,Lvl INT,Ord TEXT, PRIMARY KEY (IdObj))"))

	push	OFFSET FLAT:$SG70254
	mov	ecx, DWORD PTR _cntxt$[ebp]
	push	ecx
	call	_sql_exec_query
	add	esp, 8
	test	eax, eax
	je	SHORT $L70253

; 56   : 		STACK_ERROR;

	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 56		; 00000038H
	jmp	$eva_err$70233
$L70253:

; 58   : 		"INSERT INTO RecursRel (IdObj,Lvl,Ord) VALUES (", srcidobj, 0, 0, NO_CONV, ",0,'0')");

	push	7
	push	OFFSET FLAT:$SG70257
	push	0
	push	0
	push	0
	push	0
	mov	eax, DWORD PTR _srcidobj$[ebp]
	push	eax
	call	_dyntab_sz
	add	esp, 12					; 0000000cH
	push	eax
	push	0
	push	0
	mov	ecx, DWORD PTR _srcidobj$[ebp]
	push	ecx
	call	_dyntab_val
	add	esp, 12					; 0000000cH
	push	eax
	push	46					; 0000002eH
	push	OFFSET FLAT:$SG70258
	lea	edx, DWORD PTR _qry$[ebp]
	push	edx
	call	_dynbuf_add3
	add	esp, 36					; 00000024H
	test	eax, eax
	je	SHORT $L70256
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29872], OFFSET FLAT:$SG70260
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 58		; 0000003aH
	jmp	$eva_err$70233
$L70256:

; 59   : 	for(i = 1; i < nb_cur; i++) DYNBUF_ADD3_CELL(&qry, ",(", srcidobj, i, 0, NO_CONV, ",0,'0')");

	mov	DWORD PTR _i$[ebp], 1
	jmp	SHORT $L70261
$L70262:
	mov	edx, DWORD PTR _i$[ebp]
	add	edx, 1
	mov	DWORD PTR _i$[ebp], edx
$L70261:
	mov	eax, DWORD PTR _i$[ebp]
	cmp	eax, DWORD PTR _nb_cur$[ebp]
	jae	SHORT $L70263
	push	7
	push	OFFSET FLAT:$SG70266
	push	0
	push	0
	push	0
	mov	ecx, DWORD PTR _i$[ebp]
	push	ecx
	mov	edx, DWORD PTR _srcidobj$[ebp]
	push	edx
	call	_dyntab_sz
	add	esp, 12					; 0000000cH
	push	eax
	push	0
	mov	eax, DWORD PTR _i$[ebp]
	push	eax
	mov	ecx, DWORD PTR _srcidobj$[ebp]
	push	ecx
	call	_dyntab_val
	add	esp, 12					; 0000000cH
	push	eax
	push	2
	push	OFFSET FLAT:$SG70267
	lea	edx, DWORD PTR _qry$[ebp]
	push	edx
	call	_dynbuf_add3
	add	esp, 36					; 00000024H
	test	eax, eax
	je	SHORT $L70265
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29872], OFFSET FLAT:$SG70269
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 59		; 0000003bH
	jmp	$eva_err$70233
$L70265:
	jmp	SHORT $L70262
$L70263:

; 60   : 	if(sql_exec_query(cntxt, qry->data)) STACK_ERROR;

	mov	edx, DWORD PTR _qry$[ebp]
	add	edx, 8
	push	edx
	mov	eax, DWORD PTR _cntxt$[ebp]
	push	eax
	call	_sql_exec_query
	add	esp, 8
	test	eax, eax
	je	SHORT $L70270
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 60		; 0000003cH
	jmp	$eva_err$70233
$L70270:

; 61   : 	M_FREE(qry);

	mov	edx, DWORD PTR _qry$[ebp]
	push	edx
	call	_mem_free
	add	esp, 4
	mov	DWORD PTR _qry$[ebp], 0

; 62   : 
; 63   : 	/* Build list of objects with given relation */
; 64   : 	if(qry_values_list(cntxt, relfields, 2, &fields)) STACK_ERROR;

	lea	eax, DWORD PTR _fields$[ebp]
	push	eax
	push	2
	mov	ecx, DWORD PTR _relfields$[ebp]
	push	ecx
	mov	edx, DWORD PTR _cntxt$[ebp]
	push	edx
	call	_qry_values_list
	add	esp, 16					; 00000010H
	test	eax, eax
	je	SHORT $L70271
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 64		; 00000040H
	jmp	$eva_err$70233
$L70271:

; 65   : 	while(nb_cur > nb_prev)

	mov	ecx, DWORD PTR _nb_cur$[ebp]
	cmp	ecx, DWORD PTR _nb_prev$[ebp]
	jbe	$L70274

; 67   : 		level++;

	mov	edx, DWORD PTR _level$[ebp]
	add	edx, 1
	mov	DWORD PTR _level$[ebp], edx

; 69   : 			"-- qry_recursive_relation : get child ids - level=", level, "\n");

	push	1
	push	OFFSET FLAT:$SG70276
	mov	eax, DWORD PTR _level$[ebp]
	push	eax
	push	50					; 00000032H
	push	OFFSET FLAT:$SG70277
	lea	ecx, DWORD PTR _qry$[ebp]
	push	ecx
	call	_dynbuf_add3_int
	add	esp, 24					; 00000018H
	test	eax, eax
	je	SHORT $L70275
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29872], OFFSET FLAT:$SG70279
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 69		; 00000045H
	jmp	$eva_err$70233
$L70275:

; 71   : 			"CREATE TEMPORARY TABLE RecursRelTmp \n"
; 72   : 			"SELECT DISTINCT TLink.IdRelObj As IdObj,"
; 73   : 					"CONCAT(RecursRel.Ord,"
; 74   : 						"RIGHT(CONCAT('00',CONV(IFNULL(TLink.Line,0),10,36)),3),"
; 75   : 						"RIGHT(CONCAT('00',CONV(TLink.Num,10,36)),3)) AS Ord\n"
; 76   : 			"FROM TLink \n"
; 77   : 			"INNER JOIN RecursRel ON TLink.IdObj=RecursRel.IdObj\n"
; 78   : 			"WHERE RecursRel.Lvl=", level - 1, " AND TLink.DateDel IS NULL AND TLink.IdRelObj IS NOT NULL \n");

	push	59					; 0000003bH
	push	OFFSET FLAT:$SG70281
	mov	ecx, DWORD PTR _level$[ebp]
	sub	ecx, 1
	push	ecx
	push	289					; 00000121H
	push	OFFSET FLAT:$SG70282
	lea	edx, DWORD PTR _qry$[ebp]
	push	edx
	call	_dynbuf_add3_int
	add	esp, 24					; 00000018H
	test	eax, eax
	je	SHORT $L70280
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29872], OFFSET FLAT:$SG70284
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 78		; 0000004eH
	jmp	$eva_err$70233
$L70280:

; 80   : 			"AND TLink.IdField IN (", fields, NO_CONV,") \n");

	cmp	DWORD PTR _fields$[ebp], 0
	je	SHORT $L72027
	mov	edx, DWORD PTR _fields$[ebp]
	mov	eax, DWORD PTR [edx+4]
	mov	DWORD PTR -60+[ebp], eax
	jmp	SHORT $L72028
$L72027:
	mov	DWORD PTR -60+[ebp], 0
$L72028:
	cmp	DWORD PTR _fields$[ebp], 0
	je	SHORT $L72029
	mov	ecx, DWORD PTR _fields$[ebp]
	add	ecx, 8
	mov	DWORD PTR -64+[ebp], ecx
	jmp	SHORT $L72030
$L72029:
	mov	DWORD PTR -64+[ebp], 0
$L72030:
	push	3
	push	OFFSET FLAT:$SG70288
	push	0
	push	0
	mov	edx, DWORD PTR -60+[ebp]
	push	edx
	mov	eax, DWORD PTR -64+[ebp]
	push	eax
	push	22					; 00000016H
	push	OFFSET FLAT:$SG70289
	lea	ecx, DWORD PTR _qry$[ebp]
	push	ecx
	call	_dynbuf_add3
	add	esp, 36					; 00000024H
	test	eax, eax
	je	SHORT $L70287
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29872], OFFSET FLAT:$SG70291
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 80		; 00000050H
	jmp	$eva_err$70233
$L70287:

; 82   : 			"AND TLink.IdRelObj NOT IN (", forms, NO_CONV,") \n"
; 83   : 			"ORDER BY Ord,IdObj");

	cmp	DWORD PTR _forms$[ebp], 0
	je	SHORT $L72031
	mov	ecx, DWORD PTR _forms$[ebp]
	mov	edx, DWORD PTR [ecx+4]
	mov	DWORD PTR -68+[ebp], edx
	jmp	SHORT $L72032
$L72031:
	mov	DWORD PTR -68+[ebp], 0
$L72032:
	cmp	DWORD PTR _forms$[ebp], 0
	je	SHORT $L72033
	mov	eax, DWORD PTR _forms$[ebp]
	add	eax, 8
	mov	DWORD PTR -72+[ebp], eax
	jmp	SHORT $L72034
$L72033:
	mov	DWORD PTR -72+[ebp], 0
$L72034:
	push	21					; 00000015H
	push	OFFSET FLAT:$SG70295
	push	0
	push	0
	mov	ecx, DWORD PTR -68+[ebp]
	push	ecx
	mov	edx, DWORD PTR -72+[ebp]
	push	edx
	push	27					; 0000001bH
	push	OFFSET FLAT:$SG70296
	lea	eax, DWORD PTR _qry$[ebp]
	push	eax
	call	_dynbuf_add3
	add	esp, 36					; 00000024H
	test	eax, eax
	je	SHORT $L70294
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29872], OFFSET FLAT:$SG70298
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 83		; 00000053H
	jmp	$eva_err$70233
$L70294:

; 84   : 		if(sql_exec_query(cntxt, qry->data)) STACK_ERROR;

	mov	eax, DWORD PTR _qry$[ebp]
	add	eax, 8
	push	eax
	mov	ecx, DWORD PTR _cntxt$[ebp]
	push	ecx
	call	_sql_exec_query
	add	esp, 8
	test	eax, eax
	je	SHORT $L70299
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 84		; 00000054H
	jmp	$eva_err$70233
$L70299:

; 85   : 		M_FREE(qry);

	mov	eax, DWORD PTR _qry$[ebp]
	push	eax
	call	_mem_free
	add	esp, 4
	mov	DWORD PTR _qry$[ebp], 0

; 87   : 			"INSERT IGNORE RecursRel (IdObj,Lvl,Ord) \n"
; 88   : 			"SELECT IdObj,", level, " AS Lvl,Ord FROM RecursRelTmp");

	push	29					; 0000001dH
	push	OFFSET FLAT:$SG70301
	mov	ecx, DWORD PTR _level$[ebp]
	push	ecx
	push	54					; 00000036H
	push	OFFSET FLAT:$SG70302
	lea	edx, DWORD PTR _qry$[ebp]
	push	edx
	call	_dynbuf_add3_int
	add	esp, 24					; 00000018H
	test	eax, eax
	je	SHORT $L70300
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29872], OFFSET FLAT:$SG70304
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 88		; 00000058H
	jmp	$eva_err$70233
$L70300:

; 89   : 		if(sql_exec_query(cntxt, qry->data) ||
; 90   : 			sql_exec_query(cntxt, "DROP TABLE RecursRelTmp") ||
; 91   : 			sql_exec_query(cntxt, "SELECT COUNT(*) FROM RecursRel") ||
; 92   : 			sql_get_table(cntxt, &sqlres, 2)) STACK_ERROR;

	mov	edx, DWORD PTR _qry$[ebp]
	add	edx, 8
	push	edx
	mov	eax, DWORD PTR _cntxt$[ebp]
	push	eax
	call	_sql_exec_query
	add	esp, 8
	test	eax, eax
	jne	SHORT $L70306
	push	OFFSET FLAT:$SG70307
	mov	ecx, DWORD PTR _cntxt$[ebp]
	push	ecx
	call	_sql_exec_query
	add	esp, 8
	test	eax, eax
	jne	SHORT $L70306
	push	OFFSET FLAT:$SG70308
	mov	edx, DWORD PTR _cntxt$[ebp]
	push	edx
	call	_sql_exec_query
	add	esp, 8
	test	eax, eax
	jne	SHORT $L70306
	push	2
	lea	eax, DWORD PTR _sqlres$[ebp]
	push	eax
	mov	ecx, DWORD PTR _cntxt$[ebp]
	push	ecx
	call	_sql_get_table
	add	esp, 12					; 0000000cH
	test	eax, eax
	je	SHORT $L70305
$L70306:
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 92		; 0000005cH
	jmp	$eva_err$70233
$L70305:

; 93   : 		nb_prev = nb_cur;

	mov	eax, DWORD PTR _nb_cur$[ebp]
	mov	DWORD PTR _nb_prev$[ebp], eax

; 94   : 		nb_cur = atoi(dyntab_val(&sqlres, 0, 0));

	push	0
	push	0
	lea	ecx, DWORD PTR _sqlres$[ebp]
	push	ecx
	call	_dyntab_val
	add	esp, 12					; 0000000cH
	push	eax
	call	_atoi
	add	esp, 4
	mov	DWORD PTR _nb_cur$[ebp], eax

; 95   : 		M_FREE(qry);

	mov	edx, DWORD PTR _qry$[ebp]
	push	edx
	call	_mem_free
	add	esp, 4
	mov	DWORD PTR _qry$[ebp], 0

; 96   : 	}

	jmp	$L70271
$L70274:

; 97   : 
; 98   : 	/* Build list of objects & inner relations */
; 99   : 	M_FREE(forms);

	mov	eax, DWORD PTR _forms$[ebp]
	push	eax
	call	_mem_free
	add	esp, 4
	mov	DWORD PTR _forms$[ebp], 0

; 100  : 	if(sql_exec_query(cntxt, "SELECT IdObj FROM RecursRel ORDER BY Ord") ||
; 101  : 		sql_get_table(cntxt, res, 2) ||
; 102  : 		qry_values_list(cntxt, res, 0, &forms)) STACK_ERROR;

	push	OFFSET FLAT:$SG70311
	mov	ecx, DWORD PTR _cntxt$[ebp]
	push	ecx
	call	_sql_exec_query
	add	esp, 8
	test	eax, eax
	jne	SHORT $L70310
	push	2
	mov	edx, DWORD PTR _res$[ebp]
	push	edx
	mov	eax, DWORD PTR _cntxt$[ebp]
	push	eax
	call	_sql_get_table
	add	esp, 12					; 0000000cH
	test	eax, eax
	jne	SHORT $L70310
	lea	ecx, DWORD PTR _forms$[ebp]
	push	ecx
	push	0
	mov	edx, DWORD PTR _res$[ebp]
	push	edx
	mov	eax, DWORD PTR _cntxt$[ebp]
	push	eax
	call	_qry_values_list
	add	esp, 16					; 00000010H
	test	eax, eax
	je	SHORT $L70309
$L70310:
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 102		; 00000066H
	jmp	$eva_err$70233
$L70309:

; 104  : 		"-- qry_recursive_relation : build list of inner relations\n"
; 105  : 		"SELECT DISTINCT RecursRel.IdObj,TLink.IdObj FROM RecursRel\n"
; 106  : 		"LEFT JOIN TLink ON TLink.IdRelObj=RecursRel.IdObj\n"
; 107  : 		"WHERE TLink.DateDel IS NULL\n"
; 108  : 		"AND TLink.IdField IN(", fields, NO_CONV,")\n");

	cmp	DWORD PTR _fields$[ebp], 0
	je	SHORT $L72035
	mov	edx, DWORD PTR _fields$[ebp]
	mov	eax, DWORD PTR [edx+4]
	mov	DWORD PTR -76+[ebp], eax
	jmp	SHORT $L72036
$L72035:
	mov	DWORD PTR -76+[ebp], 0
$L72036:
	cmp	DWORD PTR _fields$[ebp], 0
	je	SHORT $L72037
	mov	ecx, DWORD PTR _fields$[ebp]
	add	ecx, 8
	mov	DWORD PTR -80+[ebp], ecx
	jmp	SHORT $L72038
$L72037:
	mov	DWORD PTR -80+[ebp], 0
$L72038:
	push	2
	push	OFFSET FLAT:$SG70315
	push	0
	push	0
	mov	edx, DWORD PTR -76+[ebp]
	push	edx
	mov	eax, DWORD PTR -80+[ebp]
	push	eax
	push	216					; 000000d8H
	push	OFFSET FLAT:$SG70316
	lea	ecx, DWORD PTR _qry$[ebp]
	push	ecx
	call	_dynbuf_add3
	add	esp, 36					; 00000024H
	test	eax, eax
	je	SHORT $L70314
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29872], OFFSET FLAT:$SG70318
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 108		; 0000006cH
	jmp	$eva_err$70233
$L70314:

; 110  : 		"AND TLink.IdObj IN (", forms, NO_CONV,")\n"
; 111  : 		"ORDER BY RecursRel.Ord,RecursRel.IdObj");

	cmp	DWORD PTR _forms$[ebp], 0
	je	SHORT $L72039
	mov	ecx, DWORD PTR _forms$[ebp]
	mov	edx, DWORD PTR [ecx+4]
	mov	DWORD PTR -84+[ebp], edx
	jmp	SHORT $L72040
$L72039:
	mov	DWORD PTR -84+[ebp], 0
$L72040:
	cmp	DWORD PTR _forms$[ebp], 0
	je	SHORT $L72041
	mov	eax, DWORD PTR _forms$[ebp]
	add	eax, 8
	mov	DWORD PTR -88+[ebp], eax
	jmp	SHORT $L72042
$L72041:
	mov	DWORD PTR -88+[ebp], 0
$L72042:
	push	40					; 00000028H
	push	OFFSET FLAT:$SG70322
	push	0
	push	0
	mov	ecx, DWORD PTR -84+[ebp]
	push	ecx
	mov	edx, DWORD PTR -88+[ebp]
	push	edx
	push	20					; 00000014H
	push	OFFSET FLAT:$SG70323
	lea	eax, DWORD PTR _qry$[ebp]
	push	eax
	call	_dynbuf_add3
	add	esp, 36					; 00000024H
	test	eax, eax
	je	SHORT $L70321
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29872], OFFSET FLAT:$SG70325
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 111		; 0000006fH
	jmp	$eva_err$70233
$L70321:

; 112  : 	if(sql_exec_query(cntxt, qry->data) || sql_get_table(cntxt, &sqlres, 2)) STACK_ERROR;

	mov	eax, DWORD PTR _qry$[ebp]
	add	eax, 8
	push	eax
	mov	ecx, DWORD PTR _cntxt$[ebp]
	push	ecx
	call	_sql_exec_query
	add	esp, 8
	test	eax, eax
	jne	SHORT $L70327
	push	2
	lea	edx, DWORD PTR _sqlres$[ebp]
	push	edx
	mov	eax, DWORD PTR _cntxt$[ebp]
	push	eax
	call	_sql_get_table
	add	esp, 12					; 0000000cH
	test	eax, eax
	je	SHORT $L70326
$L70327:
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 112		; 00000070H
	jmp	$eva_err$70233
$L70326:

; 113  : 	if(sql_exec_query(cntxt, "DROP TABLE RecursRel")) STACK_ERROR;

	push	OFFSET FLAT:$SG70329
	mov	edx, DWORD PTR _cntxt$[ebp]
	push	edx
	call	_sql_exec_query
	add	esp, 8
	test	eax, eax
	je	SHORT $L70328
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 113		; 00000071H
	jmp	$eva_err$70233
$L70328:

; 114  : 
; 115  : 	/* Add references to objects */
; 116  : 	M_FREE(fields);

	mov	ecx, DWORD PTR _fields$[ebp]
	push	ecx
	call	_mem_free
	add	esp, 4
	mov	DWORD PTR _fields$[ebp], 0

; 117  : 	for(i = 0, j = 0; i < sqlres.nbrows && j < res->nbrows; i++)

	mov	DWORD PTR _i$[ebp], 0
	mov	DWORD PTR _j$[ebp], 0
	jmp	SHORT $L70330
$L70331:
	mov	edx, DWORD PTR _i$[ebp]
	add	edx, 1
	mov	DWORD PTR _i$[ebp], edx
$L70330:
	mov	eax, DWORD PTR _i$[ebp]
	cmp	eax, DWORD PTR _sqlres$[ebp]
	jae	$eva_noerr$70226
	mov	ecx, DWORD PTR _res$[ebp]
	mov	edx, DWORD PTR _j$[ebp]
	cmp	edx, DWORD PTR [ecx]
	jae	$eva_noerr$70226

; 119  : 		if(i && dyntab_cmp(&sqlres, i, 0, &sqlres, i - 1, 0))

	cmp	DWORD PTR _i$[ebp], 0
	je	$L70333
	push	0
	mov	eax, DWORD PTR _i$[ebp]
	sub	eax, 1
	push	eax
	lea	ecx, DWORD PTR _sqlres$[ebp]
	push	ecx
	push	0
	mov	edx, DWORD PTR _i$[ebp]
	push	edx
	lea	eax, DWORD PTR _sqlres$[ebp]
	push	eax
	call	_dyntab_cmp
	add	esp, 24					; 00000018H
	test	eax, eax
	je	$L70333

; 121  : 			DYNTAB_ADD_BUF(res, j, 1, fields);

	cmp	DWORD PTR _fields$[ebp], 0
	je	SHORT $L70334
	mov	ecx, DWORD PTR _fields$[ebp]
	cmp	DWORD PTR [ecx+4], 0
	je	SHORT $L70334
	push	0
	push	0
	mov	edx, DWORD PTR _fields$[ebp]
	mov	eax, DWORD PTR [edx+4]
	push	eax
	mov	ecx, DWORD PTR _fields$[ebp]
	add	ecx, 8
	push	ecx
	push	1
	mov	edx, DWORD PTR _j$[ebp]
	push	edx
	mov	eax, DWORD PTR _res$[ebp]
	push	eax
	call	_dyntab_add
	add	esp, 28					; 0000001cH
	test	eax, eax
	je	SHORT $L70336
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29872], OFFSET FLAT:$SG70338
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 121		; 00000079H
	jmp	$eva_err$70233
$L70336:
	jmp	SHORT $L70342
$L70334:
	push	0
	push	0
	push	0
	push	0
	push	1
	mov	eax, DWORD PTR _j$[ebp]
	push	eax
	mov	ecx, DWORD PTR _res$[ebp]
	push	ecx
	call	_dyntab_add
	add	esp, 28					; 0000001cH
	test	eax, eax
	je	SHORT $L70342
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29872], OFFSET FLAT:$SG70344
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 121		; 00000079H
	jmp	$eva_err$70233
$L70342:

; 122  : 			M_FREE(fields);

	mov	ecx, DWORD PTR _fields$[ebp]
	push	ecx
	call	_mem_free
	add	esp, 4
	mov	DWORD PTR _fields$[ebp], 0
$L70333:

; 124  : 		while(j < res->nbrows && dyntab_cmp(&sqlres, i, 0, res, j, 0)) j++;

	mov	edx, DWORD PTR _res$[ebp]
	mov	eax, DWORD PTR _j$[ebp]
	cmp	eax, DWORD PTR [edx]
	jae	SHORT $L70347
	push	0
	mov	ecx, DWORD PTR _j$[ebp]
	push	ecx
	mov	edx, DWORD PTR _res$[ebp]
	push	edx
	push	0
	mov	eax, DWORD PTR _i$[ebp]
	push	eax
	lea	ecx, DWORD PTR _sqlres$[ebp]
	push	ecx
	call	_dyntab_cmp
	add	esp, 24					; 00000018H
	test	eax, eax
	je	SHORT $L70347
	mov	edx, DWORD PTR _j$[ebp]
	add	edx, 1
	mov	DWORD PTR _j$[ebp], edx
	jmp	SHORT $L70333
$L70347:

; 125  : 		if(fields) DYNBUF_ADD_STR(&fields, ",");

	cmp	DWORD PTR _fields$[ebp], 0
	je	SHORT $L70350
	push	0
	push	0
	push	1
	push	OFFSET FLAT:$SG70351
	lea	eax, DWORD PTR _fields$[ebp]
	push	eax
	call	_dynbuf_add
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L70350
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29872], OFFSET FLAT:$SG70353
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 125		; 0000007dH
	jmp	SHORT $eva_err$70233
$L70350:

; 126  : 		DYNBUF_ADD_CELL(&fields, &sqlres, i, 1, NO_CONV);

	push	0
	push	0
	push	1
	mov	eax, DWORD PTR _i$[ebp]
	push	eax
	lea	ecx, DWORD PTR _sqlres$[ebp]
	push	ecx
	call	_dyntab_sz
	add	esp, 12					; 0000000cH
	push	eax
	push	1
	mov	edx, DWORD PTR _i$[ebp]
	push	edx
	lea	eax, DWORD PTR _sqlres$[ebp]
	push	eax
	call	_dyntab_val
	add	esp, 12					; 0000000cH
	push	eax
	lea	ecx, DWORD PTR _fields$[ebp]
	push	ecx
	call	_dynbuf_add
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L70355
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29872], OFFSET FLAT:$SG70357
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 126		; 0000007eH
	jmp	SHORT $eva_err$70233
$L70355:

; 127  : 	}

	jmp	$L70331
$eva_noerr$70226:

; 128  : 
; 129  : 	RETURN_OK_CLEANUP;

	push	0
	push	OFFSET FLAT:$SG70358
	push	OFFSET FLAT:$SG70359
	mov	ecx, DWORD PTR _cntxt$[ebp]
	push	ecx
	call	_err_clear
	add	esp, 16					; 00000010H
$eva_err$70233:
	mov	edx, DWORD PTR _cntxt$[ebp]
	cmp	DWORD PTR [edx+29872], 0
	je	SHORT $L70360
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	ecx, DWORD PTR [eax+29900]
	push	ecx
	push	OFFSET FLAT:$SG70361
	push	OFFSET FLAT:$SG70362
	mov	edx, DWORD PTR _cntxt$[ebp]
	push	edx
	call	_err_add_context
	add	esp, 16					; 00000010H
$L70360:
	lea	eax, DWORD PTR _sqlres$[ebp]
	push	eax
	call	_dyntab_free
	add	esp, 4
	mov	ecx, DWORD PTR _forms$[ebp]
	push	ecx
	call	_mem_free
	add	esp, 4
	mov	DWORD PTR _forms$[ebp], 0
	mov	edx, DWORD PTR _fields$[ebp]
	push	edx
	call	_mem_free
	add	esp, 4
	mov	DWORD PTR _fields$[ebp], 0
	mov	eax, DWORD PTR _qry$[ebp]
	push	eax
	call	_mem_free
	add	esp, 4
	mov	DWORD PTR _qry$[ebp], 0
	mov	ecx, DWORD PTR _cntxt$[ebp]
	xor	eax, eax
	cmp	DWORD PTR [ecx+29872], 0
	setne	al

; 130  : }

	mov	esp, ebp
	pop	ebp
	ret	0
_qry_recursive_relation ENDP
_TEXT	ENDS
PUBLIC	_qry_add_table_col
PUBLIC	_qry_make_idlist
PUBLIC	_qry_listobj_field
PUBLIC	_sql_get_listcol
PUBLIC	_sql_drop_table
EXTRN	__chkstk:NEAR
EXTRN	_strtoul:NEAR
EXTRN	_dyntab_cell:NEAR
EXTRN	_strchr:NEAR
EXTRN	_qry_eval_fieldexpr:NEAR
EXTRN	_dyntab_set_txt:NEAR
EXTRN	_qry_build_free:NEAR
EXTRN	_qry_parse_fieldexpr:NEAR
_BSS	SEGMENT
	ALIGN	4

$SG70394 DB	01H DUP (?)
_BSS	ENDS
_DATA	SEGMENT
	ORG $+1
$SG70396 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70402 DB	'TmpTableCol', 00H
$SG70404 DB	'TmpTableCol', 00H
$SG70406 DB	'TmpTableCol', 00H
$SG70420 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70426 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70434 DB	', ', 00H
	ORG $+1
$SG70436 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70441 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70446 DB	'D:\Travail\ABI\EVA\V4.0\CGI\Brunix-2016\qry_utils.c', 00H
$SG70447 DB	'qry_add_table_col', 00H
	ORG $+2
$SG70448 DB	'D:\Travail\ABI\EVA\V4.0\CGI\Brunix-2016\qry_utils.c', 00H
$SG70449 DB	'qry_add_table_col', 00H
	ORG $+2
$SG70451 DB	'D:\Travail\ABI\EVA\V4.0\CGI\Brunix-2016\qry_utils.c', 00H
$SG70452 DB	'qry_add_table_col', 00H
_DATA	ENDS
_TEXT	SEGMENT
_cntxt$ = 8
_res$ = 12
_expr$ = 16
_expr_sz$ = 20
_data$ = -36
_b_err$ = -16
_val$ = -8
_flt$ = -4496
_i$ = -40
_row$ = -12
_col$ = -4
_idobj$70409 = -4500
_c$70413 = -4504
__c$70437 = -4508
_qry_add_table_col PROC NEAR

; 146  : ){

	push	ebp
	mov	ebp, esp
	mov	eax, 4528				; 000011b0H
	call	__chkstk
	push	esi
	push	edi

; 147  : 	DynTable data = {0};

	mov	DWORD PTR _data$[ebp], 0
	xor	eax, eax
	mov	DWORD PTR _data$[ebp+4], eax
	mov	DWORD PTR _data$[ebp+8], eax
	mov	DWORD PTR _data$[ebp+12], eax
	mov	DWORD PTR _data$[ebp+16], eax

; 148  : 	int b_err = !expr || !*expr;

	cmp	DWORD PTR _expr$[ebp], 0
	je	SHORT $L72044
	mov	ecx, DWORD PTR _expr$[ebp]
	movsx	edx, BYTE PTR [ecx]
	test	edx, edx
	je	SHORT $L72044
	mov	DWORD PTR -4512+[ebp], 0
	jmp	SHORT $L72045
$L72044:
	mov	DWORD PTR -4512+[ebp], 1
$L72045:
	mov	eax, DWORD PTR -4512+[ebp]
	mov	DWORD PTR _b_err$[ebp], eax

; 149  : 	DynBuffer *val = NULL;

	mov	DWORD PTR _val$[ebp], 0

; 150  : 	QryBuild flt = { {0} };

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

; 151  : 	unsigned long i, row = res->nbrows, col = res->nbcols;

	mov	edx, DWORD PTR _res$[ebp]
	mov	eax, DWORD PTR [edx]
	mov	DWORD PTR _row$[ebp], eax
	mov	ecx, DWORD PTR _res$[ebp]
	mov	edx, DWORD PTR [ecx+8]
	mov	DWORD PTR _col$[ebp], edx

; 152  : 	static DynTable *prevres = NULL;
; 153  : 
; 154  : 	/* Prepare column 0 if first column added */
; 155  : 	if(!row) RETURN_OK;

	cmp	DWORD PTR _row$[ebp], 0
	jne	SHORT $L70386
	jmp	$eva_noerr$70387
$L70386:

; 156  : 	if(!res->cell->IdObj) for(i = 0; i < row; i++) dyntab_cell(res, i, 0)->IdObj = DYNTAB_TOULRC(res, i, 0);

	mov	eax, DWORD PTR _res$[ebp]
	mov	ecx, DWORD PTR [eax+16]
	cmp	DWORD PTR [ecx+20], 0
	jne	SHORT $L70391
	mov	DWORD PTR _i$[ebp], 0
	jmp	SHORT $L70389
$L70390:
	mov	edx, DWORD PTR _i$[ebp]
	add	edx, 1
	mov	DWORD PTR _i$[ebp], edx
$L70389:
	mov	eax, DWORD PTR _i$[ebp]
	cmp	eax, DWORD PTR _row$[ebp]
	jae	SHORT $L70391
	push	10					; 0000000aH
	push	0
	push	0
	mov	ecx, DWORD PTR _i$[ebp]
	push	ecx
	mov	edx, DWORD PTR _res$[ebp]
	push	edx
	call	_dyntab_val
	add	esp, 12					; 0000000cH
	push	eax
	call	_strtoul
	add	esp, 12					; 0000000cH
	mov	esi, eax
	push	0
	mov	eax, DWORD PTR _i$[ebp]
	push	eax
	mov	ecx, DWORD PTR _res$[ebp]
	push	ecx
	call	_dyntab_cell
	add	esp, 12					; 0000000cH
	mov	DWORD PTR [eax+20], esi
	jmp	SHORT $L70390
$L70391:

; 157  : 
; 158  : 	/* Add a column to the table */
; 159  : 	DYNTAB_SET(res, 0, col, "");

	push	0
	push	OFFSET FLAT:$SG70394
	mov	edx, DWORD PTR _col$[ebp]
	push	edx
	push	0
	mov	eax, DWORD PTR _res$[ebp]
	push	eax
	call	_dyntab_set_txt
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L70393
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29872], OFFSET FLAT:$SG70396
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 159		; 0000009fH
	jmp	$eva_err$70397
$L70393:

; 160  : 
; 161  : 	/* Return if empty expression */
; 162  : 	if(!expr || !expr_sz) RETURN_OK;

	cmp	DWORD PTR _expr$[ebp], 0
	je	SHORT $L70399
	cmp	DWORD PTR _expr_sz$[ebp], 0
	jne	SHORT $L70398
$L70399:
	jmp	$eva_noerr$70387
$L70398:

; 163  : 
; 164  : 	/* Read column data */
; 165  : 	if(strchr(expr, '['))

	push	91					; 0000005bH
	mov	eax, DWORD PTR _expr$[ebp]
	push	eax
	call	_strchr
	add	esp, 8
	test	eax, eax
	je	$L70400

; 167  : 		if(prevres != res)

	mov	ecx, DWORD PTR _?prevres@?1??qry_add_table_col@@9@9
	cmp	ecx, DWORD PTR _res$[ebp]
	je	SHORT $L70401

; 169  : 			sql_drop_table(cntxt, "TmpTableCol");

	push	OFFSET FLAT:$SG70402
	mov	edx, DWORD PTR _cntxt$[ebp]
	push	edx
	call	_sql_drop_table
	add	esp, 8

; 170  : 			if(qry_make_idlist(cntxt, res, "TmpTableCol")) STACK_ERROR;

	push	OFFSET FLAT:$SG70404
	mov	eax, DWORD PTR _res$[ebp]
	push	eax
	mov	ecx, DWORD PTR _cntxt$[ebp]
	push	ecx
	call	_qry_make_idlist
	add	esp, 12					; 0000000cH
	test	eax, eax
	je	SHORT $L70403
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 170		; 000000aaH
	jmp	$eva_err$70397
$L70403:

; 171  : 			prevres = res;

	mov	eax, DWORD PTR _res$[ebp]
	mov	DWORD PTR _?prevres@?1??qry_add_table_col@@9@9, eax
$L70401:

; 173  : 		b_err = b_err ||
; 174  : 			qry_eval_fieldexpr(cntxt, &data, expr, "TmpTableCol", NULL);

	cmp	DWORD PTR _b_err$[ebp], 0
	jne	SHORT $L72046
	push	0
	push	OFFSET FLAT:$SG70406
	mov	ecx, DWORD PTR _expr$[ebp]
	push	ecx
	lea	edx, DWORD PTR _data$[ebp]
	push	edx
	mov	eax, DWORD PTR _cntxt$[ebp]
	push	eax
	call	_qry_eval_fieldexpr
	add	esp, 20					; 00000014H
	test	eax, eax
	jne	SHORT $L72046
	mov	DWORD PTR -4516+[ebp], 0
	jmp	SHORT $L72047
$L72046:
	mov	DWORD PTR -4516+[ebp], 1
$L72047:
	mov	ecx, DWORD PTR -4516+[ebp]
	mov	DWORD PTR _b_err$[ebp], ecx

; 176  : 	else

	jmp	SHORT $L70407
$L70400:

; 178  : 		flt.b_recdata = 1;

	mov	DWORD PTR _flt$[ebp+4448], 1

; 179  : 		b_err = b_err ||
; 180  : 				qry_parse_fieldexpr(cntxt, expr, expr_sz, &flt) ||
; 181  : 				flt.b_oper ? sql_get_listcol(cntxt, &data, res, &flt, 0) :
; 182  : 							qry_listobj_field(cntxt, &data, res, expr);

	cmp	DWORD PTR _b_err$[ebp], 0
	jne	SHORT $L72048
	lea	edx, DWORD PTR _flt$[ebp]
	push	edx
	mov	eax, DWORD PTR _expr_sz$[ebp]
	push	eax
	mov	ecx, DWORD PTR _expr$[ebp]
	push	ecx
	mov	edx, DWORD PTR _cntxt$[ebp]
	push	edx
	call	_qry_parse_fieldexpr
	add	esp, 16					; 00000010H
	test	eax, eax
	jne	SHORT $L72048
	cmp	DWORD PTR _flt$[ebp+4432], 0
	jne	SHORT $L72048
	mov	eax, DWORD PTR _expr$[ebp]
	push	eax
	mov	ecx, DWORD PTR _res$[ebp]
	push	ecx
	lea	edx, DWORD PTR _data$[ebp]
	push	edx
	mov	eax, DWORD PTR _cntxt$[ebp]
	push	eax
	call	_qry_listobj_field
	add	esp, 16					; 00000010H
	mov	DWORD PTR -4520+[ebp], eax
	jmp	SHORT $L72049
$L72048:
	push	0
	lea	ecx, DWORD PTR _flt$[ebp]
	push	ecx
	mov	edx, DWORD PTR _res$[ebp]
	push	edx
	lea	eax, DWORD PTR _data$[ebp]
	push	eax
	mov	ecx, DWORD PTR _cntxt$[ebp]
	push	ecx
	call	_sql_get_listcol
	add	esp, 20					; 00000014H
	mov	DWORD PTR -4520+[ebp], eax
$L72049:
	mov	edx, DWORD PTR -4520+[ebp]
	mov	DWORD PTR _b_err$[ebp], edx
$L70407:

; 184  : 
; 185  : 	/* Place data in table rows corresponding to IdObj in 1st col of res */
; 186  : 	if(!b_err && data.nbrows)

	cmp	DWORD PTR _b_err$[ebp], 0
	jne	$L70408
	cmp	DWORD PTR _data$[ebp], 0
	je	$L70408

; 188  : 		unsigned long idobj = 0;

	mov	DWORD PTR _idobj$70409[ebp], 0

; 189  : 		for(i = 0; i < data.nbrows; i++)

	mov	DWORD PTR _i$[ebp], 0
	jmp	SHORT $L70410
$L70411:
	mov	eax, DWORD PTR _i$[ebp]
	add	eax, 1
	mov	DWORD PTR _i$[ebp], eax
$L70410:
	mov	ecx, DWORD PTR _i$[ebp]
	cmp	ecx, DWORD PTR _data$[ebp]
	jae	$L70412

; 191  : 			DynTableCell *c = dyntab_cell(&data, i, 0);

	push	0
	mov	edx, DWORD PTR _i$[ebp]
	push	edx
	lea	eax, DWORD PTR _data$[ebp]
	push	eax
	call	_dyntab_cell
	add	esp, 12					; 0000000cH
	mov	DWORD PTR _c$70413[ebp], eax

; 192  : 			if(c->IdObj != idobj)

	mov	ecx, DWORD PTR _c$70413[ebp]
	mov	edx, DWORD PTR [ecx+20]
	cmp	edx, DWORD PTR _idobj$70409[ebp]
	je	$L70414

; 194  : 				if(val && row < res->nbrows) DYNTAB_ADD_BUF(res, row, col, val);

	cmp	DWORD PTR _val$[ebp], 0
	je	$L70424
	mov	eax, DWORD PTR _res$[ebp]
	mov	ecx, DWORD PTR _row$[ebp]
	cmp	ecx, DWORD PTR [eax]
	jae	$L70424
	cmp	DWORD PTR _val$[ebp], 0
	je	SHORT $L70416
	mov	edx, DWORD PTR _val$[ebp]
	cmp	DWORD PTR [edx+4], 0
	je	SHORT $L70416
	push	0
	push	0
	mov	eax, DWORD PTR _val$[ebp]
	mov	ecx, DWORD PTR [eax+4]
	push	ecx
	mov	edx, DWORD PTR _val$[ebp]
	add	edx, 8
	push	edx
	mov	eax, DWORD PTR _col$[ebp]
	push	eax
	mov	ecx, DWORD PTR _row$[ebp]
	push	ecx
	mov	edx, DWORD PTR _res$[ebp]
	push	edx
	call	_dyntab_add
	add	esp, 28					; 0000001cH
	test	eax, eax
	je	SHORT $L70418
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29872], OFFSET FLAT:$SG70420
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 194		; 000000c2H
	jmp	$eva_err$70397
$L70418:
	jmp	SHORT $L70424
$L70416:
	push	0
	push	0
	push	0
	push	0
	mov	edx, DWORD PTR _col$[ebp]
	push	edx
	mov	eax, DWORD PTR _row$[ebp]
	push	eax
	mov	ecx, DWORD PTR _res$[ebp]
	push	ecx
	call	_dyntab_add
	add	esp, 28					; 0000001cH
	test	eax, eax
	je	SHORT $L70424
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29872], OFFSET FLAT:$SG70426
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 194		; 000000c2H
	jmp	$eva_err$70397
$L70424:

; 195  : 				idobj = c->IdObj;

	mov	ecx, DWORD PTR _c$70413[ebp]
	mov	edx, DWORD PTR [ecx+20]
	mov	DWORD PTR _idobj$70409[ebp], edx

; 196  : 				for(row = 0; row < res->nbrows && idobj != dyntab_cell(res, row, 0)->IdObj; row++);

	mov	DWORD PTR _row$[ebp], 0
	jmp	SHORT $L70427
$L70428:
	mov	eax, DWORD PTR _row$[ebp]
	add	eax, 1
	mov	DWORD PTR _row$[ebp], eax
$L70427:
	mov	ecx, DWORD PTR _res$[ebp]
	mov	edx, DWORD PTR _row$[ebp]
	cmp	edx, DWORD PTR [ecx]
	jae	SHORT $L70429
	push	0
	mov	eax, DWORD PTR _row$[ebp]
	push	eax
	mov	ecx, DWORD PTR _res$[ebp]
	push	ecx
	call	_dyntab_cell
	add	esp, 12					; 0000000cH
	mov	edx, DWORD PTR _idobj$70409[ebp]
	cmp	edx, DWORD PTR [eax+20]
	je	SHORT $L70429
	jmp	SHORT $L70428
$L70429:

; 197  : 				M_FREE(val);

	mov	eax, DWORD PTR _val$[ebp]
	push	eax
	call	_mem_free
	add	esp, 4
	mov	DWORD PTR _val$[ebp], 0
$L70414:

; 199  : 			if(row == res->nbrows) continue;

	mov	ecx, DWORD PTR _res$[ebp]
	mov	edx, DWORD PTR _row$[ebp]
	cmp	edx, DWORD PTR [ecx]
	jne	SHORT $L70430
	jmp	$L70411
$L70430:

; 200  : 			if(val) DYNBUF_ADD_STR(&val, ", ");

	cmp	DWORD PTR _val$[ebp], 0
	je	SHORT $L70433
	push	0
	push	0
	push	2
	push	OFFSET FLAT:$SG70434
	lea	eax, DWORD PTR _val$[ebp]
	push	eax
	call	_dynbuf_add
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L70433
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29872], OFFSET FLAT:$SG70436
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 200		; 000000c8H
	jmp	$eva_err$70397
$L70433:

; 201  : 			DYNBUF_ADD_CELLP(&val, c, NO_CONV);

	mov	eax, DWORD PTR _c$70413[ebp]
	mov	DWORD PTR __c$70437[ebp], eax
	cmp	DWORD PTR __c$70437[ebp], 0
	je	SHORT $L70439
	push	0
	push	0
	mov	ecx, DWORD PTR __c$70437[ebp]
	mov	edx, DWORD PTR [ecx+4]
	push	edx
	mov	eax, DWORD PTR __c$70437[ebp]
	mov	ecx, DWORD PTR [eax]
	push	ecx
	lea	edx, DWORD PTR _val$[ebp]
	push	edx
	call	_dynbuf_add
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L70439
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29872], OFFSET FLAT:$SG70441
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 201		; 000000c9H
	jmp	$eva_err$70397
$L70439:

; 202  : 		}

	jmp	$L70411
$L70412:

; 203  : 		if(val && row < res->nbrows) dyntab_add(res, row, col, DYNBUF_VAL_SZ(val), NO_CONV);

	cmp	DWORD PTR _val$[ebp], 0
	je	SHORT $L70442
	mov	edx, DWORD PTR _res$[ebp]
	mov	eax, DWORD PTR _row$[ebp]
	cmp	eax, DWORD PTR [edx]
	jae	SHORT $L70442
	cmp	DWORD PTR _val$[ebp], 0
	je	SHORT $L72050
	mov	ecx, DWORD PTR _val$[ebp]
	mov	edx, DWORD PTR [ecx+4]
	mov	DWORD PTR -4524+[ebp], edx
	jmp	SHORT $L72051
$L72050:
	mov	DWORD PTR -4524+[ebp], 0
$L72051:
	cmp	DWORD PTR _val$[ebp], 0
	je	SHORT $L72052
	mov	eax, DWORD PTR _val$[ebp]
	add	eax, 8
	mov	DWORD PTR -4528+[ebp], eax
	jmp	SHORT $L72053
$L72052:
	mov	DWORD PTR -4528+[ebp], 0
$L72053:
	push	0
	push	0
	mov	ecx, DWORD PTR -4524+[ebp]
	push	ecx
	mov	edx, DWORD PTR -4528+[ebp]
	push	edx
	mov	eax, DWORD PTR _col$[ebp]
	push	eax
	mov	ecx, DWORD PTR _row$[ebp]
	push	ecx
	mov	edx, DWORD PTR _res$[ebp]
	push	edx
	call	_dyntab_add
	add	esp, 28					; 0000001cH
$L70442:

; 205  : 	else

	jmp	SHORT $eva_noerr$70387
$L70408:

; 206  : 		CLEAR_ERROR;

	push	206					; 000000ceH
	push	OFFSET FLAT:$SG70446
	push	OFFSET FLAT:$SG70447
	mov	eax, DWORD PTR _cntxt$[ebp]
	push	eax
	call	_err_clear
	add	esp, 16					; 00000010H
$eva_noerr$70387:

; 207  : 
; 208  : 	RETURN_OK_CLEANUP;

	push	0
	push	OFFSET FLAT:$SG70448
	push	OFFSET FLAT:$SG70449
	mov	ecx, DWORD PTR _cntxt$[ebp]
	push	ecx
	call	_err_clear
	add	esp, 16					; 00000010H
$eva_err$70397:
	mov	edx, DWORD PTR _cntxt$[ebp]
	cmp	DWORD PTR [edx+29872], 0
	je	SHORT $L70450
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	ecx, DWORD PTR [eax+29900]
	push	ecx
	push	OFFSET FLAT:$SG70451
	push	OFFSET FLAT:$SG70452
	mov	edx, DWORD PTR _cntxt$[ebp]
	push	edx
	call	_err_add_context
	add	esp, 16					; 00000010H
$L70450:
	lea	eax, DWORD PTR _flt$[ebp]
	push	eax
	call	_qry_build_free
	add	esp, 4
	mov	ecx, DWORD PTR _val$[ebp]
	push	ecx
	call	_mem_free
	add	esp, 4
	mov	DWORD PTR _val$[ebp], 0
	lea	edx, DWORD PTR _data$[ebp]
	push	edx
	call	_dyntab_free
	add	esp, 4
	mov	eax, DWORD PTR _cntxt$[ebp]
	xor	ecx, ecx
	cmp	DWORD PTR [eax+29872], 0
	setne	cl
	mov	eax, ecx

; 209  : }

	pop	edi
	pop	esi
	mov	esp, ebp
	pop	ebp
	ret	0
_qry_add_table_col ENDP
_TEXT	ENDS
PUBLIC	_qry_complete_data
EXTRN	_dyntab_next_field:NEAR
EXTRN	_dyntab_filter_field:NEAR
_DATA	SEGMENT
	ORG $+2
$SG70482 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70489 DB	'D:\Travail\ABI\EVA\V4.0\CGI\Brunix-2016\qry_utils.c', 00H
$SG70490 DB	'qry_complete_data', 00H
	ORG $+2
$SG70492 DB	'D:\Travail\ABI\EVA\V4.0\CGI\Brunix-2016\qry_utils.c', 00H
$SG70493 DB	'qry_complete_data', 00H
_DATA	ENDS
_TEXT	SEGMENT
_cntxt$ = 8
_objdata$ = 12
_srcdata$ = 16
_fields$ = 20
_tables$ = 24
_i$ = -8
_nbobj$ = -4
_obj$ = -12
_src$70476 = -20
_pos$70477 = -24
_nb$70478 = -16
_qry_complete_data PROC NEAR

; 232  : ){

	push	ebp
	mov	ebp, esp
	sub	esp, 28					; 0000001cH

; 233  : 	unsigned long i, nbobj = objdata ? objdata->nbrows : 0;

	cmp	DWORD PTR _objdata$[ebp], 0
	je	SHORT $L72056
	mov	eax, DWORD PTR _objdata$[ebp]
	mov	ecx, DWORD PTR [eax]
	mov	DWORD PTR -28+[ebp], ecx
	jmp	SHORT $L72057
$L72056:
	mov	DWORD PTR -28+[ebp], 0
$L72057:
	mov	edx, DWORD PTR -28+[ebp]
	mov	DWORD PTR _nbobj$[ebp], edx

; 234  : 	DynTableCell *obj;
; 235  : 
; 236  : 	/* Check params */
; 237  : 	if(!objdata || !srcdata || !srcdata->nbrows) RETURN_OK;

	cmp	DWORD PTR _objdata$[ebp], 0
	je	SHORT $L70471
	cmp	DWORD PTR _srcdata$[ebp], 0
	je	SHORT $L70471
	mov	eax, DWORD PTR _srcdata$[ebp]
	cmp	DWORD PTR [eax], 0
	jne	SHORT $L70470
$L70471:
	jmp	$eva_noerr$70472
$L70470:

; 238  : 
; 239  : 	/* TODO : handle field tables */
; 240  : 	tables = fields;

	mov	ecx, DWORD PTR _fields$[ebp]
	mov	DWORD PTR _tables$[ebp], ecx

; 241  : 
; 242  : 	/* For each source value */
; 243  : 	for(i = 0; i < srcdata->nbrows; i++)

	mov	DWORD PTR _i$[ebp], 0
	jmp	SHORT $L70473
$L70474:
	mov	edx, DWORD PTR _i$[ebp]
	add	edx, 1
	mov	DWORD PTR _i$[ebp], edx
$L70473:
	mov	eax, DWORD PTR _srcdata$[ebp]
	mov	ecx, DWORD PTR _i$[ebp]
	cmp	ecx, DWORD PTR [eax]
	jae	$L70475

; 245  : 		/* Search for values for that field in objdata */
; 246  : 		DynTableCell *src = dyntab_cell(srcdata, i, 0);

	push	0
	mov	edx, DWORD PTR _i$[ebp]
	push	edx
	mov	eax, DWORD PTR _srcdata$[ebp]
	push	eax
	call	_dyntab_cell
	add	esp, 12					; 0000000cH
	mov	DWORD PTR _src$70476[ebp], eax

; 247  : 		unsigned long pos = dyntab_next_field(objdata, src->field, ~0UL, 0, 1, 0);

	push	0
	push	1
	push	0
	push	-1
	mov	ecx, DWORD PTR _src$70476[ebp]
	mov	edx, DWORD PTR [ecx+8]
	push	edx
	mov	eax, DWORD PTR _objdata$[ebp]
	push	eax
	call	_dyntab_next_field
	add	esp, 24					; 00000018H
	mov	DWORD PTR _pos$70477[ebp], eax

; 248  : 		unsigned long nb = objdata->nbrows;

	mov	ecx, DWORD PTR _objdata$[ebp]
	mov	edx, DWORD PTR [ecx]
	mov	DWORD PTR _nb$70478[ebp], edx

; 249  : 
; 250  : 		/* If value found - continue */
; 251  : 		if(pos < objdata->nbrows) continue;

	mov	eax, DWORD PTR _objdata$[ebp]
	mov	ecx, DWORD PTR _pos$70477[ebp]
	cmp	ecx, DWORD PTR [eax]
	jae	SHORT $L70479
	jmp	SHORT $L70474
$L70479:

; 252  : 
; 253  : 		/* Transfer source field values to objdata */
; 254  : 		pos = i;

	mov	edx, DWORD PTR _i$[ebp]
	mov	DWORD PTR _pos$70477[ebp], edx

; 255  : 		if(dyntab_filter_field(objdata, 1, srcdata, src->field, ~0UL, &pos)) RETURN_ERR_MEMORY;

	lea	eax, DWORD PTR _pos$70477[ebp]
	push	eax
	push	-1
	mov	ecx, DWORD PTR _src$70476[ebp]
	mov	edx, DWORD PTR [ecx+8]
	push	edx
	mov	eax, DWORD PTR _srcdata$[ebp]
	push	eax
	push	1
	mov	ecx, DWORD PTR _objdata$[ebp]
	push	ecx
	call	_dyntab_filter_field
	add	esp, 24					; 00000018H
	test	eax, eax
	je	SHORT $L70480
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29872], OFFSET FLAT:$SG70482
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 255		; 000000ffH
	jmp	$eva_err$70483
$L70480:

; 256  : 		if(objdata->nbrows > nb) i += objdata->nbrows - nb - 1;

	mov	ecx, DWORD PTR _objdata$[ebp]
	mov	edx, DWORD PTR [ecx]
	cmp	edx, DWORD PTR _nb$70478[ebp]
	jbe	SHORT $L70484
	mov	eax, DWORD PTR _objdata$[ebp]
	mov	ecx, DWORD PTR [eax]
	sub	ecx, DWORD PTR _nb$70478[ebp]
	mov	edx, DWORD PTR _i$[ebp]
	lea	eax, DWORD PTR [edx+ecx-1]
	mov	DWORD PTR _i$[ebp], eax
$L70484:

; 257  : 	}

	jmp	$L70474
$L70475:

; 258  : 
; 259  : 	/* Set IdObj member of copied values */
; 260  : 	obj = dyntab_cell(objdata, 0, 0);

	push	0
	push	0
	mov	ecx, DWORD PTR _objdata$[ebp]
	push	ecx
	call	_dyntab_cell
	add	esp, 12					; 0000000cH
	mov	DWORD PTR _obj$[ebp], eax

; 261  : 	if(obj)

	cmp	DWORD PTR _obj$[ebp], 0
	je	SHORT $eva_noerr$70472

; 262  : 		for(i = nbobj; i < objdata->nbrows; i++)

	mov	edx, DWORD PTR _nbobj$[ebp]
	mov	DWORD PTR _i$[ebp], edx
	jmp	SHORT $L70486
$L70487:
	mov	eax, DWORD PTR _i$[ebp]
	add	eax, 1
	mov	DWORD PTR _i$[ebp], eax
$L70486:
	mov	ecx, DWORD PTR _objdata$[ebp]
	mov	edx, DWORD PTR _i$[ebp]
	cmp	edx, DWORD PTR [ecx]
	jae	SHORT $eva_noerr$70472

; 263  : 			dyntab_cell(objdata, i, 0)->IdObj = obj->IdObj;

	push	0
	mov	eax, DWORD PTR _i$[ebp]
	push	eax
	mov	ecx, DWORD PTR _objdata$[ebp]
	push	ecx
	call	_dyntab_cell
	add	esp, 12					; 0000000cH
	mov	edx, DWORD PTR _obj$[ebp]
	mov	ecx, DWORD PTR [edx+20]
	mov	DWORD PTR [eax+20], ecx
	jmp	SHORT $L70487
$eva_noerr$70472:

; 264  : 
; 265  : 	RETURN_OK_CLEANUP;

	push	0
	push	OFFSET FLAT:$SG70489
	push	OFFSET FLAT:$SG70490
	mov	edx, DWORD PTR _cntxt$[ebp]
	push	edx
	call	_err_clear
	add	esp, 16					; 00000010H
$eva_err$70483:
	mov	eax, DWORD PTR _cntxt$[ebp]
	cmp	DWORD PTR [eax+29872], 0
	je	SHORT $L70491
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	edx, DWORD PTR [ecx+29900]
	push	edx
	push	OFFSET FLAT:$SG70492
	push	OFFSET FLAT:$SG70493
	mov	eax, DWORD PTR _cntxt$[ebp]
	push	eax
	call	_err_add_context
	add	esp, 16					; 00000010H
$L70491:
	mov	ecx, DWORD PTR _cntxt$[ebp]
	xor	eax, eax
	cmp	DWORD PTR [ecx+29872], 0
	setne	al

; 266  : }

	mov	esp, ebp
	pop	ebp
	ret	0
_qry_complete_data ENDP
_TEXT	ENDS
PUBLIC	_qry_debug_table
EXTRN	__snprintf:NEAR
EXTRN	_dynbuf_add_int:NEAR
_BSS	SEGMENT
	ALIGN	4

$SG70533 DB	01H DUP (?)
	ALIGN	4

$SG70548 DB	01H DUP (?)
	ALIGN	4

$SG70554 DB	01H DUP (?)
	ALIGN	4

$SG70560 DB	01H DUP (?)
_BSS	ENDS
_DATA	SEGMENT
	ORG $+2
$SG70515 DB	0aH, 00H
	ORG $+2
$SG70517 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70525 DB	'%05lu', 09H, 00H
	ORG $+1
$SG70527 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70530 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70534 DB	'.', 00H
	ORG $+2
$SG70536 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70539 DB	' : ', 00H
$SG70541 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70545 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70549 DB	'.', 00H
	ORG $+2
$SG70551 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70555 DB	'.', 00H
	ORG $+2
$SG70557 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70561 DB	'.', 00H
	ORG $+2
$SG70563 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70566 DB	0aH, 00H
	ORG $+2
$SG70567 DB	'=', 00H
	ORG $+2
$SG70569 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70573 DB	'...', 0aH, 00H
	ORG $+3
$SG70575 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70576 DB	'D:\Travail\ABI\EVA\V4.0\CGI\Brunix-2016\qry_utils.c', 00H
$SG70577 DB	'qry_debug_table', 00H
$SG70579 DB	'D:\Travail\ABI\EVA\V4.0\CGI\Brunix-2016\qry_utils.c', 00H
$SG70580 DB	'qry_debug_table', 00H
_DATA	ENDS
_TEXT	SEGMENT
_cntxt$ = 8
_tab$ = 12
_beg$ = 16
_end$ = 20
_i$ = -4
_buf$70522 = -24
_qry_debug_table PROC NEAR

; 281  : ){

	push	ebp
	mov	ebp, esp
	sub	esp, 24					; 00000018H

; 282  : 	unsigned long i;
; 283  : 
; 284  : 	if(!tab || !tab->nbrows || !(cntxt->sql_trace & 2)) RETURN_OK;

	cmp	DWORD PTR _tab$[ebp], 0
	je	SHORT $L70509
	mov	eax, DWORD PTR _tab$[ebp]
	cmp	DWORD PTR [eax], 0
	je	SHORT $L70509
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	edx, DWORD PTR [ecx+29852]
	and	edx, 2
	test	edx, edx
	jne	SHORT $L70508
$L70509:
	jmp	$eva_noerr$70510
$L70508:

; 285  : 	if(!end || end > tab->nbrows) end = tab->nbrows;

	cmp	DWORD PTR _end$[ebp], 0
	je	SHORT $L70512
	mov	eax, DWORD PTR _tab$[ebp]
	mov	ecx, DWORD PTR _end$[ebp]
	cmp	ecx, DWORD PTR [eax]
	jbe	SHORT $L70511
$L70512:
	mov	edx, DWORD PTR _tab$[ebp]
	mov	eax, DWORD PTR [edx]
	mov	DWORD PTR _end$[ebp], eax
$L70511:

; 286  : 
; 287  : 	DYNBUF_ADD_STR(&cntxt->debug_msg, "\n");

	push	0
	push	0
	push	1
	push	OFFSET FLAT:$SG70515
	mov	ecx, DWORD PTR _cntxt$[ebp]
	add	ecx, 29864				; 000074a8H
	push	ecx
	call	_dynbuf_add
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L70514
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29872], OFFSET FLAT:$SG70517
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 287		; 0000011fH
	jmp	$eva_err$70518
$L70514:

; 288  : 	for(i = beg; i < end; i++)

	mov	ecx, DWORD PTR _beg$[ebp]
	mov	DWORD PTR _i$[ebp], ecx
	jmp	SHORT $L70519
$L70520:
	mov	edx, DWORD PTR _i$[ebp]
	add	edx, 1
	mov	DWORD PTR _i$[ebp], edx
$L70519:
	mov	eax, DWORD PTR _i$[ebp]
	cmp	eax, DWORD PTR _end$[ebp]
	jae	$eva_noerr$70510

; 290  : 		DYNBUF_PRINTF(&cntxt->debug_msg, 16, "%05lu\t", i, NO_CONV);

	mov	BYTE PTR _buf$70522[ebp], 0
	xor	ecx, ecx
	mov	DWORD PTR _buf$70522[ebp+1], ecx
	mov	DWORD PTR _buf$70522[ebp+5], ecx
	mov	DWORD PTR _buf$70522[ebp+9], ecx
	mov	DWORD PTR _buf$70522[ebp+13], ecx
	push	0
	push	0
	mov	edx, DWORD PTR _i$[ebp]
	push	edx
	push	OFFSET FLAT:$SG70525
	push	16					; 00000010H
	lea	eax, DWORD PTR _buf$70522[ebp]
	push	eax
	call	__snprintf
	add	esp, 16					; 00000010H
	push	eax
	lea	ecx, DWORD PTR _buf$70522[ebp]
	push	ecx
	mov	edx, DWORD PTR _cntxt$[ebp]
	add	edx, 29864				; 000074a8H
	push	edx
	call	_dynbuf_add
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L70524
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29872], OFFSET FLAT:$SG70527
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 290		; 00000122H
	jmp	$eva_err$70518
$L70524:

; 291  : 		DYNBUF_ADD_INT(&cntxt->debug_msg, tab->cell[i].IdObj);

	mov	edx, DWORD PTR _i$[ebp]
	shl	edx, 6
	mov	eax, DWORD PTR _tab$[ebp]
	mov	ecx, DWORD PTR [eax+16]
	mov	edx, DWORD PTR [ecx+edx+20]
	push	edx
	mov	eax, DWORD PTR _cntxt$[ebp]
	add	eax, 29864				; 000074a8H
	push	eax
	call	_dynbuf_add_int
	add	esp, 8
	test	eax, eax
	je	SHORT $L70528
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29872], OFFSET FLAT:$SG70530
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 291		; 00000123H
	jmp	$eva_err$70518
$L70528:

; 292  : 		if(tab->cell[i].IdValObj) DYNBUF_ADD3_INT(&cntxt->debug_msg, ".", tab->cell[i].IdValObj, "");

	mov	eax, DWORD PTR _i$[ebp]
	shl	eax, 6
	mov	ecx, DWORD PTR _tab$[ebp]
	mov	edx, DWORD PTR [ecx+16]
	cmp	DWORD PTR [edx+eax+24], 0
	je	SHORT $L70532
	push	0
	push	OFFSET FLAT:$SG70533
	mov	eax, DWORD PTR _i$[ebp]
	shl	eax, 6
	mov	ecx, DWORD PTR _tab$[ebp]
	mov	edx, DWORD PTR [ecx+16]
	mov	eax, DWORD PTR [edx+eax+24]
	push	eax
	push	1
	push	OFFSET FLAT:$SG70534
	mov	ecx, DWORD PTR _cntxt$[ebp]
	add	ecx, 29864				; 000074a8H
	push	ecx
	call	_dynbuf_add3_int
	add	esp, 24					; 00000018H
	test	eax, eax
	je	SHORT $L70532
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29872], OFFSET FLAT:$SG70536
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 292		; 00000124H
	jmp	$eva_err$70518
$L70532:

; 293  : 		DYNBUF_ADD_STR(&cntxt->debug_msg, " : ");

	push	0
	push	0
	push	3
	push	OFFSET FLAT:$SG70539
	mov	ecx, DWORD PTR _cntxt$[ebp]
	add	ecx, 29864				; 000074a8H
	push	ecx
	call	_dynbuf_add
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L70538
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29872], OFFSET FLAT:$SG70541
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 293		; 00000125H
	jmp	$eva_err$70518
$L70538:

; 294  : 		DYNBUF_ADD(&cntxt->debug_msg, tab->cell[i].field, 0, NO_CONV);

	push	0
	push	0
	push	0
	mov	ecx, DWORD PTR _i$[ebp]
	shl	ecx, 6
	mov	edx, DWORD PTR _tab$[ebp]
	mov	eax, DWORD PTR [edx+16]
	mov	ecx, DWORD PTR [eax+ecx+8]
	push	ecx
	mov	edx, DWORD PTR _cntxt$[ebp]
	add	edx, 29864				; 000074a8H
	push	edx
	call	_dynbuf_add
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L70543
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29872], OFFSET FLAT:$SG70545
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 294		; 00000126H
	jmp	$eva_err$70518
$L70543:

; 295  : 		if(tab->cell[i].Num > 0) DYNBUF_ADD3_INT(&cntxt->debug_msg, ".", tab->cell[i].Num, "");

	mov	edx, DWORD PTR _i$[ebp]
	shl	edx, 6
	mov	eax, DWORD PTR _tab$[ebp]
	mov	ecx, DWORD PTR [eax+16]
	cmp	DWORD PTR [ecx+edx+36], 0
	jbe	SHORT $L70547
	push	0
	push	OFFSET FLAT:$SG70548
	mov	edx, DWORD PTR _i$[ebp]
	shl	edx, 6
	mov	eax, DWORD PTR _tab$[ebp]
	mov	ecx, DWORD PTR [eax+16]
	mov	edx, DWORD PTR [ecx+edx+36]
	push	edx
	push	1
	push	OFFSET FLAT:$SG70549
	mov	eax, DWORD PTR _cntxt$[ebp]
	add	eax, 29864				; 000074a8H
	push	eax
	call	_dynbuf_add3_int
	add	esp, 24					; 00000018H
	test	eax, eax
	je	SHORT $L70547
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29872], OFFSET FLAT:$SG70551
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 295		; 00000127H
	jmp	$eva_err$70518
$L70547:

; 296  : 		if(tab->cell[i].Line > 0) DYNBUF_ADD3_INT(&cntxt->debug_msg, ".", tab->cell[i].Line, "");

	mov	eax, DWORD PTR _i$[ebp]
	shl	eax, 6
	mov	ecx, DWORD PTR _tab$[ebp]
	mov	edx, DWORD PTR [ecx+16]
	cmp	DWORD PTR [edx+eax+40], 0
	jbe	SHORT $L70553
	push	0
	push	OFFSET FLAT:$SG70554
	mov	eax, DWORD PTR _i$[ebp]
	shl	eax, 6
	mov	ecx, DWORD PTR _tab$[ebp]
	mov	edx, DWORD PTR [ecx+16]
	mov	eax, DWORD PTR [edx+eax+40]
	push	eax
	push	1
	push	OFFSET FLAT:$SG70555
	mov	ecx, DWORD PTR _cntxt$[ebp]
	add	ecx, 29864				; 000074a8H
	push	ecx
	call	_dynbuf_add3_int
	add	esp, 24					; 00000018H
	test	eax, eax
	je	SHORT $L70553
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29872], OFFSET FLAT:$SG70557
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 296		; 00000128H
	jmp	$eva_err$70518
$L70553:

; 297  : 		if(tab->cell[i].Lang > 0) DYNBUF_ADD3_INT(&cntxt->debug_msg, ".", tab->cell[i].Lang, "");

	mov	ecx, DWORD PTR _i$[ebp]
	shl	ecx, 6
	mov	edx, DWORD PTR _tab$[ebp]
	mov	eax, DWORD PTR [edx+16]
	cmp	DWORD PTR [eax+ecx+44], 0
	jbe	SHORT $L70559
	push	0
	push	OFFSET FLAT:$SG70560
	mov	ecx, DWORD PTR _i$[ebp]
	shl	ecx, 6
	mov	edx, DWORD PTR _tab$[ebp]
	mov	eax, DWORD PTR [edx+16]
	mov	ecx, DWORD PTR [eax+ecx+44]
	push	ecx
	push	1
	push	OFFSET FLAT:$SG70561
	mov	edx, DWORD PTR _cntxt$[ebp]
	add	edx, 29864				; 000074a8H
	push	edx
	call	_dynbuf_add3_int
	add	esp, 24					; 00000018H
	test	eax, eax
	je	SHORT $L70559
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29872], OFFSET FLAT:$SG70563
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 297		; 00000129H
	jmp	$eva_err$70518
$L70559:

; 298  : 		DYNBUF_ADD3_CELL(&cntxt->debug_msg, "=", tab, i, 0, NO_CONV, "\n");

	push	1
	push	OFFSET FLAT:$SG70566
	push	0
	push	0
	push	0
	mov	edx, DWORD PTR _i$[ebp]
	push	edx
	mov	eax, DWORD PTR _tab$[ebp]
	push	eax
	call	_dyntab_sz
	add	esp, 12					; 0000000cH
	push	eax
	push	0
	mov	ecx, DWORD PTR _i$[ebp]
	push	ecx
	mov	edx, DWORD PTR _tab$[ebp]
	push	edx
	call	_dyntab_val
	add	esp, 12					; 0000000cH
	push	eax
	push	1
	push	OFFSET FLAT:$SG70567
	mov	eax, DWORD PTR _cntxt$[ebp]
	add	eax, 29864				; 000074a8H
	push	eax
	call	_dynbuf_add3
	add	esp, 36					; 00000024H
	test	eax, eax
	je	SHORT $L70565
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29872], OFFSET FLAT:$SG70569
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 298		; 0000012aH
	jmp	$eva_err$70518
$L70565:

; 299  : 		if(i> beg+50 && i < end-50 && end - beg > 200)

	mov	eax, DWORD PTR _beg$[ebp]
	add	eax, 50					; 00000032H
	cmp	DWORD PTR _i$[ebp], eax
	jbe	SHORT $L70570
	mov	ecx, DWORD PTR _end$[ebp]
	sub	ecx, 50					; 00000032H
	cmp	DWORD PTR _i$[ebp], ecx
	jae	SHORT $L70570
	mov	edx, DWORD PTR _end$[ebp]
	sub	edx, DWORD PTR _beg$[ebp]
	cmp	edx, 200				; 000000c8H
	jbe	SHORT $L70570

; 301  : 			DYNBUF_ADD_STR(&cntxt->debug_msg, "...\n");

	push	0
	push	0
	push	4
	push	OFFSET FLAT:$SG70573
	mov	eax, DWORD PTR _cntxt$[ebp]
	add	eax, 29864				; 000074a8H
	push	eax
	call	_dynbuf_add
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L70572
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29872], OFFSET FLAT:$SG70575
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 301		; 0000012dH
	jmp	SHORT $eva_err$70518
$L70572:

; 302  : 			i = end - 50;

	mov	eax, DWORD PTR _end$[ebp]
	sub	eax, 50					; 00000032H
	mov	DWORD PTR _i$[ebp], eax
$L70570:

; 304  : 	}

	jmp	$L70520
$eva_noerr$70510:

; 305  : 
; 306  : 	RETURN_OK_CLEANUP;

	push	0
	push	OFFSET FLAT:$SG70576
	push	OFFSET FLAT:$SG70577
	mov	ecx, DWORD PTR _cntxt$[ebp]
	push	ecx
	call	_err_clear
	add	esp, 16					; 00000010H
$eva_err$70518:
	mov	edx, DWORD PTR _cntxt$[ebp]
	cmp	DWORD PTR [edx+29872], 0
	je	SHORT $L70578
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	ecx, DWORD PTR [eax+29900]
	push	ecx
	push	OFFSET FLAT:$SG70579
	push	OFFSET FLAT:$SG70580
	mov	edx, DWORD PTR _cntxt$[ebp]
	push	edx
	call	_err_add_context
	add	esp, 16					; 00000010H
$L70578:
	mov	eax, DWORD PTR _cntxt$[ebp]
	xor	ecx, ecx
	cmp	DWORD PTR [eax+29872], 0
	setne	cl
	mov	eax, ecx

; 307  : }

	mov	esp, ebp
	pop	ebp
	ret	0
_qry_debug_table ENDP
_TEXT	ENDS
EXTRN	_sql_id_values:NEAR
EXTRN	_sql_id_value:NEAR
EXTRN	_sql_no_quote:BYTE
EXTRN	_sql_no_like_ops:BYTE
EXTRN	_dyntab_from_list:NEAR
_DATA	SEGMENT
$SG70603 DB	'''''', 00H
	ORG $+1
$SG70605 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70610 DB	'0', 00H
	ORG $+2
$SG70612 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70619 DB	',', 00H
	ORG $+2
$SG70621 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70628 DB	',', 00H
	ORG $+2
$SG70636 DB	',', 00H
	ORG $+2
$SG70638 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70642 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70651 DB	',', 00H
	ORG $+2
$SG70653 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70656 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70661 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70666 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70669 DB	'''', 00H
	ORG $+2
$SG70670 DB	'''', 00H
	ORG $+2
$SG70672 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70675 DB	'''', 00H
	ORG $+2
$SG70676 DB	'''', 00H
	ORG $+2
$SG70678 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70683 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70684 DB	'D:\Travail\ABI\EVA\V4.0\CGI\Brunix-2016\qry_utils.c', 00H
$SG70685 DB	'qry_values_list', 00H
$SG70687 DB	'D:\Travail\ABI\EVA\V4.0\CGI\Brunix-2016\qry_utils.c', 00H
$SG70688 DB	'qry_values_list', 00H
_DATA	ENDS
_TEXT	SEGMENT
_cntxt$ = 8
_tab$ = 12
_mode$ = 16
_ret$ = 20
_i$ = -24
_j$ = -28
_id$ = -32
_sqlres$ = -20
_qry_values_list PROC NEAR

; 329  : ){

	push	ebp
	mov	ebp, esp
	sub	esp, 40					; 00000028H

; 330  : 	unsigned long i, j, id;
; 331  : 	DynTable sqlres = { 0 };

	mov	DWORD PTR _sqlres$[ebp], 0
	xor	eax, eax
	mov	DWORD PTR _sqlres$[ebp+4], eax
	mov	DWORD PTR _sqlres$[ebp+8], eax
	mov	DWORD PTR _sqlres$[ebp+12], eax
	mov	DWORD PTR _sqlres$[ebp+16], eax

; 332  : 
; 333  : 	if(!tab) RETURN_OK;

	cmp	DWORD PTR _tab$[ebp], 0
	jne	SHORT $L70597
	jmp	$eva_noerr$70598
$L70597:

; 334  : 	if(!tab->nbrows)

	mov	ecx, DWORD PTR _tab$[ebp]
	cmp	DWORD PTR [ecx], 0
	jne	$L70599

; 336  : 		if(mode >= 5) DYNBUF_ADD_STR(ret, "''")

	cmp	DWORD PTR _mode$[ebp], 5
	jl	SHORT $L70600
	push	0
	push	0
	push	2
	push	OFFSET FLAT:$SG70603
	mov	edx, DWORD PTR _ret$[ebp]
	push	edx
	call	_dynbuf_add
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L70602
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29872], OFFSET FLAT:$SG70605
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 336		; 00000150H
	jmp	$eva_err$70606
$L70602:

; 337  : 		else DYNBUF_ADD_STR(ret, "0");

	jmp	SHORT $L70609
$L70600:
	push	0
	push	0
	push	1
	push	OFFSET FLAT:$SG70610
	mov	edx, DWORD PTR _ret$[ebp]
	push	edx
	call	_dynbuf_add
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L70609
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29872], OFFSET FLAT:$SG70612
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 337		; 00000151H
	jmp	$eva_err$70606
$L70609:

; 338  : 		RETURN_OK;

	jmp	$eva_noerr$70598
$L70599:

; 340  : 
; 341  : 	for(i = 0; i < tab->nbrows; i++)

	mov	DWORD PTR _i$[ebp], 0
	jmp	SHORT $L70613
$L70614:
	mov	edx, DWORD PTR _i$[ebp]
	add	edx, 1
	mov	DWORD PTR _i$[ebp], edx
$L70613:
	mov	eax, DWORD PTR _tab$[ebp]
	mov	ecx, DWORD PTR _i$[ebp]
	cmp	ecx, DWORD PTR [eax]
	jae	$eva_noerr$70598

; 343  : 		/* Add value separator if needed */
; 344  : 		if(i) DYNBUF_ADD_STR(ret, ",");

	cmp	DWORD PTR _i$[ebp], 0
	je	SHORT $L70618
	push	0
	push	0
	push	1
	push	OFFSET FLAT:$SG70619
	mov	edx, DWORD PTR _ret$[ebp]
	push	edx
	call	_dynbuf_add
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L70618
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29872], OFFSET FLAT:$SG70621
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 344		; 00000158H
	jmp	$eva_err$70606
$L70618:

; 345  : 
; 346  : 		/* Process depending on mode */
; 347  : 		switch(mode)
; 348  : 		{

	mov	edx, DWORD PTR _mode$[ebp]
	mov	DWORD PTR -36+[ebp], edx
	cmp	DWORD PTR -36+[ebp], 7
	ja	$L70623
	mov	eax, DWORD PTR -36+[ebp]
	jmp	DWORD PTR $L72062[eax*4]
$L70626:

; 349  : 		case 0:	/* List of Ids : Add id to buffer */
; 350  : 			if(dyntab_from_list(&sqlres, DYNTAB_VAL_SZ(tab, i, 0), ",", 0, 2)) STACK_ERROR;

	push	2
	push	0
	push	OFFSET FLAT:$SG70628
	push	0
	mov	ecx, DWORD PTR _i$[ebp]
	push	ecx
	mov	edx, DWORD PTR _tab$[ebp]
	push	edx
	call	_dyntab_sz
	add	esp, 12					; 0000000cH
	push	eax
	push	0
	mov	eax, DWORD PTR _i$[ebp]
	push	eax
	mov	ecx, DWORD PTR _tab$[ebp]
	push	ecx
	call	_dyntab_val
	add	esp, 12					; 0000000cH
	push	eax
	lea	edx, DWORD PTR _sqlres$[ebp]
	push	edx
	call	_dyntab_from_list
	add	esp, 24					; 00000018H
	test	eax, eax
	je	SHORT $L70627
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 350		; 0000015eH
	jmp	$eva_err$70606
$L70627:

; 351  : 			for(j = 0; !j || j < sqlres.nbrows; j++)

	mov	DWORD PTR _j$[ebp], 0
	jmp	SHORT $L70629
$L70630:
	mov	ecx, DWORD PTR _j$[ebp]
	add	ecx, 1
	mov	DWORD PTR _j$[ebp], ecx
$L70629:
	cmp	DWORD PTR _j$[ebp], 0
	je	SHORT $L70632
	mov	edx, DWORD PTR _j$[ebp]
	cmp	edx, DWORD PTR _sqlres$[ebp]
	jae	$L70631
$L70632:

; 353  : 				if(j) DYNBUF_ADD_STR(ret, ",");

	cmp	DWORD PTR _j$[ebp], 0
	je	SHORT $L70635
	push	0
	push	0
	push	1
	push	OFFSET FLAT:$SG70636
	mov	eax, DWORD PTR _ret$[ebp]
	push	eax
	call	_dynbuf_add
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L70635
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29872], OFFSET FLAT:$SG70638
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 353		; 00000161H
	jmp	$eva_err$70606
$L70635:

; 354  : 				DYNBUF_ADD_INT(ret, DYNTAB_TOULRC(&sqlres, j, 0));

	push	10					; 0000000aH
	push	0
	push	0
	mov	eax, DWORD PTR _j$[ebp]
	push	eax
	lea	ecx, DWORD PTR _sqlres$[ebp]
	push	ecx
	call	_dyntab_val
	add	esp, 12					; 0000000cH
	push	eax
	call	_strtoul
	add	esp, 12					; 0000000cH
	push	eax
	mov	edx, DWORD PTR _ret$[ebp]
	push	edx
	call	_dynbuf_add_int
	add	esp, 8
	test	eax, eax
	je	SHORT $L70640
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29872], OFFSET FLAT:$SG70642
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 354		; 00000162H
	jmp	$eva_err$70606
$L70640:

; 355  : 			}

	jmp	$L70630
$L70631:

; 356  : 			break;

	jmp	$L70623
$L70643:

; 357  : 
; 358  : 		case 1:	/* List of like / contain values Ids - find id in TVal & add to buffer */
; 359  : 		case 4:
; 360  : 			if(sql_id_values(cntxt, &sqlres, DYNTAB_VAL_SZ(tab, i, 0), mode == 1 ? Like : Contain, 0)) STACK_ERROR;

	push	0
	mov	edx, DWORD PTR _mode$[ebp]
	sub	edx, 1
	neg	edx
	sbb	edx, edx
	and	edx, 2
	add	edx, 9
	push	edx
	push	0
	mov	eax, DWORD PTR _i$[ebp]
	push	eax
	mov	ecx, DWORD PTR _tab$[ebp]
	push	ecx
	call	_dyntab_sz
	add	esp, 12					; 0000000cH
	push	eax
	push	0
	mov	edx, DWORD PTR _i$[ebp]
	push	edx
	mov	eax, DWORD PTR _tab$[ebp]
	push	eax
	call	_dyntab_val
	add	esp, 12					; 0000000cH
	push	eax
	lea	ecx, DWORD PTR _sqlres$[ebp]
	push	ecx
	mov	edx, DWORD PTR _cntxt$[ebp]
	push	edx
	call	_sql_id_values
	add	esp, 24					; 00000018H
	test	eax, eax
	je	SHORT $L70644
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 360		; 00000168H
	jmp	$eva_err$70606
$L70644:

; 361  : 			for(j = 0; j < (sqlres.nbrows ? sqlres.nbrows : 1); j++)

	mov	DWORD PTR _j$[ebp], 0
	jmp	SHORT $L70645
$L70646:
	mov	ecx, DWORD PTR _j$[ebp]
	add	ecx, 1
	mov	DWORD PTR _j$[ebp], ecx
$L70645:
	cmp	DWORD PTR _sqlres$[ebp], 0
	je	SHORT $L72060
	mov	edx, DWORD PTR _sqlres$[ebp]
	mov	DWORD PTR -40+[ebp], edx
	jmp	SHORT $L72061
$L72060:
	mov	DWORD PTR -40+[ebp], 1
$L72061:
	mov	eax, DWORD PTR _j$[ebp]
	cmp	eax, DWORD PTR -40+[ebp]
	jae	$L70647

; 363  : 				if(j) DYNBUF_ADD_STR(ret, ",");

	cmp	DWORD PTR _j$[ebp], 0
	je	SHORT $L70650
	push	0
	push	0
	push	1
	push	OFFSET FLAT:$SG70651
	mov	ecx, DWORD PTR _ret$[ebp]
	push	ecx
	call	_dynbuf_add
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L70650
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29872], OFFSET FLAT:$SG70653
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 363		; 0000016bH
	jmp	$eva_err$70606
$L70650:

; 364  : 				DYNBUF_ADD_INT(ret, atoi(dyntab_val(&sqlres, j, 0)));

	push	0
	mov	ecx, DWORD PTR _j$[ebp]
	push	ecx
	lea	edx, DWORD PTR _sqlres$[ebp]
	push	edx
	call	_dyntab_val
	add	esp, 12					; 0000000cH
	push	eax
	call	_atoi
	add	esp, 4
	push	eax
	mov	eax, DWORD PTR _ret$[ebp]
	push	eax
	call	_dynbuf_add_int
	add	esp, 8
	test	eax, eax
	je	SHORT $L70654
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29872], OFFSET FLAT:$SG70656
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 364		; 0000016cH
	jmp	$eva_err$70606
$L70654:

; 365  : 			}

	jmp	$L70646
$L70647:

; 366  : 			break;

	jmp	$L70623
$L70657:

; 367  : 
; 368  : 		case 2:	/* List of value Ids - find id in TVal & add to buffer */
; 369  : 			if(sql_id_value(cntxt, DYNTAB_VAL_SZ(tab, i, 0), &id)) STACK_ERROR;

	lea	eax, DWORD PTR _id$[ebp]
	push	eax
	push	0
	mov	ecx, DWORD PTR _i$[ebp]
	push	ecx
	mov	edx, DWORD PTR _tab$[ebp]
	push	edx
	call	_dyntab_sz
	add	esp, 12					; 0000000cH
	push	eax
	push	0
	mov	eax, DWORD PTR _i$[ebp]
	push	eax
	mov	ecx, DWORD PTR _tab$[ebp]
	push	ecx
	call	_dyntab_val
	add	esp, 12					; 0000000cH
	push	eax
	mov	edx, DWORD PTR _cntxt$[ebp]
	push	edx
	call	_sql_id_value
	add	esp, 16					; 00000010H
	test	eax, eax
	je	SHORT $L70658
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 369		; 00000171H
	jmp	$eva_err$70606
$L70658:

; 370  : 			DYNBUF_ADD_INT(ret, id);

	mov	ecx, DWORD PTR _id$[ebp]
	push	ecx
	mov	edx, DWORD PTR _ret$[ebp]
	push	edx
	call	_dynbuf_add_int
	add	esp, 8
	test	eax, eax
	je	SHORT $L70659
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29872], OFFSET FLAT:$SG70661
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 370		; 00000172H
	jmp	$eva_err$70606
$L70659:

; 371  : 			break;

	jmp	$L70623
$L70662:

; 372  : 
; 373  : 		case 3:	/* List of value Ids - find id in cell data & add to buffer */
; 374  : 			id = tab->cell[DYNTAB_INDEX(tab, i, 0)].IdValue;

	mov	edx, DWORD PTR _tab$[ebp]
	mov	eax, DWORD PTR _i$[ebp]
	imul	eax, DWORD PTR [edx+12]
	shl	eax, 6
	mov	ecx, DWORD PTR _tab$[ebp]
	mov	edx, DWORD PTR [ecx+16]
	mov	eax, DWORD PTR [edx+eax+32]
	mov	DWORD PTR _id$[ebp], eax

; 375  : 			if(!id && sql_id_value(cntxt, DYNTAB_VAL_SZ(tab, i, 0), &id)) STACK_ERROR;

	cmp	DWORD PTR _id$[ebp], 0
	jne	SHORT $L70663
	lea	ecx, DWORD PTR _id$[ebp]
	push	ecx
	push	0
	mov	edx, DWORD PTR _i$[ebp]
	push	edx
	mov	eax, DWORD PTR _tab$[ebp]
	push	eax
	call	_dyntab_sz
	add	esp, 12					; 0000000cH
	push	eax
	push	0
	mov	ecx, DWORD PTR _i$[ebp]
	push	ecx
	mov	edx, DWORD PTR _tab$[ebp]
	push	edx
	call	_dyntab_val
	add	esp, 12					; 0000000cH
	push	eax
	mov	eax, DWORD PTR _cntxt$[ebp]
	push	eax
	call	_sql_id_value
	add	esp, 16					; 00000010H
	test	eax, eax
	je	SHORT $L70663
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 375		; 00000177H
	jmp	$eva_err$70606
$L70663:

; 376  : 			DYNBUF_ADD_INT(ret, id);

	mov	edx, DWORD PTR _id$[ebp]
	push	edx
	mov	eax, DWORD PTR _ret$[ebp]
	push	eax
	call	_dynbuf_add_int
	add	esp, 8
	test	eax, eax
	je	SHORT $L70664
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29872], OFFSET FLAT:$SG70666
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 376		; 00000178H
	jmp	$eva_err$70606
$L70664:

; 377  : 			break;

	jmp	$L70623
$L70667:

; 378  : 
; 379  : 		case 5:
; 380  : 			DYNBUF_ADD3_CELL(ret, "'", tab, i, 0, SQL_NO_QUOTE, "'");

	push	1
	push	OFFSET FLAT:$SG70669
	push	1
	push	OFFSET FLAT:_sql_no_quote
	push	0
	mov	eax, DWORD PTR _i$[ebp]
	push	eax
	mov	ecx, DWORD PTR _tab$[ebp]
	push	ecx
	call	_dyntab_sz
	add	esp, 12					; 0000000cH
	push	eax
	push	0
	mov	edx, DWORD PTR _i$[ebp]
	push	edx
	mov	eax, DWORD PTR _tab$[ebp]
	push	eax
	call	_dyntab_val
	add	esp, 12					; 0000000cH
	push	eax
	push	1
	push	OFFSET FLAT:$SG70670
	mov	ecx, DWORD PTR _ret$[ebp]
	push	ecx
	call	_dynbuf_add3
	add	esp, 36					; 00000024H
	test	eax, eax
	je	SHORT $L70668
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29872], OFFSET FLAT:$SG70672
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 380		; 0000017cH
	jmp	$eva_err$70606
$L70668:

; 381  : 			break;

	jmp	$L70623
$L70673:

; 382  : 
; 383  : 		case 6:
; 384  : 			DYNBUF_ADD3_CELL(ret, "'", tab, i, 0, SQL_NO_LIKE_OPS, "'");

	push	1
	push	OFFSET FLAT:$SG70675
	push	1
	push	OFFSET FLAT:_sql_no_like_ops
	push	0
	mov	ecx, DWORD PTR _i$[ebp]
	push	ecx
	mov	edx, DWORD PTR _tab$[ebp]
	push	edx
	call	_dyntab_sz
	add	esp, 12					; 0000000cH
	push	eax
	push	0
	mov	eax, DWORD PTR _i$[ebp]
	push	eax
	mov	ecx, DWORD PTR _tab$[ebp]
	push	ecx
	call	_dyntab_val
	add	esp, 12					; 0000000cH
	push	eax
	push	1
	push	OFFSET FLAT:$SG70676
	mov	edx, DWORD PTR _ret$[ebp]
	push	edx
	call	_dynbuf_add3
	add	esp, 36					; 00000024H
	test	eax, eax
	je	SHORT $L70674
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29872], OFFSET FLAT:$SG70678
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 384		; 00000180H
	jmp	SHORT $eva_err$70606
$L70674:

; 385  : 			break;

	jmp	SHORT $L70623
$L70679:

; 386  : 
; 387  : 		case 7:
; 388  : 			DYNBUF_ADD_CELL(ret, tab, i, 0, NO_CONV);

	push	0
	push	0
	push	0
	mov	edx, DWORD PTR _i$[ebp]
	push	edx
	mov	eax, DWORD PTR _tab$[ebp]
	push	eax
	call	_dyntab_sz
	add	esp, 12					; 0000000cH
	push	eax
	push	0
	mov	ecx, DWORD PTR _i$[ebp]
	push	ecx
	mov	edx, DWORD PTR _tab$[ebp]
	push	edx
	call	_dyntab_val
	add	esp, 12					; 0000000cH
	push	eax
	mov	eax, DWORD PTR _ret$[ebp]
	push	eax
	call	_dynbuf_add
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L70681
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29872], OFFSET FLAT:$SG70683
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 388		; 00000184H
	jmp	SHORT $eva_err$70606
$L70681:
$L70623:

; 391  : 	}

	jmp	$L70614
$eva_noerr$70598:

; 392  : 
; 393  : 	RETURN_OK_CLEANUP;

	push	0
	push	OFFSET FLAT:$SG70684
	push	OFFSET FLAT:$SG70685
	mov	eax, DWORD PTR _cntxt$[ebp]
	push	eax
	call	_err_clear
	add	esp, 16					; 00000010H
$eva_err$70606:
	mov	ecx, DWORD PTR _cntxt$[ebp]
	cmp	DWORD PTR [ecx+29872], 0
	je	SHORT $L70686
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	eax, DWORD PTR [edx+29900]
	push	eax
	push	OFFSET FLAT:$SG70687
	push	OFFSET FLAT:$SG70688
	mov	ecx, DWORD PTR _cntxt$[ebp]
	push	ecx
	call	_err_add_context
	add	esp, 16					; 00000010H
$L70686:
	lea	edx, DWORD PTR _sqlres$[ebp]
	push	edx
	call	_dyntab_free
	add	esp, 4
	mov	eax, DWORD PTR _cntxt$[ebp]
	xor	ecx, ecx
	cmp	DWORD PTR [eax+29872], 0
	setne	cl
	mov	eax, ecx

; 394  : }

	mov	esp, ebp
	pop	ebp
	ret	0
$L72062:
	DD	$L70626
	DD	$L70643
	DD	$L70657
	DD	$L70662
	DD	$L70643
	DD	$L70667
	DD	$L70673
	DD	$L70679
_qry_values_list ENDP
_TEXT	ENDS
PUBLIC	_qry_field_value
_DATA	SEGMENT
$SG70716 DB	'-- qry_field_value : read IdObj ', 0aH, 'SELECT DISTINCT'
	DB	'ROW TLink.IdObj AS IdObj ', 0aH, 'FROM TLink ', 0aH, 00H
	ORG $+1
$SG70718 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70722 DB	'INNER JOIN TLink AS TLink_1 ON TLink.IdObj = TLink_1.IdO'
	DB	'bj ', 0aH, 00H
	ORG $+3
$SG70724 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70727 DB	'WHERE TLink.DateDel IS NULL ', 0aH, 00H
	ORG $+2
$SG70729 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70738 DB	' ) ', 0aH, 00H
	ORG $+3
$SG70739 DB	'AND TLink.IdRelObj IN ( ', 00H
	ORG $+3
$SG70741 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70745 DB	') ', 0aH, 00H
$SG70746 DB	'AND TLink.IdValue NOT IN (', 00H
	ORG $+1
$SG70748 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70752 DB	') ', 0aH, 00H
$SG70753 DB	'AND TLink.IdValue IN (', 00H
	ORG $+1
$SG70755 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70759 DB	') ', 0aH, 00H
$SG70760 DB	'AND TLink.IdField IN (', 00H
	ORG $+1
$SG70762 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70766 DB	') ', 0aH, 00H
$SG70767 DB	'AND TLink_1.IdField=1 AND TLink_1.IdRelObj IN (', 00H
$SG70769 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70772 DB	'GROUP BY TLink.IdObj ORDER BY TLink.DateCr DESC', 00H
$SG70774 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70778 DB	'D:\Travail\ABI\EVA\V4.0\CGI\Brunix-2016\qry_utils.c', 00H
$SG70779 DB	'qry_field_value', 00H
$SG70781 DB	'D:\Travail\ABI\EVA\V4.0\CGI\Brunix-2016\qry_utils.c', 00H
$SG70782 DB	'qry_field_value', 00H
_DATA	ENDS
_TEXT	SEGMENT
_cntxt$ = 8
_res$ = 12
_srchfld$ = 16
_matchmode$ = 20
_srchval$ = 24
_srchform$ = 28
_sql$ = -4
_l_srchval$ = -8
_l_srchform$ = -12
_qry_field_value PROC NEAR

; 413  : ){

	push	ebp
	mov	ebp, esp
	sub	esp, 28					; 0000001cH

; 414  :  	DynBuffer *sql = NULL;

	mov	DWORD PTR _sql$[ebp], 0

; 415  : 	DynBuffer *l_srchval = NULL;

	mov	DWORD PTR _l_srchval$[ebp], 0

; 416  :  	DynBuffer *l_srchform = NULL;

	mov	DWORD PTR _l_srchform$[ebp], 0

; 417  : 
; 418  : 	/* Convert tables to lists for SQL IN () operator */
; 419  : 	if(qry_values_list(cntxt, srchval,
; 420  : 		(matchmode == Like || matchmode == NotLike) ? 1 :
; 421  : 		(matchmode == Exact || matchmode == Different) ? 2 :
; 422  : 		(matchmode == Contain || matchmode == NotContain) ? 4 :
; 423  : 		0, &l_srchval)) STACK_ERROR;

	cmp	DWORD PTR _matchmode$[ebp], 9
	je	SHORT $L72064
	cmp	DWORD PTR _matchmode$[ebp], 10		; 0000000aH
	je	SHORT $L72064
	cmp	DWORD PTR _matchmode$[ebp], 6
	je	SHORT $L72065
	cmp	DWORD PTR _matchmode$[ebp], 5
	je	SHORT $L72065
	cmp	DWORD PTR _matchmode$[ebp], 11		; 0000000bH
	je	SHORT $L72066
	cmp	DWORD PTR _matchmode$[ebp], 12		; 0000000cH
	je	SHORT $L72066
	mov	DWORD PTR -16+[ebp], 0
	jmp	SHORT $L72067
$L72066:
	mov	DWORD PTR -16+[ebp], 4
$L72067:
	mov	eax, DWORD PTR -16+[ebp]
	mov	DWORD PTR -20+[ebp], eax
	jmp	SHORT $L72068
$L72065:
	mov	DWORD PTR -20+[ebp], 2
$L72068:
	mov	ecx, DWORD PTR -20+[ebp]
	mov	DWORD PTR -24+[ebp], ecx
	jmp	SHORT $L72069
$L72064:
	mov	DWORD PTR -24+[ebp], 1
$L72069:
	lea	edx, DWORD PTR _l_srchval$[ebp]
	push	edx
	mov	eax, DWORD PTR -24+[ebp]
	push	eax
	mov	ecx, DWORD PTR _srchval$[ebp]
	push	ecx
	mov	edx, DWORD PTR _cntxt$[ebp]
	push	edx
	call	_qry_values_list
	add	esp, 16					; 00000010H
	test	eax, eax
	je	SHORT $L70711
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 423		; 000001a7H
	jmp	$eva_err$70712
$L70711:

; 424  :  	if(qry_values_list(cntxt, srchform, 0, &l_srchform)) STACK_ERROR;

	lea	ecx, DWORD PTR _l_srchform$[ebp]
	push	ecx
	push	0
	mov	edx, DWORD PTR _srchform$[ebp]
	push	edx
	mov	eax, DWORD PTR _cntxt$[ebp]
	push	eax
	call	_qry_values_list
	add	esp, 16					; 00000010H
	test	eax, eax
	je	SHORT $L70713
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 424		; 000001a8H
	jmp	$eva_err$70712
$L70713:

; 428  : 		"-- qry_field_value : read IdObj \n"
; 429  : 		"SELECT DISTINCTROW TLink.IdObj AS IdObj \n"
; 430  : 		"FROM TLink \n");

	push	0
	push	0
	push	86					; 00000056H
	push	OFFSET FLAT:$SG70716
	lea	edx, DWORD PTR _sql$[ebp]
	push	edx
	call	_dynbuf_add
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L70715
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29872], OFFSET FLAT:$SG70718
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 430		; 000001aeH
	jmp	$eva_err$70712
$L70715:

; 431  : 	if(srchform) DYNBUF_ADD_STR(&sql,

	cmp	DWORD PTR _srchform$[ebp], 0
	je	SHORT $L70721

; 432  : 		"INNER JOIN TLink AS TLink_1 ON TLink.IdObj = TLink_1.IdObj \n");

	push	0
	push	0
	push	60					; 0000003cH
	push	OFFSET FLAT:$SG70722
	lea	edx, DWORD PTR _sql$[ebp]
	push	edx
	call	_dynbuf_add
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L70721
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29872], OFFSET FLAT:$SG70724
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 432		; 000001b0H
	jmp	$eva_err$70712
$L70721:

; 433  : 
; 434  : 	/* Build WHERE statement */
; 435  : 	DYNBUF_ADD_STR(&sql, "WHERE TLink.DateDel IS NULL \n");

	push	0
	push	0
	push	29					; 0000001dH
	push	OFFSET FLAT:$SG70727
	lea	edx, DWORD PTR _sql$[ebp]
	push	edx
	call	_dynbuf_add
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L70726
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29872], OFFSET FLAT:$SG70729
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 435		; 000001b3H
	jmp	$eva_err$70712
$L70726:

; 436  : 	if(srchval)

	cmp	DWORD PTR _srchval$[ebp], 0
	je	$L70732

; 438  : 		switch(matchmode) {

	mov	edx, DWORD PTR _matchmode$[ebp]
	mov	DWORD PTR -28+[ebp], edx
	mov	eax, DWORD PTR -28+[ebp]
	sub	eax, 3
	mov	DWORD PTR -28+[ebp], eax
	cmp	DWORD PTR -28+[ebp], 9
	ja	$L70749
	mov	edx, DWORD PTR -28+[ebp]
	xor	ecx, ecx
	mov	cl, BYTE PTR $L72070[edx]
	jmp	DWORD PTR $L72071[ecx*4]
$L70735:

; 441  : 				"AND TLink.IdRelObj IN ( ", l_srchval->data, l_srchval->cnt, NO_CONV, " ) \n");

	push	4
	push	OFFSET FLAT:$SG70738
	push	0
	push	0
	mov	eax, DWORD PTR _l_srchval$[ebp]
	mov	ecx, DWORD PTR [eax+4]
	push	ecx
	mov	edx, DWORD PTR _l_srchval$[ebp]
	add	edx, 8
	push	edx
	push	24					; 00000018H
	push	OFFSET FLAT:$SG70739
	lea	eax, DWORD PTR _sql$[ebp]
	push	eax
	call	_dynbuf_add3
	add	esp, 36					; 00000024H
	test	eax, eax
	je	SHORT $L70737
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29872], OFFSET FLAT:$SG70741
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 441		; 000001b9H
	jmp	$eva_err$70712
$L70737:

; 442  : 			break;

	jmp	$L70732
$L70742:

; 443  : 		case NotContain:
; 444  : 		case NotLike:
; 445  : 		case Different:
; 446  : 			DYNBUF_ADD3(&sql, "AND TLink.IdValue NOT IN (", l_srchval->data, l_srchval->cnt, NO_CONV, ") \n");

	push	3
	push	OFFSET FLAT:$SG70745
	push	0
	push	0
	mov	eax, DWORD PTR _l_srchval$[ebp]
	mov	ecx, DWORD PTR [eax+4]
	push	ecx
	mov	edx, DWORD PTR _l_srchval$[ebp]
	add	edx, 8
	push	edx
	push	26					; 0000001aH
	push	OFFSET FLAT:$SG70746
	lea	eax, DWORD PTR _sql$[ebp]
	push	eax
	call	_dynbuf_add3
	add	esp, 36					; 00000024H
	test	eax, eax
	je	SHORT $L70744
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29872], OFFSET FLAT:$SG70748
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 446		; 000001beH
	jmp	$eva_err$70712
$L70744:

; 447  : 			break;

	jmp	SHORT $L70732
$L70749:

; 448  : 		default:
; 449  : 			DYNBUF_ADD3(&sql, "AND TLink.IdValue IN (", l_srchval->data, l_srchval->cnt, NO_CONV, ") \n");

	push	3
	push	OFFSET FLAT:$SG70752
	push	0
	push	0
	mov	eax, DWORD PTR _l_srchval$[ebp]
	mov	ecx, DWORD PTR [eax+4]
	push	ecx
	mov	edx, DWORD PTR _l_srchval$[ebp]
	add	edx, 8
	push	edx
	push	22					; 00000016H
	push	OFFSET FLAT:$SG70753
	lea	eax, DWORD PTR _sql$[ebp]
	push	eax
	call	_dynbuf_add3
	add	esp, 36					; 00000024H
	test	eax, eax
	je	SHORT $L70751
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29872], OFFSET FLAT:$SG70755
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 449		; 000001c1H
	jmp	$eva_err$70712
$L70751:
$L70732:

; 452  : 	if(srchfld) DYNBUF_ADD3(&sql,

	cmp	DWORD PTR _srchfld$[ebp], 0
	je	SHORT $L70758

; 453  : 		"AND TLink.IdField IN (", srchfld->data, srchfld->cnt, NO_CONV, ") \n");

	push	3
	push	OFFSET FLAT:$SG70759
	push	0
	push	0
	mov	eax, DWORD PTR _srchfld$[ebp]
	mov	ecx, DWORD PTR [eax+4]
	push	ecx
	mov	edx, DWORD PTR _srchfld$[ebp]
	add	edx, 8
	push	edx
	push	22					; 00000016H
	push	OFFSET FLAT:$SG70760
	lea	eax, DWORD PTR _sql$[ebp]
	push	eax
	call	_dynbuf_add3
	add	esp, 36					; 00000024H
	test	eax, eax
	je	SHORT $L70758
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29872], OFFSET FLAT:$SG70762
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 453		; 000001c5H
	jmp	$eva_err$70712
$L70758:

; 454  : 	if(srchform) DYNBUF_ADD3(&sql,

	cmp	DWORD PTR _srchform$[ebp], 0
	je	SHORT $L70765

; 455  : 		"AND TLink_1.IdField=1 AND TLink_1.IdRelObj IN (", l_srchform->data, l_srchform->cnt, NO_CONV, ") \n");

	push	3
	push	OFFSET FLAT:$SG70766
	push	0
	push	0
	mov	eax, DWORD PTR _l_srchform$[ebp]
	mov	ecx, DWORD PTR [eax+4]
	push	ecx
	mov	edx, DWORD PTR _l_srchform$[ebp]
	add	edx, 8
	push	edx
	push	47					; 0000002fH
	push	OFFSET FLAT:$SG70767
	lea	eax, DWORD PTR _sql$[ebp]
	push	eax
	call	_dynbuf_add3
	add	esp, 36					; 00000024H
	test	eax, eax
	je	SHORT $L70765
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29872], OFFSET FLAT:$SG70769
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 455		; 000001c7H
	jmp	$eva_err$70712
$L70765:

; 459  : 		"GROUP BY TLink.IdObj ORDER BY TLink.DateCr DESC")

	push	0
	push	0
	push	47					; 0000002fH
	push	OFFSET FLAT:$SG70772
	lea	eax, DWORD PTR _sql$[ebp]
	push	eax
	call	_dynbuf_add
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L70771
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29872], OFFSET FLAT:$SG70774
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 459		; 000001cbH
	jmp	SHORT $eva_err$70712
$L70771:

; 460  : 
; 461  : 	if(sql_exec_query(cntxt , sql->data) || sql_get_table(cntxt, res, 2)) STACK_ERROR;

	mov	eax, DWORD PTR _sql$[ebp]
	add	eax, 8
	push	eax
	mov	ecx, DWORD PTR _cntxt$[ebp]
	push	ecx
	call	_sql_exec_query
	add	esp, 8
	test	eax, eax
	jne	SHORT $L70776
	push	2
	mov	edx, DWORD PTR _res$[ebp]
	push	edx
	mov	eax, DWORD PTR _cntxt$[ebp]
	push	eax
	call	_sql_get_table
	add	esp, 12					; 0000000cH
	test	eax, eax
	je	SHORT $L70775
$L70776:
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 461		; 000001cdH
	jmp	SHORT $eva_err$70712
$L70775:

; 462  : 	M_FREE(sql);

	mov	edx, DWORD PTR _sql$[ebp]
	push	edx
	call	_mem_free
	add	esp, 4
	mov	DWORD PTR _sql$[ebp], 0
$eva_noerr$70777:

; 463  : 
; 464  : 	RETURN_OK_CLEANUP;

	push	0
	push	OFFSET FLAT:$SG70778
	push	OFFSET FLAT:$SG70779
	mov	eax, DWORD PTR _cntxt$[ebp]
	push	eax
	call	_err_clear
	add	esp, 16					; 00000010H
$eva_err$70712:
	mov	ecx, DWORD PTR _cntxt$[ebp]
	cmp	DWORD PTR [ecx+29872], 0
	je	SHORT $L70780
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	eax, DWORD PTR [edx+29900]
	push	eax
	push	OFFSET FLAT:$SG70781
	push	OFFSET FLAT:$SG70782
	mov	ecx, DWORD PTR _cntxt$[ebp]
	push	ecx
	call	_err_add_context
	add	esp, 16					; 00000010H
$L70780:
	mov	edx, DWORD PTR _sql$[ebp]
	push	edx
	call	_mem_free
	add	esp, 4
	mov	DWORD PTR _sql$[ebp], 0
	mov	eax, DWORD PTR _l_srchval$[ebp]
	push	eax
	call	_mem_free
	add	esp, 4
	mov	DWORD PTR _l_srchval$[ebp], 0
	mov	ecx, DWORD PTR _l_srchform$[ebp]
	push	ecx
	call	_mem_free
	add	esp, 4
	mov	DWORD PTR _l_srchform$[ebp], 0
	mov	edx, DWORD PTR _cntxt$[ebp]
	xor	eax, eax
	cmp	DWORD PTR [edx+29872], 0
	setne	al

; 465  : }

	mov	esp, ebp
	pop	ebp
	ret	0
$L72071:
	DD	$L70735
	DD	$L70742
	DD	$L70749
$L72070:
	DB	0
	DB	2
	DB	1
	DB	2
	DB	2
	DB	2
	DB	2
	DB	1
	DB	2
	DB	1
_qry_field_value ENDP
_TEXT	ENDS
_BSS	SEGMENT
	ALIGN	4

$SG70825 DB	01H DUP (?)
_BSS	ENDS
_DATA	SEGMENT
$SG70799 DB	' (IdObj INT, Num INT) TYPE=HEAP', 00H
$SG70800 DB	'CREATE TEMPORARY TABLE ', 00H
$SG70802 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70807 DB	' VALUES ', 00H
	ORG $+3
$SG70808 DB	'INSERT INTO ', 00H
	ORG $+3
$SG70810 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70821 DB	',', 00H
	ORG $+2
$SG70823 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70826 DB	'(', 00H
	ORG $+2
$SG70828 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70830 DB	')', 00H
	ORG $+2
$SG70831 DB	',', 00H
	ORG $+2
$SG70833 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70836 DB	'D:\Travail\ABI\EVA\V4.0\CGI\Brunix-2016\qry_utils.c', 00H
$SG70837 DB	'qry_make_idlist', 00H
$SG70839 DB	'D:\Travail\ABI\EVA\V4.0\CGI\Brunix-2016\qry_utils.c', 00H
$SG70840 DB	'qry_make_idlist', 00H
_DATA	ENDS
_TEXT	SEGMENT
_cntxt$ = 8
_id_list$ = 12
_table$ = 16
_sql$ = -8
_i$ = -12
_nb$ = -4
_idobj$70815 = -16
_qry_make_idlist PROC NEAR

; 479  : ){

	push	ebp
	mov	ebp, esp
	sub	esp, 16					; 00000010H

; 480  : 	DynBuffer *sql = NULL;

	mov	DWORD PTR _sql$[ebp], 0

; 481  : 	unsigned long i, nb = 0;

	mov	DWORD PTR _nb$[ebp], 0

; 482  : 
; 483  : 	/* Create table */
; 484  : 	DYNBUF_ADD3(&sql, "CREATE TEMPORARY TABLE ", table, 0, NO_CONV, " (IdObj INT, Num INT) TYPE=HEAP")

	push	31					; 0000001fH
	push	OFFSET FLAT:$SG70799
	push	0
	push	0
	push	0
	mov	eax, DWORD PTR _table$[ebp]
	push	eax
	push	23					; 00000017H
	push	OFFSET FLAT:$SG70800
	lea	ecx, DWORD PTR _sql$[ebp]
	push	ecx
	call	_dynbuf_add3
	add	esp, 36					; 00000024H
	test	eax, eax
	je	SHORT $L70798
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29872], OFFSET FLAT:$SG70802
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 484		; 000001e4H
	jmp	$eva_err$70803
$L70798:

; 485  : 	if(sql_exec_query(cntxt, sql->data)) STACK_ERROR;

	mov	ecx, DWORD PTR _sql$[ebp]
	add	ecx, 8
	push	ecx
	mov	edx, DWORD PTR _cntxt$[ebp]
	push	edx
	call	_sql_exec_query
	add	esp, 8
	test	eax, eax
	je	SHORT $L70804
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 485		; 000001e5H
	jmp	$eva_err$70803
$L70804:

; 486  : 	M_FREE(sql);

	mov	ecx, DWORD PTR _sql$[ebp]
	push	ecx
	call	_mem_free
	add	esp, 4
	mov	DWORD PTR _sql$[ebp], 0

; 487  : 
; 488  : 	/* Add objects Ids */
; 489  : 	DYNBUF_ADD3(&sql, "INSERT INTO ", table, 0, NO_CONV, " VALUES ");

	push	8
	push	OFFSET FLAT:$SG70807
	push	0
	push	0
	push	0
	mov	edx, DWORD PTR _table$[ebp]
	push	edx
	push	12					; 0000000cH
	push	OFFSET FLAT:$SG70808
	lea	eax, DWORD PTR _sql$[ebp]
	push	eax
	call	_dynbuf_add3
	add	esp, 36					; 00000024H
	test	eax, eax
	je	SHORT $L70806
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29872], OFFSET FLAT:$SG70810
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 489		; 000001e9H
	jmp	$eva_err$70803
$L70806:

; 490  : 	if(id_list) for(i = 0; i < id_list->nbrows; i++)

	cmp	DWORD PTR _id_list$[ebp], 0
	je	$L70814
	mov	DWORD PTR _i$[ebp], 0
	jmp	SHORT $L70812
$L70813:
	mov	eax, DWORD PTR _i$[ebp]
	add	eax, 1
	mov	DWORD PTR _i$[ebp], eax
$L70812:
	mov	ecx, DWORD PTR _id_list$[ebp]
	mov	edx, DWORD PTR _i$[ebp]
	cmp	edx, DWORD PTR [ecx]
	jae	$L70814

; 492  : 		/* Keep only numeric */
; 493  : 		unsigned long idobj = DYNTAB_TOULRC(id_list, i, 0);

	push	10					; 0000000aH
	push	0
	push	0
	mov	eax, DWORD PTR _i$[ebp]
	push	eax
	mov	ecx, DWORD PTR _id_list$[ebp]
	push	ecx
	call	_dyntab_val
	add	esp, 12					; 0000000cH
	push	eax
	call	_strtoul
	add	esp, 12					; 0000000cH
	mov	DWORD PTR _idobj$70815[ebp], eax

; 494  : 		if(idobj)

	cmp	DWORD PTR _idobj$70815[ebp], 0
	je	$L70817

; 496  : 			if(nb) DYNBUF_ADD_STR(&sql, ",");

	cmp	DWORD PTR _nb$[ebp], 0
	je	SHORT $L70820
	push	0
	push	0
	push	1
	push	OFFSET FLAT:$SG70821
	lea	edx, DWORD PTR _sql$[ebp]
	push	edx
	call	_dynbuf_add
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L70820
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29872], OFFSET FLAT:$SG70823
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 496		; 000001f0H
	jmp	$eva_err$70803
$L70820:

; 497  : 			DYNBUF_ADD3_INT(&sql, "(", idobj, "");

	push	0
	push	OFFSET FLAT:$SG70825
	mov	edx, DWORD PTR _idobj$70815[ebp]
	push	edx
	push	1
	push	OFFSET FLAT:$SG70826
	lea	eax, DWORD PTR _sql$[ebp]
	push	eax
	call	_dynbuf_add3_int
	add	esp, 24					; 00000018H
	test	eax, eax
	je	SHORT $L70824
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29872], OFFSET FLAT:$SG70828
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 497		; 000001f1H
	jmp	$eva_err$70803
$L70824:

; 498  : 			DYNBUF_ADD3_INT(&sql, ",", i, ")");

	push	1
	push	OFFSET FLAT:$SG70830
	mov	eax, DWORD PTR _i$[ebp]
	push	eax
	push	1
	push	OFFSET FLAT:$SG70831
	lea	ecx, DWORD PTR _sql$[ebp]
	push	ecx
	call	_dynbuf_add3_int
	add	esp, 24					; 00000018H
	test	eax, eax
	je	SHORT $L70829
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29872], OFFSET FLAT:$SG70833
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 498		; 000001f2H
	jmp	SHORT $eva_err$70803
$L70829:

; 499  : 			nb++;

	mov	ecx, DWORD PTR _nb$[ebp]
	add	ecx, 1
	mov	DWORD PTR _nb$[ebp], ecx
$L70817:

; 501  : 	}

	jmp	$L70813
$L70814:

; 502  : 	if(nb && sql_exec_query(cntxt, sql->data)) STACK_ERROR;

	cmp	DWORD PTR _nb$[ebp], 0
	je	SHORT $eva_noerr$70835
	mov	edx, DWORD PTR _sql$[ebp]
	add	edx, 8
	push	edx
	mov	eax, DWORD PTR _cntxt$[ebp]
	push	eax
	call	_sql_exec_query
	add	esp, 8
	test	eax, eax
	je	SHORT $eva_noerr$70835
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 502		; 000001f6H
	jmp	SHORT $eva_err$70803
$eva_noerr$70835:

; 503  : 
; 504  : 	RETURN_OK_CLEANUP;

	push	0
	push	OFFSET FLAT:$SG70836
	push	OFFSET FLAT:$SG70837
	mov	edx, DWORD PTR _cntxt$[ebp]
	push	edx
	call	_err_clear
	add	esp, 16					; 00000010H
$eva_err$70803:
	mov	eax, DWORD PTR _cntxt$[ebp]
	cmp	DWORD PTR [eax+29872], 0
	je	SHORT $L70838
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	edx, DWORD PTR [ecx+29900]
	push	edx
	push	OFFSET FLAT:$SG70839
	push	OFFSET FLAT:$SG70840
	mov	eax, DWORD PTR _cntxt$[ebp]
	push	eax
	call	_err_add_context
	add	esp, 16					; 00000010H
$L70838:
	mov	ecx, DWORD PTR _sql$[ebp]
	push	ecx
	call	_mem_free
	add	esp, 4
	mov	DWORD PTR _sql$[ebp], 0
	mov	edx, DWORD PTR _cntxt$[ebp]
	xor	eax, eax
	cmp	DWORD PTR [edx+29872], 0
	setne	al

; 505  : }

	mov	esp, ebp
	pop	ebp
	ret	0
_qry_make_idlist ENDP
_TEXT	ENDS
PUBLIC	_qry_get_obj_data
EXTRN	_sql_free_result:NEAR
EXTRN	_sql_free_row:NEAR
EXTRN	_sql_result_next_row:NEAR
EXTRN	_mem_alloc:NEAR
EXTRN	_dyntab_set:NEAR
EXTRN	_memcpy:NEAR
EXTRN	_memset:NEAR
_DATA	SEGMENT
$SG70859 DB	'-- qry_get_obj_data : read data', 0aH, 'SELECT DISTINCT '
	DB	'TLink.IdObj,TField.TxtValue,', 0aH, 'IF(TVal.TxtValue IS NULL'
	DB	',TLink.IdRelObj,TVal.TxtValue),', 0aH, 'TLink.IdRelObj,TLink.'
	DB	'Num,TLink.Line,TLink.Lang,TLink.IdField,TLink.IdValue,TLink.P'
	DB	'key ', 0aH, 'FROM TLink ', 0aH, 'INNER JOIN TVal as TField ON'
	DB	' TLink.IdField=TField.IdValue ', 0aH, 'LEFT JOIN TVal ON TLin'
	DB	'k.IdValue=TVal.IdValue ', 0aH, 00H
	ORG $+2
$SG70861 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70866 DB	' ', 00H
	ORG $+2
$SG70867 DB	'WHERE ', 00H
	ORG $+1
$SG70869 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70872 DB	'ORDER BY TLink.IdObj,TField.TxtValue,TLink.Num,TLink.Lin'
	DB	'e,TLink.Lang,TLink.Pkey ', 0aH, 00H
	ORG $+2
$SG70874 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70888 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70896 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70914 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70917 DB	'D:\Travail\ABI\EVA\V4.0\CGI\Brunix-2016\qry_utils.c', 00H
$SG70918 DB	'qry_get_obj_data', 00H
	ORG $+3
$SG70920 DB	'D:\Travail\ABI\EVA\V4.0\CGI\Brunix-2016\qry_utils.c', 00H
$SG70921 DB	'qry_get_obj_data', 00H
_DATA	ENDS
_TEXT	SEGMENT
_cntxt$ = 8
_res$ = 12
_where$ = 16
_row$ = -20
_irow$ = -24
_sql$ = -4
_cell$ = -92
_sqltrace$ = -28
_size$70882 = -96
_src$70884 = -100
_size1$70885 = -104
_size$70891 = -108
_src$70892 = -112
_size1$70893 = -116
_qry_get_obj_data PROC NEAR

; 520  : ){

	push	ebp
	mov	ebp, esp
	sub	esp, 116				; 00000074H

; 521  : 	EVA_sql_row row = {0};

	mov	DWORD PTR _row$[ebp], 0
	xor	eax, eax
	mov	DWORD PTR _row$[ebp+4], eax
	mov	DWORD PTR _row$[ebp+8], eax
	mov	DWORD PTR _row$[ebp+12], eax

; 522  : 	unsigned long irow = 0;

	mov	DWORD PTR _irow$[ebp], 0

; 523  :  	DynBuffer *sql = NULL;

	mov	DWORD PTR _sql$[ebp], 0

; 524  : 	DynTableCell cell;
; 525  : 	int sqltrace = cntxt->sql_trace;

	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	edx, DWORD PTR [ecx+29852]
	mov	DWORD PTR _sqltrace$[ebp], edx

; 526  : 
; 527  : 	/* Cleanup result table */
; 528  : 	dyntab_free(res);

	mov	eax, DWORD PTR _res$[ebp]
	push	eax
	call	_dyntab_free
	add	esp, 4

; 532  : 		"-- qry_get_obj_data : read data\n"
; 533  : 		"SELECT DISTINCT TLink.IdObj,TField.TxtValue,\n" \
; 534  : 			"IF(TVal.TxtValue IS NULL,TLink.IdRelObj,TVal.TxtValue),\n" \
; 535  : 			"TLink.IdRelObj,TLink.Num,TLink.Line,TLink.Lang,TLink.IdField,TLink.IdValue,TLink.Pkey \n"
; 536  : 		"FROM TLink \n"
; 537  : 		"INNER JOIN TVal as TField ON TLink.IdField=TField.IdValue \n"
; 538  : 		"LEFT JOIN TVal ON TLink.IdValue=TVal.IdValue \n");

	push	0
	push	0
	push	337					; 00000151H
	push	OFFSET FLAT:$SG70859
	lea	ecx, DWORD PTR _sql$[ebp]
	push	ecx
	call	_dynbuf_add
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L70858
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29872], OFFSET FLAT:$SG70861
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 538		; 0000021aH
	jmp	$eva_err$70862
$L70858:

; 539  : 	if(where) DYNBUF_ADD3(&sql, "WHERE ", where, 0, NO_CONV, " ");

	cmp	DWORD PTR _where$[ebp], 0
	je	SHORT $L70865
	push	1
	push	OFFSET FLAT:$SG70866
	push	0
	push	0
	push	0
	mov	ecx, DWORD PTR _where$[ebp]
	push	ecx
	push	6
	push	OFFSET FLAT:$SG70867
	lea	edx, DWORD PTR _sql$[ebp]
	push	edx
	call	_dynbuf_add3
	add	esp, 36					; 00000024H
	test	eax, eax
	je	SHORT $L70865
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29872], OFFSET FLAT:$SG70869
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 539		; 0000021bH
	jmp	$eva_err$70862
$L70865:

; 540  : 	DYNBUF_ADD_STR(&sql, "ORDER BY TLink.IdObj,TField.TxtValue,TLink.Num,TLink.Line,TLink.Lang,TLink.Pkey \n");

	push	0
	push	0
	push	81					; 00000051H
	push	OFFSET FLAT:$SG70872
	lea	edx, DWORD PTR _sql$[ebp]
	push	edx
	call	_dynbuf_add
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L70871
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29872], OFFSET FLAT:$SG70874
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 540		; 0000021cH
	jmp	$eva_err$70862
$L70871:

; 541  : 
; 542  : 	/* Exec Query */
; 543  : 	cntxt->sql_trace = 0;

	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29852], 0

; 544  : 	if(sql_exec_query(cntxt, sql->data)) STACK_ERROR;

	mov	eax, DWORD PTR _sql$[ebp]
	add	eax, 8
	push	eax
	mov	ecx, DWORD PTR _cntxt$[ebp]
	push	ecx
	call	_sql_exec_query
	add	esp, 8
	test	eax, eax
	je	SHORT $L70875
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 544		; 00000220H
	jmp	$eva_err$70862
$L70875:

; 545  : 	cntxt->sql_trace = sqltrace;

	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	ecx, DWORD PTR _sqltrace$[ebp]
	mov	DWORD PTR [eax+29852], ecx

; 546  : 
; 547  : 	/* Add result rows to table */
; 548  : 	if(sql_result_next_row(cntxt, &row)) STACK_ERROR;

	lea	edx, DWORD PTR _row$[ebp]
	push	edx
	mov	eax, DWORD PTR _cntxt$[ebp]
	push	eax
	call	_sql_result_next_row
	add	esp, 8
	test	eax, eax
	je	SHORT $L70876
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 548		; 00000224H
	jmp	$eva_err$70862
$L70876:

; 549  : 	while(row.value)

	cmp	DWORD PTR _row$[ebp+8], 0
	je	$L70879

; 551  : 		memset(&cell, 0, sizeof(cell));

	push	64					; 00000040H
	push	0
	lea	edx, DWORD PTR _cell$[ebp]
	push	edx
	call	_memset
	add	esp, 12					; 0000000cH

; 552  : 		if(row.sz[0]) cell.IdObj = strtoul(row.value[0], NULL, 10);

	mov	eax, DWORD PTR _row$[ebp+12]
	cmp	DWORD PTR [eax], 0
	je	SHORT $L70880
	push	10					; 0000000aH
	push	0
	mov	ecx, DWORD PTR _row$[ebp+8]
	mov	edx, DWORD PTR [ecx]
	push	edx
	call	_strtoul
	add	esp, 12					; 0000000cH
	mov	DWORD PTR _cell$[ebp+20], eax
$L70880:

; 553  : 		M_STRDUP(cell.field, row.value[1], (size_t)row.sz[1]);

	mov	eax, DWORD PTR _row$[ebp+12]
	mov	ecx, DWORD PTR [eax+4]
	mov	DWORD PTR _size$70882[ebp], ecx
	mov	edx, DWORD PTR _row$[ebp+8]
	mov	eax, DWORD PTR [edx+4]
	mov	DWORD PTR _src$70884[ebp], eax
	mov	ecx, DWORD PTR _size$70882[ebp]
	add	ecx, 1
	mov	DWORD PTR _size1$70885[ebp], ecx
	mov	edx, DWORD PTR _size1$70885[ebp]
	push	edx
	call	_mem_alloc
	add	esp, 4
	mov	DWORD PTR _cell$[ebp+8], eax
	cmp	DWORD PTR _size1$70885[ebp], 0
	je	SHORT $L70886
	cmp	DWORD PTR _cell$[ebp+8], 0
	jne	SHORT $L70886
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29872], OFFSET FLAT:$SG70888
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 553		; 00000229H
	jmp	$eva_err$70862
$L70886:
	cmp	DWORD PTR _src$70884[ebp], 0
	je	SHORT $L70890
	cmp	DWORD PTR _size$70882[ebp], 0
	je	SHORT $L70890
	mov	edx, DWORD PTR _size$70882[ebp]
	push	edx
	mov	eax, DWORD PTR _src$70884[ebp]
	push	eax
	mov	ecx, DWORD PTR _cell$[ebp+8]
	push	ecx
	call	_memcpy
	add	esp, 12					; 0000000cH
$L70890:

; 554  : 		cell.len = row.sz[2];

	mov	edx, DWORD PTR _row$[ebp+12]
	mov	eax, DWORD PTR [edx+8]
	mov	DWORD PTR _cell$[ebp+4], eax

; 555  : 		M_STRDUP(cell.txt, row.value[2], cell.len);

	mov	ecx, DWORD PTR _cell$[ebp+4]
	mov	DWORD PTR _size$70891[ebp], ecx
	mov	edx, DWORD PTR _row$[ebp+8]
	mov	eax, DWORD PTR [edx+8]
	mov	DWORD PTR _src$70892[ebp], eax
	mov	ecx, DWORD PTR _size$70891[ebp]
	add	ecx, 1
	mov	DWORD PTR _size1$70893[ebp], ecx
	mov	edx, DWORD PTR _size1$70893[ebp]
	push	edx
	call	_mem_alloc
	add	esp, 4
	mov	DWORD PTR _cell$[ebp], eax
	cmp	DWORD PTR _size1$70893[ebp], 0
	je	SHORT $L70894
	cmp	DWORD PTR _cell$[ebp], 0
	jne	SHORT $L70894
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29872], OFFSET FLAT:$SG70896
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 555		; 0000022bH
	jmp	$eva_err$70862
$L70894:
	cmp	DWORD PTR _src$70892[ebp], 0
	je	SHORT $L70898
	cmp	DWORD PTR _size$70891[ebp], 0
	je	SHORT $L70898
	mov	edx, DWORD PTR _size$70891[ebp]
	push	edx
	mov	eax, DWORD PTR _src$70892[ebp]
	push	eax
	mov	ecx, DWORD PTR _cell$[ebp]
	push	ecx
	call	_memcpy
	add	esp, 12					; 0000000cH
$L70898:

; 556  : 		if(row.sz[3] && row.value[3][0]) cell.b_relation = 1;

	mov	edx, DWORD PTR _row$[ebp+12]
	cmp	DWORD PTR [edx+12], 0
	je	SHORT $L70899
	mov	eax, DWORD PTR _row$[ebp+8]
	mov	ecx, DWORD PTR [eax+12]
	movsx	edx, BYTE PTR [ecx]
	test	edx, edx
	je	SHORT $L70899
	mov	BYTE PTR _cell$[ebp+12], 1
$L70899:

; 557  : 		if(row.sz[4]) cell.Num = strtoul(row.value[4], NULL, 10);

	mov	eax, DWORD PTR _row$[ebp+12]
	cmp	DWORD PTR [eax+16], 0
	je	SHORT $L70900
	push	10					; 0000000aH
	push	0
	mov	ecx, DWORD PTR _row$[ebp+8]
	mov	edx, DWORD PTR [ecx+16]
	push	edx
	call	_strtoul
	add	esp, 12					; 0000000cH
	mov	DWORD PTR _cell$[ebp+36], eax
$L70900:

; 558  : 		if(row.sz[5]) cell.Line = strtoul(row.value[5], NULL, 10);

	mov	eax, DWORD PTR _row$[ebp+12]
	cmp	DWORD PTR [eax+20], 0
	je	SHORT $L70902
	push	10					; 0000000aH
	push	0
	mov	ecx, DWORD PTR _row$[ebp+8]
	mov	edx, DWORD PTR [ecx+20]
	push	edx
	call	_strtoul
	add	esp, 12					; 0000000cH
	mov	DWORD PTR _cell$[ebp+40], eax
$L70902:

; 559  : 		if(row.sz[6]) cell.Lang = strtoul(row.value[6], NULL, 10);

	mov	eax, DWORD PTR _row$[ebp+12]
	cmp	DWORD PTR [eax+24], 0
	je	SHORT $L70904
	push	10					; 0000000aH
	push	0
	mov	ecx, DWORD PTR _row$[ebp+8]
	mov	edx, DWORD PTR [ecx+24]
	push	edx
	call	_strtoul
	add	esp, 12					; 0000000cH
	mov	DWORD PTR _cell$[ebp+44], eax
$L70904:

; 560  : 		if(row.sz[7]) cell.IdField = strtoul(row.value[7], NULL, 10);

	mov	eax, DWORD PTR _row$[ebp+12]
	cmp	DWORD PTR [eax+28], 0
	je	SHORT $L70906
	push	10					; 0000000aH
	push	0
	mov	ecx, DWORD PTR _row$[ebp+8]
	mov	edx, DWORD PTR [ecx+28]
	push	edx
	call	_strtoul
	add	esp, 12					; 0000000cH
	mov	DWORD PTR _cell$[ebp+28], eax
$L70906:

; 561  : 		if(row.sz[8]) cell.IdValue = strtoul(row.value[8], NULL, 10);

	mov	eax, DWORD PTR _row$[ebp+12]
	cmp	DWORD PTR [eax+32], 0
	je	SHORT $L70908
	push	10					; 0000000aH
	push	0
	mov	ecx, DWORD PTR _row$[ebp+8]
	mov	edx, DWORD PTR [ecx+32]
	push	edx
	call	_strtoul
	add	esp, 12					; 0000000cH
	mov	DWORD PTR _cell$[ebp+32], eax
$L70908:

; 562  : 		if(row.sz[9]) cell.Pkey = strtoul(row.value[9], NULL, 10);

	mov	eax, DWORD PTR _row$[ebp+12]
	cmp	DWORD PTR [eax+36], 0
	je	SHORT $L70910
	push	10					; 0000000aH
	push	0
	mov	ecx, DWORD PTR _row$[ebp+8]
	mov	edx, DWORD PTR [ecx+36]
	push	edx
	call	_strtoul
	add	esp, 12					; 0000000cH
	mov	DWORD PTR _cell$[ebp+16], eax
$L70910:

; 563  : 		if(dyntab_set(res, irow, 0, &cell)) RETURN_ERR_MEMORY;

	lea	eax, DWORD PTR _cell$[ebp]
	push	eax
	push	0
	mov	ecx, DWORD PTR _irow$[ebp]
	push	ecx
	mov	edx, DWORD PTR _res$[ebp]
	push	edx
	call	_dyntab_set
	add	esp, 16					; 00000010H
	test	eax, eax
	je	SHORT $L70912
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29872], OFFSET FLAT:$SG70914
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 563		; 00000233H
	jmp	SHORT $eva_err$70862
$L70912:

; 564  : 		irow++;

	mov	edx, DWORD PTR _irow$[ebp]
	add	edx, 1
	mov	DWORD PTR _irow$[ebp], edx

; 565  : 		if(sql_result_next_row(cntxt, &row)) STACK_ERROR;

	lea	eax, DWORD PTR _row$[ebp]
	push	eax
	mov	ecx, DWORD PTR _cntxt$[ebp]
	push	ecx
	call	_sql_result_next_row
	add	esp, 8
	test	eax, eax
	je	SHORT $L70915
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 565		; 00000235H
	jmp	SHORT $eva_err$70862
$L70915:

; 566  : 	}

	jmp	$L70876
$L70879:

; 567  : 
; 568  : 	qry_debug_table(cntxt, res, 0, 0);

	push	0
	push	0
	mov	eax, DWORD PTR _res$[ebp]
	push	eax
	mov	ecx, DWORD PTR _cntxt$[ebp]
	push	ecx
	call	_qry_debug_table
	add	esp, 16					; 00000010H
$eva_noerr$70916:

; 569  : 	RETURN_OK_CLEANUP;

	push	0
	push	OFFSET FLAT:$SG70917
	push	OFFSET FLAT:$SG70918
	mov	edx, DWORD PTR _cntxt$[ebp]
	push	edx
	call	_err_clear
	add	esp, 16					; 00000010H
$eva_err$70862:
	mov	eax, DWORD PTR _cntxt$[ebp]
	cmp	DWORD PTR [eax+29872], 0
	je	SHORT $L70919
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	edx, DWORD PTR [ecx+29900]
	push	edx
	push	OFFSET FLAT:$SG70920
	push	OFFSET FLAT:$SG70921
	mov	eax, DWORD PTR _cntxt$[ebp]
	push	eax
	call	_err_add_context
	add	esp, 16					; 00000010H
$L70919:
	mov	ecx, DWORD PTR _cntxt$[ebp]
	push	ecx
	call	_sql_free_result
	add	esp, 4
	lea	edx, DWORD PTR _row$[ebp]
	push	edx
	call	_sql_free_row
	add	esp, 4
	mov	eax, DWORD PTR _cntxt$[ebp]
	xor	ecx, ecx
	cmp	DWORD PTR [eax+29872], 0
	setne	cl
	mov	eax, ecx

; 570  : }

	mov	esp, ebp
	pop	ebp
	ret	0
_qry_get_obj_data ENDP
_TEXT	ENDS
PUBLIC	_qry_obj_idfield
EXTRN	_sprintf:NEAR
_DATA	SEGMENT
	ORG $+3
$SG70936 DB	'IdObj=%lu AND DateDel IS NULL', 00H
	ORG $+2
$SG70938 DB	' AND IdField=%lu', 00H
	ORG $+3
$SG70942 DB	'D:\Travail\ABI\EVA\V4.0\CGI\Brunix-2016\qry_utils.c', 00H
$SG70943 DB	'qry_obj_idfield', 00H
$SG70945 DB	'D:\Travail\ABI\EVA\V4.0\CGI\Brunix-2016\qry_utils.c', 00H
$SG70946 DB	'qry_obj_idfield', 00H
_DATA	ENDS
_TEXT	SEGMENT
_cntxt$ = 8
_res$ = 12
_id_obj$ = 16
_id_field$ = 20
_where$ = -128
_sz$ = -132
_qry_obj_idfield PROC NEAR

; 586  : ){

	push	ebp
	mov	ebp, esp
	sub	esp, 132				; 00000084H

; 587  : 	char where[128];
; 588  : 	size_t sz = sprintf(where, "IdObj=%lu AND DateDel IS NULL", id_obj);

	mov	eax, DWORD PTR _id_obj$[ebp]
	push	eax
	push	OFFSET FLAT:$SG70936
	lea	ecx, DWORD PTR _where$[ebp]
	push	ecx
	call	_sprintf
	add	esp, 12					; 0000000cH
	mov	DWORD PTR _sz$[ebp], eax

; 589  : 	if(id_field) sz += sprintf(where + sz, " AND IdField=%lu", id_field);

	cmp	DWORD PTR _id_field$[ebp], 0
	je	SHORT $L70937
	mov	edx, DWORD PTR _id_field$[ebp]
	push	edx
	push	OFFSET FLAT:$SG70938
	mov	eax, DWORD PTR _sz$[ebp]
	lea	ecx, DWORD PTR _where$[ebp+eax]
	push	ecx
	call	_sprintf
	add	esp, 12					; 0000000cH
	mov	edx, DWORD PTR _sz$[ebp]
	add	edx, eax
	mov	DWORD PTR _sz$[ebp], edx
$L70937:

; 590  : 	if(qry_get_obj_data(cntxt, res, where)) STACK_ERROR;

	lea	eax, DWORD PTR _where$[ebp]
	push	eax
	mov	ecx, DWORD PTR _res$[ebp]
	push	ecx
	mov	edx, DWORD PTR _cntxt$[ebp]
	push	edx
	call	_qry_get_obj_data
	add	esp, 12					; 0000000cH
	test	eax, eax
	je	SHORT $eva_noerr$70941
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 590		; 0000024eH
	jmp	SHORT $eva_err$70940
$eva_noerr$70941:

; 591  : 	RETURN_OK_CLEANUP;

	push	0
	push	OFFSET FLAT:$SG70942
	push	OFFSET FLAT:$SG70943
	mov	ecx, DWORD PTR _cntxt$[ebp]
	push	ecx
	call	_err_clear
	add	esp, 16					; 00000010H
$eva_err$70940:
	mov	edx, DWORD PTR _cntxt$[ebp]
	cmp	DWORD PTR [edx+29872], 0
	je	SHORT $L70944
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	ecx, DWORD PTR [eax+29900]
	push	ecx
	push	OFFSET FLAT:$SG70945
	push	OFFSET FLAT:$SG70946
	mov	edx, DWORD PTR _cntxt$[ebp]
	push	edx
	call	_err_add_context
	add	esp, 16					; 00000010H
$L70944:
	mov	eax, DWORD PTR _cntxt$[ebp]
	xor	ecx, ecx
	cmp	DWORD PTR [eax+29872], 0
	setne	cl
	mov	eax, ecx

; 592  : }

	mov	esp, ebp
	pop	ebp
	ret	0
_qry_obj_idfield ENDP
_TEXT	ENDS
PUBLIC	_qry_obj_field
PUBLIC	_qry_obj_data
EXTRN	_strlen:NEAR
_DATA	SEGMENT
$SG70964 DB	'%lu', 00H
$SG70968 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70971 DB	',', 00H
	ORG $+2
$SG70973 DB	'D:\Travail\ABI\EVA\V4.0\CGI\Brunix-2016\qry_utils.c', 00H
$SG70974 DB	'qry_obj_field', 00H
	ORG $+2
$SG70976 DB	'D:\Travail\ABI\EVA\V4.0\CGI\Brunix-2016\qry_utils.c', 00H
$SG70977 DB	'qry_obj_field', 00H
_DATA	ENDS
_TEXT	SEGMENT
_cntxt$ = 8
_res$ = 12
_id_obj$ = 16
_field$ = 20
_obj$ = -40
_fld$ = -20
__tmp$70963 = -72
_qry_obj_field PROC NEAR

; 609  : ){

	push	ebp
	mov	ebp, esp
	sub	esp, 72					; 00000048H
	push	edi

; 610  : 	DynTable obj = {0};

	mov	DWORD PTR _obj$[ebp], 0
	xor	eax, eax
	mov	DWORD PTR _obj$[ebp+4], eax
	mov	DWORD PTR _obj$[ebp+8], eax
	mov	DWORD PTR _obj$[ebp+12], eax
	mov	DWORD PTR _obj$[ebp+16], eax

; 611  : 	DynTable fld = {0};

	mov	DWORD PTR _fld$[ebp], 0
	xor	ecx, ecx
	mov	DWORD PTR _fld$[ebp+4], ecx
	mov	DWORD PTR _fld$[ebp+8], ecx
	mov	DWORD PTR _fld$[ebp+12], ecx
	mov	DWORD PTR _fld$[ebp+16], ecx

; 612  : 	if(!id_obj) RETURN_OK;

	cmp	DWORD PTR _id_obj$[ebp], 0
	jne	SHORT $L70961
	jmp	$eva_noerr$70962
$L70961:

; 613  : 	DYNTAB_ADD_INT(&obj, 0, 0, id_obj);

	mov	BYTE PTR __tmp$70963[ebp], 0
	mov	ecx, 7
	xor	eax, eax
	lea	edi, DWORD PTR __tmp$70963[ebp+1]
	rep stosd
	stosw
	stosb
	mov	edx, DWORD PTR _id_obj$[ebp]
	push	edx
	push	OFFSET FLAT:$SG70964
	lea	eax, DWORD PTR __tmp$70963[ebp]
	push	eax
	call	_sprintf
	add	esp, 12					; 0000000cH
	push	0
	push	0
	push	0
	lea	ecx, DWORD PTR __tmp$70963[ebp]
	push	ecx
	push	0
	push	0
	lea	edx, DWORD PTR _obj$[ebp]
	push	edx
	call	_dyntab_add
	add	esp, 28					; 0000001cH
	test	eax, eax
	je	SHORT $L70966
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29872], OFFSET FLAT:$SG70968
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 613		; 00000265H
	jmp	$eva_err$70969
$L70966:

; 614  : 	if(field && *field && dyntab_from_list(&fld, field, strlen(field), ",", 0, 0)) STACK_ERROR;

	cmp	DWORD PTR _field$[ebp], 0
	je	SHORT $L70970
	mov	edx, DWORD PTR _field$[ebp]
	movsx	eax, BYTE PTR [edx]
	test	eax, eax
	je	SHORT $L70970
	push	0
	push	0
	push	OFFSET FLAT:$SG70971
	mov	ecx, DWORD PTR _field$[ebp]
	push	ecx
	call	_strlen
	add	esp, 4
	push	eax
	mov	edx, DWORD PTR _field$[ebp]
	push	edx
	lea	eax, DWORD PTR _fld$[ebp]
	push	eax
	call	_dyntab_from_list
	add	esp, 24					; 00000018H
	test	eax, eax
	je	SHORT $L70970
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 614		; 00000266H
	jmp	SHORT $eva_err$70969
$L70970:

; 615  : 	if(qry_obj_data(cntxt, res, &obj, &fld)) STACK_ERROR;

	lea	edx, DWORD PTR _fld$[ebp]
	push	edx
	lea	eax, DWORD PTR _obj$[ebp]
	push	eax
	mov	ecx, DWORD PTR _res$[ebp]
	push	ecx
	mov	edx, DWORD PTR _cntxt$[ebp]
	push	edx
	call	_qry_obj_data
	add	esp, 16					; 00000010H
	test	eax, eax
	je	SHORT $eva_noerr$70962
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 615		; 00000267H
	jmp	SHORT $eva_err$70969
$eva_noerr$70962:

; 616  : 	RETURN_OK_CLEANUP;

	push	0
	push	OFFSET FLAT:$SG70973
	push	OFFSET FLAT:$SG70974
	mov	ecx, DWORD PTR _cntxt$[ebp]
	push	ecx
	call	_err_clear
	add	esp, 16					; 00000010H
$eva_err$70969:
	mov	edx, DWORD PTR _cntxt$[ebp]
	cmp	DWORD PTR [edx+29872], 0
	je	SHORT $L70975
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	ecx, DWORD PTR [eax+29900]
	push	ecx
	push	OFFSET FLAT:$SG70976
	push	OFFSET FLAT:$SG70977
	mov	edx, DWORD PTR _cntxt$[ebp]
	push	edx
	call	_err_add_context
	add	esp, 16					; 00000010H
$L70975:
	lea	eax, DWORD PTR _obj$[ebp]
	push	eax
	call	_dyntab_free
	add	esp, 4
	lea	ecx, DWORD PTR _fld$[ebp]
	push	ecx
	call	_dyntab_free
	add	esp, 4
	mov	edx, DWORD PTR _cntxt$[ebp]
	xor	eax, eax
	cmp	DWORD PTR [edx+29872], 0
	setne	al

; 617  : }

	pop	edi
	mov	esp, ebp
	pop	ebp
	ret	0
_qry_obj_field ENDP
_TEXT	ENDS
_DATA	SEGMENT
	ORG $+2
$SG70992 DB	',', 00H
	ORG $+2
$SG70996 DB	'D:\Travail\ABI\EVA\V4.0\CGI\Brunix-2016\qry_utils.c', 00H
$SG70997 DB	'qry_listobj_field', 00H
	ORG $+2
$SG70999 DB	'D:\Travail\ABI\EVA\V4.0\CGI\Brunix-2016\qry_utils.c', 00H
$SG71000 DB	'qry_listobj_field', 00H
_DATA	ENDS
_TEXT	SEGMENT
_cntxt$ = 8
_res$ = 12
_obj$ = 16
_field$ = 20
_fld$ = -20
_qry_listobj_field PROC NEAR

; 633  : ){

	push	ebp
	mov	ebp, esp
	sub	esp, 20					; 00000014H

; 634  : 	DynTable fld = {0};

	mov	DWORD PTR _fld$[ebp], 0
	xor	eax, eax
	mov	DWORD PTR _fld$[ebp+4], eax
	mov	DWORD PTR _fld$[ebp+8], eax
	mov	DWORD PTR _fld$[ebp+12], eax
	mov	DWORD PTR _fld$[ebp+16], eax

; 635  : 	if(field && *field && dyntab_from_list(&fld, field, strlen(field), ",", 0, 0)) STACK_ERROR;

	cmp	DWORD PTR _field$[ebp], 0
	je	SHORT $L70991
	mov	ecx, DWORD PTR _field$[ebp]
	movsx	edx, BYTE PTR [ecx]
	test	edx, edx
	je	SHORT $L70991
	push	0
	push	0
	push	OFFSET FLAT:$SG70992
	mov	eax, DWORD PTR _field$[ebp]
	push	eax
	call	_strlen
	add	esp, 4
	push	eax
	mov	ecx, DWORD PTR _field$[ebp]
	push	ecx
	lea	edx, DWORD PTR _fld$[ebp]
	push	edx
	call	_dyntab_from_list
	add	esp, 24					; 00000018H
	test	eax, eax
	je	SHORT $L70991
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 635		; 0000027bH
	jmp	SHORT $eva_err$70993
$L70991:

; 636  : 	if(qry_obj_data(cntxt, res, obj, &fld)) STACK_ERROR;

	lea	ecx, DWORD PTR _fld$[ebp]
	push	ecx
	mov	edx, DWORD PTR _obj$[ebp]
	push	edx
	mov	eax, DWORD PTR _res$[ebp]
	push	eax
	mov	ecx, DWORD PTR _cntxt$[ebp]
	push	ecx
	call	_qry_obj_data
	add	esp, 16					; 00000010H
	test	eax, eax
	je	SHORT $eva_noerr$70995
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 636		; 0000027cH
	jmp	SHORT $eva_err$70993
$eva_noerr$70995:

; 637  : 	RETURN_OK_CLEANUP;

	push	0
	push	OFFSET FLAT:$SG70996
	push	OFFSET FLAT:$SG70997
	mov	eax, DWORD PTR _cntxt$[ebp]
	push	eax
	call	_err_clear
	add	esp, 16					; 00000010H
$eva_err$70993:
	mov	ecx, DWORD PTR _cntxt$[ebp]
	cmp	DWORD PTR [ecx+29872], 0
	je	SHORT $L70998
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	eax, DWORD PTR [edx+29900]
	push	eax
	push	OFFSET FLAT:$SG70999
	push	OFFSET FLAT:$SG71000
	mov	ecx, DWORD PTR _cntxt$[ebp]
	push	ecx
	call	_err_add_context
	add	esp, 16					; 00000010H
$L70998:
	lea	edx, DWORD PTR _fld$[ebp]
	push	edx
	call	_dyntab_free
	add	esp, 4
	mov	eax, DWORD PTR _cntxt$[ebp]
	xor	ecx, ecx
	cmp	DWORD PTR [eax+29872], 0
	setne	cl
	mov	eax, ecx

; 638  : }

	mov	esp, ebp
	pop	ebp
	ret	0
_qry_listobj_field ENDP
_TEXT	ENDS
EXTRN	_qsort_colobjdata:NEAR
EXTRN	_dyntab_sort:NEAR
_DATA	SEGMENT
	ORG $+2
$SG71022 DB	'TLink.DateDel IS NULL', 00H
	ORG $+2
$SG71024 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG71029 DB	' AND IdField IN (', 00H
	ORG $+2
$SG71031 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG71035 DB	')', 00H
	ORG $+2
$SG71037 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG71040 DB	' AND IdObj IN(', 00H
	ORG $+1
$SG71042 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG71051 DB	',', 00H
	ORG $+2
$SG71053 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG71056 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG71059 DB	') ', 0aH, 00H
$SG71061 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG71073 DB	'D:\Travail\ABI\EVA\V4.0\CGI\Brunix-2016\qry_utils.c', 00H
$SG71074 DB	'qry_obj_data', 00H
	ORG $+3
$SG71076 DB	'D:\Travail\ABI\EVA\V4.0\CGI\Brunix-2016\qry_utils.c', 00H
$SG71077 DB	'qry_obj_data', 00H
_DATA	ENDS
_TEXT	SEGMENT
_cntxt$ = 8
_res$ = 12
_id_obj$ = 16
_fields$ = 20
_sql$ = -4
_i$ = -8
_j$ = -12
_idobj$71046 = -16
_val$71066 = -20
_qry_obj_data PROC NEAR

; 654  : ){

	push	ebp
	mov	ebp, esp
	sub	esp, 20					; 00000014H

; 655  :  	DynBuffer *sql = NULL;

	mov	DWORD PTR _sql$[ebp], 0

; 656  : 	unsigned long i, j;
; 657  : 	if(!id_obj || !id_obj->nbrows || !res) RETURN_OK;

	cmp	DWORD PTR _id_obj$[ebp], 0
	je	SHORT $L71018
	mov	eax, DWORD PTR _id_obj$[ebp]
	cmp	DWORD PTR [eax], 0
	je	SHORT $L71018
	cmp	DWORD PTR _res$[ebp], 0
	jne	SHORT $L71017
$L71018:
	jmp	$eva_noerr$71019
$L71017:

; 658  : 
; 659  : 	/* Build SQL WHERE clause for fields if applicable */
; 660  : 	DYNBUF_ADD_STR(&sql, "TLink.DateDel IS NULL");

	push	0
	push	0
	push	21					; 00000015H
	push	OFFSET FLAT:$SG71022
	lea	ecx, DWORD PTR _sql$[ebp]
	push	ecx
	call	_dynbuf_add
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L71021
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29872], OFFSET FLAT:$SG71024
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 660		; 00000294H
	jmp	$eva_err$71025
$L71021:

; 661  : 	if(fields && fields->nbrows)

	cmp	DWORD PTR _fields$[ebp], 0
	je	$L71034
	mov	ecx, DWORD PTR _fields$[ebp]
	cmp	DWORD PTR [ecx], 0
	je	$L71034

; 663  : 		DYNBUF_ADD_STR(&sql, " AND IdField IN (");

	push	0
	push	0
	push	17					; 00000011H
	push	OFFSET FLAT:$SG71029
	lea	edx, DWORD PTR _sql$[ebp]
	push	edx
	call	_dynbuf_add
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L71028
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29872], OFFSET FLAT:$SG71031
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 663		; 00000297H
	jmp	$eva_err$71025
$L71028:

; 664  : 		if(qry_values_list(cntxt, fields, 3, &sql)) STACK_ERROR;

	lea	edx, DWORD PTR _sql$[ebp]
	push	edx
	push	3
	mov	eax, DWORD PTR _fields$[ebp]
	push	eax
	mov	ecx, DWORD PTR _cntxt$[ebp]
	push	ecx
	call	_qry_values_list
	add	esp, 16					; 00000010H
	test	eax, eax
	je	SHORT $L71032
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 664		; 00000298H
	jmp	$eva_err$71025
$L71032:

; 665  : 		DYNBUF_ADD_STR(&sql, ")");

	push	0
	push	0
	push	1
	push	OFFSET FLAT:$SG71035
	lea	eax, DWORD PTR _sql$[ebp]
	push	eax
	call	_dynbuf_add
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L71034
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29872], OFFSET FLAT:$SG71037
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 665		; 00000299H
	jmp	$eva_err$71025
$L71034:

; 667  : 
; 668  : 	/* Build SQL WHERE clause for object ids */
; 669  : 	DYNBUF_ADD_STR(&sql, " AND IdObj IN(");

	push	0
	push	0
	push	14					; 0000000eH
	push	OFFSET FLAT:$SG71040
	lea	eax, DWORD PTR _sql$[ebp]
	push	eax
	call	_dynbuf_add
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L71039
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29872], OFFSET FLAT:$SG71042
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 669		; 0000029dH
	jmp	$eva_err$71025
$L71039:

; 670  : 	for(j = 0; j < id_obj->nbrows; j++)

	mov	DWORD PTR _j$[ebp], 0
	jmp	SHORT $L71043
$L71044:
	mov	eax, DWORD PTR _j$[ebp]
	add	eax, 1
	mov	DWORD PTR _j$[ebp], eax
$L71043:
	mov	ecx, DWORD PTR _id_obj$[ebp]
	mov	edx, DWORD PTR _j$[ebp]
	cmp	edx, DWORD PTR [ecx]
	jae	$L71045

; 672  : 		unsigned long idobj = DYNTAB_TOULRC(id_obj, j, 0);

	push	10					; 0000000aH
	push	0
	push	0
	mov	eax, DWORD PTR _j$[ebp]
	push	eax
	mov	ecx, DWORD PTR _id_obj$[ebp]
	push	ecx
	call	_dyntab_val
	add	esp, 12					; 0000000cH
	push	eax
	call	_strtoul
	add	esp, 12					; 0000000cH
	mov	DWORD PTR _idobj$71046[ebp], eax

; 673  : 		dyntab_cell(id_obj, j, 0)->IdObj = idobj;

	push	0
	mov	edx, DWORD PTR _j$[ebp]
	push	edx
	mov	eax, DWORD PTR _id_obj$[ebp]
	push	eax
	call	_dyntab_cell
	add	esp, 12					; 0000000cH
	mov	ecx, DWORD PTR _idobj$71046[ebp]
	mov	DWORD PTR [eax+20], ecx

; 674  : 		if(j) DYNBUF_ADD_STR(&sql, ",");

	cmp	DWORD PTR _j$[ebp], 0
	je	SHORT $L71050
	push	0
	push	0
	push	1
	push	OFFSET FLAT:$SG71051
	lea	edx, DWORD PTR _sql$[ebp]
	push	edx
	call	_dynbuf_add
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L71050
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29872], OFFSET FLAT:$SG71053
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 674		; 000002a2H
	jmp	$eva_err$71025
$L71050:

; 675  : 		DYNBUF_ADD_INT(&sql, idobj);

	mov	edx, DWORD PTR _idobj$71046[ebp]
	push	edx
	lea	eax, DWORD PTR _sql$[ebp]
	push	eax
	call	_dynbuf_add_int
	add	esp, 8
	test	eax, eax
	je	SHORT $L71054
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29872], OFFSET FLAT:$SG71056
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 675		; 000002a3H
	jmp	$eva_err$71025
$L71054:

; 676  : 	}

	jmp	$L71044
$L71045:

; 677  : 	DYNBUF_ADD_STR(&sql, ") \n");

	push	0
	push	0
	push	3
	push	OFFSET FLAT:$SG71059
	lea	eax, DWORD PTR _sql$[ebp]
	push	eax
	call	_dynbuf_add
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L71058
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29872], OFFSET FLAT:$SG71061
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 677		; 000002a5H
	jmp	$eva_err$71025
$L71058:

; 678  : 
; 679  : 	/* Read objects data */
; 680  : 	if(qry_get_obj_data(cntxt, res, sql->data)) STACK_ERROR;

	mov	eax, DWORD PTR _sql$[ebp]
	add	eax, 8
	push	eax
	mov	ecx, DWORD PTR _res$[ebp]
	push	ecx
	mov	edx, DWORD PTR _cntxt$[ebp]
	push	edx
	call	_qry_get_obj_data
	add	esp, 12					; 0000000cH
	test	eax, eax
	je	SHORT $L71062
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 680		; 000002a8H
	jmp	$eva_err$71025
$L71062:

; 681  : 
; 682  : 	/* Set col member of values with object position in id_obj */
; 683  : 	for(i = 0; i < res->nbrows; i++)

	mov	DWORD PTR _i$[ebp], 0
	jmp	SHORT $L71063
$L71064:
	mov	ecx, DWORD PTR _i$[ebp]
	add	ecx, 1
	mov	DWORD PTR _i$[ebp], ecx
$L71063:
	mov	edx, DWORD PTR _res$[ebp]
	mov	eax, DWORD PTR _i$[ebp]
	cmp	eax, DWORD PTR [edx]
	jae	SHORT $L71065

; 685  : 		DynTableCell *val = dyntab_cell(res, i, 0);

	push	0
	mov	ecx, DWORD PTR _i$[ebp]
	push	ecx
	mov	edx, DWORD PTR _res$[ebp]
	push	edx
	call	_dyntab_cell
	add	esp, 12					; 0000000cH
	mov	DWORD PTR _val$71066[ebp], eax

; 686  : 		for(j = 0; j < id_obj->nbrows && val->IdObj != dyntab_cell(id_obj, j, 0)->IdObj; j++);

	mov	DWORD PTR _j$[ebp], 0
	jmp	SHORT $L71067
$L71068:
	mov	eax, DWORD PTR _j$[ebp]
	add	eax, 1
	mov	DWORD PTR _j$[ebp], eax
$L71067:
	mov	ecx, DWORD PTR _id_obj$[ebp]
	mov	edx, DWORD PTR _j$[ebp]
	cmp	edx, DWORD PTR [ecx]
	jae	SHORT $L71069
	push	0
	mov	eax, DWORD PTR _j$[ebp]
	push	eax
	mov	ecx, DWORD PTR _id_obj$[ebp]
	push	ecx
	call	_dyntab_cell
	add	esp, 12					; 0000000cH
	mov	edx, DWORD PTR _val$71066[ebp]
	mov	ecx, DWORD PTR [edx+20]
	cmp	ecx, DWORD PTR [eax+20]
	je	SHORT $L71069
	jmp	SHORT $L71068
$L71069:

; 687  : 		val->col = j;

	mov	edx, DWORD PTR _val$71066[ebp]
	mov	eax, DWORD PTR _j$[ebp]
	mov	DWORD PTR [edx+56], eax

; 688  : 	}

	jmp	SHORT $L71064
$L71065:

; 689  : 
; 690  : 	/* Sort values  & clear col member */
; 691  : 	dyntab_sort(res, qsort_colobjdata);

	push	OFFSET FLAT:_qsort_colobjdata
	mov	ecx, DWORD PTR _res$[ebp]
	push	ecx
	call	_dyntab_sort
	add	esp, 8

; 692  : 	for(i = 0; i < res->nbrows; i++) dyntab_cell(res, i, 0)->col = 0;

	mov	DWORD PTR _i$[ebp], 0
	jmp	SHORT $L71070
$L71071:
	mov	edx, DWORD PTR _i$[ebp]
	add	edx, 1
	mov	DWORD PTR _i$[ebp], edx
$L71070:
	mov	eax, DWORD PTR _res$[ebp]
	mov	ecx, DWORD PTR _i$[ebp]
	cmp	ecx, DWORD PTR [eax]
	jae	SHORT $eva_noerr$71019
	push	0
	mov	edx, DWORD PTR _i$[ebp]
	push	edx
	mov	eax, DWORD PTR _res$[ebp]
	push	eax
	call	_dyntab_cell
	add	esp, 12					; 0000000cH
	mov	DWORD PTR [eax+56], 0
	jmp	SHORT $L71071
$eva_noerr$71019:

; 693  : 
; 694  : 	RETURN_OK_CLEANUP;

	push	0
	push	OFFSET FLAT:$SG71073
	push	OFFSET FLAT:$SG71074
	mov	ecx, DWORD PTR _cntxt$[ebp]
	push	ecx
	call	_err_clear
	add	esp, 16					; 00000010H
$eva_err$71025:
	mov	edx, DWORD PTR _cntxt$[ebp]
	cmp	DWORD PTR [edx+29872], 0
	je	SHORT $L71075
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	ecx, DWORD PTR [eax+29900]
	push	ecx
	push	OFFSET FLAT:$SG71076
	push	OFFSET FLAT:$SG71077
	mov	edx, DWORD PTR _cntxt$[ebp]
	push	edx
	call	_err_add_context
	add	esp, 16					; 00000010H
$L71075:
	mov	eax, DWORD PTR _cntxt$[ebp]
	xor	ecx, ecx
	cmp	DWORD PTR [eax+29872], 0
	setne	cl
	mov	eax, ecx

; 695  : }

	mov	esp, ebp
	pop	ebp
	ret	0
_qry_obj_data ENDP
_TEXT	ENDS
PUBLIC	_qry_add_new_idobj
PUBLIC	_qry_add_new_obj
_DATA	SEGMENT
	ORG $+3
$SG71093 DB	'D:\Travail\ABI\EVA\V4.0\CGI\Brunix-2016\qry_utils.c', 00H
$SG71094 DB	'qry_add_new_idobj', 00H
	ORG $+2
$SG71096 DB	'D:\Travail\ABI\EVA\V4.0\CGI\Brunix-2016\qry_utils.c', 00H
$SG71097 DB	'qry_add_new_idobj', 00H
_DATA	ENDS
_TEXT	SEGMENT
_cntxt$ = 8
_id_obj$ = 12
_formstamp$ = 16
_idobj$ = -20
_qry_add_new_idobj PROC NEAR

; 709  : ){

	push	ebp
	mov	ebp, esp
	sub	esp, 20					; 00000014H

; 710  : 	DynTable idobj = {0};

	mov	DWORD PTR _idobj$[ebp], 0
	xor	eax, eax
	mov	DWORD PTR _idobj$[ebp+4], eax
	mov	DWORD PTR _idobj$[ebp+8], eax
	mov	DWORD PTR _idobj$[ebp+12], eax
	mov	DWORD PTR _idobj$[ebp+16], eax

; 711  : 	if(qry_add_new_obj(cntxt, &idobj, formstamp)) STACK_ERROR;

	mov	ecx, DWORD PTR _formstamp$[ebp]
	push	ecx
	lea	edx, DWORD PTR _idobj$[ebp]
	push	edx
	mov	eax, DWORD PTR _cntxt$[ebp]
	push	eax
	call	_qry_add_new_obj
	add	esp, 12					; 0000000cH
	test	eax, eax
	je	SHORT $L71089
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 711		; 000002c7H
	jmp	SHORT $eva_err$71090
$L71089:

; 712  : 	*id_obj = DYNTAB_TOUL(&idobj);

	push	10					; 0000000aH
	push	0
	push	0
	push	0
	lea	edx, DWORD PTR _idobj$[ebp]
	push	edx
	call	_dyntab_val
	add	esp, 12					; 0000000cH
	push	eax
	call	_strtoul
	add	esp, 12					; 0000000cH
	mov	ecx, DWORD PTR _id_obj$[ebp]
	mov	DWORD PTR [ecx], eax
$eva_noerr$71092:

; 713  : 	RETURN_OK_CLEANUP;

	push	0
	push	OFFSET FLAT:$SG71093
	push	OFFSET FLAT:$SG71094
	mov	edx, DWORD PTR _cntxt$[ebp]
	push	edx
	call	_err_clear
	add	esp, 16					; 00000010H
$eva_err$71090:
	mov	eax, DWORD PTR _cntxt$[ebp]
	cmp	DWORD PTR [eax+29872], 0
	je	SHORT $L71095
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	edx, DWORD PTR [ecx+29900]
	push	edx
	push	OFFSET FLAT:$SG71096
	push	OFFSET FLAT:$SG71097
	mov	eax, DWORD PTR _cntxt$[ebp]
	push	eax
	call	_err_add_context
	add	esp, 16					; 00000010H
$L71095:
	lea	ecx, DWORD PTR _idobj$[ebp]
	push	ecx
	call	_dyntab_free
	add	esp, 4
	mov	edx, DWORD PTR _cntxt$[ebp]
	xor	eax, eax
	cmp	DWORD PTR [edx+29872], 0
	setne	al

; 714  : }

	mov	esp, ebp
	pop	ebp
	ret	0
_qry_add_new_idobj ENDP
_TEXT	ENDS
EXTRN	_sql_control:NEAR
EXTRN	_sql_insert_id:NEAR
_BSS	SEGMENT
	ALIGN	4

$SG71127 DB	01H DUP (?)
	ALIGN	4

$SG71133 DB	01H DUP (?)
_BSS	ENDS
_DATA	SEGMENT
	ORG $+2
$SG71118 DB	'SELECT MAX(IdObj)+1 FROM TLink', 00H
	ORG $+1
$SG71122 DB	'1', 00H
	ORG $+2
$SG71124 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG71128 DB	'-- qry_add_new_obj : Create new object', 0aH, 'INSERT TL'
	DB	'ink SET IdObj=', 00H
	ORG $+1
$SG71130 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG71134 DB	',IdField=', 00H
	ORG $+2
$SG71136 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG71138 DB	',Num=1', 00H
	ORG $+1
$SG71139 DB	',IdRelObj=', 00H
	ORG $+1
$SG71141 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG71144 DB	''',IdWhoCr=', 00H
	ORG $+1
$SG71145 DB	',DateCr=''', 00H
	ORG $+2
$SG71147 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG71152 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG71156 DB	'Null', 00H
	ORG $+3
$SG71158 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG71160 DB	'SELECT Pkey FROM TLink WHERE IdObj=%s', 00H
	ORG $+2
$SG71165 DB	'Impossible de cr', 0e9H, 'er une nouvelle fiche', 00H
	ORG $+1
$SG71169 DB	'SELECT Pkey FROM TLink WHERE IdObj=%s', 00H
	ORG $+2
$SG71175 DB	'SELECT MAX(IdObj)+1 FROM TLink', 00H
	ORG $+1
$SG71176 DB	'UPDATE TLink SET IdObj=%s WHERE Pkey=%lu', 00H
	ORG $+3
$SG71179 DB	'DELETE FROM TLink WHERE Pkey=%lu', 00H
	ORG $+3
$SG71181 DB	'Impossible de cr', 0e9H, 'er une nouvelle fiche', 00H
	ORG $+1
$SG71182 DB	'D:\Travail\ABI\EVA\V4.0\CGI\Brunix-2016\qry_utils.c', 00H
$SG71183 DB	'qry_add_new_obj', 00H
$SG71185 DB	'D:\Travail\ABI\EVA\V4.0\CGI\Brunix-2016\qry_utils.c', 00H
$SG71186 DB	'qry_add_new_obj', 00H
_DATA	ENDS
_TEXT	SEGMENT
_cntxt$ = 8
_id_obj$ = 12
_formstamp$ = 16
_sql$ = -132
_sqlres$ = -152
_pkey$ = -160
_i$ = -156
_qry$ = -128
_qry_add_new_obj PROC NEAR

; 729  : ){

	push	ebp
	mov	ebp, esp
	sub	esp, 160				; 000000a0H

; 730  : 	DynBuffer *sql = NULL;

	mov	DWORD PTR _sql$[ebp], 0

; 731  : 	DynTable sqlres = {0};

	mov	DWORD PTR _sqlres$[ebp], 0
	xor	eax, eax
	mov	DWORD PTR _sqlres$[ebp+4], eax
	mov	DWORD PTR _sqlres$[ebp+8], eax
	mov	DWORD PTR _sqlres$[ebp+12], eax
	mov	DWORD PTR _sqlres$[ebp+16], eax

; 732  : 	unsigned long pkey = 0, i;

	mov	DWORD PTR _pkey$[ebp], 0

; 733  : 	char qry[128];
; 734  : 
; 735  : 	if(!id_obj)  RETURN_OK;

	cmp	DWORD PTR _id_obj$[ebp], 0
	jne	SHORT $L71114
	jmp	$eva_noerr$71115
$L71114:

; 736  : 	/* Read next object Id */
; 737  : 	if(sql_exec_query(cntxt, "SELECT MAX(IdObj)+1 FROM TLink") ||
; 738  : 		sql_get_table(cntxt, id_obj, 2)) STACK_ERROR;

	push	OFFSET FLAT:$SG71118
	mov	ecx, DWORD PTR _cntxt$[ebp]
	push	ecx
	call	_sql_exec_query
	add	esp, 8
	test	eax, eax
	jne	SHORT $L71117
	push	2
	mov	edx, DWORD PTR _id_obj$[ebp]
	push	edx
	mov	eax, DWORD PTR _cntxt$[ebp]
	push	eax
	call	_sql_get_table
	add	esp, 12					; 0000000cH
	test	eax, eax
	je	SHORT $L71116
$L71117:
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 738		; 000002e2H
	jmp	$eva_err$71119
$L71116:

; 739  : 	if(!id_obj->nbrows) DYNTAB_SET(id_obj, 0, 0, "1");

	mov	edx, DWORD PTR _id_obj$[ebp]
	cmp	DWORD PTR [edx], 0
	jne	SHORT $L71121
	push	1
	push	OFFSET FLAT:$SG71122
	push	0
	push	0
	mov	eax, DWORD PTR _id_obj$[ebp]
	push	eax
	call	_dyntab_set_txt
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L71121
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29872], OFFSET FLAT:$SG71124
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 739		; 000002e3H
	jmp	$eva_err$71119
$L71121:

; 743  : 		"-- qry_add_new_obj : Create new object\n"
; 744  : 		"INSERT TLink SET IdObj=", id_obj, 0, 0, NO_CONV, "");

	push	0
	push	OFFSET FLAT:$SG71127
	push	0
	push	0
	push	0
	push	0
	mov	eax, DWORD PTR _id_obj$[ebp]
	push	eax
	call	_dyntab_sz
	add	esp, 12					; 0000000cH
	push	eax
	push	0
	push	0
	mov	ecx, DWORD PTR _id_obj$[ebp]
	push	ecx
	call	_dyntab_val
	add	esp, 12					; 0000000cH
	push	eax
	push	62					; 0000003eH
	push	OFFSET FLAT:$SG71128
	lea	edx, DWORD PTR _sql$[ebp]
	push	edx
	call	_dynbuf_add3
	add	esp, 36					; 00000024H
	test	eax, eax
	je	SHORT $L71126
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29872], OFFSET FLAT:$SG71130
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 744		; 000002e8H
	jmp	$eva_err$71119
$L71126:

; 745  : 
; 746  : 	/* Add formstamp if given */
; 747  : 	if(formstamp)

	cmp	DWORD PTR _formstamp$[ebp], 0
	je	$L71137

; 749  : 		DYNBUF_ADD3_INT(&sql, ",IdField=",  cntxt->val_FORMSTAMP, "");

	push	0
	push	OFFSET FLAT:$SG71133
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	eax, DWORD PTR [edx+269636]
	push	eax
	push	9
	push	OFFSET FLAT:$SG71134
	lea	ecx, DWORD PTR _sql$[ebp]
	push	ecx
	call	_dynbuf_add3_int
	add	esp, 24					; 00000018H
	test	eax, eax
	je	SHORT $L71132
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29872], OFFSET FLAT:$SG71136
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 749		; 000002edH
	jmp	$eva_err$71119
$L71132:

; 750  : 		DYNBUF_ADD3_INT(&sql, ",IdRelObj=", formstamp, ",Num=1");

	push	6
	push	OFFSET FLAT:$SG71138
	mov	ecx, DWORD PTR _formstamp$[ebp]
	push	ecx
	push	10					; 0000000aH
	push	OFFSET FLAT:$SG71139
	lea	edx, DWORD PTR _sql$[ebp]
	push	edx
	call	_dynbuf_add3_int
	add	esp, 24					; 00000018H
	test	eax, eax
	je	SHORT $L71137
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29872], OFFSET FLAT:$SG71141
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 750		; 000002eeH
	jmp	$eva_err$71119
$L71137:

; 752  : 
; 753  : 	/* Add stamp & exec query to insert new record */
; 754  : 	SQL_STAMP_RECORD(&sql);

	push	10					; 0000000aH
	push	OFFSET FLAT:$SG71144
	push	0
	push	0
	push	14					; 0000000eH
	mov	edx, DWORD PTR _cntxt$[ebp]
	add	edx, 29704				; 00007408H
	push	edx
	push	9
	push	OFFSET FLAT:$SG71145
	lea	eax, DWORD PTR _sql$[ebp]
	push	eax
	call	_dynbuf_add3
	add	esp, 36					; 00000024H
	test	eax, eax
	je	SHORT $L71143
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29872], OFFSET FLAT:$SG71147
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 754		; 000002f2H
	jmp	$eva_err$71119
$L71143:
	push	0
	push	0
	mov	eax, DWORD PTR _cntxt$[ebp]
	add	eax, 29408				; 000072e0H
	push	eax
	call	_dyntab_sz
	add	esp, 12					; 0000000cH
	test	eax, eax
	je	SHORT $L71148
	push	0
	push	0
	push	0
	push	0
	mov	ecx, DWORD PTR _cntxt$[ebp]
	add	ecx, 29408				; 000072e0H
	push	ecx
	call	_dyntab_sz
	add	esp, 12					; 0000000cH
	push	eax
	push	0
	push	0
	mov	edx, DWORD PTR _cntxt$[ebp]
	add	edx, 29408				; 000072e0H
	push	edx
	call	_dyntab_val
	add	esp, 12					; 0000000cH
	push	eax
	lea	eax, DWORD PTR _sql$[ebp]
	push	eax
	call	_dynbuf_add
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L71150
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29872], OFFSET FLAT:$SG71152
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 754		; 000002f2H
	jmp	$eva_err$71119
$L71150:
	jmp	SHORT $L71155
$L71148:
	push	0
	push	0
	push	4
	push	OFFSET FLAT:$SG71156
	lea	eax, DWORD PTR _sql$[ebp]
	push	eax
	call	_dynbuf_add
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L71155
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29872], OFFSET FLAT:$SG71158
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 754		; 000002f2H
	jmp	$eva_err$71119
$L71155:

; 755  : 	if(sql_exec_query(cntxt, sql->data)) STACK_ERROR;

	mov	eax, DWORD PTR _sql$[ebp]
	add	eax, 8
	push	eax
	mov	ecx, DWORD PTR _cntxt$[ebp]
	push	ecx
	call	_sql_exec_query
	add	esp, 8
	test	eax, eax
	je	SHORT $L71159
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 755		; 000002f3H
	jmp	$eva_err$71119
$L71159:

; 756  : 	pkey = sql_insert_id(cntxt);

	mov	eax, DWORD PTR _cntxt$[ebp]
	push	eax
	call	_sql_insert_id
	add	esp, 4
	mov	DWORD PTR _pkey$[ebp], eax

; 757  : 
; 758  : 	/* Check created object unicity */
; 759  : 	sprintf(qry, "SELECT Pkey FROM TLink WHERE IdObj=%s", dyntab_val(id_obj, 0, 0));

	push	0
	push	0
	mov	ecx, DWORD PTR _id_obj$[ebp]
	push	ecx
	call	_dyntab_val
	add	esp, 12					; 0000000cH
	push	eax
	push	OFFSET FLAT:$SG71160
	lea	edx, DWORD PTR _qry$[ebp]
	push	edx
	call	_sprintf
	add	esp, 12					; 0000000cH

; 760  : 	if(sql_exec_query(cntxt, qry) || sql_get_table(cntxt, &sqlres, 2)) STACK_ERROR;

	lea	eax, DWORD PTR _qry$[ebp]
	push	eax
	mov	ecx, DWORD PTR _cntxt$[ebp]
	push	ecx
	call	_sql_exec_query
	add	esp, 8
	test	eax, eax
	jne	SHORT $L71162
	push	2
	lea	edx, DWORD PTR _sqlres$[ebp]
	push	edx
	mov	eax, DWORD PTR _cntxt$[ebp]
	push	eax
	call	_sql_get_table
	add	esp, 12					; 0000000cH
	test	eax, eax
	je	SHORT $L71161
$L71162:
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 760		; 000002f8H
	jmp	$eva_err$71119
$L71161:

; 761  : 	if(!sqlres.nbrows) RETURN_ERROR("Impossible de créer une nouvelle fiche", NOP);

	cmp	DWORD PTR _sqlres$[ebp], 0
	jne	SHORT $L71163
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29872], OFFSET FLAT:$SG71165
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 761		; 000002f9H
	jmp	$eva_err$71119
$L71163:

; 762  : 
; 763  : 	/* Loop until unique object Id could be created or max # of trials reached */
; 764  : 	for(i = 0; i < 50 && sqlres.nbrows != 1; i++)

	mov	DWORD PTR _i$[ebp], 0
	jmp	SHORT $L71166
$L71167:
	mov	ecx, DWORD PTR _i$[ebp]
	add	ecx, 1
	mov	DWORD PTR _i$[ebp], ecx
$L71166:
	cmp	DWORD PTR _i$[ebp], 50			; 00000032H
	jae	$L71168
	cmp	DWORD PTR _sqlres$[ebp], 1
	je	$L71168

; 766  : 		/* Wait random time and check again object unicity (other process may have released it) */
; 767  : 		sql_control(cntxt, 10);

	push	10					; 0000000aH
	mov	edx, DWORD PTR _cntxt$[ebp]
	push	edx
	call	_sql_control
	add	esp, 8

; 768  : 		sprintf(qry, "SELECT Pkey FROM TLink WHERE IdObj=%s", dyntab_val(id_obj, 0, 0));

	push	0
	push	0
	mov	eax, DWORD PTR _id_obj$[ebp]
	push	eax
	call	_dyntab_val
	add	esp, 12					; 0000000cH
	push	eax
	push	OFFSET FLAT:$SG71169
	lea	ecx, DWORD PTR _qry$[ebp]
	push	ecx
	call	_sprintf
	add	esp, 12					; 0000000cH

; 769  : 		if(sql_exec_query(cntxt, qry) || sql_get_table(cntxt, &sqlres, 2)) STACK_ERROR;

	lea	edx, DWORD PTR _qry$[ebp]
	push	edx
	mov	eax, DWORD PTR _cntxt$[ebp]
	push	eax
	call	_sql_exec_query
	add	esp, 8
	test	eax, eax
	jne	SHORT $L71171
	push	2
	lea	ecx, DWORD PTR _sqlres$[ebp]
	push	ecx
	mov	edx, DWORD PTR _cntxt$[ebp]
	push	edx
	call	_sql_get_table
	add	esp, 12					; 0000000cH
	test	eax, eax
	je	SHORT $L71170
$L71171:
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 769		; 00000301H
	jmp	$eva_err$71119
$L71170:

; 770  : 		if(sqlres.nbrows == 1) break;

	cmp	DWORD PTR _sqlres$[ebp], 1
	jne	SHORT $L71172
	jmp	$L71168
$L71172:

; 771  : 
; 772  : 		/* Try new Id */
; 773  : 		if(sql_exec_query(cntxt, "SELECT MAX(IdObj)+1 FROM TLink") ||
; 774  : 			sql_get_table(cntxt, id_obj, 2)) STACK_ERROR;

	push	OFFSET FLAT:$SG71175
	mov	ecx, DWORD PTR _cntxt$[ebp]
	push	ecx
	call	_sql_exec_query
	add	esp, 8
	test	eax, eax
	jne	SHORT $L71174
	push	2
	mov	edx, DWORD PTR _id_obj$[ebp]
	push	edx
	mov	eax, DWORD PTR _cntxt$[ebp]
	push	eax
	call	_sql_get_table
	add	esp, 12					; 0000000cH
	test	eax, eax
	je	SHORT $L71173
$L71174:
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 774		; 00000306H
	jmp	$eva_err$71119
$L71173:

; 775  : 		sprintf(qry, "UPDATE TLink SET IdObj=%s WHERE Pkey=%lu", dyntab_val(id_obj, 0, 0), pkey);

	mov	edx, DWORD PTR _pkey$[ebp]
	push	edx
	push	0
	push	0
	mov	eax, DWORD PTR _id_obj$[ebp]
	push	eax
	call	_dyntab_val
	add	esp, 12					; 0000000cH
	push	eax
	push	OFFSET FLAT:$SG71176
	lea	ecx, DWORD PTR _qry$[ebp]
	push	ecx
	call	_sprintf
	add	esp, 16					; 00000010H

; 776  : 		if(sql_exec_query(cntxt, qry)) STACK_ERROR;

	lea	edx, DWORD PTR _qry$[ebp]
	push	edx
	mov	eax, DWORD PTR _cntxt$[ebp]
	push	eax
	call	_sql_exec_query
	add	esp, 8
	test	eax, eax
	je	SHORT $L71177
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 776		; 00000308H
	jmp	$eva_err$71119
$L71177:

; 777  : 	}

	jmp	$L71167
$L71168:

; 778  : 
; 779  : 	/* Delete created record & return error if duplicates found */
; 780  : 	if(sqlres.nbrows != 1)

	cmp	DWORD PTR _sqlres$[ebp], 1
	je	SHORT $L71178

; 782  : 		sprintf(qry, "DELETE FROM TLink WHERE Pkey=%lu", pkey);

	mov	edx, DWORD PTR _pkey$[ebp]
	push	edx
	push	OFFSET FLAT:$SG71179
	lea	eax, DWORD PTR _qry$[ebp]
	push	eax
	call	_sprintf
	add	esp, 12					; 0000000cH

; 783  : 		sql_exec_query(cntxt, qry);

	lea	ecx, DWORD PTR _qry$[ebp]
	push	ecx
	mov	edx, DWORD PTR _cntxt$[ebp]
	push	edx
	call	_sql_exec_query
	add	esp, 8

; 784  : 		RETURN_ERROR("Impossible de créer une nouvelle fiche", NOP);

	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29872], OFFSET FLAT:$SG71181
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 784		; 00000310H
	jmp	SHORT $eva_err$71119
$L71178:

; 786  : 
; 787  : 	/* Store created record Pkey */
; 788  : 	dyntab_cell(id_obj, 0, 0)->Pkey = pkey;

	push	0
	push	0
	mov	edx, DWORD PTR _id_obj$[ebp]
	push	edx
	call	_dyntab_cell
	add	esp, 12					; 0000000cH
	mov	ecx, DWORD PTR _pkey$[ebp]
	mov	DWORD PTR [eax+16], ecx
$eva_noerr$71115:

; 789  : 
; 790  : 	RETURN_OK_CLEANUP;

	push	0
	push	OFFSET FLAT:$SG71182
	push	OFFSET FLAT:$SG71183
	mov	edx, DWORD PTR _cntxt$[ebp]
	push	edx
	call	_err_clear
	add	esp, 16					; 00000010H
$eva_err$71119:
	mov	eax, DWORD PTR _cntxt$[ebp]
	cmp	DWORD PTR [eax+29872], 0
	je	SHORT $L71184
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	edx, DWORD PTR [ecx+29900]
	push	edx
	push	OFFSET FLAT:$SG71185
	push	OFFSET FLAT:$SG71186
	mov	eax, DWORD PTR _cntxt$[ebp]
	push	eax
	call	_err_add_context
	add	esp, 16					; 00000010H
$L71184:
	mov	ecx, DWORD PTR _sql$[ebp]
	push	ecx
	call	_mem_free
	add	esp, 4
	mov	DWORD PTR _sql$[ebp], 0
	lea	edx, DWORD PTR _sqlres$[ebp]
	push	edx
	call	_dyntab_free
	add	esp, 4
	mov	eax, DWORD PTR _cntxt$[ebp]
	xor	ecx, ecx
	cmp	DWORD PTR [eax+29872], 0
	setne	cl
	mov	eax, ecx

; 791  : }

	mov	esp, ebp
	pop	ebp
	ret	0
_qry_add_new_obj ENDP
_TEXT	ENDS
PUBLIC	_qry_update_idobj_idfield
PUBLIC	_qry_add_val
EXTRN	_qry_uncache_idobj:NEAR
EXTRN	_strcmp:NEAR
_BSS	SEGMENT
	ALIGN	4

$SG71221 DB	01H DUP (?)
	ALIGN	4

$SG71222 DB	01H DUP (?)
	ALIGN	4

$SG71235 DB	01H DUP (?)
	ALIGN	4

$SG71236 DB	01H DUP (?)
_BSS	ENDS
_DATA	SEGMENT
$SG71243 DB	'UPDATE TLink SET DateDel=''%s'', IdWhoDel=%s WHERE Pkey='
	DB	'%lu', 00H
	ORG $+2
$SG71252 DB	'D:\Travail\ABI\EVA\V4.0\CGI\Brunix-2016\qry_utils.c', 00H
$SG71253 DB	'qry_update_idobj_idfield', 00H
	ORG $+3
$SG71255 DB	'D:\Travail\ABI\EVA\V4.0\CGI\Brunix-2016\qry_utils.c', 00H
$SG71256 DB	'qry_update_idobj_idfield', 00H
_DATA	ENDS
_TEXT	SEGMENT
_cntxt$ = 8
_id_obj$ = 12
_id_field$ = 16
_values$ = 20
_mode$ = 24
_i$ = -32
_j$ = -36
_dbval$ = -24
_val$ = -4
_valdb$ = -28
_sql$71241 = -548
_qry_update_idobj_idfield PROC NEAR

; 813  : ){

	push	ebp
	mov	ebp, esp
	sub	esp, 564				; 00000234H

; 814  : 	unsigned long i, j;
; 815  : 	DynTable dbval = {0};

	mov	DWORD PTR _dbval$[ebp], 0
	xor	eax, eax
	mov	DWORD PTR _dbval$[ebp+4], eax
	mov	DWORD PTR _dbval$[ebp+8], eax
	mov	DWORD PTR _dbval$[ebp+12], eax
	mov	DWORD PTR _dbval$[ebp+16], eax

; 816  : 	DynTableCell *val, *valdb;
; 817  : 
; 818  : 	/* Read object values for field if check requested */
; 819  : 	qry_uncache_idobj(cntxt, id_obj);

	mov	ecx, DWORD PTR _id_obj$[ebp]
	push	ecx
	mov	edx, DWORD PTR _cntxt$[ebp]
	push	edx
	call	_qry_uncache_idobj
	add	esp, 8

; 820  : 	if(mode && qry_obj_idfield(cntxt, &dbval, id_obj, id_field)) STACK_ERROR;

	cmp	DWORD PTR _mode$[ebp], 0
	je	SHORT $L71206
	mov	eax, DWORD PTR _id_field$[ebp]
	push	eax
	mov	ecx, DWORD PTR _id_obj$[ebp]
	push	ecx
	lea	edx, DWORD PTR _dbval$[ebp]
	push	edx
	mov	eax, DWORD PTR _cntxt$[ebp]
	push	eax
	call	_qry_obj_idfield
	add	esp, 16					; 00000010H
	test	eax, eax
	je	SHORT $L71206
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 820		; 00000334H
	jmp	$eva_err$71207
$L71206:

; 821  : 
; 822  : 	/* Mark new values */
; 823  : 	if(mode < 5) for(i = 0; i < values->nbrows; i++)

	cmp	DWORD PTR _mode$[ebp], 5
	jge	$L71211
	mov	DWORD PTR _i$[ebp], 0
	jmp	SHORT $L71209
$L71210:
	mov	edx, DWORD PTR _i$[ebp]
	add	edx, 1
	mov	DWORD PTR _i$[ebp], edx
$L71209:
	mov	eax, DWORD PTR _values$[ebp]
	mov	ecx, DWORD PTR _i$[ebp]
	cmp	ecx, DWORD PTR [eax]
	jae	$L71211

; 825  : 		val = dyntab_cell(values, i, 0);

	push	0
	mov	edx, DWORD PTR _i$[ebp]
	push	edx
	mov	eax, DWORD PTR _values$[ebp]
	push	eax
	call	_dyntab_cell
	add	esp, 12					; 0000000cH
	mov	DWORD PTR _val$[ebp], eax

; 826  : 		if(!val->Num) val->Num = 1;

	mov	ecx, DWORD PTR _val$[ebp]
	cmp	DWORD PTR [ecx+36], 0
	jne	SHORT $L71212
	mov	edx, DWORD PTR _val$[ebp]
	mov	DWORD PTR [edx+36], 1
$L71212:

; 827  : 		val->b_modified = 1;

	mov	eax, DWORD PTR _val$[ebp]
	mov	BYTE PTR [eax+13], 1

; 828  : 		if(mode) for(j = 0; j < dbval.nbrows; j++)

	cmp	DWORD PTR _mode$[ebp], 0
	je	$L71216
	mov	DWORD PTR _j$[ebp], 0
	jmp	SHORT $L71214
$L71215:
	mov	ecx, DWORD PTR _j$[ebp]
	add	ecx, 1
	mov	DWORD PTR _j$[ebp], ecx
$L71214:
	mov	edx, DWORD PTR _j$[ebp]
	cmp	edx, DWORD PTR _dbval$[ebp]
	jae	$L71216

; 830  : 			valdb = dyntab_cell(&dbval, j, 0);

	push	0
	mov	eax, DWORD PTR _j$[ebp]
	push	eax
	lea	ecx, DWORD PTR _dbval$[ebp]
	push	ecx
	call	_dyntab_cell
	add	esp, 12					; 0000000cH
	mov	DWORD PTR _valdb$[ebp], eax

; 831  : 			if(!DYNTAB_SAMEVAL_MODE(val, valdb, mode)) continue;

	mov	edx, DWORD PTR _val$[ebp]
	mov	eax, DWORD PTR _valdb$[ebp]
	mov	ecx, DWORD PTR [edx+4]
	cmp	ecx, DWORD PTR [eax+4]
	jne	$L71218
	cmp	DWORD PTR _mode$[ebp], 1
	je	SHORT $L71219
	cmp	DWORD PTR _mode$[ebp], 4
	je	SHORT $L71219
	cmp	DWORD PTR _mode$[ebp], 5
	je	SHORT $L71219
	mov	edx, DWORD PTR _val$[ebp]
	mov	eax, DWORD PTR _valdb$[ebp]
	mov	ecx, DWORD PTR [edx+36]
	cmp	ecx, DWORD PTR [eax+36]
	jne	SHORT $L71218
$L71219:
	cmp	DWORD PTR _mode$[ebp], 1
	je	SHORT $L71220
	cmp	DWORD PTR _mode$[ebp], 5
	je	SHORT $L71220
	mov	edx, DWORD PTR _val$[ebp]
	mov	eax, DWORD PTR _valdb$[ebp]
	mov	ecx, DWORD PTR [edx+40]
	cmp	ecx, DWORD PTR [eax+40]
	jne	SHORT $L71218
$L71220:
	mov	edx, DWORD PTR _valdb$[ebp]
	cmp	DWORD PTR [edx], 0
	je	SHORT $L72081
	mov	eax, DWORD PTR _valdb$[ebp]
	mov	ecx, DWORD PTR [eax]
	mov	DWORD PTR -552+[ebp], ecx
	jmp	SHORT $L72082
$L72081:
	mov	DWORD PTR -552+[ebp], OFFSET FLAT:$SG71221
$L72082:
	mov	edx, DWORD PTR _val$[ebp]
	cmp	DWORD PTR [edx], 0
	je	SHORT $L72083
	mov	eax, DWORD PTR _val$[ebp]
	mov	ecx, DWORD PTR [eax]
	mov	DWORD PTR -556+[ebp], ecx
	jmp	SHORT $L72084
$L72083:
	mov	DWORD PTR -556+[ebp], OFFSET FLAT:$SG71222
$L72084:
	mov	edx, DWORD PTR -552+[ebp]
	push	edx
	mov	eax, DWORD PTR -556+[ebp]
	push	eax
	call	_strcmp
	add	esp, 8
	test	eax, eax
	je	SHORT $L71217
$L71218:
	jmp	$L71215
$L71217:

; 832  : 			val->b_modified = 0;

	mov	ecx, DWORD PTR _val$[ebp]
	mov	BYTE PTR [ecx+13], 0
$L71216:

; 835  : 	}

	jmp	$L71210
$L71211:

; 836  : 
; 837  : 	/* Mark values to remove */
; 838  : 	if(mode > 1) for(j = 0; j < dbval.nbrows; j++)

	cmp	DWORD PTR _mode$[ebp], 1
	jle	$L71226
	mov	DWORD PTR _j$[ebp], 0
	jmp	SHORT $L71224
$L71225:
	mov	edx, DWORD PTR _j$[ebp]
	add	edx, 1
	mov	DWORD PTR _j$[ebp], edx
$L71224:
	mov	eax, DWORD PTR _j$[ebp]
	cmp	eax, DWORD PTR _dbval$[ebp]
	jae	$L71226

; 840  : 		valdb = dyntab_cell(&dbval, j, 0);

	push	0
	mov	ecx, DWORD PTR _j$[ebp]
	push	ecx
	lea	edx, DWORD PTR _dbval$[ebp]
	push	edx
	call	_dyntab_cell
	add	esp, 12					; 0000000cH
	mov	DWORD PTR _valdb$[ebp], eax

; 841  : 		valdb->b_modified = (char)(mode != 5);

	xor	eax, eax
	cmp	DWORD PTR _mode$[ebp], 5
	setne	al
	mov	ecx, DWORD PTR _valdb$[ebp]
	mov	BYTE PTR [ecx+13], al

; 842  : 		for(i = 0; i < values->nbrows; i++)

	mov	DWORD PTR _i$[ebp], 0
	jmp	SHORT $L71228
$L71229:
	mov	edx, DWORD PTR _i$[ebp]
	add	edx, 1
	mov	DWORD PTR _i$[ebp], edx
$L71228:
	mov	eax, DWORD PTR _values$[ebp]
	mov	ecx, DWORD PTR _i$[ebp]
	cmp	ecx, DWORD PTR [eax]
	jae	$L71230

; 844  : 			val = dyntab_cell(values, i, 0);

	push	0
	mov	edx, DWORD PTR _i$[ebp]
	push	edx
	mov	eax, DWORD PTR _values$[ebp]
	push	eax
	call	_dyntab_cell
	add	esp, 12					; 0000000cH
	mov	DWORD PTR _val$[ebp], eax

; 845  : 			if(!DYNTAB_SAMEVAL_MODE(val, valdb, mode)) continue;

	mov	ecx, DWORD PTR _val$[ebp]
	mov	edx, DWORD PTR _valdb$[ebp]
	mov	eax, DWORD PTR [ecx+4]
	cmp	eax, DWORD PTR [edx+4]
	jne	$L71232
	cmp	DWORD PTR _mode$[ebp], 1
	je	SHORT $L71233
	cmp	DWORD PTR _mode$[ebp], 4
	je	SHORT $L71233
	cmp	DWORD PTR _mode$[ebp], 5
	je	SHORT $L71233
	mov	ecx, DWORD PTR _val$[ebp]
	mov	edx, DWORD PTR _valdb$[ebp]
	mov	eax, DWORD PTR [ecx+36]
	cmp	eax, DWORD PTR [edx+36]
	jne	SHORT $L71232
$L71233:
	cmp	DWORD PTR _mode$[ebp], 1
	je	SHORT $L71234
	cmp	DWORD PTR _mode$[ebp], 5
	je	SHORT $L71234
	mov	ecx, DWORD PTR _val$[ebp]
	mov	edx, DWORD PTR _valdb$[ebp]
	mov	eax, DWORD PTR [ecx+40]
	cmp	eax, DWORD PTR [edx+40]
	jne	SHORT $L71232
$L71234:
	mov	ecx, DWORD PTR _valdb$[ebp]
	cmp	DWORD PTR [ecx], 0
	je	SHORT $L72085
	mov	edx, DWORD PTR _valdb$[ebp]
	mov	eax, DWORD PTR [edx]
	mov	DWORD PTR -560+[ebp], eax
	jmp	SHORT $L72086
$L72085:
	mov	DWORD PTR -560+[ebp], OFFSET FLAT:$SG71235
$L72086:
	mov	ecx, DWORD PTR _val$[ebp]
	cmp	DWORD PTR [ecx], 0
	je	SHORT $L72087
	mov	edx, DWORD PTR _val$[ebp]
	mov	eax, DWORD PTR [edx]
	mov	DWORD PTR -564+[ebp], eax
	jmp	SHORT $L72088
$L72087:
	mov	DWORD PTR -564+[ebp], OFFSET FLAT:$SG71236
$L72088:
	mov	ecx, DWORD PTR -560+[ebp]
	push	ecx
	mov	edx, DWORD PTR -564+[ebp]
	push	edx
	call	_strcmp
	add	esp, 8
	test	eax, eax
	je	SHORT $L71231
$L71232:
	jmp	$L71229
$L71231:

; 846  : 			valdb->b_modified = (char)(mode == 5);

	xor	eax, eax
	cmp	DWORD PTR _mode$[ebp], 5
	sete	al
	mov	ecx, DWORD PTR _valdb$[ebp]
	mov	BYTE PTR [ecx+13], al

; 847  : 		}

	jmp	$L71229
$L71230:

; 848  : 	}

	jmp	$L71225
$L71226:

; 849  : 
; 850  : 	/* Archive old values - set delete time & user */
; 851  : 	for(i = 0; i < dbval.nbrows; i++)

	mov	DWORD PTR _i$[ebp], 0
	jmp	SHORT $L71238
$L71239:
	mov	edx, DWORD PTR _i$[ebp]
	add	edx, 1
	mov	DWORD PTR _i$[ebp], edx
$L71238:
	mov	eax, DWORD PTR _i$[ebp]
	cmp	eax, DWORD PTR _dbval$[ebp]
	jae	$L71240

; 853  :  		char sql[512];
; 854  : 		val = dyntab_cell(&dbval, i, 0);

	push	0
	mov	ecx, DWORD PTR _i$[ebp]
	push	ecx
	lea	edx, DWORD PTR _dbval$[ebp]
	push	edx
	call	_dyntab_cell
	add	esp, 12					; 0000000cH
	mov	DWORD PTR _val$[ebp], eax

; 855  : 		if(!val->b_modified) continue;

	mov	eax, DWORD PTR _val$[ebp]
	movsx	ecx, BYTE PTR [eax+13]
	test	ecx, ecx
	jne	SHORT $L71242
	jmp	SHORT $L71239
$L71242:

; 856  : 		sprintf(sql, "UPDATE TLink SET DateDel='%s', IdWhoDel=%s WHERE Pkey=%lu",
; 857  : 			cntxt->timestamp, dyntab_val(&cntxt->id_user, 0, 0), val->Pkey);

	mov	edx, DWORD PTR _val$[ebp]
	mov	eax, DWORD PTR [edx+16]
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
	add	edx, 29704				; 00007408H
	push	edx
	push	OFFSET FLAT:$SG71243
	lea	eax, DWORD PTR _sql$71241[ebp]
	push	eax
	call	_sprintf
	add	esp, 20					; 00000014H

; 858  : 		if(sql_exec_query(cntxt , sql)) STACK_ERROR;

	lea	ecx, DWORD PTR _sql$71241[ebp]
	push	ecx
	mov	edx, DWORD PTR _cntxt$[ebp]
	push	edx
	call	_sql_exec_query
	add	esp, 8
	test	eax, eax
	je	SHORT $L71244
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 858		; 0000035aH
	jmp	$eva_err$71207
$L71244:

; 859  : 	}

	jmp	$L71239
$L71240:

; 860  : 
; 861  : 	/* Add each value */
; 862  : 	for(i = 0; i < values->nbrows; i++)

	mov	DWORD PTR _i$[ebp], 0
	jmp	SHORT $L71245
$L71246:
	mov	ecx, DWORD PTR _i$[ebp]
	add	ecx, 1
	mov	DWORD PTR _i$[ebp], ecx
$L71245:
	mov	edx, DWORD PTR _values$[ebp]
	mov	eax, DWORD PTR _i$[ebp]
	cmp	eax, DWORD PTR [edx]
	jae	SHORT $eva_noerr$71251

; 864  : 		/* Read value & set object id & field */
; 865  : 		val = dyntab_cell(values, i, 0);

	push	0
	mov	ecx, DWORD PTR _i$[ebp]
	push	ecx
	mov	edx, DWORD PTR _values$[ebp]
	push	edx
	call	_dyntab_cell
	add	esp, 12					; 0000000cH
	mov	DWORD PTR _val$[ebp], eax

; 866  : 		if(!val->len || !val->b_modified) continue;

	mov	eax, DWORD PTR _val$[ebp]
	cmp	DWORD PTR [eax+4], 0
	je	SHORT $L71249
	mov	ecx, DWORD PTR _val$[ebp]
	movsx	edx, BYTE PTR [ecx+13]
	test	edx, edx
	jne	SHORT $L71248
$L71249:
	jmp	SHORT $L71246
$L71248:

; 867  : 		val->IdObj = id_obj;

	mov	eax, DWORD PTR _val$[ebp]
	mov	ecx, DWORD PTR _id_obj$[ebp]
	mov	DWORD PTR [eax+20], ecx

; 868  : 		val->IdField = id_field;

	mov	edx, DWORD PTR _val$[ebp]
	mov	eax, DWORD PTR _id_field$[ebp]
	mov	DWORD PTR [edx+28], eax

; 869  : 		val->Pkey = 0;

	mov	ecx, DWORD PTR _val$[ebp]
	mov	DWORD PTR [ecx+16], 0

; 870  : 
; 871  : 		/* Add value in db */
; 872  : 		if(qry_add_val(cntxt, val, 0, &val->Pkey)) STACK_ERROR;

	mov	edx, DWORD PTR _val$[ebp]
	add	edx, 16					; 00000010H
	push	edx
	push	0
	mov	eax, DWORD PTR _val$[ebp]
	push	eax
	mov	ecx, DWORD PTR _cntxt$[ebp]
	push	ecx
	call	_qry_add_val
	add	esp, 16					; 00000010H
	test	eax, eax
	je	SHORT $L71250
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 872		; 00000368H
	jmp	SHORT $eva_err$71207
$L71250:

; 873  : 	}

	jmp	$L71246
$eva_noerr$71251:

; 874  : 
; 875  : 	RETURN_OK_CLEANUP;

	push	0
	push	OFFSET FLAT:$SG71252
	push	OFFSET FLAT:$SG71253
	mov	eax, DWORD PTR _cntxt$[ebp]
	push	eax
	call	_err_clear
	add	esp, 16					; 00000010H
$eva_err$71207:
	mov	ecx, DWORD PTR _cntxt$[ebp]
	cmp	DWORD PTR [ecx+29872], 0
	je	SHORT $L71254
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	eax, DWORD PTR [edx+29900]
	push	eax
	push	OFFSET FLAT:$SG71255
	push	OFFSET FLAT:$SG71256
	mov	ecx, DWORD PTR _cntxt$[ebp]
	push	ecx
	call	_err_add_context
	add	esp, 16					; 00000010H
$L71254:
	lea	edx, DWORD PTR _dbval$[ebp]
	push	edx
	call	_dyntab_free
	add	esp, 4
	mov	eax, DWORD PTR _cntxt$[ebp]
	xor	ecx, ecx
	cmp	DWORD PTR [eax+29872], 0
	setne	cl
	mov	eax, ecx

; 876  : }

	mov	esp, ebp
	pop	ebp
	ret	0
_qry_update_idobj_idfield ENDP
_TEXT	ENDS
PUBLIC	_qry_check_idobj
_DATA	SEGMENT
	ORG $+3
$SG71266 DB	'SELECT Pkey FROM TLink WHERE IdObj=%lu AND IdField=%lu A'
	DB	'ND DateDel IS NULL', 00H
_DATA	ENDS
_TEXT	SEGMENT
_cntxt$ = 8
_idobj$ = 12
_sql$ = -128
_res$ = -148
_b_ex$ = -152
_qry_check_idobj PROC NEAR

; 887  : ){

	push	ebp
	mov	ebp, esp
	sub	esp, 152				; 00000098H

; 888  :  	char sql[128];
; 889  : 	DynTable res = { 0 };

	mov	DWORD PTR _res$[ebp], 0
	xor	eax, eax
	mov	DWORD PTR _res$[ebp+4], eax
	mov	DWORD PTR _res$[ebp+8], eax
	mov	DWORD PTR _res$[ebp+12], eax
	mov	DWORD PTR _res$[ebp+16], eax

; 890  : 	int b_ex;
; 891  : 
; 892  : 	/* Build & exec query for object formstamp */
; 893  : 	sprintf(sql, "SELECT Pkey FROM TLink WHERE IdObj=%lu AND IdField=%lu AND DateDel IS NULL", idobj, cntxt->val_FORMSTAMP);

	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	edx, DWORD PTR [ecx+269636]
	push	edx
	mov	eax, DWORD PTR _idobj$[ebp]
	push	eax
	push	OFFSET FLAT:$SG71266
	lea	ecx, DWORD PTR _sql$[ebp]
	push	ecx
	call	_sprintf
	add	esp, 16					; 00000010H

; 894  : 	if(!sql_exec_query(cntxt, sql)) sql_get_table(cntxt, &res, 2);

	lea	edx, DWORD PTR _sql$[ebp]
	push	edx
	mov	eax, DWORD PTR _cntxt$[ebp]
	push	eax
	call	_sql_exec_query
	add	esp, 8
	test	eax, eax
	jne	SHORT $L71267
	push	2
	lea	ecx, DWORD PTR _res$[ebp]
	push	ecx
	mov	edx, DWORD PTR _cntxt$[ebp]
	push	edx
	call	_sql_get_table
	add	esp, 12					; 0000000cH
$L71267:

; 895  : 
; 896  : 	/* Return result */
; 897  : 	b_ex = res.nbrows > 0;

	xor	eax, eax
	cmp	eax, DWORD PTR _res$[ebp]
	sbb	ecx, ecx
	neg	ecx
	mov	DWORD PTR _b_ex$[ebp], ecx

; 898  : 	DYNTAB_FREE(res);

	lea	edx, DWORD PTR _res$[ebp]
	push	edx
	call	_dyntab_free
	add	esp, 4

; 899  : 	return b_ex;

	mov	eax, DWORD PTR _b_ex$[ebp]

; 900  : }

	mov	esp, ebp
	pop	ebp
	ret	0
_qry_check_idobj ENDP
_TEXT	ENDS
EXTRN	_sql_add_value:NEAR
_BSS	SEGMENT
	ALIGN	4

$SG71310 DB	01H DUP (?)
	ALIGN	4

$SG71315 DB	01H DUP (?)
	ALIGN	4

$SG71341 DB	01H DUP (?)
	ALIGN	4

$SG71347 DB	01H DUP (?)
	ALIGN	4

$SG71395 DB	01H DUP (?)
	ALIGN	4

$SG71401 DB	01H DUP (?)
	ALIGN	4

$SG71406 DB	01H DUP (?)
	ALIGN	4

$SG71412 DB	01H DUP (?)
	ALIGN	4

$SG71435 DB	01H DUP (?)
_BSS	ENDS
_DATA	SEGMENT
	ORG $+1
$SG71294 DB	' ', 0aH, 09H, 0dH, 00H
	ORG $+3
$SG71298 DB	' ', 0aH, 09H, 0dH, 00H
	ORG $+3
$SG71311 DB	'-- qry_add_val : Check if record exists', 0aH, 'SELECT P'
	DB	'key,IdRelObj,IdValue FROM TLink WHERE DateDel Is NULL AND IdO'
	DB	'bj=', 00H
	ORG $+3
$SG71313 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG71316 DB	' AND IdField=', 00H
	ORG $+2
$SG71318 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG71324 DB	' AND Num=', 00H
	ORG $+2
$SG71326 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG71331 DB	' AND Line=', 00H
	ORG $+1
$SG71333 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG71342 DB	' AND IdRelObj=', 00H
	ORG $+1
$SG71344 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG71348 DB	' AND IdValue=', 00H
	ORG $+2
$SG71350 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG71364 DB	'UPDATE TLink SET DateDel=''%s'', IdWhoDel=%s WHERE Pkey='
	DB	'%s', 00H
	ORG $+3
$SG71372 DB	'-- Update TLink record', 0aH, 'UPDATE', 00H
	ORG $+2
$SG71374 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG71378 DB	'-- Insert TLink record', 0aH, 'INSERT', 00H
	ORG $+2
$SG71380 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG71382 DB	', IdField=', 00H
	ORG $+1
$SG71383 DB	' TLink SET IdObj=', 00H
	ORG $+2
$SG71385 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG71388 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG71396 DB	',IdRelObj=', 00H
	ORG $+1
$SG71398 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG71402 DB	',IdValue=', 00H
	ORG $+2
$SG71404 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG71407 DB	', Num=', 00H
	ORG $+1
$SG71409 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG71413 DB	', Line=', 00H
$SG71415 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG71418 DB	''',IdWhoCr=', 00H
	ORG $+1
$SG71419 DB	',DateCr=''', 00H
	ORG $+2
$SG71421 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG71426 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG71430 DB	'Null', 00H
	ORG $+3
$SG71432 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG71436 DB	' WHERE Pkey=', 00H
	ORG $+3
$SG71438 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG71441 DB	'D:\Travail\ABI\EVA\V4.0\CGI\Brunix-2016\qry_utils.c', 00H
$SG71442 DB	'qry_add_val', 00H
$SG71444 DB	'D:\Travail\ABI\EVA\V4.0\CGI\Brunix-2016\qry_utils.c', 00H
$SG71445 DB	'qry_add_val', 00H
_DATA	ENDS
_TEXT	SEGMENT
_cntxt$ = 8
_val$ = 12
_check$ = 16
_pkey$ = 20
_sql$ = -4
_sqlres$ = -28
_storage$ = -40
_txt$ = -8
_sz$ = -36
_i$ = -32
_b_exist$71308 = -44
_qry$71363 = -172
_qry_add_val PROC NEAR

; 922  : ){

	push	ebp
	mov	ebp, esp
	sub	esp, 188				; 000000bcH

; 923  :  	DynBuffer *sql = NULL;

	mov	DWORD PTR _sql$[ebp], 0

; 924  : 	DynTable sqlres = { 0 };

	mov	DWORD PTR _sqlres$[ebp], 0
	xor	eax, eax
	mov	DWORD PTR _sqlres$[ebp+4], eax
	mov	DWORD PTR _sqlres$[ebp+8], eax
	mov	DWORD PTR _sqlres$[ebp+12], eax
	mov	DWORD PTR _sqlres$[ebp+16], eax

; 925  : 	int storage;
; 926  : 	char *txt;
; 927  : 	size_t sz;
; 928  : 	unsigned long i;
; 929  : 
; 930  : 	/* Check params */
; 931  : 	if(!val || !val->IdObj || !(val->field || val->IdField)) RETURN_OK;

	cmp	DWORD PTR _val$[ebp], 0
	je	SHORT $L71287
	mov	ecx, DWORD PTR _val$[ebp]
	cmp	DWORD PTR [ecx+20], 0
	je	SHORT $L71287
	mov	edx, DWORD PTR _val$[ebp]
	cmp	DWORD PTR [edx+8], 0
	jne	SHORT $L71286
	mov	eax, DWORD PTR _val$[ebp]
	cmp	DWORD PTR [eax+28], 0
	jne	SHORT $L71286
$L71287:
	jmp	$eva_noerr$71288
$L71286:

; 932  : 
; 933  : 	/* Strip spaces around the value */
; 934  : 	txt = val->txt;

	mov	ecx, DWORD PTR _val$[ebp]
	mov	edx, DWORD PTR [ecx]
	mov	DWORD PTR _txt$[ebp], edx

; 935  : 	sz = val->len;

	mov	eax, DWORD PTR _val$[ebp]
	mov	ecx, DWORD PTR [eax+4]
	mov	DWORD PTR _sz$[ebp], ecx

; 936  : 	if(!sz && txt) sz = strlen(txt);

	cmp	DWORD PTR _sz$[ebp], 0
	jne	SHORT $L71289
	cmp	DWORD PTR _txt$[ebp], 0
	je	SHORT $L71289
	mov	edx, DWORD PTR _txt$[ebp]
	push	edx
	call	_strlen
	add	esp, 4
	mov	DWORD PTR _sz$[ebp], eax
$L71289:

; 937  : 	STRIP_SPACES_AROUND(txt, sz);

	cmp	DWORD PTR _txt$[ebp], 0
	je	SHORT $L71297
$L71292:
	cmp	DWORD PTR _sz$[ebp], 0
	je	SHORT $L71293
	mov	eax, DWORD PTR _txt$[ebp]
	movsx	ecx, BYTE PTR [eax]
	push	ecx
	push	OFFSET FLAT:$SG71294
	call	_strchr
	add	esp, 8
	test	eax, eax
	je	SHORT $L71293
	mov	edx, DWORD PTR _txt$[ebp]
	add	edx, 1
	mov	DWORD PTR _txt$[ebp], edx
	mov	eax, DWORD PTR _sz$[ebp]
	sub	eax, 1
	mov	DWORD PTR _sz$[ebp], eax
	jmp	SHORT $L71292
$L71293:
	cmp	DWORD PTR _sz$[ebp], 0
	je	SHORT $L71297
	mov	ecx, DWORD PTR _txt$[ebp]
	add	ecx, DWORD PTR _sz$[ebp]
	movsx	edx, BYTE PTR [ecx-1]
	push	edx
	push	OFFSET FLAT:$SG71298
	call	_strchr
	add	esp, 8
	test	eax, eax
	je	SHORT $L71297
	mov	eax, DWORD PTR _sz$[ebp]
	sub	eax, 1
	mov	DWORD PTR _sz$[ebp], eax
	jmp	SHORT $L71293
$L71297:

; 938  : 	if(txt && val->b_relation && !val->IdValue) val->IdValue = strtoul(txt, NULL, 10);

	cmp	DWORD PTR _txt$[ebp], 0
	je	SHORT $L71299
	mov	ecx, DWORD PTR _val$[ebp]
	movsx	edx, BYTE PTR [ecx+12]
	test	edx, edx
	je	SHORT $L71299
	mov	eax, DWORD PTR _val$[ebp]
	cmp	DWORD PTR [eax+32], 0
	jne	SHORT $L71299
	push	10					; 0000000aH
	push	0
	mov	ecx, DWORD PTR _txt$[ebp]
	push	ecx
	call	_strtoul
	add	esp, 12					; 0000000cH
	mov	edx, DWORD PTR _val$[ebp]
	mov	DWORD PTR [edx+32], eax
$L71299:

; 939  : 	if(!( (txt && *txt && sz && !val->b_relation) || val->IdValue) && check < 3) RETURN_OK;

	cmp	DWORD PTR _txt$[ebp], 0
	je	SHORT $L71302
	mov	eax, DWORD PTR _txt$[ebp]
	movsx	ecx, BYTE PTR [eax]
	test	ecx, ecx
	je	SHORT $L71302
	cmp	DWORD PTR _sz$[ebp], 0
	je	SHORT $L71302
	mov	edx, DWORD PTR _val$[ebp]
	movsx	eax, BYTE PTR [edx+12]
	test	eax, eax
	je	SHORT $L71301
$L71302:
	mov	ecx, DWORD PTR _val$[ebp]
	cmp	DWORD PTR [ecx+32], 0
	jne	SHORT $L71301
	cmp	DWORD PTR _check$[ebp], 3
	jge	SHORT $L71301
	jmp	$eva_noerr$71288
$L71301:

; 940  : 
; 941  : 	/* Determine storage type */
; 942  : 	storage = (val->b_relation && val->IdValue) ? 3 : 1;

	mov	edx, DWORD PTR _val$[ebp]
	movsx	eax, BYTE PTR [edx+12]
	test	eax, eax
	je	SHORT $L72091
	mov	ecx, DWORD PTR _val$[ebp]
	cmp	DWORD PTR [ecx+32], 0
	je	SHORT $L72091
	mov	DWORD PTR -176+[ebp], 3
	jmp	SHORT $L72092
$L72091:
	mov	DWORD PTR -176+[ebp], 1
$L72092:
	mov	edx, DWORD PTR -176+[ebp]
	mov	DWORD PTR _storage$[ebp], edx

; 943  : 
; 944  : 	/* Search & Create field name value if needed */
; 945  : 	if(!val->IdField &&
; 946  : 		sql_add_value(cntxt, val->field, strlen(val->field), &val->IdField)) STACK_ERROR;

	mov	eax, DWORD PTR _val$[ebp]
	cmp	DWORD PTR [eax+28], 0
	jne	SHORT $L71303
	mov	ecx, DWORD PTR _val$[ebp]
	add	ecx, 28					; 0000001cH
	push	ecx
	mov	edx, DWORD PTR _val$[ebp]
	mov	eax, DWORD PTR [edx+8]
	push	eax
	call	_strlen
	add	esp, 4
	push	eax
	mov	ecx, DWORD PTR _val$[ebp]
	mov	edx, DWORD PTR [ecx+8]
	push	edx
	mov	eax, DWORD PTR _cntxt$[ebp]
	push	eax
	call	_sql_add_value
	add	esp, 16					; 00000010H
	test	eax, eax
	je	SHORT $L71303
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 946		; 000003b2H
	jmp	$eva_err$71304
$L71303:

; 947  : 
; 948  : 	/* Return if no field */
; 949  : 	if(!val->IdField) RETURN_OK;

	mov	edx, DWORD PTR _val$[ebp]
	cmp	DWORD PTR [edx+28], 0
	jne	SHORT $L71305
	jmp	$eva_noerr$71288
$L71305:

; 950  : 
; 951  : 	/* Search & Create value if needed */
; 952  : 	if(storage == 1 && !val->IdValue &&
; 953  : 		sql_add_value(cntxt, txt, sz, &val->IdValue)) STACK_ERROR;

	cmp	DWORD PTR _storage$[ebp], 1
	jne	SHORT $L71306
	mov	eax, DWORD PTR _val$[ebp]
	cmp	DWORD PTR [eax+32], 0
	jne	SHORT $L71306
	mov	ecx, DWORD PTR _val$[ebp]
	add	ecx, 32					; 00000020H
	push	ecx
	mov	edx, DWORD PTR _sz$[ebp]
	push	edx
	mov	eax, DWORD PTR _txt$[ebp]
	push	eax
	mov	ecx, DWORD PTR _cntxt$[ebp]
	push	ecx
	call	_sql_add_value
	add	esp, 16					; 00000010H
	test	eax, eax
	je	SHORT $L71306
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 953		; 000003b9H
	jmp	$eva_err$71304
$L71306:

; 954  : 
; 955  : 	/* Check if record exists */
; 956  : 	if(check)

	cmp	DWORD PTR _check$[ebp], 0
	je	$L71366

; 958  : 		int b_exist = 0;

	mov	DWORD PTR _b_exist$71308[ebp], 0

; 962  : 			"-- qry_add_val : Check if record exists\n"
; 963  : 			"SELECT Pkey,IdRelObj,IdValue FROM TLink WHERE DateDel Is NULL AND IdObj=", val->IdObj, "");

	push	0
	push	OFFSET FLAT:$SG71310
	mov	eax, DWORD PTR _val$[ebp]
	mov	ecx, DWORD PTR [eax+20]
	push	ecx
	push	112					; 00000070H
	push	OFFSET FLAT:$SG71311
	lea	edx, DWORD PTR _sql$[ebp]
	push	edx
	call	_dynbuf_add3_int
	add	esp, 24					; 00000018H
	test	eax, eax
	je	SHORT $L71309
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29872], OFFSET FLAT:$SG71313
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 963		; 000003c3H
	jmp	$eva_err$71304
$L71309:

; 964  : 		DYNBUF_ADD3_INT(&sql, " AND IdField=", val->IdField, "");

	push	0
	push	OFFSET FLAT:$SG71315
	mov	edx, DWORD PTR _val$[ebp]
	mov	eax, DWORD PTR [edx+28]
	push	eax
	push	13					; 0000000dH
	push	OFFSET FLAT:$SG71316
	lea	ecx, DWORD PTR _sql$[ebp]
	push	ecx
	call	_dynbuf_add3_int
	add	esp, 24					; 00000018H
	test	eax, eax
	je	SHORT $L71314
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29872], OFFSET FLAT:$SG71318
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 964		; 000003c4H
	jmp	$eva_err$71304
$L71314:

; 965  : 		if(check == 2)

	cmp	DWORD PTR _check$[ebp], 2
	jne	$L71330

; 967  : 			if(val->Num) DYNBUF_ADD3_INT(&sql, " AND Num=", val->Num, NULL);

	mov	ecx, DWORD PTR _val$[ebp]
	cmp	DWORD PTR [ecx+36], 0
	je	SHORT $L71323
	push	3
	push	0
	mov	edx, DWORD PTR _val$[ebp]
	mov	eax, DWORD PTR [edx+36]
	push	eax
	push	9
	push	OFFSET FLAT:$SG71324
	lea	ecx, DWORD PTR _sql$[ebp]
	push	ecx
	call	_dynbuf_add3_int
	add	esp, 24					; 00000018H
	test	eax, eax
	je	SHORT $L71323
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29872], OFFSET FLAT:$SG71326
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 967		; 000003c7H
	jmp	$eva_err$71304
$L71323:

; 968  : 			if(val->Line) DYNBUF_ADD3_INT(&sql, " AND Line=", val->Line, NULL);

	mov	ecx, DWORD PTR _val$[ebp]
	cmp	DWORD PTR [ecx+40], 0
	je	SHORT $L71330
	push	3
	push	0
	mov	edx, DWORD PTR _val$[ebp]
	mov	eax, DWORD PTR [edx+40]
	push	eax
	push	10					; 0000000aH
	push	OFFSET FLAT:$SG71331
	lea	ecx, DWORD PTR _sql$[ebp]
	push	ecx
	call	_dynbuf_add3_int
	add	esp, 24					; 00000018H
	test	eax, eax
	je	SHORT $L71330
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29872], OFFSET FLAT:$SG71333
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 968		; 000003c8H
	jmp	$eva_err$71304
$L71330:

; 970  : 		if(check < 3) switch(storage)

	cmp	DWORD PTR _check$[ebp], 3
	jge	$L71336

; 971  : 		{

	mov	ecx, DWORD PTR _storage$[ebp]
	mov	DWORD PTR -180+[ebp], ecx
	cmp	DWORD PTR -180+[ebp], 3
	je	SHORT $L71339
	jmp	SHORT $L71345
$L71339:

; 972  : 		case 3: DYNBUF_ADD3_INT(&sql, " AND IdRelObj=", val->IdValue, ""); break;

	push	0
	push	OFFSET FLAT:$SG71341
	mov	edx, DWORD PTR _val$[ebp]
	mov	eax, DWORD PTR [edx+32]
	push	eax
	push	14					; 0000000eH
	push	OFFSET FLAT:$SG71342
	lea	ecx, DWORD PTR _sql$[ebp]
	push	ecx
	call	_dynbuf_add3_int
	add	esp, 24					; 00000018H
	test	eax, eax
	je	SHORT $L71340
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29872], OFFSET FLAT:$SG71344
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 972		; 000003ccH
	jmp	$eva_err$71304
$L71340:
	jmp	SHORT $L71336
$L71345:

; 973  : 		default: DYNBUF_ADD3_INT(&sql, " AND IdValue=", val->IdValue, "");

	push	0
	push	OFFSET FLAT:$SG71347
	mov	ecx, DWORD PTR _val$[ebp]
	mov	edx, DWORD PTR [ecx+32]
	push	edx
	push	13					; 0000000dH
	push	OFFSET FLAT:$SG71348
	lea	eax, DWORD PTR _sql$[ebp]
	push	eax
	call	_dynbuf_add3_int
	add	esp, 24					; 00000018H
	test	eax, eax
	je	SHORT $L71346
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29872], OFFSET FLAT:$SG71350
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 973		; 000003cdH
	jmp	$eva_err$71304
$L71346:
$L71336:

; 975  : 		if(sql_exec_query(cntxt, sql->data) || sql_get_table(cntxt, &sqlres, 0)) STACK_ERROR;

	mov	eax, DWORD PTR _sql$[ebp]
	add	eax, 8
	push	eax
	mov	ecx, DWORD PTR _cntxt$[ebp]
	push	ecx
	call	_sql_exec_query
	add	esp, 8
	test	eax, eax
	jne	SHORT $L71352
	push	0
	lea	edx, DWORD PTR _sqlres$[ebp]
	push	edx
	mov	eax, DWORD PTR _cntxt$[ebp]
	push	eax
	call	_sql_get_table
	add	esp, 12					; 0000000cH
	test	eax, eax
	je	SHORT $L71351
$L71352:
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 975		; 000003cfH
	jmp	$eva_err$71304
$L71351:

; 976  : 		M_FREE(sql);

	mov	edx, DWORD PTR _sql$[ebp]
	push	edx
	call	_mem_free
	add	esp, 4
	mov	DWORD PTR _sql$[ebp], 0

; 977  : 
; 978  : 		/* Return if record exists */
; 979  : 		if(sqlres.nbrows && check != 3)

	cmp	DWORD PTR _sqlres$[ebp], 0
	je	SHORT $L71353
	cmp	DWORD PTR _check$[ebp], 3
	je	SHORT $L71353

; 981  : 			if(pkey) *pkey = 0;

	cmp	DWORD PTR _pkey$[ebp], 0
	je	SHORT $L71354
	mov	eax, DWORD PTR _pkey$[ebp]
	mov	DWORD PTR [eax], 0
$L71354:

; 982  : 			RETURN_OK;

	jmp	$eva_noerr$71288
$L71353:

; 984  : 
; 985  : 		/* Delete old values where applicable */
; 986  : 		if(check == 3)

	cmp	DWORD PTR _check$[ebp], 3
	jne	$L71366

; 988  : 			for(i = 0; i < sqlres.nbrows; i++)

	mov	DWORD PTR _i$[ebp], 0
	jmp	SHORT $L71356
$L71357:
	mov	ecx, DWORD PTR _i$[ebp]
	add	ecx, 1
	mov	DWORD PTR _i$[ebp], ecx
$L71356:
	mov	edx, DWORD PTR _i$[ebp]
	cmp	edx, DWORD PTR _sqlres$[ebp]
	jae	$L71358

; 990  : 				if(val->IdValue && (val->b_relation ?
; 991  : 					val->IdValue == DYNTAB_TOULRC(&sqlres, i, 1) :
; 992  : 					val->IdValue == DYNTAB_TOULRC(&sqlres, i, 2))) b_exist = 1;

	mov	eax, DWORD PTR _val$[ebp]
	cmp	DWORD PTR [eax+32], 0
	je	SHORT $L71361
	mov	ecx, DWORD PTR _val$[ebp]
	movsx	edx, BYTE PTR [ecx+12]
	test	edx, edx
	je	SHORT $L72093
	push	10					; 0000000aH
	push	0
	push	1
	mov	eax, DWORD PTR _i$[ebp]
	push	eax
	lea	ecx, DWORD PTR _sqlres$[ebp]
	push	ecx
	call	_dyntab_val
	add	esp, 12					; 0000000cH
	push	eax
	call	_strtoul
	add	esp, 12					; 0000000cH
	mov	edx, DWORD PTR _val$[ebp]
	xor	ecx, ecx
	cmp	DWORD PTR [edx+32], eax
	sete	cl
	mov	DWORD PTR -184+[ebp], ecx
	jmp	SHORT $L72094
$L72093:
	push	10					; 0000000aH
	push	0
	push	2
	mov	edx, DWORD PTR _i$[ebp]
	push	edx
	lea	eax, DWORD PTR _sqlres$[ebp]
	push	eax
	call	_dyntab_val
	add	esp, 12					; 0000000cH
	push	eax
	call	_strtoul
	add	esp, 12					; 0000000cH
	mov	ecx, DWORD PTR _val$[ebp]
	xor	edx, edx
	cmp	DWORD PTR [ecx+32], eax
	sete	dl
	mov	DWORD PTR -184+[ebp], edx
$L72094:
	cmp	DWORD PTR -184+[ebp], 0
	je	SHORT $L71361
	mov	DWORD PTR _b_exist$71308[ebp], 1

; 993  : 				else

	jmp	SHORT $L71365
$L71361:

; 995  : 					char qry[128];
; 996  : 					snprintf(qry, sizeof(qry),
; 997  : 							"UPDATE TLink SET DateDel='%s', IdWhoDel=%s WHERE Pkey=%s",
; 998  : 						cntxt->timestamp, dyntab_val(&cntxt->id_user, 0, 0), dyntab_val(&sqlres, i, 0));

	push	0
	mov	eax, DWORD PTR _i$[ebp]
	push	eax
	lea	ecx, DWORD PTR _sqlres$[ebp]
	push	ecx
	call	_dyntab_val
	add	esp, 12					; 0000000cH
	push	eax
	push	0
	push	0
	mov	edx, DWORD PTR _cntxt$[ebp]
	add	edx, 29408				; 000072e0H
	push	edx
	call	_dyntab_val
	add	esp, 12					; 0000000cH
	push	eax
	mov	eax, DWORD PTR _cntxt$[ebp]
	add	eax, 29704				; 00007408H
	push	eax
	push	OFFSET FLAT:$SG71364
	push	128					; 00000080H
	lea	ecx, DWORD PTR _qry$71363[ebp]
	push	ecx
	call	__snprintf
	add	esp, 24					; 00000018H

; 999  : 					if(sql_exec_query(cntxt, qry)) STACK_ERROR;

	lea	edx, DWORD PTR _qry$71363[ebp]
	push	edx
	mov	eax, DWORD PTR _cntxt$[ebp]
	push	eax
	call	_sql_exec_query
	add	esp, 8
	test	eax, eax
	je	SHORT $L71365
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 999		; 000003e7H
	jmp	$eva_err$71304
$L71365:

; 1001 : 			}

	jmp	$L71357
$L71358:

; 1002 : 			if(b_exist) RETURN_OK;

	cmp	DWORD PTR _b_exist$71308[ebp], 0
	je	SHORT $L71366
	jmp	$eva_noerr$71288
$L71366:

; 1005 : 
; 1006 : 	/* Return if no value */
; 1007 : 	if(!val->IdValue) RETURN_OK;

	mov	edx, DWORD PTR _val$[ebp]
	cmp	DWORD PTR [edx+32], 0
	jne	SHORT $L71367
	jmp	$eva_noerr$71288
$L71367:

; 1008 : 
; 1009 : 	/* UPDATE / INSERT where applicable */
; 1010 : 	if(!val->Num) val->Num = 1;

	mov	eax, DWORD PTR _val$[ebp]
	cmp	DWORD PTR [eax+36], 0
	jne	SHORT $L71368
	mov	ecx, DWORD PTR _val$[ebp]
	mov	DWORD PTR [ecx+36], 1
$L71368:

; 1011 : 	if(pkey && *pkey)

	cmp	DWORD PTR _pkey$[ebp], 0
	je	SHORT $L71369
	mov	edx, DWORD PTR _pkey$[ebp]
	cmp	DWORD PTR [edx], 0
	je	SHORT $L71369

; 1012 : 		DYNBUF_ADD_STR(&sql, "-- Update TLink record\nUPDATE")

	push	0
	push	0
	push	29					; 0000001dH
	push	OFFSET FLAT:$SG71372
	lea	eax, DWORD PTR _sql$[ebp]
	push	eax
	call	_dynbuf_add
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L71371
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29872], OFFSET FLAT:$SG71374
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 1012		; 000003f4H
	jmp	$eva_err$71304
$L71371:

; 1013 : 	else

	jmp	SHORT $L71377
$L71369:

; 1014 : 		DYNBUF_ADD_STR(&sql, "-- Insert TLink record\nINSERT");

	push	0
	push	0
	push	29					; 0000001dH
	push	OFFSET FLAT:$SG71378
	lea	eax, DWORD PTR _sql$[ebp]
	push	eax
	call	_dynbuf_add
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L71377
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29872], OFFSET FLAT:$SG71380
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 1014		; 000003f6H
	jmp	$eva_err$71304
$L71377:

; 1015 : 
; 1016 : 
; 1017 : 	/* Prepare query with new values */
; 1018 : 	DYNBUF_ADD3_INT(&sql, " TLink SET IdObj=", val->IdObj, ", IdField=");

	push	10					; 0000000aH
	push	OFFSET FLAT:$SG71382
	mov	eax, DWORD PTR _val$[ebp]
	mov	ecx, DWORD PTR [eax+20]
	push	ecx
	push	17					; 00000011H
	push	OFFSET FLAT:$SG71383
	lea	edx, DWORD PTR _sql$[ebp]
	push	edx
	call	_dynbuf_add3_int
	add	esp, 24					; 00000018H
	test	eax, eax
	je	SHORT $L71381
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29872], OFFSET FLAT:$SG71385
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 1018		; 000003faH
	jmp	$eva_err$71304
$L71381:

; 1019 : 	DYNBUF_ADD_INT(&sql, val->IdField);

	mov	edx, DWORD PTR _val$[ebp]
	mov	eax, DWORD PTR [edx+28]
	push	eax
	lea	ecx, DWORD PTR _sql$[ebp]
	push	ecx
	call	_dynbuf_add_int
	add	esp, 8
	test	eax, eax
	je	SHORT $L71386
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29872], OFFSET FLAT:$SG71388
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 1019		; 000003fbH
	jmp	$eva_err$71304
$L71386:

; 1020 : 	switch(storage)
; 1021 : 	{

	mov	ecx, DWORD PTR _storage$[ebp]
	mov	DWORD PTR -188+[ebp], ecx
	cmp	DWORD PTR -188+[ebp], 3
	je	SHORT $L71393
	jmp	SHORT $L71399
$L71393:

; 1022 : 	case 3: DYNBUF_ADD3_INT(&sql, ",IdRelObj=", val->IdValue, ""); break;

	push	0
	push	OFFSET FLAT:$SG71395
	mov	edx, DWORD PTR _val$[ebp]
	mov	eax, DWORD PTR [edx+32]
	push	eax
	push	10					; 0000000aH
	push	OFFSET FLAT:$SG71396
	lea	ecx, DWORD PTR _sql$[ebp]
	push	ecx
	call	_dynbuf_add3_int
	add	esp, 24					; 00000018H
	test	eax, eax
	je	SHORT $L71394
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29872], OFFSET FLAT:$SG71398
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 1022		; 000003feH
	jmp	$eva_err$71304
$L71394:
	jmp	SHORT $L71390
$L71399:

; 1023 : 	default: DYNBUF_ADD3_INT(&sql, ",IdValue=", val->IdValue, "");

	push	0
	push	OFFSET FLAT:$SG71401
	mov	ecx, DWORD PTR _val$[ebp]
	mov	edx, DWORD PTR [ecx+32]
	push	edx
	push	9
	push	OFFSET FLAT:$SG71402
	lea	eax, DWORD PTR _sql$[ebp]
	push	eax
	call	_dynbuf_add3_int
	add	esp, 24					; 00000018H
	test	eax, eax
	je	SHORT $L71400
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29872], OFFSET FLAT:$SG71404
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 1023		; 000003ffH
	jmp	$eva_err$71304
$L71400:
$L71390:

; 1025 : 	DYNBUF_ADD3_INT(&sql, ", Num=", val->Num, "");

	push	0
	push	OFFSET FLAT:$SG71406
	mov	eax, DWORD PTR _val$[ebp]
	mov	ecx, DWORD PTR [eax+36]
	push	ecx
	push	6
	push	OFFSET FLAT:$SG71407
	lea	edx, DWORD PTR _sql$[ebp]
	push	edx
	call	_dynbuf_add3_int
	add	esp, 24					; 00000018H
	test	eax, eax
	je	SHORT $L71405
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29872], OFFSET FLAT:$SG71409
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 1025		; 00000401H
	jmp	$eva_err$71304
$L71405:

; 1026 : 	if(val->Line) DYNBUF_ADD3_INT(&sql, ", Line=", val->Line, "");

	mov	edx, DWORD PTR _val$[ebp]
	cmp	DWORD PTR [edx+40], 0
	je	SHORT $L71411
	push	0
	push	OFFSET FLAT:$SG71412
	mov	eax, DWORD PTR _val$[ebp]
	mov	ecx, DWORD PTR [eax+40]
	push	ecx
	push	7
	push	OFFSET FLAT:$SG71413
	lea	edx, DWORD PTR _sql$[ebp]
	push	edx
	call	_dynbuf_add3_int
	add	esp, 24					; 00000018H
	test	eax, eax
	je	SHORT $L71411
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29872], OFFSET FLAT:$SG71415
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 1026		; 00000402H
	jmp	$eva_err$71304
$L71411:

; 1027 : 	SQL_STAMP_RECORD(&sql)

	push	10					; 0000000aH
	push	OFFSET FLAT:$SG71418
	push	0
	push	0
	push	14					; 0000000eH
	mov	edx, DWORD PTR _cntxt$[ebp]
	add	edx, 29704				; 00007408H
	push	edx
	push	9
	push	OFFSET FLAT:$SG71419
	lea	eax, DWORD PTR _sql$[ebp]
	push	eax
	call	_dynbuf_add3
	add	esp, 36					; 00000024H
	test	eax, eax
	je	SHORT $L71417
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29872], OFFSET FLAT:$SG71421
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 1027		; 00000403H
	jmp	$eva_err$71304
$L71417:
	push	0
	push	0
	mov	eax, DWORD PTR _cntxt$[ebp]
	add	eax, 29408				; 000072e0H
	push	eax
	call	_dyntab_sz
	add	esp, 12					; 0000000cH
	test	eax, eax
	je	SHORT $L71422
	push	0
	push	0
	push	0
	push	0
	mov	ecx, DWORD PTR _cntxt$[ebp]
	add	ecx, 29408				; 000072e0H
	push	ecx
	call	_dyntab_sz
	add	esp, 12					; 0000000cH
	push	eax
	push	0
	push	0
	mov	edx, DWORD PTR _cntxt$[ebp]
	add	edx, 29408				; 000072e0H
	push	edx
	call	_dyntab_val
	add	esp, 12					; 0000000cH
	push	eax
	lea	eax, DWORD PTR _sql$[ebp]
	push	eax
	call	_dynbuf_add
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L71424
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29872], OFFSET FLAT:$SG71426
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 1027		; 00000403H
	jmp	$eva_err$71304
$L71424:
	jmp	SHORT $L71429
$L71422:
	push	0
	push	0
	push	4
	push	OFFSET FLAT:$SG71430
	lea	eax, DWORD PTR _sql$[ebp]
	push	eax
	call	_dynbuf_add
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L71429
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29872], OFFSET FLAT:$SG71432
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 1027		; 00000403H
	jmp	$eva_err$71304
$L71429:

; 1028 : 
; 1029 : 	/* Select record to update if applicable */
; 1030 : 	if(pkey && *pkey) DYNBUF_ADD3_INT(&sql," WHERE Pkey=", *pkey, "");

	cmp	DWORD PTR _pkey$[ebp], 0
	je	SHORT $L71434
	mov	eax, DWORD PTR _pkey$[ebp]
	cmp	DWORD PTR [eax], 0
	je	SHORT $L71434
	push	0
	push	OFFSET FLAT:$SG71435
	mov	ecx, DWORD PTR _pkey$[ebp]
	mov	edx, DWORD PTR [ecx]
	push	edx
	push	12					; 0000000cH
	push	OFFSET FLAT:$SG71436
	lea	eax, DWORD PTR _sql$[ebp]
	push	eax
	call	_dynbuf_add3_int
	add	esp, 24					; 00000018H
	test	eax, eax
	je	SHORT $L71434
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29872], OFFSET FLAT:$SG71438
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 1030		; 00000406H
	jmp	SHORT $eva_err$71304
$L71434:

; 1031 : 
; 1032 : 
; 1033 : 	/* Exec query & return new Pkey if applicable */
; 1034 : 	if(sql_exec_query(cntxt , sql->data)) STACK_ERROR;

	mov	eax, DWORD PTR _sql$[ebp]
	add	eax, 8
	push	eax
	mov	ecx, DWORD PTR _cntxt$[ebp]
	push	ecx
	call	_sql_exec_query
	add	esp, 8
	test	eax, eax
	je	SHORT $L71439
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 1034		; 0000040aH
	jmp	SHORT $eva_err$71304
$L71439:

; 1035 : 	if(pkey && !*pkey) *pkey = sql_insert_id(cntxt);

	cmp	DWORD PTR _pkey$[ebp], 0
	je	SHORT $eva_noerr$71288
	mov	eax, DWORD PTR _pkey$[ebp]
	cmp	DWORD PTR [eax], 0
	jne	SHORT $eva_noerr$71288
	mov	ecx, DWORD PTR _cntxt$[ebp]
	push	ecx
	call	_sql_insert_id
	add	esp, 4
	mov	edx, DWORD PTR _pkey$[ebp]
	mov	DWORD PTR [edx], eax
$eva_noerr$71288:

; 1036 : 
; 1037 : 	RETURN_OK_CLEANUP;

	push	0
	push	OFFSET FLAT:$SG71441
	push	OFFSET FLAT:$SG71442
	mov	eax, DWORD PTR _cntxt$[ebp]
	push	eax
	call	_err_clear
	add	esp, 16					; 00000010H
$eva_err$71304:
	mov	ecx, DWORD PTR _cntxt$[ebp]
	cmp	DWORD PTR [ecx+29872], 0
	je	SHORT $L71443
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	eax, DWORD PTR [edx+29900]
	push	eax
	push	OFFSET FLAT:$SG71444
	push	OFFSET FLAT:$SG71445
	mov	ecx, DWORD PTR _cntxt$[ebp]
	push	ecx
	call	_err_add_context
	add	esp, 16					; 00000010H
$L71443:
	lea	edx, DWORD PTR _sqlres$[ebp]
	push	edx
	call	_dyntab_free
	add	esp, 4
	mov	eax, DWORD PTR _sql$[ebp]
	push	eax
	call	_mem_free
	add	esp, 4
	mov	DWORD PTR _sql$[ebp], 0
	mov	ecx, DWORD PTR _cntxt$[ebp]
	xor	eax, eax
	cmp	DWORD PTR [ecx+29872], 0
	setne	al

; 1038 : }

	mov	esp, ebp
	pop	ebp
	ret	0
_qry_add_val ENDP
_TEXT	ENDS
PUBLIC	_qry_update_idobj_idfield_1
_DATA	SEGMENT
$SG71465 DB	'D:\Travail\ABI\EVA\V4.0\CGI\Brunix-2016\qry_utils.c', 00H
$SG71466 DB	'qry_update_idobj_idfield_1', 00H
	ORG $+1
$SG71468 DB	'D:\Travail\ABI\EVA\V4.0\CGI\Brunix-2016\qry_utils.c', 00H
$SG71469 DB	'qry_update_idobj_idfield_1', 00H
_DATA	ENDS
_TEXT	SEGMENT
_cntxt$ = 8
_idobj$ = 12
_idfield$ = 16
_txt$ = 20
_len$ = 24
_val$ = -64
_qry_update_idobj_idfield_1 PROC NEAR

; 1053 : ){

	push	ebp
	mov	ebp, esp
	sub	esp, 64					; 00000040H
	push	edi

; 1054 : 	DynTableCell val = {0};

	mov	DWORD PTR _val$[ebp], 0
	mov	ecx, 15					; 0000000fH
	xor	eax, eax
	lea	edi, DWORD PTR _val$[ebp+4]
	rep stosd

; 1055 : 
; 1056 : 	/* Fill value attributes */
; 1057 : 	val.IdObj = idobj;

	mov	eax, DWORD PTR _idobj$[ebp]
	mov	DWORD PTR _val$[ebp+20], eax

; 1058 : 	val.IdField = idfield;

	mov	ecx, DWORD PTR _idfield$[ebp]
	mov	DWORD PTR _val$[ebp+28], ecx

; 1059 : 	val.txt = txt;

	mov	edx, DWORD PTR _txt$[ebp]
	mov	DWORD PTR _val$[ebp], edx

; 1060 : 	val.len = len;

	mov	eax, DWORD PTR _len$[ebp]
	mov	DWORD PTR _val$[ebp+4], eax

; 1061 : 	val.Num = 1;

	mov	DWORD PTR _val$[ebp+36], 1

; 1062 : 
; 1063 : 	/* Add new value in db */
; 1064 : 	if(qry_add_val(cntxt, &val, 3, NULL)) STACK_ERROR;

	push	0
	push	3
	lea	ecx, DWORD PTR _val$[ebp]
	push	ecx
	mov	edx, DWORD PTR _cntxt$[ebp]
	push	edx
	call	_qry_add_val
	add	esp, 16					; 00000010H
	test	eax, eax
	je	SHORT $eva_noerr$71464
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 1064		; 00000428H
	jmp	SHORT $eva_err$71463
$eva_noerr$71464:

; 1065 : 
; 1066 : 	RETURN_OK_CLEANUP;

	push	0
	push	OFFSET FLAT:$SG71465
	push	OFFSET FLAT:$SG71466
	mov	ecx, DWORD PTR _cntxt$[ebp]
	push	ecx
	call	_err_clear
	add	esp, 16					; 00000010H
$eva_err$71463:
	mov	edx, DWORD PTR _cntxt$[ebp]
	cmp	DWORD PTR [edx+29872], 0
	je	SHORT $L71467
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	ecx, DWORD PTR [eax+29900]
	push	ecx
	push	OFFSET FLAT:$SG71468
	push	OFFSET FLAT:$SG71469
	mov	edx, DWORD PTR _cntxt$[ebp]
	push	edx
	call	_err_add_context
	add	esp, 16					; 00000010H
$L71467:
	mov	eax, DWORD PTR _cntxt$[ebp]
	xor	ecx, ecx
	cmp	DWORD PTR [eax+29872], 0
	setne	cl
	mov	eax, ecx

; 1067 : }

	pop	edi
	mov	esp, ebp
	pop	ebp
	ret	0
_qry_update_idobj_idfield_1 ENDP
_TEXT	ENDS
PUBLIC	_qry_add_idobj_field_val
_DATA	SEGMENT
	ORG $+1
$SG71495 DB	'D:\Travail\ABI\EVA\V4.0\CGI\Brunix-2016\qry_utils.c', 00H
$SG71496 DB	'qry_add_idobj_field_val', 00H
$SG71498 DB	'D:\Travail\ABI\EVA\V4.0\CGI\Brunix-2016\qry_utils.c', 00H
$SG71499 DB	'qry_add_idobj_field_val', 00H
_DATA	ENDS
_TEXT	SEGMENT
_cntxt$ = 8
_id_obj$ = 12
_field$ = 16
_txt$ = 20
_sz$ = 24
_num$ = 28
_line$ = 32
_check$ = 36
_val$ = -64
_qry_add_idobj_field_val PROC NEAR

; 1085 : ){

	push	ebp
	mov	ebp, esp
	sub	esp, 68					; 00000044H
	push	edi

; 1086 : 	DynTableCell val = {0};

	mov	DWORD PTR _val$[ebp], 0
	mov	ecx, 15					; 0000000fH
	xor	eax, eax
	lea	edi, DWORD PTR _val$[ebp+4]
	rep stosd

; 1087 : 
; 1088 : 	/* Fill value attributes */
; 1089 : 	val.IdObj = id_obj;

	mov	eax, DWORD PTR _id_obj$[ebp]
	mov	DWORD PTR _val$[ebp+20], eax

; 1090 : 	val.field = field;

	mov	ecx, DWORD PTR _field$[ebp]
	mov	DWORD PTR _val$[ebp+8], ecx

; 1091 : 	val.txt = txt;

	mov	edx, DWORD PTR _txt$[ebp]
	mov	DWORD PTR _val$[ebp], edx

; 1092 : 	val.len = sz;

	mov	eax, DWORD PTR _sz$[ebp]
	mov	DWORD PTR _val$[ebp+4], eax

; 1093 : 	val.Num = num ? num : 1;

	cmp	DWORD PTR _num$[ebp], 0
	je	SHORT $L72097
	mov	ecx, DWORD PTR _num$[ebp]
	mov	DWORD PTR -68+[ebp], ecx
	jmp	SHORT $L72098
$L72097:
	mov	DWORD PTR -68+[ebp], 1
$L72098:
	mov	edx, DWORD PTR -68+[ebp]
	mov	DWORD PTR _val$[ebp+36], edx

; 1094 : 	val.Line = line;

	mov	eax, DWORD PTR _line$[ebp]
	mov	DWORD PTR _val$[ebp+40], eax

; 1095 : 
; 1096 : 	/* Add new value in db */
; 1097 : 	if(qry_add_val(cntxt, &val, check, NULL)) STACK_ERROR;

	push	0
	mov	ecx, DWORD PTR _check$[ebp]
	push	ecx
	lea	edx, DWORD PTR _val$[ebp]
	push	edx
	mov	eax, DWORD PTR _cntxt$[ebp]
	push	eax
	call	_qry_add_val
	add	esp, 16					; 00000010H
	test	eax, eax
	je	SHORT $eva_noerr$71494
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 1097		; 00000449H
	jmp	SHORT $eva_err$71493
$eva_noerr$71494:

; 1098 : 
; 1099 : 	RETURN_OK_CLEANUP;

	push	0
	push	OFFSET FLAT:$SG71495
	push	OFFSET FLAT:$SG71496
	mov	edx, DWORD PTR _cntxt$[ebp]
	push	edx
	call	_err_clear
	add	esp, 16					; 00000010H
$eva_err$71493:
	mov	eax, DWORD PTR _cntxt$[ebp]
	cmp	DWORD PTR [eax+29872], 0
	je	SHORT $L71497
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	edx, DWORD PTR [ecx+29900]
	push	edx
	push	OFFSET FLAT:$SG71498
	push	OFFSET FLAT:$SG71499
	mov	eax, DWORD PTR _cntxt$[ebp]
	push	eax
	call	_err_add_context
	add	esp, 16					; 00000010H
$L71497:
	mov	ecx, DWORD PTR _cntxt$[ebp]
	xor	eax, eax
	cmp	DWORD PTR [ecx+29872], 0
	setne	al

; 1100 : }

	pop	edi
	mov	esp, ebp
	pop	ebp
	ret	0
_qry_add_idobj_field_val ENDP
_TEXT	ENDS
PUBLIC	_qry_add_idobj_field_rel
_DATA	SEGMENT
$SG71522 DB	'%lu', 00H
$SG71526 DB	'D:\Travail\ABI\EVA\V4.0\CGI\Brunix-2016\qry_utils.c', 00H
$SG71527 DB	'qry_add_idobj_field_rel', 00H
$SG71529 DB	'D:\Travail\ABI\EVA\V4.0\CGI\Brunix-2016\qry_utils.c', 00H
$SG71530 DB	'qry_add_idobj_field_rel', 00H
_DATA	ENDS
_TEXT	SEGMENT
_cntxt$ = 8
_id_obj$ = 12
_field$ = 16
_idrelobj$ = 20
_num$ = 24
_line$ = 28
_check$ = 32
_val$ = -64
_txt$ = -80
_qry_add_idobj_field_rel PROC NEAR

; 1118 : ){

	push	ebp
	mov	ebp, esp
	sub	esp, 84					; 00000054H
	push	edi

; 1119 : 	DynTableCell val = {0};

	mov	DWORD PTR _val$[ebp], 0
	mov	ecx, 15					; 0000000fH
	xor	eax, eax
	lea	edi, DWORD PTR _val$[ebp+4]
	rep stosd

; 1120 : 	char txt[16];
; 1121 : 
; 1122 : 	/* Check parameters */
; 1123 : 	if(!idrelobj) RETURN_OK;

	cmp	DWORD PTR _idrelobj$[ebp], 0
	jne	SHORT $L71520
	jmp	SHORT $eva_noerr$71521
$L71520:

; 1124 : 
; 1125 : 	/* Fill value attributes */
; 1126 : 	val.IdObj = id_obj;

	mov	eax, DWORD PTR _id_obj$[ebp]
	mov	DWORD PTR _val$[ebp+20], eax

; 1127 : 	val.field = field;

	mov	ecx, DWORD PTR _field$[ebp]
	mov	DWORD PTR _val$[ebp+8], ecx

; 1128 : 	val.txt = txt;

	lea	edx, DWORD PTR _txt$[ebp]
	mov	DWORD PTR _val$[ebp], edx

; 1129 : 	val.len = snprintf(add_sz_str(txt), "%lu", idrelobj);

	mov	eax, DWORD PTR _idrelobj$[ebp]
	push	eax
	push	OFFSET FLAT:$SG71522
	push	15					; 0000000fH
	lea	ecx, DWORD PTR _txt$[ebp]
	push	ecx
	call	__snprintf
	add	esp, 16					; 00000010H
	mov	DWORD PTR _val$[ebp+4], eax

; 1130 : 	val.b_relation = 1;

	mov	BYTE PTR _val$[ebp+12], 1

; 1131 : 	val.Num = num ? num : 1;

	cmp	DWORD PTR _num$[ebp], 0
	je	SHORT $L72100
	mov	edx, DWORD PTR _num$[ebp]
	mov	DWORD PTR -84+[ebp], edx
	jmp	SHORT $L72101
$L72100:
	mov	DWORD PTR -84+[ebp], 1
$L72101:
	mov	eax, DWORD PTR -84+[ebp]
	mov	DWORD PTR _val$[ebp+36], eax

; 1132 : 	val.Line = line;

	mov	ecx, DWORD PTR _line$[ebp]
	mov	DWORD PTR _val$[ebp+40], ecx

; 1133 : 
; 1134 : 	/* Add new value in db */
; 1135 : 	if(qry_add_val(cntxt, &val, check, NULL)) STACK_ERROR;

	push	0
	mov	edx, DWORD PTR _check$[ebp]
	push	edx
	lea	eax, DWORD PTR _val$[ebp]
	push	eax
	mov	ecx, DWORD PTR _cntxt$[ebp]
	push	ecx
	call	_qry_add_val
	add	esp, 16					; 00000010H
	test	eax, eax
	je	SHORT $eva_noerr$71521
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 1135		; 0000046fH
	jmp	SHORT $eva_err$71525
$eva_noerr$71521:

; 1136 : 
; 1137 : 	RETURN_OK_CLEANUP;

	push	0
	push	OFFSET FLAT:$SG71526
	push	OFFSET FLAT:$SG71527
	mov	eax, DWORD PTR _cntxt$[ebp]
	push	eax
	call	_err_clear
	add	esp, 16					; 00000010H
$eva_err$71525:
	mov	ecx, DWORD PTR _cntxt$[ebp]
	cmp	DWORD PTR [ecx+29872], 0
	je	SHORT $L71528
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	eax, DWORD PTR [edx+29900]
	push	eax
	push	OFFSET FLAT:$SG71529
	push	OFFSET FLAT:$SG71530
	mov	ecx, DWORD PTR _cntxt$[ebp]
	push	ecx
	call	_err_add_context
	add	esp, 16					; 00000010H
$L71528:
	mov	edx, DWORD PTR _cntxt$[ebp]
	xor	eax, eax
	cmp	DWORD PTR [edx+29872], 0
	setne	al

; 1138 : }

	pop	edi
	mov	esp, ebp
	pop	ebp
	ret	0
_qry_add_idobj_field_rel ENDP
_TEXT	ENDS
PUBLIC	_qry_add_obj_field_val
_DATA	SEGMENT
$SG71555 DB	'D:\Travail\ABI\EVA\V4.0\CGI\Brunix-2016\qry_utils.c', 00H
$SG71556 DB	'qry_add_obj_field_val', 00H
	ORG $+2
$SG71558 DB	'D:\Travail\ABI\EVA\V4.0\CGI\Brunix-2016\qry_utils.c', 00H
$SG71559 DB	'qry_add_obj_field_val', 00H
_DATA	ENDS
_TEXT	SEGMENT
_cntxt$ = 8
_id_obj$ = 12
_field$ = 16
_txt$ = 20
_sz$ = 24
_b_relation$ = 28
_numval$ = 32
_val$ = -64
_qry_add_obj_field_val PROC NEAR

; 1155 : ){

	push	ebp
	mov	ebp, esp
	sub	esp, 68					; 00000044H
	push	edi

; 1156 : 	DynTableCell val = {0};

	mov	DWORD PTR _val$[ebp], 0
	mov	ecx, 15					; 0000000fH
	xor	eax, eax
	lea	edi, DWORD PTR _val$[ebp+4]
	rep stosd

; 1157 : 
; 1158 : 	/* Fill value attributes */
; 1159 : 	val.IdObj = DYNTAB_TOULRC(id_obj, 0, 0);

	push	10					; 0000000aH
	push	0
	push	0
	push	0
	mov	eax, DWORD PTR _id_obj$[ebp]
	push	eax
	call	_dyntab_val
	add	esp, 12					; 0000000cH
	push	eax
	call	_strtoul
	add	esp, 12					; 0000000cH
	mov	DWORD PTR _val$[ebp+20], eax

; 1160 : 	val.field = field;

	mov	ecx, DWORD PTR _field$[ebp]
	mov	DWORD PTR _val$[ebp+8], ecx

; 1161 : 	val.txt = txt;

	mov	edx, DWORD PTR _txt$[ebp]
	mov	DWORD PTR _val$[ebp], edx

; 1162 : 	val.len = sz;

	mov	eax, DWORD PTR _sz$[ebp]
	mov	DWORD PTR _val$[ebp+4], eax

; 1163 : 	val.b_relation = b_relation;

	mov	cl, BYTE PTR _b_relation$[ebp]
	mov	BYTE PTR _val$[ebp+12], cl

; 1164 : 	val.Num = numval ? numval : 1;

	cmp	DWORD PTR _numval$[ebp], 0
	je	SHORT $L72103
	mov	edx, DWORD PTR _numval$[ebp]
	mov	DWORD PTR -68+[ebp], edx
	jmp	SHORT $L72104
$L72103:
	mov	DWORD PTR -68+[ebp], 1
$L72104:
	mov	eax, DWORD PTR -68+[ebp]
	mov	DWORD PTR _val$[ebp+36], eax

; 1165 : 
; 1166 : 	/* Add new value in db */
; 1167 : 	if(qry_add_val(cntxt, &val, numval ? 2 : 1, NULL)) STACK_ERROR;

	push	0
	xor	ecx, ecx
	cmp	DWORD PTR _numval$[ebp], 0
	setne	cl
	inc	ecx
	push	ecx
	lea	edx, DWORD PTR _val$[ebp]
	push	edx
	mov	eax, DWORD PTR _cntxt$[ebp]
	push	eax
	call	_qry_add_val
	add	esp, 16					; 00000010H
	test	eax, eax
	je	SHORT $eva_noerr$71554
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 1167		; 0000048fH
	jmp	SHORT $eva_err$71553
$eva_noerr$71554:

; 1168 : 
; 1169 : 	RETURN_OK_CLEANUP;

	push	0
	push	OFFSET FLAT:$SG71555
	push	OFFSET FLAT:$SG71556
	mov	edx, DWORD PTR _cntxt$[ebp]
	push	edx
	call	_err_clear
	add	esp, 16					; 00000010H
$eva_err$71553:
	mov	eax, DWORD PTR _cntxt$[ebp]
	cmp	DWORD PTR [eax+29872], 0
	je	SHORT $L71557
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	edx, DWORD PTR [ecx+29900]
	push	edx
	push	OFFSET FLAT:$SG71558
	push	OFFSET FLAT:$SG71559
	mov	eax, DWORD PTR _cntxt$[ebp]
	push	eax
	call	_err_add_context
	add	esp, 16					; 00000010H
$L71557:
	mov	ecx, DWORD PTR _cntxt$[ebp]
	xor	eax, eax
	cmp	DWORD PTR [ecx+29872], 0
	setne	al

; 1170 : }

	pop	edi
	mov	esp, ebp
	pop	ebp
	ret	0
_qry_add_obj_field_val ENDP
_TEXT	ENDS
PUBLIC	_qry_add_obj_data
_DATA	SEGMENT
	ORG $+2
$SG71597 DB	', DateDel=''', 00H
$SG71598 DB	'UPDATE TLink SET IdWhoDel=', 00H
	ORG $+1
$SG71600 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG71604 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG71607 DB	''' WHERE Pkey IN (', 00H
	ORG $+2
$SG71609 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG71616 DB	',', 00H
	ORG $+2
$SG71618 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG71621 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG71624 DB	')', 00H
	ORG $+2
$SG71626 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG71630 DB	'D:\Travail\ABI\EVA\V4.0\CGI\Brunix-2016\qry_utils.c', 00H
$SG71631 DB	'qry_add_obj_data', 00H
	ORG $+3
$SG71633 DB	'D:\Travail\ABI\EVA\V4.0\CGI\Brunix-2016\qry_utils.c', 00H
$SG71634 DB	'qry_add_obj_data', 00H
_DATA	ENDS
_TEXT	SEGMENT
_cntxt$ = 8
_id_obj$ = 12
_data$ = 16
_formstamp$ = 20
_b_clearprev$ = 24
_i$ = -96
_j$ = -100
_idobj$ = -72
_res$ = -92
_sql$ = -68
_val$ = -64
_qry_add_obj_data PROC NEAR

; 1186 : ){

	push	ebp
	mov	ebp, esp
	sub	esp, 100				; 00000064H

; 1187 : 	unsigned long i, j, idobj;
; 1188 : 	DynTable res = {0};

	mov	DWORD PTR _res$[ebp], 0
	xor	eax, eax
	mov	DWORD PTR _res$[ebp+4], eax
	mov	DWORD PTR _res$[ebp+8], eax
	mov	DWORD PTR _res$[ebp+12], eax
	mov	DWORD PTR _res$[ebp+16], eax

; 1189 : 	DynBuffer *sql = NULL;

	mov	DWORD PTR _sql$[ebp], 0

; 1190 : 	DynTableCell val;
; 1191 : 
; 1192 : 	if(!data || !id_obj || !(dyntab_sz(id_obj, 0, 0) ||dyntab_sz(formstamp, 0, 0))) RETURN_OK;

	cmp	DWORD PTR _data$[ebp], 0
	je	SHORT $L71582
	cmp	DWORD PTR _id_obj$[ebp], 0
	je	SHORT $L71582
	push	0
	push	0
	mov	ecx, DWORD PTR _id_obj$[ebp]
	push	ecx
	call	_dyntab_sz
	add	esp, 12					; 0000000cH
	test	eax, eax
	jne	SHORT $L71581
	push	0
	push	0
	mov	edx, DWORD PTR _formstamp$[ebp]
	push	edx
	call	_dyntab_sz
	add	esp, 12					; 0000000cH
	test	eax, eax
	jne	SHORT $L71581
$L71582:
	jmp	$eva_noerr$71583
$L71581:

; 1193 : 
; 1194 : 	/* Create new object number if current is null or new */
; 1195 : 	if(!dyntab_sz(id_obj, 0, 0) && qry_add_new_obj(cntxt, id_obj, DYNTAB_TOUL(formstamp))) STACK_ERROR;

	push	0
	push	0
	mov	eax, DWORD PTR _id_obj$[ebp]
	push	eax
	call	_dyntab_sz
	add	esp, 12					; 0000000cH
	test	eax, eax
	jne	SHORT $L71585
	push	10					; 0000000aH
	push	0
	push	0
	push	0
	mov	ecx, DWORD PTR _formstamp$[ebp]
	push	ecx
	call	_dyntab_val
	add	esp, 12					; 0000000cH
	push	eax
	call	_strtoul
	add	esp, 12					; 0000000cH
	push	eax
	mov	edx, DWORD PTR _id_obj$[ebp]
	push	edx
	mov	eax, DWORD PTR _cntxt$[ebp]
	push	eax
	call	_qry_add_new_obj
	add	esp, 12					; 0000000cH
	test	eax, eax
	je	SHORT $L71585
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 1195		; 000004abH
	jmp	$eva_err$71586
$L71585:

; 1196 : 	idobj = DYNTAB_TOULRC(id_obj, 0, 0);

	push	10					; 0000000aH
	push	0
	push	0
	push	0
	mov	edx, DWORD PTR _id_obj$[ebp]
	push	edx
	call	_dyntab_val
	add	esp, 12					; 0000000cH
	push	eax
	call	_strtoul
	add	esp, 12					; 0000000cH
	mov	DWORD PTR _idobj$[ebp], eax

; 1197 : 
; 1198 : 	/* For each value to add */
; 1199 : 	for(i = 0; i < data->nbrows; i++)

	mov	DWORD PTR _i$[ebp], 0
	jmp	SHORT $L71588
$L71589:
	mov	eax, DWORD PTR _i$[ebp]
	add	eax, 1
	mov	DWORD PTR _i$[ebp], eax
$L71588:
	mov	ecx, DWORD PTR _data$[ebp]
	mov	edx, DWORD PTR _i$[ebp]
	cmp	edx, DWORD PTR [ecx]
	jae	$eva_noerr$71583

; 1201 : 		/* Fill value attributes */
; 1202 : 		memset(&val, 0, sizeof(val));

	push	64					; 00000040H
	push	0
	lea	eax, DWORD PTR _val$[ebp]
	push	eax
	call	_memset
	add	esp, 12					; 0000000cH

; 1203 : 		val.IdObj = idobj;

	mov	ecx, DWORD PTR _idobj$[ebp]
	mov	DWORD PTR _val$[ebp+20], ecx

; 1204 : 		val.field = dyntab_val(data, i, 0);

	push	0
	mov	edx, DWORD PTR _i$[ebp]
	push	edx
	mov	eax, DWORD PTR _data$[ebp]
	push	eax
	call	_dyntab_val
	add	esp, 12					; 0000000cH
	mov	DWORD PTR _val$[ebp+8], eax

; 1205 : 		if(!*val.field) continue;

	mov	ecx, DWORD PTR _val$[ebp+8]
	movsx	edx, BYTE PTR [ecx]
	test	edx, edx
	jne	SHORT $L71591
	jmp	SHORT $L71589
$L71591:

; 1206 : 		val.txt = dyntab_val(data, i, 1);

	push	1
	mov	eax, DWORD PTR _i$[ebp]
	push	eax
	mov	ecx, DWORD PTR _data$[ebp]
	push	ecx
	call	_dyntab_val
	add	esp, 12					; 0000000cH
	mov	DWORD PTR _val$[ebp], eax

; 1207 : 		val.len = dyntab_sz(data, i, 1);

	push	1
	mov	edx, DWORD PTR _i$[ebp]
	push	edx
	mov	eax, DWORD PTR _data$[ebp]
	push	eax
	call	_dyntab_sz
	add	esp, 12					; 0000000cH
	mov	DWORD PTR _val$[ebp+4], eax

; 1208 : 		val.b_relation = (char)(*dyntab_val(data, i, 2) == 'R');

	push	2
	mov	ecx, DWORD PTR _i$[ebp]
	push	ecx
	mov	edx, DWORD PTR _data$[ebp]
	push	edx
	call	_dyntab_val
	add	esp, 12					; 0000000cH
	movsx	eax, BYTE PTR [eax]
	xor	ecx, ecx
	cmp	eax, 82					; 00000052H
	sete	cl
	mov	BYTE PTR _val$[ebp+12], cl

; 1209 : 		val.Num = atoi(dyntab_val(data, i, 3));

	push	3
	mov	edx, DWORD PTR _i$[ebp]
	push	edx
	mov	eax, DWORD PTR _data$[ebp]
	push	eax
	call	_dyntab_val
	add	esp, 12					; 0000000cH
	push	eax
	call	_atoi
	add	esp, 4
	mov	DWORD PTR _val$[ebp+36], eax

; 1210 : 		val.Line = atoi(dyntab_val(data, i, 4));

	push	4
	mov	ecx, DWORD PTR _i$[ebp]
	push	ecx
	mov	edx, DWORD PTR _data$[ebp]
	push	edx
	call	_dyntab_val
	add	esp, 12					; 0000000cH
	push	eax
	call	_atoi
	add	esp, 4
	mov	DWORD PTR _val$[ebp+40], eax

; 1211 : 
; 1212 : 		/* Search for previous values */
; 1213 : 		DYNTAB_FREE(res);

	lea	eax, DWORD PTR _res$[ebp]
	push	eax
	call	_dyntab_free
	add	esp, 4

; 1214 : 		if(b_clearprev && qry_obj_field(cntxt, &res, idobj, val.field)) STACK_ERROR;

	cmp	DWORD PTR _b_clearprev$[ebp], 0
	je	SHORT $L71593
	mov	ecx, DWORD PTR _val$[ebp+8]
	push	ecx
	mov	edx, DWORD PTR _idobj$[ebp]
	push	edx
	lea	eax, DWORD PTR _res$[ebp]
	push	eax
	mov	ecx, DWORD PTR _cntxt$[ebp]
	push	ecx
	call	_qry_obj_field
	add	esp, 16					; 00000010H
	test	eax, eax
	je	SHORT $L71593
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 1214		; 000004beH
	jmp	$eva_err$71586
$L71593:

; 1215 : 		if(res.nbrows)

	cmp	DWORD PTR _res$[ebp], 0
	je	$L71627

; 1217 : 			/* Clear previous values */
; 1218 : 			M_FREE(sql);

	mov	eax, DWORD PTR _sql$[ebp]
	push	eax
	call	_mem_free
	add	esp, 4
	mov	DWORD PTR _sql$[ebp], 0

; 1219 : 			DYNBUF_ADD3_CELL(&sql, "UPDATE TLink SET IdWhoDel=", &cntxt->id_user, 0, 0, NO_CONV, ", DateDel='");

	push	11					; 0000000bH
	push	OFFSET FLAT:$SG71597
	push	0
	push	0
	push	0
	push	0
	mov	ecx, DWORD PTR _cntxt$[ebp]
	add	ecx, 29408				; 000072e0H
	push	ecx
	call	_dyntab_sz
	add	esp, 12					; 0000000cH
	push	eax
	push	0
	push	0
	mov	edx, DWORD PTR _cntxt$[ebp]
	add	edx, 29408				; 000072e0H
	push	edx
	call	_dyntab_val
	add	esp, 12					; 0000000cH
	push	eax
	push	26					; 0000001aH
	push	OFFSET FLAT:$SG71598
	lea	eax, DWORD PTR _sql$[ebp]
	push	eax
	call	_dynbuf_add3
	add	esp, 36					; 00000024H
	test	eax, eax
	je	SHORT $L71596
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29872], OFFSET FLAT:$SG71600
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 1219		; 000004c3H
	jmp	$eva_err$71586
$L71596:

; 1220 : 			DYNBUF_ADD(&sql, cntxt->timestamp, 14, NO_CONV);

	push	0
	push	0
	push	14					; 0000000eH
	mov	eax, DWORD PTR _cntxt$[ebp]
	add	eax, 29704				; 00007408H
	push	eax
	lea	ecx, DWORD PTR _sql$[ebp]
	push	ecx
	call	_dynbuf_add
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L71602
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29872], OFFSET FLAT:$SG71604
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 1220		; 000004c4H
	jmp	$eva_err$71586
$L71602:

; 1221 : 			DYNBUF_ADD_STR(&sql, "' WHERE Pkey IN (");

	push	0
	push	0
	push	17					; 00000011H
	push	OFFSET FLAT:$SG71607
	lea	ecx, DWORD PTR _sql$[ebp]
	push	ecx
	call	_dynbuf_add
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L71606
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29872], OFFSET FLAT:$SG71609
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 1221		; 000004c5H
	jmp	$eva_err$71586
$L71606:

; 1222 : 			for(j = 0; j < res.nbrows; j++)

	mov	DWORD PTR _j$[ebp], 0
	jmp	SHORT $L71610
$L71611:
	mov	ecx, DWORD PTR _j$[ebp]
	add	ecx, 1
	mov	DWORD PTR _j$[ebp], ecx
$L71610:
	mov	edx, DWORD PTR _j$[ebp]
	cmp	edx, DWORD PTR _res$[ebp]
	jae	$L71612

; 1224 : 				if(j) DYNBUF_ADD_STR(&sql, ",");

	cmp	DWORD PTR _j$[ebp], 0
	je	SHORT $L71615
	push	0
	push	0
	push	1
	push	OFFSET FLAT:$SG71616
	lea	eax, DWORD PTR _sql$[ebp]
	push	eax
	call	_dynbuf_add
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L71615
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29872], OFFSET FLAT:$SG71618
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 1224		; 000004c8H
	jmp	$eva_err$71586
$L71615:

; 1225 : 				DYNBUF_ADD_INT(&sql, dyntab_cell(&res, j, 0)->Pkey);

	push	0
	mov	eax, DWORD PTR _j$[ebp]
	push	eax
	lea	ecx, DWORD PTR _res$[ebp]
	push	ecx
	call	_dyntab_cell
	add	esp, 12					; 0000000cH
	mov	edx, DWORD PTR [eax+16]
	push	edx
	lea	eax, DWORD PTR _sql$[ebp]
	push	eax
	call	_dynbuf_add_int
	add	esp, 8
	test	eax, eax
	je	SHORT $L71619
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29872], OFFSET FLAT:$SG71621
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 1225		; 000004c9H
	jmp	$eva_err$71586
$L71619:

; 1226 : 			}

	jmp	$L71611
$L71612:

; 1227 : 			DYNBUF_ADD_STR(&sql, ")");

	push	0
	push	0
	push	1
	push	OFFSET FLAT:$SG71624
	lea	eax, DWORD PTR _sql$[ebp]
	push	eax
	call	_dynbuf_add
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L71623
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29872], OFFSET FLAT:$SG71626
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 1227		; 000004cbH
	jmp	SHORT $eva_err$71586
$L71623:

; 1228 : 			if(sql_exec_query(cntxt, sql->data)) STACK_ERROR;

	mov	eax, DWORD PTR _sql$[ebp]
	add	eax, 8
	push	eax
	mov	ecx, DWORD PTR _cntxt$[ebp]
	push	ecx
	call	_sql_exec_query
	add	esp, 8
	test	eax, eax
	je	SHORT $L71627
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 1228		; 000004ccH
	jmp	SHORT $eva_err$71586
$L71627:

; 1230 : 
; 1231 : 		/* Add new value in db */
; 1232 : 		if(qry_add_val(cntxt, &val, 2, NULL)) STACK_ERROR;

	push	0
	push	2
	lea	eax, DWORD PTR _val$[ebp]
	push	eax
	mov	ecx, DWORD PTR _cntxt$[ebp]
	push	ecx
	call	_qry_add_val
	add	esp, 16					; 00000010H
	test	eax, eax
	je	SHORT $L71629
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 1232		; 000004d0H
	jmp	SHORT $eva_err$71586
$L71629:

; 1233 : 	}

	jmp	$L71589
$eva_noerr$71583:

; 1234 : 
; 1235 : 	RETURN_OK_CLEANUP;

	push	0
	push	OFFSET FLAT:$SG71630
	push	OFFSET FLAT:$SG71631
	mov	eax, DWORD PTR _cntxt$[ebp]
	push	eax
	call	_err_clear
	add	esp, 16					; 00000010H
$eva_err$71586:
	mov	ecx, DWORD PTR _cntxt$[ebp]
	cmp	DWORD PTR [ecx+29872], 0
	je	SHORT $L71632
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	eax, DWORD PTR [edx+29900]
	push	eax
	push	OFFSET FLAT:$SG71633
	push	OFFSET FLAT:$SG71634
	mov	ecx, DWORD PTR _cntxt$[ebp]
	push	ecx
	call	_err_add_context
	add	esp, 16					; 00000010H
$L71632:
	mov	edx, DWORD PTR _cntxt$[ebp]
	xor	eax, eax
	cmp	DWORD PTR [edx+29872], 0
	setne	al

; 1236 : }

	mov	esp, ebp
	pop	ebp
	ret	0
_qry_add_obj_data ENDP
_TEXT	ENDS
PUBLIC	_qry_list_data
EXTRN	_form_eval_fieldexpr:NEAR
EXTRN	_qsort_colval:NEAR
EXTRN	_dyntab_resize:NEAR
EXTRN	_dyntab_copy:NEAR
EXTRN	_qry_eval_sqlexpr_var:NEAR
EXTRN	_qry_eval_sql_fieldexpr:NEAR
EXTRN	_strncmp:NEAR
EXTRN	_strstr:NEAR
_DATA	SEGMENT
	ORG $+3
$SG71671 DB	'SELECT ', 00H
$SG71676 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG71685 DB	'[$', 00H
	ORG $+1
$SG71706 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG71710 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG71719 DB	'Tbl%lu', 00H
	ORG $+1
$SG71725 DB	'TmpListData', 00H
$SG71726 DB	'SELECT * FROM TmpListData', 00H
	ORG $+2
$SG71736 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG71741 DB	'TmpListData', 00H
$SG71744 DB	'D:\Travail\ABI\EVA\V4.0\CGI\Brunix-2016\qry_utils.c', 00H
$SG71745 DB	'qry_list_data', 00H
	ORG $+2
$SG71748 DB	'D:\Travail\ABI\EVA\V4.0\CGI\Brunix-2016\qry_utils.c', 00H
$SG71749 DB	'qry_list_data', 00H
	ORG $+2
$SG71762 DB	'D:\Travail\ABI\EVA\V4.0\CGI\Brunix-2016\qry_utils.c', 00H
$SG71763 DB	'qry_list_data', 00H
	ORG $+2
$SG71765 DB	'D:\Travail\ABI\EVA\V4.0\CGI\Brunix-2016\qry_utils.c', 00H
$SG71766 DB	'qry_list_data', 00H
_DATA	ENDS
_TEXT	SEGMENT
_s$71680 = -4540
_d$71681 = -4544
_b_notable$71684 = -4548
_r$71693 = -4556
_idobj$71694 = -4552
_s$71702 = -4560
_s$71714 = -4564
_d$71715 = -4568
_row$71717 = -4584
_val$71753 = -4588
_lastnode$71754 = -4592
_cntxt$ = 8
_tbl$ = 12
_sql$ = -4
_data$ = -32
_tmp$ = -52
_i$ = -56
_j$ = -60
_k$ = -64
_row0$ = -8
_flt$ = -4520
_sql_trace$ = -12
_beg$71664 = -4524
_end$71665 = -4532
_c$71666 = -4528
_r$71672 = -4536
_qry_list_data PROC NEAR

; 1253 : ){

	push	ebp
	mov	ebp, esp
	mov	eax, 4596				; 000011f4H
	call	__chkstk
	push	edi

; 1254 :  	DynBuffer *sql = NULL;

	mov	DWORD PTR _sql$[ebp], 0

; 1255 : 	DynTable data = {0};

	mov	DWORD PTR _data$[ebp], 0
	xor	eax, eax
	mov	DWORD PTR _data$[ebp+4], eax
	mov	DWORD PTR _data$[ebp+8], eax
	mov	DWORD PTR _data$[ebp+12], eax
	mov	DWORD PTR _data$[ebp+16], eax

; 1256 : 	DynTable tmp = {0};

	mov	DWORD PTR _tmp$[ebp], 0
	xor	ecx, ecx
	mov	DWORD PTR _tmp$[ebp+4], ecx
	mov	DWORD PTR _tmp$[ebp+8], ecx
	mov	DWORD PTR _tmp$[ebp+12], ecx
	mov	DWORD PTR _tmp$[ebp+16], ecx

; 1257 : 	unsigned long i, j, k, row0;
; 1258 : 	QryBuild flt = { {0} };

	mov	DWORD PTR _flt$[ebp], 0
	xor	edx, edx
	mov	DWORD PTR _flt$[ebp+4], edx
	mov	DWORD PTR _flt$[ebp+8], edx
	mov	DWORD PTR _flt$[ebp+12], edx
	mov	DWORD PTR _flt$[ebp+16], edx
	mov	ecx, 1109				; 00000455H
	xor	eax, eax
	lea	edi, DWORD PTR _flt$[ebp+20]
	rep stosd

; 1259 : 	int sql_trace = cntxt->sql_trace;

	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	ecx, DWORD PTR [eax+29852]
	mov	DWORD PTR _sql_trace$[ebp], ecx

; 1260 : 
; 1261 : 	/* Initialize list with objects data (all fields are read to be able to display links tooltips - this may be optimizeed) */
; 1262 : 	dyntab_free(&tbl->data);

	mov	edx, DWORD PTR _tbl$[ebp]
	add	edx, 220				; 000000dcH
	push	edx
	call	_dyntab_free
	add	esp, 4

; 1263 : 	if(!tbl->idobj.nbrows) RETURN_OK;

	mov	eax, DWORD PTR _tbl$[ebp]
	cmp	DWORD PTR [eax+184], 0
	jne	SHORT $L71653
	jmp	$eva_noerr$71654
$L71653:

; 1264 : 	if(qry_obj_data(cntxt, &tbl->data, &tbl->idobj, NULL)) STACK_ERROR;

	push	0
	mov	ecx, DWORD PTR _tbl$[ebp]
	add	ecx, 184				; 000000b8H
	push	ecx
	mov	edx, DWORD PTR _tbl$[ebp]
	add	edx, 220				; 000000dcH
	push	edx
	mov	eax, DWORD PTR _cntxt$[ebp]
	push	eax
	call	_qry_obj_data
	add	esp, 16					; 00000010H
	test	eax, eax
	je	SHORT $L71656
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 1264		; 000004f0H
	jmp	$eva_err$71657
$L71656:

; 1265 : 	row0 = tbl->data.nbrows;

	mov	edx, DWORD PTR _tbl$[ebp]
	mov	eax, DWORD PTR [edx+220]
	mov	DWORD PTR _row0$[ebp], eax

; 1266 : 	for(i = 0; i < row0; i++)

	mov	DWORD PTR _i$[ebp], 0
	jmp	SHORT $L71658
$L71659:
	mov	ecx, DWORD PTR _i$[ebp]
	add	ecx, 1
	mov	DWORD PTR _i$[ebp], ecx
$L71658:
	mov	edx, DWORD PTR _i$[ebp]
	cmp	edx, DWORD PTR _row0$[ebp]
	jae	SHORT $L71660

; 1267 : 		dyntab_cell(&tbl->data, i, 0)->col = tbl->field.nbrows;

	push	0
	mov	eax, DWORD PTR _i$[ebp]
	push	eax
	mov	ecx, DWORD PTR _tbl$[ebp]
	add	ecx, 220				; 000000dcH
	push	ecx
	call	_dyntab_cell
	add	esp, 12					; 0000000cH
	mov	edx, DWORD PTR _tbl$[ebp]
	mov	ecx, DWORD PTR [edx+380]
	mov	DWORD PTR [eax+56], ecx
	jmp	SHORT $L71659
$L71660:

; 1268 : 
; 1269 : 	/* Read columns data */
; 1270 : 	for(i = 0; i < tbl->field.nbrows; i++)

	mov	DWORD PTR _i$[ebp], 0
	jmp	SHORT $L71661
$L71662:
	mov	edx, DWORD PTR _i$[ebp]
	add	edx, 1
	mov	DWORD PTR _i$[ebp], edx
$L71661:
	mov	eax, DWORD PTR _tbl$[ebp]
	mov	ecx, DWORD PTR _i$[ebp]
	cmp	ecx, DWORD PTR [eax+380]
	jae	$L71663

; 1272 : 		unsigned long beg = 0, end = row0;

	mov	DWORD PTR _beg$71664[ebp], 0
	mov	edx, DWORD PTR _row0$[ebp]
	mov	DWORD PTR _end$71665[ebp], edx

; 1273 : 		DynTableCell *c = dyntab_cell(&tbl->field, i, 0);

	push	0
	mov	eax, DWORD PTR _i$[ebp]
	push	eax
	mov	ecx, DWORD PTR _tbl$[ebp]
	add	ecx, 380				; 0000017cH
	push	ecx
	call	_dyntab_cell
	add	esp, 12					; 0000000cH
	mov	DWORD PTR _c$71666[ebp], eax

; 1274 : 		if(!c || !c->txt || !c->len) continue;

	cmp	DWORD PTR _c$71666[ebp], 0
	je	SHORT $L71668
	mov	edx, DWORD PTR _c$71666[ebp]
	cmp	DWORD PTR [edx], 0
	je	SHORT $L71668
	mov	eax, DWORD PTR _c$71666[ebp]
	cmp	DWORD PTR [eax+4], 0
	jne	SHORT $L71667
$L71668:
	jmp	SHORT $L71662
$L71667:

; 1275 : 
; 1276 : 		/* Handle expression debug */
; 1277 : 		if(*dyntab_val(&tbl->debug, i, 0) == '1') cntxt->sql_trace = DEBUG_SQL_RES;

	push	0
	mov	ecx, DWORD PTR _i$[ebp]
	push	ecx
	mov	edx, DWORD PTR _tbl$[ebp]
	add	edx, 600				; 00000258H
	push	edx
	call	_dyntab_val
	add	esp, 12					; 0000000cH
	movsx	eax, BYTE PTR [eax]
	cmp	eax, 49					; 00000031H
	jne	SHORT $L71669
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29852], 2
$L71669:

; 1278 : 
; 1279 : 		/* Build query for column : check for expression type */
; 1280 : 		if(!strncmp(c->txt, add_sz_str("SELECT ")))

	push	7
	push	OFFSET FLAT:$SG71671
	mov	edx, DWORD PTR _c$71666[ebp]
	mov	eax, DWORD PTR [edx]
	push	eax
	call	_strncmp
	add	esp, 12					; 0000000cH
	test	eax, eax
	jne	$L71670

; 1282 : 			/* Handle raw SQL SELECT */
; 1283 : 			unsigned long r = tbl->data.nbrows;

	mov	ecx, DWORD PTR _tbl$[ebp]
	mov	edx, DWORD PTR [ecx+220]
	mov	DWORD PTR _r$71672[ebp], edx

; 1284 : 			if(form_eval_fieldexpr(cntxt, &data, 0, 0, c->txt, c->len, tbl->attr, 0)) STACK_ERROR;

	push	0
	mov	eax, DWORD PTR _tbl$[ebp]
	mov	ecx, DWORD PTR [eax]
	push	ecx
	mov	edx, DWORD PTR _c$71666[ebp]
	mov	eax, DWORD PTR [edx+4]
	push	eax
	mov	ecx, DWORD PTR _c$71666[ebp]
	mov	edx, DWORD PTR [ecx]
	push	edx
	push	0
	push	0
	lea	eax, DWORD PTR _data$[ebp]
	push	eax
	mov	ecx, DWORD PTR _cntxt$[ebp]
	push	ecx
	call	_form_eval_fieldexpr
	add	esp, 32					; 00000020H
	test	eax, eax
	je	SHORT $L71673
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 1284		; 00000504H
	jmp	$eva_err$71657
$L71673:

; 1285 : 			if(dyntab_resize(&tbl->data, tbl->data.nbrows + data.nbrows - 1, tbl->data.nbcols - 1)) RETURN_ERR_MEMORY;

	mov	eax, DWORD PTR _tbl$[ebp]
	mov	ecx, DWORD PTR [eax+228]
	sub	ecx, 1
	push	ecx
	mov	edx, DWORD PTR _tbl$[ebp]
	mov	eax, DWORD PTR [edx+220]
	mov	ecx, DWORD PTR _data$[ebp]
	lea	edx, DWORD PTR [eax+ecx-1]
	push	edx
	mov	eax, DWORD PTR _tbl$[ebp]
	add	eax, 220				; 000000dcH
	push	eax
	call	_dyntab_resize
	add	esp, 12					; 0000000cH
	test	eax, eax
	je	SHORT $L71674
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29872], OFFSET FLAT:$SG71676
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 1285		; 00000505H
	jmp	$eva_err$71657
$L71674:

; 1286 : 			for(k = 0; k < data.nbrows; k++)

	mov	DWORD PTR _k$[ebp], 0
	jmp	SHORT $L71677
$L71678:
	mov	eax, DWORD PTR _k$[ebp]
	add	eax, 1
	mov	DWORD PTR _k$[ebp], eax
$L71677:
	mov	ecx, DWORD PTR _k$[ebp]
	cmp	ecx, DWORD PTR _data$[ebp]
	jae	SHORT $L71679

; 1288 : 				DynTableCell *s = dyntab_cell(&data, k, 0);

	push	0
	mov	edx, DWORD PTR _k$[ebp]
	push	edx
	lea	eax, DWORD PTR _data$[ebp]
	push	eax
	call	_dyntab_cell
	add	esp, 12					; 0000000cH
	mov	DWORD PTR _s$71680[ebp], eax

; 1289 : 				DynTableCell *d = dyntab_cell(&tbl->data, r + k, 0);

	push	0
	mov	ecx, DWORD PTR _r$71672[ebp]
	add	ecx, DWORD PTR _k$[ebp]
	push	ecx
	mov	edx, DWORD PTR _tbl$[ebp]
	add	edx, 220				; 000000dcH
	push	edx
	call	_dyntab_cell
	add	esp, 12					; 0000000cH
	mov	DWORD PTR _d$71681[ebp], eax

; 1290 : 				memcpy(d, s, sizeof(d[0]));

	push	64					; 00000040H
	mov	eax, DWORD PTR _s$71680[ebp]
	push	eax
	mov	ecx, DWORD PTR _d$71681[ebp]
	push	ecx
	call	_memcpy
	add	esp, 12					; 0000000cH

; 1291 : 				memset(s, 0, sizeof(d[0]));

	push	64					; 00000040H
	push	0
	mov	edx, DWORD PTR _s$71680[ebp]
	push	edx
	call	_memset
	add	esp, 12					; 0000000cH

; 1292 : 				d->col = i;

	mov	eax, DWORD PTR _d$71681[ebp]
	mov	ecx, DWORD PTR _i$[ebp]
	mov	DWORD PTR [eax+56], ecx

; 1293 : 			}

	jmp	$L71678
$L71679:

; 1295 : 		else if(strchr(c->txt, '['))

	jmp	$L71752
$L71670:
	push	91					; 0000005bH
	mov	edx, DWORD PTR _c$71666[ebp]
	mov	eax, DWORD PTR [edx]
	push	eax
	call	_strchr
	add	esp, 8
	test	eax, eax
	je	$L71683

; 1297 : 			/* Handle SQL/relationnal expression */
; 1298 : 			int b_notable = strstr(c->txt, "[$") != 0;

	push	OFFSET FLAT:$SG71685
	mov	ecx, DWORD PTR _c$71666[ebp]
	mov	edx, DWORD PTR [ecx]
	push	edx
	call	_strstr
	add	esp, 8
	neg	eax
	sbb	eax, eax
	neg	eax
	mov	DWORD PTR _b_notable$71684[ebp], eax

; 1299 : 			M_FREE(sql);

	mov	eax, DWORD PTR _sql$[ebp]
	push	eax
	call	_mem_free
	add	esp, 4
	mov	DWORD PTR _sql$[ebp], 0

; 1300 : 
; 1301 : 			if(b_notable || *dyntab_val(&tbl->notable, i, 0) == '1')

	cmp	DWORD PTR _b_notable$71684[ebp], 0
	jne	SHORT $L71687
	push	0
	mov	ecx, DWORD PTR _i$[ebp]
	push	ecx
	mov	edx, DWORD PTR _tbl$[ebp]
	add	edx, 620				; 0000026cH
	push	edx
	call	_dyntab_val
	add	esp, 12					; 0000000cH
	movsx	eax, BYTE PTR [eax]
	cmp	eax, 49					; 00000031H
	jne	$L71686
$L71687:

; 1303 : 				/* Evaluate SQL expression without tables - loop on objects */
; 1304 : 				if(qry_eval_sqlexpr_var(cntxt, &sql, c->txt, tbl->attr, NULL)) STACK_ERROR;

	push	0
	mov	ecx, DWORD PTR _tbl$[ebp]
	mov	edx, DWORD PTR [ecx]
	push	edx
	mov	eax, DWORD PTR _c$71666[ebp]
	mov	ecx, DWORD PTR [eax]
	push	ecx
	lea	edx, DWORD PTR _sql$[ebp]
	push	edx
	mov	eax, DWORD PTR _cntxt$[ebp]
	push	eax
	call	_qry_eval_sqlexpr_var
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L71689
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 1304		; 00000518H
	jmp	$eva_err$71657
$L71689:

; 1305 : 				beg = 0;

	mov	DWORD PTR _beg$71664[ebp], 0

; 1306 : 				for(j = 0; j < tbl->idobj.nbrows; j++)

	mov	DWORD PTR _j$[ebp], 0
	jmp	SHORT $L71690
$L71691:
	mov	edx, DWORD PTR _j$[ebp]
	add	edx, 1
	mov	DWORD PTR _j$[ebp], edx
$L71690:
	mov	eax, DWORD PTR _tbl$[ebp]
	mov	ecx, DWORD PTR _j$[ebp]
	cmp	ecx, DWORD PTR [eax+184]
	jae	$L71692

; 1308 : 					/* Retrieve object data in temp location */
; 1309 : 					unsigned long r = tbl->data.nbrows;

	mov	edx, DWORD PTR _tbl$[ebp]
	mov	eax, DWORD PTR [edx+220]
	mov	DWORD PTR _r$71693[ebp], eax

; 1310 : 					unsigned long idobj = DYNTAB_TOULRC(&tbl->idobj, j, 0);

	push	10					; 0000000aH
	push	0
	push	0
	mov	ecx, DWORD PTR _j$[ebp]
	push	ecx
	mov	edx, DWORD PTR _tbl$[ebp]
	add	edx, 184				; 000000b8H
	push	edx
	call	_dyntab_val
	add	esp, 12					; 0000000cH
	push	eax
	call	_strtoul
	add	esp, 12					; 0000000cH
	mov	DWORD PTR _idobj$71694[ebp], eax
$L71697:

; 1311 : 					while(beg < r && dyntab_cell(&tbl->data, beg, 0)->IdObj != idobj) beg++;

	mov	eax, DWORD PTR _beg$71664[ebp]
	cmp	eax, DWORD PTR _r$71693[ebp]
	jae	SHORT $L71698
	push	0
	mov	ecx, DWORD PTR _beg$71664[ebp]
	push	ecx
	mov	edx, DWORD PTR _tbl$[ebp]
	add	edx, 220				; 000000dcH
	push	edx
	call	_dyntab_cell
	add	esp, 12					; 0000000cH
	mov	eax, DWORD PTR [eax+20]
	cmp	eax, DWORD PTR _idobj$71694[ebp]
	je	SHORT $L71698
	mov	ecx, DWORD PTR _beg$71664[ebp]
	add	ecx, 1
	mov	DWORD PTR _beg$71664[ebp], ecx
	jmp	SHORT $L71697
$L71698:

; 1312 : 					DYNTAB_FREE(tmp);

	lea	edx, DWORD PTR _tmp$[ebp]
	push	edx
	call	_dyntab_free
	add	esp, 4

; 1313 : 					for(k = beg; k < r; k++)

	mov	eax, DWORD PTR _beg$71664[ebp]
	mov	DWORD PTR _k$[ebp], eax
	jmp	SHORT $L71699
$L71700:
	mov	ecx, DWORD PTR _k$[ebp]
	add	ecx, 1
	mov	DWORD PTR _k$[ebp], ecx
$L71699:
	mov	edx, DWORD PTR _k$[ebp]
	cmp	edx, DWORD PTR _r$71693[ebp]
	jae	$L71701

; 1315 : 						DynTableCell *s = dyntab_cell(&tbl->data, k, 0);

	push	0
	mov	eax, DWORD PTR _k$[ebp]
	push	eax
	mov	ecx, DWORD PTR _tbl$[ebp]
	add	ecx, 220				; 000000dcH
	push	ecx
	call	_dyntab_cell
	add	esp, 12					; 0000000cH
	mov	DWORD PTR _s$71702[ebp], eax

; 1316 : 						if(s->IdObj != idobj) break;

	mov	edx, DWORD PTR _s$71702[ebp]
	mov	eax, DWORD PTR [edx+20]
	cmp	eax, DWORD PTR _idobj$71694[ebp]
	je	SHORT $L71703
	jmp	SHORT $L71701
$L71703:

; 1317 : 						DYNTAB_SET_CELLP(&tmp, tmp.nbrows, 0, s);

	push	0
	mov	ecx, DWORD PTR _s$71702[ebp]
	push	ecx
	push	0
	mov	edx, DWORD PTR _tmp$[ebp]
	push	edx
	lea	eax, DWORD PTR _tmp$[ebp]
	push	eax
	call	_dyntab_copy
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L71704
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29872], OFFSET FLAT:$SG71706
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 1317		; 00000525H
	jmp	$eva_err$71657
$L71704:

; 1318 : 						dyntab_cell(&tmp, tmp.nbrows - 1, 0)->col = 0;

	push	0
	mov	eax, DWORD PTR _tmp$[ebp]
	sub	eax, 1
	push	eax
	lea	ecx, DWORD PTR _tmp$[ebp]
	push	ecx
	call	_dyntab_cell
	add	esp, 12					; 0000000cH
	mov	DWORD PTR [eax+56], 0

; 1319 : 					}

	jmp	$L71700
$L71701:

; 1320 : 
; 1321 : 					/* Evaluate expression on object & transfer to list data */
; 1322 : 					if(form_eval_fieldexpr(cntxt, &data, 0, idobj, sql->data, sql->cnt, &tmp, 0)) STACK_ERROR;

	push	0
	lea	edx, DWORD PTR _tmp$[ebp]
	push	edx
	mov	eax, DWORD PTR _sql$[ebp]
	mov	ecx, DWORD PTR [eax+4]
	push	ecx
	mov	edx, DWORD PTR _sql$[ebp]
	add	edx, 8
	push	edx
	mov	eax, DWORD PTR _idobj$71694[ebp]
	push	eax
	push	0
	lea	ecx, DWORD PTR _data$[ebp]
	push	ecx
	mov	edx, DWORD PTR _cntxt$[ebp]
	push	edx
	call	_form_eval_fieldexpr
	add	esp, 32					; 00000020H
	test	eax, eax
	je	SHORT $L71707
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 1322		; 0000052aH
	jmp	$eva_err$71657
$L71707:

; 1323 : 					if(dyntab_resize(&tbl->data, tbl->data.nbrows + data.nbrows - 1, tbl->data.nbcols - 1)) RETURN_ERR_MEMORY;

	mov	ecx, DWORD PTR _tbl$[ebp]
	mov	edx, DWORD PTR [ecx+228]
	sub	edx, 1
	push	edx
	mov	eax, DWORD PTR _tbl$[ebp]
	mov	ecx, DWORD PTR [eax+220]
	mov	edx, DWORD PTR _data$[ebp]
	lea	eax, DWORD PTR [ecx+edx-1]
	push	eax
	mov	ecx, DWORD PTR _tbl$[ebp]
	add	ecx, 220				; 000000dcH
	push	ecx
	call	_dyntab_resize
	add	esp, 12					; 0000000cH
	test	eax, eax
	je	SHORT $L71708
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29872], OFFSET FLAT:$SG71710
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 1323		; 0000052bH
	jmp	$eva_err$71657
$L71708:

; 1324 : 					for(k = 0; k < data.nbrows; k++)

	mov	DWORD PTR _k$[ebp], 0
	jmp	SHORT $L71711
$L71712:
	mov	ecx, DWORD PTR _k$[ebp]
	add	ecx, 1
	mov	DWORD PTR _k$[ebp], ecx
$L71711:
	mov	edx, DWORD PTR _k$[ebp]
	cmp	edx, DWORD PTR _data$[ebp]
	jae	$L71713

; 1326 : 						DynTableCell *s = dyntab_cell(&data, k, 0);

	push	0
	mov	eax, DWORD PTR _k$[ebp]
	push	eax
	lea	ecx, DWORD PTR _data$[ebp]
	push	ecx
	call	_dyntab_cell
	add	esp, 12					; 0000000cH
	mov	DWORD PTR _s$71714[ebp], eax

; 1327 : 						DynTableCell *d = dyntab_cell(&tbl->data, r + k, 0);

	push	0
	mov	edx, DWORD PTR _r$71693[ebp]
	add	edx, DWORD PTR _k$[ebp]
	push	edx
	mov	eax, DWORD PTR _tbl$[ebp]
	add	eax, 220				; 000000dcH
	push	eax
	call	_dyntab_cell
	add	esp, 12					; 0000000cH
	mov	DWORD PTR _d$71715[ebp], eax

; 1328 : 						memcpy(d, s, sizeof(d[0]));

	push	64					; 00000040H
	mov	ecx, DWORD PTR _s$71714[ebp]
	push	ecx
	mov	edx, DWORD PTR _d$71715[ebp]
	push	edx
	call	_memcpy
	add	esp, 12					; 0000000cH

; 1329 : 						memset(s, 0, sizeof(d[0]));

	push	64					; 00000040H
	push	0
	mov	eax, DWORD PTR _s$71714[ebp]
	push	eax
	call	_memset
	add	esp, 12					; 0000000cH

; 1330 : 						d->col = i;

	mov	ecx, DWORD PTR _d$71715[ebp]
	mov	edx, DWORD PTR _i$[ebp]
	mov	DWORD PTR [ecx+56], edx

; 1331 : 						d->IdObj = idobj;

	mov	eax, DWORD PTR _d$71715[ebp]
	mov	ecx, DWORD PTR _idobj$71694[ebp]
	mov	DWORD PTR [eax+20], ecx

; 1332 : 					}

	jmp	$L71712
$L71713:

; 1333 : 				}

	jmp	$L71691
$L71692:

; 1335 : 			else

	jmp	$L71716
$L71686:

; 1337 : 				/* Evaluate SQL expression with tables */
; 1338 : 				EVA_sql_row row = {0};

	mov	DWORD PTR _row$71717[ebp], 0
	xor	edx, edx
	mov	DWORD PTR _row$71717[ebp+4], edx
	mov	DWORD PTR _row$71717[ebp+8], edx
	mov	DWORD PTR _row$71717[ebp+12], edx

; 1339 : 
; 1340 : 				/* Build table of source objects */
; 1341 : 				if(!tbl->objtbl[0])

	mov	eax, DWORD PTR _tbl$[ebp]
	movsx	ecx, BYTE PTR [eax+204]
	test	ecx, ecx
	jne	SHORT $L71720

; 1343 : 					sprintf(tbl->objtbl, "Tbl%lu", cntxt->sql_cnt);

	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	eax, DWORD PTR [edx+29856]
	push	eax
	push	OFFSET FLAT:$SG71719
	mov	ecx, DWORD PTR _tbl$[ebp]
	add	ecx, 204				; 000000ccH
	push	ecx
	call	_sprintf
	add	esp, 12					; 0000000cH

; 1344 : 					if(qry_make_idlist(cntxt, &tbl->idobj, tbl->objtbl)) STACK_ERROR;

	mov	edx, DWORD PTR _tbl$[ebp]
	add	edx, 204				; 000000ccH
	push	edx
	mov	eax, DWORD PTR _tbl$[ebp]
	add	eax, 184				; 000000b8H
	push	eax
	mov	ecx, DWORD PTR _cntxt$[ebp]
	push	ecx
	call	_qry_make_idlist
	add	esp, 12					; 0000000cH
	test	eax, eax
	je	SHORT $L71720
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 1344		; 00000540H
	jmp	$eva_err$71657
$L71720:

; 1346 : 
; 1347 : 				/* Evaluate expression */
; 1348 : 				if(qry_eval_sqlexpr_var(cntxt, &sql, c->txt, tbl->attr, tbl->objtbl)) STACK_ERROR;

	mov	eax, DWORD PTR _tbl$[ebp]
	add	eax, 204				; 000000ccH
	push	eax
	mov	ecx, DWORD PTR _tbl$[ebp]
	mov	edx, DWORD PTR [ecx]
	push	edx
	mov	eax, DWORD PTR _c$71666[ebp]
	mov	ecx, DWORD PTR [eax]
	push	ecx
	lea	edx, DWORD PTR _sql$[ebp]
	push	edx
	mov	eax, DWORD PTR _cntxt$[ebp]
	push	eax
	call	_qry_eval_sqlexpr_var
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L71721
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 1348		; 00000544H
	jmp	$eva_err$71657
$L71721:

; 1349 : 				if(qry_eval_sql_fieldexpr(cntxt, "TmpListData", sql ? sql->data : NULL, tbl->objtbl, tbl->attr) ||
; 1350 : 					sql_exec_query(cntxt, "SELECT * FROM TmpListData")) STACK_ERROR;

	cmp	DWORD PTR _sql$[ebp], 0
	je	SHORT $L72107
	mov	edx, DWORD PTR _sql$[ebp]
	add	edx, 8
	mov	DWORD PTR -4596+[ebp], edx
	jmp	SHORT $L72108
$L72107:
	mov	DWORD PTR -4596+[ebp], 0
$L72108:
	mov	eax, DWORD PTR _tbl$[ebp]
	mov	ecx, DWORD PTR [eax]
	push	ecx
	mov	edx, DWORD PTR _tbl$[ebp]
	add	edx, 204				; 000000ccH
	push	edx
	mov	eax, DWORD PTR -4596+[ebp]
	push	eax
	push	OFFSET FLAT:$SG71725
	mov	ecx, DWORD PTR _cntxt$[ebp]
	push	ecx
	call	_qry_eval_sql_fieldexpr
	add	esp, 20					; 00000014H
	test	eax, eax
	jne	SHORT $L71724
	push	OFFSET FLAT:$SG71726
	mov	edx, DWORD PTR _cntxt$[ebp]
	push	edx
	call	_sql_exec_query
	add	esp, 8
	test	eax, eax
	je	SHORT $L71723
$L71724:
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 1350		; 00000546H
	jmp	$eva_err$71657
$L71723:

; 1355 : 					if(sql_result_next_row(cntxt, &row)) STACK_ERROR;

	lea	ecx, DWORD PTR _row$71717[ebp]
	push	ecx
	mov	edx, DWORD PTR _cntxt$[ebp]
	push	edx
	call	_sql_result_next_row
	add	esp, 8
	test	eax, eax
	je	SHORT $L71730
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 1355		; 0000054bH
	jmp	$eva_err$71657
$L71730:

; 1356 : 					if(!row.sz || !row.sz[1]) continue;

	cmp	DWORD PTR _row$71717[ebp+12], 0
	je	SHORT $L71732
	mov	ecx, DWORD PTR _row$71717[ebp+12]
	cmp	DWORD PTR [ecx+4], 0
	jne	SHORT $L71731
$L71732:
	jmp	$L71728
$L71731:

; 1357 : 					beg = tbl->data.nbrows;

	mov	edx, DWORD PTR _tbl$[ebp]
	mov	eax, DWORD PTR [edx+220]
	mov	DWORD PTR _beg$71664[ebp], eax

; 1358 : 					if(dyntab_add(&tbl->data, beg, 0, row.value[1], row.sz[1], NO_CONV)) RETURN_ERR_MEMORY;

	push	0
	push	0
	mov	ecx, DWORD PTR _row$71717[ebp+12]
	mov	edx, DWORD PTR [ecx+4]
	push	edx
	mov	eax, DWORD PTR _row$71717[ebp+8]
	mov	ecx, DWORD PTR [eax+4]
	push	ecx
	push	0
	mov	edx, DWORD PTR _beg$71664[ebp]
	push	edx
	mov	eax, DWORD PTR _tbl$[ebp]
	add	eax, 220				; 000000dcH
	push	eax
	call	_dyntab_add
	add	esp, 28					; 0000001cH
	test	eax, eax
	je	SHORT $L71734
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29872], OFFSET FLAT:$SG71736
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 1358		; 0000054eH
	jmp	$eva_err$71657
$L71734:

; 1359 : 					c = dyntab_cell(&tbl->data, beg, 0);

	push	0
	mov	eax, DWORD PTR _beg$71664[ebp]
	push	eax
	mov	ecx, DWORD PTR _tbl$[ebp]
	add	ecx, 220				; 000000dcH
	push	ecx
	call	_dyntab_cell
	add	esp, 12					; 0000000cH
	mov	DWORD PTR _c$71666[ebp], eax

; 1360 : 					if(row.value[0]) c->IdObj = strtoul(row.value[0], NULL, 10);

	mov	edx, DWORD PTR _row$71717[ebp+8]
	cmp	DWORD PTR [edx], 0
	je	SHORT $L71737
	push	10					; 0000000aH
	push	0
	mov	eax, DWORD PTR _row$71717[ebp+8]
	mov	ecx, DWORD PTR [eax]
	push	ecx
	call	_strtoul
	add	esp, 12					; 0000000cH
	mov	edx, DWORD PTR _c$71666[ebp]
	mov	DWORD PTR [edx+20], eax
$L71737:

; 1361 : 					if(row.value[2]) c->Line = strtoul(row.value[2], NULL, 10);

	mov	eax, DWORD PTR _row$71717[ebp+8]
	cmp	DWORD PTR [eax+8], 0
	je	SHORT $L71739
	push	10					; 0000000aH
	push	0
	mov	ecx, DWORD PTR _row$71717[ebp+8]
	mov	edx, DWORD PTR [ecx+8]
	push	edx
	call	_strtoul
	add	esp, 12					; 0000000cH
	mov	ecx, DWORD PTR _c$71666[ebp]
	mov	DWORD PTR [ecx+40], eax
$L71739:

; 1362 : 					c->col = i;

	mov	edx, DWORD PTR _c$71666[ebp]
	mov	eax, DWORD PTR _i$[ebp]
	mov	DWORD PTR [edx+56], eax
$L71728:

; 1364 : 				while(row.sz);

	cmp	DWORD PTR _row$71717[ebp+12], 0
	jne	$L71723

; 1365 : 				sql_drop_table(cntxt, "TmpListData");

	push	OFFSET FLAT:$SG71741
	mov	ecx, DWORD PTR _cntxt$[ebp]
	push	ecx
	call	_sql_drop_table
	add	esp, 8
$L71716:

; 1368 : 		else

	jmp	$L71752
$L71683:

; 1370 : 			/* Handle field or relation expression : parse expression */
; 1371 : 			qry_build_free(&flt);

	lea	edx, DWORD PTR _flt$[ebp]
	push	edx
	call	_qry_build_free
	add	esp, 4

; 1372 : 			flt.b_recdata = 2;

	mov	DWORD PTR _flt$[ebp+4448], 2

; 1373 : 			if(qry_parse_fieldexpr(cntxt, c->txt, c->len, &flt)) CLEAR_ERROR_CONT;

	lea	eax, DWORD PTR _flt$[ebp]
	push	eax
	mov	ecx, DWORD PTR _c$71666[ebp]
	mov	edx, DWORD PTR [ecx+4]
	push	edx
	mov	eax, DWORD PTR _c$71666[ebp]
	mov	ecx, DWORD PTR [eax]
	push	ecx
	mov	edx, DWORD PTR _cntxt$[ebp]
	push	edx
	call	_qry_parse_fieldexpr
	add	esp, 16					; 00000010H
	test	eax, eax
	je	SHORT $L71743
	push	1373					; 0000055dH
	push	OFFSET FLAT:$SG71744
	push	OFFSET FLAT:$SG71745
	mov	eax, DWORD PTR _cntxt$[ebp]
	push	eax
	call	_err_clear
	add	esp, 16					; 00000010H
	jmp	$L71662
$L71743:

; 1374 : 
; 1375 : 			/* If not a trivial field : exec query & add values */
; 1376 : 			if(flt.b_oper)

	cmp	DWORD PTR _flt$[ebp+4432], 0
	je	SHORT $L71746

; 1378 : 				beg = tbl->data.nbrows;

	mov	ecx, DWORD PTR _tbl$[ebp]
	mov	edx, DWORD PTR [ecx+220]
	mov	DWORD PTR _beg$71664[ebp], edx

; 1379 : 				if(sql_get_listcol(cntxt, &tbl->data, &tbl->idobj, &flt, i)) CLEAR_ERROR_CONT;

	mov	eax, DWORD PTR _i$[ebp]
	push	eax
	lea	ecx, DWORD PTR _flt$[ebp]
	push	ecx
	mov	edx, DWORD PTR _tbl$[ebp]
	add	edx, 184				; 000000b8H
	push	edx
	mov	eax, DWORD PTR _tbl$[ebp]
	add	eax, 220				; 000000dcH
	push	eax
	mov	ecx, DWORD PTR _cntxt$[ebp]
	push	ecx
	call	_sql_get_listcol
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L71747
	push	1379					; 00000563H
	push	OFFSET FLAT:$SG71748
	push	OFFSET FLAT:$SG71749
	mov	edx, DWORD PTR _cntxt$[ebp]
	push	edx
	call	_err_clear
	add	esp, 16					; 00000010H
	jmp	$L71662
$L71747:

; 1380 : 				end = tbl->data.nbrows;

	mov	eax, DWORD PTR _tbl$[ebp]
	mov	ecx, DWORD PTR [eax+220]
	mov	DWORD PTR _end$71665[ebp], ecx
$L71746:

; 1382 : 
; 1383 : 			/* Mark value column */
; 1384 : 			for(j = beg; j < end; j++)

	mov	edx, DWORD PTR _beg$71664[ebp]
	mov	DWORD PTR _j$[ebp], edx
	jmp	SHORT $L71750
$L71751:
	mov	eax, DWORD PTR _j$[ebp]
	add	eax, 1
	mov	DWORD PTR _j$[ebp], eax
$L71750:
	mov	ecx, DWORD PTR _j$[ebp]
	cmp	ecx, DWORD PTR _end$71665[ebp]
	jae	$L71752

; 1386 : 				DynTableCell *val = dyntab_cell(&tbl->data, j, 0);

	push	0
	mov	edx, DWORD PTR _j$[ebp]
	push	edx
	mov	eax, DWORD PTR _tbl$[ebp]
	add	eax, 220				; 000000dcH
	push	eax
	call	_dyntab_cell
	add	esp, 12					; 0000000cH
	mov	DWORD PTR _val$71753[ebp], eax

; 1387 : 				QryBuilNode *lastnode = flt.node + flt.nbnode - (flt.nbnode ? 1 : 0);

	mov	ecx, DWORD PTR _flt$[ebp+4424]
	imul	ecx, 136				; 00000088H
	lea	edx, DWORD PTR _flt$[ebp+ecx+72]
	xor	eax, eax
	cmp	DWORD PTR _flt$[ebp+4424], 0
	setne	al
	imul	eax, 136				; 00000088H
	sub	edx, eax
	mov	DWORD PTR _lastnode$71754[ebp], edx

; 1388 : 
; 1389 : 				/* Search field in fields columns (handle multiple fields ordering) */
; 1390 : 				k = 0;

	mov	DWORD PTR _k$[ebp], 0

; 1391 : 				if(val->field) for(k = 0; k < lastnode->field.nbrows && strcmp(dyntab_val(&lastnode->field, k, 0), val->field); k++);

	mov	ecx, DWORD PTR _val$71753[ebp]
	cmp	DWORD PTR [ecx+8], 0
	je	SHORT $L71758
	mov	DWORD PTR _k$[ebp], 0
	jmp	SHORT $L71756
$L71757:
	mov	edx, DWORD PTR _k$[ebp]
	add	edx, 1
	mov	DWORD PTR _k$[ebp], edx
$L71756:
	mov	eax, DWORD PTR _lastnode$71754[ebp]
	mov	ecx, DWORD PTR _k$[ebp]
	cmp	ecx, DWORD PTR [eax]
	jae	SHORT $L71758
	mov	edx, DWORD PTR _val$71753[ebp]
	mov	eax, DWORD PTR [edx+8]
	push	eax
	push	0
	mov	ecx, DWORD PTR _k$[ebp]
	push	ecx
	mov	edx, DWORD PTR _lastnode$71754[ebp]
	push	edx
	call	_dyntab_val
	add	esp, 12					; 0000000cH
	push	eax
	call	_strcmp
	add	esp, 8
	test	eax, eax
	je	SHORT $L71758
	jmp	SHORT $L71757
$L71758:

; 1392 : 				if(flt.b_oper || k < lastnode->field.nbrows)

	cmp	DWORD PTR _flt$[ebp+4432], 0
	jne	SHORT $L71760
	mov	eax, DWORD PTR _lastnode$71754[ebp]
	mov	ecx, DWORD PTR _k$[ebp]
	cmp	ecx, DWORD PTR [eax]
	jae	SHORT $L71761
$L71760:

; 1394 : 					val->col = i;

	mov	edx, DWORD PTR _val$71753[ebp]
	mov	eax, DWORD PTR _i$[ebp]
	mov	DWORD PTR [edx+56], eax

; 1395 : 					val->row = k;

	mov	ecx, DWORD PTR _val$71753[ebp]
	mov	edx, DWORD PTR _k$[ebp]
	mov	DWORD PTR [ecx+60], edx

; 1396 : 					if(flt.b_oper) M_FREE(val->field);

	cmp	DWORD PTR _flt$[ebp+4432], 0
	je	SHORT $L71761
	mov	eax, DWORD PTR _val$71753[ebp]
	mov	ecx, DWORD PTR [eax+8]
	push	ecx
	call	_mem_free
	add	esp, 4
	mov	edx, DWORD PTR _val$71753[ebp]
	mov	DWORD PTR [edx+8], 0
$L71761:

; 1398 : 			}

	jmp	$L71751
$L71752:

; 1400 : 	}

	jmp	$L71662
$L71663:

; 1401 : 
; 1402 : 	/* Sort on Id, col, Field, Line, Num */
; 1403 : 	dyntab_sort(&tbl->data, qsort_colval);

	push	OFFSET FLAT:_qsort_colval
	mov	eax, DWORD PTR _tbl$[ebp]
	add	eax, 220				; 000000dcH
	push	eax
	call	_dyntab_sort
	add	esp, 8
$eva_noerr$71654:

; 1404 : 
; 1405 : 	RETURN_OK_CLEANUP;

	push	0
	push	OFFSET FLAT:$SG71762
	push	OFFSET FLAT:$SG71763
	mov	ecx, DWORD PTR _cntxt$[ebp]
	push	ecx
	call	_err_clear
	add	esp, 16					; 00000010H
$eva_err$71657:
	mov	edx, DWORD PTR _cntxt$[ebp]
	cmp	DWORD PTR [edx+29872], 0
	je	SHORT $L71764
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	ecx, DWORD PTR [eax+29900]
	push	ecx
	push	OFFSET FLAT:$SG71765
	push	OFFSET FLAT:$SG71766
	mov	edx, DWORD PTR _cntxt$[ebp]
	push	edx
	call	_err_add_context
	add	esp, 16					; 00000010H
$L71764:
	mov	eax, DWORD PTR _sql$[ebp]
	push	eax
	call	_mem_free
	add	esp, 4
	mov	DWORD PTR _sql$[ebp], 0
	lea	ecx, DWORD PTR _data$[ebp]
	push	ecx
	call	_dyntab_free
	add	esp, 4
	lea	edx, DWORD PTR _tmp$[ebp]
	push	edx
	call	_dyntab_free
	add	esp, 4
	lea	eax, DWORD PTR _flt$[ebp]
	push	eax
	call	_qry_build_free
	add	esp, 4
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	edx, DWORD PTR _sql_trace$[ebp]
	mov	DWORD PTR [ecx+29852], edx
	mov	eax, DWORD PTR _cntxt$[ebp]
	xor	ecx, ecx
	cmp	DWORD PTR [eax+29872], 0
	setne	cl
	mov	eax, ecx

; 1406 : }

	pop	edi
	mov	esp, ebp
	pop	ebp
	ret	0
_qry_list_data ENDP
_TEXT	ENDS
EXTRN	_calloc:NEAR
EXTRN	_err_print_dyntab:NEAR
_DATA	SEGMENT
	ORG $+2
$SG71785 DB	'IdObj', 00H
	ORG $+2
$SG71786 DB	'IdObj', 00H
	ORG $+2
$SG71787 DB	'Pkey', 00H
	ORG $+3
$SG71788 DB	'Pkey', 00H
	ORG $+3
$SG71789 DB	'Num', 00H
$SG71790 DB	'Num', 00H
$SG71791 DB	'Line', 00H
	ORG $+3
$SG71792 DB	'Line', 00H
	ORG $+3
$SG71793 DB	'IdValue', 00H
$SG71794 DB	'IdValue', 00H
$SG71795 DB	'IdField', 00H
$SG71796 DB	'IdField', 00H
$SG71797 DB	'IdValObj', 00H
	ORG $+3
$SG71798 DB	'IdValObj', 00H
	ORG $+3
$SG71808 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG71824 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG71838 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG71858 DB	'D:\Travail\ABI\EVA\V4.0\CGI\Brunix-2016\qry_utils.c', 00H
$SG71859 DB	'sql_get_table', 00H
	ORG $+2
$SG71861 DB	'D:\Travail\ABI\EVA\V4.0\CGI\Brunix-2016\qry_utils.c', 00H
$SG71862 DB	'sql_get_table', 00H
_DATA	ENDS
_TEXT	SEGMENT
_cntxt$ = 8
_tab$ = 12
_options$ = 16
_row$ = -16
_i$ = -32
_j$ = -36
_irow$ = -28
_icol$ = -20
_fields$ = -24
_fld$ = -64
_c$71828 = -68
_id$71841 = -72
_sql_get_table PROC NEAR

; 1426 : ){

	push	ebp
	mov	ebp, esp
	sub	esp, 88					; 00000058H

; 1427 : 	EVA_sql_row row = {0};

	mov	DWORD PTR _row$[ebp], 0
	xor	eax, eax
	mov	DWORD PTR _row$[ebp+4], eax
	mov	DWORD PTR _row$[ebp+8], eax
	mov	DWORD PTR _row$[ebp+12], eax

; 1428 : 	unsigned long i, j, irow = (tab && !options) ? tab->nbrows : 0, icol;

	cmp	DWORD PTR _tab$[ebp], 0
	je	SHORT $L72110
	cmp	DWORD PTR _options$[ebp], 0
	jne	SHORT $L72110
	mov	ecx, DWORD PTR _tab$[ebp]
	mov	edx, DWORD PTR [ecx]
	mov	DWORD PTR -76+[ebp], edx
	jmp	SHORT $L72111
$L72110:
	mov	DWORD PTR -76+[ebp], 0
$L72111:
	mov	eax, DWORD PTR -76+[ebp]
	mov	DWORD PTR _irow$[ebp], eax

; 1429 : 	int *fields = NULL;

	mov	DWORD PTR _fields$[ebp], 0

; 1430 : 	char *fld[] = { "IdObj", "Pkey", "Num", "Line", "IdValue", "IdField", "IdValObj" };

	mov	DWORD PTR _fld$[ebp], OFFSET FLAT:$SG71786
	mov	DWORD PTR _fld$[ebp+4], OFFSET FLAT:$SG71788
	mov	DWORD PTR _fld$[ebp+8], OFFSET FLAT:$SG71790
	mov	DWORD PTR _fld$[ebp+12], OFFSET FLAT:$SG71792
	mov	DWORD PTR _fld$[ebp+16], OFFSET FLAT:$SG71794
	mov	DWORD PTR _fld$[ebp+20], OFFSET FLAT:$SG71796
	mov	DWORD PTR _fld$[ebp+24], OFFSET FLAT:$SG71798

; 1431 : 
; 1432 : 	if(!cntxt->sql_result || !tab) RETURN_OK;

	mov	ecx, DWORD PTR _cntxt$[ebp]
	cmp	DWORD PTR [ecx+29832], 0
	je	SHORT $L71800
	cmp	DWORD PTR _tab$[ebp], 0
	jne	SHORT $L71799
$L71800:
	jmp	$eva_noerr$71801
$L71799:

; 1433 : 
; 1434 : 	/* Initialize table */
; 1435 : 	if(options) dyntab_free(tab);

	cmp	DWORD PTR _options$[ebp], 0
	je	SHORT $L71802
	mov	edx, DWORD PTR _tab$[ebp]
	push	edx
	call	_dyntab_free
	add	esp, 4
$L71802:

; 1436 : 
; 1437 : 	/* Get first row */
; 1438 : 	if(sql_result_next_row(cntxt, &row)) STACK_ERROR;

	lea	eax, DWORD PTR _row$[ebp]
	push	eax
	mov	ecx, DWORD PTR _cntxt$[ebp]
	push	ecx
	call	_sql_result_next_row
	add	esp, 8
	test	eax, eax
	je	SHORT $L71803
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 1438		; 0000059eH
	jmp	$eva_err$71804
$L71803:

; 1439 : 
; 1440 : 	/* Handle fields names if applicable */
; 1441 : 	if(options & 4)

	mov	eax, DWORD PTR _options$[ebp]
	and	eax, 4
	test	eax, eax
	je	$L71812

; 1443 : 		C_ALLOC(fields, sizeof(fields[0]), row.nbcols);

	mov	ecx, DWORD PTR _row$[ebp]
	push	ecx
	push	4
	call	_calloc
	add	esp, 8
	mov	DWORD PTR _fields$[ebp], eax
	cmp	DWORD PTR _fields$[ebp], 0
	jne	SHORT $L71806
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29872], OFFSET FLAT:$SG71808
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 1443		; 000005a3H
	jmp	$eva_err$71804
$L71806:

; 1444 : 		for(i = 0; i < row.nbcols; i++)

	mov	DWORD PTR _i$[ebp], 0
	jmp	SHORT $L71810
$L71811:
	mov	ecx, DWORD PTR _i$[ebp]
	add	ecx, 1
	mov	DWORD PTR _i$[ebp], ecx
$L71810:
	mov	edx, DWORD PTR _i$[ebp]
	cmp	edx, DWORD PTR _row$[ebp]
	jae	SHORT $L71812

; 1445 : 			for(j = 0; j < sizeof(fld)/sizeof(fld[0]); j++)

	mov	DWORD PTR _j$[ebp], 0
	jmp	SHORT $L71813
$L71814:
	mov	eax, DWORD PTR _j$[ebp]
	add	eax, 1
	mov	DWORD PTR _j$[ebp], eax
$L71813:
	cmp	DWORD PTR _j$[ebp], 7
	jae	SHORT $L71815

; 1446 : 				if(!strcmp(row.name[i], fld[j]))

	mov	ecx, DWORD PTR _j$[ebp]
	mov	edx, DWORD PTR _fld$[ebp+ecx*4]
	push	edx
	mov	eax, DWORD PTR _i$[ebp]
	mov	ecx, DWORD PTR _row$[ebp+4]
	mov	edx, DWORD PTR [ecx+eax*4]
	push	edx
	call	_strcmp
	add	esp, 8
	test	eax, eax
	jne	SHORT $L71816

; 1448 : 					fields[i] = j + 1;

	mov	eax, DWORD PTR _j$[ebp]
	add	eax, 1
	mov	ecx, DWORD PTR _i$[ebp]
	mov	edx, DWORD PTR _fields$[ebp]
	mov	DWORD PTR [edx+ecx*4], eax

; 1449 : 					break;

	jmp	SHORT $L71815
$L71816:

; 1451 : 	}

	jmp	SHORT $L71814
$L71815:
	jmp	SHORT $L71811
$L71812:

; 1452 : 
; 1453 : 	/* Set first line with field names */
; 1454 : 	if(options & 1)

	mov	eax, DWORD PTR _options$[ebp]
	and	eax, 1
	test	eax, eax
	je	SHORT $L71817

; 1456 : 		for(i = 0; i < row.nbcols; i++)

	mov	DWORD PTR _i$[ebp], 0
	jmp	SHORT $L71818
$L71819:
	mov	ecx, DWORD PTR _i$[ebp]
	add	ecx, 1
	mov	DWORD PTR _i$[ebp], ecx
$L71818:
	mov	edx, DWORD PTR _i$[ebp]
	cmp	edx, DWORD PTR _row$[ebp]
	jae	SHORT $L71820

; 1457 : 			DYNTAB_ADD(tab, 0, i, row.name[i], 0, NO_CONV);

	push	0
	push	0
	push	0
	mov	eax, DWORD PTR _i$[ebp]
	mov	ecx, DWORD PTR _row$[ebp+4]
	mov	edx, DWORD PTR [ecx+eax*4]
	push	edx
	mov	eax, DWORD PTR _i$[ebp]
	push	eax
	push	0
	mov	ecx, DWORD PTR _tab$[ebp]
	push	ecx
	call	_dyntab_add
	add	esp, 28					; 0000001cH
	test	eax, eax
	je	SHORT $L71822
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29872], OFFSET FLAT:$SG71824
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 1457		; 000005b1H
	jmp	$eva_err$71804
$L71822:
	jmp	SHORT $L71819
$L71820:

; 1458 : 		irow = 1;

	mov	DWORD PTR _irow$[ebp], 1
$L71817:

; 1460 : 
; 1461 : 	/* Add result rows to table */
; 1462 : 	while(row.value)

	cmp	DWORD PTR _row$[ebp+8], 0
	je	$L71827

; 1464 : 		DynTableCell *c = NULL;

	mov	DWORD PTR _c$71828[ebp], 0

; 1465 : 		icol = 0;

	mov	DWORD PTR _icol$[ebp], 0

; 1466 : 		for(i = 0; i < row.nbcols; i++)

	mov	DWORD PTR _i$[ebp], 0
	jmp	SHORT $L71830
$L71831:
	mov	ecx, DWORD PTR _i$[ebp]
	add	ecx, 1
	mov	DWORD PTR _i$[ebp], ecx
$L71830:
	mov	edx, DWORD PTR _i$[ebp]
	cmp	edx, DWORD PTR _row$[ebp]
	jae	$L71832

; 1467 : 			if(!i || !fields || !fields[i])

	cmp	DWORD PTR _i$[ebp], 0
	je	SHORT $L71834
	cmp	DWORD PTR _fields$[ebp], 0
	je	SHORT $L71834
	mov	eax, DWORD PTR _i$[ebp]
	mov	ecx, DWORD PTR _fields$[ebp]
	cmp	DWORD PTR [ecx+eax*4], 0
	jne	SHORT $L71833
$L71834:

; 1469 : 				DYNTAB_ADD(tab, irow, icol++, row.value[i], row.sz[i], NO_CONV);

	push	0
	push	0
	mov	edx, DWORD PTR _i$[ebp]
	mov	eax, DWORD PTR _row$[ebp+12]
	mov	ecx, DWORD PTR [eax+edx*4]
	push	ecx
	mov	edx, DWORD PTR _i$[ebp]
	mov	eax, DWORD PTR _row$[ebp+8]
	mov	ecx, DWORD PTR [eax+edx*4]
	push	ecx
	mov	edx, DWORD PTR _icol$[ebp]
	mov	DWORD PTR -80+[ebp], edx
	mov	eax, DWORD PTR -80+[ebp]
	push	eax
	mov	ecx, DWORD PTR _irow$[ebp]
	push	ecx
	mov	edx, DWORD PTR _tab$[ebp]
	push	edx
	mov	eax, DWORD PTR _icol$[ebp]
	add	eax, 1
	mov	DWORD PTR _icol$[ebp], eax
	call	_dyntab_add
	add	esp, 28					; 0000001cH
	test	eax, eax
	je	SHORT $L71836
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29872], OFFSET FLAT:$SG71838
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 1469		; 000005bdH
	jmp	$eva_err$71804
$L71836:

; 1470 : 				if(!i) c = dyntab_cell(tab, irow, 0);

	cmp	DWORD PTR _i$[ebp], 0
	jne	SHORT $L71839
	push	0
	mov	eax, DWORD PTR _irow$[ebp]
	push	eax
	mov	ecx, DWORD PTR _tab$[ebp]
	push	ecx
	call	_dyntab_cell
	add	esp, 12					; 0000000cH
	mov	DWORD PTR _c$71828[ebp], eax
$L71839:

; 1472 : 			else

	jmp	$L71845
$L71833:

; 1474 : 				unsigned long id = row.value[i] ? strtoul(row.value[i], NULL, 10) : 0;

	mov	edx, DWORD PTR _i$[ebp]
	mov	eax, DWORD PTR _row$[ebp+8]
	cmp	DWORD PTR [eax+edx*4], 0
	je	SHORT $L72112
	push	10					; 0000000aH
	push	0
	mov	ecx, DWORD PTR _i$[ebp]
	mov	edx, DWORD PTR _row$[ebp+8]
	mov	eax, DWORD PTR [edx+ecx*4]
	push	eax
	call	_strtoul
	add	esp, 12					; 0000000cH
	mov	DWORD PTR -84+[ebp], eax
	jmp	SHORT $L72113
$L72112:
	mov	DWORD PTR -84+[ebp], 0
$L72113:
	mov	ecx, DWORD PTR -84+[ebp]
	mov	DWORD PTR _id$71841[ebp], ecx

; 1475 : 				if(id) switch(fields[i])

	cmp	DWORD PTR _id$71841[ebp], 0
	je	SHORT $L71845

; 1476 : 				{

	mov	edx, DWORD PTR _i$[ebp]
	mov	eax, DWORD PTR _fields$[ebp]
	mov	ecx, DWORD PTR [eax+edx*4]
	mov	DWORD PTR -88+[ebp], ecx
	mov	edx, DWORD PTR -88+[ebp]
	sub	edx, 1
	mov	DWORD PTR -88+[ebp], edx
	cmp	DWORD PTR -88+[ebp], 6
	ja	SHORT $L71845
	mov	eax, DWORD PTR -88+[ebp]
	jmp	DWORD PTR $L72114[eax*4]
$L71848:

; 1477 : 				case 1:	c->IdObj = id; break;

	mov	ecx, DWORD PTR _c$71828[ebp]
	mov	edx, DWORD PTR _id$71841[ebp]
	mov	DWORD PTR [ecx+20], edx
	jmp	SHORT $L71845
$L71849:

; 1478 : 				case 2:	c->Pkey = id; break;

	mov	eax, DWORD PTR _c$71828[ebp]
	mov	ecx, DWORD PTR _id$71841[ebp]
	mov	DWORD PTR [eax+16], ecx
	jmp	SHORT $L71845
$L71850:

; 1479 : 				case 3:	c->Num = id; break;

	mov	edx, DWORD PTR _c$71828[ebp]
	mov	eax, DWORD PTR _id$71841[ebp]
	mov	DWORD PTR [edx+36], eax
	jmp	SHORT $L71845
$L71851:

; 1480 : 				case 4:	c->Line = id; break;

	mov	ecx, DWORD PTR _c$71828[ebp]
	mov	edx, DWORD PTR _id$71841[ebp]
	mov	DWORD PTR [ecx+40], edx
	jmp	SHORT $L71845
$L71852:

; 1481 : 				case 5:	c->IdValue = id; break;

	mov	eax, DWORD PTR _c$71828[ebp]
	mov	ecx, DWORD PTR _id$71841[ebp]
	mov	DWORD PTR [eax+32], ecx
	jmp	SHORT $L71845
$L71853:

; 1482 : 				case 6:	c->IdField = id; break;

	mov	edx, DWORD PTR _c$71828[ebp]
	mov	eax, DWORD PTR _id$71841[ebp]
	mov	DWORD PTR [edx+28], eax
	jmp	SHORT $L71845
$L71854:

; 1483 : 				case 7:	c->IdValObj = id; break;

	mov	ecx, DWORD PTR _c$71828[ebp]
	mov	edx, DWORD PTR _id$71841[ebp]
	mov	DWORD PTR [ecx+24], edx
$L71845:

; 1485 : 			}

	jmp	$L71831
$L71832:

; 1486 : 		irow++;

	mov	eax, DWORD PTR _irow$[ebp]
	add	eax, 1
	mov	DWORD PTR _irow$[ebp], eax

; 1487 : 		if(sql_result_next_row(cntxt, &row)) STACK_ERROR;

	lea	ecx, DWORD PTR _row$[ebp]
	push	ecx
	mov	edx, DWORD PTR _cntxt$[ebp]
	push	edx
	call	_sql_result_next_row
	add	esp, 8
	test	eax, eax
	je	SHORT $L71855
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 1487		; 000005cfH
	jmp	SHORT $eva_err$71804
$L71855:

; 1488 : 	}

	jmp	$L71817
$L71827:

; 1489 : 
; 1490 : 	if(cntxt->sql_trace & DEBUG_SQL_RES)

	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	edx, DWORD PTR [ecx+29852]
	and	edx, 2
	test	edx, edx
	je	SHORT $eva_noerr$71801

; 1491 : 		err_print_dyntab(&cntxt->debug_msg, tab, 10, NO_CONV);

	push	0
	push	0
	push	10					; 0000000aH
	mov	eax, DWORD PTR _tab$[ebp]
	push	eax
	mov	ecx, DWORD PTR _cntxt$[ebp]
	add	ecx, 29864				; 000074a8H
	push	ecx
	call	_err_print_dyntab
	add	esp, 20					; 00000014H
$eva_noerr$71801:

; 1492 : 	RETURN_OK_CLEANUP;

	push	0
	push	OFFSET FLAT:$SG71858
	push	OFFSET FLAT:$SG71859
	mov	edx, DWORD PTR _cntxt$[ebp]
	push	edx
	call	_err_clear
	add	esp, 16					; 00000010H
$eva_err$71804:
	mov	eax, DWORD PTR _cntxt$[ebp]
	cmp	DWORD PTR [eax+29872], 0
	je	SHORT $L71860
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	edx, DWORD PTR [ecx+29900]
	push	edx
	push	OFFSET FLAT:$SG71861
	push	OFFSET FLAT:$SG71862
	mov	eax, DWORD PTR _cntxt$[ebp]
	push	eax
	call	_err_add_context
	add	esp, 16					; 00000010H
$L71860:
	mov	ecx, DWORD PTR _fields$[ebp]
	push	ecx
	call	_mem_free
	add	esp, 4
	mov	DWORD PTR _fields$[ebp], 0
	mov	edx, DWORD PTR _cntxt$[ebp]
	push	edx
	call	_sql_free_result
	add	esp, 4
	lea	eax, DWORD PTR _row$[ebp]
	push	eax
	call	_sql_free_row
	add	esp, 4
	mov	ecx, DWORD PTR _cntxt$[ebp]
	xor	eax, eax
	cmp	DWORD PTR [ecx+29872], 0
	setne	al

; 1493 : }

	mov	esp, ebp
	pop	ebp
	ret	0
$L72114:
	DD	$L71848
	DD	$L71849
	DD	$L71850
	DD	$L71851
	DD	$L71852
	DD	$L71853
	DD	$L71854
_sql_get_table ENDP
_TEXT	ENDS
PUBLIC	_sql_get_buf
_DATA	SEGMENT
	ORG $+2
$SG71890 DB	',', 00H
	ORG $+2
$SG71892 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG71896 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG71898 DB	'D:\Travail\ABI\EVA\V4.0\CGI\Brunix-2016\qry_utils.c', 00H
$SG71899 DB	'sql_get_buf', 00H
$SG71901 DB	'D:\Travail\ABI\EVA\V4.0\CGI\Brunix-2016\qry_utils.c', 00H
$SG71902 DB	'sql_get_buf', 00H
_DATA	ENDS
_TEXT	SEGMENT
_cntxt$ = 8
_res$ = 12
_options$ = 16
_row$ = -16
_i$ = -20
_sql_get_buf PROC NEAR

; 1511 : ){

	push	ebp
	mov	ebp, esp
	sub	esp, 20					; 00000014H

; 1512 : 	EVA_sql_row row = {0};

	mov	DWORD PTR _row$[ebp], 0
	xor	eax, eax
	mov	DWORD PTR _row$[ebp+4], eax
	mov	DWORD PTR _row$[ebp+8], eax
	mov	DWORD PTR _row$[ebp+12], eax

; 1513 : 	unsigned long i;
; 1514 : 
; 1515 : 	if(!cntxt->sql_result || !res) RETURN_OK;

	mov	ecx, DWORD PTR _cntxt$[ebp]
	cmp	DWORD PTR [ecx+29832], 0
	je	SHORT $L71876
	cmp	DWORD PTR _res$[ebp], 0
	jne	SHORT $L71875
$L71876:
	jmp	$eva_noerr$71877
$L71875:

; 1516 : 
; 1517 : 	/* Initialize result buffer */
; 1518 : 	if(options & 2) M_FREE(*res);

	mov	edx, DWORD PTR _options$[ebp]
	and	edx, 2
	test	edx, edx
	je	SHORT $L71878
	mov	eax, DWORD PTR _res$[ebp]
	mov	ecx, DWORD PTR [eax]
	push	ecx
	call	_mem_free
	add	esp, 4
	mov	edx, DWORD PTR _res$[ebp]
	mov	DWORD PTR [edx], 0
$L71878:

; 1519 : 
; 1520 : 	/* Get first row */
; 1521 : 	if(sql_result_next_row(cntxt, &row)) STACK_ERROR;

	lea	eax, DWORD PTR _row$[ebp]
	push	eax
	mov	ecx, DWORD PTR _cntxt$[ebp]
	push	ecx
	call	_sql_result_next_row
	add	esp, 8
	test	eax, eax
	je	SHORT $L71879
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 1521		; 000005f1H
	jmp	$eva_err$71880
$L71879:

; 1522 : 
; 1523 : 	/* Add result rows to list */
; 1524 : 	while(row.value)

	cmp	DWORD PTR _row$[ebp+8], 0
	je	$eva_noerr$71877

; 1526 : 		for(i = 0; i < row.nbcols; i++)

	mov	DWORD PTR _i$[ebp], 0
	jmp	SHORT $L71884
$L71885:
	mov	eax, DWORD PTR _i$[ebp]
	add	eax, 1
	mov	DWORD PTR _i$[ebp], eax
$L71884:
	mov	ecx, DWORD PTR _i$[ebp]
	cmp	ecx, DWORD PTR _row$[ebp]
	jae	$L71886

; 1528 : 			if(*res) DYNBUF_ADD_STR(res, ",");

	mov	edx, DWORD PTR _res$[ebp]
	cmp	DWORD PTR [edx], 0
	je	SHORT $L71889
	push	0
	push	0
	push	1
	push	OFFSET FLAT:$SG71890
	mov	eax, DWORD PTR _res$[ebp]
	push	eax
	call	_dynbuf_add
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L71889
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29872], OFFSET FLAT:$SG71892
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 1528		; 000005f8H
	jmp	$eva_err$71880
$L71889:

; 1529 : 			DYNBUF_ADD(res, row.value[i], row.sz[i], NO_CONV);

	push	0
	push	0
	mov	eax, DWORD PTR _i$[ebp]
	mov	ecx, DWORD PTR _row$[ebp+12]
	mov	edx, DWORD PTR [ecx+eax*4]
	push	edx
	mov	eax, DWORD PTR _i$[ebp]
	mov	ecx, DWORD PTR _row$[ebp+8]
	mov	edx, DWORD PTR [ecx+eax*4]
	push	edx
	mov	eax, DWORD PTR _res$[ebp]
	push	eax
	call	_dynbuf_add
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L71894
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29872], OFFSET FLAT:$SG71896
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 1529		; 000005f9H
	jmp	SHORT $eva_err$71880
$L71894:

; 1530 : 		}

	jmp	$L71885
$L71886:

; 1531 : 		if(sql_result_next_row(cntxt, &row)) STACK_ERROR;

	lea	eax, DWORD PTR _row$[ebp]
	push	eax
	mov	ecx, DWORD PTR _cntxt$[ebp]
	push	ecx
	call	_sql_result_next_row
	add	esp, 8
	test	eax, eax
	je	SHORT $L71897
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 1531		; 000005fbH
	jmp	SHORT $eva_err$71880
$L71897:

; 1532 : 	}

	jmp	$L71879
$eva_noerr$71877:

; 1533 : 
; 1534 : 	RETURN_OK_CLEANUP;

	push	0
	push	OFFSET FLAT:$SG71898
	push	OFFSET FLAT:$SG71899
	mov	eax, DWORD PTR _cntxt$[ebp]
	push	eax
	call	_err_clear
	add	esp, 16					; 00000010H
$eva_err$71880:
	mov	ecx, DWORD PTR _cntxt$[ebp]
	cmp	DWORD PTR [ecx+29872], 0
	je	SHORT $L71900
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	eax, DWORD PTR [edx+29900]
	push	eax
	push	OFFSET FLAT:$SG71901
	push	OFFSET FLAT:$SG71902
	mov	ecx, DWORD PTR _cntxt$[ebp]
	push	ecx
	call	_err_add_context
	add	esp, 16					; 00000010H
$L71900:
	mov	edx, DWORD PTR _cntxt$[ebp]
	push	edx
	call	_sql_free_result
	add	esp, 4
	lea	eax, DWORD PTR _row$[ebp]
	push	eax
	call	_sql_free_row
	add	esp, 4
	mov	ecx, DWORD PTR _cntxt$[ebp]
	xor	eax, eax
	cmp	DWORD PTR [ecx+29872], 0
	setne	al

; 1535 : }

	mov	esp, ebp
	pop	ebp
	ret	0
_sql_get_buf ENDP
_TEXT	ENDS
PUBLIC	_qry_exec_filter
EXTRN	_qry_build_flt_select:NEAR
EXTRN	_err_print_filter:NEAR
_DATA	SEGMENT
$SG71930 DB	'-- sql_get_listcol : read field data', 0aH, 00H
	ORG $+2
$SG71932 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG71937 DB	'-- sql_get_listcol : create ValList with field data', 0aH
	DB	'CREATE TEMPORARY TABLE ValList ', 00H
$SG71939 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG71955 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG71972 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG71982 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG71984 DB	'D:\Travail\ABI\EVA\V4.0\CGI\Brunix-2016\qry_utils.c', 00H
$SG71985 DB	'sql_get_listcol', 00H
$SG71987 DB	'D:\Travail\ABI\EVA\V4.0\CGI\Brunix-2016\qry_utils.c', 00H
$SG71988 DB	'sql_get_listcol', 00H
_DATA	ENDS
_TEXT	SEGMENT
_cntxt$ = 8
_res$ = 12
_idlist$ = 16
_flt$ = 20
_col$ = 24
_row$ = -20
_irow$ = -28
_irow0$ = -32
_sql$ = -4
_cell$ = -96
_sql_trace$ = -24
_size$71950 = -100
_src$71951 = -104
_size1$71952 = -108
_size$71967 = -112
_src$71968 = -116
_size1$71969 = -120
_sql_get_listcol PROC NEAR

; 1555 : ){

	push	ebp
	mov	ebp, esp
	sub	esp, 128				; 00000080H

; 1556 : 	EVA_sql_row row = {0};

	mov	DWORD PTR _row$[ebp], 0
	xor	eax, eax
	mov	DWORD PTR _row$[ebp+4], eax
	mov	DWORD PTR _row$[ebp+8], eax
	mov	DWORD PTR _row$[ebp+12], eax

; 1557 : 	unsigned long irow = res ? res->nbrows : 0, irow0 = irow;

	cmp	DWORD PTR _res$[ebp], 0
	je	SHORT $L72117
	mov	ecx, DWORD PTR _res$[ebp]
	mov	edx, DWORD PTR [ecx]
	mov	DWORD PTR -124+[ebp], edx
	jmp	SHORT $L72118
$L72117:
	mov	DWORD PTR -124+[ebp], 0
$L72118:
	mov	eax, DWORD PTR -124+[ebp]
	mov	DWORD PTR _irow$[ebp], eax
	mov	ecx, DWORD PTR _irow$[ebp]
	mov	DWORD PTR _irow0$[ebp], ecx

; 1558 :  	DynBuffer *sql = NULL;

	mov	DWORD PTR _sql$[ebp], 0

; 1559 : 	DynTableCell cell;
; 1560 : 	int sql_trace = cntxt->sql_trace;

	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	eax, DWORD PTR [edx+29852]
	mov	DWORD PTR _sql_trace$[ebp], eax

; 1561 : 
; 1562 : 	if(!flt->select || (idlist && !idlist->nbrows)) RETURN_OK;

	mov	ecx, DWORD PTR _flt$[ebp]
	cmp	DWORD PTR [ecx+28], 0
	je	SHORT $L71925
	cmp	DWORD PTR _idlist$[ebp], 0
	je	SHORT $L71924
	mov	edx, DWORD PTR _idlist$[ebp]
	cmp	DWORD PTR [edx], 0
	jne	SHORT $L71924
$L71925:
	jmp	$eva_noerr$71926
$L71924:

; 1563 : 
; 1564 : 	/* Build query for field data */
; 1565 : 	if(res)

	cmp	DWORD PTR _res$[ebp], 0
	je	SHORT $L71927

; 1567 : 			"-- sql_get_listcol : read field data\n")

	push	0
	push	0
	push	37					; 00000025H
	push	OFFSET FLAT:$SG71930
	lea	eax, DWORD PTR _sql$[ebp]
	push	eax
	call	_dynbuf_add
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L71929
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29872], OFFSET FLAT:$SG71932
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 1567		; 0000061fH
	jmp	$eva_err$71933
$L71929:

; 1568 : 	else

	jmp	SHORT $L71936
$L71927:

; 1570 : 			"-- sql_get_listcol : create ValList with field data\n"
; 1571 : 			"CREATE TEMPORARY TABLE ValList ");

	push	0
	push	0
	push	83					; 00000053H
	push	OFFSET FLAT:$SG71937
	lea	eax, DWORD PTR _sql$[ebp]
	push	eax
	call	_dynbuf_add
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L71936
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29872], OFFSET FLAT:$SG71939
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 1571		; 00000623H
	jmp	$eva_err$71933
$L71936:

; 1572 : 
; 1573 : 	/* Build & exec Query - return on error */
; 1574 : 	if(flt->debug) cntxt->sql_trace = DEBUG_SQL_RES;

	mov	eax, DWORD PTR _flt$[ebp]
	cmp	DWORD PTR [eax+4444], 0
	je	SHORT $L71940
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29852], 2
$L71940:

; 1575 : 	if(qry_build_flt_select(cntxt, &sql, idlist, flt, 0, 0)) STACK_ERROR;

	push	0
	push	0
	mov	edx, DWORD PTR _flt$[ebp]
	push	edx
	mov	eax, DWORD PTR _idlist$[ebp]
	push	eax
	lea	ecx, DWORD PTR _sql$[ebp]
	push	ecx
	mov	edx, DWORD PTR _cntxt$[ebp]
	push	edx
	call	_qry_build_flt_select
	add	esp, 24					; 00000018H
	test	eax, eax
	je	SHORT $L71941
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 1575		; 00000627H
	jmp	$eva_err$71933
$L71941:

; 1576 : 	if(qry_exec_filter(cntxt, flt, sql->data)) STACK_ERROR;

	mov	ecx, DWORD PTR _sql$[ebp]
	add	ecx, 8
	push	ecx
	mov	edx, DWORD PTR _flt$[ebp]
	push	edx
	mov	eax, DWORD PTR _cntxt$[ebp]
	push	eax
	call	_qry_exec_filter
	add	esp, 12					; 0000000cH
	test	eax, eax
	je	SHORT $L71942
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 1576		; 00000628H
	jmp	$eva_err$71933
$L71942:

; 1577 : 
; 1578 : 	/* Output to DynTable : add result rows to table */
; 1579 : 	if(res)

	cmp	DWORD PTR _res$[ebp], 0
	je	$eva_noerr$71926

; 1581 : 		if(sql_result_next_row(cntxt, &row)) STACK_ERROR;

	lea	edx, DWORD PTR _row$[ebp]
	push	edx
	mov	eax, DWORD PTR _cntxt$[ebp]
	push	eax
	call	_sql_result_next_row
	add	esp, 8
	test	eax, eax
	je	SHORT $L71944
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 1581		; 0000062dH
	jmp	$eva_err$71933
$L71944:

; 1582 : 		while(row.value)

	cmp	DWORD PTR _row$[ebp+8], 0
	je	$L71947

; 1584 : 			/* Read IdObj & value in cell */
; 1585 : 			memset(&cell, 0, sizeof(cell));

	push	64					; 00000040H
	push	0
	lea	edx, DWORD PTR _cell$[ebp]
	push	edx
	call	_memset
	add	esp, 12					; 0000000cH

; 1586 : 			if(row.value[0]) cell.IdObj = strtoul(row.value[0], NULL, 10);

	mov	eax, DWORD PTR _row$[ebp+8]
	cmp	DWORD PTR [eax], 0
	je	SHORT $L71948
	push	10					; 0000000aH
	push	0
	mov	ecx, DWORD PTR _row$[ebp+8]
	mov	edx, DWORD PTR [ecx]
	push	edx
	call	_strtoul
	add	esp, 12					; 0000000cH
	mov	DWORD PTR _cell$[ebp+20], eax
$L71948:

; 1587 : 			cell.len = row.sz[1];

	mov	eax, DWORD PTR _row$[ebp+12]
	mov	ecx, DWORD PTR [eax+4]
	mov	DWORD PTR _cell$[ebp+4], ecx

; 1588 : 			M_STRDUP(cell.txt, row.value[1], cell.len);

	mov	edx, DWORD PTR _cell$[ebp+4]
	mov	DWORD PTR _size$71950[ebp], edx
	mov	eax, DWORD PTR _row$[ebp+8]
	mov	ecx, DWORD PTR [eax+4]
	mov	DWORD PTR _src$71951[ebp], ecx
	mov	edx, DWORD PTR _size$71950[ebp]
	add	edx, 1
	mov	DWORD PTR _size1$71952[ebp], edx
	mov	eax, DWORD PTR _size1$71952[ebp]
	push	eax
	call	_mem_alloc
	add	esp, 4
	mov	DWORD PTR _cell$[ebp], eax
	cmp	DWORD PTR _size1$71952[ebp], 0
	je	SHORT $L71953
	cmp	DWORD PTR _cell$[ebp], 0
	jne	SHORT $L71953
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29872], OFFSET FLAT:$SG71955
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 1588		; 00000634H
	jmp	$eva_err$71933
$L71953:
	cmp	DWORD PTR _src$71951[ebp], 0
	je	SHORT $L71957
	cmp	DWORD PTR _size$71950[ebp], 0
	je	SHORT $L71957
	mov	eax, DWORD PTR _size$71950[ebp]
	push	eax
	mov	ecx, DWORD PTR _src$71951[ebp]
	push	ecx
	mov	edx, DWORD PTR _cell$[ebp]
	push	edx
	call	_memcpy
	add	esp, 12					; 0000000cH
$L71957:

; 1589 : 			cell.col = col;

	mov	eax, DWORD PTR _col$[ebp]
	mov	DWORD PTR _cell$[ebp+56], eax

; 1590 : 
; 1591 : 			/* Read optional columns */
; 1592 : 			if(row.nbcols > 2 && row.value[2]) cell.IdValObj = strtoul(row.value[2], NULL, 10);

	cmp	DWORD PTR _row$[ebp], 2
	jbe	SHORT $L71958
	mov	ecx, DWORD PTR _row$[ebp+8]
	cmp	DWORD PTR [ecx+8], 0
	je	SHORT $L71958
	push	10					; 0000000aH
	push	0
	mov	edx, DWORD PTR _row$[ebp+8]
	mov	eax, DWORD PTR [edx+8]
	push	eax
	call	_strtoul
	add	esp, 12					; 0000000cH
	mov	DWORD PTR _cell$[ebp+24], eax
$L71958:

; 1593 : 			if(row.nbcols > 3)

	cmp	DWORD PTR _row$[ebp], 3
	jbe	$L71965

; 1595 : 				if(row.value[3]) cell.Num = strtoul(row.value[3], NULL, 10);

	mov	ecx, DWORD PTR _row$[ebp+8]
	cmp	DWORD PTR [ecx+12], 0
	je	SHORT $L71961
	push	10					; 0000000aH
	push	0
	mov	edx, DWORD PTR _row$[ebp+8]
	mov	eax, DWORD PTR [edx+12]
	push	eax
	call	_strtoul
	add	esp, 12					; 0000000cH
	mov	DWORD PTR _cell$[ebp+36], eax
$L71961:

; 1596 : 				if(row.value[4]) cell.Line = strtoul(row.value[4], NULL, 10);

	mov	ecx, DWORD PTR _row$[ebp+8]
	cmp	DWORD PTR [ecx+16], 0
	je	SHORT $L71963
	push	10					; 0000000aH
	push	0
	mov	edx, DWORD PTR _row$[ebp+8]
	mov	eax, DWORD PTR [edx+16]
	push	eax
	call	_strtoul
	add	esp, 12					; 0000000cH
	mov	DWORD PTR _cell$[ebp+40], eax
$L71963:

; 1597 : 				if(row.nbcols > 5)

	cmp	DWORD PTR _row$[ebp], 5
	jbe	$L71965

; 1599 : 					if(row.value[5]) M_STRDUP(cell.field, row.value[5], row.sz[5]);

	mov	ecx, DWORD PTR _row$[ebp+8]
	cmp	DWORD PTR [ecx+20], 0
	je	SHORT $L71974
	mov	edx, DWORD PTR _row$[ebp+12]
	mov	eax, DWORD PTR [edx+20]
	mov	DWORD PTR _size$71967[ebp], eax
	mov	ecx, DWORD PTR _row$[ebp+8]
	mov	edx, DWORD PTR [ecx+20]
	mov	DWORD PTR _src$71968[ebp], edx
	mov	eax, DWORD PTR _size$71967[ebp]
	add	eax, 1
	mov	DWORD PTR _size1$71969[ebp], eax
	mov	ecx, DWORD PTR _size1$71969[ebp]
	push	ecx
	call	_mem_alloc
	add	esp, 4
	mov	DWORD PTR _cell$[ebp+8], eax
	cmp	DWORD PTR _size1$71969[ebp], 0
	je	SHORT $L71970
	cmp	DWORD PTR _cell$[ebp+8], 0
	jne	SHORT $L71970
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29872], OFFSET FLAT:$SG71972
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 1599		; 0000063fH
	jmp	$eva_err$71933
$L71970:
	cmp	DWORD PTR _src$71968[ebp], 0
	je	SHORT $L71974
	cmp	DWORD PTR _size$71967[ebp], 0
	je	SHORT $L71974
	mov	ecx, DWORD PTR _size$71967[ebp]
	push	ecx
	mov	edx, DWORD PTR _src$71968[ebp]
	push	edx
	mov	eax, DWORD PTR _cell$[ebp+8]
	push	eax
	call	_memcpy
	add	esp, 12					; 0000000cH
$L71974:

; 1600 : 					if(row.value[6]) cell.IdField = strtoul(row.value[6], NULL, 10);

	mov	ecx, DWORD PTR _row$[ebp+8]
	cmp	DWORD PTR [ecx+24], 0
	je	SHORT $L71975
	push	10					; 0000000aH
	push	0
	mov	edx, DWORD PTR _row$[ebp+8]
	mov	eax, DWORD PTR [edx+24]
	push	eax
	call	_strtoul
	add	esp, 12					; 0000000cH
	mov	DWORD PTR _cell$[ebp+28], eax
$L71975:

; 1601 : 					if(row.value[7]) cell.IdValue = strtoul(row.value[7], NULL, 10);

	mov	ecx, DWORD PTR _row$[ebp+8]
	cmp	DWORD PTR [ecx+28], 0
	je	SHORT $L71977
	push	10					; 0000000aH
	push	0
	mov	edx, DWORD PTR _row$[ebp+8]
	mov	eax, DWORD PTR [edx+28]
	push	eax
	call	_strtoul
	add	esp, 12					; 0000000cH
	mov	DWORD PTR _cell$[ebp+32], eax
$L71977:

; 1602 : 					cell.b_relation = (char)(row.value[8] ? row.value[8][0] == '1' : 0);

	mov	ecx, DWORD PTR _row$[ebp+8]
	cmp	DWORD PTR [ecx+32], 0
	je	SHORT $L72119
	mov	edx, DWORD PTR _row$[ebp+8]
	mov	eax, DWORD PTR [edx+32]
	movsx	ecx, BYTE PTR [eax]
	xor	edx, edx
	cmp	ecx, 49					; 00000031H
	sete	dl
	mov	DWORD PTR -128+[ebp], edx
	jmp	SHORT $L72120
$L72119:
	mov	DWORD PTR -128+[ebp], 0
$L72120:
	mov	al, BYTE PTR -128+[ebp]
	mov	BYTE PTR _cell$[ebp+12], al
$L71965:

; 1605 : 
; 1606 : 			/* Add cell to results table & read next row */
; 1607 : 			if(dyntab_set(res, irow, 0, &cell)) RETURN_ERR_MEMORY;

	lea	ecx, DWORD PTR _cell$[ebp]
	push	ecx
	push	0
	mov	edx, DWORD PTR _irow$[ebp]
	push	edx
	mov	eax, DWORD PTR _res$[ebp]
	push	eax
	call	_dyntab_set
	add	esp, 16					; 00000010H
	test	eax, eax
	je	SHORT $L71980
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29872], OFFSET FLAT:$SG71982
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 1607		; 00000647H
	jmp	SHORT $eva_err$71933
$L71980:

; 1608 : 			irow++;

	mov	eax, DWORD PTR _irow$[ebp]
	add	eax, 1
	mov	DWORD PTR _irow$[ebp], eax

; 1609 : 			if(sql_result_next_row(cntxt, &row)) STACK_ERROR;

	lea	ecx, DWORD PTR _row$[ebp]
	push	ecx
	mov	edx, DWORD PTR _cntxt$[ebp]
	push	edx
	call	_sql_result_next_row
	add	esp, 8
	test	eax, eax
	je	SHORT $L71983
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 1609		; 00000649H
	jmp	SHORT $eva_err$71933
$L71983:

; 1610 : 		}

	jmp	$L71944
$L71947:

; 1611 : 
; 1612 : 		qry_debug_table(cntxt, res, irow0, irow);

	mov	ecx, DWORD PTR _irow$[ebp]
	push	ecx
	mov	edx, DWORD PTR _irow0$[ebp]
	push	edx
	mov	eax, DWORD PTR _res$[ebp]
	push	eax
	mov	ecx, DWORD PTR _cntxt$[ebp]
	push	ecx
	call	_qry_debug_table
	add	esp, 16					; 00000010H
$eva_noerr$71926:

; 1614 : 
; 1615 : 	RETURN_OK_CLEANUP;

	push	0
	push	OFFSET FLAT:$SG71984
	push	OFFSET FLAT:$SG71985
	mov	edx, DWORD PTR _cntxt$[ebp]
	push	edx
	call	_err_clear
	add	esp, 16					; 00000010H
$eva_err$71933:
	mov	eax, DWORD PTR _cntxt$[ebp]
	cmp	DWORD PTR [eax+29872], 0
	je	SHORT $L71986
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	edx, DWORD PTR [ecx+29900]
	push	edx
	push	OFFSET FLAT:$SG71987
	push	OFFSET FLAT:$SG71988
	mov	eax, DWORD PTR _cntxt$[ebp]
	push	eax
	call	_err_add_context
	add	esp, 16					; 00000010H
$L71986:
	mov	ecx, DWORD PTR _cntxt$[ebp]
	push	ecx
	call	_sql_free_result
	add	esp, 4
	lea	edx, DWORD PTR _row$[ebp]
	push	edx
	call	_sql_free_row
	add	esp, 4
	mov	eax, DWORD PTR _sql$[ebp]
	push	eax
	call	_mem_free
	add	esp, 4
	mov	DWORD PTR _sql$[ebp], 0
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	edx, DWORD PTR _sql_trace$[ebp]
	mov	DWORD PTR [ecx+29852], edx
	mov	eax, DWORD PTR _cntxt$[ebp]
	cmp	DWORD PTR [eax+29872], 0
	je	SHORT $L71989
	mov	ecx, DWORD PTR _flt$[ebp]
	push	ecx
	mov	edx, DWORD PTR _cntxt$[ebp]
	add	edx, 29876				; 000074b4H
	push	edx
	call	_err_print_filter
	add	esp, 8
$L71989:
	mov	eax, DWORD PTR _cntxt$[ebp]
	xor	ecx, ecx
	cmp	DWORD PTR [eax+29872], 0
	setne	cl
	mov	eax, ecx

; 1616 : }

	mov	esp, ebp
	pop	ebp
	ret	0
_sql_get_listcol ENDP
_TEXT	ENDS
PUBLIC	__real@8@3ffbccccccccccccd000
EXTRN	__fltused:NEAR
_DATA	SEGMENT
$SG72007 DB	'D:\Travail\ABI\EVA\V4.0\CGI\Brunix-2016\qry_utils.c', 00H
$SG72008 DB	'qry_exec_filter', 00H
$SG72010 DB	'D:\Travail\ABI\EVA\V4.0\CGI\Brunix-2016\qry_utils.c', 00H
$SG72011 DB	'qry_exec_filter', 00H
_DATA	ENDS
;	COMDAT __real@8@3ffbccccccccccccd000
; File D:\Travail\ABI\EVA\V4.0\CGI\Brunix-2016\qry_utils.c
CONST	SEGMENT
__real@8@3ffbccccccccccccd000 DQ 03fb999999999999ar ; 0.1
CONST	ENDS
_TEXT	SEGMENT
_cntxt$ = 8
_flt$ = 12
_qry$ = 16
_sqltrace$ = -4
_qry_exec_filter PROC NEAR

; 1630 : ){

	push	ebp
	mov	ebp, esp
	push	ecx

; 1631 : 	int sqltrace = cntxt->sql_trace;

	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	ecx, DWORD PTR [eax+29852]
	mov	DWORD PTR _sqltrace$[ebp], ecx

; 1632 : 	if(flt->debug) cntxt->sql_trace = DEBUG_SQL_RES;

	mov	edx, DWORD PTR _flt$[ebp]
	cmp	DWORD PTR [edx+4444], 0
	je	SHORT $L72001
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29852], 2
$L72001:

; 1633 : 	if(cntxt->sql_trace & DEBUG_SQL_RES) err_print_filter(&cntxt->debug_msg, flt);

	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	edx, DWORD PTR [ecx+29852]
	and	edx, 2
	test	edx, edx
	je	SHORT $L72002
	mov	eax, DWORD PTR _flt$[ebp]
	push	eax
	mov	ecx, DWORD PTR _cntxt$[ebp]
	add	ecx, 29864				; 000074a8H
	push	ecx
	call	_err_print_filter
	add	esp, 8
$L72002:

; 1634 : 	if(sql_exec_query(cntxt, qry)) STACK_ERROR;

	mov	edx, DWORD PTR _qry$[ebp]
	push	edx
	mov	eax, DWORD PTR _cntxt$[ebp]
	push	eax
	call	_sql_exec_query
	add	esp, 8
	test	eax, eax
	je	SHORT $L72003
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 1634		; 00000662H
	jmp	SHORT $eva_err$72004
$L72003:

; 1635 : 	if((cntxt->debug & DEBUG_SQL_SLOW && cntxt->sql_restime > DEBUG_SQL_SLOW_TH) && !(cntxt->sql_trace & DEBUG_SQL_RES))

	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	eax, DWORD PTR [edx+29860]
	and	eax, 64					; 00000040H
	test	eax, eax
	je	SHORT $L72005
	mov	ecx, DWORD PTR _cntxt$[ebp]
	fld	QWORD PTR [ecx+29840]
	fcomp	QWORD PTR __real@8@3ffbccccccccccccd000
	fnstsw	ax
	test	ah, 65					; 00000041H
	jne	SHORT $L72005
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	eax, DWORD PTR [edx+29852]
	and	eax, 2
	test	eax, eax
	jne	SHORT $L72005

; 1636 : 		err_print_filter(&cntxt->debug_msg, flt);

	mov	ecx, DWORD PTR _flt$[ebp]
	push	ecx
	mov	edx, DWORD PTR _cntxt$[ebp]
	add	edx, 29864				; 000074a8H
	push	edx
	call	_err_print_filter
	add	esp, 8
$L72005:

; 1637 : 	cntxt->sql_trace = sqltrace;

	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	ecx, DWORD PTR _sqltrace$[ebp]
	mov	DWORD PTR [eax+29852], ecx
$eva_noerr$72006:

; 1638 : 
; 1639 : 	RETURN_OK_CLEANUP;

	push	0
	push	OFFSET FLAT:$SG72007
	push	OFFSET FLAT:$SG72008
	mov	edx, DWORD PTR _cntxt$[ebp]
	push	edx
	call	_err_clear
	add	esp, 16					; 00000010H
$eva_err$72004:
	mov	eax, DWORD PTR _cntxt$[ebp]
	cmp	DWORD PTR [eax+29872], 0
	je	SHORT $L72009
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	edx, DWORD PTR [ecx+29900]
	push	edx
	push	OFFSET FLAT:$SG72010
	push	OFFSET FLAT:$SG72011
	mov	eax, DWORD PTR _cntxt$[ebp]
	push	eax
	call	_err_add_context
	add	esp, 16					; 00000010H
$L72009:
	mov	ecx, DWORD PTR _cntxt$[ebp]
	xor	eax, eax
	cmp	DWORD PTR [ecx+29872], 0
	setne	al

; 1640 : }

	mov	esp, ebp
	pop	ebp
	ret	0
_qry_exec_filter ENDP
_TEXT	ENDS
_DATA	SEGMENT
$SG72021 DB	'DROP TABLE IF EXISTS %s', 00H
_DATA	ENDS
_TEXT	SEGMENT
_cntxt$ = 8
_table$ = 12
_buf$ = -1024
_sql_drop_table PROC NEAR

; 1651 : ){

	push	ebp
	mov	ebp, esp
	sub	esp, 1024				; 00000400H

; 1652 : 	char buf[1024];
; 1653 : 	if(!table || !*table) return;

	cmp	DWORD PTR _table$[ebp], 0
	je	SHORT $L72020
	mov	eax, DWORD PTR _table$[ebp]
	movsx	ecx, BYTE PTR [eax]
	test	ecx, ecx
	jne	SHORT $L72019
$L72020:
	jmp	SHORT $L72017
$L72019:

; 1654 : 	snprintf(add_sz_str(buf), "DROP TABLE IF EXISTS %s", table);

	mov	edx, DWORD PTR _table$[ebp]
	push	edx
	push	OFFSET FLAT:$SG72021
	push	1023					; 000003ffH
	lea	eax, DWORD PTR _buf$[ebp]
	push	eax
	call	__snprintf
	add	esp, 16					; 00000010H

; 1655 : 	sql_exec_query(cntxt, buf);

	lea	ecx, DWORD PTR _buf$[ebp]
	push	ecx
	mov	edx, DWORD PTR _cntxt$[ebp]
	push	edx
	call	_sql_exec_query
	add	esp, 8
$L72017:

; 1656 : }

	mov	esp, ebp
	pop	ebp
	ret	0
_sql_drop_table ENDP
_TEXT	ENDS
END
