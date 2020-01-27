	TITLE	D:\Travail\ABI\EVA\V4.0\CGI\Brunix-2016\form_mode_list.c
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
PUBLIC	_form_mode_list
EXTRN	_table_read_controls:NEAR
EXTRN	_table_process_controls:NEAR
EXTRN	_cgi_build_basename:NEAR
EXTRN	_table_put_html_obj_list:NEAR
EXTRN	_ctrl_read_values:NEAR
EXTRN	_form_free_ctrl:NEAR
EXTRN	_mem_free:NEAR
EXTRN	_dyntab_free:NEAR
EXTRN	_dyntab_cell:NEAR
EXTRN	_ctrl_set_attr_txt:NEAR
EXTRN	_ctrl_format_pos:NEAR
EXTRN	_err_add_context:NEAR
EXTRN	_err_clear:NEAR
_BSS	SEGMENT
$SG70221 DB	01H DUP (?)
	ALIGN	4

$SG70234 DB	01H DUP (?)
_BSS	ENDS
_DATA	SEGMENT
$SG70211 DB	'_EVA_FORMSEL', 00H
	ORG $+3
$SG70213 DB	'_EVA_SEARCHONLOAD', 00H
	ORG $+2
$SG70214 DB	'_EVA_TABLESEARCH', 00H
	ORG $+3
$SG70217 DB	'_EVA_FILTER_FORM', 00H
	ORG $+3
$SG70218 DB	'_EVA_FILTER_TYPE', 00H
	ORG $+3
$SG70222 DB	'_EVA_FILTER_FORM', 00H
	ORG $+3
$SG70224 DB	'_EVA_TOP', 00H
	ORG $+3
$SG70225 DB	'_EVA_ALTFORM', 00H
	ORG $+3
$SG70236 DB	'D:\Travail\ABI\EVA\V4.0\CGI\Brunix-2016\form_mode_list.c'
	DB	00H
	ORG $+3
$SG70237 DB	'form_mode_list', 00H
	ORG $+1
$SG70239 DB	'D:\Travail\ABI\EVA\V4.0\CGI\Brunix-2016\form_mode_list.c'
	DB	00H
	ORG $+3
$SG70240 DB	'form_mode_list', 00H
_DATA	ENDS
_TEXT	SEGMENT
_cntxt$ = 8
_form$ = -4
_ctrl$ = -12
_cginame$ = -8
_c$70219 = -16
_form_mode_list PROC NEAR

; 24   : ){

	push	ebp
	mov	ebp, esp
	sub	esp, 24					; 00000018H

; 25   : 	EVA_form *form = cntxt->form;

	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	ecx, DWORD PTR [eax+80]
	mov	DWORD PTR _form$[ebp], ecx

; 26   : 	EVA_ctrl *ctrl = form->ctrl;

	mov	edx, DWORD PTR _form$[ebp]
	mov	eax, DWORD PTR [edx]
	mov	DWORD PTR _ctrl$[ebp], eax

; 27   : 	DynBuffer *cginame = ctrl->cginame;

	mov	ecx, DWORD PTR _ctrl$[ebp]
	mov	edx, DWORD PTR [ecx+40]
	mov	DWORD PTR _cginame$[ebp], edx

; 28   : 
; 29   : 	/* Fake relation FORMSEL for form control */
; 30   : 	form_free_ctrl(cntxt, 1);

	push	1
	mov	eax, DWORD PTR _cntxt$[ebp]
	push	eax
	call	_form_free_ctrl
	add	esp, 8

; 31   : 	ctrl->cginame = NULL;

	mov	ecx, DWORD PTR _ctrl$[ebp]
	mov	DWORD PTR [ecx+40], 0

; 32   : 	ctrl->FIELD = "_EVA_FORMSEL";

	mov	edx, DWORD PTR _ctrl$[ebp]
	mov	DWORD PTR [edx+280], OFFSET FLAT:$SG70211

; 33   : 	CTRL_SETATTR_TXT("_EVA_SEARCHONLOAD", TABLESEARCH);

	push	17					; 00000011H
	push	OFFSET FLAT:$SG70213
	push	OFFSET FLAT:$SG70214
	mov	eax, DWORD PTR _ctrl$[ebp]
	push	eax
	mov	ecx, DWORD PTR _cntxt$[ebp]
	push	ecx
	call	_ctrl_set_attr_txt
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L70212
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 33		; 00000021H
	jmp	$eva_err$70215
$L70212:

; 34   : 	CTRL_SETATTR_TXT("_EVA_FILTER_FORM", FILTER_TYPE);

	push	16					; 00000010H
	push	OFFSET FLAT:$SG70217
	push	OFFSET FLAT:$SG70218
	mov	eax, DWORD PTR _ctrl$[ebp]
	push	eax
	mov	ecx, DWORD PTR _cntxt$[ebp]
	push	ecx
	call	_ctrl_set_attr_txt
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L70216
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 34		; 00000022H
	jmp	$eva_err$70215
$L70216:

; 35   : 	CTRL_SETATTR_CELL(&form->id_form, 0, 0, FILTER_FORM);

	push	0
	push	0
	mov	eax, DWORD PTR _form$[ebp]
	add	eax, 12					; 0000000cH
	push	eax
	call	_dyntab_cell
	add	esp, 12					; 0000000cH
	mov	DWORD PTR _c$70219[ebp], eax
	cmp	DWORD PTR _c$70219[ebp], 0
	je	SHORT $L70245
	mov	ecx, DWORD PTR _c$70219[ebp]
	mov	edx, DWORD PTR [ecx+4]
	mov	DWORD PTR -20+[ebp], edx
	jmp	SHORT $L70246
$L70245:
	mov	DWORD PTR -20+[ebp], 0
$L70246:
	cmp	DWORD PTR _c$70219[ebp], 0
	je	SHORT $L70247
	mov	eax, DWORD PTR _c$70219[ebp]
	mov	ecx, DWORD PTR [eax]
	mov	DWORD PTR -24+[ebp], ecx
	jmp	SHORT $L70248
$L70247:
	mov	DWORD PTR -24+[ebp], OFFSET FLAT:$SG70221
$L70248:
	mov	edx, DWORD PTR -20+[ebp]
	push	edx
	mov	eax, DWORD PTR -24+[ebp]
	push	eax
	push	OFFSET FLAT:$SG70222
	mov	ecx, DWORD PTR _ctrl$[ebp]
	push	ecx
	mov	edx, DWORD PTR _cntxt$[ebp]
	push	edx
	call	_ctrl_set_attr_txt
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L70220
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 35		; 00000023H
	jmp	$eva_err$70215
$L70220:

; 36   : 	CTRL_SETATTR_TXT("_EVA_TOP", ALTFORM);

	push	8
	push	OFFSET FLAT:$SG70224
	push	OFFSET FLAT:$SG70225
	mov	ecx, DWORD PTR _ctrl$[ebp]
	push	ecx
	mov	edx, DWORD PTR _cntxt$[ebp]
	push	edx
	call	_ctrl_set_attr_txt
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L70223
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 36		; 00000024H
	jmp	$eva_err$70215
$L70223:

; 37   : 	dyntab_free(&form->id_obj);

	mov	ecx, DWORD PTR _form$[ebp]
	add	ecx, 32					; 00000020H
	push	ecx
	call	_dyntab_free
	add	esp, 4

; 38   : 	if(cgi_build_basename(cntxt, &ctrl->cginame, 0, 'D')) STACK_ERROR;

	push	68					; 00000044H
	push	0
	mov	edx, DWORD PTR _ctrl$[ebp]
	add	edx, 40					; 00000028H
	push	edx
	mov	eax, DWORD PTR _cntxt$[ebp]
	push	eax
	call	_cgi_build_basename
	add	esp, 16					; 00000010H
	test	eax, eax
	je	SHORT $L70226
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 38		; 00000026H
	jmp	$eva_err$70215
$L70226:

; 39   : 	if(ctrl_read_values(cntxt, 0)) STACK_ERROR;

	push	0
	mov	edx, DWORD PTR _cntxt$[ebp]
	push	edx
	call	_ctrl_read_values
	add	esp, 8
	test	eax, eax
	je	SHORT $L70227
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 39		; 00000027H
	jmp	$eva_err$70215
$L70227:

; 40   : 
; 41   : 	/* Handle table buttons clics */
; 42   : 	if(table_read_controls(cntxt, 0, NULL) ||
; 43   : 		table_process_controls(cntxt, 0)) STACK_ERROR;

	push	0
	push	0
	mov	ecx, DWORD PTR _cntxt$[ebp]
	push	ecx
	call	_table_read_controls
	add	esp, 12					; 0000000cH
	test	eax, eax
	jne	SHORT $L70230
	push	0
	mov	edx, DWORD PTR _cntxt$[ebp]
	push	edx
	call	_table_process_controls
	add	esp, 8
	test	eax, eax
	je	SHORT $L70229
$L70230:
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 43		; 0000002bH
	jmp	$eva_err$70215
$L70229:

; 44   : 
; 45   : 	/* Output relation table */
; 46   : 	if(cntxt->form == form)

	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	edx, DWORD PTR [ecx+80]
	cmp	edx, DWORD PTR _form$[ebp]
	jne	$eva_noerr$70235

; 48   : 		form->step = HtmlEdit;

	mov	eax, DWORD PTR _form$[ebp]
	mov	DWORD PTR [eax+176], 4

; 49   : 		ctrl->b_modified = 1;

	mov	ecx, DWORD PTR _ctrl$[ebp]
	mov	DWORD PTR [ecx+200], 1

; 50   : 		if(ctrl_format_pos(cntxt, ctrl, 1) ||
; 51   : 			table_put_html_obj_list(cntxt, 0) ||
; 52   : 			ctrl_format_pos(cntxt, ctrl, 0))

	push	1
	mov	edx, DWORD PTR _ctrl$[ebp]
	push	edx
	mov	eax, DWORD PTR _cntxt$[ebp]
	push	eax
	call	_ctrl_format_pos
	add	esp, 12					; 0000000cH
	test	eax, eax
	jne	SHORT $L70233
	push	0
	mov	ecx, DWORD PTR _cntxt$[ebp]
	push	ecx
	call	_table_put_html_obj_list
	add	esp, 8
	test	eax, eax
	jne	SHORT $L70233
	push	0
	mov	edx, DWORD PTR _ctrl$[ebp]
	push	edx
	mov	eax, DWORD PTR _cntxt$[ebp]
	push	eax
	call	_ctrl_format_pos
	add	esp, 12					; 0000000cH
	test	eax, eax
	je	SHORT $L70232
$L70233:

; 53   : 			STACK_ERROR;

	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 53		; 00000035H
	jmp	SHORT $eva_err$70215
$L70232:

; 54   : 		M_FREE(ctrl->cginame);

	mov	edx, DWORD PTR _ctrl$[ebp]
	mov	eax, DWORD PTR [edx+40]
	push	eax
	call	_mem_free
	add	esp, 4
	mov	ecx, DWORD PTR _ctrl$[ebp]
	mov	DWORD PTR [ecx+40], 0

; 55   : 		ctrl->cginame = cginame;

	mov	edx, DWORD PTR _ctrl$[ebp]
	mov	eax, DWORD PTR _cginame$[ebp]
	mov	DWORD PTR [edx+40], eax

; 56   : 		ctrl->FIELD = "";

	mov	ecx, DWORD PTR _ctrl$[ebp]
	mov	DWORD PTR [ecx+280], OFFSET FLAT:$SG70234
$eva_noerr$70235:

; 58   : 
; 59   : 	RETURN_OK_CLEANUP;

	push	0
	push	OFFSET FLAT:$SG70236
	push	OFFSET FLAT:$SG70237
	mov	edx, DWORD PTR _cntxt$[ebp]
	push	edx
	call	_err_clear
	add	esp, 16					; 00000010H
$eva_err$70215:
	mov	eax, DWORD PTR _cntxt$[ebp]
	cmp	DWORD PTR [eax+29872], 0
	je	SHORT $L70238
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	edx, DWORD PTR [ecx+29900]
	push	edx
	push	OFFSET FLAT:$SG70239
	push	OFFSET FLAT:$SG70240
	mov	eax, DWORD PTR _cntxt$[ebp]
	push	eax
	call	_err_add_context
	add	esp, 16					; 00000010H
$L70238:
	mov	ecx, DWORD PTR _cntxt$[ebp]
	xor	eax, eax
	cmp	DWORD PTR [ecx+29872], 0
	setne	al

; 60   : }

	mov	esp, ebp
	pop	ebp
	ret	0
_form_mode_list ENDP
_TEXT	ENDS
END
