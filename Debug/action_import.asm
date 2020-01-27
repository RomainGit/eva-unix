	TITLE	D:\Travail\ABI\EVA\V4.0\CGI\Brunix-2016\action_import.c
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
PUBLIC	_import_tabrc_file
EXTRN	__iob:BYTE
EXTRN	_fflush:NEAR
EXTRN	_printf:NEAR
EXTRN	_sprintf:NEAR
EXTRN	__chkstk:NEAR
EXTRN	_sql_exec_query:NEAR
EXTRN	_sql_id_value:NEAR
EXTRN	_calloc:NEAR
EXTRN	_sql_add_value:NEAR
EXTRN	_qry_field_value:NEAR
EXTRN	_strtoul:NEAR
EXTRN	_qry_obj_idfield:NEAR
EXTRN	_dynbuf_add_int:NEAR
EXTRN	_qry_add_new_obj:NEAR
EXTRN	_qry_update_idobj_idfield:NEAR
EXTRN	_qry_add_val:NEAR
EXTRN	_dyntab_free:NEAR
EXTRN	_sql_get_table:NEAR
EXTRN	_dyntab_sz:NEAR
EXTRN	_dyntab_val:NEAR
EXTRN	_dyntab_cell:NEAR
EXTRN	_dyntab_copy:NEAR
EXTRN	_dyntab_add:NEAR
EXTRN	_strcmp:NEAR
EXTRN	_strchr:NEAR
EXTRN	_dyntab_from_list:NEAR
EXTRN	_err_add_context:NEAR
EXTRN	_qry_build_free:NEAR
EXTRN	_qry_parse_field_modifier:NEAR
EXTRN	_err_clear:NEAR
EXTRN	_dyntab_cmp:NEAR
EXTRN	_qry_add_filter:NEAR
EXTRN	_qry_filter_objects:NEAR
_DATA	SEGMENT
$SG70258 DB	'.IdObj', 00H
	ORG $+1
$SG70259 DB	'IdObj', 00H
	ORG $+2
$SG70265 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70284 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70303 DB	'**** %lu/%lu : %s, %s, %s, %s<br>', 0aH, 00H
	ORG $+1
$SG70306 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70315 DB	'_EVA_FORMSTAMP', 00H
	ORG $+1
$SG70317 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70324 DB	',', 00H
	ORG $+2
$SG70330 DB	'++++', 00H
	ORG $+3
$SG70334 DB	'====', 00H
	ORG $+3
$SG70335 DB	' %lu/%lu : %s, %s, %s, %s<br>', 0aH, 00H
	ORG $+1
$SG70355 DB	' ', 0aH, 09H, 0dH, 00H
	ORG $+3
$SG70359 DB	' ', 0aH, 09H, 0dH, 00H
	ORG $+3
$SG70365 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70370 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70373 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70383 DB	'_EVA_RELREVERSE', 00H
$SG70386 DB	'SELECT MAX(Num) FROM TLink WHERE IdObj=%lu AND IdField=%'
	DB	'lu AND DateDel IS NULL', 00H
	ORG $+1
$SG70395 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70399 DB	'_EVA_RELREVERSE', 00H
$SG70400 DB	'D:\Travail\ABI\EVA\V4.0\CGI\Brunix-2016\action_import.c', 00H
$SG70401 DB	'import_tabrc_file', 00H
	ORG $+2
$SG70403 DB	'D:\Travail\ABI\EVA\V4.0\CGI\Brunix-2016\action_import.c', 00H
$SG70404 DB	'import_tabrc_file', 00H
_DATA	ENDS
_TEXT	SEGMENT
_cntxt$ = 8
_data$ = 12
_formstamp$ = 16
_keyfields$ = 20
_multvalsep$ = 24
_reltype$ = 28
_relfldsrc$ = 32
_relflddest$ = 36
_relformdest$ = 40
_id_obj$ = -72
_val$ = -20
_newval$ = -48
_srchval$ = -4600
_relobj$ = -4580
_relform$ = -104
_fields$ = -52
_flt$ = -4560
_i$ = -76
_j$ = -80
_k$ = -84
_idformstamp$ = -24
_b_update$ = -28
_field$70271 = -4604
_modif$70272 = -4608
_b_new$70294 = -4616
_idobj$70295 = -4612
_id$70309 = -4632
_row$70310 = -4624
_col$70311 = -4620
__c$70312 = -4628
_col$70322 = -4636
_match$70323 = -4640
_cell$70350 = -4704
_sql$70384 = -5728
_import_tabrc_file PROC NEAR

; 70   : ){

	push	ebp
	mov	ebp, esp
	mov	eax, 5736				; 00001668H
	call	__chkstk
	push	esi
	push	edi

; 71   : 	DynTable id_obj = { 0 };

	mov	DWORD PTR _id_obj$[ebp], 0
	xor	eax, eax
	mov	DWORD PTR _id_obj$[ebp+4], eax
	mov	DWORD PTR _id_obj$[ebp+8], eax
	mov	DWORD PTR _id_obj$[ebp+12], eax
	mov	DWORD PTR _id_obj$[ebp+16], eax

; 72   : 	DynTable val = { 0 };

	mov	DWORD PTR _val$[ebp], 0
	xor	ecx, ecx
	mov	DWORD PTR _val$[ebp+4], ecx
	mov	DWORD PTR _val$[ebp+8], ecx
	mov	DWORD PTR _val$[ebp+12], ecx
	mov	DWORD PTR _val$[ebp+16], ecx

; 73   : 	DynTable newval = { 0 };

	mov	DWORD PTR _newval$[ebp], 0
	xor	edx, edx
	mov	DWORD PTR _newval$[ebp+4], edx
	mov	DWORD PTR _newval$[ebp+8], edx
	mov	DWORD PTR _newval$[ebp+12], edx
	mov	DWORD PTR _newval$[ebp+16], edx

; 74   : 	DynTable srchval = { 0 };

	mov	DWORD PTR _srchval$[ebp], 0
	xor	eax, eax
	mov	DWORD PTR _srchval$[ebp+4], eax
	mov	DWORD PTR _srchval$[ebp+8], eax
	mov	DWORD PTR _srchval$[ebp+12], eax
	mov	DWORD PTR _srchval$[ebp+16], eax

; 75   : 	DynTable relobj = { 0 };

	mov	DWORD PTR _relobj$[ebp], 0
	xor	ecx, ecx
	mov	DWORD PTR _relobj$[ebp+4], ecx
	mov	DWORD PTR _relobj$[ebp+8], ecx
	mov	DWORD PTR _relobj$[ebp+12], ecx
	mov	DWORD PTR _relobj$[ebp+16], ecx

; 76   : 	DynTable relform = { 0 };

	mov	DWORD PTR _relform$[ebp], 0
	xor	edx, edx
	mov	DWORD PTR _relform$[ebp+4], edx
	mov	DWORD PTR _relform$[ebp+8], edx
	mov	DWORD PTR _relform$[ebp+12], edx
	mov	DWORD PTR _relform$[ebp+16], edx

; 77   : 	ImportRelSpec *fields = NULL;

	mov	DWORD PTR _fields$[ebp], 0

; 78   : 	QryBuild flt = {{0}};

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

; 79   : 	unsigned long i, j, k, idformstamp = DYNTAB_TOUL(formstamp);

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
	mov	DWORD PTR _idformstamp$[ebp], eax

; 80   : 	int b_update = !strcmp(dyntab_val(keyfields, 0, 0), ".IdObj") &&
; 81   : 					!strcmp(dyntab_val(data, 0, 0), "IdObj");

	push	OFFSET FLAT:$SG70258
	push	0
	push	0
	mov	edx, DWORD PTR _keyfields$[ebp]
	push	edx
	call	_dyntab_val
	add	esp, 12					; 0000000cH
	push	eax
	call	_strcmp
	add	esp, 8
	test	eax, eax
	jne	SHORT $L71096
	push	OFFSET FLAT:$SG70259
	push	0
	push	0
	mov	eax, DWORD PTR _data$[ebp]
	push	eax
	call	_dyntab_val
	add	esp, 12					; 0000000cH
	push	eax
	call	_strcmp
	add	esp, 8
	test	eax, eax
	jne	SHORT $L71096
	mov	DWORD PTR -5732+[ebp], 1
	jmp	SHORT $L71097
$L71096:
	mov	DWORD PTR -5732+[ebp], 0
$L71097:
	mov	ecx, DWORD PTR -5732+[ebp]
	mov	DWORD PTR _b_update$[ebp], ecx

; 82   : 
; 83   : 	if(!data || !formstamp) RETURN_OK;

	cmp	DWORD PTR _data$[ebp], 0
	je	SHORT $L70261
	cmp	DWORD PTR _formstamp$[ebp], 0
	jne	SHORT $L70260
$L70261:
	jmp	$eva_noerr$70262
$L70260:

; 84   : 
; 85   : 	/* Process fields names in 1st line */
; 86   : 	C_ALLOC(fields, sizeof(fields[0]), data->nbcols);

	mov	edx, DWORD PTR _data$[ebp]
	mov	eax, DWORD PTR [edx+8]
	push	eax
	push	24					; 00000018H
	call	_calloc
	add	esp, 8
	mov	DWORD PTR _fields$[ebp], eax
	cmp	DWORD PTR _fields$[ebp], 0
	jne	SHORT $L70263
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29872], OFFSET FLAT:$SG70265
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 86		; 00000056H
	jmp	$eva_err$70266
$L70263:

; 87   : 	for(j = b_update ? 1 : 0; j < data->nbcols; j++)

	xor	eax, eax
	cmp	DWORD PTR _b_update$[ebp], 0
	setne	al
	mov	DWORD PTR _j$[ebp], eax
	jmp	SHORT $L70268
$L70269:
	mov	ecx, DWORD PTR _j$[ebp]
	add	ecx, 1
	mov	DWORD PTR _j$[ebp], ecx
$L70268:
	mov	edx, DWORD PTR _data$[ebp]
	mov	eax, DWORD PTR _j$[ebp]
	cmp	eax, DWORD PTR [edx+8]
	jae	$L70270

; 89   : 		/* Check if field has a modifier (dot extension) */
; 90   : 		char *field = dyntab_val(data, 0, j);

	mov	ecx, DWORD PTR _j$[ebp]
	push	ecx
	push	0
	mov	edx, DWORD PTR _data$[ebp]
	push	edx
	call	_dyntab_val
	add	esp, 12					; 0000000cH
	mov	DWORD PTR _field$70271[ebp], eax

; 91   : 		char *modif = strchr(field, '.');

	push	46					; 0000002eH
	mov	eax, DWORD PTR _field$70271[ebp]
	push	eax
	call	_strchr
	add	esp, 8
	mov	DWORD PTR _modif$70272[ebp], eax

; 92   : 		if(modif)

	cmp	DWORD PTR _modif$70272[ebp], 0
	je	SHORT $L70273

; 94   : 			/* If field has a modifier (only IdRelObj is currently supported) */
; 95   : 			dyntab_cell(data, 0, j)->len = modif - field;

	mov	esi, DWORD PTR _modif$70272[ebp]
	sub	esi, DWORD PTR _field$70271[ebp]
	mov	ecx, DWORD PTR _j$[ebp]
	push	ecx
	push	0
	mov	edx, DWORD PTR _data$[ebp]
	push	edx
	call	_dyntab_cell
	add	esp, 12					; 0000000cH
	mov	DWORD PTR [eax+4], esi

; 96   : 			*modif = 0;

	mov	eax, DWORD PTR _modif$70272[ebp]
	mov	BYTE PTR [eax], 0

; 97   : 			fields[j].modif = qry_parse_field_modifier(modif + 1);

	mov	ecx, DWORD PTR _modif$70272[ebp]
	add	ecx, 1
	push	ecx
	call	_qry_parse_field_modifier
	add	esp, 4
	mov	edx, DWORD PTR _j$[ebp]
	imul	edx, 24					; 00000018H
	mov	ecx, DWORD PTR _fields$[ebp]
	mov	DWORD PTR [ecx+edx+20], eax

; 99   : 
; 100  : 		/* Check if field is a relation */
; 101  : 		else if(relfldsrc) for(i = 0; i < relfldsrc->nbrows; i++)

	jmp	$L70278
$L70273:
	cmp	DWORD PTR _relfldsrc$[ebp], 0
	je	$L70278
	mov	DWORD PTR _i$[ebp], 0
	jmp	SHORT $L70276
$L70277:
	mov	edx, DWORD PTR _i$[ebp]
	add	edx, 1
	mov	DWORD PTR _i$[ebp], edx
$L70276:
	mov	eax, DWORD PTR _relfldsrc$[ebp]
	mov	ecx, DWORD PTR _i$[ebp]
	cmp	ecx, DWORD PTR [eax]
	jae	$L70278

; 102  : 			if(!dyntab_cmp(data, 0, j, relfldsrc, i, 0))

	push	0
	mov	edx, DWORD PTR _i$[ebp]
	push	edx
	mov	eax, DWORD PTR _relfldsrc$[ebp]
	push	eax
	mov	ecx, DWORD PTR _j$[ebp]
	push	ecx
	push	0
	mov	edx, DWORD PTR _data$[ebp]
	push	edx
	call	_dyntab_cmp
	add	esp, 24					; 00000018H
	test	eax, eax
	jne	$L70279

; 104  : 				/* If field is a relation : retrieve related field id */
; 105  : 				if(sql_id_value(cntxt, DYNTAB_VAL_SZ(relflddest, i, 0), &fields[j].id_relfld)) STACK_ERROR;

	mov	eax, DWORD PTR _j$[ebp]
	imul	eax, 24					; 00000018H
	mov	ecx, DWORD PTR _fields$[ebp]
	lea	edx, DWORD PTR [ecx+eax+12]
	push	edx
	push	0
	mov	eax, DWORD PTR _i$[ebp]
	push	eax
	mov	ecx, DWORD PTR _relflddest$[ebp]
	push	ecx
	call	_dyntab_sz
	add	esp, 12					; 0000000cH
	push	eax
	push	0
	mov	edx, DWORD PTR _i$[ebp]
	push	edx
	mov	eax, DWORD PTR _relflddest$[ebp]
	push	eax
	call	_dyntab_val
	add	esp, 12					; 0000000cH
	push	eax
	mov	ecx, DWORD PTR _cntxt$[ebp]
	push	ecx
	call	_sql_id_value
	add	esp, 16					; 00000010H
	test	eax, eax
	je	SHORT $L70280
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 105		; 00000069H
	jmp	$eva_err$70266
$L70280:

; 106  : 				fields[j].i_rel = fields[j].id_relfld ? i : -1;

	mov	eax, DWORD PTR _j$[ebp]
	imul	eax, 24					; 00000018H
	mov	ecx, DWORD PTR _fields$[ebp]
	cmp	DWORD PTR [ecx+eax+12], 0
	je	SHORT $L71098
	mov	edx, DWORD PTR _i$[ebp]
	mov	DWORD PTR -5736+[ebp], edx
	jmp	SHORT $L71099
$L71098:
	mov	DWORD PTR -5736+[ebp], -1
$L71099:
	mov	eax, DWORD PTR _j$[ebp]
	imul	eax, 24					; 00000018H
	mov	ecx, DWORD PTR _fields$[ebp]
	mov	edx, DWORD PTR -5736+[ebp]
	mov	DWORD PTR [ecx+eax+8], edx

; 107  : 				if(fields[j].id_relfld) DYNBUF_ADD_INT(&fields[j].l_relfld, fields[j].id_relfld);

	mov	eax, DWORD PTR _j$[ebp]
	imul	eax, 24					; 00000018H
	mov	ecx, DWORD PTR _fields$[ebp]
	cmp	DWORD PTR [ecx+eax+12], 0
	je	SHORT $L70282
	mov	edx, DWORD PTR _j$[ebp]
	imul	edx, 24					; 00000018H
	mov	eax, DWORD PTR _fields$[ebp]
	mov	ecx, DWORD PTR [eax+edx+12]
	push	ecx
	mov	edx, DWORD PTR _j$[ebp]
	imul	edx, 24					; 00000018H
	mov	eax, DWORD PTR _fields$[ebp]
	lea	ecx, DWORD PTR [eax+edx+16]
	push	ecx
	call	_dynbuf_add_int
	add	esp, 8
	test	eax, eax
	je	SHORT $L70282
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29872], OFFSET FLAT:$SG70284
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 107		; 0000006bH
	jmp	$eva_err$70266
$L70282:

; 108  : 				break;

	jmp	SHORT $L70278
$L70279:

; 110  : 
; 111  : 		/* Check if field is in primary key */
; 112  : 		if(keyfields && !b_update) for(i = 0; i < keyfields->nbrows; i++)

	jmp	$L70277
$L70278:
	cmp	DWORD PTR _keyfields$[ebp], 0
	je	$L70288
	cmp	DWORD PTR _b_update$[ebp], 0
	jne	SHORT $L70288
	mov	DWORD PTR _i$[ebp], 0
	jmp	SHORT $L70286
$L70287:
	mov	ecx, DWORD PTR _i$[ebp]
	add	ecx, 1
	mov	DWORD PTR _i$[ebp], ecx
$L70286:
	mov	edx, DWORD PTR _keyfields$[ebp]
	mov	eax, DWORD PTR _i$[ebp]
	cmp	eax, DWORD PTR [edx]
	jae	SHORT $L70288

; 113  : 			if(!dyntab_cmp(data, 0, j, keyfields, i, 0))

	push	0
	mov	ecx, DWORD PTR _i$[ebp]
	push	ecx
	mov	edx, DWORD PTR _keyfields$[ebp]
	push	edx
	mov	eax, DWORD PTR _j$[ebp]
	push	eax
	push	0
	mov	ecx, DWORD PTR _data$[ebp]
	push	ecx
	call	_dyntab_cmp
	add	esp, 24					; 00000018H
	test	eax, eax
	jne	SHORT $L70289

; 115  : 				/* If field is in primary keys : store key data column in cell->col */
; 116  : 				dyntab_cell(keyfields, i, 0)->col = j;

	push	0
	mov	edx, DWORD PTR _i$[ebp]
	push	edx
	mov	eax, DWORD PTR _keyfields$[ebp]
	push	eax
	call	_dyntab_cell
	add	esp, 12					; 0000000cH
	mov	ecx, DWORD PTR _j$[ebp]
	mov	DWORD PTR [eax+56], ecx

; 117  : 				dyntab_cell(keyfields, i, 0)->b_relation = 0;

	push	0
	mov	edx, DWORD PTR _i$[ebp]
	push	edx
	mov	eax, DWORD PTR _keyfields$[ebp]
	push	eax
	call	_dyntab_cell
	add	esp, 12					; 0000000cH
	mov	BYTE PTR [eax+12], 0

; 118  : 				fields[j].b_key = 1;

	mov	ecx, DWORD PTR _j$[ebp]
	imul	ecx, 24					; 00000018H
	mov	edx, DWORD PTR _fields$[ebp]
	mov	DWORD PTR [edx+ecx+4], 1

; 119  : 				break;

	jmp	SHORT $L70288
$L70289:

; 121  : 
; 122  : 		/* Search / Create field IdValue */
; 123  : 		if(sql_add_value(cntxt,DYNTAB_VAL_SZ(data, 0, j), &fields[j].id)) STACK_ERROR;

	jmp	SHORT $L70287
$L70288:
	mov	eax, DWORD PTR _j$[ebp]
	imul	eax, 24					; 00000018H
	mov	ecx, DWORD PTR _fields$[ebp]
	add	ecx, eax
	push	ecx
	mov	edx, DWORD PTR _j$[ebp]
	push	edx
	push	0
	mov	eax, DWORD PTR _data$[ebp]
	push	eax
	call	_dyntab_sz
	add	esp, 12					; 0000000cH
	push	eax
	mov	ecx, DWORD PTR _j$[ebp]
	push	ecx
	push	0
	mov	edx, DWORD PTR _data$[ebp]
	push	edx
	call	_dyntab_val
	add	esp, 12					; 0000000cH
	push	eax
	mov	eax, DWORD PTR _cntxt$[ebp]
	push	eax
	call	_sql_add_value
	add	esp, 16					; 00000010H
	test	eax, eax
	je	SHORT $L70290
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 123		; 0000007bH
	jmp	$eva_err$70266
$L70290:

; 124  : 	}

	jmp	$L70269
$L70270:

; 125  : 
; 126  : 	/* Loop on data lines */
; 127  : 	for(i = 1; i < data->nbrows; i++)

	mov	DWORD PTR _i$[ebp], 1
	jmp	SHORT $L70291
$L70292:
	mov	edx, DWORD PTR _i$[ebp]
	add	edx, 1
	mov	DWORD PTR _i$[ebp], edx
$L70291:
	mov	eax, DWORD PTR _data$[ebp]
	mov	ecx, DWORD PTR _i$[ebp]
	cmp	ecx, DWORD PTR [eax]
	jae	$eva_noerr$70262

; 129  : 		/* If update mode : check target object formstamp */
; 130  : 		int b_new = 1;

	mov	DWORD PTR _b_new$70294[ebp], 1

; 131  : 		int idobj = DYNTAB_TOULRC(data, i, 0);

	push	10					; 0000000aH
	push	0
	push	0
	mov	edx, DWORD PTR _i$[ebp]
	push	edx
	mov	eax, DWORD PTR _data$[ebp]
	push	eax
	call	_dyntab_val
	add	esp, 12					; 0000000cH
	push	eax
	call	_strtoul
	add	esp, 12					; 0000000cH
	mov	DWORD PTR _idobj$70295[ebp], eax

; 132  : 		if(b_update)

	cmp	DWORD PTR _b_update$[ebp], 0
	je	$L70297

; 134  : 			if(qry_obj_idfield(cntxt, &val, idobj, cntxt->val_FORMSTAMP)) STACK_ERROR;

	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	edx, DWORD PTR [ecx+269636]
	push	edx
	mov	eax, DWORD PTR _idobj$70295[ebp]
	push	eax
	lea	ecx, DWORD PTR _val$[ebp]
	push	ecx
	mov	edx, DWORD PTR _cntxt$[ebp]
	push	edx
	call	_qry_obj_idfield
	add	esp, 16					; 00000010H
	test	eax, eax
	je	SHORT $L70298
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 134		; 00000086H
	jmp	$eva_err$70266
$L70298:

; 135  : 			for(j = 0; j < val.nbrows && dyntab_cmp(formstamp, 0, 0, &val, j, 0); j++);

	mov	DWORD PTR _j$[ebp], 0
	jmp	SHORT $L70299
$L70300:
	mov	ecx, DWORD PTR _j$[ebp]
	add	ecx, 1
	mov	DWORD PTR _j$[ebp], ecx
$L70299:
	mov	edx, DWORD PTR _j$[ebp]
	cmp	edx, DWORD PTR _val$[ebp]
	jae	SHORT $L70301
	push	0
	mov	eax, DWORD PTR _j$[ebp]
	push	eax
	lea	ecx, DWORD PTR _val$[ebp]
	push	ecx
	push	0
	push	0
	mov	edx, DWORD PTR _formstamp$[ebp]
	push	edx
	call	_dyntab_cmp
	add	esp, 24					; 00000018H
	test	eax, eax
	je	SHORT $L70301
	jmp	SHORT $L70300
$L70301:

; 136  : 			if(j == val.nbrows)

	mov	eax, DWORD PTR _j$[ebp]
	cmp	eax, DWORD PTR _val$[ebp]
	jne	SHORT $L70302

; 138  : 				printf("**** %lu/%lu : %s, %s, %s, %s<br>\n", i, data->nbrows - 1, dyntab_val(data, i, 0), dyntab_val(data, i, 1), dyntab_val(data, i, 2), dyntab_val(data, i, 3));

	push	3
	mov	ecx, DWORD PTR _i$[ebp]
	push	ecx
	mov	edx, DWORD PTR _data$[ebp]
	push	edx
	call	_dyntab_val
	add	esp, 12					; 0000000cH
	push	eax
	push	2
	mov	eax, DWORD PTR _i$[ebp]
	push	eax
	mov	ecx, DWORD PTR _data$[ebp]
	push	ecx
	call	_dyntab_val
	add	esp, 12					; 0000000cH
	push	eax
	push	1
	mov	edx, DWORD PTR _i$[ebp]
	push	edx
	mov	eax, DWORD PTR _data$[ebp]
	push	eax
	call	_dyntab_val
	add	esp, 12					; 0000000cH
	push	eax
	push	0
	mov	ecx, DWORD PTR _i$[ebp]
	push	ecx
	mov	edx, DWORD PTR _data$[ebp]
	push	edx
	call	_dyntab_val
	add	esp, 12					; 0000000cH
	push	eax
	mov	eax, DWORD PTR _data$[ebp]
	mov	ecx, DWORD PTR [eax]
	sub	ecx, 1
	push	ecx
	mov	edx, DWORD PTR _i$[ebp]
	push	edx
	push	OFFSET FLAT:$SG70303
	call	_printf
	add	esp, 28					; 0000001cH

; 139  : 				fflush(stdout);

	push	OFFSET FLAT:__iob+32
	call	_fflush
	add	esp, 4

; 140  : 				continue;

	jmp	$L70292
$L70302:

; 142  : 			DYNTAB_SET_CELL(&id_obj, 0, 0, data, i, 0);

	push	0
	push	0
	mov	eax, DWORD PTR _i$[ebp]
	push	eax
	mov	ecx, DWORD PTR _data$[ebp]
	push	ecx
	call	_dyntab_cell
	add	esp, 12					; 0000000cH
	push	eax
	push	0
	push	0
	lea	edx, DWORD PTR _id_obj$[ebp]
	push	edx
	call	_dyntab_copy
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L70304
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29872], OFFSET FLAT:$SG70306
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 142		; 0000008eH
	jmp	$eva_err$70266
$L70304:

; 143  : 			b_new = 0;

	mov	DWORD PTR _b_new$70294[ebp], 0

; 145  : 		/* Else : check primary keys - search for existing object */
; 146  : 		else if(keyfields->nbrows)

	jmp	$L70327
$L70297:
	mov	edx, DWORD PTR _keyfields$[ebp]
	cmp	DWORD PTR [edx], 0
	je	$L70327

; 148  : 			/* Initialize filter with AND condition & destination form */
; 149  : 			qry_build_free(&flt);

	lea	eax, DWORD PTR _flt$[ebp]
	push	eax
	call	_qry_build_free
	add	esp, 4

; 150  : 			dyntab_free(&srchval);

	lea	ecx, DWORD PTR _srchval$[ebp]
	push	ecx
	call	_dyntab_free
	add	esp, 4

; 151  : 			DYNTAB_ADD_TXTID(&srchval, 0, 0, "_EVA_FORMSTAMP", cntxt->val_FORMSTAMP);

	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	eax, DWORD PTR [edx+269636]
	mov	DWORD PTR _id$70309[ebp], eax
	mov	DWORD PTR _row$70310[ebp], 0
	mov	DWORD PTR _col$70311[ebp], 0
	push	0
	push	0
	push	14					; 0000000eH
	push	OFFSET FLAT:$SG70315
	mov	ecx, DWORD PTR _col$70311[ebp]
	push	ecx
	mov	edx, DWORD PTR _row$70310[ebp]
	push	edx
	lea	eax, DWORD PTR _srchval$[ebp]
	push	eax
	call	_dyntab_add
	add	esp, 28					; 0000001cH
	test	eax, eax
	je	SHORT $L70314
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29872], OFFSET FLAT:$SG70317
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 151		; 00000097H
	jmp	$eva_err$70266
$L70314:
	mov	eax, DWORD PTR _col$70311[ebp]
	push	eax
	mov	ecx, DWORD PTR _row$70310[ebp]
	push	ecx
	lea	edx, DWORD PTR _srchval$[ebp]
	push	edx
	call	_dyntab_cell
	add	esp, 12					; 0000000cH
	mov	DWORD PTR __c$70312[ebp], eax
	mov	eax, DWORD PTR __c$70312[ebp]
	mov	ecx, DWORD PTR _id$70309[ebp]
	mov	DWORD PTR [eax+32], ecx

; 152  : 			if(qry_add_filter(cntxt, &flt, RelNone, &srchval, RelList, formstamp)) STACK_ERROR;

	mov	edx, DWORD PTR _formstamp$[ebp]
	push	edx
	push	3
	lea	eax, DWORD PTR _srchval$[ebp]
	push	eax
	push	0
	lea	ecx, DWORD PTR _flt$[ebp]
	push	ecx
	mov	edx, DWORD PTR _cntxt$[ebp]
	push	edx
	call	_qry_add_filter
	add	esp, 24					; 00000018H
	test	eax, eax
	je	SHORT $L70318
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 152		; 00000098H
	jmp	$eva_err$70266
$L70318:

; 153  : 
; 154  : 			/* Build query for each key field */
; 155  : 			for(j = 0; j < keyfields->nbrows; j++)

	mov	DWORD PTR _j$[ebp], 0
	jmp	SHORT $L70319
$L70320:
	mov	ecx, DWORD PTR _j$[ebp]
	add	ecx, 1
	mov	DWORD PTR _j$[ebp], ecx
$L70319:
	mov	edx, DWORD PTR _keyfields$[ebp]
	mov	eax, DWORD PTR _j$[ebp]
	cmp	eax, DWORD PTR [edx]
	jae	$L70321

; 157  : 				unsigned long col = dyntab_cell(keyfields, j, 0)->col;

	push	0
	mov	ecx, DWORD PTR _j$[ebp]
	push	ecx
	mov	edx, DWORD PTR _keyfields$[ebp]
	push	edx
	call	_dyntab_cell
	add	esp, 12					; 0000000cH
	mov	eax, DWORD PTR [eax+56]
	mov	DWORD PTR _col$70322[ebp], eax

; 158  : 				MatchMode match = dyntab_cell(keyfields, j, 0)->b_relation ? RelList : Like;

	push	0
	mov	ecx, DWORD PTR _j$[ebp]
	push	ecx
	mov	edx, DWORD PTR _keyfields$[ebp]
	push	edx
	call	_dyntab_cell
	add	esp, 12					; 0000000cH
	movsx	eax, BYTE PTR [eax+12]
	neg	eax
	sbb	eax, eax
	and	al, -6					; fffffffaH
	add	eax, 9
	mov	DWORD PTR _match$70323[ebp], eax

; 159  : 				dyntab_from_list(&val, DYNTAB_VAL_SZ(data, i, col), dyntab_val(multvalsep, 0, 0), 0, 2);

	push	2
	push	0
	push	0
	push	0
	mov	ecx, DWORD PTR _multvalsep$[ebp]
	push	ecx
	call	_dyntab_val
	add	esp, 12					; 0000000cH
	push	eax
	mov	edx, DWORD PTR _col$70322[ebp]
	push	edx
	mov	eax, DWORD PTR _i$[ebp]
	push	eax
	mov	ecx, DWORD PTR _data$[ebp]
	push	ecx
	call	_dyntab_sz
	add	esp, 12					; 0000000cH
	push	eax
	mov	edx, DWORD PTR _col$70322[ebp]
	push	edx
	mov	eax, DWORD PTR _i$[ebp]
	push	eax
	mov	ecx, DWORD PTR _data$[ebp]
	push	ecx
	call	_dyntab_val
	add	esp, 12					; 0000000cH
	push	eax
	lea	edx, DWORD PTR _val$[ebp]
	push	edx
	call	_dyntab_from_list
	add	esp, 24					; 00000018H

; 160  : 				dyntab_from_list(&srchval, DYNTAB_VAL_SZ(keyfields, j, 0), ",", 0, 2);

	push	2
	push	0
	push	OFFSET FLAT:$SG70324
	push	0
	mov	eax, DWORD PTR _j$[ebp]
	push	eax
	mov	ecx, DWORD PTR _keyfields$[ebp]
	push	ecx
	call	_dyntab_sz
	add	esp, 12					; 0000000cH
	push	eax
	push	0
	mov	edx, DWORD PTR _j$[ebp]
	push	edx
	mov	eax, DWORD PTR _keyfields$[ebp]
	push	eax
	call	_dyntab_val
	add	esp, 12					; 0000000cH
	push	eax
	lea	ecx, DWORD PTR _srchval$[ebp]
	push	ecx
	call	_dyntab_from_list
	add	esp, 24					; 00000018H

; 161  : 				if(dyntab_sz(&val, 0, 0) && qry_add_filter(cntxt, &flt, RelNone, &srchval, match, &val)) STACK_ERROR;

	push	0
	push	0
	lea	edx, DWORD PTR _val$[ebp]
	push	edx
	call	_dyntab_sz
	add	esp, 12					; 0000000cH
	test	eax, eax
	je	SHORT $L70325
	lea	eax, DWORD PTR _val$[ebp]
	push	eax
	mov	ecx, DWORD PTR _match$70323[ebp]
	push	ecx
	lea	edx, DWORD PTR _srchval$[ebp]
	push	edx
	push	0
	lea	eax, DWORD PTR _flt$[ebp]
	push	eax
	mov	ecx, DWORD PTR _cntxt$[ebp]
	push	ecx
	call	_qry_add_filter
	add	esp, 24					; 00000018H
	test	eax, eax
	je	SHORT $L70325
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 161		; 000000a1H
	jmp	$eva_err$70266
$L70325:

; 162  : 			}

	jmp	$L70320
$L70321:

; 163  : 
; 164  : 			/* Query for objects matching key filter */
; 165  : 			if(qry_filter_objects(cntxt, &id_obj, &flt)) STACK_ERROR;

	lea	eax, DWORD PTR _flt$[ebp]
	push	eax
	lea	ecx, DWORD PTR _id_obj$[ebp]
	push	ecx
	mov	edx, DWORD PTR _cntxt$[ebp]
	push	edx
	call	_qry_filter_objects
	add	esp, 12					; 0000000cH
	test	eax, eax
	je	SHORT $L70326
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 165		; 000000a5H
	jmp	$eva_err$70266
$L70326:

; 166  : 			b_new = !id_obj.nbrows;

	xor	ecx, ecx
	cmp	DWORD PTR _id_obj$[ebp], 0
	sete	cl
	mov	DWORD PTR _b_new$70294[ebp], ecx

; 167  : 			if(!b_new)

	cmp	DWORD PTR _b_new$70294[ebp], 0
	jne	SHORT $L70327

; 169  : 				idobj = DYNTAB_TOUL(&id_obj);

	push	10					; 0000000aH
	push	0
	push	0
	push	0
	lea	edx, DWORD PTR _id_obj$[ebp]
	push	edx
	call	_dyntab_val
	add	esp, 12					; 0000000cH
	push	eax
	call	_strtoul
	add	esp, 12					; 0000000cH
	mov	DWORD PTR _idobj$70295[ebp], eax

; 170  : 				id_obj.nbrows = 1;

	mov	DWORD PTR _id_obj$[ebp], 1
$L70327:

; 173  : 
; 174  : 		/* Create new object if applicable */
; 175  : 		if(b_new)

	cmp	DWORD PTR _b_new$70294[ebp], 0
	je	SHORT $L70329

; 177  : 			printf("++++");

	push	OFFSET FLAT:$SG70330
	call	_printf
	add	esp, 4

; 178  : 			if(qry_add_new_obj(cntxt, &id_obj, idformstamp)) STACK_ERROR;

	mov	eax, DWORD PTR _idformstamp$[ebp]
	push	eax
	lea	ecx, DWORD PTR _id_obj$[ebp]
	push	ecx
	mov	edx, DWORD PTR _cntxt$[ebp]
	push	edx
	call	_qry_add_new_obj
	add	esp, 12					; 0000000cH
	test	eax, eax
	je	SHORT $L70331
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 178		; 000000b2H
	jmp	$eva_err$70266
$L70331:

; 179  : 			idobj = DYNTAB_TOUL(&id_obj);

	push	10					; 0000000aH
	push	0
	push	0
	push	0
	lea	ecx, DWORD PTR _id_obj$[ebp]
	push	ecx
	call	_dyntab_val
	add	esp, 12					; 0000000cH
	push	eax
	call	_strtoul
	add	esp, 12					; 0000000cH
	mov	DWORD PTR _idobj$70295[ebp], eax

; 181  : 		else printf("====");

	jmp	SHORT $L70333
$L70329:
	push	OFFSET FLAT:$SG70334
	call	_printf
	add	esp, 4
$L70333:

; 182  : 		printf(" %lu/%lu : %s, %s, %s, %s<br>\n", i, data->nbrows - 1, dyntab_val(data, i, 0), dyntab_val(data, i, 1), dyntab_val(data, i, 2), dyntab_val(data, i, 3));

	push	3
	mov	edx, DWORD PTR _i$[ebp]
	push	edx
	mov	eax, DWORD PTR _data$[ebp]
	push	eax
	call	_dyntab_val
	add	esp, 12					; 0000000cH
	push	eax
	push	2
	mov	ecx, DWORD PTR _i$[ebp]
	push	ecx
	mov	edx, DWORD PTR _data$[ebp]
	push	edx
	call	_dyntab_val
	add	esp, 12					; 0000000cH
	push	eax
	push	1
	mov	eax, DWORD PTR _i$[ebp]
	push	eax
	mov	ecx, DWORD PTR _data$[ebp]
	push	ecx
	call	_dyntab_val
	add	esp, 12					; 0000000cH
	push	eax
	push	0
	mov	edx, DWORD PTR _i$[ebp]
	push	edx
	mov	eax, DWORD PTR _data$[ebp]
	push	eax
	call	_dyntab_val
	add	esp, 12					; 0000000cH
	push	eax
	mov	ecx, DWORD PTR _data$[ebp]
	mov	edx, DWORD PTR [ecx]
	sub	edx, 1
	push	edx
	mov	eax, DWORD PTR _i$[ebp]
	push	eax
	push	OFFSET FLAT:$SG70335
	call	_printf
	add	esp, 28					; 0000001cH

; 183  : 		fflush(stdout);

	push	OFFSET FLAT:__iob+32
	call	_fflush
	add	esp, 4

; 184  : 
; 185  : 		/* Loop on data columns : update object data - all fields if new - non key fields else */
; 186  : 		for(j = b_update ? 1 : 0; j < data->nbcols; j++) if(b_new || !fields[j].b_key)

	xor	ecx, ecx
	cmp	DWORD PTR _b_update$[ebp], 0
	setne	cl
	mov	DWORD PTR _j$[ebp], ecx
	jmp	SHORT $L70336
$L70337:
	mov	edx, DWORD PTR _j$[ebp]
	add	edx, 1
	mov	DWORD PTR _j$[ebp], edx
$L70336:
	mov	eax, DWORD PTR _data$[ebp]
	mov	ecx, DWORD PTR _j$[ebp]
	cmp	ecx, DWORD PTR [eax+8]
	jae	$L70338
	cmp	DWORD PTR _b_new$70294[ebp], 0
	jne	SHORT $L70340
	mov	edx, DWORD PTR _j$[ebp]
	imul	edx, 24					; 00000018H
	mov	eax, DWORD PTR _fields$[ebp]
	cmp	DWORD PTR [eax+edx+4], 0
	jne	$L70396
$L70340:

; 188  : 			/* Get field values */
; 189  : 			dyntab_from_list(&val, DYNTAB_VAL_SZ(data, i, j), dyntab_val(multvalsep, 0, 0), 0, 2);

	push	2
	push	0
	push	0
	push	0
	mov	ecx, DWORD PTR _multvalsep$[ebp]
	push	ecx
	call	_dyntab_val
	add	esp, 12					; 0000000cH
	push	eax
	mov	edx, DWORD PTR _j$[ebp]
	push	edx
	mov	eax, DWORD PTR _i$[ebp]
	push	eax
	mov	ecx, DWORD PTR _data$[ebp]
	push	ecx
	call	_dyntab_sz
	add	esp, 12					; 0000000cH
	push	eax
	mov	edx, DWORD PTR _j$[ebp]
	push	edx
	mov	eax, DWORD PTR _i$[ebp]
	push	eax
	mov	ecx, DWORD PTR _data$[ebp]
	push	ecx
	call	_dyntab_val
	add	esp, 12					; 0000000cH
	push	eax
	lea	edx, DWORD PTR _val$[ebp]
	push	edx
	call	_dyntab_from_list
	add	esp, 24					; 00000018H

; 190  : 
; 191  : 			/* Handle update mode */
; 192  : 			if(b_update)

	cmp	DWORD PTR _b_update$[ebp], 0
	je	$L70341

; 194  : 				if(fields[j].modif == F_RelObj)

	mov	eax, DWORD PTR _j$[ebp]
	imul	eax, 24					; 00000018H
	mov	ecx, DWORD PTR _fields$[ebp]
	cmp	DWORD PTR [ecx+eax+20], 7
	jne	SHORT $L70345

; 195  : 					for(k = 0; k < val.nbrows; k++) dyntab_cell(&val, k, 0)->b_relation = 1;

	mov	DWORD PTR _k$[ebp], 0
	jmp	SHORT $L70343
$L70344:
	mov	edx, DWORD PTR _k$[ebp]
	add	edx, 1
	mov	DWORD PTR _k$[ebp], edx
$L70343:
	mov	eax, DWORD PTR _k$[ebp]
	cmp	eax, DWORD PTR _val$[ebp]
	jae	SHORT $L70345
	push	0
	mov	ecx, DWORD PTR _k$[ebp]
	push	ecx
	lea	edx, DWORD PTR _val$[ebp]
	push	edx
	call	_dyntab_cell
	add	esp, 12					; 0000000cH
	mov	BYTE PTR [eax+12], 1
	jmp	SHORT $L70344
$L70345:

; 196  : 				if(qry_update_idobj_idfield(cntxt, idobj, fields[j].id, &val, 2)) STACK_ERROR;

	push	2
	lea	eax, DWORD PTR _val$[ebp]
	push	eax
	mov	ecx, DWORD PTR _j$[ebp]
	imul	ecx, 24					; 00000018H
	mov	edx, DWORD PTR _fields$[ebp]
	mov	eax, DWORD PTR [edx+ecx]
	push	eax
	mov	ecx, DWORD PTR _idobj$70295[ebp]
	push	ecx
	mov	edx, DWORD PTR _cntxt$[ebp]
	push	edx
	call	_qry_update_idobj_idfield
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L70346
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 196		; 000000c4H
	jmp	$eva_err$70266
$L70346:

; 197  : 				continue;

	jmp	$L70337
$L70341:

; 199  : 
; 200  : 			/* Loop on multiple values : add each value */
; 201  : 			DYNTAB_FREE(newval);

	lea	ecx, DWORD PTR _newval$[ebp]
	push	ecx
	call	_dyntab_free
	add	esp, 4

; 202  : 			for(k = 0; k < val.nbrows; k++)

	mov	DWORD PTR _k$[ebp], 0
	jmp	SHORT $L70347
$L70348:
	mov	edx, DWORD PTR _k$[ebp]
	add	edx, 1
	mov	DWORD PTR _k$[ebp], edx
$L70347:
	mov	eax, DWORD PTR _k$[ebp]
	cmp	eax, DWORD PTR _val$[ebp]
	jae	$L70349

; 204  : 				/* Initialize value */
; 205  : 				DynTableCell cell = {0};

	mov	DWORD PTR _cell$70350[ebp], 0
	mov	ecx, 15					; 0000000fH
	xor	eax, eax
	lea	edi, DWORD PTR _cell$70350[ebp+4]
	rep stosd

; 206  : 				cell.txt = dyntab_val(&val, k, 0);

	push	0
	mov	ecx, DWORD PTR _k$[ebp]
	push	ecx
	lea	edx, DWORD PTR _val$[ebp]
	push	edx
	call	_dyntab_val
	add	esp, 12					; 0000000cH
	mov	DWORD PTR _cell$70350[ebp], eax

; 207  : 				cell.len = dyntab_sz(&val, k, 0);

	push	0
	mov	eax, DWORD PTR _k$[ebp]
	push	eax
	lea	ecx, DWORD PTR _val$[ebp]
	push	ecx
	call	_dyntab_sz
	add	esp, 12					; 0000000cH
	mov	DWORD PTR _cell$70350[ebp+4], eax

; 208  : 				cell.Num = k + 1;

	mov	edx, DWORD PTR _k$[ebp]
	add	edx, 1
	mov	DWORD PTR _cell$70350[ebp+36], edx

; 209  : 				STRIP_SPACES_AROUND(cell.txt, cell.len);

	cmp	DWORD PTR _cell$70350[ebp], 0
	je	$L70358
$L70353:
	cmp	DWORD PTR _cell$70350[ebp+4], 0
	je	SHORT $L70354
	mov	eax, DWORD PTR _cell$70350[ebp]
	movsx	ecx, BYTE PTR [eax]
	push	ecx
	push	OFFSET FLAT:$SG70355
	call	_strchr
	add	esp, 8
	test	eax, eax
	je	SHORT $L70354
	mov	edx, DWORD PTR _cell$70350[ebp]
	add	edx, 1
	mov	DWORD PTR _cell$70350[ebp], edx
	mov	eax, DWORD PTR _cell$70350[ebp+4]
	sub	eax, 1
	mov	DWORD PTR _cell$70350[ebp+4], eax
	jmp	SHORT $L70353
$L70354:
	cmp	DWORD PTR _cell$70350[ebp+4], 0
	je	SHORT $L70358
	mov	ecx, DWORD PTR _cell$70350[ebp]
	add	ecx, DWORD PTR _cell$70350[ebp+4]
	movsx	edx, BYTE PTR [ecx-1]
	push	edx
	push	OFFSET FLAT:$SG70359
	call	_strchr
	add	esp, 8
	test	eax, eax
	je	SHORT $L70358
	mov	eax, DWORD PTR _cell$70350[ebp+4]
	sub	eax, 1
	mov	DWORD PTR _cell$70350[ebp+4], eax
	jmp	SHORT $L70354
$L70358:

; 210  : 
; 211  : 				/* Ignore empty values */
; 212  : 				if(!cell.len) continue;

	cmp	DWORD PTR _cell$70350[ebp+4], 0
	jne	SHORT $L70360
	jmp	$L70348
$L70360:

; 213  : 
; 214  : 				/* If field is not relation */
; 215  : 				if(!fields[j].id_relfld && !fields[j].i_rel)

	mov	ecx, DWORD PTR _j$[ebp]
	imul	ecx, 24					; 00000018H
	mov	edx, DWORD PTR _fields$[ebp]
	cmp	DWORD PTR [edx+ecx+12], 0
	jne	$L70361
	mov	eax, DWORD PTR _j$[ebp]
	imul	eax, 24					; 00000018H
	mov	ecx, DWORD PTR _fields$[ebp]
	cmp	DWORD PTR [ecx+eax+8], 0
	jne	$L70361

; 217  : 					cell.IdField = fields[j].id;

	mov	edx, DWORD PTR _j$[ebp]
	imul	edx, 24					; 00000018H
	mov	eax, DWORD PTR _fields$[ebp]
	mov	ecx, DWORD PTR [eax+edx]
	mov	DWORD PTR _cell$70350[ebp+28], ecx

; 218  : 					cell.field = dyntab_val(data, 0, j);

	mov	edx, DWORD PTR _j$[ebp]
	push	edx
	push	0
	mov	eax, DWORD PTR _data$[ebp]
	push	eax
	call	_dyntab_val
	add	esp, 12					; 0000000cH
	mov	DWORD PTR _cell$70350[ebp+8], eax

; 219  : 					cell.b_relation = (char)(fields[j].modif == F_RelObj);

	mov	ecx, DWORD PTR _j$[ebp]
	imul	ecx, 24					; 00000018H
	mov	edx, DWORD PTR _fields$[ebp]
	xor	eax, eax
	cmp	DWORD PTR [edx+ecx+20], 7
	sete	al
	mov	BYTE PTR _cell$70350[ebp+12], al

; 220  : 					DYNTAB_ADD_CELLP(&newval, newval.nbrows, 0, &cell);

	push	1
	lea	ecx, DWORD PTR _cell$70350[ebp]
	push	ecx
	push	0
	mov	edx, DWORD PTR _newval$[ebp]
	push	edx
	lea	eax, DWORD PTR _newval$[ebp]
	push	eax
	call	_dyntab_copy
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L70363
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29872], OFFSET FLAT:$SG70365
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 220		; 000000dcH
	jmp	$eva_err$70266
$L70363:

; 222  : 				else if(fields[j].i_rel >= 0)

	jmp	$L70393
$L70361:
	mov	eax, DWORD PTR _j$[ebp]
	imul	eax, 24					; 00000018H
	mov	ecx, DWORD PTR _fields$[ebp]
	cmp	DWORD PTR [ecx+eax+8], 0
	jb	$L70393

; 224  : 					/* Search for related object */
; 225  : 					DYNTAB_SET_CELLP(&srchval, 0, 0, &cell);

	push	0
	lea	edx, DWORD PTR _cell$70350[ebp]
	push	edx
	push	0
	push	0
	lea	eax, DWORD PTR _srchval$[ebp]
	push	eax
	call	_dyntab_copy
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L70368
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29872], OFFSET FLAT:$SG70370
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 225		; 000000e1H
	jmp	$eva_err$70266
$L70368:

; 226  : 					DYNTAB_SET_CELL(&relform, 0, 0, relformdest, fields[j].i_rel, 0);

	push	0
	push	0
	mov	eax, DWORD PTR _j$[ebp]
	imul	eax, 24					; 00000018H
	mov	ecx, DWORD PTR _fields$[ebp]
	mov	edx, DWORD PTR [ecx+eax+8]
	push	edx
	mov	eax, DWORD PTR _relformdest$[ebp]
	push	eax
	call	_dyntab_cell
	add	esp, 12					; 0000000cH
	push	eax
	push	0
	push	0
	lea	ecx, DWORD PTR _relform$[ebp]
	push	ecx
	call	_dyntab_copy
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L70371
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29872], OFFSET FLAT:$SG70373
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 226		; 000000e2H
	jmp	$eva_err$70266
$L70371:

; 227  : 					DYNTAB_FREE(relobj);

	lea	ecx, DWORD PTR _relobj$[ebp]
	push	ecx
	call	_dyntab_free
	add	esp, 4

; 228  : 					if(qry_field_value(cntxt, &relobj, fields[j].l_relfld, Exact, &srchval, &relform) ||
; 229  : 						(!relobj.nbrows &&
; 230  : 							qry_field_value(cntxt, &relobj, fields[j].l_relfld, Like, &srchval, &relform)))

	lea	edx, DWORD PTR _relform$[ebp]
	push	edx
	lea	eax, DWORD PTR _srchval$[ebp]
	push	eax
	push	6
	mov	ecx, DWORD PTR _j$[ebp]
	imul	ecx, 24					; 00000018H
	mov	edx, DWORD PTR _fields$[ebp]
	mov	eax, DWORD PTR [edx+ecx+16]
	push	eax
	lea	ecx, DWORD PTR _relobj$[ebp]
	push	ecx
	mov	edx, DWORD PTR _cntxt$[ebp]
	push	edx
	call	_qry_field_value
	add	esp, 24					; 00000018H
	test	eax, eax
	jne	SHORT $L70375
	cmp	DWORD PTR _relobj$[ebp], 0
	jne	SHORT $L70374
	lea	eax, DWORD PTR _relform$[ebp]
	push	eax
	lea	ecx, DWORD PTR _srchval$[ebp]
	push	ecx
	push	9
	mov	edx, DWORD PTR _j$[ebp]
	imul	edx, 24					; 00000018H
	mov	eax, DWORD PTR _fields$[ebp]
	mov	ecx, DWORD PTR [eax+edx+16]
	push	ecx
	lea	edx, DWORD PTR _relobj$[ebp]
	push	edx
	mov	eax, DWORD PTR _cntxt$[ebp]
	push	eax
	call	_qry_field_value
	add	esp, 24					; 00000018H
	test	eax, eax
	je	SHORT $L70374
$L70375:

; 231  : 						STACK_ERROR;

	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 231		; 000000e7H
	jmp	$eva_err$70266
$L70374:

; 232  : 
; 233  : 					/* If related object not found */
; 234  : 					if(!relobj.nbrows)

	cmp	DWORD PTR _relobj$[ebp], 0
	jne	$L70381

; 236  : 						/* Create new related object & add field value */
; 237  : 						if(qry_add_new_obj(cntxt, &relobj, DYNTAB_TOUL(&relform))) STACK_ERROR;

	push	10					; 0000000aH
	push	0
	push	0
	push	0
	lea	edx, DWORD PTR _relform$[ebp]
	push	edx
	call	_dyntab_val
	add	esp, 12					; 0000000cH
	push	eax
	call	_strtoul
	add	esp, 12					; 0000000cH
	push	eax
	lea	eax, DWORD PTR _relobj$[ebp]
	push	eax
	mov	ecx, DWORD PTR _cntxt$[ebp]
	push	ecx
	call	_qry_add_new_obj
	add	esp, 12					; 0000000cH
	test	eax, eax
	je	SHORT $L70378
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 237		; 000000edH
	jmp	$eva_err$70266
$L70378:

; 238  : 						cell.IdObj = DYNTAB_TOUL(&relobj);

	push	10					; 0000000aH
	push	0
	push	0
	push	0
	lea	eax, DWORD PTR _relobj$[ebp]
	push	eax
	call	_dyntab_val
	add	esp, 12					; 0000000cH
	push	eax
	call	_strtoul
	add	esp, 12					; 0000000cH
	mov	DWORD PTR _cell$70350[ebp+20], eax

; 239  : 						cell.IdField = fields[j].id_relfld;

	mov	ecx, DWORD PTR _j$[ebp]
	imul	ecx, 24					; 00000018H
	mov	edx, DWORD PTR _fields$[ebp]
	mov	eax, DWORD PTR [edx+ecx+12]
	mov	DWORD PTR _cell$70350[ebp+28], eax

; 240  : 						cell.Num = 1;

	mov	DWORD PTR _cell$70350[ebp+36], 1

; 241  : 						if(qry_add_val(cntxt, &cell, 0, NULL)) STACK_ERROR;

	push	0
	push	0
	lea	ecx, DWORD PTR _cell$70350[ebp]
	push	ecx
	mov	edx, DWORD PTR _cntxt$[ebp]
	push	edx
	call	_qry_add_val
	add	esp, 16					; 00000010H
	test	eax, eax
	je	SHORT $L70381
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 241		; 000000f1H
	jmp	$eva_err$70266
$L70381:

; 243  : 
; 244  : 					/* Add relation */
; 245  : 					cell.IdField = fields[j].id;

	mov	ecx, DWORD PTR _j$[ebp]
	imul	ecx, 24					; 00000018H
	mov	edx, DWORD PTR _fields$[ebp]
	mov	eax, DWORD PTR [edx+ecx]
	mov	DWORD PTR _cell$70350[ebp+28], eax

; 246  : 					cell.field = dyntab_val(data, 0, j);

	mov	ecx, DWORD PTR _j$[ebp]
	push	ecx
	push	0
	mov	edx, DWORD PTR _data$[ebp]
	push	edx
	call	_dyntab_val
	add	esp, 12					; 0000000cH
	mov	DWORD PTR _cell$70350[ebp+8], eax

; 247  : 					cell.b_relation = 1;

	mov	BYTE PTR _cell$70350[ebp+12], 1

; 248  : 					cell.IdValue = 0;

	mov	DWORD PTR _cell$70350[ebp+32], 0

; 249  : 					cell.IdField = fields[j].id;

	mov	eax, DWORD PTR _j$[ebp]
	imul	eax, 24					; 00000018H
	mov	ecx, DWORD PTR _fields$[ebp]
	mov	edx, DWORD PTR [ecx+eax]
	mov	DWORD PTR _cell$70350[ebp+28], edx

; 250  : 					if(!strcmp("_EVA_RELREVERSE", dyntab_val(reltype, fields[j].i_rel, 0)))

	push	0
	mov	eax, DWORD PTR _j$[ebp]
	imul	eax, 24					; 00000018H
	mov	ecx, DWORD PTR _fields$[ebp]
	mov	edx, DWORD PTR [ecx+eax+8]
	push	edx
	mov	eax, DWORD PTR _reltype$[ebp]
	push	eax
	call	_dyntab_val
	add	esp, 12					; 0000000cH
	push	eax
	push	OFFSET FLAT:$SG70383
	call	_strcmp
	add	esp, 8
	test	eax, eax
	jne	$L70382

; 252  : 						/* Add relation in original object if reverse relation */
; 253  : 						char sql[1024];
; 254  : 						cell.IdObj = DYNTAB_TOUL(&relobj);

	push	10					; 0000000aH
	push	0
	push	0
	push	0
	lea	ecx, DWORD PTR _relobj$[ebp]
	push	ecx
	call	_dyntab_val
	add	esp, 12					; 0000000cH
	push	eax
	call	_strtoul
	add	esp, 12					; 0000000cH
	mov	DWORD PTR _cell$70350[ebp+20], eax

; 255  : 						cell.txt = dyntab_val(&id_obj, 0, 0);

	push	0
	push	0
	lea	edx, DWORD PTR _id_obj$[ebp]
	push	edx
	call	_dyntab_val
	add	esp, 12					; 0000000cH
	mov	DWORD PTR _cell$70350[ebp], eax

; 256  : 						cell.len = dyntab_sz(&id_obj, 0, 0);

	push	0
	push	0
	lea	eax, DWORD PTR _id_obj$[ebp]
	push	eax
	call	_dyntab_sz
	add	esp, 12					; 0000000cH
	mov	DWORD PTR _cell$70350[ebp+4], eax

; 257  : 
; 258  : 						/* Read maximum value number */
; 259  : 						sprintf(sql, "SELECT MAX(Num) FROM TLink WHERE IdObj=%lu AND IdField=%lu AND DateDel IS NULL",
; 260  : 									cell.IdObj, cell.IdField);

	mov	ecx, DWORD PTR _cell$70350[ebp+28]
	push	ecx
	mov	edx, DWORD PTR _cell$70350[ebp+20]
	push	edx
	push	OFFSET FLAT:$SG70386
	lea	eax, DWORD PTR _sql$70384[ebp]
	push	eax
	call	_sprintf
	add	esp, 16					; 00000010H

; 261  : 						if(sql_exec_query(cntxt, sql) || sql_get_table(cntxt, &srchval, 2)) STACK_ERROR;

	lea	ecx, DWORD PTR _sql$70384[ebp]
	push	ecx
	mov	edx, DWORD PTR _cntxt$[ebp]
	push	edx
	call	_sql_exec_query
	add	esp, 8
	test	eax, eax
	jne	SHORT $L70388
	push	2
	lea	eax, DWORD PTR _srchval$[ebp]
	push	eax
	mov	ecx, DWORD PTR _cntxt$[ebp]
	push	ecx
	call	_sql_get_table
	add	esp, 12					; 0000000cH
	test	eax, eax
	je	SHORT $L70387
$L70388:
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 261		; 00000105H
	jmp	$eva_err$70266
$L70387:

; 262  : 						cell.Num = DYNTAB_TOUL(&srchval) + 1;

	push	10					; 0000000aH
	push	0
	push	0
	push	0
	lea	eax, DWORD PTR _srchval$[ebp]
	push	eax
	call	_dyntab_val
	add	esp, 12					; 0000000cH
	push	eax
	call	_strtoul
	add	esp, 12					; 0000000cH
	add	eax, 1
	mov	DWORD PTR _cell$70350[ebp+36], eax

; 263  : 						if(qry_add_val(cntxt, &cell, b_new ? 0 : 1, NULL)) STACK_ERROR;

	push	0
	xor	ecx, ecx
	cmp	DWORD PTR _b_new$70294[ebp], 0
	sete	cl
	push	ecx
	lea	edx, DWORD PTR _cell$70350[ebp]
	push	edx
	mov	eax, DWORD PTR _cntxt$[ebp]
	push	eax
	call	_qry_add_val
	add	esp, 16					; 00000010H
	test	eax, eax
	je	SHORT $L70391
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 263		; 00000107H
	jmp	$eva_err$70266
$L70391:

; 265  : 					else

	jmp	SHORT $L70393
$L70382:

; 267  : 						/* Add relation in imported object if direct relation */
; 268  : 						cell.txt = dyntab_val(&relobj, 0, 0);

	push	0
	push	0
	lea	edx, DWORD PTR _relobj$[ebp]
	push	edx
	call	_dyntab_val
	add	esp, 12					; 0000000cH
	mov	DWORD PTR _cell$70350[ebp], eax

; 269  : 						cell.len = dyntab_sz(&relobj, 0, 0);

	push	0
	push	0
	lea	eax, DWORD PTR _relobj$[ebp]
	push	eax
	call	_dyntab_sz
	add	esp, 12					; 0000000cH
	mov	DWORD PTR _cell$70350[ebp+4], eax

; 270  : 						cell.Num = k + 1;

	mov	ecx, DWORD PTR _k$[ebp]
	add	ecx, 1
	mov	DWORD PTR _cell$70350[ebp+36], ecx

; 271  : 						DYNTAB_ADD_CELLP(&newval, newval.nbrows, 0, &cell);

	push	1
	lea	edx, DWORD PTR _cell$70350[ebp]
	push	edx
	push	0
	mov	eax, DWORD PTR _newval$[ebp]
	push	eax
	lea	ecx, DWORD PTR _newval$[ebp]
	push	ecx
	call	_dyntab_copy
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L70393
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29872], OFFSET FLAT:$SG70395
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 271		; 0000010fH
	jmp	$eva_err$70266
$L70393:

; 274  : 			}

	jmp	$L70348
$L70349:

; 275  : 
; 276  : 			/* Update field values in object */
; 277  : 			if(((!fields[j].id_relfld && !fields[j].i_rel) || strcmp("_EVA_RELREVERSE", dyntab_val(reltype, fields[j].i_rel, 0))) &&
; 278  :                 qry_update_idobj_idfield(cntxt, idobj, fields[j].id, &newval, b_new ? 0 : 2)) STACK_ERROR;

	mov	ecx, DWORD PTR _j$[ebp]
	imul	ecx, 24					; 00000018H
	mov	edx, DWORD PTR _fields$[ebp]
	cmp	DWORD PTR [edx+ecx+12], 0
	jne	SHORT $L70398
	mov	eax, DWORD PTR _j$[ebp]
	imul	eax, 24					; 00000018H
	mov	ecx, DWORD PTR _fields$[ebp]
	cmp	DWORD PTR [ecx+eax+8], 0
	je	SHORT $L70397
$L70398:
	push	0
	mov	edx, DWORD PTR _j$[ebp]
	imul	edx, 24					; 00000018H
	mov	eax, DWORD PTR _fields$[ebp]
	mov	ecx, DWORD PTR [eax+edx+8]
	push	ecx
	mov	edx, DWORD PTR _reltype$[ebp]
	push	edx
	call	_dyntab_val
	add	esp, 12					; 0000000cH
	push	eax
	push	OFFSET FLAT:$SG70399
	call	_strcmp
	add	esp, 8
	test	eax, eax
	je	SHORT $L70396
$L70397:
	mov	eax, DWORD PTR _b_new$70294[ebp]
	neg	eax
	sbb	eax, eax
	and	al, -2					; fffffffeH
	add	eax, 2
	push	eax
	lea	ecx, DWORD PTR _newval$[ebp]
	push	ecx
	mov	edx, DWORD PTR _j$[ebp]
	imul	edx, 24					; 00000018H
	mov	eax, DWORD PTR _fields$[ebp]
	mov	ecx, DWORD PTR [eax+edx]
	push	ecx
	mov	edx, DWORD PTR _idobj$70295[ebp]
	push	edx
	mov	eax, DWORD PTR _cntxt$[ebp]
	push	eax
	call	_qry_update_idobj_idfield
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L70396
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 278		; 00000116H
	jmp	SHORT $eva_err$70266
$L70396:

; 280  : 	}

	jmp	$L70337
$L70338:
	jmp	$L70292
$eva_noerr$70262:

; 281  : 
; 282  : 	RETURN_OK_CLEANUP;

	push	0
	push	OFFSET FLAT:$SG70400
	push	OFFSET FLAT:$SG70401
	mov	edx, DWORD PTR _cntxt$[ebp]
	push	edx
	call	_err_clear
	add	esp, 16					; 00000010H
$eva_err$70266:
	mov	eax, DWORD PTR _cntxt$[ebp]
	cmp	DWORD PTR [eax+29872], 0
	je	SHORT $L70402
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	edx, DWORD PTR [ecx+29900]
	push	edx
	push	OFFSET FLAT:$SG70403
	push	OFFSET FLAT:$SG70404
	mov	eax, DWORD PTR _cntxt$[ebp]
	push	eax
	call	_err_add_context
	add	esp, 16					; 00000010H
$L70402:
	lea	ecx, DWORD PTR _id_obj$[ebp]
	push	ecx
	call	_dyntab_free
	add	esp, 4
	lea	edx, DWORD PTR _val$[ebp]
	push	edx
	call	_dyntab_free
	add	esp, 4
	lea	eax, DWORD PTR _newval$[ebp]
	push	eax
	call	_dyntab_free
	add	esp, 4
	lea	ecx, DWORD PTR _srchval$[ebp]
	push	ecx
	call	_dyntab_free
	add	esp, 4
	lea	edx, DWORD PTR _relobj$[ebp]
	push	edx
	call	_dyntab_free
	add	esp, 4
	lea	eax, DWORD PTR _relform$[ebp]
	push	eax
	call	_dyntab_free
	add	esp, 4
	lea	ecx, DWORD PTR _flt$[ebp]
	push	ecx
	call	_qry_build_free
	add	esp, 4
	mov	edx, DWORD PTR _cntxt$[ebp]
	xor	eax, eax
	cmp	DWORD PTR [edx+29872], 0
	setne	al

; 283  : }

	pop	edi
	pop	esi
	mov	esp, ebp
	pop	ebp
	ret	0
_import_tabrc_file ENDP
_TEXT	ENDS
PUBLIC	_import_handle_idlist
_DATA	SEGMENT
	ORG $+2
$SG70428 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70431 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70433 DB	'D:\Travail\ABI\EVA\V4.0\CGI\Brunix-2016\action_import.c', 00H
$SG70434 DB	'import_handle_idlist', 00H
	ORG $+3
$SG70436 DB	'D:\Travail\ABI\EVA\V4.0\CGI\Brunix-2016\action_import.c', 00H
$SG70437 DB	'import_handle_idlist', 00H
_DATA	ENDS
_TEXT	SEGMENT
_cntxt$ = 8
_id_old$ = 12
_id_list$ = 16
_i_list$ = 20
_id_obj$ = -20
_i$ = -24
_import_handle_idlist PROC NEAR

; 298  : ){

	push	ebp
	mov	ebp, esp
	sub	esp, 24					; 00000018H

; 299  : 	DynTable id_obj = {0};

	mov	DWORD PTR _id_obj$[ebp], 0
	xor	eax, eax
	mov	DWORD PTR _id_obj$[ebp+4], eax
	mov	DWORD PTR _id_obj$[ebp+8], eax
	mov	DWORD PTR _id_obj$[ebp+12], eax
	mov	DWORD PTR _id_obj$[ebp+16], eax

; 300  : 	unsigned long i;
; 301  : 
; 302  : 	/* Search object id in objects table */
; 303  : 	for(i = id_list->nbrows; i && strcmp(dyntab_val(id_list, i, 0), id_old->txt); i--);

	mov	ecx, DWORD PTR _id_list$[ebp]
	mov	edx, DWORD PTR [ecx]
	mov	DWORD PTR _i$[ebp], edx
	jmp	SHORT $L70420
$L70421:
	mov	eax, DWORD PTR _i$[ebp]
	sub	eax, 1
	mov	DWORD PTR _i$[ebp], eax
$L70420:
	cmp	DWORD PTR _i$[ebp], 0
	je	SHORT $L70422
	mov	ecx, DWORD PTR _id_old$[ebp]
	mov	edx, DWORD PTR [ecx]
	push	edx
	push	0
	mov	eax, DWORD PTR _i$[ebp]
	push	eax
	mov	ecx, DWORD PTR _id_list$[ebp]
	push	ecx
	call	_dyntab_val
	add	esp, 12					; 0000000cH
	push	eax
	call	_strcmp
	add	esp, 8
	test	eax, eax
	je	SHORT $L70422
	jmp	SHORT $L70421
$L70422:

; 304  : 
; 305  : 	/* If id not found */
; 306  : 	if(strcmp(dyntab_val(id_list, i, 0), id_old->txt))

	mov	edx, DWORD PTR _id_old$[ebp]
	mov	eax, DWORD PTR [edx]
	push	eax
	push	0
	mov	ecx, DWORD PTR _i$[ebp]
	push	ecx
	mov	edx, DWORD PTR _id_list$[ebp]
	push	edx
	call	_dyntab_val
	add	esp, 12					; 0000000cH
	push	eax
	call	_strcmp
	add	esp, 8
	test	eax, eax
	je	$L70429

; 308  : 		/* Create a new object & add old / new ids with pkey to id_list table */
; 309  : 		i = id_list->nbrows;

	mov	eax, DWORD PTR _id_list$[ebp]
	mov	ecx, DWORD PTR [eax]
	mov	DWORD PTR _i$[ebp], ecx

; 310  : 		if(qry_add_new_obj(cntxt, &id_obj, 0)) STACK_ERROR;

	push	0
	lea	edx, DWORD PTR _id_obj$[ebp]
	push	edx
	mov	eax, DWORD PTR _cntxt$[ebp]
	push	eax
	call	_qry_add_new_obj
	add	esp, 12					; 0000000cH
	test	eax, eax
	je	SHORT $L70424
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 310		; 00000136H
	jmp	$eva_err$70425
$L70424:

; 311  : 		DYNTAB_ADD_CELLP(id_list, i, 0, id_old);

	push	1
	mov	edx, DWORD PTR _id_old$[ebp]
	push	edx
	push	0
	mov	eax, DWORD PTR _i$[ebp]
	push	eax
	mov	ecx, DWORD PTR _id_list$[ebp]
	push	ecx
	call	_dyntab_copy
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L70426
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29872], OFFSET FLAT:$SG70428
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 311		; 00000137H
	jmp	SHORT $eva_err$70425
$L70426:

; 312  : 		DYNTAB_ADD_CELL(id_list, i, 1, &id_obj, 0, 0);

	push	1
	push	0
	push	0
	lea	ecx, DWORD PTR _id_obj$[ebp]
	push	ecx
	call	_dyntab_cell
	add	esp, 12					; 0000000cH
	push	eax
	push	1
	mov	edx, DWORD PTR _i$[ebp]
	push	edx
	mov	eax, DWORD PTR _id_list$[ebp]
	push	eax
	call	_dyntab_copy
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L70429
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29872], OFFSET FLAT:$SG70431
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 312		; 00000138H
	jmp	SHORT $eva_err$70425
$L70429:

; 314  : 
; 315  : 	*i_list = i;

	mov	eax, DWORD PTR _i_list$[ebp]
	mov	ecx, DWORD PTR _i$[ebp]
	mov	DWORD PTR [eax], ecx
$eva_noerr$70432:

; 316  : 
; 317  : 	RETURN_OK_CLEANUP;

	push	0
	push	OFFSET FLAT:$SG70433
	push	OFFSET FLAT:$SG70434
	mov	edx, DWORD PTR _cntxt$[ebp]
	push	edx
	call	_err_clear
	add	esp, 16					; 00000010H
$eva_err$70425:
	mov	eax, DWORD PTR _cntxt$[ebp]
	cmp	DWORD PTR [eax+29872], 0
	je	SHORT $L70435
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	edx, DWORD PTR [ecx+29900]
	push	edx
	push	OFFSET FLAT:$SG70436
	push	OFFSET FLAT:$SG70437
	mov	eax, DWORD PTR _cntxt$[ebp]
	push	eax
	call	_err_add_context
	add	esp, 16					; 00000010H
$L70435:
	lea	ecx, DWORD PTR _id_obj$[ebp]
	push	ecx
	call	_dyntab_free
	add	esp, 4
	mov	edx, DWORD PTR _cntxt$[ebp]
	xor	eax, eax
	cmp	DWORD PTR [edx+29872], 0
	setne	al

; 318  : }

	mov	esp, ebp
	pop	ebp
	ret	0
_import_handle_idlist ENDP
_TEXT	ENDS
PUBLIC	_import_objdata_check
EXTRN	_qsort_compare_values:NEAR
EXTRN	__snprintf:NEAR
EXTRN	_mem_free:NEAR
EXTRN	_qry_values_list:NEAR
EXTRN	_qry_obj_field:NEAR
EXTRN	_dynbuf_add:NEAR
EXTRN	_dynbuf_add3_int:NEAR
EXTRN	_qry_build_flt_select:NEAR
EXTRN	_qry_build_clauses:NEAR
EXTRN	_dyntab_sort:NEAR
_BSS	SEGMENT
$SG70509 DB	01H DUP (?)
	ALIGN	4

$SG70510 DB	01H DUP (?)
	ALIGN	4

$SG70511 DB	01H DUP (?)
	ALIGN	4

$SG70512 DB	01H DUP (?)
	ALIGN	4

$SG70565 DB	01H DUP (?)
_BSS	ENDS
_DATA	SEGMENT
	ORG $+3
$SG70464 DB	'SET SESSION max_join_size=DEFAULT', 00H
	ORG $+2
$SG70475 DB	'*', 00H
	ORG $+2
$SG70484 DB	'SELECT IdObj,COUNT(*) AS NbVal FROM TLink', 0aH, 'WHERE '
	DB	'DateDel IS NULL AND IdObj IN( ', 00H
	ORG $+1
$SG70486 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70489 DB	' ORDER BY IdObj DESC', 00H
	ORG $+3
$SG70490 DB	')', 0aH, 'GROUP BY IdObj HAVING NbVal=', 00H
	ORG $+1
$SG70492 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70517 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70522 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70527 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70530 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70537 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70539 DB	'R', 00H
	ORG $+2
$SG70546 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70550 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70559 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70562 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70564 DB	' AND ', 00H
	ORG $+2
$SG70566 DB	'%sTLink%ld.Num=%ld AND TLink%ld.Line', 00H
	ORG $+3
$SG70569 DB	'=%ld', 00H
	ORG $+3
$SG70573 DB	' IS NULL', 00H
	ORG $+3
$SG70575 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70579 DB	'*', 00H
	ORG $+2
$SG70580 DB	'D:\Travail\ABI\EVA\V4.0\CGI\Brunix-2016\action_import.c', 00H
$SG70581 DB	'import_objdata_check', 00H
	ORG $+3
$SG70583 DB	'D:\Travail\ABI\EVA\V4.0\CGI\Brunix-2016\action_import.c', 00H
$SG70584 DB	'import_objdata_check', 00H
_DATA	ENDS
_TEXT	SEGMENT
_cntxt$ = 8
_objdata$ = 12
_id_list$ = 16
_sqlres$ = -96
_curobjdata$ = -48
_dbobjdata$ = -72
_value$ = -28
_flt$ = -4564
_sql$ = -8
_i$ = -100
_j$ = -104
_k$ = -108
_cnt$ = -76
_b_next$ = -4568
_val$ = -4
_c$ = -52
_mode$70471 = -4572
_exactsamecnt$70479 = -4576
_r$70498 = -4580
_c1$70505 = -4584
_c2$70506 = -4588
_row$70524 = -4592
_node$70554 = -4596
_join$70555 = -4728
_printbuf$70556 = -4724
_import_objdata_check PROC NEAR

; 337  : ){

	push	ebp
	mov	ebp, esp
	mov	eax, 4748				; 0000128cH
	call	__chkstk
	push	edi

; 338  : 	DynTable sqlres = {0};

	mov	DWORD PTR _sqlres$[ebp], 0
	xor	eax, eax
	mov	DWORD PTR _sqlres$[ebp+4], eax
	mov	DWORD PTR _sqlres$[ebp+8], eax
	mov	DWORD PTR _sqlres$[ebp+12], eax
	mov	DWORD PTR _sqlres$[ebp+16], eax

; 339  : 	DynTable curobjdata = {0};

	mov	DWORD PTR _curobjdata$[ebp], 0
	xor	ecx, ecx
	mov	DWORD PTR _curobjdata$[ebp+4], ecx
	mov	DWORD PTR _curobjdata$[ebp+8], ecx
	mov	DWORD PTR _curobjdata$[ebp+12], ecx
	mov	DWORD PTR _curobjdata$[ebp+16], ecx

; 340  : 	DynTable dbobjdata = {0};

	mov	DWORD PTR _dbobjdata$[ebp], 0
	xor	edx, edx
	mov	DWORD PTR _dbobjdata$[ebp+4], edx
	mov	DWORD PTR _dbobjdata$[ebp+8], edx
	mov	DWORD PTR _dbobjdata$[ebp+12], edx
	mov	DWORD PTR _dbobjdata$[ebp+16], edx

; 341  : 	DynTable value = {0};

	mov	DWORD PTR _value$[ebp], 0
	xor	eax, eax
	mov	DWORD PTR _value$[ebp+4], eax
	mov	DWORD PTR _value$[ebp+8], eax
	mov	DWORD PTR _value$[ebp+12], eax
	mov	DWORD PTR _value$[ebp+16], eax

; 342  : 	QryBuild flt = {{0}};

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

; 343  : 	DynBuffer *sql = NULL;

	mov	DWORD PTR _sql$[ebp], 0

; 344  : 	unsigned long i, j, k, cnt = 0;

	mov	DWORD PTR _cnt$[ebp], 0

; 345  : 	int b_next = 0;

	mov	DWORD PTR _b_next$[ebp], 0

; 346  : 	DynTableCell *val, *c;
; 347  : 
; 348  : 	/* Allow big selects */
; 349  : 	if(sql_exec_query(cntxt, "SET SESSION max_join_size=DEFAULT")) STACK_ERROR;

	push	OFFSET FLAT:$SG70464
	mov	edx, DWORD PTR _cntxt$[ebp]
	push	edx
	call	_sql_exec_query
	add	esp, 8
	test	eax, eax
	je	SHORT $L70463
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 349		; 0000015dH
	jmp	$eva_err$70465
$L70463:

; 350  : 
; 351  : 	/* Search for existing objects in db (except first obj) */
; 352  : 	if(objdata->nbrows <= 2) RETURN_OK;

	mov	ecx, DWORD PTR _objdata$[ebp]
	cmp	DWORD PTR [ecx], 2
	ja	SHORT $L70466
	jmp	$eva_noerr$70467
$L70466:

; 353  : 	for(i = objdata->nbrows - 1, k = i; dyntab_cmp(objdata, 1, 0, objdata, i + 1, 0); i--)

	mov	edx, DWORD PTR _objdata$[ebp]
	mov	eax, DWORD PTR [edx]
	sub	eax, 1
	mov	DWORD PTR _i$[ebp], eax
	mov	ecx, DWORD PTR _i$[ebp]
	mov	DWORD PTR _k$[ebp], ecx
	jmp	SHORT $L70468
$L70469:
	mov	edx, DWORD PTR _i$[ebp]
	sub	edx, 1
	mov	DWORD PTR _i$[ebp], edx
$L70468:
	push	0
	mov	eax, DWORD PTR _i$[ebp]
	add	eax, 1
	push	eax
	mov	ecx, DWORD PTR _objdata$[ebp]
	push	ecx
	push	0
	push	1
	mov	edx, DWORD PTR _objdata$[ebp]
	push	edx
	call	_dyntab_cmp
	add	esp, 24					; 00000018H
	test	eax, eax
	je	$L70470

; 355  : 		MatchMode mode = Like;

	mov	DWORD PTR _mode$70471[ebp], 9
$L70473:

; 356  : 
; 357  : 		/* Display progress bar */
; 358  : 		while(cnt <= 60 * (objdata->nbrows - i) / objdata->nbrows) { printf("*"); fflush(stdout); cnt++; }

	mov	eax, DWORD PTR _objdata$[ebp]
	mov	eax, DWORD PTR [eax]
	sub	eax, DWORD PTR _i$[ebp]
	imul	eax, 60					; 0000003cH
	mov	ecx, DWORD PTR _objdata$[ebp]
	xor	edx, edx
	div	DWORD PTR [ecx]
	cmp	DWORD PTR _cnt$[ebp], eax
	ja	SHORT $L70474
	push	OFFSET FLAT:$SG70475
	call	_printf
	add	esp, 4
	push	OFFSET FLAT:__iob+32
	call	_fflush
	add	esp, 4
	mov	edx, DWORD PTR _cnt$[ebp]
	add	edx, 1
	mov	DWORD PTR _cnt$[ebp], edx
	jmp	SHORT $L70473
$L70474:

; 359  : 
; 360  : 		/* If obj different from previous line */
; 361  : 		if((b_next || curobjdata.nbrows) && dyntab_cmp(objdata, i, 0, objdata, i + 1, 0))

	cmp	DWORD PTR _b_next$[ebp], 0
	jne	SHORT $L70477
	cmp	DWORD PTR _curobjdata$[ebp], 0
	je	$L70476
$L70477:
	push	0
	mov	eax, DWORD PTR _i$[ebp]
	add	eax, 1
	push	eax
	mov	ecx, DWORD PTR _objdata$[ebp]
	push	ecx
	push	0
	mov	edx, DWORD PTR _i$[ebp]
	push	edx
	mov	eax, DWORD PTR _objdata$[ebp]
	push	eax
	call	_dyntab_cmp
	add	esp, 24					; 00000018H
	test	eax, eax
	je	$L70476

; 363  : 			/* If search is relevant */
; 364  : 			val = dyntab_cell(objdata, k, 0);

	push	0
	mov	ecx, DWORD PTR _k$[ebp]
	push	ecx
	mov	edx, DWORD PTR _objdata$[ebp]
	push	edx
	call	_dyntab_cell
	add	esp, 12					; 0000000cH
	mov	DWORD PTR _val$[ebp], eax

; 365  : 			if(val && !b_next)

	cmp	DWORD PTR _val$[ebp], 0
	je	$L70478
	cmp	DWORD PTR _b_next$[ebp], 0
	jne	$L70478

; 367  : 				/* Search for object with same values */
; 368  : 				int exactsamecnt = 0;

	mov	DWORD PTR _exactsamecnt$70479[ebp], 0

; 369  : 				M_FREE(sql);

	mov	eax, DWORD PTR _sql$[ebp]
	push	eax
	call	_mem_free
	add	esp, 4
	mov	DWORD PTR _sql$[ebp], 0

; 370  : 				DYNTAB_FREE(sqlres);

	lea	ecx, DWORD PTR _sqlres$[ebp]
	push	ecx
	call	_dyntab_free
	add	esp, 4

; 371  : 				flt.b_straightjoin = 1;

	mov	DWORD PTR _flt$[ebp+60], 1

; 372  : 				if(qry_build_clauses(cntxt, &flt, 0) ||
; 373  : 					qry_build_flt_select(cntxt, &sql, &sqlres, &flt, 0, 0) ||
; 374  : 					sql_exec_query(cntxt, sql->data) || sql_get_table(cntxt, &sqlres, 2))

	push	0
	lea	edx, DWORD PTR _flt$[ebp]
	push	edx
	mov	eax, DWORD PTR _cntxt$[ebp]
	push	eax
	call	_qry_build_clauses
	add	esp, 12					; 0000000cH
	test	eax, eax
	jne	SHORT $L70481
	push	0
	push	0
	lea	ecx, DWORD PTR _flt$[ebp]
	push	ecx
	lea	edx, DWORD PTR _sqlres$[ebp]
	push	edx
	lea	eax, DWORD PTR _sql$[ebp]
	push	eax
	mov	ecx, DWORD PTR _cntxt$[ebp]
	push	ecx
	call	_qry_build_flt_select
	add	esp, 24					; 00000018H
	test	eax, eax
	jne	SHORT $L70481
	mov	edx, DWORD PTR _sql$[ebp]
	add	edx, 8
	push	edx
	mov	eax, DWORD PTR _cntxt$[ebp]
	push	eax
	call	_sql_exec_query
	add	esp, 8
	test	eax, eax
	jne	SHORT $L70481
	push	2
	lea	ecx, DWORD PTR _sqlres$[ebp]
	push	ecx
	mov	edx, DWORD PTR _cntxt$[ebp]
	push	edx
	call	_sql_get_table
	add	esp, 12					; 0000000cH
	test	eax, eax
	je	SHORT $L70480
$L70481:

; 375  : 					STACK_ERROR;

	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 375		; 00000177H
	jmp	$eva_err$70465
$L70480:

; 376  : 
; 377  : 				/* Check for values count */
; 378  : 				M_FREE(sql);

	mov	ecx, DWORD PTR _sql$[ebp]
	push	ecx
	call	_mem_free
	add	esp, 4
	mov	DWORD PTR _sql$[ebp], 0

; 380  : 					"SELECT IdObj,COUNT(*) AS NbVal FROM TLink\n"
; 381  : 					"WHERE DateDel IS NULL AND IdObj IN( ");

	push	0
	push	0
	push	78					; 0000004eH
	push	OFFSET FLAT:$SG70484
	lea	edx, DWORD PTR _sql$[ebp]
	push	edx
	call	_dynbuf_add
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L70483
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29872], OFFSET FLAT:$SG70486
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 381		; 0000017dH
	jmp	$eva_err$70465
$L70483:

; 382  : 				if(qry_values_list(cntxt, &sqlres, 0, &sql)) STACK_ERROR;

	lea	edx, DWORD PTR _sql$[ebp]
	push	edx
	push	0
	lea	eax, DWORD PTR _sqlres$[ebp]
	push	eax
	mov	ecx, DWORD PTR _cntxt$[ebp]
	push	ecx
	call	_qry_values_list
	add	esp, 16					; 00000010H
	test	eax, eax
	je	SHORT $L70487
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 382		; 0000017eH
	jmp	$eva_err$70465
$L70487:

; 384  : 					"GROUP BY IdObj HAVING NbVal=", k - i, " ORDER BY IdObj DESC");

	push	20					; 00000014H
	push	OFFSET FLAT:$SG70489
	mov	eax, DWORD PTR _k$[ebp]
	sub	eax, DWORD PTR _i$[ebp]
	push	eax
	push	30					; 0000001eH
	push	OFFSET FLAT:$SG70490
	lea	ecx, DWORD PTR _sql$[ebp]
	push	ecx
	call	_dynbuf_add3_int
	add	esp, 24					; 00000018H
	test	eax, eax
	je	SHORT $L70488
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29872], OFFSET FLAT:$SG70492
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 384		; 00000180H
	jmp	$eva_err$70465
$L70488:

; 385  : 				if(sql_exec_query(cntxt, sql->data) || sql_get_table(cntxt, &sqlres, 2))

	mov	ecx, DWORD PTR _sql$[ebp]
	add	ecx, 8
	push	ecx
	mov	edx, DWORD PTR _cntxt$[ebp]
	push	edx
	call	_sql_exec_query
	add	esp, 8
	test	eax, eax
	jne	SHORT $L70494
	push	2
	lea	eax, DWORD PTR _sqlres$[ebp]
	push	eax
	mov	ecx, DWORD PTR _cntxt$[ebp]
	push	ecx
	call	_sql_get_table
	add	esp, 12					; 0000000cH
	test	eax, eax
	je	SHORT $L70493
$L70494:

; 386  : 					STACK_ERROR;

	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 386		; 00000182H
	jmp	$eva_err$70465
$L70493:

; 387  : 
; 388  : 				/* Look for exactly same object */
; 389  : 				dyntab_sort(&curobjdata, qsort_compare_values);

	push	OFFSET FLAT:_qsort_compare_values
	lea	eax, DWORD PTR _curobjdata$[ebp]
	push	eax
	call	_dyntab_sort
	add	esp, 8

; 390  : 				for(j = 0; j < sqlres.nbrows; j++)

	mov	DWORD PTR _j$[ebp], 0
	jmp	SHORT $L70495
$L70496:
	mov	ecx, DWORD PTR _j$[ebp]
	add	ecx, 1
	mov	DWORD PTR _j$[ebp], ecx
$L70495:
	mov	edx, DWORD PTR _j$[ebp]
	cmp	edx, DWORD PTR _sqlres$[ebp]
	jae	$L70497

; 392  : 					unsigned long r;
; 393  : 					if(qry_obj_field(cntxt, &dbobjdata, DYNTAB_TOULRC(&sqlres, j, 0), NULL)) STACK_ERROR;

	push	0
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
	lea	edx, DWORD PTR _dbobjdata$[ebp]
	push	edx
	mov	eax, DWORD PTR _cntxt$[ebp]
	push	eax
	call	_qry_obj_field
	add	esp, 16					; 00000010H
	test	eax, eax
	je	SHORT $L70501
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 393		; 00000189H
	jmp	$eva_err$70465
$L70501:

; 394  : 					dyntab_sort(&dbobjdata, qsort_compare_values);

	push	OFFSET FLAT:_qsort_compare_values
	lea	edx, DWORD PTR _dbobjdata$[ebp]
	push	edx
	call	_dyntab_sort
	add	esp, 8

; 395  : 					for(r = 0; r < dbobjdata.nbrows; r++)

	mov	DWORD PTR _r$70498[ebp], 0
	jmp	SHORT $L70502
$L70503:
	mov	eax, DWORD PTR _r$70498[ebp]
	add	eax, 1
	mov	DWORD PTR _r$70498[ebp], eax
$L70502:
	mov	ecx, DWORD PTR _r$70498[ebp]
	cmp	ecx, DWORD PTR _dbobjdata$[ebp]
	jae	$L70504

; 397  : 						DynTableCell *c1 = dyntab_cell(&curobjdata, r, 0);

	push	0
	mov	edx, DWORD PTR _r$70498[ebp]
	push	edx
	lea	eax, DWORD PTR _curobjdata$[ebp]
	push	eax
	call	_dyntab_cell
	add	esp, 12					; 0000000cH
	mov	DWORD PTR _c1$70505[ebp], eax

; 398  : 						DynTableCell *c2 = dyntab_cell(&dbobjdata, r, 0);

	push	0
	mov	ecx, DWORD PTR _r$70498[ebp]
	push	ecx
	lea	edx, DWORD PTR _dbobjdata$[ebp]
	push	edx
	call	_dyntab_cell
	add	esp, 12					; 0000000cH
	mov	DWORD PTR _c2$70506[ebp], eax

; 399  : 						if(c1->Num != c2->Num || c1->Line != c2->Line ||
; 400  : 							STRCMPNUL(c1->txt, c2->txt) || STRCMPNUL(c1->field, c2->field))

	mov	eax, DWORD PTR _c1$70505[ebp]
	mov	ecx, DWORD PTR _c2$70506[ebp]
	mov	edx, DWORD PTR [eax+36]
	cmp	edx, DWORD PTR [ecx+36]
	jne	$L70508
	mov	eax, DWORD PTR _c1$70505[ebp]
	mov	ecx, DWORD PTR _c2$70506[ebp]
	mov	edx, DWORD PTR [eax+40]
	cmp	edx, DWORD PTR [ecx+40]
	jne	$L70508
	mov	eax, DWORD PTR _c2$70506[ebp]
	cmp	DWORD PTR [eax], 0
	je	SHORT $L71103
	mov	ecx, DWORD PTR _c2$70506[ebp]
	mov	edx, DWORD PTR [ecx]
	mov	DWORD PTR -4732+[ebp], edx
	jmp	SHORT $L71104
$L71103:
	mov	DWORD PTR -4732+[ebp], OFFSET FLAT:$SG70509
$L71104:
	mov	eax, DWORD PTR _c1$70505[ebp]
	cmp	DWORD PTR [eax], 0
	je	SHORT $L71105
	mov	ecx, DWORD PTR _c1$70505[ebp]
	mov	edx, DWORD PTR [ecx]
	mov	DWORD PTR -4736+[ebp], edx
	jmp	SHORT $L71106
$L71105:
	mov	DWORD PTR -4736+[ebp], OFFSET FLAT:$SG70510
$L71106:
	mov	eax, DWORD PTR -4732+[ebp]
	push	eax
	mov	ecx, DWORD PTR -4736+[ebp]
	push	ecx
	call	_strcmp
	add	esp, 8
	test	eax, eax
	jne	SHORT $L70508
	mov	edx, DWORD PTR _c2$70506[ebp]
	cmp	DWORD PTR [edx+8], 0
	je	SHORT $L71107
	mov	eax, DWORD PTR _c2$70506[ebp]
	mov	ecx, DWORD PTR [eax+8]
	mov	DWORD PTR -4740+[ebp], ecx
	jmp	SHORT $L71108
$L71107:
	mov	DWORD PTR -4740+[ebp], OFFSET FLAT:$SG70511
$L71108:
	mov	edx, DWORD PTR _c1$70505[ebp]
	cmp	DWORD PTR [edx+8], 0
	je	SHORT $L71109
	mov	eax, DWORD PTR _c1$70505[ebp]
	mov	ecx, DWORD PTR [eax+8]
	mov	DWORD PTR -4744+[ebp], ecx
	jmp	SHORT $L71110
$L71109:
	mov	DWORD PTR -4744+[ebp], OFFSET FLAT:$SG70512
$L71110:
	mov	edx, DWORD PTR -4740+[ebp]
	push	edx
	mov	eax, DWORD PTR -4744+[ebp]
	push	eax
	call	_strcmp
	add	esp, 8
	test	eax, eax
	je	SHORT $L70507
$L70508:

; 401  : 							break;

	jmp	SHORT $L70504
$L70507:

; 402  : 					}

	jmp	$L70503
$L70504:

; 403  : 					if(r == dbobjdata.nbrows)

	mov	ecx, DWORD PTR _r$70498[ebp]
	cmp	ecx, DWORD PTR _dbobjdata$[ebp]
	jne	SHORT $L70513

; 405  : 						/* Same object : set as used obj if none & increment counter */
; 406  : 						if(j && dyntab_sz(&sqlres, 0, 0)) DYNTAB_SET_CELL(&sqlres, 0, 0, &sqlres, j, 0);

	cmp	DWORD PTR _j$[ebp], 0
	je	SHORT $L70515
	push	0
	push	0
	lea	edx, DWORD PTR _sqlres$[ebp]
	push	edx
	call	_dyntab_sz
	add	esp, 12					; 0000000cH
	test	eax, eax
	je	SHORT $L70515
	push	0
	push	0
	mov	eax, DWORD PTR _j$[ebp]
	push	eax
	lea	ecx, DWORD PTR _sqlres$[ebp]
	push	ecx
	call	_dyntab_cell
	add	esp, 12					; 0000000cH
	push	eax
	push	0
	push	0
	lea	edx, DWORD PTR _sqlres$[ebp]
	push	edx
	call	_dyntab_copy
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L70515
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29872], OFFSET FLAT:$SG70517
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 406		; 00000196H
	jmp	$eva_err$70465
$L70515:

; 407  : 						exactsamecnt++;

	mov	edx, DWORD PTR _exactsamecnt$70479[ebp]
	add	edx, 1
	mov	DWORD PTR _exactsamecnt$70479[ebp], edx

; 409  : 					else

	jmp	SHORT $L70520
$L70513:

; 410  : 						DYNTAB_SET_CELLP(&sqlres, j, 0, NULL);

	push	0
	push	0
	push	0
	mov	eax, DWORD PTR _j$[ebp]
	push	eax
	lea	ecx, DWORD PTR _sqlres$[ebp]
	push	ecx
	call	_dyntab_copy
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L70520
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29872], OFFSET FLAT:$SG70522
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 410		; 0000019aH
	jmp	$eva_err$70465
$L70520:

; 411  : 				}

	jmp	$L70496
$L70497:

; 412  : 
; 413  : 				/* If object(s) found : add most recent to id_list */
; 414  : 				if(exactsamecnt)

	cmp	DWORD PTR _exactsamecnt$70479[ebp], 0
	je	$L70523

; 416  : 					unsigned long row = id_list->nbrows;

	mov	ecx, DWORD PTR _id_list$[ebp]
	mov	edx, DWORD PTR [ecx]
	mov	DWORD PTR _row$70524[ebp], edx

; 417  : 					DYNTAB_SET_CELL(id_list, row, 0, objdata, i + 1, 0);

	push	0
	push	0
	mov	eax, DWORD PTR _i$[ebp]
	add	eax, 1
	push	eax
	mov	ecx, DWORD PTR _objdata$[ebp]
	push	ecx
	call	_dyntab_cell
	add	esp, 12					; 0000000cH
	push	eax
	push	0
	mov	edx, DWORD PTR _row$70524[ebp]
	push	edx
	mov	eax, DWORD PTR _id_list$[ebp]
	push	eax
	call	_dyntab_copy
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L70525
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29872], OFFSET FLAT:$SG70527
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 417		; 000001a1H
	jmp	$eva_err$70465
$L70525:

; 418  : 					DYNTAB_ADD_CELL(id_list, row, 1, &sqlres, 0, 0);

	push	1
	push	0
	push	0
	lea	eax, DWORD PTR _sqlres$[ebp]
	push	eax
	call	_dyntab_cell
	add	esp, 12					; 0000000cH
	push	eax
	push	1
	mov	ecx, DWORD PTR _row$70524[ebp]
	push	ecx
	mov	edx, DWORD PTR _id_list$[ebp]
	push	edx
	call	_dyntab_copy
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L70528
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29872], OFFSET FLAT:$SG70530
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 418		; 000001a2H
	jmp	$eva_err$70465
$L70528:

; 419  : 					val->col = exactsamecnt > 1 ? 4 : 3;

	xor	edx, edx
	cmp	DWORD PTR _exactsamecnt$70479[ebp], 1
	setg	dl
	add	edx, 3
	mov	eax, DWORD PTR _val$[ebp]
	mov	DWORD PTR [eax+56], edx

; 420  : 					dyntab_cell(id_list, row, 1)->col = k;

	push	1
	mov	ecx, DWORD PTR _row$70524[ebp]
	push	ecx
	mov	edx, DWORD PTR _id_list$[ebp]
	push	edx
	call	_dyntab_cell
	add	esp, 12					; 0000000cH
	mov	ecx, DWORD PTR _k$[ebp]
	mov	DWORD PTR [eax+56], ecx

; 422  : 				else

	jmp	SHORT $L70531
$L70523:

; 423  : 					val->col = 2;

	mov	edx, DWORD PTR _val$[ebp]
	mov	DWORD PTR [edx+56], 2
$L70531:

; 425  : 			else if(val && !val->col) val->col = 1;

	jmp	SHORT $L70533
$L70478:
	cmp	DWORD PTR _val$[ebp], 0
	je	SHORT $L70533
	mov	eax, DWORD PTR _val$[ebp]
	cmp	DWORD PTR [eax+56], 0
	jne	SHORT $L70533
	mov	ecx, DWORD PTR _val$[ebp]
	mov	DWORD PTR [ecx+56], 1
$L70533:

; 426  : 
; 427  : 			/* Initialize for next object - skip if already processed */
; 428  : 			k = i;

	mov	edx, DWORD PTR _i$[ebp]
	mov	DWORD PTR _k$[ebp], edx

; 429  : 			qry_build_free(&flt);

	lea	eax, DWORD PTR _flt$[ebp]
	push	eax
	call	_qry_build_free
	add	esp, 4

; 430  : 			val = dyntab_cell(objdata, i, 0);

	push	0
	mov	ecx, DWORD PTR _i$[ebp]
	push	ecx
	mov	edx, DWORD PTR _objdata$[ebp]
	push	edx
	call	_dyntab_cell
	add	esp, 12					; 0000000cH
	mov	DWORD PTR _val$[ebp], eax

; 431  : 			b_next = val->col > 1;

	mov	eax, DWORD PTR _val$[ebp]
	mov	ecx, 1
	cmp	ecx, DWORD PTR [eax+56]
	sbb	edx, edx
	neg	edx
	mov	DWORD PTR _b_next$[ebp], edx

; 432  : 			dyntab_free(&curobjdata);

	lea	eax, DWORD PTR _curobjdata$[ebp]
	push	eax
	call	_dyntab_free
	add	esp, 4
$L70476:

; 434  : 
; 435  : 		/* Do not process until next object if required */
; 436  : 		if(b_next) continue;

	cmp	DWORD PTR _b_next$[ebp], 0
	je	SHORT $L70534
	jmp	$L70469
$L70534:

; 437  : 
; 438  : 		/* Store object value */
; 439  : 		DYNTAB_SET_CELL(&curobjdata, curobjdata.nbrows, 0, objdata, i, 2);

	push	0
	push	2
	mov	ecx, DWORD PTR _i$[ebp]
	push	ecx
	mov	edx, DWORD PTR _objdata$[ebp]
	push	edx
	call	_dyntab_cell
	add	esp, 12					; 0000000cH
	push	eax
	push	0
	mov	eax, DWORD PTR _curobjdata$[ebp]
	push	eax
	lea	ecx, DWORD PTR _curobjdata$[ebp]
	push	ecx
	call	_dyntab_copy
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L70535
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29872], OFFSET FLAT:$SG70537
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 439		; 000001b7H
	jmp	$eva_err$70465
$L70535:

; 440  : 		c = dyntab_cell(&curobjdata, curobjdata.nbrows - 1, 0);

	push	0
	mov	ecx, DWORD PTR _curobjdata$[ebp]
	sub	ecx, 1
	push	ecx
	lea	edx, DWORD PTR _curobjdata$[ebp]
	push	edx
	call	_dyntab_cell
	add	esp, 12					; 0000000cH
	mov	DWORD PTR _c$[ebp], eax

; 441  : 		c->field = dyntab_val(objdata, i, 1);

	push	1
	mov	eax, DWORD PTR _i$[ebp]
	push	eax
	mov	ecx, DWORD PTR _objdata$[ebp]
	push	ecx
	call	_dyntab_val
	add	esp, 12					; 0000000cH
	mov	edx, DWORD PTR _c$[ebp]
	mov	DWORD PTR [edx+8], eax

; 442  : 
; 443  : 		/* If value is a relation */
; 444  : 		if(!strcmp("R", dyntab_val(objdata, i, 3)))

	push	3
	mov	eax, DWORD PTR _i$[ebp]
	push	eax
	mov	ecx, DWORD PTR _objdata$[ebp]
	push	ecx
	call	_dyntab_val
	add	esp, 12					; 0000000cH
	push	eax
	push	OFFSET FLAT:$SG70539
	call	_strcmp
	add	esp, 8
	test	eax, eax
	jne	$L70538

; 446  : 			/* Search related object id in objects table */
; 447  : 			for(j = 0; j < id_list->nbrows && dyntab_cmp(id_list, j, 0, objdata, i, 2); j++);

	mov	DWORD PTR _j$[ebp], 0
	jmp	SHORT $L70540
$L70541:
	mov	edx, DWORD PTR _j$[ebp]
	add	edx, 1
	mov	DWORD PTR _j$[ebp], edx
$L70540:
	mov	eax, DWORD PTR _id_list$[ebp]
	mov	ecx, DWORD PTR _j$[ebp]
	cmp	ecx, DWORD PTR [eax]
	jae	SHORT $L70542
	push	2
	mov	edx, DWORD PTR _i$[ebp]
	push	edx
	mov	eax, DWORD PTR _objdata$[ebp]
	push	eax
	push	0
	mov	ecx, DWORD PTR _j$[ebp]
	push	ecx
	mov	edx, DWORD PTR _id_list$[ebp]
	push	edx
	call	_dyntab_cmp
	add	esp, 24					; 00000018H
	test	eax, eax
	je	SHORT $L70542
	jmp	SHORT $L70541
$L70542:

; 448  : 			if(j >= id_list->nbrows)

	mov	eax, DWORD PTR _id_list$[ebp]
	mov	ecx, DWORD PTR _j$[ebp]
	cmp	ecx, DWORD PTR [eax]
	jb	SHORT $L70543

; 450  : 				/* Related object not found : object is different - skip search */
; 451  : 				b_next = 1;

	mov	DWORD PTR _b_next$[ebp], 1

; 452  : 				continue;

	jmp	$L70469
$L70543:

; 454  : 			mode = RelList;

	mov	DWORD PTR _mode$70471[ebp], 3

; 455  : 			DYNTAB_SET_CELL(&value, 0, 0, id_list, j, 1);

	push	0
	push	1
	mov	edx, DWORD PTR _j$[ebp]
	push	edx
	mov	eax, DWORD PTR _id_list$[ebp]
	push	eax
	call	_dyntab_cell
	add	esp, 12					; 0000000cH
	push	eax
	push	0
	push	0
	lea	ecx, DWORD PTR _value$[ebp]
	push	ecx
	call	_dyntab_copy
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L70544
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29872], OFFSET FLAT:$SG70546
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 455		; 000001c7H
	jmp	$eva_err$70465
$L70544:

; 456  : 			c->b_relation = 1;

	mov	ecx, DWORD PTR _c$[ebp]
	mov	BYTE PTR [ecx+12], 1

; 458  : 		else

	jmp	SHORT $L70548
$L70538:

; 459  : 			DYNTAB_SET_CELL(&value, 0, 0, objdata, i, 2);

	push	0
	push	2
	mov	edx, DWORD PTR _i$[ebp]
	push	edx
	mov	eax, DWORD PTR _objdata$[ebp]
	push	eax
	call	_dyntab_cell
	add	esp, 12					; 0000000cH
	push	eax
	push	0
	push	0
	lea	ecx, DWORD PTR _value$[ebp]
	push	ecx
	call	_dyntab_copy
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L70548
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29872], OFFSET FLAT:$SG70550
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 459		; 000001cbH
	jmp	$eva_err$70465
$L70548:

; 460  : 
; 461  : 		/* Store object value */
; 462  : 		c->txt = value.cell->txt;

	mov	ecx, DWORD PTR _c$[ebp]
	mov	edx, DWORD PTR _value$[ebp+16]
	mov	eax, DWORD PTR [edx]
	mov	DWORD PTR [ecx], eax

; 463  : 		c->len = value.cell->len;

	mov	ecx, DWORD PTR _c$[ebp]
	mov	edx, DWORD PTR _value$[ebp+16]
	mov	eax, DWORD PTR [edx+4]
	mov	DWORD PTR [ecx+4], eax

; 464  : 		c->Num = DYNTAB_TOULRC(objdata, i, 4);

	push	10					; 0000000aH
	push	0
	push	4
	mov	ecx, DWORD PTR _i$[ebp]
	push	ecx
	mov	edx, DWORD PTR _objdata$[ebp]
	push	edx
	call	_dyntab_val
	add	esp, 12					; 0000000cH
	push	eax
	call	_strtoul
	add	esp, 12					; 0000000cH
	mov	ecx, DWORD PTR _c$[ebp]
	mov	DWORD PTR [ecx+36], eax

; 465  : 		c->Line = DYNTAB_TOULRC(objdata, i, 5);

	push	10					; 0000000aH
	push	0
	push	5
	mov	edx, DWORD PTR _i$[ebp]
	push	edx
	mov	eax, DWORD PTR _objdata$[ebp]
	push	eax
	call	_dyntab_val
	add	esp, 12					; 0000000cH
	push	eax
	call	_strtoul
	add	esp, 12					; 0000000cH
	mov	ecx, DWORD PTR _c$[ebp]
	mov	DWORD PTR [ecx+40], eax

; 466  : 
; 467  : 		/* Add up to 29 filter conditions (32 tables max in MySQL) */
; 468  : 		if(flt.nbnode < 29)

	cmp	DWORD PTR _flt$[ebp+4424], 29		; 0000001dH
	jae	$L70553

; 470  : 			QryBuilNode *node = flt.node + flt.nbnode;

	mov	edx, DWORD PTR _flt$[ebp+4424]
	imul	edx, 136				; 00000088H
	lea	eax, DWORD PTR _flt$[ebp+edx+72]
	mov	DWORD PTR _node$70554[ebp], eax

; 471  : 			unsigned long join = flt.nbnode;

	mov	ecx, DWORD PTR _flt$[ebp+4424]
	mov	DWORD PTR _join$70555[ebp], ecx

; 472  : 			char printbuf[128];
; 473  : 			DYNTAB_SET_CELL(&node->field, node->field.nbrows, 0, objdata, i, 1);

	push	0
	push	1
	mov	edx, DWORD PTR _i$[ebp]
	push	edx
	mov	eax, DWORD PTR _objdata$[ebp]
	push	eax
	call	_dyntab_cell
	add	esp, 12					; 0000000cH
	push	eax
	push	0
	mov	ecx, DWORD PTR _node$70554[ebp]
	mov	edx, DWORD PTR [ecx]
	push	edx
	mov	eax, DWORD PTR _node$70554[ebp]
	push	eax
	call	_dyntab_copy
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L70557
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29872], OFFSET FLAT:$SG70559
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 473		; 000001d9H
	jmp	$eva_err$70465
$L70557:

; 474  : 			DYNTAB_SET_CELL(&node->value, node->value.nbrows, 0, &value, 0, 0);

	push	0
	push	0
	push	0
	lea	eax, DWORD PTR _value$[ebp]
	push	eax
	call	_dyntab_cell
	add	esp, 12					; 0000000cH
	push	eax
	push	0
	mov	ecx, DWORD PTR _node$70554[ebp]
	mov	edx, DWORD PTR [ecx+32]
	push	edx
	mov	eax, DWORD PTR _node$70554[ebp]
	add	eax, 32					; 00000020H
	push	eax
	call	_dyntab_copy
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L70560
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29872], OFFSET FLAT:$SG70562
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 474		; 000001daH
	jmp	$eva_err$70465
$L70560:

; 475  : 			dynbuf_print4(&flt.where, "%sTLink%ld.Num=%ld AND TLink%ld.Line", flt.where ? " AND " : "",
; 476  : 									join, c->Num, join);

	cmp	DWORD PTR _flt$[ebp+40], 0
	je	SHORT $L71111
	mov	DWORD PTR -4748+[ebp], OFFSET FLAT:$SG70564
	jmp	SHORT $L71112
$L71111:
	mov	DWORD PTR -4748+[ebp], OFFSET FLAT:$SG70565
$L71112:
	push	0
	push	0
	mov	eax, DWORD PTR _join$70555[ebp]
	push	eax
	mov	ecx, DWORD PTR _c$[ebp]
	mov	edx, DWORD PTR [ecx+36]
	push	edx
	mov	eax, DWORD PTR _join$70555[ebp]
	push	eax
	mov	ecx, DWORD PTR -4748+[ebp]
	push	ecx
	push	OFFSET FLAT:$SG70566
	push	127					; 0000007fH
	lea	edx, DWORD PTR _printbuf$70556[ebp]
	push	edx
	call	__snprintf
	add	esp, 28					; 0000001cH
	push	eax
	lea	eax, DWORD PTR _printbuf$70556[ebp]
	push	eax
	lea	ecx, DWORD PTR _flt$[ebp+40]
	push	ecx
	call	_dynbuf_add
	add	esp, 20					; 00000014H

; 477  : 			if(c->Line)

	mov	edx, DWORD PTR _c$[ebp]
	cmp	DWORD PTR [edx+40], 0
	je	SHORT $L70567

; 478  : 				dynbuf_print(&flt.where, "=%ld", c->Line);

	push	0
	push	0
	mov	eax, DWORD PTR _c$[ebp]
	mov	ecx, DWORD PTR [eax+40]
	push	ecx
	push	OFFSET FLAT:$SG70569
	push	127					; 0000007fH
	lea	edx, DWORD PTR _printbuf$70556[ebp]
	push	edx
	call	__snprintf
	add	esp, 16					; 00000010H
	push	eax
	lea	eax, DWORD PTR _printbuf$70556[ebp]
	push	eax
	lea	ecx, DWORD PTR _flt$[ebp+40]
	push	ecx
	call	_dynbuf_add
	add	esp, 20					; 00000014H

; 479  : 			else

	jmp	SHORT $L70572
$L70567:

; 480  : 				DYNBUF_ADD_STR(&flt.where, " IS NULL");

	push	0
	push	0
	push	8
	push	OFFSET FLAT:$SG70573
	lea	edx, DWORD PTR _flt$[ebp+40]
	push	edx
	call	_dynbuf_add
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L70572
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29872], OFFSET FLAT:$SG70575
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 480		; 000001e0H
	jmp	$eva_err$70465
$L70572:

; 481  : 			node->rel = RelNone;

	mov	edx, DWORD PTR _node$70554[ebp]
	mov	DWORD PTR [edx+52], 0

; 482  : 			node->match = mode;

	mov	eax, DWORD PTR _node$70554[ebp]
	mov	ecx, DWORD PTR _mode$70471[ebp]
	mov	DWORD PTR [eax+24], ecx

; 483  : 			node->srcjoin = 0;

	mov	edx, DWORD PTR _node$70554[ebp]
	mov	DWORD PTR [edx+56], 0

; 484  : 			flt.nbnode++;

	mov	eax, DWORD PTR _flt$[ebp+4424]
	add	eax, 1
	mov	DWORD PTR _flt$[ebp+4424], eax
$L70553:

; 486  : 	}

	jmp	$L70469
$L70470:

; 487  : 	while(cnt <= 60) { printf("*"); fflush(stdout); cnt++; }

	cmp	DWORD PTR _cnt$[ebp], 60		; 0000003cH
	ja	SHORT $eva_noerr$70467
	push	OFFSET FLAT:$SG70579
	call	_printf
	add	esp, 4
	push	OFFSET FLAT:__iob+32
	call	_fflush
	add	esp, 4
	mov	ecx, DWORD PTR _cnt$[ebp]
	add	ecx, 1
	mov	DWORD PTR _cnt$[ebp], ecx
	jmp	SHORT $L70470
$eva_noerr$70467:

; 488  : 
; 489  : 	RETURN_OK_CLEANUP;

	push	0
	push	OFFSET FLAT:$SG70580
	push	OFFSET FLAT:$SG70581
	mov	edx, DWORD PTR _cntxt$[ebp]
	push	edx
	call	_err_clear
	add	esp, 16					; 00000010H
$eva_err$70465:
	mov	eax, DWORD PTR _cntxt$[ebp]
	cmp	DWORD PTR [eax+29872], 0
	je	SHORT $L70582
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	edx, DWORD PTR [ecx+29900]
	push	edx
	push	OFFSET FLAT:$SG70583
	push	OFFSET FLAT:$SG70584
	mov	eax, DWORD PTR _cntxt$[ebp]
	push	eax
	call	_err_add_context
	add	esp, 16					; 00000010H
$L70582:
	lea	ecx, DWORD PTR _sqlres$[ebp]
	push	ecx
	call	_dyntab_free
	add	esp, 4
	lea	edx, DWORD PTR _curobjdata$[ebp]
	push	edx
	call	_dyntab_free
	add	esp, 4
	lea	eax, DWORD PTR _dbobjdata$[ebp]
	push	eax
	call	_dyntab_free
	add	esp, 4
	lea	ecx, DWORD PTR _value$[ebp]
	push	ecx
	call	_dyntab_free
	add	esp, 4
	lea	edx, DWORD PTR _flt$[ebp]
	push	edx
	call	_qry_build_free
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

; 490  : }

	pop	edi
	mov	esp, ebp
	pop	ebp
	ret	0
_import_objdata_check ENDP
_TEXT	ENDS
PUBLIC	_cgi_select_files
EXTRN	_qsort_col0:NEAR
EXTRN	_put_html_page_header:NEAR
EXTRN	_put_html_button_sz:NEAR
EXTRN	_put_html_list:NEAR
EXTRN	_find_files:NEAR
EXTRN	_ctrl_cgi_name:NEAR
EXTRN	_dynbuf_add3:NEAR
EXTRN	_cgi_get_subfield:NEAR
_BSS	SEGMENT
	ALIGN	4

$SG70606 DB	01H DUP (?)
_BSS	ENDS
_DATA	SEGMENT
	ORG $+3
$SG70610 DB	'SAVETO=objlib', 00H
	ORG $+2
$SG70615 DB	'SELFILES', 00H
	ORG $+3
$SG70617 DB	'*.txt', 00H
	ORG $+2
$SG70618 DB	'D:\Travail\ABI\EVA\V4.0\CGI\Brunix-2016\action_import.c', 00H
$SG70619 DB	'cgi_select_files', 00H
	ORG $+3
$SG70625 DB	'IMPORT', 00H
	ORG $+1
$SG70628 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70632 DB	'Importer des donn', 0e9H, 'es', 00H
	ORG $+3
$SG70635 DB	'<table noborder>', 00H
	ORG $+3
$SG70637 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70640 DB	'<tr><td align=right>T', 0e9H, 'l', 0e9H, 'charger un fic'
	DB	'hier</td><td>', 00H
$SG70642 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70645 DB	'SAVETO=objlib', 00H
	ORG $+2
$SG70649 DB	'''', 00H
	ORG $+2
$SG70650 DB	'<input type=file name=''', 00H
$SG70652 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70654 DB	'></td><td>', 00H
	ORG $+1
$SG70655 DB	' size=', 00H
	ORG $+1
$SG70657 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70660 DB	'UPLOAD', 00H
	ORG $+1
$SG70663 DB	'S', 0e9H, 'lectionnez un fichier avec le bouton ''Parcou'
	DB	'rir ...'' et cliquez sur ce bouton pour le transf', 0e9H, 're'
	DB	'r vers le serveur', 00H
	ORG $+1
$SG70664 DB	'_eva_download_s.gif', 00H
$SG70665 DB	'_eva_download.gif', 00H
	ORG $+2
$SG70666 DB	'T', 0e9H, 'l', 0e9H, 'charger', 00H
$SG70669 DB	'</td></tr>', 00H
	ORG $+1
$SG70671 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70675 DB	'<tr><td align=right>Importer depuis la biblioth', 0e8H, 'q'
	DB	'ue</td><td>', 00H
	ORG $+3
$SG70677 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70681 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70684 DB	'SELFILES', 00H
	ORG $+3
$SG70689 DB	'IMPORT', 00H
	ORG $+1
$SG70692 DB	'</td><td>', 00H
	ORG $+2
$SG70694 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70697 DB	'Lance l''import du fichier s', 0e9H, 'lectionn', 0e9H, 00H
	ORG $+2
$SG70698 DB	'_eva_import_s.gif', 00H
	ORG $+2
$SG70699 DB	'_eva_import.gif', 00H
$SG70700 DB	'Importer', 00H
	ORG $+3
$SG70703 DB	'</td></tr></table><br><hr><br>', 00H
	ORG $+1
$SG70705 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70708 DB	'Retourne ', 0e0H, ' la page pr', 0e9H, 'c', 0e9H, 'dente'
	DB	00H
	ORG $+2
$SG70709 DB	'_eva_btn_gobackobj_fr_s.gif', 00H
$SG70710 DB	'_eva_btn_gobackobj_fr.gif', 00H
	ORG $+2
$SG70711 DB	'Revenir', 00H
$SG70712 DB	'NOP', 00H
$SG70713 DB	'<font face=Arial><center><b>Importer des donn', 0e9H, 'e'
	DB	's</b><hr><br>%s<br><br></font>', 00H
	ORG $+2
$SG70714 DB	'D:\Travail\ABI\EVA\V4.0\CGI\Brunix-2016\action_import.c', 00H
$SG70715 DB	'cgi_select_files', 00H
	ORG $+3
$SG70717 DB	'D:\Travail\ABI\EVA\V4.0\CGI\Brunix-2016\action_import.c', 00H
$SG70718 DB	'cgi_select_files', 00H
_DATA	ENDS
_TEXT	SEGMENT
_cntxt$ = 8
_i_ctrl$ = 12
_files$ = 16
_form$ = -4
_ctrl$ = -72
_buf$ = -8
_name$ = -68
_libfiles$ = -36
_cgival$ = -60
_html$ = -12
_btn$ = -16
_i$ = -40
_szmax$ = -64
_cgi_select_files PROC NEAR

; 507  : ){

	push	ebp
	mov	ebp, esp
	sub	esp, 88					; 00000058H

; 508  : 	EVA_form *form = cntxt->form;

	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	ecx, DWORD PTR [eax+80]
	mov	DWORD PTR _form$[ebp], ecx

; 509  : 	EVA_ctrl *ctrl = form->ctrl + i_ctrl;

	mov	edx, DWORD PTR _i_ctrl$[ebp]
	imul	edx, 480				; 000001e0H
	mov	eax, DWORD PTR _form$[ebp]
	mov	ecx, DWORD PTR [eax]
	add	ecx, edx
	mov	DWORD PTR _ctrl$[ebp], ecx

; 510  : 	DynBuffer *buf = NULL;

	mov	DWORD PTR _buf$[ebp], 0

; 511  : 	DynBuffer *name = NULL;

	mov	DWORD PTR _name$[ebp], 0

; 512  : 	DynTable libfiles = {0};

	mov	DWORD PTR _libfiles$[ebp], 0
	xor	edx, edx
	mov	DWORD PTR _libfiles$[ebp+4], edx
	mov	DWORD PTR _libfiles$[ebp+8], edx
	mov	DWORD PTR _libfiles$[ebp+12], edx
	mov	DWORD PTR _libfiles$[ebp+16], edx

; 513  : 	DynTable cgival = {0};

	mov	DWORD PTR _cgival$[ebp], 0
	xor	eax, eax
	mov	DWORD PTR _cgival$[ebp+4], eax
	mov	DWORD PTR _cgival$[ebp+8], eax
	mov	DWORD PTR _cgival$[ebp+12], eax
	mov	DWORD PTR _cgival$[ebp+16], eax

; 514  : 	DynBuffer **html;
; 515  : 	char *btn = CGI_CLICK_BTN_SUBFIELD;

	mov	ecx, DWORD PTR _cntxt$[ebp]
	cmp	DWORD PTR [ecx+29648], 0
	je	SHORT $L71114
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	eax, DWORD PTR [edx+29656]
	imul	eax, 56					; 00000038H
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	edx, DWORD PTR [ecx+29648]
	mov	eax, DWORD PTR [edx+eax]
	movsx	ecx, BYTE PTR [eax]
	cmp	ecx, 66					; 00000042H
	jne	SHORT $L71114
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	eax, DWORD PTR [edx+29656]
	imul	eax, 56					; 00000038H
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	edx, DWORD PTR [ecx+29648]
	cmp	DWORD PTR [edx+eax+32], 0
	je	SHORT $L71114
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	ecx, DWORD PTR [eax+29656]
	imul	ecx, 56					; 00000038H
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	eax, DWORD PTR [edx+29648]
	mov	ecx, DWORD PTR [eax+ecx+32]
	mov	DWORD PTR -76+[ebp], ecx
	jmp	SHORT $L71115
$L71114:
	mov	DWORD PTR -76+[ebp], OFFSET FLAT:$SG70606
$L71115:
	mov	edx, DWORD PTR -76+[ebp]
	mov	DWORD PTR _btn$[ebp], edx

; 516  : 	unsigned long i;
; 517  : 	size_t szmax = 0;

	mov	DWORD PTR _szmax$[ebp], 0

; 518  : 
; 519  : 	/* Read file selection status */
; 520  : 	dyntab_free(files);

	mov	eax, DWORD PTR _files$[ebp]
	push	eax
	call	_dyntab_free
	add	esp, 4

; 521  : 	CTRL_GET_CGI_SUBFIELD("SAVETO=objlib");

	push	0
	push	0
	push	0
	push	OFFSET FLAT:$SG70610
	mov	ecx, DWORD PTR _ctrl$[ebp]
	push	ecx
	lea	edx, DWORD PTR _cgival$[ebp]
	push	edx
	mov	eax, DWORD PTR _cntxt$[ebp]
	push	eax
	call	_cgi_get_subfield
	add	esp, 28					; 0000001cH
	test	eax, eax
	je	SHORT $L70609
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 521		; 00000209H
	jmp	$eva_err$70611
$L70609:

; 522  : 	if(!cgival.nbrows || !cgival.cell || !cgival.cell->len) CTRL_GET_CGI_SUBFIELD("SELFILES");

	cmp	DWORD PTR _cgival$[ebp], 0
	je	SHORT $L70613
	cmp	DWORD PTR _cgival$[ebp+16], 0
	je	SHORT $L70613
	mov	edx, DWORD PTR _cgival$[ebp+16]
	cmp	DWORD PTR [edx+4], 0
	jne	SHORT $L70614
$L70613:
	push	0
	push	0
	push	0
	push	OFFSET FLAT:$SG70615
	mov	eax, DWORD PTR _ctrl$[ebp]
	push	eax
	lea	ecx, DWORD PTR _cgival$[ebp]
	push	ecx
	mov	edx, DWORD PTR _cntxt$[ebp]
	push	edx
	call	_cgi_get_subfield
	add	esp, 28					; 0000001cH
	test	eax, eax
	je	SHORT $L70614
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 522		; 0000020aH
	jmp	$eva_err$70611
$L70614:

; 523  : 	if(find_files(cntxt, &libfiles, "*.txt", IncludeInfos)) CLEAR_ERROR;

	push	8
	push	OFFSET FLAT:$SG70617
	lea	ecx, DWORD PTR _libfiles$[ebp]
	push	ecx
	mov	edx, DWORD PTR _cntxt$[ebp]
	push	edx
	call	_find_files
	add	esp, 16					; 00000010H
	test	eax, eax
	je	SHORT $L70616
	push	523					; 0000020bH
	push	OFFSET FLAT:$SG70618
	push	OFFSET FLAT:$SG70619
	mov	eax, DWORD PTR _cntxt$[ebp]
	push	eax
	call	_err_clear
	add	esp, 16					; 00000010H
$L70616:

; 524  : 	for(i = 0; i < libfiles.nbrows; i++) if(dyntab_sz(&libfiles, i, 1) > szmax) szmax = dyntab_sz(&libfiles, i, 1);

	mov	DWORD PTR _i$[ebp], 0
	jmp	SHORT $L70620
$L70621:
	mov	ecx, DWORD PTR _i$[ebp]
	add	ecx, 1
	mov	DWORD PTR _i$[ebp], ecx
$L70620:
	mov	edx, DWORD PTR _i$[ebp]
	cmp	edx, DWORD PTR _libfiles$[ebp]
	jae	SHORT $L70622
	push	1
	mov	eax, DWORD PTR _i$[ebp]
	push	eax
	lea	ecx, DWORD PTR _libfiles$[ebp]
	push	ecx
	call	_dyntab_sz
	add	esp, 12					; 0000000cH
	cmp	eax, DWORD PTR _szmax$[ebp]
	jbe	SHORT $L70623
	push	1
	mov	edx, DWORD PTR _i$[ebp]
	push	edx
	lea	eax, DWORD PTR _libfiles$[ebp]
	push	eax
	call	_dyntab_sz
	add	esp, 12					; 0000000cH
	mov	DWORD PTR _szmax$[ebp], eax
$L70623:

; 525  : 
; 526  : 	/* Handle Import button click - transfer selected file to result & return */
; 527  : 	if(!strcmp(btn, "IMPORT"))

	jmp	SHORT $L70621
$L70622:
	push	OFFSET FLAT:$SG70625
	mov	ecx, DWORD PTR _btn$[ebp]
	push	ecx
	call	_strcmp
	add	esp, 8
	test	eax, eax
	jne	SHORT $L70624

; 529  : 		DYNTAB_ADD_CELL(files, 0, 0, &cgival, 0, 0);

	push	1
	push	0
	push	0
	lea	edx, DWORD PTR _cgival$[ebp]
	push	edx
	call	_dyntab_cell
	add	esp, 12					; 0000000cH
	push	eax
	push	0
	push	0
	mov	eax, DWORD PTR _files$[ebp]
	push	eax
	call	_dyntab_copy
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L70626
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29872], OFFSET FLAT:$SG70628
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 529		; 00000211H
	jmp	$eva_err$70611
$L70626:

; 530  : 		RETURN_OK;

	jmp	$eva_noerr$70629
$L70624:

; 532  : 
; 533  : 	/* Output page header */
; 534  : 	cntxt->cgiencodemultipart = 1;

	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29668], 1

; 535  : 	put_html_page_header(cntxt, NULL, "Importer des données", NULL, 3);

	push	3
	push	0
	push	OFFSET FLAT:$SG70632
	push	0
	mov	ecx, DWORD PTR _cntxt$[ebp]
	push	ecx
	call	_put_html_page_header
	add	esp, 20					; 00000014H

; 536  : 	cntxt->form->html = &buf;

	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	eax, DWORD PTR [edx+80]
	lea	ecx, DWORD PTR _buf$[ebp]
	mov	DWORD PTR [eax+232], ecx

; 537  : 	html = &buf;

	lea	edx, DWORD PTR _buf$[ebp]
	mov	DWORD PTR _html$[ebp], edx

; 538  : 	cntxt->b_terminate = 15;

	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29776], 15		; 0000000fH

; 539  : 	fflush(stdout);

	push	OFFSET FLAT:__iob+32
	call	_fflush
	add	esp, 4

; 540  : 	DYNBUF_ADD_STR(html, "<table noborder>");

	push	0
	push	0
	push	16					; 00000010H
	push	OFFSET FLAT:$SG70635
	mov	ecx, DWORD PTR _html$[ebp]
	push	ecx
	call	_dynbuf_add
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L70634
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29872], OFFSET FLAT:$SG70637
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 540		; 0000021cH
	jmp	$eva_err$70611
$L70634:

; 541  : 
; 542  : 	/* Output file upload input & button */
; 543  : 	DYNBUF_ADD_STR(html, "<tr><td align=right>Télécharger un fichier</td><td>");

	push	0
	push	0
	push	51					; 00000033H
	push	OFFSET FLAT:$SG70640
	mov	ecx, DWORD PTR _html$[ebp]
	push	ecx
	call	_dynbuf_add
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L70639
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29872], OFFSET FLAT:$SG70642
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 543		; 0000021fH
	jmp	$eva_err$70611
$L70639:

; 544  : 	CTRL_CGINAMESUBFIELD(&name, NULL, "SAVETO=objlib");

	push	13					; 0000000dH
	push	OFFSET FLAT:$SG70645
	push	68					; 00000044H
	lea	ecx, DWORD PTR _name$[ebp]
	push	ecx
	push	1
	push	0
	mov	edx, DWORD PTR _ctrl$[ebp]
	push	edx
	mov	eax, DWORD PTR _cntxt$[ebp]
	push	eax
	call	_ctrl_cgi_name
	add	esp, 32					; 00000020H
	test	eax, eax
	je	SHORT $L70644
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 544		; 00000220H
	jmp	$eva_err$70611
$L70644:

; 545  : 	DYNBUF_ADD3_BUF(form->html, "<input type=file name='", name, NO_CONV, "'");

	cmp	DWORD PTR _name$[ebp], 0
	je	SHORT $L71116
	mov	edx, DWORD PTR _name$[ebp]
	mov	eax, DWORD PTR [edx+4]
	mov	DWORD PTR -80+[ebp], eax
	jmp	SHORT $L71117
$L71116:
	mov	DWORD PTR -80+[ebp], 0
$L71117:
	cmp	DWORD PTR _name$[ebp], 0
	je	SHORT $L71118
	mov	ecx, DWORD PTR _name$[ebp]
	add	ecx, 8
	mov	DWORD PTR -84+[ebp], ecx
	jmp	SHORT $L71119
$L71118:
	mov	DWORD PTR -84+[ebp], 0
$L71119:
	push	1
	push	OFFSET FLAT:$SG70649
	push	0
	push	0
	mov	edx, DWORD PTR -80+[ebp]
	push	edx
	mov	eax, DWORD PTR -84+[ebp]
	push	eax
	push	23					; 00000017H
	push	OFFSET FLAT:$SG70650
	mov	ecx, DWORD PTR _form$[ebp]
	mov	edx, DWORD PTR [ecx+232]
	push	edx
	call	_dynbuf_add3
	add	esp, 36					; 00000024H
	test	eax, eax
	je	SHORT $L70648
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29872], OFFSET FLAT:$SG70652
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 545		; 00000221H
	jmp	$eva_err$70611
$L70648:

; 546  : 	DYNBUF_ADD3_INT(form->html, " size=", szmax > 40 ? szmax - 20 : 20, "></td><td>");

	cmp	DWORD PTR _szmax$[ebp], 40		; 00000028H
	jbe	SHORT $L71120
	mov	edx, DWORD PTR _szmax$[ebp]
	sub	edx, 20					; 00000014H
	mov	DWORD PTR -88+[ebp], edx
	jmp	SHORT $L71121
$L71120:
	mov	DWORD PTR -88+[ebp], 20			; 00000014H
$L71121:
	push	10					; 0000000aH
	push	OFFSET FLAT:$SG70654
	mov	eax, DWORD PTR -88+[ebp]
	push	eax
	push	6
	push	OFFSET FLAT:$SG70655
	mov	ecx, DWORD PTR _form$[ebp]
	mov	edx, DWORD PTR [ecx+232]
	push	edx
	call	_dynbuf_add3_int
	add	esp, 24					; 00000018H
	test	eax, eax
	je	SHORT $L70653
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29872], OFFSET FLAT:$SG70657
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 546		; 00000222H
	jmp	$eva_err$70611
$L70653:

; 547  : 	CTRL_CGINAMEBTN(&name, NULL, add_sz_str("UPLOAD"));

	push	6
	push	OFFSET FLAT:$SG70660
	push	66					; 00000042H
	lea	edx, DWORD PTR _name$[ebp]
	push	edx
	push	1
	push	0
	mov	eax, DWORD PTR _ctrl$[ebp]
	push	eax
	mov	ecx, DWORD PTR _cntxt$[ebp]
	push	ecx
	call	_ctrl_cgi_name
	add	esp, 32					; 00000020H
	test	eax, eax
	je	SHORT $L70659
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 547		; 00000223H
	jmp	$eva_err$70611
$L70659:

; 548  : 	if(put_html_button(cntxt, name->data, "Télécharger", "_eva_download.gif", "_eva_download_s.gif",
; 549  : 		"Sélectionnez un fichier avec le bouton 'Parcourir ...' et cliquez sur ce bouton pour le transférer vers le serveur", 0, 0)) STACK_ERROR;

	push	0
	push	0
	push	0
	push	0
	push	0
	push	OFFSET FLAT:$SG70663
	push	OFFSET FLAT:$SG70664
	push	OFFSET FLAT:$SG70665
	push	OFFSET FLAT:$SG70666
	mov	eax, DWORD PTR _name$[ebp]
	add	eax, 8
	push	eax
	mov	ecx, DWORD PTR _cntxt$[ebp]
	push	ecx
	call	_put_html_button_sz
	add	esp, 44					; 0000002cH
	test	eax, eax
	je	SHORT $L70662
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 549		; 00000225H
	jmp	$eva_err$70611
$L70662:

; 550  : 	DYNBUF_ADD_STR(html, "</td></tr>");

	push	0
	push	0
	push	10					; 0000000aH
	push	OFFSET FLAT:$SG70669
	mov	eax, DWORD PTR _html$[ebp]
	push	eax
	call	_dynbuf_add
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L70668
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29872], OFFSET FLAT:$SG70671
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 550		; 00000226H
	jmp	$eva_err$70611
$L70668:

; 551  : 
; 552  : 	/* Output files list */
; 553  : 	if(libfiles.nbrows)

	cmp	DWORD PTR _libfiles$[ebp], 0
	je	$L70686

; 555  : 		DYNBUF_ADD_STR(html, "<tr><td align=right>Importer depuis la bibliothèque</td><td>");

	push	0
	push	0
	push	60					; 0000003cH
	push	OFFSET FLAT:$SG70675
	mov	eax, DWORD PTR _html$[ebp]
	push	eax
	call	_dynbuf_add
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L70674
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29872], OFFSET FLAT:$SG70677
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 555		; 0000022bH
	jmp	$eva_err$70611
$L70674:

; 556  : 		DYNTAB_ADD_CELLP(&libfiles, libfiles.nbrows, 0, NULL);

	push	1
	push	0
	push	0
	mov	eax, DWORD PTR _libfiles$[ebp]
	push	eax
	lea	ecx, DWORD PTR _libfiles$[ebp]
	push	ecx
	call	_dyntab_copy
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L70679
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29872], OFFSET FLAT:$SG70681
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 556		; 0000022cH
	jmp	$eva_err$70611
$L70679:

; 557  : 		dyntab_sort(&libfiles, qsort_col0);

	push	OFFSET FLAT:_qsort_col0
	lea	ecx, DWORD PTR _libfiles$[ebp]
	push	ecx
	call	_dyntab_sort
	add	esp, 8

; 558  : 		CTRL_CGINAMESUBFIELD(&name, NULL, "SELFILES");

	push	8
	push	OFFSET FLAT:$SG70684
	push	68					; 00000044H
	lea	edx, DWORD PTR _name$[ebp]
	push	edx
	push	1
	push	0
	mov	eax, DWORD PTR _ctrl$[ebp]
	push	eax
	mov	ecx, DWORD PTR _cntxt$[ebp]
	push	ecx
	call	_ctrl_cgi_name
	add	esp, 32					; 00000020H
	test	eax, eax
	je	SHORT $L70683
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 558		; 0000022eH
	jmp	$eva_err$70611
$L70683:

; 559  : 		if(put_html_list(cntxt, name, &libfiles, &cgival, 1, 0, 0, 0, 0, NULL)) STACK_ERROR;

	push	0
	push	0
	push	0
	push	0
	push	0
	push	1
	lea	eax, DWORD PTR _cgival$[ebp]
	push	eax
	lea	ecx, DWORD PTR _libfiles$[ebp]
	push	ecx
	mov	edx, DWORD PTR _name$[ebp]
	push	edx
	mov	eax, DWORD PTR _cntxt$[ebp]
	push	eax
	call	_put_html_list
	add	esp, 40					; 00000028H
	test	eax, eax
	je	SHORT $L70686
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 559		; 0000022fH
	jmp	$eva_err$70611
$L70686:

; 561  : 
; 562  : 	/* Output import & goback buttons */
; 563  : 	CTRL_CGINAMEBTN(&name, NULL, add_sz_str("IMPORT"));

	push	6
	push	OFFSET FLAT:$SG70689
	push	66					; 00000042H
	lea	edx, DWORD PTR _name$[ebp]
	push	edx
	push	1
	push	0
	mov	eax, DWORD PTR _ctrl$[ebp]
	push	eax
	mov	ecx, DWORD PTR _cntxt$[ebp]
	push	ecx
	call	_ctrl_cgi_name
	add	esp, 32					; 00000020H
	test	eax, eax
	je	SHORT $L70688
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 563		; 00000233H
	jmp	$eva_err$70611
$L70688:

; 564  : 	DYNBUF_ADD_STR(html, "</td><td>");

	push	0
	push	0
	push	9
	push	OFFSET FLAT:$SG70692
	mov	eax, DWORD PTR _html$[ebp]
	push	eax
	call	_dynbuf_add
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L70691
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29872], OFFSET FLAT:$SG70694
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 564		; 00000234H
	jmp	$eva_err$70611
$L70691:

; 565  : 	if(put_html_button(cntxt, name->data, "Importer", "_eva_import.gif", "_eva_import_s.gif", "Lance l'import du fichier sélectionné", 0, 0)) STACK_ERROR;

	push	0
	push	0
	push	0
	push	0
	push	0
	push	OFFSET FLAT:$SG70697
	push	OFFSET FLAT:$SG70698
	push	OFFSET FLAT:$SG70699
	push	OFFSET FLAT:$SG70700
	mov	eax, DWORD PTR _name$[ebp]
	add	eax, 8
	push	eax
	mov	ecx, DWORD PTR _cntxt$[ebp]
	push	ecx
	call	_put_html_button_sz
	add	esp, 44					; 0000002cH
	test	eax, eax
	je	SHORT $L70696
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 565		; 00000235H
	jmp	$eva_err$70611
$L70696:

; 566  : 	DYNBUF_ADD_STR(html, "</td></tr></table><br><hr><br>");

	push	0
	push	0
	push	30					; 0000001eH
	push	OFFSET FLAT:$SG70703
	mov	eax, DWORD PTR _html$[ebp]
	push	eax
	call	_dynbuf_add
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L70702
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29872], OFFSET FLAT:$SG70705
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 566		; 00000236H
	jmp	SHORT $eva_err$70611
$L70702:

; 567  : 	if(put_html_button(cntxt, "NOP", "Revenir", "_eva_btn_gobackobj_fr.gif", "_eva_btn_gobackobj_fr_s.gif", "Retourne à la page précédente", 0, 0)) STACK_ERROR;

	push	0
	push	0
	push	0
	push	0
	push	0
	push	OFFSET FLAT:$SG70708
	push	OFFSET FLAT:$SG70709
	push	OFFSET FLAT:$SG70710
	push	OFFSET FLAT:$SG70711
	push	OFFSET FLAT:$SG70712
	mov	eax, DWORD PTR _cntxt$[ebp]
	push	eax
	call	_put_html_button_sz
	add	esp, 44					; 0000002cH
	test	eax, eax
	je	SHORT $L70707
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 567		; 00000237H
	jmp	SHORT $eva_err$70611
$L70707:

; 568  : 
; 569  : 	/* Output page footer */
; 570  : 	printf("<font face=Arial><center><b>Importer des données</b><hr><br>%s<br><br></font>", buf->data);

	mov	edx, DWORD PTR _buf$[ebp]
	add	edx, 8
	push	edx
	push	OFFSET FLAT:$SG70713
	call	_printf
	add	esp, 8
$eva_noerr$70629:

; 571  : 
; 572  : 	RETURN_OK_CLEANUP;

	push	0
	push	OFFSET FLAT:$SG70714
	push	OFFSET FLAT:$SG70715
	mov	eax, DWORD PTR _cntxt$[ebp]
	push	eax
	call	_err_clear
	add	esp, 16					; 00000010H
$eva_err$70611:
	mov	ecx, DWORD PTR _cntxt$[ebp]
	cmp	DWORD PTR [ecx+29872], 0
	je	SHORT $L70716
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	eax, DWORD PTR [edx+29900]
	push	eax
	push	OFFSET FLAT:$SG70717
	push	OFFSET FLAT:$SG70718
	mov	ecx, DWORD PTR _cntxt$[ebp]
	push	ecx
	call	_err_add_context
	add	esp, 16					; 00000010H
$L70716:
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
	lea	ecx, DWORD PTR _libfiles$[ebp]
	push	ecx
	call	_dyntab_free
	add	esp, 4
	lea	edx, DWORD PTR _cgival$[ebp]
	push	edx
	call	_dyntab_free
	add	esp, 4
	mov	eax, DWORD PTR _cntxt$[ebp]
	xor	ecx, ecx
	cmp	DWORD PTR [eax+29872], 0
	setne	cl
	mov	eax, ecx

; 573  : }

	mov	esp, ebp
	pop	ebp
	ret	0
_cgi_select_files ENDP
_TEXT	ENDS
PUBLIC	_import_objdata_file
EXTRN	_puts:NEAR
EXTRN	_file_read_import_data:NEAR
EXTRN	_atoi:NEAR
EXTRN	_no_quote:BYTE
EXTRN	_qry_add_obj_data:NEAR
EXTRN	_chdir:NEAR
EXTRN	_dyntab_set_txt:NEAR
_DATA	SEGMENT
	ORG $+3
$SG70756 DB	'objlib', 00H
	ORG $+1
$SG70758 DB	'Droits d''acc', 0e8H, 's incorrects sur un dossier', 00H
	ORG $+3
$SG70765 DB	'_EVA_LABEL', 00H
	ORG $+1
$SG70766 DB	'_EVA_CONTROL', 00H
	ORG $+3
$SG70767 DB	'_EVA_FORM', 00H
	ORG $+2
$SG70770 DB	'%lu', 00H
$SG70774 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70777 DB	'Importer des donn', 0e9H, 'es', 00H
	ORG $+3
$SG70778 DB	'<font face=Arial><center><b>Importer des donn', 0e9H, 'e'
	DB	's : %s</b></center><hr>', 00H
	ORG $+1
$SG70784 DB	'SELECT DISTINCT TLink0.IdObj ', 0aH, 'FROM TLink AS TLin'
	DB	'k0,TLink AS TLink1,TLink AS TLink2 ', 0aH, 'WHERE TLink0.IdOb'
	DB	'j=TLink1.IdObj AND TLink0.IdObj=TLink2.IdObj ', 0aH, 'AND TLi'
	DB	'nk0.DateDel IS NULL AND TLink0.IdField=%lu AND TLink0.IdRelOb'
	DB	'j=%du ', 0aH, 'AND TLink1.DateDel IS NULL AND TLink1.IdField='
	DB	'%lu AND TLink1.IdValue=%lu ', 0aH, 'AND TLink2.DateDel IS NUL'
	DB	'L AND TLink2.IdField=%lu AND TLink2.IdValue=%lu', 00H
	ORG $+3
$SG70790 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70793 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70797 DB	'_EVA_CONTROL', 00H
	ORG $+3
$SG70799 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70801 DB	'_EVA_FORM', 00H
	ORG $+2
$SG70803 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70805 DB	'_EVA_LABEL', 00H
	ORG $+1
$SG70807 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70810 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70814 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70817 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70820 DB	'Formulaire : ', 00H
	ORG $+2
$SG70822 DB	'R', 0e9H, 'f', 0e9H, 'rence ', 0e0H, ' un formulaire non'
	DB	' unique', 00H
	ORG $+3
$SG70827 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70830 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70831 DB	'0%   10%   20%   30%   40%   50%   60%   70%   80%   90%'
	DB	'   100%', 0aH, '|-----|-----|-----|-----|-----|-----|-----|--'
	DB	'---|-----|-----|', 0aH, 00H
	ORG $+1
$SG70832 DB	'<font face=Courier><b><pre>Recherche des fiches existant'
	DB	'es', 0aH, '%s', 00H
	ORG $+2
$SG70841 DB	' (%lu:%lu)', 0aH, 00H
$SG70842 DB	'</pre></font>', 00H
	ORG $+2
$SG70845 DB	'<table border><tr><td colspan=6 align=center><b>Contenu '
	DB	'du fichier import', 0e9H, '</td></tr><tr><td><b>Formulaire</t'
	DB	'd><td><b>Fiches</td><td>Indet</td><td>Nouv</td><td>Exist</td>'
	DB	'<td>Dbl</td></tr>', 00H
	ORG $+1
$SG70847 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70855 DB	'</td>', 00H
	ORG $+2
$SG70856 DB	'<tr><td>', 00H
	ORG $+3
$SG70858 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70865 DB	'_EVA_FORMSTAMP', 00H
	ORG $+1
$SG70870 DB	'</td>', 00H
	ORG $+2
$SG70871 DB	'<td align=center>', 00H
	ORG $+2
$SG70873 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70876 DB	'</tr>', 00H
	ORG $+2
$SG70878 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70881 DB	'<tr><td align=right><b>Total</td>', 00H
	ORG $+2
$SG70883 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70896 DB	'</td>', 00H
	ORG $+2
$SG70897 DB	'<td align=center><b>', 00H
	ORG $+3
$SG70899 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70902 DB	'</table>', 00H
	ORG $+3
$SG70904 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70906 DB	'UPDATE TLink SET DateDel=''%s'', IdWhoDel=%s WHERE IdObj'
	DB	'=%s AND DateDel IS NULL', 00H
	ORG $+2
$SG70909 DB	'0%   10%   20%   30%   40%   50%   60%   70%   80%   90%'
	DB	'   100%', 0aH, '|-----|-----|-----|-----|-----|-----|-----|--'
	DB	'---|-----|-----|', 0aH, 00H
	ORG $+1
$SG70910 DB	'<font face=Courier><b><pre>Import des donn', 0e9H, 'es', 0aH
	DB	'%s', 00H
	ORG $+3
$SG70921 DB	'*', 00H
	ORG $+2
$SG70937 DB	'*', 00H
	ORG $+2
$SG70938 DB	'</pre></font><br><b><u>Nombre de fiches cr', 0e9H, 0e9H, 'e'
	DB	's : %lu</u></b><br><br>', 00H
	ORG $+3
$SG70941 DB	'<table noboder width=100%><tr><td align=center>', 00H
$SG70943 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70946 DB	'Retourne ', 0e0H, ' la page pr', 0e9H, 'c', 0e9H, 'dente'
	DB	00H
	ORG $+2
$SG70947 DB	'_eva_btn_gobackobj_fr_s.gif', 00H
$SG70948 DB	'_eva_btn_gobackobj_fr.gif', 00H
	ORG $+2
$SG70949 DB	'Revenir', 00H
$SG70950 DB	'NOP', 00H
$SG70953 DB	'</td><td align=center>', 00H
	ORG $+1
$SG70955 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70957 DB	'$1', 00H
	ORG $+1
$SG70958 DB	'B$#.DELOBJLIB=', 00H
	ORG $+1
$SG70960 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70963 DB	'Supprimer le fichier qui vient d''', 0eaH, 'tre import', 0e9H
	DB	00H
	ORG $+2
$SG70964 DB	'_eva_btn_delfile_fr_s.gif', 00H
	ORG $+2
$SG70965 DB	'_eva_btn_delfile_fr.gif', 00H
$SG70966 DB	'Supprimer le fichier', 00H
	ORG $+3
$SG70969 DB	'</td></tr></table><br>', 00H
	ORG $+1
$SG70971 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70972 DB	'D:\Travail\ABI\EVA\V4.0\CGI\Brunix-2016\action_import.c', 00H
$SG70973 DB	'import_objdata_file', 00H
$SG70975 DB	'D:\Travail\ABI\EVA\V4.0\CGI\Brunix-2016\action_import.c', 00H
$SG70976 DB	'import_objdata_file', 00H
_DATA	ENDS
_TEXT	SEGMENT
_cntxt$ = 8
_i_ctrl$ = 12
_files$ = 16
_form$ = -1028
_buf$ = -1040
_name$ = -1200
_html$ = -1044
_objdata$ = -1184
_forms$ = -1152
_sqlres$ = -1088
_id_list$ = -1132
_objFORM$ = -1068
_newform$ = -1108
_qry$ = -1024
_i$ = -1156
_j$ = -1164
_k$ = -1192
_k0$ = -1036
_idobj$ = -1032
_newobj$ = -1048
_val_LABEL$ = -1112
_val_CONTROL$ = -1188
_val_FORM$ = -1196
_label$ = -1160
__tmp$70768 = -1232
_row$70782 = -1236
_row$70824 = -1240
_cnt$70851 = -1260
_status$70852 = -1264
_val$70862 = -1268
_cnt$70884 = -1288
_status$70885 = -1292
_val$70889 = -1296
_pkey$70914 = -1368
_id$70915 = -1364
_cell$70917 = -1360
_val$70923 = -1372
_import_objdata_file PROC NEAR

; 594  : ){

	push	ebp
	mov	ebp, esp
	sub	esp, 1380				; 00000564H
	push	edi

; 595  : 	EVA_form *form = cntxt->form;

	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	ecx, DWORD PTR [eax+80]
	mov	DWORD PTR _form$[ebp], ecx

; 596  : 	DynBuffer *buf = NULL;

	mov	DWORD PTR _buf$[ebp], 0

; 597  : 	DynBuffer *name = NULL;

	mov	DWORD PTR _name$[ebp], 0

; 598  : 	DynBuffer **html;
; 599  : 	DynTable objdata = {0};

	mov	DWORD PTR _objdata$[ebp], 0
	xor	edx, edx
	mov	DWORD PTR _objdata$[ebp+4], edx
	mov	DWORD PTR _objdata$[ebp+8], edx
	mov	DWORD PTR _objdata$[ebp+12], edx
	mov	DWORD PTR _objdata$[ebp+16], edx

; 600  : 	DynTable forms = {0};

	mov	DWORD PTR _forms$[ebp], 0
	xor	eax, eax
	mov	DWORD PTR _forms$[ebp+4], eax
	mov	DWORD PTR _forms$[ebp+8], eax
	mov	DWORD PTR _forms$[ebp+12], eax
	mov	DWORD PTR _forms$[ebp+16], eax

; 601  : 	DynTable sqlres = {0};

	mov	DWORD PTR _sqlres$[ebp], 0
	xor	ecx, ecx
	mov	DWORD PTR _sqlres$[ebp+4], ecx
	mov	DWORD PTR _sqlres$[ebp+8], ecx
	mov	DWORD PTR _sqlres$[ebp+12], ecx
	mov	DWORD PTR _sqlres$[ebp+16], ecx

; 602  : 	DynTable id_list = {0};

	mov	DWORD PTR _id_list$[ebp], 0
	xor	edx, edx
	mov	DWORD PTR _id_list$[ebp+4], edx
	mov	DWORD PTR _id_list$[ebp+8], edx
	mov	DWORD PTR _id_list$[ebp+12], edx
	mov	DWORD PTR _id_list$[ebp+16], edx

; 603  : 	DynTable objFORM = {0};

	mov	DWORD PTR _objFORM$[ebp], 0
	xor	eax, eax
	mov	DWORD PTR _objFORM$[ebp+4], eax
	mov	DWORD PTR _objFORM$[ebp+8], eax
	mov	DWORD PTR _objFORM$[ebp+12], eax
	mov	DWORD PTR _objFORM$[ebp+16], eax

; 604  : 	DynTable newform = {0};

	mov	DWORD PTR _newform$[ebp], 0
	xor	ecx, ecx
	mov	DWORD PTR _newform$[ebp+4], ecx
	mov	DWORD PTR _newform$[ebp+8], ecx
	mov	DWORD PTR _newform$[ebp+12], ecx
	mov	DWORD PTR _newform$[ebp+16], ecx

; 605  :  	char qry[1024];
; 606  : 	unsigned long i = i_ctrl, j, k, k0, idobj = 0, newobj = 0;

	mov	edx, DWORD PTR _i_ctrl$[ebp]
	mov	DWORD PTR _i$[ebp], edx
	mov	DWORD PTR _idobj$[ebp], 0
	mov	DWORD PTR _newobj$[ebp], 0

; 607  : 	unsigned long val_LABEL, val_CONTROL, val_FORM, label;
; 608  : 
; 609  : 	/* Check params */
; 610  : 	if(!files) return 0;

	cmp	DWORD PTR _files$[ebp], 0
	jne	SHORT $L70753
	xor	eax, eax
	jmp	$L70729
$L70753:

; 611  : 
; 612  : 	/* Read selected files if absent - return if none selected */
; 613  : 	if(chdir(cntxt->rootdir) || chdir("objlib")) RETURN_ERR_DIRECTORY(NOP);

	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	ecx, DWORD PTR [eax+29724]
	push	ecx
	call	_chdir
	add	esp, 4
	test	eax, eax
	jne	SHORT $L70755
	push	OFFSET FLAT:$SG70756
	call	_chdir
	add	esp, 4
	test	eax, eax
	je	SHORT $L70754
$L70755:
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29872], OFFSET FLAT:$SG70758
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 613		; 00000265H
	jmp	$eva_err$70759
$L70754:

; 614  : 	if(!files->nbrows && cgi_select_files(cntxt, i_ctrl, files)) STACK_ERROR;

	mov	ecx, DWORD PTR _files$[ebp]
	cmp	DWORD PTR [ecx], 0
	jne	SHORT $L70760
	mov	edx, DWORD PTR _files$[ebp]
	push	edx
	mov	eax, DWORD PTR _i_ctrl$[ebp]
	push	eax
	mov	ecx, DWORD PTR _cntxt$[ebp]
	push	ecx
	call	_cgi_select_files
	add	esp, 12					; 0000000cH
	test	eax, eax
	je	SHORT $L70760
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 614		; 00000266H
	jmp	$eva_err$70759
$L70760:

; 615  : 	if (!files->nbrows) RETURN_OK;

	mov	eax, DWORD PTR _files$[ebp]
	cmp	DWORD PTR [eax], 0
	jne	SHORT $L70761
	jmp	$eva_noerr$70762
$L70761:

; 616  : 
; 617  : 	/* Read object data & value Ids */
; 618  : 	if(file_read_import_data(cntxt, &forms, &objdata, dyntab_val(files, 0, 0)) ||
; 619  : 		sql_id_value(cntxt, add_sz_str("_EVA_LABEL"), &val_LABEL) ||
; 620  : 		sql_id_value(cntxt, add_sz_str("_EVA_CONTROL"), &val_CONTROL) ||
; 621  : 		sql_id_value(cntxt, add_sz_str("_EVA_FORM"), &val_FORM)) STACK_ERROR;

	push	0
	push	0
	mov	ecx, DWORD PTR _files$[ebp]
	push	ecx
	call	_dyntab_val
	add	esp, 12					; 0000000cH
	push	eax
	lea	edx, DWORD PTR _objdata$[ebp]
	push	edx
	lea	eax, DWORD PTR _forms$[ebp]
	push	eax
	mov	ecx, DWORD PTR _cntxt$[ebp]
	push	ecx
	call	_file_read_import_data
	add	esp, 16					; 00000010H
	test	eax, eax
	jne	SHORT $L70764
	lea	edx, DWORD PTR _val_LABEL$[ebp]
	push	edx
	push	10					; 0000000aH
	push	OFFSET FLAT:$SG70765
	mov	eax, DWORD PTR _cntxt$[ebp]
	push	eax
	call	_sql_id_value
	add	esp, 16					; 00000010H
	test	eax, eax
	jne	SHORT $L70764
	lea	ecx, DWORD PTR _val_CONTROL$[ebp]
	push	ecx
	push	12					; 0000000cH
	push	OFFSET FLAT:$SG70766
	mov	edx, DWORD PTR _cntxt$[ebp]
	push	edx
	call	_sql_id_value
	add	esp, 16					; 00000010H
	test	eax, eax
	jne	SHORT $L70764
	lea	eax, DWORD PTR _val_FORM$[ebp]
	push	eax
	push	9
	push	OFFSET FLAT:$SG70767
	mov	ecx, DWORD PTR _cntxt$[ebp]
	push	ecx
	call	_sql_id_value
	add	esp, 16					; 00000010H
	test	eax, eax
	je	SHORT $L70763
$L70764:
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 621		; 0000026dH
	jmp	$eva_err$70759
$L70763:

; 622  : 	DYNTAB_ADD_INT(&objFORM, 0, 0, (unsigned long int)OBJ_FORM_CONTROL);

	mov	BYTE PTR __tmp$70768[ebp], 0
	mov	ecx, 7
	xor	eax, eax
	lea	edi, DWORD PTR __tmp$70768[ebp+1]
	rep stosd
	stosw
	stosb
	push	10					; 0000000aH
	push	OFFSET FLAT:$SG70770
	lea	eax, DWORD PTR __tmp$70768[ebp]
	push	eax
	call	_sprintf
	add	esp, 12					; 0000000cH
	push	0
	push	0
	push	0
	lea	ecx, DWORD PTR __tmp$70768[ebp]
	push	ecx
	push	0
	push	0
	lea	edx, DWORD PTR _objFORM$[ebp]
	push	edx
	call	_dyntab_add
	add	esp, 28					; 0000001cH
	test	eax, eax
	je	SHORT $L70772
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29872], OFFSET FLAT:$SG70774
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 622		; 0000026eH
	jmp	$eva_err$70759
$L70772:

; 623  : 
; 624  : 	/* Output page header */
; 625  : 	put_html_page_header(cntxt, NULL, "Importer des données", NULL, 3);

	push	3
	push	0
	push	OFFSET FLAT:$SG70777
	push	0
	mov	edx, DWORD PTR _cntxt$[ebp]
	push	edx
	call	_put_html_page_header
	add	esp, 20					; 00000014H

; 626  : 	cntxt->form->html = &buf;

	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	ecx, DWORD PTR [eax+80]
	lea	edx, DWORD PTR _buf$[ebp]
	mov	DWORD PTR [ecx+232], edx

; 627  : 	html = &buf;

	lea	eax, DWORD PTR _buf$[ebp]
	mov	DWORD PTR _html$[ebp], eax

; 628  : 	cntxt->b_terminate = 15;

	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29776], 15		; 0000000fH

; 629  : 	printf("<font face=Arial><center><b>Importer des données : %s</b></center><hr>", dyntab_val(files, 0, 0));

	push	0
	push	0
	mov	edx, DWORD PTR _files$[ebp]
	push	edx
	call	_dyntab_val
	add	esp, 12					; 0000000cH
	push	eax
	push	OFFSET FLAT:$SG70778
	call	_printf
	add	esp, 8

; 630  : 	fflush(stdout);

	push	OFFSET FLAT:__iob+32
	call	_fflush
	add	esp, 4

; 631  : 
; 632  : 	/* Search for referenced forms in db */
; 633  : 	for(i = 1; i < forms.nbrows; i++)

	mov	DWORD PTR _i$[ebp], 1
	jmp	SHORT $L70779
$L70780:
	mov	eax, DWORD PTR _i$[ebp]
	add	eax, 1
	mov	DWORD PTR _i$[ebp], eax
$L70779:
	mov	ecx, DWORD PTR _i$[ebp]
	cmp	ecx, DWORD PTR _forms$[ebp]
	jae	$L70781

; 635  : 		unsigned long row = id_list.nbrows;

	mov	edx, DWORD PTR _id_list$[ebp]
	mov	DWORD PTR _row$70782[ebp], edx

; 636  : 
; 637  : 		/* Build query for form with given label */
; 638  : 		if(sql_id_value(cntxt, DYNTAB_VAL_SZ(&forms, i, 1), &label)) STACK_ERROR;

	lea	eax, DWORD PTR _label$[ebp]
	push	eax
	push	1
	mov	ecx, DWORD PTR _i$[ebp]
	push	ecx
	lea	edx, DWORD PTR _forms$[ebp]
	push	edx
	call	_dyntab_sz
	add	esp, 12					; 0000000cH
	push	eax
	push	1
	mov	eax, DWORD PTR _i$[ebp]
	push	eax
	lea	ecx, DWORD PTR _forms$[ebp]
	push	ecx
	call	_dyntab_val
	add	esp, 12					; 0000000cH
	push	eax
	mov	edx, DWORD PTR _cntxt$[ebp]
	push	edx
	call	_sql_id_value
	add	esp, 16					; 00000010H
	test	eax, eax
	je	SHORT $L70783
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 638		; 0000027eH
	jmp	$eva_err$70759
$L70783:

; 639  : 		sprintf(qry,
; 640  : 			"SELECT DISTINCT TLink0.IdObj \n"
; 641  : 			"FROM TLink AS TLink0,TLink AS TLink1,TLink AS TLink2 \n"
; 642  : 			"WHERE TLink0.IdObj=TLink1.IdObj AND TLink0.IdObj=TLink2.IdObj \n"
; 643  : 				"AND TLink0.DateDel IS NULL AND TLink0.IdField=%lu AND TLink0.IdRelObj=%du \n"
; 644  : 				"AND TLink1.DateDel IS NULL AND TLink1.IdField=%lu AND TLink1.IdValue=%lu \n"
; 645  : 				"AND TLink2.DateDel IS NULL AND TLink2.IdField=%lu AND TLink2.IdValue=%lu",
; 646  : 				cntxt->val_FORMSTAMP, OBJ_FORM_CONTROL, val_CONTROL, val_FORM, val_LABEL, label);

	mov	ecx, DWORD PTR _label$[ebp]
	push	ecx
	mov	edx, DWORD PTR _val_LABEL$[ebp]
	push	edx
	mov	eax, DWORD PTR _val_FORM$[ebp]
	push	eax
	mov	ecx, DWORD PTR _val_CONTROL$[ebp]
	push	ecx
	push	10					; 0000000aH
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	eax, DWORD PTR [edx+269636]
	push	eax
	push	OFFSET FLAT:$SG70784
	lea	ecx, DWORD PTR _qry$[ebp]
	push	ecx
	call	_sprintf
	add	esp, 32					; 00000020H

; 647  : 		if(sql_exec_query(cntxt, qry) || sql_get_table(cntxt, &sqlres, 2)) STACK_ERROR;

	lea	edx, DWORD PTR _qry$[ebp]
	push	edx
	mov	eax, DWORD PTR _cntxt$[ebp]
	push	eax
	call	_sql_exec_query
	add	esp, 8
	test	eax, eax
	jne	SHORT $L70786
	push	2
	lea	ecx, DWORD PTR _sqlres$[ebp]
	push	ecx
	mov	edx, DWORD PTR _cntxt$[ebp]
	push	edx
	call	_sql_get_table
	add	esp, 12					; 0000000cH
	test	eax, eax
	je	SHORT $L70785
$L70786:
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 647		; 00000287H
	jmp	$eva_err$70759
$L70785:

; 648  : 		if(sqlres.nbrows == 1)

	cmp	DWORD PTR _sqlres$[ebp], 1
	jne	$L70787

; 650  : 			/* Store form Id if form found */
; 651  : 			DYNTAB_SET_CELL(&id_list, row, 0, &forms, i, 0);

	push	0
	push	0
	mov	ecx, DWORD PTR _i$[ebp]
	push	ecx
	lea	edx, DWORD PTR _forms$[ebp]
	push	edx
	call	_dyntab_cell
	add	esp, 12					; 0000000cH
	push	eax
	push	0
	mov	eax, DWORD PTR _row$70782[ebp]
	push	eax
	lea	ecx, DWORD PTR _id_list$[ebp]
	push	ecx
	call	_dyntab_copy
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L70788
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29872], OFFSET FLAT:$SG70790
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 651		; 0000028bH
	jmp	$eva_err$70759
$L70788:

; 652  : 			DYNTAB_ADD_CELL(&id_list, row, 1, &sqlres, 0, 0);

	push	1
	push	0
	push	0
	lea	ecx, DWORD PTR _sqlres$[ebp]
	push	ecx
	call	_dyntab_cell
	add	esp, 12					; 0000000cH
	push	eax
	push	1
	mov	edx, DWORD PTR _row$70782[ebp]
	push	edx
	lea	eax, DWORD PTR _id_list$[ebp]
	push	eax
	call	_dyntab_copy
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L70791
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29872], OFFSET FLAT:$SG70793
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 652		; 0000028cH
	jmp	$eva_err$70759
$L70791:

; 654  : 		else if(sqlres.nbrows == 0)

	jmp	$L70818
$L70787:
	cmp	DWORD PTR _sqlres$[ebp], 0
	jne	$L70795

; 656  : 			/* Create new form with given label if not found */
; 657  : 			DYNTAB_SET(&sqlres, 0, 0, "_EVA_CONTROL");

	push	12					; 0000000cH
	push	OFFSET FLAT:$SG70797
	push	0
	push	0
	lea	eax, DWORD PTR _sqlres$[ebp]
	push	eax
	call	_dyntab_set_txt
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L70796
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29872], OFFSET FLAT:$SG70799
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 657		; 00000291H
	jmp	$eva_err$70759
$L70796:

; 658  : 			DYNTAB_SET(&sqlres, 0, 1, "_EVA_FORM");

	push	9
	push	OFFSET FLAT:$SG70801
	push	1
	push	0
	lea	eax, DWORD PTR _sqlres$[ebp]
	push	eax
	call	_dyntab_set_txt
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L70800
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29872], OFFSET FLAT:$SG70803
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 658		; 00000292H
	jmp	$eva_err$70759
$L70800:

; 659  : 			DYNTAB_SET(&sqlres, 1, 0, "_EVA_LABEL");

	push	10					; 0000000aH
	push	OFFSET FLAT:$SG70805
	push	0
	push	1
	lea	eax, DWORD PTR _sqlres$[ebp]
	push	eax
	call	_dyntab_set_txt
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L70804
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29872], OFFSET FLAT:$SG70807
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 659		; 00000293H
	jmp	$eva_err$70759
$L70804:

; 660  : 			DYNTAB_ADD_CELL(&sqlres, 1, 1, &forms, i, 1);

	push	1
	push	1
	mov	eax, DWORD PTR _i$[ebp]
	push	eax
	lea	ecx, DWORD PTR _forms$[ebp]
	push	ecx
	call	_dyntab_cell
	add	esp, 12					; 0000000cH
	push	eax
	push	1
	push	1
	lea	edx, DWORD PTR _sqlres$[ebp]
	push	edx
	call	_dyntab_copy
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L70808
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29872], OFFSET FLAT:$SG70810
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 660		; 00000294H
	jmp	$eva_err$70759
$L70808:

; 661  : 			DYNTAB_FREE(newform);

	lea	edx, DWORD PTR _newform$[ebp]
	push	edx
	call	_dyntab_free
	add	esp, 4

; 662  : 			if(qry_add_obj_data(cntxt, &newform, &sqlres, &objFORM, 0)) STACK_ERROR;

	push	0
	lea	eax, DWORD PTR _objFORM$[ebp]
	push	eax
	lea	ecx, DWORD PTR _sqlres$[ebp]
	push	ecx
	lea	edx, DWORD PTR _newform$[ebp]
	push	edx
	mov	eax, DWORD PTR _cntxt$[ebp]
	push	eax
	call	_qry_add_obj_data
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L70811
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 662		; 00000296H
	jmp	$eva_err$70759
$L70811:

; 663  : 
; 664  : 			/* Store new form Id */
; 665  : 			DYNTAB_SET_CELL(&id_list, row, 0, &forms, i, 0);

	push	0
	push	0
	mov	edx, DWORD PTR _i$[ebp]
	push	edx
	lea	eax, DWORD PTR _forms$[ebp]
	push	eax
	call	_dyntab_cell
	add	esp, 12					; 0000000cH
	push	eax
	push	0
	mov	ecx, DWORD PTR _row$70782[ebp]
	push	ecx
	lea	edx, DWORD PTR _id_list$[ebp]
	push	edx
	call	_dyntab_copy
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L70812
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29872], OFFSET FLAT:$SG70814
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 665		; 00000299H
	jmp	$eva_err$70759
$L70812:

; 666  : 			DYNTAB_ADD_CELL(&id_list, row, 1, &newform, 0, 0);

	push	1
	push	0
	push	0
	lea	edx, DWORD PTR _newform$[ebp]
	push	edx
	call	_dyntab_cell
	add	esp, 12					; 0000000cH
	push	eax
	push	1
	mov	eax, DWORD PTR _row$70782[ebp]
	push	eax
	lea	ecx, DWORD PTR _id_list$[ebp]
	push	ecx
	call	_dyntab_copy
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L70815
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29872], OFFSET FLAT:$SG70817
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 666		; 0000029aH
	jmp	$eva_err$70759
$L70815:

; 668  : 		else

	jmp	$L70818
$L70795:

; 671  : 						ERR_PUT_TXT("Formulaire : ", dyntab_val(&forms, i, 1), dyntab_sz(&forms, i, 1)));

	push	0
	push	0
	push	13					; 0000000dH
	push	OFFSET FLAT:$SG70820
	mov	ecx, DWORD PTR _cntxt$[ebp]
	add	ecx, 29876				; 000074b4H
	push	ecx
	call	_dynbuf_add
	add	esp, 20					; 00000014H
	push	0
	push	0
	push	1
	mov	edx, DWORD PTR _i$[ebp]
	push	edx
	lea	eax, DWORD PTR _forms$[ebp]
	push	eax
	call	_dyntab_sz
	add	esp, 12					; 0000000cH
	push	eax
	push	1
	mov	ecx, DWORD PTR _i$[ebp]
	push	ecx
	lea	edx, DWORD PTR _forms$[ebp]
	push	edx
	call	_dyntab_val
	add	esp, 12					; 0000000cH
	push	eax
	mov	eax, DWORD PTR _cntxt$[ebp]
	add	eax, 29876				; 000074b4H
	push	eax
	call	_dynbuf_add
	add	esp, 20					; 00000014H
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29872], OFFSET FLAT:$SG70822
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 671		; 0000029fH
	jmp	$eva_err$70759
$L70818:

; 673  : 	}

	jmp	$L70780
$L70781:

; 674  : 
; 675  : 	/* Set first object id as current id if defined */
; 676  : 	if(dyntab_sz(&form->id_obj, 0, 0))

	push	0
	push	0
	mov	eax, DWORD PTR _form$[ebp]
	add	eax, 32					; 00000020H
	push	eax
	call	_dyntab_sz
	add	esp, 12					; 0000000cH
	test	eax, eax
	je	$L70828

; 678  : 		unsigned long row = id_list.nbrows;

	mov	ecx, DWORD PTR _id_list$[ebp]
	mov	DWORD PTR _row$70824[ebp], ecx

; 679  : 		DYNTAB_SET_CELL(&id_list, row, 0, &objdata, 1, 0);

	push	0
	push	0
	push	1
	lea	edx, DWORD PTR _objdata$[ebp]
	push	edx
	call	_dyntab_cell
	add	esp, 12					; 0000000cH
	push	eax
	push	0
	mov	eax, DWORD PTR _row$70824[ebp]
	push	eax
	lea	ecx, DWORD PTR _id_list$[ebp]
	push	ecx
	call	_dyntab_copy
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L70825
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29872], OFFSET FLAT:$SG70827
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 679		; 000002a7H
	jmp	$eva_err$70759
$L70825:

; 680  : 		DYNTAB_SET_CELL(&id_list, row, 1, &form->id_obj, 0, 0);

	push	0
	push	0
	push	0
	mov	ecx, DWORD PTR _form$[ebp]
	add	ecx, 32					; 00000020H
	push	ecx
	call	_dyntab_cell
	add	esp, 12					; 0000000cH
	push	eax
	push	1
	mov	edx, DWORD PTR _row$70824[ebp]
	push	edx
	lea	eax, DWORD PTR _id_list$[ebp]
	push	eax
	call	_dyntab_copy
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L70828
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29872], OFFSET FLAT:$SG70830
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 680		; 000002a8H
	jmp	$eva_err$70759
$L70828:

; 682  : 
; 683  : 	/* Search for existing objects in db */
; 684  : 	printf( "<font face=Courier><b><pre>"
; 685  : 			"Recherche des fiches existantes\n%s", WAIT_TXTSCALE);

	push	OFFSET FLAT:$SG70831
	push	OFFSET FLAT:$SG70832
	call	_printf
	add	esp, 8

; 686  : 	for(i = 0, k = objdata.nbrows, k0 = 0; i < 50 && k && k != k0; i++)

	mov	DWORD PTR _i$[ebp], 0
	mov	eax, DWORD PTR _objdata$[ebp]
	mov	DWORD PTR _k$[ebp], eax
	mov	DWORD PTR _k0$[ebp], 0
	jmp	SHORT $L70833
$L70834:
	mov	ecx, DWORD PTR _i$[ebp]
	add	ecx, 1
	mov	DWORD PTR _i$[ebp], ecx
$L70833:
	cmp	DWORD PTR _i$[ebp], 50			; 00000032H
	jae	$L70835
	cmp	DWORD PTR _k$[ebp], 0
	je	$L70835
	mov	edx, DWORD PTR _k$[ebp]
	cmp	edx, DWORD PTR _k0$[ebp]
	je	$L70835

; 688  : 		if(import_objdata_check(cntxt, &objdata, &id_list)) STACK_ERROR;

	lea	eax, DWORD PTR _id_list$[ebp]
	push	eax
	lea	ecx, DWORD PTR _objdata$[ebp]
	push	ecx
	mov	edx, DWORD PTR _cntxt$[ebp]
	push	edx
	call	_import_objdata_check
	add	esp, 12					; 0000000cH
	test	eax, eax
	je	SHORT $L70836
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 688		; 000002b0H
	jmp	$eva_err$70759
$L70836:

; 689  : 		for(j = 1, k0 = k, k = 0; j < objdata.nbrows; j++)

	mov	DWORD PTR _j$[ebp], 1
	mov	ecx, DWORD PTR _k$[ebp]
	mov	DWORD PTR _k0$[ebp], ecx
	mov	DWORD PTR _k$[ebp], 0
	jmp	SHORT $L70837
$L70838:
	mov	edx, DWORD PTR _j$[ebp]
	add	edx, 1
	mov	DWORD PTR _j$[ebp], edx
$L70837:
	mov	eax, DWORD PTR _j$[ebp]
	cmp	eax, DWORD PTR _objdata$[ebp]
	jae	SHORT $L70839

; 690  : 			if(dyntab_cell(&objdata, j, 0)->col == 1) k++;

	push	0
	mov	ecx, DWORD PTR _j$[ebp]
	push	ecx
	lea	edx, DWORD PTR _objdata$[ebp]
	push	edx
	call	_dyntab_cell
	add	esp, 12					; 0000000cH
	cmp	DWORD PTR [eax+56], 1
	jne	SHORT $L70840
	mov	eax, DWORD PTR _k$[ebp]
	add	eax, 1
	mov	DWORD PTR _k$[ebp], eax
$L70840:

; 691  : 		printf(" (%lu:%lu)\n", i, k);

	jmp	SHORT $L70838
$L70839:
	mov	ecx, DWORD PTR _k$[ebp]
	push	ecx
	mov	edx, DWORD PTR _i$[ebp]
	push	edx
	push	OFFSET FLAT:$SG70841
	call	_printf
	add	esp, 12					; 0000000cH

; 692  : 	}

	jmp	$L70834
$L70835:

; 693  : 	printf("</pre></font>");

	push	OFFSET FLAT:$SG70842
	call	_printf
	add	esp, 4

; 697  : 						"<tr><td><b>Formulaire</td><td><b>Fiches</td><td>Indet</td><td>Nouv</td><td>Exist</td><td>Dbl</td></tr>");

	push	0
	push	0
	push	186					; 000000baH
	push	OFFSET FLAT:$SG70845
	mov	eax, DWORD PTR _html$[ebp]
	push	eax
	call	_dynbuf_add
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L70844
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29872], OFFSET FLAT:$SG70847
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 697		; 000002b9H
	jmp	$eva_err$70759
$L70844:

; 698  : 	for(i = 1; i < forms.nbrows; i++)

	mov	DWORD PTR _i$[ebp], 1
	jmp	SHORT $L70848
$L70849:
	mov	eax, DWORD PTR _i$[ebp]
	add	eax, 1
	mov	DWORD PTR _i$[ebp], eax
$L70848:
	mov	ecx, DWORD PTR _i$[ebp]
	cmp	ecx, DWORD PTR _forms$[ebp]
	jae	$L70850

; 700  : 		unsigned long cnt[5] = {0}, status = dyntab_sz(&form->id_obj, 0, 0) ? 3 : 2;

	mov	DWORD PTR _cnt$70851[ebp], 0
	xor	edx, edx
	mov	DWORD PTR _cnt$70851[ebp+4], edx
	mov	DWORD PTR _cnt$70851[ebp+8], edx
	mov	DWORD PTR _cnt$70851[ebp+12], edx
	mov	DWORD PTR _cnt$70851[ebp+16], edx
	push	0
	push	0
	mov	eax, DWORD PTR _form$[ebp]
	add	eax, 32					; 00000020H
	push	eax
	call	_dyntab_sz
	add	esp, 12					; 0000000cH
	neg	eax
	sbb	eax, eax
	neg	eax
	add	eax, 2
	mov	DWORD PTR _status$70852[ebp], eax

; 701  : 		DYNBUF_ADD3_CELL(html, "<tr><td>", &forms, i, 1, NO_CONV, "</td>");

	push	5
	push	OFFSET FLAT:$SG70855
	push	0
	push	0
	push	1
	mov	ecx, DWORD PTR _i$[ebp]
	push	ecx
	lea	edx, DWORD PTR _forms$[ebp]
	push	edx
	call	_dyntab_sz
	add	esp, 12					; 0000000cH
	push	eax
	push	1
	mov	eax, DWORD PTR _i$[ebp]
	push	eax
	lea	ecx, DWORD PTR _forms$[ebp]
	push	ecx
	call	_dyntab_val
	add	esp, 12					; 0000000cH
	push	eax
	push	8
	push	OFFSET FLAT:$SG70856
	mov	edx, DWORD PTR _html$[ebp]
	push	edx
	call	_dynbuf_add3
	add	esp, 36					; 00000024H
	test	eax, eax
	je	SHORT $L70854
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29872], OFFSET FLAT:$SG70858
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 701		; 000002bdH
	jmp	$eva_err$70759
$L70854:

; 702  : 		for(j = 1; j < objdata.nbrows; j++)

	mov	DWORD PTR _j$[ebp], 1
	jmp	SHORT $L70859
$L70860:
	mov	edx, DWORD PTR _j$[ebp]
	add	edx, 1
	mov	DWORD PTR _j$[ebp], edx
$L70859:
	mov	eax, DWORD PTR _j$[ebp]
	cmp	eax, DWORD PTR _objdata$[ebp]
	jae	$L70861

; 704  : 			DynTableCell *val = dyntab_cell(&objdata, j, 0);

	push	0
	mov	ecx, DWORD PTR _j$[ebp]
	push	ecx
	lea	edx, DWORD PTR _objdata$[ebp]
	push	edx
	call	_dyntab_cell
	add	esp, 12					; 0000000cH
	mov	DWORD PTR _val$70862[ebp], eax

; 705  : 			/* val->col values mean :
; 706  : 				1: unable to perform search - reference to objects no yet searched for
; 707  : 				2: object does not exist
; 708  : 				3: object exist and is unique
; 709  : 				4: object exist with multiple instance */
; 710  : 			if(val->col) status = val->col;

	mov	eax, DWORD PTR _val$70862[ebp]
	cmp	DWORD PTR [eax+56], 0
	je	SHORT $L70863
	mov	ecx, DWORD PTR _val$70862[ebp]
	mov	edx, DWORD PTR [ecx+56]
	mov	DWORD PTR _status$70852[ebp], edx
$L70863:

; 711  : 			if(!strcmp("_EVA_FORMSTAMP", dyntab_val(&objdata,j, 1)) &&
; 712  : 				!dyntab_cmp(&forms, i, 0, &objdata,j, 2))

	push	1
	mov	eax, DWORD PTR _j$[ebp]
	push	eax
	lea	ecx, DWORD PTR _objdata$[ebp]
	push	ecx
	call	_dyntab_val
	add	esp, 12					; 0000000cH
	push	eax
	push	OFFSET FLAT:$SG70865
	call	_strcmp
	add	esp, 8
	test	eax, eax
	jne	SHORT $L70864
	push	2
	mov	edx, DWORD PTR _j$[ebp]
	push	edx
	lea	eax, DWORD PTR _objdata$[ebp]
	push	eax
	push	0
	mov	ecx, DWORD PTR _i$[ebp]
	push	ecx
	lea	edx, DWORD PTR _forms$[ebp]
	push	edx
	call	_dyntab_cmp
	add	esp, 24					; 00000018H
	test	eax, eax
	jne	SHORT $L70864

; 714  : 				cnt[0]++;

	mov	eax, DWORD PTR _cnt$70851[ebp]
	add	eax, 1
	mov	DWORD PTR _cnt$70851[ebp], eax

; 715  : 				cnt[status ? status : 2]++;

	cmp	DWORD PTR _status$70852[ebp], 0
	je	SHORT $L71123
	mov	ecx, DWORD PTR _status$70852[ebp]
	mov	DWORD PTR -1376+[ebp], ecx
	jmp	SHORT $L71124
$L71123:
	mov	DWORD PTR -1376+[ebp], 2
$L71124:
	mov	edx, DWORD PTR -1376+[ebp]
	mov	eax, DWORD PTR _cnt$70851[ebp+edx*4]
	add	eax, 1
	mov	ecx, DWORD PTR -1376+[ebp]
	mov	DWORD PTR _cnt$70851[ebp+ecx*4], eax
$L70864:

; 717  : 		}

	jmp	$L70860
$L70861:

; 718  : 		for(j = 0; j < 5; j++)

	mov	DWORD PTR _j$[ebp], 0
	jmp	SHORT $L70866
$L70867:
	mov	edx, DWORD PTR _j$[ebp]
	add	edx, 1
	mov	DWORD PTR _j$[ebp], edx
$L70866:
	cmp	DWORD PTR _j$[ebp], 5
	jae	SHORT $L70868

; 719  : 			DYNBUF_ADD3_INT(html, "<td align=center>", cnt[j], "</td>");

	push	5
	push	OFFSET FLAT:$SG70870
	mov	eax, DWORD PTR _j$[ebp]
	mov	ecx, DWORD PTR _cnt$70851[ebp+eax*4]
	push	ecx
	push	17					; 00000011H
	push	OFFSET FLAT:$SG70871
	mov	edx, DWORD PTR _html$[ebp]
	push	edx
	call	_dynbuf_add3_int
	add	esp, 24					; 00000018H
	test	eax, eax
	je	SHORT $L70869
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29872], OFFSET FLAT:$SG70873
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 719		; 000002cfH
	jmp	$eva_err$70759
$L70869:
	jmp	SHORT $L70867
$L70868:

; 720  : 		DYNBUF_ADD_STR(html, "</tr>");

	push	0
	push	0
	push	5
	push	OFFSET FLAT:$SG70876
	mov	edx, DWORD PTR _html$[ebp]
	push	edx
	call	_dynbuf_add
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L70875
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29872], OFFSET FLAT:$SG70878
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 720		; 000002d0H
	jmp	$eva_err$70759
$L70875:

; 721  : 	}

	jmp	$L70849
$L70850:

; 722  : 	DYNBUF_ADD_STR(html, "<tr><td align=right><b>Total</td>");

	push	0
	push	0
	push	33					; 00000021H
	push	OFFSET FLAT:$SG70881
	mov	edx, DWORD PTR _html$[ebp]
	push	edx
	call	_dynbuf_add
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L70880
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29872], OFFSET FLAT:$SG70883
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 722		; 000002d2H
	jmp	$eva_err$70759
$L70880:

; 724  : 		unsigned long cnt[5] = {0}, status = dyntab_sz(&form->id_obj, 0, 0) ? 3 : 2;

	mov	DWORD PTR _cnt$70884[ebp], 0
	xor	edx, edx
	mov	DWORD PTR _cnt$70884[ebp+4], edx
	mov	DWORD PTR _cnt$70884[ebp+8], edx
	mov	DWORD PTR _cnt$70884[ebp+12], edx
	mov	DWORD PTR _cnt$70884[ebp+16], edx
	push	0
	push	0
	mov	eax, DWORD PTR _form$[ebp]
	add	eax, 32					; 00000020H
	push	eax
	call	_dyntab_sz
	add	esp, 12					; 0000000cH
	neg	eax
	sbb	eax, eax
	neg	eax
	add	eax, 2
	mov	DWORD PTR _status$70885[ebp], eax

; 725  : 		for(j = 1; j < objdata.nbrows; j++)

	mov	DWORD PTR _j$[ebp], 1
	jmp	SHORT $L70886
$L70887:
	mov	ecx, DWORD PTR _j$[ebp]
	add	ecx, 1
	mov	DWORD PTR _j$[ebp], ecx
$L70886:
	mov	edx, DWORD PTR _j$[ebp]
	cmp	edx, DWORD PTR _objdata$[ebp]
	jae	$L70888

; 727  : 			DynTableCell *val = dyntab_cell(&objdata, j, 0);

	push	0
	mov	eax, DWORD PTR _j$[ebp]
	push	eax
	lea	ecx, DWORD PTR _objdata$[ebp]
	push	ecx
	call	_dyntab_cell
	add	esp, 12					; 0000000cH
	mov	DWORD PTR _val$70889[ebp], eax

; 728  : 			if(val->col) status = val->col;

	mov	edx, DWORD PTR _val$70889[ebp]
	cmp	DWORD PTR [edx+56], 0
	je	SHORT $L70890
	mov	eax, DWORD PTR _val$70889[ebp]
	mov	ecx, DWORD PTR [eax+56]
	mov	DWORD PTR _status$70885[ebp], ecx
$L70890:

; 729  : 			if(j && dyntab_cmp(&objdata, j - 1, 0, &objdata,j, 0))

	cmp	DWORD PTR _j$[ebp], 0
	je	SHORT $L70891
	push	0
	mov	edx, DWORD PTR _j$[ebp]
	push	edx
	lea	eax, DWORD PTR _objdata$[ebp]
	push	eax
	push	0
	mov	ecx, DWORD PTR _j$[ebp]
	sub	ecx, 1
	push	ecx
	lea	edx, DWORD PTR _objdata$[ebp]
	push	edx
	call	_dyntab_cmp
	add	esp, 24					; 00000018H
	test	eax, eax
	je	SHORT $L70891

; 731  : 				cnt[0]++;

	mov	eax, DWORD PTR _cnt$70884[ebp]
	add	eax, 1
	mov	DWORD PTR _cnt$70884[ebp], eax

; 732  : 				cnt[status ? status : 2]++;

	cmp	DWORD PTR _status$70885[ebp], 0
	je	SHORT $L71125
	mov	ecx, DWORD PTR _status$70885[ebp]
	mov	DWORD PTR -1380+[ebp], ecx
	jmp	SHORT $L71126
$L71125:
	mov	DWORD PTR -1380+[ebp], 2
$L71126:
	mov	edx, DWORD PTR -1380+[ebp]
	mov	eax, DWORD PTR _cnt$70884[ebp+edx*4]
	add	eax, 1
	mov	ecx, DWORD PTR -1380+[ebp]
	mov	DWORD PTR _cnt$70884[ebp+ecx*4], eax
$L70891:

; 734  : 		}

	jmp	$L70887
$L70888:

; 735  : 		for(j = 0; j < 5; j++)

	mov	DWORD PTR _j$[ebp], 0
	jmp	SHORT $L70892
$L70893:
	mov	edx, DWORD PTR _j$[ebp]
	add	edx, 1
	mov	DWORD PTR _j$[ebp], edx
$L70892:
	cmp	DWORD PTR _j$[ebp], 5
	jae	SHORT $L70894

; 736  : 			DYNBUF_ADD3_INT(html, "<td align=center><b>", cnt[j], "</td>");

	push	5
	push	OFFSET FLAT:$SG70896
	mov	eax, DWORD PTR _j$[ebp]
	mov	ecx, DWORD PTR _cnt$70884[ebp+eax*4]
	push	ecx
	push	20					; 00000014H
	push	OFFSET FLAT:$SG70897
	mov	edx, DWORD PTR _html$[ebp]
	push	edx
	call	_dynbuf_add3_int
	add	esp, 24					; 00000018H
	test	eax, eax
	je	SHORT $L70895
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29872], OFFSET FLAT:$SG70899
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 736		; 000002e0H
	jmp	$eva_err$70759
$L70895:
	jmp	SHORT $L70893
$L70894:

; 738  : 	DYNBUF_ADD_STR(html, "</table>");

	push	0
	push	0
	push	8
	push	OFFSET FLAT:$SG70902
	mov	edx, DWORD PTR _html$[ebp]
	push	edx
	call	_dynbuf_add
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L70901
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29872], OFFSET FLAT:$SG70904
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 738		; 000002e2H
	jmp	$eva_err$70759
$L70901:

; 739  : 	puts(buf->data);

	mov	edx, DWORD PTR _buf$[ebp]
	add	edx, 8
	push	edx
	call	_puts
	add	esp, 4

; 740  : 	buf->cnt = 0;

	mov	eax, DWORD PTR _buf$[ebp]
	mov	DWORD PTR [eax+4], 0

; 741  : 	fflush(stdout);

	push	OFFSET FLAT:__iob+32
	call	_fflush
	add	esp, 4

; 742  : 
; 743  : 	/* Clear current object if defined */
; 744  : 	k0 = 0;

	mov	DWORD PTR _k0$[ebp], 0

; 745  : 	if(dyntab_sz(&form->id_obj, 0, 0))

	push	0
	push	0
	mov	ecx, DWORD PTR _form$[ebp]
	add	ecx, 32					; 00000020H
	push	ecx
	call	_dyntab_sz
	add	esp, 12					; 0000000cH
	test	eax, eax
	je	SHORT $L70905

; 747  : 		sprintf(qry, "UPDATE TLink SET DateDel='%s', IdWhoDel=%s WHERE IdObj=%s AND DateDel IS NULL",
; 748  : 				cntxt->timestamp, dyntab_val(&cntxt->id_user, 0, 0), dyntab_val(&form->id_obj, 0, 0));

	push	0
	push	0
	mov	edx, DWORD PTR _form$[ebp]
	add	edx, 32					; 00000020H
	push	edx
	call	_dyntab_val
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
	mov	ecx, DWORD PTR _cntxt$[ebp]
	add	ecx, 29704				; 00007408H
	push	ecx
	push	OFFSET FLAT:$SG70906
	lea	edx, DWORD PTR _qry$[ebp]
	push	edx
	call	_sprintf
	add	esp, 20					; 00000014H

; 749  : 		if(sql_exec_query(cntxt, qry)) STACK_ERROR;

	lea	eax, DWORD PTR _qry$[ebp]
	push	eax
	mov	ecx, DWORD PTR _cntxt$[ebp]
	push	ecx
	call	_sql_exec_query
	add	esp, 8
	test	eax, eax
	je	SHORT $L70907
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 749		; 000002edH
	jmp	$eva_err$70759
$L70907:

; 751  : 	else k0 = 1;

	jmp	SHORT $L70908
$L70905:
	mov	DWORD PTR _k0$[ebp], 1
$L70908:

; 752  : 
; 753  : 	/* Loop on objects data */
; 754  : 	printf("<font face=Courier><b><pre>Import des données\n%s", WAIT_TXTSCALE);

	push	OFFSET FLAT:$SG70909
	push	OFFSET FLAT:$SG70910
	call	_printf
	add	esp, 8

; 755  : 	fflush(stdout);

	push	OFFSET FLAT:__iob+32
	call	_fflush
	add	esp, 4

; 756  : 	for(i = 1, k = 0; i < objdata.nbrows; i++)

	mov	DWORD PTR _i$[ebp], 1
	mov	DWORD PTR _k$[ebp], 0
	jmp	SHORT $L70911
$L70912:
	mov	eax, DWORD PTR _i$[ebp]
	add	eax, 1
	mov	DWORD PTR _i$[ebp], eax
$L70911:
	mov	ecx, DWORD PTR _i$[ebp]
	cmp	ecx, DWORD PTR _objdata$[ebp]
	jae	$L70913

; 758  : 		unsigned long pkey = 0, id = DYNTAB_TOULRC(&objdata, i, 0);

	mov	DWORD PTR _pkey$70914[ebp], 0
	push	10					; 0000000aH
	push	0
	push	0
	mov	edx, DWORD PTR _i$[ebp]
	push	edx
	lea	eax, DWORD PTR _objdata$[ebp]
	push	eax
	call	_dyntab_val
	add	esp, 12					; 0000000cH
	push	eax
	call	_strtoul
	add	esp, 12					; 0000000cH
	mov	DWORD PTR _id$70915[ebp], eax

; 759  : 		DynTableCell cell = {0};

	mov	DWORD PTR _cell$70917[ebp], 0
	mov	ecx, 15					; 0000000fH
	xor	eax, eax
	lea	edi, DWORD PTR _cell$70917[ebp+4]
	rep stosd
$L70919:

; 760  : 
; 761  : 		/* Handle progress bar */
; 762  : 		while(k <= 60 * i / objdata.nbrows) { printf("*"); fflush(stdout); k++; }

	mov	eax, DWORD PTR _i$[ebp]
	imul	eax, 60					; 0000003cH
	xor	edx, edx
	div	DWORD PTR _objdata$[ebp]
	cmp	DWORD PTR _k$[ebp], eax
	ja	SHORT $L70920
	push	OFFSET FLAT:$SG70921
	call	_printf
	add	esp, 4
	push	OFFSET FLAT:__iob+32
	call	_fflush
	add	esp, 4
	mov	ecx, DWORD PTR _k$[ebp]
	add	ecx, 1
	mov	DWORD PTR _k$[ebp], ecx
	jmp	SHORT $L70919
$L70920:

; 763  : 
; 764  : 		/* If new object */
; 765  : 		if(id != idobj)

	mov	edx, DWORD PTR _id$70915[ebp]
	cmp	edx, DWORD PTR _idobj$[ebp]
	je	$L70929

; 767  : 			/* Search object id in id_list table */
; 768  : 			DynTableCell *val;
; 769  : 			if(import_handle_idlist(cntxt, dyntab_cell(&objdata, i, 0), &id_list, &j)) STACK_ERROR;

	lea	eax, DWORD PTR _j$[ebp]
	push	eax
	lea	ecx, DWORD PTR _id_list$[ebp]
	push	ecx
	push	0
	mov	edx, DWORD PTR _i$[ebp]
	push	edx
	lea	eax, DWORD PTR _objdata$[ebp]
	push	eax
	call	_dyntab_cell
	add	esp, 12					; 0000000cH
	push	eax
	mov	ecx, DWORD PTR _cntxt$[ebp]
	push	ecx
	call	_import_handle_idlist
	add	esp, 16					; 00000010H
	test	eax, eax
	je	SHORT $L70924
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 769		; 00000301H
	jmp	$eva_err$70759
$L70924:

; 770  : 			val = dyntab_cell(&id_list, j, 1);

	push	1
	mov	eax, DWORD PTR _j$[ebp]
	push	eax
	lea	ecx, DWORD PTR _id_list$[ebp]
	push	ecx
	call	_dyntab_cell
	add	esp, 12					; 0000000cH
	mov	DWORD PTR _val$70923[ebp], eax

; 771  : 			idobj = id;

	mov	edx, DWORD PTR _id$70915[ebp]
	mov	DWORD PTR _idobj$[ebp], edx

; 772  : 
; 773  : 			/* Skip object if found in DB */
; 774  : 			if(val->col)

	mov	eax, DWORD PTR _val$70923[ebp]
	cmp	DWORD PTR [eax+56], 0
	je	SHORT $L70925

; 776  : 				i = val->col;

	mov	ecx, DWORD PTR _val$70923[ebp]
	mov	edx, DWORD PTR [ecx+56]
	mov	DWORD PTR _i$[ebp], edx

; 777  : 				continue;

	jmp	$L70912
$L70925:

; 779  : 			/* Use empty record created for object if applicable */
; 780  : 			else if(val->Pkey)

	mov	eax, DWORD PTR _val$70923[ebp]
	cmp	DWORD PTR [eax+16], 0
	je	SHORT $L70927

; 782  : 				/* Set pkey to object record & clear pkey in table */
; 783  : 				pkey = val->Pkey;

	mov	ecx, DWORD PTR _val$70923[ebp]
	mov	edx, DWORD PTR [ecx+16]
	mov	DWORD PTR _pkey$70914[ebp], edx

; 784  : 				val->Pkey = 0;

	mov	eax, DWORD PTR _val$70923[ebp]
	mov	DWORD PTR [eax+16], 0
$L70927:

; 786  : 			newobj = strtoul(val->txt, NULL, 10);

	push	10					; 0000000aH
	push	0
	mov	ecx, DWORD PTR _val$70923[ebp]
	mov	edx, DWORD PTR [ecx]
	push	edx
	call	_strtoul
	add	esp, 12					; 0000000cH
	mov	DWORD PTR _newobj$[ebp], eax

; 787  : 			if(i > 1) k0++;

	cmp	DWORD PTR _i$[ebp], 1
	jbe	SHORT $L70929
	mov	eax, DWORD PTR _k0$[ebp]
	add	eax, 1
	mov	DWORD PTR _k0$[ebp], eax
$L70929:

; 789  : 
; 790  : 		/* Prepare new value for object & add to db */
; 791  : 		cell.IdObj = newobj;

	mov	ecx, DWORD PTR _newobj$[ebp]
	mov	DWORD PTR _cell$70917[ebp+20], ecx

; 792  : 		cell.field = dyntab_val(&objdata, i, 1);

	push	1
	mov	edx, DWORD PTR _i$[ebp]
	push	edx
	lea	eax, DWORD PTR _objdata$[ebp]
	push	eax
	call	_dyntab_val
	add	esp, 12					; 0000000cH
	mov	DWORD PTR _cell$70917[ebp+8], eax

; 793  : 		cell.Num = atoi(dyntab_val(&objdata, i, 4));

	push	4
	mov	ecx, DWORD PTR _i$[ebp]
	push	ecx
	lea	edx, DWORD PTR _objdata$[ebp]
	push	edx
	call	_dyntab_val
	add	esp, 12					; 0000000cH
	push	eax
	call	_atoi
	add	esp, 4
	mov	DWORD PTR _cell$70917[ebp+36], eax

; 794  : 		cell.Line = atoi(dyntab_val(&objdata, i, 5));

	push	5
	mov	eax, DWORD PTR _i$[ebp]
	push	eax
	lea	ecx, DWORD PTR _objdata$[ebp]
	push	ecx
	call	_dyntab_val
	add	esp, 12					; 0000000cH
	push	eax
	call	_atoi
	add	esp, 4
	mov	DWORD PTR _cell$70917[ebp+40], eax

; 795  : 
; 796  : 		/* If value is a relation */
; 797  : 		if(*dyntab_val(&objdata, i, 3) == 'R')

	push	3
	mov	edx, DWORD PTR _i$[ebp]
	push	edx
	lea	eax, DWORD PTR _objdata$[ebp]
	push	eax
	call	_dyntab_val
	add	esp, 12					; 0000000cH
	movsx	ecx, BYTE PTR [eax]
	cmp	ecx, 82					; 00000052H
	jne	$L70930

; 799  : 			/* Relation to an imported object : set value to new id in id_list table */
; 800  : 			if(import_handle_idlist(cntxt, dyntab_cell(&objdata, i, 2), &id_list, &j)) STACK_ERROR;

	lea	edx, DWORD PTR _j$[ebp]
	push	edx
	lea	eax, DWORD PTR _id_list$[ebp]
	push	eax
	push	2
	mov	ecx, DWORD PTR _i$[ebp]
	push	ecx
	lea	edx, DWORD PTR _objdata$[ebp]
	push	edx
	call	_dyntab_cell
	add	esp, 12					; 0000000cH
	push	eax
	mov	eax, DWORD PTR _cntxt$[ebp]
	push	eax
	call	_import_handle_idlist
	add	esp, 16					; 00000010H
	test	eax, eax
	je	SHORT $L70931
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 800		; 00000320H
	jmp	$eva_err$70759
$L70931:

; 801  : 			cell.txt = dyntab_val(&id_list, j, 1);

	push	1
	mov	edx, DWORD PTR _j$[ebp]
	push	edx
	lea	eax, DWORD PTR _id_list$[ebp]
	push	eax
	call	_dyntab_val
	add	esp, 12					; 0000000cH
	mov	DWORD PTR _cell$70917[ebp], eax

; 802  : 			cell.len = dyntab_sz(&id_list, j, 1);

	push	1
	mov	ecx, DWORD PTR _j$[ebp]
	push	ecx
	lea	edx, DWORD PTR _id_list$[ebp]
	push	edx
	call	_dyntab_sz
	add	esp, 12					; 0000000cH
	mov	DWORD PTR _cell$70917[ebp+4], eax

; 803  : 			cell.b_relation = 1;

	mov	BYTE PTR _cell$70917[ebp+12], 1

; 805  : 		else

	jmp	SHORT $L70932
$L70930:

; 807  : 			/* Plain value : set text */
; 808  : 			cell.txt = dyntab_val(&objdata, i, 2);

	push	2
	mov	eax, DWORD PTR _i$[ebp]
	push	eax
	lea	ecx, DWORD PTR _objdata$[ebp]
	push	ecx
	call	_dyntab_val
	add	esp, 12					; 0000000cH
	mov	DWORD PTR _cell$70917[ebp], eax

; 809  : 			cell.len = dyntab_sz(&objdata, i, 2);

	push	2
	mov	edx, DWORD PTR _i$[ebp]
	push	edx
	lea	eax, DWORD PTR _objdata$[ebp]
	push	eax
	call	_dyntab_sz
	add	esp, 12					; 0000000cH
	mov	DWORD PTR _cell$70917[ebp+4], eax
$L70932:

; 811  : 
; 812  : 		/* Add value to db */
; 813  : 		if(qry_add_val(cntxt, &cell, 2, &pkey)) STACK_ERROR;

	lea	ecx, DWORD PTR _pkey$70914[ebp]
	push	ecx
	push	2
	lea	edx, DWORD PTR _cell$70917[ebp]
	push	edx
	mov	eax, DWORD PTR _cntxt$[ebp]
	push	eax
	call	_qry_add_val
	add	esp, 16					; 00000010H
	test	eax, eax
	je	SHORT $L70933
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 813		; 0000032dH
	jmp	$eva_err$70759
$L70933:

; 814  : 	}

	jmp	$L70912
$L70913:

; 815  : 
; 816  : 	/* Output footer */
; 817  : 	while(k <= 60) { printf("*"); fflush(stdout); k++; }

	cmp	DWORD PTR _k$[ebp], 60			; 0000003cH
	ja	SHORT $L70936
	push	OFFSET FLAT:$SG70937
	call	_printf
	add	esp, 4
	push	OFFSET FLAT:__iob+32
	call	_fflush
	add	esp, 4
	mov	edx, DWORD PTR _k$[ebp]
	add	edx, 1
	mov	DWORD PTR _k$[ebp], edx
	jmp	SHORT $L70913
$L70936:

; 818  : 	printf("</pre></font><br><b><u>Nombre de fiches créées : %lu</u></b><br><br>", k0);

	mov	eax, DWORD PTR _k0$[ebp]
	push	eax
	push	OFFSET FLAT:$SG70938
	call	_printf
	add	esp, 8

; 819  : 	DYNBUF_ADD_STR(html, "<table noboder width=100%><tr><td align=center>");

	push	0
	push	0
	push	47					; 0000002fH
	push	OFFSET FLAT:$SG70941
	mov	ecx, DWORD PTR _html$[ebp]
	push	ecx
	call	_dynbuf_add
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L70940
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29872], OFFSET FLAT:$SG70943
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 819		; 00000333H
	jmp	$eva_err$70759
$L70940:

; 820  : 	if(put_html_button(cntxt, "NOP", "Revenir", "_eva_btn_gobackobj_fr.gif", "_eva_btn_gobackobj_fr_s.gif",
; 821  : 							"Retourne à la page précédente", 0, 0)) STACK_ERROR;

	push	0
	push	0
	push	0
	push	0
	push	0
	push	OFFSET FLAT:$SG70946
	push	OFFSET FLAT:$SG70947
	push	OFFSET FLAT:$SG70948
	push	OFFSET FLAT:$SG70949
	push	OFFSET FLAT:$SG70950
	mov	ecx, DWORD PTR _cntxt$[ebp]
	push	ecx
	call	_put_html_button_sz
	add	esp, 44					; 0000002cH
	test	eax, eax
	je	SHORT $L70945
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 821		; 00000335H
	jmp	$eva_err$70759
$L70945:

; 822  : 	DYNBUF_ADD_STR(html, "</td><td align=center>");

	push	0
	push	0
	push	22					; 00000016H
	push	OFFSET FLAT:$SG70953
	mov	eax, DWORD PTR _html$[ebp]
	push	eax
	call	_dynbuf_add
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L70952
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29872], OFFSET FLAT:$SG70955
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 822		; 00000336H
	jmp	$eva_err$70759
$L70952:

; 823  : 	DYNBUF_ADD3_CELL(&name, "B$#.DELOBJLIB=", files, 0, 0, HTML_NO_QUOTE, "$1");

	push	2
	push	OFFSET FLAT:$SG70957
	push	1
	push	OFFSET FLAT:_no_quote
	push	0
	push	0
	mov	eax, DWORD PTR _files$[ebp]
	push	eax
	call	_dyntab_sz
	add	esp, 12					; 0000000cH
	push	eax
	push	0
	push	0
	mov	ecx, DWORD PTR _files$[ebp]
	push	ecx
	call	_dyntab_val
	add	esp, 12					; 0000000cH
	push	eax
	push	14					; 0000000eH
	push	OFFSET FLAT:$SG70958
	lea	edx, DWORD PTR _name$[ebp]
	push	edx
	call	_dynbuf_add3
	add	esp, 36					; 00000024H
	test	eax, eax
	je	SHORT $L70956
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29872], OFFSET FLAT:$SG70960
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 823		; 00000337H
	jmp	$eva_err$70759
$L70956:

; 824  : 	if(put_html_button(cntxt, name->data, "Supprimer le fichier", "_eva_btn_delfile_fr.gif", "_eva_btn_delfile_fr_s.gif",
; 825  : 							"Supprimer le fichier qui vient d'être importé", 0, 0)) STACK_ERROR;

	push	0
	push	0
	push	0
	push	0
	push	0
	push	OFFSET FLAT:$SG70963
	push	OFFSET FLAT:$SG70964
	push	OFFSET FLAT:$SG70965
	push	OFFSET FLAT:$SG70966
	mov	edx, DWORD PTR _name$[ebp]
	add	edx, 8
	push	edx
	mov	eax, DWORD PTR _cntxt$[ebp]
	push	eax
	call	_put_html_button_sz
	add	esp, 44					; 0000002cH
	test	eax, eax
	je	SHORT $L70962
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 825		; 00000339H
	jmp	SHORT $eva_err$70759
$L70962:

; 826  : 	DYNBUF_ADD_STR(html, "</td></tr></table><br>");

	push	0
	push	0
	push	22					; 00000016H
	push	OFFSET FLAT:$SG70969
	mov	edx, DWORD PTR _html$[ebp]
	push	edx
	call	_dynbuf_add
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L70968
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29872], OFFSET FLAT:$SG70971
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 826		; 0000033aH
	jmp	SHORT $eva_err$70759
$L70968:

; 827  : 	puts(buf->data);

	mov	edx, DWORD PTR _buf$[ebp]
	add	edx, 8
	push	edx
	call	_puts
	add	esp, 4
$eva_noerr$70762:

; 828  : 
; 829  : 	RETURN_OK_CLEANUP;

	push	0
	push	OFFSET FLAT:$SG70972
	push	OFFSET FLAT:$SG70973
	mov	eax, DWORD PTR _cntxt$[ebp]
	push	eax
	call	_err_clear
	add	esp, 16					; 00000010H
$eva_err$70759:
	mov	ecx, DWORD PTR _cntxt$[ebp]
	cmp	DWORD PTR [ecx+29872], 0
	je	SHORT $L70974
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	eax, DWORD PTR [edx+29900]
	push	eax
	push	OFFSET FLAT:$SG70975
	push	OFFSET FLAT:$SG70976
	mov	ecx, DWORD PTR _cntxt$[ebp]
	push	ecx
	call	_err_add_context
	add	esp, 16					; 00000010H
$L70974:
	mov	edx, DWORD PTR _name$[ebp]
	push	edx
	call	_mem_free
	add	esp, 4
	mov	DWORD PTR _name$[ebp], 0
	mov	eax, DWORD PTR _buf$[ebp]
	push	eax
	call	_mem_free
	add	esp, 4
	mov	DWORD PTR _buf$[ebp], 0
	lea	ecx, DWORD PTR _objdata$[ebp]
	push	ecx
	call	_dyntab_free
	add	esp, 4
	lea	edx, DWORD PTR _forms$[ebp]
	push	edx
	call	_dyntab_free
	add	esp, 4
	lea	eax, DWORD PTR _sqlres$[ebp]
	push	eax
	call	_dyntab_free
	add	esp, 4
	lea	ecx, DWORD PTR _id_list$[ebp]
	push	ecx
	call	_dyntab_free
	add	esp, 4
	lea	edx, DWORD PTR _objFORM$[ebp]
	push	edx
	call	_dyntab_free
	add	esp, 4
	lea	eax, DWORD PTR _newform$[ebp]
	push	eax
	call	_dyntab_free
	add	esp, 4
	mov	ecx, DWORD PTR _cntxt$[ebp]
	xor	eax, eax
	cmp	DWORD PTR [ecx+29872], 0
	setne	al
$L70729:

; 830  : }

	pop	edi
	mov	esp, ebp
	pop	ebp
	ret	0
_import_objdata_file ENDP
_TEXT	ENDS
PUBLIC	_action_import
EXTRN	_file_read_tabrc:NEAR
EXTRN	_dyntab_filter_field:NEAR
EXTRN	_dyntab_field_cell:NEAR
EXTRN	_dyntab_order_lines:NEAR
EXTRN	_form_get_field_values:NEAR
_BSS	SEGMENT
	ALIGN	4

$SG71003 DB	01H DUP (?)
_BSS	ENDS
_DATA	SEGMENT
$SG71001 DB	'_EVA_CLEAR_FORM', 00H
$SG71005 DB	'_EVA_FILE', 00H
	ORG $+2
$SG71009 DB	'_EVA_FORM', 00H
	ORG $+2
$SG71011 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG71016 DB	'Import de donn', 0e9H, 'es', 00H
	ORG $+2
$SG71017 DB	'<font face=Arial><b>Import du fichier %s</b><br>', 00H
	ORG $+3
$SG71020 DB	'Pr', 0e9H, 'paration ', 0e0H, ' l''effacement des fiches'
	DB	' ... %s', 00H
	ORG $+3
$SG71021 DB	'SELECT DISTINCT IdObj FROM TLINK WHERE IdField=%lu AND I'
	DB	'dRelObj=%s', 00H
	ORG $+1
$SG71024 DB	'DELCONFIRM', 00H
	ORG $+1
$SG71025 DB	' %lu fiches trouv', 0e9H, 'es<br>', 00H
	ORG $+3
$SG71027 DB	' Effacement ...', 00H
$SG71030 DB	'DELETE FROM TLink WHERE TLink.IdObj IN (', 00H
	ORG $+3
$SG71032 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG71037 DB	') OR TLink.IdRelObj IN (', 00H
	ORG $+3
$SG71039 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG71043 DB	')', 00H
	ORG $+2
$SG71045 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG71047 DB	' termin', 0e9H, '<br>', 00H
	ORG $+3
$SG71050 DB	'_EVA_MULTIVAL_SEP', 00H
	ORG $+2
$SG71052 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG71055 DB	'_EVA_KEY_FIELDS', 00H
$SG71057 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG71061 DB	'_EVA_RELTYPE', 00H
	ORG $+3
$SG71063 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG71067 DB	'_EVA_RELFIELD_SRC', 00H
	ORG $+2
$SG71069 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG71073 DB	'_EVA_RELFIELD_DEST', 00H
	ORG $+1
$SG71075 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG71079 DB	'_EVA_RELFORM', 00H
	ORG $+3
$SG71081 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG71087 DB	'D:\Travail\ABI\EVA\V4.0\CGI\Brunix-2016\action_import.c', 00H
$SG71088 DB	'action_import', 00H
	ORG $+2
$SG71090 DB	'D:\Travail\ABI\EVA\V4.0\CGI\Brunix-2016\action_import.c', 00H
$SG71091 DB	'action_import', 00H
_DATA	ENDS
_TEXT	SEGMENT
_cntxt$ = 8
_i_ctrl$ = 12
_form$ = -32
_file$ = -200
_formdest$ = -28
_keyfields$ = -180
_multvalsep$ = -160
_reltype$ = -116
_relfldsrc$ = -76
_relflddest$ = -140
_relformdest$ = -96
_data$ = -52
_name$ = -120
_sql$ = -8
_b_clear$ = -4
_btn$ = -56
_filename$71013 = -204
_qry$71019 = -1228
_action_import PROC NEAR

; 853  : ){

	push	ebp
	mov	ebp, esp
	sub	esp, 1232				; 000004d0H

; 854  : 	EVA_form *form = cntxt->form;

	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	ecx, DWORD PTR [eax+80]
	mov	DWORD PTR _form$[ebp], ecx

; 855  : 	DynTable file = { 0 };

	mov	DWORD PTR _file$[ebp], 0
	xor	edx, edx
	mov	DWORD PTR _file$[ebp+4], edx
	mov	DWORD PTR _file$[ebp+8], edx
	mov	DWORD PTR _file$[ebp+12], edx
	mov	DWORD PTR _file$[ebp+16], edx

; 856  : 	DynTable formdest = { 0 };

	mov	DWORD PTR _formdest$[ebp], 0
	xor	eax, eax
	mov	DWORD PTR _formdest$[ebp+4], eax
	mov	DWORD PTR _formdest$[ebp+8], eax
	mov	DWORD PTR _formdest$[ebp+12], eax
	mov	DWORD PTR _formdest$[ebp+16], eax

; 857  : 	DynTable keyfields = { 0 };

	mov	DWORD PTR _keyfields$[ebp], 0
	xor	ecx, ecx
	mov	DWORD PTR _keyfields$[ebp+4], ecx
	mov	DWORD PTR _keyfields$[ebp+8], ecx
	mov	DWORD PTR _keyfields$[ebp+12], ecx
	mov	DWORD PTR _keyfields$[ebp+16], ecx

; 858  : 	DynTable multvalsep = { 0 };

	mov	DWORD PTR _multvalsep$[ebp], 0
	xor	edx, edx
	mov	DWORD PTR _multvalsep$[ebp+4], edx
	mov	DWORD PTR _multvalsep$[ebp+8], edx
	mov	DWORD PTR _multvalsep$[ebp+12], edx
	mov	DWORD PTR _multvalsep$[ebp+16], edx

; 859  : 	DynTable reltype = { 0 };

	mov	DWORD PTR _reltype$[ebp], 0
	xor	eax, eax
	mov	DWORD PTR _reltype$[ebp+4], eax
	mov	DWORD PTR _reltype$[ebp+8], eax
	mov	DWORD PTR _reltype$[ebp+12], eax
	mov	DWORD PTR _reltype$[ebp+16], eax

; 860  : 	DynTable relfldsrc = { 0 };

	mov	DWORD PTR _relfldsrc$[ebp], 0
	xor	ecx, ecx
	mov	DWORD PTR _relfldsrc$[ebp+4], ecx
	mov	DWORD PTR _relfldsrc$[ebp+8], ecx
	mov	DWORD PTR _relfldsrc$[ebp+12], ecx
	mov	DWORD PTR _relfldsrc$[ebp+16], ecx

; 861  : 	DynTable relflddest = { 0 };

	mov	DWORD PTR _relflddest$[ebp], 0
	xor	edx, edx
	mov	DWORD PTR _relflddest$[ebp+4], edx
	mov	DWORD PTR _relflddest$[ebp+8], edx
	mov	DWORD PTR _relflddest$[ebp+12], edx
	mov	DWORD PTR _relflddest$[ebp+16], edx

; 862  : 	DynTable relformdest = { 0 };

	mov	DWORD PTR _relformdest$[ebp], 0
	xor	eax, eax
	mov	DWORD PTR _relformdest$[ebp+4], eax
	mov	DWORD PTR _relformdest$[ebp+8], eax
	mov	DWORD PTR _relformdest$[ebp+12], eax
	mov	DWORD PTR _relformdest$[ebp+16], eax

; 863  : 	DynTable data = { 0 };

	mov	DWORD PTR _data$[ebp], 0
	xor	ecx, ecx
	mov	DWORD PTR _data$[ebp+4], ecx
	mov	DWORD PTR _data$[ebp+8], ecx
	mov	DWORD PTR _data$[ebp+12], ecx
	mov	DWORD PTR _data$[ebp+16], ecx

; 864  : 	DynBuffer *name = NULL;

	mov	DWORD PTR _name$[ebp], 0

; 865  : 	DynBuffer *sql = NULL;

	mov	DWORD PTR _sql$[ebp], 0

; 866  : 	int b_clear = DYNTAB_FIELD_CELL(&form->objdata, CLEAR_FORM) != NULL;

	push	0
	push	-1
	push	OFFSET FLAT:$SG71001
	mov	edx, DWORD PTR _form$[ebp]
	add	edx, 52					; 00000034H
	push	edx
	call	_dyntab_field_cell
	add	esp, 16					; 00000010H
	neg	eax
	sbb	eax, eax
	neg	eax
	mov	DWORD PTR _b_clear$[ebp], eax

; 867  : 	char *btn = CGI_CLICK_BTN_SUBFIELD;

	mov	eax, DWORD PTR _cntxt$[ebp]
	cmp	DWORD PTR [eax+29648], 0
	je	SHORT $L71128
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	edx, DWORD PTR [ecx+29656]
	imul	edx, 56					; 00000038H
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	ecx, DWORD PTR [eax+29648]
	mov	edx, DWORD PTR [ecx+edx]
	movsx	eax, BYTE PTR [edx]
	cmp	eax, 66					; 00000042H
	jne	SHORT $L71128
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	edx, DWORD PTR [ecx+29656]
	imul	edx, 56					; 00000038H
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	ecx, DWORD PTR [eax+29648]
	cmp	DWORD PTR [ecx+edx+32], 0
	je	SHORT $L71128
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	eax, DWORD PTR [edx+29656]
	imul	eax, 56					; 00000038H
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	edx, DWORD PTR [ecx+29648]
	mov	eax, DWORD PTR [edx+eax+32]
	mov	DWORD PTR -1232+[ebp], eax
	jmp	SHORT $L71129
$L71128:
	mov	DWORD PTR -1232+[ebp], OFFSET FLAT:$SG71003
$L71129:
	mov	ecx, DWORD PTR -1232+[ebp]
	mov	DWORD PTR _btn$[ebp], ecx

; 868  : 
; 869  : 	/* Read import basic parameters */
; 870  : 	if(form_get_field_values(cntxt, &file, "_EVA_FILE", 0, 0)) STACK_ERROR;

	push	0
	push	0
	push	OFFSET FLAT:$SG71005
	lea	edx, DWORD PTR _file$[ebp]
	push	edx
	mov	eax, DWORD PTR _cntxt$[ebp]
	push	eax
	call	_form_get_field_values
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L71004
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 870		; 00000366H
	jmp	$eva_err$71006
$L71004:

; 871  : 	DYNTAB_FIELD(&formdest, &form->objdata, FORM);

	lea	edx, DWORD PTR _formdest$[ebp]
	push	edx
	call	_dyntab_free
	add	esp, 4
	push	0
	push	-1
	push	OFFSET FLAT:$SG71009
	mov	eax, DWORD PTR _form$[ebp]
	add	eax, 52					; 00000034H
	push	eax
	push	0
	lea	ecx, DWORD PTR _formdest$[ebp]
	push	ecx
	call	_dyntab_filter_field
	add	esp, 24					; 00000018H
	test	eax, eax
	je	SHORT $L71008
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29872], OFFSET FLAT:$SG71011
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 871		; 00000367H
	jmp	$eva_err$71006
$L71008:

; 872  : 
; 873  : 	/* If flat file import */
; 874  : 	if(formdest.nbrows && file.nbrows)

	cmp	DWORD PTR _formdest$[ebp], 0
	je	$L71012
	cmp	DWORD PTR _file$[ebp], 0
	je	$L71012

; 876  : 		char *filename = dyntab_val(&file, 0, 0);

	push	0
	push	0
	lea	ecx, DWORD PTR _file$[ebp]
	push	ecx
	call	_dyntab_val
	add	esp, 12					; 0000000cH
	mov	DWORD PTR _filename$71013[ebp], eax

; 877  : 		put_html_page_header(cntxt, NULL, "Import de données", NULL, 3);

	push	3
	push	0
	push	OFFSET FLAT:$SG71016
	push	0
	mov	edx, DWORD PTR _cntxt$[ebp]
	push	edx
	call	_put_html_page_header
	add	esp, 20					; 00000014H

; 878  : 		printf("<font face=Arial><b>Import du fichier %s</b><br>", filename);

	mov	eax, DWORD PTR _filename$71013[ebp]
	push	eax
	push	OFFSET FLAT:$SG71017
	call	_printf
	add	esp, 8

; 879  : 		fflush(stdout);

	push	OFFSET FLAT:__iob+32
	call	_fflush
	add	esp, 4

; 880  : 		if(b_clear)

	cmp	DWORD PTR _b_clear$[ebp], 0
	je	$L71026

; 882  : 			/* Search existing objects with destination formstamp */
; 883  : 			char qry[1024];
; 884  : 			printf("Préparation à l'effacement des fiches ... %s", filename);

	mov	ecx, DWORD PTR _filename$71013[ebp]
	push	ecx
	push	OFFSET FLAT:$SG71020
	call	_printf
	add	esp, 8

; 885  : 			fflush(stdout);

	push	OFFSET FLAT:__iob+32
	call	_fflush
	add	esp, 4

; 886  : 			sprintf(qry,
; 887  : 				"SELECT DISTINCT IdObj FROM TLINK WHERE IdField=%lu AND IdRelObj=%s",
; 888  : 						cntxt->val_FORMSTAMP, dyntab_val(&formdest, 0, 0));

	push	0
	push	0
	lea	edx, DWORD PTR _formdest$[ebp]
	push	edx
	call	_dyntab_val
	add	esp, 12					; 0000000cH
	push	eax
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	ecx, DWORD PTR [eax+269636]
	push	ecx
	push	OFFSET FLAT:$SG71021
	lea	edx, DWORD PTR _qry$71019[ebp]
	push	edx
	call	_sprintf
	add	esp, 16					; 00000010H

; 889  : 			if(sql_exec_query(cntxt, qry)) STACK_ERROR;

	lea	eax, DWORD PTR _qry$71019[ebp]
	push	eax
	mov	ecx, DWORD PTR _cntxt$[ebp]
	push	ecx
	call	_sql_exec_query
	add	esp, 8
	test	eax, eax
	je	SHORT $L71022
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 889		; 00000379H
	jmp	$eva_err$71006
$L71022:

; 890  : 
; 891  : 			/* Ask for user confirmation if applicable */
; 892  : 			if(cntxt->sql_nbrows && strcmp(btn, "DELCONFIRM"))

	mov	eax, DWORD PTR _cntxt$[ebp]
	cmp	DWORD PTR [eax+29848], 0
	je	SHORT $L71023
	push	OFFSET FLAT:$SG71024
	mov	ecx, DWORD PTR _btn$[ebp]
	push	ecx
	call	_strcmp
	add	esp, 8
$L71023:

; 895  : 			printf(" %lu fiches trouvées<br>", cntxt->sql_nbrows);

	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	eax, DWORD PTR [edx+29848]
	push	eax
	push	OFFSET FLAT:$SG71025
	call	_printf
	add	esp, 8

; 896  : 			fflush(stdout);

	push	OFFSET FLAT:__iob+32
	call	_fflush
	add	esp, 4

; 897  : 
; 898  : 			/* Clear existing objects with destination formstamp */
; 899  : 			if(cntxt->sql_nbrows)

	mov	ecx, DWORD PTR _cntxt$[ebp]
	cmp	DWORD PTR [ecx+29848], 0
	je	$L71026

; 901  : 				printf(" Effacement ...");

	push	OFFSET FLAT:$SG71027
	call	_printf
	add	esp, 4

; 902  : 				fflush(stdout);

	push	OFFSET FLAT:__iob+32
	call	_fflush
	add	esp, 4

; 904  : 					"DELETE FROM TLink WHERE TLink.IdObj IN (");

	push	0
	push	0
	push	40					; 00000028H
	push	OFFSET FLAT:$SG71030
	lea	edx, DWORD PTR _sql$[ebp]
	push	edx
	call	_dynbuf_add
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L71029
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29872], OFFSET FLAT:$SG71032
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 904		; 00000388H
	jmp	$eva_err$71006
$L71029:

; 905  : 				if(sql_get_table(cntxt, &data, 2) || qry_values_list(cntxt, &data, 0, &sql)) STACK_ERROR;

	push	2
	lea	edx, DWORD PTR _data$[ebp]
	push	edx
	mov	eax, DWORD PTR _cntxt$[ebp]
	push	eax
	call	_sql_get_table
	add	esp, 12					; 0000000cH
	test	eax, eax
	jne	SHORT $L71034
	lea	ecx, DWORD PTR _sql$[ebp]
	push	ecx
	push	0
	lea	edx, DWORD PTR _data$[ebp]
	push	edx
	mov	eax, DWORD PTR _cntxt$[ebp]
	push	eax
	call	_qry_values_list
	add	esp, 16					; 00000010H
	test	eax, eax
	je	SHORT $L71033
$L71034:
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 905		; 00000389H
	jmp	$eva_err$71006
$L71033:

; 906  : 				DYNBUF_ADD_STR(&sql, ") OR TLink.IdRelObj IN (");

	push	0
	push	0
	push	24					; 00000018H
	push	OFFSET FLAT:$SG71037
	lea	edx, DWORD PTR _sql$[ebp]
	push	edx
	call	_dynbuf_add
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L71036
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29872], OFFSET FLAT:$SG71039
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 906		; 0000038aH
	jmp	$eva_err$71006
$L71036:

; 907  : 				if(qry_values_list(cntxt, &data, 0, &sql)) STACK_ERROR;

	lea	edx, DWORD PTR _sql$[ebp]
	push	edx
	push	0
	lea	eax, DWORD PTR _data$[ebp]
	push	eax
	mov	ecx, DWORD PTR _cntxt$[ebp]
	push	ecx
	call	_qry_values_list
	add	esp, 16					; 00000010H
	test	eax, eax
	je	SHORT $L71040
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 907		; 0000038bH
	jmp	$eva_err$71006
$L71040:

; 908  : 				DYNBUF_ADD_STR(&sql, ")");

	push	0
	push	0
	push	1
	push	OFFSET FLAT:$SG71043
	lea	eax, DWORD PTR _sql$[ebp]
	push	eax
	call	_dynbuf_add
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L71042
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29872], OFFSET FLAT:$SG71045
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 908		; 0000038cH
	jmp	$eva_err$71006
$L71042:

; 909  : 				if(sql_exec_query(cntxt, sql->data)) STACK_ERROR;

	mov	eax, DWORD PTR _sql$[ebp]
	add	eax, 8
	push	eax
	mov	ecx, DWORD PTR _cntxt$[ebp]
	push	ecx
	call	_sql_exec_query
	add	esp, 8
	test	eax, eax
	je	SHORT $L71046
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 909		; 0000038dH
	jmp	$eva_err$71006
$L71046:

; 910  : 				printf(" terminé<br>");

	push	OFFSET FLAT:$SG71047
	call	_printf
	add	esp, 4

; 911  : 				fflush(stdout);

	push	OFFSET FLAT:__iob+32
	call	_fflush
	add	esp, 4
$L71026:

; 914  : 
; 915  : 		/* Read import parameters */
; 916  : 		DYNTAB_FIELD(&multvalsep, &form->objdata, MULTIVAL_SEP);

	lea	eax, DWORD PTR _multvalsep$[ebp]
	push	eax
	call	_dyntab_free
	add	esp, 4
	push	0
	push	-1
	push	OFFSET FLAT:$SG71050
	mov	ecx, DWORD PTR _form$[ebp]
	add	ecx, 52					; 00000034H
	push	ecx
	push	0
	lea	edx, DWORD PTR _multvalsep$[ebp]
	push	edx
	call	_dyntab_filter_field
	add	esp, 24					; 00000018H
	test	eax, eax
	je	SHORT $L71049
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29872], OFFSET FLAT:$SG71052
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 916		; 00000394H
	jmp	$eva_err$71006
$L71049:

; 917  : 		DYNTAB_FIELD(&keyfields, &form->objdata, KEY_FIELDS);

	lea	edx, DWORD PTR _keyfields$[ebp]
	push	edx
	call	_dyntab_free
	add	esp, 4
	push	0
	push	-1
	push	OFFSET FLAT:$SG71055
	mov	eax, DWORD PTR _form$[ebp]
	add	eax, 52					; 00000034H
	push	eax
	push	0
	lea	ecx, DWORD PTR _keyfields$[ebp]
	push	ecx
	call	_dyntab_filter_field
	add	esp, 24					; 00000018H
	test	eax, eax
	je	SHORT $L71054
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29872], OFFSET FLAT:$SG71057
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 917		; 00000395H
	jmp	$eva_err$71006
$L71054:

; 918  : 		DYNTAB_FIELD_TAB(&reltype, &form->objdata, RELTYPE);

	lea	ecx, DWORD PTR _reltype$[ebp]
	push	ecx
	call	_dyntab_free
	add	esp, 4
	push	0
	push	-1
	push	OFFSET FLAT:$SG71061
	mov	edx, DWORD PTR _form$[ebp]
	add	edx, 52					; 00000034H
	push	edx
	push	0
	lea	eax, DWORD PTR _reltype$[ebp]
	push	eax
	call	_dyntab_filter_field
	add	esp, 24					; 00000018H
	test	eax, eax
	jne	SHORT $L71060
	lea	ecx, DWORD PTR _reltype$[ebp]
	push	ecx
	call	_dyntab_order_lines
	add	esp, 4
	test	eax, eax
	je	SHORT $L71059
$L71060:
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29872], OFFSET FLAT:$SG71063
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 918		; 00000396H
	jmp	$eva_err$71006
$L71059:

; 919  : 		DYNTAB_FIELD_TAB(&relfldsrc, &form->objdata, RELFIELD_SRC);

	lea	ecx, DWORD PTR _relfldsrc$[ebp]
	push	ecx
	call	_dyntab_free
	add	esp, 4
	push	0
	push	-1
	push	OFFSET FLAT:$SG71067
	mov	edx, DWORD PTR _form$[ebp]
	add	edx, 52					; 00000034H
	push	edx
	push	0
	lea	eax, DWORD PTR _relfldsrc$[ebp]
	push	eax
	call	_dyntab_filter_field
	add	esp, 24					; 00000018H
	test	eax, eax
	jne	SHORT $L71066
	lea	ecx, DWORD PTR _relfldsrc$[ebp]
	push	ecx
	call	_dyntab_order_lines
	add	esp, 4
	test	eax, eax
	je	SHORT $L71065
$L71066:
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29872], OFFSET FLAT:$SG71069
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 919		; 00000397H
	jmp	$eva_err$71006
$L71065:

; 920  : 		DYNTAB_FIELD_TAB(&relflddest, &form->objdata, RELFIELD_DEST);

	lea	ecx, DWORD PTR _relflddest$[ebp]
	push	ecx
	call	_dyntab_free
	add	esp, 4
	push	0
	push	-1
	push	OFFSET FLAT:$SG71073
	mov	edx, DWORD PTR _form$[ebp]
	add	edx, 52					; 00000034H
	push	edx
	push	0
	lea	eax, DWORD PTR _relflddest$[ebp]
	push	eax
	call	_dyntab_filter_field
	add	esp, 24					; 00000018H
	test	eax, eax
	jne	SHORT $L71072
	lea	ecx, DWORD PTR _relflddest$[ebp]
	push	ecx
	call	_dyntab_order_lines
	add	esp, 4
	test	eax, eax
	je	SHORT $L71071
$L71072:
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29872], OFFSET FLAT:$SG71075
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 920		; 00000398H
	jmp	$eva_err$71006
$L71071:

; 921  : 		DYNTAB_FIELD_TAB(&relformdest, &form->objdata, RELFORM);

	lea	ecx, DWORD PTR _relformdest$[ebp]
	push	ecx
	call	_dyntab_free
	add	esp, 4
	push	0
	push	-1
	push	OFFSET FLAT:$SG71079
	mov	edx, DWORD PTR _form$[ebp]
	add	edx, 52					; 00000034H
	push	edx
	push	0
	lea	eax, DWORD PTR _relformdest$[ebp]
	push	eax
	call	_dyntab_filter_field
	add	esp, 24					; 00000018H
	test	eax, eax
	jne	SHORT $L71078
	lea	ecx, DWORD PTR _relformdest$[ebp]
	push	ecx
	call	_dyntab_order_lines
	add	esp, 4
	test	eax, eax
	je	SHORT $L71077
$L71078:
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29872], OFFSET FLAT:$SG71081
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 921		; 00000399H
	jmp	$eva_err$71006
$L71077:

; 922  : 
; 923  : 		/* Read & import data */
; 924  : 		if(file_read_tabrc(cntxt, &data, filename) ||
; 925  : 			import_tabrc_file(cntxt, &data, &formdest, &keyfields, &multvalsep, &reltype, &relfldsrc, &relflddest, &relformdest))

	mov	ecx, DWORD PTR _filename$71013[ebp]
	push	ecx
	lea	edx, DWORD PTR _data$[ebp]
	push	edx
	mov	eax, DWORD PTR _cntxt$[ebp]
	push	eax
	call	_file_read_tabrc
	add	esp, 12					; 0000000cH
	test	eax, eax
	jne	SHORT $L71083
	lea	ecx, DWORD PTR _relformdest$[ebp]
	push	ecx
	lea	edx, DWORD PTR _relflddest$[ebp]
	push	edx
	lea	eax, DWORD PTR _relfldsrc$[ebp]
	push	eax
	lea	ecx, DWORD PTR _reltype$[ebp]
	push	ecx
	lea	edx, DWORD PTR _multvalsep$[ebp]
	push	edx
	lea	eax, DWORD PTR _keyfields$[ebp]
	push	eax
	lea	ecx, DWORD PTR _formdest$[ebp]
	push	ecx
	lea	edx, DWORD PTR _data$[ebp]
	push	edx
	mov	eax, DWORD PTR _cntxt$[ebp]
	push	eax
	call	_import_tabrc_file
	add	esp, 36					; 00000024H
	test	eax, eax
	je	SHORT $L71082
$L71083:

; 926  : 			STACK_ERROR;

	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 926		; 0000039eH
	jmp	SHORT $eva_err$71006
$L71082:

; 927  : 
; 928  : 		cntxt->b_terminate = 15;

	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29776], 15		; 0000000fH

; 930  : 	else

	jmp	SHORT $L71085
$L71012:

; 932  : 		/* Import EVA controls format file */
; 933  : 		if(import_objdata_file(cntxt, i_ctrl, &file)) STACK_ERROR;

	lea	eax, DWORD PTR _file$[ebp]
	push	eax
	mov	ecx, DWORD PTR _i_ctrl$[ebp]
	push	ecx
	mov	edx, DWORD PTR _cntxt$[ebp]
	push	edx
	call	_import_objdata_file
	add	esp, 12					; 0000000cH
	test	eax, eax
	je	SHORT $L71085
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 933		; 000003a5H
	jmp	SHORT $eva_err$71006
$L71085:
$eva_noerr$71086:

; 935  : 
; 936  : 	RETURN_OK_CLEANUP;

	push	0
	push	OFFSET FLAT:$SG71087
	push	OFFSET FLAT:$SG71088
	mov	ecx, DWORD PTR _cntxt$[ebp]
	push	ecx
	call	_err_clear
	add	esp, 16					; 00000010H
$eva_err$71006:
	mov	edx, DWORD PTR _cntxt$[ebp]
	cmp	DWORD PTR [edx+29872], 0
	je	SHORT $L71089
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	ecx, DWORD PTR [eax+29900]
	push	ecx
	push	OFFSET FLAT:$SG71090
	push	OFFSET FLAT:$SG71091
	mov	edx, DWORD PTR _cntxt$[ebp]
	push	edx
	call	_err_add_context
	add	esp, 16					; 00000010H
$L71089:
	lea	eax, DWORD PTR _file$[ebp]
	push	eax
	call	_dyntab_free
	add	esp, 4
	lea	ecx, DWORD PTR _formdest$[ebp]
	push	ecx
	call	_dyntab_free
	add	esp, 4
	lea	edx, DWORD PTR _keyfields$[ebp]
	push	edx
	call	_dyntab_free
	add	esp, 4
	lea	eax, DWORD PTR _multvalsep$[ebp]
	push	eax
	call	_dyntab_free
	add	esp, 4
	lea	ecx, DWORD PTR _reltype$[ebp]
	push	ecx
	call	_dyntab_free
	add	esp, 4
	lea	edx, DWORD PTR _relfldsrc$[ebp]
	push	edx
	call	_dyntab_free
	add	esp, 4
	lea	eax, DWORD PTR _relflddest$[ebp]
	push	eax
	call	_dyntab_free
	add	esp, 4
	lea	ecx, DWORD PTR _relformdest$[ebp]
	push	ecx
	call	_dyntab_free
	add	esp, 4
	lea	edx, DWORD PTR _data$[ebp]
	push	edx
	call	_dyntab_free
	add	esp, 4
	mov	eax, DWORD PTR _name$[ebp]
	push	eax
	call	_mem_free
	add	esp, 4
	mov	DWORD PTR _name$[ebp], 0
	mov	ecx, DWORD PTR _sql$[ebp]
	push	ecx
	call	_mem_free
	add	esp, 4
	mov	DWORD PTR _sql$[ebp], 0
	mov	edx, DWORD PTR _cntxt$[ebp]
	xor	eax, eax
	cmp	DWORD PTR [edx+29872], 0
	setne	al

; 937  : }

	mov	esp, ebp
	pop	ebp
	ret	0
_action_import ENDP
_TEXT	ENDS
END
