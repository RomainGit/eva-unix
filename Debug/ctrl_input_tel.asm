	TITLE	D:\Travail\ABI\EVA\V4.0\CGI\Brunix-2016\ctrl_input_tel.c
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
PUBLIC	_ctrl_add_input_tel
EXTRN	__pctype:DWORD
EXTRN	__isctype:NEAR
EXTRN	_put_html_text_input:NEAR
EXTRN	_ctrl_add_text:NEAR
EXTRN	___mb_cur_max:DWORD
EXTRN	_atoi:NEAR
EXTRN	_mem_free:NEAR
EXTRN	_plain_to_html:BYTE
EXTRN	_put_value_fmt:NEAR
EXTRN	_dynbuf_add:NEAR
EXTRN	_ctrl_cgi_name:NEAR
EXTRN	_dynbuf_add3:NEAR
EXTRN	_dyntab_sz:NEAR
EXTRN	_dyntab_val:NEAR
EXTRN	_dyntab_cell:NEAR
EXTRN	_ctrl_format_pos:NEAR
EXTRN	_strcmp:NEAR
EXTRN	_ctrl_put_hidden_old:NEAR
EXTRN	_strchr:NEAR
EXTRN	_err_add_context:NEAR
EXTRN	_err_clear:NEAR
EXTRN	_dyntab_field_val:NEAR
_BSS	SEGMENT
$SG70300 DB	01H DUP (?)
_BSS	ENDS
_DATA	SEGMENT
$SG70218 DB	'No', 00H
	ORG $+1
$SG70249 DB	'03+', 00H
$SG70250 DB	'il doit commencer par un 0 ou un + pour les num', 0e9H, 'r'
	DB	'os internationnaux', 00H
$SG70251 DB	'+0 n''est pas un pr', 0e9H, 'fixe autoris', 0e9H, 00H
	ORG $+3
$SG70252 DB	'les num', 0e9H, 'ros courts doivent avoir 4 chiffres', 00H
$SG70253 DB	'les num', 0e9H, 'ros fran', 0e7H, 'ais doivent avoir 10 '
	DB	'chiffres', 00H
	ORG $+1
$SG70254 DB	'il doit comporter moins de 14 caract', 0e8H, 'res', 00H
	ORG $+3
$SG70259 DB	0aH, 00H
	ORG $+2
$SG70261 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70265 DB	'] n''est pas valide : ', 00H
	ORG $+2
$SG70266 DB	'Le num', 0e9H, 'ro de t', 0e9H, 'l', 0e9H, 'phone [', 00H
	ORG $+3
$SG70268 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70272 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70278 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70286 DB	'<br>', 00H
	ORG $+3
$SG70288 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70291 DB	'_EVA_TELEPHONE', 00H
	ORG $+1
$SG70299 DB	'_EVA_MAXLENGTH', 00H
	ORG $+1
$SG70303 DB	'_EVA_TELEPHONE', 00H
	ORG $+1
$SG70308 DB	'D:\Travail\ABI\EVA\V4.0\CGI\Brunix-2016\ctrl_input_tel.c'
	DB	00H
	ORG $+3
$SG70309 DB	'ctrl_add_input_tel', 00H
	ORG $+1
$SG70311 DB	'D:\Travail\ABI\EVA\V4.0\CGI\Brunix-2016\ctrl_input_tel.c'
	DB	00H
	ORG $+3
$SG70312 DB	'ctrl_add_input_tel', 00H
_DATA	ENDS
_TEXT	SEGMENT
_cntxt$ = 8
_i_ctrl$ = 12
_form$ = -4
_ctrl$ = -28
_buf$ = -8
_name$ = -24
_i$ = -12
_k$ = -20
_b_multiple$ = -16
_c$70228 = -40
_val$70229 = -32
_in$70230 = -44
_out$70231 = -36
_c$70243 = -56
_val$70244 = -48
_err$70245 = -52
_ctrl_add_input_tel PROC NEAR

; 27   : ){

	push	ebp
	mov	ebp, esp
	sub	esp, 116				; 00000074H

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

; 30   : 	DynBuffer *buf = NULL;

	mov	DWORD PTR _buf$[ebp], 0

; 31   : 	DynBuffer *name = NULL;

	mov	DWORD PTR _name$[ebp], 0

; 32   : 	unsigned long i, k;
; 33   : 	int b_multiple = ctrl->MULTIPLE[0] != 0 && strcmp("No", ctrl->MULTIPLE);

	mov	edx, DWORD PTR _ctrl$[ebp]
	mov	eax, DWORD PTR [edx+344]
	movsx	ecx, BYTE PTR [eax]
	test	ecx, ecx
	je	SHORT $L70317
	mov	edx, DWORD PTR _ctrl$[ebp]
	mov	eax, DWORD PTR [edx+344]
	push	eax
	push	OFFSET FLAT:$SG70218
	call	_strcmp
	add	esp, 8
	test	eax, eax
	je	SHORT $L70317
	mov	DWORD PTR -60+[ebp], 1
	jmp	SHORT $L70318
$L70317:
	mov	DWORD PTR -60+[ebp], 0
$L70318:
	mov	ecx, DWORD PTR -60+[ebp]
	mov	DWORD PTR _b_multiple$[ebp], ecx

; 34   : 
; 35   : 	/* Set default width */
; 36   : 	if(!ctrl->COLUMNS) ctrl->COLUMNS = 17;

	mov	edx, DWORD PTR _ctrl$[ebp]
	cmp	DWORD PTR [edx+380], 0
	jne	SHORT $L70219
	mov	eax, DWORD PTR _ctrl$[ebp]
	mov	DWORD PTR [eax+380], 17			; 00000011H
$L70219:

; 37   : 
; 38   : 	switch(form->step)
; 39   : 	{

	mov	ecx, DWORD PTR _form$[ebp]
	mov	edx, DWORD PTR [ecx+176]
	mov	DWORD PTR -64+[ebp], edx
	cmp	DWORD PTR -64+[ebp], 7
	ja	$L70305
	mov	eax, DWORD PTR -64+[ebp]
	jmp	DWORD PTR $L70345[eax*4]
$L70224:

; 40   : 	case CtrlRead:
; 41   : 		for(i = 0; i < ctrl->val.nbrows; i++)

	mov	DWORD PTR _i$[ebp], 0
	jmp	SHORT $L70225
$L70226:
	mov	ecx, DWORD PTR _i$[ebp]
	add	ecx, 1
	mov	DWORD PTR _i$[ebp], ecx
$L70225:
	mov	edx, DWORD PTR _ctrl$[ebp]
	mov	eax, DWORD PTR _i$[ebp]
	cmp	eax, DWORD PTR [edx+64]
	jae	$L70227

; 43   : 			DynTableCell *c = dyntab_cell(&ctrl->val, i, 0);

	push	0
	mov	ecx, DWORD PTR _i$[ebp]
	push	ecx
	mov	edx, DWORD PTR _ctrl$[ebp]
	add	edx, 64					; 00000040H
	push	edx
	call	_dyntab_cell
	add	esp, 12					; 0000000cH
	mov	DWORD PTR _c$70228[ebp], eax

; 44   : 			char *val = c->txt, *in = val, *out = val;

	mov	eax, DWORD PTR _c$70228[ebp]
	mov	ecx, DWORD PTR [eax]
	mov	DWORD PTR _val$70229[ebp], ecx
	mov	edx, DWORD PTR _val$70229[ebp]
	mov	DWORD PTR _in$70230[ebp], edx
	mov	eax, DWORD PTR _val$70229[ebp]
	mov	DWORD PTR _out$70231[ebp], eax

; 45   : 			if(!val || !c->len) continue;

	cmp	DWORD PTR _val$70229[ebp], 0
	je	SHORT $L70233
	mov	ecx, DWORD PTR _c$70228[ebp]
	cmp	DWORD PTR [ecx+4], 0
	jne	SHORT $L70232
$L70233:
	jmp	SHORT $L70226
$L70232:

; 46   : 
; 47   : 			/* Remove unwanted chars for telephone */
; 48   : 			while(*in)

	mov	edx, DWORD PTR _in$70230[ebp]
	movsx	eax, BYTE PTR [edx]
	test	eax, eax
	je	SHORT $L70236

; 50   : 				if(isdigit(*in) || (*in == '+' && in == val))

	cmp	DWORD PTR ___mb_cur_max, 1
	jle	SHORT $L70319
	push	4
	mov	ecx, DWORD PTR _in$70230[ebp]
	movsx	edx, BYTE PTR [ecx]
	push	edx
	call	__isctype
	add	esp, 8
	mov	DWORD PTR -68+[ebp], eax
	jmp	SHORT $L70320
$L70319:
	mov	eax, DWORD PTR _in$70230[ebp]
	movsx	ecx, BYTE PTR [eax]
	mov	edx, DWORD PTR __pctype
	xor	eax, eax
	mov	ax, WORD PTR [edx+ecx*2]
	and	eax, 4
	mov	DWORD PTR -68+[ebp], eax
$L70320:
	cmp	DWORD PTR -68+[ebp], 0
	jne	SHORT $L70238
	mov	ecx, DWORD PTR _in$70230[ebp]
	movsx	edx, BYTE PTR [ecx]
	cmp	edx, 43					; 0000002bH
	jne	SHORT $L70237
	mov	eax, DWORD PTR _in$70230[ebp]
	cmp	eax, DWORD PTR _val$70229[ebp]
	jne	SHORT $L70237
$L70238:

; 52   : 					*out = *in; out++;

	mov	ecx, DWORD PTR _out$70231[ebp]
	mov	edx, DWORD PTR _in$70230[ebp]
	mov	al, BYTE PTR [edx]
	mov	BYTE PTR [ecx], al
	mov	ecx, DWORD PTR _out$70231[ebp]
	add	ecx, 1
	mov	DWORD PTR _out$70231[ebp], ecx
$L70237:

; 54   : 				in++;

	mov	edx, DWORD PTR _in$70230[ebp]
	add	edx, 1
	mov	DWORD PTR _in$70230[ebp], edx

; 55   : 			}

	jmp	SHORT $L70232
$L70236:

; 56   : 			*out = 0;

	mov	eax, DWORD PTR _out$70231[ebp]
	mov	BYTE PTR [eax], 0

; 57   : 			c->len = out - val;

	mov	ecx, DWORD PTR _out$70231[ebp]
	sub	ecx, DWORD PTR _val$70229[ebp]
	mov	edx, DWORD PTR _c$70228[ebp]
	mov	DWORD PTR [edx+4], ecx

; 58   : 		}

	jmp	$L70226
$L70227:

; 59   : 		break;

	jmp	$eva_noerr$70307
$L70239:

; 60   : 
; 61   : 	case InputCheck:
; 62   : 		/* Check each value */
; 63   : 		for(i = 0; i < ctrl->val.nbrows; i++)

	mov	DWORD PTR _i$[ebp], 0
	jmp	SHORT $L70240
$L70241:
	mov	eax, DWORD PTR _i$[ebp]
	add	eax, 1
	mov	DWORD PTR _i$[ebp], eax
$L70240:
	mov	ecx, DWORD PTR _ctrl$[ebp]
	mov	edx, DWORD PTR _i$[ebp]
	cmp	edx, DWORD PTR [ecx+64]
	jae	$L70242

; 65   : 			DynTableCell *c = dyntab_cell(&ctrl->val, i, 0);

	push	0
	mov	eax, DWORD PTR _i$[ebp]
	push	eax
	mov	ecx, DWORD PTR _ctrl$[ebp]
	add	ecx, 64					; 00000040H
	push	ecx
	call	_dyntab_cell
	add	esp, 12					; 0000000cH
	mov	DWORD PTR _c$70243[ebp], eax

; 66   : 			char *val = c->txt, *err;

	mov	edx, DWORD PTR _c$70243[ebp]
	mov	eax, DWORD PTR [edx]
	mov	DWORD PTR _val$70244[ebp], eax

; 67   : 			if(!val || !c->len) continue;

	cmp	DWORD PTR _val$70244[ebp], 0
	je	SHORT $L70247
	mov	ecx, DWORD PTR _c$70243[ebp]
	cmp	DWORD PTR [ecx+4], 0
	jne	SHORT $L70246
$L70247:
	jmp	SHORT $L70241
$L70246:

; 68   : 
; 69   : 			/* Check telephone validity */
; 70   : 			err = !strchr("03+", *val) ?  "il doit commencer par un 0 ou un + pour les numéros internationnaux" :
; 71   : 				(*val == '+' && val[1] == '0') ? "+0 n'est pas un préfixe autorisé" :
; 72   : 				(*val == '3' && c->len != 4) ? "les numéros courts doivent avoir 4 chiffres" :
; 73   : 				(*val == '0' && c->len != 10) ? "les numéros français doivent avoir 10 chiffres" :
; 74   : 				(c->len > 14) ? "il doit comporter moins de 14 caractères" :
; 75   : 				NULL;

	mov	edx, DWORD PTR _val$70244[ebp]
	movsx	eax, BYTE PTR [edx]
	push	eax
	push	OFFSET FLAT:$SG70249
	call	_strchr
	add	esp, 8
	test	eax, eax
	jne	SHORT $L70327
	mov	DWORD PTR -72+[ebp], OFFSET FLAT:$SG70250
	jmp	$L70328
$L70327:
	mov	ecx, DWORD PTR _val$70244[ebp]
	movsx	edx, BYTE PTR [ecx]
	cmp	edx, 43					; 0000002bH
	jne	SHORT $L70321
	mov	eax, DWORD PTR _val$70244[ebp]
	movsx	ecx, BYTE PTR [eax+1]
	cmp	ecx, 48					; 00000030H
	jne	SHORT $L70321
	mov	DWORD PTR -76+[ebp], OFFSET FLAT:$SG70251
	jmp	SHORT $L70326
$L70321:
	mov	edx, DWORD PTR _val$70244[ebp]
	movsx	eax, BYTE PTR [edx]
	cmp	eax, 51					; 00000033H
	jne	SHORT $L70322
	mov	ecx, DWORD PTR _c$70243[ebp]
	cmp	DWORD PTR [ecx+4], 4
	je	SHORT $L70322
	mov	DWORD PTR -80+[ebp], OFFSET FLAT:$SG70252
	jmp	SHORT $L70325
$L70322:
	mov	edx, DWORD PTR _val$70244[ebp]
	movsx	eax, BYTE PTR [edx]
	cmp	eax, 48					; 00000030H
	jne	SHORT $L70323
	mov	ecx, DWORD PTR _c$70243[ebp]
	cmp	DWORD PTR [ecx+4], 10			; 0000000aH
	je	SHORT $L70323
	mov	DWORD PTR -84+[ebp], OFFSET FLAT:$SG70253
	jmp	SHORT $L70324
$L70323:
	mov	edx, DWORD PTR _c$70243[ebp]
	mov	eax, 14					; 0000000eH
	cmp	eax, DWORD PTR [edx+4]
	sbb	ecx, ecx
	and	ecx, OFFSET FLAT:$SG70254
	mov	DWORD PTR -84+[ebp], ecx
$L70324:
	mov	edx, DWORD PTR -84+[ebp]
	mov	DWORD PTR -80+[ebp], edx
$L70325:
	mov	eax, DWORD PTR -80+[ebp]
	mov	DWORD PTR -76+[ebp], eax
$L70326:
	mov	ecx, DWORD PTR -76+[ebp]
	mov	DWORD PTR -72+[ebp], ecx
$L70328:
	mov	edx, DWORD PTR -72+[ebp]
	mov	DWORD PTR _err$70245[ebp], edx

; 76   : 			if(err)

	cmp	DWORD PTR _err$70245[ebp], 0
	je	$L70270

; 78   : 				ctrl->error |= 2;

	mov	eax, DWORD PTR _ctrl$[ebp]
	mov	ecx, DWORD PTR [eax+212]
	or	ecx, 2
	mov	edx, DWORD PTR _ctrl$[ebp]
	mov	DWORD PTR [edx+212], ecx

; 79   : 				if(ctrl->errmsg) DYNBUF_ADD_STR(&ctrl->errmsg, "\n");

	mov	eax, DWORD PTR _ctrl$[ebp]
	cmp	DWORD PTR [eax+216], 0
	je	SHORT $L70258
	push	0
	push	0
	push	1
	push	OFFSET FLAT:$SG70259
	mov	ecx, DWORD PTR _ctrl$[ebp]
	add	ecx, 216				; 000000d8H
	push	ecx
	call	_dynbuf_add
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L70258
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29872], OFFSET FLAT:$SG70261
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 79		; 0000004fH
	jmp	$eva_err$70262
$L70258:

; 80   : 				DYNBUF_ADD3_CELL(&ctrl->errmsg, "Le numéro de téléphone [", &ctrl->val, i, 0, NO_CONV, "] n'est pas valide : ");

	push	21					; 00000015H
	push	OFFSET FLAT:$SG70265
	push	0
	push	0
	push	0
	mov	ecx, DWORD PTR _i$[ebp]
	push	ecx
	mov	edx, DWORD PTR _ctrl$[ebp]
	add	edx, 64					; 00000040H
	push	edx
	call	_dyntab_sz
	add	esp, 12					; 0000000cH
	push	eax
	push	0
	mov	eax, DWORD PTR _i$[ebp]
	push	eax
	mov	ecx, DWORD PTR _ctrl$[ebp]
	add	ecx, 64					; 00000040H
	push	ecx
	call	_dyntab_val
	add	esp, 12					; 0000000cH
	push	eax
	push	24					; 00000018H
	push	OFFSET FLAT:$SG70266
	mov	edx, DWORD PTR _ctrl$[ebp]
	add	edx, 216				; 000000d8H
	push	edx
	call	_dynbuf_add3
	add	esp, 36					; 00000024H
	test	eax, eax
	je	SHORT $L70264
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29872], OFFSET FLAT:$SG70268
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 80		; 00000050H
	jmp	$eva_err$70262
$L70264:

; 81   : 				DYNBUF_ADD(&ctrl->errmsg, err, 0, NO_CONV);

	push	0
	push	0
	push	0
	mov	edx, DWORD PTR _err$70245[ebp]
	push	edx
	mov	eax, DWORD PTR _ctrl$[ebp]
	add	eax, 216				; 000000d8H
	push	eax
	call	_dynbuf_add
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L70270
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29872], OFFSET FLAT:$SG70272
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 81		; 00000051H
	jmp	$eva_err$70262
$L70270:

; 83   : 		}

	jmp	$L70241
$L70242:

; 84   : 		break;

	jmp	$eva_noerr$70307
$L70273:

; 85   : 
; 86   : 	case HtmlEdit:
; 87   : 	case HtmlPrint:
; 88   : 	case HtmlView:
; 89   : 		/* Add HTML code for control label & position */
; 90   : 		if(ctrl_format_pos(cntxt, ctrl, 1)) STACK_ERROR;

	push	1
	mov	eax, DWORD PTR _ctrl$[ebp]
	push	eax
	mov	ecx, DWORD PTR _cntxt$[ebp]
	push	ecx
	call	_ctrl_format_pos
	add	esp, 12					; 0000000cH
	test	eax, eax
	je	SHORT $L70274
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 90		; 0000005aH
	jmp	$eva_err$70262
$L70274:

; 91   : 
; 92   : 		/* Handle empty value in view mode */
; 93   : 		if(form->step != HtmlEdit && !ctrl->val.nbrows && *ctrl->LABEL_NOSEL) DYNBUF_ADD(form->html, ctrl->LABEL_NOSEL, 0, TO_HTML);

	mov	eax, DWORD PTR _form$[ebp]
	cmp	DWORD PTR [eax+176], 4
	je	SHORT $L70276
	mov	ecx, DWORD PTR _ctrl$[ebp]
	cmp	DWORD PTR [ecx+64], 0
	jne	SHORT $L70276
	mov	edx, DWORD PTR _ctrl$[ebp]
	mov	eax, DWORD PTR [edx+348]
	movsx	ecx, BYTE PTR [eax]
	test	ecx, ecx
	je	SHORT $L70276
	push	1
	push	OFFSET FLAT:_plain_to_html
	push	0
	mov	edx, DWORD PTR _ctrl$[ebp]
	mov	eax, DWORD PTR [edx+348]
	push	eax
	mov	ecx, DWORD PTR _form$[ebp]
	mov	edx, DWORD PTR [ecx+232]
	push	edx
	call	_dynbuf_add
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L70276
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29872], OFFSET FLAT:$SG70278
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 93		; 0000005dH
	jmp	$eva_err$70262
$L70276:

; 94   : 
; 95   : 		/* Add HTML code for each value */
; 96   : 		k = ctrl->val.nbrows + ((form->step == HtmlEdit && b_multiple) ? 1 : 0);

	mov	edx, DWORD PTR _form$[ebp]
	cmp	DWORD PTR [edx+176], 4
	jne	SHORT $L70329
	cmp	DWORD PTR _b_multiple$[ebp], 0
	je	SHORT $L70329
	mov	DWORD PTR -88+[ebp], 1
	jmp	SHORT $L70330
$L70329:
	mov	DWORD PTR -88+[ebp], 0
$L70330:
	mov	eax, DWORD PTR _ctrl$[ebp]
	mov	ecx, DWORD PTR [eax+64]
	add	ecx, DWORD PTR -88+[ebp]
	mov	DWORD PTR _k$[ebp], ecx

; 97   : 		for(i = 0; !i || i < k; i++)

	mov	DWORD PTR _i$[ebp], 0
	jmp	SHORT $L70279
$L70280:
	mov	edx, DWORD PTR _i$[ebp]
	add	edx, 1
	mov	DWORD PTR _i$[ebp], edx
$L70279:
	cmp	DWORD PTR _i$[ebp], 0
	je	SHORT $L70282
	mov	eax, DWORD PTR _i$[ebp]
	cmp	eax, DWORD PTR _k$[ebp]
	jae	$L70281
$L70282:

; 99   : 			/* Separate multiple values with a line break */
; 100  : 			if(i) DYNBUF_ADD_STR(form->html, "<br>");

	cmp	DWORD PTR _i$[ebp], 0
	je	SHORT $L70285
	push	0
	push	0
	push	4
	push	OFFSET FLAT:$SG70286
	mov	ecx, DWORD PTR _form$[ebp]
	mov	edx, DWORD PTR [ecx+232]
	push	edx
	call	_dynbuf_add
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L70285
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29872], OFFSET FLAT:$SG70288
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 100		; 00000064H
	jmp	$eva_err$70262
$L70285:

; 101  : 
; 102  : 			/* Handle edit mode */
; 103  : 			if(form->step == HtmlEdit)

	mov	edx, DWORD PTR _form$[ebp]
	cmp	DWORD PTR [edx+176], 4
	jne	$L70289

; 105  : 				M_FREE(buf);

	mov	eax, DWORD PTR _buf$[ebp]
	push	eax
	call	_mem_free
	add	esp, 4
	mov	DWORD PTR _buf$[ebp], 0

; 106  : 				if(put_value_fmt(cntxt, &buf, DYNTAB_VAL_SZ(&ctrl->val, i, 0), "_EVA_TELEPHONE")) STACK_ERROR;

	push	OFFSET FLAT:$SG70291
	push	0
	mov	ecx, DWORD PTR _i$[ebp]
	push	ecx
	mov	edx, DWORD PTR _ctrl$[ebp]
	add	edx, 64					; 00000040H
	push	edx
	call	_dyntab_sz
	add	esp, 12					; 0000000cH
	push	eax
	push	0
	mov	eax, DWORD PTR _i$[ebp]
	push	eax
	mov	ecx, DWORD PTR _ctrl$[ebp]
	add	ecx, 64					; 00000040H
	push	ecx
	call	_dyntab_val
	add	esp, 12					; 0000000cH
	push	eax
	lea	edx, DWORD PTR _buf$[ebp]
	push	edx
	mov	eax, DWORD PTR _cntxt$[ebp]
	push	eax
	call	_put_value_fmt
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L70290
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 106		; 0000006aH
	jmp	$eva_err$70262
$L70290:

; 107  : 				CTRL_CGINAMEVAL(&name, i);

	push	0
	push	0
	push	0
	lea	edx, DWORD PTR _name$[ebp]
	push	edx
	push	1
	push	0
	mov	eax, DWORD PTR _i$[ebp]
	push	eax
	mov	ecx, DWORD PTR _ctrl$[ebp]
	add	ecx, 64					; 00000040H
	push	ecx
	call	_dyntab_cell
	add	esp, 12					; 0000000cH
	push	eax
	mov	edx, DWORD PTR _ctrl$[ebp]
	push	edx
	mov	eax, DWORD PTR _cntxt$[ebp]
	push	eax
	call	_ctrl_cgi_name
	add	esp, 32					; 00000020H
	test	eax, eax
	je	SHORT $L70293
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 107		; 0000006bH
	jmp	$eva_err$70262
$L70293:
	mov	edx, DWORD PTR _ctrl$[ebp]
	mov	DWORD PTR [edx+196], 1

; 108  : 				if(put_html_text_input(cntxt,
; 109  : 						DYNBUF_VAL_SZ(name),
; 110  : 						DYNBUF_VAL_SZ(buf),
; 111  : 						0, 0, 1, ctrl->COLUMNS,
; 112  : 						atoi(CTRL_ATTR_VAL(MAXLENGTH))) ||
; 113  : 					ctrl_put_hidden_old(cntxt, ctrl, i, name, DYNBUF_VAL_SZ(buf)))

	cmp	DWORD PTR _ctrl$[ebp], 0
	je	SHORT $L70331
	push	0
	push	-1
	push	OFFSET FLAT:$SG70299
	mov	eax, DWORD PTR _ctrl$[ebp]
	add	eax, 44					; 0000002cH
	push	eax
	call	_dyntab_field_val
	add	esp, 16					; 00000010H
	mov	DWORD PTR -92+[ebp], eax
	jmp	SHORT $L70332
$L70331:
	mov	DWORD PTR -92+[ebp], OFFSET FLAT:$SG70300
$L70332:
	cmp	DWORD PTR _buf$[ebp], 0
	je	SHORT $L70333
	mov	ecx, DWORD PTR _buf$[ebp]
	mov	edx, DWORD PTR [ecx+4]
	mov	DWORD PTR -96+[ebp], edx
	jmp	SHORT $L70334
$L70333:
	mov	DWORD PTR -96+[ebp], 0
$L70334:
	cmp	DWORD PTR _buf$[ebp], 0
	je	SHORT $L70335
	mov	eax, DWORD PTR _buf$[ebp]
	add	eax, 8
	mov	DWORD PTR -100+[ebp], eax
	jmp	SHORT $L70336
$L70335:
	mov	DWORD PTR -100+[ebp], 0
$L70336:
	cmp	DWORD PTR _name$[ebp], 0
	je	SHORT $L70337
	mov	ecx, DWORD PTR _name$[ebp]
	mov	edx, DWORD PTR [ecx+4]
	mov	DWORD PTR -104+[ebp], edx
	jmp	SHORT $L70338
$L70337:
	mov	DWORD PTR -104+[ebp], 0
$L70338:
	cmp	DWORD PTR _name$[ebp], 0
	je	SHORT $L70339
	mov	eax, DWORD PTR _name$[ebp]
	add	eax, 8
	mov	DWORD PTR -108+[ebp], eax
	jmp	SHORT $L70340
$L70339:
	mov	DWORD PTR -108+[ebp], 0
$L70340:
	mov	ecx, DWORD PTR -92+[ebp]
	push	ecx
	call	_atoi
	add	esp, 4
	push	eax
	mov	edx, DWORD PTR _ctrl$[ebp]
	mov	eax, DWORD PTR [edx+380]
	push	eax
	push	1
	push	0
	push	0
	mov	ecx, DWORD PTR -96+[ebp]
	push	ecx
	mov	edx, DWORD PTR -100+[ebp]
	push	edx
	mov	eax, DWORD PTR -104+[ebp]
	push	eax
	mov	ecx, DWORD PTR -108+[ebp]
	push	ecx
	mov	edx, DWORD PTR _cntxt$[ebp]
	push	edx
	call	_put_html_text_input
	add	esp, 40					; 00000028H
	test	eax, eax
	jne	SHORT $L70298
	cmp	DWORD PTR _buf$[ebp], 0
	je	SHORT $L70341
	mov	eax, DWORD PTR _buf$[ebp]
	mov	ecx, DWORD PTR [eax+4]
	mov	DWORD PTR -112+[ebp], ecx
	jmp	SHORT $L70342
$L70341:
	mov	DWORD PTR -112+[ebp], 0
$L70342:
	cmp	DWORD PTR _buf$[ebp], 0
	je	SHORT $L70343
	mov	edx, DWORD PTR _buf$[ebp]
	add	edx, 8
	mov	DWORD PTR -116+[ebp], edx
	jmp	SHORT $L70344
$L70343:
	mov	DWORD PTR -116+[ebp], 0
$L70344:
	mov	eax, DWORD PTR -112+[ebp]
	push	eax
	mov	ecx, DWORD PTR -116+[ebp]
	push	ecx
	mov	edx, DWORD PTR _name$[ebp]
	push	edx
	mov	eax, DWORD PTR _i$[ebp]
	push	eax
	mov	ecx, DWORD PTR _ctrl$[ebp]
	push	ecx
	mov	edx, DWORD PTR _cntxt$[ebp]
	push	edx
	call	_ctrl_put_hidden_old
	add	esp, 24					; 00000018H
	test	eax, eax
	je	SHORT $L70297
$L70298:

; 114  : 				STACK_ERROR;

	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 114		; 00000072H
	jmp	$eva_err$70262
$L70297:

; 116  : 			else

	jmp	SHORT $L70302
$L70289:

; 117  : 				/* Output formated value */
; 118  : 				if(put_value_fmt(cntxt, form->html, DYNTAB_VAL_SZ(&ctrl->val, i, 0), "_EVA_TELEPHONE")) STACK_ERROR;

	push	OFFSET FLAT:$SG70303
	push	0
	mov	ecx, DWORD PTR _i$[ebp]
	push	ecx
	mov	edx, DWORD PTR _ctrl$[ebp]
	add	edx, 64					; 00000040H
	push	edx
	call	_dyntab_sz
	add	esp, 12					; 0000000cH
	push	eax
	push	0
	mov	eax, DWORD PTR _i$[ebp]
	push	eax
	mov	ecx, DWORD PTR _ctrl$[ebp]
	add	ecx, 64					; 00000040H
	push	ecx
	call	_dyntab_val
	add	esp, 12					; 0000000cH
	push	eax
	mov	edx, DWORD PTR _form$[ebp]
	mov	eax, DWORD PTR [edx+232]
	push	eax
	mov	ecx, DWORD PTR _cntxt$[ebp]
	push	ecx
	call	_put_value_fmt
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L70302
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 118		; 00000076H
	jmp	SHORT $eva_err$70262
$L70302:

; 119  : 		}

	jmp	$L70280
$L70281:

; 120  : 
; 121  : 		/* Add HTML code for the control footer */
; 122  : 		if(ctrl_format_pos(cntxt, ctrl, 0)) STACK_ERROR;

	push	0
	mov	eax, DWORD PTR _ctrl$[ebp]
	push	eax
	mov	ecx, DWORD PTR _cntxt$[ebp]
	push	ecx
	call	_ctrl_format_pos
	add	esp, 12					; 0000000cH
	test	eax, eax
	je	SHORT $L70304
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 122		; 0000007aH
	jmp	SHORT $eva_err$70262
$L70304:

; 123  : 		break;

	jmp	SHORT $eva_noerr$70307
$L70305:

; 124  : 
; 125  : 	default:
; 126  : 		/* Handle as text control */
; 127  : 		if(ctrl_add_text(cntxt, i_ctrl)) STACK_ERROR;

	mov	eax, DWORD PTR _i_ctrl$[ebp]
	push	eax
	mov	ecx, DWORD PTR _cntxt$[ebp]
	push	ecx
	call	_ctrl_add_text
	add	esp, 8
	test	eax, eax
	je	SHORT $L70306
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 127		; 0000007fH
	jmp	SHORT $eva_err$70262
$L70306:
$eva_noerr$70307:

; 129  : 
; 130  : 	RETURN_OK_CLEANUP;

	push	0
	push	OFFSET FLAT:$SG70308
	push	OFFSET FLAT:$SG70309
	mov	eax, DWORD PTR _cntxt$[ebp]
	push	eax
	call	_err_clear
	add	esp, 16					; 00000010H
$eva_err$70262:
	mov	ecx, DWORD PTR _cntxt$[ebp]
	cmp	DWORD PTR [ecx+29872], 0
	je	SHORT $L70310
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	eax, DWORD PTR [edx+29900]
	push	eax
	push	OFFSET FLAT:$SG70311
	push	OFFSET FLAT:$SG70312
	mov	ecx, DWORD PTR _cntxt$[ebp]
	push	ecx
	call	_err_add_context
	add	esp, 16					; 00000010H
$L70310:
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

; 131  : }

	mov	esp, ebp
	pop	ebp
	ret	0
$L70345:
	DD	$L70224
	DD	$L70305
	DD	$L70239
	DD	$L70305
	DD	$L70273
	DD	$L70305
	DD	$L70273
	DD	$L70273
_ctrl_add_input_tel ENDP
_TEXT	ENDS
END
