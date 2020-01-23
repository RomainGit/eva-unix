	TITLE	D:\Travail\ABI\EVA\V4.0\CGI\Brunix-2016\action_create.c
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
PUBLIC	_action_create_objects
EXTRN	_qry_obj_label:NEAR
EXTRN	_cgi_set_field_values:NEAR
EXTRN	_put_html_page_header:NEAR
EXTRN	_ctrl_eval_valtyp:NEAR
EXTRN	_input_to_number:NEAR
EXTRN	_printf:NEAR
EXTRN	__snprintf:NEAR
EXTRN	_sprintf:NEAR
EXTRN	_form_close_nosave:NEAR
EXTRN	_atoi:NEAR
EXTRN	_form_save_dialog:NEAR
EXTRN	_mem_free:NEAR
EXTRN	_strtoul:NEAR
EXTRN	_qry_obj_field:NEAR
EXTRN	_qry_listobj_field:NEAR
EXTRN	_qry_add_new_idobj:NEAR
EXTRN	_qry_update_idobj_idfield:NEAR
EXTRN	_qry_add_val:NEAR
EXTRN	_dyntab_free:NEAR
EXTRN	_dyntab_resize:NEAR
EXTRN	_dyntab_sz:NEAR
EXTRN	_dyntab_val:NEAR
EXTRN	_dyntab_cell:NEAR
EXTRN	_dyntab_copy:NEAR
EXTRN	_dyntab_add:NEAR
EXTRN	_strcmp:NEAR
EXTRN	_strlen:NEAR
EXTRN	_err_add_context:NEAR
EXTRN	_qry_build_free:NEAR
EXTRN	_dyntab_to_dynbuf:NEAR
EXTRN	_err_clear:NEAR
EXTRN	_qry_add_filter_simple_int:NEAR
EXTRN	_qry_add_filter:NEAR
EXTRN	_qry_add_filter_forms:NEAR
EXTRN	_dyntab_filter_field:NEAR
EXTRN	_qry_filter_objects:NEAR
EXTRN	_dyntab_field_val:NEAR
EXTRN	_dyntab_field_cell:NEAR
EXTRN	__chkstk:NEAR
EXTRN	_dyntab_order_lines:NEAR
EXTRN	_form_get_field_values:NEAR
_BSS	SEGMENT
$SG70229 DB	01H DUP (?)
	ALIGN	4

$SG70239 DB	01H DUP (?)
	ALIGN	4

$SG70242 DB	01H DUP (?)
	ALIGN	4

$SG70245 DB	01H DUP (?)
	ALIGN	4

$SG70249 DB	01H DUP (?)
	ALIGN	4

$SG70261 DB	01H DUP (?)
_BSS	ENDS
_DATA	SEGMENT
$SG70228 DB	'_EVA_CREATE_FORM', 00H
	ORG $+3
$SG70238 DB	'_EVA_CREATE_MODE', 00H
	ORG $+3
$SG70241 DB	'_EVA_DIALOG', 00H
$SG70244 DB	'_EVA_EXEC_AFTER', 00H
$SG70248 DB	'_EVA_LIMIT', 00H
	ORG $+1
$SG70253 DB	'_EVA_NEWOBJ_FIELD', 00H
	ORG $+2
$SG70256 DB	'_EVA_SRC_UPDATE', 00H
$SG70258 DB	'_EVA_VALUES_TABLE', 00H
	ORG $+2
$SG70260 DB	'_EVA_CONFIRM', 00H
	ORG $+3
$SG70263 DB	'_EVA_NOSAVE', 00H
$SG70272 DB	'_EVA_DESTFIELD', 00H
	ORG $+1
$SG70274 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70277 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70280 DB	'_EVA_DEST_RELMODE', 00H
	ORG $+2
$SG70282 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70285 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70288 DB	'_EVA_DEST_KEY', 00H
	ORG $+2
$SG70290 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70293 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70296 DB	'_EVA_SRCTYPE', 00H
	ORG $+3
$SG70298 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70301 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70304 DB	'_EVA_SRCLISTOBJ', 00H
$SG70306 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70309 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70312 DB	'_EVA_SRCFIELD', 00H
	ORG $+2
$SG70314 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70317 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70319 DB	'_EVA_RELATION', 00H
	ORG $+2
$SG70322 DB	'_EVA_SRCOBJ_INPUT', 00H
	ORG $+2
$SG70324 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70326 DB	'_EVA_FIELD', 00H
	ORG $+1
$SG70329 DB	',', 00H
	ORG $+2
$SG70330 DB	',', 00H
	ORG $+2
$SG70334 DB	'_EVA_CONDEXPR', 00H
	ORG $+2
$SG70337 DB	'_EVA_SELOBJ_FILTER', 00H
	ORG $+1
$SG70339 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70347 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70353 DB	'_EVA_VALUE', 00H
	ORG $+1
$SG70356 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70362 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70364 DB	'D:\Travail\ABI\EVA\V4.0\CGI\Brunix-2016\action_create.c', 00H
$SG70365 DB	'action_create_objects', 00H
	ORG $+2
$SG70373 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70382 DB	'%lu', 00H
$SG70386 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70389 DB	'%lu', 00H
$SG70393 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70394 DB	'_EVA_ALWAYS', 00H
$SG70395 DB	'_EVA_COUNT', 00H
	ORG $+1
$SG70400 DB	'<font face=Arial><hr><b>%s</b><hr>', 00H
	ORG $+1
$SG70418 DB	'D:\Travail\ABI\EVA\V4.0\CGI\Brunix-2016\action_create.c', 00H
$SG70419 DB	'action_create_objects', 00H
	ORG $+2
$SG70420 DB	'???', 00H
$SG70421 DB	'==&gt; <font color=#0000FF>%s</font><br>', 00H
	ORG $+3
$SG70438 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70442 DB	'_EVA_VALUE', 00H
	ORG $+1
$SG70444 DB	'_EVA_PROC_SELOBJ', 00H
	ORG $+3
$SG70446 DB	'%lu', 00H
$SG70450 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70451 DB	'_EVA_LISTOBJ', 00H
	ORG $+3
$SG70458 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70461 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70464 DB	'<font color=#FF0000>%s</font> : %s<br>', 00H
	ORG $+1
$SG70465 DB	'D:\Travail\ABI\EVA\V4.0\CGI\Brunix-2016\action_create.c', 00H
$SG70466 DB	'action_create_objects', 00H
	ORG $+2
$SG70478 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70481 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70486 DB	'<font color=#FFAA00>Pas de donn', 0e9H, 'es - fiche non '
	DB	'cr', 0e9H, 0e9H, 'e</font><br>', 00H
$SG70488 DB	'_EVA_FORMSTAMP', 00H
	ORG $+1
$SG70497 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70500 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70515 DB	'D:\Travail\ABI\EVA\V4.0\CGI\Brunix-2016\action_create.c', 00H
$SG70516 DB	'action_create_objects', 00H
	ORG $+2
$SG70517 DB	'???', 00H
$SG70518 DB	'<font color=#FFAA00>La fiche existe d', 0e9H, 'j', 0e0H, '<'
	DB	'/font> : %s<br>', 00H
	ORG $+3
$SG70529 DB	'%lu', 00H
$SG70533 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70544 DB	'D:\Travail\ABI\EVA\V4.0\CGI\Brunix-2016\action_create.c', 00H
$SG70545 DB	'action_create_objects', 00H
	ORG $+2
$SG70546 DB	'???', 00H
$SG70547 DB	'<font color=#00FF00>++++ Fiche cr', 0e9H, 0e9H, 'e</font'
	DB	'> : %s<br>', 00H
	ORG $+3
$SG70551 DB	'%lu', 00H
$SG70557 DB	'D:\Travail\ABI\EVA\V4.0\CGI\Brunix-2016\action_create.c', 00H
$SG70558 DB	'action_create_objects', 00H
	ORG $+2
$SG70561 DB	'_EVA_ADD', 00H
	ORG $+3
$SG70562 DB	'D:\Travail\ABI\EVA\V4.0\CGI\Brunix-2016\action_create.c', 00H
$SG70563 DB	'action_create_objects', 00H
	ORG $+2
$SG70565 DB	'<hr><br><center><input type=image name=''B$#NOP'' src='''
	DB	'../img/_eva_btn_gobackobj_fr.gif''></center><br>', 0aH, 00H
	ORG $+2
$SG70567 DB	'_EVA_NONE', 00H
	ORG $+2
$SG70572 DB	'D:\Travail\ABI\EVA\V4.0\CGI\Brunix-2016\action_create.c', 00H
$SG70573 DB	'action_create_objects', 00H
	ORG $+2
$SG70575 DB	'D:\Travail\ABI\EVA\V4.0\CGI\Brunix-2016\action_create.c', 00H
$SG70576 DB	'action_create_objects', 00H
_DATA	ENDS
_TEXT	SEGMENT
_cntxt$ = 8
_i_ctrl$ = 12
_form$ = -24
_ctrl$ = -4784
_srcobj$ = -284
_dstobj$ = -156
_dstfield$ = -200
_dstrelmod$ = -136
_dstkey$ = -68
_srcfield$ = -308
_srcvaltyp$ = -180
_srcvalobj$ = -48
_listobj$ = -20
_field$ = -116
_data$ = -96
_objdata$ = -264
_lineval$ = -224
_flt$ = -4768
_label$ = -244
_dstform$ = -4792
_idform$ = -240
_idobj$ = -28
_i$ = -204
_j$ = -236
_k$ = -288
_crmode$ = -76
_dialog$ = -4788
_after$ = -4772
_limit$ = -232
_b_msg$ = -4780
_newobjfield$ = -4776
_srcupdate$ = -160
_b_lineval$ = -72
_confirm$ = -312
_b_savetodb$ = -228
_b_done$70265 = -4796
_srctyp$70351 = -4800
_c$70369 = -4808
_c0$70370 = -4804
__tmp$70381 = -4840
__tmp$70388 = -4872
_idsrc$70404 = -4884
_iddest$70406 = -4876
_b_create$70407 = -4880
_fld$70425 = -4892
_valmode$70426 = -4896
_b_key$70427 = -4888
_c0$70429 = -4900
_c$70433 = -4908
_row$70434 = -4904
_srctyp$70440 = -4912
__tmp$70445 = -4944
_row$70470 = -4948
_c$70471 = -4952
_tmp$70473 = -4956
_c$70492 = -4960
_c$70523 = -4964
__tmp$70528 = -4996
_idrelobj$70549 = -5092
_val$70550 = -5060
_action_create_objects PROC NEAR

; 39   : ){

	push	ebp
	mov	ebp, esp
	mov	eax, 5156				; 00001424H
	call	__chkstk
	push	edi

; 40   : 	EVA_form *form = cntxt->form;

	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	ecx, DWORD PTR [eax+80]
	mov	DWORD PTR _form$[ebp], ecx

; 41   : 	EVA_ctrl *ctrl = form->ctrl + i_ctrl;

	mov	edx, DWORD PTR _i_ctrl$[ebp]
	imul	edx, 480				; 000001e0H
	mov	eax, DWORD PTR _form$[ebp]
	mov	ecx, DWORD PTR [eax]
	add	ecx, edx
	mov	DWORD PTR _ctrl$[ebp], ecx

; 42   : 	DynTable srcobj = {0};

	mov	DWORD PTR _srcobj$[ebp], 0
	xor	edx, edx
	mov	DWORD PTR _srcobj$[ebp+4], edx
	mov	DWORD PTR _srcobj$[ebp+8], edx
	mov	DWORD PTR _srcobj$[ebp+12], edx
	mov	DWORD PTR _srcobj$[ebp+16], edx

; 43   : 	DynTable dstobj = {0};

	mov	DWORD PTR _dstobj$[ebp], 0
	xor	eax, eax
	mov	DWORD PTR _dstobj$[ebp+4], eax
	mov	DWORD PTR _dstobj$[ebp+8], eax
	mov	DWORD PTR _dstobj$[ebp+12], eax
	mov	DWORD PTR _dstobj$[ebp+16], eax

; 44   : 	DynTable dstfield = {0};

	mov	DWORD PTR _dstfield$[ebp], 0
	xor	ecx, ecx
	mov	DWORD PTR _dstfield$[ebp+4], ecx
	mov	DWORD PTR _dstfield$[ebp+8], ecx
	mov	DWORD PTR _dstfield$[ebp+12], ecx
	mov	DWORD PTR _dstfield$[ebp+16], ecx

; 45   : 	DynTable dstrelmod = {0};

	mov	DWORD PTR _dstrelmod$[ebp], 0
	xor	edx, edx
	mov	DWORD PTR _dstrelmod$[ebp+4], edx
	mov	DWORD PTR _dstrelmod$[ebp+8], edx
	mov	DWORD PTR _dstrelmod$[ebp+12], edx
	mov	DWORD PTR _dstrelmod$[ebp+16], edx

; 46   : 	DynTable dstkey = {0};

	mov	DWORD PTR _dstkey$[ebp], 0
	xor	eax, eax
	mov	DWORD PTR _dstkey$[ebp+4], eax
	mov	DWORD PTR _dstkey$[ebp+8], eax
	mov	DWORD PTR _dstkey$[ebp+12], eax
	mov	DWORD PTR _dstkey$[ebp+16], eax

; 47   : 	DynTable srcfield = {0};

	mov	DWORD PTR _srcfield$[ebp], 0
	xor	ecx, ecx
	mov	DWORD PTR _srcfield$[ebp+4], ecx
	mov	DWORD PTR _srcfield$[ebp+8], ecx
	mov	DWORD PTR _srcfield$[ebp+12], ecx
	mov	DWORD PTR _srcfield$[ebp+16], ecx

; 48   : 	DynTable srcvaltyp = {0};

	mov	DWORD PTR _srcvaltyp$[ebp], 0
	xor	edx, edx
	mov	DWORD PTR _srcvaltyp$[ebp+4], edx
	mov	DWORD PTR _srcvaltyp$[ebp+8], edx
	mov	DWORD PTR _srcvaltyp$[ebp+12], edx
	mov	DWORD PTR _srcvaltyp$[ebp+16], edx

; 49   : 	DynTable srcvalobj = {0};

	mov	DWORD PTR _srcvalobj$[ebp], 0
	xor	eax, eax
	mov	DWORD PTR _srcvalobj$[ebp+4], eax
	mov	DWORD PTR _srcvalobj$[ebp+8], eax
	mov	DWORD PTR _srcvalobj$[ebp+12], eax
	mov	DWORD PTR _srcvalobj$[ebp+16], eax

; 50   : 	DynTable listobj = {0};

	mov	DWORD PTR _listobj$[ebp], 0
	xor	ecx, ecx
	mov	DWORD PTR _listobj$[ebp+4], ecx
	mov	DWORD PTR _listobj$[ebp+8], ecx
	mov	DWORD PTR _listobj$[ebp+12], ecx
	mov	DWORD PTR _listobj$[ebp+16], ecx

; 51   : 	DynTable field = {0};

	mov	DWORD PTR _field$[ebp], 0
	xor	edx, edx
	mov	DWORD PTR _field$[ebp+4], edx
	mov	DWORD PTR _field$[ebp+8], edx
	mov	DWORD PTR _field$[ebp+12], edx
	mov	DWORD PTR _field$[ebp+16], edx

; 52   : 	DynTable data = {0};

	mov	DWORD PTR _data$[ebp], 0
	xor	eax, eax
	mov	DWORD PTR _data$[ebp+4], eax
	mov	DWORD PTR _data$[ebp+8], eax
	mov	DWORD PTR _data$[ebp+12], eax
	mov	DWORD PTR _data$[ebp+16], eax

; 53   : 	DynTable objdata = {0};

	mov	DWORD PTR _objdata$[ebp], 0
	xor	ecx, ecx
	mov	DWORD PTR _objdata$[ebp+4], ecx
	mov	DWORD PTR _objdata$[ebp+8], ecx
	mov	DWORD PTR _objdata$[ebp+12], ecx
	mov	DWORD PTR _objdata$[ebp+16], ecx

; 54   : 	DynTable lineval = {0};

	mov	DWORD PTR _lineval$[ebp], 0
	xor	edx, edx
	mov	DWORD PTR _lineval$[ebp+4], edx
	mov	DWORD PTR _lineval$[ebp+8], edx
	mov	DWORD PTR _lineval$[ebp+12], edx
	mov	DWORD PTR _lineval$[ebp+16], edx

; 55   : 	QryBuild flt = {{0}};

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

; 56   : 	DynBuffer *label = NULL;

	mov	DWORD PTR _label$[ebp], 0

; 57   : 	unsigned long dstform = strtoul(CTRL_ATTR_VAL(CREATE_FORM), NULL, 10);

	cmp	DWORD PTR _ctrl$[ebp], 0
	je	SHORT $L70581
	push	0
	push	-1
	push	OFFSET FLAT:$SG70228
	mov	ecx, DWORD PTR _ctrl$[ebp]
	add	ecx, 44					; 0000002cH
	push	ecx
	call	_dyntab_field_val
	add	esp, 16					; 00000010H
	mov	DWORD PTR -5096+[ebp], eax
	jmp	SHORT $L70582
$L70581:
	mov	DWORD PTR -5096+[ebp], OFFSET FLAT:$SG70229
$L70582:
	push	10					; 0000000aH
	push	0
	mov	edx, DWORD PTR -5096+[ebp]
	push	edx
	call	_strtoul
	add	esp, 12					; 0000000cH
	mov	DWORD PTR _dstform$[ebp], eax

; 58   : 	unsigned long idform = DYNTAB_TOUL(&form->id_form);

	push	10					; 0000000aH
	push	0
	push	0
	push	0
	mov	eax, DWORD PTR _form$[ebp]
	add	eax, 12					; 0000000cH
	push	eax
	call	_dyntab_val
	add	esp, 12					; 0000000cH
	push	eax
	call	_strtoul
	add	esp, 12					; 0000000cH
	mov	DWORD PTR _idform$[ebp], eax

; 59   : 	unsigned long idobj = DYNTAB_TOUL(&form->id_obj);

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
	mov	DWORD PTR _idobj$[ebp], eax

; 60   : 	unsigned long i, j, k;
; 61   : 	char *crmode = CTRL_ATTR_VAL(CREATE_MODE);

	cmp	DWORD PTR _ctrl$[ebp], 0
	je	SHORT $L70583
	push	0
	push	-1
	push	OFFSET FLAT:$SG70238
	mov	edx, DWORD PTR _ctrl$[ebp]
	add	edx, 44					; 0000002cH
	push	edx
	call	_dyntab_field_val
	add	esp, 16					; 00000010H
	mov	DWORD PTR -5100+[ebp], eax
	jmp	SHORT $L70584
$L70583:
	mov	DWORD PTR -5100+[ebp], OFFSET FLAT:$SG70239
$L70584:
	mov	eax, DWORD PTR -5100+[ebp]
	mov	DWORD PTR _crmode$[ebp], eax

; 62   : 	char *dialog = CTRL_ATTR_VAL(DIALOG);

	cmp	DWORD PTR _ctrl$[ebp], 0
	je	SHORT $L70585
	push	0
	push	-1
	push	OFFSET FLAT:$SG70241
	mov	ecx, DWORD PTR _ctrl$[ebp]
	add	ecx, 44					; 0000002cH
	push	ecx
	call	_dyntab_field_val
	add	esp, 16					; 00000010H
	mov	DWORD PTR -5104+[ebp], eax
	jmp	SHORT $L70586
$L70585:
	mov	DWORD PTR -5104+[ebp], OFFSET FLAT:$SG70242
$L70586:
	mov	edx, DWORD PTR -5104+[ebp]
	mov	DWORD PTR _dialog$[ebp], edx

; 63   : 	char *after = CTRL_ATTR_VAL(EXEC_AFTER);

	cmp	DWORD PTR _ctrl$[ebp], 0
	je	SHORT $L70587
	push	0
	push	-1
	push	OFFSET FLAT:$SG70244
	mov	eax, DWORD PTR _ctrl$[ebp]
	add	eax, 44					; 0000002cH
	push	eax
	call	_dyntab_field_val
	add	esp, 16					; 00000010H
	mov	DWORD PTR -5108+[ebp], eax
	jmp	SHORT $L70588
$L70587:
	mov	DWORD PTR -5108+[ebp], OFFSET FLAT:$SG70245
$L70588:
	mov	ecx, DWORD PTR -5108+[ebp]
	mov	DWORD PTR _after$[ebp], ecx

; 64   : 	unsigned long limit = strtoul(CTRL_ATTR_VAL(LIMIT), NULL, 10);

	cmp	DWORD PTR _ctrl$[ebp], 0
	je	SHORT $L70589
	push	0
	push	-1
	push	OFFSET FLAT:$SG70248
	mov	edx, DWORD PTR _ctrl$[ebp]
	add	edx, 44					; 0000002cH
	push	edx
	call	_dyntab_field_val
	add	esp, 16					; 00000010H
	mov	DWORD PTR -5112+[ebp], eax
	jmp	SHORT $L70590
$L70589:
	mov	DWORD PTR -5112+[ebp], OFFSET FLAT:$SG70249
$L70590:
	push	10					; 0000000aH
	push	0
	mov	eax, DWORD PTR -5112+[ebp]
	push	eax
	call	_strtoul
	add	esp, 12					; 0000000cH
	mov	DWORD PTR _limit$[ebp], eax

; 65   : 	int b_msg;
; 66   : 	DynTableCell *newobjfield = CTRL_ATTR_CELL(NEWOBJ_FIELD);

	cmp	DWORD PTR _ctrl$[ebp], 0
	je	SHORT $L70591
	push	0
	push	-1
	push	OFFSET FLAT:$SG70253
	mov	ecx, DWORD PTR _ctrl$[ebp]
	add	ecx, 44					; 0000002cH
	push	ecx
	call	_dyntab_field_cell
	add	esp, 16					; 00000010H
	mov	DWORD PTR -5116+[ebp], eax
	jmp	SHORT $L70592
$L70591:
	mov	DWORD PTR -5116+[ebp], 0
$L70592:
	mov	edx, DWORD PTR -5116+[ebp]
	mov	DWORD PTR _newobjfield$[ebp], edx

; 67   : 	DynTableCell *srcupdate = CTRL_ATTR_CELL(SRC_UPDATE);

	cmp	DWORD PTR _ctrl$[ebp], 0
	je	SHORT $L70593
	push	0
	push	-1
	push	OFFSET FLAT:$SG70256
	mov	eax, DWORD PTR _ctrl$[ebp]
	add	eax, 44					; 0000002cH
	push	eax
	call	_dyntab_field_cell
	add	esp, 16					; 00000010H
	mov	DWORD PTR -5120+[ebp], eax
	jmp	SHORT $L70594
$L70593:
	mov	DWORD PTR -5120+[ebp], 0
$L70594:
	mov	ecx, DWORD PTR -5120+[ebp]
	mov	DWORD PTR _srcupdate$[ebp], ecx

; 68   : 	int b_lineval = !strcmp(crmode, "_EVA_VALUES_TABLE");

	push	OFFSET FLAT:$SG70258
	mov	edx, DWORD PTR _crmode$[ebp]
	push	edx
	call	_strcmp
	add	esp, 8
	neg	eax
	sbb	eax, eax
	inc	eax
	mov	DWORD PTR _b_lineval$[ebp], eax

; 69   : 	char *confirm = CTRL_ATTR_VAL(CONFIRM);

	cmp	DWORD PTR _ctrl$[ebp], 0
	je	SHORT $L70595
	push	0
	push	-1
	push	OFFSET FLAT:$SG70260
	mov	eax, DWORD PTR _ctrl$[ebp]
	add	eax, 44					; 0000002cH
	push	eax
	call	_dyntab_field_val
	add	esp, 16					; 00000010H
	mov	DWORD PTR -5124+[ebp], eax
	jmp	SHORT $L70596
$L70595:
	mov	DWORD PTR -5124+[ebp], OFFSET FLAT:$SG70261
$L70596:
	mov	ecx, DWORD PTR -5124+[ebp]
	mov	DWORD PTR _confirm$[ebp], ecx

; 70   : 	int b_savetodb = *confirm && strcmp(confirm, "_EVA_NOSAVE");

	mov	edx, DWORD PTR _confirm$[ebp]
	movsx	eax, BYTE PTR [edx]
	test	eax, eax
	je	SHORT $L70597
	push	OFFSET FLAT:$SG70263
	mov	ecx, DWORD PTR _confirm$[ebp]
	push	ecx
	call	_strcmp
	add	esp, 8
	test	eax, eax
	je	SHORT $L70597
	mov	DWORD PTR -5128+[ebp], 1
	jmp	SHORT $L70598
$L70597:
	mov	DWORD PTR -5128+[ebp], 0
$L70598:
	mov	edx, DWORD PTR -5128+[ebp]
	mov	DWORD PTR _b_savetodb$[ebp], edx

; 71   : 
; 72   : 	/* Handle save before */
; 73   : 	if(b_savetodb)

	cmp	DWORD PTR _b_savetodb$[ebp], 0
	je	SHORT $L70268

; 75   : 		int b_done = BUTN_SAVE_NEXT;

	mov	DWORD PTR _b_done$70265[ebp], 1

; 76   : 		if(form_save_dialog(cntxt, i_ctrl, confirm, BUTN_SAVE_NEXT, &b_done)) STACK_ERROR;

	lea	eax, DWORD PTR _b_done$70265[ebp]
	push	eax
	push	1
	mov	ecx, DWORD PTR _confirm$[ebp]
	push	ecx
	mov	edx, DWORD PTR _i_ctrl$[ebp]
	push	edx
	mov	eax, DWORD PTR _cntxt$[ebp]
	push	eax
	call	_form_save_dialog
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L70266
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 76		; 0000004cH
	jmp	$eva_err$70267
$L70266:

; 77   : 		if(b_done != BUTN_SAVE_NEXT) RETURN_OK;

	cmp	DWORD PTR _b_done$70265[ebp], 1
	je	SHORT $L70268
	jmp	$eva_noerr$70269
$L70268:

; 79   : 
; 80   : 	/* Read created values definition */
; 81   : 	CTRL_ATTR_TAB(dstfield, DESTFIELD);

	lea	edx, DWORD PTR _dstfield$[ebp]
	push	edx
	call	_dyntab_free
	add	esp, 4
	push	0
	push	-1
	push	OFFSET FLAT:$SG70272
	mov	eax, DWORD PTR _ctrl$[ebp]
	add	eax, 44					; 0000002cH
	push	eax
	push	0
	lea	ecx, DWORD PTR _dstfield$[ebp]
	push	ecx
	call	_dyntab_filter_field
	add	esp, 24					; 00000018H
	test	eax, eax
	je	SHORT $L70271
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29872], OFFSET FLAT:$SG70274
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 81		; 00000051H
	jmp	$eva_err$70267
$L70271:
	lea	ecx, DWORD PTR _dstfield$[ebp]
	push	ecx
	call	_dyntab_order_lines
	add	esp, 4
	test	eax, eax
	je	SHORT $L70275
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29872], OFFSET FLAT:$SG70277
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 81		; 00000051H
	jmp	$eva_err$70267
$L70275:

; 82   : 	CTRL_ATTR_TAB(dstrelmod, DEST_RELMODE);

	lea	ecx, DWORD PTR _dstrelmod$[ebp]
	push	ecx
	call	_dyntab_free
	add	esp, 4
	push	0
	push	-1
	push	OFFSET FLAT:$SG70280
	mov	edx, DWORD PTR _ctrl$[ebp]
	add	edx, 44					; 0000002cH
	push	edx
	push	0
	lea	eax, DWORD PTR _dstrelmod$[ebp]
	push	eax
	call	_dyntab_filter_field
	add	esp, 24					; 00000018H
	test	eax, eax
	je	SHORT $L70279
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29872], OFFSET FLAT:$SG70282
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 82		; 00000052H
	jmp	$eva_err$70267
$L70279:
	lea	eax, DWORD PTR _dstrelmod$[ebp]
	push	eax
	call	_dyntab_order_lines
	add	esp, 4
	test	eax, eax
	je	SHORT $L70283
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29872], OFFSET FLAT:$SG70285
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 82		; 00000052H
	jmp	$eva_err$70267
$L70283:

; 83   : 	CTRL_ATTR_TAB(dstkey, DEST_KEY);

	lea	eax, DWORD PTR _dstkey$[ebp]
	push	eax
	call	_dyntab_free
	add	esp, 4
	push	0
	push	-1
	push	OFFSET FLAT:$SG70288
	mov	ecx, DWORD PTR _ctrl$[ebp]
	add	ecx, 44					; 0000002cH
	push	ecx
	push	0
	lea	edx, DWORD PTR _dstkey$[ebp]
	push	edx
	call	_dyntab_filter_field
	add	esp, 24					; 00000018H
	test	eax, eax
	je	SHORT $L70287
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29872], OFFSET FLAT:$SG70290
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 83		; 00000053H
	jmp	$eva_err$70267
$L70287:
	lea	edx, DWORD PTR _dstkey$[ebp]
	push	edx
	call	_dyntab_order_lines
	add	esp, 4
	test	eax, eax
	je	SHORT $L70291
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29872], OFFSET FLAT:$SG70293
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 83		; 00000053H
	jmp	$eva_err$70267
$L70291:

; 84   : 	CTRL_ATTR_TAB(srcvaltyp, SRCTYPE);

	lea	edx, DWORD PTR _srcvaltyp$[ebp]
	push	edx
	call	_dyntab_free
	add	esp, 4
	push	0
	push	-1
	push	OFFSET FLAT:$SG70296
	mov	eax, DWORD PTR _ctrl$[ebp]
	add	eax, 44					; 0000002cH
	push	eax
	push	0
	lea	ecx, DWORD PTR _srcvaltyp$[ebp]
	push	ecx
	call	_dyntab_filter_field
	add	esp, 24					; 00000018H
	test	eax, eax
	je	SHORT $L70295
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29872], OFFSET FLAT:$SG70298
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 84		; 00000054H
	jmp	$eva_err$70267
$L70295:
	lea	ecx, DWORD PTR _srcvaltyp$[ebp]
	push	ecx
	call	_dyntab_order_lines
	add	esp, 4
	test	eax, eax
	je	SHORT $L70299
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29872], OFFSET FLAT:$SG70301
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 84		; 00000054H
	jmp	$eva_err$70267
$L70299:

; 85   : 	CTRL_ATTR_TAB(srcvalobj, SRCLISTOBJ);

	lea	ecx, DWORD PTR _srcvalobj$[ebp]
	push	ecx
	call	_dyntab_free
	add	esp, 4
	push	0
	push	-1
	push	OFFSET FLAT:$SG70304
	mov	edx, DWORD PTR _ctrl$[ebp]
	add	edx, 44					; 0000002cH
	push	edx
	push	0
	lea	eax, DWORD PTR _srcvalobj$[ebp]
	push	eax
	call	_dyntab_filter_field
	add	esp, 24					; 00000018H
	test	eax, eax
	je	SHORT $L70303
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29872], OFFSET FLAT:$SG70306
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 85		; 00000055H
	jmp	$eva_err$70267
$L70303:
	lea	eax, DWORD PTR _srcvalobj$[ebp]
	push	eax
	call	_dyntab_order_lines
	add	esp, 4
	test	eax, eax
	je	SHORT $L70307
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29872], OFFSET FLAT:$SG70309
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 85		; 00000055H
	jmp	$eva_err$70267
$L70307:

; 86   : 	CTRL_ATTR_TAB(srcfield, SRCFIELD);

	lea	eax, DWORD PTR _srcfield$[ebp]
	push	eax
	call	_dyntab_free
	add	esp, 4
	push	0
	push	-1
	push	OFFSET FLAT:$SG70312
	mov	ecx, DWORD PTR _ctrl$[ebp]
	add	ecx, 44					; 0000002cH
	push	ecx
	push	0
	lea	edx, DWORD PTR _srcfield$[ebp]
	push	edx
	call	_dyntab_filter_field
	add	esp, 24					; 00000018H
	test	eax, eax
	je	SHORT $L70311
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29872], OFFSET FLAT:$SG70314
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 86		; 00000056H
	jmp	$eva_err$70267
$L70311:
	lea	edx, DWORD PTR _srcfield$[ebp]
	push	edx
	call	_dyntab_order_lines
	add	esp, 4
	test	eax, eax
	je	SHORT $L70315
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29872], OFFSET FLAT:$SG70317
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 86		; 00000056H
	jmp	$eva_err$70267
$L70315:

; 87   : 
; 88   : 
; 89   : 	/* Handle create method */
; 90   : 	if(!strcmp(crmode, "_EVA_RELATION"))

	push	OFFSET FLAT:$SG70319
	mov	edx, DWORD PTR _crmode$[ebp]
	push	edx
	call	_strcmp
	add	esp, 8
	test	eax, eax
	jne	$L70318

; 92   : 		/* Create one object per object in given relation controls */
; 93   : 		CTRL_ATTR(srcobj, SRCOBJ_INPUT);

	lea	eax, DWORD PTR _srcobj$[ebp]
	push	eax
	call	_dyntab_free
	add	esp, 4
	push	0
	push	-1
	push	OFFSET FLAT:$SG70322
	mov	ecx, DWORD PTR _ctrl$[ebp]
	add	ecx, 44					; 0000002cH
	push	ecx
	push	0
	lea	edx, DWORD PTR _srcobj$[ebp]
	push	edx
	call	_dyntab_filter_field
	add	esp, 24					; 00000018H
	test	eax, eax
	je	SHORT $L70321
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29872], OFFSET FLAT:$SG70324
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 93		; 0000005dH
	jmp	$eva_err$70267
$L70321:

; 94   : 
; 95   : 		/* Read control values on current object */
; 96   : 		if(qry_listobj_field(cntxt, &data, &srcobj, "_EVA_FIELD")) STACK_ERROR;

	push	OFFSET FLAT:$SG70326
	lea	edx, DWORD PTR _srcobj$[ebp]
	push	edx
	lea	eax, DWORD PTR _data$[ebp]
	push	eax
	mov	ecx, DWORD PTR _cntxt$[ebp]
	push	ecx
	call	_qry_listobj_field
	add	esp, 16					; 00000010H
	test	eax, eax
	je	SHORT $L70325
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 96		; 00000060H
	jmp	$eva_err$70267
$L70325:

; 97   : 		if(dyntab_to_dynbuf(&data, &label, ",", 1, ",", 1, NO_CONV)) STACK_ERROR;

	push	0
	push	0
	push	1
	push	OFFSET FLAT:$SG70329
	push	1
	push	OFFSET FLAT:$SG70330
	lea	eax, DWORD PTR _label$[ebp]
	push	eax
	lea	ecx, DWORD PTR _data$[ebp]
	push	ecx
	call	_dyntab_to_dynbuf
	add	esp, 32					; 00000020H
	test	eax, eax
	je	SHORT $L70328
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 97		; 00000061H
	jmp	$eva_err$70267
$L70328:

; 98   : 		if(label && form_get_field_values(cntxt, &srcobj, label->data, idform, idobj)) STACK_ERROR;

	cmp	DWORD PTR _label$[ebp], 0
	je	SHORT $L70331
	mov	eax, DWORD PTR _idobj$[ebp]
	push	eax
	mov	ecx, DWORD PTR _idform$[ebp]
	push	ecx
	mov	edx, DWORD PTR _label$[ebp]
	add	edx, 8
	push	edx
	lea	eax, DWORD PTR _srcobj$[ebp]
	push	eax
	mov	ecx, DWORD PTR _cntxt$[ebp]
	push	ecx
	call	_form_get_field_values
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L70331
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 98		; 00000062H
	jmp	$eva_err$70267
$L70331:

; 99   : 		M_FREE(label);

	mov	eax, DWORD PTR _label$[ebp]
	push	eax
	call	_mem_free
	add	esp, 4
	mov	DWORD PTR _label$[ebp], 0

; 101  : 	else if(!strcmp(crmode, "_EVA_CONDEXPR"))

	jmp	$L70391
$L70318:
	push	OFFSET FLAT:$SG70334
	mov	ecx, DWORD PTR _crmode$[ebp]
	push	ecx
	call	_strcmp
	add	esp, 8
	test	eax, eax
	jne	$L70333

; 103  : 		/* Create one object per object matching given filter */
; 104  : 		/* Evaluate filter */
; 105  : 		CTRL_ATTR(data, SELOBJ_FILTER);

	lea	edx, DWORD PTR _data$[ebp]
	push	edx
	call	_dyntab_free
	add	esp, 4
	push	0
	push	-1
	push	OFFSET FLAT:$SG70337
	mov	eax, DWORD PTR _ctrl$[ebp]
	add	eax, 44					; 0000002cH
	push	eax
	push	0
	lea	ecx, DWORD PTR _data$[ebp]
	push	ecx
	call	_dyntab_filter_field
	add	esp, 24					; 00000018H
	test	eax, eax
	je	SHORT $L70336
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29872], OFFSET FLAT:$SG70339
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 105		; 00000069H
	jmp	$eva_err$70267
$L70336:

; 106  : 		if(qry_add_filter_forms(cntxt, &flt, NULL, &data)) STACK_ERROR;

	lea	ecx, DWORD PTR _data$[ebp]
	push	ecx
	push	0
	lea	edx, DWORD PTR _flt$[ebp]
	push	edx
	mov	eax, DWORD PTR _cntxt$[ebp]
	push	eax
	call	_qry_add_filter_forms
	add	esp, 16					; 00000010H
	test	eax, eax
	je	SHORT $L70341
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 106		; 0000006aH
	jmp	$eva_err$70267
$L70341:

; 107  : 		if(qry_filter_objects(cntxt, &srcobj, &flt)) STACK_ERROR;

	lea	edx, DWORD PTR _flt$[ebp]
	push	edx
	lea	eax, DWORD PTR _srcobj$[ebp]
	push	eax
	mov	ecx, DWORD PTR _cntxt$[ebp]
	push	ecx
	call	_qry_filter_objects
	add	esp, 12					; 0000000cH
	test	eax, eax
	je	SHORT $L70342
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 107		; 0000006bH
	jmp	$eva_err$70267
$L70342:

; 109  : 	else if(b_lineval)

	jmp	$L70391
$L70333:
	cmp	DWORD PTR _b_lineval$[ebp], 0
	je	$L70344

; 111  : 		/* Create one object per line of destination values */
; 112  : 		if(dyntab_resize(&lineval, 1, dstfield.nbrows)) RETURN_ERR_MEMORY;

	mov	eax, DWORD PTR _dstfield$[ebp]
	push	eax
	push	1
	lea	ecx, DWORD PTR _lineval$[ebp]
	push	ecx
	call	_dyntab_resize
	add	esp, 12					; 0000000cH
	test	eax, eax
	je	SHORT $L70345
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29872], OFFSET FLAT:$SG70347
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 112		; 00000070H
	jmp	$eva_err$70267
$L70345:

; 113  : 
; 114  : 		/* Compute values for each field */
; 115  : 		for(i = 0; i < dstfield.nbrows; i++)

	mov	DWORD PTR _i$[ebp], 0
	jmp	SHORT $L70348
$L70349:
	mov	ecx, DWORD PTR _i$[ebp]
	add	ecx, 1
	mov	DWORD PTR _i$[ebp], ecx
$L70348:
	mov	edx, DWORD PTR _i$[ebp]
	cmp	edx, DWORD PTR _dstfield$[ebp]
	jae	$L70350

; 117  : 			/* Transfer value definition */
; 118  : 			char *srctyp = dyntab_val(&srcvaltyp, i, 0);

	push	0
	mov	eax, DWORD PTR _i$[ebp]
	push	eax
	lea	ecx, DWORD PTR _srcvaltyp$[ebp]
	push	ecx
	call	_dyntab_val
	add	esp, 12					; 0000000cH
	mov	DWORD PTR _srctyp$70351[ebp], eax

; 119  : 			if(!*srctyp) srctyp = "_EVA_VALUE";

	mov	edx, DWORD PTR _srctyp$70351[ebp]
	movsx	eax, BYTE PTR [edx]
	test	eax, eax
	jne	SHORT $L70352
	mov	DWORD PTR _srctyp$70351[ebp], OFFSET FLAT:$SG70353
$L70352:

; 120  : 			DYNTAB_SET_CELL(&field, 0, 0, &srcfield, i, 0);

	push	0
	push	0
	mov	ecx, DWORD PTR _i$[ebp]
	push	ecx
	lea	edx, DWORD PTR _srcfield$[ebp]
	push	edx
	call	_dyntab_cell
	add	esp, 12					; 0000000cH
	push	eax
	push	0
	push	0
	lea	eax, DWORD PTR _field$[ebp]
	push	eax
	call	_dyntab_copy
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L70354
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29872], OFFSET FLAT:$SG70356
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 120		; 00000078H
	jmp	$eva_err$70267
$L70354:

; 121  : 			field.cell->Line = 0;

	mov	eax, DWORD PTR _field$[ebp+16]
	mov	DWORD PTR [eax+40], 0

; 122  : 			dyntab_free(&listobj);

	lea	ecx, DWORD PTR _listobj$[ebp]
	push	ecx
	call	_dyntab_free
	add	esp, 4

; 123  : 			for(k = 0; k < srcvalobj.nbcols && dyntab_sz(&srcvalobj, i, k); k++)

	mov	DWORD PTR _k$[ebp], 0
	jmp	SHORT $L70357
$L70358:
	mov	edx, DWORD PTR _k$[ebp]
	add	edx, 1
	mov	DWORD PTR _k$[ebp], edx
$L70357:
	mov	eax, DWORD PTR _k$[ebp]
	cmp	eax, DWORD PTR _srcvalobj$[ebp+8]
	jae	SHORT $L70359
	mov	ecx, DWORD PTR _k$[ebp]
	push	ecx
	mov	edx, DWORD PTR _i$[ebp]
	push	edx
	lea	eax, DWORD PTR _srcvalobj$[ebp]
	push	eax
	call	_dyntab_sz
	add	esp, 12					; 0000000cH
	test	eax, eax
	je	SHORT $L70359

; 124  : 				DYNTAB_SET_CELL(&listobj, k, 0, &srcvalobj, i, k);

	push	0
	mov	ecx, DWORD PTR _k$[ebp]
	push	ecx
	mov	edx, DWORD PTR _i$[ebp]
	push	edx
	lea	eax, DWORD PTR _srcvalobj$[ebp]
	push	eax
	call	_dyntab_cell
	add	esp, 12					; 0000000cH
	push	eax
	push	0
	mov	ecx, DWORD PTR _k$[ebp]
	push	ecx
	lea	edx, DWORD PTR _listobj$[ebp]
	push	edx
	call	_dyntab_copy
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L70360
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29872], OFFSET FLAT:$SG70362
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 124		; 0000007cH
	jmp	$eva_err$70267
$L70360:
	jmp	$L70358
$L70359:

; 125  : 
; 126  : 			/* Evaluate value - abort objects creation on error */
; 127  : 			if(ctrl_eval_valtyp(cntxt, ctrl, &data, srctyp, &listobj, &field))

	lea	edx, DWORD PTR _field$[ebp]
	push	edx
	lea	eax, DWORD PTR _listobj$[ebp]
	push	eax
	mov	ecx, DWORD PTR _srctyp$70351[ebp]
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
	je	SHORT $L70363

; 129  : 				CLEAR_ERROR;

	push	129					; 00000081H
	push	OFFSET FLAT:$SG70364
	push	OFFSET FLAT:$SG70365
	mov	edx, DWORD PTR _cntxt$[ebp]
	push	edx
	call	_err_clear
	add	esp, 16					; 00000010H

; 130  : 				RETURN_OK;

	jmp	$eva_noerr$70269
$L70363:

; 132  : 
; 133  : 			/* Store result in one column of temp table & count lines */
; 134  : 			for(j = 0; j < data.nbrows; j++)

	mov	DWORD PTR _j$[ebp], 0
	jmp	SHORT $L70366
$L70367:
	mov	eax, DWORD PTR _j$[ebp]
	add	eax, 1
	mov	DWORD PTR _j$[ebp], eax
$L70366:
	mov	ecx, DWORD PTR _j$[ebp]
	cmp	ecx, DWORD PTR _data$[ebp]
	jae	$L70368

; 136  : 				DynTableCell *c = dyntab_cell(&data, j, 0), *c0;

	push	0
	mov	edx, DWORD PTR _j$[ebp]
	push	edx
	lea	eax, DWORD PTR _data$[ebp]
	push	eax
	call	_dyntab_cell
	add	esp, 12					; 0000000cH
	mov	DWORD PTR _c$70369[ebp], eax

; 137  : 				DYNTAB_ADD_CELLP(&lineval, j, i, c);

	push	1
	mov	ecx, DWORD PTR _c$70369[ebp]
	push	ecx
	mov	edx, DWORD PTR _i$[ebp]
	push	edx
	mov	eax, DWORD PTR _j$[ebp]
	push	eax
	lea	ecx, DWORD PTR _lineval$[ebp]
	push	ecx
	call	_dyntab_copy
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L70371
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29872], OFFSET FLAT:$SG70373
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 137		; 00000089H
	jmp	$eva_err$70267
$L70371:

; 138  : 				c0 = dyntab_cell(&lineval, 0, i);

	mov	ecx, DWORD PTR _i$[ebp]
	push	ecx
	push	0
	lea	edx, DWORD PTR _lineval$[ebp]
	push	edx
	call	_dyntab_cell
	add	esp, 12					; 0000000cH
	mov	DWORD PTR _c0$70370[ebp], eax

; 139  : 				if(!j) c0->row = data.nbrows;

	cmp	DWORD PTR _j$[ebp], 0
	jne	SHORT $L70374
	mov	eax, DWORD PTR _c0$70370[ebp]
	mov	ecx, DWORD PTR _data$[ebp]
	mov	DWORD PTR [eax+60], ecx
$L70374:

; 140  : 				c0->col |= c->Line ? 2 : 1;

	mov	edx, DWORD PTR _c$70369[ebp]
	xor	eax, eax
	cmp	DWORD PTR [edx+40], 0
	setne	al
	inc	eax
	mov	ecx, DWORD PTR _c0$70370[ebp]
	mov	edx, DWORD PTR [ecx+56]
	or	edx, eax
	mov	eax, DWORD PTR _c0$70370[ebp]
	mov	DWORD PTR [eax+56], edx

; 141  : 				if(!c->Line) continue;

	mov	ecx, DWORD PTR _c$70369[ebp]
	cmp	DWORD PTR [ecx+40], 0
	jne	SHORT $L70375
	jmp	$L70367
$L70375:

; 142  : 				for(k = 0; k < srcobj.nbrows && DYNTAB_TOULRC(&srcobj, k, 0) != c->Line; k++);

	mov	DWORD PTR _k$[ebp], 0
	jmp	SHORT $L70377
$L70378:
	mov	edx, DWORD PTR _k$[ebp]
	add	edx, 1
	mov	DWORD PTR _k$[ebp], edx
$L70377:
	mov	eax, DWORD PTR _k$[ebp]
	cmp	eax, DWORD PTR _srcobj$[ebp]
	jae	SHORT $L70379
	push	10					; 0000000aH
	push	0
	push	0
	mov	ecx, DWORD PTR _k$[ebp]
	push	ecx
	lea	edx, DWORD PTR _srcobj$[ebp]
	push	edx
	call	_dyntab_val
	add	esp, 12					; 0000000cH
	push	eax
	call	_strtoul
	add	esp, 12					; 0000000cH
	mov	ecx, DWORD PTR _c$70369[ebp]
	cmp	eax, DWORD PTR [ecx+40]
	je	SHORT $L70379
	jmp	SHORT $L70378
$L70379:

; 143  : 				if(k == srcobj.nbrows) DYNTAB_ADD_INT(&srcobj, srcobj.nbrows, 0, c->Line);

	mov	edx, DWORD PTR _k$[ebp]
	cmp	edx, DWORD PTR _srcobj$[ebp]
	jne	SHORT $L70384
	mov	BYTE PTR __tmp$70381[ebp], 0
	mov	ecx, 7
	xor	eax, eax
	lea	edi, DWORD PTR __tmp$70381[ebp+1]
	rep stosd
	stosw
	stosb
	mov	eax, DWORD PTR _c$70369[ebp]
	mov	ecx, DWORD PTR [eax+40]
	push	ecx
	push	OFFSET FLAT:$SG70382
	lea	edx, DWORD PTR __tmp$70381[ebp]
	push	edx
	call	_sprintf
	add	esp, 12					; 0000000cH
	push	0
	push	0
	push	0
	lea	eax, DWORD PTR __tmp$70381[ebp]
	push	eax
	push	0
	mov	ecx, DWORD PTR _srcobj$[ebp]
	push	ecx
	lea	edx, DWORD PTR _srcobj$[ebp]
	push	edx
	call	_dyntab_add
	add	esp, 28					; 0000001cH
	test	eax, eax
	je	SHORT $L70384
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29872], OFFSET FLAT:$SG70386
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 143		; 0000008fH
	jmp	$eva_err$70267
$L70384:

; 144  : 			}

	jmp	$L70367
$L70368:

; 145  : 		}

	jmp	$L70349
$L70350:

; 147  : 	else

	jmp	SHORT $L70391
$L70344:

; 149  : 		/* Create a single object */
; 150  : 		DYNTAB_ADD_INT(&srcobj, 0, 0, idobj);

	mov	BYTE PTR __tmp$70388[ebp], 0
	mov	ecx, 7
	xor	eax, eax
	lea	edi, DWORD PTR __tmp$70388[ebp+1]
	rep stosd
	stosw
	stosb
	mov	edx, DWORD PTR _idobj$[ebp]
	push	edx
	push	OFFSET FLAT:$SG70389
	lea	eax, DWORD PTR __tmp$70388[ebp]
	push	eax
	call	_sprintf
	add	esp, 12					; 0000000cH
	push	0
	push	0
	push	0
	lea	ecx, DWORD PTR __tmp$70388[ebp]
	push	ecx
	push	0
	push	0
	lea	edx, DWORD PTR _srcobj$[ebp]
	push	edx
	call	_dyntab_add
	add	esp, 28					; 0000001cH
	test	eax, eax
	je	SHORT $L70391
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29872], OFFSET FLAT:$SG70393
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 150		; 00000096H
	jmp	$eva_err$70267
$L70391:

; 152  : 
; 153  : 	/* Output page header if applicable */
; 154  : 	b_msg = (!*dialog && srcobj.nbrows > 1) ||
; 155  : 			!strcmp(dialog, "_EVA_ALWAYS") ||
; 156  : 			(!strcmp(dialog, "_EVA_COUNT") && (limit <= srcobj.nbrows));

	mov	edx, DWORD PTR _dialog$[ebp]
	movsx	eax, BYTE PTR [edx]
	test	eax, eax
	jne	SHORT $L70599
	cmp	DWORD PTR _srcobj$[ebp], 1
	ja	SHORT $L70600
$L70599:
	push	OFFSET FLAT:$SG70394
	mov	ecx, DWORD PTR _dialog$[ebp]
	push	ecx
	call	_strcmp
	add	esp, 8
	test	eax, eax
	je	SHORT $L70600
	push	OFFSET FLAT:$SG70395
	mov	edx, DWORD PTR _dialog$[ebp]
	push	edx
	call	_strcmp
	add	esp, 8
	test	eax, eax
	jne	SHORT $L70601
	mov	eax, DWORD PTR _limit$[ebp]
	cmp	eax, DWORD PTR _srcobj$[ebp]
	jbe	SHORT $L70600
$L70601:
	mov	DWORD PTR -5132+[ebp], 0
	jmp	SHORT $L70602
$L70600:
	mov	DWORD PTR -5132+[ebp], 1
$L70602:
	mov	ecx, DWORD PTR -5132+[ebp]
	mov	DWORD PTR _b_msg$[ebp], ecx

; 157  : 	if(b_msg)

	cmp	DWORD PTR _b_msg$[ebp], 0
	je	SHORT $L70396

; 159  : 		put_html_page_header(cntxt, NULL, NULL, NULL, 3);

	push	3
	push	0
	push	0
	push	0
	mov	edx, DWORD PTR _cntxt$[ebp]
	push	edx
	call	_put_html_page_header
	add	esp, 20					; 00000014H

; 160  : 		printf("<font face=Arial><hr><b>%s</b><hr>", ctrl->LABEL);

	mov	eax, DWORD PTR _ctrl$[ebp]
	mov	ecx, DWORD PTR [eax+284]
	push	ecx
	push	OFFSET FLAT:$SG70400
	call	_printf
	add	esp, 8

; 161  : 		cntxt->b_terminate = 15;

	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29776], 15		; 0000000fH
$L70396:

; 163  : 
; 164  : 	/* For each source object */
; 165  : 	for(i = 0; i < srcobj.nbrows; i++)

	mov	DWORD PTR _i$[ebp], 0
	jmp	SHORT $L70401
$L70402:
	mov	eax, DWORD PTR _i$[ebp]
	add	eax, 1
	mov	DWORD PTR _i$[ebp], eax
$L70401:
	mov	ecx, DWORD PTR _i$[ebp]
	cmp	ecx, DWORD PTR _srcobj$[ebp]
	jae	$L70403

; 167  : 		unsigned long idsrc = DYNTAB_TOULRC(&srcobj, i, 0), iddest = 0;

	push	10					; 0000000aH
	push	0
	push	0
	mov	edx, DWORD PTR _i$[ebp]
	push	edx
	lea	eax, DWORD PTR _srcobj$[ebp]
	push	eax
	call	_dyntab_val
	add	esp, 12					; 0000000cH
	push	eax
	call	_strtoul
	add	esp, 12					; 0000000cH
	mov	DWORD PTR _idsrc$70404[ebp], eax
	mov	DWORD PTR _iddest$70406[ebp], 0

; 168  : 		int b_create = 1;

	mov	DWORD PTR _b_create$70407[ebp], 1

; 169  : 		dyntab_free(&objdata);

	lea	ecx, DWORD PTR _objdata$[ebp]
	push	ecx
	call	_dyntab_free
	add	esp, 4

; 170  : 
; 171  : 		/* Display progress message if applicable */
; 172  : 		if(b_msg)

	cmp	DWORD PTR _b_msg$[ebp], 0
	je	$L70408

; 174  : 			if(qry_obj_field(cntxt, &data, idsrc, NULL)) STACK_ERROR;

	push	0
	mov	edx, DWORD PTR _idsrc$70404[ebp]
	push	edx
	lea	eax, DWORD PTR _data$[ebp]
	push	eax
	mov	ecx, DWORD PTR _cntxt$[ebp]
	push	ecx
	call	_qry_obj_field
	add	esp, 16					; 00000010H
	test	eax, eax
	je	SHORT $L70410
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 174		; 000000aeH
	jmp	$eva_err$70267
$L70410:

; 175  : 			if(qry_obj_label(cntxt, &label, NULL, &label, NULL, NULL, NULL, NULL, NULL, 0, &data, 0)) CLEAR_ERROR;

	push	0
	lea	eax, DWORD PTR _data$[ebp]
	push	eax
	push	0
	push	0
	push	0
	push	0
	push	0
	push	0
	lea	ecx, DWORD PTR _label$[ebp]
	push	ecx
	push	0
	lea	edx, DWORD PTR _label$[ebp]
	push	edx
	mov	eax, DWORD PTR _cntxt$[ebp]
	push	eax
	call	_qry_obj_label
	add	esp, 48					; 00000030H
	test	eax, eax
	je	SHORT $L70417
	push	175					; 000000afH
	push	OFFSET FLAT:$SG70418
	push	OFFSET FLAT:$SG70419
	mov	ecx, DWORD PTR _cntxt$[ebp]
	push	ecx
	call	_err_clear
	add	esp, 16					; 00000010H
$L70417:

; 176  : 			printf("==&gt; <font color=#0000FF>%s</font><br>", label ? label->data : "???");

	cmp	DWORD PTR _label$[ebp], 0
	je	SHORT $L70603
	mov	edx, DWORD PTR _label$[ebp]
	add	edx, 8
	mov	DWORD PTR -5136+[ebp], edx
	jmp	SHORT $L70604
$L70603:
	mov	DWORD PTR -5136+[ebp], OFFSET FLAT:$SG70420
$L70604:
	mov	eax, DWORD PTR -5136+[ebp]
	push	eax
	push	OFFSET FLAT:$SG70421
	call	_printf
	add	esp, 8
$L70408:

; 178  : 
; 179  : 		/* Calc values for each destination field */
; 180  : 		for(j = 0; j < dstfield.nbrows; j++)

	mov	DWORD PTR _j$[ebp], 0
	jmp	SHORT $L70422
$L70423:
	mov	ecx, DWORD PTR _j$[ebp]
	add	ecx, 1
	mov	DWORD PTR _j$[ebp], ecx
$L70422:
	mov	edx, DWORD PTR _j$[ebp]
	cmp	edx, DWORD PTR _dstfield$[ebp]
	jae	$L70424

; 182  : 			/* Get relation & key options */
; 183  : 			DynTableCell *fld = dyntab_cell(&dstfield, j, 0);

	push	0
	mov	eax, DWORD PTR _j$[ebp]
	push	eax
	lea	ecx, DWORD PTR _dstfield$[ebp]
	push	ecx
	call	_dyntab_cell
	add	esp, 12					; 0000000cH
	mov	DWORD PTR _fld$70425[ebp], eax

; 184  : 			int valmode = atoi(dyntab_val(&dstrelmod, j, 0));

	push	0
	mov	edx, DWORD PTR _j$[ebp]
	push	edx
	lea	eax, DWORD PTR _dstrelmod$[ebp]
	push	eax
	call	_dyntab_val
	add	esp, 12					; 0000000cH
	push	eax
	call	_atoi
	add	esp, 4
	mov	DWORD PTR _valmode$70426[ebp], eax

; 185  : 			int b_key = !dstkey.nbrows || dyntab_sz(&dstkey, j, 0) > 0;

	cmp	DWORD PTR _dstkey$[ebp], 0
	je	SHORT $L70605
	push	0
	mov	ecx, DWORD PTR _j$[ebp]
	push	ecx
	lea	edx, DWORD PTR _dstkey$[ebp]
	push	edx
	call	_dyntab_sz
	add	esp, 12					; 0000000cH
	test	eax, eax
	ja	SHORT $L70605
	mov	DWORD PTR -5140+[ebp], 0
	jmp	SHORT $L70606
$L70605:
	mov	DWORD PTR -5140+[ebp], 1
$L70606:
	mov	eax, DWORD PTR -5140+[ebp]
	mov	DWORD PTR _b_key$70427[ebp], eax

; 186  : 
; 187  : 			/* Get values from temp table if already computed */
; 188  : 			if(b_lineval)

	cmp	DWORD PTR _b_lineval$[ebp], 0
	je	$L70428

; 190  : 				DynTableCell *c0 = dyntab_cell(&lineval, 0, j);

	mov	ecx, DWORD PTR _j$[ebp]
	push	ecx
	push	0
	lea	edx, DWORD PTR _lineval$[ebp]
	push	edx
	call	_dyntab_cell
	add	esp, 12					; 0000000cH
	mov	DWORD PTR _c0$70429[ebp], eax

; 191  : 				dyntab_free(&data);

	lea	eax, DWORD PTR _data$[ebp]
	push	eax
	call	_dyntab_free
	add	esp, 4

; 192  : 				for(k = 0; k < c0->row; k++)

	mov	DWORD PTR _k$[ebp], 0
	jmp	SHORT $L70430
$L70431:
	mov	ecx, DWORD PTR _k$[ebp]
	add	ecx, 1
	mov	DWORD PTR _k$[ebp], ecx
$L70430:
	mov	edx, DWORD PTR _c0$70429[ebp]
	mov	eax, DWORD PTR _k$[ebp]
	cmp	eax, DWORD PTR [edx+60]
	jae	$L70432

; 194  : 					DynTableCell *c = dyntab_cell(&lineval, k, j);

	mov	ecx, DWORD PTR _j$[ebp]
	push	ecx
	mov	edx, DWORD PTR _k$[ebp]
	push	edx
	lea	eax, DWORD PTR _lineval$[ebp]
	push	eax
	call	_dyntab_cell
	add	esp, 12					; 0000000cH
	mov	DWORD PTR _c$70433[ebp], eax

; 195  : 					unsigned long row = data.nbrows;

	mov	ecx, DWORD PTR _data$[ebp]
	mov	DWORD PTR _row$70434[ebp], ecx

; 196  : 					if(c->Line != idsrc && c0->col & 2) continue;

	mov	edx, DWORD PTR _c$70433[ebp]
	mov	eax, DWORD PTR [edx+40]
	cmp	eax, DWORD PTR _idsrc$70404[ebp]
	je	SHORT $L70435
	mov	ecx, DWORD PTR _c0$70429[ebp]
	mov	edx, DWORD PTR [ecx+56]
	and	edx, 2
	test	edx, edx
	je	SHORT $L70435
	jmp	SHORT $L70431
$L70435:

; 197  : 					DYNTAB_SET_CELLP(&data, row, 0, c);

	push	0
	mov	eax, DWORD PTR _c$70433[ebp]
	push	eax
	push	0
	mov	ecx, DWORD PTR _row$70434[ebp]
	push	ecx
	lea	edx, DWORD PTR _data$[ebp]
	push	edx
	call	_dyntab_copy
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L70436
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29872], OFFSET FLAT:$SG70438
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 197		; 000000c5H
	jmp	$eva_err$70267
$L70436:

; 198  : 					dyntab_cell(&data, row, 0)->Line = 0;

	push	0
	mov	edx, DWORD PTR _row$70434[ebp]
	push	edx
	lea	eax, DWORD PTR _data$[ebp]
	push	eax
	call	_dyntab_cell
	add	esp, 12					; 0000000cH
	mov	DWORD PTR [eax+40], 0

; 199  : 				}

	jmp	$L70431
$L70432:

; 201  : 			else

	jmp	$L70462
$L70428:

; 204  : 				/* Handle value source type & field */
; 205  : 				char *srctyp = dyntab_val(&srcvaltyp, j, 0);

	push	0
	mov	ecx, DWORD PTR _j$[ebp]
	push	ecx
	lea	edx, DWORD PTR _srcvaltyp$[ebp]
	push	edx
	call	_dyntab_val
	add	esp, 12					; 0000000cH
	mov	DWORD PTR _srctyp$70440[ebp], eax

; 206  : 				if(!*srctyp) srctyp = "_EVA_VALUE";

	mov	eax, DWORD PTR _srctyp$70440[ebp]
	movsx	ecx, BYTE PTR [eax]
	test	ecx, ecx
	jne	SHORT $L70441
	mov	DWORD PTR _srctyp$70440[ebp], OFFSET FLAT:$SG70442
$L70441:

; 207  : 				dyntab_free(&listobj);

	lea	edx, DWORD PTR _listobj$[ebp]
	push	edx
	call	_dyntab_free
	add	esp, 4

; 208  : 				if(!strcmp(srctyp, "_EVA_PROC_SELOBJ"))

	push	OFFSET FLAT:$SG70444
	mov	eax, DWORD PTR _srctyp$70440[ebp]
	push	eax
	call	_strcmp
	add	esp, 8
	test	eax, eax
	jne	$L70443

; 210  : 					/* Handle specific value source type : selected object */
; 211  : 					DYNTAB_ADD_INT(&listobj, 0, 0, idsrc);

	mov	BYTE PTR __tmp$70445[ebp], 0
	mov	ecx, 7
	xor	eax, eax
	lea	edi, DWORD PTR __tmp$70445[ebp+1]
	rep stosd
	stosw
	stosb
	mov	ecx, DWORD PTR _idsrc$70404[ebp]
	push	ecx
	push	OFFSET FLAT:$SG70446
	lea	edx, DWORD PTR __tmp$70445[ebp]
	push	edx
	call	_sprintf
	add	esp, 12					; 0000000cH
	push	0
	push	0
	push	0
	lea	eax, DWORD PTR __tmp$70445[ebp]
	push	eax
	push	0
	push	0
	lea	ecx, DWORD PTR _listobj$[ebp]
	push	ecx
	call	_dyntab_add
	add	esp, 28					; 0000001cH
	test	eax, eax
	je	SHORT $L70448
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29872], OFFSET FLAT:$SG70450
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 211		; 000000d3H
	jmp	$eva_err$70267
$L70448:

; 212  : 					srctyp = "_EVA_LISTOBJ";

	mov	DWORD PTR _srctyp$70440[ebp], OFFSET FLAT:$SG70451

; 214  : 				else

	jmp	$L70455
$L70443:

; 215  : 					for(k = 0; k < srcvalobj.nbcols && dyntab_sz(&srcvalobj, j, k); k++)

	mov	DWORD PTR _k$[ebp], 0
	jmp	SHORT $L70453
$L70454:
	mov	ecx, DWORD PTR _k$[ebp]
	add	ecx, 1
	mov	DWORD PTR _k$[ebp], ecx
$L70453:
	mov	edx, DWORD PTR _k$[ebp]
	cmp	edx, DWORD PTR _srcvalobj$[ebp+8]
	jae	SHORT $L70455
	mov	eax, DWORD PTR _k$[ebp]
	push	eax
	mov	ecx, DWORD PTR _j$[ebp]
	push	ecx
	lea	edx, DWORD PTR _srcvalobj$[ebp]
	push	edx
	call	_dyntab_sz
	add	esp, 12					; 0000000cH
	test	eax, eax
	je	SHORT $L70455

; 216  : 						DYNTAB_SET_CELL(&listobj, k, 0, &srcvalobj, j, k);

	push	0
	mov	eax, DWORD PTR _k$[ebp]
	push	eax
	mov	ecx, DWORD PTR _j$[ebp]
	push	ecx
	lea	edx, DWORD PTR _srcvalobj$[ebp]
	push	edx
	call	_dyntab_cell
	add	esp, 12					; 0000000cH
	push	eax
	push	0
	mov	eax, DWORD PTR _k$[ebp]
	push	eax
	lea	ecx, DWORD PTR _listobj$[ebp]
	push	ecx
	call	_dyntab_copy
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L70456
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29872], OFFSET FLAT:$SG70458
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 216		; 000000d8H
	jmp	$eva_err$70267
$L70456:
	jmp	$L70454
$L70455:

; 217  : 				dyntab_free(&field);

	lea	ecx, DWORD PTR _field$[ebp]
	push	ecx
	call	_dyntab_free
	add	esp, 4

; 218  : 				DYNTAB_SET_CELL(&field, 0, 0, &srcfield, j, 0);

	push	0
	push	0
	mov	edx, DWORD PTR _j$[ebp]
	push	edx
	lea	eax, DWORD PTR _srcfield$[ebp]
	push	eax
	call	_dyntab_cell
	add	esp, 12					; 0000000cH
	push	eax
	push	0
	push	0
	lea	ecx, DWORD PTR _field$[ebp]
	push	ecx
	call	_dyntab_copy
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L70459
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29872], OFFSET FLAT:$SG70461
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 218		; 000000daH
	jmp	$eva_err$70267
$L70459:

; 219  : 				field.cell->Line = 0;

	mov	ecx, DWORD PTR _field$[ebp+16]
	mov	DWORD PTR [ecx+40], 0

; 220  : 
; 221  : 				/* Evaluate value - don't create this object if error */
; 222  : 				if(ctrl_eval_valtyp(cntxt, ctrl, &data, srctyp, &listobj, &field))

	lea	edx, DWORD PTR _field$[ebp]
	push	edx
	lea	eax, DWORD PTR _listobj$[ebp]
	push	eax
	mov	ecx, DWORD PTR _srctyp$70440[ebp]
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
	je	SHORT $L70462

; 224  : 					b_create = 0;

	mov	DWORD PTR _b_create$70407[ebp], 0

; 225  : 					if(b_msg) printf("<font color=#FF0000>%s</font> : %s<br>", fld->txt, cntxt->err.text);

	cmp	DWORD PTR _b_msg$[ebp], 0
	je	SHORT $L70463
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	eax, DWORD PTR [edx+29872]
	push	eax
	mov	ecx, DWORD PTR _fld$70425[ebp]
	mov	edx, DWORD PTR [ecx]
	push	edx
	push	OFFSET FLAT:$SG70464
	call	_printf
	add	esp, 12					; 0000000cH
$L70463:

; 226  : 					CLEAR_ERROR;

	push	226					; 000000e2H
	push	OFFSET FLAT:$SG70465
	push	OFFSET FLAT:$SG70466
	mov	eax, DWORD PTR _cntxt$[ebp]
	push	eax
	call	_err_clear
	add	esp, 16					; 00000010H

; 227  : 					break;

	jmp	$L70424
$L70462:

; 230  : 
; 231  : 			/* Add values to object data */
; 232  : 			for(k = 0; k < data.nbrows; k++)

	mov	DWORD PTR _k$[ebp], 0
	jmp	SHORT $L70467
$L70468:
	mov	ecx, DWORD PTR _k$[ebp]
	add	ecx, 1
	mov	DWORD PTR _k$[ebp], ecx
$L70467:
	mov	edx, DWORD PTR _k$[ebp]
	cmp	edx, DWORD PTR _data$[ebp]
	jae	$L70469

; 234  : 				unsigned long row = objdata.nbrows;

	mov	eax, DWORD PTR _objdata$[ebp]
	mov	DWORD PTR _row$70470[ebp], eax

; 235  : 				DynTableCell *c;
; 236  : 
; 237  : 				/* Handle decimal values */
; 238  : 				if(valmode == 2)

	cmp	DWORD PTR _valmode$70426[ebp], 2
	jne	$L70476

; 240  : 					char *tmp;
; 241  : 					c = dyntab_cell(&data, k, 0);

	push	0
	mov	ecx, DWORD PTR _k$[ebp]
	push	ecx
	lea	edx, DWORD PTR _data$[ebp]
	push	edx
	call	_dyntab_cell
	add	esp, 12					; 0000000cH
	mov	DWORD PTR _c$70471[ebp], eax

; 242  : 					tmp = input_to_number(c->txt);

	mov	eax, DWORD PTR _c$70471[ebp]
	mov	ecx, DWORD PTR [eax]
	push	ecx
	call	_input_to_number
	add	esp, 4
	mov	DWORD PTR _tmp$70473[ebp], eax

; 243  : 					if(strcmp(tmp, c->txt)) DYNTAB_ADD(&data, k, 0, tmp, strlen(tmp), NO_CONV);

	mov	edx, DWORD PTR _c$70471[ebp]
	mov	eax, DWORD PTR [edx]
	push	eax
	mov	ecx, DWORD PTR _tmp$70473[ebp]
	push	ecx
	call	_strcmp
	add	esp, 8
	test	eax, eax
	je	SHORT $L70476
	push	0
	push	0
	mov	edx, DWORD PTR _tmp$70473[ebp]
	push	edx
	call	_strlen
	add	esp, 4
	push	eax
	mov	eax, DWORD PTR _tmp$70473[ebp]
	push	eax
	push	0
	mov	ecx, DWORD PTR _k$[ebp]
	push	ecx
	lea	edx, DWORD PTR _data$[ebp]
	push	edx
	call	_dyntab_add
	add	esp, 28					; 0000001cH
	test	eax, eax
	je	SHORT $L70476
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29872], OFFSET FLAT:$SG70478
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 243		; 000000f3H
	jmp	$eva_err$70267
$L70476:

; 245  : 
; 246  : 				/* Set value attributes */
; 247  : 				DYNTAB_ADD_CELL(&objdata, row, 0, &data, k, 0);

	push	1
	push	0
	mov	edx, DWORD PTR _k$[ebp]
	push	edx
	lea	eax, DWORD PTR _data$[ebp]
	push	eax
	call	_dyntab_cell
	add	esp, 12					; 0000000cH
	push	eax
	push	0
	mov	ecx, DWORD PTR _row$70470[ebp]
	push	ecx
	lea	edx, DWORD PTR _objdata$[ebp]
	push	edx
	call	_dyntab_copy
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L70479
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29872], OFFSET FLAT:$SG70481
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 247		; 000000f7H
	jmp	$eva_err$70267
$L70479:

; 248  : 				c = dyntab_cell(&objdata, row, 0);

	push	0
	mov	edx, DWORD PTR _row$70470[ebp]
	push	edx
	lea	eax, DWORD PTR _objdata$[ebp]
	push	eax
	call	_dyntab_cell
	add	esp, 12					; 0000000cH
	mov	DWORD PTR _c$70471[ebp], eax

; 249  : 				if(c->field && !c->b_dontfreefield) M_FREE(c->field);

	mov	ecx, DWORD PTR _c$70471[ebp]
	cmp	DWORD PTR [ecx+8], 0
	je	SHORT $L70482
	mov	edx, DWORD PTR _c$70471[ebp]
	movsx	eax, BYTE PTR [edx+15]
	test	eax, eax
	jne	SHORT $L70482
	mov	ecx, DWORD PTR _c$70471[ebp]
	mov	edx, DWORD PTR [ecx+8]
	push	edx
	call	_mem_free
	add	esp, 4
	mov	eax, DWORD PTR _c$70471[ebp]
	mov	DWORD PTR [eax+8], 0
$L70482:

; 250  : 				c->field = fld->txt;

	mov	ecx, DWORD PTR _c$70471[ebp]
	mov	edx, DWORD PTR _fld$70425[ebp]
	mov	eax, DWORD PTR [edx]
	mov	DWORD PTR [ecx+8], eax

; 251  : 				c->IdField = fld->IdValue;

	mov	ecx, DWORD PTR _c$70471[ebp]
	mov	edx, DWORD PTR _fld$70425[ebp]
	mov	eax, DWORD PTR [edx+32]
	mov	DWORD PTR [ecx+28], eax

; 252  : 				c->b_dontfreefield = 1;

	mov	ecx, DWORD PTR _c$70471[ebp]
	mov	BYTE PTR [ecx+15], 1

; 253  : 				c->b_relation |= (valmode == 1);

	xor	edx, edx
	cmp	DWORD PTR _valmode$70426[ebp], 1
	sete	dl
	mov	eax, DWORD PTR _c$70471[ebp]
	mov	cl, BYTE PTR [eax+12]
	or	cl, dl
	mov	edx, DWORD PTR _c$70471[ebp]
	mov	BYTE PTR [edx+12], cl

; 254  : 				c->i_cgi = b_key ? j : ~0UL;

	cmp	DWORD PTR _b_key$70427[ebp], 0
	je	SHORT $L70607
	mov	eax, DWORD PTR _j$[ebp]
	mov	DWORD PTR -5144+[ebp], eax
	jmp	SHORT $L70608
$L70607:
	mov	DWORD PTR -5144+[ebp], -1
$L70608:
	mov	ecx, DWORD PTR _c$70471[ebp]
	mov	edx, DWORD PTR -5144+[ebp]
	mov	DWORD PTR [ecx+48], edx

; 255  : 			}

	jmp	$L70468
$L70469:

; 256  : 		}

	jmp	$L70423
$L70424:

; 257  : 
; 258  : 		/* Continue if no data */
; 259  : 		if(!objdata.nbrows || !b_create)

	cmp	DWORD PTR _objdata$[ebp], 0
	je	SHORT $L70484
	cmp	DWORD PTR _b_create$70407[ebp], 0
	jne	SHORT $L70483
$L70484:

; 261  : 			/* Display message if applicable */
; 262  : 			if(b_msg) printf("<font color=#FFAA00>Pas de données - fiche non créée</font><br>");

	cmp	DWORD PTR _b_msg$[ebp], 0
	je	SHORT $L70485
	push	OFFSET FLAT:$SG70486
	call	_printf
	add	esp, 4
$L70485:

; 263  : 			continue;

	jmp	$L70402
$L70483:

; 265  : 
; 266  : 		/* Check for duplicates - add form filter */
; 267  : 		qry_build_free(&flt);

	lea	eax, DWORD PTR _flt$[ebp]
	push	eax
	call	_qry_build_free
	add	esp, 4

; 268  : 		if(qry_add_filter_simple_int(cntxt, &flt, RelNone, "_EVA_FORMSTAMP", RelList, dstform)) STACK_ERROR;

	mov	ecx, DWORD PTR _dstform$[ebp]
	push	ecx
	push	3
	push	OFFSET FLAT:$SG70488
	push	0
	lea	edx, DWORD PTR _flt$[ebp]
	push	edx
	mov	eax, DWORD PTR _cntxt$[ebp]
	push	eax
	call	_qry_add_filter_simple_int
	add	esp, 24					; 00000018H
	test	eax, eax
	je	SHORT $L70487
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 268		; 0000010cH
	jmp	$eva_err$70267
$L70487:

; 269  : 
; 270  : 		/* Add filter for each key value */
; 271  : 		for(j = 0; j < objdata.nbrows; j++)

	mov	DWORD PTR _j$[ebp], 0
	jmp	SHORT $L70489
$L70490:
	mov	edx, DWORD PTR _j$[ebp]
	add	edx, 1
	mov	DWORD PTR _j$[ebp], edx
$L70489:
	mov	eax, DWORD PTR _j$[ebp]
	cmp	eax, DWORD PTR _objdata$[ebp]
	jae	$L70491

; 273  : 			DynTableCell *c = dyntab_cell(&objdata, j, 0);

	push	0
	mov	ecx, DWORD PTR _j$[ebp]
	push	ecx
	lea	edx, DWORD PTR _objdata$[ebp]
	push	edx
	call	_dyntab_cell
	add	esp, 12					; 0000000cH
	mov	DWORD PTR _c$70492[ebp], eax

; 274  : 			if(c->i_cgi == ~0UL || !c->txt || !c->txt[0] || !c->len) continue;

	mov	eax, DWORD PTR _c$70492[ebp]
	cmp	DWORD PTR [eax+48], -1
	je	SHORT $L70494
	mov	ecx, DWORD PTR _c$70492[ebp]
	cmp	DWORD PTR [ecx], 0
	je	SHORT $L70494
	mov	edx, DWORD PTR _c$70492[ebp]
	mov	eax, DWORD PTR [edx]
	movsx	ecx, BYTE PTR [eax]
	test	ecx, ecx
	je	SHORT $L70494
	mov	edx, DWORD PTR _c$70492[ebp]
	cmp	DWORD PTR [edx+4], 0
	jne	SHORT $L70493
$L70494:
	jmp	SHORT $L70490
$L70493:

; 275  : 			dyntab_free(&data);

	lea	eax, DWORD PTR _data$[ebp]
	push	eax
	call	_dyntab_free
	add	esp, 4

; 276  : 			DYNTAB_SET_CELLP(&data, 0, 0, c);

	push	0
	mov	ecx, DWORD PTR _c$70492[ebp]
	push	ecx
	push	0
	push	0
	lea	edx, DWORD PTR _data$[ebp]
	push	edx
	call	_dyntab_copy
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L70495
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29872], OFFSET FLAT:$SG70497
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 276		; 00000114H
	jmp	$eva_err$70267
$L70495:

; 277  : 			dyntab_free(&field);

	lea	edx, DWORD PTR _field$[ebp]
	push	edx
	call	_dyntab_free
	add	esp, 4

; 278  : 			DYNTAB_SET_CELLP(&field, 0, 0, dyntab_cell(&dstfield, c->i_cgi,0));

	push	0
	push	0
	mov	eax, DWORD PTR _c$70492[ebp]
	mov	ecx, DWORD PTR [eax+48]
	push	ecx
	lea	edx, DWORD PTR _dstfield$[ebp]
	push	edx
	call	_dyntab_cell
	add	esp, 12					; 0000000cH
	push	eax
	push	0
	push	0
	lea	eax, DWORD PTR _field$[ebp]
	push	eax
	call	_dyntab_copy
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L70498
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29872], OFFSET FLAT:$SG70500
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 278		; 00000116H
	jmp	$eva_err$70267
$L70498:

; 279  : 			if(qry_add_filter(cntxt, &flt, RelNone, &field, c->b_relation ? RelList :  Like, &data)) STACK_ERROR;

	lea	eax, DWORD PTR _data$[ebp]
	push	eax
	mov	ecx, DWORD PTR _c$70492[ebp]
	movsx	edx, BYTE PTR [ecx+12]
	neg	edx
	sbb	edx, edx
	and	edx, -6					; fffffffaH
	add	edx, 9
	push	edx
	lea	eax, DWORD PTR _field$[ebp]
	push	eax
	push	0
	lea	ecx, DWORD PTR _flt$[ebp]
	push	ecx
	mov	edx, DWORD PTR _cntxt$[ebp]
	push	edx
	call	_qry_add_filter
	add	esp, 24					; 00000018H
	test	eax, eax
	je	SHORT $L70501
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 279		; 00000117H
	jmp	$eva_err$70267
$L70501:

; 280  : 		}

	jmp	$L70490
$L70491:

; 281  : 
; 282  : 		/* Exec query for duplicates if keys where present */
; 283  : 		dyntab_free(&data);

	lea	ecx, DWORD PTR _data$[ebp]
	push	ecx
	call	_dyntab_free
	add	esp, 4

; 284  : 		if(flt.nbnode > 1 && qry_filter_objects(cntxt, &data, &flt)) STACK_ERROR;

	cmp	DWORD PTR _flt$[ebp+4424], 1
	jbe	SHORT $L70502
	lea	edx, DWORD PTR _flt$[ebp]
	push	edx
	lea	eax, DWORD PTR _data$[ebp]
	push	eax
	mov	ecx, DWORD PTR _cntxt$[ebp]
	push	ecx
	call	_qry_filter_objects
	add	esp, 12					; 0000000cH
	test	eax, eax
	je	SHORT $L70502
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 284		; 0000011cH
	jmp	$eva_err$70267
$L70502:

; 285  : 
; 286  : 		/* Continue if duplicate object exists */
; 287  : 		if(data.nbrows)

	cmp	DWORD PTR _data$[ebp], 0
	je	$L70503

; 289  : 			/* Display message with existing object if applicable */
; 290  : 			if(b_msg)

	cmp	DWORD PTR _b_msg$[ebp], 0
	je	$L70504

; 292  : 				M_FREE(label);

	mov	eax, DWORD PTR _label$[ebp]
	push	eax
	call	_mem_free
	add	esp, 4
	mov	DWORD PTR _label$[ebp], 0

; 293  : 				if(qry_obj_field(cntxt, &field, DYNTAB_TOUL(&data), NULL)) STACK_ERROR;

	push	0
	push	10					; 0000000aH
	push	0
	push	0
	push	0
	lea	ecx, DWORD PTR _data$[ebp]
	push	ecx
	call	_dyntab_val
	add	esp, 12					; 0000000cH
	push	eax
	call	_strtoul
	add	esp, 12					; 0000000cH
	push	eax
	lea	edx, DWORD PTR _field$[ebp]
	push	edx
	mov	eax, DWORD PTR _cntxt$[ebp]
	push	eax
	call	_qry_obj_field
	add	esp, 16					; 00000010H
	test	eax, eax
	je	SHORT $L70507
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 293		; 00000125H
	jmp	$eva_err$70267
$L70507:

; 294  : 				if(qry_obj_label(cntxt, &label, NULL, &label, NULL, NULL, NULL, NULL, NULL, 0, &field, 0)) CLEAR_ERROR;

	push	0
	lea	edx, DWORD PTR _field$[ebp]
	push	edx
	push	0
	push	0
	push	0
	push	0
	push	0
	push	0
	lea	eax, DWORD PTR _label$[ebp]
	push	eax
	push	0
	lea	ecx, DWORD PTR _label$[ebp]
	push	ecx
	mov	edx, DWORD PTR _cntxt$[ebp]
	push	edx
	call	_qry_obj_label
	add	esp, 48					; 00000030H
	test	eax, eax
	je	SHORT $L70514
	push	294					; 00000126H
	push	OFFSET FLAT:$SG70515
	push	OFFSET FLAT:$SG70516
	mov	eax, DWORD PTR _cntxt$[ebp]
	push	eax
	call	_err_clear
	add	esp, 16					; 00000010H
$L70514:

; 295  : 				printf("<font color=#FFAA00>La fiche existe déjà</font> : %s<br>", label ? label->data : "???");

	cmp	DWORD PTR _label$[ebp], 0
	je	SHORT $L70609
	mov	ecx, DWORD PTR _label$[ebp]
	add	ecx, 8
	mov	DWORD PTR -5148+[ebp], ecx
	jmp	SHORT $L70610
$L70609:
	mov	DWORD PTR -5148+[ebp], OFFSET FLAT:$SG70517
$L70610:
	mov	edx, DWORD PTR -5148+[ebp]
	push	edx
	push	OFFSET FLAT:$SG70518
	call	_printf
	add	esp, 8
$L70504:

; 297  : 			continue;

	jmp	$L70402
$L70503:

; 299  : 
; 300  : 		/* Create new object & set data */
; 301  : 		if(qry_add_new_idobj(cntxt, &iddest, dstform)) STACK_ERROR;

	mov	eax, DWORD PTR _dstform$[ebp]
	push	eax
	lea	ecx, DWORD PTR _iddest$70406[ebp]
	push	ecx
	mov	edx, DWORD PTR _cntxt$[ebp]
	push	edx
	call	_qry_add_new_idobj
	add	esp, 12					; 0000000cH
	test	eax, eax
	je	SHORT $L70519
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 301		; 0000012dH
	jmp	$eva_err$70267
$L70519:

; 302  : 		for(j = 0; j < objdata.nbrows; j++)

	mov	DWORD PTR _j$[ebp], 0
	jmp	SHORT $L70520
$L70521:
	mov	ecx, DWORD PTR _j$[ebp]
	add	ecx, 1
	mov	DWORD PTR _j$[ebp], ecx
$L70520:
	mov	edx, DWORD PTR _j$[ebp]
	cmp	edx, DWORD PTR _objdata$[ebp]
	jae	$L70522

; 304  : 			DynTableCell *c = dyntab_cell(&objdata, j, 0);

	push	0
	mov	eax, DWORD PTR _j$[ebp]
	push	eax
	lea	ecx, DWORD PTR _objdata$[ebp]
	push	ecx
	call	_dyntab_cell
	add	esp, 12					; 0000000cH
	mov	DWORD PTR _c$70523[ebp], eax

; 305  : 			if(!c->txt || !c->txt[0] || !c->len) continue;

	mov	edx, DWORD PTR _c$70523[ebp]
	cmp	DWORD PTR [edx], 0
	je	SHORT $L70525
	mov	eax, DWORD PTR _c$70523[ebp]
	mov	ecx, DWORD PTR [eax]
	movsx	edx, BYTE PTR [ecx]
	test	edx, edx
	je	SHORT $L70525
	mov	eax, DWORD PTR _c$70523[ebp]
	cmp	DWORD PTR [eax+4], 0
	jne	SHORT $L70524
$L70525:
	jmp	SHORT $L70521
$L70524:

; 306  : 			c->IdObj = iddest;

	mov	ecx, DWORD PTR _c$70523[ebp]
	mov	edx, DWORD PTR _iddest$70406[ebp]
	mov	DWORD PTR [ecx+20], edx

; 307  : 			if(qry_add_val(cntxt, c, 2, NULL)) STACK_ERROR;

	push	0
	push	2
	mov	eax, DWORD PTR _c$70523[ebp]
	push	eax
	mov	ecx, DWORD PTR _cntxt$[ebp]
	push	ecx
	call	_qry_add_val
	add	esp, 16					; 00000010H
	test	eax, eax
	je	SHORT $L70527
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 307		; 00000133H
	jmp	$eva_err$70267
$L70527:

; 308  : 		}

	jmp	$L70521
$L70522:

; 309  : 		DYNTAB_ADD_INT(&dstobj, dstobj.nbrows, 0, iddest);

	mov	BYTE PTR __tmp$70528[ebp], 0
	mov	ecx, 7
	xor	eax, eax
	lea	edi, DWORD PTR __tmp$70528[ebp+1]
	rep stosd
	stosw
	stosb
	mov	eax, DWORD PTR _iddest$70406[ebp]
	push	eax
	push	OFFSET FLAT:$SG70529
	lea	ecx, DWORD PTR __tmp$70528[ebp]
	push	ecx
	call	_sprintf
	add	esp, 12					; 0000000cH
	push	0
	push	0
	push	0
	lea	edx, DWORD PTR __tmp$70528[ebp]
	push	edx
	push	0
	mov	eax, DWORD PTR _dstobj$[ebp]
	push	eax
	lea	ecx, DWORD PTR _dstobj$[ebp]
	push	ecx
	call	_dyntab_add
	add	esp, 28					; 0000001cH
	test	eax, eax
	je	SHORT $L70531
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29872], OFFSET FLAT:$SG70533
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 309		; 00000135H
	jmp	$eva_err$70267
$L70531:

; 310  : 		dyntab_cell(&dstobj, dstobj.nbrows - 1, 0)->b_relation = 1;

	push	0
	mov	ecx, DWORD PTR _dstobj$[ebp]
	sub	ecx, 1
	push	ecx
	lea	edx, DWORD PTR _dstobj$[ebp]
	push	edx
	call	_dyntab_cell
	add	esp, 12					; 0000000cH
	mov	BYTE PTR [eax+12], 1

; 311  : 
; 312  : 		/* Display message with created object if applicable */
; 313  : 		if(b_msg)

	cmp	DWORD PTR _b_msg$[ebp], 0
	je	$L70534

; 315  : 			M_FREE(label);

	mov	eax, DWORD PTR _label$[ebp]
	push	eax
	call	_mem_free
	add	esp, 4
	mov	DWORD PTR _label$[ebp], 0

; 316  : 			if(qry_obj_field(cntxt, &field, iddest, NULL)) STACK_ERROR;

	push	0
	mov	ecx, DWORD PTR _iddest$70406[ebp]
	push	ecx
	lea	edx, DWORD PTR _field$[ebp]
	push	edx
	mov	eax, DWORD PTR _cntxt$[ebp]
	push	eax
	call	_qry_obj_field
	add	esp, 16					; 00000010H
	test	eax, eax
	je	SHORT $L70536
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 316		; 0000013cH
	jmp	$eva_err$70267
$L70536:

; 317  : 			if(qry_obj_label(cntxt, &label, NULL, &label, NULL, NULL, NULL, NULL, NULL, 0, &field, 0)) CLEAR_ERROR;

	push	0
	lea	edx, DWORD PTR _field$[ebp]
	push	edx
	push	0
	push	0
	push	0
	push	0
	push	0
	push	0
	lea	eax, DWORD PTR _label$[ebp]
	push	eax
	push	0
	lea	ecx, DWORD PTR _label$[ebp]
	push	ecx
	mov	edx, DWORD PTR _cntxt$[ebp]
	push	edx
	call	_qry_obj_label
	add	esp, 48					; 00000030H
	test	eax, eax
	je	SHORT $L70543
	push	317					; 0000013dH
	push	OFFSET FLAT:$SG70544
	push	OFFSET FLAT:$SG70545
	mov	eax, DWORD PTR _cntxt$[ebp]
	push	eax
	call	_err_clear
	add	esp, 16					; 00000010H
$L70543:

; 318  : 			printf("<font color=#00FF00>++++ Fiche créée</font> : %s<br>", label ? label->data : "???");

	cmp	DWORD PTR _label$[ebp], 0
	je	SHORT $L70611
	mov	ecx, DWORD PTR _label$[ebp]
	add	ecx, 8
	mov	DWORD PTR -5152+[ebp], ecx
	jmp	SHORT $L70612
$L70611:
	mov	DWORD PTR -5152+[ebp], OFFSET FLAT:$SG70546
$L70612:
	mov	edx, DWORD PTR -5152+[ebp]
	push	edx
	push	OFFSET FLAT:$SG70547
	call	_printf
	add	esp, 8
$L70534:

; 320  : 
; 321  : 		/* Update source object if applicable */
; 322  : 		if(srcupdate)

	cmp	DWORD PTR _srcupdate$[ebp], 0
	je	$L70553

; 324  : 			char idrelobj[32];
; 325  : 			DynTableCell val = {0};

	mov	DWORD PTR _val$70550[ebp], 0
	mov	ecx, 15					; 0000000fH
	xor	eax, eax
	lea	edi, DWORD PTR _val$70550[ebp+4]
	rep stosd

; 326  : 			val.field = srcupdate->txt;

	mov	eax, DWORD PTR _srcupdate$[ebp]
	mov	ecx, DWORD PTR [eax]
	mov	DWORD PTR _val$70550[ebp+8], ecx

; 327  : 			val.IdField = srcupdate->IdValue;

	mov	edx, DWORD PTR _srcupdate$[ebp]
	mov	eax, DWORD PTR [edx+32]
	mov	DWORD PTR _val$70550[ebp+28], eax

; 328  : 			val.IdObj = b_lineval ? idobj : idsrc;

	cmp	DWORD PTR _b_lineval$[ebp], 0
	je	SHORT $L70613
	mov	ecx, DWORD PTR _idobj$[ebp]
	mov	DWORD PTR -5156+[ebp], ecx
	jmp	SHORT $L70614
$L70613:
	mov	edx, DWORD PTR _idsrc$70404[ebp]
	mov	DWORD PTR -5156+[ebp], edx
$L70614:
	mov	eax, DWORD PTR -5156+[ebp]
	mov	DWORD PTR _val$70550[ebp+20], eax

; 329  : 			val.txt = idrelobj;

	lea	ecx, DWORD PTR _idrelobj$70549[ebp]
	mov	DWORD PTR _val$70550[ebp], ecx

; 330  : 			val.len = snprintf(add_sz_str(idrelobj), "%lu", iddest);

	mov	edx, DWORD PTR _iddest$70406[ebp]
	push	edx
	push	OFFSET FLAT:$SG70551
	push	31					; 0000001fH
	lea	eax, DWORD PTR _idrelobj$70549[ebp]
	push	eax
	call	__snprintf
	add	esp, 16					; 00000010H
	mov	DWORD PTR _val$70550[ebp+4], eax

; 331  : 			val.b_relation = 1;

	mov	BYTE PTR _val$70550[ebp+12], 1

; 332  : 			if(qry_add_val(cntxt, &val, 2, NULL)) STACK_ERROR;

	push	0
	push	2
	lea	ecx, DWORD PTR _val$70550[ebp]
	push	ecx
	mov	edx, DWORD PTR _cntxt$[ebp]
	push	edx
	call	_qry_add_val
	add	esp, 16					; 00000010H
	test	eax, eax
	je	SHORT $L70553
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 332		; 0000014cH
	jmp	$eva_err$70267
$L70553:

; 334  : 	}

	jmp	$L70402
$L70403:

; 335  : 
; 336  : 	/* Store list of created objects in given field */
; 337  : 	if(newobjfield)

	cmp	DWORD PTR _newobjfield$[ebp], 0
	je	$L70560

; 339  : 		/* If object was saved or is not current object */
; 340  : 		if(b_savetodb)

	cmp	DWORD PTR _b_savetodb$[ebp], 0
	je	SHORT $L70555

; 342  : 			/* Update data base */
; 343  : 			if(qry_update_idobj_idfield(cntxt, idobj, newobjfield->IdValue, &dstobj, 1))

	push	1
	lea	ecx, DWORD PTR _dstobj$[ebp]
	push	ecx
	mov	edx, DWORD PTR _newobjfield$[ebp]
	mov	eax, DWORD PTR [edx+32]
	push	eax
	mov	ecx, DWORD PTR _idobj$[ebp]
	push	ecx
	mov	edx, DWORD PTR _cntxt$[ebp]
	push	edx
	call	_qry_update_idobj_idfield
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L70556

; 344  : 				CLEAR_ERROR;

	push	344					; 00000158H
	push	OFFSET FLAT:$SG70557
	push	OFFSET FLAT:$SG70558
	mov	eax, DWORD PTR _cntxt$[ebp]
	push	eax
	call	_err_clear
	add	esp, 16					; 00000010H
$L70556:

; 346  : 		else

	jmp	SHORT $L70560
$L70555:

; 347  : 			/* Update CGI data */
; 348  : 			if(cgi_set_field_values(cntxt, idform, idobj, newobjfield->txt, newobjfield->len, &dstobj, "_EVA_ADD", 0))

	push	0
	push	OFFSET FLAT:$SG70561
	lea	ecx, DWORD PTR _dstobj$[ebp]
	push	ecx
	mov	edx, DWORD PTR _newobjfield$[ebp]
	mov	eax, DWORD PTR [edx+4]
	push	eax
	mov	ecx, DWORD PTR _newobjfield$[ebp]
	mov	edx, DWORD PTR [ecx]
	push	edx
	mov	eax, DWORD PTR _idobj$[ebp]
	push	eax
	mov	ecx, DWORD PTR _idform$[ebp]
	push	ecx
	mov	edx, DWORD PTR _cntxt$[ebp]
	push	edx
	call	_cgi_set_field_values
	add	esp, 32					; 00000020H
	test	eax, eax
	je	SHORT $L70560

; 349  : 				CLEAR_ERROR;

	push	349					; 0000015dH
	push	OFFSET FLAT:$SG70562
	push	OFFSET FLAT:$SG70563
	mov	eax, DWORD PTR _cntxt$[ebp]
	push	eax
	call	_err_clear
	add	esp, 16					; 00000010H
$L70560:

; 351  : 
; 352  : 	/* Output page footer if applicable */
; 353  : 	if(b_msg)

	cmp	DWORD PTR _b_msg$[ebp], 0
	je	SHORT $L70564

; 355  : 		printf("<hr><br><center><input type=image name='B$#NOP' src='../img/_eva_btn_gobackobj_fr.gif'></center><br>\n");

	push	OFFSET FLAT:$SG70565
	call	_printf
	add	esp, 4
$L70564:

; 357  : 	if(*after && strcmp(after, "_EVA_NONE"))

	mov	ecx, DWORD PTR _after$[ebp]
	movsx	edx, BYTE PTR [ecx]
	test	edx, edx
	je	SHORT $L70571
	push	OFFSET FLAT:$SG70567
	mov	eax, DWORD PTR _after$[ebp]
	push	eax
	call	_strcmp
	add	esp, 8
	test	eax, eax
	je	SHORT $L70571

; 359  : 		if(form_close_nosave(cntxt, DYNTAB_TOUL(&form->id_form), DYNTAB_TOUL(&form->id_obj), NULL)) STACK_ERROR;

	push	0
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
	call	_form_close_nosave
	add	esp, 16					; 00000010H
	test	eax, eax
	je	SHORT $L70571
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 359		; 00000167H
	jmp	SHORT $eva_err$70267
$L70571:
$eva_noerr$70269:

; 361  : 
; 362  : 	RETURN_OK_CLEANUP;

	push	0
	push	OFFSET FLAT:$SG70572
	push	OFFSET FLAT:$SG70573
	mov	edx, DWORD PTR _cntxt$[ebp]
	push	edx
	call	_err_clear
	add	esp, 16					; 00000010H
$eva_err$70267:
	mov	eax, DWORD PTR _cntxt$[ebp]
	cmp	DWORD PTR [eax+29872], 0
	je	SHORT $L70574
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	edx, DWORD PTR [ecx+29900]
	push	edx
	push	OFFSET FLAT:$SG70575
	push	OFFSET FLAT:$SG70576
	mov	eax, DWORD PTR _cntxt$[ebp]
	push	eax
	call	_err_add_context
	add	esp, 16					; 00000010H
$L70574:
	lea	ecx, DWORD PTR _srcobj$[ebp]
	push	ecx
	call	_dyntab_free
	add	esp, 4
	lea	edx, DWORD PTR _dstobj$[ebp]
	push	edx
	call	_dyntab_free
	add	esp, 4
	lea	eax, DWORD PTR _dstfield$[ebp]
	push	eax
	call	_dyntab_free
	add	esp, 4
	lea	ecx, DWORD PTR _dstrelmod$[ebp]
	push	ecx
	call	_dyntab_free
	add	esp, 4
	lea	edx, DWORD PTR _dstkey$[ebp]
	push	edx
	call	_dyntab_free
	add	esp, 4
	lea	eax, DWORD PTR _srcfield$[ebp]
	push	eax
	call	_dyntab_free
	add	esp, 4
	lea	ecx, DWORD PTR _srcvaltyp$[ebp]
	push	ecx
	call	_dyntab_free
	add	esp, 4
	lea	edx, DWORD PTR _srcvalobj$[ebp]
	push	edx
	call	_dyntab_free
	add	esp, 4
	lea	eax, DWORD PTR _listobj$[ebp]
	push	eax
	call	_dyntab_free
	add	esp, 4
	lea	ecx, DWORD PTR _field$[ebp]
	push	ecx
	call	_dyntab_free
	add	esp, 4
	lea	edx, DWORD PTR _data$[ebp]
	push	edx
	call	_dyntab_free
	add	esp, 4
	lea	eax, DWORD PTR _objdata$[ebp]
	push	eax
	call	_dyntab_free
	add	esp, 4
	lea	ecx, DWORD PTR _flt$[ebp]
	push	ecx
	call	_qry_build_free
	add	esp, 4
	mov	edx, DWORD PTR _label$[ebp]
	push	edx
	call	_mem_free
	add	esp, 4
	mov	DWORD PTR _label$[ebp], 0
	mov	eax, DWORD PTR _cntxt$[ebp]
	xor	ecx, ecx
	cmp	DWORD PTR [eax+29872], 0
	setne	cl
	mov	eax, ecx

; 363  : }

	pop	edi
	mov	esp, ebp
	pop	ebp
	ret	0
_action_create_objects ENDP
_TEXT	ENDS
END
