	TITLE	D:\Travail\ABI\EVA\V4.0\CGI\Brunix-2016\ctrl_output_list.c
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
PUBLIC	_ctrl_add_output_list_simple
EXTRN	_table_read_controls:NEAR
EXTRN	_table_process_controls:NEAR
EXTRN	_table_put_html_obj_list:NEAR
EXTRN	_ctrl_format_pos:NEAR
EXTRN	_err_add_context:NEAR
EXTRN	_err_clear:NEAR
_DATA	SEGMENT
$SG70226 DB	'D:\Travail\ABI\EVA\V4.0\CGI\Brunix-2016\ctrl_output_list'
	DB	'.c', 00H
	ORG $+1
$SG70227 DB	'ctrl_add_output_list_simple', 00H
$SG70229 DB	'D:\Travail\ABI\EVA\V4.0\CGI\Brunix-2016\ctrl_output_list'
	DB	'.c', 00H
	ORG $+1
$SG70230 DB	'ctrl_add_output_list_simple', 00H
_DATA	ENDS
_TEXT	SEGMENT
_cntxt$ = 8
_i_ctrl$ = 12
_form$ = -4
_ctrl$ = -8
_ctrl_add_output_list_simple PROC NEAR

; 25   : ){

	push	ebp
	mov	ebp, esp
	sub	esp, 12					; 0000000cH

; 26   : 	EVA_form *form = cntxt->form;

	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	ecx, DWORD PTR [eax+80]
	mov	DWORD PTR _form$[ebp], ecx

; 27   : 	EVA_ctrl *ctrl = form->ctrl + i_ctrl;

	mov	edx, DWORD PTR _i_ctrl$[ebp]
	imul	edx, 480				; 000001e0H
	mov	eax, DWORD PTR _form$[ebp]
	mov	ecx, DWORD PTR [eax]
	add	ecx, edx
	mov	DWORD PTR _ctrl$[ebp], ecx

; 28   : 
; 29   : 	switch(form->step)
; 30   : 	{

	mov	edx, DWORD PTR _form$[ebp]
	mov	eax, DWORD PTR [edx+176]
	mov	DWORD PTR -12+[ebp], eax
	cmp	DWORD PTR -12+[ebp], 7
	ja	$L70224
	mov	ecx, DWORD PTR -12+[ebp]
	jmp	DWORD PTR $L70235[ecx*4]
$L70215:

; 31   : 	case CtrlRead:
; 32   : 		/* Handle search & addnew functions */
; 33   : 		if(table_read_controls(cntxt, i_ctrl, NULL) ||
; 34   : 			table_process_controls(cntxt, i_ctrl)) STACK_ERROR;

	push	0
	mov	edx, DWORD PTR _i_ctrl$[ebp]
	push	edx
	mov	eax, DWORD PTR _cntxt$[ebp]
	push	eax
	call	_table_read_controls
	add	esp, 12					; 0000000cH
	test	eax, eax
	jne	SHORT $L70218
	mov	ecx, DWORD PTR _i_ctrl$[ebp]
	push	ecx
	mov	edx, DWORD PTR _cntxt$[ebp]
	push	edx
	call	_table_process_controls
	add	esp, 8
	test	eax, eax
	je	SHORT $L70217
$L70218:
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 34		; 00000022H
	jmp	SHORT $eva_err$70219
$L70217:

; 35   : 		break;

	jmp	SHORT $eva_noerr$70225
$L70220:

; 36   : 	case HtmlEdit:
; 37   : 	case HtmlPrint:
; 38   : 	case HtmlView:
; 39   : 		if(!form->html) break;

	mov	ecx, DWORD PTR _form$[ebp]
	cmp	DWORD PTR [ecx+232], 0
	jne	SHORT $L70221
	jmp	SHORT $eva_noerr$70225
$L70221:

; 40   : 
; 41   : 		/* Output table of values */
; 42   : 		if(ctrl_format_pos(cntxt, ctrl, 1) ||
; 43   : 			table_put_html_obj_list(cntxt, i_ctrl) ||
; 44   : 			ctrl_format_pos(cntxt, ctrl, 0)) STACK_ERROR;

	push	1
	mov	edx, DWORD PTR _ctrl$[ebp]
	push	edx
	mov	eax, DWORD PTR _cntxt$[ebp]
	push	eax
	call	_ctrl_format_pos
	add	esp, 12					; 0000000cH
	test	eax, eax
	jne	SHORT $L70223
	mov	ecx, DWORD PTR _i_ctrl$[ebp]
	push	ecx
	mov	edx, DWORD PTR _cntxt$[ebp]
	push	edx
	call	_table_put_html_obj_list
	add	esp, 8
	test	eax, eax
	jne	SHORT $L70223
	push	0
	mov	eax, DWORD PTR _ctrl$[ebp]
	push	eax
	mov	ecx, DWORD PTR _cntxt$[ebp]
	push	ecx
	call	_ctrl_format_pos
	add	esp, 12					; 0000000cH
	test	eax, eax
	je	SHORT $L70224
$L70223:
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 44		; 0000002cH
	jmp	SHORT $eva_err$70219
$L70224:
$eva_noerr$70225:

; 49   : 
; 50   : 	RETURN_OK_CLEANUP;

	push	0
	push	OFFSET FLAT:$SG70226
	push	OFFSET FLAT:$SG70227
	mov	eax, DWORD PTR _cntxt$[ebp]
	push	eax
	call	_err_clear
	add	esp, 16					; 00000010H
$eva_err$70219:
	mov	ecx, DWORD PTR _cntxt$[ebp]
	cmp	DWORD PTR [ecx+29872], 0
	je	SHORT $L70228
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	eax, DWORD PTR [edx+29900]
	push	eax
	push	OFFSET FLAT:$SG70229
	push	OFFSET FLAT:$SG70230
	mov	ecx, DWORD PTR _cntxt$[ebp]
	push	ecx
	call	_err_add_context
	add	esp, 16					; 00000010H
$L70228:
	mov	edx, DWORD PTR _cntxt$[ebp]
	xor	eax, eax
	cmp	DWORD PTR [edx+29872], 0
	setne	al

; 51   : }

	mov	esp, ebp
	pop	ebp
	ret	0
$L70235:
	DD	$L70215
	DD	$L70224
	DD	$L70224
	DD	$L70224
	DD	$L70220
	DD	$L70224
	DD	$L70220
	DD	$L70220
_ctrl_add_output_list_simple ENDP
_TEXT	ENDS
END
