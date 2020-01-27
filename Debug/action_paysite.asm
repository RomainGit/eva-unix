	TITLE	D:\Travail\ABI\EVA\V4.0\CGI\Brunix-2016\action_paysite.c
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
PUBLIC	_HMAC_SHA1
EXTRN	_sprintf:NEAR
EXTRN	_HMAC:NEAR
EXTRN	_EVP_sha1:NEAR
EXTRN	_err_add_context:NEAR
EXTRN	_err_clear:NEAR
_DATA	SEGMENT
$SG80253 DB	'%02X', 00H
	ORG $+3
$SG80255 DB	'D:\Travail\ABI\EVA\V4.0\CGI\Brunix-2016\action_paysite.c'
	DB	00H
	ORG $+3
$SG80256 DB	'HMAC_SHA1', 00H
	ORG $+2
$SG80259 DB	'D:\Travail\ABI\EVA\V4.0\CGI\Brunix-2016\action_paysite.c'
	DB	00H
	ORG $+3
$SG80260 DB	'HMAC_SHA1', 00H
_DATA	ENDS
_TEXT	SEGMENT
_cntxt$ = 8
_res$ = 12
_k$ = 16
_kl$ = 20
_txt$ = 24
_len$ = 28
_b$ = -32
_i$ = -36
_j$ = -40
_HMAC_SHA1 PROC NEAR

; 60   : ){

	push	ebp
	mov	ebp, esp
	sub	esp, 40					; 00000028H

; 61   : 	char b[32];
; 62   : 	unsigned long i, j = 0;

	mov	DWORD PTR _j$[ebp], 0

; 63   : 
; 64   : 	HMAC(EVP_sha1(), (unsigned char*)k, kl, (unsigned char*)txt, len, (unsigned char*)b, (unsigned int*)&j);

	lea	eax, DWORD PTR _j$[ebp]
	push	eax
	lea	ecx, DWORD PTR _b$[ebp]
	push	ecx
	mov	edx, DWORD PTR _len$[ebp]
	push	edx
	mov	eax, DWORD PTR _txt$[ebp]
	push	eax
	mov	ecx, DWORD PTR _kl$[ebp]
	push	ecx
	mov	edx, DWORD PTR _k$[ebp]
	push	edx
	call	_EVP_sha1
	push	eax
	call	_HMAC
	add	esp, 28					; 0000001cH

; 65   : 	for(i = 0; i < j; i++) sprintf(res + i * 2, "%02X", b[i] & 0xFF);

	mov	DWORD PTR _i$[ebp], 0
	jmp	SHORT $L80250
$L80251:
	mov	eax, DWORD PTR _i$[ebp]
	add	eax, 1
	mov	DWORD PTR _i$[ebp], eax
$L80250:
	mov	ecx, DWORD PTR _i$[ebp]
	cmp	ecx, DWORD PTR _j$[ebp]
	jae	SHORT $eva_noerr$80254
	mov	edx, DWORD PTR _i$[ebp]
	movsx	eax, BYTE PTR _b$[ebp+edx]
	and	eax, 255				; 000000ffH
	push	eax
	push	OFFSET FLAT:$SG80253
	mov	ecx, DWORD PTR _i$[ebp]
	mov	edx, DWORD PTR _res$[ebp]
	lea	eax, DWORD PTR [edx+ecx*2]
	push	eax
	call	_sprintf
	add	esp, 12					; 0000000cH
	jmp	SHORT $L80251
$eva_noerr$80254:

; 66   : 
; 67   : 	RETURN_OK_CLEANUP;

	push	0
	push	OFFSET FLAT:$SG80255
	push	OFFSET FLAT:$SG80256
	mov	ecx, DWORD PTR _cntxt$[ebp]
	push	ecx
	call	_err_clear
	add	esp, 16					; 00000010H
$eva_err$80257:
	mov	edx, DWORD PTR _cntxt$[ebp]
	cmp	DWORD PTR [edx+29872], 0
	je	SHORT $L80258
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	ecx, DWORD PTR [eax+29900]
	push	ecx
	push	OFFSET FLAT:$SG80259
	push	OFFSET FLAT:$SG80260
	mov	edx, DWORD PTR _cntxt$[ebp]
	push	edx
	call	_err_add_context
	add	esp, 16					; 00000010H
$L80258:
	mov	eax, DWORD PTR _cntxt$[ebp]
	xor	ecx, ecx
	cmp	DWORD PTR [eax+29872], 0
	setne	cl
	mov	eax, ecx

; 68   : }

	mov	esp, ebp
	pop	ebp
	ret	0
_HMAC_SHA1 ENDP
_TEXT	ENDS
PUBLIC	_output_url
EXTRN	_printf:NEAR
EXTRN	_dyntab_val:NEAR
_DATA	SEGMENT
	ORG $+2
$SG80273 DB	0aH, '<input type=hidden name=%s value=''http&#x3a;&#x2f;'
	DB	'&#x2f;%s&#x2f;eva&#x2f;%s.cgi&#x3f;PaySite%s&#x3d;%s,%s,%s''>'
	DB	00H
_DATA	ENDS
_TEXT	SEGMENT
_cntxt$ = 8
_cx$ = 12
_name$ = 16
_tag$ = 20
_form$ = -4
_output_url PROC NEAR

; 81   : ){

	push	ebp
	mov	ebp, esp
	push	ecx

; 82   : 	EVA_form *form = cntxt->form;

	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	ecx, DWORD PTR [eax+80]
	mov	DWORD PTR _form$[ebp], ecx

; 83   : 	printf(	"\n<input type=hidden name=%s value='http&#x3a;&#x2f;&#x2f;%s&#x2f;eva&#x2f;%s.cgi&#x3f;PaySite%s&#x3d;%s,%s,%s'>",
; 84   : 			name, cntxt->srvname, cntxt->dbname, tag,
; 85   : 			dyntab_val(&cntxt->session, 0, 0),
; 86   : 			dyntab_val(&cx->ctrl->id, 0, 0),
; 87   : 			dyntab_val(&form->id_obj, 0, 0));

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
	mov	eax, DWORD PTR _cx$[ebp]
	mov	ecx, DWORD PTR [eax+480]
	push	ecx
	call	_dyntab_val
	add	esp, 12					; 0000000cH
	push	eax
	push	0
	push	0
	mov	edx, DWORD PTR _cntxt$[ebp]
	add	edx, 29300				; 00007274H
	push	edx
	call	_dyntab_val
	add	esp, 12					; 0000000cH
	push	eax
	mov	eax, DWORD PTR _tag$[ebp]
	push	eax
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	edx, DWORD PTR [ecx+29804]
	push	edx
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	ecx, DWORD PTR [eax+29744]
	push	ecx
	mov	edx, DWORD PTR _name$[ebp]
	push	edx
	push	OFFSET FLAT:$SG80273
	call	_printf
	add	esp, 32					; 00000020H

; 88   : }

	mov	esp, ebp
	pop	ebp
	ret	0
_output_url ENDP
_TEXT	ENDS
PUBLIC	_call_pay_site
EXTRN	__pctype:DWORD
EXTRN	__isctype:NEAR
EXTRN	_put_html_page_header:NEAR
EXTRN	_ctrl_eval_valtyp:NEAR
EXTRN	_fclose:NEAR
EXTRN	_fopen:NEAR
EXTRN	_fprintf:NEAR
EXTRN	__snprintf:NEAR
EXTRN	_setcase:NEAR
EXTRN	___mb_cur_max:DWORD
EXTRN	_mem_free:NEAR
EXTRN	_rand:NEAR
EXTRN	_strtoul:NEAR
EXTRN	_dynbuf_add:NEAR
EXTRN	_dynbuf_add3:NEAR
EXTRN	_qry_add_val:NEAR
EXTRN	_dyntab_free:NEAR
EXTRN	_dyntab_cell:NEAR
EXTRN	_dyntab_filter_field:NEAR
_BSS	SEGMENT
$SG80331 DB	01H DUP (?)
	ALIGN	4

$SG80390 DB	01H DUP (?)
	ALIGN	4

$SG80391 DB	01H DUP (?)
	ALIGN	4

$SG80392 DB	01H DUP (?)
	ALIGN	4

$SG80393 DB	01H DUP (?)
	ALIGN	4

$SG80394 DB	01H DUP (?)
_BSS	ENDS
_DATA	SEGMENT
$SG80291 DB	'1.2open', 00H
$SG80298 DB	'%lu', 00H
$SG80299 DB	'_EVA_PAY_BTN', 00H
	ORG $+3
$SG80303 DB	'%s%d', 00H
	ORG $+3
$SG80306 DB	'_EVA_PAY_AMOUNT', 00H
$SG80308 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG80311 DB	'_EVA_CURRENTOBJ', 00H
$SG80312 DB	'%sEUR', 00H
	ORG $+2
$SG80315 DB	'_EVA_PAY_LONGREF', 00H
	ORG $+3
$SG80317 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG80320 DB	'_EVA_CURRENTOBJ', 00H
$SG80330 DB	'*', 00H
	ORG $+2
$SG80333 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG80337 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG80340 DB	'*', 00H
	ORG $+2
$SG80341 DB	'*', 00H
	ORG $+2
$SG80343 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG80347 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG80350 DB	'*', 00H
	ORG $+2
$SG80351 DB	'*', 00H
	ORG $+2
$SG80353 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG80357 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG80360 DB	'*', 00H
	ORG $+2
$SG80361 DB	'*FR*', 00H
	ORG $+3
$SG80363 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG80367 DB	'Paiement par carte bancaire', 00H
$SG80368 DB	'https://ssl.paiement.cic-banques.fr/test/paiement.cgi', 00H
	ORG $+2
$SG80369 DB	'https://ssl.paiement.cic-banques.fr/paiement.cgi', 00H
	ORG $+3
$SG80370 DB	0aH, '<form method=post name=tpe action=''%s''>', 00H
	ORG $+3
$SG80371 DB	0aH, '<input type=hidden name=version value=''%s''>', 00H
	ORG $+3
$SG80372 DB	0aH, '<input type=hidden name=TPE value=''%s''>', 00H
	ORG $+3
$SG80373 DB	0aH, '<input type=hidden name=date value=''%s''>', 00H
	ORG $+2
$SG80374 DB	0aH, '<input type=hidden name=montant value=''%s''>', 00H
	ORG $+3
$SG80375 DB	0aH, '<input type=hidden name=reference value=%s>', 00H
	ORG $+3
$SG80376 DB	0aH, '<input type=hidden name=MAC value=''%s''>', 00H
	ORG $+3
$SG80377 DB	0aH, '<input type=hidden name=''texte-libre'' value=''%s'''
	DB	'>', 00H
	ORG $+1
$SG80378 DB	0aH, '<input type=hidden name=lgue value=FR>', 0aH, '<inp'
	DB	'ut type=hidden name=societe value=''%s''>', 00H
$SG80379 DB	'Return', 00H
	ORG $+1
$SG80380 DB	'url_retour', 00H
	ORG $+1
$SG80381 DB	'Ok', 00H
	ORG $+1
$SG80382 DB	'url_retour_ok', 00H
	ORG $+2
$SG80383 DB	'Err', 00H
$SG80384 DB	'url_retour_err', 00H
	ORG $+1
$SG80385 DB	'<script>document.write(''<input type=hidden name=bouton '
	DB	'value=CB>'')</script><noscript><center>Cliquez pour acc', 0e9H
	DB	'der au site de paiement<br><input type=submit name=bouton val'
	DB	'ue=''Paiement&#x20;CB''></noscript></form><script>document.tp'
	DB	'e.submit()</script>', 00H
	ORG $+2
$SG80387 DB	'ac', 00H
	ORG $+1
$SG80388 DB	'TPE.txt', 00H
$SG80395 DB	'NoTPE!', 00H
	ORG $+1
$SG80396 DB	0aH, '%s [%s] - Appel banque%s%s%s - societe=%s - montant'
	DB	'=%s', 00H
$SG80398 DB	'D:\Travail\ABI\EVA\V4.0\CGI\Brunix-2016\action_paysite.c'
	DB	00H
	ORG $+3
$SG80399 DB	'call_pay_site', 00H
	ORG $+2
$SG80401 DB	'D:\Travail\ABI\EVA\V4.0\CGI\Brunix-2016\action_paysite.c'
	DB	00H
	ORG $+3
$SG80402 DB	'call_pay_site', 00H
_DATA	ENDS
_TEXT	SEGMENT
_cntxt$ = 8
_cx$ = 12
_form$ = -48
_ctrl$ = -3312
_res$ = -3296
_expr$ = -72
_hash$ = -3308
_mac$ = -44
_longref$ = -3272
_version$ = -3276
_i$ = -3300
_j$ = -3304
_c$ = -52
_val$80296 = -3376
_f$80386 = -3380
_call_pay_site PROC NEAR

; 101  : ){

	push	ebp
	mov	ebp, esp
	sub	esp, 3400				; 00000d48H
	push	edi

; 102  : 	EVA_form *form = cntxt->form;

	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	ecx, DWORD PTR [eax+80]
	mov	DWORD PTR _form$[ebp], ecx

; 103  : 	EVA_ctrl *ctrl = cx->ctrl;

	mov	edx, DWORD PTR _cx$[ebp]
	mov	eax, DWORD PTR [edx+480]
	mov	DWORD PTR _ctrl$[ebp], eax

; 104  : 	DynTable res = {0};

	mov	DWORD PTR _res$[ebp], 0
	xor	ecx, ecx
	mov	DWORD PTR _res$[ebp+4], ecx
	mov	DWORD PTR _res$[ebp+8], ecx
	mov	DWORD PTR _res$[ebp+12], ecx
	mov	DWORD PTR _res$[ebp+16], ecx

; 105  : 	DynTable expr = {0};

	mov	DWORD PTR _expr$[ebp], 0
	xor	edx, edx
	mov	DWORD PTR _expr$[ebp+4], edx
	mov	DWORD PTR _expr$[ebp+8], edx
	mov	DWORD PTR _expr$[ebp+12], edx
	mov	DWORD PTR _expr$[ebp+16], edx

; 106  : 	DynBuffer *hash = NULL;

	mov	DWORD PTR _hash$[ebp], 0

; 107  : 	char mac[42];
; 108  : 	char longref[3200] = {0};

	mov	BYTE PTR _longref$[ebp], 0
	mov	ecx, 799				; 0000031fH
	xor	eax, eax
	lea	edi, DWORD PTR _longref$[ebp+1]
	rep stosd
	stosw
	stosb

; 109  : 	char *version = "1.2open";

	mov	DWORD PTR _version$[ebp], OFFSET FLAT:$SG80291

; 110  : 	unsigned long i, j;
; 111  : 	DynTableCell *c;
; 112  : 
; 113  : 	/* Store reference to caller button in object */
; 114  : 	if(cx->ctrl && cx->ctrl->attr.cell && cx->ctrl->attr.cell->IdObj)

	mov	eax, DWORD PTR _cx$[ebp]
	cmp	DWORD PTR [eax+480], 0
	je	$L80301
	mov	ecx, DWORD PTR _cx$[ebp]
	mov	edx, DWORD PTR [ecx+480]
	cmp	DWORD PTR [edx+60], 0
	je	$L80301
	mov	eax, DWORD PTR _cx$[ebp]
	mov	ecx, DWORD PTR [eax+480]
	mov	edx, DWORD PTR [ecx+60]
	cmp	DWORD PTR [edx+20], 0
	je	$L80301

; 116  : 		DynTableCell val = {0};

	mov	DWORD PTR _val$80296[ebp], 0
	mov	ecx, 15					; 0000000fH
	xor	eax, eax
	lea	edi, DWORD PTR _val$80296[ebp+4]
	rep stosd

; 117  : 		c = cx->ctrl->attr.cell;

	mov	eax, DWORD PTR _cx$[ebp]
	mov	ecx, DWORD PTR [eax+480]
	mov	edx, DWORD PTR [ecx+60]
	mov	DWORD PTR _c$[ebp], edx

; 118  : 		val.IdObj = DYNTAB_TOUL(&cntxt->id_obj);

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
	mov	DWORD PTR _val$80296[ebp+20], eax

; 119  : 		val.len = snprintf(add_sz_str(cx->ref), "%lu", cx->ctrl->attr.cell->IdObj);

	mov	ecx, DWORD PTR _cx$[ebp]
	mov	edx, DWORD PTR [ecx+480]
	mov	eax, DWORD PTR [edx+60]
	mov	ecx, DWORD PTR [eax+20]
	push	ecx
	push	OFFSET FLAT:$SG80298
	push	31					; 0000001fH
	mov	edx, DWORD PTR _cx$[ebp]
	add	edx, 504				; 000001f8H
	push	edx
	call	__snprintf
	add	esp, 16					; 00000010H
	mov	DWORD PTR _val$80296[ebp+4], eax

; 120  : 		val.txt = cx->ref;

	mov	eax, DWORD PTR _cx$[ebp]
	add	eax, 504				; 000001f8H
	mov	DWORD PTR _val$80296[ebp], eax

; 121  : 		val.b_relation = 1;

	mov	BYTE PTR _val$80296[ebp+12], 1

; 122  : 		val.field = "_EVA_PAY_BTN";

	mov	DWORD PTR _val$80296[ebp+8], OFFSET FLAT:$SG80299

; 123  : 		if(qry_add_val(cntxt, &val, 3, NULL)) STACK_ERROR;

	push	0
	push	3
	lea	ecx, DWORD PTR _val$80296[ebp]
	push	ecx
	mov	edx, DWORD PTR _cntxt$[ebp]
	push	edx
	call	_qry_add_val
	add	esp, 16					; 00000010H
	test	eax, eax
	je	SHORT $L80301
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 123		; 0000007bH
	jmp	$eva_err$80302
$L80301:

; 125  : 
; 126  : 	/* Build order reference - add random number for test */
; 127  : 	snprintf(add_sz_str(cx->ref), "%s%d", dyntab_val(&form->id_obj, 0, 0), 0xFFF & rand());

	call	_rand
	and	eax, 4095				; 00000fffH
	push	eax
	push	0
	push	0
	mov	ecx, DWORD PTR _form$[ebp]
	add	ecx, 32					; 00000020H
	push	ecx
	call	_dyntab_val
	add	esp, 12					; 0000000cH
	push	eax
	push	OFFSET FLAT:$SG80303
	push	31					; 0000001fH
	mov	edx, DWORD PTR _cx$[ebp]
	add	edx, 504				; 000001f8H
	push	edx
	call	__snprintf
	add	esp, 20					; 00000014H

; 128  : 
; 129  : 	/* Compute & format amount */
; 130  : 	CTRL_ATTR(expr, PAY_AMOUNT);

	lea	eax, DWORD PTR _expr$[ebp]
	push	eax
	call	_dyntab_free
	add	esp, 4
	push	0
	push	-1
	push	OFFSET FLAT:$SG80306
	mov	ecx, DWORD PTR _ctrl$[ebp]
	add	ecx, 44					; 0000002cH
	push	ecx
	push	0
	lea	edx, DWORD PTR _expr$[ebp]
	push	edx
	call	_dyntab_filter_field
	add	esp, 24					; 00000018H
	test	eax, eax
	je	SHORT $L80305
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29872], OFFSET FLAT:$SG80308
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 130		; 00000082H
	jmp	$eva_err$80302
$L80305:

; 131  : 	if(ctrl_eval_valtyp(cntxt, ctrl, &res, "_EVA_CURRENTOBJ", NULL, &expr)) STACK_ERROR;

	lea	edx, DWORD PTR _expr$[ebp]
	push	edx
	push	0
	push	OFFSET FLAT:$SG80311
	lea	eax, DWORD PTR _res$[ebp]
	push	eax
	mov	ecx, DWORD PTR _ctrl$[ebp]
	push	ecx
	mov	edx, DWORD PTR _cntxt$[ebp]
	push	edx
	call	_ctrl_eval_valtyp
	add	esp, 24					; 00000018H
	test	eax, eax
	je	SHORT $L80310
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 131		; 00000083H
	jmp	$eva_err$80302
$L80310:

; 132  : 	snprintf(add_sz_str(cx->amount), "%sEUR", dyntab_val(&res, 0, 0));

	push	0
	push	0
	lea	ecx, DWORD PTR _res$[ebp]
	push	ecx
	call	_dyntab_val
	add	esp, 12					; 0000000cH
	push	eax
	push	OFFSET FLAT:$SG80312
	push	31					; 0000001fH
	mov	edx, DWORD PTR _cx$[ebp]
	add	edx, 536				; 00000218H
	push	edx
	call	__snprintf
	add	esp, 16					; 00000010H

; 133  : 
; 134  : 	/* Compute & format long reference */
; 135  : 	CTRL_ATTR(expr, PAY_LONGREF);

	lea	eax, DWORD PTR _expr$[ebp]
	push	eax
	call	_dyntab_free
	add	esp, 4
	push	0
	push	-1
	push	OFFSET FLAT:$SG80315
	mov	ecx, DWORD PTR _ctrl$[ebp]
	add	ecx, 44					; 0000002cH
	push	ecx
	push	0
	lea	edx, DWORD PTR _expr$[ebp]
	push	edx
	call	_dyntab_filter_field
	add	esp, 24					; 00000018H
	test	eax, eax
	je	SHORT $L80314
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29872], OFFSET FLAT:$SG80317
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 135		; 00000087H
	jmp	$eva_err$80302
$L80314:

; 136  : 	if(ctrl_eval_valtyp(cntxt, ctrl, &res, "_EVA_CURRENTOBJ", NULL, &expr)) STACK_ERROR;

	lea	edx, DWORD PTR _expr$[ebp]
	push	edx
	push	0
	push	OFFSET FLAT:$SG80320
	lea	eax, DWORD PTR _res$[ebp]
	push	eax
	mov	ecx, DWORD PTR _ctrl$[ebp]
	push	ecx
	mov	edx, DWORD PTR _cntxt$[ebp]
	push	edx
	call	_ctrl_eval_valtyp
	add	esp, 24					; 00000018H
	test	eax, eax
	je	SHORT $L80319
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 136		; 00000088H
	jmp	$eva_err$80302
$L80319:

; 137  : 	c = dyntab_cell(&res, 0, 0);

	push	0
	push	0
	lea	ecx, DWORD PTR _res$[ebp]
	push	ecx
	call	_dyntab_cell
	add	esp, 12					; 0000000cH
	mov	DWORD PTR _c$[ebp], eax

; 138  : 	if(c)

	cmp	DWORD PTR _c$[ebp], 0
	je	$L80324

; 140  : 		setcase(4, c->txt, c->len);

	mov	edx, DWORD PTR _c$[ebp]
	mov	eax, DWORD PTR [edx+4]
	push	eax
	mov	ecx, DWORD PTR _c$[ebp]
	mov	edx, DWORD PTR [ecx]
	push	edx
	push	4
	call	_setcase
	add	esp, 12					; 0000000cH

; 141  : 		for(i = 0, j = 0; i < c->len; i++)

	mov	DWORD PTR _i$[ebp], 0
	mov	DWORD PTR _j$[ebp], 0
	jmp	SHORT $L80322
$L80323:
	mov	eax, DWORD PTR _i$[ebp]
	add	eax, 1
	mov	DWORD PTR _i$[ebp], eax
$L80322:
	mov	ecx, DWORD PTR _c$[ebp]
	mov	edx, DWORD PTR _i$[ebp]
	cmp	edx, DWORD PTR [ecx+4]
	jae	$L80324

; 142  : 			if(isalnum(c->txt[i]))

	cmp	DWORD PTR ___mb_cur_max, 1
	jle	SHORT $L80679
	push	263					; 00000107H
	mov	eax, DWORD PTR _c$[ebp]
	mov	ecx, DWORD PTR [eax]
	mov	edx, DWORD PTR _i$[ebp]
	movsx	eax, BYTE PTR [ecx+edx]
	push	eax
	call	__isctype
	add	esp, 8
	mov	DWORD PTR -3384+[ebp], eax
	jmp	SHORT $L80680
$L80679:
	mov	ecx, DWORD PTR _c$[ebp]
	mov	edx, DWORD PTR [ecx]
	mov	eax, DWORD PTR _i$[ebp]
	movsx	ecx, BYTE PTR [edx+eax]
	mov	edx, DWORD PTR __pctype
	xor	eax, eax
	mov	ax, WORD PTR [edx+ecx*2]
	and	eax, 263				; 00000107H
	mov	DWORD PTR -3384+[ebp], eax
$L80680:
	cmp	DWORD PTR -3384+[ebp], 0
	je	SHORT $L80325

; 143  : 				longref[j++] = c->txt[i];

	mov	ecx, DWORD PTR _c$[ebp]
	mov	edx, DWORD PTR [ecx]
	mov	eax, DWORD PTR _j$[ebp]
	mov	ecx, DWORD PTR _i$[ebp]
	mov	dl, BYTE PTR [edx+ecx]
	mov	BYTE PTR _longref$[ebp+eax], dl
	mov	eax, DWORD PTR _j$[ebp]
	add	eax, 1
	mov	DWORD PTR _j$[ebp], eax

; 144  : 			else if(j && longref[j - 1] != '.')

	jmp	SHORT $L80327
$L80325:
	cmp	DWORD PTR _j$[ebp], 0
	je	SHORT $L80327
	mov	ecx, DWORD PTR _j$[ebp]
	movsx	edx, BYTE PTR _longref$[ebp+ecx-1]
	cmp	edx, 46					; 0000002eH
	je	SHORT $L80327

; 145  : 				longref[j++] = '.';

	mov	eax, DWORD PTR _j$[ebp]
	mov	BYTE PTR _longref$[ebp+eax], 46		; 0000002eH
	mov	ecx, DWORD PTR _j$[ebp]
	add	ecx, 1
	mov	DWORD PTR _j$[ebp], ecx
$L80327:

; 146  : 	}

	jmp	$L80323
$L80324:

; 147  : 
; 148  : 	/* Build MAC */
; 149  : 	DYNBUF_ADD3(&hash, "", cx->tpe, 0, NO_CONV, "*");

	push	1
	push	OFFSET FLAT:$SG80330
	push	0
	push	0
	push	0
	mov	edx, DWORD PTR _cx$[ebp]
	mov	eax, DWORD PTR [edx+484]
	push	eax
	push	0
	push	OFFSET FLAT:$SG80331
	lea	ecx, DWORD PTR _hash$[ebp]
	push	ecx
	call	_dynbuf_add3
	add	esp, 36					; 00000024H
	test	eax, eax
	je	SHORT $L80329
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29872], OFFSET FLAT:$SG80333
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 149		; 00000095H
	jmp	$eva_err$80302
$L80329:

; 150  : 	DYNBUF_ADD(&hash, cx->d, 0, NO_CONV);

	push	0
	push	0
	push	0
	mov	ecx, DWORD PTR _cx$[ebp]
	add	ecx, 568				; 00000238H
	push	ecx
	lea	edx, DWORD PTR _hash$[ebp]
	push	edx
	call	_dynbuf_add
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L80335
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29872], OFFSET FLAT:$SG80337
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 150		; 00000096H
	jmp	$eva_err$80302
$L80335:

; 151  : 	DYNBUF_ADD3(&hash, "*", cx->amount, 0, NO_CONV, "*");

	push	1
	push	OFFSET FLAT:$SG80340
	push	0
	push	0
	push	0
	mov	edx, DWORD PTR _cx$[ebp]
	add	edx, 536				; 00000218H
	push	edx
	push	1
	push	OFFSET FLAT:$SG80341
	lea	eax, DWORD PTR _hash$[ebp]
	push	eax
	call	_dynbuf_add3
	add	esp, 36					; 00000024H
	test	eax, eax
	je	SHORT $L80339
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29872], OFFSET FLAT:$SG80343
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 151		; 00000097H
	jmp	$eva_err$80302
$L80339:

; 152  : 	DYNBUF_ADD(&hash, cx->ref, 0, NO_CONV);

	push	0
	push	0
	push	0
	mov	eax, DWORD PTR _cx$[ebp]
	add	eax, 504				; 000001f8H
	push	eax
	lea	ecx, DWORD PTR _hash$[ebp]
	push	ecx
	call	_dynbuf_add
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L80345
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29872], OFFSET FLAT:$SG80347
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 152		; 00000098H
	jmp	$eva_err$80302
$L80345:

; 153  : 	DYNBUF_ADD3(&hash, "*", longref, 0, NO_CONV, "*");

	push	1
	push	OFFSET FLAT:$SG80350
	push	0
	push	0
	push	0
	lea	ecx, DWORD PTR _longref$[ebp]
	push	ecx
	push	1
	push	OFFSET FLAT:$SG80351
	lea	edx, DWORD PTR _hash$[ebp]
	push	edx
	call	_dynbuf_add3
	add	esp, 36					; 00000024H
	test	eax, eax
	je	SHORT $L80349
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29872], OFFSET FLAT:$SG80353
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 153		; 00000099H
	jmp	$eva_err$80302
$L80349:

; 154  : 	DYNBUF_ADD(&hash, version, 0, NO_CONV);

	push	0
	push	0
	push	0
	mov	edx, DWORD PTR _version$[ebp]
	push	edx
	lea	eax, DWORD PTR _hash$[ebp]
	push	eax
	call	_dynbuf_add
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L80355
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29872], OFFSET FLAT:$SG80357
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 154		; 0000009aH
	jmp	$eva_err$80302
$L80355:

; 155  : 	DYNBUF_ADD3(&hash, "*FR*", cx->societe, 0, NO_CONV, "*");

	push	1
	push	OFFSET FLAT:$SG80360
	push	0
	push	0
	push	0
	mov	eax, DWORD PTR _cx$[ebp]
	mov	ecx, DWORD PTR [eax+488]
	push	ecx
	push	4
	push	OFFSET FLAT:$SG80361
	lea	edx, DWORD PTR _hash$[ebp]
	push	edx
	call	_dynbuf_add3
	add	esp, 36					; 00000024H
	test	eax, eax
	je	SHORT $L80359
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29872], OFFSET FLAT:$SG80363
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 155		; 0000009bH
	jmp	$eva_err$80302
$L80359:

; 156  : 	if(HMAC_SHA1(cntxt, mac, cx->k, cx->kl, hash->data, hash->cnt)) STACK_ERROR;

	mov	edx, DWORD PTR _hash$[ebp]
	mov	eax, DWORD PTR [edx+4]
	push	eax
	mov	ecx, DWORD PTR _hash$[ebp]
	add	ecx, 8
	push	ecx
	mov	edx, DWORD PTR _cx$[ebp]
	mov	eax, DWORD PTR [edx+632]
	push	eax
	mov	ecx, DWORD PTR _cx$[ebp]
	add	ecx, 600				; 00000258H
	push	ecx
	lea	edx, DWORD PTR _mac$[ebp]
	push	edx
	mov	eax, DWORD PTR _cntxt$[ebp]
	push	eax
	call	_HMAC_SHA1
	add	esp, 24					; 00000018H
	test	eax, eax
	je	SHORT $L80364
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 156		; 0000009cH
	jmp	$eva_err$80302
$L80364:

; 157  : 
; 158  : 	/* Output HTML & form header */
; 159  : 	put_html_page_header(cntxt, NULL, "Paiement par carte bancaire", NULL, 2);

	push	2
	push	0
	push	OFFSET FLAT:$SG80367
	push	0
	mov	edx, DWORD PTR _cntxt$[ebp]
	push	edx
	call	_put_html_page_header
	add	esp, 20					; 00000014H

; 160  : 	printf("\n<form method=post name=tpe action='%s'>",
; 161  : 		cx->b_test ?	"https://ssl.paiement.cic-banques.fr/test/paiement.cgi" :
; 162  : 						"https://ssl.paiement.cic-banques.fr/paiement.cgi");

	mov	eax, DWORD PTR _cx$[ebp]
	cmp	DWORD PTR [eax+636], 0
	je	SHORT $L80681
	mov	DWORD PTR -3388+[ebp], OFFSET FLAT:$SG80368
	jmp	SHORT $L80682
$L80681:
	mov	DWORD PTR -3388+[ebp], OFFSET FLAT:$SG80369
$L80682:
	mov	ecx, DWORD PTR -3388+[ebp]
	push	ecx
	push	OFFSET FLAT:$SG80370
	call	_printf
	add	esp, 8

; 163  : 
; 164  : 	/* Output form data */
; 165  : 	printf(	"\n<input type=hidden name=version value='%s'>", version);

	mov	edx, DWORD PTR _version$[ebp]
	push	edx
	push	OFFSET FLAT:$SG80371
	call	_printf
	add	esp, 8

; 166  : 	printf(	"\n<input type=hidden name=TPE value='%s'>", cx->tpe);

	mov	eax, DWORD PTR _cx$[ebp]
	mov	ecx, DWORD PTR [eax+484]
	push	ecx
	push	OFFSET FLAT:$SG80372
	call	_printf
	add	esp, 8

; 167  : 	printf(	"\n<input type=hidden name=date value='%s'>", cx->d);

	mov	edx, DWORD PTR _cx$[ebp]
	add	edx, 568				; 00000238H
	push	edx
	push	OFFSET FLAT:$SG80373
	call	_printf
	add	esp, 8

; 168  : 	printf(	"\n<input type=hidden name=montant value='%s'>", cx->amount);

	mov	eax, DWORD PTR _cx$[ebp]
	add	eax, 536				; 00000218H
	push	eax
	push	OFFSET FLAT:$SG80374
	call	_printf
	add	esp, 8

; 169  : 	printf(	"\n<input type=hidden name=reference value=%s>", cx->ref);

	mov	ecx, DWORD PTR _cx$[ebp]
	add	ecx, 504				; 000001f8H
	push	ecx
	push	OFFSET FLAT:$SG80375
	call	_printf
	add	esp, 8

; 170  : 	printf(	"\n<input type=hidden name=MAC value='%s'>", mac);

	lea	edx, DWORD PTR _mac$[ebp]
	push	edx
	push	OFFSET FLAT:$SG80376
	call	_printf
	add	esp, 8

; 171  : 	printf(	"\n<input type=hidden name='texte-libre' value='%s'>", longref);

	lea	eax, DWORD PTR _longref$[ebp]
	push	eax
	push	OFFSET FLAT:$SG80377
	call	_printf
	add	esp, 8

; 172  : 	printf(	"\n<input type=hidden name=lgue value=FR>"
; 173  : 			"\n<input type=hidden name=societe value='%s'>", cx->societe);

	mov	ecx, DWORD PTR _cx$[ebp]
	mov	edx, DWORD PTR [ecx+488]
	push	edx
	push	OFFSET FLAT:$SG80378
	call	_printf
	add	esp, 8

; 174  : 	output_url(cntxt, cx, "url_retour", "Return");

	push	OFFSET FLAT:$SG80379
	push	OFFSET FLAT:$SG80380
	mov	eax, DWORD PTR _cx$[ebp]
	push	eax
	mov	ecx, DWORD PTR _cntxt$[ebp]
	push	ecx
	call	_output_url
	add	esp, 16					; 00000010H

; 175  : 	output_url(cntxt, cx, "url_retour_ok", "Ok");

	push	OFFSET FLAT:$SG80381
	push	OFFSET FLAT:$SG80382
	mov	edx, DWORD PTR _cx$[ebp]
	push	edx
	mov	eax, DWORD PTR _cntxt$[ebp]
	push	eax
	call	_output_url
	add	esp, 16					; 00000010H

; 176  : 	output_url(cntxt, cx, "url_retour_err", "Err");

	push	OFFSET FLAT:$SG80383
	push	OFFSET FLAT:$SG80384
	mov	ecx, DWORD PTR _cx$[ebp]
	push	ecx
	mov	edx, DWORD PTR _cntxt$[ebp]
	push	edx
	call	_output_url
	add	esp, 16					; 00000010H

; 177  : 	printf("<script>document.write('<input type=hidden name=bouton value=CB>')</script>"
; 178  : 			"<noscript><center>Cliquez pour accéder au site de paiement<br>"
; 179  : 			"<input type=submit name=bouton value='Paiement&#x20;CB'></noscript>"
; 180  : 			"</form>"
; 181  : 			"<script>document.tpe.submit()</script>");

	push	OFFSET FLAT:$SG80385
	call	_printf
	add	esp, 4

; 182  : 
; 183  : 	/* Terminate processing */
; 184  : 	LogTPE("Appel banque%s%s%s", "", "", "")

	push	OFFSET FLAT:$SG80387
	push	OFFSET FLAT:$SG80388
	call	_fopen
	add	esp, 8
	mov	DWORD PTR _f$80386[ebp], eax
	cmp	DWORD PTR _f$80386[ebp], 0
	je	$L80389
	mov	eax, DWORD PTR _cx$[ebp]
	add	eax, 536				; 00000218H
	test	eax, eax
	je	SHORT $L80683
	mov	ecx, DWORD PTR _cx$[ebp]
	add	ecx, 536				; 00000218H
	mov	DWORD PTR -3392+[ebp], ecx
	jmp	SHORT $L80684
$L80683:
	mov	DWORD PTR -3392+[ebp], OFFSET FLAT:$SG80390
$L80684:
	mov	edx, DWORD PTR _cx$[ebp]
	cmp	DWORD PTR [edx+488], 0
	je	SHORT $L80685
	mov	eax, DWORD PTR _cx$[ebp]
	mov	ecx, DWORD PTR [eax+488]
	mov	DWORD PTR -3396+[ebp], ecx
	jmp	SHORT $L80686
$L80685:
	mov	DWORD PTR -3396+[ebp], OFFSET FLAT:$SG80391
$L80686:
	mov	edx, DWORD PTR _cx$[ebp]
	add	edx, 504				; 000001f8H
	test	edx, edx
	je	SHORT $L80687
	mov	eax, DWORD PTR _cx$[ebp]
	add	eax, 504				; 000001f8H
	mov	DWORD PTR -3400+[ebp], eax
	jmp	SHORT $L80688
$L80687:
	mov	DWORD PTR -3400+[ebp], OFFSET FLAT:$SG80395
$L80688:
	mov	ecx, DWORD PTR -3392+[ebp]
	push	ecx
	mov	edx, DWORD PTR -3396+[ebp]
	push	edx
	push	OFFSET FLAT:$SG80392
	push	OFFSET FLAT:$SG80393
	push	OFFSET FLAT:$SG80394
	mov	eax, DWORD PTR -3400+[ebp]
	push	eax
	mov	ecx, DWORD PTR _cx$[ebp]
	add	ecx, 568				; 00000238H
	push	ecx
	push	OFFSET FLAT:$SG80396
	mov	edx, DWORD PTR _f$80386[ebp]
	push	edx
	call	_fprintf
	add	esp, 36					; 00000024H
	mov	eax, DWORD PTR _f$80386[ebp]
	push	eax
	call	_fclose
	add	esp, 4
$L80389:

; 185  : 	cntxt->b_terminate = 0x2F;

	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29776], 47		; 0000002fH
$eva_noerr$80397:

; 186  : 
; 187  : 	RETURN_OK_CLEANUP;

	push	0
	push	OFFSET FLAT:$SG80398
	push	OFFSET FLAT:$SG80399
	mov	edx, DWORD PTR _cntxt$[ebp]
	push	edx
	call	_err_clear
	add	esp, 16					; 00000010H
$eva_err$80302:
	mov	eax, DWORD PTR _cntxt$[ebp]
	cmp	DWORD PTR [eax+29872], 0
	je	SHORT $L80400
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	edx, DWORD PTR [ecx+29900]
	push	edx
	push	OFFSET FLAT:$SG80401
	push	OFFSET FLAT:$SG80402
	mov	eax, DWORD PTR _cntxt$[ebp]
	push	eax
	call	_err_add_context
	add	esp, 16					; 00000010H
$L80400:
	lea	ecx, DWORD PTR _res$[ebp]
	push	ecx
	call	_dyntab_free
	add	esp, 4
	lea	edx, DWORD PTR _expr$[ebp]
	push	edx
	call	_dyntab_free
	add	esp, 4
	mov	eax, DWORD PTR _hash$[ebp]
	push	eax
	call	_mem_free
	add	esp, 4
	mov	DWORD PTR _hash$[ebp], 0
	mov	ecx, DWORD PTR _cntxt$[ebp]
	xor	eax, eax
	cmp	DWORD PTR [ecx+29872], 0
	setne	al

; 188  : }

	pop	edi
	mov	esp, ebp
	pop	ebp
	ret	0
_call_pay_site ENDP
_TEXT	ENDS
PUBLIC	_init_pay_site
EXTRN	_ctrl_read_baseobj:NEAR
EXTRN	_dyntab_sz:NEAR
EXTRN	_qry_cache_idobj_field:NEAR
EXTRN	_dyntab_copy:NEAR
EXTRN	_strlen:NEAR
EXTRN	_strchr:NEAR
EXTRN	_dyntab_from_list:NEAR
EXTRN	_dyntab_field_val:NEAR
EXTRN	_dyntab_field_cell:NEAR
_BSS	SEGMENT
	ALIGN	4

$SG80442 DB	01H DUP (?)
	ALIGN	4

$SG80444 DB	01H DUP (?)
	ALIGN	4

$SG80452 DB	01H DUP (?)
_BSS	ENDS
_DATA	SEGMENT
	ORG $+2
$SG80421 DB	',', 00H
	ORG $+2
$SG80423 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG80427 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG80435 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG80438 DB	'TPE=', 00H
	ORG $+3
$SG80441 DB	'_EVA_CODE_TPE', 00H
	ORG $+2
$SG80443 DB	'_EVA_FIRM_NAME', 00H
	ORG $+1
$SG80446 DB	'_EVA_HASH_KEY', 00H
	ORG $+2
$SG80448 DB	'_EVA_RET_FORM', 00H
	ORG $+2
$SG80450 DB	'_EVA_STS_FIELD', 00H
	ORG $+1
$SG80451 DB	'_EVA_PAY_TEST', 00H
	ORG $+2
$SG80457 DB	'D:\Travail\ABI\EVA\V4.0\CGI\Brunix-2016\action_paysite.c'
	DB	00H
	ORG $+3
$SG80458 DB	'init_pay_site', 00H
	ORG $+2
$SG80460 DB	'D:\Travail\ABI\EVA\V4.0\CGI\Brunix-2016\action_paysite.c'
	DB	00H
	ORG $+3
$SG80461 DB	'init_pay_site', 00H
_DATA	ENDS
_TEXT	SEGMENT
_cntxt$ = 8
_cx$ = 12
_res$ = -40
_expr$ = -20
_i$ = -44
_ctrl$ = -48
_qry$80417 = -52
_init_pay_site PROC NEAR

; 202  : ){

	push	ebp
	mov	ebp, esp
	sub	esp, 104				; 00000068H

; 203  : 	DynTable res = {0};

	mov	DWORD PTR _res$[ebp], 0
	xor	eax, eax
	mov	DWORD PTR _res$[ebp+4], eax
	mov	DWORD PTR _res$[ebp+8], eax
	mov	DWORD PTR _res$[ebp+12], eax
	mov	DWORD PTR _res$[ebp+16], eax

; 204  : 	DynTable expr = {0};

	mov	DWORD PTR _expr$[ebp], 0
	xor	ecx, ecx
	mov	DWORD PTR _expr$[ebp+4], ecx
	mov	DWORD PTR _expr$[ebp+8], ecx
	mov	DWORD PTR _expr$[ebp+12], ecx
	mov	DWORD PTR _expr$[ebp+16], ecx

; 205  : 	unsigned long i;
; 206  : 	EVA_ctrl *ctrl = cx->ctrl;

	mov	edx, DWORD PTR _cx$[ebp]
	mov	eax, DWORD PTR [edx+480]
	mov	DWORD PTR _ctrl$[ebp], eax

; 207  : 
; 208  : 	/* Get call context from query string if applicable */
; 209  : 	if(!ctrl && cntxt->qrystr && *cntxt->qrystr)

	cmp	DWORD PTR _ctrl$[ebp], 0
	jne	$L80416
	mov	ecx, DWORD PTR _cntxt$[ebp]
	cmp	DWORD PTR [ecx+29736], 0
	je	$L80416
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	eax, DWORD PTR [edx+29736]
	movsx	ecx, BYTE PTR [eax]
	test	ecx, ecx
	je	$L80416

; 211  : 		char *qry = strchr(cntxt->qrystr, '=');

	push	61					; 0000003dH
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	eax, DWORD PTR [edx+29736]
	push	eax
	call	_strchr
	add	esp, 8
	mov	DWORD PTR _qry$80417[ebp], eax

; 212  : 		if(qry) qry++;

	cmp	DWORD PTR _qry$80417[ebp], 0
	je	SHORT $L80418
	mov	ecx, DWORD PTR _qry$80417[ebp]
	add	ecx, 1
	mov	DWORD PTR _qry$80417[ebp], ecx
$L80418:

; 213  : 		if(qry && *qry)

	cmp	DWORD PTR _qry$80417[ebp], 0
	je	$L80433
	mov	edx, DWORD PTR _qry$80417[ebp]
	movsx	eax, BYTE PTR [edx]
	test	eax, eax
	je	$L80433

; 215  : 			if(dyntab_from_list(&res, qry, strlen(qry), ",", 0, 4)) RETURN_ERR_MEMORY;

	push	4
	push	0
	push	OFFSET FLAT:$SG80421
	mov	ecx, DWORD PTR _qry$80417[ebp]
	push	ecx
	call	_strlen
	add	esp, 4
	push	eax
	mov	edx, DWORD PTR _qry$80417[ebp]
	push	edx
	lea	eax, DWORD PTR _res$[ebp]
	push	eax
	call	_dyntab_from_list
	add	esp, 24					; 00000018H
	test	eax, eax
	je	SHORT $L80420
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29872], OFFSET FLAT:$SG80423
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 215		; 000000d7H
	jmp	$eva_err$80424
$L80420:

; 216  : 			DYNTAB_ADD_CELL(&cntxt->session, 0, 0, &res, 0, 0);

	push	1
	push	0
	push	0
	lea	eax, DWORD PTR _res$[ebp]
	push	eax
	call	_dyntab_cell
	add	esp, 12					; 0000000cH
	push	eax
	push	0
	push	0
	mov	ecx, DWORD PTR _cntxt$[ebp]
	add	ecx, 29300				; 00007274H
	push	ecx
	call	_dyntab_copy
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L80425
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29872], OFFSET FLAT:$SG80427
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 216		; 000000d8H
	jmp	$eva_err$80424
$L80425:

; 217  : 			if(dyntab_sz(&res, 1, 0))

	push	0
	push	1
	lea	ecx, DWORD PTR _res$[ebp]
	push	ecx
	call	_dyntab_sz
	add	esp, 12					; 0000000cH
	test	eax, eax
	je	SHORT $L80431

; 219  : 				ctrl = &cx->ctl;

	mov	edx, DWORD PTR _cx$[ebp]
	mov	DWORD PTR _ctrl$[ebp], edx

; 220  : 				cx->ctrl = &cx->ctl;

	mov	eax, DWORD PTR _cx$[ebp]
	mov	ecx, DWORD PTR _cx$[ebp]
	mov	DWORD PTR [eax+480], ecx

; 221  : 				if(qry_cache_idobj(&ctrl->attr, DYNTAB_TOULRC(&res, 1, 0)) ||
; 222  : 					ctrl_read_baseobj(cntxt, &ctrl->attr)) STACK_ERROR;

	push	3
	push	0
	push	10					; 0000000aH
	push	0
	push	0
	push	1
	lea	edx, DWORD PTR _res$[ebp]
	push	edx
	call	_dyntab_val
	add	esp, 12					; 0000000cH
	push	eax
	call	_strtoul
	add	esp, 12					; 0000000cH
	push	eax
	mov	eax, DWORD PTR _ctrl$[ebp]
	add	eax, 44					; 0000002cH
	push	eax
	mov	ecx, DWORD PTR _cntxt$[ebp]
	push	ecx
	call	_qry_cache_idobj_field
	add	esp, 20					; 00000014H
	test	eax, eax
	jne	SHORT $L80432
	mov	edx, DWORD PTR _ctrl$[ebp]
	add	edx, 44					; 0000002cH
	push	edx
	mov	eax, DWORD PTR _cntxt$[ebp]
	push	eax
	call	_ctrl_read_baseobj
	add	esp, 8
	test	eax, eax
	je	SHORT $L80431
$L80432:
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 222		; 000000deH
	jmp	$eva_err$80424
$L80431:

; 224  : 			DYNTAB_ADD_CELL(&cntxt->id_obj, 0, 0, &res, 2, 0);

	push	1
	push	0
	push	2
	lea	edx, DWORD PTR _res$[ebp]
	push	edx
	call	_dyntab_cell
	add	esp, 12					; 0000000cH
	push	eax
	push	0
	push	0
	mov	eax, DWORD PTR _cntxt$[ebp]
	add	eax, 20					; 00000014H
	push	eax
	call	_dyntab_copy
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L80433
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29872], OFFSET FLAT:$SG80435
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 224		; 000000e0H
	jmp	$eva_err$80424
$L80433:

; 227  : 	else if(!ctrl && cntxt->cgi)

	jmp	SHORT $L80437
$L80416:
	cmp	DWORD PTR _ctrl$[ebp], 0
	jne	SHORT $L80437
	mov	eax, DWORD PTR _cntxt$[ebp]
	cmp	DWORD PTR [eax+29648], 0
	je	SHORT $L80437

; 228  : 		cntxt->qrystr = "TPE=";

	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29736], OFFSET FLAT:$SG80438
$L80437:

; 229  : 
; 230  : 	/* Read payment params from control */
; 231  : 	if(!ctrl) RETURN_OK;

	cmp	DWORD PTR _ctrl$[ebp], 0
	jne	SHORT $L80439
	jmp	$eva_noerr$80440
$L80439:

; 232  : 	cx->tpe = CTRL_ATTR_VAL(CODE_TPE);

	cmp	DWORD PTR _ctrl$[ebp], 0
	je	SHORT $L80690
	push	0
	push	-1
	push	OFFSET FLAT:$SG80441
	mov	edx, DWORD PTR _ctrl$[ebp]
	add	edx, 44					; 0000002cH
	push	edx
	call	_dyntab_field_val
	add	esp, 16					; 00000010H
	mov	DWORD PTR -56+[ebp], eax
	jmp	SHORT $L80691
$L80690:
	mov	DWORD PTR -56+[ebp], OFFSET FLAT:$SG80442
$L80691:
	mov	eax, DWORD PTR _cx$[ebp]
	mov	ecx, DWORD PTR -56+[ebp]
	mov	DWORD PTR [eax+484], ecx

; 233  : 	cx->societe = CTRL_ATTR_VAL(FIRM_NAME);

	cmp	DWORD PTR _ctrl$[ebp], 0
	je	SHORT $L80692
	push	0
	push	-1
	push	OFFSET FLAT:$SG80443
	mov	edx, DWORD PTR _ctrl$[ebp]
	add	edx, 44					; 0000002cH
	push	edx
	call	_dyntab_field_val
	add	esp, 16					; 00000010H
	mov	DWORD PTR -60+[ebp], eax
	jmp	SHORT $L80693
$L80692:
	mov	DWORD PTR -60+[ebp], OFFSET FLAT:$SG80444
$L80693:
	mov	eax, DWORD PTR _cx$[ebp]
	mov	ecx, DWORD PTR -60+[ebp]
	mov	DWORD PTR [eax+488], ecx

; 234  : 	cx->key = CTRL_ATTR_CELL(HASH_KEY);

	cmp	DWORD PTR _ctrl$[ebp], 0
	je	SHORT $L80694
	push	0
	push	-1
	push	OFFSET FLAT:$SG80446
	mov	edx, DWORD PTR _ctrl$[ebp]
	add	edx, 44					; 0000002cH
	push	edx
	call	_dyntab_field_cell
	add	esp, 16					; 00000010H
	mov	DWORD PTR -64+[ebp], eax
	jmp	SHORT $L80695
$L80694:
	mov	DWORD PTR -64+[ebp], 0
$L80695:
	mov	eax, DWORD PTR _cx$[ebp]
	mov	ecx, DWORD PTR -64+[ebp]
	mov	DWORD PTR [eax+492], ecx

; 235  : 	cx->retform = CTRL_ATTR_CELL(RET_FORM);

	cmp	DWORD PTR _ctrl$[ebp], 0
	je	SHORT $L80696
	push	0
	push	-1
	push	OFFSET FLAT:$SG80448
	mov	edx, DWORD PTR _ctrl$[ebp]
	add	edx, 44					; 0000002cH
	push	edx
	call	_dyntab_field_cell
	add	esp, 16					; 00000010H
	mov	DWORD PTR -68+[ebp], eax
	jmp	SHORT $L80697
$L80696:
	mov	DWORD PTR -68+[ebp], 0
$L80697:
	mov	eax, DWORD PTR _cx$[ebp]
	mov	ecx, DWORD PTR -68+[ebp]
	mov	DWORD PTR [eax+496], ecx

; 236  : 	cx->stsfield = CTRL_ATTR_CELL(STS_FIELD);

	cmp	DWORD PTR _ctrl$[ebp], 0
	je	SHORT $L80698
	push	0
	push	-1
	push	OFFSET FLAT:$SG80450
	mov	edx, DWORD PTR _ctrl$[ebp]
	add	edx, 44					; 0000002cH
	push	edx
	call	_dyntab_field_cell
	add	esp, 16					; 00000010H
	mov	DWORD PTR -72+[ebp], eax
	jmp	SHORT $L80699
$L80698:
	mov	DWORD PTR -72+[ebp], 0
$L80699:
	mov	eax, DWORD PTR _cx$[ebp]
	mov	ecx, DWORD PTR -72+[ebp]
	mov	DWORD PTR [eax+500], ecx

; 237  : 	cx->b_test = *CTRL_ATTR_VAL(PAY_TEST) == '1';

	cmp	DWORD PTR _ctrl$[ebp], 0
	je	SHORT $L80700
	push	0
	push	-1
	push	OFFSET FLAT:$SG80451
	mov	edx, DWORD PTR _ctrl$[ebp]
	add	edx, 44					; 0000002cH
	push	edx
	call	_dyntab_field_val
	add	esp, 16					; 00000010H
	mov	DWORD PTR -76+[ebp], eax
	jmp	SHORT $L80701
$L80700:
	mov	DWORD PTR -76+[ebp], OFFSET FLAT:$SG80452
$L80701:
	mov	eax, DWORD PTR -76+[ebp]
	movsx	ecx, BYTE PTR [eax]
	xor	edx, edx
	cmp	ecx, 49					; 00000031H
	sete	dl
	mov	eax, DWORD PTR _cx$[ebp]
	mov	DWORD PTR [eax+636], edx

; 238  : 
; 239  : 	/* Build binary key */
; 240  : 	cx->kl = cx->key ? cx->key->len / 2 : 0;

	mov	ecx, DWORD PTR _cx$[ebp]
	cmp	DWORD PTR [ecx+492], 0
	je	SHORT $L80702
	mov	edx, DWORD PTR _cx$[ebp]
	mov	eax, DWORD PTR [edx+492]
	mov	ecx, DWORD PTR [eax+4]
	shr	ecx, 1
	mov	DWORD PTR -80+[ebp], ecx
	jmp	SHORT $L80703
$L80702:
	mov	DWORD PTR -80+[ebp], 0
$L80703:
	mov	edx, DWORD PTR _cx$[ebp]
	mov	eax, DWORD PTR -80+[ebp]
	mov	DWORD PTR [edx+632], eax

; 241  : 	for(i = 0; i < cx->kl; i++)

	mov	DWORD PTR _i$[ebp], 0
	jmp	SHORT $L80453
$L80454:
	mov	ecx, DWORD PTR _i$[ebp]
	add	ecx, 1
	mov	DWORD PTR _i$[ebp], ecx
$L80453:
	mov	edx, DWORD PTR _cx$[ebp]
	mov	eax, DWORD PTR _i$[ebp]
	cmp	eax, DWORD PTR [edx+632]
	jae	$eva_noerr$80440

; 242  : 		cx->k[i] = (char)(TO_HEX(cx->key->txt[i * 2 + 1]) | (TO_HEX(cx->key->txt[i * 2]) << 4));

	mov	ecx, DWORD PTR _cx$[ebp]
	mov	edx, DWORD PTR [ecx+492]
	mov	eax, DWORD PTR [edx]
	mov	ecx, DWORD PTR _i$[ebp]
	movsx	edx, BYTE PTR [eax+ecx*2+1]
	cmp	edx, 48					; 00000030H
	jl	SHORT $L80704
	mov	eax, DWORD PTR _cx$[ebp]
	mov	ecx, DWORD PTR [eax+492]
	mov	edx, DWORD PTR [ecx]
	mov	eax, DWORD PTR _i$[ebp]
	movsx	ecx, BYTE PTR [edx+eax*2+1]
	cmp	ecx, 57					; 00000039H
	jg	SHORT $L80704
	mov	edx, DWORD PTR _cx$[ebp]
	mov	eax, DWORD PTR [edx+492]
	mov	ecx, DWORD PTR [eax]
	mov	edx, DWORD PTR _i$[ebp]
	movsx	eax, BYTE PTR [ecx+edx*2+1]
	sub	eax, 48					; 00000030H
	mov	DWORD PTR -84+[ebp], eax
	jmp	$L80709
$L80704:
	mov	ecx, DWORD PTR _cx$[ebp]
	mov	edx, DWORD PTR [ecx+492]
	mov	eax, DWORD PTR [edx]
	mov	ecx, DWORD PTR _i$[ebp]
	movsx	edx, BYTE PTR [eax+ecx*2+1]
	cmp	edx, 97					; 00000061H
	jl	SHORT $L80705
	mov	eax, DWORD PTR _cx$[ebp]
	mov	ecx, DWORD PTR [eax+492]
	mov	edx, DWORD PTR [ecx]
	mov	eax, DWORD PTR _i$[ebp]
	movsx	ecx, BYTE PTR [edx+eax*2+1]
	cmp	ecx, 102				; 00000066H
	jg	SHORT $L80705
	mov	edx, DWORD PTR _cx$[ebp]
	mov	eax, DWORD PTR [edx+492]
	mov	ecx, DWORD PTR [eax]
	mov	edx, DWORD PTR _i$[ebp]
	movsx	eax, BYTE PTR [ecx+edx*2+1]
	sub	eax, 87					; 00000057H
	mov	DWORD PTR -88+[ebp], eax
	jmp	SHORT $L80708
$L80705:
	mov	ecx, DWORD PTR _cx$[ebp]
	mov	edx, DWORD PTR [ecx+492]
	mov	eax, DWORD PTR [edx]
	mov	ecx, DWORD PTR _i$[ebp]
	movsx	edx, BYTE PTR [eax+ecx*2+1]
	cmp	edx, 65					; 00000041H
	jl	SHORT $L80706
	mov	eax, DWORD PTR _cx$[ebp]
	mov	ecx, DWORD PTR [eax+492]
	mov	edx, DWORD PTR [ecx]
	mov	eax, DWORD PTR _i$[ebp]
	movsx	ecx, BYTE PTR [edx+eax*2+1]
	cmp	ecx, 70					; 00000046H
	jg	SHORT $L80706
	mov	edx, DWORD PTR _cx$[ebp]
	mov	eax, DWORD PTR [edx+492]
	mov	ecx, DWORD PTR [eax]
	mov	edx, DWORD PTR _i$[ebp]
	movsx	eax, BYTE PTR [ecx+edx*2+1]
	sub	eax, 55					; 00000037H
	mov	DWORD PTR -92+[ebp], eax
	jmp	SHORT $L80707
$L80706:
	mov	DWORD PTR -92+[ebp], 0
$L80707:
	mov	ecx, DWORD PTR -92+[ebp]
	mov	DWORD PTR -88+[ebp], ecx
$L80708:
	mov	edx, DWORD PTR -88+[ebp]
	mov	DWORD PTR -84+[ebp], edx
$L80709:
	mov	eax, DWORD PTR _cx$[ebp]
	mov	ecx, DWORD PTR [eax+492]
	mov	edx, DWORD PTR [ecx]
	mov	eax, DWORD PTR _i$[ebp]
	movsx	ecx, BYTE PTR [edx+eax*2]
	cmp	ecx, 48					; 00000030H
	jl	SHORT $L80710
	mov	edx, DWORD PTR _cx$[ebp]
	mov	eax, DWORD PTR [edx+492]
	mov	ecx, DWORD PTR [eax]
	mov	edx, DWORD PTR _i$[ebp]
	movsx	eax, BYTE PTR [ecx+edx*2]
	cmp	eax, 57					; 00000039H
	jg	SHORT $L80710
	mov	ecx, DWORD PTR _cx$[ebp]
	mov	edx, DWORD PTR [ecx+492]
	mov	eax, DWORD PTR [edx]
	mov	ecx, DWORD PTR _i$[ebp]
	movsx	edx, BYTE PTR [eax+ecx*2]
	sub	edx, 48					; 00000030H
	mov	DWORD PTR -96+[ebp], edx
	jmp	$L80715
$L80710:
	mov	eax, DWORD PTR _cx$[ebp]
	mov	ecx, DWORD PTR [eax+492]
	mov	edx, DWORD PTR [ecx]
	mov	eax, DWORD PTR _i$[ebp]
	movsx	ecx, BYTE PTR [edx+eax*2]
	cmp	ecx, 97					; 00000061H
	jl	SHORT $L80711
	mov	edx, DWORD PTR _cx$[ebp]
	mov	eax, DWORD PTR [edx+492]
	mov	ecx, DWORD PTR [eax]
	mov	edx, DWORD PTR _i$[ebp]
	movsx	eax, BYTE PTR [ecx+edx*2]
	cmp	eax, 102				; 00000066H
	jg	SHORT $L80711
	mov	ecx, DWORD PTR _cx$[ebp]
	mov	edx, DWORD PTR [ecx+492]
	mov	eax, DWORD PTR [edx]
	mov	ecx, DWORD PTR _i$[ebp]
	movsx	edx, BYTE PTR [eax+ecx*2]
	sub	edx, 87					; 00000057H
	mov	DWORD PTR -100+[ebp], edx
	jmp	SHORT $L80714
$L80711:
	mov	eax, DWORD PTR _cx$[ebp]
	mov	ecx, DWORD PTR [eax+492]
	mov	edx, DWORD PTR [ecx]
	mov	eax, DWORD PTR _i$[ebp]
	movsx	ecx, BYTE PTR [edx+eax*2]
	cmp	ecx, 65					; 00000041H
	jl	SHORT $L80712
	mov	edx, DWORD PTR _cx$[ebp]
	mov	eax, DWORD PTR [edx+492]
	mov	ecx, DWORD PTR [eax]
	mov	edx, DWORD PTR _i$[ebp]
	movsx	eax, BYTE PTR [ecx+edx*2]
	cmp	eax, 70					; 00000046H
	jg	SHORT $L80712
	mov	ecx, DWORD PTR _cx$[ebp]
	mov	edx, DWORD PTR [ecx+492]
	mov	eax, DWORD PTR [edx]
	mov	ecx, DWORD PTR _i$[ebp]
	movsx	edx, BYTE PTR [eax+ecx*2]
	sub	edx, 55					; 00000037H
	mov	DWORD PTR -104+[ebp], edx
	jmp	SHORT $L80713
$L80712:
	mov	DWORD PTR -104+[ebp], 0
$L80713:
	mov	eax, DWORD PTR -104+[ebp]
	mov	DWORD PTR -100+[ebp], eax
$L80714:
	mov	ecx, DWORD PTR -100+[ebp]
	mov	DWORD PTR -96+[ebp], ecx
$L80715:
	mov	edx, DWORD PTR -96+[ebp]
	shl	edx, 4
	mov	eax, DWORD PTR -84+[ebp]
	or	eax, edx
	mov	ecx, DWORD PTR _cx$[ebp]
	add	ecx, DWORD PTR _i$[ebp]
	mov	BYTE PTR [ecx+600], al
	jmp	$L80454
$eva_noerr$80440:

; 243  : 
; 244  : 	RETURN_OK_CLEANUP;

	push	0
	push	OFFSET FLAT:$SG80457
	push	OFFSET FLAT:$SG80458
	mov	edx, DWORD PTR _cntxt$[ebp]
	push	edx
	call	_err_clear
	add	esp, 16					; 00000010H
$eva_err$80424:
	mov	eax, DWORD PTR _cntxt$[ebp]
	cmp	DWORD PTR [eax+29872], 0
	je	SHORT $L80459
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	edx, DWORD PTR [ecx+29900]
	push	edx
	push	OFFSET FLAT:$SG80460
	push	OFFSET FLAT:$SG80461
	mov	eax, DWORD PTR _cntxt$[ebp]
	push	eax
	call	_err_add_context
	add	esp, 16					; 00000010H
$L80459:
	lea	ecx, DWORD PTR _res$[ebp]
	push	ecx
	call	_dyntab_free
	add	esp, 4
	lea	edx, DWORD PTR _expr$[ebp]
	push	edx
	call	_dyntab_free
	add	esp, 4
	mov	eax, DWORD PTR _cntxt$[ebp]
	xor	ecx, ecx
	cmp	DWORD PTR [eax+29872], 0
	setne	cl
	mov	eax, ecx

; 245  : }

	mov	esp, ebp
	pop	ebp
	ret	0
_init_pay_site ENDP
_TEXT	ENDS
PUBLIC	_return_pay_site
EXTRN	_cgi_build_name:NEAR
EXTRN	_cgi_add_input:NEAR
_DATA	SEGMENT
	ORG $+2
$SG80476 DB	'_EVA_FORMSTAMP', 00H
	ORG $+1
$SG80480 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG80489 DB	'_EVA_PAY_MSG', 00H
	ORG $+3
$SG80491 DB	'D:\Travail\ABI\EVA\V4.0\CGI\Brunix-2016\action_paysite.c'
	DB	00H
	ORG $+3
$SG80492 DB	'return_pay_site', 00H
$SG80494 DB	'D:\Travail\ABI\EVA\V4.0\CGI\Brunix-2016\action_paysite.c'
	DB	00H
	ORG $+3
$SG80495 DB	'return_pay_site', 00H
_DATA	ENDS
_TEXT	SEGMENT
_cntxt$ = 8
_cx$ = 12
_sts$ = 16
_sz$ = 20
_return_pay_site PROC NEAR

; 259  : ){

	push	ebp
	mov	ebp, esp

; 260  : 
; 261  : 	/* Set displayed form */
; 262  : 	if(!cx->retform) cx->retform = DYNTAB_FIELD_CELL(&cx->ctrl->attr, FORMSTAMP);

	mov	eax, DWORD PTR _cx$[ebp]
	cmp	DWORD PTR [eax+496], 0
	jne	SHORT $L80475
	push	0
	push	-1
	push	OFFSET FLAT:$SG80476
	mov	ecx, DWORD PTR _cx$[ebp]
	mov	edx, DWORD PTR [ecx+480]
	add	edx, 44					; 0000002cH
	push	edx
	call	_dyntab_field_cell
	add	esp, 16					; 00000010H
	mov	ecx, DWORD PTR _cx$[ebp]
	mov	DWORD PTR [ecx+496], eax
$L80475:

; 263  : 	if(cx->retform) DYNTAB_ADD_CELLP(&cntxt->id_form, 0, 0, cx->retform);

	mov	edx, DWORD PTR _cx$[ebp]
	cmp	DWORD PTR [edx+496], 0
	je	SHORT $L80478
	push	1
	mov	eax, DWORD PTR _cx$[ebp]
	mov	ecx, DWORD PTR [eax+496]
	push	ecx
	push	0
	push	0
	mov	edx, DWORD PTR _cntxt$[ebp]
	push	edx
	call	_dyntab_copy
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L80478
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29872], OFFSET FLAT:$SG80480
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 263		; 00000107H
	jmp	$eva_err$80481
$L80478:

; 264  : 
; 265  : 	/* Set return status */
; 266  : 	if((sts &&
; 267  : 		cgi_build_name(cntxt, &cx->ctrl->cginame, 'D', 0, DYNTAB_TOUL(&cntxt->id_form), DYNTAB_TOUL(&cntxt->id_obj),
; 268  : 							add_sz_str("_EVA_PAY_MSG"), NULL, 0, 1, 0, 0)) ||
; 269  : 		cgi_add_input(cntxt, NULL, cx->ctrl->cginame->data, cx->ctrl->cginame->cnt, sts, sz)) STACK_ERROR;

	cmp	DWORD PTR _sts$[ebp], 0
	je	SHORT $L80488
	push	0
	push	0
	push	1
	push	0
	push	0
	push	12					; 0000000cH
	push	OFFSET FLAT:$SG80489
	push	10					; 0000000aH
	push	0
	push	0
	push	0
	mov	edx, DWORD PTR _cntxt$[ebp]
	add	edx, 20					; 00000014H
	push	edx
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
	mov	eax, DWORD PTR _cntxt$[ebp]
	push	eax
	call	_dyntab_val
	add	esp, 12					; 0000000cH
	push	eax
	call	_strtoul
	add	esp, 12					; 0000000cH
	push	eax
	push	0
	push	68					; 00000044H
	mov	ecx, DWORD PTR _cx$[ebp]
	mov	edx, DWORD PTR [ecx+480]
	add	edx, 40					; 00000028H
	push	edx
	mov	eax, DWORD PTR _cntxt$[ebp]
	push	eax
	call	_cgi_build_name
	add	esp, 52					; 00000034H
	test	eax, eax
	jne	SHORT $L80487
$L80488:
	mov	ecx, DWORD PTR _sz$[ebp]
	push	ecx
	mov	edx, DWORD PTR _sts$[ebp]
	push	edx
	mov	eax, DWORD PTR _cx$[ebp]
	mov	ecx, DWORD PTR [eax+480]
	mov	edx, DWORD PTR [ecx+40]
	mov	eax, DWORD PTR [edx+4]
	push	eax
	mov	ecx, DWORD PTR _cx$[ebp]
	mov	edx, DWORD PTR [ecx+480]
	mov	eax, DWORD PTR [edx+40]
	add	eax, 8
	push	eax
	push	0
	mov	ecx, DWORD PTR _cntxt$[ebp]
	push	ecx
	call	_cgi_add_input
	add	esp, 24					; 00000018H
	test	eax, eax
	je	SHORT $eva_noerr$80490
$L80487:
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 269		; 0000010dH
	jmp	SHORT $eva_err$80481
$eva_noerr$80490:

; 270  : 
; 271  : 	RETURN_OK_CLEANUP;

	push	0
	push	OFFSET FLAT:$SG80491
	push	OFFSET FLAT:$SG80492
	mov	eax, DWORD PTR _cntxt$[ebp]
	push	eax
	call	_err_clear
	add	esp, 16					; 00000010H
$eva_err$80481:
	mov	ecx, DWORD PTR _cntxt$[ebp]
	cmp	DWORD PTR [ecx+29872], 0
	je	SHORT $L80493
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	eax, DWORD PTR [edx+29900]
	push	eax
	push	OFFSET FLAT:$SG80494
	push	OFFSET FLAT:$SG80495
	mov	ecx, DWORD PTR _cntxt$[ebp]
	push	ecx
	call	_err_add_context
	add	esp, 16					; 00000010H
$L80493:
	mov	edx, DWORD PTR _cntxt$[ebp]
	xor	eax, eax
	cmp	DWORD PTR [edx+29872], 0
	setne	al

; 272  : }

	pop	ebp
	ret	0
_return_pay_site ENDP
_TEXT	ENDS
PUBLIC	_result_pay_site
EXTRN	_qry_obj_field:NEAR
EXTRN	_strcmp:NEAR
_BSS	SEGMENT
	ALIGN	4

$SG80586 DB	01H DUP (?)
	ALIGN	4

$SG80587 DB	01H DUP (?)
	ALIGN	4

$SG80588 DB	01H DUP (?)
_BSS	ENDS
_DATA	SEGMENT
$SG80509 DB	'Err-GET call not handled', 00H
	ORG $+3
$SG80518 DB	'%s', 00H
	ORG $+1
$SG80519 DB	'%s', 00H
	ORG $+1
$SG80524 DB	'_EVA_PAY_BTN', 00H
	ORG $+3
$SG80535 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG80539 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG80542 DB	'+', 00H
	ORG $+2
$SG80543 DB	'+', 00H
	ORG $+2
$SG80545 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG80549 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG80552 DB	'+', 00H
	ORG $+2
$SG80553 DB	'+', 00H
	ORG $+2
$SG80555 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG80559 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG80562 DB	'+', 00H
	ORG $+2
$SG80563 DB	'+1.2open+', 00H
	ORG $+2
$SG80565 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG80568 DB	'Document falsifie', 00H
	ORG $+2
$SG80570 DB	'OK', 00H
	ORG $+1
$SG80573 DB	'ErrNoKey', 00H
	ORG $+3
$SG80576 DB	'_EVA_PAY_RES', 00H
	ORG $+3
$SG80579 DB	'_EVA_PAY_STS', 00H
	ORG $+3
$SG80583 DB	'ac', 00H
	ORG $+1
$SG80584 DB	'TPE.txt', 00H
$SG80589 DB	'NoTPE!', 00H
	ORG $+1
$SG80590 DB	0aH, '%s [%s] - Notification - status=%s - result=%s%s - '
	DB	'societe=%s - montant=%s', 00H
$SG80591 DB	'Pragma: no-cache', 0dH, 0aH, 00H
	ORG $+1
$SG80592 DB	'Cache-Control: no-cache', 0dH, 0aH, 00H
	ORG $+2
$SG80593 DB	'Expires: -1', 0dH, 0aH, 00H
	ORG $+2
$SG80594 DB	'Content-type: text/plain', 0dH, 0aH, 0dH, 0aH, 00H
	ORG $+3
$SG80595 DB	'1', 00H
	ORG $+2
$SG80596 DB	'Date: %s', 0dH, 0aH, 'Version: %s', 0dH, 0aH, '%s', 0dH, 0aH
	DB	00H
$SG80598 DB	'D:\Travail\ABI\EVA\V4.0\CGI\Brunix-2016\action_paysite.c'
	DB	00H
	ORG $+3
$SG80599 DB	'result_pay_site', 00H
$SG80601 DB	'D:\Travail\ABI\EVA\V4.0\CGI\Brunix-2016\action_paysite.c'
	DB	00H
	ORG $+3
$SG80602 DB	'result_pay_site', 00H
_DATA	ENDS
_TEXT	SEGMENT
_cntxt$ = 8
_cx$ = 12
_data$ = -20
_hash$ = -28
_res$ = -24
_date$80511 = -108
_macok$80512 = -116
_longref$80513 = -104
_sts$80514 = -100
_plus$80515 = -112
_mac$80516 = -92
_idobj$80517 = -96
_val$80575 = -180
_f$80582 = -184
_result_pay_site PROC NEAR

; 286  : ){

	push	ebp
	mov	ebp, esp
	sub	esp, 196				; 000000c4H
	push	edi

; 287  : 	DynTable data = {0};

	mov	DWORD PTR _data$[ebp], 0
	xor	eax, eax
	mov	DWORD PTR _data$[ebp+4], eax
	mov	DWORD PTR _data$[ebp+8], eax
	mov	DWORD PTR _data$[ebp+12], eax
	mov	DWORD PTR _data$[ebp+16], eax

; 288  : 	DynBuffer *hash = NULL;

	mov	DWORD PTR _hash$[ebp], 0

; 289  : 	char *res = "Err-GET call not handled";

	mov	DWORD PTR _res$[ebp], OFFSET FLAT:$SG80509

; 290  : 
; 291  : 	/* If CGI data present */
; 292  : 	if(cntxt->nb_cgi == 8)

	mov	ecx, DWORD PTR _cntxt$[ebp]
	cmp	DWORD PTR [ecx+29652], 8
	jne	$L80585

; 294  : 		/* Read CGI data */
; 295  : 		char *date = cntxt->cgi[1].value;

	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	eax, DWORD PTR [edx+29648]
	mov	ecx, DWORD PTR [eax+64]
	mov	DWORD PTR _date$80511[ebp], ecx

; 296  : 		char *macok = cntxt->cgi[4].value;

	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	eax, DWORD PTR [edx+29648]
	mov	ecx, DWORD PTR [eax+232]
	mov	DWORD PTR _macok$80512[ebp], ecx

; 297  : 		char *longref = cntxt->cgi[5].value;

	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	eax, DWORD PTR [edx+29648]
	mov	ecx, DWORD PTR [eax+288]
	mov	DWORD PTR _longref$80513[ebp], ecx

; 298  : 		char *sts = cntxt->cgi[6].value;

	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	eax, DWORD PTR [edx+29648]
	mov	ecx, DWORD PTR [eax+344]
	mov	DWORD PTR _sts$80514[ebp], ecx

; 299  : 		char *plus = cntxt->cgi[7].value;

	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	eax, DWORD PTR [edx+29648]
	mov	ecx, DWORD PTR [eax+400]
	mov	DWORD PTR _plus$80515[ebp], ecx

; 300  : 		char mac[64];
; 301  : 		unsigned long idobj;
; 302  : 		cx->tpe = cntxt->cgi[0].value;

	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	eax, DWORD PTR [edx+29648]
	mov	ecx, DWORD PTR _cx$[ebp]
	mov	edx, DWORD PTR [eax+8]
	mov	DWORD PTR [ecx+484], edx

; 303  : 		snprintf(add_sz_str(cx->ref), "%s", cntxt->cgi[3].value);

	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	ecx, DWORD PTR [eax+29648]
	mov	edx, DWORD PTR [ecx+176]
	push	edx
	push	OFFSET FLAT:$SG80518
	push	31					; 0000001fH
	mov	eax, DWORD PTR _cx$[ebp]
	add	eax, 504				; 000001f8H
	push	eax
	call	__snprintf
	add	esp, 16					; 00000010H

; 304  : 		snprintf(add_sz_str(cx->amount), "%s", cntxt->cgi[2].value);

	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	edx, DWORD PTR [ecx+29648]
	mov	eax, DWORD PTR [edx+120]
	push	eax
	push	OFFSET FLAT:$SG80519
	push	31					; 0000001fH
	mov	ecx, DWORD PTR _cx$[ebp]
	add	ecx, 536				; 00000218H
	push	ecx
	call	__snprintf
	add	esp, 16					; 00000010H

; 305  : 		res = NULL;

	mov	DWORD PTR _res$[ebp], 0

; 306  : 		idobj = strtoul(cx->ref, NULL, 10);

	push	10					; 0000000aH
	push	0
	mov	edx, DWORD PTR _cx$[ebp]
	add	edx, 504				; 000001f8H
	push	edx
	call	_strtoul
	add	esp, 12					; 0000000cH
	mov	DWORD PTR _idobj$80517[ebp], eax

; 307  : 
; 308  : 		/* Read button info if available */
; 309  : 		if(idobj && !cx->ctrl)

	cmp	DWORD PTR _idobj$80517[ebp], 0
	je	$L80569
	mov	eax, DWORD PTR _cx$[ebp]
	cmp	DWORD PTR [eax+480], 0
	jne	$L80569

; 311  : 			cx->ctrl = &cx->ctl;

	mov	ecx, DWORD PTR _cx$[ebp]
	mov	edx, DWORD PTR _cx$[ebp]
	mov	DWORD PTR [ecx+480], edx

; 312  : 			if(qry_obj_field(cntxt, &data, idobj, "_EVA_PAY_BTN")) STACK_ERROR;

	push	OFFSET FLAT:$SG80524
	mov	eax, DWORD PTR _idobj$80517[ebp]
	push	eax
	lea	ecx, DWORD PTR _data$[ebp]
	push	ecx
	mov	edx, DWORD PTR _cntxt$[ebp]
	push	edx
	call	_qry_obj_field
	add	esp, 16					; 00000010H
	test	eax, eax
	je	SHORT $L80523
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 312		; 00000138H
	jmp	$eva_err$80525
$L80523:

; 313  : 			if(qry_cache_idobj(&cx->ctrl->attr, DYNTAB_TOUL(&data)) ||
; 314  : 				ctrl_read_baseobj(cntxt, &cx->ctrl->attr)) STACK_ERROR;

	push	3
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
	mov	edx, DWORD PTR _cx$[ebp]
	mov	eax, DWORD PTR [edx+480]
	add	eax, 44					; 0000002cH
	push	eax
	mov	ecx, DWORD PTR _cntxt$[ebp]
	push	ecx
	call	_qry_cache_idobj_field
	add	esp, 20					; 00000014H
	test	eax, eax
	jne	SHORT $L80529
	mov	edx, DWORD PTR _cx$[ebp]
	mov	eax, DWORD PTR [edx+480]
	add	eax, 44					; 0000002cH
	push	eax
	mov	ecx, DWORD PTR _cntxt$[ebp]
	push	ecx
	call	_ctrl_read_baseobj
	add	esp, 8
	test	eax, eax
	je	SHORT $L80528
$L80529:
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 314		; 0000013aH
	jmp	$eva_err$80525
$L80528:

; 315  : 
; 316  : 			/* If button info available */
; 317  : 			if(cx->ctrl->attr.nbrows)

	mov	eax, DWORD PTR _cx$[ebp]
	mov	ecx, DWORD PTR [eax+480]
	cmp	DWORD PTR [ecx+44], 0
	je	$L80569

; 319  : 				/* Build MAC */
; 320  : 				if(init_pay_site(cntxt, cx)) STACK_ERROR;

	mov	edx, DWORD PTR _cx$[ebp]
	push	edx
	mov	eax, DWORD PTR _cntxt$[ebp]
	push	eax
	call	_init_pay_site
	add	esp, 8
	test	eax, eax
	je	SHORT $L80531
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 320		; 00000140H
	jmp	$eva_err$80525
$L80531:

; 321  : 				DYNBUF_ADD(&hash, plus, 0, NO_CONV);

	push	0
	push	0
	push	0
	mov	edx, DWORD PTR _plus$80515[ebp]
	push	edx
	lea	eax, DWORD PTR _hash$[ebp]
	push	eax
	call	_dynbuf_add
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L80533
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29872], OFFSET FLAT:$SG80535
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 321		; 00000141H
	jmp	$eva_err$80525
$L80533:

; 322  : 				DYNBUF_ADD(&hash, cx->tpe, 0, NO_CONV);

	push	0
	push	0
	push	0
	mov	eax, DWORD PTR _cx$[ebp]
	mov	ecx, DWORD PTR [eax+484]
	push	ecx
	lea	edx, DWORD PTR _hash$[ebp]
	push	edx
	call	_dynbuf_add
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L80537
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29872], OFFSET FLAT:$SG80539
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 322		; 00000142H
	jmp	$eva_err$80525
$L80537:

; 323  : 				DYNBUF_ADD3(&hash, "+", date, 0, NO_CONV, "+");

	push	1
	push	OFFSET FLAT:$SG80542
	push	0
	push	0
	push	0
	mov	edx, DWORD PTR _date$80511[ebp]
	push	edx
	push	1
	push	OFFSET FLAT:$SG80543
	lea	eax, DWORD PTR _hash$[ebp]
	push	eax
	call	_dynbuf_add3
	add	esp, 36					; 00000024H
	test	eax, eax
	je	SHORT $L80541
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29872], OFFSET FLAT:$SG80545
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 323		; 00000143H
	jmp	$eva_err$80525
$L80541:

; 324  : 				DYNBUF_ADD(&hash, cx->amount, 0, NO_CONV);

	push	0
	push	0
	push	0
	mov	eax, DWORD PTR _cx$[ebp]
	add	eax, 536				; 00000218H
	push	eax
	lea	ecx, DWORD PTR _hash$[ebp]
	push	ecx
	call	_dynbuf_add
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L80547
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29872], OFFSET FLAT:$SG80549
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 324		; 00000144H
	jmp	$eva_err$80525
$L80547:

; 325  : 				DYNBUF_ADD3(&hash, "+", cx->ref, 0, NO_CONV, "+");

	push	1
	push	OFFSET FLAT:$SG80552
	push	0
	push	0
	push	0
	mov	ecx, DWORD PTR _cx$[ebp]
	add	ecx, 504				; 000001f8H
	push	ecx
	push	1
	push	OFFSET FLAT:$SG80553
	lea	edx, DWORD PTR _hash$[ebp]
	push	edx
	call	_dynbuf_add3
	add	esp, 36					; 00000024H
	test	eax, eax
	je	SHORT $L80551
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29872], OFFSET FLAT:$SG80555
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 325		; 00000145H
	jmp	$eva_err$80525
$L80551:

; 326  : 				DYNBUF_ADD(&hash, longref, 0, NO_CONV);

	push	0
	push	0
	push	0
	mov	edx, DWORD PTR _longref$80513[ebp]
	push	edx
	lea	eax, DWORD PTR _hash$[ebp]
	push	eax
	call	_dynbuf_add
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L80557
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29872], OFFSET FLAT:$SG80559
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 326		; 00000146H
	jmp	$eva_err$80525
$L80557:

; 327  : 				DYNBUF_ADD3(&hash, "+1.2open+", sts, 0, NO_CONV, "+");

	push	1
	push	OFFSET FLAT:$SG80562
	push	0
	push	0
	push	0
	mov	eax, DWORD PTR _sts$80514[ebp]
	push	eax
	push	9
	push	OFFSET FLAT:$SG80563
	lea	ecx, DWORD PTR _hash$[ebp]
	push	ecx
	call	_dynbuf_add3
	add	esp, 36					; 00000024H
	test	eax, eax
	je	SHORT $L80561
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29872], OFFSET FLAT:$SG80565
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 327		; 00000147H
	jmp	$eva_err$80525
$L80561:

; 328  : 				if(HMAC_SHA1(cntxt, mac, cx->k, cx->kl, hash->data, hash->cnt)) STACK_ERROR;

	mov	ecx, DWORD PTR _hash$[ebp]
	mov	edx, DWORD PTR [ecx+4]
	push	edx
	mov	eax, DWORD PTR _hash$[ebp]
	add	eax, 8
	push	eax
	mov	ecx, DWORD PTR _cx$[ebp]
	mov	edx, DWORD PTR [ecx+632]
	push	edx
	mov	eax, DWORD PTR _cx$[ebp]
	add	eax, 600				; 00000258H
	push	eax
	lea	ecx, DWORD PTR _mac$80516[ebp]
	push	ecx
	mov	edx, DWORD PTR _cntxt$[ebp]
	push	edx
	call	_HMAC_SHA1
	add	esp, 24					; 00000018H
	test	eax, eax
	je	SHORT $L80566
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 328		; 00000148H
	jmp	$eva_err$80525
$L80566:

; 329  : 				if(strcmp(mac, macok))

	mov	ecx, DWORD PTR _macok$80512[ebp]
	push	ecx
	lea	edx, DWORD PTR _mac$80516[ebp]
	push	edx
	call	_strcmp
	add	esp, 8
	test	eax, eax
	je	SHORT $L80567

; 331  : 					res = "Document falsifie";

	mov	DWORD PTR _res$[ebp], OFFSET FLAT:$SG80568

; 333  : 				else

	jmp	SHORT $L80569
$L80567:

; 334  : 					res = "OK";

	mov	DWORD PTR _res$[ebp], OFFSET FLAT:$SG80570
$L80569:

; 337  : 		if(!res || !cx->kl) res = "ErrNoKey";

	cmp	DWORD PTR _res$[ebp], 0
	je	SHORT $L80572
	mov	eax, DWORD PTR _cx$[ebp]
	cmp	DWORD PTR [eax+632], 0
	jne	SHORT $L80571
$L80572:
	mov	DWORD PTR _res$[ebp], OFFSET FLAT:$SG80573
$L80571:

; 338  : 
; 339  : 		/* Store status & result */
; 340  : 		if(idobj)

	cmp	DWORD PTR _idobj$80517[ebp], 0
	je	$L80581

; 342  : 			DynTableCell val = {0};

	mov	DWORD PTR _val$80575[ebp], 0
	mov	ecx, 15					; 0000000fH
	xor	eax, eax
	lea	edi, DWORD PTR _val$80575[ebp+4]
	rep stosd

; 343  : 			val.IdObj = idobj;

	mov	ecx, DWORD PTR _idobj$80517[ebp]
	mov	DWORD PTR _val$80575[ebp+20], ecx

; 344  : 			val.txt = res;

	mov	edx, DWORD PTR _res$[ebp]
	mov	DWORD PTR _val$80575[ebp], edx

; 345  : 			val.len = strlen(val.txt);

	mov	eax, DWORD PTR _val$80575[ebp]
	push	eax
	call	_strlen
	add	esp, 4
	mov	DWORD PTR _val$80575[ebp+4], eax

; 346  : 			val.field = "_EVA_PAY_RES";

	mov	DWORD PTR _val$80575[ebp+8], OFFSET FLAT:$SG80576

; 347  : 			if(qry_add_val(cntxt, &val, 0, NULL)) STACK_ERROR;

	push	0
	push	0
	lea	ecx, DWORD PTR _val$80575[ebp]
	push	ecx
	mov	edx, DWORD PTR _cntxt$[ebp]
	push	edx
	call	_qry_add_val
	add	esp, 16					; 00000010H
	test	eax, eax
	je	SHORT $L80578
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 347		; 0000015bH
	jmp	$eva_err$80525
$L80578:

; 348  : 			val.IdValue = 0;

	mov	DWORD PTR _val$80575[ebp+32], 0

; 349  : 			val.IdField = 0;

	mov	DWORD PTR _val$80575[ebp+28], 0

; 350  : 			val.txt = sts;

	mov	ecx, DWORD PTR _sts$80514[ebp]
	mov	DWORD PTR _val$80575[ebp], ecx

; 351  : 			val.len = strlen(val.txt);

	mov	edx, DWORD PTR _val$80575[ebp]
	push	edx
	call	_strlen
	add	esp, 4
	mov	DWORD PTR _val$80575[ebp+4], eax

; 352  : 			val.field = "_EVA_PAY_STS";

	mov	DWORD PTR _val$80575[ebp+8], OFFSET FLAT:$SG80579

; 353  : 			if(qry_add_val(cntxt, &val, 0, NULL)) STACK_ERROR;

	push	0
	push	0
	lea	eax, DWORD PTR _val$80575[ebp]
	push	eax
	mov	ecx, DWORD PTR _cntxt$[ebp]
	push	ecx
	call	_qry_add_val
	add	esp, 16					; 00000010H
	test	eax, eax
	je	SHORT $L80581
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 353		; 00000161H
	jmp	$eva_err$80525
$L80581:

; 355  :  		LogTPE("Notification - status=%s - result=%s%s", sts, res, "")

	push	OFFSET FLAT:$SG80583
	push	OFFSET FLAT:$SG80584
	call	_fopen
	add	esp, 8
	mov	DWORD PTR _f$80582[ebp], eax
	cmp	DWORD PTR _f$80582[ebp], 0
	je	$L80585
	mov	eax, DWORD PTR _cx$[ebp]
	add	eax, 536				; 00000218H
	test	eax, eax
	je	SHORT $L80718
	mov	ecx, DWORD PTR _cx$[ebp]
	add	ecx, 536				; 00000218H
	mov	DWORD PTR -188+[ebp], ecx
	jmp	SHORT $L80719
$L80718:
	mov	DWORD PTR -188+[ebp], OFFSET FLAT:$SG80586
$L80719:
	mov	edx, DWORD PTR _cx$[ebp]
	cmp	DWORD PTR [edx+488], 0
	je	SHORT $L80720
	mov	eax, DWORD PTR _cx$[ebp]
	mov	ecx, DWORD PTR [eax+488]
	mov	DWORD PTR -192+[ebp], ecx
	jmp	SHORT $L80721
$L80720:
	mov	DWORD PTR -192+[ebp], OFFSET FLAT:$SG80587
$L80721:
	mov	edx, DWORD PTR _cx$[ebp]
	add	edx, 504				; 000001f8H
	test	edx, edx
	je	SHORT $L80722
	mov	eax, DWORD PTR _cx$[ebp]
	add	eax, 504				; 000001f8H
	mov	DWORD PTR -196+[ebp], eax
	jmp	SHORT $L80723
$L80722:
	mov	DWORD PTR -196+[ebp], OFFSET FLAT:$SG80589
$L80723:
	mov	ecx, DWORD PTR -188+[ebp]
	push	ecx
	mov	edx, DWORD PTR -192+[ebp]
	push	edx
	push	OFFSET FLAT:$SG80588
	mov	eax, DWORD PTR _res$[ebp]
	push	eax
	mov	ecx, DWORD PTR _sts$80514[ebp]
	push	ecx
	mov	edx, DWORD PTR -196+[ebp]
	push	edx
	mov	eax, DWORD PTR _cx$[ebp]
	add	eax, 568				; 00000238H
	push	eax
	push	OFFSET FLAT:$SG80590
	mov	ecx, DWORD PTR _f$80582[ebp]
	push	ecx
	call	_fprintf
	add	esp, 36					; 00000024H
	mov	edx, DWORD PTR _f$80582[ebp]
	push	edx
	call	_fclose
	add	esp, 4
$L80585:

; 357  : 
; 358  : 	/* Acknowledge */
; 359  :     printf("Pragma: no-cache\r\n");

	push	OFFSET FLAT:$SG80591
	call	_printf
	add	esp, 4

; 360  :     printf("Cache-Control: no-cache\r\n");

	push	OFFSET FLAT:$SG80592
	call	_printf
	add	esp, 4

; 361  :     printf("Expires: -1\r\n");

	push	OFFSET FLAT:$SG80593
	call	_printf
	add	esp, 4

; 362  :     printf("Content-type: text/plain\r\n\r\n");

	push	OFFSET FLAT:$SG80594
	call	_printf
	add	esp, 4

; 363  : 	printf("Date: %s\r\n"
; 364  : 			"Version: %s\r\n"
; 365  : 			"%s\r\n", cx->d, "1", res);

	mov	eax, DWORD PTR _res$[ebp]
	push	eax
	push	OFFSET FLAT:$SG80595
	mov	ecx, DWORD PTR _cx$[ebp]
	add	ecx, 568				; 00000238H
	push	ecx
	push	OFFSET FLAT:$SG80596
	call	_printf
	add	esp, 16					; 00000010H
$eva_noerr$80597:

; 366  : 	RETURN_OK_CLEANUP;

	push	0
	push	OFFSET FLAT:$SG80598
	push	OFFSET FLAT:$SG80599
	mov	edx, DWORD PTR _cntxt$[ebp]
	push	edx
	call	_err_clear
	add	esp, 16					; 00000010H
$eva_err$80525:
	mov	eax, DWORD PTR _cntxt$[ebp]
	cmp	DWORD PTR [eax+29872], 0
	je	SHORT $L80600
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	edx, DWORD PTR [ecx+29900]
	push	edx
	push	OFFSET FLAT:$SG80601
	push	OFFSET FLAT:$SG80602
	mov	eax, DWORD PTR _cntxt$[ebp]
	push	eax
	call	_err_add_context
	add	esp, 16					; 00000010H
$L80600:
	lea	ecx, DWORD PTR _data$[ebp]
	push	ecx
	call	_dyntab_free
	add	esp, 4
	mov	edx, DWORD PTR _hash$[ebp]
	push	edx
	call	_mem_free
	add	esp, 4
	mov	DWORD PTR _hash$[ebp], 0
	mov	eax, DWORD PTR _cntxt$[ebp]
	xor	ecx, ecx
	cmp	DWORD PTR [eax+29872], 0
	setne	cl
	mov	eax, ecx

; 367  : }

	pop	edi
	mov	esp, ebp
	pop	ebp
	ret	0
_result_pay_site ENDP
_TEXT	ENDS
PUBLIC	_action_pay_site
EXTRN	_form_save_dialog:NEAR
EXTRN	_strncmp:NEAR
_BSS	SEGMENT
	ALIGN	4

$SG80626 DB	01H DUP (?)
	ALIGN	4

$SG80653 DB	01H DUP (?)
	ALIGN	4

$SG80654 DB	01H DUP (?)
	ALIGN	4

$SG80663 DB	01H DUP (?)
	ALIGN	4

$SG80664 DB	01H DUP (?)
_BSS	ENDS
_DATA	SEGMENT
$SG80619 DB	'_EVA_CONFIRMNONE', 00H
	ORG $+3
$SG80623 DB	'%.2s/%.2s/%.4s:%.2s:%.2s:%.2s', 00H
	ORG $+2
$SG80631 DB	'TPE=', 00H
	ORG $+3
$SG80635 DB	'PaySiteErr=', 00H
$SG80637 DB	'Err', 00H
$SG80640 DB	'PaySiteOk=', 00H
	ORG $+1
$SG80642 DB	'Ok', 00H
	ORG $+1
$SG80645 DB	'PaySiteReturn=', 00H
	ORG $+1
$SG80650 DB	'ac', 00H
	ORG $+1
$SG80651 DB	'TPE.txt', 00H
$SG80655 DB	'(none)', 00H
	ORG $+1
$SG80656 DB	'NoTPE!', 00H
	ORG $+1
$SG80657 DB	0aH, '%s [%s] - Error *** unhandled - ictrl=%lu QRY=%.20s'
	DB	' nbcgi=%lu - societe=%s - montant=%s', 00H
	ORG $+3
$SG80660 DB	'ac', 00H
	ORG $+1
$SG80661 DB	'TPE.txt', 00H
$SG80665 DB	'(none)', 00H
	ORG $+1
$SG80666 DB	'NoTPE!', 00H
	ORG $+1
$SG80667 DB	0aH, '%s [%s] - ***TEST*** - ictrl=%lu QRY=%.20s nbcgi=%l'
	DB	'u - societe=%s - montant=%s', 00H
$SG80668 DB	'D:\Travail\ABI\EVA\V4.0\CGI\Brunix-2016\action_paysite.c'
	DB	00H
	ORG $+3
$SG80669 DB	'action_pay_site', 00H
$SG80671 DB	'D:\Travail\ABI\EVA\V4.0\CGI\Brunix-2016\action_paysite.c'
	DB	00H
	ORG $+3
$SG80672 DB	'action_pay_site', 00H
_DATA	ENDS
_TEXT	SEGMENT
_cntxt$ = 8
_i_ctrl$ = 12
_form$ = -4
__cx$ = -652
_cx$ = -656
_cb$ = -12
_t$ = -8
_b_done$80617 = -660
_f$80649 = -664
_f$80659 = -668
_action_pay_site PROC NEAR

; 380  : ){

	push	ebp
	mov	ebp, esp
	sub	esp, 708				; 000002c4H
	push	edi

; 381  : 	EVA_form *form = cntxt->form;

	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	ecx, DWORD PTR [eax+80]
	mov	DWORD PTR _form$[ebp], ecx

; 382  : 	PaySiteCtx _cx = {{{0}}};

	mov	DWORD PTR __cx$[ebp], 0
	xor	edx, edx
	mov	DWORD PTR __cx$[ebp+4], edx
	mov	DWORD PTR __cx$[ebp+8], edx
	mov	DWORD PTR __cx$[ebp+12], edx
	mov	DWORD PTR __cx$[ebp+16], edx
	mov	ecx, 115				; 00000073H
	xor	eax, eax
	lea	edi, DWORD PTR __cx$[ebp+20]
	rep stosd
	mov	ecx, 40					; 00000028H
	xor	eax, eax
	lea	edi, DWORD PTR __cx$[ebp+480]
	rep stosd

; 383  : 	PaySiteCtx *cx = {&_cx};

	lea	eax, DWORD PTR __cx$[ebp]
	mov	DWORD PTR _cx$[ebp], eax

; 384  : 	char *cb;
; 385  : 	char *t = cntxt->timestamp;

	mov	ecx, DWORD PTR _cntxt$[ebp]
	add	ecx, 29704				; 00007408H
	mov	DWORD PTR _t$[ebp], ecx

; 386  : 
; 387  : 	/* Handle save before on button click */
; 388  : 	if(i_ctrl)

	cmp	DWORD PTR _i_ctrl$[ebp], 0
	je	SHORT $L80616

; 390  : 		int b_done = BUTN_SAVE_NEXT;

	mov	DWORD PTR _b_done$80617[ebp], 1

; 391  : 		if(form->b_modified &&
; 392  : 			form_save_dialog(cntxt, i_ctrl, "_EVA_CONFIRMNONE", BUTN_SAVE_NEXT, &b_done)) STACK_ERROR;

	mov	edx, DWORD PTR _form$[ebp]
	cmp	DWORD PTR [edx+128], 0
	je	SHORT $L80618
	lea	eax, DWORD PTR _b_done$80617[ebp]
	push	eax
	push	1
	push	OFFSET FLAT:$SG80619
	mov	ecx, DWORD PTR _i_ctrl$[ebp]
	push	ecx
	mov	edx, DWORD PTR _cntxt$[ebp]
	push	edx
	call	_form_save_dialog
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L80618
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 392		; 00000188H
	jmp	$eva_err$80620
$L80618:

; 393  : 		if(b_done != BUTN_SAVE_NEXT) RETURN_OK;

	cmp	DWORD PTR _b_done$80617[ebp], 1
	je	SHORT $L80621
	jmp	$eva_noerr$80622
$L80621:

; 394  : 		form = cntxt->form;

	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	edx, DWORD PTR [ecx+80]
	mov	DWORD PTR _form$[ebp], edx
$L80616:

; 396  : 
; 397  : 	/* Format date */
; 398  : 	snprintf(add_sz_str(cx->d), "%.2s/%.2s/%.4s:%.2s:%.2s:%.2s", t + 6, t + 4, t, t + 8, t + 10, t + 12);

	mov	eax, DWORD PTR _t$[ebp]
	add	eax, 12					; 0000000cH
	push	eax
	mov	ecx, DWORD PTR _t$[ebp]
	add	ecx, 10					; 0000000aH
	push	ecx
	mov	edx, DWORD PTR _t$[ebp]
	add	edx, 8
	push	edx
	mov	eax, DWORD PTR _t$[ebp]
	push	eax
	mov	ecx, DWORD PTR _t$[ebp]
	add	ecx, 4
	push	ecx
	mov	edx, DWORD PTR _t$[ebp]
	add	edx, 6
	push	edx
	push	OFFSET FLAT:$SG80623
	push	31					; 0000001fH
	mov	eax, DWORD PTR _cx$[ebp]
	add	eax, 568				; 00000238H
	push	eax
	call	__snprintf
	add	esp, 36					; 00000024H

; 399  : 
; 400  : 	/* Init context */
; 401  : 	cx->ctrl = i_ctrl ? form->ctrl + i_ctrl : NULL;

	cmp	DWORD PTR _i_ctrl$[ebp], 0
	je	SHORT $L80725
	mov	ecx, DWORD PTR _i_ctrl$[ebp]
	imul	ecx, 480				; 000001e0H
	mov	edx, DWORD PTR _form$[ebp]
	mov	eax, DWORD PTR [edx]
	add	eax, ecx
	mov	DWORD PTR -672+[ebp], eax
	jmp	SHORT $L80726
$L80725:
	mov	DWORD PTR -672+[ebp], 0
$L80726:
	mov	ecx, DWORD PTR _cx$[ebp]
	mov	edx, DWORD PTR -672+[ebp]
	mov	DWORD PTR [ecx+480], edx

; 402  :  	if(init_pay_site(cntxt, cx)) STACK_ERROR;

	mov	eax, DWORD PTR _cx$[ebp]
	push	eax
	mov	ecx, DWORD PTR _cntxt$[ebp]
	push	ecx
	call	_init_pay_site
	add	esp, 8
	test	eax, eax
	je	SHORT $L80625
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 402		; 00000192H
	jmp	$eva_err$80620
$L80625:

; 403  : 	cb = cntxt->qrystr ? cntxt->qrystr : "";

	mov	eax, DWORD PTR _cntxt$[ebp]
	cmp	DWORD PTR [eax+29736], 0
	je	SHORT $L80727
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	edx, DWORD PTR [ecx+29736]
	mov	DWORD PTR -676+[ebp], edx
	jmp	SHORT $L80728
$L80727:
	mov	DWORD PTR -676+[ebp], OFFSET FLAT:$SG80626
$L80728:
	mov	eax, DWORD PTR -676+[ebp]
	mov	DWORD PTR _cb$[ebp], eax

; 404  : 	if(!*cb)

	mov	ecx, DWORD PTR _cb$[ebp]
	movsx	edx, BYTE PTR [ecx]
	test	edx, edx
	jne	SHORT $L80627

; 406  : 		/* Pay button click : redirect to bank site */
; 407  : 		if(call_pay_site(cntxt, cx)) STACK_ERROR;

	mov	eax, DWORD PTR _cx$[ebp]
	push	eax
	mov	ecx, DWORD PTR _cntxt$[ebp]
	push	ecx
	call	_call_pay_site
	add	esp, 8
	test	eax, eax
	je	SHORT $L80628
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 407		; 00000197H
	jmp	$eva_err$80620
$L80628:

; 409  : 	else if(!strncmp(cb, add_sz_str("TPE=")))

	jmp	$L80652
$L80627:
	push	4
	push	OFFSET FLAT:$SG80631
	mov	eax, DWORD PTR _cb$[ebp]
	push	eax
	call	_strncmp
	add	esp, 12					; 0000000cH
	test	eax, eax
	jne	SHORT $L80630

; 411  : 		/* Transaction result : store */
; 412  : 		if(result_pay_site(cntxt, cx)) STACK_ERROR;

	mov	ecx, DWORD PTR _cx$[ebp]
	push	ecx
	mov	edx, DWORD PTR _cntxt$[ebp]
	push	edx
	call	_result_pay_site
	add	esp, 8
	test	eax, eax
	je	SHORT $L80632
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 412		; 0000019cH
	jmp	$eva_err$80620
$L80632:

; 414  : 	else if(!strncmp(cb, add_sz_str("PaySiteErr=")))

	jmp	$L80652
$L80630:
	push	11					; 0000000bH
	push	OFFSET FLAT:$SG80635
	mov	ecx, DWORD PTR _cb$[ebp]
	push	ecx
	call	_strncmp
	add	esp, 12					; 0000000cH
	test	eax, eax
	jne	SHORT $L80634

; 416  : 		/* Bank site error : display error message */
; 417  : 		if(return_pay_site(cntxt, cx, add_sz_str("Err"))) STACK_ERROR;

	push	3
	push	OFFSET FLAT:$SG80637
	mov	edx, DWORD PTR _cx$[ebp]
	push	edx
	mov	eax, DWORD PTR _cntxt$[ebp]
	push	eax
	call	_return_pay_site
	add	esp, 16					; 00000010H
	test	eax, eax
	je	SHORT $L80636
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 417		; 000001a1H
	jmp	$eva_err$80620
$L80636:

; 419  : 	else if(!strncmp(cb, add_sz_str("PaySiteOk=")))

	jmp	$L80652
$L80634:
	push	10					; 0000000aH
	push	OFFSET FLAT:$SG80640
	mov	edx, DWORD PTR _cb$[ebp]
	push	edx
	call	_strncmp
	add	esp, 12					; 0000000cH
	test	eax, eax
	jne	SHORT $L80639

; 421  : 		/* Bank site return : display error message */
; 422  : 		if(return_pay_site(cntxt, cx, add_sz_str("Ok"))) STACK_ERROR;

	push	2
	push	OFFSET FLAT:$SG80642
	mov	eax, DWORD PTR _cx$[ebp]
	push	eax
	mov	ecx, DWORD PTR _cntxt$[ebp]
	push	ecx
	call	_return_pay_site
	add	esp, 16					; 00000010H
	test	eax, eax
	je	SHORT $L80641
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 422		; 000001a6H
	jmp	$eva_err$80620
$L80641:

; 424  : 	else if(!strncmp(cb, add_sz_str("PaySiteReturn=")))

	jmp	$L80652
$L80639:
	push	14					; 0000000eH
	push	OFFSET FLAT:$SG80645
	mov	eax, DWORD PTR _cb$[ebp]
	push	eax
	call	_strncmp
	add	esp, 12					; 0000000cH
	test	eax, eax
	jne	SHORT $L80644

; 426  : 		/* Bank site error : display error message */
; 427  : 		if(return_pay_site(cntxt, cx, NULL, 0)) STACK_ERROR;

	push	0
	push	0
	mov	ecx, DWORD PTR _cx$[ebp]
	push	ecx
	mov	edx, DWORD PTR _cntxt$[ebp]
	push	edx
	call	_return_pay_site
	add	esp, 16					; 00000010H
	test	eax, eax
	je	SHORT $L80647
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 427		; 000001abH
	jmp	$eva_err$80620
$L80647:

; 429  : 	else

	jmp	$L80652
$L80644:

; 430  : 		LogTPE("Error *** unhandled - ictrl=%lu QRY=%.20s nbcgi=%lu", i_ctrl, cntxt->qrystr ? cntxt->qrystr : "(none)", cntxt->nb_cgi)

	push	OFFSET FLAT:$SG80650
	push	OFFSET FLAT:$SG80651
	call	_fopen
	add	esp, 8
	mov	DWORD PTR _f$80649[ebp], eax
	cmp	DWORD PTR _f$80649[ebp], 0
	je	$L80652
	mov	ecx, DWORD PTR _cx$[ebp]
	add	ecx, 536				; 00000218H
	test	ecx, ecx
	je	SHORT $L80729
	mov	edx, DWORD PTR _cx$[ebp]
	add	edx, 536				; 00000218H
	mov	DWORD PTR -680+[ebp], edx
	jmp	SHORT $L80730
$L80729:
	mov	DWORD PTR -680+[ebp], OFFSET FLAT:$SG80653
$L80730:
	mov	eax, DWORD PTR _cx$[ebp]
	cmp	DWORD PTR [eax+488], 0
	je	SHORT $L80731
	mov	ecx, DWORD PTR _cx$[ebp]
	mov	edx, DWORD PTR [ecx+488]
	mov	DWORD PTR -684+[ebp], edx
	jmp	SHORT $L80732
$L80731:
	mov	DWORD PTR -684+[ebp], OFFSET FLAT:$SG80654
$L80732:
	mov	eax, DWORD PTR _cntxt$[ebp]
	cmp	DWORD PTR [eax+29736], 0
	je	SHORT $L80733
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	edx, DWORD PTR [ecx+29736]
	mov	DWORD PTR -688+[ebp], edx
	jmp	SHORT $L80734
$L80733:
	mov	DWORD PTR -688+[ebp], OFFSET FLAT:$SG80655
$L80734:
	mov	eax, DWORD PTR _cx$[ebp]
	add	eax, 504				; 000001f8H
	test	eax, eax
	je	SHORT $L80735
	mov	ecx, DWORD PTR _cx$[ebp]
	add	ecx, 504				; 000001f8H
	mov	DWORD PTR -692+[ebp], ecx
	jmp	SHORT $L80736
$L80735:
	mov	DWORD PTR -692+[ebp], OFFSET FLAT:$SG80656
$L80736:
	mov	edx, DWORD PTR -680+[ebp]
	push	edx
	mov	eax, DWORD PTR -684+[ebp]
	push	eax
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	edx, DWORD PTR [ecx+29652]
	push	edx
	mov	eax, DWORD PTR -688+[ebp]
	push	eax
	mov	ecx, DWORD PTR _i_ctrl$[ebp]
	push	ecx
	mov	edx, DWORD PTR -692+[ebp]
	push	edx
	mov	eax, DWORD PTR _cx$[ebp]
	add	eax, 568				; 00000238H
	push	eax
	push	OFFSET FLAT:$SG80657
	mov	ecx, DWORD PTR _f$80649[ebp]
	push	ecx
	call	_fprintf
	add	esp, 36					; 00000024H
	mov	edx, DWORD PTR _f$80649[ebp]
	push	edx
	call	_fclose
	add	esp, 4
$L80652:

; 431  : 
; 432  : 	if(cx->b_test) LogTPE("***TEST*** - ictrl=%lu QRY=%.20s nbcgi=%lu", i_ctrl, cntxt->qrystr ? cntxt->qrystr : "(none)", cntxt->nb_cgi)

	mov	eax, DWORD PTR _cx$[ebp]
	cmp	DWORD PTR [eax+636], 0
	je	$L80662
	push	OFFSET FLAT:$SG80660
	push	OFFSET FLAT:$SG80661
	call	_fopen
	add	esp, 8
	mov	DWORD PTR _f$80659[ebp], eax
	cmp	DWORD PTR _f$80659[ebp], 0
	je	$L80662
	mov	ecx, DWORD PTR _cx$[ebp]
	add	ecx, 536				; 00000218H
	test	ecx, ecx
	je	SHORT $L80737
	mov	edx, DWORD PTR _cx$[ebp]
	add	edx, 536				; 00000218H
	mov	DWORD PTR -696+[ebp], edx
	jmp	SHORT $L80738
$L80737:
	mov	DWORD PTR -696+[ebp], OFFSET FLAT:$SG80663
$L80738:
	mov	eax, DWORD PTR _cx$[ebp]
	cmp	DWORD PTR [eax+488], 0
	je	SHORT $L80739
	mov	ecx, DWORD PTR _cx$[ebp]
	mov	edx, DWORD PTR [ecx+488]
	mov	DWORD PTR -700+[ebp], edx
	jmp	SHORT $L80740
$L80739:
	mov	DWORD PTR -700+[ebp], OFFSET FLAT:$SG80664
$L80740:
	mov	eax, DWORD PTR _cntxt$[ebp]
	cmp	DWORD PTR [eax+29736], 0
	je	SHORT $L80741
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	edx, DWORD PTR [ecx+29736]
	mov	DWORD PTR -704+[ebp], edx
	jmp	SHORT $L80742
$L80741:
	mov	DWORD PTR -704+[ebp], OFFSET FLAT:$SG80665
$L80742:
	mov	eax, DWORD PTR _cx$[ebp]
	add	eax, 504				; 000001f8H
	test	eax, eax
	je	SHORT $L80743
	mov	ecx, DWORD PTR _cx$[ebp]
	add	ecx, 504				; 000001f8H
	mov	DWORD PTR -708+[ebp], ecx
	jmp	SHORT $L80744
$L80743:
	mov	DWORD PTR -708+[ebp], OFFSET FLAT:$SG80666
$L80744:
	mov	edx, DWORD PTR -696+[ebp]
	push	edx
	mov	eax, DWORD PTR -700+[ebp]
	push	eax
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	edx, DWORD PTR [ecx+29652]
	push	edx
	mov	eax, DWORD PTR -704+[ebp]
	push	eax
	mov	ecx, DWORD PTR _i_ctrl$[ebp]
	push	ecx
	mov	edx, DWORD PTR -708+[ebp]
	push	edx
	mov	eax, DWORD PTR _cx$[ebp]
	add	eax, 568				; 00000238H
	push	eax
	push	OFFSET FLAT:$SG80667
	mov	ecx, DWORD PTR _f$80659[ebp]
	push	ecx
	call	_fprintf
	add	esp, 36					; 00000024H
	mov	edx, DWORD PTR _f$80659[ebp]
	push	edx
	call	_fclose
	add	esp, 4
$L80662:
$eva_noerr$80622:

; 433  : 
; 434  : 	RETURN_OK_CLEANUP;

	push	0
	push	OFFSET FLAT:$SG80668
	push	OFFSET FLAT:$SG80669
	mov	eax, DWORD PTR _cntxt$[ebp]
	push	eax
	call	_err_clear
	add	esp, 16					; 00000010H
$eva_err$80620:
	mov	ecx, DWORD PTR _cntxt$[ebp]
	cmp	DWORD PTR [ecx+29872], 0
	je	SHORT $L80670
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	eax, DWORD PTR [edx+29900]
	push	eax
	push	OFFSET FLAT:$SG80671
	push	OFFSET FLAT:$SG80672
	mov	ecx, DWORD PTR _cntxt$[ebp]
	push	ecx
	call	_err_add_context
	add	esp, 16					; 00000010H
$L80670:
	mov	edx, DWORD PTR _cntxt$[ebp]
	xor	eax, eax
	cmp	DWORD PTR [edx+29872], 0
	setne	al

; 435  : }

	pop	edi
	mov	esp, ebp
	pop	ebp
	ret	0
_action_pay_site ENDP
_TEXT	ENDS
END
