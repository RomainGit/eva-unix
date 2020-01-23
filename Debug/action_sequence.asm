	TITLE	D:\Travail\ABI\EVA\V4.0\CGI\Brunix-2016\action_sequence.c
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
PUBLIC	_action_sequence_exec
EXTRN	_ctrl_call_act_handler:NEAR
EXTRN	_cgi_build_basename:NEAR
EXTRN	_form_set_homepage:NEAR
EXTRN	_form_load:NEAR
EXTRN	_mem_free:NEAR
EXTRN	_strtoul:NEAR
EXTRN	_dynbuf_add:NEAR
EXTRN	_dyntab_free:NEAR
EXTRN	_ctrl_add_new:NEAR
EXTRN	_dyntab_sz:NEAR
EXTRN	_dyntab_val:NEAR
EXTRN	_ctrl_primary_handler:NEAR
EXTRN	_err_add_context:NEAR
EXTRN	_err_clear:NEAR
EXTRN	_dyntab_cmp:NEAR
EXTRN	_dyntab_filter_field:NEAR
_DATA	SEGMENT
$SG70222 DB	'_EVA_CTRLTREE', 00H
	ORG $+2
$SG70224 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70246 DB	'_EVA_BUTTON', 00H
$SG70252 DB	'<br>*** Dialog stopped action sequence !<br>', 00H
	ORG $+3
$SG70254 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70255 DB	'D:\Travail\ABI\EVA\V4.0\CGI\Brunix-2016\action_sequence.'
	DB	'c', 00H
	ORG $+2
$SG70256 DB	'action_sequence_exec', 00H
	ORG $+3
$SG70258 DB	'D:\Travail\ABI\EVA\V4.0\CGI\Brunix-2016\action_sequence.'
	DB	'c', 00H
	ORG $+2
$SG70259 DB	'action_sequence_exec', 00H
_DATA	ENDS
_TEXT	SEGMENT
_cntxt$ = 8
_i_ctrl$ = 12
_form$ = -4
_ctrl$ = -68
_buf$ = -12
_seq$ = -52
_data$ = -32
_i$ = -56
_top$ = -64
_idform$ = -60
_idobj$ = -8
_i_btn$70231 = -72
_action_sequence_exec PROC NEAR

; 28   : ){

	push	ebp
	mov	ebp, esp
	sub	esp, 84					; 00000054H

; 29   : 	EVA_form *form = cntxt->form;

	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	ecx, DWORD PTR [eax+80]
	mov	DWORD PTR _form$[ebp], ecx

; 30   : 	EVA_ctrl *ctrl = form->ctrl + i_ctrl;

	mov	edx, DWORD PTR _i_ctrl$[ebp]
	imul	edx, 480				; 000001e0H
	mov	eax, DWORD PTR _form$[ebp]
	mov	ecx, DWORD PTR [eax]
	add	ecx, edx
	mov	DWORD PTR _ctrl$[ebp], ecx

; 31   : 	DynBuffer *buf = NULL;

	mov	DWORD PTR _buf$[ebp], 0

; 32   : 	DynTable seq = {0};

	mov	DWORD PTR _seq$[ebp], 0
	xor	edx, edx
	mov	DWORD PTR _seq$[ebp+4], edx
	mov	DWORD PTR _seq$[ebp+8], edx
	mov	DWORD PTR _seq$[ebp+12], edx
	mov	DWORD PTR _seq$[ebp+16], edx

; 33   : 	DynTable data = {0};

	mov	DWORD PTR _data$[ebp], 0
	xor	eax, eax
	mov	DWORD PTR _data$[ebp+4], eax
	mov	DWORD PTR _data$[ebp+8], eax
	mov	DWORD PTR _data$[ebp+12], eax
	mov	DWORD PTR _data$[ebp+16], eax

; 34   : 	unsigned long i;
; 35   : 	int top =
; 36   : 		!form || !dyntab_sz(&cntxt->alt_form, 0, 0) ||
; 37   : 		dyntab_cmp(&form->id_obj, 0, 0, &cntxt->alt_obj, 0, 0) ||
; 38   : 		dyntab_cmp(&form->id_form, 0, 0, &cntxt->alt_form, 0, 0);

	cmp	DWORD PTR _form$[ebp], 0
	je	SHORT $L70488
	push	0
	push	0
	mov	ecx, DWORD PTR _cntxt$[ebp]
	add	ecx, 40					; 00000028H
	push	ecx
	call	_dyntab_sz
	add	esp, 12					; 0000000cH
	test	eax, eax
	je	SHORT $L70488
	push	0
	push	0
	mov	edx, DWORD PTR _cntxt$[ebp]
	add	edx, 60					; 0000003cH
	push	edx
	push	0
	push	0
	mov	eax, DWORD PTR _form$[ebp]
	add	eax, 32					; 00000020H
	push	eax
	call	_dyntab_cmp
	add	esp, 24					; 00000018H
	test	eax, eax
	jne	SHORT $L70488
	push	0
	push	0
	mov	ecx, DWORD PTR _cntxt$[ebp]
	add	ecx, 40					; 00000028H
	push	ecx
	push	0
	push	0
	mov	edx, DWORD PTR _form$[ebp]
	add	edx, 12					; 0000000cH
	push	edx
	call	_dyntab_cmp
	add	esp, 24					; 00000018H
	test	eax, eax
	jne	SHORT $L70488
	mov	DWORD PTR -76+[ebp], 0
	jmp	SHORT $L70489
$L70488:
	mov	DWORD PTR -76+[ebp], 1
$L70489:
	mov	eax, DWORD PTR -76+[ebp]
	mov	DWORD PTR _top$[ebp], eax

; 39   : 	DynTable *idform = top ? &cntxt->id_form : &cntxt->alt_form;

	cmp	DWORD PTR _top$[ebp], 0
	je	SHORT $L70490
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR -80+[ebp], ecx
	jmp	SHORT $L70491
$L70490:
	mov	edx, DWORD PTR _cntxt$[ebp]
	add	edx, 40					; 00000028H
	mov	DWORD PTR -80+[ebp], edx
$L70491:
	mov	eax, DWORD PTR -80+[ebp]
	mov	DWORD PTR _idform$[ebp], eax

; 40   : 	DynTable *idobj = top ? &cntxt->id_obj : &cntxt->alt_obj;

	cmp	DWORD PTR _top$[ebp], 0
	je	SHORT $L70492
	mov	ecx, DWORD PTR _cntxt$[ebp]
	add	ecx, 20					; 00000014H
	mov	DWORD PTR -84+[ebp], ecx
	jmp	SHORT $L70493
$L70492:
	mov	edx, DWORD PTR _cntxt$[ebp]
	add	edx, 60					; 0000003cH
	mov	DWORD PTR -84+[ebp], edx
$L70493:
	mov	eax, DWORD PTR -84+[ebp]
	mov	DWORD PTR _idobj$[ebp], eax

; 41   : 
; 42   : 	/* Prepare actions list */
; 43   : 	DYNTAB_FIELD1(&seq, &ctrl->attr, CTRLTREE);

	lea	ecx, DWORD PTR _seq$[ebp]
	push	ecx
	call	_dyntab_free
	add	esp, 4
	push	0
	push	-1
	push	OFFSET FLAT:$SG70222
	mov	edx, DWORD PTR _ctrl$[ebp]
	add	edx, 44					; 0000002cH
	push	edx
	push	1
	lea	eax, DWORD PTR _seq$[ebp]
	push	eax
	call	_dyntab_filter_field
	add	esp, 24					; 00000018H
	test	eax, eax
	je	SHORT $L70221
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29872], OFFSET FLAT:$SG70224
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 43		; 0000002bH
	jmp	$eva_err$70225
$L70221:

; 44   : 	if(!seq.nbrows) RETURN_OK;

	cmp	DWORD PTR _seq$[ebp], 0
	jne	SHORT $L70226
	jmp	$eva_noerr$70227
$L70226:

; 45   : 
; 46   : 	/* Process each action */
; 47   : 	for(i = 0; i < seq.nbrows; i++)

	mov	DWORD PTR _i$[ebp], 0
	jmp	SHORT $L70228
$L70229:
	mov	eax, DWORD PTR _i$[ebp]
	add	eax, 1
	mov	DWORD PTR _i$[ebp], eax
$L70228:
	mov	ecx, DWORD PTR _i$[ebp]
	cmp	ecx, DWORD PTR _seq$[ebp]
	jae	$eva_noerr$70227

; 49   : 		unsigned long i_btn = 1;

	mov	DWORD PTR _i_btn$70231[ebp], 1

; 50   : 
; 51   : 		/* Switch to homepage if no form selected */
; 52   : 		if(!dyntab_sz(idform, 0, 0))

	push	0
	push	0
	mov	edx, DWORD PTR _idform$[ebp]
	push	edx
	call	_dyntab_sz
	add	esp, 12					; 0000000cH
	test	eax, eax
	jne	SHORT $L70232

; 54   : 			if(form_set_homepage(cntxt)) STACK_ERROR;

	mov	eax, DWORD PTR _cntxt$[ebp]
	push	eax
	call	_form_set_homepage
	add	esp, 4
	test	eax, eax
	je	SHORT $L70233
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 54		; 00000036H
	jmp	$eva_err$70225
$L70233:

; 55   : 			idform = &cntxt->id_form;

	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR _idform$[ebp], edx

; 56   : 			idobj = &cntxt->id_obj;

	mov	eax, DWORD PTR _cntxt$[ebp]
	add	eax, 20					; 00000014H
	mov	DWORD PTR _idobj$[ebp], eax
$L70232:

; 58   : 
; 59   : 		/* Load current form if applicable */
; 60   : 		if((!cntxt->form ||
; 61   : 			dyntab_cmp(&form->id_obj, 0, 0, idobj, 0, 0) ||
; 62   : 			dyntab_cmp(&form->id_form, 0, 0, idform, 0, 0)) &&
; 63   : 			form_load(cntxt, idform, idobj, 0))

	mov	ecx, DWORD PTR _cntxt$[ebp]
	cmp	DWORD PTR [ecx+80], 0
	je	SHORT $L70235
	push	0
	push	0
	mov	edx, DWORD PTR _idobj$[ebp]
	push	edx
	push	0
	push	0
	mov	eax, DWORD PTR _form$[ebp]
	add	eax, 32					; 00000020H
	push	eax
	call	_dyntab_cmp
	add	esp, 24					; 00000018H
	test	eax, eax
	jne	SHORT $L70235
	push	0
	push	0
	mov	ecx, DWORD PTR _idform$[ebp]
	push	ecx
	push	0
	push	0
	mov	edx, DWORD PTR _form$[ebp]
	add	edx, 12					; 0000000cH
	push	edx
	call	_dyntab_cmp
	add	esp, 24					; 00000018H
	test	eax, eax
	je	SHORT $L70234
$L70235:
	push	0
	mov	eax, DWORD PTR _idobj$[ebp]
	push	eax
	mov	ecx, DWORD PTR _idform$[ebp]
	push	ecx
	mov	edx, DWORD PTR _cntxt$[ebp]
	push	edx
	call	_form_load
	add	esp, 16					; 00000010H
	test	eax, eax
	je	SHORT $L70234

; 64   : 			STACK_ERROR;

	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 64		; 00000040H
	jmp	$eva_err$70225
$L70234:

; 65   : 		form = cntxt->form;

	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	edx, DWORD PTR [ecx+80]
	mov	DWORD PTR _form$[ebp], edx

; 66   : 
; 67   : 		/* Reload form if applicable */
; 68   : 		if(form->b_reload && form_load(cntxt, idform, idobj, 0)) STACK_ERROR;

	mov	eax, DWORD PTR _form$[ebp]
	cmp	DWORD PTR [eax+140], 0
	je	SHORT $L70236
	push	0
	mov	ecx, DWORD PTR _idobj$[ebp]
	push	ecx
	mov	edx, DWORD PTR _idform$[ebp]
	push	edx
	mov	eax, DWORD PTR _cntxt$[ebp]
	push	eax
	call	_form_load
	add	esp, 16					; 00000010H
	test	eax, eax
	je	SHORT $L70236
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 68		; 00000044H
	jmp	$eva_err$70225
$L70236:

; 69   : 		form = cntxt->form;

	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	eax, DWORD PTR [edx+80]
	mov	DWORD PTR _form$[ebp], eax
$L70238:

; 70   : 
; 71   : 		/* Check if button in form */
; 72   : 		while(i_btn < form->nb_ctrl && dyntab_cmp(&form->ctrl[i_btn].id, 0, 0, &seq, i, 0)) i_btn++;

	mov	ecx, DWORD PTR _form$[ebp]
	mov	edx, DWORD PTR _i_btn$70231[ebp]
	cmp	edx, DWORD PTR [ecx+4]
	jae	SHORT $L70239
	push	0
	mov	eax, DWORD PTR _i$[ebp]
	push	eax
	lea	ecx, DWORD PTR _seq$[ebp]
	push	ecx
	push	0
	push	0
	mov	edx, DWORD PTR _i_btn$70231[ebp]
	imul	edx, 480				; 000001e0H
	mov	eax, DWORD PTR _form$[ebp]
	mov	ecx, DWORD PTR [eax]
	add	ecx, edx
	push	ecx
	call	_dyntab_cmp
	add	esp, 24					; 00000018H
	test	eax, eax
	je	SHORT $L70239
	mov	edx, DWORD PTR _i_btn$70231[ebp]
	add	edx, 1
	mov	DWORD PTR _i_btn$70231[ebp], edx
	jmp	SHORT $L70238
$L70239:

; 73   : 
; 74   : 		/* Button not in form : read button in first available control */
; 75   : 		if(i_btn >= cntxt->form->nb_ctrl)

	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	ecx, DWORD PTR [eax+80]
	mov	edx, DWORD PTR _i_btn$70231[ebp]
	cmp	edx, DWORD PTR [ecx+4]
	jb	$L70245

; 77   : 			if(ctrl_add_new(cntxt, DYNTAB_TOULRC(&seq, i, 0), &i_btn)) STACK_ERROR;

	lea	eax, DWORD PTR _i_btn$70231[ebp]
	push	eax
	push	10					; 0000000aH
	push	0
	push	0
	mov	ecx, DWORD PTR _i$[ebp]
	push	ecx
	lea	edx, DWORD PTR _seq$[ebp]
	push	edx
	call	_dyntab_val
	add	esp, 12					; 0000000cH
	push	eax
	call	_strtoul
	add	esp, 12					; 0000000cH
	push	eax
	mov	eax, DWORD PTR _cntxt$[ebp]
	push	eax
	call	_ctrl_add_new
	add	esp, 12					; 0000000cH
	test	eax, eax
	je	SHORT $L70242
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 77		; 0000004dH
	jmp	$eva_err$70225
$L70242:

; 78   : 			if(cgi_build_basename(cntxt, &cntxt->form->ctrl[i_btn].cginame, i_btn, 'B')) STACK_ERROR;

	push	66					; 00000042H
	mov	edx, DWORD PTR _i_btn$70231[ebp]
	push	edx
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	ecx, DWORD PTR [eax+80]
	mov	edx, DWORD PTR _i_btn$70231[ebp]
	imul	edx, 480				; 000001e0H
	mov	eax, DWORD PTR [ecx]
	lea	ecx, DWORD PTR [eax+edx+40]
	push	ecx
	mov	edx, DWORD PTR _cntxt$[ebp]
	push	edx
	call	_cgi_build_basename
	add	esp, 16					; 00000010H
	test	eax, eax
	je	SHORT $L70243
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 78		; 0000004eH
	jmp	$eva_err$70225
$L70243:

; 79   : 			CTRL_PRI_HDLR(i_btn);

	cmp	DWORD PTR _i_btn$70231[ebp], 0
	je	SHORT $L70245
	mov	ecx, DWORD PTR _i_btn$70231[ebp]
	push	ecx
	mov	edx, DWORD PTR _cntxt$[ebp]
	push	edx
	call	_ctrl_primary_handler
	add	esp, 8
	test	eax, eax
	je	SHORT $L70245
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 79		; 0000004fH
	jmp	$eva_err$70225
$L70245:

; 81   : 
; 82   : 		/* Call action handler */
; 83   : 		form->ctrl[i_btn].CONTROL = "_EVA_BUTTON";

	mov	ecx, DWORD PTR _i_btn$70231[ebp]
	imul	ecx, 480				; 000001e0H
	mov	edx, DWORD PTR _form$[ebp]
	mov	eax, DWORD PTR [edx]
	mov	DWORD PTR [eax+ecx+272], OFFSET FLAT:$SG70246

; 84   : 		CTRL_ACT_HDLR(i_btn);

	mov	ecx, DWORD PTR _i_btn$70231[ebp]
	push	ecx
	mov	edx, DWORD PTR _cntxt$[ebp]
	push	edx
	call	_ctrl_call_act_handler
	add	esp, 8
	test	eax, eax
	je	SHORT $L70247
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 84		; 00000054H
	jmp	$eva_err$70225
$L70247:

; 85   : 		form = cntxt->form;

	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	edx, DWORD PTR [ecx+80]
	mov	DWORD PTR _form$[ebp], edx

; 86   : 
; 87   : 		/* Break loop if dialog mode */
; 88   : 		if(form && (form->nextstep == HtmlSaveDlg || form->html_top || form->html_tab))

	cmp	DWORD PTR _form$[ebp], 0
	je	SHORT $L70248
	mov	eax, DWORD PTR _form$[ebp]
	cmp	DWORD PTR [eax+172], 3
	je	SHORT $L70249
	mov	ecx, DWORD PTR _form$[ebp]
	cmp	DWORD PTR [ecx+216], 0
	jne	SHORT $L70249
	mov	edx, DWORD PTR _form$[ebp]
	cmp	DWORD PTR [edx+224], 0
	je	SHORT $L70248
$L70249:

; 90   : 			DYNBUF_ADD_STR(&cntxt->debug_html, "<br>*** Dialog stopped action sequence !<br>");

	push	0
	push	0
	push	44					; 0000002cH
	push	OFFSET FLAT:$SG70252
	mov	eax, DWORD PTR _cntxt$[ebp]
	add	eax, 29868				; 000074acH
	push	eax
	call	_dynbuf_add
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L70251
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29872], OFFSET FLAT:$SG70254
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 90		; 0000005aH
	jmp	SHORT $eva_err$70225
$L70251:

; 91   : 			DYNTAB_FREE(form->dlg_ctrl);

	mov	eax, DWORD PTR _form$[ebp]
	add	eax, 180				; 000000b4H
	push	eax
	call	_dyntab_free
	add	esp, 4

; 92   : 			break;

	jmp	SHORT $eva_noerr$70227
$L70248:

; 94   : 	}

	jmp	$L70229
$eva_noerr$70227:

; 95   : 	RETURN_OK_CLEANUP;

	push	0
	push	OFFSET FLAT:$SG70255
	push	OFFSET FLAT:$SG70256
	mov	ecx, DWORD PTR _cntxt$[ebp]
	push	ecx
	call	_err_clear
	add	esp, 16					; 00000010H
$eva_err$70225:
	mov	edx, DWORD PTR _cntxt$[ebp]
	cmp	DWORD PTR [edx+29872], 0
	je	SHORT $L70257
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	ecx, DWORD PTR [eax+29900]
	push	ecx
	push	OFFSET FLAT:$SG70258
	push	OFFSET FLAT:$SG70259
	mov	edx, DWORD PTR _cntxt$[ebp]
	push	edx
	call	_err_add_context
	add	esp, 16					; 00000010H
$L70257:
	mov	eax, DWORD PTR _buf$[ebp]
	push	eax
	call	_mem_free
	add	esp, 4
	mov	DWORD PTR _buf$[ebp], 0
	lea	ecx, DWORD PTR _seq$[ebp]
	push	ecx
	call	_dyntab_free
	add	esp, 4
	lea	edx, DWORD PTR _data$[ebp]
	push	edx
	call	_dyntab_free
	add	esp, 4
	mov	eax, DWORD PTR _cntxt$[ebp]
	xor	ecx, ecx
	cmp	DWORD PTR [eax+29872], 0
	setne	cl
	mov	eax, ecx

; 96   : }

	mov	esp, ebp
	pop	ebp
	ret	0
_action_sequence_exec ENDP
_TEXT	ENDS
PUBLIC	_action_sequence_loop
EXTRN	_put_html_page_header:NEAR
EXTRN	_ctrl_eval_valtyp:NEAR
EXTRN	__iob:BYTE
EXTRN	_fflush:NEAR
EXTRN	_printf:NEAR
EXTRN	_putc:NEAR
EXTRN	_puts:NEAR
EXTRN	_qry_listobj_field:NEAR
EXTRN	_dyntab_cell:NEAR
EXTRN	_dyntab_copy:NEAR
EXTRN	_strcmp:NEAR
EXTRN	_dyntab_field_val:NEAR
_BSS	SEGMENT
$SG70287 DB	01H DUP (?)
_BSS	ENDS
_DATA	SEGMENT
	ORG $+3
$SG70286 DB	'_EVA_PROGBAR_MINOBJ', 00H
$SG70290 DB	'_EVA_CTRLTREE', 00H
	ORG $+2
$SG70292 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70297 DB	'_EVA_FILTER', 00H
$SG70300 DB	'_EVA_FILTERS', 00H
	ORG $+3
$SG70302 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70305 DB	'No filter given : button ignored', 00H
	ORG $+3
$SG70309 DB	'_EVA_LISTOBJ', 00H
	ORG $+3
$SG70311 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70317 DB	'0%   10%   20%   30%   40%   50%   60%   70%   80%   90%'
	DB	'   100%', 0aH, '|-----|-----|-----|-----|-----|-----|-----|--'
	DB	'---|-----|-----|', 0aH, 00H
	ORG $+1
$SG70318 DB	'<hr><b>%s</b><br><pre>%s', 00H
	ORG $+3
$SG70329 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70331 DB	'_EVA_FORMSTAMP', 00H
	ORG $+1
$SG70348 DB	'_EVA_BUTTON', 00H
$SG70350 DB	'D:\Travail\ABI\EVA\V4.0\CGI\Brunix-2016\action_sequence.'
	DB	'c', 00H
	ORG $+2
$SG70351 DB	'action_sequence_loop', 00H
	ORG $+3
$SG70355 DB	'<hr>*** Dialog or error stopped action sequence !<br>', 00H
	ORG $+2
$SG70357 DB	'*** Save Dialog<br>', 00H
$SG70359 DB	'*** Form top dialog<br>%s', 00H
	ORG $+2
$SG70361 DB	'*** Form tab dialog<br>%s', 00H
	ORG $+2
$SG70363 DB	'*** Error<br>%s', 00H
$SG70366 DB	'*** Dialog or error stopped action sequence !', 00H
	ORG $+2
$SG70368 DB	'<br><hr><br><center><input type=image name=''B$#NOP'' sr'
	DB	'c=''../img/_eva_btn_gobackobj_fr.gif''></center><br>', 0aH, 00H
	ORG $+2
$SG70369 DB	'D:\Travail\ABI\EVA\V4.0\CGI\Brunix-2016\action_sequence.'
	DB	'c', 00H
	ORG $+2
$SG70370 DB	'action_sequence_loop', 00H
	ORG $+3
$SG70372 DB	'D:\Travail\ABI\EVA\V4.0\CGI\Brunix-2016\action_sequence.'
	DB	'c', 00H
	ORG $+2
$SG70373 DB	'action_sequence_loop', 00H
_DATA	ENDS
_TEXT	SEGMENT
_cntxt$ = 8
_i_ctrl$ = 12
_updobjtyp$ = 16
_updfield$ = 20
_form$ = -44
_ctrl$ = -128
_seq$ = -72
_listobj$ = -40
_updobj$ = -116
_id_obj$ = -92
_id_form$ = -20
_i$ = -120
_j$ = -124
_cnt$ = -52
_b_pbar$ = -48
_pbar_minobj$ = -96
_b_err$70322 = -132
_i_btn$70337 = -136
_action_sequence_loop PROC NEAR

; 115  : ){

	push	ebp
	mov	ebp, esp
	sub	esp, 144				; 00000090H

; 116  : 	EVA_form *form = cntxt->form;

	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	ecx, DWORD PTR [eax+80]
	mov	DWORD PTR _form$[ebp], ecx

; 117  : 	EVA_ctrl *ctrl = form->ctrl + i_ctrl;

	mov	edx, DWORD PTR _i_ctrl$[ebp]
	imul	edx, 480				; 000001e0H
	mov	eax, DWORD PTR _form$[ebp]
	mov	ecx, DWORD PTR [eax]
	add	ecx, edx
	mov	DWORD PTR _ctrl$[ebp], ecx

; 118  : 	DynTable seq = {0};

	mov	DWORD PTR _seq$[ebp], 0
	xor	edx, edx
	mov	DWORD PTR _seq$[ebp+4], edx
	mov	DWORD PTR _seq$[ebp+8], edx
	mov	DWORD PTR _seq$[ebp+12], edx
	mov	DWORD PTR _seq$[ebp+16], edx

; 119  : 	DynTable listobj = {0};

	mov	DWORD PTR _listobj$[ebp], 0
	xor	eax, eax
	mov	DWORD PTR _listobj$[ebp+4], eax
	mov	DWORD PTR _listobj$[ebp+8], eax
	mov	DWORD PTR _listobj$[ebp+12], eax
	mov	DWORD PTR _listobj$[ebp+16], eax

; 120  : 	DynTable updobj = {0};

	mov	DWORD PTR _updobj$[ebp], 0
	xor	ecx, ecx
	mov	DWORD PTR _updobj$[ebp+4], ecx
	mov	DWORD PTR _updobj$[ebp+8], ecx
	mov	DWORD PTR _updobj$[ebp+12], ecx
	mov	DWORD PTR _updobj$[ebp+16], ecx

; 121  : 	DynTable id_obj = {0};

	mov	DWORD PTR _id_obj$[ebp], 0
	xor	edx, edx
	mov	DWORD PTR _id_obj$[ebp+4], edx
	mov	DWORD PTR _id_obj$[ebp+8], edx
	mov	DWORD PTR _id_obj$[ebp+12], edx
	mov	DWORD PTR _id_obj$[ebp+16], edx

; 122  : 	DynTable id_form = {0};

	mov	DWORD PTR _id_form$[ebp], 0
	xor	eax, eax
	mov	DWORD PTR _id_form$[ebp+4], eax
	mov	DWORD PTR _id_form$[ebp+8], eax
	mov	DWORD PTR _id_form$[ebp+12], eax
	mov	DWORD PTR _id_form$[ebp+16], eax

; 123  : 	unsigned long i, j, cnt = 0, b_pbar;

	mov	DWORD PTR _cnt$[ebp], 0

; 124  : 	unsigned long pbar_minobj = strtoul(CTRL_ATTR_VAL(PROGBAR_MINOBJ), NULL, 10);

	cmp	DWORD PTR _ctrl$[ebp], 0
	je	SHORT $L70495
	push	0
	push	-1
	push	OFFSET FLAT:$SG70286
	mov	ecx, DWORD PTR _ctrl$[ebp]
	add	ecx, 44					; 0000002cH
	push	ecx
	call	_dyntab_field_val
	add	esp, 16					; 00000010H
	mov	DWORD PTR -140+[ebp], eax
	jmp	SHORT $L70496
$L70495:
	mov	DWORD PTR -140+[ebp], OFFSET FLAT:$SG70287
$L70496:
	push	10					; 0000000aH
	push	0
	mov	edx, DWORD PTR -140+[ebp]
	push	edx
	call	_strtoul
	add	esp, 12					; 0000000cH
	mov	DWORD PTR _pbar_minobj$[ebp], eax

; 125  : 
; 126  : 	/* Prepare actions list */
; 127  : 	DYNTAB_FIELD1(&seq, &ctrl->attr, CTRLTREE);

	lea	eax, DWORD PTR _seq$[ebp]
	push	eax
	call	_dyntab_free
	add	esp, 4
	push	0
	push	-1
	push	OFFSET FLAT:$SG70290
	mov	ecx, DWORD PTR _ctrl$[ebp]
	add	ecx, 44					; 0000002cH
	push	ecx
	push	1
	lea	edx, DWORD PTR _seq$[ebp]
	push	edx
	call	_dyntab_filter_field
	add	esp, 24					; 00000018H
	test	eax, eax
	je	SHORT $L70289
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29872], OFFSET FLAT:$SG70292
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 127		; 0000007fH
	jmp	$eva_err$70293
$L70289:

; 128  : 	if(!seq.nbrows) RETURN_OK;

	cmp	DWORD PTR _seq$[ebp], 0
	jne	SHORT $L70294
	jmp	$eva_noerr$70295
$L70294:

; 129  : 
; 130  : 	/* Prepare objects list */
; 131  : 	if(!strcmp(updobjtyp, "_EVA_FILTER"))

	push	OFFSET FLAT:$SG70297
	mov	edx, DWORD PTR _updobjtyp$[ebp]
	push	edx
	call	_strcmp
	add	esp, 8
	test	eax, eax
	jne	SHORT $L70296

; 133  : 		CTRL_ATTR(listobj, FILTERS);

	lea	eax, DWORD PTR _listobj$[ebp]
	push	eax
	call	_dyntab_free
	add	esp, 4
	push	0
	push	-1
	push	OFFSET FLAT:$SG70300
	mov	ecx, DWORD PTR _ctrl$[ebp]
	add	ecx, 44					; 0000002cH
	push	ecx
	push	0
	lea	edx, DWORD PTR _listobj$[ebp]
	push	edx
	call	_dyntab_filter_field
	add	esp, 24					; 00000018H
	test	eax, eax
	je	SHORT $L70299
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29872], OFFSET FLAT:$SG70302
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 133		; 00000085H
	jmp	$eva_err$70293
$L70299:

; 134  : 		if(!listobj.nbrows) RETURN_WARNING("No filter given : button ignored");

	cmp	DWORD PTR _listobj$[ebp], 0
	jne	SHORT $L70303
	push	0
	push	0
	push	32					; 00000020H
	push	OFFSET FLAT:$SG70305
	mov	edx, DWORD PTR _cntxt$[ebp]
	add	edx, 29864				; 000074a8H
	push	edx
	call	_dynbuf_add
	add	esp, 20					; 00000014H
	jmp	$eva_noerr$70295
$L70303:

; 136  : 	else CTRL_ATTR(listobj, LISTOBJ);

	jmp	SHORT $L70308
$L70296:
	lea	eax, DWORD PTR _listobj$[ebp]
	push	eax
	call	_dyntab_free
	add	esp, 4
	push	0
	push	-1
	push	OFFSET FLAT:$SG70309
	mov	ecx, DWORD PTR _ctrl$[ebp]
	add	ecx, 44					; 0000002cH
	push	ecx
	push	0
	lea	edx, DWORD PTR _listobj$[ebp]
	push	edx
	call	_dyntab_filter_field
	add	esp, 24					; 00000018H
	test	eax, eax
	je	SHORT $L70308
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29872], OFFSET FLAT:$SG70311
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 136		; 00000088H
	jmp	$eva_err$70293
$L70308:

; 137  : 	if(ctrl_eval_valtyp(cntxt, ctrl, &updobj, updobjtyp, &listobj, updfield)) STACK_ERROR;

	mov	edx, DWORD PTR _updfield$[ebp]
	push	edx
	lea	eax, DWORD PTR _listobj$[ebp]
	push	eax
	mov	ecx, DWORD PTR _updobjtyp$[ebp]
	push	ecx
	lea	edx, DWORD PTR _updobj$[ebp]
	push	edx
	mov	eax, DWORD PTR _ctrl$[ebp]
	push	eax
	mov	ecx, DWORD PTR _cntxt$[ebp]
	push	ecx
	call	_ctrl_eval_valtyp
	add	esp, 24					; 00000018H
	test	eax, eax
	je	SHORT $L70312
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 137		; 00000089H
	jmp	$eva_err$70293
$L70312:

; 138  : 	if(!updobj.nbrows) RETURN_OK;

	cmp	DWORD PTR _updobj$[ebp], 0
	jne	SHORT $L70313
	jmp	$eva_noerr$70295
$L70313:

; 139  : 
; 140  : 	/* Display progress bar if applicable */
; 141  : 	b_pbar = updobj.nbrows > pbar_minobj;

	mov	eax, DWORD PTR _updobj$[ebp]
	cmp	DWORD PTR _pbar_minobj$[ebp], eax
	sbb	ecx, ecx
	neg	ecx
	mov	DWORD PTR _b_pbar$[ebp], ecx

; 142  : 	if(b_pbar)

	cmp	DWORD PTR _b_pbar$[ebp], 0
	je	SHORT $L70314

; 144  : 		put_html_page_header(cntxt, NULL, ctrl->LABEL, NULL, 3);

	push	3
	push	0
	mov	edx, DWORD PTR _ctrl$[ebp]
	mov	eax, DWORD PTR [edx+284]
	push	eax
	push	0
	mov	ecx, DWORD PTR _cntxt$[ebp]
	push	ecx
	call	_put_html_page_header
	add	esp, 20					; 00000014H

; 145  : 		printf("<hr><b>%s</b><br><pre>%s", ctrl->LABEL, WAIT_TXTSCALE);

	push	OFFSET FLAT:$SG70317
	mov	edx, DWORD PTR _ctrl$[ebp]
	mov	eax, DWORD PTR [edx+284]
	push	eax
	push	OFFSET FLAT:$SG70318
	call	_printf
	add	esp, 12					; 0000000cH

; 146  : 		fflush(stdout);

	push	OFFSET FLAT:__iob+32
	call	_fflush
	add	esp, 4
$L70314:

; 148  : 
; 149  : 	/* Process each object */
; 150  : 	for(j = 0; j < updobj.nbrows; j++)

	mov	DWORD PTR _j$[ebp], 0
	jmp	SHORT $L70319
$L70320:
	mov	ecx, DWORD PTR _j$[ebp]
	add	ecx, 1
	mov	DWORD PTR _j$[ebp], ecx
$L70319:
	mov	edx, DWORD PTR _j$[ebp]
	cmp	edx, DWORD PTR _updobj$[ebp]
	jae	$L70321

; 152  : 		int b_err = 0;

	mov	DWORD PTR _b_err$70322[ebp], 0

; 153  : 
; 154  : 		/* Display progress bar */
; 155  : 		if(b_pbar)

	cmp	DWORD PTR _b_pbar$[ebp], 0
	je	SHORT $L70326
$L70325:

; 157  : 			while((j + 1) * 60 / updobj.nbrows >= cnt)

	mov	eax, DWORD PTR _j$[ebp]
	add	eax, 1
	imul	eax, 60					; 0000003cH
	xor	edx, edx
	div	DWORD PTR _updobj$[ebp]
	cmp	eax, DWORD PTR _cnt$[ebp]
	jb	SHORT $L70326

; 159  : 				putc('*', stdout);

	push	OFFSET FLAT:__iob+32
	push	42					; 0000002aH
	call	_putc
	add	esp, 8

; 160  : 				fflush(stdout);

	push	OFFSET FLAT:__iob+32
	call	_fflush
	add	esp, 4

; 161  : 				cnt++;

	mov	eax, DWORD PTR _cnt$[ebp]
	add	eax, 1
	mov	DWORD PTR _cnt$[ebp], eax

; 162  : 			}

	jmp	SHORT $L70325
$L70326:

; 164  : 
; 165  : 		/* Load object in base form */
; 166  : 		DYNTAB_ADD_CELL(&id_obj, 0, 0, &updobj, j, 0);

	push	1
	push	0
	mov	ecx, DWORD PTR _j$[ebp]
	push	ecx
	lea	edx, DWORD PTR _updobj$[ebp]
	push	edx
	call	_dyntab_cell
	add	esp, 12					; 0000000cH
	push	eax
	push	0
	push	0
	lea	eax, DWORD PTR _id_obj$[ebp]
	push	eax
	call	_dyntab_copy
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L70327
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29872], OFFSET FLAT:$SG70329
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 166		; 000000a6H
	jmp	$eva_err$70293
$L70327:

; 167  : 		if(qry_listobj_field(cntxt, &id_form, &id_obj, "_EVA_FORMSTAMP")) STACK_ERROR;

	push	OFFSET FLAT:$SG70331
	lea	eax, DWORD PTR _id_obj$[ebp]
	push	eax
	lea	ecx, DWORD PTR _id_form$[ebp]
	push	ecx
	mov	edx, DWORD PTR _cntxt$[ebp]
	push	edx
	call	_qry_listobj_field
	add	esp, 16					; 00000010H
	test	eax, eax
	je	SHORT $L70330
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 167		; 000000a7H
	jmp	$eva_err$70293
$L70330:

; 168  : 		if(id_form.nbrows > 1) id_form.nbrows = 1;

	cmp	DWORD PTR _id_form$[ebp], 1
	jbe	SHORT $L70332
	mov	DWORD PTR _id_form$[ebp], 1
$L70332:

; 169  : 		if(form_load(cntxt, &id_form, &id_obj, 0)) STACK_ERROR;

	push	0
	lea	ecx, DWORD PTR _id_obj$[ebp]
	push	ecx
	lea	edx, DWORD PTR _id_form$[ebp]
	push	edx
	mov	eax, DWORD PTR _cntxt$[ebp]
	push	eax
	call	_form_load
	add	esp, 16					; 00000010H
	test	eax, eax
	je	SHORT $L70333
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 169		; 000000a9H
	jmp	$eva_err$70293
$L70333:

; 170  : 		form = cntxt->form;

	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	eax, DWORD PTR [edx+80]
	mov	DWORD PTR _form$[ebp], eax

; 171  : 
; 172  : 		/* Process each action */
; 173  : 		for(i = 0; i < seq.nbrows; i++)

	mov	DWORD PTR _i$[ebp], 0
	jmp	SHORT $L70334
$L70335:
	mov	ecx, DWORD PTR _i$[ebp]
	add	ecx, 1
	mov	DWORD PTR _i$[ebp], ecx
$L70334:
	mov	edx, DWORD PTR _i$[ebp]
	cmp	edx, DWORD PTR _seq$[ebp]
	jae	$L70336

; 175  : 			unsigned long i_btn = 1;

	mov	DWORD PTR _i_btn$70337[ebp], 1

; 176  : 
; 177  : 			/* Reload form if applicable */
; 178  : 			if(form->b_reload && form_load(cntxt, &form->id_form, &form->id_obj, 0)) STACK_ERROR;

	mov	eax, DWORD PTR _form$[ebp]
	cmp	DWORD PTR [eax+140], 0
	je	SHORT $L70338
	push	0
	mov	ecx, DWORD PTR _form$[ebp]
	add	ecx, 32					; 00000020H
	push	ecx
	mov	edx, DWORD PTR _form$[ebp]
	add	edx, 12					; 0000000cH
	push	edx
	mov	eax, DWORD PTR _cntxt$[ebp]
	push	eax
	call	_form_load
	add	esp, 16					; 00000010H
	test	eax, eax
	je	SHORT $L70338
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 178		; 000000b2H
	jmp	$eva_err$70293
$L70338:

; 179  : 			form = cntxt->form;

	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	eax, DWORD PTR [edx+80]
	mov	DWORD PTR _form$[ebp], eax
$L70340:

; 180  : 
; 181  : 			/* Check if button in form */
; 182  : 			while(i_btn < form->nb_ctrl && dyntab_cmp(&form->ctrl[i_btn].id, 0, 0, &seq, i, 0)) i_btn++;

	mov	ecx, DWORD PTR _form$[ebp]
	mov	edx, DWORD PTR _i_btn$70337[ebp]
	cmp	edx, DWORD PTR [ecx+4]
	jae	SHORT $L70341
	push	0
	mov	eax, DWORD PTR _i$[ebp]
	push	eax
	lea	ecx, DWORD PTR _seq$[ebp]
	push	ecx
	push	0
	push	0
	mov	edx, DWORD PTR _i_btn$70337[ebp]
	imul	edx, 480				; 000001e0H
	mov	eax, DWORD PTR _form$[ebp]
	mov	ecx, DWORD PTR [eax]
	add	ecx, edx
	push	ecx
	call	_dyntab_cmp
	add	esp, 24					; 00000018H
	test	eax, eax
	je	SHORT $L70341
	mov	edx, DWORD PTR _i_btn$70337[ebp]
	add	edx, 1
	mov	DWORD PTR _i_btn$70337[ebp], edx
	jmp	SHORT $L70340
$L70341:

; 183  : 
; 184  : 			/* Button not in form : read button in first available control */
; 185  : 			if(i_btn >= cntxt->form->nb_ctrl)

	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	ecx, DWORD PTR [eax+80]
	mov	edx, DWORD PTR _i_btn$70337[ebp]
	cmp	edx, DWORD PTR [ecx+4]
	jb	$L70347

; 187  : 				if(ctrl_add_new(cntxt, DYNTAB_TOULRC(&seq, i, 0), &i_btn)) STACK_ERROR;

	lea	eax, DWORD PTR _i_btn$70337[ebp]
	push	eax
	push	10					; 0000000aH
	push	0
	push	0
	mov	ecx, DWORD PTR _i$[ebp]
	push	ecx
	lea	edx, DWORD PTR _seq$[ebp]
	push	edx
	call	_dyntab_val
	add	esp, 12					; 0000000cH
	push	eax
	call	_strtoul
	add	esp, 12					; 0000000cH
	push	eax
	mov	eax, DWORD PTR _cntxt$[ebp]
	push	eax
	call	_ctrl_add_new
	add	esp, 12					; 0000000cH
	test	eax, eax
	je	SHORT $L70344
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 187		; 000000bbH
	jmp	$eva_err$70293
$L70344:

; 188  : 				if(cgi_build_basename(cntxt, &cntxt->form->ctrl[i_btn].cginame, i_btn, 'B')) STACK_ERROR;

	push	66					; 00000042H
	mov	edx, DWORD PTR _i_btn$70337[ebp]
	push	edx
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	ecx, DWORD PTR [eax+80]
	mov	edx, DWORD PTR _i_btn$70337[ebp]
	imul	edx, 480				; 000001e0H
	mov	eax, DWORD PTR [ecx]
	lea	ecx, DWORD PTR [eax+edx+40]
	push	ecx
	mov	edx, DWORD PTR _cntxt$[ebp]
	push	edx
	call	_cgi_build_basename
	add	esp, 16					; 00000010H
	test	eax, eax
	je	SHORT $L70345
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 188		; 000000bcH
	jmp	$eva_err$70293
$L70345:

; 189  : 				CTRL_PRI_HDLR(i_btn);

	cmp	DWORD PTR _i_btn$70337[ebp], 0
	je	SHORT $L70347
	mov	ecx, DWORD PTR _i_btn$70337[ebp]
	push	ecx
	mov	edx, DWORD PTR _cntxt$[ebp]
	push	edx
	call	_ctrl_primary_handler
	add	esp, 8
	test	eax, eax
	je	SHORT $L70347
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 189		; 000000bdH
	jmp	$eva_err$70293
$L70347:

; 191  : 
; 192  : 			/* Call action handler for button */
; 193  : 			form->ctrl[i_btn].CONTROL = "_EVA_BUTTON";

	mov	ecx, DWORD PTR _i_btn$70337[ebp]
	imul	ecx, 480				; 000001e0H
	mov	edx, DWORD PTR _form$[ebp]
	mov	eax, DWORD PTR [edx]
	mov	DWORD PTR [eax+ecx+272], OFFSET FLAT:$SG70348

; 194  : 			if(ctrl_call_act_handler(cntxt, i_btn)) { b_err = 1; CLEAR_ERROR; }

	mov	ecx, DWORD PTR _i_btn$70337[ebp]
	push	ecx
	mov	edx, DWORD PTR _cntxt$[ebp]
	push	edx
	call	_ctrl_call_act_handler
	add	esp, 8
	test	eax, eax
	je	SHORT $L70349
	mov	DWORD PTR _b_err$70322[ebp], 1
	push	194					; 000000c2H
	push	OFFSET FLAT:$SG70350
	push	OFFSET FLAT:$SG70351
	mov	eax, DWORD PTR _cntxt$[ebp]
	push	eax
	call	_err_clear
	add	esp, 16					; 00000010H
$L70349:

; 195  : 			form = cntxt->form;

	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	edx, DWORD PTR [ecx+80]
	mov	DWORD PTR _form$[ebp], edx

; 196  : 			b_err |= form && (form->nextstep == HtmlSaveDlg || form->html_top || form->html_tab);

	cmp	DWORD PTR _form$[ebp], 0
	je	SHORT $L70498
	mov	eax, DWORD PTR _form$[ebp]
	cmp	DWORD PTR [eax+172], 3
	je	SHORT $L70497
	mov	ecx, DWORD PTR _form$[ebp]
	cmp	DWORD PTR [ecx+216], 0
	jne	SHORT $L70497
	mov	edx, DWORD PTR _form$[ebp]
	cmp	DWORD PTR [edx+224], 0
	je	SHORT $L70498
$L70497:
	mov	DWORD PTR -144+[ebp], 1
	jmp	SHORT $L70499
$L70498:
	mov	DWORD PTR -144+[ebp], 0
$L70499:
	mov	eax, DWORD PTR _b_err$70322[ebp]
	or	eax, DWORD PTR -144+[ebp]
	mov	DWORD PTR _b_err$70322[ebp], eax

; 197  : 
; 198  : 			/* Break loop on error */
; 199  : 			if(b_err) break;

	cmp	DWORD PTR _b_err$70322[ebp], 0
	je	SHORT $L70352
	jmp	SHORT $L70336
$L70352:

; 200  : 		}

	jmp	$L70335
$L70336:

; 201  : 
; 202  : 		/* Break loop & display message on error */
; 203  : 		if(b_err)

	cmp	DWORD PTR _b_err$70322[ebp], 0
	je	$L70353

; 205  : 			if(b_pbar)

	cmp	DWORD PTR _b_pbar$[ebp], 0
	je	$L70354

; 207  : 				puts("<hr>*** Dialog or error stopped action sequence !<br>");

	push	OFFSET FLAT:$SG70355
	call	_puts
	add	esp, 4

; 208  : 				if(form->nextstep == HtmlSaveDlg) puts("*** Save Dialog<br>");

	mov	ecx, DWORD PTR _form$[ebp]
	cmp	DWORD PTR [ecx+172], 3
	jne	SHORT $L70356
	push	OFFSET FLAT:$SG70357
	call	_puts
	add	esp, 4
$L70356:

; 209  : 				if(form->html_top) printf("*** Form top dialog<br>%s", form->html_top->data);

	mov	edx, DWORD PTR _form$[ebp]
	cmp	DWORD PTR [edx+216], 0
	je	SHORT $L70358
	mov	eax, DWORD PTR _form$[ebp]
	mov	ecx, DWORD PTR [eax+216]
	add	ecx, 8
	push	ecx
	push	OFFSET FLAT:$SG70359
	call	_printf
	add	esp, 8
$L70358:

; 210  : 				if(form->html_tab) printf("*** Form tab dialog<br>%s", form->html_tab->data);

	mov	edx, DWORD PTR _form$[ebp]
	cmp	DWORD PTR [edx+224], 0
	je	SHORT $L70360
	mov	eax, DWORD PTR _form$[ebp]
	mov	ecx, DWORD PTR [eax+224]
	add	ecx, 8
	push	ecx
	push	OFFSET FLAT:$SG70361
	call	_printf
	add	esp, 8
$L70360:

; 211  : 				if(cntxt->debug_html) printf("*** Error<br>%s", cntxt->debug_html->data);

	mov	edx, DWORD PTR _cntxt$[ebp]
	cmp	DWORD PTR [edx+29868], 0
	je	SHORT $L70362
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	ecx, DWORD PTR [eax+29868]
	add	ecx, 8
	push	ecx
	push	OFFSET FLAT:$SG70363
	call	_printf
	add	esp, 8
$L70362:

; 213  : 			else

	jmp	SHORT $L70364
$L70354:

; 214  : 				RETURN_WARNING("*** Dialog or error stopped action sequence !");

	push	0
	push	0
	push	45					; 0000002dH
	push	OFFSET FLAT:$SG70366
	mov	edx, DWORD PTR _cntxt$[ebp]
	add	edx, 29864				; 000074a8H
	push	edx
	call	_dynbuf_add
	add	esp, 20					; 00000014H
	jmp	SHORT $eva_noerr$70295
$L70364:

; 215  : 			break;

	jmp	SHORT $L70321
$L70353:

; 217  : 	}

	jmp	$L70320
$L70321:

; 218  : 
; 219  : 	/* End progress bar */
; 220  : 	if(b_pbar)

	cmp	DWORD PTR _b_pbar$[ebp], 0
	je	SHORT $eva_noerr$70295

; 222  : 		printf("<br><hr><br><center>"
; 223  : 				"<input type=image name='B$#NOP' src='../img/_eva_btn_gobackobj_fr.gif'></center><br>\n");

	push	OFFSET FLAT:$SG70368
	call	_printf
	add	esp, 4

; 224  : 		fflush(stdout);

	push	OFFSET FLAT:__iob+32
	call	_fflush
	add	esp, 4

; 225  : 		cntxt->b_terminate = 15;

	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29776], 15		; 0000000fH
$eva_noerr$70295:

; 227  : 
; 228  : 	RETURN_OK_CLEANUP;

	push	0
	push	OFFSET FLAT:$SG70369
	push	OFFSET FLAT:$SG70370
	mov	ecx, DWORD PTR _cntxt$[ebp]
	push	ecx
	call	_err_clear
	add	esp, 16					; 00000010H
$eva_err$70293:
	mov	edx, DWORD PTR _cntxt$[ebp]
	cmp	DWORD PTR [edx+29872], 0
	je	SHORT $L70371
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	ecx, DWORD PTR [eax+29900]
	push	ecx
	push	OFFSET FLAT:$SG70372
	push	OFFSET FLAT:$SG70373
	mov	edx, DWORD PTR _cntxt$[ebp]
	push	edx
	call	_err_add_context
	add	esp, 16					; 00000010H
$L70371:
	lea	eax, DWORD PTR _seq$[ebp]
	push	eax
	call	_dyntab_free
	add	esp, 4
	lea	ecx, DWORD PTR _listobj$[ebp]
	push	ecx
	call	_dyntab_free
	add	esp, 4
	lea	edx, DWORD PTR _updobj$[ebp]
	push	edx
	call	_dyntab_free
	add	esp, 4
	lea	eax, DWORD PTR _id_obj$[ebp]
	push	eax
	call	_dyntab_free
	add	esp, 4
	lea	ecx, DWORD PTR _id_form$[ebp]
	push	ecx
	call	_dyntab_free
	add	esp, 4
	mov	edx, DWORD PTR _cntxt$[ebp]
	xor	eax, eax
	cmp	DWORD PTR [edx+29872], 0
	setne	al

; 229  : }

	mov	esp, ebp
	pop	ebp
	ret	0
_action_sequence_loop ENDP
_TEXT	ENDS
PUBLIC	_taskplan_sequence
EXTRN	_cgi_init_call:NEAR
EXTRN	_asctime:NEAR
EXTRN	_localtime:NEAR
EXTRN	_time:NEAR
EXTRN	_form_free:NEAR
EXTRN	_mem_alloc:NEAR
EXTRN	_put_debug_msg:NEAR
_DATA	SEGMENT
	ORG $+3
$SG70394 DB	'_EVA_USER_TASKPLAN', 00H
	ORG $+1
$SG70396 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70401 DB	'DayTask', 00H
$SG70402 DB	'_EVA_ACTIONS_DAYTASK', 00H
	ORG $+3
$SG70403 DB	'_EVA_ACTIONS_HOURTASK', 00H
	ORG $+2
$SG70405 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70406 DB	'<html><head><title>%s - %s</title></head>', 0aH, '<body>'
	DB	0aH, 00H
	ORG $+2
$SG70407 DB	'<hr>Processing %s - %s<hr>', 0aH, 00H
$SG70415 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70419 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70424 DB	0aH, '<b>==> [%s]</b><hr>', 00H
	ORG $+3
$SG70426 DB	0aH, '<br><b>*** Erreur de traitement</b><br>', 0aH, 00H
	ORG $+2
$SG70427 DB	'D:\Travail\ABI\EVA\V4.0\CGI\Brunix-2016\action_sequence.'
	DB	'c', 00H
	ORG $+2
$SG70428 DB	'taskplan_sequence', 00H
	ORG $+2
$SG70430 DB	'%s<br>', 0aH, 00H
$SG70432 DB	'%s<br>', 0aH, 00H
$SG70434 DB	'%s<br>', 0aH, 00H
$SG70436 DB	'</body></html>', 0aH, 00H
$SG70437 DB	'D:\Travail\ABI\EVA\V4.0\CGI\Brunix-2016\action_sequence.'
	DB	'c', 00H
	ORG $+2
$SG70438 DB	'taskplan_sequence', 00H
	ORG $+2
$SG70440 DB	'D:\Travail\ABI\EVA\V4.0\CGI\Brunix-2016\action_sequence.'
	DB	'c', 00H
	ORG $+2
$SG70441 DB	'taskplan_sequence', 00H
_DATA	ENDS
_TEXT	SEGMENT
_cntxt$ = 8
_task$ = 12
_form$ = -4
_actions$ = -32
_html$ = -8
_i$ = -36
_j$ = -40
_t$ = -12
_size1$70411 = -44
_taskplan_sequence PROC NEAR

; 244  : ){

	push	ebp
	mov	ebp, esp
	sub	esp, 48					; 00000030H

; 245  : 	EVA_form *form = NULL;

	mov	DWORD PTR _form$[ebp], 0

; 246  : 	DynTable actions = {0};

	mov	DWORD PTR _actions$[ebp], 0
	xor	eax, eax
	mov	DWORD PTR _actions$[ebp+4], eax
	mov	DWORD PTR _actions$[ebp+8], eax
	mov	DWORD PTR _actions$[ebp+12], eax
	mov	DWORD PTR _actions$[ebp+16], eax

; 247  : 	DynBuffer *html = NULL;

	mov	DWORD PTR _html$[ebp], 0

; 248  : 	unsigned long i, j = 0;

	mov	DWORD PTR _j$[ebp], 0

; 249  : 	time_t t;
; 250  : 
; 251  : 	/* Initialize application */
; 252  : 	cntxt->b_task = 1;

	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29756], 1

; 253  : 	if(cgi_init_call(cntxt)) RETURN_OK;

	mov	edx, DWORD PTR _cntxt$[ebp]
	push	edx
	call	_cgi_init_call
	add	esp, 4
	test	eax, eax
	je	SHORT $L70390
	jmp	$eva_noerr$70391
$L70390:

; 254  : 
; 255  : 	/* Set scheduled actions user */
; 256  : 	DYNTAB_FIELD(&cntxt->id_user, &cntxt->cnf_data, USER_TASKPLAN);

	mov	eax, DWORD PTR _cntxt$[ebp]
	add	eax, 29408				; 000072e0H
	push	eax
	call	_dyntab_free
	add	esp, 4
	push	0
	push	-1
	push	OFFSET FLAT:$SG70394
	mov	ecx, DWORD PTR _cntxt$[ebp]
	add	ecx, 29360				; 000072b0H
	push	ecx
	push	0
	mov	edx, DWORD PTR _cntxt$[ebp]
	add	edx, 29408				; 000072e0H
	push	edx
	call	_dyntab_filter_field
	add	esp, 24					; 00000018H
	test	eax, eax
	je	SHORT $L70393
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29872], OFFSET FLAT:$SG70396
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 256		; 00000100H
	jmp	$eva_err$70397
$L70393:

; 257  : 	if(!cntxt->id_user.nbrows) RETURN_OK;

	mov	edx, DWORD PTR _cntxt$[ebp]
	cmp	DWORD PTR [edx+29408], 0
	jne	SHORT $L70398
	jmp	$eva_noerr$70391
$L70398:

; 258  : 
; 259  : 	/* Read actions to execute */
; 260  : 	if(dyntab_filter_field(&actions, 0, &cntxt->cnf_data, !strcmp(task, "DayTask") ? "_EVA_ACTIONS_DAYTASK" : "_EVA_ACTIONS_HOURTASK", ~0UL, NULL))

	push	OFFSET FLAT:$SG70401
	mov	eax, DWORD PTR _task$[ebp]
	push	eax
	call	_strcmp
	add	esp, 8
	test	eax, eax
	jne	SHORT $L70501
	mov	DWORD PTR -48+[ebp], OFFSET FLAT:$SG70402
	jmp	SHORT $L70502
$L70501:
	mov	DWORD PTR -48+[ebp], OFFSET FLAT:$SG70403
$L70502:
	push	0
	push	-1
	mov	ecx, DWORD PTR -48+[ebp]
	push	ecx
	mov	edx, DWORD PTR _cntxt$[ebp]
	add	edx, 29360				; 000072b0H
	push	edx
	push	0
	lea	eax, DWORD PTR _actions$[ebp]
	push	eax
	call	_dyntab_filter_field
	add	esp, 24					; 00000018H
	test	eax, eax
	je	SHORT $L70400

; 261  : 		RETURN_ERR_MEMORY;

	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29872], OFFSET FLAT:$SG70405
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 261		; 00000105H
	jmp	$eva_err$70397
$L70400:

; 262  : 
; 263  : 	/* Execute actions - handle stop on error */
; 264  : 	time(&t);

	lea	eax, DWORD PTR _t$[ebp]
	push	eax
	call	_time
	add	esp, 4

; 265  : 	printf("<html><head><title>%s - %s</title></head>\n<body>\n", task, asctime(localtime(&t)));

	lea	ecx, DWORD PTR _t$[ebp]
	push	ecx
	call	_localtime
	add	esp, 4
	push	eax
	call	_asctime
	add	esp, 4
	push	eax
	mov	edx, DWORD PTR _task$[ebp]
	push	edx
	push	OFFSET FLAT:$SG70406
	call	_printf
	add	esp, 12					; 0000000cH

; 266  : 	printf("<hr>Processing %s - %s<hr>\n", task, asctime(localtime(&t)));

	lea	eax, DWORD PTR _t$[ebp]
	push	eax
	call	_localtime
	add	esp, 4
	push	eax
	call	_asctime
	add	esp, 4
	push	eax
	mov	ecx, DWORD PTR _task$[ebp]
	push	ecx
	push	OFFSET FLAT:$SG70407
	call	_printf
	add	esp, 12					; 0000000cH

; 267  : 	for(i = 0; i < actions.nbrows; i++)

	mov	DWORD PTR _i$[ebp], 0
	jmp	SHORT $L70408
$L70409:
	mov	edx, DWORD PTR _i$[ebp]
	add	edx, 1
	mov	DWORD PTR _i$[ebp], edx
$L70408:
	mov	eax, DWORD PTR _i$[ebp]
	cmp	eax, DWORD PTR _actions$[ebp]
	jae	$L70410

; 269  : 		/* Set current form as home page */
; 270  : 		M_ALLOC(cntxt->form, sizeof(EVA_form));

	mov	DWORD PTR _size1$70411[ebp], 244	; 000000f4H
	mov	ecx, DWORD PTR _size1$70411[ebp]
	push	ecx
	call	_mem_alloc
	add	esp, 4
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+80], eax
	cmp	DWORD PTR _size1$70411[ebp], 0
	je	SHORT $L70413
	mov	eax, DWORD PTR _cntxt$[ebp]
	cmp	DWORD PTR [eax+80], 0
	jne	SHORT $L70413
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29872], OFFSET FLAT:$SG70415
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 270		; 0000010eH
	jmp	$eva_err$70397
$L70413:

; 271  : 		form = cntxt->form;

	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	ecx, DWORD PTR [eax+80]
	mov	DWORD PTR _form$[ebp], ecx

; 272  : 		DYNTAB_ADD_CELL(&form->id_form, 0, 0, &cntxt->homepage, 0, 0);

	push	1
	push	0
	push	0
	mov	edx, DWORD PTR _cntxt$[ebp]
	add	edx, 29548				; 0000736cH
	push	edx
	call	_dyntab_cell
	add	esp, 12					; 0000000cH
	push	eax
	push	0
	push	0
	mov	eax, DWORD PTR _form$[ebp]
	add	eax, 12					; 0000000cH
	push	eax
	call	_dyntab_copy
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L70417
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29872], OFFSET FLAT:$SG70419
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 272		; 00000110H
	jmp	$eva_err$70397
$L70417:

; 273  : 		j = 0;

	mov	DWORD PTR _j$[ebp], 0

; 274  : 		if(ctrl_add_new(cntxt, DYNTAB_TOULRC(&cntxt->homepage, 0, 0), &j)) STACK_ERROR;

	lea	eax, DWORD PTR _j$[ebp]
	push	eax
	push	10					; 0000000aH
	push	0
	push	0
	push	0
	mov	ecx, DWORD PTR _cntxt$[ebp]
	add	ecx, 29548				; 0000736cH
	push	ecx
	call	_dyntab_val
	add	esp, 12					; 0000000cH
	push	eax
	call	_strtoul
	add	esp, 12					; 0000000cH
	push	eax
	mov	edx, DWORD PTR _cntxt$[ebp]
	push	edx
	call	_ctrl_add_new
	add	esp, 12					; 0000000cH
	test	eax, eax
	je	SHORT $L70421
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 274		; 00000112H
	jmp	$eva_err$70397
$L70421:

; 275  : 
; 276  : 		/* Load action button in form & alloc space for extra controls */
; 277  : 		if(ctrl_add_new(cntxt, DYNTAB_TOULRC(&actions, i, 0), &j)) STACK_ERROR;

	lea	ecx, DWORD PTR _j$[ebp]
	push	ecx
	push	10					; 0000000aH
	push	0
	push	0
	mov	edx, DWORD PTR _i$[ebp]
	push	edx
	lea	eax, DWORD PTR _actions$[ebp]
	push	eax
	call	_dyntab_val
	add	esp, 12					; 0000000cH
	push	eax
	call	_strtoul
	add	esp, 12					; 0000000cH
	push	eax
	mov	ecx, DWORD PTR _cntxt$[ebp]
	push	ecx
	call	_ctrl_add_new
	add	esp, 12					; 0000000cH
	test	eax, eax
	je	SHORT $L70423
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 277		; 00000115H
	jmp	$eva_err$70397
$L70423:

; 278  : 
; 279  : 		/* Call action handler for button & handle error */
; 280  : 		printf("\n<b>==> [%s]</b><hr>", form->ctrl[j].LABEL);

	mov	eax, DWORD PTR _j$[ebp]
	imul	eax, 480				; 000001e0H
	mov	ecx, DWORD PTR _form$[ebp]
	mov	edx, DWORD PTR [ecx]
	mov	eax, DWORD PTR [edx+eax+284]
	push	eax
	push	OFFSET FLAT:$SG70424
	call	_printf
	add	esp, 8

; 281  : 		if(ctrl_call_act_handler(cntxt, j))

	mov	ecx, DWORD PTR _j$[ebp]
	push	ecx
	mov	edx, DWORD PTR _cntxt$[ebp]
	push	edx
	call	_ctrl_call_act_handler
	add	esp, 8
	test	eax, eax
	je	SHORT $L70425

; 283  : 			printf("\n<br><b>*** Erreur de traitement</b><br>\n");

	push	OFFSET FLAT:$SG70426
	call	_printf
	add	esp, 4

; 284  : 			CLEAR_ERROR;

	push	284					; 0000011cH
	push	OFFSET FLAT:$SG70427
	push	OFFSET FLAT:$SG70428
	mov	eax, DWORD PTR _cntxt$[ebp]
	push	eax
	call	_err_clear
	add	esp, 16					; 00000010H
$L70425:

; 286  : 
; 287  : 		/* Output action messages */
; 288  : 		if(form->html_top) printf("%s<br>\n", form->html_top->data);

	mov	ecx, DWORD PTR _form$[ebp]
	cmp	DWORD PTR [ecx+216], 0
	je	SHORT $L70429
	mov	edx, DWORD PTR _form$[ebp]
	mov	eax, DWORD PTR [edx+216]
	add	eax, 8
	push	eax
	push	OFFSET FLAT:$SG70430
	call	_printf
	add	esp, 8
$L70429:

; 289  : 		if(form->html_tab) printf("%s<br>\n", form->html_tab->data);

	mov	ecx, DWORD PTR _form$[ebp]
	cmp	DWORD PTR [ecx+224], 0
	je	SHORT $L70431
	mov	edx, DWORD PTR _form$[ebp]
	mov	eax, DWORD PTR [edx+224]
	add	eax, 8
	push	eax
	push	OFFSET FLAT:$SG70432
	call	_printf
	add	esp, 8
$L70431:

; 290  : 		if(form->html_err) printf("%s<br>\n", form->html_err->data);

	mov	ecx, DWORD PTR _form$[ebp]
	cmp	DWORD PTR [ecx+208], 0
	je	SHORT $L70433
	mov	edx, DWORD PTR _form$[ebp]
	mov	eax, DWORD PTR [edx+208]
	add	eax, 8
	push	eax
	push	OFFSET FLAT:$SG70434
	call	_printf
	add	esp, 8
$L70433:

; 291  : 		put_debug_msg(cntxt, NULL);

	push	0
	mov	ecx, DWORD PTR _cntxt$[ebp]
	push	ecx
	call	_put_debug_msg
	add	esp, 8

; 292  : 		form_free(cntxt);

	mov	edx, DWORD PTR _cntxt$[ebp]
	push	edx
	call	_form_free
	add	esp, 4

; 293  : 	}

	jmp	$L70409
$L70410:

; 294  : 	printf("</body></html>\n");

	push	OFFSET FLAT:$SG70436
	call	_printf
	add	esp, 4
$eva_noerr$70391:

; 295  : 	RETURN_OK_CLEANUP;

	push	0
	push	OFFSET FLAT:$SG70437
	push	OFFSET FLAT:$SG70438
	mov	eax, DWORD PTR _cntxt$[ebp]
	push	eax
	call	_err_clear
	add	esp, 16					; 00000010H
$eva_err$70397:
	mov	ecx, DWORD PTR _cntxt$[ebp]
	cmp	DWORD PTR [ecx+29872], 0
	je	SHORT $L70439
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	eax, DWORD PTR [edx+29900]
	push	eax
	push	OFFSET FLAT:$SG70440
	push	OFFSET FLAT:$SG70441
	mov	ecx, DWORD PTR _cntxt$[ebp]
	push	ecx
	call	_err_add_context
	add	esp, 16					; 00000010H
$L70439:
	mov	edx, DWORD PTR _cntxt$[ebp]
	push	edx
	call	_form_free
	add	esp, 4
	lea	eax, DWORD PTR _actions$[ebp]
	push	eax
	call	_dyntab_free
	add	esp, 4
	mov	ecx, DWORD PTR _html$[ebp]
	push	ecx
	call	_mem_free
	add	esp, 4
	mov	DWORD PTR _html$[ebp], 0
	mov	edx, DWORD PTR _cntxt$[ebp]
	xor	eax, eax
	cmp	DWORD PTR [edx+29872], 0
	setne	al

; 296  : }

	mov	esp, ebp
	pop	ebp
	ret	0
_taskplan_sequence ENDP
_TEXT	ENDS
PUBLIC	_action_sequence
EXTRN	_form_save_dialog:NEAR
_BSS	SEGMENT
	ALIGN	4

$SG70455 DB	01H DUP (?)
	ALIGN	4

$SG70458 DB	01H DUP (?)
_BSS	ENDS
_DATA	SEGMENT
	ORG $+2
$SG70454 DB	'_EVA_CONFIRM', 00H
	ORG $+3
$SG70457 DB	'_EVA_UPDATE', 00H
$SG70460 DB	'_EVA_CURRENTOBJ', 00H
$SG70462 DB	'_EVA_NOSAVE', 00H
$SG70470 DB	'_EVA_UPDATE_OBJFIELD', 00H
	ORG $+3
$SG70472 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70475 DB	'_EVA_CURRENTOBJ', 00H
$SG70479 DB	'D:\Travail\ABI\EVA\V4.0\CGI\Brunix-2016\action_sequence.'
	DB	'c', 00H
	ORG $+2
$SG70480 DB	'action_sequence', 00H
$SG70482 DB	'D:\Travail\ABI\EVA\V4.0\CGI\Brunix-2016\action_sequence.'
	DB	'c', 00H
	ORG $+2
$SG70483 DB	'action_sequence', 00H
_DATA	ENDS
_TEXT	SEGMENT
_cntxt$ = 8
_i_ctrl$ = 12
_form$ = -8
_ctrl$ = -36
_updfield$ = -28
_confirm$ = -32
_updobjtyp$ = -4
_b_done$70463 = -40
_action_sequence PROC NEAR

; 309  : ){

	push	ebp
	mov	ebp, esp
	sub	esp, 48					; 00000030H

; 310  : 	EVA_form *form = cntxt->form;

	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	ecx, DWORD PTR [eax+80]
	mov	DWORD PTR _form$[ebp], ecx

; 311  : 	EVA_ctrl *ctrl = form->ctrl + i_ctrl;

	mov	edx, DWORD PTR _i_ctrl$[ebp]
	imul	edx, 480				; 000001e0H
	mov	eax, DWORD PTR _form$[ebp]
	mov	ecx, DWORD PTR [eax]
	add	ecx, edx
	mov	DWORD PTR _ctrl$[ebp], ecx

; 312  : 	DynTable updfield = {0};

	mov	DWORD PTR _updfield$[ebp], 0
	xor	edx, edx
	mov	DWORD PTR _updfield$[ebp+4], edx
	mov	DWORD PTR _updfield$[ebp+8], edx
	mov	DWORD PTR _updfield$[ebp+12], edx
	mov	DWORD PTR _updfield$[ebp+16], edx

; 313  : 	char *confirm = CTRL_ATTR_VAL(CONFIRM);

	cmp	DWORD PTR _ctrl$[ebp], 0
	je	SHORT $L70504
	push	0
	push	-1
	push	OFFSET FLAT:$SG70454
	mov	eax, DWORD PTR _ctrl$[ebp]
	add	eax, 44					; 0000002cH
	push	eax
	call	_dyntab_field_val
	add	esp, 16					; 00000010H
	mov	DWORD PTR -44+[ebp], eax
	jmp	SHORT $L70505
$L70504:
	mov	DWORD PTR -44+[ebp], OFFSET FLAT:$SG70455
$L70505:
	mov	ecx, DWORD PTR -44+[ebp]
	mov	DWORD PTR _confirm$[ebp], ecx

; 314  : 	char *updobjtyp = CTRL_ATTR_VAL(UPDATE);

	cmp	DWORD PTR _ctrl$[ebp], 0
	je	SHORT $L70506
	push	0
	push	-1
	push	OFFSET FLAT:$SG70457
	mov	edx, DWORD PTR _ctrl$[ebp]
	add	edx, 44					; 0000002cH
	push	edx
	call	_dyntab_field_val
	add	esp, 16					; 00000010H
	mov	DWORD PTR -48+[ebp], eax
	jmp	SHORT $L70507
$L70506:
	mov	DWORD PTR -48+[ebp], OFFSET FLAT:$SG70458
$L70507:
	mov	eax, DWORD PTR -48+[ebp]
	mov	DWORD PTR _updobjtyp$[ebp], eax

; 315  : 	if(!*updobjtyp) updobjtyp = "_EVA_CURRENTOBJ";

	mov	ecx, DWORD PTR _updobjtyp$[ebp]
	movsx	edx, BYTE PTR [ecx]
	test	edx, edx
	jne	SHORT $L70459
	mov	DWORD PTR _updobjtyp$[ebp], OFFSET FLAT:$SG70460
$L70459:

; 316  : 
; 317  : 	/* Handle save before */
; 318  : 	if(*confirm && strcmp(confirm, "_EVA_NOSAVE"))

	mov	eax, DWORD PTR _confirm$[ebp]
	movsx	ecx, BYTE PTR [eax]
	test	ecx, ecx
	je	SHORT $L70466
	push	OFFSET FLAT:$SG70462
	mov	edx, DWORD PTR _confirm$[ebp]
	push	edx
	call	_strcmp
	add	esp, 8
	test	eax, eax
	je	SHORT $L70466

; 320  : 		int b_done = BUTN_SAVE_NEXT;

	mov	DWORD PTR _b_done$70463[ebp], 1

; 321  : 		if(form_save_dialog(cntxt, i_ctrl, confirm, BUTN_SAVE_NEXT, &b_done)) STACK_ERROR;

	lea	eax, DWORD PTR _b_done$70463[ebp]
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
	je	SHORT $L70464
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 321		; 00000141H
	jmp	$eva_err$70465
$L70464:

; 322  : 		if(b_done != BUTN_SAVE_NEXT) RETURN_OK;

	cmp	DWORD PTR _b_done$70463[ebp], 1
	je	SHORT $L70466
	jmp	$eva_noerr$70467
$L70466:

; 324  : 
; 325  : 	/* Handle objects loop */
; 326  : 	CTRL_ATTR(updfield, UPDATE_OBJFIELD);

	lea	edx, DWORD PTR _updfield$[ebp]
	push	edx
	call	_dyntab_free
	add	esp, 4
	push	0
	push	-1
	push	OFFSET FLAT:$SG70470
	mov	eax, DWORD PTR _ctrl$[ebp]
	add	eax, 44					; 0000002cH
	push	eax
	push	0
	lea	ecx, DWORD PTR _updfield$[ebp]
	push	ecx
	call	_dyntab_filter_field
	add	esp, 24					; 00000018H
	test	eax, eax
	je	SHORT $L70469
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29872], OFFSET FLAT:$SG70472
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 326		; 00000146H
	jmp	$eva_err$70465
$L70469:

; 327  : 	if(updfield.nbrows || strcmp(updobjtyp, "_EVA_CURRENTOBJ"))

	cmp	DWORD PTR _updfield$[ebp], 0
	jne	SHORT $L70474
	push	OFFSET FLAT:$SG70475
	mov	ecx, DWORD PTR _updobjtyp$[ebp]
	push	ecx
	call	_strcmp
	add	esp, 8
	test	eax, eax
	je	SHORT $L70473
$L70474:

; 329  : 		if(action_sequence_loop(cntxt, i_ctrl, updobjtyp, &updfield)) STACK_ERROR;

	lea	edx, DWORD PTR _updfield$[ebp]
	push	edx
	mov	eax, DWORD PTR _updobjtyp$[ebp]
	push	eax
	mov	ecx, DWORD PTR _i_ctrl$[ebp]
	push	ecx
	mov	edx, DWORD PTR _cntxt$[ebp]
	push	edx
	call	_action_sequence_loop
	add	esp, 16					; 00000010H
	test	eax, eax
	je	SHORT $L70476
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 329		; 00000149H
	jmp	SHORT $eva_err$70465
$L70476:

; 331  : 	else

	jmp	SHORT $L70478
$L70473:

; 333  : 		if(action_sequence_exec(cntxt, i_ctrl)) STACK_ERROR;

	mov	ecx, DWORD PTR _i_ctrl$[ebp]
	push	ecx
	mov	edx, DWORD PTR _cntxt$[ebp]
	push	edx
	call	_action_sequence_exec
	add	esp, 8
	test	eax, eax
	je	SHORT $L70478
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 333		; 0000014dH
	jmp	SHORT $eva_err$70465
$L70478:
$eva_noerr$70467:

; 335  : 	RETURN_OK_CLEANUP;

	push	0
	push	OFFSET FLAT:$SG70479
	push	OFFSET FLAT:$SG70480
	mov	ecx, DWORD PTR _cntxt$[ebp]
	push	ecx
	call	_err_clear
	add	esp, 16					; 00000010H
$eva_err$70465:
	mov	edx, DWORD PTR _cntxt$[ebp]
	cmp	DWORD PTR [edx+29872], 0
	je	SHORT $L70481
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	ecx, DWORD PTR [eax+29900]
	push	ecx
	push	OFFSET FLAT:$SG70482
	push	OFFSET FLAT:$SG70483
	mov	edx, DWORD PTR _cntxt$[ebp]
	push	edx
	call	_err_add_context
	add	esp, 16					; 00000010H
$L70481:
	lea	eax, DWORD PTR _updfield$[ebp]
	push	eax
	call	_dyntab_free
	add	esp, 4
	mov	ecx, DWORD PTR _cntxt$[ebp]
	xor	eax, eax
	cmp	DWORD PTR [ecx+29872], 0
	setne	al

; 336  : }

	mov	esp, ebp
	pop	ebp
	ret	0
_action_sequence ENDP
_TEXT	ENDS
END
