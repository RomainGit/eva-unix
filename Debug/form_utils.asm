	TITLE	D:\Travail\ABI\EVA\V4.0\CGI\Brunix-2016\form_utils.c
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
PUBLIC	_form_free_ctrl
EXTRN	_table_free:NEAR
EXTRN	_mem_free:NEAR
EXTRN	_dyntab_free:NEAR
_TEXT	SEGMENT
_cntxt$ = 8
_beg$ = 12
_i$ = -4
_form_free_ctrl PROC NEAR

; 23   : ){

	push	ebp
	mov	ebp, esp
	push	ecx

; 24   : 	unsigned long i;
; 25   : 	if(!cntxt->form) return;

	mov	eax, DWORD PTR _cntxt$[ebp]
	cmp	DWORD PTR [eax+80], 0
	jne	SHORT $L70208
	jmp	$L70214
$L70208:

; 26   : 	for(i = beg; i <= cntxt->form->nb_ctrl; i++)

	mov	ecx, DWORD PTR _beg$[ebp]
	mov	DWORD PTR _i$[ebp], ecx
	jmp	SHORT $L70209
$L70210:
	mov	edx, DWORD PTR _i$[ebp]
	add	edx, 1
	mov	DWORD PTR _i$[ebp], edx
$L70209:
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	ecx, DWORD PTR [eax+80]
	mov	edx, DWORD PTR _i$[ebp]
	cmp	edx, DWORD PTR [ecx+4]
	ja	$L70211

; 28   : 		if(cntxt->form->ctrl[i].objtbl)

	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	ecx, DWORD PTR [eax+80]
	mov	edx, DWORD PTR _i$[ebp]
	imul	edx, 480				; 000001e0H
	mov	eax, DWORD PTR [ecx]
	cmp	DWORD PTR [eax+edx+232], 0
	je	SHORT $L70212

; 30   : 			table_free(cntxt->form->ctrl[i].objtbl);

	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	edx, DWORD PTR [ecx+80]
	mov	eax, DWORD PTR _i$[ebp]
	imul	eax, 480				; 000001e0H
	mov	ecx, DWORD PTR [edx]
	mov	edx, DWORD PTR [ecx+eax+232]
	push	edx
	call	_table_free
	add	esp, 4

; 31   : 			M_FREE(cntxt->form->ctrl[i].objtbl);

	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	ecx, DWORD PTR [eax+80]
	mov	edx, DWORD PTR _i$[ebp]
	imul	edx, 480				; 000001e0H
	mov	eax, DWORD PTR [ecx]
	mov	ecx, DWORD PTR [eax+edx+232]
	push	ecx
	call	_mem_free
	add	esp, 4
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	eax, DWORD PTR [edx+80]
	mov	ecx, DWORD PTR _i$[ebp]
	imul	ecx, 480				; 000001e0H
	mov	edx, DWORD PTR [eax]
	mov	DWORD PTR [edx+ecx+232], 0
$L70212:

; 33   : 		M_FREE(cntxt->form->ctrl[i].cginame);

	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	ecx, DWORD PTR [eax+80]
	mov	edx, DWORD PTR _i$[ebp]
	imul	edx, 480				; 000001e0H
	mov	eax, DWORD PTR [ecx]
	mov	ecx, DWORD PTR [eax+edx+40]
	push	ecx
	call	_mem_free
	add	esp, 4
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	eax, DWORD PTR [edx+80]
	mov	ecx, DWORD PTR _i$[ebp]
	imul	ecx, 480				; 000001e0H
	mov	edx, DWORD PTR [eax]
	mov	DWORD PTR [edx+ecx+40], 0

; 34   : 		M_FREE(cntxt->form->ctrl[i].errmsg);

	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	ecx, DWORD PTR [eax+80]
	mov	edx, DWORD PTR _i$[ebp]
	imul	edx, 480				; 000001e0H
	mov	eax, DWORD PTR [ecx]
	mov	ecx, DWORD PTR [eax+edx+216]
	push	ecx
	call	_mem_free
	add	esp, 4
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	eax, DWORD PTR [edx+80]
	mov	ecx, DWORD PTR _i$[ebp]
	imul	ecx, 480				; 000001e0H
	mov	edx, DWORD PTR [eax]
	mov	DWORD PTR [edx+ecx+216], 0

; 35   : 		DYNTAB_FREE(cntxt->form->ctrl[i].id);

	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	ecx, DWORD PTR [eax+80]
	mov	edx, DWORD PTR _i$[ebp]
	imul	edx, 480				; 000001e0H
	mov	eax, DWORD PTR [ecx]
	add	eax, edx
	push	eax
	call	_dyntab_free
	add	esp, 4

; 36   : 		DYNTAB_FREE(cntxt->form->ctrl[i].attr);

	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	edx, DWORD PTR [ecx+80]
	mov	eax, DWORD PTR _i$[ebp]
	imul	eax, 480				; 000001e0H
	mov	ecx, DWORD PTR [edx]
	lea	edx, DWORD PTR [ecx+eax+44]
	push	edx
	call	_dyntab_free
	add	esp, 4

; 37   : 		DYNTAB_FREE(cntxt->form->ctrl[i].val);

	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	ecx, DWORD PTR [eax+80]
	mov	edx, DWORD PTR _i$[ebp]
	imul	edx, 480				; 000001e0H
	mov	eax, DWORD PTR [ecx]
	lea	ecx, DWORD PTR [eax+edx+64]
	push	ecx
	call	_dyntab_free
	add	esp, 4

; 38   : 		DYNTAB_FREE(cntxt->form->ctrl[i].cgival);

	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	eax, DWORD PTR [edx+80]
	mov	ecx, DWORD PTR _i$[ebp]
	imul	ecx, 480				; 000001e0H
	mov	edx, DWORD PTR [eax]
	lea	eax, DWORD PTR [edx+ecx+104]
	push	eax
	call	_dyntab_free
	add	esp, 4

; 39   : 		DYNTAB_FREE(cntxt->form->ctrl[i].dbval);

	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	edx, DWORD PTR [ecx+80]
	mov	eax, DWORD PTR _i$[ebp]
	imul	eax, 480				; 000001e0H
	mov	ecx, DWORD PTR [edx]
	lea	edx, DWORD PTR [ecx+eax+84]
	push	edx
	call	_dyntab_free
	add	esp, 4

; 40   : 		DYNTAB_FREE(cntxt->form->ctrl[i].allval);

	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	ecx, DWORD PTR [eax+80]
	mov	edx, DWORD PTR _i$[ebp]
	imul	edx, 480				; 000001e0H
	mov	eax, DWORD PTR [ecx]
	lea	ecx, DWORD PTR [eax+edx+124]
	push	ecx
	call	_dyntab_free
	add	esp, 4

; 41   : 		DYNTAB_FREE(cntxt->form->ctrl[i].alldbval);

	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	eax, DWORD PTR [edx+80]
	mov	ecx, DWORD PTR _i$[ebp]
	imul	ecx, 480				; 000001e0H
	mov	edx, DWORD PTR [eax]
	lea	eax, DWORD PTR [edx+ecx+144]
	push	eax
	call	_dyntab_free
	add	esp, 4

; 42   : 		if(cntxt->form->ctrl[i].objtbl)

	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	edx, DWORD PTR [ecx+80]
	mov	eax, DWORD PTR _i$[ebp]
	imul	eax, 480				; 000001e0H
	mov	ecx, DWORD PTR [edx]
	cmp	DWORD PTR [ecx+eax+232], 0
	je	SHORT $L70213

; 44   : 			table_free(cntxt->form->ctrl[i].objtbl);

	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	eax, DWORD PTR [edx+80]
	mov	ecx, DWORD PTR _i$[ebp]
	imul	ecx, 480				; 000001e0H
	mov	edx, DWORD PTR [eax]
	mov	eax, DWORD PTR [edx+ecx+232]
	push	eax
	call	_table_free
	add	esp, 4

; 45   : 			M_FREE(cntxt->form->ctrl[i].objtbl);

	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	edx, DWORD PTR [ecx+80]
	mov	eax, DWORD PTR _i$[ebp]
	imul	eax, 480				; 000001e0H
	mov	ecx, DWORD PTR [edx]
	mov	edx, DWORD PTR [ecx+eax+232]
	push	edx
	call	_mem_free
	add	esp, 4
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	ecx, DWORD PTR [eax+80]
	mov	edx, DWORD PTR _i$[ebp]
	imul	edx, 480				; 000001e0H
	mov	eax, DWORD PTR [ecx]
	mov	DWORD PTR [eax+edx+232], 0
$L70213:

; 47   : 	}

	jmp	$L70210
$L70211:

; 48   : 	if(!beg) M_FREE(cntxt->form->ctrl);

	cmp	DWORD PTR _beg$[ebp], 0
	jne	SHORT $L70214
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	edx, DWORD PTR [ecx+80]
	mov	eax, DWORD PTR [edx]
	push	eax
	call	_mem_free
	add	esp, 4
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	edx, DWORD PTR [ecx+80]
	mov	DWORD PTR [edx], 0
$L70214:

; 49   : }

	mov	esp, ebp
	pop	ebp
	ret	0
_form_free_ctrl ENDP
_TEXT	ENDS
PUBLIC	_form_free_html
_TEXT	SEGMENT
_cntxt$ = 8
_form_free_html PROC NEAR

; 57   : ){

	push	ebp
	mov	ebp, esp

; 58   : 	if(!cntxt->form) return;

	mov	eax, DWORD PTR _cntxt$[ebp]
	cmp	DWORD PTR [eax+80], 0
	jne	SHORT $L70218
	jmp	$L70217
$L70218:

; 59   : 	M_FREE(cntxt->form->html_title); 

	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	edx, DWORD PTR [ecx+80]
	mov	eax, DWORD PTR [edx+212]
	push	eax
	call	_mem_free
	add	esp, 4
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	edx, DWORD PTR [ecx+80]
	mov	DWORD PTR [edx+212], 0

; 60   : 	M_FREE(cntxt->form->html_top); 

	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	ecx, DWORD PTR [eax+80]
	mov	edx, DWORD PTR [ecx+216]
	push	edx
	call	_mem_free
	add	esp, 4
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	ecx, DWORD PTR [eax+80]
	mov	DWORD PTR [ecx+216], 0

; 61   : 	M_FREE(cntxt->form->html_tab);	

	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	eax, DWORD PTR [edx+80]
	mov	ecx, DWORD PTR [eax+224]
	push	ecx
	call	_mem_free
	add	esp, 4
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	eax, DWORD PTR [edx+80]
	mov	DWORD PTR [eax+224], 0

; 62   : 	M_FREE(cntxt->form->html_tabs); 

	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	edx, DWORD PTR [ecx+80]
	mov	eax, DWORD PTR [edx+220]
	push	eax
	call	_mem_free
	add	esp, 4
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	edx, DWORD PTR [ecx+80]
	mov	DWORD PTR [edx+220], 0

; 63   : 	M_FREE(cntxt->form->html_menu); 

	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	ecx, DWORD PTR [eax+80]
	mov	edx, DWORD PTR [ecx+228]
	push	edx
	call	_mem_free
	add	esp, 4
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	ecx, DWORD PTR [eax+80]
	mov	DWORD PTR [ecx+228], 0

; 64   : 	cntxt->form->html = NULL; 

	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	eax, DWORD PTR [edx+80]
	mov	DWORD PTR [eax+232], 0
$L70217:

; 65   : }

	pop	ebp
	ret	0
_form_free_html ENDP
_TEXT	ENDS
PUBLIC	_form_free
_TEXT	SEGMENT
_cntxt$ = 8
_form_free PROC NEAR

; 73   : ){

	push	ebp
	mov	ebp, esp

; 74   : 	if(!cntxt->form || cntxt->form->b_dontfree) return;

	mov	eax, DWORD PTR _cntxt$[ebp]
	cmp	DWORD PTR [eax+80], 0
	je	SHORT $L70224
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	edx, DWORD PTR [ecx+80]
	cmp	DWORD PTR [edx+144], 0
	je	SHORT $L70223
$L70224:
	jmp	$L70222
$L70223:

; 75   : 	form_free_ctrl(cntxt, 0);

	push	0
	mov	eax, DWORD PTR _cntxt$[ebp]
	push	eax
	call	_form_free_ctrl
	add	esp, 8

; 76   : 	DYNTAB_FREE(cntxt->form->id_form);

	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	edx, DWORD PTR [ecx+80]
	add	edx, 12					; 0000000cH
	push	edx
	call	_dyntab_free
	add	esp, 4

; 77   : 	DYNTAB_FREE(cntxt->form->id_obj);

	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	ecx, DWORD PTR [eax+80]
	add	ecx, 32					; 00000020H
	push	ecx
	call	_dyntab_free
	add	esp, 4

; 78   : 	M_FREE(cntxt->form->tabs);

	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	eax, DWORD PTR [edx+80]
	mov	ecx, DWORD PTR [eax+108]
	push	ecx
	call	_mem_free
	add	esp, 4
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	eax, DWORD PTR [edx+80]
	mov	DWORD PTR [eax+108], 0

; 79   : 	DYNTAB_FREE(cntxt->form->objdata);

	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	edx, DWORD PTR [ecx+80]
	add	edx, 52					; 00000034H
	push	edx
	call	_dyntab_free
	add	esp, 4

; 80   : 	DYNTAB_FREE(cntxt->form->call_data);

	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	ecx, DWORD PTR [eax+80]
	add	ecx, 88					; 00000058H
	push	ecx
	call	_dyntab_free
	add	esp, 4

; 81   : 	M_FREE(cntxt->form->title);

	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	eax, DWORD PTR [edx+80]
	mov	ecx, DWORD PTR [eax+84]
	push	ecx
	call	_mem_free
	add	esp, 4
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	eax, DWORD PTR [edx+80]
	mov	DWORD PTR [eax+84], 0

; 82   : 	form_free_html(cntxt);

	mov	ecx, DWORD PTR _cntxt$[ebp]
	push	ecx
	call	_form_free_html
	add	esp, 4

; 83   : 	M_FREE(cntxt->form); 

	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	eax, DWORD PTR [edx+80]
	push	eax
	call	_mem_free
	add	esp, 4
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+80], 0
$L70222:

; 84   : }

	pop	ebp
	ret	0
_form_free ENDP
_TEXT	ENDS
PUBLIC	_form_set_homepage
EXTRN	_dyntab_sz:NEAR
EXTRN	_dyntab_cell:NEAR
EXTRN	_dyntab_copy:NEAR
EXTRN	_err_add_context:NEAR
EXTRN	_err_clear:NEAR
_DATA	SEGMENT
$SG70233 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70237 DB	'D:\Travail\ABI\EVA\V4.0\CGI\Brunix-2016\form_utils.c', 00H
	ORG $+3
$SG70238 DB	'form_set_homepage', 00H
	ORG $+2
$SG70240 DB	'D:\Travail\ABI\EVA\V4.0\CGI\Brunix-2016\form_utils.c', 00H
	ORG $+3
$SG70241 DB	'form_set_homepage', 00H
_DATA	ENDS
_TEXT	SEGMENT
_cntxt$ = 8
_form_set_homepage PROC NEAR

; 94   : ){

	push	ebp
	mov	ebp, esp

; 95   : 	DYNTAB_FREE(cntxt->id_obj);

	mov	eax, DWORD PTR _cntxt$[ebp]
	add	eax, 20					; 00000014H
	push	eax
	call	_dyntab_free
	add	esp, 4

; 96   : 	DYNTAB_FREE(cntxt->id_form);

	mov	ecx, DWORD PTR _cntxt$[ebp]
	push	ecx
	call	_dyntab_free
	add	esp, 4

; 97   : 	DYNTAB_FREE(cntxt->alt_obj);

	mov	edx, DWORD PTR _cntxt$[ebp]
	add	edx, 60					; 0000003cH
	push	edx
	call	_dyntab_free
	add	esp, 4

; 98   : 	DYNTAB_FREE(cntxt->alt_form);

	mov	eax, DWORD PTR _cntxt$[ebp]
	add	eax, 40					; 00000028H
	push	eax
	call	_dyntab_free
	add	esp, 4

; 99   : 	if(dyntab_sz(&cntxt->homepage, 0, 0))

	push	0
	push	0
	mov	ecx, DWORD PTR _cntxt$[ebp]
	add	ecx, 29548				; 0000736cH
	push	ecx
	call	_dyntab_sz
	add	esp, 12					; 0000000cH
	test	eax, eax
	je	SHORT $L70231

; 100  : 		DYNTAB_SET_CELL(&cntxt->id_form, 0, 0, &cntxt->homepage, 0, 0);

	push	0
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
	mov	eax, DWORD PTR _cntxt$[ebp]
	push	eax
	call	_dyntab_copy
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L70231
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29872], OFFSET FLAT:$SG70233
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 100		; 00000064H
	jmp	SHORT $eva_err$70234
$L70231:

; 101  : 	if(cntxt->cgi) cntxt->cgi[cntxt->cgibtn].name[0] = 0;

	mov	eax, DWORD PTR _cntxt$[ebp]
	cmp	DWORD PTR [eax+29648], 0
	je	SHORT $eva_noerr$70236
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	edx, DWORD PTR [ecx+29656]
	imul	edx, 56					; 00000038H
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	ecx, DWORD PTR [eax+29648]
	mov	edx, DWORD PTR [ecx+edx]
	mov	BYTE PTR [edx], 0
$eva_noerr$70236:

; 102  : 
; 103  : 	RETURN_OK_CLEANUP;

	push	0
	push	OFFSET FLAT:$SG70237
	push	OFFSET FLAT:$SG70238
	mov	eax, DWORD PTR _cntxt$[ebp]
	push	eax
	call	_err_clear
	add	esp, 16					; 00000010H
$eva_err$70234:
	mov	ecx, DWORD PTR _cntxt$[ebp]
	cmp	DWORD PTR [ecx+29872], 0
	je	SHORT $L70239
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	eax, DWORD PTR [edx+29900]
	push	eax
	push	OFFSET FLAT:$SG70240
	push	OFFSET FLAT:$SG70241
	mov	ecx, DWORD PTR _cntxt$[ebp]
	push	ecx
	call	_err_add_context
	add	esp, 16					; 00000010H
$L70239:
	mov	edx, DWORD PTR _cntxt$[ebp]
	xor	eax, eax
	cmp	DWORD PTR [edx+29872], 0
	setne	al

; 104  : }

	pop	ebp
	ret	0
_form_set_homepage ENDP
_TEXT	ENDS
END
