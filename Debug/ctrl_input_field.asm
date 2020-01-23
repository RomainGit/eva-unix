	TITLE	D:\Travail\ABI\EVA\V4.0\CGI\Brunix-2016\ctrl_input_field.c
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
PUBLIC	_ctrl_add_input_field
EXTRN	__pctype:DWORD
EXTRN	__isctype:NEAR
EXTRN	_ctrl_add_text:NEAR
EXTRN	_setcase:NEAR
EXTRN	___mb_cur_max:DWORD
EXTRN	_dyntab_val:NEAR
EXTRN	_strcspn:NEAR
EXTRN	_err_add_context:NEAR
EXTRN	_err_clear:NEAR
EXTRN	_dyntab_field_val:NEAR
_BSS	SEGMENT
$SG70214 DB	01H DUP (?)
_BSS	ENDS
_DATA	SEGMENT
$SG70213 DB	'_EVA_FONTFACE', 00H
	ORG $+2
$SG70215 DB	'Courier', 00H
$SG70226 DB	'-><()[]{}=,.', 00H
	ORG $+3
$SG70236 DB	'D:\Travail\ABI\EVA\V4.0\CGI\Brunix-2016\ctrl_input_field'
	DB	'.c', 00H
	ORG $+1
$SG70237 DB	'ctrl_add_input_field', 00H
	ORG $+3
$SG70239 DB	'D:\Travail\ABI\EVA\V4.0\CGI\Brunix-2016\ctrl_input_field'
	DB	'.c', 00H
	ORG $+1
$SG70240 DB	'ctrl_add_input_field', 00H
_DATA	ENDS
_TEXT	SEGMENT
_cntxt$ = 8
_i_ctrl$ = 12
_form$ = -4
_ctrl$ = -12
_i$ = -8
_val$70224 = -16
_sz$70225 = -20
_ctrl_add_input_field PROC NEAR

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

; 28   : 	unsigned long i;
; 29   : 
; 30   : 	/* Set default font */
; 31   : 	if(!*CTRL_ATTR_VAL(FONTFACE)) ctrl->FONTFACE = "Courier";

	cmp	DWORD PTR _ctrl$[ebp], 0
	je	SHORT $L70245
	push	0
	push	-1
	push	OFFSET FLAT:$SG70213
	mov	edx, DWORD PTR _ctrl$[ebp]
	add	edx, 44					; 0000002cH
	push	edx
	call	_dyntab_field_val
	add	esp, 16					; 00000010H
	mov	DWORD PTR -24+[ebp], eax
	jmp	SHORT $L70246
$L70245:
	mov	DWORD PTR -24+[ebp], OFFSET FLAT:$SG70214
$L70246:
	mov	eax, DWORD PTR -24+[ebp]
	movsx	ecx, BYTE PTR [eax]
	test	ecx, ecx
	jne	SHORT $L70212
	mov	edx, DWORD PTR _ctrl$[ebp]
	mov	DWORD PTR [edx+352], OFFSET FLAT:$SG70215
$L70212:

; 32   : 
; 33   : 	switch(form->step)
; 34   : 	{

	mov	eax, DWORD PTR _form$[ebp]
	mov	ecx, DWORD PTR [eax+176]
	mov	DWORD PTR -28+[ebp], ecx
	cmp	DWORD PTR -28+[ebp], 2
	je	SHORT $L70220
	jmp	$L70232
$L70220:

; 35   : 	case InputCheck:
; 36   : 		/* Set fields as uppercase */
; 37   : 		for(i = 0; i < ctrl->val.nbrows; i++)

	mov	DWORD PTR _i$[ebp], 0
	jmp	SHORT $L70221
$L70222:
	mov	edx, DWORD PTR _i$[ebp]
	add	edx, 1
	mov	DWORD PTR _i$[ebp], edx
$L70221:
	mov	eax, DWORD PTR _ctrl$[ebp]
	mov	ecx, DWORD PTR _i$[ebp]
	cmp	ecx, DWORD PTR [eax+64]
	jae	$L70223

; 39   : 			char *val = dyntab_val(&ctrl->val, i, 0);

	push	0
	mov	edx, DWORD PTR _i$[ebp]
	push	edx
	mov	eax, DWORD PTR _ctrl$[ebp]
	add	eax, 64					; 00000040H
	push	eax
	call	_dyntab_val
	add	esp, 12					; 0000000cH
	mov	DWORD PTR _val$70224[ebp], eax

; 40   : 			size_t sz = strcspn(val, "-><()[]{}=,.");

	push	OFFSET FLAT:$SG70226
	mov	ecx, DWORD PTR _val$70224[ebp]
	push	ecx
	call	_strcspn
	add	esp, 8
	mov	DWORD PTR _sz$70225[ebp], eax

; 41   : 			if(val[sz]) continue;

	mov	edx, DWORD PTR _val$70224[ebp]
	add	edx, DWORD PTR _sz$70225[ebp]
	movsx	eax, BYTE PTR [edx]
	test	eax, eax
	je	SHORT $L70227
	jmp	SHORT $L70222
$L70227:

; 42   : 			setcase(3, val, 0);

	push	0
	mov	ecx, DWORD PTR _val$70224[ebp]
	push	ecx
	push	3
	call	_setcase
	add	esp, 12					; 0000000cH
$L70229:

; 43   : 			while(*val)

	mov	edx, DWORD PTR _val$70224[ebp]
	movsx	eax, BYTE PTR [edx]
	test	eax, eax
	je	SHORT $L70230

; 45   : 				if(!isalnum(*val)) 

	cmp	DWORD PTR ___mb_cur_max, 1
	jle	SHORT $L70247
	push	263					; 00000107H
	mov	ecx, DWORD PTR _val$70224[ebp]
	movsx	edx, BYTE PTR [ecx]
	push	edx
	call	__isctype
	add	esp, 8
	mov	DWORD PTR -32+[ebp], eax
	jmp	SHORT $L70248
$L70247:
	mov	eax, DWORD PTR _val$70224[ebp]
	movsx	ecx, BYTE PTR [eax]
	mov	edx, DWORD PTR __pctype
	xor	eax, eax
	mov	ax, WORD PTR [edx+ecx*2]
	and	eax, 263				; 00000107H
	mov	DWORD PTR -32+[ebp], eax
$L70248:
	cmp	DWORD PTR -32+[ebp], 0
	jne	SHORT $L70231

; 47   : 					*val = '_';

	mov	ecx, DWORD PTR _val$70224[ebp]
	mov	BYTE PTR [ecx], 95			; 0000005fH

; 48   : 					ctrl->b_modified = 1;

	mov	edx, DWORD PTR _ctrl$[ebp]
	mov	DWORD PTR [edx+200], 1
$L70231:

; 50   : 				val++;

	mov	eax, DWORD PTR _val$70224[ebp]
	add	eax, 1
	mov	DWORD PTR _val$70224[ebp], eax

; 51   : 			}

	jmp	SHORT $L70229
$L70230:

; 52   : 		}

	jmp	$L70222
$L70223:

; 53   : 		break;

	jmp	SHORT $eva_noerr$70235
$L70232:

; 54   : 
; 55   : 	default:
; 56   : 		/* Handle as text control */
; 57   : 		if(ctrl_add_text(cntxt, i_ctrl)) STACK_ERROR;

	mov	ecx, DWORD PTR _i_ctrl$[ebp]
	push	ecx
	mov	edx, DWORD PTR _cntxt$[ebp]
	push	edx
	call	_ctrl_add_text
	add	esp, 8
	test	eax, eax
	je	SHORT $L70233
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 57		; 00000039H
	jmp	SHORT $eva_err$70234
$L70233:
$eva_noerr$70235:

; 59   : 
; 60   : 
; 61   : 	RETURN_OK_CLEANUP;

	push	0
	push	OFFSET FLAT:$SG70236
	push	OFFSET FLAT:$SG70237
	mov	ecx, DWORD PTR _cntxt$[ebp]
	push	ecx
	call	_err_clear
	add	esp, 16					; 00000010H
$eva_err$70234:
	mov	edx, DWORD PTR _cntxt$[ebp]
	cmp	DWORD PTR [edx+29872], 0
	je	SHORT $L70238
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	ecx, DWORD PTR [eax+29900]
	push	ecx
	push	OFFSET FLAT:$SG70239
	push	OFFSET FLAT:$SG70240
	mov	edx, DWORD PTR _cntxt$[ebp]
	push	edx
	call	_err_add_context
	add	esp, 16					; 00000010H
$L70238:
	mov	eax, DWORD PTR _cntxt$[ebp]
	xor	ecx, ecx
	cmp	DWORD PTR [eax+29872], 0
	setne	cl
	mov	eax, ecx

; 62   : }

	mov	esp, ebp
	pop	ebp
	ret	0
_ctrl_add_input_field ENDP
_TEXT	ENDS
END
