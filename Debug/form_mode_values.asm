	TITLE	D:\Travail\ABI\EVA\V4.0\CGI\Brunix-2016\form_mode_values.c
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
PUBLIC	_form_mode_values
EXTRN	_qsort_mode_values:NEAR
EXTRN	_table_free:NEAR
EXTRN	_datetxt_to_format:NEAR
EXTRN	_put_html_button_sz:NEAR
EXTRN	_table_row_bgcolor:NEAR
EXTRN	__snprintf:NEAR
EXTRN	_sprintf:NEAR
EXTRN	_sql_exec_query:NEAR
EXTRN	_sql_id_value:NEAR
EXTRN	_mem_free:NEAR
EXTRN	_obj_put_html_btn_label:NEAR
EXTRN	_qsort:NEAR
EXTRN	_plain_to_html:BYTE
EXTRN	_plain_to_xml:BYTE
EXTRN	_strtoul:NEAR
EXTRN	_dynbuf_add:NEAR
EXTRN	_dynbuf_add3:NEAR
EXTRN	_dynbuf_add3_int:NEAR
EXTRN	_dyntab_free:NEAR
EXTRN	_sql_get_table:NEAR
EXTRN	_dyntab_sz:NEAR
EXTRN	_dyntab_val:NEAR
EXTRN	_dyntab_cell:NEAR
EXTRN	_dyntab_copy:NEAR
EXTRN	_strcpy:NEAR
EXTRN	_dyntab_add:NEAR
EXTRN	_strcmp:NEAR
EXTRN	_ctrl_primary_handler:NEAR
EXTRN	_dyntab_set_txt:NEAR
EXTRN	_err_add_context:NEAR
EXTRN	_err_clear:NEAR
EXTRN	_strncmp:NEAR
EXTRN	_dyntab_cmp:NEAR
_BSS	SEGMENT
$SG70235 DB	01H DUP (?)
	ALIGN	4

$SG70330 DB	01H DUP (?)
	ALIGN	4

$SG70332 DB	01H DUP (?)
	ALIGN	4

$SG70504 DB	01H DUP (?)
_BSS	ENDS
_DATA	SEGMENT
$SG70228 DB	'BFIELD=', 00H
$SG70237 DB	'BCLR=', 00H
	ORG $+2
$SG70238 DB	'-- form_mode_values : Delete selected value', 0aH, 'UPDA'
	DB	'TE TLink SET DateDel=''%s'',IdWhoDel=%s WHERE Pkey=%s', 00H
$SG70245 DB	'-- form_mode_values : Read all object data', 0aH, 'SELEC'
	DB	'T ', 0aH, 'TLink.IdField, ', 0aH, 'TField.TxtValue, ', 0aH, 'T'
	DB	'Link.IdRelObj, ', 0aH, 'TLink.IdValue, ', 0aH, 'IF(TVal.TxtVa'
	DB	'lue IS NULL,TLink.IdRelObj,TVal.TxtValue), ', 0aH, 'TLink.Num'
	DB	', ', 0aH, 'TLink.Line, ', 0aH, 'TLink.Lang, ', 0aH, 'TLink.Da'
	DB	'teCr, ', 0aH, 'TLink.IdWhoCr, ', 0aH, 'TLink.DateDel, ', 0aH, 'T'
	DB	'Link.IdWhoDel, ', 0aH, 'TLink.Pkey', 09H, 0aH, 'FROM TLink LE'
	DB	'FT JOIN TVal ON TLink.IdValue = TVal.IdValue ', 0aH, 'INNER J'
	DB	'OIN TVal AS TField ON TLink.IdField = TField.IdValue ', 0aH, 'W'
	DB	'HERE TLink.IdObj=0%s ', 0aH, 'ORDER BY TLink.IdField,TLink.Li'
	DB	'ne,TLink.Num,TLink.Pkey DESC', 00H
$SG70249 DB	'Libell', 0e9H, 00H
$SG70251 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70253 DB	'Champ', 00H
	ORG $+2
$SG70255 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70257 DB	'Valeur', 00H
	ORG $+1
$SG70259 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70261 DB	'Index', 00H
	ORG $+2
$SG70263 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70265 DB	'Date', 00H
	ORG $+3
$SG70267 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70269 DB	'Utilisateur', 00H
$SG70271 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70273 DB	'Effac', 0e9H, 00H
	ORG $+1
$SG70275 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70277 DB	'Par', 00H
$SG70279 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70281 DB	'_EVA_USERNAME', 00H
	ORG $+2
$SG70298 DB	'_EVA_INPUT', 00H
	ORG $+1
$SG70304 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70307 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70311 DB	'_EVA_LOGIN', 00H
	ORG $+1
$SG70312 DB	'_EVA_PASSWORD', 00H
	ORG $+2
$SG70315 DB	'<font size=-1>******</font>', 00H
$SG70317 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70322 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70326 DB	'_EVA_RELATION', 00H
	ORG $+2
$SG70327 DB	'_EVA_NONE', 00H
	ORG $+2
$SG70328 DB	'_EVA_SameCell', 00H
	ORG $+2
$SG70329 DB	'888888', 00H
	ORG $+1
$SG70331 DB	'-1', 00H
	ORG $+1
$SG70335 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70340 DB	'</font>', 00H
$SG70341 DB	'<font size=-1>', 00H
	ORG $+1
$SG70343 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70348 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70354 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70357 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70360 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70362 DB	'BCLR=%lu', 00H
	ORG $+3
$SG70366 DB	'Efface cette valeur', 00H
$SG70367 DB	'_eva_cancel_s.gif', 00H
	ORG $+2
$SG70368 DB	'_eva_cancel.gif', 00H
$SG70373 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70379 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70385 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70386 DB	'-- form_mode_values : Read create username', 0aH, 'SELEC'
	DB	'T TVal.TxtValue ', 0aH, 'FROM TLink INNER JOIN TVal ON TLink.'
	DB	'IdValue = TVal.IdValue ', 0aH, 'WHERE TLink.DateDel is NULL A'
	DB	'ND TLink.IdField=%lu ', 0aH, 'AND TLink.IdObj=0%s', 00H
$SG70391 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70398 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70399 DB	'-- form_mode_values : Read delete username', 0aH, 'SELEC'
	DB	'T TVal.TxtValue ', 0aH, 'FROM TLink INNER JOIN TVal ON TLink.'
	DB	'IdValue = TVal.IdValue ', 0aH, 'WHERE TLink.DateDel is NULL A'
	DB	'ND TLink.IdField=%lu ', 0aH, 'AND TLink.IdObj=0%s', 00H
$SG70404 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70413 DB	'BFIELD=%s', 00H
	ORG $+2
$SG70417 DB	'Affiche l''historique de ce champ', 00H
	ORG $+3
$SG70418 DB	'_eva_history_s.gif', 00H
	ORG $+1
$SG70419 DB	'_eva_history.gif', 00H
	ORG $+3
$SG70424 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70430 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70434 DB	'<td align=center bgcolor=#FFFFFF>Historique de ', 00H
$SG70436 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70439 DB	'</b> - ', 00H
$SG70440 DB	'<b>', 00H
$SG70442 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70444 DB	'</font>]</td></tr><tr>', 00H
	ORG $+1
$SG70445 DB	'[<font face=Courier size=-1>', 00H
	ORG $+3
$SG70447 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70450 DB	'<td><table width=100% cellspacing=0 cellpadding=1 border'
	DB	'=1 rules=rows><tr>', 0aH, 00H
$SG70452 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70458 DB	'</font></td>', 0aH, 00H
	ORG $+2
$SG70459 DB	'<td bgcolor=#DDDDDD><font face=Arial size=-2>', 00H
	ORG $+2
$SG70461 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70464 DB	'</tr>', 0aH, 00H
	ORG $+1
$SG70466 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70475 DB	'FFFFFF', 00H
	ORG $+1
$SG70486 DB	'<tr>', 00H
	ORG $+3
$SG70488 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70495 DB	'<td bgcolor=#', 00H
	ORG $+2
$SG70497 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70501 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70505 DB	' rowspan=', 00H
	ORG $+2
$SG70507 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70511 DB	' background=''../img/bg_rayures_grises.gif''', 00H
	ORG $+1
$SG70513 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70516 DB	'>', 00H
	ORG $+2
$SG70518 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70522 DB	'</font></td>', 0aH, 00H
	ORG $+2
$SG70523 DB	'<font face=Arial size=-2>', 00H
	ORG $+2
$SG70525 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70529 DB	'<img src=''../img/_eva_spacer.gif'' border=0></td>', 0aH
	DB	00H
	ORG $+2
$SG70531 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70534 DB	'</tr>', 0aH, 00H
	ORG $+1
$SG70536 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70539 DB	'</table>', 00H
	ORG $+3
$SG70541 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70543 DB	'D:\Travail\ABI\EVA\V4.0\CGI\Brunix-2016\form_mode_values'
	DB	'.c', 00H
	ORG $+1
$SG70544 DB	'form_mode_values', 00H
	ORG $+3
$SG70546 DB	'D:\Travail\ABI\EVA\V4.0\CGI\Brunix-2016\form_mode_values'
	DB	'.c', 00H
	ORG $+1
$SG70547 DB	'form_mode_values', 00H
_DATA	ENDS
_TEXT	SEGMENT
_cntxt$ = 8
_form$ = -2056
_ctrl$ = -2848
_data$ = -2764
_table$ = -2788
_idobj$ = -2080
_objdata$ = -2824
_buf$ = -2060
_sql$ = -2052
_i$ = -2800
_j$ = -2804
_k$ = -2832
_l$ = -2844
_i_ctrl$ = -2828
_idfield$ = -2840
_val$ = -4
_clickbtn$ = -2792
_dispfield$ = -2836
_rawvalues$ = -2796
_tbl$ = -2744
_b_ident_user$ = -2768
_field$70285 = -2856
_Num$70286 = -2868
_Line$70288 = -2852
_datedel$70290 = -2864
_b_changefield$70291 = -2860
_b_head$70470 = -2872
_bgcolor$70471 = -2876
_form_mode_values PROC NEAR

; 29   : ){

	push	ebp
	mov	ebp, esp
	sub	esp, 2900				; 00000b54H
	push	esi
	push	edi

; 30   : 	EVA_form *form = cntxt->form;

	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	ecx, DWORD PTR [eax+80]
	mov	DWORD PTR _form$[ebp], ecx

; 31   : 	EVA_ctrl *ctrl = form->ctrl;

	mov	edx, DWORD PTR _form$[ebp]
	mov	eax, DWORD PTR [edx]
	mov	DWORD PTR _ctrl$[ebp], eax

; 32   : 	DynTable data = { 0 };

	mov	DWORD PTR _data$[ebp], 0
	xor	ecx, ecx
	mov	DWORD PTR _data$[ebp+4], ecx
	mov	DWORD PTR _data$[ebp+8], ecx
	mov	DWORD PTR _data$[ebp+12], ecx
	mov	DWORD PTR _data$[ebp+16], ecx

; 33   : 	DynTable table = { 0 };

	mov	DWORD PTR _table$[ebp], 0
	xor	edx, edx
	mov	DWORD PTR _table$[ebp+4], edx
	mov	DWORD PTR _table$[ebp+8], edx
	mov	DWORD PTR _table$[ebp+12], edx
	mov	DWORD PTR _table$[ebp+16], edx

; 34   : 	DynTable idobj = { 0 };

	mov	DWORD PTR _idobj$[ebp], 0
	xor	eax, eax
	mov	DWORD PTR _idobj$[ebp+4], eax
	mov	DWORD PTR _idobj$[ebp+8], eax
	mov	DWORD PTR _idobj$[ebp+12], eax
	mov	DWORD PTR _idobj$[ebp+16], eax

; 35   : 	DynTable objdata = { 0 };

	mov	DWORD PTR _objdata$[ebp], 0
	xor	ecx, ecx
	mov	DWORD PTR _objdata$[ebp+4], ecx
	mov	DWORD PTR _objdata$[ebp+8], ecx
	mov	DWORD PTR _objdata$[ebp+12], ecx
	mov	DWORD PTR _objdata$[ebp+16], ecx

; 36   : 	DynBuffer *buf = NULL;

	mov	DWORD PTR _buf$[ebp], 0

; 37   : 	char sql[2048];
; 38   : 	unsigned long i, j, k, l, i_ctrl, idfield;
; 39   : 	DynTableCell *val;
; 40   : 	char *clickbtn = cntxt->cgi ? cntxt->cgi[cntxt->cgibtn].name : NULL;

	mov	edx, DWORD PTR _cntxt$[ebp]
	cmp	DWORD PTR [edx+29648], 0
	je	SHORT $L70552
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	ecx, DWORD PTR [eax+29656]
	imul	ecx, 56					; 00000038H
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	eax, DWORD PTR [edx+29648]
	mov	ecx, DWORD PTR [eax+ecx]
	mov	DWORD PTR -2880+[ebp], ecx
	jmp	SHORT $L70553
$L70552:
	mov	DWORD PTR -2880+[ebp], 0
$L70553:
	mov	edx, DWORD PTR -2880+[ebp]
	mov	DWORD PTR _clickbtn$[ebp], edx

; 41   : 	char *dispfield = !clickbtn ? NULL : strncmp(clickbtn, add_sz_str("BFIELD=")) ? NULL : clickbtn + 7;

	cmp	DWORD PTR _clickbtn$[ebp], 0
	jne	SHORT $L70556
	mov	DWORD PTR -2884+[ebp], 0
	jmp	SHORT $L70557
$L70556:
	push	7
	push	OFFSET FLAT:$SG70228
	mov	eax, DWORD PTR _clickbtn$[ebp]
	push	eax
	call	_strncmp
	add	esp, 12					; 0000000cH
	test	eax, eax
	je	SHORT $L70554
	mov	DWORD PTR -2888+[ebp], 0
	jmp	SHORT $L70555
$L70554:
	mov	ecx, DWORD PTR _clickbtn$[ebp]
	add	ecx, 7
	mov	DWORD PTR -2888+[ebp], ecx
$L70555:
	mov	edx, DWORD PTR -2888+[ebp]
	mov	DWORD PTR -2884+[ebp], edx
$L70557:
	mov	eax, DWORD PTR -2884+[ebp]
	mov	DWORD PTR _dispfield$[ebp], eax

; 42   : 	int rawvalues = 0;

	mov	DWORD PTR _rawvalues$[ebp], 0

; 43   : 	ObjTableFormat tbl = {0};

	mov	DWORD PTR _tbl$[ebp], 0
	mov	ecx, 165				; 000000a5H
	xor	eax, eax
	lea	edi, DWORD PTR _tbl$[ebp+4]
	rep stosd

; 44   : 	int b_ident_user = DYNTAB_TOUL(&form->id_obj) == DYNTAB_TOUL(&cntxt->id_user);

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
	mov	esi, eax
	push	10					; 0000000aH
	push	0
	push	0
	push	0
	mov	edx, DWORD PTR _cntxt$[ebp]
	add	edx, 29408				; 000072e0H
	push	edx
	call	_dyntab_val
	add	esp, 12					; 0000000cH
	push	eax
	call	_strtoul
	add	esp, 12					; 0000000cH
	xor	ecx, ecx
	cmp	esi, eax
	sete	cl
	mov	DWORD PTR _b_ident_user$[ebp], ecx

; 45   : 
; 46   : 	/* Handle buttons */
; 47   : 	if(!clickbtn) clickbtn = "";

	cmp	DWORD PTR _clickbtn$[ebp], 0
	jne	SHORT $L70234
	mov	DWORD PTR _clickbtn$[ebp], OFFSET FLAT:$SG70235
$L70234:

; 48   : 	if(!strncmp(clickbtn, add_sz_str("BCLR=")))

	push	5
	push	OFFSET FLAT:$SG70237
	mov	edx, DWORD PTR _clickbtn$[ebp]
	push	edx
	call	_strncmp
	add	esp, 12					; 0000000cH
	test	eax, eax
	jne	SHORT $L70239

; 50   : 		/* Delete value */
; 51   : 		snprintf(add_sz_str(sql),
; 52   : 		"-- form_mode_values : Delete selected value\n"
; 53   : 		"UPDATE TLink SET DateDel='%s',IdWhoDel=%s WHERE Pkey=%s",
; 54   : 		cntxt->timestamp, dyntab_val(&cntxt->id_user, 0, 0), clickbtn + 5);

	mov	eax, DWORD PTR _clickbtn$[ebp]
	add	eax, 5
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
	push	OFFSET FLAT:$SG70238
	push	2047					; 000007ffH
	lea	eax, DWORD PTR _sql$[ebp]
	push	eax
	call	__snprintf
	add	esp, 24					; 00000018H

; 55   : 		if(sql_exec_query(cntxt, sql)) STACK_ERROR;

	lea	ecx, DWORD PTR _sql$[ebp]
	push	ecx
	mov	edx, DWORD PTR _cntxt$[ebp]
	push	edx
	call	_sql_exec_query
	add	esp, 8
	test	eax, eax
	je	SHORT $L70239
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 55		; 00000037H
	jmp	$eva_err$70240
$L70239:

; 57   : 
; 58   : 	/* Read all object data */
; 59   : 	snprintf(add_sz_str(sql),
; 60   : 		"-- form_mode_values : Read all object data\n"
; 61   : 		"SELECT \n"
; 62   : 			"TLink.IdField, \n"
; 63   : 			"TField.TxtValue, \n"
; 64   : 			"TLink.IdRelObj, \n"
; 65   : 			"TLink.IdValue, \n"
; 66   : 			"IF(TVal.TxtValue IS NULL,TLink.IdRelObj,TVal.TxtValue), \n"
; 67   : 			"TLink.Num, \n"
; 68   : 			"TLink.Line, \n"
; 69   : 			"TLink.Lang, \n"
; 70   : #define _DateCr 8
; 71   : 			"TLink.DateCr, \n"
; 72   : #define _IdWhoCr 9
; 73   : 			"TLink.IdWhoCr, \n"
; 74   : #define _DateDel 10
; 75   : 			"TLink.DateDel, \n"
; 76   : #define _IdWhoDel 11
; 77   : 			"TLink.IdWhoDel, \n"
; 78   : 			"TLink.Pkey	\n"
; 79   : 		"FROM TLink LEFT JOIN TVal ON TLink.IdValue = TVal.IdValue \n"
; 80   : 		"INNER JOIN TVal AS TField ON TLink.IdField = TField.IdValue \n"
; 81   : 		"WHERE TLink.IdObj=0%s \n"
; 82   : 		"ORDER BY TLink.IdField,TLink.Line,TLink.Num,TLink.Pkey DESC", 
; 83   : 		dyntab_val(&form->id_obj, 0, 0));

	push	0
	push	0
	mov	ecx, DWORD PTR _form$[ebp]
	add	ecx, 32					; 00000020H
	push	ecx
	call	_dyntab_val
	add	esp, 12					; 0000000cH
	push	eax
	push	OFFSET FLAT:$SG70245
	push	2047					; 000007ffH
	lea	edx, DWORD PTR _sql$[ebp]
	push	edx
	call	__snprintf
	add	esp, 16					; 00000010H

; 84   : 	if(sql_exec_query(cntxt, sql) ||
; 85   : 		sql_get_table(cntxt, &data, 2)) STACK_ERROR;

	lea	eax, DWORD PTR _sql$[ebp]
	push	eax
	mov	ecx, DWORD PTR _cntxt$[ebp]
	push	ecx
	call	_sql_exec_query
	add	esp, 8
	test	eax, eax
	jne	SHORT $L70247
	push	2
	lea	edx, DWORD PTR _data$[ebp]
	push	edx
	mov	eax, DWORD PTR _cntxt$[ebp]
	push	eax
	call	_sql_get_table
	add	esp, 12					; 0000000cH
	test	eax, eax
	je	SHORT $L70246
$L70247:
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 85		; 00000055H
	jmp	$eva_err$70240
$L70246:

; 86   : 
; 87   : 	/* Set columns titles */
; 88   : 	DYNTAB_SET(&table, 0, table.nbcols, "Libellé");

	push	7
	push	OFFSET FLAT:$SG70249
	mov	edx, DWORD PTR _table$[ebp+8]
	push	edx
	push	0
	lea	eax, DWORD PTR _table$[ebp]
	push	eax
	call	_dyntab_set_txt
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L70248
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29872], OFFSET FLAT:$SG70251
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 88		; 00000058H
	jmp	$eva_err$70240
$L70248:

; 89   : 	DYNTAB_SET(&table, 0, table.nbcols, "Champ");

	push	5
	push	OFFSET FLAT:$SG70253
	mov	eax, DWORD PTR _table$[ebp+8]
	push	eax
	push	0
	lea	ecx, DWORD PTR _table$[ebp]
	push	ecx
	call	_dyntab_set_txt
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L70252
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29872], OFFSET FLAT:$SG70255
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 89		; 00000059H
	jmp	$eva_err$70240
$L70252:

; 90   : 	DYNTAB_SET(&table, 0, table.nbcols, "Valeur");

	push	6
	push	OFFSET FLAT:$SG70257
	mov	ecx, DWORD PTR _table$[ebp+8]
	push	ecx
	push	0
	lea	edx, DWORD PTR _table$[ebp]
	push	edx
	call	_dyntab_set_txt
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L70256
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29872], OFFSET FLAT:$SG70259
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 90		; 0000005aH
	jmp	$eva_err$70240
$L70256:

; 91   : 	DYNTAB_SET(&table, 0, table.nbcols, "Index"); table.nbcols += 3;

	push	5
	push	OFFSET FLAT:$SG70261
	mov	edx, DWORD PTR _table$[ebp+8]
	push	edx
	push	0
	lea	eax, DWORD PTR _table$[ebp]
	push	eax
	call	_dyntab_set_txt
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L70260
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29872], OFFSET FLAT:$SG70263
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 91		; 0000005bH
	jmp	$eva_err$70240
$L70260:
	mov	eax, DWORD PTR _table$[ebp+8]
	add	eax, 3
	mov	DWORD PTR _table$[ebp+8], eax

; 92   : 	DYNTAB_SET(&table, 0, table.nbcols, "Date");

	push	4
	push	OFFSET FLAT:$SG70265
	mov	ecx, DWORD PTR _table$[ebp+8]
	push	ecx
	push	0
	lea	edx, DWORD PTR _table$[ebp]
	push	edx
	call	_dyntab_set_txt
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L70264
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29872], OFFSET FLAT:$SG70267
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 92		; 0000005cH
	jmp	$eva_err$70240
$L70264:

; 93   : 	DYNTAB_SET(&table, 0, table.nbcols, "Utilisateur");

	push	11					; 0000000bH
	push	OFFSET FLAT:$SG70269
	mov	edx, DWORD PTR _table$[ebp+8]
	push	edx
	push	0
	lea	eax, DWORD PTR _table$[ebp]
	push	eax
	call	_dyntab_set_txt
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L70268
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29872], OFFSET FLAT:$SG70271
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 93		; 0000005dH
	jmp	$eva_err$70240
$L70268:

; 94   : 	DYNTAB_SET(&table, 0, table.nbcols, "Effacé");

	push	6
	push	OFFSET FLAT:$SG70273
	mov	eax, DWORD PTR _table$[ebp+8]
	push	eax
	push	0
	lea	ecx, DWORD PTR _table$[ebp]
	push	ecx
	call	_dyntab_set_txt
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L70272
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29872], OFFSET FLAT:$SG70275
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 94		; 0000005eH
	jmp	$eva_err$70240
$L70272:

; 95   : 	DYNTAB_SET(&table, 0, table.nbcols, "Par");

	push	3
	push	OFFSET FLAT:$SG70277
	mov	ecx, DWORD PTR _table$[ebp+8]
	push	ecx
	push	0
	lea	edx, DWORD PTR _table$[ebp]
	push	edx
	call	_dyntab_set_txt
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L70276
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29872], OFFSET FLAT:$SG70279
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 95		; 0000005fH
	jmp	$eva_err$70240
$L70276:

; 96   : 	
; 97   : 	/* Prepare table of values */
; 98   : 	if(sql_id_value(cntxt, add_sz_str("_EVA_USERNAME"), &idfield)) STACK_ERROR;

	lea	edx, DWORD PTR _idfield$[ebp]
	push	edx
	push	13					; 0000000dH
	push	OFFSET FLAT:$SG70281
	mov	eax, DWORD PTR _cntxt$[ebp]
	push	eax
	call	_sql_id_value
	add	esp, 16					; 00000010H
	test	eax, eax
	je	SHORT $L70280
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 98		; 00000062H
	jmp	$eva_err$70240
$L70280:

; 99   : 	form->html = &buf;

	mov	edx, DWORD PTR _form$[ebp]
	lea	eax, DWORD PTR _buf$[ebp]
	mov	DWORD PTR [edx+232], eax

; 100  : 	form->step = HtmlView;

	mov	ecx, DWORD PTR _form$[ebp]
	mov	DWORD PTR [ecx+176], 6

; 101  : 	form->b_noctrltree = 1;

	mov	edx, DWORD PTR _form$[ebp]
	mov	DWORD PTR [edx+200], 1

; 102  : 	for(i = 0; i < data.nbrows; i++)

	mov	DWORD PTR _i$[ebp], 0
	jmp	SHORT $L70282
$L70283:
	mov	eax, DWORD PTR _i$[ebp]
	add	eax, 1
	mov	DWORD PTR _i$[ebp], eax
$L70282:
	mov	ecx, DWORD PTR _i$[ebp]
	cmp	ecx, DWORD PTR _data$[ebp]
	jae	$L70284

; 104  : 		char *field = dyntab_val(&data, i, 1);

	push	1
	mov	edx, DWORD PTR _i$[ebp]
	push	edx
	lea	eax, DWORD PTR _data$[ebp]
	push	eax
	call	_dyntab_val
	add	esp, 12					; 0000000cH
	mov	DWORD PTR _field$70285[ebp], eax

; 105  : 		unsigned long Num = DYNTAB_TOULRC(&data, i, 5);

	push	10					; 0000000aH
	push	0
	push	5
	mov	ecx, DWORD PTR _i$[ebp]
	push	ecx
	lea	edx, DWORD PTR _data$[ebp]
	push	edx
	call	_dyntab_val
	add	esp, 12					; 0000000cH
	push	eax
	call	_strtoul
	add	esp, 12					; 0000000cH
	mov	DWORD PTR _Num$70286[ebp], eax

; 106  : 		unsigned long Line = DYNTAB_TOULRC(&data, i, 6);

	push	10					; 0000000aH
	push	0
	push	6
	mov	eax, DWORD PTR _i$[ebp]
	push	eax
	lea	ecx, DWORD PTR _data$[ebp]
	push	ecx
	call	_dyntab_val
	add	esp, 12					; 0000000cH
	push	eax
	call	_strtoul
	add	esp, 12					; 0000000cH
	mov	DWORD PTR _Line$70288[ebp], eax

; 107  : 		char *datedel = dyntab_val(&data, i, _DateDel);

	push	10					; 0000000aH
	mov	edx, DWORD PTR _i$[ebp]
	push	edx
	lea	eax, DWORD PTR _data$[ebp]
	push	eax
	call	_dyntab_val
	add	esp, 12					; 0000000cH
	mov	DWORD PTR _datedel$70290[ebp], eax

; 108  : 		int b_changefield;
; 109  : 
; 110  : 		/* Skip if field specified and different */
; 111  : 		if(dispfield && strcmp(dispfield, field)) continue;

	cmp	DWORD PTR _dispfield$[ebp], 0
	je	SHORT $L70292
	mov	ecx, DWORD PTR _field$70285[ebp]
	push	ecx
	mov	edx, DWORD PTR _dispfield$[ebp]
	push	edx
	call	_strcmp
	add	esp, 8
	test	eax, eax
	je	SHORT $L70292
	jmp	$L70283
$L70292:

; 112  : 
; 113  : 		/* Skip if field unspecified and value is not last input */
; 114  : 		k = table.nbrows;

	mov	eax, DWORD PTR _table$[ebp]
	mov	DWORD PTR _k$[ebp], eax

; 115  : 		val = dyntab_cell(&table, k - 1, 0);

	push	0
	mov	ecx, DWORD PTR _k$[ebp]
	sub	ecx, 1
	push	ecx
	lea	edx, DWORD PTR _table$[ebp]
	push	edx
	call	_dyntab_cell
	add	esp, 12					; 0000000cH
	mov	DWORD PTR _val$[ebp], eax

; 116  : 		b_changefield = !val->field || strcmp(val->field, field);

	mov	eax, DWORD PTR _val$[ebp]
	cmp	DWORD PTR [eax+8], 0
	je	SHORT $L70558
	mov	ecx, DWORD PTR _field$70285[ebp]
	push	ecx
	mov	edx, DWORD PTR _val$[ebp]
	mov	eax, DWORD PTR [edx+8]
	push	eax
	call	_strcmp
	add	esp, 8
	test	eax, eax
	jne	SHORT $L70558
	mov	DWORD PTR -2892+[ebp], 0
	jmp	SHORT $L70559
$L70558:
	mov	DWORD PTR -2892+[ebp], 1
$L70559:
	mov	ecx, DWORD PTR -2892+[ebp]
	mov	DWORD PTR _b_changefield$70291[ebp], ecx

; 117  : 		if(!dispfield && *datedel && !b_changefield) continue;

	cmp	DWORD PTR _dispfield$[ebp], 0
	jne	SHORT $L70293
	mov	edx, DWORD PTR _datedel$70290[ebp]
	movsx	eax, BYTE PTR [edx]
	test	eax, eax
	je	SHORT $L70293
	cmp	DWORD PTR _b_changefield$70291[ebp], 0
	jne	SHORT $L70293
	jmp	$L70283
$L70293:

; 118  : 
; 119  : 		/* Search for control with same field */
; 120  : 		for(i_ctrl = 0; i_ctrl < form->nb_ctrl && (
; 121  : 			strcmp(form->ctrl[i_ctrl].FIELD, dyntab_val(&data, i, 1)) ||
; 122  : 			strcmp(form->ctrl[i_ctrl].CONTROL, "_EVA_INPUT")); i_ctrl++);

	mov	DWORD PTR _i_ctrl$[ebp], 0
	jmp	SHORT $L70294
$L70295:
	mov	ecx, DWORD PTR _i_ctrl$[ebp]
	add	ecx, 1
	mov	DWORD PTR _i_ctrl$[ebp], ecx
$L70294:
	mov	edx, DWORD PTR _form$[ebp]
	mov	eax, DWORD PTR _i_ctrl$[ebp]
	cmp	eax, DWORD PTR [edx+4]
	jae	SHORT $L70296
	push	1
	mov	ecx, DWORD PTR _i$[ebp]
	push	ecx
	lea	edx, DWORD PTR _data$[ebp]
	push	edx
	call	_dyntab_val
	add	esp, 12					; 0000000cH
	push	eax
	mov	eax, DWORD PTR _i_ctrl$[ebp]
	imul	eax, 480				; 000001e0H
	mov	ecx, DWORD PTR _form$[ebp]
	mov	edx, DWORD PTR [ecx]
	mov	eax, DWORD PTR [edx+eax+280]
	push	eax
	call	_strcmp
	add	esp, 8
	test	eax, eax
	jne	SHORT $L70297
	push	OFFSET FLAT:$SG70298
	mov	ecx, DWORD PTR _i_ctrl$[ebp]
	imul	ecx, 480				; 000001e0H
	mov	edx, DWORD PTR _form$[ebp]
	mov	eax, DWORD PTR [edx]
	mov	ecx, DWORD PTR [eax+ecx+272]
	push	ecx
	call	_strcmp
	add	esp, 8
	test	eax, eax
	je	SHORT $L70296
$L70297:
	jmp	$L70295
$L70296:

; 123  : 		ctrl = i_ctrl < form->nb_ctrl ? form->ctrl + i_ctrl : NULL;

	mov	edx, DWORD PTR _form$[ebp]
	mov	eax, DWORD PTR _i_ctrl$[ebp]
	cmp	eax, DWORD PTR [edx+4]
	jae	SHORT $L70560
	mov	ecx, DWORD PTR _i_ctrl$[ebp]
	imul	ecx, 480				; 000001e0H
	mov	edx, DWORD PTR _form$[ebp]
	mov	eax, DWORD PTR [edx]
	add	eax, ecx
	mov	DWORD PTR -2896+[ebp], eax
	jmp	SHORT $L70561
$L70560:
	mov	DWORD PTR -2896+[ebp], 0
$L70561:
	mov	ecx, DWORD PTR -2896+[ebp]
	mov	DWORD PTR _ctrl$[ebp], ecx

; 124  : 
; 125  : 		/* Set label & field columns */
; 126  : 		if(ctrl) DYNTAB_ADD(&table, k, 0, ctrl->LABEL, 0, NO_CONV);

	cmp	DWORD PTR _ctrl$[ebp], 0
	je	SHORT $L70302
	push	0
	push	0
	push	0
	mov	edx, DWORD PTR _ctrl$[ebp]
	mov	eax, DWORD PTR [edx+284]
	push	eax
	push	0
	mov	ecx, DWORD PTR _k$[ebp]
	push	ecx
	lea	edx, DWORD PTR _table$[ebp]
	push	edx
	call	_dyntab_add
	add	esp, 28					; 0000001cH
	test	eax, eax
	je	SHORT $L70302
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29872], OFFSET FLAT:$SG70304
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 126		; 0000007eH
	jmp	$eva_err$70240
$L70302:

; 127  : 		DYNTAB_SET_CELL(&table, k, 1, &data, i, 1);

	push	0
	push	1
	mov	edx, DWORD PTR _i$[ebp]
	push	edx
	lea	eax, DWORD PTR _data$[ebp]
	push	eax
	call	_dyntab_cell
	add	esp, 12					; 0000000cH
	push	eax
	push	1
	mov	ecx, DWORD PTR _k$[ebp]
	push	ecx
	lea	edx, DWORD PTR _table$[ebp]
	push	edx
	call	_dyntab_copy
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L70305
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29872], OFFSET FLAT:$SG70307
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 127		; 0000007fH
	jmp	$eva_err$70240
$L70305:

; 128  : 
; 129  : 		/* Initialize value attribute for sorting */
; 130  : 		val = dyntab_cell(&table, k, 0);

	push	0
	mov	edx, DWORD PTR _k$[ebp]
	push	edx
	lea	eax, DWORD PTR _table$[ebp]
	push	eax
	call	_dyntab_cell
	add	esp, 12					; 0000000cH
	mov	DWORD PTR _val$[ebp], eax

; 131  : 		val->b_dontfreefield = 1;

	mov	ecx, DWORD PTR _val$[ebp]
	mov	BYTE PTR [ecx+15], 1

; 132  : 		val->col = i_ctrl;

	mov	edx, DWORD PTR _val$[ebp]
	mov	eax, DWORD PTR _i_ctrl$[ebp]
	mov	DWORD PTR [edx+56], eax

; 133  : 		val->field = field;

	mov	ecx, DWORD PTR _val$[ebp]
	mov	edx, DWORD PTR _field$70285[ebp]
	mov	DWORD PTR [ecx+8], edx

; 134  : 		val->Num = Num;

	mov	eax, DWORD PTR _val$[ebp]
	mov	ecx, DWORD PTR _Num$70286[ebp]
	mov	DWORD PTR [eax+36], ecx

; 135  : 		val->Line = Line;

	mov	edx, DWORD PTR _val$[ebp]
	mov	eax, DWORD PTR _Line$70288[ebp]
	mov	DWORD PTR [edx+40], eax

; 136  : 		val->Pkey = DYNTAB_TOULRC(&data, i, 12);

	push	10					; 0000000aH
	push	0
	push	12					; 0000000cH
	mov	ecx, DWORD PTR _i$[ebp]
	push	ecx
	lea	edx, DWORD PTR _data$[ebp]
	push	edx
	call	_dyntab_val
	add	esp, 12					; 0000000cH
	push	eax
	call	_strtoul
	add	esp, 12					; 0000000cH
	mov	ecx, DWORD PTR _val$[ebp]
	mov	DWORD PTR [ecx+16], eax

; 137  : 
; 138  : 		/* If user credentials and not identified user or admin */
; 139  : 		if(!cntxt->b_admin && !b_ident_user && field && 
; 140  : 			(!strcmp(field, "_EVA_LOGIN") || !strcmp(field, "_EVA_PASSWORD"))) 

	mov	edx, DWORD PTR _cntxt$[ebp]
	cmp	DWORD PTR [edx+29612], 0
	jne	$L70309
	cmp	DWORD PTR _b_ident_user$[ebp], 0
	jne	$L70309
	cmp	DWORD PTR _field$70285[ebp], 0
	je	SHORT $L70309
	push	OFFSET FLAT:$SG70311
	mov	eax, DWORD PTR _field$70285[ebp]
	push	eax
	call	_strcmp
	add	esp, 8
	test	eax, eax
	je	SHORT $L70310
	push	OFFSET FLAT:$SG70312
	mov	ecx, DWORD PTR _field$70285[ebp]
	push	ecx
	call	_strcmp
	add	esp, 8
	test	eax, eax
	jne	SHORT $L70309
$L70310:

; 142  : 			/* Hide credentials */
; 143  : 			DYNBUF_ADD_STR(form->html, "<font size=-1>******</font>");

	push	0
	push	0
	push	27					; 0000001bH
	push	OFFSET FLAT:$SG70315
	mov	edx, DWORD PTR _form$[ebp]
	mov	eax, DWORD PTR [edx+232]
	push	eax
	call	_dynbuf_add
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L70314
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29872], OFFSET FLAT:$SG70317
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 143		; 0000008fH
	jmp	$eva_err$70240
$L70314:

; 145  : 		/* If value is a relation */
; 146  : 		else if(dyntab_sz(&data, i, 2) && !rawvalues) 

	jmp	$L70339
$L70309:
	push	2
	mov	eax, DWORD PTR _i$[ebp]
	push	eax
	lea	ecx, DWORD PTR _data$[ebp]
	push	ecx
	call	_dyntab_sz
	add	esp, 12					; 0000000cH
	test	eax, eax
	je	$L70319
	cmp	DWORD PTR _rawvalues$[ebp], 0
	jne	SHORT $L70319

; 148  : 			/* Add open button & object label */
; 149  : 			DYNTAB_SET_CELL(&idobj, 0, 0, &data, i, 2);

	push	0
	push	2
	mov	edx, DWORD PTR _i$[ebp]
	push	edx
	lea	eax, DWORD PTR _data$[ebp]
	push	eax
	call	_dyntab_cell
	add	esp, 12					; 0000000cH
	push	eax
	push	0
	push	0
	lea	ecx, DWORD PTR _idobj$[ebp]
	push	ecx
	call	_dyntab_copy
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L70320
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29872], OFFSET FLAT:$SG70322
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 149		; 00000095H
	jmp	$eva_err$70240
$L70320:

; 150  : 			if(obj_put_html_btn_label(cntxt, &idobj)) STACK_ERROR;

	lea	ecx, DWORD PTR _idobj$[ebp]
	push	ecx
	mov	edx, DWORD PTR _cntxt$[ebp]
	push	edx
	call	_obj_put_html_btn_label
	add	esp, 8
	test	eax, eax
	je	SHORT $L70323
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 150		; 00000096H
	jmp	$eva_err$70240
$L70323:

; 152  : 		/* If control is found */
; 153  : 		else if(ctrl && strcmp(ctrl->TYPE, "_EVA_RELATION") && !rawvalues) 

	jmp	$L70339
$L70319:
	cmp	DWORD PTR _ctrl$[ebp], 0
	je	$L70325
	push	OFFSET FLAT:$SG70326
	mov	ecx, DWORD PTR _ctrl$[ebp]
	mov	edx, DWORD PTR [ecx+276]
	push	edx
	call	_strcmp
	add	esp, 8
	test	eax, eax
	je	$L70325
	cmp	DWORD PTR _rawvalues$[ebp], 0
	jne	$L70325

; 155  : 			/* Use control for display in view mode */
; 156  : 			ctrl->LABELPOS = "_EVA_NONE";

	mov	eax, DWORD PTR _ctrl$[ebp]
	mov	DWORD PTR [eax+292], OFFSET FLAT:$SG70327

; 157  : 			ctrl->POSITION = "_EVA_SameCell";

	mov	ecx, DWORD PTR _ctrl$[ebp]
	mov	DWORD PTR [ecx+296], OFFSET FLAT:$SG70328

; 158  : 			ctrl->FONTCOLOR = dyntab_sz(&data, i, _DateDel) ? "888888" : "";

	push	10					; 0000000aH
	mov	edx, DWORD PTR _i$[ebp]
	push	edx
	lea	eax, DWORD PTR _data$[ebp]
	push	eax
	call	_dyntab_sz
	add	esp, 12					; 0000000cH
	test	eax, eax
	je	SHORT $L70562
	mov	DWORD PTR -2900+[ebp], OFFSET FLAT:$SG70329
	jmp	SHORT $L70563
$L70562:
	mov	DWORD PTR -2900+[ebp], OFFSET FLAT:$SG70330
$L70563:
	mov	ecx, DWORD PTR _ctrl$[ebp]
	mov	edx, DWORD PTR -2900+[ebp]
	mov	DWORD PTR [ecx+360], edx

; 159  : 			ctrl->FONTSIZE = "-1";

	mov	eax, DWORD PTR _ctrl$[ebp]
	mov	DWORD PTR [eax+356], OFFSET FLAT:$SG70331

; 160  : 			ctrl->CELL_STYLE = "";

	mov	ecx, DWORD PTR _ctrl$[ebp]
	mov	DWORD PTR [ecx+468], OFFSET FLAT:$SG70332

; 161  : 			form->step = HtmlView;

	mov	edx, DWORD PTR _form$[ebp]
	mov	DWORD PTR [edx+176], 6

; 162  : 			dyntab_free(&ctrl->val);

	mov	eax, DWORD PTR _ctrl$[ebp]
	add	eax, 64					; 00000040H
	push	eax
	call	_dyntab_free
	add	esp, 4

; 163  : 			dyntab_free(&ctrl->allval);

	mov	ecx, DWORD PTR _ctrl$[ebp]
	add	ecx, 124				; 0000007cH
	push	ecx
	call	_dyntab_free
	add	esp, 4

; 164  : 			dyntab_free(&ctrl->alldbval);

	mov	edx, DWORD PTR _ctrl$[ebp]
	add	edx, 144				; 00000090H
	push	edx
	call	_dyntab_free
	add	esp, 4

; 165  : 			DYNTAB_SET_CELL(&ctrl->val, 0, 0, &data, i, 4);

	push	0
	push	4
	mov	eax, DWORD PTR _i$[ebp]
	push	eax
	lea	ecx, DWORD PTR _data$[ebp]
	push	ecx
	call	_dyntab_cell
	add	esp, 12					; 0000000cH
	push	eax
	push	0
	push	0
	mov	edx, DWORD PTR _ctrl$[ebp]
	add	edx, 64					; 00000040H
	push	edx
	call	_dyntab_copy
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L70333
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29872], OFFSET FLAT:$SG70335
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 165		; 000000a5H
	jmp	$eva_err$70240
$L70333:

; 166  : 			CTRL_PRI_HDLR(i_ctrl);

	cmp	DWORD PTR _i_ctrl$[ebp], 0
	je	SHORT $L70337
	mov	edx, DWORD PTR _i_ctrl$[ebp]
	push	edx
	mov	eax, DWORD PTR _cntxt$[ebp]
	push	eax
	call	_ctrl_primary_handler
	add	esp, 8
	test	eax, eax
	je	SHORT $L70337
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 166		; 000000a6H
	jmp	$eva_err$70240
$L70337:

; 168  : 		else

	jmp	SHORT $L70339
$L70325:

; 170  : 			/* Display raw value */
; 171  : 			DYNBUF_ADD3_CELL(form->html, "<font size=-1>", &data, i, 4, TO_HTML, "</font>");

	push	7
	push	OFFSET FLAT:$SG70340
	push	1
	push	OFFSET FLAT:_plain_to_html
	push	4
	mov	edx, DWORD PTR _i$[ebp]
	push	edx
	lea	eax, DWORD PTR _data$[ebp]
	push	eax
	call	_dyntab_sz
	add	esp, 12					; 0000000cH
	push	eax
	push	4
	mov	ecx, DWORD PTR _i$[ebp]
	push	ecx
	lea	edx, DWORD PTR _data$[ebp]
	push	edx
	call	_dyntab_val
	add	esp, 12					; 0000000cH
	push	eax
	push	14					; 0000000eH
	push	OFFSET FLAT:$SG70341
	mov	eax, DWORD PTR _form$[ebp]
	mov	ecx, DWORD PTR [eax+232]
	push	ecx
	call	_dynbuf_add3
	add	esp, 36					; 00000024H
	test	eax, eax
	je	SHORT $L70339
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29872], OFFSET FLAT:$SG70343
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 171		; 000000abH
	jmp	$eva_err$70240
$L70339:

; 173  : 		DYNTAB_ADD_BUF(&table, k, 2, buf);

	cmp	DWORD PTR _buf$[ebp], 0
	je	SHORT $L70344
	mov	ecx, DWORD PTR _buf$[ebp]
	cmp	DWORD PTR [ecx+4], 0
	je	SHORT $L70344
	push	0
	push	0
	mov	edx, DWORD PTR _buf$[ebp]
	mov	eax, DWORD PTR [edx+4]
	push	eax
	mov	ecx, DWORD PTR _buf$[ebp]
	add	ecx, 8
	push	ecx
	push	2
	mov	edx, DWORD PTR _k$[ebp]
	push	edx
	lea	eax, DWORD PTR _table$[ebp]
	push	eax
	call	_dyntab_add
	add	esp, 28					; 0000001cH
	test	eax, eax
	je	SHORT $L70346
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29872], OFFSET FLAT:$SG70348
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 173		; 000000adH
	jmp	$eva_err$70240
$L70346:
	jmp	SHORT $L70352
$L70344:
	push	0
	push	0
	push	0
	push	0
	push	2
	mov	eax, DWORD PTR _k$[ebp]
	push	eax
	lea	ecx, DWORD PTR _table$[ebp]
	push	ecx
	call	_dyntab_add
	add	esp, 28					; 0000001cH
	test	eax, eax
	je	SHORT $L70352
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29872], OFFSET FLAT:$SG70354
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 173		; 000000adH
	jmp	$eva_err$70240
$L70352:

; 174  : 		M_FREE(buf);

	mov	ecx, DWORD PTR _buf$[ebp]
	push	ecx
	call	_mem_free
	add	esp, 4
	mov	DWORD PTR _buf$[ebp], 0

; 175  : 
; 176  : 		/* Set indexes */
; 177  : 		DYNTAB_SET_CELL(&table, k, 3, &data, i, 5);

	push	0
	push	5
	mov	edx, DWORD PTR _i$[ebp]
	push	edx
	lea	eax, DWORD PTR _data$[ebp]
	push	eax
	call	_dyntab_cell
	add	esp, 12					; 0000000cH
	push	eax
	push	3
	mov	ecx, DWORD PTR _k$[ebp]
	push	ecx
	lea	edx, DWORD PTR _table$[ebp]
	push	edx
	call	_dyntab_copy
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L70355
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29872], OFFSET FLAT:$SG70357
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 177		; 000000b1H
	jmp	$eva_err$70240
$L70355:

; 178  : 		DYNTAB_SET_CELL(&table, k, 5, &data, i, 6);

	push	0
	push	6
	mov	edx, DWORD PTR _i$[ebp]
	push	edx
	lea	eax, DWORD PTR _data$[ebp]
	push	eax
	call	_dyntab_cell
	add	esp, 12					; 0000000cH
	push	eax
	push	5
	mov	ecx, DWORD PTR _k$[ebp]
	push	ecx
	lea	edx, DWORD PTR _table$[ebp]
	push	edx
	call	_dyntab_copy
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L70358
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29872], OFFSET FLAT:$SG70360
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 178		; 000000b2H
	jmp	$eva_err$70240
$L70358:

; 179  : 
; 180  : 		/* Add Clear value button */
; 181  : 		if(!*datedel && cntxt->user_data.cell && cntxt->b_admin)

	mov	edx, DWORD PTR _datedel$70290[ebp]
	movsx	eax, BYTE PTR [edx]
	test	eax, eax
	jne	$L70361
	mov	ecx, DWORD PTR _cntxt$[ebp]
	cmp	DWORD PTR [ecx+29444], 0
	je	$L70361
	mov	edx, DWORD PTR _cntxt$[ebp]
	cmp	DWORD PTR [edx+29612], 0
	je	$L70361

; 183  : 			snprintf(add_sz_str(sql), "BCLR=%lu", val->Pkey);

	mov	eax, DWORD PTR _val$[ebp]
	mov	ecx, DWORD PTR [eax+16]
	push	ecx
	push	OFFSET FLAT:$SG70362
	push	2047					; 000007ffH
	lea	edx, DWORD PTR _sql$[ebp]
	push	edx
	call	__snprintf
	add	esp, 16					; 00000010H

; 184  : 			if(put_html_button(cntxt, sql, NULL, "_eva_cancel.gif", "_eva_cancel_s.gif",
; 185  : 														"Efface cette valeur", 0, 0)) STACK_ERROR;

	push	0
	push	0
	push	0
	push	0
	push	0
	push	OFFSET FLAT:$SG70366
	push	OFFSET FLAT:$SG70367
	push	OFFSET FLAT:$SG70368
	push	0
	lea	eax, DWORD PTR _sql$[ebp]
	push	eax
	mov	ecx, DWORD PTR _cntxt$[ebp]
	push	ecx
	call	_put_html_button_sz
	add	esp, 44					; 0000002cH
	test	eax, eax
	je	SHORT $L70365
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 185		; 000000b9H
	jmp	$eva_err$70240
$L70365:

; 186  : 			DYNTAB_ADD_BUF(&table, k, 6, buf);

	cmp	DWORD PTR _buf$[ebp], 0
	je	SHORT $L70369
	mov	eax, DWORD PTR _buf$[ebp]
	cmp	DWORD PTR [eax+4], 0
	je	SHORT $L70369
	push	0
	push	0
	mov	ecx, DWORD PTR _buf$[ebp]
	mov	edx, DWORD PTR [ecx+4]
	push	edx
	mov	eax, DWORD PTR _buf$[ebp]
	add	eax, 8
	push	eax
	push	6
	mov	ecx, DWORD PTR _k$[ebp]
	push	ecx
	lea	edx, DWORD PTR _table$[ebp]
	push	edx
	call	_dyntab_add
	add	esp, 28					; 0000001cH
	test	eax, eax
	je	SHORT $L70371
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29872], OFFSET FLAT:$SG70373
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 186		; 000000baH
	jmp	$eva_err$70240
$L70371:
	jmp	SHORT $L70377
$L70369:
	push	0
	push	0
	push	0
	push	0
	push	6
	mov	edx, DWORD PTR _k$[ebp]
	push	edx
	lea	eax, DWORD PTR _table$[ebp]
	push	eax
	call	_dyntab_add
	add	esp, 28					; 0000001cH
	test	eax, eax
	je	SHORT $L70377
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29872], OFFSET FLAT:$SG70379
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 186		; 000000baH
	jmp	$eva_err$70240
$L70377:

; 187  : 			M_FREE(buf);

	mov	eax, DWORD PTR _buf$[ebp]
	push	eax
	call	_mem_free
	add	esp, 4
	mov	DWORD PTR _buf$[ebp], 0
$L70361:

; 189  : 
; 190  : 		/* Set create infos */
; 191  : 		if(datetxt_to_format(cntxt, sql, dyntab_val(&data, i, _DateCr), NULL)) 

	push	0
	push	8
	mov	ecx, DWORD PTR _i$[ebp]
	push	ecx
	lea	edx, DWORD PTR _data$[ebp]
	push	edx
	call	_dyntab_val
	add	esp, 12					; 0000000cH
	push	eax
	lea	eax, DWORD PTR _sql$[ebp]
	push	eax
	mov	ecx, DWORD PTR _cntxt$[ebp]
	push	ecx
	call	_datetxt_to_format
	add	esp, 16					; 00000010H
	test	eax, eax
	je	SHORT $L70381

; 192  : 			strcpy(sql, dyntab_val(&data, i, _DateCr));

	push	8
	mov	edx, DWORD PTR _i$[ebp]
	push	edx
	lea	eax, DWORD PTR _data$[ebp]
	push	eax
	call	_dyntab_val
	add	esp, 12					; 0000000cH
	push	eax
	lea	ecx, DWORD PTR _sql$[ebp]
	push	ecx
	call	_strcpy
	add	esp, 8
$L70381:

; 193  : 		DYNTAB_ADD(&table, k, 7, sql, 0, NO_CONV);

	push	0
	push	0
	push	0
	lea	edx, DWORD PTR _sql$[ebp]
	push	edx
	push	7
	mov	eax, DWORD PTR _k$[ebp]
	push	eax
	lea	ecx, DWORD PTR _table$[ebp]
	push	ecx
	call	_dyntab_add
	add	esp, 28					; 0000001cH
	test	eax, eax
	je	SHORT $L70383
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29872], OFFSET FLAT:$SG70385
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 193		; 000000c1H
	jmp	$eva_err$70240
$L70383:

; 194  : 		sprintf(sql, 
; 195  : 			"-- form_mode_values : Read create username\n"
; 196  : 			"SELECT TVal.TxtValue \n"
; 197  : 			"FROM TLink INNER JOIN TVal ON TLink.IdValue = TVal.IdValue \n"
; 198  : 			"WHERE TLink.DateDel is NULL AND TLink.IdField=%lu \n"
; 199  : 				"AND TLink.IdObj=0%s", idfield, dyntab_val(&data, i, _IdWhoCr));

	push	9
	mov	ecx, DWORD PTR _i$[ebp]
	push	ecx
	lea	edx, DWORD PTR _data$[ebp]
	push	edx
	call	_dyntab_val
	add	esp, 12					; 0000000cH
	push	eax
	mov	eax, DWORD PTR _idfield$[ebp]
	push	eax
	push	OFFSET FLAT:$SG70386
	lea	ecx, DWORD PTR _sql$[ebp]
	push	ecx
	call	_sprintf
	add	esp, 16					; 00000010H

; 200  : 		if(sql_exec_query(cntxt, sql) || sql_get_table(cntxt, &idobj, 2)) STACK_ERROR;

	lea	edx, DWORD PTR _sql$[ebp]
	push	edx
	mov	eax, DWORD PTR _cntxt$[ebp]
	push	eax
	call	_sql_exec_query
	add	esp, 8
	test	eax, eax
	jne	SHORT $L70388
	push	2
	lea	ecx, DWORD PTR _idobj$[ebp]
	push	ecx
	mov	edx, DWORD PTR _cntxt$[ebp]
	push	edx
	call	_sql_get_table
	add	esp, 12					; 0000000cH
	test	eax, eax
	je	SHORT $L70387
$L70388:
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 200		; 000000c8H
	jmp	$eva_err$70240
$L70387:

; 201  : 		DYNTAB_ADD_CELL(&table, k, 8, &idobj, 0, 0);

	push	1
	push	0
	push	0
	lea	ecx, DWORD PTR _idobj$[ebp]
	push	ecx
	call	_dyntab_cell
	add	esp, 12					; 0000000cH
	push	eax
	push	8
	mov	edx, DWORD PTR _k$[ebp]
	push	edx
	lea	eax, DWORD PTR _table$[ebp]
	push	eax
	call	_dyntab_copy
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L70389
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29872], OFFSET FLAT:$SG70391
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 201		; 000000c9H
	jmp	$eva_err$70240
$L70389:

; 202  : 
; 203  : 		/* Set delete infos if field history is displayed */
; 204  : 		if(dyntab_sz(&data, i, _DateDel))

	push	10					; 0000000aH
	mov	eax, DWORD PTR _i$[ebp]
	push	eax
	lea	ecx, DWORD PTR _data$[ebp]
	push	ecx
	call	_dyntab_sz
	add	esp, 12					; 0000000cH
	test	eax, eax
	je	$L70402

; 206  : 			if(datetxt_to_format(cntxt, sql, datedel, NULL)) 

	push	0
	mov	edx, DWORD PTR _datedel$70290[ebp]
	push	edx
	lea	eax, DWORD PTR _sql$[ebp]
	push	eax
	mov	ecx, DWORD PTR _cntxt$[ebp]
	push	ecx
	call	_datetxt_to_format
	add	esp, 16					; 00000010H
	test	eax, eax
	je	SHORT $L70394

; 207  : 				strcpy(sql, datedel);

	mov	edx, DWORD PTR _datedel$70290[ebp]
	push	edx
	lea	eax, DWORD PTR _sql$[ebp]
	push	eax
	call	_strcpy
	add	esp, 8
$L70394:

; 208  : 			DYNTAB_ADD(&table, k, 9, sql, 0, NO_CONV);

	push	0
	push	0
	push	0
	lea	ecx, DWORD PTR _sql$[ebp]
	push	ecx
	push	9
	mov	edx, DWORD PTR _k$[ebp]
	push	edx
	lea	eax, DWORD PTR _table$[ebp]
	push	eax
	call	_dyntab_add
	add	esp, 28					; 0000001cH
	test	eax, eax
	je	SHORT $L70396
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29872], OFFSET FLAT:$SG70398
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 208		; 000000d0H
	jmp	$eva_err$70240
$L70396:

; 209  : 			sprintf(sql, 
; 210  : 				"-- form_mode_values : Read delete username\n"
; 211  : 				"SELECT TVal.TxtValue \n"
; 212  : 				"FROM TLink INNER JOIN TVal ON TLink.IdValue = TVal.IdValue \n"
; 213  : 				"WHERE TLink.DateDel is NULL AND TLink.IdField=%lu \n"
; 214  : 					"AND TLink.IdObj=0%s", idfield, dyntab_val(&data, i, _IdWhoDel));

	push	11					; 0000000bH
	mov	eax, DWORD PTR _i$[ebp]
	push	eax
	lea	ecx, DWORD PTR _data$[ebp]
	push	ecx
	call	_dyntab_val
	add	esp, 12					; 0000000cH
	push	eax
	mov	edx, DWORD PTR _idfield$[ebp]
	push	edx
	push	OFFSET FLAT:$SG70399
	lea	eax, DWORD PTR _sql$[ebp]
	push	eax
	call	_sprintf
	add	esp, 16					; 00000010H

; 215  : 			if(sql_exec_query(cntxt, sql) || sql_get_table(cntxt, &idobj, 2)) STACK_ERROR;

	lea	ecx, DWORD PTR _sql$[ebp]
	push	ecx
	mov	edx, DWORD PTR _cntxt$[ebp]
	push	edx
	call	_sql_exec_query
	add	esp, 8
	test	eax, eax
	jne	SHORT $L70401
	push	2
	lea	eax, DWORD PTR _idobj$[ebp]
	push	eax
	mov	ecx, DWORD PTR _cntxt$[ebp]
	push	ecx
	call	_sql_get_table
	add	esp, 12					; 0000000cH
	test	eax, eax
	je	SHORT $L70400
$L70401:
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 215		; 000000d7H
	jmp	$eva_err$70240
$L70400:

; 216  : 			DYNTAB_ADD_CELL(&table, k, 10, &idobj, 0, 0);

	push	1
	push	0
	push	0
	lea	eax, DWORD PTR _idobj$[ebp]
	push	eax
	call	_dyntab_cell
	add	esp, 12					; 0000000cH
	push	eax
	push	10					; 0000000aH
	mov	ecx, DWORD PTR _k$[ebp]
	push	ecx
	lea	edx, DWORD PTR _table$[ebp]
	push	edx
	call	_dyntab_copy
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L70402
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29872], OFFSET FLAT:$SG70404
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 216		; 000000d8H
	jmp	$eva_err$70240
$L70402:

; 218  : 
; 219  : 		/* Add history button if applicable */
; 220  : 		if(!dispfield && b_changefield)

	cmp	DWORD PTR _dispfield$[ebp], 0
	jne	$L70412
	cmp	DWORD PTR _b_changefield$70291[ebp], 0
	je	$L70412

; 222  : 			for(b_changefield = 0, j = i + 1; j < data.nbrows; j++)

	mov	DWORD PTR _b_changefield$70291[ebp], 0
	mov	edx, DWORD PTR _i$[ebp]
	add	edx, 1
	mov	DWORD PTR _j$[ebp], edx
	jmp	SHORT $L70406
$L70407:
	mov	eax, DWORD PTR _j$[ebp]
	add	eax, 1
	mov	DWORD PTR _j$[ebp], eax
$L70406:
	mov	ecx, DWORD PTR _j$[ebp]
	cmp	ecx, DWORD PTR _data$[ebp]
	jae	SHORT $L70408

; 223  : 					if(strcmp(dyntab_val(&data, j, 1), field)) break;

	mov	edx, DWORD PTR _field$70285[ebp]
	push	edx
	push	1
	mov	eax, DWORD PTR _j$[ebp]
	push	eax
	lea	ecx, DWORD PTR _data$[ebp]
	push	ecx
	call	_dyntab_val
	add	esp, 12					; 0000000cH
	push	eax
	call	_strcmp
	add	esp, 8
	test	eax, eax
	je	SHORT $L70409
	jmp	SHORT $L70408
$L70409:

; 224  : 					else if(dyntab_sz(&data, j, _DateDel)) { b_changefield = 1; break; }

	push	10					; 0000000aH
	mov	edx, DWORD PTR _j$[ebp]
	push	edx
	lea	eax, DWORD PTR _data$[ebp]
	push	eax
	call	_dyntab_sz
	add	esp, 12					; 0000000cH
	test	eax, eax
	je	SHORT $L70411
	mov	DWORD PTR _b_changefield$70291[ebp], 1
	jmp	SHORT $L70408
$L70411:

; 225  : 			if(b_changefield)

	jmp	SHORT $L70407
$L70408:
	cmp	DWORD PTR _b_changefield$70291[ebp], 0
	je	$L70412

; 227  : 				snprintf(add_sz_str(sql), "BFIELD=%s", field);

	mov	ecx, DWORD PTR _field$70285[ebp]
	push	ecx
	push	OFFSET FLAT:$SG70413
	push	2047					; 000007ffH
	lea	edx, DWORD PTR _sql$[ebp]
	push	edx
	call	__snprintf
	add	esp, 16					; 00000010H

; 228  : 				if(put_html_button(cntxt, sql, NULL, "_eva_history.gif", "_eva_history_s.gif",
; 229  : 															"Affiche l'historique de ce champ", 0, 0)) STACK_ERROR;

	push	0
	push	0
	push	0
	push	0
	push	0
	push	OFFSET FLAT:$SG70417
	push	OFFSET FLAT:$SG70418
	push	OFFSET FLAT:$SG70419
	push	0
	lea	eax, DWORD PTR _sql$[ebp]
	push	eax
	mov	ecx, DWORD PTR _cntxt$[ebp]
	push	ecx
	call	_put_html_button_sz
	add	esp, 44					; 0000002cH
	test	eax, eax
	je	SHORT $L70416
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 229		; 000000e5H
	jmp	$eva_err$70240
$L70416:

; 230  : 				DYNTAB_ADD_BUF(&table, k, 11, buf);

	cmp	DWORD PTR _buf$[ebp], 0
	je	SHORT $L70420
	mov	eax, DWORD PTR _buf$[ebp]
	cmp	DWORD PTR [eax+4], 0
	je	SHORT $L70420
	push	0
	push	0
	mov	ecx, DWORD PTR _buf$[ebp]
	mov	edx, DWORD PTR [ecx+4]
	push	edx
	mov	eax, DWORD PTR _buf$[ebp]
	add	eax, 8
	push	eax
	push	11					; 0000000bH
	mov	ecx, DWORD PTR _k$[ebp]
	push	ecx
	lea	edx, DWORD PTR _table$[ebp]
	push	edx
	call	_dyntab_add
	add	esp, 28					; 0000001cH
	test	eax, eax
	je	SHORT $L70422
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29872], OFFSET FLAT:$SG70424
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 230		; 000000e6H
	jmp	$eva_err$70240
$L70422:
	jmp	SHORT $L70428
$L70420:
	push	0
	push	0
	push	0
	push	0
	push	11					; 0000000bH
	mov	edx, DWORD PTR _k$[ebp]
	push	edx
	lea	eax, DWORD PTR _table$[ebp]
	push	eax
	call	_dyntab_add
	add	esp, 28					; 0000001cH
	test	eax, eax
	je	SHORT $L70428
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29872], OFFSET FLAT:$SG70430
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 230		; 000000e6H
	jmp	$eva_err$70240
$L70428:

; 231  : 				M_FREE(buf);

	mov	eax, DWORD PTR _buf$[ebp]
	push	eax
	call	_mem_free
	add	esp, 4
	mov	DWORD PTR _buf$[ebp], 0
$L70412:

; 234  : 	}

	jmp	$L70283
$L70284:

; 235  : 
; 236  : 	/* Sort table without first row */
; 237  : 	qsort(table.cell + table.szcols, table.nbrows - 1, sizeof(table.cell[0])*table.szcols, 
; 238  : 		qsort_mode_values);

	push	OFFSET FLAT:_qsort_mode_values
	mov	ecx, DWORD PTR _table$[ebp+12]
	shl	ecx, 6
	push	ecx
	mov	edx, DWORD PTR _table$[ebp]
	sub	edx, 1
	push	edx
	mov	eax, DWORD PTR _table$[ebp+12]
	shl	eax, 6
	mov	ecx, DWORD PTR _table$[ebp+16]
	add	ecx, eax
	push	ecx
	call	_qsort
	add	esp, 16					; 00000010H

; 239  : 	
; 240  : 	/* Output table header */
; 241  : 	form->html = &cntxt->html;

	mov	edx, DWORD PTR _cntxt$[ebp]
	add	edx, 29784				; 00007458H
	mov	eax, DWORD PTR _form$[ebp]
	mov	DWORD PTR [eax+232], edx

; 242  : 	if(dispfield)

	cmp	DWORD PTR _dispfield$[ebp], 0
	je	$L70443

; 244  : 		DYNBUF_ADD_STR(form->html, "<td align=center bgcolor=#FFFFFF>Historique de ");

	push	0
	push	0
	push	47					; 0000002fH
	push	OFFSET FLAT:$SG70434
	mov	ecx, DWORD PTR _form$[ebp]
	mov	edx, DWORD PTR [ecx+232]
	push	edx
	call	_dynbuf_add
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L70433
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29872], OFFSET FLAT:$SG70436
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 244		; 000000f4H
	jmp	$eva_err$70240
$L70433:

; 245  : 		if(dyntab_sz(&table, 2, 0)) DYNBUF_ADD3_CELL(form->html, "<b>", &table, 1, 0, TO_XML, "</b> - ");

	push	0
	push	2
	lea	edx, DWORD PTR _table$[ebp]
	push	edx
	call	_dyntab_sz
	add	esp, 12					; 0000000cH
	test	eax, eax
	je	SHORT $L70438
	push	7
	push	OFFSET FLAT:$SG70439
	push	1
	push	OFFSET FLAT:_plain_to_xml
	push	0
	push	1
	lea	eax, DWORD PTR _table$[ebp]
	push	eax
	call	_dyntab_sz
	add	esp, 12					; 0000000cH
	push	eax
	push	0
	push	1
	lea	ecx, DWORD PTR _table$[ebp]
	push	ecx
	call	_dyntab_val
	add	esp, 12					; 0000000cH
	push	eax
	push	3
	push	OFFSET FLAT:$SG70440
	mov	edx, DWORD PTR _form$[ebp]
	mov	eax, DWORD PTR [edx+232]
	push	eax
	call	_dynbuf_add3
	add	esp, 36					; 00000024H
	test	eax, eax
	je	SHORT $L70438
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29872], OFFSET FLAT:$SG70442
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 245		; 000000f5H
	jmp	$eva_err$70240
$L70438:

; 246  : 		DYNBUF_ADD3_CELL(form->html, "[<font face=Courier size=-1>", &table, 1, 1, TO_XML, "</font>]</td></tr><tr>");

	push	22					; 00000016H
	push	OFFSET FLAT:$SG70444
	push	1
	push	OFFSET FLAT:_plain_to_xml
	push	1
	push	1
	lea	eax, DWORD PTR _table$[ebp]
	push	eax
	call	_dyntab_sz
	add	esp, 12					; 0000000cH
	push	eax
	push	1
	push	1
	lea	ecx, DWORD PTR _table$[ebp]
	push	ecx
	call	_dyntab_val
	add	esp, 12					; 0000000cH
	push	eax
	push	28					; 0000001cH
	push	OFFSET FLAT:$SG70445
	mov	edx, DWORD PTR _form$[ebp]
	mov	eax, DWORD PTR [edx+232]
	push	eax
	call	_dynbuf_add3
	add	esp, 36					; 00000024H
	test	eax, eax
	je	SHORT $L70443
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29872], OFFSET FLAT:$SG70447
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 246		; 000000f6H
	jmp	$eva_err$70240
$L70443:

; 249  : 		"<td><table width=100% cellspacing=0 cellpadding=1 border=1 rules=rows><tr>\n");

	push	0
	push	0
	push	75					; 0000004bH
	push	OFFSET FLAT:$SG70450
	mov	eax, DWORD PTR _form$[ebp]
	mov	ecx, DWORD PTR [eax+232]
	push	ecx
	call	_dynbuf_add
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L70449
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29872], OFFSET FLAT:$SG70452
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 249		; 000000f9H
	jmp	$eva_err$70240
$L70449:

; 250  : 	for(i = dispfield ? 2 : 0; i < table.nbcols; i++)

	mov	ecx, DWORD PTR _dispfield$[ebp]
	neg	ecx
	sbb	ecx, ecx
	and	ecx, 2
	mov	DWORD PTR _i$[ebp], ecx
	jmp	SHORT $L70453
$L70454:
	mov	edx, DWORD PTR _i$[ebp]
	add	edx, 1
	mov	DWORD PTR _i$[ebp], edx
$L70453:
	mov	eax, DWORD PTR _i$[ebp]
	cmp	eax, DWORD PTR _table$[ebp+8]
	jae	$L70455

; 252  : 			"<td bgcolor=#DDDDDD><font face=Arial size=-2>",
; 253  : 			&table, 0, i, NO_CONV, "</font></td>\n");

	push	13					; 0000000dH
	push	OFFSET FLAT:$SG70458
	push	0
	push	0
	mov	ecx, DWORD PTR _i$[ebp]
	push	ecx
	push	0
	lea	edx, DWORD PTR _table$[ebp]
	push	edx
	call	_dyntab_sz
	add	esp, 12					; 0000000cH
	push	eax
	mov	eax, DWORD PTR _i$[ebp]
	push	eax
	push	0
	lea	ecx, DWORD PTR _table$[ebp]
	push	ecx
	call	_dyntab_val
	add	esp, 12					; 0000000cH
	push	eax
	push	45					; 0000002dH
	push	OFFSET FLAT:$SG70459
	mov	edx, DWORD PTR _form$[ebp]
	mov	eax, DWORD PTR [edx+232]
	push	eax
	call	_dynbuf_add3
	add	esp, 36					; 00000024H
	test	eax, eax
	je	SHORT $L70457
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29872], OFFSET FLAT:$SG70461
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 253		; 000000fdH
	jmp	$eva_err$70240
$L70457:
	jmp	$L70454
$L70455:

; 254  : 	DYNBUF_ADD_STR(form->html, "</tr>\n");

	push	0
	push	0
	push	6
	push	OFFSET FLAT:$SG70464
	mov	eax, DWORD PTR _form$[ebp]
	mov	ecx, DWORD PTR [eax+232]
	push	ecx
	call	_dynbuf_add
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L70463
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29872], OFFSET FLAT:$SG70466
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 254		; 000000feH
	jmp	$eva_err$70240
$L70463:

; 255  : 
; 256  : 	/* Output table */
; 257  : 	for(i = 1, k = 0, l = 0; i < table.nbrows; i++)

	mov	DWORD PTR _i$[ebp], 1
	mov	DWORD PTR _k$[ebp], 0
	mov	DWORD PTR _l$[ebp], 0
	jmp	SHORT $L70467
$L70468:
	mov	ecx, DWORD PTR _i$[ebp]
	add	ecx, 1
	mov	DWORD PTR _i$[ebp], ecx
$L70467:
	mov	edx, DWORD PTR _i$[ebp]
	cmp	edx, DWORD PTR _table$[ebp]
	jae	$L70469

; 259  : 		int b_head = 0;

	mov	DWORD PTR _b_head$70470[ebp], 0

; 260  : 		char *bgcolor = table_row_bgcolor(cntxt, &tbl, k, NULL);

	push	0
	mov	eax, DWORD PTR _k$[ebp]
	push	eax
	lea	ecx, DWORD PTR _tbl$[ebp]
	push	ecx
	mov	edx, DWORD PTR _cntxt$[ebp]
	push	edx
	call	_table_row_bgcolor
	add	esp, 16					; 00000010H
	mov	DWORD PTR _bgcolor$70471[ebp], eax

; 261  : 		if(!bgcolor || !*bgcolor) bgcolor = "FFFFFF";

	cmp	DWORD PTR _bgcolor$70471[ebp], 0
	je	SHORT $L70474
	mov	eax, DWORD PTR _bgcolor$70471[ebp]
	movsx	ecx, BYTE PTR [eax]
	test	ecx, ecx
	jne	SHORT $L70473
$L70474:
	mov	DWORD PTR _bgcolor$70471[ebp], OFFSET FLAT:$SG70475
$L70473:

; 262  : 
; 263  : 		/* Handle fields cells grouping */
; 264  : 		if(l) l--;

	cmp	DWORD PTR _l$[ebp], 0
	je	SHORT $L70476
	mov	edx, DWORD PTR _l$[ebp]
	sub	edx, 1
	mov	DWORD PTR _l$[ebp], edx
$L70476:

; 265  : 		if(dyntab_cmp(&table, i, 1, &table, i + 1, 1)) k++;

	push	1
	mov	eax, DWORD PTR _i$[ebp]
	add	eax, 1
	push	eax
	lea	ecx, DWORD PTR _table$[ebp]
	push	ecx
	push	1
	mov	edx, DWORD PTR _i$[ebp]
	push	edx
	lea	eax, DWORD PTR _table$[ebp]
	push	eax
	call	_dyntab_cmp
	add	esp, 24					; 00000018H
	test	eax, eax
	je	SHORT $L70477
	mov	ecx, DWORD PTR _k$[ebp]
	add	ecx, 1
	mov	DWORD PTR _k$[ebp], ecx

; 266  : 		else if(!l)

	jmp	SHORT $L70479
$L70477:
	cmp	DWORD PTR _l$[ebp], 0
	jne	SHORT $L70479
$L70480:

; 268  : 			do l++; while(!dyntab_cmp(&table, i, 1, &table, i + l, 1) && i + l < table.nbrows);

	mov	edx, DWORD PTR _l$[ebp]
	add	edx, 1
	mov	DWORD PTR _l$[ebp], edx
	push	1
	mov	eax, DWORD PTR _i$[ebp]
	add	eax, DWORD PTR _l$[ebp]
	push	eax
	lea	ecx, DWORD PTR _table$[ebp]
	push	ecx
	push	1
	mov	edx, DWORD PTR _i$[ebp]
	push	edx
	lea	eax, DWORD PTR _table$[ebp]
	push	eax
	call	_dyntab_cmp
	add	esp, 24					; 00000018H
	test	eax, eax
	jne	SHORT $L70483
	mov	ecx, DWORD PTR _i$[ebp]
	add	ecx, DWORD PTR _l$[ebp]
	cmp	ecx, DWORD PTR _table$[ebp]
	jb	SHORT $L70480
$L70483:

; 269  : 			b_head = 1;

	mov	DWORD PTR _b_head$70470[ebp], 1
$L70479:

; 271  : 		DYNBUF_ADD_STR(form->html, "<tr>");

	push	0
	push	0
	push	4
	push	OFFSET FLAT:$SG70486
	mov	edx, DWORD PTR _form$[ebp]
	mov	eax, DWORD PTR [edx+232]
	push	eax
	call	_dynbuf_add
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L70485
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29872], OFFSET FLAT:$SG70488
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 271		; 0000010fH
	jmp	$eva_err$70240
$L70485:

; 272  : 		for(j = dispfield ? 2 : 0; j < table.nbcols; j++)

	mov	eax, DWORD PTR _dispfield$[ebp]
	neg	eax
	sbb	eax, eax
	and	eax, 2
	mov	DWORD PTR _j$[ebp], eax
	jmp	SHORT $L70489
$L70490:
	mov	ecx, DWORD PTR _j$[ebp]
	add	ecx, 1
	mov	DWORD PTR _j$[ebp], ecx
$L70489:
	mov	edx, DWORD PTR _j$[ebp]
	cmp	edx, DWORD PTR _table$[ebp+8]
	jae	$L70491

; 274  : 			if(!b_head && l && j < 2) continue;

	cmp	DWORD PTR _b_head$70470[ebp], 0
	jne	SHORT $L70492
	cmp	DWORD PTR _l$[ebp], 0
	je	SHORT $L70492
	cmp	DWORD PTR _j$[ebp], 2
	jae	SHORT $L70492
	jmp	SHORT $L70490
$L70492:

; 275  : 			DYNBUF_ADD_STR(form->html, "<td bgcolor=#");

	push	0
	push	0
	push	13					; 0000000dH
	push	OFFSET FLAT:$SG70495
	mov	eax, DWORD PTR _form$[ebp]
	mov	ecx, DWORD PTR [eax+232]
	push	ecx
	call	_dynbuf_add
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L70494
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29872], OFFSET FLAT:$SG70497
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 275		; 00000113H
	jmp	$eva_err$70240
$L70494:

; 276  : 			DYNBUF_ADD(form->html, bgcolor, 6, NO_CONV);

	push	0
	push	0
	push	6
	mov	ecx, DWORD PTR _bgcolor$70471[ebp]
	push	ecx
	mov	edx, DWORD PTR _form$[ebp]
	mov	eax, DWORD PTR [edx+232]
	push	eax
	call	_dynbuf_add
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L70499
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29872], OFFSET FLAT:$SG70501
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 276		; 00000114H
	jmp	$eva_err$70240
$L70499:

; 277  : 			if(b_head && j < 2) DYNBUF_ADD3_INT(form->html, " rowspan=", l, "");

	cmp	DWORD PTR _b_head$70470[ebp], 0
	je	SHORT $L70503
	cmp	DWORD PTR _j$[ebp], 2
	jae	SHORT $L70503
	push	0
	push	OFFSET FLAT:$SG70504
	mov	eax, DWORD PTR _l$[ebp]
	push	eax
	push	9
	push	OFFSET FLAT:$SG70505
	mov	ecx, DWORD PTR _form$[ebp]
	mov	edx, DWORD PTR [ecx+232]
	push	edx
	call	_dynbuf_add3_int
	add	esp, 24					; 00000018H
	test	eax, eax
	je	SHORT $L70503
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29872], OFFSET FLAT:$SG70507
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 277		; 00000115H
	jmp	$eva_err$70240
$L70503:

; 278  : 			if(dyntab_sz(&table, i, _DateDel) && j >= 2 && j <= 6)

	push	10					; 0000000aH
	mov	edx, DWORD PTR _i$[ebp]
	push	edx
	lea	eax, DWORD PTR _table$[ebp]
	push	eax
	call	_dyntab_sz
	add	esp, 12					; 0000000cH
	test	eax, eax
	je	SHORT $L70510
	cmp	DWORD PTR _j$[ebp], 2
	jb	SHORT $L70510
	cmp	DWORD PTR _j$[ebp], 6
	ja	SHORT $L70510

; 279  : 				DYNBUF_ADD_STR(form->html, " background='../img/bg_rayures_grises.gif'");

	push	0
	push	0
	push	42					; 0000002aH
	push	OFFSET FLAT:$SG70511
	mov	ecx, DWORD PTR _form$[ebp]
	mov	edx, DWORD PTR [ecx+232]
	push	edx
	call	_dynbuf_add
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L70510
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29872], OFFSET FLAT:$SG70513
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 279		; 00000117H
	jmp	$eva_err$70240
$L70510:

; 280  : 			DYNBUF_ADD_STR(form->html, ">");

	push	0
	push	0
	push	1
	push	OFFSET FLAT:$SG70516
	mov	edx, DWORD PTR _form$[ebp]
	mov	eax, DWORD PTR [edx+232]
	push	eax
	call	_dynbuf_add
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L70515
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29872], OFFSET FLAT:$SG70518
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 280		; 00000118H
	jmp	$eva_err$70240
$L70515:

; 281  : 			if(dyntab_sz(&table, i, j)) DYNBUF_ADD3_CELL(form->html,

	mov	eax, DWORD PTR _j$[ebp]
	push	eax
	mov	ecx, DWORD PTR _i$[ebp]
	push	ecx
	lea	edx, DWORD PTR _table$[ebp]
	push	edx
	call	_dyntab_sz
	add	esp, 12					; 0000000cH
	test	eax, eax
	je	$L70519

; 282  : 				"<font face=Arial size=-2>", &table, i, j, NO_CONV, "</font></td>\n")

	push	13					; 0000000dH
	push	OFFSET FLAT:$SG70522
	push	0
	push	0
	mov	eax, DWORD PTR _j$[ebp]
	push	eax
	mov	ecx, DWORD PTR _i$[ebp]
	push	ecx
	lea	edx, DWORD PTR _table$[ebp]
	push	edx
	call	_dyntab_sz
	add	esp, 12					; 0000000cH
	push	eax
	mov	eax, DWORD PTR _j$[ebp]
	push	eax
	mov	ecx, DWORD PTR _i$[ebp]
	push	ecx
	lea	edx, DWORD PTR _table$[ebp]
	push	edx
	call	_dyntab_val
	add	esp, 12					; 0000000cH
	push	eax
	push	25					; 00000019H
	push	OFFSET FLAT:$SG70523
	mov	eax, DWORD PTR _form$[ebp]
	mov	ecx, DWORD PTR [eax+232]
	push	ecx
	call	_dynbuf_add3
	add	esp, 36					; 00000024H
	test	eax, eax
	je	SHORT $L70521
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29872], OFFSET FLAT:$SG70525
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 282		; 0000011aH
	jmp	$eva_err$70240
$L70521:

; 283  : 			else DYNBUF_ADD_STR(form->html,

	jmp	SHORT $L70528
$L70519:

; 284  : 				"<img src='../img/_eva_spacer.gif' border=0></td>\n");

	push	0
	push	0
	push	49					; 00000031H
	push	OFFSET FLAT:$SG70529
	mov	ecx, DWORD PTR _form$[ebp]
	mov	edx, DWORD PTR [ecx+232]
	push	edx
	call	_dynbuf_add
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L70528
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29872], OFFSET FLAT:$SG70531
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 284		; 0000011cH
	jmp	$eva_err$70240
$L70528:

; 285  : 		}

	jmp	$L70490
$L70491:

; 286  : 		DYNBUF_ADD_STR(form->html, "</tr>\n");

	push	0
	push	0
	push	6
	push	OFFSET FLAT:$SG70534
	mov	edx, DWORD PTR _form$[ebp]
	mov	eax, DWORD PTR [edx+232]
	push	eax
	call	_dynbuf_add
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L70533
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29872], OFFSET FLAT:$SG70536
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 286		; 0000011eH
	jmp	SHORT $eva_err$70240
$L70533:

; 287  : 	}

	jmp	$L70468
$L70469:

; 288  : 	DYNBUF_ADD_STR(form->html, "</table>");

	push	0
	push	0
	push	8
	push	OFFSET FLAT:$SG70539
	mov	eax, DWORD PTR _form$[ebp]
	mov	ecx, DWORD PTR [eax+232]
	push	ecx
	call	_dynbuf_add
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L70538
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29872], OFFSET FLAT:$SG70541
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 288		; 00000120H
	jmp	SHORT $eva_err$70240
$L70538:
$eva_noerr$70542:

; 289  : 
; 290  : 	RETURN_OK_CLEANUP;

	push	0
	push	OFFSET FLAT:$SG70543
	push	OFFSET FLAT:$SG70544
	mov	ecx, DWORD PTR _cntxt$[ebp]
	push	ecx
	call	_err_clear
	add	esp, 16					; 00000010H
$eva_err$70240:
	mov	edx, DWORD PTR _cntxt$[ebp]
	cmp	DWORD PTR [edx+29872], 0
	je	SHORT $L70545
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	ecx, DWORD PTR [eax+29900]
	push	ecx
	push	OFFSET FLAT:$SG70546
	push	OFFSET FLAT:$SG70547
	mov	edx, DWORD PTR _cntxt$[ebp]
	push	edx
	call	_err_add_context
	add	esp, 16					; 00000010H
$L70545:
	lea	eax, DWORD PTR _data$[ebp]
	push	eax
	call	_dyntab_free
	add	esp, 4
	lea	ecx, DWORD PTR _table$[ebp]
	push	ecx
	call	_dyntab_free
	add	esp, 4
	lea	edx, DWORD PTR _idobj$[ebp]
	push	edx
	call	_dyntab_free
	add	esp, 4
	lea	eax, DWORD PTR _objdata$[ebp]
	push	eax
	call	_dyntab_free
	add	esp, 4
	mov	ecx, DWORD PTR _buf$[ebp]
	push	ecx
	call	_mem_free
	add	esp, 4
	mov	DWORD PTR _buf$[ebp], 0
	lea	edx, DWORD PTR _tbl$[ebp]
	push	edx
	call	_table_free
	add	esp, 4
	mov	eax, DWORD PTR _cntxt$[ebp]
	xor	ecx, ecx
	cmp	DWORD PTR [eax+29872], 0
	setne	cl
	mov	eax, ecx

; 291  : }

	pop	edi
	pop	esi
	mov	esp, ebp
	pop	ebp
	ret	0
_form_mode_values ENDP
_TEXT	ENDS
END
