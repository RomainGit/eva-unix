	TITLE	D:\Travail\ABI\EVA\V4.0\CGI\Brunix-2016\check_login.c
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
PUBLIC	_set_session_statistics
EXTRN	__snprintf:NEAR
EXTRN	_sql_exec_query:NEAR
EXTRN	_strtoul:NEAR
EXTRN	_dyntab_val:NEAR
EXTRN	_dyntab_cell:NEAR
_DATA	SEGMENT
$SG70226 DB	'UPDATE TLink SET Num=%lu,DateCr=%s,IdWhoCr=%s WHERE Pkey'
	DB	'=%lu', 00H
	ORG $+3
$SG70229 DB	'NULL', 00H
	ORG $+3
$SG70230 DB	'INSERT INTO TLink (IdObj,IdField,IdRelObj,Num,DateCr,IdW'
	DB	'hoCr) VALUES (%s,%lu,%lu,1,%s,%s)', 00H
_DATA	ENDS
_TEXT	SEGMENT
_cntxt$ = 8
_data$ = 12
_idobj$ = 16
_idfield$ = 20
_qry$ = -1024
_i$ = -1032
_c$ = -1028
_set_session_statistics PROC NEAR

; 28   : ){

	push	ebp
	mov	ebp, esp
	sub	esp, 1036				; 0000040cH
	push	edi

; 29   : 	char qry[1024] = {0};

	mov	BYTE PTR _qry$[ebp], 0
	mov	ecx, 255				; 000000ffH
	xor	eax, eax
	lea	edi, DWORD PTR _qry$[ebp+1]
	rep stosd
	stosw
	stosb

; 30   : 	unsigned long i;
; 31   : 	DynTableCell *c = NULL;

	mov	DWORD PTR _c$[ebp], 0

; 32   : 
; 33   : 	/* Return if no object */
; 34   : 	if(!idobj) return;

	cmp	DWORD PTR _idobj$[ebp], 0
	jne	SHORT $L70217
	jmp	$L70231
$L70217:

; 35   : 	if(idobj == ~0UL) idobj = 0;

	cmp	DWORD PTR _idobj$[ebp], -1
	jne	SHORT $L70218
	mov	DWORD PTR _idobj$[ebp], 0
$L70218:

; 36   : 
; 37   : 	/* Search for given field & object in session data */
; 38   : 	for(i = 0; i < data->nbrows; i++)

	mov	DWORD PTR _i$[ebp], 0
	jmp	SHORT $L70219
$L70220:
	mov	eax, DWORD PTR _i$[ebp]
	add	eax, 1
	mov	DWORD PTR _i$[ebp], eax
$L70219:
	mov	ecx, DWORD PTR _data$[ebp]
	mov	edx, DWORD PTR _i$[ebp]
	cmp	edx, DWORD PTR [ecx]
	jae	SHORT $L70221

; 40   : 		c = dyntab_cell(data, i, 0);

	push	0
	mov	eax, DWORD PTR _i$[ebp]
	push	eax
	mov	ecx, DWORD PTR _data$[ebp]
	push	ecx
	call	_dyntab_cell
	add	esp, 12					; 0000000cH
	mov	DWORD PTR _c$[ebp], eax

; 41   : 		if(c->IdField == idfield && (!idobj || (c->txt && strtoul(c->txt, NULL, 10) == idobj))) break;

	mov	edx, DWORD PTR _c$[ebp]
	mov	eax, DWORD PTR [edx+28]
	cmp	eax, DWORD PTR _idfield$[ebp]
	jne	SHORT $L70223
	cmp	DWORD PTR _idobj$[ebp], 0
	je	SHORT $L70224
	mov	ecx, DWORD PTR _c$[ebp]
	cmp	DWORD PTR [ecx], 0
	je	SHORT $L70223
	push	10					; 0000000aH
	push	0
	mov	edx, DWORD PTR _c$[ebp]
	mov	eax, DWORD PTR [edx]
	push	eax
	call	_strtoul
	add	esp, 12					; 0000000cH
	cmp	eax, DWORD PTR _idobj$[ebp]
	jne	SHORT $L70223
$L70224:
	jmp	SHORT $L70221
$L70223:

; 42   : 	}

	jmp	SHORT $L70220
$L70221:

; 43   : 
; 44   : 	/* If field / obj pair found : increment Num counter */
; 45   : 	if(i < data->nbrows)

	mov	ecx, DWORD PTR _data$[ebp]
	mov	edx, DWORD PTR _i$[ebp]
	cmp	edx, DWORD PTR [ecx]
	jae	SHORT $L70225

; 46   : 		snprintf(add_sz_str(qry), "UPDATE TLink SET Num=%lu,DateCr=%s,IdWhoCr=%s WHERE Pkey=%lu",
; 47   : 					c->Num + 1, cntxt->timestamp, dyntab_val(&cntxt->id_user, 0, 0), c->Pkey);

	mov	eax, DWORD PTR _c$[ebp]
	mov	ecx, DWORD PTR [eax+16]
	push	ecx
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
	mov	ecx, DWORD PTR _c$[ebp]
	mov	edx, DWORD PTR [ecx+36]
	add	edx, 1
	push	edx
	push	OFFSET FLAT:$SG70226
	push	1023					; 000003ffH
	lea	eax, DWORD PTR _qry$[ebp]
	push	eax
	call	__snprintf
	add	esp, 28					; 0000001cH

; 48   : 	/* Else : create new record */
; 49   : 	else if(idobj)

	jmp	SHORT $L70228
$L70225:
	cmp	DWORD PTR _idobj$[ebp], 0
	je	SHORT $L70228

; 50   : 		snprintf(add_sz_str(qry), "INSERT INTO TLink (IdObj,IdField,IdRelObj,Num,DateCr,IdWhoCr) VALUES (%s,%lu,%lu,1,%s,%s)",
; 51   : 										cntxt->session.cell->txt, idfield, idobj, cntxt->timestamp,
; 52   : 										cntxt->id_user.nbrows ? cntxt->id_user.cell->txt : "NULL");

	mov	ecx, DWORD PTR _cntxt$[ebp]
	cmp	DWORD PTR [ecx+29408], 0
	je	SHORT $L70858
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	eax, DWORD PTR [edx+29424]
	mov	ecx, DWORD PTR [eax]
	mov	DWORD PTR -1036+[ebp], ecx
	jmp	SHORT $L70859
$L70858:
	mov	DWORD PTR -1036+[ebp], OFFSET FLAT:$SG70229
$L70859:
	mov	edx, DWORD PTR -1036+[ebp]
	push	edx
	mov	eax, DWORD PTR _cntxt$[ebp]
	add	eax, 29704				; 00007408H
	push	eax
	mov	ecx, DWORD PTR _idobj$[ebp]
	push	ecx
	mov	edx, DWORD PTR _idfield$[ebp]
	push	edx
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	ecx, DWORD PTR [eax+29316]
	mov	edx, DWORD PTR [ecx]
	push	edx
	push	OFFSET FLAT:$SG70230
	push	1023					; 000003ffH
	lea	eax, DWORD PTR _qry$[ebp]
	push	eax
	call	__snprintf
	add	esp, 32					; 00000020H
$L70228:

; 53   : 	if(*qry) sql_exec_query(cntxt, qry);

	movsx	ecx, BYTE PTR _qry$[ebp]
	test	ecx, ecx
	je	SHORT $L70231
	lea	edx, DWORD PTR _qry$[ebp]
	push	edx
	mov	eax, DWORD PTR _cntxt$[ebp]
	push	eax
	call	_sql_exec_query
	add	esp, 8
$L70231:

; 54   : }

	pop	edi
	mov	esp, ebp
	pop	ebp
	ret	0
_set_session_statistics ENDP
_TEXT	ENDS
PUBLIC	_qry_get_rec_info
EXTRN	_sql_get_table:NEAR
EXTRN	_err_add_context:NEAR
EXTRN	_err_clear:NEAR
_DATA	SEGMENT
	ORG $+2
$SG70245 DB	'SELECT %s FROM TLink WHERE Pkey=%lu', 00H
$SG70250 DB	'D:\Travail\ABI\EVA\V4.0\CGI\Brunix-2016\check_login.c', 00H
	ORG $+2
$SG70251 DB	'qry_get_rec_info', 00H
	ORG $+3
$SG70253 DB	'D:\Travail\ABI\EVA\V4.0\CGI\Brunix-2016\check_login.c', 00H
	ORG $+2
$SG70254 DB	'qry_get_rec_info', 00H
_DATA	ENDS
_TEXT	SEGMENT
_cntxt$ = 8
_res$ = 12
_pkey$ = 16
_fields$ = 20
_qry$ = -256
_qry_get_rec_info PROC NEAR

; 67   : ){

	push	ebp
	mov	ebp, esp
	sub	esp, 256				; 00000100H

; 68   : 	char qry[256];
; 69   : 	snprintf(add_sz_str(qry), "SELECT %s FROM TLink WHERE Pkey=%lu", fields, pkey);

	mov	eax, DWORD PTR _pkey$[ebp]
	push	eax
	mov	ecx, DWORD PTR _fields$[ebp]
	push	ecx
	push	OFFSET FLAT:$SG70245
	push	255					; 000000ffH
	lea	edx, DWORD PTR _qry$[ebp]
	push	edx
	call	__snprintf
	add	esp, 20					; 00000014H

; 70   : 	if(sql_exec_query(cntxt, qry) || sql_get_table(cntxt, res, 2)) STACK_ERROR;

	lea	eax, DWORD PTR _qry$[ebp]
	push	eax
	mov	ecx, DWORD PTR _cntxt$[ebp]
	push	ecx
	call	_sql_exec_query
	add	esp, 8
	test	eax, eax
	jne	SHORT $L70247
	push	2
	mov	edx, DWORD PTR _res$[ebp]
	push	edx
	mov	eax, DWORD PTR _cntxt$[ebp]
	push	eax
	call	_sql_get_table
	add	esp, 12					; 0000000cH
	test	eax, eax
	je	SHORT $eva_noerr$70249
$L70247:
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 70		; 00000046H
	jmp	SHORT $eva_err$70248
$eva_noerr$70249:

; 71   : 
; 72   : 	RETURN_OK_CLEANUP;

	push	0
	push	OFFSET FLAT:$SG70250
	push	OFFSET FLAT:$SG70251
	mov	edx, DWORD PTR _cntxt$[ebp]
	push	edx
	call	_err_clear
	add	esp, 16					; 00000010H
$eva_err$70248:
	mov	eax, DWORD PTR _cntxt$[ebp]
	cmp	DWORD PTR [eax+29872], 0
	je	SHORT $L70252
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	edx, DWORD PTR [ecx+29900]
	push	edx
	push	OFFSET FLAT:$SG70253
	push	OFFSET FLAT:$SG70254
	mov	eax, DWORD PTR _cntxt$[ebp]
	push	eax
	call	_err_add_context
	add	esp, 16					; 00000010H
$L70252:
	mov	ecx, DWORD PTR _cntxt$[ebp]
	xor	eax, eax
	cmp	DWORD PTR [ecx+29872], 0
	setne	al

; 73   : }

	mov	esp, ebp
	pop	ebp
	ret	0
_qry_get_rec_info ENDP
_TEXT	ENDS
PUBLIC	_output_message
EXTRN	_put_html_page_header:NEAR
EXTRN	_printf:NEAR
_DATA	SEGMENT
	ORG $+3
$SG70265 DB	'<font face=Arial><center><br><br><u>Agent de s', 0e9H, 'c'
	DB	'urit', 0e9H, '</u><br><br><hr><b><font size=+1 color=#886600>'
	DB	'%s</font></b><hr><br><br>', 00H
_DATA	ENDS
_TEXT	SEGMENT
_cntxt$ = 8
_msg$ = 12
_output_message PROC NEAR

; 84   : ){

	push	ebp
	mov	ebp, esp

; 85   : 	put_html_page_header(cntxt, NULL, NULL, NULL, 3);

	push	3
	push	0
	push	0
	push	0
	mov	eax, DWORD PTR _cntxt$[ebp]
	push	eax
	call	_put_html_page_header
	add	esp, 20					; 00000014H

; 86   : 	cntxt->txsize += printf(
; 87   : 		"<font face=Arial><center>"
; 88   : 		"<br><br><u>Agent de sécurité</u><br><br>"
; 89   : 		"<hr><b><font size=+1 color=#886600>%s</font></b><hr><br><br>",
; 90   : 		msg);

	mov	ecx, DWORD PTR _msg$[ebp]
	push	ecx
	push	OFFSET FLAT:$SG70265
	call	_printf
	add	esp, 8
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	ecx, DWORD PTR [edx+32036]
	add	ecx, eax
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+32036], ecx

; 91   : 	cntxt->b_terminate = 15;

	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29776], 15		; 0000000fH

; 92   : }

	pop	ebp
	ret	0
_output_message ENDP
_TEXT	ENDS
PUBLIC	_output_ident_inputs
_DATA	SEGMENT
	ORG $+2
$SG70272 DB	'%s<br><br><table noborder width=100%% bgcolor=#FFFFFF><t'
	DB	'r><td align=right width=50%%><font size=-1 color=#0000AA>Iden'
	DB	'tifiant</font></td><td><input type=password name=''D$#_EVA_LO'
	DB	'GINSUBMIT''></td></tr><tr><td align=right><font size=-1 color'
	DB	'=#0000AA>Mot de passe</font></td><td><input type=password nam'
	DB	'e=''D$#_EVA_LOGINSUBMITP''></td></tr></table><br><input type='
	DB	'submit name=B$#CHECK_IDENT value="Valider l''identification">'
	DB	'<br><br>', 00H
	ORG $+2
$SG70274 DB	'<script>document.mainform[''D$#_EVA_LOGINSUBMIT''].focus'
	DB	'();</script>', 00H
_DATA	ENDS
_TEXT	SEGMENT
_cntxt$ = 8
_title$ = 12
_output_ident_inputs PROC NEAR

; 101  : ){

	push	ebp
	mov	ebp, esp

; 102  : 	cntxt->txsize += printf(
; 103  : 		"%s<br><br>"
; 104  : 		"<table noborder width=100%% bgcolor=#FFFFFF>"
; 105  : 		"<tr><td align=right width=50%%><font size=-1 color=#0000AA>"
; 106  : 			"Identifiant</font></td><td><input type=password name='D$#_EVA_LOGINSUBMIT'></td></tr>"
; 107  : 		"<tr><td align=right><font size=-1 color=#0000AA>"
; 108  : 			"Mot de passe</font></td><td><input type=password name='D$#_EVA_LOGINSUBMITP'></td></tr></table>"
; 109  : 		"<br><input type=submit name=B$#CHECK_IDENT value=\"Valider l'identification\"><br><br>", title);

	mov	eax, DWORD PTR _title$[ebp]
	push	eax
	push	OFFSET FLAT:$SG70272
	call	_printf
	add	esp, 8
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	edx, DWORD PTR [ecx+32036]
	add	edx, eax
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+32036], edx

; 110  : 	if(cntxt->jsenabled) cntxt->txsize += printf(

	mov	ecx, DWORD PTR _cntxt$[ebp]
	cmp	DWORD PTR [ecx+29676], 0
	je	SHORT $L70273

; 111  : 		"<script>document.mainform['D$#_EVA_LOGINSUBMIT'].focus();</script>");

	push	OFFSET FLAT:$SG70274
	call	_printf
	add	esp, 4
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	ecx, DWORD PTR [edx+32036]
	add	ecx, eax
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+32036], ecx
$L70273:

; 112  : }

	pop	ebp
	ret	0
_output_ident_inputs ENDP
_TEXT	ENDS
PUBLIC	_handle_workstation_id
EXTRN	_get_id_value:NEAR
EXTRN	_qry_add_new_obj:NEAR
EXTRN	_qry_add_obj_field_val:NEAR
EXTRN	_dyntab_free:NEAR
EXTRN	_dyntab_field_val:NEAR
_DATA	SEGMENT
	ORG $+1
$SG70284 DB	'_EVA_FORM_USERWKS', 00H
	ORG $+2
$SG70286 DB	'_EVA_ID_WKS', 00H
$SG70295 DB	'-- Search for workstation Id', 0aH, 'SELECT DISTINCT IdO'
	DB	'bj FROM TLink WHERE IdField=%lu AND IdValue=%lu AND DateDel I'
	DB	'S NULL', 00H
$SG70304 DB	'_EVA_ID_WKS', 00H
$SG70306 DB	'D:\Travail\ABI\EVA\V4.0\CGI\Brunix-2016\check_login.c', 00H
	ORG $+2
$SG70307 DB	'handle_workstation_id', 00H
	ORG $+2
$SG70309 DB	'D:\Travail\ABI\EVA\V4.0\CGI\Brunix-2016\check_login.c', 00H
	ORG $+2
$SG70310 DB	'handle_workstation_id', 00H
_DATA	ENDS
_TEXT	SEGMENT
_cntxt$ = 8
_sqlres$ = -2168
_idformwks$ = -2172
_fldidwks$ = -2176
_qry$ = -2148
_valcook$70292 = -2180
_handle_workstation_id PROC NEAR

; 122  : ){

	push	ebp
	mov	ebp, esp
	sub	esp, 2200				; 00000898H

; 123  : 	DynTable sqlres = { 0 };

	mov	DWORD PTR _sqlres$[ebp], 0
	xor	eax, eax
	mov	DWORD PTR _sqlres$[ebp+4], eax
	mov	DWORD PTR _sqlres$[ebp+8], eax
	mov	DWORD PTR _sqlres$[ebp+12], eax
	mov	DWORD PTR _sqlres$[ebp+16], eax

; 124  : 	unsigned long idformwks = strtoul(DYNTAB_FIELD_VAL(&cntxt->cnf_data, FORM_USERWKS), NULL, 10);

	push	10					; 0000000aH
	push	0
	push	0
	push	-1
	push	OFFSET FLAT:$SG70284
	mov	ecx, DWORD PTR _cntxt$[ebp]
	add	ecx, 29360				; 000072b0H
	push	ecx
	call	_dyntab_field_val
	add	esp, 16					; 00000010H
	push	eax
	call	_strtoul
	add	esp, 12					; 0000000cH
	mov	DWORD PTR _idformwks$[ebp], eax

; 125  : 	unsigned long fldidwks = idformwks ? get_id_value(cntxt, add_sz_str("_EVA_ID_WKS")) : 0;

	cmp	DWORD PTR _idformwks$[ebp], 0
	je	SHORT $L70864
	push	11					; 0000000bH
	push	OFFSET FLAT:$SG70286
	mov	edx, DWORD PTR _cntxt$[ebp]
	push	edx
	call	_get_id_value
	add	esp, 12					; 0000000cH
	mov	DWORD PTR -2184+[ebp], eax
	jmp	SHORT $L70865
$L70864:
	mov	DWORD PTR -2184+[ebp], 0
$L70865:
	mov	eax, DWORD PTR -2184+[ebp]
	mov	DWORD PTR _fldidwks$[ebp], eax

; 126  : 	char qry[2148];
; 127  : 
; 128  : 	/* Do not handle if no worksation form defined in server config */
; 129  : 	if(!idformwks || !fldidwks) RETURN_OK;

	cmp	DWORD PTR _idformwks$[ebp], 0
	je	SHORT $L70289
	cmp	DWORD PTR _fldidwks$[ebp], 0
	jne	SHORT $L70288
$L70289:
	jmp	$eva_noerr$70290
$L70288:

; 130  : 
; 131  : 	/* Check if cookie present */
; 132  : 	if(cntxt->id_wks)

	mov	ecx, DWORD PTR _cntxt$[ebp]
	cmp	DWORD PTR [ecx+29824], 0
	je	$L70300

; 134  : 		/* Check if object exist for workstation */
; 135  : 		unsigned long valcook = get_id_value(cntxt, DYNBUF_VAL_SZ(cntxt->id_wks));

	mov	edx, DWORD PTR _cntxt$[ebp]
	cmp	DWORD PTR [edx+29824], 0
	je	SHORT $L70866
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	ecx, DWORD PTR [eax+29824]
	mov	edx, DWORD PTR [ecx+4]
	mov	DWORD PTR -2188+[ebp], edx
	jmp	SHORT $L70867
$L70866:
	mov	DWORD PTR -2188+[ebp], 0
$L70867:
	mov	eax, DWORD PTR _cntxt$[ebp]
	cmp	DWORD PTR [eax+29824], 0
	je	SHORT $L70868
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	edx, DWORD PTR [ecx+29824]
	add	edx, 8
	mov	DWORD PTR -2192+[ebp], edx
	jmp	SHORT $L70869
$L70868:
	mov	DWORD PTR -2192+[ebp], 0
$L70869:
	mov	eax, DWORD PTR -2188+[ebp]
	push	eax
	mov	ecx, DWORD PTR -2192+[ebp]
	push	ecx
	mov	edx, DWORD PTR _cntxt$[ebp]
	push	edx
	call	_get_id_value
	add	esp, 12					; 0000000cH
	mov	DWORD PTR _valcook$70292[ebp], eax

; 136  : 		if(valcook)

	cmp	DWORD PTR _valcook$70292[ebp], 0
	je	$L70294

; 138  : 			snprintf(add_sz_str(qry),
; 139  : 				"-- Search for workstation Id\n"
; 140  : 				"SELECT DISTINCT IdObj FROM TLink WHERE IdField=%lu AND IdValue=%lu AND DateDel IS NULL",
; 141  : 				fldidwks, valcook);

	mov	eax, DWORD PTR _valcook$70292[ebp]
	push	eax
	mov	ecx, DWORD PTR _fldidwks$[ebp]
	push	ecx
	push	OFFSET FLAT:$SG70295
	push	2147					; 00000863H
	lea	edx, DWORD PTR _qry$[ebp]
	push	edx
	call	__snprintf
	add	esp, 20					; 00000014H

; 142  : 			if(sql_exec_query(cntxt, qry) || sql_get_table(cntxt, &sqlres, 2)) STACK_ERROR;

	lea	eax, DWORD PTR _qry$[ebp]
	push	eax
	mov	ecx, DWORD PTR _cntxt$[ebp]
	push	ecx
	call	_sql_exec_query
	add	esp, 8
	test	eax, eax
	jne	SHORT $L70297
	push	2
	lea	edx, DWORD PTR _sqlres$[ebp]
	push	edx
	mov	eax, DWORD PTR _cntxt$[ebp]
	push	eax
	call	_sql_get_table
	add	esp, 12					; 0000000cH
	test	eax, eax
	je	SHORT $L70296
$L70297:
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 142		; 0000008eH
	jmp	$eva_err$70298
$L70296:

; 143  : 			cntxt->objwks = DYNTAB_TOUL(&sqlres);

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
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29828], eax
$L70294:

; 145  : 
; 146  : 		/* Create workstation object if applicable */
; 147  : 		if(!cntxt->objwks)

	mov	edx, DWORD PTR _cntxt$[ebp]
	cmp	DWORD PTR [edx+29828], 0
	jne	$L70300

; 149  : 			if(qry_add_new_obj(cntxt, &sqlres, idformwks) ||
; 150  : 				qry_add_obj_field_val(cntxt, &sqlres, "_EVA_ID_WKS", DYNBUF_VAL_SZ(cntxt->id_wks), 0, 1))

	mov	eax, DWORD PTR _idformwks$[ebp]
	push	eax
	lea	ecx, DWORD PTR _sqlres$[ebp]
	push	ecx
	mov	edx, DWORD PTR _cntxt$[ebp]
	push	edx
	call	_qry_add_new_obj
	add	esp, 12					; 0000000cH
	test	eax, eax
	jne	$L70303
	mov	eax, DWORD PTR _cntxt$[ebp]
	cmp	DWORD PTR [eax+29824], 0
	je	SHORT $L70870
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	edx, DWORD PTR [ecx+29824]
	mov	eax, DWORD PTR [edx+4]
	mov	DWORD PTR -2196+[ebp], eax
	jmp	SHORT $L70871
$L70870:
	mov	DWORD PTR -2196+[ebp], 0
$L70871:
	mov	ecx, DWORD PTR _cntxt$[ebp]
	cmp	DWORD PTR [ecx+29824], 0
	je	SHORT $L70872
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	eax, DWORD PTR [edx+29824]
	add	eax, 8
	mov	DWORD PTR -2200+[ebp], eax
	jmp	SHORT $L70873
$L70872:
	mov	DWORD PTR -2200+[ebp], 0
$L70873:
	push	1
	push	0
	mov	ecx, DWORD PTR -2196+[ebp]
	push	ecx
	mov	edx, DWORD PTR -2200+[ebp]
	push	edx
	push	OFFSET FLAT:$SG70304
	lea	eax, DWORD PTR _sqlres$[ebp]
	push	eax
	mov	ecx, DWORD PTR _cntxt$[ebp]
	push	ecx
	call	_qry_add_obj_field_val
	add	esp, 28					; 0000001cH
	test	eax, eax
	je	SHORT $L70302
$L70303:

; 151  : 				STACK_ERROR;

	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 151		; 00000097H
	jmp	SHORT $eva_err$70298
$L70302:

; 152  : 			cntxt->objwks = DYNTAB_TOUL(&sqlres);

	push	10					; 0000000aH
	push	0
	push	0
	push	0
	lea	eax, DWORD PTR _sqlres$[ebp]
	push	eax
	call	_dyntab_val
	add	esp, 12					; 0000000cH
	push	eax
	call	_strtoul
	add	esp, 12					; 0000000cH
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29828], eax
$L70300:
$eva_noerr$70290:

; 155  : 
; 156  : 	RETURN_OK_CLEANUP;

	push	0
	push	OFFSET FLAT:$SG70306
	push	OFFSET FLAT:$SG70307
	mov	edx, DWORD PTR _cntxt$[ebp]
	push	edx
	call	_err_clear
	add	esp, 16					; 00000010H
$eva_err$70298:
	mov	eax, DWORD PTR _cntxt$[ebp]
	cmp	DWORD PTR [eax+29872], 0
	je	SHORT $L70308
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	edx, DWORD PTR [ecx+29900]
	push	edx
	push	OFFSET FLAT:$SG70309
	push	OFFSET FLAT:$SG70310
	mov	eax, DWORD PTR _cntxt$[ebp]
	push	eax
	call	_err_add_context
	add	esp, 16					; 00000010H
$L70308:
	lea	ecx, DWORD PTR _sqlres$[ebp]
	push	ecx
	call	_dyntab_free
	add	esp, 4
	mov	edx, DWORD PTR _cntxt$[ebp]
	xor	eax, eax
	cmp	DWORD PTR [edx+29872], 0
	setne	al

; 157  : }

	mov	esp, ebp
	pop	ebp
	ret	0
_handle_workstation_id ENDP
_TEXT	ENDS
PUBLIC	_check_user_fraud
EXTRN	_qry_add_idobj_field_val:NEAR
EXTRN	_strcmp:NEAR
EXTRN	_strlen:NEAR
EXTRN	_dyntab_field_cell:NEAR
_DATA	SEGMENT
	ORG $+2
$SG70325 DB	'_EVA_USER_IP', 00H
	ORG $+3
$SG70327 DB	'DateCr', 00H
	ORG $+1
$SG70330 DB	'_EVA_USER_IP', 00H
	ORG $+3
$SG70331 DB	'SELECT IdObj FROM TLink WHERE IdWhoCr=%lu AND IdField=%l'
	DB	'u AND DateCr>''%s''', 00H
	ORG $+2
$SG70338 DB	'_EVA_BLOCK', 00H
	ORG $+1
$SG70339 DB	'Utilisation simultan', 0e9H, 'e du compte sur plusieurs '
	DB	'postes - Compte bloqu', 0e9H, 00H
	ORG $+2
$SG70342 DB	'_EVA_DEACTIVATE', 00H
$SG70344 DB	'Utilisation simultan', 0e9H, 'e du compte sur plusieurs '
	DB	'postes - Session termin', 0e9H, 'e', 00H
	ORG $+3
$SG70347 DB	'_EVA_TERMINATE', 00H
	ORG $+1
$SG70353 DB	'_EVA_TERMINATE', 00H
	ORG $+1
$SG70355 DB	'D:\Travail\ABI\EVA\V4.0\CGI\Brunix-2016\check_login.c', 00H
	ORG $+2
$SG70356 DB	'check_user_fraud', 00H
	ORG $+3
$SG70358 DB	'D:\Travail\ABI\EVA\V4.0\CGI\Brunix-2016\check_login.c', 00H
	ORG $+2
$SG70359 DB	'check_user_fraud', 00H
_DATA	ENDS
_TEXT	SEGMENT
_cntxt$ = 8
_fraudchk$ = 12
_errmsg$ = 16
_sqlres$ = -1048
_qry$ = -1024
_c$ = -1028
_i$70335 = -1052
_len$70336 = -1056
_check_user_fraud PROC NEAR

; 171  : ){

	push	ebp
	mov	ebp, esp
	sub	esp, 1056				; 00000420H

; 172  : 	DynTable sqlres = { 0 };

	mov	DWORD PTR _sqlres$[ebp], 0
	xor	eax, eax
	mov	DWORD PTR _sqlres$[ebp+4], eax
	mov	DWORD PTR _sqlres$[ebp+8], eax
	mov	DWORD PTR _sqlres$[ebp+12], eax
	mov	DWORD PTR _sqlres$[ebp+16], eax

; 173  : 	char qry[1024];
; 174  : 
; 175  : 	/* Read last click time */
; 176  : 	DynTableCell *c = DYNTAB_FIELD_CELL(&cntxt->sess_data, USER_IP);

	push	0
	push	-1
	push	OFFSET FLAT:$SG70325
	mov	ecx, DWORD PTR _cntxt$[ebp]
	add	ecx, 29320				; 00007288H
	push	ecx
	call	_dyntab_field_cell
	add	esp, 16					; 00000010H
	mov	DWORD PTR _c$[ebp], eax

; 177  : 	if(c && qry_get_rec_info(cntxt, &sqlres, c->Pkey, "DateCr")) STACK_ERROR;

	cmp	DWORD PTR _c$[ebp], 0
	je	SHORT $L70326
	push	OFFSET FLAT:$SG70327
	mov	edx, DWORD PTR _c$[ebp]
	mov	eax, DWORD PTR [edx+16]
	push	eax
	lea	ecx, DWORD PTR _sqlres$[ebp]
	push	ecx
	mov	edx, DWORD PTR _cntxt$[ebp]
	push	edx
	call	_qry_get_rec_info
	add	esp, 16					; 00000010H
	test	eax, eax
	je	SHORT $L70326
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 177		; 000000b1H
	jmp	$eva_err$70328
$L70326:

; 178  : 
; 179  : 	/* Search for clicks of same user after last click */
; 180  : 	snprintf(add_sz_str(qry),
; 181  : 		"SELECT IdObj FROM TLink WHERE IdWhoCr=%lu AND IdField=%lu AND DateCr>'%s'",
; 182  : 		DYNTAB_TOUL(&cntxt->id_user), IDVAL("_EVA_USER_IP"), dyntab_val(&sqlres, 0, 0));

	push	0
	push	0
	lea	ecx, DWORD PTR _sqlres$[ebp]
	push	ecx
	call	_dyntab_val
	add	esp, 12					; 0000000cH
	push	eax
	push	12					; 0000000cH
	push	OFFSET FLAT:$SG70330
	mov	edx, DWORD PTR _cntxt$[ebp]
	push	edx
	call	_get_id_value
	add	esp, 12					; 0000000cH
	push	eax
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
	push	OFFSET FLAT:$SG70331
	push	1023					; 000003ffH
	lea	ecx, DWORD PTR _qry$[ebp]
	push	ecx
	call	__snprintf
	add	esp, 24					; 00000018H

; 183  : 	if(sql_exec_query(cntxt, qry) || sql_get_table(cntxt, &sqlres, 2)) STACK_ERROR;

	lea	edx, DWORD PTR _qry$[ebp]
	push	edx
	mov	eax, DWORD PTR _cntxt$[ebp]
	push	eax
	call	_sql_exec_query
	add	esp, 8
	test	eax, eax
	jne	SHORT $L70333
	push	2
	lea	ecx, DWORD PTR _sqlres$[ebp]
	push	ecx
	mov	edx, DWORD PTR _cntxt$[ebp]
	push	edx
	call	_sql_get_table
	add	esp, 12					; 0000000cH
	test	eax, eax
	je	SHORT $L70332
$L70333:
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 183		; 000000b7H
	jmp	$eva_err$70328
$L70332:

; 184  : 
; 185  : 	/* Handle fraud detection */
; 186  : 	if(sqlres.nbrows)

	cmp	DWORD PTR _sqlres$[ebp], 0
	je	$L70350

; 188  : 		unsigned long i;
; 189  : 		size_t len = strlen(fraudchk);

	mov	ecx, DWORD PTR _fraudchk$[ebp]
	push	ecx
	call	_strlen
	add	esp, 4
	mov	DWORD PTR _len$70336[ebp], eax

; 190  : 		if(!strcmp(fraudchk, "_EVA_BLOCK"))

	push	OFFSET FLAT:$SG70338
	mov	edx, DWORD PTR _fraudchk$[ebp]
	push	edx
	call	_strcmp
	add	esp, 8
	test	eax, eax
	jne	SHORT $L70337

; 192  : 			/* Block user account */
; 193  : 			*errmsg = FRAUD_BLOKMSG;

	mov	eax, DWORD PTR _errmsg$[ebp]
	mov	DWORD PTR [eax], OFFSET FLAT:$SG70339

; 194  : 			if(qry_add_idobj_field_val(cntxt, DYNTAB_TOUL(&cntxt->id_user), "_EVA_DEACTIVATE", fraudchk, len, 1, 0, 1))

	push	1
	push	0
	push	1
	mov	ecx, DWORD PTR _len$70336[ebp]
	push	ecx
	mov	edx, DWORD PTR _fraudchk$[ebp]
	push	edx
	push	OFFSET FLAT:$SG70342
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
	mov	ecx, DWORD PTR _cntxt$[ebp]
	push	ecx
	call	_qry_add_idobj_field_val
	add	esp, 32					; 00000020H
	test	eax, eax
	je	SHORT $L70341

; 195  : 				STACK_ERROR;

	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 195		; 000000c3H
	jmp	$eva_err$70328
$L70341:

; 197  : 		else

	jmp	SHORT $L70343
$L70337:

; 199  : 			*errmsg = FRAUD_WARNING;

	mov	eax, DWORD PTR _errmsg$[ebp]
	mov	DWORD PTR [eax], OFFSET FLAT:$SG70344
$L70343:

; 201  : 
; 202  : 		/* Terminate all sessions - memorize fraud & resulting action */
; 203  : 		if(qry_add_idobj_field_val(cntxt, DYNTAB_TOUL(&cntxt->session), "_EVA_TERMINATE", fraudchk, len, 1, 0, 1))

	push	1
	push	0
	push	1
	mov	ecx, DWORD PTR _len$70336[ebp]
	push	ecx
	mov	edx, DWORD PTR _fraudchk$[ebp]
	push	edx
	push	OFFSET FLAT:$SG70347
	push	10					; 0000000aH
	push	0
	push	0
	push	0
	mov	eax, DWORD PTR _cntxt$[ebp]
	add	eax, 29300				; 00007274H
	push	eax
	call	_dyntab_val
	add	esp, 12					; 0000000cH
	push	eax
	call	_strtoul
	add	esp, 12					; 0000000cH
	push	eax
	mov	ecx, DWORD PTR _cntxt$[ebp]
	push	ecx
	call	_qry_add_idobj_field_val
	add	esp, 32					; 00000020H
	test	eax, eax
	je	SHORT $L70346

; 204  : 			STACK_ERROR;

	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 204		; 000000ccH
	jmp	$eva_err$70328
$L70346:

; 205  : 		for(i = 0; i < sqlres.nbrows; i++)

	mov	DWORD PTR _i$70335[ebp], 0
	jmp	SHORT $L70348
$L70349:
	mov	eax, DWORD PTR _i$70335[ebp]
	add	eax, 1
	mov	DWORD PTR _i$70335[ebp], eax
$L70348:
	mov	ecx, DWORD PTR _i$70335[ebp]
	cmp	ecx, DWORD PTR _sqlres$[ebp]
	jae	SHORT $L70350

; 206  : 			if(qry_add_idobj_field_val(cntxt, DYNTAB_TOULRC(&sqlres, i, 0), "_EVA_TERMINATE", fraudchk, len, 1, 0, 1))

	push	1
	push	0
	push	1
	mov	edx, DWORD PTR _len$70336[ebp]
	push	edx
	mov	eax, DWORD PTR _fraudchk$[ebp]
	push	eax
	push	OFFSET FLAT:$SG70353
	push	10					; 0000000aH
	push	0
	push	0
	mov	ecx, DWORD PTR _i$70335[ebp]
	push	ecx
	lea	edx, DWORD PTR _sqlres$[ebp]
	push	edx
	call	_dyntab_val
	add	esp, 12					; 0000000cH
	push	eax
	call	_strtoul
	add	esp, 12					; 0000000cH
	push	eax
	mov	eax, DWORD PTR _cntxt$[ebp]
	push	eax
	call	_qry_add_idobj_field_val
	add	esp, 32					; 00000020H
	test	eax, eax
	je	SHORT $L70352

; 207  : 				STACK_ERROR;

	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 207		; 000000cfH
	jmp	SHORT $eva_err$70328
$L70352:
	jmp	SHORT $L70349
$L70350:
$eva_noerr$70354:

; 209  : 
; 210  : 	RETURN_OK_CLEANUP;

	push	0
	push	OFFSET FLAT:$SG70355
	push	OFFSET FLAT:$SG70356
	mov	edx, DWORD PTR _cntxt$[ebp]
	push	edx
	call	_err_clear
	add	esp, 16					; 00000010H
$eva_err$70328:
	mov	eax, DWORD PTR _cntxt$[ebp]
	cmp	DWORD PTR [eax+29872], 0
	je	SHORT $L70357
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	edx, DWORD PTR [ecx+29900]
	push	edx
	push	OFFSET FLAT:$SG70358
	push	OFFSET FLAT:$SG70359
	mov	eax, DWORD PTR _cntxt$[ebp]
	push	eax
	call	_err_add_context
	add	esp, 16					; 00000010H
$L70357:
	lea	ecx, DWORD PTR _sqlres$[ebp]
	push	ecx
	call	_dyntab_free
	add	esp, 4
	mov	edx, DWORD PTR _cntxt$[ebp]
	xor	eax, eax
	cmp	DWORD PTR [edx+29872], 0
	setne	al

; 211  : }

	mov	esp, ebp
	pop	ebp
	ret	0
_check_user_fraud ENDP
_TEXT	ENDS
PUBLIC	_ckeck_user_validity
EXTRN	_qry_obj_data:NEAR
_DATA	SEGMENT
	ORG $+3
$SG70379 DB	'_EVA_CHECK_FRAUD', 00H
	ORG $+3
$SG70381 DB	'_EVA_NO_IP_CHECK', 00H
	ORG $+3
$SG70384 DB	'_EVA_DEACTIVATE', 00H
$SG70386 DB	'_EVA_LOGIN', 00H
	ORG $+1
$SG70387 DB	'_EVA_PASSWORD', 00H
	ORG $+2
$SG70388 DB	'Votre compte est d', 0e9H, 'sactiv', 0e9H, 00H
	ORG $+1
$SG70392 DB	'La d', 0e9H, 'tection de fraude est activ', 0e9H, 'e : v'
	DB	'otre navigateur doit autoriser les cookies', 00H
	ORG $+3
$SG70396 DB	'D:\Travail\ABI\EVA\V4.0\CGI\Brunix-2016\check_login.c', 00H
	ORG $+2
$SG70397 DB	'ckeck_user_validity', 00H
$SG70399 DB	'D:\Travail\ABI\EVA\V4.0\CGI\Brunix-2016\check_login.c', 00H
	ORG $+2
$SG70400 DB	'ckeck_user_validity', 00H
_DATA	ENDS
_TEXT	SEGMENT
_cntxt$ = 8
_errmsg$ = 12
_iduser$ = -4
_fraudchk$ = -8
_ckeck_user_validity PROC NEAR

; 224  : ){

	push	ebp
	mov	ebp, esp
	sub	esp, 8

; 225  : 	unsigned long iduser = DYNTAB_TOUL(&cntxt->id_user);

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
	mov	DWORD PTR _iduser$[ebp], eax

; 226  : 	char *fraudchk;
; 227  : 
; 228  : 	*errmsg = NULL;

	mov	ecx, DWORD PTR _errmsg$[ebp]
	mov	DWORD PTR [ecx], 0

; 229  : 	if(!iduser || iduser == cntxt->id_public) RETURN_OK;

	cmp	DWORD PTR _iduser$[ebp], 0
	je	SHORT $L70374
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	eax, DWORD PTR _iduser$[ebp]
	cmp	eax, DWORD PTR [edx+29640]
	jne	SHORT $L70373
$L70374:
	jmp	$eva_noerr$70375
$L70373:

; 230  : 	if(qry_obj_data(cntxt, &cntxt->user_data, &cntxt->id_user, NULL)) STACK_ERROR;

	push	0
	mov	ecx, DWORD PTR _cntxt$[ebp]
	add	ecx, 29408				; 000072e0H
	push	ecx
	mov	edx, DWORD PTR _cntxt$[ebp]
	add	edx, 29428				; 000072f4H
	push	edx
	mov	eax, DWORD PTR _cntxt$[ebp]
	push	eax
	call	_qry_obj_data
	add	esp, 16					; 00000010H
	test	eax, eax
	je	SHORT $L70377
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 230		; 000000e6H
	jmp	$eva_err$70378
$L70377:

; 231  : 	fraudchk = DYNTAB_FIELD_VAL(&cntxt->cnf_data, CHECK_FRAUD);

	push	0
	push	-1
	push	OFFSET FLAT:$SG70379
	mov	edx, DWORD PTR _cntxt$[ebp]
	add	edx, 29360				; 000072b0H
	push	edx
	call	_dyntab_field_val
	add	esp, 16					; 00000010H
	mov	DWORD PTR _fraudchk$[ebp], eax

; 232  : 	if(DYNTAB_FIELD_CELL(&cntxt->user_data, NO_IP_CHECK)) cntxt->b_noipcheck = 1;

	push	0
	push	-1
	push	OFFSET FLAT:$SG70381
	mov	eax, DWORD PTR _cntxt$[ebp]
	add	eax, 29428				; 000072f4H
	push	eax
	call	_dyntab_field_cell
	add	esp, 16					; 00000010H
	test	eax, eax
	je	SHORT $L70380
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29616], 1
$L70380:

; 233  : 
; 234  : 	/* Check account validity */
; 235  : 	if(DYNTAB_FIELD_CELL(&cntxt->user_data, DEACTIVATE) || !(
; 236  : 		DYNTAB_FIELD_CELL(&cntxt->user_data, LOGIN) &&
; 237  : 		DYNTAB_FIELD_CELL(&cntxt->user_data, PASSWORD)))

	push	0
	push	-1
	push	OFFSET FLAT:$SG70384
	mov	edx, DWORD PTR _cntxt$[ebp]
	add	edx, 29428				; 000072f4H
	push	edx
	call	_dyntab_field_cell
	add	esp, 16					; 00000010H
	test	eax, eax
	jne	SHORT $L70385
	push	0
	push	-1
	push	OFFSET FLAT:$SG70386
	mov	eax, DWORD PTR _cntxt$[ebp]
	add	eax, 29428				; 000072f4H
	push	eax
	call	_dyntab_field_cell
	add	esp, 16					; 00000010H
	test	eax, eax
	je	SHORT $L70385
	push	0
	push	-1
	push	OFFSET FLAT:$SG70387
	mov	ecx, DWORD PTR _cntxt$[ebp]
	add	ecx, 29428				; 000072f4H
	push	ecx
	call	_dyntab_field_cell
	add	esp, 16					; 00000010H
	test	eax, eax
	jne	SHORT $L70382
$L70385:

; 239  : 		/* Message if account deactivated */
; 240  : 		*errmsg = "Votre compte est désactivé";

	mov	edx, DWORD PTR _errmsg$[ebp]
	mov	DWORD PTR [edx], OFFSET FLAT:$SG70388

; 242  : 
; 243  : 	/* Disable connection if fraud detection & no cookie */
; 244  : 	else if(iduser != cntxt->id_public && *fraudchk)

	jmp	SHORT $L70394
$L70382:
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	ecx, DWORD PTR _iduser$[ebp]
	cmp	ecx, DWORD PTR [eax+29640]
	je	SHORT $L70394
	mov	edx, DWORD PTR _fraudchk$[ebp]
	movsx	eax, BYTE PTR [edx]
	test	eax, eax
	je	SHORT $L70394

; 246  : 		if(!cntxt->id_wks->cnt)

	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	edx, DWORD PTR [ecx+29824]
	cmp	DWORD PTR [edx+4], 0
	jne	SHORT $L70391

; 248  : 			*errmsg = "La détection de fraude est activée : votre navigateur doit autoriser les cookies";

	mov	eax, DWORD PTR _errmsg$[ebp]
	mov	DWORD PTR [eax], OFFSET FLAT:$SG70392

; 250  : 		else

	jmp	SHORT $L70394
$L70391:

; 252  : 			if(check_user_fraud(cntxt, fraudchk, errmsg)) STACK_ERROR;

	mov	ecx, DWORD PTR _errmsg$[ebp]
	push	ecx
	mov	edx, DWORD PTR _fraudchk$[ebp]
	push	edx
	mov	eax, DWORD PTR _cntxt$[ebp]
	push	eax
	call	_check_user_fraud
	add	esp, 12					; 0000000cH
	test	eax, eax
	je	SHORT $L70394
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 252		; 000000fcH
	jmp	SHORT $eva_err$70378
$L70394:

; 255  : 
; 256  : 	/* Ignore user if not valid */
; 257  : 	if(*errmsg)

	mov	edx, DWORD PTR _errmsg$[ebp]
	cmp	DWORD PTR [edx], 0
	je	SHORT $eva_noerr$70375

; 259  : 		DYNTAB_FREE(cntxt->id_user);

	mov	eax, DWORD PTR _cntxt$[ebp]
	add	eax, 29408				; 000072e0H
	push	eax
	call	_dyntab_free
	add	esp, 4

; 260  : 		DYNTAB_FREE(cntxt->user_data);

	mov	ecx, DWORD PTR _cntxt$[ebp]
	add	ecx, 29428				; 000072f4H
	push	ecx
	call	_dyntab_free
	add	esp, 4
$eva_noerr$70375:

; 262  : 
; 263  : 	RETURN_OK_CLEANUP;

	push	0
	push	OFFSET FLAT:$SG70396
	push	OFFSET FLAT:$SG70397
	mov	edx, DWORD PTR _cntxt$[ebp]
	push	edx
	call	_err_clear
	add	esp, 16					; 00000010H
$eva_err$70378:
	mov	eax, DWORD PTR _cntxt$[ebp]
	cmp	DWORD PTR [eax+29872], 0
	je	SHORT $L70398
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	edx, DWORD PTR [ecx+29900]
	push	edx
	push	OFFSET FLAT:$SG70399
	push	OFFSET FLAT:$SG70400
	mov	eax, DWORD PTR _cntxt$[ebp]
	push	eax
	call	_err_add_context
	add	esp, 16					; 00000010H
$L70398:
	mov	ecx, DWORD PTR _cntxt$[ebp]
	xor	eax, eax
	cmp	DWORD PTR [ecx+29872], 0
	setne	al

; 264  : }

	mov	esp, ebp
	pop	ebp
	ret	0
_ckeck_user_validity ENDP
_TEXT	ENDS
PUBLIC	_ckeck_session_validity
EXTRN	_datetxt_to_time:NEAR
EXTRN	_dyntab_filter_field:NEAR
_DATA	SEGMENT
$SG70422 DB	'_EVA_USER', 00H
	ORG $+2
$SG70424 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70427 DB	'_EVA_TERMINATE', 00H
	ORG $+1
$SG70429 DB	'10', 00H
	ORG $+1
$SG70430 DB	'Utilisation simultan', 0e9H, 'e du compte sur plusieurs '
	DB	'postes - Session termin', 0e9H, 'e', 00H
	ORG $+3
$SG70431 DB	'11', 00H
	ORG $+1
$SG70432 DB	'Utilisation simultan', 0e9H, 'e du compte sur plusieurs '
	DB	'postes - Compte bloqu', 0e9H, 00H
	ORG $+2
$SG70433 DB	'Cette session est termin', 0e9H, 'e', 00H
	ORG $+1
$SG70435 DB	'_EVA_USER_IP', 00H
	ORG $+3
$SG70436 DB	'Votre session n''est plus valide (l''adresse IP a chang', 0e9H
	DB	')', 00H
$SG70437 DB	'_EVA_MAX_SESSION_DURATION', 00H
	ORG $+2
$SG70439 DB	'_EVA_MAX_SESSION_DURATION', 00H
	ORG $+2
$SG70441 DB	'14400', 00H
	ORG $+2
$SG70445 DB	'_EVA_FORMSTAMP', 00H
	ORG $+1
$SG70447 DB	'DateCr', 00H
	ORG $+1
$SG70450 DB	'Votre session n''est plus valide (dur', 0e9H, 'e maximum'
	DB	' d', 0e9H, 'pass', 0e9H, 'e)', 00H
	ORG $+3
$SG70451 DB	'_EVA_MAX_INACTIVE_DURATION', 00H
	ORG $+1
$SG70453 DB	'_EVA_MAX_INACTIVE_DURATION', 00H
	ORG $+1
$SG70457 DB	'_EVA_USER_IP', 00H
	ORG $+3
$SG70459 DB	'DateCr', 00H
	ORG $+1
$SG70462 DB	'Dur', 0e9H, 'e maximum d''inactivit', 0e9H, ' d', 0e9H, 'p'
	DB	'ass', 0e9H, 'e - identification requise', 00H
	ORG $+3
$SG70463 DB	'D:\Travail\ABI\EVA\V4.0\CGI\Brunix-2016\check_login.c', 00H
	ORG $+2
$SG70464 DB	'ckeck_session_validity', 00H
	ORG $+1
$SG70466 DB	'D:\Travail\ABI\EVA\V4.0\CGI\Brunix-2016\check_login.c', 00H
	ORG $+2
$SG70467 DB	'ckeck_session_validity', 00H
_DATA	ENDS
_TEXT	SEGMENT
_cntxt$ = 8
_errmsg$ = 12
_sqlres$ = -28
_txt$ = -8
_t$ = -4
_minutes$ = -32
_c$70444 = -36
_c$70456 = -40
_ckeck_session_validity PROC NEAR

; 278  : ){

	push	ebp
	mov	ebp, esp
	sub	esp, 48					; 00000030H

; 279  : 	DynTable sqlres = { 0 };

	mov	DWORD PTR _sqlres$[ebp], 0
	xor	eax, eax
	mov	DWORD PTR _sqlres$[ebp+4], eax
	mov	DWORD PTR _sqlres$[ebp+8], eax
	mov	DWORD PTR _sqlres$[ebp+12], eax
	mov	DWORD PTR _sqlres$[ebp+16], eax

; 280  : 	char *txt;
; 281  : 	time_t t = 0, minutes;

	mov	DWORD PTR _t$[ebp], 0

; 282  : 
; 283  : 	/* Return if no active session */
; 284  : 	*errmsg = NULL;

	mov	ecx, DWORD PTR _errmsg$[ebp]
	mov	DWORD PTR [ecx], 0

; 285  : 	if(!cntxt->session.nbrows) RETURN_OK;

	mov	edx, DWORD PTR _cntxt$[ebp]
	cmp	DWORD PTR [edx+29300], 0
	jne	SHORT $L70415
	jmp	$eva_noerr$70416
$L70415:

; 286  : 
; 287  : 	/* Read current session & user data */
; 288  : 	if(qry_obj_data(cntxt, &cntxt->sess_data, &cntxt->session, NULL)) STACK_ERROR;

	push	0
	mov	eax, DWORD PTR _cntxt$[ebp]
	add	eax, 29300				; 00007274H
	push	eax
	mov	ecx, DWORD PTR _cntxt$[ebp]
	add	ecx, 29320				; 00007288H
	push	ecx
	mov	edx, DWORD PTR _cntxt$[ebp]
	push	edx
	call	_qry_obj_data
	add	esp, 16					; 00000010H
	test	eax, eax
	je	SHORT $L70418
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 288		; 00000120H
	jmp	$eva_err$70419
$L70418:

; 289  : 	DYNTAB_FIELD(&cntxt->id_user, &cntxt->sess_data, USER);

	mov	ecx, DWORD PTR _cntxt$[ebp]
	add	ecx, 29408				; 000072e0H
	push	ecx
	call	_dyntab_free
	add	esp, 4
	push	0
	push	-1
	push	OFFSET FLAT:$SG70422
	mov	edx, DWORD PTR _cntxt$[ebp]
	add	edx, 29320				; 00007288H
	push	edx
	push	0
	mov	eax, DWORD PTR _cntxt$[ebp]
	add	eax, 29408				; 000072e0H
	push	eax
	call	_dyntab_filter_field
	add	esp, 24					; 00000018H
	test	eax, eax
	je	SHORT $L70421
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29872], OFFSET FLAT:$SG70424
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 289		; 00000121H
	jmp	$eva_err$70419
$L70421:

; 290  : 
; 291  : 	/* Check user account validity */
; 292  : 	if(ckeck_user_validity(cntxt, errmsg)) STACK_ERROR;

	mov	eax, DWORD PTR _errmsg$[ebp]
	push	eax
	mov	ecx, DWORD PTR _cntxt$[ebp]
	push	ecx
	call	_ckeck_user_validity
	add	esp, 8
	test	eax, eax
	je	SHORT $L70425
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 292		; 00000124H
	jmp	$eva_err$70419
$L70425:

; 293  : 	if(*errmsg) RETURN_OK;

	mov	eax, DWORD PTR _errmsg$[ebp]
	cmp	DWORD PTR [eax], 0
	je	SHORT $L70426
	jmp	$eva_noerr$70416
$L70426:

; 294  : 
; 295  : 	/* Check session termination */
; 296  : 	txt = DYNTAB_FIELD_VAL(&cntxt->sess_data, TERMINATE);

	push	0
	push	-1
	push	OFFSET FLAT:$SG70427
	mov	ecx, DWORD PTR _cntxt$[ebp]
	add	ecx, 29320				; 00007288H
	push	ecx
	call	_dyntab_field_val
	add	esp, 16					; 00000010H
	mov	DWORD PTR _txt$[ebp], eax

; 297  : 	if(*txt)

	mov	edx, DWORD PTR _txt$[ebp]
	movsx	eax, BYTE PTR [edx]
	test	eax, eax
	je	SHORT $L70428

; 299  : 		*errmsg = !strcmp(txt, "10") ? FRAUD_WARNING :
; 300  : 				  !strcmp(txt, "11") ? FRAUD_BLOKMSG :
; 301  : 									  "Cette session est terminée";

	push	OFFSET FLAT:$SG70429
	mov	ecx, DWORD PTR _txt$[ebp]
	push	ecx
	call	_strcmp
	add	esp, 8
	test	eax, eax
	jne	SHORT $L70879
	mov	DWORD PTR -44+[ebp], OFFSET FLAT:$SG70430
	jmp	SHORT $L70880
$L70879:
	push	OFFSET FLAT:$SG70431
	mov	edx, DWORD PTR _txt$[ebp]
	push	edx
	call	_strcmp
	add	esp, 8
	test	eax, eax
	jne	SHORT $L70877
	mov	DWORD PTR -48+[ebp], OFFSET FLAT:$SG70432
	jmp	SHORT $L70878
$L70877:
	mov	DWORD PTR -48+[ebp], OFFSET FLAT:$SG70433
$L70878:
	mov	eax, DWORD PTR -48+[ebp]
	mov	DWORD PTR -44+[ebp], eax
$L70880:
	mov	ecx, DWORD PTR _errmsg$[ebp]
	mov	edx, DWORD PTR -44+[ebp]
	mov	DWORD PTR [ecx], edx

; 302  : 		DYNTAB_FREE(cntxt->session);

	mov	eax, DWORD PTR _cntxt$[ebp]
	add	eax, 29300				; 00007274H
	push	eax
	call	_dyntab_free
	add	esp, 4

; 303  : 		RETURN_OK;

	jmp	$eva_noerr$70416
$L70428:

; 305  : 
; 306  : 	/* Check user IP changes */
; 307  : 	if(cntxt->user_ip && !cntxt->b_noipcheck && strcmp(cntxt->user_ip, DYNTAB_FIELD_VAL(&cntxt->sess_data, USER_IP)))

	mov	ecx, DWORD PTR _cntxt$[ebp]
	cmp	DWORD PTR [ecx+29732], 0
	je	SHORT $L70434
	mov	edx, DWORD PTR _cntxt$[ebp]
	cmp	DWORD PTR [edx+29616], 0
	jne	SHORT $L70434
	push	0
	push	-1
	push	OFFSET FLAT:$SG70435
	mov	eax, DWORD PTR _cntxt$[ebp]
	add	eax, 29320				; 00007288H
	push	eax
	call	_dyntab_field_val
	add	esp, 16					; 00000010H
	push	eax
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	edx, DWORD PTR [ecx+29732]
	push	edx
	call	_strcmp
	add	esp, 8
	test	eax, eax
	je	SHORT $L70434

; 309  : 		*errmsg = "Votre session n'est plus valide (l'adresse IP a changé)";

	mov	eax, DWORD PTR _errmsg$[ebp]
	mov	DWORD PTR [eax], OFFSET FLAT:$SG70436

; 310  : 		DYNTAB_FREE(cntxt->session);

	mov	ecx, DWORD PTR _cntxt$[ebp]
	add	ecx, 29300				; 00007274H
	push	ecx
	call	_dyntab_free
	add	esp, 4

; 311  : 		RETURN_OK;

	jmp	$eva_noerr$70416
$L70434:

; 313  : 
; 314  : 	/* Check maximum duration time */
; 315  : 	txt = DYNTAB_FIELD_VAL(&cntxt->user_data, MAX_SESSION_DURATION);

	push	0
	push	-1
	push	OFFSET FLAT:$SG70437
	mov	edx, DWORD PTR _cntxt$[ebp]
	add	edx, 29428				; 000072f4H
	push	edx
	call	_dyntab_field_val
	add	esp, 16					; 00000010H
	mov	DWORD PTR _txt$[ebp], eax

; 316  : 	if(!*txt) txt = DYNTAB_FIELD_VAL(&cntxt->cnf_data, MAX_SESSION_DURATION);

	mov	eax, DWORD PTR _txt$[ebp]
	movsx	ecx, BYTE PTR [eax]
	test	ecx, ecx
	jne	SHORT $L70438
	push	0
	push	-1
	push	OFFSET FLAT:$SG70439
	mov	edx, DWORD PTR _cntxt$[ebp]
	add	edx, 29360				; 000072b0H
	push	edx
	call	_dyntab_field_val
	add	esp, 16					; 00000010H
	mov	DWORD PTR _txt$[ebp], eax
$L70438:

; 317  : 	if(!*txt) txt = "14400";

	mov	eax, DWORD PTR _txt$[ebp]
	movsx	ecx, BYTE PTR [eax]
	test	ecx, ecx
	jne	SHORT $L70440
	mov	DWORD PTR _txt$[ebp], OFFSET FLAT:$SG70441
$L70440:

; 318  : 	minutes = strtoul(txt, NULL, 10);

	push	10					; 0000000aH
	push	0
	mov	edx, DWORD PTR _txt$[ebp]
	push	edx
	call	_strtoul
	add	esp, 12					; 0000000cH
	mov	DWORD PTR _minutes$[ebp], eax

; 319  : 	if(minutes)

	cmp	DWORD PTR _minutes$[ebp], 0
	je	$L70449

; 321  : 		DynTableCell *c = DYNTAB_FIELD_CELL(&cntxt->sess_data, FORMSTAMP);

	push	0
	push	-1
	push	OFFSET FLAT:$SG70445
	mov	eax, DWORD PTR _cntxt$[ebp]
	add	eax, 29320				; 00007288H
	push	eax
	call	_dyntab_field_cell
	add	esp, 16					; 00000010H
	mov	DWORD PTR _c$70444[ebp], eax

; 322  : 		if(c && qry_get_rec_info(cntxt, &sqlres, c->Pkey, "DateCr")) STACK_ERROR;

	cmp	DWORD PTR _c$70444[ebp], 0
	je	SHORT $L70446
	push	OFFSET FLAT:$SG70447
	mov	ecx, DWORD PTR _c$70444[ebp]
	mov	edx, DWORD PTR [ecx+16]
	push	edx
	lea	eax, DWORD PTR _sqlres$[ebp]
	push	eax
	mov	ecx, DWORD PTR _cntxt$[ebp]
	push	ecx
	call	_qry_get_rec_info
	add	esp, 16					; 00000010H
	test	eax, eax
	je	SHORT $L70446
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 322		; 00000142H
	jmp	$eva_err$70419
$L70446:

; 323  : 		datetxt_to_time(dyntab_val(&sqlres, 0, 0), &t, NULL);

	push	0
	lea	eax, DWORD PTR _t$[ebp]
	push	eax
	push	0
	push	0
	lea	ecx, DWORD PTR _sqlres$[ebp]
	push	ecx
	call	_dyntab_val
	add	esp, 12					; 0000000cH
	push	eax
	call	_datetxt_to_time
	add	esp, 12					; 0000000cH

; 324  : 		if(cntxt->tcur - t > minutes * 60)

	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	eax, DWORD PTR [edx+29720]
	sub	eax, DWORD PTR _t$[ebp]
	mov	ecx, DWORD PTR _minutes$[ebp]
	imul	ecx, 60					; 0000003cH
	cmp	eax, ecx
	jle	SHORT $L70449

; 326  : 			*errmsg = "Votre session n'est plus valide (durée maximum dépassée)";

	mov	edx, DWORD PTR _errmsg$[ebp]
	mov	DWORD PTR [edx], OFFSET FLAT:$SG70450

; 327  : 			DYNTAB_FREE(cntxt->session);

	mov	eax, DWORD PTR _cntxt$[ebp]
	add	eax, 29300				; 00007274H
	push	eax
	call	_dyntab_free
	add	esp, 4

; 328  : 			RETURN_OK;

	jmp	$eva_noerr$70416
$L70449:

; 331  : 
; 332  : 	/* Check inactive time */
; 333  : 	txt = DYNTAB_FIELD_VAL(&cntxt->user_data, MAX_INACTIVE_DURATION);

	push	0
	push	-1
	push	OFFSET FLAT:$SG70451
	mov	ecx, DWORD PTR _cntxt$[ebp]
	add	ecx, 29428				; 000072f4H
	push	ecx
	call	_dyntab_field_val
	add	esp, 16					; 00000010H
	mov	DWORD PTR _txt$[ebp], eax

; 334  : 	if(!*txt) txt = DYNTAB_FIELD_VAL(&cntxt->cnf_data, MAX_INACTIVE_DURATION);

	mov	edx, DWORD PTR _txt$[ebp]
	movsx	eax, BYTE PTR [edx]
	test	eax, eax
	jne	SHORT $L70452
	push	0
	push	-1
	push	OFFSET FLAT:$SG70453
	mov	ecx, DWORD PTR _cntxt$[ebp]
	add	ecx, 29360				; 000072b0H
	push	ecx
	call	_dyntab_field_val
	add	esp, 16					; 00000010H
	mov	DWORD PTR _txt$[ebp], eax
$L70452:

; 335  : 	minutes = strtoul(txt, NULL, 10);

	push	10					; 0000000aH
	push	0
	mov	edx, DWORD PTR _txt$[ebp]
	push	edx
	call	_strtoul
	add	esp, 12					; 0000000cH
	mov	DWORD PTR _minutes$[ebp], eax

; 336  : 	if(minutes && !cntxt->b_login_pwd)

	cmp	DWORD PTR _minutes$[ebp], 0
	je	$L70461
	mov	eax, DWORD PTR _cntxt$[ebp]
	cmp	DWORD PTR [eax+29404], 0
	jne	$L70461

; 338  : 		DynTableCell *c = DYNTAB_FIELD_CELL(&cntxt->sess_data, USER_IP);

	push	0
	push	-1
	push	OFFSET FLAT:$SG70457
	mov	ecx, DWORD PTR _cntxt$[ebp]
	add	ecx, 29320				; 00007288H
	push	ecx
	call	_dyntab_field_cell
	add	esp, 16					; 00000010H
	mov	DWORD PTR _c$70456[ebp], eax

; 339  : 		if(c && qry_get_rec_info(cntxt, &sqlres, c->Pkey, "DateCr")) STACK_ERROR;

	cmp	DWORD PTR _c$70456[ebp], 0
	je	SHORT $L70458
	push	OFFSET FLAT:$SG70459
	mov	edx, DWORD PTR _c$70456[ebp]
	mov	eax, DWORD PTR [edx+16]
	push	eax
	lea	ecx, DWORD PTR _sqlres$[ebp]
	push	ecx
	mov	edx, DWORD PTR _cntxt$[ebp]
	push	edx
	call	_qry_get_rec_info
	add	esp, 16					; 00000010H
	test	eax, eax
	je	SHORT $L70458
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 339		; 00000153H
	jmp	SHORT $eva_err$70419
$L70458:

; 340  : 		datetxt_to_time(dyntab_val(&sqlres, 0, 0), &t, NULL);

	push	0
	lea	ecx, DWORD PTR _t$[ebp]
	push	ecx
	push	0
	push	0
	lea	edx, DWORD PTR _sqlres$[ebp]
	push	edx
	call	_dyntab_val
	add	esp, 12					; 0000000cH
	push	eax
	call	_datetxt_to_time
	add	esp, 12					; 0000000cH

; 341  : 		if(cntxt->tcur - t > minutes * 60)

	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	ecx, DWORD PTR [eax+29720]
	sub	ecx, DWORD PTR _t$[ebp]
	mov	edx, DWORD PTR _minutes$[ebp]
	imul	edx, 60					; 0000003cH
	cmp	ecx, edx
	jle	SHORT $L70461

; 343  : 			*errmsg = "Durée maximum d'inactivité dépassée - identification requise";

	mov	eax, DWORD PTR _errmsg$[ebp]
	mov	DWORD PTR [eax], OFFSET FLAT:$SG70462
$L70461:
$eva_noerr$70416:

; 347  : 
; 348  : 	RETURN_OK_CLEANUP;

	push	0
	push	OFFSET FLAT:$SG70463
	push	OFFSET FLAT:$SG70464
	mov	ecx, DWORD PTR _cntxt$[ebp]
	push	ecx
	call	_err_clear
	add	esp, 16					; 00000010H
$eva_err$70419:
	mov	edx, DWORD PTR _cntxt$[ebp]
	cmp	DWORD PTR [edx+29872], 0
	je	SHORT $L70465
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	ecx, DWORD PTR [eax+29900]
	push	ecx
	push	OFFSET FLAT:$SG70466
	push	OFFSET FLAT:$SG70467
	mov	edx, DWORD PTR _cntxt$[ebp]
	push	edx
	call	_err_add_context
	add	esp, 16					; 00000010H
$L70465:
	lea	eax, DWORD PTR _sqlres$[ebp]
	push	eax
	call	_dyntab_free
	add	esp, 4
	mov	ecx, DWORD PTR _cntxt$[ebp]
	cmp	DWORD PTR [ecx+29300], 0
	jne	SHORT $L70468
	mov	edx, DWORD PTR _cntxt$[ebp]
	add	edx, 29320				; 00007288H
	push	edx
	call	_dyntab_free
	add	esp, 4
$L70468:
	mov	eax, DWORD PTR _cntxt$[ebp]
	xor	ecx, ecx
	cmp	DWORD PTR [eax+29872], 0
	setne	cl
	mov	eax, ecx

; 349  : }

	mov	esp, ebp
	pop	ebp
	ret	0
_ckeck_session_validity ENDP
_TEXT	ENDS
PUBLIC	_check_login_pwd
EXTRN	_cgi_filter_values:NEAR
EXTRN	_cgi_value_setkeep:NEAR
EXTRN	_mem_free:NEAR
EXTRN	_qry_values_list:NEAR
EXTRN	_dynbuf_add:NEAR
EXTRN	_dynbuf_add3_int:NEAR
EXTRN	_dyntab_sz:NEAR
EXTRN	_dyntab_copy:NEAR
EXTRN	_dyntab_cmp:NEAR
_DATA	SEGMENT
	ORG $+1
$SG70488 DB	'_EVA_LOGINSUBMIT', 00H
	ORG $+3
$SG70489 DB	'_EVA_LOGINSUBMITP', 00H
	ORG $+2
$SG70493 DB	'_EVA_LOGINSUBMIT', 00H
	ORG $+3
$SG70500 DB	'_EVA_LOGINSUBMITP', 00H
	ORG $+2
$SG70510 DB	'_EVA_LOGIN', 00H
	ORG $+1
$SG70512 DB	'_EVA_PASSWORD', 00H
	ORG $+2
$SG70514 DB	' AND T1.IdValue IN (', 00H
	ORG $+3
$SG70515 DB	'-- check_login_pwd : search for account', 0aH, 'SELECT D'
	DB	'ISTINCT T1.IdObj FROM TLink AS T1', 0aH, 'INNER JOIN TLink AS'
	DB	' T2 ON T1.IdObj=T2.IdObj ', 0aH, 'WHERE T1.DateDel IS NULL AN'
	DB	'D T1.IdField=', 00H
$SG70517 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70520 DB	' AND T2.IdValue IN (', 00H
	ORG $+3
$SG70521 DB	')', 0aH, 'AND T2.DateDel IS NULL AND T2.IdField=', 00H
	ORG $+3
$SG70523 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70527 DB	')', 00H
	ORG $+2
$SG70529 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70535 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70543 DB	'_EVA_USER', 00H
	ORG $+2
$SG70545 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70552 DB	'UPDATE TLink SET IdRelObj=%lu,DateCr=''%s'',IdWhoCr=%lu '
	DB	'WHERE Pkey=%lu', 00H
	ORG $+3
$SG70556 DB	'_EVA_USER', 00H
	ORG $+2
$SG70559 DB	'Conflit d''identification - contactez l''administrateur', 00H
	ORG $+2
$SG70561 DB	'Identification incorrecte', 00H
	ORG $+2
$SG70562 DB	'D:\Travail\ABI\EVA\V4.0\CGI\Brunix-2016\check_login.c', 00H
	ORG $+2
$SG70563 DB	'check_login_pwd', 00H
$SG70565 DB	'D:\Travail\ABI\EVA\V4.0\CGI\Brunix-2016\check_login.c', 00H
	ORG $+2
$SG70566 DB	'check_login_pwd', 00H
_DATA	ENDS
_TEXT	SEGMENT
_cntxt$ = 8
_errmsg$ = 12
_login$ = -1088
_passwd$ = -1068
_sqlres$ = -1048
_sql$ = -1028
_qry$ = -1024
__i$70494 = -1092
__i$70501 = -1096
_id_login$70509 = -1104
_id_pwd$70511 = -1100
_check_login_pwd PROC NEAR

; 365  : ){

	push	ebp
	mov	ebp, esp
	sub	esp, 1104				; 00000450H

; 366  : 	DynTable login = { 0 };

	mov	DWORD PTR _login$[ebp], 0
	xor	eax, eax
	mov	DWORD PTR _login$[ebp+4], eax
	mov	DWORD PTR _login$[ebp+8], eax
	mov	DWORD PTR _login$[ebp+12], eax
	mov	DWORD PTR _login$[ebp+16], eax

; 367  : 	DynTable passwd = { 0 };

	mov	DWORD PTR _passwd$[ebp], 0
	xor	ecx, ecx
	mov	DWORD PTR _passwd$[ebp+4], ecx
	mov	DWORD PTR _passwd$[ebp+8], ecx
	mov	DWORD PTR _passwd$[ebp+12], ecx
	mov	DWORD PTR _passwd$[ebp+16], ecx

; 368  : 	DynTable sqlres = { 0 };

	mov	DWORD PTR _sqlres$[ebp], 0
	xor	edx, edx
	mov	DWORD PTR _sqlres$[ebp+4], edx
	mov	DWORD PTR _sqlres$[ebp+8], edx
	mov	DWORD PTR _sqlres$[ebp+12], edx
	mov	DWORD PTR _sqlres$[ebp+16], edx

; 369  : 	DynBuffer *sql = NULL;

	mov	DWORD PTR _sql$[ebp], 0

; 370  : 	char qry[1024];
; 371  : 
; 372  : 	/* Read login & password from CGI data */
; 373  : 	if(cgi_filter_values(cntxt, &login, 'D', ~0UL, ~0UL, ~0UL, "_EVA_LOGINSUBMIT", NULL, 0, 0) ||
; 374  : 		cgi_filter_values(cntxt, &passwd, 'D', ~0UL, ~0UL, ~0UL, "_EVA_LOGINSUBMITP", NULL, 0, 0))

	push	0
	push	0
	push	0
	push	OFFSET FLAT:$SG70488
	push	-1
	push	-1
	push	-1
	push	68					; 00000044H
	lea	eax, DWORD PTR _login$[ebp]
	push	eax
	mov	ecx, DWORD PTR _cntxt$[ebp]
	push	ecx
	call	_cgi_filter_values
	add	esp, 40					; 00000028H
	test	eax, eax
	jne	SHORT $L70487
	push	0
	push	0
	push	0
	push	OFFSET FLAT:$SG70489
	push	-1
	push	-1
	push	-1
	push	68					; 00000044H
	lea	edx, DWORD PTR _passwd$[ebp]
	push	edx
	mov	eax, DWORD PTR _cntxt$[ebp]
	push	eax
	call	_cgi_filter_values
	add	esp, 40					; 00000028H
	test	eax, eax
	je	SHORT $L70486
$L70487:

; 375  : 		STACK_ERROR;

	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 375		; 00000177H
	jmp	$eva_err$70490
$L70486:

; 376  : 
; 377  : 	/* Clear all identification CGI data */
; 378  : 	if(cgi_filter_values(cntxt, &sqlres, 0, ~0UL, ~0UL, ~0UL, "_EVA_LOGINSUBMIT", NULL, 0, 0)) STACK_ERROR;

	push	0
	push	0
	push	0
	push	OFFSET FLAT:$SG70493
	push	-1
	push	-1
	push	-1
	push	0
	lea	edx, DWORD PTR _sqlres$[ebp]
	push	edx
	mov	eax, DWORD PTR _cntxt$[ebp]
	push	eax
	call	_cgi_filter_values
	add	esp, 40					; 00000028H
	test	eax, eax
	je	SHORT $L70492
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 378		; 0000017aH
	jmp	$eva_err$70490
$L70492:

; 379  : 	CGI_VALUES_DELETE(&sqlres);

	mov	DWORD PTR __i$70494[ebp], 0
	jmp	SHORT $L70495
$L70496:
	mov	edx, DWORD PTR __i$70494[ebp]
	add	edx, 1
	mov	DWORD PTR __i$70494[ebp], edx
$L70495:
	mov	eax, DWORD PTR __i$70494[ebp]
	cmp	eax, DWORD PTR _sqlres$[ebp]
	jae	SHORT $L70497
	push	2
	mov	ecx, DWORD PTR __i$70494[ebp]
	push	ecx
	lea	edx, DWORD PTR _sqlres$[ebp]
	push	edx
	mov	eax, DWORD PTR _cntxt$[ebp]
	push	eax
	call	_cgi_value_setkeep
	add	esp, 16					; 00000010H
	jmp	SHORT $L70496
$L70497:

; 380  : 	if(cgi_filter_values(cntxt, &sqlres, 0, ~0UL, ~0UL, ~0UL, "_EVA_LOGINSUBMITP", NULL, 0, 0)) STACK_ERROR;

	push	0
	push	0
	push	0
	push	OFFSET FLAT:$SG70500
	push	-1
	push	-1
	push	-1
	push	0
	lea	ecx, DWORD PTR _sqlres$[ebp]
	push	ecx
	mov	edx, DWORD PTR _cntxt$[ebp]
	push	edx
	call	_cgi_filter_values
	add	esp, 40					; 00000028H
	test	eax, eax
	je	SHORT $L70499
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 380		; 0000017cH
	jmp	$eva_err$70490
$L70499:

; 381  : 	CGI_VALUES_DELETE(&sqlres);

	mov	DWORD PTR __i$70501[ebp], 0
	jmp	SHORT $L70502
$L70503:
	mov	ecx, DWORD PTR __i$70501[ebp]
	add	ecx, 1
	mov	DWORD PTR __i$70501[ebp], ecx
$L70502:
	mov	edx, DWORD PTR __i$70501[ebp]
	cmp	edx, DWORD PTR _sqlres$[ebp]
	jae	SHORT $L70504
	push	2
	mov	eax, DWORD PTR __i$70501[ebp]
	push	eax
	lea	ecx, DWORD PTR _sqlres$[ebp]
	push	ecx
	mov	edx, DWORD PTR _cntxt$[ebp]
	push	edx
	call	_cgi_value_setkeep
	add	esp, 16					; 00000010H
	jmp	SHORT $L70503
$L70504:

; 382  : 
; 383  : 	/* Return if no login given */
; 384  : 	*errmsg = NULL;

	mov	eax, DWORD PTR _errmsg$[ebp]
	mov	DWORD PTR [eax], 0

; 385  : 	cntxt->b_login_pwd = 0;

	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29404], 0

; 386  : 	if(!dyntab_sz(&login, 0, 0) || !dyntab_sz(&passwd, 0, 0)) RETURN_OK;

	push	0
	push	0
	lea	edx, DWORD PTR _login$[ebp]
	push	edx
	call	_dyntab_sz
	add	esp, 12					; 0000000cH
	test	eax, eax
	je	SHORT $L70507
	push	0
	push	0
	lea	eax, DWORD PTR _passwd$[ebp]
	push	eax
	call	_dyntab_sz
	add	esp, 12					; 0000000cH
	test	eax, eax
	jne	SHORT $L70506
$L70507:
	jmp	$eva_noerr$70508
$L70506:

; 390  : 		unsigned long id_login = IDVAL("_EVA_LOGIN");

	push	10					; 0000000aH
	push	OFFSET FLAT:$SG70510
	mov	ecx, DWORD PTR _cntxt$[ebp]
	push	ecx
	call	_get_id_value
	add	esp, 12					; 0000000cH
	mov	DWORD PTR _id_login$70509[ebp], eax

; 391  : 		unsigned long id_pwd = IDVAL("_EVA_PASSWORD");

	push	13					; 0000000dH
	push	OFFSET FLAT:$SG70512
	mov	edx, DWORD PTR _cntxt$[ebp]
	push	edx
	call	_get_id_value
	add	esp, 12					; 0000000cH
	mov	DWORD PTR _id_pwd$70511[ebp], eax

; 392  : 		login.nbrows = 1;

	mov	DWORD PTR _login$[ebp], 1

; 393  : 		passwd.nbrows = 1;

	mov	DWORD PTR _passwd$[ebp], 1

; 397  : 					"-- check_login_pwd : search for account\n"
; 398  : 					"SELECT DISTINCT T1.IdObj FROM TLink AS T1\n"
; 399  : 					"INNER JOIN TLink AS T2 ON T1.IdObj=T2.IdObj \n"
; 400  : 					"WHERE T1.DateDel IS NULL AND T1.IdField=" , id_login, " AND T1.IdValue IN (");

	push	20					; 00000014H
	push	OFFSET FLAT:$SG70514
	mov	eax, DWORD PTR _id_login$70509[ebp]
	push	eax
	push	167					; 000000a7H
	push	OFFSET FLAT:$SG70515
	lea	ecx, DWORD PTR _sql$[ebp]
	push	ecx
	call	_dynbuf_add3_int
	add	esp, 24					; 00000018H
	test	eax, eax
	je	SHORT $L70513
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29872], OFFSET FLAT:$SG70517
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 400		; 00000190H
	jmp	$eva_err$70490
$L70513:

; 401  : 		if(qry_values_list(cntxt, &login, 1, &sql)) STACK_ERROR;

	lea	ecx, DWORD PTR _sql$[ebp]
	push	ecx
	push	1
	lea	edx, DWORD PTR _login$[ebp]
	push	edx
	mov	eax, DWORD PTR _cntxt$[ebp]
	push	eax
	call	_qry_values_list
	add	esp, 16					; 00000010H
	test	eax, eax
	je	SHORT $L70518
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 401		; 00000191H
	jmp	$eva_err$70490
$L70518:

; 403  : 					")\n"
; 404  : 					"AND T2.DateDel IS NULL AND T2.IdField=", id_pwd, " AND T2.IdValue IN (");

	push	20					; 00000014H
	push	OFFSET FLAT:$SG70520
	mov	edx, DWORD PTR _id_pwd$70511[ebp]
	push	edx
	push	40					; 00000028H
	push	OFFSET FLAT:$SG70521
	lea	eax, DWORD PTR _sql$[ebp]
	push	eax
	call	_dynbuf_add3_int
	add	esp, 24					; 00000018H
	test	eax, eax
	je	SHORT $L70519
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29872], OFFSET FLAT:$SG70523
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 404		; 00000194H
	jmp	$eva_err$70490
$L70519:

; 405  : 		if(qry_values_list(cntxt, &passwd, 1, &sql)) STACK_ERROR;

	lea	eax, DWORD PTR _sql$[ebp]
	push	eax
	push	1
	lea	ecx, DWORD PTR _passwd$[ebp]
	push	ecx
	mov	edx, DWORD PTR _cntxt$[ebp]
	push	edx
	call	_qry_values_list
	add	esp, 16					; 00000010H
	test	eax, eax
	je	SHORT $L70524
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 405		; 00000195H
	jmp	$eva_err$70490
$L70524:

; 406  : 		DYNBUF_ADD_STR(&sql, ")");

	push	0
	push	0
	push	1
	push	OFFSET FLAT:$SG70527
	lea	ecx, DWORD PTR _sql$[ebp]
	push	ecx
	call	_dynbuf_add
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L70526
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29872], OFFSET FLAT:$SG70529
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 406		; 00000196H
	jmp	$eva_err$70490
$L70526:

; 407  : 		if(sql_exec_query(cntxt, sql->data) || sql_get_table(cntxt, &sqlres, 2)) STACK_ERROR;

	mov	ecx, DWORD PTR _sql$[ebp]
	add	ecx, 8
	push	ecx
	mov	edx, DWORD PTR _cntxt$[ebp]
	push	edx
	call	_sql_exec_query
	add	esp, 8
	test	eax, eax
	jne	SHORT $L70531
	push	2
	lea	eax, DWORD PTR _sqlres$[ebp]
	push	eax
	mov	ecx, DWORD PTR _cntxt$[ebp]
	push	ecx
	call	_sql_get_table
	add	esp, 12					; 0000000cH
	test	eax, eax
	je	SHORT $L70530
$L70531:
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 407		; 00000197H
	jmp	$eva_err$70490
$L70530:

; 408  : 		M_FREE(sql);

	mov	eax, DWORD PTR _sql$[ebp]
	push	eax
	call	_mem_free
	add	esp, 4
	mov	DWORD PTR _sql$[ebp], 0

; 409  : 
; 410  : 		/* If user identification ok */
; 411  : 		if(sqlres.nbrows == 1)

	cmp	DWORD PTR _sqlres$[ebp], 1
	jne	$L70532

; 413  : 			/* Set id_user & load user data */
; 414  : 			DYNTAB_ADD_CELL(&cntxt->id_user, 0, 0, &sqlres, 0, 0);

	push	1
	push	0
	push	0
	lea	ecx, DWORD PTR _sqlres$[ebp]
	push	ecx
	call	_dyntab_cell
	add	esp, 12					; 0000000cH
	push	eax
	push	0
	push	0
	mov	edx, DWORD PTR _cntxt$[ebp]
	add	edx, 29408				; 000072e0H
	push	edx
	call	_dyntab_copy
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L70533
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29872], OFFSET FLAT:$SG70535
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 414		; 0000019eH
	jmp	$eva_err$70490
$L70533:

; 415  : 			if(qry_obj_data(cntxt, &cntxt->user_data, &cntxt->id_user, NULL)) STACK_ERROR;

	push	0
	mov	edx, DWORD PTR _cntxt$[ebp]
	add	edx, 29408				; 000072e0H
	push	edx
	mov	eax, DWORD PTR _cntxt$[ebp]
	add	eax, 29428				; 000072f4H
	push	eax
	mov	ecx, DWORD PTR _cntxt$[ebp]
	push	ecx
	call	_qry_obj_data
	add	esp, 16					; 00000010H
	test	eax, eax
	je	SHORT $L70537
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 415		; 0000019fH
	jmp	$eva_err$70490
$L70537:

; 416  : 
; 417  : 			/* Check account validity */
; 418  : 			if(ckeck_user_validity(cntxt, errmsg)) STACK_ERROR;

	mov	eax, DWORD PTR _errmsg$[ebp]
	push	eax
	mov	ecx, DWORD PTR _cntxt$[ebp]
	push	ecx
	call	_ckeck_user_validity
	add	esp, 8
	test	eax, eax
	je	SHORT $L70538
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 418		; 000001a2H
	jmp	$eva_err$70490
$L70538:

; 419  : 			if(*errmsg) RETURN_OK;

	mov	eax, DWORD PTR _errmsg$[ebp]
	cmp	DWORD PTR [eax], 0
	je	SHORT $L70539
	jmp	$eva_noerr$70508
$L70539:

; 420  : 			cntxt->b_login_pwd = 1;

	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29404], 1

; 421  : 
; 422  : 			/* End current session if user was identified & different */
; 423  : 			DYNTAB_FREE(login);

	lea	edx, DWORD PTR _login$[ebp]
	push	edx
	call	_dyntab_free
	add	esp, 4

; 424  : 			if(cntxt->session.nbrows)

	mov	eax, DWORD PTR _cntxt$[ebp]
	cmp	DWORD PTR [eax+29300], 0
	je	$L70555

; 426  : 				DYNTAB_FIELD(&login, &cntxt->sess_data, USER);

	lea	ecx, DWORD PTR _login$[ebp]
	push	ecx
	call	_dyntab_free
	add	esp, 4
	push	0
	push	-1
	push	OFFSET FLAT:$SG70543
	mov	edx, DWORD PTR _cntxt$[ebp]
	add	edx, 29320				; 00007288H
	push	edx
	push	0
	lea	eax, DWORD PTR _login$[ebp]
	push	eax
	call	_dyntab_filter_field
	add	esp, 24					; 00000018H
	test	eax, eax
	je	SHORT $L70542
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29872], OFFSET FLAT:$SG70545
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 426		; 000001aaH
	jmp	$eva_err$70490
$L70542:

; 427  : 				if(login.nbrows &&
; 428  : 					DYNTAB_TOUL(&login) != cntxt->id_public &&
; 429  : 					dyntab_cmp(&login, 0, 0, &cntxt->id_user, 0, 0))

	cmp	DWORD PTR _login$[ebp], 0
	je	SHORT $L70547
	push	10					; 0000000aH
	push	0
	push	0
	push	0
	lea	eax, DWORD PTR _login$[ebp]
	push	eax
	call	_dyntab_val
	add	esp, 12					; 0000000cH
	push	eax
	call	_strtoul
	add	esp, 12					; 0000000cH
	mov	ecx, DWORD PTR _cntxt$[ebp]
	cmp	eax, DWORD PTR [ecx+29640]
	je	SHORT $L70547
	push	0
	push	0
	mov	edx, DWORD PTR _cntxt$[ebp]
	add	edx, 29408				; 000072e0H
	push	edx
	push	0
	push	0
	lea	eax, DWORD PTR _login$[ebp]
	push	eax
	call	_dyntab_cmp
	add	esp, 24					; 00000018H
	test	eax, eax
	je	SHORT $L70547

; 431  : 					DYNTAB_FREE(cntxt->session);

	mov	ecx, DWORD PTR _cntxt$[ebp]
	add	ecx, 29300				; 00007274H
	push	ecx
	call	_dyntab_free
	add	esp, 4

; 433  : 				else

	jmp	$L70555
$L70547:

; 435  : 					/* User has identified : update in session */
; 436  : 					if(login.nbrows)

	cmp	DWORD PTR _login$[ebp], 0
	je	$L70549

; 438  : 						snprintf(add_sz_str(qry), "UPDATE TLink SET IdRelObj=%lu,DateCr='%s',IdWhoCr=%lu WHERE Pkey=%lu",
; 439  : 														DYNTAB_TOUL(&cntxt->id_user), cntxt->timestamp,
; 440  : 														DYNTAB_TOUL(&cntxt->id_user), login.cell->Pkey);

	mov	edx, DWORD PTR _login$[ebp+16]
	mov	eax, DWORD PTR [edx+16]
	push	eax
	push	10					; 0000000aH
	push	0
	push	0
	push	0
	mov	ecx, DWORD PTR _cntxt$[ebp]
	add	ecx, 29408				; 000072e0H
	push	ecx
	call	_dyntab_val
	add	esp, 12					; 0000000cH
	push	eax
	call	_strtoul
	add	esp, 12					; 0000000cH
	push	eax
	mov	edx, DWORD PTR _cntxt$[ebp]
	add	edx, 29704				; 00007408H
	push	edx
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
	push	OFFSET FLAT:$SG70552
	push	1023					; 000003ffH
	lea	ecx, DWORD PTR _qry$[ebp]
	push	ecx
	call	__snprintf
	add	esp, 28					; 0000001cH

; 441  : 						if(sql_exec_query(cntxt, qry)) STACK_ERROR;

	lea	edx, DWORD PTR _qry$[ebp]
	push	edx
	mov	eax, DWORD PTR _cntxt$[ebp]
	push	eax
	call	_sql_exec_query
	add	esp, 8
	test	eax, eax
	je	SHORT $L70553
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 441		; 000001b9H
	jmp	$eva_err$70490
$L70553:

; 443  : 					else

	jmp	SHORT $L70555
$L70549:

; 444  : 						if(qry_add_obj_field_val(cntxt, &cntxt->session, "_EVA_USER", DYNTAB_VAL_SZ(&cntxt->id_user, 0, 0), 1, 1)) STACK_ERROR;

	push	1
	push	1
	push	0
	push	0
	mov	edx, DWORD PTR _cntxt$[ebp]
	add	edx, 29408				; 000072e0H
	push	edx
	call	_dyntab_sz
	add	esp, 12					; 0000000cH
	push	eax
	push	0
	push	0
	mov	eax, DWORD PTR _cntxt$[ebp]
	add	eax, 29408				; 000072e0H
	push	eax
	call	_dyntab_val
	add	esp, 12					; 0000000cH
	push	eax
	push	OFFSET FLAT:$SG70556
	mov	ecx, DWORD PTR _cntxt$[ebp]
	add	ecx, 29300				; 00007274H
	push	ecx
	mov	edx, DWORD PTR _cntxt$[ebp]
	push	edx
	call	_qry_add_obj_field_val
	add	esp, 28					; 0000001cH
	test	eax, eax
	je	SHORT $L70555
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 444		; 000001bcH
	jmp	SHORT $eva_err$70490
$L70555:

; 448  : 		else if(sqlres.nbrows)

	jmp	SHORT $L70560
$L70532:
	cmp	DWORD PTR _sqlres$[ebp], 0
	je	SHORT $L70558

; 450  : 			/* Duplicate credentials : return message */
; 451  : 			*errmsg = "Conflit d'identification - contactez l'administrateur";

	mov	ecx, DWORD PTR _errmsg$[ebp]
	mov	DWORD PTR [ecx], OFFSET FLAT:$SG70559

; 453  : 		else

	jmp	SHORT $L70560
$L70558:

; 455  : 			/* Unknown credentials : return message */
; 456  : 			*errmsg = "Identification incorrecte";

	mov	edx, DWORD PTR _errmsg$[ebp]
	mov	DWORD PTR [edx], OFFSET FLAT:$SG70561
$L70560:
$eva_noerr$70508:

; 459  : 
; 460  : 	RETURN_OK_CLEANUP;

	push	0
	push	OFFSET FLAT:$SG70562
	push	OFFSET FLAT:$SG70563
	mov	eax, DWORD PTR _cntxt$[ebp]
	push	eax
	call	_err_clear
	add	esp, 16					; 00000010H
$eva_err$70490:
	mov	ecx, DWORD PTR _cntxt$[ebp]
	cmp	DWORD PTR [ecx+29872], 0
	je	SHORT $L70564
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	eax, DWORD PTR [edx+29900]
	push	eax
	push	OFFSET FLAT:$SG70565
	push	OFFSET FLAT:$SG70566
	mov	ecx, DWORD PTR _cntxt$[ebp]
	push	ecx
	call	_err_add_context
	add	esp, 16					; 00000010H
$L70564:
	lea	edx, DWORD PTR _login$[ebp]
	push	edx
	call	_dyntab_free
	add	esp, 4
	lea	eax, DWORD PTR _passwd$[ebp]
	push	eax
	call	_dyntab_free
	add	esp, 4
	lea	ecx, DWORD PTR _sqlres$[ebp]
	push	ecx
	call	_dyntab_free
	add	esp, 4
	mov	edx, DWORD PTR _sql$[ebp]
	push	edx
	call	_mem_free
	add	esp, 4
	mov	DWORD PTR _sql$[ebp], 0
	mov	eax, DWORD PTR _cntxt$[ebp]
	xor	ecx, ecx
	cmp	DWORD PTR [eax+29872], 0
	setne	cl
	mov	eax, ecx

; 461  : }

	mov	esp, ebp
	pop	ebp
	ret	0
_check_login_pwd ENDP
_TEXT	ENDS
PUBLIC	_check_user_identification
EXTRN	_atoi:NEAR
EXTRN	_qry_obj_field:NEAR
EXTRN	_dyntab_set_txt:NEAR
EXTRN	_dyntab_order_lines:NEAR
_BSS	SEGMENT
$SG70639 DB	01H DUP (?)
_BSS	ENDS
_DATA	SEGMENT
$SG70582 DB	'B$#NO_IDENT', 00H
$SG70591 DB	'_EVA_WKS', 00H
	ORG $+3
$SG70592 DB	'-- check_login : Retrieve last session for workstation', 0aH
	DB	'SELECT MAX(IdObj) FROM TLink WHERE', 09H, 'IdRelObj=%lu AND I'
	DB	'dField=%lu', 00H
	ORG $+1
$SG70599 DB	'_EVA_USER_IP', 00H
	ORG $+3
$SG70600 DB	'-- check_login : Retrieve last session for workstation', 0aH
	DB	'SELECT MAX(IdObj) FROM TLink WHERE', 09H, 'IdValue=%lu AND Id'
	DB	'Field=%lu', 00H
	ORG $+2
$SG70605 DB	'_EVA_WKS', 00H
	ORG $+3
$SG70612 DB	'_EVA_AUTO_IDENT', 00H
$SG70614 DB	'_EVA_AUTO_IDENT', 00H
$SG70620 DB	'_EVA_USER_IDENT_WKS', 00H
$SG70622 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70633 DB	'Confirmer l''identification m', 0e9H, 'moris', 0e9H, 'e', 00H
	ORG $+3
$SG70634 DB	'_EVA_USERNAME', 00H
	ORG $+2
$SG70635 DB	'<b>Si vous ', 0eaH, 'tes <u>%s</u></b><br><br><input typ'
	DB	'e=submit name=B$#AUTO_IDENT value=''Cliquez ici''><br><br><hr'
	DB	'>', 00H
$SG70636 DB	'Vous pouvez vous identifier sous un autre nom', 00H
	ORG $+2
$SG70637 DB	'_EVA_USERNAME', 00H
	ORG $+2
$SG70638 DB	'<hr><br><b>Vous pouvez aussi continuer en <u>%s</u></b><'
	DB	'br><input type=submit name=B$#NO_IDENT value=''Mode non ident'
	DB	'ifi', 0e9H, '''><br><br><hr>', 00H
	ORG $+1
$SG70644 DB	'_EVA_ADMINISTRATOR', 00H
	ORG $+1
$SG70646 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70653 DB	'EMAIL', 00H
	ORG $+2
$SG70656 DB	'eva@abing.fr', 00H
	ORG $+3
$SG70658 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70659 DB	'D:\Travail\ABI\EVA\V4.0\CGI\Brunix-2016\check_login.c', 00H
	ORG $+2
$SG70660 DB	'check_user_identification', 00H
	ORG $+2
$SG70662 DB	'D:\Travail\ABI\EVA\V4.0\CGI\Brunix-2016\check_login.c', 00H
	ORG $+2
$SG70663 DB	'check_user_identification', 00H
_DATA	ENDS
_TEXT	SEGMENT
_cntxt$ = 8
_errmsg$ = 12
_sqlres$ = -1044
_qry$ = -1024
_id_ip$70597 = -1048
_auto_cnf$70611 = -1060
_auto_user$70613 = -1056
_b_ok$70615 = -1052
_i$70624 = -1064
_i$70641 = -1068
_check_user_identification PROC NEAR

; 474  : ){

	push	ebp
	mov	ebp, esp
	sub	esp, 1072				; 00000430H

; 475  : 	DynTable sqlres = { 0 };

	mov	DWORD PTR _sqlres$[ebp], 0
	xor	eax, eax
	mov	DWORD PTR _sqlres$[ebp+4], eax
	mov	DWORD PTR _sqlres$[ebp+8], eax
	mov	DWORD PTR _sqlres$[ebp+12], eax
	mov	DWORD PTR _sqlres$[ebp+16], eax

; 476  : 	char qry[1024];
; 477  : 
; 478  : 	/* Handle workstation Id */
; 479  : 	if(handle_workstation_id(cntxt)) STACK_ERROR;

	mov	ecx, DWORD PTR _cntxt$[ebp]
	push	ecx
	call	_handle_workstation_id
	add	esp, 4
	test	eax, eax
	je	SHORT $L70578
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 479		; 000001dfH
	jmp	$eva_err$70579
$L70578:

; 480  : 
; 481  : 	/* Handle No identification button */
; 482  : 	*errmsg = NULL;

	mov	eax, DWORD PTR _errmsg$[ebp]
	mov	DWORD PTR [eax], 0

; 483  : 	if(cntxt->cgi && cntxt->cgi[cntxt->cgibtn].name && !strcmp(cntxt->cgi[cntxt->cgibtn].name, "B$#NO_IDENT"))

	mov	ecx, DWORD PTR _cntxt$[ebp]
	cmp	DWORD PTR [ecx+29648], 0
	je	$L70581
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	eax, DWORD PTR [edx+29656]
	imul	eax, 56					; 00000038H
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	edx, DWORD PTR [ecx+29648]
	cmp	DWORD PTR [edx+eax], 0
	je	SHORT $L70581
	push	OFFSET FLAT:$SG70582
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	ecx, DWORD PTR [eax+29656]
	imul	ecx, 56					; 00000038H
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	eax, DWORD PTR [edx+29648]
	mov	ecx, DWORD PTR [eax+ecx]
	push	ecx
	call	_strcmp
	add	esp, 8
	test	eax, eax
	jne	SHORT $L70581

; 485  : 		check_login_pwd(cntxt, errmsg);

	mov	edx, DWORD PTR _errmsg$[ebp]
	push	edx
	mov	eax, DWORD PTR _cntxt$[ebp]
	push	eax
	call	_check_login_pwd
	add	esp, 8

; 486  : 		*errmsg = NULL;

	mov	ecx, DWORD PTR _errmsg$[ebp]
	mov	DWORD PTR [ecx], 0

; 487  : 		DYNTAB_FREE(cntxt->id_user);

	mov	edx, DWORD PTR _cntxt$[ebp]
	add	edx, 29408				; 000072e0H
	push	edx
	call	_dyntab_free
	add	esp, 4

; 488  : 		DYNTAB_FREE(cntxt->session);

	mov	eax, DWORD PTR _cntxt$[ebp]
	add	eax, 29300				; 00007274H
	push	eax
	call	_dyntab_free
	add	esp, 4

; 489  : 		RETURN_OK;

	jmp	$eva_noerr$70584
$L70581:

; 491  : 
; 492  : 	/* Check session validity */
; 493  : 	if(ckeck_session_validity(cntxt, errmsg)) STACK_ERROR;

	mov	ecx, DWORD PTR _errmsg$[ebp]
	push	ecx
	mov	edx, DWORD PTR _cntxt$[ebp]
	push	edx
	call	_ckeck_session_validity
	add	esp, 8
	test	eax, eax
	je	SHORT $L70585
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 493		; 000001edH
	jmp	$eva_err$70579
$L70585:

; 494  : 	if(*errmsg) RETURN_OK;

	mov	ecx, DWORD PTR _errmsg$[ebp]
	cmp	DWORD PTR [ecx], 0
	je	SHORT $L70586
	jmp	$eva_noerr$70584
$L70586:

; 495  : 
; 496  : 	/* Handle user login */
; 497  : 	if(check_login_pwd(cntxt, errmsg)) STACK_ERROR;

	mov	edx, DWORD PTR _errmsg$[ebp]
	push	edx
	mov	eax, DWORD PTR _cntxt$[ebp]
	push	eax
	call	_check_login_pwd
	add	esp, 8
	test	eax, eax
	je	SHORT $L70587
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 497		; 000001f1H
	jmp	$eva_err$70579
$L70587:

; 498  : 	if(*errmsg) RETURN_OK;

	mov	edx, DWORD PTR _errmsg$[ebp]
	cmp	DWORD PTR [edx], 0
	je	SHORT $L70588
	jmp	$eva_noerr$70584
$L70588:

; 499  : 
; 500  : 	/* Handle automatic identification if no session or user given */
; 501  : 	if(!cntxt->session.nbrows && !cntxt->id_user.nbrows)

	mov	eax, DWORD PTR _cntxt$[ebp]
	cmp	DWORD PTR [eax+29300], 0
	jne	$L70640
	mov	ecx, DWORD PTR _cntxt$[ebp]
	cmp	DWORD PTR [ecx+29408], 0
	jne	$L70640

; 503  : 		/* Retrieve last session for workstation if present */
; 504  : 		if(cntxt->objwks)

	mov	edx, DWORD PTR _cntxt$[ebp]
	cmp	DWORD PTR [edx+29828], 0
	je	$L70590

; 506  : 			snprintf(add_sz_str(qry),
; 507  : 				"-- check_login : Retrieve last session for workstation\n"
; 508  : 				"SELECT MAX(IdObj) FROM TLink WHERE	IdRelObj=%lu AND IdField=%lu",
; 509  : 				cntxt->objwks, IDVAL("_EVA_WKS"));

	push	8
	push	OFFSET FLAT:$SG70591
	mov	eax, DWORD PTR _cntxt$[ebp]
	push	eax
	call	_get_id_value
	add	esp, 12					; 0000000cH
	push	eax
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	edx, DWORD PTR [ecx+29828]
	push	edx
	push	OFFSET FLAT:$SG70592
	push	1023					; 000003ffH
	lea	eax, DWORD PTR _qry$[ebp]
	push	eax
	call	__snprintf
	add	esp, 20					; 00000014H

; 510  : 			if(sql_exec_query(cntxt, qry) ||
; 511  : 				sql_get_table(cntxt, &cntxt->session, 2)) STACK_ERROR;

	lea	ecx, DWORD PTR _qry$[ebp]
	push	ecx
	mov	edx, DWORD PTR _cntxt$[ebp]
	push	edx
	call	_sql_exec_query
	add	esp, 8
	test	eax, eax
	jne	SHORT $L70594
	push	2
	mov	eax, DWORD PTR _cntxt$[ebp]
	add	eax, 29300				; 00007274H
	push	eax
	mov	ecx, DWORD PTR _cntxt$[ebp]
	push	ecx
	call	_sql_get_table
	add	esp, 12					; 0000000cH
	test	eax, eax
	je	SHORT $L70593
$L70594:
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 511		; 000001ffH
	jmp	$eva_err$70579
$L70593:

; 513  : 		else if(cntxt->user_ip)

	jmp	$L70606
$L70590:
	mov	eax, DWORD PTR _cntxt$[ebp]
	cmp	DWORD PTR [eax+29732], 0
	je	$L70606

; 516  : 			unsigned long id_ip = get_id_value(cntxt, cntxt->user_ip, strlen(cntxt->user_ip));

	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	edx, DWORD PTR [ecx+29732]
	push	edx
	call	_strlen
	add	esp, 4
	push	eax
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	ecx, DWORD PTR [eax+29732]
	push	ecx
	mov	edx, DWORD PTR _cntxt$[ebp]
	push	edx
	call	_get_id_value
	add	esp, 12					; 0000000cH
	mov	DWORD PTR _id_ip$70597[ebp], eax

; 517  : 			if(id_ip)

	cmp	DWORD PTR _id_ip$70597[ebp], 0
	je	$L70606

; 519  : 				snprintf(add_sz_str(qry),
; 520  : 					"-- check_login : Retrieve last session for workstation\n"
; 521  : 					"SELECT MAX(IdObj) FROM TLink WHERE	IdValue=%lu AND IdField=%lu",
; 522  : 					id_ip, IDVAL("_EVA_USER_IP"));

	push	12					; 0000000cH
	push	OFFSET FLAT:$SG70599
	mov	eax, DWORD PTR _cntxt$[ebp]
	push	eax
	call	_get_id_value
	add	esp, 12					; 0000000cH
	push	eax
	mov	ecx, DWORD PTR _id_ip$70597[ebp]
	push	ecx
	push	OFFSET FLAT:$SG70600
	push	1023					; 000003ffH
	lea	edx, DWORD PTR _qry$[ebp]
	push	edx
	call	__snprintf
	add	esp, 20					; 00000014H

; 523  : 				if(sql_exec_query(cntxt, qry) ||
; 524  : 					sql_get_table(cntxt, &cntxt->session, 2)) STACK_ERROR;

	lea	eax, DWORD PTR _qry$[ebp]
	push	eax
	mov	ecx, DWORD PTR _cntxt$[ebp]
	push	ecx
	call	_sql_exec_query
	add	esp, 8
	test	eax, eax
	jne	SHORT $L70602
	push	2
	mov	edx, DWORD PTR _cntxt$[ebp]
	add	edx, 29300				; 00007274H
	push	edx
	mov	eax, DWORD PTR _cntxt$[ebp]
	push	eax
	call	_sql_get_table
	add	esp, 12					; 0000000cH
	test	eax, eax
	je	SHORT $L70601
$L70602:
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 524		; 0000020cH
	jmp	$eva_err$70579
$L70601:

; 525  : 
; 526  : 				/* Ignore same IP if workstation present */
; 527  : 				if(qry_obj_field(cntxt, &cntxt->sess_data, DYNTAB_TOUL(&cntxt->session), "_EVA_WKS")) STACK_ERROR;

	push	OFFSET FLAT:$SG70605
	push	10					; 0000000aH
	push	0
	push	0
	push	0
	mov	edx, DWORD PTR _cntxt$[ebp]
	add	edx, 29300				; 00007274H
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
	call	_qry_obj_field
	add	esp, 16					; 00000010H
	test	eax, eax
	je	SHORT $L70604
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 527		; 0000020fH
	jmp	$eva_err$70579
$L70604:

; 528  : 				if(cntxt->sess_data.nbrows)

	mov	eax, DWORD PTR _cntxt$[ebp]
	cmp	DWORD PTR [eax+29320], 0
	je	SHORT $L70606

; 530  : 					DYNTAB_FREE(cntxt->sess_data);

	mov	ecx, DWORD PTR _cntxt$[ebp]
	add	ecx, 29320				; 00007288H
	push	ecx
	call	_dyntab_free
	add	esp, 4

; 531  : 					DYNTAB_FREE(cntxt->session);

	mov	edx, DWORD PTR _cntxt$[ebp]
	add	edx, 29300				; 00007274H
	push	edx
	call	_dyntab_free
	add	esp, 4
$L70606:

; 535  : 
; 536  : 		/* Check session validity */
; 537  : 		if(ckeck_session_validity(cntxt, errmsg)) STACK_ERROR;

	mov	eax, DWORD PTR _errmsg$[ebp]
	push	eax
	mov	ecx, DWORD PTR _cntxt$[ebp]
	push	ecx
	call	_ckeck_session_validity
	add	esp, 8
	test	eax, eax
	je	SHORT $L70607
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 537		; 00000219H
	jmp	$eva_err$70579
$L70607:

; 538  : 		if(*errmsg) DYNTAB_FREE(cntxt->session);

	mov	eax, DWORD PTR _errmsg$[ebp]
	cmp	DWORD PTR [eax], 0
	je	SHORT $L70608
	mov	ecx, DWORD PTR _cntxt$[ebp]
	add	ecx, 29300				; 00007274H
	push	ecx
	call	_dyntab_free
	add	esp, 4
$L70608:

; 539  : 		*errmsg = NULL;

	mov	edx, DWORD PTR _errmsg$[ebp]
	mov	DWORD PTR [edx], 0

; 540  : 
; 541  : 		/* Check automatic session reconnection validity */
; 542  : 		if(cntxt->session.nbrows)

	mov	eax, DWORD PTR _cntxt$[ebp]
	cmp	DWORD PTR [eax+29300], 0
	je	$L70632

; 544  : 			/* Ckeck automatic identification is allowed */
; 545  : 			int auto_cnf = atoi(DYNTAB_FIELD_VAL(&cntxt->cnf_data, AUTO_IDENT));

	push	0
	push	-1
	push	OFFSET FLAT:$SG70612
	mov	ecx, DWORD PTR _cntxt$[ebp]
	add	ecx, 29360				; 000072b0H
	push	ecx
	call	_dyntab_field_val
	add	esp, 16					; 00000010H
	push	eax
	call	_atoi
	add	esp, 4
	mov	DWORD PTR _auto_cnf$70611[ebp], eax

; 546  : 			int auto_user = atoi(DYNTAB_FIELD_VAL(&cntxt->user_data, AUTO_IDENT));

	push	0
	push	-1
	push	OFFSET FLAT:$SG70614
	mov	edx, DWORD PTR _cntxt$[ebp]
	add	edx, 29428				; 000072f4H
	push	edx
	call	_dyntab_field_val
	add	esp, 16					; 00000010H
	push	eax
	call	_atoi
	add	esp, 4
	mov	DWORD PTR _auto_user$70613[ebp], eax

; 547  : 			int b_ok = auto_cnf == 2 ? (auto_user != -1) : auto_user > 0;

	cmp	DWORD PTR _auto_cnf$70611[ebp], 2
	jne	SHORT $L70883
	xor	eax, eax
	cmp	DWORD PTR _auto_user$70613[ebp], -1
	setne	al
	mov	DWORD PTR -1072+[ebp], eax
	jmp	SHORT $L70884
$L70883:
	xor	ecx, ecx
	cmp	DWORD PTR _auto_user$70613[ebp], 0
	setg	cl
	mov	DWORD PTR -1072+[ebp], ecx
$L70884:
	mov	edx, DWORD PTR -1072+[ebp]
	mov	DWORD PTR _b_ok$70615[ebp], edx

; 548  : 			if(b_ok)

	cmp	DWORD PTR _b_ok$70615[ebp], 0
	je	$L70627

; 550  : 				/* Check auto ident allowed for this workstation in user account */
; 551  : 				DYNTAB_FIELD_TAB(&sqlres, &cntxt->user_data, USER_IDENT_WKS);

	lea	eax, DWORD PTR _sqlres$[ebp]
	push	eax
	call	_dyntab_free
	add	esp, 4
	push	0
	push	-1
	push	OFFSET FLAT:$SG70620
	mov	ecx, DWORD PTR _cntxt$[ebp]
	add	ecx, 29428				; 000072f4H
	push	ecx
	push	0
	lea	edx, DWORD PTR _sqlres$[ebp]
	push	edx
	call	_dyntab_filter_field
	add	esp, 24					; 00000018H
	test	eax, eax
	jne	SHORT $L70619
	lea	eax, DWORD PTR _sqlres$[ebp]
	push	eax
	call	_dyntab_order_lines
	add	esp, 4
	test	eax, eax
	je	SHORT $L70618
$L70619:
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29872], OFFSET FLAT:$SG70622
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 551		; 00000227H
	jmp	$eva_err$70579
$L70618:

; 552  : 				if(sqlres.nbrows)

	cmp	DWORD PTR _sqlres$[ebp], 0
	je	SHORT $L70627

; 554  : 					unsigned long i;
; 555  : 					for(b_ok = 0, i = 0; i < sqlres.nbrows && !b_ok; i++)

	mov	DWORD PTR _b_ok$70615[ebp], 0
	mov	DWORD PTR _i$70624[ebp], 0
	jmp	SHORT $L70625
$L70626:
	mov	eax, DWORD PTR _i$70624[ebp]
	add	eax, 1
	mov	DWORD PTR _i$70624[ebp], eax
$L70625:
	mov	ecx, DWORD PTR _i$70624[ebp]
	cmp	ecx, DWORD PTR _sqlres$[ebp]
	jae	SHORT $L70627
	cmp	DWORD PTR _b_ok$70615[ebp], 0
	jne	SHORT $L70627

; 556  : 						b_ok = DYNTAB_TOULRC(&sqlres, i, 0) == cntxt->objwks;

	push	10					; 0000000aH
	push	0
	push	0
	mov	edx, DWORD PTR _i$70624[ebp]
	push	edx
	lea	eax, DWORD PTR _sqlres$[ebp]
	push	eax
	call	_dyntab_val
	add	esp, 12					; 0000000cH
	push	eax
	call	_strtoul
	add	esp, 12					; 0000000cH
	mov	ecx, DWORD PTR _cntxt$[ebp]
	xor	edx, edx
	cmp	eax, DWORD PTR [ecx+29828]
	sete	dl
	mov	DWORD PTR _b_ok$70615[ebp], edx
	jmp	SHORT $L70626
$L70627:

; 559  : 
; 560  : 			/* Cancel session reconnection if not valid */
; 561  : 			if(!b_ok)

	cmp	DWORD PTR _b_ok$70615[ebp], 0
	jne	SHORT $L70629

; 563  : 				DYNTAB_FREE(cntxt->session);

	mov	eax, DWORD PTR _cntxt$[ebp]
	add	eax, 29300				; 00007274H
	push	eax
	call	_dyntab_free
	add	esp, 4

; 565  : 
; 566  : 			/* Else : ask for confirmation if user identified */
; 567  : 			else if(cntxt->id_user.nbrows && DYNTAB_TOUL(&cntxt->id_user) != cntxt->id_public && auto_user != 2)

	jmp	$L70632
$L70629:
	mov	ecx, DWORD PTR _cntxt$[ebp]
	cmp	DWORD PTR [ecx+29408], 0
	je	$L70632
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
	mov	ecx, DWORD PTR _cntxt$[ebp]
	cmp	eax, DWORD PTR [ecx+29640]
	je	$L70632
	cmp	DWORD PTR _auto_user$70613[ebp], 2
	je	$L70632

; 569  : 				/* Output confirm button for auto identification */
; 570  : 				output_message(cntxt, "Confirmer l'identification mémorisée");

	push	OFFSET FLAT:$SG70633
	mov	edx, DWORD PTR _cntxt$[ebp]
	push	edx
	call	_output_message
	add	esp, 8

; 571  : 				cntxt->txsize += printf("<b>Si vous êtes <u>%s</u></b><br><br>"
; 572  : 					"<input type=submit name=B$#AUTO_IDENT value='Cliquez ici'><br><br><hr>",
; 573  : 					DYNTAB_FIELD_VAL(&cntxt->user_data, USERNAME));

	push	0
	push	-1
	push	OFFSET FLAT:$SG70634
	mov	eax, DWORD PTR _cntxt$[ebp]
	add	eax, 29428				; 000072f4H
	push	eax
	call	_dyntab_field_val
	add	esp, 16					; 00000010H
	push	eax
	push	OFFSET FLAT:$SG70635
	call	_printf
	add	esp, 8
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	edx, DWORD PTR [ecx+32036]
	add	edx, eax
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+32036], edx

; 574  : 				/* Output input fields for other user identification  */
; 575  : 				output_ident_inputs(cntxt, "Vous pouvez vous identifier sous un autre nom");

	push	OFFSET FLAT:$SG70636
	mov	ecx, DWORD PTR _cntxt$[ebp]
	push	ecx
	call	_output_ident_inputs
	add	esp, 8

; 576  : 				cntxt->txsize += printf("<hr><br><b>Vous pouvez aussi continuer en <u>%s</u></b><br>"
; 577  : 					"<input type=submit name=B$#NO_IDENT value='Mode non identifié'><br><br><hr>",
; 578  : 					DYNTAB_FIELD_VAL(&cntxt->user_data, USERNAME));

	push	0
	push	-1
	push	OFFSET FLAT:$SG70637
	mov	edx, DWORD PTR _cntxt$[ebp]
	add	edx, 29428				; 000072f4H
	push	edx
	call	_dyntab_field_val
	add	esp, 16					; 00000010H
	push	eax
	push	OFFSET FLAT:$SG70638
	call	_printf
	add	esp, 8
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	edx, DWORD PTR [ecx+32036]
	add	edx, eax
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+32036], edx

; 579  : 				DYNTAB_FREE(cntxt->sess_data);

	mov	ecx, DWORD PTR _cntxt$[ebp]
	add	ecx, 29320				; 00007288H
	push	ecx
	call	_dyntab_free
	add	esp, 4

; 580  : 				*errmsg = "";

	mov	edx, DWORD PTR _errmsg$[ebp]
	mov	DWORD PTR [edx], OFFSET FLAT:$SG70639
$L70632:

; 583  : 
; 584  : 		/* Reset automatic session reconnection if not valid */
; 585  : 		if(!cntxt->session.nbrows)

	mov	eax, DWORD PTR _cntxt$[ebp]
	cmp	DWORD PTR [eax+29300], 0
	jne	SHORT $L70640

; 587  : 			DYNTAB_FREE(cntxt->id_user);

	mov	ecx, DWORD PTR _cntxt$[ebp]
	add	ecx, 29408				; 000072e0H
	push	ecx
	call	_dyntab_free
	add	esp, 4

; 588  : 			DYNTAB_FREE(cntxt->user_data);

	mov	edx, DWORD PTR _cntxt$[ebp]
	add	edx, 29428				; 000072f4H
	push	edx
	call	_dyntab_free
	add	esp, 4

; 589  : 			DYNTAB_FREE(cntxt->sess_data);

	mov	eax, DWORD PTR _cntxt$[ebp]
	add	eax, 29320				; 00007288H
	push	eax
	call	_dyntab_free
	add	esp, 4
$L70640:

; 595  : 		unsigned long i;
; 596  : 		DYNTAB_FIELD(&sqlres, &cntxt->cnf_data, ADMINISTRATOR)

	lea	ecx, DWORD PTR _sqlres$[ebp]
	push	ecx
	call	_dyntab_free
	add	esp, 4
	push	0
	push	-1
	push	OFFSET FLAT:$SG70644
	mov	edx, DWORD PTR _cntxt$[ebp]
	add	edx, 29360				; 000072b0H
	push	edx
	push	0
	lea	eax, DWORD PTR _sqlres$[ebp]
	push	eax
	call	_dyntab_filter_field
	add	esp, 24					; 00000018H
	test	eax, eax
	je	SHORT $L70643
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29872], OFFSET FLAT:$SG70646
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 596		; 00000254H
	jmp	$eva_err$70579
$L70643:

; 597  : 		for(i = 0; i < sqlres.nbrows; i++)

	mov	DWORD PTR _i$70641[ebp], 0
	jmp	SHORT $L70647
$L70648:
	mov	eax, DWORD PTR _i$70641[ebp]
	add	eax, 1
	mov	DWORD PTR _i$70641[ebp], eax
$L70647:
	mov	ecx, DWORD PTR _i$70641[ebp]
	cmp	ecx, DWORD PTR _sqlres$[ebp]
	jae	SHORT $L70649

; 598  : 			if(!dyntab_cmp(&cntxt->id_user, 0, 0, &sqlres, i, 0))

	push	0
	mov	edx, DWORD PTR _i$70641[ebp]
	push	edx
	lea	eax, DWORD PTR _sqlres$[ebp]
	push	eax
	push	0
	push	0
	mov	ecx, DWORD PTR _cntxt$[ebp]
	add	ecx, 29408				; 000072e0H
	push	ecx
	call	_dyntab_cmp
	add	esp, 24					; 00000018H
	test	eax, eax
	jne	SHORT $L70650

; 600  : 				cntxt->b_admin = 1;

	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29612], 1

; 601  : 				break;

	jmp	SHORT $L70649
$L70650:

; 603  : 		if(sqlres.nbrows && qry_obj_field(cntxt, &cntxt->mail_admin, DYNTAB_TOUL(&sqlres), "EMAIL")) STACK_ERROR;

	jmp	SHORT $L70648
$L70649:
	cmp	DWORD PTR _sqlres$[ebp], 0
	je	SHORT $L70652
	push	OFFSET FLAT:$SG70653
	push	10					; 0000000aH
	push	0
	push	0
	push	0
	lea	eax, DWORD PTR _sqlres$[ebp]
	push	eax
	call	_dyntab_val
	add	esp, 12					; 0000000cH
	push	eax
	call	_strtoul
	add	esp, 12					; 0000000cH
	push	eax
	mov	ecx, DWORD PTR _cntxt$[ebp]
	add	ecx, 29620				; 000073b4H
	push	ecx
	mov	edx, DWORD PTR _cntxt$[ebp]
	push	edx
	call	_qry_obj_field
	add	esp, 16					; 00000010H
	test	eax, eax
	je	SHORT $L70652
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 603		; 0000025bH
	jmp	SHORT $eva_err$70579
$L70652:

; 604  : 		if(!dyntab_cell(&cntxt->mail_admin, 0, 0)) DYNTAB_ADD_STR(&cntxt->mail_admin, 0, 0, "eva@abing.fr");

	push	0
	push	0
	mov	ecx, DWORD PTR _cntxt$[ebp]
	add	ecx, 29620				; 000073b4H
	push	ecx
	call	_dyntab_cell
	add	esp, 12					; 0000000cH
	test	eax, eax
	jne	SHORT $L70655
	push	12					; 0000000cH
	push	OFFSET FLAT:$SG70656
	push	0
	push	0
	mov	edx, DWORD PTR _cntxt$[ebp]
	add	edx, 29620				; 000073b4H
	push	edx
	call	_dyntab_set_txt
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L70655
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29872], OFFSET FLAT:$SG70658
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 604		; 0000025cH
	jmp	SHORT $eva_err$70579
$L70655:
$eva_noerr$70584:

; 606  : 
; 607  : 	RETURN_OK_CLEANUP;

	push	0
	push	OFFSET FLAT:$SG70659
	push	OFFSET FLAT:$SG70660
	mov	edx, DWORD PTR _cntxt$[ebp]
	push	edx
	call	_err_clear
	add	esp, 16					; 00000010H
$eva_err$70579:
	mov	eax, DWORD PTR _cntxt$[ebp]
	cmp	DWORD PTR [eax+29872], 0
	je	SHORT $L70661
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	edx, DWORD PTR [ecx+29900]
	push	edx
	push	OFFSET FLAT:$SG70662
	push	OFFSET FLAT:$SG70663
	mov	eax, DWORD PTR _cntxt$[ebp]
	push	eax
	call	_err_add_context
	add	esp, 16					; 00000010H
$L70661:
	lea	ecx, DWORD PTR _sqlres$[ebp]
	push	ecx
	call	_dyntab_free
	add	esp, 4
	mov	edx, DWORD PTR _cntxt$[ebp]
	xor	eax, eax
	cmp	DWORD PTR [edx+29872], 0
	setne	al

; 608  : }

	mov	esp, ebp
	pop	ebp
	ret	0
_check_user_identification ENDP
_TEXT	ENDS
PUBLIC	_check_login
EXTRN	_datetxt_to_age:NEAR
EXTRN	_datetxt_now:NEAR
EXTRN	_remove:NEAR
EXTRN	_sprintf:NEAR
EXTRN	_cgi_save_files:NEAR
EXTRN	_form_set_homepage:NEAR
EXTRN	_getenv:NEAR
EXTRN	_qry_add_idobj_field_rel:NEAR
EXTRN	_dyntab_add:NEAR
EXTRN	_chdir:NEAR
EXTRN	_strncmp:NEAR
EXTRN	_strstr:NEAR
EXTRN	_debug_put_info:NEAR
_DATA	SEGMENT
	ORG $+2
$SG70678 DB	'HTTP_REFERER', 00H
	ORG $+3
$SG70686 DB	'%lu', 00H
$SG70690 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70696 DB	'Merci de vous identifier pour continuer votre travail', 00H
	ORG $+2
$SG70698 DB	'_EVA_HOMEPAGE', 00H
	ORG $+2
$SG70704 DB	'_EVA_MENUBAR', 00H
	ORG $+3
$SG70706 DB	'_EVA_MAXJOIN', 00H
	ORG $+3
$SG70709 DB	'_EVA_MAXJOIN', 00H
	ORG $+3
$SG70713 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70717 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70720 DB	'_EVA_IMGPATH', 00H
	ORG $+3
$SG70722 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70725 DB	'_EVA_USERGROUP', 00H
	ORG $+1
$SG70727 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70730 DB	'SET SESSION max_join_size=%lu', 00H
	ORG $+2
$SG70734 DB	'_EVA_DEBUG', 00H
	ORG $+1
$SG70736 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70743 DB	'_EVA_TRACE_CGI', 00H
	ORG $+1
$SG70746 DB	'_EVA_DEBUG_CGI', 00H
	ORG $+1
$SG70749 DB	'_EVA_DEBUG_SQL', 00H
	ORG $+1
$SG70752 DB	'_EVA_DEBUG_SQL_RES', 00H
	ORG $+1
$SG70755 DB	'_EVA_DEBUG_SQL_SLOW', 00H
$SG70758 DB	'_EVA_DEBUG_ENV', 00H
	ORG $+1
$SG70761 DB	'_EVA_DEBUG_HTML', 00H
$SG70763 DB	'_EVA_TRACEOUTPUT', 00H
	ORG $+3
$SG70766 DB	'DateCr', 00H
	ORG $+1
$SG70769 DB	'UPDATE TLink SET DateDel=%s,IdWhoDel=%s WHERE Pkey=%lu', 00H
	ORG $+1
$SG70774 DB	'%s-%s.html', 00H
	ORG $+1
$SG70776 DB	'trace', 00H
	ORG $+2
$SG70778 DB	'_EVA_OPTIONBUTTON', 00H
	ORG $+2
$SG70779 DB	'_EVA_NONE', 00H
	ORG $+2
$SG70780 DB	'_EVA_HELP', 00H
	ORG $+2
$SG70781 DB	'_EVA_OPENSAME', 00H
	ORG $+2
$SG70784 DB	'_EVA_USER_VIEW_FORMS', 00H
	ORG $+3
$SG70786 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70791 DB	'_EVA_IMGPATH', 00H
	ORG $+3
$SG70793 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70795 DB	'127.0.0.1', 00H
	ORG $+2
$SG70797 DB	'_EVA_IP_FILTER', 00H
	ORG $+1
$SG70800 DB	'_EVA_ACCESS_IP', 00H
	ORG $+1
$SG70802 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70804 DB	'_EVA_IP_FILTER', 00H
	ORG $+1
$SG70807 DB	'_EVA_ACCESS_IP', 00H
	ORG $+1
$SG70809 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70818 DB	'_EVA_ALLOW', 00H
	ORG $+1
$SG70819 DB	'Vous n''', 0eaH, 'tes pas autoris', 0e9H, ' ', 0e0H, ' a'
	DB	'cc', 0e9H, 'der ', 0e0H, ' ce serveur', 00H
$SG70820 DB	'<br>Motif : adresse IP non conforme<br><br><br>Contactez'
	DB	' l''administrateur pour obtenir l''acc', 0e8H, 's<br><br>', 00H
	ORG $+1
$SG70822 DB	'/eva/%s.cgi', 00H
$SG70826 DB	'Source=', 00H
$SG70833 DB	'_EVA_FORM_SESSION', 00H
	ORG $+2
$SG70836 DB	'_EVA_USER_IP', 00H
	ORG $+3
$SG70837 DB	'_EVA_USER_AGENT', 00H
$SG70838 DB	'_EVA_USER', 00H
	ORG $+2
$SG70841 DB	'_EVA_WKS', 00H
	ORG $+3
$SG70842 DB	'_EVA_WKS', 00H
	ORG $+3
$SG70845 DB	'_EVA_SOURCE_REF', 00H
$SG70847 DB	'_EVA_REFERER', 00H
	ORG $+3
$SG70848 DB	'cgi', 00H
$SG70849 DB	'D:\Travail\ABI\EVA\V4.0\CGI\Brunix-2016\check_login.c', 00H
	ORG $+2
$SG70850 DB	'check_login', 00H
$SG70852 DB	'D:\Travail\ABI\EVA\V4.0\CGI\Brunix-2016\check_login.c', 00H
	ORG $+2
$SG70853 DB	'check_login', 00H
_DATA	ENDS
_TEXT	SEGMENT
_cntxt$ = 8
_sqlres$ = -1072
_debug$ = -1104
_id_form$ = -24
_sql$ = -4
_printbuf$ = -1048
_homepage$ = -1080
_referer$ = -1076
_sourceref$ = -1052
_errmsg$ = -1084
__tmp$70685 = -1136
_i$70702 = -1148
_menubar$70703 = -1144
_maxjoinusr$70705 = -1152
_maxjoin$70707 = -1140
_dbg$70741 = -1156
_tr$70762 = -1160
_fmt$70765 = -1164
_fname$70773 = -1292
_optbtnmode$70777 = -1296
_filtmode$70796 = -1300
_i$70811 = -1304
_c$70815 = -1308
_src$70825 = -1312
_idsession$70831 = -1316
_check_login PROC NEAR

; 624  : ){

	push	ebp
	mov	ebp, esp
	sub	esp, 1336				; 00000538H
	push	edi

; 625  : 	DynTable sqlres = { 0 };

	mov	DWORD PTR _sqlres$[ebp], 0
	xor	eax, eax
	mov	DWORD PTR _sqlres$[ebp+4], eax
	mov	DWORD PTR _sqlres$[ebp+8], eax
	mov	DWORD PTR _sqlres$[ebp+12], eax
	mov	DWORD PTR _sqlres$[ebp+16], eax

; 626  : 	DynTable debug = { 0 };

	mov	DWORD PTR _debug$[ebp], 0
	xor	ecx, ecx
	mov	DWORD PTR _debug$[ebp+4], ecx
	mov	DWORD PTR _debug$[ebp+8], ecx
	mov	DWORD PTR _debug$[ebp+12], ecx
	mov	DWORD PTR _debug$[ebp+16], ecx

; 627  : 	DynTable id_form = { 0 };

	mov	DWORD PTR _id_form$[ebp], 0
	xor	edx, edx
	mov	DWORD PTR _id_form$[ebp+4], edx
	mov	DWORD PTR _id_form$[ebp+8], edx
	mov	DWORD PTR _id_form$[ebp+12], edx
	mov	DWORD PTR _id_form$[ebp+16], edx

; 628  : 	DynBuffer *sql = NULL;

	mov	DWORD PTR _sql$[ebp], 0

; 629  : 	char printbuf[1024];
; 630  : 	DynTableCell *homepage;
; 631  : 	char *referer = getenv("HTTP_REFERER");

	push	OFFSET FLAT:$SG70678
	call	_getenv
	add	esp, 4
	mov	DWORD PTR _referer$[ebp], eax

; 632  : 	unsigned long sourceref = 0;

	mov	DWORD PTR _sourceref$[ebp], 0

; 633  : 	char *errmsg = NULL;

	mov	DWORD PTR _errmsg$[ebp], 0

; 634  : 
; 635  : 	/* Handle user identification */
; 636  : 	if(check_user_identification(cntxt, &errmsg)) STACK_ERROR;

	lea	eax, DWORD PTR _errmsg$[ebp]
	push	eax
	mov	ecx, DWORD PTR _cntxt$[ebp]
	push	ecx
	call	_check_user_identification
	add	esp, 8
	test	eax, eax
	je	SHORT $L70682
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 636		; 0000027cH
	jmp	$eva_err$70683
$L70682:

; 637  : 
; 638  : 	/* Set user identification status - use public user account if not identified */
; 639  : 	if(!dyntab_sz(&cntxt->id_user, 0, 0) && cntxt->id_public)

	push	0
	push	0
	mov	eax, DWORD PTR _cntxt$[ebp]
	add	eax, 29408				; 000072e0H
	push	eax
	call	_dyntab_sz
	add	esp, 12					; 0000000cH
	test	eax, eax
	jne	$L70688
	mov	ecx, DWORD PTR _cntxt$[ebp]
	cmp	DWORD PTR [ecx+29640], 0
	je	SHORT $L70688

; 640  : 		DYNTAB_ADD_INT(&cntxt->id_user, 0, 0, cntxt->id_public);

	mov	BYTE PTR __tmp$70685[ebp], 0
	mov	ecx, 7
	xor	eax, eax
	lea	edi, DWORD PTR __tmp$70685[ebp+1]
	rep stosd
	stosw
	stosb
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	eax, DWORD PTR [edx+29640]
	push	eax
	push	OFFSET FLAT:$SG70686
	lea	ecx, DWORD PTR __tmp$70685[ebp]
	push	ecx
	call	_sprintf
	add	esp, 12					; 0000000cH
	push	0
	push	0
	push	0
	lea	edx, DWORD PTR __tmp$70685[ebp]
	push	edx
	push	0
	push	0
	mov	eax, DWORD PTR _cntxt$[ebp]
	add	eax, 29408				; 000072e0H
	push	eax
	call	_dyntab_add
	add	esp, 28					; 0000001cH
	test	eax, eax
	je	SHORT $L70688
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29872], OFFSET FLAT:$SG70690
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 640		; 00000280H
	jmp	$eva_err$70683
$L70688:

; 641  : 	if(qry_obj_data(cntxt, &cntxt->user_data, &cntxt->id_user, NULL)) STACK_ERROR;

	push	0
	mov	eax, DWORD PTR _cntxt$[ebp]
	add	eax, 29408				; 000072e0H
	push	eax
	mov	ecx, DWORD PTR _cntxt$[ebp]
	add	ecx, 29428				; 000072f4H
	push	ecx
	mov	edx, DWORD PTR _cntxt$[ebp]
	push	edx
	call	_qry_obj_data
	add	esp, 16					; 00000010H
	test	eax, eax
	je	SHORT $L70692
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 641		; 00000281H
	jmp	$eva_err$70683
$L70692:

; 642  : 	cntxt->b_identified = cntxt->id_user.nbrows && DYNTAB_TOUL(&cntxt->id_user) != cntxt->id_public;

	mov	ecx, DWORD PTR _cntxt$[ebp]
	cmp	DWORD PTR [ecx+29408], 0
	je	SHORT $L70886
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
	mov	ecx, DWORD PTR _cntxt$[ebp]
	cmp	eax, DWORD PTR [ecx+29640]
	je	SHORT $L70886
	mov	DWORD PTR -1320+[ebp], 1
	jmp	SHORT $L70887
$L70886:
	mov	DWORD PTR -1320+[ebp], 0
$L70887:
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	eax, DWORD PTR -1320+[ebp]
	mov	DWORD PTR [edx+29400], eax

; 643  : 
; 644  : 	/* Output security agent dialog & return if applicable */
; 645  : 	if(errmsg)

	cmp	DWORD PTR _errmsg$[ebp], 0
	je	SHORT $L70694

; 647  : 		if(*errmsg)

	mov	ecx, DWORD PTR _errmsg$[ebp]
	movsx	edx, BYTE PTR [ecx]
	test	edx, edx
	je	SHORT $L70695

; 649  : 			output_message(cntxt, errmsg);

	mov	eax, DWORD PTR _errmsg$[ebp]
	push	eax
	mov	ecx, DWORD PTR _cntxt$[ebp]
	push	ecx
	call	_output_message
	add	esp, 8

; 650  : 			output_ident_inputs(cntxt, "Merci de vous identifier pour continuer votre travail");

	push	OFFSET FLAT:$SG70696
	mov	edx, DWORD PTR _cntxt$[ebp]
	push	edx
	call	_output_ident_inputs
	add	esp, 8
$L70695:

; 652  : 		RETURN_OK;

	jmp	$eva_noerr$70697
$L70694:

; 654  : 
; 655  : 	/* If user login & has homepage : reset current page if home page */
; 656  : 	homepage = DYNTAB_FIELD_CELL(&cntxt->user_data, HOMEPAGE);

	push	0
	push	-1
	push	OFFSET FLAT:$SG70698
	mov	eax, DWORD PTR _cntxt$[ebp]
	add	eax, 29428				; 000072f4H
	push	eax
	call	_dyntab_field_cell
	add	esp, 16					; 00000010H
	mov	DWORD PTR _homepage$[ebp], eax

; 657  : 	if(cntxt->b_login_pwd && homepage)

	mov	ecx, DWORD PTR _cntxt$[ebp]
	cmp	DWORD PTR [ecx+29404], 0
	je	SHORT $L70699
	cmp	DWORD PTR _homepage$[ebp], 0
	je	SHORT $L70699

; 659  : 		if(!dyntab_cmp(&cntxt->homepage, 0, 0, &cntxt->id_form, 0, 0))

	push	0
	push	0
	mov	edx, DWORD PTR _cntxt$[ebp]
	push	edx
	push	0
	push	0
	mov	eax, DWORD PTR _cntxt$[ebp]
	add	eax, 29548				; 0000736cH
	push	eax
	call	_dyntab_cmp
	add	esp, 24					; 00000018H
	test	eax, eax
	jne	SHORT $L70700

; 661  : 			DYNTAB_FREE(cntxt->id_form);

	mov	ecx, DWORD PTR _cntxt$[ebp]
	push	ecx
	call	_dyntab_free
	add	esp, 4

; 662  : 			DYNTAB_FREE(cntxt->id_obj);

	mov	edx, DWORD PTR _cntxt$[ebp]
	add	edx, 20					; 00000014H
	push	edx
	call	_dyntab_free
	add	esp, 4
$L70700:

; 664  : 		DYNTAB_FREE(cntxt->alt_form);

	mov	eax, DWORD PTR _cntxt$[ebp]
	add	eax, 40					; 00000028H
	push	eax
	call	_dyntab_free
	add	esp, 4

; 665  : 		DYNTAB_FREE(cntxt->alt_obj);

	mov	ecx, DWORD PTR _cntxt$[ebp]
	add	ecx, 60					; 0000003cH
	push	ecx
	call	_dyntab_free
	add	esp, 4
$L70699:

; 667  : 
; 668  : 	/* If user account is available */
; 669  : 	if(cntxt->id_user.nbrows)

	mov	edx, DWORD PTR _cntxt$[ebp]
	cmp	DWORD PTR [edx+29408], 0
	je	$L70701

; 671  : 		/* Select home page, menubar & images path */
; 672  : 		unsigned long i;
; 673  : 		DynTableCell *menubar = DYNTAB_FIELD_CELL(&cntxt->user_data, MENUBAR);

	push	0
	push	-1
	push	OFFSET FLAT:$SG70704
	mov	eax, DWORD PTR _cntxt$[ebp]
	add	eax, 29428				; 000072f4H
	push	eax
	call	_dyntab_field_cell
	add	esp, 16					; 00000010H
	mov	DWORD PTR _menubar$70703[ebp], eax

; 674  : 		char *maxjoinusr = DYNTAB_FIELD_VAL(&cntxt->user_data, MAXJOIN);

	push	0
	push	-1
	push	OFFSET FLAT:$SG70706
	mov	ecx, DWORD PTR _cntxt$[ebp]
	add	ecx, 29428				; 000072f4H
	push	ecx
	call	_dyntab_field_val
	add	esp, 16					; 00000010H
	mov	DWORD PTR _maxjoinusr$70705[ebp], eax

; 675  : 		unsigned long maxjoin = strtoul(*maxjoinusr ? maxjoinusr : DYNTAB_FIELD_VAL(&cntxt->cnf_data, MAXJOIN), NULL, 10);

	mov	edx, DWORD PTR _maxjoinusr$70705[ebp]
	movsx	eax, BYTE PTR [edx]
	test	eax, eax
	je	SHORT $L70888
	mov	ecx, DWORD PTR _maxjoinusr$70705[ebp]
	mov	DWORD PTR -1324+[ebp], ecx
	jmp	SHORT $L70889
$L70888:
	push	0
	push	-1
	push	OFFSET FLAT:$SG70709
	mov	edx, DWORD PTR _cntxt$[ebp]
	add	edx, 29360				; 000072b0H
	push	edx
	call	_dyntab_field_val
	add	esp, 16					; 00000010H
	mov	DWORD PTR -1324+[ebp], eax
$L70889:
	push	10					; 0000000aH
	push	0
	mov	eax, DWORD PTR -1324+[ebp]
	push	eax
	call	_strtoul
	add	esp, 12					; 0000000cH
	mov	DWORD PTR _maxjoin$70707[ebp], eax

; 676  : 		if(homepage) DYNTAB_SET_CELLP(&cntxt->homepage, 0, 0, homepage);

	cmp	DWORD PTR _homepage$[ebp], 0
	je	SHORT $L70711
	push	0
	mov	ecx, DWORD PTR _homepage$[ebp]
	push	ecx
	push	0
	push	0
	mov	edx, DWORD PTR _cntxt$[ebp]
	add	edx, 29548				; 0000736cH
	push	edx
	call	_dyntab_copy
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L70711
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29872], OFFSET FLAT:$SG70713
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 676		; 000002a4H
	jmp	$eva_err$70683
$L70711:

; 677  : 		if(menubar) DYNTAB_SET_CELLP(&cntxt->menubar, 0, 0, menubar);

	cmp	DWORD PTR _menubar$70703[ebp], 0
	je	SHORT $L70715
	push	0
	mov	edx, DWORD PTR _menubar$70703[ebp]
	push	edx
	push	0
	push	0
	mov	eax, DWORD PTR _cntxt$[ebp]
	add	eax, 29528				; 00007358H
	push	eax
	call	_dyntab_copy
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L70715
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29872], OFFSET FLAT:$SG70717
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 677		; 000002a5H
	jmp	$eva_err$70683
$L70715:

; 678  : 		DYNTAB_FIELD(&cntxt->imgpath, &cntxt->user_data, IMGPATH);

	mov	eax, DWORD PTR _cntxt$[ebp]
	add	eax, 29568				; 00007380H
	push	eax
	call	_dyntab_free
	add	esp, 4
	push	0
	push	-1
	push	OFFSET FLAT:$SG70720
	mov	ecx, DWORD PTR _cntxt$[ebp]
	add	ecx, 29428				; 000072f4H
	push	ecx
	push	0
	mov	edx, DWORD PTR _cntxt$[ebp]
	add	edx, 29568				; 00007380H
	push	edx
	call	_dyntab_filter_field
	add	esp, 24					; 00000018H
	test	eax, eax
	je	SHORT $L70719
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29872], OFFSET FLAT:$SG70722
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 678		; 000002a6H
	jmp	$eva_err$70683
$L70719:

; 679  : 		DYNTAB_FIELD(&cntxt->user_groups, &cntxt->user_data, USERGROUP);

	mov	edx, DWORD PTR _cntxt$[ebp]
	add	edx, 29448				; 00007308H
	push	edx
	call	_dyntab_free
	add	esp, 4
	push	0
	push	-1
	push	OFFSET FLAT:$SG70725
	mov	eax, DWORD PTR _cntxt$[ebp]
	add	eax, 29428				; 000072f4H
	push	eax
	push	0
	mov	ecx, DWORD PTR _cntxt$[ebp]
	add	ecx, 29448				; 00007308H
	push	ecx
	call	_dyntab_filter_field
	add	esp, 24					; 00000018H
	test	eax, eax
	je	SHORT $L70724
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29872], OFFSET FLAT:$SG70727
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 679		; 000002a7H
	jmp	$eva_err$70683
$L70724:

; 680  : 
; 681  : 		/* Save uploaded files */
; 682  : 		if(cgi_save_files(cntxt)) STACK_ERROR;

	mov	ecx, DWORD PTR _cntxt$[ebp]
	push	ecx
	call	_cgi_save_files
	add	esp, 4
	test	eax, eax
	je	SHORT $L70728
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 682		; 000002aaH
	jmp	$eva_err$70683
$L70728:

; 683  : 
; 684  : 		/* Set max query time if applicable */
; 685  : 		if(maxjoin)

	cmp	DWORD PTR _maxjoin$70707[ebp], 0
	je	SHORT $L70731

; 687  : 			snprintf(add_sz_str(printbuf), "SET SESSION max_join_size=%lu", 1000 * maxjoin);

	mov	eax, DWORD PTR _maxjoin$70707[ebp]
	imul	eax, 1000				; 000003e8H
	push	eax
	push	OFFSET FLAT:$SG70730
	push	1023					; 000003ffH
	lea	ecx, DWORD PTR _printbuf$[ebp]
	push	ecx
	call	__snprintf
	add	esp, 16					; 00000010H

; 688  : 			if(sql_exec_query(cntxt, printbuf)) STACK_ERROR;

	lea	edx, DWORD PTR _printbuf$[ebp]
	push	edx
	mov	eax, DWORD PTR _cntxt$[ebp]
	push	eax
	call	_sql_exec_query
	add	esp, 8
	test	eax, eax
	je	SHORT $L70731
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 688		; 000002b0H
	jmp	$eva_err$70683
$L70731:

; 690  : 
; 691  : 		/* Set debug options */
; 692  : 		DYNTAB_FIELD(&debug, &cntxt->user_data, DEBUG);

	lea	edx, DWORD PTR _debug$[ebp]
	push	edx
	call	_dyntab_free
	add	esp, 4
	push	0
	push	-1
	push	OFFSET FLAT:$SG70734
	mov	eax, DWORD PTR _cntxt$[ebp]
	add	eax, 29428				; 000072f4H
	push	eax
	push	0
	lea	ecx, DWORD PTR _debug$[ebp]
	push	ecx
	call	_dyntab_filter_field
	add	esp, 24					; 00000018H
	test	eax, eax
	je	SHORT $L70733
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29872], OFFSET FLAT:$SG70736
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 692		; 000002b4H
	jmp	$eva_err$70683
$L70733:

; 693  : 		if(debug.nbrows) for(i = 0; i < debug.nbrows; i++)

	cmp	DWORD PTR _debug$[ebp], 0
	je	$L70740
	mov	DWORD PTR _i$70702[ebp], 0
	jmp	SHORT $L70738
$L70739:
	mov	ecx, DWORD PTR _i$70702[ebp]
	add	ecx, 1
	mov	DWORD PTR _i$70702[ebp], ecx
$L70738:
	mov	edx, DWORD PTR _i$70702[ebp]
	cmp	edx, DWORD PTR _debug$[ebp]
	jae	$L70740

; 695  : 			char * dbg = dyntab_val(&debug, i, 0);

	push	0
	mov	eax, DWORD PTR _i$70702[ebp]
	push	eax
	lea	ecx, DWORD PTR _debug$[ebp]
	push	ecx
	call	_dyntab_val
	add	esp, 12					; 0000000cH
	mov	DWORD PTR _dbg$70741[ebp], eax

; 696  : 			if(!strcmp(dbg, "_EVA_TRACE_CGI")) cntxt->debug |= DEBUG_CGI_RAW;

	push	OFFSET FLAT:$SG70743
	mov	edx, DWORD PTR _dbg$70741[ebp]
	push	edx
	call	_strcmp
	add	esp, 8
	test	eax, eax
	jne	SHORT $L70742
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	ecx, DWORD PTR [eax+29860]
	or	ecx, 8
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29860], ecx

; 697  : 			else if(!strcmp(dbg, "_EVA_DEBUG_CGI")) cntxt->debug |= DEBUG_CGI;

	jmp	$L70760
$L70742:
	push	OFFSET FLAT:$SG70746
	mov	eax, DWORD PTR _dbg$70741[ebp]
	push	eax
	call	_strcmp
	add	esp, 8
	test	eax, eax
	jne	SHORT $L70745
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	edx, DWORD PTR [ecx+29860]
	or	edx, 4
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29860], edx

; 698  : 			else if(!strcmp(dbg, "_EVA_DEBUG_SQL")) cntxt->debug |= DEBUG_SQL;

	jmp	$L70760
$L70745:
	push	OFFSET FLAT:$SG70749
	mov	ecx, DWORD PTR _dbg$70741[ebp]
	push	ecx
	call	_strcmp
	add	esp, 8
	test	eax, eax
	jne	SHORT $L70748
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	eax, DWORD PTR [edx+29860]
	or	al, 1
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29860], eax

; 699  : 			else if(!strcmp(dbg, "_EVA_DEBUG_SQL_RES")) cntxt->debug |= DEBUG_SQL_RES;

	jmp	$L70760
$L70748:
	push	OFFSET FLAT:$SG70752
	mov	edx, DWORD PTR _dbg$70741[ebp]
	push	edx
	call	_strcmp
	add	esp, 8
	test	eax, eax
	jne	SHORT $L70751
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	ecx, DWORD PTR [eax+29860]
	or	ecx, 2
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29860], ecx

; 700  : 			else if(!strcmp(dbg, "_EVA_DEBUG_SQL_SLOW")) cntxt->debug |= DEBUG_SQL_SLOW;

	jmp	$L70760
$L70751:
	push	OFFSET FLAT:$SG70755
	mov	eax, DWORD PTR _dbg$70741[ebp]
	push	eax
	call	_strcmp
	add	esp, 8
	test	eax, eax
	jne	SHORT $L70754
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	edx, DWORD PTR [ecx+29860]
	or	edx, 64					; 00000040H
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29860], edx

; 701  : 			else if(!strcmp(dbg, "_EVA_DEBUG_ENV")) cntxt->debug |= DEBUG_ENV;

	jmp	SHORT $L70760
$L70754:
	push	OFFSET FLAT:$SG70758
	mov	ecx, DWORD PTR _dbg$70741[ebp]
	push	ecx
	call	_strcmp
	add	esp, 8
	test	eax, eax
	jne	SHORT $L70757
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	eax, DWORD PTR [edx+29860]
	or	al, 32					; 00000020H
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29860], eax

; 702  : 			else if(!strcmp(dbg, "_EVA_DEBUG_HTML")) cntxt->debug |= DEBUG_HTML;

	jmp	SHORT $L70760
$L70757:
	push	OFFSET FLAT:$SG70761
	mov	edx, DWORD PTR _dbg$70741[ebp]
	push	edx
	call	_strcmp
	add	esp, 8
	test	eax, eax
	jne	SHORT $L70760
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	ecx, DWORD PTR [eax+29860]
	or	cl, -128				; ffffff80H
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29860], ecx
$L70760:

; 703  : 		}

	jmp	$L70739
$L70740:

; 707  : 			DynTableCell *tr = DYNTAB_FIELD_CELL(&cntxt->user_data, TRACEOUTPUT);

	push	0
	push	-1
	push	OFFSET FLAT:$SG70763
	mov	eax, DWORD PTR _cntxt$[ebp]
	add	eax, 29428				; 000072f4H
	push	eax
	call	_dyntab_field_cell
	add	esp, 16					; 00000010H
	mov	DWORD PTR _tr$70762[ebp], eax

; 708  : 			if(tr)

	cmp	DWORD PTR _tr$70762[ebp], 0
	je	$L70771

; 710  : 				/* Limit trace time to 180 min */
; 711  : 				char fmt = 'm';

	mov	BYTE PTR _fmt$70765[ebp], 109		; 0000006dH

; 712  : 				qry_get_rec_info(cntxt, &debug, tr->Pkey, "DateCr");

	push	OFFSET FLAT:$SG70766
	mov	ecx, DWORD PTR _tr$70762[ebp]
	mov	edx, DWORD PTR [ecx+16]
	push	edx
	lea	eax, DWORD PTR _debug$[ebp]
	push	eax
	mov	ecx, DWORD PTR _cntxt$[ebp]
	push	ecx
	call	_qry_get_rec_info
	add	esp, 16					; 00000010H

; 713  : 				if(datetxt_to_age(dyntab_val(&debug, 0, 0), datetxt_now(), &fmt) > 180 || fmt != 'm')

	lea	edx, DWORD PTR _fmt$70765[ebp]
	push	edx
	call	_datetxt_now
	push	eax
	push	0
	push	0
	lea	eax, DWORD PTR _debug$[ebp]
	push	eax
	call	_dyntab_val
	add	esp, 12					; 0000000cH
	push	eax
	call	_datetxt_to_age
	add	esp, 12					; 0000000cH
	cmp	eax, 180				; 000000b4H
	jg	SHORT $L70768
	movsx	ecx, BYTE PTR _fmt$70765[ebp]
	cmp	ecx, 109				; 0000006dH
	je	SHORT $L70767
$L70768:

; 715  : 					sprintf(printbuf, "UPDATE TLink SET DateDel=%s,IdWhoDel=%s WHERE Pkey=%lu",
; 716  : 									cntxt->timestamp, dyntab_val(&cntxt->id_user, 0, 0), tr->Pkey);

	mov	edx, DWORD PTR _tr$70762[ebp]
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
	push	OFFSET FLAT:$SG70769
	lea	eax, DWORD PTR _printbuf$[ebp]
	push	eax
	call	_sprintf
	add	esp, 20					; 00000014H

; 717  : 					if(sql_exec_query(cntxt, printbuf)) STACK_ERROR;

	lea	ecx, DWORD PTR _printbuf$[ebp]
	push	ecx
	mov	edx, DWORD PTR _cntxt$[ebp]
	push	edx
	call	_sql_exec_query
	add	esp, 8
	test	eax, eax
	je	SHORT $L70770
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 717		; 000002cdH
	jmp	$eva_err$70683
$L70770:

; 719  : 				else

	jmp	SHORT $L70771
$L70767:

; 720  : 					cntxt->debug |= DEBUG_HTML_RAW;

	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	edx, DWORD PTR [ecx+29860]
	or	dh, 1
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29860], edx
$L70771:

; 723  : 
; 724  : 		/* Delete trace file if trace not activated */
; 725  : 		if(!(cntxt->debug & DEBUG_HTML_RAW))

	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	edx, DWORD PTR [ecx+29860]
	and	edx, 256				; 00000100H
	test	edx, edx
	jne	SHORT $L70775

; 727  : 			char fname[128];
; 728  : 			sprintf(fname, "%s-%s.html", cntxt->dbname, dyntab_val(&cntxt->id_user, 0, 0));

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
	push	OFFSET FLAT:$SG70774
	lea	eax, DWORD PTR _fname$70773[ebp]
	push	eax
	call	_sprintf
	add	esp, 16					; 00000010H

; 729  : 			if(!chdir(cntxt->rootdir) && !chdir("trace")) remove(fname);

	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	edx, DWORD PTR [ecx+29724]
	push	edx
	call	_chdir
	add	esp, 4
	test	eax, eax
	jne	SHORT $L70775
	push	OFFSET FLAT:$SG70776
	call	_chdir
	add	esp, 4
	test	eax, eax
	jne	SHORT $L70775
	lea	eax, DWORD PTR _fname$70773[ebp]
	push	eax
	call	_remove
	add	esp, 4
$L70775:

; 734  : 			char *optbtnmode = DYNTAB_FIELD_VAL(&cntxt->user_data, OPTIONBUTTON);

	push	0
	push	-1
	push	OFFSET FLAT:$SG70778
	mov	ecx, DWORD PTR _cntxt$[ebp]
	add	ecx, 29428				; 000072f4H
	push	ecx
	call	_dyntab_field_val
	add	esp, 16					; 00000010H
	mov	DWORD PTR _optbtnmode$70777[ebp], eax

; 735  : 			cntxt->opt_btn_mode =	!strcmp(optbtnmode, "_EVA_NONE") ? OptBtn_None :
; 736  : 									(!*optbtnmode || !strcmp(optbtnmode, "_EVA_HELP")) ? OptBtn_Help :
; 737  : 									!strcmp(optbtnmode, "_EVA_OPENSAME") ? OptBtn_OpenSame : OptBtn_OpenBottom;

	push	OFFSET FLAT:$SG70779
	mov	edx, DWORD PTR _optbtnmode$70777[ebp]
	push	edx
	call	_strcmp
	add	esp, 8
	test	eax, eax
	jne	SHORT $L70892
	mov	DWORD PTR -1328+[ebp], 0
	jmp	SHORT $L70893
$L70892:
	mov	eax, DWORD PTR _optbtnmode$70777[ebp]
	movsx	ecx, BYTE PTR [eax]
	test	ecx, ecx
	je	SHORT $L70890
	push	OFFSET FLAT:$SG70780
	mov	edx, DWORD PTR _optbtnmode$70777[ebp]
	push	edx
	call	_strcmp
	add	esp, 8
	test	eax, eax
	je	SHORT $L70890
	push	OFFSET FLAT:$SG70781
	mov	eax, DWORD PTR _optbtnmode$70777[ebp]
	push	eax
	call	_strcmp
	add	esp, 8
	neg	eax
	sbb	eax, eax
	neg	eax
	add	eax, 2
	mov	DWORD PTR -1332+[ebp], eax
	jmp	SHORT $L70891
$L70890:
	mov	DWORD PTR -1332+[ebp], 1
$L70891:
	mov	ecx, DWORD PTR -1332+[ebp]
	mov	DWORD PTR -1328+[ebp], ecx
$L70893:
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	eax, DWORD PTR -1328+[ebp]
	mov	DWORD PTR [edx+29588], eax

; 738  : 			DYNTAB_FIELD(&cntxt->viewforms, &cntxt->user_data, USER_VIEW_FORMS);

	mov	ecx, DWORD PTR _cntxt$[ebp]
	add	ecx, 29592				; 00007398H
	push	ecx
	call	_dyntab_free
	add	esp, 4
	push	0
	push	-1
	push	OFFSET FLAT:$SG70784
	mov	edx, DWORD PTR _cntxt$[ebp]
	add	edx, 29428				; 000072f4H
	push	edx
	push	0
	mov	eax, DWORD PTR _cntxt$[ebp]
	add	eax, 29592				; 00007398H
	push	eax
	call	_dyntab_filter_field
	add	esp, 24					; 00000018H
	test	eax, eax
	je	SHORT $L70783
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29872], OFFSET FLAT:$SG70786
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 738		; 000002e2H
	jmp	$eva_err$70683
$L70783:

; 740  : 
; 741  : 		/* Output debug info */
; 742  : 		debug_put_info(cntxt);

	mov	eax, DWORD PTR _cntxt$[ebp]
	push	eax
	call	_debug_put_info
	add	esp, 4

; 744  : 	else

	jmp	SHORT $L70788
$L70701:

; 746  : 		/* Set next form to default login */
; 747  : 		if(dyntab_cmp(&cntxt->homepage, 0, 0, &cntxt->id_form, 0, 0) &&
; 748  : 			form_set_homepage(cntxt)) STACK_ERROR;

	push	0
	push	0
	mov	ecx, DWORD PTR _cntxt$[ebp]
	push	ecx
	push	0
	push	0
	mov	edx, DWORD PTR _cntxt$[ebp]
	add	edx, 29548				; 0000736cH
	push	edx
	call	_dyntab_cmp
	add	esp, 24					; 00000018H
	test	eax, eax
	je	SHORT $L70788
	mov	eax, DWORD PTR _cntxt$[ebp]
	push	eax
	call	_form_set_homepage
	add	esp, 4
	test	eax, eax
	je	SHORT $L70788
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 748		; 000002ecH
	jmp	$eva_err$70683
$L70788:

; 750  : 
; 751  : 	/* Add site image path */
; 752  : 	if(dyntab_filter_field(&cntxt->imgpath, 0, &cntxt->cnf_data, "_EVA_IMGPATH", ~0UL, NULL)) RETURN_ERR_MEMORY;

	push	0
	push	-1
	push	OFFSET FLAT:$SG70791
	mov	edx, DWORD PTR _cntxt$[ebp]
	add	edx, 29360				; 000072b0H
	push	edx
	push	0
	mov	eax, DWORD PTR _cntxt$[ebp]
	add	eax, 29568				; 00007380H
	push	eax
	call	_dyntab_filter_field
	add	esp, 24					; 00000018H
	test	eax, eax
	je	SHORT $L70790
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29872], OFFSET FLAT:$SG70793
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 752		; 000002f0H
	jmp	$eva_err$70683
$L70790:

; 753  : 
; 754  : 	/* Handle IP filter */
; 755  : 	if(cntxt->user_ip && strcmp(cntxt->user_ip, "127.0.0.1"))

	mov	eax, DWORD PTR _cntxt$[ebp]
	cmp	DWORD PTR [eax+29732], 0
	je	$L70817
	push	OFFSET FLAT:$SG70795
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	edx, DWORD PTR [ecx+29732]
	push	edx
	call	_strcmp
	add	esp, 8
	test	eax, eax
	je	$L70817

; 757  : 		/* Get user or server filter */
; 758  : 		char *filtmode = DYNTAB_FIELD_VAL(&cntxt->user_data, IP_FILTER);

	push	0
	push	-1
	push	OFFSET FLAT:$SG70797
	mov	eax, DWORD PTR _cntxt$[ebp]
	add	eax, 29428				; 000072f4H
	push	eax
	call	_dyntab_field_val
	add	esp, 16					; 00000010H
	mov	DWORD PTR _filtmode$70796[ebp], eax

; 759  : 		DYNTAB_FIELD(&debug, &cntxt->user_data, ACCESS_IP);

	lea	ecx, DWORD PTR _debug$[ebp]
	push	ecx
	call	_dyntab_free
	add	esp, 4
	push	0
	push	-1
	push	OFFSET FLAT:$SG70800
	mov	edx, DWORD PTR _cntxt$[ebp]
	add	edx, 29428				; 000072f4H
	push	edx
	push	0
	lea	eax, DWORD PTR _debug$[ebp]
	push	eax
	call	_dyntab_filter_field
	add	esp, 24					; 00000018H
	test	eax, eax
	je	SHORT $L70799
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29872], OFFSET FLAT:$SG70802
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 759		; 000002f7H
	jmp	$eva_err$70683
$L70799:

; 760  : 		if(!*filtmode)

	mov	eax, DWORD PTR _filtmode$70796[ebp]
	movsx	ecx, BYTE PTR [eax]
	test	ecx, ecx
	jne	SHORT $L70806

; 762  : 			filtmode = DYNTAB_FIELD_VAL(&cntxt->cnf_data, IP_FILTER);

	push	0
	push	-1
	push	OFFSET FLAT:$SG70804
	mov	edx, DWORD PTR _cntxt$[ebp]
	add	edx, 29360				; 000072b0H
	push	edx
	call	_dyntab_field_val
	add	esp, 16					; 00000010H
	mov	DWORD PTR _filtmode$70796[ebp], eax

; 763  : 			DYNTAB_FIELD(&debug, &cntxt->cnf_data, ACCESS_IP);

	lea	eax, DWORD PTR _debug$[ebp]
	push	eax
	call	_dyntab_free
	add	esp, 4
	push	0
	push	-1
	push	OFFSET FLAT:$SG70807
	mov	ecx, DWORD PTR _cntxt$[ebp]
	add	ecx, 29360				; 000072b0H
	push	ecx
	push	0
	lea	edx, DWORD PTR _debug$[ebp]
	push	edx
	call	_dyntab_filter_field
	add	esp, 24					; 00000018H
	test	eax, eax
	je	SHORT $L70806
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29872], OFFSET FLAT:$SG70809
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 763		; 000002fbH
	jmp	$eva_err$70683
$L70806:

; 765  : 
; 766  : 		/* Check IP adress if filtering active */
; 767  : 		if(cntxt->user_ip && *filtmode && debug.nbrows)

	mov	edx, DWORD PTR _cntxt$[ebp]
	cmp	DWORD PTR [edx+29732], 0
	je	$L70817
	mov	eax, DWORD PTR _filtmode$70796[ebp]
	movsx	ecx, BYTE PTR [eax]
	test	ecx, ecx
	je	$L70817
	cmp	DWORD PTR _debug$[ebp], 0
	je	$L70817

; 769  : 			/* Check if user IP is in given address list */
; 770  : 			unsigned long i;
; 771  : 			for(i = 0; i < debug.nbrows; i++)

	mov	DWORD PTR _i$70811[ebp], 0
	jmp	SHORT $L70812
$L70813:
	mov	edx, DWORD PTR _i$70811[ebp]
	add	edx, 1
	mov	DWORD PTR _i$70811[ebp], edx
$L70812:
	mov	eax, DWORD PTR _i$70811[ebp]
	cmp	eax, DWORD PTR _debug$[ebp]
	jae	SHORT $L70814

; 773  : 				DynTableCell *c = dyntab_cell(&debug, i, 0);

	push	0
	mov	ecx, DWORD PTR _i$70811[ebp]
	push	ecx
	lea	edx, DWORD PTR _debug$[ebp]
	push	edx
	call	_dyntab_cell
	add	esp, 12					; 0000000cH
	mov	DWORD PTR _c$70815[ebp], eax

; 774  : 				if(!strncmp(cntxt->user_ip, c->txt, c->len)) break;

	mov	eax, DWORD PTR _c$70815[ebp]
	mov	ecx, DWORD PTR [eax+4]
	push	ecx
	mov	edx, DWORD PTR _c$70815[ebp]
	mov	eax, DWORD PTR [edx]
	push	eax
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	edx, DWORD PTR [ecx+29732]
	push	edx
	call	_strncmp
	add	esp, 12					; 0000000cH
	test	eax, eax
	jne	SHORT $L70816
	jmp	SHORT $L70814
$L70816:

; 775  : 			}

	jmp	SHORT $L70813
$L70814:

; 776  : 
; 777  : 			/* Handle allow / deny mode to grant access */
; 778  : 			if(strcmp(filtmode, "_EVA_ALLOW") ? i < debug.nbrows : i == debug.nbrows)

	push	OFFSET FLAT:$SG70818
	mov	eax, DWORD PTR _filtmode$70796[ebp]
	push	eax
	call	_strcmp
	add	esp, 8
	test	eax, eax
	je	SHORT $L70894
	mov	ecx, DWORD PTR _i$70811[ebp]
	cmp	ecx, DWORD PTR _debug$[ebp]
	sbb	edx, edx
	neg	edx
	mov	DWORD PTR -1336+[ebp], edx
	jmp	SHORT $L70895
$L70894:
	mov	eax, DWORD PTR _i$70811[ebp]
	xor	ecx, ecx
	cmp	eax, DWORD PTR _debug$[ebp]
	sete	cl
	mov	DWORD PTR -1336+[ebp], ecx
$L70895:
	cmp	DWORD PTR -1336+[ebp], 0
	je	SHORT $L70817

; 780  : 				/* Access denied : output message & terminate */
; 781  : 				output_message(cntxt,"Vous n'êtes pas autorisé à accéder à ce serveur");

	push	OFFSET FLAT:$SG70819
	mov	edx, DWORD PTR _cntxt$[ebp]
	push	edx
	call	_output_message
	add	esp, 8

; 782  : 				cntxt->txsize += printf(
; 783  : 					"<br>Motif : adresse IP non conforme<br><br>"
; 784  : 					"<br>Contactez l'administrateur pour obtenir l'accès<br><br>");

	push	OFFSET FLAT:$SG70820
	call	_printf
	add	esp, 4
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	edx, DWORD PTR [ecx+32036]
	add	edx, eax
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+32036], edx
$L70817:

; 788  : 
; 789  : 	/* Handle referer : clear if same application */
; 790  : 	if(referer)

	cmp	DWORD PTR _referer$[ebp], 0
	je	SHORT $L70823

; 792  : 		snprintf(add_sz_str(printbuf), "/eva/%s.cgi", cntxt->dbname);

	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	edx, DWORD PTR [ecx+29804]
	push	edx
	push	OFFSET FLAT:$SG70822
	push	1023					; 000003ffH
	lea	eax, DWORD PTR _printbuf$[ebp]
	push	eax
	call	__snprintf
	add	esp, 16					; 00000010H

; 793  : 		if(strstr(referer, printbuf)) referer = NULL;

	lea	ecx, DWORD PTR _printbuf$[ebp]
	push	ecx
	mov	edx, DWORD PTR _referer$[ebp]
	push	edx
	call	_strstr
	add	esp, 8
	test	eax, eax
	je	SHORT $L70823
	mov	DWORD PTR _referer$[ebp], 0
$L70823:

; 798  : 		char *src = strstr(cntxt->qrystr, "Source=");

	push	OFFSET FLAT:$SG70826
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	ecx, DWORD PTR [eax+29736]
	push	ecx
	call	_strstr
	add	esp, 8
	mov	DWORD PTR _src$70825[ebp], eax

; 799  : 		if(src) sourceref = strtoul(src + 7, NULL, 10);

	cmp	DWORD PTR _src$70825[ebp], 0
	je	SHORT $L70827
	push	10					; 0000000aH
	push	0
	mov	edx, DWORD PTR _src$70825[ebp]
	add	edx, 7
	push	edx
	call	_strtoul
	add	esp, 12					; 0000000cH
	mov	DWORD PTR _sourceref$[ebp], eax
$L70827:

; 801  : 
; 802  : 	/* Create session if not first call or known workstation or referer */
; 803  : 	if(!cntxt->session.nbrows && (cntxt->nb_cgi || cntxt->objwks || referer || sourceref))

	mov	eax, DWORD PTR _cntxt$[ebp]
	cmp	DWORD PTR [eax+29300], 0
	jne	$L70834
	mov	ecx, DWORD PTR _cntxt$[ebp]
	cmp	DWORD PTR [ecx+29652], 0
	jne	SHORT $L70830
	mov	edx, DWORD PTR _cntxt$[ebp]
	cmp	DWORD PTR [edx+29828], 0
	jne	SHORT $L70830
	cmp	DWORD PTR _referer$[ebp], 0
	jne	SHORT $L70830
	cmp	DWORD PTR _sourceref$[ebp], 0
	je	$L70834
$L70830:

; 805  : 		unsigned long idsession = strtoul(DYNTAB_FIELD_VAL(&cntxt->cnf_data, FORM_SESSION), NULL, 10);

	push	10					; 0000000aH
	push	0
	push	0
	push	-1
	push	OFFSET FLAT:$SG70833
	mov	eax, DWORD PTR _cntxt$[ebp]
	add	eax, 29360				; 000072b0H
	push	eax
	call	_dyntab_field_val
	add	esp, 16					; 00000010H
	push	eax
	call	_strtoul
	add	esp, 12					; 0000000cH
	mov	DWORD PTR _idsession$70831[ebp], eax

; 806  : 		if(idsession && (
; 807  : 			qry_add_new_obj(cntxt, &cntxt->session, idsession) ||
; 808  : 			qry_add_obj_field_val(cntxt, &cntxt->session, "_EVA_USER_IP", cntxt->user_ip, 0, 0, 1) ||
; 809  : 			qry_add_obj_field_val(cntxt, &cntxt->session, "_EVA_USER_AGENT", cntxt->user_agent, 0, 0, 1) ||
; 810  : 			qry_add_obj_field_val(cntxt, &cntxt->session, "_EVA_USER", DYNTAB_VAL_SZ(&cntxt->id_user, 0, 0), 1, 1)))

	cmp	DWORD PTR _idsession$70831[ebp], 0
	je	$L70834
	mov	ecx, DWORD PTR _idsession$70831[ebp]
	push	ecx
	mov	edx, DWORD PTR _cntxt$[ebp]
	add	edx, 29300				; 00007274H
	push	edx
	mov	eax, DWORD PTR _cntxt$[ebp]
	push	eax
	call	_qry_add_new_obj
	add	esp, 12					; 0000000cH
	test	eax, eax
	jne	$L70835
	push	1
	push	0
	push	0
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	edx, DWORD PTR [ecx+29732]
	push	edx
	push	OFFSET FLAT:$SG70836
	mov	eax, DWORD PTR _cntxt$[ebp]
	add	eax, 29300				; 00007274H
	push	eax
	mov	ecx, DWORD PTR _cntxt$[ebp]
	push	ecx
	call	_qry_add_obj_field_val
	add	esp, 28					; 0000001cH
	test	eax, eax
	jne	SHORT $L70835
	push	1
	push	0
	push	0
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	eax, DWORD PTR [edx+29748]
	push	eax
	push	OFFSET FLAT:$SG70837
	mov	ecx, DWORD PTR _cntxt$[ebp]
	add	ecx, 29300				; 00007274H
	push	ecx
	mov	edx, DWORD PTR _cntxt$[ebp]
	push	edx
	call	_qry_add_obj_field_val
	add	esp, 28					; 0000001cH
	test	eax, eax
	jne	SHORT $L70835
	push	1
	push	1
	push	0
	push	0
	mov	eax, DWORD PTR _cntxt$[ebp]
	add	eax, 29408				; 000072e0H
	push	eax
	call	_dyntab_sz
	add	esp, 12					; 0000000cH
	push	eax
	push	0
	push	0
	mov	ecx, DWORD PTR _cntxt$[ebp]
	add	ecx, 29408				; 000072e0H
	push	ecx
	call	_dyntab_val
	add	esp, 12					; 0000000cH
	push	eax
	push	OFFSET FLAT:$SG70838
	mov	edx, DWORD PTR _cntxt$[ebp]
	add	edx, 29300				; 00007274H
	push	edx
	mov	eax, DWORD PTR _cntxt$[ebp]
	push	eax
	call	_qry_add_obj_field_val
	add	esp, 28					; 0000001cH
	test	eax, eax
	je	SHORT $L70834
$L70835:

; 811  : 			STACK_ERROR;

	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 811		; 0000032bH
	jmp	$eva_err$70683
$L70834:

; 813  : 
; 814  : 	/* Add workstation to session if applicable */
; 815  : 	if(cntxt->session.nbrows && cntxt->objwks && !DYNTAB_FIELD_CELL(&cntxt->sess_data, WKS) &&
; 816  : 			qry_add_idobj_field_rel(cntxt, DYNTAB_TOUL(&cntxt->session), "_EVA_WKS", cntxt->objwks, 1, 0, 1))

	mov	edx, DWORD PTR _cntxt$[ebp]
	cmp	DWORD PTR [edx+29300], 0
	je	$L70840
	mov	eax, DWORD PTR _cntxt$[ebp]
	cmp	DWORD PTR [eax+29828], 0
	je	SHORT $L70840
	push	0
	push	-1
	push	OFFSET FLAT:$SG70841
	mov	ecx, DWORD PTR _cntxt$[ebp]
	add	ecx, 29320				; 00007288H
	push	ecx
	call	_dyntab_field_cell
	add	esp, 16					; 00000010H
	test	eax, eax
	jne	SHORT $L70840
	push	1
	push	0
	push	1
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	eax, DWORD PTR [edx+29828]
	push	eax
	push	OFFSET FLAT:$SG70842
	push	10					; 0000000aH
	push	0
	push	0
	push	0
	mov	ecx, DWORD PTR _cntxt$[ebp]
	add	ecx, 29300				; 00007274H
	push	ecx
	call	_dyntab_val
	add	esp, 12					; 0000000cH
	push	eax
	call	_strtoul
	add	esp, 12					; 0000000cH
	push	eax
	mov	edx, DWORD PTR _cntxt$[ebp]
	push	edx
	call	_qry_add_idobj_field_rel
	add	esp, 28					; 0000001cH
	test	eax, eax
	je	SHORT $L70840

; 817  : 		STACK_ERROR;

	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 817		; 00000331H
	jmp	$eva_err$70683
$L70840:

; 818  : 
; 819  : 	/* Store source reference in session if applicable */
; 820  : 	if(sourceref && qry_add_idobj_field_rel(cntxt, DYNTAB_TOUL(&cntxt->session), "_EVA_SOURCE_REF", sourceref, 0, 0, 1)) STACK_ERROR;

	cmp	DWORD PTR _sourceref$[ebp], 0
	je	SHORT $L70844
	push	1
	push	0
	push	0
	mov	ecx, DWORD PTR _sourceref$[ebp]
	push	ecx
	push	OFFSET FLAT:$SG70845
	push	10					; 0000000aH
	push	0
	push	0
	push	0
	mov	edx, DWORD PTR _cntxt$[ebp]
	add	edx, 29300				; 00007274H
	push	edx
	call	_dyntab_val
	add	esp, 12					; 0000000cH
	push	eax
	call	_strtoul
	add	esp, 12					; 0000000cH
	push	eax
	mov	eax, DWORD PTR _cntxt$[ebp]
	push	eax
	call	_qry_add_idobj_field_rel
	add	esp, 28					; 0000001cH
	test	eax, eax
	je	SHORT $L70844
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 820		; 00000334H
	jmp	SHORT $eva_err$70683
$L70844:

; 821  : 
; 822  : 	/* Store referer in session if applicable */
; 823  : 	if(referer && qry_add_obj_field_val(cntxt, &cntxt->session, "_EVA_REFERER", referer, 0, 0, 1)) STACK_ERROR;

	cmp	DWORD PTR _referer$[ebp], 0
	je	SHORT $L70846
	push	1
	push	0
	push	0
	mov	edx, DWORD PTR _referer$[ebp]
	push	edx
	push	OFFSET FLAT:$SG70847
	mov	eax, DWORD PTR _cntxt$[ebp]
	add	eax, 29300				; 00007274H
	push	eax
	mov	ecx, DWORD PTR _cntxt$[ebp]
	push	ecx
	call	_qry_add_obj_field_val
	add	esp, 28					; 0000001cH
	test	eax, eax
	je	SHORT $L70846
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 823		; 00000337H
	jmp	SHORT $eva_err$70683
$L70846:

; 824  : 
; 825  : 	/* Set base directory */
; 826  : 	chdir(cntxt->rootdir); chdir("cgi");

	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	ecx, DWORD PTR [eax+29724]
	push	ecx
	call	_chdir
	add	esp, 4
	push	OFFSET FLAT:$SG70848
	call	_chdir
	add	esp, 4
$eva_noerr$70697:

; 827  : 
; 828  : 	RETURN_OK_CLEANUP;

	push	0
	push	OFFSET FLAT:$SG70849
	push	OFFSET FLAT:$SG70850
	mov	edx, DWORD PTR _cntxt$[ebp]
	push	edx
	call	_err_clear
	add	esp, 16					; 00000010H
$eva_err$70683:
	mov	eax, DWORD PTR _cntxt$[ebp]
	cmp	DWORD PTR [eax+29872], 0
	je	SHORT $L70851
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	edx, DWORD PTR [ecx+29900]
	push	edx
	push	OFFSET FLAT:$SG70852
	push	OFFSET FLAT:$SG70853
	mov	eax, DWORD PTR _cntxt$[ebp]
	push	eax
	call	_err_add_context
	add	esp, 16					; 00000010H
$L70851:
	lea	ecx, DWORD PTR _sqlres$[ebp]
	push	ecx
	call	_dyntab_free
	add	esp, 4
	lea	edx, DWORD PTR _debug$[ebp]
	push	edx
	call	_dyntab_free
	add	esp, 4
	lea	eax, DWORD PTR _id_form$[ebp]
	push	eax
	call	_dyntab_free
	add	esp, 4
	mov	ecx, DWORD PTR _sql$[ebp]
	push	ecx
	call	_mem_free
	add	esp, 4
	mov	DWORD PTR _sql$[ebp], 0
	mov	edx, DWORD PTR _cntxt$[ebp]
	xor	eax, eax
	cmp	DWORD PTR [edx+29872], 0
	setne	al

; 829  : }

	pop	edi
	mov	esp, ebp
	pop	ebp
	ret	0
_check_login ENDP
_TEXT	ENDS
END
