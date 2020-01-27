	TITLE	D:\Travail\ABI\EVA\V4.0\CGI\Brunix-2016\form_save.c
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
PUBLIC	_form_save_dialog
PUBLIC	_form_btn_do_save
EXTRN	_err_add_context:NEAR
EXTRN	_err_clear:NEAR
EXTRN	_dyntab_field_val:NEAR
_BSS	SEGMENT
$SG70215 DB	01H DUP (?)
	ALIGN	4

$SG70218 DB	01H DUP (?)
_BSS	ENDS
_DATA	SEGMENT
$SG70214 DB	'_EVA_SAVE', 00H
	ORG $+2
$SG70217 DB	'_EVA_CONFIRM', 00H
	ORG $+3
$SG70227 DB	'D:\Travail\ABI\EVA\V4.0\CGI\Brunix-2016\form_save.c', 00H
$SG70228 DB	'form_btn_do_save', 00H
	ORG $+3
$SG70230 DB	'D:\Travail\ABI\EVA\V4.0\CGI\Brunix-2016\form_save.c', 00H
$SG70231 DB	'form_btn_do_save', 00H
_DATA	ENDS
_TEXT	SEGMENT
_cntxt$ = 8
_i_ctrl$ = 12
_b_ok$ = 16
_form$ = -4
_ctrl$ = -12
_save$ = -16
_confirm$ = -8
_b_done$70220 = -20
_form_btn_do_save PROC NEAR

; 27   : ){

	push	ebp
	mov	ebp, esp
	sub	esp, 28					; 0000001cH

; 28   : 	EVA_form *form = cntxt->form;

	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	ecx, DWORD PTR [eax+80]
	mov	DWORD PTR _form$[ebp], ecx

; 29   : 	EVA_ctrl *ctrl = form->ctrl + i_ctrl;

	mov	edx, DWORD PTR _i_ctrl$[ebp]
	imul	edx, 480				; 000001e0H
	mov	eax, DWORD PTR _form$[ebp]
	mov	ecx, DWORD PTR [eax]
	add	ecx, edx
	mov	DWORD PTR _ctrl$[ebp], ecx

; 30   : 	char *save = CTRL_ATTR_VAL(SAVE);

	cmp	DWORD PTR _ctrl$[ebp], 0
	je	SHORT $L71027
	push	0
	push	-1
	push	OFFSET FLAT:$SG70214
	mov	edx, DWORD PTR _ctrl$[ebp]
	add	edx, 44					; 0000002cH
	push	edx
	call	_dyntab_field_val
	add	esp, 16					; 00000010H
	mov	DWORD PTR -24+[ebp], eax
	jmp	SHORT $L71028
$L71027:
	mov	DWORD PTR -24+[ebp], OFFSET FLAT:$SG70215
$L71028:
	mov	eax, DWORD PTR -24+[ebp]
	mov	DWORD PTR _save$[ebp], eax

; 31   : 	char *confirm = CTRL_ATTR_VAL(CONFIRM);

	cmp	DWORD PTR _ctrl$[ebp], 0
	je	SHORT $L71029
	push	0
	push	-1
	push	OFFSET FLAT:$SG70217
	mov	ecx, DWORD PTR _ctrl$[ebp]
	add	ecx, 44					; 0000002cH
	push	ecx
	call	_dyntab_field_val
	add	esp, 16					; 00000010H
	mov	DWORD PTR -28+[ebp], eax
	jmp	SHORT $L71030
$L71029:
	mov	DWORD PTR -28+[ebp], OFFSET FLAT:$SG70218
$L71030:
	mov	edx, DWORD PTR -28+[ebp]
	mov	DWORD PTR _confirm$[ebp], edx

; 32   : 
; 33   : 	/* Save form data if applicable */
; 34   : 	if(*save && form->prevstep != HtmlView)

	mov	eax, DWORD PTR _save$[ebp]
	movsx	ecx, BYTE PTR [eax]
	test	ecx, ecx
	je	SHORT $L70219
	mov	edx, DWORD PTR _form$[ebp]
	cmp	DWORD PTR [edx+168], 6
	je	SHORT $L70219

; 36   : 		int b_done = BUTN_SAVE_NEXT;

	mov	DWORD PTR _b_done$70220[ebp], 1

; 37   : 		if(form_save_dialog(cntxt, i_ctrl, confirm, BUTN_SAVE_NEXT, &b_done)) STACK_ERROR;

	lea	eax, DWORD PTR _b_done$70220[ebp]
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
	je	SHORT $L70221
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 37		; 00000025H
	jmp	SHORT $eva_err$70222
$L70221:

; 38   : 		if(b_ok) *b_ok = b_done == BUTN_SAVE_NEXT;

	cmp	DWORD PTR _b_ok$[ebp], 0
	je	SHORT $L70223
	xor	edx, edx
	cmp	DWORD PTR _b_done$70220[ebp], 1
	sete	dl
	mov	eax, DWORD PTR _b_ok$[ebp]
	mov	DWORD PTR [eax], edx
$L70223:

; 40   : 	else if(b_ok) *b_ok = 1;

	jmp	SHORT $eva_noerr$70226
$L70219:
	cmp	DWORD PTR _b_ok$[ebp], 0
	je	SHORT $eva_noerr$70226
	mov	ecx, DWORD PTR _b_ok$[ebp]
	mov	DWORD PTR [ecx], 1
$eva_noerr$70226:

; 41   : 
; 42   : 	RETURN_OK_CLEANUP;

	push	0
	push	OFFSET FLAT:$SG70227
	push	OFFSET FLAT:$SG70228
	mov	edx, DWORD PTR _cntxt$[ebp]
	push	edx
	call	_err_clear
	add	esp, 16					; 00000010H
$eva_err$70222:
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
	mov	ecx, DWORD PTR _cntxt$[ebp]
	xor	eax, eax
	cmp	DWORD PTR [ecx+29872], 0
	setne	al

; 43   : }

	mov	esp, ebp
	pop	ebp
	ret	0
_form_btn_do_save ENDP
_TEXT	ENDS
PUBLIC	_form_check_keys
EXTRN	_form_eval_fieldexpr:NEAR
EXTRN	_ctrl_eval_fieldexpr:NEAR
EXTRN	_datetxt_to_format:NEAR
EXTRN	__snprintf:NEAR
EXTRN	_sprintf:NEAR
EXTRN	__chkstk:NEAR
EXTRN	_mem_free:NEAR
EXTRN	_plain_to_html:BYTE
EXTRN	_strtoul:NEAR
EXTRN	_qry_obj_idfield:NEAR
EXTRN	_dynbuf_add:NEAR
EXTRN	_dynbuf_add3:NEAR
EXTRN	_dyntab_free:NEAR
EXTRN	_dyntab_sz:NEAR
EXTRN	_dyntab_val:NEAR
EXTRN	_dyntab_cell:NEAR
EXTRN	_dyntab_copy:NEAR
EXTRN	_dyntab_add:NEAR
EXTRN	_strcmp:NEAR
EXTRN	_dyntab_from_list:NEAR
EXTRN	_qry_build_free:NEAR
EXTRN	_dyntab_cmp:NEAR
EXTRN	_qry_add_filter:NEAR
EXTRN	_ctrl_add_symbol_btn:NEAR
EXTRN	_dyntab_filter_field:NEAR
EXTRN	_qry_filter_objects:NEAR
EXTRN	_dyntab_field_cell:NEAR
EXTRN	_dyntab_order_lines:NEAR
EXTRN	_form_get_field_values:NEAR
_BSS	SEGMENT
	ALIGN	4

$SG70359 DB	01H DUP (?)
	ALIGN	4

$SG70432 DB	01H DUP (?)
	ALIGN	4

$SG70434 DB	01H DUP (?)
	ALIGN	4

$SG70454 DB	01H DUP (?)
	ALIGN	4

$SG70458 DB	01H DUP (?)
_BSS	ENDS
_DATA	SEGMENT
	ORG $+3
$SG70259 DB	'_EVA_KEY_FIELDS', 00H
$SG70261 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70265 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70268 DB	'_EVA_KEY_TYPE', 00H
	ORG $+2
$SG70270 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70273 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70276 DB	'_EVA_KEY_MSG', 00H
	ORG $+3
$SG70278 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70281 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70284 DB	'_EVA_KEY_COND', 00H
	ORG $+2
$SG70286 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70289 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70298 DB	'D:\Travail\ABI\EVA\V4.0\CGI\Brunix-2016\form_save.c', 00H
$SG70299 DB	'form_check_keys', 00H
$SG70305 DB	'0', 00H
	ORG $+2
$SG70313 DB	'_EVA_FORMSTAMP', 00H
	ORG $+1
$SG70315 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70318 DB	'%lu', 00H
$SG70322 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70330 DB	',', 00H
	ORG $+2
$SG70337 DB	', ', 00H
	ORG $+1
$SG70339 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70343 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70345 DB	'_EVA_RELATION', 00H
	ORG $+2
$SG70352 DB	'_EVA_KEY', 00H
	ORG $+3
$SG70360 DB	'TLink0.IdObj<>', 00H
	ORG $+1
$SG70362 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70367 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70373 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70375 DB	'_EVA_KEY_WARN', 00H
	ORG $+2
$SG70387 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70394 DB	'_EVA_NO_DUPLICATE_DISPLAY', 00H
	ORG $+2
$SG70399 DB	'existe d', 0e9H, 'j', 0e0H, 00H
$SG70400 DB	'ressemble ', 0e0H, ' d''autres fiches', 00H
$SG70401 DB	'interdits', 00H
	ORG $+2
$SG70402 DB	'd', 0e9H, 'conseill', 0e9H, 's', 00H
	ORG $+3
$SG70403 DB	'FF0000', 00H
	ORG $+1
$SG70404 DB	'FF8844', 00H
	ORG $+1
$SG70405 DB	'<table border=1 rules=rows cellspacing=0 cellpadding=5 w'
	DB	'idth=100%% bgcolor=#FFFFFF><tr><td colspan=2 align=center><fo'
	DB	'nt size=+1><font color=#%s><b>Doublons %s</b></font><br><u>La'
	DB	' fiche que vous voulez enregistrer %s</u></font></td></tr>', 00H
	ORG $+3
$SG70410 DB	'interdits', 00H
	ORG $+2
$SG70411 DB	'd', 0e9H, 'conseill', 0e9H, 's', 00H
	ORG $+3
$SG70413 DB	'<tr><td valign=top>Doublons %s sur le(s) champs <b><u>', 00H
	ORG $+1
$SG70416 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70419 DB	'</u></b></td><td valign=top><i>', 00H
$SG70421 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70424 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70427 DB	'</i></td></tr>', 00H
	ORG $+1
$SG70429 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70431 DB	'nt', 00H
	ORG $+1
$SG70433 DB	's', 00H
	ORG $+2
$SG70435 DB	'</table><p align=center>Il y a %lu fiche%s qui ressemble'
	DB	'%s ', 0e0H, ' celle que vous voulez enregistrer</p>', 00H
	ORG $+1
$SG70439 DB	'<table border=1 rules=rows cellpadding=0 width=100%><tr>'
	DB	'<th>Ouvrir</th><th>Fiche</th><th>Cr', 0e9H, 'ation</th><th>Do'
	DB	'ublon sur le(s) champs</th></tr>', 00H
	ORG $+3
$SG70441 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70448 DB	'<tr>', 00H
	ORG $+3
$SG70450 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70453 DB	'SYMBOL+LABEL+OBJNOTES', 00H
	ORG $+2
$SG70457 DB	'_EVA_FORMSTAMP.DateCr', 00H
	ORG $+2
$SG70462 DB	'_EVA_FORMSTAMP.IdWhoCr->_EVA_USERNAME', 00H
	ORG $+2
$SG70464 DB	'</td><td valign=top><font size=-1><i>Fiche cr', 0e9H, 0e9H
	DB	'e le %s par %s</i></font></td><td>', 00H
	ORG $+2
$SG70472 DB	' + ', 00H
$SG70474 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70476 DB	'FF0000', 00H
	ORG $+1
$SG70477 DB	'FF8844', 00H
	ORG $+1
$SG70478 DB	'<font color=%s><b>', 00H
	ORG $+1
$SG70481 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70484 DB	'</b></font>', 00H
$SG70486 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70489 DB	'</td></tr>', 00H
	ORG $+1
$SG70491 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70494 DB	'</table>', 00H
	ORG $+3
$SG70496 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70498 DB	'D:\Travail\ABI\EVA\V4.0\CGI\Brunix-2016\form_save.c', 00H
$SG70499 DB	'form_check_keys', 00H
$SG70501 DB	'D:\Travail\ABI\EVA\V4.0\CGI\Brunix-2016\form_save.c', 00H
$SG70502 DB	'form_check_keys', 00H
_DATA	ENDS
_TEXT	SEGMENT
_cntxt$ = 8
_form$ = -44
_ctrl$ = -4632
_keyfields$ = -4652
_keytype$ = -112
_keymsg$ = -140
_keycond$ = -20
_field$ = -92
_value$ = -40
_duplicates$ = -4628
_data$ = -72
_msg$ = -4604
_flt$ = -4600
_i$ = -116
_j$ = -120
_k$ = -144
_id$ = -4608
_c$ = -52
_html$ = -48
_b_error$70293 = -4664
_ktype$70294 = -4660
_c$70295 = -4656
_v$70303 = -4668
_id$70307 = -4684
_row$70308 = -4676
_col$70309 = -4672
__c$70310 = -4680
__tmp$70317 = -4716
_fld$70328 = -4724
_match$70329 = -4720
_b_show_dup$70392 = -4728
_printbuf$70395 = -5752
_datecr$70396 = -5788
_errtyp$70397 = -5756
_form_check_keys PROC NEAR

; 64   : ){

	push	ebp
	mov	ebp, esp
	mov	eax, 5828				; 000016c4H
	call	__chkstk
	push	edi

; 65   : 	EVA_form *form = cntxt->form;

	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	ecx, DWORD PTR [eax+80]
	mov	DWORD PTR _form$[ebp], ecx

; 66   : 	EVA_ctrl *ctrl = form->ctrl;

	mov	edx, DWORD PTR _form$[ebp]
	mov	eax, DWORD PTR [edx]
	mov	DWORD PTR _ctrl$[ebp], eax

; 67   : 	DynTable keyfields = {0};

	mov	DWORD PTR _keyfields$[ebp], 0
	xor	ecx, ecx
	mov	DWORD PTR _keyfields$[ebp+4], ecx
	mov	DWORD PTR _keyfields$[ebp+8], ecx
	mov	DWORD PTR _keyfields$[ebp+12], ecx
	mov	DWORD PTR _keyfields$[ebp+16], ecx

; 68   : 	DynTable keytype = {0};

	mov	DWORD PTR _keytype$[ebp], 0
	xor	edx, edx
	mov	DWORD PTR _keytype$[ebp+4], edx
	mov	DWORD PTR _keytype$[ebp+8], edx
	mov	DWORD PTR _keytype$[ebp+12], edx
	mov	DWORD PTR _keytype$[ebp+16], edx

; 69   : 	DynTable keymsg = {0};

	mov	DWORD PTR _keymsg$[ebp], 0
	xor	eax, eax
	mov	DWORD PTR _keymsg$[ebp+4], eax
	mov	DWORD PTR _keymsg$[ebp+8], eax
	mov	DWORD PTR _keymsg$[ebp+12], eax
	mov	DWORD PTR _keymsg$[ebp+16], eax

; 70   : 	DynTable keycond = {0};

	mov	DWORD PTR _keycond$[ebp], 0
	xor	ecx, ecx
	mov	DWORD PTR _keycond$[ebp+4], ecx
	mov	DWORD PTR _keycond$[ebp+8], ecx
	mov	DWORD PTR _keycond$[ebp+12], ecx
	mov	DWORD PTR _keycond$[ebp+16], ecx

; 71   : 	DynTable field = {0};

	mov	DWORD PTR _field$[ebp], 0
	xor	edx, edx
	mov	DWORD PTR _field$[ebp+4], edx
	mov	DWORD PTR _field$[ebp+8], edx
	mov	DWORD PTR _field$[ebp+12], edx
	mov	DWORD PTR _field$[ebp+16], edx

; 72   : 	DynTable value = {0};

	mov	DWORD PTR _value$[ebp], 0
	xor	eax, eax
	mov	DWORD PTR _value$[ebp+4], eax
	mov	DWORD PTR _value$[ebp+8], eax
	mov	DWORD PTR _value$[ebp+12], eax
	mov	DWORD PTR _value$[ebp+16], eax

; 73   : 	DynTable duplicates = {0};

	mov	DWORD PTR _duplicates$[ebp], 0
	xor	ecx, ecx
	mov	DWORD PTR _duplicates$[ebp+4], ecx
	mov	DWORD PTR _duplicates$[ebp+8], ecx
	mov	DWORD PTR _duplicates$[ebp+12], ecx
	mov	DWORD PTR _duplicates$[ebp+16], ecx

; 74   : 	DynTable data = {0};

	mov	DWORD PTR _data$[ebp], 0
	xor	edx, edx
	mov	DWORD PTR _data$[ebp+4], edx
	mov	DWORD PTR _data$[ebp+8], edx
	mov	DWORD PTR _data$[ebp+12], edx
	mov	DWORD PTR _data$[ebp+16], edx

; 75   : 	DynBuffer *msg = {0};

	mov	DWORD PTR _msg$[ebp], 0

; 76   : 	QryBuild flt = {{0}};

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

; 77   : 	unsigned long i, j, k, id;
; 78   : 	DynTableCell *c;
; 79   : 	DynBuffer **html = form->html;

	mov	ecx, DWORD PTR _form$[ebp]
	mov	edx, DWORD PTR [ecx+232]
	mov	DWORD PTR _html$[ebp], edx

; 80   : 	form->html = &form->html_err;

	mov	eax, DWORD PTR _form$[ebp]
	add	eax, 208				; 000000d0H
	mov	ecx, DWORD PTR _form$[ebp]
	mov	DWORD PTR [ecx+232], eax

; 81   : 
; 82   : 	/* Read form key fields */
; 83   : 	CTRL_ATTR_TAB(keyfields, KEY_FIELDS);

	lea	edx, DWORD PTR _keyfields$[ebp]
	push	edx
	call	_dyntab_free
	add	esp, 4
	push	0
	push	-1
	push	OFFSET FLAT:$SG70259
	mov	eax, DWORD PTR _ctrl$[ebp]
	add	eax, 44					; 0000002cH
	push	eax
	push	0
	lea	ecx, DWORD PTR _keyfields$[ebp]
	push	ecx
	call	_dyntab_filter_field
	add	esp, 24					; 00000018H
	test	eax, eax
	je	SHORT $L70258
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29872], OFFSET FLAT:$SG70261
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 83		; 00000053H
	jmp	$eva_err$70262
$L70258:
	lea	ecx, DWORD PTR _keyfields$[ebp]
	push	ecx
	call	_dyntab_order_lines
	add	esp, 4
	test	eax, eax
	je	SHORT $L70263
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29872], OFFSET FLAT:$SG70265
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 83		; 00000053H
	jmp	$eva_err$70262
$L70263:

; 84   : 	CTRL_ATTR_TAB(keytype, KEY_TYPE);

	lea	ecx, DWORD PTR _keytype$[ebp]
	push	ecx
	call	_dyntab_free
	add	esp, 4
	push	0
	push	-1
	push	OFFSET FLAT:$SG70268
	mov	edx, DWORD PTR _ctrl$[ebp]
	add	edx, 44					; 0000002cH
	push	edx
	push	0
	lea	eax, DWORD PTR _keytype$[ebp]
	push	eax
	call	_dyntab_filter_field
	add	esp, 24					; 00000018H
	test	eax, eax
	je	SHORT $L70267
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29872], OFFSET FLAT:$SG70270
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 84		; 00000054H
	jmp	$eva_err$70262
$L70267:
	lea	eax, DWORD PTR _keytype$[ebp]
	push	eax
	call	_dyntab_order_lines
	add	esp, 4
	test	eax, eax
	je	SHORT $L70271
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29872], OFFSET FLAT:$SG70273
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 84		; 00000054H
	jmp	$eva_err$70262
$L70271:

; 85   : 	CTRL_ATTR_TAB(keymsg, KEY_MSG);

	lea	eax, DWORD PTR _keymsg$[ebp]
	push	eax
	call	_dyntab_free
	add	esp, 4
	push	0
	push	-1
	push	OFFSET FLAT:$SG70276
	mov	ecx, DWORD PTR _ctrl$[ebp]
	add	ecx, 44					; 0000002cH
	push	ecx
	push	0
	lea	edx, DWORD PTR _keymsg$[ebp]
	push	edx
	call	_dyntab_filter_field
	add	esp, 24					; 00000018H
	test	eax, eax
	je	SHORT $L70275
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29872], OFFSET FLAT:$SG70278
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 85		; 00000055H
	jmp	$eva_err$70262
$L70275:
	lea	edx, DWORD PTR _keymsg$[ebp]
	push	edx
	call	_dyntab_order_lines
	add	esp, 4
	test	eax, eax
	je	SHORT $L70279
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29872], OFFSET FLAT:$SG70281
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 85		; 00000055H
	jmp	$eva_err$70262
$L70279:

; 86   : 	CTRL_ATTR_TAB(keycond, KEY_COND);

	lea	edx, DWORD PTR _keycond$[ebp]
	push	edx
	call	_dyntab_free
	add	esp, 4
	push	0
	push	-1
	push	OFFSET FLAT:$SG70284
	mov	eax, DWORD PTR _ctrl$[ebp]
	add	eax, 44					; 0000002cH
	push	eax
	push	0
	lea	ecx, DWORD PTR _keycond$[ebp]
	push	ecx
	call	_dyntab_filter_field
	add	esp, 24					; 00000018H
	test	eax, eax
	je	SHORT $L70283
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29872], OFFSET FLAT:$SG70286
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 86		; 00000056H
	jmp	$eva_err$70262
$L70283:
	lea	ecx, DWORD PTR _keycond$[ebp]
	push	ecx
	call	_dyntab_order_lines
	add	esp, 4
	test	eax, eax
	je	SHORT $L70287
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29872], OFFSET FLAT:$SG70289
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 86		; 00000056H
	jmp	$eva_err$70262
$L70287:

; 87   : 
; 88   : 	/* For each key (group of fields on same line) */
; 89   : 	for(i = 0; i < keyfields.nbrows; i++)

	mov	DWORD PTR _i$[ebp], 0
	jmp	SHORT $L70290
$L70291:
	mov	ecx, DWORD PTR _i$[ebp]
	add	ecx, 1
	mov	DWORD PTR _i$[ebp], ecx
$L70290:
	mov	edx, DWORD PTR _i$[ebp]
	cmp	edx, DWORD PTR _keyfields$[ebp]
	jae	$L70292

; 91   : 		/* Check key condition if any */
; 92   : 		int b_error;
; 93   : 		char *ktype = dyntab_val(&keytype, i, 0);

	push	0
	mov	eax, DWORD PTR _i$[ebp]
	push	eax
	lea	ecx, DWORD PTR _keytype$[ebp]
	push	ecx
	call	_dyntab_val
	add	esp, 12					; 0000000cH
	mov	DWORD PTR _ktype$70294[ebp], eax

; 94   : 		DynTableCell *c = dyntab_cell(&keycond, i, 0);

	push	0
	mov	edx, DWORD PTR _i$[ebp]
	push	edx
	lea	eax, DWORD PTR _keycond$[ebp]
	push	eax
	call	_dyntab_cell
	add	esp, 12					; 0000000cH
	mov	DWORD PTR _c$70295[ebp], eax

; 95   : 		if(c && c->txt && c->len)

	cmp	DWORD PTR _c$70295[ebp], 0
	je	$L70306
	mov	ecx, DWORD PTR _c$70295[ebp]
	cmp	DWORD PTR [ecx], 0
	je	$L70306
	mov	edx, DWORD PTR _c$70295[ebp]
	cmp	DWORD PTR [edx+4], 0
	je	$L70306

; 97   : 			if(ctrl_eval_fieldexpr(cntxt, ctrl, &data, c->txt)) CLEAR_ERROR;

	mov	eax, DWORD PTR _c$70295[ebp]
	mov	ecx, DWORD PTR [eax]
	push	ecx
	lea	edx, DWORD PTR _data$[ebp]
	push	edx
	mov	eax, DWORD PTR _ctrl$[ebp]
	push	eax
	mov	ecx, DWORD PTR _cntxt$[ebp]
	push	ecx
	call	_ctrl_eval_fieldexpr
	add	esp, 16					; 00000010H
	test	eax, eax
	je	SHORT $L70297
	push	97					; 00000061H
	push	OFFSET FLAT:$SG70298
	push	OFFSET FLAT:$SG70299
	mov	edx, DWORD PTR _cntxt$[ebp]
	push	edx
	call	_err_clear
	add	esp, 16					; 00000010H
$L70297:

; 98   : 			for(j = 0; j < data.nbrows; j++)

	mov	DWORD PTR _j$[ebp], 0
	jmp	SHORT $L70300
$L70301:
	mov	eax, DWORD PTR _j$[ebp]
	add	eax, 1
	mov	DWORD PTR _j$[ebp], eax
$L70300:
	mov	ecx, DWORD PTR _j$[ebp]
	cmp	ecx, DWORD PTR _data$[ebp]
	jae	SHORT $L70302

; 100  : 				char *v = dyntab_val(&data, j, 0);

	push	0
	mov	edx, DWORD PTR _j$[ebp]
	push	edx
	lea	eax, DWORD PTR _data$[ebp]
	push	eax
	call	_dyntab_val
	add	esp, 12					; 0000000cH
	mov	DWORD PTR _v$70303[ebp], eax

; 101  : 				if(*v && strcmp("0", v)) break;

	mov	ecx, DWORD PTR _v$70303[ebp]
	movsx	edx, BYTE PTR [ecx]
	test	edx, edx
	je	SHORT $L70304
	mov	eax, DWORD PTR _v$70303[ebp]
	push	eax
	push	OFFSET FLAT:$SG70305
	call	_strcmp
	add	esp, 8
	test	eax, eax
	je	SHORT $L70304
	jmp	SHORT $L70302
$L70304:

; 102  : 			}

	jmp	SHORT $L70301
$L70302:

; 103  : 
; 104  : 			/* Skip key if condition not matched */
; 105  : 			if(j >= data.nbrows) continue;

	mov	ecx, DWORD PTR _j$[ebp]
	cmp	ecx, DWORD PTR _data$[ebp]
	jb	SHORT $L70306
	jmp	$L70291
$L70306:

; 107  : 
; 108  : 		/* Initialize filter with FORMSTAMP condition */
; 109  : 		qry_build_free(&flt);

	lea	edx, DWORD PTR _flt$[ebp]
	push	edx
	call	_qry_build_free
	add	esp, 4

; 110  : 		dyntab_free(&field);

	lea	eax, DWORD PTR _field$[ebp]
	push	eax
	call	_dyntab_free
	add	esp, 4

; 111  : 		M_FREE(msg);

	mov	ecx, DWORD PTR _msg$[ebp]
	push	ecx
	call	_mem_free
	add	esp, 4
	mov	DWORD PTR _msg$[ebp], 0

; 112  : 		DYNTAB_ADD_TXTID(&field, 0, 0, "_EVA_FORMSTAMP", cntxt->val_FORMSTAMP);

	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	eax, DWORD PTR [edx+269636]
	mov	DWORD PTR _id$70307[ebp], eax
	mov	DWORD PTR _row$70308[ebp], 0
	mov	DWORD PTR _col$70309[ebp], 0
	push	0
	push	0
	push	14					; 0000000eH
	push	OFFSET FLAT:$SG70313
	mov	ecx, DWORD PTR _col$70309[ebp]
	push	ecx
	mov	edx, DWORD PTR _row$70308[ebp]
	push	edx
	lea	eax, DWORD PTR _field$[ebp]
	push	eax
	call	_dyntab_add
	add	esp, 28					; 0000001cH
	test	eax, eax
	je	SHORT $L70312
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29872], OFFSET FLAT:$SG70315
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 112		; 00000070H
	jmp	$eva_err$70262
$L70312:
	mov	eax, DWORD PTR _col$70309[ebp]
	push	eax
	mov	ecx, DWORD PTR _row$70308[ebp]
	push	ecx
	lea	edx, DWORD PTR _field$[ebp]
	push	edx
	call	_dyntab_cell
	add	esp, 12					; 0000000cH
	mov	DWORD PTR __c$70310[ebp], eax
	mov	eax, DWORD PTR __c$70310[ebp]
	mov	ecx, DWORD PTR _id$70307[ebp]
	mov	DWORD PTR [eax+32], ecx

; 113  : 		dyntab_free(&value);

	lea	edx, DWORD PTR _value$[ebp]
	push	edx
	call	_dyntab_free
	add	esp, 4

; 114  : 		if(form->id_formsave)

	mov	eax, DWORD PTR _form$[ebp]
	cmp	DWORD PTR [eax+80], 0
	je	SHORT $L70320

; 115  : 			DYNTAB_ADD_INT(&value, 0, 0, form->id_formsave)

	mov	BYTE PTR __tmp$70317[ebp], 0
	mov	ecx, 7
	xor	eax, eax
	lea	edi, DWORD PTR __tmp$70317[ebp+1]
	rep stosd
	stosw
	stosb
	mov	ecx, DWORD PTR _form$[ebp]
	mov	edx, DWORD PTR [ecx+80]
	push	edx
	push	OFFSET FLAT:$SG70318
	lea	eax, DWORD PTR __tmp$70317[ebp]
	push	eax
	call	_sprintf
	add	esp, 12					; 0000000cH
	push	0
	push	0
	push	0
	lea	ecx, DWORD PTR __tmp$70317[ebp]
	push	ecx
	push	0
	push	0
	lea	edx, DWORD PTR _value$[ebp]
	push	edx
	call	_dyntab_add
	add	esp, 28					; 0000001cH
	test	eax, eax
	je	SHORT $L70320
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29872], OFFSET FLAT:$SG70322
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 115		; 00000073H
	jmp	$eva_err$70262
$L70320:

; 116  : 		if(qry_add_filter(cntxt, &flt, RelNone, &field, RelList, &value)) STACK_ERROR;

	lea	edx, DWORD PTR _value$[ebp]
	push	edx
	push	3
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
	je	SHORT $L70323
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 116		; 00000074H
	jmp	$eva_err$70262
$L70323:

; 117  : 
; 118  : 		/* Build query for each key field */
; 119  : 		for(j = 0; j < keyfields.nbcols; j++)

	mov	DWORD PTR _j$[ebp], 0
	jmp	SHORT $L70324
$L70325:
	mov	ecx, DWORD PTR _j$[ebp]
	add	ecx, 1
	mov	DWORD PTR _j$[ebp], ecx
$L70324:
	mov	edx, DWORD PTR _j$[ebp]
	cmp	edx, DWORD PTR _keyfields$[ebp+8]
	jae	$L70326

; 120  : 			if(dyntab_sz(&keyfields, i, j))

	mov	eax, DWORD PTR _j$[ebp]
	push	eax
	mov	ecx, DWORD PTR _i$[ebp]
	push	ecx
	lea	edx, DWORD PTR _keyfields$[ebp]
	push	edx
	call	_dyntab_sz
	add	esp, 12					; 0000000cH
	test	eax, eax
	je	$L70354

; 122  : 			char *fld;
; 123  : 			MatchMode match = Like;

	mov	DWORD PTR _match$70329[ebp], 9

; 124  : 
; 125  : 			/* Check field type on 1st field - multiple fields of same type are allowed */
; 126  : 			dyntab_from_list(&field, DYNTAB_VAL_SZ(&keyfields, i, j), ",", 0, 2);

	push	2
	push	0
	push	OFFSET FLAT:$SG70330
	mov	eax, DWORD PTR _j$[ebp]
	push	eax
	mov	ecx, DWORD PTR _i$[ebp]
	push	ecx
	lea	edx, DWORD PTR _keyfields$[ebp]
	push	edx
	call	_dyntab_sz
	add	esp, 12					; 0000000cH
	push	eax
	mov	eax, DWORD PTR _j$[ebp]
	push	eax
	mov	ecx, DWORD PTR _i$[ebp]
	push	ecx
	lea	edx, DWORD PTR _keyfields$[ebp]
	push	edx
	call	_dyntab_val
	add	esp, 12					; 0000000cH
	push	eax
	lea	eax, DWORD PTR _field$[ebp]
	push	eax
	call	_dyntab_from_list
	add	esp, 24					; 00000018H

; 127  : 			fld = dyntab_val(&field, 0, 0);

	push	0
	push	0
	lea	ecx, DWORD PTR _field$[ebp]
	push	ecx
	call	_dyntab_val
	add	esp, 12					; 0000000cH
	mov	DWORD PTR _fld$70328[ebp], eax

; 128  : 
; 129  : 			/* Check field type - search input control in form */
; 130  : 			for(k = 0; k < form->nb_ctrl && strcmp(fld, form->ctrl[k].FIELD); k++);

	mov	DWORD PTR _k$[ebp], 0
	jmp	SHORT $L70331
$L70332:
	mov	edx, DWORD PTR _k$[ebp]
	add	edx, 1
	mov	DWORD PTR _k$[ebp], edx
$L70331:
	mov	eax, DWORD PTR _form$[ebp]
	mov	ecx, DWORD PTR _k$[ebp]
	cmp	ecx, DWORD PTR [eax+4]
	jae	SHORT $L70333
	mov	edx, DWORD PTR _k$[ebp]
	imul	edx, 480				; 000001e0H
	mov	eax, DWORD PTR _form$[ebp]
	mov	ecx, DWORD PTR [eax]
	mov	edx, DWORD PTR [ecx+edx+280]
	push	edx
	mov	eax, DWORD PTR _fld$70328[ebp]
	push	eax
	call	_strcmp
	add	esp, 8
	test	eax, eax
	je	SHORT $L70333
	jmp	SHORT $L70332
$L70333:

; 131  : 
; 132  : 			/* Handle message for key */
; 133  : 			if(msg) DYNBUF_ADD_STR(&msg, ", ");

	cmp	DWORD PTR _msg$[ebp], 0
	je	SHORT $L70336
	push	0
	push	0
	push	2
	push	OFFSET FLAT:$SG70337
	lea	ecx, DWORD PTR _msg$[ebp]
	push	ecx
	call	_dynbuf_add
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L70336
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29872], OFFSET FLAT:$SG70339
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 133		; 00000085H
	jmp	$eva_err$70262
$L70336:

; 134  : 			DYNBUF_ADD(&msg, k < form->nb_ctrl ? ctrl[k].LABEL : dyntab_val(&keyfields, i, j), 0, NO_CONV);

	mov	ecx, DWORD PTR _form$[ebp]
	mov	edx, DWORD PTR _k$[ebp]
	cmp	edx, DWORD PTR [ecx+4]
	jae	SHORT $L71032
	mov	eax, DWORD PTR _k$[ebp]
	imul	eax, 480				; 000001e0H
	mov	ecx, DWORD PTR _ctrl$[ebp]
	mov	edx, DWORD PTR [ecx+eax+284]
	mov	DWORD PTR -5792+[ebp], edx
	jmp	SHORT $L71033
$L71032:
	mov	eax, DWORD PTR _j$[ebp]
	push	eax
	mov	ecx, DWORD PTR _i$[ebp]
	push	ecx
	lea	edx, DWORD PTR _keyfields$[ebp]
	push	edx
	call	_dyntab_val
	add	esp, 12					; 0000000cH
	mov	DWORD PTR -5792+[ebp], eax
$L71033:
	push	0
	push	0
	push	0
	mov	eax, DWORD PTR -5792+[ebp]
	push	eax
	lea	ecx, DWORD PTR _msg$[ebp]
	push	ecx
	call	_dynbuf_add
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L70341
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29872], OFFSET FLAT:$SG70343
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 134		; 00000086H
	jmp	$eva_err$70262
$L70341:

; 135  : 
; 136  : 			/* If control is a relation : use appropriate match mode */
; 137  : 			if(k < form->nb_ctrl && !strcmp(form->ctrl[k].TYPE, "_EVA_RELATION")) match = RelList;

	mov	ecx, DWORD PTR _form$[ebp]
	mov	edx, DWORD PTR _k$[ebp]
	cmp	edx, DWORD PTR [ecx+4]
	jae	SHORT $L70344
	push	OFFSET FLAT:$SG70345
	mov	eax, DWORD PTR _k$[ebp]
	imul	eax, 480				; 000001e0H
	mov	ecx, DWORD PTR _form$[ebp]
	mov	edx, DWORD PTR [ecx]
	mov	eax, DWORD PTR [edx+eax+276]
	push	eax
	call	_strcmp
	add	esp, 8
	test	eax, eax
	jne	SHORT $L70344
	mov	DWORD PTR _match$70329[ebp], 3
$L70344:

; 138  : 
; 139  : 			/* Read values for fields */
; 140  : 			if(form_get_field_values(cntxt, &value, dyntab_val(&keyfields, i, j), DYNTAB_TOUL(&form->id_form), DYNTAB_TOUL(&form->id_obj))) STACK_ERROR;

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
	mov	eax, DWORD PTR _j$[ebp]
	push	eax
	mov	ecx, DWORD PTR _i$[ebp]
	push	ecx
	lea	edx, DWORD PTR _keyfields$[ebp]
	push	edx
	call	_dyntab_val
	add	esp, 12					; 0000000cH
	push	eax
	lea	eax, DWORD PTR _value$[ebp]
	push	eax
	mov	ecx, DWORD PTR _cntxt$[ebp]
	push	ecx
	call	_form_get_field_values
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L70348
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 140		; 0000008cH
	jmp	$eva_err$70262
$L70348:

; 141  : 
; 142  : 			/* Handle empty value */
; 143  : 			if(!value.nbrows)

	cmp	DWORD PTR _value$[ebp], 0
	jne	SHORT $L70353

; 145  : 				/* Ignore value if primary key */
; 146  : 				if(!*ktype || !strcmp(ktype, "_EVA_KEY")) continue;

	mov	eax, DWORD PTR _ktype$70294[ebp]
	movsx	ecx, BYTE PTR [eax]
	test	ecx, ecx
	je	SHORT $L70351
	push	OFFSET FLAT:$SG70352
	mov	edx, DWORD PTR _ktype$70294[ebp]
	push	edx
	call	_strcmp
	add	esp, 8
	test	eax, eax
	jne	SHORT $L70350
$L70351:
	jmp	$L70325
$L70350:

; 149  : 					/* Ignore key else */
; 150  : 					flt.nbnode = 0;

	mov	DWORD PTR _flt$[ebp+4424], 0

; 151  : 					break;

	jmp	SHORT $L70326
$L70353:

; 154  : 
; 155  : 			/* Add filter node for values */
; 156  : 			if(qry_add_filter(cntxt, &flt, RelNone, &field, match, &value)) STACK_ERROR;

	lea	eax, DWORD PTR _value$[ebp]
	push	eax
	mov	ecx, DWORD PTR _match$70329[ebp]
	push	ecx
	lea	edx, DWORD PTR _field$[ebp]
	push	edx
	push	0
	lea	eax, DWORD PTR _flt$[ebp]
	push	eax
	mov	ecx, DWORD PTR _cntxt$[ebp]
	push	ecx
	call	_qry_add_filter
	add	esp, 24					; 00000018H
	test	eax, eax
	je	SHORT $L70354
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 156		; 0000009cH
	jmp	$eva_err$70262
$L70354:

; 158  : 
; 159  : 		/* Ignore key if no field */
; 160  : 		if(flt.nbnode < 2) continue;

	jmp	$L70325
$L70326:
	cmp	DWORD PTR _flt$[ebp+4424], 2
	jae	SHORT $L70355
	jmp	$L70291
$L70355:

; 161  : 
; 162  : 		/* Exclude current object if not new */
; 163  : 		if(dyntab_sz(&form->id_obj, 0, 0))

	push	0
	push	0
	mov	eax, DWORD PTR _form$[ebp]
	add	eax, 32					; 00000020H
	push	eax
	call	_dyntab_sz
	add	esp, 12					; 0000000cH
	test	eax, eax
	je	SHORT $L70358

; 164  : 			DYNBUF_ADD3_CELL(&flt.where, "TLink0.IdObj<>", &form->id_obj, 0, 0, NO_CONV, "");

	push	0
	push	OFFSET FLAT:$SG70359
	push	0
	push	0
	push	0
	push	0
	mov	ecx, DWORD PTR _form$[ebp]
	add	ecx, 32					; 00000020H
	push	ecx
	call	_dyntab_sz
	add	esp, 12					; 0000000cH
	push	eax
	push	0
	push	0
	mov	edx, DWORD PTR _form$[ebp]
	add	edx, 32					; 00000020H
	push	edx
	call	_dyntab_val
	add	esp, 12					; 0000000cH
	push	eax
	push	14					; 0000000eH
	push	OFFSET FLAT:$SG70360
	lea	eax, DWORD PTR _flt$[ebp+40]
	push	eax
	call	_dynbuf_add3
	add	esp, 36					; 00000024H
	test	eax, eax
	je	SHORT $L70358
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29872], OFFSET FLAT:$SG70362
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 164		; 000000a4H
	jmp	$eva_err$70262
$L70358:

; 165  : 
; 166  : 		/* Handle message for keys */
; 167  : 		DYNTAB_ADD_BUF(&keymsg, i, 1, msg);

	cmp	DWORD PTR _msg$[ebp], 0
	je	SHORT $L70363
	mov	eax, DWORD PTR _msg$[ebp]
	cmp	DWORD PTR [eax+4], 0
	je	SHORT $L70363
	push	0
	push	0
	mov	ecx, DWORD PTR _msg$[ebp]
	mov	edx, DWORD PTR [ecx+4]
	push	edx
	mov	eax, DWORD PTR _msg$[ebp]
	add	eax, 8
	push	eax
	push	1
	mov	ecx, DWORD PTR _i$[ebp]
	push	ecx
	lea	edx, DWORD PTR _keymsg$[ebp]
	push	edx
	call	_dyntab_add
	add	esp, 28					; 0000001cH
	test	eax, eax
	je	SHORT $L70365
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29872], OFFSET FLAT:$SG70367
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 167		; 000000a7H
	jmp	$eva_err$70262
$L70365:
	jmp	SHORT $L70371
$L70363:
	push	0
	push	0
	push	0
	push	0
	push	1
	mov	edx, DWORD PTR _i$[ebp]
	push	edx
	lea	eax, DWORD PTR _keymsg$[ebp]
	push	eax
	call	_dyntab_add
	add	esp, 28					; 0000001cH
	test	eax, eax
	je	SHORT $L70371
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29872], OFFSET FLAT:$SG70373
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 167		; 000000a7H
	jmp	$eva_err$70262
$L70371:

; 168  : 
; 169  : 		/* Query for objects matching key filter & set error depending on result & error setting for key */
; 170  : 		if(qry_filter_objects(cntxt, &value, &flt)) STACK_ERROR;

	lea	eax, DWORD PTR _flt$[ebp]
	push	eax
	lea	ecx, DWORD PTR _value$[ebp]
	push	ecx
	mov	edx, DWORD PTR _cntxt$[ebp]
	push	edx
	call	_qry_filter_objects
	add	esp, 12					; 0000000cH
	test	eax, eax
	je	SHORT $L70374
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 170		; 000000aaH
	jmp	$eva_err$70262
$L70374:

; 171  : 		b_error = value.nbrows ? !strcmp(ktype, "_EVA_KEY_WARN") ? 1 : 6 : 0;

	cmp	DWORD PTR _value$[ebp], 0
	je	SHORT $L71034
	push	OFFSET FLAT:$SG70375
	mov	ecx, DWORD PTR _ktype$70294[ebp]
	push	ecx
	call	_strcmp
	add	esp, 8
	neg	eax
	sbb	eax, eax
	and	eax, 5
	add	eax, 1
	mov	DWORD PTR -5796+[ebp], eax
	jmp	SHORT $L71035
$L71034:
	mov	DWORD PTR -5796+[ebp], 0
$L71035:
	mov	edx, DWORD PTR -5796+[ebp]
	mov	DWORD PTR _b_error$70293[ebp], edx

; 172  : 		if(!b_error) continue;

	cmp	DWORD PTR _b_error$70293[ebp], 0
	jne	SHORT $L70376
	jmp	$L70291
$L70376:

; 173  : 		form->error |= b_error;

	mov	eax, DWORD PTR _form$[ebp]
	mov	ecx, DWORD PTR [eax+132]
	or	ecx, DWORD PTR _b_error$70293[ebp]
	mov	edx, DWORD PTR _form$[ebp]
	mov	DWORD PTR [edx+132], ecx

; 174  : 		dyntab_cell(&keyfields, i, 0)->col = b_error;

	push	0
	mov	eax, DWORD PTR _i$[ebp]
	push	eax
	lea	ecx, DWORD PTR _keyfields$[ebp]
	push	ecx
	call	_dyntab_cell
	add	esp, 12					; 0000000cH
	mov	edx, DWORD PTR _b_error$70293[ebp]
	mov	DWORD PTR [eax+56], edx

; 175  : 
; 176  : 		/* Add found objects to duplicates list */
; 177  : 		for(j = 0; j < value.nbrows; j++)

	mov	DWORD PTR _j$[ebp], 0
	jmp	SHORT $L70377
$L70378:
	mov	eax, DWORD PTR _j$[ebp]
	add	eax, 1
	mov	DWORD PTR _j$[ebp], eax
$L70377:
	mov	ecx, DWORD PTR _j$[ebp]
	cmp	ecx, DWORD PTR _value$[ebp]
	jae	$L70379

; 179  : 			/* Search object in duplicates */
; 180  : 			id = DYNTAB_TOULRC(&value, j, 0);

	push	10					; 0000000aH
	push	0
	push	0
	mov	edx, DWORD PTR _j$[ebp]
	push	edx
	lea	eax, DWORD PTR _value$[ebp]
	push	eax
	call	_dyntab_val
	add	esp, 12					; 0000000cH
	push	eax
	call	_strtoul
	add	esp, 12					; 0000000cH
	mov	DWORD PTR _id$[ebp], eax

; 181  : 			for(k = 0; k < duplicates.nbrows && dyntab_cmp(&duplicates, k, 0, &value, j, 0); k++);

	mov	DWORD PTR _k$[ebp], 0
	jmp	SHORT $L70381
$L70382:
	mov	ecx, DWORD PTR _k$[ebp]
	add	ecx, 1
	mov	DWORD PTR _k$[ebp], ecx
$L70381:
	mov	edx, DWORD PTR _k$[ebp]
	cmp	edx, DWORD PTR _duplicates$[ebp]
	jae	SHORT $L70383
	push	0
	mov	eax, DWORD PTR _j$[ebp]
	push	eax
	lea	ecx, DWORD PTR _value$[ebp]
	push	ecx
	push	0
	mov	edx, DWORD PTR _k$[ebp]
	push	edx
	lea	eax, DWORD PTR _duplicates$[ebp]
	push	eax
	call	_dyntab_cmp
	add	esp, 24					; 00000018H
	test	eax, eax
	je	SHORT $L70383
	jmp	SHORT $L70382
$L70383:

; 182  : 
; 183  : 			/* If object not found : add to duplicates */
; 184  : 			if(k == duplicates.nbrows) DYNTAB_ADD_CELL(&duplicates, k, 0, &value, j, 0);

	mov	ecx, DWORD PTR _k$[ebp]
	cmp	ecx, DWORD PTR _duplicates$[ebp]
	jne	SHORT $L70385
	push	1
	push	0
	mov	edx, DWORD PTR _j$[ebp]
	push	edx
	lea	eax, DWORD PTR _value$[ebp]
	push	eax
	call	_dyntab_cell
	add	esp, 12					; 0000000cH
	push	eax
	push	0
	mov	ecx, DWORD PTR _k$[ebp]
	push	ecx
	lea	edx, DWORD PTR _duplicates$[ebp]
	push	edx
	call	_dyntab_copy
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L70385
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29872], OFFSET FLAT:$SG70387
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 184		; 000000b8H
	jmp	$eva_err$70262
$L70385:

; 185  : 
; 186  : 			/* Associate key with duplicate */
; 187  : 			if(i) dyntab_add(&duplicates, k, i, NULL, 0, NO_CONV);

	cmp	DWORD PTR _i$[ebp], 0
	je	SHORT $L70388
	push	0
	push	0
	push	0
	push	0
	mov	edx, DWORD PTR _i$[ebp]
	push	edx
	mov	eax, DWORD PTR _k$[ebp]
	push	eax
	lea	ecx, DWORD PTR _duplicates$[ebp]
	push	ecx
	call	_dyntab_add
	add	esp, 28					; 0000001cH
$L70388:

; 188  : 			dyntab_cell(&duplicates, k, i)->IdObj = id;

	mov	edx, DWORD PTR _i$[ebp]
	push	edx
	mov	eax, DWORD PTR _k$[ebp]
	push	eax
	lea	ecx, DWORD PTR _duplicates$[ebp]
	push	ecx
	call	_dyntab_cell
	add	esp, 12					; 0000000cH
	mov	edx, DWORD PTR _id$[ebp]
	mov	DWORD PTR [eax+20], edx

; 189  : 		}

	jmp	$L70378
$L70379:

; 190  : 	}

	jmp	$L70291
$L70292:

; 191  : 
; 192  : 	/* Handle duplicates if applicable */
; 193  : 	if(duplicates.nbrows)

	cmp	DWORD PTR _duplicates$[ebp], 0
	je	$L70493

; 195  : 		int b_show_dup = !CTRL_ATTR_CELL(NO_DUPLICATE_DISPLAY);

	cmp	DWORD PTR _ctrl$[ebp], 0
	je	SHORT $L71036
	push	0
	push	-1
	push	OFFSET FLAT:$SG70394
	mov	eax, DWORD PTR _ctrl$[ebp]
	add	eax, 44					; 0000002cH
	push	eax
	call	_dyntab_field_cell
	add	esp, 16					; 00000010H
	mov	DWORD PTR -5800+[ebp], eax
	jmp	SHORT $L71037
$L71036:
	mov	DWORD PTR -5800+[ebp], 0
$L71037:
	xor	ecx, ecx
	cmp	DWORD PTR -5800+[ebp], 0
	sete	cl
	mov	DWORD PTR _b_show_dup$70392[ebp], ecx

; 196  : 		char printbuf[1024];
; 197  : 		char datecr[32] = {0}, *errtyp;

	mov	BYTE PTR _datecr$70396[ebp], 0
	mov	ecx, 7
	xor	eax, eax
	lea	edi, DWORD PTR _datecr$70396[ebp+1]
	rep stosd
	stosw
	stosb

; 198  : 
; 199  : 		/* Output table header for duplicates message */
; 200  : 		dynbuf_print3(form->html,
; 201  : 			"<table border=1 rules=rows cellspacing=0 cellpadding=5 width=100%% bgcolor=#FFFFFF>"
; 202  : 			"<tr><td colspan=2 align=center><font size=+1><font color=#%s><b>Doublons %s</b></font><br>"
; 203  : 			"<u>La fiche que vous voulez enregistrer %s</u></font></td></tr>",
; 204  : 			form->error & 4 ? "FF0000" : "FF8844",
; 205  : 			form->error & 4 ? "interdits" : "déconseillés",
; 206  : 			form->error & 4 ? "existe déjà" : "ressemble à d'autres fiches"
; 207  : 			);

	mov	edx, DWORD PTR _form$[ebp]
	mov	eax, DWORD PTR [edx+132]
	and	eax, 4
	test	eax, eax
	je	SHORT $L71038
	mov	DWORD PTR -5804+[ebp], OFFSET FLAT:$SG70399
	jmp	SHORT $L71039
$L71038:
	mov	DWORD PTR -5804+[ebp], OFFSET FLAT:$SG70400
$L71039:
	mov	ecx, DWORD PTR _form$[ebp]
	mov	edx, DWORD PTR [ecx+132]
	and	edx, 4
	test	edx, edx
	je	SHORT $L71040
	mov	DWORD PTR -5808+[ebp], OFFSET FLAT:$SG70401
	jmp	SHORT $L71041
$L71040:
	mov	DWORD PTR -5808+[ebp], OFFSET FLAT:$SG70402
$L71041:
	mov	eax, DWORD PTR _form$[ebp]
	mov	ecx, DWORD PTR [eax+132]
	and	ecx, 4
	test	ecx, ecx
	je	SHORT $L71042
	mov	DWORD PTR -5812+[ebp], OFFSET FLAT:$SG70403
	jmp	SHORT $L71043
$L71042:
	mov	DWORD PTR -5812+[ebp], OFFSET FLAT:$SG70404
$L71043:
	push	0
	push	0
	mov	edx, DWORD PTR -5804+[ebp]
	push	edx
	mov	eax, DWORD PTR -5808+[ebp]
	push	eax
	mov	ecx, DWORD PTR -5812+[ebp]
	push	ecx
	push	OFFSET FLAT:$SG70405
	push	1023					; 000003ffH
	lea	edx, DWORD PTR _printbuf$70395[ebp]
	push	edx
	call	__snprintf
	add	esp, 24					; 00000018H
	push	eax
	lea	eax, DWORD PTR _printbuf$70395[ebp]
	push	eax
	mov	ecx, DWORD PTR _form$[ebp]
	mov	edx, DWORD PTR [ecx+232]
	push	edx
	call	_dynbuf_add
	add	esp, 20					; 00000014H

; 208  : 
; 209  : 		/* Output keys & messages */
; 210  : 		for(i = 0; i < keyfields.nbrows; i++)

	mov	DWORD PTR _i$[ebp], 0
	jmp	SHORT $L70406
$L70407:
	mov	eax, DWORD PTR _i$[ebp]
	add	eax, 1
	mov	DWORD PTR _i$[ebp], eax
$L70406:
	mov	ecx, DWORD PTR _i$[ebp]
	cmp	ecx, DWORD PTR _keyfields$[ebp]
	jae	$L70408

; 212  : 			j = dyntab_cell(&keyfields, i, 0)->col;

	push	0
	mov	edx, DWORD PTR _i$[ebp]
	push	edx
	lea	eax, DWORD PTR _keyfields$[ebp]
	push	eax
	call	_dyntab_cell
	add	esp, 12					; 0000000cH
	mov	ecx, DWORD PTR [eax+56]
	mov	DWORD PTR _j$[ebp], ecx

; 213  : 			if(j)

	cmp	DWORD PTR _j$[ebp], 0
	je	$L70426

; 215  : 				errtyp = j & 4 ? "interdits" : "déconseillés";

	mov	edx, DWORD PTR _j$[ebp]
	and	edx, 4
	test	edx, edx
	je	SHORT $L71044
	mov	DWORD PTR -5816+[ebp], OFFSET FLAT:$SG70410
	jmp	SHORT $L71045
$L71044:
	mov	DWORD PTR -5816+[ebp], OFFSET FLAT:$SG70411
$L71045:
	mov	eax, DWORD PTR -5816+[ebp]
	mov	DWORD PTR _errtyp$70397[ebp], eax

; 216  : 				dynbuf_print(form->html, "<tr><td valign=top>Doublons %s sur le(s) champs <b><u>", errtyp);

	push	0
	push	0
	mov	ecx, DWORD PTR _errtyp$70397[ebp]
	push	ecx
	push	OFFSET FLAT:$SG70413
	push	1023					; 000003ffH
	lea	edx, DWORD PTR _printbuf$70395[ebp]
	push	edx
	call	__snprintf
	add	esp, 16					; 00000010H
	push	eax
	lea	eax, DWORD PTR _printbuf$70395[ebp]
	push	eax
	mov	ecx, DWORD PTR _form$[ebp]
	mov	edx, DWORD PTR [ecx+232]
	push	edx
	call	_dynbuf_add
	add	esp, 20					; 00000014H

; 217  : 				DYNBUF_ADD_CELL(form->html, &keymsg, i, 1, TO_HTML)

	push	1
	push	OFFSET FLAT:_plain_to_html
	push	1
	mov	eax, DWORD PTR _i$[ebp]
	push	eax
	lea	ecx, DWORD PTR _keymsg$[ebp]
	push	ecx
	call	_dyntab_sz
	add	esp, 12					; 0000000cH
	push	eax
	push	1
	mov	edx, DWORD PTR _i$[ebp]
	push	edx
	lea	eax, DWORD PTR _keymsg$[ebp]
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
	je	SHORT $L70414
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29872], OFFSET FLAT:$SG70416
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 217		; 000000d9H
	jmp	$eva_err$70262
$L70414:

; 218  : 				DYNBUF_ADD_STR(form->html, "</u></b></td><td valign=top><i>");

	push	0
	push	0
	push	31					; 0000001fH
	push	OFFSET FLAT:$SG70419
	mov	edx, DWORD PTR _form$[ebp]
	mov	eax, DWORD PTR [edx+232]
	push	eax
	call	_dynbuf_add
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L70418
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29872], OFFSET FLAT:$SG70421
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 218		; 000000daH
	jmp	$eva_err$70262
$L70418:

; 219  : 				DYNBUF_ADD_CELL(form->html, &keymsg, i, 0, TO_HTML)

	push	1
	push	OFFSET FLAT:_plain_to_html
	push	0
	mov	eax, DWORD PTR _i$[ebp]
	push	eax
	lea	ecx, DWORD PTR _keymsg$[ebp]
	push	ecx
	call	_dyntab_sz
	add	esp, 12					; 0000000cH
	push	eax
	push	0
	mov	edx, DWORD PTR _i$[ebp]
	push	edx
	lea	eax, DWORD PTR _keymsg$[ebp]
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
	je	SHORT $L70422
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29872], OFFSET FLAT:$SG70424
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 219		; 000000dbH
	jmp	$eva_err$70262
$L70422:

; 220  : 				DYNBUF_ADD_STR(form->html, "</i></td></tr>");

	push	0
	push	0
	push	14					; 0000000eH
	push	OFFSET FLAT:$SG70427
	mov	edx, DWORD PTR _form$[ebp]
	mov	eax, DWORD PTR [edx+232]
	push	eax
	call	_dynbuf_add
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L70426
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29872], OFFSET FLAT:$SG70429
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 220		; 000000dcH
	jmp	$eva_err$70262
$L70426:

; 222  : 		}

	jmp	$L70407
$L70408:

; 223  : 		dynbuf_print3(form->html, "</table><p align=center>Il y a %lu fiche%s qui ressemble%s à celle que vous voulez enregistrer</p>",
; 224  : 			duplicates.nbrows, duplicates.nbrows > 1 ? "s" : "", duplicates.nbrows > 1 ? "nt" : "");

	cmp	DWORD PTR _duplicates$[ebp], 1
	jbe	SHORT $L71046
	mov	DWORD PTR -5820+[ebp], OFFSET FLAT:$SG70431
	jmp	SHORT $L71047
$L71046:
	mov	DWORD PTR -5820+[ebp], OFFSET FLAT:$SG70432
$L71047:
	cmp	DWORD PTR _duplicates$[ebp], 1
	jbe	SHORT $L71048
	mov	DWORD PTR -5824+[ebp], OFFSET FLAT:$SG70433
	jmp	SHORT $L71049
$L71048:
	mov	DWORD PTR -5824+[ebp], OFFSET FLAT:$SG70434
$L71049:
	push	0
	push	0
	mov	eax, DWORD PTR -5820+[ebp]
	push	eax
	mov	ecx, DWORD PTR -5824+[ebp]
	push	ecx
	mov	edx, DWORD PTR _duplicates$[ebp]
	push	edx
	push	OFFSET FLAT:$SG70435
	push	1023					; 000003ffH
	lea	eax, DWORD PTR _printbuf$70395[ebp]
	push	eax
	call	__snprintf
	add	esp, 24					; 00000018H
	push	eax
	lea	ecx, DWORD PTR _printbuf$70395[ebp]
	push	ecx
	mov	edx, DWORD PTR _form$[ebp]
	mov	eax, DWORD PTR [edx+232]
	push	eax
	call	_dynbuf_add
	add	esp, 20					; 00000014H

; 225  : 
; 226  : 		/* If output duplicates objects  */
; 227  : 		if(b_show_dup)

	cmp	DWORD PTR _b_show_dup$70392[ebp], 0
	je	$L70493

; 230  : 										"<th>Ouvrir</th><th>Fiche</th><th>Création</th><th>Doublon sur le(s) champs</th></tr>");

	push	0
	push	0
	push	140					; 0000008cH
	push	OFFSET FLAT:$SG70439
	mov	ecx, DWORD PTR _form$[ebp]
	mov	edx, DWORD PTR [ecx+232]
	push	edx
	call	_dynbuf_add
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L70438
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29872], OFFSET FLAT:$SG70441
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 230		; 000000e6H
	jmp	$eva_err$70262
$L70438:

; 231  : 			for(i = 0; i < duplicates.nbrows; i++)

	mov	DWORD PTR _i$[ebp], 0
	jmp	SHORT $L70442
$L70443:
	mov	edx, DWORD PTR _i$[ebp]
	add	edx, 1
	mov	DWORD PTR _i$[ebp], edx
$L70442:
	mov	eax, DWORD PTR _i$[ebp]
	cmp	eax, DWORD PTR _duplicates$[ebp]
	jae	$L70444

; 233  : 				c = dyntab_cell(&duplicates, i, 0);

	push	0
	mov	ecx, DWORD PTR _i$[ebp]
	push	ecx
	lea	edx, DWORD PTR _duplicates$[ebp]
	push	edx
	call	_dyntab_cell
	add	esp, 12					; 0000000cH
	mov	DWORD PTR _c$[ebp], eax

; 234  : 				id = strtoul(c->txt, NULL, 10);

	push	10					; 0000000aH
	push	0
	mov	eax, DWORD PTR _c$[ebp]
	mov	ecx, DWORD PTR [eax]
	push	ecx
	call	_strtoul
	add	esp, 12					; 0000000cH
	mov	DWORD PTR _id$[ebp], eax

; 235  : 
; 236  : 				/* Add object open button */
; 237  : 				DYNBUF_ADD_STR(form->html, "<tr>");

	push	0
	push	0
	push	4
	push	OFFSET FLAT:$SG70448
	mov	edx, DWORD PTR _form$[ebp]
	mov	eax, DWORD PTR [edx+232]
	push	eax
	call	_dynbuf_add
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L70447
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29872], OFFSET FLAT:$SG70450
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 237		; 000000edH
	jmp	$eva_err$70262
$L70447:

; 238  : 				if(qry_obj_idfield(cntxt, &data, id, 0) ||
; 239  : 					ctrl_add_symbol_btn(cntxt, ctrl, c, &data, 0, "", "SYMBOL+LABEL+OBJNOTES"))

	push	0
	mov	eax, DWORD PTR _id$[ebp]
	push	eax
	lea	ecx, DWORD PTR _data$[ebp]
	push	ecx
	mov	edx, DWORD PTR _cntxt$[ebp]
	push	edx
	call	_qry_obj_idfield
	add	esp, 16					; 00000010H
	test	eax, eax
	jne	SHORT $L70452
	push	OFFSET FLAT:$SG70453
	push	OFFSET FLAT:$SG70454
	push	0
	lea	eax, DWORD PTR _data$[ebp]
	push	eax
	mov	ecx, DWORD PTR _c$[ebp]
	push	ecx
	mov	edx, DWORD PTR _ctrl$[ebp]
	push	edx
	mov	eax, DWORD PTR _cntxt$[ebp]
	push	eax
	call	_ctrl_add_symbol_btn
	add	esp, 28					; 0000001cH
	test	eax, eax
	je	SHORT $L70451
$L70452:

; 240  : 					STACK_ERROR;

	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 240		; 000000f0H
	jmp	$eva_err$70262
$L70451:

; 241  : 
; 242  : 				/* Add object creation infos */
; 243  : 				if(form_eval_fieldexpr(cntxt, &data, 0, id, add_sz_str("_EVA_FORMSTAMP.DateCr"), NULL, 0)) STACK_ERROR;

	push	0
	push	0
	push	21					; 00000015H
	push	OFFSET FLAT:$SG70457
	mov	edx, DWORD PTR _id$[ebp]
	push	edx
	push	0
	lea	eax, DWORD PTR _data$[ebp]
	push	eax
	mov	ecx, DWORD PTR _cntxt$[ebp]
	push	ecx
	call	_form_eval_fieldexpr
	add	esp, 32					; 00000020H
	test	eax, eax
	je	SHORT $L70456
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 243		; 000000f3H
	jmp	$eva_err$70262
$L70456:

; 244  : 				datetxt_to_format(cntxt, datecr, dyntab_val(&data, 0, 0), "");

	push	OFFSET FLAT:$SG70458
	push	0
	push	0
	lea	eax, DWORD PTR _data$[ebp]
	push	eax
	call	_dyntab_val
	add	esp, 12					; 0000000cH
	push	eax
	lea	ecx, DWORD PTR _datecr$70396[ebp]
	push	ecx
	mov	edx, DWORD PTR _cntxt$[ebp]
	push	edx
	call	_datetxt_to_format
	add	esp, 16					; 00000010H

; 245  : 				if(*datecr)

	movsx	eax, BYTE PTR _datecr$70396[ebp]
	test	eax, eax
	je	$L70459

; 247  : 					if(form_eval_fieldexpr(cntxt, &data, 0, id, add_sz_str("_EVA_FORMSTAMP.IdWhoCr->_EVA_USERNAME"), NULL, 0)) STACK_ERROR;

	push	0
	push	0
	push	37					; 00000025H
	push	OFFSET FLAT:$SG70462
	mov	ecx, DWORD PTR _id$[ebp]
	push	ecx
	push	0
	lea	edx, DWORD PTR _data$[ebp]
	push	edx
	mov	eax, DWORD PTR _cntxt$[ebp]
	push	eax
	call	_form_eval_fieldexpr
	add	esp, 32					; 00000020H
	test	eax, eax
	je	SHORT $L70461
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 247		; 000000f7H
	jmp	$eva_err$70262
$L70461:

; 248  : 					dynbuf_print2(form->html, "</td><td valign=top><font size=-1><i>Fiche créée le %s par %s</i></font></td><td>",
; 249  : 									datecr, dyntab_val(&data, 0, 0));

	push	0
	push	0
	push	0
	push	0
	lea	edx, DWORD PTR _data$[ebp]
	push	edx
	call	_dyntab_val
	add	esp, 12					; 0000000cH
	push	eax
	lea	eax, DWORD PTR _datecr$70396[ebp]
	push	eax
	push	OFFSET FLAT:$SG70464
	push	1023					; 000003ffH
	lea	ecx, DWORD PTR _printbuf$70395[ebp]
	push	ecx
	call	__snprintf
	add	esp, 20					; 00000014H
	push	eax
	lea	edx, DWORD PTR _printbuf$70395[ebp]
	push	edx
	mov	eax, DWORD PTR _form$[ebp]
	mov	ecx, DWORD PTR [eax+232]
	push	ecx
	call	_dynbuf_add
	add	esp, 20					; 00000014H
$L70459:

; 251  : 
; 252  : 				/* Add associated keys */
; 253  : 				id = 0;

	mov	DWORD PTR _id$[ebp], 0

; 254  : 				for(j = 0; j < keyfields.nbrows; j++)

	mov	DWORD PTR _j$[ebp], 0
	jmp	SHORT $L70465
$L70466:
	mov	edx, DWORD PTR _j$[ebp]
	add	edx, 1
	mov	DWORD PTR _j$[ebp], edx
$L70465:
	mov	eax, DWORD PTR _j$[ebp]
	cmp	eax, DWORD PTR _keyfields$[ebp]
	jae	$L70467

; 256  : 					c = dyntab_cell(&duplicates, i, j);

	mov	ecx, DWORD PTR _j$[ebp]
	push	ecx
	mov	edx, DWORD PTR _i$[ebp]
	push	edx
	lea	eax, DWORD PTR _duplicates$[ebp]
	push	eax
	call	_dyntab_cell
	add	esp, 12					; 0000000cH
	mov	DWORD PTR _c$[ebp], eax

; 257  : 					if(c && c->IdObj)

	cmp	DWORD PTR _c$[ebp], 0
	je	$L70483
	mov	ecx, DWORD PTR _c$[ebp]
	cmp	DWORD PTR [ecx+20], 0
	je	$L70483

; 259  : 						if(id) DYNBUF_ADD_STR(form->html, " + ");

	cmp	DWORD PTR _id$[ebp], 0
	je	SHORT $L70471
	push	0
	push	0
	push	3
	push	OFFSET FLAT:$SG70472
	mov	edx, DWORD PTR _form$[ebp]
	mov	eax, DWORD PTR [edx+232]
	push	eax
	call	_dynbuf_add
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L70471
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29872], OFFSET FLAT:$SG70474
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 259		; 00000103H
	jmp	$eva_err$70262
$L70471:

; 260  : 						id = dyntab_cell(&keyfields, j, 0)->col;

	push	0
	mov	eax, DWORD PTR _j$[ebp]
	push	eax
	lea	ecx, DWORD PTR _keyfields$[ebp]
	push	ecx
	call	_dyntab_cell
	add	esp, 12					; 0000000cH
	mov	edx, DWORD PTR [eax+56]
	mov	DWORD PTR _id$[ebp], edx

; 261  : 						dynbuf_print(form->html, "<font color=%s><b>", id & 4 ? "FF0000" : "FF8844");

	mov	eax, DWORD PTR _id$[ebp]
	and	eax, 4
	test	eax, eax
	je	SHORT $L71050
	mov	DWORD PTR -5828+[ebp], OFFSET FLAT:$SG70476
	jmp	SHORT $L71051
$L71050:
	mov	DWORD PTR -5828+[ebp], OFFSET FLAT:$SG70477
$L71051:
	push	0
	push	0
	mov	ecx, DWORD PTR -5828+[ebp]
	push	ecx
	push	OFFSET FLAT:$SG70478
	push	1023					; 000003ffH
	lea	edx, DWORD PTR _printbuf$70395[ebp]
	push	edx
	call	__snprintf
	add	esp, 16					; 00000010H
	push	eax
	lea	eax, DWORD PTR _printbuf$70395[ebp]
	push	eax
	mov	ecx, DWORD PTR _form$[ebp]
	mov	edx, DWORD PTR [ecx+232]
	push	edx
	call	_dynbuf_add
	add	esp, 20					; 00000014H

; 262  : 						DYNBUF_ADD_CELL(form->html, &keymsg, j, 1, TO_HTML)

	push	1
	push	OFFSET FLAT:_plain_to_html
	push	1
	mov	eax, DWORD PTR _j$[ebp]
	push	eax
	lea	ecx, DWORD PTR _keymsg$[ebp]
	push	ecx
	call	_dyntab_sz
	add	esp, 12					; 0000000cH
	push	eax
	push	1
	mov	edx, DWORD PTR _j$[ebp]
	push	edx
	lea	eax, DWORD PTR _keymsg$[ebp]
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
	je	SHORT $L70479
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29872], OFFSET FLAT:$SG70481
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 262		; 00000106H
	jmp	$eva_err$70262
$L70479:

; 263  : 						DYNBUF_ADD_STR(form->html, "</b></font>");

	push	0
	push	0
	push	11					; 0000000bH
	push	OFFSET FLAT:$SG70484
	mov	edx, DWORD PTR _form$[ebp]
	mov	eax, DWORD PTR [edx+232]
	push	eax
	call	_dynbuf_add
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L70483
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29872], OFFSET FLAT:$SG70486
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 263		; 00000107H
	jmp	$eva_err$70262
$L70483:

; 265  : 				}

	jmp	$L70466
$L70467:

; 266  : 				DYNBUF_ADD_STR(form->html, "</td></tr>");

	push	0
	push	0
	push	10					; 0000000aH
	push	OFFSET FLAT:$SG70489
	mov	eax, DWORD PTR _form$[ebp]
	mov	ecx, DWORD PTR [eax+232]
	push	ecx
	call	_dynbuf_add
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L70488
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29872], OFFSET FLAT:$SG70491
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 266		; 0000010aH
	jmp	SHORT $eva_err$70262
$L70488:

; 267  : 			}

	jmp	$L70443
$L70444:

; 268  : 			DYNBUF_ADD_STR(form->html, "</table>");

	push	0
	push	0
	push	8
	push	OFFSET FLAT:$SG70494
	mov	ecx, DWORD PTR _form$[ebp]
	mov	edx, DWORD PTR [ecx+232]
	push	edx
	call	_dynbuf_add
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L70493
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29872], OFFSET FLAT:$SG70496
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 268		; 0000010cH
	jmp	SHORT $eva_err$70262
$L70493:

; 271  : 	form->html = html;

	mov	edx, DWORD PTR _form$[ebp]
	mov	eax, DWORD PTR _html$[ebp]
	mov	DWORD PTR [edx+232], eax
$eva_noerr$70497:

; 272  : 
; 273  : 	RETURN_OK_CLEANUP;

	push	0
	push	OFFSET FLAT:$SG70498
	push	OFFSET FLAT:$SG70499
	mov	ecx, DWORD PTR _cntxt$[ebp]
	push	ecx
	call	_err_clear
	add	esp, 16					; 00000010H
$eva_err$70262:
	mov	edx, DWORD PTR _cntxt$[ebp]
	cmp	DWORD PTR [edx+29872], 0
	je	SHORT $L70500
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	ecx, DWORD PTR [eax+29900]
	push	ecx
	push	OFFSET FLAT:$SG70501
	push	OFFSET FLAT:$SG70502
	mov	edx, DWORD PTR _cntxt$[ebp]
	push	edx
	call	_err_add_context
	add	esp, 16					; 00000010H
$L70500:
	lea	eax, DWORD PTR _keyfields$[ebp]
	push	eax
	call	_dyntab_free
	add	esp, 4
	lea	ecx, DWORD PTR _keytype$[ebp]
	push	ecx
	call	_dyntab_free
	add	esp, 4
	lea	edx, DWORD PTR _keymsg$[ebp]
	push	edx
	call	_dyntab_free
	add	esp, 4
	lea	eax, DWORD PTR _field$[ebp]
	push	eax
	call	_dyntab_free
	add	esp, 4
	lea	ecx, DWORD PTR _value$[ebp]
	push	ecx
	call	_dyntab_free
	add	esp, 4
	lea	edx, DWORD PTR _duplicates$[ebp]
	push	edx
	call	_dyntab_free
	add	esp, 4
	lea	eax, DWORD PTR _data$[ebp]
	push	eax
	call	_dyntab_free
	add	esp, 4
	mov	ecx, DWORD PTR _msg$[ebp]
	push	ecx
	call	_mem_free
	add	esp, 4
	mov	DWORD PTR _msg$[ebp], 0
	lea	edx, DWORD PTR _flt$[ebp]
	push	edx
	call	_qry_build_free
	add	esp, 4
	mov	eax, DWORD PTR _cntxt$[ebp]
	xor	ecx, ecx
	cmp	DWORD PTR [eax+29872], 0
	setne	cl
	mov	eax, ecx

; 274  : }

	pop	edi
	mov	esp, ebp
	pop	ebp
	ret	0
_form_check_keys ENDP
_TEXT	ENDS
PUBLIC	_form_save
EXTRN	_cgi_set_field_values:NEAR
EXTRN	_cgi_build_basename:NEAR
EXTRN	_sscanf:NEAR
EXTRN	_cgi_filter_values:NEAR
EXTRN	_cgi_clear_form_inputs:NEAR
EXTRN	_cgi_add_input:NEAR
EXTRN	_form_status_data:NEAR
EXTRN	_form_tab_selection:NEAR
EXTRN	_ctrl_read_baseobj:NEAR
EXTRN	_qry_add_obj_field_val:NEAR
EXTRN	_ctrl_add_child:NEAR
EXTRN	_qry_cache_idobj_field:NEAR
EXTRN	_qry_uncache_idobj:NEAR
_DATA	SEGMENT
$SG70525 DB	'%lu', 00H
$SG70526 DB	'_EVA_FORMSTAMP', 00H
	ORG $+1
$SG70538 DB	'/', 00H
	ORG $+2
$SG70542 DB	'%lu.%lu', 00H
$SG70546 DB	'_EVA_CONTROL', 00H
	ORG $+3
$SG70548 DB	'_EVA_INPUT', 00H
	ORG $+1
$SG70551 DB	'_EVA_FIELD', 00H
	ORG $+1
$SG70553 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70556 DB	'_EVA_BUTTON', 00H
$SG70559 DB	'_EVA_NEWOBJ_FIELD', 00H
	ORG $+2
$SG70561 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70567 DB	'%lu', 00H
$SG70571 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70575 DB	'STATUS', 00H
	ORG $+1
$SG70579 DB	'%lx%n', 00H
	ORG $+2
$SG70580 DB	'%lx', 00H
$SG70583 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70599 DB	'D:\Travail\ABI\EVA\V4.0\CGI\Brunix-2016\form_save.c', 00H
$SG70600 DB	'form_save', 00H
	ORG $+2
$SG70602 DB	'D:\Travail\ABI\EVA\V4.0\CGI\Brunix-2016\form_save.c', 00H
$SG70603 DB	'form_save', 00H
_DATA	ENDS
_TEXT	SEGMENT
_cntxt$ = 8
_form$ = -4
_idform$ = -76
_idobj$ = -12
_cgival$ = -72
_id_obj$ = -52
_srcctrl$ = -32
_buf$ = -8
_txt$70523 = -108
_cgi$70529 = -136
_b_alt$70530 = -128
_idobj0$70532 = -124
_idform0$70533 = -140
_idctrl$70534 = -116
_num$70535 = -132
_line$70536 = -112
_ctrltyp$70537 = -120
_fld$70564 = -148
_c$70565 = -144
__tmp$70566 = -180
_sts$70577 = -184
_len$70578 = -188
_i$70586 = -192
_form_save PROC NEAR

; 289  : ){

	push	ebp
	mov	ebp, esp
	sub	esp, 216				; 000000d8H
	push	edi

; 290  : 	EVA_form *form = cntxt->form;

	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	ecx, DWORD PTR [eax+80]
	mov	DWORD PTR _form$[ebp], ecx

; 291  : 	unsigned long idform = DYNTAB_TOUL(&cntxt->form->id_form);

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
	mov	DWORD PTR _idform$[ebp], eax

; 292  : 	unsigned long idobj = DYNTAB_TOUL(&cntxt->form->id_obj);

	push	10					; 0000000aH
	push	0
	push	0
	push	0
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	edx, DWORD PTR [ecx+80]
	add	edx, 32					; 00000020H
	push	edx
	call	_dyntab_val
	add	esp, 12					; 0000000cH
	push	eax
	call	_strtoul
	add	esp, 12					; 0000000cH
	mov	DWORD PTR _idobj$[ebp], eax

; 293  : 	DynTable cgival = {0};

	mov	DWORD PTR _cgival$[ebp], 0
	xor	eax, eax
	mov	DWORD PTR _cgival$[ebp+4], eax
	mov	DWORD PTR _cgival$[ebp+8], eax
	mov	DWORD PTR _cgival$[ebp+12], eax
	mov	DWORD PTR _cgival$[ebp+16], eax

; 294  : 	DynTable id_obj = {0};

	mov	DWORD PTR _id_obj$[ebp], 0
	xor	ecx, ecx
	mov	DWORD PTR _id_obj$[ebp+4], ecx
	mov	DWORD PTR _id_obj$[ebp+8], ecx
	mov	DWORD PTR _id_obj$[ebp+12], ecx
	mov	DWORD PTR _id_obj$[ebp+16], ecx

; 295  : 	DynTable srcctrl = {0};

	mov	DWORD PTR _srcctrl$[ebp], 0
	xor	edx, edx
	mov	DWORD PTR _srcctrl$[ebp+4], edx
	mov	DWORD PTR _srcctrl$[ebp+8], edx
	mov	DWORD PTR _srcctrl$[ebp+12], edx
	mov	DWORD PTR _srcctrl$[ebp+16], edx

; 296  : 	DynBuffer *buf = NULL;

	mov	DWORD PTR _buf$[ebp], 0

; 297  : 
; 298  : 	/* Call handler in save mode for all controls & add form stamp */
; 299  : 	form->step = FormSave;

	mov	eax, DWORD PTR _form$[ebp]
	mov	DWORD PTR [eax+176], 1

; 300  : 	if(ctrl_add_child(cntxt, 0, NULL)) STACK_ERROR;

	push	0
	push	0
	mov	ecx, DWORD PTR _cntxt$[ebp]
	push	ecx
	call	_ctrl_add_child
	add	esp, 12					; 0000000cH
	test	eax, eax
	je	SHORT $L70520
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 300		; 0000012cH
	jmp	$eva_err$70521
$L70520:

; 301  : 	if(form->id_formsave)

	mov	eax, DWORD PTR _form$[ebp]
	cmp	DWORD PTR [eax+80], 0
	je	SHORT $L70524

; 303  : 		char txt[32];
; 304  : 		if(qry_add_obj_field_val(cntxt, &form->id_obj, "_EVA_FORMSTAMP",
; 305  : 								txt, snprintf(add_sz_str(txt), "%lu", form->id_formsave), 1, 0)) STACK_ERROR;

	push	0
	push	1
	mov	ecx, DWORD PTR _form$[ebp]
	mov	edx, DWORD PTR [ecx+80]
	push	edx
	push	OFFSET FLAT:$SG70525
	push	31					; 0000001fH
	lea	eax, DWORD PTR _txt$70523[ebp]
	push	eax
	call	__snprintf
	add	esp, 16					; 00000010H
	push	eax
	lea	ecx, DWORD PTR _txt$70523[ebp]
	push	ecx
	push	OFFSET FLAT:$SG70526
	mov	edx, DWORD PTR _form$[ebp]
	add	edx, 32					; 00000020H
	push	edx
	mov	eax, DWORD PTR _cntxt$[ebp]
	push	eax
	call	_qry_add_obj_field_val
	add	esp, 28					; 0000001cH
	test	eax, eax
	je	SHORT $L70524
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 305		; 00000131H
	jmp	$eva_err$70521
$L70524:

; 307  : 	idobj = DYNTAB_TOUL(&cntxt->form->id_obj);

	push	10					; 0000000aH
	push	0
	push	0
	push	0
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	eax, DWORD PTR [edx+80]
	add	eax, 32					; 00000020H
	push	eax
	call	_dyntab_val
	add	esp, 12					; 0000000cH
	push	eax
	call	_strtoul
	add	esp, 12					; 0000000cH
	mov	DWORD PTR _idobj$[ebp], eax

; 308  : 
; 309  : 	/* Handle new obj storage in caller : look for storage field */
; 310  : 	if(form->b_newobj)

	mov	ecx, DWORD PTR _form$[ebp]
	cmp	DWORD PTR [ecx+72], 0
	je	$L70584

; 312  : 		/* Retrieve caller data */
; 313  : 		CGIData *cgi = cntxt->cgi + cntxt->cgibtn;

	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	eax, DWORD PTR [edx+29656]
	imul	eax, 56					; 00000038H
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	edx, DWORD PTR [ecx+29648]
	add	edx, eax
	mov	DWORD PTR _cgi$70529[ebp], edx

; 314  : 		int b_alt = !dyntab_cmp(&cntxt->alt_form, 0, 0, &cntxt->form->id_form, 0, 0) &&
; 315  : 					DYNTAB_TOUL(&cntxt->alt_obj) == 0;

	push	0
	push	0
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	ecx, DWORD PTR [eax+80]
	add	ecx, 12					; 0000000cH
	push	ecx
	push	0
	push	0
	mov	edx, DWORD PTR _cntxt$[ebp]
	add	edx, 40					; 00000028H
	push	edx
	call	_dyntab_cmp
	add	esp, 24					; 00000018H
	test	eax, eax
	jne	SHORT $L71054
	push	10					; 0000000aH
	push	0
	push	0
	push	0
	mov	eax, DWORD PTR _cntxt$[ebp]
	add	eax, 60					; 0000003cH
	push	eax
	call	_dyntab_val
	add	esp, 12					; 0000000cH
	push	eax
	call	_strtoul
	add	esp, 12					; 0000000cH
	test	eax, eax
	jne	SHORT $L71054
	mov	DWORD PTR -196+[ebp], 1
	jmp	SHORT $L71055
$L71054:
	mov	DWORD PTR -196+[ebp], 0
$L71055:
	mov	ecx, DWORD PTR -196+[ebp]
	mov	DWORD PTR _b_alt$70530[ebp], ecx

; 316  : 		unsigned long idobj0, idform0, idctrl, num = 0, line = 0;

	mov	DWORD PTR _num$70535[ebp], 0
	mov	DWORD PTR _line$70536[ebp], 0

; 317  : 		char *ctrltyp;
; 318  : 		dyntab_from_list(&cgival, DYNTAB_VAL_SZ(&form->call_data, 0, 0), "/", 0, 6);

	push	6
	push	0
	push	OFFSET FLAT:$SG70538
	push	0
	push	0
	mov	edx, DWORD PTR _form$[ebp]
	add	edx, 88					; 00000058H
	push	edx
	call	_dyntab_sz
	add	esp, 12					; 0000000cH
	push	eax
	push	0
	push	0
	mov	eax, DWORD PTR _form$[ebp]
	add	eax, 88					; 00000058H
	push	eax
	call	_dyntab_val
	add	esp, 12					; 0000000cH
	push	eax
	lea	ecx, DWORD PTR _cgival$[ebp]
	push	ecx
	call	_dyntab_from_list
	add	esp, 24					; 00000018H

; 319  : 		idform0 = DYNTAB_TOULRC(&cgival, 0, 0);

	push	10					; 0000000aH
	push	0
	push	0
	push	0
	lea	edx, DWORD PTR _cgival$[ebp]
	push	edx
	call	_dyntab_val
	add	esp, 12					; 0000000cH
	push	eax
	call	_strtoul
	add	esp, 12					; 0000000cH
	mov	DWORD PTR _idform0$70533[ebp], eax

; 320  : 		idobj0 = DYNTAB_TOULRC(&cgival, 1, 0);

	push	10					; 0000000aH
	push	0
	push	0
	push	1
	lea	eax, DWORD PTR _cgival$[ebp]
	push	eax
	call	_dyntab_val
	add	esp, 12					; 0000000cH
	push	eax
	call	_strtoul
	add	esp, 12					; 0000000cH
	mov	DWORD PTR _idobj0$70532[ebp], eax

; 321  : 		idctrl = DYNTAB_TOULRC(&cgival, 2, 0);

	push	10					; 0000000aH
	push	0
	push	0
	push	2
	lea	ecx, DWORD PTR _cgival$[ebp]
	push	ecx
	call	_dyntab_val
	add	esp, 12					; 0000000cH
	push	eax
	call	_strtoul
	add	esp, 12					; 0000000cH
	mov	DWORD PTR _idctrl$70534[ebp], eax

; 322  : 		sscanf(dyntab_val(&cgival, 3, 0), "%lu.%lu", &num, &line);

	lea	edx, DWORD PTR _line$70536[ebp]
	push	edx
	lea	eax, DWORD PTR _num$70535[ebp]
	push	eax
	push	OFFSET FLAT:$SG70542
	push	0
	push	3
	lea	ecx, DWORD PTR _cgival$[ebp]
	push	ecx
	call	_dyntab_val
	add	esp, 12					; 0000000cH
	push	eax
	call	_sscanf
	add	esp, 16					; 00000010H

; 323  : 
; 324  : 		/* Look for control type */
; 325  : 		if(qry_cache_idobj_field(cntxt, &srcctrl, idctrl, NULL, 0) || ctrl_read_baseobj(cntxt, &srcctrl)) STACK_ERROR;

	push	0
	push	0
	mov	edx, DWORD PTR _idctrl$70534[ebp]
	push	edx
	lea	eax, DWORD PTR _srcctrl$[ebp]
	push	eax
	mov	ecx, DWORD PTR _cntxt$[ebp]
	push	ecx
	call	_qry_cache_idobj_field
	add	esp, 20					; 00000014H
	test	eax, eax
	jne	SHORT $L70545
	lea	edx, DWORD PTR _srcctrl$[ebp]
	push	edx
	mov	eax, DWORD PTR _cntxt$[ebp]
	push	eax
	call	_ctrl_read_baseobj
	add	esp, 8
	test	eax, eax
	je	SHORT $L70544
$L70545:
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 325		; 00000145H
	jmp	$eva_err$70521
$L70544:

; 326  : 		ctrltyp = DYNTAB_FIELD_VAL(&srcctrl, CONTROL);

	push	0
	push	-1
	push	OFFSET FLAT:$SG70546
	lea	edx, DWORD PTR _srcctrl$[ebp]
	push	edx
	call	_dyntab_field_val
	add	esp, 16					; 00000010H
	mov	DWORD PTR _ctrltyp$70537[ebp], eax

; 327  : 		if(!strcmp(ctrltyp, "_EVA_INPUT"))

	push	OFFSET FLAT:$SG70548
	mov	eax, DWORD PTR _ctrltyp$70537[ebp]
	push	eax
	call	_strcmp
	add	esp, 8
	test	eax, eax
	jne	SHORT $L70547

; 329  : 			/* Relation : add new value (for relations direct add function) */
; 330  : 			DYNTAB_FIELD(&cgival, &srcctrl, FIELD);

	lea	ecx, DWORD PTR _cgival$[ebp]
	push	ecx
	call	_dyntab_free
	add	esp, 4
	push	0
	push	-1
	push	OFFSET FLAT:$SG70551
	lea	edx, DWORD PTR _srcctrl$[ebp]
	push	edx
	push	0
	lea	eax, DWORD PTR _cgival$[ebp]
	push	eax
	call	_dyntab_filter_field
	add	esp, 24					; 00000018H
	test	eax, eax
	je	SHORT $L70550
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29872], OFFSET FLAT:$SG70553
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 330		; 0000014aH
	jmp	$eva_err$70521
$L70550:

; 332  : 		else if(!strcmp(ctrltyp, "_EVA_BUTTON"))

	jmp	SHORT $L70562
$L70547:
	push	OFFSET FLAT:$SG70556
	mov	eax, DWORD PTR _ctrltyp$70537[ebp]
	push	eax
	call	_strcmp
	add	esp, 8
	test	eax, eax
	jne	SHORT $L70555

; 334  : 			/* Button : look for storage field for new objects */
; 335  : 			DYNTAB_FIELD(&cgival, &srcctrl, NEWOBJ_FIELD);

	lea	ecx, DWORD PTR _cgival$[ebp]
	push	ecx
	call	_dyntab_free
	add	esp, 4
	push	0
	push	-1
	push	OFFSET FLAT:$SG70559
	lea	edx, DWORD PTR _srcctrl$[ebp]
	push	edx
	push	0
	lea	eax, DWORD PTR _cgival$[ebp]
	push	eax
	call	_dyntab_filter_field
	add	esp, 24					; 00000018H
	test	eax, eax
	je	SHORT $L70558
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29872], OFFSET FLAT:$SG70561
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 335		; 0000014fH
	jmp	$eva_err$70521
$L70558:

; 337  : 		else

	jmp	SHORT $L70562
$L70555:

; 338  : 			dyntab_free(&cgival);

	lea	eax, DWORD PTR _cgival$[ebp]
	push	eax
	call	_dyntab_free
	add	esp, 4
$L70562:

; 339  : 
; 340  : 		/* Storage field found : add new value with object id */
; 341  : 		if(dyntab_sz(&cgival, 0, 0))

	push	0
	push	0
	lea	ecx, DWORD PTR _cgival$[ebp]
	push	ecx
	call	_dyntab_sz
	add	esp, 12					; 0000000cH
	test	eax, eax
	je	$L70576

; 343  : 			DynTableCell *fld = dyntab_cell(&cgival, 0, 0);

	push	0
	push	0
	lea	edx, DWORD PTR _cgival$[ebp]
	push	edx
	call	_dyntab_cell
	add	esp, 12					; 0000000cH
	mov	DWORD PTR _fld$70564[ebp], eax

; 344  : 			DynTableCell *c;
; 345  : 			DYNTAB_ADD_INT(&id_obj, 0, 0, idobj);

	mov	BYTE PTR __tmp$70566[ebp], 0
	mov	ecx, 7
	xor	eax, eax
	lea	edi, DWORD PTR __tmp$70566[ebp+1]
	rep stosd
	stosw
	stosb
	mov	eax, DWORD PTR _idobj$[ebp]
	push	eax
	push	OFFSET FLAT:$SG70567
	lea	ecx, DWORD PTR __tmp$70566[ebp]
	push	ecx
	call	_sprintf
	add	esp, 12					; 0000000cH
	push	0
	push	0
	push	0
	lea	edx, DWORD PTR __tmp$70566[ebp]
	push	edx
	push	0
	push	0
	lea	eax, DWORD PTR _id_obj$[ebp]
	push	eax
	call	_dyntab_add
	add	esp, 28					; 0000001cH
	test	eax, eax
	je	SHORT $L70569
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29872], OFFSET FLAT:$SG70571
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 345		; 00000159H
	jmp	$eva_err$70521
$L70569:

; 346  : 			c = dyntab_cell(&id_obj, 0, 0);

	push	0
	push	0
	lea	eax, DWORD PTR _id_obj$[ebp]
	push	eax
	call	_dyntab_cell
	add	esp, 12					; 0000000cH
	mov	DWORD PTR _c$70565[ebp], eax

; 347  : 			c->Line = line;

	mov	ecx, DWORD PTR _c$70565[ebp]
	mov	edx, DWORD PTR _line$70536[ebp]
	mov	DWORD PTR [ecx+40], edx

; 348  : 			c->Num = num;

	mov	eax, DWORD PTR _c$70565[ebp]
	mov	ecx, DWORD PTR _num$70535[ebp]
	mov	DWORD PTR [eax+36], ecx

; 349  : 			if(cgi_set_field_values(cntxt, idform0, idobj0, fld->txt, fld->len, &id_obj, NULL, 0))

	push	0
	push	0
	lea	edx, DWORD PTR _id_obj$[ebp]
	push	edx
	mov	eax, DWORD PTR _fld$70564[ebp]
	mov	ecx, DWORD PTR [eax+4]
	push	ecx
	mov	edx, DWORD PTR _fld$70564[ebp]
	mov	eax, DWORD PTR [edx]
	push	eax
	mov	ecx, DWORD PTR _idobj0$70532[ebp]
	push	ecx
	mov	edx, DWORD PTR _idform0$70533[ebp]
	push	edx
	mov	eax, DWORD PTR _cntxt$[ebp]
	push	eax
	call	_cgi_set_field_values
	add	esp, 32					; 00000020H
	test	eax, eax
	je	SHORT $L70573

; 350  : 				STACK_ERROR;

	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 350		; 0000015eH
	jmp	$eva_err$70521
$L70573:

; 351  : 			cgi = cntxt->cgi + cntxt->cgibtn;

	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	eax, DWORD PTR [edx+29656]
	imul	eax, 56					; 00000038H
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	edx, DWORD PTR [ecx+29648]
	add	edx, eax
	mov	DWORD PTR _cgi$70529[ebp], edx

; 352  : 
; 353  : 			/* Handle control status : close search */
; 354  : 			if(cgi_filter_values(cntxt, &cgival, 'D', ~0UL,  idform0, idobj0, fld->txt, "STATUS", 0, 0)) STACK_ERROR;

	push	0
	push	0
	push	OFFSET FLAT:$SG70575
	mov	eax, DWORD PTR _fld$70564[ebp]
	mov	ecx, DWORD PTR [eax]
	push	ecx
	mov	edx, DWORD PTR _idobj0$70532[ebp]
	push	edx
	mov	eax, DWORD PTR _idform0$70533[ebp]
	push	eax
	push	-1
	push	68					; 00000044H
	lea	ecx, DWORD PTR _cgival$[ebp]
	push	ecx
	mov	edx, DWORD PTR _cntxt$[ebp]
	push	edx
	call	_cgi_filter_values
	add	esp, 40					; 00000028H
	test	eax, eax
	je	SHORT $L70574
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 354		; 00000162H
	jmp	$eva_err$70521
$L70574:

; 355  : 			if(cgival.nbrows)

	cmp	DWORD PTR _cgival$[ebp], 0
	je	SHORT $L70576

; 357  : 				unsigned long sts = 0;

	mov	DWORD PTR _sts$70577[ebp], 0

; 358  : 				int len = 0;

	mov	DWORD PTR _len$70578[ebp], 0

; 359  : 				sscanf(cgival.cell->txt, "%lx%n", &sts, &len);

	lea	ecx, DWORD PTR _len$70578[ebp]
	push	ecx
	lea	edx, DWORD PTR _sts$70577[ebp]
	push	edx
	push	OFFSET FLAT:$SG70579
	mov	eax, DWORD PTR _cgival$[ebp+16]
	mov	ecx, DWORD PTR [eax]
	push	ecx
	call	_sscanf
	add	esp, 16					; 00000010H

; 360  : 				snprintf(cgival.cell->txt, len, "%lx", sts & ~(TblCtrl_opensearch | TblCtrl_opensel));

	mov	edx, DWORD PTR _sts$70577[ebp]
	and	edx, -545				; fffffddfH
	push	edx
	push	OFFSET FLAT:$SG70580
	mov	eax, DWORD PTR _len$70578[ebp]
	push	eax
	mov	ecx, DWORD PTR _cgival$[ebp+16]
	mov	edx, DWORD PTR [ecx]
	push	edx
	call	__snprintf
	add	esp, 16					; 00000010H
$L70576:

; 363  : 
; 364  : 		/* Update new object id in context (main form or alt) */
; 365  : 		DYNTAB_ADD_CELL(b_alt ? &cntxt->alt_obj : &cntxt->id_obj, 0, 0, &form->id_obj, 0, 0);

	cmp	DWORD PTR _b_alt$70530[ebp], 0
	je	SHORT $L71056
	mov	eax, DWORD PTR _cntxt$[ebp]
	add	eax, 60					; 0000003cH
	mov	DWORD PTR -200+[ebp], eax
	jmp	SHORT $L71057
$L71056:
	mov	ecx, DWORD PTR _cntxt$[ebp]
	add	ecx, 20					; 00000014H
	mov	DWORD PTR -200+[ebp], ecx
$L71057:
	push	1
	push	0
	push	0
	mov	edx, DWORD PTR _form$[ebp]
	add	edx, 32					; 00000020H
	push	edx
	call	_dyntab_cell
	add	esp, 12					; 0000000cH
	push	eax
	push	0
	push	0
	mov	eax, DWORD PTR -200+[ebp]
	push	eax
	call	_dyntab_copy
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L70581
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29872], OFFSET FLAT:$SG70583
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 365		; 0000016dH
	jmp	$eva_err$70521
$L70581:

; 366  : 		if(cgi->name[0] == 'B' && !cgi->IdObj && cgi->IdForm == idform) cgi->IdObj = idobj;

	mov	eax, DWORD PTR _cgi$70529[ebp]
	mov	ecx, DWORD PTR [eax]
	movsx	edx, BYTE PTR [ecx]
	cmp	edx, 66					; 00000042H
	jne	SHORT $L70584
	mov	eax, DWORD PTR _cgi$70529[ebp]
	cmp	DWORD PTR [eax+24], 0
	jne	SHORT $L70584
	mov	ecx, DWORD PTR _cgi$70529[ebp]
	mov	edx, DWORD PTR [ecx+20]
	cmp	edx, DWORD PTR _idform$[ebp]
	jne	SHORT $L70584
	mov	eax, DWORD PTR _cgi$70529[ebp]
	mov	ecx, DWORD PTR _idobj$[ebp]
	mov	DWORD PTR [eax+24], ecx
$L70584:

; 368  : 
; 369  : 	/* Clear CGI form inputs */
; 370  : 	cgi_clear_form_inputs(cntxt, idform, form->b_newobj ? 0 : idobj, form->b_newobj ? 0 : 1);

	mov	edx, DWORD PTR _form$[ebp]
	xor	eax, eax
	cmp	DWORD PTR [edx+72], 0
	sete	al
	push	eax
	mov	ecx, DWORD PTR _form$[ebp]
	mov	edx, DWORD PTR [ecx+72]
	neg	edx
	sbb	edx, edx
	not	edx
	and	edx, DWORD PTR _idobj$[ebp]
	push	edx
	mov	eax, DWORD PTR _idform$[ebp]
	push	eax
	mov	ecx, DWORD PTR _cntxt$[ebp]
	push	ecx
	call	_cgi_clear_form_inputs
	add	esp, 16					; 00000010H

; 371  : 
; 372  : 	/* Handle new object */
; 373  : 	if(form->b_newobj)

	mov	edx, DWORD PTR _form$[ebp]
	cmp	DWORD PTR [edx+72], 0
	je	$L70585

; 375  : 		/* Rebuild CGI name && clear variables temp values */
; 376  : 		unsigned long i;
; 377  : 		for(i = 0; i < form->nb_ctrl; i++)

	mov	DWORD PTR _i$70586[ebp], 0
	jmp	SHORT $L70587
$L70588:
	mov	eax, DWORD PTR _i$70586[ebp]
	add	eax, 1
	mov	DWORD PTR _i$70586[ebp], eax
$L70587:
	mov	ecx, DWORD PTR _form$[ebp]
	mov	edx, DWORD PTR _i$70586[ebp]
	cmp	edx, DWORD PTR [ecx+4]
	jae	SHORT $L70589

; 378  : 			if(form->ctrl[i].cginame &&
; 379  : 				cgi_build_basename(cntxt, &form->ctrl[i].cginame, i, *form->ctrl[i].cginame->data))

	mov	eax, DWORD PTR _i$70586[ebp]
	imul	eax, 480				; 000001e0H
	mov	ecx, DWORD PTR _form$[ebp]
	mov	edx, DWORD PTR [ecx]
	cmp	DWORD PTR [edx+eax+40], 0
	je	SHORT $L70590
	mov	eax, DWORD PTR _i$70586[ebp]
	imul	eax, 480				; 000001e0H
	mov	ecx, DWORD PTR _form$[ebp]
	mov	edx, DWORD PTR [ecx]
	mov	eax, DWORD PTR [edx+eax+40]
	mov	cl, BYTE PTR [eax+8]
	push	ecx
	mov	edx, DWORD PTR _i$70586[ebp]
	push	edx
	mov	eax, DWORD PTR _i$70586[ebp]
	imul	eax, 480				; 000001e0H
	mov	ecx, DWORD PTR _form$[ebp]
	mov	edx, DWORD PTR [ecx]
	lea	eax, DWORD PTR [edx+eax+40]
	push	eax
	mov	ecx, DWORD PTR _cntxt$[ebp]
	push	ecx
	call	_cgi_build_basename
	add	esp, 16					; 00000010H
	test	eax, eax
	je	SHORT $L70590

; 380  : 				STACK_ERROR;

	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 380		; 0000017cH
	jmp	$eva_err$70521
$L70590:
	jmp	$L70588
$L70589:

; 381  : 		DYNTAB_FREE(form->varsvalues);

	mov	eax, DWORD PTR _form$[ebp]
	add	eax, 148				; 00000094H
	push	eax
	call	_dyntab_free
	add	esp, 4

; 383  : 	else

	jmp	SHORT $L70591
$L70585:

; 384  : 		qry_uncache_idobj(cntxt, idobj);

	mov	ecx, DWORD PTR _idobj$[ebp]
	push	ecx
	mov	edx, DWORD PTR _cntxt$[ebp]
	push	edx
	call	_qry_uncache_idobj
	add	esp, 8
$L70591:

; 385  : 	form->b_reload = 1;

	mov	eax, DWORD PTR _form$[ebp]
	mov	DWORD PTR [eax+140], 1

; 386  : 
; 387  : 	/* Keep selected tab & form status */
; 388  : 	if(form_tab_selection(cntxt, 0)) STACK_ERROR;

	push	0
	mov	ecx, DWORD PTR _cntxt$[ebp]
	push	ecx
	call	_form_tab_selection
	add	esp, 8
	test	eax, eax
	je	SHORT $L70592
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 388		; 00000184H
	jmp	$eva_err$70521
$L70592:

; 389  : 	form->step = HtmlEdit;

	mov	eax, DWORD PTR _form$[ebp]
	mov	DWORD PTR [eax+176], 4

; 390  : 	dyntab_free(&form->dlg_ctrl);

	mov	ecx, DWORD PTR _form$[ebp]
	add	ecx, 180				; 000000b4H
	push	ecx
	call	_dyntab_free
	add	esp, 4

; 391  : 	if(form_status_data(cntxt, &buf)) STACK_ERROR;

	lea	edx, DWORD PTR _buf$[ebp]
	push	edx
	mov	eax, DWORD PTR _cntxt$[ebp]
	push	eax
	call	_form_status_data
	add	esp, 8
	test	eax, eax
	je	SHORT $L70593
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 391		; 00000187H
	jmp	$eva_err$70521
$L70593:

; 392  : 	if(cgi_add_input(cntxt, NULL, DYNBUF_VAL_SZ(form->ctrl->cginame), DYNBUF_VAL_SZ(buf))) STACK_ERROR;

	cmp	DWORD PTR _buf$[ebp], 0
	je	SHORT $L71058
	mov	edx, DWORD PTR _buf$[ebp]
	mov	eax, DWORD PTR [edx+4]
	mov	DWORD PTR -204+[ebp], eax
	jmp	SHORT $L71059
$L71058:
	mov	DWORD PTR -204+[ebp], 0
$L71059:
	cmp	DWORD PTR _buf$[ebp], 0
	je	SHORT $L71060
	mov	ecx, DWORD PTR _buf$[ebp]
	add	ecx, 8
	mov	DWORD PTR -208+[ebp], ecx
	jmp	SHORT $L71061
$L71060:
	mov	DWORD PTR -208+[ebp], 0
$L71061:
	mov	edx, DWORD PTR _form$[ebp]
	mov	eax, DWORD PTR [edx]
	cmp	DWORD PTR [eax+40], 0
	je	SHORT $L71062
	mov	ecx, DWORD PTR _form$[ebp]
	mov	edx, DWORD PTR [ecx]
	mov	eax, DWORD PTR [edx+40]
	mov	ecx, DWORD PTR [eax+4]
	mov	DWORD PTR -212+[ebp], ecx
	jmp	SHORT $L71063
$L71062:
	mov	DWORD PTR -212+[ebp], 0
$L71063:
	mov	edx, DWORD PTR _form$[ebp]
	mov	eax, DWORD PTR [edx]
	cmp	DWORD PTR [eax+40], 0
	je	SHORT $L71064
	mov	ecx, DWORD PTR _form$[ebp]
	mov	edx, DWORD PTR [ecx]
	mov	eax, DWORD PTR [edx+40]
	add	eax, 8
	mov	DWORD PTR -216+[ebp], eax
	jmp	SHORT $L71065
$L71064:
	mov	DWORD PTR -216+[ebp], 0
$L71065:
	mov	ecx, DWORD PTR -204+[ebp]
	push	ecx
	mov	edx, DWORD PTR -208+[ebp]
	push	edx
	mov	eax, DWORD PTR -212+[ebp]
	push	eax
	mov	ecx, DWORD PTR -216+[ebp]
	push	ecx
	push	0
	mov	edx, DWORD PTR _cntxt$[ebp]
	push	edx
	call	_cgi_add_input
	add	esp, 24					; 00000018H
	test	eax, eax
	je	SHORT $eva_noerr$70598
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 392		; 00000188H
	jmp	SHORT $eva_err$70521
$eva_noerr$70598:

; 393  : 
; 394  : 	RETURN_OK_CLEANUP;

	push	0
	push	OFFSET FLAT:$SG70599
	push	OFFSET FLAT:$SG70600
	mov	ecx, DWORD PTR _cntxt$[ebp]
	push	ecx
	call	_err_clear
	add	esp, 16					; 00000010H
$eva_err$70521:
	mov	edx, DWORD PTR _cntxt$[ebp]
	cmp	DWORD PTR [edx+29872], 0
	je	SHORT $L70601
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	ecx, DWORD PTR [eax+29900]
	push	ecx
	push	OFFSET FLAT:$SG70602
	push	OFFSET FLAT:$SG70603
	mov	edx, DWORD PTR _cntxt$[ebp]
	push	edx
	call	_err_add_context
	add	esp, 16					; 00000010H
$L70601:
	lea	eax, DWORD PTR _id_obj$[ebp]
	push	eax
	call	_dyntab_free
	add	esp, 4
	lea	ecx, DWORD PTR _cgival$[ebp]
	push	ecx
	call	_dyntab_free
	add	esp, 4
	lea	edx, DWORD PTR _srcctrl$[ebp]
	push	edx
	call	_dyntab_free
	add	esp, 4
	mov	eax, DWORD PTR _buf$[ebp]
	push	eax
	call	_mem_free
	add	esp, 4
	mov	DWORD PTR _buf$[ebp], 0
	mov	ecx, DWORD PTR _cntxt$[ebp]
	xor	eax, eax
	cmp	DWORD PTR [ecx+29872], 0
	setne	al

; 395  : }

	pop	edi
	mov	esp, ebp
	pop	ebp
	ret	0
_form_save ENDP
_TEXT	ENDS
PUBLIC	_form_save_dialog_end
EXTRN	_form_free_html:NEAR
EXTRN	_form_free:NEAR
EXTRN	_form_close_nosave:NEAR
EXTRN	_mem_alloc:NEAR
EXTRN	_memcpy:NEAR
EXTRN	_strncmp:NEAR
_DATA	SEGMENT
	ORG $+2
$SG70642 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70646 DB	'FORM', 00H
	ORG $+3
$SG70648 DB	'D:\Travail\ABI\EVA\V4.0\CGI\Brunix-2016\form_save.c', 00H
$SG70649 DB	'form_save_dialog_end', 00H
	ORG $+3
$SG70651 DB	'D:\Travail\ABI\EVA\V4.0\CGI\Brunix-2016\form_save.c', 00H
$SG70652 DB	'form_save_dialog_end', 00H
_DATA	ENDS
_TEXT	SEGMENT
_cntxt$ = 8
_actionbtn$ = 12
_form$ = -4
_i$ = -12
_buf$ = -8
_cgi$70635 = -16
_size$70637 = -20
_src$70638 = -24
_size1$70639 = -28
_form_save_dialog_end PROC NEAR

; 408  : ){

	push	ebp
	mov	ebp, esp
	sub	esp, 36					; 00000024H

; 409  : 	EVA_form *form = cntxt->form;

	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	ecx, DWORD PTR [eax+80]
	mov	DWORD PTR _form$[ebp], ecx

; 410  : 	unsigned long i;
; 411  : 	DynBuffer *buf = NULL;

	mov	DWORD PTR _buf$[ebp], 0

; 412  : 
; 413  : 	/* Process clicked buttton */
; 414  : 	switch(actionbtn)
; 415  : 	{

	mov	edx, DWORD PTR _actionbtn$[ebp]
	mov	DWORD PTR -32+[ebp], edx
	cmp	DWORD PTR -32+[ebp], 8
	je	SHORT $L70621
	cmp	DWORD PTR -32+[ebp], 16			; 00000010H
	je	$L70626
	jmp	$L70629
$L70621:

; 416  : 	case BUTN_CLOSE:
; 417  : 		/* Close form - return to previous */
; 418  : 		if(form_close_nosave(cntxt, DYNTAB_TOUL(&form->id_form),
; 419  : 									DYNTAB_TOUL(&form->id_obj),
; 420  : 									&form->call_data))

	mov	eax, DWORD PTR _form$[ebp]
	add	eax, 88					; 00000058H
	push	eax
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
	je	SHORT $L70624

; 421  : 			STACK_ERROR;

	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 421		; 000001a5H
	jmp	$eva_err$70625
$L70624:

; 422  : 		form_free(cntxt);

	mov	edx, DWORD PTR _cntxt$[ebp]
	push	edx
	call	_form_free
	add	esp, 4

; 423  : 		break;

	jmp	$L70618
$L70626:

; 424  : 
; 425  : 	case BUTN_RESTORE:
; 426  : 		/* Clear all CGI form data & set form reload flag */
; 427  : 		cgi_clear_form_inputs(cntxt, DYNTAB_TOUL(&form->id_form), DYNTAB_TOUL(&form->id_obj), 1);

	push	1
	push	10					; 0000000aH
	push	0
	push	0
	push	0
	mov	eax, DWORD PTR _form$[ebp]
	add	eax, 32					; 00000020H
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
	mov	ecx, DWORD PTR _form$[ebp]
	add	ecx, 12					; 0000000cH
	push	ecx
	call	_dyntab_val
	add	esp, 12					; 0000000cH
	push	eax
	call	_strtoul
	add	esp, 12					; 0000000cH
	push	eax
	mov	edx, DWORD PTR _cntxt$[ebp]
	push	edx
	call	_cgi_clear_form_inputs
	add	esp, 16					; 00000010H

; 428  : 		form->b_reload = 1;

	mov	eax, DWORD PTR _form$[ebp]
	mov	DWORD PTR [eax+140], 1
$L70629:

; 429  : 
; 430  : 	default:
; 431  : 		/* Restore edit mode */
; 432  : 		form->nextstep = form->prevstep < HtmlView ? HtmlEdit : form->prevstep;

	mov	ecx, DWORD PTR _form$[ebp]
	cmp	DWORD PTR [ecx+168], 6
	jge	SHORT $L71067
	mov	DWORD PTR -36+[ebp], 4
	jmp	SHORT $L71068
$L71067:
	mov	edx, DWORD PTR _form$[ebp]
	mov	eax, DWORD PTR [edx+168]
	mov	DWORD PTR -36+[ebp], eax
$L71068:
	mov	ecx, DWORD PTR _form$[ebp]
	mov	edx, DWORD PTR -36+[ebp]
	mov	DWORD PTR [ecx+172], edx

; 433  : 		form->step = form->nextstep;

	mov	eax, DWORD PTR _form$[ebp]
	mov	ecx, DWORD PTR _form$[ebp]
	mov	edx, DWORD PTR [ecx+172]
	mov	DWORD PTR [eax+176], edx

; 434  : 		dyntab_free(&form->dlg_ctrl);

	mov	eax, DWORD PTR _form$[ebp]
	add	eax, 180				; 000000b4H
	push	eax
	call	_dyntab_free
	add	esp, 4

; 435  : 		form_free_html(cntxt);

	mov	ecx, DWORD PTR _cntxt$[ebp]
	push	ecx
	call	_form_free_html
	add	esp, 4

; 436  : 
; 437  : 		/* Update form status in CGI data */
; 438  : 		for(i = 0; i < cntxt->nb_cgi && (!form->ctrl->cginame ||
; 439  : 				strcmp(form->ctrl->cginame->data, cntxt->cgi[i].name)); i++);

	mov	DWORD PTR _i$[ebp], 0
	jmp	SHORT $L70630
$L70631:
	mov	edx, DWORD PTR _i$[ebp]
	add	edx, 1
	mov	DWORD PTR _i$[ebp], edx
$L70630:
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	ecx, DWORD PTR _i$[ebp]
	cmp	ecx, DWORD PTR [eax+29652]
	jae	SHORT $L70632
	mov	edx, DWORD PTR _form$[ebp]
	mov	eax, DWORD PTR [edx]
	cmp	DWORD PTR [eax+40], 0
	je	SHORT $L70633
	mov	ecx, DWORD PTR _i$[ebp]
	imul	ecx, 56					; 00000038H
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	eax, DWORD PTR [edx+29648]
	mov	ecx, DWORD PTR [eax+ecx]
	push	ecx
	mov	edx, DWORD PTR _form$[ebp]
	mov	eax, DWORD PTR [edx]
	mov	ecx, DWORD PTR [eax+40]
	add	ecx, 8
	push	ecx
	call	_strcmp
	add	esp, 8
	test	eax, eax
	je	SHORT $L70632
$L70633:
	jmp	SHORT $L70631
$L70632:

; 440  : 		if(i < cntxt->nb_cgi)

	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	eax, DWORD PTR _i$[ebp]
	cmp	eax, DWORD PTR [edx+29652]
	jae	$L70634

; 442  : 			CGIData *cgi = cntxt->cgi + i;

	mov	ecx, DWORD PTR _i$[ebp]
	imul	ecx, 56					; 00000038H
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	eax, DWORD PTR [edx+29648]
	add	eax, ecx
	mov	DWORD PTR _cgi$70635[ebp], eax

; 443  : 			if(form_status_data(cntxt, &buf)) STACK_ERROR;

	lea	ecx, DWORD PTR _buf$[ebp]
	push	ecx
	mov	edx, DWORD PTR _cntxt$[ebp]
	push	edx
	call	_form_status_data
	add	esp, 8
	test	eax, eax
	je	SHORT $L70636
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 443		; 000001bbH
	jmp	$eva_err$70625
$L70636:

; 444  : 			M_FREE(cgi->value);

	mov	ecx, DWORD PTR _cgi$70635[ebp]
	mov	edx, DWORD PTR [ecx+8]
	push	edx
	call	_mem_free
	add	esp, 4
	mov	eax, DWORD PTR _cgi$70635[ebp]
	mov	DWORD PTR [eax+8], 0

; 445  : 			M_STRDUP(cgi->value, buf->data, buf->cnt);

	mov	ecx, DWORD PTR _buf$[ebp]
	mov	edx, DWORD PTR [ecx+4]
	mov	DWORD PTR _size$70637[ebp], edx
	mov	eax, DWORD PTR _buf$[ebp]
	add	eax, 8
	mov	DWORD PTR _src$70638[ebp], eax
	mov	ecx, DWORD PTR _size$70637[ebp]
	add	ecx, 1
	mov	DWORD PTR _size1$70639[ebp], ecx
	mov	edx, DWORD PTR _size1$70639[ebp]
	push	edx
	call	_mem_alloc
	add	esp, 4
	mov	ecx, DWORD PTR _cgi$70635[ebp]
	mov	DWORD PTR [ecx+8], eax
	cmp	DWORD PTR _size1$70639[ebp], 0
	je	SHORT $L70640
	mov	edx, DWORD PTR _cgi$70635[ebp]
	cmp	DWORD PTR [edx+8], 0
	jne	SHORT $L70640
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29872], OFFSET FLAT:$SG70642
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 445		; 000001bdH
	jmp	$eva_err$70625
$L70640:
	cmp	DWORD PTR _src$70638[ebp], 0
	je	SHORT $L70644
	cmp	DWORD PTR _size$70637[ebp], 0
	je	SHORT $L70644
	mov	edx, DWORD PTR _size$70637[ebp]
	push	edx
	mov	eax, DWORD PTR _src$70638[ebp]
	push	eax
	mov	ecx, DWORD PTR _cgi$70635[ebp]
	mov	edx, DWORD PTR [ecx+8]
	push	edx
	call	_memcpy
	add	esp, 12					; 0000000cH
$L70644:

; 446  : 			cgi->value_sz = buf->cnt;

	mov	eax, DWORD PTR _cgi$70635[ebp]
	mov	ecx, DWORD PTR _buf$[ebp]
	mov	edx, DWORD PTR [ecx+4]
	mov	DWORD PTR [eax+12], edx
$L70634:
$L70618:

; 449  : 	if(cntxt->cgi && cntxt->cgi[cntxt->cgibtn].subfield &&
; 450  : 		!strncmp(cntxt->cgi[cntxt->cgibtn].subfield, add_sz_str("FORM")))

	mov	eax, DWORD PTR _cntxt$[ebp]
	cmp	DWORD PTR [eax+29648], 0
	je	SHORT $eva_noerr$70647
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	edx, DWORD PTR [ecx+29656]
	imul	edx, 56					; 00000038H
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	ecx, DWORD PTR [eax+29648]
	cmp	DWORD PTR [ecx+edx+32], 0
	je	SHORT $eva_noerr$70647
	push	4
	push	OFFSET FLAT:$SG70646
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	eax, DWORD PTR [edx+29656]
	imul	eax, 56					; 00000038H
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	edx, DWORD PTR [ecx+29648]
	mov	eax, DWORD PTR [edx+eax+32]
	push	eax
	call	_strncmp
	add	esp, 12					; 0000000cH
	test	eax, eax
	jne	SHORT $eva_noerr$70647

; 451  : 			cntxt->cgi[cntxt->cgibtn].name[0] = 0;

	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	edx, DWORD PTR [ecx+29656]
	imul	edx, 56					; 00000038H
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	ecx, DWORD PTR [eax+29648]
	mov	edx, DWORD PTR [ecx+edx]
	mov	BYTE PTR [edx], 0
$eva_noerr$70647:

; 452  : 
; 453  : 	RETURN_OK_CLEANUP;

	push	0
	push	OFFSET FLAT:$SG70648
	push	OFFSET FLAT:$SG70649
	mov	eax, DWORD PTR _cntxt$[ebp]
	push	eax
	call	_err_clear
	add	esp, 16					; 00000010H
$eva_err$70625:
	mov	ecx, DWORD PTR _cntxt$[ebp]
	cmp	DWORD PTR [ecx+29872], 0
	je	SHORT $L70650
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	eax, DWORD PTR [edx+29900]
	push	eax
	push	OFFSET FLAT:$SG70651
	push	OFFSET FLAT:$SG70652
	mov	ecx, DWORD PTR _cntxt$[ebp]
	push	ecx
	call	_err_add_context
	add	esp, 16					; 00000010H
$L70650:
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

; 454  : }

	mov	esp, ebp
	pop	ebp
	ret	0
_form_save_dialog_end ENDP
_TEXT	ENDS
PUBLIC	_form_save_dialog_output
EXTRN	_put_html_button_sz:NEAR
EXTRN	_put_html_chkbox:NEAR
EXTRN	_ctrl_cgi_name:NEAR
_DATA	SEGMENT
	ORG $+3
$SG70672 DB	'</font> - ', 00H
	ORG $+1
$SG70673 DB	'<table border=0 cellspacing=0 cellpadding=0 width=100% b'
	DB	'gcolor=#FFFFFF><tr>', 0aH, '<td align=center><font size=-1>Vo'
	DB	'us avez cliqu', 0e9H, ' sur <b><font color=#FFAA00>', 00H
$SG70675 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70678 DB	'Confirmation avant enregistrement', 00H
	ORG $+2
$SG70679 DB	'Confirmation avant fermeture', 00H
	ORG $+3
$SG70681 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70684 DB	'</td></tr></table>', 00H
	ORG $+1
$SG70686 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70689 DB	'</b></font></td><td width=10></td><td align = center>', 00H
	ORG $+2
$SG70690 DB	'000000>Fiche modifi', 0e9H, 'e', 00H
	ORG $+2
$SG70691 DB	'FF0000>Erreur bloquante', 00H
$SG70692 DB	'FFAA00>V', 0e9H, 'rifiez les donn', 0e9H, 'es', 00H
$SG70693 DB	'<table border=0 cellspacing=0 cellpadding=5 width=100% b'
	DB	'gcolor=#DDDDDD><tr>', 0aH, '<td align=center><b><font size=+1'
	DB	' color=#', 00H
	ORG $+2
$SG70695 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70698 DB	'FORMGOBACKOBJ', 00H
	ORG $+2
$SG70701 DB	'Retourne ', 0e0H, ' la page pr', 0e9H, 'c', 0e9H, 'dente'
	DB	00H
	ORG $+2
$SG70702 DB	'_eva_btn_gobackobj_fr_s.gif', 00H
$SG70703 DB	'_eva_btn_gobackobj_fr.gif', 00H
	ORG $+2
$SG70704 DB	'Revenir', 00H
$SG70709 DB	'</td><td align = center>', 00H
	ORG $+3
$SG70711 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70715 DB	'FORMCLOSE', 00H
	ORG $+2
$SG70718 DB	'Ignore les modifications et retourne au formulaire pr', 0e9H
	DB	'c', 0e9H, 'dent', 00H
	ORG $+3
$SG70719 DB	'_eva_btn_closenosave_fr_s.gif', 00H
	ORG $+2
$SG70720 DB	'_eva_btn_closenosave_fr.gif', 00H
$SG70721 DB	'Fermer sans enregistrer', 00H
$SG70725 DB	'FORMCLOSE', 00H
	ORG $+2
$SG70728 DB	'Retourne au formulaire pr', 0e9H, 'c', 0e9H, 'dent', 00H
	ORG $+3
$SG70729 DB	'_eva_btn_close_fr_s.gif', 00H
$SG70730 DB	'_eva_btn_close_fr.gif', 00H
	ORG $+2
$SG70731 DB	'Fermer', 00H
	ORG $+1
$SG70734 DB	'</td></tr></table>', 00H
	ORG $+1
$SG70736 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70740 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70744 DB	'<table border=0 cellspacing=0 cellpadding=2 width=100% h'
	DB	'eight=200><tr>', 00H
	ORG $+1
$SG70746 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70750 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70753 DB	'</tr></table>', 0aH, 00H
	ORG $+1
$SG70755 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70758 DB	'<table border=0 cellspacing=0 cellpadding=2 width=100%><'
	DB	'tr>', 00H
$SG70760 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70765 DB	'<td align=center bgcolor=#DDDDDD colspan=4><b><font face'
	DB	'=Arial><font size=+1 color=#FF0000>Enregistrement refus', 0e9H
	DB	'</font>', 00H
$SG70767 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70771 DB	' : corrigez les erreurs et essayez d''enregistrer ', 0e0H
	DB	' nouveau', 00H
	ORG $+1
$SG70773 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70776 DB	'</font></b></td></tr><tr>', 00H
	ORG $+2
$SG70778 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70781 DB	'<td align = center>', 00H
$SG70783 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70787 DB	'</td><td align = center>', 00H
	ORG $+3
$SG70789 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70792 DB	'FORMRESTORE', 00H
$SG70795 DB	'Annule les modifications et retourne ', 0e0H, ' la fiche'
	DB	' originale', 00H
	ORG $+2
$SG70796 DB	'_eva_btn_restore_fr_s.gif', 00H
	ORG $+2
$SG70797 DB	'_eva_btn_restore_fr.gif', 00H
$SG70798 DB	'Annuler', 00H
$SG70803 DB	'FORMSAVE_BACK', 00H
	ORG $+2
$SG70806 DB	'</td>', 0aH, '<td align = center>', 00H
	ORG $+2
$SG70808 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70811 DB	'Enregistre les modifications et retourne ', 0e0H, ' la f'
	DB	'iche enregistr', 0e9H, 'e', 00H
$SG70812 DB	'_eva_btn_save_fr_s.gif', 00H
	ORG $+1
$SG70813 DB	'_eva_btn_save_fr.gif', 00H
	ORG $+3
$SG70814 DB	'Enregistrer', 00H
$SG70818 DB	'</td>', 0aH, '<td align = center>', 00H
	ORG $+2
$SG70820 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70823 DB	'FORMSAVE_CLOSE', 00H
	ORG $+1
$SG70826 DB	'Enregistre les modifications et retourne au formulaire p'
	DB	'r', 0e9H, 'c', 0e9H, 'dent', 00H
	ORG $+3
$SG70827 DB	'_eva_btn_saveclose_fr_s.gif', 00H
$SG70828 DB	'_eva_btn_saveclose_fr.gif', 00H
	ORG $+2
$SG70829 DB	'Enregistrer et fermer', 00H
	ORG $+2
$SG70833 DB	'</td>', 0aH, '<td align = center>', 00H
	ORG $+2
$SG70835 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70838 DB	'FORMSAVE_NEXT', 00H
	ORG $+2
$SG70841 DB	'Enregistre les modifications et passe ', 0e0H, ' l''', 0e9H
	DB	'tape suivante', 00H
	ORG $+3
$SG70842 DB	'_eva_btn_savenext_fr_s.gif', 00H
	ORG $+1
$SG70843 DB	'_eva_btn_savenext_fr.gif', 00H
	ORG $+3
$SG70844 DB	'Enregistrer et continuer', 00H
	ORG $+3
$SG70847 DB	'</td><td><table border=0 cellpadding=0 cellspacing=0><tr'
	DB	'><td align=right>', 00H
	ORG $+2
$SG70849 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70852 DB	'CHANGE', 00H
	ORG $+1
$SG70856 DB	'1', 00H
	ORG $+2
$SG70859 DB	'</td><td><font size=-1>Afficher les modifications', 00H
	ORG $+2
$SG70861 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70867 DB	''' value=1>', 00H
	ORG $+1
$SG70868 DB	'<input type=hidden name=''', 00H
	ORG $+2
$SG70870 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70873 DB	'</td></tr><tr><td align=right>', 00H
	ORG $+1
$SG70875 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70878 DB	'WARN', 00H
	ORG $+3
$SG70883 DB	'1', 00H
	ORG $+2
$SG70886 DB	'</td><td><font size=-1>Afficher les avertissements', 00H
	ORG $+1
$SG70888 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70894 DB	''' value=1>', 00H
	ORG $+1
$SG70895 DB	'<input type=hidden name=''', 00H
	ORG $+2
$SG70897 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70900 DB	'</td></tr></table></td>', 00H
$SG70902 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70905 DB	'</tr></table>', 0aH, 00H
	ORG $+1
$SG70907 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70912 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70918 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70920 DB	'D:\Travail\ABI\EVA\V4.0\CGI\Brunix-2016\form_save.c', 00H
$SG70921 DB	'form_save_dialog_output', 00H
$SG70923 DB	'D:\Travail\ABI\EVA\V4.0\CGI\Brunix-2016\form_save.c', 00H
$SG70924 DB	'form_save_dialog_output', 00H
_DATA	ENDS
_TEXT	SEGMENT
_cntxt$ = 8
_i_ctrl$ = 12
_butns$ = 16
_clicbtn$ = 20
_form$ = -4
_ctrl$ = -12
_name$ = -8
_form_save_dialog_output PROC NEAR

; 469  : ){

	push	ebp
	mov	ebp, esp
	sub	esp, 56					; 00000038H

; 470  : 	EVA_form *form = cntxt->form;

	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	ecx, DWORD PTR [eax+80]
	mov	DWORD PTR _form$[ebp], ecx

; 471  : 	EVA_ctrl *ctrl = form->ctrl + i_ctrl;

	mov	edx, DWORD PTR _i_ctrl$[ebp]
	imul	edx, 480				; 000001e0H
	mov	eax, DWORD PTR _form$[ebp]
	mov	ecx, DWORD PTR [eax]
	add	ecx, edx
	mov	DWORD PTR _ctrl$[ebp], ecx

; 472  : 	DynBuffer *name = NULL;

	mov	DWORD PTR _name$[ebp], 0

; 473  : 	form->html = &form->html_top;

	mov	edx, DWORD PTR _form$[ebp]
	add	edx, 216				; 000000d8H
	mov	eax, DWORD PTR _form$[ebp]
	mov	DWORD PTR [eax+232], edx

; 477  : 			"<table border=0 cellspacing=0 cellpadding=0 width=100% bgcolor=#FFFFFF><tr>\n"
; 478  : 			"<td align=center><font size=-1>Vous avez cliqué sur <b><font color=#FFAA00>", ctrl->LABEL, 0, NO_CONV, "</font> - ");

	push	10					; 0000000aH
	push	OFFSET FLAT:$SG70672
	push	0
	push	0
	push	0
	mov	ecx, DWORD PTR _ctrl$[ebp]
	mov	edx, DWORD PTR [ecx+284]
	push	edx
	push	151					; 00000097H
	push	OFFSET FLAT:$SG70673
	mov	eax, DWORD PTR _form$[ebp]
	mov	ecx, DWORD PTR [eax+232]
	push	ecx
	call	_dynbuf_add3
	add	esp, 36					; 00000024H
	test	eax, eax
	je	SHORT $L70671
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29872], OFFSET FLAT:$SG70675
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 478		; 000001deH
	jmp	$eva_err$70676
$L70671:

; 480  : 				(clicbtn && *clicbtn & BUTN_SAVE) ? "Confirmation avant enregistrement" :
; 481  : 													"Confirmation avant fermeture"), 0, TO_HTML);

	cmp	DWORD PTR _clicbtn$[ebp], 0
	je	SHORT $L71070
	mov	ecx, DWORD PTR _clicbtn$[ebp]
	mov	edx, DWORD PTR [ecx]
	and	edx, 7
	test	edx, edx
	je	SHORT $L71070
	mov	DWORD PTR -16+[ebp], OFFSET FLAT:$SG70678
	jmp	SHORT $L71071
$L71070:
	mov	DWORD PTR -16+[ebp], OFFSET FLAT:$SG70679
$L71071:
	push	1
	push	OFFSET FLAT:_plain_to_html
	push	0
	mov	eax, DWORD PTR -16+[ebp]
	push	eax
	mov	ecx, DWORD PTR _form$[ebp]
	mov	edx, DWORD PTR [ecx+232]
	push	edx
	call	_dynbuf_add
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L70677
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29872], OFFSET FLAT:$SG70681
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 481		; 000001e1H
	jmp	$eva_err$70676
$L70677:

; 482  : 	DYNBUF_ADD_STR(form->html, "</td></tr></table>");

	push	0
	push	0
	push	18					; 00000012H
	push	OFFSET FLAT:$SG70684
	mov	edx, DWORD PTR _form$[ebp]
	mov	eax, DWORD PTR [edx+232]
	push	eax
	call	_dynbuf_add
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L70683
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29872], OFFSET FLAT:$SG70686
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 482		; 000001e2H
	jmp	$eva_err$70676
$L70683:

; 484  : 			"<table border=0 cellspacing=0 cellpadding=5 width=100% bgcolor=#DDDDDD><tr>\n"
; 485  : 			"<td align=center><b><font size=+1 color=#",
; 486  : 			(clicbtn && *clicbtn & BUTN_CLOSE) ? "000000>Fiche modifiée" :
; 487  : 			(form->error & 2) ? "FF0000>Erreur bloquante" :
; 488  : 			"FFAA00>Vérifiez les données",0, NO_CONV,
; 489  : 			"</b></font></td><td width=10></td><td align = center>");

	cmp	DWORD PTR _clicbtn$[ebp], 0
	je	SHORT $L71072
	mov	eax, DWORD PTR _clicbtn$[ebp]
	mov	ecx, DWORD PTR [eax]
	and	ecx, 8
	test	ecx, ecx
	je	SHORT $L71072
	mov	DWORD PTR -20+[ebp], OFFSET FLAT:$SG70690
	jmp	SHORT $L71075
$L71072:
	mov	edx, DWORD PTR _form$[ebp]
	mov	eax, DWORD PTR [edx+132]
	and	eax, 2
	test	eax, eax
	je	SHORT $L71073
	mov	DWORD PTR -24+[ebp], OFFSET FLAT:$SG70691
	jmp	SHORT $L71074
$L71073:
	mov	DWORD PTR -24+[ebp], OFFSET FLAT:$SG70692
$L71074:
	mov	ecx, DWORD PTR -24+[ebp]
	mov	DWORD PTR -20+[ebp], ecx
$L71075:
	push	53					; 00000035H
	push	OFFSET FLAT:$SG70689
	push	0
	push	0
	push	0
	mov	edx, DWORD PTR -20+[ebp]
	push	edx
	push	117					; 00000075H
	push	OFFSET FLAT:$SG70693
	mov	eax, DWORD PTR _form$[ebp]
	mov	ecx, DWORD PTR [eax+232]
	push	ecx
	call	_dynbuf_add3
	add	esp, 36					; 00000024H
	test	eax, eax
	je	SHORT $L70688
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29872], OFFSET FLAT:$SG70695
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 489		; 000001e9H
	jmp	$eva_err$70676
$L70688:

; 490  : 
; 491  : 	/* Add goback / close button */
; 492  : 	CTRL_CGINAMEBTN(&name, NULL, add_sz_str("FORMGOBACKOBJ"));

	push	13					; 0000000dH
	push	OFFSET FLAT:$SG70698
	push	66					; 00000042H
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
	je	SHORT $L70697
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 492		; 000001ecH
	jmp	$eva_err$70676
$L70697:

; 493  : 	if(put_html_button(cntxt, name->data, "Revenir", "_eva_btn_gobackobj_fr.gif", "_eva_btn_gobackobj_fr_s.gif", "Retourne à la page précédente", 0, 0)) STACK_ERROR;

	push	0
	push	0
	push	0
	push	0
	push	0
	push	OFFSET FLAT:$SG70701
	push	OFFSET FLAT:$SG70702
	push	OFFSET FLAT:$SG70703
	push	OFFSET FLAT:$SG70704
	mov	edx, DWORD PTR _name$[ebp]
	add	edx, 8
	push	edx
	mov	eax, DWORD PTR _cntxt$[ebp]
	push	eax
	call	_put_html_button_sz
	add	esp, 44					; 0000002cH
	test	eax, eax
	je	SHORT $L70700
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 493		; 000001edH
	jmp	$eva_err$70676
$L70700:

; 494  : 	if(!butns || butns & BUTN_CLOSE)

	cmp	DWORD PTR _butns$[ebp], 0
	je	SHORT $L70706
	mov	edx, DWORD PTR _butns$[ebp]
	and	edx, 8
	test	edx, edx
	je	$L70727
$L70706:

; 496  : 		DYNBUF_ADD_STR(form->html, "</td><td align = center>");

	push	0
	push	0
	push	24					; 00000018H
	push	OFFSET FLAT:$SG70709
	mov	eax, DWORD PTR _form$[ebp]
	mov	ecx, DWORD PTR [eax+232]
	push	ecx
	call	_dynbuf_add
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L70708
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29872], OFFSET FLAT:$SG70711
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 496		; 000001f0H
	jmp	$eva_err$70676
$L70708:

; 497  : 		if(form->b_modified)

	mov	ecx, DWORD PTR _form$[ebp]
	cmp	DWORD PTR [ecx+128], 0
	je	$L70712

; 499  : 			CTRL_CGINAMEBTN(&name, NULL, add_sz_str("FORMCLOSE"));

	push	9
	push	OFFSET FLAT:$SG70715
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
	je	SHORT $L70714
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 499		; 000001f3H
	jmp	$eva_err$70676
$L70714:

; 500  : 			if(put_html_button(cntxt, name->data, "Fermer sans enregistrer", "_eva_btn_closenosave_fr.gif", "_eva_btn_closenosave_fr_s.gif", "Ignore les modifications et retourne au formulaire précédent", 0, 0)) STACK_ERROR;

	push	0
	push	0
	push	0
	push	0
	push	0
	push	OFFSET FLAT:$SG70718
	push	OFFSET FLAT:$SG70719
	push	OFFSET FLAT:$SG70720
	push	OFFSET FLAT:$SG70721
	mov	eax, DWORD PTR _name$[ebp]
	add	eax, 8
	push	eax
	mov	ecx, DWORD PTR _cntxt$[ebp]
	push	ecx
	call	_put_html_button_sz
	add	esp, 44					; 0000002cH
	test	eax, eax
	je	SHORT $L70717
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 500		; 000001f4H
	jmp	$eva_err$70676
$L70717:

; 502  : 		else

	jmp	SHORT $L70727
$L70712:

; 504  : 			CTRL_CGINAMEBTN(&name, NULL, add_sz_str("FORMCLOSE"));

	push	9
	push	OFFSET FLAT:$SG70725
	push	66					; 00000042H
	lea	eax, DWORD PTR _name$[ebp]
	push	eax
	push	1
	push	0
	mov	ecx, DWORD PTR _ctrl$[ebp]
	push	ecx
	mov	edx, DWORD PTR _cntxt$[ebp]
	push	edx
	call	_ctrl_cgi_name
	add	esp, 32					; 00000020H
	test	eax, eax
	je	SHORT $L70724
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 504		; 000001f8H
	jmp	$eva_err$70676
$L70724:

; 505  : 			if(put_html_button(cntxt, name->data, "Fermer", "_eva_btn_close_fr.gif", "_eva_btn_close_fr_s.gif", "Retourne au formulaire précédent", 0, 0)) STACK_ERROR;

	push	0
	push	0
	push	0
	push	0
	push	0
	push	OFFSET FLAT:$SG70728
	push	OFFSET FLAT:$SG70729
	push	OFFSET FLAT:$SG70730
	push	OFFSET FLAT:$SG70731
	mov	ecx, DWORD PTR _name$[ebp]
	add	ecx, 8
	push	ecx
	mov	edx, DWORD PTR _cntxt$[ebp]
	push	edx
	call	_put_html_button_sz
	add	esp, 44					; 0000002cH
	test	eax, eax
	je	SHORT $L70727
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 505		; 000001f9H
	jmp	$eva_err$70676
$L70727:

; 508  : 	DYNBUF_ADD_STR(form->html, "</td></tr></table>");

	push	0
	push	0
	push	18					; 00000012H
	push	OFFSET FLAT:$SG70734
	mov	ecx, DWORD PTR _form$[ebp]
	mov	edx, DWORD PTR [ecx+232]
	push	edx
	call	_dynbuf_add
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L70733
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29872], OFFSET FLAT:$SG70736
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 508		; 000001fcH
	jmp	$eva_err$70676
$L70733:

; 509  : 
; 510  : 	/* Output complementary error message and form controls */
; 511  : 	DYNBUF_ADD_BUF(form->html, form->html_err, NO_CONV);

	mov	edx, DWORD PTR _form$[ebp]
	cmp	DWORD PTR [edx+208], 0
	je	SHORT $L70738
	push	0
	push	0
	mov	eax, DWORD PTR _form$[ebp]
	mov	ecx, DWORD PTR [eax+208]
	mov	edx, DWORD PTR [ecx+4]
	push	edx
	mov	eax, DWORD PTR _form$[ebp]
	mov	ecx, DWORD PTR [eax+208]
	add	ecx, 8
	push	ecx
	mov	edx, DWORD PTR _form$[ebp]
	mov	eax, DWORD PTR [edx+232]
	push	eax
	call	_dynbuf_add
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L70738
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29872], OFFSET FLAT:$SG70740
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 511		; 000001ffH
	jmp	$eva_err$70676
$L70738:

; 512  : 	if(form->html_tabs)

	mov	eax, DWORD PTR _form$[ebp]
	cmp	DWORD PTR [eax+220], 0
	je	$L70741

; 515  : 			"<table border=0 cellspacing=0 cellpadding=2 width=100% height=200><tr>")

	push	0
	push	0
	push	70					; 00000046H
	push	OFFSET FLAT:$SG70744
	mov	ecx, DWORD PTR _form$[ebp]
	mov	edx, DWORD PTR [ecx+232]
	push	edx
	call	_dynbuf_add
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L70743
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29872], OFFSET FLAT:$SG70746
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 515		; 00000203H
	jmp	$eva_err$70676
$L70743:

; 516  : 		DYNBUF_ADD_BUF(form->html, form->html_tabs, NO_CONV);

	mov	edx, DWORD PTR _form$[ebp]
	cmp	DWORD PTR [edx+220], 0
	je	SHORT $L70748
	push	0
	push	0
	mov	eax, DWORD PTR _form$[ebp]
	mov	ecx, DWORD PTR [eax+220]
	mov	edx, DWORD PTR [ecx+4]
	push	edx
	mov	eax, DWORD PTR _form$[ebp]
	mov	ecx, DWORD PTR [eax+220]
	add	ecx, 8
	push	ecx
	mov	edx, DWORD PTR _form$[ebp]
	mov	eax, DWORD PTR [edx+232]
	push	eax
	call	_dynbuf_add
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L70748
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29872], OFFSET FLAT:$SG70750
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 516		; 00000204H
	jmp	$eva_err$70676
$L70748:

; 517  : 		DYNBUF_ADD_STR(form->html, "</tr></table>\n");

	push	0
	push	0
	push	14					; 0000000eH
	push	OFFSET FLAT:$SG70753
	mov	eax, DWORD PTR _form$[ebp]
	mov	ecx, DWORD PTR [eax+232]
	push	ecx
	call	_dynbuf_add
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L70752
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29872], OFFSET FLAT:$SG70755
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 517		; 00000205H
	jmp	$eva_err$70676
$L70752:

; 518  : 		M_FREE(form->html_tabs);

	mov	ecx, DWORD PTR _form$[ebp]
	mov	edx, DWORD PTR [ecx+220]
	push	edx
	call	_mem_free
	add	esp, 4
	mov	eax, DWORD PTR _form$[ebp]
	mov	DWORD PTR [eax+220], 0
$L70741:

; 520  : 	form->nextstep = HtmlSaveDlg;

	mov	ecx, DWORD PTR _form$[ebp]
	mov	DWORD PTR [ecx+172], 3

; 524  : 				"<table border=0 cellspacing=0 cellpadding=2 width=100%><tr>");

	push	0
	push	0
	push	59					; 0000003bH
	push	OFFSET FLAT:$SG70758
	mov	edx, DWORD PTR _form$[ebp]
	mov	eax, DWORD PTR [edx+232]
	push	eax
	call	_dynbuf_add
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L70757
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29872], OFFSET FLAT:$SG70760
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 524		; 0000020cH
	jmp	$eva_err$70676
$L70757:

; 525  : 
; 526  : 	/* Output error message if blocking error */
; 527  : 	if(form->error & form->savedlg_outmode & 2 || form->error & 4)

	mov	eax, DWORD PTR _form$[ebp]
	mov	ecx, DWORD PTR _form$[ebp]
	mov	edx, DWORD PTR [eax+132]
	and	edx, DWORD PTR [ecx+204]
	and	edx, 2
	test	edx, edx
	jne	SHORT $L70762
	mov	eax, DWORD PTR _form$[ebp]
	mov	ecx, DWORD PTR [eax+132]
	and	ecx, 4
	test	ecx, ecx
	je	$L70775
$L70762:

; 530  : 		"<td align=center bgcolor=#DDDDDD colspan=4><b><font face=Arial>"
; 531  : 		"<font size=+1 color=#FF0000>Enregistrement refusé</font>");

	push	0
	push	0
	push	119					; 00000077H
	push	OFFSET FLAT:$SG70765
	mov	edx, DWORD PTR _form$[ebp]
	mov	eax, DWORD PTR [edx+232]
	push	eax
	call	_dynbuf_add
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L70764
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29872], OFFSET FLAT:$SG70767
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 531		; 00000213H
	jmp	$eva_err$70676
$L70764:

; 532  : 		if(!(form->error & 4))

	mov	eax, DWORD PTR _form$[ebp]
	mov	ecx, DWORD PTR [eax+132]
	and	ecx, 4
	test	ecx, ecx
	jne	SHORT $L70770

; 533  : 			DYNBUF_ADD_STR(form->html, " : corrigez les erreurs et essayez d'enregistrer à nouveau");

	push	0
	push	0
	push	58					; 0000003aH
	push	OFFSET FLAT:$SG70771
	mov	edx, DWORD PTR _form$[ebp]
	mov	eax, DWORD PTR [edx+232]
	push	eax
	call	_dynbuf_add
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L70770
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29872], OFFSET FLAT:$SG70773
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 533		; 00000215H
	jmp	$eva_err$70676
$L70770:

; 535  : 		"</font></b></td></tr><tr>");

	push	0
	push	0
	push	25					; 00000019H
	push	OFFSET FLAT:$SG70776
	mov	eax, DWORD PTR _form$[ebp]
	mov	ecx, DWORD PTR [eax+232]
	push	ecx
	call	_dynbuf_add
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L70775
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29872], OFFSET FLAT:$SG70778
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 535		; 00000217H
	jmp	$eva_err$70676
$L70775:

; 537  : 
; 538  : 	/* Add save / restore buttons in form->html_tabs */
; 539  : 	DYNBUF_ADD_STR(form->html, "<td align = center>");

	push	0
	push	0
	push	19					; 00000013H
	push	OFFSET FLAT:$SG70781
	mov	ecx, DWORD PTR _form$[ebp]
	mov	edx, DWORD PTR [ecx+232]
	push	edx
	call	_dynbuf_add
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L70780
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29872], OFFSET FLAT:$SG70783
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 539		; 0000021bH
	jmp	$eva_err$70676
$L70780:

; 540  : 	if(butns & BUTN_RESTORE)

	mov	edx, DWORD PTR _butns$[ebp]
	and	edx, 16					; 00000010H
	test	edx, edx
	je	$L70794

; 542  : 		DYNBUF_ADD_STR(form->html, "</td><td align = center>");

	push	0
	push	0
	push	24					; 00000018H
	push	OFFSET FLAT:$SG70787
	mov	eax, DWORD PTR _form$[ebp]
	mov	ecx, DWORD PTR [eax+232]
	push	ecx
	call	_dynbuf_add
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L70786
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29872], OFFSET FLAT:$SG70789
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 542		; 0000021eH
	jmp	$eva_err$70676
$L70786:

; 543  : 		CTRL_CGINAMEBTN(&name, NULL, add_sz_str("FORMRESTORE"));

	push	11					; 0000000bH
	push	OFFSET FLAT:$SG70792
	push	66					; 00000042H
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
	je	SHORT $L70791
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 543		; 0000021fH
	jmp	$eva_err$70676
$L70791:

; 544  : 		if(put_html_button(cntxt, name->data, "Annuler", "_eva_btn_restore_fr.gif", "_eva_btn_restore_fr_s.gif", "Annule les modifications et retourne à la fiche originale", 0, 0)) STACK_ERROR;

	push	0
	push	0
	push	0
	push	0
	push	0
	push	OFFSET FLAT:$SG70795
	push	OFFSET FLAT:$SG70796
	push	OFFSET FLAT:$SG70797
	push	OFFSET FLAT:$SG70798
	mov	edx, DWORD PTR _name$[ebp]
	add	edx, 8
	push	edx
	mov	eax, DWORD PTR _cntxt$[ebp]
	push	eax
	call	_put_html_button_sz
	add	esp, 44					; 0000002cH
	test	eax, eax
	je	SHORT $L70794
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 544		; 00000220H
	jmp	$eva_err$70676
$L70794:

; 546  : 	if(form->error < 4)

	mov	edx, DWORD PTR _form$[ebp]
	cmp	DWORD PTR [edx+132], 4
	jge	$L70840

; 548  : 		if(butns & BUTN_SAVE_BACK)

	mov	eax, DWORD PTR _butns$[ebp]
	and	eax, 4
	test	eax, eax
	je	$L70810

; 550  : 			CTRL_CGINAMEBTN(&name, NULL, add_sz_str("FORMSAVE_BACK"));

	push	13					; 0000000dH
	push	OFFSET FLAT:$SG70803
	push	66					; 00000042H
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
	je	SHORT $L70802
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 550		; 00000226H
	jmp	$eva_err$70676
$L70802:

; 551  : 			DYNBUF_ADD_STR(form->html, "</td>\n<td align = center>");

	push	0
	push	0
	push	25					; 00000019H
	push	OFFSET FLAT:$SG70806
	mov	edx, DWORD PTR _form$[ebp]
	mov	eax, DWORD PTR [edx+232]
	push	eax
	call	_dynbuf_add
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L70805
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29872], OFFSET FLAT:$SG70808
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 551		; 00000227H
	jmp	$eva_err$70676
$L70805:

; 552  : 			if(put_html_button(cntxt, name->data, "Enregistrer", "_eva_btn_save_fr.gif", "_eva_btn_save_fr_s.gif", "Enregistre les modifications et retourne à la fiche enregistrée", 0, 0)) STACK_ERROR;

	push	0
	push	0
	push	0
	push	0
	push	0
	push	OFFSET FLAT:$SG70811
	push	OFFSET FLAT:$SG70812
	push	OFFSET FLAT:$SG70813
	push	OFFSET FLAT:$SG70814
	mov	eax, DWORD PTR _name$[ebp]
	add	eax, 8
	push	eax
	mov	ecx, DWORD PTR _cntxt$[ebp]
	push	ecx
	call	_put_html_button_sz
	add	esp, 44					; 0000002cH
	test	eax, eax
	je	SHORT $L70810
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 552		; 00000228H
	jmp	$eva_err$70676
$L70810:

; 554  : 		if(butns & BUTN_SAVE_CLOSE)

	mov	eax, DWORD PTR _butns$[ebp]
	and	eax, 2
	test	eax, eax
	je	$L70825

; 556  : 			DYNBUF_ADD_STR(form->html, "</td>\n<td align = center>");

	push	0
	push	0
	push	25					; 00000019H
	push	OFFSET FLAT:$SG70818
	mov	ecx, DWORD PTR _form$[ebp]
	mov	edx, DWORD PTR [ecx+232]
	push	edx
	call	_dynbuf_add
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L70817
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29872], OFFSET FLAT:$SG70820
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 556		; 0000022cH
	jmp	$eva_err$70676
$L70817:

; 557  : 			CTRL_CGINAMEBTN(&name, NULL, add_sz_str("FORMSAVE_CLOSE"));

	push	14					; 0000000eH
	push	OFFSET FLAT:$SG70823
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
	je	SHORT $L70822
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 557		; 0000022dH
	jmp	$eva_err$70676
$L70822:

; 558  : 			if(put_html_button(cntxt, name->data, "Enregistrer et fermer", "_eva_btn_saveclose_fr.gif", "_eva_btn_saveclose_fr_s.gif", "Enregistre les modifications et retourne au formulaire précédent", 0, 0)) STACK_ERROR;

	push	0
	push	0
	push	0
	push	0
	push	0
	push	OFFSET FLAT:$SG70826
	push	OFFSET FLAT:$SG70827
	push	OFFSET FLAT:$SG70828
	push	OFFSET FLAT:$SG70829
	mov	eax, DWORD PTR _name$[ebp]
	add	eax, 8
	push	eax
	mov	ecx, DWORD PTR _cntxt$[ebp]
	push	ecx
	call	_put_html_button_sz
	add	esp, 44					; 0000002cH
	test	eax, eax
	je	SHORT $L70825
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 558		; 0000022eH
	jmp	$eva_err$70676
$L70825:

; 560  : 		if(butns & BUTN_SAVE_NEXT)

	mov	eax, DWORD PTR _butns$[ebp]
	and	eax, 1
	test	eax, eax
	je	$L70840

; 562  : 			DYNBUF_ADD_STR(form->html, "</td>\n<td align = center>");

	push	0
	push	0
	push	25					; 00000019H
	push	OFFSET FLAT:$SG70833
	mov	ecx, DWORD PTR _form$[ebp]
	mov	edx, DWORD PTR [ecx+232]
	push	edx
	call	_dynbuf_add
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L70832
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29872], OFFSET FLAT:$SG70835
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 562		; 00000232H
	jmp	$eva_err$70676
$L70832:

; 563  : 			CTRL_CGINAMEBTN(&name, NULL, add_sz_str("FORMSAVE_NEXT"));

	push	13					; 0000000dH
	push	OFFSET FLAT:$SG70838
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
	je	SHORT $L70837
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 563		; 00000233H
	jmp	$eva_err$70676
$L70837:

; 564  : 			if(put_html_button(cntxt, name->data, "Enregistrer et continuer", "_eva_btn_savenext_fr.gif", "_eva_btn_savenext_fr_s.gif", "Enregistre les modifications et passe à l'étape suivante", 0, 0)) STACK_ERROR;

	push	0
	push	0
	push	0
	push	0
	push	0
	push	OFFSET FLAT:$SG70841
	push	OFFSET FLAT:$SG70842
	push	OFFSET FLAT:$SG70843
	push	OFFSET FLAT:$SG70844
	mov	eax, DWORD PTR _name$[ebp]
	add	eax, 8
	push	eax
	mov	ecx, DWORD PTR _cntxt$[ebp]
	push	ecx
	call	_put_html_button_sz
	add	esp, 44					; 0000002cH
	test	eax, eax
	je	SHORT $L70840
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 564		; 00000234H
	jmp	$eva_err$70676
$L70840:

; 567  : 
; 568  : 	/* Add Display changes checkbox */
; 569  : 	DYNBUF_ADD_STR(form->html, "</td><td><table border=0 cellpadding=0 cellspacing=0><tr><td align=right>");

	push	0
	push	0
	push	73					; 00000049H
	push	OFFSET FLAT:$SG70847
	mov	eax, DWORD PTR _form$[ebp]
	mov	ecx, DWORD PTR [eax+232]
	push	ecx
	call	_dynbuf_add
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L70846
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29872], OFFSET FLAT:$SG70849
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 569		; 00000239H
	jmp	$eva_err$70676
$L70846:

; 570  : 	CTRL_CGINAMESUBFIELD(&name, NULL, "CHANGE");

	push	6
	push	OFFSET FLAT:$SG70852
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
	je	SHORT $L70851
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 570		; 0000023aH
	jmp	$eva_err$70676
$L70851:

; 571  : 	if(form->b_modified)

	mov	edx, DWORD PTR _form$[ebp]
	cmp	DWORD PTR [edx+128], 0
	je	$L70853

; 573  : 		if(put_html_chkbox(cntxt, DYNBUF_VAL_SZ(name), "1", 1, form->savedlg_outmode & 4 ? 1 : 0, 1)) STACK_ERROR;

	cmp	DWORD PTR _name$[ebp], 0
	je	SHORT $L71076
	mov	eax, DWORD PTR _name$[ebp]
	mov	ecx, DWORD PTR [eax+4]
	mov	DWORD PTR -28+[ebp], ecx
	jmp	SHORT $L71077
$L71076:
	mov	DWORD PTR -28+[ebp], 0
$L71077:
	cmp	DWORD PTR _name$[ebp], 0
	je	SHORT $L71078
	mov	edx, DWORD PTR _name$[ebp]
	add	edx, 8
	mov	DWORD PTR -32+[ebp], edx
	jmp	SHORT $L71079
$L71078:
	mov	DWORD PTR -32+[ebp], 0
$L71079:
	push	1
	mov	eax, DWORD PTR _form$[ebp]
	mov	ecx, DWORD PTR [eax+204]
	and	ecx, 4
	neg	ecx
	sbb	ecx, ecx
	neg	ecx
	push	ecx
	push	1
	push	OFFSET FLAT:$SG70856
	mov	edx, DWORD PTR -28+[ebp]
	push	edx
	mov	eax, DWORD PTR -32+[ebp]
	push	eax
	mov	ecx, DWORD PTR _cntxt$[ebp]
	push	ecx
	call	_put_html_chkbox
	add	esp, 28					; 0000001cH
	test	eax, eax
	je	SHORT $L70855
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 573		; 0000023dH
	jmp	$eva_err$70676
$L70855:

; 574  : 		DYNBUF_ADD_STR(form->html, "</td><td><font size=-1>Afficher les modifications");

	push	0
	push	0
	push	49					; 00000031H
	push	OFFSET FLAT:$SG70859
	mov	eax, DWORD PTR _form$[ebp]
	mov	ecx, DWORD PTR [eax+232]
	push	ecx
	call	_dynbuf_add
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L70858
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29872], OFFSET FLAT:$SG70861
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 574		; 0000023eH
	jmp	$eva_err$70676
$L70858:

; 576  : 	else if(form->savedlg_outmode & 4)

	jmp	$L70866
$L70853:
	mov	ecx, DWORD PTR _form$[ebp]
	mov	edx, DWORD PTR [ecx+204]
	and	edx, 4
	test	edx, edx
	je	SHORT $L70866

; 577  : 		DYNBUF_ADD3_BUF(form->html, "<input type=hidden name='", name, NO_CONV, "' value=1>");

	cmp	DWORD PTR _name$[ebp], 0
	je	SHORT $L71080
	mov	eax, DWORD PTR _name$[ebp]
	mov	ecx, DWORD PTR [eax+4]
	mov	DWORD PTR -36+[ebp], ecx
	jmp	SHORT $L71081
$L71080:
	mov	DWORD PTR -36+[ebp], 0
$L71081:
	cmp	DWORD PTR _name$[ebp], 0
	je	SHORT $L71082
	mov	edx, DWORD PTR _name$[ebp]
	add	edx, 8
	mov	DWORD PTR -40+[ebp], edx
	jmp	SHORT $L71083
$L71082:
	mov	DWORD PTR -40+[ebp], 0
$L71083:
	push	10					; 0000000aH
	push	OFFSET FLAT:$SG70867
	push	0
	push	0
	mov	eax, DWORD PTR -36+[ebp]
	push	eax
	mov	ecx, DWORD PTR -40+[ebp]
	push	ecx
	push	25					; 00000019H
	push	OFFSET FLAT:$SG70868
	mov	edx, DWORD PTR _form$[ebp]
	mov	eax, DWORD PTR [edx+232]
	push	eax
	call	_dynbuf_add3
	add	esp, 36					; 00000024H
	test	eax, eax
	je	SHORT $L70866
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29872], OFFSET FLAT:$SG70870
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 577		; 00000241H
	jmp	$eva_err$70676
$L70866:

; 578  : 
; 579  : 	/* Add Display warnings checkbox */
; 580  : 	DYNBUF_ADD_STR(form->html, "</td></tr><tr><td align=right>");

	push	0
	push	0
	push	30					; 0000001eH
	push	OFFSET FLAT:$SG70873
	mov	eax, DWORD PTR _form$[ebp]
	mov	ecx, DWORD PTR [eax+232]
	push	ecx
	call	_dynbuf_add
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L70872
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29872], OFFSET FLAT:$SG70875
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 580		; 00000244H
	jmp	$eva_err$70676
$L70872:

; 581  : 	CTRL_CGINAMESUBFIELD(&name, NULL, "WARN");

	push	4
	push	OFFSET FLAT:$SG70878
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
	je	SHORT $L70877
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 581		; 00000245H
	jmp	$eva_err$70676
$L70877:

; 582  : 	if(form->error & 1 || (form->error & 2 && !(form->savedlg_outmode & 2)) )

	mov	edx, DWORD PTR _form$[ebp]
	mov	eax, DWORD PTR [edx+132]
	and	eax, 1
	test	eax, eax
	jne	SHORT $L70880
	mov	ecx, DWORD PTR _form$[ebp]
	mov	edx, DWORD PTR [ecx+132]
	and	edx, 2
	test	edx, edx
	je	$L70879
	mov	eax, DWORD PTR _form$[ebp]
	mov	ecx, DWORD PTR [eax+204]
	and	ecx, 2
	test	ecx, ecx
	jne	$L70879
$L70880:

; 584  : 		if(put_html_chkbox(cntxt, DYNBUF_VAL_SZ(name), "1", 1, form->savedlg_outmode & 1 ? 1 : 0, 1)) STACK_ERROR;

	cmp	DWORD PTR _name$[ebp], 0
	je	SHORT $L71084
	mov	edx, DWORD PTR _name$[ebp]
	mov	eax, DWORD PTR [edx+4]
	mov	DWORD PTR -44+[ebp], eax
	jmp	SHORT $L71085
$L71084:
	mov	DWORD PTR -44+[ebp], 0
$L71085:
	cmp	DWORD PTR _name$[ebp], 0
	je	SHORT $L71086
	mov	ecx, DWORD PTR _name$[ebp]
	add	ecx, 8
	mov	DWORD PTR -48+[ebp], ecx
	jmp	SHORT $L71087
$L71086:
	mov	DWORD PTR -48+[ebp], 0
$L71087:
	push	1
	mov	edx, DWORD PTR _form$[ebp]
	mov	eax, DWORD PTR [edx+204]
	and	eax, 1
	neg	eax
	sbb	eax, eax
	neg	eax
	push	eax
	push	1
	push	OFFSET FLAT:$SG70883
	mov	ecx, DWORD PTR -44+[ebp]
	push	ecx
	mov	edx, DWORD PTR -48+[ebp]
	push	edx
	mov	eax, DWORD PTR _cntxt$[ebp]
	push	eax
	call	_put_html_chkbox
	add	esp, 28					; 0000001cH
	test	eax, eax
	je	SHORT $L70882
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 584		; 00000248H
	jmp	$eva_err$70676
$L70882:

; 585  : 		DYNBUF_ADD_STR(form->html, "</td><td><font size=-1>Afficher les avertissements");

	push	0
	push	0
	push	50					; 00000032H
	push	OFFSET FLAT:$SG70886
	mov	edx, DWORD PTR _form$[ebp]
	mov	eax, DWORD PTR [edx+232]
	push	eax
	call	_dynbuf_add
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L70885
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29872], OFFSET FLAT:$SG70888
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 585		; 00000249H
	jmp	$eva_err$70676
$L70885:

; 587  : 	else if(form->savedlg_outmode & 1)

	jmp	$L70893
$L70879:
	mov	eax, DWORD PTR _form$[ebp]
	mov	ecx, DWORD PTR [eax+204]
	and	ecx, 1
	test	ecx, ecx
	je	SHORT $L70893

; 588  : 		DYNBUF_ADD3_BUF(form->html, "<input type=hidden name='", name, NO_CONV, "' value=1>");

	cmp	DWORD PTR _name$[ebp], 0
	je	SHORT $L71088
	mov	edx, DWORD PTR _name$[ebp]
	mov	eax, DWORD PTR [edx+4]
	mov	DWORD PTR -52+[ebp], eax
	jmp	SHORT $L71089
$L71088:
	mov	DWORD PTR -52+[ebp], 0
$L71089:
	cmp	DWORD PTR _name$[ebp], 0
	je	SHORT $L71090
	mov	ecx, DWORD PTR _name$[ebp]
	add	ecx, 8
	mov	DWORD PTR -56+[ebp], ecx
	jmp	SHORT $L71091
$L71090:
	mov	DWORD PTR -56+[ebp], 0
$L71091:
	push	10					; 0000000aH
	push	OFFSET FLAT:$SG70894
	push	0
	push	0
	mov	edx, DWORD PTR -52+[ebp]
	push	edx
	mov	eax, DWORD PTR -56+[ebp]
	push	eax
	push	25					; 00000019H
	push	OFFSET FLAT:$SG70895
	mov	ecx, DWORD PTR _form$[ebp]
	mov	edx, DWORD PTR [ecx+232]
	push	edx
	call	_dynbuf_add3
	add	esp, 36					; 00000024H
	test	eax, eax
	je	SHORT $L70893
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29872], OFFSET FLAT:$SG70897
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 588		; 0000024cH
	jmp	$eva_err$70676
$L70893:

; 589  : 	DYNBUF_ADD_STR(form->html, "</td></tr></table></td>");

	push	0
	push	0
	push	23					; 00000017H
	push	OFFSET FLAT:$SG70900
	mov	edx, DWORD PTR _form$[ebp]
	mov	eax, DWORD PTR [edx+232]
	push	eax
	call	_dynbuf_add
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L70899
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29872], OFFSET FLAT:$SG70902
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 589		; 0000024dH
	jmp	$eva_err$70676
$L70899:

; 592  : 		"</tr></table>\n")

	push	0
	push	0
	push	14					; 0000000eH
	push	OFFSET FLAT:$SG70905
	mov	eax, DWORD PTR _form$[ebp]
	mov	ecx, DWORD PTR [eax+232]
	push	ecx
	call	_dynbuf_add
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L70904
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29872], OFFSET FLAT:$SG70907
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 592		; 00000250H
	jmp	$eva_err$70676
$L70904:

; 593  : 
; 594  : 	/* Set form dialog control */
; 595  : 	DYNTAB_ADD_BUF(&form->dlg_ctrl, 0, 0, ctrl->cginame);

	mov	ecx, DWORD PTR _ctrl$[ebp]
	cmp	DWORD PTR [ecx+40], 0
	je	SHORT $L70908
	mov	edx, DWORD PTR _ctrl$[ebp]
	mov	eax, DWORD PTR [edx+40]
	cmp	DWORD PTR [eax+4], 0
	je	SHORT $L70908
	push	0
	push	0
	mov	ecx, DWORD PTR _ctrl$[ebp]
	mov	edx, DWORD PTR [ecx+40]
	mov	eax, DWORD PTR [edx+4]
	push	eax
	mov	ecx, DWORD PTR _ctrl$[ebp]
	mov	edx, DWORD PTR [ecx+40]
	add	edx, 8
	push	edx
	push	0
	push	0
	mov	eax, DWORD PTR _form$[ebp]
	add	eax, 180				; 000000b4H
	push	eax
	call	_dyntab_add
	add	esp, 28					; 0000001cH
	test	eax, eax
	je	SHORT $L70910
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29872], OFFSET FLAT:$SG70912
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 595		; 00000253H
	jmp	SHORT $eva_err$70676
$L70910:
	jmp	SHORT $L70916
$L70908:
	push	0
	push	0
	push	0
	push	0
	push	0
	push	0
	mov	eax, DWORD PTR _form$[ebp]
	add	eax, 180				; 000000b4H
	push	eax
	call	_dyntab_add
	add	esp, 28					; 0000001cH
	test	eax, eax
	je	SHORT $L70916
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29872], OFFSET FLAT:$SG70918
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 595		; 00000253H
	jmp	SHORT $eva_err$70676
$L70916:
$eva_noerr$70919:

; 596  : 
; 597  : 	RETURN_OK_CLEANUP;

	push	0
	push	OFFSET FLAT:$SG70920
	push	OFFSET FLAT:$SG70921
	mov	eax, DWORD PTR _cntxt$[ebp]
	push	eax
	call	_err_clear
	add	esp, 16					; 00000010H
$eva_err$70676:
	mov	ecx, DWORD PTR _cntxt$[ebp]
	cmp	DWORD PTR [ecx+29872], 0
	je	SHORT $L70922
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	eax, DWORD PTR [edx+29900]
	push	eax
	push	OFFSET FLAT:$SG70923
	push	OFFSET FLAT:$SG70924
	mov	ecx, DWORD PTR _cntxt$[ebp]
	push	ecx
	call	_err_add_context
	add	esp, 16					; 00000010H
$L70922:
	mov	edx, DWORD PTR _name$[ebp]
	push	edx
	call	_mem_free
	add	esp, 4
	mov	DWORD PTR _name$[ebp], 0
	mov	eax, DWORD PTR _cntxt$[ebp]
	xor	ecx, ecx
	cmp	DWORD PTR [eax+29872], 0
	setne	cl
	mov	eax, ecx

; 598  : }

	mov	esp, ebp
	pop	ebp
	ret	0
_form_save_dialog_output ENDP
_TEXT	ENDS
EXTRN	_cgi_get_subfield:NEAR
EXTRN	_strstr:NEAR
_BSS	SEGMENT
	ALIGN	4

$SG70967 DB	01H DUP (?)
_BSS	ENDS
_DATA	SEGMENT
$SG70947 DB	'_EVA_NOSAVE', 00H
$SG70952 DB	'_EVA_NOSAVE', 00H
$SG70959 DB	'_EVA_CONFIRMNONE', 00H
	ORG $+3
$SG70960 DB	'_EVA_CONFIRMWARN', 00H
	ORG $+3
$SG70961 DB	'_EVA_CONFIRMCHANGE', 00H
	ORG $+1
$SG70962 DB	'_EVA_CONFIRMNONE', 00H
	ORG $+3
$SG70963 DB	'_EVA_CONFIRMWARN', 00H
	ORG $+3
$SG70964 DB	'_EVA_CONFIRMCHANGE', 00H
	ORG $+1
$SG70969 DB	'FORMCLOSE', 00H
	ORG $+2
$SG70970 DB	'FORMRESTORE', 00H
$SG70971 DB	'FORMGOBACKOBJ', 00H
	ORG $+2
$SG70972 DB	'FORMSAVE_NEXT', 00H
	ORG $+2
$SG70973 DB	'FORMSAVE_CLOSE', 00H
	ORG $+1
$SG70974 DB	'FORMSAVE_BACK', 00H
	ORG $+2
$SG70976 DB	'CHANGE', 00H
	ORG $+1
$SG70979 DB	'WARN', 00H
	ORG $+3
$SG70989 DB	'</td>', 00H
	ORG $+2
$SG70996 DB	'<br><br></td></tr><tr>', 00H
	ORG $+1
$SG70997 DB	'<font color=#FF8844><b>Fiche incompl', 0e8H, 'te : il y '
	DB	'a des avertissements</b></font>', 00H
	ORG $+1
$SG70998 DB	'<b>Fiche compl', 0e8H, 'te</b>', 00H
	ORG $+2
$SG70999 DB	'<td colspan=2 align=center><br>', 00H
$SG71001 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG71018 DB	'D:\Travail\ABI\EVA\V4.0\CGI\Brunix-2016\form_save.c', 00H
$SG71019 DB	'form_save_dialog', 00H
	ORG $+3
$SG71021 DB	'D:\Travail\ABI\EVA\V4.0\CGI\Brunix-2016\form_save.c', 00H
$SG71022 DB	'form_save_dialog', 00H
_DATA	ENDS
_TEXT	SEGMENT
_cntxt$ = 8
_i_ctrl$ = 12
_confirm$ = 16
_butns$ = 20
_clicbtn$ = 24
_form$ = -4
_ctrl$ = -40
_cgival$ = -36
_b_nodlg$ = -8
_actionbtn$ = -16
_b_first$ = -12
_btn$70966 = -44
_form_save_dialog PROC NEAR

; 616  : ){

	push	ebp
	mov	ebp, esp
	sub	esp, 116				; 00000074H

; 617  : 	EVA_form *form = cntxt->form;

	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	ecx, DWORD PTR [eax+80]
	mov	DWORD PTR _form$[ebp], ecx

; 618  : 	EVA_ctrl *ctrl = form->ctrl + i_ctrl;

	mov	edx, DWORD PTR _i_ctrl$[ebp]
	imul	edx, 480				; 000001e0H
	mov	eax, DWORD PTR _form$[ebp]
	mov	ecx, DWORD PTR [eax]
	add	ecx, edx
	mov	DWORD PTR _ctrl$[ebp], ecx

; 619  : 	DynTable cgival = {0};

	mov	DWORD PTR _cgival$[ebp], 0
	xor	edx, edx
	mov	DWORD PTR _cgival$[ebp+4], edx
	mov	DWORD PTR _cgival$[ebp+8], edx
	mov	DWORD PTR _cgival$[ebp+12], edx
	mov	DWORD PTR _cgival$[ebp+16], edx

; 620  : 	int b_nodlg = 0, actionbtn = 0;

	mov	DWORD PTR _b_nodlg$[ebp], 0
	mov	DWORD PTR _actionbtn$[ebp], 0

; 621  : 	int b_first = form->prevstep != HtmlSaveDlg;

	mov	eax, DWORD PTR _form$[ebp]
	xor	ecx, ecx
	cmp	DWORD PTR [eax+168], 3
	setne	cl
	mov	DWORD PTR _b_first$[ebp], ecx

; 622  : 
; 623  : 	/* End dialog & return if no save */
; 624  :  	if(!strcmp(confirm, "_EVA_NOSAVE") || (clicbtn && *clicbtn == BUTN_CLOSE && form->prevstep == HtmlView))

	push	OFFSET FLAT:$SG70947
	mov	edx, DWORD PTR _confirm$[ebp]
	push	edx
	call	_strcmp
	add	esp, 8
	test	eax, eax
	je	SHORT $L70946
	cmp	DWORD PTR _clicbtn$[ebp], 0
	je	SHORT $L70945
	mov	eax, DWORD PTR _clicbtn$[ebp]
	cmp	DWORD PTR [eax], 8
	jne	SHORT $L70945
	mov	ecx, DWORD PTR _form$[ebp]
	cmp	DWORD PTR [ecx+168], 6
	jne	SHORT $L70945
$L70946:

; 626  : 		if(form_save_dialog_end(cntxt, clicbtn ? *clicbtn : BUTN_CLOSE)) STACK_ERROR;

	cmp	DWORD PTR _clicbtn$[ebp], 0
	je	SHORT $L71093
	mov	edx, DWORD PTR _clicbtn$[ebp]
	mov	eax, DWORD PTR [edx]
	mov	DWORD PTR -48+[ebp], eax
	jmp	SHORT $L71094
$L71093:
	mov	DWORD PTR -48+[ebp], 8
$L71094:
	mov	ecx, DWORD PTR -48+[ebp]
	push	ecx
	mov	edx, DWORD PTR _cntxt$[ebp]
	push	edx
	call	_form_save_dialog_end
	add	esp, 8
	test	eax, eax
	je	SHORT $L70948
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 626		; 00000272H
	jmp	$eva_err$70949
$L70948:

; 627  : 		RETURN_OK;

	jmp	$eva_noerr$70950
$L70945:

; 629  : 
; 630  : 	form->error = 0;

	mov	ecx, DWORD PTR _form$[ebp]
	mov	DWORD PTR [ecx+132], 0

; 631  : 	if(strcmp(confirm, "_EVA_NOSAVE"))

	push	OFFSET FLAT:$SG70952
	mov	edx, DWORD PTR _confirm$[ebp]
	push	edx
	call	_strcmp
	add	esp, 8
	test	eax, eax
	je	$L70956

; 633  : 		/* Check data for each input control */
; 634  : 		form->step = InputCheck;

	mov	eax, DWORD PTR _form$[ebp]
	mov	DWORD PTR [eax+176], 2

; 635  : 		if(dyntab_sz(&form->id_obj, 0, 0)) form->b_modified = 0;

	push	0
	push	0
	mov	ecx, DWORD PTR _form$[ebp]
	add	ecx, 32					; 00000020H
	push	ecx
	call	_dyntab_sz
	add	esp, 12					; 0000000cH
	test	eax, eax
	je	SHORT $L70953
	mov	edx, DWORD PTR _form$[ebp]
	mov	DWORD PTR [edx+128], 0
$L70953:

; 636  : 		if(ctrl_add_child(cntxt, 0, NULL)) STACK_ERROR;

	push	0
	push	0
	mov	eax, DWORD PTR _cntxt$[ebp]
	push	eax
	call	_ctrl_add_child
	add	esp, 12					; 0000000cH
	test	eax, eax
	je	SHORT $L70955
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 636		; 0000027cH
	jmp	$eva_err$70949
$L70955:

; 637  : 
; 638  : 		/* Check duplicates if no fatal error or close unchanged form */
; 639  : 		if(form->error < 2 && !(b_first && !form->b_modified && clicbtn && *clicbtn & BUTN_CLOSE) &&
; 640  : 			form_check_keys(cntxt)) STACK_ERROR;

	mov	edx, DWORD PTR _form$[ebp]
	cmp	DWORD PTR [edx+132], 2
	jge	SHORT $L70956
	cmp	DWORD PTR _b_first$[ebp], 0
	je	SHORT $L70957
	mov	eax, DWORD PTR _form$[ebp]
	cmp	DWORD PTR [eax+128], 0
	jne	SHORT $L70957
	cmp	DWORD PTR _clicbtn$[ebp], 0
	je	SHORT $L70957
	mov	ecx, DWORD PTR _clicbtn$[ebp]
	mov	edx, DWORD PTR [ecx]
	and	edx, 8
	test	edx, edx
	jne	SHORT $L70956
$L70957:
	mov	eax, DWORD PTR _cntxt$[ebp]
	push	eax
	call	_form_check_keys
	add	esp, 4
	test	eax, eax
	je	SHORT $L70956
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 640		; 00000280H
	jmp	$eva_err$70949
$L70956:

; 642  : 
; 643  : 	if(b_first)

	cmp	DWORD PTR _b_first$[ebp], 0
	je	$L70958

; 645  : 		/* First dialog display : Initialize default button */
; 646  : 		actionbtn = clicbtn ? *clicbtn : 0;

	cmp	DWORD PTR _clicbtn$[ebp], 0
	je	SHORT $L71095
	mov	edx, DWORD PTR _clicbtn$[ebp]
	mov	eax, DWORD PTR [edx]
	mov	DWORD PTR -52+[ebp], eax
	jmp	SHORT $L71096
$L71095:
	mov	DWORD PTR -52+[ebp], 0
$L71096:
	mov	ecx, DWORD PTR -52+[ebp]
	mov	DWORD PTR _actionbtn$[ebp], ecx

; 647  : 
; 648  : 		/* Initialize displayed infos */
; 649  : 		form->savedlg_outmode =
; 650  : 			(actionbtn & BUTN_CLOSE ? 0 : 2) | (
; 651  : 				!strcmp(confirm, "_EVA_CONFIRMNONE") ? 0 :
; 652  : 				!strcmp(confirm, "_EVA_CONFIRMWARN") ?  actionbtn & BUTN_CLOSE ? 0 : 1:
; 653  : 				!strcmp(confirm, "_EVA_CONFIRMCHANGE") ? 4 : (actionbtn & BUTN_CLOSE ? 0 : 1) | 4);

	push	OFFSET FLAT:$SG70959
	mov	edx, DWORD PTR _confirm$[ebp]
	push	edx
	call	_strcmp
	add	esp, 8
	test	eax, eax
	jne	SHORT $L71101
	mov	DWORD PTR -56+[ebp], 0
	jmp	SHORT $L71102
$L71101:
	push	OFFSET FLAT:$SG70960
	mov	eax, DWORD PTR _confirm$[ebp]
	push	eax
	call	_strcmp
	add	esp, 8
	test	eax, eax
	jne	SHORT $L71099
	mov	ecx, DWORD PTR _actionbtn$[ebp]
	and	ecx, 8
	neg	ecx
	sbb	ecx, ecx
	inc	ecx
	mov	DWORD PTR -60+[ebp], ecx
	jmp	SHORT $L71100
$L71099:
	push	OFFSET FLAT:$SG70961
	mov	edx, DWORD PTR _confirm$[ebp]
	push	edx
	call	_strcmp
	add	esp, 8
	test	eax, eax
	jne	SHORT $L71097
	mov	DWORD PTR -64+[ebp], 4
	jmp	SHORT $L71098
$L71097:
	mov	eax, DWORD PTR _actionbtn$[ebp]
	and	eax, 8
	neg	eax
	sbb	eax, eax
	inc	eax
	or	al, 4
	mov	DWORD PTR -64+[ebp], eax
$L71098:
	mov	ecx, DWORD PTR -64+[ebp]
	mov	DWORD PTR -60+[ebp], ecx
$L71100:
	mov	edx, DWORD PTR -60+[ebp]
	mov	DWORD PTR -56+[ebp], edx
$L71102:
	mov	eax, DWORD PTR _actionbtn$[ebp]
	and	eax, 8
	neg	eax
	sbb	eax, eax
	and	al, -2					; fffffffeH
	add	eax, 2
	or	eax, DWORD PTR -56+[ebp]
	mov	ecx, DWORD PTR _form$[ebp]
	mov	DWORD PTR [ecx+204], eax

; 654  : 
; 655  : 		/* Determine if confirm dialog needed */
; 656  : 		b_nodlg =
; 657  : 				!strcmp(confirm, "_EVA_CONFIRMNONE") ? form->error < 2 :
; 658  : 				!strcmp(confirm, "_EVA_CONFIRMWARN") ? !form->error :
; 659  : 				!strcmp(confirm, "_EVA_CONFIRMCHANGE") ? !form->b_modified :
; 660  : 										!form->error && !form->b_modified;

	push	OFFSET FLAT:$SG70962
	mov	edx, DWORD PTR _confirm$[ebp]
	push	edx
	call	_strcmp
	add	esp, 8
	test	eax, eax
	jne	SHORT $L71109
	mov	eax, DWORD PTR _form$[ebp]
	xor	ecx, ecx
	cmp	DWORD PTR [eax+132], 2
	setl	cl
	mov	DWORD PTR -68+[ebp], ecx
	jmp	$L71110
$L71109:
	push	OFFSET FLAT:$SG70963
	mov	edx, DWORD PTR _confirm$[ebp]
	push	edx
	call	_strcmp
	add	esp, 8
	test	eax, eax
	jne	SHORT $L71107
	mov	eax, DWORD PTR _form$[ebp]
	xor	ecx, ecx
	cmp	DWORD PTR [eax+132], 0
	sete	cl
	mov	DWORD PTR -72+[ebp], ecx
	jmp	SHORT $L71108
$L71107:
	push	OFFSET FLAT:$SG70964
	mov	edx, DWORD PTR _confirm$[ebp]
	push	edx
	call	_strcmp
	add	esp, 8
	test	eax, eax
	jne	SHORT $L71105
	mov	eax, DWORD PTR _form$[ebp]
	xor	ecx, ecx
	cmp	DWORD PTR [eax+128], 0
	sete	cl
	mov	DWORD PTR -76+[ebp], ecx
	jmp	SHORT $L71106
$L71105:
	mov	edx, DWORD PTR _form$[ebp]
	cmp	DWORD PTR [edx+132], 0
	jne	SHORT $L71103
	mov	eax, DWORD PTR _form$[ebp]
	cmp	DWORD PTR [eax+128], 0
	jne	SHORT $L71103
	mov	DWORD PTR -80+[ebp], 1
	jmp	SHORT $L71104
$L71103:
	mov	DWORD PTR -80+[ebp], 0
$L71104:
	mov	ecx, DWORD PTR -80+[ebp]
	mov	DWORD PTR -76+[ebp], ecx
$L71106:
	mov	edx, DWORD PTR -76+[ebp]
	mov	DWORD PTR -72+[ebp], edx
$L71108:
	mov	eax, DWORD PTR -72+[ebp]
	mov	DWORD PTR -68+[ebp], eax
$L71110:
	mov	ecx, DWORD PTR -68+[ebp]
	mov	DWORD PTR _b_nodlg$[ebp], ecx

; 662  : 	else

	jmp	$L70965
$L70958:

; 664  : 		/* Next dialogs : parse button click */
; 665  : 		char *btn = CGI_CLICK_BTN_SUBFIELD;

	mov	edx, DWORD PTR _cntxt$[ebp]
	cmp	DWORD PTR [edx+29648], 0
	je	SHORT $L71111
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	ecx, DWORD PTR [eax+29656]
	imul	ecx, 56					; 00000038H
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	eax, DWORD PTR [edx+29648]
	mov	ecx, DWORD PTR [eax+ecx]
	movsx	edx, BYTE PTR [ecx]
	cmp	edx, 66					; 00000042H
	jne	SHORT $L71111
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	ecx, DWORD PTR [eax+29656]
	imul	ecx, 56					; 00000038H
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	eax, DWORD PTR [edx+29648]
	cmp	DWORD PTR [eax+ecx+32], 0
	je	SHORT $L71111
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	edx, DWORD PTR [ecx+29656]
	imul	edx, 56					; 00000038H
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	ecx, DWORD PTR [eax+29648]
	mov	edx, DWORD PTR [ecx+edx+32]
	mov	DWORD PTR -84+[ebp], edx
	jmp	SHORT $L71112
$L71111:
	mov	DWORD PTR -84+[ebp], OFFSET FLAT:$SG70967
$L71112:
	mov	eax, DWORD PTR -84+[ebp]
	mov	DWORD PTR _btn$70966[ebp], eax

; 666  : 		if(*btn) actionbtn =

	mov	ecx, DWORD PTR _btn$70966[ebp]
	movsx	edx, BYTE PTR [ecx]
	test	edx, edx
	je	$L70968

; 667  : 			!strcmp(btn, "FORMCLOSE") ? BUTN_CLOSE :
; 668  : 			!strcmp(btn, "FORMRESTORE") ? BUTN_RESTORE :
; 669  : 			!strcmp(btn, "FORMGOBACKOBJ") ? BUTN_GOBACKOBJ :
; 670  : 			!strcmp(btn, "FORMSAVE_NEXT") ? BUTN_SAVE_NEXT :
; 671  : 			!strcmp(btn, "FORMSAVE_CLOSE") ? BUTN_SAVE_CLOSE :
; 672  : 			!strcmp(btn, "FORMSAVE_BACK") ? BUTN_SAVE_BACK :
; 673  : 			0;

	push	OFFSET FLAT:$SG70969
	mov	eax, DWORD PTR _btn$70966[ebp]
	push	eax
	call	_strcmp
	add	esp, 8
	test	eax, eax
	jne	SHORT $L71121
	mov	DWORD PTR -88+[ebp], 8
	jmp	$L71122
$L71121:
	push	OFFSET FLAT:$SG70970
	mov	ecx, DWORD PTR _btn$70966[ebp]
	push	ecx
	call	_strcmp
	add	esp, 8
	test	eax, eax
	jne	SHORT $L71119
	mov	DWORD PTR -92+[ebp], 16			; 00000010H
	jmp	$L71120
$L71119:
	push	OFFSET FLAT:$SG70971
	mov	edx, DWORD PTR _btn$70966[ebp]
	push	edx
	call	_strcmp
	add	esp, 8
	test	eax, eax
	jne	SHORT $L71117
	mov	DWORD PTR -96+[ebp], 32			; 00000020H
	jmp	SHORT $L71118
$L71117:
	push	OFFSET FLAT:$SG70972
	mov	eax, DWORD PTR _btn$70966[ebp]
	push	eax
	call	_strcmp
	add	esp, 8
	test	eax, eax
	jne	SHORT $L71115
	mov	DWORD PTR -100+[ebp], 1
	jmp	SHORT $L71116
$L71115:
	push	OFFSET FLAT:$SG70973
	mov	ecx, DWORD PTR _btn$70966[ebp]
	push	ecx
	call	_strcmp
	add	esp, 8
	test	eax, eax
	jne	SHORT $L71113
	mov	DWORD PTR -104+[ebp], 2
	jmp	SHORT $L71114
$L71113:
	push	OFFSET FLAT:$SG70974
	mov	edx, DWORD PTR _btn$70966[ebp]
	push	edx
	call	_strcmp
	add	esp, 8
	neg	eax
	sbb	eax, eax
	and	al, -4					; fffffffcH
	add	eax, 4
	mov	DWORD PTR -104+[ebp], eax
$L71114:
	mov	eax, DWORD PTR -104+[ebp]
	mov	DWORD PTR -100+[ebp], eax
$L71116:
	mov	ecx, DWORD PTR -100+[ebp]
	mov	DWORD PTR -96+[ebp], ecx
$L71118:
	mov	edx, DWORD PTR -96+[ebp]
	mov	DWORD PTR -92+[ebp], edx
$L71120:
	mov	eax, DWORD PTR -92+[ebp]
	mov	DWORD PTR -88+[ebp], eax
$L71122:
	mov	ecx, DWORD PTR -88+[ebp]
	mov	DWORD PTR _actionbtn$[ebp], ecx
$L70968:

; 674  : 
; 675  : 		/* Read displayed infos - always dislay error */
; 676  : 		form->savedlg_outmode = 2;

	mov	edx, DWORD PTR _form$[ebp]
	mov	DWORD PTR [edx+204], 2

; 677  : 		CTRL_GET_CGI_SUBFIELD("CHANGE");

	push	0
	push	0
	push	0
	push	OFFSET FLAT:$SG70976
	mov	eax, DWORD PTR _ctrl$[ebp]
	push	eax
	lea	ecx, DWORD PTR _cgival$[ebp]
	push	ecx
	mov	edx, DWORD PTR _cntxt$[ebp]
	push	edx
	call	_cgi_get_subfield
	add	esp, 28					; 0000001cH
	test	eax, eax
	je	SHORT $L70975
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 677		; 000002a5H
	jmp	$eva_err$70949
$L70975:

; 678  : 		if(cgival.nbrows) form->savedlg_outmode |= 4;

	cmp	DWORD PTR _cgival$[ebp], 0
	je	SHORT $L70977
	mov	ecx, DWORD PTR _form$[ebp]
	mov	edx, DWORD PTR [ecx+204]
	or	edx, 4
	mov	eax, DWORD PTR _form$[ebp]
	mov	DWORD PTR [eax+204], edx
$L70977:

; 679  : 		CTRL_GET_CGI_SUBFIELD("WARN");

	push	0
	push	0
	push	0
	push	OFFSET FLAT:$SG70979
	mov	ecx, DWORD PTR _ctrl$[ebp]
	push	ecx
	lea	edx, DWORD PTR _cgival$[ebp]
	push	edx
	mov	eax, DWORD PTR _cntxt$[ebp]
	push	eax
	call	_cgi_get_subfield
	add	esp, 28					; 0000001cH
	test	eax, eax
	je	SHORT $L70978
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 679		; 000002a7H
	jmp	$eva_err$70949
$L70978:

; 680  : 		if(cgival.nbrows) form->savedlg_outmode |= 1;

	cmp	DWORD PTR _cgival$[ebp], 0
	je	SHORT $L70980
	mov	edx, DWORD PTR _form$[ebp]
	mov	eax, DWORD PTR [edx+204]
	or	al, 1
	mov	ecx, DWORD PTR _form$[ebp]
	mov	DWORD PTR [ecx+204], eax
$L70980:

; 681  : 
; 682  : 		/* Determine if confirm dialog needed */
; 683  : 		b_nodlg = (actionbtn || form->prevstep != HtmlSaveDlg) && form->error < 2;

	cmp	DWORD PTR _actionbtn$[ebp], 0
	jne	SHORT $L71123
	mov	edx, DWORD PTR _form$[ebp]
	cmp	DWORD PTR [edx+168], 3
	je	SHORT $L71124
$L71123:
	mov	eax, DWORD PTR _form$[ebp]
	cmp	DWORD PTR [eax+132], 2
	jge	SHORT $L71124
	mov	DWORD PTR -108+[ebp], 1
	jmp	SHORT $L71125
$L71124:
	mov	DWORD PTR -108+[ebp], 0
$L71125:
	mov	ecx, DWORD PTR -108+[ebp]
	mov	DWORD PTR _b_nodlg$[ebp], ecx
$L70965:

; 685  : 
; 686  : 	/* Disable save if errors */
; 687  : 	if(form->error > 1)

	mov	edx, DWORD PTR _form$[ebp]
	cmp	DWORD PTR [edx+132], 1
	jle	SHORT $L70983

; 689  : 		if(!(actionbtn & BUTN_CLOSE)) b_nodlg = 0;

	mov	eax, DWORD PTR _actionbtn$[ebp]
	and	eax, 8
	test	eax, eax
	jne	SHORT $L70982
	mov	DWORD PTR _b_nodlg$[ebp], 0
$L70982:

; 690  : 		if(actionbtn & BUTN_SAVE) actionbtn = 0;

	mov	ecx, DWORD PTR _actionbtn$[ebp]
	and	ecx, 7
	test	ecx, ecx
	je	SHORT $L70983
	mov	DWORD PTR _actionbtn$[ebp], 0
$L70983:

; 692  : 
; 693  : 	/* If dialog applicable */
; 694  : 	form->step = HtmlSaveDlg;

	mov	edx, DWORD PTR _form$[ebp]
	mov	DWORD PTR [edx+176], 3

; 695  : 	if(!b_nodlg)

	cmp	DWORD PTR _b_nodlg$[ebp], 0
	jne	$L70995

; 697  : 		/* Output selected controls in form->html_tabs */
; 698  : 		form->html = &form->html_tabs;

	mov	eax, DWORD PTR _form$[ebp]
	add	eax, 220				; 000000dcH
	mov	ecx, DWORD PTR _form$[ebp]
	mov	DWORD PTR [ecx+232], eax

; 699  : 		if(ctrl_add_child(cntxt, 0, NULL)) STACK_ERROR;

	push	0
	push	0
	mov	edx, DWORD PTR _cntxt$[ebp]
	push	edx
	call	_ctrl_add_child
	add	esp, 12					; 0000000cH
	test	eax, eax
	je	SHORT $L70986
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 699		; 000002bbH
	jmp	$eva_err$70949
$L70986:

; 700  : 
; 701  : 		/* Handle if no selected control */
; 702  : 		if(!form->html_tabs || !form->html_tabs->data ||
; 703  : 			!strstr(form->html_tabs->data, "</td>"))

	mov	ecx, DWORD PTR _form$[ebp]
	cmp	DWORD PTR [ecx+220], 0
	je	SHORT $L70988
	mov	edx, DWORD PTR _form$[ebp]
	mov	eax, DWORD PTR [edx+220]
	add	eax, 8
	test	eax, eax
	je	SHORT $L70988
	push	OFFSET FLAT:$SG70989
	mov	ecx, DWORD PTR _form$[ebp]
	mov	edx, DWORD PTR [ecx+220]
	add	edx, 8
	push	edx
	call	_strstr
	add	esp, 8
	test	eax, eax
	jne	$L70995
$L70988:

; 705  : 			if(b_first && actionbtn & BUTN_CLOSE)

	cmp	DWORD PTR _b_first$[ebp], 0
	je	SHORT $L70990
	mov	eax, DWORD PTR _actionbtn$[ebp]
	and	eax, 8
	test	eax, eax
	je	SHORT $L70990

; 707  : 				b_nodlg = 1;

	mov	DWORD PTR _b_nodlg$[ebp], 1

; 708  : 				form->html = NULL;

	mov	ecx, DWORD PTR _form$[ebp]
	mov	DWORD PTR [ecx+232], 0

; 710  : 			else if(!form->html_err)

	jmp	SHORT $L70995
$L70990:
	mov	edx, DWORD PTR _form$[ebp]
	cmp	DWORD PTR [edx+208], 0
	jne	SHORT $L70995

; 712  : 					form->error ?
; 713  : 						"<font color=#FF8844><b>Fiche incomplète : il y a des avertissements</b></font>" :
; 714  : 						"<b>Fiche complète</b>", 0, NO_CONV,
; 715  : 					"<br><br></td></tr><tr>");

	mov	eax, DWORD PTR _form$[ebp]
	cmp	DWORD PTR [eax+132], 0
	je	SHORT $L71126
	mov	DWORD PTR -112+[ebp], OFFSET FLAT:$SG70997
	jmp	SHORT $L71127
$L71126:
	mov	DWORD PTR -112+[ebp], OFFSET FLAT:$SG70998
$L71127:
	push	22					; 00000016H
	push	OFFSET FLAT:$SG70996
	push	0
	push	0
	push	0
	mov	ecx, DWORD PTR -112+[ebp]
	push	ecx
	push	31					; 0000001fH
	push	OFFSET FLAT:$SG70999
	mov	edx, DWORD PTR _form$[ebp]
	mov	eax, DWORD PTR [edx+232]
	push	eax
	call	_dynbuf_add3
	add	esp, 36					; 00000024H
	test	eax, eax
	je	SHORT $L70995
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29872], OFFSET FLAT:$SG71001
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 715		; 000002cbH
	jmp	$eva_err$70949
$L70995:

; 718  : 
; 719  : 	/* Handle action if applicable */
; 720  : 	if(b_first && !b_nodlg) actionbtn =0;

	cmp	DWORD PTR _b_first$[ebp], 0
	je	SHORT $L71002
	cmp	DWORD PTR _b_nodlg$[ebp], 0
	jne	SHORT $L71002
	mov	DWORD PTR _actionbtn$[ebp], 0
$L71002:

; 721  : 	switch(actionbtn)
; 722  : 	{

	mov	eax, DWORD PTR _actionbtn$[ebp]
	mov	DWORD PTR -116+[ebp], eax
	mov	ecx, DWORD PTR -116+[ebp]
	sub	ecx, 1
	mov	DWORD PTR -116+[ebp], ecx
	cmp	DWORD PTR -116+[ebp], 31		; 0000001fH
	ja	$L71015
	mov	eax, DWORD PTR -116+[ebp]
	xor	edx, edx
	mov	dl, BYTE PTR $L71128[eax]
	jmp	DWORD PTR $L71129[edx*4]
$L71007:

; 723  : 	case BUTN_CLOSE:
; 724  : 	case BUTN_RESTORE:
; 725  : 	case BUTN_GOBACKOBJ:
; 726  : 		if(form_save_dialog_end(cntxt, actionbtn)) STACK_ERROR;

	mov	ecx, DWORD PTR _actionbtn$[ebp]
	push	ecx
	mov	edx, DWORD PTR _cntxt$[ebp]
	push	edx
	call	_form_save_dialog_end
	add	esp, 8
	test	eax, eax
	je	SHORT $L71008
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 726		; 000002d6H
	jmp	$eva_err$70949
$L71008:

; 727  : 		break;

	jmp	$L71004
$L71009:

; 728  : 
; 729  : 	case BUTN_SAVE_CLOSE:
; 730  : 		if(form_save(cntxt)) STACK_ERROR;

	mov	ecx, DWORD PTR _cntxt$[ebp]
	push	ecx
	call	_form_save
	add	esp, 4
	test	eax, eax
	je	SHORT $L71010
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 730		; 000002daH
	jmp	$eva_err$70949
$L71010:

; 731  : 		if(form_save_dialog_end(cntxt, BUTN_CLOSE)) STACK_ERROR;

	push	8
	mov	eax, DWORD PTR _cntxt$[ebp]
	push	eax
	call	_form_save_dialog_end
	add	esp, 8
	test	eax, eax
	je	SHORT $L71011
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 731		; 000002dbH
	jmp	$eva_err$70949
$L71011:

; 732  : 		break;

	jmp	SHORT $L71004
$L71012:

; 733  : 
; 734  : 	case BUTN_SAVE_BACK:
; 735  : 	case BUTN_SAVE_NEXT:
; 736  : 		if(form_save(cntxt)) STACK_ERROR;

	mov	edx, DWORD PTR _cntxt$[ebp]
	push	edx
	call	_form_save
	add	esp, 4
	test	eax, eax
	je	SHORT $L71013
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 736		; 000002e0H
	jmp	SHORT $eva_err$70949
$L71013:

; 737  : 		if(form_save_dialog_end(cntxt, 0)) STACK_ERROR;

	push	0
	mov	ecx, DWORD PTR _cntxt$[ebp]
	push	ecx
	call	_form_save_dialog_end
	add	esp, 8
	test	eax, eax
	je	SHORT $L71014
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 737		; 000002e1H
	jmp	SHORT $eva_err$70949
$L71014:

; 738  : 		break;

	jmp	SHORT $L71004
$L71015:

; 739  : 
; 740  : 	default:
; 741  : 		/* Output message and dialog buttons if applicable */
; 742  : 		if(form_save_dialog_output(cntxt, i_ctrl, butns, clicbtn)) STACK_ERROR;

	mov	eax, DWORD PTR _clicbtn$[ebp]
	push	eax
	mov	ecx, DWORD PTR _butns$[ebp]
	push	ecx
	mov	edx, DWORD PTR _i_ctrl$[ebp]
	push	edx
	mov	eax, DWORD PTR _cntxt$[ebp]
	push	eax
	call	_form_save_dialog_output
	add	esp, 16					; 00000010H
	test	eax, eax
	je	SHORT $L71016
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 742		; 000002e6H
	jmp	SHORT $eva_err$70949
$L71016:
$L71004:

; 744  : 	if(clicbtn) *clicbtn = actionbtn;

	cmp	DWORD PTR _clicbtn$[ebp], 0
	je	SHORT $eva_noerr$70950
	mov	edx, DWORD PTR _clicbtn$[ebp]
	mov	eax, DWORD PTR _actionbtn$[ebp]
	mov	DWORD PTR [edx], eax
$eva_noerr$70950:

; 745  : 
; 746  : 	RETURN_OK_CLEANUP;

	push	0
	push	OFFSET FLAT:$SG71018
	push	OFFSET FLAT:$SG71019
	mov	ecx, DWORD PTR _cntxt$[ebp]
	push	ecx
	call	_err_clear
	add	esp, 16					; 00000010H
$eva_err$70949:
	mov	edx, DWORD PTR _cntxt$[ebp]
	cmp	DWORD PTR [edx+29872], 0
	je	SHORT $L71020
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	ecx, DWORD PTR [eax+29900]
	push	ecx
	push	OFFSET FLAT:$SG71021
	push	OFFSET FLAT:$SG71022
	mov	edx, DWORD PTR _cntxt$[ebp]
	push	edx
	call	_err_add_context
	add	esp, 16					; 00000010H
$L71020:
	lea	eax, DWORD PTR _cgival$[ebp]
	push	eax
	call	_dyntab_free
	add	esp, 4
	mov	ecx, DWORD PTR _cntxt$[ebp]
	xor	eax, eax
	cmp	DWORD PTR [ecx+29872], 0
	setne	al

; 747  : }

	mov	esp, ebp
	pop	ebp
	ret	0
$L71129:
	DD	$L71012
	DD	$L71009
	DD	$L71007
	DD	$L71015
$L71128:
	DB	0
	DB	1
	DB	3
	DB	0
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
	DB	2
_form_save_dialog ENDP
_TEXT	ENDS
END
