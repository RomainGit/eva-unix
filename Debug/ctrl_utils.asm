	TITLE	D:\Travail\ABI\EVA\V4.0\CGI\Brunix-2016\ctrl_utils.c
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
PUBLIC	_ctrl_add_new
EXTRN	_ctrl_handlers:BYTE
EXTRN	_sprintf:NEAR
EXTRN	_mem_realloc:NEAR
EXTRN	_ctrl_read_baseobj:NEAR
EXTRN	_ctrl_set_common_attr:NEAR
EXTRN	_qry_cache_idobj_field:NEAR
EXTRN	_dyntab_add:NEAR
EXTRN	_strcmp:NEAR
EXTRN	_err_add_context:NEAR
EXTRN	_err_clear:NEAR
_DATA	SEGMENT
$SG70219 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70226 DB	'%lu', 00H
$SG70230 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70238 DB	'D:\Travail\ABI\EVA\V4.0\CGI\Brunix-2016\ctrl_utils.c', 00H
	ORG $+3
$SG70239 DB	'ctrl_add_new', 00H
	ORG $+3
$SG70241 DB	'D:\Travail\ABI\EVA\V4.0\CGI\Brunix-2016\ctrl_utils.c', 00H
	ORG $+3
$SG70242 DB	'ctrl_add_new', 00H
_DATA	ENDS
_TEXT	SEGMENT
_cntxt$ = 8
_idctrl$ = 12
__i_ctrl$ = 16
_form$ = -4
_i_ctrl$ = -8
_ctrl$ = -12
_newdest$70214 = -16
__tmp$70225 = -48
_ctrl_add_new PROC NEAR

; 26   : ){

	push	ebp
	mov	ebp, esp
	sub	esp, 48					; 00000030H
	push	edi

; 27   : 	EVA_form *form = cntxt->form;

	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	ecx, DWORD PTR [eax+80]
	mov	DWORD PTR _form$[ebp], ecx

; 28   : 	unsigned long i_ctrl = form->nb_ctrl;

	mov	edx, DWORD PTR _form$[ebp]
	mov	eax, DWORD PTR [edx+4]
	mov	DWORD PTR _i_ctrl$[ebp], eax

; 29   : 	EVA_ctrl *ctrl;
; 30   : 
; 31   : 	/* Realloc controls table */
; 32   : 	M_REALLOC(EVA_ctrl, form->ctrl, form->nb_ctrl);

	push	960					; 000003c0H
	mov	ecx, DWORD PTR _form$[ebp]
	mov	edx, DWORD PTR [ecx+4]
	imul	edx, 480				; 000001e0H
	push	edx
	mov	eax, DWORD PTR _form$[ebp]
	mov	ecx, DWORD PTR [eax]
	push	ecx
	call	_mem_realloc
	add	esp, 12					; 0000000cH
	mov	DWORD PTR _newdest$70214[ebp], eax
	cmp	DWORD PTR _newdest$70214[ebp], 0
	jne	SHORT $L70217
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29872], OFFSET FLAT:$SG70219
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 32		; 00000020H
	jmp	$eva_err$70220
$L70217:
	mov	ecx, DWORD PTR _form$[ebp]
	mov	edx, DWORD PTR _newdest$70214[ebp]
	mov	DWORD PTR [ecx], edx
	mov	eax, DWORD PTR _form$[ebp]
	mov	ecx, DWORD PTR [eax+4]
	add	ecx, 1
	mov	edx, DWORD PTR _form$[ebp]
	mov	DWORD PTR [edx+4], ecx

; 33   : 	if(_i_ctrl) *_i_ctrl = i_ctrl;

	cmp	DWORD PTR __i_ctrl$[ebp], 0
	je	SHORT $L70222
	mov	eax, DWORD PTR __i_ctrl$[ebp]
	mov	ecx, DWORD PTR _i_ctrl$[ebp]
	mov	DWORD PTR [eax], ecx
$L70222:

; 34   : 	ctrl = form->ctrl + i_ctrl;

	mov	edx, DWORD PTR _i_ctrl$[ebp]
	imul	edx, 480				; 000001e0H
	mov	eax, DWORD PTR _form$[ebp]
	mov	ecx, DWORD PTR [eax]
	add	ecx, edx
	mov	DWORD PTR _ctrl$[ebp], ecx

; 35   : 
; 36   : 	/* Read form control in ctrl->attr & store ctrl->id */
; 37   : 	if(qry_cache_idobj(&ctrl->attr, idctrl)) STACK_ERROR;

	push	3
	push	0
	mov	edx, DWORD PTR _idctrl$[ebp]
	push	edx
	mov	eax, DWORD PTR _ctrl$[ebp]
	add	eax, 44					; 0000002cH
	push	eax
	mov	ecx, DWORD PTR _cntxt$[ebp]
	push	ecx
	call	_qry_cache_idobj_field
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L70224
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 37		; 00000025H
	jmp	$eva_err$70220
$L70224:

; 38   : 	DYNTAB_ADD_INT(&ctrl->id, 0, 0, idctrl);

	mov	BYTE PTR __tmp$70225[ebp], 0
	mov	ecx, 7
	xor	eax, eax
	lea	edi, DWORD PTR __tmp$70225[ebp+1]
	rep stosd
	stosw
	stosb
	mov	eax, DWORD PTR _idctrl$[ebp]
	push	eax
	push	OFFSET FLAT:$SG70226
	lea	ecx, DWORD PTR __tmp$70225[ebp]
	push	ecx
	call	_sprintf
	add	esp, 12					; 0000000cH
	push	0
	push	0
	push	0
	lea	edx, DWORD PTR __tmp$70225[ebp]
	push	edx
	push	0
	push	0
	mov	eax, DWORD PTR _ctrl$[ebp]
	push	eax
	call	_dyntab_add
	add	esp, 28					; 0000001cH
	test	eax, eax
	je	SHORT $L70228
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29872], OFFSET FLAT:$SG70230
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 38		; 00000026H
	jmp	$eva_err$70220
$L70228:

; 39   : 
; 40   : 	/* Handle derived control */
; 41   : 	if(ctrl_read_baseobj(cntxt, &ctrl->attr)) STACK_ERROR;

	mov	eax, DWORD PTR _ctrl$[ebp]
	add	eax, 44					; 0000002cH
	push	eax
	mov	ecx, DWORD PTR _cntxt$[ebp]
	push	ecx
	call	_ctrl_read_baseobj
	add	esp, 8
	test	eax, eax
	je	SHORT $L70231
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 41		; 00000029H
	jmp	$eva_err$70220
$L70231:

; 42   : 
; 43   : 	/* Read control common attributes */
; 44   : 	if(ctrl_set_common_attr(cntxt, ctrl)) STACK_ERROR;

	mov	eax, DWORD PTR _ctrl$[ebp]
	push	eax
	mov	ecx, DWORD PTR _cntxt$[ebp]
	push	ecx
	call	_ctrl_set_common_attr
	add	esp, 8
	test	eax, eax
	je	SHORT $L70232
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 44		; 0000002cH
	jmp	$eva_err$70220
$L70232:

; 45   : 
; 46   : 	/* Look for control handlers */
; 47   : 	while(	ctrl_handlers[ctrl->i_handler].control &&
; 48   : 			(	strcmp(ctrl_handlers[ctrl->i_handler].control, ctrl->CONTROL) ||
; 49   : 				(ctrl_handlers[ctrl->i_handler].type &&
; 50   : 				strcmp(ctrl_handlers[ctrl->i_handler].type, ctrl->TYPE)) ))

	mov	eax, DWORD PTR _ctrl$[ebp]
	mov	ecx, DWORD PTR [eax+32]
	shl	ecx, 4
	cmp	DWORD PTR _ctrl_handlers[ecx], 0
	je	SHORT $eva_noerr$70237
	mov	edx, DWORD PTR _ctrl$[ebp]
	mov	eax, DWORD PTR [edx+272]
	push	eax
	mov	ecx, DWORD PTR _ctrl$[ebp]
	mov	edx, DWORD PTR [ecx+32]
	shl	edx, 4
	mov	eax, DWORD PTR _ctrl_handlers[edx]
	push	eax
	call	_strcmp
	add	esp, 8
	test	eax, eax
	jne	SHORT $L70236
	mov	ecx, DWORD PTR _ctrl$[ebp]
	mov	edx, DWORD PTR [ecx+32]
	shl	edx, 4
	cmp	DWORD PTR _ctrl_handlers[edx+4], 0
	je	SHORT $eva_noerr$70237
	mov	eax, DWORD PTR _ctrl$[ebp]
	mov	ecx, DWORD PTR [eax+276]
	push	ecx
	mov	edx, DWORD PTR _ctrl$[ebp]
	mov	eax, DWORD PTR [edx+32]
	shl	eax, 4
	mov	ecx, DWORD PTR _ctrl_handlers[eax+4]
	push	ecx
	call	_strcmp
	add	esp, 8
	test	eax, eax
	je	SHORT $eva_noerr$70237
$L70236:

; 51   : 		ctrl->i_handler++;

	mov	edx, DWORD PTR _ctrl$[ebp]
	mov	eax, DWORD PTR [edx+32]
	add	eax, 1
	mov	ecx, DWORD PTR _ctrl$[ebp]
	mov	DWORD PTR [ecx+32], eax
	jmp	$L70232
$eva_noerr$70237:

; 52   : 
; 53   : 	RETURN_OK_CLEANUP;

	push	0
	push	OFFSET FLAT:$SG70238
	push	OFFSET FLAT:$SG70239
	mov	edx, DWORD PTR _cntxt$[ebp]
	push	edx
	call	_err_clear
	add	esp, 16					; 00000010H
$eva_err$70220:
	mov	eax, DWORD PTR _cntxt$[ebp]
	cmp	DWORD PTR [eax+29872], 0
	je	SHORT $L70240
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	edx, DWORD PTR [ecx+29900]
	push	edx
	push	OFFSET FLAT:$SG70241
	push	OFFSET FLAT:$SG70242
	mov	eax, DWORD PTR _cntxt$[ebp]
	push	eax
	call	_err_add_context
	add	esp, 16					; 00000010H
$L70240:
	mov	ecx, DWORD PTR _cntxt$[ebp]
	xor	eax, eax
	cmp	DWORD PTR [ecx+29872], 0
	setne	al

; 54   : }

	pop	edi
	mov	esp, ebp
	pop	ebp
	ret	0
_ctrl_add_new ENDP
_TEXT	ENDS
PUBLIC	_ctrl_from_cginame
EXTRN	_strncmp:NEAR
_TEXT	SEGMENT
_cntxt$ = 8
_cginame$ = 12
_sz$ = 16
_form$ = -4
_j$ = -8
_name$70256 = -12
_ctrl_from_cginame PROC NEAR

; 65   : ){

	push	ebp
	mov	ebp, esp
	sub	esp, 12					; 0000000cH

; 66   : 	EVA_form *form = cntxt->form;

	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	ecx, DWORD PTR [eax+80]
	mov	DWORD PTR _form$[ebp], ecx

; 67   : 	unsigned long j;
; 68   : 
; 69   : 	/* Search loop on form->ctrl */
; 70   : 	for(j = 0; j < form->nb_ctrl; j++)

	mov	DWORD PTR _j$[ebp], 0
	jmp	SHORT $L70253
$L70254:
	mov	edx, DWORD PTR _j$[ebp]
	add	edx, 1
	mov	DWORD PTR _j$[ebp], edx
$L70253:
	mov	eax, DWORD PTR _form$[ebp]
	mov	ecx, DWORD PTR _j$[ebp]
	cmp	ecx, DWORD PTR [eax+4]
	jae	SHORT $L70255

; 72   : 		DynBuffer *name = form->ctrl[j].cginame;

	mov	edx, DWORD PTR _j$[ebp]
	imul	edx, 480				; 000001e0H
	mov	eax, DWORD PTR _form$[ebp]
	mov	ecx, DWORD PTR [eax]
	mov	edx, DWORD PTR [ecx+edx+40]
	mov	DWORD PTR _name$70256[ebp], edx

; 73   : 		if(name && name->cnt <= sz && !strncmp(cginame+1, name->data + 1, name->cnt - 1))

	cmp	DWORD PTR _name$70256[ebp], 0
	je	SHORT $L70257
	mov	eax, DWORD PTR _name$70256[ebp]
	mov	ecx, DWORD PTR [eax+4]
	cmp	ecx, DWORD PTR _sz$[ebp]
	ja	SHORT $L70257
	mov	edx, DWORD PTR _name$70256[ebp]
	mov	eax, DWORD PTR [edx+4]
	sub	eax, 1
	push	eax
	mov	ecx, DWORD PTR _name$70256[ebp]
	add	ecx, 9
	push	ecx
	mov	edx, DWORD PTR _cginame$[ebp]
	add	edx, 1
	push	edx
	call	_strncmp
	add	esp, 12					; 0000000cH
	test	eax, eax
	jne	SHORT $L70257

; 74   : 			return j;

	mov	eax, DWORD PTR _j$[ebp]
	jmp	SHORT $L70250
$L70257:

; 75   : 	}

	jmp	SHORT $L70254
$L70255:

; 76   : 
; 77   : 	return 0;

	xor	eax, eax
$L70250:

; 78   : }

	mov	esp, ebp
	pop	ebp
	ret	0
_ctrl_from_cginame ENDP
_TEXT	ENDS
PUBLIC	_ctrl_from_id
EXTRN	_dyntab_txt_cmp:NEAR
_TEXT	SEGMENT
_cntxt$ = 8
_i_ctrl$ = 12
_id$ = 16
_sz_id$ = 20
_form$ = -4
_j$ = -8
_ctrl_from_id PROC NEAR

; 88   : ){

	push	ebp
	mov	ebp, esp
	sub	esp, 8

; 89   : 	EVA_form *form = cntxt->form;

	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	ecx, DWORD PTR [eax+80]
	mov	DWORD PTR _form$[ebp], ecx

; 90   : 	unsigned long j;
; 91   : 
; 92   : 	for(j = form->ctrl[i_ctrl].i_child; j; j = form->ctrl[j].i_brother)

	mov	edx, DWORD PTR _i_ctrl$[ebp]
	imul	edx, 480				; 000001e0H
	mov	eax, DWORD PTR _form$[ebp]
	mov	ecx, DWORD PTR [eax]
	mov	edx, DWORD PTR [ecx+edx+24]
	mov	DWORD PTR _j$[ebp], edx
	jmp	SHORT $L70269
$L70270:
	mov	eax, DWORD PTR _j$[ebp]
	imul	eax, 480				; 000001e0H
	mov	ecx, DWORD PTR _form$[ebp]
	mov	edx, DWORD PTR [ecx]
	mov	eax, DWORD PTR [edx+eax+28]
	mov	DWORD PTR _j$[ebp], eax
$L70269:
	cmp	DWORD PTR _j$[ebp], 0
	je	SHORT $L70271

; 93   : 		if(!dyntab_txt_cmp(id, sz_id, &form->ctrl[j].id, 0, 0))

	push	0
	push	0
	mov	ecx, DWORD PTR _j$[ebp]
	imul	ecx, 480				; 000001e0H
	mov	edx, DWORD PTR _form$[ebp]
	mov	eax, DWORD PTR [edx]
	add	eax, ecx
	push	eax
	mov	ecx, DWORD PTR _sz_id$[ebp]
	push	ecx
	mov	edx, DWORD PTR _id$[ebp]
	push	edx
	call	_dyntab_txt_cmp
	add	esp, 20					; 00000014H
	test	eax, eax
	jne	SHORT $L70272

; 94   : 			return j;

	mov	eax, DWORD PTR _j$[ebp]
	jmp	SHORT $L70266
$L70272:

; 95   : 
; 96   : 	return 0;

	jmp	SHORT $L70270
$L70271:
	xor	eax, eax
$L70266:

; 97   : }

	mov	esp, ebp
	pop	ebp
	ret	0
_ctrl_from_id ENDP
_TEXT	ENDS
PUBLIC	_ctrl_add_value
EXTRN	_cgi_build_finalname:NEAR
EXTRN	_cgi_add_input:NEAR
EXTRN	_mem_free:NEAR
EXTRN	_dynbuf_add:NEAR
EXTRN	_dyntab_cell:NEAR
_DATA	SEGMENT
	ORG $+3
$SG70299 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70304 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70310 DB	'D:\Travail\ABI\EVA\V4.0\CGI\Brunix-2016\ctrl_utils.c', 00H
	ORG $+3
$SG70311 DB	'ctrl_add_value', 00H
	ORG $+1
$SG70313 DB	'D:\Travail\ABI\EVA\V4.0\CGI\Brunix-2016\ctrl_utils.c', 00H
	ORG $+3
$SG70314 DB	'ctrl_add_value', 00H
_DATA	ENDS
_TEXT	SEGMENT
_cntxt$ = 8
_i_ctrl$ = 12
_txt$ = 16
_len$ = 20
_num$ = 24
_line$ = 28
_b_modified$ = 32
_form$ = -4
_ctrl$ = -20
_c$ = -12
_row$ = -8
_name$ = -16
_ctrl_add_value PROC NEAR

; 112  : ){

	push	ebp
	mov	ebp, esp
	sub	esp, 28					; 0000001cH

; 113  : 	EVA_form *form = cntxt->form;

	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	ecx, DWORD PTR [eax+80]
	mov	DWORD PTR _form$[ebp], ecx

; 114  : 	EVA_ctrl *ctrl = form->ctrl + i_ctrl;

	mov	edx, DWORD PTR _i_ctrl$[ebp]
	imul	edx, 480				; 000001e0H
	mov	eax, DWORD PTR _form$[ebp]
	mov	ecx, DWORD PTR [eax]
	add	ecx, edx
	mov	DWORD PTR _ctrl$[ebp], ecx

; 115  : 	DynTableCell *c;
; 116  : 	unsigned long row = ctrl->val.nbrows;

	mov	edx, DWORD PTR _ctrl$[ebp]
	mov	eax, DWORD PTR [edx+64]
	mov	DWORD PTR _row$[ebp], eax

; 117  : 	DynBuffer *name = NULL;

	mov	DWORD PTR _name$[ebp], 0

; 118  : 
; 119  : 	DYNTAB_ADD(&ctrl->val, row, 0, txt, len, NO_CONV);

	push	0
	push	0
	mov	ecx, DWORD PTR _len$[ebp]
	push	ecx
	mov	edx, DWORD PTR _txt$[ebp]
	push	edx
	push	0
	mov	eax, DWORD PTR _row$[ebp]
	push	eax
	mov	ecx, DWORD PTR _ctrl$[ebp]
	add	ecx, 64					; 00000040H
	push	ecx
	call	_dyntab_add
	add	esp, 28					; 0000001cH
	test	eax, eax
	je	SHORT $L70297
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29872], OFFSET FLAT:$SG70299
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 119		; 00000077H
	jmp	$eva_err$70300
$L70297:

; 120  : 	c = dyntab_cell(&ctrl->val, row, 0);

	push	0
	mov	ecx, DWORD PTR _row$[ebp]
	push	ecx
	mov	edx, DWORD PTR _ctrl$[ebp]
	add	edx, 64					; 00000040H
	push	edx
	call	_dyntab_cell
	add	esp, 12					; 0000000cH
	mov	DWORD PTR _c$[ebp], eax

; 121  : 	c->Line = line;

	mov	eax, DWORD PTR _c$[ebp]
	mov	ecx, DWORD PTR _line$[ebp]
	mov	DWORD PTR [eax+40], ecx

; 122  : 	c->Num = num;

	mov	edx, DWORD PTR _c$[ebp]
	mov	eax, DWORD PTR _num$[ebp]
	mov	DWORD PTR [edx+36], eax

; 123  : 	c->b_modified = b_modified;

	mov	ecx, DWORD PTR _c$[ebp]
	mov	dl, BYTE PTR _b_modified$[ebp]
	mov	BYTE PTR [ecx+13], dl

; 124  : 	ctrl->b_modified |= b_modified;

	movsx	eax, BYTE PTR _b_modified$[ebp]
	mov	ecx, DWORD PTR _ctrl$[ebp]
	mov	edx, DWORD PTR [ecx+200]
	or	edx, eax
	mov	eax, DWORD PTR _ctrl$[ebp]
	mov	DWORD PTR [eax+200], edx

; 125  : 	DYNBUF_ADD_BUF(&name, ctrl->cginame, NO_CONV);

	mov	ecx, DWORD PTR _ctrl$[ebp]
	cmp	DWORD PTR [ecx+40], 0
	je	SHORT $L70302
	push	0
	push	0
	mov	edx, DWORD PTR _ctrl$[ebp]
	mov	eax, DWORD PTR [edx+40]
	mov	ecx, DWORD PTR [eax+4]
	push	ecx
	mov	edx, DWORD PTR _ctrl$[ebp]
	mov	eax, DWORD PTR [edx+40]
	add	eax, 8
	push	eax
	lea	ecx, DWORD PTR _name$[ebp]
	push	ecx
	call	_dynbuf_add
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L70302
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29872], OFFSET FLAT:$SG70304
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 125		; 0000007dH
	jmp	$eva_err$70300
$L70302:

; 126  : 	if(cgi_build_finalname(cntxt, &name, 'D', NULL, 0, num, line, 0) ||
; 127  : 		cgi_add_input(cntxt, &c->i_cgi, DYNBUF_VAL_SZ(name), txt, len)) STACK_ERROR;

	push	0
	mov	ecx, DWORD PTR _line$[ebp]
	push	ecx
	mov	edx, DWORD PTR _num$[ebp]
	push	edx
	push	0
	push	0
	push	68					; 00000044H
	lea	eax, DWORD PTR _name$[ebp]
	push	eax
	mov	ecx, DWORD PTR _cntxt$[ebp]
	push	ecx
	call	_cgi_build_finalname
	add	esp, 32					; 00000020H
	test	eax, eax
	jne	SHORT $L70308
	cmp	DWORD PTR _name$[ebp], 0
	je	SHORT $L71679
	mov	edx, DWORD PTR _name$[ebp]
	mov	eax, DWORD PTR [edx+4]
	mov	DWORD PTR -24+[ebp], eax
	jmp	SHORT $L71680
$L71679:
	mov	DWORD PTR -24+[ebp], 0
$L71680:
	cmp	DWORD PTR _name$[ebp], 0
	je	SHORT $L71681
	mov	ecx, DWORD PTR _name$[ebp]
	add	ecx, 8
	mov	DWORD PTR -28+[ebp], ecx
	jmp	SHORT $L71682
$L71681:
	mov	DWORD PTR -28+[ebp], 0
$L71682:
	mov	edx, DWORD PTR _len$[ebp]
	push	edx
	mov	eax, DWORD PTR _txt$[ebp]
	push	eax
	mov	ecx, DWORD PTR -24+[ebp]
	push	ecx
	mov	edx, DWORD PTR -28+[ebp]
	push	edx
	mov	eax, DWORD PTR _c$[ebp]
	add	eax, 48					; 00000030H
	push	eax
	mov	ecx, DWORD PTR _cntxt$[ebp]
	push	ecx
	call	_cgi_add_input
	add	esp, 24					; 00000018H
	test	eax, eax
	je	SHORT $eva_noerr$70309
$L70308:
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 127		; 0000007fH
	jmp	SHORT $eva_err$70300
$eva_noerr$70309:

; 128  : 
; 129  : 	RETURN_OK_CLEANUP;

	push	0
	push	OFFSET FLAT:$SG70310
	push	OFFSET FLAT:$SG70311
	mov	eax, DWORD PTR _cntxt$[ebp]
	push	eax
	call	_err_clear
	add	esp, 16					; 00000010H
$eva_err$70300:
	mov	ecx, DWORD PTR _cntxt$[ebp]
	cmp	DWORD PTR [ecx+29872], 0
	je	SHORT $L70312
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	eax, DWORD PTR [edx+29900]
	push	eax
	push	OFFSET FLAT:$SG70313
	push	OFFSET FLAT:$SG70314
	mov	ecx, DWORD PTR _cntxt$[ebp]
	push	ecx
	call	_err_add_context
	add	esp, 16					; 00000010H
$L70312:
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

; 130  : }

	mov	esp, ebp
	pop	ebp
	ret	0
_ctrl_add_value ENDP
_TEXT	ENDS
PUBLIC	_ctrl_del_value
EXTRN	_cgi_value_setkeep:NEAR
EXTRN	_dyntab_del_rows:NEAR
_TEXT	SEGMENT
_cntxt$ = 8
_i_ctrl$ = 12
_i_val$ = 16
_form$ = -4
_ctrl$ = -8
_ctrl_del_value PROC NEAR

; 142  : ){

	push	ebp
	mov	ebp, esp
	sub	esp, 8

; 143  : 	EVA_form *form = cntxt->form;

	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	ecx, DWORD PTR [eax+80]
	mov	DWORD PTR _form$[ebp], ecx

; 144  : 	EVA_ctrl *ctrl = form->ctrl + i_ctrl;

	mov	edx, DWORD PTR _i_ctrl$[ebp]
	imul	edx, 480				; 000001e0H
	mov	eax, DWORD PTR _form$[ebp]
	mov	ecx, DWORD PTR [eax]
	add	ecx, edx
	mov	DWORD PTR _ctrl$[ebp], ecx

; 145  : 	cgi_value_setkeep(cntxt, &ctrl->val, i_val, 2);

	push	2
	mov	edx, DWORD PTR _i_val$[ebp]
	push	edx
	mov	eax, DWORD PTR _ctrl$[ebp]
	add	eax, 64					; 00000040H
	push	eax
	mov	ecx, DWORD PTR _cntxt$[ebp]
	push	ecx
	call	_cgi_value_setkeep
	add	esp, 16					; 00000010H

; 146  : 	dyntab_del_rows(&ctrl->val, i_val, 1);

	push	1
	mov	edx, DWORD PTR _i_val$[ebp]
	push	edx
	mov	eax, DWORD PTR _ctrl$[ebp]
	add	eax, 64					; 00000040H
	push	eax
	call	_dyntab_del_rows
	add	esp, 12					; 0000000cH

; 147  : 	ctrl->b_modified = 1;

	mov	ecx, DWORD PTR _ctrl$[ebp]
	mov	DWORD PTR [ecx+200], 1

; 148  : }

	mov	esp, ebp
	pop	ebp
	ret	0
_ctrl_del_value ENDP
_TEXT	ENDS
PUBLIC	_ctrl_add_child
PUBLIC	_ctrl_primary_handler
EXTRN	_cgi_build_basename:NEAR
EXTRN	_strtoul:NEAR
EXTRN	_dyntab_sz:NEAR
EXTRN	_dyntab_val:NEAR
EXTRN	_dyntab_cmp:NEAR
_DATA	SEGMENT
	ORG $+1
$SG70389 DB	'D:\Travail\ABI\EVA\V4.0\CGI\Brunix-2016\ctrl_utils.c', 00H
	ORG $+3
$SG70390 DB	'ctrl_add_child', 00H
	ORG $+1
$SG70392 DB	'D:\Travail\ABI\EVA\V4.0\CGI\Brunix-2016\ctrl_utils.c', 00H
	ORG $+3
$SG70393 DB	'ctrl_add_child', 00H
_DATA	ENDS
_TEXT	SEGMENT
_cntxt$ = 8
_i_ctrl$ = 12
_childlist$ = 16
_form$ = -4
_ctrl$ = -28
_newctrl$ = -12
_i_newctrl$ = -8
_i_prevctrl$ = -16
_i$ = -20
_j$ = -24
_clickcgibtn$70363 = -32
_ctrl_add_child PROC NEAR

; 160  : ){

	push	ebp
	mov	ebp, esp
	sub	esp, 40					; 00000028H

; 161  : 	EVA_form *form = cntxt->form;

	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	ecx, DWORD PTR [eax+80]
	mov	DWORD PTR _form$[ebp], ecx

; 162  : 	EVA_ctrl *ctrl = form->ctrl + i_ctrl;

	mov	edx, DWORD PTR _i_ctrl$[ebp]
	imul	edx, 480				; 000001e0H
	mov	eax, DWORD PTR _form$[ebp]
	mov	ecx, DWORD PTR [eax]
	add	ecx, edx
	mov	DWORD PTR _ctrl$[ebp], ecx

; 163  : 	EVA_ctrl *newctrl;
; 164  : 	unsigned long i_newctrl, i_prevctrl;
; 165  : 	unsigned long i, j;
; 166  : 
; 167  : 	if(form->b_noctrltree) RETURN_OK;

	mov	edx, DWORD PTR _form$[ebp]
	cmp	DWORD PTR [edx+200], 0
	je	SHORT $L70341
	jmp	$eva_noerr$70342
$L70341:

; 168  : 
; 169  : 	switch(form->step)
; 170  : 	{

	mov	eax, DWORD PTR _form$[ebp]
	mov	ecx, DWORD PTR [eax+176]
	mov	DWORD PTR -36+[ebp], ecx
	cmp	DWORD PTR -36+[ebp], 0
	je	SHORT $L70347
	jmp	$L70375
$L70347:

; 171  : 	case CtrlRead:
; 172  : 		if(!childlist || !childlist->nbrows) RETURN_OK;

	cmp	DWORD PTR _childlist$[ebp], 0
	je	SHORT $L70349
	mov	edx, DWORD PTR _childlist$[ebp]
	cmp	DWORD PTR [edx], 0
	jne	SHORT $L70348
$L70349:
	jmp	$eva_noerr$70342
$L70348:

; 173  : 
; 174  : 		/* Initialize i_prevctrl with last child */
; 175  : 		for(i_prevctrl = ctrl->i_child; form->ctrl[i_prevctrl].i_brother; i_prevctrl = form->ctrl[i_prevctrl].i_brother);

	mov	eax, DWORD PTR _ctrl$[ebp]
	mov	ecx, DWORD PTR [eax+24]
	mov	DWORD PTR _i_prevctrl$[ebp], ecx
	jmp	SHORT $L70350
$L70351:
	mov	edx, DWORD PTR _i_prevctrl$[ebp]
	imul	edx, 480				; 000001e0H
	mov	eax, DWORD PTR _form$[ebp]
	mov	ecx, DWORD PTR [eax]
	mov	edx, DWORD PTR [ecx+edx+28]
	mov	DWORD PTR _i_prevctrl$[ebp], edx
$L70350:
	mov	eax, DWORD PTR _i_prevctrl$[ebp]
	imul	eax, 480				; 000001e0H
	mov	ecx, DWORD PTR _form$[ebp]
	mov	edx, DWORD PTR [ecx]
	cmp	DWORD PTR [edx+eax+28], 0
	je	SHORT $L70352
	jmp	SHORT $L70351
$L70352:

; 176  : 
; 177  : 		/* Remove controls in childlist already in parents - prevent infinite loops on CTRLTREE */
; 178  : 		for(i = i_ctrl; i != form->ctrl[i].i_parent; i = form->ctrl[i].i_parent)

	mov	eax, DWORD PTR _i_ctrl$[ebp]
	mov	DWORD PTR _i$[ebp], eax
	jmp	SHORT $L70353
$L70354:
	mov	ecx, DWORD PTR _i$[ebp]
	imul	ecx, 480				; 000001e0H
	mov	edx, DWORD PTR _form$[ebp]
	mov	eax, DWORD PTR [edx]
	mov	ecx, DWORD PTR [eax+ecx+20]
	mov	DWORD PTR _i$[ebp], ecx
$L70353:
	mov	edx, DWORD PTR _i$[ebp]
	imul	edx, 480				; 000001e0H
	mov	eax, DWORD PTR _form$[ebp]
	mov	ecx, DWORD PTR [eax]
	mov	eax, DWORD PTR _i$[ebp]
	cmp	eax, DWORD PTR [ecx+edx+20]
	je	SHORT $L70355

; 179  : 			for(j = 1; childlist->nbrows && j <= childlist->nbrows; j++)

	mov	DWORD PTR _j$[ebp], 1
	jmp	SHORT $L70356
$L70357:
	mov	ecx, DWORD PTR _j$[ebp]
	add	ecx, 1
	mov	DWORD PTR _j$[ebp], ecx
$L70356:
	mov	edx, DWORD PTR _childlist$[ebp]
	cmp	DWORD PTR [edx], 0
	je	SHORT $L70358
	mov	eax, DWORD PTR _childlist$[ebp]
	mov	ecx, DWORD PTR _j$[ebp]
	cmp	ecx, DWORD PTR [eax]
	ja	SHORT $L70358

; 180  : 				if(!dyntab_cmp(&form->ctrl[i].id, 0, 0, childlist, j - 1, 0))

	push	0
	mov	edx, DWORD PTR _j$[ebp]
	sub	edx, 1
	push	edx
	mov	eax, DWORD PTR _childlist$[ebp]
	push	eax
	push	0
	push	0
	mov	ecx, DWORD PTR _i$[ebp]
	imul	ecx, 480				; 000001e0H
	mov	edx, DWORD PTR _form$[ebp]
	mov	eax, DWORD PTR [edx]
	add	eax, ecx
	push	eax
	call	_dyntab_cmp
	add	esp, 24					; 00000018H
	test	eax, eax
	jne	SHORT $L70359

; 181  : 					dyntab_del_rows(childlist, --j, 1);

	push	1
	mov	ecx, DWORD PTR _j$[ebp]
	sub	ecx, 1
	mov	DWORD PTR _j$[ebp], ecx
	mov	edx, DWORD PTR _j$[ebp]
	push	edx
	mov	eax, DWORD PTR _childlist$[ebp]
	push	eax
	call	_dyntab_del_rows
	add	esp, 12					; 0000000cH
$L70359:

; 182  : 
; 183  : 		/* Read children objects data */
; 184  : 		for(i = 0; i < childlist->nbrows && !cntxt->b_terminate; i++)

	jmp	SHORT $L70357
$L70358:
	jmp	$L70354
$L70355:
	mov	DWORD PTR _i$[ebp], 0
	jmp	SHORT $L70360
$L70361:
	mov	ecx, DWORD PTR _i$[ebp]
	add	ecx, 1
	mov	DWORD PTR _i$[ebp], ecx
$L70360:
	mov	edx, DWORD PTR _childlist$[ebp]
	mov	eax, DWORD PTR _i$[ebp]
	cmp	eax, DWORD PTR [edx]
	jae	$L70362
	mov	ecx, DWORD PTR _cntxt$[ebp]
	cmp	DWORD PTR [ecx+29776], 0
	jne	$L70362

; 186  : 			/* Add a new control in form list */
; 187  : 			CGIData *clickcgibtn;
; 188  : 			if(ctrl_add_new(cntxt, DYNTAB_TOULRC(childlist, i, 0), &i_newctrl)) STACK_ERROR;

	lea	edx, DWORD PTR _i_newctrl$[ebp]
	push	edx
	push	10					; 0000000aH
	push	0
	push	0
	mov	eax, DWORD PTR _i$[ebp]
	push	eax
	mov	ecx, DWORD PTR _childlist$[ebp]
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
	je	SHORT $L70365
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 188		; 000000bcH
	jmp	$eva_err$70366
$L70365:

; 189  : 
; 190  : 			/* Store controls tree chaining */
; 191  : 			ctrl = form->ctrl + i_ctrl;

	mov	ecx, DWORD PTR _i_ctrl$[ebp]
	imul	ecx, 480				; 000001e0H
	mov	edx, DWORD PTR _form$[ebp]
	mov	eax, DWORD PTR [edx]
	add	eax, ecx
	mov	DWORD PTR _ctrl$[ebp], eax

; 192  : 			newctrl = form->ctrl + i_newctrl;

	mov	ecx, DWORD PTR _i_newctrl$[ebp]
	imul	ecx, 480				; 000001e0H
	mov	edx, DWORD PTR _form$[ebp]
	mov	eax, DWORD PTR [edx]
	add	eax, ecx
	mov	DWORD PTR _newctrl$[ebp], eax

; 193  : 			newctrl->i_parent = i_ctrl;

	mov	ecx, DWORD PTR _newctrl$[ebp]
	mov	edx, DWORD PTR _i_ctrl$[ebp]
	mov	DWORD PTR [ecx+20], edx

; 194  : 			if(!ctrl->i_child) ctrl->i_child = i_newctrl;

	mov	eax, DWORD PTR _ctrl$[ebp]
	cmp	DWORD PTR [eax+24], 0
	jne	SHORT $L70367
	mov	ecx, DWORD PTR _ctrl$[ebp]
	mov	edx, DWORD PTR _i_newctrl$[ebp]
	mov	DWORD PTR [ecx+24], edx
$L70367:

; 195  : 			if(i_prevctrl) form->ctrl[i_prevctrl].i_brother = i_newctrl;

	cmp	DWORD PTR _i_prevctrl$[ebp], 0
	je	SHORT $L70368
	mov	eax, DWORD PTR _i_prevctrl$[ebp]
	imul	eax, 480				; 000001e0H
	mov	ecx, DWORD PTR _form$[ebp]
	mov	edx, DWORD PTR [ecx]
	mov	ecx, DWORD PTR _i_newctrl$[ebp]
	mov	DWORD PTR [edx+eax+28], ecx
$L70368:

; 196  : 			i_prevctrl = i_newctrl;

	mov	edx, DWORD PTR _i_newctrl$[ebp]
	mov	DWORD PTR _i_prevctrl$[ebp], edx

; 197  : 
; 198  : 			/* Set control clicked condition */
; 199  : 			clickcgibtn = cntxt->cgi ? cntxt->cgi + cntxt->cgibtn : NULL;

	mov	eax, DWORD PTR _cntxt$[ebp]
	cmp	DWORD PTR [eax+29648], 0
	je	SHORT $L71685
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	edx, DWORD PTR [ecx+29656]
	imul	edx, 56					; 00000038H
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	ecx, DWORD PTR [eax+29648]
	add	ecx, edx
	mov	DWORD PTR -40+[ebp], ecx
	jmp	SHORT $L71686
$L71685:
	mov	DWORD PTR -40+[ebp], 0
$L71686:
	mov	edx, DWORD PTR -40+[ebp]
	mov	DWORD PTR _clickcgibtn$70363[ebp], edx

; 200  : 			if(cgi_build_basename(cntxt, &newctrl->cginame, i_newctrl, 'C')) STACK_ERROR;

	push	67					; 00000043H
	mov	eax, DWORD PTR _i_newctrl$[ebp]
	push	eax
	mov	ecx, DWORD PTR _newctrl$[ebp]
	add	ecx, 40					; 00000028H
	push	ecx
	mov	edx, DWORD PTR _cntxt$[ebp]
	push	edx
	call	_cgi_build_basename
	add	esp, 16					; 00000010H
	test	eax, eax
	je	SHORT $L70370
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 200		; 000000c8H
	jmp	$eva_err$70366
$L70370:

; 201  : 			if(clickcgibtn && newctrl->cginame->cnt <= clickcgibtn->name_sz &&
; 202  : 				!strncmp(clickcgibtn->name + 1, newctrl->cginame->data + 1, newctrl->cginame->cnt - 1))

	cmp	DWORD PTR _clickcgibtn$70363[ebp], 0
	je	SHORT $L70371
	mov	ecx, DWORD PTR _newctrl$[ebp]
	mov	edx, DWORD PTR [ecx+40]
	mov	eax, DWORD PTR _clickcgibtn$70363[ebp]
	mov	ecx, DWORD PTR [edx+4]
	cmp	ecx, DWORD PTR [eax+4]
	ja	SHORT $L70371
	mov	edx, DWORD PTR _newctrl$[ebp]
	mov	eax, DWORD PTR [edx+40]
	mov	ecx, DWORD PTR [eax+4]
	sub	ecx, 1
	push	ecx
	mov	edx, DWORD PTR _newctrl$[ebp]
	mov	eax, DWORD PTR [edx+40]
	add	eax, 9
	push	eax
	mov	ecx, DWORD PTR _clickcgibtn$70363[ebp]
	mov	edx, DWORD PTR [ecx]
	add	edx, 1
	push	edx
	call	_strncmp
	add	esp, 12					; 0000000cH
	test	eax, eax
	jne	SHORT $L70371

; 203  : 				cntxt->form->i_ctrl_clic = i_newctrl;

	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	ecx, DWORD PTR [eax+80]
	mov	edx, DWORD PTR _i_newctrl$[ebp]
	mov	DWORD PTR [ecx+124], edx
$L70371:

; 204  : 
; 205  : 			/* Call control handler */
; 206  : 			CTRL_PRI_HDLR(i_newctrl);

	cmp	DWORD PTR _i_newctrl$[ebp], 0
	je	SHORT $L70373
	mov	eax, DWORD PTR _i_newctrl$[ebp]
	push	eax
	mov	ecx, DWORD PTR _cntxt$[ebp]
	push	ecx
	call	_ctrl_primary_handler
	add	esp, 8
	test	eax, eax
	je	SHORT $L70373
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 206		; 000000ceH
	jmp	$eva_err$70366
$L70373:

; 207  : 			newctrl = form->ctrl + i_newctrl;

	mov	eax, DWORD PTR _i_newctrl$[ebp]
	imul	eax, 480				; 000001e0H
	mov	ecx, DWORD PTR _form$[ebp]
	mov	edx, DWORD PTR [ecx]
	add	edx, eax
	mov	DWORD PTR _newctrl$[ebp], edx

; 208  : 
; 209  : 			/* Set CGI name if not set by handler */
; 210  : 			if(!newctrl->cginame && cgi_build_basename(cntxt, &newctrl->cginame, i_newctrl, 'C'))

	mov	eax, DWORD PTR _newctrl$[ebp]
	cmp	DWORD PTR [eax+40], 0
	jne	SHORT $L70374
	push	67					; 00000043H
	mov	ecx, DWORD PTR _i_newctrl$[ebp]
	push	ecx
	mov	edx, DWORD PTR _newctrl$[ebp]
	add	edx, 40					; 00000028H
	push	edx
	mov	eax, DWORD PTR _cntxt$[ebp]
	push	eax
	call	_cgi_build_basename
	add	esp, 16					; 00000010H
	test	eax, eax
	je	SHORT $L70374

; 211  : 				STACK_ERROR;

	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 211		; 000000d3H
	jmp	$eva_err$70366
$L70374:

; 212  : 		}

	jmp	$L70361
$L70362:

; 213  : 		break;

	jmp	$eva_noerr$70342
$L70375:

; 214  : 
; 215  : 	default:
; 216  : 		/* Call control handler for each child */
; 217  : 		if(childlist)

	cmp	DWORD PTR _childlist$[ebp], 0
	je	$L70376

; 219  : 			for(i = 0; i < childlist->nbrows && !cntxt->b_terminate; i++)

	mov	DWORD PTR _i$[ebp], 0
	jmp	SHORT $L70377
$L70378:
	mov	edx, DWORD PTR _i$[ebp]
	add	edx, 1
	mov	DWORD PTR _i$[ebp], edx
$L70377:
	mov	eax, DWORD PTR _childlist$[ebp]
	mov	ecx, DWORD PTR _i$[ebp]
	cmp	ecx, DWORD PTR [eax]
	jae	SHORT $L70379
	mov	edx, DWORD PTR _cntxt$[ebp]
	cmp	DWORD PTR [edx+29776], 0
	jne	SHORT $L70379

; 221  : 				/* Search control & call control handler if found */
; 222  : 				j = ctrl_from_id(cntxt, i_ctrl, DYNTAB_VAL_SZ(childlist, i, 0));

	push	0
	mov	eax, DWORD PTR _i$[ebp]
	push	eax
	mov	ecx, DWORD PTR _childlist$[ebp]
	push	ecx
	call	_dyntab_sz
	add	esp, 12					; 0000000cH
	push	eax
	push	0
	mov	edx, DWORD PTR _i$[ebp]
	push	edx
	mov	eax, DWORD PTR _childlist$[ebp]
	push	eax
	call	_dyntab_val
	add	esp, 12					; 0000000cH
	push	eax
	mov	ecx, DWORD PTR _i_ctrl$[ebp]
	push	ecx
	mov	edx, DWORD PTR _cntxt$[ebp]
	push	edx
	call	_ctrl_from_id
	add	esp, 16					; 00000010H
	mov	DWORD PTR _j$[ebp], eax

; 223  : 				if(j) CTRL_PRI_HDLR(j);

	cmp	DWORD PTR _j$[ebp], 0
	je	SHORT $L70382
	cmp	DWORD PTR _j$[ebp], 0
	je	SHORT $L70382
	mov	eax, DWORD PTR _j$[ebp]
	push	eax
	mov	ecx, DWORD PTR _cntxt$[ebp]
	push	ecx
	call	_ctrl_primary_handler
	add	esp, 8
	test	eax, eax
	je	SHORT $L70382
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 223		; 000000dfH
	jmp	SHORT $eva_err$70366
$L70382:

; 224  : 			}

	jmp	$L70378
$L70379:

; 226  : 		else

	jmp	SHORT $L70386
$L70376:

; 228  : 			for(i = ctrl->i_child; i && !cntxt->b_terminate; i = form->ctrl[i].i_brother)

	mov	eax, DWORD PTR _ctrl$[ebp]
	mov	ecx, DWORD PTR [eax+24]
	mov	DWORD PTR _i$[ebp], ecx
	jmp	SHORT $L70384
$L70385:
	mov	edx, DWORD PTR _i$[ebp]
	imul	edx, 480				; 000001e0H
	mov	eax, DWORD PTR _form$[ebp]
	mov	ecx, DWORD PTR [eax]
	mov	edx, DWORD PTR [ecx+edx+28]
	mov	DWORD PTR _i$[ebp], edx
$L70384:
	cmp	DWORD PTR _i$[ebp], 0
	je	SHORT $L70386
	mov	eax, DWORD PTR _cntxt$[ebp]
	cmp	DWORD PTR [eax+29776], 0
	jne	SHORT $L70386

; 229  : 				CTRL_PRI_HDLR(i);

	cmp	DWORD PTR _i$[ebp], 0
	je	SHORT $L70388
	mov	ecx, DWORD PTR _i$[ebp]
	push	ecx
	mov	edx, DWORD PTR _cntxt$[ebp]
	push	edx
	call	_ctrl_primary_handler
	add	esp, 8
	test	eax, eax
	je	SHORT $L70388
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 229		; 000000e5H
	jmp	SHORT $eva_err$70366
$L70388:
	jmp	SHORT $L70385
$L70386:
$eva_noerr$70342:

; 232  : 
; 233  : 	RETURN_OK_CLEANUP;

	push	0
	push	OFFSET FLAT:$SG70389
	push	OFFSET FLAT:$SG70390
	mov	ecx, DWORD PTR _cntxt$[ebp]
	push	ecx
	call	_err_clear
	add	esp, 16					; 00000010H
$eva_err$70366:
	mov	edx, DWORD PTR _cntxt$[ebp]
	cmp	DWORD PTR [edx+29872], 0
	je	SHORT $L70391
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	ecx, DWORD PTR [eax+29900]
	push	ecx
	push	OFFSET FLAT:$SG70392
	push	OFFSET FLAT:$SG70393
	mov	edx, DWORD PTR _cntxt$[ebp]
	push	edx
	call	_err_add_context
	add	esp, 16					; 00000010H
$L70391:
	mov	eax, DWORD PTR _cntxt$[ebp]
	xor	ecx, ecx
	cmp	DWORD PTR [eax+29872], 0
	setne	cl
	mov	eax, ecx

; 234  : }

	mov	esp, ebp
	pop	ebp
	ret	0
_ctrl_add_child ENDP
_TEXT	ENDS
PUBLIC	_ctrl_set_attr
EXTRN	_dyntab_copy:NEAR
_DATA	SEGMENT
	ORG $+1
$SG70421 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70423 DB	'D:\Travail\ABI\EVA\V4.0\CGI\Brunix-2016\ctrl_utils.c', 00H
	ORG $+3
$SG70424 DB	'ctrl_set_attr', 00H
	ORG $+2
$SG70426 DB	'D:\Travail\ABI\EVA\V4.0\CGI\Brunix-2016\ctrl_utils.c', 00H
	ORG $+3
$SG70427 DB	'ctrl_set_attr', 00H
_DATA	ENDS
_TEXT	SEGMENT
_cntxt$ = 8
_ctrl$ = 12
_attr$ = 16
_data$ = 20
_i$ = -4
_cell$70413 = -8
_ctrl_set_attr PROC NEAR

; 249  : ){

	push	ebp
	mov	ebp, esp
	sub	esp, 8

; 250  : 	unsigned long i;
; 251  : 
; 252  : 	if(!ctrl || !attr || !*attr) RETURN_OK;

	cmp	DWORD PTR _ctrl$[ebp], 0
	je	SHORT $L70408
	cmp	DWORD PTR _attr$[ebp], 0
	je	SHORT $L70408
	mov	eax, DWORD PTR _attr$[ebp]
	movsx	ecx, BYTE PTR [eax]
	test	ecx, ecx
	jne	SHORT $L70407
$L70408:
	jmp	$eva_noerr$70409
$L70407:

; 253  : 
; 254  : 	/* Remove attribute's current values (set field name to null string) */
; 255  : 	for(i = 0; i < ctrl->attr.nbrows; i++)

	mov	DWORD PTR _i$[ebp], 0
	jmp	SHORT $L70410
$L70411:
	mov	edx, DWORD PTR _i$[ebp]
	add	edx, 1
	mov	DWORD PTR _i$[ebp], edx
$L70410:
	mov	eax, DWORD PTR _ctrl$[ebp]
	mov	ecx, DWORD PTR _i$[ebp]
	cmp	ecx, DWORD PTR [eax+44]
	jae	SHORT $L70412

; 257  : 		DynTableCell *cell = dyntab_cell(&ctrl->attr, i, 0);

	push	0
	mov	edx, DWORD PTR _i$[ebp]
	push	edx
	mov	eax, DWORD PTR _ctrl$[ebp]
	add	eax, 44					; 0000002cH
	push	eax
	call	_dyntab_cell
	add	esp, 12					; 0000000cH
	mov	DWORD PTR _cell$70413[ebp], eax

; 258  : 		if(cell->field && !strcmp(attr, cell->field))

	mov	ecx, DWORD PTR _cell$70413[ebp]
	cmp	DWORD PTR [ecx+8], 0
	je	SHORT $L70414
	mov	edx, DWORD PTR _cell$70413[ebp]
	mov	eax, DWORD PTR [edx+8]
	push	eax
	mov	ecx, DWORD PTR _attr$[ebp]
	push	ecx
	call	_strcmp
	add	esp, 8
	test	eax, eax
	jne	SHORT $L70414

; 259  : 			cell->field[0] = 0;

	mov	edx, DWORD PTR _cell$70413[ebp]
	mov	eax, DWORD PTR [edx+8]
	mov	BYTE PTR [eax], 0
$L70414:

; 260  : 	}

	jmp	SHORT $L70411
$L70412:

; 261  : 
; 262  : 	/* Add attribute's new values */
; 263  : 	if(data)

	cmp	DWORD PTR _data$[ebp], 0
	je	SHORT $eva_noerr$70409

; 264  : 		for(i = 0; i < data->nbrows; i++)

	mov	DWORD PTR _i$[ebp], 0
	jmp	SHORT $L70416
$L70417:
	mov	ecx, DWORD PTR _i$[ebp]
	add	ecx, 1
	mov	DWORD PTR _i$[ebp], ecx
$L70416:
	mov	edx, DWORD PTR _data$[ebp]
	mov	eax, DWORD PTR _i$[ebp]
	cmp	eax, DWORD PTR [edx]
	jae	SHORT $eva_noerr$70409

; 265  : 			if(dyntab_copy(&ctrl->attr, ctrl->attr.nbrows, 0, dyntab_cell(data, i, 0), 1))

	push	1
	push	0
	mov	ecx, DWORD PTR _i$[ebp]
	push	ecx
	mov	edx, DWORD PTR _data$[ebp]
	push	edx
	call	_dyntab_cell
	add	esp, 12					; 0000000cH
	push	eax
	push	0
	mov	eax, DWORD PTR _ctrl$[ebp]
	mov	ecx, DWORD PTR [eax+44]
	push	ecx
	mov	edx, DWORD PTR _ctrl$[ebp]
	add	edx, 44					; 0000002cH
	push	edx
	call	_dyntab_copy
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L70419

; 266  : 				RETURN_ERR_MEMORY;

	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29872], OFFSET FLAT:$SG70421
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 266		; 0000010aH
	jmp	SHORT $eva_err$70422
$L70419:
	jmp	SHORT $L70417
$eva_noerr$70409:

; 267  : 
; 268  : 	RETURN_OK_CLEANUP;

	push	0
	push	OFFSET FLAT:$SG70423
	push	OFFSET FLAT:$SG70424
	mov	edx, DWORD PTR _cntxt$[ebp]
	push	edx
	call	_err_clear
	add	esp, 16					; 00000010H
$eva_err$70422:
	mov	eax, DWORD PTR _cntxt$[ebp]
	cmp	DWORD PTR [eax+29872], 0
	je	SHORT $L70425
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	edx, DWORD PTR [ecx+29900]
	push	edx
	push	OFFSET FLAT:$SG70426
	push	OFFSET FLAT:$SG70427
	mov	eax, DWORD PTR _cntxt$[ebp]
	push	eax
	call	_err_add_context
	add	esp, 16					; 00000010H
$L70425:
	mov	ecx, DWORD PTR _cntxt$[ebp]
	xor	eax, eax
	cmp	DWORD PTR [ecx+29872], 0
	setne	al

; 269  : }

	mov	esp, ebp
	pop	ebp
	ret	0
_ctrl_set_attr ENDP
_TEXT	ENDS
PUBLIC	_ctrl_set_attr_txt
EXTRN	_dyntab_free:NEAR
_DATA	SEGMENT
	ORG $+2
$SG70447 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70452 DB	'D:\Travail\ABI\EVA\V4.0\CGI\Brunix-2016\ctrl_utils.c', 00H
	ORG $+3
$SG70453 DB	'ctrl_set_attr_txt', 00H
	ORG $+2
$SG70455 DB	'D:\Travail\ABI\EVA\V4.0\CGI\Brunix-2016\ctrl_utils.c', 00H
	ORG $+3
$SG70456 DB	'ctrl_set_attr_txt', 00H
_DATA	ENDS
_TEXT	SEGMENT
_cntxt$ = 8
_ctrl$ = 12
_attr$ = 16
_txt$ = 20
_len$ = 24
_tval$ = -20
_cell$ = -24
_ctrl_set_attr_txt PROC NEAR

; 284  : ){

	push	ebp
	mov	ebp, esp
	sub	esp, 24					; 00000018H

; 285  : 	DynTable tval = { 0 };

	mov	DWORD PTR _tval$[ebp], 0
	xor	eax, eax
	mov	DWORD PTR _tval$[ebp+4], eax
	mov	DWORD PTR _tval$[ebp+8], eax
	mov	DWORD PTR _tval$[ebp+12], eax
	mov	DWORD PTR _tval$[ebp+16], eax

; 286  : 	DynTableCell *cell;
; 287  : 
; 288  : 	if(dyntab_add(&tval, 0, 0, txt, len, NO_CONV)) RETURN_ERR_MEMORY;

	push	0
	push	0
	mov	ecx, DWORD PTR _len$[ebp]
	push	ecx
	mov	edx, DWORD PTR _txt$[ebp]
	push	edx
	push	0
	push	0
	lea	eax, DWORD PTR _tval$[ebp]
	push	eax
	call	_dyntab_add
	add	esp, 28					; 0000001cH
	test	eax, eax
	je	SHORT $L70445
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29872], OFFSET FLAT:$SG70447
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 288		; 00000120H
	jmp	$eva_err$70448
$L70445:

; 289  : 	cell = dyntab_cell(&tval, 0, 0);

	push	0
	push	0
	lea	eax, DWORD PTR _tval$[ebp]
	push	eax
	call	_dyntab_cell
	add	esp, 12					; 0000000cH
	mov	DWORD PTR _cell$[ebp], eax

; 290  : 	cell->field = attr;

	mov	ecx, DWORD PTR _cell$[ebp]
	mov	edx, DWORD PTR _attr$[ebp]
	mov	DWORD PTR [ecx+8], edx

; 291  : 	cell->b_dontfreefield = 1;

	mov	eax, DWORD PTR _cell$[ebp]
	mov	BYTE PTR [eax+15], 1

; 292  : 	cell->IdObj = DYNTAB_TOUL(&ctrl->id);

	push	10					; 0000000aH
	push	0
	push	0
	push	0
	mov	ecx, DWORD PTR _ctrl$[ebp]
	push	ecx
	call	_dyntab_val
	add	esp, 12					; 0000000cH
	push	eax
	call	_strtoul
	add	esp, 12					; 0000000cH
	mov	edx, DWORD PTR _cell$[ebp]
	mov	DWORD PTR [edx+20], eax

; 293  : 	if(ctrl_set_attr(cntxt, ctrl, attr, &tval)) STACK_ERROR;

	lea	eax, DWORD PTR _tval$[ebp]
	push	eax
	mov	ecx, DWORD PTR _attr$[ebp]
	push	ecx
	mov	edx, DWORD PTR _ctrl$[ebp]
	push	edx
	mov	eax, DWORD PTR _cntxt$[ebp]
	push	eax
	call	_ctrl_set_attr
	add	esp, 16					; 00000010H
	test	eax, eax
	je	SHORT $eva_noerr$70451
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 293		; 00000125H
	jmp	SHORT $eva_err$70448
$eva_noerr$70451:

; 294  : 
; 295  : 	RETURN_OK_CLEANUP;

	push	0
	push	OFFSET FLAT:$SG70452
	push	OFFSET FLAT:$SG70453
	mov	edx, DWORD PTR _cntxt$[ebp]
	push	edx
	call	_err_clear
	add	esp, 16					; 00000010H
$eva_err$70448:
	mov	eax, DWORD PTR _cntxt$[ebp]
	cmp	DWORD PTR [eax+29872], 0
	je	SHORT $L70454
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	edx, DWORD PTR [ecx+29900]
	push	edx
	push	OFFSET FLAT:$SG70455
	push	OFFSET FLAT:$SG70456
	mov	eax, DWORD PTR _cntxt$[ebp]
	push	eax
	call	_err_add_context
	add	esp, 16					; 00000010H
$L70454:
	lea	ecx, DWORD PTR _tval$[ebp]
	push	ecx
	call	_dyntab_free
	add	esp, 4
	mov	edx, DWORD PTR _cntxt$[ebp]
	xor	eax, eax
	cmp	DWORD PTR [edx+29872], 0
	setne	al

; 296  : }

	mov	esp, ebp
	pop	ebp
	ret	0
_ctrl_set_attr_txt ENDP
_TEXT	ENDS
PUBLIC	_ctrl_check_error_status
EXTRN	_ctrl_eval_fieldexpr:NEAR
EXTRN	_dyntab_filter_field:NEAR
EXTRN	_dyntab_field_val:NEAR
EXTRN	_dyntab_order_lines:NEAR
_BSS	SEGMENT
$SG70477 DB	01H DUP (?)
_BSS	ENDS
_DATA	SEGMENT
	ORG $+2
$SG70476 DB	'_EVA_MULTIPLE', 00H
	ORG $+2
$SG70487 DB	'No', 00H
	ORG $+1
$SG70491 DB	0aH, 00H
	ORG $+2
$SG70493 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70497 DB	'Vous devez s', 0e9H, 'lectionner une seule valeur', 00H
	ORG $+3
$SG70499 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70502 DB	'Yes', 00H
$SG70508 DB	'_EVA_CONDITION', 00H
	ORG $+1
$SG70511 DB	'_EVA_CHECK_EXPR', 00H
$SG70513 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70516 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70519 DB	'_EVA_ERR_STATUS', 00H
$SG70521 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70524 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70528 DB	'_EVA_ERRMSG', 00H
$SG70530 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70533 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70537 DB	'_EVA_DEBUG_SQL_EXPR', 00H
$SG70539 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70542 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70555 DB	'%lu', 00H
$SG70559 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70562 DB	'D:\Travail\ABI\EVA\V4.0\CGI\Brunix-2016\ctrl_utils.c', 00H
	ORG $+3
$SG70563 DB	'ctrl_check_error_status', 00H
$SG70571 DB	'0', 00H
	ORG $+2
$SG70574 DB	'0', 00H
	ORG $+2
$SG70576 DB	'1', 00H
	ORG $+2
$SG70578 DB	'1', 00H
	ORG $+2
$SG70579 DB	'Yes', 00H
$SG70580 DB	'No', 00H
	ORG $+1
$SG70582 DB	'Saisie obligatoire', 00H
	ORG $+1
$SG70583 DB	'Saisie recommand', 0e9H, 'e', 00H
	ORG $+1
$SG70587 DB	0aH, 00H
	ORG $+2
$SG70589 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70593 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70595 DB	'Yes', 00H
$SG70596 DB	'No', 00H
	ORG $+1
$SG70601 DB	0aH, 00H
	ORG $+2
$SG70603 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70606 DB	'Saisie obligatoire', 00H
	ORG $+1
$SG70607 DB	'Saisie recommand', 0e9H, 'e', 00H
	ORG $+1
$SG70609 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70610 DB	'D:\Travail\ABI\EVA\V4.0\CGI\Brunix-2016\ctrl_utils.c', 00H
	ORG $+3
$SG70611 DB	'ctrl_check_error_status', 00H
$SG70613 DB	'D:\Travail\ABI\EVA\V4.0\CGI\Brunix-2016\ctrl_utils.c', 00H
	ORG $+3
$SG70614 DB	'ctrl_check_error_status', 00H
_DATA	ENDS
_TEXT	SEGMENT
_cntxt$ = 8
_ctrl$ = 12
_form$ = -4
_res$ = -56
_chkexpr$ = -36
_status$ = -108
_message$ = -80
_debug$ = -128
_i$ = -60
_j$ = -84
_k$ = -88
_cnt$ = -8
_multiple$ = -16
_b_editable$ = -12
_sql_trace$70546 = -140
_val$70547 = -132
_stat$70548 = -136
_msg$70549 = -144
__tmp$70553 = -176
_c$70567 = -180
_ctrl_check_error_status PROC NEAR

; 313  : ){

	push	ebp
	mov	ebp, esp
	sub	esp, 204				; 000000ccH
	push	edi

; 314  : 	EVA_form *form = cntxt->form;

	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	ecx, DWORD PTR [eax+80]
	mov	DWORD PTR _form$[ebp], ecx

; 315  : 	DynTable res = {0};

	mov	DWORD PTR _res$[ebp], 0
	xor	edx, edx
	mov	DWORD PTR _res$[ebp+4], edx
	mov	DWORD PTR _res$[ebp+8], edx
	mov	DWORD PTR _res$[ebp+12], edx
	mov	DWORD PTR _res$[ebp+16], edx

; 316  : 	DynTable chkexpr = {0};

	mov	DWORD PTR _chkexpr$[ebp], 0
	xor	eax, eax
	mov	DWORD PTR _chkexpr$[ebp+4], eax
	mov	DWORD PTR _chkexpr$[ebp+8], eax
	mov	DWORD PTR _chkexpr$[ebp+12], eax
	mov	DWORD PTR _chkexpr$[ebp+16], eax

; 317  : 	DynTable status = {0};

	mov	DWORD PTR _status$[ebp], 0
	xor	ecx, ecx
	mov	DWORD PTR _status$[ebp+4], ecx
	mov	DWORD PTR _status$[ebp+8], ecx
	mov	DWORD PTR _status$[ebp+12], ecx
	mov	DWORD PTR _status$[ebp+16], ecx

; 318  : 	DynTable message = {0};

	mov	DWORD PTR _message$[ebp], 0
	xor	edx, edx
	mov	DWORD PTR _message$[ebp+4], edx
	mov	DWORD PTR _message$[ebp+8], edx
	mov	DWORD PTR _message$[ebp+12], edx
	mov	DWORD PTR _message$[ebp+16], edx

; 319  : 	DynTable debug = {0};

	mov	DWORD PTR _debug$[ebp], 0
	xor	eax, eax
	mov	DWORD PTR _debug$[ebp+4], eax
	mov	DWORD PTR _debug$[ebp+8], eax
	mov	DWORD PTR _debug$[ebp+12], eax
	mov	DWORD PTR _debug$[ebp+16], eax

; 320  : 	unsigned long i, j, k, cnt;
; 321  : 	char *multiple = CTRL_ATTR_VAL(MULTIPLE);

	cmp	DWORD PTR _ctrl$[ebp], 0
	je	SHORT $L71690
	push	0
	push	-1
	push	OFFSET FLAT:$SG70476
	mov	ecx, DWORD PTR _ctrl$[ebp]
	add	ecx, 44					; 0000002cH
	push	ecx
	call	_dyntab_field_val
	add	esp, 16					; 00000010H
	mov	DWORD PTR -184+[ebp], eax
	jmp	SHORT $L71691
$L71690:
	mov	DWORD PTR -184+[ebp], OFFSET FLAT:$SG70477
$L71691:
	mov	edx, DWORD PTR -184+[ebp]
	mov	DWORD PTR _multiple$[ebp], edx

; 322  : 	int b_editable;
; 323  : 
; 324  : 	/* Return if no check needed */
; 325  : 	if(!ctrl->storage) RETURN_OK;

	mov	eax, DWORD PTR _ctrl$[ebp]
	cmp	DWORD PTR [eax+36], 0
	jne	SHORT $L70479
	jmp	$eva_noerr$70480
$L70479:

; 326  : 
; 327  : 	/* Check if editable in parents - return if not */
; 328  : 	b_editable = ctrl->access & AccessEdit && form->ctrl->access & (form->b_newobj ? AccessCreate : AccessEdit);

	mov	ecx, DWORD PTR _ctrl$[ebp]
	mov	edx, DWORD PTR [ecx+184]
	and	edx, 2
	test	edx, edx
	je	SHORT $L71692
	mov	eax, DWORD PTR _form$[ebp]
	mov	ecx, DWORD PTR [eax]
	mov	edx, DWORD PTR _form$[ebp]
	mov	eax, DWORD PTR [edx+72]
	neg	eax
	sbb	eax, eax
	and	eax, 2
	add	eax, 2
	mov	ecx, DWORD PTR [ecx+184]
	and	ecx, eax
	test	ecx, ecx
	je	SHORT $L71692
	mov	DWORD PTR -188+[ebp], 1
	jmp	SHORT $L71693
$L71692:
	mov	DWORD PTR -188+[ebp], 0
$L71693:
	mov	edx, DWORD PTR -188+[ebp]
	mov	DWORD PTR _b_editable$[ebp], edx

; 329  : 	for(i = ctrl->i_parent; i && b_editable; i = form->ctrl[i].i_parent)

	mov	eax, DWORD PTR _ctrl$[ebp]
	mov	ecx, DWORD PTR [eax+20]
	mov	DWORD PTR _i$[ebp], ecx
	jmp	SHORT $L70481
$L70482:
	mov	edx, DWORD PTR _i$[ebp]
	imul	edx, 480				; 000001e0H
	mov	eax, DWORD PTR _form$[ebp]
	mov	ecx, DWORD PTR [eax]
	mov	edx, DWORD PTR [ecx+edx+20]
	mov	DWORD PTR _i$[ebp], edx
$L70481:
	cmp	DWORD PTR _i$[ebp], 0
	je	SHORT $L70483
	cmp	DWORD PTR _b_editable$[ebp], 0
	je	SHORT $L70483

; 330  : 		b_editable = (form->ctrl[i].access & AccessEdit) != 0;

	mov	eax, DWORD PTR _i$[ebp]
	imul	eax, 480				; 000001e0H
	mov	ecx, DWORD PTR _form$[ebp]
	mov	edx, DWORD PTR [ecx]
	mov	eax, DWORD PTR [edx+eax+184]
	and	eax, 2
	neg	eax
	sbb	eax, eax
	neg	eax
	mov	DWORD PTR _b_editable$[ebp], eax
	jmp	SHORT $L70482
$L70483:

; 331  : 	if(!b_editable) RETURN_OK;

	cmp	DWORD PTR _b_editable$[ebp], 0
	jne	SHORT $L70484
	jmp	$eva_noerr$70480
$L70484:

; 332  : 
; 333  : 	/* Check for multiple values */
; 334  : 	if((!*multiple || !strcmp("No", multiple)) && ctrl->val.nbrows > 1)

	mov	ecx, DWORD PTR _multiple$[ebp]
	movsx	edx, BYTE PTR [ecx]
	test	edx, edx
	je	SHORT $L70486
	mov	eax, DWORD PTR _multiple$[ebp]
	push	eax
	push	OFFSET FLAT:$SG70487
	call	_strcmp
	add	esp, 8
	test	eax, eax
	jne	$L70485
$L70486:
	mov	ecx, DWORD PTR _ctrl$[ebp]
	cmp	DWORD PTR [ecx+64], 1
	jbe	$L70485

; 336  : 		ctrl->error = 2;

	mov	edx, DWORD PTR _ctrl$[ebp]
	mov	DWORD PTR [edx+212], 2

; 337  : 		if(ctrl->errmsg) DYNBUF_ADD_STR(&ctrl->errmsg, "\n");

	mov	eax, DWORD PTR _ctrl$[ebp]
	cmp	DWORD PTR [eax+216], 0
	je	SHORT $L70490
	push	0
	push	0
	push	1
	push	OFFSET FLAT:$SG70491
	mov	ecx, DWORD PTR _ctrl$[ebp]
	add	ecx, 216				; 000000d8H
	push	ecx
	call	_dynbuf_add
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L70490
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29872], OFFSET FLAT:$SG70493
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 337		; 00000151H
	jmp	$eva_err$70494
$L70490:

; 338  : 		DYNBUF_ADD_STR(&ctrl->errmsg, "Vous devez sélectionner une seule valeur");

	push	0
	push	0
	push	40					; 00000028H
	push	OFFSET FLAT:$SG70497
	mov	ecx, DWORD PTR _ctrl$[ebp]
	add	ecx, 216				; 000000d8H
	push	ecx
	call	_dynbuf_add
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L70496
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29872], OFFSET FLAT:$SG70499
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 338		; 00000152H
	jmp	$eva_err$70494
$L70496:

; 339  : 		RETURN_OK;

	jmp	$eva_noerr$70480
$L70485:

; 341  : 
; 342  : 	if(!*ctrl->ALLOWEMPTY || !strcmp("Yes", ctrl->ALLOWEMPTY)) RETURN_OK;

	mov	ecx, DWORD PTR _ctrl$[ebp]
	mov	edx, DWORD PTR [ecx+340]
	movsx	eax, BYTE PTR [edx]
	test	eax, eax
	je	SHORT $L70501
	mov	ecx, DWORD PTR _ctrl$[ebp]
	mov	edx, DWORD PTR [ecx+340]
	push	edx
	push	OFFSET FLAT:$SG70502
	call	_strcmp
	add	esp, 8
	test	eax, eax
	jne	SHORT $L70500
$L70501:
	jmp	$eva_noerr$70480
$L70500:

; 343  : 
; 344  : 	/* Count # of non empty values */
; 345  : 	for(i = 0, cnt = 0; i < ctrl->val.nbrows; i++)

	mov	DWORD PTR _i$[ebp], 0
	mov	DWORD PTR _cnt$[ebp], 0
	jmp	SHORT $L70503
$L70504:
	mov	eax, DWORD PTR _i$[ebp]
	add	eax, 1
	mov	DWORD PTR _i$[ebp], eax
$L70503:
	mov	ecx, DWORD PTR _ctrl$[ebp]
	mov	edx, DWORD PTR _i$[ebp]
	cmp	edx, DWORD PTR [ecx+64]
	jae	SHORT $L70505

; 346  : 		if(dyntab_sz(&ctrl->val, i, 0)) cnt++;

	push	0
	mov	eax, DWORD PTR _i$[ebp]
	push	eax
	mov	ecx, DWORD PTR _ctrl$[ebp]
	add	ecx, 64					; 00000040H
	push	ecx
	call	_dyntab_sz
	add	esp, 12					; 0000000cH
	test	eax, eax
	je	SHORT $L70506
	mov	edx, DWORD PTR _cnt$[ebp]
	add	edx, 1
	mov	DWORD PTR _cnt$[ebp], edx
$L70506:

; 347  : 
; 348  : 	/* Handle condition */
; 349  : 	if(!strcmp("_EVA_CONDITION", ctrl->ALLOWEMPTY))

	jmp	SHORT $L70504
$L70505:
	mov	eax, DWORD PTR _ctrl$[ebp]
	mov	ecx, DWORD PTR [eax+340]
	push	ecx
	push	OFFSET FLAT:$SG70508
	call	_strcmp
	add	esp, 8
	test	eax, eax
	jne	$L70594

; 351  : 		/* Read conditions */
; 352  : 		CTRL_ATTR_TAB(chkexpr, CHECK_EXPR);

	lea	edx, DWORD PTR _chkexpr$[ebp]
	push	edx
	call	_dyntab_free
	add	esp, 4
	push	0
	push	-1
	push	OFFSET FLAT:$SG70511
	mov	eax, DWORD PTR _ctrl$[ebp]
	add	eax, 44					; 0000002cH
	push	eax
	push	0
	lea	ecx, DWORD PTR _chkexpr$[ebp]
	push	ecx
	call	_dyntab_filter_field
	add	esp, 24					; 00000018H
	test	eax, eax
	je	SHORT $L70510
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29872], OFFSET FLAT:$SG70513
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 352		; 00000160H
	jmp	$eva_err$70494
$L70510:
	lea	ecx, DWORD PTR _chkexpr$[ebp]
	push	ecx
	call	_dyntab_order_lines
	add	esp, 4
	test	eax, eax
	je	SHORT $L70514
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29872], OFFSET FLAT:$SG70516
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 352		; 00000160H
	jmp	$eva_err$70494
$L70514:

; 353  : 		k = chkexpr.nbrows;

	mov	ecx, DWORD PTR _chkexpr$[ebp]
	mov	DWORD PTR _k$[ebp], ecx

; 354  : 		CTRL_ATTR_TAB(status, ERR_STATUS);

	lea	edx, DWORD PTR _status$[ebp]
	push	edx
	call	_dyntab_free
	add	esp, 4
	push	0
	push	-1
	push	OFFSET FLAT:$SG70519
	mov	eax, DWORD PTR _ctrl$[ebp]
	add	eax, 44					; 0000002cH
	push	eax
	push	0
	lea	ecx, DWORD PTR _status$[ebp]
	push	ecx
	call	_dyntab_filter_field
	add	esp, 24					; 00000018H
	test	eax, eax
	je	SHORT $L70518
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29872], OFFSET FLAT:$SG70521
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 354		; 00000162H
	jmp	$eva_err$70494
$L70518:
	lea	ecx, DWORD PTR _status$[ebp]
	push	ecx
	call	_dyntab_order_lines
	add	esp, 4
	test	eax, eax
	je	SHORT $L70522
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29872], OFFSET FLAT:$SG70524
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 354		; 00000162H
	jmp	$eva_err$70494
$L70522:

; 355  : 		if(k < status.nbrows) k = status.nbrows;

	mov	ecx, DWORD PTR _k$[ebp]
	cmp	ecx, DWORD PTR _status$[ebp]
	jae	SHORT $L70525
	mov	edx, DWORD PTR _status$[ebp]
	mov	DWORD PTR _k$[ebp], edx
$L70525:

; 356  : 		CTRL_ATTR_TAB(message, ERRMSG);

	lea	eax, DWORD PTR _message$[ebp]
	push	eax
	call	_dyntab_free
	add	esp, 4
	push	0
	push	-1
	push	OFFSET FLAT:$SG70528
	mov	ecx, DWORD PTR _ctrl$[ebp]
	add	ecx, 44					; 0000002cH
	push	ecx
	push	0
	lea	edx, DWORD PTR _message$[ebp]
	push	edx
	call	_dyntab_filter_field
	add	esp, 24					; 00000018H
	test	eax, eax
	je	SHORT $L70527
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29872], OFFSET FLAT:$SG70530
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 356		; 00000164H
	jmp	$eva_err$70494
$L70527:
	lea	edx, DWORD PTR _message$[ebp]
	push	edx
	call	_dyntab_order_lines
	add	esp, 4
	test	eax, eax
	je	SHORT $L70531
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29872], OFFSET FLAT:$SG70533
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 356		; 00000164H
	jmp	$eva_err$70494
$L70531:

; 357  : 		if(k < message.nbrows) k = message.nbrows;

	mov	edx, DWORD PTR _k$[ebp]
	cmp	edx, DWORD PTR _message$[ebp]
	jae	SHORT $L70534
	mov	eax, DWORD PTR _message$[ebp]
	mov	DWORD PTR _k$[ebp], eax
$L70534:

; 358  : 		CTRL_ATTR_TAB(debug, DEBUG_SQL_EXPR);

	lea	ecx, DWORD PTR _debug$[ebp]
	push	ecx
	call	_dyntab_free
	add	esp, 4
	push	0
	push	-1
	push	OFFSET FLAT:$SG70537
	mov	edx, DWORD PTR _ctrl$[ebp]
	add	edx, 44					; 0000002cH
	push	edx
	push	0
	lea	eax, DWORD PTR _debug$[ebp]
	push	eax
	call	_dyntab_filter_field
	add	esp, 24					; 00000018H
	test	eax, eax
	je	SHORT $L70536
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29872], OFFSET FLAT:$SG70539
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 358		; 00000166H
	jmp	$eva_err$70494
$L70536:
	lea	eax, DWORD PTR _debug$[ebp]
	push	eax
	call	_dyntab_order_lines
	add	esp, 4
	test	eax, eax
	je	SHORT $L70540
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29872], OFFSET FLAT:$SG70542
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 358		; 00000166H
	jmp	$eva_err$70494
$L70540:

; 359  : 
; 360  : 		/* Process each line */
; 361  : 		for(i = 0; i < k; i++)

	mov	DWORD PTR _i$[ebp], 0
	jmp	SHORT $L70543
$L70544:
	mov	eax, DWORD PTR _i$[ebp]
	add	eax, 1
	mov	DWORD PTR _i$[ebp], eax
$L70543:
	mov	ecx, DWORD PTR _i$[ebp]
	cmp	ecx, DWORD PTR _k$[ebp]
	jae	$L70545

; 363  : 			/* Evaluate condition if applicable */
; 364  : 			int sql_trace = cntxt->sql_trace;

	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	eax, DWORD PTR [edx+29852]
	mov	DWORD PTR _sql_trace$70546[ebp], eax

; 365  : 			char *val, *stat = dyntab_val(&status, i, 0), *msg = dyntab_val(&message, i, 0);

	push	0
	mov	ecx, DWORD PTR _i$[ebp]
	push	ecx
	lea	edx, DWORD PTR _status$[ebp]
	push	edx
	call	_dyntab_val
	add	esp, 12					; 0000000cH
	mov	DWORD PTR _stat$70548[ebp], eax
	push	0
	mov	eax, DWORD PTR _i$[ebp]
	push	eax
	lea	ecx, DWORD PTR _message$[ebp]
	push	ecx
	call	_dyntab_val
	add	esp, 12					; 0000000cH
	mov	DWORD PTR _msg$70549[ebp], eax

; 366  : 			if(dyntab_sz(&debug, i, 0)) cntxt->sql_trace = DEBUG_SQL_RES;

	push	0
	mov	edx, DWORD PTR _i$[ebp]
	push	edx
	lea	eax, DWORD PTR _debug$[ebp]
	push	eax
	call	_dyntab_sz
	add	esp, 12					; 0000000cH
	test	eax, eax
	je	SHORT $L70550
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29852], 2
$L70550:

; 367  : 			if(!dyntab_sz(&chkexpr, i, 0))

	push	0
	mov	edx, DWORD PTR _i$[ebp]
	push	edx
	lea	eax, DWORD PTR _chkexpr$[ebp]
	push	eax
	call	_dyntab_sz
	add	esp, 12					; 0000000cH
	test	eax, eax
	jne	$L70551

; 369  : 				if(!*msg && !cnt) { ctrl->ALLOWEMPTY = stat; break; }

	mov	ecx, DWORD PTR _msg$70549[ebp]
	movsx	edx, BYTE PTR [ecx]
	test	edx, edx
	jne	SHORT $L70552
	cmp	DWORD PTR _cnt$[ebp], 0
	jne	SHORT $L70552
	mov	eax, DWORD PTR _ctrl$[ebp]
	mov	ecx, DWORD PTR _stat$70548[ebp]
	mov	DWORD PTR [eax+340], ecx
	jmp	$L70545
$L70552:

; 370  : 				DYNTAB_ADD_INT(&res, 0, 0, (long unsigned int)(cnt ? 0 : 1));

	mov	BYTE PTR __tmp$70553[ebp], 0
	mov	ecx, 7
	xor	eax, eax
	lea	edi, DWORD PTR __tmp$70553[ebp+1]
	rep stosd
	stosw
	stosb
	xor	edx, edx
	cmp	DWORD PTR _cnt$[ebp], 0
	sete	dl
	push	edx
	push	OFFSET FLAT:$SG70555
	lea	eax, DWORD PTR __tmp$70553[ebp]
	push	eax
	call	_sprintf
	add	esp, 12					; 0000000cH
	push	0
	push	0
	push	0
	lea	ecx, DWORD PTR __tmp$70553[ebp]
	push	ecx
	push	0
	push	0
	lea	edx, DWORD PTR _res$[ebp]
	push	edx
	call	_dyntab_add
	add	esp, 28					; 0000001cH
	test	eax, eax
	je	SHORT $L70557
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29872], OFFSET FLAT:$SG70559
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 370		; 00000172H
	jmp	$eva_err$70494
$L70557:

; 372  : 			else if(ctrl_eval_fieldexpr(cntxt, ctrl, &res, dyntab_val(&chkexpr, i, 0))) CLEAR_ERROR;

	jmp	SHORT $L70561
$L70551:
	push	0
	mov	edx, DWORD PTR _i$[ebp]
	push	edx
	lea	eax, DWORD PTR _chkexpr$[ebp]
	push	eax
	call	_dyntab_val
	add	esp, 12					; 0000000cH
	push	eax
	lea	ecx, DWORD PTR _res$[ebp]
	push	ecx
	mov	edx, DWORD PTR _ctrl$[ebp]
	push	edx
	mov	eax, DWORD PTR _cntxt$[ebp]
	push	eax
	call	_ctrl_eval_fieldexpr
	add	esp, 16					; 00000010H
	test	eax, eax
	je	SHORT $L70561
	push	372					; 00000174H
	push	OFFSET FLAT:$SG70562
	push	OFFSET FLAT:$SG70563
	mov	ecx, DWORD PTR _cntxt$[ebp]
	push	ecx
	call	_err_clear
	add	esp, 16					; 00000010H
$L70561:

; 373  : 			cntxt->sql_trace = sql_trace;

	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	eax, DWORD PTR _sql_trace$70546[ebp]
	mov	DWORD PTR [edx+29852], eax

; 374  : 
; 375  : 			/* Handle result - OR multiple values */
; 376  : 			val = dyntab_val(&res, 0, 0);

	push	0
	push	0
	lea	ecx, DWORD PTR _res$[ebp]
	push	ecx
	call	_dyntab_val
	add	esp, 12					; 0000000cH
	mov	DWORD PTR _val$70547[ebp], eax

; 377  : 			for(j = 1; j < res.nbrows; j++)

	mov	DWORD PTR _j$[ebp], 1
	jmp	SHORT $L70564
$L70565:
	mov	edx, DWORD PTR _j$[ebp]
	add	edx, 1
	mov	DWORD PTR _j$[ebp], edx
$L70564:
	mov	eax, DWORD PTR _j$[ebp]
	cmp	eax, DWORD PTR _res$[ebp]
	jae	$L70566

; 379  : 				DynTableCell *c = dyntab_cell(&res, j, 0);

	push	0
	mov	ecx, DWORD PTR _j$[ebp]
	push	ecx
	lea	edx, DWORD PTR _res$[ebp]
	push	edx
	call	_dyntab_cell
	add	esp, 12					; 0000000cH
	mov	DWORD PTR _c$70567[ebp], eax

; 380  : 				if((!cntxt->form->Line || !c->Line || c->Line == cntxt->form->Line) &&
; 381  : 					(!cntxt->form->Num || !c->Num || c->Num == cntxt->form->Num) &&
; 382  : 					c->txt && c->txt[0] && strcmp(c->txt, "0"))

	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	ecx, DWORD PTR [eax+80]
	cmp	DWORD PTR [ecx+240], 0
	je	SHORT $L70569
	mov	edx, DWORD PTR _c$70567[ebp]
	cmp	DWORD PTR [edx+40], 0
	je	SHORT $L70569
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	ecx, DWORD PTR [eax+80]
	mov	edx, DWORD PTR _c$70567[ebp]
	mov	eax, DWORD PTR [edx+40]
	cmp	eax, DWORD PTR [ecx+240]
	jne	SHORT $L70568
$L70569:
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	edx, DWORD PTR [ecx+80]
	cmp	DWORD PTR [edx+236], 0
	je	SHORT $L70570
	mov	eax, DWORD PTR _c$70567[ebp]
	cmp	DWORD PTR [eax+36], 0
	je	SHORT $L70570
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	edx, DWORD PTR [ecx+80]
	mov	eax, DWORD PTR _c$70567[ebp]
	mov	ecx, DWORD PTR [eax+36]
	cmp	ecx, DWORD PTR [edx+236]
	jne	SHORT $L70568
$L70570:
	mov	edx, DWORD PTR _c$70567[ebp]
	cmp	DWORD PTR [edx], 0
	je	SHORT $L70568
	mov	eax, DWORD PTR _c$70567[ebp]
	mov	ecx, DWORD PTR [eax]
	movsx	edx, BYTE PTR [ecx]
	test	edx, edx
	je	SHORT $L70568
	push	OFFSET FLAT:$SG70571
	mov	eax, DWORD PTR _c$70567[ebp]
	mov	ecx, DWORD PTR [eax]
	push	ecx
	call	_strcmp
	add	esp, 8
	test	eax, eax
	je	SHORT $L70568

; 384  : 					val = c->txt;

	mov	edx, DWORD PTR _c$70567[ebp]
	mov	eax, DWORD PTR [edx]
	mov	DWORD PTR _val$70547[ebp], eax

; 385  : 					break;

	jmp	SHORT $L70566
$L70568:

; 387  : 			}

	jmp	$L70565
$L70566:

; 388  : 
; 389  : 			/* Handle result - continue if condition not matched */
; 390  : 			if(!*val || !strcmp(val, "0")) continue;

	mov	ecx, DWORD PTR _val$70547[ebp]
	movsx	edx, BYTE PTR [ecx]
	test	edx, edx
	je	SHORT $L70573
	push	OFFSET FLAT:$SG70574
	mov	eax, DWORD PTR _val$70547[ebp]
	push	eax
	call	_strcmp
	add	esp, 8
	test	eax, eax
	jne	SHORT $L70572
$L70573:
	jmp	$L70544
$L70572:

; 391  : 
; 392  : 			/* Condition matched : handle status & message */
; 393  : 			if(!*stat && !strcmp(val, "1")) RETURN_OK;

	mov	ecx, DWORD PTR _stat$70548[ebp]
	movsx	edx, BYTE PTR [ecx]
	test	edx, edx
	jne	SHORT $L70575
	push	OFFSET FLAT:$SG70576
	mov	eax, DWORD PTR _val$70547[ebp]
	push	eax
	call	_strcmp
	add	esp, 8
	test	eax, eax
	jne	SHORT $L70575
	jmp	$eva_noerr$70480
$L70575:

; 394  : 			if(!*msg && strcmp(val, "1")) msg =  val;

	mov	ecx, DWORD PTR _msg$70549[ebp]
	movsx	edx, BYTE PTR [ecx]
	test	edx, edx
	jne	SHORT $L70577
	push	OFFSET FLAT:$SG70578
	mov	eax, DWORD PTR _val$70547[ebp]
	push	eax
	call	_strcmp
	add	esp, 8
	test	eax, eax
	je	SHORT $L70577
	mov	ecx, DWORD PTR _val$70547[ebp]
	mov	DWORD PTR _msg$70549[ebp], ecx
$L70577:

; 395  : 			ctrl->error = !strcmp(stat, "Yes") ? 0 : strcmp(stat, "No") ? 1 : 2;

	push	OFFSET FLAT:$SG70579
	mov	edx, DWORD PTR _stat$70548[ebp]
	push	edx
	call	_strcmp
	add	esp, 8
	test	eax, eax
	jne	SHORT $L71694
	mov	DWORD PTR -192+[ebp], 0
	jmp	SHORT $L71695
$L71694:
	push	OFFSET FLAT:$SG70580
	mov	eax, DWORD PTR _stat$70548[ebp]
	push	eax
	call	_strcmp
	add	esp, 8
	neg	eax
	sbb	eax, eax
	add	eax, 2
	mov	DWORD PTR -192+[ebp], eax
$L71695:
	mov	ecx, DWORD PTR _ctrl$[ebp]
	mov	edx, DWORD PTR -192+[ebp]
	mov	DWORD PTR [ecx+212], edx

; 396  : 			if(!*msg && ctrl->error) msg = ctrl->error & 2 ? "Saisie obligatoire" : "Saisie recommandée";

	mov	eax, DWORD PTR _msg$70549[ebp]
	movsx	ecx, BYTE PTR [eax]
	test	ecx, ecx
	jne	SHORT $L70581
	mov	edx, DWORD PTR _ctrl$[ebp]
	cmp	DWORD PTR [edx+212], 0
	je	SHORT $L70581
	mov	eax, DWORD PTR _ctrl$[ebp]
	mov	ecx, DWORD PTR [eax+212]
	and	ecx, 2
	test	ecx, ecx
	je	SHORT $L71696
	mov	DWORD PTR -196+[ebp], OFFSET FLAT:$SG70582
	jmp	SHORT $L71697
$L71696:
	mov	DWORD PTR -196+[ebp], OFFSET FLAT:$SG70583
$L71697:
	mov	edx, DWORD PTR -196+[ebp]
	mov	DWORD PTR _msg$70549[ebp], edx
$L70581:

; 397  : 			if(ctrl->errmsg) DYNBUF_ADD_STR(&ctrl->errmsg, "\n");

	mov	eax, DWORD PTR _ctrl$[ebp]
	cmp	DWORD PTR [eax+216], 0
	je	SHORT $L70586
	push	0
	push	0
	push	1
	push	OFFSET FLAT:$SG70587
	mov	ecx, DWORD PTR _ctrl$[ebp]
	add	ecx, 216				; 000000d8H
	push	ecx
	call	_dynbuf_add
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L70586
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29872], OFFSET FLAT:$SG70589
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 397		; 0000018dH
	jmp	$eva_err$70494
$L70586:

; 398  : 			DYNBUF_ADD(&ctrl->errmsg, msg, 0, NO_CONV);

	push	0
	push	0
	push	0
	mov	ecx, DWORD PTR _msg$70549[ebp]
	push	ecx
	mov	edx, DWORD PTR _ctrl$[ebp]
	add	edx, 216				; 000000d8H
	push	edx
	call	_dynbuf_add
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L70591
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29872], OFFSET FLAT:$SG70593
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 398		; 0000018eH
	jmp	$eva_err$70494
$L70591:

; 399  : 			RETURN_OK;

	jmp	$eva_noerr$70480
$L70545:

; 401  : 		if(i == k) RETURN_OK;

	mov	edx, DWORD PTR _i$[ebp]
	cmp	edx, DWORD PTR _k$[ebp]
	jne	SHORT $L70594
	jmp	$eva_noerr$70480
$L70594:

; 403  : 
; 404  : 	/* Set error if applicable */
; 405  : 	ctrl->error = (cnt || !*ctrl->ALLOWEMPTY || !strcmp("Yes", ctrl->ALLOWEMPTY)) ? 0 : strcmp("No", ctrl->ALLOWEMPTY) ? 1 : 2;

	cmp	DWORD PTR _cnt$[ebp], 0
	jne	SHORT $L71698
	mov	eax, DWORD PTR _ctrl$[ebp]
	mov	ecx, DWORD PTR [eax+340]
	movsx	edx, BYTE PTR [ecx]
	test	edx, edx
	je	SHORT $L71698
	mov	eax, DWORD PTR _ctrl$[ebp]
	mov	ecx, DWORD PTR [eax+340]
	push	ecx
	push	OFFSET FLAT:$SG70595
	call	_strcmp
	add	esp, 8
	test	eax, eax
	je	SHORT $L71698
	mov	edx, DWORD PTR _ctrl$[ebp]
	mov	eax, DWORD PTR [edx+340]
	push	eax
	push	OFFSET FLAT:$SG70596
	call	_strcmp
	add	esp, 8
	neg	eax
	sbb	eax, eax
	add	eax, 2
	mov	DWORD PTR -200+[ebp], eax
	jmp	SHORT $L71699
$L71698:
	mov	DWORD PTR -200+[ebp], 0
$L71699:
	mov	ecx, DWORD PTR _ctrl$[ebp]
	mov	edx, DWORD PTR -200+[ebp]
	mov	DWORD PTR [ecx+212], edx

; 406  : 	if(ctrl->error)

	mov	eax, DWORD PTR _ctrl$[ebp]
	cmp	DWORD PTR [eax+212], 0
	je	$L70605

; 408  : 		if(ctrl->errmsg) DYNBUF_ADD_STR(&ctrl->errmsg, "\n");

	mov	ecx, DWORD PTR _ctrl$[ebp]
	cmp	DWORD PTR [ecx+216], 0
	je	SHORT $L70600
	push	0
	push	0
	push	1
	push	OFFSET FLAT:$SG70601
	mov	edx, DWORD PTR _ctrl$[ebp]
	add	edx, 216				; 000000d8H
	push	edx
	call	_dynbuf_add
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L70600
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29872], OFFSET FLAT:$SG70603
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 408		; 00000198H
	jmp	SHORT $eva_err$70494
$L70600:

; 409  : 		DYNBUF_ADD(&ctrl->errmsg, ctrl->error & 2 ? "Saisie obligatoire" : "Saisie recommandée", 0, NO_CONV);

	mov	edx, DWORD PTR _ctrl$[ebp]
	mov	eax, DWORD PTR [edx+212]
	and	eax, 2
	test	eax, eax
	je	SHORT $L71700
	mov	DWORD PTR -204+[ebp], OFFSET FLAT:$SG70606
	jmp	SHORT $L71701
$L71700:
	mov	DWORD PTR -204+[ebp], OFFSET FLAT:$SG70607
$L71701:
	push	0
	push	0
	push	0
	mov	ecx, DWORD PTR -204+[ebp]
	push	ecx
	mov	edx, DWORD PTR _ctrl$[ebp]
	add	edx, 216				; 000000d8H
	push	edx
	call	_dynbuf_add
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L70605
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29872], OFFSET FLAT:$SG70609
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 409		; 00000199H
	jmp	SHORT $eva_err$70494
$L70605:
$eva_noerr$70480:

; 411  : 
; 412  : 	RETURN_OK_CLEANUP;

	push	0
	push	OFFSET FLAT:$SG70610
	push	OFFSET FLAT:$SG70611
	mov	edx, DWORD PTR _cntxt$[ebp]
	push	edx
	call	_err_clear
	add	esp, 16					; 00000010H
$eva_err$70494:
	mov	eax, DWORD PTR _cntxt$[ebp]
	cmp	DWORD PTR [eax+29872], 0
	je	SHORT $L70612
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	edx, DWORD PTR [ecx+29900]
	push	edx
	push	OFFSET FLAT:$SG70613
	push	OFFSET FLAT:$SG70614
	mov	eax, DWORD PTR _cntxt$[ebp]
	push	eax
	call	_err_add_context
	add	esp, 16					; 00000010H
$L70612:
	lea	ecx, DWORD PTR _res$[ebp]
	push	ecx
	call	_dyntab_free
	add	esp, 4
	lea	edx, DWORD PTR _chkexpr$[ebp]
	push	edx
	call	_dyntab_free
	add	esp, 4
	lea	eax, DWORD PTR _status$[ebp]
	push	eax
	call	_dyntab_free
	add	esp, 4
	lea	ecx, DWORD PTR _message$[ebp]
	push	ecx
	call	_dyntab_free
	add	esp, 4
	lea	edx, DWORD PTR _debug$[ebp]
	push	edx
	call	_dyntab_free
	add	esp, 4
	mov	eax, DWORD PTR _cntxt$[ebp]
	xor	ecx, ecx
	cmp	DWORD PTR [eax+29872], 0
	setne	cl
	mov	eax, ecx

; 413  : }

	pop	edi
	mov	esp, ebp
	pop	ebp
	ret	0
_ctrl_check_error_status ENDP
_TEXT	ENDS
PUBLIC	_ctrl_add_opt_btn
EXTRN	_put_html_button_sz:NEAR
EXTRN	_put_html_img:NEAR
EXTRN	_dynbuf_add3:NEAR
_BSS	SEGMENT
	ALIGN	4

$SG70659 DB	01H DUP (?)
	ALIGN	4

$SG70660 DB	01H DUP (?)
	ALIGN	4

$SG70718 DB	01H DUP (?)
	ALIGN	4

$SG70725 DB	01H DUP (?)
	ALIGN	4

$SG70739 DB	01H DUP (?)
	ALIGN	4

$SG70740 DB	01H DUP (?)
	ALIGN	4

$SG70638 DB	01H DUP (?)
	ALIGN	4

$SG70639 DB	01H DUP (?)
	ALIGN	4

$SG70643 DB	01H DUP (?)
	ALIGN	4

$SG70644 DB	01H DUP (?)
	ALIGN	4

$SG70647 DB	01H DUP (?)
	ALIGN	4

$SG70648 DB	01H DUP (?)
_BSS	ENDS
_DATA	SEGMENT
$SG70636 DB	'_EVA_ALWAYS', 00H
$SG70637 DB	'_EVA_ALWAYS', 00H
$SG70641 DB	'_EVA_NONE', 00H
	ORG $+2
$SG70642 DB	'_EVA_NONE', 00H
	ORG $+2
$SG70645 DB	'_EVA_EDIT', 00H
	ORG $+2
$SG70646 DB	'_EVA_EDIT', 00H
	ORG $+2
$SG70651 DB	']', 00H
	ORG $+2
$SG70652 DB	' [', 00H
	ORG $+1
$SG70654 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70657 DB	'_EVA_OPTION', 00H
$SG70658 DB	'_EVA_OPTION', 00H
$SG70663 DB	'_eva_opt_help_small.gif', 00H
$SG70665 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70668 DB	'_eva_opt_help_small_s.gif', 00H
	ORG $+2
$SG70670 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70679 DB	'_eva_blink_orange.gif', 00H
	ORG $+2
$SG70681 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70684 DB	'_eva_btn_helpbook_s.gif', 00H
$SG70686 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70690 DB	'_eva_blink_red.gif', 00H
	ORG $+1
$SG70692 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70695 DB	'_eva_btn_helpbook_s.gif', 00H
$SG70697 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70701 DB	'_eva_btn_helpbook.gif', 00H
	ORG $+2
$SG70703 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70706 DB	'_eva_btn_helpbook_s.gif', 00H
$SG70708 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70719 DB	' - ', 00H
$SG70721 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70726 DB	0aH, 0aH, 00H
	ORG $+1
$SG70728 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70732 DB	']', 00H
	ORG $+2
$SG70733 DB	0aH, 0aH, 'Cliquez pour plus d''informations sur [', 00H
	ORG $+3
$SG70735 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70737 DB	'_EVA_TITLE', 00H
	ORG $+1
$SG70738 DB	'_EVA_TITLE', 00H
	ORG $+1
$SG70744 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70749 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70752 DB	'Infos', 00H
	ORG $+2
$SG70759 DB	'D:\Travail\ABI\EVA\V4.0\CGI\Brunix-2016\ctrl_utils.c', 00H
	ORG $+3
$SG70760 DB	'ctrl_add_opt_btn', 00H
	ORG $+3
$SG70762 DB	'D:\Travail\ABI\EVA\V4.0\CGI\Brunix-2016\ctrl_utils.c', 00H
	ORG $+3
$SG70763 DB	'ctrl_add_opt_btn', 00H
_DATA	ENDS
_TEXT	SEGMENT
_i$70710 = -28
_cntxt$ = 8
_ctrl$ = 12
_form$ = -12
_tooltip$ = -20
_cginame$ = -24
_image$ = -16
_imgsel$ = -8
_b_button$ = -4
_ctrl_add_opt_btn PROC NEAR

; 429  : ){

	push	ebp
	mov	ebp, esp
	sub	esp, 84					; 00000054H

; 430  : 	EVA_form *form = cntxt->form;

	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	ecx, DWORD PTR [eax+80]
	mov	DWORD PTR _form$[ebp], ecx

; 431  : 	DynBuffer *tooltip = NULL;

	mov	DWORD PTR _tooltip$[ebp], 0

; 432  : 	DynBuffer *cginame = NULL;

	mov	DWORD PTR _cginame$[ebp], 0

; 433  : 	DynBuffer *image = NULL;

	mov	DWORD PTR _image$[ebp], 0

; 434  : 	DynBuffer *imgsel = NULL;

	mov	DWORD PTR _imgsel$[ebp], 0

; 435  : 	int b_button = cntxt->opt_btn_mode == OptBtn_OpenSame || cntxt->opt_btn_mode ==  OptBtn_OpenBottom;

	mov	edx, DWORD PTR _cntxt$[ebp]
	cmp	DWORD PTR [edx+29588], 2
	je	SHORT $L71703
	mov	eax, DWORD PTR _cntxt$[ebp]
	cmp	DWORD PTR [eax+29588], 3
	je	SHORT $L71703
	mov	DWORD PTR -32+[ebp], 0
	jmp	SHORT $L71704
$L71703:
	mov	DWORD PTR -32+[ebp], 1
$L71704:
	mov	ecx, DWORD PTR -32+[ebp]
	mov	DWORD PTR _b_button$[ebp], ecx

; 436  : 
; 437  : 	if(form->step == HtmlPrint) RETURN_OK;

	mov	edx, DWORD PTR _form$[ebp]
	cmp	DWORD PTR [edx+176], 7
	jne	SHORT $L70633
	jmp	$eva_noerr$70634
$L70633:

; 438  : 	if(STRCMPNUL(ctrl->OPTIONBUTTON, "_EVA_ALWAYS") && !b_button && !ctrl->error && (
; 439  : 		!STRCMPNUL(ctrl->OPTIONBUTTON, "_EVA_NONE") ||
; 440  : 		!(ctrl->NOTES && *ctrl->NOTES) ||
; 441  : 		(!STRCMPNUL(ctrl->OPTIONBUTTON, "_EVA_EDIT") && form && form->step != HtmlEdit) ))

	mov	eax, OFFSET FLAT:$SG70636
	test	eax, eax
	je	SHORT $L71705
	mov	DWORD PTR -36+[ebp], OFFSET FLAT:$SG70637
	jmp	SHORT $L71706
$L71705:
	mov	DWORD PTR -36+[ebp], OFFSET FLAT:$SG70638
$L71706:
	mov	ecx, DWORD PTR _ctrl$[ebp]
	cmp	DWORD PTR [ecx+336], 0
	je	SHORT $L71707
	mov	edx, DWORD PTR _ctrl$[ebp]
	mov	eax, DWORD PTR [edx+336]
	mov	DWORD PTR -40+[ebp], eax
	jmp	SHORT $L71708
$L71707:
	mov	DWORD PTR -40+[ebp], OFFSET FLAT:$SG70639
$L71708:
	mov	ecx, DWORD PTR -36+[ebp]
	push	ecx
	mov	edx, DWORD PTR -40+[ebp]
	push	edx
	call	_strcmp
	add	esp, 8
	test	eax, eax
	je	$L70635
	cmp	DWORD PTR _b_button$[ebp], 0
	jne	$L70635
	mov	eax, DWORD PTR _ctrl$[ebp]
	cmp	DWORD PTR [eax+212], 0
	jne	$L70635
	mov	ecx, OFFSET FLAT:$SG70641
	test	ecx, ecx
	je	SHORT $L71709
	mov	DWORD PTR -44+[ebp], OFFSET FLAT:$SG70642
	jmp	SHORT $L71710
$L71709:
	mov	DWORD PTR -44+[ebp], OFFSET FLAT:$SG70643
$L71710:
	mov	edx, DWORD PTR _ctrl$[ebp]
	cmp	DWORD PTR [edx+336], 0
	je	SHORT $L71711
	mov	eax, DWORD PTR _ctrl$[ebp]
	mov	ecx, DWORD PTR [eax+336]
	mov	DWORD PTR -48+[ebp], ecx
	jmp	SHORT $L71712
$L71711:
	mov	DWORD PTR -48+[ebp], OFFSET FLAT:$SG70644
$L71712:
	mov	edx, DWORD PTR -44+[ebp]
	push	edx
	mov	eax, DWORD PTR -48+[ebp]
	push	eax
	call	_strcmp
	add	esp, 8
	test	eax, eax
	je	SHORT $L70640
	mov	ecx, DWORD PTR _ctrl$[ebp]
	cmp	DWORD PTR [ecx+288], 0
	je	SHORT $L70640
	mov	edx, DWORD PTR _ctrl$[ebp]
	mov	eax, DWORD PTR [edx+288]
	movsx	ecx, BYTE PTR [eax]
	test	ecx, ecx
	je	SHORT $L70640
	mov	edx, OFFSET FLAT:$SG70645
	test	edx, edx
	je	SHORT $L71713
	mov	DWORD PTR -52+[ebp], OFFSET FLAT:$SG70646
	jmp	SHORT $L71714
$L71713:
	mov	DWORD PTR -52+[ebp], OFFSET FLAT:$SG70647
$L71714:
	mov	eax, DWORD PTR _ctrl$[ebp]
	cmp	DWORD PTR [eax+336], 0
	je	SHORT $L71715
	mov	ecx, DWORD PTR _ctrl$[ebp]
	mov	edx, DWORD PTR [ecx+336]
	mov	DWORD PTR -56+[ebp], edx
	jmp	SHORT $L71716
$L71715:
	mov	DWORD PTR -56+[ebp], OFFSET FLAT:$SG70648
$L71716:
	mov	eax, DWORD PTR -52+[ebp]
	push	eax
	mov	ecx, DWORD PTR -56+[ebp]
	push	ecx
	call	_strcmp
	add	esp, 8
	test	eax, eax
	jne	SHORT $L70635
	cmp	DWORD PTR _form$[ebp], 0
	je	SHORT $L70635
	mov	edx, DWORD PTR _form$[ebp]
	cmp	DWORD PTR [edx+176], 4
	je	SHORT $L70635
$L70640:

; 442  : 		RETURN_OK;

	jmp	$eva_noerr$70634
$L70635:

; 443  : 
; 444  : 	DYNBUF_ADD3(&tooltip, " [", ctrl->LABEL, 0, NO_CONV, "]");

	push	1
	push	OFFSET FLAT:$SG70651
	push	0
	push	0
	push	0
	mov	eax, DWORD PTR _ctrl$[ebp]
	mov	ecx, DWORD PTR [eax+284]
	push	ecx
	push	2
	push	OFFSET FLAT:$SG70652
	lea	edx, DWORD PTR _tooltip$[ebp]
	push	edx
	call	_dynbuf_add3
	add	esp, 36					; 00000024H
	test	eax, eax
	je	SHORT $L70650
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29872], OFFSET FLAT:$SG70654
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 444		; 000001bcH
	jmp	$eva_err$70655
$L70650:

; 445  : 
; 446  : 
; 447  : 	/* Button images depend error status & control type */
; 448  : 	if(!STRCMPNUL(ctrl->CONTROL, "_EVA_OPTION"))

	mov	edx, OFFSET FLAT:$SG70657
	test	edx, edx
	je	SHORT $L71717
	mov	DWORD PTR -60+[ebp], OFFSET FLAT:$SG70658
	jmp	SHORT $L71718
$L71717:
	mov	DWORD PTR -60+[ebp], OFFSET FLAT:$SG70659
$L71718:
	mov	eax, DWORD PTR _ctrl$[ebp]
	cmp	DWORD PTR [eax+272], 0
	je	SHORT $L71719
	mov	ecx, DWORD PTR _ctrl$[ebp]
	mov	edx, DWORD PTR [ecx+272]
	mov	DWORD PTR -64+[ebp], edx
	jmp	SHORT $L71720
$L71719:
	mov	DWORD PTR -64+[ebp], OFFSET FLAT:$SG70660
$L71720:
	mov	eax, DWORD PTR -60+[ebp]
	push	eax
	mov	ecx, DWORD PTR -64+[ebp]
	push	ecx
	call	_strcmp
	add	esp, 8
	test	eax, eax
	jne	SHORT $L70656

; 450  : 		DYNBUF_ADD_STR(&image, "_eva_opt_help_small.gif");

	push	0
	push	0
	push	23					; 00000017H
	push	OFFSET FLAT:$SG70663
	lea	edx, DWORD PTR _image$[ebp]
	push	edx
	call	_dynbuf_add
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L70662
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29872], OFFSET FLAT:$SG70665
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 450		; 000001c2H
	jmp	$eva_err$70655
$L70662:

; 451  : 		DYNBUF_ADD_STR(&imgsel, "_eva_opt_help_small_s.gif");

	push	0
	push	0
	push	25					; 00000019H
	push	OFFSET FLAT:$SG70668
	lea	edx, DWORD PTR _imgsel$[ebp]
	push	edx
	call	_dynbuf_add
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L70667
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29872], OFFSET FLAT:$SG70670
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 451		; 000001c3H
	jmp	$eva_err$70655
$L70667:

; 453  : 	else switch(ctrl->error)

	jmp	$L70673
$L70656:

; 454  : 	{

	mov	edx, DWORD PTR _ctrl$[ebp]
	mov	eax, DWORD PTR [edx+212]
	mov	DWORD PTR -68+[ebp], eax
	cmp	DWORD PTR -68+[ebp], 1
	je	SHORT $L70676
	cmp	DWORD PTR -68+[ebp], 2
	je	SHORT $L70687
	jmp	$L70698
$L70676:

; 455  : 	case 1:
; 456  : 		DYNBUF_ADD_STR(&image, "_eva_blink_orange.gif");

	push	0
	push	0
	push	21					; 00000015H
	push	OFFSET FLAT:$SG70679
	lea	ecx, DWORD PTR _image$[ebp]
	push	ecx
	call	_dynbuf_add
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L70678
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29872], OFFSET FLAT:$SG70681
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 456		; 000001c8H
	jmp	$eva_err$70655
$L70678:

; 457  : 		DYNBUF_ADD_STR(&imgsel, "_eva_btn_helpbook_s.gif");

	push	0
	push	0
	push	23					; 00000017H
	push	OFFSET FLAT:$SG70684
	lea	ecx, DWORD PTR _imgsel$[ebp]
	push	ecx
	call	_dynbuf_add
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L70683
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29872], OFFSET FLAT:$SG70686
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 457		; 000001c9H
	jmp	$eva_err$70655
$L70683:

; 458  : 		break;

	jmp	$L70673
$L70687:

; 459  : 	case 2:
; 460  : 		DYNBUF_ADD_STR(&image, "_eva_blink_red.gif");

	push	0
	push	0
	push	18					; 00000012H
	push	OFFSET FLAT:$SG70690
	lea	ecx, DWORD PTR _image$[ebp]
	push	ecx
	call	_dynbuf_add
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L70689
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29872], OFFSET FLAT:$SG70692
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 460		; 000001ccH
	jmp	$eva_err$70655
$L70689:

; 461  : 		DYNBUF_ADD_STR(&imgsel, "_eva_btn_helpbook_s.gif");

	push	0
	push	0
	push	23					; 00000017H
	push	OFFSET FLAT:$SG70695
	lea	ecx, DWORD PTR _imgsel$[ebp]
	push	ecx
	call	_dynbuf_add
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L70694
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29872], OFFSET FLAT:$SG70697
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 461		; 000001cdH
	jmp	$eva_err$70655
$L70694:

; 462  : 		break;

	jmp	SHORT $L70673
$L70698:

; 463  : 	default:
; 464  : 		DYNBUF_ADD_STR(&image, "_eva_btn_helpbook.gif");

	push	0
	push	0
	push	21					; 00000015H
	push	OFFSET FLAT:$SG70701
	lea	ecx, DWORD PTR _image$[ebp]
	push	ecx
	call	_dynbuf_add
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L70700
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29872], OFFSET FLAT:$SG70703
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 464		; 000001d0H
	jmp	$eva_err$70655
$L70700:

; 465  : 		DYNBUF_ADD_STR(&imgsel, "_eva_btn_helpbook_s.gif");

	push	0
	push	0
	push	23					; 00000017H
	push	OFFSET FLAT:$SG70706
	lea	ecx, DWORD PTR _imgsel$[ebp]
	push	ecx
	call	_dynbuf_add
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L70705
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29872], OFFSET FLAT:$SG70708
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 465		; 000001d1H
	jmp	$eva_err$70655
$L70705:
$L70673:

; 467  : 
; 468  : 	/* Check allowed user forms if any */
; 469  : 	if(b_button && cntxt->viewforms.nbrows)

	cmp	DWORD PTR _b_button$[ebp], 0
	je	SHORT $L70713
	mov	ecx, DWORD PTR _cntxt$[ebp]
	cmp	DWORD PTR [ecx+29592], 0
	je	SHORT $L70713

; 471  : 		unsigned long i;
; 472  : 		for(i = 0, b_button =0; !b_button && i < cntxt->viewforms.nbrows; i++)

	mov	DWORD PTR _i$70710[ebp], 0
	mov	DWORD PTR _b_button$[ebp], 0
	jmp	SHORT $L70711
$L70712:
	mov	edx, DWORD PTR _i$70710[ebp]
	add	edx, 1
	mov	DWORD PTR _i$70710[ebp], edx
$L70711:
	cmp	DWORD PTR _b_button$[ebp], 0
	jne	SHORT $L70713
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	ecx, DWORD PTR _i$70710[ebp]
	cmp	ecx, DWORD PTR [eax+29592]
	jae	SHORT $L70713

; 473  : 			b_button = !dyntab_cmp(&form->id_form, 0, 0, &cntxt->viewforms, i, 0);

	push	0
	mov	edx, DWORD PTR _i$70710[ebp]
	push	edx
	mov	eax, DWORD PTR _cntxt$[ebp]
	add	eax, 29592				; 00007398H
	push	eax
	push	0
	push	0
	mov	ecx, DWORD PTR _form$[ebp]
	add	ecx, 12					; 0000000cH
	push	ecx
	call	_dyntab_cmp
	add	esp, 24					; 00000018H
	neg	eax
	sbb	eax, eax
	inc	eax
	mov	DWORD PTR _b_button$[ebp], eax
	jmp	SHORT $L70712
$L70713:

; 475  : 
; 476  : 	/* Format button tooltip & CGI name */
; 477  : 	if(ctrl->errmsg) DYNBUF_ADD3_BUF(&tooltip, " - ", ctrl->errmsg, NO_CONV, "");

	mov	edx, DWORD PTR _ctrl$[ebp]
	cmp	DWORD PTR [edx+216], 0
	je	$L70717
	mov	eax, DWORD PTR _ctrl$[ebp]
	cmp	DWORD PTR [eax+216], 0
	je	SHORT $L71721
	mov	ecx, DWORD PTR _ctrl$[ebp]
	mov	edx, DWORD PTR [ecx+216]
	mov	eax, DWORD PTR [edx+4]
	mov	DWORD PTR -72+[ebp], eax
	jmp	SHORT $L71722
$L71721:
	mov	DWORD PTR -72+[ebp], 0
$L71722:
	mov	ecx, DWORD PTR _ctrl$[ebp]
	cmp	DWORD PTR [ecx+216], 0
	je	SHORT $L71723
	mov	edx, DWORD PTR _ctrl$[ebp]
	mov	eax, DWORD PTR [edx+216]
	add	eax, 8
	mov	DWORD PTR -76+[ebp], eax
	jmp	SHORT $L71724
$L71723:
	mov	DWORD PTR -76+[ebp], 0
$L71724:
	push	0
	push	OFFSET FLAT:$SG70718
	push	0
	push	0
	mov	ecx, DWORD PTR -72+[ebp]
	push	ecx
	mov	edx, DWORD PTR -76+[ebp]
	push	edx
	push	3
	push	OFFSET FLAT:$SG70719
	lea	eax, DWORD PTR _tooltip$[ebp]
	push	eax
	call	_dynbuf_add3
	add	esp, 36					; 00000024H
	test	eax, eax
	je	SHORT $L70717
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29872], OFFSET FLAT:$SG70721
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 477		; 000001ddH
	jmp	$eva_err$70655
$L70717:

; 478  : 	if(ctrl->NOTES && *ctrl->NOTES) DYNBUF_ADD3(&tooltip, "\n\n", ctrl->NOTES, 0, NO_CONV, "");

	mov	eax, DWORD PTR _ctrl$[ebp]
	cmp	DWORD PTR [eax+288], 0
	je	SHORT $L70724
	mov	ecx, DWORD PTR _ctrl$[ebp]
	mov	edx, DWORD PTR [ecx+288]
	movsx	eax, BYTE PTR [edx]
	test	eax, eax
	je	SHORT $L70724
	push	0
	push	OFFSET FLAT:$SG70725
	push	0
	push	0
	push	0
	mov	ecx, DWORD PTR _ctrl$[ebp]
	mov	edx, DWORD PTR [ecx+288]
	push	edx
	push	2
	push	OFFSET FLAT:$SG70726
	lea	eax, DWORD PTR _tooltip$[ebp]
	push	eax
	call	_dynbuf_add3
	add	esp, 36					; 00000024H
	test	eax, eax
	je	SHORT $L70724
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29872], OFFSET FLAT:$SG70728
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 478		; 000001deH
	jmp	$eva_err$70655
$L70724:

; 479  : 	if(b_button)

	cmp	DWORD PTR _b_button$[ebp], 0
	je	$L70729

; 481  : 		DYNBUF_ADD3(&tooltip, "\n\nCliquez pour plus d'informations sur [", ctrl->LABEL, 0, NO_CONV, "]");

	push	1
	push	OFFSET FLAT:$SG70732
	push	0
	push	0
	push	0
	mov	eax, DWORD PTR _ctrl$[ebp]
	mov	ecx, DWORD PTR [eax+284]
	push	ecx
	push	40					; 00000028H
	push	OFFSET FLAT:$SG70733
	lea	edx, DWORD PTR _tooltip$[ebp]
	push	edx
	call	_dynbuf_add3
	add	esp, 36					; 00000024H
	test	eax, eax
	je	SHORT $L70731
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29872], OFFSET FLAT:$SG70735
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 481		; 000001e1H
	jmp	$eva_err$70655
$L70731:

; 482  : 		if(STRCMPNUL(ctrl->TYPE, "_EVA_TITLE"))

	mov	edx, OFFSET FLAT:$SG70737
	test	edx, edx
	je	SHORT $L71725
	mov	DWORD PTR -80+[ebp], OFFSET FLAT:$SG70738
	jmp	SHORT $L71726
$L71725:
	mov	DWORD PTR -80+[ebp], OFFSET FLAT:$SG70739
$L71726:
	mov	eax, DWORD PTR _ctrl$[ebp]
	cmp	DWORD PTR [eax+276], 0
	je	SHORT $L71727
	mov	ecx, DWORD PTR _ctrl$[ebp]
	mov	edx, DWORD PTR [ecx+276]
	mov	DWORD PTR -84+[ebp], edx
	jmp	SHORT $L71728
$L71727:
	mov	DWORD PTR -84+[ebp], OFFSET FLAT:$SG70740
$L71728:
	mov	eax, DWORD PTR -80+[ebp]
	push	eax
	mov	ecx, DWORD PTR -84+[ebp]
	push	ecx
	call	_strcmp
	add	esp, 8
	test	eax, eax
	je	SHORT $L70736

; 483  : 			DYNBUF_ADD_BUF(&cginame, ctrl->cginame, NO_CONV)

	mov	edx, DWORD PTR _ctrl$[ebp]
	cmp	DWORD PTR [edx+40], 0
	je	SHORT $L70742
	push	0
	push	0
	mov	eax, DWORD PTR _ctrl$[ebp]
	mov	ecx, DWORD PTR [eax+40]
	mov	edx, DWORD PTR [ecx+4]
	push	edx
	mov	eax, DWORD PTR _ctrl$[ebp]
	mov	ecx, DWORD PTR [eax+40]
	add	ecx, 8
	push	ecx
	lea	edx, DWORD PTR _cginame$[ebp]
	push	edx
	call	_dynbuf_add
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L70742
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29872], OFFSET FLAT:$SG70744
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 483		; 000001e3H
	jmp	$eva_err$70655
$L70742:

; 484  : 		else

	jmp	SHORT $L70747
$L70736:

; 485  : 			DYNBUF_ADD_BUF(&cginame, form->ctrl->cginame, NO_CONV);

	mov	edx, DWORD PTR _form$[ebp]
	mov	eax, DWORD PTR [edx]
	cmp	DWORD PTR [eax+40], 0
	je	SHORT $L70747
	push	0
	push	0
	mov	ecx, DWORD PTR _form$[ebp]
	mov	edx, DWORD PTR [ecx]
	mov	eax, DWORD PTR [edx+40]
	mov	ecx, DWORD PTR [eax+4]
	push	ecx
	mov	edx, DWORD PTR _form$[ebp]
	mov	eax, DWORD PTR [edx]
	mov	ecx, DWORD PTR [eax+40]
	add	ecx, 8
	push	ecx
	lea	edx, DWORD PTR _cginame$[ebp]
	push	edx
	call	_dynbuf_add
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L70747
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29872], OFFSET FLAT:$SG70749
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 485		; 000001e5H
	jmp	$eva_err$70655
$L70747:

; 486  : 		*cginame->data = 'I';

	mov	edx, DWORD PTR _cginame$[ebp]
	mov	BYTE PTR [edx+8], 73			; 00000049H

; 487  : 
; 488  : 		if(put_html_button(cntxt, cginame->data, "Infos",
; 489  : 						image->data, imgsel->data, tooltip->data, 0, 4))

	push	4
	push	0
	push	0
	push	0
	push	0
	mov	eax, DWORD PTR _tooltip$[ebp]
	add	eax, 8
	push	eax
	mov	ecx, DWORD PTR _imgsel$[ebp]
	add	ecx, 8
	push	ecx
	mov	edx, DWORD PTR _image$[ebp]
	add	edx, 8
	push	edx
	push	OFFSET FLAT:$SG70752
	mov	eax, DWORD PTR _cginame$[ebp]
	add	eax, 8
	push	eax
	mov	ecx, DWORD PTR _cntxt$[ebp]
	push	ecx
	call	_put_html_button_sz
	add	esp, 44					; 0000002cH
	test	eax, eax
	je	SHORT $L70751

; 490  : 			STACK_ERROR;

	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 490		; 000001eaH
	jmp	SHORT $eva_err$70655
$L70751:

; 492  : 	else

	jmp	SHORT $L70758
$L70729:

; 494  : 		if(put_html_image(cntxt, NULL, image->data, tooltip->data,
; 495  : 							NULL, NULL, 0))

	push	0
	push	0
	push	0
	push	0
	mov	eax, DWORD PTR _tooltip$[ebp]
	add	eax, 8
	push	eax
	mov	ecx, DWORD PTR _image$[ebp]
	add	ecx, 8
	push	ecx
	push	0
	mov	edx, DWORD PTR _cntxt$[ebp]
	push	edx
	call	_put_html_img
	add	esp, 32					; 00000020H
	test	eax, eax
	je	SHORT $L70758

; 496  : 			STACK_ERROR;

	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 496		; 000001f0H
	jmp	SHORT $eva_err$70655
$L70758:
$eva_noerr$70634:

; 498  : 	RETURN_OK_CLEANUP;

	push	0
	push	OFFSET FLAT:$SG70759
	push	OFFSET FLAT:$SG70760
	mov	ecx, DWORD PTR _cntxt$[ebp]
	push	ecx
	call	_err_clear
	add	esp, 16					; 00000010H
$eva_err$70655:
	mov	edx, DWORD PTR _cntxt$[ebp]
	cmp	DWORD PTR [edx+29872], 0
	je	SHORT $L70761
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	ecx, DWORD PTR [eax+29900]
	push	ecx
	push	OFFSET FLAT:$SG70762
	push	OFFSET FLAT:$SG70763
	mov	edx, DWORD PTR _cntxt$[ebp]
	push	edx
	call	_err_add_context
	add	esp, 16					; 00000010H
$L70761:
	mov	eax, DWORD PTR _tooltip$[ebp]
	push	eax
	call	_mem_free
	add	esp, 4
	mov	DWORD PTR _tooltip$[ebp], 0
	mov	ecx, DWORD PTR _cginame$[ebp]
	push	ecx
	call	_mem_free
	add	esp, 4
	mov	DWORD PTR _cginame$[ebp], 0
	mov	edx, DWORD PTR _image$[ebp]
	push	edx
	call	_mem_free
	add	esp, 4
	mov	DWORD PTR _image$[ebp], 0
	mov	eax, DWORD PTR _imgsel$[ebp]
	push	eax
	call	_mem_free
	add	esp, 4
	mov	DWORD PTR _imgsel$[ebp], 0
	mov	ecx, DWORD PTR _cntxt$[ebp]
	xor	eax, eax
	cmp	DWORD PTR [ecx+29872], 0
	setne	al

; 499  : }

	mov	esp, ebp
	pop	ebp
	ret	0
_ctrl_add_opt_btn ENDP
_TEXT	ENDS
PUBLIC	_ctrl_put_label
EXTRN	_put_html_format_pos:NEAR
EXTRN	__snprintf:NEAR
EXTRN	_plain_to_html:BYTE
_BSS	SEGMENT
	ALIGN	4

$SG70777 DB	01H DUP (?)
	ALIGN	4

$SG70778 DB	01H DUP (?)
	ALIGN	4

$SG70781 DB	01H DUP (?)
	ALIGN	4

$SG70784 DB	01H DUP (?)
	ALIGN	4

$SG70810 DB	01H DUP (?)
	ALIGN	4

$SG70813 DB	01H DUP (?)
_BSS	ENDS
_DATA	SEGMENT
	ORG $+3
$SG70775 DB	'_EVA_NONE', 00H
	ORG $+2
$SG70776 DB	'_EVA_NONE', 00H
	ORG $+2
$SG70780 DB	'_EVA_LABEL_NOBR', 00H
$SG70783 DB	'_EVA_BORDER_STYLE', 00H
	ORG $+2
$SG70786 DB	'DD8800', 00H
	ORG $+1
$SG70787 DB	'DD0000', 00H
	ORG $+1
$SG70793 DB	'_EVA_SHRINKBTN', 00H
	ORG $+1
$SG70796 DB	'<div style=''float:left''>', 00H
	ORG $+3
$SG70798 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70802 DB	'<nobr>', 00H
	ORG $+1
$SG70804 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70806 DB	'_EVA_BUTTON', 00H
$SG70808 DB	'_EVA_HTTPLINK', 00H
	ORG $+2
$SG70809 DB	'_EVA_ACTION', 00H
$SG70812 DB	'_EVA_URL', 00H
	ORG $+3
$SG70821 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70826 DB	'</nobr>', 00H
$SG70828 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70830 DB	'_EVA_SHRINKBTN', 00H
	ORG $+1
$SG70832 DB	'down', 00H
	ORG $+3
$SG70833 DB	'up', 00H
	ORG $+1
$SG70837 DB	') title=''Cliquez pour r', 0e9H, 'duire'' onMouseOver=Sw'
	DB	'apImg(this)', 00H
	ORG $+3
$SG70838 DB	'</div><div style=''text-align:right;width:100%''><img on'
	DB	'Click=ToggleMenu(this,', 00H
	ORG $+3
$SG70840 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70842 DB	' src=/img/shrink_%s.gif img=/img/shrink_%s.gif img1=/img'
	DB	'/shrink_%s_s.gif></div>', 00H
$SG70845 DB	'D:\Travail\ABI\EVA\V4.0\CGI\Brunix-2016\ctrl_utils.c', 00H
	ORG $+3
$SG70846 DB	'ctrl_put_label', 00H
	ORG $+1
$SG70848 DB	'D:\Travail\ABI\EVA\V4.0\CGI\Brunix-2016\ctrl_utils.c', 00H
	ORG $+3
$SG70849 DB	'ctrl_put_label', 00H
_DATA	ENDS
_TEXT	SEGMENT
_cntxt$ = 8
_ctrl$ = 12
_position$ = 16
_b_opt$ = -4
_b_nobr$ = -12
_br_style$ = -8
_labelcolor$ = -16
_b_link$70807 = -24
_link$70811 = -20
_ud$70831 = -1052
_printbuf$70834 = -1048
_ctrl_put_label PROC NEAR

; 513  : ){

	push	ebp
	mov	ebp, esp
	sub	esp, 1096				; 00000448H

; 514  : 	int b_opt = STRCMPNUL(ctrl->OPTIONBUTTON, "_EVA_NONE") != 0 && cntxt->opt_btn_mode != OptBtn_None;

	mov	eax, OFFSET FLAT:$SG70775
	test	eax, eax
	je	SHORT $L71730
	mov	DWORD PTR -1056+[ebp], OFFSET FLAT:$SG70776
	jmp	SHORT $L71731
$L71730:
	mov	DWORD PTR -1056+[ebp], OFFSET FLAT:$SG70777
$L71731:
	mov	ecx, DWORD PTR _ctrl$[ebp]
	cmp	DWORD PTR [ecx+336], 0
	je	SHORT $L71732
	mov	edx, DWORD PTR _ctrl$[ebp]
	mov	eax, DWORD PTR [edx+336]
	mov	DWORD PTR -1060+[ebp], eax
	jmp	SHORT $L71733
$L71732:
	mov	DWORD PTR -1060+[ebp], OFFSET FLAT:$SG70778
$L71733:
	mov	ecx, DWORD PTR -1056+[ebp]
	push	ecx
	mov	edx, DWORD PTR -1060+[ebp]
	push	edx
	call	_strcmp
	add	esp, 8
	test	eax, eax
	je	SHORT $L71734
	mov	eax, DWORD PTR _cntxt$[ebp]
	cmp	DWORD PTR [eax+29588], 0
	je	SHORT $L71734
	mov	DWORD PTR -1064+[ebp], 1
	jmp	SHORT $L71735
$L71734:
	mov	DWORD PTR -1064+[ebp], 0
$L71735:
	mov	ecx, DWORD PTR -1064+[ebp]
	mov	DWORD PTR _b_opt$[ebp], ecx

; 515  : 	int b_nobr = *CTRL_ATTR_VAL(LABEL_NOBR) == '1';

	cmp	DWORD PTR _ctrl$[ebp], 0
	je	SHORT $L71736
	push	0
	push	-1
	push	OFFSET FLAT:$SG70780
	mov	edx, DWORD PTR _ctrl$[ebp]
	add	edx, 44					; 0000002cH
	push	edx
	call	_dyntab_field_val
	add	esp, 16					; 00000010H
	mov	DWORD PTR -1068+[ebp], eax
	jmp	SHORT $L71737
$L71736:
	mov	DWORD PTR -1068+[ebp], OFFSET FLAT:$SG70781
$L71737:
	mov	eax, DWORD PTR -1068+[ebp]
	movsx	ecx, BYTE PTR [eax]
	xor	edx, edx
	cmp	ecx, 49					; 00000031H
	sete	dl
	mov	DWORD PTR _b_nobr$[ebp], edx

; 516  : 	char *br_style = CTRL_ATTR_VAL(BORDER_STYLE);

	cmp	DWORD PTR _ctrl$[ebp], 0
	je	SHORT $L71738
	push	0
	push	-1
	push	OFFSET FLAT:$SG70783
	mov	eax, DWORD PTR _ctrl$[ebp]
	add	eax, 44					; 0000002cH
	push	eax
	call	_dyntab_field_val
	add	esp, 16					; 00000010H
	mov	DWORD PTR -1072+[ebp], eax
	jmp	SHORT $L71739
$L71738:
	mov	DWORD PTR -1072+[ebp], OFFSET FLAT:$SG70784
$L71739:
	mov	ecx, DWORD PTR -1072+[ebp]
	mov	DWORD PTR _br_style$[ebp], ecx

; 517  : 
; 518  : 	/* Label color depends on error status if no option button */
; 519  : 	char *labelcolor = (b_opt || ctrl->error < 1) ? ctrl->LABELFONTCOLOR :
; 520  : 						ctrl->error < 2 ? "DD8800" : "DD0000";

	cmp	DWORD PTR _b_opt$[ebp], 0
	jne	SHORT $L71740
	mov	edx, DWORD PTR _ctrl$[ebp]
	cmp	DWORD PTR [edx+212], 1
	jl	SHORT $L71740
	mov	eax, DWORD PTR _ctrl$[ebp]
	cmp	DWORD PTR [eax+212], 2
	jge	SHORT $L71741
	mov	DWORD PTR -1076+[ebp], OFFSET FLAT:$SG70786
	jmp	SHORT $L71742
$L71741:
	mov	DWORD PTR -1076+[ebp], OFFSET FLAT:$SG70787
$L71742:
	mov	ecx, DWORD PTR -1076+[ebp]
	mov	DWORD PTR -1080+[ebp], ecx
	jmp	SHORT $L71743
$L71740:
	mov	edx, DWORD PTR _ctrl$[ebp]
	mov	eax, DWORD PTR [edx+416]
	mov	DWORD PTR -1080+[ebp], eax
$L71743:
	mov	ecx, DWORD PTR -1080+[ebp]
	mov	DWORD PTR _labelcolor$[ebp], ecx

; 521  : 
; 522  : 	/* Handle unspecified row/col span */
; 523  : 	if(!ctrl->LABELROWSPAN) ctrl->LABELROWSPAN = 1;

	mov	edx, DWORD PTR _ctrl$[ebp]
	cmp	DWORD PTR [edx+436], 0
	jne	SHORT $L70788
	mov	eax, DWORD PTR _ctrl$[ebp]
	mov	DWORD PTR [eax+436], 1
$L70788:

; 524  : 	if(!ctrl->LABELCOLSPAN) ctrl->LABELCOLSPAN = 1;

	mov	ecx, DWORD PTR _ctrl$[ebp]
	cmp	DWORD PTR [ecx+432], 0
	jne	SHORT $L70789
	mov	edx, DWORD PTR _ctrl$[ebp]
	mov	DWORD PTR [edx+432], 1
$L70789:

; 525  : 
; 526  : 	/* Output cell header for label */
; 527  : 	if(put_html_format_pos(cntxt, position,
; 528  : 		ctrl->LABELALIGN, ctrl->LABELVALIGN, ctrl->LABELWIDTH, ctrl->LABELHEIGHT,
; 529  : 		ctrl->LABELBGCOLOR, ctrl->LABELBACKGROUND, ctrl->LABELCOLSPAN, ctrl->LABELROWSPAN,
; 530  : 		ctrl->LABELFONTFACE, ctrl->LABELFONTSIZE, labelcolor, ctrl->LABEL_STYLE,
; 531  : 		ctrl->LABELBOLD[0] == '1', ctrl->LABELITALIC[0] == '1', ctrl->LABELUNDERLINE[0] == '1', 0,
; 532  : 		1)) STACK_ERROR;

	push	1
	push	0
	mov	eax, DWORD PTR _ctrl$[ebp]
	mov	ecx, DWORD PTR [eax+428]
	movsx	edx, BYTE PTR [ecx]
	xor	eax, eax
	cmp	edx, 49					; 00000031H
	sete	al
	push	eax
	mov	ecx, DWORD PTR _ctrl$[ebp]
	mov	edx, DWORD PTR [ecx+424]
	movsx	eax, BYTE PTR [edx]
	xor	ecx, ecx
	cmp	eax, 49					; 00000031H
	sete	cl
	push	ecx
	mov	edx, DWORD PTR _ctrl$[ebp]
	mov	eax, DWORD PTR [edx+420]
	movsx	ecx, BYTE PTR [eax]
	xor	edx, edx
	cmp	ecx, 49					; 00000031H
	sete	dl
	push	edx
	mov	eax, DWORD PTR _ctrl$[ebp]
	mov	ecx, DWORD PTR [eax+472]
	push	ecx
	mov	edx, DWORD PTR _labelcolor$[ebp]
	push	edx
	mov	eax, DWORD PTR _ctrl$[ebp]
	mov	ecx, DWORD PTR [eax+412]
	push	ecx
	mov	edx, DWORD PTR _ctrl$[ebp]
	mov	eax, DWORD PTR [edx+408]
	push	eax
	mov	ecx, DWORD PTR _ctrl$[ebp]
	mov	edx, DWORD PTR [ecx+436]
	push	edx
	mov	eax, DWORD PTR _ctrl$[ebp]
	mov	ecx, DWORD PTR [eax+432]
	push	ecx
	mov	edx, DWORD PTR _ctrl$[ebp]
	mov	eax, DWORD PTR [edx+404]
	push	eax
	mov	ecx, DWORD PTR _ctrl$[ebp]
	mov	edx, DWORD PTR [ecx+400]
	push	edx
	mov	eax, DWORD PTR _ctrl$[ebp]
	mov	ecx, DWORD PTR [eax+396]
	push	ecx
	mov	edx, DWORD PTR _ctrl$[ebp]
	mov	eax, DWORD PTR [edx+392]
	push	eax
	mov	ecx, DWORD PTR _ctrl$[ebp]
	mov	edx, DWORD PTR [ecx+388]
	push	edx
	mov	eax, DWORD PTR _ctrl$[ebp]
	mov	ecx, DWORD PTR [eax+384]
	push	ecx
	mov	edx, DWORD PTR _position$[ebp]
	push	edx
	mov	eax, DWORD PTR _cntxt$[ebp]
	push	eax
	call	_put_html_format_pos
	add	esp, 76					; 0000004cH
	test	eax, eax
	je	SHORT $L70790
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 532		; 00000214H
	jmp	$eva_err$70791
$L70790:

; 533  : 
; 534  : 	/* Output <div> for shrink button */
; 535  : 	if(!strncmp(br_style, add_sz_str("_EVA_SHRINKBTN")))

	push	14					; 0000000eH
	push	OFFSET FLAT:$SG70793
	mov	edx, DWORD PTR _br_style$[ebp]
	push	edx
	call	_strncmp
	add	esp, 12					; 0000000cH
	test	eax, eax
	jne	SHORT $L70795

; 536  : 		DYNBUF_ADD_STR(cntxt->form->html, "<div style='float:left'>");

	push	0
	push	0
	push	24					; 00000018H
	push	OFFSET FLAT:$SG70796
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	ecx, DWORD PTR [eax+80]
	mov	edx, DWORD PTR [ecx+232]
	push	edx
	call	_dynbuf_add
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L70795
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29872], OFFSET FLAT:$SG70798
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 536		; 00000218H
	jmp	$eva_err$70791
$L70795:

; 537  : 
; 538  : 	/* Output label */
; 539  : 	if(b_nobr) DYNBUF_ADD_STR(cntxt->form->html, "<nobr>");

	cmp	DWORD PTR _b_nobr$[ebp], 0
	je	SHORT $L70801
	push	0
	push	0
	push	6
	push	OFFSET FLAT:$SG70802
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	eax, DWORD PTR [edx+80]
	mov	ecx, DWORD PTR [eax+232]
	push	ecx
	call	_dynbuf_add
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L70801
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29872], OFFSET FLAT:$SG70804
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 539		; 0000021bH
	jmp	$eva_err$70791
$L70801:

; 540  : 	if(!strcmp(ctrl->CONTROL, "_EVA_BUTTON"))

	push	OFFSET FLAT:$SG70806
	mov	ecx, DWORD PTR _ctrl$[ebp]
	mov	edx, DWORD PTR [ecx+272]
	push	edx
	call	_strcmp
	add	esp, 8
	test	eax, eax
	jne	$L70805

; 542  : 		/* Output label as button for buttons */
; 543  : 		int b_link = !strcmp(CTRL_ATTR_VAL(ACTION), "_EVA_HTTPLINK");

	cmp	DWORD PTR _ctrl$[ebp], 0
	je	SHORT $L71744
	push	0
	push	-1
	push	OFFSET FLAT:$SG70809
	mov	eax, DWORD PTR _ctrl$[ebp]
	add	eax, 44					; 0000002cH
	push	eax
	call	_dyntab_field_val
	add	esp, 16					; 00000010H
	mov	DWORD PTR -1084+[ebp], eax
	jmp	SHORT $L71745
$L71744:
	mov	DWORD PTR -1084+[ebp], OFFSET FLAT:$SG70810
$L71745:
	push	OFFSET FLAT:$SG70808
	mov	ecx, DWORD PTR -1084+[ebp]
	push	ecx
	call	_strcmp
	add	esp, 8
	neg	eax
	sbb	eax, eax
	inc	eax
	mov	DWORD PTR _b_link$70807[ebp], eax

; 544  : 		char *link = CTRL_ATTR_VAL(URL);

	cmp	DWORD PTR _ctrl$[ebp], 0
	je	SHORT $L71746
	push	0
	push	-1
	push	OFFSET FLAT:$SG70812
	mov	edx, DWORD PTR _ctrl$[ebp]
	add	edx, 44					; 0000002cH
	push	edx
	call	_dyntab_field_val
	add	esp, 16					; 00000010H
	mov	DWORD PTR -1088+[ebp], eax
	jmp	SHORT $L71747
$L71746:
	mov	DWORD PTR -1088+[ebp], OFFSET FLAT:$SG70813
$L71747:
	mov	eax, DWORD PTR -1088+[ebp]
	mov	DWORD PTR _link$70811[ebp], eax

; 545  : 		if(put_html_button(cntxt, b_link ? link : ctrl->cginame->data, ctrl->LABEL, NULL, NULL, ctrl->NOTES, 0, b_link ? 96 : 32)) STACK_ERROR;

	cmp	DWORD PTR _b_link$70807[ebp], 0
	je	SHORT $L71748
	mov	ecx, DWORD PTR _link$70811[ebp]
	mov	DWORD PTR -1092+[ebp], ecx
	jmp	SHORT $L71749
$L71748:
	mov	edx, DWORD PTR _ctrl$[ebp]
	mov	eax, DWORD PTR [edx+40]
	add	eax, 8
	mov	DWORD PTR -1092+[ebp], eax
$L71749:
	mov	ecx, DWORD PTR _b_link$70807[ebp]
	neg	ecx
	sbb	ecx, ecx
	and	ecx, 64					; 00000040H
	add	ecx, 32					; 00000020H
	push	ecx
	push	0
	push	0
	push	0
	push	0
	mov	edx, DWORD PTR _ctrl$[ebp]
	mov	eax, DWORD PTR [edx+288]
	push	eax
	push	0
	push	0
	mov	ecx, DWORD PTR _ctrl$[ebp]
	mov	edx, DWORD PTR [ecx+284]
	push	edx
	mov	eax, DWORD PTR -1092+[ebp]
	push	eax
	mov	ecx, DWORD PTR _cntxt$[ebp]
	push	ecx
	call	_put_html_button_sz
	add	esp, 44					; 0000002cH
	test	eax, eax
	je	SHORT $L70817
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 545		; 00000221H
	jmp	$eva_err$70791
$L70817:

; 547  : 	else

	jmp	SHORT $L70819
$L70805:

; 548  : 		DYNBUF_ADD(cntxt->form->html, ctrl->LABEL, 0, TO_HTML);

	push	1
	push	OFFSET FLAT:_plain_to_html
	push	0
	mov	eax, DWORD PTR _ctrl$[ebp]
	mov	ecx, DWORD PTR [eax+284]
	push	ecx
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	eax, DWORD PTR [edx+80]
	mov	ecx, DWORD PTR [eax+232]
	push	ecx
	call	_dynbuf_add
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L70819
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29872], OFFSET FLAT:$SG70821
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 548		; 00000224H
	jmp	$eva_err$70791
$L70819:

; 549  : 
; 550  : 	/* Output option button if applicable */
; 551  : 	if(b_opt && ctrl_add_opt_btn(cntxt, ctrl)) STACK_ERROR;

	cmp	DWORD PTR _b_opt$[ebp], 0
	je	SHORT $L70822
	mov	ecx, DWORD PTR _ctrl$[ebp]
	push	ecx
	mov	edx, DWORD PTR _cntxt$[ebp]
	push	edx
	call	_ctrl_add_opt_btn
	add	esp, 8
	test	eax, eax
	je	SHORT $L70822
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 551		; 00000227H
	jmp	$eva_err$70791
$L70822:

; 552  : 	if(b_nobr) DYNBUF_ADD_STR(cntxt->form->html, "</nobr>");

	cmp	DWORD PTR _b_nobr$[ebp], 0
	je	SHORT $L70825
	push	0
	push	0
	push	7
	push	OFFSET FLAT:$SG70826
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	edx, DWORD PTR [ecx+80]
	mov	eax, DWORD PTR [edx+232]
	push	eax
	call	_dynbuf_add
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L70825
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29872], OFFSET FLAT:$SG70828
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 552		; 00000228H
	jmp	$eva_err$70791
$L70825:

; 553  : 
; 554  : 	/* Output shrink button if applicable */
; 555  : 	if(!strncmp(br_style, add_sz_str("_EVA_SHRINKBTN")))

	push	14					; 0000000eH
	push	OFFSET FLAT:$SG70830
	mov	eax, DWORD PTR _br_style$[ebp]
	push	eax
	call	_strncmp
	add	esp, 12					; 0000000cH
	test	eax, eax
	jne	$L70829

; 557  : 		char *ud = br_style[14] ? "down" : "up";

	mov	ecx, DWORD PTR _br_style$[ebp]
	movsx	edx, BYTE PTR [ecx+14]
	test	edx, edx
	je	SHORT $L71750
	mov	DWORD PTR -1096+[ebp], OFFSET FLAT:$SG70832
	jmp	SHORT $L71751
$L71750:
	mov	DWORD PTR -1096+[ebp], OFFSET FLAT:$SG70833
$L71751:
	mov	eax, DWORD PTR -1096+[ebp]
	mov	DWORD PTR _ud$70831[ebp], eax

; 561  : 			"</div><div style='text-align:right;width:100%'><img onClick=ToggleMenu(this,",
; 562  : 			&ctrl->id, 0, 0, NO_CONV, ") title='Cliquez pour réduire' onMouseOver=SwapImg(this)");

	push	56					; 00000038H
	push	OFFSET FLAT:$SG70837
	push	0
	push	0
	push	0
	push	0
	mov	ecx, DWORD PTR _ctrl$[ebp]
	push	ecx
	call	_dyntab_sz
	add	esp, 12					; 0000000cH
	push	eax
	push	0
	push	0
	mov	edx, DWORD PTR _ctrl$[ebp]
	push	edx
	call	_dyntab_val
	add	esp, 12					; 0000000cH
	push	eax
	push	76					; 0000004cH
	push	OFFSET FLAT:$SG70838
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	ecx, DWORD PTR [eax+80]
	mov	edx, DWORD PTR [ecx+232]
	push	edx
	call	_dynbuf_add3
	add	esp, 36					; 00000024H
	test	eax, eax
	je	SHORT $L70836
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29872], OFFSET FLAT:$SG70840
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 562		; 00000232H
	jmp	$eva_err$70791
$L70836:

; 563  : 		dynbuf_print3(cntxt->form->html,
; 564  : 			" src=/img/shrink_%s.gif img=/img/shrink_%s.gif img1=/img/shrink_%s_s.gif></div>", ud, ud, ud);

	push	0
	push	0
	mov	edx, DWORD PTR _ud$70831[ebp]
	push	edx
	mov	eax, DWORD PTR _ud$70831[ebp]
	push	eax
	mov	ecx, DWORD PTR _ud$70831[ebp]
	push	ecx
	push	OFFSET FLAT:$SG70842
	push	1023					; 000003ffH
	lea	edx, DWORD PTR _printbuf$70834[ebp]
	push	edx
	call	__snprintf
	add	esp, 24					; 00000018H
	push	eax
	lea	eax, DWORD PTR _printbuf$70834[ebp]
	push	eax
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	edx, DWORD PTR [ecx+80]
	mov	eax, DWORD PTR [edx+232]
	push	eax
	call	_dynbuf_add
	add	esp, 20					; 00000014H
$L70829:

; 566  : 
; 567  : 	/* Output cell footer for label */
; 568  : 	if(put_html_format_pos(cntxt, position,
; 569  : 		ctrl->LABELALIGN, ctrl->LABELVALIGN, ctrl->LABELWIDTH, ctrl->LABELHEIGHT,
; 570  : 		ctrl->LABELBGCOLOR, ctrl->LABELBACKGROUND, ctrl->LABELCOLSPAN, ctrl->LABELROWSPAN,
; 571  : 		ctrl->LABELFONTFACE, ctrl->LABELFONTSIZE, labelcolor, ctrl->LABEL_STYLE,
; 572  : 		ctrl->LABELBOLD[0] == '1', ctrl->LABELITALIC[0] == '1', ctrl->LABELUNDERLINE[0] == '1', 0,
; 573  : 		0)) STACK_ERROR;

	push	0
	push	0
	mov	ecx, DWORD PTR _ctrl$[ebp]
	mov	edx, DWORD PTR [ecx+428]
	movsx	eax, BYTE PTR [edx]
	xor	ecx, ecx
	cmp	eax, 49					; 00000031H
	sete	cl
	push	ecx
	mov	edx, DWORD PTR _ctrl$[ebp]
	mov	eax, DWORD PTR [edx+424]
	movsx	ecx, BYTE PTR [eax]
	xor	edx, edx
	cmp	ecx, 49					; 00000031H
	sete	dl
	push	edx
	mov	eax, DWORD PTR _ctrl$[ebp]
	mov	ecx, DWORD PTR [eax+420]
	movsx	edx, BYTE PTR [ecx]
	xor	eax, eax
	cmp	edx, 49					; 00000031H
	sete	al
	push	eax
	mov	ecx, DWORD PTR _ctrl$[ebp]
	mov	edx, DWORD PTR [ecx+472]
	push	edx
	mov	eax, DWORD PTR _labelcolor$[ebp]
	push	eax
	mov	ecx, DWORD PTR _ctrl$[ebp]
	mov	edx, DWORD PTR [ecx+412]
	push	edx
	mov	eax, DWORD PTR _ctrl$[ebp]
	mov	ecx, DWORD PTR [eax+408]
	push	ecx
	mov	edx, DWORD PTR _ctrl$[ebp]
	mov	eax, DWORD PTR [edx+436]
	push	eax
	mov	ecx, DWORD PTR _ctrl$[ebp]
	mov	edx, DWORD PTR [ecx+432]
	push	edx
	mov	eax, DWORD PTR _ctrl$[ebp]
	mov	ecx, DWORD PTR [eax+404]
	push	ecx
	mov	edx, DWORD PTR _ctrl$[ebp]
	mov	eax, DWORD PTR [edx+400]
	push	eax
	mov	ecx, DWORD PTR _ctrl$[ebp]
	mov	edx, DWORD PTR [ecx+396]
	push	edx
	mov	eax, DWORD PTR _ctrl$[ebp]
	mov	ecx, DWORD PTR [eax+392]
	push	ecx
	mov	edx, DWORD PTR _ctrl$[ebp]
	mov	eax, DWORD PTR [edx+388]
	push	eax
	mov	ecx, DWORD PTR _ctrl$[ebp]
	mov	edx, DWORD PTR [ecx+384]
	push	edx
	mov	eax, DWORD PTR _position$[ebp]
	push	eax
	mov	ecx, DWORD PTR _cntxt$[ebp]
	push	ecx
	call	_put_html_format_pos
	add	esp, 76					; 0000004cH
	test	eax, eax
	je	SHORT $eva_noerr$70844
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 573		; 0000023dH
	jmp	SHORT $eva_err$70791
$eva_noerr$70844:

; 574  : 
; 575  : 	RETURN_OK_CLEANUP;

	push	0
	push	OFFSET FLAT:$SG70845
	push	OFFSET FLAT:$SG70846
	mov	eax, DWORD PTR _cntxt$[ebp]
	push	eax
	call	_err_clear
	add	esp, 16					; 00000010H
$eva_err$70791:
	mov	ecx, DWORD PTR _cntxt$[ebp]
	cmp	DWORD PTR [ecx+29872], 0
	je	SHORT $L70847
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	eax, DWORD PTR [edx+29900]
	push	eax
	push	OFFSET FLAT:$SG70848
	push	OFFSET FLAT:$SG70849
	mov	ecx, DWORD PTR _cntxt$[ebp]
	push	ecx
	call	_err_add_context
	add	esp, 16					; 00000010H
$L70847:
	mov	edx, DWORD PTR _cntxt$[ebp]
	xor	eax, eax
	cmp	DWORD PTR [edx+29872], 0
	setne	al

; 576  : }

	mov	esp, ebp
	pop	ebp
	ret	0
_ctrl_put_label ENDP
_TEXT	ENDS
PUBLIC	_ctrl_format_cell
_BSS	SEGMENT
	ALIGN	4

$SG70867 DB	01H DUP (?)
_BSS	ENDS
_DATA	SEGMENT
	ORG $+1
$SG70866 DB	'_EVA_HELPTEXT', 00H
	ORG $+2
$SG70870 DB	'_EVA_ALWAYS', 00H
$SG70871 DB	'_EVA_EDIT', 00H
	ORG $+2
$SG70873 DB	'</div>', 00H
	ORG $+1
$SG70874 DB	'<div class=EVANotes>', 00H
	ORG $+3
$SG70876 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70879 DB	'D:\Travail\ABI\EVA\V4.0\CGI\Brunix-2016\ctrl_utils.c', 00H
	ORG $+3
$SG70880 DB	'ctrl_format_cell', 00H
	ORG $+3
$SG70882 DB	'D:\Travail\ABI\EVA\V4.0\CGI\Brunix-2016\ctrl_utils.c', 00H
	ORG $+3
$SG70883 DB	'ctrl_format_cell', 00H
_DATA	ENDS
_TEXT	SEGMENT
_cntxt$ = 8
_ctrl$ = 12
_b_head$ = 16
_mode$70865 = -4
_ctrl_format_cell PROC NEAR

; 590  : ){

	push	ebp
	mov	ebp, esp
	sub	esp, 8

; 591  : 	if(b_head)

	cmp	DWORD PTR _b_head$[ebp], 0
	je	$L70861

; 593  : 		/* Output cell header for control */
; 594  : 		if(put_html_format_pos(cntxt, ctrl->POSITION,
; 595  : 							ctrl->ALIGN, ctrl->VALIGN, ctrl->WIDTH, ctrl->HEIGHT,
; 596  : 							ctrl->BGCOLOR, ctrl->BACKGROUND, ctrl->COLSPAN, ctrl->ROWSPAN,
; 597  : 							ctrl->FONTFACE, ctrl->FONTSIZE, ctrl->FONTCOLOR, ctrl->CELL_STYLE,
; 598  : 							ctrl->BOLD[0] == '1', ctrl->ITALIC[0] == '1', ctrl->UNDERLINE[0] == '1', 0, b_head))

	mov	eax, DWORD PTR _b_head$[ebp]
	push	eax
	push	0
	mov	ecx, DWORD PTR _ctrl$[ebp]
	mov	edx, DWORD PTR [ecx+372]
	movsx	eax, BYTE PTR [edx]
	xor	ecx, ecx
	cmp	eax, 49					; 00000031H
	sete	cl
	push	ecx
	mov	edx, DWORD PTR _ctrl$[ebp]
	mov	eax, DWORD PTR [edx+368]
	movsx	ecx, BYTE PTR [eax]
	xor	edx, edx
	cmp	ecx, 49					; 00000031H
	sete	dl
	push	edx
	mov	eax, DWORD PTR _ctrl$[ebp]
	mov	ecx, DWORD PTR [eax+364]
	movsx	edx, BYTE PTR [ecx]
	xor	eax, eax
	cmp	edx, 49					; 00000031H
	sete	al
	push	eax
	mov	ecx, DWORD PTR _ctrl$[ebp]
	mov	edx, DWORD PTR [ecx+468]
	push	edx
	mov	eax, DWORD PTR _ctrl$[ebp]
	mov	ecx, DWORD PTR [eax+360]
	push	ecx
	mov	edx, DWORD PTR _ctrl$[ebp]
	mov	eax, DWORD PTR [edx+356]
	push	eax
	mov	ecx, DWORD PTR _ctrl$[ebp]
	mov	edx, DWORD PTR [ecx+352]
	push	edx
	mov	eax, DWORD PTR _ctrl$[ebp]
	mov	ecx, DWORD PTR [eax+332]
	push	ecx
	mov	edx, DWORD PTR _ctrl$[ebp]
	mov	eax, DWORD PTR [edx+328]
	push	eax
	mov	ecx, DWORD PTR _ctrl$[ebp]
	mov	edx, DWORD PTR [ecx+324]
	push	edx
	mov	eax, DWORD PTR _ctrl$[ebp]
	mov	ecx, DWORD PTR [eax+320]
	push	ecx
	mov	edx, DWORD PTR _ctrl$[ebp]
	mov	eax, DWORD PTR [edx+312]
	push	eax
	mov	ecx, DWORD PTR _ctrl$[ebp]
	mov	edx, DWORD PTR [ecx+308]
	push	edx
	mov	eax, DWORD PTR _ctrl$[ebp]
	mov	ecx, DWORD PTR [eax+304]
	push	ecx
	mov	edx, DWORD PTR _ctrl$[ebp]
	mov	eax, DWORD PTR [edx+300]
	push	eax
	mov	ecx, DWORD PTR _ctrl$[ebp]
	mov	edx, DWORD PTR [ecx+296]
	push	edx
	mov	eax, DWORD PTR _cntxt$[ebp]
	push	eax
	call	_put_html_format_pos
	add	esp, 76					; 0000004cH
	test	eax, eax
	je	SHORT $L70862

; 599  : 			STACK_ERROR;

	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 599		; 00000257H
	jmp	$eva_err$70863
$L70862:

; 601  : 	else

	jmp	$L70877
$L70861:

; 603  : 		/* Handle control notes */
; 604  : 		char *mode = CTRL_ATTR_VAL(HELPTEXT);

	cmp	DWORD PTR _ctrl$[ebp], 0
	je	SHORT $L71753
	push	0
	push	-1
	push	OFFSET FLAT:$SG70866
	mov	edx, DWORD PTR _ctrl$[ebp]
	add	edx, 44					; 0000002cH
	push	edx
	call	_dyntab_field_val
	add	esp, 16					; 00000010H
	mov	DWORD PTR -8+[ebp], eax
	jmp	SHORT $L71754
$L71753:
	mov	DWORD PTR -8+[ebp], OFFSET FLAT:$SG70867
$L71754:
	mov	eax, DWORD PTR -8+[ebp]
	mov	DWORD PTR _mode$70865[ebp], eax

; 605  : 		if(ctrl->NOTES && *ctrl->NOTES && (!strcmp(mode, "_EVA_ALWAYS") || (!strcmp(mode, "_EVA_EDIT") && cntxt->form->step == HtmlEdit) ))

	mov	ecx, DWORD PTR _ctrl$[ebp]
	cmp	DWORD PTR [ecx+288], 0
	je	$L70872
	mov	edx, DWORD PTR _ctrl$[ebp]
	mov	eax, DWORD PTR [edx+288]
	movsx	ecx, BYTE PTR [eax]
	test	ecx, ecx
	je	$L70872
	push	OFFSET FLAT:$SG70870
	mov	edx, DWORD PTR _mode$70865[ebp]
	push	edx
	call	_strcmp
	add	esp, 8
	test	eax, eax
	je	SHORT $L70869
	push	OFFSET FLAT:$SG70871
	mov	eax, DWORD PTR _mode$70865[ebp]
	push	eax
	call	_strcmp
	add	esp, 8
	test	eax, eax
	jne	SHORT $L70872
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	edx, DWORD PTR [ecx+80]
	cmp	DWORD PTR [edx+176], 4
	jne	SHORT $L70872
$L70869:

; 607  : 			DYNBUF_ADD3(cntxt->form->html, "<div class=EVANotes>", ctrl->NOTES, 0, TO_HTML, "</div>");

	push	6
	push	OFFSET FLAT:$SG70873
	push	1
	push	OFFSET FLAT:_plain_to_html
	push	0
	mov	eax, DWORD PTR _ctrl$[ebp]
	mov	ecx, DWORD PTR [eax+288]
	push	ecx
	push	20					; 00000014H
	push	OFFSET FLAT:$SG70874
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	eax, DWORD PTR [edx+80]
	mov	ecx, DWORD PTR [eax+232]
	push	ecx
	call	_dynbuf_add3
	add	esp, 36					; 00000024H
	test	eax, eax
	je	SHORT $L70872
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29872], OFFSET FLAT:$SG70876
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 607		; 0000025fH
	jmp	$eva_err$70863
$L70872:

; 609  : 
; 610  : 		/* Output cell footer for control */
; 611  : 		if(put_html_format_pos(cntxt, ctrl->POSITION,
; 612  : 							ctrl->ALIGN, ctrl->VALIGN, ctrl->WIDTH, ctrl->HEIGHT,
; 613  : 							ctrl->BGCOLOR, ctrl->BACKGROUND, ctrl->COLSPAN, ctrl->ROWSPAN,
; 614  : 							ctrl->FONTFACE, ctrl->FONTSIZE, ctrl->FONTCOLOR, ctrl->CELL_STYLE,
; 615  : 							ctrl->BOLD[0] == '1', ctrl->ITALIC[0] == '1', ctrl->UNDERLINE[0] == '1', 0, b_head))

	mov	ecx, DWORD PTR _b_head$[ebp]
	push	ecx
	push	0
	mov	edx, DWORD PTR _ctrl$[ebp]
	mov	eax, DWORD PTR [edx+372]
	movsx	ecx, BYTE PTR [eax]
	xor	edx, edx
	cmp	ecx, 49					; 00000031H
	sete	dl
	push	edx
	mov	eax, DWORD PTR _ctrl$[ebp]
	mov	ecx, DWORD PTR [eax+368]
	movsx	edx, BYTE PTR [ecx]
	xor	eax, eax
	cmp	edx, 49					; 00000031H
	sete	al
	push	eax
	mov	ecx, DWORD PTR _ctrl$[ebp]
	mov	edx, DWORD PTR [ecx+364]
	movsx	eax, BYTE PTR [edx]
	xor	ecx, ecx
	cmp	eax, 49					; 00000031H
	sete	cl
	push	ecx
	mov	edx, DWORD PTR _ctrl$[ebp]
	mov	eax, DWORD PTR [edx+468]
	push	eax
	mov	ecx, DWORD PTR _ctrl$[ebp]
	mov	edx, DWORD PTR [ecx+360]
	push	edx
	mov	eax, DWORD PTR _ctrl$[ebp]
	mov	ecx, DWORD PTR [eax+356]
	push	ecx
	mov	edx, DWORD PTR _ctrl$[ebp]
	mov	eax, DWORD PTR [edx+352]
	push	eax
	mov	ecx, DWORD PTR _ctrl$[ebp]
	mov	edx, DWORD PTR [ecx+332]
	push	edx
	mov	eax, DWORD PTR _ctrl$[ebp]
	mov	ecx, DWORD PTR [eax+328]
	push	ecx
	mov	edx, DWORD PTR _ctrl$[ebp]
	mov	eax, DWORD PTR [edx+324]
	push	eax
	mov	ecx, DWORD PTR _ctrl$[ebp]
	mov	edx, DWORD PTR [ecx+320]
	push	edx
	mov	eax, DWORD PTR _ctrl$[ebp]
	mov	ecx, DWORD PTR [eax+312]
	push	ecx
	mov	edx, DWORD PTR _ctrl$[ebp]
	mov	eax, DWORD PTR [edx+308]
	push	eax
	mov	ecx, DWORD PTR _ctrl$[ebp]
	mov	edx, DWORD PTR [ecx+304]
	push	edx
	mov	eax, DWORD PTR _ctrl$[ebp]
	mov	ecx, DWORD PTR [eax+300]
	push	ecx
	mov	edx, DWORD PTR _ctrl$[ebp]
	mov	eax, DWORD PTR [edx+296]
	push	eax
	mov	ecx, DWORD PTR _cntxt$[ebp]
	push	ecx
	call	_put_html_format_pos
	add	esp, 76					; 0000004cH
	test	eax, eax
	je	SHORT $L70877

; 616  : 			STACK_ERROR;

	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 616		; 00000268H
	jmp	SHORT $eva_err$70863
$L70877:
$eva_noerr$70878:

; 618  : 
; 619  : 	RETURN_OK_CLEANUP;

	push	0
	push	OFFSET FLAT:$SG70879
	push	OFFSET FLAT:$SG70880
	mov	eax, DWORD PTR _cntxt$[ebp]
	push	eax
	call	_err_clear
	add	esp, 16					; 00000010H
$eva_err$70863:
	mov	ecx, DWORD PTR _cntxt$[ebp]
	cmp	DWORD PTR [ecx+29872], 0
	je	SHORT $L70881
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	eax, DWORD PTR [edx+29900]
	push	eax
	push	OFFSET FLAT:$SG70882
	push	OFFSET FLAT:$SG70883
	mov	ecx, DWORD PTR _cntxt$[ebp]
	push	ecx
	call	_err_add_context
	add	esp, 16					; 00000010H
$L70881:
	mov	edx, DWORD PTR _cntxt$[ebp]
	xor	eax, eax
	cmp	DWORD PTR [edx+29872], 0
	setne	al

; 620  : }

	mov	esp, ebp
	pop	ebp
	ret	0
_ctrl_format_cell ENDP
_TEXT	ENDS
PUBLIC	_ctrl_format_pos
EXTRN	_put_html_table_header:NEAR
_BSS	SEGMENT
	ALIGN	4

$SG70958 DB	01H DUP (?)
	ALIGN	4

$SG70967 DB	01H DUP (?)
	ALIGN	4

$SG70979 DB	01H DUP (?)
	ALIGN	4

$SG70995 DB	01H DUP (?)
	ALIGN	4

$SG71004 DB	01H DUP (?)
	ALIGN	4

$SG71016 DB	01H DUP (?)
_BSS	ENDS
_DATA	SEGMENT
	ORG $+3
$SG70899 DB	' / ', 00H
$SG70900 DB	0aH, '<!--- Start ', 00H
	ORG $+2
$SG70902 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70907 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70910 DB	' -->', 0aH, 00H
	ORG $+2
$SG70911 DB	' / ', 00H
$SG70913 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70917 DB	'</nobr>', 00H
$SG70919 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70921 DB	'_EVA_RIGHT', 00H
	ORG $+1
$SG70924 DB	'right', 00H
	ORG $+2
$SG70929 DB	'left', 00H
	ORG $+3
$SG70932 DB	'_EVA_NewColumn', 00H
	ORG $+1
$SG70935 DB	'_EVA_TOP', 00H
	ORG $+3
$SG70941 DB	'bottom', 00H
	ORG $+1
$SG70948 DB	'100%', 00H
	ORG $+3
$SG70950 DB	'_EVA_NewColumn', 00H
	ORG $+1
$SG70953 DB	'</tr></table>', 00H
	ORG $+2
$SG70955 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70957 DB	'_EVA_USE_DIV', 00H
	ORG $+3
$SG70961 DB	'<table', 00H
	ORG $+1
$SG70963 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70968 DB	' class=', 00H
$SG70970 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70973 DB	'><tr><td>', 00H
	ORG $+2
$SG70975 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70978 DB	'_EVA_USE_DIV', 00H
	ORG $+3
$SG70982 DB	'</td></tr></table>', 00H
	ORG $+1
$SG70984 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70988 DB	'_EVA_BOTTOM', 00H
$SG70994 DB	'_EVA_USE_DIV', 00H
	ORG $+3
$SG70998 DB	'<table', 00H
	ORG $+1
$SG71000 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG71005 DB	' class=', 00H
$SG71007 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG71010 DB	'><tr><td>', 00H
	ORG $+2
$SG71012 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG71015 DB	'_EVA_USE_DIV', 00H
	ORG $+3
$SG71019 DB	'</td></tr></table>', 00H
	ORG $+1
$SG71021 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG71023 DB	'top', 00H
$SG71030 DB	'100%', 00H
	ORG $+3
$SG71032 DB	'_EVA_NewColumn', 00H
	ORG $+1
$SG71035 DB	'</tr></table>', 00H
	ORG $+2
$SG71037 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG71041 DB	'_EVA_NONE', 00H
	ORG $+2
$SG71051 DB	'right', 00H
	ORG $+2
$SG71054 DB	'_EVA_NewColumn', 00H
	ORG $+1
$SG71061 DB	'<nobr>', 00H
	ORG $+1
$SG71063 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG71067 DB	' / ', 00H
$SG71068 DB	0aH, '<!--- EndOf ', 00H
	ORG $+2
$SG71070 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG71074 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG71077 DB	' -->', 0aH, 00H
	ORG $+2
$SG71078 DB	' / ', 00H
$SG71080 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG71081 DB	'D:\Travail\ABI\EVA\V4.0\CGI\Brunix-2016\ctrl_utils.c', 00H
	ORG $+3
$SG71082 DB	'ctrl_format_pos', 00H
$SG71084 DB	'D:\Travail\ABI\EVA\V4.0\CGI\Brunix-2016\ctrl_utils.c', 00H
	ORG $+3
$SG71085 DB	'ctrl_format_pos', 00H
_DATA	ENDS
_TEXT	SEGMENT
_cntxt$ = 8
_ctrl$ = 12
_b_head$ = 16
_pos$71049 = -4
_ctrl_format_pos PROC NEAR

; 634  : ){

	push	ebp
	mov	ebp, esp
	sub	esp, 20					; 00000014H

; 635  : 	if(!cntxt->form->html) RETURN_OK;

	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	ecx, DWORD PTR [eax+80]
	cmp	DWORD PTR [ecx+232], 0
	jne	SHORT $L70894
	jmp	$eva_noerr$70895
$L70894:

; 636  : 	if(cntxt->debug & DEBUG_HTML && b_head)

	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	eax, DWORD PTR [edx+29860]
	and	eax, 128				; 00000080H
	test	eax, eax
	je	$L70909
	cmp	DWORD PTR _b_head$[ebp], 0
	je	$L70909

; 638  : 		DYNBUF_ADD3(cntxt->form->html, "\n<!--- Start ", ctrl->CONTROL, 0, NO_CONV, " / ");

	push	3
	push	OFFSET FLAT:$SG70899
	push	0
	push	0
	push	0
	mov	ecx, DWORD PTR _ctrl$[ebp]
	mov	edx, DWORD PTR [ecx+272]
	push	edx
	push	13					; 0000000dH
	push	OFFSET FLAT:$SG70900
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	ecx, DWORD PTR [eax+80]
	mov	edx, DWORD PTR [ecx+232]
	push	edx
	call	_dynbuf_add3
	add	esp, 36					; 00000024H
	test	eax, eax
	je	SHORT $L70898
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29872], OFFSET FLAT:$SG70902
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 638		; 0000027eH
	jmp	$eva_err$70903
$L70898:

; 639  : 		DYNBUF_ADD(cntxt->form->html, ctrl->TYPE, 0, NO_CONV);

	push	0
	push	0
	push	0
	mov	edx, DWORD PTR _ctrl$[ebp]
	mov	eax, DWORD PTR [edx+276]
	push	eax
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	edx, DWORD PTR [ecx+80]
	mov	eax, DWORD PTR [edx+232]
	push	eax
	call	_dynbuf_add
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L70905
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29872], OFFSET FLAT:$SG70907
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 639		; 0000027fH
	jmp	$eva_err$70903
$L70905:

; 640  : 		DYNBUF_ADD3(cntxt->form->html, " / ", ctrl->LABEL, 0, NO_CONV, " -->\n");

	push	5
	push	OFFSET FLAT:$SG70910
	push	0
	push	0
	push	0
	mov	eax, DWORD PTR _ctrl$[ebp]
	mov	ecx, DWORD PTR [eax+284]
	push	ecx
	push	3
	push	OFFSET FLAT:$SG70911
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	eax, DWORD PTR [edx+80]
	mov	ecx, DWORD PTR [eax+232]
	push	ecx
	call	_dynbuf_add3
	add	esp, 36					; 00000024H
	test	eax, eax
	je	SHORT $L70909
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29872], OFFSET FLAT:$SG70913
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 640		; 00000280H
	jmp	$eva_err$70903
$L70909:

; 642  : 
; 643  : 	/* Handle NOBR */
; 644  : 	if(!b_head && ctrl->NOBR && *ctrl->NOBR == '1') DYNBUF_ADD_STR(cntxt->form->html, "</nobr>");

	cmp	DWORD PTR _b_head$[ebp], 0
	jne	SHORT $L70916
	mov	ecx, DWORD PTR _ctrl$[ebp]
	cmp	DWORD PTR [ecx+316], 0
	je	SHORT $L70916
	mov	edx, DWORD PTR _ctrl$[ebp]
	mov	eax, DWORD PTR [edx+316]
	movsx	ecx, BYTE PTR [eax]
	cmp	ecx, 49					; 00000031H
	jne	SHORT $L70916
	push	0
	push	0
	push	7
	push	OFFSET FLAT:$SG70917
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	eax, DWORD PTR [edx+80]
	mov	ecx, DWORD PTR [eax+232]
	push	ecx
	call	_dynbuf_add
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L70916
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29872], OFFSET FLAT:$SG70919
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 644		; 00000284H
	jmp	$eva_err$70903
$L70916:

; 645  : 
; 646  : 	/* Handle label on right side of control */
; 647  : 	if(!strcmp("_EVA_RIGHT", ctrl->LABELPOS))

	mov	ecx, DWORD PTR _ctrl$[ebp]
	mov	edx, DWORD PTR [ecx+292]
	push	edx
	push	OFFSET FLAT:$SG70921
	call	_strcmp
	add	esp, 8
	test	eax, eax
	jne	$L70920

; 649  : 		ctrl->LABELROWSPAN = ctrl->ROWSPAN;

	mov	eax, DWORD PTR _ctrl$[ebp]
	mov	ecx, DWORD PTR _ctrl$[ebp]
	mov	edx, DWORD PTR [ecx+332]
	mov	DWORD PTR [eax+436], edx

; 650  : 		if(b_head)

	cmp	DWORD PTR _b_head$[ebp], 0
	je	SHORT $L70922

; 652  : 			/* Output cell header for control */
; 653  : 			if(!ctrl->ALIGN[0]) ctrl->ALIGN = "right";

	mov	eax, DWORD PTR _ctrl$[ebp]
	mov	ecx, DWORD PTR [eax+300]
	movsx	edx, BYTE PTR [ecx]
	test	edx, edx
	jne	SHORT $L70923
	mov	eax, DWORD PTR _ctrl$[ebp]
	mov	DWORD PTR [eax+300], OFFSET FLAT:$SG70924
$L70923:

; 654  : 			if(ctrl_format_cell(cntxt, ctrl, b_head)) STACK_ERROR;

	mov	ecx, DWORD PTR _b_head$[ebp]
	push	ecx
	mov	edx, DWORD PTR _ctrl$[ebp]
	push	edx
	mov	eax, DWORD PTR _cntxt$[ebp]
	push	eax
	call	_ctrl_format_cell
	add	esp, 12					; 0000000cH
	test	eax, eax
	je	SHORT $L70925
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 654		; 0000028eH
	jmp	$eva_err$70903
$L70925:

; 656  : 		else

	jmp	$L70931
$L70922:

; 658  : 			/* Output cell footer for control */
; 659  : 			if(ctrl_format_cell(cntxt, ctrl, b_head)) STACK_ERROR;

	mov	edx, DWORD PTR _b_head$[ebp]
	push	edx
	mov	eax, DWORD PTR _ctrl$[ebp]
	push	eax
	mov	ecx, DWORD PTR _cntxt$[ebp]
	push	ecx
	call	_ctrl_format_cell
	add	esp, 12					; 0000000cH
	test	eax, eax
	je	SHORT $L70927
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 659		; 00000293H
	jmp	$eva_err$70903
$L70927:

; 660  : 
; 661  : 			/* Output label */
; 662  : 			if(!ctrl->LABELALIGN[0]) ctrl->LABELALIGN = "left";

	mov	eax, DWORD PTR _ctrl$[ebp]
	mov	ecx, DWORD PTR [eax+384]
	movsx	edx, BYTE PTR [ecx]
	test	edx, edx
	jne	SHORT $L70928
	mov	eax, DWORD PTR _ctrl$[ebp]
	mov	DWORD PTR [eax+384], OFFSET FLAT:$SG70929
$L70928:

; 663  : 			if(!ctrl->LABELVALIGN[0]) ctrl->LABELVALIGN = ctrl->VALIGN;

	mov	ecx, DWORD PTR _ctrl$[ebp]
	mov	edx, DWORD PTR [ecx+388]
	movsx	eax, BYTE PTR [edx]
	test	eax, eax
	jne	SHORT $L70930
	mov	ecx, DWORD PTR _ctrl$[ebp]
	mov	edx, DWORD PTR _ctrl$[ebp]
	mov	eax, DWORD PTR [edx+304]
	mov	DWORD PTR [ecx+388], eax
$L70930:

; 664  : 			if(ctrl_put_label(cntxt, ctrl, "_EVA_NewColumn")) STACK_ERROR;

	push	OFFSET FLAT:$SG70932
	mov	ecx, DWORD PTR _ctrl$[ebp]
	push	ecx
	mov	edx, DWORD PTR _cntxt$[ebp]
	push	edx
	call	_ctrl_put_label
	add	esp, 12					; 0000000cH
	test	eax, eax
	je	SHORT $L70931
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 664		; 00000298H
	jmp	$eva_err$70903
$L70931:

; 667  : 	/* Handle label on top of control */
; 668  : 	else if(!strcmp("_EVA_TOP", ctrl->LABELPOS))

	jmp	$L71057
$L70920:
	mov	ecx, DWORD PTR _ctrl$[ebp]
	mov	edx, DWORD PTR [ecx+292]
	push	edx
	push	OFFSET FLAT:$SG70935
	call	_strcmp
	add	esp, 8
	test	eax, eax
	jne	$L70934

; 670  : 		if(b_head)

	cmp	DWORD PTR _b_head$[ebp], 0
	je	$L70936

; 672  : 			if(!ctrl->LABELALIGN[0]) ctrl->LABELALIGN = ctrl->ALIGN;

	mov	eax, DWORD PTR _ctrl$[ebp]
	mov	ecx, DWORD PTR [eax+384]
	movsx	edx, BYTE PTR [ecx]
	test	edx, edx
	jne	SHORT $L70937
	mov	eax, DWORD PTR _ctrl$[ebp]
	mov	ecx, DWORD PTR _ctrl$[ebp]
	mov	edx, DWORD PTR [ecx+300]
	mov	DWORD PTR [eax+384], edx
$L70937:

; 673  : 			if(!ctrl->COLSPAN) ctrl->COLSPAN = 2;

	mov	eax, DWORD PTR _ctrl$[ebp]
	cmp	DWORD PTR [eax+328], 0
	jne	SHORT $L70938
	mov	ecx, DWORD PTR _ctrl$[ebp]
	mov	DWORD PTR [ecx+328], 2
$L70938:

; 674  : 
; 675  : 			/* Output cell header for control & label */
; 676  : 			if(ctrl_format_cell(cntxt, ctrl, b_head)) STACK_ERROR;

	mov	edx, DWORD PTR _b_head$[ebp]
	push	edx
	mov	eax, DWORD PTR _ctrl$[ebp]
	push	eax
	mov	ecx, DWORD PTR _cntxt$[ebp]
	push	ecx
	call	_ctrl_format_cell
	add	esp, 12					; 0000000cH
	test	eax, eax
	je	SHORT $L70939
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 676		; 000002a4H
	jmp	$eva_err$70903
$L70939:

; 677  : 
; 678  : 			/* Output label in table */
; 679  : 			if(!ctrl->LABELVALIGN[0]) ctrl->LABELVALIGN = "bottom";

	mov	eax, DWORD PTR _ctrl$[ebp]
	mov	ecx, DWORD PTR [eax+388]
	movsx	edx, BYTE PTR [ecx]
	test	edx, edx
	jne	SHORT $L70940
	mov	eax, DWORD PTR _ctrl$[ebp]
	mov	DWORD PTR [eax+388], OFFSET FLAT:$SG70941
$L70940:

; 680  : 			if(put_html_table_header(cntxt, NULL, "100%", NULL,
; 681  : 				ctrl->LABELBGCOLOR, ctrl->LABELBACKGROUND,0, 0, 0, NULL, NULL, NULL)) STACK_ERROR;

	push	0
	push	0
	push	0
	push	0
	push	0
	push	0
	mov	ecx, DWORD PTR _ctrl$[ebp]
	mov	edx, DWORD PTR [ecx+404]
	push	edx
	mov	eax, DWORD PTR _ctrl$[ebp]
	mov	ecx, DWORD PTR [eax+400]
	push	ecx
	push	0
	push	OFFSET FLAT:$SG70948
	push	0
	mov	edx, DWORD PTR _cntxt$[ebp]
	push	edx
	call	_put_html_table_header
	add	esp, 48					; 00000030H
	test	eax, eax
	je	SHORT $L70947
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 681		; 000002a9H
	jmp	$eva_err$70903
$L70947:

; 682  : 			if(ctrl_put_label(cntxt, ctrl, "_EVA_NewColumn")) STACK_ERROR;

	push	OFFSET FLAT:$SG70950
	mov	ecx, DWORD PTR _ctrl$[ebp]
	push	ecx
	mov	edx, DWORD PTR _cntxt$[ebp]
	push	edx
	call	_ctrl_put_label
	add	esp, 12					; 0000000cH
	test	eax, eax
	je	SHORT $L70949
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 682		; 000002aaH
	jmp	$eva_err$70903
$L70949:

; 683  : 			DYNBUF_ADD_STR(cntxt->form->html, "</tr></table>");

	push	0
	push	0
	push	13					; 0000000dH
	push	OFFSET FLAT:$SG70953
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	edx, DWORD PTR [ecx+80]
	mov	eax, DWORD PTR [edx+232]
	push	eax
	call	_dynbuf_add
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L70952
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29872], OFFSET FLAT:$SG70955
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 683		; 000002abH
	jmp	$eva_err$70903
$L70952:

; 684  : 
; 685  : 			/* Enclose control in DIV if applicable */
; 686  : 			if(*CTRL_ATTR_VAL(USE_DIV) == '1')

	cmp	DWORD PTR _ctrl$[ebp], 0
	je	SHORT $L71756
	push	0
	push	-1
	push	OFFSET FLAT:$SG70957
	mov	eax, DWORD PTR _ctrl$[ebp]
	add	eax, 44					; 0000002cH
	push	eax
	call	_dyntab_field_val
	add	esp, 16					; 00000010H
	mov	DWORD PTR -8+[ebp], eax
	jmp	SHORT $L71757
$L71756:
	mov	DWORD PTR -8+[ebp], OFFSET FLAT:$SG70958
$L71757:
	mov	ecx, DWORD PTR -8+[ebp]
	movsx	edx, BYTE PTR [ecx]
	cmp	edx, 49					; 00000031H
	jne	$L70972

; 688  : 				DYNBUF_ADD_STR(cntxt->form->html, "<table");

	push	0
	push	0
	push	6
	push	OFFSET FLAT:$SG70961
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	ecx, DWORD PTR [eax+80]
	mov	edx, DWORD PTR [ecx+232]
	push	edx
	call	_dynbuf_add
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L70960
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29872], OFFSET FLAT:$SG70963
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 688		; 000002b0H
	jmp	$eva_err$70903
$L70960:

; 689  : 				if(*ctrl->TABLE_STYLE) DYNBUF_ADD3(cntxt->form->html, " class=", ctrl->TABLE_STYLE, 0, NO_CONV, "");

	mov	edx, DWORD PTR _ctrl$[ebp]
	mov	eax, DWORD PTR [edx+476]
	movsx	ecx, BYTE PTR [eax]
	test	ecx, ecx
	je	SHORT $L70966
	push	0
	push	OFFSET FLAT:$SG70967
	push	0
	push	0
	push	0
	mov	edx, DWORD PTR _ctrl$[ebp]
	mov	eax, DWORD PTR [edx+476]
	push	eax
	push	7
	push	OFFSET FLAT:$SG70968
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	edx, DWORD PTR [ecx+80]
	mov	eax, DWORD PTR [edx+232]
	push	eax
	call	_dynbuf_add3
	add	esp, 36					; 00000024H
	test	eax, eax
	je	SHORT $L70966
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29872], OFFSET FLAT:$SG70970
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 689		; 000002b1H
	jmp	$eva_err$70903
$L70966:

; 690  : 				DYNBUF_ADD_STR(cntxt->form->html, "><tr><td>");

	push	0
	push	0
	push	9
	push	OFFSET FLAT:$SG70973
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	ecx, DWORD PTR [eax+80]
	mov	edx, DWORD PTR [ecx+232]
	push	edx
	call	_dynbuf_add
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L70972
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29872], OFFSET FLAT:$SG70975
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 690		; 000002b2H
	jmp	$eva_err$70903
$L70972:

; 693  : 		else

	jmp	$L70985
$L70936:

; 695  : 			/* Output cell footer for control */
; 696  : 			if(*CTRL_ATTR_VAL(USE_DIV) == '1') DYNBUF_ADD_STR(cntxt->form->html, "</td></tr></table>");

	cmp	DWORD PTR _ctrl$[ebp], 0
	je	SHORT $L71758
	push	0
	push	-1
	push	OFFSET FLAT:$SG70978
	mov	edx, DWORD PTR _ctrl$[ebp]
	add	edx, 44					; 0000002cH
	push	edx
	call	_dyntab_field_val
	add	esp, 16					; 00000010H
	mov	DWORD PTR -12+[ebp], eax
	jmp	SHORT $L71759
$L71758:
	mov	DWORD PTR -12+[ebp], OFFSET FLAT:$SG70979
$L71759:
	mov	eax, DWORD PTR -12+[ebp]
	movsx	ecx, BYTE PTR [eax]
	cmp	ecx, 49					; 00000031H
	jne	SHORT $L70981
	push	0
	push	0
	push	18					; 00000012H
	push	OFFSET FLAT:$SG70982
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	eax, DWORD PTR [edx+80]
	mov	ecx, DWORD PTR [eax+232]
	push	ecx
	call	_dynbuf_add
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L70981
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29872], OFFSET FLAT:$SG70984
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 696		; 000002b8H
	jmp	$eva_err$70903
$L70981:

; 697  : 			if(ctrl_format_cell(cntxt, ctrl, b_head)) STACK_ERROR;

	mov	ecx, DWORD PTR _b_head$[ebp]
	push	ecx
	mov	edx, DWORD PTR _ctrl$[ebp]
	push	edx
	mov	eax, DWORD PTR _cntxt$[ebp]
	push	eax
	call	_ctrl_format_cell
	add	esp, 12					; 0000000cH
	test	eax, eax
	je	SHORT $L70985
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 697		; 000002b9H
	jmp	$eva_err$70903
$L70985:

; 700  : 	/* Handle label on bottom of control */
; 701  : 	else if(!strcmp("_EVA_BOTTOM", ctrl->LABELPOS))

	jmp	$L71057
$L70934:
	mov	edx, DWORD PTR _ctrl$[ebp]
	mov	eax, DWORD PTR [edx+292]
	push	eax
	push	OFFSET FLAT:$SG70988
	call	_strcmp
	add	esp, 8
	test	eax, eax
	jne	$L70987

; 703  : 		if(b_head)

	cmp	DWORD PTR _b_head$[ebp], 0
	je	$L70989

; 705  : 			if(!ctrl->LABELALIGN[0]) ctrl->LABELALIGN = ctrl->ALIGN;

	mov	ecx, DWORD PTR _ctrl$[ebp]
	mov	edx, DWORD PTR [ecx+384]
	movsx	eax, BYTE PTR [edx]
	test	eax, eax
	jne	SHORT $L70990
	mov	ecx, DWORD PTR _ctrl$[ebp]
	mov	edx, DWORD PTR _ctrl$[ebp]
	mov	eax, DWORD PTR [edx+300]
	mov	DWORD PTR [ecx+384], eax
$L70990:

; 706  : 			if(!ctrl->COLSPAN) ctrl->COLSPAN = 2;

	mov	ecx, DWORD PTR _ctrl$[ebp]
	cmp	DWORD PTR [ecx+328], 0
	jne	SHORT $L70991
	mov	edx, DWORD PTR _ctrl$[ebp]
	mov	DWORD PTR [edx+328], 2
$L70991:

; 707  : 
; 708  : 			/* Output cell header for control & label */
; 709  : 			if(ctrl_format_cell(cntxt, ctrl, b_head)) STACK_ERROR;

	mov	eax, DWORD PTR _b_head$[ebp]
	push	eax
	mov	ecx, DWORD PTR _ctrl$[ebp]
	push	ecx
	mov	edx, DWORD PTR _cntxt$[ebp]
	push	edx
	call	_ctrl_format_cell
	add	esp, 12					; 0000000cH
	test	eax, eax
	je	SHORT $L70992
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 709		; 000002c5H
	jmp	$eva_err$70903
$L70992:

; 710  : 
; 711  : 			/* Enclose control in DIV if applicable */
; 712  : 			if(*CTRL_ATTR_VAL(USE_DIV) == '1')

	cmp	DWORD PTR _ctrl$[ebp], 0
	je	SHORT $L71760
	push	0
	push	-1
	push	OFFSET FLAT:$SG70994
	mov	ecx, DWORD PTR _ctrl$[ebp]
	add	ecx, 44					; 0000002cH
	push	ecx
	call	_dyntab_field_val
	add	esp, 16					; 00000010H
	mov	DWORD PTR -16+[ebp], eax
	jmp	SHORT $L71761
$L71760:
	mov	DWORD PTR -16+[ebp], OFFSET FLAT:$SG70995
$L71761:
	mov	edx, DWORD PTR -16+[ebp]
	movsx	eax, BYTE PTR [edx]
	cmp	eax, 49					; 00000031H
	jne	$L71009

; 714  : 				DYNBUF_ADD_STR(cntxt->form->html, "<table");

	push	0
	push	0
	push	6
	push	OFFSET FLAT:$SG70998
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	edx, DWORD PTR [ecx+80]
	mov	eax, DWORD PTR [edx+232]
	push	eax
	call	_dynbuf_add
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L70997
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29872], OFFSET FLAT:$SG71000
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 714		; 000002caH
	jmp	$eva_err$70903
$L70997:

; 715  : 				if(*ctrl->TABLE_STYLE) DYNBUF_ADD3(cntxt->form->html, " class=", ctrl->TABLE_STYLE, 0, NO_CONV, "");

	mov	eax, DWORD PTR _ctrl$[ebp]
	mov	ecx, DWORD PTR [eax+476]
	movsx	edx, BYTE PTR [ecx]
	test	edx, edx
	je	SHORT $L71003
	push	0
	push	OFFSET FLAT:$SG71004
	push	0
	push	0
	push	0
	mov	eax, DWORD PTR _ctrl$[ebp]
	mov	ecx, DWORD PTR [eax+476]
	push	ecx
	push	7
	push	OFFSET FLAT:$SG71005
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	eax, DWORD PTR [edx+80]
	mov	ecx, DWORD PTR [eax+232]
	push	ecx
	call	_dynbuf_add3
	add	esp, 36					; 00000024H
	test	eax, eax
	je	SHORT $L71003
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29872], OFFSET FLAT:$SG71007
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 715		; 000002cbH
	jmp	$eva_err$70903
$L71003:

; 716  : 				DYNBUF_ADD_STR(cntxt->form->html, "><tr><td>");

	push	0
	push	0
	push	9
	push	OFFSET FLAT:$SG71010
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	edx, DWORD PTR [ecx+80]
	mov	eax, DWORD PTR [edx+232]
	push	eax
	call	_dynbuf_add
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L71009
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29872], OFFSET FLAT:$SG71012
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 716		; 000002ccH
	jmp	$eva_err$70903
$L71009:

; 719  : 		else

	jmp	$L71038
$L70989:

; 721  : 			if(*CTRL_ATTR_VAL(USE_DIV) == '1') DYNBUF_ADD_STR(cntxt->form->html, "</td></tr></table>");

	cmp	DWORD PTR _ctrl$[ebp], 0
	je	SHORT $L71762
	push	0
	push	-1
	push	OFFSET FLAT:$SG71015
	mov	eax, DWORD PTR _ctrl$[ebp]
	add	eax, 44					; 0000002cH
	push	eax
	call	_dyntab_field_val
	add	esp, 16					; 00000010H
	mov	DWORD PTR -20+[ebp], eax
	jmp	SHORT $L71763
$L71762:
	mov	DWORD PTR -20+[ebp], OFFSET FLAT:$SG71016
$L71763:
	mov	ecx, DWORD PTR -20+[ebp]
	movsx	edx, BYTE PTR [ecx]
	cmp	edx, 49					; 00000031H
	jne	SHORT $L71018
	push	0
	push	0
	push	18					; 00000012H
	push	OFFSET FLAT:$SG71019
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	ecx, DWORD PTR [eax+80]
	mov	edx, DWORD PTR [ecx+232]
	push	edx
	call	_dynbuf_add
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L71018
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29872], OFFSET FLAT:$SG71021
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 721		; 000002d1H
	jmp	$eva_err$70903
$L71018:

; 722  : 
; 723  : 			/* Output label in table */
; 724  : 			if(!ctrl->LABELVALIGN[0]) ctrl->LABELVALIGN = "top";

	mov	edx, DWORD PTR _ctrl$[ebp]
	mov	eax, DWORD PTR [edx+388]
	movsx	ecx, BYTE PTR [eax]
	test	ecx, ecx
	jne	SHORT $L71022
	mov	edx, DWORD PTR _ctrl$[ebp]
	mov	DWORD PTR [edx+388], OFFSET FLAT:$SG71023
$L71022:

; 725  : 			if(put_html_table_header(cntxt, NULL, "100%", NULL, ctrl->LABELBGCOLOR, ctrl->LABELBACKGROUND,0, 0, 0, NULL, NULL, NULL)) STACK_ERROR;

	push	0
	push	0
	push	0
	push	0
	push	0
	push	0
	mov	eax, DWORD PTR _ctrl$[ebp]
	mov	ecx, DWORD PTR [eax+404]
	push	ecx
	mov	edx, DWORD PTR _ctrl$[ebp]
	mov	eax, DWORD PTR [edx+400]
	push	eax
	push	0
	push	OFFSET FLAT:$SG71030
	push	0
	mov	ecx, DWORD PTR _cntxt$[ebp]
	push	ecx
	call	_put_html_table_header
	add	esp, 48					; 00000030H
	test	eax, eax
	je	SHORT $L71029
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 725		; 000002d5H
	jmp	$eva_err$70903
$L71029:

; 726  : 			if(ctrl_put_label(cntxt, ctrl, "_EVA_NewColumn")) STACK_ERROR;

	push	OFFSET FLAT:$SG71032
	mov	eax, DWORD PTR _ctrl$[ebp]
	push	eax
	mov	ecx, DWORD PTR _cntxt$[ebp]
	push	ecx
	call	_ctrl_put_label
	add	esp, 12					; 0000000cH
	test	eax, eax
	je	SHORT $L71031
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 726		; 000002d6H
	jmp	$eva_err$70903
$L71031:

; 727  : 			DYNBUF_ADD_STR(cntxt->form->html, "</tr></table>");

	push	0
	push	0
	push	13					; 0000000dH
	push	OFFSET FLAT:$SG71035
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	ecx, DWORD PTR [eax+80]
	mov	edx, DWORD PTR [ecx+232]
	push	edx
	call	_dynbuf_add
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L71034
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29872], OFFSET FLAT:$SG71037
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 727		; 000002d7H
	jmp	$eva_err$70903
$L71034:

; 728  : 
; 729  : 			/* Output cell footer for control & label */
; 730  : 			if(ctrl_format_cell(cntxt, ctrl, b_head)) STACK_ERROR;

	mov	edx, DWORD PTR _b_head$[ebp]
	push	edx
	mov	eax, DWORD PTR _ctrl$[ebp]
	push	eax
	mov	ecx, DWORD PTR _cntxt$[ebp]
	push	ecx
	call	_ctrl_format_cell
	add	esp, 12					; 0000000cH
	test	eax, eax
	je	SHORT $L71038
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 730		; 000002daH
	jmp	$eva_err$70903
$L71038:

; 733  : 	/* Handle no label */
; 734  : 	else if(!strcmp("_EVA_NONE", ctrl->LABELPOS))

	jmp	$L71057
$L70987:
	mov	eax, DWORD PTR _ctrl$[ebp]
	mov	ecx, DWORD PTR [eax+292]
	push	ecx
	push	OFFSET FLAT:$SG71041
	call	_strcmp
	add	esp, 8
	test	eax, eax
	jne	SHORT $L71040

; 736  : 		if(b_head)

	cmp	DWORD PTR _b_head$[ebp], 0
	je	SHORT $L71042

; 738  : 			/* Output cell header for control */
; 739  : 			if(!ctrl->COLSPAN) ctrl->COLSPAN = 2;

	mov	edx, DWORD PTR _ctrl$[ebp]
	cmp	DWORD PTR [edx+328], 0
	jne	SHORT $L71043
	mov	eax, DWORD PTR _ctrl$[ebp]
	mov	DWORD PTR [eax+328], 2
$L71043:

; 740  : 			if(ctrl_format_cell(cntxt, ctrl, b_head)) STACK_ERROR;

	mov	ecx, DWORD PTR _b_head$[ebp]
	push	ecx
	mov	edx, DWORD PTR _ctrl$[ebp]
	push	edx
	mov	eax, DWORD PTR _cntxt$[ebp]
	push	eax
	call	_ctrl_format_cell
	add	esp, 12					; 0000000cH
	test	eax, eax
	je	SHORT $L71044
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 740		; 000002e4H
	jmp	$eva_err$70903
$L71044:

; 742  : 		else

	jmp	SHORT $L71046
$L71042:

; 744  : 			/* Output cell footer for control */
; 745  : 			if(ctrl_format_cell(cntxt, ctrl, b_head)) STACK_ERROR;

	mov	edx, DWORD PTR _b_head$[ebp]
	push	edx
	mov	eax, DWORD PTR _ctrl$[ebp]
	push	eax
	mov	ecx, DWORD PTR _cntxt$[ebp]
	push	ecx
	call	_ctrl_format_cell
	add	esp, 12					; 0000000cH
	test	eax, eax
	je	SHORT $L71046
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 745		; 000002e9H
	jmp	$eva_err$70903
$L71046:

; 748  : 	/* Handle label on left side of control */
; 749  : 	else

	jmp	$L71057
$L71040:

; 751  : 		ctrl->LABELROWSPAN = ctrl->ROWSPAN;

	mov	eax, DWORD PTR _ctrl$[ebp]
	mov	ecx, DWORD PTR _ctrl$[ebp]
	mov	edx, DWORD PTR [ecx+332]
	mov	DWORD PTR [eax+436], edx

; 752  : 		if(b_head)

	cmp	DWORD PTR _b_head$[ebp], 0
	je	$L71048

; 754  : 			char *pos = ctrl->POSITION;

	mov	eax, DWORD PTR _ctrl$[ebp]
	mov	ecx, DWORD PTR [eax+296]
	mov	DWORD PTR _pos$71049[ebp], ecx

; 755  : 
; 756  : 			/* Output label */
; 757  : 			if(!ctrl->LABELALIGN[0]) ctrl->LABELALIGN = "right";

	mov	edx, DWORD PTR _ctrl$[ebp]
	mov	eax, DWORD PTR [edx+384]
	movsx	ecx, BYTE PTR [eax]
	test	ecx, ecx
	jne	SHORT $L71050
	mov	edx, DWORD PTR _ctrl$[ebp]
	mov	DWORD PTR [edx+384], OFFSET FLAT:$SG71051
$L71050:

; 758  : 			if(!ctrl->LABELVALIGN[0]) ctrl->LABELVALIGN = ctrl->VALIGN;

	mov	eax, DWORD PTR _ctrl$[ebp]
	mov	ecx, DWORD PTR [eax+388]
	movsx	edx, BYTE PTR [ecx]
	test	edx, edx
	jne	SHORT $L71052
	mov	eax, DWORD PTR _ctrl$[ebp]
	mov	ecx, DWORD PTR _ctrl$[ebp]
	mov	edx, DWORD PTR [ecx+304]
	mov	DWORD PTR [eax+388], edx
$L71052:

; 759  : 			if(ctrl_put_label(cntxt, ctrl, pos)) STACK_ERROR;

	mov	eax, DWORD PTR _pos$71049[ebp]
	push	eax
	mov	ecx, DWORD PTR _ctrl$[ebp]
	push	ecx
	mov	edx, DWORD PTR _cntxt$[ebp]
	push	edx
	call	_ctrl_put_label
	add	esp, 12					; 0000000cH
	test	eax, eax
	je	SHORT $L71053
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 759		; 000002f7H
	jmp	$eva_err$70903
$L71053:

; 760  : 
; 761  : 			/* Output cell header for control */
; 762  : 			ctrl->POSITION = "_EVA_NewColumn";

	mov	ecx, DWORD PTR _ctrl$[ebp]
	mov	DWORD PTR [ecx+296], OFFSET FLAT:$SG71054

; 763  : 			if(ctrl_format_cell(cntxt, ctrl, b_head)) STACK_ERROR;

	mov	edx, DWORD PTR _b_head$[ebp]
	push	edx
	mov	eax, DWORD PTR _ctrl$[ebp]
	push	eax
	mov	ecx, DWORD PTR _cntxt$[ebp]
	push	ecx
	call	_ctrl_format_cell
	add	esp, 12					; 0000000cH
	test	eax, eax
	je	SHORT $L71055
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 763		; 000002fbH
	jmp	$eva_err$70903
$L71055:

; 764  : 			ctrl->POSITION = pos;

	mov	eax, DWORD PTR _ctrl$[ebp]
	mov	ecx, DWORD PTR _pos$71049[ebp]
	mov	DWORD PTR [eax+296], ecx

; 766  : 		else

	jmp	SHORT $L71057
$L71048:

; 768  : 			/* Output cell footer for control */
; 769  : 			if(ctrl_format_cell(cntxt, ctrl, b_head)) STACK_ERROR;

	mov	edx, DWORD PTR _b_head$[ebp]
	push	edx
	mov	eax, DWORD PTR _ctrl$[ebp]
	push	eax
	mov	ecx, DWORD PTR _cntxt$[ebp]
	push	ecx
	call	_ctrl_format_cell
	add	esp, 12					; 0000000cH
	test	eax, eax
	je	SHORT $L71057
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 769		; 00000301H
	jmp	$eva_err$70903
$L71057:

; 772  : 
; 773  : 	/* Handle NOBR */
; 774  : 	if(b_head && ctrl->NOBR && *ctrl->NOBR == '1') DYNBUF_ADD_STR(cntxt->form->html, "<nobr>");

	cmp	DWORD PTR _b_head$[ebp], 0
	je	SHORT $L71060
	mov	eax, DWORD PTR _ctrl$[ebp]
	cmp	DWORD PTR [eax+316], 0
	je	SHORT $L71060
	mov	ecx, DWORD PTR _ctrl$[ebp]
	mov	edx, DWORD PTR [ecx+316]
	movsx	eax, BYTE PTR [edx]
	cmp	eax, 49					; 00000031H
	jne	SHORT $L71060
	push	0
	push	0
	push	6
	push	OFFSET FLAT:$SG71061
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	edx, DWORD PTR [ecx+80]
	mov	eax, DWORD PTR [edx+232]
	push	eax
	call	_dynbuf_add
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L71060
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29872], OFFSET FLAT:$SG71063
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 774		; 00000306H
	jmp	$eva_err$70903
$L71060:

; 775  : 
; 776  : 	if(cntxt->debug & DEBUG_HTML && !b_head)

	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	ecx, DWORD PTR [eax+29860]
	and	ecx, 128				; 00000080H
	test	ecx, ecx
	je	$L71076
	cmp	DWORD PTR _b_head$[ebp], 0
	jne	$L71076

; 778  : 		DYNBUF_ADD3(cntxt->form->html, "\n<!--- EndOf ", ctrl->CONTROL, 0, NO_CONV, " / ");

	push	3
	push	OFFSET FLAT:$SG71067
	push	0
	push	0
	push	0
	mov	edx, DWORD PTR _ctrl$[ebp]
	mov	eax, DWORD PTR [edx+272]
	push	eax
	push	13					; 0000000dH
	push	OFFSET FLAT:$SG71068
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	edx, DWORD PTR [ecx+80]
	mov	eax, DWORD PTR [edx+232]
	push	eax
	call	_dynbuf_add3
	add	esp, 36					; 00000024H
	test	eax, eax
	je	SHORT $L71066
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29872], OFFSET FLAT:$SG71070
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 778		; 0000030aH
	jmp	$eva_err$70903
$L71066:

; 779  : 		DYNBUF_ADD(cntxt->form->html, ctrl->TYPE, 0, NO_CONV);

	push	0
	push	0
	push	0
	mov	eax, DWORD PTR _ctrl$[ebp]
	mov	ecx, DWORD PTR [eax+276]
	push	ecx
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	eax, DWORD PTR [edx+80]
	mov	ecx, DWORD PTR [eax+232]
	push	ecx
	call	_dynbuf_add
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L71072
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29872], OFFSET FLAT:$SG71074
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 779		; 0000030bH
	jmp	SHORT $eva_err$70903
$L71072:

; 780  : 		DYNBUF_ADD3(cntxt->form->html, " / ", ctrl->LABEL, 0, NO_CONV, " -->\n");

	push	5
	push	OFFSET FLAT:$SG71077
	push	0
	push	0
	push	0
	mov	ecx, DWORD PTR _ctrl$[ebp]
	mov	edx, DWORD PTR [ecx+284]
	push	edx
	push	3
	push	OFFSET FLAT:$SG71078
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	ecx, DWORD PTR [eax+80]
	mov	edx, DWORD PTR [ecx+232]
	push	edx
	call	_dynbuf_add3
	add	esp, 36					; 00000024H
	test	eax, eax
	je	SHORT $L71076
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29872], OFFSET FLAT:$SG71080
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 780		; 0000030cH
	jmp	SHORT $eva_err$70903
$L71076:
$eva_noerr$70895:

; 782  : 
; 783  : 	RETURN_OK_CLEANUP;

	push	0
	push	OFFSET FLAT:$SG71081
	push	OFFSET FLAT:$SG71082
	mov	edx, DWORD PTR _cntxt$[ebp]
	push	edx
	call	_err_clear
	add	esp, 16					; 00000010H
$eva_err$70903:
	mov	eax, DWORD PTR _cntxt$[ebp]
	cmp	DWORD PTR [eax+29872], 0
	je	SHORT $L71083
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	edx, DWORD PTR [ecx+29900]
	push	edx
	push	OFFSET FLAT:$SG71084
	push	OFFSET FLAT:$SG71085
	mov	eax, DWORD PTR _cntxt$[ebp]
	push	eax
	call	_err_add_context
	add	esp, 16					; 00000010H
$L71083:
	mov	ecx, DWORD PTR _cntxt$[ebp]
	xor	eax, eax
	cmp	DWORD PTR [ecx+29872], 0
	setne	al

; 784  : }

	mov	esp, ebp
	pop	ebp
	ret	0
_ctrl_format_pos ENDP
_TEXT	ENDS
PUBLIC	_ctrl_put_table_header
EXTRN	_atoi:NEAR
_BSS	SEGMENT
	ALIGN	4

$SG71096 DB	01H DUP (?)
	ALIGN	4

$SG71101 DB	01H DUP (?)
	ALIGN	4

$SG71123 DB	01H DUP (?)
	ALIGN	4

$SG71125 DB	01H DUP (?)
	ALIGN	4

$SG71127 DB	01H DUP (?)
_BSS	ENDS
_DATA	SEGMENT
$SG71095 DB	'_EVA_BORDER_STYLE', 00H
	ORG $+2
$SG71099 DB	'_EVA_SHRINKBTN', 00H
	ORG $+1
$SG71100 DB	' style=''display:none''', 00H
	ORG $+2
$SG71102 DB	'id=Mnu%s%s', 00H
	ORG $+1
$SG71106 DB	' / ', 00H
$SG71107 DB	0aH, '<!--- Start Table ', 00H
$SG71109 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG71114 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG71117 DB	' -->', 0aH, 00H
	ORG $+2
$SG71118 DB	' / ', 00H
$SG71120 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG71122 DB	'_EVA_CELLPADDING', 00H
	ORG $+3
$SG71124 DB	'_EVA_CELLSPACING', 00H
	ORG $+3
$SG71126 DB	'_EVA_TABLEALIGN', 00H
$SG71129 DB	'D:\Travail\ABI\EVA\V4.0\CGI\Brunix-2016\ctrl_utils.c', 00H
	ORG $+3
$SG71130 DB	'ctrl_put_table_header', 00H
	ORG $+2
$SG71132 DB	'D:\Travail\ABI\EVA\V4.0\CGI\Brunix-2016\ctrl_utils.c', 00H
	ORG $+3
$SG71133 DB	'ctrl_put_table_header', 00H
_DATA	ENDS
_TEXT	SEGMENT
_cntxt$ = 8
_ctrl$ = 12
_br_style$ = -68
_attr$ = -64
_ctrl_put_table_header PROC NEAR

; 797  : ){

	push	ebp
	mov	ebp, esp
	sub	esp, 88					; 00000058H
	push	edi

; 798  : 	char *br_style = CTRL_ATTR_VAL(BORDER_STYLE);

	cmp	DWORD PTR _ctrl$[ebp], 0
	je	SHORT $L71765
	push	0
	push	-1
	push	OFFSET FLAT:$SG71095
	mov	eax, DWORD PTR _ctrl$[ebp]
	add	eax, 44					; 0000002cH
	push	eax
	call	_dyntab_field_val
	add	esp, 16					; 00000010H
	mov	DWORD PTR -72+[ebp], eax
	jmp	SHORT $L71766
$L71765:
	mov	DWORD PTR -72+[ebp], OFFSET FLAT:$SG71096
$L71766:
	mov	ecx, DWORD PTR -72+[ebp]
	mov	DWORD PTR _br_style$[ebp], ecx

; 799  : 	char attr[64] = {0};

	mov	BYTE PTR _attr$[ebp], 0
	mov	ecx, 15					; 0000000fH
	xor	eax, eax
	lea	edi, DWORD PTR _attr$[ebp+1]
	rep stosd
	stosw
	stosb

; 800  : 
; 801  : 	/* Handle shrink button */
; 802  : 	if(!strncmp(br_style, add_sz_str("_EVA_SHRINKBTN")))

	push	14					; 0000000eH
	push	OFFSET FLAT:$SG71099
	mov	edx, DWORD PTR _br_style$[ebp]
	push	edx
	call	_strncmp
	add	esp, 12					; 0000000cH
	test	eax, eax
	jne	SHORT $L71098

; 803  : 		snprintf(add_sz_str(attr), "id=Mnu%s%s", dyntab_val(&ctrl->id, 0, 0), br_style[14] ? " style='display:none'" : "");

	mov	eax, DWORD PTR _br_style$[ebp]
	movsx	ecx, BYTE PTR [eax+14]
	test	ecx, ecx
	je	SHORT $L71767
	mov	DWORD PTR -76+[ebp], OFFSET FLAT:$SG71100
	jmp	SHORT $L71768
$L71767:
	mov	DWORD PTR -76+[ebp], OFFSET FLAT:$SG71101
$L71768:
	mov	edx, DWORD PTR -76+[ebp]
	push	edx
	push	0
	push	0
	mov	eax, DWORD PTR _ctrl$[ebp]
	push	eax
	call	_dyntab_val
	add	esp, 12					; 0000000cH
	push	eax
	push	OFFSET FLAT:$SG71102
	push	63					; 0000003fH
	lea	ecx, DWORD PTR _attr$[ebp]
	push	ecx
	call	__snprintf
	add	esp, 20					; 00000014H
$L71098:

; 804  : 
; 805  : 	/* Output HTML debug info if applicable */
; 806  : 	if(cntxt->debug & DEBUG_HTML)

	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	eax, DWORD PTR [edx+29860]
	and	eax, 128				; 00000080H
	test	eax, eax
	je	$L71116

; 808  : 		DYNBUF_ADD3(cntxt->form->html, "\n<!--- Start Table ", ctrl->CONTROL, 0, NO_CONV, " / ");

	push	3
	push	OFFSET FLAT:$SG71106
	push	0
	push	0
	push	0
	mov	ecx, DWORD PTR _ctrl$[ebp]
	mov	edx, DWORD PTR [ecx+272]
	push	edx
	push	19					; 00000013H
	push	OFFSET FLAT:$SG71107
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	ecx, DWORD PTR [eax+80]
	mov	edx, DWORD PTR [ecx+232]
	push	edx
	call	_dynbuf_add3
	add	esp, 36					; 00000024H
	test	eax, eax
	je	SHORT $L71105
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29872], OFFSET FLAT:$SG71109
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 808		; 00000328H
	jmp	$eva_err$71110
$L71105:

; 809  : 		DYNBUF_ADD(cntxt->form->html, ctrl->TYPE, 0, NO_CONV);

	push	0
	push	0
	push	0
	mov	edx, DWORD PTR _ctrl$[ebp]
	mov	eax, DWORD PTR [edx+276]
	push	eax
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	edx, DWORD PTR [ecx+80]
	mov	eax, DWORD PTR [edx+232]
	push	eax
	call	_dynbuf_add
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L71112
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29872], OFFSET FLAT:$SG71114
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 809		; 00000329H
	jmp	$eva_err$71110
$L71112:

; 810  : 		DYNBUF_ADD3(cntxt->form->html, " / ", ctrl->LABEL, 0, NO_CONV, " -->\n");

	push	5
	push	OFFSET FLAT:$SG71117
	push	0
	push	0
	push	0
	mov	eax, DWORD PTR _ctrl$[ebp]
	mov	ecx, DWORD PTR [eax+284]
	push	ecx
	push	3
	push	OFFSET FLAT:$SG71118
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	eax, DWORD PTR [edx+80]
	mov	ecx, DWORD PTR [eax+232]
	push	ecx
	call	_dynbuf_add3
	add	esp, 36					; 00000024H
	test	eax, eax
	je	SHORT $L71116
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29872], OFFSET FLAT:$SG71120
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 810		; 0000032aH
	jmp	$eva_err$71110
$L71116:

; 812  : 
; 813  : 	/* Output HTML container table header */
; 814  : 	if(put_html_table_header(cntxt,
; 815  : 			CTRL_ATTR_VAL(TABLEALIGN),
; 816  : 			ctrl->TABLEWIDTH,
; 817  : 			ctrl->TABLEHEIGHT,
; 818  : 			ctrl->TABLEBGCOLOR,
; 819  : 			ctrl->TABLEBACKGROUND,
; 820  : 			atoi(CTRL_ATTR_VAL(CELLSPACING)),
; 821  : 			atoi(CTRL_ATTR_VAL(CELLPADDING)),
; 822  : 			ctrl->BORDER,
; 823  : 			ctrl->TABLERULES,
; 824  : 			ctrl->TABLE_STYLE, attr))

	cmp	DWORD PTR _ctrl$[ebp], 0
	je	SHORT $L71769
	push	0
	push	-1
	push	OFFSET FLAT:$SG71122
	mov	ecx, DWORD PTR _ctrl$[ebp]
	add	ecx, 44					; 0000002cH
	push	ecx
	call	_dyntab_field_val
	add	esp, 16					; 00000010H
	mov	DWORD PTR -80+[ebp], eax
	jmp	SHORT $L71770
$L71769:
	mov	DWORD PTR -80+[ebp], OFFSET FLAT:$SG71123
$L71770:
	cmp	DWORD PTR _ctrl$[ebp], 0
	je	SHORT $L71771
	push	0
	push	-1
	push	OFFSET FLAT:$SG71124
	mov	edx, DWORD PTR _ctrl$[ebp]
	add	edx, 44					; 0000002cH
	push	edx
	call	_dyntab_field_val
	add	esp, 16					; 00000010H
	mov	DWORD PTR -84+[ebp], eax
	jmp	SHORT $L71772
$L71771:
	mov	DWORD PTR -84+[ebp], OFFSET FLAT:$SG71125
$L71772:
	cmp	DWORD PTR _ctrl$[ebp], 0
	je	SHORT $L71773
	push	0
	push	-1
	push	OFFSET FLAT:$SG71126
	mov	eax, DWORD PTR _ctrl$[ebp]
	add	eax, 44					; 0000002cH
	push	eax
	call	_dyntab_field_val
	add	esp, 16					; 00000010H
	mov	DWORD PTR -88+[ebp], eax
	jmp	SHORT $L71774
$L71773:
	mov	DWORD PTR -88+[ebp], OFFSET FLAT:$SG71127
$L71774:
	lea	ecx, DWORD PTR _attr$[ebp]
	push	ecx
	mov	edx, DWORD PTR _ctrl$[ebp]
	mov	eax, DWORD PTR [edx+476]
	push	eax
	mov	ecx, DWORD PTR _ctrl$[ebp]
	mov	edx, DWORD PTR [ecx+448]
	push	edx
	mov	eax, DWORD PTR _ctrl$[ebp]
	mov	ecx, DWORD PTR [eax+460]
	push	ecx
	mov	edx, DWORD PTR -80+[ebp]
	push	edx
	call	_atoi
	add	esp, 4
	push	eax
	mov	eax, DWORD PTR -84+[ebp]
	push	eax
	call	_atoi
	add	esp, 4
	push	eax
	mov	ecx, DWORD PTR _ctrl$[ebp]
	mov	edx, DWORD PTR [ecx+456]
	push	edx
	mov	eax, DWORD PTR _ctrl$[ebp]
	mov	ecx, DWORD PTR [eax+452]
	push	ecx
	mov	edx, DWORD PTR _ctrl$[ebp]
	mov	eax, DWORD PTR [edx+444]
	push	eax
	mov	ecx, DWORD PTR _ctrl$[ebp]
	mov	edx, DWORD PTR [ecx+440]
	push	edx
	mov	eax, DWORD PTR -88+[ebp]
	push	eax
	mov	ecx, DWORD PTR _cntxt$[ebp]
	push	ecx
	call	_put_html_table_header
	add	esp, 48					; 00000030H
	test	eax, eax
	je	SHORT $eva_noerr$71128

; 825  : 		STACK_ERROR;

	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 825		; 00000339H
	jmp	SHORT $eva_err$71110
$eva_noerr$71128:

; 826  : 
; 827  : 	RETURN_OK_CLEANUP;

	push	0
	push	OFFSET FLAT:$SG71129
	push	OFFSET FLAT:$SG71130
	mov	eax, DWORD PTR _cntxt$[ebp]
	push	eax
	call	_err_clear
	add	esp, 16					; 00000010H
$eva_err$71110:
	mov	ecx, DWORD PTR _cntxt$[ebp]
	cmp	DWORD PTR [ecx+29872], 0
	je	SHORT $L71131
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	eax, DWORD PTR [edx+29900]
	push	eax
	push	OFFSET FLAT:$SG71132
	push	OFFSET FLAT:$SG71133
	mov	ecx, DWORD PTR _cntxt$[ebp]
	push	ecx
	call	_err_add_context
	add	esp, 16					; 00000010H
$L71131:
	mov	edx, DWORD PTR _cntxt$[ebp]
	xor	eax, eax
	cmp	DWORD PTR [edx+29872], 0
	setne	al

; 828  : }

	pop	edi
	mov	esp, ebp
	pop	ebp
	ret	0
_ctrl_put_table_header ENDP
_TEXT	ENDS
PUBLIC	_ctrl_put_table_footer
_DATA	SEGMENT
	ORG $+2
$SG71148 DB	'</tr></table>', 00H
	ORG $+2
$SG71150 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG71155 DB	' / ', 00H
$SG71156 DB	0aH, '<!--- Endof Table ', 00H
$SG71158 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG71162 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG71165 DB	' -->', 0aH, 00H
	ORG $+2
$SG71166 DB	' / ', 00H
$SG71168 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG71170 DB	'D:\Travail\ABI\EVA\V4.0\CGI\Brunix-2016\ctrl_utils.c', 00H
	ORG $+3
$SG71171 DB	'ctrl_put_table_footer', 00H
	ORG $+2
$SG71173 DB	'D:\Travail\ABI\EVA\V4.0\CGI\Brunix-2016\ctrl_utils.c', 00H
	ORG $+3
$SG71174 DB	'ctrl_put_table_footer', 00H
_DATA	ENDS
_TEXT	SEGMENT
_cntxt$ = 8
_ctrl$ = 12
_html$ = -4
_ctrl_put_table_footer PROC NEAR

; 841  : ){

	push	ebp
	mov	ebp, esp
	sub	esp, 12					; 0000000cH

; 842  : 	CHECK_HTML_STATUS;

	cmp	DWORD PTR _cntxt$[ebp], 0
	je	SHORT $L71778
	mov	eax, DWORD PTR _cntxt$[ebp]
	cmp	DWORD PTR [eax+80], 0
	je	SHORT $L71776
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	edx, DWORD PTR [ecx+80]
	mov	eax, DWORD PTR [edx+232]
	mov	DWORD PTR -8+[ebp], eax
	jmp	SHORT $L71777
$L71776:
	mov	DWORD PTR -8+[ebp], 0
$L71777:
	mov	ecx, DWORD PTR -8+[ebp]
	mov	DWORD PTR -12+[ebp], ecx
	jmp	SHORT $L71779
$L71778:
	mov	DWORD PTR -12+[ebp], 0
$L71779:
	mov	edx, DWORD PTR -12+[ebp]
	mov	DWORD PTR _html$[ebp], edx
	cmp	DWORD PTR _html$[ebp], 0
	jne	SHORT $L71145
	xor	eax, eax
	jmp	$L71141
$L71145:

; 843  : 	DYNBUF_ADD_STR(html, "</tr></table>");

	push	0
	push	0
	push	13					; 0000000dH
	push	OFFSET FLAT:$SG71148
	mov	eax, DWORD PTR _html$[ebp]
	push	eax
	call	_dynbuf_add
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L71147
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29872], OFFSET FLAT:$SG71150
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 843		; 0000034bH
	jmp	$eva_err$71151
$L71147:

; 844  : 
; 845  : 	if(cntxt->debug & DEBUG_HTML)

	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	ecx, DWORD PTR [eax+29860]
	and	ecx, 128				; 00000080H
	test	ecx, ecx
	je	$L71164

; 847  : 		DYNBUF_ADD3(html, "\n<!--- Endof Table ", ctrl->CONTROL, 0, NO_CONV, " / ");

	push	3
	push	OFFSET FLAT:$SG71155
	push	0
	push	0
	push	0
	mov	edx, DWORD PTR _ctrl$[ebp]
	mov	eax, DWORD PTR [edx+272]
	push	eax
	push	19					; 00000013H
	push	OFFSET FLAT:$SG71156
	mov	ecx, DWORD PTR _html$[ebp]
	push	ecx
	call	_dynbuf_add3
	add	esp, 36					; 00000024H
	test	eax, eax
	je	SHORT $L71154
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29872], OFFSET FLAT:$SG71158
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 847		; 0000034fH
	jmp	$eva_err$71151
$L71154:

; 848  : 		DYNBUF_ADD(html, ctrl->TYPE, 0, NO_CONV);

	push	0
	push	0
	push	0
	mov	ecx, DWORD PTR _ctrl$[ebp]
	mov	edx, DWORD PTR [ecx+276]
	push	edx
	mov	eax, DWORD PTR _html$[ebp]
	push	eax
	call	_dynbuf_add
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L71160
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29872], OFFSET FLAT:$SG71162
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 848		; 00000350H
	jmp	SHORT $eva_err$71151
$L71160:

; 849  : 		DYNBUF_ADD3(html, " / ", ctrl->LABEL, 0, NO_CONV, " -->\n");

	push	5
	push	OFFSET FLAT:$SG71165
	push	0
	push	0
	push	0
	mov	eax, DWORD PTR _ctrl$[ebp]
	mov	ecx, DWORD PTR [eax+284]
	push	ecx
	push	3
	push	OFFSET FLAT:$SG71166
	mov	edx, DWORD PTR _html$[ebp]
	push	edx
	call	_dynbuf_add3
	add	esp, 36					; 00000024H
	test	eax, eax
	je	SHORT $L71164
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29872], OFFSET FLAT:$SG71168
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 849		; 00000351H
	jmp	SHORT $eva_err$71151
$L71164:
$eva_noerr$71169:

; 851  : 	RETURN_OK_CLEANUP;

	push	0
	push	OFFSET FLAT:$SG71170
	push	OFFSET FLAT:$SG71171
	mov	edx, DWORD PTR _cntxt$[ebp]
	push	edx
	call	_err_clear
	add	esp, 16					; 00000010H
$eva_err$71151:
	mov	eax, DWORD PTR _cntxt$[ebp]
	cmp	DWORD PTR [eax+29872], 0
	je	SHORT $L71172
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	edx, DWORD PTR [ecx+29900]
	push	edx
	push	OFFSET FLAT:$SG71173
	push	OFFSET FLAT:$SG71174
	mov	eax, DWORD PTR _cntxt$[ebp]
	push	eax
	call	_err_add_context
	add	esp, 16					; 00000010H
$L71172:
	mov	ecx, DWORD PTR _cntxt$[ebp]
	xor	eax, eax
	cmp	DWORD PTR [ecx+29872], 0
	setne	al
$L71141:

; 852  : }

	mov	esp, ebp
	pop	ebp
	ret	0
_ctrl_put_table_footer ENDP
_TEXT	ENDS
PUBLIC	_ctrl_put_hidden_old
EXTRN	_cgi_put_hiddenold:NEAR
_DATA	SEGMENT
	ORG $+2
$SG71201 DB	'D:\Travail\ABI\EVA\V4.0\CGI\Brunix-2016\ctrl_utils.c', 00H
	ORG $+3
$SG71202 DB	'ctrl_put_hidden_old', 00H
$SG71204 DB	'D:\Travail\ABI\EVA\V4.0\CGI\Brunix-2016\ctrl_utils.c', 00H
	ORG $+3
$SG71205 DB	'ctrl_put_hidden_old', 00H
_DATA	ENDS
_TEXT	SEGMENT
_cntxt$ = 8
_ctrl$ = 12
_i$ = 16
_name$ = 20
_txt$ = 24
_len$ = 28
_form$ = -8
_val$ = -4
_ctrl_put_hidden_old PROC NEAR

; 868  : ){

	push	ebp
	mov	ebp, esp
	sub	esp, 40					; 00000028H

; 869  : 	EVA_form *form = cntxt->form;

	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	ecx, DWORD PTR [eax+80]
	mov	DWORD PTR _form$[ebp], ecx

; 870  : 	DynTableCell *val = ctrl ? dyntab_cell(&ctrl->val, i, 0) : NULL;

	cmp	DWORD PTR _ctrl$[ebp], 0
	je	SHORT $L71781
	push	0
	mov	edx, DWORD PTR _i$[ebp]
	push	edx
	mov	eax, DWORD PTR _ctrl$[ebp]
	add	eax, 64					; 00000040H
	push	eax
	call	_dyntab_cell
	add	esp, 12					; 0000000cH
	mov	DWORD PTR -12+[ebp], eax
	jmp	SHORT $L71782
$L71781:
	mov	DWORD PTR -12+[ebp], 0
$L71782:
	mov	ecx, DWORD PTR -12+[ebp]
	mov	DWORD PTR _val$[ebp], ecx

; 871  : 	if(form->b_newobj && (!ctrl || (val ? val->b_modified : ctrl->b_modified))) RETURN_OK;

	mov	edx, DWORD PTR _form$[ebp]
	cmp	DWORD PTR [edx+72], 0
	je	SHORT $L71194
	cmp	DWORD PTR _ctrl$[ebp], 0
	je	SHORT $L71195
	cmp	DWORD PTR _val$[ebp], 0
	je	SHORT $L71783
	mov	eax, DWORD PTR _val$[ebp]
	movsx	ecx, BYTE PTR [eax+13]
	mov	DWORD PTR -16+[ebp], ecx
	jmp	SHORT $L71784
$L71783:
	mov	edx, DWORD PTR _ctrl$[ebp]
	mov	eax, DWORD PTR [edx+200]
	mov	DWORD PTR -16+[ebp], eax
$L71784:
	cmp	DWORD PTR -16+[ebp], 0
	je	SHORT $L71194
$L71195:
	jmp	$eva_noerr$71196
$L71194:

; 872  : 	if(cgi_put_hiddenold(cntxt, name ? name : ctrl ? ctrl->cginame : NULL,
; 873  : 								txt ? txt : val ? val->txt : NULL,
; 874  : 								txt ? len : val ? val->len : 0)) STACK_ERROR;

	cmp	DWORD PTR _txt$[ebp], 0
	je	SHORT $L71787
	mov	ecx, DWORD PTR _len$[ebp]
	mov	DWORD PTR -20+[ebp], ecx
	jmp	SHORT $L71788
$L71787:
	cmp	DWORD PTR _val$[ebp], 0
	je	SHORT $L71785
	mov	edx, DWORD PTR _val$[ebp]
	mov	eax, DWORD PTR [edx+4]
	mov	DWORD PTR -24+[ebp], eax
	jmp	SHORT $L71786
$L71785:
	mov	DWORD PTR -24+[ebp], 0
$L71786:
	mov	ecx, DWORD PTR -24+[ebp]
	mov	DWORD PTR -20+[ebp], ecx
$L71788:
	cmp	DWORD PTR _txt$[ebp], 0
	je	SHORT $L71791
	mov	edx, DWORD PTR _txt$[ebp]
	mov	DWORD PTR -28+[ebp], edx
	jmp	SHORT $L71792
$L71791:
	cmp	DWORD PTR _val$[ebp], 0
	je	SHORT $L71789
	mov	eax, DWORD PTR _val$[ebp]
	mov	ecx, DWORD PTR [eax]
	mov	DWORD PTR -32+[ebp], ecx
	jmp	SHORT $L71790
$L71789:
	mov	DWORD PTR -32+[ebp], 0
$L71790:
	mov	edx, DWORD PTR -32+[ebp]
	mov	DWORD PTR -28+[ebp], edx
$L71792:
	cmp	DWORD PTR _name$[ebp], 0
	je	SHORT $L71795
	mov	eax, DWORD PTR _name$[ebp]
	mov	DWORD PTR -36+[ebp], eax
	jmp	SHORT $L71796
$L71795:
	cmp	DWORD PTR _ctrl$[ebp], 0
	je	SHORT $L71793
	mov	ecx, DWORD PTR _ctrl$[ebp]
	mov	edx, DWORD PTR [ecx+40]
	mov	DWORD PTR -40+[ebp], edx
	jmp	SHORT $L71794
$L71793:
	mov	DWORD PTR -40+[ebp], 0
$L71794:
	mov	eax, DWORD PTR -40+[ebp]
	mov	DWORD PTR -36+[ebp], eax
$L71796:
	mov	ecx, DWORD PTR -20+[ebp]
	push	ecx
	mov	edx, DWORD PTR -28+[ebp]
	push	edx
	mov	eax, DWORD PTR -36+[ebp]
	push	eax
	mov	ecx, DWORD PTR _cntxt$[ebp]
	push	ecx
	call	_cgi_put_hiddenold
	add	esp, 16					; 00000010H
	test	eax, eax
	je	SHORT $eva_noerr$71196
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 874		; 0000036aH
	jmp	SHORT $eva_err$71200
$eva_noerr$71196:

; 875  : 	RETURN_OK_CLEANUP;

	push	0
	push	OFFSET FLAT:$SG71201
	push	OFFSET FLAT:$SG71202
	mov	eax, DWORD PTR _cntxt$[ebp]
	push	eax
	call	_err_clear
	add	esp, 16					; 00000010H
$eva_err$71200:
	mov	ecx, DWORD PTR _cntxt$[ebp]
	cmp	DWORD PTR [ecx+29872], 0
	je	SHORT $L71203
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	eax, DWORD PTR [edx+29900]
	push	eax
	push	OFFSET FLAT:$SG71204
	push	OFFSET FLAT:$SG71205
	mov	ecx, DWORD PTR _cntxt$[ebp]
	push	ecx
	call	_err_add_context
	add	esp, 16					; 00000010H
$L71203:
	mov	edx, DWORD PTR _cntxt$[ebp]
	xor	eax, eax
	cmp	DWORD PTR [edx+29872], 0
	setne	al

; 876  : }

	mov	esp, ebp
	pop	ebp
	ret	0
_ctrl_put_hidden_old ENDP
_TEXT	ENDS
EXTRN	_ctrl_check_access:NEAR
EXTRN	_dyntab_field_cell:NEAR
_DATA	SEGMENT
$SG71224 DB	'_EVA_NO_ACCESS_INHERIT', 00H
	ORG $+1
$SG71226 DB	'D:\Travail\ABI\EVA\V4.0\CGI\Brunix-2016\ctrl_utils.c', 00H
	ORG $+3
$SG71227 DB	'ctrl_primary_handler', 00H
	ORG $+3
$SG71229 DB	'D:\Travail\ABI\EVA\V4.0\CGI\Brunix-2016\ctrl_utils.c', 00H
	ORG $+3
$SG71230 DB	'ctrl_primary_handler', 00H
_DATA	ENDS
_TEXT	SEGMENT
_cntxt$ = 8
_i_ctrl$ = 12
_form$ = -4
_ctrl$ = -12
_step$ = -8
_ctrl_primary_handler PROC NEAR

; 889  : ){

	push	ebp
	mov	ebp, esp
	sub	esp, 16					; 00000010H

; 890  : 	EVA_form *form = cntxt->form;

	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	ecx, DWORD PTR [eax+80]
	mov	DWORD PTR _form$[ebp], ecx

; 891  : 	EVA_ctrl *ctrl = form->ctrl + i_ctrl;

	mov	edx, DWORD PTR _i_ctrl$[ebp]
	imul	edx, 480				; 000001e0H
	mov	eax, DWORD PTR _form$[ebp]
	mov	ecx, DWORD PTR [eax]
	add	ecx, edx
	mov	DWORD PTR _ctrl$[ebp], ecx

; 892  : 	int step = form->step;

	mov	edx, DWORD PTR _form$[ebp]
	mov	eax, DWORD PTR [edx+176]
	mov	DWORD PTR _step$[ebp], eax

; 893  : 	form->i_ctrl = i_ctrl;

	mov	ecx, DWORD PTR _form$[ebp]
	mov	edx, DWORD PTR _i_ctrl$[ebp]
	mov	DWORD PTR [ecx+8], edx

; 894  : 
; 895  : 	/* Return if no primary handler for the control */
; 896  : 	if(!ctrl_handlers[ctrl->i_handler].h0) RETURN_OK;

	mov	eax, DWORD PTR _ctrl$[ebp]
	mov	ecx, DWORD PTR [eax+32]
	shl	ecx, 4
	cmp	DWORD PTR _ctrl_handlers[ecx+8], 0
	jne	SHORT $L71217
	jmp	$eva_noerr$71218
$L71217:

; 897  : 
; 898  : 	/* Check control access - return if none */
; 899  : 	if(ctrl_check_access(cntxt, ctrl)) STACK_ERROR;

	mov	edx, DWORD PTR _ctrl$[ebp]
	push	edx
	mov	eax, DWORD PTR _cntxt$[ebp]
	push	eax
	call	_ctrl_check_access
	add	esp, 8
	test	eax, eax
	je	SHORT $L71219
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 899		; 00000383H
	jmp	$eva_err$71220
$L71219:

; 900  : 	if(!(ctrl->access & (AccessView | AccessEdit))) RETURN_OK;

	mov	edx, DWORD PTR _ctrl$[ebp]
	mov	eax, DWORD PTR [edx+184]
	and	eax, 3
	test	eax, eax
	jne	SHORT $L71221
	jmp	$eva_noerr$71218
$L71221:

; 901  : 
; 902  : 	/* Limit access if applicable */
; 903  : 	if(!CTRL_ATTR_CELL(NO_ACCESS_INHERIT) && !(ctrl->access & AccessEdit) && step == HtmlEdit) form->step = HtmlView;

	cmp	DWORD PTR _ctrl$[ebp], 0
	je	SHORT $L71798
	push	0
	push	-1
	push	OFFSET FLAT:$SG71224
	mov	ecx, DWORD PTR _ctrl$[ebp]
	add	ecx, 44					; 0000002cH
	push	ecx
	call	_dyntab_field_cell
	add	esp, 16					; 00000010H
	mov	DWORD PTR -16+[ebp], eax
	jmp	SHORT $L71799
$L71798:
	mov	DWORD PTR -16+[ebp], 0
$L71799:
	cmp	DWORD PTR -16+[ebp], 0
	jne	SHORT $L71223
	mov	edx, DWORD PTR _ctrl$[ebp]
	mov	eax, DWORD PTR [edx+184]
	and	eax, 2
	test	eax, eax
	jne	SHORT $L71223
	cmp	DWORD PTR _step$[ebp], 4
	jne	SHORT $L71223
	mov	ecx, DWORD PTR _form$[ebp]
	mov	DWORD PTR [ecx+176], 6
$L71223:

; 904  : 
; 905  : 	/* Call control primary handler & restore step */
; 906  : 	if(ctrl_handlers[ctrl->i_handler].h0(cntxt, i_ctrl)) STACK_ERROR;

	mov	edx, DWORD PTR _i_ctrl$[ebp]
	push	edx
	mov	eax, DWORD PTR _cntxt$[ebp]
	push	eax
	mov	ecx, DWORD PTR _ctrl$[ebp]
	mov	edx, DWORD PTR [ecx+32]
	shl	edx, 4
	call	DWORD PTR _ctrl_handlers[edx+8]
	add	esp, 8
	test	eax, eax
	je	SHORT $L71225
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 906		; 0000038aH
	jmp	SHORT $eva_err$71220
$L71225:

; 907  : 	form->step = step;

	mov	ecx, DWORD PTR _form$[ebp]
	mov	edx, DWORD PTR _step$[ebp]
	mov	DWORD PTR [ecx+176], edx
$eva_noerr$71218:

; 908  : 
; 909  : 	RETURN_OK_CLEANUP;

	push	0
	push	OFFSET FLAT:$SG71226
	push	OFFSET FLAT:$SG71227
	mov	eax, DWORD PTR _cntxt$[ebp]
	push	eax
	call	_err_clear
	add	esp, 16					; 00000010H
$eva_err$71220:
	mov	ecx, DWORD PTR _cntxt$[ebp]
	cmp	DWORD PTR [ecx+29872], 0
	je	SHORT $L71228
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	eax, DWORD PTR [edx+29900]
	push	eax
	push	OFFSET FLAT:$SG71229
	push	OFFSET FLAT:$SG71230
	mov	ecx, DWORD PTR _cntxt$[ebp]
	push	ecx
	call	_err_add_context
	add	esp, 16					; 00000010H
$L71228:
	mov	edx, DWORD PTR _form$[ebp]
	mov	DWORD PTR [edx+8], 0
	mov	eax, DWORD PTR _cntxt$[ebp]
	xor	ecx, ecx
	cmp	DWORD PTR [eax+29872], 0
	setne	cl
	mov	eax, ecx

; 910  :  }

	mov	esp, ebp
	pop	ebp
	ret	0
_ctrl_primary_handler ENDP
_TEXT	ENDS
PUBLIC	_put_showhelp
_DATA	SEGMENT
	ORG $+3
$SG71244 DB	' onMouseOver=ShowHelp(this)', 00H
$SG71246 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG71252 DB	'/', 00H
	ORG $+2
$SG71253 DB	' ctrlclic=''I', 00H
	ORG $+3
$SG71255 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG71259 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG71262 DB	'#''', 00H
	ORG $+1
$SG71263 DB	'$', 00H
	ORG $+2
$SG71265 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG71266 DB	'D:\Travail\ABI\EVA\V4.0\CGI\Brunix-2016\ctrl_utils.c', 00H
	ORG $+3
$SG71267 DB	'put_showhelp', 00H
	ORG $+3
$SG71269 DB	'D:\Travail\ABI\EVA\V4.0\CGI\Brunix-2016\ctrl_utils.c', 00H
	ORG $+3
$SG71270 DB	'put_showhelp', 00H
_DATA	ENDS
_TEXT	SEGMENT
_cntxt$ = 8
_html$ = 12
_form$ = -4
_put_showhelp PROC NEAR

; 923  : ){

	push	ebp
	mov	ebp, esp
	push	ecx

; 924  : 	EVA_form *form = cntxt->form;

	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	ecx, DWORD PTR [eax+80]
	mov	DWORD PTR _form$[ebp], ecx

; 925  : 
; 926  : 	/* Return if javascript is not enabled */
; 927  : 	if(!cntxt->jsenabled) RETURN_OK;

	mov	edx, DWORD PTR _cntxt$[ebp]
	cmp	DWORD PTR [edx+29676], 0
	jne	SHORT $L71240
	jmp	$eva_noerr$71241
$L71240:

; 928  : 
; 929  : 	/* Output ShowHelp call */
; 930  : 	DYNBUF_ADD_STR(html, " onMouseOver=ShowHelp(this)");

	push	0
	push	0
	push	27					; 0000001bH
	push	OFFSET FLAT:$SG71244
	mov	eax, DWORD PTR _html$[ebp]
	push	eax
	call	_dynbuf_add
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L71243
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29872], OFFSET FLAT:$SG71246
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 930		; 000003a2H
	jmp	$eva_err$71247
$L71243:

; 931  : 
; 932  : 	/* Return if no current control */
; 933  : 	if(!form || !form->nb_ctrl || cntxt->opt_btn_mode <= OptBtn_Help) RETURN_OK;

	cmp	DWORD PTR _form$[ebp], 0
	je	SHORT $L71249
	mov	eax, DWORD PTR _form$[ebp]
	cmp	DWORD PTR [eax+4], 0
	je	SHORT $L71249
	mov	ecx, DWORD PTR _cntxt$[ebp]
	cmp	DWORD PTR [ecx+29588], 1
	jg	SHORT $L71248
$L71249:
	jmp	$eva_noerr$71241
$L71248:

; 934  : 
; 935  : 	/* Output clic info for ShowHelp call */
; 936  : 	DYNBUF_ADD3_CELL(html, " ctrlclic='I", &(form->ctrl[form->i_ctrl].id), 0, 0, NO_CONV, "/");

	push	1
	push	OFFSET FLAT:$SG71252
	push	0
	push	0
	push	0
	push	0
	mov	edx, DWORD PTR _form$[ebp]
	mov	eax, DWORD PTR [edx+8]
	imul	eax, 480				; 000001e0H
	mov	ecx, DWORD PTR _form$[ebp]
	mov	edx, DWORD PTR [ecx]
	add	edx, eax
	push	edx
	call	_dyntab_sz
	add	esp, 12					; 0000000cH
	push	eax
	push	0
	push	0
	mov	eax, DWORD PTR _form$[ebp]
	mov	ecx, DWORD PTR [eax+8]
	imul	ecx, 480				; 000001e0H
	mov	edx, DWORD PTR _form$[ebp]
	mov	eax, DWORD PTR [edx]
	add	eax, ecx
	push	eax
	call	_dyntab_val
	add	esp, 12					; 0000000cH
	push	eax
	push	12					; 0000000cH
	push	OFFSET FLAT:$SG71253
	mov	ecx, DWORD PTR _html$[ebp]
	push	ecx
	call	_dynbuf_add3
	add	esp, 36					; 00000024H
	test	eax, eax
	je	SHORT $L71251
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29872], OFFSET FLAT:$SG71255
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 936		; 000003a8H
	jmp	$eva_err$71247
$L71251:

; 937  : 	DYNBUF_ADD_CELL(html, &form->id_form, 0, 0, NO_CONV);

	push	0
	push	0
	push	0
	push	0
	mov	ecx, DWORD PTR _form$[ebp]
	add	ecx, 12					; 0000000cH
	push	ecx
	call	_dyntab_sz
	add	esp, 12					; 0000000cH
	push	eax
	push	0
	push	0
	mov	edx, DWORD PTR _form$[ebp]
	add	edx, 12					; 0000000cH
	push	edx
	call	_dyntab_val
	add	esp, 12					; 0000000cH
	push	eax
	mov	eax, DWORD PTR _html$[ebp]
	push	eax
	call	_dynbuf_add
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L71257
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29872], OFFSET FLAT:$SG71259
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 937		; 000003a9H
	jmp	SHORT $eva_err$71247
$L71257:

; 938  : 	DYNBUF_ADD3_CELL(html, "$", &form->id_obj, 0, 0, NO_CONV, "#'");

	push	2
	push	OFFSET FLAT:$SG71262
	push	0
	push	0
	push	0
	push	0
	mov	eax, DWORD PTR _form$[ebp]
	add	eax, 32					; 00000020H
	push	eax
	call	_dyntab_sz
	add	esp, 12					; 0000000cH
	push	eax
	push	0
	push	0
	mov	ecx, DWORD PTR _form$[ebp]
	add	ecx, 32					; 00000020H
	push	ecx
	call	_dyntab_val
	add	esp, 12					; 0000000cH
	push	eax
	push	1
	push	OFFSET FLAT:$SG71263
	mov	edx, DWORD PTR _html$[ebp]
	push	edx
	call	_dynbuf_add3
	add	esp, 36					; 00000024H
	test	eax, eax
	je	SHORT $L71261
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29872], OFFSET FLAT:$SG71265
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 938		; 000003aaH
	jmp	SHORT $eva_err$71247
$L71261:
$eva_noerr$71241:

; 939  : 
; 940  : 	RETURN_OK_CLEANUP;

	push	0
	push	OFFSET FLAT:$SG71266
	push	OFFSET FLAT:$SG71267
	mov	edx, DWORD PTR _cntxt$[ebp]
	push	edx
	call	_err_clear
	add	esp, 16					; 00000010H
$eva_err$71247:
	mov	eax, DWORD PTR _cntxt$[ebp]
	cmp	DWORD PTR [eax+29872], 0
	je	SHORT $L71268
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	edx, DWORD PTR [ecx+29900]
	push	edx
	push	OFFSET FLAT:$SG71269
	push	OFFSET FLAT:$SG71270
	mov	eax, DWORD PTR _cntxt$[ebp]
	push	eax
	call	_err_add_context
	add	esp, 16					; 00000010H
$L71268:
	mov	ecx, DWORD PTR _cntxt$[ebp]
	xor	eax, eax
	cmp	DWORD PTR [ecx+29872], 0
	setne	al

; 941  :  }

	mov	esp, ebp
	pop	ebp
	ret	0
_put_showhelp ENDP
_TEXT	ENDS
PUBLIC	_build_open_btn_name
_BSS	SEGMENT
	ALIGN	4

$SG71287 DB	01H DUP (?)
	ALIGN	4

$SG71289 DB	01H DUP (?)
_BSS	ENDS
_DATA	SEGMENT
	ORG $+3
$SG71292 DB	'I%s$%s', 00H
	ORG $+1
$SG71294 DB	'B%s$%s#.OPENOBJ=%lu,%lu,%d,%d', 00H
_DATA	ENDS
_TEXT	SEGMENT
_cntxt$ = 8
_opname$ = 12
_id_form$ = 16
_id_obj$ = 20
_loc$ = 24
_mode$ = 28
_form$ = -4
_srcform$ = -12
_srcobj$ = -8
_build_open_btn_name PROC NEAR

; 956  : ){

	push	ebp
	mov	ebp, esp
	sub	esp, 20					; 00000014H

; 957  : 	EVA_form *form = cntxt->form;

	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	ecx, DWORD PTR [eax+80]
	mov	DWORD PTR _form$[ebp], ecx

; 958  : 	char *srcform = (form && form->id_form.cell && form->id_form.cell->txt) ? form->id_form.cell->txt : "";

	cmp	DWORD PTR _form$[ebp], 0
	je	SHORT $L71802
	mov	edx, DWORD PTR _form$[ebp]
	cmp	DWORD PTR [edx+28], 0
	je	SHORT $L71802
	mov	eax, DWORD PTR _form$[ebp]
	mov	ecx, DWORD PTR [eax+28]
	cmp	DWORD PTR [ecx], 0
	je	SHORT $L71802
	mov	edx, DWORD PTR _form$[ebp]
	mov	eax, DWORD PTR [edx+28]
	mov	ecx, DWORD PTR [eax]
	mov	DWORD PTR -16+[ebp], ecx
	jmp	SHORT $L71803
$L71802:
	mov	DWORD PTR -16+[ebp], OFFSET FLAT:$SG71287
$L71803:
	mov	edx, DWORD PTR -16+[ebp]
	mov	DWORD PTR _srcform$[ebp], edx

; 959  : 	char *srcobj = (form && form->id_obj.cell && form->id_obj.cell->txt) ? form->id_obj.cell->txt : "";

	cmp	DWORD PTR _form$[ebp], 0
	je	SHORT $L71804
	mov	eax, DWORD PTR _form$[ebp]
	cmp	DWORD PTR [eax+48], 0
	je	SHORT $L71804
	mov	ecx, DWORD PTR _form$[ebp]
	mov	edx, DWORD PTR [ecx+48]
	cmp	DWORD PTR [edx], 0
	je	SHORT $L71804
	mov	eax, DWORD PTR _form$[ebp]
	mov	ecx, DWORD PTR [eax+48]
	mov	edx, DWORD PTR [ecx]
	mov	DWORD PTR -20+[ebp], edx
	jmp	SHORT $L71805
$L71804:
	mov	DWORD PTR -20+[ebp], OFFSET FLAT:$SG71289
$L71805:
	mov	eax, DWORD PTR -20+[ebp]
	mov	DWORD PTR _srcobj$[ebp], eax

; 960  : 
; 961  : 	if(!opname) return 0;

	cmp	DWORD PTR _opname$[ebp], 0
	jne	SHORT $L71290
	xor	eax, eax
	jmp	SHORT $L71293
$L71290:

; 962  : 	*opname = 0;

	mov	ecx, DWORD PTR _opname$[ebp]
	mov	BYTE PTR [ecx], 0

; 963  : 	if(!id_form && !id_obj)

	cmp	DWORD PTR _id_form$[ebp], 0
	jne	SHORT $L71291
	cmp	DWORD PTR _id_obj$[ebp], 0
	jne	SHORT $L71291

; 964  : 		return sprintf(opname, "I%s$%s", srcform, srcobj);

	mov	edx, DWORD PTR _srcobj$[ebp]
	push	edx
	mov	eax, DWORD PTR _srcform$[ebp]
	push	eax
	push	OFFSET FLAT:$SG71292
	mov	ecx, DWORD PTR _opname$[ebp]
	push	ecx
	call	_sprintf
	add	esp, 16					; 00000010H
	jmp	SHORT $L71293
$L71291:

; 965  : 	else
; 966  : 		return sprintf(opname, "B%s$%s#.OPENOBJ=%lu,%lu,%d,%d", srcform, srcobj, id_obj, id_form, loc, mode);

	mov	edx, DWORD PTR _mode$[ebp]
	push	edx
	mov	eax, DWORD PTR _loc$[ebp]
	push	eax
	mov	ecx, DWORD PTR _id_form$[ebp]
	push	ecx
	mov	edx, DWORD PTR _id_obj$[ebp]
	push	edx
	mov	eax, DWORD PTR _srcobj$[ebp]
	push	eax
	mov	ecx, DWORD PTR _srcform$[ebp]
	push	ecx
	push	OFFSET FLAT:$SG71294
	mov	edx, DWORD PTR _opname$[ebp]
	push	edx
	call	_sprintf
	add	esp, 32					; 00000020H
$L71293:

; 967  : }

	mov	esp, ebp
	pop	ebp
	ret	0
_build_open_btn_name ENDP
_TEXT	ENDS
PUBLIC	_html_put_open_btn
EXTRN	_dynbuf_add3_int:NEAR
_BSS	SEGMENT
	ALIGN	4

$SG71345 DB	01H DUP (?)
	ALIGN	4

$SG71353 DB	01H DUP (?)
	ALIGN	4

$SG71368 DB	01H DUP (?)
_BSS	ENDS
_DATA	SEGMENT
	ORG $+2
$SG71326 DB	'Vous n''avez pas acc', 0e8H, 's ', 0e0H, ' cette fiche', 00H
$SG71327 DB	'Cliquez pour plus d''informations sur la fiche', 00H
	ORG $+2
$SG71328 DB	'Cliquez pour ouvrir la fiche', 00H
	ORG $+3
$SG71333 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG71338 DB	' (Nouvelle fiche)', 00H
	ORG $+2
$SG71340 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG71346 DB	' n', 0b0H, ' ', 00H
	ORG $+3
$SG71348 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG71354 DB	' : ', 00H
$SG71356 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG71361 DB	0aH, 00H
	ORG $+2
$SG71362 DB	0aH, 0aH, 00H
	ORG $+1
$SG71364 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG71369 DB	0aH, 00H
	ORG $+2
$SG71371 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG71375 DB	0aH, 00H
	ORG $+2
$SG71377 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG71382 DB	'_eva_open_small_s.gif', 00H
	ORG $+2
$SG71383 DB	'_eva_open_small.gif', 00H
$SG71385 DB	'D:\Travail\ABI\EVA\V4.0\CGI\Brunix-2016\ctrl_utils.c', 00H
	ORG $+3
$SG71386 DB	'html_put_open_btn', 00H
	ORG $+2
$SG71388 DB	'D:\Travail\ABI\EVA\V4.0\CGI\Brunix-2016\ctrl_utils.c', 00H
	ORG $+3
$SG71389 DB	'html_put_open_btn', 00H
_DATA	ENDS
_TEXT	SEGMENT
_cntxt$ = 8
_opname$ = 12
_label$ = 16
_objname$ = 20
_notes$ = 24
_img$ = 28
_imgsel$ = 32
_id_form$ = 36
_id_obj$ = 40
_loc$ = 44
_b_disabled$ = 48
_mode$ = 52
_tooltip$ = -8
__opname$ = -72
_action$ = -4
_html_put_open_btn PROC NEAR

; 988  : ){

	push	ebp
	mov	ebp, esp
	sub	esp, 112				; 00000070H

; 989  :  	DynBuffer *tooltip = NULL;

	mov	DWORD PTR _tooltip$[ebp], 0

; 990  : 	char _opname[64];
; 991  : 	char *action = b_disabled ? "Vous n'avez pas accès à cette fiche" :
; 992  : 		(!id_form && !id_obj) ? "Cliquez pour plus d'informations sur la fiche" :
; 993  : 								"Cliquez pour ouvrir la fiche";

	cmp	DWORD PTR _b_disabled$[ebp], 0
	je	SHORT $L71809
	mov	DWORD PTR -76+[ebp], OFFSET FLAT:$SG71326
	jmp	SHORT $L71810
$L71809:
	cmp	DWORD PTR _id_form$[ebp], 0
	jne	SHORT $L71807
	cmp	DWORD PTR _id_obj$[ebp], 0
	jne	SHORT $L71807
	mov	DWORD PTR -80+[ebp], OFFSET FLAT:$SG71327
	jmp	SHORT $L71808
$L71807:
	mov	DWORD PTR -80+[ebp], OFFSET FLAT:$SG71328
$L71808:
	mov	eax, DWORD PTR -80+[ebp]
	mov	DWORD PTR -76+[ebp], eax
$L71810:
	mov	ecx, DWORD PTR -76+[ebp]
	mov	DWORD PTR _action$[ebp], ecx

; 994  : 	/* Build button name if applicable */
; 995  : 	if(!opname) opname = _opname;

	cmp	DWORD PTR _opname$[ebp], 0
	jne	SHORT $L71329
	lea	edx, DWORD PTR __opname$[ebp]
	mov	DWORD PTR _opname$[ebp], edx
$L71329:

; 996  : 	build_open_btn_name(cntxt, opname, id_form, id_obj, loc, mode);

	mov	eax, DWORD PTR _mode$[ebp]
	push	eax
	mov	ecx, DWORD PTR _loc$[ebp]
	push	ecx
	mov	edx, DWORD PTR _id_obj$[ebp]
	push	edx
	mov	eax, DWORD PTR _id_form$[ebp]
	push	eax
	mov	ecx, DWORD PTR _opname$[ebp]
	push	ecx
	mov	edx, DWORD PTR _cntxt$[ebp]
	push	edx
	call	_build_open_btn_name
	add	esp, 24					; 00000018H

; 997  : 
; 998  : 	/* Build button tooltip */
; 999  : 	DYNBUF_ADD_BUF(&tooltip, label, NO_CONV);

	cmp	DWORD PTR _label$[ebp], 0
	je	SHORT $L71331
	push	0
	push	0
	mov	eax, DWORD PTR _label$[ebp]
	mov	ecx, DWORD PTR [eax+4]
	push	ecx
	mov	edx, DWORD PTR _label$[ebp]
	add	edx, 8
	push	edx
	lea	eax, DWORD PTR _tooltip$[ebp]
	push	eax
	call	_dynbuf_add
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L71331
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29872], OFFSET FLAT:$SG71333
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 999		; 000003e7H
	jmp	$eva_err$71334
$L71331:

; 1000 : 	if(id_form && !id_obj)

	cmp	DWORD PTR _id_form$[ebp], 0
	je	SHORT $L71335
	cmp	DWORD PTR _id_obj$[ebp], 0
	jne	SHORT $L71335

; 1001 : 		DYNBUF_ADD_STR(&tooltip, " (Nouvelle fiche)")

	push	0
	push	0
	push	17					; 00000011H
	push	OFFSET FLAT:$SG71338
	lea	eax, DWORD PTR _tooltip$[ebp]
	push	eax
	call	_dynbuf_add
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L71337
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29872], OFFSET FLAT:$SG71340
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 1001		; 000003e9H
	jmp	$eva_err$71334
$L71337:

; 1002 : 	else if(cntxt->b_admin)

	jmp	$L71344
$L71335:
	mov	eax, DWORD PTR _cntxt$[ebp]
	cmp	DWORD PTR [eax+29612], 0
	je	SHORT $L71344

; 1003 : 		DYNBUF_ADD3_INT(&tooltip, " n° ", (!id_form && !id_obj) ? DYNTAB_TOUL(&cntxt->form->id_obj) : id_obj, "");

	cmp	DWORD PTR _id_form$[ebp], 0
	jne	SHORT $L71811
	cmp	DWORD PTR _id_obj$[ebp], 0
	jne	SHORT $L71811
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
	mov	DWORD PTR -84+[ebp], eax
	jmp	SHORT $L71812
$L71811:
	mov	eax, DWORD PTR _id_obj$[ebp]
	mov	DWORD PTR -84+[ebp], eax
$L71812:
	push	0
	push	OFFSET FLAT:$SG71345
	mov	ecx, DWORD PTR -84+[ebp]
	push	ecx
	push	4
	push	OFFSET FLAT:$SG71346
	lea	edx, DWORD PTR _tooltip$[ebp]
	push	edx
	call	_dynbuf_add3_int
	add	esp, 24					; 00000018H
	test	eax, eax
	je	SHORT $L71344
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29872], OFFSET FLAT:$SG71348
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 1003		; 000003ebH
	jmp	$eva_err$71334
$L71344:

; 1004 : 	if(objname) DYNBUF_ADD3_BUF(&tooltip, " : ", objname, NO_CONV, "");

	cmp	DWORD PTR _objname$[ebp], 0
	je	SHORT $L71352
	cmp	DWORD PTR _objname$[ebp], 0
	je	SHORT $L71813
	mov	edx, DWORD PTR _objname$[ebp]
	mov	eax, DWORD PTR [edx+4]
	mov	DWORD PTR -88+[ebp], eax
	jmp	SHORT $L71814
$L71813:
	mov	DWORD PTR -88+[ebp], 0
$L71814:
	cmp	DWORD PTR _objname$[ebp], 0
	je	SHORT $L71815
	mov	ecx, DWORD PTR _objname$[ebp]
	add	ecx, 8
	mov	DWORD PTR -92+[ebp], ecx
	jmp	SHORT $L71816
$L71815:
	mov	DWORD PTR -92+[ebp], 0
$L71816:
	push	0
	push	OFFSET FLAT:$SG71353
	push	0
	push	0
	mov	edx, DWORD PTR -88+[ebp]
	push	edx
	mov	eax, DWORD PTR -92+[ebp]
	push	eax
	push	3
	push	OFFSET FLAT:$SG71354
	lea	ecx, DWORD PTR _tooltip$[ebp]
	push	ecx
	call	_dynbuf_add3
	add	esp, 36					; 00000024H
	test	eax, eax
	je	SHORT $L71352
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29872], OFFSET FLAT:$SG71356
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 1004		; 000003ecH
	jmp	$eva_err$71334
$L71352:

; 1005 : 	if(notes && !b_disabled) DYNBUF_ADD3_BUF(&tooltip, "\n\n", notes, NO_CONV, "\n");

	cmp	DWORD PTR _notes$[ebp], 0
	je	SHORT $L71360
	cmp	DWORD PTR _b_disabled$[ebp], 0
	jne	SHORT $L71360
	cmp	DWORD PTR _notes$[ebp], 0
	je	SHORT $L71817
	mov	ecx, DWORD PTR _notes$[ebp]
	mov	edx, DWORD PTR [ecx+4]
	mov	DWORD PTR -96+[ebp], edx
	jmp	SHORT $L71818
$L71817:
	mov	DWORD PTR -96+[ebp], 0
$L71818:
	cmp	DWORD PTR _notes$[ebp], 0
	je	SHORT $L71819
	mov	eax, DWORD PTR _notes$[ebp]
	add	eax, 8
	mov	DWORD PTR -100+[ebp], eax
	jmp	SHORT $L71820
$L71819:
	mov	DWORD PTR -100+[ebp], 0
$L71820:
	push	1
	push	OFFSET FLAT:$SG71361
	push	0
	push	0
	mov	ecx, DWORD PTR -96+[ebp]
	push	ecx
	mov	edx, DWORD PTR -100+[ebp]
	push	edx
	push	2
	push	OFFSET FLAT:$SG71362
	lea	eax, DWORD PTR _tooltip$[ebp]
	push	eax
	call	_dynbuf_add3
	add	esp, 36					; 00000024H
	test	eax, eax
	je	SHORT $L71360
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29872], OFFSET FLAT:$SG71364
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 1005		; 000003edH
	jmp	$eva_err$71334
$L71360:

; 1006 : 	if(action && !b_disabled) DYNBUF_ADD3(&tooltip, "\n", action, 0, NO_CONV, "");

	cmp	DWORD PTR _action$[ebp], 0
	je	SHORT $L71367
	cmp	DWORD PTR _b_disabled$[ebp], 0
	jne	SHORT $L71367
	push	0
	push	OFFSET FLAT:$SG71368
	push	0
	push	0
	push	0
	mov	eax, DWORD PTR _action$[ebp]
	push	eax
	push	1
	push	OFFSET FLAT:$SG71369
	lea	ecx, DWORD PTR _tooltip$[ebp]
	push	ecx
	call	_dynbuf_add3
	add	esp, 36					; 00000024H
	test	eax, eax
	je	SHORT $L71367
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29872], OFFSET FLAT:$SG71371
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 1006		; 000003eeH
	jmp	$eva_err$71334
$L71367:

; 1007 : 	if(b_disabled) DYNBUF_ADD_STR(&tooltip, "\n")

	cmp	DWORD PTR _b_disabled$[ebp], 0
	je	SHORT $L71374
	push	0
	push	0
	push	1
	push	OFFSET FLAT:$SG71375
	lea	ecx, DWORD PTR _tooltip$[ebp]
	push	ecx
	call	_dynbuf_add
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L71374
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29872], OFFSET FLAT:$SG71377
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 1007		; 000003efH
	jmp	$eva_err$71334
$L71374:

; 1008 : 
; 1009 : 	/* Output button */
; 1010 : 	if(put_html_button(cntxt, opname, NULL,
; 1011 : 				img ? img->data : "_eva_open_small.gif",
; 1012 : 				(img && imgsel) ? imgsel->data : "_eva_open_small_s.gif",
; 1013 : 				tooltip ? tooltip->data : NULL, 0, b_disabled | 4))

	cmp	DWORD PTR _tooltip$[ebp], 0
	je	SHORT $L71821
	mov	ecx, DWORD PTR _tooltip$[ebp]
	add	ecx, 8
	mov	DWORD PTR -104+[ebp], ecx
	jmp	SHORT $L71822
$L71821:
	mov	DWORD PTR -104+[ebp], 0
$L71822:
	cmp	DWORD PTR _img$[ebp], 0
	je	SHORT $L71823
	cmp	DWORD PTR _imgsel$[ebp], 0
	je	SHORT $L71823
	mov	edx, DWORD PTR _imgsel$[ebp]
	add	edx, 8
	mov	DWORD PTR -108+[ebp], edx
	jmp	SHORT $L71824
$L71823:
	mov	DWORD PTR -108+[ebp], OFFSET FLAT:$SG71382
$L71824:
	cmp	DWORD PTR _img$[ebp], 0
	je	SHORT $L71825
	mov	eax, DWORD PTR _img$[ebp]
	add	eax, 8
	mov	DWORD PTR -112+[ebp], eax
	jmp	SHORT $L71826
$L71825:
	mov	DWORD PTR -112+[ebp], OFFSET FLAT:$SG71383
$L71826:
	mov	ecx, DWORD PTR _b_disabled$[ebp]
	or	ecx, 4
	push	ecx
	push	0
	push	0
	push	0
	push	0
	mov	edx, DWORD PTR -104+[ebp]
	push	edx
	mov	eax, DWORD PTR -108+[ebp]
	push	eax
	mov	ecx, DWORD PTR -112+[ebp]
	push	ecx
	push	0
	mov	edx, DWORD PTR _opname$[ebp]
	push	edx
	mov	eax, DWORD PTR _cntxt$[ebp]
	push	eax
	call	_put_html_button_sz
	add	esp, 44					; 0000002cH
	test	eax, eax
	je	SHORT $eva_noerr$71384

; 1014 : 			STACK_ERROR;

	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 1014		; 000003f6H
	jmp	SHORT $eva_err$71334
$eva_noerr$71384:

; 1015 : 
; 1016 : 	RETURN_OK_CLEANUP;

	push	0
	push	OFFSET FLAT:$SG71385
	push	OFFSET FLAT:$SG71386
	mov	edx, DWORD PTR _cntxt$[ebp]
	push	edx
	call	_err_clear
	add	esp, 16					; 00000010H
$eva_err$71334:
	mov	eax, DWORD PTR _cntxt$[ebp]
	cmp	DWORD PTR [eax+29872], 0
	je	SHORT $L71387
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	edx, DWORD PTR [ecx+29900]
	push	edx
	push	OFFSET FLAT:$SG71388
	push	OFFSET FLAT:$SG71389
	mov	eax, DWORD PTR _cntxt$[ebp]
	push	eax
	call	_err_add_context
	add	esp, 16					; 00000010H
$L71387:
	mov	ecx, DWORD PTR _tooltip$[ebp]
	push	ecx
	call	_mem_free
	add	esp, 4
	mov	DWORD PTR _tooltip$[ebp], 0
	mov	edx, DWORD PTR _cntxt$[ebp]
	xor	eax, eax
	cmp	DWORD PTR [edx+29872], 0
	setne	al

; 1017 : }

	mov	esp, ebp
	pop	ebp
	ret	0
_html_put_open_btn ENDP
_TEXT	ENDS
PUBLIC	_ctrl_add_symbol_btn
EXTRN	_qsort_col0idesc:NEAR
EXTRN	_qry_obj_label:NEAR
EXTRN	_put_html_bold_substring:NEAR
EXTRN	_memcpy:NEAR
EXTRN	_strstr:NEAR
EXTRN	_dyntab_sort:NEAR
_BSS	SEGMENT
	ALIGN	4

$SG71437 DB	01H DUP (?)
	ALIGN	4

$SG71438 DB	01H DUP (?)
	ALIGN	4

$SG71551 DB	01H DUP (?)
	ALIGN	4

$SG71584 DB	01H DUP (?)
_BSS	ENDS
_DATA	SEGMENT
	ORG $+2
$SG71436 DB	'_EVA_ALTFORM', 00H
	ORG $+3
$SG71440 DB	'_EVA_TOP', 00H
	ORG $+3
$SG71441 DB	'_EVA_BOTTOM', 00H
$SG71442 DB	'_EVA_REUSE', 00H
	ORG $+1
$SG71446 DB	'NAME', 00H
	ORG $+3
$SG71449 DB	'LABEL', 00H
	ORG $+2
$SG71450 DB	'_EVA_NONE', 00H
	ORG $+2
$SG71453 DB	'_EVA_NONE', 00H
	ORG $+2
$SG71454 DB	'SYMBOL', 00H
	ORG $+1
$SG71457 DB	'OBJNOTES', 00H
	ORG $+3
$SG71458 DB	'_EVA_', 00H
	ORG $+2
$SG71469 DB	'_EVA_LIST_OPENFIXED', 00H
$SG71472 DB	'_EVA_LIST_OPENFORM', 00H
	ORG $+1
$SG71478 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG71482 DB	'_EVA_FORMSTAMP', 00H
	ORG $+1
$SG71484 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG71487 DB	' bgcolor=#%s', 00H
	ORG $+3
$SG71492 DB	'>', 00H
	ORG $+2
$SG71493 DB	'<td align=right valign=top', 00H
	ORG $+1
$SG71495 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG71507 DB	'D:\Travail\ABI\EVA\V4.0\CGI\Brunix-2016\ctrl_utils.c', 00H
	ORG $+3
$SG71508 DB	'ctrl_add_symbol_btn', 00H
$SG71514 DB	'%lu', 00H
$SG71518 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG71520 DB	'%lu', 00H
$SG71524 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG71533 DB	0aH, 0aH, 00H
	ORG $+1
$SG71535 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG71539 DB	'] : ', 00H
	ORG $+3
$SG71540 DB	'[', 00H
	ORG $+2
$SG71542 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG71546 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG71552 DB	0aH, 00H
	ORG $+2
$SG71554 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG71560 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG71564 DB	' - ', 00H
$SG71566 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG71571 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG71576 DB	' (Nouvelle fiche)', 00H
	ORG $+2
$SG71578 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG71583 DB	'_EVA_OPEN_MODE', 00H
	ORG $+1
$SG71588 DB	'</td>', 0aH, 00H
	ORG $+1
$SG71590 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG71597 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG71602 DB	'>', 00H
	ORG $+2
$SG71603 DB	'<td valign=top ', 00H
$SG71605 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG71616 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG71621 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG71631 DB	'</td>', 00H
	ORG $+2
$SG71633 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG71634 DB	'D:\Travail\ABI\EVA\V4.0\CGI\Brunix-2016\ctrl_utils.c', 00H
	ORG $+3
$SG71635 DB	'ctrl_add_symbol_btn', 00H
$SG71637 DB	'D:\Travail\ABI\EVA\V4.0\CGI\Brunix-2016\ctrl_utils.c', 00H
	ORG $+3
$SG71638 DB	'ctrl_add_symbol_btn', 00H
_DATA	ENDS
_TEXT	SEGMENT
_cntxt$ = 8
_ctrl$ = 12
_val$ = 16
_data$ = 20
_beg$ = 24
_bg_color$ = 28
_dispmode$ = 32
_form$ = -36
_formstamp$ = -436
_formdata$ = -28
_formname$ = -124
_objname$ = -136
_objtitle$ = -440
_notes$ = -404
_fnotes$ = -460
_img$ = -112
_imgsel$ = -32
_htmlabel$ = -448
_txtlabel$ = -456
_txtnotes$ = -464
_opname$ = -100
_i$ = -400
_use_form$ = -132
_objdata$ = -408
_alt$ = -416
_loc$ = -396
_cntform$ = -452
_b_formname$ = -120
_b_objname$ = -128
_b_button$ = -8
_b_label$ = -412
_b_tooltip$ = -444
_formaccess$ = -4
_bgcolor$ = -392
_tbl$ = -108
_tblattr$ = -116
_html$ = -104
_c$71471 = -468
_id_form$71499 = -476
_i_fc$71501 = -480
_access$71502 = -472
_newctrl$71511 = -960
_newform$71512 = -1204
__tmp$71513 = -1236
__tmp$71519 = -1268
__c$71593 = -1272
_ctrl_add_symbol_btn PROC NEAR

; 1046 : ){

	push	ebp
	mov	ebp, esp
	sub	esp, 1384				; 00000568H
	push	edi

; 1047 : 	EVA_form *form = cntxt->form;

	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	ecx, DWORD PTR [eax+80]
	mov	DWORD PTR _form$[ebp], ecx

; 1048 : 	DynTable formstamp = {0};

	mov	DWORD PTR _formstamp$[ebp], 0
	xor	edx, edx
	mov	DWORD PTR _formstamp$[ebp+4], edx
	mov	DWORD PTR _formstamp$[ebp+8], edx
	mov	DWORD PTR _formstamp$[ebp+12], edx
	mov	DWORD PTR _formstamp$[ebp+16], edx

; 1049 : 	DynTable formdata = {0};

	mov	DWORD PTR _formdata$[ebp], 0
	xor	eax, eax
	mov	DWORD PTR _formdata$[ebp+4], eax
	mov	DWORD PTR _formdata$[ebp+8], eax
	mov	DWORD PTR _formdata$[ebp+12], eax
	mov	DWORD PTR _formdata$[ebp+16], eax

; 1050 : 	DynBuffer *formname = NULL;

	mov	DWORD PTR _formname$[ebp], 0

; 1051 : 	DynBuffer *objname = NULL;

	mov	DWORD PTR _objname$[ebp], 0

; 1052 : 	DynBuffer *objtitle = NULL;

	mov	DWORD PTR _objtitle$[ebp], 0

; 1053 : 	DynBuffer *notes = NULL;

	mov	DWORD PTR _notes$[ebp], 0

; 1054 : 	DynBuffer *fnotes = NULL;

	mov	DWORD PTR _fnotes$[ebp], 0

; 1055 : 	DynBuffer *img = NULL;

	mov	DWORD PTR _img$[ebp], 0

; 1056 : 	DynBuffer *imgsel = NULL;

	mov	DWORD PTR _imgsel$[ebp], 0

; 1057 : 	DynBuffer *htmlabel = NULL;

	mov	DWORD PTR _htmlabel$[ebp], 0

; 1058 : 	DynBuffer *txtlabel = NULL;

	mov	DWORD PTR _txtlabel$[ebp], 0

; 1059 : 	DynBuffer *txtnotes = NULL;

	mov	DWORD PTR _txtnotes$[ebp], 0

; 1060 : 	char opname[64] = {0};

	mov	BYTE PTR _opname$[ebp], 0
	mov	ecx, 15					; 0000000fH
	xor	eax, eax
	lea	edi, DWORD PTR _opname$[ebp+1]
	rep stosd
	stosw
	stosb

; 1061 : 	unsigned long i, use_form = 0;

	mov	DWORD PTR _use_form$[ebp], 0

; 1062 : 	DynTableCell *objdata = dyntab_cell(data, beg, 0);

	push	0
	mov	ecx, DWORD PTR _beg$[ebp]
	push	ecx
	mov	edx, DWORD PTR _data$[ebp]
	push	edx
	call	_dyntab_cell
	add	esp, 12					; 0000000cH
	mov	DWORD PTR _objdata$[ebp], eax

; 1063 : 	char *alt = ctrl ? CTRL_ATTR_VAL(ALTFORM) : "";

	cmp	DWORD PTR _ctrl$[ebp], 0
	je	SHORT $L71830
	cmp	DWORD PTR _ctrl$[ebp], 0
	je	SHORT $L71828
	push	0
	push	-1
	push	OFFSET FLAT:$SG71436
	mov	eax, DWORD PTR _ctrl$[ebp]
	add	eax, 44					; 0000002cH
	push	eax
	call	_dyntab_field_val
	add	esp, 16					; 00000010H
	mov	DWORD PTR -1276+[ebp], eax
	jmp	SHORT $L71829
$L71828:
	mov	DWORD PTR -1276+[ebp], OFFSET FLAT:$SG71437
$L71829:
	mov	ecx, DWORD PTR -1276+[ebp]
	mov	DWORD PTR -1280+[ebp], ecx
	jmp	SHORT $L71831
$L71830:
	mov	DWORD PTR -1280+[ebp], OFFSET FLAT:$SG71438
$L71831:
	mov	edx, DWORD PTR -1280+[ebp]
	mov	DWORD PTR _alt$[ebp], edx

; 1064 : 	int loc = !strcmp(alt, "_EVA_TOP") ? 1 : !strcmp(alt, "_EVA_BOTTOM") ? 2 : !strcmp(alt, "_EVA_REUSE") ? 3 : 0;

	push	OFFSET FLAT:$SG71440
	mov	eax, DWORD PTR _alt$[ebp]
	push	eax
	call	_strcmp
	add	esp, 8
	test	eax, eax
	jne	SHORT $L71834
	mov	DWORD PTR -1284+[ebp], 1
	jmp	SHORT $L71835
$L71834:
	push	OFFSET FLAT:$SG71441
	mov	ecx, DWORD PTR _alt$[ebp]
	push	ecx
	call	_strcmp
	add	esp, 8
	test	eax, eax
	jne	SHORT $L71832
	mov	DWORD PTR -1288+[ebp], 2
	jmp	SHORT $L71833
$L71832:
	push	OFFSET FLAT:$SG71442
	mov	edx, DWORD PTR _alt$[ebp]
	push	edx
	call	_strcmp
	add	esp, 8
	neg	eax
	sbb	eax, eax
	and	al, -3					; fffffffdH
	add	eax, 3
	mov	DWORD PTR -1288+[ebp], eax
$L71833:
	mov	eax, DWORD PTR -1288+[ebp]
	mov	DWORD PTR -1284+[ebp], eax
$L71835:
	mov	ecx, DWORD PTR -1284+[ebp]
	mov	DWORD PTR _loc$[ebp], ecx

; 1065 : 	int cntform = 0;

	mov	DWORD PTR _cntform$[ebp], 0

; 1066 : 	int b_formname = dispmode && strstr(dispmode, "NAME") != NULL;

	cmp	DWORD PTR _dispmode$[ebp], 0
	je	SHORT $L71836
	push	OFFSET FLAT:$SG71446
	mov	edx, DWORD PTR _dispmode$[ebp]
	push	edx
	call	_strstr
	add	esp, 8
	test	eax, eax
	je	SHORT $L71836
	mov	DWORD PTR -1292+[ebp], 1
	jmp	SHORT $L71837
$L71836:
	mov	DWORD PTR -1292+[ebp], 0
$L71837:
	mov	eax, DWORD PTR -1292+[ebp]
	mov	DWORD PTR _b_formname$[ebp], eax

; 1067 : 	int b_objname =  dispmode && (strstr(dispmode, "LABEL") != NULL || !strcmp("_EVA_NONE", dispmode));

	cmp	DWORD PTR _dispmode$[ebp], 0
	je	SHORT $L71839
	push	OFFSET FLAT:$SG71449
	mov	ecx, DWORD PTR _dispmode$[ebp]
	push	ecx
	call	_strstr
	add	esp, 8
	test	eax, eax
	jne	SHORT $L71838
	mov	edx, DWORD PTR _dispmode$[ebp]
	push	edx
	push	OFFSET FLAT:$SG71450
	call	_strcmp
	add	esp, 8
	test	eax, eax
	jne	SHORT $L71839
$L71838:
	mov	DWORD PTR -1296+[ebp], 1
	jmp	SHORT $L71840
$L71839:
	mov	DWORD PTR -1296+[ebp], 0
$L71840:
	mov	eax, DWORD PTR -1296+[ebp]
	mov	DWORD PTR _b_objname$[ebp], eax

; 1068 : 	int b_button = (!dispmode || !*dispmode || (strcmp("_EVA_NONE", dispmode) && strstr(dispmode, "SYMBOL") != NULL));

	cmp	DWORD PTR _dispmode$[ebp], 0
	je	SHORT $L71841
	mov	ecx, DWORD PTR _dispmode$[ebp]
	movsx	edx, BYTE PTR [ecx]
	test	edx, edx
	je	SHORT $L71841
	mov	eax, DWORD PTR _dispmode$[ebp]
	push	eax
	push	OFFSET FLAT:$SG71453
	call	_strcmp
	add	esp, 8
	test	eax, eax
	je	SHORT $L71842
	push	OFFSET FLAT:$SG71454
	mov	ecx, DWORD PTR _dispmode$[ebp]
	push	ecx
	call	_strstr
	add	esp, 8
	test	eax, eax
	jne	SHORT $L71841
$L71842:
	mov	DWORD PTR -1300+[ebp], 0
	jmp	SHORT $L71843
$L71841:
	mov	DWORD PTR -1300+[ebp], 1
$L71843:
	mov	edx, DWORD PTR -1300+[ebp]
	mov	DWORD PTR _b_button$[ebp], edx

; 1069 : 	int b_label = b_formname || b_objname;

	cmp	DWORD PTR _b_formname$[ebp], 0
	jne	SHORT $L71844
	cmp	DWORD PTR _b_objname$[ebp], 0
	jne	SHORT $L71844
	mov	DWORD PTR -1304+[ebp], 0
	jmp	SHORT $L71845
$L71844:
	mov	DWORD PTR -1304+[ebp], 1
$L71845:
	mov	eax, DWORD PTR -1304+[ebp]
	mov	DWORD PTR _b_label$[ebp], eax

; 1070 : 	int b_tooltip = !dispmode || !*dispmode || strstr(dispmode, "OBJNOTES") || !strncmp(dispmode, add_sz_str("_EVA_"));

	cmp	DWORD PTR _dispmode$[ebp], 0
	je	SHORT $L71846
	mov	ecx, DWORD PTR _dispmode$[ebp]
	movsx	edx, BYTE PTR [ecx]
	test	edx, edx
	je	SHORT $L71846
	push	OFFSET FLAT:$SG71457
	mov	eax, DWORD PTR _dispmode$[ebp]
	push	eax
	call	_strstr
	add	esp, 8
	test	eax, eax
	jne	SHORT $L71846
	push	5
	push	OFFSET FLAT:$SG71458
	mov	ecx, DWORD PTR _dispmode$[ebp]
	push	ecx
	call	_strncmp
	add	esp, 12					; 0000000cH
	test	eax, eax
	je	SHORT $L71846
	mov	DWORD PTR -1308+[ebp], 0
	jmp	SHORT $L71847
$L71846:
	mov	DWORD PTR -1308+[ebp], 1
$L71847:
	mov	edx, DWORD PTR -1308+[ebp]
	mov	DWORD PTR _b_tooltip$[ebp], edx

; 1071 : 	int formaccess = AccessNone;

	mov	DWORD PTR _formaccess$[ebp], 0

; 1072 : 	char bgcolor[256];
; 1073 : 	ObjTableFormat *tbl = ctrl ? ctrl->objtbl : NULL;

	cmp	DWORD PTR _ctrl$[ebp], 0
	je	SHORT $L71848
	mov	eax, DWORD PTR _ctrl$[ebp]
	mov	ecx, DWORD PTR [eax+232]
	mov	DWORD PTR -1312+[ebp], ecx
	jmp	SHORT $L71849
$L71848:
	mov	DWORD PTR -1312+[ebp], 0
$L71849:
	mov	edx, DWORD PTR -1312+[ebp]
	mov	DWORD PTR _tbl$[ebp], edx

; 1074 : 	DynTable *tblattr = tbl ? tbl->attr : &ctrl->attr;

	cmp	DWORD PTR _tbl$[ebp], 0
	je	SHORT $L71850
	mov	eax, DWORD PTR _tbl$[ebp]
	mov	ecx, DWORD PTR [eax]
	mov	DWORD PTR -1316+[ebp], ecx
	jmp	SHORT $L71851
$L71850:
	mov	edx, DWORD PTR _ctrl$[ebp]
	add	edx, 44					; 0000002cH
	mov	DWORD PTR -1316+[ebp], edx
$L71851:
	mov	eax, DWORD PTR -1316+[ebp]
	mov	DWORD PTR _tblattr$[ebp], eax

; 1075 : 	CHECK_HTML_STATUS;

	cmp	DWORD PTR _cntxt$[ebp], 0
	je	SHORT $L71854
	mov	ecx, DWORD PTR _cntxt$[ebp]
	cmp	DWORD PTR [ecx+80], 0
	je	SHORT $L71852
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	eax, DWORD PTR [edx+80]
	mov	ecx, DWORD PTR [eax+232]
	mov	DWORD PTR -1320+[ebp], ecx
	jmp	SHORT $L71853
$L71852:
	mov	DWORD PTR -1320+[ebp], 0
$L71853:
	mov	edx, DWORD PTR -1320+[ebp]
	mov	DWORD PTR -1324+[ebp], edx
	jmp	SHORT $L71855
$L71854:
	mov	DWORD PTR -1324+[ebp], 0
$L71855:
	mov	eax, DWORD PTR -1324+[ebp]
	mov	DWORD PTR _html$[ebp], eax
	cmp	DWORD PTR _html$[ebp], 0
	jne	SHORT $L71467
	xor	eax, eax
	jmp	$L71407
$L71467:

; 1076 : 
; 1077 : 	/* Build formstamp list */
; 1078 : 	if(ctrl && DYNTAB_FIELD_CELL(tblattr, LIST_OPENFIXED) && (!val || !val->IdValObj || val->IdValObj == val->IdObj))

	cmp	DWORD PTR _ctrl$[ebp], 0
	je	$L71468
	push	0
	push	-1
	push	OFFSET FLAT:$SG71469
	mov	ecx, DWORD PTR _tblattr$[ebp]
	push	ecx
	call	_dyntab_field_cell
	add	esp, 16					; 00000010H
	test	eax, eax
	je	$L71468
	cmp	DWORD PTR _val$[ebp], 0
	je	SHORT $L71470
	mov	edx, DWORD PTR _val$[ebp]
	cmp	DWORD PTR [edx+24], 0
	je	SHORT $L71470
	mov	eax, DWORD PTR _val$[ebp]
	mov	ecx, DWORD PTR _val$[ebp]
	mov	edx, DWORD PTR [eax+24]
	cmp	edx, DWORD PTR [ecx+20]
	jne	$L71468
$L71470:

; 1080 : 		/* Fixed form : read given form - return if none */
; 1081 : 		DynTableCell *c = DYNTAB_FIELD_CELL(tblattr, LIST_OPENFORM);

	push	0
	push	-1
	push	OFFSET FLAT:$SG71472
	mov	eax, DWORD PTR _tblattr$[ebp]
	push	eax
	call	_dyntab_field_cell
	add	esp, 16					; 00000010H
	mov	DWORD PTR _c$71471[ebp], eax

; 1082 : 		if(!c || !c->txt || !atoi(c->txt)) RETURN_OK;

	cmp	DWORD PTR _c$71471[ebp], 0
	je	SHORT $L71474
	mov	ecx, DWORD PTR _c$71471[ebp]
	cmp	DWORD PTR [ecx], 0
	je	SHORT $L71474
	mov	edx, DWORD PTR _c$71471[ebp]
	mov	eax, DWORD PTR [edx]
	push	eax
	call	_atoi
	add	esp, 4
	test	eax, eax
	jne	SHORT $L71473
$L71474:
	jmp	$eva_noerr$71475
$L71473:

; 1083 : 		DYNTAB_ADD_CELLP(&formstamp, 0, 0, c);

	push	1
	mov	ecx, DWORD PTR _c$71471[ebp]
	push	ecx
	push	0
	push	0
	lea	edx, DWORD PTR _formstamp$[ebp]
	push	edx
	call	_dyntab_copy
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L71476
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29872], OFFSET FLAT:$SG71478
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 1083		; 0000043bH
	jmp	$eva_err$71479
$L71476:

; 1085 : 	else

	jmp	SHORT $L71481
$L71468:

; 1087 : 		i = beg;

	mov	edx, DWORD PTR _beg$[ebp]
	mov	DWORD PTR _i$[ebp], edx

; 1088 : 		DYNTAB_FIELDBEG(&formstamp, data, FORMSTAMP, &i);

	lea	eax, DWORD PTR _formstamp$[ebp]
	push	eax
	call	_dyntab_free
	add	esp, 4
	lea	ecx, DWORD PTR _i$[ebp]
	push	ecx
	push	-1
	push	OFFSET FLAT:$SG71482
	mov	edx, DWORD PTR _data$[ebp]
	push	edx
	push	0
	lea	eax, DWORD PTR _formstamp$[ebp]
	push	eax
	call	_dyntab_filter_field
	add	esp, 24					; 00000018H
	test	eax, eax
	je	SHORT $L71481
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29872], OFFSET FLAT:$SG71484
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 1088		; 00000440H
	jmp	$eva_err$71479
$L71481:

; 1090 : 	dyntab_sort(&formstamp, qsort_col0idesc);

	push	OFFSET FLAT:_qsort_col0idesc
	lea	eax, DWORD PTR _formstamp$[ebp]
	push	eax
	call	_dyntab_sort
	add	esp, 8

; 1091 : 
; 1092 : 	/* Prepare & output cell separator if applicable */
; 1093 : 	if(bg_color && *bg_color != '*')

	cmp	DWORD PTR _bg_color$[ebp], 0
	je	$L71491
	mov	ecx, DWORD PTR _bg_color$[ebp]
	movsx	edx, BYTE PTR [ecx]
	cmp	edx, 42					; 0000002aH
	je	$L71491

; 1095 : 		if(*bg_color) snprintf(add_sz_str(bgcolor), " bgcolor=#%s", bg_color);

	mov	eax, DWORD PTR _bg_color$[ebp]
	movsx	ecx, BYTE PTR [eax]
	test	ecx, ecx
	je	SHORT $L71486
	mov	edx, DWORD PTR _bg_color$[ebp]
	push	edx
	push	OFFSET FLAT:$SG71487
	push	255					; 000000ffH
	lea	eax, DWORD PTR _bgcolor$[ebp]
	push	eax
	call	__snprintf
	add	esp, 16					; 00000010H

; 1096 : 		else *bgcolor = 0;

	jmp	SHORT $L71488
$L71486:
	mov	BYTE PTR _bgcolor$[ebp], 0
$L71488:

; 1097 : 		if(b_button) DYNBUF_ADD3(html, "<td align=right valign=top", bgcolor, 0, NO_CONV, ">");

	cmp	DWORD PTR _b_button$[ebp], 0
	je	SHORT $L71491
	push	1
	push	OFFSET FLAT:$SG71492
	push	0
	push	0
	push	0
	lea	ecx, DWORD PTR _bgcolor$[ebp]
	push	ecx
	push	26					; 0000001aH
	push	OFFSET FLAT:$SG71493
	mov	edx, DWORD PTR _html$[ebp]
	push	edx
	call	_dynbuf_add3
	add	esp, 36					; 00000024H
	test	eax, eax
	je	SHORT $L71491
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29872], OFFSET FLAT:$SG71495
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 1097		; 00000449H
	jmp	$eva_err$71479
$L71491:

; 1099 : 
; 1100 : 	/* For each object formstamp */
; 1101 : 	for(i = 0; i < formstamp.nbrows; i++)

	mov	DWORD PTR _i$[ebp], 0
	jmp	SHORT $L71496
$L71497:
	mov	edx, DWORD PTR _i$[ebp]
	add	edx, 1
	mov	DWORD PTR _i$[ebp], edx
$L71496:
	mov	eax, DWORD PTR _i$[ebp]
	cmp	eax, DWORD PTR _formstamp$[ebp]
	jae	$L71498

; 1103 : 		/* Read object & form info */
; 1104 : 		unsigned long id_form = DYNTAB_TOULRC(&formstamp, i, 0), i_fc;

	push	10					; 0000000aH
	push	0
	push	0
	mov	ecx, DWORD PTR _i$[ebp]
	push	ecx
	lea	edx, DWORD PTR _formstamp$[ebp]
	push	edx
	call	_dyntab_val
	add	esp, 12					; 0000000cH
	push	eax
	call	_strtoul
	add	esp, 12					; 0000000cH
	mov	DWORD PTR _id_form$71499[ebp], eax

; 1105 : 		int access = AccessNone;

	mov	DWORD PTR _access$71502[ebp], 0

; 1106 : 		if(qry_obj_label(cntxt, &formname, &fnotes,
; 1107 : 				b_label ? &objname : NULL, NULL, b_tooltip ? &notes : NULL,
; 1108 : 				&img, &imgsel, &i_fc, id_form, data, beg)) CLEAR_ERROR;

	mov	eax, DWORD PTR _beg$[ebp]
	push	eax
	mov	ecx, DWORD PTR _data$[ebp]
	push	ecx
	mov	edx, DWORD PTR _id_form$71499[ebp]
	push	edx
	lea	eax, DWORD PTR _i_fc$71501[ebp]
	push	eax
	lea	ecx, DWORD PTR _imgsel$[ebp]
	push	ecx
	lea	edx, DWORD PTR _img$[ebp]
	push	edx
	mov	eax, DWORD PTR _b_tooltip$[ebp]
	neg	eax
	sbb	eax, eax
	lea	ecx, DWORD PTR _notes$[ebp]
	and	eax, ecx
	push	eax
	push	0
	mov	edx, DWORD PTR _b_label$[ebp]
	neg	edx
	sbb	edx, edx
	lea	eax, DWORD PTR _objname$[ebp]
	and	edx, eax
	push	edx
	lea	ecx, DWORD PTR _fnotes$[ebp]
	push	ecx
	lea	edx, DWORD PTR _formname$[ebp]
	push	edx
	mov	eax, DWORD PTR _cntxt$[ebp]
	push	eax
	call	_qry_obj_label
	add	esp, 48					; 00000030H
	test	eax, eax
	je	SHORT $L71506
	push	1108					; 00000454H
	push	OFFSET FLAT:$SG71507
	push	OFFSET FLAT:$SG71508
	mov	ecx, DWORD PTR _cntxt$[ebp]
	push	ecx
	call	_err_clear
	add	esp, 16					; 00000010H
$L71506:

; 1109 : 		if(i_fc >= cntxt->nbfc) continue;

	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	eax, DWORD PTR _i_fc$71501[ebp]
	cmp	eax, DWORD PTR [edx+29296]
	jb	SHORT $L71509
	jmp	$L71497
$L71509:

; 1110 : 
; 1111 : 		/* Check user access to object & form */
; 1112 : 		if(objdata && objdata->IdObj)

	cmp	DWORD PTR _objdata$[ebp], 0
	je	$L71510
	mov	ecx, DWORD PTR _objdata$[ebp]
	cmp	DWORD PTR [ecx+20], 0
	je	$L71510

; 1114 : 			EVA_ctrl newctrl = {{0}};

	mov	DWORD PTR _newctrl$71511[ebp], 0
	xor	edx, edx
	mov	DWORD PTR _newctrl$71511[ebp+4], edx
	mov	DWORD PTR _newctrl$71511[ebp+8], edx
	mov	DWORD PTR _newctrl$71511[ebp+12], edx
	mov	DWORD PTR _newctrl$71511[ebp+16], edx
	mov	ecx, 115				; 00000073H
	xor	eax, eax
	lea	edi, DWORD PTR _newctrl$71511[ebp+20]
	rep stosd

; 1115 : 			EVA_form newform = {0};

	mov	DWORD PTR _newform$71512[ebp], 0
	mov	ecx, 60					; 0000003cH
	xor	eax, eax
	lea	edi, DWORD PTR _newform$71512[ebp+4]
	rep stosd

; 1116 : 			newform.ctrl = &newctrl;

	lea	eax, DWORD PTR _newctrl$71511[ebp]
	mov	DWORD PTR _newform$71512[ebp], eax

; 1117 : 			memcpy(&newctrl.attr, &cntxt->fc[i_fc].data, sizeof(newctrl.attr));

	push	20					; 00000014H
	mov	ecx, DWORD PTR _i_fc$71501[ebp]
	imul	ecx, 292				; 00000124H
	mov	edx, DWORD PTR _cntxt$[ebp]
	lea	eax, DWORD PTR [edx+ecx+108]
	push	eax
	lea	ecx, DWORD PTR _newctrl$71511[ebp+44]
	push	ecx
	call	_memcpy
	add	esp, 12					; 0000000cH

; 1118 : 			memcpy(&newform.objdata, data, sizeof(newform.objdata));

	push	20					; 00000014H
	mov	edx, DWORD PTR _data$[ebp]
	push	edx
	lea	eax, DWORD PTR _newform$71512[ebp+52]
	push	eax
	call	_memcpy
	add	esp, 12					; 0000000cH

; 1119 : 			newform.objdata.cell = data->cell + data->szcols * beg;

	mov	ecx, DWORD PTR _data$[ebp]
	mov	edx, DWORD PTR [ecx+12]
	imul	edx, DWORD PTR _beg$[ebp]
	shl	edx, 6
	mov	eax, DWORD PTR _data$[ebp]
	mov	ecx, DWORD PTR [eax+16]
	add	ecx, edx
	mov	DWORD PTR _newform$71512[ebp+68], ecx

; 1120 : 			newform.objdata.nbrows -= beg;

	mov	edx, DWORD PTR _newform$71512[ebp+52]
	sub	edx, DWORD PTR _beg$[ebp]
	mov	DWORD PTR _newform$71512[ebp+52], edx

; 1121 : 			cntxt->form = &newform;

	mov	eax, DWORD PTR _cntxt$[ebp]
	lea	ecx, DWORD PTR _newform$71512[ebp]
	mov	DWORD PTR [eax+80], ecx

; 1122 : 			DYNTAB_ADD_INT(&newform.id_obj, 0, 0, newform.objdata.cell->IdObj);

	mov	BYTE PTR __tmp$71513[ebp], 0
	mov	ecx, 7
	xor	eax, eax
	lea	edi, DWORD PTR __tmp$71513[ebp+1]
	rep stosd
	stosw
	stosb
	mov	edx, DWORD PTR _newform$71512[ebp+68]
	mov	eax, DWORD PTR [edx+20]
	push	eax
	push	OFFSET FLAT:$SG71514
	lea	ecx, DWORD PTR __tmp$71513[ebp]
	push	ecx
	call	_sprintf
	add	esp, 12					; 0000000cH
	push	0
	push	0
	push	0
	lea	edx, DWORD PTR __tmp$71513[ebp]
	push	edx
	push	0
	push	0
	lea	eax, DWORD PTR _newform$71512[ebp+32]
	push	eax
	call	_dyntab_add
	add	esp, 28					; 0000001cH
	test	eax, eax
	je	SHORT $L71516
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29872], OFFSET FLAT:$SG71518
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 1122		; 00000462H
	jmp	$eva_err$71479
$L71516:

; 1123 : 			DYNTAB_ADD_INT(&newform.id_form, 0, 0, id_form);

	mov	BYTE PTR __tmp$71519[ebp], 0
	mov	ecx, 7
	xor	eax, eax
	lea	edi, DWORD PTR __tmp$71519[ebp+1]
	rep stosd
	stosw
	stosb
	mov	eax, DWORD PTR _id_form$71499[ebp]
	push	eax
	push	OFFSET FLAT:$SG71520
	lea	ecx, DWORD PTR __tmp$71519[ebp]
	push	ecx
	call	_sprintf
	add	esp, 12					; 0000000cH
	push	0
	push	0
	push	0
	lea	edx, DWORD PTR __tmp$71519[ebp]
	push	edx
	push	0
	push	0
	lea	eax, DWORD PTR _newform$71512[ebp+12]
	push	eax
	call	_dyntab_add
	add	esp, 28					; 0000001cH
	test	eax, eax
	je	SHORT $L71522
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29872], OFFSET FLAT:$SG71524
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 1123		; 00000463H
	jmp	$eva_err$71479
$L71522:

; 1124 : 			if(ctrl_check_access(cntxt, &newctrl)) STACK_ERROR;

	lea	eax, DWORD PTR _newctrl$71511[ebp]
	push	eax
	mov	ecx, DWORD PTR _cntxt$[ebp]
	push	ecx
	call	_ctrl_check_access
	add	esp, 8
	test	eax, eax
	je	SHORT $L71525
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 1124		; 00000464H
	jmp	$eva_err$71479
$L71525:

; 1125 : 			newform.step = HtmlView;

	mov	DWORD PTR _newform$71512[ebp+176], 6

; 1126 : 			if(ctrl_check_access(cntxt, &newctrl)) STACK_ERROR;

	lea	eax, DWORD PTR _newctrl$71511[ebp]
	push	eax
	mov	ecx, DWORD PTR _cntxt$[ebp]
	push	ecx
	call	_ctrl_check_access
	add	esp, 8
	test	eax, eax
	je	SHORT $L71526
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 1126		; 00000466H
	jmp	$eva_err$71479
$L71526:

; 1127 : 			access = newctrl.access;

	mov	eax, DWORD PTR _newctrl$71511[ebp+184]
	mov	DWORD PTR _access$71502[ebp], eax

; 1128 : 			DYNTAB_FREE(newform.id_obj);

	lea	ecx, DWORD PTR _newform$71512[ebp+32]
	push	ecx
	call	_dyntab_free
	add	esp, 4

; 1129 : 			DYNTAB_FREE(newform.id_form);

	lea	edx, DWORD PTR _newform$71512[ebp+12]
	push	edx
	call	_dyntab_free
	add	esp, 4

; 1130 : 			cntxt->form = form;

	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	ecx, DWORD PTR _form$[ebp]
	mov	DWORD PTR [eax+80], ecx

; 1132 : 		else

	jmp	SHORT $L71527
$L71510:

; 1133 : 			access = AccessView;

	mov	DWORD PTR _access$71502[ebp], 1
$L71527:

; 1134 : 
; 1135 : 		/* Continue if user has no access to form/object & previous form allowed access */
; 1136 : 		if(access == AccessNone && (cntform || i + 1 < formstamp.nbrows)) continue;

	cmp	DWORD PTR _access$71502[ebp], 0
	jne	SHORT $L71528
	cmp	DWORD PTR _cntform$[ebp], 0
	jne	SHORT $L71529
	mov	edx, DWORD PTR _i$[ebp]
	add	edx, 1
	cmp	edx, DWORD PTR _formstamp$[ebp]
	jae	SHORT $L71528
$L71529:
	jmp	$L71497
$L71528:

; 1137 : 		cntform++;

	mov	eax, DWORD PTR _cntform$[ebp]
	add	eax, 1
	mov	DWORD PTR _cntform$[ebp], eax

; 1138 : 
; 1139 : 		/* Build tooltip */
; 1140 : 		if(txtnotes) DYNBUF_ADD_STR(&txtnotes, "\n\n");

	cmp	DWORD PTR _txtnotes$[ebp], 0
	je	SHORT $L71532
	push	0
	push	0
	push	2
	push	OFFSET FLAT:$SG71533
	lea	ecx, DWORD PTR _txtnotes$[ebp]
	push	ecx
	call	_dynbuf_add
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L71532
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29872], OFFSET FLAT:$SG71535
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 1140		; 00000474H
	jmp	$eva_err$71479
$L71532:

; 1141 : 		DYNBUF_ADD3_BUF(&txtnotes, "[", formname, NO_CONV, "] : ");

	cmp	DWORD PTR _formname$[ebp], 0
	je	SHORT $L71856
	mov	ecx, DWORD PTR _formname$[ebp]
	mov	edx, DWORD PTR [ecx+4]
	mov	DWORD PTR -1328+[ebp], edx
	jmp	SHORT $L71857
$L71856:
	mov	DWORD PTR -1328+[ebp], 0
$L71857:
	cmp	DWORD PTR _formname$[ebp], 0
	je	SHORT $L71858
	mov	eax, DWORD PTR _formname$[ebp]
	add	eax, 8
	mov	DWORD PTR -1332+[ebp], eax
	jmp	SHORT $L71859
$L71858:
	mov	DWORD PTR -1332+[ebp], 0
$L71859:
	push	4
	push	OFFSET FLAT:$SG71539
	push	0
	push	0
	mov	ecx, DWORD PTR -1328+[ebp]
	push	ecx
	mov	edx, DWORD PTR -1332+[ebp]
	push	edx
	push	1
	push	OFFSET FLAT:$SG71540
	lea	eax, DWORD PTR _txtnotes$[ebp]
	push	eax
	call	_dynbuf_add3
	add	esp, 36					; 00000024H
	test	eax, eax
	je	SHORT $L71538
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29872], OFFSET FLAT:$SG71542
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 1141		; 00000475H
	jmp	$eva_err$71479
$L71538:

; 1142 : 		DYNBUF_ADD_BUF(&txtnotes, objname, NO_CONV);

	cmp	DWORD PTR _objname$[ebp], 0
	je	SHORT $L71544
	push	0
	push	0
	mov	eax, DWORD PTR _objname$[ebp]
	mov	ecx, DWORD PTR [eax+4]
	push	ecx
	mov	edx, DWORD PTR _objname$[ebp]
	add	edx, 8
	push	edx
	lea	eax, DWORD PTR _txtnotes$[ebp]
	push	eax
	call	_dynbuf_add
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L71544
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29872], OFFSET FLAT:$SG71546
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 1142		; 00000476H
	jmp	$eva_err$71479
$L71544:

; 1143 : 		if(access != AccessNone && notes) DYNBUF_ADD3_BUF(&txtnotes, "\n", notes, NO_CONV, "");

	cmp	DWORD PTR _access$71502[ebp], 0
	je	$L71550
	cmp	DWORD PTR _notes$[ebp], 0
	je	$L71550
	cmp	DWORD PTR _notes$[ebp], 0
	je	SHORT $L71860
	mov	eax, DWORD PTR _notes$[ebp]
	mov	ecx, DWORD PTR [eax+4]
	mov	DWORD PTR -1336+[ebp], ecx
	jmp	SHORT $L71861
$L71860:
	mov	DWORD PTR -1336+[ebp], 0
$L71861:
	cmp	DWORD PTR _notes$[ebp], 0
	je	SHORT $L71862
	mov	edx, DWORD PTR _notes$[ebp]
	add	edx, 8
	mov	DWORD PTR -1340+[ebp], edx
	jmp	SHORT $L71863
$L71862:
	mov	DWORD PTR -1340+[ebp], 0
$L71863:
	push	0
	push	OFFSET FLAT:$SG71551
	push	0
	push	0
	mov	eax, DWORD PTR -1336+[ebp]
	push	eax
	mov	ecx, DWORD PTR -1340+[ebp]
	push	ecx
	push	1
	push	OFFSET FLAT:$SG71552
	lea	edx, DWORD PTR _txtnotes$[ebp]
	push	edx
	call	_dynbuf_add3
	add	esp, 36					; 00000024H
	test	eax, eax
	je	SHORT $L71550
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29872], OFFSET FLAT:$SG71554
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 1143		; 00000477H
	jmp	$eva_err$71479
$L71550:

; 1144 : 
; 1145 : 		/* Build label */
; 1146 : 		if(b_label && !txtlabel)

	cmp	DWORD PTR _b_label$[ebp], 0
	je	$L71575
	cmp	DWORD PTR _txtlabel$[ebp], 0
	jne	$L71575

; 1148 : 			use_form = id_form;

	mov	edx, DWORD PTR _id_form$71499[ebp]
	mov	DWORD PTR _use_form$[ebp], edx

; 1149 : 			formaccess = access;

	mov	eax, DWORD PTR _access$71502[ebp]
	mov	DWORD PTR _formaccess$[ebp], eax

; 1150 : 			if(b_formname) DYNBUF_ADD_BUF(&txtlabel, formname, NO_CONV);

	cmp	DWORD PTR _b_formname$[ebp], 0
	je	SHORT $L71558
	cmp	DWORD PTR _formname$[ebp], 0
	je	SHORT $L71558
	push	0
	push	0
	mov	ecx, DWORD PTR _formname$[ebp]
	mov	edx, DWORD PTR [ecx+4]
	push	edx
	mov	eax, DWORD PTR _formname$[ebp]
	add	eax, 8
	push	eax
	lea	ecx, DWORD PTR _txtlabel$[ebp]
	push	ecx
	call	_dynbuf_add
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L71558
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29872], OFFSET FLAT:$SG71560
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 1150		; 0000047eH
	jmp	$eva_err$71479
$L71558:

; 1151 : 			if(b_formname && formname && b_objname && objname) DYNBUF_ADD_STR(&txtlabel, " - ");

	cmp	DWORD PTR _b_formname$[ebp], 0
	je	SHORT $L71563
	cmp	DWORD PTR _formname$[ebp], 0
	je	SHORT $L71563
	cmp	DWORD PTR _b_objname$[ebp], 0
	je	SHORT $L71563
	cmp	DWORD PTR _objname$[ebp], 0
	je	SHORT $L71563
	push	0
	push	0
	push	3
	push	OFFSET FLAT:$SG71564
	lea	ecx, DWORD PTR _txtlabel$[ebp]
	push	ecx
	call	_dynbuf_add
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L71563
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29872], OFFSET FLAT:$SG71566
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 1151		; 0000047fH
	jmp	$eva_err$71479
$L71563:

; 1152 : 			if(b_objname) DYNBUF_ADD_BUF(&txtlabel, objname, NO_CONV);

	cmp	DWORD PTR _b_objname$[ebp], 0
	je	SHORT $L71569
	cmp	DWORD PTR _objname$[ebp], 0
	je	SHORT $L71569
	push	0
	push	0
	mov	ecx, DWORD PTR _objname$[ebp]
	mov	edx, DWORD PTR [ecx+4]
	push	edx
	mov	eax, DWORD PTR _objname$[ebp]
	add	eax, 8
	push	eax
	lea	ecx, DWORD PTR _txtlabel$[ebp]
	push	ecx
	call	_dynbuf_add
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L71569
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29872], OFFSET FLAT:$SG71571
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 1152		; 00000480H
	jmp	$eva_err$71479
$L71569:

; 1153 : 			if(!(objdata && objdata->IdObj) && cntxt->fc[i_fc].fields.nbrows) DYNBUF_ADD_STR(&txtlabel, " (Nouvelle fiche)");

	cmp	DWORD PTR _objdata$[ebp], 0
	je	SHORT $L71573
	mov	ecx, DWORD PTR _objdata$[ebp]
	cmp	DWORD PTR [ecx+20], 0
	jne	SHORT $L71575
$L71573:
	mov	edx, DWORD PTR _i_fc$71501[ebp]
	imul	edx, 292				; 00000124H
	mov	eax, DWORD PTR _cntxt$[ebp]
	cmp	DWORD PTR [eax+edx+148], 0
	je	SHORT $L71575
	push	0
	push	0
	push	17					; 00000011H
	push	OFFSET FLAT:$SG71576
	lea	ecx, DWORD PTR _txtlabel$[ebp]
	push	ecx
	call	_dynbuf_add
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L71575
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29872], OFFSET FLAT:$SG71578
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 1153		; 00000481H
	jmp	$eva_err$71479
$L71575:

; 1155 : 
; 1156 : 		/* Output button */
; 1157 : 		if(b_button)

	cmp	DWORD PTR _b_button$[ebp], 0
	je	$L71582

; 1159 : 			if(html_put_open_btn(cntxt, opname, formname,
; 1160 : 							b_label ? NULL : objtitle, !b_tooltip ? NULL : b_label ? fnotes : notes,
; 1161 : 							img, imgsel,
; 1162 : 							id_form, objdata ? objdata->IdObj : 0, loc,
; 1163 : 							access == AccessNone, atoi(CTRL_ATTR_VAL(OPEN_MODE))))

	cmp	DWORD PTR _ctrl$[ebp], 0
	je	SHORT $L71864
	push	0
	push	-1
	push	OFFSET FLAT:$SG71583
	mov	ecx, DWORD PTR _ctrl$[ebp]
	add	ecx, 44					; 0000002cH
	push	ecx
	call	_dyntab_field_val
	add	esp, 16					; 00000010H
	mov	DWORD PTR -1344+[ebp], eax
	jmp	SHORT $L71865
$L71864:
	mov	DWORD PTR -1344+[ebp], OFFSET FLAT:$SG71584
$L71865:
	cmp	DWORD PTR _objdata$[ebp], 0
	je	SHORT $L71866
	mov	edx, DWORD PTR _objdata$[ebp]
	mov	eax, DWORD PTR [edx+20]
	mov	DWORD PTR -1348+[ebp], eax
	jmp	SHORT $L71867
$L71866:
	mov	DWORD PTR -1348+[ebp], 0
$L71867:
	cmp	DWORD PTR _b_tooltip$[ebp], 0
	jne	SHORT $L71870
	mov	DWORD PTR -1352+[ebp], 0
	jmp	SHORT $L71871
$L71870:
	cmp	DWORD PTR _b_label$[ebp], 0
	je	SHORT $L71868
	mov	ecx, DWORD PTR _fnotes$[ebp]
	mov	DWORD PTR -1356+[ebp], ecx
	jmp	SHORT $L71869
$L71868:
	mov	edx, DWORD PTR _notes$[ebp]
	mov	DWORD PTR -1356+[ebp], edx
$L71869:
	mov	eax, DWORD PTR -1356+[ebp]
	mov	DWORD PTR -1352+[ebp], eax
$L71871:
	mov	ecx, DWORD PTR -1344+[ebp]
	push	ecx
	call	_atoi
	add	esp, 4
	push	eax
	xor	edx, edx
	cmp	DWORD PTR _access$71502[ebp], 0
	sete	dl
	push	edx
	mov	eax, DWORD PTR _loc$[ebp]
	push	eax
	mov	ecx, DWORD PTR -1348+[ebp]
	push	ecx
	mov	edx, DWORD PTR _id_form$71499[ebp]
	push	edx
	mov	eax, DWORD PTR _imgsel$[ebp]
	push	eax
	mov	ecx, DWORD PTR _img$[ebp]
	push	ecx
	mov	edx, DWORD PTR -1352+[ebp]
	push	edx
	mov	eax, DWORD PTR _b_label$[ebp]
	neg	eax
	sbb	eax, eax
	not	eax
	and	eax, DWORD PTR _objtitle$[ebp]
	push	eax
	mov	ecx, DWORD PTR _formname$[ebp]
	push	ecx
	lea	edx, DWORD PTR _opname$[ebp]
	push	edx
	mov	eax, DWORD PTR _cntxt$[ebp]
	push	eax
	call	_html_put_open_btn
	add	esp, 48					; 00000030H
	test	eax, eax
	je	SHORT $L71582

; 1164 : 				STACK_ERROR;

	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 1164		; 0000048cH
	jmp	$eva_err$71479
$L71582:

; 1166 : 	}

	jmp	$L71497
$L71498:

; 1167 : 	if(bg_color && b_button) DYNBUF_ADD_STR(html, "</td>\n");

	cmp	DWORD PTR _bg_color$[ebp], 0
	je	SHORT $L71587
	cmp	DWORD PTR _b_button$[ebp], 0
	je	SHORT $L71587
	push	0
	push	0
	push	6
	push	OFFSET FLAT:$SG71588
	mov	edx, DWORD PTR _html$[ebp]
	push	edx
	call	_dynbuf_add
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L71587
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29872], OFFSET FLAT:$SG71590
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 1167		; 0000048fH
	jmp	$eva_err$71479
$L71587:

; 1168 : 
; 1169 : 	if(b_label && val && !val->b_relation && val->txt && strtoul(val->txt, NULL, 10) != (objdata ? objdata->IdObj : 0))

	cmp	DWORD PTR _b_label$[ebp], 0
	je	$L71595
	cmp	DWORD PTR _val$[ebp], 0
	je	$L71595
	mov	edx, DWORD PTR _val$[ebp]
	movsx	eax, BYTE PTR [edx+12]
	test	eax, eax
	jne	$L71595
	mov	ecx, DWORD PTR _val$[ebp]
	cmp	DWORD PTR [ecx], 0
	je	$L71595
	cmp	DWORD PTR _objdata$[ebp], 0
	je	SHORT $L71872
	mov	edx, DWORD PTR _objdata$[ebp]
	mov	eax, DWORD PTR [edx+20]
	mov	DWORD PTR -1360+[ebp], eax
	jmp	SHORT $L71873
$L71872:
	mov	DWORD PTR -1360+[ebp], 0
$L71873:
	push	10					; 0000000aH
	push	0
	mov	ecx, DWORD PTR _val$[ebp]
	mov	edx, DWORD PTR [ecx]
	push	edx
	call	_strtoul
	add	esp, 12					; 0000000cH
	cmp	eax, DWORD PTR -1360+[ebp]
	je	SHORT $L71595

; 1171 : 		M_FREE(txtlabel);

	mov	eax, DWORD PTR _txtlabel$[ebp]
	push	eax
	call	_mem_free
	add	esp, 4
	mov	DWORD PTR _txtlabel$[ebp], 0

; 1172 : 		DYNBUF_ADD_CELLP(&txtlabel, val, NO_CONV);

	mov	ecx, DWORD PTR _val$[ebp]
	mov	DWORD PTR __c$71593[ebp], ecx
	cmp	DWORD PTR __c$71593[ebp], 0
	je	SHORT $L71595
	push	0
	push	0
	mov	edx, DWORD PTR __c$71593[ebp]
	mov	eax, DWORD PTR [edx+4]
	push	eax
	mov	ecx, DWORD PTR __c$71593[ebp]
	mov	edx, DWORD PTR [ecx]
	push	edx
	lea	eax, DWORD PTR _txtlabel$[ebp]
	push	eax
	call	_dynbuf_add
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L71595
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29872], OFFSET FLAT:$SG71597
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 1172		; 00000494H
	jmp	$eva_err$71479
$L71595:

; 1174 : 
; 1175 : 	if(txtlabel)

	cmp	DWORD PTR _txtlabel$[ebp], 0
	je	$L71630

; 1177 : 		if(bg_color) DYNBUF_ADD3(html, "<td valign=top ", *bg_color == '*' ? bg_color + 1 : bgcolor, 0, NO_CONV, ">");

	cmp	DWORD PTR _bg_color$[ebp], 0
	je	SHORT $L71601
	mov	eax, DWORD PTR _bg_color$[ebp]
	movsx	ecx, BYTE PTR [eax]
	cmp	ecx, 42					; 0000002aH
	jne	SHORT $L71874
	mov	edx, DWORD PTR _bg_color$[ebp]
	add	edx, 1
	mov	DWORD PTR -1364+[ebp], edx
	jmp	SHORT $L71875
$L71874:
	lea	eax, DWORD PTR _bgcolor$[ebp]
	mov	DWORD PTR -1364+[ebp], eax
$L71875:
	push	1
	push	OFFSET FLAT:$SG71602
	push	0
	push	0
	push	0
	mov	ecx, DWORD PTR -1364+[ebp]
	push	ecx
	push	15					; 0000000fH
	push	OFFSET FLAT:$SG71603
	mov	edx, DWORD PTR _html$[ebp]
	push	edx
	call	_dynbuf_add3
	add	esp, 36					; 00000024H
	test	eax, eax
	je	SHORT $L71601
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29872], OFFSET FLAT:$SG71605
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 1177		; 00000499H
	jmp	$eva_err$71479
$L71601:

; 1178 : 		if(!*opname) build_open_btn_name(cntxt, opname, use_form, objdata ? objdata->IdObj : 0, loc, 0);

	movsx	edx, BYTE PTR _opname$[ebp]
	test	edx, edx
	jne	SHORT $L71606
	cmp	DWORD PTR _objdata$[ebp], 0
	je	SHORT $L71876
	mov	eax, DWORD PTR _objdata$[ebp]
	mov	ecx, DWORD PTR [eax+20]
	mov	DWORD PTR -1368+[ebp], ecx
	jmp	SHORT $L71877
$L71876:
	mov	DWORD PTR -1368+[ebp], 0
$L71877:
	push	0
	mov	edx, DWORD PTR _loc$[ebp]
	push	edx
	mov	eax, DWORD PTR -1368+[ebp]
	push	eax
	mov	ecx, DWORD PTR _use_form$[ebp]
	push	ecx
	lea	edx, DWORD PTR _opname$[ebp]
	push	edx
	mov	eax, DWORD PTR _cntxt$[ebp]
	push	eax
	call	_build_open_btn_name
	add	esp, 24					; 00000018H
$L71606:

; 1179 : 		if(cntxt->jsenabled || formaccess == AccessNone)

	mov	ecx, DWORD PTR _cntxt$[ebp]
	cmp	DWORD PTR [ecx+29676], 0
	jne	SHORT $L71608
	cmp	DWORD PTR _formaccess$[ebp], 0
	jne	$L71607
$L71608:

; 1181 : 			if(put_html_bold_substring(cntxt, &htmlabel, DYNBUF_VAL_SZ(txtlabel), tbl ? &tbl->srchwords : NULL))

	cmp	DWORD PTR _tbl$[ebp], 0
	je	SHORT $L71878
	mov	edx, DWORD PTR _tbl$[ebp]
	add	edx, 104				; 00000068H
	mov	DWORD PTR -1372+[ebp], edx
	jmp	SHORT $L71879
$L71878:
	mov	DWORD PTR -1372+[ebp], 0
$L71879:
	cmp	DWORD PTR _txtlabel$[ebp], 0
	je	SHORT $L71880
	mov	eax, DWORD PTR _txtlabel$[ebp]
	mov	ecx, DWORD PTR [eax+4]
	mov	DWORD PTR -1376+[ebp], ecx
	jmp	SHORT $L71881
$L71880:
	mov	DWORD PTR -1376+[ebp], 0
$L71881:
	cmp	DWORD PTR _txtlabel$[ebp], 0
	je	SHORT $L71882
	mov	edx, DWORD PTR _txtlabel$[ebp]
	add	edx, 8
	mov	DWORD PTR -1380+[ebp], edx
	jmp	SHORT $L71883
$L71882:
	mov	DWORD PTR -1380+[ebp], 0
$L71883:
	mov	eax, DWORD PTR -1372+[ebp]
	push	eax
	mov	ecx, DWORD PTR -1376+[ebp]
	push	ecx
	mov	edx, DWORD PTR -1380+[ebp]
	push	edx
	lea	eax, DWORD PTR _htmlabel$[ebp]
	push	eax
	mov	ecx, DWORD PTR _cntxt$[ebp]
	push	ecx
	call	_put_html_bold_substring
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L71611

; 1182 : 				STACK_ERROR;

	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 1182		; 0000049eH
	jmp	$eva_err$71479
$L71611:

; 1184 : 		else

	jmp	SHORT $L71614
$L71607:

; 1185 : 			DYNBUF_ADD_BUF(&htmlabel, txtlabel, NO_CONV);

	cmp	DWORD PTR _txtlabel$[ebp], 0
	je	SHORT $L71614
	push	0
	push	0
	mov	eax, DWORD PTR _txtlabel$[ebp]
	mov	ecx, DWORD PTR [eax+4]
	push	ecx
	mov	edx, DWORD PTR _txtlabel$[ebp]
	add	edx, 8
	push	edx
	lea	eax, DWORD PTR _htmlabel$[ebp]
	push	eax
	call	_dynbuf_add
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L71614
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29872], OFFSET FLAT:$SG71616
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 1185		; 000004a1H
	jmp	$eva_err$71479
$L71614:

; 1186 : 		if(formaccess == AccessNone)

	cmp	DWORD PTR _formaccess$[ebp], 0
	jne	SHORT $L71617

; 1187 : 			DYNBUF_ADD_BUF(html, htmlabel, NO_CONV)

	cmp	DWORD PTR _htmlabel$[ebp], 0
	je	SHORT $L71619
	push	0
	push	0
	mov	eax, DWORD PTR _htmlabel$[ebp]
	mov	ecx, DWORD PTR [eax+4]
	push	ecx
	mov	edx, DWORD PTR _htmlabel$[ebp]
	add	edx, 8
	push	edx
	mov	eax, DWORD PTR _html$[ebp]
	push	eax
	call	_dynbuf_add
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L71619
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29872], OFFSET FLAT:$SG71621
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 1187		; 000004a3H
	jmp	$eva_err$71479
$L71619:

; 1188 : 		else

	jmp	SHORT $L71627
$L71617:

; 1189 : 			if(put_html_button(cntxt, opname, htmlabel->data, NULL, NULL, txtnotes ? txtnotes->data : NULL, 0, 32))

	cmp	DWORD PTR _txtnotes$[ebp], 0
	je	SHORT $L71884
	mov	eax, DWORD PTR _txtnotes$[ebp]
	add	eax, 8
	mov	DWORD PTR -1384+[ebp], eax
	jmp	SHORT $L71885
$L71884:
	mov	DWORD PTR -1384+[ebp], 0
$L71885:
	push	32					; 00000020H
	push	0
	push	0
	push	0
	push	0
	mov	ecx, DWORD PTR -1384+[ebp]
	push	ecx
	push	0
	push	0
	mov	edx, DWORD PTR _htmlabel$[ebp]
	add	edx, 8
	push	edx
	lea	eax, DWORD PTR _opname$[ebp]
	push	eax
	mov	ecx, DWORD PTR _cntxt$[ebp]
	push	ecx
	call	_put_html_button_sz
	add	esp, 44					; 0000002cH
	test	eax, eax
	je	SHORT $L71627

; 1190 : 			STACK_ERROR;

	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 1190		; 000004a6H
	jmp	SHORT $eva_err$71479
$L71627:

; 1191 : 		if(bg_color && *bg_color != '*') DYNBUF_ADD_STR(html, "</td>");

	cmp	DWORD PTR _bg_color$[ebp], 0
	je	SHORT $L71630
	mov	eax, DWORD PTR _bg_color$[ebp]
	movsx	ecx, BYTE PTR [eax]
	cmp	ecx, 42					; 0000002aH
	je	SHORT $L71630
	push	0
	push	0
	push	5
	push	OFFSET FLAT:$SG71631
	mov	edx, DWORD PTR _html$[ebp]
	push	edx
	call	_dynbuf_add
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L71630
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29872], OFFSET FLAT:$SG71633
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 1191		; 000004a7H
	jmp	SHORT $eva_err$71479
$L71630:
$eva_noerr$71475:

; 1193 : 
; 1194 : 	RETURN_OK_CLEANUP;

	push	0
	push	OFFSET FLAT:$SG71634
	push	OFFSET FLAT:$SG71635
	mov	edx, DWORD PTR _cntxt$[ebp]
	push	edx
	call	_err_clear
	add	esp, 16					; 00000010H
$eva_err$71479:
	mov	eax, DWORD PTR _cntxt$[ebp]
	cmp	DWORD PTR [eax+29872], 0
	je	SHORT $L71636
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	edx, DWORD PTR [ecx+29900]
	push	edx
	push	OFFSET FLAT:$SG71637
	push	OFFSET FLAT:$SG71638
	mov	eax, DWORD PTR _cntxt$[ebp]
	push	eax
	call	_err_add_context
	add	esp, 16					; 00000010H
$L71636:
	lea	ecx, DWORD PTR _formstamp$[ebp]
	push	ecx
	call	_dyntab_free
	add	esp, 4
	lea	edx, DWORD PTR _formdata$[ebp]
	push	edx
	call	_dyntab_free
	add	esp, 4
	mov	eax, DWORD PTR _formname$[ebp]
	push	eax
	call	_mem_free
	add	esp, 4
	mov	DWORD PTR _formname$[ebp], 0
	mov	ecx, DWORD PTR _objname$[ebp]
	push	ecx
	call	_mem_free
	add	esp, 4
	mov	DWORD PTR _objname$[ebp], 0
	mov	edx, DWORD PTR _objtitle$[ebp]
	push	edx
	call	_mem_free
	add	esp, 4
	mov	DWORD PTR _objtitle$[ebp], 0
	mov	eax, DWORD PTR _fnotes$[ebp]
	push	eax
	call	_mem_free
	add	esp, 4
	mov	DWORD PTR _fnotes$[ebp], 0
	mov	ecx, DWORD PTR _notes$[ebp]
	push	ecx
	call	_mem_free
	add	esp, 4
	mov	DWORD PTR _notes$[ebp], 0
	mov	edx, DWORD PTR _img$[ebp]
	push	edx
	call	_mem_free
	add	esp, 4
	mov	DWORD PTR _img$[ebp], 0
	mov	eax, DWORD PTR _imgsel$[ebp]
	push	eax
	call	_mem_free
	add	esp, 4
	mov	DWORD PTR _imgsel$[ebp], 0
	mov	ecx, DWORD PTR _txtlabel$[ebp]
	push	ecx
	call	_mem_free
	add	esp, 4
	mov	DWORD PTR _txtlabel$[ebp], 0
	mov	edx, DWORD PTR _htmlabel$[ebp]
	push	edx
	call	_mem_free
	add	esp, 4
	mov	DWORD PTR _htmlabel$[ebp], 0
	mov	eax, DWORD PTR _txtnotes$[ebp]
	push	eax
	call	_mem_free
	add	esp, 4
	mov	DWORD PTR _txtnotes$[ebp], 0
	mov	ecx, DWORD PTR _cntxt$[ebp]
	xor	eax, eax
	cmp	DWORD PTR [ecx+29872], 0
	setne	al
$L71407:

; 1195 : }

	pop	edi
	mov	esp, ebp
	pop	ebp
	ret	0
_ctrl_add_symbol_btn ENDP
_TEXT	ENDS
PUBLIC	__real@8@3ffbccccccccccccd000
PUBLIC	_ctrl_filter_idobj
EXTRN	__chkstk:NEAR
EXTRN	__fltused:NEAR
EXTRN	_sql_exec_query:NEAR
EXTRN	_qry_exec_filter:NEAR
EXTRN	_sql_get_table:NEAR
EXTRN	_qry_build_flt_select:NEAR
EXTRN	_qry_build_free:NEAR
EXTRN	_err_print_filter:NEAR
EXTRN	_qry_parse_filter:NEAR
_BSS	SEGMENT
	ALIGN	4

$SG71655 DB	01H DUP (?)
_BSS	ENDS
_DATA	SEGMENT
$SG71654 DB	'_EVA_DEBUG_SQL_FILTER', 00H
	ORG $+2
$SG71657 DB	'CREATE TEMPORARY TABLE IdList (IdObj INT NOT NULL) TYPE='
	DB	'HEAP ', 0aH, 00H
	ORG $+1
$SG71665 DB	'ALTER TABLE IdList ADD INDEX (IdObj)', 00H
	ORG $+3
$SG71667 DB	'D:\Travail\ABI\EVA\V4.0\CGI\Brunix-2016\ctrl_utils.c', 00H
	ORG $+3
$SG71668 DB	'ctrl_filter_idobj', 00H
	ORG $+2
$SG71670 DB	'D:\Travail\ABI\EVA\V4.0\CGI\Brunix-2016\ctrl_utils.c', 00H
	ORG $+3
$SG71671 DB	'ctrl_filter_idobj', 00H
_DATA	ENDS
;	COMDAT __real@8@3ffbccccccccccccd000
; File D:\Travail\ABI\EVA\V4.0\CGI\Brunix-2016\ctrl_utils.c
CONST	SEGMENT
__real@8@3ffbccccccccccccd000 DQ 03fb999999999999ar ; 0.1
CONST	ENDS
_TEXT	SEGMENT
_cntxt$ = 8
_res$ = 12
_ctrl$ = 16
_flt$ = -4464
_sql$ = -4
_sql_trace$ = -8
_ctrl_filter_idobj PROC NEAR

; 1212 : ){

	push	ebp
	mov	ebp, esp
	mov	eax, 4480				; 00001180H
	call	__chkstk
	push	edi

; 1213 : 	QryBuild flt = {{0}};

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

; 1214 : 	DynBuffer *sql = NULL;

	mov	DWORD PTR _sql$[ebp], 0

; 1215 : 	int sql_trace = cntxt->sql_trace;

	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	edx, DWORD PTR [ecx+29852]
	mov	DWORD PTR _sql_trace$[ebp], edx

; 1216 : 	if(*CTRL_ATTR_VAL(DEBUG_SQL_FILTER) == '1') cntxt->sql_trace = DEBUG_SQL_RES;

	cmp	DWORD PTR _ctrl$[ebp], 0
	je	SHORT $L71887
	push	0
	push	-1
	push	OFFSET FLAT:$SG71654
	mov	eax, DWORD PTR _ctrl$[ebp]
	add	eax, 44					; 0000002cH
	push	eax
	call	_dyntab_field_val
	add	esp, 16					; 00000010H
	mov	DWORD PTR -4468+[ebp], eax
	jmp	SHORT $L71888
$L71887:
	mov	DWORD PTR -4468+[ebp], OFFSET FLAT:$SG71655
$L71888:
	mov	ecx, DWORD PTR -4468+[ebp]
	movsx	edx, BYTE PTR [ecx]
	cmp	edx, 49					; 00000031H
	jne	SHORT $L71653
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29852], 2
$L71653:

; 1217 : 
; 1218 : 	/* Create temporary table IdList for results if no output table */
; 1219 : 	if(!res && sql_exec_query(cntxt, "CREATE TEMPORARY TABLE IdList (IdObj INT NOT NULL) TYPE=HEAP \n"))

	cmp	DWORD PTR _res$[ebp], 0
	jne	SHORT $L71656
	push	OFFSET FLAT:$SG71657
	mov	ecx, DWORD PTR _cntxt$[ebp]
	push	ecx
	call	_sql_exec_query
	add	esp, 8
	test	eax, eax
	je	SHORT $L71656

; 1220 : 		STACK_ERROR;

	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 1220		; 000004c4H
	jmp	$eva_err$71658
$L71656:

; 1221 : 
; 1222 : 	/* Build IdObj query for filter */
; 1223 : 	if(qry_parse_filter(cntxt, &flt, &ctrl->attr) ||
; 1224 : 		qry_build_flt_select(cntxt, &sql, res, &flt,
; 1225 : 								ctrl->objtbl ? ctrl->objtbl->line : 0,
; 1226 : 								ctrl->objtbl ? ctrl->objtbl->lines : 0))

	mov	eax, DWORD PTR _ctrl$[ebp]
	add	eax, 44					; 0000002cH
	push	eax
	lea	ecx, DWORD PTR _flt$[ebp]
	push	ecx
	mov	edx, DWORD PTR _cntxt$[ebp]
	push	edx
	call	_qry_parse_filter
	add	esp, 12					; 0000000cH
	test	eax, eax
	jne	$L71660
	mov	eax, DWORD PTR _ctrl$[ebp]
	cmp	DWORD PTR [eax+232], 0
	je	SHORT $L71889
	mov	ecx, DWORD PTR _ctrl$[ebp]
	mov	edx, DWORD PTR [ecx+232]
	mov	eax, DWORD PTR [edx+44]
	mov	DWORD PTR -4472+[ebp], eax
	jmp	SHORT $L71890
$L71889:
	mov	DWORD PTR -4472+[ebp], 0
$L71890:
	mov	ecx, DWORD PTR _ctrl$[ebp]
	cmp	DWORD PTR [ecx+232], 0
	je	SHORT $L71891
	mov	edx, DWORD PTR _ctrl$[ebp]
	mov	eax, DWORD PTR [edx+232]
	mov	ecx, DWORD PTR [eax+40]
	mov	DWORD PTR -4476+[ebp], ecx
	jmp	SHORT $L71892
$L71891:
	mov	DWORD PTR -4476+[ebp], 0
$L71892:
	mov	edx, DWORD PTR -4472+[ebp]
	push	edx
	mov	eax, DWORD PTR -4476+[ebp]
	push	eax
	lea	ecx, DWORD PTR _flt$[ebp]
	push	ecx
	mov	edx, DWORD PTR _res$[ebp]
	push	edx
	lea	eax, DWORD PTR _sql$[ebp]
	push	eax
	mov	ecx, DWORD PTR _cntxt$[ebp]
	push	ecx
	call	_qry_build_flt_select
	add	esp, 24					; 00000018H
	test	eax, eax
	je	SHORT $L71659
$L71660:

; 1227 : 		STACK_ERROR;

	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 1227		; 000004cbH
	jmp	$eva_err$71658
$L71659:

; 1228 : 
; 1229 : 	/* Exec Query & read result */
; 1230 : 	if(qry_exec_filter(cntxt, &flt, sql->data)) STACK_ERROR;

	mov	eax, DWORD PTR _sql$[ebp]
	add	eax, 8
	push	eax
	lea	ecx, DWORD PTR _flt$[ebp]
	push	ecx
	mov	edx, DWORD PTR _cntxt$[ebp]
	push	edx
	call	_qry_exec_filter
	add	esp, 12					; 0000000cH
	test	eax, eax
	je	SHORT $L71661
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 1230		; 000004ceH
	jmp	$eva_err$71658
$L71661:

; 1231 : 	if(ctrl->objtbl) ctrl->objtbl->totlines = cntxt->sql_nbrows;

	mov	ecx, DWORD PTR _ctrl$[ebp]
	cmp	DWORD PTR [ecx+232], 0
	je	SHORT $L71662
	mov	edx, DWORD PTR _ctrl$[ebp]
	mov	eax, DWORD PTR [edx+232]
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	edx, DWORD PTR [ecx+29848]
	mov	DWORD PTR [eax+52], edx
$L71662:

; 1232 : 	if(cntxt->debug & DEBUG_SQL_SLOW && cntxt->sql_restime > DEBUG_SQL_SLOW_TH) err_print_filter(&cntxt->debug_msg, &flt);

	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	ecx, DWORD PTR [eax+29860]
	and	ecx, 64					; 00000040H
	test	ecx, ecx
	je	SHORT $L71663
	mov	edx, DWORD PTR _cntxt$[ebp]
	fld	QWORD PTR [edx+29840]
	fcomp	QWORD PTR __real@8@3ffbccccccccccccd000
	fnstsw	ax
	test	ah, 65					; 00000041H
	jne	SHORT $L71663
	lea	eax, DWORD PTR _flt$[ebp]
	push	eax
	mov	ecx, DWORD PTR _cntxt$[ebp]
	add	ecx, 29864				; 000074a8H
	push	ecx
	call	_err_print_filter
	add	esp, 8
$L71663:

; 1233 : 	if(res ?
; 1234 : 		sql_get_table(cntxt, res, 0) :
; 1235 : 		sql_exec_query(cntxt, "ALTER TABLE IdList ADD INDEX (IdObj)"))

	cmp	DWORD PTR _res$[ebp], 0
	je	SHORT $L71893
	push	0
	mov	edx, DWORD PTR _res$[ebp]
	push	edx
	mov	eax, DWORD PTR _cntxt$[ebp]
	push	eax
	call	_sql_get_table
	add	esp, 12					; 0000000cH
	mov	DWORD PTR -4480+[ebp], eax
	jmp	SHORT $L71894
$L71893:
	push	OFFSET FLAT:$SG71665
	mov	ecx, DWORD PTR _cntxt$[ebp]
	push	ecx
	call	_sql_exec_query
	add	esp, 8
	mov	DWORD PTR -4480+[ebp], eax
$L71894:
	cmp	DWORD PTR -4480+[ebp], 0
	je	SHORT $eva_noerr$71666

; 1236 : 			STACK_ERROR;

	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 1236		; 000004d4H
	jmp	SHORT $eva_err$71658
$eva_noerr$71666:

; 1237 : 
; 1238 : 	RETURN_OK_CLEANUP;

	push	0
	push	OFFSET FLAT:$SG71667
	push	OFFSET FLAT:$SG71668
	mov	eax, DWORD PTR _cntxt$[ebp]
	push	eax
	call	_err_clear
	add	esp, 16					; 00000010H
$eva_err$71658:
	mov	ecx, DWORD PTR _cntxt$[ebp]
	cmp	DWORD PTR [ecx+29872], 0
	je	SHORT $L71669
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	eax, DWORD PTR [edx+29900]
	push	eax
	push	OFFSET FLAT:$SG71670
	push	OFFSET FLAT:$SG71671
	mov	ecx, DWORD PTR _cntxt$[ebp]
	push	ecx
	call	_err_add_context
	add	esp, 16					; 00000010H
$L71669:
	lea	edx, DWORD PTR _flt$[ebp]
	push	edx
	call	_qry_build_free
	add	esp, 4
	mov	eax, DWORD PTR _sql$[ebp]
	push	eax
	call	_mem_free
	add	esp, 4
	mov	DWORD PTR _sql$[ebp], 0
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	edx, DWORD PTR _sql_trace$[ebp]
	mov	DWORD PTR [ecx+29852], edx
	mov	eax, DWORD PTR _cntxt$[ebp]
	xor	ecx, ecx
	cmp	DWORD PTR [eax+29872], 0
	setne	cl
	mov	eax, ecx

; 1239 : }

	pop	edi
	mov	esp, ebp
	pop	ebp
	ret	0
_ctrl_filter_idobj ENDP
_TEXT	ENDS
END
