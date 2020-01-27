	TITLE	D:\Travail\ABI\EVA\V4.0\CGI\Brunix-2016\form_mode_search.c
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
PUBLIC	_form_mode_search
EXTRN	_put_html_list:NEAR
EXTRN	_sprintf:NEAR
EXTRN	_cgi_value_setkeep:NEAR
EXTRN	_sql_exec_query:NEAR
EXTRN	_mem_free:NEAR
EXTRN	_obj_put_html_btn_label:NEAR
EXTRN	_qry_values_list:NEAR
EXTRN	_plain_to_html:BYTE
EXTRN	_dynbuf_add:NEAR
EXTRN	_dynbuf_add3:NEAR
EXTRN	_dyntab_free:NEAR
EXTRN	_sql_get_table:NEAR
EXTRN	_dyntab_sz:NEAR
EXTRN	_dyntab_val:NEAR
EXTRN	_dyntab_cell:NEAR
EXTRN	_dyntab_copy:NEAR
EXTRN	_dyntab_add:NEAR
EXTRN	_strcmp:NEAR
EXTRN	_err_add_context:NEAR
EXTRN	_err_clear:NEAR
_BSS	SEGMENT
$SG70234 DB	01H DUP (?)
_BSS	ENDS
_DATA	SEGMENT
$SG70219 DB	'-- form_mode_search : Query fields ', 0aH, 'SELECT DISTI'
	DB	'NCT TLink.IdField,TField.TxtValue,COUNT(TLink.Pkey) ', 0aH, 'F'
	DB	'ROM TLink INNER JOIN TLink AS TLink1 ON TLink1.IdObj = TLink.'
	DB	'IdObj ', 0aH, 'INNER JOIN TVal AS TField ON TLink.IdField = T'
	DB	'Field.IdValue ', 0aH, 'WHERE TLink1.IdField=%lu AND TLink1.Id'
	DB	'RelObj=%s AND TLink.DateDel IS NULL AND TLink1.DateDel IS NUL'
	DB	'L ', 0aH, 'GROUP BY TLink.IdField,TField.TxtValue ', 0aH, 00H
	ORG $+2
$SG70233 DB	' ', 00H
	ORG $+2
$SG70236 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70240 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70243 DB	')', 00H
	ORG $+2
$SG70244 DB	' (', 00H
	ORG $+1
$SG70246 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70251 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70257 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70264 DB	'<td><font face=Arial><table cellspacing=0 cellpadding=0 '
	DB	'border=0 rules=none><tr>', 0aH, '<td>Rechercher dans<br>', 0aH
	DB	00H
	ORG $+2
$SG70266 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70270 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70275 DB	'</td>', 00H
	ORG $+2
$SG70277 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70280 DB	'-- form_mode_search : Query values for selected fields ', 0aH
	DB	'SELECT DISTINCT TLink.IdValue,TVal.TxtValue,TLink.IdRelObj,CO'
	DB	'UNT(TLink.IdObj) ', 0aH, 'FROM TLink INNER JOIN TLink AS TLin'
	DB	'k1 ON TLink1.IdObj = TLink.IdObj ', 0aH, 'LEFT JOIN TVal ON T'
	DB	'Link.IdValue = TVal.IdValue ', 0aH, 'WHERE TLink1.IdField=%lu'
	DB	' AND TLink1.IdRelObj=%s AND TLink1.DateDel IS NULL ', 0aH, 'A'
	DB	'ND TLink.IdField IN(%s) ', 0aH, 'GROUP BY TLink.IdValue,TVal.'
	DB	'TxtValue,TLink.IdRelObj ', 0aH, 00H
$SG70285 DB	'<td>Valeurs<br>', 0aH, 00H
	ORG $+3
$SG70287 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70294 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70299 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70301 DB	')<br>', 00H
	ORG $+2
$SG70302 DB	' (', 00H
	ORG $+1
$SG70304 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70307 DB	'</td>', 00H
	ORG $+2
$SG70309 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70312 DB	'</tr></table></font></td>', 00H
	ORG $+2
$SG70314 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70316 DB	'D:\Travail\ABI\EVA\V4.0\CGI\Brunix-2016\form_mode_search'
	DB	'.c', 00H
	ORG $+1
$SG70317 DB	'form_mode_search', 00H
	ORG $+3
$SG70319 DB	'D:\Travail\ABI\EVA\V4.0\CGI\Brunix-2016\form_mode_search'
	DB	'.c', 00H
	ORG $+1
$SG70320 DB	'form_mode_search', 00H
_DATA	ENDS
_TEXT	SEGMENT
_cntxt$ = 8
_form$ = -1028
_ctrl$ = -1108
_fields$ = -1052
_values$ = -1096
_selfields$ = -1072
_buf$ = -1032
_name$ = -1104
_sql$ = -1024
_i$ = -1076
_i_ctrl$ = -1100
__i$70258 = -1112
_form_mode_search PROC NEAR

; 28   : ){

	push	ebp
	mov	ebp, esp
	sub	esp, 1116				; 0000045cH

; 29   : 	EVA_form *form = cntxt->form;

	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	ecx, DWORD PTR [eax+80]
	mov	DWORD PTR _form$[ebp], ecx

; 30   : 	EVA_ctrl *ctrl = form->ctrl;

	mov	edx, DWORD PTR _form$[ebp]
	mov	eax, DWORD PTR [edx]
	mov	DWORD PTR _ctrl$[ebp], eax

; 31   : 	DynTable fields = { 0 };

	mov	DWORD PTR _fields$[ebp], 0
	xor	ecx, ecx
	mov	DWORD PTR _fields$[ebp+4], ecx
	mov	DWORD PTR _fields$[ebp+8], ecx
	mov	DWORD PTR _fields$[ebp+12], ecx
	mov	DWORD PTR _fields$[ebp+16], ecx

; 32   : 	DynTable values = { 0 };

	mov	DWORD PTR _values$[ebp], 0
	xor	edx, edx
	mov	DWORD PTR _values$[ebp+4], edx
	mov	DWORD PTR _values$[ebp+8], edx
	mov	DWORD PTR _values$[ebp+12], edx
	mov	DWORD PTR _values$[ebp+16], edx

; 33   : 	DynTable selfields = { 0 };

	mov	DWORD PTR _selfields$[ebp], 0
	xor	eax, eax
	mov	DWORD PTR _selfields$[ebp+4], eax
	mov	DWORD PTR _selfields$[ebp+8], eax
	mov	DWORD PTR _selfields$[ebp+12], eax
	mov	DWORD PTR _selfields$[ebp+16], eax

; 34   : 	DynBuffer *buf = NULL;

	mov	DWORD PTR _buf$[ebp], 0

; 35   : 	DynBuffer *name = NULL;

	mov	DWORD PTR _name$[ebp], 0

; 36   : 	char sql[1024];
; 37   : 	unsigned long i, i_ctrl;
; 38   : 
; 39   : 	/* Query fields in objects having this formstamp */
; 40   : 	sprintf(sql, 
; 41   : 		"-- form_mode_search : Query fields \n"
; 42   : 		"SELECT DISTINCT TLink.IdField,TField.TxtValue,COUNT(TLink.Pkey) \n"
; 43   : 		"FROM TLink INNER JOIN TLink AS TLink1 ON TLink1.IdObj = TLink.IdObj \n"
; 44   : 		"INNER JOIN TVal AS TField ON TLink.IdField = TField.IdValue \n"
; 45   : 		"WHERE TLink1.IdField=%lu AND TLink1.IdRelObj=%s AND TLink.DateDel IS NULL AND TLink1.DateDel IS NULL \n" 
; 46   : 		"GROUP BY TLink.IdField,TField.TxtValue \n", 
; 47   : 		cntxt->val_FORMSTAMP, dyntab_val(&form->id_form, 0, 0));

	push	0
	push	0
	mov	ecx, DWORD PTR _form$[ebp]
	add	ecx, 12					; 0000000cH
	push	ecx
	call	_dyntab_val
	add	esp, 12					; 0000000cH
	push	eax
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	eax, DWORD PTR [edx+269636]
	push	eax
	push	OFFSET FLAT:$SG70219
	lea	ecx, DWORD PTR _sql$[ebp]
	push	ecx
	call	_sprintf
	add	esp, 16					; 00000010H

; 48   : 	if(sql_exec_query(cntxt, sql) || sql_get_table(cntxt, &fields, 2)) STACK_ERROR;

	lea	edx, DWORD PTR _sql$[ebp]
	push	edx
	mov	eax, DWORD PTR _cntxt$[ebp]
	push	eax
	call	_sql_exec_query
	add	esp, 8
	test	eax, eax
	jne	SHORT $L70221
	push	2
	lea	ecx, DWORD PTR _fields$[ebp]
	push	ecx
	mov	edx, DWORD PTR _cntxt$[ebp]
	push	edx
	call	_sql_get_table
	add	esp, 12					; 0000000cH
	test	eax, eax
	je	SHORT $L70220
$L70221:
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 48		; 00000030H
	jmp	$eva_err$70222
$L70220:

; 49   : 
; 50   : 	/* Build fields list */
; 51   : 	for(i = 0; i < fields.nbrows; i++)

	mov	DWORD PTR _i$[ebp], 0
	jmp	SHORT $L70223
$L70224:
	mov	ecx, DWORD PTR _i$[ebp]
	add	ecx, 1
	mov	DWORD PTR _i$[ebp], ecx
$L70223:
	mov	edx, DWORD PTR _i$[ebp]
	cmp	edx, DWORD PTR _fields$[ebp]
	jae	$L70225

; 53   : 		/* Search for control with same field */
; 54   : 		for(i_ctrl = 0; i_ctrl < form->nb_ctrl &&
; 55   : 			strcmp(form->ctrl[i_ctrl].FIELD, dyntab_val(&fields, i, 1)); i_ctrl++);

	mov	DWORD PTR _i_ctrl$[ebp], 0
	jmp	SHORT $L70226
$L70227:
	mov	eax, DWORD PTR _i_ctrl$[ebp]
	add	eax, 1
	mov	DWORD PTR _i_ctrl$[ebp], eax
$L70226:
	mov	ecx, DWORD PTR _form$[ebp]
	mov	edx, DWORD PTR _i_ctrl$[ebp]
	cmp	edx, DWORD PTR [ecx+4]
	jae	SHORT $L70228
	push	1
	mov	eax, DWORD PTR _i$[ebp]
	push	eax
	lea	ecx, DWORD PTR _fields$[ebp]
	push	ecx
	call	_dyntab_val
	add	esp, 12					; 0000000cH
	push	eax
	mov	edx, DWORD PTR _i_ctrl$[ebp]
	imul	edx, 480				; 000001e0H
	mov	eax, DWORD PTR _form$[ebp]
	mov	ecx, DWORD PTR [eax]
	mov	edx, DWORD PTR [ecx+edx+280]
	push	edx
	call	_strcmp
	add	esp, 8
	test	eax, eax
	je	SHORT $L70228
	jmp	SHORT $L70227
$L70228:

; 56   : 		ctrl = i_ctrl < form->nb_ctrl ? form->ctrl + i_ctrl : NULL;

	mov	eax, DWORD PTR _form$[ebp]
	mov	ecx, DWORD PTR _i_ctrl$[ebp]
	cmp	ecx, DWORD PTR [eax+4]
	jae	SHORT $L70325
	mov	edx, DWORD PTR _i_ctrl$[ebp]
	imul	edx, 480				; 000001e0H
	mov	eax, DWORD PTR _form$[ebp]
	mov	ecx, DWORD PTR [eax]
	add	ecx, edx
	mov	DWORD PTR -1116+[ebp], ecx
	jmp	SHORT $L70326
$L70325:
	mov	DWORD PTR -1116+[ebp], 0
$L70326:
	mov	edx, DWORD PTR -1116+[ebp]
	mov	DWORD PTR _ctrl$[ebp], edx

; 57   : 
; 58   : 		/* Set option label with control label, field name & nb of objects */
; 59   : 		if(ctrl) DYNBUF_ADD3(&buf, "", ctrl->LABEL, 0, NO_CONV, " ");

	cmp	DWORD PTR _ctrl$[ebp], 0
	je	SHORT $L70232
	push	1
	push	OFFSET FLAT:$SG70233
	push	0
	push	0
	push	0
	mov	eax, DWORD PTR _ctrl$[ebp]
	mov	ecx, DWORD PTR [eax+284]
	push	ecx
	push	0
	push	OFFSET FLAT:$SG70234
	lea	edx, DWORD PTR _buf$[ebp]
	push	edx
	call	_dynbuf_add3
	add	esp, 36					; 00000024H
	test	eax, eax
	je	SHORT $L70232
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29872], OFFSET FLAT:$SG70236
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 59		; 0000003bH
	jmp	$eva_err$70222
$L70232:

; 60   : 		DYNBUF_ADD_CELL(&buf, &fields, i, 1, NO_CONV);

	push	0
	push	0
	push	1
	mov	edx, DWORD PTR _i$[ebp]
	push	edx
	lea	eax, DWORD PTR _fields$[ebp]
	push	eax
	call	_dyntab_sz
	add	esp, 12					; 0000000cH
	push	eax
	push	1
	mov	ecx, DWORD PTR _i$[ebp]
	push	ecx
	lea	edx, DWORD PTR _fields$[ebp]
	push	edx
	call	_dyntab_val
	add	esp, 12					; 0000000cH
	push	eax
	lea	eax, DWORD PTR _buf$[ebp]
	push	eax
	call	_dynbuf_add
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L70238
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29872], OFFSET FLAT:$SG70240
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 60		; 0000003cH
	jmp	$eva_err$70222
$L70238:

; 61   : 		DYNBUF_ADD3_CELL(&buf, " (", &fields, i, 2, NO_CONV, ")");

	push	1
	push	OFFSET FLAT:$SG70243
	push	0
	push	0
	push	2
	mov	eax, DWORD PTR _i$[ebp]
	push	eax
	lea	ecx, DWORD PTR _fields$[ebp]
	push	ecx
	call	_dyntab_sz
	add	esp, 12					; 0000000cH
	push	eax
	push	2
	mov	edx, DWORD PTR _i$[ebp]
	push	edx
	lea	eax, DWORD PTR _fields$[ebp]
	push	eax
	call	_dyntab_val
	add	esp, 12					; 0000000cH
	push	eax
	push	2
	push	OFFSET FLAT:$SG70244
	lea	ecx, DWORD PTR _buf$[ebp]
	push	ecx
	call	_dynbuf_add3
	add	esp, 36					; 00000024H
	test	eax, eax
	je	SHORT $L70242
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29872], OFFSET FLAT:$SG70246
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 61		; 0000003dH
	jmp	$eva_err$70222
$L70242:

; 62   : 		DYNTAB_ADD_BUF(&fields, i, 1, buf);

	cmp	DWORD PTR _buf$[ebp], 0
	je	SHORT $L70247
	mov	ecx, DWORD PTR _buf$[ebp]
	cmp	DWORD PTR [ecx+4], 0
	je	SHORT $L70247
	push	0
	push	0
	mov	edx, DWORD PTR _buf$[ebp]
	mov	eax, DWORD PTR [edx+4]
	push	eax
	mov	ecx, DWORD PTR _buf$[ebp]
	add	ecx, 8
	push	ecx
	push	1
	mov	edx, DWORD PTR _i$[ebp]
	push	edx
	lea	eax, DWORD PTR _fields$[ebp]
	push	eax
	call	_dyntab_add
	add	esp, 28					; 0000001cH
	test	eax, eax
	je	SHORT $L70249
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29872], OFFSET FLAT:$SG70251
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 62		; 0000003eH
	jmp	$eva_err$70222
$L70249:
	jmp	SHORT $L70255
$L70247:
	push	0
	push	0
	push	0
	push	0
	push	1
	mov	eax, DWORD PTR _i$[ebp]
	push	eax
	lea	ecx, DWORD PTR _fields$[ebp]
	push	ecx
	call	_dyntab_add
	add	esp, 28					; 0000001cH
	test	eax, eax
	je	SHORT $L70255
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29872], OFFSET FLAT:$SG70257
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 62		; 0000003eH
	jmp	$eva_err$70222
$L70255:

; 63   : 		M_FREE(buf);

	mov	ecx, DWORD PTR _buf$[ebp]
	push	ecx
	call	_mem_free
	add	esp, 4
	mov	DWORD PTR _buf$[ebp], 0

; 64   : 	}

	jmp	$L70224
$L70225:

; 65   : 	
; 66   : 	/* Output fields list */
; 67   : 	CGI_VALUES_DONTKEEP(&selfields)

	mov	DWORD PTR __i$70258[ebp], 0
	jmp	SHORT $L70259
$L70260:
	mov	edx, DWORD PTR __i$70258[ebp]
	add	edx, 1
	mov	DWORD PTR __i$70258[ebp], edx
$L70259:
	mov	eax, DWORD PTR __i$70258[ebp]
	cmp	eax, DWORD PTR _selfields$[ebp]
	jae	SHORT $L70261
	push	1
	mov	ecx, DWORD PTR __i$70258[ebp]
	push	ecx
	lea	edx, DWORD PTR _selfields$[ebp]
	push	edx
	mov	eax, DWORD PTR _cntxt$[ebp]
	push	eax
	call	_cgi_value_setkeep
	add	esp, 16					; 00000010H
	jmp	SHORT $L70260
$L70261:

; 68   : 	form->html = &cntxt->html;

	mov	ecx, DWORD PTR _cntxt$[ebp]
	add	ecx, 29784				; 00007458H
	mov	edx, DWORD PTR _form$[ebp]
	mov	DWORD PTR [edx+232], ecx

; 70   : 		"<td><font face=Arial>"
; 71   : 		"<table cellspacing=0 cellpadding=0 border=0 rules=none><tr>\n"
; 72   : 		"<td>Rechercher dans<br>\n");

	push	0
	push	0
	push	105					; 00000069H
	push	OFFSET FLAT:$SG70264
	mov	eax, DWORD PTR _form$[ebp]
	mov	ecx, DWORD PTR [eax+232]
	push	ecx
	call	_dynbuf_add
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L70263
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29872], OFFSET FLAT:$SG70266
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 72		; 00000048H
	jmp	$eva_err$70222
$L70263:

; 73   : 	DYNBUF_ADD_BUF(&name, form->ctrl->cginame, NO_CONV);

	mov	ecx, DWORD PTR _form$[ebp]
	mov	edx, DWORD PTR [ecx]
	cmp	DWORD PTR [edx+40], 0
	je	SHORT $L70268
	push	0
	push	0
	mov	eax, DWORD PTR _form$[ebp]
	mov	ecx, DWORD PTR [eax]
	mov	edx, DWORD PTR [ecx+40]
	mov	eax, DWORD PTR [edx+4]
	push	eax
	mov	ecx, DWORD PTR _form$[ebp]
	mov	edx, DWORD PTR [ecx]
	mov	eax, DWORD PTR [edx+40]
	add	eax, 8
	push	eax
	lea	ecx, DWORD PTR _name$[ebp]
	push	ecx
	call	_dynbuf_add
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L70268
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29872], OFFSET FLAT:$SG70270
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 73		; 00000049H
	jmp	$eva_err$70222
$L70268:

; 74   : 	if(put_html_list(cntxt, name, &fields, &selfields, 30, 0, 1, 1, 0, NULL)) STACK_ERROR;

	push	0
	push	0
	push	1
	push	1
	push	0
	push	30					; 0000001eH
	lea	ecx, DWORD PTR _selfields$[ebp]
	push	ecx
	lea	edx, DWORD PTR _fields$[ebp]
	push	edx
	mov	eax, DWORD PTR _name$[ebp]
	push	eax
	mov	ecx, DWORD PTR _cntxt$[ebp]
	push	ecx
	call	_put_html_list
	add	esp, 40					; 00000028H
	test	eax, eax
	je	SHORT $L70272
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 74		; 0000004aH
	jmp	$eva_err$70222
$L70272:

; 75   : 	DYNBUF_ADD_STR(form->html, "</td>");

	push	0
	push	0
	push	5
	push	OFFSET FLAT:$SG70275
	mov	eax, DWORD PTR _form$[ebp]
	mov	ecx, DWORD PTR [eax+232]
	push	ecx
	call	_dynbuf_add
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L70274
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29872], OFFSET FLAT:$SG70277
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 75		; 0000004bH
	jmp	$eva_err$70222
$L70274:

; 76   : 
; 77   : 	/* Query values for selected fields in objects having this formstamp */
; 78   : 	if(selfields.nbrows)

	cmp	DWORD PTR _selfields$[ebp], 0
	je	$L70306

; 80   : 		if(qry_values_list(cntxt, &selfields, 0, &buf)) STACK_ERROR;

	lea	ecx, DWORD PTR _buf$[ebp]
	push	ecx
	push	0
	lea	edx, DWORD PTR _selfields$[ebp]
	push	edx
	mov	eax, DWORD PTR _cntxt$[ebp]
	push	eax
	call	_qry_values_list
	add	esp, 16					; 00000010H
	test	eax, eax
	je	SHORT $L70279
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 80		; 00000050H
	jmp	$eva_err$70222
$L70279:

; 81   : 		sprintf(sql, 
; 82   : 			"-- form_mode_search : Query values for selected fields \n"
; 83   : 			"SELECT DISTINCT TLink.IdValue,TVal.TxtValue,TLink.IdRelObj,COUNT(TLink.IdObj) \n"
; 84   : 			"FROM TLink INNER JOIN TLink AS TLink1 ON TLink1.IdObj = TLink.IdObj \n"
; 85   : 			"LEFT JOIN TVal ON TLink.IdValue = TVal.IdValue \n"
; 86   : 			"WHERE TLink1.IdField=%lu AND TLink1.IdRelObj=%s AND TLink1.DateDel IS NULL \n" 
; 87   : 				"AND TLink.IdField IN(%s) \n"
; 88   : 			"GROUP BY TLink.IdValue,TVal.TxtValue,TLink.IdRelObj \n", 
; 89   : 			cntxt->val_FORMSTAMP, dyntab_val(&form->id_form, 0, 0), buf->data);

	mov	edx, DWORD PTR _buf$[ebp]
	add	edx, 8
	push	edx
	push	0
	push	0
	mov	eax, DWORD PTR _form$[ebp]
	add	eax, 12					; 0000000cH
	push	eax
	call	_dyntab_val
	add	esp, 12					; 0000000cH
	push	eax
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	edx, DWORD PTR [ecx+269636]
	push	edx
	push	OFFSET FLAT:$SG70280
	lea	eax, DWORD PTR _sql$[ebp]
	push	eax
	call	_sprintf
	add	esp, 20					; 00000014H

; 90   : 		if(sql_exec_query(cntxt, sql) || sql_get_table(cntxt, &values, 2)) STACK_ERROR;

	lea	ecx, DWORD PTR _sql$[ebp]
	push	ecx
	mov	edx, DWORD PTR _cntxt$[ebp]
	push	edx
	call	_sql_exec_query
	add	esp, 8
	test	eax, eax
	jne	SHORT $L70282
	push	2
	lea	eax, DWORD PTR _values$[ebp]
	push	eax
	mov	ecx, DWORD PTR _cntxt$[ebp]
	push	ecx
	call	_sql_get_table
	add	esp, 12					; 0000000cH
	test	eax, eax
	je	SHORT $L70281
$L70282:
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 90		; 0000005aH
	jmp	$eva_err$70222
$L70281:

; 91   : 		M_FREE(buf);

	mov	eax, DWORD PTR _buf$[ebp]
	push	eax
	call	_mem_free
	add	esp, 4
	mov	DWORD PTR _buf$[ebp], 0

; 92   : 
; 93   : 		/* Output values list */
; 94   : 		dyntab_free(&selfields);

	lea	ecx, DWORD PTR _selfields$[ebp]
	push	ecx
	call	_dyntab_free
	add	esp, 4

; 95   : 		DYNBUF_ADD_STR(form->html, "<td>Valeurs<br>\n");

	push	0
	push	0
	push	16					; 00000010H
	push	OFFSET FLAT:$SG70285
	mov	edx, DWORD PTR _form$[ebp]
	mov	eax, DWORD PTR [edx+232]
	push	eax
	call	_dynbuf_add
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L70284
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29872], OFFSET FLAT:$SG70287
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 95		; 0000005fH
	jmp	$eva_err$70222
$L70284:

; 96   : 		for(i = 0; i < values.nbrows; i++)

	mov	DWORD PTR _i$[ebp], 0
	jmp	SHORT $L70288
$L70289:
	mov	eax, DWORD PTR _i$[ebp]
	add	eax, 1
	mov	DWORD PTR _i$[ebp], eax
$L70288:
	mov	ecx, DWORD PTR _i$[ebp]
	cmp	ecx, DWORD PTR _values$[ebp]
	jae	$L70290

; 98   : 			/* If value is a relation */
; 99   : 			if(dyntab_sz(&values, i, 2)) 

	push	2
	mov	edx, DWORD PTR _i$[ebp]
	push	edx
	lea	eax, DWORD PTR _values$[ebp]
	push	eax
	call	_dyntab_sz
	add	esp, 12					; 0000000cH
	test	eax, eax
	je	SHORT $L70291

; 101  : 				/* Add open button & object label */
; 102  : 				DYNTAB_SET_CELL(&selfields, 0, 0, &values, i, 2);

	push	0
	push	2
	mov	ecx, DWORD PTR _i$[ebp]
	push	ecx
	lea	edx, DWORD PTR _values$[ebp]
	push	edx
	call	_dyntab_cell
	add	esp, 12					; 0000000cH
	push	eax
	push	0
	push	0
	lea	eax, DWORD PTR _selfields$[ebp]
	push	eax
	call	_dyntab_copy
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L70292
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29872], OFFSET FLAT:$SG70294
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 102		; 00000066H
	jmp	$eva_err$70222
$L70292:

; 103  : 				if(obj_put_html_btn_label(cntxt, &selfields)) STACK_ERROR;

	lea	eax, DWORD PTR _selfields$[ebp]
	push	eax
	mov	ecx, DWORD PTR _cntxt$[ebp]
	push	ecx
	call	_obj_put_html_btn_label
	add	esp, 8
	test	eax, eax
	je	SHORT $L70295
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 103		; 00000067H
	jmp	$eva_err$70222
$L70295:

; 105  : 			else

	jmp	SHORT $L70297
$L70291:

; 107  : 				/* Display raw value */
; 108  : 				DYNBUF_ADD_CELL(form->html, &values, i, 1, TO_HTML);

	push	1
	push	OFFSET FLAT:_plain_to_html
	push	1
	mov	eax, DWORD PTR _i$[ebp]
	push	eax
	lea	ecx, DWORD PTR _values$[ebp]
	push	ecx
	call	_dyntab_sz
	add	esp, 12					; 0000000cH
	push	eax
	push	1
	mov	edx, DWORD PTR _i$[ebp]
	push	edx
	lea	eax, DWORD PTR _values$[ebp]
	push	eax
	call	_dyntab_val
	add	esp, 12					; 0000000cH
	push	eax
	mov	ecx, DWORD PTR _form$[ebp]
	mov	edx, DWORD PTR [ecx+232]
	push	edx
	call	_dynbuf_add
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L70297
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29872], OFFSET FLAT:$SG70299
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 108		; 0000006cH
	jmp	$eva_err$70222
$L70297:

; 110  : 			DYNBUF_ADD3_CELL(form->html, " (", &values, i, 3, TO_HTML, ")<br>");

	push	5
	push	OFFSET FLAT:$SG70301
	push	1
	push	OFFSET FLAT:_plain_to_html
	push	3
	mov	edx, DWORD PTR _i$[ebp]
	push	edx
	lea	eax, DWORD PTR _values$[ebp]
	push	eax
	call	_dyntab_sz
	add	esp, 12					; 0000000cH
	push	eax
	push	3
	mov	ecx, DWORD PTR _i$[ebp]
	push	ecx
	lea	edx, DWORD PTR _values$[ebp]
	push	edx
	call	_dyntab_val
	add	esp, 12					; 0000000cH
	push	eax
	push	2
	push	OFFSET FLAT:$SG70302
	mov	eax, DWORD PTR _form$[ebp]
	mov	ecx, DWORD PTR [eax+232]
	push	ecx
	call	_dynbuf_add3
	add	esp, 36					; 00000024H
	test	eax, eax
	je	SHORT $L70300
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29872], OFFSET FLAT:$SG70304
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 110		; 0000006eH
	jmp	$eva_err$70222
$L70300:

; 111  : 		}

	jmp	$L70289
$L70290:

; 112  : 		DYNBUF_ADD_STR(form->html, "</td>");

	push	0
	push	0
	push	5
	push	OFFSET FLAT:$SG70307
	mov	ecx, DWORD PTR _form$[ebp]
	mov	edx, DWORD PTR [ecx+232]
	push	edx
	call	_dynbuf_add
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L70306
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29872], OFFSET FLAT:$SG70309
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 112		; 00000070H
	jmp	SHORT $eva_err$70222
$L70306:

; 114  : 	DYNBUF_ADD_STR(form->html, "</tr></table></font></td>");

	push	0
	push	0
	push	25					; 00000019H
	push	OFFSET FLAT:$SG70312
	mov	edx, DWORD PTR _form$[ebp]
	mov	eax, DWORD PTR [edx+232]
	push	eax
	call	_dynbuf_add
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L70311
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29872], OFFSET FLAT:$SG70314
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 114		; 00000072H
	jmp	SHORT $eva_err$70222
$L70311:
$eva_noerr$70315:

; 115  : 
; 116  : 	RETURN_OK_CLEANUP;

	push	0
	push	OFFSET FLAT:$SG70316
	push	OFFSET FLAT:$SG70317
	mov	eax, DWORD PTR _cntxt$[ebp]
	push	eax
	call	_err_clear
	add	esp, 16					; 00000010H
$eva_err$70222:
	mov	ecx, DWORD PTR _cntxt$[ebp]
	cmp	DWORD PTR [ecx+29872], 0
	je	SHORT $L70318
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	eax, DWORD PTR [edx+29900]
	push	eax
	push	OFFSET FLAT:$SG70319
	push	OFFSET FLAT:$SG70320
	mov	ecx, DWORD PTR _cntxt$[ebp]
	push	ecx
	call	_err_add_context
	add	esp, 16					; 00000010H
$L70318:
	lea	edx, DWORD PTR _fields$[ebp]
	push	edx
	call	_dyntab_free
	add	esp, 4
	lea	eax, DWORD PTR _selfields$[ebp]
	push	eax
	call	_dyntab_free
	add	esp, 4
	lea	ecx, DWORD PTR _values$[ebp]
	push	ecx
	call	_dyntab_free
	add	esp, 4
	mov	edx, DWORD PTR _buf$[ebp]
	push	edx
	call	_mem_free
	add	esp, 4
	mov	DWORD PTR _buf$[ebp], 0
	mov	eax, DWORD PTR _name$[ebp]
	push	eax
	call	_mem_free
	add	esp, 4
	mov	DWORD PTR _name$[ebp], 0
	mov	ecx, DWORD PTR _cntxt$[ebp]
	xor	eax, eax
	cmp	DWORD PTR [ecx+29872], 0
	setne	al

; 117  : }

	mov	esp, ebp
	pop	ebp
	ret	0
_form_mode_search ENDP
_TEXT	ENDS
END
