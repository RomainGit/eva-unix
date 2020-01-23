	TITLE	D:\Travail\ABI\EVA\V4.0\CGI\Brunix-2016\ctrl_option.c
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
PUBLIC	_ctrl_add_option
EXTRN	_dyntab_free:NEAR
EXTRN	_ctrl_add_child:NEAR
EXTRN	_err_add_context:NEAR
EXTRN	_err_clear:NEAR
EXTRN	_dyntab_filter_field:NEAR
_DATA	SEGMENT
$SG70216 DB	'_EVA_CTRLTREE', 00H
	ORG $+2
$SG70218 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70226 DB	'D:\Travail\ABI\EVA\V4.0\CGI\Brunix-2016\ctrl_option.c', 00H
	ORG $+2
$SG70227 DB	'ctrl_add_option', 00H
$SG70229 DB	'D:\Travail\ABI\EVA\V4.0\CGI\Brunix-2016\ctrl_option.c', 00H
	ORG $+2
$SG70230 DB	'ctrl_add_option', 00H
_DATA	ENDS
_TEXT	SEGMENT
_cntxt$ = 8
_i_ctrl$ = 12
_form$ = -24
_ctrl$ = -28
_ctrltree$ = -20
_ctrl_add_option PROC NEAR

; 25   : ){

	push	ebp
	mov	ebp, esp
	sub	esp, 32					; 00000020H

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

; 28   : 	DynTable ctrltree = { 0 };

	mov	DWORD PTR _ctrltree$[ebp], 0
	xor	edx, edx
	mov	DWORD PTR _ctrltree$[ebp+4], edx
	mov	DWORD PTR _ctrltree$[ebp+8], edx
	mov	DWORD PTR _ctrltree$[ebp+12], edx
	mov	DWORD PTR _ctrltree$[ebp+16], edx

; 29   : 
; 30   : 	/* Do not process if not selected */
; 31   : 	if(!ctrl->b_selected) RETURN_OK;

	mov	eax, DWORD PTR _ctrl$[ebp]
	cmp	DWORD PTR [eax+196], 0
	jne	SHORT $L70212
	jmp	$eva_noerr$70213
$L70212:

; 32   : 
; 33   : 	/* Read controls under option */
; 34   : 	CTRL_ATTR(ctrltree, CTRLTREE);

	lea	ecx, DWORD PTR _ctrltree$[ebp]
	push	ecx
	call	_dyntab_free
	add	esp, 4
	push	0
	push	-1
	push	OFFSET FLAT:$SG70216
	mov	edx, DWORD PTR _ctrl$[ebp]
	add	edx, 44					; 0000002cH
	push	edx
	push	0
	lea	eax, DWORD PTR _ctrltree$[ebp]
	push	eax
	call	_dyntab_filter_field
	add	esp, 24					; 00000018H
	test	eax, eax
	je	SHORT $L70215
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29872], OFFSET FLAT:$SG70218
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 34		; 00000022H
	jmp	SHORT $eva_err$70219
$L70215:

; 35   : 
; 36   : 	switch(form->step)
; 37   : 	{

	mov	eax, DWORD PTR _form$[ebp]
	mov	ecx, DWORD PTR [eax+176]
	mov	DWORD PTR -32+[ebp], ecx

; 38   : 	case HtmlEdit:
; 39   : 	case HtmlPrint:
; 40   : 	case HtmlView:
; 41   : 	default:
; 42   : 		/* Add lower level controls */
; 43   : 		CTRL_ADD_CHILD(i_ctrl, &ctrltree);

	lea	edx, DWORD PTR _ctrltree$[ebp]
	push	edx
	mov	eax, DWORD PTR _i_ctrl$[ebp]
	push	eax
	mov	ecx, DWORD PTR _cntxt$[ebp]
	push	ecx
	call	_ctrl_add_child
	add	esp, 12					; 0000000cH
	test	eax, eax
	je	SHORT $L70225
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 43		; 0000002bH
	jmp	SHORT $eva_err$70219
$L70225:
	mov	eax, DWORD PTR _i_ctrl$[ebp]
	imul	eax, 480				; 000001e0H
	mov	ecx, DWORD PTR _form$[ebp]
	mov	edx, DWORD PTR [ecx]
	add	edx, eax
	mov	DWORD PTR _ctrl$[ebp], edx
$eva_noerr$70213:

; 45   : 
; 46   : 	RETURN_OK_CLEANUP;

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
	lea	edx, DWORD PTR _ctrltree$[ebp]
	push	edx
	call	_dyntab_free
	add	esp, 4
	mov	eax, DWORD PTR _cntxt$[ebp]
	xor	ecx, ecx
	cmp	DWORD PTR [eax+29872], 0
	setne	cl
	mov	eax, ecx

; 47   : }

	mov	esp, ebp
	pop	ebp
	ret	0
_ctrl_add_option ENDP
_TEXT	ENDS
END
