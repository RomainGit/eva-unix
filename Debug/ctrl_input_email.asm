	TITLE	D:\Travail\ABI\EVA\V4.0\CGI\Brunix-2016\ctrl_input_email.c
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
PUBLIC	_ctrl_add_input_email
EXTRN	__pctype:DWORD
EXTRN	__isctype:NEAR
EXTRN	_ctrl_add_text:NEAR
EXTRN	_setcase:NEAR
EXTRN	___mb_cur_max:DWORD
EXTRN	_mem_alloc:NEAR
EXTRN	_mem_free:NEAR
EXTRN	_plain_to_html:BYTE
EXTRN	_html_put_value_fmt:NEAR
EXTRN	_dynbuf_add:NEAR
EXTRN	_dynbuf_add3:NEAR
EXTRN	_dyntab_sz:NEAR
EXTRN	_dyntab_val:NEAR
EXTRN	_dyntab_cell:NEAR
EXTRN	_memcpy:NEAR
EXTRN	_ctrl_format_pos:NEAR
EXTRN	_strcmp:NEAR
EXTRN	_strchr:NEAR
EXTRN	_err_add_context:NEAR
EXTRN	_err_clear:NEAR
_DATA	SEGMENT
$SG70240 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70249 DB	'._-@', 00H
	ORG $+3
$SG70252 DB	' @ absent', 00H
	ORG $+2
$SG70253 DB	'pas de nom avant @', 00H
	ORG $+1
$SG70254 DB	'plusieurs @', 00H
$SG70255 DB	'. absent apr', 0e8H, 's @', 00H
	ORG $+3
$SG70256 DB	'pas de nom entre @ et .', 00H
$SG70257 DB	'pas de nom apr', 0e8H, 's .', 00H
	ORG $+1
$SG70262 DB	0aH, 00H
	ORG $+2
$SG70264 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70267 DB	'> n''est pas valide : ', 00H
	ORG $+2
$SG70268 DB	'L''adresse <', 00H
$SG70270 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70274 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70280 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70287 DB	'<br>', 00H
	ORG $+3
$SG70289 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70291 DB	'_EVA_EMAIL', 00H
	ORG $+1
$SG70292 DB	'D:\Travail\ABI\EVA\V4.0\CGI\Brunix-2016\ctrl_input_email'
	DB	'.c', 00H
	ORG $+1
$SG70293 DB	'ctrl_add_input_email', 00H
	ORG $+3
$SG70298 DB	'D:\Travail\ABI\EVA\V4.0\CGI\Brunix-2016\ctrl_input_email'
	DB	'.c', 00H
	ORG $+1
$SG70299 DB	'ctrl_add_input_email', 00H
	ORG $+3
$SG70301 DB	'D:\Travail\ABI\EVA\V4.0\CGI\Brunix-2016\ctrl_input_email'
	DB	'.c', 00H
	ORG $+1
$SG70302 DB	'ctrl_add_input_email', 00H
_DATA	ENDS
_TEXT	SEGMENT
_cntxt$ = 8
_i_ctrl$ = 12
_form$ = -4
_ctrl$ = -20
_i$ = -16
_tot_char$ = -8
_b_stripped$ = -12
_c$70222 = -36
_val$70223 = -24
_in$70224 = -44
_out$70225 = -32
_err$70226 = -28
_old$70227 = -56
_at$70228 = -52
_at2$70229 = -48
_dot$70231 = -40
_size$70235 = -60
_src$70236 = -64
_size1$70237 = -68
_ctrl_add_input_email PROC NEAR

; 26   : ){

	push	ebp
	mov	ebp, esp
	sub	esp, 104				; 00000068H

; 27   : 	EVA_form *form = cntxt->form;

	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	ecx, DWORD PTR [eax+80]
	mov	DWORD PTR _form$[ebp], ecx

; 28   : 	EVA_ctrl *ctrl = form->ctrl + i_ctrl;

	mov	edx, DWORD PTR _i_ctrl$[ebp]
	imul	edx, 480				; 000001e0H
	mov	eax, DWORD PTR _form$[ebp]
	mov	ecx, DWORD PTR [eax]
	add	ecx, edx
	mov	DWORD PTR _ctrl$[ebp], ecx

; 29   : 	unsigned long i;
; 30   : 	size_t tot_char = 0;

	mov	DWORD PTR _tot_char$[ebp], 0

; 31   : 	int b_stripped;
; 32   : 	
; 33   : 	switch(form->step)
; 34   : 	{

	mov	edx, DWORD PTR _form$[ebp]
	mov	eax, DWORD PTR [edx+176]
	mov	DWORD PTR -72+[ebp], eax
	cmp	DWORD PTR -72+[ebp], 2
	je	SHORT $L70218
	cmp	DWORD PTR -72+[ebp], 5
	jle	$L70295
	cmp	DWORD PTR -72+[ebp], 7
	jle	$L70275
	jmp	$L70295
$L70218:

; 35   : 	case InputCheck:
; 36   : 		/* Check each value */
; 37   : 		for(i = 0; i < ctrl->val.nbrows; i++)

	mov	DWORD PTR _i$[ebp], 0
	jmp	SHORT $L70219
$L70220:
	mov	ecx, DWORD PTR _i$[ebp]
	add	ecx, 1
	mov	DWORD PTR _i$[ebp], ecx
$L70219:
	mov	edx, DWORD PTR _ctrl$[ebp]
	mov	eax, DWORD PTR _i$[ebp]
	cmp	eax, DWORD PTR [edx+64]
	jae	$L70221

; 39   : 			DynTableCell *c = dyntab_cell(&ctrl->val, i, 0);

	push	0
	mov	ecx, DWORD PTR _i$[ebp]
	push	ecx
	mov	edx, DWORD PTR _ctrl$[ebp]
	add	edx, 64					; 00000040H
	push	edx
	call	_dyntab_cell
	add	esp, 12					; 0000000cH
	mov	DWORD PTR _c$70222[ebp], eax

; 40   : 			char *val = c->txt, *in = val, *out = val, *err, *old;

	mov	eax, DWORD PTR _c$70222[ebp]
	mov	ecx, DWORD PTR [eax]
	mov	DWORD PTR _val$70223[ebp], ecx
	mov	edx, DWORD PTR _val$70223[ebp]
	mov	DWORD PTR _in$70224[ebp], edx
	mov	eax, DWORD PTR _val$70223[ebp]
	mov	DWORD PTR _out$70225[ebp], eax

; 41   : 			char *at = strchr(val, '@');

	push	64					; 00000040H
	mov	ecx, DWORD PTR _val$70223[ebp]
	push	ecx
	call	_strchr
	add	esp, 8
	mov	DWORD PTR _at$70228[ebp], eax

; 42   : 			char *at2 = at ? strchr(at + 1, '@') : NULL;

	cmp	DWORD PTR _at$70228[ebp], 0
	je	SHORT $L70307
	push	64					; 00000040H
	mov	edx, DWORD PTR _at$70228[ebp]
	add	edx, 1
	push	edx
	call	_strchr
	add	esp, 8
	mov	DWORD PTR -76+[ebp], eax
	jmp	SHORT $L70308
$L70307:
	mov	DWORD PTR -76+[ebp], 0
$L70308:
	mov	eax, DWORD PTR -76+[ebp]
	mov	DWORD PTR _at2$70229[ebp], eax

; 43   : 			char *dot = at ? strchr(at, '.') : NULL;

	cmp	DWORD PTR _at$70228[ebp], 0
	je	SHORT $L70309
	push	46					; 0000002eH
	mov	ecx, DWORD PTR _at$70228[ebp]
	push	ecx
	call	_strchr
	add	esp, 8
	mov	DWORD PTR -80+[ebp], eax
	jmp	SHORT $L70310
$L70309:
	mov	DWORD PTR -80+[ebp], 0
$L70310:
	mov	edx, DWORD PTR -80+[ebp]
	mov	DWORD PTR _dot$70231[ebp], edx

; 44   : 			if(!val || !c->len) continue;

	cmp	DWORD PTR _val$70223[ebp], 0
	je	SHORT $L70234
	mov	eax, DWORD PTR _c$70222[ebp]
	cmp	DWORD PTR [eax+4], 0
	jne	SHORT $L70233
$L70234:
	jmp	$L70220
$L70233:

; 45   : 			M_STRDUP(old, c->txt, c->len);

	mov	ecx, DWORD PTR _c$70222[ebp]
	mov	edx, DWORD PTR [ecx+4]
	mov	DWORD PTR _size$70235[ebp], edx
	mov	eax, DWORD PTR _c$70222[ebp]
	mov	ecx, DWORD PTR [eax]
	mov	DWORD PTR _src$70236[ebp], ecx
	mov	edx, DWORD PTR _size$70235[ebp]
	add	edx, 1
	mov	DWORD PTR _size1$70237[ebp], edx
	mov	eax, DWORD PTR _size1$70237[ebp]
	push	eax
	call	_mem_alloc
	add	esp, 4
	mov	DWORD PTR _old$70227[ebp], eax
	cmp	DWORD PTR _size1$70237[ebp], 0
	je	SHORT $L70238
	cmp	DWORD PTR _old$70227[ebp], 0
	jne	SHORT $L70238
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29872], OFFSET FLAT:$SG70240
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 45		; 0000002dH
	jmp	$eva_err$70241
$L70238:
	cmp	DWORD PTR _src$70236[ebp], 0
	je	SHORT $L70243
	cmp	DWORD PTR _size$70235[ebp], 0
	je	SHORT $L70243
	mov	eax, DWORD PTR _size$70235[ebp]
	push	eax
	mov	ecx, DWORD PTR _src$70236[ebp]
	push	ecx
	mov	edx, DWORD PTR _old$70227[ebp]
	push	edx
	call	_memcpy
	add	esp, 12					; 0000000cH
$L70243:

; 46   : 
; 47   : 			/* Remove unwanted chars for email */
; 48   : 			setcase(4, val, 0);

	push	0
	mov	eax, DWORD PTR _val$70223[ebp]
	push	eax
	push	4
	call	_setcase
	add	esp, 12					; 0000000cH
$L70245:

; 49   : 			while(*in)

	mov	ecx, DWORD PTR _in$70224[ebp]
	movsx	edx, BYTE PTR [ecx]
	test	edx, edx
	je	SHORT $L70246

; 51   : 				if(isalnum(*in) || strchr("._-@", *in)) 

	cmp	DWORD PTR ___mb_cur_max, 1
	jle	SHORT $L70311
	push	263					; 00000107H
	mov	eax, DWORD PTR _in$70224[ebp]
	movsx	ecx, BYTE PTR [eax]
	push	ecx
	call	__isctype
	add	esp, 8
	mov	DWORD PTR -84+[ebp], eax
	jmp	SHORT $L70312
$L70311:
	mov	edx, DWORD PTR _in$70224[ebp]
	movsx	eax, BYTE PTR [edx]
	mov	ecx, DWORD PTR __pctype
	xor	edx, edx
	mov	dx, WORD PTR [ecx+eax*2]
	and	edx, 263				; 00000107H
	mov	DWORD PTR -84+[ebp], edx
$L70312:
	cmp	DWORD PTR -84+[ebp], 0
	jne	SHORT $L70248
	mov	eax, DWORD PTR _in$70224[ebp]
	movsx	ecx, BYTE PTR [eax]
	push	ecx
	push	OFFSET FLAT:$SG70249
	call	_strchr
	add	esp, 8
	test	eax, eax
	je	SHORT $L70247
$L70248:

; 53   : 					*out = *in; out++;

	mov	edx, DWORD PTR _out$70225[ebp]
	mov	eax, DWORD PTR _in$70224[ebp]
	mov	cl, BYTE PTR [eax]
	mov	BYTE PTR [edx], cl
	mov	edx, DWORD PTR _out$70225[ebp]
	add	edx, 1
	mov	DWORD PTR _out$70225[ebp], edx
$L70247:

; 55   : 				in++;

	mov	eax, DWORD PTR _in$70224[ebp]
	add	eax, 1
	mov	DWORD PTR _in$70224[ebp], eax

; 56   : 			}

	jmp	$L70245
$L70246:

; 57   : 			*out = 0;

	mov	ecx, DWORD PTR _out$70225[ebp]
	mov	BYTE PTR [ecx], 0

; 58   : 			c->len = out - val;

	mov	edx, DWORD PTR _out$70225[ebp]
	sub	edx, DWORD PTR _val$70223[ebp]
	mov	eax, DWORD PTR _c$70222[ebp]
	mov	DWORD PTR [eax+4], edx

; 59   : 
; 60   : 			/* Handle value modification */
; 61   : 			if(strcmp(old, c->txt))

	mov	ecx, DWORD PTR _c$70222[ebp]
	mov	edx, DWORD PTR [ecx]
	push	edx
	mov	eax, DWORD PTR _old$70227[ebp]
	push	eax
	call	_strcmp
	add	esp, 8
	test	eax, eax
	je	SHORT $L70250

; 63   : 				c->b_modified = 1;

	mov	ecx, DWORD PTR _c$70222[ebp]
	mov	BYTE PTR [ecx+13], 1

; 64   : 				ctrl->b_modified = 1;

	mov	edx, DWORD PTR _ctrl$[ebp]
	mov	DWORD PTR [edx+200], 1
$L70250:

; 66   : 			M_FREE(old);

	mov	eax, DWORD PTR _old$70227[ebp]
	push	eax
	call	_mem_free
	add	esp, 4
	mov	DWORD PTR _old$70227[ebp], 0

; 67   : 
; 68   : 			/* Check email validity */
; 69   : 			err = !at ?  " @ absent" :
; 70   : 				(at == val) ?  "pas de nom avant @" :
; 71   : 				at2 ?  "plusieurs @" :
; 72   : 				!dot ?  ". absent après @" :
; 73   : 				(dot - at < 2) ?  "pas de nom entre @ et ." :
; 74   : 				!dot[1] ?  "pas de nom après ." :
; 75   : 				NULL;

	cmp	DWORD PTR _at$70228[ebp], 0
	jne	SHORT $L70321
	mov	DWORD PTR -88+[ebp], OFFSET FLAT:$SG70252
	jmp	SHORT $L70322
$L70321:
	mov	ecx, DWORD PTR _at$70228[ebp]
	cmp	ecx, DWORD PTR _val$70223[ebp]
	jne	SHORT $L70319
	mov	DWORD PTR -92+[ebp], OFFSET FLAT:$SG70253
	jmp	SHORT $L70320
$L70319:
	cmp	DWORD PTR _at2$70229[ebp], 0
	je	SHORT $L70317
	mov	DWORD PTR -96+[ebp], OFFSET FLAT:$SG70254
	jmp	SHORT $L70318
$L70317:
	cmp	DWORD PTR _dot$70231[ebp], 0
	jne	SHORT $L70315
	mov	DWORD PTR -100+[ebp], OFFSET FLAT:$SG70255
	jmp	SHORT $L70316
$L70315:
	mov	edx, DWORD PTR _dot$70231[ebp]
	sub	edx, DWORD PTR _at$70228[ebp]
	cmp	edx, 2
	jge	SHORT $L70313
	mov	DWORD PTR -104+[ebp], OFFSET FLAT:$SG70256
	jmp	SHORT $L70314
$L70313:
	mov	eax, DWORD PTR _dot$70231[ebp]
	movsx	ecx, BYTE PTR [eax+1]
	neg	ecx
	sbb	ecx, ecx
	not	ecx
	and	ecx, OFFSET FLAT:$SG70257
	mov	DWORD PTR -104+[ebp], ecx
$L70314:
	mov	edx, DWORD PTR -104+[ebp]
	mov	DWORD PTR -100+[ebp], edx
$L70316:
	mov	eax, DWORD PTR -100+[ebp]
	mov	DWORD PTR -96+[ebp], eax
$L70318:
	mov	ecx, DWORD PTR -96+[ebp]
	mov	DWORD PTR -92+[ebp], ecx
$L70320:
	mov	edx, DWORD PTR -92+[ebp]
	mov	DWORD PTR -88+[ebp], edx
$L70322:
	mov	eax, DWORD PTR -88+[ebp]
	mov	DWORD PTR _err$70226[ebp], eax

; 76   : 			if(err)

	cmp	DWORD PTR _err$70226[ebp], 0
	je	$L70272

; 78   : 				ctrl->error |= 2;

	mov	ecx, DWORD PTR _ctrl$[ebp]
	mov	edx, DWORD PTR [ecx+212]
	or	edx, 2
	mov	eax, DWORD PTR _ctrl$[ebp]
	mov	DWORD PTR [eax+212], edx

; 79   : 				if(ctrl->errmsg) DYNBUF_ADD_STR(&ctrl->errmsg, "\n");

	mov	ecx, DWORD PTR _ctrl$[ebp]
	cmp	DWORD PTR [ecx+216], 0
	je	SHORT $L70261
	push	0
	push	0
	push	1
	push	OFFSET FLAT:$SG70262
	mov	edx, DWORD PTR _ctrl$[ebp]
	add	edx, 216				; 000000d8H
	push	edx
	call	_dynbuf_add
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L70261
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29872], OFFSET FLAT:$SG70264
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 79		; 0000004fH
	jmp	$eva_err$70241
$L70261:

; 80   : 				DYNBUF_ADD3_CELL(&ctrl->errmsg, "L'adresse <", &ctrl->val, i, 0, NO_CONV, "> n'est pas valide : ");

	push	21					; 00000015H
	push	OFFSET FLAT:$SG70267
	push	0
	push	0
	push	0
	mov	edx, DWORD PTR _i$[ebp]
	push	edx
	mov	eax, DWORD PTR _ctrl$[ebp]
	add	eax, 64					; 00000040H
	push	eax
	call	_dyntab_sz
	add	esp, 12					; 0000000cH
	push	eax
	push	0
	mov	ecx, DWORD PTR _i$[ebp]
	push	ecx
	mov	edx, DWORD PTR _ctrl$[ebp]
	add	edx, 64					; 00000040H
	push	edx
	call	_dyntab_val
	add	esp, 12					; 0000000cH
	push	eax
	push	11					; 0000000bH
	push	OFFSET FLAT:$SG70268
	mov	eax, DWORD PTR _ctrl$[ebp]
	add	eax, 216				; 000000d8H
	push	eax
	call	_dynbuf_add3
	add	esp, 36					; 00000024H
	test	eax, eax
	je	SHORT $L70266
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29872], OFFSET FLAT:$SG70270
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 80		; 00000050H
	jmp	$eva_err$70241
$L70266:

; 81   : 				DYNBUF_ADD(&ctrl->errmsg, err, 0, NO_CONV);

	push	0
	push	0
	push	0
	mov	eax, DWORD PTR _err$70226[ebp]
	push	eax
	mov	ecx, DWORD PTR _ctrl$[ebp]
	add	ecx, 216				; 000000d8H
	push	ecx
	call	_dynbuf_add
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L70272
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29872], OFFSET FLAT:$SG70274
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 81		; 00000051H
	jmp	$eva_err$70241
$L70272:

; 83   : 		}

	jmp	$L70220
$L70221:

; 84   : 		break;

	jmp	$eva_noerr$70297
$L70275:

; 85   : 
; 86   : 	case HtmlPrint:
; 87   : 	case HtmlView:
; 88   : 		/* Add HTML code for control label & position */
; 89   : 		if(ctrl_format_pos(cntxt, ctrl, 1)) STACK_ERROR;

	push	1
	mov	ecx, DWORD PTR _ctrl$[ebp]
	push	ecx
	mov	edx, DWORD PTR _cntxt$[ebp]
	push	edx
	call	_ctrl_format_pos
	add	esp, 12					; 0000000cH
	test	eax, eax
	je	SHORT $L70276
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 89		; 00000059H
	jmp	$eva_err$70241
$L70276:

; 90   : 
; 91   : 		/* Handle empty value */
; 92   : 		if(!ctrl->val.nbrows && *ctrl->LABEL_NOSEL) DYNBUF_ADD(form->html, ctrl->LABEL_NOSEL, 0, TO_HTML);

	mov	ecx, DWORD PTR _ctrl$[ebp]
	cmp	DWORD PTR [ecx+64], 0
	jne	SHORT $L70278
	mov	edx, DWORD PTR _ctrl$[ebp]
	mov	eax, DWORD PTR [edx+348]
	movsx	ecx, BYTE PTR [eax]
	test	ecx, ecx
	je	SHORT $L70278
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
	je	SHORT $L70278
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29872], OFFSET FLAT:$SG70280
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 92		; 0000005cH
	jmp	$eva_err$70241
$L70278:

; 93   : 
; 94   : 		/* Add HTML code for each value */
; 95   : 		for(i = 0; i < ctrl->val.nbrows; i++)

	mov	DWORD PTR _i$[ebp], 0
	jmp	SHORT $L70281
$L70282:
	mov	edx, DWORD PTR _i$[ebp]
	add	edx, 1
	mov	DWORD PTR _i$[ebp], edx
$L70281:
	mov	eax, DWORD PTR _ctrl$[ebp]
	mov	ecx, DWORD PTR _i$[ebp]
	cmp	ecx, DWORD PTR [eax+64]
	jae	$L70283

; 97   : 			/* Separate multiple values with a line break */
; 98   : 			if(i) DYNBUF_ADD_STR(form->html, "<br>");

	cmp	DWORD PTR _i$[ebp], 0
	je	SHORT $L70286
	push	0
	push	0
	push	4
	push	OFFSET FLAT:$SG70287
	mov	edx, DWORD PTR _form$[ebp]
	mov	eax, DWORD PTR [edx+232]
	push	eax
	call	_dynbuf_add
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L70286
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29872], OFFSET FLAT:$SG70289
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 98		; 00000062H
	jmp	$eva_err$70241
$L70286:

; 99   : 
; 100  : 			/* Add text control */
; 101  : 			if(html_put_value_fmt(cntxt, ctrl, &ctrl->val, i, "_EVA_EMAIL", 0, &tot_char, &b_stripped)) CLEAR_ERROR;

	lea	eax, DWORD PTR _b_stripped$[ebp]
	push	eax
	lea	ecx, DWORD PTR _tot_char$[ebp]
	push	ecx
	push	0
	push	OFFSET FLAT:$SG70291
	mov	edx, DWORD PTR _i$[ebp]
	push	edx
	mov	eax, DWORD PTR _ctrl$[ebp]
	add	eax, 64					; 00000040H
	push	eax
	mov	ecx, DWORD PTR _ctrl$[ebp]
	push	ecx
	mov	edx, DWORD PTR _cntxt$[ebp]
	push	edx
	call	_html_put_value_fmt
	add	esp, 32					; 00000020H
	test	eax, eax
	je	SHORT $L70290
	push	101					; 00000065H
	push	OFFSET FLAT:$SG70292
	push	OFFSET FLAT:$SG70293
	mov	eax, DWORD PTR _cntxt$[ebp]
	push	eax
	call	_err_clear
	add	esp, 16					; 00000010H
$L70290:

; 102  : 		}

	jmp	$L70282
$L70283:

; 103  : 
; 104  : 		/* Add HTML code for the control footer */
; 105  : 		if(ctrl_format_pos(cntxt, ctrl, 0)) STACK_ERROR;

	push	0
	mov	ecx, DWORD PTR _ctrl$[ebp]
	push	ecx
	mov	edx, DWORD PTR _cntxt$[ebp]
	push	edx
	call	_ctrl_format_pos
	add	esp, 12					; 0000000cH
	test	eax, eax
	je	SHORT $L70294
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 105		; 00000069H
	jmp	SHORT $eva_err$70241
$L70294:

; 106  : 		break;

	jmp	SHORT $eva_noerr$70297
$L70295:

; 107  : 
; 108  : 	default:
; 109  : 		/* Handle as text control */
; 110  : 		if(ctrl_add_text(cntxt, i_ctrl)) STACK_ERROR;

	mov	ecx, DWORD PTR _i_ctrl$[ebp]
	push	ecx
	mov	edx, DWORD PTR _cntxt$[ebp]
	push	edx
	call	_ctrl_add_text
	add	esp, 8
	test	eax, eax
	je	SHORT $L70296
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 110		; 0000006eH
	jmp	SHORT $eva_err$70241
$L70296:
$eva_noerr$70297:

; 112  : 
; 113  : 	RETURN_OK_CLEANUP;

	push	0
	push	OFFSET FLAT:$SG70298
	push	OFFSET FLAT:$SG70299
	mov	ecx, DWORD PTR _cntxt$[ebp]
	push	ecx
	call	_err_clear
	add	esp, 16					; 00000010H
$eva_err$70241:
	mov	edx, DWORD PTR _cntxt$[ebp]
	cmp	DWORD PTR [edx+29872], 0
	je	SHORT $L70300
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	ecx, DWORD PTR [eax+29900]
	push	ecx
	push	OFFSET FLAT:$SG70301
	push	OFFSET FLAT:$SG70302
	mov	edx, DWORD PTR _cntxt$[ebp]
	push	edx
	call	_err_add_context
	add	esp, 16					; 00000010H
$L70300:
	mov	eax, DWORD PTR _cntxt$[ebp]
	xor	ecx, ecx
	cmp	DWORD PTR [eax+29872], 0
	setne	cl
	mov	eax, ecx

; 114  : }

	mov	esp, ebp
	pop	ebp
	ret	0
_ctrl_add_input_email ENDP
_TEXT	ENDS
END
